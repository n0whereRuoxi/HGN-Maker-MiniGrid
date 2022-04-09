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
      ?auto_20562 - SURFACE
      ?auto_20563 - SURFACE
    )
    :vars
    (
      ?auto_20564 - HOIST
      ?auto_20565 - PLACE
      ?auto_20567 - PLACE
      ?auto_20568 - HOIST
      ?auto_20569 - SURFACE
      ?auto_20566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20564 ?auto_20565 ) ( SURFACE-AT ?auto_20562 ?auto_20565 ) ( CLEAR ?auto_20562 ) ( IS-CRATE ?auto_20563 ) ( AVAILABLE ?auto_20564 ) ( not ( = ?auto_20567 ?auto_20565 ) ) ( HOIST-AT ?auto_20568 ?auto_20567 ) ( AVAILABLE ?auto_20568 ) ( SURFACE-AT ?auto_20563 ?auto_20567 ) ( ON ?auto_20563 ?auto_20569 ) ( CLEAR ?auto_20563 ) ( TRUCK-AT ?auto_20566 ?auto_20565 ) ( not ( = ?auto_20562 ?auto_20563 ) ) ( not ( = ?auto_20562 ?auto_20569 ) ) ( not ( = ?auto_20563 ?auto_20569 ) ) ( not ( = ?auto_20564 ?auto_20568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20566 ?auto_20565 ?auto_20567 )
      ( !LIFT ?auto_20568 ?auto_20563 ?auto_20569 ?auto_20567 )
      ( !LOAD ?auto_20568 ?auto_20563 ?auto_20566 ?auto_20567 )
      ( !DRIVE ?auto_20566 ?auto_20567 ?auto_20565 )
      ( !UNLOAD ?auto_20564 ?auto_20563 ?auto_20566 ?auto_20565 )
      ( !DROP ?auto_20564 ?auto_20563 ?auto_20562 ?auto_20565 )
      ( MAKE-1CRATE-VERIFY ?auto_20562 ?auto_20563 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_20583 - SURFACE
      ?auto_20584 - SURFACE
      ?auto_20585 - SURFACE
    )
    :vars
    (
      ?auto_20587 - HOIST
      ?auto_20588 - PLACE
      ?auto_20590 - PLACE
      ?auto_20589 - HOIST
      ?auto_20586 - SURFACE
      ?auto_20592 - PLACE
      ?auto_20594 - HOIST
      ?auto_20593 - SURFACE
      ?auto_20591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20587 ?auto_20588 ) ( IS-CRATE ?auto_20585 ) ( not ( = ?auto_20590 ?auto_20588 ) ) ( HOIST-AT ?auto_20589 ?auto_20590 ) ( AVAILABLE ?auto_20589 ) ( SURFACE-AT ?auto_20585 ?auto_20590 ) ( ON ?auto_20585 ?auto_20586 ) ( CLEAR ?auto_20585 ) ( not ( = ?auto_20584 ?auto_20585 ) ) ( not ( = ?auto_20584 ?auto_20586 ) ) ( not ( = ?auto_20585 ?auto_20586 ) ) ( not ( = ?auto_20587 ?auto_20589 ) ) ( SURFACE-AT ?auto_20583 ?auto_20588 ) ( CLEAR ?auto_20583 ) ( IS-CRATE ?auto_20584 ) ( AVAILABLE ?auto_20587 ) ( not ( = ?auto_20592 ?auto_20588 ) ) ( HOIST-AT ?auto_20594 ?auto_20592 ) ( AVAILABLE ?auto_20594 ) ( SURFACE-AT ?auto_20584 ?auto_20592 ) ( ON ?auto_20584 ?auto_20593 ) ( CLEAR ?auto_20584 ) ( TRUCK-AT ?auto_20591 ?auto_20588 ) ( not ( = ?auto_20583 ?auto_20584 ) ) ( not ( = ?auto_20583 ?auto_20593 ) ) ( not ( = ?auto_20584 ?auto_20593 ) ) ( not ( = ?auto_20587 ?auto_20594 ) ) ( not ( = ?auto_20583 ?auto_20585 ) ) ( not ( = ?auto_20583 ?auto_20586 ) ) ( not ( = ?auto_20585 ?auto_20593 ) ) ( not ( = ?auto_20590 ?auto_20592 ) ) ( not ( = ?auto_20589 ?auto_20594 ) ) ( not ( = ?auto_20586 ?auto_20593 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20583 ?auto_20584 )
      ( MAKE-1CRATE ?auto_20584 ?auto_20585 )
      ( MAKE-2CRATE-VERIFY ?auto_20583 ?auto_20584 ?auto_20585 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_20609 - SURFACE
      ?auto_20610 - SURFACE
      ?auto_20611 - SURFACE
      ?auto_20612 - SURFACE
    )
    :vars
    (
      ?auto_20615 - HOIST
      ?auto_20613 - PLACE
      ?auto_20614 - PLACE
      ?auto_20616 - HOIST
      ?auto_20617 - SURFACE
      ?auto_20624 - PLACE
      ?auto_20621 - HOIST
      ?auto_20622 - SURFACE
      ?auto_20623 - PLACE
      ?auto_20619 - HOIST
      ?auto_20620 - SURFACE
      ?auto_20618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20615 ?auto_20613 ) ( IS-CRATE ?auto_20612 ) ( not ( = ?auto_20614 ?auto_20613 ) ) ( HOIST-AT ?auto_20616 ?auto_20614 ) ( AVAILABLE ?auto_20616 ) ( SURFACE-AT ?auto_20612 ?auto_20614 ) ( ON ?auto_20612 ?auto_20617 ) ( CLEAR ?auto_20612 ) ( not ( = ?auto_20611 ?auto_20612 ) ) ( not ( = ?auto_20611 ?auto_20617 ) ) ( not ( = ?auto_20612 ?auto_20617 ) ) ( not ( = ?auto_20615 ?auto_20616 ) ) ( IS-CRATE ?auto_20611 ) ( not ( = ?auto_20624 ?auto_20613 ) ) ( HOIST-AT ?auto_20621 ?auto_20624 ) ( AVAILABLE ?auto_20621 ) ( SURFACE-AT ?auto_20611 ?auto_20624 ) ( ON ?auto_20611 ?auto_20622 ) ( CLEAR ?auto_20611 ) ( not ( = ?auto_20610 ?auto_20611 ) ) ( not ( = ?auto_20610 ?auto_20622 ) ) ( not ( = ?auto_20611 ?auto_20622 ) ) ( not ( = ?auto_20615 ?auto_20621 ) ) ( SURFACE-AT ?auto_20609 ?auto_20613 ) ( CLEAR ?auto_20609 ) ( IS-CRATE ?auto_20610 ) ( AVAILABLE ?auto_20615 ) ( not ( = ?auto_20623 ?auto_20613 ) ) ( HOIST-AT ?auto_20619 ?auto_20623 ) ( AVAILABLE ?auto_20619 ) ( SURFACE-AT ?auto_20610 ?auto_20623 ) ( ON ?auto_20610 ?auto_20620 ) ( CLEAR ?auto_20610 ) ( TRUCK-AT ?auto_20618 ?auto_20613 ) ( not ( = ?auto_20609 ?auto_20610 ) ) ( not ( = ?auto_20609 ?auto_20620 ) ) ( not ( = ?auto_20610 ?auto_20620 ) ) ( not ( = ?auto_20615 ?auto_20619 ) ) ( not ( = ?auto_20609 ?auto_20611 ) ) ( not ( = ?auto_20609 ?auto_20622 ) ) ( not ( = ?auto_20611 ?auto_20620 ) ) ( not ( = ?auto_20624 ?auto_20623 ) ) ( not ( = ?auto_20621 ?auto_20619 ) ) ( not ( = ?auto_20622 ?auto_20620 ) ) ( not ( = ?auto_20609 ?auto_20612 ) ) ( not ( = ?auto_20609 ?auto_20617 ) ) ( not ( = ?auto_20610 ?auto_20612 ) ) ( not ( = ?auto_20610 ?auto_20617 ) ) ( not ( = ?auto_20612 ?auto_20622 ) ) ( not ( = ?auto_20612 ?auto_20620 ) ) ( not ( = ?auto_20614 ?auto_20624 ) ) ( not ( = ?auto_20614 ?auto_20623 ) ) ( not ( = ?auto_20616 ?auto_20621 ) ) ( not ( = ?auto_20616 ?auto_20619 ) ) ( not ( = ?auto_20617 ?auto_20622 ) ) ( not ( = ?auto_20617 ?auto_20620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20609 ?auto_20610 ?auto_20611 )
      ( MAKE-1CRATE ?auto_20611 ?auto_20612 )
      ( MAKE-3CRATE-VERIFY ?auto_20609 ?auto_20610 ?auto_20611 ?auto_20612 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20640 - SURFACE
      ?auto_20641 - SURFACE
      ?auto_20642 - SURFACE
      ?auto_20643 - SURFACE
      ?auto_20644 - SURFACE
    )
    :vars
    (
      ?auto_20648 - HOIST
      ?auto_20646 - PLACE
      ?auto_20649 - PLACE
      ?auto_20645 - HOIST
      ?auto_20647 - SURFACE
      ?auto_20655 - PLACE
      ?auto_20656 - HOIST
      ?auto_20657 - SURFACE
      ?auto_20652 - PLACE
      ?auto_20659 - HOIST
      ?auto_20658 - SURFACE
      ?auto_20653 - PLACE
      ?auto_20651 - HOIST
      ?auto_20654 - SURFACE
      ?auto_20650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20648 ?auto_20646 ) ( IS-CRATE ?auto_20644 ) ( not ( = ?auto_20649 ?auto_20646 ) ) ( HOIST-AT ?auto_20645 ?auto_20649 ) ( AVAILABLE ?auto_20645 ) ( SURFACE-AT ?auto_20644 ?auto_20649 ) ( ON ?auto_20644 ?auto_20647 ) ( CLEAR ?auto_20644 ) ( not ( = ?auto_20643 ?auto_20644 ) ) ( not ( = ?auto_20643 ?auto_20647 ) ) ( not ( = ?auto_20644 ?auto_20647 ) ) ( not ( = ?auto_20648 ?auto_20645 ) ) ( IS-CRATE ?auto_20643 ) ( not ( = ?auto_20655 ?auto_20646 ) ) ( HOIST-AT ?auto_20656 ?auto_20655 ) ( AVAILABLE ?auto_20656 ) ( SURFACE-AT ?auto_20643 ?auto_20655 ) ( ON ?auto_20643 ?auto_20657 ) ( CLEAR ?auto_20643 ) ( not ( = ?auto_20642 ?auto_20643 ) ) ( not ( = ?auto_20642 ?auto_20657 ) ) ( not ( = ?auto_20643 ?auto_20657 ) ) ( not ( = ?auto_20648 ?auto_20656 ) ) ( IS-CRATE ?auto_20642 ) ( not ( = ?auto_20652 ?auto_20646 ) ) ( HOIST-AT ?auto_20659 ?auto_20652 ) ( AVAILABLE ?auto_20659 ) ( SURFACE-AT ?auto_20642 ?auto_20652 ) ( ON ?auto_20642 ?auto_20658 ) ( CLEAR ?auto_20642 ) ( not ( = ?auto_20641 ?auto_20642 ) ) ( not ( = ?auto_20641 ?auto_20658 ) ) ( not ( = ?auto_20642 ?auto_20658 ) ) ( not ( = ?auto_20648 ?auto_20659 ) ) ( SURFACE-AT ?auto_20640 ?auto_20646 ) ( CLEAR ?auto_20640 ) ( IS-CRATE ?auto_20641 ) ( AVAILABLE ?auto_20648 ) ( not ( = ?auto_20653 ?auto_20646 ) ) ( HOIST-AT ?auto_20651 ?auto_20653 ) ( AVAILABLE ?auto_20651 ) ( SURFACE-AT ?auto_20641 ?auto_20653 ) ( ON ?auto_20641 ?auto_20654 ) ( CLEAR ?auto_20641 ) ( TRUCK-AT ?auto_20650 ?auto_20646 ) ( not ( = ?auto_20640 ?auto_20641 ) ) ( not ( = ?auto_20640 ?auto_20654 ) ) ( not ( = ?auto_20641 ?auto_20654 ) ) ( not ( = ?auto_20648 ?auto_20651 ) ) ( not ( = ?auto_20640 ?auto_20642 ) ) ( not ( = ?auto_20640 ?auto_20658 ) ) ( not ( = ?auto_20642 ?auto_20654 ) ) ( not ( = ?auto_20652 ?auto_20653 ) ) ( not ( = ?auto_20659 ?auto_20651 ) ) ( not ( = ?auto_20658 ?auto_20654 ) ) ( not ( = ?auto_20640 ?auto_20643 ) ) ( not ( = ?auto_20640 ?auto_20657 ) ) ( not ( = ?auto_20641 ?auto_20643 ) ) ( not ( = ?auto_20641 ?auto_20657 ) ) ( not ( = ?auto_20643 ?auto_20658 ) ) ( not ( = ?auto_20643 ?auto_20654 ) ) ( not ( = ?auto_20655 ?auto_20652 ) ) ( not ( = ?auto_20655 ?auto_20653 ) ) ( not ( = ?auto_20656 ?auto_20659 ) ) ( not ( = ?auto_20656 ?auto_20651 ) ) ( not ( = ?auto_20657 ?auto_20658 ) ) ( not ( = ?auto_20657 ?auto_20654 ) ) ( not ( = ?auto_20640 ?auto_20644 ) ) ( not ( = ?auto_20640 ?auto_20647 ) ) ( not ( = ?auto_20641 ?auto_20644 ) ) ( not ( = ?auto_20641 ?auto_20647 ) ) ( not ( = ?auto_20642 ?auto_20644 ) ) ( not ( = ?auto_20642 ?auto_20647 ) ) ( not ( = ?auto_20644 ?auto_20657 ) ) ( not ( = ?auto_20644 ?auto_20658 ) ) ( not ( = ?auto_20644 ?auto_20654 ) ) ( not ( = ?auto_20649 ?auto_20655 ) ) ( not ( = ?auto_20649 ?auto_20652 ) ) ( not ( = ?auto_20649 ?auto_20653 ) ) ( not ( = ?auto_20645 ?auto_20656 ) ) ( not ( = ?auto_20645 ?auto_20659 ) ) ( not ( = ?auto_20645 ?auto_20651 ) ) ( not ( = ?auto_20647 ?auto_20657 ) ) ( not ( = ?auto_20647 ?auto_20658 ) ) ( not ( = ?auto_20647 ?auto_20654 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_20640 ?auto_20641 ?auto_20642 ?auto_20643 )
      ( MAKE-1CRATE ?auto_20643 ?auto_20644 )
      ( MAKE-4CRATE-VERIFY ?auto_20640 ?auto_20641 ?auto_20642 ?auto_20643 ?auto_20644 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20676 - SURFACE
      ?auto_20677 - SURFACE
      ?auto_20678 - SURFACE
      ?auto_20679 - SURFACE
      ?auto_20680 - SURFACE
      ?auto_20681 - SURFACE
    )
    :vars
    (
      ?auto_20686 - HOIST
      ?auto_20682 - PLACE
      ?auto_20683 - PLACE
      ?auto_20685 - HOIST
      ?auto_20684 - SURFACE
      ?auto_20696 - PLACE
      ?auto_20688 - HOIST
      ?auto_20697 - SURFACE
      ?auto_20695 - PLACE
      ?auto_20694 - HOIST
      ?auto_20693 - SURFACE
      ?auto_20691 - PLACE
      ?auto_20699 - HOIST
      ?auto_20692 - SURFACE
      ?auto_20689 - PLACE
      ?auto_20698 - HOIST
      ?auto_20690 - SURFACE
      ?auto_20687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20686 ?auto_20682 ) ( IS-CRATE ?auto_20681 ) ( not ( = ?auto_20683 ?auto_20682 ) ) ( HOIST-AT ?auto_20685 ?auto_20683 ) ( AVAILABLE ?auto_20685 ) ( SURFACE-AT ?auto_20681 ?auto_20683 ) ( ON ?auto_20681 ?auto_20684 ) ( CLEAR ?auto_20681 ) ( not ( = ?auto_20680 ?auto_20681 ) ) ( not ( = ?auto_20680 ?auto_20684 ) ) ( not ( = ?auto_20681 ?auto_20684 ) ) ( not ( = ?auto_20686 ?auto_20685 ) ) ( IS-CRATE ?auto_20680 ) ( not ( = ?auto_20696 ?auto_20682 ) ) ( HOIST-AT ?auto_20688 ?auto_20696 ) ( AVAILABLE ?auto_20688 ) ( SURFACE-AT ?auto_20680 ?auto_20696 ) ( ON ?auto_20680 ?auto_20697 ) ( CLEAR ?auto_20680 ) ( not ( = ?auto_20679 ?auto_20680 ) ) ( not ( = ?auto_20679 ?auto_20697 ) ) ( not ( = ?auto_20680 ?auto_20697 ) ) ( not ( = ?auto_20686 ?auto_20688 ) ) ( IS-CRATE ?auto_20679 ) ( not ( = ?auto_20695 ?auto_20682 ) ) ( HOIST-AT ?auto_20694 ?auto_20695 ) ( AVAILABLE ?auto_20694 ) ( SURFACE-AT ?auto_20679 ?auto_20695 ) ( ON ?auto_20679 ?auto_20693 ) ( CLEAR ?auto_20679 ) ( not ( = ?auto_20678 ?auto_20679 ) ) ( not ( = ?auto_20678 ?auto_20693 ) ) ( not ( = ?auto_20679 ?auto_20693 ) ) ( not ( = ?auto_20686 ?auto_20694 ) ) ( IS-CRATE ?auto_20678 ) ( not ( = ?auto_20691 ?auto_20682 ) ) ( HOIST-AT ?auto_20699 ?auto_20691 ) ( AVAILABLE ?auto_20699 ) ( SURFACE-AT ?auto_20678 ?auto_20691 ) ( ON ?auto_20678 ?auto_20692 ) ( CLEAR ?auto_20678 ) ( not ( = ?auto_20677 ?auto_20678 ) ) ( not ( = ?auto_20677 ?auto_20692 ) ) ( not ( = ?auto_20678 ?auto_20692 ) ) ( not ( = ?auto_20686 ?auto_20699 ) ) ( SURFACE-AT ?auto_20676 ?auto_20682 ) ( CLEAR ?auto_20676 ) ( IS-CRATE ?auto_20677 ) ( AVAILABLE ?auto_20686 ) ( not ( = ?auto_20689 ?auto_20682 ) ) ( HOIST-AT ?auto_20698 ?auto_20689 ) ( AVAILABLE ?auto_20698 ) ( SURFACE-AT ?auto_20677 ?auto_20689 ) ( ON ?auto_20677 ?auto_20690 ) ( CLEAR ?auto_20677 ) ( TRUCK-AT ?auto_20687 ?auto_20682 ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( not ( = ?auto_20676 ?auto_20690 ) ) ( not ( = ?auto_20677 ?auto_20690 ) ) ( not ( = ?auto_20686 ?auto_20698 ) ) ( not ( = ?auto_20676 ?auto_20678 ) ) ( not ( = ?auto_20676 ?auto_20692 ) ) ( not ( = ?auto_20678 ?auto_20690 ) ) ( not ( = ?auto_20691 ?auto_20689 ) ) ( not ( = ?auto_20699 ?auto_20698 ) ) ( not ( = ?auto_20692 ?auto_20690 ) ) ( not ( = ?auto_20676 ?auto_20679 ) ) ( not ( = ?auto_20676 ?auto_20693 ) ) ( not ( = ?auto_20677 ?auto_20679 ) ) ( not ( = ?auto_20677 ?auto_20693 ) ) ( not ( = ?auto_20679 ?auto_20692 ) ) ( not ( = ?auto_20679 ?auto_20690 ) ) ( not ( = ?auto_20695 ?auto_20691 ) ) ( not ( = ?auto_20695 ?auto_20689 ) ) ( not ( = ?auto_20694 ?auto_20699 ) ) ( not ( = ?auto_20694 ?auto_20698 ) ) ( not ( = ?auto_20693 ?auto_20692 ) ) ( not ( = ?auto_20693 ?auto_20690 ) ) ( not ( = ?auto_20676 ?auto_20680 ) ) ( not ( = ?auto_20676 ?auto_20697 ) ) ( not ( = ?auto_20677 ?auto_20680 ) ) ( not ( = ?auto_20677 ?auto_20697 ) ) ( not ( = ?auto_20678 ?auto_20680 ) ) ( not ( = ?auto_20678 ?auto_20697 ) ) ( not ( = ?auto_20680 ?auto_20693 ) ) ( not ( = ?auto_20680 ?auto_20692 ) ) ( not ( = ?auto_20680 ?auto_20690 ) ) ( not ( = ?auto_20696 ?auto_20695 ) ) ( not ( = ?auto_20696 ?auto_20691 ) ) ( not ( = ?auto_20696 ?auto_20689 ) ) ( not ( = ?auto_20688 ?auto_20694 ) ) ( not ( = ?auto_20688 ?auto_20699 ) ) ( not ( = ?auto_20688 ?auto_20698 ) ) ( not ( = ?auto_20697 ?auto_20693 ) ) ( not ( = ?auto_20697 ?auto_20692 ) ) ( not ( = ?auto_20697 ?auto_20690 ) ) ( not ( = ?auto_20676 ?auto_20681 ) ) ( not ( = ?auto_20676 ?auto_20684 ) ) ( not ( = ?auto_20677 ?auto_20681 ) ) ( not ( = ?auto_20677 ?auto_20684 ) ) ( not ( = ?auto_20678 ?auto_20681 ) ) ( not ( = ?auto_20678 ?auto_20684 ) ) ( not ( = ?auto_20679 ?auto_20681 ) ) ( not ( = ?auto_20679 ?auto_20684 ) ) ( not ( = ?auto_20681 ?auto_20697 ) ) ( not ( = ?auto_20681 ?auto_20693 ) ) ( not ( = ?auto_20681 ?auto_20692 ) ) ( not ( = ?auto_20681 ?auto_20690 ) ) ( not ( = ?auto_20683 ?auto_20696 ) ) ( not ( = ?auto_20683 ?auto_20695 ) ) ( not ( = ?auto_20683 ?auto_20691 ) ) ( not ( = ?auto_20683 ?auto_20689 ) ) ( not ( = ?auto_20685 ?auto_20688 ) ) ( not ( = ?auto_20685 ?auto_20694 ) ) ( not ( = ?auto_20685 ?auto_20699 ) ) ( not ( = ?auto_20685 ?auto_20698 ) ) ( not ( = ?auto_20684 ?auto_20697 ) ) ( not ( = ?auto_20684 ?auto_20693 ) ) ( not ( = ?auto_20684 ?auto_20692 ) ) ( not ( = ?auto_20684 ?auto_20690 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_20676 ?auto_20677 ?auto_20678 ?auto_20679 ?auto_20680 )
      ( MAKE-1CRATE ?auto_20680 ?auto_20681 )
      ( MAKE-5CRATE-VERIFY ?auto_20676 ?auto_20677 ?auto_20678 ?auto_20679 ?auto_20680 ?auto_20681 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_20717 - SURFACE
      ?auto_20718 - SURFACE
      ?auto_20719 - SURFACE
      ?auto_20720 - SURFACE
      ?auto_20721 - SURFACE
      ?auto_20722 - SURFACE
      ?auto_20723 - SURFACE
    )
    :vars
    (
      ?auto_20725 - HOIST
      ?auto_20728 - PLACE
      ?auto_20727 - PLACE
      ?auto_20724 - HOIST
      ?auto_20726 - SURFACE
      ?auto_20743 - PLACE
      ?auto_20742 - HOIST
      ?auto_20733 - SURFACE
      ?auto_20740 - PLACE
      ?auto_20732 - HOIST
      ?auto_20731 - SURFACE
      ?auto_20744 - PLACE
      ?auto_20735 - HOIST
      ?auto_20736 - SURFACE
      ?auto_20741 - PLACE
      ?auto_20734 - HOIST
      ?auto_20737 - SURFACE
      ?auto_20739 - PLACE
      ?auto_20738 - HOIST
      ?auto_20730 - SURFACE
      ?auto_20729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20725 ?auto_20728 ) ( IS-CRATE ?auto_20723 ) ( not ( = ?auto_20727 ?auto_20728 ) ) ( HOIST-AT ?auto_20724 ?auto_20727 ) ( AVAILABLE ?auto_20724 ) ( SURFACE-AT ?auto_20723 ?auto_20727 ) ( ON ?auto_20723 ?auto_20726 ) ( CLEAR ?auto_20723 ) ( not ( = ?auto_20722 ?auto_20723 ) ) ( not ( = ?auto_20722 ?auto_20726 ) ) ( not ( = ?auto_20723 ?auto_20726 ) ) ( not ( = ?auto_20725 ?auto_20724 ) ) ( IS-CRATE ?auto_20722 ) ( not ( = ?auto_20743 ?auto_20728 ) ) ( HOIST-AT ?auto_20742 ?auto_20743 ) ( AVAILABLE ?auto_20742 ) ( SURFACE-AT ?auto_20722 ?auto_20743 ) ( ON ?auto_20722 ?auto_20733 ) ( CLEAR ?auto_20722 ) ( not ( = ?auto_20721 ?auto_20722 ) ) ( not ( = ?auto_20721 ?auto_20733 ) ) ( not ( = ?auto_20722 ?auto_20733 ) ) ( not ( = ?auto_20725 ?auto_20742 ) ) ( IS-CRATE ?auto_20721 ) ( not ( = ?auto_20740 ?auto_20728 ) ) ( HOIST-AT ?auto_20732 ?auto_20740 ) ( AVAILABLE ?auto_20732 ) ( SURFACE-AT ?auto_20721 ?auto_20740 ) ( ON ?auto_20721 ?auto_20731 ) ( CLEAR ?auto_20721 ) ( not ( = ?auto_20720 ?auto_20721 ) ) ( not ( = ?auto_20720 ?auto_20731 ) ) ( not ( = ?auto_20721 ?auto_20731 ) ) ( not ( = ?auto_20725 ?auto_20732 ) ) ( IS-CRATE ?auto_20720 ) ( not ( = ?auto_20744 ?auto_20728 ) ) ( HOIST-AT ?auto_20735 ?auto_20744 ) ( AVAILABLE ?auto_20735 ) ( SURFACE-AT ?auto_20720 ?auto_20744 ) ( ON ?auto_20720 ?auto_20736 ) ( CLEAR ?auto_20720 ) ( not ( = ?auto_20719 ?auto_20720 ) ) ( not ( = ?auto_20719 ?auto_20736 ) ) ( not ( = ?auto_20720 ?auto_20736 ) ) ( not ( = ?auto_20725 ?auto_20735 ) ) ( IS-CRATE ?auto_20719 ) ( not ( = ?auto_20741 ?auto_20728 ) ) ( HOIST-AT ?auto_20734 ?auto_20741 ) ( AVAILABLE ?auto_20734 ) ( SURFACE-AT ?auto_20719 ?auto_20741 ) ( ON ?auto_20719 ?auto_20737 ) ( CLEAR ?auto_20719 ) ( not ( = ?auto_20718 ?auto_20719 ) ) ( not ( = ?auto_20718 ?auto_20737 ) ) ( not ( = ?auto_20719 ?auto_20737 ) ) ( not ( = ?auto_20725 ?auto_20734 ) ) ( SURFACE-AT ?auto_20717 ?auto_20728 ) ( CLEAR ?auto_20717 ) ( IS-CRATE ?auto_20718 ) ( AVAILABLE ?auto_20725 ) ( not ( = ?auto_20739 ?auto_20728 ) ) ( HOIST-AT ?auto_20738 ?auto_20739 ) ( AVAILABLE ?auto_20738 ) ( SURFACE-AT ?auto_20718 ?auto_20739 ) ( ON ?auto_20718 ?auto_20730 ) ( CLEAR ?auto_20718 ) ( TRUCK-AT ?auto_20729 ?auto_20728 ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20730 ) ) ( not ( = ?auto_20718 ?auto_20730 ) ) ( not ( = ?auto_20725 ?auto_20738 ) ) ( not ( = ?auto_20717 ?auto_20719 ) ) ( not ( = ?auto_20717 ?auto_20737 ) ) ( not ( = ?auto_20719 ?auto_20730 ) ) ( not ( = ?auto_20741 ?auto_20739 ) ) ( not ( = ?auto_20734 ?auto_20738 ) ) ( not ( = ?auto_20737 ?auto_20730 ) ) ( not ( = ?auto_20717 ?auto_20720 ) ) ( not ( = ?auto_20717 ?auto_20736 ) ) ( not ( = ?auto_20718 ?auto_20720 ) ) ( not ( = ?auto_20718 ?auto_20736 ) ) ( not ( = ?auto_20720 ?auto_20737 ) ) ( not ( = ?auto_20720 ?auto_20730 ) ) ( not ( = ?auto_20744 ?auto_20741 ) ) ( not ( = ?auto_20744 ?auto_20739 ) ) ( not ( = ?auto_20735 ?auto_20734 ) ) ( not ( = ?auto_20735 ?auto_20738 ) ) ( not ( = ?auto_20736 ?auto_20737 ) ) ( not ( = ?auto_20736 ?auto_20730 ) ) ( not ( = ?auto_20717 ?auto_20721 ) ) ( not ( = ?auto_20717 ?auto_20731 ) ) ( not ( = ?auto_20718 ?auto_20721 ) ) ( not ( = ?auto_20718 ?auto_20731 ) ) ( not ( = ?auto_20719 ?auto_20721 ) ) ( not ( = ?auto_20719 ?auto_20731 ) ) ( not ( = ?auto_20721 ?auto_20736 ) ) ( not ( = ?auto_20721 ?auto_20737 ) ) ( not ( = ?auto_20721 ?auto_20730 ) ) ( not ( = ?auto_20740 ?auto_20744 ) ) ( not ( = ?auto_20740 ?auto_20741 ) ) ( not ( = ?auto_20740 ?auto_20739 ) ) ( not ( = ?auto_20732 ?auto_20735 ) ) ( not ( = ?auto_20732 ?auto_20734 ) ) ( not ( = ?auto_20732 ?auto_20738 ) ) ( not ( = ?auto_20731 ?auto_20736 ) ) ( not ( = ?auto_20731 ?auto_20737 ) ) ( not ( = ?auto_20731 ?auto_20730 ) ) ( not ( = ?auto_20717 ?auto_20722 ) ) ( not ( = ?auto_20717 ?auto_20733 ) ) ( not ( = ?auto_20718 ?auto_20722 ) ) ( not ( = ?auto_20718 ?auto_20733 ) ) ( not ( = ?auto_20719 ?auto_20722 ) ) ( not ( = ?auto_20719 ?auto_20733 ) ) ( not ( = ?auto_20720 ?auto_20722 ) ) ( not ( = ?auto_20720 ?auto_20733 ) ) ( not ( = ?auto_20722 ?auto_20731 ) ) ( not ( = ?auto_20722 ?auto_20736 ) ) ( not ( = ?auto_20722 ?auto_20737 ) ) ( not ( = ?auto_20722 ?auto_20730 ) ) ( not ( = ?auto_20743 ?auto_20740 ) ) ( not ( = ?auto_20743 ?auto_20744 ) ) ( not ( = ?auto_20743 ?auto_20741 ) ) ( not ( = ?auto_20743 ?auto_20739 ) ) ( not ( = ?auto_20742 ?auto_20732 ) ) ( not ( = ?auto_20742 ?auto_20735 ) ) ( not ( = ?auto_20742 ?auto_20734 ) ) ( not ( = ?auto_20742 ?auto_20738 ) ) ( not ( = ?auto_20733 ?auto_20731 ) ) ( not ( = ?auto_20733 ?auto_20736 ) ) ( not ( = ?auto_20733 ?auto_20737 ) ) ( not ( = ?auto_20733 ?auto_20730 ) ) ( not ( = ?auto_20717 ?auto_20723 ) ) ( not ( = ?auto_20717 ?auto_20726 ) ) ( not ( = ?auto_20718 ?auto_20723 ) ) ( not ( = ?auto_20718 ?auto_20726 ) ) ( not ( = ?auto_20719 ?auto_20723 ) ) ( not ( = ?auto_20719 ?auto_20726 ) ) ( not ( = ?auto_20720 ?auto_20723 ) ) ( not ( = ?auto_20720 ?auto_20726 ) ) ( not ( = ?auto_20721 ?auto_20723 ) ) ( not ( = ?auto_20721 ?auto_20726 ) ) ( not ( = ?auto_20723 ?auto_20733 ) ) ( not ( = ?auto_20723 ?auto_20731 ) ) ( not ( = ?auto_20723 ?auto_20736 ) ) ( not ( = ?auto_20723 ?auto_20737 ) ) ( not ( = ?auto_20723 ?auto_20730 ) ) ( not ( = ?auto_20727 ?auto_20743 ) ) ( not ( = ?auto_20727 ?auto_20740 ) ) ( not ( = ?auto_20727 ?auto_20744 ) ) ( not ( = ?auto_20727 ?auto_20741 ) ) ( not ( = ?auto_20727 ?auto_20739 ) ) ( not ( = ?auto_20724 ?auto_20742 ) ) ( not ( = ?auto_20724 ?auto_20732 ) ) ( not ( = ?auto_20724 ?auto_20735 ) ) ( not ( = ?auto_20724 ?auto_20734 ) ) ( not ( = ?auto_20724 ?auto_20738 ) ) ( not ( = ?auto_20726 ?auto_20733 ) ) ( not ( = ?auto_20726 ?auto_20731 ) ) ( not ( = ?auto_20726 ?auto_20736 ) ) ( not ( = ?auto_20726 ?auto_20737 ) ) ( not ( = ?auto_20726 ?auto_20730 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_20717 ?auto_20718 ?auto_20719 ?auto_20720 ?auto_20721 ?auto_20722 )
      ( MAKE-1CRATE ?auto_20722 ?auto_20723 )
      ( MAKE-6CRATE-VERIFY ?auto_20717 ?auto_20718 ?auto_20719 ?auto_20720 ?auto_20721 ?auto_20722 ?auto_20723 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_20763 - SURFACE
      ?auto_20764 - SURFACE
      ?auto_20765 - SURFACE
      ?auto_20766 - SURFACE
      ?auto_20767 - SURFACE
      ?auto_20768 - SURFACE
      ?auto_20769 - SURFACE
      ?auto_20770 - SURFACE
    )
    :vars
    (
      ?auto_20774 - HOIST
      ?auto_20775 - PLACE
      ?auto_20771 - PLACE
      ?auto_20776 - HOIST
      ?auto_20772 - SURFACE
      ?auto_20781 - PLACE
      ?auto_20783 - HOIST
      ?auto_20782 - SURFACE
      ?auto_20789 - PLACE
      ?auto_20788 - HOIST
      ?auto_20790 - SURFACE
      ?auto_20785 - PLACE
      ?auto_20791 - HOIST
      ?auto_20794 - SURFACE
      ?auto_20792 - PLACE
      ?auto_20779 - HOIST
      ?auto_20778 - SURFACE
      ?auto_20787 - PLACE
      ?auto_20780 - HOIST
      ?auto_20777 - SURFACE
      ?auto_20786 - PLACE
      ?auto_20784 - HOIST
      ?auto_20793 - SURFACE
      ?auto_20773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20774 ?auto_20775 ) ( IS-CRATE ?auto_20770 ) ( not ( = ?auto_20771 ?auto_20775 ) ) ( HOIST-AT ?auto_20776 ?auto_20771 ) ( AVAILABLE ?auto_20776 ) ( SURFACE-AT ?auto_20770 ?auto_20771 ) ( ON ?auto_20770 ?auto_20772 ) ( CLEAR ?auto_20770 ) ( not ( = ?auto_20769 ?auto_20770 ) ) ( not ( = ?auto_20769 ?auto_20772 ) ) ( not ( = ?auto_20770 ?auto_20772 ) ) ( not ( = ?auto_20774 ?auto_20776 ) ) ( IS-CRATE ?auto_20769 ) ( not ( = ?auto_20781 ?auto_20775 ) ) ( HOIST-AT ?auto_20783 ?auto_20781 ) ( AVAILABLE ?auto_20783 ) ( SURFACE-AT ?auto_20769 ?auto_20781 ) ( ON ?auto_20769 ?auto_20782 ) ( CLEAR ?auto_20769 ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( not ( = ?auto_20768 ?auto_20782 ) ) ( not ( = ?auto_20769 ?auto_20782 ) ) ( not ( = ?auto_20774 ?auto_20783 ) ) ( IS-CRATE ?auto_20768 ) ( not ( = ?auto_20789 ?auto_20775 ) ) ( HOIST-AT ?auto_20788 ?auto_20789 ) ( AVAILABLE ?auto_20788 ) ( SURFACE-AT ?auto_20768 ?auto_20789 ) ( ON ?auto_20768 ?auto_20790 ) ( CLEAR ?auto_20768 ) ( not ( = ?auto_20767 ?auto_20768 ) ) ( not ( = ?auto_20767 ?auto_20790 ) ) ( not ( = ?auto_20768 ?auto_20790 ) ) ( not ( = ?auto_20774 ?auto_20788 ) ) ( IS-CRATE ?auto_20767 ) ( not ( = ?auto_20785 ?auto_20775 ) ) ( HOIST-AT ?auto_20791 ?auto_20785 ) ( AVAILABLE ?auto_20791 ) ( SURFACE-AT ?auto_20767 ?auto_20785 ) ( ON ?auto_20767 ?auto_20794 ) ( CLEAR ?auto_20767 ) ( not ( = ?auto_20766 ?auto_20767 ) ) ( not ( = ?auto_20766 ?auto_20794 ) ) ( not ( = ?auto_20767 ?auto_20794 ) ) ( not ( = ?auto_20774 ?auto_20791 ) ) ( IS-CRATE ?auto_20766 ) ( not ( = ?auto_20792 ?auto_20775 ) ) ( HOIST-AT ?auto_20779 ?auto_20792 ) ( AVAILABLE ?auto_20779 ) ( SURFACE-AT ?auto_20766 ?auto_20792 ) ( ON ?auto_20766 ?auto_20778 ) ( CLEAR ?auto_20766 ) ( not ( = ?auto_20765 ?auto_20766 ) ) ( not ( = ?auto_20765 ?auto_20778 ) ) ( not ( = ?auto_20766 ?auto_20778 ) ) ( not ( = ?auto_20774 ?auto_20779 ) ) ( IS-CRATE ?auto_20765 ) ( not ( = ?auto_20787 ?auto_20775 ) ) ( HOIST-AT ?auto_20780 ?auto_20787 ) ( AVAILABLE ?auto_20780 ) ( SURFACE-AT ?auto_20765 ?auto_20787 ) ( ON ?auto_20765 ?auto_20777 ) ( CLEAR ?auto_20765 ) ( not ( = ?auto_20764 ?auto_20765 ) ) ( not ( = ?auto_20764 ?auto_20777 ) ) ( not ( = ?auto_20765 ?auto_20777 ) ) ( not ( = ?auto_20774 ?auto_20780 ) ) ( SURFACE-AT ?auto_20763 ?auto_20775 ) ( CLEAR ?auto_20763 ) ( IS-CRATE ?auto_20764 ) ( AVAILABLE ?auto_20774 ) ( not ( = ?auto_20786 ?auto_20775 ) ) ( HOIST-AT ?auto_20784 ?auto_20786 ) ( AVAILABLE ?auto_20784 ) ( SURFACE-AT ?auto_20764 ?auto_20786 ) ( ON ?auto_20764 ?auto_20793 ) ( CLEAR ?auto_20764 ) ( TRUCK-AT ?auto_20773 ?auto_20775 ) ( not ( = ?auto_20763 ?auto_20764 ) ) ( not ( = ?auto_20763 ?auto_20793 ) ) ( not ( = ?auto_20764 ?auto_20793 ) ) ( not ( = ?auto_20774 ?auto_20784 ) ) ( not ( = ?auto_20763 ?auto_20765 ) ) ( not ( = ?auto_20763 ?auto_20777 ) ) ( not ( = ?auto_20765 ?auto_20793 ) ) ( not ( = ?auto_20787 ?auto_20786 ) ) ( not ( = ?auto_20780 ?auto_20784 ) ) ( not ( = ?auto_20777 ?auto_20793 ) ) ( not ( = ?auto_20763 ?auto_20766 ) ) ( not ( = ?auto_20763 ?auto_20778 ) ) ( not ( = ?auto_20764 ?auto_20766 ) ) ( not ( = ?auto_20764 ?auto_20778 ) ) ( not ( = ?auto_20766 ?auto_20777 ) ) ( not ( = ?auto_20766 ?auto_20793 ) ) ( not ( = ?auto_20792 ?auto_20787 ) ) ( not ( = ?auto_20792 ?auto_20786 ) ) ( not ( = ?auto_20779 ?auto_20780 ) ) ( not ( = ?auto_20779 ?auto_20784 ) ) ( not ( = ?auto_20778 ?auto_20777 ) ) ( not ( = ?auto_20778 ?auto_20793 ) ) ( not ( = ?auto_20763 ?auto_20767 ) ) ( not ( = ?auto_20763 ?auto_20794 ) ) ( not ( = ?auto_20764 ?auto_20767 ) ) ( not ( = ?auto_20764 ?auto_20794 ) ) ( not ( = ?auto_20765 ?auto_20767 ) ) ( not ( = ?auto_20765 ?auto_20794 ) ) ( not ( = ?auto_20767 ?auto_20778 ) ) ( not ( = ?auto_20767 ?auto_20777 ) ) ( not ( = ?auto_20767 ?auto_20793 ) ) ( not ( = ?auto_20785 ?auto_20792 ) ) ( not ( = ?auto_20785 ?auto_20787 ) ) ( not ( = ?auto_20785 ?auto_20786 ) ) ( not ( = ?auto_20791 ?auto_20779 ) ) ( not ( = ?auto_20791 ?auto_20780 ) ) ( not ( = ?auto_20791 ?auto_20784 ) ) ( not ( = ?auto_20794 ?auto_20778 ) ) ( not ( = ?auto_20794 ?auto_20777 ) ) ( not ( = ?auto_20794 ?auto_20793 ) ) ( not ( = ?auto_20763 ?auto_20768 ) ) ( not ( = ?auto_20763 ?auto_20790 ) ) ( not ( = ?auto_20764 ?auto_20768 ) ) ( not ( = ?auto_20764 ?auto_20790 ) ) ( not ( = ?auto_20765 ?auto_20768 ) ) ( not ( = ?auto_20765 ?auto_20790 ) ) ( not ( = ?auto_20766 ?auto_20768 ) ) ( not ( = ?auto_20766 ?auto_20790 ) ) ( not ( = ?auto_20768 ?auto_20794 ) ) ( not ( = ?auto_20768 ?auto_20778 ) ) ( not ( = ?auto_20768 ?auto_20777 ) ) ( not ( = ?auto_20768 ?auto_20793 ) ) ( not ( = ?auto_20789 ?auto_20785 ) ) ( not ( = ?auto_20789 ?auto_20792 ) ) ( not ( = ?auto_20789 ?auto_20787 ) ) ( not ( = ?auto_20789 ?auto_20786 ) ) ( not ( = ?auto_20788 ?auto_20791 ) ) ( not ( = ?auto_20788 ?auto_20779 ) ) ( not ( = ?auto_20788 ?auto_20780 ) ) ( not ( = ?auto_20788 ?auto_20784 ) ) ( not ( = ?auto_20790 ?auto_20794 ) ) ( not ( = ?auto_20790 ?auto_20778 ) ) ( not ( = ?auto_20790 ?auto_20777 ) ) ( not ( = ?auto_20790 ?auto_20793 ) ) ( not ( = ?auto_20763 ?auto_20769 ) ) ( not ( = ?auto_20763 ?auto_20782 ) ) ( not ( = ?auto_20764 ?auto_20769 ) ) ( not ( = ?auto_20764 ?auto_20782 ) ) ( not ( = ?auto_20765 ?auto_20769 ) ) ( not ( = ?auto_20765 ?auto_20782 ) ) ( not ( = ?auto_20766 ?auto_20769 ) ) ( not ( = ?auto_20766 ?auto_20782 ) ) ( not ( = ?auto_20767 ?auto_20769 ) ) ( not ( = ?auto_20767 ?auto_20782 ) ) ( not ( = ?auto_20769 ?auto_20790 ) ) ( not ( = ?auto_20769 ?auto_20794 ) ) ( not ( = ?auto_20769 ?auto_20778 ) ) ( not ( = ?auto_20769 ?auto_20777 ) ) ( not ( = ?auto_20769 ?auto_20793 ) ) ( not ( = ?auto_20781 ?auto_20789 ) ) ( not ( = ?auto_20781 ?auto_20785 ) ) ( not ( = ?auto_20781 ?auto_20792 ) ) ( not ( = ?auto_20781 ?auto_20787 ) ) ( not ( = ?auto_20781 ?auto_20786 ) ) ( not ( = ?auto_20783 ?auto_20788 ) ) ( not ( = ?auto_20783 ?auto_20791 ) ) ( not ( = ?auto_20783 ?auto_20779 ) ) ( not ( = ?auto_20783 ?auto_20780 ) ) ( not ( = ?auto_20783 ?auto_20784 ) ) ( not ( = ?auto_20782 ?auto_20790 ) ) ( not ( = ?auto_20782 ?auto_20794 ) ) ( not ( = ?auto_20782 ?auto_20778 ) ) ( not ( = ?auto_20782 ?auto_20777 ) ) ( not ( = ?auto_20782 ?auto_20793 ) ) ( not ( = ?auto_20763 ?auto_20770 ) ) ( not ( = ?auto_20763 ?auto_20772 ) ) ( not ( = ?auto_20764 ?auto_20770 ) ) ( not ( = ?auto_20764 ?auto_20772 ) ) ( not ( = ?auto_20765 ?auto_20770 ) ) ( not ( = ?auto_20765 ?auto_20772 ) ) ( not ( = ?auto_20766 ?auto_20770 ) ) ( not ( = ?auto_20766 ?auto_20772 ) ) ( not ( = ?auto_20767 ?auto_20770 ) ) ( not ( = ?auto_20767 ?auto_20772 ) ) ( not ( = ?auto_20768 ?auto_20770 ) ) ( not ( = ?auto_20768 ?auto_20772 ) ) ( not ( = ?auto_20770 ?auto_20782 ) ) ( not ( = ?auto_20770 ?auto_20790 ) ) ( not ( = ?auto_20770 ?auto_20794 ) ) ( not ( = ?auto_20770 ?auto_20778 ) ) ( not ( = ?auto_20770 ?auto_20777 ) ) ( not ( = ?auto_20770 ?auto_20793 ) ) ( not ( = ?auto_20771 ?auto_20781 ) ) ( not ( = ?auto_20771 ?auto_20789 ) ) ( not ( = ?auto_20771 ?auto_20785 ) ) ( not ( = ?auto_20771 ?auto_20792 ) ) ( not ( = ?auto_20771 ?auto_20787 ) ) ( not ( = ?auto_20771 ?auto_20786 ) ) ( not ( = ?auto_20776 ?auto_20783 ) ) ( not ( = ?auto_20776 ?auto_20788 ) ) ( not ( = ?auto_20776 ?auto_20791 ) ) ( not ( = ?auto_20776 ?auto_20779 ) ) ( not ( = ?auto_20776 ?auto_20780 ) ) ( not ( = ?auto_20776 ?auto_20784 ) ) ( not ( = ?auto_20772 ?auto_20782 ) ) ( not ( = ?auto_20772 ?auto_20790 ) ) ( not ( = ?auto_20772 ?auto_20794 ) ) ( not ( = ?auto_20772 ?auto_20778 ) ) ( not ( = ?auto_20772 ?auto_20777 ) ) ( not ( = ?auto_20772 ?auto_20793 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20763 ?auto_20764 ?auto_20765 ?auto_20766 ?auto_20767 ?auto_20768 ?auto_20769 )
      ( MAKE-1CRATE ?auto_20769 ?auto_20770 )
      ( MAKE-7CRATE-VERIFY ?auto_20763 ?auto_20764 ?auto_20765 ?auto_20766 ?auto_20767 ?auto_20768 ?auto_20769 ?auto_20770 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_20814 - SURFACE
      ?auto_20815 - SURFACE
      ?auto_20816 - SURFACE
      ?auto_20817 - SURFACE
      ?auto_20818 - SURFACE
      ?auto_20819 - SURFACE
      ?auto_20820 - SURFACE
      ?auto_20821 - SURFACE
      ?auto_20822 - SURFACE
    )
    :vars
    (
      ?auto_20823 - HOIST
      ?auto_20825 - PLACE
      ?auto_20827 - PLACE
      ?auto_20824 - HOIST
      ?auto_20828 - SURFACE
      ?auto_20831 - PLACE
      ?auto_20832 - HOIST
      ?auto_20849 - SURFACE
      ?auto_20848 - PLACE
      ?auto_20846 - HOIST
      ?auto_20847 - SURFACE
      ?auto_20839 - PLACE
      ?auto_20838 - HOIST
      ?auto_20844 - SURFACE
      ?auto_20842 - PLACE
      ?auto_20834 - HOIST
      ?auto_20835 - SURFACE
      ?auto_20843 - PLACE
      ?auto_20833 - HOIST
      ?auto_20830 - SURFACE
      ?auto_20841 - PLACE
      ?auto_20829 - HOIST
      ?auto_20837 - SURFACE
      ?auto_20840 - PLACE
      ?auto_20845 - HOIST
      ?auto_20836 - SURFACE
      ?auto_20826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20823 ?auto_20825 ) ( IS-CRATE ?auto_20822 ) ( not ( = ?auto_20827 ?auto_20825 ) ) ( HOIST-AT ?auto_20824 ?auto_20827 ) ( AVAILABLE ?auto_20824 ) ( SURFACE-AT ?auto_20822 ?auto_20827 ) ( ON ?auto_20822 ?auto_20828 ) ( CLEAR ?auto_20822 ) ( not ( = ?auto_20821 ?auto_20822 ) ) ( not ( = ?auto_20821 ?auto_20828 ) ) ( not ( = ?auto_20822 ?auto_20828 ) ) ( not ( = ?auto_20823 ?auto_20824 ) ) ( IS-CRATE ?auto_20821 ) ( not ( = ?auto_20831 ?auto_20825 ) ) ( HOIST-AT ?auto_20832 ?auto_20831 ) ( AVAILABLE ?auto_20832 ) ( SURFACE-AT ?auto_20821 ?auto_20831 ) ( ON ?auto_20821 ?auto_20849 ) ( CLEAR ?auto_20821 ) ( not ( = ?auto_20820 ?auto_20821 ) ) ( not ( = ?auto_20820 ?auto_20849 ) ) ( not ( = ?auto_20821 ?auto_20849 ) ) ( not ( = ?auto_20823 ?auto_20832 ) ) ( IS-CRATE ?auto_20820 ) ( not ( = ?auto_20848 ?auto_20825 ) ) ( HOIST-AT ?auto_20846 ?auto_20848 ) ( AVAILABLE ?auto_20846 ) ( SURFACE-AT ?auto_20820 ?auto_20848 ) ( ON ?auto_20820 ?auto_20847 ) ( CLEAR ?auto_20820 ) ( not ( = ?auto_20819 ?auto_20820 ) ) ( not ( = ?auto_20819 ?auto_20847 ) ) ( not ( = ?auto_20820 ?auto_20847 ) ) ( not ( = ?auto_20823 ?auto_20846 ) ) ( IS-CRATE ?auto_20819 ) ( not ( = ?auto_20839 ?auto_20825 ) ) ( HOIST-AT ?auto_20838 ?auto_20839 ) ( AVAILABLE ?auto_20838 ) ( SURFACE-AT ?auto_20819 ?auto_20839 ) ( ON ?auto_20819 ?auto_20844 ) ( CLEAR ?auto_20819 ) ( not ( = ?auto_20818 ?auto_20819 ) ) ( not ( = ?auto_20818 ?auto_20844 ) ) ( not ( = ?auto_20819 ?auto_20844 ) ) ( not ( = ?auto_20823 ?auto_20838 ) ) ( IS-CRATE ?auto_20818 ) ( not ( = ?auto_20842 ?auto_20825 ) ) ( HOIST-AT ?auto_20834 ?auto_20842 ) ( AVAILABLE ?auto_20834 ) ( SURFACE-AT ?auto_20818 ?auto_20842 ) ( ON ?auto_20818 ?auto_20835 ) ( CLEAR ?auto_20818 ) ( not ( = ?auto_20817 ?auto_20818 ) ) ( not ( = ?auto_20817 ?auto_20835 ) ) ( not ( = ?auto_20818 ?auto_20835 ) ) ( not ( = ?auto_20823 ?auto_20834 ) ) ( IS-CRATE ?auto_20817 ) ( not ( = ?auto_20843 ?auto_20825 ) ) ( HOIST-AT ?auto_20833 ?auto_20843 ) ( AVAILABLE ?auto_20833 ) ( SURFACE-AT ?auto_20817 ?auto_20843 ) ( ON ?auto_20817 ?auto_20830 ) ( CLEAR ?auto_20817 ) ( not ( = ?auto_20816 ?auto_20817 ) ) ( not ( = ?auto_20816 ?auto_20830 ) ) ( not ( = ?auto_20817 ?auto_20830 ) ) ( not ( = ?auto_20823 ?auto_20833 ) ) ( IS-CRATE ?auto_20816 ) ( not ( = ?auto_20841 ?auto_20825 ) ) ( HOIST-AT ?auto_20829 ?auto_20841 ) ( AVAILABLE ?auto_20829 ) ( SURFACE-AT ?auto_20816 ?auto_20841 ) ( ON ?auto_20816 ?auto_20837 ) ( CLEAR ?auto_20816 ) ( not ( = ?auto_20815 ?auto_20816 ) ) ( not ( = ?auto_20815 ?auto_20837 ) ) ( not ( = ?auto_20816 ?auto_20837 ) ) ( not ( = ?auto_20823 ?auto_20829 ) ) ( SURFACE-AT ?auto_20814 ?auto_20825 ) ( CLEAR ?auto_20814 ) ( IS-CRATE ?auto_20815 ) ( AVAILABLE ?auto_20823 ) ( not ( = ?auto_20840 ?auto_20825 ) ) ( HOIST-AT ?auto_20845 ?auto_20840 ) ( AVAILABLE ?auto_20845 ) ( SURFACE-AT ?auto_20815 ?auto_20840 ) ( ON ?auto_20815 ?auto_20836 ) ( CLEAR ?auto_20815 ) ( TRUCK-AT ?auto_20826 ?auto_20825 ) ( not ( = ?auto_20814 ?auto_20815 ) ) ( not ( = ?auto_20814 ?auto_20836 ) ) ( not ( = ?auto_20815 ?auto_20836 ) ) ( not ( = ?auto_20823 ?auto_20845 ) ) ( not ( = ?auto_20814 ?auto_20816 ) ) ( not ( = ?auto_20814 ?auto_20837 ) ) ( not ( = ?auto_20816 ?auto_20836 ) ) ( not ( = ?auto_20841 ?auto_20840 ) ) ( not ( = ?auto_20829 ?auto_20845 ) ) ( not ( = ?auto_20837 ?auto_20836 ) ) ( not ( = ?auto_20814 ?auto_20817 ) ) ( not ( = ?auto_20814 ?auto_20830 ) ) ( not ( = ?auto_20815 ?auto_20817 ) ) ( not ( = ?auto_20815 ?auto_20830 ) ) ( not ( = ?auto_20817 ?auto_20837 ) ) ( not ( = ?auto_20817 ?auto_20836 ) ) ( not ( = ?auto_20843 ?auto_20841 ) ) ( not ( = ?auto_20843 ?auto_20840 ) ) ( not ( = ?auto_20833 ?auto_20829 ) ) ( not ( = ?auto_20833 ?auto_20845 ) ) ( not ( = ?auto_20830 ?auto_20837 ) ) ( not ( = ?auto_20830 ?auto_20836 ) ) ( not ( = ?auto_20814 ?auto_20818 ) ) ( not ( = ?auto_20814 ?auto_20835 ) ) ( not ( = ?auto_20815 ?auto_20818 ) ) ( not ( = ?auto_20815 ?auto_20835 ) ) ( not ( = ?auto_20816 ?auto_20818 ) ) ( not ( = ?auto_20816 ?auto_20835 ) ) ( not ( = ?auto_20818 ?auto_20830 ) ) ( not ( = ?auto_20818 ?auto_20837 ) ) ( not ( = ?auto_20818 ?auto_20836 ) ) ( not ( = ?auto_20842 ?auto_20843 ) ) ( not ( = ?auto_20842 ?auto_20841 ) ) ( not ( = ?auto_20842 ?auto_20840 ) ) ( not ( = ?auto_20834 ?auto_20833 ) ) ( not ( = ?auto_20834 ?auto_20829 ) ) ( not ( = ?auto_20834 ?auto_20845 ) ) ( not ( = ?auto_20835 ?auto_20830 ) ) ( not ( = ?auto_20835 ?auto_20837 ) ) ( not ( = ?auto_20835 ?auto_20836 ) ) ( not ( = ?auto_20814 ?auto_20819 ) ) ( not ( = ?auto_20814 ?auto_20844 ) ) ( not ( = ?auto_20815 ?auto_20819 ) ) ( not ( = ?auto_20815 ?auto_20844 ) ) ( not ( = ?auto_20816 ?auto_20819 ) ) ( not ( = ?auto_20816 ?auto_20844 ) ) ( not ( = ?auto_20817 ?auto_20819 ) ) ( not ( = ?auto_20817 ?auto_20844 ) ) ( not ( = ?auto_20819 ?auto_20835 ) ) ( not ( = ?auto_20819 ?auto_20830 ) ) ( not ( = ?auto_20819 ?auto_20837 ) ) ( not ( = ?auto_20819 ?auto_20836 ) ) ( not ( = ?auto_20839 ?auto_20842 ) ) ( not ( = ?auto_20839 ?auto_20843 ) ) ( not ( = ?auto_20839 ?auto_20841 ) ) ( not ( = ?auto_20839 ?auto_20840 ) ) ( not ( = ?auto_20838 ?auto_20834 ) ) ( not ( = ?auto_20838 ?auto_20833 ) ) ( not ( = ?auto_20838 ?auto_20829 ) ) ( not ( = ?auto_20838 ?auto_20845 ) ) ( not ( = ?auto_20844 ?auto_20835 ) ) ( not ( = ?auto_20844 ?auto_20830 ) ) ( not ( = ?auto_20844 ?auto_20837 ) ) ( not ( = ?auto_20844 ?auto_20836 ) ) ( not ( = ?auto_20814 ?auto_20820 ) ) ( not ( = ?auto_20814 ?auto_20847 ) ) ( not ( = ?auto_20815 ?auto_20820 ) ) ( not ( = ?auto_20815 ?auto_20847 ) ) ( not ( = ?auto_20816 ?auto_20820 ) ) ( not ( = ?auto_20816 ?auto_20847 ) ) ( not ( = ?auto_20817 ?auto_20820 ) ) ( not ( = ?auto_20817 ?auto_20847 ) ) ( not ( = ?auto_20818 ?auto_20820 ) ) ( not ( = ?auto_20818 ?auto_20847 ) ) ( not ( = ?auto_20820 ?auto_20844 ) ) ( not ( = ?auto_20820 ?auto_20835 ) ) ( not ( = ?auto_20820 ?auto_20830 ) ) ( not ( = ?auto_20820 ?auto_20837 ) ) ( not ( = ?auto_20820 ?auto_20836 ) ) ( not ( = ?auto_20848 ?auto_20839 ) ) ( not ( = ?auto_20848 ?auto_20842 ) ) ( not ( = ?auto_20848 ?auto_20843 ) ) ( not ( = ?auto_20848 ?auto_20841 ) ) ( not ( = ?auto_20848 ?auto_20840 ) ) ( not ( = ?auto_20846 ?auto_20838 ) ) ( not ( = ?auto_20846 ?auto_20834 ) ) ( not ( = ?auto_20846 ?auto_20833 ) ) ( not ( = ?auto_20846 ?auto_20829 ) ) ( not ( = ?auto_20846 ?auto_20845 ) ) ( not ( = ?auto_20847 ?auto_20844 ) ) ( not ( = ?auto_20847 ?auto_20835 ) ) ( not ( = ?auto_20847 ?auto_20830 ) ) ( not ( = ?auto_20847 ?auto_20837 ) ) ( not ( = ?auto_20847 ?auto_20836 ) ) ( not ( = ?auto_20814 ?auto_20821 ) ) ( not ( = ?auto_20814 ?auto_20849 ) ) ( not ( = ?auto_20815 ?auto_20821 ) ) ( not ( = ?auto_20815 ?auto_20849 ) ) ( not ( = ?auto_20816 ?auto_20821 ) ) ( not ( = ?auto_20816 ?auto_20849 ) ) ( not ( = ?auto_20817 ?auto_20821 ) ) ( not ( = ?auto_20817 ?auto_20849 ) ) ( not ( = ?auto_20818 ?auto_20821 ) ) ( not ( = ?auto_20818 ?auto_20849 ) ) ( not ( = ?auto_20819 ?auto_20821 ) ) ( not ( = ?auto_20819 ?auto_20849 ) ) ( not ( = ?auto_20821 ?auto_20847 ) ) ( not ( = ?auto_20821 ?auto_20844 ) ) ( not ( = ?auto_20821 ?auto_20835 ) ) ( not ( = ?auto_20821 ?auto_20830 ) ) ( not ( = ?auto_20821 ?auto_20837 ) ) ( not ( = ?auto_20821 ?auto_20836 ) ) ( not ( = ?auto_20831 ?auto_20848 ) ) ( not ( = ?auto_20831 ?auto_20839 ) ) ( not ( = ?auto_20831 ?auto_20842 ) ) ( not ( = ?auto_20831 ?auto_20843 ) ) ( not ( = ?auto_20831 ?auto_20841 ) ) ( not ( = ?auto_20831 ?auto_20840 ) ) ( not ( = ?auto_20832 ?auto_20846 ) ) ( not ( = ?auto_20832 ?auto_20838 ) ) ( not ( = ?auto_20832 ?auto_20834 ) ) ( not ( = ?auto_20832 ?auto_20833 ) ) ( not ( = ?auto_20832 ?auto_20829 ) ) ( not ( = ?auto_20832 ?auto_20845 ) ) ( not ( = ?auto_20849 ?auto_20847 ) ) ( not ( = ?auto_20849 ?auto_20844 ) ) ( not ( = ?auto_20849 ?auto_20835 ) ) ( not ( = ?auto_20849 ?auto_20830 ) ) ( not ( = ?auto_20849 ?auto_20837 ) ) ( not ( = ?auto_20849 ?auto_20836 ) ) ( not ( = ?auto_20814 ?auto_20822 ) ) ( not ( = ?auto_20814 ?auto_20828 ) ) ( not ( = ?auto_20815 ?auto_20822 ) ) ( not ( = ?auto_20815 ?auto_20828 ) ) ( not ( = ?auto_20816 ?auto_20822 ) ) ( not ( = ?auto_20816 ?auto_20828 ) ) ( not ( = ?auto_20817 ?auto_20822 ) ) ( not ( = ?auto_20817 ?auto_20828 ) ) ( not ( = ?auto_20818 ?auto_20822 ) ) ( not ( = ?auto_20818 ?auto_20828 ) ) ( not ( = ?auto_20819 ?auto_20822 ) ) ( not ( = ?auto_20819 ?auto_20828 ) ) ( not ( = ?auto_20820 ?auto_20822 ) ) ( not ( = ?auto_20820 ?auto_20828 ) ) ( not ( = ?auto_20822 ?auto_20849 ) ) ( not ( = ?auto_20822 ?auto_20847 ) ) ( not ( = ?auto_20822 ?auto_20844 ) ) ( not ( = ?auto_20822 ?auto_20835 ) ) ( not ( = ?auto_20822 ?auto_20830 ) ) ( not ( = ?auto_20822 ?auto_20837 ) ) ( not ( = ?auto_20822 ?auto_20836 ) ) ( not ( = ?auto_20827 ?auto_20831 ) ) ( not ( = ?auto_20827 ?auto_20848 ) ) ( not ( = ?auto_20827 ?auto_20839 ) ) ( not ( = ?auto_20827 ?auto_20842 ) ) ( not ( = ?auto_20827 ?auto_20843 ) ) ( not ( = ?auto_20827 ?auto_20841 ) ) ( not ( = ?auto_20827 ?auto_20840 ) ) ( not ( = ?auto_20824 ?auto_20832 ) ) ( not ( = ?auto_20824 ?auto_20846 ) ) ( not ( = ?auto_20824 ?auto_20838 ) ) ( not ( = ?auto_20824 ?auto_20834 ) ) ( not ( = ?auto_20824 ?auto_20833 ) ) ( not ( = ?auto_20824 ?auto_20829 ) ) ( not ( = ?auto_20824 ?auto_20845 ) ) ( not ( = ?auto_20828 ?auto_20849 ) ) ( not ( = ?auto_20828 ?auto_20847 ) ) ( not ( = ?auto_20828 ?auto_20844 ) ) ( not ( = ?auto_20828 ?auto_20835 ) ) ( not ( = ?auto_20828 ?auto_20830 ) ) ( not ( = ?auto_20828 ?auto_20837 ) ) ( not ( = ?auto_20828 ?auto_20836 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20814 ?auto_20815 ?auto_20816 ?auto_20817 ?auto_20818 ?auto_20819 ?auto_20820 ?auto_20821 )
      ( MAKE-1CRATE ?auto_20821 ?auto_20822 )
      ( MAKE-8CRATE-VERIFY ?auto_20814 ?auto_20815 ?auto_20816 ?auto_20817 ?auto_20818 ?auto_20819 ?auto_20820 ?auto_20821 ?auto_20822 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_20870 - SURFACE
      ?auto_20871 - SURFACE
      ?auto_20872 - SURFACE
      ?auto_20873 - SURFACE
      ?auto_20874 - SURFACE
      ?auto_20875 - SURFACE
      ?auto_20876 - SURFACE
      ?auto_20877 - SURFACE
      ?auto_20878 - SURFACE
      ?auto_20879 - SURFACE
    )
    :vars
    (
      ?auto_20882 - HOIST
      ?auto_20884 - PLACE
      ?auto_20883 - PLACE
      ?auto_20881 - HOIST
      ?auto_20885 - SURFACE
      ?auto_20909 - PLACE
      ?auto_20892 - HOIST
      ?auto_20899 - SURFACE
      ?auto_20896 - PLACE
      ?auto_20895 - HOIST
      ?auto_20908 - SURFACE
      ?auto_20902 - PLACE
      ?auto_20894 - HOIST
      ?auto_20907 - SURFACE
      ?auto_20886 - PLACE
      ?auto_20887 - HOIST
      ?auto_20906 - SURFACE
      ?auto_20890 - PLACE
      ?auto_20904 - HOIST
      ?auto_20905 - SURFACE
      ?auto_20893 - PLACE
      ?auto_20903 - HOIST
      ?auto_20900 - SURFACE
      ?auto_20889 - PLACE
      ?auto_20898 - HOIST
      ?auto_20901 - SURFACE
      ?auto_20888 - PLACE
      ?auto_20897 - HOIST
      ?auto_20891 - SURFACE
      ?auto_20880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20882 ?auto_20884 ) ( IS-CRATE ?auto_20879 ) ( not ( = ?auto_20883 ?auto_20884 ) ) ( HOIST-AT ?auto_20881 ?auto_20883 ) ( AVAILABLE ?auto_20881 ) ( SURFACE-AT ?auto_20879 ?auto_20883 ) ( ON ?auto_20879 ?auto_20885 ) ( CLEAR ?auto_20879 ) ( not ( = ?auto_20878 ?auto_20879 ) ) ( not ( = ?auto_20878 ?auto_20885 ) ) ( not ( = ?auto_20879 ?auto_20885 ) ) ( not ( = ?auto_20882 ?auto_20881 ) ) ( IS-CRATE ?auto_20878 ) ( not ( = ?auto_20909 ?auto_20884 ) ) ( HOIST-AT ?auto_20892 ?auto_20909 ) ( AVAILABLE ?auto_20892 ) ( SURFACE-AT ?auto_20878 ?auto_20909 ) ( ON ?auto_20878 ?auto_20899 ) ( CLEAR ?auto_20878 ) ( not ( = ?auto_20877 ?auto_20878 ) ) ( not ( = ?auto_20877 ?auto_20899 ) ) ( not ( = ?auto_20878 ?auto_20899 ) ) ( not ( = ?auto_20882 ?auto_20892 ) ) ( IS-CRATE ?auto_20877 ) ( not ( = ?auto_20896 ?auto_20884 ) ) ( HOIST-AT ?auto_20895 ?auto_20896 ) ( AVAILABLE ?auto_20895 ) ( SURFACE-AT ?auto_20877 ?auto_20896 ) ( ON ?auto_20877 ?auto_20908 ) ( CLEAR ?auto_20877 ) ( not ( = ?auto_20876 ?auto_20877 ) ) ( not ( = ?auto_20876 ?auto_20908 ) ) ( not ( = ?auto_20877 ?auto_20908 ) ) ( not ( = ?auto_20882 ?auto_20895 ) ) ( IS-CRATE ?auto_20876 ) ( not ( = ?auto_20902 ?auto_20884 ) ) ( HOIST-AT ?auto_20894 ?auto_20902 ) ( AVAILABLE ?auto_20894 ) ( SURFACE-AT ?auto_20876 ?auto_20902 ) ( ON ?auto_20876 ?auto_20907 ) ( CLEAR ?auto_20876 ) ( not ( = ?auto_20875 ?auto_20876 ) ) ( not ( = ?auto_20875 ?auto_20907 ) ) ( not ( = ?auto_20876 ?auto_20907 ) ) ( not ( = ?auto_20882 ?auto_20894 ) ) ( IS-CRATE ?auto_20875 ) ( not ( = ?auto_20886 ?auto_20884 ) ) ( HOIST-AT ?auto_20887 ?auto_20886 ) ( AVAILABLE ?auto_20887 ) ( SURFACE-AT ?auto_20875 ?auto_20886 ) ( ON ?auto_20875 ?auto_20906 ) ( CLEAR ?auto_20875 ) ( not ( = ?auto_20874 ?auto_20875 ) ) ( not ( = ?auto_20874 ?auto_20906 ) ) ( not ( = ?auto_20875 ?auto_20906 ) ) ( not ( = ?auto_20882 ?auto_20887 ) ) ( IS-CRATE ?auto_20874 ) ( not ( = ?auto_20890 ?auto_20884 ) ) ( HOIST-AT ?auto_20904 ?auto_20890 ) ( AVAILABLE ?auto_20904 ) ( SURFACE-AT ?auto_20874 ?auto_20890 ) ( ON ?auto_20874 ?auto_20905 ) ( CLEAR ?auto_20874 ) ( not ( = ?auto_20873 ?auto_20874 ) ) ( not ( = ?auto_20873 ?auto_20905 ) ) ( not ( = ?auto_20874 ?auto_20905 ) ) ( not ( = ?auto_20882 ?auto_20904 ) ) ( IS-CRATE ?auto_20873 ) ( not ( = ?auto_20893 ?auto_20884 ) ) ( HOIST-AT ?auto_20903 ?auto_20893 ) ( AVAILABLE ?auto_20903 ) ( SURFACE-AT ?auto_20873 ?auto_20893 ) ( ON ?auto_20873 ?auto_20900 ) ( CLEAR ?auto_20873 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20900 ) ) ( not ( = ?auto_20873 ?auto_20900 ) ) ( not ( = ?auto_20882 ?auto_20903 ) ) ( IS-CRATE ?auto_20872 ) ( not ( = ?auto_20889 ?auto_20884 ) ) ( HOIST-AT ?auto_20898 ?auto_20889 ) ( AVAILABLE ?auto_20898 ) ( SURFACE-AT ?auto_20872 ?auto_20889 ) ( ON ?auto_20872 ?auto_20901 ) ( CLEAR ?auto_20872 ) ( not ( = ?auto_20871 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20901 ) ) ( not ( = ?auto_20872 ?auto_20901 ) ) ( not ( = ?auto_20882 ?auto_20898 ) ) ( SURFACE-AT ?auto_20870 ?auto_20884 ) ( CLEAR ?auto_20870 ) ( IS-CRATE ?auto_20871 ) ( AVAILABLE ?auto_20882 ) ( not ( = ?auto_20888 ?auto_20884 ) ) ( HOIST-AT ?auto_20897 ?auto_20888 ) ( AVAILABLE ?auto_20897 ) ( SURFACE-AT ?auto_20871 ?auto_20888 ) ( ON ?auto_20871 ?auto_20891 ) ( CLEAR ?auto_20871 ) ( TRUCK-AT ?auto_20880 ?auto_20884 ) ( not ( = ?auto_20870 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20891 ) ) ( not ( = ?auto_20871 ?auto_20891 ) ) ( not ( = ?auto_20882 ?auto_20897 ) ) ( not ( = ?auto_20870 ?auto_20872 ) ) ( not ( = ?auto_20870 ?auto_20901 ) ) ( not ( = ?auto_20872 ?auto_20891 ) ) ( not ( = ?auto_20889 ?auto_20888 ) ) ( not ( = ?auto_20898 ?auto_20897 ) ) ( not ( = ?auto_20901 ?auto_20891 ) ) ( not ( = ?auto_20870 ?auto_20873 ) ) ( not ( = ?auto_20870 ?auto_20900 ) ) ( not ( = ?auto_20871 ?auto_20873 ) ) ( not ( = ?auto_20871 ?auto_20900 ) ) ( not ( = ?auto_20873 ?auto_20901 ) ) ( not ( = ?auto_20873 ?auto_20891 ) ) ( not ( = ?auto_20893 ?auto_20889 ) ) ( not ( = ?auto_20893 ?auto_20888 ) ) ( not ( = ?auto_20903 ?auto_20898 ) ) ( not ( = ?auto_20903 ?auto_20897 ) ) ( not ( = ?auto_20900 ?auto_20901 ) ) ( not ( = ?auto_20900 ?auto_20891 ) ) ( not ( = ?auto_20870 ?auto_20874 ) ) ( not ( = ?auto_20870 ?auto_20905 ) ) ( not ( = ?auto_20871 ?auto_20874 ) ) ( not ( = ?auto_20871 ?auto_20905 ) ) ( not ( = ?auto_20872 ?auto_20874 ) ) ( not ( = ?auto_20872 ?auto_20905 ) ) ( not ( = ?auto_20874 ?auto_20900 ) ) ( not ( = ?auto_20874 ?auto_20901 ) ) ( not ( = ?auto_20874 ?auto_20891 ) ) ( not ( = ?auto_20890 ?auto_20893 ) ) ( not ( = ?auto_20890 ?auto_20889 ) ) ( not ( = ?auto_20890 ?auto_20888 ) ) ( not ( = ?auto_20904 ?auto_20903 ) ) ( not ( = ?auto_20904 ?auto_20898 ) ) ( not ( = ?auto_20904 ?auto_20897 ) ) ( not ( = ?auto_20905 ?auto_20900 ) ) ( not ( = ?auto_20905 ?auto_20901 ) ) ( not ( = ?auto_20905 ?auto_20891 ) ) ( not ( = ?auto_20870 ?auto_20875 ) ) ( not ( = ?auto_20870 ?auto_20906 ) ) ( not ( = ?auto_20871 ?auto_20875 ) ) ( not ( = ?auto_20871 ?auto_20906 ) ) ( not ( = ?auto_20872 ?auto_20875 ) ) ( not ( = ?auto_20872 ?auto_20906 ) ) ( not ( = ?auto_20873 ?auto_20875 ) ) ( not ( = ?auto_20873 ?auto_20906 ) ) ( not ( = ?auto_20875 ?auto_20905 ) ) ( not ( = ?auto_20875 ?auto_20900 ) ) ( not ( = ?auto_20875 ?auto_20901 ) ) ( not ( = ?auto_20875 ?auto_20891 ) ) ( not ( = ?auto_20886 ?auto_20890 ) ) ( not ( = ?auto_20886 ?auto_20893 ) ) ( not ( = ?auto_20886 ?auto_20889 ) ) ( not ( = ?auto_20886 ?auto_20888 ) ) ( not ( = ?auto_20887 ?auto_20904 ) ) ( not ( = ?auto_20887 ?auto_20903 ) ) ( not ( = ?auto_20887 ?auto_20898 ) ) ( not ( = ?auto_20887 ?auto_20897 ) ) ( not ( = ?auto_20906 ?auto_20905 ) ) ( not ( = ?auto_20906 ?auto_20900 ) ) ( not ( = ?auto_20906 ?auto_20901 ) ) ( not ( = ?auto_20906 ?auto_20891 ) ) ( not ( = ?auto_20870 ?auto_20876 ) ) ( not ( = ?auto_20870 ?auto_20907 ) ) ( not ( = ?auto_20871 ?auto_20876 ) ) ( not ( = ?auto_20871 ?auto_20907 ) ) ( not ( = ?auto_20872 ?auto_20876 ) ) ( not ( = ?auto_20872 ?auto_20907 ) ) ( not ( = ?auto_20873 ?auto_20876 ) ) ( not ( = ?auto_20873 ?auto_20907 ) ) ( not ( = ?auto_20874 ?auto_20876 ) ) ( not ( = ?auto_20874 ?auto_20907 ) ) ( not ( = ?auto_20876 ?auto_20906 ) ) ( not ( = ?auto_20876 ?auto_20905 ) ) ( not ( = ?auto_20876 ?auto_20900 ) ) ( not ( = ?auto_20876 ?auto_20901 ) ) ( not ( = ?auto_20876 ?auto_20891 ) ) ( not ( = ?auto_20902 ?auto_20886 ) ) ( not ( = ?auto_20902 ?auto_20890 ) ) ( not ( = ?auto_20902 ?auto_20893 ) ) ( not ( = ?auto_20902 ?auto_20889 ) ) ( not ( = ?auto_20902 ?auto_20888 ) ) ( not ( = ?auto_20894 ?auto_20887 ) ) ( not ( = ?auto_20894 ?auto_20904 ) ) ( not ( = ?auto_20894 ?auto_20903 ) ) ( not ( = ?auto_20894 ?auto_20898 ) ) ( not ( = ?auto_20894 ?auto_20897 ) ) ( not ( = ?auto_20907 ?auto_20906 ) ) ( not ( = ?auto_20907 ?auto_20905 ) ) ( not ( = ?auto_20907 ?auto_20900 ) ) ( not ( = ?auto_20907 ?auto_20901 ) ) ( not ( = ?auto_20907 ?auto_20891 ) ) ( not ( = ?auto_20870 ?auto_20877 ) ) ( not ( = ?auto_20870 ?auto_20908 ) ) ( not ( = ?auto_20871 ?auto_20877 ) ) ( not ( = ?auto_20871 ?auto_20908 ) ) ( not ( = ?auto_20872 ?auto_20877 ) ) ( not ( = ?auto_20872 ?auto_20908 ) ) ( not ( = ?auto_20873 ?auto_20877 ) ) ( not ( = ?auto_20873 ?auto_20908 ) ) ( not ( = ?auto_20874 ?auto_20877 ) ) ( not ( = ?auto_20874 ?auto_20908 ) ) ( not ( = ?auto_20875 ?auto_20877 ) ) ( not ( = ?auto_20875 ?auto_20908 ) ) ( not ( = ?auto_20877 ?auto_20907 ) ) ( not ( = ?auto_20877 ?auto_20906 ) ) ( not ( = ?auto_20877 ?auto_20905 ) ) ( not ( = ?auto_20877 ?auto_20900 ) ) ( not ( = ?auto_20877 ?auto_20901 ) ) ( not ( = ?auto_20877 ?auto_20891 ) ) ( not ( = ?auto_20896 ?auto_20902 ) ) ( not ( = ?auto_20896 ?auto_20886 ) ) ( not ( = ?auto_20896 ?auto_20890 ) ) ( not ( = ?auto_20896 ?auto_20893 ) ) ( not ( = ?auto_20896 ?auto_20889 ) ) ( not ( = ?auto_20896 ?auto_20888 ) ) ( not ( = ?auto_20895 ?auto_20894 ) ) ( not ( = ?auto_20895 ?auto_20887 ) ) ( not ( = ?auto_20895 ?auto_20904 ) ) ( not ( = ?auto_20895 ?auto_20903 ) ) ( not ( = ?auto_20895 ?auto_20898 ) ) ( not ( = ?auto_20895 ?auto_20897 ) ) ( not ( = ?auto_20908 ?auto_20907 ) ) ( not ( = ?auto_20908 ?auto_20906 ) ) ( not ( = ?auto_20908 ?auto_20905 ) ) ( not ( = ?auto_20908 ?auto_20900 ) ) ( not ( = ?auto_20908 ?auto_20901 ) ) ( not ( = ?auto_20908 ?auto_20891 ) ) ( not ( = ?auto_20870 ?auto_20878 ) ) ( not ( = ?auto_20870 ?auto_20899 ) ) ( not ( = ?auto_20871 ?auto_20878 ) ) ( not ( = ?auto_20871 ?auto_20899 ) ) ( not ( = ?auto_20872 ?auto_20878 ) ) ( not ( = ?auto_20872 ?auto_20899 ) ) ( not ( = ?auto_20873 ?auto_20878 ) ) ( not ( = ?auto_20873 ?auto_20899 ) ) ( not ( = ?auto_20874 ?auto_20878 ) ) ( not ( = ?auto_20874 ?auto_20899 ) ) ( not ( = ?auto_20875 ?auto_20878 ) ) ( not ( = ?auto_20875 ?auto_20899 ) ) ( not ( = ?auto_20876 ?auto_20878 ) ) ( not ( = ?auto_20876 ?auto_20899 ) ) ( not ( = ?auto_20878 ?auto_20908 ) ) ( not ( = ?auto_20878 ?auto_20907 ) ) ( not ( = ?auto_20878 ?auto_20906 ) ) ( not ( = ?auto_20878 ?auto_20905 ) ) ( not ( = ?auto_20878 ?auto_20900 ) ) ( not ( = ?auto_20878 ?auto_20901 ) ) ( not ( = ?auto_20878 ?auto_20891 ) ) ( not ( = ?auto_20909 ?auto_20896 ) ) ( not ( = ?auto_20909 ?auto_20902 ) ) ( not ( = ?auto_20909 ?auto_20886 ) ) ( not ( = ?auto_20909 ?auto_20890 ) ) ( not ( = ?auto_20909 ?auto_20893 ) ) ( not ( = ?auto_20909 ?auto_20889 ) ) ( not ( = ?auto_20909 ?auto_20888 ) ) ( not ( = ?auto_20892 ?auto_20895 ) ) ( not ( = ?auto_20892 ?auto_20894 ) ) ( not ( = ?auto_20892 ?auto_20887 ) ) ( not ( = ?auto_20892 ?auto_20904 ) ) ( not ( = ?auto_20892 ?auto_20903 ) ) ( not ( = ?auto_20892 ?auto_20898 ) ) ( not ( = ?auto_20892 ?auto_20897 ) ) ( not ( = ?auto_20899 ?auto_20908 ) ) ( not ( = ?auto_20899 ?auto_20907 ) ) ( not ( = ?auto_20899 ?auto_20906 ) ) ( not ( = ?auto_20899 ?auto_20905 ) ) ( not ( = ?auto_20899 ?auto_20900 ) ) ( not ( = ?auto_20899 ?auto_20901 ) ) ( not ( = ?auto_20899 ?auto_20891 ) ) ( not ( = ?auto_20870 ?auto_20879 ) ) ( not ( = ?auto_20870 ?auto_20885 ) ) ( not ( = ?auto_20871 ?auto_20879 ) ) ( not ( = ?auto_20871 ?auto_20885 ) ) ( not ( = ?auto_20872 ?auto_20879 ) ) ( not ( = ?auto_20872 ?auto_20885 ) ) ( not ( = ?auto_20873 ?auto_20879 ) ) ( not ( = ?auto_20873 ?auto_20885 ) ) ( not ( = ?auto_20874 ?auto_20879 ) ) ( not ( = ?auto_20874 ?auto_20885 ) ) ( not ( = ?auto_20875 ?auto_20879 ) ) ( not ( = ?auto_20875 ?auto_20885 ) ) ( not ( = ?auto_20876 ?auto_20879 ) ) ( not ( = ?auto_20876 ?auto_20885 ) ) ( not ( = ?auto_20877 ?auto_20879 ) ) ( not ( = ?auto_20877 ?auto_20885 ) ) ( not ( = ?auto_20879 ?auto_20899 ) ) ( not ( = ?auto_20879 ?auto_20908 ) ) ( not ( = ?auto_20879 ?auto_20907 ) ) ( not ( = ?auto_20879 ?auto_20906 ) ) ( not ( = ?auto_20879 ?auto_20905 ) ) ( not ( = ?auto_20879 ?auto_20900 ) ) ( not ( = ?auto_20879 ?auto_20901 ) ) ( not ( = ?auto_20879 ?auto_20891 ) ) ( not ( = ?auto_20883 ?auto_20909 ) ) ( not ( = ?auto_20883 ?auto_20896 ) ) ( not ( = ?auto_20883 ?auto_20902 ) ) ( not ( = ?auto_20883 ?auto_20886 ) ) ( not ( = ?auto_20883 ?auto_20890 ) ) ( not ( = ?auto_20883 ?auto_20893 ) ) ( not ( = ?auto_20883 ?auto_20889 ) ) ( not ( = ?auto_20883 ?auto_20888 ) ) ( not ( = ?auto_20881 ?auto_20892 ) ) ( not ( = ?auto_20881 ?auto_20895 ) ) ( not ( = ?auto_20881 ?auto_20894 ) ) ( not ( = ?auto_20881 ?auto_20887 ) ) ( not ( = ?auto_20881 ?auto_20904 ) ) ( not ( = ?auto_20881 ?auto_20903 ) ) ( not ( = ?auto_20881 ?auto_20898 ) ) ( not ( = ?auto_20881 ?auto_20897 ) ) ( not ( = ?auto_20885 ?auto_20899 ) ) ( not ( = ?auto_20885 ?auto_20908 ) ) ( not ( = ?auto_20885 ?auto_20907 ) ) ( not ( = ?auto_20885 ?auto_20906 ) ) ( not ( = ?auto_20885 ?auto_20905 ) ) ( not ( = ?auto_20885 ?auto_20900 ) ) ( not ( = ?auto_20885 ?auto_20901 ) ) ( not ( = ?auto_20885 ?auto_20891 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 ?auto_20874 ?auto_20875 ?auto_20876 ?auto_20877 ?auto_20878 )
      ( MAKE-1CRATE ?auto_20878 ?auto_20879 )
      ( MAKE-9CRATE-VERIFY ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 ?auto_20874 ?auto_20875 ?auto_20876 ?auto_20877 ?auto_20878 ?auto_20879 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_20931 - SURFACE
      ?auto_20932 - SURFACE
      ?auto_20933 - SURFACE
      ?auto_20934 - SURFACE
      ?auto_20935 - SURFACE
      ?auto_20936 - SURFACE
      ?auto_20937 - SURFACE
      ?auto_20938 - SURFACE
      ?auto_20939 - SURFACE
      ?auto_20940 - SURFACE
      ?auto_20941 - SURFACE
    )
    :vars
    (
      ?auto_20947 - HOIST
      ?auto_20942 - PLACE
      ?auto_20945 - PLACE
      ?auto_20944 - HOIST
      ?auto_20946 - SURFACE
      ?auto_20955 - PLACE
      ?auto_20957 - HOIST
      ?auto_20961 - SURFACE
      ?auto_20950 - PLACE
      ?auto_20960 - HOIST
      ?auto_20958 - SURFACE
      ?auto_20966 - PLACE
      ?auto_20969 - HOIST
      ?auto_20973 - SURFACE
      ?auto_20952 - PLACE
      ?auto_20974 - HOIST
      ?auto_20948 - SURFACE
      ?auto_20953 - PLACE
      ?auto_20968 - HOIST
      ?auto_20956 - SURFACE
      ?auto_20967 - PLACE
      ?auto_20951 - HOIST
      ?auto_20972 - SURFACE
      ?auto_20954 - PLACE
      ?auto_20963 - HOIST
      ?auto_20959 - SURFACE
      ?auto_20962 - PLACE
      ?auto_20949 - HOIST
      ?auto_20964 - SURFACE
      ?auto_20971 - PLACE
      ?auto_20970 - HOIST
      ?auto_20965 - SURFACE
      ?auto_20943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20947 ?auto_20942 ) ( IS-CRATE ?auto_20941 ) ( not ( = ?auto_20945 ?auto_20942 ) ) ( HOIST-AT ?auto_20944 ?auto_20945 ) ( AVAILABLE ?auto_20944 ) ( SURFACE-AT ?auto_20941 ?auto_20945 ) ( ON ?auto_20941 ?auto_20946 ) ( CLEAR ?auto_20941 ) ( not ( = ?auto_20940 ?auto_20941 ) ) ( not ( = ?auto_20940 ?auto_20946 ) ) ( not ( = ?auto_20941 ?auto_20946 ) ) ( not ( = ?auto_20947 ?auto_20944 ) ) ( IS-CRATE ?auto_20940 ) ( not ( = ?auto_20955 ?auto_20942 ) ) ( HOIST-AT ?auto_20957 ?auto_20955 ) ( AVAILABLE ?auto_20957 ) ( SURFACE-AT ?auto_20940 ?auto_20955 ) ( ON ?auto_20940 ?auto_20961 ) ( CLEAR ?auto_20940 ) ( not ( = ?auto_20939 ?auto_20940 ) ) ( not ( = ?auto_20939 ?auto_20961 ) ) ( not ( = ?auto_20940 ?auto_20961 ) ) ( not ( = ?auto_20947 ?auto_20957 ) ) ( IS-CRATE ?auto_20939 ) ( not ( = ?auto_20950 ?auto_20942 ) ) ( HOIST-AT ?auto_20960 ?auto_20950 ) ( AVAILABLE ?auto_20960 ) ( SURFACE-AT ?auto_20939 ?auto_20950 ) ( ON ?auto_20939 ?auto_20958 ) ( CLEAR ?auto_20939 ) ( not ( = ?auto_20938 ?auto_20939 ) ) ( not ( = ?auto_20938 ?auto_20958 ) ) ( not ( = ?auto_20939 ?auto_20958 ) ) ( not ( = ?auto_20947 ?auto_20960 ) ) ( IS-CRATE ?auto_20938 ) ( not ( = ?auto_20966 ?auto_20942 ) ) ( HOIST-AT ?auto_20969 ?auto_20966 ) ( AVAILABLE ?auto_20969 ) ( SURFACE-AT ?auto_20938 ?auto_20966 ) ( ON ?auto_20938 ?auto_20973 ) ( CLEAR ?auto_20938 ) ( not ( = ?auto_20937 ?auto_20938 ) ) ( not ( = ?auto_20937 ?auto_20973 ) ) ( not ( = ?auto_20938 ?auto_20973 ) ) ( not ( = ?auto_20947 ?auto_20969 ) ) ( IS-CRATE ?auto_20937 ) ( not ( = ?auto_20952 ?auto_20942 ) ) ( HOIST-AT ?auto_20974 ?auto_20952 ) ( AVAILABLE ?auto_20974 ) ( SURFACE-AT ?auto_20937 ?auto_20952 ) ( ON ?auto_20937 ?auto_20948 ) ( CLEAR ?auto_20937 ) ( not ( = ?auto_20936 ?auto_20937 ) ) ( not ( = ?auto_20936 ?auto_20948 ) ) ( not ( = ?auto_20937 ?auto_20948 ) ) ( not ( = ?auto_20947 ?auto_20974 ) ) ( IS-CRATE ?auto_20936 ) ( not ( = ?auto_20953 ?auto_20942 ) ) ( HOIST-AT ?auto_20968 ?auto_20953 ) ( AVAILABLE ?auto_20968 ) ( SURFACE-AT ?auto_20936 ?auto_20953 ) ( ON ?auto_20936 ?auto_20956 ) ( CLEAR ?auto_20936 ) ( not ( = ?auto_20935 ?auto_20936 ) ) ( not ( = ?auto_20935 ?auto_20956 ) ) ( not ( = ?auto_20936 ?auto_20956 ) ) ( not ( = ?auto_20947 ?auto_20968 ) ) ( IS-CRATE ?auto_20935 ) ( not ( = ?auto_20967 ?auto_20942 ) ) ( HOIST-AT ?auto_20951 ?auto_20967 ) ( AVAILABLE ?auto_20951 ) ( SURFACE-AT ?auto_20935 ?auto_20967 ) ( ON ?auto_20935 ?auto_20972 ) ( CLEAR ?auto_20935 ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( not ( = ?auto_20934 ?auto_20972 ) ) ( not ( = ?auto_20935 ?auto_20972 ) ) ( not ( = ?auto_20947 ?auto_20951 ) ) ( IS-CRATE ?auto_20934 ) ( not ( = ?auto_20954 ?auto_20942 ) ) ( HOIST-AT ?auto_20963 ?auto_20954 ) ( AVAILABLE ?auto_20963 ) ( SURFACE-AT ?auto_20934 ?auto_20954 ) ( ON ?auto_20934 ?auto_20959 ) ( CLEAR ?auto_20934 ) ( not ( = ?auto_20933 ?auto_20934 ) ) ( not ( = ?auto_20933 ?auto_20959 ) ) ( not ( = ?auto_20934 ?auto_20959 ) ) ( not ( = ?auto_20947 ?auto_20963 ) ) ( IS-CRATE ?auto_20933 ) ( not ( = ?auto_20962 ?auto_20942 ) ) ( HOIST-AT ?auto_20949 ?auto_20962 ) ( AVAILABLE ?auto_20949 ) ( SURFACE-AT ?auto_20933 ?auto_20962 ) ( ON ?auto_20933 ?auto_20964 ) ( CLEAR ?auto_20933 ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20964 ) ) ( not ( = ?auto_20933 ?auto_20964 ) ) ( not ( = ?auto_20947 ?auto_20949 ) ) ( SURFACE-AT ?auto_20931 ?auto_20942 ) ( CLEAR ?auto_20931 ) ( IS-CRATE ?auto_20932 ) ( AVAILABLE ?auto_20947 ) ( not ( = ?auto_20971 ?auto_20942 ) ) ( HOIST-AT ?auto_20970 ?auto_20971 ) ( AVAILABLE ?auto_20970 ) ( SURFACE-AT ?auto_20932 ?auto_20971 ) ( ON ?auto_20932 ?auto_20965 ) ( CLEAR ?auto_20932 ) ( TRUCK-AT ?auto_20943 ?auto_20942 ) ( not ( = ?auto_20931 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20965 ) ) ( not ( = ?auto_20932 ?auto_20965 ) ) ( not ( = ?auto_20947 ?auto_20970 ) ) ( not ( = ?auto_20931 ?auto_20933 ) ) ( not ( = ?auto_20931 ?auto_20964 ) ) ( not ( = ?auto_20933 ?auto_20965 ) ) ( not ( = ?auto_20962 ?auto_20971 ) ) ( not ( = ?auto_20949 ?auto_20970 ) ) ( not ( = ?auto_20964 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20934 ) ) ( not ( = ?auto_20931 ?auto_20959 ) ) ( not ( = ?auto_20932 ?auto_20934 ) ) ( not ( = ?auto_20932 ?auto_20959 ) ) ( not ( = ?auto_20934 ?auto_20964 ) ) ( not ( = ?auto_20934 ?auto_20965 ) ) ( not ( = ?auto_20954 ?auto_20962 ) ) ( not ( = ?auto_20954 ?auto_20971 ) ) ( not ( = ?auto_20963 ?auto_20949 ) ) ( not ( = ?auto_20963 ?auto_20970 ) ) ( not ( = ?auto_20959 ?auto_20964 ) ) ( not ( = ?auto_20959 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20935 ) ) ( not ( = ?auto_20931 ?auto_20972 ) ) ( not ( = ?auto_20932 ?auto_20935 ) ) ( not ( = ?auto_20932 ?auto_20972 ) ) ( not ( = ?auto_20933 ?auto_20935 ) ) ( not ( = ?auto_20933 ?auto_20972 ) ) ( not ( = ?auto_20935 ?auto_20959 ) ) ( not ( = ?auto_20935 ?auto_20964 ) ) ( not ( = ?auto_20935 ?auto_20965 ) ) ( not ( = ?auto_20967 ?auto_20954 ) ) ( not ( = ?auto_20967 ?auto_20962 ) ) ( not ( = ?auto_20967 ?auto_20971 ) ) ( not ( = ?auto_20951 ?auto_20963 ) ) ( not ( = ?auto_20951 ?auto_20949 ) ) ( not ( = ?auto_20951 ?auto_20970 ) ) ( not ( = ?auto_20972 ?auto_20959 ) ) ( not ( = ?auto_20972 ?auto_20964 ) ) ( not ( = ?auto_20972 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20936 ) ) ( not ( = ?auto_20931 ?auto_20956 ) ) ( not ( = ?auto_20932 ?auto_20936 ) ) ( not ( = ?auto_20932 ?auto_20956 ) ) ( not ( = ?auto_20933 ?auto_20936 ) ) ( not ( = ?auto_20933 ?auto_20956 ) ) ( not ( = ?auto_20934 ?auto_20936 ) ) ( not ( = ?auto_20934 ?auto_20956 ) ) ( not ( = ?auto_20936 ?auto_20972 ) ) ( not ( = ?auto_20936 ?auto_20959 ) ) ( not ( = ?auto_20936 ?auto_20964 ) ) ( not ( = ?auto_20936 ?auto_20965 ) ) ( not ( = ?auto_20953 ?auto_20967 ) ) ( not ( = ?auto_20953 ?auto_20954 ) ) ( not ( = ?auto_20953 ?auto_20962 ) ) ( not ( = ?auto_20953 ?auto_20971 ) ) ( not ( = ?auto_20968 ?auto_20951 ) ) ( not ( = ?auto_20968 ?auto_20963 ) ) ( not ( = ?auto_20968 ?auto_20949 ) ) ( not ( = ?auto_20968 ?auto_20970 ) ) ( not ( = ?auto_20956 ?auto_20972 ) ) ( not ( = ?auto_20956 ?auto_20959 ) ) ( not ( = ?auto_20956 ?auto_20964 ) ) ( not ( = ?auto_20956 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20937 ) ) ( not ( = ?auto_20931 ?auto_20948 ) ) ( not ( = ?auto_20932 ?auto_20937 ) ) ( not ( = ?auto_20932 ?auto_20948 ) ) ( not ( = ?auto_20933 ?auto_20937 ) ) ( not ( = ?auto_20933 ?auto_20948 ) ) ( not ( = ?auto_20934 ?auto_20937 ) ) ( not ( = ?auto_20934 ?auto_20948 ) ) ( not ( = ?auto_20935 ?auto_20937 ) ) ( not ( = ?auto_20935 ?auto_20948 ) ) ( not ( = ?auto_20937 ?auto_20956 ) ) ( not ( = ?auto_20937 ?auto_20972 ) ) ( not ( = ?auto_20937 ?auto_20959 ) ) ( not ( = ?auto_20937 ?auto_20964 ) ) ( not ( = ?auto_20937 ?auto_20965 ) ) ( not ( = ?auto_20952 ?auto_20953 ) ) ( not ( = ?auto_20952 ?auto_20967 ) ) ( not ( = ?auto_20952 ?auto_20954 ) ) ( not ( = ?auto_20952 ?auto_20962 ) ) ( not ( = ?auto_20952 ?auto_20971 ) ) ( not ( = ?auto_20974 ?auto_20968 ) ) ( not ( = ?auto_20974 ?auto_20951 ) ) ( not ( = ?auto_20974 ?auto_20963 ) ) ( not ( = ?auto_20974 ?auto_20949 ) ) ( not ( = ?auto_20974 ?auto_20970 ) ) ( not ( = ?auto_20948 ?auto_20956 ) ) ( not ( = ?auto_20948 ?auto_20972 ) ) ( not ( = ?auto_20948 ?auto_20959 ) ) ( not ( = ?auto_20948 ?auto_20964 ) ) ( not ( = ?auto_20948 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20938 ) ) ( not ( = ?auto_20931 ?auto_20973 ) ) ( not ( = ?auto_20932 ?auto_20938 ) ) ( not ( = ?auto_20932 ?auto_20973 ) ) ( not ( = ?auto_20933 ?auto_20938 ) ) ( not ( = ?auto_20933 ?auto_20973 ) ) ( not ( = ?auto_20934 ?auto_20938 ) ) ( not ( = ?auto_20934 ?auto_20973 ) ) ( not ( = ?auto_20935 ?auto_20938 ) ) ( not ( = ?auto_20935 ?auto_20973 ) ) ( not ( = ?auto_20936 ?auto_20938 ) ) ( not ( = ?auto_20936 ?auto_20973 ) ) ( not ( = ?auto_20938 ?auto_20948 ) ) ( not ( = ?auto_20938 ?auto_20956 ) ) ( not ( = ?auto_20938 ?auto_20972 ) ) ( not ( = ?auto_20938 ?auto_20959 ) ) ( not ( = ?auto_20938 ?auto_20964 ) ) ( not ( = ?auto_20938 ?auto_20965 ) ) ( not ( = ?auto_20966 ?auto_20952 ) ) ( not ( = ?auto_20966 ?auto_20953 ) ) ( not ( = ?auto_20966 ?auto_20967 ) ) ( not ( = ?auto_20966 ?auto_20954 ) ) ( not ( = ?auto_20966 ?auto_20962 ) ) ( not ( = ?auto_20966 ?auto_20971 ) ) ( not ( = ?auto_20969 ?auto_20974 ) ) ( not ( = ?auto_20969 ?auto_20968 ) ) ( not ( = ?auto_20969 ?auto_20951 ) ) ( not ( = ?auto_20969 ?auto_20963 ) ) ( not ( = ?auto_20969 ?auto_20949 ) ) ( not ( = ?auto_20969 ?auto_20970 ) ) ( not ( = ?auto_20973 ?auto_20948 ) ) ( not ( = ?auto_20973 ?auto_20956 ) ) ( not ( = ?auto_20973 ?auto_20972 ) ) ( not ( = ?auto_20973 ?auto_20959 ) ) ( not ( = ?auto_20973 ?auto_20964 ) ) ( not ( = ?auto_20973 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20939 ) ) ( not ( = ?auto_20931 ?auto_20958 ) ) ( not ( = ?auto_20932 ?auto_20939 ) ) ( not ( = ?auto_20932 ?auto_20958 ) ) ( not ( = ?auto_20933 ?auto_20939 ) ) ( not ( = ?auto_20933 ?auto_20958 ) ) ( not ( = ?auto_20934 ?auto_20939 ) ) ( not ( = ?auto_20934 ?auto_20958 ) ) ( not ( = ?auto_20935 ?auto_20939 ) ) ( not ( = ?auto_20935 ?auto_20958 ) ) ( not ( = ?auto_20936 ?auto_20939 ) ) ( not ( = ?auto_20936 ?auto_20958 ) ) ( not ( = ?auto_20937 ?auto_20939 ) ) ( not ( = ?auto_20937 ?auto_20958 ) ) ( not ( = ?auto_20939 ?auto_20973 ) ) ( not ( = ?auto_20939 ?auto_20948 ) ) ( not ( = ?auto_20939 ?auto_20956 ) ) ( not ( = ?auto_20939 ?auto_20972 ) ) ( not ( = ?auto_20939 ?auto_20959 ) ) ( not ( = ?auto_20939 ?auto_20964 ) ) ( not ( = ?auto_20939 ?auto_20965 ) ) ( not ( = ?auto_20950 ?auto_20966 ) ) ( not ( = ?auto_20950 ?auto_20952 ) ) ( not ( = ?auto_20950 ?auto_20953 ) ) ( not ( = ?auto_20950 ?auto_20967 ) ) ( not ( = ?auto_20950 ?auto_20954 ) ) ( not ( = ?auto_20950 ?auto_20962 ) ) ( not ( = ?auto_20950 ?auto_20971 ) ) ( not ( = ?auto_20960 ?auto_20969 ) ) ( not ( = ?auto_20960 ?auto_20974 ) ) ( not ( = ?auto_20960 ?auto_20968 ) ) ( not ( = ?auto_20960 ?auto_20951 ) ) ( not ( = ?auto_20960 ?auto_20963 ) ) ( not ( = ?auto_20960 ?auto_20949 ) ) ( not ( = ?auto_20960 ?auto_20970 ) ) ( not ( = ?auto_20958 ?auto_20973 ) ) ( not ( = ?auto_20958 ?auto_20948 ) ) ( not ( = ?auto_20958 ?auto_20956 ) ) ( not ( = ?auto_20958 ?auto_20972 ) ) ( not ( = ?auto_20958 ?auto_20959 ) ) ( not ( = ?auto_20958 ?auto_20964 ) ) ( not ( = ?auto_20958 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20940 ) ) ( not ( = ?auto_20931 ?auto_20961 ) ) ( not ( = ?auto_20932 ?auto_20940 ) ) ( not ( = ?auto_20932 ?auto_20961 ) ) ( not ( = ?auto_20933 ?auto_20940 ) ) ( not ( = ?auto_20933 ?auto_20961 ) ) ( not ( = ?auto_20934 ?auto_20940 ) ) ( not ( = ?auto_20934 ?auto_20961 ) ) ( not ( = ?auto_20935 ?auto_20940 ) ) ( not ( = ?auto_20935 ?auto_20961 ) ) ( not ( = ?auto_20936 ?auto_20940 ) ) ( not ( = ?auto_20936 ?auto_20961 ) ) ( not ( = ?auto_20937 ?auto_20940 ) ) ( not ( = ?auto_20937 ?auto_20961 ) ) ( not ( = ?auto_20938 ?auto_20940 ) ) ( not ( = ?auto_20938 ?auto_20961 ) ) ( not ( = ?auto_20940 ?auto_20958 ) ) ( not ( = ?auto_20940 ?auto_20973 ) ) ( not ( = ?auto_20940 ?auto_20948 ) ) ( not ( = ?auto_20940 ?auto_20956 ) ) ( not ( = ?auto_20940 ?auto_20972 ) ) ( not ( = ?auto_20940 ?auto_20959 ) ) ( not ( = ?auto_20940 ?auto_20964 ) ) ( not ( = ?auto_20940 ?auto_20965 ) ) ( not ( = ?auto_20955 ?auto_20950 ) ) ( not ( = ?auto_20955 ?auto_20966 ) ) ( not ( = ?auto_20955 ?auto_20952 ) ) ( not ( = ?auto_20955 ?auto_20953 ) ) ( not ( = ?auto_20955 ?auto_20967 ) ) ( not ( = ?auto_20955 ?auto_20954 ) ) ( not ( = ?auto_20955 ?auto_20962 ) ) ( not ( = ?auto_20955 ?auto_20971 ) ) ( not ( = ?auto_20957 ?auto_20960 ) ) ( not ( = ?auto_20957 ?auto_20969 ) ) ( not ( = ?auto_20957 ?auto_20974 ) ) ( not ( = ?auto_20957 ?auto_20968 ) ) ( not ( = ?auto_20957 ?auto_20951 ) ) ( not ( = ?auto_20957 ?auto_20963 ) ) ( not ( = ?auto_20957 ?auto_20949 ) ) ( not ( = ?auto_20957 ?auto_20970 ) ) ( not ( = ?auto_20961 ?auto_20958 ) ) ( not ( = ?auto_20961 ?auto_20973 ) ) ( not ( = ?auto_20961 ?auto_20948 ) ) ( not ( = ?auto_20961 ?auto_20956 ) ) ( not ( = ?auto_20961 ?auto_20972 ) ) ( not ( = ?auto_20961 ?auto_20959 ) ) ( not ( = ?auto_20961 ?auto_20964 ) ) ( not ( = ?auto_20961 ?auto_20965 ) ) ( not ( = ?auto_20931 ?auto_20941 ) ) ( not ( = ?auto_20931 ?auto_20946 ) ) ( not ( = ?auto_20932 ?auto_20941 ) ) ( not ( = ?auto_20932 ?auto_20946 ) ) ( not ( = ?auto_20933 ?auto_20941 ) ) ( not ( = ?auto_20933 ?auto_20946 ) ) ( not ( = ?auto_20934 ?auto_20941 ) ) ( not ( = ?auto_20934 ?auto_20946 ) ) ( not ( = ?auto_20935 ?auto_20941 ) ) ( not ( = ?auto_20935 ?auto_20946 ) ) ( not ( = ?auto_20936 ?auto_20941 ) ) ( not ( = ?auto_20936 ?auto_20946 ) ) ( not ( = ?auto_20937 ?auto_20941 ) ) ( not ( = ?auto_20937 ?auto_20946 ) ) ( not ( = ?auto_20938 ?auto_20941 ) ) ( not ( = ?auto_20938 ?auto_20946 ) ) ( not ( = ?auto_20939 ?auto_20941 ) ) ( not ( = ?auto_20939 ?auto_20946 ) ) ( not ( = ?auto_20941 ?auto_20961 ) ) ( not ( = ?auto_20941 ?auto_20958 ) ) ( not ( = ?auto_20941 ?auto_20973 ) ) ( not ( = ?auto_20941 ?auto_20948 ) ) ( not ( = ?auto_20941 ?auto_20956 ) ) ( not ( = ?auto_20941 ?auto_20972 ) ) ( not ( = ?auto_20941 ?auto_20959 ) ) ( not ( = ?auto_20941 ?auto_20964 ) ) ( not ( = ?auto_20941 ?auto_20965 ) ) ( not ( = ?auto_20945 ?auto_20955 ) ) ( not ( = ?auto_20945 ?auto_20950 ) ) ( not ( = ?auto_20945 ?auto_20966 ) ) ( not ( = ?auto_20945 ?auto_20952 ) ) ( not ( = ?auto_20945 ?auto_20953 ) ) ( not ( = ?auto_20945 ?auto_20967 ) ) ( not ( = ?auto_20945 ?auto_20954 ) ) ( not ( = ?auto_20945 ?auto_20962 ) ) ( not ( = ?auto_20945 ?auto_20971 ) ) ( not ( = ?auto_20944 ?auto_20957 ) ) ( not ( = ?auto_20944 ?auto_20960 ) ) ( not ( = ?auto_20944 ?auto_20969 ) ) ( not ( = ?auto_20944 ?auto_20974 ) ) ( not ( = ?auto_20944 ?auto_20968 ) ) ( not ( = ?auto_20944 ?auto_20951 ) ) ( not ( = ?auto_20944 ?auto_20963 ) ) ( not ( = ?auto_20944 ?auto_20949 ) ) ( not ( = ?auto_20944 ?auto_20970 ) ) ( not ( = ?auto_20946 ?auto_20961 ) ) ( not ( = ?auto_20946 ?auto_20958 ) ) ( not ( = ?auto_20946 ?auto_20973 ) ) ( not ( = ?auto_20946 ?auto_20948 ) ) ( not ( = ?auto_20946 ?auto_20956 ) ) ( not ( = ?auto_20946 ?auto_20972 ) ) ( not ( = ?auto_20946 ?auto_20959 ) ) ( not ( = ?auto_20946 ?auto_20964 ) ) ( not ( = ?auto_20946 ?auto_20965 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20931 ?auto_20932 ?auto_20933 ?auto_20934 ?auto_20935 ?auto_20936 ?auto_20937 ?auto_20938 ?auto_20939 ?auto_20940 )
      ( MAKE-1CRATE ?auto_20940 ?auto_20941 )
      ( MAKE-10CRATE-VERIFY ?auto_20931 ?auto_20932 ?auto_20933 ?auto_20934 ?auto_20935 ?auto_20936 ?auto_20937 ?auto_20938 ?auto_20939 ?auto_20940 ?auto_20941 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_20997 - SURFACE
      ?auto_20998 - SURFACE
      ?auto_20999 - SURFACE
      ?auto_21000 - SURFACE
      ?auto_21001 - SURFACE
      ?auto_21002 - SURFACE
      ?auto_21003 - SURFACE
      ?auto_21004 - SURFACE
      ?auto_21005 - SURFACE
      ?auto_21006 - SURFACE
      ?auto_21007 - SURFACE
      ?auto_21008 - SURFACE
    )
    :vars
    (
      ?auto_21010 - HOIST
      ?auto_21009 - PLACE
      ?auto_21012 - PLACE
      ?auto_21013 - HOIST
      ?auto_21014 - SURFACE
      ?auto_21027 - PLACE
      ?auto_21039 - HOIST
      ?auto_21032 - SURFACE
      ?auto_21035 - PLACE
      ?auto_21042 - HOIST
      ?auto_21022 - SURFACE
      ?auto_21033 - PLACE
      ?auto_21040 - HOIST
      ?auto_21041 - SURFACE
      ?auto_21030 - PLACE
      ?auto_21019 - HOIST
      ?auto_21031 - SURFACE
      ?auto_21017 - PLACE
      ?auto_21016 - HOIST
      ?auto_21021 - SURFACE
      ?auto_21037 - PLACE
      ?auto_21034 - HOIST
      ?auto_21020 - SURFACE
      ?auto_21036 - PLACE
      ?auto_21026 - HOIST
      ?auto_21018 - SURFACE
      ?auto_21029 - SURFACE
      ?auto_21025 - PLACE
      ?auto_21015 - HOIST
      ?auto_21028 - SURFACE
      ?auto_21038 - PLACE
      ?auto_21023 - HOIST
      ?auto_21024 - SURFACE
      ?auto_21011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21010 ?auto_21009 ) ( IS-CRATE ?auto_21008 ) ( not ( = ?auto_21012 ?auto_21009 ) ) ( HOIST-AT ?auto_21013 ?auto_21012 ) ( SURFACE-AT ?auto_21008 ?auto_21012 ) ( ON ?auto_21008 ?auto_21014 ) ( CLEAR ?auto_21008 ) ( not ( = ?auto_21007 ?auto_21008 ) ) ( not ( = ?auto_21007 ?auto_21014 ) ) ( not ( = ?auto_21008 ?auto_21014 ) ) ( not ( = ?auto_21010 ?auto_21013 ) ) ( IS-CRATE ?auto_21007 ) ( not ( = ?auto_21027 ?auto_21009 ) ) ( HOIST-AT ?auto_21039 ?auto_21027 ) ( AVAILABLE ?auto_21039 ) ( SURFACE-AT ?auto_21007 ?auto_21027 ) ( ON ?auto_21007 ?auto_21032 ) ( CLEAR ?auto_21007 ) ( not ( = ?auto_21006 ?auto_21007 ) ) ( not ( = ?auto_21006 ?auto_21032 ) ) ( not ( = ?auto_21007 ?auto_21032 ) ) ( not ( = ?auto_21010 ?auto_21039 ) ) ( IS-CRATE ?auto_21006 ) ( not ( = ?auto_21035 ?auto_21009 ) ) ( HOIST-AT ?auto_21042 ?auto_21035 ) ( AVAILABLE ?auto_21042 ) ( SURFACE-AT ?auto_21006 ?auto_21035 ) ( ON ?auto_21006 ?auto_21022 ) ( CLEAR ?auto_21006 ) ( not ( = ?auto_21005 ?auto_21006 ) ) ( not ( = ?auto_21005 ?auto_21022 ) ) ( not ( = ?auto_21006 ?auto_21022 ) ) ( not ( = ?auto_21010 ?auto_21042 ) ) ( IS-CRATE ?auto_21005 ) ( not ( = ?auto_21033 ?auto_21009 ) ) ( HOIST-AT ?auto_21040 ?auto_21033 ) ( AVAILABLE ?auto_21040 ) ( SURFACE-AT ?auto_21005 ?auto_21033 ) ( ON ?auto_21005 ?auto_21041 ) ( CLEAR ?auto_21005 ) ( not ( = ?auto_21004 ?auto_21005 ) ) ( not ( = ?auto_21004 ?auto_21041 ) ) ( not ( = ?auto_21005 ?auto_21041 ) ) ( not ( = ?auto_21010 ?auto_21040 ) ) ( IS-CRATE ?auto_21004 ) ( not ( = ?auto_21030 ?auto_21009 ) ) ( HOIST-AT ?auto_21019 ?auto_21030 ) ( AVAILABLE ?auto_21019 ) ( SURFACE-AT ?auto_21004 ?auto_21030 ) ( ON ?auto_21004 ?auto_21031 ) ( CLEAR ?auto_21004 ) ( not ( = ?auto_21003 ?auto_21004 ) ) ( not ( = ?auto_21003 ?auto_21031 ) ) ( not ( = ?auto_21004 ?auto_21031 ) ) ( not ( = ?auto_21010 ?auto_21019 ) ) ( IS-CRATE ?auto_21003 ) ( not ( = ?auto_21017 ?auto_21009 ) ) ( HOIST-AT ?auto_21016 ?auto_21017 ) ( AVAILABLE ?auto_21016 ) ( SURFACE-AT ?auto_21003 ?auto_21017 ) ( ON ?auto_21003 ?auto_21021 ) ( CLEAR ?auto_21003 ) ( not ( = ?auto_21002 ?auto_21003 ) ) ( not ( = ?auto_21002 ?auto_21021 ) ) ( not ( = ?auto_21003 ?auto_21021 ) ) ( not ( = ?auto_21010 ?auto_21016 ) ) ( IS-CRATE ?auto_21002 ) ( not ( = ?auto_21037 ?auto_21009 ) ) ( HOIST-AT ?auto_21034 ?auto_21037 ) ( AVAILABLE ?auto_21034 ) ( SURFACE-AT ?auto_21002 ?auto_21037 ) ( ON ?auto_21002 ?auto_21020 ) ( CLEAR ?auto_21002 ) ( not ( = ?auto_21001 ?auto_21002 ) ) ( not ( = ?auto_21001 ?auto_21020 ) ) ( not ( = ?auto_21002 ?auto_21020 ) ) ( not ( = ?auto_21010 ?auto_21034 ) ) ( IS-CRATE ?auto_21001 ) ( not ( = ?auto_21036 ?auto_21009 ) ) ( HOIST-AT ?auto_21026 ?auto_21036 ) ( AVAILABLE ?auto_21026 ) ( SURFACE-AT ?auto_21001 ?auto_21036 ) ( ON ?auto_21001 ?auto_21018 ) ( CLEAR ?auto_21001 ) ( not ( = ?auto_21000 ?auto_21001 ) ) ( not ( = ?auto_21000 ?auto_21018 ) ) ( not ( = ?auto_21001 ?auto_21018 ) ) ( not ( = ?auto_21010 ?auto_21026 ) ) ( IS-CRATE ?auto_21000 ) ( AVAILABLE ?auto_21013 ) ( SURFACE-AT ?auto_21000 ?auto_21012 ) ( ON ?auto_21000 ?auto_21029 ) ( CLEAR ?auto_21000 ) ( not ( = ?auto_20999 ?auto_21000 ) ) ( not ( = ?auto_20999 ?auto_21029 ) ) ( not ( = ?auto_21000 ?auto_21029 ) ) ( IS-CRATE ?auto_20999 ) ( not ( = ?auto_21025 ?auto_21009 ) ) ( HOIST-AT ?auto_21015 ?auto_21025 ) ( AVAILABLE ?auto_21015 ) ( SURFACE-AT ?auto_20999 ?auto_21025 ) ( ON ?auto_20999 ?auto_21028 ) ( CLEAR ?auto_20999 ) ( not ( = ?auto_20998 ?auto_20999 ) ) ( not ( = ?auto_20998 ?auto_21028 ) ) ( not ( = ?auto_20999 ?auto_21028 ) ) ( not ( = ?auto_21010 ?auto_21015 ) ) ( SURFACE-AT ?auto_20997 ?auto_21009 ) ( CLEAR ?auto_20997 ) ( IS-CRATE ?auto_20998 ) ( AVAILABLE ?auto_21010 ) ( not ( = ?auto_21038 ?auto_21009 ) ) ( HOIST-AT ?auto_21023 ?auto_21038 ) ( AVAILABLE ?auto_21023 ) ( SURFACE-AT ?auto_20998 ?auto_21038 ) ( ON ?auto_20998 ?auto_21024 ) ( CLEAR ?auto_20998 ) ( TRUCK-AT ?auto_21011 ?auto_21009 ) ( not ( = ?auto_20997 ?auto_20998 ) ) ( not ( = ?auto_20997 ?auto_21024 ) ) ( not ( = ?auto_20998 ?auto_21024 ) ) ( not ( = ?auto_21010 ?auto_21023 ) ) ( not ( = ?auto_20997 ?auto_20999 ) ) ( not ( = ?auto_20997 ?auto_21028 ) ) ( not ( = ?auto_20999 ?auto_21024 ) ) ( not ( = ?auto_21025 ?auto_21038 ) ) ( not ( = ?auto_21015 ?auto_21023 ) ) ( not ( = ?auto_21028 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21000 ) ) ( not ( = ?auto_20997 ?auto_21029 ) ) ( not ( = ?auto_20998 ?auto_21000 ) ) ( not ( = ?auto_20998 ?auto_21029 ) ) ( not ( = ?auto_21000 ?auto_21028 ) ) ( not ( = ?auto_21000 ?auto_21024 ) ) ( not ( = ?auto_21012 ?auto_21025 ) ) ( not ( = ?auto_21012 ?auto_21038 ) ) ( not ( = ?auto_21013 ?auto_21015 ) ) ( not ( = ?auto_21013 ?auto_21023 ) ) ( not ( = ?auto_21029 ?auto_21028 ) ) ( not ( = ?auto_21029 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21001 ) ) ( not ( = ?auto_20997 ?auto_21018 ) ) ( not ( = ?auto_20998 ?auto_21001 ) ) ( not ( = ?auto_20998 ?auto_21018 ) ) ( not ( = ?auto_20999 ?auto_21001 ) ) ( not ( = ?auto_20999 ?auto_21018 ) ) ( not ( = ?auto_21001 ?auto_21029 ) ) ( not ( = ?auto_21001 ?auto_21028 ) ) ( not ( = ?auto_21001 ?auto_21024 ) ) ( not ( = ?auto_21036 ?auto_21012 ) ) ( not ( = ?auto_21036 ?auto_21025 ) ) ( not ( = ?auto_21036 ?auto_21038 ) ) ( not ( = ?auto_21026 ?auto_21013 ) ) ( not ( = ?auto_21026 ?auto_21015 ) ) ( not ( = ?auto_21026 ?auto_21023 ) ) ( not ( = ?auto_21018 ?auto_21029 ) ) ( not ( = ?auto_21018 ?auto_21028 ) ) ( not ( = ?auto_21018 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21002 ) ) ( not ( = ?auto_20997 ?auto_21020 ) ) ( not ( = ?auto_20998 ?auto_21002 ) ) ( not ( = ?auto_20998 ?auto_21020 ) ) ( not ( = ?auto_20999 ?auto_21002 ) ) ( not ( = ?auto_20999 ?auto_21020 ) ) ( not ( = ?auto_21000 ?auto_21002 ) ) ( not ( = ?auto_21000 ?auto_21020 ) ) ( not ( = ?auto_21002 ?auto_21018 ) ) ( not ( = ?auto_21002 ?auto_21029 ) ) ( not ( = ?auto_21002 ?auto_21028 ) ) ( not ( = ?auto_21002 ?auto_21024 ) ) ( not ( = ?auto_21037 ?auto_21036 ) ) ( not ( = ?auto_21037 ?auto_21012 ) ) ( not ( = ?auto_21037 ?auto_21025 ) ) ( not ( = ?auto_21037 ?auto_21038 ) ) ( not ( = ?auto_21034 ?auto_21026 ) ) ( not ( = ?auto_21034 ?auto_21013 ) ) ( not ( = ?auto_21034 ?auto_21015 ) ) ( not ( = ?auto_21034 ?auto_21023 ) ) ( not ( = ?auto_21020 ?auto_21018 ) ) ( not ( = ?auto_21020 ?auto_21029 ) ) ( not ( = ?auto_21020 ?auto_21028 ) ) ( not ( = ?auto_21020 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21003 ) ) ( not ( = ?auto_20997 ?auto_21021 ) ) ( not ( = ?auto_20998 ?auto_21003 ) ) ( not ( = ?auto_20998 ?auto_21021 ) ) ( not ( = ?auto_20999 ?auto_21003 ) ) ( not ( = ?auto_20999 ?auto_21021 ) ) ( not ( = ?auto_21000 ?auto_21003 ) ) ( not ( = ?auto_21000 ?auto_21021 ) ) ( not ( = ?auto_21001 ?auto_21003 ) ) ( not ( = ?auto_21001 ?auto_21021 ) ) ( not ( = ?auto_21003 ?auto_21020 ) ) ( not ( = ?auto_21003 ?auto_21018 ) ) ( not ( = ?auto_21003 ?auto_21029 ) ) ( not ( = ?auto_21003 ?auto_21028 ) ) ( not ( = ?auto_21003 ?auto_21024 ) ) ( not ( = ?auto_21017 ?auto_21037 ) ) ( not ( = ?auto_21017 ?auto_21036 ) ) ( not ( = ?auto_21017 ?auto_21012 ) ) ( not ( = ?auto_21017 ?auto_21025 ) ) ( not ( = ?auto_21017 ?auto_21038 ) ) ( not ( = ?auto_21016 ?auto_21034 ) ) ( not ( = ?auto_21016 ?auto_21026 ) ) ( not ( = ?auto_21016 ?auto_21013 ) ) ( not ( = ?auto_21016 ?auto_21015 ) ) ( not ( = ?auto_21016 ?auto_21023 ) ) ( not ( = ?auto_21021 ?auto_21020 ) ) ( not ( = ?auto_21021 ?auto_21018 ) ) ( not ( = ?auto_21021 ?auto_21029 ) ) ( not ( = ?auto_21021 ?auto_21028 ) ) ( not ( = ?auto_21021 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21004 ) ) ( not ( = ?auto_20997 ?auto_21031 ) ) ( not ( = ?auto_20998 ?auto_21004 ) ) ( not ( = ?auto_20998 ?auto_21031 ) ) ( not ( = ?auto_20999 ?auto_21004 ) ) ( not ( = ?auto_20999 ?auto_21031 ) ) ( not ( = ?auto_21000 ?auto_21004 ) ) ( not ( = ?auto_21000 ?auto_21031 ) ) ( not ( = ?auto_21001 ?auto_21004 ) ) ( not ( = ?auto_21001 ?auto_21031 ) ) ( not ( = ?auto_21002 ?auto_21004 ) ) ( not ( = ?auto_21002 ?auto_21031 ) ) ( not ( = ?auto_21004 ?auto_21021 ) ) ( not ( = ?auto_21004 ?auto_21020 ) ) ( not ( = ?auto_21004 ?auto_21018 ) ) ( not ( = ?auto_21004 ?auto_21029 ) ) ( not ( = ?auto_21004 ?auto_21028 ) ) ( not ( = ?auto_21004 ?auto_21024 ) ) ( not ( = ?auto_21030 ?auto_21017 ) ) ( not ( = ?auto_21030 ?auto_21037 ) ) ( not ( = ?auto_21030 ?auto_21036 ) ) ( not ( = ?auto_21030 ?auto_21012 ) ) ( not ( = ?auto_21030 ?auto_21025 ) ) ( not ( = ?auto_21030 ?auto_21038 ) ) ( not ( = ?auto_21019 ?auto_21016 ) ) ( not ( = ?auto_21019 ?auto_21034 ) ) ( not ( = ?auto_21019 ?auto_21026 ) ) ( not ( = ?auto_21019 ?auto_21013 ) ) ( not ( = ?auto_21019 ?auto_21015 ) ) ( not ( = ?auto_21019 ?auto_21023 ) ) ( not ( = ?auto_21031 ?auto_21021 ) ) ( not ( = ?auto_21031 ?auto_21020 ) ) ( not ( = ?auto_21031 ?auto_21018 ) ) ( not ( = ?auto_21031 ?auto_21029 ) ) ( not ( = ?auto_21031 ?auto_21028 ) ) ( not ( = ?auto_21031 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21005 ) ) ( not ( = ?auto_20997 ?auto_21041 ) ) ( not ( = ?auto_20998 ?auto_21005 ) ) ( not ( = ?auto_20998 ?auto_21041 ) ) ( not ( = ?auto_20999 ?auto_21005 ) ) ( not ( = ?auto_20999 ?auto_21041 ) ) ( not ( = ?auto_21000 ?auto_21005 ) ) ( not ( = ?auto_21000 ?auto_21041 ) ) ( not ( = ?auto_21001 ?auto_21005 ) ) ( not ( = ?auto_21001 ?auto_21041 ) ) ( not ( = ?auto_21002 ?auto_21005 ) ) ( not ( = ?auto_21002 ?auto_21041 ) ) ( not ( = ?auto_21003 ?auto_21005 ) ) ( not ( = ?auto_21003 ?auto_21041 ) ) ( not ( = ?auto_21005 ?auto_21031 ) ) ( not ( = ?auto_21005 ?auto_21021 ) ) ( not ( = ?auto_21005 ?auto_21020 ) ) ( not ( = ?auto_21005 ?auto_21018 ) ) ( not ( = ?auto_21005 ?auto_21029 ) ) ( not ( = ?auto_21005 ?auto_21028 ) ) ( not ( = ?auto_21005 ?auto_21024 ) ) ( not ( = ?auto_21033 ?auto_21030 ) ) ( not ( = ?auto_21033 ?auto_21017 ) ) ( not ( = ?auto_21033 ?auto_21037 ) ) ( not ( = ?auto_21033 ?auto_21036 ) ) ( not ( = ?auto_21033 ?auto_21012 ) ) ( not ( = ?auto_21033 ?auto_21025 ) ) ( not ( = ?auto_21033 ?auto_21038 ) ) ( not ( = ?auto_21040 ?auto_21019 ) ) ( not ( = ?auto_21040 ?auto_21016 ) ) ( not ( = ?auto_21040 ?auto_21034 ) ) ( not ( = ?auto_21040 ?auto_21026 ) ) ( not ( = ?auto_21040 ?auto_21013 ) ) ( not ( = ?auto_21040 ?auto_21015 ) ) ( not ( = ?auto_21040 ?auto_21023 ) ) ( not ( = ?auto_21041 ?auto_21031 ) ) ( not ( = ?auto_21041 ?auto_21021 ) ) ( not ( = ?auto_21041 ?auto_21020 ) ) ( not ( = ?auto_21041 ?auto_21018 ) ) ( not ( = ?auto_21041 ?auto_21029 ) ) ( not ( = ?auto_21041 ?auto_21028 ) ) ( not ( = ?auto_21041 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21006 ) ) ( not ( = ?auto_20997 ?auto_21022 ) ) ( not ( = ?auto_20998 ?auto_21006 ) ) ( not ( = ?auto_20998 ?auto_21022 ) ) ( not ( = ?auto_20999 ?auto_21006 ) ) ( not ( = ?auto_20999 ?auto_21022 ) ) ( not ( = ?auto_21000 ?auto_21006 ) ) ( not ( = ?auto_21000 ?auto_21022 ) ) ( not ( = ?auto_21001 ?auto_21006 ) ) ( not ( = ?auto_21001 ?auto_21022 ) ) ( not ( = ?auto_21002 ?auto_21006 ) ) ( not ( = ?auto_21002 ?auto_21022 ) ) ( not ( = ?auto_21003 ?auto_21006 ) ) ( not ( = ?auto_21003 ?auto_21022 ) ) ( not ( = ?auto_21004 ?auto_21006 ) ) ( not ( = ?auto_21004 ?auto_21022 ) ) ( not ( = ?auto_21006 ?auto_21041 ) ) ( not ( = ?auto_21006 ?auto_21031 ) ) ( not ( = ?auto_21006 ?auto_21021 ) ) ( not ( = ?auto_21006 ?auto_21020 ) ) ( not ( = ?auto_21006 ?auto_21018 ) ) ( not ( = ?auto_21006 ?auto_21029 ) ) ( not ( = ?auto_21006 ?auto_21028 ) ) ( not ( = ?auto_21006 ?auto_21024 ) ) ( not ( = ?auto_21035 ?auto_21033 ) ) ( not ( = ?auto_21035 ?auto_21030 ) ) ( not ( = ?auto_21035 ?auto_21017 ) ) ( not ( = ?auto_21035 ?auto_21037 ) ) ( not ( = ?auto_21035 ?auto_21036 ) ) ( not ( = ?auto_21035 ?auto_21012 ) ) ( not ( = ?auto_21035 ?auto_21025 ) ) ( not ( = ?auto_21035 ?auto_21038 ) ) ( not ( = ?auto_21042 ?auto_21040 ) ) ( not ( = ?auto_21042 ?auto_21019 ) ) ( not ( = ?auto_21042 ?auto_21016 ) ) ( not ( = ?auto_21042 ?auto_21034 ) ) ( not ( = ?auto_21042 ?auto_21026 ) ) ( not ( = ?auto_21042 ?auto_21013 ) ) ( not ( = ?auto_21042 ?auto_21015 ) ) ( not ( = ?auto_21042 ?auto_21023 ) ) ( not ( = ?auto_21022 ?auto_21041 ) ) ( not ( = ?auto_21022 ?auto_21031 ) ) ( not ( = ?auto_21022 ?auto_21021 ) ) ( not ( = ?auto_21022 ?auto_21020 ) ) ( not ( = ?auto_21022 ?auto_21018 ) ) ( not ( = ?auto_21022 ?auto_21029 ) ) ( not ( = ?auto_21022 ?auto_21028 ) ) ( not ( = ?auto_21022 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21007 ) ) ( not ( = ?auto_20997 ?auto_21032 ) ) ( not ( = ?auto_20998 ?auto_21007 ) ) ( not ( = ?auto_20998 ?auto_21032 ) ) ( not ( = ?auto_20999 ?auto_21007 ) ) ( not ( = ?auto_20999 ?auto_21032 ) ) ( not ( = ?auto_21000 ?auto_21007 ) ) ( not ( = ?auto_21000 ?auto_21032 ) ) ( not ( = ?auto_21001 ?auto_21007 ) ) ( not ( = ?auto_21001 ?auto_21032 ) ) ( not ( = ?auto_21002 ?auto_21007 ) ) ( not ( = ?auto_21002 ?auto_21032 ) ) ( not ( = ?auto_21003 ?auto_21007 ) ) ( not ( = ?auto_21003 ?auto_21032 ) ) ( not ( = ?auto_21004 ?auto_21007 ) ) ( not ( = ?auto_21004 ?auto_21032 ) ) ( not ( = ?auto_21005 ?auto_21007 ) ) ( not ( = ?auto_21005 ?auto_21032 ) ) ( not ( = ?auto_21007 ?auto_21022 ) ) ( not ( = ?auto_21007 ?auto_21041 ) ) ( not ( = ?auto_21007 ?auto_21031 ) ) ( not ( = ?auto_21007 ?auto_21021 ) ) ( not ( = ?auto_21007 ?auto_21020 ) ) ( not ( = ?auto_21007 ?auto_21018 ) ) ( not ( = ?auto_21007 ?auto_21029 ) ) ( not ( = ?auto_21007 ?auto_21028 ) ) ( not ( = ?auto_21007 ?auto_21024 ) ) ( not ( = ?auto_21027 ?auto_21035 ) ) ( not ( = ?auto_21027 ?auto_21033 ) ) ( not ( = ?auto_21027 ?auto_21030 ) ) ( not ( = ?auto_21027 ?auto_21017 ) ) ( not ( = ?auto_21027 ?auto_21037 ) ) ( not ( = ?auto_21027 ?auto_21036 ) ) ( not ( = ?auto_21027 ?auto_21012 ) ) ( not ( = ?auto_21027 ?auto_21025 ) ) ( not ( = ?auto_21027 ?auto_21038 ) ) ( not ( = ?auto_21039 ?auto_21042 ) ) ( not ( = ?auto_21039 ?auto_21040 ) ) ( not ( = ?auto_21039 ?auto_21019 ) ) ( not ( = ?auto_21039 ?auto_21016 ) ) ( not ( = ?auto_21039 ?auto_21034 ) ) ( not ( = ?auto_21039 ?auto_21026 ) ) ( not ( = ?auto_21039 ?auto_21013 ) ) ( not ( = ?auto_21039 ?auto_21015 ) ) ( not ( = ?auto_21039 ?auto_21023 ) ) ( not ( = ?auto_21032 ?auto_21022 ) ) ( not ( = ?auto_21032 ?auto_21041 ) ) ( not ( = ?auto_21032 ?auto_21031 ) ) ( not ( = ?auto_21032 ?auto_21021 ) ) ( not ( = ?auto_21032 ?auto_21020 ) ) ( not ( = ?auto_21032 ?auto_21018 ) ) ( not ( = ?auto_21032 ?auto_21029 ) ) ( not ( = ?auto_21032 ?auto_21028 ) ) ( not ( = ?auto_21032 ?auto_21024 ) ) ( not ( = ?auto_20997 ?auto_21008 ) ) ( not ( = ?auto_20997 ?auto_21014 ) ) ( not ( = ?auto_20998 ?auto_21008 ) ) ( not ( = ?auto_20998 ?auto_21014 ) ) ( not ( = ?auto_20999 ?auto_21008 ) ) ( not ( = ?auto_20999 ?auto_21014 ) ) ( not ( = ?auto_21000 ?auto_21008 ) ) ( not ( = ?auto_21000 ?auto_21014 ) ) ( not ( = ?auto_21001 ?auto_21008 ) ) ( not ( = ?auto_21001 ?auto_21014 ) ) ( not ( = ?auto_21002 ?auto_21008 ) ) ( not ( = ?auto_21002 ?auto_21014 ) ) ( not ( = ?auto_21003 ?auto_21008 ) ) ( not ( = ?auto_21003 ?auto_21014 ) ) ( not ( = ?auto_21004 ?auto_21008 ) ) ( not ( = ?auto_21004 ?auto_21014 ) ) ( not ( = ?auto_21005 ?auto_21008 ) ) ( not ( = ?auto_21005 ?auto_21014 ) ) ( not ( = ?auto_21006 ?auto_21008 ) ) ( not ( = ?auto_21006 ?auto_21014 ) ) ( not ( = ?auto_21008 ?auto_21032 ) ) ( not ( = ?auto_21008 ?auto_21022 ) ) ( not ( = ?auto_21008 ?auto_21041 ) ) ( not ( = ?auto_21008 ?auto_21031 ) ) ( not ( = ?auto_21008 ?auto_21021 ) ) ( not ( = ?auto_21008 ?auto_21020 ) ) ( not ( = ?auto_21008 ?auto_21018 ) ) ( not ( = ?auto_21008 ?auto_21029 ) ) ( not ( = ?auto_21008 ?auto_21028 ) ) ( not ( = ?auto_21008 ?auto_21024 ) ) ( not ( = ?auto_21014 ?auto_21032 ) ) ( not ( = ?auto_21014 ?auto_21022 ) ) ( not ( = ?auto_21014 ?auto_21041 ) ) ( not ( = ?auto_21014 ?auto_21031 ) ) ( not ( = ?auto_21014 ?auto_21021 ) ) ( not ( = ?auto_21014 ?auto_21020 ) ) ( not ( = ?auto_21014 ?auto_21018 ) ) ( not ( = ?auto_21014 ?auto_21029 ) ) ( not ( = ?auto_21014 ?auto_21028 ) ) ( not ( = ?auto_21014 ?auto_21024 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20997 ?auto_20998 ?auto_20999 ?auto_21000 ?auto_21001 ?auto_21002 ?auto_21003 ?auto_21004 ?auto_21005 ?auto_21006 ?auto_21007 )
      ( MAKE-1CRATE ?auto_21007 ?auto_21008 )
      ( MAKE-11CRATE-VERIFY ?auto_20997 ?auto_20998 ?auto_20999 ?auto_21000 ?auto_21001 ?auto_21002 ?auto_21003 ?auto_21004 ?auto_21005 ?auto_21006 ?auto_21007 ?auto_21008 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_21066 - SURFACE
      ?auto_21067 - SURFACE
      ?auto_21068 - SURFACE
      ?auto_21069 - SURFACE
      ?auto_21070 - SURFACE
      ?auto_21071 - SURFACE
      ?auto_21072 - SURFACE
      ?auto_21073 - SURFACE
      ?auto_21074 - SURFACE
      ?auto_21075 - SURFACE
      ?auto_21076 - SURFACE
      ?auto_21077 - SURFACE
      ?auto_21078 - SURFACE
    )
    :vars
    (
      ?auto_21082 - HOIST
      ?auto_21080 - PLACE
      ?auto_21079 - PLACE
      ?auto_21083 - HOIST
      ?auto_21084 - SURFACE
      ?auto_21111 - PLACE
      ?auto_21088 - HOIST
      ?auto_21105 - SURFACE
      ?auto_21098 - PLACE
      ?auto_21099 - HOIST
      ?auto_21103 - SURFACE
      ?auto_21085 - PLACE
      ?auto_21109 - HOIST
      ?auto_21096 - SURFACE
      ?auto_21086 - PLACE
      ?auto_21097 - HOIST
      ?auto_21095 - SURFACE
      ?auto_21091 - PLACE
      ?auto_21112 - HOIST
      ?auto_21102 - SURFACE
      ?auto_21100 - PLACE
      ?auto_21106 - HOIST
      ?auto_21104 - SURFACE
      ?auto_21108 - PLACE
      ?auto_21107 - HOIST
      ?auto_21101 - SURFACE
      ?auto_21093 - SURFACE
      ?auto_21090 - SURFACE
      ?auto_21092 - PLACE
      ?auto_21094 - HOIST
      ?auto_21089 - SURFACE
      ?auto_21087 - PLACE
      ?auto_21110 - HOIST
      ?auto_21113 - SURFACE
      ?auto_21081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21082 ?auto_21080 ) ( IS-CRATE ?auto_21078 ) ( not ( = ?auto_21079 ?auto_21080 ) ) ( HOIST-AT ?auto_21083 ?auto_21079 ) ( SURFACE-AT ?auto_21078 ?auto_21079 ) ( ON ?auto_21078 ?auto_21084 ) ( CLEAR ?auto_21078 ) ( not ( = ?auto_21077 ?auto_21078 ) ) ( not ( = ?auto_21077 ?auto_21084 ) ) ( not ( = ?auto_21078 ?auto_21084 ) ) ( not ( = ?auto_21082 ?auto_21083 ) ) ( IS-CRATE ?auto_21077 ) ( not ( = ?auto_21111 ?auto_21080 ) ) ( HOIST-AT ?auto_21088 ?auto_21111 ) ( SURFACE-AT ?auto_21077 ?auto_21111 ) ( ON ?auto_21077 ?auto_21105 ) ( CLEAR ?auto_21077 ) ( not ( = ?auto_21076 ?auto_21077 ) ) ( not ( = ?auto_21076 ?auto_21105 ) ) ( not ( = ?auto_21077 ?auto_21105 ) ) ( not ( = ?auto_21082 ?auto_21088 ) ) ( IS-CRATE ?auto_21076 ) ( not ( = ?auto_21098 ?auto_21080 ) ) ( HOIST-AT ?auto_21099 ?auto_21098 ) ( AVAILABLE ?auto_21099 ) ( SURFACE-AT ?auto_21076 ?auto_21098 ) ( ON ?auto_21076 ?auto_21103 ) ( CLEAR ?auto_21076 ) ( not ( = ?auto_21075 ?auto_21076 ) ) ( not ( = ?auto_21075 ?auto_21103 ) ) ( not ( = ?auto_21076 ?auto_21103 ) ) ( not ( = ?auto_21082 ?auto_21099 ) ) ( IS-CRATE ?auto_21075 ) ( not ( = ?auto_21085 ?auto_21080 ) ) ( HOIST-AT ?auto_21109 ?auto_21085 ) ( AVAILABLE ?auto_21109 ) ( SURFACE-AT ?auto_21075 ?auto_21085 ) ( ON ?auto_21075 ?auto_21096 ) ( CLEAR ?auto_21075 ) ( not ( = ?auto_21074 ?auto_21075 ) ) ( not ( = ?auto_21074 ?auto_21096 ) ) ( not ( = ?auto_21075 ?auto_21096 ) ) ( not ( = ?auto_21082 ?auto_21109 ) ) ( IS-CRATE ?auto_21074 ) ( not ( = ?auto_21086 ?auto_21080 ) ) ( HOIST-AT ?auto_21097 ?auto_21086 ) ( AVAILABLE ?auto_21097 ) ( SURFACE-AT ?auto_21074 ?auto_21086 ) ( ON ?auto_21074 ?auto_21095 ) ( CLEAR ?auto_21074 ) ( not ( = ?auto_21073 ?auto_21074 ) ) ( not ( = ?auto_21073 ?auto_21095 ) ) ( not ( = ?auto_21074 ?auto_21095 ) ) ( not ( = ?auto_21082 ?auto_21097 ) ) ( IS-CRATE ?auto_21073 ) ( not ( = ?auto_21091 ?auto_21080 ) ) ( HOIST-AT ?auto_21112 ?auto_21091 ) ( AVAILABLE ?auto_21112 ) ( SURFACE-AT ?auto_21073 ?auto_21091 ) ( ON ?auto_21073 ?auto_21102 ) ( CLEAR ?auto_21073 ) ( not ( = ?auto_21072 ?auto_21073 ) ) ( not ( = ?auto_21072 ?auto_21102 ) ) ( not ( = ?auto_21073 ?auto_21102 ) ) ( not ( = ?auto_21082 ?auto_21112 ) ) ( IS-CRATE ?auto_21072 ) ( not ( = ?auto_21100 ?auto_21080 ) ) ( HOIST-AT ?auto_21106 ?auto_21100 ) ( AVAILABLE ?auto_21106 ) ( SURFACE-AT ?auto_21072 ?auto_21100 ) ( ON ?auto_21072 ?auto_21104 ) ( CLEAR ?auto_21072 ) ( not ( = ?auto_21071 ?auto_21072 ) ) ( not ( = ?auto_21071 ?auto_21104 ) ) ( not ( = ?auto_21072 ?auto_21104 ) ) ( not ( = ?auto_21082 ?auto_21106 ) ) ( IS-CRATE ?auto_21071 ) ( not ( = ?auto_21108 ?auto_21080 ) ) ( HOIST-AT ?auto_21107 ?auto_21108 ) ( AVAILABLE ?auto_21107 ) ( SURFACE-AT ?auto_21071 ?auto_21108 ) ( ON ?auto_21071 ?auto_21101 ) ( CLEAR ?auto_21071 ) ( not ( = ?auto_21070 ?auto_21071 ) ) ( not ( = ?auto_21070 ?auto_21101 ) ) ( not ( = ?auto_21071 ?auto_21101 ) ) ( not ( = ?auto_21082 ?auto_21107 ) ) ( IS-CRATE ?auto_21070 ) ( AVAILABLE ?auto_21083 ) ( SURFACE-AT ?auto_21070 ?auto_21079 ) ( ON ?auto_21070 ?auto_21093 ) ( CLEAR ?auto_21070 ) ( not ( = ?auto_21069 ?auto_21070 ) ) ( not ( = ?auto_21069 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21093 ) ) ( IS-CRATE ?auto_21069 ) ( AVAILABLE ?auto_21088 ) ( SURFACE-AT ?auto_21069 ?auto_21111 ) ( ON ?auto_21069 ?auto_21090 ) ( CLEAR ?auto_21069 ) ( not ( = ?auto_21068 ?auto_21069 ) ) ( not ( = ?auto_21068 ?auto_21090 ) ) ( not ( = ?auto_21069 ?auto_21090 ) ) ( IS-CRATE ?auto_21068 ) ( not ( = ?auto_21092 ?auto_21080 ) ) ( HOIST-AT ?auto_21094 ?auto_21092 ) ( AVAILABLE ?auto_21094 ) ( SURFACE-AT ?auto_21068 ?auto_21092 ) ( ON ?auto_21068 ?auto_21089 ) ( CLEAR ?auto_21068 ) ( not ( = ?auto_21067 ?auto_21068 ) ) ( not ( = ?auto_21067 ?auto_21089 ) ) ( not ( = ?auto_21068 ?auto_21089 ) ) ( not ( = ?auto_21082 ?auto_21094 ) ) ( SURFACE-AT ?auto_21066 ?auto_21080 ) ( CLEAR ?auto_21066 ) ( IS-CRATE ?auto_21067 ) ( AVAILABLE ?auto_21082 ) ( not ( = ?auto_21087 ?auto_21080 ) ) ( HOIST-AT ?auto_21110 ?auto_21087 ) ( AVAILABLE ?auto_21110 ) ( SURFACE-AT ?auto_21067 ?auto_21087 ) ( ON ?auto_21067 ?auto_21113 ) ( CLEAR ?auto_21067 ) ( TRUCK-AT ?auto_21081 ?auto_21080 ) ( not ( = ?auto_21066 ?auto_21067 ) ) ( not ( = ?auto_21066 ?auto_21113 ) ) ( not ( = ?auto_21067 ?auto_21113 ) ) ( not ( = ?auto_21082 ?auto_21110 ) ) ( not ( = ?auto_21066 ?auto_21068 ) ) ( not ( = ?auto_21066 ?auto_21089 ) ) ( not ( = ?auto_21068 ?auto_21113 ) ) ( not ( = ?auto_21092 ?auto_21087 ) ) ( not ( = ?auto_21094 ?auto_21110 ) ) ( not ( = ?auto_21089 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21069 ) ) ( not ( = ?auto_21066 ?auto_21090 ) ) ( not ( = ?auto_21067 ?auto_21069 ) ) ( not ( = ?auto_21067 ?auto_21090 ) ) ( not ( = ?auto_21069 ?auto_21089 ) ) ( not ( = ?auto_21069 ?auto_21113 ) ) ( not ( = ?auto_21111 ?auto_21092 ) ) ( not ( = ?auto_21111 ?auto_21087 ) ) ( not ( = ?auto_21088 ?auto_21094 ) ) ( not ( = ?auto_21088 ?auto_21110 ) ) ( not ( = ?auto_21090 ?auto_21089 ) ) ( not ( = ?auto_21090 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21070 ) ) ( not ( = ?auto_21066 ?auto_21093 ) ) ( not ( = ?auto_21067 ?auto_21070 ) ) ( not ( = ?auto_21067 ?auto_21093 ) ) ( not ( = ?auto_21068 ?auto_21070 ) ) ( not ( = ?auto_21068 ?auto_21093 ) ) ( not ( = ?auto_21070 ?auto_21090 ) ) ( not ( = ?auto_21070 ?auto_21089 ) ) ( not ( = ?auto_21070 ?auto_21113 ) ) ( not ( = ?auto_21079 ?auto_21111 ) ) ( not ( = ?auto_21079 ?auto_21092 ) ) ( not ( = ?auto_21079 ?auto_21087 ) ) ( not ( = ?auto_21083 ?auto_21088 ) ) ( not ( = ?auto_21083 ?auto_21094 ) ) ( not ( = ?auto_21083 ?auto_21110 ) ) ( not ( = ?auto_21093 ?auto_21090 ) ) ( not ( = ?auto_21093 ?auto_21089 ) ) ( not ( = ?auto_21093 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21071 ) ) ( not ( = ?auto_21066 ?auto_21101 ) ) ( not ( = ?auto_21067 ?auto_21071 ) ) ( not ( = ?auto_21067 ?auto_21101 ) ) ( not ( = ?auto_21068 ?auto_21071 ) ) ( not ( = ?auto_21068 ?auto_21101 ) ) ( not ( = ?auto_21069 ?auto_21071 ) ) ( not ( = ?auto_21069 ?auto_21101 ) ) ( not ( = ?auto_21071 ?auto_21093 ) ) ( not ( = ?auto_21071 ?auto_21090 ) ) ( not ( = ?auto_21071 ?auto_21089 ) ) ( not ( = ?auto_21071 ?auto_21113 ) ) ( not ( = ?auto_21108 ?auto_21079 ) ) ( not ( = ?auto_21108 ?auto_21111 ) ) ( not ( = ?auto_21108 ?auto_21092 ) ) ( not ( = ?auto_21108 ?auto_21087 ) ) ( not ( = ?auto_21107 ?auto_21083 ) ) ( not ( = ?auto_21107 ?auto_21088 ) ) ( not ( = ?auto_21107 ?auto_21094 ) ) ( not ( = ?auto_21107 ?auto_21110 ) ) ( not ( = ?auto_21101 ?auto_21093 ) ) ( not ( = ?auto_21101 ?auto_21090 ) ) ( not ( = ?auto_21101 ?auto_21089 ) ) ( not ( = ?auto_21101 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21072 ) ) ( not ( = ?auto_21066 ?auto_21104 ) ) ( not ( = ?auto_21067 ?auto_21072 ) ) ( not ( = ?auto_21067 ?auto_21104 ) ) ( not ( = ?auto_21068 ?auto_21072 ) ) ( not ( = ?auto_21068 ?auto_21104 ) ) ( not ( = ?auto_21069 ?auto_21072 ) ) ( not ( = ?auto_21069 ?auto_21104 ) ) ( not ( = ?auto_21070 ?auto_21072 ) ) ( not ( = ?auto_21070 ?auto_21104 ) ) ( not ( = ?auto_21072 ?auto_21101 ) ) ( not ( = ?auto_21072 ?auto_21093 ) ) ( not ( = ?auto_21072 ?auto_21090 ) ) ( not ( = ?auto_21072 ?auto_21089 ) ) ( not ( = ?auto_21072 ?auto_21113 ) ) ( not ( = ?auto_21100 ?auto_21108 ) ) ( not ( = ?auto_21100 ?auto_21079 ) ) ( not ( = ?auto_21100 ?auto_21111 ) ) ( not ( = ?auto_21100 ?auto_21092 ) ) ( not ( = ?auto_21100 ?auto_21087 ) ) ( not ( = ?auto_21106 ?auto_21107 ) ) ( not ( = ?auto_21106 ?auto_21083 ) ) ( not ( = ?auto_21106 ?auto_21088 ) ) ( not ( = ?auto_21106 ?auto_21094 ) ) ( not ( = ?auto_21106 ?auto_21110 ) ) ( not ( = ?auto_21104 ?auto_21101 ) ) ( not ( = ?auto_21104 ?auto_21093 ) ) ( not ( = ?auto_21104 ?auto_21090 ) ) ( not ( = ?auto_21104 ?auto_21089 ) ) ( not ( = ?auto_21104 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21073 ) ) ( not ( = ?auto_21066 ?auto_21102 ) ) ( not ( = ?auto_21067 ?auto_21073 ) ) ( not ( = ?auto_21067 ?auto_21102 ) ) ( not ( = ?auto_21068 ?auto_21073 ) ) ( not ( = ?auto_21068 ?auto_21102 ) ) ( not ( = ?auto_21069 ?auto_21073 ) ) ( not ( = ?auto_21069 ?auto_21102 ) ) ( not ( = ?auto_21070 ?auto_21073 ) ) ( not ( = ?auto_21070 ?auto_21102 ) ) ( not ( = ?auto_21071 ?auto_21073 ) ) ( not ( = ?auto_21071 ?auto_21102 ) ) ( not ( = ?auto_21073 ?auto_21104 ) ) ( not ( = ?auto_21073 ?auto_21101 ) ) ( not ( = ?auto_21073 ?auto_21093 ) ) ( not ( = ?auto_21073 ?auto_21090 ) ) ( not ( = ?auto_21073 ?auto_21089 ) ) ( not ( = ?auto_21073 ?auto_21113 ) ) ( not ( = ?auto_21091 ?auto_21100 ) ) ( not ( = ?auto_21091 ?auto_21108 ) ) ( not ( = ?auto_21091 ?auto_21079 ) ) ( not ( = ?auto_21091 ?auto_21111 ) ) ( not ( = ?auto_21091 ?auto_21092 ) ) ( not ( = ?auto_21091 ?auto_21087 ) ) ( not ( = ?auto_21112 ?auto_21106 ) ) ( not ( = ?auto_21112 ?auto_21107 ) ) ( not ( = ?auto_21112 ?auto_21083 ) ) ( not ( = ?auto_21112 ?auto_21088 ) ) ( not ( = ?auto_21112 ?auto_21094 ) ) ( not ( = ?auto_21112 ?auto_21110 ) ) ( not ( = ?auto_21102 ?auto_21104 ) ) ( not ( = ?auto_21102 ?auto_21101 ) ) ( not ( = ?auto_21102 ?auto_21093 ) ) ( not ( = ?auto_21102 ?auto_21090 ) ) ( not ( = ?auto_21102 ?auto_21089 ) ) ( not ( = ?auto_21102 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21074 ) ) ( not ( = ?auto_21066 ?auto_21095 ) ) ( not ( = ?auto_21067 ?auto_21074 ) ) ( not ( = ?auto_21067 ?auto_21095 ) ) ( not ( = ?auto_21068 ?auto_21074 ) ) ( not ( = ?auto_21068 ?auto_21095 ) ) ( not ( = ?auto_21069 ?auto_21074 ) ) ( not ( = ?auto_21069 ?auto_21095 ) ) ( not ( = ?auto_21070 ?auto_21074 ) ) ( not ( = ?auto_21070 ?auto_21095 ) ) ( not ( = ?auto_21071 ?auto_21074 ) ) ( not ( = ?auto_21071 ?auto_21095 ) ) ( not ( = ?auto_21072 ?auto_21074 ) ) ( not ( = ?auto_21072 ?auto_21095 ) ) ( not ( = ?auto_21074 ?auto_21102 ) ) ( not ( = ?auto_21074 ?auto_21104 ) ) ( not ( = ?auto_21074 ?auto_21101 ) ) ( not ( = ?auto_21074 ?auto_21093 ) ) ( not ( = ?auto_21074 ?auto_21090 ) ) ( not ( = ?auto_21074 ?auto_21089 ) ) ( not ( = ?auto_21074 ?auto_21113 ) ) ( not ( = ?auto_21086 ?auto_21091 ) ) ( not ( = ?auto_21086 ?auto_21100 ) ) ( not ( = ?auto_21086 ?auto_21108 ) ) ( not ( = ?auto_21086 ?auto_21079 ) ) ( not ( = ?auto_21086 ?auto_21111 ) ) ( not ( = ?auto_21086 ?auto_21092 ) ) ( not ( = ?auto_21086 ?auto_21087 ) ) ( not ( = ?auto_21097 ?auto_21112 ) ) ( not ( = ?auto_21097 ?auto_21106 ) ) ( not ( = ?auto_21097 ?auto_21107 ) ) ( not ( = ?auto_21097 ?auto_21083 ) ) ( not ( = ?auto_21097 ?auto_21088 ) ) ( not ( = ?auto_21097 ?auto_21094 ) ) ( not ( = ?auto_21097 ?auto_21110 ) ) ( not ( = ?auto_21095 ?auto_21102 ) ) ( not ( = ?auto_21095 ?auto_21104 ) ) ( not ( = ?auto_21095 ?auto_21101 ) ) ( not ( = ?auto_21095 ?auto_21093 ) ) ( not ( = ?auto_21095 ?auto_21090 ) ) ( not ( = ?auto_21095 ?auto_21089 ) ) ( not ( = ?auto_21095 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21075 ) ) ( not ( = ?auto_21066 ?auto_21096 ) ) ( not ( = ?auto_21067 ?auto_21075 ) ) ( not ( = ?auto_21067 ?auto_21096 ) ) ( not ( = ?auto_21068 ?auto_21075 ) ) ( not ( = ?auto_21068 ?auto_21096 ) ) ( not ( = ?auto_21069 ?auto_21075 ) ) ( not ( = ?auto_21069 ?auto_21096 ) ) ( not ( = ?auto_21070 ?auto_21075 ) ) ( not ( = ?auto_21070 ?auto_21096 ) ) ( not ( = ?auto_21071 ?auto_21075 ) ) ( not ( = ?auto_21071 ?auto_21096 ) ) ( not ( = ?auto_21072 ?auto_21075 ) ) ( not ( = ?auto_21072 ?auto_21096 ) ) ( not ( = ?auto_21073 ?auto_21075 ) ) ( not ( = ?auto_21073 ?auto_21096 ) ) ( not ( = ?auto_21075 ?auto_21095 ) ) ( not ( = ?auto_21075 ?auto_21102 ) ) ( not ( = ?auto_21075 ?auto_21104 ) ) ( not ( = ?auto_21075 ?auto_21101 ) ) ( not ( = ?auto_21075 ?auto_21093 ) ) ( not ( = ?auto_21075 ?auto_21090 ) ) ( not ( = ?auto_21075 ?auto_21089 ) ) ( not ( = ?auto_21075 ?auto_21113 ) ) ( not ( = ?auto_21085 ?auto_21086 ) ) ( not ( = ?auto_21085 ?auto_21091 ) ) ( not ( = ?auto_21085 ?auto_21100 ) ) ( not ( = ?auto_21085 ?auto_21108 ) ) ( not ( = ?auto_21085 ?auto_21079 ) ) ( not ( = ?auto_21085 ?auto_21111 ) ) ( not ( = ?auto_21085 ?auto_21092 ) ) ( not ( = ?auto_21085 ?auto_21087 ) ) ( not ( = ?auto_21109 ?auto_21097 ) ) ( not ( = ?auto_21109 ?auto_21112 ) ) ( not ( = ?auto_21109 ?auto_21106 ) ) ( not ( = ?auto_21109 ?auto_21107 ) ) ( not ( = ?auto_21109 ?auto_21083 ) ) ( not ( = ?auto_21109 ?auto_21088 ) ) ( not ( = ?auto_21109 ?auto_21094 ) ) ( not ( = ?auto_21109 ?auto_21110 ) ) ( not ( = ?auto_21096 ?auto_21095 ) ) ( not ( = ?auto_21096 ?auto_21102 ) ) ( not ( = ?auto_21096 ?auto_21104 ) ) ( not ( = ?auto_21096 ?auto_21101 ) ) ( not ( = ?auto_21096 ?auto_21093 ) ) ( not ( = ?auto_21096 ?auto_21090 ) ) ( not ( = ?auto_21096 ?auto_21089 ) ) ( not ( = ?auto_21096 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21076 ) ) ( not ( = ?auto_21066 ?auto_21103 ) ) ( not ( = ?auto_21067 ?auto_21076 ) ) ( not ( = ?auto_21067 ?auto_21103 ) ) ( not ( = ?auto_21068 ?auto_21076 ) ) ( not ( = ?auto_21068 ?auto_21103 ) ) ( not ( = ?auto_21069 ?auto_21076 ) ) ( not ( = ?auto_21069 ?auto_21103 ) ) ( not ( = ?auto_21070 ?auto_21076 ) ) ( not ( = ?auto_21070 ?auto_21103 ) ) ( not ( = ?auto_21071 ?auto_21076 ) ) ( not ( = ?auto_21071 ?auto_21103 ) ) ( not ( = ?auto_21072 ?auto_21076 ) ) ( not ( = ?auto_21072 ?auto_21103 ) ) ( not ( = ?auto_21073 ?auto_21076 ) ) ( not ( = ?auto_21073 ?auto_21103 ) ) ( not ( = ?auto_21074 ?auto_21076 ) ) ( not ( = ?auto_21074 ?auto_21103 ) ) ( not ( = ?auto_21076 ?auto_21096 ) ) ( not ( = ?auto_21076 ?auto_21095 ) ) ( not ( = ?auto_21076 ?auto_21102 ) ) ( not ( = ?auto_21076 ?auto_21104 ) ) ( not ( = ?auto_21076 ?auto_21101 ) ) ( not ( = ?auto_21076 ?auto_21093 ) ) ( not ( = ?auto_21076 ?auto_21090 ) ) ( not ( = ?auto_21076 ?auto_21089 ) ) ( not ( = ?auto_21076 ?auto_21113 ) ) ( not ( = ?auto_21098 ?auto_21085 ) ) ( not ( = ?auto_21098 ?auto_21086 ) ) ( not ( = ?auto_21098 ?auto_21091 ) ) ( not ( = ?auto_21098 ?auto_21100 ) ) ( not ( = ?auto_21098 ?auto_21108 ) ) ( not ( = ?auto_21098 ?auto_21079 ) ) ( not ( = ?auto_21098 ?auto_21111 ) ) ( not ( = ?auto_21098 ?auto_21092 ) ) ( not ( = ?auto_21098 ?auto_21087 ) ) ( not ( = ?auto_21099 ?auto_21109 ) ) ( not ( = ?auto_21099 ?auto_21097 ) ) ( not ( = ?auto_21099 ?auto_21112 ) ) ( not ( = ?auto_21099 ?auto_21106 ) ) ( not ( = ?auto_21099 ?auto_21107 ) ) ( not ( = ?auto_21099 ?auto_21083 ) ) ( not ( = ?auto_21099 ?auto_21088 ) ) ( not ( = ?auto_21099 ?auto_21094 ) ) ( not ( = ?auto_21099 ?auto_21110 ) ) ( not ( = ?auto_21103 ?auto_21096 ) ) ( not ( = ?auto_21103 ?auto_21095 ) ) ( not ( = ?auto_21103 ?auto_21102 ) ) ( not ( = ?auto_21103 ?auto_21104 ) ) ( not ( = ?auto_21103 ?auto_21101 ) ) ( not ( = ?auto_21103 ?auto_21093 ) ) ( not ( = ?auto_21103 ?auto_21090 ) ) ( not ( = ?auto_21103 ?auto_21089 ) ) ( not ( = ?auto_21103 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21077 ) ) ( not ( = ?auto_21066 ?auto_21105 ) ) ( not ( = ?auto_21067 ?auto_21077 ) ) ( not ( = ?auto_21067 ?auto_21105 ) ) ( not ( = ?auto_21068 ?auto_21077 ) ) ( not ( = ?auto_21068 ?auto_21105 ) ) ( not ( = ?auto_21069 ?auto_21077 ) ) ( not ( = ?auto_21069 ?auto_21105 ) ) ( not ( = ?auto_21070 ?auto_21077 ) ) ( not ( = ?auto_21070 ?auto_21105 ) ) ( not ( = ?auto_21071 ?auto_21077 ) ) ( not ( = ?auto_21071 ?auto_21105 ) ) ( not ( = ?auto_21072 ?auto_21077 ) ) ( not ( = ?auto_21072 ?auto_21105 ) ) ( not ( = ?auto_21073 ?auto_21077 ) ) ( not ( = ?auto_21073 ?auto_21105 ) ) ( not ( = ?auto_21074 ?auto_21077 ) ) ( not ( = ?auto_21074 ?auto_21105 ) ) ( not ( = ?auto_21075 ?auto_21077 ) ) ( not ( = ?auto_21075 ?auto_21105 ) ) ( not ( = ?auto_21077 ?auto_21103 ) ) ( not ( = ?auto_21077 ?auto_21096 ) ) ( not ( = ?auto_21077 ?auto_21095 ) ) ( not ( = ?auto_21077 ?auto_21102 ) ) ( not ( = ?auto_21077 ?auto_21104 ) ) ( not ( = ?auto_21077 ?auto_21101 ) ) ( not ( = ?auto_21077 ?auto_21093 ) ) ( not ( = ?auto_21077 ?auto_21090 ) ) ( not ( = ?auto_21077 ?auto_21089 ) ) ( not ( = ?auto_21077 ?auto_21113 ) ) ( not ( = ?auto_21105 ?auto_21103 ) ) ( not ( = ?auto_21105 ?auto_21096 ) ) ( not ( = ?auto_21105 ?auto_21095 ) ) ( not ( = ?auto_21105 ?auto_21102 ) ) ( not ( = ?auto_21105 ?auto_21104 ) ) ( not ( = ?auto_21105 ?auto_21101 ) ) ( not ( = ?auto_21105 ?auto_21093 ) ) ( not ( = ?auto_21105 ?auto_21090 ) ) ( not ( = ?auto_21105 ?auto_21089 ) ) ( not ( = ?auto_21105 ?auto_21113 ) ) ( not ( = ?auto_21066 ?auto_21078 ) ) ( not ( = ?auto_21066 ?auto_21084 ) ) ( not ( = ?auto_21067 ?auto_21078 ) ) ( not ( = ?auto_21067 ?auto_21084 ) ) ( not ( = ?auto_21068 ?auto_21078 ) ) ( not ( = ?auto_21068 ?auto_21084 ) ) ( not ( = ?auto_21069 ?auto_21078 ) ) ( not ( = ?auto_21069 ?auto_21084 ) ) ( not ( = ?auto_21070 ?auto_21078 ) ) ( not ( = ?auto_21070 ?auto_21084 ) ) ( not ( = ?auto_21071 ?auto_21078 ) ) ( not ( = ?auto_21071 ?auto_21084 ) ) ( not ( = ?auto_21072 ?auto_21078 ) ) ( not ( = ?auto_21072 ?auto_21084 ) ) ( not ( = ?auto_21073 ?auto_21078 ) ) ( not ( = ?auto_21073 ?auto_21084 ) ) ( not ( = ?auto_21074 ?auto_21078 ) ) ( not ( = ?auto_21074 ?auto_21084 ) ) ( not ( = ?auto_21075 ?auto_21078 ) ) ( not ( = ?auto_21075 ?auto_21084 ) ) ( not ( = ?auto_21076 ?auto_21078 ) ) ( not ( = ?auto_21076 ?auto_21084 ) ) ( not ( = ?auto_21078 ?auto_21105 ) ) ( not ( = ?auto_21078 ?auto_21103 ) ) ( not ( = ?auto_21078 ?auto_21096 ) ) ( not ( = ?auto_21078 ?auto_21095 ) ) ( not ( = ?auto_21078 ?auto_21102 ) ) ( not ( = ?auto_21078 ?auto_21104 ) ) ( not ( = ?auto_21078 ?auto_21101 ) ) ( not ( = ?auto_21078 ?auto_21093 ) ) ( not ( = ?auto_21078 ?auto_21090 ) ) ( not ( = ?auto_21078 ?auto_21089 ) ) ( not ( = ?auto_21078 ?auto_21113 ) ) ( not ( = ?auto_21084 ?auto_21105 ) ) ( not ( = ?auto_21084 ?auto_21103 ) ) ( not ( = ?auto_21084 ?auto_21096 ) ) ( not ( = ?auto_21084 ?auto_21095 ) ) ( not ( = ?auto_21084 ?auto_21102 ) ) ( not ( = ?auto_21084 ?auto_21104 ) ) ( not ( = ?auto_21084 ?auto_21101 ) ) ( not ( = ?auto_21084 ?auto_21093 ) ) ( not ( = ?auto_21084 ?auto_21090 ) ) ( not ( = ?auto_21084 ?auto_21089 ) ) ( not ( = ?auto_21084 ?auto_21113 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21066 ?auto_21067 ?auto_21068 ?auto_21069 ?auto_21070 ?auto_21071 ?auto_21072 ?auto_21073 ?auto_21074 ?auto_21075 ?auto_21076 ?auto_21077 )
      ( MAKE-1CRATE ?auto_21077 ?auto_21078 )
      ( MAKE-12CRATE-VERIFY ?auto_21066 ?auto_21067 ?auto_21068 ?auto_21069 ?auto_21070 ?auto_21071 ?auto_21072 ?auto_21073 ?auto_21074 ?auto_21075 ?auto_21076 ?auto_21077 ?auto_21078 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_21138 - SURFACE
      ?auto_21139 - SURFACE
      ?auto_21140 - SURFACE
      ?auto_21141 - SURFACE
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
    )
    :vars
    (
      ?auto_21153 - HOIST
      ?auto_21157 - PLACE
      ?auto_21155 - PLACE
      ?auto_21156 - HOIST
      ?auto_21152 - SURFACE
      ?auto_21171 - PLACE
      ?auto_21181 - HOIST
      ?auto_21184 - SURFACE
      ?auto_21180 - PLACE
      ?auto_21182 - HOIST
      ?auto_21167 - SURFACE
      ?auto_21173 - PLACE
      ?auto_21178 - HOIST
      ?auto_21188 - SURFACE
      ?auto_21170 - PLACE
      ?auto_21187 - HOIST
      ?auto_21166 - SURFACE
      ?auto_21169 - PLACE
      ?auto_21174 - HOIST
      ?auto_21183 - SURFACE
      ?auto_21159 - PLACE
      ?auto_21158 - HOIST
      ?auto_21185 - SURFACE
      ?auto_21168 - PLACE
      ?auto_21163 - HOIST
      ?auto_21179 - SURFACE
      ?auto_21189 - PLACE
      ?auto_21186 - HOIST
      ?auto_21164 - SURFACE
      ?auto_21176 - SURFACE
      ?auto_21161 - SURFACE
      ?auto_21177 - PLACE
      ?auto_21162 - HOIST
      ?auto_21165 - SURFACE
      ?auto_21160 - PLACE
      ?auto_21172 - HOIST
      ?auto_21175 - SURFACE
      ?auto_21154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21153 ?auto_21157 ) ( IS-CRATE ?auto_21151 ) ( not ( = ?auto_21155 ?auto_21157 ) ) ( HOIST-AT ?auto_21156 ?auto_21155 ) ( AVAILABLE ?auto_21156 ) ( SURFACE-AT ?auto_21151 ?auto_21155 ) ( ON ?auto_21151 ?auto_21152 ) ( CLEAR ?auto_21151 ) ( not ( = ?auto_21150 ?auto_21151 ) ) ( not ( = ?auto_21150 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21152 ) ) ( not ( = ?auto_21153 ?auto_21156 ) ) ( IS-CRATE ?auto_21150 ) ( not ( = ?auto_21171 ?auto_21157 ) ) ( HOIST-AT ?auto_21181 ?auto_21171 ) ( SURFACE-AT ?auto_21150 ?auto_21171 ) ( ON ?auto_21150 ?auto_21184 ) ( CLEAR ?auto_21150 ) ( not ( = ?auto_21149 ?auto_21150 ) ) ( not ( = ?auto_21149 ?auto_21184 ) ) ( not ( = ?auto_21150 ?auto_21184 ) ) ( not ( = ?auto_21153 ?auto_21181 ) ) ( IS-CRATE ?auto_21149 ) ( not ( = ?auto_21180 ?auto_21157 ) ) ( HOIST-AT ?auto_21182 ?auto_21180 ) ( SURFACE-AT ?auto_21149 ?auto_21180 ) ( ON ?auto_21149 ?auto_21167 ) ( CLEAR ?auto_21149 ) ( not ( = ?auto_21148 ?auto_21149 ) ) ( not ( = ?auto_21148 ?auto_21167 ) ) ( not ( = ?auto_21149 ?auto_21167 ) ) ( not ( = ?auto_21153 ?auto_21182 ) ) ( IS-CRATE ?auto_21148 ) ( not ( = ?auto_21173 ?auto_21157 ) ) ( HOIST-AT ?auto_21178 ?auto_21173 ) ( AVAILABLE ?auto_21178 ) ( SURFACE-AT ?auto_21148 ?auto_21173 ) ( ON ?auto_21148 ?auto_21188 ) ( CLEAR ?auto_21148 ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21188 ) ) ( not ( = ?auto_21148 ?auto_21188 ) ) ( not ( = ?auto_21153 ?auto_21178 ) ) ( IS-CRATE ?auto_21147 ) ( not ( = ?auto_21170 ?auto_21157 ) ) ( HOIST-AT ?auto_21187 ?auto_21170 ) ( AVAILABLE ?auto_21187 ) ( SURFACE-AT ?auto_21147 ?auto_21170 ) ( ON ?auto_21147 ?auto_21166 ) ( CLEAR ?auto_21147 ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21146 ?auto_21166 ) ) ( not ( = ?auto_21147 ?auto_21166 ) ) ( not ( = ?auto_21153 ?auto_21187 ) ) ( IS-CRATE ?auto_21146 ) ( not ( = ?auto_21169 ?auto_21157 ) ) ( HOIST-AT ?auto_21174 ?auto_21169 ) ( AVAILABLE ?auto_21174 ) ( SURFACE-AT ?auto_21146 ?auto_21169 ) ( ON ?auto_21146 ?auto_21183 ) ( CLEAR ?auto_21146 ) ( not ( = ?auto_21145 ?auto_21146 ) ) ( not ( = ?auto_21145 ?auto_21183 ) ) ( not ( = ?auto_21146 ?auto_21183 ) ) ( not ( = ?auto_21153 ?auto_21174 ) ) ( IS-CRATE ?auto_21145 ) ( not ( = ?auto_21159 ?auto_21157 ) ) ( HOIST-AT ?auto_21158 ?auto_21159 ) ( AVAILABLE ?auto_21158 ) ( SURFACE-AT ?auto_21145 ?auto_21159 ) ( ON ?auto_21145 ?auto_21185 ) ( CLEAR ?auto_21145 ) ( not ( = ?auto_21144 ?auto_21145 ) ) ( not ( = ?auto_21144 ?auto_21185 ) ) ( not ( = ?auto_21145 ?auto_21185 ) ) ( not ( = ?auto_21153 ?auto_21158 ) ) ( IS-CRATE ?auto_21144 ) ( not ( = ?auto_21168 ?auto_21157 ) ) ( HOIST-AT ?auto_21163 ?auto_21168 ) ( AVAILABLE ?auto_21163 ) ( SURFACE-AT ?auto_21144 ?auto_21168 ) ( ON ?auto_21144 ?auto_21179 ) ( CLEAR ?auto_21144 ) ( not ( = ?auto_21143 ?auto_21144 ) ) ( not ( = ?auto_21143 ?auto_21179 ) ) ( not ( = ?auto_21144 ?auto_21179 ) ) ( not ( = ?auto_21153 ?auto_21163 ) ) ( IS-CRATE ?auto_21143 ) ( not ( = ?auto_21189 ?auto_21157 ) ) ( HOIST-AT ?auto_21186 ?auto_21189 ) ( AVAILABLE ?auto_21186 ) ( SURFACE-AT ?auto_21143 ?auto_21189 ) ( ON ?auto_21143 ?auto_21164 ) ( CLEAR ?auto_21143 ) ( not ( = ?auto_21142 ?auto_21143 ) ) ( not ( = ?auto_21142 ?auto_21164 ) ) ( not ( = ?auto_21143 ?auto_21164 ) ) ( not ( = ?auto_21153 ?auto_21186 ) ) ( IS-CRATE ?auto_21142 ) ( AVAILABLE ?auto_21181 ) ( SURFACE-AT ?auto_21142 ?auto_21171 ) ( ON ?auto_21142 ?auto_21176 ) ( CLEAR ?auto_21142 ) ( not ( = ?auto_21141 ?auto_21142 ) ) ( not ( = ?auto_21141 ?auto_21176 ) ) ( not ( = ?auto_21142 ?auto_21176 ) ) ( IS-CRATE ?auto_21141 ) ( AVAILABLE ?auto_21182 ) ( SURFACE-AT ?auto_21141 ?auto_21180 ) ( ON ?auto_21141 ?auto_21161 ) ( CLEAR ?auto_21141 ) ( not ( = ?auto_21140 ?auto_21141 ) ) ( not ( = ?auto_21140 ?auto_21161 ) ) ( not ( = ?auto_21141 ?auto_21161 ) ) ( IS-CRATE ?auto_21140 ) ( not ( = ?auto_21177 ?auto_21157 ) ) ( HOIST-AT ?auto_21162 ?auto_21177 ) ( AVAILABLE ?auto_21162 ) ( SURFACE-AT ?auto_21140 ?auto_21177 ) ( ON ?auto_21140 ?auto_21165 ) ( CLEAR ?auto_21140 ) ( not ( = ?auto_21139 ?auto_21140 ) ) ( not ( = ?auto_21139 ?auto_21165 ) ) ( not ( = ?auto_21140 ?auto_21165 ) ) ( not ( = ?auto_21153 ?auto_21162 ) ) ( SURFACE-AT ?auto_21138 ?auto_21157 ) ( CLEAR ?auto_21138 ) ( IS-CRATE ?auto_21139 ) ( AVAILABLE ?auto_21153 ) ( not ( = ?auto_21160 ?auto_21157 ) ) ( HOIST-AT ?auto_21172 ?auto_21160 ) ( AVAILABLE ?auto_21172 ) ( SURFACE-AT ?auto_21139 ?auto_21160 ) ( ON ?auto_21139 ?auto_21175 ) ( CLEAR ?auto_21139 ) ( TRUCK-AT ?auto_21154 ?auto_21157 ) ( not ( = ?auto_21138 ?auto_21139 ) ) ( not ( = ?auto_21138 ?auto_21175 ) ) ( not ( = ?auto_21139 ?auto_21175 ) ) ( not ( = ?auto_21153 ?auto_21172 ) ) ( not ( = ?auto_21138 ?auto_21140 ) ) ( not ( = ?auto_21138 ?auto_21165 ) ) ( not ( = ?auto_21140 ?auto_21175 ) ) ( not ( = ?auto_21177 ?auto_21160 ) ) ( not ( = ?auto_21162 ?auto_21172 ) ) ( not ( = ?auto_21165 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21141 ) ) ( not ( = ?auto_21138 ?auto_21161 ) ) ( not ( = ?auto_21139 ?auto_21141 ) ) ( not ( = ?auto_21139 ?auto_21161 ) ) ( not ( = ?auto_21141 ?auto_21165 ) ) ( not ( = ?auto_21141 ?auto_21175 ) ) ( not ( = ?auto_21180 ?auto_21177 ) ) ( not ( = ?auto_21180 ?auto_21160 ) ) ( not ( = ?auto_21182 ?auto_21162 ) ) ( not ( = ?auto_21182 ?auto_21172 ) ) ( not ( = ?auto_21161 ?auto_21165 ) ) ( not ( = ?auto_21161 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21142 ) ) ( not ( = ?auto_21138 ?auto_21176 ) ) ( not ( = ?auto_21139 ?auto_21142 ) ) ( not ( = ?auto_21139 ?auto_21176 ) ) ( not ( = ?auto_21140 ?auto_21142 ) ) ( not ( = ?auto_21140 ?auto_21176 ) ) ( not ( = ?auto_21142 ?auto_21161 ) ) ( not ( = ?auto_21142 ?auto_21165 ) ) ( not ( = ?auto_21142 ?auto_21175 ) ) ( not ( = ?auto_21171 ?auto_21180 ) ) ( not ( = ?auto_21171 ?auto_21177 ) ) ( not ( = ?auto_21171 ?auto_21160 ) ) ( not ( = ?auto_21181 ?auto_21182 ) ) ( not ( = ?auto_21181 ?auto_21162 ) ) ( not ( = ?auto_21181 ?auto_21172 ) ) ( not ( = ?auto_21176 ?auto_21161 ) ) ( not ( = ?auto_21176 ?auto_21165 ) ) ( not ( = ?auto_21176 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21143 ) ) ( not ( = ?auto_21138 ?auto_21164 ) ) ( not ( = ?auto_21139 ?auto_21143 ) ) ( not ( = ?auto_21139 ?auto_21164 ) ) ( not ( = ?auto_21140 ?auto_21143 ) ) ( not ( = ?auto_21140 ?auto_21164 ) ) ( not ( = ?auto_21141 ?auto_21143 ) ) ( not ( = ?auto_21141 ?auto_21164 ) ) ( not ( = ?auto_21143 ?auto_21176 ) ) ( not ( = ?auto_21143 ?auto_21161 ) ) ( not ( = ?auto_21143 ?auto_21165 ) ) ( not ( = ?auto_21143 ?auto_21175 ) ) ( not ( = ?auto_21189 ?auto_21171 ) ) ( not ( = ?auto_21189 ?auto_21180 ) ) ( not ( = ?auto_21189 ?auto_21177 ) ) ( not ( = ?auto_21189 ?auto_21160 ) ) ( not ( = ?auto_21186 ?auto_21181 ) ) ( not ( = ?auto_21186 ?auto_21182 ) ) ( not ( = ?auto_21186 ?auto_21162 ) ) ( not ( = ?auto_21186 ?auto_21172 ) ) ( not ( = ?auto_21164 ?auto_21176 ) ) ( not ( = ?auto_21164 ?auto_21161 ) ) ( not ( = ?auto_21164 ?auto_21165 ) ) ( not ( = ?auto_21164 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21144 ) ) ( not ( = ?auto_21138 ?auto_21179 ) ) ( not ( = ?auto_21139 ?auto_21144 ) ) ( not ( = ?auto_21139 ?auto_21179 ) ) ( not ( = ?auto_21140 ?auto_21144 ) ) ( not ( = ?auto_21140 ?auto_21179 ) ) ( not ( = ?auto_21141 ?auto_21144 ) ) ( not ( = ?auto_21141 ?auto_21179 ) ) ( not ( = ?auto_21142 ?auto_21144 ) ) ( not ( = ?auto_21142 ?auto_21179 ) ) ( not ( = ?auto_21144 ?auto_21164 ) ) ( not ( = ?auto_21144 ?auto_21176 ) ) ( not ( = ?auto_21144 ?auto_21161 ) ) ( not ( = ?auto_21144 ?auto_21165 ) ) ( not ( = ?auto_21144 ?auto_21175 ) ) ( not ( = ?auto_21168 ?auto_21189 ) ) ( not ( = ?auto_21168 ?auto_21171 ) ) ( not ( = ?auto_21168 ?auto_21180 ) ) ( not ( = ?auto_21168 ?auto_21177 ) ) ( not ( = ?auto_21168 ?auto_21160 ) ) ( not ( = ?auto_21163 ?auto_21186 ) ) ( not ( = ?auto_21163 ?auto_21181 ) ) ( not ( = ?auto_21163 ?auto_21182 ) ) ( not ( = ?auto_21163 ?auto_21162 ) ) ( not ( = ?auto_21163 ?auto_21172 ) ) ( not ( = ?auto_21179 ?auto_21164 ) ) ( not ( = ?auto_21179 ?auto_21176 ) ) ( not ( = ?auto_21179 ?auto_21161 ) ) ( not ( = ?auto_21179 ?auto_21165 ) ) ( not ( = ?auto_21179 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21145 ) ) ( not ( = ?auto_21138 ?auto_21185 ) ) ( not ( = ?auto_21139 ?auto_21145 ) ) ( not ( = ?auto_21139 ?auto_21185 ) ) ( not ( = ?auto_21140 ?auto_21145 ) ) ( not ( = ?auto_21140 ?auto_21185 ) ) ( not ( = ?auto_21141 ?auto_21145 ) ) ( not ( = ?auto_21141 ?auto_21185 ) ) ( not ( = ?auto_21142 ?auto_21145 ) ) ( not ( = ?auto_21142 ?auto_21185 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21185 ) ) ( not ( = ?auto_21145 ?auto_21179 ) ) ( not ( = ?auto_21145 ?auto_21164 ) ) ( not ( = ?auto_21145 ?auto_21176 ) ) ( not ( = ?auto_21145 ?auto_21161 ) ) ( not ( = ?auto_21145 ?auto_21165 ) ) ( not ( = ?auto_21145 ?auto_21175 ) ) ( not ( = ?auto_21159 ?auto_21168 ) ) ( not ( = ?auto_21159 ?auto_21189 ) ) ( not ( = ?auto_21159 ?auto_21171 ) ) ( not ( = ?auto_21159 ?auto_21180 ) ) ( not ( = ?auto_21159 ?auto_21177 ) ) ( not ( = ?auto_21159 ?auto_21160 ) ) ( not ( = ?auto_21158 ?auto_21163 ) ) ( not ( = ?auto_21158 ?auto_21186 ) ) ( not ( = ?auto_21158 ?auto_21181 ) ) ( not ( = ?auto_21158 ?auto_21182 ) ) ( not ( = ?auto_21158 ?auto_21162 ) ) ( not ( = ?auto_21158 ?auto_21172 ) ) ( not ( = ?auto_21185 ?auto_21179 ) ) ( not ( = ?auto_21185 ?auto_21164 ) ) ( not ( = ?auto_21185 ?auto_21176 ) ) ( not ( = ?auto_21185 ?auto_21161 ) ) ( not ( = ?auto_21185 ?auto_21165 ) ) ( not ( = ?auto_21185 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21146 ) ) ( not ( = ?auto_21138 ?auto_21183 ) ) ( not ( = ?auto_21139 ?auto_21146 ) ) ( not ( = ?auto_21139 ?auto_21183 ) ) ( not ( = ?auto_21140 ?auto_21146 ) ) ( not ( = ?auto_21140 ?auto_21183 ) ) ( not ( = ?auto_21141 ?auto_21146 ) ) ( not ( = ?auto_21141 ?auto_21183 ) ) ( not ( = ?auto_21142 ?auto_21146 ) ) ( not ( = ?auto_21142 ?auto_21183 ) ) ( not ( = ?auto_21143 ?auto_21146 ) ) ( not ( = ?auto_21143 ?auto_21183 ) ) ( not ( = ?auto_21144 ?auto_21146 ) ) ( not ( = ?auto_21144 ?auto_21183 ) ) ( not ( = ?auto_21146 ?auto_21185 ) ) ( not ( = ?auto_21146 ?auto_21179 ) ) ( not ( = ?auto_21146 ?auto_21164 ) ) ( not ( = ?auto_21146 ?auto_21176 ) ) ( not ( = ?auto_21146 ?auto_21161 ) ) ( not ( = ?auto_21146 ?auto_21165 ) ) ( not ( = ?auto_21146 ?auto_21175 ) ) ( not ( = ?auto_21169 ?auto_21159 ) ) ( not ( = ?auto_21169 ?auto_21168 ) ) ( not ( = ?auto_21169 ?auto_21189 ) ) ( not ( = ?auto_21169 ?auto_21171 ) ) ( not ( = ?auto_21169 ?auto_21180 ) ) ( not ( = ?auto_21169 ?auto_21177 ) ) ( not ( = ?auto_21169 ?auto_21160 ) ) ( not ( = ?auto_21174 ?auto_21158 ) ) ( not ( = ?auto_21174 ?auto_21163 ) ) ( not ( = ?auto_21174 ?auto_21186 ) ) ( not ( = ?auto_21174 ?auto_21181 ) ) ( not ( = ?auto_21174 ?auto_21182 ) ) ( not ( = ?auto_21174 ?auto_21162 ) ) ( not ( = ?auto_21174 ?auto_21172 ) ) ( not ( = ?auto_21183 ?auto_21185 ) ) ( not ( = ?auto_21183 ?auto_21179 ) ) ( not ( = ?auto_21183 ?auto_21164 ) ) ( not ( = ?auto_21183 ?auto_21176 ) ) ( not ( = ?auto_21183 ?auto_21161 ) ) ( not ( = ?auto_21183 ?auto_21165 ) ) ( not ( = ?auto_21183 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21147 ) ) ( not ( = ?auto_21138 ?auto_21166 ) ) ( not ( = ?auto_21139 ?auto_21147 ) ) ( not ( = ?auto_21139 ?auto_21166 ) ) ( not ( = ?auto_21140 ?auto_21147 ) ) ( not ( = ?auto_21140 ?auto_21166 ) ) ( not ( = ?auto_21141 ?auto_21147 ) ) ( not ( = ?auto_21141 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21147 ) ) ( not ( = ?auto_21142 ?auto_21166 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( not ( = ?auto_21143 ?auto_21166 ) ) ( not ( = ?auto_21144 ?auto_21147 ) ) ( not ( = ?auto_21144 ?auto_21166 ) ) ( not ( = ?auto_21145 ?auto_21147 ) ) ( not ( = ?auto_21145 ?auto_21166 ) ) ( not ( = ?auto_21147 ?auto_21183 ) ) ( not ( = ?auto_21147 ?auto_21185 ) ) ( not ( = ?auto_21147 ?auto_21179 ) ) ( not ( = ?auto_21147 ?auto_21164 ) ) ( not ( = ?auto_21147 ?auto_21176 ) ) ( not ( = ?auto_21147 ?auto_21161 ) ) ( not ( = ?auto_21147 ?auto_21165 ) ) ( not ( = ?auto_21147 ?auto_21175 ) ) ( not ( = ?auto_21170 ?auto_21169 ) ) ( not ( = ?auto_21170 ?auto_21159 ) ) ( not ( = ?auto_21170 ?auto_21168 ) ) ( not ( = ?auto_21170 ?auto_21189 ) ) ( not ( = ?auto_21170 ?auto_21171 ) ) ( not ( = ?auto_21170 ?auto_21180 ) ) ( not ( = ?auto_21170 ?auto_21177 ) ) ( not ( = ?auto_21170 ?auto_21160 ) ) ( not ( = ?auto_21187 ?auto_21174 ) ) ( not ( = ?auto_21187 ?auto_21158 ) ) ( not ( = ?auto_21187 ?auto_21163 ) ) ( not ( = ?auto_21187 ?auto_21186 ) ) ( not ( = ?auto_21187 ?auto_21181 ) ) ( not ( = ?auto_21187 ?auto_21182 ) ) ( not ( = ?auto_21187 ?auto_21162 ) ) ( not ( = ?auto_21187 ?auto_21172 ) ) ( not ( = ?auto_21166 ?auto_21183 ) ) ( not ( = ?auto_21166 ?auto_21185 ) ) ( not ( = ?auto_21166 ?auto_21179 ) ) ( not ( = ?auto_21166 ?auto_21164 ) ) ( not ( = ?auto_21166 ?auto_21176 ) ) ( not ( = ?auto_21166 ?auto_21161 ) ) ( not ( = ?auto_21166 ?auto_21165 ) ) ( not ( = ?auto_21166 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21148 ) ) ( not ( = ?auto_21138 ?auto_21188 ) ) ( not ( = ?auto_21139 ?auto_21148 ) ) ( not ( = ?auto_21139 ?auto_21188 ) ) ( not ( = ?auto_21140 ?auto_21148 ) ) ( not ( = ?auto_21140 ?auto_21188 ) ) ( not ( = ?auto_21141 ?auto_21148 ) ) ( not ( = ?auto_21141 ?auto_21188 ) ) ( not ( = ?auto_21142 ?auto_21148 ) ) ( not ( = ?auto_21142 ?auto_21188 ) ) ( not ( = ?auto_21143 ?auto_21148 ) ) ( not ( = ?auto_21143 ?auto_21188 ) ) ( not ( = ?auto_21144 ?auto_21148 ) ) ( not ( = ?auto_21144 ?auto_21188 ) ) ( not ( = ?auto_21145 ?auto_21148 ) ) ( not ( = ?auto_21145 ?auto_21188 ) ) ( not ( = ?auto_21146 ?auto_21148 ) ) ( not ( = ?auto_21146 ?auto_21188 ) ) ( not ( = ?auto_21148 ?auto_21166 ) ) ( not ( = ?auto_21148 ?auto_21183 ) ) ( not ( = ?auto_21148 ?auto_21185 ) ) ( not ( = ?auto_21148 ?auto_21179 ) ) ( not ( = ?auto_21148 ?auto_21164 ) ) ( not ( = ?auto_21148 ?auto_21176 ) ) ( not ( = ?auto_21148 ?auto_21161 ) ) ( not ( = ?auto_21148 ?auto_21165 ) ) ( not ( = ?auto_21148 ?auto_21175 ) ) ( not ( = ?auto_21173 ?auto_21170 ) ) ( not ( = ?auto_21173 ?auto_21169 ) ) ( not ( = ?auto_21173 ?auto_21159 ) ) ( not ( = ?auto_21173 ?auto_21168 ) ) ( not ( = ?auto_21173 ?auto_21189 ) ) ( not ( = ?auto_21173 ?auto_21171 ) ) ( not ( = ?auto_21173 ?auto_21180 ) ) ( not ( = ?auto_21173 ?auto_21177 ) ) ( not ( = ?auto_21173 ?auto_21160 ) ) ( not ( = ?auto_21178 ?auto_21187 ) ) ( not ( = ?auto_21178 ?auto_21174 ) ) ( not ( = ?auto_21178 ?auto_21158 ) ) ( not ( = ?auto_21178 ?auto_21163 ) ) ( not ( = ?auto_21178 ?auto_21186 ) ) ( not ( = ?auto_21178 ?auto_21181 ) ) ( not ( = ?auto_21178 ?auto_21182 ) ) ( not ( = ?auto_21178 ?auto_21162 ) ) ( not ( = ?auto_21178 ?auto_21172 ) ) ( not ( = ?auto_21188 ?auto_21166 ) ) ( not ( = ?auto_21188 ?auto_21183 ) ) ( not ( = ?auto_21188 ?auto_21185 ) ) ( not ( = ?auto_21188 ?auto_21179 ) ) ( not ( = ?auto_21188 ?auto_21164 ) ) ( not ( = ?auto_21188 ?auto_21176 ) ) ( not ( = ?auto_21188 ?auto_21161 ) ) ( not ( = ?auto_21188 ?auto_21165 ) ) ( not ( = ?auto_21188 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21149 ) ) ( not ( = ?auto_21138 ?auto_21167 ) ) ( not ( = ?auto_21139 ?auto_21149 ) ) ( not ( = ?auto_21139 ?auto_21167 ) ) ( not ( = ?auto_21140 ?auto_21149 ) ) ( not ( = ?auto_21140 ?auto_21167 ) ) ( not ( = ?auto_21141 ?auto_21149 ) ) ( not ( = ?auto_21141 ?auto_21167 ) ) ( not ( = ?auto_21142 ?auto_21149 ) ) ( not ( = ?auto_21142 ?auto_21167 ) ) ( not ( = ?auto_21143 ?auto_21149 ) ) ( not ( = ?auto_21143 ?auto_21167 ) ) ( not ( = ?auto_21144 ?auto_21149 ) ) ( not ( = ?auto_21144 ?auto_21167 ) ) ( not ( = ?auto_21145 ?auto_21149 ) ) ( not ( = ?auto_21145 ?auto_21167 ) ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( not ( = ?auto_21146 ?auto_21167 ) ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21167 ) ) ( not ( = ?auto_21149 ?auto_21188 ) ) ( not ( = ?auto_21149 ?auto_21166 ) ) ( not ( = ?auto_21149 ?auto_21183 ) ) ( not ( = ?auto_21149 ?auto_21185 ) ) ( not ( = ?auto_21149 ?auto_21179 ) ) ( not ( = ?auto_21149 ?auto_21164 ) ) ( not ( = ?auto_21149 ?auto_21176 ) ) ( not ( = ?auto_21149 ?auto_21161 ) ) ( not ( = ?auto_21149 ?auto_21165 ) ) ( not ( = ?auto_21149 ?auto_21175 ) ) ( not ( = ?auto_21167 ?auto_21188 ) ) ( not ( = ?auto_21167 ?auto_21166 ) ) ( not ( = ?auto_21167 ?auto_21183 ) ) ( not ( = ?auto_21167 ?auto_21185 ) ) ( not ( = ?auto_21167 ?auto_21179 ) ) ( not ( = ?auto_21167 ?auto_21164 ) ) ( not ( = ?auto_21167 ?auto_21176 ) ) ( not ( = ?auto_21167 ?auto_21161 ) ) ( not ( = ?auto_21167 ?auto_21165 ) ) ( not ( = ?auto_21167 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21150 ) ) ( not ( = ?auto_21138 ?auto_21184 ) ) ( not ( = ?auto_21139 ?auto_21150 ) ) ( not ( = ?auto_21139 ?auto_21184 ) ) ( not ( = ?auto_21140 ?auto_21150 ) ) ( not ( = ?auto_21140 ?auto_21184 ) ) ( not ( = ?auto_21141 ?auto_21150 ) ) ( not ( = ?auto_21141 ?auto_21184 ) ) ( not ( = ?auto_21142 ?auto_21150 ) ) ( not ( = ?auto_21142 ?auto_21184 ) ) ( not ( = ?auto_21143 ?auto_21150 ) ) ( not ( = ?auto_21143 ?auto_21184 ) ) ( not ( = ?auto_21144 ?auto_21150 ) ) ( not ( = ?auto_21144 ?auto_21184 ) ) ( not ( = ?auto_21145 ?auto_21150 ) ) ( not ( = ?auto_21145 ?auto_21184 ) ) ( not ( = ?auto_21146 ?auto_21150 ) ) ( not ( = ?auto_21146 ?auto_21184 ) ) ( not ( = ?auto_21147 ?auto_21150 ) ) ( not ( = ?auto_21147 ?auto_21184 ) ) ( not ( = ?auto_21148 ?auto_21150 ) ) ( not ( = ?auto_21148 ?auto_21184 ) ) ( not ( = ?auto_21150 ?auto_21167 ) ) ( not ( = ?auto_21150 ?auto_21188 ) ) ( not ( = ?auto_21150 ?auto_21166 ) ) ( not ( = ?auto_21150 ?auto_21183 ) ) ( not ( = ?auto_21150 ?auto_21185 ) ) ( not ( = ?auto_21150 ?auto_21179 ) ) ( not ( = ?auto_21150 ?auto_21164 ) ) ( not ( = ?auto_21150 ?auto_21176 ) ) ( not ( = ?auto_21150 ?auto_21161 ) ) ( not ( = ?auto_21150 ?auto_21165 ) ) ( not ( = ?auto_21150 ?auto_21175 ) ) ( not ( = ?auto_21184 ?auto_21167 ) ) ( not ( = ?auto_21184 ?auto_21188 ) ) ( not ( = ?auto_21184 ?auto_21166 ) ) ( not ( = ?auto_21184 ?auto_21183 ) ) ( not ( = ?auto_21184 ?auto_21185 ) ) ( not ( = ?auto_21184 ?auto_21179 ) ) ( not ( = ?auto_21184 ?auto_21164 ) ) ( not ( = ?auto_21184 ?auto_21176 ) ) ( not ( = ?auto_21184 ?auto_21161 ) ) ( not ( = ?auto_21184 ?auto_21165 ) ) ( not ( = ?auto_21184 ?auto_21175 ) ) ( not ( = ?auto_21138 ?auto_21151 ) ) ( not ( = ?auto_21138 ?auto_21152 ) ) ( not ( = ?auto_21139 ?auto_21151 ) ) ( not ( = ?auto_21139 ?auto_21152 ) ) ( not ( = ?auto_21140 ?auto_21151 ) ) ( not ( = ?auto_21140 ?auto_21152 ) ) ( not ( = ?auto_21141 ?auto_21151 ) ) ( not ( = ?auto_21141 ?auto_21152 ) ) ( not ( = ?auto_21142 ?auto_21151 ) ) ( not ( = ?auto_21142 ?auto_21152 ) ) ( not ( = ?auto_21143 ?auto_21151 ) ) ( not ( = ?auto_21143 ?auto_21152 ) ) ( not ( = ?auto_21144 ?auto_21151 ) ) ( not ( = ?auto_21144 ?auto_21152 ) ) ( not ( = ?auto_21145 ?auto_21151 ) ) ( not ( = ?auto_21145 ?auto_21152 ) ) ( not ( = ?auto_21146 ?auto_21151 ) ) ( not ( = ?auto_21146 ?auto_21152 ) ) ( not ( = ?auto_21147 ?auto_21151 ) ) ( not ( = ?auto_21147 ?auto_21152 ) ) ( not ( = ?auto_21148 ?auto_21151 ) ) ( not ( = ?auto_21148 ?auto_21152 ) ) ( not ( = ?auto_21149 ?auto_21151 ) ) ( not ( = ?auto_21149 ?auto_21152 ) ) ( not ( = ?auto_21151 ?auto_21184 ) ) ( not ( = ?auto_21151 ?auto_21167 ) ) ( not ( = ?auto_21151 ?auto_21188 ) ) ( not ( = ?auto_21151 ?auto_21166 ) ) ( not ( = ?auto_21151 ?auto_21183 ) ) ( not ( = ?auto_21151 ?auto_21185 ) ) ( not ( = ?auto_21151 ?auto_21179 ) ) ( not ( = ?auto_21151 ?auto_21164 ) ) ( not ( = ?auto_21151 ?auto_21176 ) ) ( not ( = ?auto_21151 ?auto_21161 ) ) ( not ( = ?auto_21151 ?auto_21165 ) ) ( not ( = ?auto_21151 ?auto_21175 ) ) ( not ( = ?auto_21155 ?auto_21171 ) ) ( not ( = ?auto_21155 ?auto_21180 ) ) ( not ( = ?auto_21155 ?auto_21173 ) ) ( not ( = ?auto_21155 ?auto_21170 ) ) ( not ( = ?auto_21155 ?auto_21169 ) ) ( not ( = ?auto_21155 ?auto_21159 ) ) ( not ( = ?auto_21155 ?auto_21168 ) ) ( not ( = ?auto_21155 ?auto_21189 ) ) ( not ( = ?auto_21155 ?auto_21177 ) ) ( not ( = ?auto_21155 ?auto_21160 ) ) ( not ( = ?auto_21156 ?auto_21181 ) ) ( not ( = ?auto_21156 ?auto_21182 ) ) ( not ( = ?auto_21156 ?auto_21178 ) ) ( not ( = ?auto_21156 ?auto_21187 ) ) ( not ( = ?auto_21156 ?auto_21174 ) ) ( not ( = ?auto_21156 ?auto_21158 ) ) ( not ( = ?auto_21156 ?auto_21163 ) ) ( not ( = ?auto_21156 ?auto_21186 ) ) ( not ( = ?auto_21156 ?auto_21162 ) ) ( not ( = ?auto_21156 ?auto_21172 ) ) ( not ( = ?auto_21152 ?auto_21184 ) ) ( not ( = ?auto_21152 ?auto_21167 ) ) ( not ( = ?auto_21152 ?auto_21188 ) ) ( not ( = ?auto_21152 ?auto_21166 ) ) ( not ( = ?auto_21152 ?auto_21183 ) ) ( not ( = ?auto_21152 ?auto_21185 ) ) ( not ( = ?auto_21152 ?auto_21179 ) ) ( not ( = ?auto_21152 ?auto_21164 ) ) ( not ( = ?auto_21152 ?auto_21176 ) ) ( not ( = ?auto_21152 ?auto_21161 ) ) ( not ( = ?auto_21152 ?auto_21165 ) ) ( not ( = ?auto_21152 ?auto_21175 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21138 ?auto_21139 ?auto_21140 ?auto_21141 ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21149 ?auto_21150 )
      ( MAKE-1CRATE ?auto_21150 ?auto_21151 )
      ( MAKE-13CRATE-VERIFY ?auto_21138 ?auto_21139 ?auto_21140 ?auto_21141 ?auto_21142 ?auto_21143 ?auto_21144 ?auto_21145 ?auto_21146 ?auto_21147 ?auto_21148 ?auto_21149 ?auto_21150 ?auto_21151 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_21215 - SURFACE
      ?auto_21216 - SURFACE
      ?auto_21217 - SURFACE
      ?auto_21218 - SURFACE
      ?auto_21219 - SURFACE
      ?auto_21220 - SURFACE
      ?auto_21221 - SURFACE
      ?auto_21222 - SURFACE
      ?auto_21223 - SURFACE
      ?auto_21224 - SURFACE
      ?auto_21225 - SURFACE
      ?auto_21226 - SURFACE
      ?auto_21227 - SURFACE
      ?auto_21228 - SURFACE
      ?auto_21229 - SURFACE
    )
    :vars
    (
      ?auto_21235 - HOIST
      ?auto_21231 - PLACE
      ?auto_21234 - PLACE
      ?auto_21232 - HOIST
      ?auto_21230 - SURFACE
      ?auto_21242 - PLACE
      ?auto_21259 - HOIST
      ?auto_21261 - SURFACE
      ?auto_21263 - PLACE
      ?auto_21255 - HOIST
      ?auto_21247 - SURFACE
      ?auto_21258 - PLACE
      ?auto_21237 - HOIST
      ?auto_21254 - SURFACE
      ?auto_21240 - PLACE
      ?auto_21238 - HOIST
      ?auto_21246 - SURFACE
      ?auto_21241 - PLACE
      ?auto_21267 - HOIST
      ?auto_21264 - SURFACE
      ?auto_21245 - SURFACE
      ?auto_21252 - PLACE
      ?auto_21260 - HOIST
      ?auto_21243 - SURFACE
      ?auto_21262 - PLACE
      ?auto_21249 - HOIST
      ?auto_21239 - SURFACE
      ?auto_21253 - PLACE
      ?auto_21248 - HOIST
      ?auto_21257 - SURFACE
      ?auto_21244 - SURFACE
      ?auto_21250 - SURFACE
      ?auto_21266 - PLACE
      ?auto_21251 - HOIST
      ?auto_21236 - SURFACE
      ?auto_21265 - PLACE
      ?auto_21268 - HOIST
      ?auto_21256 - SURFACE
      ?auto_21233 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21235 ?auto_21231 ) ( IS-CRATE ?auto_21229 ) ( not ( = ?auto_21234 ?auto_21231 ) ) ( HOIST-AT ?auto_21232 ?auto_21234 ) ( SURFACE-AT ?auto_21229 ?auto_21234 ) ( ON ?auto_21229 ?auto_21230 ) ( CLEAR ?auto_21229 ) ( not ( = ?auto_21228 ?auto_21229 ) ) ( not ( = ?auto_21228 ?auto_21230 ) ) ( not ( = ?auto_21229 ?auto_21230 ) ) ( not ( = ?auto_21235 ?auto_21232 ) ) ( IS-CRATE ?auto_21228 ) ( not ( = ?auto_21242 ?auto_21231 ) ) ( HOIST-AT ?auto_21259 ?auto_21242 ) ( AVAILABLE ?auto_21259 ) ( SURFACE-AT ?auto_21228 ?auto_21242 ) ( ON ?auto_21228 ?auto_21261 ) ( CLEAR ?auto_21228 ) ( not ( = ?auto_21227 ?auto_21228 ) ) ( not ( = ?auto_21227 ?auto_21261 ) ) ( not ( = ?auto_21228 ?auto_21261 ) ) ( not ( = ?auto_21235 ?auto_21259 ) ) ( IS-CRATE ?auto_21227 ) ( not ( = ?auto_21263 ?auto_21231 ) ) ( HOIST-AT ?auto_21255 ?auto_21263 ) ( SURFACE-AT ?auto_21227 ?auto_21263 ) ( ON ?auto_21227 ?auto_21247 ) ( CLEAR ?auto_21227 ) ( not ( = ?auto_21226 ?auto_21227 ) ) ( not ( = ?auto_21226 ?auto_21247 ) ) ( not ( = ?auto_21227 ?auto_21247 ) ) ( not ( = ?auto_21235 ?auto_21255 ) ) ( IS-CRATE ?auto_21226 ) ( not ( = ?auto_21258 ?auto_21231 ) ) ( HOIST-AT ?auto_21237 ?auto_21258 ) ( SURFACE-AT ?auto_21226 ?auto_21258 ) ( ON ?auto_21226 ?auto_21254 ) ( CLEAR ?auto_21226 ) ( not ( = ?auto_21225 ?auto_21226 ) ) ( not ( = ?auto_21225 ?auto_21254 ) ) ( not ( = ?auto_21226 ?auto_21254 ) ) ( not ( = ?auto_21235 ?auto_21237 ) ) ( IS-CRATE ?auto_21225 ) ( not ( = ?auto_21240 ?auto_21231 ) ) ( HOIST-AT ?auto_21238 ?auto_21240 ) ( AVAILABLE ?auto_21238 ) ( SURFACE-AT ?auto_21225 ?auto_21240 ) ( ON ?auto_21225 ?auto_21246 ) ( CLEAR ?auto_21225 ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( not ( = ?auto_21224 ?auto_21246 ) ) ( not ( = ?auto_21225 ?auto_21246 ) ) ( not ( = ?auto_21235 ?auto_21238 ) ) ( IS-CRATE ?auto_21224 ) ( not ( = ?auto_21241 ?auto_21231 ) ) ( HOIST-AT ?auto_21267 ?auto_21241 ) ( AVAILABLE ?auto_21267 ) ( SURFACE-AT ?auto_21224 ?auto_21241 ) ( ON ?auto_21224 ?auto_21264 ) ( CLEAR ?auto_21224 ) ( not ( = ?auto_21223 ?auto_21224 ) ) ( not ( = ?auto_21223 ?auto_21264 ) ) ( not ( = ?auto_21224 ?auto_21264 ) ) ( not ( = ?auto_21235 ?auto_21267 ) ) ( IS-CRATE ?auto_21223 ) ( AVAILABLE ?auto_21232 ) ( SURFACE-AT ?auto_21223 ?auto_21234 ) ( ON ?auto_21223 ?auto_21245 ) ( CLEAR ?auto_21223 ) ( not ( = ?auto_21222 ?auto_21223 ) ) ( not ( = ?auto_21222 ?auto_21245 ) ) ( not ( = ?auto_21223 ?auto_21245 ) ) ( IS-CRATE ?auto_21222 ) ( not ( = ?auto_21252 ?auto_21231 ) ) ( HOIST-AT ?auto_21260 ?auto_21252 ) ( AVAILABLE ?auto_21260 ) ( SURFACE-AT ?auto_21222 ?auto_21252 ) ( ON ?auto_21222 ?auto_21243 ) ( CLEAR ?auto_21222 ) ( not ( = ?auto_21221 ?auto_21222 ) ) ( not ( = ?auto_21221 ?auto_21243 ) ) ( not ( = ?auto_21222 ?auto_21243 ) ) ( not ( = ?auto_21235 ?auto_21260 ) ) ( IS-CRATE ?auto_21221 ) ( not ( = ?auto_21262 ?auto_21231 ) ) ( HOIST-AT ?auto_21249 ?auto_21262 ) ( AVAILABLE ?auto_21249 ) ( SURFACE-AT ?auto_21221 ?auto_21262 ) ( ON ?auto_21221 ?auto_21239 ) ( CLEAR ?auto_21221 ) ( not ( = ?auto_21220 ?auto_21221 ) ) ( not ( = ?auto_21220 ?auto_21239 ) ) ( not ( = ?auto_21221 ?auto_21239 ) ) ( not ( = ?auto_21235 ?auto_21249 ) ) ( IS-CRATE ?auto_21220 ) ( not ( = ?auto_21253 ?auto_21231 ) ) ( HOIST-AT ?auto_21248 ?auto_21253 ) ( AVAILABLE ?auto_21248 ) ( SURFACE-AT ?auto_21220 ?auto_21253 ) ( ON ?auto_21220 ?auto_21257 ) ( CLEAR ?auto_21220 ) ( not ( = ?auto_21219 ?auto_21220 ) ) ( not ( = ?auto_21219 ?auto_21257 ) ) ( not ( = ?auto_21220 ?auto_21257 ) ) ( not ( = ?auto_21235 ?auto_21248 ) ) ( IS-CRATE ?auto_21219 ) ( AVAILABLE ?auto_21255 ) ( SURFACE-AT ?auto_21219 ?auto_21263 ) ( ON ?auto_21219 ?auto_21244 ) ( CLEAR ?auto_21219 ) ( not ( = ?auto_21218 ?auto_21219 ) ) ( not ( = ?auto_21218 ?auto_21244 ) ) ( not ( = ?auto_21219 ?auto_21244 ) ) ( IS-CRATE ?auto_21218 ) ( AVAILABLE ?auto_21237 ) ( SURFACE-AT ?auto_21218 ?auto_21258 ) ( ON ?auto_21218 ?auto_21250 ) ( CLEAR ?auto_21218 ) ( not ( = ?auto_21217 ?auto_21218 ) ) ( not ( = ?auto_21217 ?auto_21250 ) ) ( not ( = ?auto_21218 ?auto_21250 ) ) ( IS-CRATE ?auto_21217 ) ( not ( = ?auto_21266 ?auto_21231 ) ) ( HOIST-AT ?auto_21251 ?auto_21266 ) ( AVAILABLE ?auto_21251 ) ( SURFACE-AT ?auto_21217 ?auto_21266 ) ( ON ?auto_21217 ?auto_21236 ) ( CLEAR ?auto_21217 ) ( not ( = ?auto_21216 ?auto_21217 ) ) ( not ( = ?auto_21216 ?auto_21236 ) ) ( not ( = ?auto_21217 ?auto_21236 ) ) ( not ( = ?auto_21235 ?auto_21251 ) ) ( SURFACE-AT ?auto_21215 ?auto_21231 ) ( CLEAR ?auto_21215 ) ( IS-CRATE ?auto_21216 ) ( AVAILABLE ?auto_21235 ) ( not ( = ?auto_21265 ?auto_21231 ) ) ( HOIST-AT ?auto_21268 ?auto_21265 ) ( AVAILABLE ?auto_21268 ) ( SURFACE-AT ?auto_21216 ?auto_21265 ) ( ON ?auto_21216 ?auto_21256 ) ( CLEAR ?auto_21216 ) ( TRUCK-AT ?auto_21233 ?auto_21231 ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21256 ) ) ( not ( = ?auto_21216 ?auto_21256 ) ) ( not ( = ?auto_21235 ?auto_21268 ) ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( not ( = ?auto_21215 ?auto_21236 ) ) ( not ( = ?auto_21217 ?auto_21256 ) ) ( not ( = ?auto_21266 ?auto_21265 ) ) ( not ( = ?auto_21251 ?auto_21268 ) ) ( not ( = ?auto_21236 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21250 ) ) ( not ( = ?auto_21216 ?auto_21218 ) ) ( not ( = ?auto_21216 ?auto_21250 ) ) ( not ( = ?auto_21218 ?auto_21236 ) ) ( not ( = ?auto_21218 ?auto_21256 ) ) ( not ( = ?auto_21258 ?auto_21266 ) ) ( not ( = ?auto_21258 ?auto_21265 ) ) ( not ( = ?auto_21237 ?auto_21251 ) ) ( not ( = ?auto_21237 ?auto_21268 ) ) ( not ( = ?auto_21250 ?auto_21236 ) ) ( not ( = ?auto_21250 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21219 ) ) ( not ( = ?auto_21215 ?auto_21244 ) ) ( not ( = ?auto_21216 ?auto_21219 ) ) ( not ( = ?auto_21216 ?auto_21244 ) ) ( not ( = ?auto_21217 ?auto_21219 ) ) ( not ( = ?auto_21217 ?auto_21244 ) ) ( not ( = ?auto_21219 ?auto_21250 ) ) ( not ( = ?auto_21219 ?auto_21236 ) ) ( not ( = ?auto_21219 ?auto_21256 ) ) ( not ( = ?auto_21263 ?auto_21258 ) ) ( not ( = ?auto_21263 ?auto_21266 ) ) ( not ( = ?auto_21263 ?auto_21265 ) ) ( not ( = ?auto_21255 ?auto_21237 ) ) ( not ( = ?auto_21255 ?auto_21251 ) ) ( not ( = ?auto_21255 ?auto_21268 ) ) ( not ( = ?auto_21244 ?auto_21250 ) ) ( not ( = ?auto_21244 ?auto_21236 ) ) ( not ( = ?auto_21244 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21220 ) ) ( not ( = ?auto_21215 ?auto_21257 ) ) ( not ( = ?auto_21216 ?auto_21220 ) ) ( not ( = ?auto_21216 ?auto_21257 ) ) ( not ( = ?auto_21217 ?auto_21220 ) ) ( not ( = ?auto_21217 ?auto_21257 ) ) ( not ( = ?auto_21218 ?auto_21220 ) ) ( not ( = ?auto_21218 ?auto_21257 ) ) ( not ( = ?auto_21220 ?auto_21244 ) ) ( not ( = ?auto_21220 ?auto_21250 ) ) ( not ( = ?auto_21220 ?auto_21236 ) ) ( not ( = ?auto_21220 ?auto_21256 ) ) ( not ( = ?auto_21253 ?auto_21263 ) ) ( not ( = ?auto_21253 ?auto_21258 ) ) ( not ( = ?auto_21253 ?auto_21266 ) ) ( not ( = ?auto_21253 ?auto_21265 ) ) ( not ( = ?auto_21248 ?auto_21255 ) ) ( not ( = ?auto_21248 ?auto_21237 ) ) ( not ( = ?auto_21248 ?auto_21251 ) ) ( not ( = ?auto_21248 ?auto_21268 ) ) ( not ( = ?auto_21257 ?auto_21244 ) ) ( not ( = ?auto_21257 ?auto_21250 ) ) ( not ( = ?auto_21257 ?auto_21236 ) ) ( not ( = ?auto_21257 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21221 ) ) ( not ( = ?auto_21215 ?auto_21239 ) ) ( not ( = ?auto_21216 ?auto_21221 ) ) ( not ( = ?auto_21216 ?auto_21239 ) ) ( not ( = ?auto_21217 ?auto_21221 ) ) ( not ( = ?auto_21217 ?auto_21239 ) ) ( not ( = ?auto_21218 ?auto_21221 ) ) ( not ( = ?auto_21218 ?auto_21239 ) ) ( not ( = ?auto_21219 ?auto_21221 ) ) ( not ( = ?auto_21219 ?auto_21239 ) ) ( not ( = ?auto_21221 ?auto_21257 ) ) ( not ( = ?auto_21221 ?auto_21244 ) ) ( not ( = ?auto_21221 ?auto_21250 ) ) ( not ( = ?auto_21221 ?auto_21236 ) ) ( not ( = ?auto_21221 ?auto_21256 ) ) ( not ( = ?auto_21262 ?auto_21253 ) ) ( not ( = ?auto_21262 ?auto_21263 ) ) ( not ( = ?auto_21262 ?auto_21258 ) ) ( not ( = ?auto_21262 ?auto_21266 ) ) ( not ( = ?auto_21262 ?auto_21265 ) ) ( not ( = ?auto_21249 ?auto_21248 ) ) ( not ( = ?auto_21249 ?auto_21255 ) ) ( not ( = ?auto_21249 ?auto_21237 ) ) ( not ( = ?auto_21249 ?auto_21251 ) ) ( not ( = ?auto_21249 ?auto_21268 ) ) ( not ( = ?auto_21239 ?auto_21257 ) ) ( not ( = ?auto_21239 ?auto_21244 ) ) ( not ( = ?auto_21239 ?auto_21250 ) ) ( not ( = ?auto_21239 ?auto_21236 ) ) ( not ( = ?auto_21239 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21222 ) ) ( not ( = ?auto_21215 ?auto_21243 ) ) ( not ( = ?auto_21216 ?auto_21222 ) ) ( not ( = ?auto_21216 ?auto_21243 ) ) ( not ( = ?auto_21217 ?auto_21222 ) ) ( not ( = ?auto_21217 ?auto_21243 ) ) ( not ( = ?auto_21218 ?auto_21222 ) ) ( not ( = ?auto_21218 ?auto_21243 ) ) ( not ( = ?auto_21219 ?auto_21222 ) ) ( not ( = ?auto_21219 ?auto_21243 ) ) ( not ( = ?auto_21220 ?auto_21222 ) ) ( not ( = ?auto_21220 ?auto_21243 ) ) ( not ( = ?auto_21222 ?auto_21239 ) ) ( not ( = ?auto_21222 ?auto_21257 ) ) ( not ( = ?auto_21222 ?auto_21244 ) ) ( not ( = ?auto_21222 ?auto_21250 ) ) ( not ( = ?auto_21222 ?auto_21236 ) ) ( not ( = ?auto_21222 ?auto_21256 ) ) ( not ( = ?auto_21252 ?auto_21262 ) ) ( not ( = ?auto_21252 ?auto_21253 ) ) ( not ( = ?auto_21252 ?auto_21263 ) ) ( not ( = ?auto_21252 ?auto_21258 ) ) ( not ( = ?auto_21252 ?auto_21266 ) ) ( not ( = ?auto_21252 ?auto_21265 ) ) ( not ( = ?auto_21260 ?auto_21249 ) ) ( not ( = ?auto_21260 ?auto_21248 ) ) ( not ( = ?auto_21260 ?auto_21255 ) ) ( not ( = ?auto_21260 ?auto_21237 ) ) ( not ( = ?auto_21260 ?auto_21251 ) ) ( not ( = ?auto_21260 ?auto_21268 ) ) ( not ( = ?auto_21243 ?auto_21239 ) ) ( not ( = ?auto_21243 ?auto_21257 ) ) ( not ( = ?auto_21243 ?auto_21244 ) ) ( not ( = ?auto_21243 ?auto_21250 ) ) ( not ( = ?auto_21243 ?auto_21236 ) ) ( not ( = ?auto_21243 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21223 ) ) ( not ( = ?auto_21215 ?auto_21245 ) ) ( not ( = ?auto_21216 ?auto_21223 ) ) ( not ( = ?auto_21216 ?auto_21245 ) ) ( not ( = ?auto_21217 ?auto_21223 ) ) ( not ( = ?auto_21217 ?auto_21245 ) ) ( not ( = ?auto_21218 ?auto_21223 ) ) ( not ( = ?auto_21218 ?auto_21245 ) ) ( not ( = ?auto_21219 ?auto_21223 ) ) ( not ( = ?auto_21219 ?auto_21245 ) ) ( not ( = ?auto_21220 ?auto_21223 ) ) ( not ( = ?auto_21220 ?auto_21245 ) ) ( not ( = ?auto_21221 ?auto_21223 ) ) ( not ( = ?auto_21221 ?auto_21245 ) ) ( not ( = ?auto_21223 ?auto_21243 ) ) ( not ( = ?auto_21223 ?auto_21239 ) ) ( not ( = ?auto_21223 ?auto_21257 ) ) ( not ( = ?auto_21223 ?auto_21244 ) ) ( not ( = ?auto_21223 ?auto_21250 ) ) ( not ( = ?auto_21223 ?auto_21236 ) ) ( not ( = ?auto_21223 ?auto_21256 ) ) ( not ( = ?auto_21234 ?auto_21252 ) ) ( not ( = ?auto_21234 ?auto_21262 ) ) ( not ( = ?auto_21234 ?auto_21253 ) ) ( not ( = ?auto_21234 ?auto_21263 ) ) ( not ( = ?auto_21234 ?auto_21258 ) ) ( not ( = ?auto_21234 ?auto_21266 ) ) ( not ( = ?auto_21234 ?auto_21265 ) ) ( not ( = ?auto_21232 ?auto_21260 ) ) ( not ( = ?auto_21232 ?auto_21249 ) ) ( not ( = ?auto_21232 ?auto_21248 ) ) ( not ( = ?auto_21232 ?auto_21255 ) ) ( not ( = ?auto_21232 ?auto_21237 ) ) ( not ( = ?auto_21232 ?auto_21251 ) ) ( not ( = ?auto_21232 ?auto_21268 ) ) ( not ( = ?auto_21245 ?auto_21243 ) ) ( not ( = ?auto_21245 ?auto_21239 ) ) ( not ( = ?auto_21245 ?auto_21257 ) ) ( not ( = ?auto_21245 ?auto_21244 ) ) ( not ( = ?auto_21245 ?auto_21250 ) ) ( not ( = ?auto_21245 ?auto_21236 ) ) ( not ( = ?auto_21245 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21224 ) ) ( not ( = ?auto_21215 ?auto_21264 ) ) ( not ( = ?auto_21216 ?auto_21224 ) ) ( not ( = ?auto_21216 ?auto_21264 ) ) ( not ( = ?auto_21217 ?auto_21224 ) ) ( not ( = ?auto_21217 ?auto_21264 ) ) ( not ( = ?auto_21218 ?auto_21224 ) ) ( not ( = ?auto_21218 ?auto_21264 ) ) ( not ( = ?auto_21219 ?auto_21224 ) ) ( not ( = ?auto_21219 ?auto_21264 ) ) ( not ( = ?auto_21220 ?auto_21224 ) ) ( not ( = ?auto_21220 ?auto_21264 ) ) ( not ( = ?auto_21221 ?auto_21224 ) ) ( not ( = ?auto_21221 ?auto_21264 ) ) ( not ( = ?auto_21222 ?auto_21224 ) ) ( not ( = ?auto_21222 ?auto_21264 ) ) ( not ( = ?auto_21224 ?auto_21245 ) ) ( not ( = ?auto_21224 ?auto_21243 ) ) ( not ( = ?auto_21224 ?auto_21239 ) ) ( not ( = ?auto_21224 ?auto_21257 ) ) ( not ( = ?auto_21224 ?auto_21244 ) ) ( not ( = ?auto_21224 ?auto_21250 ) ) ( not ( = ?auto_21224 ?auto_21236 ) ) ( not ( = ?auto_21224 ?auto_21256 ) ) ( not ( = ?auto_21241 ?auto_21234 ) ) ( not ( = ?auto_21241 ?auto_21252 ) ) ( not ( = ?auto_21241 ?auto_21262 ) ) ( not ( = ?auto_21241 ?auto_21253 ) ) ( not ( = ?auto_21241 ?auto_21263 ) ) ( not ( = ?auto_21241 ?auto_21258 ) ) ( not ( = ?auto_21241 ?auto_21266 ) ) ( not ( = ?auto_21241 ?auto_21265 ) ) ( not ( = ?auto_21267 ?auto_21232 ) ) ( not ( = ?auto_21267 ?auto_21260 ) ) ( not ( = ?auto_21267 ?auto_21249 ) ) ( not ( = ?auto_21267 ?auto_21248 ) ) ( not ( = ?auto_21267 ?auto_21255 ) ) ( not ( = ?auto_21267 ?auto_21237 ) ) ( not ( = ?auto_21267 ?auto_21251 ) ) ( not ( = ?auto_21267 ?auto_21268 ) ) ( not ( = ?auto_21264 ?auto_21245 ) ) ( not ( = ?auto_21264 ?auto_21243 ) ) ( not ( = ?auto_21264 ?auto_21239 ) ) ( not ( = ?auto_21264 ?auto_21257 ) ) ( not ( = ?auto_21264 ?auto_21244 ) ) ( not ( = ?auto_21264 ?auto_21250 ) ) ( not ( = ?auto_21264 ?auto_21236 ) ) ( not ( = ?auto_21264 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21225 ) ) ( not ( = ?auto_21215 ?auto_21246 ) ) ( not ( = ?auto_21216 ?auto_21225 ) ) ( not ( = ?auto_21216 ?auto_21246 ) ) ( not ( = ?auto_21217 ?auto_21225 ) ) ( not ( = ?auto_21217 ?auto_21246 ) ) ( not ( = ?auto_21218 ?auto_21225 ) ) ( not ( = ?auto_21218 ?auto_21246 ) ) ( not ( = ?auto_21219 ?auto_21225 ) ) ( not ( = ?auto_21219 ?auto_21246 ) ) ( not ( = ?auto_21220 ?auto_21225 ) ) ( not ( = ?auto_21220 ?auto_21246 ) ) ( not ( = ?auto_21221 ?auto_21225 ) ) ( not ( = ?auto_21221 ?auto_21246 ) ) ( not ( = ?auto_21222 ?auto_21225 ) ) ( not ( = ?auto_21222 ?auto_21246 ) ) ( not ( = ?auto_21223 ?auto_21225 ) ) ( not ( = ?auto_21223 ?auto_21246 ) ) ( not ( = ?auto_21225 ?auto_21264 ) ) ( not ( = ?auto_21225 ?auto_21245 ) ) ( not ( = ?auto_21225 ?auto_21243 ) ) ( not ( = ?auto_21225 ?auto_21239 ) ) ( not ( = ?auto_21225 ?auto_21257 ) ) ( not ( = ?auto_21225 ?auto_21244 ) ) ( not ( = ?auto_21225 ?auto_21250 ) ) ( not ( = ?auto_21225 ?auto_21236 ) ) ( not ( = ?auto_21225 ?auto_21256 ) ) ( not ( = ?auto_21240 ?auto_21241 ) ) ( not ( = ?auto_21240 ?auto_21234 ) ) ( not ( = ?auto_21240 ?auto_21252 ) ) ( not ( = ?auto_21240 ?auto_21262 ) ) ( not ( = ?auto_21240 ?auto_21253 ) ) ( not ( = ?auto_21240 ?auto_21263 ) ) ( not ( = ?auto_21240 ?auto_21258 ) ) ( not ( = ?auto_21240 ?auto_21266 ) ) ( not ( = ?auto_21240 ?auto_21265 ) ) ( not ( = ?auto_21238 ?auto_21267 ) ) ( not ( = ?auto_21238 ?auto_21232 ) ) ( not ( = ?auto_21238 ?auto_21260 ) ) ( not ( = ?auto_21238 ?auto_21249 ) ) ( not ( = ?auto_21238 ?auto_21248 ) ) ( not ( = ?auto_21238 ?auto_21255 ) ) ( not ( = ?auto_21238 ?auto_21237 ) ) ( not ( = ?auto_21238 ?auto_21251 ) ) ( not ( = ?auto_21238 ?auto_21268 ) ) ( not ( = ?auto_21246 ?auto_21264 ) ) ( not ( = ?auto_21246 ?auto_21245 ) ) ( not ( = ?auto_21246 ?auto_21243 ) ) ( not ( = ?auto_21246 ?auto_21239 ) ) ( not ( = ?auto_21246 ?auto_21257 ) ) ( not ( = ?auto_21246 ?auto_21244 ) ) ( not ( = ?auto_21246 ?auto_21250 ) ) ( not ( = ?auto_21246 ?auto_21236 ) ) ( not ( = ?auto_21246 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21226 ) ) ( not ( = ?auto_21215 ?auto_21254 ) ) ( not ( = ?auto_21216 ?auto_21226 ) ) ( not ( = ?auto_21216 ?auto_21254 ) ) ( not ( = ?auto_21217 ?auto_21226 ) ) ( not ( = ?auto_21217 ?auto_21254 ) ) ( not ( = ?auto_21218 ?auto_21226 ) ) ( not ( = ?auto_21218 ?auto_21254 ) ) ( not ( = ?auto_21219 ?auto_21226 ) ) ( not ( = ?auto_21219 ?auto_21254 ) ) ( not ( = ?auto_21220 ?auto_21226 ) ) ( not ( = ?auto_21220 ?auto_21254 ) ) ( not ( = ?auto_21221 ?auto_21226 ) ) ( not ( = ?auto_21221 ?auto_21254 ) ) ( not ( = ?auto_21222 ?auto_21226 ) ) ( not ( = ?auto_21222 ?auto_21254 ) ) ( not ( = ?auto_21223 ?auto_21226 ) ) ( not ( = ?auto_21223 ?auto_21254 ) ) ( not ( = ?auto_21224 ?auto_21226 ) ) ( not ( = ?auto_21224 ?auto_21254 ) ) ( not ( = ?auto_21226 ?auto_21246 ) ) ( not ( = ?auto_21226 ?auto_21264 ) ) ( not ( = ?auto_21226 ?auto_21245 ) ) ( not ( = ?auto_21226 ?auto_21243 ) ) ( not ( = ?auto_21226 ?auto_21239 ) ) ( not ( = ?auto_21226 ?auto_21257 ) ) ( not ( = ?auto_21226 ?auto_21244 ) ) ( not ( = ?auto_21226 ?auto_21250 ) ) ( not ( = ?auto_21226 ?auto_21236 ) ) ( not ( = ?auto_21226 ?auto_21256 ) ) ( not ( = ?auto_21254 ?auto_21246 ) ) ( not ( = ?auto_21254 ?auto_21264 ) ) ( not ( = ?auto_21254 ?auto_21245 ) ) ( not ( = ?auto_21254 ?auto_21243 ) ) ( not ( = ?auto_21254 ?auto_21239 ) ) ( not ( = ?auto_21254 ?auto_21257 ) ) ( not ( = ?auto_21254 ?auto_21244 ) ) ( not ( = ?auto_21254 ?auto_21250 ) ) ( not ( = ?auto_21254 ?auto_21236 ) ) ( not ( = ?auto_21254 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21227 ) ) ( not ( = ?auto_21215 ?auto_21247 ) ) ( not ( = ?auto_21216 ?auto_21227 ) ) ( not ( = ?auto_21216 ?auto_21247 ) ) ( not ( = ?auto_21217 ?auto_21227 ) ) ( not ( = ?auto_21217 ?auto_21247 ) ) ( not ( = ?auto_21218 ?auto_21227 ) ) ( not ( = ?auto_21218 ?auto_21247 ) ) ( not ( = ?auto_21219 ?auto_21227 ) ) ( not ( = ?auto_21219 ?auto_21247 ) ) ( not ( = ?auto_21220 ?auto_21227 ) ) ( not ( = ?auto_21220 ?auto_21247 ) ) ( not ( = ?auto_21221 ?auto_21227 ) ) ( not ( = ?auto_21221 ?auto_21247 ) ) ( not ( = ?auto_21222 ?auto_21227 ) ) ( not ( = ?auto_21222 ?auto_21247 ) ) ( not ( = ?auto_21223 ?auto_21227 ) ) ( not ( = ?auto_21223 ?auto_21247 ) ) ( not ( = ?auto_21224 ?auto_21227 ) ) ( not ( = ?auto_21224 ?auto_21247 ) ) ( not ( = ?auto_21225 ?auto_21227 ) ) ( not ( = ?auto_21225 ?auto_21247 ) ) ( not ( = ?auto_21227 ?auto_21254 ) ) ( not ( = ?auto_21227 ?auto_21246 ) ) ( not ( = ?auto_21227 ?auto_21264 ) ) ( not ( = ?auto_21227 ?auto_21245 ) ) ( not ( = ?auto_21227 ?auto_21243 ) ) ( not ( = ?auto_21227 ?auto_21239 ) ) ( not ( = ?auto_21227 ?auto_21257 ) ) ( not ( = ?auto_21227 ?auto_21244 ) ) ( not ( = ?auto_21227 ?auto_21250 ) ) ( not ( = ?auto_21227 ?auto_21236 ) ) ( not ( = ?auto_21227 ?auto_21256 ) ) ( not ( = ?auto_21247 ?auto_21254 ) ) ( not ( = ?auto_21247 ?auto_21246 ) ) ( not ( = ?auto_21247 ?auto_21264 ) ) ( not ( = ?auto_21247 ?auto_21245 ) ) ( not ( = ?auto_21247 ?auto_21243 ) ) ( not ( = ?auto_21247 ?auto_21239 ) ) ( not ( = ?auto_21247 ?auto_21257 ) ) ( not ( = ?auto_21247 ?auto_21244 ) ) ( not ( = ?auto_21247 ?auto_21250 ) ) ( not ( = ?auto_21247 ?auto_21236 ) ) ( not ( = ?auto_21247 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21228 ) ) ( not ( = ?auto_21215 ?auto_21261 ) ) ( not ( = ?auto_21216 ?auto_21228 ) ) ( not ( = ?auto_21216 ?auto_21261 ) ) ( not ( = ?auto_21217 ?auto_21228 ) ) ( not ( = ?auto_21217 ?auto_21261 ) ) ( not ( = ?auto_21218 ?auto_21228 ) ) ( not ( = ?auto_21218 ?auto_21261 ) ) ( not ( = ?auto_21219 ?auto_21228 ) ) ( not ( = ?auto_21219 ?auto_21261 ) ) ( not ( = ?auto_21220 ?auto_21228 ) ) ( not ( = ?auto_21220 ?auto_21261 ) ) ( not ( = ?auto_21221 ?auto_21228 ) ) ( not ( = ?auto_21221 ?auto_21261 ) ) ( not ( = ?auto_21222 ?auto_21228 ) ) ( not ( = ?auto_21222 ?auto_21261 ) ) ( not ( = ?auto_21223 ?auto_21228 ) ) ( not ( = ?auto_21223 ?auto_21261 ) ) ( not ( = ?auto_21224 ?auto_21228 ) ) ( not ( = ?auto_21224 ?auto_21261 ) ) ( not ( = ?auto_21225 ?auto_21228 ) ) ( not ( = ?auto_21225 ?auto_21261 ) ) ( not ( = ?auto_21226 ?auto_21228 ) ) ( not ( = ?auto_21226 ?auto_21261 ) ) ( not ( = ?auto_21228 ?auto_21247 ) ) ( not ( = ?auto_21228 ?auto_21254 ) ) ( not ( = ?auto_21228 ?auto_21246 ) ) ( not ( = ?auto_21228 ?auto_21264 ) ) ( not ( = ?auto_21228 ?auto_21245 ) ) ( not ( = ?auto_21228 ?auto_21243 ) ) ( not ( = ?auto_21228 ?auto_21239 ) ) ( not ( = ?auto_21228 ?auto_21257 ) ) ( not ( = ?auto_21228 ?auto_21244 ) ) ( not ( = ?auto_21228 ?auto_21250 ) ) ( not ( = ?auto_21228 ?auto_21236 ) ) ( not ( = ?auto_21228 ?auto_21256 ) ) ( not ( = ?auto_21242 ?auto_21263 ) ) ( not ( = ?auto_21242 ?auto_21258 ) ) ( not ( = ?auto_21242 ?auto_21240 ) ) ( not ( = ?auto_21242 ?auto_21241 ) ) ( not ( = ?auto_21242 ?auto_21234 ) ) ( not ( = ?auto_21242 ?auto_21252 ) ) ( not ( = ?auto_21242 ?auto_21262 ) ) ( not ( = ?auto_21242 ?auto_21253 ) ) ( not ( = ?auto_21242 ?auto_21266 ) ) ( not ( = ?auto_21242 ?auto_21265 ) ) ( not ( = ?auto_21259 ?auto_21255 ) ) ( not ( = ?auto_21259 ?auto_21237 ) ) ( not ( = ?auto_21259 ?auto_21238 ) ) ( not ( = ?auto_21259 ?auto_21267 ) ) ( not ( = ?auto_21259 ?auto_21232 ) ) ( not ( = ?auto_21259 ?auto_21260 ) ) ( not ( = ?auto_21259 ?auto_21249 ) ) ( not ( = ?auto_21259 ?auto_21248 ) ) ( not ( = ?auto_21259 ?auto_21251 ) ) ( not ( = ?auto_21259 ?auto_21268 ) ) ( not ( = ?auto_21261 ?auto_21247 ) ) ( not ( = ?auto_21261 ?auto_21254 ) ) ( not ( = ?auto_21261 ?auto_21246 ) ) ( not ( = ?auto_21261 ?auto_21264 ) ) ( not ( = ?auto_21261 ?auto_21245 ) ) ( not ( = ?auto_21261 ?auto_21243 ) ) ( not ( = ?auto_21261 ?auto_21239 ) ) ( not ( = ?auto_21261 ?auto_21257 ) ) ( not ( = ?auto_21261 ?auto_21244 ) ) ( not ( = ?auto_21261 ?auto_21250 ) ) ( not ( = ?auto_21261 ?auto_21236 ) ) ( not ( = ?auto_21261 ?auto_21256 ) ) ( not ( = ?auto_21215 ?auto_21229 ) ) ( not ( = ?auto_21215 ?auto_21230 ) ) ( not ( = ?auto_21216 ?auto_21229 ) ) ( not ( = ?auto_21216 ?auto_21230 ) ) ( not ( = ?auto_21217 ?auto_21229 ) ) ( not ( = ?auto_21217 ?auto_21230 ) ) ( not ( = ?auto_21218 ?auto_21229 ) ) ( not ( = ?auto_21218 ?auto_21230 ) ) ( not ( = ?auto_21219 ?auto_21229 ) ) ( not ( = ?auto_21219 ?auto_21230 ) ) ( not ( = ?auto_21220 ?auto_21229 ) ) ( not ( = ?auto_21220 ?auto_21230 ) ) ( not ( = ?auto_21221 ?auto_21229 ) ) ( not ( = ?auto_21221 ?auto_21230 ) ) ( not ( = ?auto_21222 ?auto_21229 ) ) ( not ( = ?auto_21222 ?auto_21230 ) ) ( not ( = ?auto_21223 ?auto_21229 ) ) ( not ( = ?auto_21223 ?auto_21230 ) ) ( not ( = ?auto_21224 ?auto_21229 ) ) ( not ( = ?auto_21224 ?auto_21230 ) ) ( not ( = ?auto_21225 ?auto_21229 ) ) ( not ( = ?auto_21225 ?auto_21230 ) ) ( not ( = ?auto_21226 ?auto_21229 ) ) ( not ( = ?auto_21226 ?auto_21230 ) ) ( not ( = ?auto_21227 ?auto_21229 ) ) ( not ( = ?auto_21227 ?auto_21230 ) ) ( not ( = ?auto_21229 ?auto_21261 ) ) ( not ( = ?auto_21229 ?auto_21247 ) ) ( not ( = ?auto_21229 ?auto_21254 ) ) ( not ( = ?auto_21229 ?auto_21246 ) ) ( not ( = ?auto_21229 ?auto_21264 ) ) ( not ( = ?auto_21229 ?auto_21245 ) ) ( not ( = ?auto_21229 ?auto_21243 ) ) ( not ( = ?auto_21229 ?auto_21239 ) ) ( not ( = ?auto_21229 ?auto_21257 ) ) ( not ( = ?auto_21229 ?auto_21244 ) ) ( not ( = ?auto_21229 ?auto_21250 ) ) ( not ( = ?auto_21229 ?auto_21236 ) ) ( not ( = ?auto_21229 ?auto_21256 ) ) ( not ( = ?auto_21230 ?auto_21261 ) ) ( not ( = ?auto_21230 ?auto_21247 ) ) ( not ( = ?auto_21230 ?auto_21254 ) ) ( not ( = ?auto_21230 ?auto_21246 ) ) ( not ( = ?auto_21230 ?auto_21264 ) ) ( not ( = ?auto_21230 ?auto_21245 ) ) ( not ( = ?auto_21230 ?auto_21243 ) ) ( not ( = ?auto_21230 ?auto_21239 ) ) ( not ( = ?auto_21230 ?auto_21257 ) ) ( not ( = ?auto_21230 ?auto_21244 ) ) ( not ( = ?auto_21230 ?auto_21250 ) ) ( not ( = ?auto_21230 ?auto_21236 ) ) ( not ( = ?auto_21230 ?auto_21256 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ?auto_21220 ?auto_21221 ?auto_21222 ?auto_21223 ?auto_21224 ?auto_21225 ?auto_21226 ?auto_21227 ?auto_21228 )
      ( MAKE-1CRATE ?auto_21228 ?auto_21229 )
      ( MAKE-14CRATE-VERIFY ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ?auto_21220 ?auto_21221 ?auto_21222 ?auto_21223 ?auto_21224 ?auto_21225 ?auto_21226 ?auto_21227 ?auto_21228 ?auto_21229 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_21295 - SURFACE
      ?auto_21296 - SURFACE
      ?auto_21297 - SURFACE
      ?auto_21298 - SURFACE
      ?auto_21299 - SURFACE
      ?auto_21300 - SURFACE
      ?auto_21301 - SURFACE
      ?auto_21302 - SURFACE
      ?auto_21303 - SURFACE
      ?auto_21304 - SURFACE
      ?auto_21305 - SURFACE
      ?auto_21306 - SURFACE
      ?auto_21307 - SURFACE
      ?auto_21308 - SURFACE
      ?auto_21309 - SURFACE
      ?auto_21310 - SURFACE
    )
    :vars
    (
      ?auto_21311 - HOIST
      ?auto_21314 - PLACE
      ?auto_21312 - PLACE
      ?auto_21313 - HOIST
      ?auto_21315 - SURFACE
      ?auto_21341 - PLACE
      ?auto_21321 - HOIST
      ?auto_21322 - SURFACE
      ?auto_21329 - PLACE
      ?auto_21334 - HOIST
      ?auto_21331 - SURFACE
      ?auto_21336 - PLACE
      ?auto_21346 - HOIST
      ?auto_21324 - SURFACE
      ?auto_21318 - PLACE
      ?auto_21347 - HOIST
      ?auto_21350 - SURFACE
      ?auto_21343 - PLACE
      ?auto_21339 - HOIST
      ?auto_21320 - SURFACE
      ?auto_21338 - PLACE
      ?auto_21344 - HOIST
      ?auto_21323 - SURFACE
      ?auto_21330 - SURFACE
      ?auto_21335 - PLACE
      ?auto_21348 - HOIST
      ?auto_21345 - SURFACE
      ?auto_21327 - SURFACE
      ?auto_21337 - PLACE
      ?auto_21332 - HOIST
      ?auto_21342 - SURFACE
      ?auto_21340 - SURFACE
      ?auto_21328 - SURFACE
      ?auto_21319 - PLACE
      ?auto_21326 - HOIST
      ?auto_21317 - SURFACE
      ?auto_21333 - PLACE
      ?auto_21349 - HOIST
      ?auto_21325 - SURFACE
      ?auto_21316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21311 ?auto_21314 ) ( IS-CRATE ?auto_21310 ) ( not ( = ?auto_21312 ?auto_21314 ) ) ( HOIST-AT ?auto_21313 ?auto_21312 ) ( SURFACE-AT ?auto_21310 ?auto_21312 ) ( ON ?auto_21310 ?auto_21315 ) ( CLEAR ?auto_21310 ) ( not ( = ?auto_21309 ?auto_21310 ) ) ( not ( = ?auto_21309 ?auto_21315 ) ) ( not ( = ?auto_21310 ?auto_21315 ) ) ( not ( = ?auto_21311 ?auto_21313 ) ) ( IS-CRATE ?auto_21309 ) ( not ( = ?auto_21341 ?auto_21314 ) ) ( HOIST-AT ?auto_21321 ?auto_21341 ) ( SURFACE-AT ?auto_21309 ?auto_21341 ) ( ON ?auto_21309 ?auto_21322 ) ( CLEAR ?auto_21309 ) ( not ( = ?auto_21308 ?auto_21309 ) ) ( not ( = ?auto_21308 ?auto_21322 ) ) ( not ( = ?auto_21309 ?auto_21322 ) ) ( not ( = ?auto_21311 ?auto_21321 ) ) ( IS-CRATE ?auto_21308 ) ( not ( = ?auto_21329 ?auto_21314 ) ) ( HOIST-AT ?auto_21334 ?auto_21329 ) ( AVAILABLE ?auto_21334 ) ( SURFACE-AT ?auto_21308 ?auto_21329 ) ( ON ?auto_21308 ?auto_21331 ) ( CLEAR ?auto_21308 ) ( not ( = ?auto_21307 ?auto_21308 ) ) ( not ( = ?auto_21307 ?auto_21331 ) ) ( not ( = ?auto_21308 ?auto_21331 ) ) ( not ( = ?auto_21311 ?auto_21334 ) ) ( IS-CRATE ?auto_21307 ) ( not ( = ?auto_21336 ?auto_21314 ) ) ( HOIST-AT ?auto_21346 ?auto_21336 ) ( SURFACE-AT ?auto_21307 ?auto_21336 ) ( ON ?auto_21307 ?auto_21324 ) ( CLEAR ?auto_21307 ) ( not ( = ?auto_21306 ?auto_21307 ) ) ( not ( = ?auto_21306 ?auto_21324 ) ) ( not ( = ?auto_21307 ?auto_21324 ) ) ( not ( = ?auto_21311 ?auto_21346 ) ) ( IS-CRATE ?auto_21306 ) ( not ( = ?auto_21318 ?auto_21314 ) ) ( HOIST-AT ?auto_21347 ?auto_21318 ) ( SURFACE-AT ?auto_21306 ?auto_21318 ) ( ON ?auto_21306 ?auto_21350 ) ( CLEAR ?auto_21306 ) ( not ( = ?auto_21305 ?auto_21306 ) ) ( not ( = ?auto_21305 ?auto_21350 ) ) ( not ( = ?auto_21306 ?auto_21350 ) ) ( not ( = ?auto_21311 ?auto_21347 ) ) ( IS-CRATE ?auto_21305 ) ( not ( = ?auto_21343 ?auto_21314 ) ) ( HOIST-AT ?auto_21339 ?auto_21343 ) ( AVAILABLE ?auto_21339 ) ( SURFACE-AT ?auto_21305 ?auto_21343 ) ( ON ?auto_21305 ?auto_21320 ) ( CLEAR ?auto_21305 ) ( not ( = ?auto_21304 ?auto_21305 ) ) ( not ( = ?auto_21304 ?auto_21320 ) ) ( not ( = ?auto_21305 ?auto_21320 ) ) ( not ( = ?auto_21311 ?auto_21339 ) ) ( IS-CRATE ?auto_21304 ) ( not ( = ?auto_21338 ?auto_21314 ) ) ( HOIST-AT ?auto_21344 ?auto_21338 ) ( AVAILABLE ?auto_21344 ) ( SURFACE-AT ?auto_21304 ?auto_21338 ) ( ON ?auto_21304 ?auto_21323 ) ( CLEAR ?auto_21304 ) ( not ( = ?auto_21303 ?auto_21304 ) ) ( not ( = ?auto_21303 ?auto_21323 ) ) ( not ( = ?auto_21304 ?auto_21323 ) ) ( not ( = ?auto_21311 ?auto_21344 ) ) ( IS-CRATE ?auto_21303 ) ( AVAILABLE ?auto_21321 ) ( SURFACE-AT ?auto_21303 ?auto_21341 ) ( ON ?auto_21303 ?auto_21330 ) ( CLEAR ?auto_21303 ) ( not ( = ?auto_21302 ?auto_21303 ) ) ( not ( = ?auto_21302 ?auto_21330 ) ) ( not ( = ?auto_21303 ?auto_21330 ) ) ( IS-CRATE ?auto_21302 ) ( not ( = ?auto_21335 ?auto_21314 ) ) ( HOIST-AT ?auto_21348 ?auto_21335 ) ( AVAILABLE ?auto_21348 ) ( SURFACE-AT ?auto_21302 ?auto_21335 ) ( ON ?auto_21302 ?auto_21345 ) ( CLEAR ?auto_21302 ) ( not ( = ?auto_21301 ?auto_21302 ) ) ( not ( = ?auto_21301 ?auto_21345 ) ) ( not ( = ?auto_21302 ?auto_21345 ) ) ( not ( = ?auto_21311 ?auto_21348 ) ) ( IS-CRATE ?auto_21301 ) ( AVAILABLE ?auto_21313 ) ( SURFACE-AT ?auto_21301 ?auto_21312 ) ( ON ?auto_21301 ?auto_21327 ) ( CLEAR ?auto_21301 ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( not ( = ?auto_21300 ?auto_21327 ) ) ( not ( = ?auto_21301 ?auto_21327 ) ) ( IS-CRATE ?auto_21300 ) ( not ( = ?auto_21337 ?auto_21314 ) ) ( HOIST-AT ?auto_21332 ?auto_21337 ) ( AVAILABLE ?auto_21332 ) ( SURFACE-AT ?auto_21300 ?auto_21337 ) ( ON ?auto_21300 ?auto_21342 ) ( CLEAR ?auto_21300 ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21299 ?auto_21342 ) ) ( not ( = ?auto_21300 ?auto_21342 ) ) ( not ( = ?auto_21311 ?auto_21332 ) ) ( IS-CRATE ?auto_21299 ) ( AVAILABLE ?auto_21346 ) ( SURFACE-AT ?auto_21299 ?auto_21336 ) ( ON ?auto_21299 ?auto_21340 ) ( CLEAR ?auto_21299 ) ( not ( = ?auto_21298 ?auto_21299 ) ) ( not ( = ?auto_21298 ?auto_21340 ) ) ( not ( = ?auto_21299 ?auto_21340 ) ) ( IS-CRATE ?auto_21298 ) ( AVAILABLE ?auto_21347 ) ( SURFACE-AT ?auto_21298 ?auto_21318 ) ( ON ?auto_21298 ?auto_21328 ) ( CLEAR ?auto_21298 ) ( not ( = ?auto_21297 ?auto_21298 ) ) ( not ( = ?auto_21297 ?auto_21328 ) ) ( not ( = ?auto_21298 ?auto_21328 ) ) ( IS-CRATE ?auto_21297 ) ( not ( = ?auto_21319 ?auto_21314 ) ) ( HOIST-AT ?auto_21326 ?auto_21319 ) ( AVAILABLE ?auto_21326 ) ( SURFACE-AT ?auto_21297 ?auto_21319 ) ( ON ?auto_21297 ?auto_21317 ) ( CLEAR ?auto_21297 ) ( not ( = ?auto_21296 ?auto_21297 ) ) ( not ( = ?auto_21296 ?auto_21317 ) ) ( not ( = ?auto_21297 ?auto_21317 ) ) ( not ( = ?auto_21311 ?auto_21326 ) ) ( SURFACE-AT ?auto_21295 ?auto_21314 ) ( CLEAR ?auto_21295 ) ( IS-CRATE ?auto_21296 ) ( AVAILABLE ?auto_21311 ) ( not ( = ?auto_21333 ?auto_21314 ) ) ( HOIST-AT ?auto_21349 ?auto_21333 ) ( AVAILABLE ?auto_21349 ) ( SURFACE-AT ?auto_21296 ?auto_21333 ) ( ON ?auto_21296 ?auto_21325 ) ( CLEAR ?auto_21296 ) ( TRUCK-AT ?auto_21316 ?auto_21314 ) ( not ( = ?auto_21295 ?auto_21296 ) ) ( not ( = ?auto_21295 ?auto_21325 ) ) ( not ( = ?auto_21296 ?auto_21325 ) ) ( not ( = ?auto_21311 ?auto_21349 ) ) ( not ( = ?auto_21295 ?auto_21297 ) ) ( not ( = ?auto_21295 ?auto_21317 ) ) ( not ( = ?auto_21297 ?auto_21325 ) ) ( not ( = ?auto_21319 ?auto_21333 ) ) ( not ( = ?auto_21326 ?auto_21349 ) ) ( not ( = ?auto_21317 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21298 ) ) ( not ( = ?auto_21295 ?auto_21328 ) ) ( not ( = ?auto_21296 ?auto_21298 ) ) ( not ( = ?auto_21296 ?auto_21328 ) ) ( not ( = ?auto_21298 ?auto_21317 ) ) ( not ( = ?auto_21298 ?auto_21325 ) ) ( not ( = ?auto_21318 ?auto_21319 ) ) ( not ( = ?auto_21318 ?auto_21333 ) ) ( not ( = ?auto_21347 ?auto_21326 ) ) ( not ( = ?auto_21347 ?auto_21349 ) ) ( not ( = ?auto_21328 ?auto_21317 ) ) ( not ( = ?auto_21328 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21299 ) ) ( not ( = ?auto_21295 ?auto_21340 ) ) ( not ( = ?auto_21296 ?auto_21299 ) ) ( not ( = ?auto_21296 ?auto_21340 ) ) ( not ( = ?auto_21297 ?auto_21299 ) ) ( not ( = ?auto_21297 ?auto_21340 ) ) ( not ( = ?auto_21299 ?auto_21328 ) ) ( not ( = ?auto_21299 ?auto_21317 ) ) ( not ( = ?auto_21299 ?auto_21325 ) ) ( not ( = ?auto_21336 ?auto_21318 ) ) ( not ( = ?auto_21336 ?auto_21319 ) ) ( not ( = ?auto_21336 ?auto_21333 ) ) ( not ( = ?auto_21346 ?auto_21347 ) ) ( not ( = ?auto_21346 ?auto_21326 ) ) ( not ( = ?auto_21346 ?auto_21349 ) ) ( not ( = ?auto_21340 ?auto_21328 ) ) ( not ( = ?auto_21340 ?auto_21317 ) ) ( not ( = ?auto_21340 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21300 ) ) ( not ( = ?auto_21295 ?auto_21342 ) ) ( not ( = ?auto_21296 ?auto_21300 ) ) ( not ( = ?auto_21296 ?auto_21342 ) ) ( not ( = ?auto_21297 ?auto_21300 ) ) ( not ( = ?auto_21297 ?auto_21342 ) ) ( not ( = ?auto_21298 ?auto_21300 ) ) ( not ( = ?auto_21298 ?auto_21342 ) ) ( not ( = ?auto_21300 ?auto_21340 ) ) ( not ( = ?auto_21300 ?auto_21328 ) ) ( not ( = ?auto_21300 ?auto_21317 ) ) ( not ( = ?auto_21300 ?auto_21325 ) ) ( not ( = ?auto_21337 ?auto_21336 ) ) ( not ( = ?auto_21337 ?auto_21318 ) ) ( not ( = ?auto_21337 ?auto_21319 ) ) ( not ( = ?auto_21337 ?auto_21333 ) ) ( not ( = ?auto_21332 ?auto_21346 ) ) ( not ( = ?auto_21332 ?auto_21347 ) ) ( not ( = ?auto_21332 ?auto_21326 ) ) ( not ( = ?auto_21332 ?auto_21349 ) ) ( not ( = ?auto_21342 ?auto_21340 ) ) ( not ( = ?auto_21342 ?auto_21328 ) ) ( not ( = ?auto_21342 ?auto_21317 ) ) ( not ( = ?auto_21342 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21301 ) ) ( not ( = ?auto_21295 ?auto_21327 ) ) ( not ( = ?auto_21296 ?auto_21301 ) ) ( not ( = ?auto_21296 ?auto_21327 ) ) ( not ( = ?auto_21297 ?auto_21301 ) ) ( not ( = ?auto_21297 ?auto_21327 ) ) ( not ( = ?auto_21298 ?auto_21301 ) ) ( not ( = ?auto_21298 ?auto_21327 ) ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( not ( = ?auto_21299 ?auto_21327 ) ) ( not ( = ?auto_21301 ?auto_21342 ) ) ( not ( = ?auto_21301 ?auto_21340 ) ) ( not ( = ?auto_21301 ?auto_21328 ) ) ( not ( = ?auto_21301 ?auto_21317 ) ) ( not ( = ?auto_21301 ?auto_21325 ) ) ( not ( = ?auto_21312 ?auto_21337 ) ) ( not ( = ?auto_21312 ?auto_21336 ) ) ( not ( = ?auto_21312 ?auto_21318 ) ) ( not ( = ?auto_21312 ?auto_21319 ) ) ( not ( = ?auto_21312 ?auto_21333 ) ) ( not ( = ?auto_21313 ?auto_21332 ) ) ( not ( = ?auto_21313 ?auto_21346 ) ) ( not ( = ?auto_21313 ?auto_21347 ) ) ( not ( = ?auto_21313 ?auto_21326 ) ) ( not ( = ?auto_21313 ?auto_21349 ) ) ( not ( = ?auto_21327 ?auto_21342 ) ) ( not ( = ?auto_21327 ?auto_21340 ) ) ( not ( = ?auto_21327 ?auto_21328 ) ) ( not ( = ?auto_21327 ?auto_21317 ) ) ( not ( = ?auto_21327 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21302 ) ) ( not ( = ?auto_21295 ?auto_21345 ) ) ( not ( = ?auto_21296 ?auto_21302 ) ) ( not ( = ?auto_21296 ?auto_21345 ) ) ( not ( = ?auto_21297 ?auto_21302 ) ) ( not ( = ?auto_21297 ?auto_21345 ) ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21298 ?auto_21345 ) ) ( not ( = ?auto_21299 ?auto_21302 ) ) ( not ( = ?auto_21299 ?auto_21345 ) ) ( not ( = ?auto_21300 ?auto_21302 ) ) ( not ( = ?auto_21300 ?auto_21345 ) ) ( not ( = ?auto_21302 ?auto_21327 ) ) ( not ( = ?auto_21302 ?auto_21342 ) ) ( not ( = ?auto_21302 ?auto_21340 ) ) ( not ( = ?auto_21302 ?auto_21328 ) ) ( not ( = ?auto_21302 ?auto_21317 ) ) ( not ( = ?auto_21302 ?auto_21325 ) ) ( not ( = ?auto_21335 ?auto_21312 ) ) ( not ( = ?auto_21335 ?auto_21337 ) ) ( not ( = ?auto_21335 ?auto_21336 ) ) ( not ( = ?auto_21335 ?auto_21318 ) ) ( not ( = ?auto_21335 ?auto_21319 ) ) ( not ( = ?auto_21335 ?auto_21333 ) ) ( not ( = ?auto_21348 ?auto_21313 ) ) ( not ( = ?auto_21348 ?auto_21332 ) ) ( not ( = ?auto_21348 ?auto_21346 ) ) ( not ( = ?auto_21348 ?auto_21347 ) ) ( not ( = ?auto_21348 ?auto_21326 ) ) ( not ( = ?auto_21348 ?auto_21349 ) ) ( not ( = ?auto_21345 ?auto_21327 ) ) ( not ( = ?auto_21345 ?auto_21342 ) ) ( not ( = ?auto_21345 ?auto_21340 ) ) ( not ( = ?auto_21345 ?auto_21328 ) ) ( not ( = ?auto_21345 ?auto_21317 ) ) ( not ( = ?auto_21345 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21303 ) ) ( not ( = ?auto_21295 ?auto_21330 ) ) ( not ( = ?auto_21296 ?auto_21303 ) ) ( not ( = ?auto_21296 ?auto_21330 ) ) ( not ( = ?auto_21297 ?auto_21303 ) ) ( not ( = ?auto_21297 ?auto_21330 ) ) ( not ( = ?auto_21298 ?auto_21303 ) ) ( not ( = ?auto_21298 ?auto_21330 ) ) ( not ( = ?auto_21299 ?auto_21303 ) ) ( not ( = ?auto_21299 ?auto_21330 ) ) ( not ( = ?auto_21300 ?auto_21303 ) ) ( not ( = ?auto_21300 ?auto_21330 ) ) ( not ( = ?auto_21301 ?auto_21303 ) ) ( not ( = ?auto_21301 ?auto_21330 ) ) ( not ( = ?auto_21303 ?auto_21345 ) ) ( not ( = ?auto_21303 ?auto_21327 ) ) ( not ( = ?auto_21303 ?auto_21342 ) ) ( not ( = ?auto_21303 ?auto_21340 ) ) ( not ( = ?auto_21303 ?auto_21328 ) ) ( not ( = ?auto_21303 ?auto_21317 ) ) ( not ( = ?auto_21303 ?auto_21325 ) ) ( not ( = ?auto_21341 ?auto_21335 ) ) ( not ( = ?auto_21341 ?auto_21312 ) ) ( not ( = ?auto_21341 ?auto_21337 ) ) ( not ( = ?auto_21341 ?auto_21336 ) ) ( not ( = ?auto_21341 ?auto_21318 ) ) ( not ( = ?auto_21341 ?auto_21319 ) ) ( not ( = ?auto_21341 ?auto_21333 ) ) ( not ( = ?auto_21321 ?auto_21348 ) ) ( not ( = ?auto_21321 ?auto_21313 ) ) ( not ( = ?auto_21321 ?auto_21332 ) ) ( not ( = ?auto_21321 ?auto_21346 ) ) ( not ( = ?auto_21321 ?auto_21347 ) ) ( not ( = ?auto_21321 ?auto_21326 ) ) ( not ( = ?auto_21321 ?auto_21349 ) ) ( not ( = ?auto_21330 ?auto_21345 ) ) ( not ( = ?auto_21330 ?auto_21327 ) ) ( not ( = ?auto_21330 ?auto_21342 ) ) ( not ( = ?auto_21330 ?auto_21340 ) ) ( not ( = ?auto_21330 ?auto_21328 ) ) ( not ( = ?auto_21330 ?auto_21317 ) ) ( not ( = ?auto_21330 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21304 ) ) ( not ( = ?auto_21295 ?auto_21323 ) ) ( not ( = ?auto_21296 ?auto_21304 ) ) ( not ( = ?auto_21296 ?auto_21323 ) ) ( not ( = ?auto_21297 ?auto_21304 ) ) ( not ( = ?auto_21297 ?auto_21323 ) ) ( not ( = ?auto_21298 ?auto_21304 ) ) ( not ( = ?auto_21298 ?auto_21323 ) ) ( not ( = ?auto_21299 ?auto_21304 ) ) ( not ( = ?auto_21299 ?auto_21323 ) ) ( not ( = ?auto_21300 ?auto_21304 ) ) ( not ( = ?auto_21300 ?auto_21323 ) ) ( not ( = ?auto_21301 ?auto_21304 ) ) ( not ( = ?auto_21301 ?auto_21323 ) ) ( not ( = ?auto_21302 ?auto_21304 ) ) ( not ( = ?auto_21302 ?auto_21323 ) ) ( not ( = ?auto_21304 ?auto_21330 ) ) ( not ( = ?auto_21304 ?auto_21345 ) ) ( not ( = ?auto_21304 ?auto_21327 ) ) ( not ( = ?auto_21304 ?auto_21342 ) ) ( not ( = ?auto_21304 ?auto_21340 ) ) ( not ( = ?auto_21304 ?auto_21328 ) ) ( not ( = ?auto_21304 ?auto_21317 ) ) ( not ( = ?auto_21304 ?auto_21325 ) ) ( not ( = ?auto_21338 ?auto_21341 ) ) ( not ( = ?auto_21338 ?auto_21335 ) ) ( not ( = ?auto_21338 ?auto_21312 ) ) ( not ( = ?auto_21338 ?auto_21337 ) ) ( not ( = ?auto_21338 ?auto_21336 ) ) ( not ( = ?auto_21338 ?auto_21318 ) ) ( not ( = ?auto_21338 ?auto_21319 ) ) ( not ( = ?auto_21338 ?auto_21333 ) ) ( not ( = ?auto_21344 ?auto_21321 ) ) ( not ( = ?auto_21344 ?auto_21348 ) ) ( not ( = ?auto_21344 ?auto_21313 ) ) ( not ( = ?auto_21344 ?auto_21332 ) ) ( not ( = ?auto_21344 ?auto_21346 ) ) ( not ( = ?auto_21344 ?auto_21347 ) ) ( not ( = ?auto_21344 ?auto_21326 ) ) ( not ( = ?auto_21344 ?auto_21349 ) ) ( not ( = ?auto_21323 ?auto_21330 ) ) ( not ( = ?auto_21323 ?auto_21345 ) ) ( not ( = ?auto_21323 ?auto_21327 ) ) ( not ( = ?auto_21323 ?auto_21342 ) ) ( not ( = ?auto_21323 ?auto_21340 ) ) ( not ( = ?auto_21323 ?auto_21328 ) ) ( not ( = ?auto_21323 ?auto_21317 ) ) ( not ( = ?auto_21323 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21305 ) ) ( not ( = ?auto_21295 ?auto_21320 ) ) ( not ( = ?auto_21296 ?auto_21305 ) ) ( not ( = ?auto_21296 ?auto_21320 ) ) ( not ( = ?auto_21297 ?auto_21305 ) ) ( not ( = ?auto_21297 ?auto_21320 ) ) ( not ( = ?auto_21298 ?auto_21305 ) ) ( not ( = ?auto_21298 ?auto_21320 ) ) ( not ( = ?auto_21299 ?auto_21305 ) ) ( not ( = ?auto_21299 ?auto_21320 ) ) ( not ( = ?auto_21300 ?auto_21305 ) ) ( not ( = ?auto_21300 ?auto_21320 ) ) ( not ( = ?auto_21301 ?auto_21305 ) ) ( not ( = ?auto_21301 ?auto_21320 ) ) ( not ( = ?auto_21302 ?auto_21305 ) ) ( not ( = ?auto_21302 ?auto_21320 ) ) ( not ( = ?auto_21303 ?auto_21305 ) ) ( not ( = ?auto_21303 ?auto_21320 ) ) ( not ( = ?auto_21305 ?auto_21323 ) ) ( not ( = ?auto_21305 ?auto_21330 ) ) ( not ( = ?auto_21305 ?auto_21345 ) ) ( not ( = ?auto_21305 ?auto_21327 ) ) ( not ( = ?auto_21305 ?auto_21342 ) ) ( not ( = ?auto_21305 ?auto_21340 ) ) ( not ( = ?auto_21305 ?auto_21328 ) ) ( not ( = ?auto_21305 ?auto_21317 ) ) ( not ( = ?auto_21305 ?auto_21325 ) ) ( not ( = ?auto_21343 ?auto_21338 ) ) ( not ( = ?auto_21343 ?auto_21341 ) ) ( not ( = ?auto_21343 ?auto_21335 ) ) ( not ( = ?auto_21343 ?auto_21312 ) ) ( not ( = ?auto_21343 ?auto_21337 ) ) ( not ( = ?auto_21343 ?auto_21336 ) ) ( not ( = ?auto_21343 ?auto_21318 ) ) ( not ( = ?auto_21343 ?auto_21319 ) ) ( not ( = ?auto_21343 ?auto_21333 ) ) ( not ( = ?auto_21339 ?auto_21344 ) ) ( not ( = ?auto_21339 ?auto_21321 ) ) ( not ( = ?auto_21339 ?auto_21348 ) ) ( not ( = ?auto_21339 ?auto_21313 ) ) ( not ( = ?auto_21339 ?auto_21332 ) ) ( not ( = ?auto_21339 ?auto_21346 ) ) ( not ( = ?auto_21339 ?auto_21347 ) ) ( not ( = ?auto_21339 ?auto_21326 ) ) ( not ( = ?auto_21339 ?auto_21349 ) ) ( not ( = ?auto_21320 ?auto_21323 ) ) ( not ( = ?auto_21320 ?auto_21330 ) ) ( not ( = ?auto_21320 ?auto_21345 ) ) ( not ( = ?auto_21320 ?auto_21327 ) ) ( not ( = ?auto_21320 ?auto_21342 ) ) ( not ( = ?auto_21320 ?auto_21340 ) ) ( not ( = ?auto_21320 ?auto_21328 ) ) ( not ( = ?auto_21320 ?auto_21317 ) ) ( not ( = ?auto_21320 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21306 ) ) ( not ( = ?auto_21295 ?auto_21350 ) ) ( not ( = ?auto_21296 ?auto_21306 ) ) ( not ( = ?auto_21296 ?auto_21350 ) ) ( not ( = ?auto_21297 ?auto_21306 ) ) ( not ( = ?auto_21297 ?auto_21350 ) ) ( not ( = ?auto_21298 ?auto_21306 ) ) ( not ( = ?auto_21298 ?auto_21350 ) ) ( not ( = ?auto_21299 ?auto_21306 ) ) ( not ( = ?auto_21299 ?auto_21350 ) ) ( not ( = ?auto_21300 ?auto_21306 ) ) ( not ( = ?auto_21300 ?auto_21350 ) ) ( not ( = ?auto_21301 ?auto_21306 ) ) ( not ( = ?auto_21301 ?auto_21350 ) ) ( not ( = ?auto_21302 ?auto_21306 ) ) ( not ( = ?auto_21302 ?auto_21350 ) ) ( not ( = ?auto_21303 ?auto_21306 ) ) ( not ( = ?auto_21303 ?auto_21350 ) ) ( not ( = ?auto_21304 ?auto_21306 ) ) ( not ( = ?auto_21304 ?auto_21350 ) ) ( not ( = ?auto_21306 ?auto_21320 ) ) ( not ( = ?auto_21306 ?auto_21323 ) ) ( not ( = ?auto_21306 ?auto_21330 ) ) ( not ( = ?auto_21306 ?auto_21345 ) ) ( not ( = ?auto_21306 ?auto_21327 ) ) ( not ( = ?auto_21306 ?auto_21342 ) ) ( not ( = ?auto_21306 ?auto_21340 ) ) ( not ( = ?auto_21306 ?auto_21328 ) ) ( not ( = ?auto_21306 ?auto_21317 ) ) ( not ( = ?auto_21306 ?auto_21325 ) ) ( not ( = ?auto_21350 ?auto_21320 ) ) ( not ( = ?auto_21350 ?auto_21323 ) ) ( not ( = ?auto_21350 ?auto_21330 ) ) ( not ( = ?auto_21350 ?auto_21345 ) ) ( not ( = ?auto_21350 ?auto_21327 ) ) ( not ( = ?auto_21350 ?auto_21342 ) ) ( not ( = ?auto_21350 ?auto_21340 ) ) ( not ( = ?auto_21350 ?auto_21328 ) ) ( not ( = ?auto_21350 ?auto_21317 ) ) ( not ( = ?auto_21350 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21307 ) ) ( not ( = ?auto_21295 ?auto_21324 ) ) ( not ( = ?auto_21296 ?auto_21307 ) ) ( not ( = ?auto_21296 ?auto_21324 ) ) ( not ( = ?auto_21297 ?auto_21307 ) ) ( not ( = ?auto_21297 ?auto_21324 ) ) ( not ( = ?auto_21298 ?auto_21307 ) ) ( not ( = ?auto_21298 ?auto_21324 ) ) ( not ( = ?auto_21299 ?auto_21307 ) ) ( not ( = ?auto_21299 ?auto_21324 ) ) ( not ( = ?auto_21300 ?auto_21307 ) ) ( not ( = ?auto_21300 ?auto_21324 ) ) ( not ( = ?auto_21301 ?auto_21307 ) ) ( not ( = ?auto_21301 ?auto_21324 ) ) ( not ( = ?auto_21302 ?auto_21307 ) ) ( not ( = ?auto_21302 ?auto_21324 ) ) ( not ( = ?auto_21303 ?auto_21307 ) ) ( not ( = ?auto_21303 ?auto_21324 ) ) ( not ( = ?auto_21304 ?auto_21307 ) ) ( not ( = ?auto_21304 ?auto_21324 ) ) ( not ( = ?auto_21305 ?auto_21307 ) ) ( not ( = ?auto_21305 ?auto_21324 ) ) ( not ( = ?auto_21307 ?auto_21350 ) ) ( not ( = ?auto_21307 ?auto_21320 ) ) ( not ( = ?auto_21307 ?auto_21323 ) ) ( not ( = ?auto_21307 ?auto_21330 ) ) ( not ( = ?auto_21307 ?auto_21345 ) ) ( not ( = ?auto_21307 ?auto_21327 ) ) ( not ( = ?auto_21307 ?auto_21342 ) ) ( not ( = ?auto_21307 ?auto_21340 ) ) ( not ( = ?auto_21307 ?auto_21328 ) ) ( not ( = ?auto_21307 ?auto_21317 ) ) ( not ( = ?auto_21307 ?auto_21325 ) ) ( not ( = ?auto_21324 ?auto_21350 ) ) ( not ( = ?auto_21324 ?auto_21320 ) ) ( not ( = ?auto_21324 ?auto_21323 ) ) ( not ( = ?auto_21324 ?auto_21330 ) ) ( not ( = ?auto_21324 ?auto_21345 ) ) ( not ( = ?auto_21324 ?auto_21327 ) ) ( not ( = ?auto_21324 ?auto_21342 ) ) ( not ( = ?auto_21324 ?auto_21340 ) ) ( not ( = ?auto_21324 ?auto_21328 ) ) ( not ( = ?auto_21324 ?auto_21317 ) ) ( not ( = ?auto_21324 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21308 ) ) ( not ( = ?auto_21295 ?auto_21331 ) ) ( not ( = ?auto_21296 ?auto_21308 ) ) ( not ( = ?auto_21296 ?auto_21331 ) ) ( not ( = ?auto_21297 ?auto_21308 ) ) ( not ( = ?auto_21297 ?auto_21331 ) ) ( not ( = ?auto_21298 ?auto_21308 ) ) ( not ( = ?auto_21298 ?auto_21331 ) ) ( not ( = ?auto_21299 ?auto_21308 ) ) ( not ( = ?auto_21299 ?auto_21331 ) ) ( not ( = ?auto_21300 ?auto_21308 ) ) ( not ( = ?auto_21300 ?auto_21331 ) ) ( not ( = ?auto_21301 ?auto_21308 ) ) ( not ( = ?auto_21301 ?auto_21331 ) ) ( not ( = ?auto_21302 ?auto_21308 ) ) ( not ( = ?auto_21302 ?auto_21331 ) ) ( not ( = ?auto_21303 ?auto_21308 ) ) ( not ( = ?auto_21303 ?auto_21331 ) ) ( not ( = ?auto_21304 ?auto_21308 ) ) ( not ( = ?auto_21304 ?auto_21331 ) ) ( not ( = ?auto_21305 ?auto_21308 ) ) ( not ( = ?auto_21305 ?auto_21331 ) ) ( not ( = ?auto_21306 ?auto_21308 ) ) ( not ( = ?auto_21306 ?auto_21331 ) ) ( not ( = ?auto_21308 ?auto_21324 ) ) ( not ( = ?auto_21308 ?auto_21350 ) ) ( not ( = ?auto_21308 ?auto_21320 ) ) ( not ( = ?auto_21308 ?auto_21323 ) ) ( not ( = ?auto_21308 ?auto_21330 ) ) ( not ( = ?auto_21308 ?auto_21345 ) ) ( not ( = ?auto_21308 ?auto_21327 ) ) ( not ( = ?auto_21308 ?auto_21342 ) ) ( not ( = ?auto_21308 ?auto_21340 ) ) ( not ( = ?auto_21308 ?auto_21328 ) ) ( not ( = ?auto_21308 ?auto_21317 ) ) ( not ( = ?auto_21308 ?auto_21325 ) ) ( not ( = ?auto_21329 ?auto_21336 ) ) ( not ( = ?auto_21329 ?auto_21318 ) ) ( not ( = ?auto_21329 ?auto_21343 ) ) ( not ( = ?auto_21329 ?auto_21338 ) ) ( not ( = ?auto_21329 ?auto_21341 ) ) ( not ( = ?auto_21329 ?auto_21335 ) ) ( not ( = ?auto_21329 ?auto_21312 ) ) ( not ( = ?auto_21329 ?auto_21337 ) ) ( not ( = ?auto_21329 ?auto_21319 ) ) ( not ( = ?auto_21329 ?auto_21333 ) ) ( not ( = ?auto_21334 ?auto_21346 ) ) ( not ( = ?auto_21334 ?auto_21347 ) ) ( not ( = ?auto_21334 ?auto_21339 ) ) ( not ( = ?auto_21334 ?auto_21344 ) ) ( not ( = ?auto_21334 ?auto_21321 ) ) ( not ( = ?auto_21334 ?auto_21348 ) ) ( not ( = ?auto_21334 ?auto_21313 ) ) ( not ( = ?auto_21334 ?auto_21332 ) ) ( not ( = ?auto_21334 ?auto_21326 ) ) ( not ( = ?auto_21334 ?auto_21349 ) ) ( not ( = ?auto_21331 ?auto_21324 ) ) ( not ( = ?auto_21331 ?auto_21350 ) ) ( not ( = ?auto_21331 ?auto_21320 ) ) ( not ( = ?auto_21331 ?auto_21323 ) ) ( not ( = ?auto_21331 ?auto_21330 ) ) ( not ( = ?auto_21331 ?auto_21345 ) ) ( not ( = ?auto_21331 ?auto_21327 ) ) ( not ( = ?auto_21331 ?auto_21342 ) ) ( not ( = ?auto_21331 ?auto_21340 ) ) ( not ( = ?auto_21331 ?auto_21328 ) ) ( not ( = ?auto_21331 ?auto_21317 ) ) ( not ( = ?auto_21331 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21309 ) ) ( not ( = ?auto_21295 ?auto_21322 ) ) ( not ( = ?auto_21296 ?auto_21309 ) ) ( not ( = ?auto_21296 ?auto_21322 ) ) ( not ( = ?auto_21297 ?auto_21309 ) ) ( not ( = ?auto_21297 ?auto_21322 ) ) ( not ( = ?auto_21298 ?auto_21309 ) ) ( not ( = ?auto_21298 ?auto_21322 ) ) ( not ( = ?auto_21299 ?auto_21309 ) ) ( not ( = ?auto_21299 ?auto_21322 ) ) ( not ( = ?auto_21300 ?auto_21309 ) ) ( not ( = ?auto_21300 ?auto_21322 ) ) ( not ( = ?auto_21301 ?auto_21309 ) ) ( not ( = ?auto_21301 ?auto_21322 ) ) ( not ( = ?auto_21302 ?auto_21309 ) ) ( not ( = ?auto_21302 ?auto_21322 ) ) ( not ( = ?auto_21303 ?auto_21309 ) ) ( not ( = ?auto_21303 ?auto_21322 ) ) ( not ( = ?auto_21304 ?auto_21309 ) ) ( not ( = ?auto_21304 ?auto_21322 ) ) ( not ( = ?auto_21305 ?auto_21309 ) ) ( not ( = ?auto_21305 ?auto_21322 ) ) ( not ( = ?auto_21306 ?auto_21309 ) ) ( not ( = ?auto_21306 ?auto_21322 ) ) ( not ( = ?auto_21307 ?auto_21309 ) ) ( not ( = ?auto_21307 ?auto_21322 ) ) ( not ( = ?auto_21309 ?auto_21331 ) ) ( not ( = ?auto_21309 ?auto_21324 ) ) ( not ( = ?auto_21309 ?auto_21350 ) ) ( not ( = ?auto_21309 ?auto_21320 ) ) ( not ( = ?auto_21309 ?auto_21323 ) ) ( not ( = ?auto_21309 ?auto_21330 ) ) ( not ( = ?auto_21309 ?auto_21345 ) ) ( not ( = ?auto_21309 ?auto_21327 ) ) ( not ( = ?auto_21309 ?auto_21342 ) ) ( not ( = ?auto_21309 ?auto_21340 ) ) ( not ( = ?auto_21309 ?auto_21328 ) ) ( not ( = ?auto_21309 ?auto_21317 ) ) ( not ( = ?auto_21309 ?auto_21325 ) ) ( not ( = ?auto_21322 ?auto_21331 ) ) ( not ( = ?auto_21322 ?auto_21324 ) ) ( not ( = ?auto_21322 ?auto_21350 ) ) ( not ( = ?auto_21322 ?auto_21320 ) ) ( not ( = ?auto_21322 ?auto_21323 ) ) ( not ( = ?auto_21322 ?auto_21330 ) ) ( not ( = ?auto_21322 ?auto_21345 ) ) ( not ( = ?auto_21322 ?auto_21327 ) ) ( not ( = ?auto_21322 ?auto_21342 ) ) ( not ( = ?auto_21322 ?auto_21340 ) ) ( not ( = ?auto_21322 ?auto_21328 ) ) ( not ( = ?auto_21322 ?auto_21317 ) ) ( not ( = ?auto_21322 ?auto_21325 ) ) ( not ( = ?auto_21295 ?auto_21310 ) ) ( not ( = ?auto_21295 ?auto_21315 ) ) ( not ( = ?auto_21296 ?auto_21310 ) ) ( not ( = ?auto_21296 ?auto_21315 ) ) ( not ( = ?auto_21297 ?auto_21310 ) ) ( not ( = ?auto_21297 ?auto_21315 ) ) ( not ( = ?auto_21298 ?auto_21310 ) ) ( not ( = ?auto_21298 ?auto_21315 ) ) ( not ( = ?auto_21299 ?auto_21310 ) ) ( not ( = ?auto_21299 ?auto_21315 ) ) ( not ( = ?auto_21300 ?auto_21310 ) ) ( not ( = ?auto_21300 ?auto_21315 ) ) ( not ( = ?auto_21301 ?auto_21310 ) ) ( not ( = ?auto_21301 ?auto_21315 ) ) ( not ( = ?auto_21302 ?auto_21310 ) ) ( not ( = ?auto_21302 ?auto_21315 ) ) ( not ( = ?auto_21303 ?auto_21310 ) ) ( not ( = ?auto_21303 ?auto_21315 ) ) ( not ( = ?auto_21304 ?auto_21310 ) ) ( not ( = ?auto_21304 ?auto_21315 ) ) ( not ( = ?auto_21305 ?auto_21310 ) ) ( not ( = ?auto_21305 ?auto_21315 ) ) ( not ( = ?auto_21306 ?auto_21310 ) ) ( not ( = ?auto_21306 ?auto_21315 ) ) ( not ( = ?auto_21307 ?auto_21310 ) ) ( not ( = ?auto_21307 ?auto_21315 ) ) ( not ( = ?auto_21308 ?auto_21310 ) ) ( not ( = ?auto_21308 ?auto_21315 ) ) ( not ( = ?auto_21310 ?auto_21322 ) ) ( not ( = ?auto_21310 ?auto_21331 ) ) ( not ( = ?auto_21310 ?auto_21324 ) ) ( not ( = ?auto_21310 ?auto_21350 ) ) ( not ( = ?auto_21310 ?auto_21320 ) ) ( not ( = ?auto_21310 ?auto_21323 ) ) ( not ( = ?auto_21310 ?auto_21330 ) ) ( not ( = ?auto_21310 ?auto_21345 ) ) ( not ( = ?auto_21310 ?auto_21327 ) ) ( not ( = ?auto_21310 ?auto_21342 ) ) ( not ( = ?auto_21310 ?auto_21340 ) ) ( not ( = ?auto_21310 ?auto_21328 ) ) ( not ( = ?auto_21310 ?auto_21317 ) ) ( not ( = ?auto_21310 ?auto_21325 ) ) ( not ( = ?auto_21315 ?auto_21322 ) ) ( not ( = ?auto_21315 ?auto_21331 ) ) ( not ( = ?auto_21315 ?auto_21324 ) ) ( not ( = ?auto_21315 ?auto_21350 ) ) ( not ( = ?auto_21315 ?auto_21320 ) ) ( not ( = ?auto_21315 ?auto_21323 ) ) ( not ( = ?auto_21315 ?auto_21330 ) ) ( not ( = ?auto_21315 ?auto_21345 ) ) ( not ( = ?auto_21315 ?auto_21327 ) ) ( not ( = ?auto_21315 ?auto_21342 ) ) ( not ( = ?auto_21315 ?auto_21340 ) ) ( not ( = ?auto_21315 ?auto_21328 ) ) ( not ( = ?auto_21315 ?auto_21317 ) ) ( not ( = ?auto_21315 ?auto_21325 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_21295 ?auto_21296 ?auto_21297 ?auto_21298 ?auto_21299 ?auto_21300 ?auto_21301 ?auto_21302 ?auto_21303 ?auto_21304 ?auto_21305 ?auto_21306 ?auto_21307 ?auto_21308 ?auto_21309 )
      ( MAKE-1CRATE ?auto_21309 ?auto_21310 )
      ( MAKE-15CRATE-VERIFY ?auto_21295 ?auto_21296 ?auto_21297 ?auto_21298 ?auto_21299 ?auto_21300 ?auto_21301 ?auto_21302 ?auto_21303 ?auto_21304 ?auto_21305 ?auto_21306 ?auto_21307 ?auto_21308 ?auto_21309 ?auto_21310 ) )
  )

)
