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
      ?auto_1808584 - SURFACE
      ?auto_1808585 - SURFACE
    )
    :vars
    (
      ?auto_1808586 - HOIST
      ?auto_1808587 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808586 ?auto_1808587 ) ( SURFACE-AT ?auto_1808584 ?auto_1808587 ) ( CLEAR ?auto_1808584 ) ( LIFTING ?auto_1808586 ?auto_1808585 ) ( IS-CRATE ?auto_1808585 ) ( not ( = ?auto_1808584 ?auto_1808585 ) ) )
    :subtasks
    ( ( !DROP ?auto_1808586 ?auto_1808585 ?auto_1808584 ?auto_1808587 )
      ( MAKE-1CRATE-VERIFY ?auto_1808584 ?auto_1808585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808588 - SURFACE
      ?auto_1808589 - SURFACE
    )
    :vars
    (
      ?auto_1808590 - HOIST
      ?auto_1808591 - PLACE
      ?auto_1808592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808590 ?auto_1808591 ) ( SURFACE-AT ?auto_1808588 ?auto_1808591 ) ( CLEAR ?auto_1808588 ) ( IS-CRATE ?auto_1808589 ) ( not ( = ?auto_1808588 ?auto_1808589 ) ) ( TRUCK-AT ?auto_1808592 ?auto_1808591 ) ( AVAILABLE ?auto_1808590 ) ( IN ?auto_1808589 ?auto_1808592 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1808590 ?auto_1808589 ?auto_1808592 ?auto_1808591 )
      ( MAKE-1CRATE ?auto_1808588 ?auto_1808589 )
      ( MAKE-1CRATE-VERIFY ?auto_1808588 ?auto_1808589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808593 - SURFACE
      ?auto_1808594 - SURFACE
    )
    :vars
    (
      ?auto_1808597 - HOIST
      ?auto_1808595 - PLACE
      ?auto_1808596 - TRUCK
      ?auto_1808598 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808597 ?auto_1808595 ) ( SURFACE-AT ?auto_1808593 ?auto_1808595 ) ( CLEAR ?auto_1808593 ) ( IS-CRATE ?auto_1808594 ) ( not ( = ?auto_1808593 ?auto_1808594 ) ) ( AVAILABLE ?auto_1808597 ) ( IN ?auto_1808594 ?auto_1808596 ) ( TRUCK-AT ?auto_1808596 ?auto_1808598 ) ( not ( = ?auto_1808598 ?auto_1808595 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1808596 ?auto_1808598 ?auto_1808595 )
      ( MAKE-1CRATE ?auto_1808593 ?auto_1808594 )
      ( MAKE-1CRATE-VERIFY ?auto_1808593 ?auto_1808594 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808599 - SURFACE
      ?auto_1808600 - SURFACE
    )
    :vars
    (
      ?auto_1808604 - HOIST
      ?auto_1808603 - PLACE
      ?auto_1808602 - TRUCK
      ?auto_1808601 - PLACE
      ?auto_1808605 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808604 ?auto_1808603 ) ( SURFACE-AT ?auto_1808599 ?auto_1808603 ) ( CLEAR ?auto_1808599 ) ( IS-CRATE ?auto_1808600 ) ( not ( = ?auto_1808599 ?auto_1808600 ) ) ( AVAILABLE ?auto_1808604 ) ( TRUCK-AT ?auto_1808602 ?auto_1808601 ) ( not ( = ?auto_1808601 ?auto_1808603 ) ) ( HOIST-AT ?auto_1808605 ?auto_1808601 ) ( LIFTING ?auto_1808605 ?auto_1808600 ) ( not ( = ?auto_1808604 ?auto_1808605 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1808605 ?auto_1808600 ?auto_1808602 ?auto_1808601 )
      ( MAKE-1CRATE ?auto_1808599 ?auto_1808600 )
      ( MAKE-1CRATE-VERIFY ?auto_1808599 ?auto_1808600 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808606 - SURFACE
      ?auto_1808607 - SURFACE
    )
    :vars
    (
      ?auto_1808611 - HOIST
      ?auto_1808609 - PLACE
      ?auto_1808612 - TRUCK
      ?auto_1808608 - PLACE
      ?auto_1808610 - HOIST
      ?auto_1808613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808611 ?auto_1808609 ) ( SURFACE-AT ?auto_1808606 ?auto_1808609 ) ( CLEAR ?auto_1808606 ) ( IS-CRATE ?auto_1808607 ) ( not ( = ?auto_1808606 ?auto_1808607 ) ) ( AVAILABLE ?auto_1808611 ) ( TRUCK-AT ?auto_1808612 ?auto_1808608 ) ( not ( = ?auto_1808608 ?auto_1808609 ) ) ( HOIST-AT ?auto_1808610 ?auto_1808608 ) ( not ( = ?auto_1808611 ?auto_1808610 ) ) ( AVAILABLE ?auto_1808610 ) ( SURFACE-AT ?auto_1808607 ?auto_1808608 ) ( ON ?auto_1808607 ?auto_1808613 ) ( CLEAR ?auto_1808607 ) ( not ( = ?auto_1808606 ?auto_1808613 ) ) ( not ( = ?auto_1808607 ?auto_1808613 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1808610 ?auto_1808607 ?auto_1808613 ?auto_1808608 )
      ( MAKE-1CRATE ?auto_1808606 ?auto_1808607 )
      ( MAKE-1CRATE-VERIFY ?auto_1808606 ?auto_1808607 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808614 - SURFACE
      ?auto_1808615 - SURFACE
    )
    :vars
    (
      ?auto_1808619 - HOIST
      ?auto_1808620 - PLACE
      ?auto_1808617 - PLACE
      ?auto_1808621 - HOIST
      ?auto_1808616 - SURFACE
      ?auto_1808618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808619 ?auto_1808620 ) ( SURFACE-AT ?auto_1808614 ?auto_1808620 ) ( CLEAR ?auto_1808614 ) ( IS-CRATE ?auto_1808615 ) ( not ( = ?auto_1808614 ?auto_1808615 ) ) ( AVAILABLE ?auto_1808619 ) ( not ( = ?auto_1808617 ?auto_1808620 ) ) ( HOIST-AT ?auto_1808621 ?auto_1808617 ) ( not ( = ?auto_1808619 ?auto_1808621 ) ) ( AVAILABLE ?auto_1808621 ) ( SURFACE-AT ?auto_1808615 ?auto_1808617 ) ( ON ?auto_1808615 ?auto_1808616 ) ( CLEAR ?auto_1808615 ) ( not ( = ?auto_1808614 ?auto_1808616 ) ) ( not ( = ?auto_1808615 ?auto_1808616 ) ) ( TRUCK-AT ?auto_1808618 ?auto_1808620 ) )
    :subtasks
    ( ( !DRIVE ?auto_1808618 ?auto_1808620 ?auto_1808617 )
      ( MAKE-1CRATE ?auto_1808614 ?auto_1808615 )
      ( MAKE-1CRATE-VERIFY ?auto_1808614 ?auto_1808615 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808631 - SURFACE
      ?auto_1808632 - SURFACE
      ?auto_1808633 - SURFACE
    )
    :vars
    (
      ?auto_1808635 - HOIST
      ?auto_1808634 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808635 ?auto_1808634 ) ( SURFACE-AT ?auto_1808632 ?auto_1808634 ) ( CLEAR ?auto_1808632 ) ( LIFTING ?auto_1808635 ?auto_1808633 ) ( IS-CRATE ?auto_1808633 ) ( not ( = ?auto_1808632 ?auto_1808633 ) ) ( ON ?auto_1808632 ?auto_1808631 ) ( not ( = ?auto_1808631 ?auto_1808632 ) ) ( not ( = ?auto_1808631 ?auto_1808633 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808632 ?auto_1808633 )
      ( MAKE-2CRATE-VERIFY ?auto_1808631 ?auto_1808632 ?auto_1808633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808641 - SURFACE
      ?auto_1808642 - SURFACE
      ?auto_1808643 - SURFACE
    )
    :vars
    (
      ?auto_1808644 - HOIST
      ?auto_1808646 - PLACE
      ?auto_1808645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808644 ?auto_1808646 ) ( SURFACE-AT ?auto_1808642 ?auto_1808646 ) ( CLEAR ?auto_1808642 ) ( IS-CRATE ?auto_1808643 ) ( not ( = ?auto_1808642 ?auto_1808643 ) ) ( TRUCK-AT ?auto_1808645 ?auto_1808646 ) ( AVAILABLE ?auto_1808644 ) ( IN ?auto_1808643 ?auto_1808645 ) ( ON ?auto_1808642 ?auto_1808641 ) ( not ( = ?auto_1808641 ?auto_1808642 ) ) ( not ( = ?auto_1808641 ?auto_1808643 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808642 ?auto_1808643 )
      ( MAKE-2CRATE-VERIFY ?auto_1808641 ?auto_1808642 ?auto_1808643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808647 - SURFACE
      ?auto_1808648 - SURFACE
    )
    :vars
    (
      ?auto_1808651 - HOIST
      ?auto_1808652 - PLACE
      ?auto_1808649 - TRUCK
      ?auto_1808650 - SURFACE
      ?auto_1808653 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808651 ?auto_1808652 ) ( SURFACE-AT ?auto_1808647 ?auto_1808652 ) ( CLEAR ?auto_1808647 ) ( IS-CRATE ?auto_1808648 ) ( not ( = ?auto_1808647 ?auto_1808648 ) ) ( AVAILABLE ?auto_1808651 ) ( IN ?auto_1808648 ?auto_1808649 ) ( ON ?auto_1808647 ?auto_1808650 ) ( not ( = ?auto_1808650 ?auto_1808647 ) ) ( not ( = ?auto_1808650 ?auto_1808648 ) ) ( TRUCK-AT ?auto_1808649 ?auto_1808653 ) ( not ( = ?auto_1808653 ?auto_1808652 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1808649 ?auto_1808653 ?auto_1808652 )
      ( MAKE-2CRATE ?auto_1808650 ?auto_1808647 ?auto_1808648 )
      ( MAKE-1CRATE-VERIFY ?auto_1808647 ?auto_1808648 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808654 - SURFACE
      ?auto_1808655 - SURFACE
      ?auto_1808656 - SURFACE
    )
    :vars
    (
      ?auto_1808660 - HOIST
      ?auto_1808658 - PLACE
      ?auto_1808657 - TRUCK
      ?auto_1808659 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808660 ?auto_1808658 ) ( SURFACE-AT ?auto_1808655 ?auto_1808658 ) ( CLEAR ?auto_1808655 ) ( IS-CRATE ?auto_1808656 ) ( not ( = ?auto_1808655 ?auto_1808656 ) ) ( AVAILABLE ?auto_1808660 ) ( IN ?auto_1808656 ?auto_1808657 ) ( ON ?auto_1808655 ?auto_1808654 ) ( not ( = ?auto_1808654 ?auto_1808655 ) ) ( not ( = ?auto_1808654 ?auto_1808656 ) ) ( TRUCK-AT ?auto_1808657 ?auto_1808659 ) ( not ( = ?auto_1808659 ?auto_1808658 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808655 ?auto_1808656 )
      ( MAKE-2CRATE-VERIFY ?auto_1808654 ?auto_1808655 ?auto_1808656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808661 - SURFACE
      ?auto_1808662 - SURFACE
    )
    :vars
    (
      ?auto_1808666 - HOIST
      ?auto_1808664 - PLACE
      ?auto_1808667 - SURFACE
      ?auto_1808663 - TRUCK
      ?auto_1808665 - PLACE
      ?auto_1808668 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808666 ?auto_1808664 ) ( SURFACE-AT ?auto_1808661 ?auto_1808664 ) ( CLEAR ?auto_1808661 ) ( IS-CRATE ?auto_1808662 ) ( not ( = ?auto_1808661 ?auto_1808662 ) ) ( AVAILABLE ?auto_1808666 ) ( ON ?auto_1808661 ?auto_1808667 ) ( not ( = ?auto_1808667 ?auto_1808661 ) ) ( not ( = ?auto_1808667 ?auto_1808662 ) ) ( TRUCK-AT ?auto_1808663 ?auto_1808665 ) ( not ( = ?auto_1808665 ?auto_1808664 ) ) ( HOIST-AT ?auto_1808668 ?auto_1808665 ) ( LIFTING ?auto_1808668 ?auto_1808662 ) ( not ( = ?auto_1808666 ?auto_1808668 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1808668 ?auto_1808662 ?auto_1808663 ?auto_1808665 )
      ( MAKE-2CRATE ?auto_1808667 ?auto_1808661 ?auto_1808662 )
      ( MAKE-1CRATE-VERIFY ?auto_1808661 ?auto_1808662 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808669 - SURFACE
      ?auto_1808670 - SURFACE
      ?auto_1808671 - SURFACE
    )
    :vars
    (
      ?auto_1808672 - HOIST
      ?auto_1808675 - PLACE
      ?auto_1808674 - TRUCK
      ?auto_1808676 - PLACE
      ?auto_1808673 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808672 ?auto_1808675 ) ( SURFACE-AT ?auto_1808670 ?auto_1808675 ) ( CLEAR ?auto_1808670 ) ( IS-CRATE ?auto_1808671 ) ( not ( = ?auto_1808670 ?auto_1808671 ) ) ( AVAILABLE ?auto_1808672 ) ( ON ?auto_1808670 ?auto_1808669 ) ( not ( = ?auto_1808669 ?auto_1808670 ) ) ( not ( = ?auto_1808669 ?auto_1808671 ) ) ( TRUCK-AT ?auto_1808674 ?auto_1808676 ) ( not ( = ?auto_1808676 ?auto_1808675 ) ) ( HOIST-AT ?auto_1808673 ?auto_1808676 ) ( LIFTING ?auto_1808673 ?auto_1808671 ) ( not ( = ?auto_1808672 ?auto_1808673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808670 ?auto_1808671 )
      ( MAKE-2CRATE-VERIFY ?auto_1808669 ?auto_1808670 ?auto_1808671 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808677 - SURFACE
      ?auto_1808678 - SURFACE
    )
    :vars
    (
      ?auto_1808679 - HOIST
      ?auto_1808684 - PLACE
      ?auto_1808683 - SURFACE
      ?auto_1808682 - TRUCK
      ?auto_1808680 - PLACE
      ?auto_1808681 - HOIST
      ?auto_1808685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808679 ?auto_1808684 ) ( SURFACE-AT ?auto_1808677 ?auto_1808684 ) ( CLEAR ?auto_1808677 ) ( IS-CRATE ?auto_1808678 ) ( not ( = ?auto_1808677 ?auto_1808678 ) ) ( AVAILABLE ?auto_1808679 ) ( ON ?auto_1808677 ?auto_1808683 ) ( not ( = ?auto_1808683 ?auto_1808677 ) ) ( not ( = ?auto_1808683 ?auto_1808678 ) ) ( TRUCK-AT ?auto_1808682 ?auto_1808680 ) ( not ( = ?auto_1808680 ?auto_1808684 ) ) ( HOIST-AT ?auto_1808681 ?auto_1808680 ) ( not ( = ?auto_1808679 ?auto_1808681 ) ) ( AVAILABLE ?auto_1808681 ) ( SURFACE-AT ?auto_1808678 ?auto_1808680 ) ( ON ?auto_1808678 ?auto_1808685 ) ( CLEAR ?auto_1808678 ) ( not ( = ?auto_1808677 ?auto_1808685 ) ) ( not ( = ?auto_1808678 ?auto_1808685 ) ) ( not ( = ?auto_1808683 ?auto_1808685 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1808681 ?auto_1808678 ?auto_1808685 ?auto_1808680 )
      ( MAKE-2CRATE ?auto_1808683 ?auto_1808677 ?auto_1808678 )
      ( MAKE-1CRATE-VERIFY ?auto_1808677 ?auto_1808678 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808686 - SURFACE
      ?auto_1808687 - SURFACE
      ?auto_1808688 - SURFACE
    )
    :vars
    (
      ?auto_1808694 - HOIST
      ?auto_1808689 - PLACE
      ?auto_1808691 - TRUCK
      ?auto_1808690 - PLACE
      ?auto_1808692 - HOIST
      ?auto_1808693 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808694 ?auto_1808689 ) ( SURFACE-AT ?auto_1808687 ?auto_1808689 ) ( CLEAR ?auto_1808687 ) ( IS-CRATE ?auto_1808688 ) ( not ( = ?auto_1808687 ?auto_1808688 ) ) ( AVAILABLE ?auto_1808694 ) ( ON ?auto_1808687 ?auto_1808686 ) ( not ( = ?auto_1808686 ?auto_1808687 ) ) ( not ( = ?auto_1808686 ?auto_1808688 ) ) ( TRUCK-AT ?auto_1808691 ?auto_1808690 ) ( not ( = ?auto_1808690 ?auto_1808689 ) ) ( HOIST-AT ?auto_1808692 ?auto_1808690 ) ( not ( = ?auto_1808694 ?auto_1808692 ) ) ( AVAILABLE ?auto_1808692 ) ( SURFACE-AT ?auto_1808688 ?auto_1808690 ) ( ON ?auto_1808688 ?auto_1808693 ) ( CLEAR ?auto_1808688 ) ( not ( = ?auto_1808687 ?auto_1808693 ) ) ( not ( = ?auto_1808688 ?auto_1808693 ) ) ( not ( = ?auto_1808686 ?auto_1808693 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808687 ?auto_1808688 )
      ( MAKE-2CRATE-VERIFY ?auto_1808686 ?auto_1808687 ?auto_1808688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808695 - SURFACE
      ?auto_1808696 - SURFACE
    )
    :vars
    (
      ?auto_1808697 - HOIST
      ?auto_1808701 - PLACE
      ?auto_1808699 - SURFACE
      ?auto_1808700 - PLACE
      ?auto_1808698 - HOIST
      ?auto_1808702 - SURFACE
      ?auto_1808703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808697 ?auto_1808701 ) ( SURFACE-AT ?auto_1808695 ?auto_1808701 ) ( CLEAR ?auto_1808695 ) ( IS-CRATE ?auto_1808696 ) ( not ( = ?auto_1808695 ?auto_1808696 ) ) ( AVAILABLE ?auto_1808697 ) ( ON ?auto_1808695 ?auto_1808699 ) ( not ( = ?auto_1808699 ?auto_1808695 ) ) ( not ( = ?auto_1808699 ?auto_1808696 ) ) ( not ( = ?auto_1808700 ?auto_1808701 ) ) ( HOIST-AT ?auto_1808698 ?auto_1808700 ) ( not ( = ?auto_1808697 ?auto_1808698 ) ) ( AVAILABLE ?auto_1808698 ) ( SURFACE-AT ?auto_1808696 ?auto_1808700 ) ( ON ?auto_1808696 ?auto_1808702 ) ( CLEAR ?auto_1808696 ) ( not ( = ?auto_1808695 ?auto_1808702 ) ) ( not ( = ?auto_1808696 ?auto_1808702 ) ) ( not ( = ?auto_1808699 ?auto_1808702 ) ) ( TRUCK-AT ?auto_1808703 ?auto_1808701 ) )
    :subtasks
    ( ( !DRIVE ?auto_1808703 ?auto_1808701 ?auto_1808700 )
      ( MAKE-2CRATE ?auto_1808699 ?auto_1808695 ?auto_1808696 )
      ( MAKE-1CRATE-VERIFY ?auto_1808695 ?auto_1808696 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808704 - SURFACE
      ?auto_1808705 - SURFACE
      ?auto_1808706 - SURFACE
    )
    :vars
    (
      ?auto_1808709 - HOIST
      ?auto_1808707 - PLACE
      ?auto_1808711 - PLACE
      ?auto_1808708 - HOIST
      ?auto_1808710 - SURFACE
      ?auto_1808712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808709 ?auto_1808707 ) ( SURFACE-AT ?auto_1808705 ?auto_1808707 ) ( CLEAR ?auto_1808705 ) ( IS-CRATE ?auto_1808706 ) ( not ( = ?auto_1808705 ?auto_1808706 ) ) ( AVAILABLE ?auto_1808709 ) ( ON ?auto_1808705 ?auto_1808704 ) ( not ( = ?auto_1808704 ?auto_1808705 ) ) ( not ( = ?auto_1808704 ?auto_1808706 ) ) ( not ( = ?auto_1808711 ?auto_1808707 ) ) ( HOIST-AT ?auto_1808708 ?auto_1808711 ) ( not ( = ?auto_1808709 ?auto_1808708 ) ) ( AVAILABLE ?auto_1808708 ) ( SURFACE-AT ?auto_1808706 ?auto_1808711 ) ( ON ?auto_1808706 ?auto_1808710 ) ( CLEAR ?auto_1808706 ) ( not ( = ?auto_1808705 ?auto_1808710 ) ) ( not ( = ?auto_1808706 ?auto_1808710 ) ) ( not ( = ?auto_1808704 ?auto_1808710 ) ) ( TRUCK-AT ?auto_1808712 ?auto_1808707 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808705 ?auto_1808706 )
      ( MAKE-2CRATE-VERIFY ?auto_1808704 ?auto_1808705 ?auto_1808706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808713 - SURFACE
      ?auto_1808714 - SURFACE
    )
    :vars
    (
      ?auto_1808720 - HOIST
      ?auto_1808716 - PLACE
      ?auto_1808717 - SURFACE
      ?auto_1808719 - PLACE
      ?auto_1808715 - HOIST
      ?auto_1808721 - SURFACE
      ?auto_1808718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808720 ?auto_1808716 ) ( IS-CRATE ?auto_1808714 ) ( not ( = ?auto_1808713 ?auto_1808714 ) ) ( not ( = ?auto_1808717 ?auto_1808713 ) ) ( not ( = ?auto_1808717 ?auto_1808714 ) ) ( not ( = ?auto_1808719 ?auto_1808716 ) ) ( HOIST-AT ?auto_1808715 ?auto_1808719 ) ( not ( = ?auto_1808720 ?auto_1808715 ) ) ( AVAILABLE ?auto_1808715 ) ( SURFACE-AT ?auto_1808714 ?auto_1808719 ) ( ON ?auto_1808714 ?auto_1808721 ) ( CLEAR ?auto_1808714 ) ( not ( = ?auto_1808713 ?auto_1808721 ) ) ( not ( = ?auto_1808714 ?auto_1808721 ) ) ( not ( = ?auto_1808717 ?auto_1808721 ) ) ( TRUCK-AT ?auto_1808718 ?auto_1808716 ) ( SURFACE-AT ?auto_1808717 ?auto_1808716 ) ( CLEAR ?auto_1808717 ) ( LIFTING ?auto_1808720 ?auto_1808713 ) ( IS-CRATE ?auto_1808713 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808717 ?auto_1808713 )
      ( MAKE-2CRATE ?auto_1808717 ?auto_1808713 ?auto_1808714 )
      ( MAKE-1CRATE-VERIFY ?auto_1808713 ?auto_1808714 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808722 - SURFACE
      ?auto_1808723 - SURFACE
      ?auto_1808724 - SURFACE
    )
    :vars
    (
      ?auto_1808725 - HOIST
      ?auto_1808729 - PLACE
      ?auto_1808726 - PLACE
      ?auto_1808727 - HOIST
      ?auto_1808728 - SURFACE
      ?auto_1808730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808725 ?auto_1808729 ) ( IS-CRATE ?auto_1808724 ) ( not ( = ?auto_1808723 ?auto_1808724 ) ) ( not ( = ?auto_1808722 ?auto_1808723 ) ) ( not ( = ?auto_1808722 ?auto_1808724 ) ) ( not ( = ?auto_1808726 ?auto_1808729 ) ) ( HOIST-AT ?auto_1808727 ?auto_1808726 ) ( not ( = ?auto_1808725 ?auto_1808727 ) ) ( AVAILABLE ?auto_1808727 ) ( SURFACE-AT ?auto_1808724 ?auto_1808726 ) ( ON ?auto_1808724 ?auto_1808728 ) ( CLEAR ?auto_1808724 ) ( not ( = ?auto_1808723 ?auto_1808728 ) ) ( not ( = ?auto_1808724 ?auto_1808728 ) ) ( not ( = ?auto_1808722 ?auto_1808728 ) ) ( TRUCK-AT ?auto_1808730 ?auto_1808729 ) ( SURFACE-AT ?auto_1808722 ?auto_1808729 ) ( CLEAR ?auto_1808722 ) ( LIFTING ?auto_1808725 ?auto_1808723 ) ( IS-CRATE ?auto_1808723 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808723 ?auto_1808724 )
      ( MAKE-2CRATE-VERIFY ?auto_1808722 ?auto_1808723 ?auto_1808724 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808731 - SURFACE
      ?auto_1808732 - SURFACE
    )
    :vars
    (
      ?auto_1808737 - HOIST
      ?auto_1808736 - PLACE
      ?auto_1808738 - SURFACE
      ?auto_1808735 - PLACE
      ?auto_1808734 - HOIST
      ?auto_1808739 - SURFACE
      ?auto_1808733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808737 ?auto_1808736 ) ( IS-CRATE ?auto_1808732 ) ( not ( = ?auto_1808731 ?auto_1808732 ) ) ( not ( = ?auto_1808738 ?auto_1808731 ) ) ( not ( = ?auto_1808738 ?auto_1808732 ) ) ( not ( = ?auto_1808735 ?auto_1808736 ) ) ( HOIST-AT ?auto_1808734 ?auto_1808735 ) ( not ( = ?auto_1808737 ?auto_1808734 ) ) ( AVAILABLE ?auto_1808734 ) ( SURFACE-AT ?auto_1808732 ?auto_1808735 ) ( ON ?auto_1808732 ?auto_1808739 ) ( CLEAR ?auto_1808732 ) ( not ( = ?auto_1808731 ?auto_1808739 ) ) ( not ( = ?auto_1808732 ?auto_1808739 ) ) ( not ( = ?auto_1808738 ?auto_1808739 ) ) ( TRUCK-AT ?auto_1808733 ?auto_1808736 ) ( SURFACE-AT ?auto_1808738 ?auto_1808736 ) ( CLEAR ?auto_1808738 ) ( IS-CRATE ?auto_1808731 ) ( AVAILABLE ?auto_1808737 ) ( IN ?auto_1808731 ?auto_1808733 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1808737 ?auto_1808731 ?auto_1808733 ?auto_1808736 )
      ( MAKE-2CRATE ?auto_1808738 ?auto_1808731 ?auto_1808732 )
      ( MAKE-1CRATE-VERIFY ?auto_1808731 ?auto_1808732 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1808740 - SURFACE
      ?auto_1808741 - SURFACE
      ?auto_1808742 - SURFACE
    )
    :vars
    (
      ?auto_1808745 - HOIST
      ?auto_1808744 - PLACE
      ?auto_1808747 - PLACE
      ?auto_1808743 - HOIST
      ?auto_1808746 - SURFACE
      ?auto_1808748 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808745 ?auto_1808744 ) ( IS-CRATE ?auto_1808742 ) ( not ( = ?auto_1808741 ?auto_1808742 ) ) ( not ( = ?auto_1808740 ?auto_1808741 ) ) ( not ( = ?auto_1808740 ?auto_1808742 ) ) ( not ( = ?auto_1808747 ?auto_1808744 ) ) ( HOIST-AT ?auto_1808743 ?auto_1808747 ) ( not ( = ?auto_1808745 ?auto_1808743 ) ) ( AVAILABLE ?auto_1808743 ) ( SURFACE-AT ?auto_1808742 ?auto_1808747 ) ( ON ?auto_1808742 ?auto_1808746 ) ( CLEAR ?auto_1808742 ) ( not ( = ?auto_1808741 ?auto_1808746 ) ) ( not ( = ?auto_1808742 ?auto_1808746 ) ) ( not ( = ?auto_1808740 ?auto_1808746 ) ) ( TRUCK-AT ?auto_1808748 ?auto_1808744 ) ( SURFACE-AT ?auto_1808740 ?auto_1808744 ) ( CLEAR ?auto_1808740 ) ( IS-CRATE ?auto_1808741 ) ( AVAILABLE ?auto_1808745 ) ( IN ?auto_1808741 ?auto_1808748 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808741 ?auto_1808742 )
      ( MAKE-2CRATE-VERIFY ?auto_1808740 ?auto_1808741 ?auto_1808742 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1808785 - SURFACE
      ?auto_1808786 - SURFACE
    )
    :vars
    (
      ?auto_1808787 - HOIST
      ?auto_1808789 - PLACE
      ?auto_1808788 - SURFACE
      ?auto_1808792 - PLACE
      ?auto_1808790 - HOIST
      ?auto_1808791 - SURFACE
      ?auto_1808793 - TRUCK
      ?auto_1808794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808787 ?auto_1808789 ) ( SURFACE-AT ?auto_1808785 ?auto_1808789 ) ( CLEAR ?auto_1808785 ) ( IS-CRATE ?auto_1808786 ) ( not ( = ?auto_1808785 ?auto_1808786 ) ) ( AVAILABLE ?auto_1808787 ) ( ON ?auto_1808785 ?auto_1808788 ) ( not ( = ?auto_1808788 ?auto_1808785 ) ) ( not ( = ?auto_1808788 ?auto_1808786 ) ) ( not ( = ?auto_1808792 ?auto_1808789 ) ) ( HOIST-AT ?auto_1808790 ?auto_1808792 ) ( not ( = ?auto_1808787 ?auto_1808790 ) ) ( AVAILABLE ?auto_1808790 ) ( SURFACE-AT ?auto_1808786 ?auto_1808792 ) ( ON ?auto_1808786 ?auto_1808791 ) ( CLEAR ?auto_1808786 ) ( not ( = ?auto_1808785 ?auto_1808791 ) ) ( not ( = ?auto_1808786 ?auto_1808791 ) ) ( not ( = ?auto_1808788 ?auto_1808791 ) ) ( TRUCK-AT ?auto_1808793 ?auto_1808794 ) ( not ( = ?auto_1808794 ?auto_1808789 ) ) ( not ( = ?auto_1808792 ?auto_1808794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1808793 ?auto_1808794 ?auto_1808789 )
      ( MAKE-1CRATE ?auto_1808785 ?auto_1808786 )
      ( MAKE-1CRATE-VERIFY ?auto_1808785 ?auto_1808786 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808824 - SURFACE
      ?auto_1808825 - SURFACE
      ?auto_1808826 - SURFACE
      ?auto_1808827 - SURFACE
    )
    :vars
    (
      ?auto_1808829 - HOIST
      ?auto_1808828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808829 ?auto_1808828 ) ( SURFACE-AT ?auto_1808826 ?auto_1808828 ) ( CLEAR ?auto_1808826 ) ( LIFTING ?auto_1808829 ?auto_1808827 ) ( IS-CRATE ?auto_1808827 ) ( not ( = ?auto_1808826 ?auto_1808827 ) ) ( ON ?auto_1808825 ?auto_1808824 ) ( ON ?auto_1808826 ?auto_1808825 ) ( not ( = ?auto_1808824 ?auto_1808825 ) ) ( not ( = ?auto_1808824 ?auto_1808826 ) ) ( not ( = ?auto_1808824 ?auto_1808827 ) ) ( not ( = ?auto_1808825 ?auto_1808826 ) ) ( not ( = ?auto_1808825 ?auto_1808827 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1808826 ?auto_1808827 )
      ( MAKE-3CRATE-VERIFY ?auto_1808824 ?auto_1808825 ?auto_1808826 ?auto_1808827 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808841 - SURFACE
      ?auto_1808842 - SURFACE
      ?auto_1808843 - SURFACE
      ?auto_1808844 - SURFACE
    )
    :vars
    (
      ?auto_1808846 - HOIST
      ?auto_1808845 - PLACE
      ?auto_1808847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808846 ?auto_1808845 ) ( SURFACE-AT ?auto_1808843 ?auto_1808845 ) ( CLEAR ?auto_1808843 ) ( IS-CRATE ?auto_1808844 ) ( not ( = ?auto_1808843 ?auto_1808844 ) ) ( TRUCK-AT ?auto_1808847 ?auto_1808845 ) ( AVAILABLE ?auto_1808846 ) ( IN ?auto_1808844 ?auto_1808847 ) ( ON ?auto_1808843 ?auto_1808842 ) ( not ( = ?auto_1808842 ?auto_1808843 ) ) ( not ( = ?auto_1808842 ?auto_1808844 ) ) ( ON ?auto_1808842 ?auto_1808841 ) ( not ( = ?auto_1808841 ?auto_1808842 ) ) ( not ( = ?auto_1808841 ?auto_1808843 ) ) ( not ( = ?auto_1808841 ?auto_1808844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1808842 ?auto_1808843 ?auto_1808844 )
      ( MAKE-3CRATE-VERIFY ?auto_1808841 ?auto_1808842 ?auto_1808843 ?auto_1808844 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808862 - SURFACE
      ?auto_1808863 - SURFACE
      ?auto_1808864 - SURFACE
      ?auto_1808865 - SURFACE
    )
    :vars
    (
      ?auto_1808869 - HOIST
      ?auto_1808868 - PLACE
      ?auto_1808867 - TRUCK
      ?auto_1808866 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808869 ?auto_1808868 ) ( SURFACE-AT ?auto_1808864 ?auto_1808868 ) ( CLEAR ?auto_1808864 ) ( IS-CRATE ?auto_1808865 ) ( not ( = ?auto_1808864 ?auto_1808865 ) ) ( AVAILABLE ?auto_1808869 ) ( IN ?auto_1808865 ?auto_1808867 ) ( ON ?auto_1808864 ?auto_1808863 ) ( not ( = ?auto_1808863 ?auto_1808864 ) ) ( not ( = ?auto_1808863 ?auto_1808865 ) ) ( TRUCK-AT ?auto_1808867 ?auto_1808866 ) ( not ( = ?auto_1808866 ?auto_1808868 ) ) ( ON ?auto_1808863 ?auto_1808862 ) ( not ( = ?auto_1808862 ?auto_1808863 ) ) ( not ( = ?auto_1808862 ?auto_1808864 ) ) ( not ( = ?auto_1808862 ?auto_1808865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1808863 ?auto_1808864 ?auto_1808865 )
      ( MAKE-3CRATE-VERIFY ?auto_1808862 ?auto_1808863 ?auto_1808864 ?auto_1808865 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808886 - SURFACE
      ?auto_1808887 - SURFACE
      ?auto_1808888 - SURFACE
      ?auto_1808889 - SURFACE
    )
    :vars
    (
      ?auto_1808890 - HOIST
      ?auto_1808894 - PLACE
      ?auto_1808892 - TRUCK
      ?auto_1808893 - PLACE
      ?auto_1808891 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808890 ?auto_1808894 ) ( SURFACE-AT ?auto_1808888 ?auto_1808894 ) ( CLEAR ?auto_1808888 ) ( IS-CRATE ?auto_1808889 ) ( not ( = ?auto_1808888 ?auto_1808889 ) ) ( AVAILABLE ?auto_1808890 ) ( ON ?auto_1808888 ?auto_1808887 ) ( not ( = ?auto_1808887 ?auto_1808888 ) ) ( not ( = ?auto_1808887 ?auto_1808889 ) ) ( TRUCK-AT ?auto_1808892 ?auto_1808893 ) ( not ( = ?auto_1808893 ?auto_1808894 ) ) ( HOIST-AT ?auto_1808891 ?auto_1808893 ) ( LIFTING ?auto_1808891 ?auto_1808889 ) ( not ( = ?auto_1808890 ?auto_1808891 ) ) ( ON ?auto_1808887 ?auto_1808886 ) ( not ( = ?auto_1808886 ?auto_1808887 ) ) ( not ( = ?auto_1808886 ?auto_1808888 ) ) ( not ( = ?auto_1808886 ?auto_1808889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1808887 ?auto_1808888 ?auto_1808889 )
      ( MAKE-3CRATE-VERIFY ?auto_1808886 ?auto_1808887 ?auto_1808888 ?auto_1808889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808913 - SURFACE
      ?auto_1808914 - SURFACE
      ?auto_1808915 - SURFACE
      ?auto_1808916 - SURFACE
    )
    :vars
    (
      ?auto_1808917 - HOIST
      ?auto_1808922 - PLACE
      ?auto_1808920 - TRUCK
      ?auto_1808918 - PLACE
      ?auto_1808921 - HOIST
      ?auto_1808919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808917 ?auto_1808922 ) ( SURFACE-AT ?auto_1808915 ?auto_1808922 ) ( CLEAR ?auto_1808915 ) ( IS-CRATE ?auto_1808916 ) ( not ( = ?auto_1808915 ?auto_1808916 ) ) ( AVAILABLE ?auto_1808917 ) ( ON ?auto_1808915 ?auto_1808914 ) ( not ( = ?auto_1808914 ?auto_1808915 ) ) ( not ( = ?auto_1808914 ?auto_1808916 ) ) ( TRUCK-AT ?auto_1808920 ?auto_1808918 ) ( not ( = ?auto_1808918 ?auto_1808922 ) ) ( HOIST-AT ?auto_1808921 ?auto_1808918 ) ( not ( = ?auto_1808917 ?auto_1808921 ) ) ( AVAILABLE ?auto_1808921 ) ( SURFACE-AT ?auto_1808916 ?auto_1808918 ) ( ON ?auto_1808916 ?auto_1808919 ) ( CLEAR ?auto_1808916 ) ( not ( = ?auto_1808915 ?auto_1808919 ) ) ( not ( = ?auto_1808916 ?auto_1808919 ) ) ( not ( = ?auto_1808914 ?auto_1808919 ) ) ( ON ?auto_1808914 ?auto_1808913 ) ( not ( = ?auto_1808913 ?auto_1808914 ) ) ( not ( = ?auto_1808913 ?auto_1808915 ) ) ( not ( = ?auto_1808913 ?auto_1808916 ) ) ( not ( = ?auto_1808913 ?auto_1808919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1808914 ?auto_1808915 ?auto_1808916 )
      ( MAKE-3CRATE-VERIFY ?auto_1808913 ?auto_1808914 ?auto_1808915 ?auto_1808916 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808941 - SURFACE
      ?auto_1808942 - SURFACE
      ?auto_1808943 - SURFACE
      ?auto_1808944 - SURFACE
    )
    :vars
    (
      ?auto_1808946 - HOIST
      ?auto_1808950 - PLACE
      ?auto_1808945 - PLACE
      ?auto_1808947 - HOIST
      ?auto_1808949 - SURFACE
      ?auto_1808948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808946 ?auto_1808950 ) ( SURFACE-AT ?auto_1808943 ?auto_1808950 ) ( CLEAR ?auto_1808943 ) ( IS-CRATE ?auto_1808944 ) ( not ( = ?auto_1808943 ?auto_1808944 ) ) ( AVAILABLE ?auto_1808946 ) ( ON ?auto_1808943 ?auto_1808942 ) ( not ( = ?auto_1808942 ?auto_1808943 ) ) ( not ( = ?auto_1808942 ?auto_1808944 ) ) ( not ( = ?auto_1808945 ?auto_1808950 ) ) ( HOIST-AT ?auto_1808947 ?auto_1808945 ) ( not ( = ?auto_1808946 ?auto_1808947 ) ) ( AVAILABLE ?auto_1808947 ) ( SURFACE-AT ?auto_1808944 ?auto_1808945 ) ( ON ?auto_1808944 ?auto_1808949 ) ( CLEAR ?auto_1808944 ) ( not ( = ?auto_1808943 ?auto_1808949 ) ) ( not ( = ?auto_1808944 ?auto_1808949 ) ) ( not ( = ?auto_1808942 ?auto_1808949 ) ) ( TRUCK-AT ?auto_1808948 ?auto_1808950 ) ( ON ?auto_1808942 ?auto_1808941 ) ( not ( = ?auto_1808941 ?auto_1808942 ) ) ( not ( = ?auto_1808941 ?auto_1808943 ) ) ( not ( = ?auto_1808941 ?auto_1808944 ) ) ( not ( = ?auto_1808941 ?auto_1808949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1808942 ?auto_1808943 ?auto_1808944 )
      ( MAKE-3CRATE-VERIFY ?auto_1808941 ?auto_1808942 ?auto_1808943 ?auto_1808944 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808969 - SURFACE
      ?auto_1808970 - SURFACE
      ?auto_1808971 - SURFACE
      ?auto_1808972 - SURFACE
    )
    :vars
    (
      ?auto_1808977 - HOIST
      ?auto_1808978 - PLACE
      ?auto_1808973 - PLACE
      ?auto_1808976 - HOIST
      ?auto_1808975 - SURFACE
      ?auto_1808974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1808977 ?auto_1808978 ) ( IS-CRATE ?auto_1808972 ) ( not ( = ?auto_1808971 ?auto_1808972 ) ) ( not ( = ?auto_1808970 ?auto_1808971 ) ) ( not ( = ?auto_1808970 ?auto_1808972 ) ) ( not ( = ?auto_1808973 ?auto_1808978 ) ) ( HOIST-AT ?auto_1808976 ?auto_1808973 ) ( not ( = ?auto_1808977 ?auto_1808976 ) ) ( AVAILABLE ?auto_1808976 ) ( SURFACE-AT ?auto_1808972 ?auto_1808973 ) ( ON ?auto_1808972 ?auto_1808975 ) ( CLEAR ?auto_1808972 ) ( not ( = ?auto_1808971 ?auto_1808975 ) ) ( not ( = ?auto_1808972 ?auto_1808975 ) ) ( not ( = ?auto_1808970 ?auto_1808975 ) ) ( TRUCK-AT ?auto_1808974 ?auto_1808978 ) ( SURFACE-AT ?auto_1808970 ?auto_1808978 ) ( CLEAR ?auto_1808970 ) ( LIFTING ?auto_1808977 ?auto_1808971 ) ( IS-CRATE ?auto_1808971 ) ( ON ?auto_1808970 ?auto_1808969 ) ( not ( = ?auto_1808969 ?auto_1808970 ) ) ( not ( = ?auto_1808969 ?auto_1808971 ) ) ( not ( = ?auto_1808969 ?auto_1808972 ) ) ( not ( = ?auto_1808969 ?auto_1808975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1808970 ?auto_1808971 ?auto_1808972 )
      ( MAKE-3CRATE-VERIFY ?auto_1808969 ?auto_1808970 ?auto_1808971 ?auto_1808972 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1808997 - SURFACE
      ?auto_1808998 - SURFACE
      ?auto_1808999 - SURFACE
      ?auto_1809000 - SURFACE
    )
    :vars
    (
      ?auto_1809003 - HOIST
      ?auto_1809002 - PLACE
      ?auto_1809001 - PLACE
      ?auto_1809005 - HOIST
      ?auto_1809004 - SURFACE
      ?auto_1809006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809003 ?auto_1809002 ) ( IS-CRATE ?auto_1809000 ) ( not ( = ?auto_1808999 ?auto_1809000 ) ) ( not ( = ?auto_1808998 ?auto_1808999 ) ) ( not ( = ?auto_1808998 ?auto_1809000 ) ) ( not ( = ?auto_1809001 ?auto_1809002 ) ) ( HOIST-AT ?auto_1809005 ?auto_1809001 ) ( not ( = ?auto_1809003 ?auto_1809005 ) ) ( AVAILABLE ?auto_1809005 ) ( SURFACE-AT ?auto_1809000 ?auto_1809001 ) ( ON ?auto_1809000 ?auto_1809004 ) ( CLEAR ?auto_1809000 ) ( not ( = ?auto_1808999 ?auto_1809004 ) ) ( not ( = ?auto_1809000 ?auto_1809004 ) ) ( not ( = ?auto_1808998 ?auto_1809004 ) ) ( TRUCK-AT ?auto_1809006 ?auto_1809002 ) ( SURFACE-AT ?auto_1808998 ?auto_1809002 ) ( CLEAR ?auto_1808998 ) ( IS-CRATE ?auto_1808999 ) ( AVAILABLE ?auto_1809003 ) ( IN ?auto_1808999 ?auto_1809006 ) ( ON ?auto_1808998 ?auto_1808997 ) ( not ( = ?auto_1808997 ?auto_1808998 ) ) ( not ( = ?auto_1808997 ?auto_1808999 ) ) ( not ( = ?auto_1808997 ?auto_1809000 ) ) ( not ( = ?auto_1808997 ?auto_1809004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1808998 ?auto_1808999 ?auto_1809000 )
      ( MAKE-3CRATE-VERIFY ?auto_1808997 ?auto_1808998 ?auto_1808999 ?auto_1809000 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809288 - SURFACE
      ?auto_1809289 - SURFACE
      ?auto_1809290 - SURFACE
      ?auto_1809292 - SURFACE
      ?auto_1809291 - SURFACE
    )
    :vars
    (
      ?auto_1809293 - HOIST
      ?auto_1809294 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809293 ?auto_1809294 ) ( SURFACE-AT ?auto_1809292 ?auto_1809294 ) ( CLEAR ?auto_1809292 ) ( LIFTING ?auto_1809293 ?auto_1809291 ) ( IS-CRATE ?auto_1809291 ) ( not ( = ?auto_1809292 ?auto_1809291 ) ) ( ON ?auto_1809289 ?auto_1809288 ) ( ON ?auto_1809290 ?auto_1809289 ) ( ON ?auto_1809292 ?auto_1809290 ) ( not ( = ?auto_1809288 ?auto_1809289 ) ) ( not ( = ?auto_1809288 ?auto_1809290 ) ) ( not ( = ?auto_1809288 ?auto_1809292 ) ) ( not ( = ?auto_1809288 ?auto_1809291 ) ) ( not ( = ?auto_1809289 ?auto_1809290 ) ) ( not ( = ?auto_1809289 ?auto_1809292 ) ) ( not ( = ?auto_1809289 ?auto_1809291 ) ) ( not ( = ?auto_1809290 ?auto_1809292 ) ) ( not ( = ?auto_1809290 ?auto_1809291 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1809292 ?auto_1809291 )
      ( MAKE-4CRATE-VERIFY ?auto_1809288 ?auto_1809289 ?auto_1809290 ?auto_1809292 ?auto_1809291 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809313 - SURFACE
      ?auto_1809314 - SURFACE
      ?auto_1809315 - SURFACE
      ?auto_1809317 - SURFACE
      ?auto_1809316 - SURFACE
    )
    :vars
    (
      ?auto_1809318 - HOIST
      ?auto_1809319 - PLACE
      ?auto_1809320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809318 ?auto_1809319 ) ( SURFACE-AT ?auto_1809317 ?auto_1809319 ) ( CLEAR ?auto_1809317 ) ( IS-CRATE ?auto_1809316 ) ( not ( = ?auto_1809317 ?auto_1809316 ) ) ( TRUCK-AT ?auto_1809320 ?auto_1809319 ) ( AVAILABLE ?auto_1809318 ) ( IN ?auto_1809316 ?auto_1809320 ) ( ON ?auto_1809317 ?auto_1809315 ) ( not ( = ?auto_1809315 ?auto_1809317 ) ) ( not ( = ?auto_1809315 ?auto_1809316 ) ) ( ON ?auto_1809314 ?auto_1809313 ) ( ON ?auto_1809315 ?auto_1809314 ) ( not ( = ?auto_1809313 ?auto_1809314 ) ) ( not ( = ?auto_1809313 ?auto_1809315 ) ) ( not ( = ?auto_1809313 ?auto_1809317 ) ) ( not ( = ?auto_1809313 ?auto_1809316 ) ) ( not ( = ?auto_1809314 ?auto_1809315 ) ) ( not ( = ?auto_1809314 ?auto_1809317 ) ) ( not ( = ?auto_1809314 ?auto_1809316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809315 ?auto_1809317 ?auto_1809316 )
      ( MAKE-4CRATE-VERIFY ?auto_1809313 ?auto_1809314 ?auto_1809315 ?auto_1809317 ?auto_1809316 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809343 - SURFACE
      ?auto_1809344 - SURFACE
      ?auto_1809345 - SURFACE
      ?auto_1809347 - SURFACE
      ?auto_1809346 - SURFACE
    )
    :vars
    (
      ?auto_1809348 - HOIST
      ?auto_1809351 - PLACE
      ?auto_1809349 - TRUCK
      ?auto_1809350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809348 ?auto_1809351 ) ( SURFACE-AT ?auto_1809347 ?auto_1809351 ) ( CLEAR ?auto_1809347 ) ( IS-CRATE ?auto_1809346 ) ( not ( = ?auto_1809347 ?auto_1809346 ) ) ( AVAILABLE ?auto_1809348 ) ( IN ?auto_1809346 ?auto_1809349 ) ( ON ?auto_1809347 ?auto_1809345 ) ( not ( = ?auto_1809345 ?auto_1809347 ) ) ( not ( = ?auto_1809345 ?auto_1809346 ) ) ( TRUCK-AT ?auto_1809349 ?auto_1809350 ) ( not ( = ?auto_1809350 ?auto_1809351 ) ) ( ON ?auto_1809344 ?auto_1809343 ) ( ON ?auto_1809345 ?auto_1809344 ) ( not ( = ?auto_1809343 ?auto_1809344 ) ) ( not ( = ?auto_1809343 ?auto_1809345 ) ) ( not ( = ?auto_1809343 ?auto_1809347 ) ) ( not ( = ?auto_1809343 ?auto_1809346 ) ) ( not ( = ?auto_1809344 ?auto_1809345 ) ) ( not ( = ?auto_1809344 ?auto_1809347 ) ) ( not ( = ?auto_1809344 ?auto_1809346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809345 ?auto_1809347 ?auto_1809346 )
      ( MAKE-4CRATE-VERIFY ?auto_1809343 ?auto_1809344 ?auto_1809345 ?auto_1809347 ?auto_1809346 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809377 - SURFACE
      ?auto_1809378 - SURFACE
      ?auto_1809379 - SURFACE
      ?auto_1809381 - SURFACE
      ?auto_1809380 - SURFACE
    )
    :vars
    (
      ?auto_1809386 - HOIST
      ?auto_1809382 - PLACE
      ?auto_1809384 - TRUCK
      ?auto_1809383 - PLACE
      ?auto_1809385 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809386 ?auto_1809382 ) ( SURFACE-AT ?auto_1809381 ?auto_1809382 ) ( CLEAR ?auto_1809381 ) ( IS-CRATE ?auto_1809380 ) ( not ( = ?auto_1809381 ?auto_1809380 ) ) ( AVAILABLE ?auto_1809386 ) ( ON ?auto_1809381 ?auto_1809379 ) ( not ( = ?auto_1809379 ?auto_1809381 ) ) ( not ( = ?auto_1809379 ?auto_1809380 ) ) ( TRUCK-AT ?auto_1809384 ?auto_1809383 ) ( not ( = ?auto_1809383 ?auto_1809382 ) ) ( HOIST-AT ?auto_1809385 ?auto_1809383 ) ( LIFTING ?auto_1809385 ?auto_1809380 ) ( not ( = ?auto_1809386 ?auto_1809385 ) ) ( ON ?auto_1809378 ?auto_1809377 ) ( ON ?auto_1809379 ?auto_1809378 ) ( not ( = ?auto_1809377 ?auto_1809378 ) ) ( not ( = ?auto_1809377 ?auto_1809379 ) ) ( not ( = ?auto_1809377 ?auto_1809381 ) ) ( not ( = ?auto_1809377 ?auto_1809380 ) ) ( not ( = ?auto_1809378 ?auto_1809379 ) ) ( not ( = ?auto_1809378 ?auto_1809381 ) ) ( not ( = ?auto_1809378 ?auto_1809380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809379 ?auto_1809381 ?auto_1809380 )
      ( MAKE-4CRATE-VERIFY ?auto_1809377 ?auto_1809378 ?auto_1809379 ?auto_1809381 ?auto_1809380 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809415 - SURFACE
      ?auto_1809416 - SURFACE
      ?auto_1809417 - SURFACE
      ?auto_1809419 - SURFACE
      ?auto_1809418 - SURFACE
    )
    :vars
    (
      ?auto_1809422 - HOIST
      ?auto_1809420 - PLACE
      ?auto_1809421 - TRUCK
      ?auto_1809424 - PLACE
      ?auto_1809423 - HOIST
      ?auto_1809425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809422 ?auto_1809420 ) ( SURFACE-AT ?auto_1809419 ?auto_1809420 ) ( CLEAR ?auto_1809419 ) ( IS-CRATE ?auto_1809418 ) ( not ( = ?auto_1809419 ?auto_1809418 ) ) ( AVAILABLE ?auto_1809422 ) ( ON ?auto_1809419 ?auto_1809417 ) ( not ( = ?auto_1809417 ?auto_1809419 ) ) ( not ( = ?auto_1809417 ?auto_1809418 ) ) ( TRUCK-AT ?auto_1809421 ?auto_1809424 ) ( not ( = ?auto_1809424 ?auto_1809420 ) ) ( HOIST-AT ?auto_1809423 ?auto_1809424 ) ( not ( = ?auto_1809422 ?auto_1809423 ) ) ( AVAILABLE ?auto_1809423 ) ( SURFACE-AT ?auto_1809418 ?auto_1809424 ) ( ON ?auto_1809418 ?auto_1809425 ) ( CLEAR ?auto_1809418 ) ( not ( = ?auto_1809419 ?auto_1809425 ) ) ( not ( = ?auto_1809418 ?auto_1809425 ) ) ( not ( = ?auto_1809417 ?auto_1809425 ) ) ( ON ?auto_1809416 ?auto_1809415 ) ( ON ?auto_1809417 ?auto_1809416 ) ( not ( = ?auto_1809415 ?auto_1809416 ) ) ( not ( = ?auto_1809415 ?auto_1809417 ) ) ( not ( = ?auto_1809415 ?auto_1809419 ) ) ( not ( = ?auto_1809415 ?auto_1809418 ) ) ( not ( = ?auto_1809415 ?auto_1809425 ) ) ( not ( = ?auto_1809416 ?auto_1809417 ) ) ( not ( = ?auto_1809416 ?auto_1809419 ) ) ( not ( = ?auto_1809416 ?auto_1809418 ) ) ( not ( = ?auto_1809416 ?auto_1809425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809417 ?auto_1809419 ?auto_1809418 )
      ( MAKE-4CRATE-VERIFY ?auto_1809415 ?auto_1809416 ?auto_1809417 ?auto_1809419 ?auto_1809418 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809454 - SURFACE
      ?auto_1809455 - SURFACE
      ?auto_1809456 - SURFACE
      ?auto_1809458 - SURFACE
      ?auto_1809457 - SURFACE
    )
    :vars
    (
      ?auto_1809461 - HOIST
      ?auto_1809463 - PLACE
      ?auto_1809462 - PLACE
      ?auto_1809464 - HOIST
      ?auto_1809459 - SURFACE
      ?auto_1809460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809461 ?auto_1809463 ) ( SURFACE-AT ?auto_1809458 ?auto_1809463 ) ( CLEAR ?auto_1809458 ) ( IS-CRATE ?auto_1809457 ) ( not ( = ?auto_1809458 ?auto_1809457 ) ) ( AVAILABLE ?auto_1809461 ) ( ON ?auto_1809458 ?auto_1809456 ) ( not ( = ?auto_1809456 ?auto_1809458 ) ) ( not ( = ?auto_1809456 ?auto_1809457 ) ) ( not ( = ?auto_1809462 ?auto_1809463 ) ) ( HOIST-AT ?auto_1809464 ?auto_1809462 ) ( not ( = ?auto_1809461 ?auto_1809464 ) ) ( AVAILABLE ?auto_1809464 ) ( SURFACE-AT ?auto_1809457 ?auto_1809462 ) ( ON ?auto_1809457 ?auto_1809459 ) ( CLEAR ?auto_1809457 ) ( not ( = ?auto_1809458 ?auto_1809459 ) ) ( not ( = ?auto_1809457 ?auto_1809459 ) ) ( not ( = ?auto_1809456 ?auto_1809459 ) ) ( TRUCK-AT ?auto_1809460 ?auto_1809463 ) ( ON ?auto_1809455 ?auto_1809454 ) ( ON ?auto_1809456 ?auto_1809455 ) ( not ( = ?auto_1809454 ?auto_1809455 ) ) ( not ( = ?auto_1809454 ?auto_1809456 ) ) ( not ( = ?auto_1809454 ?auto_1809458 ) ) ( not ( = ?auto_1809454 ?auto_1809457 ) ) ( not ( = ?auto_1809454 ?auto_1809459 ) ) ( not ( = ?auto_1809455 ?auto_1809456 ) ) ( not ( = ?auto_1809455 ?auto_1809458 ) ) ( not ( = ?auto_1809455 ?auto_1809457 ) ) ( not ( = ?auto_1809455 ?auto_1809459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809456 ?auto_1809458 ?auto_1809457 )
      ( MAKE-4CRATE-VERIFY ?auto_1809454 ?auto_1809455 ?auto_1809456 ?auto_1809458 ?auto_1809457 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809493 - SURFACE
      ?auto_1809494 - SURFACE
      ?auto_1809495 - SURFACE
      ?auto_1809497 - SURFACE
      ?auto_1809496 - SURFACE
    )
    :vars
    (
      ?auto_1809499 - HOIST
      ?auto_1809502 - PLACE
      ?auto_1809501 - PLACE
      ?auto_1809500 - HOIST
      ?auto_1809503 - SURFACE
      ?auto_1809498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809499 ?auto_1809502 ) ( IS-CRATE ?auto_1809496 ) ( not ( = ?auto_1809497 ?auto_1809496 ) ) ( not ( = ?auto_1809495 ?auto_1809497 ) ) ( not ( = ?auto_1809495 ?auto_1809496 ) ) ( not ( = ?auto_1809501 ?auto_1809502 ) ) ( HOIST-AT ?auto_1809500 ?auto_1809501 ) ( not ( = ?auto_1809499 ?auto_1809500 ) ) ( AVAILABLE ?auto_1809500 ) ( SURFACE-AT ?auto_1809496 ?auto_1809501 ) ( ON ?auto_1809496 ?auto_1809503 ) ( CLEAR ?auto_1809496 ) ( not ( = ?auto_1809497 ?auto_1809503 ) ) ( not ( = ?auto_1809496 ?auto_1809503 ) ) ( not ( = ?auto_1809495 ?auto_1809503 ) ) ( TRUCK-AT ?auto_1809498 ?auto_1809502 ) ( SURFACE-AT ?auto_1809495 ?auto_1809502 ) ( CLEAR ?auto_1809495 ) ( LIFTING ?auto_1809499 ?auto_1809497 ) ( IS-CRATE ?auto_1809497 ) ( ON ?auto_1809494 ?auto_1809493 ) ( ON ?auto_1809495 ?auto_1809494 ) ( not ( = ?auto_1809493 ?auto_1809494 ) ) ( not ( = ?auto_1809493 ?auto_1809495 ) ) ( not ( = ?auto_1809493 ?auto_1809497 ) ) ( not ( = ?auto_1809493 ?auto_1809496 ) ) ( not ( = ?auto_1809493 ?auto_1809503 ) ) ( not ( = ?auto_1809494 ?auto_1809495 ) ) ( not ( = ?auto_1809494 ?auto_1809497 ) ) ( not ( = ?auto_1809494 ?auto_1809496 ) ) ( not ( = ?auto_1809494 ?auto_1809503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809495 ?auto_1809497 ?auto_1809496 )
      ( MAKE-4CRATE-VERIFY ?auto_1809493 ?auto_1809494 ?auto_1809495 ?auto_1809497 ?auto_1809496 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1809532 - SURFACE
      ?auto_1809533 - SURFACE
      ?auto_1809534 - SURFACE
      ?auto_1809536 - SURFACE
      ?auto_1809535 - SURFACE
    )
    :vars
    (
      ?auto_1809537 - HOIST
      ?auto_1809540 - PLACE
      ?auto_1809539 - PLACE
      ?auto_1809538 - HOIST
      ?auto_1809541 - SURFACE
      ?auto_1809542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809537 ?auto_1809540 ) ( IS-CRATE ?auto_1809535 ) ( not ( = ?auto_1809536 ?auto_1809535 ) ) ( not ( = ?auto_1809534 ?auto_1809536 ) ) ( not ( = ?auto_1809534 ?auto_1809535 ) ) ( not ( = ?auto_1809539 ?auto_1809540 ) ) ( HOIST-AT ?auto_1809538 ?auto_1809539 ) ( not ( = ?auto_1809537 ?auto_1809538 ) ) ( AVAILABLE ?auto_1809538 ) ( SURFACE-AT ?auto_1809535 ?auto_1809539 ) ( ON ?auto_1809535 ?auto_1809541 ) ( CLEAR ?auto_1809535 ) ( not ( = ?auto_1809536 ?auto_1809541 ) ) ( not ( = ?auto_1809535 ?auto_1809541 ) ) ( not ( = ?auto_1809534 ?auto_1809541 ) ) ( TRUCK-AT ?auto_1809542 ?auto_1809540 ) ( SURFACE-AT ?auto_1809534 ?auto_1809540 ) ( CLEAR ?auto_1809534 ) ( IS-CRATE ?auto_1809536 ) ( AVAILABLE ?auto_1809537 ) ( IN ?auto_1809536 ?auto_1809542 ) ( ON ?auto_1809533 ?auto_1809532 ) ( ON ?auto_1809534 ?auto_1809533 ) ( not ( = ?auto_1809532 ?auto_1809533 ) ) ( not ( = ?auto_1809532 ?auto_1809534 ) ) ( not ( = ?auto_1809532 ?auto_1809536 ) ) ( not ( = ?auto_1809532 ?auto_1809535 ) ) ( not ( = ?auto_1809532 ?auto_1809541 ) ) ( not ( = ?auto_1809533 ?auto_1809534 ) ) ( not ( = ?auto_1809533 ?auto_1809536 ) ) ( not ( = ?auto_1809533 ?auto_1809535 ) ) ( not ( = ?auto_1809533 ?auto_1809541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1809534 ?auto_1809536 ?auto_1809535 )
      ( MAKE-4CRATE-VERIFY ?auto_1809532 ?auto_1809533 ?auto_1809534 ?auto_1809536 ?auto_1809535 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810192 - SURFACE
      ?auto_1810193 - SURFACE
      ?auto_1810194 - SURFACE
      ?auto_1810196 - SURFACE
      ?auto_1810195 - SURFACE
      ?auto_1810197 - SURFACE
    )
    :vars
    (
      ?auto_1810199 - HOIST
      ?auto_1810198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810199 ?auto_1810198 ) ( SURFACE-AT ?auto_1810195 ?auto_1810198 ) ( CLEAR ?auto_1810195 ) ( LIFTING ?auto_1810199 ?auto_1810197 ) ( IS-CRATE ?auto_1810197 ) ( not ( = ?auto_1810195 ?auto_1810197 ) ) ( ON ?auto_1810193 ?auto_1810192 ) ( ON ?auto_1810194 ?auto_1810193 ) ( ON ?auto_1810196 ?auto_1810194 ) ( ON ?auto_1810195 ?auto_1810196 ) ( not ( = ?auto_1810192 ?auto_1810193 ) ) ( not ( = ?auto_1810192 ?auto_1810194 ) ) ( not ( = ?auto_1810192 ?auto_1810196 ) ) ( not ( = ?auto_1810192 ?auto_1810195 ) ) ( not ( = ?auto_1810192 ?auto_1810197 ) ) ( not ( = ?auto_1810193 ?auto_1810194 ) ) ( not ( = ?auto_1810193 ?auto_1810196 ) ) ( not ( = ?auto_1810193 ?auto_1810195 ) ) ( not ( = ?auto_1810193 ?auto_1810197 ) ) ( not ( = ?auto_1810194 ?auto_1810196 ) ) ( not ( = ?auto_1810194 ?auto_1810195 ) ) ( not ( = ?auto_1810194 ?auto_1810197 ) ) ( not ( = ?auto_1810196 ?auto_1810195 ) ) ( not ( = ?auto_1810196 ?auto_1810197 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1810195 ?auto_1810197 )
      ( MAKE-5CRATE-VERIFY ?auto_1810192 ?auto_1810193 ?auto_1810194 ?auto_1810196 ?auto_1810195 ?auto_1810197 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810226 - SURFACE
      ?auto_1810227 - SURFACE
      ?auto_1810228 - SURFACE
      ?auto_1810230 - SURFACE
      ?auto_1810229 - SURFACE
      ?auto_1810231 - SURFACE
    )
    :vars
    (
      ?auto_1810232 - HOIST
      ?auto_1810233 - PLACE
      ?auto_1810234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810232 ?auto_1810233 ) ( SURFACE-AT ?auto_1810229 ?auto_1810233 ) ( CLEAR ?auto_1810229 ) ( IS-CRATE ?auto_1810231 ) ( not ( = ?auto_1810229 ?auto_1810231 ) ) ( TRUCK-AT ?auto_1810234 ?auto_1810233 ) ( AVAILABLE ?auto_1810232 ) ( IN ?auto_1810231 ?auto_1810234 ) ( ON ?auto_1810229 ?auto_1810230 ) ( not ( = ?auto_1810230 ?auto_1810229 ) ) ( not ( = ?auto_1810230 ?auto_1810231 ) ) ( ON ?auto_1810227 ?auto_1810226 ) ( ON ?auto_1810228 ?auto_1810227 ) ( ON ?auto_1810230 ?auto_1810228 ) ( not ( = ?auto_1810226 ?auto_1810227 ) ) ( not ( = ?auto_1810226 ?auto_1810228 ) ) ( not ( = ?auto_1810226 ?auto_1810230 ) ) ( not ( = ?auto_1810226 ?auto_1810229 ) ) ( not ( = ?auto_1810226 ?auto_1810231 ) ) ( not ( = ?auto_1810227 ?auto_1810228 ) ) ( not ( = ?auto_1810227 ?auto_1810230 ) ) ( not ( = ?auto_1810227 ?auto_1810229 ) ) ( not ( = ?auto_1810227 ?auto_1810231 ) ) ( not ( = ?auto_1810228 ?auto_1810230 ) ) ( not ( = ?auto_1810228 ?auto_1810229 ) ) ( not ( = ?auto_1810228 ?auto_1810231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810230 ?auto_1810229 ?auto_1810231 )
      ( MAKE-5CRATE-VERIFY ?auto_1810226 ?auto_1810227 ?auto_1810228 ?auto_1810230 ?auto_1810229 ?auto_1810231 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810266 - SURFACE
      ?auto_1810267 - SURFACE
      ?auto_1810268 - SURFACE
      ?auto_1810270 - SURFACE
      ?auto_1810269 - SURFACE
      ?auto_1810271 - SURFACE
    )
    :vars
    (
      ?auto_1810273 - HOIST
      ?auto_1810275 - PLACE
      ?auto_1810272 - TRUCK
      ?auto_1810274 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810273 ?auto_1810275 ) ( SURFACE-AT ?auto_1810269 ?auto_1810275 ) ( CLEAR ?auto_1810269 ) ( IS-CRATE ?auto_1810271 ) ( not ( = ?auto_1810269 ?auto_1810271 ) ) ( AVAILABLE ?auto_1810273 ) ( IN ?auto_1810271 ?auto_1810272 ) ( ON ?auto_1810269 ?auto_1810270 ) ( not ( = ?auto_1810270 ?auto_1810269 ) ) ( not ( = ?auto_1810270 ?auto_1810271 ) ) ( TRUCK-AT ?auto_1810272 ?auto_1810274 ) ( not ( = ?auto_1810274 ?auto_1810275 ) ) ( ON ?auto_1810267 ?auto_1810266 ) ( ON ?auto_1810268 ?auto_1810267 ) ( ON ?auto_1810270 ?auto_1810268 ) ( not ( = ?auto_1810266 ?auto_1810267 ) ) ( not ( = ?auto_1810266 ?auto_1810268 ) ) ( not ( = ?auto_1810266 ?auto_1810270 ) ) ( not ( = ?auto_1810266 ?auto_1810269 ) ) ( not ( = ?auto_1810266 ?auto_1810271 ) ) ( not ( = ?auto_1810267 ?auto_1810268 ) ) ( not ( = ?auto_1810267 ?auto_1810270 ) ) ( not ( = ?auto_1810267 ?auto_1810269 ) ) ( not ( = ?auto_1810267 ?auto_1810271 ) ) ( not ( = ?auto_1810268 ?auto_1810270 ) ) ( not ( = ?auto_1810268 ?auto_1810269 ) ) ( not ( = ?auto_1810268 ?auto_1810271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810270 ?auto_1810269 ?auto_1810271 )
      ( MAKE-5CRATE-VERIFY ?auto_1810266 ?auto_1810267 ?auto_1810268 ?auto_1810270 ?auto_1810269 ?auto_1810271 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810311 - SURFACE
      ?auto_1810312 - SURFACE
      ?auto_1810313 - SURFACE
      ?auto_1810315 - SURFACE
      ?auto_1810314 - SURFACE
      ?auto_1810316 - SURFACE
    )
    :vars
    (
      ?auto_1810321 - HOIST
      ?auto_1810318 - PLACE
      ?auto_1810317 - TRUCK
      ?auto_1810320 - PLACE
      ?auto_1810319 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810321 ?auto_1810318 ) ( SURFACE-AT ?auto_1810314 ?auto_1810318 ) ( CLEAR ?auto_1810314 ) ( IS-CRATE ?auto_1810316 ) ( not ( = ?auto_1810314 ?auto_1810316 ) ) ( AVAILABLE ?auto_1810321 ) ( ON ?auto_1810314 ?auto_1810315 ) ( not ( = ?auto_1810315 ?auto_1810314 ) ) ( not ( = ?auto_1810315 ?auto_1810316 ) ) ( TRUCK-AT ?auto_1810317 ?auto_1810320 ) ( not ( = ?auto_1810320 ?auto_1810318 ) ) ( HOIST-AT ?auto_1810319 ?auto_1810320 ) ( LIFTING ?auto_1810319 ?auto_1810316 ) ( not ( = ?auto_1810321 ?auto_1810319 ) ) ( ON ?auto_1810312 ?auto_1810311 ) ( ON ?auto_1810313 ?auto_1810312 ) ( ON ?auto_1810315 ?auto_1810313 ) ( not ( = ?auto_1810311 ?auto_1810312 ) ) ( not ( = ?auto_1810311 ?auto_1810313 ) ) ( not ( = ?auto_1810311 ?auto_1810315 ) ) ( not ( = ?auto_1810311 ?auto_1810314 ) ) ( not ( = ?auto_1810311 ?auto_1810316 ) ) ( not ( = ?auto_1810312 ?auto_1810313 ) ) ( not ( = ?auto_1810312 ?auto_1810315 ) ) ( not ( = ?auto_1810312 ?auto_1810314 ) ) ( not ( = ?auto_1810312 ?auto_1810316 ) ) ( not ( = ?auto_1810313 ?auto_1810315 ) ) ( not ( = ?auto_1810313 ?auto_1810314 ) ) ( not ( = ?auto_1810313 ?auto_1810316 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810315 ?auto_1810314 ?auto_1810316 )
      ( MAKE-5CRATE-VERIFY ?auto_1810311 ?auto_1810312 ?auto_1810313 ?auto_1810315 ?auto_1810314 ?auto_1810316 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810361 - SURFACE
      ?auto_1810362 - SURFACE
      ?auto_1810363 - SURFACE
      ?auto_1810365 - SURFACE
      ?auto_1810364 - SURFACE
      ?auto_1810366 - SURFACE
    )
    :vars
    (
      ?auto_1810371 - HOIST
      ?auto_1810372 - PLACE
      ?auto_1810369 - TRUCK
      ?auto_1810368 - PLACE
      ?auto_1810370 - HOIST
      ?auto_1810367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810371 ?auto_1810372 ) ( SURFACE-AT ?auto_1810364 ?auto_1810372 ) ( CLEAR ?auto_1810364 ) ( IS-CRATE ?auto_1810366 ) ( not ( = ?auto_1810364 ?auto_1810366 ) ) ( AVAILABLE ?auto_1810371 ) ( ON ?auto_1810364 ?auto_1810365 ) ( not ( = ?auto_1810365 ?auto_1810364 ) ) ( not ( = ?auto_1810365 ?auto_1810366 ) ) ( TRUCK-AT ?auto_1810369 ?auto_1810368 ) ( not ( = ?auto_1810368 ?auto_1810372 ) ) ( HOIST-AT ?auto_1810370 ?auto_1810368 ) ( not ( = ?auto_1810371 ?auto_1810370 ) ) ( AVAILABLE ?auto_1810370 ) ( SURFACE-AT ?auto_1810366 ?auto_1810368 ) ( ON ?auto_1810366 ?auto_1810367 ) ( CLEAR ?auto_1810366 ) ( not ( = ?auto_1810364 ?auto_1810367 ) ) ( not ( = ?auto_1810366 ?auto_1810367 ) ) ( not ( = ?auto_1810365 ?auto_1810367 ) ) ( ON ?auto_1810362 ?auto_1810361 ) ( ON ?auto_1810363 ?auto_1810362 ) ( ON ?auto_1810365 ?auto_1810363 ) ( not ( = ?auto_1810361 ?auto_1810362 ) ) ( not ( = ?auto_1810361 ?auto_1810363 ) ) ( not ( = ?auto_1810361 ?auto_1810365 ) ) ( not ( = ?auto_1810361 ?auto_1810364 ) ) ( not ( = ?auto_1810361 ?auto_1810366 ) ) ( not ( = ?auto_1810361 ?auto_1810367 ) ) ( not ( = ?auto_1810362 ?auto_1810363 ) ) ( not ( = ?auto_1810362 ?auto_1810365 ) ) ( not ( = ?auto_1810362 ?auto_1810364 ) ) ( not ( = ?auto_1810362 ?auto_1810366 ) ) ( not ( = ?auto_1810362 ?auto_1810367 ) ) ( not ( = ?auto_1810363 ?auto_1810365 ) ) ( not ( = ?auto_1810363 ?auto_1810364 ) ) ( not ( = ?auto_1810363 ?auto_1810366 ) ) ( not ( = ?auto_1810363 ?auto_1810367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810365 ?auto_1810364 ?auto_1810366 )
      ( MAKE-5CRATE-VERIFY ?auto_1810361 ?auto_1810362 ?auto_1810363 ?auto_1810365 ?auto_1810364 ?auto_1810366 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810412 - SURFACE
      ?auto_1810413 - SURFACE
      ?auto_1810414 - SURFACE
      ?auto_1810416 - SURFACE
      ?auto_1810415 - SURFACE
      ?auto_1810417 - SURFACE
    )
    :vars
    (
      ?auto_1810420 - HOIST
      ?auto_1810423 - PLACE
      ?auto_1810419 - PLACE
      ?auto_1810421 - HOIST
      ?auto_1810422 - SURFACE
      ?auto_1810418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810420 ?auto_1810423 ) ( SURFACE-AT ?auto_1810415 ?auto_1810423 ) ( CLEAR ?auto_1810415 ) ( IS-CRATE ?auto_1810417 ) ( not ( = ?auto_1810415 ?auto_1810417 ) ) ( AVAILABLE ?auto_1810420 ) ( ON ?auto_1810415 ?auto_1810416 ) ( not ( = ?auto_1810416 ?auto_1810415 ) ) ( not ( = ?auto_1810416 ?auto_1810417 ) ) ( not ( = ?auto_1810419 ?auto_1810423 ) ) ( HOIST-AT ?auto_1810421 ?auto_1810419 ) ( not ( = ?auto_1810420 ?auto_1810421 ) ) ( AVAILABLE ?auto_1810421 ) ( SURFACE-AT ?auto_1810417 ?auto_1810419 ) ( ON ?auto_1810417 ?auto_1810422 ) ( CLEAR ?auto_1810417 ) ( not ( = ?auto_1810415 ?auto_1810422 ) ) ( not ( = ?auto_1810417 ?auto_1810422 ) ) ( not ( = ?auto_1810416 ?auto_1810422 ) ) ( TRUCK-AT ?auto_1810418 ?auto_1810423 ) ( ON ?auto_1810413 ?auto_1810412 ) ( ON ?auto_1810414 ?auto_1810413 ) ( ON ?auto_1810416 ?auto_1810414 ) ( not ( = ?auto_1810412 ?auto_1810413 ) ) ( not ( = ?auto_1810412 ?auto_1810414 ) ) ( not ( = ?auto_1810412 ?auto_1810416 ) ) ( not ( = ?auto_1810412 ?auto_1810415 ) ) ( not ( = ?auto_1810412 ?auto_1810417 ) ) ( not ( = ?auto_1810412 ?auto_1810422 ) ) ( not ( = ?auto_1810413 ?auto_1810414 ) ) ( not ( = ?auto_1810413 ?auto_1810416 ) ) ( not ( = ?auto_1810413 ?auto_1810415 ) ) ( not ( = ?auto_1810413 ?auto_1810417 ) ) ( not ( = ?auto_1810413 ?auto_1810422 ) ) ( not ( = ?auto_1810414 ?auto_1810416 ) ) ( not ( = ?auto_1810414 ?auto_1810415 ) ) ( not ( = ?auto_1810414 ?auto_1810417 ) ) ( not ( = ?auto_1810414 ?auto_1810422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810416 ?auto_1810415 ?auto_1810417 )
      ( MAKE-5CRATE-VERIFY ?auto_1810412 ?auto_1810413 ?auto_1810414 ?auto_1810416 ?auto_1810415 ?auto_1810417 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810463 - SURFACE
      ?auto_1810464 - SURFACE
      ?auto_1810465 - SURFACE
      ?auto_1810467 - SURFACE
      ?auto_1810466 - SURFACE
      ?auto_1810468 - SURFACE
    )
    :vars
    (
      ?auto_1810472 - HOIST
      ?auto_1810473 - PLACE
      ?auto_1810470 - PLACE
      ?auto_1810469 - HOIST
      ?auto_1810471 - SURFACE
      ?auto_1810474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810472 ?auto_1810473 ) ( IS-CRATE ?auto_1810468 ) ( not ( = ?auto_1810466 ?auto_1810468 ) ) ( not ( = ?auto_1810467 ?auto_1810466 ) ) ( not ( = ?auto_1810467 ?auto_1810468 ) ) ( not ( = ?auto_1810470 ?auto_1810473 ) ) ( HOIST-AT ?auto_1810469 ?auto_1810470 ) ( not ( = ?auto_1810472 ?auto_1810469 ) ) ( AVAILABLE ?auto_1810469 ) ( SURFACE-AT ?auto_1810468 ?auto_1810470 ) ( ON ?auto_1810468 ?auto_1810471 ) ( CLEAR ?auto_1810468 ) ( not ( = ?auto_1810466 ?auto_1810471 ) ) ( not ( = ?auto_1810468 ?auto_1810471 ) ) ( not ( = ?auto_1810467 ?auto_1810471 ) ) ( TRUCK-AT ?auto_1810474 ?auto_1810473 ) ( SURFACE-AT ?auto_1810467 ?auto_1810473 ) ( CLEAR ?auto_1810467 ) ( LIFTING ?auto_1810472 ?auto_1810466 ) ( IS-CRATE ?auto_1810466 ) ( ON ?auto_1810464 ?auto_1810463 ) ( ON ?auto_1810465 ?auto_1810464 ) ( ON ?auto_1810467 ?auto_1810465 ) ( not ( = ?auto_1810463 ?auto_1810464 ) ) ( not ( = ?auto_1810463 ?auto_1810465 ) ) ( not ( = ?auto_1810463 ?auto_1810467 ) ) ( not ( = ?auto_1810463 ?auto_1810466 ) ) ( not ( = ?auto_1810463 ?auto_1810468 ) ) ( not ( = ?auto_1810463 ?auto_1810471 ) ) ( not ( = ?auto_1810464 ?auto_1810465 ) ) ( not ( = ?auto_1810464 ?auto_1810467 ) ) ( not ( = ?auto_1810464 ?auto_1810466 ) ) ( not ( = ?auto_1810464 ?auto_1810468 ) ) ( not ( = ?auto_1810464 ?auto_1810471 ) ) ( not ( = ?auto_1810465 ?auto_1810467 ) ) ( not ( = ?auto_1810465 ?auto_1810466 ) ) ( not ( = ?auto_1810465 ?auto_1810468 ) ) ( not ( = ?auto_1810465 ?auto_1810471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810467 ?auto_1810466 ?auto_1810468 )
      ( MAKE-5CRATE-VERIFY ?auto_1810463 ?auto_1810464 ?auto_1810465 ?auto_1810467 ?auto_1810466 ?auto_1810468 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1810514 - SURFACE
      ?auto_1810515 - SURFACE
      ?auto_1810516 - SURFACE
      ?auto_1810518 - SURFACE
      ?auto_1810517 - SURFACE
      ?auto_1810519 - SURFACE
    )
    :vars
    (
      ?auto_1810523 - HOIST
      ?auto_1810520 - PLACE
      ?auto_1810521 - PLACE
      ?auto_1810524 - HOIST
      ?auto_1810525 - SURFACE
      ?auto_1810522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1810523 ?auto_1810520 ) ( IS-CRATE ?auto_1810519 ) ( not ( = ?auto_1810517 ?auto_1810519 ) ) ( not ( = ?auto_1810518 ?auto_1810517 ) ) ( not ( = ?auto_1810518 ?auto_1810519 ) ) ( not ( = ?auto_1810521 ?auto_1810520 ) ) ( HOIST-AT ?auto_1810524 ?auto_1810521 ) ( not ( = ?auto_1810523 ?auto_1810524 ) ) ( AVAILABLE ?auto_1810524 ) ( SURFACE-AT ?auto_1810519 ?auto_1810521 ) ( ON ?auto_1810519 ?auto_1810525 ) ( CLEAR ?auto_1810519 ) ( not ( = ?auto_1810517 ?auto_1810525 ) ) ( not ( = ?auto_1810519 ?auto_1810525 ) ) ( not ( = ?auto_1810518 ?auto_1810525 ) ) ( TRUCK-AT ?auto_1810522 ?auto_1810520 ) ( SURFACE-AT ?auto_1810518 ?auto_1810520 ) ( CLEAR ?auto_1810518 ) ( IS-CRATE ?auto_1810517 ) ( AVAILABLE ?auto_1810523 ) ( IN ?auto_1810517 ?auto_1810522 ) ( ON ?auto_1810515 ?auto_1810514 ) ( ON ?auto_1810516 ?auto_1810515 ) ( ON ?auto_1810518 ?auto_1810516 ) ( not ( = ?auto_1810514 ?auto_1810515 ) ) ( not ( = ?auto_1810514 ?auto_1810516 ) ) ( not ( = ?auto_1810514 ?auto_1810518 ) ) ( not ( = ?auto_1810514 ?auto_1810517 ) ) ( not ( = ?auto_1810514 ?auto_1810519 ) ) ( not ( = ?auto_1810514 ?auto_1810525 ) ) ( not ( = ?auto_1810515 ?auto_1810516 ) ) ( not ( = ?auto_1810515 ?auto_1810518 ) ) ( not ( = ?auto_1810515 ?auto_1810517 ) ) ( not ( = ?auto_1810515 ?auto_1810519 ) ) ( not ( = ?auto_1810515 ?auto_1810525 ) ) ( not ( = ?auto_1810516 ?auto_1810518 ) ) ( not ( = ?auto_1810516 ?auto_1810517 ) ) ( not ( = ?auto_1810516 ?auto_1810519 ) ) ( not ( = ?auto_1810516 ?auto_1810525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1810518 ?auto_1810517 ?auto_1810519 )
      ( MAKE-5CRATE-VERIFY ?auto_1810514 ?auto_1810515 ?auto_1810516 ?auto_1810518 ?auto_1810517 ?auto_1810519 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1811723 - SURFACE
      ?auto_1811724 - SURFACE
      ?auto_1811725 - SURFACE
      ?auto_1811727 - SURFACE
      ?auto_1811726 - SURFACE
      ?auto_1811728 - SURFACE
      ?auto_1811729 - SURFACE
    )
    :vars
    (
      ?auto_1811730 - HOIST
      ?auto_1811731 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1811730 ?auto_1811731 ) ( SURFACE-AT ?auto_1811728 ?auto_1811731 ) ( CLEAR ?auto_1811728 ) ( LIFTING ?auto_1811730 ?auto_1811729 ) ( IS-CRATE ?auto_1811729 ) ( not ( = ?auto_1811728 ?auto_1811729 ) ) ( ON ?auto_1811724 ?auto_1811723 ) ( ON ?auto_1811725 ?auto_1811724 ) ( ON ?auto_1811727 ?auto_1811725 ) ( ON ?auto_1811726 ?auto_1811727 ) ( ON ?auto_1811728 ?auto_1811726 ) ( not ( = ?auto_1811723 ?auto_1811724 ) ) ( not ( = ?auto_1811723 ?auto_1811725 ) ) ( not ( = ?auto_1811723 ?auto_1811727 ) ) ( not ( = ?auto_1811723 ?auto_1811726 ) ) ( not ( = ?auto_1811723 ?auto_1811728 ) ) ( not ( = ?auto_1811723 ?auto_1811729 ) ) ( not ( = ?auto_1811724 ?auto_1811725 ) ) ( not ( = ?auto_1811724 ?auto_1811727 ) ) ( not ( = ?auto_1811724 ?auto_1811726 ) ) ( not ( = ?auto_1811724 ?auto_1811728 ) ) ( not ( = ?auto_1811724 ?auto_1811729 ) ) ( not ( = ?auto_1811725 ?auto_1811727 ) ) ( not ( = ?auto_1811725 ?auto_1811726 ) ) ( not ( = ?auto_1811725 ?auto_1811728 ) ) ( not ( = ?auto_1811725 ?auto_1811729 ) ) ( not ( = ?auto_1811727 ?auto_1811726 ) ) ( not ( = ?auto_1811727 ?auto_1811728 ) ) ( not ( = ?auto_1811727 ?auto_1811729 ) ) ( not ( = ?auto_1811726 ?auto_1811728 ) ) ( not ( = ?auto_1811726 ?auto_1811729 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1811728 ?auto_1811729 )
      ( MAKE-6CRATE-VERIFY ?auto_1811723 ?auto_1811724 ?auto_1811725 ?auto_1811727 ?auto_1811726 ?auto_1811728 ?auto_1811729 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1811767 - SURFACE
      ?auto_1811768 - SURFACE
      ?auto_1811769 - SURFACE
      ?auto_1811771 - SURFACE
      ?auto_1811770 - SURFACE
      ?auto_1811772 - SURFACE
      ?auto_1811773 - SURFACE
    )
    :vars
    (
      ?auto_1811775 - HOIST
      ?auto_1811776 - PLACE
      ?auto_1811774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1811775 ?auto_1811776 ) ( SURFACE-AT ?auto_1811772 ?auto_1811776 ) ( CLEAR ?auto_1811772 ) ( IS-CRATE ?auto_1811773 ) ( not ( = ?auto_1811772 ?auto_1811773 ) ) ( TRUCK-AT ?auto_1811774 ?auto_1811776 ) ( AVAILABLE ?auto_1811775 ) ( IN ?auto_1811773 ?auto_1811774 ) ( ON ?auto_1811772 ?auto_1811770 ) ( not ( = ?auto_1811770 ?auto_1811772 ) ) ( not ( = ?auto_1811770 ?auto_1811773 ) ) ( ON ?auto_1811768 ?auto_1811767 ) ( ON ?auto_1811769 ?auto_1811768 ) ( ON ?auto_1811771 ?auto_1811769 ) ( ON ?auto_1811770 ?auto_1811771 ) ( not ( = ?auto_1811767 ?auto_1811768 ) ) ( not ( = ?auto_1811767 ?auto_1811769 ) ) ( not ( = ?auto_1811767 ?auto_1811771 ) ) ( not ( = ?auto_1811767 ?auto_1811770 ) ) ( not ( = ?auto_1811767 ?auto_1811772 ) ) ( not ( = ?auto_1811767 ?auto_1811773 ) ) ( not ( = ?auto_1811768 ?auto_1811769 ) ) ( not ( = ?auto_1811768 ?auto_1811771 ) ) ( not ( = ?auto_1811768 ?auto_1811770 ) ) ( not ( = ?auto_1811768 ?auto_1811772 ) ) ( not ( = ?auto_1811768 ?auto_1811773 ) ) ( not ( = ?auto_1811769 ?auto_1811771 ) ) ( not ( = ?auto_1811769 ?auto_1811770 ) ) ( not ( = ?auto_1811769 ?auto_1811772 ) ) ( not ( = ?auto_1811769 ?auto_1811773 ) ) ( not ( = ?auto_1811771 ?auto_1811770 ) ) ( not ( = ?auto_1811771 ?auto_1811772 ) ) ( not ( = ?auto_1811771 ?auto_1811773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1811770 ?auto_1811772 ?auto_1811773 )
      ( MAKE-6CRATE-VERIFY ?auto_1811767 ?auto_1811768 ?auto_1811769 ?auto_1811771 ?auto_1811770 ?auto_1811772 ?auto_1811773 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1811818 - SURFACE
      ?auto_1811819 - SURFACE
      ?auto_1811820 - SURFACE
      ?auto_1811822 - SURFACE
      ?auto_1811821 - SURFACE
      ?auto_1811823 - SURFACE
      ?auto_1811824 - SURFACE
    )
    :vars
    (
      ?auto_1811826 - HOIST
      ?auto_1811827 - PLACE
      ?auto_1811828 - TRUCK
      ?auto_1811825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1811826 ?auto_1811827 ) ( SURFACE-AT ?auto_1811823 ?auto_1811827 ) ( CLEAR ?auto_1811823 ) ( IS-CRATE ?auto_1811824 ) ( not ( = ?auto_1811823 ?auto_1811824 ) ) ( AVAILABLE ?auto_1811826 ) ( IN ?auto_1811824 ?auto_1811828 ) ( ON ?auto_1811823 ?auto_1811821 ) ( not ( = ?auto_1811821 ?auto_1811823 ) ) ( not ( = ?auto_1811821 ?auto_1811824 ) ) ( TRUCK-AT ?auto_1811828 ?auto_1811825 ) ( not ( = ?auto_1811825 ?auto_1811827 ) ) ( ON ?auto_1811819 ?auto_1811818 ) ( ON ?auto_1811820 ?auto_1811819 ) ( ON ?auto_1811822 ?auto_1811820 ) ( ON ?auto_1811821 ?auto_1811822 ) ( not ( = ?auto_1811818 ?auto_1811819 ) ) ( not ( = ?auto_1811818 ?auto_1811820 ) ) ( not ( = ?auto_1811818 ?auto_1811822 ) ) ( not ( = ?auto_1811818 ?auto_1811821 ) ) ( not ( = ?auto_1811818 ?auto_1811823 ) ) ( not ( = ?auto_1811818 ?auto_1811824 ) ) ( not ( = ?auto_1811819 ?auto_1811820 ) ) ( not ( = ?auto_1811819 ?auto_1811822 ) ) ( not ( = ?auto_1811819 ?auto_1811821 ) ) ( not ( = ?auto_1811819 ?auto_1811823 ) ) ( not ( = ?auto_1811819 ?auto_1811824 ) ) ( not ( = ?auto_1811820 ?auto_1811822 ) ) ( not ( = ?auto_1811820 ?auto_1811821 ) ) ( not ( = ?auto_1811820 ?auto_1811823 ) ) ( not ( = ?auto_1811820 ?auto_1811824 ) ) ( not ( = ?auto_1811822 ?auto_1811821 ) ) ( not ( = ?auto_1811822 ?auto_1811823 ) ) ( not ( = ?auto_1811822 ?auto_1811824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1811821 ?auto_1811823 ?auto_1811824 )
      ( MAKE-6CRATE-VERIFY ?auto_1811818 ?auto_1811819 ?auto_1811820 ?auto_1811822 ?auto_1811821 ?auto_1811823 ?auto_1811824 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1811875 - SURFACE
      ?auto_1811876 - SURFACE
      ?auto_1811877 - SURFACE
      ?auto_1811879 - SURFACE
      ?auto_1811878 - SURFACE
      ?auto_1811880 - SURFACE
      ?auto_1811881 - SURFACE
    )
    :vars
    (
      ?auto_1811884 - HOIST
      ?auto_1811883 - PLACE
      ?auto_1811886 - TRUCK
      ?auto_1811882 - PLACE
      ?auto_1811885 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1811884 ?auto_1811883 ) ( SURFACE-AT ?auto_1811880 ?auto_1811883 ) ( CLEAR ?auto_1811880 ) ( IS-CRATE ?auto_1811881 ) ( not ( = ?auto_1811880 ?auto_1811881 ) ) ( AVAILABLE ?auto_1811884 ) ( ON ?auto_1811880 ?auto_1811878 ) ( not ( = ?auto_1811878 ?auto_1811880 ) ) ( not ( = ?auto_1811878 ?auto_1811881 ) ) ( TRUCK-AT ?auto_1811886 ?auto_1811882 ) ( not ( = ?auto_1811882 ?auto_1811883 ) ) ( HOIST-AT ?auto_1811885 ?auto_1811882 ) ( LIFTING ?auto_1811885 ?auto_1811881 ) ( not ( = ?auto_1811884 ?auto_1811885 ) ) ( ON ?auto_1811876 ?auto_1811875 ) ( ON ?auto_1811877 ?auto_1811876 ) ( ON ?auto_1811879 ?auto_1811877 ) ( ON ?auto_1811878 ?auto_1811879 ) ( not ( = ?auto_1811875 ?auto_1811876 ) ) ( not ( = ?auto_1811875 ?auto_1811877 ) ) ( not ( = ?auto_1811875 ?auto_1811879 ) ) ( not ( = ?auto_1811875 ?auto_1811878 ) ) ( not ( = ?auto_1811875 ?auto_1811880 ) ) ( not ( = ?auto_1811875 ?auto_1811881 ) ) ( not ( = ?auto_1811876 ?auto_1811877 ) ) ( not ( = ?auto_1811876 ?auto_1811879 ) ) ( not ( = ?auto_1811876 ?auto_1811878 ) ) ( not ( = ?auto_1811876 ?auto_1811880 ) ) ( not ( = ?auto_1811876 ?auto_1811881 ) ) ( not ( = ?auto_1811877 ?auto_1811879 ) ) ( not ( = ?auto_1811877 ?auto_1811878 ) ) ( not ( = ?auto_1811877 ?auto_1811880 ) ) ( not ( = ?auto_1811877 ?auto_1811881 ) ) ( not ( = ?auto_1811879 ?auto_1811878 ) ) ( not ( = ?auto_1811879 ?auto_1811880 ) ) ( not ( = ?auto_1811879 ?auto_1811881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1811878 ?auto_1811880 ?auto_1811881 )
      ( MAKE-6CRATE-VERIFY ?auto_1811875 ?auto_1811876 ?auto_1811877 ?auto_1811879 ?auto_1811878 ?auto_1811880 ?auto_1811881 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1811938 - SURFACE
      ?auto_1811939 - SURFACE
      ?auto_1811940 - SURFACE
      ?auto_1811942 - SURFACE
      ?auto_1811941 - SURFACE
      ?auto_1811943 - SURFACE
      ?auto_1811944 - SURFACE
    )
    :vars
    (
      ?auto_1811948 - HOIST
      ?auto_1811950 - PLACE
      ?auto_1811949 - TRUCK
      ?auto_1811945 - PLACE
      ?auto_1811947 - HOIST
      ?auto_1811946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1811948 ?auto_1811950 ) ( SURFACE-AT ?auto_1811943 ?auto_1811950 ) ( CLEAR ?auto_1811943 ) ( IS-CRATE ?auto_1811944 ) ( not ( = ?auto_1811943 ?auto_1811944 ) ) ( AVAILABLE ?auto_1811948 ) ( ON ?auto_1811943 ?auto_1811941 ) ( not ( = ?auto_1811941 ?auto_1811943 ) ) ( not ( = ?auto_1811941 ?auto_1811944 ) ) ( TRUCK-AT ?auto_1811949 ?auto_1811945 ) ( not ( = ?auto_1811945 ?auto_1811950 ) ) ( HOIST-AT ?auto_1811947 ?auto_1811945 ) ( not ( = ?auto_1811948 ?auto_1811947 ) ) ( AVAILABLE ?auto_1811947 ) ( SURFACE-AT ?auto_1811944 ?auto_1811945 ) ( ON ?auto_1811944 ?auto_1811946 ) ( CLEAR ?auto_1811944 ) ( not ( = ?auto_1811943 ?auto_1811946 ) ) ( not ( = ?auto_1811944 ?auto_1811946 ) ) ( not ( = ?auto_1811941 ?auto_1811946 ) ) ( ON ?auto_1811939 ?auto_1811938 ) ( ON ?auto_1811940 ?auto_1811939 ) ( ON ?auto_1811942 ?auto_1811940 ) ( ON ?auto_1811941 ?auto_1811942 ) ( not ( = ?auto_1811938 ?auto_1811939 ) ) ( not ( = ?auto_1811938 ?auto_1811940 ) ) ( not ( = ?auto_1811938 ?auto_1811942 ) ) ( not ( = ?auto_1811938 ?auto_1811941 ) ) ( not ( = ?auto_1811938 ?auto_1811943 ) ) ( not ( = ?auto_1811938 ?auto_1811944 ) ) ( not ( = ?auto_1811938 ?auto_1811946 ) ) ( not ( = ?auto_1811939 ?auto_1811940 ) ) ( not ( = ?auto_1811939 ?auto_1811942 ) ) ( not ( = ?auto_1811939 ?auto_1811941 ) ) ( not ( = ?auto_1811939 ?auto_1811943 ) ) ( not ( = ?auto_1811939 ?auto_1811944 ) ) ( not ( = ?auto_1811939 ?auto_1811946 ) ) ( not ( = ?auto_1811940 ?auto_1811942 ) ) ( not ( = ?auto_1811940 ?auto_1811941 ) ) ( not ( = ?auto_1811940 ?auto_1811943 ) ) ( not ( = ?auto_1811940 ?auto_1811944 ) ) ( not ( = ?auto_1811940 ?auto_1811946 ) ) ( not ( = ?auto_1811942 ?auto_1811941 ) ) ( not ( = ?auto_1811942 ?auto_1811943 ) ) ( not ( = ?auto_1811942 ?auto_1811944 ) ) ( not ( = ?auto_1811942 ?auto_1811946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1811941 ?auto_1811943 ?auto_1811944 )
      ( MAKE-6CRATE-VERIFY ?auto_1811938 ?auto_1811939 ?auto_1811940 ?auto_1811942 ?auto_1811941 ?auto_1811943 ?auto_1811944 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812002 - SURFACE
      ?auto_1812003 - SURFACE
      ?auto_1812004 - SURFACE
      ?auto_1812006 - SURFACE
      ?auto_1812005 - SURFACE
      ?auto_1812007 - SURFACE
      ?auto_1812008 - SURFACE
    )
    :vars
    (
      ?auto_1812013 - HOIST
      ?auto_1812011 - PLACE
      ?auto_1812012 - PLACE
      ?auto_1812009 - HOIST
      ?auto_1812014 - SURFACE
      ?auto_1812010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812013 ?auto_1812011 ) ( SURFACE-AT ?auto_1812007 ?auto_1812011 ) ( CLEAR ?auto_1812007 ) ( IS-CRATE ?auto_1812008 ) ( not ( = ?auto_1812007 ?auto_1812008 ) ) ( AVAILABLE ?auto_1812013 ) ( ON ?auto_1812007 ?auto_1812005 ) ( not ( = ?auto_1812005 ?auto_1812007 ) ) ( not ( = ?auto_1812005 ?auto_1812008 ) ) ( not ( = ?auto_1812012 ?auto_1812011 ) ) ( HOIST-AT ?auto_1812009 ?auto_1812012 ) ( not ( = ?auto_1812013 ?auto_1812009 ) ) ( AVAILABLE ?auto_1812009 ) ( SURFACE-AT ?auto_1812008 ?auto_1812012 ) ( ON ?auto_1812008 ?auto_1812014 ) ( CLEAR ?auto_1812008 ) ( not ( = ?auto_1812007 ?auto_1812014 ) ) ( not ( = ?auto_1812008 ?auto_1812014 ) ) ( not ( = ?auto_1812005 ?auto_1812014 ) ) ( TRUCK-AT ?auto_1812010 ?auto_1812011 ) ( ON ?auto_1812003 ?auto_1812002 ) ( ON ?auto_1812004 ?auto_1812003 ) ( ON ?auto_1812006 ?auto_1812004 ) ( ON ?auto_1812005 ?auto_1812006 ) ( not ( = ?auto_1812002 ?auto_1812003 ) ) ( not ( = ?auto_1812002 ?auto_1812004 ) ) ( not ( = ?auto_1812002 ?auto_1812006 ) ) ( not ( = ?auto_1812002 ?auto_1812005 ) ) ( not ( = ?auto_1812002 ?auto_1812007 ) ) ( not ( = ?auto_1812002 ?auto_1812008 ) ) ( not ( = ?auto_1812002 ?auto_1812014 ) ) ( not ( = ?auto_1812003 ?auto_1812004 ) ) ( not ( = ?auto_1812003 ?auto_1812006 ) ) ( not ( = ?auto_1812003 ?auto_1812005 ) ) ( not ( = ?auto_1812003 ?auto_1812007 ) ) ( not ( = ?auto_1812003 ?auto_1812008 ) ) ( not ( = ?auto_1812003 ?auto_1812014 ) ) ( not ( = ?auto_1812004 ?auto_1812006 ) ) ( not ( = ?auto_1812004 ?auto_1812005 ) ) ( not ( = ?auto_1812004 ?auto_1812007 ) ) ( not ( = ?auto_1812004 ?auto_1812008 ) ) ( not ( = ?auto_1812004 ?auto_1812014 ) ) ( not ( = ?auto_1812006 ?auto_1812005 ) ) ( not ( = ?auto_1812006 ?auto_1812007 ) ) ( not ( = ?auto_1812006 ?auto_1812008 ) ) ( not ( = ?auto_1812006 ?auto_1812014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812005 ?auto_1812007 ?auto_1812008 )
      ( MAKE-6CRATE-VERIFY ?auto_1812002 ?auto_1812003 ?auto_1812004 ?auto_1812006 ?auto_1812005 ?auto_1812007 ?auto_1812008 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812066 - SURFACE
      ?auto_1812067 - SURFACE
      ?auto_1812068 - SURFACE
      ?auto_1812070 - SURFACE
      ?auto_1812069 - SURFACE
      ?auto_1812071 - SURFACE
      ?auto_1812072 - SURFACE
    )
    :vars
    (
      ?auto_1812078 - HOIST
      ?auto_1812075 - PLACE
      ?auto_1812076 - PLACE
      ?auto_1812077 - HOIST
      ?auto_1812073 - SURFACE
      ?auto_1812074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812078 ?auto_1812075 ) ( IS-CRATE ?auto_1812072 ) ( not ( = ?auto_1812071 ?auto_1812072 ) ) ( not ( = ?auto_1812069 ?auto_1812071 ) ) ( not ( = ?auto_1812069 ?auto_1812072 ) ) ( not ( = ?auto_1812076 ?auto_1812075 ) ) ( HOIST-AT ?auto_1812077 ?auto_1812076 ) ( not ( = ?auto_1812078 ?auto_1812077 ) ) ( AVAILABLE ?auto_1812077 ) ( SURFACE-AT ?auto_1812072 ?auto_1812076 ) ( ON ?auto_1812072 ?auto_1812073 ) ( CLEAR ?auto_1812072 ) ( not ( = ?auto_1812071 ?auto_1812073 ) ) ( not ( = ?auto_1812072 ?auto_1812073 ) ) ( not ( = ?auto_1812069 ?auto_1812073 ) ) ( TRUCK-AT ?auto_1812074 ?auto_1812075 ) ( SURFACE-AT ?auto_1812069 ?auto_1812075 ) ( CLEAR ?auto_1812069 ) ( LIFTING ?auto_1812078 ?auto_1812071 ) ( IS-CRATE ?auto_1812071 ) ( ON ?auto_1812067 ?auto_1812066 ) ( ON ?auto_1812068 ?auto_1812067 ) ( ON ?auto_1812070 ?auto_1812068 ) ( ON ?auto_1812069 ?auto_1812070 ) ( not ( = ?auto_1812066 ?auto_1812067 ) ) ( not ( = ?auto_1812066 ?auto_1812068 ) ) ( not ( = ?auto_1812066 ?auto_1812070 ) ) ( not ( = ?auto_1812066 ?auto_1812069 ) ) ( not ( = ?auto_1812066 ?auto_1812071 ) ) ( not ( = ?auto_1812066 ?auto_1812072 ) ) ( not ( = ?auto_1812066 ?auto_1812073 ) ) ( not ( = ?auto_1812067 ?auto_1812068 ) ) ( not ( = ?auto_1812067 ?auto_1812070 ) ) ( not ( = ?auto_1812067 ?auto_1812069 ) ) ( not ( = ?auto_1812067 ?auto_1812071 ) ) ( not ( = ?auto_1812067 ?auto_1812072 ) ) ( not ( = ?auto_1812067 ?auto_1812073 ) ) ( not ( = ?auto_1812068 ?auto_1812070 ) ) ( not ( = ?auto_1812068 ?auto_1812069 ) ) ( not ( = ?auto_1812068 ?auto_1812071 ) ) ( not ( = ?auto_1812068 ?auto_1812072 ) ) ( not ( = ?auto_1812068 ?auto_1812073 ) ) ( not ( = ?auto_1812070 ?auto_1812069 ) ) ( not ( = ?auto_1812070 ?auto_1812071 ) ) ( not ( = ?auto_1812070 ?auto_1812072 ) ) ( not ( = ?auto_1812070 ?auto_1812073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812069 ?auto_1812071 ?auto_1812072 )
      ( MAKE-6CRATE-VERIFY ?auto_1812066 ?auto_1812067 ?auto_1812068 ?auto_1812070 ?auto_1812069 ?auto_1812071 ?auto_1812072 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1812130 - SURFACE
      ?auto_1812131 - SURFACE
      ?auto_1812132 - SURFACE
      ?auto_1812134 - SURFACE
      ?auto_1812133 - SURFACE
      ?auto_1812135 - SURFACE
      ?auto_1812136 - SURFACE
    )
    :vars
    (
      ?auto_1812140 - HOIST
      ?auto_1812138 - PLACE
      ?auto_1812139 - PLACE
      ?auto_1812141 - HOIST
      ?auto_1812142 - SURFACE
      ?auto_1812137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812140 ?auto_1812138 ) ( IS-CRATE ?auto_1812136 ) ( not ( = ?auto_1812135 ?auto_1812136 ) ) ( not ( = ?auto_1812133 ?auto_1812135 ) ) ( not ( = ?auto_1812133 ?auto_1812136 ) ) ( not ( = ?auto_1812139 ?auto_1812138 ) ) ( HOIST-AT ?auto_1812141 ?auto_1812139 ) ( not ( = ?auto_1812140 ?auto_1812141 ) ) ( AVAILABLE ?auto_1812141 ) ( SURFACE-AT ?auto_1812136 ?auto_1812139 ) ( ON ?auto_1812136 ?auto_1812142 ) ( CLEAR ?auto_1812136 ) ( not ( = ?auto_1812135 ?auto_1812142 ) ) ( not ( = ?auto_1812136 ?auto_1812142 ) ) ( not ( = ?auto_1812133 ?auto_1812142 ) ) ( TRUCK-AT ?auto_1812137 ?auto_1812138 ) ( SURFACE-AT ?auto_1812133 ?auto_1812138 ) ( CLEAR ?auto_1812133 ) ( IS-CRATE ?auto_1812135 ) ( AVAILABLE ?auto_1812140 ) ( IN ?auto_1812135 ?auto_1812137 ) ( ON ?auto_1812131 ?auto_1812130 ) ( ON ?auto_1812132 ?auto_1812131 ) ( ON ?auto_1812134 ?auto_1812132 ) ( ON ?auto_1812133 ?auto_1812134 ) ( not ( = ?auto_1812130 ?auto_1812131 ) ) ( not ( = ?auto_1812130 ?auto_1812132 ) ) ( not ( = ?auto_1812130 ?auto_1812134 ) ) ( not ( = ?auto_1812130 ?auto_1812133 ) ) ( not ( = ?auto_1812130 ?auto_1812135 ) ) ( not ( = ?auto_1812130 ?auto_1812136 ) ) ( not ( = ?auto_1812130 ?auto_1812142 ) ) ( not ( = ?auto_1812131 ?auto_1812132 ) ) ( not ( = ?auto_1812131 ?auto_1812134 ) ) ( not ( = ?auto_1812131 ?auto_1812133 ) ) ( not ( = ?auto_1812131 ?auto_1812135 ) ) ( not ( = ?auto_1812131 ?auto_1812136 ) ) ( not ( = ?auto_1812131 ?auto_1812142 ) ) ( not ( = ?auto_1812132 ?auto_1812134 ) ) ( not ( = ?auto_1812132 ?auto_1812133 ) ) ( not ( = ?auto_1812132 ?auto_1812135 ) ) ( not ( = ?auto_1812132 ?auto_1812136 ) ) ( not ( = ?auto_1812132 ?auto_1812142 ) ) ( not ( = ?auto_1812134 ?auto_1812133 ) ) ( not ( = ?auto_1812134 ?auto_1812135 ) ) ( not ( = ?auto_1812134 ?auto_1812136 ) ) ( not ( = ?auto_1812134 ?auto_1812142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1812133 ?auto_1812135 ?auto_1812136 )
      ( MAKE-6CRATE-VERIFY ?auto_1812130 ?auto_1812131 ?auto_1812132 ?auto_1812134 ?auto_1812133 ?auto_1812135 ?auto_1812136 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814086 - SURFACE
      ?auto_1814087 - SURFACE
      ?auto_1814088 - SURFACE
      ?auto_1814090 - SURFACE
      ?auto_1814089 - SURFACE
      ?auto_1814091 - SURFACE
      ?auto_1814092 - SURFACE
      ?auto_1814093 - SURFACE
    )
    :vars
    (
      ?auto_1814094 - HOIST
      ?auto_1814095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814094 ?auto_1814095 ) ( SURFACE-AT ?auto_1814092 ?auto_1814095 ) ( CLEAR ?auto_1814092 ) ( LIFTING ?auto_1814094 ?auto_1814093 ) ( IS-CRATE ?auto_1814093 ) ( not ( = ?auto_1814092 ?auto_1814093 ) ) ( ON ?auto_1814087 ?auto_1814086 ) ( ON ?auto_1814088 ?auto_1814087 ) ( ON ?auto_1814090 ?auto_1814088 ) ( ON ?auto_1814089 ?auto_1814090 ) ( ON ?auto_1814091 ?auto_1814089 ) ( ON ?auto_1814092 ?auto_1814091 ) ( not ( = ?auto_1814086 ?auto_1814087 ) ) ( not ( = ?auto_1814086 ?auto_1814088 ) ) ( not ( = ?auto_1814086 ?auto_1814090 ) ) ( not ( = ?auto_1814086 ?auto_1814089 ) ) ( not ( = ?auto_1814086 ?auto_1814091 ) ) ( not ( = ?auto_1814086 ?auto_1814092 ) ) ( not ( = ?auto_1814086 ?auto_1814093 ) ) ( not ( = ?auto_1814087 ?auto_1814088 ) ) ( not ( = ?auto_1814087 ?auto_1814090 ) ) ( not ( = ?auto_1814087 ?auto_1814089 ) ) ( not ( = ?auto_1814087 ?auto_1814091 ) ) ( not ( = ?auto_1814087 ?auto_1814092 ) ) ( not ( = ?auto_1814087 ?auto_1814093 ) ) ( not ( = ?auto_1814088 ?auto_1814090 ) ) ( not ( = ?auto_1814088 ?auto_1814089 ) ) ( not ( = ?auto_1814088 ?auto_1814091 ) ) ( not ( = ?auto_1814088 ?auto_1814092 ) ) ( not ( = ?auto_1814088 ?auto_1814093 ) ) ( not ( = ?auto_1814090 ?auto_1814089 ) ) ( not ( = ?auto_1814090 ?auto_1814091 ) ) ( not ( = ?auto_1814090 ?auto_1814092 ) ) ( not ( = ?auto_1814090 ?auto_1814093 ) ) ( not ( = ?auto_1814089 ?auto_1814091 ) ) ( not ( = ?auto_1814089 ?auto_1814092 ) ) ( not ( = ?auto_1814089 ?auto_1814093 ) ) ( not ( = ?auto_1814091 ?auto_1814092 ) ) ( not ( = ?auto_1814091 ?auto_1814093 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1814092 ?auto_1814093 )
      ( MAKE-7CRATE-VERIFY ?auto_1814086 ?auto_1814087 ?auto_1814088 ?auto_1814090 ?auto_1814089 ?auto_1814091 ?auto_1814092 ?auto_1814093 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814141 - SURFACE
      ?auto_1814142 - SURFACE
      ?auto_1814143 - SURFACE
      ?auto_1814145 - SURFACE
      ?auto_1814144 - SURFACE
      ?auto_1814146 - SURFACE
      ?auto_1814147 - SURFACE
      ?auto_1814148 - SURFACE
    )
    :vars
    (
      ?auto_1814150 - HOIST
      ?auto_1814149 - PLACE
      ?auto_1814151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814150 ?auto_1814149 ) ( SURFACE-AT ?auto_1814147 ?auto_1814149 ) ( CLEAR ?auto_1814147 ) ( IS-CRATE ?auto_1814148 ) ( not ( = ?auto_1814147 ?auto_1814148 ) ) ( TRUCK-AT ?auto_1814151 ?auto_1814149 ) ( AVAILABLE ?auto_1814150 ) ( IN ?auto_1814148 ?auto_1814151 ) ( ON ?auto_1814147 ?auto_1814146 ) ( not ( = ?auto_1814146 ?auto_1814147 ) ) ( not ( = ?auto_1814146 ?auto_1814148 ) ) ( ON ?auto_1814142 ?auto_1814141 ) ( ON ?auto_1814143 ?auto_1814142 ) ( ON ?auto_1814145 ?auto_1814143 ) ( ON ?auto_1814144 ?auto_1814145 ) ( ON ?auto_1814146 ?auto_1814144 ) ( not ( = ?auto_1814141 ?auto_1814142 ) ) ( not ( = ?auto_1814141 ?auto_1814143 ) ) ( not ( = ?auto_1814141 ?auto_1814145 ) ) ( not ( = ?auto_1814141 ?auto_1814144 ) ) ( not ( = ?auto_1814141 ?auto_1814146 ) ) ( not ( = ?auto_1814141 ?auto_1814147 ) ) ( not ( = ?auto_1814141 ?auto_1814148 ) ) ( not ( = ?auto_1814142 ?auto_1814143 ) ) ( not ( = ?auto_1814142 ?auto_1814145 ) ) ( not ( = ?auto_1814142 ?auto_1814144 ) ) ( not ( = ?auto_1814142 ?auto_1814146 ) ) ( not ( = ?auto_1814142 ?auto_1814147 ) ) ( not ( = ?auto_1814142 ?auto_1814148 ) ) ( not ( = ?auto_1814143 ?auto_1814145 ) ) ( not ( = ?auto_1814143 ?auto_1814144 ) ) ( not ( = ?auto_1814143 ?auto_1814146 ) ) ( not ( = ?auto_1814143 ?auto_1814147 ) ) ( not ( = ?auto_1814143 ?auto_1814148 ) ) ( not ( = ?auto_1814145 ?auto_1814144 ) ) ( not ( = ?auto_1814145 ?auto_1814146 ) ) ( not ( = ?auto_1814145 ?auto_1814147 ) ) ( not ( = ?auto_1814145 ?auto_1814148 ) ) ( not ( = ?auto_1814144 ?auto_1814146 ) ) ( not ( = ?auto_1814144 ?auto_1814147 ) ) ( not ( = ?auto_1814144 ?auto_1814148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814146 ?auto_1814147 ?auto_1814148 )
      ( MAKE-7CRATE-VERIFY ?auto_1814141 ?auto_1814142 ?auto_1814143 ?auto_1814145 ?auto_1814144 ?auto_1814146 ?auto_1814147 ?auto_1814148 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814204 - SURFACE
      ?auto_1814205 - SURFACE
      ?auto_1814206 - SURFACE
      ?auto_1814208 - SURFACE
      ?auto_1814207 - SURFACE
      ?auto_1814209 - SURFACE
      ?auto_1814210 - SURFACE
      ?auto_1814211 - SURFACE
    )
    :vars
    (
      ?auto_1814215 - HOIST
      ?auto_1814213 - PLACE
      ?auto_1814212 - TRUCK
      ?auto_1814214 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814215 ?auto_1814213 ) ( SURFACE-AT ?auto_1814210 ?auto_1814213 ) ( CLEAR ?auto_1814210 ) ( IS-CRATE ?auto_1814211 ) ( not ( = ?auto_1814210 ?auto_1814211 ) ) ( AVAILABLE ?auto_1814215 ) ( IN ?auto_1814211 ?auto_1814212 ) ( ON ?auto_1814210 ?auto_1814209 ) ( not ( = ?auto_1814209 ?auto_1814210 ) ) ( not ( = ?auto_1814209 ?auto_1814211 ) ) ( TRUCK-AT ?auto_1814212 ?auto_1814214 ) ( not ( = ?auto_1814214 ?auto_1814213 ) ) ( ON ?auto_1814205 ?auto_1814204 ) ( ON ?auto_1814206 ?auto_1814205 ) ( ON ?auto_1814208 ?auto_1814206 ) ( ON ?auto_1814207 ?auto_1814208 ) ( ON ?auto_1814209 ?auto_1814207 ) ( not ( = ?auto_1814204 ?auto_1814205 ) ) ( not ( = ?auto_1814204 ?auto_1814206 ) ) ( not ( = ?auto_1814204 ?auto_1814208 ) ) ( not ( = ?auto_1814204 ?auto_1814207 ) ) ( not ( = ?auto_1814204 ?auto_1814209 ) ) ( not ( = ?auto_1814204 ?auto_1814210 ) ) ( not ( = ?auto_1814204 ?auto_1814211 ) ) ( not ( = ?auto_1814205 ?auto_1814206 ) ) ( not ( = ?auto_1814205 ?auto_1814208 ) ) ( not ( = ?auto_1814205 ?auto_1814207 ) ) ( not ( = ?auto_1814205 ?auto_1814209 ) ) ( not ( = ?auto_1814205 ?auto_1814210 ) ) ( not ( = ?auto_1814205 ?auto_1814211 ) ) ( not ( = ?auto_1814206 ?auto_1814208 ) ) ( not ( = ?auto_1814206 ?auto_1814207 ) ) ( not ( = ?auto_1814206 ?auto_1814209 ) ) ( not ( = ?auto_1814206 ?auto_1814210 ) ) ( not ( = ?auto_1814206 ?auto_1814211 ) ) ( not ( = ?auto_1814208 ?auto_1814207 ) ) ( not ( = ?auto_1814208 ?auto_1814209 ) ) ( not ( = ?auto_1814208 ?auto_1814210 ) ) ( not ( = ?auto_1814208 ?auto_1814211 ) ) ( not ( = ?auto_1814207 ?auto_1814209 ) ) ( not ( = ?auto_1814207 ?auto_1814210 ) ) ( not ( = ?auto_1814207 ?auto_1814211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814209 ?auto_1814210 ?auto_1814211 )
      ( MAKE-7CRATE-VERIFY ?auto_1814204 ?auto_1814205 ?auto_1814206 ?auto_1814208 ?auto_1814207 ?auto_1814209 ?auto_1814210 ?auto_1814211 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814274 - SURFACE
      ?auto_1814275 - SURFACE
      ?auto_1814276 - SURFACE
      ?auto_1814278 - SURFACE
      ?auto_1814277 - SURFACE
      ?auto_1814279 - SURFACE
      ?auto_1814280 - SURFACE
      ?auto_1814281 - SURFACE
    )
    :vars
    (
      ?auto_1814283 - HOIST
      ?auto_1814282 - PLACE
      ?auto_1814284 - TRUCK
      ?auto_1814285 - PLACE
      ?auto_1814286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814283 ?auto_1814282 ) ( SURFACE-AT ?auto_1814280 ?auto_1814282 ) ( CLEAR ?auto_1814280 ) ( IS-CRATE ?auto_1814281 ) ( not ( = ?auto_1814280 ?auto_1814281 ) ) ( AVAILABLE ?auto_1814283 ) ( ON ?auto_1814280 ?auto_1814279 ) ( not ( = ?auto_1814279 ?auto_1814280 ) ) ( not ( = ?auto_1814279 ?auto_1814281 ) ) ( TRUCK-AT ?auto_1814284 ?auto_1814285 ) ( not ( = ?auto_1814285 ?auto_1814282 ) ) ( HOIST-AT ?auto_1814286 ?auto_1814285 ) ( LIFTING ?auto_1814286 ?auto_1814281 ) ( not ( = ?auto_1814283 ?auto_1814286 ) ) ( ON ?auto_1814275 ?auto_1814274 ) ( ON ?auto_1814276 ?auto_1814275 ) ( ON ?auto_1814278 ?auto_1814276 ) ( ON ?auto_1814277 ?auto_1814278 ) ( ON ?auto_1814279 ?auto_1814277 ) ( not ( = ?auto_1814274 ?auto_1814275 ) ) ( not ( = ?auto_1814274 ?auto_1814276 ) ) ( not ( = ?auto_1814274 ?auto_1814278 ) ) ( not ( = ?auto_1814274 ?auto_1814277 ) ) ( not ( = ?auto_1814274 ?auto_1814279 ) ) ( not ( = ?auto_1814274 ?auto_1814280 ) ) ( not ( = ?auto_1814274 ?auto_1814281 ) ) ( not ( = ?auto_1814275 ?auto_1814276 ) ) ( not ( = ?auto_1814275 ?auto_1814278 ) ) ( not ( = ?auto_1814275 ?auto_1814277 ) ) ( not ( = ?auto_1814275 ?auto_1814279 ) ) ( not ( = ?auto_1814275 ?auto_1814280 ) ) ( not ( = ?auto_1814275 ?auto_1814281 ) ) ( not ( = ?auto_1814276 ?auto_1814278 ) ) ( not ( = ?auto_1814276 ?auto_1814277 ) ) ( not ( = ?auto_1814276 ?auto_1814279 ) ) ( not ( = ?auto_1814276 ?auto_1814280 ) ) ( not ( = ?auto_1814276 ?auto_1814281 ) ) ( not ( = ?auto_1814278 ?auto_1814277 ) ) ( not ( = ?auto_1814278 ?auto_1814279 ) ) ( not ( = ?auto_1814278 ?auto_1814280 ) ) ( not ( = ?auto_1814278 ?auto_1814281 ) ) ( not ( = ?auto_1814277 ?auto_1814279 ) ) ( not ( = ?auto_1814277 ?auto_1814280 ) ) ( not ( = ?auto_1814277 ?auto_1814281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814279 ?auto_1814280 ?auto_1814281 )
      ( MAKE-7CRATE-VERIFY ?auto_1814274 ?auto_1814275 ?auto_1814276 ?auto_1814278 ?auto_1814277 ?auto_1814279 ?auto_1814280 ?auto_1814281 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814351 - SURFACE
      ?auto_1814352 - SURFACE
      ?auto_1814353 - SURFACE
      ?auto_1814355 - SURFACE
      ?auto_1814354 - SURFACE
      ?auto_1814356 - SURFACE
      ?auto_1814357 - SURFACE
      ?auto_1814358 - SURFACE
    )
    :vars
    (
      ?auto_1814362 - HOIST
      ?auto_1814361 - PLACE
      ?auto_1814359 - TRUCK
      ?auto_1814360 - PLACE
      ?auto_1814364 - HOIST
      ?auto_1814363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814362 ?auto_1814361 ) ( SURFACE-AT ?auto_1814357 ?auto_1814361 ) ( CLEAR ?auto_1814357 ) ( IS-CRATE ?auto_1814358 ) ( not ( = ?auto_1814357 ?auto_1814358 ) ) ( AVAILABLE ?auto_1814362 ) ( ON ?auto_1814357 ?auto_1814356 ) ( not ( = ?auto_1814356 ?auto_1814357 ) ) ( not ( = ?auto_1814356 ?auto_1814358 ) ) ( TRUCK-AT ?auto_1814359 ?auto_1814360 ) ( not ( = ?auto_1814360 ?auto_1814361 ) ) ( HOIST-AT ?auto_1814364 ?auto_1814360 ) ( not ( = ?auto_1814362 ?auto_1814364 ) ) ( AVAILABLE ?auto_1814364 ) ( SURFACE-AT ?auto_1814358 ?auto_1814360 ) ( ON ?auto_1814358 ?auto_1814363 ) ( CLEAR ?auto_1814358 ) ( not ( = ?auto_1814357 ?auto_1814363 ) ) ( not ( = ?auto_1814358 ?auto_1814363 ) ) ( not ( = ?auto_1814356 ?auto_1814363 ) ) ( ON ?auto_1814352 ?auto_1814351 ) ( ON ?auto_1814353 ?auto_1814352 ) ( ON ?auto_1814355 ?auto_1814353 ) ( ON ?auto_1814354 ?auto_1814355 ) ( ON ?auto_1814356 ?auto_1814354 ) ( not ( = ?auto_1814351 ?auto_1814352 ) ) ( not ( = ?auto_1814351 ?auto_1814353 ) ) ( not ( = ?auto_1814351 ?auto_1814355 ) ) ( not ( = ?auto_1814351 ?auto_1814354 ) ) ( not ( = ?auto_1814351 ?auto_1814356 ) ) ( not ( = ?auto_1814351 ?auto_1814357 ) ) ( not ( = ?auto_1814351 ?auto_1814358 ) ) ( not ( = ?auto_1814351 ?auto_1814363 ) ) ( not ( = ?auto_1814352 ?auto_1814353 ) ) ( not ( = ?auto_1814352 ?auto_1814355 ) ) ( not ( = ?auto_1814352 ?auto_1814354 ) ) ( not ( = ?auto_1814352 ?auto_1814356 ) ) ( not ( = ?auto_1814352 ?auto_1814357 ) ) ( not ( = ?auto_1814352 ?auto_1814358 ) ) ( not ( = ?auto_1814352 ?auto_1814363 ) ) ( not ( = ?auto_1814353 ?auto_1814355 ) ) ( not ( = ?auto_1814353 ?auto_1814354 ) ) ( not ( = ?auto_1814353 ?auto_1814356 ) ) ( not ( = ?auto_1814353 ?auto_1814357 ) ) ( not ( = ?auto_1814353 ?auto_1814358 ) ) ( not ( = ?auto_1814353 ?auto_1814363 ) ) ( not ( = ?auto_1814355 ?auto_1814354 ) ) ( not ( = ?auto_1814355 ?auto_1814356 ) ) ( not ( = ?auto_1814355 ?auto_1814357 ) ) ( not ( = ?auto_1814355 ?auto_1814358 ) ) ( not ( = ?auto_1814355 ?auto_1814363 ) ) ( not ( = ?auto_1814354 ?auto_1814356 ) ) ( not ( = ?auto_1814354 ?auto_1814357 ) ) ( not ( = ?auto_1814354 ?auto_1814358 ) ) ( not ( = ?auto_1814354 ?auto_1814363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814356 ?auto_1814357 ?auto_1814358 )
      ( MAKE-7CRATE-VERIFY ?auto_1814351 ?auto_1814352 ?auto_1814353 ?auto_1814355 ?auto_1814354 ?auto_1814356 ?auto_1814357 ?auto_1814358 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814429 - SURFACE
      ?auto_1814430 - SURFACE
      ?auto_1814431 - SURFACE
      ?auto_1814433 - SURFACE
      ?auto_1814432 - SURFACE
      ?auto_1814434 - SURFACE
      ?auto_1814435 - SURFACE
      ?auto_1814436 - SURFACE
    )
    :vars
    (
      ?auto_1814438 - HOIST
      ?auto_1814440 - PLACE
      ?auto_1814442 - PLACE
      ?auto_1814439 - HOIST
      ?auto_1814441 - SURFACE
      ?auto_1814437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814438 ?auto_1814440 ) ( SURFACE-AT ?auto_1814435 ?auto_1814440 ) ( CLEAR ?auto_1814435 ) ( IS-CRATE ?auto_1814436 ) ( not ( = ?auto_1814435 ?auto_1814436 ) ) ( AVAILABLE ?auto_1814438 ) ( ON ?auto_1814435 ?auto_1814434 ) ( not ( = ?auto_1814434 ?auto_1814435 ) ) ( not ( = ?auto_1814434 ?auto_1814436 ) ) ( not ( = ?auto_1814442 ?auto_1814440 ) ) ( HOIST-AT ?auto_1814439 ?auto_1814442 ) ( not ( = ?auto_1814438 ?auto_1814439 ) ) ( AVAILABLE ?auto_1814439 ) ( SURFACE-AT ?auto_1814436 ?auto_1814442 ) ( ON ?auto_1814436 ?auto_1814441 ) ( CLEAR ?auto_1814436 ) ( not ( = ?auto_1814435 ?auto_1814441 ) ) ( not ( = ?auto_1814436 ?auto_1814441 ) ) ( not ( = ?auto_1814434 ?auto_1814441 ) ) ( TRUCK-AT ?auto_1814437 ?auto_1814440 ) ( ON ?auto_1814430 ?auto_1814429 ) ( ON ?auto_1814431 ?auto_1814430 ) ( ON ?auto_1814433 ?auto_1814431 ) ( ON ?auto_1814432 ?auto_1814433 ) ( ON ?auto_1814434 ?auto_1814432 ) ( not ( = ?auto_1814429 ?auto_1814430 ) ) ( not ( = ?auto_1814429 ?auto_1814431 ) ) ( not ( = ?auto_1814429 ?auto_1814433 ) ) ( not ( = ?auto_1814429 ?auto_1814432 ) ) ( not ( = ?auto_1814429 ?auto_1814434 ) ) ( not ( = ?auto_1814429 ?auto_1814435 ) ) ( not ( = ?auto_1814429 ?auto_1814436 ) ) ( not ( = ?auto_1814429 ?auto_1814441 ) ) ( not ( = ?auto_1814430 ?auto_1814431 ) ) ( not ( = ?auto_1814430 ?auto_1814433 ) ) ( not ( = ?auto_1814430 ?auto_1814432 ) ) ( not ( = ?auto_1814430 ?auto_1814434 ) ) ( not ( = ?auto_1814430 ?auto_1814435 ) ) ( not ( = ?auto_1814430 ?auto_1814436 ) ) ( not ( = ?auto_1814430 ?auto_1814441 ) ) ( not ( = ?auto_1814431 ?auto_1814433 ) ) ( not ( = ?auto_1814431 ?auto_1814432 ) ) ( not ( = ?auto_1814431 ?auto_1814434 ) ) ( not ( = ?auto_1814431 ?auto_1814435 ) ) ( not ( = ?auto_1814431 ?auto_1814436 ) ) ( not ( = ?auto_1814431 ?auto_1814441 ) ) ( not ( = ?auto_1814433 ?auto_1814432 ) ) ( not ( = ?auto_1814433 ?auto_1814434 ) ) ( not ( = ?auto_1814433 ?auto_1814435 ) ) ( not ( = ?auto_1814433 ?auto_1814436 ) ) ( not ( = ?auto_1814433 ?auto_1814441 ) ) ( not ( = ?auto_1814432 ?auto_1814434 ) ) ( not ( = ?auto_1814432 ?auto_1814435 ) ) ( not ( = ?auto_1814432 ?auto_1814436 ) ) ( not ( = ?auto_1814432 ?auto_1814441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814434 ?auto_1814435 ?auto_1814436 )
      ( MAKE-7CRATE-VERIFY ?auto_1814429 ?auto_1814430 ?auto_1814431 ?auto_1814433 ?auto_1814432 ?auto_1814434 ?auto_1814435 ?auto_1814436 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814507 - SURFACE
      ?auto_1814508 - SURFACE
      ?auto_1814509 - SURFACE
      ?auto_1814511 - SURFACE
      ?auto_1814510 - SURFACE
      ?auto_1814512 - SURFACE
      ?auto_1814513 - SURFACE
      ?auto_1814514 - SURFACE
    )
    :vars
    (
      ?auto_1814518 - HOIST
      ?auto_1814515 - PLACE
      ?auto_1814517 - PLACE
      ?auto_1814520 - HOIST
      ?auto_1814516 - SURFACE
      ?auto_1814519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814518 ?auto_1814515 ) ( IS-CRATE ?auto_1814514 ) ( not ( = ?auto_1814513 ?auto_1814514 ) ) ( not ( = ?auto_1814512 ?auto_1814513 ) ) ( not ( = ?auto_1814512 ?auto_1814514 ) ) ( not ( = ?auto_1814517 ?auto_1814515 ) ) ( HOIST-AT ?auto_1814520 ?auto_1814517 ) ( not ( = ?auto_1814518 ?auto_1814520 ) ) ( AVAILABLE ?auto_1814520 ) ( SURFACE-AT ?auto_1814514 ?auto_1814517 ) ( ON ?auto_1814514 ?auto_1814516 ) ( CLEAR ?auto_1814514 ) ( not ( = ?auto_1814513 ?auto_1814516 ) ) ( not ( = ?auto_1814514 ?auto_1814516 ) ) ( not ( = ?auto_1814512 ?auto_1814516 ) ) ( TRUCK-AT ?auto_1814519 ?auto_1814515 ) ( SURFACE-AT ?auto_1814512 ?auto_1814515 ) ( CLEAR ?auto_1814512 ) ( LIFTING ?auto_1814518 ?auto_1814513 ) ( IS-CRATE ?auto_1814513 ) ( ON ?auto_1814508 ?auto_1814507 ) ( ON ?auto_1814509 ?auto_1814508 ) ( ON ?auto_1814511 ?auto_1814509 ) ( ON ?auto_1814510 ?auto_1814511 ) ( ON ?auto_1814512 ?auto_1814510 ) ( not ( = ?auto_1814507 ?auto_1814508 ) ) ( not ( = ?auto_1814507 ?auto_1814509 ) ) ( not ( = ?auto_1814507 ?auto_1814511 ) ) ( not ( = ?auto_1814507 ?auto_1814510 ) ) ( not ( = ?auto_1814507 ?auto_1814512 ) ) ( not ( = ?auto_1814507 ?auto_1814513 ) ) ( not ( = ?auto_1814507 ?auto_1814514 ) ) ( not ( = ?auto_1814507 ?auto_1814516 ) ) ( not ( = ?auto_1814508 ?auto_1814509 ) ) ( not ( = ?auto_1814508 ?auto_1814511 ) ) ( not ( = ?auto_1814508 ?auto_1814510 ) ) ( not ( = ?auto_1814508 ?auto_1814512 ) ) ( not ( = ?auto_1814508 ?auto_1814513 ) ) ( not ( = ?auto_1814508 ?auto_1814514 ) ) ( not ( = ?auto_1814508 ?auto_1814516 ) ) ( not ( = ?auto_1814509 ?auto_1814511 ) ) ( not ( = ?auto_1814509 ?auto_1814510 ) ) ( not ( = ?auto_1814509 ?auto_1814512 ) ) ( not ( = ?auto_1814509 ?auto_1814513 ) ) ( not ( = ?auto_1814509 ?auto_1814514 ) ) ( not ( = ?auto_1814509 ?auto_1814516 ) ) ( not ( = ?auto_1814511 ?auto_1814510 ) ) ( not ( = ?auto_1814511 ?auto_1814512 ) ) ( not ( = ?auto_1814511 ?auto_1814513 ) ) ( not ( = ?auto_1814511 ?auto_1814514 ) ) ( not ( = ?auto_1814511 ?auto_1814516 ) ) ( not ( = ?auto_1814510 ?auto_1814512 ) ) ( not ( = ?auto_1814510 ?auto_1814513 ) ) ( not ( = ?auto_1814510 ?auto_1814514 ) ) ( not ( = ?auto_1814510 ?auto_1814516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814512 ?auto_1814513 ?auto_1814514 )
      ( MAKE-7CRATE-VERIFY ?auto_1814507 ?auto_1814508 ?auto_1814509 ?auto_1814511 ?auto_1814510 ?auto_1814512 ?auto_1814513 ?auto_1814514 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1814585 - SURFACE
      ?auto_1814586 - SURFACE
      ?auto_1814587 - SURFACE
      ?auto_1814589 - SURFACE
      ?auto_1814588 - SURFACE
      ?auto_1814590 - SURFACE
      ?auto_1814591 - SURFACE
      ?auto_1814592 - SURFACE
    )
    :vars
    (
      ?auto_1814596 - HOIST
      ?auto_1814597 - PLACE
      ?auto_1814594 - PLACE
      ?auto_1814598 - HOIST
      ?auto_1814593 - SURFACE
      ?auto_1814595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814596 ?auto_1814597 ) ( IS-CRATE ?auto_1814592 ) ( not ( = ?auto_1814591 ?auto_1814592 ) ) ( not ( = ?auto_1814590 ?auto_1814591 ) ) ( not ( = ?auto_1814590 ?auto_1814592 ) ) ( not ( = ?auto_1814594 ?auto_1814597 ) ) ( HOIST-AT ?auto_1814598 ?auto_1814594 ) ( not ( = ?auto_1814596 ?auto_1814598 ) ) ( AVAILABLE ?auto_1814598 ) ( SURFACE-AT ?auto_1814592 ?auto_1814594 ) ( ON ?auto_1814592 ?auto_1814593 ) ( CLEAR ?auto_1814592 ) ( not ( = ?auto_1814591 ?auto_1814593 ) ) ( not ( = ?auto_1814592 ?auto_1814593 ) ) ( not ( = ?auto_1814590 ?auto_1814593 ) ) ( TRUCK-AT ?auto_1814595 ?auto_1814597 ) ( SURFACE-AT ?auto_1814590 ?auto_1814597 ) ( CLEAR ?auto_1814590 ) ( IS-CRATE ?auto_1814591 ) ( AVAILABLE ?auto_1814596 ) ( IN ?auto_1814591 ?auto_1814595 ) ( ON ?auto_1814586 ?auto_1814585 ) ( ON ?auto_1814587 ?auto_1814586 ) ( ON ?auto_1814589 ?auto_1814587 ) ( ON ?auto_1814588 ?auto_1814589 ) ( ON ?auto_1814590 ?auto_1814588 ) ( not ( = ?auto_1814585 ?auto_1814586 ) ) ( not ( = ?auto_1814585 ?auto_1814587 ) ) ( not ( = ?auto_1814585 ?auto_1814589 ) ) ( not ( = ?auto_1814585 ?auto_1814588 ) ) ( not ( = ?auto_1814585 ?auto_1814590 ) ) ( not ( = ?auto_1814585 ?auto_1814591 ) ) ( not ( = ?auto_1814585 ?auto_1814592 ) ) ( not ( = ?auto_1814585 ?auto_1814593 ) ) ( not ( = ?auto_1814586 ?auto_1814587 ) ) ( not ( = ?auto_1814586 ?auto_1814589 ) ) ( not ( = ?auto_1814586 ?auto_1814588 ) ) ( not ( = ?auto_1814586 ?auto_1814590 ) ) ( not ( = ?auto_1814586 ?auto_1814591 ) ) ( not ( = ?auto_1814586 ?auto_1814592 ) ) ( not ( = ?auto_1814586 ?auto_1814593 ) ) ( not ( = ?auto_1814587 ?auto_1814589 ) ) ( not ( = ?auto_1814587 ?auto_1814588 ) ) ( not ( = ?auto_1814587 ?auto_1814590 ) ) ( not ( = ?auto_1814587 ?auto_1814591 ) ) ( not ( = ?auto_1814587 ?auto_1814592 ) ) ( not ( = ?auto_1814587 ?auto_1814593 ) ) ( not ( = ?auto_1814589 ?auto_1814588 ) ) ( not ( = ?auto_1814589 ?auto_1814590 ) ) ( not ( = ?auto_1814589 ?auto_1814591 ) ) ( not ( = ?auto_1814589 ?auto_1814592 ) ) ( not ( = ?auto_1814589 ?auto_1814593 ) ) ( not ( = ?auto_1814588 ?auto_1814590 ) ) ( not ( = ?auto_1814588 ?auto_1814591 ) ) ( not ( = ?auto_1814588 ?auto_1814592 ) ) ( not ( = ?auto_1814588 ?auto_1814593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1814590 ?auto_1814591 ?auto_1814592 )
      ( MAKE-7CRATE-VERIFY ?auto_1814585 ?auto_1814586 ?auto_1814587 ?auto_1814589 ?auto_1814588 ?auto_1814590 ?auto_1814591 ?auto_1814592 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817504 - SURFACE
      ?auto_1817505 - SURFACE
      ?auto_1817506 - SURFACE
      ?auto_1817508 - SURFACE
      ?auto_1817507 - SURFACE
      ?auto_1817509 - SURFACE
      ?auto_1817510 - SURFACE
      ?auto_1817511 - SURFACE
      ?auto_1817512 - SURFACE
    )
    :vars
    (
      ?auto_1817513 - HOIST
      ?auto_1817514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817513 ?auto_1817514 ) ( SURFACE-AT ?auto_1817511 ?auto_1817514 ) ( CLEAR ?auto_1817511 ) ( LIFTING ?auto_1817513 ?auto_1817512 ) ( IS-CRATE ?auto_1817512 ) ( not ( = ?auto_1817511 ?auto_1817512 ) ) ( ON ?auto_1817505 ?auto_1817504 ) ( ON ?auto_1817506 ?auto_1817505 ) ( ON ?auto_1817508 ?auto_1817506 ) ( ON ?auto_1817507 ?auto_1817508 ) ( ON ?auto_1817509 ?auto_1817507 ) ( ON ?auto_1817510 ?auto_1817509 ) ( ON ?auto_1817511 ?auto_1817510 ) ( not ( = ?auto_1817504 ?auto_1817505 ) ) ( not ( = ?auto_1817504 ?auto_1817506 ) ) ( not ( = ?auto_1817504 ?auto_1817508 ) ) ( not ( = ?auto_1817504 ?auto_1817507 ) ) ( not ( = ?auto_1817504 ?auto_1817509 ) ) ( not ( = ?auto_1817504 ?auto_1817510 ) ) ( not ( = ?auto_1817504 ?auto_1817511 ) ) ( not ( = ?auto_1817504 ?auto_1817512 ) ) ( not ( = ?auto_1817505 ?auto_1817506 ) ) ( not ( = ?auto_1817505 ?auto_1817508 ) ) ( not ( = ?auto_1817505 ?auto_1817507 ) ) ( not ( = ?auto_1817505 ?auto_1817509 ) ) ( not ( = ?auto_1817505 ?auto_1817510 ) ) ( not ( = ?auto_1817505 ?auto_1817511 ) ) ( not ( = ?auto_1817505 ?auto_1817512 ) ) ( not ( = ?auto_1817506 ?auto_1817508 ) ) ( not ( = ?auto_1817506 ?auto_1817507 ) ) ( not ( = ?auto_1817506 ?auto_1817509 ) ) ( not ( = ?auto_1817506 ?auto_1817510 ) ) ( not ( = ?auto_1817506 ?auto_1817511 ) ) ( not ( = ?auto_1817506 ?auto_1817512 ) ) ( not ( = ?auto_1817508 ?auto_1817507 ) ) ( not ( = ?auto_1817508 ?auto_1817509 ) ) ( not ( = ?auto_1817508 ?auto_1817510 ) ) ( not ( = ?auto_1817508 ?auto_1817511 ) ) ( not ( = ?auto_1817508 ?auto_1817512 ) ) ( not ( = ?auto_1817507 ?auto_1817509 ) ) ( not ( = ?auto_1817507 ?auto_1817510 ) ) ( not ( = ?auto_1817507 ?auto_1817511 ) ) ( not ( = ?auto_1817507 ?auto_1817512 ) ) ( not ( = ?auto_1817509 ?auto_1817510 ) ) ( not ( = ?auto_1817509 ?auto_1817511 ) ) ( not ( = ?auto_1817509 ?auto_1817512 ) ) ( not ( = ?auto_1817510 ?auto_1817511 ) ) ( not ( = ?auto_1817510 ?auto_1817512 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1817511 ?auto_1817512 )
      ( MAKE-8CRATE-VERIFY ?auto_1817504 ?auto_1817505 ?auto_1817506 ?auto_1817508 ?auto_1817507 ?auto_1817509 ?auto_1817510 ?auto_1817511 ?auto_1817512 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817571 - SURFACE
      ?auto_1817572 - SURFACE
      ?auto_1817573 - SURFACE
      ?auto_1817575 - SURFACE
      ?auto_1817574 - SURFACE
      ?auto_1817576 - SURFACE
      ?auto_1817577 - SURFACE
      ?auto_1817578 - SURFACE
      ?auto_1817579 - SURFACE
    )
    :vars
    (
      ?auto_1817580 - HOIST
      ?auto_1817581 - PLACE
      ?auto_1817582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817580 ?auto_1817581 ) ( SURFACE-AT ?auto_1817578 ?auto_1817581 ) ( CLEAR ?auto_1817578 ) ( IS-CRATE ?auto_1817579 ) ( not ( = ?auto_1817578 ?auto_1817579 ) ) ( TRUCK-AT ?auto_1817582 ?auto_1817581 ) ( AVAILABLE ?auto_1817580 ) ( IN ?auto_1817579 ?auto_1817582 ) ( ON ?auto_1817578 ?auto_1817577 ) ( not ( = ?auto_1817577 ?auto_1817578 ) ) ( not ( = ?auto_1817577 ?auto_1817579 ) ) ( ON ?auto_1817572 ?auto_1817571 ) ( ON ?auto_1817573 ?auto_1817572 ) ( ON ?auto_1817575 ?auto_1817573 ) ( ON ?auto_1817574 ?auto_1817575 ) ( ON ?auto_1817576 ?auto_1817574 ) ( ON ?auto_1817577 ?auto_1817576 ) ( not ( = ?auto_1817571 ?auto_1817572 ) ) ( not ( = ?auto_1817571 ?auto_1817573 ) ) ( not ( = ?auto_1817571 ?auto_1817575 ) ) ( not ( = ?auto_1817571 ?auto_1817574 ) ) ( not ( = ?auto_1817571 ?auto_1817576 ) ) ( not ( = ?auto_1817571 ?auto_1817577 ) ) ( not ( = ?auto_1817571 ?auto_1817578 ) ) ( not ( = ?auto_1817571 ?auto_1817579 ) ) ( not ( = ?auto_1817572 ?auto_1817573 ) ) ( not ( = ?auto_1817572 ?auto_1817575 ) ) ( not ( = ?auto_1817572 ?auto_1817574 ) ) ( not ( = ?auto_1817572 ?auto_1817576 ) ) ( not ( = ?auto_1817572 ?auto_1817577 ) ) ( not ( = ?auto_1817572 ?auto_1817578 ) ) ( not ( = ?auto_1817572 ?auto_1817579 ) ) ( not ( = ?auto_1817573 ?auto_1817575 ) ) ( not ( = ?auto_1817573 ?auto_1817574 ) ) ( not ( = ?auto_1817573 ?auto_1817576 ) ) ( not ( = ?auto_1817573 ?auto_1817577 ) ) ( not ( = ?auto_1817573 ?auto_1817578 ) ) ( not ( = ?auto_1817573 ?auto_1817579 ) ) ( not ( = ?auto_1817575 ?auto_1817574 ) ) ( not ( = ?auto_1817575 ?auto_1817576 ) ) ( not ( = ?auto_1817575 ?auto_1817577 ) ) ( not ( = ?auto_1817575 ?auto_1817578 ) ) ( not ( = ?auto_1817575 ?auto_1817579 ) ) ( not ( = ?auto_1817574 ?auto_1817576 ) ) ( not ( = ?auto_1817574 ?auto_1817577 ) ) ( not ( = ?auto_1817574 ?auto_1817578 ) ) ( not ( = ?auto_1817574 ?auto_1817579 ) ) ( not ( = ?auto_1817576 ?auto_1817577 ) ) ( not ( = ?auto_1817576 ?auto_1817578 ) ) ( not ( = ?auto_1817576 ?auto_1817579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1817577 ?auto_1817578 ?auto_1817579 )
      ( MAKE-8CRATE-VERIFY ?auto_1817571 ?auto_1817572 ?auto_1817573 ?auto_1817575 ?auto_1817574 ?auto_1817576 ?auto_1817577 ?auto_1817578 ?auto_1817579 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817647 - SURFACE
      ?auto_1817648 - SURFACE
      ?auto_1817649 - SURFACE
      ?auto_1817651 - SURFACE
      ?auto_1817650 - SURFACE
      ?auto_1817652 - SURFACE
      ?auto_1817653 - SURFACE
      ?auto_1817654 - SURFACE
      ?auto_1817655 - SURFACE
    )
    :vars
    (
      ?auto_1817657 - HOIST
      ?auto_1817659 - PLACE
      ?auto_1817656 - TRUCK
      ?auto_1817658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817657 ?auto_1817659 ) ( SURFACE-AT ?auto_1817654 ?auto_1817659 ) ( CLEAR ?auto_1817654 ) ( IS-CRATE ?auto_1817655 ) ( not ( = ?auto_1817654 ?auto_1817655 ) ) ( AVAILABLE ?auto_1817657 ) ( IN ?auto_1817655 ?auto_1817656 ) ( ON ?auto_1817654 ?auto_1817653 ) ( not ( = ?auto_1817653 ?auto_1817654 ) ) ( not ( = ?auto_1817653 ?auto_1817655 ) ) ( TRUCK-AT ?auto_1817656 ?auto_1817658 ) ( not ( = ?auto_1817658 ?auto_1817659 ) ) ( ON ?auto_1817648 ?auto_1817647 ) ( ON ?auto_1817649 ?auto_1817648 ) ( ON ?auto_1817651 ?auto_1817649 ) ( ON ?auto_1817650 ?auto_1817651 ) ( ON ?auto_1817652 ?auto_1817650 ) ( ON ?auto_1817653 ?auto_1817652 ) ( not ( = ?auto_1817647 ?auto_1817648 ) ) ( not ( = ?auto_1817647 ?auto_1817649 ) ) ( not ( = ?auto_1817647 ?auto_1817651 ) ) ( not ( = ?auto_1817647 ?auto_1817650 ) ) ( not ( = ?auto_1817647 ?auto_1817652 ) ) ( not ( = ?auto_1817647 ?auto_1817653 ) ) ( not ( = ?auto_1817647 ?auto_1817654 ) ) ( not ( = ?auto_1817647 ?auto_1817655 ) ) ( not ( = ?auto_1817648 ?auto_1817649 ) ) ( not ( = ?auto_1817648 ?auto_1817651 ) ) ( not ( = ?auto_1817648 ?auto_1817650 ) ) ( not ( = ?auto_1817648 ?auto_1817652 ) ) ( not ( = ?auto_1817648 ?auto_1817653 ) ) ( not ( = ?auto_1817648 ?auto_1817654 ) ) ( not ( = ?auto_1817648 ?auto_1817655 ) ) ( not ( = ?auto_1817649 ?auto_1817651 ) ) ( not ( = ?auto_1817649 ?auto_1817650 ) ) ( not ( = ?auto_1817649 ?auto_1817652 ) ) ( not ( = ?auto_1817649 ?auto_1817653 ) ) ( not ( = ?auto_1817649 ?auto_1817654 ) ) ( not ( = ?auto_1817649 ?auto_1817655 ) ) ( not ( = ?auto_1817651 ?auto_1817650 ) ) ( not ( = ?auto_1817651 ?auto_1817652 ) ) ( not ( = ?auto_1817651 ?auto_1817653 ) ) ( not ( = ?auto_1817651 ?auto_1817654 ) ) ( not ( = ?auto_1817651 ?auto_1817655 ) ) ( not ( = ?auto_1817650 ?auto_1817652 ) ) ( not ( = ?auto_1817650 ?auto_1817653 ) ) ( not ( = ?auto_1817650 ?auto_1817654 ) ) ( not ( = ?auto_1817650 ?auto_1817655 ) ) ( not ( = ?auto_1817652 ?auto_1817653 ) ) ( not ( = ?auto_1817652 ?auto_1817654 ) ) ( not ( = ?auto_1817652 ?auto_1817655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1817653 ?auto_1817654 ?auto_1817655 )
      ( MAKE-8CRATE-VERIFY ?auto_1817647 ?auto_1817648 ?auto_1817649 ?auto_1817651 ?auto_1817650 ?auto_1817652 ?auto_1817653 ?auto_1817654 ?auto_1817655 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817731 - SURFACE
      ?auto_1817732 - SURFACE
      ?auto_1817733 - SURFACE
      ?auto_1817735 - SURFACE
      ?auto_1817734 - SURFACE
      ?auto_1817736 - SURFACE
      ?auto_1817737 - SURFACE
      ?auto_1817738 - SURFACE
      ?auto_1817739 - SURFACE
    )
    :vars
    (
      ?auto_1817744 - HOIST
      ?auto_1817741 - PLACE
      ?auto_1817740 - TRUCK
      ?auto_1817742 - PLACE
      ?auto_1817743 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817744 ?auto_1817741 ) ( SURFACE-AT ?auto_1817738 ?auto_1817741 ) ( CLEAR ?auto_1817738 ) ( IS-CRATE ?auto_1817739 ) ( not ( = ?auto_1817738 ?auto_1817739 ) ) ( AVAILABLE ?auto_1817744 ) ( ON ?auto_1817738 ?auto_1817737 ) ( not ( = ?auto_1817737 ?auto_1817738 ) ) ( not ( = ?auto_1817737 ?auto_1817739 ) ) ( TRUCK-AT ?auto_1817740 ?auto_1817742 ) ( not ( = ?auto_1817742 ?auto_1817741 ) ) ( HOIST-AT ?auto_1817743 ?auto_1817742 ) ( LIFTING ?auto_1817743 ?auto_1817739 ) ( not ( = ?auto_1817744 ?auto_1817743 ) ) ( ON ?auto_1817732 ?auto_1817731 ) ( ON ?auto_1817733 ?auto_1817732 ) ( ON ?auto_1817735 ?auto_1817733 ) ( ON ?auto_1817734 ?auto_1817735 ) ( ON ?auto_1817736 ?auto_1817734 ) ( ON ?auto_1817737 ?auto_1817736 ) ( not ( = ?auto_1817731 ?auto_1817732 ) ) ( not ( = ?auto_1817731 ?auto_1817733 ) ) ( not ( = ?auto_1817731 ?auto_1817735 ) ) ( not ( = ?auto_1817731 ?auto_1817734 ) ) ( not ( = ?auto_1817731 ?auto_1817736 ) ) ( not ( = ?auto_1817731 ?auto_1817737 ) ) ( not ( = ?auto_1817731 ?auto_1817738 ) ) ( not ( = ?auto_1817731 ?auto_1817739 ) ) ( not ( = ?auto_1817732 ?auto_1817733 ) ) ( not ( = ?auto_1817732 ?auto_1817735 ) ) ( not ( = ?auto_1817732 ?auto_1817734 ) ) ( not ( = ?auto_1817732 ?auto_1817736 ) ) ( not ( = ?auto_1817732 ?auto_1817737 ) ) ( not ( = ?auto_1817732 ?auto_1817738 ) ) ( not ( = ?auto_1817732 ?auto_1817739 ) ) ( not ( = ?auto_1817733 ?auto_1817735 ) ) ( not ( = ?auto_1817733 ?auto_1817734 ) ) ( not ( = ?auto_1817733 ?auto_1817736 ) ) ( not ( = ?auto_1817733 ?auto_1817737 ) ) ( not ( = ?auto_1817733 ?auto_1817738 ) ) ( not ( = ?auto_1817733 ?auto_1817739 ) ) ( not ( = ?auto_1817735 ?auto_1817734 ) ) ( not ( = ?auto_1817735 ?auto_1817736 ) ) ( not ( = ?auto_1817735 ?auto_1817737 ) ) ( not ( = ?auto_1817735 ?auto_1817738 ) ) ( not ( = ?auto_1817735 ?auto_1817739 ) ) ( not ( = ?auto_1817734 ?auto_1817736 ) ) ( not ( = ?auto_1817734 ?auto_1817737 ) ) ( not ( = ?auto_1817734 ?auto_1817738 ) ) ( not ( = ?auto_1817734 ?auto_1817739 ) ) ( not ( = ?auto_1817736 ?auto_1817737 ) ) ( not ( = ?auto_1817736 ?auto_1817738 ) ) ( not ( = ?auto_1817736 ?auto_1817739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1817737 ?auto_1817738 ?auto_1817739 )
      ( MAKE-8CRATE-VERIFY ?auto_1817731 ?auto_1817732 ?auto_1817733 ?auto_1817735 ?auto_1817734 ?auto_1817736 ?auto_1817737 ?auto_1817738 ?auto_1817739 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817823 - SURFACE
      ?auto_1817824 - SURFACE
      ?auto_1817825 - SURFACE
      ?auto_1817827 - SURFACE
      ?auto_1817826 - SURFACE
      ?auto_1817828 - SURFACE
      ?auto_1817829 - SURFACE
      ?auto_1817830 - SURFACE
      ?auto_1817831 - SURFACE
    )
    :vars
    (
      ?auto_1817832 - HOIST
      ?auto_1817833 - PLACE
      ?auto_1817836 - TRUCK
      ?auto_1817834 - PLACE
      ?auto_1817835 - HOIST
      ?auto_1817837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817832 ?auto_1817833 ) ( SURFACE-AT ?auto_1817830 ?auto_1817833 ) ( CLEAR ?auto_1817830 ) ( IS-CRATE ?auto_1817831 ) ( not ( = ?auto_1817830 ?auto_1817831 ) ) ( AVAILABLE ?auto_1817832 ) ( ON ?auto_1817830 ?auto_1817829 ) ( not ( = ?auto_1817829 ?auto_1817830 ) ) ( not ( = ?auto_1817829 ?auto_1817831 ) ) ( TRUCK-AT ?auto_1817836 ?auto_1817834 ) ( not ( = ?auto_1817834 ?auto_1817833 ) ) ( HOIST-AT ?auto_1817835 ?auto_1817834 ) ( not ( = ?auto_1817832 ?auto_1817835 ) ) ( AVAILABLE ?auto_1817835 ) ( SURFACE-AT ?auto_1817831 ?auto_1817834 ) ( ON ?auto_1817831 ?auto_1817837 ) ( CLEAR ?auto_1817831 ) ( not ( = ?auto_1817830 ?auto_1817837 ) ) ( not ( = ?auto_1817831 ?auto_1817837 ) ) ( not ( = ?auto_1817829 ?auto_1817837 ) ) ( ON ?auto_1817824 ?auto_1817823 ) ( ON ?auto_1817825 ?auto_1817824 ) ( ON ?auto_1817827 ?auto_1817825 ) ( ON ?auto_1817826 ?auto_1817827 ) ( ON ?auto_1817828 ?auto_1817826 ) ( ON ?auto_1817829 ?auto_1817828 ) ( not ( = ?auto_1817823 ?auto_1817824 ) ) ( not ( = ?auto_1817823 ?auto_1817825 ) ) ( not ( = ?auto_1817823 ?auto_1817827 ) ) ( not ( = ?auto_1817823 ?auto_1817826 ) ) ( not ( = ?auto_1817823 ?auto_1817828 ) ) ( not ( = ?auto_1817823 ?auto_1817829 ) ) ( not ( = ?auto_1817823 ?auto_1817830 ) ) ( not ( = ?auto_1817823 ?auto_1817831 ) ) ( not ( = ?auto_1817823 ?auto_1817837 ) ) ( not ( = ?auto_1817824 ?auto_1817825 ) ) ( not ( = ?auto_1817824 ?auto_1817827 ) ) ( not ( = ?auto_1817824 ?auto_1817826 ) ) ( not ( = ?auto_1817824 ?auto_1817828 ) ) ( not ( = ?auto_1817824 ?auto_1817829 ) ) ( not ( = ?auto_1817824 ?auto_1817830 ) ) ( not ( = ?auto_1817824 ?auto_1817831 ) ) ( not ( = ?auto_1817824 ?auto_1817837 ) ) ( not ( = ?auto_1817825 ?auto_1817827 ) ) ( not ( = ?auto_1817825 ?auto_1817826 ) ) ( not ( = ?auto_1817825 ?auto_1817828 ) ) ( not ( = ?auto_1817825 ?auto_1817829 ) ) ( not ( = ?auto_1817825 ?auto_1817830 ) ) ( not ( = ?auto_1817825 ?auto_1817831 ) ) ( not ( = ?auto_1817825 ?auto_1817837 ) ) ( not ( = ?auto_1817827 ?auto_1817826 ) ) ( not ( = ?auto_1817827 ?auto_1817828 ) ) ( not ( = ?auto_1817827 ?auto_1817829 ) ) ( not ( = ?auto_1817827 ?auto_1817830 ) ) ( not ( = ?auto_1817827 ?auto_1817831 ) ) ( not ( = ?auto_1817827 ?auto_1817837 ) ) ( not ( = ?auto_1817826 ?auto_1817828 ) ) ( not ( = ?auto_1817826 ?auto_1817829 ) ) ( not ( = ?auto_1817826 ?auto_1817830 ) ) ( not ( = ?auto_1817826 ?auto_1817831 ) ) ( not ( = ?auto_1817826 ?auto_1817837 ) ) ( not ( = ?auto_1817828 ?auto_1817829 ) ) ( not ( = ?auto_1817828 ?auto_1817830 ) ) ( not ( = ?auto_1817828 ?auto_1817831 ) ) ( not ( = ?auto_1817828 ?auto_1817837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1817829 ?auto_1817830 ?auto_1817831 )
      ( MAKE-8CRATE-VERIFY ?auto_1817823 ?auto_1817824 ?auto_1817825 ?auto_1817827 ?auto_1817826 ?auto_1817828 ?auto_1817829 ?auto_1817830 ?auto_1817831 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1817916 - SURFACE
      ?auto_1817917 - SURFACE
      ?auto_1817918 - SURFACE
      ?auto_1817920 - SURFACE
      ?auto_1817919 - SURFACE
      ?auto_1817921 - SURFACE
      ?auto_1817922 - SURFACE
      ?auto_1817923 - SURFACE
      ?auto_1817924 - SURFACE
    )
    :vars
    (
      ?auto_1817925 - HOIST
      ?auto_1817926 - PLACE
      ?auto_1817930 - PLACE
      ?auto_1817929 - HOIST
      ?auto_1817927 - SURFACE
      ?auto_1817928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1817925 ?auto_1817926 ) ( SURFACE-AT ?auto_1817923 ?auto_1817926 ) ( CLEAR ?auto_1817923 ) ( IS-CRATE ?auto_1817924 ) ( not ( = ?auto_1817923 ?auto_1817924 ) ) ( AVAILABLE ?auto_1817925 ) ( ON ?auto_1817923 ?auto_1817922 ) ( not ( = ?auto_1817922 ?auto_1817923 ) ) ( not ( = ?auto_1817922 ?auto_1817924 ) ) ( not ( = ?auto_1817930 ?auto_1817926 ) ) ( HOIST-AT ?auto_1817929 ?auto_1817930 ) ( not ( = ?auto_1817925 ?auto_1817929 ) ) ( AVAILABLE ?auto_1817929 ) ( SURFACE-AT ?auto_1817924 ?auto_1817930 ) ( ON ?auto_1817924 ?auto_1817927 ) ( CLEAR ?auto_1817924 ) ( not ( = ?auto_1817923 ?auto_1817927 ) ) ( not ( = ?auto_1817924 ?auto_1817927 ) ) ( not ( = ?auto_1817922 ?auto_1817927 ) ) ( TRUCK-AT ?auto_1817928 ?auto_1817926 ) ( ON ?auto_1817917 ?auto_1817916 ) ( ON ?auto_1817918 ?auto_1817917 ) ( ON ?auto_1817920 ?auto_1817918 ) ( ON ?auto_1817919 ?auto_1817920 ) ( ON ?auto_1817921 ?auto_1817919 ) ( ON ?auto_1817922 ?auto_1817921 ) ( not ( = ?auto_1817916 ?auto_1817917 ) ) ( not ( = ?auto_1817916 ?auto_1817918 ) ) ( not ( = ?auto_1817916 ?auto_1817920 ) ) ( not ( = ?auto_1817916 ?auto_1817919 ) ) ( not ( = ?auto_1817916 ?auto_1817921 ) ) ( not ( = ?auto_1817916 ?auto_1817922 ) ) ( not ( = ?auto_1817916 ?auto_1817923 ) ) ( not ( = ?auto_1817916 ?auto_1817924 ) ) ( not ( = ?auto_1817916 ?auto_1817927 ) ) ( not ( = ?auto_1817917 ?auto_1817918 ) ) ( not ( = ?auto_1817917 ?auto_1817920 ) ) ( not ( = ?auto_1817917 ?auto_1817919 ) ) ( not ( = ?auto_1817917 ?auto_1817921 ) ) ( not ( = ?auto_1817917 ?auto_1817922 ) ) ( not ( = ?auto_1817917 ?auto_1817923 ) ) ( not ( = ?auto_1817917 ?auto_1817924 ) ) ( not ( = ?auto_1817917 ?auto_1817927 ) ) ( not ( = ?auto_1817918 ?auto_1817920 ) ) ( not ( = ?auto_1817918 ?auto_1817919 ) ) ( not ( = ?auto_1817918 ?auto_1817921 ) ) ( not ( = ?auto_1817918 ?auto_1817922 ) ) ( not ( = ?auto_1817918 ?auto_1817923 ) ) ( not ( = ?auto_1817918 ?auto_1817924 ) ) ( not ( = ?auto_1817918 ?auto_1817927 ) ) ( not ( = ?auto_1817920 ?auto_1817919 ) ) ( not ( = ?auto_1817920 ?auto_1817921 ) ) ( not ( = ?auto_1817920 ?auto_1817922 ) ) ( not ( = ?auto_1817920 ?auto_1817923 ) ) ( not ( = ?auto_1817920 ?auto_1817924 ) ) ( not ( = ?auto_1817920 ?auto_1817927 ) ) ( not ( = ?auto_1817919 ?auto_1817921 ) ) ( not ( = ?auto_1817919 ?auto_1817922 ) ) ( not ( = ?auto_1817919 ?auto_1817923 ) ) ( not ( = ?auto_1817919 ?auto_1817924 ) ) ( not ( = ?auto_1817919 ?auto_1817927 ) ) ( not ( = ?auto_1817921 ?auto_1817922 ) ) ( not ( = ?auto_1817921 ?auto_1817923 ) ) ( not ( = ?auto_1817921 ?auto_1817924 ) ) ( not ( = ?auto_1817921 ?auto_1817927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1817922 ?auto_1817923 ?auto_1817924 )
      ( MAKE-8CRATE-VERIFY ?auto_1817916 ?auto_1817917 ?auto_1817918 ?auto_1817920 ?auto_1817919 ?auto_1817921 ?auto_1817922 ?auto_1817923 ?auto_1817924 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818009 - SURFACE
      ?auto_1818010 - SURFACE
      ?auto_1818011 - SURFACE
      ?auto_1818013 - SURFACE
      ?auto_1818012 - SURFACE
      ?auto_1818014 - SURFACE
      ?auto_1818015 - SURFACE
      ?auto_1818016 - SURFACE
      ?auto_1818017 - SURFACE
    )
    :vars
    (
      ?auto_1818022 - HOIST
      ?auto_1818023 - PLACE
      ?auto_1818020 - PLACE
      ?auto_1818018 - HOIST
      ?auto_1818021 - SURFACE
      ?auto_1818019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818022 ?auto_1818023 ) ( IS-CRATE ?auto_1818017 ) ( not ( = ?auto_1818016 ?auto_1818017 ) ) ( not ( = ?auto_1818015 ?auto_1818016 ) ) ( not ( = ?auto_1818015 ?auto_1818017 ) ) ( not ( = ?auto_1818020 ?auto_1818023 ) ) ( HOIST-AT ?auto_1818018 ?auto_1818020 ) ( not ( = ?auto_1818022 ?auto_1818018 ) ) ( AVAILABLE ?auto_1818018 ) ( SURFACE-AT ?auto_1818017 ?auto_1818020 ) ( ON ?auto_1818017 ?auto_1818021 ) ( CLEAR ?auto_1818017 ) ( not ( = ?auto_1818016 ?auto_1818021 ) ) ( not ( = ?auto_1818017 ?auto_1818021 ) ) ( not ( = ?auto_1818015 ?auto_1818021 ) ) ( TRUCK-AT ?auto_1818019 ?auto_1818023 ) ( SURFACE-AT ?auto_1818015 ?auto_1818023 ) ( CLEAR ?auto_1818015 ) ( LIFTING ?auto_1818022 ?auto_1818016 ) ( IS-CRATE ?auto_1818016 ) ( ON ?auto_1818010 ?auto_1818009 ) ( ON ?auto_1818011 ?auto_1818010 ) ( ON ?auto_1818013 ?auto_1818011 ) ( ON ?auto_1818012 ?auto_1818013 ) ( ON ?auto_1818014 ?auto_1818012 ) ( ON ?auto_1818015 ?auto_1818014 ) ( not ( = ?auto_1818009 ?auto_1818010 ) ) ( not ( = ?auto_1818009 ?auto_1818011 ) ) ( not ( = ?auto_1818009 ?auto_1818013 ) ) ( not ( = ?auto_1818009 ?auto_1818012 ) ) ( not ( = ?auto_1818009 ?auto_1818014 ) ) ( not ( = ?auto_1818009 ?auto_1818015 ) ) ( not ( = ?auto_1818009 ?auto_1818016 ) ) ( not ( = ?auto_1818009 ?auto_1818017 ) ) ( not ( = ?auto_1818009 ?auto_1818021 ) ) ( not ( = ?auto_1818010 ?auto_1818011 ) ) ( not ( = ?auto_1818010 ?auto_1818013 ) ) ( not ( = ?auto_1818010 ?auto_1818012 ) ) ( not ( = ?auto_1818010 ?auto_1818014 ) ) ( not ( = ?auto_1818010 ?auto_1818015 ) ) ( not ( = ?auto_1818010 ?auto_1818016 ) ) ( not ( = ?auto_1818010 ?auto_1818017 ) ) ( not ( = ?auto_1818010 ?auto_1818021 ) ) ( not ( = ?auto_1818011 ?auto_1818013 ) ) ( not ( = ?auto_1818011 ?auto_1818012 ) ) ( not ( = ?auto_1818011 ?auto_1818014 ) ) ( not ( = ?auto_1818011 ?auto_1818015 ) ) ( not ( = ?auto_1818011 ?auto_1818016 ) ) ( not ( = ?auto_1818011 ?auto_1818017 ) ) ( not ( = ?auto_1818011 ?auto_1818021 ) ) ( not ( = ?auto_1818013 ?auto_1818012 ) ) ( not ( = ?auto_1818013 ?auto_1818014 ) ) ( not ( = ?auto_1818013 ?auto_1818015 ) ) ( not ( = ?auto_1818013 ?auto_1818016 ) ) ( not ( = ?auto_1818013 ?auto_1818017 ) ) ( not ( = ?auto_1818013 ?auto_1818021 ) ) ( not ( = ?auto_1818012 ?auto_1818014 ) ) ( not ( = ?auto_1818012 ?auto_1818015 ) ) ( not ( = ?auto_1818012 ?auto_1818016 ) ) ( not ( = ?auto_1818012 ?auto_1818017 ) ) ( not ( = ?auto_1818012 ?auto_1818021 ) ) ( not ( = ?auto_1818014 ?auto_1818015 ) ) ( not ( = ?auto_1818014 ?auto_1818016 ) ) ( not ( = ?auto_1818014 ?auto_1818017 ) ) ( not ( = ?auto_1818014 ?auto_1818021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818015 ?auto_1818016 ?auto_1818017 )
      ( MAKE-8CRATE-VERIFY ?auto_1818009 ?auto_1818010 ?auto_1818011 ?auto_1818013 ?auto_1818012 ?auto_1818014 ?auto_1818015 ?auto_1818016 ?auto_1818017 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1818102 - SURFACE
      ?auto_1818103 - SURFACE
      ?auto_1818104 - SURFACE
      ?auto_1818106 - SURFACE
      ?auto_1818105 - SURFACE
      ?auto_1818107 - SURFACE
      ?auto_1818108 - SURFACE
      ?auto_1818109 - SURFACE
      ?auto_1818110 - SURFACE
    )
    :vars
    (
      ?auto_1818115 - HOIST
      ?auto_1818111 - PLACE
      ?auto_1818113 - PLACE
      ?auto_1818116 - HOIST
      ?auto_1818114 - SURFACE
      ?auto_1818112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818115 ?auto_1818111 ) ( IS-CRATE ?auto_1818110 ) ( not ( = ?auto_1818109 ?auto_1818110 ) ) ( not ( = ?auto_1818108 ?auto_1818109 ) ) ( not ( = ?auto_1818108 ?auto_1818110 ) ) ( not ( = ?auto_1818113 ?auto_1818111 ) ) ( HOIST-AT ?auto_1818116 ?auto_1818113 ) ( not ( = ?auto_1818115 ?auto_1818116 ) ) ( AVAILABLE ?auto_1818116 ) ( SURFACE-AT ?auto_1818110 ?auto_1818113 ) ( ON ?auto_1818110 ?auto_1818114 ) ( CLEAR ?auto_1818110 ) ( not ( = ?auto_1818109 ?auto_1818114 ) ) ( not ( = ?auto_1818110 ?auto_1818114 ) ) ( not ( = ?auto_1818108 ?auto_1818114 ) ) ( TRUCK-AT ?auto_1818112 ?auto_1818111 ) ( SURFACE-AT ?auto_1818108 ?auto_1818111 ) ( CLEAR ?auto_1818108 ) ( IS-CRATE ?auto_1818109 ) ( AVAILABLE ?auto_1818115 ) ( IN ?auto_1818109 ?auto_1818112 ) ( ON ?auto_1818103 ?auto_1818102 ) ( ON ?auto_1818104 ?auto_1818103 ) ( ON ?auto_1818106 ?auto_1818104 ) ( ON ?auto_1818105 ?auto_1818106 ) ( ON ?auto_1818107 ?auto_1818105 ) ( ON ?auto_1818108 ?auto_1818107 ) ( not ( = ?auto_1818102 ?auto_1818103 ) ) ( not ( = ?auto_1818102 ?auto_1818104 ) ) ( not ( = ?auto_1818102 ?auto_1818106 ) ) ( not ( = ?auto_1818102 ?auto_1818105 ) ) ( not ( = ?auto_1818102 ?auto_1818107 ) ) ( not ( = ?auto_1818102 ?auto_1818108 ) ) ( not ( = ?auto_1818102 ?auto_1818109 ) ) ( not ( = ?auto_1818102 ?auto_1818110 ) ) ( not ( = ?auto_1818102 ?auto_1818114 ) ) ( not ( = ?auto_1818103 ?auto_1818104 ) ) ( not ( = ?auto_1818103 ?auto_1818106 ) ) ( not ( = ?auto_1818103 ?auto_1818105 ) ) ( not ( = ?auto_1818103 ?auto_1818107 ) ) ( not ( = ?auto_1818103 ?auto_1818108 ) ) ( not ( = ?auto_1818103 ?auto_1818109 ) ) ( not ( = ?auto_1818103 ?auto_1818110 ) ) ( not ( = ?auto_1818103 ?auto_1818114 ) ) ( not ( = ?auto_1818104 ?auto_1818106 ) ) ( not ( = ?auto_1818104 ?auto_1818105 ) ) ( not ( = ?auto_1818104 ?auto_1818107 ) ) ( not ( = ?auto_1818104 ?auto_1818108 ) ) ( not ( = ?auto_1818104 ?auto_1818109 ) ) ( not ( = ?auto_1818104 ?auto_1818110 ) ) ( not ( = ?auto_1818104 ?auto_1818114 ) ) ( not ( = ?auto_1818106 ?auto_1818105 ) ) ( not ( = ?auto_1818106 ?auto_1818107 ) ) ( not ( = ?auto_1818106 ?auto_1818108 ) ) ( not ( = ?auto_1818106 ?auto_1818109 ) ) ( not ( = ?auto_1818106 ?auto_1818110 ) ) ( not ( = ?auto_1818106 ?auto_1818114 ) ) ( not ( = ?auto_1818105 ?auto_1818107 ) ) ( not ( = ?auto_1818105 ?auto_1818108 ) ) ( not ( = ?auto_1818105 ?auto_1818109 ) ) ( not ( = ?auto_1818105 ?auto_1818110 ) ) ( not ( = ?auto_1818105 ?auto_1818114 ) ) ( not ( = ?auto_1818107 ?auto_1818108 ) ) ( not ( = ?auto_1818107 ?auto_1818109 ) ) ( not ( = ?auto_1818107 ?auto_1818110 ) ) ( not ( = ?auto_1818107 ?auto_1818114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1818108 ?auto_1818109 ?auto_1818110 )
      ( MAKE-8CRATE-VERIFY ?auto_1818102 ?auto_1818103 ?auto_1818104 ?auto_1818106 ?auto_1818105 ?auto_1818107 ?auto_1818108 ?auto_1818109 ?auto_1818110 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822218 - SURFACE
      ?auto_1822219 - SURFACE
      ?auto_1822220 - SURFACE
      ?auto_1822222 - SURFACE
      ?auto_1822221 - SURFACE
      ?auto_1822223 - SURFACE
      ?auto_1822224 - SURFACE
      ?auto_1822225 - SURFACE
      ?auto_1822226 - SURFACE
      ?auto_1822227 - SURFACE
    )
    :vars
    (
      ?auto_1822228 - HOIST
      ?auto_1822229 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822228 ?auto_1822229 ) ( SURFACE-AT ?auto_1822226 ?auto_1822229 ) ( CLEAR ?auto_1822226 ) ( LIFTING ?auto_1822228 ?auto_1822227 ) ( IS-CRATE ?auto_1822227 ) ( not ( = ?auto_1822226 ?auto_1822227 ) ) ( ON ?auto_1822219 ?auto_1822218 ) ( ON ?auto_1822220 ?auto_1822219 ) ( ON ?auto_1822222 ?auto_1822220 ) ( ON ?auto_1822221 ?auto_1822222 ) ( ON ?auto_1822223 ?auto_1822221 ) ( ON ?auto_1822224 ?auto_1822223 ) ( ON ?auto_1822225 ?auto_1822224 ) ( ON ?auto_1822226 ?auto_1822225 ) ( not ( = ?auto_1822218 ?auto_1822219 ) ) ( not ( = ?auto_1822218 ?auto_1822220 ) ) ( not ( = ?auto_1822218 ?auto_1822222 ) ) ( not ( = ?auto_1822218 ?auto_1822221 ) ) ( not ( = ?auto_1822218 ?auto_1822223 ) ) ( not ( = ?auto_1822218 ?auto_1822224 ) ) ( not ( = ?auto_1822218 ?auto_1822225 ) ) ( not ( = ?auto_1822218 ?auto_1822226 ) ) ( not ( = ?auto_1822218 ?auto_1822227 ) ) ( not ( = ?auto_1822219 ?auto_1822220 ) ) ( not ( = ?auto_1822219 ?auto_1822222 ) ) ( not ( = ?auto_1822219 ?auto_1822221 ) ) ( not ( = ?auto_1822219 ?auto_1822223 ) ) ( not ( = ?auto_1822219 ?auto_1822224 ) ) ( not ( = ?auto_1822219 ?auto_1822225 ) ) ( not ( = ?auto_1822219 ?auto_1822226 ) ) ( not ( = ?auto_1822219 ?auto_1822227 ) ) ( not ( = ?auto_1822220 ?auto_1822222 ) ) ( not ( = ?auto_1822220 ?auto_1822221 ) ) ( not ( = ?auto_1822220 ?auto_1822223 ) ) ( not ( = ?auto_1822220 ?auto_1822224 ) ) ( not ( = ?auto_1822220 ?auto_1822225 ) ) ( not ( = ?auto_1822220 ?auto_1822226 ) ) ( not ( = ?auto_1822220 ?auto_1822227 ) ) ( not ( = ?auto_1822222 ?auto_1822221 ) ) ( not ( = ?auto_1822222 ?auto_1822223 ) ) ( not ( = ?auto_1822222 ?auto_1822224 ) ) ( not ( = ?auto_1822222 ?auto_1822225 ) ) ( not ( = ?auto_1822222 ?auto_1822226 ) ) ( not ( = ?auto_1822222 ?auto_1822227 ) ) ( not ( = ?auto_1822221 ?auto_1822223 ) ) ( not ( = ?auto_1822221 ?auto_1822224 ) ) ( not ( = ?auto_1822221 ?auto_1822225 ) ) ( not ( = ?auto_1822221 ?auto_1822226 ) ) ( not ( = ?auto_1822221 ?auto_1822227 ) ) ( not ( = ?auto_1822223 ?auto_1822224 ) ) ( not ( = ?auto_1822223 ?auto_1822225 ) ) ( not ( = ?auto_1822223 ?auto_1822226 ) ) ( not ( = ?auto_1822223 ?auto_1822227 ) ) ( not ( = ?auto_1822224 ?auto_1822225 ) ) ( not ( = ?auto_1822224 ?auto_1822226 ) ) ( not ( = ?auto_1822224 ?auto_1822227 ) ) ( not ( = ?auto_1822225 ?auto_1822226 ) ) ( not ( = ?auto_1822225 ?auto_1822227 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1822226 ?auto_1822227 )
      ( MAKE-9CRATE-VERIFY ?auto_1822218 ?auto_1822219 ?auto_1822220 ?auto_1822222 ?auto_1822221 ?auto_1822223 ?auto_1822224 ?auto_1822225 ?auto_1822226 ?auto_1822227 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822298 - SURFACE
      ?auto_1822299 - SURFACE
      ?auto_1822300 - SURFACE
      ?auto_1822302 - SURFACE
      ?auto_1822301 - SURFACE
      ?auto_1822303 - SURFACE
      ?auto_1822304 - SURFACE
      ?auto_1822305 - SURFACE
      ?auto_1822306 - SURFACE
      ?auto_1822307 - SURFACE
    )
    :vars
    (
      ?auto_1822309 - HOIST
      ?auto_1822308 - PLACE
      ?auto_1822310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822309 ?auto_1822308 ) ( SURFACE-AT ?auto_1822306 ?auto_1822308 ) ( CLEAR ?auto_1822306 ) ( IS-CRATE ?auto_1822307 ) ( not ( = ?auto_1822306 ?auto_1822307 ) ) ( TRUCK-AT ?auto_1822310 ?auto_1822308 ) ( AVAILABLE ?auto_1822309 ) ( IN ?auto_1822307 ?auto_1822310 ) ( ON ?auto_1822306 ?auto_1822305 ) ( not ( = ?auto_1822305 ?auto_1822306 ) ) ( not ( = ?auto_1822305 ?auto_1822307 ) ) ( ON ?auto_1822299 ?auto_1822298 ) ( ON ?auto_1822300 ?auto_1822299 ) ( ON ?auto_1822302 ?auto_1822300 ) ( ON ?auto_1822301 ?auto_1822302 ) ( ON ?auto_1822303 ?auto_1822301 ) ( ON ?auto_1822304 ?auto_1822303 ) ( ON ?auto_1822305 ?auto_1822304 ) ( not ( = ?auto_1822298 ?auto_1822299 ) ) ( not ( = ?auto_1822298 ?auto_1822300 ) ) ( not ( = ?auto_1822298 ?auto_1822302 ) ) ( not ( = ?auto_1822298 ?auto_1822301 ) ) ( not ( = ?auto_1822298 ?auto_1822303 ) ) ( not ( = ?auto_1822298 ?auto_1822304 ) ) ( not ( = ?auto_1822298 ?auto_1822305 ) ) ( not ( = ?auto_1822298 ?auto_1822306 ) ) ( not ( = ?auto_1822298 ?auto_1822307 ) ) ( not ( = ?auto_1822299 ?auto_1822300 ) ) ( not ( = ?auto_1822299 ?auto_1822302 ) ) ( not ( = ?auto_1822299 ?auto_1822301 ) ) ( not ( = ?auto_1822299 ?auto_1822303 ) ) ( not ( = ?auto_1822299 ?auto_1822304 ) ) ( not ( = ?auto_1822299 ?auto_1822305 ) ) ( not ( = ?auto_1822299 ?auto_1822306 ) ) ( not ( = ?auto_1822299 ?auto_1822307 ) ) ( not ( = ?auto_1822300 ?auto_1822302 ) ) ( not ( = ?auto_1822300 ?auto_1822301 ) ) ( not ( = ?auto_1822300 ?auto_1822303 ) ) ( not ( = ?auto_1822300 ?auto_1822304 ) ) ( not ( = ?auto_1822300 ?auto_1822305 ) ) ( not ( = ?auto_1822300 ?auto_1822306 ) ) ( not ( = ?auto_1822300 ?auto_1822307 ) ) ( not ( = ?auto_1822302 ?auto_1822301 ) ) ( not ( = ?auto_1822302 ?auto_1822303 ) ) ( not ( = ?auto_1822302 ?auto_1822304 ) ) ( not ( = ?auto_1822302 ?auto_1822305 ) ) ( not ( = ?auto_1822302 ?auto_1822306 ) ) ( not ( = ?auto_1822302 ?auto_1822307 ) ) ( not ( = ?auto_1822301 ?auto_1822303 ) ) ( not ( = ?auto_1822301 ?auto_1822304 ) ) ( not ( = ?auto_1822301 ?auto_1822305 ) ) ( not ( = ?auto_1822301 ?auto_1822306 ) ) ( not ( = ?auto_1822301 ?auto_1822307 ) ) ( not ( = ?auto_1822303 ?auto_1822304 ) ) ( not ( = ?auto_1822303 ?auto_1822305 ) ) ( not ( = ?auto_1822303 ?auto_1822306 ) ) ( not ( = ?auto_1822303 ?auto_1822307 ) ) ( not ( = ?auto_1822304 ?auto_1822305 ) ) ( not ( = ?auto_1822304 ?auto_1822306 ) ) ( not ( = ?auto_1822304 ?auto_1822307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822305 ?auto_1822306 ?auto_1822307 )
      ( MAKE-9CRATE-VERIFY ?auto_1822298 ?auto_1822299 ?auto_1822300 ?auto_1822302 ?auto_1822301 ?auto_1822303 ?auto_1822304 ?auto_1822305 ?auto_1822306 ?auto_1822307 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822388 - SURFACE
      ?auto_1822389 - SURFACE
      ?auto_1822390 - SURFACE
      ?auto_1822392 - SURFACE
      ?auto_1822391 - SURFACE
      ?auto_1822393 - SURFACE
      ?auto_1822394 - SURFACE
      ?auto_1822395 - SURFACE
      ?auto_1822396 - SURFACE
      ?auto_1822397 - SURFACE
    )
    :vars
    (
      ?auto_1822401 - HOIST
      ?auto_1822400 - PLACE
      ?auto_1822398 - TRUCK
      ?auto_1822399 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822401 ?auto_1822400 ) ( SURFACE-AT ?auto_1822396 ?auto_1822400 ) ( CLEAR ?auto_1822396 ) ( IS-CRATE ?auto_1822397 ) ( not ( = ?auto_1822396 ?auto_1822397 ) ) ( AVAILABLE ?auto_1822401 ) ( IN ?auto_1822397 ?auto_1822398 ) ( ON ?auto_1822396 ?auto_1822395 ) ( not ( = ?auto_1822395 ?auto_1822396 ) ) ( not ( = ?auto_1822395 ?auto_1822397 ) ) ( TRUCK-AT ?auto_1822398 ?auto_1822399 ) ( not ( = ?auto_1822399 ?auto_1822400 ) ) ( ON ?auto_1822389 ?auto_1822388 ) ( ON ?auto_1822390 ?auto_1822389 ) ( ON ?auto_1822392 ?auto_1822390 ) ( ON ?auto_1822391 ?auto_1822392 ) ( ON ?auto_1822393 ?auto_1822391 ) ( ON ?auto_1822394 ?auto_1822393 ) ( ON ?auto_1822395 ?auto_1822394 ) ( not ( = ?auto_1822388 ?auto_1822389 ) ) ( not ( = ?auto_1822388 ?auto_1822390 ) ) ( not ( = ?auto_1822388 ?auto_1822392 ) ) ( not ( = ?auto_1822388 ?auto_1822391 ) ) ( not ( = ?auto_1822388 ?auto_1822393 ) ) ( not ( = ?auto_1822388 ?auto_1822394 ) ) ( not ( = ?auto_1822388 ?auto_1822395 ) ) ( not ( = ?auto_1822388 ?auto_1822396 ) ) ( not ( = ?auto_1822388 ?auto_1822397 ) ) ( not ( = ?auto_1822389 ?auto_1822390 ) ) ( not ( = ?auto_1822389 ?auto_1822392 ) ) ( not ( = ?auto_1822389 ?auto_1822391 ) ) ( not ( = ?auto_1822389 ?auto_1822393 ) ) ( not ( = ?auto_1822389 ?auto_1822394 ) ) ( not ( = ?auto_1822389 ?auto_1822395 ) ) ( not ( = ?auto_1822389 ?auto_1822396 ) ) ( not ( = ?auto_1822389 ?auto_1822397 ) ) ( not ( = ?auto_1822390 ?auto_1822392 ) ) ( not ( = ?auto_1822390 ?auto_1822391 ) ) ( not ( = ?auto_1822390 ?auto_1822393 ) ) ( not ( = ?auto_1822390 ?auto_1822394 ) ) ( not ( = ?auto_1822390 ?auto_1822395 ) ) ( not ( = ?auto_1822390 ?auto_1822396 ) ) ( not ( = ?auto_1822390 ?auto_1822397 ) ) ( not ( = ?auto_1822392 ?auto_1822391 ) ) ( not ( = ?auto_1822392 ?auto_1822393 ) ) ( not ( = ?auto_1822392 ?auto_1822394 ) ) ( not ( = ?auto_1822392 ?auto_1822395 ) ) ( not ( = ?auto_1822392 ?auto_1822396 ) ) ( not ( = ?auto_1822392 ?auto_1822397 ) ) ( not ( = ?auto_1822391 ?auto_1822393 ) ) ( not ( = ?auto_1822391 ?auto_1822394 ) ) ( not ( = ?auto_1822391 ?auto_1822395 ) ) ( not ( = ?auto_1822391 ?auto_1822396 ) ) ( not ( = ?auto_1822391 ?auto_1822397 ) ) ( not ( = ?auto_1822393 ?auto_1822394 ) ) ( not ( = ?auto_1822393 ?auto_1822395 ) ) ( not ( = ?auto_1822393 ?auto_1822396 ) ) ( not ( = ?auto_1822393 ?auto_1822397 ) ) ( not ( = ?auto_1822394 ?auto_1822395 ) ) ( not ( = ?auto_1822394 ?auto_1822396 ) ) ( not ( = ?auto_1822394 ?auto_1822397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822395 ?auto_1822396 ?auto_1822397 )
      ( MAKE-9CRATE-VERIFY ?auto_1822388 ?auto_1822389 ?auto_1822390 ?auto_1822392 ?auto_1822391 ?auto_1822393 ?auto_1822394 ?auto_1822395 ?auto_1822396 ?auto_1822397 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822487 - SURFACE
      ?auto_1822488 - SURFACE
      ?auto_1822489 - SURFACE
      ?auto_1822491 - SURFACE
      ?auto_1822490 - SURFACE
      ?auto_1822492 - SURFACE
      ?auto_1822493 - SURFACE
      ?auto_1822494 - SURFACE
      ?auto_1822495 - SURFACE
      ?auto_1822496 - SURFACE
    )
    :vars
    (
      ?auto_1822500 - HOIST
      ?auto_1822501 - PLACE
      ?auto_1822498 - TRUCK
      ?auto_1822499 - PLACE
      ?auto_1822497 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822500 ?auto_1822501 ) ( SURFACE-AT ?auto_1822495 ?auto_1822501 ) ( CLEAR ?auto_1822495 ) ( IS-CRATE ?auto_1822496 ) ( not ( = ?auto_1822495 ?auto_1822496 ) ) ( AVAILABLE ?auto_1822500 ) ( ON ?auto_1822495 ?auto_1822494 ) ( not ( = ?auto_1822494 ?auto_1822495 ) ) ( not ( = ?auto_1822494 ?auto_1822496 ) ) ( TRUCK-AT ?auto_1822498 ?auto_1822499 ) ( not ( = ?auto_1822499 ?auto_1822501 ) ) ( HOIST-AT ?auto_1822497 ?auto_1822499 ) ( LIFTING ?auto_1822497 ?auto_1822496 ) ( not ( = ?auto_1822500 ?auto_1822497 ) ) ( ON ?auto_1822488 ?auto_1822487 ) ( ON ?auto_1822489 ?auto_1822488 ) ( ON ?auto_1822491 ?auto_1822489 ) ( ON ?auto_1822490 ?auto_1822491 ) ( ON ?auto_1822492 ?auto_1822490 ) ( ON ?auto_1822493 ?auto_1822492 ) ( ON ?auto_1822494 ?auto_1822493 ) ( not ( = ?auto_1822487 ?auto_1822488 ) ) ( not ( = ?auto_1822487 ?auto_1822489 ) ) ( not ( = ?auto_1822487 ?auto_1822491 ) ) ( not ( = ?auto_1822487 ?auto_1822490 ) ) ( not ( = ?auto_1822487 ?auto_1822492 ) ) ( not ( = ?auto_1822487 ?auto_1822493 ) ) ( not ( = ?auto_1822487 ?auto_1822494 ) ) ( not ( = ?auto_1822487 ?auto_1822495 ) ) ( not ( = ?auto_1822487 ?auto_1822496 ) ) ( not ( = ?auto_1822488 ?auto_1822489 ) ) ( not ( = ?auto_1822488 ?auto_1822491 ) ) ( not ( = ?auto_1822488 ?auto_1822490 ) ) ( not ( = ?auto_1822488 ?auto_1822492 ) ) ( not ( = ?auto_1822488 ?auto_1822493 ) ) ( not ( = ?auto_1822488 ?auto_1822494 ) ) ( not ( = ?auto_1822488 ?auto_1822495 ) ) ( not ( = ?auto_1822488 ?auto_1822496 ) ) ( not ( = ?auto_1822489 ?auto_1822491 ) ) ( not ( = ?auto_1822489 ?auto_1822490 ) ) ( not ( = ?auto_1822489 ?auto_1822492 ) ) ( not ( = ?auto_1822489 ?auto_1822493 ) ) ( not ( = ?auto_1822489 ?auto_1822494 ) ) ( not ( = ?auto_1822489 ?auto_1822495 ) ) ( not ( = ?auto_1822489 ?auto_1822496 ) ) ( not ( = ?auto_1822491 ?auto_1822490 ) ) ( not ( = ?auto_1822491 ?auto_1822492 ) ) ( not ( = ?auto_1822491 ?auto_1822493 ) ) ( not ( = ?auto_1822491 ?auto_1822494 ) ) ( not ( = ?auto_1822491 ?auto_1822495 ) ) ( not ( = ?auto_1822491 ?auto_1822496 ) ) ( not ( = ?auto_1822490 ?auto_1822492 ) ) ( not ( = ?auto_1822490 ?auto_1822493 ) ) ( not ( = ?auto_1822490 ?auto_1822494 ) ) ( not ( = ?auto_1822490 ?auto_1822495 ) ) ( not ( = ?auto_1822490 ?auto_1822496 ) ) ( not ( = ?auto_1822492 ?auto_1822493 ) ) ( not ( = ?auto_1822492 ?auto_1822494 ) ) ( not ( = ?auto_1822492 ?auto_1822495 ) ) ( not ( = ?auto_1822492 ?auto_1822496 ) ) ( not ( = ?auto_1822493 ?auto_1822494 ) ) ( not ( = ?auto_1822493 ?auto_1822495 ) ) ( not ( = ?auto_1822493 ?auto_1822496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822494 ?auto_1822495 ?auto_1822496 )
      ( MAKE-9CRATE-VERIFY ?auto_1822487 ?auto_1822488 ?auto_1822489 ?auto_1822491 ?auto_1822490 ?auto_1822492 ?auto_1822493 ?auto_1822494 ?auto_1822495 ?auto_1822496 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822595 - SURFACE
      ?auto_1822596 - SURFACE
      ?auto_1822597 - SURFACE
      ?auto_1822599 - SURFACE
      ?auto_1822598 - SURFACE
      ?auto_1822600 - SURFACE
      ?auto_1822601 - SURFACE
      ?auto_1822602 - SURFACE
      ?auto_1822603 - SURFACE
      ?auto_1822604 - SURFACE
    )
    :vars
    (
      ?auto_1822609 - HOIST
      ?auto_1822606 - PLACE
      ?auto_1822607 - TRUCK
      ?auto_1822610 - PLACE
      ?auto_1822608 - HOIST
      ?auto_1822605 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822609 ?auto_1822606 ) ( SURFACE-AT ?auto_1822603 ?auto_1822606 ) ( CLEAR ?auto_1822603 ) ( IS-CRATE ?auto_1822604 ) ( not ( = ?auto_1822603 ?auto_1822604 ) ) ( AVAILABLE ?auto_1822609 ) ( ON ?auto_1822603 ?auto_1822602 ) ( not ( = ?auto_1822602 ?auto_1822603 ) ) ( not ( = ?auto_1822602 ?auto_1822604 ) ) ( TRUCK-AT ?auto_1822607 ?auto_1822610 ) ( not ( = ?auto_1822610 ?auto_1822606 ) ) ( HOIST-AT ?auto_1822608 ?auto_1822610 ) ( not ( = ?auto_1822609 ?auto_1822608 ) ) ( AVAILABLE ?auto_1822608 ) ( SURFACE-AT ?auto_1822604 ?auto_1822610 ) ( ON ?auto_1822604 ?auto_1822605 ) ( CLEAR ?auto_1822604 ) ( not ( = ?auto_1822603 ?auto_1822605 ) ) ( not ( = ?auto_1822604 ?auto_1822605 ) ) ( not ( = ?auto_1822602 ?auto_1822605 ) ) ( ON ?auto_1822596 ?auto_1822595 ) ( ON ?auto_1822597 ?auto_1822596 ) ( ON ?auto_1822599 ?auto_1822597 ) ( ON ?auto_1822598 ?auto_1822599 ) ( ON ?auto_1822600 ?auto_1822598 ) ( ON ?auto_1822601 ?auto_1822600 ) ( ON ?auto_1822602 ?auto_1822601 ) ( not ( = ?auto_1822595 ?auto_1822596 ) ) ( not ( = ?auto_1822595 ?auto_1822597 ) ) ( not ( = ?auto_1822595 ?auto_1822599 ) ) ( not ( = ?auto_1822595 ?auto_1822598 ) ) ( not ( = ?auto_1822595 ?auto_1822600 ) ) ( not ( = ?auto_1822595 ?auto_1822601 ) ) ( not ( = ?auto_1822595 ?auto_1822602 ) ) ( not ( = ?auto_1822595 ?auto_1822603 ) ) ( not ( = ?auto_1822595 ?auto_1822604 ) ) ( not ( = ?auto_1822595 ?auto_1822605 ) ) ( not ( = ?auto_1822596 ?auto_1822597 ) ) ( not ( = ?auto_1822596 ?auto_1822599 ) ) ( not ( = ?auto_1822596 ?auto_1822598 ) ) ( not ( = ?auto_1822596 ?auto_1822600 ) ) ( not ( = ?auto_1822596 ?auto_1822601 ) ) ( not ( = ?auto_1822596 ?auto_1822602 ) ) ( not ( = ?auto_1822596 ?auto_1822603 ) ) ( not ( = ?auto_1822596 ?auto_1822604 ) ) ( not ( = ?auto_1822596 ?auto_1822605 ) ) ( not ( = ?auto_1822597 ?auto_1822599 ) ) ( not ( = ?auto_1822597 ?auto_1822598 ) ) ( not ( = ?auto_1822597 ?auto_1822600 ) ) ( not ( = ?auto_1822597 ?auto_1822601 ) ) ( not ( = ?auto_1822597 ?auto_1822602 ) ) ( not ( = ?auto_1822597 ?auto_1822603 ) ) ( not ( = ?auto_1822597 ?auto_1822604 ) ) ( not ( = ?auto_1822597 ?auto_1822605 ) ) ( not ( = ?auto_1822599 ?auto_1822598 ) ) ( not ( = ?auto_1822599 ?auto_1822600 ) ) ( not ( = ?auto_1822599 ?auto_1822601 ) ) ( not ( = ?auto_1822599 ?auto_1822602 ) ) ( not ( = ?auto_1822599 ?auto_1822603 ) ) ( not ( = ?auto_1822599 ?auto_1822604 ) ) ( not ( = ?auto_1822599 ?auto_1822605 ) ) ( not ( = ?auto_1822598 ?auto_1822600 ) ) ( not ( = ?auto_1822598 ?auto_1822601 ) ) ( not ( = ?auto_1822598 ?auto_1822602 ) ) ( not ( = ?auto_1822598 ?auto_1822603 ) ) ( not ( = ?auto_1822598 ?auto_1822604 ) ) ( not ( = ?auto_1822598 ?auto_1822605 ) ) ( not ( = ?auto_1822600 ?auto_1822601 ) ) ( not ( = ?auto_1822600 ?auto_1822602 ) ) ( not ( = ?auto_1822600 ?auto_1822603 ) ) ( not ( = ?auto_1822600 ?auto_1822604 ) ) ( not ( = ?auto_1822600 ?auto_1822605 ) ) ( not ( = ?auto_1822601 ?auto_1822602 ) ) ( not ( = ?auto_1822601 ?auto_1822603 ) ) ( not ( = ?auto_1822601 ?auto_1822604 ) ) ( not ( = ?auto_1822601 ?auto_1822605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822602 ?auto_1822603 ?auto_1822604 )
      ( MAKE-9CRATE-VERIFY ?auto_1822595 ?auto_1822596 ?auto_1822597 ?auto_1822599 ?auto_1822598 ?auto_1822600 ?auto_1822601 ?auto_1822602 ?auto_1822603 ?auto_1822604 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822704 - SURFACE
      ?auto_1822705 - SURFACE
      ?auto_1822706 - SURFACE
      ?auto_1822708 - SURFACE
      ?auto_1822707 - SURFACE
      ?auto_1822709 - SURFACE
      ?auto_1822710 - SURFACE
      ?auto_1822711 - SURFACE
      ?auto_1822712 - SURFACE
      ?auto_1822713 - SURFACE
    )
    :vars
    (
      ?auto_1822715 - HOIST
      ?auto_1822718 - PLACE
      ?auto_1822714 - PLACE
      ?auto_1822719 - HOIST
      ?auto_1822717 - SURFACE
      ?auto_1822716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822715 ?auto_1822718 ) ( SURFACE-AT ?auto_1822712 ?auto_1822718 ) ( CLEAR ?auto_1822712 ) ( IS-CRATE ?auto_1822713 ) ( not ( = ?auto_1822712 ?auto_1822713 ) ) ( AVAILABLE ?auto_1822715 ) ( ON ?auto_1822712 ?auto_1822711 ) ( not ( = ?auto_1822711 ?auto_1822712 ) ) ( not ( = ?auto_1822711 ?auto_1822713 ) ) ( not ( = ?auto_1822714 ?auto_1822718 ) ) ( HOIST-AT ?auto_1822719 ?auto_1822714 ) ( not ( = ?auto_1822715 ?auto_1822719 ) ) ( AVAILABLE ?auto_1822719 ) ( SURFACE-AT ?auto_1822713 ?auto_1822714 ) ( ON ?auto_1822713 ?auto_1822717 ) ( CLEAR ?auto_1822713 ) ( not ( = ?auto_1822712 ?auto_1822717 ) ) ( not ( = ?auto_1822713 ?auto_1822717 ) ) ( not ( = ?auto_1822711 ?auto_1822717 ) ) ( TRUCK-AT ?auto_1822716 ?auto_1822718 ) ( ON ?auto_1822705 ?auto_1822704 ) ( ON ?auto_1822706 ?auto_1822705 ) ( ON ?auto_1822708 ?auto_1822706 ) ( ON ?auto_1822707 ?auto_1822708 ) ( ON ?auto_1822709 ?auto_1822707 ) ( ON ?auto_1822710 ?auto_1822709 ) ( ON ?auto_1822711 ?auto_1822710 ) ( not ( = ?auto_1822704 ?auto_1822705 ) ) ( not ( = ?auto_1822704 ?auto_1822706 ) ) ( not ( = ?auto_1822704 ?auto_1822708 ) ) ( not ( = ?auto_1822704 ?auto_1822707 ) ) ( not ( = ?auto_1822704 ?auto_1822709 ) ) ( not ( = ?auto_1822704 ?auto_1822710 ) ) ( not ( = ?auto_1822704 ?auto_1822711 ) ) ( not ( = ?auto_1822704 ?auto_1822712 ) ) ( not ( = ?auto_1822704 ?auto_1822713 ) ) ( not ( = ?auto_1822704 ?auto_1822717 ) ) ( not ( = ?auto_1822705 ?auto_1822706 ) ) ( not ( = ?auto_1822705 ?auto_1822708 ) ) ( not ( = ?auto_1822705 ?auto_1822707 ) ) ( not ( = ?auto_1822705 ?auto_1822709 ) ) ( not ( = ?auto_1822705 ?auto_1822710 ) ) ( not ( = ?auto_1822705 ?auto_1822711 ) ) ( not ( = ?auto_1822705 ?auto_1822712 ) ) ( not ( = ?auto_1822705 ?auto_1822713 ) ) ( not ( = ?auto_1822705 ?auto_1822717 ) ) ( not ( = ?auto_1822706 ?auto_1822708 ) ) ( not ( = ?auto_1822706 ?auto_1822707 ) ) ( not ( = ?auto_1822706 ?auto_1822709 ) ) ( not ( = ?auto_1822706 ?auto_1822710 ) ) ( not ( = ?auto_1822706 ?auto_1822711 ) ) ( not ( = ?auto_1822706 ?auto_1822712 ) ) ( not ( = ?auto_1822706 ?auto_1822713 ) ) ( not ( = ?auto_1822706 ?auto_1822717 ) ) ( not ( = ?auto_1822708 ?auto_1822707 ) ) ( not ( = ?auto_1822708 ?auto_1822709 ) ) ( not ( = ?auto_1822708 ?auto_1822710 ) ) ( not ( = ?auto_1822708 ?auto_1822711 ) ) ( not ( = ?auto_1822708 ?auto_1822712 ) ) ( not ( = ?auto_1822708 ?auto_1822713 ) ) ( not ( = ?auto_1822708 ?auto_1822717 ) ) ( not ( = ?auto_1822707 ?auto_1822709 ) ) ( not ( = ?auto_1822707 ?auto_1822710 ) ) ( not ( = ?auto_1822707 ?auto_1822711 ) ) ( not ( = ?auto_1822707 ?auto_1822712 ) ) ( not ( = ?auto_1822707 ?auto_1822713 ) ) ( not ( = ?auto_1822707 ?auto_1822717 ) ) ( not ( = ?auto_1822709 ?auto_1822710 ) ) ( not ( = ?auto_1822709 ?auto_1822711 ) ) ( not ( = ?auto_1822709 ?auto_1822712 ) ) ( not ( = ?auto_1822709 ?auto_1822713 ) ) ( not ( = ?auto_1822709 ?auto_1822717 ) ) ( not ( = ?auto_1822710 ?auto_1822711 ) ) ( not ( = ?auto_1822710 ?auto_1822712 ) ) ( not ( = ?auto_1822710 ?auto_1822713 ) ) ( not ( = ?auto_1822710 ?auto_1822717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822711 ?auto_1822712 ?auto_1822713 )
      ( MAKE-9CRATE-VERIFY ?auto_1822704 ?auto_1822705 ?auto_1822706 ?auto_1822708 ?auto_1822707 ?auto_1822709 ?auto_1822710 ?auto_1822711 ?auto_1822712 ?auto_1822713 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822813 - SURFACE
      ?auto_1822814 - SURFACE
      ?auto_1822815 - SURFACE
      ?auto_1822817 - SURFACE
      ?auto_1822816 - SURFACE
      ?auto_1822818 - SURFACE
      ?auto_1822819 - SURFACE
      ?auto_1822820 - SURFACE
      ?auto_1822821 - SURFACE
      ?auto_1822822 - SURFACE
    )
    :vars
    (
      ?auto_1822826 - HOIST
      ?auto_1822825 - PLACE
      ?auto_1822828 - PLACE
      ?auto_1822824 - HOIST
      ?auto_1822827 - SURFACE
      ?auto_1822823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822826 ?auto_1822825 ) ( IS-CRATE ?auto_1822822 ) ( not ( = ?auto_1822821 ?auto_1822822 ) ) ( not ( = ?auto_1822820 ?auto_1822821 ) ) ( not ( = ?auto_1822820 ?auto_1822822 ) ) ( not ( = ?auto_1822828 ?auto_1822825 ) ) ( HOIST-AT ?auto_1822824 ?auto_1822828 ) ( not ( = ?auto_1822826 ?auto_1822824 ) ) ( AVAILABLE ?auto_1822824 ) ( SURFACE-AT ?auto_1822822 ?auto_1822828 ) ( ON ?auto_1822822 ?auto_1822827 ) ( CLEAR ?auto_1822822 ) ( not ( = ?auto_1822821 ?auto_1822827 ) ) ( not ( = ?auto_1822822 ?auto_1822827 ) ) ( not ( = ?auto_1822820 ?auto_1822827 ) ) ( TRUCK-AT ?auto_1822823 ?auto_1822825 ) ( SURFACE-AT ?auto_1822820 ?auto_1822825 ) ( CLEAR ?auto_1822820 ) ( LIFTING ?auto_1822826 ?auto_1822821 ) ( IS-CRATE ?auto_1822821 ) ( ON ?auto_1822814 ?auto_1822813 ) ( ON ?auto_1822815 ?auto_1822814 ) ( ON ?auto_1822817 ?auto_1822815 ) ( ON ?auto_1822816 ?auto_1822817 ) ( ON ?auto_1822818 ?auto_1822816 ) ( ON ?auto_1822819 ?auto_1822818 ) ( ON ?auto_1822820 ?auto_1822819 ) ( not ( = ?auto_1822813 ?auto_1822814 ) ) ( not ( = ?auto_1822813 ?auto_1822815 ) ) ( not ( = ?auto_1822813 ?auto_1822817 ) ) ( not ( = ?auto_1822813 ?auto_1822816 ) ) ( not ( = ?auto_1822813 ?auto_1822818 ) ) ( not ( = ?auto_1822813 ?auto_1822819 ) ) ( not ( = ?auto_1822813 ?auto_1822820 ) ) ( not ( = ?auto_1822813 ?auto_1822821 ) ) ( not ( = ?auto_1822813 ?auto_1822822 ) ) ( not ( = ?auto_1822813 ?auto_1822827 ) ) ( not ( = ?auto_1822814 ?auto_1822815 ) ) ( not ( = ?auto_1822814 ?auto_1822817 ) ) ( not ( = ?auto_1822814 ?auto_1822816 ) ) ( not ( = ?auto_1822814 ?auto_1822818 ) ) ( not ( = ?auto_1822814 ?auto_1822819 ) ) ( not ( = ?auto_1822814 ?auto_1822820 ) ) ( not ( = ?auto_1822814 ?auto_1822821 ) ) ( not ( = ?auto_1822814 ?auto_1822822 ) ) ( not ( = ?auto_1822814 ?auto_1822827 ) ) ( not ( = ?auto_1822815 ?auto_1822817 ) ) ( not ( = ?auto_1822815 ?auto_1822816 ) ) ( not ( = ?auto_1822815 ?auto_1822818 ) ) ( not ( = ?auto_1822815 ?auto_1822819 ) ) ( not ( = ?auto_1822815 ?auto_1822820 ) ) ( not ( = ?auto_1822815 ?auto_1822821 ) ) ( not ( = ?auto_1822815 ?auto_1822822 ) ) ( not ( = ?auto_1822815 ?auto_1822827 ) ) ( not ( = ?auto_1822817 ?auto_1822816 ) ) ( not ( = ?auto_1822817 ?auto_1822818 ) ) ( not ( = ?auto_1822817 ?auto_1822819 ) ) ( not ( = ?auto_1822817 ?auto_1822820 ) ) ( not ( = ?auto_1822817 ?auto_1822821 ) ) ( not ( = ?auto_1822817 ?auto_1822822 ) ) ( not ( = ?auto_1822817 ?auto_1822827 ) ) ( not ( = ?auto_1822816 ?auto_1822818 ) ) ( not ( = ?auto_1822816 ?auto_1822819 ) ) ( not ( = ?auto_1822816 ?auto_1822820 ) ) ( not ( = ?auto_1822816 ?auto_1822821 ) ) ( not ( = ?auto_1822816 ?auto_1822822 ) ) ( not ( = ?auto_1822816 ?auto_1822827 ) ) ( not ( = ?auto_1822818 ?auto_1822819 ) ) ( not ( = ?auto_1822818 ?auto_1822820 ) ) ( not ( = ?auto_1822818 ?auto_1822821 ) ) ( not ( = ?auto_1822818 ?auto_1822822 ) ) ( not ( = ?auto_1822818 ?auto_1822827 ) ) ( not ( = ?auto_1822819 ?auto_1822820 ) ) ( not ( = ?auto_1822819 ?auto_1822821 ) ) ( not ( = ?auto_1822819 ?auto_1822822 ) ) ( not ( = ?auto_1822819 ?auto_1822827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822820 ?auto_1822821 ?auto_1822822 )
      ( MAKE-9CRATE-VERIFY ?auto_1822813 ?auto_1822814 ?auto_1822815 ?auto_1822817 ?auto_1822816 ?auto_1822818 ?auto_1822819 ?auto_1822820 ?auto_1822821 ?auto_1822822 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1822922 - SURFACE
      ?auto_1822923 - SURFACE
      ?auto_1822924 - SURFACE
      ?auto_1822926 - SURFACE
      ?auto_1822925 - SURFACE
      ?auto_1822927 - SURFACE
      ?auto_1822928 - SURFACE
      ?auto_1822929 - SURFACE
      ?auto_1822930 - SURFACE
      ?auto_1822931 - SURFACE
    )
    :vars
    (
      ?auto_1822935 - HOIST
      ?auto_1822934 - PLACE
      ?auto_1822933 - PLACE
      ?auto_1822932 - HOIST
      ?auto_1822936 - SURFACE
      ?auto_1822937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1822935 ?auto_1822934 ) ( IS-CRATE ?auto_1822931 ) ( not ( = ?auto_1822930 ?auto_1822931 ) ) ( not ( = ?auto_1822929 ?auto_1822930 ) ) ( not ( = ?auto_1822929 ?auto_1822931 ) ) ( not ( = ?auto_1822933 ?auto_1822934 ) ) ( HOIST-AT ?auto_1822932 ?auto_1822933 ) ( not ( = ?auto_1822935 ?auto_1822932 ) ) ( AVAILABLE ?auto_1822932 ) ( SURFACE-AT ?auto_1822931 ?auto_1822933 ) ( ON ?auto_1822931 ?auto_1822936 ) ( CLEAR ?auto_1822931 ) ( not ( = ?auto_1822930 ?auto_1822936 ) ) ( not ( = ?auto_1822931 ?auto_1822936 ) ) ( not ( = ?auto_1822929 ?auto_1822936 ) ) ( TRUCK-AT ?auto_1822937 ?auto_1822934 ) ( SURFACE-AT ?auto_1822929 ?auto_1822934 ) ( CLEAR ?auto_1822929 ) ( IS-CRATE ?auto_1822930 ) ( AVAILABLE ?auto_1822935 ) ( IN ?auto_1822930 ?auto_1822937 ) ( ON ?auto_1822923 ?auto_1822922 ) ( ON ?auto_1822924 ?auto_1822923 ) ( ON ?auto_1822926 ?auto_1822924 ) ( ON ?auto_1822925 ?auto_1822926 ) ( ON ?auto_1822927 ?auto_1822925 ) ( ON ?auto_1822928 ?auto_1822927 ) ( ON ?auto_1822929 ?auto_1822928 ) ( not ( = ?auto_1822922 ?auto_1822923 ) ) ( not ( = ?auto_1822922 ?auto_1822924 ) ) ( not ( = ?auto_1822922 ?auto_1822926 ) ) ( not ( = ?auto_1822922 ?auto_1822925 ) ) ( not ( = ?auto_1822922 ?auto_1822927 ) ) ( not ( = ?auto_1822922 ?auto_1822928 ) ) ( not ( = ?auto_1822922 ?auto_1822929 ) ) ( not ( = ?auto_1822922 ?auto_1822930 ) ) ( not ( = ?auto_1822922 ?auto_1822931 ) ) ( not ( = ?auto_1822922 ?auto_1822936 ) ) ( not ( = ?auto_1822923 ?auto_1822924 ) ) ( not ( = ?auto_1822923 ?auto_1822926 ) ) ( not ( = ?auto_1822923 ?auto_1822925 ) ) ( not ( = ?auto_1822923 ?auto_1822927 ) ) ( not ( = ?auto_1822923 ?auto_1822928 ) ) ( not ( = ?auto_1822923 ?auto_1822929 ) ) ( not ( = ?auto_1822923 ?auto_1822930 ) ) ( not ( = ?auto_1822923 ?auto_1822931 ) ) ( not ( = ?auto_1822923 ?auto_1822936 ) ) ( not ( = ?auto_1822924 ?auto_1822926 ) ) ( not ( = ?auto_1822924 ?auto_1822925 ) ) ( not ( = ?auto_1822924 ?auto_1822927 ) ) ( not ( = ?auto_1822924 ?auto_1822928 ) ) ( not ( = ?auto_1822924 ?auto_1822929 ) ) ( not ( = ?auto_1822924 ?auto_1822930 ) ) ( not ( = ?auto_1822924 ?auto_1822931 ) ) ( not ( = ?auto_1822924 ?auto_1822936 ) ) ( not ( = ?auto_1822926 ?auto_1822925 ) ) ( not ( = ?auto_1822926 ?auto_1822927 ) ) ( not ( = ?auto_1822926 ?auto_1822928 ) ) ( not ( = ?auto_1822926 ?auto_1822929 ) ) ( not ( = ?auto_1822926 ?auto_1822930 ) ) ( not ( = ?auto_1822926 ?auto_1822931 ) ) ( not ( = ?auto_1822926 ?auto_1822936 ) ) ( not ( = ?auto_1822925 ?auto_1822927 ) ) ( not ( = ?auto_1822925 ?auto_1822928 ) ) ( not ( = ?auto_1822925 ?auto_1822929 ) ) ( not ( = ?auto_1822925 ?auto_1822930 ) ) ( not ( = ?auto_1822925 ?auto_1822931 ) ) ( not ( = ?auto_1822925 ?auto_1822936 ) ) ( not ( = ?auto_1822927 ?auto_1822928 ) ) ( not ( = ?auto_1822927 ?auto_1822929 ) ) ( not ( = ?auto_1822927 ?auto_1822930 ) ) ( not ( = ?auto_1822927 ?auto_1822931 ) ) ( not ( = ?auto_1822927 ?auto_1822936 ) ) ( not ( = ?auto_1822928 ?auto_1822929 ) ) ( not ( = ?auto_1822928 ?auto_1822930 ) ) ( not ( = ?auto_1822928 ?auto_1822931 ) ) ( not ( = ?auto_1822928 ?auto_1822936 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1822929 ?auto_1822930 ?auto_1822931 )
      ( MAKE-9CRATE-VERIFY ?auto_1822922 ?auto_1822923 ?auto_1822924 ?auto_1822926 ?auto_1822925 ?auto_1822927 ?auto_1822928 ?auto_1822929 ?auto_1822930 ?auto_1822931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1827988 - SURFACE
      ?auto_1827989 - SURFACE
    )
    :vars
    (
      ?auto_1827994 - HOIST
      ?auto_1827990 - PLACE
      ?auto_1827991 - SURFACE
      ?auto_1827993 - TRUCK
      ?auto_1827996 - PLACE
      ?auto_1827992 - HOIST
      ?auto_1827995 - SURFACE
      ?auto_1827997 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1827994 ?auto_1827990 ) ( SURFACE-AT ?auto_1827988 ?auto_1827990 ) ( CLEAR ?auto_1827988 ) ( IS-CRATE ?auto_1827989 ) ( not ( = ?auto_1827988 ?auto_1827989 ) ) ( AVAILABLE ?auto_1827994 ) ( ON ?auto_1827988 ?auto_1827991 ) ( not ( = ?auto_1827991 ?auto_1827988 ) ) ( not ( = ?auto_1827991 ?auto_1827989 ) ) ( TRUCK-AT ?auto_1827993 ?auto_1827996 ) ( not ( = ?auto_1827996 ?auto_1827990 ) ) ( HOIST-AT ?auto_1827992 ?auto_1827996 ) ( not ( = ?auto_1827994 ?auto_1827992 ) ) ( SURFACE-AT ?auto_1827989 ?auto_1827996 ) ( ON ?auto_1827989 ?auto_1827995 ) ( CLEAR ?auto_1827989 ) ( not ( = ?auto_1827988 ?auto_1827995 ) ) ( not ( = ?auto_1827989 ?auto_1827995 ) ) ( not ( = ?auto_1827991 ?auto_1827995 ) ) ( LIFTING ?auto_1827992 ?auto_1827997 ) ( IS-CRATE ?auto_1827997 ) ( not ( = ?auto_1827988 ?auto_1827997 ) ) ( not ( = ?auto_1827989 ?auto_1827997 ) ) ( not ( = ?auto_1827991 ?auto_1827997 ) ) ( not ( = ?auto_1827995 ?auto_1827997 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1827992 ?auto_1827997 ?auto_1827993 ?auto_1827996 )
      ( MAKE-1CRATE ?auto_1827988 ?auto_1827989 )
      ( MAKE-1CRATE-VERIFY ?auto_1827988 ?auto_1827989 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1828477 - SURFACE
      ?auto_1828478 - SURFACE
      ?auto_1828479 - SURFACE
      ?auto_1828481 - SURFACE
      ?auto_1828480 - SURFACE
      ?auto_1828482 - SURFACE
      ?auto_1828483 - SURFACE
      ?auto_1828484 - SURFACE
      ?auto_1828485 - SURFACE
      ?auto_1828486 - SURFACE
      ?auto_1828487 - SURFACE
    )
    :vars
    (
      ?auto_1828488 - HOIST
      ?auto_1828489 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1828488 ?auto_1828489 ) ( SURFACE-AT ?auto_1828486 ?auto_1828489 ) ( CLEAR ?auto_1828486 ) ( LIFTING ?auto_1828488 ?auto_1828487 ) ( IS-CRATE ?auto_1828487 ) ( not ( = ?auto_1828486 ?auto_1828487 ) ) ( ON ?auto_1828478 ?auto_1828477 ) ( ON ?auto_1828479 ?auto_1828478 ) ( ON ?auto_1828481 ?auto_1828479 ) ( ON ?auto_1828480 ?auto_1828481 ) ( ON ?auto_1828482 ?auto_1828480 ) ( ON ?auto_1828483 ?auto_1828482 ) ( ON ?auto_1828484 ?auto_1828483 ) ( ON ?auto_1828485 ?auto_1828484 ) ( ON ?auto_1828486 ?auto_1828485 ) ( not ( = ?auto_1828477 ?auto_1828478 ) ) ( not ( = ?auto_1828477 ?auto_1828479 ) ) ( not ( = ?auto_1828477 ?auto_1828481 ) ) ( not ( = ?auto_1828477 ?auto_1828480 ) ) ( not ( = ?auto_1828477 ?auto_1828482 ) ) ( not ( = ?auto_1828477 ?auto_1828483 ) ) ( not ( = ?auto_1828477 ?auto_1828484 ) ) ( not ( = ?auto_1828477 ?auto_1828485 ) ) ( not ( = ?auto_1828477 ?auto_1828486 ) ) ( not ( = ?auto_1828477 ?auto_1828487 ) ) ( not ( = ?auto_1828478 ?auto_1828479 ) ) ( not ( = ?auto_1828478 ?auto_1828481 ) ) ( not ( = ?auto_1828478 ?auto_1828480 ) ) ( not ( = ?auto_1828478 ?auto_1828482 ) ) ( not ( = ?auto_1828478 ?auto_1828483 ) ) ( not ( = ?auto_1828478 ?auto_1828484 ) ) ( not ( = ?auto_1828478 ?auto_1828485 ) ) ( not ( = ?auto_1828478 ?auto_1828486 ) ) ( not ( = ?auto_1828478 ?auto_1828487 ) ) ( not ( = ?auto_1828479 ?auto_1828481 ) ) ( not ( = ?auto_1828479 ?auto_1828480 ) ) ( not ( = ?auto_1828479 ?auto_1828482 ) ) ( not ( = ?auto_1828479 ?auto_1828483 ) ) ( not ( = ?auto_1828479 ?auto_1828484 ) ) ( not ( = ?auto_1828479 ?auto_1828485 ) ) ( not ( = ?auto_1828479 ?auto_1828486 ) ) ( not ( = ?auto_1828479 ?auto_1828487 ) ) ( not ( = ?auto_1828481 ?auto_1828480 ) ) ( not ( = ?auto_1828481 ?auto_1828482 ) ) ( not ( = ?auto_1828481 ?auto_1828483 ) ) ( not ( = ?auto_1828481 ?auto_1828484 ) ) ( not ( = ?auto_1828481 ?auto_1828485 ) ) ( not ( = ?auto_1828481 ?auto_1828486 ) ) ( not ( = ?auto_1828481 ?auto_1828487 ) ) ( not ( = ?auto_1828480 ?auto_1828482 ) ) ( not ( = ?auto_1828480 ?auto_1828483 ) ) ( not ( = ?auto_1828480 ?auto_1828484 ) ) ( not ( = ?auto_1828480 ?auto_1828485 ) ) ( not ( = ?auto_1828480 ?auto_1828486 ) ) ( not ( = ?auto_1828480 ?auto_1828487 ) ) ( not ( = ?auto_1828482 ?auto_1828483 ) ) ( not ( = ?auto_1828482 ?auto_1828484 ) ) ( not ( = ?auto_1828482 ?auto_1828485 ) ) ( not ( = ?auto_1828482 ?auto_1828486 ) ) ( not ( = ?auto_1828482 ?auto_1828487 ) ) ( not ( = ?auto_1828483 ?auto_1828484 ) ) ( not ( = ?auto_1828483 ?auto_1828485 ) ) ( not ( = ?auto_1828483 ?auto_1828486 ) ) ( not ( = ?auto_1828483 ?auto_1828487 ) ) ( not ( = ?auto_1828484 ?auto_1828485 ) ) ( not ( = ?auto_1828484 ?auto_1828486 ) ) ( not ( = ?auto_1828484 ?auto_1828487 ) ) ( not ( = ?auto_1828485 ?auto_1828486 ) ) ( not ( = ?auto_1828485 ?auto_1828487 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1828486 ?auto_1828487 )
      ( MAKE-10CRATE-VERIFY ?auto_1828477 ?auto_1828478 ?auto_1828479 ?auto_1828481 ?auto_1828480 ?auto_1828482 ?auto_1828483 ?auto_1828484 ?auto_1828485 ?auto_1828486 ?auto_1828487 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1828571 - SURFACE
      ?auto_1828572 - SURFACE
      ?auto_1828573 - SURFACE
      ?auto_1828575 - SURFACE
      ?auto_1828574 - SURFACE
      ?auto_1828576 - SURFACE
      ?auto_1828577 - SURFACE
      ?auto_1828578 - SURFACE
      ?auto_1828579 - SURFACE
      ?auto_1828580 - SURFACE
      ?auto_1828581 - SURFACE
    )
    :vars
    (
      ?auto_1828584 - HOIST
      ?auto_1828583 - PLACE
      ?auto_1828582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1828584 ?auto_1828583 ) ( SURFACE-AT ?auto_1828580 ?auto_1828583 ) ( CLEAR ?auto_1828580 ) ( IS-CRATE ?auto_1828581 ) ( not ( = ?auto_1828580 ?auto_1828581 ) ) ( TRUCK-AT ?auto_1828582 ?auto_1828583 ) ( AVAILABLE ?auto_1828584 ) ( IN ?auto_1828581 ?auto_1828582 ) ( ON ?auto_1828580 ?auto_1828579 ) ( not ( = ?auto_1828579 ?auto_1828580 ) ) ( not ( = ?auto_1828579 ?auto_1828581 ) ) ( ON ?auto_1828572 ?auto_1828571 ) ( ON ?auto_1828573 ?auto_1828572 ) ( ON ?auto_1828575 ?auto_1828573 ) ( ON ?auto_1828574 ?auto_1828575 ) ( ON ?auto_1828576 ?auto_1828574 ) ( ON ?auto_1828577 ?auto_1828576 ) ( ON ?auto_1828578 ?auto_1828577 ) ( ON ?auto_1828579 ?auto_1828578 ) ( not ( = ?auto_1828571 ?auto_1828572 ) ) ( not ( = ?auto_1828571 ?auto_1828573 ) ) ( not ( = ?auto_1828571 ?auto_1828575 ) ) ( not ( = ?auto_1828571 ?auto_1828574 ) ) ( not ( = ?auto_1828571 ?auto_1828576 ) ) ( not ( = ?auto_1828571 ?auto_1828577 ) ) ( not ( = ?auto_1828571 ?auto_1828578 ) ) ( not ( = ?auto_1828571 ?auto_1828579 ) ) ( not ( = ?auto_1828571 ?auto_1828580 ) ) ( not ( = ?auto_1828571 ?auto_1828581 ) ) ( not ( = ?auto_1828572 ?auto_1828573 ) ) ( not ( = ?auto_1828572 ?auto_1828575 ) ) ( not ( = ?auto_1828572 ?auto_1828574 ) ) ( not ( = ?auto_1828572 ?auto_1828576 ) ) ( not ( = ?auto_1828572 ?auto_1828577 ) ) ( not ( = ?auto_1828572 ?auto_1828578 ) ) ( not ( = ?auto_1828572 ?auto_1828579 ) ) ( not ( = ?auto_1828572 ?auto_1828580 ) ) ( not ( = ?auto_1828572 ?auto_1828581 ) ) ( not ( = ?auto_1828573 ?auto_1828575 ) ) ( not ( = ?auto_1828573 ?auto_1828574 ) ) ( not ( = ?auto_1828573 ?auto_1828576 ) ) ( not ( = ?auto_1828573 ?auto_1828577 ) ) ( not ( = ?auto_1828573 ?auto_1828578 ) ) ( not ( = ?auto_1828573 ?auto_1828579 ) ) ( not ( = ?auto_1828573 ?auto_1828580 ) ) ( not ( = ?auto_1828573 ?auto_1828581 ) ) ( not ( = ?auto_1828575 ?auto_1828574 ) ) ( not ( = ?auto_1828575 ?auto_1828576 ) ) ( not ( = ?auto_1828575 ?auto_1828577 ) ) ( not ( = ?auto_1828575 ?auto_1828578 ) ) ( not ( = ?auto_1828575 ?auto_1828579 ) ) ( not ( = ?auto_1828575 ?auto_1828580 ) ) ( not ( = ?auto_1828575 ?auto_1828581 ) ) ( not ( = ?auto_1828574 ?auto_1828576 ) ) ( not ( = ?auto_1828574 ?auto_1828577 ) ) ( not ( = ?auto_1828574 ?auto_1828578 ) ) ( not ( = ?auto_1828574 ?auto_1828579 ) ) ( not ( = ?auto_1828574 ?auto_1828580 ) ) ( not ( = ?auto_1828574 ?auto_1828581 ) ) ( not ( = ?auto_1828576 ?auto_1828577 ) ) ( not ( = ?auto_1828576 ?auto_1828578 ) ) ( not ( = ?auto_1828576 ?auto_1828579 ) ) ( not ( = ?auto_1828576 ?auto_1828580 ) ) ( not ( = ?auto_1828576 ?auto_1828581 ) ) ( not ( = ?auto_1828577 ?auto_1828578 ) ) ( not ( = ?auto_1828577 ?auto_1828579 ) ) ( not ( = ?auto_1828577 ?auto_1828580 ) ) ( not ( = ?auto_1828577 ?auto_1828581 ) ) ( not ( = ?auto_1828578 ?auto_1828579 ) ) ( not ( = ?auto_1828578 ?auto_1828580 ) ) ( not ( = ?auto_1828578 ?auto_1828581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1828579 ?auto_1828580 ?auto_1828581 )
      ( MAKE-10CRATE-VERIFY ?auto_1828571 ?auto_1828572 ?auto_1828573 ?auto_1828575 ?auto_1828574 ?auto_1828576 ?auto_1828577 ?auto_1828578 ?auto_1828579 ?auto_1828580 ?auto_1828581 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1828676 - SURFACE
      ?auto_1828677 - SURFACE
      ?auto_1828678 - SURFACE
      ?auto_1828680 - SURFACE
      ?auto_1828679 - SURFACE
      ?auto_1828681 - SURFACE
      ?auto_1828682 - SURFACE
      ?auto_1828683 - SURFACE
      ?auto_1828684 - SURFACE
      ?auto_1828685 - SURFACE
      ?auto_1828686 - SURFACE
    )
    :vars
    (
      ?auto_1828690 - HOIST
      ?auto_1828688 - PLACE
      ?auto_1828689 - TRUCK
      ?auto_1828687 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1828690 ?auto_1828688 ) ( SURFACE-AT ?auto_1828685 ?auto_1828688 ) ( CLEAR ?auto_1828685 ) ( IS-CRATE ?auto_1828686 ) ( not ( = ?auto_1828685 ?auto_1828686 ) ) ( AVAILABLE ?auto_1828690 ) ( IN ?auto_1828686 ?auto_1828689 ) ( ON ?auto_1828685 ?auto_1828684 ) ( not ( = ?auto_1828684 ?auto_1828685 ) ) ( not ( = ?auto_1828684 ?auto_1828686 ) ) ( TRUCK-AT ?auto_1828689 ?auto_1828687 ) ( not ( = ?auto_1828687 ?auto_1828688 ) ) ( ON ?auto_1828677 ?auto_1828676 ) ( ON ?auto_1828678 ?auto_1828677 ) ( ON ?auto_1828680 ?auto_1828678 ) ( ON ?auto_1828679 ?auto_1828680 ) ( ON ?auto_1828681 ?auto_1828679 ) ( ON ?auto_1828682 ?auto_1828681 ) ( ON ?auto_1828683 ?auto_1828682 ) ( ON ?auto_1828684 ?auto_1828683 ) ( not ( = ?auto_1828676 ?auto_1828677 ) ) ( not ( = ?auto_1828676 ?auto_1828678 ) ) ( not ( = ?auto_1828676 ?auto_1828680 ) ) ( not ( = ?auto_1828676 ?auto_1828679 ) ) ( not ( = ?auto_1828676 ?auto_1828681 ) ) ( not ( = ?auto_1828676 ?auto_1828682 ) ) ( not ( = ?auto_1828676 ?auto_1828683 ) ) ( not ( = ?auto_1828676 ?auto_1828684 ) ) ( not ( = ?auto_1828676 ?auto_1828685 ) ) ( not ( = ?auto_1828676 ?auto_1828686 ) ) ( not ( = ?auto_1828677 ?auto_1828678 ) ) ( not ( = ?auto_1828677 ?auto_1828680 ) ) ( not ( = ?auto_1828677 ?auto_1828679 ) ) ( not ( = ?auto_1828677 ?auto_1828681 ) ) ( not ( = ?auto_1828677 ?auto_1828682 ) ) ( not ( = ?auto_1828677 ?auto_1828683 ) ) ( not ( = ?auto_1828677 ?auto_1828684 ) ) ( not ( = ?auto_1828677 ?auto_1828685 ) ) ( not ( = ?auto_1828677 ?auto_1828686 ) ) ( not ( = ?auto_1828678 ?auto_1828680 ) ) ( not ( = ?auto_1828678 ?auto_1828679 ) ) ( not ( = ?auto_1828678 ?auto_1828681 ) ) ( not ( = ?auto_1828678 ?auto_1828682 ) ) ( not ( = ?auto_1828678 ?auto_1828683 ) ) ( not ( = ?auto_1828678 ?auto_1828684 ) ) ( not ( = ?auto_1828678 ?auto_1828685 ) ) ( not ( = ?auto_1828678 ?auto_1828686 ) ) ( not ( = ?auto_1828680 ?auto_1828679 ) ) ( not ( = ?auto_1828680 ?auto_1828681 ) ) ( not ( = ?auto_1828680 ?auto_1828682 ) ) ( not ( = ?auto_1828680 ?auto_1828683 ) ) ( not ( = ?auto_1828680 ?auto_1828684 ) ) ( not ( = ?auto_1828680 ?auto_1828685 ) ) ( not ( = ?auto_1828680 ?auto_1828686 ) ) ( not ( = ?auto_1828679 ?auto_1828681 ) ) ( not ( = ?auto_1828679 ?auto_1828682 ) ) ( not ( = ?auto_1828679 ?auto_1828683 ) ) ( not ( = ?auto_1828679 ?auto_1828684 ) ) ( not ( = ?auto_1828679 ?auto_1828685 ) ) ( not ( = ?auto_1828679 ?auto_1828686 ) ) ( not ( = ?auto_1828681 ?auto_1828682 ) ) ( not ( = ?auto_1828681 ?auto_1828683 ) ) ( not ( = ?auto_1828681 ?auto_1828684 ) ) ( not ( = ?auto_1828681 ?auto_1828685 ) ) ( not ( = ?auto_1828681 ?auto_1828686 ) ) ( not ( = ?auto_1828682 ?auto_1828683 ) ) ( not ( = ?auto_1828682 ?auto_1828684 ) ) ( not ( = ?auto_1828682 ?auto_1828685 ) ) ( not ( = ?auto_1828682 ?auto_1828686 ) ) ( not ( = ?auto_1828683 ?auto_1828684 ) ) ( not ( = ?auto_1828683 ?auto_1828685 ) ) ( not ( = ?auto_1828683 ?auto_1828686 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1828684 ?auto_1828685 ?auto_1828686 )
      ( MAKE-10CRATE-VERIFY ?auto_1828676 ?auto_1828677 ?auto_1828678 ?auto_1828680 ?auto_1828679 ?auto_1828681 ?auto_1828682 ?auto_1828683 ?auto_1828684 ?auto_1828685 ?auto_1828686 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1828791 - SURFACE
      ?auto_1828792 - SURFACE
      ?auto_1828793 - SURFACE
      ?auto_1828795 - SURFACE
      ?auto_1828794 - SURFACE
      ?auto_1828796 - SURFACE
      ?auto_1828797 - SURFACE
      ?auto_1828798 - SURFACE
      ?auto_1828799 - SURFACE
      ?auto_1828800 - SURFACE
      ?auto_1828801 - SURFACE
    )
    :vars
    (
      ?auto_1828803 - HOIST
      ?auto_1828802 - PLACE
      ?auto_1828806 - TRUCK
      ?auto_1828804 - PLACE
      ?auto_1828805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1828803 ?auto_1828802 ) ( SURFACE-AT ?auto_1828800 ?auto_1828802 ) ( CLEAR ?auto_1828800 ) ( IS-CRATE ?auto_1828801 ) ( not ( = ?auto_1828800 ?auto_1828801 ) ) ( AVAILABLE ?auto_1828803 ) ( ON ?auto_1828800 ?auto_1828799 ) ( not ( = ?auto_1828799 ?auto_1828800 ) ) ( not ( = ?auto_1828799 ?auto_1828801 ) ) ( TRUCK-AT ?auto_1828806 ?auto_1828804 ) ( not ( = ?auto_1828804 ?auto_1828802 ) ) ( HOIST-AT ?auto_1828805 ?auto_1828804 ) ( LIFTING ?auto_1828805 ?auto_1828801 ) ( not ( = ?auto_1828803 ?auto_1828805 ) ) ( ON ?auto_1828792 ?auto_1828791 ) ( ON ?auto_1828793 ?auto_1828792 ) ( ON ?auto_1828795 ?auto_1828793 ) ( ON ?auto_1828794 ?auto_1828795 ) ( ON ?auto_1828796 ?auto_1828794 ) ( ON ?auto_1828797 ?auto_1828796 ) ( ON ?auto_1828798 ?auto_1828797 ) ( ON ?auto_1828799 ?auto_1828798 ) ( not ( = ?auto_1828791 ?auto_1828792 ) ) ( not ( = ?auto_1828791 ?auto_1828793 ) ) ( not ( = ?auto_1828791 ?auto_1828795 ) ) ( not ( = ?auto_1828791 ?auto_1828794 ) ) ( not ( = ?auto_1828791 ?auto_1828796 ) ) ( not ( = ?auto_1828791 ?auto_1828797 ) ) ( not ( = ?auto_1828791 ?auto_1828798 ) ) ( not ( = ?auto_1828791 ?auto_1828799 ) ) ( not ( = ?auto_1828791 ?auto_1828800 ) ) ( not ( = ?auto_1828791 ?auto_1828801 ) ) ( not ( = ?auto_1828792 ?auto_1828793 ) ) ( not ( = ?auto_1828792 ?auto_1828795 ) ) ( not ( = ?auto_1828792 ?auto_1828794 ) ) ( not ( = ?auto_1828792 ?auto_1828796 ) ) ( not ( = ?auto_1828792 ?auto_1828797 ) ) ( not ( = ?auto_1828792 ?auto_1828798 ) ) ( not ( = ?auto_1828792 ?auto_1828799 ) ) ( not ( = ?auto_1828792 ?auto_1828800 ) ) ( not ( = ?auto_1828792 ?auto_1828801 ) ) ( not ( = ?auto_1828793 ?auto_1828795 ) ) ( not ( = ?auto_1828793 ?auto_1828794 ) ) ( not ( = ?auto_1828793 ?auto_1828796 ) ) ( not ( = ?auto_1828793 ?auto_1828797 ) ) ( not ( = ?auto_1828793 ?auto_1828798 ) ) ( not ( = ?auto_1828793 ?auto_1828799 ) ) ( not ( = ?auto_1828793 ?auto_1828800 ) ) ( not ( = ?auto_1828793 ?auto_1828801 ) ) ( not ( = ?auto_1828795 ?auto_1828794 ) ) ( not ( = ?auto_1828795 ?auto_1828796 ) ) ( not ( = ?auto_1828795 ?auto_1828797 ) ) ( not ( = ?auto_1828795 ?auto_1828798 ) ) ( not ( = ?auto_1828795 ?auto_1828799 ) ) ( not ( = ?auto_1828795 ?auto_1828800 ) ) ( not ( = ?auto_1828795 ?auto_1828801 ) ) ( not ( = ?auto_1828794 ?auto_1828796 ) ) ( not ( = ?auto_1828794 ?auto_1828797 ) ) ( not ( = ?auto_1828794 ?auto_1828798 ) ) ( not ( = ?auto_1828794 ?auto_1828799 ) ) ( not ( = ?auto_1828794 ?auto_1828800 ) ) ( not ( = ?auto_1828794 ?auto_1828801 ) ) ( not ( = ?auto_1828796 ?auto_1828797 ) ) ( not ( = ?auto_1828796 ?auto_1828798 ) ) ( not ( = ?auto_1828796 ?auto_1828799 ) ) ( not ( = ?auto_1828796 ?auto_1828800 ) ) ( not ( = ?auto_1828796 ?auto_1828801 ) ) ( not ( = ?auto_1828797 ?auto_1828798 ) ) ( not ( = ?auto_1828797 ?auto_1828799 ) ) ( not ( = ?auto_1828797 ?auto_1828800 ) ) ( not ( = ?auto_1828797 ?auto_1828801 ) ) ( not ( = ?auto_1828798 ?auto_1828799 ) ) ( not ( = ?auto_1828798 ?auto_1828800 ) ) ( not ( = ?auto_1828798 ?auto_1828801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1828799 ?auto_1828800 ?auto_1828801 )
      ( MAKE-10CRATE-VERIFY ?auto_1828791 ?auto_1828792 ?auto_1828793 ?auto_1828795 ?auto_1828794 ?auto_1828796 ?auto_1828797 ?auto_1828798 ?auto_1828799 ?auto_1828800 ?auto_1828801 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1828916 - SURFACE
      ?auto_1828917 - SURFACE
      ?auto_1828918 - SURFACE
      ?auto_1828920 - SURFACE
      ?auto_1828919 - SURFACE
      ?auto_1828921 - SURFACE
      ?auto_1828922 - SURFACE
      ?auto_1828923 - SURFACE
      ?auto_1828924 - SURFACE
      ?auto_1828925 - SURFACE
      ?auto_1828926 - SURFACE
    )
    :vars
    (
      ?auto_1828927 - HOIST
      ?auto_1828931 - PLACE
      ?auto_1828930 - TRUCK
      ?auto_1828929 - PLACE
      ?auto_1828932 - HOIST
      ?auto_1828928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1828927 ?auto_1828931 ) ( SURFACE-AT ?auto_1828925 ?auto_1828931 ) ( CLEAR ?auto_1828925 ) ( IS-CRATE ?auto_1828926 ) ( not ( = ?auto_1828925 ?auto_1828926 ) ) ( AVAILABLE ?auto_1828927 ) ( ON ?auto_1828925 ?auto_1828924 ) ( not ( = ?auto_1828924 ?auto_1828925 ) ) ( not ( = ?auto_1828924 ?auto_1828926 ) ) ( TRUCK-AT ?auto_1828930 ?auto_1828929 ) ( not ( = ?auto_1828929 ?auto_1828931 ) ) ( HOIST-AT ?auto_1828932 ?auto_1828929 ) ( not ( = ?auto_1828927 ?auto_1828932 ) ) ( AVAILABLE ?auto_1828932 ) ( SURFACE-AT ?auto_1828926 ?auto_1828929 ) ( ON ?auto_1828926 ?auto_1828928 ) ( CLEAR ?auto_1828926 ) ( not ( = ?auto_1828925 ?auto_1828928 ) ) ( not ( = ?auto_1828926 ?auto_1828928 ) ) ( not ( = ?auto_1828924 ?auto_1828928 ) ) ( ON ?auto_1828917 ?auto_1828916 ) ( ON ?auto_1828918 ?auto_1828917 ) ( ON ?auto_1828920 ?auto_1828918 ) ( ON ?auto_1828919 ?auto_1828920 ) ( ON ?auto_1828921 ?auto_1828919 ) ( ON ?auto_1828922 ?auto_1828921 ) ( ON ?auto_1828923 ?auto_1828922 ) ( ON ?auto_1828924 ?auto_1828923 ) ( not ( = ?auto_1828916 ?auto_1828917 ) ) ( not ( = ?auto_1828916 ?auto_1828918 ) ) ( not ( = ?auto_1828916 ?auto_1828920 ) ) ( not ( = ?auto_1828916 ?auto_1828919 ) ) ( not ( = ?auto_1828916 ?auto_1828921 ) ) ( not ( = ?auto_1828916 ?auto_1828922 ) ) ( not ( = ?auto_1828916 ?auto_1828923 ) ) ( not ( = ?auto_1828916 ?auto_1828924 ) ) ( not ( = ?auto_1828916 ?auto_1828925 ) ) ( not ( = ?auto_1828916 ?auto_1828926 ) ) ( not ( = ?auto_1828916 ?auto_1828928 ) ) ( not ( = ?auto_1828917 ?auto_1828918 ) ) ( not ( = ?auto_1828917 ?auto_1828920 ) ) ( not ( = ?auto_1828917 ?auto_1828919 ) ) ( not ( = ?auto_1828917 ?auto_1828921 ) ) ( not ( = ?auto_1828917 ?auto_1828922 ) ) ( not ( = ?auto_1828917 ?auto_1828923 ) ) ( not ( = ?auto_1828917 ?auto_1828924 ) ) ( not ( = ?auto_1828917 ?auto_1828925 ) ) ( not ( = ?auto_1828917 ?auto_1828926 ) ) ( not ( = ?auto_1828917 ?auto_1828928 ) ) ( not ( = ?auto_1828918 ?auto_1828920 ) ) ( not ( = ?auto_1828918 ?auto_1828919 ) ) ( not ( = ?auto_1828918 ?auto_1828921 ) ) ( not ( = ?auto_1828918 ?auto_1828922 ) ) ( not ( = ?auto_1828918 ?auto_1828923 ) ) ( not ( = ?auto_1828918 ?auto_1828924 ) ) ( not ( = ?auto_1828918 ?auto_1828925 ) ) ( not ( = ?auto_1828918 ?auto_1828926 ) ) ( not ( = ?auto_1828918 ?auto_1828928 ) ) ( not ( = ?auto_1828920 ?auto_1828919 ) ) ( not ( = ?auto_1828920 ?auto_1828921 ) ) ( not ( = ?auto_1828920 ?auto_1828922 ) ) ( not ( = ?auto_1828920 ?auto_1828923 ) ) ( not ( = ?auto_1828920 ?auto_1828924 ) ) ( not ( = ?auto_1828920 ?auto_1828925 ) ) ( not ( = ?auto_1828920 ?auto_1828926 ) ) ( not ( = ?auto_1828920 ?auto_1828928 ) ) ( not ( = ?auto_1828919 ?auto_1828921 ) ) ( not ( = ?auto_1828919 ?auto_1828922 ) ) ( not ( = ?auto_1828919 ?auto_1828923 ) ) ( not ( = ?auto_1828919 ?auto_1828924 ) ) ( not ( = ?auto_1828919 ?auto_1828925 ) ) ( not ( = ?auto_1828919 ?auto_1828926 ) ) ( not ( = ?auto_1828919 ?auto_1828928 ) ) ( not ( = ?auto_1828921 ?auto_1828922 ) ) ( not ( = ?auto_1828921 ?auto_1828923 ) ) ( not ( = ?auto_1828921 ?auto_1828924 ) ) ( not ( = ?auto_1828921 ?auto_1828925 ) ) ( not ( = ?auto_1828921 ?auto_1828926 ) ) ( not ( = ?auto_1828921 ?auto_1828928 ) ) ( not ( = ?auto_1828922 ?auto_1828923 ) ) ( not ( = ?auto_1828922 ?auto_1828924 ) ) ( not ( = ?auto_1828922 ?auto_1828925 ) ) ( not ( = ?auto_1828922 ?auto_1828926 ) ) ( not ( = ?auto_1828922 ?auto_1828928 ) ) ( not ( = ?auto_1828923 ?auto_1828924 ) ) ( not ( = ?auto_1828923 ?auto_1828925 ) ) ( not ( = ?auto_1828923 ?auto_1828926 ) ) ( not ( = ?auto_1828923 ?auto_1828928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1828924 ?auto_1828925 ?auto_1828926 )
      ( MAKE-10CRATE-VERIFY ?auto_1828916 ?auto_1828917 ?auto_1828918 ?auto_1828920 ?auto_1828919 ?auto_1828921 ?auto_1828922 ?auto_1828923 ?auto_1828924 ?auto_1828925 ?auto_1828926 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829042 - SURFACE
      ?auto_1829043 - SURFACE
      ?auto_1829044 - SURFACE
      ?auto_1829046 - SURFACE
      ?auto_1829045 - SURFACE
      ?auto_1829047 - SURFACE
      ?auto_1829048 - SURFACE
      ?auto_1829049 - SURFACE
      ?auto_1829050 - SURFACE
      ?auto_1829051 - SURFACE
      ?auto_1829052 - SURFACE
    )
    :vars
    (
      ?auto_1829058 - HOIST
      ?auto_1829056 - PLACE
      ?auto_1829053 - PLACE
      ?auto_1829055 - HOIST
      ?auto_1829054 - SURFACE
      ?auto_1829057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829058 ?auto_1829056 ) ( SURFACE-AT ?auto_1829051 ?auto_1829056 ) ( CLEAR ?auto_1829051 ) ( IS-CRATE ?auto_1829052 ) ( not ( = ?auto_1829051 ?auto_1829052 ) ) ( AVAILABLE ?auto_1829058 ) ( ON ?auto_1829051 ?auto_1829050 ) ( not ( = ?auto_1829050 ?auto_1829051 ) ) ( not ( = ?auto_1829050 ?auto_1829052 ) ) ( not ( = ?auto_1829053 ?auto_1829056 ) ) ( HOIST-AT ?auto_1829055 ?auto_1829053 ) ( not ( = ?auto_1829058 ?auto_1829055 ) ) ( AVAILABLE ?auto_1829055 ) ( SURFACE-AT ?auto_1829052 ?auto_1829053 ) ( ON ?auto_1829052 ?auto_1829054 ) ( CLEAR ?auto_1829052 ) ( not ( = ?auto_1829051 ?auto_1829054 ) ) ( not ( = ?auto_1829052 ?auto_1829054 ) ) ( not ( = ?auto_1829050 ?auto_1829054 ) ) ( TRUCK-AT ?auto_1829057 ?auto_1829056 ) ( ON ?auto_1829043 ?auto_1829042 ) ( ON ?auto_1829044 ?auto_1829043 ) ( ON ?auto_1829046 ?auto_1829044 ) ( ON ?auto_1829045 ?auto_1829046 ) ( ON ?auto_1829047 ?auto_1829045 ) ( ON ?auto_1829048 ?auto_1829047 ) ( ON ?auto_1829049 ?auto_1829048 ) ( ON ?auto_1829050 ?auto_1829049 ) ( not ( = ?auto_1829042 ?auto_1829043 ) ) ( not ( = ?auto_1829042 ?auto_1829044 ) ) ( not ( = ?auto_1829042 ?auto_1829046 ) ) ( not ( = ?auto_1829042 ?auto_1829045 ) ) ( not ( = ?auto_1829042 ?auto_1829047 ) ) ( not ( = ?auto_1829042 ?auto_1829048 ) ) ( not ( = ?auto_1829042 ?auto_1829049 ) ) ( not ( = ?auto_1829042 ?auto_1829050 ) ) ( not ( = ?auto_1829042 ?auto_1829051 ) ) ( not ( = ?auto_1829042 ?auto_1829052 ) ) ( not ( = ?auto_1829042 ?auto_1829054 ) ) ( not ( = ?auto_1829043 ?auto_1829044 ) ) ( not ( = ?auto_1829043 ?auto_1829046 ) ) ( not ( = ?auto_1829043 ?auto_1829045 ) ) ( not ( = ?auto_1829043 ?auto_1829047 ) ) ( not ( = ?auto_1829043 ?auto_1829048 ) ) ( not ( = ?auto_1829043 ?auto_1829049 ) ) ( not ( = ?auto_1829043 ?auto_1829050 ) ) ( not ( = ?auto_1829043 ?auto_1829051 ) ) ( not ( = ?auto_1829043 ?auto_1829052 ) ) ( not ( = ?auto_1829043 ?auto_1829054 ) ) ( not ( = ?auto_1829044 ?auto_1829046 ) ) ( not ( = ?auto_1829044 ?auto_1829045 ) ) ( not ( = ?auto_1829044 ?auto_1829047 ) ) ( not ( = ?auto_1829044 ?auto_1829048 ) ) ( not ( = ?auto_1829044 ?auto_1829049 ) ) ( not ( = ?auto_1829044 ?auto_1829050 ) ) ( not ( = ?auto_1829044 ?auto_1829051 ) ) ( not ( = ?auto_1829044 ?auto_1829052 ) ) ( not ( = ?auto_1829044 ?auto_1829054 ) ) ( not ( = ?auto_1829046 ?auto_1829045 ) ) ( not ( = ?auto_1829046 ?auto_1829047 ) ) ( not ( = ?auto_1829046 ?auto_1829048 ) ) ( not ( = ?auto_1829046 ?auto_1829049 ) ) ( not ( = ?auto_1829046 ?auto_1829050 ) ) ( not ( = ?auto_1829046 ?auto_1829051 ) ) ( not ( = ?auto_1829046 ?auto_1829052 ) ) ( not ( = ?auto_1829046 ?auto_1829054 ) ) ( not ( = ?auto_1829045 ?auto_1829047 ) ) ( not ( = ?auto_1829045 ?auto_1829048 ) ) ( not ( = ?auto_1829045 ?auto_1829049 ) ) ( not ( = ?auto_1829045 ?auto_1829050 ) ) ( not ( = ?auto_1829045 ?auto_1829051 ) ) ( not ( = ?auto_1829045 ?auto_1829052 ) ) ( not ( = ?auto_1829045 ?auto_1829054 ) ) ( not ( = ?auto_1829047 ?auto_1829048 ) ) ( not ( = ?auto_1829047 ?auto_1829049 ) ) ( not ( = ?auto_1829047 ?auto_1829050 ) ) ( not ( = ?auto_1829047 ?auto_1829051 ) ) ( not ( = ?auto_1829047 ?auto_1829052 ) ) ( not ( = ?auto_1829047 ?auto_1829054 ) ) ( not ( = ?auto_1829048 ?auto_1829049 ) ) ( not ( = ?auto_1829048 ?auto_1829050 ) ) ( not ( = ?auto_1829048 ?auto_1829051 ) ) ( not ( = ?auto_1829048 ?auto_1829052 ) ) ( not ( = ?auto_1829048 ?auto_1829054 ) ) ( not ( = ?auto_1829049 ?auto_1829050 ) ) ( not ( = ?auto_1829049 ?auto_1829051 ) ) ( not ( = ?auto_1829049 ?auto_1829052 ) ) ( not ( = ?auto_1829049 ?auto_1829054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829050 ?auto_1829051 ?auto_1829052 )
      ( MAKE-10CRATE-VERIFY ?auto_1829042 ?auto_1829043 ?auto_1829044 ?auto_1829046 ?auto_1829045 ?auto_1829047 ?auto_1829048 ?auto_1829049 ?auto_1829050 ?auto_1829051 ?auto_1829052 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829168 - SURFACE
      ?auto_1829169 - SURFACE
      ?auto_1829170 - SURFACE
      ?auto_1829172 - SURFACE
      ?auto_1829171 - SURFACE
      ?auto_1829173 - SURFACE
      ?auto_1829174 - SURFACE
      ?auto_1829175 - SURFACE
      ?auto_1829176 - SURFACE
      ?auto_1829177 - SURFACE
      ?auto_1829178 - SURFACE
    )
    :vars
    (
      ?auto_1829184 - HOIST
      ?auto_1829179 - PLACE
      ?auto_1829181 - PLACE
      ?auto_1829180 - HOIST
      ?auto_1829183 - SURFACE
      ?auto_1829182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829184 ?auto_1829179 ) ( IS-CRATE ?auto_1829178 ) ( not ( = ?auto_1829177 ?auto_1829178 ) ) ( not ( = ?auto_1829176 ?auto_1829177 ) ) ( not ( = ?auto_1829176 ?auto_1829178 ) ) ( not ( = ?auto_1829181 ?auto_1829179 ) ) ( HOIST-AT ?auto_1829180 ?auto_1829181 ) ( not ( = ?auto_1829184 ?auto_1829180 ) ) ( AVAILABLE ?auto_1829180 ) ( SURFACE-AT ?auto_1829178 ?auto_1829181 ) ( ON ?auto_1829178 ?auto_1829183 ) ( CLEAR ?auto_1829178 ) ( not ( = ?auto_1829177 ?auto_1829183 ) ) ( not ( = ?auto_1829178 ?auto_1829183 ) ) ( not ( = ?auto_1829176 ?auto_1829183 ) ) ( TRUCK-AT ?auto_1829182 ?auto_1829179 ) ( SURFACE-AT ?auto_1829176 ?auto_1829179 ) ( CLEAR ?auto_1829176 ) ( LIFTING ?auto_1829184 ?auto_1829177 ) ( IS-CRATE ?auto_1829177 ) ( ON ?auto_1829169 ?auto_1829168 ) ( ON ?auto_1829170 ?auto_1829169 ) ( ON ?auto_1829172 ?auto_1829170 ) ( ON ?auto_1829171 ?auto_1829172 ) ( ON ?auto_1829173 ?auto_1829171 ) ( ON ?auto_1829174 ?auto_1829173 ) ( ON ?auto_1829175 ?auto_1829174 ) ( ON ?auto_1829176 ?auto_1829175 ) ( not ( = ?auto_1829168 ?auto_1829169 ) ) ( not ( = ?auto_1829168 ?auto_1829170 ) ) ( not ( = ?auto_1829168 ?auto_1829172 ) ) ( not ( = ?auto_1829168 ?auto_1829171 ) ) ( not ( = ?auto_1829168 ?auto_1829173 ) ) ( not ( = ?auto_1829168 ?auto_1829174 ) ) ( not ( = ?auto_1829168 ?auto_1829175 ) ) ( not ( = ?auto_1829168 ?auto_1829176 ) ) ( not ( = ?auto_1829168 ?auto_1829177 ) ) ( not ( = ?auto_1829168 ?auto_1829178 ) ) ( not ( = ?auto_1829168 ?auto_1829183 ) ) ( not ( = ?auto_1829169 ?auto_1829170 ) ) ( not ( = ?auto_1829169 ?auto_1829172 ) ) ( not ( = ?auto_1829169 ?auto_1829171 ) ) ( not ( = ?auto_1829169 ?auto_1829173 ) ) ( not ( = ?auto_1829169 ?auto_1829174 ) ) ( not ( = ?auto_1829169 ?auto_1829175 ) ) ( not ( = ?auto_1829169 ?auto_1829176 ) ) ( not ( = ?auto_1829169 ?auto_1829177 ) ) ( not ( = ?auto_1829169 ?auto_1829178 ) ) ( not ( = ?auto_1829169 ?auto_1829183 ) ) ( not ( = ?auto_1829170 ?auto_1829172 ) ) ( not ( = ?auto_1829170 ?auto_1829171 ) ) ( not ( = ?auto_1829170 ?auto_1829173 ) ) ( not ( = ?auto_1829170 ?auto_1829174 ) ) ( not ( = ?auto_1829170 ?auto_1829175 ) ) ( not ( = ?auto_1829170 ?auto_1829176 ) ) ( not ( = ?auto_1829170 ?auto_1829177 ) ) ( not ( = ?auto_1829170 ?auto_1829178 ) ) ( not ( = ?auto_1829170 ?auto_1829183 ) ) ( not ( = ?auto_1829172 ?auto_1829171 ) ) ( not ( = ?auto_1829172 ?auto_1829173 ) ) ( not ( = ?auto_1829172 ?auto_1829174 ) ) ( not ( = ?auto_1829172 ?auto_1829175 ) ) ( not ( = ?auto_1829172 ?auto_1829176 ) ) ( not ( = ?auto_1829172 ?auto_1829177 ) ) ( not ( = ?auto_1829172 ?auto_1829178 ) ) ( not ( = ?auto_1829172 ?auto_1829183 ) ) ( not ( = ?auto_1829171 ?auto_1829173 ) ) ( not ( = ?auto_1829171 ?auto_1829174 ) ) ( not ( = ?auto_1829171 ?auto_1829175 ) ) ( not ( = ?auto_1829171 ?auto_1829176 ) ) ( not ( = ?auto_1829171 ?auto_1829177 ) ) ( not ( = ?auto_1829171 ?auto_1829178 ) ) ( not ( = ?auto_1829171 ?auto_1829183 ) ) ( not ( = ?auto_1829173 ?auto_1829174 ) ) ( not ( = ?auto_1829173 ?auto_1829175 ) ) ( not ( = ?auto_1829173 ?auto_1829176 ) ) ( not ( = ?auto_1829173 ?auto_1829177 ) ) ( not ( = ?auto_1829173 ?auto_1829178 ) ) ( not ( = ?auto_1829173 ?auto_1829183 ) ) ( not ( = ?auto_1829174 ?auto_1829175 ) ) ( not ( = ?auto_1829174 ?auto_1829176 ) ) ( not ( = ?auto_1829174 ?auto_1829177 ) ) ( not ( = ?auto_1829174 ?auto_1829178 ) ) ( not ( = ?auto_1829174 ?auto_1829183 ) ) ( not ( = ?auto_1829175 ?auto_1829176 ) ) ( not ( = ?auto_1829175 ?auto_1829177 ) ) ( not ( = ?auto_1829175 ?auto_1829178 ) ) ( not ( = ?auto_1829175 ?auto_1829183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829176 ?auto_1829177 ?auto_1829178 )
      ( MAKE-10CRATE-VERIFY ?auto_1829168 ?auto_1829169 ?auto_1829170 ?auto_1829172 ?auto_1829171 ?auto_1829173 ?auto_1829174 ?auto_1829175 ?auto_1829176 ?auto_1829177 ?auto_1829178 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1829294 - SURFACE
      ?auto_1829295 - SURFACE
      ?auto_1829296 - SURFACE
      ?auto_1829298 - SURFACE
      ?auto_1829297 - SURFACE
      ?auto_1829299 - SURFACE
      ?auto_1829300 - SURFACE
      ?auto_1829301 - SURFACE
      ?auto_1829302 - SURFACE
      ?auto_1829303 - SURFACE
      ?auto_1829304 - SURFACE
    )
    :vars
    (
      ?auto_1829308 - HOIST
      ?auto_1829309 - PLACE
      ?auto_1829307 - PLACE
      ?auto_1829306 - HOIST
      ?auto_1829305 - SURFACE
      ?auto_1829310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1829308 ?auto_1829309 ) ( IS-CRATE ?auto_1829304 ) ( not ( = ?auto_1829303 ?auto_1829304 ) ) ( not ( = ?auto_1829302 ?auto_1829303 ) ) ( not ( = ?auto_1829302 ?auto_1829304 ) ) ( not ( = ?auto_1829307 ?auto_1829309 ) ) ( HOIST-AT ?auto_1829306 ?auto_1829307 ) ( not ( = ?auto_1829308 ?auto_1829306 ) ) ( AVAILABLE ?auto_1829306 ) ( SURFACE-AT ?auto_1829304 ?auto_1829307 ) ( ON ?auto_1829304 ?auto_1829305 ) ( CLEAR ?auto_1829304 ) ( not ( = ?auto_1829303 ?auto_1829305 ) ) ( not ( = ?auto_1829304 ?auto_1829305 ) ) ( not ( = ?auto_1829302 ?auto_1829305 ) ) ( TRUCK-AT ?auto_1829310 ?auto_1829309 ) ( SURFACE-AT ?auto_1829302 ?auto_1829309 ) ( CLEAR ?auto_1829302 ) ( IS-CRATE ?auto_1829303 ) ( AVAILABLE ?auto_1829308 ) ( IN ?auto_1829303 ?auto_1829310 ) ( ON ?auto_1829295 ?auto_1829294 ) ( ON ?auto_1829296 ?auto_1829295 ) ( ON ?auto_1829298 ?auto_1829296 ) ( ON ?auto_1829297 ?auto_1829298 ) ( ON ?auto_1829299 ?auto_1829297 ) ( ON ?auto_1829300 ?auto_1829299 ) ( ON ?auto_1829301 ?auto_1829300 ) ( ON ?auto_1829302 ?auto_1829301 ) ( not ( = ?auto_1829294 ?auto_1829295 ) ) ( not ( = ?auto_1829294 ?auto_1829296 ) ) ( not ( = ?auto_1829294 ?auto_1829298 ) ) ( not ( = ?auto_1829294 ?auto_1829297 ) ) ( not ( = ?auto_1829294 ?auto_1829299 ) ) ( not ( = ?auto_1829294 ?auto_1829300 ) ) ( not ( = ?auto_1829294 ?auto_1829301 ) ) ( not ( = ?auto_1829294 ?auto_1829302 ) ) ( not ( = ?auto_1829294 ?auto_1829303 ) ) ( not ( = ?auto_1829294 ?auto_1829304 ) ) ( not ( = ?auto_1829294 ?auto_1829305 ) ) ( not ( = ?auto_1829295 ?auto_1829296 ) ) ( not ( = ?auto_1829295 ?auto_1829298 ) ) ( not ( = ?auto_1829295 ?auto_1829297 ) ) ( not ( = ?auto_1829295 ?auto_1829299 ) ) ( not ( = ?auto_1829295 ?auto_1829300 ) ) ( not ( = ?auto_1829295 ?auto_1829301 ) ) ( not ( = ?auto_1829295 ?auto_1829302 ) ) ( not ( = ?auto_1829295 ?auto_1829303 ) ) ( not ( = ?auto_1829295 ?auto_1829304 ) ) ( not ( = ?auto_1829295 ?auto_1829305 ) ) ( not ( = ?auto_1829296 ?auto_1829298 ) ) ( not ( = ?auto_1829296 ?auto_1829297 ) ) ( not ( = ?auto_1829296 ?auto_1829299 ) ) ( not ( = ?auto_1829296 ?auto_1829300 ) ) ( not ( = ?auto_1829296 ?auto_1829301 ) ) ( not ( = ?auto_1829296 ?auto_1829302 ) ) ( not ( = ?auto_1829296 ?auto_1829303 ) ) ( not ( = ?auto_1829296 ?auto_1829304 ) ) ( not ( = ?auto_1829296 ?auto_1829305 ) ) ( not ( = ?auto_1829298 ?auto_1829297 ) ) ( not ( = ?auto_1829298 ?auto_1829299 ) ) ( not ( = ?auto_1829298 ?auto_1829300 ) ) ( not ( = ?auto_1829298 ?auto_1829301 ) ) ( not ( = ?auto_1829298 ?auto_1829302 ) ) ( not ( = ?auto_1829298 ?auto_1829303 ) ) ( not ( = ?auto_1829298 ?auto_1829304 ) ) ( not ( = ?auto_1829298 ?auto_1829305 ) ) ( not ( = ?auto_1829297 ?auto_1829299 ) ) ( not ( = ?auto_1829297 ?auto_1829300 ) ) ( not ( = ?auto_1829297 ?auto_1829301 ) ) ( not ( = ?auto_1829297 ?auto_1829302 ) ) ( not ( = ?auto_1829297 ?auto_1829303 ) ) ( not ( = ?auto_1829297 ?auto_1829304 ) ) ( not ( = ?auto_1829297 ?auto_1829305 ) ) ( not ( = ?auto_1829299 ?auto_1829300 ) ) ( not ( = ?auto_1829299 ?auto_1829301 ) ) ( not ( = ?auto_1829299 ?auto_1829302 ) ) ( not ( = ?auto_1829299 ?auto_1829303 ) ) ( not ( = ?auto_1829299 ?auto_1829304 ) ) ( not ( = ?auto_1829299 ?auto_1829305 ) ) ( not ( = ?auto_1829300 ?auto_1829301 ) ) ( not ( = ?auto_1829300 ?auto_1829302 ) ) ( not ( = ?auto_1829300 ?auto_1829303 ) ) ( not ( = ?auto_1829300 ?auto_1829304 ) ) ( not ( = ?auto_1829300 ?auto_1829305 ) ) ( not ( = ?auto_1829301 ?auto_1829302 ) ) ( not ( = ?auto_1829301 ?auto_1829303 ) ) ( not ( = ?auto_1829301 ?auto_1829304 ) ) ( not ( = ?auto_1829301 ?auto_1829305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1829302 ?auto_1829303 ?auto_1829304 )
      ( MAKE-10CRATE-VERIFY ?auto_1829294 ?auto_1829295 ?auto_1829296 ?auto_1829298 ?auto_1829297 ?auto_1829299 ?auto_1829300 ?auto_1829301 ?auto_1829302 ?auto_1829303 ?auto_1829304 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1835982 - SURFACE
      ?auto_1835983 - SURFACE
    )
    :vars
    (
      ?auto_1835987 - HOIST
      ?auto_1835984 - PLACE
      ?auto_1835990 - SURFACE
      ?auto_1835988 - PLACE
      ?auto_1835985 - HOIST
      ?auto_1835989 - SURFACE
      ?auto_1835986 - TRUCK
      ?auto_1835991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1835987 ?auto_1835984 ) ( SURFACE-AT ?auto_1835982 ?auto_1835984 ) ( CLEAR ?auto_1835982 ) ( IS-CRATE ?auto_1835983 ) ( not ( = ?auto_1835982 ?auto_1835983 ) ) ( ON ?auto_1835982 ?auto_1835990 ) ( not ( = ?auto_1835990 ?auto_1835982 ) ) ( not ( = ?auto_1835990 ?auto_1835983 ) ) ( not ( = ?auto_1835988 ?auto_1835984 ) ) ( HOIST-AT ?auto_1835985 ?auto_1835988 ) ( not ( = ?auto_1835987 ?auto_1835985 ) ) ( AVAILABLE ?auto_1835985 ) ( SURFACE-AT ?auto_1835983 ?auto_1835988 ) ( ON ?auto_1835983 ?auto_1835989 ) ( CLEAR ?auto_1835983 ) ( not ( = ?auto_1835982 ?auto_1835989 ) ) ( not ( = ?auto_1835983 ?auto_1835989 ) ) ( not ( = ?auto_1835990 ?auto_1835989 ) ) ( TRUCK-AT ?auto_1835986 ?auto_1835984 ) ( LIFTING ?auto_1835987 ?auto_1835991 ) ( IS-CRATE ?auto_1835991 ) ( not ( = ?auto_1835982 ?auto_1835991 ) ) ( not ( = ?auto_1835983 ?auto_1835991 ) ) ( not ( = ?auto_1835990 ?auto_1835991 ) ) ( not ( = ?auto_1835989 ?auto_1835991 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1835987 ?auto_1835991 ?auto_1835986 ?auto_1835984 )
      ( MAKE-1CRATE ?auto_1835982 ?auto_1835983 )
      ( MAKE-1CRATE-VERIFY ?auto_1835982 ?auto_1835983 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1836552 - SURFACE
      ?auto_1836553 - SURFACE
      ?auto_1836554 - SURFACE
      ?auto_1836556 - SURFACE
      ?auto_1836555 - SURFACE
      ?auto_1836557 - SURFACE
      ?auto_1836558 - SURFACE
      ?auto_1836559 - SURFACE
      ?auto_1836560 - SURFACE
      ?auto_1836561 - SURFACE
      ?auto_1836562 - SURFACE
      ?auto_1836563 - SURFACE
    )
    :vars
    (
      ?auto_1836564 - HOIST
      ?auto_1836565 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1836564 ?auto_1836565 ) ( SURFACE-AT ?auto_1836562 ?auto_1836565 ) ( CLEAR ?auto_1836562 ) ( LIFTING ?auto_1836564 ?auto_1836563 ) ( IS-CRATE ?auto_1836563 ) ( not ( = ?auto_1836562 ?auto_1836563 ) ) ( ON ?auto_1836553 ?auto_1836552 ) ( ON ?auto_1836554 ?auto_1836553 ) ( ON ?auto_1836556 ?auto_1836554 ) ( ON ?auto_1836555 ?auto_1836556 ) ( ON ?auto_1836557 ?auto_1836555 ) ( ON ?auto_1836558 ?auto_1836557 ) ( ON ?auto_1836559 ?auto_1836558 ) ( ON ?auto_1836560 ?auto_1836559 ) ( ON ?auto_1836561 ?auto_1836560 ) ( ON ?auto_1836562 ?auto_1836561 ) ( not ( = ?auto_1836552 ?auto_1836553 ) ) ( not ( = ?auto_1836552 ?auto_1836554 ) ) ( not ( = ?auto_1836552 ?auto_1836556 ) ) ( not ( = ?auto_1836552 ?auto_1836555 ) ) ( not ( = ?auto_1836552 ?auto_1836557 ) ) ( not ( = ?auto_1836552 ?auto_1836558 ) ) ( not ( = ?auto_1836552 ?auto_1836559 ) ) ( not ( = ?auto_1836552 ?auto_1836560 ) ) ( not ( = ?auto_1836552 ?auto_1836561 ) ) ( not ( = ?auto_1836552 ?auto_1836562 ) ) ( not ( = ?auto_1836552 ?auto_1836563 ) ) ( not ( = ?auto_1836553 ?auto_1836554 ) ) ( not ( = ?auto_1836553 ?auto_1836556 ) ) ( not ( = ?auto_1836553 ?auto_1836555 ) ) ( not ( = ?auto_1836553 ?auto_1836557 ) ) ( not ( = ?auto_1836553 ?auto_1836558 ) ) ( not ( = ?auto_1836553 ?auto_1836559 ) ) ( not ( = ?auto_1836553 ?auto_1836560 ) ) ( not ( = ?auto_1836553 ?auto_1836561 ) ) ( not ( = ?auto_1836553 ?auto_1836562 ) ) ( not ( = ?auto_1836553 ?auto_1836563 ) ) ( not ( = ?auto_1836554 ?auto_1836556 ) ) ( not ( = ?auto_1836554 ?auto_1836555 ) ) ( not ( = ?auto_1836554 ?auto_1836557 ) ) ( not ( = ?auto_1836554 ?auto_1836558 ) ) ( not ( = ?auto_1836554 ?auto_1836559 ) ) ( not ( = ?auto_1836554 ?auto_1836560 ) ) ( not ( = ?auto_1836554 ?auto_1836561 ) ) ( not ( = ?auto_1836554 ?auto_1836562 ) ) ( not ( = ?auto_1836554 ?auto_1836563 ) ) ( not ( = ?auto_1836556 ?auto_1836555 ) ) ( not ( = ?auto_1836556 ?auto_1836557 ) ) ( not ( = ?auto_1836556 ?auto_1836558 ) ) ( not ( = ?auto_1836556 ?auto_1836559 ) ) ( not ( = ?auto_1836556 ?auto_1836560 ) ) ( not ( = ?auto_1836556 ?auto_1836561 ) ) ( not ( = ?auto_1836556 ?auto_1836562 ) ) ( not ( = ?auto_1836556 ?auto_1836563 ) ) ( not ( = ?auto_1836555 ?auto_1836557 ) ) ( not ( = ?auto_1836555 ?auto_1836558 ) ) ( not ( = ?auto_1836555 ?auto_1836559 ) ) ( not ( = ?auto_1836555 ?auto_1836560 ) ) ( not ( = ?auto_1836555 ?auto_1836561 ) ) ( not ( = ?auto_1836555 ?auto_1836562 ) ) ( not ( = ?auto_1836555 ?auto_1836563 ) ) ( not ( = ?auto_1836557 ?auto_1836558 ) ) ( not ( = ?auto_1836557 ?auto_1836559 ) ) ( not ( = ?auto_1836557 ?auto_1836560 ) ) ( not ( = ?auto_1836557 ?auto_1836561 ) ) ( not ( = ?auto_1836557 ?auto_1836562 ) ) ( not ( = ?auto_1836557 ?auto_1836563 ) ) ( not ( = ?auto_1836558 ?auto_1836559 ) ) ( not ( = ?auto_1836558 ?auto_1836560 ) ) ( not ( = ?auto_1836558 ?auto_1836561 ) ) ( not ( = ?auto_1836558 ?auto_1836562 ) ) ( not ( = ?auto_1836558 ?auto_1836563 ) ) ( not ( = ?auto_1836559 ?auto_1836560 ) ) ( not ( = ?auto_1836559 ?auto_1836561 ) ) ( not ( = ?auto_1836559 ?auto_1836562 ) ) ( not ( = ?auto_1836559 ?auto_1836563 ) ) ( not ( = ?auto_1836560 ?auto_1836561 ) ) ( not ( = ?auto_1836560 ?auto_1836562 ) ) ( not ( = ?auto_1836560 ?auto_1836563 ) ) ( not ( = ?auto_1836561 ?auto_1836562 ) ) ( not ( = ?auto_1836561 ?auto_1836563 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1836562 ?auto_1836563 )
      ( MAKE-11CRATE-VERIFY ?auto_1836552 ?auto_1836553 ?auto_1836554 ?auto_1836556 ?auto_1836555 ?auto_1836557 ?auto_1836558 ?auto_1836559 ?auto_1836560 ?auto_1836561 ?auto_1836562 ?auto_1836563 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1836661 - SURFACE
      ?auto_1836662 - SURFACE
      ?auto_1836663 - SURFACE
      ?auto_1836665 - SURFACE
      ?auto_1836664 - SURFACE
      ?auto_1836666 - SURFACE
      ?auto_1836667 - SURFACE
      ?auto_1836668 - SURFACE
      ?auto_1836669 - SURFACE
      ?auto_1836670 - SURFACE
      ?auto_1836671 - SURFACE
      ?auto_1836672 - SURFACE
    )
    :vars
    (
      ?auto_1836675 - HOIST
      ?auto_1836673 - PLACE
      ?auto_1836674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1836675 ?auto_1836673 ) ( SURFACE-AT ?auto_1836671 ?auto_1836673 ) ( CLEAR ?auto_1836671 ) ( IS-CRATE ?auto_1836672 ) ( not ( = ?auto_1836671 ?auto_1836672 ) ) ( TRUCK-AT ?auto_1836674 ?auto_1836673 ) ( AVAILABLE ?auto_1836675 ) ( IN ?auto_1836672 ?auto_1836674 ) ( ON ?auto_1836671 ?auto_1836670 ) ( not ( = ?auto_1836670 ?auto_1836671 ) ) ( not ( = ?auto_1836670 ?auto_1836672 ) ) ( ON ?auto_1836662 ?auto_1836661 ) ( ON ?auto_1836663 ?auto_1836662 ) ( ON ?auto_1836665 ?auto_1836663 ) ( ON ?auto_1836664 ?auto_1836665 ) ( ON ?auto_1836666 ?auto_1836664 ) ( ON ?auto_1836667 ?auto_1836666 ) ( ON ?auto_1836668 ?auto_1836667 ) ( ON ?auto_1836669 ?auto_1836668 ) ( ON ?auto_1836670 ?auto_1836669 ) ( not ( = ?auto_1836661 ?auto_1836662 ) ) ( not ( = ?auto_1836661 ?auto_1836663 ) ) ( not ( = ?auto_1836661 ?auto_1836665 ) ) ( not ( = ?auto_1836661 ?auto_1836664 ) ) ( not ( = ?auto_1836661 ?auto_1836666 ) ) ( not ( = ?auto_1836661 ?auto_1836667 ) ) ( not ( = ?auto_1836661 ?auto_1836668 ) ) ( not ( = ?auto_1836661 ?auto_1836669 ) ) ( not ( = ?auto_1836661 ?auto_1836670 ) ) ( not ( = ?auto_1836661 ?auto_1836671 ) ) ( not ( = ?auto_1836661 ?auto_1836672 ) ) ( not ( = ?auto_1836662 ?auto_1836663 ) ) ( not ( = ?auto_1836662 ?auto_1836665 ) ) ( not ( = ?auto_1836662 ?auto_1836664 ) ) ( not ( = ?auto_1836662 ?auto_1836666 ) ) ( not ( = ?auto_1836662 ?auto_1836667 ) ) ( not ( = ?auto_1836662 ?auto_1836668 ) ) ( not ( = ?auto_1836662 ?auto_1836669 ) ) ( not ( = ?auto_1836662 ?auto_1836670 ) ) ( not ( = ?auto_1836662 ?auto_1836671 ) ) ( not ( = ?auto_1836662 ?auto_1836672 ) ) ( not ( = ?auto_1836663 ?auto_1836665 ) ) ( not ( = ?auto_1836663 ?auto_1836664 ) ) ( not ( = ?auto_1836663 ?auto_1836666 ) ) ( not ( = ?auto_1836663 ?auto_1836667 ) ) ( not ( = ?auto_1836663 ?auto_1836668 ) ) ( not ( = ?auto_1836663 ?auto_1836669 ) ) ( not ( = ?auto_1836663 ?auto_1836670 ) ) ( not ( = ?auto_1836663 ?auto_1836671 ) ) ( not ( = ?auto_1836663 ?auto_1836672 ) ) ( not ( = ?auto_1836665 ?auto_1836664 ) ) ( not ( = ?auto_1836665 ?auto_1836666 ) ) ( not ( = ?auto_1836665 ?auto_1836667 ) ) ( not ( = ?auto_1836665 ?auto_1836668 ) ) ( not ( = ?auto_1836665 ?auto_1836669 ) ) ( not ( = ?auto_1836665 ?auto_1836670 ) ) ( not ( = ?auto_1836665 ?auto_1836671 ) ) ( not ( = ?auto_1836665 ?auto_1836672 ) ) ( not ( = ?auto_1836664 ?auto_1836666 ) ) ( not ( = ?auto_1836664 ?auto_1836667 ) ) ( not ( = ?auto_1836664 ?auto_1836668 ) ) ( not ( = ?auto_1836664 ?auto_1836669 ) ) ( not ( = ?auto_1836664 ?auto_1836670 ) ) ( not ( = ?auto_1836664 ?auto_1836671 ) ) ( not ( = ?auto_1836664 ?auto_1836672 ) ) ( not ( = ?auto_1836666 ?auto_1836667 ) ) ( not ( = ?auto_1836666 ?auto_1836668 ) ) ( not ( = ?auto_1836666 ?auto_1836669 ) ) ( not ( = ?auto_1836666 ?auto_1836670 ) ) ( not ( = ?auto_1836666 ?auto_1836671 ) ) ( not ( = ?auto_1836666 ?auto_1836672 ) ) ( not ( = ?auto_1836667 ?auto_1836668 ) ) ( not ( = ?auto_1836667 ?auto_1836669 ) ) ( not ( = ?auto_1836667 ?auto_1836670 ) ) ( not ( = ?auto_1836667 ?auto_1836671 ) ) ( not ( = ?auto_1836667 ?auto_1836672 ) ) ( not ( = ?auto_1836668 ?auto_1836669 ) ) ( not ( = ?auto_1836668 ?auto_1836670 ) ) ( not ( = ?auto_1836668 ?auto_1836671 ) ) ( not ( = ?auto_1836668 ?auto_1836672 ) ) ( not ( = ?auto_1836669 ?auto_1836670 ) ) ( not ( = ?auto_1836669 ?auto_1836671 ) ) ( not ( = ?auto_1836669 ?auto_1836672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1836670 ?auto_1836671 ?auto_1836672 )
      ( MAKE-11CRATE-VERIFY ?auto_1836661 ?auto_1836662 ?auto_1836663 ?auto_1836665 ?auto_1836664 ?auto_1836666 ?auto_1836667 ?auto_1836668 ?auto_1836669 ?auto_1836670 ?auto_1836671 ?auto_1836672 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1836782 - SURFACE
      ?auto_1836783 - SURFACE
      ?auto_1836784 - SURFACE
      ?auto_1836786 - SURFACE
      ?auto_1836785 - SURFACE
      ?auto_1836787 - SURFACE
      ?auto_1836788 - SURFACE
      ?auto_1836789 - SURFACE
      ?auto_1836790 - SURFACE
      ?auto_1836791 - SURFACE
      ?auto_1836792 - SURFACE
      ?auto_1836793 - SURFACE
    )
    :vars
    (
      ?auto_1836794 - HOIST
      ?auto_1836797 - PLACE
      ?auto_1836796 - TRUCK
      ?auto_1836795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1836794 ?auto_1836797 ) ( SURFACE-AT ?auto_1836792 ?auto_1836797 ) ( CLEAR ?auto_1836792 ) ( IS-CRATE ?auto_1836793 ) ( not ( = ?auto_1836792 ?auto_1836793 ) ) ( AVAILABLE ?auto_1836794 ) ( IN ?auto_1836793 ?auto_1836796 ) ( ON ?auto_1836792 ?auto_1836791 ) ( not ( = ?auto_1836791 ?auto_1836792 ) ) ( not ( = ?auto_1836791 ?auto_1836793 ) ) ( TRUCK-AT ?auto_1836796 ?auto_1836795 ) ( not ( = ?auto_1836795 ?auto_1836797 ) ) ( ON ?auto_1836783 ?auto_1836782 ) ( ON ?auto_1836784 ?auto_1836783 ) ( ON ?auto_1836786 ?auto_1836784 ) ( ON ?auto_1836785 ?auto_1836786 ) ( ON ?auto_1836787 ?auto_1836785 ) ( ON ?auto_1836788 ?auto_1836787 ) ( ON ?auto_1836789 ?auto_1836788 ) ( ON ?auto_1836790 ?auto_1836789 ) ( ON ?auto_1836791 ?auto_1836790 ) ( not ( = ?auto_1836782 ?auto_1836783 ) ) ( not ( = ?auto_1836782 ?auto_1836784 ) ) ( not ( = ?auto_1836782 ?auto_1836786 ) ) ( not ( = ?auto_1836782 ?auto_1836785 ) ) ( not ( = ?auto_1836782 ?auto_1836787 ) ) ( not ( = ?auto_1836782 ?auto_1836788 ) ) ( not ( = ?auto_1836782 ?auto_1836789 ) ) ( not ( = ?auto_1836782 ?auto_1836790 ) ) ( not ( = ?auto_1836782 ?auto_1836791 ) ) ( not ( = ?auto_1836782 ?auto_1836792 ) ) ( not ( = ?auto_1836782 ?auto_1836793 ) ) ( not ( = ?auto_1836783 ?auto_1836784 ) ) ( not ( = ?auto_1836783 ?auto_1836786 ) ) ( not ( = ?auto_1836783 ?auto_1836785 ) ) ( not ( = ?auto_1836783 ?auto_1836787 ) ) ( not ( = ?auto_1836783 ?auto_1836788 ) ) ( not ( = ?auto_1836783 ?auto_1836789 ) ) ( not ( = ?auto_1836783 ?auto_1836790 ) ) ( not ( = ?auto_1836783 ?auto_1836791 ) ) ( not ( = ?auto_1836783 ?auto_1836792 ) ) ( not ( = ?auto_1836783 ?auto_1836793 ) ) ( not ( = ?auto_1836784 ?auto_1836786 ) ) ( not ( = ?auto_1836784 ?auto_1836785 ) ) ( not ( = ?auto_1836784 ?auto_1836787 ) ) ( not ( = ?auto_1836784 ?auto_1836788 ) ) ( not ( = ?auto_1836784 ?auto_1836789 ) ) ( not ( = ?auto_1836784 ?auto_1836790 ) ) ( not ( = ?auto_1836784 ?auto_1836791 ) ) ( not ( = ?auto_1836784 ?auto_1836792 ) ) ( not ( = ?auto_1836784 ?auto_1836793 ) ) ( not ( = ?auto_1836786 ?auto_1836785 ) ) ( not ( = ?auto_1836786 ?auto_1836787 ) ) ( not ( = ?auto_1836786 ?auto_1836788 ) ) ( not ( = ?auto_1836786 ?auto_1836789 ) ) ( not ( = ?auto_1836786 ?auto_1836790 ) ) ( not ( = ?auto_1836786 ?auto_1836791 ) ) ( not ( = ?auto_1836786 ?auto_1836792 ) ) ( not ( = ?auto_1836786 ?auto_1836793 ) ) ( not ( = ?auto_1836785 ?auto_1836787 ) ) ( not ( = ?auto_1836785 ?auto_1836788 ) ) ( not ( = ?auto_1836785 ?auto_1836789 ) ) ( not ( = ?auto_1836785 ?auto_1836790 ) ) ( not ( = ?auto_1836785 ?auto_1836791 ) ) ( not ( = ?auto_1836785 ?auto_1836792 ) ) ( not ( = ?auto_1836785 ?auto_1836793 ) ) ( not ( = ?auto_1836787 ?auto_1836788 ) ) ( not ( = ?auto_1836787 ?auto_1836789 ) ) ( not ( = ?auto_1836787 ?auto_1836790 ) ) ( not ( = ?auto_1836787 ?auto_1836791 ) ) ( not ( = ?auto_1836787 ?auto_1836792 ) ) ( not ( = ?auto_1836787 ?auto_1836793 ) ) ( not ( = ?auto_1836788 ?auto_1836789 ) ) ( not ( = ?auto_1836788 ?auto_1836790 ) ) ( not ( = ?auto_1836788 ?auto_1836791 ) ) ( not ( = ?auto_1836788 ?auto_1836792 ) ) ( not ( = ?auto_1836788 ?auto_1836793 ) ) ( not ( = ?auto_1836789 ?auto_1836790 ) ) ( not ( = ?auto_1836789 ?auto_1836791 ) ) ( not ( = ?auto_1836789 ?auto_1836792 ) ) ( not ( = ?auto_1836789 ?auto_1836793 ) ) ( not ( = ?auto_1836790 ?auto_1836791 ) ) ( not ( = ?auto_1836790 ?auto_1836792 ) ) ( not ( = ?auto_1836790 ?auto_1836793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1836791 ?auto_1836792 ?auto_1836793 )
      ( MAKE-11CRATE-VERIFY ?auto_1836782 ?auto_1836783 ?auto_1836784 ?auto_1836786 ?auto_1836785 ?auto_1836787 ?auto_1836788 ?auto_1836789 ?auto_1836790 ?auto_1836791 ?auto_1836792 ?auto_1836793 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1836914 - SURFACE
      ?auto_1836915 - SURFACE
      ?auto_1836916 - SURFACE
      ?auto_1836918 - SURFACE
      ?auto_1836917 - SURFACE
      ?auto_1836919 - SURFACE
      ?auto_1836920 - SURFACE
      ?auto_1836921 - SURFACE
      ?auto_1836922 - SURFACE
      ?auto_1836923 - SURFACE
      ?auto_1836924 - SURFACE
      ?auto_1836925 - SURFACE
    )
    :vars
    (
      ?auto_1836930 - HOIST
      ?auto_1836929 - PLACE
      ?auto_1836926 - TRUCK
      ?auto_1836928 - PLACE
      ?auto_1836927 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1836930 ?auto_1836929 ) ( SURFACE-AT ?auto_1836924 ?auto_1836929 ) ( CLEAR ?auto_1836924 ) ( IS-CRATE ?auto_1836925 ) ( not ( = ?auto_1836924 ?auto_1836925 ) ) ( AVAILABLE ?auto_1836930 ) ( ON ?auto_1836924 ?auto_1836923 ) ( not ( = ?auto_1836923 ?auto_1836924 ) ) ( not ( = ?auto_1836923 ?auto_1836925 ) ) ( TRUCK-AT ?auto_1836926 ?auto_1836928 ) ( not ( = ?auto_1836928 ?auto_1836929 ) ) ( HOIST-AT ?auto_1836927 ?auto_1836928 ) ( LIFTING ?auto_1836927 ?auto_1836925 ) ( not ( = ?auto_1836930 ?auto_1836927 ) ) ( ON ?auto_1836915 ?auto_1836914 ) ( ON ?auto_1836916 ?auto_1836915 ) ( ON ?auto_1836918 ?auto_1836916 ) ( ON ?auto_1836917 ?auto_1836918 ) ( ON ?auto_1836919 ?auto_1836917 ) ( ON ?auto_1836920 ?auto_1836919 ) ( ON ?auto_1836921 ?auto_1836920 ) ( ON ?auto_1836922 ?auto_1836921 ) ( ON ?auto_1836923 ?auto_1836922 ) ( not ( = ?auto_1836914 ?auto_1836915 ) ) ( not ( = ?auto_1836914 ?auto_1836916 ) ) ( not ( = ?auto_1836914 ?auto_1836918 ) ) ( not ( = ?auto_1836914 ?auto_1836917 ) ) ( not ( = ?auto_1836914 ?auto_1836919 ) ) ( not ( = ?auto_1836914 ?auto_1836920 ) ) ( not ( = ?auto_1836914 ?auto_1836921 ) ) ( not ( = ?auto_1836914 ?auto_1836922 ) ) ( not ( = ?auto_1836914 ?auto_1836923 ) ) ( not ( = ?auto_1836914 ?auto_1836924 ) ) ( not ( = ?auto_1836914 ?auto_1836925 ) ) ( not ( = ?auto_1836915 ?auto_1836916 ) ) ( not ( = ?auto_1836915 ?auto_1836918 ) ) ( not ( = ?auto_1836915 ?auto_1836917 ) ) ( not ( = ?auto_1836915 ?auto_1836919 ) ) ( not ( = ?auto_1836915 ?auto_1836920 ) ) ( not ( = ?auto_1836915 ?auto_1836921 ) ) ( not ( = ?auto_1836915 ?auto_1836922 ) ) ( not ( = ?auto_1836915 ?auto_1836923 ) ) ( not ( = ?auto_1836915 ?auto_1836924 ) ) ( not ( = ?auto_1836915 ?auto_1836925 ) ) ( not ( = ?auto_1836916 ?auto_1836918 ) ) ( not ( = ?auto_1836916 ?auto_1836917 ) ) ( not ( = ?auto_1836916 ?auto_1836919 ) ) ( not ( = ?auto_1836916 ?auto_1836920 ) ) ( not ( = ?auto_1836916 ?auto_1836921 ) ) ( not ( = ?auto_1836916 ?auto_1836922 ) ) ( not ( = ?auto_1836916 ?auto_1836923 ) ) ( not ( = ?auto_1836916 ?auto_1836924 ) ) ( not ( = ?auto_1836916 ?auto_1836925 ) ) ( not ( = ?auto_1836918 ?auto_1836917 ) ) ( not ( = ?auto_1836918 ?auto_1836919 ) ) ( not ( = ?auto_1836918 ?auto_1836920 ) ) ( not ( = ?auto_1836918 ?auto_1836921 ) ) ( not ( = ?auto_1836918 ?auto_1836922 ) ) ( not ( = ?auto_1836918 ?auto_1836923 ) ) ( not ( = ?auto_1836918 ?auto_1836924 ) ) ( not ( = ?auto_1836918 ?auto_1836925 ) ) ( not ( = ?auto_1836917 ?auto_1836919 ) ) ( not ( = ?auto_1836917 ?auto_1836920 ) ) ( not ( = ?auto_1836917 ?auto_1836921 ) ) ( not ( = ?auto_1836917 ?auto_1836922 ) ) ( not ( = ?auto_1836917 ?auto_1836923 ) ) ( not ( = ?auto_1836917 ?auto_1836924 ) ) ( not ( = ?auto_1836917 ?auto_1836925 ) ) ( not ( = ?auto_1836919 ?auto_1836920 ) ) ( not ( = ?auto_1836919 ?auto_1836921 ) ) ( not ( = ?auto_1836919 ?auto_1836922 ) ) ( not ( = ?auto_1836919 ?auto_1836923 ) ) ( not ( = ?auto_1836919 ?auto_1836924 ) ) ( not ( = ?auto_1836919 ?auto_1836925 ) ) ( not ( = ?auto_1836920 ?auto_1836921 ) ) ( not ( = ?auto_1836920 ?auto_1836922 ) ) ( not ( = ?auto_1836920 ?auto_1836923 ) ) ( not ( = ?auto_1836920 ?auto_1836924 ) ) ( not ( = ?auto_1836920 ?auto_1836925 ) ) ( not ( = ?auto_1836921 ?auto_1836922 ) ) ( not ( = ?auto_1836921 ?auto_1836923 ) ) ( not ( = ?auto_1836921 ?auto_1836924 ) ) ( not ( = ?auto_1836921 ?auto_1836925 ) ) ( not ( = ?auto_1836922 ?auto_1836923 ) ) ( not ( = ?auto_1836922 ?auto_1836924 ) ) ( not ( = ?auto_1836922 ?auto_1836925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1836923 ?auto_1836924 ?auto_1836925 )
      ( MAKE-11CRATE-VERIFY ?auto_1836914 ?auto_1836915 ?auto_1836916 ?auto_1836918 ?auto_1836917 ?auto_1836919 ?auto_1836920 ?auto_1836921 ?auto_1836922 ?auto_1836923 ?auto_1836924 ?auto_1836925 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837057 - SURFACE
      ?auto_1837058 - SURFACE
      ?auto_1837059 - SURFACE
      ?auto_1837061 - SURFACE
      ?auto_1837060 - SURFACE
      ?auto_1837062 - SURFACE
      ?auto_1837063 - SURFACE
      ?auto_1837064 - SURFACE
      ?auto_1837065 - SURFACE
      ?auto_1837066 - SURFACE
      ?auto_1837067 - SURFACE
      ?auto_1837068 - SURFACE
    )
    :vars
    (
      ?auto_1837069 - HOIST
      ?auto_1837070 - PLACE
      ?auto_1837074 - TRUCK
      ?auto_1837072 - PLACE
      ?auto_1837071 - HOIST
      ?auto_1837073 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837069 ?auto_1837070 ) ( SURFACE-AT ?auto_1837067 ?auto_1837070 ) ( CLEAR ?auto_1837067 ) ( IS-CRATE ?auto_1837068 ) ( not ( = ?auto_1837067 ?auto_1837068 ) ) ( AVAILABLE ?auto_1837069 ) ( ON ?auto_1837067 ?auto_1837066 ) ( not ( = ?auto_1837066 ?auto_1837067 ) ) ( not ( = ?auto_1837066 ?auto_1837068 ) ) ( TRUCK-AT ?auto_1837074 ?auto_1837072 ) ( not ( = ?auto_1837072 ?auto_1837070 ) ) ( HOIST-AT ?auto_1837071 ?auto_1837072 ) ( not ( = ?auto_1837069 ?auto_1837071 ) ) ( AVAILABLE ?auto_1837071 ) ( SURFACE-AT ?auto_1837068 ?auto_1837072 ) ( ON ?auto_1837068 ?auto_1837073 ) ( CLEAR ?auto_1837068 ) ( not ( = ?auto_1837067 ?auto_1837073 ) ) ( not ( = ?auto_1837068 ?auto_1837073 ) ) ( not ( = ?auto_1837066 ?auto_1837073 ) ) ( ON ?auto_1837058 ?auto_1837057 ) ( ON ?auto_1837059 ?auto_1837058 ) ( ON ?auto_1837061 ?auto_1837059 ) ( ON ?auto_1837060 ?auto_1837061 ) ( ON ?auto_1837062 ?auto_1837060 ) ( ON ?auto_1837063 ?auto_1837062 ) ( ON ?auto_1837064 ?auto_1837063 ) ( ON ?auto_1837065 ?auto_1837064 ) ( ON ?auto_1837066 ?auto_1837065 ) ( not ( = ?auto_1837057 ?auto_1837058 ) ) ( not ( = ?auto_1837057 ?auto_1837059 ) ) ( not ( = ?auto_1837057 ?auto_1837061 ) ) ( not ( = ?auto_1837057 ?auto_1837060 ) ) ( not ( = ?auto_1837057 ?auto_1837062 ) ) ( not ( = ?auto_1837057 ?auto_1837063 ) ) ( not ( = ?auto_1837057 ?auto_1837064 ) ) ( not ( = ?auto_1837057 ?auto_1837065 ) ) ( not ( = ?auto_1837057 ?auto_1837066 ) ) ( not ( = ?auto_1837057 ?auto_1837067 ) ) ( not ( = ?auto_1837057 ?auto_1837068 ) ) ( not ( = ?auto_1837057 ?auto_1837073 ) ) ( not ( = ?auto_1837058 ?auto_1837059 ) ) ( not ( = ?auto_1837058 ?auto_1837061 ) ) ( not ( = ?auto_1837058 ?auto_1837060 ) ) ( not ( = ?auto_1837058 ?auto_1837062 ) ) ( not ( = ?auto_1837058 ?auto_1837063 ) ) ( not ( = ?auto_1837058 ?auto_1837064 ) ) ( not ( = ?auto_1837058 ?auto_1837065 ) ) ( not ( = ?auto_1837058 ?auto_1837066 ) ) ( not ( = ?auto_1837058 ?auto_1837067 ) ) ( not ( = ?auto_1837058 ?auto_1837068 ) ) ( not ( = ?auto_1837058 ?auto_1837073 ) ) ( not ( = ?auto_1837059 ?auto_1837061 ) ) ( not ( = ?auto_1837059 ?auto_1837060 ) ) ( not ( = ?auto_1837059 ?auto_1837062 ) ) ( not ( = ?auto_1837059 ?auto_1837063 ) ) ( not ( = ?auto_1837059 ?auto_1837064 ) ) ( not ( = ?auto_1837059 ?auto_1837065 ) ) ( not ( = ?auto_1837059 ?auto_1837066 ) ) ( not ( = ?auto_1837059 ?auto_1837067 ) ) ( not ( = ?auto_1837059 ?auto_1837068 ) ) ( not ( = ?auto_1837059 ?auto_1837073 ) ) ( not ( = ?auto_1837061 ?auto_1837060 ) ) ( not ( = ?auto_1837061 ?auto_1837062 ) ) ( not ( = ?auto_1837061 ?auto_1837063 ) ) ( not ( = ?auto_1837061 ?auto_1837064 ) ) ( not ( = ?auto_1837061 ?auto_1837065 ) ) ( not ( = ?auto_1837061 ?auto_1837066 ) ) ( not ( = ?auto_1837061 ?auto_1837067 ) ) ( not ( = ?auto_1837061 ?auto_1837068 ) ) ( not ( = ?auto_1837061 ?auto_1837073 ) ) ( not ( = ?auto_1837060 ?auto_1837062 ) ) ( not ( = ?auto_1837060 ?auto_1837063 ) ) ( not ( = ?auto_1837060 ?auto_1837064 ) ) ( not ( = ?auto_1837060 ?auto_1837065 ) ) ( not ( = ?auto_1837060 ?auto_1837066 ) ) ( not ( = ?auto_1837060 ?auto_1837067 ) ) ( not ( = ?auto_1837060 ?auto_1837068 ) ) ( not ( = ?auto_1837060 ?auto_1837073 ) ) ( not ( = ?auto_1837062 ?auto_1837063 ) ) ( not ( = ?auto_1837062 ?auto_1837064 ) ) ( not ( = ?auto_1837062 ?auto_1837065 ) ) ( not ( = ?auto_1837062 ?auto_1837066 ) ) ( not ( = ?auto_1837062 ?auto_1837067 ) ) ( not ( = ?auto_1837062 ?auto_1837068 ) ) ( not ( = ?auto_1837062 ?auto_1837073 ) ) ( not ( = ?auto_1837063 ?auto_1837064 ) ) ( not ( = ?auto_1837063 ?auto_1837065 ) ) ( not ( = ?auto_1837063 ?auto_1837066 ) ) ( not ( = ?auto_1837063 ?auto_1837067 ) ) ( not ( = ?auto_1837063 ?auto_1837068 ) ) ( not ( = ?auto_1837063 ?auto_1837073 ) ) ( not ( = ?auto_1837064 ?auto_1837065 ) ) ( not ( = ?auto_1837064 ?auto_1837066 ) ) ( not ( = ?auto_1837064 ?auto_1837067 ) ) ( not ( = ?auto_1837064 ?auto_1837068 ) ) ( not ( = ?auto_1837064 ?auto_1837073 ) ) ( not ( = ?auto_1837065 ?auto_1837066 ) ) ( not ( = ?auto_1837065 ?auto_1837067 ) ) ( not ( = ?auto_1837065 ?auto_1837068 ) ) ( not ( = ?auto_1837065 ?auto_1837073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837066 ?auto_1837067 ?auto_1837068 )
      ( MAKE-11CRATE-VERIFY ?auto_1837057 ?auto_1837058 ?auto_1837059 ?auto_1837061 ?auto_1837060 ?auto_1837062 ?auto_1837063 ?auto_1837064 ?auto_1837065 ?auto_1837066 ?auto_1837067 ?auto_1837068 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837201 - SURFACE
      ?auto_1837202 - SURFACE
      ?auto_1837203 - SURFACE
      ?auto_1837205 - SURFACE
      ?auto_1837204 - SURFACE
      ?auto_1837206 - SURFACE
      ?auto_1837207 - SURFACE
      ?auto_1837208 - SURFACE
      ?auto_1837209 - SURFACE
      ?auto_1837210 - SURFACE
      ?auto_1837211 - SURFACE
      ?auto_1837212 - SURFACE
    )
    :vars
    (
      ?auto_1837213 - HOIST
      ?auto_1837215 - PLACE
      ?auto_1837217 - PLACE
      ?auto_1837218 - HOIST
      ?auto_1837214 - SURFACE
      ?auto_1837216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837213 ?auto_1837215 ) ( SURFACE-AT ?auto_1837211 ?auto_1837215 ) ( CLEAR ?auto_1837211 ) ( IS-CRATE ?auto_1837212 ) ( not ( = ?auto_1837211 ?auto_1837212 ) ) ( AVAILABLE ?auto_1837213 ) ( ON ?auto_1837211 ?auto_1837210 ) ( not ( = ?auto_1837210 ?auto_1837211 ) ) ( not ( = ?auto_1837210 ?auto_1837212 ) ) ( not ( = ?auto_1837217 ?auto_1837215 ) ) ( HOIST-AT ?auto_1837218 ?auto_1837217 ) ( not ( = ?auto_1837213 ?auto_1837218 ) ) ( AVAILABLE ?auto_1837218 ) ( SURFACE-AT ?auto_1837212 ?auto_1837217 ) ( ON ?auto_1837212 ?auto_1837214 ) ( CLEAR ?auto_1837212 ) ( not ( = ?auto_1837211 ?auto_1837214 ) ) ( not ( = ?auto_1837212 ?auto_1837214 ) ) ( not ( = ?auto_1837210 ?auto_1837214 ) ) ( TRUCK-AT ?auto_1837216 ?auto_1837215 ) ( ON ?auto_1837202 ?auto_1837201 ) ( ON ?auto_1837203 ?auto_1837202 ) ( ON ?auto_1837205 ?auto_1837203 ) ( ON ?auto_1837204 ?auto_1837205 ) ( ON ?auto_1837206 ?auto_1837204 ) ( ON ?auto_1837207 ?auto_1837206 ) ( ON ?auto_1837208 ?auto_1837207 ) ( ON ?auto_1837209 ?auto_1837208 ) ( ON ?auto_1837210 ?auto_1837209 ) ( not ( = ?auto_1837201 ?auto_1837202 ) ) ( not ( = ?auto_1837201 ?auto_1837203 ) ) ( not ( = ?auto_1837201 ?auto_1837205 ) ) ( not ( = ?auto_1837201 ?auto_1837204 ) ) ( not ( = ?auto_1837201 ?auto_1837206 ) ) ( not ( = ?auto_1837201 ?auto_1837207 ) ) ( not ( = ?auto_1837201 ?auto_1837208 ) ) ( not ( = ?auto_1837201 ?auto_1837209 ) ) ( not ( = ?auto_1837201 ?auto_1837210 ) ) ( not ( = ?auto_1837201 ?auto_1837211 ) ) ( not ( = ?auto_1837201 ?auto_1837212 ) ) ( not ( = ?auto_1837201 ?auto_1837214 ) ) ( not ( = ?auto_1837202 ?auto_1837203 ) ) ( not ( = ?auto_1837202 ?auto_1837205 ) ) ( not ( = ?auto_1837202 ?auto_1837204 ) ) ( not ( = ?auto_1837202 ?auto_1837206 ) ) ( not ( = ?auto_1837202 ?auto_1837207 ) ) ( not ( = ?auto_1837202 ?auto_1837208 ) ) ( not ( = ?auto_1837202 ?auto_1837209 ) ) ( not ( = ?auto_1837202 ?auto_1837210 ) ) ( not ( = ?auto_1837202 ?auto_1837211 ) ) ( not ( = ?auto_1837202 ?auto_1837212 ) ) ( not ( = ?auto_1837202 ?auto_1837214 ) ) ( not ( = ?auto_1837203 ?auto_1837205 ) ) ( not ( = ?auto_1837203 ?auto_1837204 ) ) ( not ( = ?auto_1837203 ?auto_1837206 ) ) ( not ( = ?auto_1837203 ?auto_1837207 ) ) ( not ( = ?auto_1837203 ?auto_1837208 ) ) ( not ( = ?auto_1837203 ?auto_1837209 ) ) ( not ( = ?auto_1837203 ?auto_1837210 ) ) ( not ( = ?auto_1837203 ?auto_1837211 ) ) ( not ( = ?auto_1837203 ?auto_1837212 ) ) ( not ( = ?auto_1837203 ?auto_1837214 ) ) ( not ( = ?auto_1837205 ?auto_1837204 ) ) ( not ( = ?auto_1837205 ?auto_1837206 ) ) ( not ( = ?auto_1837205 ?auto_1837207 ) ) ( not ( = ?auto_1837205 ?auto_1837208 ) ) ( not ( = ?auto_1837205 ?auto_1837209 ) ) ( not ( = ?auto_1837205 ?auto_1837210 ) ) ( not ( = ?auto_1837205 ?auto_1837211 ) ) ( not ( = ?auto_1837205 ?auto_1837212 ) ) ( not ( = ?auto_1837205 ?auto_1837214 ) ) ( not ( = ?auto_1837204 ?auto_1837206 ) ) ( not ( = ?auto_1837204 ?auto_1837207 ) ) ( not ( = ?auto_1837204 ?auto_1837208 ) ) ( not ( = ?auto_1837204 ?auto_1837209 ) ) ( not ( = ?auto_1837204 ?auto_1837210 ) ) ( not ( = ?auto_1837204 ?auto_1837211 ) ) ( not ( = ?auto_1837204 ?auto_1837212 ) ) ( not ( = ?auto_1837204 ?auto_1837214 ) ) ( not ( = ?auto_1837206 ?auto_1837207 ) ) ( not ( = ?auto_1837206 ?auto_1837208 ) ) ( not ( = ?auto_1837206 ?auto_1837209 ) ) ( not ( = ?auto_1837206 ?auto_1837210 ) ) ( not ( = ?auto_1837206 ?auto_1837211 ) ) ( not ( = ?auto_1837206 ?auto_1837212 ) ) ( not ( = ?auto_1837206 ?auto_1837214 ) ) ( not ( = ?auto_1837207 ?auto_1837208 ) ) ( not ( = ?auto_1837207 ?auto_1837209 ) ) ( not ( = ?auto_1837207 ?auto_1837210 ) ) ( not ( = ?auto_1837207 ?auto_1837211 ) ) ( not ( = ?auto_1837207 ?auto_1837212 ) ) ( not ( = ?auto_1837207 ?auto_1837214 ) ) ( not ( = ?auto_1837208 ?auto_1837209 ) ) ( not ( = ?auto_1837208 ?auto_1837210 ) ) ( not ( = ?auto_1837208 ?auto_1837211 ) ) ( not ( = ?auto_1837208 ?auto_1837212 ) ) ( not ( = ?auto_1837208 ?auto_1837214 ) ) ( not ( = ?auto_1837209 ?auto_1837210 ) ) ( not ( = ?auto_1837209 ?auto_1837211 ) ) ( not ( = ?auto_1837209 ?auto_1837212 ) ) ( not ( = ?auto_1837209 ?auto_1837214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837210 ?auto_1837211 ?auto_1837212 )
      ( MAKE-11CRATE-VERIFY ?auto_1837201 ?auto_1837202 ?auto_1837203 ?auto_1837205 ?auto_1837204 ?auto_1837206 ?auto_1837207 ?auto_1837208 ?auto_1837209 ?auto_1837210 ?auto_1837211 ?auto_1837212 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837345 - SURFACE
      ?auto_1837346 - SURFACE
      ?auto_1837347 - SURFACE
      ?auto_1837349 - SURFACE
      ?auto_1837348 - SURFACE
      ?auto_1837350 - SURFACE
      ?auto_1837351 - SURFACE
      ?auto_1837352 - SURFACE
      ?auto_1837353 - SURFACE
      ?auto_1837354 - SURFACE
      ?auto_1837355 - SURFACE
      ?auto_1837356 - SURFACE
    )
    :vars
    (
      ?auto_1837361 - HOIST
      ?auto_1837358 - PLACE
      ?auto_1837357 - PLACE
      ?auto_1837360 - HOIST
      ?auto_1837362 - SURFACE
      ?auto_1837359 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837361 ?auto_1837358 ) ( IS-CRATE ?auto_1837356 ) ( not ( = ?auto_1837355 ?auto_1837356 ) ) ( not ( = ?auto_1837354 ?auto_1837355 ) ) ( not ( = ?auto_1837354 ?auto_1837356 ) ) ( not ( = ?auto_1837357 ?auto_1837358 ) ) ( HOIST-AT ?auto_1837360 ?auto_1837357 ) ( not ( = ?auto_1837361 ?auto_1837360 ) ) ( AVAILABLE ?auto_1837360 ) ( SURFACE-AT ?auto_1837356 ?auto_1837357 ) ( ON ?auto_1837356 ?auto_1837362 ) ( CLEAR ?auto_1837356 ) ( not ( = ?auto_1837355 ?auto_1837362 ) ) ( not ( = ?auto_1837356 ?auto_1837362 ) ) ( not ( = ?auto_1837354 ?auto_1837362 ) ) ( TRUCK-AT ?auto_1837359 ?auto_1837358 ) ( SURFACE-AT ?auto_1837354 ?auto_1837358 ) ( CLEAR ?auto_1837354 ) ( LIFTING ?auto_1837361 ?auto_1837355 ) ( IS-CRATE ?auto_1837355 ) ( ON ?auto_1837346 ?auto_1837345 ) ( ON ?auto_1837347 ?auto_1837346 ) ( ON ?auto_1837349 ?auto_1837347 ) ( ON ?auto_1837348 ?auto_1837349 ) ( ON ?auto_1837350 ?auto_1837348 ) ( ON ?auto_1837351 ?auto_1837350 ) ( ON ?auto_1837352 ?auto_1837351 ) ( ON ?auto_1837353 ?auto_1837352 ) ( ON ?auto_1837354 ?auto_1837353 ) ( not ( = ?auto_1837345 ?auto_1837346 ) ) ( not ( = ?auto_1837345 ?auto_1837347 ) ) ( not ( = ?auto_1837345 ?auto_1837349 ) ) ( not ( = ?auto_1837345 ?auto_1837348 ) ) ( not ( = ?auto_1837345 ?auto_1837350 ) ) ( not ( = ?auto_1837345 ?auto_1837351 ) ) ( not ( = ?auto_1837345 ?auto_1837352 ) ) ( not ( = ?auto_1837345 ?auto_1837353 ) ) ( not ( = ?auto_1837345 ?auto_1837354 ) ) ( not ( = ?auto_1837345 ?auto_1837355 ) ) ( not ( = ?auto_1837345 ?auto_1837356 ) ) ( not ( = ?auto_1837345 ?auto_1837362 ) ) ( not ( = ?auto_1837346 ?auto_1837347 ) ) ( not ( = ?auto_1837346 ?auto_1837349 ) ) ( not ( = ?auto_1837346 ?auto_1837348 ) ) ( not ( = ?auto_1837346 ?auto_1837350 ) ) ( not ( = ?auto_1837346 ?auto_1837351 ) ) ( not ( = ?auto_1837346 ?auto_1837352 ) ) ( not ( = ?auto_1837346 ?auto_1837353 ) ) ( not ( = ?auto_1837346 ?auto_1837354 ) ) ( not ( = ?auto_1837346 ?auto_1837355 ) ) ( not ( = ?auto_1837346 ?auto_1837356 ) ) ( not ( = ?auto_1837346 ?auto_1837362 ) ) ( not ( = ?auto_1837347 ?auto_1837349 ) ) ( not ( = ?auto_1837347 ?auto_1837348 ) ) ( not ( = ?auto_1837347 ?auto_1837350 ) ) ( not ( = ?auto_1837347 ?auto_1837351 ) ) ( not ( = ?auto_1837347 ?auto_1837352 ) ) ( not ( = ?auto_1837347 ?auto_1837353 ) ) ( not ( = ?auto_1837347 ?auto_1837354 ) ) ( not ( = ?auto_1837347 ?auto_1837355 ) ) ( not ( = ?auto_1837347 ?auto_1837356 ) ) ( not ( = ?auto_1837347 ?auto_1837362 ) ) ( not ( = ?auto_1837349 ?auto_1837348 ) ) ( not ( = ?auto_1837349 ?auto_1837350 ) ) ( not ( = ?auto_1837349 ?auto_1837351 ) ) ( not ( = ?auto_1837349 ?auto_1837352 ) ) ( not ( = ?auto_1837349 ?auto_1837353 ) ) ( not ( = ?auto_1837349 ?auto_1837354 ) ) ( not ( = ?auto_1837349 ?auto_1837355 ) ) ( not ( = ?auto_1837349 ?auto_1837356 ) ) ( not ( = ?auto_1837349 ?auto_1837362 ) ) ( not ( = ?auto_1837348 ?auto_1837350 ) ) ( not ( = ?auto_1837348 ?auto_1837351 ) ) ( not ( = ?auto_1837348 ?auto_1837352 ) ) ( not ( = ?auto_1837348 ?auto_1837353 ) ) ( not ( = ?auto_1837348 ?auto_1837354 ) ) ( not ( = ?auto_1837348 ?auto_1837355 ) ) ( not ( = ?auto_1837348 ?auto_1837356 ) ) ( not ( = ?auto_1837348 ?auto_1837362 ) ) ( not ( = ?auto_1837350 ?auto_1837351 ) ) ( not ( = ?auto_1837350 ?auto_1837352 ) ) ( not ( = ?auto_1837350 ?auto_1837353 ) ) ( not ( = ?auto_1837350 ?auto_1837354 ) ) ( not ( = ?auto_1837350 ?auto_1837355 ) ) ( not ( = ?auto_1837350 ?auto_1837356 ) ) ( not ( = ?auto_1837350 ?auto_1837362 ) ) ( not ( = ?auto_1837351 ?auto_1837352 ) ) ( not ( = ?auto_1837351 ?auto_1837353 ) ) ( not ( = ?auto_1837351 ?auto_1837354 ) ) ( not ( = ?auto_1837351 ?auto_1837355 ) ) ( not ( = ?auto_1837351 ?auto_1837356 ) ) ( not ( = ?auto_1837351 ?auto_1837362 ) ) ( not ( = ?auto_1837352 ?auto_1837353 ) ) ( not ( = ?auto_1837352 ?auto_1837354 ) ) ( not ( = ?auto_1837352 ?auto_1837355 ) ) ( not ( = ?auto_1837352 ?auto_1837356 ) ) ( not ( = ?auto_1837352 ?auto_1837362 ) ) ( not ( = ?auto_1837353 ?auto_1837354 ) ) ( not ( = ?auto_1837353 ?auto_1837355 ) ) ( not ( = ?auto_1837353 ?auto_1837356 ) ) ( not ( = ?auto_1837353 ?auto_1837362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837354 ?auto_1837355 ?auto_1837356 )
      ( MAKE-11CRATE-VERIFY ?auto_1837345 ?auto_1837346 ?auto_1837347 ?auto_1837349 ?auto_1837348 ?auto_1837350 ?auto_1837351 ?auto_1837352 ?auto_1837353 ?auto_1837354 ?auto_1837355 ?auto_1837356 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1837489 - SURFACE
      ?auto_1837490 - SURFACE
      ?auto_1837491 - SURFACE
      ?auto_1837493 - SURFACE
      ?auto_1837492 - SURFACE
      ?auto_1837494 - SURFACE
      ?auto_1837495 - SURFACE
      ?auto_1837496 - SURFACE
      ?auto_1837497 - SURFACE
      ?auto_1837498 - SURFACE
      ?auto_1837499 - SURFACE
      ?auto_1837500 - SURFACE
    )
    :vars
    (
      ?auto_1837505 - HOIST
      ?auto_1837506 - PLACE
      ?auto_1837501 - PLACE
      ?auto_1837503 - HOIST
      ?auto_1837504 - SURFACE
      ?auto_1837502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1837505 ?auto_1837506 ) ( IS-CRATE ?auto_1837500 ) ( not ( = ?auto_1837499 ?auto_1837500 ) ) ( not ( = ?auto_1837498 ?auto_1837499 ) ) ( not ( = ?auto_1837498 ?auto_1837500 ) ) ( not ( = ?auto_1837501 ?auto_1837506 ) ) ( HOIST-AT ?auto_1837503 ?auto_1837501 ) ( not ( = ?auto_1837505 ?auto_1837503 ) ) ( AVAILABLE ?auto_1837503 ) ( SURFACE-AT ?auto_1837500 ?auto_1837501 ) ( ON ?auto_1837500 ?auto_1837504 ) ( CLEAR ?auto_1837500 ) ( not ( = ?auto_1837499 ?auto_1837504 ) ) ( not ( = ?auto_1837500 ?auto_1837504 ) ) ( not ( = ?auto_1837498 ?auto_1837504 ) ) ( TRUCK-AT ?auto_1837502 ?auto_1837506 ) ( SURFACE-AT ?auto_1837498 ?auto_1837506 ) ( CLEAR ?auto_1837498 ) ( IS-CRATE ?auto_1837499 ) ( AVAILABLE ?auto_1837505 ) ( IN ?auto_1837499 ?auto_1837502 ) ( ON ?auto_1837490 ?auto_1837489 ) ( ON ?auto_1837491 ?auto_1837490 ) ( ON ?auto_1837493 ?auto_1837491 ) ( ON ?auto_1837492 ?auto_1837493 ) ( ON ?auto_1837494 ?auto_1837492 ) ( ON ?auto_1837495 ?auto_1837494 ) ( ON ?auto_1837496 ?auto_1837495 ) ( ON ?auto_1837497 ?auto_1837496 ) ( ON ?auto_1837498 ?auto_1837497 ) ( not ( = ?auto_1837489 ?auto_1837490 ) ) ( not ( = ?auto_1837489 ?auto_1837491 ) ) ( not ( = ?auto_1837489 ?auto_1837493 ) ) ( not ( = ?auto_1837489 ?auto_1837492 ) ) ( not ( = ?auto_1837489 ?auto_1837494 ) ) ( not ( = ?auto_1837489 ?auto_1837495 ) ) ( not ( = ?auto_1837489 ?auto_1837496 ) ) ( not ( = ?auto_1837489 ?auto_1837497 ) ) ( not ( = ?auto_1837489 ?auto_1837498 ) ) ( not ( = ?auto_1837489 ?auto_1837499 ) ) ( not ( = ?auto_1837489 ?auto_1837500 ) ) ( not ( = ?auto_1837489 ?auto_1837504 ) ) ( not ( = ?auto_1837490 ?auto_1837491 ) ) ( not ( = ?auto_1837490 ?auto_1837493 ) ) ( not ( = ?auto_1837490 ?auto_1837492 ) ) ( not ( = ?auto_1837490 ?auto_1837494 ) ) ( not ( = ?auto_1837490 ?auto_1837495 ) ) ( not ( = ?auto_1837490 ?auto_1837496 ) ) ( not ( = ?auto_1837490 ?auto_1837497 ) ) ( not ( = ?auto_1837490 ?auto_1837498 ) ) ( not ( = ?auto_1837490 ?auto_1837499 ) ) ( not ( = ?auto_1837490 ?auto_1837500 ) ) ( not ( = ?auto_1837490 ?auto_1837504 ) ) ( not ( = ?auto_1837491 ?auto_1837493 ) ) ( not ( = ?auto_1837491 ?auto_1837492 ) ) ( not ( = ?auto_1837491 ?auto_1837494 ) ) ( not ( = ?auto_1837491 ?auto_1837495 ) ) ( not ( = ?auto_1837491 ?auto_1837496 ) ) ( not ( = ?auto_1837491 ?auto_1837497 ) ) ( not ( = ?auto_1837491 ?auto_1837498 ) ) ( not ( = ?auto_1837491 ?auto_1837499 ) ) ( not ( = ?auto_1837491 ?auto_1837500 ) ) ( not ( = ?auto_1837491 ?auto_1837504 ) ) ( not ( = ?auto_1837493 ?auto_1837492 ) ) ( not ( = ?auto_1837493 ?auto_1837494 ) ) ( not ( = ?auto_1837493 ?auto_1837495 ) ) ( not ( = ?auto_1837493 ?auto_1837496 ) ) ( not ( = ?auto_1837493 ?auto_1837497 ) ) ( not ( = ?auto_1837493 ?auto_1837498 ) ) ( not ( = ?auto_1837493 ?auto_1837499 ) ) ( not ( = ?auto_1837493 ?auto_1837500 ) ) ( not ( = ?auto_1837493 ?auto_1837504 ) ) ( not ( = ?auto_1837492 ?auto_1837494 ) ) ( not ( = ?auto_1837492 ?auto_1837495 ) ) ( not ( = ?auto_1837492 ?auto_1837496 ) ) ( not ( = ?auto_1837492 ?auto_1837497 ) ) ( not ( = ?auto_1837492 ?auto_1837498 ) ) ( not ( = ?auto_1837492 ?auto_1837499 ) ) ( not ( = ?auto_1837492 ?auto_1837500 ) ) ( not ( = ?auto_1837492 ?auto_1837504 ) ) ( not ( = ?auto_1837494 ?auto_1837495 ) ) ( not ( = ?auto_1837494 ?auto_1837496 ) ) ( not ( = ?auto_1837494 ?auto_1837497 ) ) ( not ( = ?auto_1837494 ?auto_1837498 ) ) ( not ( = ?auto_1837494 ?auto_1837499 ) ) ( not ( = ?auto_1837494 ?auto_1837500 ) ) ( not ( = ?auto_1837494 ?auto_1837504 ) ) ( not ( = ?auto_1837495 ?auto_1837496 ) ) ( not ( = ?auto_1837495 ?auto_1837497 ) ) ( not ( = ?auto_1837495 ?auto_1837498 ) ) ( not ( = ?auto_1837495 ?auto_1837499 ) ) ( not ( = ?auto_1837495 ?auto_1837500 ) ) ( not ( = ?auto_1837495 ?auto_1837504 ) ) ( not ( = ?auto_1837496 ?auto_1837497 ) ) ( not ( = ?auto_1837496 ?auto_1837498 ) ) ( not ( = ?auto_1837496 ?auto_1837499 ) ) ( not ( = ?auto_1837496 ?auto_1837500 ) ) ( not ( = ?auto_1837496 ?auto_1837504 ) ) ( not ( = ?auto_1837497 ?auto_1837498 ) ) ( not ( = ?auto_1837497 ?auto_1837499 ) ) ( not ( = ?auto_1837497 ?auto_1837500 ) ) ( not ( = ?auto_1837497 ?auto_1837504 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1837498 ?auto_1837499 ?auto_1837500 )
      ( MAKE-11CRATE-VERIFY ?auto_1837489 ?auto_1837490 ?auto_1837491 ?auto_1837493 ?auto_1837492 ?auto_1837494 ?auto_1837495 ?auto_1837496 ?auto_1837497 ?auto_1837498 ?auto_1837499 ?auto_1837500 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1846741 - SURFACE
      ?auto_1846742 - SURFACE
      ?auto_1846743 - SURFACE
      ?auto_1846745 - SURFACE
      ?auto_1846744 - SURFACE
      ?auto_1846746 - SURFACE
      ?auto_1846747 - SURFACE
      ?auto_1846748 - SURFACE
      ?auto_1846749 - SURFACE
      ?auto_1846750 - SURFACE
      ?auto_1846751 - SURFACE
      ?auto_1846752 - SURFACE
      ?auto_1846753 - SURFACE
    )
    :vars
    (
      ?auto_1846754 - HOIST
      ?auto_1846755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1846754 ?auto_1846755 ) ( SURFACE-AT ?auto_1846752 ?auto_1846755 ) ( CLEAR ?auto_1846752 ) ( LIFTING ?auto_1846754 ?auto_1846753 ) ( IS-CRATE ?auto_1846753 ) ( not ( = ?auto_1846752 ?auto_1846753 ) ) ( ON ?auto_1846742 ?auto_1846741 ) ( ON ?auto_1846743 ?auto_1846742 ) ( ON ?auto_1846745 ?auto_1846743 ) ( ON ?auto_1846744 ?auto_1846745 ) ( ON ?auto_1846746 ?auto_1846744 ) ( ON ?auto_1846747 ?auto_1846746 ) ( ON ?auto_1846748 ?auto_1846747 ) ( ON ?auto_1846749 ?auto_1846748 ) ( ON ?auto_1846750 ?auto_1846749 ) ( ON ?auto_1846751 ?auto_1846750 ) ( ON ?auto_1846752 ?auto_1846751 ) ( not ( = ?auto_1846741 ?auto_1846742 ) ) ( not ( = ?auto_1846741 ?auto_1846743 ) ) ( not ( = ?auto_1846741 ?auto_1846745 ) ) ( not ( = ?auto_1846741 ?auto_1846744 ) ) ( not ( = ?auto_1846741 ?auto_1846746 ) ) ( not ( = ?auto_1846741 ?auto_1846747 ) ) ( not ( = ?auto_1846741 ?auto_1846748 ) ) ( not ( = ?auto_1846741 ?auto_1846749 ) ) ( not ( = ?auto_1846741 ?auto_1846750 ) ) ( not ( = ?auto_1846741 ?auto_1846751 ) ) ( not ( = ?auto_1846741 ?auto_1846752 ) ) ( not ( = ?auto_1846741 ?auto_1846753 ) ) ( not ( = ?auto_1846742 ?auto_1846743 ) ) ( not ( = ?auto_1846742 ?auto_1846745 ) ) ( not ( = ?auto_1846742 ?auto_1846744 ) ) ( not ( = ?auto_1846742 ?auto_1846746 ) ) ( not ( = ?auto_1846742 ?auto_1846747 ) ) ( not ( = ?auto_1846742 ?auto_1846748 ) ) ( not ( = ?auto_1846742 ?auto_1846749 ) ) ( not ( = ?auto_1846742 ?auto_1846750 ) ) ( not ( = ?auto_1846742 ?auto_1846751 ) ) ( not ( = ?auto_1846742 ?auto_1846752 ) ) ( not ( = ?auto_1846742 ?auto_1846753 ) ) ( not ( = ?auto_1846743 ?auto_1846745 ) ) ( not ( = ?auto_1846743 ?auto_1846744 ) ) ( not ( = ?auto_1846743 ?auto_1846746 ) ) ( not ( = ?auto_1846743 ?auto_1846747 ) ) ( not ( = ?auto_1846743 ?auto_1846748 ) ) ( not ( = ?auto_1846743 ?auto_1846749 ) ) ( not ( = ?auto_1846743 ?auto_1846750 ) ) ( not ( = ?auto_1846743 ?auto_1846751 ) ) ( not ( = ?auto_1846743 ?auto_1846752 ) ) ( not ( = ?auto_1846743 ?auto_1846753 ) ) ( not ( = ?auto_1846745 ?auto_1846744 ) ) ( not ( = ?auto_1846745 ?auto_1846746 ) ) ( not ( = ?auto_1846745 ?auto_1846747 ) ) ( not ( = ?auto_1846745 ?auto_1846748 ) ) ( not ( = ?auto_1846745 ?auto_1846749 ) ) ( not ( = ?auto_1846745 ?auto_1846750 ) ) ( not ( = ?auto_1846745 ?auto_1846751 ) ) ( not ( = ?auto_1846745 ?auto_1846752 ) ) ( not ( = ?auto_1846745 ?auto_1846753 ) ) ( not ( = ?auto_1846744 ?auto_1846746 ) ) ( not ( = ?auto_1846744 ?auto_1846747 ) ) ( not ( = ?auto_1846744 ?auto_1846748 ) ) ( not ( = ?auto_1846744 ?auto_1846749 ) ) ( not ( = ?auto_1846744 ?auto_1846750 ) ) ( not ( = ?auto_1846744 ?auto_1846751 ) ) ( not ( = ?auto_1846744 ?auto_1846752 ) ) ( not ( = ?auto_1846744 ?auto_1846753 ) ) ( not ( = ?auto_1846746 ?auto_1846747 ) ) ( not ( = ?auto_1846746 ?auto_1846748 ) ) ( not ( = ?auto_1846746 ?auto_1846749 ) ) ( not ( = ?auto_1846746 ?auto_1846750 ) ) ( not ( = ?auto_1846746 ?auto_1846751 ) ) ( not ( = ?auto_1846746 ?auto_1846752 ) ) ( not ( = ?auto_1846746 ?auto_1846753 ) ) ( not ( = ?auto_1846747 ?auto_1846748 ) ) ( not ( = ?auto_1846747 ?auto_1846749 ) ) ( not ( = ?auto_1846747 ?auto_1846750 ) ) ( not ( = ?auto_1846747 ?auto_1846751 ) ) ( not ( = ?auto_1846747 ?auto_1846752 ) ) ( not ( = ?auto_1846747 ?auto_1846753 ) ) ( not ( = ?auto_1846748 ?auto_1846749 ) ) ( not ( = ?auto_1846748 ?auto_1846750 ) ) ( not ( = ?auto_1846748 ?auto_1846751 ) ) ( not ( = ?auto_1846748 ?auto_1846752 ) ) ( not ( = ?auto_1846748 ?auto_1846753 ) ) ( not ( = ?auto_1846749 ?auto_1846750 ) ) ( not ( = ?auto_1846749 ?auto_1846751 ) ) ( not ( = ?auto_1846749 ?auto_1846752 ) ) ( not ( = ?auto_1846749 ?auto_1846753 ) ) ( not ( = ?auto_1846750 ?auto_1846751 ) ) ( not ( = ?auto_1846750 ?auto_1846752 ) ) ( not ( = ?auto_1846750 ?auto_1846753 ) ) ( not ( = ?auto_1846751 ?auto_1846752 ) ) ( not ( = ?auto_1846751 ?auto_1846753 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1846752 ?auto_1846753 )
      ( MAKE-12CRATE-VERIFY ?auto_1846741 ?auto_1846742 ?auto_1846743 ?auto_1846745 ?auto_1846744 ?auto_1846746 ?auto_1846747 ?auto_1846748 ?auto_1846749 ?auto_1846750 ?auto_1846751 ?auto_1846752 ?auto_1846753 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1846866 - SURFACE
      ?auto_1846867 - SURFACE
      ?auto_1846868 - SURFACE
      ?auto_1846870 - SURFACE
      ?auto_1846869 - SURFACE
      ?auto_1846871 - SURFACE
      ?auto_1846872 - SURFACE
      ?auto_1846873 - SURFACE
      ?auto_1846874 - SURFACE
      ?auto_1846875 - SURFACE
      ?auto_1846876 - SURFACE
      ?auto_1846877 - SURFACE
      ?auto_1846878 - SURFACE
    )
    :vars
    (
      ?auto_1846879 - HOIST
      ?auto_1846880 - PLACE
      ?auto_1846881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1846879 ?auto_1846880 ) ( SURFACE-AT ?auto_1846877 ?auto_1846880 ) ( CLEAR ?auto_1846877 ) ( IS-CRATE ?auto_1846878 ) ( not ( = ?auto_1846877 ?auto_1846878 ) ) ( TRUCK-AT ?auto_1846881 ?auto_1846880 ) ( AVAILABLE ?auto_1846879 ) ( IN ?auto_1846878 ?auto_1846881 ) ( ON ?auto_1846877 ?auto_1846876 ) ( not ( = ?auto_1846876 ?auto_1846877 ) ) ( not ( = ?auto_1846876 ?auto_1846878 ) ) ( ON ?auto_1846867 ?auto_1846866 ) ( ON ?auto_1846868 ?auto_1846867 ) ( ON ?auto_1846870 ?auto_1846868 ) ( ON ?auto_1846869 ?auto_1846870 ) ( ON ?auto_1846871 ?auto_1846869 ) ( ON ?auto_1846872 ?auto_1846871 ) ( ON ?auto_1846873 ?auto_1846872 ) ( ON ?auto_1846874 ?auto_1846873 ) ( ON ?auto_1846875 ?auto_1846874 ) ( ON ?auto_1846876 ?auto_1846875 ) ( not ( = ?auto_1846866 ?auto_1846867 ) ) ( not ( = ?auto_1846866 ?auto_1846868 ) ) ( not ( = ?auto_1846866 ?auto_1846870 ) ) ( not ( = ?auto_1846866 ?auto_1846869 ) ) ( not ( = ?auto_1846866 ?auto_1846871 ) ) ( not ( = ?auto_1846866 ?auto_1846872 ) ) ( not ( = ?auto_1846866 ?auto_1846873 ) ) ( not ( = ?auto_1846866 ?auto_1846874 ) ) ( not ( = ?auto_1846866 ?auto_1846875 ) ) ( not ( = ?auto_1846866 ?auto_1846876 ) ) ( not ( = ?auto_1846866 ?auto_1846877 ) ) ( not ( = ?auto_1846866 ?auto_1846878 ) ) ( not ( = ?auto_1846867 ?auto_1846868 ) ) ( not ( = ?auto_1846867 ?auto_1846870 ) ) ( not ( = ?auto_1846867 ?auto_1846869 ) ) ( not ( = ?auto_1846867 ?auto_1846871 ) ) ( not ( = ?auto_1846867 ?auto_1846872 ) ) ( not ( = ?auto_1846867 ?auto_1846873 ) ) ( not ( = ?auto_1846867 ?auto_1846874 ) ) ( not ( = ?auto_1846867 ?auto_1846875 ) ) ( not ( = ?auto_1846867 ?auto_1846876 ) ) ( not ( = ?auto_1846867 ?auto_1846877 ) ) ( not ( = ?auto_1846867 ?auto_1846878 ) ) ( not ( = ?auto_1846868 ?auto_1846870 ) ) ( not ( = ?auto_1846868 ?auto_1846869 ) ) ( not ( = ?auto_1846868 ?auto_1846871 ) ) ( not ( = ?auto_1846868 ?auto_1846872 ) ) ( not ( = ?auto_1846868 ?auto_1846873 ) ) ( not ( = ?auto_1846868 ?auto_1846874 ) ) ( not ( = ?auto_1846868 ?auto_1846875 ) ) ( not ( = ?auto_1846868 ?auto_1846876 ) ) ( not ( = ?auto_1846868 ?auto_1846877 ) ) ( not ( = ?auto_1846868 ?auto_1846878 ) ) ( not ( = ?auto_1846870 ?auto_1846869 ) ) ( not ( = ?auto_1846870 ?auto_1846871 ) ) ( not ( = ?auto_1846870 ?auto_1846872 ) ) ( not ( = ?auto_1846870 ?auto_1846873 ) ) ( not ( = ?auto_1846870 ?auto_1846874 ) ) ( not ( = ?auto_1846870 ?auto_1846875 ) ) ( not ( = ?auto_1846870 ?auto_1846876 ) ) ( not ( = ?auto_1846870 ?auto_1846877 ) ) ( not ( = ?auto_1846870 ?auto_1846878 ) ) ( not ( = ?auto_1846869 ?auto_1846871 ) ) ( not ( = ?auto_1846869 ?auto_1846872 ) ) ( not ( = ?auto_1846869 ?auto_1846873 ) ) ( not ( = ?auto_1846869 ?auto_1846874 ) ) ( not ( = ?auto_1846869 ?auto_1846875 ) ) ( not ( = ?auto_1846869 ?auto_1846876 ) ) ( not ( = ?auto_1846869 ?auto_1846877 ) ) ( not ( = ?auto_1846869 ?auto_1846878 ) ) ( not ( = ?auto_1846871 ?auto_1846872 ) ) ( not ( = ?auto_1846871 ?auto_1846873 ) ) ( not ( = ?auto_1846871 ?auto_1846874 ) ) ( not ( = ?auto_1846871 ?auto_1846875 ) ) ( not ( = ?auto_1846871 ?auto_1846876 ) ) ( not ( = ?auto_1846871 ?auto_1846877 ) ) ( not ( = ?auto_1846871 ?auto_1846878 ) ) ( not ( = ?auto_1846872 ?auto_1846873 ) ) ( not ( = ?auto_1846872 ?auto_1846874 ) ) ( not ( = ?auto_1846872 ?auto_1846875 ) ) ( not ( = ?auto_1846872 ?auto_1846876 ) ) ( not ( = ?auto_1846872 ?auto_1846877 ) ) ( not ( = ?auto_1846872 ?auto_1846878 ) ) ( not ( = ?auto_1846873 ?auto_1846874 ) ) ( not ( = ?auto_1846873 ?auto_1846875 ) ) ( not ( = ?auto_1846873 ?auto_1846876 ) ) ( not ( = ?auto_1846873 ?auto_1846877 ) ) ( not ( = ?auto_1846873 ?auto_1846878 ) ) ( not ( = ?auto_1846874 ?auto_1846875 ) ) ( not ( = ?auto_1846874 ?auto_1846876 ) ) ( not ( = ?auto_1846874 ?auto_1846877 ) ) ( not ( = ?auto_1846874 ?auto_1846878 ) ) ( not ( = ?auto_1846875 ?auto_1846876 ) ) ( not ( = ?auto_1846875 ?auto_1846877 ) ) ( not ( = ?auto_1846875 ?auto_1846878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1846876 ?auto_1846877 ?auto_1846878 )
      ( MAKE-12CRATE-VERIFY ?auto_1846866 ?auto_1846867 ?auto_1846868 ?auto_1846870 ?auto_1846869 ?auto_1846871 ?auto_1846872 ?auto_1846873 ?auto_1846874 ?auto_1846875 ?auto_1846876 ?auto_1846877 ?auto_1846878 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847004 - SURFACE
      ?auto_1847005 - SURFACE
      ?auto_1847006 - SURFACE
      ?auto_1847008 - SURFACE
      ?auto_1847007 - SURFACE
      ?auto_1847009 - SURFACE
      ?auto_1847010 - SURFACE
      ?auto_1847011 - SURFACE
      ?auto_1847012 - SURFACE
      ?auto_1847013 - SURFACE
      ?auto_1847014 - SURFACE
      ?auto_1847015 - SURFACE
      ?auto_1847016 - SURFACE
    )
    :vars
    (
      ?auto_1847020 - HOIST
      ?auto_1847017 - PLACE
      ?auto_1847018 - TRUCK
      ?auto_1847019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847020 ?auto_1847017 ) ( SURFACE-AT ?auto_1847015 ?auto_1847017 ) ( CLEAR ?auto_1847015 ) ( IS-CRATE ?auto_1847016 ) ( not ( = ?auto_1847015 ?auto_1847016 ) ) ( AVAILABLE ?auto_1847020 ) ( IN ?auto_1847016 ?auto_1847018 ) ( ON ?auto_1847015 ?auto_1847014 ) ( not ( = ?auto_1847014 ?auto_1847015 ) ) ( not ( = ?auto_1847014 ?auto_1847016 ) ) ( TRUCK-AT ?auto_1847018 ?auto_1847019 ) ( not ( = ?auto_1847019 ?auto_1847017 ) ) ( ON ?auto_1847005 ?auto_1847004 ) ( ON ?auto_1847006 ?auto_1847005 ) ( ON ?auto_1847008 ?auto_1847006 ) ( ON ?auto_1847007 ?auto_1847008 ) ( ON ?auto_1847009 ?auto_1847007 ) ( ON ?auto_1847010 ?auto_1847009 ) ( ON ?auto_1847011 ?auto_1847010 ) ( ON ?auto_1847012 ?auto_1847011 ) ( ON ?auto_1847013 ?auto_1847012 ) ( ON ?auto_1847014 ?auto_1847013 ) ( not ( = ?auto_1847004 ?auto_1847005 ) ) ( not ( = ?auto_1847004 ?auto_1847006 ) ) ( not ( = ?auto_1847004 ?auto_1847008 ) ) ( not ( = ?auto_1847004 ?auto_1847007 ) ) ( not ( = ?auto_1847004 ?auto_1847009 ) ) ( not ( = ?auto_1847004 ?auto_1847010 ) ) ( not ( = ?auto_1847004 ?auto_1847011 ) ) ( not ( = ?auto_1847004 ?auto_1847012 ) ) ( not ( = ?auto_1847004 ?auto_1847013 ) ) ( not ( = ?auto_1847004 ?auto_1847014 ) ) ( not ( = ?auto_1847004 ?auto_1847015 ) ) ( not ( = ?auto_1847004 ?auto_1847016 ) ) ( not ( = ?auto_1847005 ?auto_1847006 ) ) ( not ( = ?auto_1847005 ?auto_1847008 ) ) ( not ( = ?auto_1847005 ?auto_1847007 ) ) ( not ( = ?auto_1847005 ?auto_1847009 ) ) ( not ( = ?auto_1847005 ?auto_1847010 ) ) ( not ( = ?auto_1847005 ?auto_1847011 ) ) ( not ( = ?auto_1847005 ?auto_1847012 ) ) ( not ( = ?auto_1847005 ?auto_1847013 ) ) ( not ( = ?auto_1847005 ?auto_1847014 ) ) ( not ( = ?auto_1847005 ?auto_1847015 ) ) ( not ( = ?auto_1847005 ?auto_1847016 ) ) ( not ( = ?auto_1847006 ?auto_1847008 ) ) ( not ( = ?auto_1847006 ?auto_1847007 ) ) ( not ( = ?auto_1847006 ?auto_1847009 ) ) ( not ( = ?auto_1847006 ?auto_1847010 ) ) ( not ( = ?auto_1847006 ?auto_1847011 ) ) ( not ( = ?auto_1847006 ?auto_1847012 ) ) ( not ( = ?auto_1847006 ?auto_1847013 ) ) ( not ( = ?auto_1847006 ?auto_1847014 ) ) ( not ( = ?auto_1847006 ?auto_1847015 ) ) ( not ( = ?auto_1847006 ?auto_1847016 ) ) ( not ( = ?auto_1847008 ?auto_1847007 ) ) ( not ( = ?auto_1847008 ?auto_1847009 ) ) ( not ( = ?auto_1847008 ?auto_1847010 ) ) ( not ( = ?auto_1847008 ?auto_1847011 ) ) ( not ( = ?auto_1847008 ?auto_1847012 ) ) ( not ( = ?auto_1847008 ?auto_1847013 ) ) ( not ( = ?auto_1847008 ?auto_1847014 ) ) ( not ( = ?auto_1847008 ?auto_1847015 ) ) ( not ( = ?auto_1847008 ?auto_1847016 ) ) ( not ( = ?auto_1847007 ?auto_1847009 ) ) ( not ( = ?auto_1847007 ?auto_1847010 ) ) ( not ( = ?auto_1847007 ?auto_1847011 ) ) ( not ( = ?auto_1847007 ?auto_1847012 ) ) ( not ( = ?auto_1847007 ?auto_1847013 ) ) ( not ( = ?auto_1847007 ?auto_1847014 ) ) ( not ( = ?auto_1847007 ?auto_1847015 ) ) ( not ( = ?auto_1847007 ?auto_1847016 ) ) ( not ( = ?auto_1847009 ?auto_1847010 ) ) ( not ( = ?auto_1847009 ?auto_1847011 ) ) ( not ( = ?auto_1847009 ?auto_1847012 ) ) ( not ( = ?auto_1847009 ?auto_1847013 ) ) ( not ( = ?auto_1847009 ?auto_1847014 ) ) ( not ( = ?auto_1847009 ?auto_1847015 ) ) ( not ( = ?auto_1847009 ?auto_1847016 ) ) ( not ( = ?auto_1847010 ?auto_1847011 ) ) ( not ( = ?auto_1847010 ?auto_1847012 ) ) ( not ( = ?auto_1847010 ?auto_1847013 ) ) ( not ( = ?auto_1847010 ?auto_1847014 ) ) ( not ( = ?auto_1847010 ?auto_1847015 ) ) ( not ( = ?auto_1847010 ?auto_1847016 ) ) ( not ( = ?auto_1847011 ?auto_1847012 ) ) ( not ( = ?auto_1847011 ?auto_1847013 ) ) ( not ( = ?auto_1847011 ?auto_1847014 ) ) ( not ( = ?auto_1847011 ?auto_1847015 ) ) ( not ( = ?auto_1847011 ?auto_1847016 ) ) ( not ( = ?auto_1847012 ?auto_1847013 ) ) ( not ( = ?auto_1847012 ?auto_1847014 ) ) ( not ( = ?auto_1847012 ?auto_1847015 ) ) ( not ( = ?auto_1847012 ?auto_1847016 ) ) ( not ( = ?auto_1847013 ?auto_1847014 ) ) ( not ( = ?auto_1847013 ?auto_1847015 ) ) ( not ( = ?auto_1847013 ?auto_1847016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847014 ?auto_1847015 ?auto_1847016 )
      ( MAKE-12CRATE-VERIFY ?auto_1847004 ?auto_1847005 ?auto_1847006 ?auto_1847008 ?auto_1847007 ?auto_1847009 ?auto_1847010 ?auto_1847011 ?auto_1847012 ?auto_1847013 ?auto_1847014 ?auto_1847015 ?auto_1847016 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847154 - SURFACE
      ?auto_1847155 - SURFACE
      ?auto_1847156 - SURFACE
      ?auto_1847158 - SURFACE
      ?auto_1847157 - SURFACE
      ?auto_1847159 - SURFACE
      ?auto_1847160 - SURFACE
      ?auto_1847161 - SURFACE
      ?auto_1847162 - SURFACE
      ?auto_1847163 - SURFACE
      ?auto_1847164 - SURFACE
      ?auto_1847165 - SURFACE
      ?auto_1847166 - SURFACE
    )
    :vars
    (
      ?auto_1847168 - HOIST
      ?auto_1847169 - PLACE
      ?auto_1847167 - TRUCK
      ?auto_1847170 - PLACE
      ?auto_1847171 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847168 ?auto_1847169 ) ( SURFACE-AT ?auto_1847165 ?auto_1847169 ) ( CLEAR ?auto_1847165 ) ( IS-CRATE ?auto_1847166 ) ( not ( = ?auto_1847165 ?auto_1847166 ) ) ( AVAILABLE ?auto_1847168 ) ( ON ?auto_1847165 ?auto_1847164 ) ( not ( = ?auto_1847164 ?auto_1847165 ) ) ( not ( = ?auto_1847164 ?auto_1847166 ) ) ( TRUCK-AT ?auto_1847167 ?auto_1847170 ) ( not ( = ?auto_1847170 ?auto_1847169 ) ) ( HOIST-AT ?auto_1847171 ?auto_1847170 ) ( LIFTING ?auto_1847171 ?auto_1847166 ) ( not ( = ?auto_1847168 ?auto_1847171 ) ) ( ON ?auto_1847155 ?auto_1847154 ) ( ON ?auto_1847156 ?auto_1847155 ) ( ON ?auto_1847158 ?auto_1847156 ) ( ON ?auto_1847157 ?auto_1847158 ) ( ON ?auto_1847159 ?auto_1847157 ) ( ON ?auto_1847160 ?auto_1847159 ) ( ON ?auto_1847161 ?auto_1847160 ) ( ON ?auto_1847162 ?auto_1847161 ) ( ON ?auto_1847163 ?auto_1847162 ) ( ON ?auto_1847164 ?auto_1847163 ) ( not ( = ?auto_1847154 ?auto_1847155 ) ) ( not ( = ?auto_1847154 ?auto_1847156 ) ) ( not ( = ?auto_1847154 ?auto_1847158 ) ) ( not ( = ?auto_1847154 ?auto_1847157 ) ) ( not ( = ?auto_1847154 ?auto_1847159 ) ) ( not ( = ?auto_1847154 ?auto_1847160 ) ) ( not ( = ?auto_1847154 ?auto_1847161 ) ) ( not ( = ?auto_1847154 ?auto_1847162 ) ) ( not ( = ?auto_1847154 ?auto_1847163 ) ) ( not ( = ?auto_1847154 ?auto_1847164 ) ) ( not ( = ?auto_1847154 ?auto_1847165 ) ) ( not ( = ?auto_1847154 ?auto_1847166 ) ) ( not ( = ?auto_1847155 ?auto_1847156 ) ) ( not ( = ?auto_1847155 ?auto_1847158 ) ) ( not ( = ?auto_1847155 ?auto_1847157 ) ) ( not ( = ?auto_1847155 ?auto_1847159 ) ) ( not ( = ?auto_1847155 ?auto_1847160 ) ) ( not ( = ?auto_1847155 ?auto_1847161 ) ) ( not ( = ?auto_1847155 ?auto_1847162 ) ) ( not ( = ?auto_1847155 ?auto_1847163 ) ) ( not ( = ?auto_1847155 ?auto_1847164 ) ) ( not ( = ?auto_1847155 ?auto_1847165 ) ) ( not ( = ?auto_1847155 ?auto_1847166 ) ) ( not ( = ?auto_1847156 ?auto_1847158 ) ) ( not ( = ?auto_1847156 ?auto_1847157 ) ) ( not ( = ?auto_1847156 ?auto_1847159 ) ) ( not ( = ?auto_1847156 ?auto_1847160 ) ) ( not ( = ?auto_1847156 ?auto_1847161 ) ) ( not ( = ?auto_1847156 ?auto_1847162 ) ) ( not ( = ?auto_1847156 ?auto_1847163 ) ) ( not ( = ?auto_1847156 ?auto_1847164 ) ) ( not ( = ?auto_1847156 ?auto_1847165 ) ) ( not ( = ?auto_1847156 ?auto_1847166 ) ) ( not ( = ?auto_1847158 ?auto_1847157 ) ) ( not ( = ?auto_1847158 ?auto_1847159 ) ) ( not ( = ?auto_1847158 ?auto_1847160 ) ) ( not ( = ?auto_1847158 ?auto_1847161 ) ) ( not ( = ?auto_1847158 ?auto_1847162 ) ) ( not ( = ?auto_1847158 ?auto_1847163 ) ) ( not ( = ?auto_1847158 ?auto_1847164 ) ) ( not ( = ?auto_1847158 ?auto_1847165 ) ) ( not ( = ?auto_1847158 ?auto_1847166 ) ) ( not ( = ?auto_1847157 ?auto_1847159 ) ) ( not ( = ?auto_1847157 ?auto_1847160 ) ) ( not ( = ?auto_1847157 ?auto_1847161 ) ) ( not ( = ?auto_1847157 ?auto_1847162 ) ) ( not ( = ?auto_1847157 ?auto_1847163 ) ) ( not ( = ?auto_1847157 ?auto_1847164 ) ) ( not ( = ?auto_1847157 ?auto_1847165 ) ) ( not ( = ?auto_1847157 ?auto_1847166 ) ) ( not ( = ?auto_1847159 ?auto_1847160 ) ) ( not ( = ?auto_1847159 ?auto_1847161 ) ) ( not ( = ?auto_1847159 ?auto_1847162 ) ) ( not ( = ?auto_1847159 ?auto_1847163 ) ) ( not ( = ?auto_1847159 ?auto_1847164 ) ) ( not ( = ?auto_1847159 ?auto_1847165 ) ) ( not ( = ?auto_1847159 ?auto_1847166 ) ) ( not ( = ?auto_1847160 ?auto_1847161 ) ) ( not ( = ?auto_1847160 ?auto_1847162 ) ) ( not ( = ?auto_1847160 ?auto_1847163 ) ) ( not ( = ?auto_1847160 ?auto_1847164 ) ) ( not ( = ?auto_1847160 ?auto_1847165 ) ) ( not ( = ?auto_1847160 ?auto_1847166 ) ) ( not ( = ?auto_1847161 ?auto_1847162 ) ) ( not ( = ?auto_1847161 ?auto_1847163 ) ) ( not ( = ?auto_1847161 ?auto_1847164 ) ) ( not ( = ?auto_1847161 ?auto_1847165 ) ) ( not ( = ?auto_1847161 ?auto_1847166 ) ) ( not ( = ?auto_1847162 ?auto_1847163 ) ) ( not ( = ?auto_1847162 ?auto_1847164 ) ) ( not ( = ?auto_1847162 ?auto_1847165 ) ) ( not ( = ?auto_1847162 ?auto_1847166 ) ) ( not ( = ?auto_1847163 ?auto_1847164 ) ) ( not ( = ?auto_1847163 ?auto_1847165 ) ) ( not ( = ?auto_1847163 ?auto_1847166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847164 ?auto_1847165 ?auto_1847166 )
      ( MAKE-12CRATE-VERIFY ?auto_1847154 ?auto_1847155 ?auto_1847156 ?auto_1847158 ?auto_1847157 ?auto_1847159 ?auto_1847160 ?auto_1847161 ?auto_1847162 ?auto_1847163 ?auto_1847164 ?auto_1847165 ?auto_1847166 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847316 - SURFACE
      ?auto_1847317 - SURFACE
      ?auto_1847318 - SURFACE
      ?auto_1847320 - SURFACE
      ?auto_1847319 - SURFACE
      ?auto_1847321 - SURFACE
      ?auto_1847322 - SURFACE
      ?auto_1847323 - SURFACE
      ?auto_1847324 - SURFACE
      ?auto_1847325 - SURFACE
      ?auto_1847326 - SURFACE
      ?auto_1847327 - SURFACE
      ?auto_1847328 - SURFACE
    )
    :vars
    (
      ?auto_1847331 - HOIST
      ?auto_1847332 - PLACE
      ?auto_1847334 - TRUCK
      ?auto_1847329 - PLACE
      ?auto_1847333 - HOIST
      ?auto_1847330 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847331 ?auto_1847332 ) ( SURFACE-AT ?auto_1847327 ?auto_1847332 ) ( CLEAR ?auto_1847327 ) ( IS-CRATE ?auto_1847328 ) ( not ( = ?auto_1847327 ?auto_1847328 ) ) ( AVAILABLE ?auto_1847331 ) ( ON ?auto_1847327 ?auto_1847326 ) ( not ( = ?auto_1847326 ?auto_1847327 ) ) ( not ( = ?auto_1847326 ?auto_1847328 ) ) ( TRUCK-AT ?auto_1847334 ?auto_1847329 ) ( not ( = ?auto_1847329 ?auto_1847332 ) ) ( HOIST-AT ?auto_1847333 ?auto_1847329 ) ( not ( = ?auto_1847331 ?auto_1847333 ) ) ( AVAILABLE ?auto_1847333 ) ( SURFACE-AT ?auto_1847328 ?auto_1847329 ) ( ON ?auto_1847328 ?auto_1847330 ) ( CLEAR ?auto_1847328 ) ( not ( = ?auto_1847327 ?auto_1847330 ) ) ( not ( = ?auto_1847328 ?auto_1847330 ) ) ( not ( = ?auto_1847326 ?auto_1847330 ) ) ( ON ?auto_1847317 ?auto_1847316 ) ( ON ?auto_1847318 ?auto_1847317 ) ( ON ?auto_1847320 ?auto_1847318 ) ( ON ?auto_1847319 ?auto_1847320 ) ( ON ?auto_1847321 ?auto_1847319 ) ( ON ?auto_1847322 ?auto_1847321 ) ( ON ?auto_1847323 ?auto_1847322 ) ( ON ?auto_1847324 ?auto_1847323 ) ( ON ?auto_1847325 ?auto_1847324 ) ( ON ?auto_1847326 ?auto_1847325 ) ( not ( = ?auto_1847316 ?auto_1847317 ) ) ( not ( = ?auto_1847316 ?auto_1847318 ) ) ( not ( = ?auto_1847316 ?auto_1847320 ) ) ( not ( = ?auto_1847316 ?auto_1847319 ) ) ( not ( = ?auto_1847316 ?auto_1847321 ) ) ( not ( = ?auto_1847316 ?auto_1847322 ) ) ( not ( = ?auto_1847316 ?auto_1847323 ) ) ( not ( = ?auto_1847316 ?auto_1847324 ) ) ( not ( = ?auto_1847316 ?auto_1847325 ) ) ( not ( = ?auto_1847316 ?auto_1847326 ) ) ( not ( = ?auto_1847316 ?auto_1847327 ) ) ( not ( = ?auto_1847316 ?auto_1847328 ) ) ( not ( = ?auto_1847316 ?auto_1847330 ) ) ( not ( = ?auto_1847317 ?auto_1847318 ) ) ( not ( = ?auto_1847317 ?auto_1847320 ) ) ( not ( = ?auto_1847317 ?auto_1847319 ) ) ( not ( = ?auto_1847317 ?auto_1847321 ) ) ( not ( = ?auto_1847317 ?auto_1847322 ) ) ( not ( = ?auto_1847317 ?auto_1847323 ) ) ( not ( = ?auto_1847317 ?auto_1847324 ) ) ( not ( = ?auto_1847317 ?auto_1847325 ) ) ( not ( = ?auto_1847317 ?auto_1847326 ) ) ( not ( = ?auto_1847317 ?auto_1847327 ) ) ( not ( = ?auto_1847317 ?auto_1847328 ) ) ( not ( = ?auto_1847317 ?auto_1847330 ) ) ( not ( = ?auto_1847318 ?auto_1847320 ) ) ( not ( = ?auto_1847318 ?auto_1847319 ) ) ( not ( = ?auto_1847318 ?auto_1847321 ) ) ( not ( = ?auto_1847318 ?auto_1847322 ) ) ( not ( = ?auto_1847318 ?auto_1847323 ) ) ( not ( = ?auto_1847318 ?auto_1847324 ) ) ( not ( = ?auto_1847318 ?auto_1847325 ) ) ( not ( = ?auto_1847318 ?auto_1847326 ) ) ( not ( = ?auto_1847318 ?auto_1847327 ) ) ( not ( = ?auto_1847318 ?auto_1847328 ) ) ( not ( = ?auto_1847318 ?auto_1847330 ) ) ( not ( = ?auto_1847320 ?auto_1847319 ) ) ( not ( = ?auto_1847320 ?auto_1847321 ) ) ( not ( = ?auto_1847320 ?auto_1847322 ) ) ( not ( = ?auto_1847320 ?auto_1847323 ) ) ( not ( = ?auto_1847320 ?auto_1847324 ) ) ( not ( = ?auto_1847320 ?auto_1847325 ) ) ( not ( = ?auto_1847320 ?auto_1847326 ) ) ( not ( = ?auto_1847320 ?auto_1847327 ) ) ( not ( = ?auto_1847320 ?auto_1847328 ) ) ( not ( = ?auto_1847320 ?auto_1847330 ) ) ( not ( = ?auto_1847319 ?auto_1847321 ) ) ( not ( = ?auto_1847319 ?auto_1847322 ) ) ( not ( = ?auto_1847319 ?auto_1847323 ) ) ( not ( = ?auto_1847319 ?auto_1847324 ) ) ( not ( = ?auto_1847319 ?auto_1847325 ) ) ( not ( = ?auto_1847319 ?auto_1847326 ) ) ( not ( = ?auto_1847319 ?auto_1847327 ) ) ( not ( = ?auto_1847319 ?auto_1847328 ) ) ( not ( = ?auto_1847319 ?auto_1847330 ) ) ( not ( = ?auto_1847321 ?auto_1847322 ) ) ( not ( = ?auto_1847321 ?auto_1847323 ) ) ( not ( = ?auto_1847321 ?auto_1847324 ) ) ( not ( = ?auto_1847321 ?auto_1847325 ) ) ( not ( = ?auto_1847321 ?auto_1847326 ) ) ( not ( = ?auto_1847321 ?auto_1847327 ) ) ( not ( = ?auto_1847321 ?auto_1847328 ) ) ( not ( = ?auto_1847321 ?auto_1847330 ) ) ( not ( = ?auto_1847322 ?auto_1847323 ) ) ( not ( = ?auto_1847322 ?auto_1847324 ) ) ( not ( = ?auto_1847322 ?auto_1847325 ) ) ( not ( = ?auto_1847322 ?auto_1847326 ) ) ( not ( = ?auto_1847322 ?auto_1847327 ) ) ( not ( = ?auto_1847322 ?auto_1847328 ) ) ( not ( = ?auto_1847322 ?auto_1847330 ) ) ( not ( = ?auto_1847323 ?auto_1847324 ) ) ( not ( = ?auto_1847323 ?auto_1847325 ) ) ( not ( = ?auto_1847323 ?auto_1847326 ) ) ( not ( = ?auto_1847323 ?auto_1847327 ) ) ( not ( = ?auto_1847323 ?auto_1847328 ) ) ( not ( = ?auto_1847323 ?auto_1847330 ) ) ( not ( = ?auto_1847324 ?auto_1847325 ) ) ( not ( = ?auto_1847324 ?auto_1847326 ) ) ( not ( = ?auto_1847324 ?auto_1847327 ) ) ( not ( = ?auto_1847324 ?auto_1847328 ) ) ( not ( = ?auto_1847324 ?auto_1847330 ) ) ( not ( = ?auto_1847325 ?auto_1847326 ) ) ( not ( = ?auto_1847325 ?auto_1847327 ) ) ( not ( = ?auto_1847325 ?auto_1847328 ) ) ( not ( = ?auto_1847325 ?auto_1847330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847326 ?auto_1847327 ?auto_1847328 )
      ( MAKE-12CRATE-VERIFY ?auto_1847316 ?auto_1847317 ?auto_1847318 ?auto_1847320 ?auto_1847319 ?auto_1847321 ?auto_1847322 ?auto_1847323 ?auto_1847324 ?auto_1847325 ?auto_1847326 ?auto_1847327 ?auto_1847328 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847479 - SURFACE
      ?auto_1847480 - SURFACE
      ?auto_1847481 - SURFACE
      ?auto_1847483 - SURFACE
      ?auto_1847482 - SURFACE
      ?auto_1847484 - SURFACE
      ?auto_1847485 - SURFACE
      ?auto_1847486 - SURFACE
      ?auto_1847487 - SURFACE
      ?auto_1847488 - SURFACE
      ?auto_1847489 - SURFACE
      ?auto_1847490 - SURFACE
      ?auto_1847491 - SURFACE
    )
    :vars
    (
      ?auto_1847496 - HOIST
      ?auto_1847492 - PLACE
      ?auto_1847493 - PLACE
      ?auto_1847494 - HOIST
      ?auto_1847497 - SURFACE
      ?auto_1847495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847496 ?auto_1847492 ) ( SURFACE-AT ?auto_1847490 ?auto_1847492 ) ( CLEAR ?auto_1847490 ) ( IS-CRATE ?auto_1847491 ) ( not ( = ?auto_1847490 ?auto_1847491 ) ) ( AVAILABLE ?auto_1847496 ) ( ON ?auto_1847490 ?auto_1847489 ) ( not ( = ?auto_1847489 ?auto_1847490 ) ) ( not ( = ?auto_1847489 ?auto_1847491 ) ) ( not ( = ?auto_1847493 ?auto_1847492 ) ) ( HOIST-AT ?auto_1847494 ?auto_1847493 ) ( not ( = ?auto_1847496 ?auto_1847494 ) ) ( AVAILABLE ?auto_1847494 ) ( SURFACE-AT ?auto_1847491 ?auto_1847493 ) ( ON ?auto_1847491 ?auto_1847497 ) ( CLEAR ?auto_1847491 ) ( not ( = ?auto_1847490 ?auto_1847497 ) ) ( not ( = ?auto_1847491 ?auto_1847497 ) ) ( not ( = ?auto_1847489 ?auto_1847497 ) ) ( TRUCK-AT ?auto_1847495 ?auto_1847492 ) ( ON ?auto_1847480 ?auto_1847479 ) ( ON ?auto_1847481 ?auto_1847480 ) ( ON ?auto_1847483 ?auto_1847481 ) ( ON ?auto_1847482 ?auto_1847483 ) ( ON ?auto_1847484 ?auto_1847482 ) ( ON ?auto_1847485 ?auto_1847484 ) ( ON ?auto_1847486 ?auto_1847485 ) ( ON ?auto_1847487 ?auto_1847486 ) ( ON ?auto_1847488 ?auto_1847487 ) ( ON ?auto_1847489 ?auto_1847488 ) ( not ( = ?auto_1847479 ?auto_1847480 ) ) ( not ( = ?auto_1847479 ?auto_1847481 ) ) ( not ( = ?auto_1847479 ?auto_1847483 ) ) ( not ( = ?auto_1847479 ?auto_1847482 ) ) ( not ( = ?auto_1847479 ?auto_1847484 ) ) ( not ( = ?auto_1847479 ?auto_1847485 ) ) ( not ( = ?auto_1847479 ?auto_1847486 ) ) ( not ( = ?auto_1847479 ?auto_1847487 ) ) ( not ( = ?auto_1847479 ?auto_1847488 ) ) ( not ( = ?auto_1847479 ?auto_1847489 ) ) ( not ( = ?auto_1847479 ?auto_1847490 ) ) ( not ( = ?auto_1847479 ?auto_1847491 ) ) ( not ( = ?auto_1847479 ?auto_1847497 ) ) ( not ( = ?auto_1847480 ?auto_1847481 ) ) ( not ( = ?auto_1847480 ?auto_1847483 ) ) ( not ( = ?auto_1847480 ?auto_1847482 ) ) ( not ( = ?auto_1847480 ?auto_1847484 ) ) ( not ( = ?auto_1847480 ?auto_1847485 ) ) ( not ( = ?auto_1847480 ?auto_1847486 ) ) ( not ( = ?auto_1847480 ?auto_1847487 ) ) ( not ( = ?auto_1847480 ?auto_1847488 ) ) ( not ( = ?auto_1847480 ?auto_1847489 ) ) ( not ( = ?auto_1847480 ?auto_1847490 ) ) ( not ( = ?auto_1847480 ?auto_1847491 ) ) ( not ( = ?auto_1847480 ?auto_1847497 ) ) ( not ( = ?auto_1847481 ?auto_1847483 ) ) ( not ( = ?auto_1847481 ?auto_1847482 ) ) ( not ( = ?auto_1847481 ?auto_1847484 ) ) ( not ( = ?auto_1847481 ?auto_1847485 ) ) ( not ( = ?auto_1847481 ?auto_1847486 ) ) ( not ( = ?auto_1847481 ?auto_1847487 ) ) ( not ( = ?auto_1847481 ?auto_1847488 ) ) ( not ( = ?auto_1847481 ?auto_1847489 ) ) ( not ( = ?auto_1847481 ?auto_1847490 ) ) ( not ( = ?auto_1847481 ?auto_1847491 ) ) ( not ( = ?auto_1847481 ?auto_1847497 ) ) ( not ( = ?auto_1847483 ?auto_1847482 ) ) ( not ( = ?auto_1847483 ?auto_1847484 ) ) ( not ( = ?auto_1847483 ?auto_1847485 ) ) ( not ( = ?auto_1847483 ?auto_1847486 ) ) ( not ( = ?auto_1847483 ?auto_1847487 ) ) ( not ( = ?auto_1847483 ?auto_1847488 ) ) ( not ( = ?auto_1847483 ?auto_1847489 ) ) ( not ( = ?auto_1847483 ?auto_1847490 ) ) ( not ( = ?auto_1847483 ?auto_1847491 ) ) ( not ( = ?auto_1847483 ?auto_1847497 ) ) ( not ( = ?auto_1847482 ?auto_1847484 ) ) ( not ( = ?auto_1847482 ?auto_1847485 ) ) ( not ( = ?auto_1847482 ?auto_1847486 ) ) ( not ( = ?auto_1847482 ?auto_1847487 ) ) ( not ( = ?auto_1847482 ?auto_1847488 ) ) ( not ( = ?auto_1847482 ?auto_1847489 ) ) ( not ( = ?auto_1847482 ?auto_1847490 ) ) ( not ( = ?auto_1847482 ?auto_1847491 ) ) ( not ( = ?auto_1847482 ?auto_1847497 ) ) ( not ( = ?auto_1847484 ?auto_1847485 ) ) ( not ( = ?auto_1847484 ?auto_1847486 ) ) ( not ( = ?auto_1847484 ?auto_1847487 ) ) ( not ( = ?auto_1847484 ?auto_1847488 ) ) ( not ( = ?auto_1847484 ?auto_1847489 ) ) ( not ( = ?auto_1847484 ?auto_1847490 ) ) ( not ( = ?auto_1847484 ?auto_1847491 ) ) ( not ( = ?auto_1847484 ?auto_1847497 ) ) ( not ( = ?auto_1847485 ?auto_1847486 ) ) ( not ( = ?auto_1847485 ?auto_1847487 ) ) ( not ( = ?auto_1847485 ?auto_1847488 ) ) ( not ( = ?auto_1847485 ?auto_1847489 ) ) ( not ( = ?auto_1847485 ?auto_1847490 ) ) ( not ( = ?auto_1847485 ?auto_1847491 ) ) ( not ( = ?auto_1847485 ?auto_1847497 ) ) ( not ( = ?auto_1847486 ?auto_1847487 ) ) ( not ( = ?auto_1847486 ?auto_1847488 ) ) ( not ( = ?auto_1847486 ?auto_1847489 ) ) ( not ( = ?auto_1847486 ?auto_1847490 ) ) ( not ( = ?auto_1847486 ?auto_1847491 ) ) ( not ( = ?auto_1847486 ?auto_1847497 ) ) ( not ( = ?auto_1847487 ?auto_1847488 ) ) ( not ( = ?auto_1847487 ?auto_1847489 ) ) ( not ( = ?auto_1847487 ?auto_1847490 ) ) ( not ( = ?auto_1847487 ?auto_1847491 ) ) ( not ( = ?auto_1847487 ?auto_1847497 ) ) ( not ( = ?auto_1847488 ?auto_1847489 ) ) ( not ( = ?auto_1847488 ?auto_1847490 ) ) ( not ( = ?auto_1847488 ?auto_1847491 ) ) ( not ( = ?auto_1847488 ?auto_1847497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847489 ?auto_1847490 ?auto_1847491 )
      ( MAKE-12CRATE-VERIFY ?auto_1847479 ?auto_1847480 ?auto_1847481 ?auto_1847483 ?auto_1847482 ?auto_1847484 ?auto_1847485 ?auto_1847486 ?auto_1847487 ?auto_1847488 ?auto_1847489 ?auto_1847490 ?auto_1847491 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847642 - SURFACE
      ?auto_1847643 - SURFACE
      ?auto_1847644 - SURFACE
      ?auto_1847646 - SURFACE
      ?auto_1847645 - SURFACE
      ?auto_1847647 - SURFACE
      ?auto_1847648 - SURFACE
      ?auto_1847649 - SURFACE
      ?auto_1847650 - SURFACE
      ?auto_1847651 - SURFACE
      ?auto_1847652 - SURFACE
      ?auto_1847653 - SURFACE
      ?auto_1847654 - SURFACE
    )
    :vars
    (
      ?auto_1847656 - HOIST
      ?auto_1847660 - PLACE
      ?auto_1847655 - PLACE
      ?auto_1847659 - HOIST
      ?auto_1847657 - SURFACE
      ?auto_1847658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847656 ?auto_1847660 ) ( IS-CRATE ?auto_1847654 ) ( not ( = ?auto_1847653 ?auto_1847654 ) ) ( not ( = ?auto_1847652 ?auto_1847653 ) ) ( not ( = ?auto_1847652 ?auto_1847654 ) ) ( not ( = ?auto_1847655 ?auto_1847660 ) ) ( HOIST-AT ?auto_1847659 ?auto_1847655 ) ( not ( = ?auto_1847656 ?auto_1847659 ) ) ( AVAILABLE ?auto_1847659 ) ( SURFACE-AT ?auto_1847654 ?auto_1847655 ) ( ON ?auto_1847654 ?auto_1847657 ) ( CLEAR ?auto_1847654 ) ( not ( = ?auto_1847653 ?auto_1847657 ) ) ( not ( = ?auto_1847654 ?auto_1847657 ) ) ( not ( = ?auto_1847652 ?auto_1847657 ) ) ( TRUCK-AT ?auto_1847658 ?auto_1847660 ) ( SURFACE-AT ?auto_1847652 ?auto_1847660 ) ( CLEAR ?auto_1847652 ) ( LIFTING ?auto_1847656 ?auto_1847653 ) ( IS-CRATE ?auto_1847653 ) ( ON ?auto_1847643 ?auto_1847642 ) ( ON ?auto_1847644 ?auto_1847643 ) ( ON ?auto_1847646 ?auto_1847644 ) ( ON ?auto_1847645 ?auto_1847646 ) ( ON ?auto_1847647 ?auto_1847645 ) ( ON ?auto_1847648 ?auto_1847647 ) ( ON ?auto_1847649 ?auto_1847648 ) ( ON ?auto_1847650 ?auto_1847649 ) ( ON ?auto_1847651 ?auto_1847650 ) ( ON ?auto_1847652 ?auto_1847651 ) ( not ( = ?auto_1847642 ?auto_1847643 ) ) ( not ( = ?auto_1847642 ?auto_1847644 ) ) ( not ( = ?auto_1847642 ?auto_1847646 ) ) ( not ( = ?auto_1847642 ?auto_1847645 ) ) ( not ( = ?auto_1847642 ?auto_1847647 ) ) ( not ( = ?auto_1847642 ?auto_1847648 ) ) ( not ( = ?auto_1847642 ?auto_1847649 ) ) ( not ( = ?auto_1847642 ?auto_1847650 ) ) ( not ( = ?auto_1847642 ?auto_1847651 ) ) ( not ( = ?auto_1847642 ?auto_1847652 ) ) ( not ( = ?auto_1847642 ?auto_1847653 ) ) ( not ( = ?auto_1847642 ?auto_1847654 ) ) ( not ( = ?auto_1847642 ?auto_1847657 ) ) ( not ( = ?auto_1847643 ?auto_1847644 ) ) ( not ( = ?auto_1847643 ?auto_1847646 ) ) ( not ( = ?auto_1847643 ?auto_1847645 ) ) ( not ( = ?auto_1847643 ?auto_1847647 ) ) ( not ( = ?auto_1847643 ?auto_1847648 ) ) ( not ( = ?auto_1847643 ?auto_1847649 ) ) ( not ( = ?auto_1847643 ?auto_1847650 ) ) ( not ( = ?auto_1847643 ?auto_1847651 ) ) ( not ( = ?auto_1847643 ?auto_1847652 ) ) ( not ( = ?auto_1847643 ?auto_1847653 ) ) ( not ( = ?auto_1847643 ?auto_1847654 ) ) ( not ( = ?auto_1847643 ?auto_1847657 ) ) ( not ( = ?auto_1847644 ?auto_1847646 ) ) ( not ( = ?auto_1847644 ?auto_1847645 ) ) ( not ( = ?auto_1847644 ?auto_1847647 ) ) ( not ( = ?auto_1847644 ?auto_1847648 ) ) ( not ( = ?auto_1847644 ?auto_1847649 ) ) ( not ( = ?auto_1847644 ?auto_1847650 ) ) ( not ( = ?auto_1847644 ?auto_1847651 ) ) ( not ( = ?auto_1847644 ?auto_1847652 ) ) ( not ( = ?auto_1847644 ?auto_1847653 ) ) ( not ( = ?auto_1847644 ?auto_1847654 ) ) ( not ( = ?auto_1847644 ?auto_1847657 ) ) ( not ( = ?auto_1847646 ?auto_1847645 ) ) ( not ( = ?auto_1847646 ?auto_1847647 ) ) ( not ( = ?auto_1847646 ?auto_1847648 ) ) ( not ( = ?auto_1847646 ?auto_1847649 ) ) ( not ( = ?auto_1847646 ?auto_1847650 ) ) ( not ( = ?auto_1847646 ?auto_1847651 ) ) ( not ( = ?auto_1847646 ?auto_1847652 ) ) ( not ( = ?auto_1847646 ?auto_1847653 ) ) ( not ( = ?auto_1847646 ?auto_1847654 ) ) ( not ( = ?auto_1847646 ?auto_1847657 ) ) ( not ( = ?auto_1847645 ?auto_1847647 ) ) ( not ( = ?auto_1847645 ?auto_1847648 ) ) ( not ( = ?auto_1847645 ?auto_1847649 ) ) ( not ( = ?auto_1847645 ?auto_1847650 ) ) ( not ( = ?auto_1847645 ?auto_1847651 ) ) ( not ( = ?auto_1847645 ?auto_1847652 ) ) ( not ( = ?auto_1847645 ?auto_1847653 ) ) ( not ( = ?auto_1847645 ?auto_1847654 ) ) ( not ( = ?auto_1847645 ?auto_1847657 ) ) ( not ( = ?auto_1847647 ?auto_1847648 ) ) ( not ( = ?auto_1847647 ?auto_1847649 ) ) ( not ( = ?auto_1847647 ?auto_1847650 ) ) ( not ( = ?auto_1847647 ?auto_1847651 ) ) ( not ( = ?auto_1847647 ?auto_1847652 ) ) ( not ( = ?auto_1847647 ?auto_1847653 ) ) ( not ( = ?auto_1847647 ?auto_1847654 ) ) ( not ( = ?auto_1847647 ?auto_1847657 ) ) ( not ( = ?auto_1847648 ?auto_1847649 ) ) ( not ( = ?auto_1847648 ?auto_1847650 ) ) ( not ( = ?auto_1847648 ?auto_1847651 ) ) ( not ( = ?auto_1847648 ?auto_1847652 ) ) ( not ( = ?auto_1847648 ?auto_1847653 ) ) ( not ( = ?auto_1847648 ?auto_1847654 ) ) ( not ( = ?auto_1847648 ?auto_1847657 ) ) ( not ( = ?auto_1847649 ?auto_1847650 ) ) ( not ( = ?auto_1847649 ?auto_1847651 ) ) ( not ( = ?auto_1847649 ?auto_1847652 ) ) ( not ( = ?auto_1847649 ?auto_1847653 ) ) ( not ( = ?auto_1847649 ?auto_1847654 ) ) ( not ( = ?auto_1847649 ?auto_1847657 ) ) ( not ( = ?auto_1847650 ?auto_1847651 ) ) ( not ( = ?auto_1847650 ?auto_1847652 ) ) ( not ( = ?auto_1847650 ?auto_1847653 ) ) ( not ( = ?auto_1847650 ?auto_1847654 ) ) ( not ( = ?auto_1847650 ?auto_1847657 ) ) ( not ( = ?auto_1847651 ?auto_1847652 ) ) ( not ( = ?auto_1847651 ?auto_1847653 ) ) ( not ( = ?auto_1847651 ?auto_1847654 ) ) ( not ( = ?auto_1847651 ?auto_1847657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847652 ?auto_1847653 ?auto_1847654 )
      ( MAKE-12CRATE-VERIFY ?auto_1847642 ?auto_1847643 ?auto_1847644 ?auto_1847646 ?auto_1847645 ?auto_1847647 ?auto_1847648 ?auto_1847649 ?auto_1847650 ?auto_1847651 ?auto_1847652 ?auto_1847653 ?auto_1847654 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1847805 - SURFACE
      ?auto_1847806 - SURFACE
      ?auto_1847807 - SURFACE
      ?auto_1847809 - SURFACE
      ?auto_1847808 - SURFACE
      ?auto_1847810 - SURFACE
      ?auto_1847811 - SURFACE
      ?auto_1847812 - SURFACE
      ?auto_1847813 - SURFACE
      ?auto_1847814 - SURFACE
      ?auto_1847815 - SURFACE
      ?auto_1847816 - SURFACE
      ?auto_1847817 - SURFACE
    )
    :vars
    (
      ?auto_1847821 - HOIST
      ?auto_1847820 - PLACE
      ?auto_1847818 - PLACE
      ?auto_1847822 - HOIST
      ?auto_1847819 - SURFACE
      ?auto_1847823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1847821 ?auto_1847820 ) ( IS-CRATE ?auto_1847817 ) ( not ( = ?auto_1847816 ?auto_1847817 ) ) ( not ( = ?auto_1847815 ?auto_1847816 ) ) ( not ( = ?auto_1847815 ?auto_1847817 ) ) ( not ( = ?auto_1847818 ?auto_1847820 ) ) ( HOIST-AT ?auto_1847822 ?auto_1847818 ) ( not ( = ?auto_1847821 ?auto_1847822 ) ) ( AVAILABLE ?auto_1847822 ) ( SURFACE-AT ?auto_1847817 ?auto_1847818 ) ( ON ?auto_1847817 ?auto_1847819 ) ( CLEAR ?auto_1847817 ) ( not ( = ?auto_1847816 ?auto_1847819 ) ) ( not ( = ?auto_1847817 ?auto_1847819 ) ) ( not ( = ?auto_1847815 ?auto_1847819 ) ) ( TRUCK-AT ?auto_1847823 ?auto_1847820 ) ( SURFACE-AT ?auto_1847815 ?auto_1847820 ) ( CLEAR ?auto_1847815 ) ( IS-CRATE ?auto_1847816 ) ( AVAILABLE ?auto_1847821 ) ( IN ?auto_1847816 ?auto_1847823 ) ( ON ?auto_1847806 ?auto_1847805 ) ( ON ?auto_1847807 ?auto_1847806 ) ( ON ?auto_1847809 ?auto_1847807 ) ( ON ?auto_1847808 ?auto_1847809 ) ( ON ?auto_1847810 ?auto_1847808 ) ( ON ?auto_1847811 ?auto_1847810 ) ( ON ?auto_1847812 ?auto_1847811 ) ( ON ?auto_1847813 ?auto_1847812 ) ( ON ?auto_1847814 ?auto_1847813 ) ( ON ?auto_1847815 ?auto_1847814 ) ( not ( = ?auto_1847805 ?auto_1847806 ) ) ( not ( = ?auto_1847805 ?auto_1847807 ) ) ( not ( = ?auto_1847805 ?auto_1847809 ) ) ( not ( = ?auto_1847805 ?auto_1847808 ) ) ( not ( = ?auto_1847805 ?auto_1847810 ) ) ( not ( = ?auto_1847805 ?auto_1847811 ) ) ( not ( = ?auto_1847805 ?auto_1847812 ) ) ( not ( = ?auto_1847805 ?auto_1847813 ) ) ( not ( = ?auto_1847805 ?auto_1847814 ) ) ( not ( = ?auto_1847805 ?auto_1847815 ) ) ( not ( = ?auto_1847805 ?auto_1847816 ) ) ( not ( = ?auto_1847805 ?auto_1847817 ) ) ( not ( = ?auto_1847805 ?auto_1847819 ) ) ( not ( = ?auto_1847806 ?auto_1847807 ) ) ( not ( = ?auto_1847806 ?auto_1847809 ) ) ( not ( = ?auto_1847806 ?auto_1847808 ) ) ( not ( = ?auto_1847806 ?auto_1847810 ) ) ( not ( = ?auto_1847806 ?auto_1847811 ) ) ( not ( = ?auto_1847806 ?auto_1847812 ) ) ( not ( = ?auto_1847806 ?auto_1847813 ) ) ( not ( = ?auto_1847806 ?auto_1847814 ) ) ( not ( = ?auto_1847806 ?auto_1847815 ) ) ( not ( = ?auto_1847806 ?auto_1847816 ) ) ( not ( = ?auto_1847806 ?auto_1847817 ) ) ( not ( = ?auto_1847806 ?auto_1847819 ) ) ( not ( = ?auto_1847807 ?auto_1847809 ) ) ( not ( = ?auto_1847807 ?auto_1847808 ) ) ( not ( = ?auto_1847807 ?auto_1847810 ) ) ( not ( = ?auto_1847807 ?auto_1847811 ) ) ( not ( = ?auto_1847807 ?auto_1847812 ) ) ( not ( = ?auto_1847807 ?auto_1847813 ) ) ( not ( = ?auto_1847807 ?auto_1847814 ) ) ( not ( = ?auto_1847807 ?auto_1847815 ) ) ( not ( = ?auto_1847807 ?auto_1847816 ) ) ( not ( = ?auto_1847807 ?auto_1847817 ) ) ( not ( = ?auto_1847807 ?auto_1847819 ) ) ( not ( = ?auto_1847809 ?auto_1847808 ) ) ( not ( = ?auto_1847809 ?auto_1847810 ) ) ( not ( = ?auto_1847809 ?auto_1847811 ) ) ( not ( = ?auto_1847809 ?auto_1847812 ) ) ( not ( = ?auto_1847809 ?auto_1847813 ) ) ( not ( = ?auto_1847809 ?auto_1847814 ) ) ( not ( = ?auto_1847809 ?auto_1847815 ) ) ( not ( = ?auto_1847809 ?auto_1847816 ) ) ( not ( = ?auto_1847809 ?auto_1847817 ) ) ( not ( = ?auto_1847809 ?auto_1847819 ) ) ( not ( = ?auto_1847808 ?auto_1847810 ) ) ( not ( = ?auto_1847808 ?auto_1847811 ) ) ( not ( = ?auto_1847808 ?auto_1847812 ) ) ( not ( = ?auto_1847808 ?auto_1847813 ) ) ( not ( = ?auto_1847808 ?auto_1847814 ) ) ( not ( = ?auto_1847808 ?auto_1847815 ) ) ( not ( = ?auto_1847808 ?auto_1847816 ) ) ( not ( = ?auto_1847808 ?auto_1847817 ) ) ( not ( = ?auto_1847808 ?auto_1847819 ) ) ( not ( = ?auto_1847810 ?auto_1847811 ) ) ( not ( = ?auto_1847810 ?auto_1847812 ) ) ( not ( = ?auto_1847810 ?auto_1847813 ) ) ( not ( = ?auto_1847810 ?auto_1847814 ) ) ( not ( = ?auto_1847810 ?auto_1847815 ) ) ( not ( = ?auto_1847810 ?auto_1847816 ) ) ( not ( = ?auto_1847810 ?auto_1847817 ) ) ( not ( = ?auto_1847810 ?auto_1847819 ) ) ( not ( = ?auto_1847811 ?auto_1847812 ) ) ( not ( = ?auto_1847811 ?auto_1847813 ) ) ( not ( = ?auto_1847811 ?auto_1847814 ) ) ( not ( = ?auto_1847811 ?auto_1847815 ) ) ( not ( = ?auto_1847811 ?auto_1847816 ) ) ( not ( = ?auto_1847811 ?auto_1847817 ) ) ( not ( = ?auto_1847811 ?auto_1847819 ) ) ( not ( = ?auto_1847812 ?auto_1847813 ) ) ( not ( = ?auto_1847812 ?auto_1847814 ) ) ( not ( = ?auto_1847812 ?auto_1847815 ) ) ( not ( = ?auto_1847812 ?auto_1847816 ) ) ( not ( = ?auto_1847812 ?auto_1847817 ) ) ( not ( = ?auto_1847812 ?auto_1847819 ) ) ( not ( = ?auto_1847813 ?auto_1847814 ) ) ( not ( = ?auto_1847813 ?auto_1847815 ) ) ( not ( = ?auto_1847813 ?auto_1847816 ) ) ( not ( = ?auto_1847813 ?auto_1847817 ) ) ( not ( = ?auto_1847813 ?auto_1847819 ) ) ( not ( = ?auto_1847814 ?auto_1847815 ) ) ( not ( = ?auto_1847814 ?auto_1847816 ) ) ( not ( = ?auto_1847814 ?auto_1847817 ) ) ( not ( = ?auto_1847814 ?auto_1847819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1847815 ?auto_1847816 ?auto_1847817 )
      ( MAKE-12CRATE-VERIFY ?auto_1847805 ?auto_1847806 ?auto_1847807 ?auto_1847809 ?auto_1847808 ?auto_1847810 ?auto_1847811 ?auto_1847812 ?auto_1847813 ?auto_1847814 ?auto_1847815 ?auto_1847816 ?auto_1847817 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1859364 - SURFACE
      ?auto_1859365 - SURFACE
      ?auto_1859366 - SURFACE
      ?auto_1859368 - SURFACE
      ?auto_1859367 - SURFACE
      ?auto_1859369 - SURFACE
      ?auto_1859370 - SURFACE
      ?auto_1859371 - SURFACE
      ?auto_1859372 - SURFACE
      ?auto_1859373 - SURFACE
      ?auto_1859374 - SURFACE
      ?auto_1859375 - SURFACE
      ?auto_1859376 - SURFACE
      ?auto_1859377 - SURFACE
    )
    :vars
    (
      ?auto_1859379 - HOIST
      ?auto_1859378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859379 ?auto_1859378 ) ( SURFACE-AT ?auto_1859376 ?auto_1859378 ) ( CLEAR ?auto_1859376 ) ( LIFTING ?auto_1859379 ?auto_1859377 ) ( IS-CRATE ?auto_1859377 ) ( not ( = ?auto_1859376 ?auto_1859377 ) ) ( ON ?auto_1859365 ?auto_1859364 ) ( ON ?auto_1859366 ?auto_1859365 ) ( ON ?auto_1859368 ?auto_1859366 ) ( ON ?auto_1859367 ?auto_1859368 ) ( ON ?auto_1859369 ?auto_1859367 ) ( ON ?auto_1859370 ?auto_1859369 ) ( ON ?auto_1859371 ?auto_1859370 ) ( ON ?auto_1859372 ?auto_1859371 ) ( ON ?auto_1859373 ?auto_1859372 ) ( ON ?auto_1859374 ?auto_1859373 ) ( ON ?auto_1859375 ?auto_1859374 ) ( ON ?auto_1859376 ?auto_1859375 ) ( not ( = ?auto_1859364 ?auto_1859365 ) ) ( not ( = ?auto_1859364 ?auto_1859366 ) ) ( not ( = ?auto_1859364 ?auto_1859368 ) ) ( not ( = ?auto_1859364 ?auto_1859367 ) ) ( not ( = ?auto_1859364 ?auto_1859369 ) ) ( not ( = ?auto_1859364 ?auto_1859370 ) ) ( not ( = ?auto_1859364 ?auto_1859371 ) ) ( not ( = ?auto_1859364 ?auto_1859372 ) ) ( not ( = ?auto_1859364 ?auto_1859373 ) ) ( not ( = ?auto_1859364 ?auto_1859374 ) ) ( not ( = ?auto_1859364 ?auto_1859375 ) ) ( not ( = ?auto_1859364 ?auto_1859376 ) ) ( not ( = ?auto_1859364 ?auto_1859377 ) ) ( not ( = ?auto_1859365 ?auto_1859366 ) ) ( not ( = ?auto_1859365 ?auto_1859368 ) ) ( not ( = ?auto_1859365 ?auto_1859367 ) ) ( not ( = ?auto_1859365 ?auto_1859369 ) ) ( not ( = ?auto_1859365 ?auto_1859370 ) ) ( not ( = ?auto_1859365 ?auto_1859371 ) ) ( not ( = ?auto_1859365 ?auto_1859372 ) ) ( not ( = ?auto_1859365 ?auto_1859373 ) ) ( not ( = ?auto_1859365 ?auto_1859374 ) ) ( not ( = ?auto_1859365 ?auto_1859375 ) ) ( not ( = ?auto_1859365 ?auto_1859376 ) ) ( not ( = ?auto_1859365 ?auto_1859377 ) ) ( not ( = ?auto_1859366 ?auto_1859368 ) ) ( not ( = ?auto_1859366 ?auto_1859367 ) ) ( not ( = ?auto_1859366 ?auto_1859369 ) ) ( not ( = ?auto_1859366 ?auto_1859370 ) ) ( not ( = ?auto_1859366 ?auto_1859371 ) ) ( not ( = ?auto_1859366 ?auto_1859372 ) ) ( not ( = ?auto_1859366 ?auto_1859373 ) ) ( not ( = ?auto_1859366 ?auto_1859374 ) ) ( not ( = ?auto_1859366 ?auto_1859375 ) ) ( not ( = ?auto_1859366 ?auto_1859376 ) ) ( not ( = ?auto_1859366 ?auto_1859377 ) ) ( not ( = ?auto_1859368 ?auto_1859367 ) ) ( not ( = ?auto_1859368 ?auto_1859369 ) ) ( not ( = ?auto_1859368 ?auto_1859370 ) ) ( not ( = ?auto_1859368 ?auto_1859371 ) ) ( not ( = ?auto_1859368 ?auto_1859372 ) ) ( not ( = ?auto_1859368 ?auto_1859373 ) ) ( not ( = ?auto_1859368 ?auto_1859374 ) ) ( not ( = ?auto_1859368 ?auto_1859375 ) ) ( not ( = ?auto_1859368 ?auto_1859376 ) ) ( not ( = ?auto_1859368 ?auto_1859377 ) ) ( not ( = ?auto_1859367 ?auto_1859369 ) ) ( not ( = ?auto_1859367 ?auto_1859370 ) ) ( not ( = ?auto_1859367 ?auto_1859371 ) ) ( not ( = ?auto_1859367 ?auto_1859372 ) ) ( not ( = ?auto_1859367 ?auto_1859373 ) ) ( not ( = ?auto_1859367 ?auto_1859374 ) ) ( not ( = ?auto_1859367 ?auto_1859375 ) ) ( not ( = ?auto_1859367 ?auto_1859376 ) ) ( not ( = ?auto_1859367 ?auto_1859377 ) ) ( not ( = ?auto_1859369 ?auto_1859370 ) ) ( not ( = ?auto_1859369 ?auto_1859371 ) ) ( not ( = ?auto_1859369 ?auto_1859372 ) ) ( not ( = ?auto_1859369 ?auto_1859373 ) ) ( not ( = ?auto_1859369 ?auto_1859374 ) ) ( not ( = ?auto_1859369 ?auto_1859375 ) ) ( not ( = ?auto_1859369 ?auto_1859376 ) ) ( not ( = ?auto_1859369 ?auto_1859377 ) ) ( not ( = ?auto_1859370 ?auto_1859371 ) ) ( not ( = ?auto_1859370 ?auto_1859372 ) ) ( not ( = ?auto_1859370 ?auto_1859373 ) ) ( not ( = ?auto_1859370 ?auto_1859374 ) ) ( not ( = ?auto_1859370 ?auto_1859375 ) ) ( not ( = ?auto_1859370 ?auto_1859376 ) ) ( not ( = ?auto_1859370 ?auto_1859377 ) ) ( not ( = ?auto_1859371 ?auto_1859372 ) ) ( not ( = ?auto_1859371 ?auto_1859373 ) ) ( not ( = ?auto_1859371 ?auto_1859374 ) ) ( not ( = ?auto_1859371 ?auto_1859375 ) ) ( not ( = ?auto_1859371 ?auto_1859376 ) ) ( not ( = ?auto_1859371 ?auto_1859377 ) ) ( not ( = ?auto_1859372 ?auto_1859373 ) ) ( not ( = ?auto_1859372 ?auto_1859374 ) ) ( not ( = ?auto_1859372 ?auto_1859375 ) ) ( not ( = ?auto_1859372 ?auto_1859376 ) ) ( not ( = ?auto_1859372 ?auto_1859377 ) ) ( not ( = ?auto_1859373 ?auto_1859374 ) ) ( not ( = ?auto_1859373 ?auto_1859375 ) ) ( not ( = ?auto_1859373 ?auto_1859376 ) ) ( not ( = ?auto_1859373 ?auto_1859377 ) ) ( not ( = ?auto_1859374 ?auto_1859375 ) ) ( not ( = ?auto_1859374 ?auto_1859376 ) ) ( not ( = ?auto_1859374 ?auto_1859377 ) ) ( not ( = ?auto_1859375 ?auto_1859376 ) ) ( not ( = ?auto_1859375 ?auto_1859377 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1859376 ?auto_1859377 )
      ( MAKE-13CRATE-VERIFY ?auto_1859364 ?auto_1859365 ?auto_1859366 ?auto_1859368 ?auto_1859367 ?auto_1859369 ?auto_1859370 ?auto_1859371 ?auto_1859372 ?auto_1859373 ?auto_1859374 ?auto_1859375 ?auto_1859376 ?auto_1859377 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1859506 - SURFACE
      ?auto_1859507 - SURFACE
      ?auto_1859508 - SURFACE
      ?auto_1859510 - SURFACE
      ?auto_1859509 - SURFACE
      ?auto_1859511 - SURFACE
      ?auto_1859512 - SURFACE
      ?auto_1859513 - SURFACE
      ?auto_1859514 - SURFACE
      ?auto_1859515 - SURFACE
      ?auto_1859516 - SURFACE
      ?auto_1859517 - SURFACE
      ?auto_1859518 - SURFACE
      ?auto_1859519 - SURFACE
    )
    :vars
    (
      ?auto_1859521 - HOIST
      ?auto_1859520 - PLACE
      ?auto_1859522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859521 ?auto_1859520 ) ( SURFACE-AT ?auto_1859518 ?auto_1859520 ) ( CLEAR ?auto_1859518 ) ( IS-CRATE ?auto_1859519 ) ( not ( = ?auto_1859518 ?auto_1859519 ) ) ( TRUCK-AT ?auto_1859522 ?auto_1859520 ) ( AVAILABLE ?auto_1859521 ) ( IN ?auto_1859519 ?auto_1859522 ) ( ON ?auto_1859518 ?auto_1859517 ) ( not ( = ?auto_1859517 ?auto_1859518 ) ) ( not ( = ?auto_1859517 ?auto_1859519 ) ) ( ON ?auto_1859507 ?auto_1859506 ) ( ON ?auto_1859508 ?auto_1859507 ) ( ON ?auto_1859510 ?auto_1859508 ) ( ON ?auto_1859509 ?auto_1859510 ) ( ON ?auto_1859511 ?auto_1859509 ) ( ON ?auto_1859512 ?auto_1859511 ) ( ON ?auto_1859513 ?auto_1859512 ) ( ON ?auto_1859514 ?auto_1859513 ) ( ON ?auto_1859515 ?auto_1859514 ) ( ON ?auto_1859516 ?auto_1859515 ) ( ON ?auto_1859517 ?auto_1859516 ) ( not ( = ?auto_1859506 ?auto_1859507 ) ) ( not ( = ?auto_1859506 ?auto_1859508 ) ) ( not ( = ?auto_1859506 ?auto_1859510 ) ) ( not ( = ?auto_1859506 ?auto_1859509 ) ) ( not ( = ?auto_1859506 ?auto_1859511 ) ) ( not ( = ?auto_1859506 ?auto_1859512 ) ) ( not ( = ?auto_1859506 ?auto_1859513 ) ) ( not ( = ?auto_1859506 ?auto_1859514 ) ) ( not ( = ?auto_1859506 ?auto_1859515 ) ) ( not ( = ?auto_1859506 ?auto_1859516 ) ) ( not ( = ?auto_1859506 ?auto_1859517 ) ) ( not ( = ?auto_1859506 ?auto_1859518 ) ) ( not ( = ?auto_1859506 ?auto_1859519 ) ) ( not ( = ?auto_1859507 ?auto_1859508 ) ) ( not ( = ?auto_1859507 ?auto_1859510 ) ) ( not ( = ?auto_1859507 ?auto_1859509 ) ) ( not ( = ?auto_1859507 ?auto_1859511 ) ) ( not ( = ?auto_1859507 ?auto_1859512 ) ) ( not ( = ?auto_1859507 ?auto_1859513 ) ) ( not ( = ?auto_1859507 ?auto_1859514 ) ) ( not ( = ?auto_1859507 ?auto_1859515 ) ) ( not ( = ?auto_1859507 ?auto_1859516 ) ) ( not ( = ?auto_1859507 ?auto_1859517 ) ) ( not ( = ?auto_1859507 ?auto_1859518 ) ) ( not ( = ?auto_1859507 ?auto_1859519 ) ) ( not ( = ?auto_1859508 ?auto_1859510 ) ) ( not ( = ?auto_1859508 ?auto_1859509 ) ) ( not ( = ?auto_1859508 ?auto_1859511 ) ) ( not ( = ?auto_1859508 ?auto_1859512 ) ) ( not ( = ?auto_1859508 ?auto_1859513 ) ) ( not ( = ?auto_1859508 ?auto_1859514 ) ) ( not ( = ?auto_1859508 ?auto_1859515 ) ) ( not ( = ?auto_1859508 ?auto_1859516 ) ) ( not ( = ?auto_1859508 ?auto_1859517 ) ) ( not ( = ?auto_1859508 ?auto_1859518 ) ) ( not ( = ?auto_1859508 ?auto_1859519 ) ) ( not ( = ?auto_1859510 ?auto_1859509 ) ) ( not ( = ?auto_1859510 ?auto_1859511 ) ) ( not ( = ?auto_1859510 ?auto_1859512 ) ) ( not ( = ?auto_1859510 ?auto_1859513 ) ) ( not ( = ?auto_1859510 ?auto_1859514 ) ) ( not ( = ?auto_1859510 ?auto_1859515 ) ) ( not ( = ?auto_1859510 ?auto_1859516 ) ) ( not ( = ?auto_1859510 ?auto_1859517 ) ) ( not ( = ?auto_1859510 ?auto_1859518 ) ) ( not ( = ?auto_1859510 ?auto_1859519 ) ) ( not ( = ?auto_1859509 ?auto_1859511 ) ) ( not ( = ?auto_1859509 ?auto_1859512 ) ) ( not ( = ?auto_1859509 ?auto_1859513 ) ) ( not ( = ?auto_1859509 ?auto_1859514 ) ) ( not ( = ?auto_1859509 ?auto_1859515 ) ) ( not ( = ?auto_1859509 ?auto_1859516 ) ) ( not ( = ?auto_1859509 ?auto_1859517 ) ) ( not ( = ?auto_1859509 ?auto_1859518 ) ) ( not ( = ?auto_1859509 ?auto_1859519 ) ) ( not ( = ?auto_1859511 ?auto_1859512 ) ) ( not ( = ?auto_1859511 ?auto_1859513 ) ) ( not ( = ?auto_1859511 ?auto_1859514 ) ) ( not ( = ?auto_1859511 ?auto_1859515 ) ) ( not ( = ?auto_1859511 ?auto_1859516 ) ) ( not ( = ?auto_1859511 ?auto_1859517 ) ) ( not ( = ?auto_1859511 ?auto_1859518 ) ) ( not ( = ?auto_1859511 ?auto_1859519 ) ) ( not ( = ?auto_1859512 ?auto_1859513 ) ) ( not ( = ?auto_1859512 ?auto_1859514 ) ) ( not ( = ?auto_1859512 ?auto_1859515 ) ) ( not ( = ?auto_1859512 ?auto_1859516 ) ) ( not ( = ?auto_1859512 ?auto_1859517 ) ) ( not ( = ?auto_1859512 ?auto_1859518 ) ) ( not ( = ?auto_1859512 ?auto_1859519 ) ) ( not ( = ?auto_1859513 ?auto_1859514 ) ) ( not ( = ?auto_1859513 ?auto_1859515 ) ) ( not ( = ?auto_1859513 ?auto_1859516 ) ) ( not ( = ?auto_1859513 ?auto_1859517 ) ) ( not ( = ?auto_1859513 ?auto_1859518 ) ) ( not ( = ?auto_1859513 ?auto_1859519 ) ) ( not ( = ?auto_1859514 ?auto_1859515 ) ) ( not ( = ?auto_1859514 ?auto_1859516 ) ) ( not ( = ?auto_1859514 ?auto_1859517 ) ) ( not ( = ?auto_1859514 ?auto_1859518 ) ) ( not ( = ?auto_1859514 ?auto_1859519 ) ) ( not ( = ?auto_1859515 ?auto_1859516 ) ) ( not ( = ?auto_1859515 ?auto_1859517 ) ) ( not ( = ?auto_1859515 ?auto_1859518 ) ) ( not ( = ?auto_1859515 ?auto_1859519 ) ) ( not ( = ?auto_1859516 ?auto_1859517 ) ) ( not ( = ?auto_1859516 ?auto_1859518 ) ) ( not ( = ?auto_1859516 ?auto_1859519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1859517 ?auto_1859518 ?auto_1859519 )
      ( MAKE-13CRATE-VERIFY ?auto_1859506 ?auto_1859507 ?auto_1859508 ?auto_1859510 ?auto_1859509 ?auto_1859511 ?auto_1859512 ?auto_1859513 ?auto_1859514 ?auto_1859515 ?auto_1859516 ?auto_1859517 ?auto_1859518 ?auto_1859519 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1859662 - SURFACE
      ?auto_1859663 - SURFACE
      ?auto_1859664 - SURFACE
      ?auto_1859666 - SURFACE
      ?auto_1859665 - SURFACE
      ?auto_1859667 - SURFACE
      ?auto_1859668 - SURFACE
      ?auto_1859669 - SURFACE
      ?auto_1859670 - SURFACE
      ?auto_1859671 - SURFACE
      ?auto_1859672 - SURFACE
      ?auto_1859673 - SURFACE
      ?auto_1859674 - SURFACE
      ?auto_1859675 - SURFACE
    )
    :vars
    (
      ?auto_1859676 - HOIST
      ?auto_1859678 - PLACE
      ?auto_1859677 - TRUCK
      ?auto_1859679 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859676 ?auto_1859678 ) ( SURFACE-AT ?auto_1859674 ?auto_1859678 ) ( CLEAR ?auto_1859674 ) ( IS-CRATE ?auto_1859675 ) ( not ( = ?auto_1859674 ?auto_1859675 ) ) ( AVAILABLE ?auto_1859676 ) ( IN ?auto_1859675 ?auto_1859677 ) ( ON ?auto_1859674 ?auto_1859673 ) ( not ( = ?auto_1859673 ?auto_1859674 ) ) ( not ( = ?auto_1859673 ?auto_1859675 ) ) ( TRUCK-AT ?auto_1859677 ?auto_1859679 ) ( not ( = ?auto_1859679 ?auto_1859678 ) ) ( ON ?auto_1859663 ?auto_1859662 ) ( ON ?auto_1859664 ?auto_1859663 ) ( ON ?auto_1859666 ?auto_1859664 ) ( ON ?auto_1859665 ?auto_1859666 ) ( ON ?auto_1859667 ?auto_1859665 ) ( ON ?auto_1859668 ?auto_1859667 ) ( ON ?auto_1859669 ?auto_1859668 ) ( ON ?auto_1859670 ?auto_1859669 ) ( ON ?auto_1859671 ?auto_1859670 ) ( ON ?auto_1859672 ?auto_1859671 ) ( ON ?auto_1859673 ?auto_1859672 ) ( not ( = ?auto_1859662 ?auto_1859663 ) ) ( not ( = ?auto_1859662 ?auto_1859664 ) ) ( not ( = ?auto_1859662 ?auto_1859666 ) ) ( not ( = ?auto_1859662 ?auto_1859665 ) ) ( not ( = ?auto_1859662 ?auto_1859667 ) ) ( not ( = ?auto_1859662 ?auto_1859668 ) ) ( not ( = ?auto_1859662 ?auto_1859669 ) ) ( not ( = ?auto_1859662 ?auto_1859670 ) ) ( not ( = ?auto_1859662 ?auto_1859671 ) ) ( not ( = ?auto_1859662 ?auto_1859672 ) ) ( not ( = ?auto_1859662 ?auto_1859673 ) ) ( not ( = ?auto_1859662 ?auto_1859674 ) ) ( not ( = ?auto_1859662 ?auto_1859675 ) ) ( not ( = ?auto_1859663 ?auto_1859664 ) ) ( not ( = ?auto_1859663 ?auto_1859666 ) ) ( not ( = ?auto_1859663 ?auto_1859665 ) ) ( not ( = ?auto_1859663 ?auto_1859667 ) ) ( not ( = ?auto_1859663 ?auto_1859668 ) ) ( not ( = ?auto_1859663 ?auto_1859669 ) ) ( not ( = ?auto_1859663 ?auto_1859670 ) ) ( not ( = ?auto_1859663 ?auto_1859671 ) ) ( not ( = ?auto_1859663 ?auto_1859672 ) ) ( not ( = ?auto_1859663 ?auto_1859673 ) ) ( not ( = ?auto_1859663 ?auto_1859674 ) ) ( not ( = ?auto_1859663 ?auto_1859675 ) ) ( not ( = ?auto_1859664 ?auto_1859666 ) ) ( not ( = ?auto_1859664 ?auto_1859665 ) ) ( not ( = ?auto_1859664 ?auto_1859667 ) ) ( not ( = ?auto_1859664 ?auto_1859668 ) ) ( not ( = ?auto_1859664 ?auto_1859669 ) ) ( not ( = ?auto_1859664 ?auto_1859670 ) ) ( not ( = ?auto_1859664 ?auto_1859671 ) ) ( not ( = ?auto_1859664 ?auto_1859672 ) ) ( not ( = ?auto_1859664 ?auto_1859673 ) ) ( not ( = ?auto_1859664 ?auto_1859674 ) ) ( not ( = ?auto_1859664 ?auto_1859675 ) ) ( not ( = ?auto_1859666 ?auto_1859665 ) ) ( not ( = ?auto_1859666 ?auto_1859667 ) ) ( not ( = ?auto_1859666 ?auto_1859668 ) ) ( not ( = ?auto_1859666 ?auto_1859669 ) ) ( not ( = ?auto_1859666 ?auto_1859670 ) ) ( not ( = ?auto_1859666 ?auto_1859671 ) ) ( not ( = ?auto_1859666 ?auto_1859672 ) ) ( not ( = ?auto_1859666 ?auto_1859673 ) ) ( not ( = ?auto_1859666 ?auto_1859674 ) ) ( not ( = ?auto_1859666 ?auto_1859675 ) ) ( not ( = ?auto_1859665 ?auto_1859667 ) ) ( not ( = ?auto_1859665 ?auto_1859668 ) ) ( not ( = ?auto_1859665 ?auto_1859669 ) ) ( not ( = ?auto_1859665 ?auto_1859670 ) ) ( not ( = ?auto_1859665 ?auto_1859671 ) ) ( not ( = ?auto_1859665 ?auto_1859672 ) ) ( not ( = ?auto_1859665 ?auto_1859673 ) ) ( not ( = ?auto_1859665 ?auto_1859674 ) ) ( not ( = ?auto_1859665 ?auto_1859675 ) ) ( not ( = ?auto_1859667 ?auto_1859668 ) ) ( not ( = ?auto_1859667 ?auto_1859669 ) ) ( not ( = ?auto_1859667 ?auto_1859670 ) ) ( not ( = ?auto_1859667 ?auto_1859671 ) ) ( not ( = ?auto_1859667 ?auto_1859672 ) ) ( not ( = ?auto_1859667 ?auto_1859673 ) ) ( not ( = ?auto_1859667 ?auto_1859674 ) ) ( not ( = ?auto_1859667 ?auto_1859675 ) ) ( not ( = ?auto_1859668 ?auto_1859669 ) ) ( not ( = ?auto_1859668 ?auto_1859670 ) ) ( not ( = ?auto_1859668 ?auto_1859671 ) ) ( not ( = ?auto_1859668 ?auto_1859672 ) ) ( not ( = ?auto_1859668 ?auto_1859673 ) ) ( not ( = ?auto_1859668 ?auto_1859674 ) ) ( not ( = ?auto_1859668 ?auto_1859675 ) ) ( not ( = ?auto_1859669 ?auto_1859670 ) ) ( not ( = ?auto_1859669 ?auto_1859671 ) ) ( not ( = ?auto_1859669 ?auto_1859672 ) ) ( not ( = ?auto_1859669 ?auto_1859673 ) ) ( not ( = ?auto_1859669 ?auto_1859674 ) ) ( not ( = ?auto_1859669 ?auto_1859675 ) ) ( not ( = ?auto_1859670 ?auto_1859671 ) ) ( not ( = ?auto_1859670 ?auto_1859672 ) ) ( not ( = ?auto_1859670 ?auto_1859673 ) ) ( not ( = ?auto_1859670 ?auto_1859674 ) ) ( not ( = ?auto_1859670 ?auto_1859675 ) ) ( not ( = ?auto_1859671 ?auto_1859672 ) ) ( not ( = ?auto_1859671 ?auto_1859673 ) ) ( not ( = ?auto_1859671 ?auto_1859674 ) ) ( not ( = ?auto_1859671 ?auto_1859675 ) ) ( not ( = ?auto_1859672 ?auto_1859673 ) ) ( not ( = ?auto_1859672 ?auto_1859674 ) ) ( not ( = ?auto_1859672 ?auto_1859675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1859673 ?auto_1859674 ?auto_1859675 )
      ( MAKE-13CRATE-VERIFY ?auto_1859662 ?auto_1859663 ?auto_1859664 ?auto_1859666 ?auto_1859665 ?auto_1859667 ?auto_1859668 ?auto_1859669 ?auto_1859670 ?auto_1859671 ?auto_1859672 ?auto_1859673 ?auto_1859674 ?auto_1859675 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1859831 - SURFACE
      ?auto_1859832 - SURFACE
      ?auto_1859833 - SURFACE
      ?auto_1859835 - SURFACE
      ?auto_1859834 - SURFACE
      ?auto_1859836 - SURFACE
      ?auto_1859837 - SURFACE
      ?auto_1859838 - SURFACE
      ?auto_1859839 - SURFACE
      ?auto_1859840 - SURFACE
      ?auto_1859841 - SURFACE
      ?auto_1859842 - SURFACE
      ?auto_1859843 - SURFACE
      ?auto_1859844 - SURFACE
    )
    :vars
    (
      ?auto_1859848 - HOIST
      ?auto_1859846 - PLACE
      ?auto_1859847 - TRUCK
      ?auto_1859845 - PLACE
      ?auto_1859849 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1859848 ?auto_1859846 ) ( SURFACE-AT ?auto_1859843 ?auto_1859846 ) ( CLEAR ?auto_1859843 ) ( IS-CRATE ?auto_1859844 ) ( not ( = ?auto_1859843 ?auto_1859844 ) ) ( AVAILABLE ?auto_1859848 ) ( ON ?auto_1859843 ?auto_1859842 ) ( not ( = ?auto_1859842 ?auto_1859843 ) ) ( not ( = ?auto_1859842 ?auto_1859844 ) ) ( TRUCK-AT ?auto_1859847 ?auto_1859845 ) ( not ( = ?auto_1859845 ?auto_1859846 ) ) ( HOIST-AT ?auto_1859849 ?auto_1859845 ) ( LIFTING ?auto_1859849 ?auto_1859844 ) ( not ( = ?auto_1859848 ?auto_1859849 ) ) ( ON ?auto_1859832 ?auto_1859831 ) ( ON ?auto_1859833 ?auto_1859832 ) ( ON ?auto_1859835 ?auto_1859833 ) ( ON ?auto_1859834 ?auto_1859835 ) ( ON ?auto_1859836 ?auto_1859834 ) ( ON ?auto_1859837 ?auto_1859836 ) ( ON ?auto_1859838 ?auto_1859837 ) ( ON ?auto_1859839 ?auto_1859838 ) ( ON ?auto_1859840 ?auto_1859839 ) ( ON ?auto_1859841 ?auto_1859840 ) ( ON ?auto_1859842 ?auto_1859841 ) ( not ( = ?auto_1859831 ?auto_1859832 ) ) ( not ( = ?auto_1859831 ?auto_1859833 ) ) ( not ( = ?auto_1859831 ?auto_1859835 ) ) ( not ( = ?auto_1859831 ?auto_1859834 ) ) ( not ( = ?auto_1859831 ?auto_1859836 ) ) ( not ( = ?auto_1859831 ?auto_1859837 ) ) ( not ( = ?auto_1859831 ?auto_1859838 ) ) ( not ( = ?auto_1859831 ?auto_1859839 ) ) ( not ( = ?auto_1859831 ?auto_1859840 ) ) ( not ( = ?auto_1859831 ?auto_1859841 ) ) ( not ( = ?auto_1859831 ?auto_1859842 ) ) ( not ( = ?auto_1859831 ?auto_1859843 ) ) ( not ( = ?auto_1859831 ?auto_1859844 ) ) ( not ( = ?auto_1859832 ?auto_1859833 ) ) ( not ( = ?auto_1859832 ?auto_1859835 ) ) ( not ( = ?auto_1859832 ?auto_1859834 ) ) ( not ( = ?auto_1859832 ?auto_1859836 ) ) ( not ( = ?auto_1859832 ?auto_1859837 ) ) ( not ( = ?auto_1859832 ?auto_1859838 ) ) ( not ( = ?auto_1859832 ?auto_1859839 ) ) ( not ( = ?auto_1859832 ?auto_1859840 ) ) ( not ( = ?auto_1859832 ?auto_1859841 ) ) ( not ( = ?auto_1859832 ?auto_1859842 ) ) ( not ( = ?auto_1859832 ?auto_1859843 ) ) ( not ( = ?auto_1859832 ?auto_1859844 ) ) ( not ( = ?auto_1859833 ?auto_1859835 ) ) ( not ( = ?auto_1859833 ?auto_1859834 ) ) ( not ( = ?auto_1859833 ?auto_1859836 ) ) ( not ( = ?auto_1859833 ?auto_1859837 ) ) ( not ( = ?auto_1859833 ?auto_1859838 ) ) ( not ( = ?auto_1859833 ?auto_1859839 ) ) ( not ( = ?auto_1859833 ?auto_1859840 ) ) ( not ( = ?auto_1859833 ?auto_1859841 ) ) ( not ( = ?auto_1859833 ?auto_1859842 ) ) ( not ( = ?auto_1859833 ?auto_1859843 ) ) ( not ( = ?auto_1859833 ?auto_1859844 ) ) ( not ( = ?auto_1859835 ?auto_1859834 ) ) ( not ( = ?auto_1859835 ?auto_1859836 ) ) ( not ( = ?auto_1859835 ?auto_1859837 ) ) ( not ( = ?auto_1859835 ?auto_1859838 ) ) ( not ( = ?auto_1859835 ?auto_1859839 ) ) ( not ( = ?auto_1859835 ?auto_1859840 ) ) ( not ( = ?auto_1859835 ?auto_1859841 ) ) ( not ( = ?auto_1859835 ?auto_1859842 ) ) ( not ( = ?auto_1859835 ?auto_1859843 ) ) ( not ( = ?auto_1859835 ?auto_1859844 ) ) ( not ( = ?auto_1859834 ?auto_1859836 ) ) ( not ( = ?auto_1859834 ?auto_1859837 ) ) ( not ( = ?auto_1859834 ?auto_1859838 ) ) ( not ( = ?auto_1859834 ?auto_1859839 ) ) ( not ( = ?auto_1859834 ?auto_1859840 ) ) ( not ( = ?auto_1859834 ?auto_1859841 ) ) ( not ( = ?auto_1859834 ?auto_1859842 ) ) ( not ( = ?auto_1859834 ?auto_1859843 ) ) ( not ( = ?auto_1859834 ?auto_1859844 ) ) ( not ( = ?auto_1859836 ?auto_1859837 ) ) ( not ( = ?auto_1859836 ?auto_1859838 ) ) ( not ( = ?auto_1859836 ?auto_1859839 ) ) ( not ( = ?auto_1859836 ?auto_1859840 ) ) ( not ( = ?auto_1859836 ?auto_1859841 ) ) ( not ( = ?auto_1859836 ?auto_1859842 ) ) ( not ( = ?auto_1859836 ?auto_1859843 ) ) ( not ( = ?auto_1859836 ?auto_1859844 ) ) ( not ( = ?auto_1859837 ?auto_1859838 ) ) ( not ( = ?auto_1859837 ?auto_1859839 ) ) ( not ( = ?auto_1859837 ?auto_1859840 ) ) ( not ( = ?auto_1859837 ?auto_1859841 ) ) ( not ( = ?auto_1859837 ?auto_1859842 ) ) ( not ( = ?auto_1859837 ?auto_1859843 ) ) ( not ( = ?auto_1859837 ?auto_1859844 ) ) ( not ( = ?auto_1859838 ?auto_1859839 ) ) ( not ( = ?auto_1859838 ?auto_1859840 ) ) ( not ( = ?auto_1859838 ?auto_1859841 ) ) ( not ( = ?auto_1859838 ?auto_1859842 ) ) ( not ( = ?auto_1859838 ?auto_1859843 ) ) ( not ( = ?auto_1859838 ?auto_1859844 ) ) ( not ( = ?auto_1859839 ?auto_1859840 ) ) ( not ( = ?auto_1859839 ?auto_1859841 ) ) ( not ( = ?auto_1859839 ?auto_1859842 ) ) ( not ( = ?auto_1859839 ?auto_1859843 ) ) ( not ( = ?auto_1859839 ?auto_1859844 ) ) ( not ( = ?auto_1859840 ?auto_1859841 ) ) ( not ( = ?auto_1859840 ?auto_1859842 ) ) ( not ( = ?auto_1859840 ?auto_1859843 ) ) ( not ( = ?auto_1859840 ?auto_1859844 ) ) ( not ( = ?auto_1859841 ?auto_1859842 ) ) ( not ( = ?auto_1859841 ?auto_1859843 ) ) ( not ( = ?auto_1859841 ?auto_1859844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1859842 ?auto_1859843 ?auto_1859844 )
      ( MAKE-13CRATE-VERIFY ?auto_1859831 ?auto_1859832 ?auto_1859833 ?auto_1859835 ?auto_1859834 ?auto_1859836 ?auto_1859837 ?auto_1859838 ?auto_1859839 ?auto_1859840 ?auto_1859841 ?auto_1859842 ?auto_1859843 ?auto_1859844 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860013 - SURFACE
      ?auto_1860014 - SURFACE
      ?auto_1860015 - SURFACE
      ?auto_1860017 - SURFACE
      ?auto_1860016 - SURFACE
      ?auto_1860018 - SURFACE
      ?auto_1860019 - SURFACE
      ?auto_1860020 - SURFACE
      ?auto_1860021 - SURFACE
      ?auto_1860022 - SURFACE
      ?auto_1860023 - SURFACE
      ?auto_1860024 - SURFACE
      ?auto_1860025 - SURFACE
      ?auto_1860026 - SURFACE
    )
    :vars
    (
      ?auto_1860032 - HOIST
      ?auto_1860030 - PLACE
      ?auto_1860028 - TRUCK
      ?auto_1860031 - PLACE
      ?auto_1860027 - HOIST
      ?auto_1860029 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860032 ?auto_1860030 ) ( SURFACE-AT ?auto_1860025 ?auto_1860030 ) ( CLEAR ?auto_1860025 ) ( IS-CRATE ?auto_1860026 ) ( not ( = ?auto_1860025 ?auto_1860026 ) ) ( AVAILABLE ?auto_1860032 ) ( ON ?auto_1860025 ?auto_1860024 ) ( not ( = ?auto_1860024 ?auto_1860025 ) ) ( not ( = ?auto_1860024 ?auto_1860026 ) ) ( TRUCK-AT ?auto_1860028 ?auto_1860031 ) ( not ( = ?auto_1860031 ?auto_1860030 ) ) ( HOIST-AT ?auto_1860027 ?auto_1860031 ) ( not ( = ?auto_1860032 ?auto_1860027 ) ) ( AVAILABLE ?auto_1860027 ) ( SURFACE-AT ?auto_1860026 ?auto_1860031 ) ( ON ?auto_1860026 ?auto_1860029 ) ( CLEAR ?auto_1860026 ) ( not ( = ?auto_1860025 ?auto_1860029 ) ) ( not ( = ?auto_1860026 ?auto_1860029 ) ) ( not ( = ?auto_1860024 ?auto_1860029 ) ) ( ON ?auto_1860014 ?auto_1860013 ) ( ON ?auto_1860015 ?auto_1860014 ) ( ON ?auto_1860017 ?auto_1860015 ) ( ON ?auto_1860016 ?auto_1860017 ) ( ON ?auto_1860018 ?auto_1860016 ) ( ON ?auto_1860019 ?auto_1860018 ) ( ON ?auto_1860020 ?auto_1860019 ) ( ON ?auto_1860021 ?auto_1860020 ) ( ON ?auto_1860022 ?auto_1860021 ) ( ON ?auto_1860023 ?auto_1860022 ) ( ON ?auto_1860024 ?auto_1860023 ) ( not ( = ?auto_1860013 ?auto_1860014 ) ) ( not ( = ?auto_1860013 ?auto_1860015 ) ) ( not ( = ?auto_1860013 ?auto_1860017 ) ) ( not ( = ?auto_1860013 ?auto_1860016 ) ) ( not ( = ?auto_1860013 ?auto_1860018 ) ) ( not ( = ?auto_1860013 ?auto_1860019 ) ) ( not ( = ?auto_1860013 ?auto_1860020 ) ) ( not ( = ?auto_1860013 ?auto_1860021 ) ) ( not ( = ?auto_1860013 ?auto_1860022 ) ) ( not ( = ?auto_1860013 ?auto_1860023 ) ) ( not ( = ?auto_1860013 ?auto_1860024 ) ) ( not ( = ?auto_1860013 ?auto_1860025 ) ) ( not ( = ?auto_1860013 ?auto_1860026 ) ) ( not ( = ?auto_1860013 ?auto_1860029 ) ) ( not ( = ?auto_1860014 ?auto_1860015 ) ) ( not ( = ?auto_1860014 ?auto_1860017 ) ) ( not ( = ?auto_1860014 ?auto_1860016 ) ) ( not ( = ?auto_1860014 ?auto_1860018 ) ) ( not ( = ?auto_1860014 ?auto_1860019 ) ) ( not ( = ?auto_1860014 ?auto_1860020 ) ) ( not ( = ?auto_1860014 ?auto_1860021 ) ) ( not ( = ?auto_1860014 ?auto_1860022 ) ) ( not ( = ?auto_1860014 ?auto_1860023 ) ) ( not ( = ?auto_1860014 ?auto_1860024 ) ) ( not ( = ?auto_1860014 ?auto_1860025 ) ) ( not ( = ?auto_1860014 ?auto_1860026 ) ) ( not ( = ?auto_1860014 ?auto_1860029 ) ) ( not ( = ?auto_1860015 ?auto_1860017 ) ) ( not ( = ?auto_1860015 ?auto_1860016 ) ) ( not ( = ?auto_1860015 ?auto_1860018 ) ) ( not ( = ?auto_1860015 ?auto_1860019 ) ) ( not ( = ?auto_1860015 ?auto_1860020 ) ) ( not ( = ?auto_1860015 ?auto_1860021 ) ) ( not ( = ?auto_1860015 ?auto_1860022 ) ) ( not ( = ?auto_1860015 ?auto_1860023 ) ) ( not ( = ?auto_1860015 ?auto_1860024 ) ) ( not ( = ?auto_1860015 ?auto_1860025 ) ) ( not ( = ?auto_1860015 ?auto_1860026 ) ) ( not ( = ?auto_1860015 ?auto_1860029 ) ) ( not ( = ?auto_1860017 ?auto_1860016 ) ) ( not ( = ?auto_1860017 ?auto_1860018 ) ) ( not ( = ?auto_1860017 ?auto_1860019 ) ) ( not ( = ?auto_1860017 ?auto_1860020 ) ) ( not ( = ?auto_1860017 ?auto_1860021 ) ) ( not ( = ?auto_1860017 ?auto_1860022 ) ) ( not ( = ?auto_1860017 ?auto_1860023 ) ) ( not ( = ?auto_1860017 ?auto_1860024 ) ) ( not ( = ?auto_1860017 ?auto_1860025 ) ) ( not ( = ?auto_1860017 ?auto_1860026 ) ) ( not ( = ?auto_1860017 ?auto_1860029 ) ) ( not ( = ?auto_1860016 ?auto_1860018 ) ) ( not ( = ?auto_1860016 ?auto_1860019 ) ) ( not ( = ?auto_1860016 ?auto_1860020 ) ) ( not ( = ?auto_1860016 ?auto_1860021 ) ) ( not ( = ?auto_1860016 ?auto_1860022 ) ) ( not ( = ?auto_1860016 ?auto_1860023 ) ) ( not ( = ?auto_1860016 ?auto_1860024 ) ) ( not ( = ?auto_1860016 ?auto_1860025 ) ) ( not ( = ?auto_1860016 ?auto_1860026 ) ) ( not ( = ?auto_1860016 ?auto_1860029 ) ) ( not ( = ?auto_1860018 ?auto_1860019 ) ) ( not ( = ?auto_1860018 ?auto_1860020 ) ) ( not ( = ?auto_1860018 ?auto_1860021 ) ) ( not ( = ?auto_1860018 ?auto_1860022 ) ) ( not ( = ?auto_1860018 ?auto_1860023 ) ) ( not ( = ?auto_1860018 ?auto_1860024 ) ) ( not ( = ?auto_1860018 ?auto_1860025 ) ) ( not ( = ?auto_1860018 ?auto_1860026 ) ) ( not ( = ?auto_1860018 ?auto_1860029 ) ) ( not ( = ?auto_1860019 ?auto_1860020 ) ) ( not ( = ?auto_1860019 ?auto_1860021 ) ) ( not ( = ?auto_1860019 ?auto_1860022 ) ) ( not ( = ?auto_1860019 ?auto_1860023 ) ) ( not ( = ?auto_1860019 ?auto_1860024 ) ) ( not ( = ?auto_1860019 ?auto_1860025 ) ) ( not ( = ?auto_1860019 ?auto_1860026 ) ) ( not ( = ?auto_1860019 ?auto_1860029 ) ) ( not ( = ?auto_1860020 ?auto_1860021 ) ) ( not ( = ?auto_1860020 ?auto_1860022 ) ) ( not ( = ?auto_1860020 ?auto_1860023 ) ) ( not ( = ?auto_1860020 ?auto_1860024 ) ) ( not ( = ?auto_1860020 ?auto_1860025 ) ) ( not ( = ?auto_1860020 ?auto_1860026 ) ) ( not ( = ?auto_1860020 ?auto_1860029 ) ) ( not ( = ?auto_1860021 ?auto_1860022 ) ) ( not ( = ?auto_1860021 ?auto_1860023 ) ) ( not ( = ?auto_1860021 ?auto_1860024 ) ) ( not ( = ?auto_1860021 ?auto_1860025 ) ) ( not ( = ?auto_1860021 ?auto_1860026 ) ) ( not ( = ?auto_1860021 ?auto_1860029 ) ) ( not ( = ?auto_1860022 ?auto_1860023 ) ) ( not ( = ?auto_1860022 ?auto_1860024 ) ) ( not ( = ?auto_1860022 ?auto_1860025 ) ) ( not ( = ?auto_1860022 ?auto_1860026 ) ) ( not ( = ?auto_1860022 ?auto_1860029 ) ) ( not ( = ?auto_1860023 ?auto_1860024 ) ) ( not ( = ?auto_1860023 ?auto_1860025 ) ) ( not ( = ?auto_1860023 ?auto_1860026 ) ) ( not ( = ?auto_1860023 ?auto_1860029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860024 ?auto_1860025 ?auto_1860026 )
      ( MAKE-13CRATE-VERIFY ?auto_1860013 ?auto_1860014 ?auto_1860015 ?auto_1860017 ?auto_1860016 ?auto_1860018 ?auto_1860019 ?auto_1860020 ?auto_1860021 ?auto_1860022 ?auto_1860023 ?auto_1860024 ?auto_1860025 ?auto_1860026 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860196 - SURFACE
      ?auto_1860197 - SURFACE
      ?auto_1860198 - SURFACE
      ?auto_1860200 - SURFACE
      ?auto_1860199 - SURFACE
      ?auto_1860201 - SURFACE
      ?auto_1860202 - SURFACE
      ?auto_1860203 - SURFACE
      ?auto_1860204 - SURFACE
      ?auto_1860205 - SURFACE
      ?auto_1860206 - SURFACE
      ?auto_1860207 - SURFACE
      ?auto_1860208 - SURFACE
      ?auto_1860209 - SURFACE
    )
    :vars
    (
      ?auto_1860212 - HOIST
      ?auto_1860211 - PLACE
      ?auto_1860210 - PLACE
      ?auto_1860213 - HOIST
      ?auto_1860214 - SURFACE
      ?auto_1860215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860212 ?auto_1860211 ) ( SURFACE-AT ?auto_1860208 ?auto_1860211 ) ( CLEAR ?auto_1860208 ) ( IS-CRATE ?auto_1860209 ) ( not ( = ?auto_1860208 ?auto_1860209 ) ) ( AVAILABLE ?auto_1860212 ) ( ON ?auto_1860208 ?auto_1860207 ) ( not ( = ?auto_1860207 ?auto_1860208 ) ) ( not ( = ?auto_1860207 ?auto_1860209 ) ) ( not ( = ?auto_1860210 ?auto_1860211 ) ) ( HOIST-AT ?auto_1860213 ?auto_1860210 ) ( not ( = ?auto_1860212 ?auto_1860213 ) ) ( AVAILABLE ?auto_1860213 ) ( SURFACE-AT ?auto_1860209 ?auto_1860210 ) ( ON ?auto_1860209 ?auto_1860214 ) ( CLEAR ?auto_1860209 ) ( not ( = ?auto_1860208 ?auto_1860214 ) ) ( not ( = ?auto_1860209 ?auto_1860214 ) ) ( not ( = ?auto_1860207 ?auto_1860214 ) ) ( TRUCK-AT ?auto_1860215 ?auto_1860211 ) ( ON ?auto_1860197 ?auto_1860196 ) ( ON ?auto_1860198 ?auto_1860197 ) ( ON ?auto_1860200 ?auto_1860198 ) ( ON ?auto_1860199 ?auto_1860200 ) ( ON ?auto_1860201 ?auto_1860199 ) ( ON ?auto_1860202 ?auto_1860201 ) ( ON ?auto_1860203 ?auto_1860202 ) ( ON ?auto_1860204 ?auto_1860203 ) ( ON ?auto_1860205 ?auto_1860204 ) ( ON ?auto_1860206 ?auto_1860205 ) ( ON ?auto_1860207 ?auto_1860206 ) ( not ( = ?auto_1860196 ?auto_1860197 ) ) ( not ( = ?auto_1860196 ?auto_1860198 ) ) ( not ( = ?auto_1860196 ?auto_1860200 ) ) ( not ( = ?auto_1860196 ?auto_1860199 ) ) ( not ( = ?auto_1860196 ?auto_1860201 ) ) ( not ( = ?auto_1860196 ?auto_1860202 ) ) ( not ( = ?auto_1860196 ?auto_1860203 ) ) ( not ( = ?auto_1860196 ?auto_1860204 ) ) ( not ( = ?auto_1860196 ?auto_1860205 ) ) ( not ( = ?auto_1860196 ?auto_1860206 ) ) ( not ( = ?auto_1860196 ?auto_1860207 ) ) ( not ( = ?auto_1860196 ?auto_1860208 ) ) ( not ( = ?auto_1860196 ?auto_1860209 ) ) ( not ( = ?auto_1860196 ?auto_1860214 ) ) ( not ( = ?auto_1860197 ?auto_1860198 ) ) ( not ( = ?auto_1860197 ?auto_1860200 ) ) ( not ( = ?auto_1860197 ?auto_1860199 ) ) ( not ( = ?auto_1860197 ?auto_1860201 ) ) ( not ( = ?auto_1860197 ?auto_1860202 ) ) ( not ( = ?auto_1860197 ?auto_1860203 ) ) ( not ( = ?auto_1860197 ?auto_1860204 ) ) ( not ( = ?auto_1860197 ?auto_1860205 ) ) ( not ( = ?auto_1860197 ?auto_1860206 ) ) ( not ( = ?auto_1860197 ?auto_1860207 ) ) ( not ( = ?auto_1860197 ?auto_1860208 ) ) ( not ( = ?auto_1860197 ?auto_1860209 ) ) ( not ( = ?auto_1860197 ?auto_1860214 ) ) ( not ( = ?auto_1860198 ?auto_1860200 ) ) ( not ( = ?auto_1860198 ?auto_1860199 ) ) ( not ( = ?auto_1860198 ?auto_1860201 ) ) ( not ( = ?auto_1860198 ?auto_1860202 ) ) ( not ( = ?auto_1860198 ?auto_1860203 ) ) ( not ( = ?auto_1860198 ?auto_1860204 ) ) ( not ( = ?auto_1860198 ?auto_1860205 ) ) ( not ( = ?auto_1860198 ?auto_1860206 ) ) ( not ( = ?auto_1860198 ?auto_1860207 ) ) ( not ( = ?auto_1860198 ?auto_1860208 ) ) ( not ( = ?auto_1860198 ?auto_1860209 ) ) ( not ( = ?auto_1860198 ?auto_1860214 ) ) ( not ( = ?auto_1860200 ?auto_1860199 ) ) ( not ( = ?auto_1860200 ?auto_1860201 ) ) ( not ( = ?auto_1860200 ?auto_1860202 ) ) ( not ( = ?auto_1860200 ?auto_1860203 ) ) ( not ( = ?auto_1860200 ?auto_1860204 ) ) ( not ( = ?auto_1860200 ?auto_1860205 ) ) ( not ( = ?auto_1860200 ?auto_1860206 ) ) ( not ( = ?auto_1860200 ?auto_1860207 ) ) ( not ( = ?auto_1860200 ?auto_1860208 ) ) ( not ( = ?auto_1860200 ?auto_1860209 ) ) ( not ( = ?auto_1860200 ?auto_1860214 ) ) ( not ( = ?auto_1860199 ?auto_1860201 ) ) ( not ( = ?auto_1860199 ?auto_1860202 ) ) ( not ( = ?auto_1860199 ?auto_1860203 ) ) ( not ( = ?auto_1860199 ?auto_1860204 ) ) ( not ( = ?auto_1860199 ?auto_1860205 ) ) ( not ( = ?auto_1860199 ?auto_1860206 ) ) ( not ( = ?auto_1860199 ?auto_1860207 ) ) ( not ( = ?auto_1860199 ?auto_1860208 ) ) ( not ( = ?auto_1860199 ?auto_1860209 ) ) ( not ( = ?auto_1860199 ?auto_1860214 ) ) ( not ( = ?auto_1860201 ?auto_1860202 ) ) ( not ( = ?auto_1860201 ?auto_1860203 ) ) ( not ( = ?auto_1860201 ?auto_1860204 ) ) ( not ( = ?auto_1860201 ?auto_1860205 ) ) ( not ( = ?auto_1860201 ?auto_1860206 ) ) ( not ( = ?auto_1860201 ?auto_1860207 ) ) ( not ( = ?auto_1860201 ?auto_1860208 ) ) ( not ( = ?auto_1860201 ?auto_1860209 ) ) ( not ( = ?auto_1860201 ?auto_1860214 ) ) ( not ( = ?auto_1860202 ?auto_1860203 ) ) ( not ( = ?auto_1860202 ?auto_1860204 ) ) ( not ( = ?auto_1860202 ?auto_1860205 ) ) ( not ( = ?auto_1860202 ?auto_1860206 ) ) ( not ( = ?auto_1860202 ?auto_1860207 ) ) ( not ( = ?auto_1860202 ?auto_1860208 ) ) ( not ( = ?auto_1860202 ?auto_1860209 ) ) ( not ( = ?auto_1860202 ?auto_1860214 ) ) ( not ( = ?auto_1860203 ?auto_1860204 ) ) ( not ( = ?auto_1860203 ?auto_1860205 ) ) ( not ( = ?auto_1860203 ?auto_1860206 ) ) ( not ( = ?auto_1860203 ?auto_1860207 ) ) ( not ( = ?auto_1860203 ?auto_1860208 ) ) ( not ( = ?auto_1860203 ?auto_1860209 ) ) ( not ( = ?auto_1860203 ?auto_1860214 ) ) ( not ( = ?auto_1860204 ?auto_1860205 ) ) ( not ( = ?auto_1860204 ?auto_1860206 ) ) ( not ( = ?auto_1860204 ?auto_1860207 ) ) ( not ( = ?auto_1860204 ?auto_1860208 ) ) ( not ( = ?auto_1860204 ?auto_1860209 ) ) ( not ( = ?auto_1860204 ?auto_1860214 ) ) ( not ( = ?auto_1860205 ?auto_1860206 ) ) ( not ( = ?auto_1860205 ?auto_1860207 ) ) ( not ( = ?auto_1860205 ?auto_1860208 ) ) ( not ( = ?auto_1860205 ?auto_1860209 ) ) ( not ( = ?auto_1860205 ?auto_1860214 ) ) ( not ( = ?auto_1860206 ?auto_1860207 ) ) ( not ( = ?auto_1860206 ?auto_1860208 ) ) ( not ( = ?auto_1860206 ?auto_1860209 ) ) ( not ( = ?auto_1860206 ?auto_1860214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860207 ?auto_1860208 ?auto_1860209 )
      ( MAKE-13CRATE-VERIFY ?auto_1860196 ?auto_1860197 ?auto_1860198 ?auto_1860200 ?auto_1860199 ?auto_1860201 ?auto_1860202 ?auto_1860203 ?auto_1860204 ?auto_1860205 ?auto_1860206 ?auto_1860207 ?auto_1860208 ?auto_1860209 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860379 - SURFACE
      ?auto_1860380 - SURFACE
      ?auto_1860381 - SURFACE
      ?auto_1860383 - SURFACE
      ?auto_1860382 - SURFACE
      ?auto_1860384 - SURFACE
      ?auto_1860385 - SURFACE
      ?auto_1860386 - SURFACE
      ?auto_1860387 - SURFACE
      ?auto_1860388 - SURFACE
      ?auto_1860389 - SURFACE
      ?auto_1860390 - SURFACE
      ?auto_1860391 - SURFACE
      ?auto_1860392 - SURFACE
    )
    :vars
    (
      ?auto_1860397 - HOIST
      ?auto_1860393 - PLACE
      ?auto_1860394 - PLACE
      ?auto_1860395 - HOIST
      ?auto_1860396 - SURFACE
      ?auto_1860398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860397 ?auto_1860393 ) ( IS-CRATE ?auto_1860392 ) ( not ( = ?auto_1860391 ?auto_1860392 ) ) ( not ( = ?auto_1860390 ?auto_1860391 ) ) ( not ( = ?auto_1860390 ?auto_1860392 ) ) ( not ( = ?auto_1860394 ?auto_1860393 ) ) ( HOIST-AT ?auto_1860395 ?auto_1860394 ) ( not ( = ?auto_1860397 ?auto_1860395 ) ) ( AVAILABLE ?auto_1860395 ) ( SURFACE-AT ?auto_1860392 ?auto_1860394 ) ( ON ?auto_1860392 ?auto_1860396 ) ( CLEAR ?auto_1860392 ) ( not ( = ?auto_1860391 ?auto_1860396 ) ) ( not ( = ?auto_1860392 ?auto_1860396 ) ) ( not ( = ?auto_1860390 ?auto_1860396 ) ) ( TRUCK-AT ?auto_1860398 ?auto_1860393 ) ( SURFACE-AT ?auto_1860390 ?auto_1860393 ) ( CLEAR ?auto_1860390 ) ( LIFTING ?auto_1860397 ?auto_1860391 ) ( IS-CRATE ?auto_1860391 ) ( ON ?auto_1860380 ?auto_1860379 ) ( ON ?auto_1860381 ?auto_1860380 ) ( ON ?auto_1860383 ?auto_1860381 ) ( ON ?auto_1860382 ?auto_1860383 ) ( ON ?auto_1860384 ?auto_1860382 ) ( ON ?auto_1860385 ?auto_1860384 ) ( ON ?auto_1860386 ?auto_1860385 ) ( ON ?auto_1860387 ?auto_1860386 ) ( ON ?auto_1860388 ?auto_1860387 ) ( ON ?auto_1860389 ?auto_1860388 ) ( ON ?auto_1860390 ?auto_1860389 ) ( not ( = ?auto_1860379 ?auto_1860380 ) ) ( not ( = ?auto_1860379 ?auto_1860381 ) ) ( not ( = ?auto_1860379 ?auto_1860383 ) ) ( not ( = ?auto_1860379 ?auto_1860382 ) ) ( not ( = ?auto_1860379 ?auto_1860384 ) ) ( not ( = ?auto_1860379 ?auto_1860385 ) ) ( not ( = ?auto_1860379 ?auto_1860386 ) ) ( not ( = ?auto_1860379 ?auto_1860387 ) ) ( not ( = ?auto_1860379 ?auto_1860388 ) ) ( not ( = ?auto_1860379 ?auto_1860389 ) ) ( not ( = ?auto_1860379 ?auto_1860390 ) ) ( not ( = ?auto_1860379 ?auto_1860391 ) ) ( not ( = ?auto_1860379 ?auto_1860392 ) ) ( not ( = ?auto_1860379 ?auto_1860396 ) ) ( not ( = ?auto_1860380 ?auto_1860381 ) ) ( not ( = ?auto_1860380 ?auto_1860383 ) ) ( not ( = ?auto_1860380 ?auto_1860382 ) ) ( not ( = ?auto_1860380 ?auto_1860384 ) ) ( not ( = ?auto_1860380 ?auto_1860385 ) ) ( not ( = ?auto_1860380 ?auto_1860386 ) ) ( not ( = ?auto_1860380 ?auto_1860387 ) ) ( not ( = ?auto_1860380 ?auto_1860388 ) ) ( not ( = ?auto_1860380 ?auto_1860389 ) ) ( not ( = ?auto_1860380 ?auto_1860390 ) ) ( not ( = ?auto_1860380 ?auto_1860391 ) ) ( not ( = ?auto_1860380 ?auto_1860392 ) ) ( not ( = ?auto_1860380 ?auto_1860396 ) ) ( not ( = ?auto_1860381 ?auto_1860383 ) ) ( not ( = ?auto_1860381 ?auto_1860382 ) ) ( not ( = ?auto_1860381 ?auto_1860384 ) ) ( not ( = ?auto_1860381 ?auto_1860385 ) ) ( not ( = ?auto_1860381 ?auto_1860386 ) ) ( not ( = ?auto_1860381 ?auto_1860387 ) ) ( not ( = ?auto_1860381 ?auto_1860388 ) ) ( not ( = ?auto_1860381 ?auto_1860389 ) ) ( not ( = ?auto_1860381 ?auto_1860390 ) ) ( not ( = ?auto_1860381 ?auto_1860391 ) ) ( not ( = ?auto_1860381 ?auto_1860392 ) ) ( not ( = ?auto_1860381 ?auto_1860396 ) ) ( not ( = ?auto_1860383 ?auto_1860382 ) ) ( not ( = ?auto_1860383 ?auto_1860384 ) ) ( not ( = ?auto_1860383 ?auto_1860385 ) ) ( not ( = ?auto_1860383 ?auto_1860386 ) ) ( not ( = ?auto_1860383 ?auto_1860387 ) ) ( not ( = ?auto_1860383 ?auto_1860388 ) ) ( not ( = ?auto_1860383 ?auto_1860389 ) ) ( not ( = ?auto_1860383 ?auto_1860390 ) ) ( not ( = ?auto_1860383 ?auto_1860391 ) ) ( not ( = ?auto_1860383 ?auto_1860392 ) ) ( not ( = ?auto_1860383 ?auto_1860396 ) ) ( not ( = ?auto_1860382 ?auto_1860384 ) ) ( not ( = ?auto_1860382 ?auto_1860385 ) ) ( not ( = ?auto_1860382 ?auto_1860386 ) ) ( not ( = ?auto_1860382 ?auto_1860387 ) ) ( not ( = ?auto_1860382 ?auto_1860388 ) ) ( not ( = ?auto_1860382 ?auto_1860389 ) ) ( not ( = ?auto_1860382 ?auto_1860390 ) ) ( not ( = ?auto_1860382 ?auto_1860391 ) ) ( not ( = ?auto_1860382 ?auto_1860392 ) ) ( not ( = ?auto_1860382 ?auto_1860396 ) ) ( not ( = ?auto_1860384 ?auto_1860385 ) ) ( not ( = ?auto_1860384 ?auto_1860386 ) ) ( not ( = ?auto_1860384 ?auto_1860387 ) ) ( not ( = ?auto_1860384 ?auto_1860388 ) ) ( not ( = ?auto_1860384 ?auto_1860389 ) ) ( not ( = ?auto_1860384 ?auto_1860390 ) ) ( not ( = ?auto_1860384 ?auto_1860391 ) ) ( not ( = ?auto_1860384 ?auto_1860392 ) ) ( not ( = ?auto_1860384 ?auto_1860396 ) ) ( not ( = ?auto_1860385 ?auto_1860386 ) ) ( not ( = ?auto_1860385 ?auto_1860387 ) ) ( not ( = ?auto_1860385 ?auto_1860388 ) ) ( not ( = ?auto_1860385 ?auto_1860389 ) ) ( not ( = ?auto_1860385 ?auto_1860390 ) ) ( not ( = ?auto_1860385 ?auto_1860391 ) ) ( not ( = ?auto_1860385 ?auto_1860392 ) ) ( not ( = ?auto_1860385 ?auto_1860396 ) ) ( not ( = ?auto_1860386 ?auto_1860387 ) ) ( not ( = ?auto_1860386 ?auto_1860388 ) ) ( not ( = ?auto_1860386 ?auto_1860389 ) ) ( not ( = ?auto_1860386 ?auto_1860390 ) ) ( not ( = ?auto_1860386 ?auto_1860391 ) ) ( not ( = ?auto_1860386 ?auto_1860392 ) ) ( not ( = ?auto_1860386 ?auto_1860396 ) ) ( not ( = ?auto_1860387 ?auto_1860388 ) ) ( not ( = ?auto_1860387 ?auto_1860389 ) ) ( not ( = ?auto_1860387 ?auto_1860390 ) ) ( not ( = ?auto_1860387 ?auto_1860391 ) ) ( not ( = ?auto_1860387 ?auto_1860392 ) ) ( not ( = ?auto_1860387 ?auto_1860396 ) ) ( not ( = ?auto_1860388 ?auto_1860389 ) ) ( not ( = ?auto_1860388 ?auto_1860390 ) ) ( not ( = ?auto_1860388 ?auto_1860391 ) ) ( not ( = ?auto_1860388 ?auto_1860392 ) ) ( not ( = ?auto_1860388 ?auto_1860396 ) ) ( not ( = ?auto_1860389 ?auto_1860390 ) ) ( not ( = ?auto_1860389 ?auto_1860391 ) ) ( not ( = ?auto_1860389 ?auto_1860392 ) ) ( not ( = ?auto_1860389 ?auto_1860396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860390 ?auto_1860391 ?auto_1860392 )
      ( MAKE-13CRATE-VERIFY ?auto_1860379 ?auto_1860380 ?auto_1860381 ?auto_1860383 ?auto_1860382 ?auto_1860384 ?auto_1860385 ?auto_1860386 ?auto_1860387 ?auto_1860388 ?auto_1860389 ?auto_1860390 ?auto_1860391 ?auto_1860392 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1860562 - SURFACE
      ?auto_1860563 - SURFACE
      ?auto_1860564 - SURFACE
      ?auto_1860566 - SURFACE
      ?auto_1860565 - SURFACE
      ?auto_1860567 - SURFACE
      ?auto_1860568 - SURFACE
      ?auto_1860569 - SURFACE
      ?auto_1860570 - SURFACE
      ?auto_1860571 - SURFACE
      ?auto_1860572 - SURFACE
      ?auto_1860573 - SURFACE
      ?auto_1860574 - SURFACE
      ?auto_1860575 - SURFACE
    )
    :vars
    (
      ?auto_1860580 - HOIST
      ?auto_1860576 - PLACE
      ?auto_1860578 - PLACE
      ?auto_1860577 - HOIST
      ?auto_1860579 - SURFACE
      ?auto_1860581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1860580 ?auto_1860576 ) ( IS-CRATE ?auto_1860575 ) ( not ( = ?auto_1860574 ?auto_1860575 ) ) ( not ( = ?auto_1860573 ?auto_1860574 ) ) ( not ( = ?auto_1860573 ?auto_1860575 ) ) ( not ( = ?auto_1860578 ?auto_1860576 ) ) ( HOIST-AT ?auto_1860577 ?auto_1860578 ) ( not ( = ?auto_1860580 ?auto_1860577 ) ) ( AVAILABLE ?auto_1860577 ) ( SURFACE-AT ?auto_1860575 ?auto_1860578 ) ( ON ?auto_1860575 ?auto_1860579 ) ( CLEAR ?auto_1860575 ) ( not ( = ?auto_1860574 ?auto_1860579 ) ) ( not ( = ?auto_1860575 ?auto_1860579 ) ) ( not ( = ?auto_1860573 ?auto_1860579 ) ) ( TRUCK-AT ?auto_1860581 ?auto_1860576 ) ( SURFACE-AT ?auto_1860573 ?auto_1860576 ) ( CLEAR ?auto_1860573 ) ( IS-CRATE ?auto_1860574 ) ( AVAILABLE ?auto_1860580 ) ( IN ?auto_1860574 ?auto_1860581 ) ( ON ?auto_1860563 ?auto_1860562 ) ( ON ?auto_1860564 ?auto_1860563 ) ( ON ?auto_1860566 ?auto_1860564 ) ( ON ?auto_1860565 ?auto_1860566 ) ( ON ?auto_1860567 ?auto_1860565 ) ( ON ?auto_1860568 ?auto_1860567 ) ( ON ?auto_1860569 ?auto_1860568 ) ( ON ?auto_1860570 ?auto_1860569 ) ( ON ?auto_1860571 ?auto_1860570 ) ( ON ?auto_1860572 ?auto_1860571 ) ( ON ?auto_1860573 ?auto_1860572 ) ( not ( = ?auto_1860562 ?auto_1860563 ) ) ( not ( = ?auto_1860562 ?auto_1860564 ) ) ( not ( = ?auto_1860562 ?auto_1860566 ) ) ( not ( = ?auto_1860562 ?auto_1860565 ) ) ( not ( = ?auto_1860562 ?auto_1860567 ) ) ( not ( = ?auto_1860562 ?auto_1860568 ) ) ( not ( = ?auto_1860562 ?auto_1860569 ) ) ( not ( = ?auto_1860562 ?auto_1860570 ) ) ( not ( = ?auto_1860562 ?auto_1860571 ) ) ( not ( = ?auto_1860562 ?auto_1860572 ) ) ( not ( = ?auto_1860562 ?auto_1860573 ) ) ( not ( = ?auto_1860562 ?auto_1860574 ) ) ( not ( = ?auto_1860562 ?auto_1860575 ) ) ( not ( = ?auto_1860562 ?auto_1860579 ) ) ( not ( = ?auto_1860563 ?auto_1860564 ) ) ( not ( = ?auto_1860563 ?auto_1860566 ) ) ( not ( = ?auto_1860563 ?auto_1860565 ) ) ( not ( = ?auto_1860563 ?auto_1860567 ) ) ( not ( = ?auto_1860563 ?auto_1860568 ) ) ( not ( = ?auto_1860563 ?auto_1860569 ) ) ( not ( = ?auto_1860563 ?auto_1860570 ) ) ( not ( = ?auto_1860563 ?auto_1860571 ) ) ( not ( = ?auto_1860563 ?auto_1860572 ) ) ( not ( = ?auto_1860563 ?auto_1860573 ) ) ( not ( = ?auto_1860563 ?auto_1860574 ) ) ( not ( = ?auto_1860563 ?auto_1860575 ) ) ( not ( = ?auto_1860563 ?auto_1860579 ) ) ( not ( = ?auto_1860564 ?auto_1860566 ) ) ( not ( = ?auto_1860564 ?auto_1860565 ) ) ( not ( = ?auto_1860564 ?auto_1860567 ) ) ( not ( = ?auto_1860564 ?auto_1860568 ) ) ( not ( = ?auto_1860564 ?auto_1860569 ) ) ( not ( = ?auto_1860564 ?auto_1860570 ) ) ( not ( = ?auto_1860564 ?auto_1860571 ) ) ( not ( = ?auto_1860564 ?auto_1860572 ) ) ( not ( = ?auto_1860564 ?auto_1860573 ) ) ( not ( = ?auto_1860564 ?auto_1860574 ) ) ( not ( = ?auto_1860564 ?auto_1860575 ) ) ( not ( = ?auto_1860564 ?auto_1860579 ) ) ( not ( = ?auto_1860566 ?auto_1860565 ) ) ( not ( = ?auto_1860566 ?auto_1860567 ) ) ( not ( = ?auto_1860566 ?auto_1860568 ) ) ( not ( = ?auto_1860566 ?auto_1860569 ) ) ( not ( = ?auto_1860566 ?auto_1860570 ) ) ( not ( = ?auto_1860566 ?auto_1860571 ) ) ( not ( = ?auto_1860566 ?auto_1860572 ) ) ( not ( = ?auto_1860566 ?auto_1860573 ) ) ( not ( = ?auto_1860566 ?auto_1860574 ) ) ( not ( = ?auto_1860566 ?auto_1860575 ) ) ( not ( = ?auto_1860566 ?auto_1860579 ) ) ( not ( = ?auto_1860565 ?auto_1860567 ) ) ( not ( = ?auto_1860565 ?auto_1860568 ) ) ( not ( = ?auto_1860565 ?auto_1860569 ) ) ( not ( = ?auto_1860565 ?auto_1860570 ) ) ( not ( = ?auto_1860565 ?auto_1860571 ) ) ( not ( = ?auto_1860565 ?auto_1860572 ) ) ( not ( = ?auto_1860565 ?auto_1860573 ) ) ( not ( = ?auto_1860565 ?auto_1860574 ) ) ( not ( = ?auto_1860565 ?auto_1860575 ) ) ( not ( = ?auto_1860565 ?auto_1860579 ) ) ( not ( = ?auto_1860567 ?auto_1860568 ) ) ( not ( = ?auto_1860567 ?auto_1860569 ) ) ( not ( = ?auto_1860567 ?auto_1860570 ) ) ( not ( = ?auto_1860567 ?auto_1860571 ) ) ( not ( = ?auto_1860567 ?auto_1860572 ) ) ( not ( = ?auto_1860567 ?auto_1860573 ) ) ( not ( = ?auto_1860567 ?auto_1860574 ) ) ( not ( = ?auto_1860567 ?auto_1860575 ) ) ( not ( = ?auto_1860567 ?auto_1860579 ) ) ( not ( = ?auto_1860568 ?auto_1860569 ) ) ( not ( = ?auto_1860568 ?auto_1860570 ) ) ( not ( = ?auto_1860568 ?auto_1860571 ) ) ( not ( = ?auto_1860568 ?auto_1860572 ) ) ( not ( = ?auto_1860568 ?auto_1860573 ) ) ( not ( = ?auto_1860568 ?auto_1860574 ) ) ( not ( = ?auto_1860568 ?auto_1860575 ) ) ( not ( = ?auto_1860568 ?auto_1860579 ) ) ( not ( = ?auto_1860569 ?auto_1860570 ) ) ( not ( = ?auto_1860569 ?auto_1860571 ) ) ( not ( = ?auto_1860569 ?auto_1860572 ) ) ( not ( = ?auto_1860569 ?auto_1860573 ) ) ( not ( = ?auto_1860569 ?auto_1860574 ) ) ( not ( = ?auto_1860569 ?auto_1860575 ) ) ( not ( = ?auto_1860569 ?auto_1860579 ) ) ( not ( = ?auto_1860570 ?auto_1860571 ) ) ( not ( = ?auto_1860570 ?auto_1860572 ) ) ( not ( = ?auto_1860570 ?auto_1860573 ) ) ( not ( = ?auto_1860570 ?auto_1860574 ) ) ( not ( = ?auto_1860570 ?auto_1860575 ) ) ( not ( = ?auto_1860570 ?auto_1860579 ) ) ( not ( = ?auto_1860571 ?auto_1860572 ) ) ( not ( = ?auto_1860571 ?auto_1860573 ) ) ( not ( = ?auto_1860571 ?auto_1860574 ) ) ( not ( = ?auto_1860571 ?auto_1860575 ) ) ( not ( = ?auto_1860571 ?auto_1860579 ) ) ( not ( = ?auto_1860572 ?auto_1860573 ) ) ( not ( = ?auto_1860572 ?auto_1860574 ) ) ( not ( = ?auto_1860572 ?auto_1860575 ) ) ( not ( = ?auto_1860572 ?auto_1860579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1860573 ?auto_1860574 ?auto_1860575 )
      ( MAKE-13CRATE-VERIFY ?auto_1860562 ?auto_1860563 ?auto_1860564 ?auto_1860566 ?auto_1860565 ?auto_1860567 ?auto_1860568 ?auto_1860569 ?auto_1860570 ?auto_1860571 ?auto_1860572 ?auto_1860573 ?auto_1860574 ?auto_1860575 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1874781 - SURFACE
      ?auto_1874782 - SURFACE
      ?auto_1874783 - SURFACE
      ?auto_1874785 - SURFACE
      ?auto_1874784 - SURFACE
      ?auto_1874786 - SURFACE
      ?auto_1874787 - SURFACE
      ?auto_1874788 - SURFACE
      ?auto_1874789 - SURFACE
      ?auto_1874790 - SURFACE
      ?auto_1874791 - SURFACE
      ?auto_1874792 - SURFACE
      ?auto_1874793 - SURFACE
      ?auto_1874794 - SURFACE
      ?auto_1874795 - SURFACE
    )
    :vars
    (
      ?auto_1874797 - HOIST
      ?auto_1874796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1874797 ?auto_1874796 ) ( SURFACE-AT ?auto_1874794 ?auto_1874796 ) ( CLEAR ?auto_1874794 ) ( LIFTING ?auto_1874797 ?auto_1874795 ) ( IS-CRATE ?auto_1874795 ) ( not ( = ?auto_1874794 ?auto_1874795 ) ) ( ON ?auto_1874782 ?auto_1874781 ) ( ON ?auto_1874783 ?auto_1874782 ) ( ON ?auto_1874785 ?auto_1874783 ) ( ON ?auto_1874784 ?auto_1874785 ) ( ON ?auto_1874786 ?auto_1874784 ) ( ON ?auto_1874787 ?auto_1874786 ) ( ON ?auto_1874788 ?auto_1874787 ) ( ON ?auto_1874789 ?auto_1874788 ) ( ON ?auto_1874790 ?auto_1874789 ) ( ON ?auto_1874791 ?auto_1874790 ) ( ON ?auto_1874792 ?auto_1874791 ) ( ON ?auto_1874793 ?auto_1874792 ) ( ON ?auto_1874794 ?auto_1874793 ) ( not ( = ?auto_1874781 ?auto_1874782 ) ) ( not ( = ?auto_1874781 ?auto_1874783 ) ) ( not ( = ?auto_1874781 ?auto_1874785 ) ) ( not ( = ?auto_1874781 ?auto_1874784 ) ) ( not ( = ?auto_1874781 ?auto_1874786 ) ) ( not ( = ?auto_1874781 ?auto_1874787 ) ) ( not ( = ?auto_1874781 ?auto_1874788 ) ) ( not ( = ?auto_1874781 ?auto_1874789 ) ) ( not ( = ?auto_1874781 ?auto_1874790 ) ) ( not ( = ?auto_1874781 ?auto_1874791 ) ) ( not ( = ?auto_1874781 ?auto_1874792 ) ) ( not ( = ?auto_1874781 ?auto_1874793 ) ) ( not ( = ?auto_1874781 ?auto_1874794 ) ) ( not ( = ?auto_1874781 ?auto_1874795 ) ) ( not ( = ?auto_1874782 ?auto_1874783 ) ) ( not ( = ?auto_1874782 ?auto_1874785 ) ) ( not ( = ?auto_1874782 ?auto_1874784 ) ) ( not ( = ?auto_1874782 ?auto_1874786 ) ) ( not ( = ?auto_1874782 ?auto_1874787 ) ) ( not ( = ?auto_1874782 ?auto_1874788 ) ) ( not ( = ?auto_1874782 ?auto_1874789 ) ) ( not ( = ?auto_1874782 ?auto_1874790 ) ) ( not ( = ?auto_1874782 ?auto_1874791 ) ) ( not ( = ?auto_1874782 ?auto_1874792 ) ) ( not ( = ?auto_1874782 ?auto_1874793 ) ) ( not ( = ?auto_1874782 ?auto_1874794 ) ) ( not ( = ?auto_1874782 ?auto_1874795 ) ) ( not ( = ?auto_1874783 ?auto_1874785 ) ) ( not ( = ?auto_1874783 ?auto_1874784 ) ) ( not ( = ?auto_1874783 ?auto_1874786 ) ) ( not ( = ?auto_1874783 ?auto_1874787 ) ) ( not ( = ?auto_1874783 ?auto_1874788 ) ) ( not ( = ?auto_1874783 ?auto_1874789 ) ) ( not ( = ?auto_1874783 ?auto_1874790 ) ) ( not ( = ?auto_1874783 ?auto_1874791 ) ) ( not ( = ?auto_1874783 ?auto_1874792 ) ) ( not ( = ?auto_1874783 ?auto_1874793 ) ) ( not ( = ?auto_1874783 ?auto_1874794 ) ) ( not ( = ?auto_1874783 ?auto_1874795 ) ) ( not ( = ?auto_1874785 ?auto_1874784 ) ) ( not ( = ?auto_1874785 ?auto_1874786 ) ) ( not ( = ?auto_1874785 ?auto_1874787 ) ) ( not ( = ?auto_1874785 ?auto_1874788 ) ) ( not ( = ?auto_1874785 ?auto_1874789 ) ) ( not ( = ?auto_1874785 ?auto_1874790 ) ) ( not ( = ?auto_1874785 ?auto_1874791 ) ) ( not ( = ?auto_1874785 ?auto_1874792 ) ) ( not ( = ?auto_1874785 ?auto_1874793 ) ) ( not ( = ?auto_1874785 ?auto_1874794 ) ) ( not ( = ?auto_1874785 ?auto_1874795 ) ) ( not ( = ?auto_1874784 ?auto_1874786 ) ) ( not ( = ?auto_1874784 ?auto_1874787 ) ) ( not ( = ?auto_1874784 ?auto_1874788 ) ) ( not ( = ?auto_1874784 ?auto_1874789 ) ) ( not ( = ?auto_1874784 ?auto_1874790 ) ) ( not ( = ?auto_1874784 ?auto_1874791 ) ) ( not ( = ?auto_1874784 ?auto_1874792 ) ) ( not ( = ?auto_1874784 ?auto_1874793 ) ) ( not ( = ?auto_1874784 ?auto_1874794 ) ) ( not ( = ?auto_1874784 ?auto_1874795 ) ) ( not ( = ?auto_1874786 ?auto_1874787 ) ) ( not ( = ?auto_1874786 ?auto_1874788 ) ) ( not ( = ?auto_1874786 ?auto_1874789 ) ) ( not ( = ?auto_1874786 ?auto_1874790 ) ) ( not ( = ?auto_1874786 ?auto_1874791 ) ) ( not ( = ?auto_1874786 ?auto_1874792 ) ) ( not ( = ?auto_1874786 ?auto_1874793 ) ) ( not ( = ?auto_1874786 ?auto_1874794 ) ) ( not ( = ?auto_1874786 ?auto_1874795 ) ) ( not ( = ?auto_1874787 ?auto_1874788 ) ) ( not ( = ?auto_1874787 ?auto_1874789 ) ) ( not ( = ?auto_1874787 ?auto_1874790 ) ) ( not ( = ?auto_1874787 ?auto_1874791 ) ) ( not ( = ?auto_1874787 ?auto_1874792 ) ) ( not ( = ?auto_1874787 ?auto_1874793 ) ) ( not ( = ?auto_1874787 ?auto_1874794 ) ) ( not ( = ?auto_1874787 ?auto_1874795 ) ) ( not ( = ?auto_1874788 ?auto_1874789 ) ) ( not ( = ?auto_1874788 ?auto_1874790 ) ) ( not ( = ?auto_1874788 ?auto_1874791 ) ) ( not ( = ?auto_1874788 ?auto_1874792 ) ) ( not ( = ?auto_1874788 ?auto_1874793 ) ) ( not ( = ?auto_1874788 ?auto_1874794 ) ) ( not ( = ?auto_1874788 ?auto_1874795 ) ) ( not ( = ?auto_1874789 ?auto_1874790 ) ) ( not ( = ?auto_1874789 ?auto_1874791 ) ) ( not ( = ?auto_1874789 ?auto_1874792 ) ) ( not ( = ?auto_1874789 ?auto_1874793 ) ) ( not ( = ?auto_1874789 ?auto_1874794 ) ) ( not ( = ?auto_1874789 ?auto_1874795 ) ) ( not ( = ?auto_1874790 ?auto_1874791 ) ) ( not ( = ?auto_1874790 ?auto_1874792 ) ) ( not ( = ?auto_1874790 ?auto_1874793 ) ) ( not ( = ?auto_1874790 ?auto_1874794 ) ) ( not ( = ?auto_1874790 ?auto_1874795 ) ) ( not ( = ?auto_1874791 ?auto_1874792 ) ) ( not ( = ?auto_1874791 ?auto_1874793 ) ) ( not ( = ?auto_1874791 ?auto_1874794 ) ) ( not ( = ?auto_1874791 ?auto_1874795 ) ) ( not ( = ?auto_1874792 ?auto_1874793 ) ) ( not ( = ?auto_1874792 ?auto_1874794 ) ) ( not ( = ?auto_1874792 ?auto_1874795 ) ) ( not ( = ?auto_1874793 ?auto_1874794 ) ) ( not ( = ?auto_1874793 ?auto_1874795 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1874794 ?auto_1874795 )
      ( MAKE-14CRATE-VERIFY ?auto_1874781 ?auto_1874782 ?auto_1874783 ?auto_1874785 ?auto_1874784 ?auto_1874786 ?auto_1874787 ?auto_1874788 ?auto_1874789 ?auto_1874790 ?auto_1874791 ?auto_1874792 ?auto_1874793 ?auto_1874794 ?auto_1874795 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1874941 - SURFACE
      ?auto_1874942 - SURFACE
      ?auto_1874943 - SURFACE
      ?auto_1874945 - SURFACE
      ?auto_1874944 - SURFACE
      ?auto_1874946 - SURFACE
      ?auto_1874947 - SURFACE
      ?auto_1874948 - SURFACE
      ?auto_1874949 - SURFACE
      ?auto_1874950 - SURFACE
      ?auto_1874951 - SURFACE
      ?auto_1874952 - SURFACE
      ?auto_1874953 - SURFACE
      ?auto_1874954 - SURFACE
      ?auto_1874955 - SURFACE
    )
    :vars
    (
      ?auto_1874957 - HOIST
      ?auto_1874956 - PLACE
      ?auto_1874958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1874957 ?auto_1874956 ) ( SURFACE-AT ?auto_1874954 ?auto_1874956 ) ( CLEAR ?auto_1874954 ) ( IS-CRATE ?auto_1874955 ) ( not ( = ?auto_1874954 ?auto_1874955 ) ) ( TRUCK-AT ?auto_1874958 ?auto_1874956 ) ( AVAILABLE ?auto_1874957 ) ( IN ?auto_1874955 ?auto_1874958 ) ( ON ?auto_1874954 ?auto_1874953 ) ( not ( = ?auto_1874953 ?auto_1874954 ) ) ( not ( = ?auto_1874953 ?auto_1874955 ) ) ( ON ?auto_1874942 ?auto_1874941 ) ( ON ?auto_1874943 ?auto_1874942 ) ( ON ?auto_1874945 ?auto_1874943 ) ( ON ?auto_1874944 ?auto_1874945 ) ( ON ?auto_1874946 ?auto_1874944 ) ( ON ?auto_1874947 ?auto_1874946 ) ( ON ?auto_1874948 ?auto_1874947 ) ( ON ?auto_1874949 ?auto_1874948 ) ( ON ?auto_1874950 ?auto_1874949 ) ( ON ?auto_1874951 ?auto_1874950 ) ( ON ?auto_1874952 ?auto_1874951 ) ( ON ?auto_1874953 ?auto_1874952 ) ( not ( = ?auto_1874941 ?auto_1874942 ) ) ( not ( = ?auto_1874941 ?auto_1874943 ) ) ( not ( = ?auto_1874941 ?auto_1874945 ) ) ( not ( = ?auto_1874941 ?auto_1874944 ) ) ( not ( = ?auto_1874941 ?auto_1874946 ) ) ( not ( = ?auto_1874941 ?auto_1874947 ) ) ( not ( = ?auto_1874941 ?auto_1874948 ) ) ( not ( = ?auto_1874941 ?auto_1874949 ) ) ( not ( = ?auto_1874941 ?auto_1874950 ) ) ( not ( = ?auto_1874941 ?auto_1874951 ) ) ( not ( = ?auto_1874941 ?auto_1874952 ) ) ( not ( = ?auto_1874941 ?auto_1874953 ) ) ( not ( = ?auto_1874941 ?auto_1874954 ) ) ( not ( = ?auto_1874941 ?auto_1874955 ) ) ( not ( = ?auto_1874942 ?auto_1874943 ) ) ( not ( = ?auto_1874942 ?auto_1874945 ) ) ( not ( = ?auto_1874942 ?auto_1874944 ) ) ( not ( = ?auto_1874942 ?auto_1874946 ) ) ( not ( = ?auto_1874942 ?auto_1874947 ) ) ( not ( = ?auto_1874942 ?auto_1874948 ) ) ( not ( = ?auto_1874942 ?auto_1874949 ) ) ( not ( = ?auto_1874942 ?auto_1874950 ) ) ( not ( = ?auto_1874942 ?auto_1874951 ) ) ( not ( = ?auto_1874942 ?auto_1874952 ) ) ( not ( = ?auto_1874942 ?auto_1874953 ) ) ( not ( = ?auto_1874942 ?auto_1874954 ) ) ( not ( = ?auto_1874942 ?auto_1874955 ) ) ( not ( = ?auto_1874943 ?auto_1874945 ) ) ( not ( = ?auto_1874943 ?auto_1874944 ) ) ( not ( = ?auto_1874943 ?auto_1874946 ) ) ( not ( = ?auto_1874943 ?auto_1874947 ) ) ( not ( = ?auto_1874943 ?auto_1874948 ) ) ( not ( = ?auto_1874943 ?auto_1874949 ) ) ( not ( = ?auto_1874943 ?auto_1874950 ) ) ( not ( = ?auto_1874943 ?auto_1874951 ) ) ( not ( = ?auto_1874943 ?auto_1874952 ) ) ( not ( = ?auto_1874943 ?auto_1874953 ) ) ( not ( = ?auto_1874943 ?auto_1874954 ) ) ( not ( = ?auto_1874943 ?auto_1874955 ) ) ( not ( = ?auto_1874945 ?auto_1874944 ) ) ( not ( = ?auto_1874945 ?auto_1874946 ) ) ( not ( = ?auto_1874945 ?auto_1874947 ) ) ( not ( = ?auto_1874945 ?auto_1874948 ) ) ( not ( = ?auto_1874945 ?auto_1874949 ) ) ( not ( = ?auto_1874945 ?auto_1874950 ) ) ( not ( = ?auto_1874945 ?auto_1874951 ) ) ( not ( = ?auto_1874945 ?auto_1874952 ) ) ( not ( = ?auto_1874945 ?auto_1874953 ) ) ( not ( = ?auto_1874945 ?auto_1874954 ) ) ( not ( = ?auto_1874945 ?auto_1874955 ) ) ( not ( = ?auto_1874944 ?auto_1874946 ) ) ( not ( = ?auto_1874944 ?auto_1874947 ) ) ( not ( = ?auto_1874944 ?auto_1874948 ) ) ( not ( = ?auto_1874944 ?auto_1874949 ) ) ( not ( = ?auto_1874944 ?auto_1874950 ) ) ( not ( = ?auto_1874944 ?auto_1874951 ) ) ( not ( = ?auto_1874944 ?auto_1874952 ) ) ( not ( = ?auto_1874944 ?auto_1874953 ) ) ( not ( = ?auto_1874944 ?auto_1874954 ) ) ( not ( = ?auto_1874944 ?auto_1874955 ) ) ( not ( = ?auto_1874946 ?auto_1874947 ) ) ( not ( = ?auto_1874946 ?auto_1874948 ) ) ( not ( = ?auto_1874946 ?auto_1874949 ) ) ( not ( = ?auto_1874946 ?auto_1874950 ) ) ( not ( = ?auto_1874946 ?auto_1874951 ) ) ( not ( = ?auto_1874946 ?auto_1874952 ) ) ( not ( = ?auto_1874946 ?auto_1874953 ) ) ( not ( = ?auto_1874946 ?auto_1874954 ) ) ( not ( = ?auto_1874946 ?auto_1874955 ) ) ( not ( = ?auto_1874947 ?auto_1874948 ) ) ( not ( = ?auto_1874947 ?auto_1874949 ) ) ( not ( = ?auto_1874947 ?auto_1874950 ) ) ( not ( = ?auto_1874947 ?auto_1874951 ) ) ( not ( = ?auto_1874947 ?auto_1874952 ) ) ( not ( = ?auto_1874947 ?auto_1874953 ) ) ( not ( = ?auto_1874947 ?auto_1874954 ) ) ( not ( = ?auto_1874947 ?auto_1874955 ) ) ( not ( = ?auto_1874948 ?auto_1874949 ) ) ( not ( = ?auto_1874948 ?auto_1874950 ) ) ( not ( = ?auto_1874948 ?auto_1874951 ) ) ( not ( = ?auto_1874948 ?auto_1874952 ) ) ( not ( = ?auto_1874948 ?auto_1874953 ) ) ( not ( = ?auto_1874948 ?auto_1874954 ) ) ( not ( = ?auto_1874948 ?auto_1874955 ) ) ( not ( = ?auto_1874949 ?auto_1874950 ) ) ( not ( = ?auto_1874949 ?auto_1874951 ) ) ( not ( = ?auto_1874949 ?auto_1874952 ) ) ( not ( = ?auto_1874949 ?auto_1874953 ) ) ( not ( = ?auto_1874949 ?auto_1874954 ) ) ( not ( = ?auto_1874949 ?auto_1874955 ) ) ( not ( = ?auto_1874950 ?auto_1874951 ) ) ( not ( = ?auto_1874950 ?auto_1874952 ) ) ( not ( = ?auto_1874950 ?auto_1874953 ) ) ( not ( = ?auto_1874950 ?auto_1874954 ) ) ( not ( = ?auto_1874950 ?auto_1874955 ) ) ( not ( = ?auto_1874951 ?auto_1874952 ) ) ( not ( = ?auto_1874951 ?auto_1874953 ) ) ( not ( = ?auto_1874951 ?auto_1874954 ) ) ( not ( = ?auto_1874951 ?auto_1874955 ) ) ( not ( = ?auto_1874952 ?auto_1874953 ) ) ( not ( = ?auto_1874952 ?auto_1874954 ) ) ( not ( = ?auto_1874952 ?auto_1874955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1874953 ?auto_1874954 ?auto_1874955 )
      ( MAKE-14CRATE-VERIFY ?auto_1874941 ?auto_1874942 ?auto_1874943 ?auto_1874945 ?auto_1874944 ?auto_1874946 ?auto_1874947 ?auto_1874948 ?auto_1874949 ?auto_1874950 ?auto_1874951 ?auto_1874952 ?auto_1874953 ?auto_1874954 ?auto_1874955 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875116 - SURFACE
      ?auto_1875117 - SURFACE
      ?auto_1875118 - SURFACE
      ?auto_1875120 - SURFACE
      ?auto_1875119 - SURFACE
      ?auto_1875121 - SURFACE
      ?auto_1875122 - SURFACE
      ?auto_1875123 - SURFACE
      ?auto_1875124 - SURFACE
      ?auto_1875125 - SURFACE
      ?auto_1875126 - SURFACE
      ?auto_1875127 - SURFACE
      ?auto_1875128 - SURFACE
      ?auto_1875129 - SURFACE
      ?auto_1875130 - SURFACE
    )
    :vars
    (
      ?auto_1875131 - HOIST
      ?auto_1875132 - PLACE
      ?auto_1875133 - TRUCK
      ?auto_1875134 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875131 ?auto_1875132 ) ( SURFACE-AT ?auto_1875129 ?auto_1875132 ) ( CLEAR ?auto_1875129 ) ( IS-CRATE ?auto_1875130 ) ( not ( = ?auto_1875129 ?auto_1875130 ) ) ( AVAILABLE ?auto_1875131 ) ( IN ?auto_1875130 ?auto_1875133 ) ( ON ?auto_1875129 ?auto_1875128 ) ( not ( = ?auto_1875128 ?auto_1875129 ) ) ( not ( = ?auto_1875128 ?auto_1875130 ) ) ( TRUCK-AT ?auto_1875133 ?auto_1875134 ) ( not ( = ?auto_1875134 ?auto_1875132 ) ) ( ON ?auto_1875117 ?auto_1875116 ) ( ON ?auto_1875118 ?auto_1875117 ) ( ON ?auto_1875120 ?auto_1875118 ) ( ON ?auto_1875119 ?auto_1875120 ) ( ON ?auto_1875121 ?auto_1875119 ) ( ON ?auto_1875122 ?auto_1875121 ) ( ON ?auto_1875123 ?auto_1875122 ) ( ON ?auto_1875124 ?auto_1875123 ) ( ON ?auto_1875125 ?auto_1875124 ) ( ON ?auto_1875126 ?auto_1875125 ) ( ON ?auto_1875127 ?auto_1875126 ) ( ON ?auto_1875128 ?auto_1875127 ) ( not ( = ?auto_1875116 ?auto_1875117 ) ) ( not ( = ?auto_1875116 ?auto_1875118 ) ) ( not ( = ?auto_1875116 ?auto_1875120 ) ) ( not ( = ?auto_1875116 ?auto_1875119 ) ) ( not ( = ?auto_1875116 ?auto_1875121 ) ) ( not ( = ?auto_1875116 ?auto_1875122 ) ) ( not ( = ?auto_1875116 ?auto_1875123 ) ) ( not ( = ?auto_1875116 ?auto_1875124 ) ) ( not ( = ?auto_1875116 ?auto_1875125 ) ) ( not ( = ?auto_1875116 ?auto_1875126 ) ) ( not ( = ?auto_1875116 ?auto_1875127 ) ) ( not ( = ?auto_1875116 ?auto_1875128 ) ) ( not ( = ?auto_1875116 ?auto_1875129 ) ) ( not ( = ?auto_1875116 ?auto_1875130 ) ) ( not ( = ?auto_1875117 ?auto_1875118 ) ) ( not ( = ?auto_1875117 ?auto_1875120 ) ) ( not ( = ?auto_1875117 ?auto_1875119 ) ) ( not ( = ?auto_1875117 ?auto_1875121 ) ) ( not ( = ?auto_1875117 ?auto_1875122 ) ) ( not ( = ?auto_1875117 ?auto_1875123 ) ) ( not ( = ?auto_1875117 ?auto_1875124 ) ) ( not ( = ?auto_1875117 ?auto_1875125 ) ) ( not ( = ?auto_1875117 ?auto_1875126 ) ) ( not ( = ?auto_1875117 ?auto_1875127 ) ) ( not ( = ?auto_1875117 ?auto_1875128 ) ) ( not ( = ?auto_1875117 ?auto_1875129 ) ) ( not ( = ?auto_1875117 ?auto_1875130 ) ) ( not ( = ?auto_1875118 ?auto_1875120 ) ) ( not ( = ?auto_1875118 ?auto_1875119 ) ) ( not ( = ?auto_1875118 ?auto_1875121 ) ) ( not ( = ?auto_1875118 ?auto_1875122 ) ) ( not ( = ?auto_1875118 ?auto_1875123 ) ) ( not ( = ?auto_1875118 ?auto_1875124 ) ) ( not ( = ?auto_1875118 ?auto_1875125 ) ) ( not ( = ?auto_1875118 ?auto_1875126 ) ) ( not ( = ?auto_1875118 ?auto_1875127 ) ) ( not ( = ?auto_1875118 ?auto_1875128 ) ) ( not ( = ?auto_1875118 ?auto_1875129 ) ) ( not ( = ?auto_1875118 ?auto_1875130 ) ) ( not ( = ?auto_1875120 ?auto_1875119 ) ) ( not ( = ?auto_1875120 ?auto_1875121 ) ) ( not ( = ?auto_1875120 ?auto_1875122 ) ) ( not ( = ?auto_1875120 ?auto_1875123 ) ) ( not ( = ?auto_1875120 ?auto_1875124 ) ) ( not ( = ?auto_1875120 ?auto_1875125 ) ) ( not ( = ?auto_1875120 ?auto_1875126 ) ) ( not ( = ?auto_1875120 ?auto_1875127 ) ) ( not ( = ?auto_1875120 ?auto_1875128 ) ) ( not ( = ?auto_1875120 ?auto_1875129 ) ) ( not ( = ?auto_1875120 ?auto_1875130 ) ) ( not ( = ?auto_1875119 ?auto_1875121 ) ) ( not ( = ?auto_1875119 ?auto_1875122 ) ) ( not ( = ?auto_1875119 ?auto_1875123 ) ) ( not ( = ?auto_1875119 ?auto_1875124 ) ) ( not ( = ?auto_1875119 ?auto_1875125 ) ) ( not ( = ?auto_1875119 ?auto_1875126 ) ) ( not ( = ?auto_1875119 ?auto_1875127 ) ) ( not ( = ?auto_1875119 ?auto_1875128 ) ) ( not ( = ?auto_1875119 ?auto_1875129 ) ) ( not ( = ?auto_1875119 ?auto_1875130 ) ) ( not ( = ?auto_1875121 ?auto_1875122 ) ) ( not ( = ?auto_1875121 ?auto_1875123 ) ) ( not ( = ?auto_1875121 ?auto_1875124 ) ) ( not ( = ?auto_1875121 ?auto_1875125 ) ) ( not ( = ?auto_1875121 ?auto_1875126 ) ) ( not ( = ?auto_1875121 ?auto_1875127 ) ) ( not ( = ?auto_1875121 ?auto_1875128 ) ) ( not ( = ?auto_1875121 ?auto_1875129 ) ) ( not ( = ?auto_1875121 ?auto_1875130 ) ) ( not ( = ?auto_1875122 ?auto_1875123 ) ) ( not ( = ?auto_1875122 ?auto_1875124 ) ) ( not ( = ?auto_1875122 ?auto_1875125 ) ) ( not ( = ?auto_1875122 ?auto_1875126 ) ) ( not ( = ?auto_1875122 ?auto_1875127 ) ) ( not ( = ?auto_1875122 ?auto_1875128 ) ) ( not ( = ?auto_1875122 ?auto_1875129 ) ) ( not ( = ?auto_1875122 ?auto_1875130 ) ) ( not ( = ?auto_1875123 ?auto_1875124 ) ) ( not ( = ?auto_1875123 ?auto_1875125 ) ) ( not ( = ?auto_1875123 ?auto_1875126 ) ) ( not ( = ?auto_1875123 ?auto_1875127 ) ) ( not ( = ?auto_1875123 ?auto_1875128 ) ) ( not ( = ?auto_1875123 ?auto_1875129 ) ) ( not ( = ?auto_1875123 ?auto_1875130 ) ) ( not ( = ?auto_1875124 ?auto_1875125 ) ) ( not ( = ?auto_1875124 ?auto_1875126 ) ) ( not ( = ?auto_1875124 ?auto_1875127 ) ) ( not ( = ?auto_1875124 ?auto_1875128 ) ) ( not ( = ?auto_1875124 ?auto_1875129 ) ) ( not ( = ?auto_1875124 ?auto_1875130 ) ) ( not ( = ?auto_1875125 ?auto_1875126 ) ) ( not ( = ?auto_1875125 ?auto_1875127 ) ) ( not ( = ?auto_1875125 ?auto_1875128 ) ) ( not ( = ?auto_1875125 ?auto_1875129 ) ) ( not ( = ?auto_1875125 ?auto_1875130 ) ) ( not ( = ?auto_1875126 ?auto_1875127 ) ) ( not ( = ?auto_1875126 ?auto_1875128 ) ) ( not ( = ?auto_1875126 ?auto_1875129 ) ) ( not ( = ?auto_1875126 ?auto_1875130 ) ) ( not ( = ?auto_1875127 ?auto_1875128 ) ) ( not ( = ?auto_1875127 ?auto_1875129 ) ) ( not ( = ?auto_1875127 ?auto_1875130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875128 ?auto_1875129 ?auto_1875130 )
      ( MAKE-14CRATE-VERIFY ?auto_1875116 ?auto_1875117 ?auto_1875118 ?auto_1875120 ?auto_1875119 ?auto_1875121 ?auto_1875122 ?auto_1875123 ?auto_1875124 ?auto_1875125 ?auto_1875126 ?auto_1875127 ?auto_1875128 ?auto_1875129 ?auto_1875130 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875305 - SURFACE
      ?auto_1875306 - SURFACE
      ?auto_1875307 - SURFACE
      ?auto_1875309 - SURFACE
      ?auto_1875308 - SURFACE
      ?auto_1875310 - SURFACE
      ?auto_1875311 - SURFACE
      ?auto_1875312 - SURFACE
      ?auto_1875313 - SURFACE
      ?auto_1875314 - SURFACE
      ?auto_1875315 - SURFACE
      ?auto_1875316 - SURFACE
      ?auto_1875317 - SURFACE
      ?auto_1875318 - SURFACE
      ?auto_1875319 - SURFACE
    )
    :vars
    (
      ?auto_1875323 - HOIST
      ?auto_1875324 - PLACE
      ?auto_1875321 - TRUCK
      ?auto_1875322 - PLACE
      ?auto_1875320 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875323 ?auto_1875324 ) ( SURFACE-AT ?auto_1875318 ?auto_1875324 ) ( CLEAR ?auto_1875318 ) ( IS-CRATE ?auto_1875319 ) ( not ( = ?auto_1875318 ?auto_1875319 ) ) ( AVAILABLE ?auto_1875323 ) ( ON ?auto_1875318 ?auto_1875317 ) ( not ( = ?auto_1875317 ?auto_1875318 ) ) ( not ( = ?auto_1875317 ?auto_1875319 ) ) ( TRUCK-AT ?auto_1875321 ?auto_1875322 ) ( not ( = ?auto_1875322 ?auto_1875324 ) ) ( HOIST-AT ?auto_1875320 ?auto_1875322 ) ( LIFTING ?auto_1875320 ?auto_1875319 ) ( not ( = ?auto_1875323 ?auto_1875320 ) ) ( ON ?auto_1875306 ?auto_1875305 ) ( ON ?auto_1875307 ?auto_1875306 ) ( ON ?auto_1875309 ?auto_1875307 ) ( ON ?auto_1875308 ?auto_1875309 ) ( ON ?auto_1875310 ?auto_1875308 ) ( ON ?auto_1875311 ?auto_1875310 ) ( ON ?auto_1875312 ?auto_1875311 ) ( ON ?auto_1875313 ?auto_1875312 ) ( ON ?auto_1875314 ?auto_1875313 ) ( ON ?auto_1875315 ?auto_1875314 ) ( ON ?auto_1875316 ?auto_1875315 ) ( ON ?auto_1875317 ?auto_1875316 ) ( not ( = ?auto_1875305 ?auto_1875306 ) ) ( not ( = ?auto_1875305 ?auto_1875307 ) ) ( not ( = ?auto_1875305 ?auto_1875309 ) ) ( not ( = ?auto_1875305 ?auto_1875308 ) ) ( not ( = ?auto_1875305 ?auto_1875310 ) ) ( not ( = ?auto_1875305 ?auto_1875311 ) ) ( not ( = ?auto_1875305 ?auto_1875312 ) ) ( not ( = ?auto_1875305 ?auto_1875313 ) ) ( not ( = ?auto_1875305 ?auto_1875314 ) ) ( not ( = ?auto_1875305 ?auto_1875315 ) ) ( not ( = ?auto_1875305 ?auto_1875316 ) ) ( not ( = ?auto_1875305 ?auto_1875317 ) ) ( not ( = ?auto_1875305 ?auto_1875318 ) ) ( not ( = ?auto_1875305 ?auto_1875319 ) ) ( not ( = ?auto_1875306 ?auto_1875307 ) ) ( not ( = ?auto_1875306 ?auto_1875309 ) ) ( not ( = ?auto_1875306 ?auto_1875308 ) ) ( not ( = ?auto_1875306 ?auto_1875310 ) ) ( not ( = ?auto_1875306 ?auto_1875311 ) ) ( not ( = ?auto_1875306 ?auto_1875312 ) ) ( not ( = ?auto_1875306 ?auto_1875313 ) ) ( not ( = ?auto_1875306 ?auto_1875314 ) ) ( not ( = ?auto_1875306 ?auto_1875315 ) ) ( not ( = ?auto_1875306 ?auto_1875316 ) ) ( not ( = ?auto_1875306 ?auto_1875317 ) ) ( not ( = ?auto_1875306 ?auto_1875318 ) ) ( not ( = ?auto_1875306 ?auto_1875319 ) ) ( not ( = ?auto_1875307 ?auto_1875309 ) ) ( not ( = ?auto_1875307 ?auto_1875308 ) ) ( not ( = ?auto_1875307 ?auto_1875310 ) ) ( not ( = ?auto_1875307 ?auto_1875311 ) ) ( not ( = ?auto_1875307 ?auto_1875312 ) ) ( not ( = ?auto_1875307 ?auto_1875313 ) ) ( not ( = ?auto_1875307 ?auto_1875314 ) ) ( not ( = ?auto_1875307 ?auto_1875315 ) ) ( not ( = ?auto_1875307 ?auto_1875316 ) ) ( not ( = ?auto_1875307 ?auto_1875317 ) ) ( not ( = ?auto_1875307 ?auto_1875318 ) ) ( not ( = ?auto_1875307 ?auto_1875319 ) ) ( not ( = ?auto_1875309 ?auto_1875308 ) ) ( not ( = ?auto_1875309 ?auto_1875310 ) ) ( not ( = ?auto_1875309 ?auto_1875311 ) ) ( not ( = ?auto_1875309 ?auto_1875312 ) ) ( not ( = ?auto_1875309 ?auto_1875313 ) ) ( not ( = ?auto_1875309 ?auto_1875314 ) ) ( not ( = ?auto_1875309 ?auto_1875315 ) ) ( not ( = ?auto_1875309 ?auto_1875316 ) ) ( not ( = ?auto_1875309 ?auto_1875317 ) ) ( not ( = ?auto_1875309 ?auto_1875318 ) ) ( not ( = ?auto_1875309 ?auto_1875319 ) ) ( not ( = ?auto_1875308 ?auto_1875310 ) ) ( not ( = ?auto_1875308 ?auto_1875311 ) ) ( not ( = ?auto_1875308 ?auto_1875312 ) ) ( not ( = ?auto_1875308 ?auto_1875313 ) ) ( not ( = ?auto_1875308 ?auto_1875314 ) ) ( not ( = ?auto_1875308 ?auto_1875315 ) ) ( not ( = ?auto_1875308 ?auto_1875316 ) ) ( not ( = ?auto_1875308 ?auto_1875317 ) ) ( not ( = ?auto_1875308 ?auto_1875318 ) ) ( not ( = ?auto_1875308 ?auto_1875319 ) ) ( not ( = ?auto_1875310 ?auto_1875311 ) ) ( not ( = ?auto_1875310 ?auto_1875312 ) ) ( not ( = ?auto_1875310 ?auto_1875313 ) ) ( not ( = ?auto_1875310 ?auto_1875314 ) ) ( not ( = ?auto_1875310 ?auto_1875315 ) ) ( not ( = ?auto_1875310 ?auto_1875316 ) ) ( not ( = ?auto_1875310 ?auto_1875317 ) ) ( not ( = ?auto_1875310 ?auto_1875318 ) ) ( not ( = ?auto_1875310 ?auto_1875319 ) ) ( not ( = ?auto_1875311 ?auto_1875312 ) ) ( not ( = ?auto_1875311 ?auto_1875313 ) ) ( not ( = ?auto_1875311 ?auto_1875314 ) ) ( not ( = ?auto_1875311 ?auto_1875315 ) ) ( not ( = ?auto_1875311 ?auto_1875316 ) ) ( not ( = ?auto_1875311 ?auto_1875317 ) ) ( not ( = ?auto_1875311 ?auto_1875318 ) ) ( not ( = ?auto_1875311 ?auto_1875319 ) ) ( not ( = ?auto_1875312 ?auto_1875313 ) ) ( not ( = ?auto_1875312 ?auto_1875314 ) ) ( not ( = ?auto_1875312 ?auto_1875315 ) ) ( not ( = ?auto_1875312 ?auto_1875316 ) ) ( not ( = ?auto_1875312 ?auto_1875317 ) ) ( not ( = ?auto_1875312 ?auto_1875318 ) ) ( not ( = ?auto_1875312 ?auto_1875319 ) ) ( not ( = ?auto_1875313 ?auto_1875314 ) ) ( not ( = ?auto_1875313 ?auto_1875315 ) ) ( not ( = ?auto_1875313 ?auto_1875316 ) ) ( not ( = ?auto_1875313 ?auto_1875317 ) ) ( not ( = ?auto_1875313 ?auto_1875318 ) ) ( not ( = ?auto_1875313 ?auto_1875319 ) ) ( not ( = ?auto_1875314 ?auto_1875315 ) ) ( not ( = ?auto_1875314 ?auto_1875316 ) ) ( not ( = ?auto_1875314 ?auto_1875317 ) ) ( not ( = ?auto_1875314 ?auto_1875318 ) ) ( not ( = ?auto_1875314 ?auto_1875319 ) ) ( not ( = ?auto_1875315 ?auto_1875316 ) ) ( not ( = ?auto_1875315 ?auto_1875317 ) ) ( not ( = ?auto_1875315 ?auto_1875318 ) ) ( not ( = ?auto_1875315 ?auto_1875319 ) ) ( not ( = ?auto_1875316 ?auto_1875317 ) ) ( not ( = ?auto_1875316 ?auto_1875318 ) ) ( not ( = ?auto_1875316 ?auto_1875319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875317 ?auto_1875318 ?auto_1875319 )
      ( MAKE-14CRATE-VERIFY ?auto_1875305 ?auto_1875306 ?auto_1875307 ?auto_1875309 ?auto_1875308 ?auto_1875310 ?auto_1875311 ?auto_1875312 ?auto_1875313 ?auto_1875314 ?auto_1875315 ?auto_1875316 ?auto_1875317 ?auto_1875318 ?auto_1875319 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875508 - SURFACE
      ?auto_1875509 - SURFACE
      ?auto_1875510 - SURFACE
      ?auto_1875512 - SURFACE
      ?auto_1875511 - SURFACE
      ?auto_1875513 - SURFACE
      ?auto_1875514 - SURFACE
      ?auto_1875515 - SURFACE
      ?auto_1875516 - SURFACE
      ?auto_1875517 - SURFACE
      ?auto_1875518 - SURFACE
      ?auto_1875519 - SURFACE
      ?auto_1875520 - SURFACE
      ?auto_1875521 - SURFACE
      ?auto_1875522 - SURFACE
    )
    :vars
    (
      ?auto_1875526 - HOIST
      ?auto_1875528 - PLACE
      ?auto_1875523 - TRUCK
      ?auto_1875525 - PLACE
      ?auto_1875527 - HOIST
      ?auto_1875524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875526 ?auto_1875528 ) ( SURFACE-AT ?auto_1875521 ?auto_1875528 ) ( CLEAR ?auto_1875521 ) ( IS-CRATE ?auto_1875522 ) ( not ( = ?auto_1875521 ?auto_1875522 ) ) ( AVAILABLE ?auto_1875526 ) ( ON ?auto_1875521 ?auto_1875520 ) ( not ( = ?auto_1875520 ?auto_1875521 ) ) ( not ( = ?auto_1875520 ?auto_1875522 ) ) ( TRUCK-AT ?auto_1875523 ?auto_1875525 ) ( not ( = ?auto_1875525 ?auto_1875528 ) ) ( HOIST-AT ?auto_1875527 ?auto_1875525 ) ( not ( = ?auto_1875526 ?auto_1875527 ) ) ( AVAILABLE ?auto_1875527 ) ( SURFACE-AT ?auto_1875522 ?auto_1875525 ) ( ON ?auto_1875522 ?auto_1875524 ) ( CLEAR ?auto_1875522 ) ( not ( = ?auto_1875521 ?auto_1875524 ) ) ( not ( = ?auto_1875522 ?auto_1875524 ) ) ( not ( = ?auto_1875520 ?auto_1875524 ) ) ( ON ?auto_1875509 ?auto_1875508 ) ( ON ?auto_1875510 ?auto_1875509 ) ( ON ?auto_1875512 ?auto_1875510 ) ( ON ?auto_1875511 ?auto_1875512 ) ( ON ?auto_1875513 ?auto_1875511 ) ( ON ?auto_1875514 ?auto_1875513 ) ( ON ?auto_1875515 ?auto_1875514 ) ( ON ?auto_1875516 ?auto_1875515 ) ( ON ?auto_1875517 ?auto_1875516 ) ( ON ?auto_1875518 ?auto_1875517 ) ( ON ?auto_1875519 ?auto_1875518 ) ( ON ?auto_1875520 ?auto_1875519 ) ( not ( = ?auto_1875508 ?auto_1875509 ) ) ( not ( = ?auto_1875508 ?auto_1875510 ) ) ( not ( = ?auto_1875508 ?auto_1875512 ) ) ( not ( = ?auto_1875508 ?auto_1875511 ) ) ( not ( = ?auto_1875508 ?auto_1875513 ) ) ( not ( = ?auto_1875508 ?auto_1875514 ) ) ( not ( = ?auto_1875508 ?auto_1875515 ) ) ( not ( = ?auto_1875508 ?auto_1875516 ) ) ( not ( = ?auto_1875508 ?auto_1875517 ) ) ( not ( = ?auto_1875508 ?auto_1875518 ) ) ( not ( = ?auto_1875508 ?auto_1875519 ) ) ( not ( = ?auto_1875508 ?auto_1875520 ) ) ( not ( = ?auto_1875508 ?auto_1875521 ) ) ( not ( = ?auto_1875508 ?auto_1875522 ) ) ( not ( = ?auto_1875508 ?auto_1875524 ) ) ( not ( = ?auto_1875509 ?auto_1875510 ) ) ( not ( = ?auto_1875509 ?auto_1875512 ) ) ( not ( = ?auto_1875509 ?auto_1875511 ) ) ( not ( = ?auto_1875509 ?auto_1875513 ) ) ( not ( = ?auto_1875509 ?auto_1875514 ) ) ( not ( = ?auto_1875509 ?auto_1875515 ) ) ( not ( = ?auto_1875509 ?auto_1875516 ) ) ( not ( = ?auto_1875509 ?auto_1875517 ) ) ( not ( = ?auto_1875509 ?auto_1875518 ) ) ( not ( = ?auto_1875509 ?auto_1875519 ) ) ( not ( = ?auto_1875509 ?auto_1875520 ) ) ( not ( = ?auto_1875509 ?auto_1875521 ) ) ( not ( = ?auto_1875509 ?auto_1875522 ) ) ( not ( = ?auto_1875509 ?auto_1875524 ) ) ( not ( = ?auto_1875510 ?auto_1875512 ) ) ( not ( = ?auto_1875510 ?auto_1875511 ) ) ( not ( = ?auto_1875510 ?auto_1875513 ) ) ( not ( = ?auto_1875510 ?auto_1875514 ) ) ( not ( = ?auto_1875510 ?auto_1875515 ) ) ( not ( = ?auto_1875510 ?auto_1875516 ) ) ( not ( = ?auto_1875510 ?auto_1875517 ) ) ( not ( = ?auto_1875510 ?auto_1875518 ) ) ( not ( = ?auto_1875510 ?auto_1875519 ) ) ( not ( = ?auto_1875510 ?auto_1875520 ) ) ( not ( = ?auto_1875510 ?auto_1875521 ) ) ( not ( = ?auto_1875510 ?auto_1875522 ) ) ( not ( = ?auto_1875510 ?auto_1875524 ) ) ( not ( = ?auto_1875512 ?auto_1875511 ) ) ( not ( = ?auto_1875512 ?auto_1875513 ) ) ( not ( = ?auto_1875512 ?auto_1875514 ) ) ( not ( = ?auto_1875512 ?auto_1875515 ) ) ( not ( = ?auto_1875512 ?auto_1875516 ) ) ( not ( = ?auto_1875512 ?auto_1875517 ) ) ( not ( = ?auto_1875512 ?auto_1875518 ) ) ( not ( = ?auto_1875512 ?auto_1875519 ) ) ( not ( = ?auto_1875512 ?auto_1875520 ) ) ( not ( = ?auto_1875512 ?auto_1875521 ) ) ( not ( = ?auto_1875512 ?auto_1875522 ) ) ( not ( = ?auto_1875512 ?auto_1875524 ) ) ( not ( = ?auto_1875511 ?auto_1875513 ) ) ( not ( = ?auto_1875511 ?auto_1875514 ) ) ( not ( = ?auto_1875511 ?auto_1875515 ) ) ( not ( = ?auto_1875511 ?auto_1875516 ) ) ( not ( = ?auto_1875511 ?auto_1875517 ) ) ( not ( = ?auto_1875511 ?auto_1875518 ) ) ( not ( = ?auto_1875511 ?auto_1875519 ) ) ( not ( = ?auto_1875511 ?auto_1875520 ) ) ( not ( = ?auto_1875511 ?auto_1875521 ) ) ( not ( = ?auto_1875511 ?auto_1875522 ) ) ( not ( = ?auto_1875511 ?auto_1875524 ) ) ( not ( = ?auto_1875513 ?auto_1875514 ) ) ( not ( = ?auto_1875513 ?auto_1875515 ) ) ( not ( = ?auto_1875513 ?auto_1875516 ) ) ( not ( = ?auto_1875513 ?auto_1875517 ) ) ( not ( = ?auto_1875513 ?auto_1875518 ) ) ( not ( = ?auto_1875513 ?auto_1875519 ) ) ( not ( = ?auto_1875513 ?auto_1875520 ) ) ( not ( = ?auto_1875513 ?auto_1875521 ) ) ( not ( = ?auto_1875513 ?auto_1875522 ) ) ( not ( = ?auto_1875513 ?auto_1875524 ) ) ( not ( = ?auto_1875514 ?auto_1875515 ) ) ( not ( = ?auto_1875514 ?auto_1875516 ) ) ( not ( = ?auto_1875514 ?auto_1875517 ) ) ( not ( = ?auto_1875514 ?auto_1875518 ) ) ( not ( = ?auto_1875514 ?auto_1875519 ) ) ( not ( = ?auto_1875514 ?auto_1875520 ) ) ( not ( = ?auto_1875514 ?auto_1875521 ) ) ( not ( = ?auto_1875514 ?auto_1875522 ) ) ( not ( = ?auto_1875514 ?auto_1875524 ) ) ( not ( = ?auto_1875515 ?auto_1875516 ) ) ( not ( = ?auto_1875515 ?auto_1875517 ) ) ( not ( = ?auto_1875515 ?auto_1875518 ) ) ( not ( = ?auto_1875515 ?auto_1875519 ) ) ( not ( = ?auto_1875515 ?auto_1875520 ) ) ( not ( = ?auto_1875515 ?auto_1875521 ) ) ( not ( = ?auto_1875515 ?auto_1875522 ) ) ( not ( = ?auto_1875515 ?auto_1875524 ) ) ( not ( = ?auto_1875516 ?auto_1875517 ) ) ( not ( = ?auto_1875516 ?auto_1875518 ) ) ( not ( = ?auto_1875516 ?auto_1875519 ) ) ( not ( = ?auto_1875516 ?auto_1875520 ) ) ( not ( = ?auto_1875516 ?auto_1875521 ) ) ( not ( = ?auto_1875516 ?auto_1875522 ) ) ( not ( = ?auto_1875516 ?auto_1875524 ) ) ( not ( = ?auto_1875517 ?auto_1875518 ) ) ( not ( = ?auto_1875517 ?auto_1875519 ) ) ( not ( = ?auto_1875517 ?auto_1875520 ) ) ( not ( = ?auto_1875517 ?auto_1875521 ) ) ( not ( = ?auto_1875517 ?auto_1875522 ) ) ( not ( = ?auto_1875517 ?auto_1875524 ) ) ( not ( = ?auto_1875518 ?auto_1875519 ) ) ( not ( = ?auto_1875518 ?auto_1875520 ) ) ( not ( = ?auto_1875518 ?auto_1875521 ) ) ( not ( = ?auto_1875518 ?auto_1875522 ) ) ( not ( = ?auto_1875518 ?auto_1875524 ) ) ( not ( = ?auto_1875519 ?auto_1875520 ) ) ( not ( = ?auto_1875519 ?auto_1875521 ) ) ( not ( = ?auto_1875519 ?auto_1875522 ) ) ( not ( = ?auto_1875519 ?auto_1875524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875520 ?auto_1875521 ?auto_1875522 )
      ( MAKE-14CRATE-VERIFY ?auto_1875508 ?auto_1875509 ?auto_1875510 ?auto_1875512 ?auto_1875511 ?auto_1875513 ?auto_1875514 ?auto_1875515 ?auto_1875516 ?auto_1875517 ?auto_1875518 ?auto_1875519 ?auto_1875520 ?auto_1875521 ?auto_1875522 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875712 - SURFACE
      ?auto_1875713 - SURFACE
      ?auto_1875714 - SURFACE
      ?auto_1875716 - SURFACE
      ?auto_1875715 - SURFACE
      ?auto_1875717 - SURFACE
      ?auto_1875718 - SURFACE
      ?auto_1875719 - SURFACE
      ?auto_1875720 - SURFACE
      ?auto_1875721 - SURFACE
      ?auto_1875722 - SURFACE
      ?auto_1875723 - SURFACE
      ?auto_1875724 - SURFACE
      ?auto_1875725 - SURFACE
      ?auto_1875726 - SURFACE
    )
    :vars
    (
      ?auto_1875727 - HOIST
      ?auto_1875728 - PLACE
      ?auto_1875731 - PLACE
      ?auto_1875730 - HOIST
      ?auto_1875729 - SURFACE
      ?auto_1875732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875727 ?auto_1875728 ) ( SURFACE-AT ?auto_1875725 ?auto_1875728 ) ( CLEAR ?auto_1875725 ) ( IS-CRATE ?auto_1875726 ) ( not ( = ?auto_1875725 ?auto_1875726 ) ) ( AVAILABLE ?auto_1875727 ) ( ON ?auto_1875725 ?auto_1875724 ) ( not ( = ?auto_1875724 ?auto_1875725 ) ) ( not ( = ?auto_1875724 ?auto_1875726 ) ) ( not ( = ?auto_1875731 ?auto_1875728 ) ) ( HOIST-AT ?auto_1875730 ?auto_1875731 ) ( not ( = ?auto_1875727 ?auto_1875730 ) ) ( AVAILABLE ?auto_1875730 ) ( SURFACE-AT ?auto_1875726 ?auto_1875731 ) ( ON ?auto_1875726 ?auto_1875729 ) ( CLEAR ?auto_1875726 ) ( not ( = ?auto_1875725 ?auto_1875729 ) ) ( not ( = ?auto_1875726 ?auto_1875729 ) ) ( not ( = ?auto_1875724 ?auto_1875729 ) ) ( TRUCK-AT ?auto_1875732 ?auto_1875728 ) ( ON ?auto_1875713 ?auto_1875712 ) ( ON ?auto_1875714 ?auto_1875713 ) ( ON ?auto_1875716 ?auto_1875714 ) ( ON ?auto_1875715 ?auto_1875716 ) ( ON ?auto_1875717 ?auto_1875715 ) ( ON ?auto_1875718 ?auto_1875717 ) ( ON ?auto_1875719 ?auto_1875718 ) ( ON ?auto_1875720 ?auto_1875719 ) ( ON ?auto_1875721 ?auto_1875720 ) ( ON ?auto_1875722 ?auto_1875721 ) ( ON ?auto_1875723 ?auto_1875722 ) ( ON ?auto_1875724 ?auto_1875723 ) ( not ( = ?auto_1875712 ?auto_1875713 ) ) ( not ( = ?auto_1875712 ?auto_1875714 ) ) ( not ( = ?auto_1875712 ?auto_1875716 ) ) ( not ( = ?auto_1875712 ?auto_1875715 ) ) ( not ( = ?auto_1875712 ?auto_1875717 ) ) ( not ( = ?auto_1875712 ?auto_1875718 ) ) ( not ( = ?auto_1875712 ?auto_1875719 ) ) ( not ( = ?auto_1875712 ?auto_1875720 ) ) ( not ( = ?auto_1875712 ?auto_1875721 ) ) ( not ( = ?auto_1875712 ?auto_1875722 ) ) ( not ( = ?auto_1875712 ?auto_1875723 ) ) ( not ( = ?auto_1875712 ?auto_1875724 ) ) ( not ( = ?auto_1875712 ?auto_1875725 ) ) ( not ( = ?auto_1875712 ?auto_1875726 ) ) ( not ( = ?auto_1875712 ?auto_1875729 ) ) ( not ( = ?auto_1875713 ?auto_1875714 ) ) ( not ( = ?auto_1875713 ?auto_1875716 ) ) ( not ( = ?auto_1875713 ?auto_1875715 ) ) ( not ( = ?auto_1875713 ?auto_1875717 ) ) ( not ( = ?auto_1875713 ?auto_1875718 ) ) ( not ( = ?auto_1875713 ?auto_1875719 ) ) ( not ( = ?auto_1875713 ?auto_1875720 ) ) ( not ( = ?auto_1875713 ?auto_1875721 ) ) ( not ( = ?auto_1875713 ?auto_1875722 ) ) ( not ( = ?auto_1875713 ?auto_1875723 ) ) ( not ( = ?auto_1875713 ?auto_1875724 ) ) ( not ( = ?auto_1875713 ?auto_1875725 ) ) ( not ( = ?auto_1875713 ?auto_1875726 ) ) ( not ( = ?auto_1875713 ?auto_1875729 ) ) ( not ( = ?auto_1875714 ?auto_1875716 ) ) ( not ( = ?auto_1875714 ?auto_1875715 ) ) ( not ( = ?auto_1875714 ?auto_1875717 ) ) ( not ( = ?auto_1875714 ?auto_1875718 ) ) ( not ( = ?auto_1875714 ?auto_1875719 ) ) ( not ( = ?auto_1875714 ?auto_1875720 ) ) ( not ( = ?auto_1875714 ?auto_1875721 ) ) ( not ( = ?auto_1875714 ?auto_1875722 ) ) ( not ( = ?auto_1875714 ?auto_1875723 ) ) ( not ( = ?auto_1875714 ?auto_1875724 ) ) ( not ( = ?auto_1875714 ?auto_1875725 ) ) ( not ( = ?auto_1875714 ?auto_1875726 ) ) ( not ( = ?auto_1875714 ?auto_1875729 ) ) ( not ( = ?auto_1875716 ?auto_1875715 ) ) ( not ( = ?auto_1875716 ?auto_1875717 ) ) ( not ( = ?auto_1875716 ?auto_1875718 ) ) ( not ( = ?auto_1875716 ?auto_1875719 ) ) ( not ( = ?auto_1875716 ?auto_1875720 ) ) ( not ( = ?auto_1875716 ?auto_1875721 ) ) ( not ( = ?auto_1875716 ?auto_1875722 ) ) ( not ( = ?auto_1875716 ?auto_1875723 ) ) ( not ( = ?auto_1875716 ?auto_1875724 ) ) ( not ( = ?auto_1875716 ?auto_1875725 ) ) ( not ( = ?auto_1875716 ?auto_1875726 ) ) ( not ( = ?auto_1875716 ?auto_1875729 ) ) ( not ( = ?auto_1875715 ?auto_1875717 ) ) ( not ( = ?auto_1875715 ?auto_1875718 ) ) ( not ( = ?auto_1875715 ?auto_1875719 ) ) ( not ( = ?auto_1875715 ?auto_1875720 ) ) ( not ( = ?auto_1875715 ?auto_1875721 ) ) ( not ( = ?auto_1875715 ?auto_1875722 ) ) ( not ( = ?auto_1875715 ?auto_1875723 ) ) ( not ( = ?auto_1875715 ?auto_1875724 ) ) ( not ( = ?auto_1875715 ?auto_1875725 ) ) ( not ( = ?auto_1875715 ?auto_1875726 ) ) ( not ( = ?auto_1875715 ?auto_1875729 ) ) ( not ( = ?auto_1875717 ?auto_1875718 ) ) ( not ( = ?auto_1875717 ?auto_1875719 ) ) ( not ( = ?auto_1875717 ?auto_1875720 ) ) ( not ( = ?auto_1875717 ?auto_1875721 ) ) ( not ( = ?auto_1875717 ?auto_1875722 ) ) ( not ( = ?auto_1875717 ?auto_1875723 ) ) ( not ( = ?auto_1875717 ?auto_1875724 ) ) ( not ( = ?auto_1875717 ?auto_1875725 ) ) ( not ( = ?auto_1875717 ?auto_1875726 ) ) ( not ( = ?auto_1875717 ?auto_1875729 ) ) ( not ( = ?auto_1875718 ?auto_1875719 ) ) ( not ( = ?auto_1875718 ?auto_1875720 ) ) ( not ( = ?auto_1875718 ?auto_1875721 ) ) ( not ( = ?auto_1875718 ?auto_1875722 ) ) ( not ( = ?auto_1875718 ?auto_1875723 ) ) ( not ( = ?auto_1875718 ?auto_1875724 ) ) ( not ( = ?auto_1875718 ?auto_1875725 ) ) ( not ( = ?auto_1875718 ?auto_1875726 ) ) ( not ( = ?auto_1875718 ?auto_1875729 ) ) ( not ( = ?auto_1875719 ?auto_1875720 ) ) ( not ( = ?auto_1875719 ?auto_1875721 ) ) ( not ( = ?auto_1875719 ?auto_1875722 ) ) ( not ( = ?auto_1875719 ?auto_1875723 ) ) ( not ( = ?auto_1875719 ?auto_1875724 ) ) ( not ( = ?auto_1875719 ?auto_1875725 ) ) ( not ( = ?auto_1875719 ?auto_1875726 ) ) ( not ( = ?auto_1875719 ?auto_1875729 ) ) ( not ( = ?auto_1875720 ?auto_1875721 ) ) ( not ( = ?auto_1875720 ?auto_1875722 ) ) ( not ( = ?auto_1875720 ?auto_1875723 ) ) ( not ( = ?auto_1875720 ?auto_1875724 ) ) ( not ( = ?auto_1875720 ?auto_1875725 ) ) ( not ( = ?auto_1875720 ?auto_1875726 ) ) ( not ( = ?auto_1875720 ?auto_1875729 ) ) ( not ( = ?auto_1875721 ?auto_1875722 ) ) ( not ( = ?auto_1875721 ?auto_1875723 ) ) ( not ( = ?auto_1875721 ?auto_1875724 ) ) ( not ( = ?auto_1875721 ?auto_1875725 ) ) ( not ( = ?auto_1875721 ?auto_1875726 ) ) ( not ( = ?auto_1875721 ?auto_1875729 ) ) ( not ( = ?auto_1875722 ?auto_1875723 ) ) ( not ( = ?auto_1875722 ?auto_1875724 ) ) ( not ( = ?auto_1875722 ?auto_1875725 ) ) ( not ( = ?auto_1875722 ?auto_1875726 ) ) ( not ( = ?auto_1875722 ?auto_1875729 ) ) ( not ( = ?auto_1875723 ?auto_1875724 ) ) ( not ( = ?auto_1875723 ?auto_1875725 ) ) ( not ( = ?auto_1875723 ?auto_1875726 ) ) ( not ( = ?auto_1875723 ?auto_1875729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875724 ?auto_1875725 ?auto_1875726 )
      ( MAKE-14CRATE-VERIFY ?auto_1875712 ?auto_1875713 ?auto_1875714 ?auto_1875716 ?auto_1875715 ?auto_1875717 ?auto_1875718 ?auto_1875719 ?auto_1875720 ?auto_1875721 ?auto_1875722 ?auto_1875723 ?auto_1875724 ?auto_1875725 ?auto_1875726 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1875916 - SURFACE
      ?auto_1875917 - SURFACE
      ?auto_1875918 - SURFACE
      ?auto_1875920 - SURFACE
      ?auto_1875919 - SURFACE
      ?auto_1875921 - SURFACE
      ?auto_1875922 - SURFACE
      ?auto_1875923 - SURFACE
      ?auto_1875924 - SURFACE
      ?auto_1875925 - SURFACE
      ?auto_1875926 - SURFACE
      ?auto_1875927 - SURFACE
      ?auto_1875928 - SURFACE
      ?auto_1875929 - SURFACE
      ?auto_1875930 - SURFACE
    )
    :vars
    (
      ?auto_1875933 - HOIST
      ?auto_1875936 - PLACE
      ?auto_1875934 - PLACE
      ?auto_1875935 - HOIST
      ?auto_1875932 - SURFACE
      ?auto_1875931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1875933 ?auto_1875936 ) ( IS-CRATE ?auto_1875930 ) ( not ( = ?auto_1875929 ?auto_1875930 ) ) ( not ( = ?auto_1875928 ?auto_1875929 ) ) ( not ( = ?auto_1875928 ?auto_1875930 ) ) ( not ( = ?auto_1875934 ?auto_1875936 ) ) ( HOIST-AT ?auto_1875935 ?auto_1875934 ) ( not ( = ?auto_1875933 ?auto_1875935 ) ) ( AVAILABLE ?auto_1875935 ) ( SURFACE-AT ?auto_1875930 ?auto_1875934 ) ( ON ?auto_1875930 ?auto_1875932 ) ( CLEAR ?auto_1875930 ) ( not ( = ?auto_1875929 ?auto_1875932 ) ) ( not ( = ?auto_1875930 ?auto_1875932 ) ) ( not ( = ?auto_1875928 ?auto_1875932 ) ) ( TRUCK-AT ?auto_1875931 ?auto_1875936 ) ( SURFACE-AT ?auto_1875928 ?auto_1875936 ) ( CLEAR ?auto_1875928 ) ( LIFTING ?auto_1875933 ?auto_1875929 ) ( IS-CRATE ?auto_1875929 ) ( ON ?auto_1875917 ?auto_1875916 ) ( ON ?auto_1875918 ?auto_1875917 ) ( ON ?auto_1875920 ?auto_1875918 ) ( ON ?auto_1875919 ?auto_1875920 ) ( ON ?auto_1875921 ?auto_1875919 ) ( ON ?auto_1875922 ?auto_1875921 ) ( ON ?auto_1875923 ?auto_1875922 ) ( ON ?auto_1875924 ?auto_1875923 ) ( ON ?auto_1875925 ?auto_1875924 ) ( ON ?auto_1875926 ?auto_1875925 ) ( ON ?auto_1875927 ?auto_1875926 ) ( ON ?auto_1875928 ?auto_1875927 ) ( not ( = ?auto_1875916 ?auto_1875917 ) ) ( not ( = ?auto_1875916 ?auto_1875918 ) ) ( not ( = ?auto_1875916 ?auto_1875920 ) ) ( not ( = ?auto_1875916 ?auto_1875919 ) ) ( not ( = ?auto_1875916 ?auto_1875921 ) ) ( not ( = ?auto_1875916 ?auto_1875922 ) ) ( not ( = ?auto_1875916 ?auto_1875923 ) ) ( not ( = ?auto_1875916 ?auto_1875924 ) ) ( not ( = ?auto_1875916 ?auto_1875925 ) ) ( not ( = ?auto_1875916 ?auto_1875926 ) ) ( not ( = ?auto_1875916 ?auto_1875927 ) ) ( not ( = ?auto_1875916 ?auto_1875928 ) ) ( not ( = ?auto_1875916 ?auto_1875929 ) ) ( not ( = ?auto_1875916 ?auto_1875930 ) ) ( not ( = ?auto_1875916 ?auto_1875932 ) ) ( not ( = ?auto_1875917 ?auto_1875918 ) ) ( not ( = ?auto_1875917 ?auto_1875920 ) ) ( not ( = ?auto_1875917 ?auto_1875919 ) ) ( not ( = ?auto_1875917 ?auto_1875921 ) ) ( not ( = ?auto_1875917 ?auto_1875922 ) ) ( not ( = ?auto_1875917 ?auto_1875923 ) ) ( not ( = ?auto_1875917 ?auto_1875924 ) ) ( not ( = ?auto_1875917 ?auto_1875925 ) ) ( not ( = ?auto_1875917 ?auto_1875926 ) ) ( not ( = ?auto_1875917 ?auto_1875927 ) ) ( not ( = ?auto_1875917 ?auto_1875928 ) ) ( not ( = ?auto_1875917 ?auto_1875929 ) ) ( not ( = ?auto_1875917 ?auto_1875930 ) ) ( not ( = ?auto_1875917 ?auto_1875932 ) ) ( not ( = ?auto_1875918 ?auto_1875920 ) ) ( not ( = ?auto_1875918 ?auto_1875919 ) ) ( not ( = ?auto_1875918 ?auto_1875921 ) ) ( not ( = ?auto_1875918 ?auto_1875922 ) ) ( not ( = ?auto_1875918 ?auto_1875923 ) ) ( not ( = ?auto_1875918 ?auto_1875924 ) ) ( not ( = ?auto_1875918 ?auto_1875925 ) ) ( not ( = ?auto_1875918 ?auto_1875926 ) ) ( not ( = ?auto_1875918 ?auto_1875927 ) ) ( not ( = ?auto_1875918 ?auto_1875928 ) ) ( not ( = ?auto_1875918 ?auto_1875929 ) ) ( not ( = ?auto_1875918 ?auto_1875930 ) ) ( not ( = ?auto_1875918 ?auto_1875932 ) ) ( not ( = ?auto_1875920 ?auto_1875919 ) ) ( not ( = ?auto_1875920 ?auto_1875921 ) ) ( not ( = ?auto_1875920 ?auto_1875922 ) ) ( not ( = ?auto_1875920 ?auto_1875923 ) ) ( not ( = ?auto_1875920 ?auto_1875924 ) ) ( not ( = ?auto_1875920 ?auto_1875925 ) ) ( not ( = ?auto_1875920 ?auto_1875926 ) ) ( not ( = ?auto_1875920 ?auto_1875927 ) ) ( not ( = ?auto_1875920 ?auto_1875928 ) ) ( not ( = ?auto_1875920 ?auto_1875929 ) ) ( not ( = ?auto_1875920 ?auto_1875930 ) ) ( not ( = ?auto_1875920 ?auto_1875932 ) ) ( not ( = ?auto_1875919 ?auto_1875921 ) ) ( not ( = ?auto_1875919 ?auto_1875922 ) ) ( not ( = ?auto_1875919 ?auto_1875923 ) ) ( not ( = ?auto_1875919 ?auto_1875924 ) ) ( not ( = ?auto_1875919 ?auto_1875925 ) ) ( not ( = ?auto_1875919 ?auto_1875926 ) ) ( not ( = ?auto_1875919 ?auto_1875927 ) ) ( not ( = ?auto_1875919 ?auto_1875928 ) ) ( not ( = ?auto_1875919 ?auto_1875929 ) ) ( not ( = ?auto_1875919 ?auto_1875930 ) ) ( not ( = ?auto_1875919 ?auto_1875932 ) ) ( not ( = ?auto_1875921 ?auto_1875922 ) ) ( not ( = ?auto_1875921 ?auto_1875923 ) ) ( not ( = ?auto_1875921 ?auto_1875924 ) ) ( not ( = ?auto_1875921 ?auto_1875925 ) ) ( not ( = ?auto_1875921 ?auto_1875926 ) ) ( not ( = ?auto_1875921 ?auto_1875927 ) ) ( not ( = ?auto_1875921 ?auto_1875928 ) ) ( not ( = ?auto_1875921 ?auto_1875929 ) ) ( not ( = ?auto_1875921 ?auto_1875930 ) ) ( not ( = ?auto_1875921 ?auto_1875932 ) ) ( not ( = ?auto_1875922 ?auto_1875923 ) ) ( not ( = ?auto_1875922 ?auto_1875924 ) ) ( not ( = ?auto_1875922 ?auto_1875925 ) ) ( not ( = ?auto_1875922 ?auto_1875926 ) ) ( not ( = ?auto_1875922 ?auto_1875927 ) ) ( not ( = ?auto_1875922 ?auto_1875928 ) ) ( not ( = ?auto_1875922 ?auto_1875929 ) ) ( not ( = ?auto_1875922 ?auto_1875930 ) ) ( not ( = ?auto_1875922 ?auto_1875932 ) ) ( not ( = ?auto_1875923 ?auto_1875924 ) ) ( not ( = ?auto_1875923 ?auto_1875925 ) ) ( not ( = ?auto_1875923 ?auto_1875926 ) ) ( not ( = ?auto_1875923 ?auto_1875927 ) ) ( not ( = ?auto_1875923 ?auto_1875928 ) ) ( not ( = ?auto_1875923 ?auto_1875929 ) ) ( not ( = ?auto_1875923 ?auto_1875930 ) ) ( not ( = ?auto_1875923 ?auto_1875932 ) ) ( not ( = ?auto_1875924 ?auto_1875925 ) ) ( not ( = ?auto_1875924 ?auto_1875926 ) ) ( not ( = ?auto_1875924 ?auto_1875927 ) ) ( not ( = ?auto_1875924 ?auto_1875928 ) ) ( not ( = ?auto_1875924 ?auto_1875929 ) ) ( not ( = ?auto_1875924 ?auto_1875930 ) ) ( not ( = ?auto_1875924 ?auto_1875932 ) ) ( not ( = ?auto_1875925 ?auto_1875926 ) ) ( not ( = ?auto_1875925 ?auto_1875927 ) ) ( not ( = ?auto_1875925 ?auto_1875928 ) ) ( not ( = ?auto_1875925 ?auto_1875929 ) ) ( not ( = ?auto_1875925 ?auto_1875930 ) ) ( not ( = ?auto_1875925 ?auto_1875932 ) ) ( not ( = ?auto_1875926 ?auto_1875927 ) ) ( not ( = ?auto_1875926 ?auto_1875928 ) ) ( not ( = ?auto_1875926 ?auto_1875929 ) ) ( not ( = ?auto_1875926 ?auto_1875930 ) ) ( not ( = ?auto_1875926 ?auto_1875932 ) ) ( not ( = ?auto_1875927 ?auto_1875928 ) ) ( not ( = ?auto_1875927 ?auto_1875929 ) ) ( not ( = ?auto_1875927 ?auto_1875930 ) ) ( not ( = ?auto_1875927 ?auto_1875932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1875928 ?auto_1875929 ?auto_1875930 )
      ( MAKE-14CRATE-VERIFY ?auto_1875916 ?auto_1875917 ?auto_1875918 ?auto_1875920 ?auto_1875919 ?auto_1875921 ?auto_1875922 ?auto_1875923 ?auto_1875924 ?auto_1875925 ?auto_1875926 ?auto_1875927 ?auto_1875928 ?auto_1875929 ?auto_1875930 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1876120 - SURFACE
      ?auto_1876121 - SURFACE
      ?auto_1876122 - SURFACE
      ?auto_1876124 - SURFACE
      ?auto_1876123 - SURFACE
      ?auto_1876125 - SURFACE
      ?auto_1876126 - SURFACE
      ?auto_1876127 - SURFACE
      ?auto_1876128 - SURFACE
      ?auto_1876129 - SURFACE
      ?auto_1876130 - SURFACE
      ?auto_1876131 - SURFACE
      ?auto_1876132 - SURFACE
      ?auto_1876133 - SURFACE
      ?auto_1876134 - SURFACE
    )
    :vars
    (
      ?auto_1876140 - HOIST
      ?auto_1876136 - PLACE
      ?auto_1876138 - PLACE
      ?auto_1876135 - HOIST
      ?auto_1876139 - SURFACE
      ?auto_1876137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1876140 ?auto_1876136 ) ( IS-CRATE ?auto_1876134 ) ( not ( = ?auto_1876133 ?auto_1876134 ) ) ( not ( = ?auto_1876132 ?auto_1876133 ) ) ( not ( = ?auto_1876132 ?auto_1876134 ) ) ( not ( = ?auto_1876138 ?auto_1876136 ) ) ( HOIST-AT ?auto_1876135 ?auto_1876138 ) ( not ( = ?auto_1876140 ?auto_1876135 ) ) ( AVAILABLE ?auto_1876135 ) ( SURFACE-AT ?auto_1876134 ?auto_1876138 ) ( ON ?auto_1876134 ?auto_1876139 ) ( CLEAR ?auto_1876134 ) ( not ( = ?auto_1876133 ?auto_1876139 ) ) ( not ( = ?auto_1876134 ?auto_1876139 ) ) ( not ( = ?auto_1876132 ?auto_1876139 ) ) ( TRUCK-AT ?auto_1876137 ?auto_1876136 ) ( SURFACE-AT ?auto_1876132 ?auto_1876136 ) ( CLEAR ?auto_1876132 ) ( IS-CRATE ?auto_1876133 ) ( AVAILABLE ?auto_1876140 ) ( IN ?auto_1876133 ?auto_1876137 ) ( ON ?auto_1876121 ?auto_1876120 ) ( ON ?auto_1876122 ?auto_1876121 ) ( ON ?auto_1876124 ?auto_1876122 ) ( ON ?auto_1876123 ?auto_1876124 ) ( ON ?auto_1876125 ?auto_1876123 ) ( ON ?auto_1876126 ?auto_1876125 ) ( ON ?auto_1876127 ?auto_1876126 ) ( ON ?auto_1876128 ?auto_1876127 ) ( ON ?auto_1876129 ?auto_1876128 ) ( ON ?auto_1876130 ?auto_1876129 ) ( ON ?auto_1876131 ?auto_1876130 ) ( ON ?auto_1876132 ?auto_1876131 ) ( not ( = ?auto_1876120 ?auto_1876121 ) ) ( not ( = ?auto_1876120 ?auto_1876122 ) ) ( not ( = ?auto_1876120 ?auto_1876124 ) ) ( not ( = ?auto_1876120 ?auto_1876123 ) ) ( not ( = ?auto_1876120 ?auto_1876125 ) ) ( not ( = ?auto_1876120 ?auto_1876126 ) ) ( not ( = ?auto_1876120 ?auto_1876127 ) ) ( not ( = ?auto_1876120 ?auto_1876128 ) ) ( not ( = ?auto_1876120 ?auto_1876129 ) ) ( not ( = ?auto_1876120 ?auto_1876130 ) ) ( not ( = ?auto_1876120 ?auto_1876131 ) ) ( not ( = ?auto_1876120 ?auto_1876132 ) ) ( not ( = ?auto_1876120 ?auto_1876133 ) ) ( not ( = ?auto_1876120 ?auto_1876134 ) ) ( not ( = ?auto_1876120 ?auto_1876139 ) ) ( not ( = ?auto_1876121 ?auto_1876122 ) ) ( not ( = ?auto_1876121 ?auto_1876124 ) ) ( not ( = ?auto_1876121 ?auto_1876123 ) ) ( not ( = ?auto_1876121 ?auto_1876125 ) ) ( not ( = ?auto_1876121 ?auto_1876126 ) ) ( not ( = ?auto_1876121 ?auto_1876127 ) ) ( not ( = ?auto_1876121 ?auto_1876128 ) ) ( not ( = ?auto_1876121 ?auto_1876129 ) ) ( not ( = ?auto_1876121 ?auto_1876130 ) ) ( not ( = ?auto_1876121 ?auto_1876131 ) ) ( not ( = ?auto_1876121 ?auto_1876132 ) ) ( not ( = ?auto_1876121 ?auto_1876133 ) ) ( not ( = ?auto_1876121 ?auto_1876134 ) ) ( not ( = ?auto_1876121 ?auto_1876139 ) ) ( not ( = ?auto_1876122 ?auto_1876124 ) ) ( not ( = ?auto_1876122 ?auto_1876123 ) ) ( not ( = ?auto_1876122 ?auto_1876125 ) ) ( not ( = ?auto_1876122 ?auto_1876126 ) ) ( not ( = ?auto_1876122 ?auto_1876127 ) ) ( not ( = ?auto_1876122 ?auto_1876128 ) ) ( not ( = ?auto_1876122 ?auto_1876129 ) ) ( not ( = ?auto_1876122 ?auto_1876130 ) ) ( not ( = ?auto_1876122 ?auto_1876131 ) ) ( not ( = ?auto_1876122 ?auto_1876132 ) ) ( not ( = ?auto_1876122 ?auto_1876133 ) ) ( not ( = ?auto_1876122 ?auto_1876134 ) ) ( not ( = ?auto_1876122 ?auto_1876139 ) ) ( not ( = ?auto_1876124 ?auto_1876123 ) ) ( not ( = ?auto_1876124 ?auto_1876125 ) ) ( not ( = ?auto_1876124 ?auto_1876126 ) ) ( not ( = ?auto_1876124 ?auto_1876127 ) ) ( not ( = ?auto_1876124 ?auto_1876128 ) ) ( not ( = ?auto_1876124 ?auto_1876129 ) ) ( not ( = ?auto_1876124 ?auto_1876130 ) ) ( not ( = ?auto_1876124 ?auto_1876131 ) ) ( not ( = ?auto_1876124 ?auto_1876132 ) ) ( not ( = ?auto_1876124 ?auto_1876133 ) ) ( not ( = ?auto_1876124 ?auto_1876134 ) ) ( not ( = ?auto_1876124 ?auto_1876139 ) ) ( not ( = ?auto_1876123 ?auto_1876125 ) ) ( not ( = ?auto_1876123 ?auto_1876126 ) ) ( not ( = ?auto_1876123 ?auto_1876127 ) ) ( not ( = ?auto_1876123 ?auto_1876128 ) ) ( not ( = ?auto_1876123 ?auto_1876129 ) ) ( not ( = ?auto_1876123 ?auto_1876130 ) ) ( not ( = ?auto_1876123 ?auto_1876131 ) ) ( not ( = ?auto_1876123 ?auto_1876132 ) ) ( not ( = ?auto_1876123 ?auto_1876133 ) ) ( not ( = ?auto_1876123 ?auto_1876134 ) ) ( not ( = ?auto_1876123 ?auto_1876139 ) ) ( not ( = ?auto_1876125 ?auto_1876126 ) ) ( not ( = ?auto_1876125 ?auto_1876127 ) ) ( not ( = ?auto_1876125 ?auto_1876128 ) ) ( not ( = ?auto_1876125 ?auto_1876129 ) ) ( not ( = ?auto_1876125 ?auto_1876130 ) ) ( not ( = ?auto_1876125 ?auto_1876131 ) ) ( not ( = ?auto_1876125 ?auto_1876132 ) ) ( not ( = ?auto_1876125 ?auto_1876133 ) ) ( not ( = ?auto_1876125 ?auto_1876134 ) ) ( not ( = ?auto_1876125 ?auto_1876139 ) ) ( not ( = ?auto_1876126 ?auto_1876127 ) ) ( not ( = ?auto_1876126 ?auto_1876128 ) ) ( not ( = ?auto_1876126 ?auto_1876129 ) ) ( not ( = ?auto_1876126 ?auto_1876130 ) ) ( not ( = ?auto_1876126 ?auto_1876131 ) ) ( not ( = ?auto_1876126 ?auto_1876132 ) ) ( not ( = ?auto_1876126 ?auto_1876133 ) ) ( not ( = ?auto_1876126 ?auto_1876134 ) ) ( not ( = ?auto_1876126 ?auto_1876139 ) ) ( not ( = ?auto_1876127 ?auto_1876128 ) ) ( not ( = ?auto_1876127 ?auto_1876129 ) ) ( not ( = ?auto_1876127 ?auto_1876130 ) ) ( not ( = ?auto_1876127 ?auto_1876131 ) ) ( not ( = ?auto_1876127 ?auto_1876132 ) ) ( not ( = ?auto_1876127 ?auto_1876133 ) ) ( not ( = ?auto_1876127 ?auto_1876134 ) ) ( not ( = ?auto_1876127 ?auto_1876139 ) ) ( not ( = ?auto_1876128 ?auto_1876129 ) ) ( not ( = ?auto_1876128 ?auto_1876130 ) ) ( not ( = ?auto_1876128 ?auto_1876131 ) ) ( not ( = ?auto_1876128 ?auto_1876132 ) ) ( not ( = ?auto_1876128 ?auto_1876133 ) ) ( not ( = ?auto_1876128 ?auto_1876134 ) ) ( not ( = ?auto_1876128 ?auto_1876139 ) ) ( not ( = ?auto_1876129 ?auto_1876130 ) ) ( not ( = ?auto_1876129 ?auto_1876131 ) ) ( not ( = ?auto_1876129 ?auto_1876132 ) ) ( not ( = ?auto_1876129 ?auto_1876133 ) ) ( not ( = ?auto_1876129 ?auto_1876134 ) ) ( not ( = ?auto_1876129 ?auto_1876139 ) ) ( not ( = ?auto_1876130 ?auto_1876131 ) ) ( not ( = ?auto_1876130 ?auto_1876132 ) ) ( not ( = ?auto_1876130 ?auto_1876133 ) ) ( not ( = ?auto_1876130 ?auto_1876134 ) ) ( not ( = ?auto_1876130 ?auto_1876139 ) ) ( not ( = ?auto_1876131 ?auto_1876132 ) ) ( not ( = ?auto_1876131 ?auto_1876133 ) ) ( not ( = ?auto_1876131 ?auto_1876134 ) ) ( not ( = ?auto_1876131 ?auto_1876139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1876132 ?auto_1876133 ?auto_1876134 )
      ( MAKE-14CRATE-VERIFY ?auto_1876120 ?auto_1876121 ?auto_1876122 ?auto_1876124 ?auto_1876123 ?auto_1876125 ?auto_1876126 ?auto_1876127 ?auto_1876128 ?auto_1876129 ?auto_1876130 ?auto_1876131 ?auto_1876132 ?auto_1876133 ?auto_1876134 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893340 - SURFACE
      ?auto_1893341 - SURFACE
      ?auto_1893342 - SURFACE
      ?auto_1893344 - SURFACE
      ?auto_1893343 - SURFACE
      ?auto_1893345 - SURFACE
      ?auto_1893346 - SURFACE
      ?auto_1893347 - SURFACE
      ?auto_1893348 - SURFACE
      ?auto_1893349 - SURFACE
      ?auto_1893350 - SURFACE
      ?auto_1893351 - SURFACE
      ?auto_1893352 - SURFACE
      ?auto_1893353 - SURFACE
      ?auto_1893354 - SURFACE
      ?auto_1893355 - SURFACE
    )
    :vars
    (
      ?auto_1893357 - HOIST
      ?auto_1893356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893357 ?auto_1893356 ) ( SURFACE-AT ?auto_1893354 ?auto_1893356 ) ( CLEAR ?auto_1893354 ) ( LIFTING ?auto_1893357 ?auto_1893355 ) ( IS-CRATE ?auto_1893355 ) ( not ( = ?auto_1893354 ?auto_1893355 ) ) ( ON ?auto_1893341 ?auto_1893340 ) ( ON ?auto_1893342 ?auto_1893341 ) ( ON ?auto_1893344 ?auto_1893342 ) ( ON ?auto_1893343 ?auto_1893344 ) ( ON ?auto_1893345 ?auto_1893343 ) ( ON ?auto_1893346 ?auto_1893345 ) ( ON ?auto_1893347 ?auto_1893346 ) ( ON ?auto_1893348 ?auto_1893347 ) ( ON ?auto_1893349 ?auto_1893348 ) ( ON ?auto_1893350 ?auto_1893349 ) ( ON ?auto_1893351 ?auto_1893350 ) ( ON ?auto_1893352 ?auto_1893351 ) ( ON ?auto_1893353 ?auto_1893352 ) ( ON ?auto_1893354 ?auto_1893353 ) ( not ( = ?auto_1893340 ?auto_1893341 ) ) ( not ( = ?auto_1893340 ?auto_1893342 ) ) ( not ( = ?auto_1893340 ?auto_1893344 ) ) ( not ( = ?auto_1893340 ?auto_1893343 ) ) ( not ( = ?auto_1893340 ?auto_1893345 ) ) ( not ( = ?auto_1893340 ?auto_1893346 ) ) ( not ( = ?auto_1893340 ?auto_1893347 ) ) ( not ( = ?auto_1893340 ?auto_1893348 ) ) ( not ( = ?auto_1893340 ?auto_1893349 ) ) ( not ( = ?auto_1893340 ?auto_1893350 ) ) ( not ( = ?auto_1893340 ?auto_1893351 ) ) ( not ( = ?auto_1893340 ?auto_1893352 ) ) ( not ( = ?auto_1893340 ?auto_1893353 ) ) ( not ( = ?auto_1893340 ?auto_1893354 ) ) ( not ( = ?auto_1893340 ?auto_1893355 ) ) ( not ( = ?auto_1893341 ?auto_1893342 ) ) ( not ( = ?auto_1893341 ?auto_1893344 ) ) ( not ( = ?auto_1893341 ?auto_1893343 ) ) ( not ( = ?auto_1893341 ?auto_1893345 ) ) ( not ( = ?auto_1893341 ?auto_1893346 ) ) ( not ( = ?auto_1893341 ?auto_1893347 ) ) ( not ( = ?auto_1893341 ?auto_1893348 ) ) ( not ( = ?auto_1893341 ?auto_1893349 ) ) ( not ( = ?auto_1893341 ?auto_1893350 ) ) ( not ( = ?auto_1893341 ?auto_1893351 ) ) ( not ( = ?auto_1893341 ?auto_1893352 ) ) ( not ( = ?auto_1893341 ?auto_1893353 ) ) ( not ( = ?auto_1893341 ?auto_1893354 ) ) ( not ( = ?auto_1893341 ?auto_1893355 ) ) ( not ( = ?auto_1893342 ?auto_1893344 ) ) ( not ( = ?auto_1893342 ?auto_1893343 ) ) ( not ( = ?auto_1893342 ?auto_1893345 ) ) ( not ( = ?auto_1893342 ?auto_1893346 ) ) ( not ( = ?auto_1893342 ?auto_1893347 ) ) ( not ( = ?auto_1893342 ?auto_1893348 ) ) ( not ( = ?auto_1893342 ?auto_1893349 ) ) ( not ( = ?auto_1893342 ?auto_1893350 ) ) ( not ( = ?auto_1893342 ?auto_1893351 ) ) ( not ( = ?auto_1893342 ?auto_1893352 ) ) ( not ( = ?auto_1893342 ?auto_1893353 ) ) ( not ( = ?auto_1893342 ?auto_1893354 ) ) ( not ( = ?auto_1893342 ?auto_1893355 ) ) ( not ( = ?auto_1893344 ?auto_1893343 ) ) ( not ( = ?auto_1893344 ?auto_1893345 ) ) ( not ( = ?auto_1893344 ?auto_1893346 ) ) ( not ( = ?auto_1893344 ?auto_1893347 ) ) ( not ( = ?auto_1893344 ?auto_1893348 ) ) ( not ( = ?auto_1893344 ?auto_1893349 ) ) ( not ( = ?auto_1893344 ?auto_1893350 ) ) ( not ( = ?auto_1893344 ?auto_1893351 ) ) ( not ( = ?auto_1893344 ?auto_1893352 ) ) ( not ( = ?auto_1893344 ?auto_1893353 ) ) ( not ( = ?auto_1893344 ?auto_1893354 ) ) ( not ( = ?auto_1893344 ?auto_1893355 ) ) ( not ( = ?auto_1893343 ?auto_1893345 ) ) ( not ( = ?auto_1893343 ?auto_1893346 ) ) ( not ( = ?auto_1893343 ?auto_1893347 ) ) ( not ( = ?auto_1893343 ?auto_1893348 ) ) ( not ( = ?auto_1893343 ?auto_1893349 ) ) ( not ( = ?auto_1893343 ?auto_1893350 ) ) ( not ( = ?auto_1893343 ?auto_1893351 ) ) ( not ( = ?auto_1893343 ?auto_1893352 ) ) ( not ( = ?auto_1893343 ?auto_1893353 ) ) ( not ( = ?auto_1893343 ?auto_1893354 ) ) ( not ( = ?auto_1893343 ?auto_1893355 ) ) ( not ( = ?auto_1893345 ?auto_1893346 ) ) ( not ( = ?auto_1893345 ?auto_1893347 ) ) ( not ( = ?auto_1893345 ?auto_1893348 ) ) ( not ( = ?auto_1893345 ?auto_1893349 ) ) ( not ( = ?auto_1893345 ?auto_1893350 ) ) ( not ( = ?auto_1893345 ?auto_1893351 ) ) ( not ( = ?auto_1893345 ?auto_1893352 ) ) ( not ( = ?auto_1893345 ?auto_1893353 ) ) ( not ( = ?auto_1893345 ?auto_1893354 ) ) ( not ( = ?auto_1893345 ?auto_1893355 ) ) ( not ( = ?auto_1893346 ?auto_1893347 ) ) ( not ( = ?auto_1893346 ?auto_1893348 ) ) ( not ( = ?auto_1893346 ?auto_1893349 ) ) ( not ( = ?auto_1893346 ?auto_1893350 ) ) ( not ( = ?auto_1893346 ?auto_1893351 ) ) ( not ( = ?auto_1893346 ?auto_1893352 ) ) ( not ( = ?auto_1893346 ?auto_1893353 ) ) ( not ( = ?auto_1893346 ?auto_1893354 ) ) ( not ( = ?auto_1893346 ?auto_1893355 ) ) ( not ( = ?auto_1893347 ?auto_1893348 ) ) ( not ( = ?auto_1893347 ?auto_1893349 ) ) ( not ( = ?auto_1893347 ?auto_1893350 ) ) ( not ( = ?auto_1893347 ?auto_1893351 ) ) ( not ( = ?auto_1893347 ?auto_1893352 ) ) ( not ( = ?auto_1893347 ?auto_1893353 ) ) ( not ( = ?auto_1893347 ?auto_1893354 ) ) ( not ( = ?auto_1893347 ?auto_1893355 ) ) ( not ( = ?auto_1893348 ?auto_1893349 ) ) ( not ( = ?auto_1893348 ?auto_1893350 ) ) ( not ( = ?auto_1893348 ?auto_1893351 ) ) ( not ( = ?auto_1893348 ?auto_1893352 ) ) ( not ( = ?auto_1893348 ?auto_1893353 ) ) ( not ( = ?auto_1893348 ?auto_1893354 ) ) ( not ( = ?auto_1893348 ?auto_1893355 ) ) ( not ( = ?auto_1893349 ?auto_1893350 ) ) ( not ( = ?auto_1893349 ?auto_1893351 ) ) ( not ( = ?auto_1893349 ?auto_1893352 ) ) ( not ( = ?auto_1893349 ?auto_1893353 ) ) ( not ( = ?auto_1893349 ?auto_1893354 ) ) ( not ( = ?auto_1893349 ?auto_1893355 ) ) ( not ( = ?auto_1893350 ?auto_1893351 ) ) ( not ( = ?auto_1893350 ?auto_1893352 ) ) ( not ( = ?auto_1893350 ?auto_1893353 ) ) ( not ( = ?auto_1893350 ?auto_1893354 ) ) ( not ( = ?auto_1893350 ?auto_1893355 ) ) ( not ( = ?auto_1893351 ?auto_1893352 ) ) ( not ( = ?auto_1893351 ?auto_1893353 ) ) ( not ( = ?auto_1893351 ?auto_1893354 ) ) ( not ( = ?auto_1893351 ?auto_1893355 ) ) ( not ( = ?auto_1893352 ?auto_1893353 ) ) ( not ( = ?auto_1893352 ?auto_1893354 ) ) ( not ( = ?auto_1893352 ?auto_1893355 ) ) ( not ( = ?auto_1893353 ?auto_1893354 ) ) ( not ( = ?auto_1893353 ?auto_1893355 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1893354 ?auto_1893355 )
      ( MAKE-15CRATE-VERIFY ?auto_1893340 ?auto_1893341 ?auto_1893342 ?auto_1893344 ?auto_1893343 ?auto_1893345 ?auto_1893346 ?auto_1893347 ?auto_1893348 ?auto_1893349 ?auto_1893350 ?auto_1893351 ?auto_1893352 ?auto_1893353 ?auto_1893354 ?auto_1893355 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893519 - SURFACE
      ?auto_1893520 - SURFACE
      ?auto_1893521 - SURFACE
      ?auto_1893523 - SURFACE
      ?auto_1893522 - SURFACE
      ?auto_1893524 - SURFACE
      ?auto_1893525 - SURFACE
      ?auto_1893526 - SURFACE
      ?auto_1893527 - SURFACE
      ?auto_1893528 - SURFACE
      ?auto_1893529 - SURFACE
      ?auto_1893530 - SURFACE
      ?auto_1893531 - SURFACE
      ?auto_1893532 - SURFACE
      ?auto_1893533 - SURFACE
      ?auto_1893534 - SURFACE
    )
    :vars
    (
      ?auto_1893536 - HOIST
      ?auto_1893535 - PLACE
      ?auto_1893537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893536 ?auto_1893535 ) ( SURFACE-AT ?auto_1893533 ?auto_1893535 ) ( CLEAR ?auto_1893533 ) ( IS-CRATE ?auto_1893534 ) ( not ( = ?auto_1893533 ?auto_1893534 ) ) ( TRUCK-AT ?auto_1893537 ?auto_1893535 ) ( AVAILABLE ?auto_1893536 ) ( IN ?auto_1893534 ?auto_1893537 ) ( ON ?auto_1893533 ?auto_1893532 ) ( not ( = ?auto_1893532 ?auto_1893533 ) ) ( not ( = ?auto_1893532 ?auto_1893534 ) ) ( ON ?auto_1893520 ?auto_1893519 ) ( ON ?auto_1893521 ?auto_1893520 ) ( ON ?auto_1893523 ?auto_1893521 ) ( ON ?auto_1893522 ?auto_1893523 ) ( ON ?auto_1893524 ?auto_1893522 ) ( ON ?auto_1893525 ?auto_1893524 ) ( ON ?auto_1893526 ?auto_1893525 ) ( ON ?auto_1893527 ?auto_1893526 ) ( ON ?auto_1893528 ?auto_1893527 ) ( ON ?auto_1893529 ?auto_1893528 ) ( ON ?auto_1893530 ?auto_1893529 ) ( ON ?auto_1893531 ?auto_1893530 ) ( ON ?auto_1893532 ?auto_1893531 ) ( not ( = ?auto_1893519 ?auto_1893520 ) ) ( not ( = ?auto_1893519 ?auto_1893521 ) ) ( not ( = ?auto_1893519 ?auto_1893523 ) ) ( not ( = ?auto_1893519 ?auto_1893522 ) ) ( not ( = ?auto_1893519 ?auto_1893524 ) ) ( not ( = ?auto_1893519 ?auto_1893525 ) ) ( not ( = ?auto_1893519 ?auto_1893526 ) ) ( not ( = ?auto_1893519 ?auto_1893527 ) ) ( not ( = ?auto_1893519 ?auto_1893528 ) ) ( not ( = ?auto_1893519 ?auto_1893529 ) ) ( not ( = ?auto_1893519 ?auto_1893530 ) ) ( not ( = ?auto_1893519 ?auto_1893531 ) ) ( not ( = ?auto_1893519 ?auto_1893532 ) ) ( not ( = ?auto_1893519 ?auto_1893533 ) ) ( not ( = ?auto_1893519 ?auto_1893534 ) ) ( not ( = ?auto_1893520 ?auto_1893521 ) ) ( not ( = ?auto_1893520 ?auto_1893523 ) ) ( not ( = ?auto_1893520 ?auto_1893522 ) ) ( not ( = ?auto_1893520 ?auto_1893524 ) ) ( not ( = ?auto_1893520 ?auto_1893525 ) ) ( not ( = ?auto_1893520 ?auto_1893526 ) ) ( not ( = ?auto_1893520 ?auto_1893527 ) ) ( not ( = ?auto_1893520 ?auto_1893528 ) ) ( not ( = ?auto_1893520 ?auto_1893529 ) ) ( not ( = ?auto_1893520 ?auto_1893530 ) ) ( not ( = ?auto_1893520 ?auto_1893531 ) ) ( not ( = ?auto_1893520 ?auto_1893532 ) ) ( not ( = ?auto_1893520 ?auto_1893533 ) ) ( not ( = ?auto_1893520 ?auto_1893534 ) ) ( not ( = ?auto_1893521 ?auto_1893523 ) ) ( not ( = ?auto_1893521 ?auto_1893522 ) ) ( not ( = ?auto_1893521 ?auto_1893524 ) ) ( not ( = ?auto_1893521 ?auto_1893525 ) ) ( not ( = ?auto_1893521 ?auto_1893526 ) ) ( not ( = ?auto_1893521 ?auto_1893527 ) ) ( not ( = ?auto_1893521 ?auto_1893528 ) ) ( not ( = ?auto_1893521 ?auto_1893529 ) ) ( not ( = ?auto_1893521 ?auto_1893530 ) ) ( not ( = ?auto_1893521 ?auto_1893531 ) ) ( not ( = ?auto_1893521 ?auto_1893532 ) ) ( not ( = ?auto_1893521 ?auto_1893533 ) ) ( not ( = ?auto_1893521 ?auto_1893534 ) ) ( not ( = ?auto_1893523 ?auto_1893522 ) ) ( not ( = ?auto_1893523 ?auto_1893524 ) ) ( not ( = ?auto_1893523 ?auto_1893525 ) ) ( not ( = ?auto_1893523 ?auto_1893526 ) ) ( not ( = ?auto_1893523 ?auto_1893527 ) ) ( not ( = ?auto_1893523 ?auto_1893528 ) ) ( not ( = ?auto_1893523 ?auto_1893529 ) ) ( not ( = ?auto_1893523 ?auto_1893530 ) ) ( not ( = ?auto_1893523 ?auto_1893531 ) ) ( not ( = ?auto_1893523 ?auto_1893532 ) ) ( not ( = ?auto_1893523 ?auto_1893533 ) ) ( not ( = ?auto_1893523 ?auto_1893534 ) ) ( not ( = ?auto_1893522 ?auto_1893524 ) ) ( not ( = ?auto_1893522 ?auto_1893525 ) ) ( not ( = ?auto_1893522 ?auto_1893526 ) ) ( not ( = ?auto_1893522 ?auto_1893527 ) ) ( not ( = ?auto_1893522 ?auto_1893528 ) ) ( not ( = ?auto_1893522 ?auto_1893529 ) ) ( not ( = ?auto_1893522 ?auto_1893530 ) ) ( not ( = ?auto_1893522 ?auto_1893531 ) ) ( not ( = ?auto_1893522 ?auto_1893532 ) ) ( not ( = ?auto_1893522 ?auto_1893533 ) ) ( not ( = ?auto_1893522 ?auto_1893534 ) ) ( not ( = ?auto_1893524 ?auto_1893525 ) ) ( not ( = ?auto_1893524 ?auto_1893526 ) ) ( not ( = ?auto_1893524 ?auto_1893527 ) ) ( not ( = ?auto_1893524 ?auto_1893528 ) ) ( not ( = ?auto_1893524 ?auto_1893529 ) ) ( not ( = ?auto_1893524 ?auto_1893530 ) ) ( not ( = ?auto_1893524 ?auto_1893531 ) ) ( not ( = ?auto_1893524 ?auto_1893532 ) ) ( not ( = ?auto_1893524 ?auto_1893533 ) ) ( not ( = ?auto_1893524 ?auto_1893534 ) ) ( not ( = ?auto_1893525 ?auto_1893526 ) ) ( not ( = ?auto_1893525 ?auto_1893527 ) ) ( not ( = ?auto_1893525 ?auto_1893528 ) ) ( not ( = ?auto_1893525 ?auto_1893529 ) ) ( not ( = ?auto_1893525 ?auto_1893530 ) ) ( not ( = ?auto_1893525 ?auto_1893531 ) ) ( not ( = ?auto_1893525 ?auto_1893532 ) ) ( not ( = ?auto_1893525 ?auto_1893533 ) ) ( not ( = ?auto_1893525 ?auto_1893534 ) ) ( not ( = ?auto_1893526 ?auto_1893527 ) ) ( not ( = ?auto_1893526 ?auto_1893528 ) ) ( not ( = ?auto_1893526 ?auto_1893529 ) ) ( not ( = ?auto_1893526 ?auto_1893530 ) ) ( not ( = ?auto_1893526 ?auto_1893531 ) ) ( not ( = ?auto_1893526 ?auto_1893532 ) ) ( not ( = ?auto_1893526 ?auto_1893533 ) ) ( not ( = ?auto_1893526 ?auto_1893534 ) ) ( not ( = ?auto_1893527 ?auto_1893528 ) ) ( not ( = ?auto_1893527 ?auto_1893529 ) ) ( not ( = ?auto_1893527 ?auto_1893530 ) ) ( not ( = ?auto_1893527 ?auto_1893531 ) ) ( not ( = ?auto_1893527 ?auto_1893532 ) ) ( not ( = ?auto_1893527 ?auto_1893533 ) ) ( not ( = ?auto_1893527 ?auto_1893534 ) ) ( not ( = ?auto_1893528 ?auto_1893529 ) ) ( not ( = ?auto_1893528 ?auto_1893530 ) ) ( not ( = ?auto_1893528 ?auto_1893531 ) ) ( not ( = ?auto_1893528 ?auto_1893532 ) ) ( not ( = ?auto_1893528 ?auto_1893533 ) ) ( not ( = ?auto_1893528 ?auto_1893534 ) ) ( not ( = ?auto_1893529 ?auto_1893530 ) ) ( not ( = ?auto_1893529 ?auto_1893531 ) ) ( not ( = ?auto_1893529 ?auto_1893532 ) ) ( not ( = ?auto_1893529 ?auto_1893533 ) ) ( not ( = ?auto_1893529 ?auto_1893534 ) ) ( not ( = ?auto_1893530 ?auto_1893531 ) ) ( not ( = ?auto_1893530 ?auto_1893532 ) ) ( not ( = ?auto_1893530 ?auto_1893533 ) ) ( not ( = ?auto_1893530 ?auto_1893534 ) ) ( not ( = ?auto_1893531 ?auto_1893532 ) ) ( not ( = ?auto_1893531 ?auto_1893533 ) ) ( not ( = ?auto_1893531 ?auto_1893534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1893532 ?auto_1893533 ?auto_1893534 )
      ( MAKE-15CRATE-VERIFY ?auto_1893519 ?auto_1893520 ?auto_1893521 ?auto_1893523 ?auto_1893522 ?auto_1893524 ?auto_1893525 ?auto_1893526 ?auto_1893527 ?auto_1893528 ?auto_1893529 ?auto_1893530 ?auto_1893531 ?auto_1893532 ?auto_1893533 ?auto_1893534 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893714 - SURFACE
      ?auto_1893715 - SURFACE
      ?auto_1893716 - SURFACE
      ?auto_1893718 - SURFACE
      ?auto_1893717 - SURFACE
      ?auto_1893719 - SURFACE
      ?auto_1893720 - SURFACE
      ?auto_1893721 - SURFACE
      ?auto_1893722 - SURFACE
      ?auto_1893723 - SURFACE
      ?auto_1893724 - SURFACE
      ?auto_1893725 - SURFACE
      ?auto_1893726 - SURFACE
      ?auto_1893727 - SURFACE
      ?auto_1893728 - SURFACE
      ?auto_1893729 - SURFACE
    )
    :vars
    (
      ?auto_1893733 - HOIST
      ?auto_1893732 - PLACE
      ?auto_1893730 - TRUCK
      ?auto_1893731 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893733 ?auto_1893732 ) ( SURFACE-AT ?auto_1893728 ?auto_1893732 ) ( CLEAR ?auto_1893728 ) ( IS-CRATE ?auto_1893729 ) ( not ( = ?auto_1893728 ?auto_1893729 ) ) ( AVAILABLE ?auto_1893733 ) ( IN ?auto_1893729 ?auto_1893730 ) ( ON ?auto_1893728 ?auto_1893727 ) ( not ( = ?auto_1893727 ?auto_1893728 ) ) ( not ( = ?auto_1893727 ?auto_1893729 ) ) ( TRUCK-AT ?auto_1893730 ?auto_1893731 ) ( not ( = ?auto_1893731 ?auto_1893732 ) ) ( ON ?auto_1893715 ?auto_1893714 ) ( ON ?auto_1893716 ?auto_1893715 ) ( ON ?auto_1893718 ?auto_1893716 ) ( ON ?auto_1893717 ?auto_1893718 ) ( ON ?auto_1893719 ?auto_1893717 ) ( ON ?auto_1893720 ?auto_1893719 ) ( ON ?auto_1893721 ?auto_1893720 ) ( ON ?auto_1893722 ?auto_1893721 ) ( ON ?auto_1893723 ?auto_1893722 ) ( ON ?auto_1893724 ?auto_1893723 ) ( ON ?auto_1893725 ?auto_1893724 ) ( ON ?auto_1893726 ?auto_1893725 ) ( ON ?auto_1893727 ?auto_1893726 ) ( not ( = ?auto_1893714 ?auto_1893715 ) ) ( not ( = ?auto_1893714 ?auto_1893716 ) ) ( not ( = ?auto_1893714 ?auto_1893718 ) ) ( not ( = ?auto_1893714 ?auto_1893717 ) ) ( not ( = ?auto_1893714 ?auto_1893719 ) ) ( not ( = ?auto_1893714 ?auto_1893720 ) ) ( not ( = ?auto_1893714 ?auto_1893721 ) ) ( not ( = ?auto_1893714 ?auto_1893722 ) ) ( not ( = ?auto_1893714 ?auto_1893723 ) ) ( not ( = ?auto_1893714 ?auto_1893724 ) ) ( not ( = ?auto_1893714 ?auto_1893725 ) ) ( not ( = ?auto_1893714 ?auto_1893726 ) ) ( not ( = ?auto_1893714 ?auto_1893727 ) ) ( not ( = ?auto_1893714 ?auto_1893728 ) ) ( not ( = ?auto_1893714 ?auto_1893729 ) ) ( not ( = ?auto_1893715 ?auto_1893716 ) ) ( not ( = ?auto_1893715 ?auto_1893718 ) ) ( not ( = ?auto_1893715 ?auto_1893717 ) ) ( not ( = ?auto_1893715 ?auto_1893719 ) ) ( not ( = ?auto_1893715 ?auto_1893720 ) ) ( not ( = ?auto_1893715 ?auto_1893721 ) ) ( not ( = ?auto_1893715 ?auto_1893722 ) ) ( not ( = ?auto_1893715 ?auto_1893723 ) ) ( not ( = ?auto_1893715 ?auto_1893724 ) ) ( not ( = ?auto_1893715 ?auto_1893725 ) ) ( not ( = ?auto_1893715 ?auto_1893726 ) ) ( not ( = ?auto_1893715 ?auto_1893727 ) ) ( not ( = ?auto_1893715 ?auto_1893728 ) ) ( not ( = ?auto_1893715 ?auto_1893729 ) ) ( not ( = ?auto_1893716 ?auto_1893718 ) ) ( not ( = ?auto_1893716 ?auto_1893717 ) ) ( not ( = ?auto_1893716 ?auto_1893719 ) ) ( not ( = ?auto_1893716 ?auto_1893720 ) ) ( not ( = ?auto_1893716 ?auto_1893721 ) ) ( not ( = ?auto_1893716 ?auto_1893722 ) ) ( not ( = ?auto_1893716 ?auto_1893723 ) ) ( not ( = ?auto_1893716 ?auto_1893724 ) ) ( not ( = ?auto_1893716 ?auto_1893725 ) ) ( not ( = ?auto_1893716 ?auto_1893726 ) ) ( not ( = ?auto_1893716 ?auto_1893727 ) ) ( not ( = ?auto_1893716 ?auto_1893728 ) ) ( not ( = ?auto_1893716 ?auto_1893729 ) ) ( not ( = ?auto_1893718 ?auto_1893717 ) ) ( not ( = ?auto_1893718 ?auto_1893719 ) ) ( not ( = ?auto_1893718 ?auto_1893720 ) ) ( not ( = ?auto_1893718 ?auto_1893721 ) ) ( not ( = ?auto_1893718 ?auto_1893722 ) ) ( not ( = ?auto_1893718 ?auto_1893723 ) ) ( not ( = ?auto_1893718 ?auto_1893724 ) ) ( not ( = ?auto_1893718 ?auto_1893725 ) ) ( not ( = ?auto_1893718 ?auto_1893726 ) ) ( not ( = ?auto_1893718 ?auto_1893727 ) ) ( not ( = ?auto_1893718 ?auto_1893728 ) ) ( not ( = ?auto_1893718 ?auto_1893729 ) ) ( not ( = ?auto_1893717 ?auto_1893719 ) ) ( not ( = ?auto_1893717 ?auto_1893720 ) ) ( not ( = ?auto_1893717 ?auto_1893721 ) ) ( not ( = ?auto_1893717 ?auto_1893722 ) ) ( not ( = ?auto_1893717 ?auto_1893723 ) ) ( not ( = ?auto_1893717 ?auto_1893724 ) ) ( not ( = ?auto_1893717 ?auto_1893725 ) ) ( not ( = ?auto_1893717 ?auto_1893726 ) ) ( not ( = ?auto_1893717 ?auto_1893727 ) ) ( not ( = ?auto_1893717 ?auto_1893728 ) ) ( not ( = ?auto_1893717 ?auto_1893729 ) ) ( not ( = ?auto_1893719 ?auto_1893720 ) ) ( not ( = ?auto_1893719 ?auto_1893721 ) ) ( not ( = ?auto_1893719 ?auto_1893722 ) ) ( not ( = ?auto_1893719 ?auto_1893723 ) ) ( not ( = ?auto_1893719 ?auto_1893724 ) ) ( not ( = ?auto_1893719 ?auto_1893725 ) ) ( not ( = ?auto_1893719 ?auto_1893726 ) ) ( not ( = ?auto_1893719 ?auto_1893727 ) ) ( not ( = ?auto_1893719 ?auto_1893728 ) ) ( not ( = ?auto_1893719 ?auto_1893729 ) ) ( not ( = ?auto_1893720 ?auto_1893721 ) ) ( not ( = ?auto_1893720 ?auto_1893722 ) ) ( not ( = ?auto_1893720 ?auto_1893723 ) ) ( not ( = ?auto_1893720 ?auto_1893724 ) ) ( not ( = ?auto_1893720 ?auto_1893725 ) ) ( not ( = ?auto_1893720 ?auto_1893726 ) ) ( not ( = ?auto_1893720 ?auto_1893727 ) ) ( not ( = ?auto_1893720 ?auto_1893728 ) ) ( not ( = ?auto_1893720 ?auto_1893729 ) ) ( not ( = ?auto_1893721 ?auto_1893722 ) ) ( not ( = ?auto_1893721 ?auto_1893723 ) ) ( not ( = ?auto_1893721 ?auto_1893724 ) ) ( not ( = ?auto_1893721 ?auto_1893725 ) ) ( not ( = ?auto_1893721 ?auto_1893726 ) ) ( not ( = ?auto_1893721 ?auto_1893727 ) ) ( not ( = ?auto_1893721 ?auto_1893728 ) ) ( not ( = ?auto_1893721 ?auto_1893729 ) ) ( not ( = ?auto_1893722 ?auto_1893723 ) ) ( not ( = ?auto_1893722 ?auto_1893724 ) ) ( not ( = ?auto_1893722 ?auto_1893725 ) ) ( not ( = ?auto_1893722 ?auto_1893726 ) ) ( not ( = ?auto_1893722 ?auto_1893727 ) ) ( not ( = ?auto_1893722 ?auto_1893728 ) ) ( not ( = ?auto_1893722 ?auto_1893729 ) ) ( not ( = ?auto_1893723 ?auto_1893724 ) ) ( not ( = ?auto_1893723 ?auto_1893725 ) ) ( not ( = ?auto_1893723 ?auto_1893726 ) ) ( not ( = ?auto_1893723 ?auto_1893727 ) ) ( not ( = ?auto_1893723 ?auto_1893728 ) ) ( not ( = ?auto_1893723 ?auto_1893729 ) ) ( not ( = ?auto_1893724 ?auto_1893725 ) ) ( not ( = ?auto_1893724 ?auto_1893726 ) ) ( not ( = ?auto_1893724 ?auto_1893727 ) ) ( not ( = ?auto_1893724 ?auto_1893728 ) ) ( not ( = ?auto_1893724 ?auto_1893729 ) ) ( not ( = ?auto_1893725 ?auto_1893726 ) ) ( not ( = ?auto_1893725 ?auto_1893727 ) ) ( not ( = ?auto_1893725 ?auto_1893728 ) ) ( not ( = ?auto_1893725 ?auto_1893729 ) ) ( not ( = ?auto_1893726 ?auto_1893727 ) ) ( not ( = ?auto_1893726 ?auto_1893728 ) ) ( not ( = ?auto_1893726 ?auto_1893729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1893727 ?auto_1893728 ?auto_1893729 )
      ( MAKE-15CRATE-VERIFY ?auto_1893714 ?auto_1893715 ?auto_1893716 ?auto_1893718 ?auto_1893717 ?auto_1893719 ?auto_1893720 ?auto_1893721 ?auto_1893722 ?auto_1893723 ?auto_1893724 ?auto_1893725 ?auto_1893726 ?auto_1893727 ?auto_1893728 ?auto_1893729 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1893924 - SURFACE
      ?auto_1893925 - SURFACE
      ?auto_1893926 - SURFACE
      ?auto_1893928 - SURFACE
      ?auto_1893927 - SURFACE
      ?auto_1893929 - SURFACE
      ?auto_1893930 - SURFACE
      ?auto_1893931 - SURFACE
      ?auto_1893932 - SURFACE
      ?auto_1893933 - SURFACE
      ?auto_1893934 - SURFACE
      ?auto_1893935 - SURFACE
      ?auto_1893936 - SURFACE
      ?auto_1893937 - SURFACE
      ?auto_1893938 - SURFACE
      ?auto_1893939 - SURFACE
    )
    :vars
    (
      ?auto_1893944 - HOIST
      ?auto_1893940 - PLACE
      ?auto_1893943 - TRUCK
      ?auto_1893941 - PLACE
      ?auto_1893942 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1893944 ?auto_1893940 ) ( SURFACE-AT ?auto_1893938 ?auto_1893940 ) ( CLEAR ?auto_1893938 ) ( IS-CRATE ?auto_1893939 ) ( not ( = ?auto_1893938 ?auto_1893939 ) ) ( AVAILABLE ?auto_1893944 ) ( ON ?auto_1893938 ?auto_1893937 ) ( not ( = ?auto_1893937 ?auto_1893938 ) ) ( not ( = ?auto_1893937 ?auto_1893939 ) ) ( TRUCK-AT ?auto_1893943 ?auto_1893941 ) ( not ( = ?auto_1893941 ?auto_1893940 ) ) ( HOIST-AT ?auto_1893942 ?auto_1893941 ) ( LIFTING ?auto_1893942 ?auto_1893939 ) ( not ( = ?auto_1893944 ?auto_1893942 ) ) ( ON ?auto_1893925 ?auto_1893924 ) ( ON ?auto_1893926 ?auto_1893925 ) ( ON ?auto_1893928 ?auto_1893926 ) ( ON ?auto_1893927 ?auto_1893928 ) ( ON ?auto_1893929 ?auto_1893927 ) ( ON ?auto_1893930 ?auto_1893929 ) ( ON ?auto_1893931 ?auto_1893930 ) ( ON ?auto_1893932 ?auto_1893931 ) ( ON ?auto_1893933 ?auto_1893932 ) ( ON ?auto_1893934 ?auto_1893933 ) ( ON ?auto_1893935 ?auto_1893934 ) ( ON ?auto_1893936 ?auto_1893935 ) ( ON ?auto_1893937 ?auto_1893936 ) ( not ( = ?auto_1893924 ?auto_1893925 ) ) ( not ( = ?auto_1893924 ?auto_1893926 ) ) ( not ( = ?auto_1893924 ?auto_1893928 ) ) ( not ( = ?auto_1893924 ?auto_1893927 ) ) ( not ( = ?auto_1893924 ?auto_1893929 ) ) ( not ( = ?auto_1893924 ?auto_1893930 ) ) ( not ( = ?auto_1893924 ?auto_1893931 ) ) ( not ( = ?auto_1893924 ?auto_1893932 ) ) ( not ( = ?auto_1893924 ?auto_1893933 ) ) ( not ( = ?auto_1893924 ?auto_1893934 ) ) ( not ( = ?auto_1893924 ?auto_1893935 ) ) ( not ( = ?auto_1893924 ?auto_1893936 ) ) ( not ( = ?auto_1893924 ?auto_1893937 ) ) ( not ( = ?auto_1893924 ?auto_1893938 ) ) ( not ( = ?auto_1893924 ?auto_1893939 ) ) ( not ( = ?auto_1893925 ?auto_1893926 ) ) ( not ( = ?auto_1893925 ?auto_1893928 ) ) ( not ( = ?auto_1893925 ?auto_1893927 ) ) ( not ( = ?auto_1893925 ?auto_1893929 ) ) ( not ( = ?auto_1893925 ?auto_1893930 ) ) ( not ( = ?auto_1893925 ?auto_1893931 ) ) ( not ( = ?auto_1893925 ?auto_1893932 ) ) ( not ( = ?auto_1893925 ?auto_1893933 ) ) ( not ( = ?auto_1893925 ?auto_1893934 ) ) ( not ( = ?auto_1893925 ?auto_1893935 ) ) ( not ( = ?auto_1893925 ?auto_1893936 ) ) ( not ( = ?auto_1893925 ?auto_1893937 ) ) ( not ( = ?auto_1893925 ?auto_1893938 ) ) ( not ( = ?auto_1893925 ?auto_1893939 ) ) ( not ( = ?auto_1893926 ?auto_1893928 ) ) ( not ( = ?auto_1893926 ?auto_1893927 ) ) ( not ( = ?auto_1893926 ?auto_1893929 ) ) ( not ( = ?auto_1893926 ?auto_1893930 ) ) ( not ( = ?auto_1893926 ?auto_1893931 ) ) ( not ( = ?auto_1893926 ?auto_1893932 ) ) ( not ( = ?auto_1893926 ?auto_1893933 ) ) ( not ( = ?auto_1893926 ?auto_1893934 ) ) ( not ( = ?auto_1893926 ?auto_1893935 ) ) ( not ( = ?auto_1893926 ?auto_1893936 ) ) ( not ( = ?auto_1893926 ?auto_1893937 ) ) ( not ( = ?auto_1893926 ?auto_1893938 ) ) ( not ( = ?auto_1893926 ?auto_1893939 ) ) ( not ( = ?auto_1893928 ?auto_1893927 ) ) ( not ( = ?auto_1893928 ?auto_1893929 ) ) ( not ( = ?auto_1893928 ?auto_1893930 ) ) ( not ( = ?auto_1893928 ?auto_1893931 ) ) ( not ( = ?auto_1893928 ?auto_1893932 ) ) ( not ( = ?auto_1893928 ?auto_1893933 ) ) ( not ( = ?auto_1893928 ?auto_1893934 ) ) ( not ( = ?auto_1893928 ?auto_1893935 ) ) ( not ( = ?auto_1893928 ?auto_1893936 ) ) ( not ( = ?auto_1893928 ?auto_1893937 ) ) ( not ( = ?auto_1893928 ?auto_1893938 ) ) ( not ( = ?auto_1893928 ?auto_1893939 ) ) ( not ( = ?auto_1893927 ?auto_1893929 ) ) ( not ( = ?auto_1893927 ?auto_1893930 ) ) ( not ( = ?auto_1893927 ?auto_1893931 ) ) ( not ( = ?auto_1893927 ?auto_1893932 ) ) ( not ( = ?auto_1893927 ?auto_1893933 ) ) ( not ( = ?auto_1893927 ?auto_1893934 ) ) ( not ( = ?auto_1893927 ?auto_1893935 ) ) ( not ( = ?auto_1893927 ?auto_1893936 ) ) ( not ( = ?auto_1893927 ?auto_1893937 ) ) ( not ( = ?auto_1893927 ?auto_1893938 ) ) ( not ( = ?auto_1893927 ?auto_1893939 ) ) ( not ( = ?auto_1893929 ?auto_1893930 ) ) ( not ( = ?auto_1893929 ?auto_1893931 ) ) ( not ( = ?auto_1893929 ?auto_1893932 ) ) ( not ( = ?auto_1893929 ?auto_1893933 ) ) ( not ( = ?auto_1893929 ?auto_1893934 ) ) ( not ( = ?auto_1893929 ?auto_1893935 ) ) ( not ( = ?auto_1893929 ?auto_1893936 ) ) ( not ( = ?auto_1893929 ?auto_1893937 ) ) ( not ( = ?auto_1893929 ?auto_1893938 ) ) ( not ( = ?auto_1893929 ?auto_1893939 ) ) ( not ( = ?auto_1893930 ?auto_1893931 ) ) ( not ( = ?auto_1893930 ?auto_1893932 ) ) ( not ( = ?auto_1893930 ?auto_1893933 ) ) ( not ( = ?auto_1893930 ?auto_1893934 ) ) ( not ( = ?auto_1893930 ?auto_1893935 ) ) ( not ( = ?auto_1893930 ?auto_1893936 ) ) ( not ( = ?auto_1893930 ?auto_1893937 ) ) ( not ( = ?auto_1893930 ?auto_1893938 ) ) ( not ( = ?auto_1893930 ?auto_1893939 ) ) ( not ( = ?auto_1893931 ?auto_1893932 ) ) ( not ( = ?auto_1893931 ?auto_1893933 ) ) ( not ( = ?auto_1893931 ?auto_1893934 ) ) ( not ( = ?auto_1893931 ?auto_1893935 ) ) ( not ( = ?auto_1893931 ?auto_1893936 ) ) ( not ( = ?auto_1893931 ?auto_1893937 ) ) ( not ( = ?auto_1893931 ?auto_1893938 ) ) ( not ( = ?auto_1893931 ?auto_1893939 ) ) ( not ( = ?auto_1893932 ?auto_1893933 ) ) ( not ( = ?auto_1893932 ?auto_1893934 ) ) ( not ( = ?auto_1893932 ?auto_1893935 ) ) ( not ( = ?auto_1893932 ?auto_1893936 ) ) ( not ( = ?auto_1893932 ?auto_1893937 ) ) ( not ( = ?auto_1893932 ?auto_1893938 ) ) ( not ( = ?auto_1893932 ?auto_1893939 ) ) ( not ( = ?auto_1893933 ?auto_1893934 ) ) ( not ( = ?auto_1893933 ?auto_1893935 ) ) ( not ( = ?auto_1893933 ?auto_1893936 ) ) ( not ( = ?auto_1893933 ?auto_1893937 ) ) ( not ( = ?auto_1893933 ?auto_1893938 ) ) ( not ( = ?auto_1893933 ?auto_1893939 ) ) ( not ( = ?auto_1893934 ?auto_1893935 ) ) ( not ( = ?auto_1893934 ?auto_1893936 ) ) ( not ( = ?auto_1893934 ?auto_1893937 ) ) ( not ( = ?auto_1893934 ?auto_1893938 ) ) ( not ( = ?auto_1893934 ?auto_1893939 ) ) ( not ( = ?auto_1893935 ?auto_1893936 ) ) ( not ( = ?auto_1893935 ?auto_1893937 ) ) ( not ( = ?auto_1893935 ?auto_1893938 ) ) ( not ( = ?auto_1893935 ?auto_1893939 ) ) ( not ( = ?auto_1893936 ?auto_1893937 ) ) ( not ( = ?auto_1893936 ?auto_1893938 ) ) ( not ( = ?auto_1893936 ?auto_1893939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1893937 ?auto_1893938 ?auto_1893939 )
      ( MAKE-15CRATE-VERIFY ?auto_1893924 ?auto_1893925 ?auto_1893926 ?auto_1893928 ?auto_1893927 ?auto_1893929 ?auto_1893930 ?auto_1893931 ?auto_1893932 ?auto_1893933 ?auto_1893934 ?auto_1893935 ?auto_1893936 ?auto_1893937 ?auto_1893938 ?auto_1893939 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894149 - SURFACE
      ?auto_1894150 - SURFACE
      ?auto_1894151 - SURFACE
      ?auto_1894153 - SURFACE
      ?auto_1894152 - SURFACE
      ?auto_1894154 - SURFACE
      ?auto_1894155 - SURFACE
      ?auto_1894156 - SURFACE
      ?auto_1894157 - SURFACE
      ?auto_1894158 - SURFACE
      ?auto_1894159 - SURFACE
      ?auto_1894160 - SURFACE
      ?auto_1894161 - SURFACE
      ?auto_1894162 - SURFACE
      ?auto_1894163 - SURFACE
      ?auto_1894164 - SURFACE
    )
    :vars
    (
      ?auto_1894167 - HOIST
      ?auto_1894166 - PLACE
      ?auto_1894168 - TRUCK
      ?auto_1894170 - PLACE
      ?auto_1894165 - HOIST
      ?auto_1894169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894167 ?auto_1894166 ) ( SURFACE-AT ?auto_1894163 ?auto_1894166 ) ( CLEAR ?auto_1894163 ) ( IS-CRATE ?auto_1894164 ) ( not ( = ?auto_1894163 ?auto_1894164 ) ) ( AVAILABLE ?auto_1894167 ) ( ON ?auto_1894163 ?auto_1894162 ) ( not ( = ?auto_1894162 ?auto_1894163 ) ) ( not ( = ?auto_1894162 ?auto_1894164 ) ) ( TRUCK-AT ?auto_1894168 ?auto_1894170 ) ( not ( = ?auto_1894170 ?auto_1894166 ) ) ( HOIST-AT ?auto_1894165 ?auto_1894170 ) ( not ( = ?auto_1894167 ?auto_1894165 ) ) ( AVAILABLE ?auto_1894165 ) ( SURFACE-AT ?auto_1894164 ?auto_1894170 ) ( ON ?auto_1894164 ?auto_1894169 ) ( CLEAR ?auto_1894164 ) ( not ( = ?auto_1894163 ?auto_1894169 ) ) ( not ( = ?auto_1894164 ?auto_1894169 ) ) ( not ( = ?auto_1894162 ?auto_1894169 ) ) ( ON ?auto_1894150 ?auto_1894149 ) ( ON ?auto_1894151 ?auto_1894150 ) ( ON ?auto_1894153 ?auto_1894151 ) ( ON ?auto_1894152 ?auto_1894153 ) ( ON ?auto_1894154 ?auto_1894152 ) ( ON ?auto_1894155 ?auto_1894154 ) ( ON ?auto_1894156 ?auto_1894155 ) ( ON ?auto_1894157 ?auto_1894156 ) ( ON ?auto_1894158 ?auto_1894157 ) ( ON ?auto_1894159 ?auto_1894158 ) ( ON ?auto_1894160 ?auto_1894159 ) ( ON ?auto_1894161 ?auto_1894160 ) ( ON ?auto_1894162 ?auto_1894161 ) ( not ( = ?auto_1894149 ?auto_1894150 ) ) ( not ( = ?auto_1894149 ?auto_1894151 ) ) ( not ( = ?auto_1894149 ?auto_1894153 ) ) ( not ( = ?auto_1894149 ?auto_1894152 ) ) ( not ( = ?auto_1894149 ?auto_1894154 ) ) ( not ( = ?auto_1894149 ?auto_1894155 ) ) ( not ( = ?auto_1894149 ?auto_1894156 ) ) ( not ( = ?auto_1894149 ?auto_1894157 ) ) ( not ( = ?auto_1894149 ?auto_1894158 ) ) ( not ( = ?auto_1894149 ?auto_1894159 ) ) ( not ( = ?auto_1894149 ?auto_1894160 ) ) ( not ( = ?auto_1894149 ?auto_1894161 ) ) ( not ( = ?auto_1894149 ?auto_1894162 ) ) ( not ( = ?auto_1894149 ?auto_1894163 ) ) ( not ( = ?auto_1894149 ?auto_1894164 ) ) ( not ( = ?auto_1894149 ?auto_1894169 ) ) ( not ( = ?auto_1894150 ?auto_1894151 ) ) ( not ( = ?auto_1894150 ?auto_1894153 ) ) ( not ( = ?auto_1894150 ?auto_1894152 ) ) ( not ( = ?auto_1894150 ?auto_1894154 ) ) ( not ( = ?auto_1894150 ?auto_1894155 ) ) ( not ( = ?auto_1894150 ?auto_1894156 ) ) ( not ( = ?auto_1894150 ?auto_1894157 ) ) ( not ( = ?auto_1894150 ?auto_1894158 ) ) ( not ( = ?auto_1894150 ?auto_1894159 ) ) ( not ( = ?auto_1894150 ?auto_1894160 ) ) ( not ( = ?auto_1894150 ?auto_1894161 ) ) ( not ( = ?auto_1894150 ?auto_1894162 ) ) ( not ( = ?auto_1894150 ?auto_1894163 ) ) ( not ( = ?auto_1894150 ?auto_1894164 ) ) ( not ( = ?auto_1894150 ?auto_1894169 ) ) ( not ( = ?auto_1894151 ?auto_1894153 ) ) ( not ( = ?auto_1894151 ?auto_1894152 ) ) ( not ( = ?auto_1894151 ?auto_1894154 ) ) ( not ( = ?auto_1894151 ?auto_1894155 ) ) ( not ( = ?auto_1894151 ?auto_1894156 ) ) ( not ( = ?auto_1894151 ?auto_1894157 ) ) ( not ( = ?auto_1894151 ?auto_1894158 ) ) ( not ( = ?auto_1894151 ?auto_1894159 ) ) ( not ( = ?auto_1894151 ?auto_1894160 ) ) ( not ( = ?auto_1894151 ?auto_1894161 ) ) ( not ( = ?auto_1894151 ?auto_1894162 ) ) ( not ( = ?auto_1894151 ?auto_1894163 ) ) ( not ( = ?auto_1894151 ?auto_1894164 ) ) ( not ( = ?auto_1894151 ?auto_1894169 ) ) ( not ( = ?auto_1894153 ?auto_1894152 ) ) ( not ( = ?auto_1894153 ?auto_1894154 ) ) ( not ( = ?auto_1894153 ?auto_1894155 ) ) ( not ( = ?auto_1894153 ?auto_1894156 ) ) ( not ( = ?auto_1894153 ?auto_1894157 ) ) ( not ( = ?auto_1894153 ?auto_1894158 ) ) ( not ( = ?auto_1894153 ?auto_1894159 ) ) ( not ( = ?auto_1894153 ?auto_1894160 ) ) ( not ( = ?auto_1894153 ?auto_1894161 ) ) ( not ( = ?auto_1894153 ?auto_1894162 ) ) ( not ( = ?auto_1894153 ?auto_1894163 ) ) ( not ( = ?auto_1894153 ?auto_1894164 ) ) ( not ( = ?auto_1894153 ?auto_1894169 ) ) ( not ( = ?auto_1894152 ?auto_1894154 ) ) ( not ( = ?auto_1894152 ?auto_1894155 ) ) ( not ( = ?auto_1894152 ?auto_1894156 ) ) ( not ( = ?auto_1894152 ?auto_1894157 ) ) ( not ( = ?auto_1894152 ?auto_1894158 ) ) ( not ( = ?auto_1894152 ?auto_1894159 ) ) ( not ( = ?auto_1894152 ?auto_1894160 ) ) ( not ( = ?auto_1894152 ?auto_1894161 ) ) ( not ( = ?auto_1894152 ?auto_1894162 ) ) ( not ( = ?auto_1894152 ?auto_1894163 ) ) ( not ( = ?auto_1894152 ?auto_1894164 ) ) ( not ( = ?auto_1894152 ?auto_1894169 ) ) ( not ( = ?auto_1894154 ?auto_1894155 ) ) ( not ( = ?auto_1894154 ?auto_1894156 ) ) ( not ( = ?auto_1894154 ?auto_1894157 ) ) ( not ( = ?auto_1894154 ?auto_1894158 ) ) ( not ( = ?auto_1894154 ?auto_1894159 ) ) ( not ( = ?auto_1894154 ?auto_1894160 ) ) ( not ( = ?auto_1894154 ?auto_1894161 ) ) ( not ( = ?auto_1894154 ?auto_1894162 ) ) ( not ( = ?auto_1894154 ?auto_1894163 ) ) ( not ( = ?auto_1894154 ?auto_1894164 ) ) ( not ( = ?auto_1894154 ?auto_1894169 ) ) ( not ( = ?auto_1894155 ?auto_1894156 ) ) ( not ( = ?auto_1894155 ?auto_1894157 ) ) ( not ( = ?auto_1894155 ?auto_1894158 ) ) ( not ( = ?auto_1894155 ?auto_1894159 ) ) ( not ( = ?auto_1894155 ?auto_1894160 ) ) ( not ( = ?auto_1894155 ?auto_1894161 ) ) ( not ( = ?auto_1894155 ?auto_1894162 ) ) ( not ( = ?auto_1894155 ?auto_1894163 ) ) ( not ( = ?auto_1894155 ?auto_1894164 ) ) ( not ( = ?auto_1894155 ?auto_1894169 ) ) ( not ( = ?auto_1894156 ?auto_1894157 ) ) ( not ( = ?auto_1894156 ?auto_1894158 ) ) ( not ( = ?auto_1894156 ?auto_1894159 ) ) ( not ( = ?auto_1894156 ?auto_1894160 ) ) ( not ( = ?auto_1894156 ?auto_1894161 ) ) ( not ( = ?auto_1894156 ?auto_1894162 ) ) ( not ( = ?auto_1894156 ?auto_1894163 ) ) ( not ( = ?auto_1894156 ?auto_1894164 ) ) ( not ( = ?auto_1894156 ?auto_1894169 ) ) ( not ( = ?auto_1894157 ?auto_1894158 ) ) ( not ( = ?auto_1894157 ?auto_1894159 ) ) ( not ( = ?auto_1894157 ?auto_1894160 ) ) ( not ( = ?auto_1894157 ?auto_1894161 ) ) ( not ( = ?auto_1894157 ?auto_1894162 ) ) ( not ( = ?auto_1894157 ?auto_1894163 ) ) ( not ( = ?auto_1894157 ?auto_1894164 ) ) ( not ( = ?auto_1894157 ?auto_1894169 ) ) ( not ( = ?auto_1894158 ?auto_1894159 ) ) ( not ( = ?auto_1894158 ?auto_1894160 ) ) ( not ( = ?auto_1894158 ?auto_1894161 ) ) ( not ( = ?auto_1894158 ?auto_1894162 ) ) ( not ( = ?auto_1894158 ?auto_1894163 ) ) ( not ( = ?auto_1894158 ?auto_1894164 ) ) ( not ( = ?auto_1894158 ?auto_1894169 ) ) ( not ( = ?auto_1894159 ?auto_1894160 ) ) ( not ( = ?auto_1894159 ?auto_1894161 ) ) ( not ( = ?auto_1894159 ?auto_1894162 ) ) ( not ( = ?auto_1894159 ?auto_1894163 ) ) ( not ( = ?auto_1894159 ?auto_1894164 ) ) ( not ( = ?auto_1894159 ?auto_1894169 ) ) ( not ( = ?auto_1894160 ?auto_1894161 ) ) ( not ( = ?auto_1894160 ?auto_1894162 ) ) ( not ( = ?auto_1894160 ?auto_1894163 ) ) ( not ( = ?auto_1894160 ?auto_1894164 ) ) ( not ( = ?auto_1894160 ?auto_1894169 ) ) ( not ( = ?auto_1894161 ?auto_1894162 ) ) ( not ( = ?auto_1894161 ?auto_1894163 ) ) ( not ( = ?auto_1894161 ?auto_1894164 ) ) ( not ( = ?auto_1894161 ?auto_1894169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894162 ?auto_1894163 ?auto_1894164 )
      ( MAKE-15CRATE-VERIFY ?auto_1894149 ?auto_1894150 ?auto_1894151 ?auto_1894153 ?auto_1894152 ?auto_1894154 ?auto_1894155 ?auto_1894156 ?auto_1894157 ?auto_1894158 ?auto_1894159 ?auto_1894160 ?auto_1894161 ?auto_1894162 ?auto_1894163 ?auto_1894164 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894375 - SURFACE
      ?auto_1894376 - SURFACE
      ?auto_1894377 - SURFACE
      ?auto_1894379 - SURFACE
      ?auto_1894378 - SURFACE
      ?auto_1894380 - SURFACE
      ?auto_1894381 - SURFACE
      ?auto_1894382 - SURFACE
      ?auto_1894383 - SURFACE
      ?auto_1894384 - SURFACE
      ?auto_1894385 - SURFACE
      ?auto_1894386 - SURFACE
      ?auto_1894387 - SURFACE
      ?auto_1894388 - SURFACE
      ?auto_1894389 - SURFACE
      ?auto_1894390 - SURFACE
    )
    :vars
    (
      ?auto_1894392 - HOIST
      ?auto_1894396 - PLACE
      ?auto_1894394 - PLACE
      ?auto_1894391 - HOIST
      ?auto_1894393 - SURFACE
      ?auto_1894395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894392 ?auto_1894396 ) ( SURFACE-AT ?auto_1894389 ?auto_1894396 ) ( CLEAR ?auto_1894389 ) ( IS-CRATE ?auto_1894390 ) ( not ( = ?auto_1894389 ?auto_1894390 ) ) ( AVAILABLE ?auto_1894392 ) ( ON ?auto_1894389 ?auto_1894388 ) ( not ( = ?auto_1894388 ?auto_1894389 ) ) ( not ( = ?auto_1894388 ?auto_1894390 ) ) ( not ( = ?auto_1894394 ?auto_1894396 ) ) ( HOIST-AT ?auto_1894391 ?auto_1894394 ) ( not ( = ?auto_1894392 ?auto_1894391 ) ) ( AVAILABLE ?auto_1894391 ) ( SURFACE-AT ?auto_1894390 ?auto_1894394 ) ( ON ?auto_1894390 ?auto_1894393 ) ( CLEAR ?auto_1894390 ) ( not ( = ?auto_1894389 ?auto_1894393 ) ) ( not ( = ?auto_1894390 ?auto_1894393 ) ) ( not ( = ?auto_1894388 ?auto_1894393 ) ) ( TRUCK-AT ?auto_1894395 ?auto_1894396 ) ( ON ?auto_1894376 ?auto_1894375 ) ( ON ?auto_1894377 ?auto_1894376 ) ( ON ?auto_1894379 ?auto_1894377 ) ( ON ?auto_1894378 ?auto_1894379 ) ( ON ?auto_1894380 ?auto_1894378 ) ( ON ?auto_1894381 ?auto_1894380 ) ( ON ?auto_1894382 ?auto_1894381 ) ( ON ?auto_1894383 ?auto_1894382 ) ( ON ?auto_1894384 ?auto_1894383 ) ( ON ?auto_1894385 ?auto_1894384 ) ( ON ?auto_1894386 ?auto_1894385 ) ( ON ?auto_1894387 ?auto_1894386 ) ( ON ?auto_1894388 ?auto_1894387 ) ( not ( = ?auto_1894375 ?auto_1894376 ) ) ( not ( = ?auto_1894375 ?auto_1894377 ) ) ( not ( = ?auto_1894375 ?auto_1894379 ) ) ( not ( = ?auto_1894375 ?auto_1894378 ) ) ( not ( = ?auto_1894375 ?auto_1894380 ) ) ( not ( = ?auto_1894375 ?auto_1894381 ) ) ( not ( = ?auto_1894375 ?auto_1894382 ) ) ( not ( = ?auto_1894375 ?auto_1894383 ) ) ( not ( = ?auto_1894375 ?auto_1894384 ) ) ( not ( = ?auto_1894375 ?auto_1894385 ) ) ( not ( = ?auto_1894375 ?auto_1894386 ) ) ( not ( = ?auto_1894375 ?auto_1894387 ) ) ( not ( = ?auto_1894375 ?auto_1894388 ) ) ( not ( = ?auto_1894375 ?auto_1894389 ) ) ( not ( = ?auto_1894375 ?auto_1894390 ) ) ( not ( = ?auto_1894375 ?auto_1894393 ) ) ( not ( = ?auto_1894376 ?auto_1894377 ) ) ( not ( = ?auto_1894376 ?auto_1894379 ) ) ( not ( = ?auto_1894376 ?auto_1894378 ) ) ( not ( = ?auto_1894376 ?auto_1894380 ) ) ( not ( = ?auto_1894376 ?auto_1894381 ) ) ( not ( = ?auto_1894376 ?auto_1894382 ) ) ( not ( = ?auto_1894376 ?auto_1894383 ) ) ( not ( = ?auto_1894376 ?auto_1894384 ) ) ( not ( = ?auto_1894376 ?auto_1894385 ) ) ( not ( = ?auto_1894376 ?auto_1894386 ) ) ( not ( = ?auto_1894376 ?auto_1894387 ) ) ( not ( = ?auto_1894376 ?auto_1894388 ) ) ( not ( = ?auto_1894376 ?auto_1894389 ) ) ( not ( = ?auto_1894376 ?auto_1894390 ) ) ( not ( = ?auto_1894376 ?auto_1894393 ) ) ( not ( = ?auto_1894377 ?auto_1894379 ) ) ( not ( = ?auto_1894377 ?auto_1894378 ) ) ( not ( = ?auto_1894377 ?auto_1894380 ) ) ( not ( = ?auto_1894377 ?auto_1894381 ) ) ( not ( = ?auto_1894377 ?auto_1894382 ) ) ( not ( = ?auto_1894377 ?auto_1894383 ) ) ( not ( = ?auto_1894377 ?auto_1894384 ) ) ( not ( = ?auto_1894377 ?auto_1894385 ) ) ( not ( = ?auto_1894377 ?auto_1894386 ) ) ( not ( = ?auto_1894377 ?auto_1894387 ) ) ( not ( = ?auto_1894377 ?auto_1894388 ) ) ( not ( = ?auto_1894377 ?auto_1894389 ) ) ( not ( = ?auto_1894377 ?auto_1894390 ) ) ( not ( = ?auto_1894377 ?auto_1894393 ) ) ( not ( = ?auto_1894379 ?auto_1894378 ) ) ( not ( = ?auto_1894379 ?auto_1894380 ) ) ( not ( = ?auto_1894379 ?auto_1894381 ) ) ( not ( = ?auto_1894379 ?auto_1894382 ) ) ( not ( = ?auto_1894379 ?auto_1894383 ) ) ( not ( = ?auto_1894379 ?auto_1894384 ) ) ( not ( = ?auto_1894379 ?auto_1894385 ) ) ( not ( = ?auto_1894379 ?auto_1894386 ) ) ( not ( = ?auto_1894379 ?auto_1894387 ) ) ( not ( = ?auto_1894379 ?auto_1894388 ) ) ( not ( = ?auto_1894379 ?auto_1894389 ) ) ( not ( = ?auto_1894379 ?auto_1894390 ) ) ( not ( = ?auto_1894379 ?auto_1894393 ) ) ( not ( = ?auto_1894378 ?auto_1894380 ) ) ( not ( = ?auto_1894378 ?auto_1894381 ) ) ( not ( = ?auto_1894378 ?auto_1894382 ) ) ( not ( = ?auto_1894378 ?auto_1894383 ) ) ( not ( = ?auto_1894378 ?auto_1894384 ) ) ( not ( = ?auto_1894378 ?auto_1894385 ) ) ( not ( = ?auto_1894378 ?auto_1894386 ) ) ( not ( = ?auto_1894378 ?auto_1894387 ) ) ( not ( = ?auto_1894378 ?auto_1894388 ) ) ( not ( = ?auto_1894378 ?auto_1894389 ) ) ( not ( = ?auto_1894378 ?auto_1894390 ) ) ( not ( = ?auto_1894378 ?auto_1894393 ) ) ( not ( = ?auto_1894380 ?auto_1894381 ) ) ( not ( = ?auto_1894380 ?auto_1894382 ) ) ( not ( = ?auto_1894380 ?auto_1894383 ) ) ( not ( = ?auto_1894380 ?auto_1894384 ) ) ( not ( = ?auto_1894380 ?auto_1894385 ) ) ( not ( = ?auto_1894380 ?auto_1894386 ) ) ( not ( = ?auto_1894380 ?auto_1894387 ) ) ( not ( = ?auto_1894380 ?auto_1894388 ) ) ( not ( = ?auto_1894380 ?auto_1894389 ) ) ( not ( = ?auto_1894380 ?auto_1894390 ) ) ( not ( = ?auto_1894380 ?auto_1894393 ) ) ( not ( = ?auto_1894381 ?auto_1894382 ) ) ( not ( = ?auto_1894381 ?auto_1894383 ) ) ( not ( = ?auto_1894381 ?auto_1894384 ) ) ( not ( = ?auto_1894381 ?auto_1894385 ) ) ( not ( = ?auto_1894381 ?auto_1894386 ) ) ( not ( = ?auto_1894381 ?auto_1894387 ) ) ( not ( = ?auto_1894381 ?auto_1894388 ) ) ( not ( = ?auto_1894381 ?auto_1894389 ) ) ( not ( = ?auto_1894381 ?auto_1894390 ) ) ( not ( = ?auto_1894381 ?auto_1894393 ) ) ( not ( = ?auto_1894382 ?auto_1894383 ) ) ( not ( = ?auto_1894382 ?auto_1894384 ) ) ( not ( = ?auto_1894382 ?auto_1894385 ) ) ( not ( = ?auto_1894382 ?auto_1894386 ) ) ( not ( = ?auto_1894382 ?auto_1894387 ) ) ( not ( = ?auto_1894382 ?auto_1894388 ) ) ( not ( = ?auto_1894382 ?auto_1894389 ) ) ( not ( = ?auto_1894382 ?auto_1894390 ) ) ( not ( = ?auto_1894382 ?auto_1894393 ) ) ( not ( = ?auto_1894383 ?auto_1894384 ) ) ( not ( = ?auto_1894383 ?auto_1894385 ) ) ( not ( = ?auto_1894383 ?auto_1894386 ) ) ( not ( = ?auto_1894383 ?auto_1894387 ) ) ( not ( = ?auto_1894383 ?auto_1894388 ) ) ( not ( = ?auto_1894383 ?auto_1894389 ) ) ( not ( = ?auto_1894383 ?auto_1894390 ) ) ( not ( = ?auto_1894383 ?auto_1894393 ) ) ( not ( = ?auto_1894384 ?auto_1894385 ) ) ( not ( = ?auto_1894384 ?auto_1894386 ) ) ( not ( = ?auto_1894384 ?auto_1894387 ) ) ( not ( = ?auto_1894384 ?auto_1894388 ) ) ( not ( = ?auto_1894384 ?auto_1894389 ) ) ( not ( = ?auto_1894384 ?auto_1894390 ) ) ( not ( = ?auto_1894384 ?auto_1894393 ) ) ( not ( = ?auto_1894385 ?auto_1894386 ) ) ( not ( = ?auto_1894385 ?auto_1894387 ) ) ( not ( = ?auto_1894385 ?auto_1894388 ) ) ( not ( = ?auto_1894385 ?auto_1894389 ) ) ( not ( = ?auto_1894385 ?auto_1894390 ) ) ( not ( = ?auto_1894385 ?auto_1894393 ) ) ( not ( = ?auto_1894386 ?auto_1894387 ) ) ( not ( = ?auto_1894386 ?auto_1894388 ) ) ( not ( = ?auto_1894386 ?auto_1894389 ) ) ( not ( = ?auto_1894386 ?auto_1894390 ) ) ( not ( = ?auto_1894386 ?auto_1894393 ) ) ( not ( = ?auto_1894387 ?auto_1894388 ) ) ( not ( = ?auto_1894387 ?auto_1894389 ) ) ( not ( = ?auto_1894387 ?auto_1894390 ) ) ( not ( = ?auto_1894387 ?auto_1894393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894388 ?auto_1894389 ?auto_1894390 )
      ( MAKE-15CRATE-VERIFY ?auto_1894375 ?auto_1894376 ?auto_1894377 ?auto_1894379 ?auto_1894378 ?auto_1894380 ?auto_1894381 ?auto_1894382 ?auto_1894383 ?auto_1894384 ?auto_1894385 ?auto_1894386 ?auto_1894387 ?auto_1894388 ?auto_1894389 ?auto_1894390 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894601 - SURFACE
      ?auto_1894602 - SURFACE
      ?auto_1894603 - SURFACE
      ?auto_1894605 - SURFACE
      ?auto_1894604 - SURFACE
      ?auto_1894606 - SURFACE
      ?auto_1894607 - SURFACE
      ?auto_1894608 - SURFACE
      ?auto_1894609 - SURFACE
      ?auto_1894610 - SURFACE
      ?auto_1894611 - SURFACE
      ?auto_1894612 - SURFACE
      ?auto_1894613 - SURFACE
      ?auto_1894614 - SURFACE
      ?auto_1894615 - SURFACE
      ?auto_1894616 - SURFACE
    )
    :vars
    (
      ?auto_1894617 - HOIST
      ?auto_1894618 - PLACE
      ?auto_1894619 - PLACE
      ?auto_1894620 - HOIST
      ?auto_1894621 - SURFACE
      ?auto_1894622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894617 ?auto_1894618 ) ( IS-CRATE ?auto_1894616 ) ( not ( = ?auto_1894615 ?auto_1894616 ) ) ( not ( = ?auto_1894614 ?auto_1894615 ) ) ( not ( = ?auto_1894614 ?auto_1894616 ) ) ( not ( = ?auto_1894619 ?auto_1894618 ) ) ( HOIST-AT ?auto_1894620 ?auto_1894619 ) ( not ( = ?auto_1894617 ?auto_1894620 ) ) ( AVAILABLE ?auto_1894620 ) ( SURFACE-AT ?auto_1894616 ?auto_1894619 ) ( ON ?auto_1894616 ?auto_1894621 ) ( CLEAR ?auto_1894616 ) ( not ( = ?auto_1894615 ?auto_1894621 ) ) ( not ( = ?auto_1894616 ?auto_1894621 ) ) ( not ( = ?auto_1894614 ?auto_1894621 ) ) ( TRUCK-AT ?auto_1894622 ?auto_1894618 ) ( SURFACE-AT ?auto_1894614 ?auto_1894618 ) ( CLEAR ?auto_1894614 ) ( LIFTING ?auto_1894617 ?auto_1894615 ) ( IS-CRATE ?auto_1894615 ) ( ON ?auto_1894602 ?auto_1894601 ) ( ON ?auto_1894603 ?auto_1894602 ) ( ON ?auto_1894605 ?auto_1894603 ) ( ON ?auto_1894604 ?auto_1894605 ) ( ON ?auto_1894606 ?auto_1894604 ) ( ON ?auto_1894607 ?auto_1894606 ) ( ON ?auto_1894608 ?auto_1894607 ) ( ON ?auto_1894609 ?auto_1894608 ) ( ON ?auto_1894610 ?auto_1894609 ) ( ON ?auto_1894611 ?auto_1894610 ) ( ON ?auto_1894612 ?auto_1894611 ) ( ON ?auto_1894613 ?auto_1894612 ) ( ON ?auto_1894614 ?auto_1894613 ) ( not ( = ?auto_1894601 ?auto_1894602 ) ) ( not ( = ?auto_1894601 ?auto_1894603 ) ) ( not ( = ?auto_1894601 ?auto_1894605 ) ) ( not ( = ?auto_1894601 ?auto_1894604 ) ) ( not ( = ?auto_1894601 ?auto_1894606 ) ) ( not ( = ?auto_1894601 ?auto_1894607 ) ) ( not ( = ?auto_1894601 ?auto_1894608 ) ) ( not ( = ?auto_1894601 ?auto_1894609 ) ) ( not ( = ?auto_1894601 ?auto_1894610 ) ) ( not ( = ?auto_1894601 ?auto_1894611 ) ) ( not ( = ?auto_1894601 ?auto_1894612 ) ) ( not ( = ?auto_1894601 ?auto_1894613 ) ) ( not ( = ?auto_1894601 ?auto_1894614 ) ) ( not ( = ?auto_1894601 ?auto_1894615 ) ) ( not ( = ?auto_1894601 ?auto_1894616 ) ) ( not ( = ?auto_1894601 ?auto_1894621 ) ) ( not ( = ?auto_1894602 ?auto_1894603 ) ) ( not ( = ?auto_1894602 ?auto_1894605 ) ) ( not ( = ?auto_1894602 ?auto_1894604 ) ) ( not ( = ?auto_1894602 ?auto_1894606 ) ) ( not ( = ?auto_1894602 ?auto_1894607 ) ) ( not ( = ?auto_1894602 ?auto_1894608 ) ) ( not ( = ?auto_1894602 ?auto_1894609 ) ) ( not ( = ?auto_1894602 ?auto_1894610 ) ) ( not ( = ?auto_1894602 ?auto_1894611 ) ) ( not ( = ?auto_1894602 ?auto_1894612 ) ) ( not ( = ?auto_1894602 ?auto_1894613 ) ) ( not ( = ?auto_1894602 ?auto_1894614 ) ) ( not ( = ?auto_1894602 ?auto_1894615 ) ) ( not ( = ?auto_1894602 ?auto_1894616 ) ) ( not ( = ?auto_1894602 ?auto_1894621 ) ) ( not ( = ?auto_1894603 ?auto_1894605 ) ) ( not ( = ?auto_1894603 ?auto_1894604 ) ) ( not ( = ?auto_1894603 ?auto_1894606 ) ) ( not ( = ?auto_1894603 ?auto_1894607 ) ) ( not ( = ?auto_1894603 ?auto_1894608 ) ) ( not ( = ?auto_1894603 ?auto_1894609 ) ) ( not ( = ?auto_1894603 ?auto_1894610 ) ) ( not ( = ?auto_1894603 ?auto_1894611 ) ) ( not ( = ?auto_1894603 ?auto_1894612 ) ) ( not ( = ?auto_1894603 ?auto_1894613 ) ) ( not ( = ?auto_1894603 ?auto_1894614 ) ) ( not ( = ?auto_1894603 ?auto_1894615 ) ) ( not ( = ?auto_1894603 ?auto_1894616 ) ) ( not ( = ?auto_1894603 ?auto_1894621 ) ) ( not ( = ?auto_1894605 ?auto_1894604 ) ) ( not ( = ?auto_1894605 ?auto_1894606 ) ) ( not ( = ?auto_1894605 ?auto_1894607 ) ) ( not ( = ?auto_1894605 ?auto_1894608 ) ) ( not ( = ?auto_1894605 ?auto_1894609 ) ) ( not ( = ?auto_1894605 ?auto_1894610 ) ) ( not ( = ?auto_1894605 ?auto_1894611 ) ) ( not ( = ?auto_1894605 ?auto_1894612 ) ) ( not ( = ?auto_1894605 ?auto_1894613 ) ) ( not ( = ?auto_1894605 ?auto_1894614 ) ) ( not ( = ?auto_1894605 ?auto_1894615 ) ) ( not ( = ?auto_1894605 ?auto_1894616 ) ) ( not ( = ?auto_1894605 ?auto_1894621 ) ) ( not ( = ?auto_1894604 ?auto_1894606 ) ) ( not ( = ?auto_1894604 ?auto_1894607 ) ) ( not ( = ?auto_1894604 ?auto_1894608 ) ) ( not ( = ?auto_1894604 ?auto_1894609 ) ) ( not ( = ?auto_1894604 ?auto_1894610 ) ) ( not ( = ?auto_1894604 ?auto_1894611 ) ) ( not ( = ?auto_1894604 ?auto_1894612 ) ) ( not ( = ?auto_1894604 ?auto_1894613 ) ) ( not ( = ?auto_1894604 ?auto_1894614 ) ) ( not ( = ?auto_1894604 ?auto_1894615 ) ) ( not ( = ?auto_1894604 ?auto_1894616 ) ) ( not ( = ?auto_1894604 ?auto_1894621 ) ) ( not ( = ?auto_1894606 ?auto_1894607 ) ) ( not ( = ?auto_1894606 ?auto_1894608 ) ) ( not ( = ?auto_1894606 ?auto_1894609 ) ) ( not ( = ?auto_1894606 ?auto_1894610 ) ) ( not ( = ?auto_1894606 ?auto_1894611 ) ) ( not ( = ?auto_1894606 ?auto_1894612 ) ) ( not ( = ?auto_1894606 ?auto_1894613 ) ) ( not ( = ?auto_1894606 ?auto_1894614 ) ) ( not ( = ?auto_1894606 ?auto_1894615 ) ) ( not ( = ?auto_1894606 ?auto_1894616 ) ) ( not ( = ?auto_1894606 ?auto_1894621 ) ) ( not ( = ?auto_1894607 ?auto_1894608 ) ) ( not ( = ?auto_1894607 ?auto_1894609 ) ) ( not ( = ?auto_1894607 ?auto_1894610 ) ) ( not ( = ?auto_1894607 ?auto_1894611 ) ) ( not ( = ?auto_1894607 ?auto_1894612 ) ) ( not ( = ?auto_1894607 ?auto_1894613 ) ) ( not ( = ?auto_1894607 ?auto_1894614 ) ) ( not ( = ?auto_1894607 ?auto_1894615 ) ) ( not ( = ?auto_1894607 ?auto_1894616 ) ) ( not ( = ?auto_1894607 ?auto_1894621 ) ) ( not ( = ?auto_1894608 ?auto_1894609 ) ) ( not ( = ?auto_1894608 ?auto_1894610 ) ) ( not ( = ?auto_1894608 ?auto_1894611 ) ) ( not ( = ?auto_1894608 ?auto_1894612 ) ) ( not ( = ?auto_1894608 ?auto_1894613 ) ) ( not ( = ?auto_1894608 ?auto_1894614 ) ) ( not ( = ?auto_1894608 ?auto_1894615 ) ) ( not ( = ?auto_1894608 ?auto_1894616 ) ) ( not ( = ?auto_1894608 ?auto_1894621 ) ) ( not ( = ?auto_1894609 ?auto_1894610 ) ) ( not ( = ?auto_1894609 ?auto_1894611 ) ) ( not ( = ?auto_1894609 ?auto_1894612 ) ) ( not ( = ?auto_1894609 ?auto_1894613 ) ) ( not ( = ?auto_1894609 ?auto_1894614 ) ) ( not ( = ?auto_1894609 ?auto_1894615 ) ) ( not ( = ?auto_1894609 ?auto_1894616 ) ) ( not ( = ?auto_1894609 ?auto_1894621 ) ) ( not ( = ?auto_1894610 ?auto_1894611 ) ) ( not ( = ?auto_1894610 ?auto_1894612 ) ) ( not ( = ?auto_1894610 ?auto_1894613 ) ) ( not ( = ?auto_1894610 ?auto_1894614 ) ) ( not ( = ?auto_1894610 ?auto_1894615 ) ) ( not ( = ?auto_1894610 ?auto_1894616 ) ) ( not ( = ?auto_1894610 ?auto_1894621 ) ) ( not ( = ?auto_1894611 ?auto_1894612 ) ) ( not ( = ?auto_1894611 ?auto_1894613 ) ) ( not ( = ?auto_1894611 ?auto_1894614 ) ) ( not ( = ?auto_1894611 ?auto_1894615 ) ) ( not ( = ?auto_1894611 ?auto_1894616 ) ) ( not ( = ?auto_1894611 ?auto_1894621 ) ) ( not ( = ?auto_1894612 ?auto_1894613 ) ) ( not ( = ?auto_1894612 ?auto_1894614 ) ) ( not ( = ?auto_1894612 ?auto_1894615 ) ) ( not ( = ?auto_1894612 ?auto_1894616 ) ) ( not ( = ?auto_1894612 ?auto_1894621 ) ) ( not ( = ?auto_1894613 ?auto_1894614 ) ) ( not ( = ?auto_1894613 ?auto_1894615 ) ) ( not ( = ?auto_1894613 ?auto_1894616 ) ) ( not ( = ?auto_1894613 ?auto_1894621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894614 ?auto_1894615 ?auto_1894616 )
      ( MAKE-15CRATE-VERIFY ?auto_1894601 ?auto_1894602 ?auto_1894603 ?auto_1894605 ?auto_1894604 ?auto_1894606 ?auto_1894607 ?auto_1894608 ?auto_1894609 ?auto_1894610 ?auto_1894611 ?auto_1894612 ?auto_1894613 ?auto_1894614 ?auto_1894615 ?auto_1894616 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1894827 - SURFACE
      ?auto_1894828 - SURFACE
      ?auto_1894829 - SURFACE
      ?auto_1894831 - SURFACE
      ?auto_1894830 - SURFACE
      ?auto_1894832 - SURFACE
      ?auto_1894833 - SURFACE
      ?auto_1894834 - SURFACE
      ?auto_1894835 - SURFACE
      ?auto_1894836 - SURFACE
      ?auto_1894837 - SURFACE
      ?auto_1894838 - SURFACE
      ?auto_1894839 - SURFACE
      ?auto_1894840 - SURFACE
      ?auto_1894841 - SURFACE
      ?auto_1894842 - SURFACE
    )
    :vars
    (
      ?auto_1894844 - HOIST
      ?auto_1894846 - PLACE
      ?auto_1894845 - PLACE
      ?auto_1894843 - HOIST
      ?auto_1894847 - SURFACE
      ?auto_1894848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894844 ?auto_1894846 ) ( IS-CRATE ?auto_1894842 ) ( not ( = ?auto_1894841 ?auto_1894842 ) ) ( not ( = ?auto_1894840 ?auto_1894841 ) ) ( not ( = ?auto_1894840 ?auto_1894842 ) ) ( not ( = ?auto_1894845 ?auto_1894846 ) ) ( HOIST-AT ?auto_1894843 ?auto_1894845 ) ( not ( = ?auto_1894844 ?auto_1894843 ) ) ( AVAILABLE ?auto_1894843 ) ( SURFACE-AT ?auto_1894842 ?auto_1894845 ) ( ON ?auto_1894842 ?auto_1894847 ) ( CLEAR ?auto_1894842 ) ( not ( = ?auto_1894841 ?auto_1894847 ) ) ( not ( = ?auto_1894842 ?auto_1894847 ) ) ( not ( = ?auto_1894840 ?auto_1894847 ) ) ( TRUCK-AT ?auto_1894848 ?auto_1894846 ) ( SURFACE-AT ?auto_1894840 ?auto_1894846 ) ( CLEAR ?auto_1894840 ) ( IS-CRATE ?auto_1894841 ) ( AVAILABLE ?auto_1894844 ) ( IN ?auto_1894841 ?auto_1894848 ) ( ON ?auto_1894828 ?auto_1894827 ) ( ON ?auto_1894829 ?auto_1894828 ) ( ON ?auto_1894831 ?auto_1894829 ) ( ON ?auto_1894830 ?auto_1894831 ) ( ON ?auto_1894832 ?auto_1894830 ) ( ON ?auto_1894833 ?auto_1894832 ) ( ON ?auto_1894834 ?auto_1894833 ) ( ON ?auto_1894835 ?auto_1894834 ) ( ON ?auto_1894836 ?auto_1894835 ) ( ON ?auto_1894837 ?auto_1894836 ) ( ON ?auto_1894838 ?auto_1894837 ) ( ON ?auto_1894839 ?auto_1894838 ) ( ON ?auto_1894840 ?auto_1894839 ) ( not ( = ?auto_1894827 ?auto_1894828 ) ) ( not ( = ?auto_1894827 ?auto_1894829 ) ) ( not ( = ?auto_1894827 ?auto_1894831 ) ) ( not ( = ?auto_1894827 ?auto_1894830 ) ) ( not ( = ?auto_1894827 ?auto_1894832 ) ) ( not ( = ?auto_1894827 ?auto_1894833 ) ) ( not ( = ?auto_1894827 ?auto_1894834 ) ) ( not ( = ?auto_1894827 ?auto_1894835 ) ) ( not ( = ?auto_1894827 ?auto_1894836 ) ) ( not ( = ?auto_1894827 ?auto_1894837 ) ) ( not ( = ?auto_1894827 ?auto_1894838 ) ) ( not ( = ?auto_1894827 ?auto_1894839 ) ) ( not ( = ?auto_1894827 ?auto_1894840 ) ) ( not ( = ?auto_1894827 ?auto_1894841 ) ) ( not ( = ?auto_1894827 ?auto_1894842 ) ) ( not ( = ?auto_1894827 ?auto_1894847 ) ) ( not ( = ?auto_1894828 ?auto_1894829 ) ) ( not ( = ?auto_1894828 ?auto_1894831 ) ) ( not ( = ?auto_1894828 ?auto_1894830 ) ) ( not ( = ?auto_1894828 ?auto_1894832 ) ) ( not ( = ?auto_1894828 ?auto_1894833 ) ) ( not ( = ?auto_1894828 ?auto_1894834 ) ) ( not ( = ?auto_1894828 ?auto_1894835 ) ) ( not ( = ?auto_1894828 ?auto_1894836 ) ) ( not ( = ?auto_1894828 ?auto_1894837 ) ) ( not ( = ?auto_1894828 ?auto_1894838 ) ) ( not ( = ?auto_1894828 ?auto_1894839 ) ) ( not ( = ?auto_1894828 ?auto_1894840 ) ) ( not ( = ?auto_1894828 ?auto_1894841 ) ) ( not ( = ?auto_1894828 ?auto_1894842 ) ) ( not ( = ?auto_1894828 ?auto_1894847 ) ) ( not ( = ?auto_1894829 ?auto_1894831 ) ) ( not ( = ?auto_1894829 ?auto_1894830 ) ) ( not ( = ?auto_1894829 ?auto_1894832 ) ) ( not ( = ?auto_1894829 ?auto_1894833 ) ) ( not ( = ?auto_1894829 ?auto_1894834 ) ) ( not ( = ?auto_1894829 ?auto_1894835 ) ) ( not ( = ?auto_1894829 ?auto_1894836 ) ) ( not ( = ?auto_1894829 ?auto_1894837 ) ) ( not ( = ?auto_1894829 ?auto_1894838 ) ) ( not ( = ?auto_1894829 ?auto_1894839 ) ) ( not ( = ?auto_1894829 ?auto_1894840 ) ) ( not ( = ?auto_1894829 ?auto_1894841 ) ) ( not ( = ?auto_1894829 ?auto_1894842 ) ) ( not ( = ?auto_1894829 ?auto_1894847 ) ) ( not ( = ?auto_1894831 ?auto_1894830 ) ) ( not ( = ?auto_1894831 ?auto_1894832 ) ) ( not ( = ?auto_1894831 ?auto_1894833 ) ) ( not ( = ?auto_1894831 ?auto_1894834 ) ) ( not ( = ?auto_1894831 ?auto_1894835 ) ) ( not ( = ?auto_1894831 ?auto_1894836 ) ) ( not ( = ?auto_1894831 ?auto_1894837 ) ) ( not ( = ?auto_1894831 ?auto_1894838 ) ) ( not ( = ?auto_1894831 ?auto_1894839 ) ) ( not ( = ?auto_1894831 ?auto_1894840 ) ) ( not ( = ?auto_1894831 ?auto_1894841 ) ) ( not ( = ?auto_1894831 ?auto_1894842 ) ) ( not ( = ?auto_1894831 ?auto_1894847 ) ) ( not ( = ?auto_1894830 ?auto_1894832 ) ) ( not ( = ?auto_1894830 ?auto_1894833 ) ) ( not ( = ?auto_1894830 ?auto_1894834 ) ) ( not ( = ?auto_1894830 ?auto_1894835 ) ) ( not ( = ?auto_1894830 ?auto_1894836 ) ) ( not ( = ?auto_1894830 ?auto_1894837 ) ) ( not ( = ?auto_1894830 ?auto_1894838 ) ) ( not ( = ?auto_1894830 ?auto_1894839 ) ) ( not ( = ?auto_1894830 ?auto_1894840 ) ) ( not ( = ?auto_1894830 ?auto_1894841 ) ) ( not ( = ?auto_1894830 ?auto_1894842 ) ) ( not ( = ?auto_1894830 ?auto_1894847 ) ) ( not ( = ?auto_1894832 ?auto_1894833 ) ) ( not ( = ?auto_1894832 ?auto_1894834 ) ) ( not ( = ?auto_1894832 ?auto_1894835 ) ) ( not ( = ?auto_1894832 ?auto_1894836 ) ) ( not ( = ?auto_1894832 ?auto_1894837 ) ) ( not ( = ?auto_1894832 ?auto_1894838 ) ) ( not ( = ?auto_1894832 ?auto_1894839 ) ) ( not ( = ?auto_1894832 ?auto_1894840 ) ) ( not ( = ?auto_1894832 ?auto_1894841 ) ) ( not ( = ?auto_1894832 ?auto_1894842 ) ) ( not ( = ?auto_1894832 ?auto_1894847 ) ) ( not ( = ?auto_1894833 ?auto_1894834 ) ) ( not ( = ?auto_1894833 ?auto_1894835 ) ) ( not ( = ?auto_1894833 ?auto_1894836 ) ) ( not ( = ?auto_1894833 ?auto_1894837 ) ) ( not ( = ?auto_1894833 ?auto_1894838 ) ) ( not ( = ?auto_1894833 ?auto_1894839 ) ) ( not ( = ?auto_1894833 ?auto_1894840 ) ) ( not ( = ?auto_1894833 ?auto_1894841 ) ) ( not ( = ?auto_1894833 ?auto_1894842 ) ) ( not ( = ?auto_1894833 ?auto_1894847 ) ) ( not ( = ?auto_1894834 ?auto_1894835 ) ) ( not ( = ?auto_1894834 ?auto_1894836 ) ) ( not ( = ?auto_1894834 ?auto_1894837 ) ) ( not ( = ?auto_1894834 ?auto_1894838 ) ) ( not ( = ?auto_1894834 ?auto_1894839 ) ) ( not ( = ?auto_1894834 ?auto_1894840 ) ) ( not ( = ?auto_1894834 ?auto_1894841 ) ) ( not ( = ?auto_1894834 ?auto_1894842 ) ) ( not ( = ?auto_1894834 ?auto_1894847 ) ) ( not ( = ?auto_1894835 ?auto_1894836 ) ) ( not ( = ?auto_1894835 ?auto_1894837 ) ) ( not ( = ?auto_1894835 ?auto_1894838 ) ) ( not ( = ?auto_1894835 ?auto_1894839 ) ) ( not ( = ?auto_1894835 ?auto_1894840 ) ) ( not ( = ?auto_1894835 ?auto_1894841 ) ) ( not ( = ?auto_1894835 ?auto_1894842 ) ) ( not ( = ?auto_1894835 ?auto_1894847 ) ) ( not ( = ?auto_1894836 ?auto_1894837 ) ) ( not ( = ?auto_1894836 ?auto_1894838 ) ) ( not ( = ?auto_1894836 ?auto_1894839 ) ) ( not ( = ?auto_1894836 ?auto_1894840 ) ) ( not ( = ?auto_1894836 ?auto_1894841 ) ) ( not ( = ?auto_1894836 ?auto_1894842 ) ) ( not ( = ?auto_1894836 ?auto_1894847 ) ) ( not ( = ?auto_1894837 ?auto_1894838 ) ) ( not ( = ?auto_1894837 ?auto_1894839 ) ) ( not ( = ?auto_1894837 ?auto_1894840 ) ) ( not ( = ?auto_1894837 ?auto_1894841 ) ) ( not ( = ?auto_1894837 ?auto_1894842 ) ) ( not ( = ?auto_1894837 ?auto_1894847 ) ) ( not ( = ?auto_1894838 ?auto_1894839 ) ) ( not ( = ?auto_1894838 ?auto_1894840 ) ) ( not ( = ?auto_1894838 ?auto_1894841 ) ) ( not ( = ?auto_1894838 ?auto_1894842 ) ) ( not ( = ?auto_1894838 ?auto_1894847 ) ) ( not ( = ?auto_1894839 ?auto_1894840 ) ) ( not ( = ?auto_1894839 ?auto_1894841 ) ) ( not ( = ?auto_1894839 ?auto_1894842 ) ) ( not ( = ?auto_1894839 ?auto_1894847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1894840 ?auto_1894841 ?auto_1894842 )
      ( MAKE-15CRATE-VERIFY ?auto_1894827 ?auto_1894828 ?auto_1894829 ?auto_1894831 ?auto_1894830 ?auto_1894832 ?auto_1894833 ?auto_1894834 ?auto_1894835 ?auto_1894836 ?auto_1894837 ?auto_1894838 ?auto_1894839 ?auto_1894840 ?auto_1894841 ?auto_1894842 ) )
  )

)

