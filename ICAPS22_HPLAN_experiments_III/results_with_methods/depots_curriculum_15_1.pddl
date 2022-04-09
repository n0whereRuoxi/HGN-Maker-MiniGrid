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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20572 - SURFACE
      ?auto_20573 - SURFACE
    )
    :vars
    (
      ?auto_20574 - HOIST
      ?auto_20575 - PLACE
      ?auto_20577 - PLACE
      ?auto_20578 - HOIST
      ?auto_20579 - SURFACE
      ?auto_20576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20574 ?auto_20575 ) ( SURFACE-AT ?auto_20572 ?auto_20575 ) ( CLEAR ?auto_20572 ) ( IS-CRATE ?auto_20573 ) ( AVAILABLE ?auto_20574 ) ( not ( = ?auto_20577 ?auto_20575 ) ) ( HOIST-AT ?auto_20578 ?auto_20577 ) ( AVAILABLE ?auto_20578 ) ( SURFACE-AT ?auto_20573 ?auto_20577 ) ( ON ?auto_20573 ?auto_20579 ) ( CLEAR ?auto_20573 ) ( TRUCK-AT ?auto_20576 ?auto_20575 ) ( not ( = ?auto_20572 ?auto_20573 ) ) ( not ( = ?auto_20572 ?auto_20579 ) ) ( not ( = ?auto_20573 ?auto_20579 ) ) ( not ( = ?auto_20574 ?auto_20578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20576 ?auto_20575 ?auto_20577 )
      ( !LIFT ?auto_20578 ?auto_20573 ?auto_20579 ?auto_20577 )
      ( !LOAD ?auto_20578 ?auto_20573 ?auto_20576 ?auto_20577 )
      ( !DRIVE ?auto_20576 ?auto_20577 ?auto_20575 )
      ( !UNLOAD ?auto_20574 ?auto_20573 ?auto_20576 ?auto_20575 )
      ( !DROP ?auto_20574 ?auto_20573 ?auto_20572 ?auto_20575 )
      ( MAKE-1CRATE-VERIFY ?auto_20572 ?auto_20573 ) )
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
      ?auto_20586 - HOIST
      ?auto_20587 - PLACE
      ?auto_20591 - PLACE
      ?auto_20589 - HOIST
      ?auto_20590 - SURFACE
      ?auto_20592 - PLACE
      ?auto_20594 - HOIST
      ?auto_20593 - SURFACE
      ?auto_20588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20586 ?auto_20587 ) ( IS-CRATE ?auto_20585 ) ( not ( = ?auto_20591 ?auto_20587 ) ) ( HOIST-AT ?auto_20589 ?auto_20591 ) ( AVAILABLE ?auto_20589 ) ( SURFACE-AT ?auto_20585 ?auto_20591 ) ( ON ?auto_20585 ?auto_20590 ) ( CLEAR ?auto_20585 ) ( not ( = ?auto_20584 ?auto_20585 ) ) ( not ( = ?auto_20584 ?auto_20590 ) ) ( not ( = ?auto_20585 ?auto_20590 ) ) ( not ( = ?auto_20586 ?auto_20589 ) ) ( SURFACE-AT ?auto_20583 ?auto_20587 ) ( CLEAR ?auto_20583 ) ( IS-CRATE ?auto_20584 ) ( AVAILABLE ?auto_20586 ) ( not ( = ?auto_20592 ?auto_20587 ) ) ( HOIST-AT ?auto_20594 ?auto_20592 ) ( AVAILABLE ?auto_20594 ) ( SURFACE-AT ?auto_20584 ?auto_20592 ) ( ON ?auto_20584 ?auto_20593 ) ( CLEAR ?auto_20584 ) ( TRUCK-AT ?auto_20588 ?auto_20587 ) ( not ( = ?auto_20583 ?auto_20584 ) ) ( not ( = ?auto_20583 ?auto_20593 ) ) ( not ( = ?auto_20584 ?auto_20593 ) ) ( not ( = ?auto_20586 ?auto_20594 ) ) ( not ( = ?auto_20583 ?auto_20585 ) ) ( not ( = ?auto_20583 ?auto_20590 ) ) ( not ( = ?auto_20585 ?auto_20593 ) ) ( not ( = ?auto_20591 ?auto_20592 ) ) ( not ( = ?auto_20589 ?auto_20594 ) ) ( not ( = ?auto_20590 ?auto_20593 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20583 ?auto_20584 )
      ( MAKE-1CRATE ?auto_20584 ?auto_20585 )
      ( MAKE-2CRATE-VERIFY ?auto_20583 ?auto_20584 ?auto_20585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20597 - SURFACE
      ?auto_20598 - SURFACE
    )
    :vars
    (
      ?auto_20599 - HOIST
      ?auto_20600 - PLACE
      ?auto_20602 - PLACE
      ?auto_20603 - HOIST
      ?auto_20604 - SURFACE
      ?auto_20601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20599 ?auto_20600 ) ( SURFACE-AT ?auto_20597 ?auto_20600 ) ( CLEAR ?auto_20597 ) ( IS-CRATE ?auto_20598 ) ( AVAILABLE ?auto_20599 ) ( not ( = ?auto_20602 ?auto_20600 ) ) ( HOIST-AT ?auto_20603 ?auto_20602 ) ( AVAILABLE ?auto_20603 ) ( SURFACE-AT ?auto_20598 ?auto_20602 ) ( ON ?auto_20598 ?auto_20604 ) ( CLEAR ?auto_20598 ) ( TRUCK-AT ?auto_20601 ?auto_20600 ) ( not ( = ?auto_20597 ?auto_20598 ) ) ( not ( = ?auto_20597 ?auto_20604 ) ) ( not ( = ?auto_20598 ?auto_20604 ) ) ( not ( = ?auto_20599 ?auto_20603 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20601 ?auto_20600 ?auto_20602 )
      ( !LIFT ?auto_20603 ?auto_20598 ?auto_20604 ?auto_20602 )
      ( !LOAD ?auto_20603 ?auto_20598 ?auto_20601 ?auto_20602 )
      ( !DRIVE ?auto_20601 ?auto_20602 ?auto_20600 )
      ( !UNLOAD ?auto_20599 ?auto_20598 ?auto_20601 ?auto_20600 )
      ( !DROP ?auto_20599 ?auto_20598 ?auto_20597 ?auto_20600 )
      ( MAKE-1CRATE-VERIFY ?auto_20597 ?auto_20598 ) )
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
      ?auto_20613 - HOIST
      ?auto_20614 - PLACE
      ?auto_20615 - PLACE
      ?auto_20618 - HOIST
      ?auto_20616 - SURFACE
      ?auto_20624 - PLACE
      ?auto_20623 - HOIST
      ?auto_20621 - SURFACE
      ?auto_20622 - PLACE
      ?auto_20619 - HOIST
      ?auto_20620 - SURFACE
      ?auto_20617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20613 ?auto_20614 ) ( IS-CRATE ?auto_20612 ) ( not ( = ?auto_20615 ?auto_20614 ) ) ( HOIST-AT ?auto_20618 ?auto_20615 ) ( AVAILABLE ?auto_20618 ) ( SURFACE-AT ?auto_20612 ?auto_20615 ) ( ON ?auto_20612 ?auto_20616 ) ( CLEAR ?auto_20612 ) ( not ( = ?auto_20611 ?auto_20612 ) ) ( not ( = ?auto_20611 ?auto_20616 ) ) ( not ( = ?auto_20612 ?auto_20616 ) ) ( not ( = ?auto_20613 ?auto_20618 ) ) ( IS-CRATE ?auto_20611 ) ( not ( = ?auto_20624 ?auto_20614 ) ) ( HOIST-AT ?auto_20623 ?auto_20624 ) ( AVAILABLE ?auto_20623 ) ( SURFACE-AT ?auto_20611 ?auto_20624 ) ( ON ?auto_20611 ?auto_20621 ) ( CLEAR ?auto_20611 ) ( not ( = ?auto_20610 ?auto_20611 ) ) ( not ( = ?auto_20610 ?auto_20621 ) ) ( not ( = ?auto_20611 ?auto_20621 ) ) ( not ( = ?auto_20613 ?auto_20623 ) ) ( SURFACE-AT ?auto_20609 ?auto_20614 ) ( CLEAR ?auto_20609 ) ( IS-CRATE ?auto_20610 ) ( AVAILABLE ?auto_20613 ) ( not ( = ?auto_20622 ?auto_20614 ) ) ( HOIST-AT ?auto_20619 ?auto_20622 ) ( AVAILABLE ?auto_20619 ) ( SURFACE-AT ?auto_20610 ?auto_20622 ) ( ON ?auto_20610 ?auto_20620 ) ( CLEAR ?auto_20610 ) ( TRUCK-AT ?auto_20617 ?auto_20614 ) ( not ( = ?auto_20609 ?auto_20610 ) ) ( not ( = ?auto_20609 ?auto_20620 ) ) ( not ( = ?auto_20610 ?auto_20620 ) ) ( not ( = ?auto_20613 ?auto_20619 ) ) ( not ( = ?auto_20609 ?auto_20611 ) ) ( not ( = ?auto_20609 ?auto_20621 ) ) ( not ( = ?auto_20611 ?auto_20620 ) ) ( not ( = ?auto_20624 ?auto_20622 ) ) ( not ( = ?auto_20623 ?auto_20619 ) ) ( not ( = ?auto_20621 ?auto_20620 ) ) ( not ( = ?auto_20609 ?auto_20612 ) ) ( not ( = ?auto_20609 ?auto_20616 ) ) ( not ( = ?auto_20610 ?auto_20612 ) ) ( not ( = ?auto_20610 ?auto_20616 ) ) ( not ( = ?auto_20612 ?auto_20621 ) ) ( not ( = ?auto_20612 ?auto_20620 ) ) ( not ( = ?auto_20615 ?auto_20624 ) ) ( not ( = ?auto_20615 ?auto_20622 ) ) ( not ( = ?auto_20618 ?auto_20623 ) ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20616 ?auto_20621 ) ) ( not ( = ?auto_20616 ?auto_20620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20609 ?auto_20610 ?auto_20611 )
      ( MAKE-1CRATE ?auto_20611 ?auto_20612 )
      ( MAKE-3CRATE-VERIFY ?auto_20609 ?auto_20610 ?auto_20611 ?auto_20612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20627 - SURFACE
      ?auto_20628 - SURFACE
    )
    :vars
    (
      ?auto_20629 - HOIST
      ?auto_20630 - PLACE
      ?auto_20632 - PLACE
      ?auto_20633 - HOIST
      ?auto_20634 - SURFACE
      ?auto_20631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20629 ?auto_20630 ) ( SURFACE-AT ?auto_20627 ?auto_20630 ) ( CLEAR ?auto_20627 ) ( IS-CRATE ?auto_20628 ) ( AVAILABLE ?auto_20629 ) ( not ( = ?auto_20632 ?auto_20630 ) ) ( HOIST-AT ?auto_20633 ?auto_20632 ) ( AVAILABLE ?auto_20633 ) ( SURFACE-AT ?auto_20628 ?auto_20632 ) ( ON ?auto_20628 ?auto_20634 ) ( CLEAR ?auto_20628 ) ( TRUCK-AT ?auto_20631 ?auto_20630 ) ( not ( = ?auto_20627 ?auto_20628 ) ) ( not ( = ?auto_20627 ?auto_20634 ) ) ( not ( = ?auto_20628 ?auto_20634 ) ) ( not ( = ?auto_20629 ?auto_20633 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20631 ?auto_20630 ?auto_20632 )
      ( !LIFT ?auto_20633 ?auto_20628 ?auto_20634 ?auto_20632 )
      ( !LOAD ?auto_20633 ?auto_20628 ?auto_20631 ?auto_20632 )
      ( !DRIVE ?auto_20631 ?auto_20632 ?auto_20630 )
      ( !UNLOAD ?auto_20629 ?auto_20628 ?auto_20631 ?auto_20630 )
      ( !DROP ?auto_20629 ?auto_20628 ?auto_20627 ?auto_20630 )
      ( MAKE-1CRATE-VERIFY ?auto_20627 ?auto_20628 ) )
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
      ?auto_20647 - HOIST
      ?auto_20650 - PLACE
      ?auto_20646 - PLACE
      ?auto_20649 - HOIST
      ?auto_20645 - SURFACE
      ?auto_20657 - PLACE
      ?auto_20653 - HOIST
      ?auto_20652 - SURFACE
      ?auto_20658 - PLACE
      ?auto_20659 - HOIST
      ?auto_20656 - SURFACE
      ?auto_20651 - PLACE
      ?auto_20654 - HOIST
      ?auto_20655 - SURFACE
      ?auto_20648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20647 ?auto_20650 ) ( IS-CRATE ?auto_20644 ) ( not ( = ?auto_20646 ?auto_20650 ) ) ( HOIST-AT ?auto_20649 ?auto_20646 ) ( AVAILABLE ?auto_20649 ) ( SURFACE-AT ?auto_20644 ?auto_20646 ) ( ON ?auto_20644 ?auto_20645 ) ( CLEAR ?auto_20644 ) ( not ( = ?auto_20643 ?auto_20644 ) ) ( not ( = ?auto_20643 ?auto_20645 ) ) ( not ( = ?auto_20644 ?auto_20645 ) ) ( not ( = ?auto_20647 ?auto_20649 ) ) ( IS-CRATE ?auto_20643 ) ( not ( = ?auto_20657 ?auto_20650 ) ) ( HOIST-AT ?auto_20653 ?auto_20657 ) ( AVAILABLE ?auto_20653 ) ( SURFACE-AT ?auto_20643 ?auto_20657 ) ( ON ?auto_20643 ?auto_20652 ) ( CLEAR ?auto_20643 ) ( not ( = ?auto_20642 ?auto_20643 ) ) ( not ( = ?auto_20642 ?auto_20652 ) ) ( not ( = ?auto_20643 ?auto_20652 ) ) ( not ( = ?auto_20647 ?auto_20653 ) ) ( IS-CRATE ?auto_20642 ) ( not ( = ?auto_20658 ?auto_20650 ) ) ( HOIST-AT ?auto_20659 ?auto_20658 ) ( AVAILABLE ?auto_20659 ) ( SURFACE-AT ?auto_20642 ?auto_20658 ) ( ON ?auto_20642 ?auto_20656 ) ( CLEAR ?auto_20642 ) ( not ( = ?auto_20641 ?auto_20642 ) ) ( not ( = ?auto_20641 ?auto_20656 ) ) ( not ( = ?auto_20642 ?auto_20656 ) ) ( not ( = ?auto_20647 ?auto_20659 ) ) ( SURFACE-AT ?auto_20640 ?auto_20650 ) ( CLEAR ?auto_20640 ) ( IS-CRATE ?auto_20641 ) ( AVAILABLE ?auto_20647 ) ( not ( = ?auto_20651 ?auto_20650 ) ) ( HOIST-AT ?auto_20654 ?auto_20651 ) ( AVAILABLE ?auto_20654 ) ( SURFACE-AT ?auto_20641 ?auto_20651 ) ( ON ?auto_20641 ?auto_20655 ) ( CLEAR ?auto_20641 ) ( TRUCK-AT ?auto_20648 ?auto_20650 ) ( not ( = ?auto_20640 ?auto_20641 ) ) ( not ( = ?auto_20640 ?auto_20655 ) ) ( not ( = ?auto_20641 ?auto_20655 ) ) ( not ( = ?auto_20647 ?auto_20654 ) ) ( not ( = ?auto_20640 ?auto_20642 ) ) ( not ( = ?auto_20640 ?auto_20656 ) ) ( not ( = ?auto_20642 ?auto_20655 ) ) ( not ( = ?auto_20658 ?auto_20651 ) ) ( not ( = ?auto_20659 ?auto_20654 ) ) ( not ( = ?auto_20656 ?auto_20655 ) ) ( not ( = ?auto_20640 ?auto_20643 ) ) ( not ( = ?auto_20640 ?auto_20652 ) ) ( not ( = ?auto_20641 ?auto_20643 ) ) ( not ( = ?auto_20641 ?auto_20652 ) ) ( not ( = ?auto_20643 ?auto_20656 ) ) ( not ( = ?auto_20643 ?auto_20655 ) ) ( not ( = ?auto_20657 ?auto_20658 ) ) ( not ( = ?auto_20657 ?auto_20651 ) ) ( not ( = ?auto_20653 ?auto_20659 ) ) ( not ( = ?auto_20653 ?auto_20654 ) ) ( not ( = ?auto_20652 ?auto_20656 ) ) ( not ( = ?auto_20652 ?auto_20655 ) ) ( not ( = ?auto_20640 ?auto_20644 ) ) ( not ( = ?auto_20640 ?auto_20645 ) ) ( not ( = ?auto_20641 ?auto_20644 ) ) ( not ( = ?auto_20641 ?auto_20645 ) ) ( not ( = ?auto_20642 ?auto_20644 ) ) ( not ( = ?auto_20642 ?auto_20645 ) ) ( not ( = ?auto_20644 ?auto_20652 ) ) ( not ( = ?auto_20644 ?auto_20656 ) ) ( not ( = ?auto_20644 ?auto_20655 ) ) ( not ( = ?auto_20646 ?auto_20657 ) ) ( not ( = ?auto_20646 ?auto_20658 ) ) ( not ( = ?auto_20646 ?auto_20651 ) ) ( not ( = ?auto_20649 ?auto_20653 ) ) ( not ( = ?auto_20649 ?auto_20659 ) ) ( not ( = ?auto_20649 ?auto_20654 ) ) ( not ( = ?auto_20645 ?auto_20652 ) ) ( not ( = ?auto_20645 ?auto_20656 ) ) ( not ( = ?auto_20645 ?auto_20655 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_20640 ?auto_20641 ?auto_20642 ?auto_20643 )
      ( MAKE-1CRATE ?auto_20643 ?auto_20644 )
      ( MAKE-4CRATE-VERIFY ?auto_20640 ?auto_20641 ?auto_20642 ?auto_20643 ?auto_20644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20662 - SURFACE
      ?auto_20663 - SURFACE
    )
    :vars
    (
      ?auto_20664 - HOIST
      ?auto_20665 - PLACE
      ?auto_20667 - PLACE
      ?auto_20668 - HOIST
      ?auto_20669 - SURFACE
      ?auto_20666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20664 ?auto_20665 ) ( SURFACE-AT ?auto_20662 ?auto_20665 ) ( CLEAR ?auto_20662 ) ( IS-CRATE ?auto_20663 ) ( AVAILABLE ?auto_20664 ) ( not ( = ?auto_20667 ?auto_20665 ) ) ( HOIST-AT ?auto_20668 ?auto_20667 ) ( AVAILABLE ?auto_20668 ) ( SURFACE-AT ?auto_20663 ?auto_20667 ) ( ON ?auto_20663 ?auto_20669 ) ( CLEAR ?auto_20663 ) ( TRUCK-AT ?auto_20666 ?auto_20665 ) ( not ( = ?auto_20662 ?auto_20663 ) ) ( not ( = ?auto_20662 ?auto_20669 ) ) ( not ( = ?auto_20663 ?auto_20669 ) ) ( not ( = ?auto_20664 ?auto_20668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20666 ?auto_20665 ?auto_20667 )
      ( !LIFT ?auto_20668 ?auto_20663 ?auto_20669 ?auto_20667 )
      ( !LOAD ?auto_20668 ?auto_20663 ?auto_20666 ?auto_20667 )
      ( !DRIVE ?auto_20666 ?auto_20667 ?auto_20665 )
      ( !UNLOAD ?auto_20664 ?auto_20663 ?auto_20666 ?auto_20665 )
      ( !DROP ?auto_20664 ?auto_20663 ?auto_20662 ?auto_20665 )
      ( MAKE-1CRATE-VERIFY ?auto_20662 ?auto_20663 ) )
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
      ?auto_20683 - HOIST
      ?auto_20686 - PLACE
      ?auto_20685 - PLACE
      ?auto_20684 - HOIST
      ?auto_20687 - SURFACE
      ?auto_20698 - PLACE
      ?auto_20688 - HOIST
      ?auto_20692 - SURFACE
      ?auto_20695 - PLACE
      ?auto_20699 - HOIST
      ?auto_20691 - SURFACE
      ?auto_20694 - PLACE
      ?auto_20697 - HOIST
      ?auto_20696 - SURFACE
      ?auto_20693 - PLACE
      ?auto_20690 - HOIST
      ?auto_20689 - SURFACE
      ?auto_20682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20683 ?auto_20686 ) ( IS-CRATE ?auto_20681 ) ( not ( = ?auto_20685 ?auto_20686 ) ) ( HOIST-AT ?auto_20684 ?auto_20685 ) ( AVAILABLE ?auto_20684 ) ( SURFACE-AT ?auto_20681 ?auto_20685 ) ( ON ?auto_20681 ?auto_20687 ) ( CLEAR ?auto_20681 ) ( not ( = ?auto_20680 ?auto_20681 ) ) ( not ( = ?auto_20680 ?auto_20687 ) ) ( not ( = ?auto_20681 ?auto_20687 ) ) ( not ( = ?auto_20683 ?auto_20684 ) ) ( IS-CRATE ?auto_20680 ) ( not ( = ?auto_20698 ?auto_20686 ) ) ( HOIST-AT ?auto_20688 ?auto_20698 ) ( AVAILABLE ?auto_20688 ) ( SURFACE-AT ?auto_20680 ?auto_20698 ) ( ON ?auto_20680 ?auto_20692 ) ( CLEAR ?auto_20680 ) ( not ( = ?auto_20679 ?auto_20680 ) ) ( not ( = ?auto_20679 ?auto_20692 ) ) ( not ( = ?auto_20680 ?auto_20692 ) ) ( not ( = ?auto_20683 ?auto_20688 ) ) ( IS-CRATE ?auto_20679 ) ( not ( = ?auto_20695 ?auto_20686 ) ) ( HOIST-AT ?auto_20699 ?auto_20695 ) ( AVAILABLE ?auto_20699 ) ( SURFACE-AT ?auto_20679 ?auto_20695 ) ( ON ?auto_20679 ?auto_20691 ) ( CLEAR ?auto_20679 ) ( not ( = ?auto_20678 ?auto_20679 ) ) ( not ( = ?auto_20678 ?auto_20691 ) ) ( not ( = ?auto_20679 ?auto_20691 ) ) ( not ( = ?auto_20683 ?auto_20699 ) ) ( IS-CRATE ?auto_20678 ) ( not ( = ?auto_20694 ?auto_20686 ) ) ( HOIST-AT ?auto_20697 ?auto_20694 ) ( AVAILABLE ?auto_20697 ) ( SURFACE-AT ?auto_20678 ?auto_20694 ) ( ON ?auto_20678 ?auto_20696 ) ( CLEAR ?auto_20678 ) ( not ( = ?auto_20677 ?auto_20678 ) ) ( not ( = ?auto_20677 ?auto_20696 ) ) ( not ( = ?auto_20678 ?auto_20696 ) ) ( not ( = ?auto_20683 ?auto_20697 ) ) ( SURFACE-AT ?auto_20676 ?auto_20686 ) ( CLEAR ?auto_20676 ) ( IS-CRATE ?auto_20677 ) ( AVAILABLE ?auto_20683 ) ( not ( = ?auto_20693 ?auto_20686 ) ) ( HOIST-AT ?auto_20690 ?auto_20693 ) ( AVAILABLE ?auto_20690 ) ( SURFACE-AT ?auto_20677 ?auto_20693 ) ( ON ?auto_20677 ?auto_20689 ) ( CLEAR ?auto_20677 ) ( TRUCK-AT ?auto_20682 ?auto_20686 ) ( not ( = ?auto_20676 ?auto_20677 ) ) ( not ( = ?auto_20676 ?auto_20689 ) ) ( not ( = ?auto_20677 ?auto_20689 ) ) ( not ( = ?auto_20683 ?auto_20690 ) ) ( not ( = ?auto_20676 ?auto_20678 ) ) ( not ( = ?auto_20676 ?auto_20696 ) ) ( not ( = ?auto_20678 ?auto_20689 ) ) ( not ( = ?auto_20694 ?auto_20693 ) ) ( not ( = ?auto_20697 ?auto_20690 ) ) ( not ( = ?auto_20696 ?auto_20689 ) ) ( not ( = ?auto_20676 ?auto_20679 ) ) ( not ( = ?auto_20676 ?auto_20691 ) ) ( not ( = ?auto_20677 ?auto_20679 ) ) ( not ( = ?auto_20677 ?auto_20691 ) ) ( not ( = ?auto_20679 ?auto_20696 ) ) ( not ( = ?auto_20679 ?auto_20689 ) ) ( not ( = ?auto_20695 ?auto_20694 ) ) ( not ( = ?auto_20695 ?auto_20693 ) ) ( not ( = ?auto_20699 ?auto_20697 ) ) ( not ( = ?auto_20699 ?auto_20690 ) ) ( not ( = ?auto_20691 ?auto_20696 ) ) ( not ( = ?auto_20691 ?auto_20689 ) ) ( not ( = ?auto_20676 ?auto_20680 ) ) ( not ( = ?auto_20676 ?auto_20692 ) ) ( not ( = ?auto_20677 ?auto_20680 ) ) ( not ( = ?auto_20677 ?auto_20692 ) ) ( not ( = ?auto_20678 ?auto_20680 ) ) ( not ( = ?auto_20678 ?auto_20692 ) ) ( not ( = ?auto_20680 ?auto_20691 ) ) ( not ( = ?auto_20680 ?auto_20696 ) ) ( not ( = ?auto_20680 ?auto_20689 ) ) ( not ( = ?auto_20698 ?auto_20695 ) ) ( not ( = ?auto_20698 ?auto_20694 ) ) ( not ( = ?auto_20698 ?auto_20693 ) ) ( not ( = ?auto_20688 ?auto_20699 ) ) ( not ( = ?auto_20688 ?auto_20697 ) ) ( not ( = ?auto_20688 ?auto_20690 ) ) ( not ( = ?auto_20692 ?auto_20691 ) ) ( not ( = ?auto_20692 ?auto_20696 ) ) ( not ( = ?auto_20692 ?auto_20689 ) ) ( not ( = ?auto_20676 ?auto_20681 ) ) ( not ( = ?auto_20676 ?auto_20687 ) ) ( not ( = ?auto_20677 ?auto_20681 ) ) ( not ( = ?auto_20677 ?auto_20687 ) ) ( not ( = ?auto_20678 ?auto_20681 ) ) ( not ( = ?auto_20678 ?auto_20687 ) ) ( not ( = ?auto_20679 ?auto_20681 ) ) ( not ( = ?auto_20679 ?auto_20687 ) ) ( not ( = ?auto_20681 ?auto_20692 ) ) ( not ( = ?auto_20681 ?auto_20691 ) ) ( not ( = ?auto_20681 ?auto_20696 ) ) ( not ( = ?auto_20681 ?auto_20689 ) ) ( not ( = ?auto_20685 ?auto_20698 ) ) ( not ( = ?auto_20685 ?auto_20695 ) ) ( not ( = ?auto_20685 ?auto_20694 ) ) ( not ( = ?auto_20685 ?auto_20693 ) ) ( not ( = ?auto_20684 ?auto_20688 ) ) ( not ( = ?auto_20684 ?auto_20699 ) ) ( not ( = ?auto_20684 ?auto_20697 ) ) ( not ( = ?auto_20684 ?auto_20690 ) ) ( not ( = ?auto_20687 ?auto_20692 ) ) ( not ( = ?auto_20687 ?auto_20691 ) ) ( not ( = ?auto_20687 ?auto_20696 ) ) ( not ( = ?auto_20687 ?auto_20689 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_20676 ?auto_20677 ?auto_20678 ?auto_20679 ?auto_20680 )
      ( MAKE-1CRATE ?auto_20680 ?auto_20681 )
      ( MAKE-5CRATE-VERIFY ?auto_20676 ?auto_20677 ?auto_20678 ?auto_20679 ?auto_20680 ?auto_20681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20702 - SURFACE
      ?auto_20703 - SURFACE
    )
    :vars
    (
      ?auto_20704 - HOIST
      ?auto_20705 - PLACE
      ?auto_20707 - PLACE
      ?auto_20708 - HOIST
      ?auto_20709 - SURFACE
      ?auto_20706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20704 ?auto_20705 ) ( SURFACE-AT ?auto_20702 ?auto_20705 ) ( CLEAR ?auto_20702 ) ( IS-CRATE ?auto_20703 ) ( AVAILABLE ?auto_20704 ) ( not ( = ?auto_20707 ?auto_20705 ) ) ( HOIST-AT ?auto_20708 ?auto_20707 ) ( AVAILABLE ?auto_20708 ) ( SURFACE-AT ?auto_20703 ?auto_20707 ) ( ON ?auto_20703 ?auto_20709 ) ( CLEAR ?auto_20703 ) ( TRUCK-AT ?auto_20706 ?auto_20705 ) ( not ( = ?auto_20702 ?auto_20703 ) ) ( not ( = ?auto_20702 ?auto_20709 ) ) ( not ( = ?auto_20703 ?auto_20709 ) ) ( not ( = ?auto_20704 ?auto_20708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20706 ?auto_20705 ?auto_20707 )
      ( !LIFT ?auto_20708 ?auto_20703 ?auto_20709 ?auto_20707 )
      ( !LOAD ?auto_20708 ?auto_20703 ?auto_20706 ?auto_20707 )
      ( !DRIVE ?auto_20706 ?auto_20707 ?auto_20705 )
      ( !UNLOAD ?auto_20704 ?auto_20703 ?auto_20706 ?auto_20705 )
      ( !DROP ?auto_20704 ?auto_20703 ?auto_20702 ?auto_20705 )
      ( MAKE-1CRATE-VERIFY ?auto_20702 ?auto_20703 ) )
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
      ?auto_20727 - HOIST
      ?auto_20729 - PLACE
      ?auto_20728 - PLACE
      ?auto_20726 - HOIST
      ?auto_20725 - SURFACE
      ?auto_20735 - PLACE
      ?auto_20742 - HOIST
      ?auto_20736 - SURFACE
      ?auto_20741 - PLACE
      ?auto_20740 - HOIST
      ?auto_20731 - SURFACE
      ?auto_20739 - PLACE
      ?auto_20743 - HOIST
      ?auto_20733 - SURFACE
      ?auto_20738 - PLACE
      ?auto_20744 - HOIST
      ?auto_20737 - SURFACE
      ?auto_20730 - PLACE
      ?auto_20732 - HOIST
      ?auto_20734 - SURFACE
      ?auto_20724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20727 ?auto_20729 ) ( IS-CRATE ?auto_20723 ) ( not ( = ?auto_20728 ?auto_20729 ) ) ( HOIST-AT ?auto_20726 ?auto_20728 ) ( AVAILABLE ?auto_20726 ) ( SURFACE-AT ?auto_20723 ?auto_20728 ) ( ON ?auto_20723 ?auto_20725 ) ( CLEAR ?auto_20723 ) ( not ( = ?auto_20722 ?auto_20723 ) ) ( not ( = ?auto_20722 ?auto_20725 ) ) ( not ( = ?auto_20723 ?auto_20725 ) ) ( not ( = ?auto_20727 ?auto_20726 ) ) ( IS-CRATE ?auto_20722 ) ( not ( = ?auto_20735 ?auto_20729 ) ) ( HOIST-AT ?auto_20742 ?auto_20735 ) ( AVAILABLE ?auto_20742 ) ( SURFACE-AT ?auto_20722 ?auto_20735 ) ( ON ?auto_20722 ?auto_20736 ) ( CLEAR ?auto_20722 ) ( not ( = ?auto_20721 ?auto_20722 ) ) ( not ( = ?auto_20721 ?auto_20736 ) ) ( not ( = ?auto_20722 ?auto_20736 ) ) ( not ( = ?auto_20727 ?auto_20742 ) ) ( IS-CRATE ?auto_20721 ) ( not ( = ?auto_20741 ?auto_20729 ) ) ( HOIST-AT ?auto_20740 ?auto_20741 ) ( AVAILABLE ?auto_20740 ) ( SURFACE-AT ?auto_20721 ?auto_20741 ) ( ON ?auto_20721 ?auto_20731 ) ( CLEAR ?auto_20721 ) ( not ( = ?auto_20720 ?auto_20721 ) ) ( not ( = ?auto_20720 ?auto_20731 ) ) ( not ( = ?auto_20721 ?auto_20731 ) ) ( not ( = ?auto_20727 ?auto_20740 ) ) ( IS-CRATE ?auto_20720 ) ( not ( = ?auto_20739 ?auto_20729 ) ) ( HOIST-AT ?auto_20743 ?auto_20739 ) ( AVAILABLE ?auto_20743 ) ( SURFACE-AT ?auto_20720 ?auto_20739 ) ( ON ?auto_20720 ?auto_20733 ) ( CLEAR ?auto_20720 ) ( not ( = ?auto_20719 ?auto_20720 ) ) ( not ( = ?auto_20719 ?auto_20733 ) ) ( not ( = ?auto_20720 ?auto_20733 ) ) ( not ( = ?auto_20727 ?auto_20743 ) ) ( IS-CRATE ?auto_20719 ) ( not ( = ?auto_20738 ?auto_20729 ) ) ( HOIST-AT ?auto_20744 ?auto_20738 ) ( AVAILABLE ?auto_20744 ) ( SURFACE-AT ?auto_20719 ?auto_20738 ) ( ON ?auto_20719 ?auto_20737 ) ( CLEAR ?auto_20719 ) ( not ( = ?auto_20718 ?auto_20719 ) ) ( not ( = ?auto_20718 ?auto_20737 ) ) ( not ( = ?auto_20719 ?auto_20737 ) ) ( not ( = ?auto_20727 ?auto_20744 ) ) ( SURFACE-AT ?auto_20717 ?auto_20729 ) ( CLEAR ?auto_20717 ) ( IS-CRATE ?auto_20718 ) ( AVAILABLE ?auto_20727 ) ( not ( = ?auto_20730 ?auto_20729 ) ) ( HOIST-AT ?auto_20732 ?auto_20730 ) ( AVAILABLE ?auto_20732 ) ( SURFACE-AT ?auto_20718 ?auto_20730 ) ( ON ?auto_20718 ?auto_20734 ) ( CLEAR ?auto_20718 ) ( TRUCK-AT ?auto_20724 ?auto_20729 ) ( not ( = ?auto_20717 ?auto_20718 ) ) ( not ( = ?auto_20717 ?auto_20734 ) ) ( not ( = ?auto_20718 ?auto_20734 ) ) ( not ( = ?auto_20727 ?auto_20732 ) ) ( not ( = ?auto_20717 ?auto_20719 ) ) ( not ( = ?auto_20717 ?auto_20737 ) ) ( not ( = ?auto_20719 ?auto_20734 ) ) ( not ( = ?auto_20738 ?auto_20730 ) ) ( not ( = ?auto_20744 ?auto_20732 ) ) ( not ( = ?auto_20737 ?auto_20734 ) ) ( not ( = ?auto_20717 ?auto_20720 ) ) ( not ( = ?auto_20717 ?auto_20733 ) ) ( not ( = ?auto_20718 ?auto_20720 ) ) ( not ( = ?auto_20718 ?auto_20733 ) ) ( not ( = ?auto_20720 ?auto_20737 ) ) ( not ( = ?auto_20720 ?auto_20734 ) ) ( not ( = ?auto_20739 ?auto_20738 ) ) ( not ( = ?auto_20739 ?auto_20730 ) ) ( not ( = ?auto_20743 ?auto_20744 ) ) ( not ( = ?auto_20743 ?auto_20732 ) ) ( not ( = ?auto_20733 ?auto_20737 ) ) ( not ( = ?auto_20733 ?auto_20734 ) ) ( not ( = ?auto_20717 ?auto_20721 ) ) ( not ( = ?auto_20717 ?auto_20731 ) ) ( not ( = ?auto_20718 ?auto_20721 ) ) ( not ( = ?auto_20718 ?auto_20731 ) ) ( not ( = ?auto_20719 ?auto_20721 ) ) ( not ( = ?auto_20719 ?auto_20731 ) ) ( not ( = ?auto_20721 ?auto_20733 ) ) ( not ( = ?auto_20721 ?auto_20737 ) ) ( not ( = ?auto_20721 ?auto_20734 ) ) ( not ( = ?auto_20741 ?auto_20739 ) ) ( not ( = ?auto_20741 ?auto_20738 ) ) ( not ( = ?auto_20741 ?auto_20730 ) ) ( not ( = ?auto_20740 ?auto_20743 ) ) ( not ( = ?auto_20740 ?auto_20744 ) ) ( not ( = ?auto_20740 ?auto_20732 ) ) ( not ( = ?auto_20731 ?auto_20733 ) ) ( not ( = ?auto_20731 ?auto_20737 ) ) ( not ( = ?auto_20731 ?auto_20734 ) ) ( not ( = ?auto_20717 ?auto_20722 ) ) ( not ( = ?auto_20717 ?auto_20736 ) ) ( not ( = ?auto_20718 ?auto_20722 ) ) ( not ( = ?auto_20718 ?auto_20736 ) ) ( not ( = ?auto_20719 ?auto_20722 ) ) ( not ( = ?auto_20719 ?auto_20736 ) ) ( not ( = ?auto_20720 ?auto_20722 ) ) ( not ( = ?auto_20720 ?auto_20736 ) ) ( not ( = ?auto_20722 ?auto_20731 ) ) ( not ( = ?auto_20722 ?auto_20733 ) ) ( not ( = ?auto_20722 ?auto_20737 ) ) ( not ( = ?auto_20722 ?auto_20734 ) ) ( not ( = ?auto_20735 ?auto_20741 ) ) ( not ( = ?auto_20735 ?auto_20739 ) ) ( not ( = ?auto_20735 ?auto_20738 ) ) ( not ( = ?auto_20735 ?auto_20730 ) ) ( not ( = ?auto_20742 ?auto_20740 ) ) ( not ( = ?auto_20742 ?auto_20743 ) ) ( not ( = ?auto_20742 ?auto_20744 ) ) ( not ( = ?auto_20742 ?auto_20732 ) ) ( not ( = ?auto_20736 ?auto_20731 ) ) ( not ( = ?auto_20736 ?auto_20733 ) ) ( not ( = ?auto_20736 ?auto_20737 ) ) ( not ( = ?auto_20736 ?auto_20734 ) ) ( not ( = ?auto_20717 ?auto_20723 ) ) ( not ( = ?auto_20717 ?auto_20725 ) ) ( not ( = ?auto_20718 ?auto_20723 ) ) ( not ( = ?auto_20718 ?auto_20725 ) ) ( not ( = ?auto_20719 ?auto_20723 ) ) ( not ( = ?auto_20719 ?auto_20725 ) ) ( not ( = ?auto_20720 ?auto_20723 ) ) ( not ( = ?auto_20720 ?auto_20725 ) ) ( not ( = ?auto_20721 ?auto_20723 ) ) ( not ( = ?auto_20721 ?auto_20725 ) ) ( not ( = ?auto_20723 ?auto_20736 ) ) ( not ( = ?auto_20723 ?auto_20731 ) ) ( not ( = ?auto_20723 ?auto_20733 ) ) ( not ( = ?auto_20723 ?auto_20737 ) ) ( not ( = ?auto_20723 ?auto_20734 ) ) ( not ( = ?auto_20728 ?auto_20735 ) ) ( not ( = ?auto_20728 ?auto_20741 ) ) ( not ( = ?auto_20728 ?auto_20739 ) ) ( not ( = ?auto_20728 ?auto_20738 ) ) ( not ( = ?auto_20728 ?auto_20730 ) ) ( not ( = ?auto_20726 ?auto_20742 ) ) ( not ( = ?auto_20726 ?auto_20740 ) ) ( not ( = ?auto_20726 ?auto_20743 ) ) ( not ( = ?auto_20726 ?auto_20744 ) ) ( not ( = ?auto_20726 ?auto_20732 ) ) ( not ( = ?auto_20725 ?auto_20736 ) ) ( not ( = ?auto_20725 ?auto_20731 ) ) ( not ( = ?auto_20725 ?auto_20733 ) ) ( not ( = ?auto_20725 ?auto_20737 ) ) ( not ( = ?auto_20725 ?auto_20734 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_20717 ?auto_20718 ?auto_20719 ?auto_20720 ?auto_20721 ?auto_20722 )
      ( MAKE-1CRATE ?auto_20722 ?auto_20723 )
      ( MAKE-6CRATE-VERIFY ?auto_20717 ?auto_20718 ?auto_20719 ?auto_20720 ?auto_20721 ?auto_20722 ?auto_20723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20747 - SURFACE
      ?auto_20748 - SURFACE
    )
    :vars
    (
      ?auto_20749 - HOIST
      ?auto_20750 - PLACE
      ?auto_20752 - PLACE
      ?auto_20753 - HOIST
      ?auto_20754 - SURFACE
      ?auto_20751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20749 ?auto_20750 ) ( SURFACE-AT ?auto_20747 ?auto_20750 ) ( CLEAR ?auto_20747 ) ( IS-CRATE ?auto_20748 ) ( AVAILABLE ?auto_20749 ) ( not ( = ?auto_20752 ?auto_20750 ) ) ( HOIST-AT ?auto_20753 ?auto_20752 ) ( AVAILABLE ?auto_20753 ) ( SURFACE-AT ?auto_20748 ?auto_20752 ) ( ON ?auto_20748 ?auto_20754 ) ( CLEAR ?auto_20748 ) ( TRUCK-AT ?auto_20751 ?auto_20750 ) ( not ( = ?auto_20747 ?auto_20748 ) ) ( not ( = ?auto_20747 ?auto_20754 ) ) ( not ( = ?auto_20748 ?auto_20754 ) ) ( not ( = ?auto_20749 ?auto_20753 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20751 ?auto_20750 ?auto_20752 )
      ( !LIFT ?auto_20753 ?auto_20748 ?auto_20754 ?auto_20752 )
      ( !LOAD ?auto_20753 ?auto_20748 ?auto_20751 ?auto_20752 )
      ( !DRIVE ?auto_20751 ?auto_20752 ?auto_20750 )
      ( !UNLOAD ?auto_20749 ?auto_20748 ?auto_20751 ?auto_20750 )
      ( !DROP ?auto_20749 ?auto_20748 ?auto_20747 ?auto_20750 )
      ( MAKE-1CRATE-VERIFY ?auto_20747 ?auto_20748 ) )
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
      ?auto_20770 - SURFACE
      ?auto_20769 - SURFACE
    )
    :vars
    (
      ?auto_20773 - HOIST
      ?auto_20772 - PLACE
      ?auto_20776 - PLACE
      ?auto_20771 - HOIST
      ?auto_20774 - SURFACE
      ?auto_20787 - PLACE
      ?auto_20785 - HOIST
      ?auto_20784 - SURFACE
      ?auto_20777 - PLACE
      ?auto_20791 - HOIST
      ?auto_20794 - SURFACE
      ?auto_20790 - PLACE
      ?auto_20788 - HOIST
      ?auto_20780 - SURFACE
      ?auto_20789 - PLACE
      ?auto_20792 - HOIST
      ?auto_20779 - SURFACE
      ?auto_20783 - PLACE
      ?auto_20782 - HOIST
      ?auto_20793 - SURFACE
      ?auto_20786 - PLACE
      ?auto_20781 - HOIST
      ?auto_20778 - SURFACE
      ?auto_20775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20773 ?auto_20772 ) ( IS-CRATE ?auto_20769 ) ( not ( = ?auto_20776 ?auto_20772 ) ) ( HOIST-AT ?auto_20771 ?auto_20776 ) ( AVAILABLE ?auto_20771 ) ( SURFACE-AT ?auto_20769 ?auto_20776 ) ( ON ?auto_20769 ?auto_20774 ) ( CLEAR ?auto_20769 ) ( not ( = ?auto_20770 ?auto_20769 ) ) ( not ( = ?auto_20770 ?auto_20774 ) ) ( not ( = ?auto_20769 ?auto_20774 ) ) ( not ( = ?auto_20773 ?auto_20771 ) ) ( IS-CRATE ?auto_20770 ) ( not ( = ?auto_20787 ?auto_20772 ) ) ( HOIST-AT ?auto_20785 ?auto_20787 ) ( AVAILABLE ?auto_20785 ) ( SURFACE-AT ?auto_20770 ?auto_20787 ) ( ON ?auto_20770 ?auto_20784 ) ( CLEAR ?auto_20770 ) ( not ( = ?auto_20768 ?auto_20770 ) ) ( not ( = ?auto_20768 ?auto_20784 ) ) ( not ( = ?auto_20770 ?auto_20784 ) ) ( not ( = ?auto_20773 ?auto_20785 ) ) ( IS-CRATE ?auto_20768 ) ( not ( = ?auto_20777 ?auto_20772 ) ) ( HOIST-AT ?auto_20791 ?auto_20777 ) ( AVAILABLE ?auto_20791 ) ( SURFACE-AT ?auto_20768 ?auto_20777 ) ( ON ?auto_20768 ?auto_20794 ) ( CLEAR ?auto_20768 ) ( not ( = ?auto_20767 ?auto_20768 ) ) ( not ( = ?auto_20767 ?auto_20794 ) ) ( not ( = ?auto_20768 ?auto_20794 ) ) ( not ( = ?auto_20773 ?auto_20791 ) ) ( IS-CRATE ?auto_20767 ) ( not ( = ?auto_20790 ?auto_20772 ) ) ( HOIST-AT ?auto_20788 ?auto_20790 ) ( AVAILABLE ?auto_20788 ) ( SURFACE-AT ?auto_20767 ?auto_20790 ) ( ON ?auto_20767 ?auto_20780 ) ( CLEAR ?auto_20767 ) ( not ( = ?auto_20766 ?auto_20767 ) ) ( not ( = ?auto_20766 ?auto_20780 ) ) ( not ( = ?auto_20767 ?auto_20780 ) ) ( not ( = ?auto_20773 ?auto_20788 ) ) ( IS-CRATE ?auto_20766 ) ( not ( = ?auto_20789 ?auto_20772 ) ) ( HOIST-AT ?auto_20792 ?auto_20789 ) ( AVAILABLE ?auto_20792 ) ( SURFACE-AT ?auto_20766 ?auto_20789 ) ( ON ?auto_20766 ?auto_20779 ) ( CLEAR ?auto_20766 ) ( not ( = ?auto_20765 ?auto_20766 ) ) ( not ( = ?auto_20765 ?auto_20779 ) ) ( not ( = ?auto_20766 ?auto_20779 ) ) ( not ( = ?auto_20773 ?auto_20792 ) ) ( IS-CRATE ?auto_20765 ) ( not ( = ?auto_20783 ?auto_20772 ) ) ( HOIST-AT ?auto_20782 ?auto_20783 ) ( AVAILABLE ?auto_20782 ) ( SURFACE-AT ?auto_20765 ?auto_20783 ) ( ON ?auto_20765 ?auto_20793 ) ( CLEAR ?auto_20765 ) ( not ( = ?auto_20764 ?auto_20765 ) ) ( not ( = ?auto_20764 ?auto_20793 ) ) ( not ( = ?auto_20765 ?auto_20793 ) ) ( not ( = ?auto_20773 ?auto_20782 ) ) ( SURFACE-AT ?auto_20763 ?auto_20772 ) ( CLEAR ?auto_20763 ) ( IS-CRATE ?auto_20764 ) ( AVAILABLE ?auto_20773 ) ( not ( = ?auto_20786 ?auto_20772 ) ) ( HOIST-AT ?auto_20781 ?auto_20786 ) ( AVAILABLE ?auto_20781 ) ( SURFACE-AT ?auto_20764 ?auto_20786 ) ( ON ?auto_20764 ?auto_20778 ) ( CLEAR ?auto_20764 ) ( TRUCK-AT ?auto_20775 ?auto_20772 ) ( not ( = ?auto_20763 ?auto_20764 ) ) ( not ( = ?auto_20763 ?auto_20778 ) ) ( not ( = ?auto_20764 ?auto_20778 ) ) ( not ( = ?auto_20773 ?auto_20781 ) ) ( not ( = ?auto_20763 ?auto_20765 ) ) ( not ( = ?auto_20763 ?auto_20793 ) ) ( not ( = ?auto_20765 ?auto_20778 ) ) ( not ( = ?auto_20783 ?auto_20786 ) ) ( not ( = ?auto_20782 ?auto_20781 ) ) ( not ( = ?auto_20793 ?auto_20778 ) ) ( not ( = ?auto_20763 ?auto_20766 ) ) ( not ( = ?auto_20763 ?auto_20779 ) ) ( not ( = ?auto_20764 ?auto_20766 ) ) ( not ( = ?auto_20764 ?auto_20779 ) ) ( not ( = ?auto_20766 ?auto_20793 ) ) ( not ( = ?auto_20766 ?auto_20778 ) ) ( not ( = ?auto_20789 ?auto_20783 ) ) ( not ( = ?auto_20789 ?auto_20786 ) ) ( not ( = ?auto_20792 ?auto_20782 ) ) ( not ( = ?auto_20792 ?auto_20781 ) ) ( not ( = ?auto_20779 ?auto_20793 ) ) ( not ( = ?auto_20779 ?auto_20778 ) ) ( not ( = ?auto_20763 ?auto_20767 ) ) ( not ( = ?auto_20763 ?auto_20780 ) ) ( not ( = ?auto_20764 ?auto_20767 ) ) ( not ( = ?auto_20764 ?auto_20780 ) ) ( not ( = ?auto_20765 ?auto_20767 ) ) ( not ( = ?auto_20765 ?auto_20780 ) ) ( not ( = ?auto_20767 ?auto_20779 ) ) ( not ( = ?auto_20767 ?auto_20793 ) ) ( not ( = ?auto_20767 ?auto_20778 ) ) ( not ( = ?auto_20790 ?auto_20789 ) ) ( not ( = ?auto_20790 ?auto_20783 ) ) ( not ( = ?auto_20790 ?auto_20786 ) ) ( not ( = ?auto_20788 ?auto_20792 ) ) ( not ( = ?auto_20788 ?auto_20782 ) ) ( not ( = ?auto_20788 ?auto_20781 ) ) ( not ( = ?auto_20780 ?auto_20779 ) ) ( not ( = ?auto_20780 ?auto_20793 ) ) ( not ( = ?auto_20780 ?auto_20778 ) ) ( not ( = ?auto_20763 ?auto_20768 ) ) ( not ( = ?auto_20763 ?auto_20794 ) ) ( not ( = ?auto_20764 ?auto_20768 ) ) ( not ( = ?auto_20764 ?auto_20794 ) ) ( not ( = ?auto_20765 ?auto_20768 ) ) ( not ( = ?auto_20765 ?auto_20794 ) ) ( not ( = ?auto_20766 ?auto_20768 ) ) ( not ( = ?auto_20766 ?auto_20794 ) ) ( not ( = ?auto_20768 ?auto_20780 ) ) ( not ( = ?auto_20768 ?auto_20779 ) ) ( not ( = ?auto_20768 ?auto_20793 ) ) ( not ( = ?auto_20768 ?auto_20778 ) ) ( not ( = ?auto_20777 ?auto_20790 ) ) ( not ( = ?auto_20777 ?auto_20789 ) ) ( not ( = ?auto_20777 ?auto_20783 ) ) ( not ( = ?auto_20777 ?auto_20786 ) ) ( not ( = ?auto_20791 ?auto_20788 ) ) ( not ( = ?auto_20791 ?auto_20792 ) ) ( not ( = ?auto_20791 ?auto_20782 ) ) ( not ( = ?auto_20791 ?auto_20781 ) ) ( not ( = ?auto_20794 ?auto_20780 ) ) ( not ( = ?auto_20794 ?auto_20779 ) ) ( not ( = ?auto_20794 ?auto_20793 ) ) ( not ( = ?auto_20794 ?auto_20778 ) ) ( not ( = ?auto_20763 ?auto_20770 ) ) ( not ( = ?auto_20763 ?auto_20784 ) ) ( not ( = ?auto_20764 ?auto_20770 ) ) ( not ( = ?auto_20764 ?auto_20784 ) ) ( not ( = ?auto_20765 ?auto_20770 ) ) ( not ( = ?auto_20765 ?auto_20784 ) ) ( not ( = ?auto_20766 ?auto_20770 ) ) ( not ( = ?auto_20766 ?auto_20784 ) ) ( not ( = ?auto_20767 ?auto_20770 ) ) ( not ( = ?auto_20767 ?auto_20784 ) ) ( not ( = ?auto_20770 ?auto_20794 ) ) ( not ( = ?auto_20770 ?auto_20780 ) ) ( not ( = ?auto_20770 ?auto_20779 ) ) ( not ( = ?auto_20770 ?auto_20793 ) ) ( not ( = ?auto_20770 ?auto_20778 ) ) ( not ( = ?auto_20787 ?auto_20777 ) ) ( not ( = ?auto_20787 ?auto_20790 ) ) ( not ( = ?auto_20787 ?auto_20789 ) ) ( not ( = ?auto_20787 ?auto_20783 ) ) ( not ( = ?auto_20787 ?auto_20786 ) ) ( not ( = ?auto_20785 ?auto_20791 ) ) ( not ( = ?auto_20785 ?auto_20788 ) ) ( not ( = ?auto_20785 ?auto_20792 ) ) ( not ( = ?auto_20785 ?auto_20782 ) ) ( not ( = ?auto_20785 ?auto_20781 ) ) ( not ( = ?auto_20784 ?auto_20794 ) ) ( not ( = ?auto_20784 ?auto_20780 ) ) ( not ( = ?auto_20784 ?auto_20779 ) ) ( not ( = ?auto_20784 ?auto_20793 ) ) ( not ( = ?auto_20784 ?auto_20778 ) ) ( not ( = ?auto_20763 ?auto_20769 ) ) ( not ( = ?auto_20763 ?auto_20774 ) ) ( not ( = ?auto_20764 ?auto_20769 ) ) ( not ( = ?auto_20764 ?auto_20774 ) ) ( not ( = ?auto_20765 ?auto_20769 ) ) ( not ( = ?auto_20765 ?auto_20774 ) ) ( not ( = ?auto_20766 ?auto_20769 ) ) ( not ( = ?auto_20766 ?auto_20774 ) ) ( not ( = ?auto_20767 ?auto_20769 ) ) ( not ( = ?auto_20767 ?auto_20774 ) ) ( not ( = ?auto_20768 ?auto_20769 ) ) ( not ( = ?auto_20768 ?auto_20774 ) ) ( not ( = ?auto_20769 ?auto_20784 ) ) ( not ( = ?auto_20769 ?auto_20794 ) ) ( not ( = ?auto_20769 ?auto_20780 ) ) ( not ( = ?auto_20769 ?auto_20779 ) ) ( not ( = ?auto_20769 ?auto_20793 ) ) ( not ( = ?auto_20769 ?auto_20778 ) ) ( not ( = ?auto_20776 ?auto_20787 ) ) ( not ( = ?auto_20776 ?auto_20777 ) ) ( not ( = ?auto_20776 ?auto_20790 ) ) ( not ( = ?auto_20776 ?auto_20789 ) ) ( not ( = ?auto_20776 ?auto_20783 ) ) ( not ( = ?auto_20776 ?auto_20786 ) ) ( not ( = ?auto_20771 ?auto_20785 ) ) ( not ( = ?auto_20771 ?auto_20791 ) ) ( not ( = ?auto_20771 ?auto_20788 ) ) ( not ( = ?auto_20771 ?auto_20792 ) ) ( not ( = ?auto_20771 ?auto_20782 ) ) ( not ( = ?auto_20771 ?auto_20781 ) ) ( not ( = ?auto_20774 ?auto_20784 ) ) ( not ( = ?auto_20774 ?auto_20794 ) ) ( not ( = ?auto_20774 ?auto_20780 ) ) ( not ( = ?auto_20774 ?auto_20779 ) ) ( not ( = ?auto_20774 ?auto_20793 ) ) ( not ( = ?auto_20774 ?auto_20778 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20763 ?auto_20764 ?auto_20765 ?auto_20766 ?auto_20767 ?auto_20768 ?auto_20770 )
      ( MAKE-1CRATE ?auto_20770 ?auto_20769 )
      ( MAKE-7CRATE-VERIFY ?auto_20763 ?auto_20764 ?auto_20765 ?auto_20766 ?auto_20767 ?auto_20768 ?auto_20770 ?auto_20769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20797 - SURFACE
      ?auto_20798 - SURFACE
    )
    :vars
    (
      ?auto_20799 - HOIST
      ?auto_20800 - PLACE
      ?auto_20802 - PLACE
      ?auto_20803 - HOIST
      ?auto_20804 - SURFACE
      ?auto_20801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20799 ?auto_20800 ) ( SURFACE-AT ?auto_20797 ?auto_20800 ) ( CLEAR ?auto_20797 ) ( IS-CRATE ?auto_20798 ) ( AVAILABLE ?auto_20799 ) ( not ( = ?auto_20802 ?auto_20800 ) ) ( HOIST-AT ?auto_20803 ?auto_20802 ) ( AVAILABLE ?auto_20803 ) ( SURFACE-AT ?auto_20798 ?auto_20802 ) ( ON ?auto_20798 ?auto_20804 ) ( CLEAR ?auto_20798 ) ( TRUCK-AT ?auto_20801 ?auto_20800 ) ( not ( = ?auto_20797 ?auto_20798 ) ) ( not ( = ?auto_20797 ?auto_20804 ) ) ( not ( = ?auto_20798 ?auto_20804 ) ) ( not ( = ?auto_20799 ?auto_20803 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20801 ?auto_20800 ?auto_20802 )
      ( !LIFT ?auto_20803 ?auto_20798 ?auto_20804 ?auto_20802 )
      ( !LOAD ?auto_20803 ?auto_20798 ?auto_20801 ?auto_20802 )
      ( !DRIVE ?auto_20801 ?auto_20802 ?auto_20800 )
      ( !UNLOAD ?auto_20799 ?auto_20798 ?auto_20801 ?auto_20800 )
      ( !DROP ?auto_20799 ?auto_20798 ?auto_20797 ?auto_20800 )
      ( MAKE-1CRATE-VERIFY ?auto_20797 ?auto_20798 ) )
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
      ?auto_20822 - SURFACE
      ?auto_20821 - SURFACE
      ?auto_20820 - SURFACE
    )
    :vars
    (
      ?auto_20823 - HOIST
      ?auto_20826 - PLACE
      ?auto_20827 - PLACE
      ?auto_20828 - HOIST
      ?auto_20824 - SURFACE
      ?auto_20834 - PLACE
      ?auto_20846 - HOIST
      ?auto_20845 - SURFACE
      ?auto_20848 - PLACE
      ?auto_20847 - HOIST
      ?auto_20833 - SURFACE
      ?auto_20844 - PLACE
      ?auto_20841 - HOIST
      ?auto_20842 - SURFACE
      ?auto_20832 - PLACE
      ?auto_20830 - HOIST
      ?auto_20838 - SURFACE
      ?auto_20831 - PLACE
      ?auto_20849 - HOIST
      ?auto_20840 - SURFACE
      ?auto_20835 - PLACE
      ?auto_20836 - HOIST
      ?auto_20843 - SURFACE
      ?auto_20829 - PLACE
      ?auto_20837 - HOIST
      ?auto_20839 - SURFACE
      ?auto_20825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20823 ?auto_20826 ) ( IS-CRATE ?auto_20820 ) ( not ( = ?auto_20827 ?auto_20826 ) ) ( HOIST-AT ?auto_20828 ?auto_20827 ) ( AVAILABLE ?auto_20828 ) ( SURFACE-AT ?auto_20820 ?auto_20827 ) ( ON ?auto_20820 ?auto_20824 ) ( CLEAR ?auto_20820 ) ( not ( = ?auto_20821 ?auto_20820 ) ) ( not ( = ?auto_20821 ?auto_20824 ) ) ( not ( = ?auto_20820 ?auto_20824 ) ) ( not ( = ?auto_20823 ?auto_20828 ) ) ( IS-CRATE ?auto_20821 ) ( not ( = ?auto_20834 ?auto_20826 ) ) ( HOIST-AT ?auto_20846 ?auto_20834 ) ( AVAILABLE ?auto_20846 ) ( SURFACE-AT ?auto_20821 ?auto_20834 ) ( ON ?auto_20821 ?auto_20845 ) ( CLEAR ?auto_20821 ) ( not ( = ?auto_20822 ?auto_20821 ) ) ( not ( = ?auto_20822 ?auto_20845 ) ) ( not ( = ?auto_20821 ?auto_20845 ) ) ( not ( = ?auto_20823 ?auto_20846 ) ) ( IS-CRATE ?auto_20822 ) ( not ( = ?auto_20848 ?auto_20826 ) ) ( HOIST-AT ?auto_20847 ?auto_20848 ) ( AVAILABLE ?auto_20847 ) ( SURFACE-AT ?auto_20822 ?auto_20848 ) ( ON ?auto_20822 ?auto_20833 ) ( CLEAR ?auto_20822 ) ( not ( = ?auto_20819 ?auto_20822 ) ) ( not ( = ?auto_20819 ?auto_20833 ) ) ( not ( = ?auto_20822 ?auto_20833 ) ) ( not ( = ?auto_20823 ?auto_20847 ) ) ( IS-CRATE ?auto_20819 ) ( not ( = ?auto_20844 ?auto_20826 ) ) ( HOIST-AT ?auto_20841 ?auto_20844 ) ( AVAILABLE ?auto_20841 ) ( SURFACE-AT ?auto_20819 ?auto_20844 ) ( ON ?auto_20819 ?auto_20842 ) ( CLEAR ?auto_20819 ) ( not ( = ?auto_20818 ?auto_20819 ) ) ( not ( = ?auto_20818 ?auto_20842 ) ) ( not ( = ?auto_20819 ?auto_20842 ) ) ( not ( = ?auto_20823 ?auto_20841 ) ) ( IS-CRATE ?auto_20818 ) ( not ( = ?auto_20832 ?auto_20826 ) ) ( HOIST-AT ?auto_20830 ?auto_20832 ) ( AVAILABLE ?auto_20830 ) ( SURFACE-AT ?auto_20818 ?auto_20832 ) ( ON ?auto_20818 ?auto_20838 ) ( CLEAR ?auto_20818 ) ( not ( = ?auto_20817 ?auto_20818 ) ) ( not ( = ?auto_20817 ?auto_20838 ) ) ( not ( = ?auto_20818 ?auto_20838 ) ) ( not ( = ?auto_20823 ?auto_20830 ) ) ( IS-CRATE ?auto_20817 ) ( not ( = ?auto_20831 ?auto_20826 ) ) ( HOIST-AT ?auto_20849 ?auto_20831 ) ( AVAILABLE ?auto_20849 ) ( SURFACE-AT ?auto_20817 ?auto_20831 ) ( ON ?auto_20817 ?auto_20840 ) ( CLEAR ?auto_20817 ) ( not ( = ?auto_20816 ?auto_20817 ) ) ( not ( = ?auto_20816 ?auto_20840 ) ) ( not ( = ?auto_20817 ?auto_20840 ) ) ( not ( = ?auto_20823 ?auto_20849 ) ) ( IS-CRATE ?auto_20816 ) ( not ( = ?auto_20835 ?auto_20826 ) ) ( HOIST-AT ?auto_20836 ?auto_20835 ) ( AVAILABLE ?auto_20836 ) ( SURFACE-AT ?auto_20816 ?auto_20835 ) ( ON ?auto_20816 ?auto_20843 ) ( CLEAR ?auto_20816 ) ( not ( = ?auto_20815 ?auto_20816 ) ) ( not ( = ?auto_20815 ?auto_20843 ) ) ( not ( = ?auto_20816 ?auto_20843 ) ) ( not ( = ?auto_20823 ?auto_20836 ) ) ( SURFACE-AT ?auto_20814 ?auto_20826 ) ( CLEAR ?auto_20814 ) ( IS-CRATE ?auto_20815 ) ( AVAILABLE ?auto_20823 ) ( not ( = ?auto_20829 ?auto_20826 ) ) ( HOIST-AT ?auto_20837 ?auto_20829 ) ( AVAILABLE ?auto_20837 ) ( SURFACE-AT ?auto_20815 ?auto_20829 ) ( ON ?auto_20815 ?auto_20839 ) ( CLEAR ?auto_20815 ) ( TRUCK-AT ?auto_20825 ?auto_20826 ) ( not ( = ?auto_20814 ?auto_20815 ) ) ( not ( = ?auto_20814 ?auto_20839 ) ) ( not ( = ?auto_20815 ?auto_20839 ) ) ( not ( = ?auto_20823 ?auto_20837 ) ) ( not ( = ?auto_20814 ?auto_20816 ) ) ( not ( = ?auto_20814 ?auto_20843 ) ) ( not ( = ?auto_20816 ?auto_20839 ) ) ( not ( = ?auto_20835 ?auto_20829 ) ) ( not ( = ?auto_20836 ?auto_20837 ) ) ( not ( = ?auto_20843 ?auto_20839 ) ) ( not ( = ?auto_20814 ?auto_20817 ) ) ( not ( = ?auto_20814 ?auto_20840 ) ) ( not ( = ?auto_20815 ?auto_20817 ) ) ( not ( = ?auto_20815 ?auto_20840 ) ) ( not ( = ?auto_20817 ?auto_20843 ) ) ( not ( = ?auto_20817 ?auto_20839 ) ) ( not ( = ?auto_20831 ?auto_20835 ) ) ( not ( = ?auto_20831 ?auto_20829 ) ) ( not ( = ?auto_20849 ?auto_20836 ) ) ( not ( = ?auto_20849 ?auto_20837 ) ) ( not ( = ?auto_20840 ?auto_20843 ) ) ( not ( = ?auto_20840 ?auto_20839 ) ) ( not ( = ?auto_20814 ?auto_20818 ) ) ( not ( = ?auto_20814 ?auto_20838 ) ) ( not ( = ?auto_20815 ?auto_20818 ) ) ( not ( = ?auto_20815 ?auto_20838 ) ) ( not ( = ?auto_20816 ?auto_20818 ) ) ( not ( = ?auto_20816 ?auto_20838 ) ) ( not ( = ?auto_20818 ?auto_20840 ) ) ( not ( = ?auto_20818 ?auto_20843 ) ) ( not ( = ?auto_20818 ?auto_20839 ) ) ( not ( = ?auto_20832 ?auto_20831 ) ) ( not ( = ?auto_20832 ?auto_20835 ) ) ( not ( = ?auto_20832 ?auto_20829 ) ) ( not ( = ?auto_20830 ?auto_20849 ) ) ( not ( = ?auto_20830 ?auto_20836 ) ) ( not ( = ?auto_20830 ?auto_20837 ) ) ( not ( = ?auto_20838 ?auto_20840 ) ) ( not ( = ?auto_20838 ?auto_20843 ) ) ( not ( = ?auto_20838 ?auto_20839 ) ) ( not ( = ?auto_20814 ?auto_20819 ) ) ( not ( = ?auto_20814 ?auto_20842 ) ) ( not ( = ?auto_20815 ?auto_20819 ) ) ( not ( = ?auto_20815 ?auto_20842 ) ) ( not ( = ?auto_20816 ?auto_20819 ) ) ( not ( = ?auto_20816 ?auto_20842 ) ) ( not ( = ?auto_20817 ?auto_20819 ) ) ( not ( = ?auto_20817 ?auto_20842 ) ) ( not ( = ?auto_20819 ?auto_20838 ) ) ( not ( = ?auto_20819 ?auto_20840 ) ) ( not ( = ?auto_20819 ?auto_20843 ) ) ( not ( = ?auto_20819 ?auto_20839 ) ) ( not ( = ?auto_20844 ?auto_20832 ) ) ( not ( = ?auto_20844 ?auto_20831 ) ) ( not ( = ?auto_20844 ?auto_20835 ) ) ( not ( = ?auto_20844 ?auto_20829 ) ) ( not ( = ?auto_20841 ?auto_20830 ) ) ( not ( = ?auto_20841 ?auto_20849 ) ) ( not ( = ?auto_20841 ?auto_20836 ) ) ( not ( = ?auto_20841 ?auto_20837 ) ) ( not ( = ?auto_20842 ?auto_20838 ) ) ( not ( = ?auto_20842 ?auto_20840 ) ) ( not ( = ?auto_20842 ?auto_20843 ) ) ( not ( = ?auto_20842 ?auto_20839 ) ) ( not ( = ?auto_20814 ?auto_20822 ) ) ( not ( = ?auto_20814 ?auto_20833 ) ) ( not ( = ?auto_20815 ?auto_20822 ) ) ( not ( = ?auto_20815 ?auto_20833 ) ) ( not ( = ?auto_20816 ?auto_20822 ) ) ( not ( = ?auto_20816 ?auto_20833 ) ) ( not ( = ?auto_20817 ?auto_20822 ) ) ( not ( = ?auto_20817 ?auto_20833 ) ) ( not ( = ?auto_20818 ?auto_20822 ) ) ( not ( = ?auto_20818 ?auto_20833 ) ) ( not ( = ?auto_20822 ?auto_20842 ) ) ( not ( = ?auto_20822 ?auto_20838 ) ) ( not ( = ?auto_20822 ?auto_20840 ) ) ( not ( = ?auto_20822 ?auto_20843 ) ) ( not ( = ?auto_20822 ?auto_20839 ) ) ( not ( = ?auto_20848 ?auto_20844 ) ) ( not ( = ?auto_20848 ?auto_20832 ) ) ( not ( = ?auto_20848 ?auto_20831 ) ) ( not ( = ?auto_20848 ?auto_20835 ) ) ( not ( = ?auto_20848 ?auto_20829 ) ) ( not ( = ?auto_20847 ?auto_20841 ) ) ( not ( = ?auto_20847 ?auto_20830 ) ) ( not ( = ?auto_20847 ?auto_20849 ) ) ( not ( = ?auto_20847 ?auto_20836 ) ) ( not ( = ?auto_20847 ?auto_20837 ) ) ( not ( = ?auto_20833 ?auto_20842 ) ) ( not ( = ?auto_20833 ?auto_20838 ) ) ( not ( = ?auto_20833 ?auto_20840 ) ) ( not ( = ?auto_20833 ?auto_20843 ) ) ( not ( = ?auto_20833 ?auto_20839 ) ) ( not ( = ?auto_20814 ?auto_20821 ) ) ( not ( = ?auto_20814 ?auto_20845 ) ) ( not ( = ?auto_20815 ?auto_20821 ) ) ( not ( = ?auto_20815 ?auto_20845 ) ) ( not ( = ?auto_20816 ?auto_20821 ) ) ( not ( = ?auto_20816 ?auto_20845 ) ) ( not ( = ?auto_20817 ?auto_20821 ) ) ( not ( = ?auto_20817 ?auto_20845 ) ) ( not ( = ?auto_20818 ?auto_20821 ) ) ( not ( = ?auto_20818 ?auto_20845 ) ) ( not ( = ?auto_20819 ?auto_20821 ) ) ( not ( = ?auto_20819 ?auto_20845 ) ) ( not ( = ?auto_20821 ?auto_20833 ) ) ( not ( = ?auto_20821 ?auto_20842 ) ) ( not ( = ?auto_20821 ?auto_20838 ) ) ( not ( = ?auto_20821 ?auto_20840 ) ) ( not ( = ?auto_20821 ?auto_20843 ) ) ( not ( = ?auto_20821 ?auto_20839 ) ) ( not ( = ?auto_20834 ?auto_20848 ) ) ( not ( = ?auto_20834 ?auto_20844 ) ) ( not ( = ?auto_20834 ?auto_20832 ) ) ( not ( = ?auto_20834 ?auto_20831 ) ) ( not ( = ?auto_20834 ?auto_20835 ) ) ( not ( = ?auto_20834 ?auto_20829 ) ) ( not ( = ?auto_20846 ?auto_20847 ) ) ( not ( = ?auto_20846 ?auto_20841 ) ) ( not ( = ?auto_20846 ?auto_20830 ) ) ( not ( = ?auto_20846 ?auto_20849 ) ) ( not ( = ?auto_20846 ?auto_20836 ) ) ( not ( = ?auto_20846 ?auto_20837 ) ) ( not ( = ?auto_20845 ?auto_20833 ) ) ( not ( = ?auto_20845 ?auto_20842 ) ) ( not ( = ?auto_20845 ?auto_20838 ) ) ( not ( = ?auto_20845 ?auto_20840 ) ) ( not ( = ?auto_20845 ?auto_20843 ) ) ( not ( = ?auto_20845 ?auto_20839 ) ) ( not ( = ?auto_20814 ?auto_20820 ) ) ( not ( = ?auto_20814 ?auto_20824 ) ) ( not ( = ?auto_20815 ?auto_20820 ) ) ( not ( = ?auto_20815 ?auto_20824 ) ) ( not ( = ?auto_20816 ?auto_20820 ) ) ( not ( = ?auto_20816 ?auto_20824 ) ) ( not ( = ?auto_20817 ?auto_20820 ) ) ( not ( = ?auto_20817 ?auto_20824 ) ) ( not ( = ?auto_20818 ?auto_20820 ) ) ( not ( = ?auto_20818 ?auto_20824 ) ) ( not ( = ?auto_20819 ?auto_20820 ) ) ( not ( = ?auto_20819 ?auto_20824 ) ) ( not ( = ?auto_20822 ?auto_20820 ) ) ( not ( = ?auto_20822 ?auto_20824 ) ) ( not ( = ?auto_20820 ?auto_20845 ) ) ( not ( = ?auto_20820 ?auto_20833 ) ) ( not ( = ?auto_20820 ?auto_20842 ) ) ( not ( = ?auto_20820 ?auto_20838 ) ) ( not ( = ?auto_20820 ?auto_20840 ) ) ( not ( = ?auto_20820 ?auto_20843 ) ) ( not ( = ?auto_20820 ?auto_20839 ) ) ( not ( = ?auto_20827 ?auto_20834 ) ) ( not ( = ?auto_20827 ?auto_20848 ) ) ( not ( = ?auto_20827 ?auto_20844 ) ) ( not ( = ?auto_20827 ?auto_20832 ) ) ( not ( = ?auto_20827 ?auto_20831 ) ) ( not ( = ?auto_20827 ?auto_20835 ) ) ( not ( = ?auto_20827 ?auto_20829 ) ) ( not ( = ?auto_20828 ?auto_20846 ) ) ( not ( = ?auto_20828 ?auto_20847 ) ) ( not ( = ?auto_20828 ?auto_20841 ) ) ( not ( = ?auto_20828 ?auto_20830 ) ) ( not ( = ?auto_20828 ?auto_20849 ) ) ( not ( = ?auto_20828 ?auto_20836 ) ) ( not ( = ?auto_20828 ?auto_20837 ) ) ( not ( = ?auto_20824 ?auto_20845 ) ) ( not ( = ?auto_20824 ?auto_20833 ) ) ( not ( = ?auto_20824 ?auto_20842 ) ) ( not ( = ?auto_20824 ?auto_20838 ) ) ( not ( = ?auto_20824 ?auto_20840 ) ) ( not ( = ?auto_20824 ?auto_20843 ) ) ( not ( = ?auto_20824 ?auto_20839 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20814 ?auto_20815 ?auto_20816 ?auto_20817 ?auto_20818 ?auto_20819 ?auto_20822 ?auto_20821 )
      ( MAKE-1CRATE ?auto_20821 ?auto_20820 )
      ( MAKE-8CRATE-VERIFY ?auto_20814 ?auto_20815 ?auto_20816 ?auto_20817 ?auto_20818 ?auto_20819 ?auto_20822 ?auto_20821 ?auto_20820 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20852 - SURFACE
      ?auto_20853 - SURFACE
    )
    :vars
    (
      ?auto_20854 - HOIST
      ?auto_20855 - PLACE
      ?auto_20857 - PLACE
      ?auto_20858 - HOIST
      ?auto_20859 - SURFACE
      ?auto_20856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20854 ?auto_20855 ) ( SURFACE-AT ?auto_20852 ?auto_20855 ) ( CLEAR ?auto_20852 ) ( IS-CRATE ?auto_20853 ) ( AVAILABLE ?auto_20854 ) ( not ( = ?auto_20857 ?auto_20855 ) ) ( HOIST-AT ?auto_20858 ?auto_20857 ) ( AVAILABLE ?auto_20858 ) ( SURFACE-AT ?auto_20853 ?auto_20857 ) ( ON ?auto_20853 ?auto_20859 ) ( CLEAR ?auto_20853 ) ( TRUCK-AT ?auto_20856 ?auto_20855 ) ( not ( = ?auto_20852 ?auto_20853 ) ) ( not ( = ?auto_20852 ?auto_20859 ) ) ( not ( = ?auto_20853 ?auto_20859 ) ) ( not ( = ?auto_20854 ?auto_20858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20856 ?auto_20855 ?auto_20857 )
      ( !LIFT ?auto_20858 ?auto_20853 ?auto_20859 ?auto_20857 )
      ( !LOAD ?auto_20858 ?auto_20853 ?auto_20856 ?auto_20857 )
      ( !DRIVE ?auto_20856 ?auto_20857 ?auto_20855 )
      ( !UNLOAD ?auto_20854 ?auto_20853 ?auto_20856 ?auto_20855 )
      ( !DROP ?auto_20854 ?auto_20853 ?auto_20852 ?auto_20855 )
      ( MAKE-1CRATE-VERIFY ?auto_20852 ?auto_20853 ) )
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
      ?auto_20878 - SURFACE
      ?auto_20877 - SURFACE
      ?auto_20876 - SURFACE
      ?auto_20879 - SURFACE
    )
    :vars
    (
      ?auto_20883 - HOIST
      ?auto_20881 - PLACE
      ?auto_20880 - PLACE
      ?auto_20882 - HOIST
      ?auto_20885 - SURFACE
      ?auto_20886 - PLACE
      ?auto_20908 - HOIST
      ?auto_20903 - SURFACE
      ?auto_20901 - PLACE
      ?auto_20889 - HOIST
      ?auto_20904 - SURFACE
      ?auto_20890 - PLACE
      ?auto_20887 - HOIST
      ?auto_20902 - SURFACE
      ?auto_20897 - PLACE
      ?auto_20893 - HOIST
      ?auto_20898 - SURFACE
      ?auto_20907 - PLACE
      ?auto_20909 - HOIST
      ?auto_20894 - SURFACE
      ?auto_20905 - PLACE
      ?auto_20891 - HOIST
      ?auto_20892 - SURFACE
      ?auto_20900 - PLACE
      ?auto_20899 - HOIST
      ?auto_20906 - SURFACE
      ?auto_20888 - PLACE
      ?auto_20896 - HOIST
      ?auto_20895 - SURFACE
      ?auto_20884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20883 ?auto_20881 ) ( IS-CRATE ?auto_20879 ) ( not ( = ?auto_20880 ?auto_20881 ) ) ( HOIST-AT ?auto_20882 ?auto_20880 ) ( AVAILABLE ?auto_20882 ) ( SURFACE-AT ?auto_20879 ?auto_20880 ) ( ON ?auto_20879 ?auto_20885 ) ( CLEAR ?auto_20879 ) ( not ( = ?auto_20876 ?auto_20879 ) ) ( not ( = ?auto_20876 ?auto_20885 ) ) ( not ( = ?auto_20879 ?auto_20885 ) ) ( not ( = ?auto_20883 ?auto_20882 ) ) ( IS-CRATE ?auto_20876 ) ( not ( = ?auto_20886 ?auto_20881 ) ) ( HOIST-AT ?auto_20908 ?auto_20886 ) ( AVAILABLE ?auto_20908 ) ( SURFACE-AT ?auto_20876 ?auto_20886 ) ( ON ?auto_20876 ?auto_20903 ) ( CLEAR ?auto_20876 ) ( not ( = ?auto_20877 ?auto_20876 ) ) ( not ( = ?auto_20877 ?auto_20903 ) ) ( not ( = ?auto_20876 ?auto_20903 ) ) ( not ( = ?auto_20883 ?auto_20908 ) ) ( IS-CRATE ?auto_20877 ) ( not ( = ?auto_20901 ?auto_20881 ) ) ( HOIST-AT ?auto_20889 ?auto_20901 ) ( AVAILABLE ?auto_20889 ) ( SURFACE-AT ?auto_20877 ?auto_20901 ) ( ON ?auto_20877 ?auto_20904 ) ( CLEAR ?auto_20877 ) ( not ( = ?auto_20878 ?auto_20877 ) ) ( not ( = ?auto_20878 ?auto_20904 ) ) ( not ( = ?auto_20877 ?auto_20904 ) ) ( not ( = ?auto_20883 ?auto_20889 ) ) ( IS-CRATE ?auto_20878 ) ( not ( = ?auto_20890 ?auto_20881 ) ) ( HOIST-AT ?auto_20887 ?auto_20890 ) ( AVAILABLE ?auto_20887 ) ( SURFACE-AT ?auto_20878 ?auto_20890 ) ( ON ?auto_20878 ?auto_20902 ) ( CLEAR ?auto_20878 ) ( not ( = ?auto_20875 ?auto_20878 ) ) ( not ( = ?auto_20875 ?auto_20902 ) ) ( not ( = ?auto_20878 ?auto_20902 ) ) ( not ( = ?auto_20883 ?auto_20887 ) ) ( IS-CRATE ?auto_20875 ) ( not ( = ?auto_20897 ?auto_20881 ) ) ( HOIST-AT ?auto_20893 ?auto_20897 ) ( AVAILABLE ?auto_20893 ) ( SURFACE-AT ?auto_20875 ?auto_20897 ) ( ON ?auto_20875 ?auto_20898 ) ( CLEAR ?auto_20875 ) ( not ( = ?auto_20874 ?auto_20875 ) ) ( not ( = ?auto_20874 ?auto_20898 ) ) ( not ( = ?auto_20875 ?auto_20898 ) ) ( not ( = ?auto_20883 ?auto_20893 ) ) ( IS-CRATE ?auto_20874 ) ( not ( = ?auto_20907 ?auto_20881 ) ) ( HOIST-AT ?auto_20909 ?auto_20907 ) ( AVAILABLE ?auto_20909 ) ( SURFACE-AT ?auto_20874 ?auto_20907 ) ( ON ?auto_20874 ?auto_20894 ) ( CLEAR ?auto_20874 ) ( not ( = ?auto_20873 ?auto_20874 ) ) ( not ( = ?auto_20873 ?auto_20894 ) ) ( not ( = ?auto_20874 ?auto_20894 ) ) ( not ( = ?auto_20883 ?auto_20909 ) ) ( IS-CRATE ?auto_20873 ) ( not ( = ?auto_20905 ?auto_20881 ) ) ( HOIST-AT ?auto_20891 ?auto_20905 ) ( AVAILABLE ?auto_20891 ) ( SURFACE-AT ?auto_20873 ?auto_20905 ) ( ON ?auto_20873 ?auto_20892 ) ( CLEAR ?auto_20873 ) ( not ( = ?auto_20872 ?auto_20873 ) ) ( not ( = ?auto_20872 ?auto_20892 ) ) ( not ( = ?auto_20873 ?auto_20892 ) ) ( not ( = ?auto_20883 ?auto_20891 ) ) ( IS-CRATE ?auto_20872 ) ( not ( = ?auto_20900 ?auto_20881 ) ) ( HOIST-AT ?auto_20899 ?auto_20900 ) ( AVAILABLE ?auto_20899 ) ( SURFACE-AT ?auto_20872 ?auto_20900 ) ( ON ?auto_20872 ?auto_20906 ) ( CLEAR ?auto_20872 ) ( not ( = ?auto_20871 ?auto_20872 ) ) ( not ( = ?auto_20871 ?auto_20906 ) ) ( not ( = ?auto_20872 ?auto_20906 ) ) ( not ( = ?auto_20883 ?auto_20899 ) ) ( SURFACE-AT ?auto_20870 ?auto_20881 ) ( CLEAR ?auto_20870 ) ( IS-CRATE ?auto_20871 ) ( AVAILABLE ?auto_20883 ) ( not ( = ?auto_20888 ?auto_20881 ) ) ( HOIST-AT ?auto_20896 ?auto_20888 ) ( AVAILABLE ?auto_20896 ) ( SURFACE-AT ?auto_20871 ?auto_20888 ) ( ON ?auto_20871 ?auto_20895 ) ( CLEAR ?auto_20871 ) ( TRUCK-AT ?auto_20884 ?auto_20881 ) ( not ( = ?auto_20870 ?auto_20871 ) ) ( not ( = ?auto_20870 ?auto_20895 ) ) ( not ( = ?auto_20871 ?auto_20895 ) ) ( not ( = ?auto_20883 ?auto_20896 ) ) ( not ( = ?auto_20870 ?auto_20872 ) ) ( not ( = ?auto_20870 ?auto_20906 ) ) ( not ( = ?auto_20872 ?auto_20895 ) ) ( not ( = ?auto_20900 ?auto_20888 ) ) ( not ( = ?auto_20899 ?auto_20896 ) ) ( not ( = ?auto_20906 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20873 ) ) ( not ( = ?auto_20870 ?auto_20892 ) ) ( not ( = ?auto_20871 ?auto_20873 ) ) ( not ( = ?auto_20871 ?auto_20892 ) ) ( not ( = ?auto_20873 ?auto_20906 ) ) ( not ( = ?auto_20873 ?auto_20895 ) ) ( not ( = ?auto_20905 ?auto_20900 ) ) ( not ( = ?auto_20905 ?auto_20888 ) ) ( not ( = ?auto_20891 ?auto_20899 ) ) ( not ( = ?auto_20891 ?auto_20896 ) ) ( not ( = ?auto_20892 ?auto_20906 ) ) ( not ( = ?auto_20892 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20874 ) ) ( not ( = ?auto_20870 ?auto_20894 ) ) ( not ( = ?auto_20871 ?auto_20874 ) ) ( not ( = ?auto_20871 ?auto_20894 ) ) ( not ( = ?auto_20872 ?auto_20874 ) ) ( not ( = ?auto_20872 ?auto_20894 ) ) ( not ( = ?auto_20874 ?auto_20892 ) ) ( not ( = ?auto_20874 ?auto_20906 ) ) ( not ( = ?auto_20874 ?auto_20895 ) ) ( not ( = ?auto_20907 ?auto_20905 ) ) ( not ( = ?auto_20907 ?auto_20900 ) ) ( not ( = ?auto_20907 ?auto_20888 ) ) ( not ( = ?auto_20909 ?auto_20891 ) ) ( not ( = ?auto_20909 ?auto_20899 ) ) ( not ( = ?auto_20909 ?auto_20896 ) ) ( not ( = ?auto_20894 ?auto_20892 ) ) ( not ( = ?auto_20894 ?auto_20906 ) ) ( not ( = ?auto_20894 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20875 ) ) ( not ( = ?auto_20870 ?auto_20898 ) ) ( not ( = ?auto_20871 ?auto_20875 ) ) ( not ( = ?auto_20871 ?auto_20898 ) ) ( not ( = ?auto_20872 ?auto_20875 ) ) ( not ( = ?auto_20872 ?auto_20898 ) ) ( not ( = ?auto_20873 ?auto_20875 ) ) ( not ( = ?auto_20873 ?auto_20898 ) ) ( not ( = ?auto_20875 ?auto_20894 ) ) ( not ( = ?auto_20875 ?auto_20892 ) ) ( not ( = ?auto_20875 ?auto_20906 ) ) ( not ( = ?auto_20875 ?auto_20895 ) ) ( not ( = ?auto_20897 ?auto_20907 ) ) ( not ( = ?auto_20897 ?auto_20905 ) ) ( not ( = ?auto_20897 ?auto_20900 ) ) ( not ( = ?auto_20897 ?auto_20888 ) ) ( not ( = ?auto_20893 ?auto_20909 ) ) ( not ( = ?auto_20893 ?auto_20891 ) ) ( not ( = ?auto_20893 ?auto_20899 ) ) ( not ( = ?auto_20893 ?auto_20896 ) ) ( not ( = ?auto_20898 ?auto_20894 ) ) ( not ( = ?auto_20898 ?auto_20892 ) ) ( not ( = ?auto_20898 ?auto_20906 ) ) ( not ( = ?auto_20898 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20878 ) ) ( not ( = ?auto_20870 ?auto_20902 ) ) ( not ( = ?auto_20871 ?auto_20878 ) ) ( not ( = ?auto_20871 ?auto_20902 ) ) ( not ( = ?auto_20872 ?auto_20878 ) ) ( not ( = ?auto_20872 ?auto_20902 ) ) ( not ( = ?auto_20873 ?auto_20878 ) ) ( not ( = ?auto_20873 ?auto_20902 ) ) ( not ( = ?auto_20874 ?auto_20878 ) ) ( not ( = ?auto_20874 ?auto_20902 ) ) ( not ( = ?auto_20878 ?auto_20898 ) ) ( not ( = ?auto_20878 ?auto_20894 ) ) ( not ( = ?auto_20878 ?auto_20892 ) ) ( not ( = ?auto_20878 ?auto_20906 ) ) ( not ( = ?auto_20878 ?auto_20895 ) ) ( not ( = ?auto_20890 ?auto_20897 ) ) ( not ( = ?auto_20890 ?auto_20907 ) ) ( not ( = ?auto_20890 ?auto_20905 ) ) ( not ( = ?auto_20890 ?auto_20900 ) ) ( not ( = ?auto_20890 ?auto_20888 ) ) ( not ( = ?auto_20887 ?auto_20893 ) ) ( not ( = ?auto_20887 ?auto_20909 ) ) ( not ( = ?auto_20887 ?auto_20891 ) ) ( not ( = ?auto_20887 ?auto_20899 ) ) ( not ( = ?auto_20887 ?auto_20896 ) ) ( not ( = ?auto_20902 ?auto_20898 ) ) ( not ( = ?auto_20902 ?auto_20894 ) ) ( not ( = ?auto_20902 ?auto_20892 ) ) ( not ( = ?auto_20902 ?auto_20906 ) ) ( not ( = ?auto_20902 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20877 ) ) ( not ( = ?auto_20870 ?auto_20904 ) ) ( not ( = ?auto_20871 ?auto_20877 ) ) ( not ( = ?auto_20871 ?auto_20904 ) ) ( not ( = ?auto_20872 ?auto_20877 ) ) ( not ( = ?auto_20872 ?auto_20904 ) ) ( not ( = ?auto_20873 ?auto_20877 ) ) ( not ( = ?auto_20873 ?auto_20904 ) ) ( not ( = ?auto_20874 ?auto_20877 ) ) ( not ( = ?auto_20874 ?auto_20904 ) ) ( not ( = ?auto_20875 ?auto_20877 ) ) ( not ( = ?auto_20875 ?auto_20904 ) ) ( not ( = ?auto_20877 ?auto_20902 ) ) ( not ( = ?auto_20877 ?auto_20898 ) ) ( not ( = ?auto_20877 ?auto_20894 ) ) ( not ( = ?auto_20877 ?auto_20892 ) ) ( not ( = ?auto_20877 ?auto_20906 ) ) ( not ( = ?auto_20877 ?auto_20895 ) ) ( not ( = ?auto_20901 ?auto_20890 ) ) ( not ( = ?auto_20901 ?auto_20897 ) ) ( not ( = ?auto_20901 ?auto_20907 ) ) ( not ( = ?auto_20901 ?auto_20905 ) ) ( not ( = ?auto_20901 ?auto_20900 ) ) ( not ( = ?auto_20901 ?auto_20888 ) ) ( not ( = ?auto_20889 ?auto_20887 ) ) ( not ( = ?auto_20889 ?auto_20893 ) ) ( not ( = ?auto_20889 ?auto_20909 ) ) ( not ( = ?auto_20889 ?auto_20891 ) ) ( not ( = ?auto_20889 ?auto_20899 ) ) ( not ( = ?auto_20889 ?auto_20896 ) ) ( not ( = ?auto_20904 ?auto_20902 ) ) ( not ( = ?auto_20904 ?auto_20898 ) ) ( not ( = ?auto_20904 ?auto_20894 ) ) ( not ( = ?auto_20904 ?auto_20892 ) ) ( not ( = ?auto_20904 ?auto_20906 ) ) ( not ( = ?auto_20904 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20876 ) ) ( not ( = ?auto_20870 ?auto_20903 ) ) ( not ( = ?auto_20871 ?auto_20876 ) ) ( not ( = ?auto_20871 ?auto_20903 ) ) ( not ( = ?auto_20872 ?auto_20876 ) ) ( not ( = ?auto_20872 ?auto_20903 ) ) ( not ( = ?auto_20873 ?auto_20876 ) ) ( not ( = ?auto_20873 ?auto_20903 ) ) ( not ( = ?auto_20874 ?auto_20876 ) ) ( not ( = ?auto_20874 ?auto_20903 ) ) ( not ( = ?auto_20875 ?auto_20876 ) ) ( not ( = ?auto_20875 ?auto_20903 ) ) ( not ( = ?auto_20878 ?auto_20876 ) ) ( not ( = ?auto_20878 ?auto_20903 ) ) ( not ( = ?auto_20876 ?auto_20904 ) ) ( not ( = ?auto_20876 ?auto_20902 ) ) ( not ( = ?auto_20876 ?auto_20898 ) ) ( not ( = ?auto_20876 ?auto_20894 ) ) ( not ( = ?auto_20876 ?auto_20892 ) ) ( not ( = ?auto_20876 ?auto_20906 ) ) ( not ( = ?auto_20876 ?auto_20895 ) ) ( not ( = ?auto_20886 ?auto_20901 ) ) ( not ( = ?auto_20886 ?auto_20890 ) ) ( not ( = ?auto_20886 ?auto_20897 ) ) ( not ( = ?auto_20886 ?auto_20907 ) ) ( not ( = ?auto_20886 ?auto_20905 ) ) ( not ( = ?auto_20886 ?auto_20900 ) ) ( not ( = ?auto_20886 ?auto_20888 ) ) ( not ( = ?auto_20908 ?auto_20889 ) ) ( not ( = ?auto_20908 ?auto_20887 ) ) ( not ( = ?auto_20908 ?auto_20893 ) ) ( not ( = ?auto_20908 ?auto_20909 ) ) ( not ( = ?auto_20908 ?auto_20891 ) ) ( not ( = ?auto_20908 ?auto_20899 ) ) ( not ( = ?auto_20908 ?auto_20896 ) ) ( not ( = ?auto_20903 ?auto_20904 ) ) ( not ( = ?auto_20903 ?auto_20902 ) ) ( not ( = ?auto_20903 ?auto_20898 ) ) ( not ( = ?auto_20903 ?auto_20894 ) ) ( not ( = ?auto_20903 ?auto_20892 ) ) ( not ( = ?auto_20903 ?auto_20906 ) ) ( not ( = ?auto_20903 ?auto_20895 ) ) ( not ( = ?auto_20870 ?auto_20879 ) ) ( not ( = ?auto_20870 ?auto_20885 ) ) ( not ( = ?auto_20871 ?auto_20879 ) ) ( not ( = ?auto_20871 ?auto_20885 ) ) ( not ( = ?auto_20872 ?auto_20879 ) ) ( not ( = ?auto_20872 ?auto_20885 ) ) ( not ( = ?auto_20873 ?auto_20879 ) ) ( not ( = ?auto_20873 ?auto_20885 ) ) ( not ( = ?auto_20874 ?auto_20879 ) ) ( not ( = ?auto_20874 ?auto_20885 ) ) ( not ( = ?auto_20875 ?auto_20879 ) ) ( not ( = ?auto_20875 ?auto_20885 ) ) ( not ( = ?auto_20878 ?auto_20879 ) ) ( not ( = ?auto_20878 ?auto_20885 ) ) ( not ( = ?auto_20877 ?auto_20879 ) ) ( not ( = ?auto_20877 ?auto_20885 ) ) ( not ( = ?auto_20879 ?auto_20903 ) ) ( not ( = ?auto_20879 ?auto_20904 ) ) ( not ( = ?auto_20879 ?auto_20902 ) ) ( not ( = ?auto_20879 ?auto_20898 ) ) ( not ( = ?auto_20879 ?auto_20894 ) ) ( not ( = ?auto_20879 ?auto_20892 ) ) ( not ( = ?auto_20879 ?auto_20906 ) ) ( not ( = ?auto_20879 ?auto_20895 ) ) ( not ( = ?auto_20880 ?auto_20886 ) ) ( not ( = ?auto_20880 ?auto_20901 ) ) ( not ( = ?auto_20880 ?auto_20890 ) ) ( not ( = ?auto_20880 ?auto_20897 ) ) ( not ( = ?auto_20880 ?auto_20907 ) ) ( not ( = ?auto_20880 ?auto_20905 ) ) ( not ( = ?auto_20880 ?auto_20900 ) ) ( not ( = ?auto_20880 ?auto_20888 ) ) ( not ( = ?auto_20882 ?auto_20908 ) ) ( not ( = ?auto_20882 ?auto_20889 ) ) ( not ( = ?auto_20882 ?auto_20887 ) ) ( not ( = ?auto_20882 ?auto_20893 ) ) ( not ( = ?auto_20882 ?auto_20909 ) ) ( not ( = ?auto_20882 ?auto_20891 ) ) ( not ( = ?auto_20882 ?auto_20899 ) ) ( not ( = ?auto_20882 ?auto_20896 ) ) ( not ( = ?auto_20885 ?auto_20903 ) ) ( not ( = ?auto_20885 ?auto_20904 ) ) ( not ( = ?auto_20885 ?auto_20902 ) ) ( not ( = ?auto_20885 ?auto_20898 ) ) ( not ( = ?auto_20885 ?auto_20894 ) ) ( not ( = ?auto_20885 ?auto_20892 ) ) ( not ( = ?auto_20885 ?auto_20906 ) ) ( not ( = ?auto_20885 ?auto_20895 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 ?auto_20874 ?auto_20875 ?auto_20878 ?auto_20877 ?auto_20876 )
      ( MAKE-1CRATE ?auto_20876 ?auto_20879 )
      ( MAKE-9CRATE-VERIFY ?auto_20870 ?auto_20871 ?auto_20872 ?auto_20873 ?auto_20874 ?auto_20875 ?auto_20878 ?auto_20877 ?auto_20876 ?auto_20879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20912 - SURFACE
      ?auto_20913 - SURFACE
    )
    :vars
    (
      ?auto_20914 - HOIST
      ?auto_20915 - PLACE
      ?auto_20917 - PLACE
      ?auto_20918 - HOIST
      ?auto_20919 - SURFACE
      ?auto_20916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20914 ?auto_20915 ) ( SURFACE-AT ?auto_20912 ?auto_20915 ) ( CLEAR ?auto_20912 ) ( IS-CRATE ?auto_20913 ) ( AVAILABLE ?auto_20914 ) ( not ( = ?auto_20917 ?auto_20915 ) ) ( HOIST-AT ?auto_20918 ?auto_20917 ) ( AVAILABLE ?auto_20918 ) ( SURFACE-AT ?auto_20913 ?auto_20917 ) ( ON ?auto_20913 ?auto_20919 ) ( CLEAR ?auto_20913 ) ( TRUCK-AT ?auto_20916 ?auto_20915 ) ( not ( = ?auto_20912 ?auto_20913 ) ) ( not ( = ?auto_20912 ?auto_20919 ) ) ( not ( = ?auto_20913 ?auto_20919 ) ) ( not ( = ?auto_20914 ?auto_20918 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20916 ?auto_20915 ?auto_20917 )
      ( !LIFT ?auto_20918 ?auto_20913 ?auto_20919 ?auto_20917 )
      ( !LOAD ?auto_20918 ?auto_20913 ?auto_20916 ?auto_20917 )
      ( !DRIVE ?auto_20916 ?auto_20917 ?auto_20915 )
      ( !UNLOAD ?auto_20914 ?auto_20913 ?auto_20916 ?auto_20915 )
      ( !DROP ?auto_20914 ?auto_20913 ?auto_20912 ?auto_20915 )
      ( MAKE-1CRATE-VERIFY ?auto_20912 ?auto_20913 ) )
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
      ?auto_20939 - SURFACE
      ?auto_20938 - SURFACE
      ?auto_20937 - SURFACE
      ?auto_20940 - SURFACE
      ?auto_20941 - SURFACE
    )
    :vars
    (
      ?auto_20947 - HOIST
      ?auto_20942 - PLACE
      ?auto_20945 - PLACE
      ?auto_20946 - HOIST
      ?auto_20944 - SURFACE
      ?auto_20962 - PLACE
      ?auto_20967 - HOIST
      ?auto_20964 - SURFACE
      ?auto_20969 - PLACE
      ?auto_20966 - HOIST
      ?auto_20974 - SURFACE
      ?auto_20965 - PLACE
      ?auto_20973 - HOIST
      ?auto_20968 - SURFACE
      ?auto_20972 - PLACE
      ?auto_20949 - HOIST
      ?auto_20960 - SURFACE
      ?auto_20954 - PLACE
      ?auto_20951 - HOIST
      ?auto_20955 - SURFACE
      ?auto_20961 - PLACE
      ?auto_20956 - HOIST
      ?auto_20963 - SURFACE
      ?auto_20959 - PLACE
      ?auto_20948 - HOIST
      ?auto_20950 - SURFACE
      ?auto_20957 - PLACE
      ?auto_20952 - HOIST
      ?auto_20958 - SURFACE
      ?auto_20970 - PLACE
      ?auto_20971 - HOIST
      ?auto_20953 - SURFACE
      ?auto_20943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20947 ?auto_20942 ) ( IS-CRATE ?auto_20941 ) ( not ( = ?auto_20945 ?auto_20942 ) ) ( HOIST-AT ?auto_20946 ?auto_20945 ) ( AVAILABLE ?auto_20946 ) ( SURFACE-AT ?auto_20941 ?auto_20945 ) ( ON ?auto_20941 ?auto_20944 ) ( CLEAR ?auto_20941 ) ( not ( = ?auto_20940 ?auto_20941 ) ) ( not ( = ?auto_20940 ?auto_20944 ) ) ( not ( = ?auto_20941 ?auto_20944 ) ) ( not ( = ?auto_20947 ?auto_20946 ) ) ( IS-CRATE ?auto_20940 ) ( not ( = ?auto_20962 ?auto_20942 ) ) ( HOIST-AT ?auto_20967 ?auto_20962 ) ( AVAILABLE ?auto_20967 ) ( SURFACE-AT ?auto_20940 ?auto_20962 ) ( ON ?auto_20940 ?auto_20964 ) ( CLEAR ?auto_20940 ) ( not ( = ?auto_20937 ?auto_20940 ) ) ( not ( = ?auto_20937 ?auto_20964 ) ) ( not ( = ?auto_20940 ?auto_20964 ) ) ( not ( = ?auto_20947 ?auto_20967 ) ) ( IS-CRATE ?auto_20937 ) ( not ( = ?auto_20969 ?auto_20942 ) ) ( HOIST-AT ?auto_20966 ?auto_20969 ) ( AVAILABLE ?auto_20966 ) ( SURFACE-AT ?auto_20937 ?auto_20969 ) ( ON ?auto_20937 ?auto_20974 ) ( CLEAR ?auto_20937 ) ( not ( = ?auto_20938 ?auto_20937 ) ) ( not ( = ?auto_20938 ?auto_20974 ) ) ( not ( = ?auto_20937 ?auto_20974 ) ) ( not ( = ?auto_20947 ?auto_20966 ) ) ( IS-CRATE ?auto_20938 ) ( not ( = ?auto_20965 ?auto_20942 ) ) ( HOIST-AT ?auto_20973 ?auto_20965 ) ( AVAILABLE ?auto_20973 ) ( SURFACE-AT ?auto_20938 ?auto_20965 ) ( ON ?auto_20938 ?auto_20968 ) ( CLEAR ?auto_20938 ) ( not ( = ?auto_20939 ?auto_20938 ) ) ( not ( = ?auto_20939 ?auto_20968 ) ) ( not ( = ?auto_20938 ?auto_20968 ) ) ( not ( = ?auto_20947 ?auto_20973 ) ) ( IS-CRATE ?auto_20939 ) ( not ( = ?auto_20972 ?auto_20942 ) ) ( HOIST-AT ?auto_20949 ?auto_20972 ) ( AVAILABLE ?auto_20949 ) ( SURFACE-AT ?auto_20939 ?auto_20972 ) ( ON ?auto_20939 ?auto_20960 ) ( CLEAR ?auto_20939 ) ( not ( = ?auto_20936 ?auto_20939 ) ) ( not ( = ?auto_20936 ?auto_20960 ) ) ( not ( = ?auto_20939 ?auto_20960 ) ) ( not ( = ?auto_20947 ?auto_20949 ) ) ( IS-CRATE ?auto_20936 ) ( not ( = ?auto_20954 ?auto_20942 ) ) ( HOIST-AT ?auto_20951 ?auto_20954 ) ( AVAILABLE ?auto_20951 ) ( SURFACE-AT ?auto_20936 ?auto_20954 ) ( ON ?auto_20936 ?auto_20955 ) ( CLEAR ?auto_20936 ) ( not ( = ?auto_20935 ?auto_20936 ) ) ( not ( = ?auto_20935 ?auto_20955 ) ) ( not ( = ?auto_20936 ?auto_20955 ) ) ( not ( = ?auto_20947 ?auto_20951 ) ) ( IS-CRATE ?auto_20935 ) ( not ( = ?auto_20961 ?auto_20942 ) ) ( HOIST-AT ?auto_20956 ?auto_20961 ) ( AVAILABLE ?auto_20956 ) ( SURFACE-AT ?auto_20935 ?auto_20961 ) ( ON ?auto_20935 ?auto_20963 ) ( CLEAR ?auto_20935 ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( not ( = ?auto_20934 ?auto_20963 ) ) ( not ( = ?auto_20935 ?auto_20963 ) ) ( not ( = ?auto_20947 ?auto_20956 ) ) ( IS-CRATE ?auto_20934 ) ( not ( = ?auto_20959 ?auto_20942 ) ) ( HOIST-AT ?auto_20948 ?auto_20959 ) ( AVAILABLE ?auto_20948 ) ( SURFACE-AT ?auto_20934 ?auto_20959 ) ( ON ?auto_20934 ?auto_20950 ) ( CLEAR ?auto_20934 ) ( not ( = ?auto_20933 ?auto_20934 ) ) ( not ( = ?auto_20933 ?auto_20950 ) ) ( not ( = ?auto_20934 ?auto_20950 ) ) ( not ( = ?auto_20947 ?auto_20948 ) ) ( IS-CRATE ?auto_20933 ) ( not ( = ?auto_20957 ?auto_20942 ) ) ( HOIST-AT ?auto_20952 ?auto_20957 ) ( AVAILABLE ?auto_20952 ) ( SURFACE-AT ?auto_20933 ?auto_20957 ) ( ON ?auto_20933 ?auto_20958 ) ( CLEAR ?auto_20933 ) ( not ( = ?auto_20932 ?auto_20933 ) ) ( not ( = ?auto_20932 ?auto_20958 ) ) ( not ( = ?auto_20933 ?auto_20958 ) ) ( not ( = ?auto_20947 ?auto_20952 ) ) ( SURFACE-AT ?auto_20931 ?auto_20942 ) ( CLEAR ?auto_20931 ) ( IS-CRATE ?auto_20932 ) ( AVAILABLE ?auto_20947 ) ( not ( = ?auto_20970 ?auto_20942 ) ) ( HOIST-AT ?auto_20971 ?auto_20970 ) ( AVAILABLE ?auto_20971 ) ( SURFACE-AT ?auto_20932 ?auto_20970 ) ( ON ?auto_20932 ?auto_20953 ) ( CLEAR ?auto_20932 ) ( TRUCK-AT ?auto_20943 ?auto_20942 ) ( not ( = ?auto_20931 ?auto_20932 ) ) ( not ( = ?auto_20931 ?auto_20953 ) ) ( not ( = ?auto_20932 ?auto_20953 ) ) ( not ( = ?auto_20947 ?auto_20971 ) ) ( not ( = ?auto_20931 ?auto_20933 ) ) ( not ( = ?auto_20931 ?auto_20958 ) ) ( not ( = ?auto_20933 ?auto_20953 ) ) ( not ( = ?auto_20957 ?auto_20970 ) ) ( not ( = ?auto_20952 ?auto_20971 ) ) ( not ( = ?auto_20958 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20934 ) ) ( not ( = ?auto_20931 ?auto_20950 ) ) ( not ( = ?auto_20932 ?auto_20934 ) ) ( not ( = ?auto_20932 ?auto_20950 ) ) ( not ( = ?auto_20934 ?auto_20958 ) ) ( not ( = ?auto_20934 ?auto_20953 ) ) ( not ( = ?auto_20959 ?auto_20957 ) ) ( not ( = ?auto_20959 ?auto_20970 ) ) ( not ( = ?auto_20948 ?auto_20952 ) ) ( not ( = ?auto_20948 ?auto_20971 ) ) ( not ( = ?auto_20950 ?auto_20958 ) ) ( not ( = ?auto_20950 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20935 ) ) ( not ( = ?auto_20931 ?auto_20963 ) ) ( not ( = ?auto_20932 ?auto_20935 ) ) ( not ( = ?auto_20932 ?auto_20963 ) ) ( not ( = ?auto_20933 ?auto_20935 ) ) ( not ( = ?auto_20933 ?auto_20963 ) ) ( not ( = ?auto_20935 ?auto_20950 ) ) ( not ( = ?auto_20935 ?auto_20958 ) ) ( not ( = ?auto_20935 ?auto_20953 ) ) ( not ( = ?auto_20961 ?auto_20959 ) ) ( not ( = ?auto_20961 ?auto_20957 ) ) ( not ( = ?auto_20961 ?auto_20970 ) ) ( not ( = ?auto_20956 ?auto_20948 ) ) ( not ( = ?auto_20956 ?auto_20952 ) ) ( not ( = ?auto_20956 ?auto_20971 ) ) ( not ( = ?auto_20963 ?auto_20950 ) ) ( not ( = ?auto_20963 ?auto_20958 ) ) ( not ( = ?auto_20963 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20936 ) ) ( not ( = ?auto_20931 ?auto_20955 ) ) ( not ( = ?auto_20932 ?auto_20936 ) ) ( not ( = ?auto_20932 ?auto_20955 ) ) ( not ( = ?auto_20933 ?auto_20936 ) ) ( not ( = ?auto_20933 ?auto_20955 ) ) ( not ( = ?auto_20934 ?auto_20936 ) ) ( not ( = ?auto_20934 ?auto_20955 ) ) ( not ( = ?auto_20936 ?auto_20963 ) ) ( not ( = ?auto_20936 ?auto_20950 ) ) ( not ( = ?auto_20936 ?auto_20958 ) ) ( not ( = ?auto_20936 ?auto_20953 ) ) ( not ( = ?auto_20954 ?auto_20961 ) ) ( not ( = ?auto_20954 ?auto_20959 ) ) ( not ( = ?auto_20954 ?auto_20957 ) ) ( not ( = ?auto_20954 ?auto_20970 ) ) ( not ( = ?auto_20951 ?auto_20956 ) ) ( not ( = ?auto_20951 ?auto_20948 ) ) ( not ( = ?auto_20951 ?auto_20952 ) ) ( not ( = ?auto_20951 ?auto_20971 ) ) ( not ( = ?auto_20955 ?auto_20963 ) ) ( not ( = ?auto_20955 ?auto_20950 ) ) ( not ( = ?auto_20955 ?auto_20958 ) ) ( not ( = ?auto_20955 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20939 ) ) ( not ( = ?auto_20931 ?auto_20960 ) ) ( not ( = ?auto_20932 ?auto_20939 ) ) ( not ( = ?auto_20932 ?auto_20960 ) ) ( not ( = ?auto_20933 ?auto_20939 ) ) ( not ( = ?auto_20933 ?auto_20960 ) ) ( not ( = ?auto_20934 ?auto_20939 ) ) ( not ( = ?auto_20934 ?auto_20960 ) ) ( not ( = ?auto_20935 ?auto_20939 ) ) ( not ( = ?auto_20935 ?auto_20960 ) ) ( not ( = ?auto_20939 ?auto_20955 ) ) ( not ( = ?auto_20939 ?auto_20963 ) ) ( not ( = ?auto_20939 ?auto_20950 ) ) ( not ( = ?auto_20939 ?auto_20958 ) ) ( not ( = ?auto_20939 ?auto_20953 ) ) ( not ( = ?auto_20972 ?auto_20954 ) ) ( not ( = ?auto_20972 ?auto_20961 ) ) ( not ( = ?auto_20972 ?auto_20959 ) ) ( not ( = ?auto_20972 ?auto_20957 ) ) ( not ( = ?auto_20972 ?auto_20970 ) ) ( not ( = ?auto_20949 ?auto_20951 ) ) ( not ( = ?auto_20949 ?auto_20956 ) ) ( not ( = ?auto_20949 ?auto_20948 ) ) ( not ( = ?auto_20949 ?auto_20952 ) ) ( not ( = ?auto_20949 ?auto_20971 ) ) ( not ( = ?auto_20960 ?auto_20955 ) ) ( not ( = ?auto_20960 ?auto_20963 ) ) ( not ( = ?auto_20960 ?auto_20950 ) ) ( not ( = ?auto_20960 ?auto_20958 ) ) ( not ( = ?auto_20960 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20938 ) ) ( not ( = ?auto_20931 ?auto_20968 ) ) ( not ( = ?auto_20932 ?auto_20938 ) ) ( not ( = ?auto_20932 ?auto_20968 ) ) ( not ( = ?auto_20933 ?auto_20938 ) ) ( not ( = ?auto_20933 ?auto_20968 ) ) ( not ( = ?auto_20934 ?auto_20938 ) ) ( not ( = ?auto_20934 ?auto_20968 ) ) ( not ( = ?auto_20935 ?auto_20938 ) ) ( not ( = ?auto_20935 ?auto_20968 ) ) ( not ( = ?auto_20936 ?auto_20938 ) ) ( not ( = ?auto_20936 ?auto_20968 ) ) ( not ( = ?auto_20938 ?auto_20960 ) ) ( not ( = ?auto_20938 ?auto_20955 ) ) ( not ( = ?auto_20938 ?auto_20963 ) ) ( not ( = ?auto_20938 ?auto_20950 ) ) ( not ( = ?auto_20938 ?auto_20958 ) ) ( not ( = ?auto_20938 ?auto_20953 ) ) ( not ( = ?auto_20965 ?auto_20972 ) ) ( not ( = ?auto_20965 ?auto_20954 ) ) ( not ( = ?auto_20965 ?auto_20961 ) ) ( not ( = ?auto_20965 ?auto_20959 ) ) ( not ( = ?auto_20965 ?auto_20957 ) ) ( not ( = ?auto_20965 ?auto_20970 ) ) ( not ( = ?auto_20973 ?auto_20949 ) ) ( not ( = ?auto_20973 ?auto_20951 ) ) ( not ( = ?auto_20973 ?auto_20956 ) ) ( not ( = ?auto_20973 ?auto_20948 ) ) ( not ( = ?auto_20973 ?auto_20952 ) ) ( not ( = ?auto_20973 ?auto_20971 ) ) ( not ( = ?auto_20968 ?auto_20960 ) ) ( not ( = ?auto_20968 ?auto_20955 ) ) ( not ( = ?auto_20968 ?auto_20963 ) ) ( not ( = ?auto_20968 ?auto_20950 ) ) ( not ( = ?auto_20968 ?auto_20958 ) ) ( not ( = ?auto_20968 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20937 ) ) ( not ( = ?auto_20931 ?auto_20974 ) ) ( not ( = ?auto_20932 ?auto_20937 ) ) ( not ( = ?auto_20932 ?auto_20974 ) ) ( not ( = ?auto_20933 ?auto_20937 ) ) ( not ( = ?auto_20933 ?auto_20974 ) ) ( not ( = ?auto_20934 ?auto_20937 ) ) ( not ( = ?auto_20934 ?auto_20974 ) ) ( not ( = ?auto_20935 ?auto_20937 ) ) ( not ( = ?auto_20935 ?auto_20974 ) ) ( not ( = ?auto_20936 ?auto_20937 ) ) ( not ( = ?auto_20936 ?auto_20974 ) ) ( not ( = ?auto_20939 ?auto_20937 ) ) ( not ( = ?auto_20939 ?auto_20974 ) ) ( not ( = ?auto_20937 ?auto_20968 ) ) ( not ( = ?auto_20937 ?auto_20960 ) ) ( not ( = ?auto_20937 ?auto_20955 ) ) ( not ( = ?auto_20937 ?auto_20963 ) ) ( not ( = ?auto_20937 ?auto_20950 ) ) ( not ( = ?auto_20937 ?auto_20958 ) ) ( not ( = ?auto_20937 ?auto_20953 ) ) ( not ( = ?auto_20969 ?auto_20965 ) ) ( not ( = ?auto_20969 ?auto_20972 ) ) ( not ( = ?auto_20969 ?auto_20954 ) ) ( not ( = ?auto_20969 ?auto_20961 ) ) ( not ( = ?auto_20969 ?auto_20959 ) ) ( not ( = ?auto_20969 ?auto_20957 ) ) ( not ( = ?auto_20969 ?auto_20970 ) ) ( not ( = ?auto_20966 ?auto_20973 ) ) ( not ( = ?auto_20966 ?auto_20949 ) ) ( not ( = ?auto_20966 ?auto_20951 ) ) ( not ( = ?auto_20966 ?auto_20956 ) ) ( not ( = ?auto_20966 ?auto_20948 ) ) ( not ( = ?auto_20966 ?auto_20952 ) ) ( not ( = ?auto_20966 ?auto_20971 ) ) ( not ( = ?auto_20974 ?auto_20968 ) ) ( not ( = ?auto_20974 ?auto_20960 ) ) ( not ( = ?auto_20974 ?auto_20955 ) ) ( not ( = ?auto_20974 ?auto_20963 ) ) ( not ( = ?auto_20974 ?auto_20950 ) ) ( not ( = ?auto_20974 ?auto_20958 ) ) ( not ( = ?auto_20974 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20940 ) ) ( not ( = ?auto_20931 ?auto_20964 ) ) ( not ( = ?auto_20932 ?auto_20940 ) ) ( not ( = ?auto_20932 ?auto_20964 ) ) ( not ( = ?auto_20933 ?auto_20940 ) ) ( not ( = ?auto_20933 ?auto_20964 ) ) ( not ( = ?auto_20934 ?auto_20940 ) ) ( not ( = ?auto_20934 ?auto_20964 ) ) ( not ( = ?auto_20935 ?auto_20940 ) ) ( not ( = ?auto_20935 ?auto_20964 ) ) ( not ( = ?auto_20936 ?auto_20940 ) ) ( not ( = ?auto_20936 ?auto_20964 ) ) ( not ( = ?auto_20939 ?auto_20940 ) ) ( not ( = ?auto_20939 ?auto_20964 ) ) ( not ( = ?auto_20938 ?auto_20940 ) ) ( not ( = ?auto_20938 ?auto_20964 ) ) ( not ( = ?auto_20940 ?auto_20974 ) ) ( not ( = ?auto_20940 ?auto_20968 ) ) ( not ( = ?auto_20940 ?auto_20960 ) ) ( not ( = ?auto_20940 ?auto_20955 ) ) ( not ( = ?auto_20940 ?auto_20963 ) ) ( not ( = ?auto_20940 ?auto_20950 ) ) ( not ( = ?auto_20940 ?auto_20958 ) ) ( not ( = ?auto_20940 ?auto_20953 ) ) ( not ( = ?auto_20962 ?auto_20969 ) ) ( not ( = ?auto_20962 ?auto_20965 ) ) ( not ( = ?auto_20962 ?auto_20972 ) ) ( not ( = ?auto_20962 ?auto_20954 ) ) ( not ( = ?auto_20962 ?auto_20961 ) ) ( not ( = ?auto_20962 ?auto_20959 ) ) ( not ( = ?auto_20962 ?auto_20957 ) ) ( not ( = ?auto_20962 ?auto_20970 ) ) ( not ( = ?auto_20967 ?auto_20966 ) ) ( not ( = ?auto_20967 ?auto_20973 ) ) ( not ( = ?auto_20967 ?auto_20949 ) ) ( not ( = ?auto_20967 ?auto_20951 ) ) ( not ( = ?auto_20967 ?auto_20956 ) ) ( not ( = ?auto_20967 ?auto_20948 ) ) ( not ( = ?auto_20967 ?auto_20952 ) ) ( not ( = ?auto_20967 ?auto_20971 ) ) ( not ( = ?auto_20964 ?auto_20974 ) ) ( not ( = ?auto_20964 ?auto_20968 ) ) ( not ( = ?auto_20964 ?auto_20960 ) ) ( not ( = ?auto_20964 ?auto_20955 ) ) ( not ( = ?auto_20964 ?auto_20963 ) ) ( not ( = ?auto_20964 ?auto_20950 ) ) ( not ( = ?auto_20964 ?auto_20958 ) ) ( not ( = ?auto_20964 ?auto_20953 ) ) ( not ( = ?auto_20931 ?auto_20941 ) ) ( not ( = ?auto_20931 ?auto_20944 ) ) ( not ( = ?auto_20932 ?auto_20941 ) ) ( not ( = ?auto_20932 ?auto_20944 ) ) ( not ( = ?auto_20933 ?auto_20941 ) ) ( not ( = ?auto_20933 ?auto_20944 ) ) ( not ( = ?auto_20934 ?auto_20941 ) ) ( not ( = ?auto_20934 ?auto_20944 ) ) ( not ( = ?auto_20935 ?auto_20941 ) ) ( not ( = ?auto_20935 ?auto_20944 ) ) ( not ( = ?auto_20936 ?auto_20941 ) ) ( not ( = ?auto_20936 ?auto_20944 ) ) ( not ( = ?auto_20939 ?auto_20941 ) ) ( not ( = ?auto_20939 ?auto_20944 ) ) ( not ( = ?auto_20938 ?auto_20941 ) ) ( not ( = ?auto_20938 ?auto_20944 ) ) ( not ( = ?auto_20937 ?auto_20941 ) ) ( not ( = ?auto_20937 ?auto_20944 ) ) ( not ( = ?auto_20941 ?auto_20964 ) ) ( not ( = ?auto_20941 ?auto_20974 ) ) ( not ( = ?auto_20941 ?auto_20968 ) ) ( not ( = ?auto_20941 ?auto_20960 ) ) ( not ( = ?auto_20941 ?auto_20955 ) ) ( not ( = ?auto_20941 ?auto_20963 ) ) ( not ( = ?auto_20941 ?auto_20950 ) ) ( not ( = ?auto_20941 ?auto_20958 ) ) ( not ( = ?auto_20941 ?auto_20953 ) ) ( not ( = ?auto_20945 ?auto_20962 ) ) ( not ( = ?auto_20945 ?auto_20969 ) ) ( not ( = ?auto_20945 ?auto_20965 ) ) ( not ( = ?auto_20945 ?auto_20972 ) ) ( not ( = ?auto_20945 ?auto_20954 ) ) ( not ( = ?auto_20945 ?auto_20961 ) ) ( not ( = ?auto_20945 ?auto_20959 ) ) ( not ( = ?auto_20945 ?auto_20957 ) ) ( not ( = ?auto_20945 ?auto_20970 ) ) ( not ( = ?auto_20946 ?auto_20967 ) ) ( not ( = ?auto_20946 ?auto_20966 ) ) ( not ( = ?auto_20946 ?auto_20973 ) ) ( not ( = ?auto_20946 ?auto_20949 ) ) ( not ( = ?auto_20946 ?auto_20951 ) ) ( not ( = ?auto_20946 ?auto_20956 ) ) ( not ( = ?auto_20946 ?auto_20948 ) ) ( not ( = ?auto_20946 ?auto_20952 ) ) ( not ( = ?auto_20946 ?auto_20971 ) ) ( not ( = ?auto_20944 ?auto_20964 ) ) ( not ( = ?auto_20944 ?auto_20974 ) ) ( not ( = ?auto_20944 ?auto_20968 ) ) ( not ( = ?auto_20944 ?auto_20960 ) ) ( not ( = ?auto_20944 ?auto_20955 ) ) ( not ( = ?auto_20944 ?auto_20963 ) ) ( not ( = ?auto_20944 ?auto_20950 ) ) ( not ( = ?auto_20944 ?auto_20958 ) ) ( not ( = ?auto_20944 ?auto_20953 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20931 ?auto_20932 ?auto_20933 ?auto_20934 ?auto_20935 ?auto_20936 ?auto_20939 ?auto_20938 ?auto_20937 ?auto_20940 )
      ( MAKE-1CRATE ?auto_20940 ?auto_20941 )
      ( MAKE-10CRATE-VERIFY ?auto_20931 ?auto_20932 ?auto_20933 ?auto_20934 ?auto_20935 ?auto_20936 ?auto_20939 ?auto_20938 ?auto_20937 ?auto_20940 ?auto_20941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20977 - SURFACE
      ?auto_20978 - SURFACE
    )
    :vars
    (
      ?auto_20979 - HOIST
      ?auto_20980 - PLACE
      ?auto_20982 - PLACE
      ?auto_20983 - HOIST
      ?auto_20984 - SURFACE
      ?auto_20981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20979 ?auto_20980 ) ( SURFACE-AT ?auto_20977 ?auto_20980 ) ( CLEAR ?auto_20977 ) ( IS-CRATE ?auto_20978 ) ( AVAILABLE ?auto_20979 ) ( not ( = ?auto_20982 ?auto_20980 ) ) ( HOIST-AT ?auto_20983 ?auto_20982 ) ( AVAILABLE ?auto_20983 ) ( SURFACE-AT ?auto_20978 ?auto_20982 ) ( ON ?auto_20978 ?auto_20984 ) ( CLEAR ?auto_20978 ) ( TRUCK-AT ?auto_20981 ?auto_20980 ) ( not ( = ?auto_20977 ?auto_20978 ) ) ( not ( = ?auto_20977 ?auto_20984 ) ) ( not ( = ?auto_20978 ?auto_20984 ) ) ( not ( = ?auto_20979 ?auto_20983 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20981 ?auto_20980 ?auto_20982 )
      ( !LIFT ?auto_20983 ?auto_20978 ?auto_20984 ?auto_20982 )
      ( !LOAD ?auto_20983 ?auto_20978 ?auto_20981 ?auto_20982 )
      ( !DRIVE ?auto_20981 ?auto_20982 ?auto_20980 )
      ( !UNLOAD ?auto_20979 ?auto_20978 ?auto_20981 ?auto_20980 )
      ( !DROP ?auto_20979 ?auto_20978 ?auto_20977 ?auto_20980 )
      ( MAKE-1CRATE-VERIFY ?auto_20977 ?auto_20978 ) )
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
      ?auto_21005 - SURFACE
      ?auto_21004 - SURFACE
      ?auto_21003 - SURFACE
      ?auto_21006 - SURFACE
      ?auto_21008 - SURFACE
      ?auto_21007 - SURFACE
    )
    :vars
    (
      ?auto_21010 - HOIST
      ?auto_21009 - PLACE
      ?auto_21012 - PLACE
      ?auto_21011 - HOIST
      ?auto_21014 - SURFACE
      ?auto_21040 - PLACE
      ?auto_21036 - HOIST
      ?auto_21026 - SURFACE
      ?auto_21038 - PLACE
      ?auto_21042 - HOIST
      ?auto_21018 - SURFACE
      ?auto_21022 - PLACE
      ?auto_21017 - HOIST
      ?auto_21029 - SURFACE
      ?auto_21015 - PLACE
      ?auto_21024 - HOIST
      ?auto_21021 - SURFACE
      ?auto_21030 - PLACE
      ?auto_21032 - HOIST
      ?auto_21033 - SURFACE
      ?auto_21037 - PLACE
      ?auto_21028 - HOIST
      ?auto_21020 - SURFACE
      ?auto_21035 - PLACE
      ?auto_21023 - HOIST
      ?auto_21031 - SURFACE
      ?auto_21019 - SURFACE
      ?auto_21025 - PLACE
      ?auto_21016 - HOIST
      ?auto_21034 - SURFACE
      ?auto_21041 - PLACE
      ?auto_21039 - HOIST
      ?auto_21027 - SURFACE
      ?auto_21013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21010 ?auto_21009 ) ( IS-CRATE ?auto_21007 ) ( not ( = ?auto_21012 ?auto_21009 ) ) ( HOIST-AT ?auto_21011 ?auto_21012 ) ( SURFACE-AT ?auto_21007 ?auto_21012 ) ( ON ?auto_21007 ?auto_21014 ) ( CLEAR ?auto_21007 ) ( not ( = ?auto_21008 ?auto_21007 ) ) ( not ( = ?auto_21008 ?auto_21014 ) ) ( not ( = ?auto_21007 ?auto_21014 ) ) ( not ( = ?auto_21010 ?auto_21011 ) ) ( IS-CRATE ?auto_21008 ) ( not ( = ?auto_21040 ?auto_21009 ) ) ( HOIST-AT ?auto_21036 ?auto_21040 ) ( AVAILABLE ?auto_21036 ) ( SURFACE-AT ?auto_21008 ?auto_21040 ) ( ON ?auto_21008 ?auto_21026 ) ( CLEAR ?auto_21008 ) ( not ( = ?auto_21006 ?auto_21008 ) ) ( not ( = ?auto_21006 ?auto_21026 ) ) ( not ( = ?auto_21008 ?auto_21026 ) ) ( not ( = ?auto_21010 ?auto_21036 ) ) ( IS-CRATE ?auto_21006 ) ( not ( = ?auto_21038 ?auto_21009 ) ) ( HOIST-AT ?auto_21042 ?auto_21038 ) ( AVAILABLE ?auto_21042 ) ( SURFACE-AT ?auto_21006 ?auto_21038 ) ( ON ?auto_21006 ?auto_21018 ) ( CLEAR ?auto_21006 ) ( not ( = ?auto_21003 ?auto_21006 ) ) ( not ( = ?auto_21003 ?auto_21018 ) ) ( not ( = ?auto_21006 ?auto_21018 ) ) ( not ( = ?auto_21010 ?auto_21042 ) ) ( IS-CRATE ?auto_21003 ) ( not ( = ?auto_21022 ?auto_21009 ) ) ( HOIST-AT ?auto_21017 ?auto_21022 ) ( AVAILABLE ?auto_21017 ) ( SURFACE-AT ?auto_21003 ?auto_21022 ) ( ON ?auto_21003 ?auto_21029 ) ( CLEAR ?auto_21003 ) ( not ( = ?auto_21004 ?auto_21003 ) ) ( not ( = ?auto_21004 ?auto_21029 ) ) ( not ( = ?auto_21003 ?auto_21029 ) ) ( not ( = ?auto_21010 ?auto_21017 ) ) ( IS-CRATE ?auto_21004 ) ( not ( = ?auto_21015 ?auto_21009 ) ) ( HOIST-AT ?auto_21024 ?auto_21015 ) ( AVAILABLE ?auto_21024 ) ( SURFACE-AT ?auto_21004 ?auto_21015 ) ( ON ?auto_21004 ?auto_21021 ) ( CLEAR ?auto_21004 ) ( not ( = ?auto_21005 ?auto_21004 ) ) ( not ( = ?auto_21005 ?auto_21021 ) ) ( not ( = ?auto_21004 ?auto_21021 ) ) ( not ( = ?auto_21010 ?auto_21024 ) ) ( IS-CRATE ?auto_21005 ) ( not ( = ?auto_21030 ?auto_21009 ) ) ( HOIST-AT ?auto_21032 ?auto_21030 ) ( AVAILABLE ?auto_21032 ) ( SURFACE-AT ?auto_21005 ?auto_21030 ) ( ON ?auto_21005 ?auto_21033 ) ( CLEAR ?auto_21005 ) ( not ( = ?auto_21002 ?auto_21005 ) ) ( not ( = ?auto_21002 ?auto_21033 ) ) ( not ( = ?auto_21005 ?auto_21033 ) ) ( not ( = ?auto_21010 ?auto_21032 ) ) ( IS-CRATE ?auto_21002 ) ( not ( = ?auto_21037 ?auto_21009 ) ) ( HOIST-AT ?auto_21028 ?auto_21037 ) ( AVAILABLE ?auto_21028 ) ( SURFACE-AT ?auto_21002 ?auto_21037 ) ( ON ?auto_21002 ?auto_21020 ) ( CLEAR ?auto_21002 ) ( not ( = ?auto_21001 ?auto_21002 ) ) ( not ( = ?auto_21001 ?auto_21020 ) ) ( not ( = ?auto_21002 ?auto_21020 ) ) ( not ( = ?auto_21010 ?auto_21028 ) ) ( IS-CRATE ?auto_21001 ) ( not ( = ?auto_21035 ?auto_21009 ) ) ( HOIST-AT ?auto_21023 ?auto_21035 ) ( AVAILABLE ?auto_21023 ) ( SURFACE-AT ?auto_21001 ?auto_21035 ) ( ON ?auto_21001 ?auto_21031 ) ( CLEAR ?auto_21001 ) ( not ( = ?auto_21000 ?auto_21001 ) ) ( not ( = ?auto_21000 ?auto_21031 ) ) ( not ( = ?auto_21001 ?auto_21031 ) ) ( not ( = ?auto_21010 ?auto_21023 ) ) ( IS-CRATE ?auto_21000 ) ( AVAILABLE ?auto_21011 ) ( SURFACE-AT ?auto_21000 ?auto_21012 ) ( ON ?auto_21000 ?auto_21019 ) ( CLEAR ?auto_21000 ) ( not ( = ?auto_20999 ?auto_21000 ) ) ( not ( = ?auto_20999 ?auto_21019 ) ) ( not ( = ?auto_21000 ?auto_21019 ) ) ( IS-CRATE ?auto_20999 ) ( not ( = ?auto_21025 ?auto_21009 ) ) ( HOIST-AT ?auto_21016 ?auto_21025 ) ( AVAILABLE ?auto_21016 ) ( SURFACE-AT ?auto_20999 ?auto_21025 ) ( ON ?auto_20999 ?auto_21034 ) ( CLEAR ?auto_20999 ) ( not ( = ?auto_20998 ?auto_20999 ) ) ( not ( = ?auto_20998 ?auto_21034 ) ) ( not ( = ?auto_20999 ?auto_21034 ) ) ( not ( = ?auto_21010 ?auto_21016 ) ) ( SURFACE-AT ?auto_20997 ?auto_21009 ) ( CLEAR ?auto_20997 ) ( IS-CRATE ?auto_20998 ) ( AVAILABLE ?auto_21010 ) ( not ( = ?auto_21041 ?auto_21009 ) ) ( HOIST-AT ?auto_21039 ?auto_21041 ) ( AVAILABLE ?auto_21039 ) ( SURFACE-AT ?auto_20998 ?auto_21041 ) ( ON ?auto_20998 ?auto_21027 ) ( CLEAR ?auto_20998 ) ( TRUCK-AT ?auto_21013 ?auto_21009 ) ( not ( = ?auto_20997 ?auto_20998 ) ) ( not ( = ?auto_20997 ?auto_21027 ) ) ( not ( = ?auto_20998 ?auto_21027 ) ) ( not ( = ?auto_21010 ?auto_21039 ) ) ( not ( = ?auto_20997 ?auto_20999 ) ) ( not ( = ?auto_20997 ?auto_21034 ) ) ( not ( = ?auto_20999 ?auto_21027 ) ) ( not ( = ?auto_21025 ?auto_21041 ) ) ( not ( = ?auto_21016 ?auto_21039 ) ) ( not ( = ?auto_21034 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21000 ) ) ( not ( = ?auto_20997 ?auto_21019 ) ) ( not ( = ?auto_20998 ?auto_21000 ) ) ( not ( = ?auto_20998 ?auto_21019 ) ) ( not ( = ?auto_21000 ?auto_21034 ) ) ( not ( = ?auto_21000 ?auto_21027 ) ) ( not ( = ?auto_21012 ?auto_21025 ) ) ( not ( = ?auto_21012 ?auto_21041 ) ) ( not ( = ?auto_21011 ?auto_21016 ) ) ( not ( = ?auto_21011 ?auto_21039 ) ) ( not ( = ?auto_21019 ?auto_21034 ) ) ( not ( = ?auto_21019 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21001 ) ) ( not ( = ?auto_20997 ?auto_21031 ) ) ( not ( = ?auto_20998 ?auto_21001 ) ) ( not ( = ?auto_20998 ?auto_21031 ) ) ( not ( = ?auto_20999 ?auto_21001 ) ) ( not ( = ?auto_20999 ?auto_21031 ) ) ( not ( = ?auto_21001 ?auto_21019 ) ) ( not ( = ?auto_21001 ?auto_21034 ) ) ( not ( = ?auto_21001 ?auto_21027 ) ) ( not ( = ?auto_21035 ?auto_21012 ) ) ( not ( = ?auto_21035 ?auto_21025 ) ) ( not ( = ?auto_21035 ?auto_21041 ) ) ( not ( = ?auto_21023 ?auto_21011 ) ) ( not ( = ?auto_21023 ?auto_21016 ) ) ( not ( = ?auto_21023 ?auto_21039 ) ) ( not ( = ?auto_21031 ?auto_21019 ) ) ( not ( = ?auto_21031 ?auto_21034 ) ) ( not ( = ?auto_21031 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21002 ) ) ( not ( = ?auto_20997 ?auto_21020 ) ) ( not ( = ?auto_20998 ?auto_21002 ) ) ( not ( = ?auto_20998 ?auto_21020 ) ) ( not ( = ?auto_20999 ?auto_21002 ) ) ( not ( = ?auto_20999 ?auto_21020 ) ) ( not ( = ?auto_21000 ?auto_21002 ) ) ( not ( = ?auto_21000 ?auto_21020 ) ) ( not ( = ?auto_21002 ?auto_21031 ) ) ( not ( = ?auto_21002 ?auto_21019 ) ) ( not ( = ?auto_21002 ?auto_21034 ) ) ( not ( = ?auto_21002 ?auto_21027 ) ) ( not ( = ?auto_21037 ?auto_21035 ) ) ( not ( = ?auto_21037 ?auto_21012 ) ) ( not ( = ?auto_21037 ?auto_21025 ) ) ( not ( = ?auto_21037 ?auto_21041 ) ) ( not ( = ?auto_21028 ?auto_21023 ) ) ( not ( = ?auto_21028 ?auto_21011 ) ) ( not ( = ?auto_21028 ?auto_21016 ) ) ( not ( = ?auto_21028 ?auto_21039 ) ) ( not ( = ?auto_21020 ?auto_21031 ) ) ( not ( = ?auto_21020 ?auto_21019 ) ) ( not ( = ?auto_21020 ?auto_21034 ) ) ( not ( = ?auto_21020 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21005 ) ) ( not ( = ?auto_20997 ?auto_21033 ) ) ( not ( = ?auto_20998 ?auto_21005 ) ) ( not ( = ?auto_20998 ?auto_21033 ) ) ( not ( = ?auto_20999 ?auto_21005 ) ) ( not ( = ?auto_20999 ?auto_21033 ) ) ( not ( = ?auto_21000 ?auto_21005 ) ) ( not ( = ?auto_21000 ?auto_21033 ) ) ( not ( = ?auto_21001 ?auto_21005 ) ) ( not ( = ?auto_21001 ?auto_21033 ) ) ( not ( = ?auto_21005 ?auto_21020 ) ) ( not ( = ?auto_21005 ?auto_21031 ) ) ( not ( = ?auto_21005 ?auto_21019 ) ) ( not ( = ?auto_21005 ?auto_21034 ) ) ( not ( = ?auto_21005 ?auto_21027 ) ) ( not ( = ?auto_21030 ?auto_21037 ) ) ( not ( = ?auto_21030 ?auto_21035 ) ) ( not ( = ?auto_21030 ?auto_21012 ) ) ( not ( = ?auto_21030 ?auto_21025 ) ) ( not ( = ?auto_21030 ?auto_21041 ) ) ( not ( = ?auto_21032 ?auto_21028 ) ) ( not ( = ?auto_21032 ?auto_21023 ) ) ( not ( = ?auto_21032 ?auto_21011 ) ) ( not ( = ?auto_21032 ?auto_21016 ) ) ( not ( = ?auto_21032 ?auto_21039 ) ) ( not ( = ?auto_21033 ?auto_21020 ) ) ( not ( = ?auto_21033 ?auto_21031 ) ) ( not ( = ?auto_21033 ?auto_21019 ) ) ( not ( = ?auto_21033 ?auto_21034 ) ) ( not ( = ?auto_21033 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21004 ) ) ( not ( = ?auto_20997 ?auto_21021 ) ) ( not ( = ?auto_20998 ?auto_21004 ) ) ( not ( = ?auto_20998 ?auto_21021 ) ) ( not ( = ?auto_20999 ?auto_21004 ) ) ( not ( = ?auto_20999 ?auto_21021 ) ) ( not ( = ?auto_21000 ?auto_21004 ) ) ( not ( = ?auto_21000 ?auto_21021 ) ) ( not ( = ?auto_21001 ?auto_21004 ) ) ( not ( = ?auto_21001 ?auto_21021 ) ) ( not ( = ?auto_21002 ?auto_21004 ) ) ( not ( = ?auto_21002 ?auto_21021 ) ) ( not ( = ?auto_21004 ?auto_21033 ) ) ( not ( = ?auto_21004 ?auto_21020 ) ) ( not ( = ?auto_21004 ?auto_21031 ) ) ( not ( = ?auto_21004 ?auto_21019 ) ) ( not ( = ?auto_21004 ?auto_21034 ) ) ( not ( = ?auto_21004 ?auto_21027 ) ) ( not ( = ?auto_21015 ?auto_21030 ) ) ( not ( = ?auto_21015 ?auto_21037 ) ) ( not ( = ?auto_21015 ?auto_21035 ) ) ( not ( = ?auto_21015 ?auto_21012 ) ) ( not ( = ?auto_21015 ?auto_21025 ) ) ( not ( = ?auto_21015 ?auto_21041 ) ) ( not ( = ?auto_21024 ?auto_21032 ) ) ( not ( = ?auto_21024 ?auto_21028 ) ) ( not ( = ?auto_21024 ?auto_21023 ) ) ( not ( = ?auto_21024 ?auto_21011 ) ) ( not ( = ?auto_21024 ?auto_21016 ) ) ( not ( = ?auto_21024 ?auto_21039 ) ) ( not ( = ?auto_21021 ?auto_21033 ) ) ( not ( = ?auto_21021 ?auto_21020 ) ) ( not ( = ?auto_21021 ?auto_21031 ) ) ( not ( = ?auto_21021 ?auto_21019 ) ) ( not ( = ?auto_21021 ?auto_21034 ) ) ( not ( = ?auto_21021 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21003 ) ) ( not ( = ?auto_20997 ?auto_21029 ) ) ( not ( = ?auto_20998 ?auto_21003 ) ) ( not ( = ?auto_20998 ?auto_21029 ) ) ( not ( = ?auto_20999 ?auto_21003 ) ) ( not ( = ?auto_20999 ?auto_21029 ) ) ( not ( = ?auto_21000 ?auto_21003 ) ) ( not ( = ?auto_21000 ?auto_21029 ) ) ( not ( = ?auto_21001 ?auto_21003 ) ) ( not ( = ?auto_21001 ?auto_21029 ) ) ( not ( = ?auto_21002 ?auto_21003 ) ) ( not ( = ?auto_21002 ?auto_21029 ) ) ( not ( = ?auto_21005 ?auto_21003 ) ) ( not ( = ?auto_21005 ?auto_21029 ) ) ( not ( = ?auto_21003 ?auto_21021 ) ) ( not ( = ?auto_21003 ?auto_21033 ) ) ( not ( = ?auto_21003 ?auto_21020 ) ) ( not ( = ?auto_21003 ?auto_21031 ) ) ( not ( = ?auto_21003 ?auto_21019 ) ) ( not ( = ?auto_21003 ?auto_21034 ) ) ( not ( = ?auto_21003 ?auto_21027 ) ) ( not ( = ?auto_21022 ?auto_21015 ) ) ( not ( = ?auto_21022 ?auto_21030 ) ) ( not ( = ?auto_21022 ?auto_21037 ) ) ( not ( = ?auto_21022 ?auto_21035 ) ) ( not ( = ?auto_21022 ?auto_21012 ) ) ( not ( = ?auto_21022 ?auto_21025 ) ) ( not ( = ?auto_21022 ?auto_21041 ) ) ( not ( = ?auto_21017 ?auto_21024 ) ) ( not ( = ?auto_21017 ?auto_21032 ) ) ( not ( = ?auto_21017 ?auto_21028 ) ) ( not ( = ?auto_21017 ?auto_21023 ) ) ( not ( = ?auto_21017 ?auto_21011 ) ) ( not ( = ?auto_21017 ?auto_21016 ) ) ( not ( = ?auto_21017 ?auto_21039 ) ) ( not ( = ?auto_21029 ?auto_21021 ) ) ( not ( = ?auto_21029 ?auto_21033 ) ) ( not ( = ?auto_21029 ?auto_21020 ) ) ( not ( = ?auto_21029 ?auto_21031 ) ) ( not ( = ?auto_21029 ?auto_21019 ) ) ( not ( = ?auto_21029 ?auto_21034 ) ) ( not ( = ?auto_21029 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21006 ) ) ( not ( = ?auto_20997 ?auto_21018 ) ) ( not ( = ?auto_20998 ?auto_21006 ) ) ( not ( = ?auto_20998 ?auto_21018 ) ) ( not ( = ?auto_20999 ?auto_21006 ) ) ( not ( = ?auto_20999 ?auto_21018 ) ) ( not ( = ?auto_21000 ?auto_21006 ) ) ( not ( = ?auto_21000 ?auto_21018 ) ) ( not ( = ?auto_21001 ?auto_21006 ) ) ( not ( = ?auto_21001 ?auto_21018 ) ) ( not ( = ?auto_21002 ?auto_21006 ) ) ( not ( = ?auto_21002 ?auto_21018 ) ) ( not ( = ?auto_21005 ?auto_21006 ) ) ( not ( = ?auto_21005 ?auto_21018 ) ) ( not ( = ?auto_21004 ?auto_21006 ) ) ( not ( = ?auto_21004 ?auto_21018 ) ) ( not ( = ?auto_21006 ?auto_21029 ) ) ( not ( = ?auto_21006 ?auto_21021 ) ) ( not ( = ?auto_21006 ?auto_21033 ) ) ( not ( = ?auto_21006 ?auto_21020 ) ) ( not ( = ?auto_21006 ?auto_21031 ) ) ( not ( = ?auto_21006 ?auto_21019 ) ) ( not ( = ?auto_21006 ?auto_21034 ) ) ( not ( = ?auto_21006 ?auto_21027 ) ) ( not ( = ?auto_21038 ?auto_21022 ) ) ( not ( = ?auto_21038 ?auto_21015 ) ) ( not ( = ?auto_21038 ?auto_21030 ) ) ( not ( = ?auto_21038 ?auto_21037 ) ) ( not ( = ?auto_21038 ?auto_21035 ) ) ( not ( = ?auto_21038 ?auto_21012 ) ) ( not ( = ?auto_21038 ?auto_21025 ) ) ( not ( = ?auto_21038 ?auto_21041 ) ) ( not ( = ?auto_21042 ?auto_21017 ) ) ( not ( = ?auto_21042 ?auto_21024 ) ) ( not ( = ?auto_21042 ?auto_21032 ) ) ( not ( = ?auto_21042 ?auto_21028 ) ) ( not ( = ?auto_21042 ?auto_21023 ) ) ( not ( = ?auto_21042 ?auto_21011 ) ) ( not ( = ?auto_21042 ?auto_21016 ) ) ( not ( = ?auto_21042 ?auto_21039 ) ) ( not ( = ?auto_21018 ?auto_21029 ) ) ( not ( = ?auto_21018 ?auto_21021 ) ) ( not ( = ?auto_21018 ?auto_21033 ) ) ( not ( = ?auto_21018 ?auto_21020 ) ) ( not ( = ?auto_21018 ?auto_21031 ) ) ( not ( = ?auto_21018 ?auto_21019 ) ) ( not ( = ?auto_21018 ?auto_21034 ) ) ( not ( = ?auto_21018 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21008 ) ) ( not ( = ?auto_20997 ?auto_21026 ) ) ( not ( = ?auto_20998 ?auto_21008 ) ) ( not ( = ?auto_20998 ?auto_21026 ) ) ( not ( = ?auto_20999 ?auto_21008 ) ) ( not ( = ?auto_20999 ?auto_21026 ) ) ( not ( = ?auto_21000 ?auto_21008 ) ) ( not ( = ?auto_21000 ?auto_21026 ) ) ( not ( = ?auto_21001 ?auto_21008 ) ) ( not ( = ?auto_21001 ?auto_21026 ) ) ( not ( = ?auto_21002 ?auto_21008 ) ) ( not ( = ?auto_21002 ?auto_21026 ) ) ( not ( = ?auto_21005 ?auto_21008 ) ) ( not ( = ?auto_21005 ?auto_21026 ) ) ( not ( = ?auto_21004 ?auto_21008 ) ) ( not ( = ?auto_21004 ?auto_21026 ) ) ( not ( = ?auto_21003 ?auto_21008 ) ) ( not ( = ?auto_21003 ?auto_21026 ) ) ( not ( = ?auto_21008 ?auto_21018 ) ) ( not ( = ?auto_21008 ?auto_21029 ) ) ( not ( = ?auto_21008 ?auto_21021 ) ) ( not ( = ?auto_21008 ?auto_21033 ) ) ( not ( = ?auto_21008 ?auto_21020 ) ) ( not ( = ?auto_21008 ?auto_21031 ) ) ( not ( = ?auto_21008 ?auto_21019 ) ) ( not ( = ?auto_21008 ?auto_21034 ) ) ( not ( = ?auto_21008 ?auto_21027 ) ) ( not ( = ?auto_21040 ?auto_21038 ) ) ( not ( = ?auto_21040 ?auto_21022 ) ) ( not ( = ?auto_21040 ?auto_21015 ) ) ( not ( = ?auto_21040 ?auto_21030 ) ) ( not ( = ?auto_21040 ?auto_21037 ) ) ( not ( = ?auto_21040 ?auto_21035 ) ) ( not ( = ?auto_21040 ?auto_21012 ) ) ( not ( = ?auto_21040 ?auto_21025 ) ) ( not ( = ?auto_21040 ?auto_21041 ) ) ( not ( = ?auto_21036 ?auto_21042 ) ) ( not ( = ?auto_21036 ?auto_21017 ) ) ( not ( = ?auto_21036 ?auto_21024 ) ) ( not ( = ?auto_21036 ?auto_21032 ) ) ( not ( = ?auto_21036 ?auto_21028 ) ) ( not ( = ?auto_21036 ?auto_21023 ) ) ( not ( = ?auto_21036 ?auto_21011 ) ) ( not ( = ?auto_21036 ?auto_21016 ) ) ( not ( = ?auto_21036 ?auto_21039 ) ) ( not ( = ?auto_21026 ?auto_21018 ) ) ( not ( = ?auto_21026 ?auto_21029 ) ) ( not ( = ?auto_21026 ?auto_21021 ) ) ( not ( = ?auto_21026 ?auto_21033 ) ) ( not ( = ?auto_21026 ?auto_21020 ) ) ( not ( = ?auto_21026 ?auto_21031 ) ) ( not ( = ?auto_21026 ?auto_21019 ) ) ( not ( = ?auto_21026 ?auto_21034 ) ) ( not ( = ?auto_21026 ?auto_21027 ) ) ( not ( = ?auto_20997 ?auto_21007 ) ) ( not ( = ?auto_20997 ?auto_21014 ) ) ( not ( = ?auto_20998 ?auto_21007 ) ) ( not ( = ?auto_20998 ?auto_21014 ) ) ( not ( = ?auto_20999 ?auto_21007 ) ) ( not ( = ?auto_20999 ?auto_21014 ) ) ( not ( = ?auto_21000 ?auto_21007 ) ) ( not ( = ?auto_21000 ?auto_21014 ) ) ( not ( = ?auto_21001 ?auto_21007 ) ) ( not ( = ?auto_21001 ?auto_21014 ) ) ( not ( = ?auto_21002 ?auto_21007 ) ) ( not ( = ?auto_21002 ?auto_21014 ) ) ( not ( = ?auto_21005 ?auto_21007 ) ) ( not ( = ?auto_21005 ?auto_21014 ) ) ( not ( = ?auto_21004 ?auto_21007 ) ) ( not ( = ?auto_21004 ?auto_21014 ) ) ( not ( = ?auto_21003 ?auto_21007 ) ) ( not ( = ?auto_21003 ?auto_21014 ) ) ( not ( = ?auto_21006 ?auto_21007 ) ) ( not ( = ?auto_21006 ?auto_21014 ) ) ( not ( = ?auto_21007 ?auto_21026 ) ) ( not ( = ?auto_21007 ?auto_21018 ) ) ( not ( = ?auto_21007 ?auto_21029 ) ) ( not ( = ?auto_21007 ?auto_21021 ) ) ( not ( = ?auto_21007 ?auto_21033 ) ) ( not ( = ?auto_21007 ?auto_21020 ) ) ( not ( = ?auto_21007 ?auto_21031 ) ) ( not ( = ?auto_21007 ?auto_21019 ) ) ( not ( = ?auto_21007 ?auto_21034 ) ) ( not ( = ?auto_21007 ?auto_21027 ) ) ( not ( = ?auto_21014 ?auto_21026 ) ) ( not ( = ?auto_21014 ?auto_21018 ) ) ( not ( = ?auto_21014 ?auto_21029 ) ) ( not ( = ?auto_21014 ?auto_21021 ) ) ( not ( = ?auto_21014 ?auto_21033 ) ) ( not ( = ?auto_21014 ?auto_21020 ) ) ( not ( = ?auto_21014 ?auto_21031 ) ) ( not ( = ?auto_21014 ?auto_21019 ) ) ( not ( = ?auto_21014 ?auto_21034 ) ) ( not ( = ?auto_21014 ?auto_21027 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20997 ?auto_20998 ?auto_20999 ?auto_21000 ?auto_21001 ?auto_21002 ?auto_21005 ?auto_21004 ?auto_21003 ?auto_21006 ?auto_21008 )
      ( MAKE-1CRATE ?auto_21008 ?auto_21007 )
      ( MAKE-11CRATE-VERIFY ?auto_20997 ?auto_20998 ?auto_20999 ?auto_21000 ?auto_21001 ?auto_21002 ?auto_21005 ?auto_21004 ?auto_21003 ?auto_21006 ?auto_21008 ?auto_21007 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21045 - SURFACE
      ?auto_21046 - SURFACE
    )
    :vars
    (
      ?auto_21047 - HOIST
      ?auto_21048 - PLACE
      ?auto_21050 - PLACE
      ?auto_21051 - HOIST
      ?auto_21052 - SURFACE
      ?auto_21049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21047 ?auto_21048 ) ( SURFACE-AT ?auto_21045 ?auto_21048 ) ( CLEAR ?auto_21045 ) ( IS-CRATE ?auto_21046 ) ( AVAILABLE ?auto_21047 ) ( not ( = ?auto_21050 ?auto_21048 ) ) ( HOIST-AT ?auto_21051 ?auto_21050 ) ( AVAILABLE ?auto_21051 ) ( SURFACE-AT ?auto_21046 ?auto_21050 ) ( ON ?auto_21046 ?auto_21052 ) ( CLEAR ?auto_21046 ) ( TRUCK-AT ?auto_21049 ?auto_21048 ) ( not ( = ?auto_21045 ?auto_21046 ) ) ( not ( = ?auto_21045 ?auto_21052 ) ) ( not ( = ?auto_21046 ?auto_21052 ) ) ( not ( = ?auto_21047 ?auto_21051 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21049 ?auto_21048 ?auto_21050 )
      ( !LIFT ?auto_21051 ?auto_21046 ?auto_21052 ?auto_21050 )
      ( !LOAD ?auto_21051 ?auto_21046 ?auto_21049 ?auto_21050 )
      ( !DRIVE ?auto_21049 ?auto_21050 ?auto_21048 )
      ( !UNLOAD ?auto_21047 ?auto_21046 ?auto_21049 ?auto_21048 )
      ( !DROP ?auto_21047 ?auto_21046 ?auto_21045 ?auto_21048 )
      ( MAKE-1CRATE-VERIFY ?auto_21045 ?auto_21046 ) )
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
      ?auto_21074 - SURFACE
      ?auto_21073 - SURFACE
      ?auto_21072 - SURFACE
      ?auto_21075 - SURFACE
      ?auto_21077 - SURFACE
      ?auto_21076 - SURFACE
      ?auto_21078 - SURFACE
    )
    :vars
    (
      ?auto_21080 - HOIST
      ?auto_21082 - PLACE
      ?auto_21081 - PLACE
      ?auto_21084 - HOIST
      ?auto_21083 - SURFACE
      ?auto_21085 - PLACE
      ?auto_21105 - HOIST
      ?auto_21109 - SURFACE
      ?auto_21091 - PLACE
      ?auto_21094 - HOIST
      ?auto_21088 - SURFACE
      ?auto_21106 - PLACE
      ?auto_21113 - HOIST
      ?auto_21096 - SURFACE
      ?auto_21092 - PLACE
      ?auto_21108 - HOIST
      ?auto_21102 - SURFACE
      ?auto_21097 - PLACE
      ?auto_21099 - HOIST
      ?auto_21089 - SURFACE
      ?auto_21098 - PLACE
      ?auto_21090 - HOIST
      ?auto_21101 - SURFACE
      ?auto_21112 - PLACE
      ?auto_21103 - HOIST
      ?auto_21087 - SURFACE
      ?auto_21086 - SURFACE
      ?auto_21095 - SURFACE
      ?auto_21111 - PLACE
      ?auto_21110 - HOIST
      ?auto_21104 - SURFACE
      ?auto_21100 - PLACE
      ?auto_21107 - HOIST
      ?auto_21093 - SURFACE
      ?auto_21079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21080 ?auto_21082 ) ( IS-CRATE ?auto_21078 ) ( not ( = ?auto_21081 ?auto_21082 ) ) ( HOIST-AT ?auto_21084 ?auto_21081 ) ( SURFACE-AT ?auto_21078 ?auto_21081 ) ( ON ?auto_21078 ?auto_21083 ) ( CLEAR ?auto_21078 ) ( not ( = ?auto_21076 ?auto_21078 ) ) ( not ( = ?auto_21076 ?auto_21083 ) ) ( not ( = ?auto_21078 ?auto_21083 ) ) ( not ( = ?auto_21080 ?auto_21084 ) ) ( IS-CRATE ?auto_21076 ) ( not ( = ?auto_21085 ?auto_21082 ) ) ( HOIST-AT ?auto_21105 ?auto_21085 ) ( SURFACE-AT ?auto_21076 ?auto_21085 ) ( ON ?auto_21076 ?auto_21109 ) ( CLEAR ?auto_21076 ) ( not ( = ?auto_21077 ?auto_21076 ) ) ( not ( = ?auto_21077 ?auto_21109 ) ) ( not ( = ?auto_21076 ?auto_21109 ) ) ( not ( = ?auto_21080 ?auto_21105 ) ) ( IS-CRATE ?auto_21077 ) ( not ( = ?auto_21091 ?auto_21082 ) ) ( HOIST-AT ?auto_21094 ?auto_21091 ) ( AVAILABLE ?auto_21094 ) ( SURFACE-AT ?auto_21077 ?auto_21091 ) ( ON ?auto_21077 ?auto_21088 ) ( CLEAR ?auto_21077 ) ( not ( = ?auto_21075 ?auto_21077 ) ) ( not ( = ?auto_21075 ?auto_21088 ) ) ( not ( = ?auto_21077 ?auto_21088 ) ) ( not ( = ?auto_21080 ?auto_21094 ) ) ( IS-CRATE ?auto_21075 ) ( not ( = ?auto_21106 ?auto_21082 ) ) ( HOIST-AT ?auto_21113 ?auto_21106 ) ( AVAILABLE ?auto_21113 ) ( SURFACE-AT ?auto_21075 ?auto_21106 ) ( ON ?auto_21075 ?auto_21096 ) ( CLEAR ?auto_21075 ) ( not ( = ?auto_21072 ?auto_21075 ) ) ( not ( = ?auto_21072 ?auto_21096 ) ) ( not ( = ?auto_21075 ?auto_21096 ) ) ( not ( = ?auto_21080 ?auto_21113 ) ) ( IS-CRATE ?auto_21072 ) ( not ( = ?auto_21092 ?auto_21082 ) ) ( HOIST-AT ?auto_21108 ?auto_21092 ) ( AVAILABLE ?auto_21108 ) ( SURFACE-AT ?auto_21072 ?auto_21092 ) ( ON ?auto_21072 ?auto_21102 ) ( CLEAR ?auto_21072 ) ( not ( = ?auto_21073 ?auto_21072 ) ) ( not ( = ?auto_21073 ?auto_21102 ) ) ( not ( = ?auto_21072 ?auto_21102 ) ) ( not ( = ?auto_21080 ?auto_21108 ) ) ( IS-CRATE ?auto_21073 ) ( not ( = ?auto_21097 ?auto_21082 ) ) ( HOIST-AT ?auto_21099 ?auto_21097 ) ( AVAILABLE ?auto_21099 ) ( SURFACE-AT ?auto_21073 ?auto_21097 ) ( ON ?auto_21073 ?auto_21089 ) ( CLEAR ?auto_21073 ) ( not ( = ?auto_21074 ?auto_21073 ) ) ( not ( = ?auto_21074 ?auto_21089 ) ) ( not ( = ?auto_21073 ?auto_21089 ) ) ( not ( = ?auto_21080 ?auto_21099 ) ) ( IS-CRATE ?auto_21074 ) ( not ( = ?auto_21098 ?auto_21082 ) ) ( HOIST-AT ?auto_21090 ?auto_21098 ) ( AVAILABLE ?auto_21090 ) ( SURFACE-AT ?auto_21074 ?auto_21098 ) ( ON ?auto_21074 ?auto_21101 ) ( CLEAR ?auto_21074 ) ( not ( = ?auto_21071 ?auto_21074 ) ) ( not ( = ?auto_21071 ?auto_21101 ) ) ( not ( = ?auto_21074 ?auto_21101 ) ) ( not ( = ?auto_21080 ?auto_21090 ) ) ( IS-CRATE ?auto_21071 ) ( not ( = ?auto_21112 ?auto_21082 ) ) ( HOIST-AT ?auto_21103 ?auto_21112 ) ( AVAILABLE ?auto_21103 ) ( SURFACE-AT ?auto_21071 ?auto_21112 ) ( ON ?auto_21071 ?auto_21087 ) ( CLEAR ?auto_21071 ) ( not ( = ?auto_21070 ?auto_21071 ) ) ( not ( = ?auto_21070 ?auto_21087 ) ) ( not ( = ?auto_21071 ?auto_21087 ) ) ( not ( = ?auto_21080 ?auto_21103 ) ) ( IS-CRATE ?auto_21070 ) ( AVAILABLE ?auto_21084 ) ( SURFACE-AT ?auto_21070 ?auto_21081 ) ( ON ?auto_21070 ?auto_21086 ) ( CLEAR ?auto_21070 ) ( not ( = ?auto_21069 ?auto_21070 ) ) ( not ( = ?auto_21069 ?auto_21086 ) ) ( not ( = ?auto_21070 ?auto_21086 ) ) ( IS-CRATE ?auto_21069 ) ( AVAILABLE ?auto_21105 ) ( SURFACE-AT ?auto_21069 ?auto_21085 ) ( ON ?auto_21069 ?auto_21095 ) ( CLEAR ?auto_21069 ) ( not ( = ?auto_21068 ?auto_21069 ) ) ( not ( = ?auto_21068 ?auto_21095 ) ) ( not ( = ?auto_21069 ?auto_21095 ) ) ( IS-CRATE ?auto_21068 ) ( not ( = ?auto_21111 ?auto_21082 ) ) ( HOIST-AT ?auto_21110 ?auto_21111 ) ( AVAILABLE ?auto_21110 ) ( SURFACE-AT ?auto_21068 ?auto_21111 ) ( ON ?auto_21068 ?auto_21104 ) ( CLEAR ?auto_21068 ) ( not ( = ?auto_21067 ?auto_21068 ) ) ( not ( = ?auto_21067 ?auto_21104 ) ) ( not ( = ?auto_21068 ?auto_21104 ) ) ( not ( = ?auto_21080 ?auto_21110 ) ) ( SURFACE-AT ?auto_21066 ?auto_21082 ) ( CLEAR ?auto_21066 ) ( IS-CRATE ?auto_21067 ) ( AVAILABLE ?auto_21080 ) ( not ( = ?auto_21100 ?auto_21082 ) ) ( HOIST-AT ?auto_21107 ?auto_21100 ) ( AVAILABLE ?auto_21107 ) ( SURFACE-AT ?auto_21067 ?auto_21100 ) ( ON ?auto_21067 ?auto_21093 ) ( CLEAR ?auto_21067 ) ( TRUCK-AT ?auto_21079 ?auto_21082 ) ( not ( = ?auto_21066 ?auto_21067 ) ) ( not ( = ?auto_21066 ?auto_21093 ) ) ( not ( = ?auto_21067 ?auto_21093 ) ) ( not ( = ?auto_21080 ?auto_21107 ) ) ( not ( = ?auto_21066 ?auto_21068 ) ) ( not ( = ?auto_21066 ?auto_21104 ) ) ( not ( = ?auto_21068 ?auto_21093 ) ) ( not ( = ?auto_21111 ?auto_21100 ) ) ( not ( = ?auto_21110 ?auto_21107 ) ) ( not ( = ?auto_21104 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21069 ) ) ( not ( = ?auto_21066 ?auto_21095 ) ) ( not ( = ?auto_21067 ?auto_21069 ) ) ( not ( = ?auto_21067 ?auto_21095 ) ) ( not ( = ?auto_21069 ?auto_21104 ) ) ( not ( = ?auto_21069 ?auto_21093 ) ) ( not ( = ?auto_21085 ?auto_21111 ) ) ( not ( = ?auto_21085 ?auto_21100 ) ) ( not ( = ?auto_21105 ?auto_21110 ) ) ( not ( = ?auto_21105 ?auto_21107 ) ) ( not ( = ?auto_21095 ?auto_21104 ) ) ( not ( = ?auto_21095 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21070 ) ) ( not ( = ?auto_21066 ?auto_21086 ) ) ( not ( = ?auto_21067 ?auto_21070 ) ) ( not ( = ?auto_21067 ?auto_21086 ) ) ( not ( = ?auto_21068 ?auto_21070 ) ) ( not ( = ?auto_21068 ?auto_21086 ) ) ( not ( = ?auto_21070 ?auto_21095 ) ) ( not ( = ?auto_21070 ?auto_21104 ) ) ( not ( = ?auto_21070 ?auto_21093 ) ) ( not ( = ?auto_21081 ?auto_21085 ) ) ( not ( = ?auto_21081 ?auto_21111 ) ) ( not ( = ?auto_21081 ?auto_21100 ) ) ( not ( = ?auto_21084 ?auto_21105 ) ) ( not ( = ?auto_21084 ?auto_21110 ) ) ( not ( = ?auto_21084 ?auto_21107 ) ) ( not ( = ?auto_21086 ?auto_21095 ) ) ( not ( = ?auto_21086 ?auto_21104 ) ) ( not ( = ?auto_21086 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21071 ) ) ( not ( = ?auto_21066 ?auto_21087 ) ) ( not ( = ?auto_21067 ?auto_21071 ) ) ( not ( = ?auto_21067 ?auto_21087 ) ) ( not ( = ?auto_21068 ?auto_21071 ) ) ( not ( = ?auto_21068 ?auto_21087 ) ) ( not ( = ?auto_21069 ?auto_21071 ) ) ( not ( = ?auto_21069 ?auto_21087 ) ) ( not ( = ?auto_21071 ?auto_21086 ) ) ( not ( = ?auto_21071 ?auto_21095 ) ) ( not ( = ?auto_21071 ?auto_21104 ) ) ( not ( = ?auto_21071 ?auto_21093 ) ) ( not ( = ?auto_21112 ?auto_21081 ) ) ( not ( = ?auto_21112 ?auto_21085 ) ) ( not ( = ?auto_21112 ?auto_21111 ) ) ( not ( = ?auto_21112 ?auto_21100 ) ) ( not ( = ?auto_21103 ?auto_21084 ) ) ( not ( = ?auto_21103 ?auto_21105 ) ) ( not ( = ?auto_21103 ?auto_21110 ) ) ( not ( = ?auto_21103 ?auto_21107 ) ) ( not ( = ?auto_21087 ?auto_21086 ) ) ( not ( = ?auto_21087 ?auto_21095 ) ) ( not ( = ?auto_21087 ?auto_21104 ) ) ( not ( = ?auto_21087 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21074 ) ) ( not ( = ?auto_21066 ?auto_21101 ) ) ( not ( = ?auto_21067 ?auto_21074 ) ) ( not ( = ?auto_21067 ?auto_21101 ) ) ( not ( = ?auto_21068 ?auto_21074 ) ) ( not ( = ?auto_21068 ?auto_21101 ) ) ( not ( = ?auto_21069 ?auto_21074 ) ) ( not ( = ?auto_21069 ?auto_21101 ) ) ( not ( = ?auto_21070 ?auto_21074 ) ) ( not ( = ?auto_21070 ?auto_21101 ) ) ( not ( = ?auto_21074 ?auto_21087 ) ) ( not ( = ?auto_21074 ?auto_21086 ) ) ( not ( = ?auto_21074 ?auto_21095 ) ) ( not ( = ?auto_21074 ?auto_21104 ) ) ( not ( = ?auto_21074 ?auto_21093 ) ) ( not ( = ?auto_21098 ?auto_21112 ) ) ( not ( = ?auto_21098 ?auto_21081 ) ) ( not ( = ?auto_21098 ?auto_21085 ) ) ( not ( = ?auto_21098 ?auto_21111 ) ) ( not ( = ?auto_21098 ?auto_21100 ) ) ( not ( = ?auto_21090 ?auto_21103 ) ) ( not ( = ?auto_21090 ?auto_21084 ) ) ( not ( = ?auto_21090 ?auto_21105 ) ) ( not ( = ?auto_21090 ?auto_21110 ) ) ( not ( = ?auto_21090 ?auto_21107 ) ) ( not ( = ?auto_21101 ?auto_21087 ) ) ( not ( = ?auto_21101 ?auto_21086 ) ) ( not ( = ?auto_21101 ?auto_21095 ) ) ( not ( = ?auto_21101 ?auto_21104 ) ) ( not ( = ?auto_21101 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21073 ) ) ( not ( = ?auto_21066 ?auto_21089 ) ) ( not ( = ?auto_21067 ?auto_21073 ) ) ( not ( = ?auto_21067 ?auto_21089 ) ) ( not ( = ?auto_21068 ?auto_21073 ) ) ( not ( = ?auto_21068 ?auto_21089 ) ) ( not ( = ?auto_21069 ?auto_21073 ) ) ( not ( = ?auto_21069 ?auto_21089 ) ) ( not ( = ?auto_21070 ?auto_21073 ) ) ( not ( = ?auto_21070 ?auto_21089 ) ) ( not ( = ?auto_21071 ?auto_21073 ) ) ( not ( = ?auto_21071 ?auto_21089 ) ) ( not ( = ?auto_21073 ?auto_21101 ) ) ( not ( = ?auto_21073 ?auto_21087 ) ) ( not ( = ?auto_21073 ?auto_21086 ) ) ( not ( = ?auto_21073 ?auto_21095 ) ) ( not ( = ?auto_21073 ?auto_21104 ) ) ( not ( = ?auto_21073 ?auto_21093 ) ) ( not ( = ?auto_21097 ?auto_21098 ) ) ( not ( = ?auto_21097 ?auto_21112 ) ) ( not ( = ?auto_21097 ?auto_21081 ) ) ( not ( = ?auto_21097 ?auto_21085 ) ) ( not ( = ?auto_21097 ?auto_21111 ) ) ( not ( = ?auto_21097 ?auto_21100 ) ) ( not ( = ?auto_21099 ?auto_21090 ) ) ( not ( = ?auto_21099 ?auto_21103 ) ) ( not ( = ?auto_21099 ?auto_21084 ) ) ( not ( = ?auto_21099 ?auto_21105 ) ) ( not ( = ?auto_21099 ?auto_21110 ) ) ( not ( = ?auto_21099 ?auto_21107 ) ) ( not ( = ?auto_21089 ?auto_21101 ) ) ( not ( = ?auto_21089 ?auto_21087 ) ) ( not ( = ?auto_21089 ?auto_21086 ) ) ( not ( = ?auto_21089 ?auto_21095 ) ) ( not ( = ?auto_21089 ?auto_21104 ) ) ( not ( = ?auto_21089 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21072 ) ) ( not ( = ?auto_21066 ?auto_21102 ) ) ( not ( = ?auto_21067 ?auto_21072 ) ) ( not ( = ?auto_21067 ?auto_21102 ) ) ( not ( = ?auto_21068 ?auto_21072 ) ) ( not ( = ?auto_21068 ?auto_21102 ) ) ( not ( = ?auto_21069 ?auto_21072 ) ) ( not ( = ?auto_21069 ?auto_21102 ) ) ( not ( = ?auto_21070 ?auto_21072 ) ) ( not ( = ?auto_21070 ?auto_21102 ) ) ( not ( = ?auto_21071 ?auto_21072 ) ) ( not ( = ?auto_21071 ?auto_21102 ) ) ( not ( = ?auto_21074 ?auto_21072 ) ) ( not ( = ?auto_21074 ?auto_21102 ) ) ( not ( = ?auto_21072 ?auto_21089 ) ) ( not ( = ?auto_21072 ?auto_21101 ) ) ( not ( = ?auto_21072 ?auto_21087 ) ) ( not ( = ?auto_21072 ?auto_21086 ) ) ( not ( = ?auto_21072 ?auto_21095 ) ) ( not ( = ?auto_21072 ?auto_21104 ) ) ( not ( = ?auto_21072 ?auto_21093 ) ) ( not ( = ?auto_21092 ?auto_21097 ) ) ( not ( = ?auto_21092 ?auto_21098 ) ) ( not ( = ?auto_21092 ?auto_21112 ) ) ( not ( = ?auto_21092 ?auto_21081 ) ) ( not ( = ?auto_21092 ?auto_21085 ) ) ( not ( = ?auto_21092 ?auto_21111 ) ) ( not ( = ?auto_21092 ?auto_21100 ) ) ( not ( = ?auto_21108 ?auto_21099 ) ) ( not ( = ?auto_21108 ?auto_21090 ) ) ( not ( = ?auto_21108 ?auto_21103 ) ) ( not ( = ?auto_21108 ?auto_21084 ) ) ( not ( = ?auto_21108 ?auto_21105 ) ) ( not ( = ?auto_21108 ?auto_21110 ) ) ( not ( = ?auto_21108 ?auto_21107 ) ) ( not ( = ?auto_21102 ?auto_21089 ) ) ( not ( = ?auto_21102 ?auto_21101 ) ) ( not ( = ?auto_21102 ?auto_21087 ) ) ( not ( = ?auto_21102 ?auto_21086 ) ) ( not ( = ?auto_21102 ?auto_21095 ) ) ( not ( = ?auto_21102 ?auto_21104 ) ) ( not ( = ?auto_21102 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21075 ) ) ( not ( = ?auto_21066 ?auto_21096 ) ) ( not ( = ?auto_21067 ?auto_21075 ) ) ( not ( = ?auto_21067 ?auto_21096 ) ) ( not ( = ?auto_21068 ?auto_21075 ) ) ( not ( = ?auto_21068 ?auto_21096 ) ) ( not ( = ?auto_21069 ?auto_21075 ) ) ( not ( = ?auto_21069 ?auto_21096 ) ) ( not ( = ?auto_21070 ?auto_21075 ) ) ( not ( = ?auto_21070 ?auto_21096 ) ) ( not ( = ?auto_21071 ?auto_21075 ) ) ( not ( = ?auto_21071 ?auto_21096 ) ) ( not ( = ?auto_21074 ?auto_21075 ) ) ( not ( = ?auto_21074 ?auto_21096 ) ) ( not ( = ?auto_21073 ?auto_21075 ) ) ( not ( = ?auto_21073 ?auto_21096 ) ) ( not ( = ?auto_21075 ?auto_21102 ) ) ( not ( = ?auto_21075 ?auto_21089 ) ) ( not ( = ?auto_21075 ?auto_21101 ) ) ( not ( = ?auto_21075 ?auto_21087 ) ) ( not ( = ?auto_21075 ?auto_21086 ) ) ( not ( = ?auto_21075 ?auto_21095 ) ) ( not ( = ?auto_21075 ?auto_21104 ) ) ( not ( = ?auto_21075 ?auto_21093 ) ) ( not ( = ?auto_21106 ?auto_21092 ) ) ( not ( = ?auto_21106 ?auto_21097 ) ) ( not ( = ?auto_21106 ?auto_21098 ) ) ( not ( = ?auto_21106 ?auto_21112 ) ) ( not ( = ?auto_21106 ?auto_21081 ) ) ( not ( = ?auto_21106 ?auto_21085 ) ) ( not ( = ?auto_21106 ?auto_21111 ) ) ( not ( = ?auto_21106 ?auto_21100 ) ) ( not ( = ?auto_21113 ?auto_21108 ) ) ( not ( = ?auto_21113 ?auto_21099 ) ) ( not ( = ?auto_21113 ?auto_21090 ) ) ( not ( = ?auto_21113 ?auto_21103 ) ) ( not ( = ?auto_21113 ?auto_21084 ) ) ( not ( = ?auto_21113 ?auto_21105 ) ) ( not ( = ?auto_21113 ?auto_21110 ) ) ( not ( = ?auto_21113 ?auto_21107 ) ) ( not ( = ?auto_21096 ?auto_21102 ) ) ( not ( = ?auto_21096 ?auto_21089 ) ) ( not ( = ?auto_21096 ?auto_21101 ) ) ( not ( = ?auto_21096 ?auto_21087 ) ) ( not ( = ?auto_21096 ?auto_21086 ) ) ( not ( = ?auto_21096 ?auto_21095 ) ) ( not ( = ?auto_21096 ?auto_21104 ) ) ( not ( = ?auto_21096 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21077 ) ) ( not ( = ?auto_21066 ?auto_21088 ) ) ( not ( = ?auto_21067 ?auto_21077 ) ) ( not ( = ?auto_21067 ?auto_21088 ) ) ( not ( = ?auto_21068 ?auto_21077 ) ) ( not ( = ?auto_21068 ?auto_21088 ) ) ( not ( = ?auto_21069 ?auto_21077 ) ) ( not ( = ?auto_21069 ?auto_21088 ) ) ( not ( = ?auto_21070 ?auto_21077 ) ) ( not ( = ?auto_21070 ?auto_21088 ) ) ( not ( = ?auto_21071 ?auto_21077 ) ) ( not ( = ?auto_21071 ?auto_21088 ) ) ( not ( = ?auto_21074 ?auto_21077 ) ) ( not ( = ?auto_21074 ?auto_21088 ) ) ( not ( = ?auto_21073 ?auto_21077 ) ) ( not ( = ?auto_21073 ?auto_21088 ) ) ( not ( = ?auto_21072 ?auto_21077 ) ) ( not ( = ?auto_21072 ?auto_21088 ) ) ( not ( = ?auto_21077 ?auto_21096 ) ) ( not ( = ?auto_21077 ?auto_21102 ) ) ( not ( = ?auto_21077 ?auto_21089 ) ) ( not ( = ?auto_21077 ?auto_21101 ) ) ( not ( = ?auto_21077 ?auto_21087 ) ) ( not ( = ?auto_21077 ?auto_21086 ) ) ( not ( = ?auto_21077 ?auto_21095 ) ) ( not ( = ?auto_21077 ?auto_21104 ) ) ( not ( = ?auto_21077 ?auto_21093 ) ) ( not ( = ?auto_21091 ?auto_21106 ) ) ( not ( = ?auto_21091 ?auto_21092 ) ) ( not ( = ?auto_21091 ?auto_21097 ) ) ( not ( = ?auto_21091 ?auto_21098 ) ) ( not ( = ?auto_21091 ?auto_21112 ) ) ( not ( = ?auto_21091 ?auto_21081 ) ) ( not ( = ?auto_21091 ?auto_21085 ) ) ( not ( = ?auto_21091 ?auto_21111 ) ) ( not ( = ?auto_21091 ?auto_21100 ) ) ( not ( = ?auto_21094 ?auto_21113 ) ) ( not ( = ?auto_21094 ?auto_21108 ) ) ( not ( = ?auto_21094 ?auto_21099 ) ) ( not ( = ?auto_21094 ?auto_21090 ) ) ( not ( = ?auto_21094 ?auto_21103 ) ) ( not ( = ?auto_21094 ?auto_21084 ) ) ( not ( = ?auto_21094 ?auto_21105 ) ) ( not ( = ?auto_21094 ?auto_21110 ) ) ( not ( = ?auto_21094 ?auto_21107 ) ) ( not ( = ?auto_21088 ?auto_21096 ) ) ( not ( = ?auto_21088 ?auto_21102 ) ) ( not ( = ?auto_21088 ?auto_21089 ) ) ( not ( = ?auto_21088 ?auto_21101 ) ) ( not ( = ?auto_21088 ?auto_21087 ) ) ( not ( = ?auto_21088 ?auto_21086 ) ) ( not ( = ?auto_21088 ?auto_21095 ) ) ( not ( = ?auto_21088 ?auto_21104 ) ) ( not ( = ?auto_21088 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21076 ) ) ( not ( = ?auto_21066 ?auto_21109 ) ) ( not ( = ?auto_21067 ?auto_21076 ) ) ( not ( = ?auto_21067 ?auto_21109 ) ) ( not ( = ?auto_21068 ?auto_21076 ) ) ( not ( = ?auto_21068 ?auto_21109 ) ) ( not ( = ?auto_21069 ?auto_21076 ) ) ( not ( = ?auto_21069 ?auto_21109 ) ) ( not ( = ?auto_21070 ?auto_21076 ) ) ( not ( = ?auto_21070 ?auto_21109 ) ) ( not ( = ?auto_21071 ?auto_21076 ) ) ( not ( = ?auto_21071 ?auto_21109 ) ) ( not ( = ?auto_21074 ?auto_21076 ) ) ( not ( = ?auto_21074 ?auto_21109 ) ) ( not ( = ?auto_21073 ?auto_21076 ) ) ( not ( = ?auto_21073 ?auto_21109 ) ) ( not ( = ?auto_21072 ?auto_21076 ) ) ( not ( = ?auto_21072 ?auto_21109 ) ) ( not ( = ?auto_21075 ?auto_21076 ) ) ( not ( = ?auto_21075 ?auto_21109 ) ) ( not ( = ?auto_21076 ?auto_21088 ) ) ( not ( = ?auto_21076 ?auto_21096 ) ) ( not ( = ?auto_21076 ?auto_21102 ) ) ( not ( = ?auto_21076 ?auto_21089 ) ) ( not ( = ?auto_21076 ?auto_21101 ) ) ( not ( = ?auto_21076 ?auto_21087 ) ) ( not ( = ?auto_21076 ?auto_21086 ) ) ( not ( = ?auto_21076 ?auto_21095 ) ) ( not ( = ?auto_21076 ?auto_21104 ) ) ( not ( = ?auto_21076 ?auto_21093 ) ) ( not ( = ?auto_21109 ?auto_21088 ) ) ( not ( = ?auto_21109 ?auto_21096 ) ) ( not ( = ?auto_21109 ?auto_21102 ) ) ( not ( = ?auto_21109 ?auto_21089 ) ) ( not ( = ?auto_21109 ?auto_21101 ) ) ( not ( = ?auto_21109 ?auto_21087 ) ) ( not ( = ?auto_21109 ?auto_21086 ) ) ( not ( = ?auto_21109 ?auto_21095 ) ) ( not ( = ?auto_21109 ?auto_21104 ) ) ( not ( = ?auto_21109 ?auto_21093 ) ) ( not ( = ?auto_21066 ?auto_21078 ) ) ( not ( = ?auto_21066 ?auto_21083 ) ) ( not ( = ?auto_21067 ?auto_21078 ) ) ( not ( = ?auto_21067 ?auto_21083 ) ) ( not ( = ?auto_21068 ?auto_21078 ) ) ( not ( = ?auto_21068 ?auto_21083 ) ) ( not ( = ?auto_21069 ?auto_21078 ) ) ( not ( = ?auto_21069 ?auto_21083 ) ) ( not ( = ?auto_21070 ?auto_21078 ) ) ( not ( = ?auto_21070 ?auto_21083 ) ) ( not ( = ?auto_21071 ?auto_21078 ) ) ( not ( = ?auto_21071 ?auto_21083 ) ) ( not ( = ?auto_21074 ?auto_21078 ) ) ( not ( = ?auto_21074 ?auto_21083 ) ) ( not ( = ?auto_21073 ?auto_21078 ) ) ( not ( = ?auto_21073 ?auto_21083 ) ) ( not ( = ?auto_21072 ?auto_21078 ) ) ( not ( = ?auto_21072 ?auto_21083 ) ) ( not ( = ?auto_21075 ?auto_21078 ) ) ( not ( = ?auto_21075 ?auto_21083 ) ) ( not ( = ?auto_21077 ?auto_21078 ) ) ( not ( = ?auto_21077 ?auto_21083 ) ) ( not ( = ?auto_21078 ?auto_21109 ) ) ( not ( = ?auto_21078 ?auto_21088 ) ) ( not ( = ?auto_21078 ?auto_21096 ) ) ( not ( = ?auto_21078 ?auto_21102 ) ) ( not ( = ?auto_21078 ?auto_21089 ) ) ( not ( = ?auto_21078 ?auto_21101 ) ) ( not ( = ?auto_21078 ?auto_21087 ) ) ( not ( = ?auto_21078 ?auto_21086 ) ) ( not ( = ?auto_21078 ?auto_21095 ) ) ( not ( = ?auto_21078 ?auto_21104 ) ) ( not ( = ?auto_21078 ?auto_21093 ) ) ( not ( = ?auto_21083 ?auto_21109 ) ) ( not ( = ?auto_21083 ?auto_21088 ) ) ( not ( = ?auto_21083 ?auto_21096 ) ) ( not ( = ?auto_21083 ?auto_21102 ) ) ( not ( = ?auto_21083 ?auto_21089 ) ) ( not ( = ?auto_21083 ?auto_21101 ) ) ( not ( = ?auto_21083 ?auto_21087 ) ) ( not ( = ?auto_21083 ?auto_21086 ) ) ( not ( = ?auto_21083 ?auto_21095 ) ) ( not ( = ?auto_21083 ?auto_21104 ) ) ( not ( = ?auto_21083 ?auto_21093 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_21066 ?auto_21067 ?auto_21068 ?auto_21069 ?auto_21070 ?auto_21071 ?auto_21074 ?auto_21073 ?auto_21072 ?auto_21075 ?auto_21077 ?auto_21076 )
      ( MAKE-1CRATE ?auto_21076 ?auto_21078 )
      ( MAKE-12CRATE-VERIFY ?auto_21066 ?auto_21067 ?auto_21068 ?auto_21069 ?auto_21070 ?auto_21071 ?auto_21074 ?auto_21073 ?auto_21072 ?auto_21075 ?auto_21077 ?auto_21076 ?auto_21078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21116 - SURFACE
      ?auto_21117 - SURFACE
    )
    :vars
    (
      ?auto_21118 - HOIST
      ?auto_21119 - PLACE
      ?auto_21121 - PLACE
      ?auto_21122 - HOIST
      ?auto_21123 - SURFACE
      ?auto_21120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21118 ?auto_21119 ) ( SURFACE-AT ?auto_21116 ?auto_21119 ) ( CLEAR ?auto_21116 ) ( IS-CRATE ?auto_21117 ) ( AVAILABLE ?auto_21118 ) ( not ( = ?auto_21121 ?auto_21119 ) ) ( HOIST-AT ?auto_21122 ?auto_21121 ) ( AVAILABLE ?auto_21122 ) ( SURFACE-AT ?auto_21117 ?auto_21121 ) ( ON ?auto_21117 ?auto_21123 ) ( CLEAR ?auto_21117 ) ( TRUCK-AT ?auto_21120 ?auto_21119 ) ( not ( = ?auto_21116 ?auto_21117 ) ) ( not ( = ?auto_21116 ?auto_21123 ) ) ( not ( = ?auto_21117 ?auto_21123 ) ) ( not ( = ?auto_21118 ?auto_21122 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21120 ?auto_21119 ?auto_21121 )
      ( !LIFT ?auto_21122 ?auto_21117 ?auto_21123 ?auto_21121 )
      ( !LOAD ?auto_21122 ?auto_21117 ?auto_21120 ?auto_21121 )
      ( !DRIVE ?auto_21120 ?auto_21121 ?auto_21119 )
      ( !UNLOAD ?auto_21118 ?auto_21117 ?auto_21120 ?auto_21119 )
      ( !DROP ?auto_21118 ?auto_21117 ?auto_21116 ?auto_21119 )
      ( MAKE-1CRATE-VERIFY ?auto_21116 ?auto_21117 ) )
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
      ?auto_21146 - SURFACE
      ?auto_21145 - SURFACE
      ?auto_21144 - SURFACE
      ?auto_21147 - SURFACE
      ?auto_21149 - SURFACE
      ?auto_21148 - SURFACE
      ?auto_21150 - SURFACE
      ?auto_21151 - SURFACE
    )
    :vars
    (
      ?auto_21153 - HOIST
      ?auto_21152 - PLACE
      ?auto_21156 - PLACE
      ?auto_21155 - HOIST
      ?auto_21157 - SURFACE
      ?auto_21159 - PLACE
      ?auto_21186 - HOIST
      ?auto_21185 - SURFACE
      ?auto_21160 - PLACE
      ?auto_21164 - HOIST
      ?auto_21167 - SURFACE
      ?auto_21181 - PLACE
      ?auto_21172 - HOIST
      ?auto_21169 - SURFACE
      ?auto_21168 - PLACE
      ?auto_21161 - HOIST
      ?auto_21162 - SURFACE
      ?auto_21177 - PLACE
      ?auto_21174 - HOIST
      ?auto_21183 - SURFACE
      ?auto_21189 - PLACE
      ?auto_21178 - HOIST
      ?auto_21173 - SURFACE
      ?auto_21184 - PLACE
      ?auto_21170 - HOIST
      ?auto_21158 - SURFACE
      ?auto_21180 - PLACE
      ?auto_21188 - HOIST
      ?auto_21171 - SURFACE
      ?auto_21166 - SURFACE
      ?auto_21187 - SURFACE
      ?auto_21176 - PLACE
      ?auto_21182 - HOIST
      ?auto_21175 - SURFACE
      ?auto_21163 - PLACE
      ?auto_21179 - HOIST
      ?auto_21165 - SURFACE
      ?auto_21154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21153 ?auto_21152 ) ( IS-CRATE ?auto_21151 ) ( not ( = ?auto_21156 ?auto_21152 ) ) ( HOIST-AT ?auto_21155 ?auto_21156 ) ( AVAILABLE ?auto_21155 ) ( SURFACE-AT ?auto_21151 ?auto_21156 ) ( ON ?auto_21151 ?auto_21157 ) ( CLEAR ?auto_21151 ) ( not ( = ?auto_21150 ?auto_21151 ) ) ( not ( = ?auto_21150 ?auto_21157 ) ) ( not ( = ?auto_21151 ?auto_21157 ) ) ( not ( = ?auto_21153 ?auto_21155 ) ) ( IS-CRATE ?auto_21150 ) ( not ( = ?auto_21159 ?auto_21152 ) ) ( HOIST-AT ?auto_21186 ?auto_21159 ) ( SURFACE-AT ?auto_21150 ?auto_21159 ) ( ON ?auto_21150 ?auto_21185 ) ( CLEAR ?auto_21150 ) ( not ( = ?auto_21148 ?auto_21150 ) ) ( not ( = ?auto_21148 ?auto_21185 ) ) ( not ( = ?auto_21150 ?auto_21185 ) ) ( not ( = ?auto_21153 ?auto_21186 ) ) ( IS-CRATE ?auto_21148 ) ( not ( = ?auto_21160 ?auto_21152 ) ) ( HOIST-AT ?auto_21164 ?auto_21160 ) ( SURFACE-AT ?auto_21148 ?auto_21160 ) ( ON ?auto_21148 ?auto_21167 ) ( CLEAR ?auto_21148 ) ( not ( = ?auto_21149 ?auto_21148 ) ) ( not ( = ?auto_21149 ?auto_21167 ) ) ( not ( = ?auto_21148 ?auto_21167 ) ) ( not ( = ?auto_21153 ?auto_21164 ) ) ( IS-CRATE ?auto_21149 ) ( not ( = ?auto_21181 ?auto_21152 ) ) ( HOIST-AT ?auto_21172 ?auto_21181 ) ( AVAILABLE ?auto_21172 ) ( SURFACE-AT ?auto_21149 ?auto_21181 ) ( ON ?auto_21149 ?auto_21169 ) ( CLEAR ?auto_21149 ) ( not ( = ?auto_21147 ?auto_21149 ) ) ( not ( = ?auto_21147 ?auto_21169 ) ) ( not ( = ?auto_21149 ?auto_21169 ) ) ( not ( = ?auto_21153 ?auto_21172 ) ) ( IS-CRATE ?auto_21147 ) ( not ( = ?auto_21168 ?auto_21152 ) ) ( HOIST-AT ?auto_21161 ?auto_21168 ) ( AVAILABLE ?auto_21161 ) ( SURFACE-AT ?auto_21147 ?auto_21168 ) ( ON ?auto_21147 ?auto_21162 ) ( CLEAR ?auto_21147 ) ( not ( = ?auto_21144 ?auto_21147 ) ) ( not ( = ?auto_21144 ?auto_21162 ) ) ( not ( = ?auto_21147 ?auto_21162 ) ) ( not ( = ?auto_21153 ?auto_21161 ) ) ( IS-CRATE ?auto_21144 ) ( not ( = ?auto_21177 ?auto_21152 ) ) ( HOIST-AT ?auto_21174 ?auto_21177 ) ( AVAILABLE ?auto_21174 ) ( SURFACE-AT ?auto_21144 ?auto_21177 ) ( ON ?auto_21144 ?auto_21183 ) ( CLEAR ?auto_21144 ) ( not ( = ?auto_21145 ?auto_21144 ) ) ( not ( = ?auto_21145 ?auto_21183 ) ) ( not ( = ?auto_21144 ?auto_21183 ) ) ( not ( = ?auto_21153 ?auto_21174 ) ) ( IS-CRATE ?auto_21145 ) ( not ( = ?auto_21189 ?auto_21152 ) ) ( HOIST-AT ?auto_21178 ?auto_21189 ) ( AVAILABLE ?auto_21178 ) ( SURFACE-AT ?auto_21145 ?auto_21189 ) ( ON ?auto_21145 ?auto_21173 ) ( CLEAR ?auto_21145 ) ( not ( = ?auto_21146 ?auto_21145 ) ) ( not ( = ?auto_21146 ?auto_21173 ) ) ( not ( = ?auto_21145 ?auto_21173 ) ) ( not ( = ?auto_21153 ?auto_21178 ) ) ( IS-CRATE ?auto_21146 ) ( not ( = ?auto_21184 ?auto_21152 ) ) ( HOIST-AT ?auto_21170 ?auto_21184 ) ( AVAILABLE ?auto_21170 ) ( SURFACE-AT ?auto_21146 ?auto_21184 ) ( ON ?auto_21146 ?auto_21158 ) ( CLEAR ?auto_21146 ) ( not ( = ?auto_21143 ?auto_21146 ) ) ( not ( = ?auto_21143 ?auto_21158 ) ) ( not ( = ?auto_21146 ?auto_21158 ) ) ( not ( = ?auto_21153 ?auto_21170 ) ) ( IS-CRATE ?auto_21143 ) ( not ( = ?auto_21180 ?auto_21152 ) ) ( HOIST-AT ?auto_21188 ?auto_21180 ) ( AVAILABLE ?auto_21188 ) ( SURFACE-AT ?auto_21143 ?auto_21180 ) ( ON ?auto_21143 ?auto_21171 ) ( CLEAR ?auto_21143 ) ( not ( = ?auto_21142 ?auto_21143 ) ) ( not ( = ?auto_21142 ?auto_21171 ) ) ( not ( = ?auto_21143 ?auto_21171 ) ) ( not ( = ?auto_21153 ?auto_21188 ) ) ( IS-CRATE ?auto_21142 ) ( AVAILABLE ?auto_21186 ) ( SURFACE-AT ?auto_21142 ?auto_21159 ) ( ON ?auto_21142 ?auto_21166 ) ( CLEAR ?auto_21142 ) ( not ( = ?auto_21141 ?auto_21142 ) ) ( not ( = ?auto_21141 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21166 ) ) ( IS-CRATE ?auto_21141 ) ( AVAILABLE ?auto_21164 ) ( SURFACE-AT ?auto_21141 ?auto_21160 ) ( ON ?auto_21141 ?auto_21187 ) ( CLEAR ?auto_21141 ) ( not ( = ?auto_21140 ?auto_21141 ) ) ( not ( = ?auto_21140 ?auto_21187 ) ) ( not ( = ?auto_21141 ?auto_21187 ) ) ( IS-CRATE ?auto_21140 ) ( not ( = ?auto_21176 ?auto_21152 ) ) ( HOIST-AT ?auto_21182 ?auto_21176 ) ( AVAILABLE ?auto_21182 ) ( SURFACE-AT ?auto_21140 ?auto_21176 ) ( ON ?auto_21140 ?auto_21175 ) ( CLEAR ?auto_21140 ) ( not ( = ?auto_21139 ?auto_21140 ) ) ( not ( = ?auto_21139 ?auto_21175 ) ) ( not ( = ?auto_21140 ?auto_21175 ) ) ( not ( = ?auto_21153 ?auto_21182 ) ) ( SURFACE-AT ?auto_21138 ?auto_21152 ) ( CLEAR ?auto_21138 ) ( IS-CRATE ?auto_21139 ) ( AVAILABLE ?auto_21153 ) ( not ( = ?auto_21163 ?auto_21152 ) ) ( HOIST-AT ?auto_21179 ?auto_21163 ) ( AVAILABLE ?auto_21179 ) ( SURFACE-AT ?auto_21139 ?auto_21163 ) ( ON ?auto_21139 ?auto_21165 ) ( CLEAR ?auto_21139 ) ( TRUCK-AT ?auto_21154 ?auto_21152 ) ( not ( = ?auto_21138 ?auto_21139 ) ) ( not ( = ?auto_21138 ?auto_21165 ) ) ( not ( = ?auto_21139 ?auto_21165 ) ) ( not ( = ?auto_21153 ?auto_21179 ) ) ( not ( = ?auto_21138 ?auto_21140 ) ) ( not ( = ?auto_21138 ?auto_21175 ) ) ( not ( = ?auto_21140 ?auto_21165 ) ) ( not ( = ?auto_21176 ?auto_21163 ) ) ( not ( = ?auto_21182 ?auto_21179 ) ) ( not ( = ?auto_21175 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21141 ) ) ( not ( = ?auto_21138 ?auto_21187 ) ) ( not ( = ?auto_21139 ?auto_21141 ) ) ( not ( = ?auto_21139 ?auto_21187 ) ) ( not ( = ?auto_21141 ?auto_21175 ) ) ( not ( = ?auto_21141 ?auto_21165 ) ) ( not ( = ?auto_21160 ?auto_21176 ) ) ( not ( = ?auto_21160 ?auto_21163 ) ) ( not ( = ?auto_21164 ?auto_21182 ) ) ( not ( = ?auto_21164 ?auto_21179 ) ) ( not ( = ?auto_21187 ?auto_21175 ) ) ( not ( = ?auto_21187 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21142 ) ) ( not ( = ?auto_21138 ?auto_21166 ) ) ( not ( = ?auto_21139 ?auto_21142 ) ) ( not ( = ?auto_21139 ?auto_21166 ) ) ( not ( = ?auto_21140 ?auto_21142 ) ) ( not ( = ?auto_21140 ?auto_21166 ) ) ( not ( = ?auto_21142 ?auto_21187 ) ) ( not ( = ?auto_21142 ?auto_21175 ) ) ( not ( = ?auto_21142 ?auto_21165 ) ) ( not ( = ?auto_21159 ?auto_21160 ) ) ( not ( = ?auto_21159 ?auto_21176 ) ) ( not ( = ?auto_21159 ?auto_21163 ) ) ( not ( = ?auto_21186 ?auto_21164 ) ) ( not ( = ?auto_21186 ?auto_21182 ) ) ( not ( = ?auto_21186 ?auto_21179 ) ) ( not ( = ?auto_21166 ?auto_21187 ) ) ( not ( = ?auto_21166 ?auto_21175 ) ) ( not ( = ?auto_21166 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21143 ) ) ( not ( = ?auto_21138 ?auto_21171 ) ) ( not ( = ?auto_21139 ?auto_21143 ) ) ( not ( = ?auto_21139 ?auto_21171 ) ) ( not ( = ?auto_21140 ?auto_21143 ) ) ( not ( = ?auto_21140 ?auto_21171 ) ) ( not ( = ?auto_21141 ?auto_21143 ) ) ( not ( = ?auto_21141 ?auto_21171 ) ) ( not ( = ?auto_21143 ?auto_21166 ) ) ( not ( = ?auto_21143 ?auto_21187 ) ) ( not ( = ?auto_21143 ?auto_21175 ) ) ( not ( = ?auto_21143 ?auto_21165 ) ) ( not ( = ?auto_21180 ?auto_21159 ) ) ( not ( = ?auto_21180 ?auto_21160 ) ) ( not ( = ?auto_21180 ?auto_21176 ) ) ( not ( = ?auto_21180 ?auto_21163 ) ) ( not ( = ?auto_21188 ?auto_21186 ) ) ( not ( = ?auto_21188 ?auto_21164 ) ) ( not ( = ?auto_21188 ?auto_21182 ) ) ( not ( = ?auto_21188 ?auto_21179 ) ) ( not ( = ?auto_21171 ?auto_21166 ) ) ( not ( = ?auto_21171 ?auto_21187 ) ) ( not ( = ?auto_21171 ?auto_21175 ) ) ( not ( = ?auto_21171 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21146 ) ) ( not ( = ?auto_21138 ?auto_21158 ) ) ( not ( = ?auto_21139 ?auto_21146 ) ) ( not ( = ?auto_21139 ?auto_21158 ) ) ( not ( = ?auto_21140 ?auto_21146 ) ) ( not ( = ?auto_21140 ?auto_21158 ) ) ( not ( = ?auto_21141 ?auto_21146 ) ) ( not ( = ?auto_21141 ?auto_21158 ) ) ( not ( = ?auto_21142 ?auto_21146 ) ) ( not ( = ?auto_21142 ?auto_21158 ) ) ( not ( = ?auto_21146 ?auto_21171 ) ) ( not ( = ?auto_21146 ?auto_21166 ) ) ( not ( = ?auto_21146 ?auto_21187 ) ) ( not ( = ?auto_21146 ?auto_21175 ) ) ( not ( = ?auto_21146 ?auto_21165 ) ) ( not ( = ?auto_21184 ?auto_21180 ) ) ( not ( = ?auto_21184 ?auto_21159 ) ) ( not ( = ?auto_21184 ?auto_21160 ) ) ( not ( = ?auto_21184 ?auto_21176 ) ) ( not ( = ?auto_21184 ?auto_21163 ) ) ( not ( = ?auto_21170 ?auto_21188 ) ) ( not ( = ?auto_21170 ?auto_21186 ) ) ( not ( = ?auto_21170 ?auto_21164 ) ) ( not ( = ?auto_21170 ?auto_21182 ) ) ( not ( = ?auto_21170 ?auto_21179 ) ) ( not ( = ?auto_21158 ?auto_21171 ) ) ( not ( = ?auto_21158 ?auto_21166 ) ) ( not ( = ?auto_21158 ?auto_21187 ) ) ( not ( = ?auto_21158 ?auto_21175 ) ) ( not ( = ?auto_21158 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21145 ) ) ( not ( = ?auto_21138 ?auto_21173 ) ) ( not ( = ?auto_21139 ?auto_21145 ) ) ( not ( = ?auto_21139 ?auto_21173 ) ) ( not ( = ?auto_21140 ?auto_21145 ) ) ( not ( = ?auto_21140 ?auto_21173 ) ) ( not ( = ?auto_21141 ?auto_21145 ) ) ( not ( = ?auto_21141 ?auto_21173 ) ) ( not ( = ?auto_21142 ?auto_21145 ) ) ( not ( = ?auto_21142 ?auto_21173 ) ) ( not ( = ?auto_21143 ?auto_21145 ) ) ( not ( = ?auto_21143 ?auto_21173 ) ) ( not ( = ?auto_21145 ?auto_21158 ) ) ( not ( = ?auto_21145 ?auto_21171 ) ) ( not ( = ?auto_21145 ?auto_21166 ) ) ( not ( = ?auto_21145 ?auto_21187 ) ) ( not ( = ?auto_21145 ?auto_21175 ) ) ( not ( = ?auto_21145 ?auto_21165 ) ) ( not ( = ?auto_21189 ?auto_21184 ) ) ( not ( = ?auto_21189 ?auto_21180 ) ) ( not ( = ?auto_21189 ?auto_21159 ) ) ( not ( = ?auto_21189 ?auto_21160 ) ) ( not ( = ?auto_21189 ?auto_21176 ) ) ( not ( = ?auto_21189 ?auto_21163 ) ) ( not ( = ?auto_21178 ?auto_21170 ) ) ( not ( = ?auto_21178 ?auto_21188 ) ) ( not ( = ?auto_21178 ?auto_21186 ) ) ( not ( = ?auto_21178 ?auto_21164 ) ) ( not ( = ?auto_21178 ?auto_21182 ) ) ( not ( = ?auto_21178 ?auto_21179 ) ) ( not ( = ?auto_21173 ?auto_21158 ) ) ( not ( = ?auto_21173 ?auto_21171 ) ) ( not ( = ?auto_21173 ?auto_21166 ) ) ( not ( = ?auto_21173 ?auto_21187 ) ) ( not ( = ?auto_21173 ?auto_21175 ) ) ( not ( = ?auto_21173 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21144 ) ) ( not ( = ?auto_21138 ?auto_21183 ) ) ( not ( = ?auto_21139 ?auto_21144 ) ) ( not ( = ?auto_21139 ?auto_21183 ) ) ( not ( = ?auto_21140 ?auto_21144 ) ) ( not ( = ?auto_21140 ?auto_21183 ) ) ( not ( = ?auto_21141 ?auto_21144 ) ) ( not ( = ?auto_21141 ?auto_21183 ) ) ( not ( = ?auto_21142 ?auto_21144 ) ) ( not ( = ?auto_21142 ?auto_21183 ) ) ( not ( = ?auto_21143 ?auto_21144 ) ) ( not ( = ?auto_21143 ?auto_21183 ) ) ( not ( = ?auto_21146 ?auto_21144 ) ) ( not ( = ?auto_21146 ?auto_21183 ) ) ( not ( = ?auto_21144 ?auto_21173 ) ) ( not ( = ?auto_21144 ?auto_21158 ) ) ( not ( = ?auto_21144 ?auto_21171 ) ) ( not ( = ?auto_21144 ?auto_21166 ) ) ( not ( = ?auto_21144 ?auto_21187 ) ) ( not ( = ?auto_21144 ?auto_21175 ) ) ( not ( = ?auto_21144 ?auto_21165 ) ) ( not ( = ?auto_21177 ?auto_21189 ) ) ( not ( = ?auto_21177 ?auto_21184 ) ) ( not ( = ?auto_21177 ?auto_21180 ) ) ( not ( = ?auto_21177 ?auto_21159 ) ) ( not ( = ?auto_21177 ?auto_21160 ) ) ( not ( = ?auto_21177 ?auto_21176 ) ) ( not ( = ?auto_21177 ?auto_21163 ) ) ( not ( = ?auto_21174 ?auto_21178 ) ) ( not ( = ?auto_21174 ?auto_21170 ) ) ( not ( = ?auto_21174 ?auto_21188 ) ) ( not ( = ?auto_21174 ?auto_21186 ) ) ( not ( = ?auto_21174 ?auto_21164 ) ) ( not ( = ?auto_21174 ?auto_21182 ) ) ( not ( = ?auto_21174 ?auto_21179 ) ) ( not ( = ?auto_21183 ?auto_21173 ) ) ( not ( = ?auto_21183 ?auto_21158 ) ) ( not ( = ?auto_21183 ?auto_21171 ) ) ( not ( = ?auto_21183 ?auto_21166 ) ) ( not ( = ?auto_21183 ?auto_21187 ) ) ( not ( = ?auto_21183 ?auto_21175 ) ) ( not ( = ?auto_21183 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21147 ) ) ( not ( = ?auto_21138 ?auto_21162 ) ) ( not ( = ?auto_21139 ?auto_21147 ) ) ( not ( = ?auto_21139 ?auto_21162 ) ) ( not ( = ?auto_21140 ?auto_21147 ) ) ( not ( = ?auto_21140 ?auto_21162 ) ) ( not ( = ?auto_21141 ?auto_21147 ) ) ( not ( = ?auto_21141 ?auto_21162 ) ) ( not ( = ?auto_21142 ?auto_21147 ) ) ( not ( = ?auto_21142 ?auto_21162 ) ) ( not ( = ?auto_21143 ?auto_21147 ) ) ( not ( = ?auto_21143 ?auto_21162 ) ) ( not ( = ?auto_21146 ?auto_21147 ) ) ( not ( = ?auto_21146 ?auto_21162 ) ) ( not ( = ?auto_21145 ?auto_21147 ) ) ( not ( = ?auto_21145 ?auto_21162 ) ) ( not ( = ?auto_21147 ?auto_21183 ) ) ( not ( = ?auto_21147 ?auto_21173 ) ) ( not ( = ?auto_21147 ?auto_21158 ) ) ( not ( = ?auto_21147 ?auto_21171 ) ) ( not ( = ?auto_21147 ?auto_21166 ) ) ( not ( = ?auto_21147 ?auto_21187 ) ) ( not ( = ?auto_21147 ?auto_21175 ) ) ( not ( = ?auto_21147 ?auto_21165 ) ) ( not ( = ?auto_21168 ?auto_21177 ) ) ( not ( = ?auto_21168 ?auto_21189 ) ) ( not ( = ?auto_21168 ?auto_21184 ) ) ( not ( = ?auto_21168 ?auto_21180 ) ) ( not ( = ?auto_21168 ?auto_21159 ) ) ( not ( = ?auto_21168 ?auto_21160 ) ) ( not ( = ?auto_21168 ?auto_21176 ) ) ( not ( = ?auto_21168 ?auto_21163 ) ) ( not ( = ?auto_21161 ?auto_21174 ) ) ( not ( = ?auto_21161 ?auto_21178 ) ) ( not ( = ?auto_21161 ?auto_21170 ) ) ( not ( = ?auto_21161 ?auto_21188 ) ) ( not ( = ?auto_21161 ?auto_21186 ) ) ( not ( = ?auto_21161 ?auto_21164 ) ) ( not ( = ?auto_21161 ?auto_21182 ) ) ( not ( = ?auto_21161 ?auto_21179 ) ) ( not ( = ?auto_21162 ?auto_21183 ) ) ( not ( = ?auto_21162 ?auto_21173 ) ) ( not ( = ?auto_21162 ?auto_21158 ) ) ( not ( = ?auto_21162 ?auto_21171 ) ) ( not ( = ?auto_21162 ?auto_21166 ) ) ( not ( = ?auto_21162 ?auto_21187 ) ) ( not ( = ?auto_21162 ?auto_21175 ) ) ( not ( = ?auto_21162 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21149 ) ) ( not ( = ?auto_21138 ?auto_21169 ) ) ( not ( = ?auto_21139 ?auto_21149 ) ) ( not ( = ?auto_21139 ?auto_21169 ) ) ( not ( = ?auto_21140 ?auto_21149 ) ) ( not ( = ?auto_21140 ?auto_21169 ) ) ( not ( = ?auto_21141 ?auto_21149 ) ) ( not ( = ?auto_21141 ?auto_21169 ) ) ( not ( = ?auto_21142 ?auto_21149 ) ) ( not ( = ?auto_21142 ?auto_21169 ) ) ( not ( = ?auto_21143 ?auto_21149 ) ) ( not ( = ?auto_21143 ?auto_21169 ) ) ( not ( = ?auto_21146 ?auto_21149 ) ) ( not ( = ?auto_21146 ?auto_21169 ) ) ( not ( = ?auto_21145 ?auto_21149 ) ) ( not ( = ?auto_21145 ?auto_21169 ) ) ( not ( = ?auto_21144 ?auto_21149 ) ) ( not ( = ?auto_21144 ?auto_21169 ) ) ( not ( = ?auto_21149 ?auto_21162 ) ) ( not ( = ?auto_21149 ?auto_21183 ) ) ( not ( = ?auto_21149 ?auto_21173 ) ) ( not ( = ?auto_21149 ?auto_21158 ) ) ( not ( = ?auto_21149 ?auto_21171 ) ) ( not ( = ?auto_21149 ?auto_21166 ) ) ( not ( = ?auto_21149 ?auto_21187 ) ) ( not ( = ?auto_21149 ?auto_21175 ) ) ( not ( = ?auto_21149 ?auto_21165 ) ) ( not ( = ?auto_21181 ?auto_21168 ) ) ( not ( = ?auto_21181 ?auto_21177 ) ) ( not ( = ?auto_21181 ?auto_21189 ) ) ( not ( = ?auto_21181 ?auto_21184 ) ) ( not ( = ?auto_21181 ?auto_21180 ) ) ( not ( = ?auto_21181 ?auto_21159 ) ) ( not ( = ?auto_21181 ?auto_21160 ) ) ( not ( = ?auto_21181 ?auto_21176 ) ) ( not ( = ?auto_21181 ?auto_21163 ) ) ( not ( = ?auto_21172 ?auto_21161 ) ) ( not ( = ?auto_21172 ?auto_21174 ) ) ( not ( = ?auto_21172 ?auto_21178 ) ) ( not ( = ?auto_21172 ?auto_21170 ) ) ( not ( = ?auto_21172 ?auto_21188 ) ) ( not ( = ?auto_21172 ?auto_21186 ) ) ( not ( = ?auto_21172 ?auto_21164 ) ) ( not ( = ?auto_21172 ?auto_21182 ) ) ( not ( = ?auto_21172 ?auto_21179 ) ) ( not ( = ?auto_21169 ?auto_21162 ) ) ( not ( = ?auto_21169 ?auto_21183 ) ) ( not ( = ?auto_21169 ?auto_21173 ) ) ( not ( = ?auto_21169 ?auto_21158 ) ) ( not ( = ?auto_21169 ?auto_21171 ) ) ( not ( = ?auto_21169 ?auto_21166 ) ) ( not ( = ?auto_21169 ?auto_21187 ) ) ( not ( = ?auto_21169 ?auto_21175 ) ) ( not ( = ?auto_21169 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21148 ) ) ( not ( = ?auto_21138 ?auto_21167 ) ) ( not ( = ?auto_21139 ?auto_21148 ) ) ( not ( = ?auto_21139 ?auto_21167 ) ) ( not ( = ?auto_21140 ?auto_21148 ) ) ( not ( = ?auto_21140 ?auto_21167 ) ) ( not ( = ?auto_21141 ?auto_21148 ) ) ( not ( = ?auto_21141 ?auto_21167 ) ) ( not ( = ?auto_21142 ?auto_21148 ) ) ( not ( = ?auto_21142 ?auto_21167 ) ) ( not ( = ?auto_21143 ?auto_21148 ) ) ( not ( = ?auto_21143 ?auto_21167 ) ) ( not ( = ?auto_21146 ?auto_21148 ) ) ( not ( = ?auto_21146 ?auto_21167 ) ) ( not ( = ?auto_21145 ?auto_21148 ) ) ( not ( = ?auto_21145 ?auto_21167 ) ) ( not ( = ?auto_21144 ?auto_21148 ) ) ( not ( = ?auto_21144 ?auto_21167 ) ) ( not ( = ?auto_21147 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21167 ) ) ( not ( = ?auto_21148 ?auto_21169 ) ) ( not ( = ?auto_21148 ?auto_21162 ) ) ( not ( = ?auto_21148 ?auto_21183 ) ) ( not ( = ?auto_21148 ?auto_21173 ) ) ( not ( = ?auto_21148 ?auto_21158 ) ) ( not ( = ?auto_21148 ?auto_21171 ) ) ( not ( = ?auto_21148 ?auto_21166 ) ) ( not ( = ?auto_21148 ?auto_21187 ) ) ( not ( = ?auto_21148 ?auto_21175 ) ) ( not ( = ?auto_21148 ?auto_21165 ) ) ( not ( = ?auto_21167 ?auto_21169 ) ) ( not ( = ?auto_21167 ?auto_21162 ) ) ( not ( = ?auto_21167 ?auto_21183 ) ) ( not ( = ?auto_21167 ?auto_21173 ) ) ( not ( = ?auto_21167 ?auto_21158 ) ) ( not ( = ?auto_21167 ?auto_21171 ) ) ( not ( = ?auto_21167 ?auto_21166 ) ) ( not ( = ?auto_21167 ?auto_21187 ) ) ( not ( = ?auto_21167 ?auto_21175 ) ) ( not ( = ?auto_21167 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21150 ) ) ( not ( = ?auto_21138 ?auto_21185 ) ) ( not ( = ?auto_21139 ?auto_21150 ) ) ( not ( = ?auto_21139 ?auto_21185 ) ) ( not ( = ?auto_21140 ?auto_21150 ) ) ( not ( = ?auto_21140 ?auto_21185 ) ) ( not ( = ?auto_21141 ?auto_21150 ) ) ( not ( = ?auto_21141 ?auto_21185 ) ) ( not ( = ?auto_21142 ?auto_21150 ) ) ( not ( = ?auto_21142 ?auto_21185 ) ) ( not ( = ?auto_21143 ?auto_21150 ) ) ( not ( = ?auto_21143 ?auto_21185 ) ) ( not ( = ?auto_21146 ?auto_21150 ) ) ( not ( = ?auto_21146 ?auto_21185 ) ) ( not ( = ?auto_21145 ?auto_21150 ) ) ( not ( = ?auto_21145 ?auto_21185 ) ) ( not ( = ?auto_21144 ?auto_21150 ) ) ( not ( = ?auto_21144 ?auto_21185 ) ) ( not ( = ?auto_21147 ?auto_21150 ) ) ( not ( = ?auto_21147 ?auto_21185 ) ) ( not ( = ?auto_21149 ?auto_21150 ) ) ( not ( = ?auto_21149 ?auto_21185 ) ) ( not ( = ?auto_21150 ?auto_21167 ) ) ( not ( = ?auto_21150 ?auto_21169 ) ) ( not ( = ?auto_21150 ?auto_21162 ) ) ( not ( = ?auto_21150 ?auto_21183 ) ) ( not ( = ?auto_21150 ?auto_21173 ) ) ( not ( = ?auto_21150 ?auto_21158 ) ) ( not ( = ?auto_21150 ?auto_21171 ) ) ( not ( = ?auto_21150 ?auto_21166 ) ) ( not ( = ?auto_21150 ?auto_21187 ) ) ( not ( = ?auto_21150 ?auto_21175 ) ) ( not ( = ?auto_21150 ?auto_21165 ) ) ( not ( = ?auto_21185 ?auto_21167 ) ) ( not ( = ?auto_21185 ?auto_21169 ) ) ( not ( = ?auto_21185 ?auto_21162 ) ) ( not ( = ?auto_21185 ?auto_21183 ) ) ( not ( = ?auto_21185 ?auto_21173 ) ) ( not ( = ?auto_21185 ?auto_21158 ) ) ( not ( = ?auto_21185 ?auto_21171 ) ) ( not ( = ?auto_21185 ?auto_21166 ) ) ( not ( = ?auto_21185 ?auto_21187 ) ) ( not ( = ?auto_21185 ?auto_21175 ) ) ( not ( = ?auto_21185 ?auto_21165 ) ) ( not ( = ?auto_21138 ?auto_21151 ) ) ( not ( = ?auto_21138 ?auto_21157 ) ) ( not ( = ?auto_21139 ?auto_21151 ) ) ( not ( = ?auto_21139 ?auto_21157 ) ) ( not ( = ?auto_21140 ?auto_21151 ) ) ( not ( = ?auto_21140 ?auto_21157 ) ) ( not ( = ?auto_21141 ?auto_21151 ) ) ( not ( = ?auto_21141 ?auto_21157 ) ) ( not ( = ?auto_21142 ?auto_21151 ) ) ( not ( = ?auto_21142 ?auto_21157 ) ) ( not ( = ?auto_21143 ?auto_21151 ) ) ( not ( = ?auto_21143 ?auto_21157 ) ) ( not ( = ?auto_21146 ?auto_21151 ) ) ( not ( = ?auto_21146 ?auto_21157 ) ) ( not ( = ?auto_21145 ?auto_21151 ) ) ( not ( = ?auto_21145 ?auto_21157 ) ) ( not ( = ?auto_21144 ?auto_21151 ) ) ( not ( = ?auto_21144 ?auto_21157 ) ) ( not ( = ?auto_21147 ?auto_21151 ) ) ( not ( = ?auto_21147 ?auto_21157 ) ) ( not ( = ?auto_21149 ?auto_21151 ) ) ( not ( = ?auto_21149 ?auto_21157 ) ) ( not ( = ?auto_21148 ?auto_21151 ) ) ( not ( = ?auto_21148 ?auto_21157 ) ) ( not ( = ?auto_21151 ?auto_21185 ) ) ( not ( = ?auto_21151 ?auto_21167 ) ) ( not ( = ?auto_21151 ?auto_21169 ) ) ( not ( = ?auto_21151 ?auto_21162 ) ) ( not ( = ?auto_21151 ?auto_21183 ) ) ( not ( = ?auto_21151 ?auto_21173 ) ) ( not ( = ?auto_21151 ?auto_21158 ) ) ( not ( = ?auto_21151 ?auto_21171 ) ) ( not ( = ?auto_21151 ?auto_21166 ) ) ( not ( = ?auto_21151 ?auto_21187 ) ) ( not ( = ?auto_21151 ?auto_21175 ) ) ( not ( = ?auto_21151 ?auto_21165 ) ) ( not ( = ?auto_21156 ?auto_21159 ) ) ( not ( = ?auto_21156 ?auto_21160 ) ) ( not ( = ?auto_21156 ?auto_21181 ) ) ( not ( = ?auto_21156 ?auto_21168 ) ) ( not ( = ?auto_21156 ?auto_21177 ) ) ( not ( = ?auto_21156 ?auto_21189 ) ) ( not ( = ?auto_21156 ?auto_21184 ) ) ( not ( = ?auto_21156 ?auto_21180 ) ) ( not ( = ?auto_21156 ?auto_21176 ) ) ( not ( = ?auto_21156 ?auto_21163 ) ) ( not ( = ?auto_21155 ?auto_21186 ) ) ( not ( = ?auto_21155 ?auto_21164 ) ) ( not ( = ?auto_21155 ?auto_21172 ) ) ( not ( = ?auto_21155 ?auto_21161 ) ) ( not ( = ?auto_21155 ?auto_21174 ) ) ( not ( = ?auto_21155 ?auto_21178 ) ) ( not ( = ?auto_21155 ?auto_21170 ) ) ( not ( = ?auto_21155 ?auto_21188 ) ) ( not ( = ?auto_21155 ?auto_21182 ) ) ( not ( = ?auto_21155 ?auto_21179 ) ) ( not ( = ?auto_21157 ?auto_21185 ) ) ( not ( = ?auto_21157 ?auto_21167 ) ) ( not ( = ?auto_21157 ?auto_21169 ) ) ( not ( = ?auto_21157 ?auto_21162 ) ) ( not ( = ?auto_21157 ?auto_21183 ) ) ( not ( = ?auto_21157 ?auto_21173 ) ) ( not ( = ?auto_21157 ?auto_21158 ) ) ( not ( = ?auto_21157 ?auto_21171 ) ) ( not ( = ?auto_21157 ?auto_21166 ) ) ( not ( = ?auto_21157 ?auto_21187 ) ) ( not ( = ?auto_21157 ?auto_21175 ) ) ( not ( = ?auto_21157 ?auto_21165 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_21138 ?auto_21139 ?auto_21140 ?auto_21141 ?auto_21142 ?auto_21143 ?auto_21146 ?auto_21145 ?auto_21144 ?auto_21147 ?auto_21149 ?auto_21148 ?auto_21150 )
      ( MAKE-1CRATE ?auto_21150 ?auto_21151 )
      ( MAKE-13CRATE-VERIFY ?auto_21138 ?auto_21139 ?auto_21140 ?auto_21141 ?auto_21142 ?auto_21143 ?auto_21146 ?auto_21145 ?auto_21144 ?auto_21147 ?auto_21149 ?auto_21148 ?auto_21150 ?auto_21151 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21192 - SURFACE
      ?auto_21193 - SURFACE
    )
    :vars
    (
      ?auto_21194 - HOIST
      ?auto_21195 - PLACE
      ?auto_21197 - PLACE
      ?auto_21198 - HOIST
      ?auto_21199 - SURFACE
      ?auto_21196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21194 ?auto_21195 ) ( SURFACE-AT ?auto_21192 ?auto_21195 ) ( CLEAR ?auto_21192 ) ( IS-CRATE ?auto_21193 ) ( AVAILABLE ?auto_21194 ) ( not ( = ?auto_21197 ?auto_21195 ) ) ( HOIST-AT ?auto_21198 ?auto_21197 ) ( AVAILABLE ?auto_21198 ) ( SURFACE-AT ?auto_21193 ?auto_21197 ) ( ON ?auto_21193 ?auto_21199 ) ( CLEAR ?auto_21193 ) ( TRUCK-AT ?auto_21196 ?auto_21195 ) ( not ( = ?auto_21192 ?auto_21193 ) ) ( not ( = ?auto_21192 ?auto_21199 ) ) ( not ( = ?auto_21193 ?auto_21199 ) ) ( not ( = ?auto_21194 ?auto_21198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21196 ?auto_21195 ?auto_21197 )
      ( !LIFT ?auto_21198 ?auto_21193 ?auto_21199 ?auto_21197 )
      ( !LOAD ?auto_21198 ?auto_21193 ?auto_21196 ?auto_21197 )
      ( !DRIVE ?auto_21196 ?auto_21197 ?auto_21195 )
      ( !UNLOAD ?auto_21194 ?auto_21193 ?auto_21196 ?auto_21195 )
      ( !DROP ?auto_21194 ?auto_21193 ?auto_21192 ?auto_21195 )
      ( MAKE-1CRATE-VERIFY ?auto_21192 ?auto_21193 ) )
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
      ?auto_21223 - SURFACE
      ?auto_21222 - SURFACE
      ?auto_21221 - SURFACE
      ?auto_21224 - SURFACE
      ?auto_21226 - SURFACE
      ?auto_21225 - SURFACE
      ?auto_21227 - SURFACE
      ?auto_21229 - SURFACE
      ?auto_21228 - SURFACE
    )
    :vars
    (
      ?auto_21231 - HOIST
      ?auto_21234 - PLACE
      ?auto_21235 - PLACE
      ?auto_21233 - HOIST
      ?auto_21230 - SURFACE
      ?auto_21244 - PLACE
      ?auto_21245 - HOIST
      ?auto_21252 - SURFACE
      ?auto_21265 - PLACE
      ?auto_21236 - HOIST
      ?auto_21256 - SURFACE
      ?auto_21258 - PLACE
      ?auto_21254 - HOIST
      ?auto_21263 - SURFACE
      ?auto_21268 - PLACE
      ?auto_21247 - HOIST
      ?auto_21246 - SURFACE
      ?auto_21243 - PLACE
      ?auto_21260 - HOIST
      ?auto_21266 - SURFACE
      ?auto_21250 - SURFACE
      ?auto_21267 - PLACE
      ?auto_21239 - HOIST
      ?auto_21242 - SURFACE
      ?auto_21238 - PLACE
      ?auto_21241 - HOIST
      ?auto_21257 - SURFACE
      ?auto_21264 - PLACE
      ?auto_21237 - HOIST
      ?auto_21262 - SURFACE
      ?auto_21255 - SURFACE
      ?auto_21251 - SURFACE
      ?auto_21259 - PLACE
      ?auto_21261 - HOIST
      ?auto_21240 - SURFACE
      ?auto_21248 - PLACE
      ?auto_21253 - HOIST
      ?auto_21249 - SURFACE
      ?auto_21232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21231 ?auto_21234 ) ( IS-CRATE ?auto_21228 ) ( not ( = ?auto_21235 ?auto_21234 ) ) ( HOIST-AT ?auto_21233 ?auto_21235 ) ( SURFACE-AT ?auto_21228 ?auto_21235 ) ( ON ?auto_21228 ?auto_21230 ) ( CLEAR ?auto_21228 ) ( not ( = ?auto_21229 ?auto_21228 ) ) ( not ( = ?auto_21229 ?auto_21230 ) ) ( not ( = ?auto_21228 ?auto_21230 ) ) ( not ( = ?auto_21231 ?auto_21233 ) ) ( IS-CRATE ?auto_21229 ) ( not ( = ?auto_21244 ?auto_21234 ) ) ( HOIST-AT ?auto_21245 ?auto_21244 ) ( AVAILABLE ?auto_21245 ) ( SURFACE-AT ?auto_21229 ?auto_21244 ) ( ON ?auto_21229 ?auto_21252 ) ( CLEAR ?auto_21229 ) ( not ( = ?auto_21227 ?auto_21229 ) ) ( not ( = ?auto_21227 ?auto_21252 ) ) ( not ( = ?auto_21229 ?auto_21252 ) ) ( not ( = ?auto_21231 ?auto_21245 ) ) ( IS-CRATE ?auto_21227 ) ( not ( = ?auto_21265 ?auto_21234 ) ) ( HOIST-AT ?auto_21236 ?auto_21265 ) ( SURFACE-AT ?auto_21227 ?auto_21265 ) ( ON ?auto_21227 ?auto_21256 ) ( CLEAR ?auto_21227 ) ( not ( = ?auto_21225 ?auto_21227 ) ) ( not ( = ?auto_21225 ?auto_21256 ) ) ( not ( = ?auto_21227 ?auto_21256 ) ) ( not ( = ?auto_21231 ?auto_21236 ) ) ( IS-CRATE ?auto_21225 ) ( not ( = ?auto_21258 ?auto_21234 ) ) ( HOIST-AT ?auto_21254 ?auto_21258 ) ( SURFACE-AT ?auto_21225 ?auto_21258 ) ( ON ?auto_21225 ?auto_21263 ) ( CLEAR ?auto_21225 ) ( not ( = ?auto_21226 ?auto_21225 ) ) ( not ( = ?auto_21226 ?auto_21263 ) ) ( not ( = ?auto_21225 ?auto_21263 ) ) ( not ( = ?auto_21231 ?auto_21254 ) ) ( IS-CRATE ?auto_21226 ) ( not ( = ?auto_21268 ?auto_21234 ) ) ( HOIST-AT ?auto_21247 ?auto_21268 ) ( AVAILABLE ?auto_21247 ) ( SURFACE-AT ?auto_21226 ?auto_21268 ) ( ON ?auto_21226 ?auto_21246 ) ( CLEAR ?auto_21226 ) ( not ( = ?auto_21224 ?auto_21226 ) ) ( not ( = ?auto_21224 ?auto_21246 ) ) ( not ( = ?auto_21226 ?auto_21246 ) ) ( not ( = ?auto_21231 ?auto_21247 ) ) ( IS-CRATE ?auto_21224 ) ( not ( = ?auto_21243 ?auto_21234 ) ) ( HOIST-AT ?auto_21260 ?auto_21243 ) ( AVAILABLE ?auto_21260 ) ( SURFACE-AT ?auto_21224 ?auto_21243 ) ( ON ?auto_21224 ?auto_21266 ) ( CLEAR ?auto_21224 ) ( not ( = ?auto_21221 ?auto_21224 ) ) ( not ( = ?auto_21221 ?auto_21266 ) ) ( not ( = ?auto_21224 ?auto_21266 ) ) ( not ( = ?auto_21231 ?auto_21260 ) ) ( IS-CRATE ?auto_21221 ) ( AVAILABLE ?auto_21233 ) ( SURFACE-AT ?auto_21221 ?auto_21235 ) ( ON ?auto_21221 ?auto_21250 ) ( CLEAR ?auto_21221 ) ( not ( = ?auto_21222 ?auto_21221 ) ) ( not ( = ?auto_21222 ?auto_21250 ) ) ( not ( = ?auto_21221 ?auto_21250 ) ) ( IS-CRATE ?auto_21222 ) ( not ( = ?auto_21267 ?auto_21234 ) ) ( HOIST-AT ?auto_21239 ?auto_21267 ) ( AVAILABLE ?auto_21239 ) ( SURFACE-AT ?auto_21222 ?auto_21267 ) ( ON ?auto_21222 ?auto_21242 ) ( CLEAR ?auto_21222 ) ( not ( = ?auto_21223 ?auto_21222 ) ) ( not ( = ?auto_21223 ?auto_21242 ) ) ( not ( = ?auto_21222 ?auto_21242 ) ) ( not ( = ?auto_21231 ?auto_21239 ) ) ( IS-CRATE ?auto_21223 ) ( not ( = ?auto_21238 ?auto_21234 ) ) ( HOIST-AT ?auto_21241 ?auto_21238 ) ( AVAILABLE ?auto_21241 ) ( SURFACE-AT ?auto_21223 ?auto_21238 ) ( ON ?auto_21223 ?auto_21257 ) ( CLEAR ?auto_21223 ) ( not ( = ?auto_21220 ?auto_21223 ) ) ( not ( = ?auto_21220 ?auto_21257 ) ) ( not ( = ?auto_21223 ?auto_21257 ) ) ( not ( = ?auto_21231 ?auto_21241 ) ) ( IS-CRATE ?auto_21220 ) ( not ( = ?auto_21264 ?auto_21234 ) ) ( HOIST-AT ?auto_21237 ?auto_21264 ) ( AVAILABLE ?auto_21237 ) ( SURFACE-AT ?auto_21220 ?auto_21264 ) ( ON ?auto_21220 ?auto_21262 ) ( CLEAR ?auto_21220 ) ( not ( = ?auto_21219 ?auto_21220 ) ) ( not ( = ?auto_21219 ?auto_21262 ) ) ( not ( = ?auto_21220 ?auto_21262 ) ) ( not ( = ?auto_21231 ?auto_21237 ) ) ( IS-CRATE ?auto_21219 ) ( AVAILABLE ?auto_21236 ) ( SURFACE-AT ?auto_21219 ?auto_21265 ) ( ON ?auto_21219 ?auto_21255 ) ( CLEAR ?auto_21219 ) ( not ( = ?auto_21218 ?auto_21219 ) ) ( not ( = ?auto_21218 ?auto_21255 ) ) ( not ( = ?auto_21219 ?auto_21255 ) ) ( IS-CRATE ?auto_21218 ) ( AVAILABLE ?auto_21254 ) ( SURFACE-AT ?auto_21218 ?auto_21258 ) ( ON ?auto_21218 ?auto_21251 ) ( CLEAR ?auto_21218 ) ( not ( = ?auto_21217 ?auto_21218 ) ) ( not ( = ?auto_21217 ?auto_21251 ) ) ( not ( = ?auto_21218 ?auto_21251 ) ) ( IS-CRATE ?auto_21217 ) ( not ( = ?auto_21259 ?auto_21234 ) ) ( HOIST-AT ?auto_21261 ?auto_21259 ) ( AVAILABLE ?auto_21261 ) ( SURFACE-AT ?auto_21217 ?auto_21259 ) ( ON ?auto_21217 ?auto_21240 ) ( CLEAR ?auto_21217 ) ( not ( = ?auto_21216 ?auto_21217 ) ) ( not ( = ?auto_21216 ?auto_21240 ) ) ( not ( = ?auto_21217 ?auto_21240 ) ) ( not ( = ?auto_21231 ?auto_21261 ) ) ( SURFACE-AT ?auto_21215 ?auto_21234 ) ( CLEAR ?auto_21215 ) ( IS-CRATE ?auto_21216 ) ( AVAILABLE ?auto_21231 ) ( not ( = ?auto_21248 ?auto_21234 ) ) ( HOIST-AT ?auto_21253 ?auto_21248 ) ( AVAILABLE ?auto_21253 ) ( SURFACE-AT ?auto_21216 ?auto_21248 ) ( ON ?auto_21216 ?auto_21249 ) ( CLEAR ?auto_21216 ) ( TRUCK-AT ?auto_21232 ?auto_21234 ) ( not ( = ?auto_21215 ?auto_21216 ) ) ( not ( = ?auto_21215 ?auto_21249 ) ) ( not ( = ?auto_21216 ?auto_21249 ) ) ( not ( = ?auto_21231 ?auto_21253 ) ) ( not ( = ?auto_21215 ?auto_21217 ) ) ( not ( = ?auto_21215 ?auto_21240 ) ) ( not ( = ?auto_21217 ?auto_21249 ) ) ( not ( = ?auto_21259 ?auto_21248 ) ) ( not ( = ?auto_21261 ?auto_21253 ) ) ( not ( = ?auto_21240 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21218 ) ) ( not ( = ?auto_21215 ?auto_21251 ) ) ( not ( = ?auto_21216 ?auto_21218 ) ) ( not ( = ?auto_21216 ?auto_21251 ) ) ( not ( = ?auto_21218 ?auto_21240 ) ) ( not ( = ?auto_21218 ?auto_21249 ) ) ( not ( = ?auto_21258 ?auto_21259 ) ) ( not ( = ?auto_21258 ?auto_21248 ) ) ( not ( = ?auto_21254 ?auto_21261 ) ) ( not ( = ?auto_21254 ?auto_21253 ) ) ( not ( = ?auto_21251 ?auto_21240 ) ) ( not ( = ?auto_21251 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21219 ) ) ( not ( = ?auto_21215 ?auto_21255 ) ) ( not ( = ?auto_21216 ?auto_21219 ) ) ( not ( = ?auto_21216 ?auto_21255 ) ) ( not ( = ?auto_21217 ?auto_21219 ) ) ( not ( = ?auto_21217 ?auto_21255 ) ) ( not ( = ?auto_21219 ?auto_21251 ) ) ( not ( = ?auto_21219 ?auto_21240 ) ) ( not ( = ?auto_21219 ?auto_21249 ) ) ( not ( = ?auto_21265 ?auto_21258 ) ) ( not ( = ?auto_21265 ?auto_21259 ) ) ( not ( = ?auto_21265 ?auto_21248 ) ) ( not ( = ?auto_21236 ?auto_21254 ) ) ( not ( = ?auto_21236 ?auto_21261 ) ) ( not ( = ?auto_21236 ?auto_21253 ) ) ( not ( = ?auto_21255 ?auto_21251 ) ) ( not ( = ?auto_21255 ?auto_21240 ) ) ( not ( = ?auto_21255 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21220 ) ) ( not ( = ?auto_21215 ?auto_21262 ) ) ( not ( = ?auto_21216 ?auto_21220 ) ) ( not ( = ?auto_21216 ?auto_21262 ) ) ( not ( = ?auto_21217 ?auto_21220 ) ) ( not ( = ?auto_21217 ?auto_21262 ) ) ( not ( = ?auto_21218 ?auto_21220 ) ) ( not ( = ?auto_21218 ?auto_21262 ) ) ( not ( = ?auto_21220 ?auto_21255 ) ) ( not ( = ?auto_21220 ?auto_21251 ) ) ( not ( = ?auto_21220 ?auto_21240 ) ) ( not ( = ?auto_21220 ?auto_21249 ) ) ( not ( = ?auto_21264 ?auto_21265 ) ) ( not ( = ?auto_21264 ?auto_21258 ) ) ( not ( = ?auto_21264 ?auto_21259 ) ) ( not ( = ?auto_21264 ?auto_21248 ) ) ( not ( = ?auto_21237 ?auto_21236 ) ) ( not ( = ?auto_21237 ?auto_21254 ) ) ( not ( = ?auto_21237 ?auto_21261 ) ) ( not ( = ?auto_21237 ?auto_21253 ) ) ( not ( = ?auto_21262 ?auto_21255 ) ) ( not ( = ?auto_21262 ?auto_21251 ) ) ( not ( = ?auto_21262 ?auto_21240 ) ) ( not ( = ?auto_21262 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21223 ) ) ( not ( = ?auto_21215 ?auto_21257 ) ) ( not ( = ?auto_21216 ?auto_21223 ) ) ( not ( = ?auto_21216 ?auto_21257 ) ) ( not ( = ?auto_21217 ?auto_21223 ) ) ( not ( = ?auto_21217 ?auto_21257 ) ) ( not ( = ?auto_21218 ?auto_21223 ) ) ( not ( = ?auto_21218 ?auto_21257 ) ) ( not ( = ?auto_21219 ?auto_21223 ) ) ( not ( = ?auto_21219 ?auto_21257 ) ) ( not ( = ?auto_21223 ?auto_21262 ) ) ( not ( = ?auto_21223 ?auto_21255 ) ) ( not ( = ?auto_21223 ?auto_21251 ) ) ( not ( = ?auto_21223 ?auto_21240 ) ) ( not ( = ?auto_21223 ?auto_21249 ) ) ( not ( = ?auto_21238 ?auto_21264 ) ) ( not ( = ?auto_21238 ?auto_21265 ) ) ( not ( = ?auto_21238 ?auto_21258 ) ) ( not ( = ?auto_21238 ?auto_21259 ) ) ( not ( = ?auto_21238 ?auto_21248 ) ) ( not ( = ?auto_21241 ?auto_21237 ) ) ( not ( = ?auto_21241 ?auto_21236 ) ) ( not ( = ?auto_21241 ?auto_21254 ) ) ( not ( = ?auto_21241 ?auto_21261 ) ) ( not ( = ?auto_21241 ?auto_21253 ) ) ( not ( = ?auto_21257 ?auto_21262 ) ) ( not ( = ?auto_21257 ?auto_21255 ) ) ( not ( = ?auto_21257 ?auto_21251 ) ) ( not ( = ?auto_21257 ?auto_21240 ) ) ( not ( = ?auto_21257 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21222 ) ) ( not ( = ?auto_21215 ?auto_21242 ) ) ( not ( = ?auto_21216 ?auto_21222 ) ) ( not ( = ?auto_21216 ?auto_21242 ) ) ( not ( = ?auto_21217 ?auto_21222 ) ) ( not ( = ?auto_21217 ?auto_21242 ) ) ( not ( = ?auto_21218 ?auto_21222 ) ) ( not ( = ?auto_21218 ?auto_21242 ) ) ( not ( = ?auto_21219 ?auto_21222 ) ) ( not ( = ?auto_21219 ?auto_21242 ) ) ( not ( = ?auto_21220 ?auto_21222 ) ) ( not ( = ?auto_21220 ?auto_21242 ) ) ( not ( = ?auto_21222 ?auto_21257 ) ) ( not ( = ?auto_21222 ?auto_21262 ) ) ( not ( = ?auto_21222 ?auto_21255 ) ) ( not ( = ?auto_21222 ?auto_21251 ) ) ( not ( = ?auto_21222 ?auto_21240 ) ) ( not ( = ?auto_21222 ?auto_21249 ) ) ( not ( = ?auto_21267 ?auto_21238 ) ) ( not ( = ?auto_21267 ?auto_21264 ) ) ( not ( = ?auto_21267 ?auto_21265 ) ) ( not ( = ?auto_21267 ?auto_21258 ) ) ( not ( = ?auto_21267 ?auto_21259 ) ) ( not ( = ?auto_21267 ?auto_21248 ) ) ( not ( = ?auto_21239 ?auto_21241 ) ) ( not ( = ?auto_21239 ?auto_21237 ) ) ( not ( = ?auto_21239 ?auto_21236 ) ) ( not ( = ?auto_21239 ?auto_21254 ) ) ( not ( = ?auto_21239 ?auto_21261 ) ) ( not ( = ?auto_21239 ?auto_21253 ) ) ( not ( = ?auto_21242 ?auto_21257 ) ) ( not ( = ?auto_21242 ?auto_21262 ) ) ( not ( = ?auto_21242 ?auto_21255 ) ) ( not ( = ?auto_21242 ?auto_21251 ) ) ( not ( = ?auto_21242 ?auto_21240 ) ) ( not ( = ?auto_21242 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21221 ) ) ( not ( = ?auto_21215 ?auto_21250 ) ) ( not ( = ?auto_21216 ?auto_21221 ) ) ( not ( = ?auto_21216 ?auto_21250 ) ) ( not ( = ?auto_21217 ?auto_21221 ) ) ( not ( = ?auto_21217 ?auto_21250 ) ) ( not ( = ?auto_21218 ?auto_21221 ) ) ( not ( = ?auto_21218 ?auto_21250 ) ) ( not ( = ?auto_21219 ?auto_21221 ) ) ( not ( = ?auto_21219 ?auto_21250 ) ) ( not ( = ?auto_21220 ?auto_21221 ) ) ( not ( = ?auto_21220 ?auto_21250 ) ) ( not ( = ?auto_21223 ?auto_21221 ) ) ( not ( = ?auto_21223 ?auto_21250 ) ) ( not ( = ?auto_21221 ?auto_21242 ) ) ( not ( = ?auto_21221 ?auto_21257 ) ) ( not ( = ?auto_21221 ?auto_21262 ) ) ( not ( = ?auto_21221 ?auto_21255 ) ) ( not ( = ?auto_21221 ?auto_21251 ) ) ( not ( = ?auto_21221 ?auto_21240 ) ) ( not ( = ?auto_21221 ?auto_21249 ) ) ( not ( = ?auto_21235 ?auto_21267 ) ) ( not ( = ?auto_21235 ?auto_21238 ) ) ( not ( = ?auto_21235 ?auto_21264 ) ) ( not ( = ?auto_21235 ?auto_21265 ) ) ( not ( = ?auto_21235 ?auto_21258 ) ) ( not ( = ?auto_21235 ?auto_21259 ) ) ( not ( = ?auto_21235 ?auto_21248 ) ) ( not ( = ?auto_21233 ?auto_21239 ) ) ( not ( = ?auto_21233 ?auto_21241 ) ) ( not ( = ?auto_21233 ?auto_21237 ) ) ( not ( = ?auto_21233 ?auto_21236 ) ) ( not ( = ?auto_21233 ?auto_21254 ) ) ( not ( = ?auto_21233 ?auto_21261 ) ) ( not ( = ?auto_21233 ?auto_21253 ) ) ( not ( = ?auto_21250 ?auto_21242 ) ) ( not ( = ?auto_21250 ?auto_21257 ) ) ( not ( = ?auto_21250 ?auto_21262 ) ) ( not ( = ?auto_21250 ?auto_21255 ) ) ( not ( = ?auto_21250 ?auto_21251 ) ) ( not ( = ?auto_21250 ?auto_21240 ) ) ( not ( = ?auto_21250 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21224 ) ) ( not ( = ?auto_21215 ?auto_21266 ) ) ( not ( = ?auto_21216 ?auto_21224 ) ) ( not ( = ?auto_21216 ?auto_21266 ) ) ( not ( = ?auto_21217 ?auto_21224 ) ) ( not ( = ?auto_21217 ?auto_21266 ) ) ( not ( = ?auto_21218 ?auto_21224 ) ) ( not ( = ?auto_21218 ?auto_21266 ) ) ( not ( = ?auto_21219 ?auto_21224 ) ) ( not ( = ?auto_21219 ?auto_21266 ) ) ( not ( = ?auto_21220 ?auto_21224 ) ) ( not ( = ?auto_21220 ?auto_21266 ) ) ( not ( = ?auto_21223 ?auto_21224 ) ) ( not ( = ?auto_21223 ?auto_21266 ) ) ( not ( = ?auto_21222 ?auto_21224 ) ) ( not ( = ?auto_21222 ?auto_21266 ) ) ( not ( = ?auto_21224 ?auto_21250 ) ) ( not ( = ?auto_21224 ?auto_21242 ) ) ( not ( = ?auto_21224 ?auto_21257 ) ) ( not ( = ?auto_21224 ?auto_21262 ) ) ( not ( = ?auto_21224 ?auto_21255 ) ) ( not ( = ?auto_21224 ?auto_21251 ) ) ( not ( = ?auto_21224 ?auto_21240 ) ) ( not ( = ?auto_21224 ?auto_21249 ) ) ( not ( = ?auto_21243 ?auto_21235 ) ) ( not ( = ?auto_21243 ?auto_21267 ) ) ( not ( = ?auto_21243 ?auto_21238 ) ) ( not ( = ?auto_21243 ?auto_21264 ) ) ( not ( = ?auto_21243 ?auto_21265 ) ) ( not ( = ?auto_21243 ?auto_21258 ) ) ( not ( = ?auto_21243 ?auto_21259 ) ) ( not ( = ?auto_21243 ?auto_21248 ) ) ( not ( = ?auto_21260 ?auto_21233 ) ) ( not ( = ?auto_21260 ?auto_21239 ) ) ( not ( = ?auto_21260 ?auto_21241 ) ) ( not ( = ?auto_21260 ?auto_21237 ) ) ( not ( = ?auto_21260 ?auto_21236 ) ) ( not ( = ?auto_21260 ?auto_21254 ) ) ( not ( = ?auto_21260 ?auto_21261 ) ) ( not ( = ?auto_21260 ?auto_21253 ) ) ( not ( = ?auto_21266 ?auto_21250 ) ) ( not ( = ?auto_21266 ?auto_21242 ) ) ( not ( = ?auto_21266 ?auto_21257 ) ) ( not ( = ?auto_21266 ?auto_21262 ) ) ( not ( = ?auto_21266 ?auto_21255 ) ) ( not ( = ?auto_21266 ?auto_21251 ) ) ( not ( = ?auto_21266 ?auto_21240 ) ) ( not ( = ?auto_21266 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21226 ) ) ( not ( = ?auto_21215 ?auto_21246 ) ) ( not ( = ?auto_21216 ?auto_21226 ) ) ( not ( = ?auto_21216 ?auto_21246 ) ) ( not ( = ?auto_21217 ?auto_21226 ) ) ( not ( = ?auto_21217 ?auto_21246 ) ) ( not ( = ?auto_21218 ?auto_21226 ) ) ( not ( = ?auto_21218 ?auto_21246 ) ) ( not ( = ?auto_21219 ?auto_21226 ) ) ( not ( = ?auto_21219 ?auto_21246 ) ) ( not ( = ?auto_21220 ?auto_21226 ) ) ( not ( = ?auto_21220 ?auto_21246 ) ) ( not ( = ?auto_21223 ?auto_21226 ) ) ( not ( = ?auto_21223 ?auto_21246 ) ) ( not ( = ?auto_21222 ?auto_21226 ) ) ( not ( = ?auto_21222 ?auto_21246 ) ) ( not ( = ?auto_21221 ?auto_21226 ) ) ( not ( = ?auto_21221 ?auto_21246 ) ) ( not ( = ?auto_21226 ?auto_21266 ) ) ( not ( = ?auto_21226 ?auto_21250 ) ) ( not ( = ?auto_21226 ?auto_21242 ) ) ( not ( = ?auto_21226 ?auto_21257 ) ) ( not ( = ?auto_21226 ?auto_21262 ) ) ( not ( = ?auto_21226 ?auto_21255 ) ) ( not ( = ?auto_21226 ?auto_21251 ) ) ( not ( = ?auto_21226 ?auto_21240 ) ) ( not ( = ?auto_21226 ?auto_21249 ) ) ( not ( = ?auto_21268 ?auto_21243 ) ) ( not ( = ?auto_21268 ?auto_21235 ) ) ( not ( = ?auto_21268 ?auto_21267 ) ) ( not ( = ?auto_21268 ?auto_21238 ) ) ( not ( = ?auto_21268 ?auto_21264 ) ) ( not ( = ?auto_21268 ?auto_21265 ) ) ( not ( = ?auto_21268 ?auto_21258 ) ) ( not ( = ?auto_21268 ?auto_21259 ) ) ( not ( = ?auto_21268 ?auto_21248 ) ) ( not ( = ?auto_21247 ?auto_21260 ) ) ( not ( = ?auto_21247 ?auto_21233 ) ) ( not ( = ?auto_21247 ?auto_21239 ) ) ( not ( = ?auto_21247 ?auto_21241 ) ) ( not ( = ?auto_21247 ?auto_21237 ) ) ( not ( = ?auto_21247 ?auto_21236 ) ) ( not ( = ?auto_21247 ?auto_21254 ) ) ( not ( = ?auto_21247 ?auto_21261 ) ) ( not ( = ?auto_21247 ?auto_21253 ) ) ( not ( = ?auto_21246 ?auto_21266 ) ) ( not ( = ?auto_21246 ?auto_21250 ) ) ( not ( = ?auto_21246 ?auto_21242 ) ) ( not ( = ?auto_21246 ?auto_21257 ) ) ( not ( = ?auto_21246 ?auto_21262 ) ) ( not ( = ?auto_21246 ?auto_21255 ) ) ( not ( = ?auto_21246 ?auto_21251 ) ) ( not ( = ?auto_21246 ?auto_21240 ) ) ( not ( = ?auto_21246 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21225 ) ) ( not ( = ?auto_21215 ?auto_21263 ) ) ( not ( = ?auto_21216 ?auto_21225 ) ) ( not ( = ?auto_21216 ?auto_21263 ) ) ( not ( = ?auto_21217 ?auto_21225 ) ) ( not ( = ?auto_21217 ?auto_21263 ) ) ( not ( = ?auto_21218 ?auto_21225 ) ) ( not ( = ?auto_21218 ?auto_21263 ) ) ( not ( = ?auto_21219 ?auto_21225 ) ) ( not ( = ?auto_21219 ?auto_21263 ) ) ( not ( = ?auto_21220 ?auto_21225 ) ) ( not ( = ?auto_21220 ?auto_21263 ) ) ( not ( = ?auto_21223 ?auto_21225 ) ) ( not ( = ?auto_21223 ?auto_21263 ) ) ( not ( = ?auto_21222 ?auto_21225 ) ) ( not ( = ?auto_21222 ?auto_21263 ) ) ( not ( = ?auto_21221 ?auto_21225 ) ) ( not ( = ?auto_21221 ?auto_21263 ) ) ( not ( = ?auto_21224 ?auto_21225 ) ) ( not ( = ?auto_21224 ?auto_21263 ) ) ( not ( = ?auto_21225 ?auto_21246 ) ) ( not ( = ?auto_21225 ?auto_21266 ) ) ( not ( = ?auto_21225 ?auto_21250 ) ) ( not ( = ?auto_21225 ?auto_21242 ) ) ( not ( = ?auto_21225 ?auto_21257 ) ) ( not ( = ?auto_21225 ?auto_21262 ) ) ( not ( = ?auto_21225 ?auto_21255 ) ) ( not ( = ?auto_21225 ?auto_21251 ) ) ( not ( = ?auto_21225 ?auto_21240 ) ) ( not ( = ?auto_21225 ?auto_21249 ) ) ( not ( = ?auto_21263 ?auto_21246 ) ) ( not ( = ?auto_21263 ?auto_21266 ) ) ( not ( = ?auto_21263 ?auto_21250 ) ) ( not ( = ?auto_21263 ?auto_21242 ) ) ( not ( = ?auto_21263 ?auto_21257 ) ) ( not ( = ?auto_21263 ?auto_21262 ) ) ( not ( = ?auto_21263 ?auto_21255 ) ) ( not ( = ?auto_21263 ?auto_21251 ) ) ( not ( = ?auto_21263 ?auto_21240 ) ) ( not ( = ?auto_21263 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21227 ) ) ( not ( = ?auto_21215 ?auto_21256 ) ) ( not ( = ?auto_21216 ?auto_21227 ) ) ( not ( = ?auto_21216 ?auto_21256 ) ) ( not ( = ?auto_21217 ?auto_21227 ) ) ( not ( = ?auto_21217 ?auto_21256 ) ) ( not ( = ?auto_21218 ?auto_21227 ) ) ( not ( = ?auto_21218 ?auto_21256 ) ) ( not ( = ?auto_21219 ?auto_21227 ) ) ( not ( = ?auto_21219 ?auto_21256 ) ) ( not ( = ?auto_21220 ?auto_21227 ) ) ( not ( = ?auto_21220 ?auto_21256 ) ) ( not ( = ?auto_21223 ?auto_21227 ) ) ( not ( = ?auto_21223 ?auto_21256 ) ) ( not ( = ?auto_21222 ?auto_21227 ) ) ( not ( = ?auto_21222 ?auto_21256 ) ) ( not ( = ?auto_21221 ?auto_21227 ) ) ( not ( = ?auto_21221 ?auto_21256 ) ) ( not ( = ?auto_21224 ?auto_21227 ) ) ( not ( = ?auto_21224 ?auto_21256 ) ) ( not ( = ?auto_21226 ?auto_21227 ) ) ( not ( = ?auto_21226 ?auto_21256 ) ) ( not ( = ?auto_21227 ?auto_21263 ) ) ( not ( = ?auto_21227 ?auto_21246 ) ) ( not ( = ?auto_21227 ?auto_21266 ) ) ( not ( = ?auto_21227 ?auto_21250 ) ) ( not ( = ?auto_21227 ?auto_21242 ) ) ( not ( = ?auto_21227 ?auto_21257 ) ) ( not ( = ?auto_21227 ?auto_21262 ) ) ( not ( = ?auto_21227 ?auto_21255 ) ) ( not ( = ?auto_21227 ?auto_21251 ) ) ( not ( = ?auto_21227 ?auto_21240 ) ) ( not ( = ?auto_21227 ?auto_21249 ) ) ( not ( = ?auto_21256 ?auto_21263 ) ) ( not ( = ?auto_21256 ?auto_21246 ) ) ( not ( = ?auto_21256 ?auto_21266 ) ) ( not ( = ?auto_21256 ?auto_21250 ) ) ( not ( = ?auto_21256 ?auto_21242 ) ) ( not ( = ?auto_21256 ?auto_21257 ) ) ( not ( = ?auto_21256 ?auto_21262 ) ) ( not ( = ?auto_21256 ?auto_21255 ) ) ( not ( = ?auto_21256 ?auto_21251 ) ) ( not ( = ?auto_21256 ?auto_21240 ) ) ( not ( = ?auto_21256 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21229 ) ) ( not ( = ?auto_21215 ?auto_21252 ) ) ( not ( = ?auto_21216 ?auto_21229 ) ) ( not ( = ?auto_21216 ?auto_21252 ) ) ( not ( = ?auto_21217 ?auto_21229 ) ) ( not ( = ?auto_21217 ?auto_21252 ) ) ( not ( = ?auto_21218 ?auto_21229 ) ) ( not ( = ?auto_21218 ?auto_21252 ) ) ( not ( = ?auto_21219 ?auto_21229 ) ) ( not ( = ?auto_21219 ?auto_21252 ) ) ( not ( = ?auto_21220 ?auto_21229 ) ) ( not ( = ?auto_21220 ?auto_21252 ) ) ( not ( = ?auto_21223 ?auto_21229 ) ) ( not ( = ?auto_21223 ?auto_21252 ) ) ( not ( = ?auto_21222 ?auto_21229 ) ) ( not ( = ?auto_21222 ?auto_21252 ) ) ( not ( = ?auto_21221 ?auto_21229 ) ) ( not ( = ?auto_21221 ?auto_21252 ) ) ( not ( = ?auto_21224 ?auto_21229 ) ) ( not ( = ?auto_21224 ?auto_21252 ) ) ( not ( = ?auto_21226 ?auto_21229 ) ) ( not ( = ?auto_21226 ?auto_21252 ) ) ( not ( = ?auto_21225 ?auto_21229 ) ) ( not ( = ?auto_21225 ?auto_21252 ) ) ( not ( = ?auto_21229 ?auto_21256 ) ) ( not ( = ?auto_21229 ?auto_21263 ) ) ( not ( = ?auto_21229 ?auto_21246 ) ) ( not ( = ?auto_21229 ?auto_21266 ) ) ( not ( = ?auto_21229 ?auto_21250 ) ) ( not ( = ?auto_21229 ?auto_21242 ) ) ( not ( = ?auto_21229 ?auto_21257 ) ) ( not ( = ?auto_21229 ?auto_21262 ) ) ( not ( = ?auto_21229 ?auto_21255 ) ) ( not ( = ?auto_21229 ?auto_21251 ) ) ( not ( = ?auto_21229 ?auto_21240 ) ) ( not ( = ?auto_21229 ?auto_21249 ) ) ( not ( = ?auto_21244 ?auto_21265 ) ) ( not ( = ?auto_21244 ?auto_21258 ) ) ( not ( = ?auto_21244 ?auto_21268 ) ) ( not ( = ?auto_21244 ?auto_21243 ) ) ( not ( = ?auto_21244 ?auto_21235 ) ) ( not ( = ?auto_21244 ?auto_21267 ) ) ( not ( = ?auto_21244 ?auto_21238 ) ) ( not ( = ?auto_21244 ?auto_21264 ) ) ( not ( = ?auto_21244 ?auto_21259 ) ) ( not ( = ?auto_21244 ?auto_21248 ) ) ( not ( = ?auto_21245 ?auto_21236 ) ) ( not ( = ?auto_21245 ?auto_21254 ) ) ( not ( = ?auto_21245 ?auto_21247 ) ) ( not ( = ?auto_21245 ?auto_21260 ) ) ( not ( = ?auto_21245 ?auto_21233 ) ) ( not ( = ?auto_21245 ?auto_21239 ) ) ( not ( = ?auto_21245 ?auto_21241 ) ) ( not ( = ?auto_21245 ?auto_21237 ) ) ( not ( = ?auto_21245 ?auto_21261 ) ) ( not ( = ?auto_21245 ?auto_21253 ) ) ( not ( = ?auto_21252 ?auto_21256 ) ) ( not ( = ?auto_21252 ?auto_21263 ) ) ( not ( = ?auto_21252 ?auto_21246 ) ) ( not ( = ?auto_21252 ?auto_21266 ) ) ( not ( = ?auto_21252 ?auto_21250 ) ) ( not ( = ?auto_21252 ?auto_21242 ) ) ( not ( = ?auto_21252 ?auto_21257 ) ) ( not ( = ?auto_21252 ?auto_21262 ) ) ( not ( = ?auto_21252 ?auto_21255 ) ) ( not ( = ?auto_21252 ?auto_21251 ) ) ( not ( = ?auto_21252 ?auto_21240 ) ) ( not ( = ?auto_21252 ?auto_21249 ) ) ( not ( = ?auto_21215 ?auto_21228 ) ) ( not ( = ?auto_21215 ?auto_21230 ) ) ( not ( = ?auto_21216 ?auto_21228 ) ) ( not ( = ?auto_21216 ?auto_21230 ) ) ( not ( = ?auto_21217 ?auto_21228 ) ) ( not ( = ?auto_21217 ?auto_21230 ) ) ( not ( = ?auto_21218 ?auto_21228 ) ) ( not ( = ?auto_21218 ?auto_21230 ) ) ( not ( = ?auto_21219 ?auto_21228 ) ) ( not ( = ?auto_21219 ?auto_21230 ) ) ( not ( = ?auto_21220 ?auto_21228 ) ) ( not ( = ?auto_21220 ?auto_21230 ) ) ( not ( = ?auto_21223 ?auto_21228 ) ) ( not ( = ?auto_21223 ?auto_21230 ) ) ( not ( = ?auto_21222 ?auto_21228 ) ) ( not ( = ?auto_21222 ?auto_21230 ) ) ( not ( = ?auto_21221 ?auto_21228 ) ) ( not ( = ?auto_21221 ?auto_21230 ) ) ( not ( = ?auto_21224 ?auto_21228 ) ) ( not ( = ?auto_21224 ?auto_21230 ) ) ( not ( = ?auto_21226 ?auto_21228 ) ) ( not ( = ?auto_21226 ?auto_21230 ) ) ( not ( = ?auto_21225 ?auto_21228 ) ) ( not ( = ?auto_21225 ?auto_21230 ) ) ( not ( = ?auto_21227 ?auto_21228 ) ) ( not ( = ?auto_21227 ?auto_21230 ) ) ( not ( = ?auto_21228 ?auto_21252 ) ) ( not ( = ?auto_21228 ?auto_21256 ) ) ( not ( = ?auto_21228 ?auto_21263 ) ) ( not ( = ?auto_21228 ?auto_21246 ) ) ( not ( = ?auto_21228 ?auto_21266 ) ) ( not ( = ?auto_21228 ?auto_21250 ) ) ( not ( = ?auto_21228 ?auto_21242 ) ) ( not ( = ?auto_21228 ?auto_21257 ) ) ( not ( = ?auto_21228 ?auto_21262 ) ) ( not ( = ?auto_21228 ?auto_21255 ) ) ( not ( = ?auto_21228 ?auto_21251 ) ) ( not ( = ?auto_21228 ?auto_21240 ) ) ( not ( = ?auto_21228 ?auto_21249 ) ) ( not ( = ?auto_21230 ?auto_21252 ) ) ( not ( = ?auto_21230 ?auto_21256 ) ) ( not ( = ?auto_21230 ?auto_21263 ) ) ( not ( = ?auto_21230 ?auto_21246 ) ) ( not ( = ?auto_21230 ?auto_21266 ) ) ( not ( = ?auto_21230 ?auto_21250 ) ) ( not ( = ?auto_21230 ?auto_21242 ) ) ( not ( = ?auto_21230 ?auto_21257 ) ) ( not ( = ?auto_21230 ?auto_21262 ) ) ( not ( = ?auto_21230 ?auto_21255 ) ) ( not ( = ?auto_21230 ?auto_21251 ) ) ( not ( = ?auto_21230 ?auto_21240 ) ) ( not ( = ?auto_21230 ?auto_21249 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ?auto_21220 ?auto_21223 ?auto_21222 ?auto_21221 ?auto_21224 ?auto_21226 ?auto_21225 ?auto_21227 ?auto_21229 )
      ( MAKE-1CRATE ?auto_21229 ?auto_21228 )
      ( MAKE-14CRATE-VERIFY ?auto_21215 ?auto_21216 ?auto_21217 ?auto_21218 ?auto_21219 ?auto_21220 ?auto_21223 ?auto_21222 ?auto_21221 ?auto_21224 ?auto_21226 ?auto_21225 ?auto_21227 ?auto_21229 ?auto_21228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_21271 - SURFACE
      ?auto_21272 - SURFACE
    )
    :vars
    (
      ?auto_21273 - HOIST
      ?auto_21274 - PLACE
      ?auto_21276 - PLACE
      ?auto_21277 - HOIST
      ?auto_21278 - SURFACE
      ?auto_21275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21273 ?auto_21274 ) ( SURFACE-AT ?auto_21271 ?auto_21274 ) ( CLEAR ?auto_21271 ) ( IS-CRATE ?auto_21272 ) ( AVAILABLE ?auto_21273 ) ( not ( = ?auto_21276 ?auto_21274 ) ) ( HOIST-AT ?auto_21277 ?auto_21276 ) ( AVAILABLE ?auto_21277 ) ( SURFACE-AT ?auto_21272 ?auto_21276 ) ( ON ?auto_21272 ?auto_21278 ) ( CLEAR ?auto_21272 ) ( TRUCK-AT ?auto_21275 ?auto_21274 ) ( not ( = ?auto_21271 ?auto_21272 ) ) ( not ( = ?auto_21271 ?auto_21278 ) ) ( not ( = ?auto_21272 ?auto_21278 ) ) ( not ( = ?auto_21273 ?auto_21277 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_21275 ?auto_21274 ?auto_21276 )
      ( !LIFT ?auto_21277 ?auto_21272 ?auto_21278 ?auto_21276 )
      ( !LOAD ?auto_21277 ?auto_21272 ?auto_21275 ?auto_21276 )
      ( !DRIVE ?auto_21275 ?auto_21276 ?auto_21274 )
      ( !UNLOAD ?auto_21273 ?auto_21272 ?auto_21275 ?auto_21274 )
      ( !DROP ?auto_21273 ?auto_21272 ?auto_21271 ?auto_21274 )
      ( MAKE-1CRATE-VERIFY ?auto_21271 ?auto_21272 ) )
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
      ?auto_21303 - SURFACE
      ?auto_21302 - SURFACE
      ?auto_21301 - SURFACE
      ?auto_21304 - SURFACE
      ?auto_21306 - SURFACE
      ?auto_21305 - SURFACE
      ?auto_21307 - SURFACE
      ?auto_21309 - SURFACE
      ?auto_21308 - SURFACE
      ?auto_21310 - SURFACE
    )
    :vars
    (
      ?auto_21313 - HOIST
      ?auto_21316 - PLACE
      ?auto_21311 - PLACE
      ?auto_21315 - HOIST
      ?auto_21312 - SURFACE
      ?auto_21331 - PLACE
      ?auto_21347 - HOIST
      ?auto_21321 - SURFACE
      ?auto_21337 - PLACE
      ?auto_21338 - HOIST
      ?auto_21341 - SURFACE
      ?auto_21317 - PLACE
      ?auto_21350 - HOIST
      ?auto_21335 - SURFACE
      ?auto_21344 - PLACE
      ?auto_21342 - HOIST
      ?auto_21349 - SURFACE
      ?auto_21327 - PLACE
      ?auto_21319 - HOIST
      ?auto_21340 - SURFACE
      ?auto_21333 - PLACE
      ?auto_21329 - HOIST
      ?auto_21318 - SURFACE
      ?auto_21323 - SURFACE
      ?auto_21328 - PLACE
      ?auto_21322 - HOIST
      ?auto_21339 - SURFACE
      ?auto_21324 - SURFACE
      ?auto_21320 - PLACE
      ?auto_21330 - HOIST
      ?auto_21326 - SURFACE
      ?auto_21334 - SURFACE
      ?auto_21325 - SURFACE
      ?auto_21343 - PLACE
      ?auto_21332 - HOIST
      ?auto_21336 - SURFACE
      ?auto_21345 - PLACE
      ?auto_21346 - HOIST
      ?auto_21348 - SURFACE
      ?auto_21314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_21313 ?auto_21316 ) ( IS-CRATE ?auto_21310 ) ( not ( = ?auto_21311 ?auto_21316 ) ) ( HOIST-AT ?auto_21315 ?auto_21311 ) ( SURFACE-AT ?auto_21310 ?auto_21311 ) ( ON ?auto_21310 ?auto_21312 ) ( CLEAR ?auto_21310 ) ( not ( = ?auto_21308 ?auto_21310 ) ) ( not ( = ?auto_21308 ?auto_21312 ) ) ( not ( = ?auto_21310 ?auto_21312 ) ) ( not ( = ?auto_21313 ?auto_21315 ) ) ( IS-CRATE ?auto_21308 ) ( not ( = ?auto_21331 ?auto_21316 ) ) ( HOIST-AT ?auto_21347 ?auto_21331 ) ( SURFACE-AT ?auto_21308 ?auto_21331 ) ( ON ?auto_21308 ?auto_21321 ) ( CLEAR ?auto_21308 ) ( not ( = ?auto_21309 ?auto_21308 ) ) ( not ( = ?auto_21309 ?auto_21321 ) ) ( not ( = ?auto_21308 ?auto_21321 ) ) ( not ( = ?auto_21313 ?auto_21347 ) ) ( IS-CRATE ?auto_21309 ) ( not ( = ?auto_21337 ?auto_21316 ) ) ( HOIST-AT ?auto_21338 ?auto_21337 ) ( AVAILABLE ?auto_21338 ) ( SURFACE-AT ?auto_21309 ?auto_21337 ) ( ON ?auto_21309 ?auto_21341 ) ( CLEAR ?auto_21309 ) ( not ( = ?auto_21307 ?auto_21309 ) ) ( not ( = ?auto_21307 ?auto_21341 ) ) ( not ( = ?auto_21309 ?auto_21341 ) ) ( not ( = ?auto_21313 ?auto_21338 ) ) ( IS-CRATE ?auto_21307 ) ( not ( = ?auto_21317 ?auto_21316 ) ) ( HOIST-AT ?auto_21350 ?auto_21317 ) ( SURFACE-AT ?auto_21307 ?auto_21317 ) ( ON ?auto_21307 ?auto_21335 ) ( CLEAR ?auto_21307 ) ( not ( = ?auto_21305 ?auto_21307 ) ) ( not ( = ?auto_21305 ?auto_21335 ) ) ( not ( = ?auto_21307 ?auto_21335 ) ) ( not ( = ?auto_21313 ?auto_21350 ) ) ( IS-CRATE ?auto_21305 ) ( not ( = ?auto_21344 ?auto_21316 ) ) ( HOIST-AT ?auto_21342 ?auto_21344 ) ( SURFACE-AT ?auto_21305 ?auto_21344 ) ( ON ?auto_21305 ?auto_21349 ) ( CLEAR ?auto_21305 ) ( not ( = ?auto_21306 ?auto_21305 ) ) ( not ( = ?auto_21306 ?auto_21349 ) ) ( not ( = ?auto_21305 ?auto_21349 ) ) ( not ( = ?auto_21313 ?auto_21342 ) ) ( IS-CRATE ?auto_21306 ) ( not ( = ?auto_21327 ?auto_21316 ) ) ( HOIST-AT ?auto_21319 ?auto_21327 ) ( AVAILABLE ?auto_21319 ) ( SURFACE-AT ?auto_21306 ?auto_21327 ) ( ON ?auto_21306 ?auto_21340 ) ( CLEAR ?auto_21306 ) ( not ( = ?auto_21304 ?auto_21306 ) ) ( not ( = ?auto_21304 ?auto_21340 ) ) ( not ( = ?auto_21306 ?auto_21340 ) ) ( not ( = ?auto_21313 ?auto_21319 ) ) ( IS-CRATE ?auto_21304 ) ( not ( = ?auto_21333 ?auto_21316 ) ) ( HOIST-AT ?auto_21329 ?auto_21333 ) ( AVAILABLE ?auto_21329 ) ( SURFACE-AT ?auto_21304 ?auto_21333 ) ( ON ?auto_21304 ?auto_21318 ) ( CLEAR ?auto_21304 ) ( not ( = ?auto_21301 ?auto_21304 ) ) ( not ( = ?auto_21301 ?auto_21318 ) ) ( not ( = ?auto_21304 ?auto_21318 ) ) ( not ( = ?auto_21313 ?auto_21329 ) ) ( IS-CRATE ?auto_21301 ) ( AVAILABLE ?auto_21347 ) ( SURFACE-AT ?auto_21301 ?auto_21331 ) ( ON ?auto_21301 ?auto_21323 ) ( CLEAR ?auto_21301 ) ( not ( = ?auto_21302 ?auto_21301 ) ) ( not ( = ?auto_21302 ?auto_21323 ) ) ( not ( = ?auto_21301 ?auto_21323 ) ) ( IS-CRATE ?auto_21302 ) ( not ( = ?auto_21328 ?auto_21316 ) ) ( HOIST-AT ?auto_21322 ?auto_21328 ) ( AVAILABLE ?auto_21322 ) ( SURFACE-AT ?auto_21302 ?auto_21328 ) ( ON ?auto_21302 ?auto_21339 ) ( CLEAR ?auto_21302 ) ( not ( = ?auto_21303 ?auto_21302 ) ) ( not ( = ?auto_21303 ?auto_21339 ) ) ( not ( = ?auto_21302 ?auto_21339 ) ) ( not ( = ?auto_21313 ?auto_21322 ) ) ( IS-CRATE ?auto_21303 ) ( AVAILABLE ?auto_21315 ) ( SURFACE-AT ?auto_21303 ?auto_21311 ) ( ON ?auto_21303 ?auto_21324 ) ( CLEAR ?auto_21303 ) ( not ( = ?auto_21300 ?auto_21303 ) ) ( not ( = ?auto_21300 ?auto_21324 ) ) ( not ( = ?auto_21303 ?auto_21324 ) ) ( IS-CRATE ?auto_21300 ) ( not ( = ?auto_21320 ?auto_21316 ) ) ( HOIST-AT ?auto_21330 ?auto_21320 ) ( AVAILABLE ?auto_21330 ) ( SURFACE-AT ?auto_21300 ?auto_21320 ) ( ON ?auto_21300 ?auto_21326 ) ( CLEAR ?auto_21300 ) ( not ( = ?auto_21299 ?auto_21300 ) ) ( not ( = ?auto_21299 ?auto_21326 ) ) ( not ( = ?auto_21300 ?auto_21326 ) ) ( not ( = ?auto_21313 ?auto_21330 ) ) ( IS-CRATE ?auto_21299 ) ( AVAILABLE ?auto_21350 ) ( SURFACE-AT ?auto_21299 ?auto_21317 ) ( ON ?auto_21299 ?auto_21334 ) ( CLEAR ?auto_21299 ) ( not ( = ?auto_21298 ?auto_21299 ) ) ( not ( = ?auto_21298 ?auto_21334 ) ) ( not ( = ?auto_21299 ?auto_21334 ) ) ( IS-CRATE ?auto_21298 ) ( AVAILABLE ?auto_21342 ) ( SURFACE-AT ?auto_21298 ?auto_21344 ) ( ON ?auto_21298 ?auto_21325 ) ( CLEAR ?auto_21298 ) ( not ( = ?auto_21297 ?auto_21298 ) ) ( not ( = ?auto_21297 ?auto_21325 ) ) ( not ( = ?auto_21298 ?auto_21325 ) ) ( IS-CRATE ?auto_21297 ) ( not ( = ?auto_21343 ?auto_21316 ) ) ( HOIST-AT ?auto_21332 ?auto_21343 ) ( AVAILABLE ?auto_21332 ) ( SURFACE-AT ?auto_21297 ?auto_21343 ) ( ON ?auto_21297 ?auto_21336 ) ( CLEAR ?auto_21297 ) ( not ( = ?auto_21296 ?auto_21297 ) ) ( not ( = ?auto_21296 ?auto_21336 ) ) ( not ( = ?auto_21297 ?auto_21336 ) ) ( not ( = ?auto_21313 ?auto_21332 ) ) ( SURFACE-AT ?auto_21295 ?auto_21316 ) ( CLEAR ?auto_21295 ) ( IS-CRATE ?auto_21296 ) ( AVAILABLE ?auto_21313 ) ( not ( = ?auto_21345 ?auto_21316 ) ) ( HOIST-AT ?auto_21346 ?auto_21345 ) ( AVAILABLE ?auto_21346 ) ( SURFACE-AT ?auto_21296 ?auto_21345 ) ( ON ?auto_21296 ?auto_21348 ) ( CLEAR ?auto_21296 ) ( TRUCK-AT ?auto_21314 ?auto_21316 ) ( not ( = ?auto_21295 ?auto_21296 ) ) ( not ( = ?auto_21295 ?auto_21348 ) ) ( not ( = ?auto_21296 ?auto_21348 ) ) ( not ( = ?auto_21313 ?auto_21346 ) ) ( not ( = ?auto_21295 ?auto_21297 ) ) ( not ( = ?auto_21295 ?auto_21336 ) ) ( not ( = ?auto_21297 ?auto_21348 ) ) ( not ( = ?auto_21343 ?auto_21345 ) ) ( not ( = ?auto_21332 ?auto_21346 ) ) ( not ( = ?auto_21336 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21298 ) ) ( not ( = ?auto_21295 ?auto_21325 ) ) ( not ( = ?auto_21296 ?auto_21298 ) ) ( not ( = ?auto_21296 ?auto_21325 ) ) ( not ( = ?auto_21298 ?auto_21336 ) ) ( not ( = ?auto_21298 ?auto_21348 ) ) ( not ( = ?auto_21344 ?auto_21343 ) ) ( not ( = ?auto_21344 ?auto_21345 ) ) ( not ( = ?auto_21342 ?auto_21332 ) ) ( not ( = ?auto_21342 ?auto_21346 ) ) ( not ( = ?auto_21325 ?auto_21336 ) ) ( not ( = ?auto_21325 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21299 ) ) ( not ( = ?auto_21295 ?auto_21334 ) ) ( not ( = ?auto_21296 ?auto_21299 ) ) ( not ( = ?auto_21296 ?auto_21334 ) ) ( not ( = ?auto_21297 ?auto_21299 ) ) ( not ( = ?auto_21297 ?auto_21334 ) ) ( not ( = ?auto_21299 ?auto_21325 ) ) ( not ( = ?auto_21299 ?auto_21336 ) ) ( not ( = ?auto_21299 ?auto_21348 ) ) ( not ( = ?auto_21317 ?auto_21344 ) ) ( not ( = ?auto_21317 ?auto_21343 ) ) ( not ( = ?auto_21317 ?auto_21345 ) ) ( not ( = ?auto_21350 ?auto_21342 ) ) ( not ( = ?auto_21350 ?auto_21332 ) ) ( not ( = ?auto_21350 ?auto_21346 ) ) ( not ( = ?auto_21334 ?auto_21325 ) ) ( not ( = ?auto_21334 ?auto_21336 ) ) ( not ( = ?auto_21334 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21300 ) ) ( not ( = ?auto_21295 ?auto_21326 ) ) ( not ( = ?auto_21296 ?auto_21300 ) ) ( not ( = ?auto_21296 ?auto_21326 ) ) ( not ( = ?auto_21297 ?auto_21300 ) ) ( not ( = ?auto_21297 ?auto_21326 ) ) ( not ( = ?auto_21298 ?auto_21300 ) ) ( not ( = ?auto_21298 ?auto_21326 ) ) ( not ( = ?auto_21300 ?auto_21334 ) ) ( not ( = ?auto_21300 ?auto_21325 ) ) ( not ( = ?auto_21300 ?auto_21336 ) ) ( not ( = ?auto_21300 ?auto_21348 ) ) ( not ( = ?auto_21320 ?auto_21317 ) ) ( not ( = ?auto_21320 ?auto_21344 ) ) ( not ( = ?auto_21320 ?auto_21343 ) ) ( not ( = ?auto_21320 ?auto_21345 ) ) ( not ( = ?auto_21330 ?auto_21350 ) ) ( not ( = ?auto_21330 ?auto_21342 ) ) ( not ( = ?auto_21330 ?auto_21332 ) ) ( not ( = ?auto_21330 ?auto_21346 ) ) ( not ( = ?auto_21326 ?auto_21334 ) ) ( not ( = ?auto_21326 ?auto_21325 ) ) ( not ( = ?auto_21326 ?auto_21336 ) ) ( not ( = ?auto_21326 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21303 ) ) ( not ( = ?auto_21295 ?auto_21324 ) ) ( not ( = ?auto_21296 ?auto_21303 ) ) ( not ( = ?auto_21296 ?auto_21324 ) ) ( not ( = ?auto_21297 ?auto_21303 ) ) ( not ( = ?auto_21297 ?auto_21324 ) ) ( not ( = ?auto_21298 ?auto_21303 ) ) ( not ( = ?auto_21298 ?auto_21324 ) ) ( not ( = ?auto_21299 ?auto_21303 ) ) ( not ( = ?auto_21299 ?auto_21324 ) ) ( not ( = ?auto_21303 ?auto_21326 ) ) ( not ( = ?auto_21303 ?auto_21334 ) ) ( not ( = ?auto_21303 ?auto_21325 ) ) ( not ( = ?auto_21303 ?auto_21336 ) ) ( not ( = ?auto_21303 ?auto_21348 ) ) ( not ( = ?auto_21311 ?auto_21320 ) ) ( not ( = ?auto_21311 ?auto_21317 ) ) ( not ( = ?auto_21311 ?auto_21344 ) ) ( not ( = ?auto_21311 ?auto_21343 ) ) ( not ( = ?auto_21311 ?auto_21345 ) ) ( not ( = ?auto_21315 ?auto_21330 ) ) ( not ( = ?auto_21315 ?auto_21350 ) ) ( not ( = ?auto_21315 ?auto_21342 ) ) ( not ( = ?auto_21315 ?auto_21332 ) ) ( not ( = ?auto_21315 ?auto_21346 ) ) ( not ( = ?auto_21324 ?auto_21326 ) ) ( not ( = ?auto_21324 ?auto_21334 ) ) ( not ( = ?auto_21324 ?auto_21325 ) ) ( not ( = ?auto_21324 ?auto_21336 ) ) ( not ( = ?auto_21324 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21302 ) ) ( not ( = ?auto_21295 ?auto_21339 ) ) ( not ( = ?auto_21296 ?auto_21302 ) ) ( not ( = ?auto_21296 ?auto_21339 ) ) ( not ( = ?auto_21297 ?auto_21302 ) ) ( not ( = ?auto_21297 ?auto_21339 ) ) ( not ( = ?auto_21298 ?auto_21302 ) ) ( not ( = ?auto_21298 ?auto_21339 ) ) ( not ( = ?auto_21299 ?auto_21302 ) ) ( not ( = ?auto_21299 ?auto_21339 ) ) ( not ( = ?auto_21300 ?auto_21302 ) ) ( not ( = ?auto_21300 ?auto_21339 ) ) ( not ( = ?auto_21302 ?auto_21324 ) ) ( not ( = ?auto_21302 ?auto_21326 ) ) ( not ( = ?auto_21302 ?auto_21334 ) ) ( not ( = ?auto_21302 ?auto_21325 ) ) ( not ( = ?auto_21302 ?auto_21336 ) ) ( not ( = ?auto_21302 ?auto_21348 ) ) ( not ( = ?auto_21328 ?auto_21311 ) ) ( not ( = ?auto_21328 ?auto_21320 ) ) ( not ( = ?auto_21328 ?auto_21317 ) ) ( not ( = ?auto_21328 ?auto_21344 ) ) ( not ( = ?auto_21328 ?auto_21343 ) ) ( not ( = ?auto_21328 ?auto_21345 ) ) ( not ( = ?auto_21322 ?auto_21315 ) ) ( not ( = ?auto_21322 ?auto_21330 ) ) ( not ( = ?auto_21322 ?auto_21350 ) ) ( not ( = ?auto_21322 ?auto_21342 ) ) ( not ( = ?auto_21322 ?auto_21332 ) ) ( not ( = ?auto_21322 ?auto_21346 ) ) ( not ( = ?auto_21339 ?auto_21324 ) ) ( not ( = ?auto_21339 ?auto_21326 ) ) ( not ( = ?auto_21339 ?auto_21334 ) ) ( not ( = ?auto_21339 ?auto_21325 ) ) ( not ( = ?auto_21339 ?auto_21336 ) ) ( not ( = ?auto_21339 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21301 ) ) ( not ( = ?auto_21295 ?auto_21323 ) ) ( not ( = ?auto_21296 ?auto_21301 ) ) ( not ( = ?auto_21296 ?auto_21323 ) ) ( not ( = ?auto_21297 ?auto_21301 ) ) ( not ( = ?auto_21297 ?auto_21323 ) ) ( not ( = ?auto_21298 ?auto_21301 ) ) ( not ( = ?auto_21298 ?auto_21323 ) ) ( not ( = ?auto_21299 ?auto_21301 ) ) ( not ( = ?auto_21299 ?auto_21323 ) ) ( not ( = ?auto_21300 ?auto_21301 ) ) ( not ( = ?auto_21300 ?auto_21323 ) ) ( not ( = ?auto_21303 ?auto_21301 ) ) ( not ( = ?auto_21303 ?auto_21323 ) ) ( not ( = ?auto_21301 ?auto_21339 ) ) ( not ( = ?auto_21301 ?auto_21324 ) ) ( not ( = ?auto_21301 ?auto_21326 ) ) ( not ( = ?auto_21301 ?auto_21334 ) ) ( not ( = ?auto_21301 ?auto_21325 ) ) ( not ( = ?auto_21301 ?auto_21336 ) ) ( not ( = ?auto_21301 ?auto_21348 ) ) ( not ( = ?auto_21331 ?auto_21328 ) ) ( not ( = ?auto_21331 ?auto_21311 ) ) ( not ( = ?auto_21331 ?auto_21320 ) ) ( not ( = ?auto_21331 ?auto_21317 ) ) ( not ( = ?auto_21331 ?auto_21344 ) ) ( not ( = ?auto_21331 ?auto_21343 ) ) ( not ( = ?auto_21331 ?auto_21345 ) ) ( not ( = ?auto_21347 ?auto_21322 ) ) ( not ( = ?auto_21347 ?auto_21315 ) ) ( not ( = ?auto_21347 ?auto_21330 ) ) ( not ( = ?auto_21347 ?auto_21350 ) ) ( not ( = ?auto_21347 ?auto_21342 ) ) ( not ( = ?auto_21347 ?auto_21332 ) ) ( not ( = ?auto_21347 ?auto_21346 ) ) ( not ( = ?auto_21323 ?auto_21339 ) ) ( not ( = ?auto_21323 ?auto_21324 ) ) ( not ( = ?auto_21323 ?auto_21326 ) ) ( not ( = ?auto_21323 ?auto_21334 ) ) ( not ( = ?auto_21323 ?auto_21325 ) ) ( not ( = ?auto_21323 ?auto_21336 ) ) ( not ( = ?auto_21323 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21304 ) ) ( not ( = ?auto_21295 ?auto_21318 ) ) ( not ( = ?auto_21296 ?auto_21304 ) ) ( not ( = ?auto_21296 ?auto_21318 ) ) ( not ( = ?auto_21297 ?auto_21304 ) ) ( not ( = ?auto_21297 ?auto_21318 ) ) ( not ( = ?auto_21298 ?auto_21304 ) ) ( not ( = ?auto_21298 ?auto_21318 ) ) ( not ( = ?auto_21299 ?auto_21304 ) ) ( not ( = ?auto_21299 ?auto_21318 ) ) ( not ( = ?auto_21300 ?auto_21304 ) ) ( not ( = ?auto_21300 ?auto_21318 ) ) ( not ( = ?auto_21303 ?auto_21304 ) ) ( not ( = ?auto_21303 ?auto_21318 ) ) ( not ( = ?auto_21302 ?auto_21304 ) ) ( not ( = ?auto_21302 ?auto_21318 ) ) ( not ( = ?auto_21304 ?auto_21323 ) ) ( not ( = ?auto_21304 ?auto_21339 ) ) ( not ( = ?auto_21304 ?auto_21324 ) ) ( not ( = ?auto_21304 ?auto_21326 ) ) ( not ( = ?auto_21304 ?auto_21334 ) ) ( not ( = ?auto_21304 ?auto_21325 ) ) ( not ( = ?auto_21304 ?auto_21336 ) ) ( not ( = ?auto_21304 ?auto_21348 ) ) ( not ( = ?auto_21333 ?auto_21331 ) ) ( not ( = ?auto_21333 ?auto_21328 ) ) ( not ( = ?auto_21333 ?auto_21311 ) ) ( not ( = ?auto_21333 ?auto_21320 ) ) ( not ( = ?auto_21333 ?auto_21317 ) ) ( not ( = ?auto_21333 ?auto_21344 ) ) ( not ( = ?auto_21333 ?auto_21343 ) ) ( not ( = ?auto_21333 ?auto_21345 ) ) ( not ( = ?auto_21329 ?auto_21347 ) ) ( not ( = ?auto_21329 ?auto_21322 ) ) ( not ( = ?auto_21329 ?auto_21315 ) ) ( not ( = ?auto_21329 ?auto_21330 ) ) ( not ( = ?auto_21329 ?auto_21350 ) ) ( not ( = ?auto_21329 ?auto_21342 ) ) ( not ( = ?auto_21329 ?auto_21332 ) ) ( not ( = ?auto_21329 ?auto_21346 ) ) ( not ( = ?auto_21318 ?auto_21323 ) ) ( not ( = ?auto_21318 ?auto_21339 ) ) ( not ( = ?auto_21318 ?auto_21324 ) ) ( not ( = ?auto_21318 ?auto_21326 ) ) ( not ( = ?auto_21318 ?auto_21334 ) ) ( not ( = ?auto_21318 ?auto_21325 ) ) ( not ( = ?auto_21318 ?auto_21336 ) ) ( not ( = ?auto_21318 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21306 ) ) ( not ( = ?auto_21295 ?auto_21340 ) ) ( not ( = ?auto_21296 ?auto_21306 ) ) ( not ( = ?auto_21296 ?auto_21340 ) ) ( not ( = ?auto_21297 ?auto_21306 ) ) ( not ( = ?auto_21297 ?auto_21340 ) ) ( not ( = ?auto_21298 ?auto_21306 ) ) ( not ( = ?auto_21298 ?auto_21340 ) ) ( not ( = ?auto_21299 ?auto_21306 ) ) ( not ( = ?auto_21299 ?auto_21340 ) ) ( not ( = ?auto_21300 ?auto_21306 ) ) ( not ( = ?auto_21300 ?auto_21340 ) ) ( not ( = ?auto_21303 ?auto_21306 ) ) ( not ( = ?auto_21303 ?auto_21340 ) ) ( not ( = ?auto_21302 ?auto_21306 ) ) ( not ( = ?auto_21302 ?auto_21340 ) ) ( not ( = ?auto_21301 ?auto_21306 ) ) ( not ( = ?auto_21301 ?auto_21340 ) ) ( not ( = ?auto_21306 ?auto_21318 ) ) ( not ( = ?auto_21306 ?auto_21323 ) ) ( not ( = ?auto_21306 ?auto_21339 ) ) ( not ( = ?auto_21306 ?auto_21324 ) ) ( not ( = ?auto_21306 ?auto_21326 ) ) ( not ( = ?auto_21306 ?auto_21334 ) ) ( not ( = ?auto_21306 ?auto_21325 ) ) ( not ( = ?auto_21306 ?auto_21336 ) ) ( not ( = ?auto_21306 ?auto_21348 ) ) ( not ( = ?auto_21327 ?auto_21333 ) ) ( not ( = ?auto_21327 ?auto_21331 ) ) ( not ( = ?auto_21327 ?auto_21328 ) ) ( not ( = ?auto_21327 ?auto_21311 ) ) ( not ( = ?auto_21327 ?auto_21320 ) ) ( not ( = ?auto_21327 ?auto_21317 ) ) ( not ( = ?auto_21327 ?auto_21344 ) ) ( not ( = ?auto_21327 ?auto_21343 ) ) ( not ( = ?auto_21327 ?auto_21345 ) ) ( not ( = ?auto_21319 ?auto_21329 ) ) ( not ( = ?auto_21319 ?auto_21347 ) ) ( not ( = ?auto_21319 ?auto_21322 ) ) ( not ( = ?auto_21319 ?auto_21315 ) ) ( not ( = ?auto_21319 ?auto_21330 ) ) ( not ( = ?auto_21319 ?auto_21350 ) ) ( not ( = ?auto_21319 ?auto_21342 ) ) ( not ( = ?auto_21319 ?auto_21332 ) ) ( not ( = ?auto_21319 ?auto_21346 ) ) ( not ( = ?auto_21340 ?auto_21318 ) ) ( not ( = ?auto_21340 ?auto_21323 ) ) ( not ( = ?auto_21340 ?auto_21339 ) ) ( not ( = ?auto_21340 ?auto_21324 ) ) ( not ( = ?auto_21340 ?auto_21326 ) ) ( not ( = ?auto_21340 ?auto_21334 ) ) ( not ( = ?auto_21340 ?auto_21325 ) ) ( not ( = ?auto_21340 ?auto_21336 ) ) ( not ( = ?auto_21340 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21305 ) ) ( not ( = ?auto_21295 ?auto_21349 ) ) ( not ( = ?auto_21296 ?auto_21305 ) ) ( not ( = ?auto_21296 ?auto_21349 ) ) ( not ( = ?auto_21297 ?auto_21305 ) ) ( not ( = ?auto_21297 ?auto_21349 ) ) ( not ( = ?auto_21298 ?auto_21305 ) ) ( not ( = ?auto_21298 ?auto_21349 ) ) ( not ( = ?auto_21299 ?auto_21305 ) ) ( not ( = ?auto_21299 ?auto_21349 ) ) ( not ( = ?auto_21300 ?auto_21305 ) ) ( not ( = ?auto_21300 ?auto_21349 ) ) ( not ( = ?auto_21303 ?auto_21305 ) ) ( not ( = ?auto_21303 ?auto_21349 ) ) ( not ( = ?auto_21302 ?auto_21305 ) ) ( not ( = ?auto_21302 ?auto_21349 ) ) ( not ( = ?auto_21301 ?auto_21305 ) ) ( not ( = ?auto_21301 ?auto_21349 ) ) ( not ( = ?auto_21304 ?auto_21305 ) ) ( not ( = ?auto_21304 ?auto_21349 ) ) ( not ( = ?auto_21305 ?auto_21340 ) ) ( not ( = ?auto_21305 ?auto_21318 ) ) ( not ( = ?auto_21305 ?auto_21323 ) ) ( not ( = ?auto_21305 ?auto_21339 ) ) ( not ( = ?auto_21305 ?auto_21324 ) ) ( not ( = ?auto_21305 ?auto_21326 ) ) ( not ( = ?auto_21305 ?auto_21334 ) ) ( not ( = ?auto_21305 ?auto_21325 ) ) ( not ( = ?auto_21305 ?auto_21336 ) ) ( not ( = ?auto_21305 ?auto_21348 ) ) ( not ( = ?auto_21349 ?auto_21340 ) ) ( not ( = ?auto_21349 ?auto_21318 ) ) ( not ( = ?auto_21349 ?auto_21323 ) ) ( not ( = ?auto_21349 ?auto_21339 ) ) ( not ( = ?auto_21349 ?auto_21324 ) ) ( not ( = ?auto_21349 ?auto_21326 ) ) ( not ( = ?auto_21349 ?auto_21334 ) ) ( not ( = ?auto_21349 ?auto_21325 ) ) ( not ( = ?auto_21349 ?auto_21336 ) ) ( not ( = ?auto_21349 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21307 ) ) ( not ( = ?auto_21295 ?auto_21335 ) ) ( not ( = ?auto_21296 ?auto_21307 ) ) ( not ( = ?auto_21296 ?auto_21335 ) ) ( not ( = ?auto_21297 ?auto_21307 ) ) ( not ( = ?auto_21297 ?auto_21335 ) ) ( not ( = ?auto_21298 ?auto_21307 ) ) ( not ( = ?auto_21298 ?auto_21335 ) ) ( not ( = ?auto_21299 ?auto_21307 ) ) ( not ( = ?auto_21299 ?auto_21335 ) ) ( not ( = ?auto_21300 ?auto_21307 ) ) ( not ( = ?auto_21300 ?auto_21335 ) ) ( not ( = ?auto_21303 ?auto_21307 ) ) ( not ( = ?auto_21303 ?auto_21335 ) ) ( not ( = ?auto_21302 ?auto_21307 ) ) ( not ( = ?auto_21302 ?auto_21335 ) ) ( not ( = ?auto_21301 ?auto_21307 ) ) ( not ( = ?auto_21301 ?auto_21335 ) ) ( not ( = ?auto_21304 ?auto_21307 ) ) ( not ( = ?auto_21304 ?auto_21335 ) ) ( not ( = ?auto_21306 ?auto_21307 ) ) ( not ( = ?auto_21306 ?auto_21335 ) ) ( not ( = ?auto_21307 ?auto_21349 ) ) ( not ( = ?auto_21307 ?auto_21340 ) ) ( not ( = ?auto_21307 ?auto_21318 ) ) ( not ( = ?auto_21307 ?auto_21323 ) ) ( not ( = ?auto_21307 ?auto_21339 ) ) ( not ( = ?auto_21307 ?auto_21324 ) ) ( not ( = ?auto_21307 ?auto_21326 ) ) ( not ( = ?auto_21307 ?auto_21334 ) ) ( not ( = ?auto_21307 ?auto_21325 ) ) ( not ( = ?auto_21307 ?auto_21336 ) ) ( not ( = ?auto_21307 ?auto_21348 ) ) ( not ( = ?auto_21335 ?auto_21349 ) ) ( not ( = ?auto_21335 ?auto_21340 ) ) ( not ( = ?auto_21335 ?auto_21318 ) ) ( not ( = ?auto_21335 ?auto_21323 ) ) ( not ( = ?auto_21335 ?auto_21339 ) ) ( not ( = ?auto_21335 ?auto_21324 ) ) ( not ( = ?auto_21335 ?auto_21326 ) ) ( not ( = ?auto_21335 ?auto_21334 ) ) ( not ( = ?auto_21335 ?auto_21325 ) ) ( not ( = ?auto_21335 ?auto_21336 ) ) ( not ( = ?auto_21335 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21309 ) ) ( not ( = ?auto_21295 ?auto_21341 ) ) ( not ( = ?auto_21296 ?auto_21309 ) ) ( not ( = ?auto_21296 ?auto_21341 ) ) ( not ( = ?auto_21297 ?auto_21309 ) ) ( not ( = ?auto_21297 ?auto_21341 ) ) ( not ( = ?auto_21298 ?auto_21309 ) ) ( not ( = ?auto_21298 ?auto_21341 ) ) ( not ( = ?auto_21299 ?auto_21309 ) ) ( not ( = ?auto_21299 ?auto_21341 ) ) ( not ( = ?auto_21300 ?auto_21309 ) ) ( not ( = ?auto_21300 ?auto_21341 ) ) ( not ( = ?auto_21303 ?auto_21309 ) ) ( not ( = ?auto_21303 ?auto_21341 ) ) ( not ( = ?auto_21302 ?auto_21309 ) ) ( not ( = ?auto_21302 ?auto_21341 ) ) ( not ( = ?auto_21301 ?auto_21309 ) ) ( not ( = ?auto_21301 ?auto_21341 ) ) ( not ( = ?auto_21304 ?auto_21309 ) ) ( not ( = ?auto_21304 ?auto_21341 ) ) ( not ( = ?auto_21306 ?auto_21309 ) ) ( not ( = ?auto_21306 ?auto_21341 ) ) ( not ( = ?auto_21305 ?auto_21309 ) ) ( not ( = ?auto_21305 ?auto_21341 ) ) ( not ( = ?auto_21309 ?auto_21335 ) ) ( not ( = ?auto_21309 ?auto_21349 ) ) ( not ( = ?auto_21309 ?auto_21340 ) ) ( not ( = ?auto_21309 ?auto_21318 ) ) ( not ( = ?auto_21309 ?auto_21323 ) ) ( not ( = ?auto_21309 ?auto_21339 ) ) ( not ( = ?auto_21309 ?auto_21324 ) ) ( not ( = ?auto_21309 ?auto_21326 ) ) ( not ( = ?auto_21309 ?auto_21334 ) ) ( not ( = ?auto_21309 ?auto_21325 ) ) ( not ( = ?auto_21309 ?auto_21336 ) ) ( not ( = ?auto_21309 ?auto_21348 ) ) ( not ( = ?auto_21337 ?auto_21317 ) ) ( not ( = ?auto_21337 ?auto_21344 ) ) ( not ( = ?auto_21337 ?auto_21327 ) ) ( not ( = ?auto_21337 ?auto_21333 ) ) ( not ( = ?auto_21337 ?auto_21331 ) ) ( not ( = ?auto_21337 ?auto_21328 ) ) ( not ( = ?auto_21337 ?auto_21311 ) ) ( not ( = ?auto_21337 ?auto_21320 ) ) ( not ( = ?auto_21337 ?auto_21343 ) ) ( not ( = ?auto_21337 ?auto_21345 ) ) ( not ( = ?auto_21338 ?auto_21350 ) ) ( not ( = ?auto_21338 ?auto_21342 ) ) ( not ( = ?auto_21338 ?auto_21319 ) ) ( not ( = ?auto_21338 ?auto_21329 ) ) ( not ( = ?auto_21338 ?auto_21347 ) ) ( not ( = ?auto_21338 ?auto_21322 ) ) ( not ( = ?auto_21338 ?auto_21315 ) ) ( not ( = ?auto_21338 ?auto_21330 ) ) ( not ( = ?auto_21338 ?auto_21332 ) ) ( not ( = ?auto_21338 ?auto_21346 ) ) ( not ( = ?auto_21341 ?auto_21335 ) ) ( not ( = ?auto_21341 ?auto_21349 ) ) ( not ( = ?auto_21341 ?auto_21340 ) ) ( not ( = ?auto_21341 ?auto_21318 ) ) ( not ( = ?auto_21341 ?auto_21323 ) ) ( not ( = ?auto_21341 ?auto_21339 ) ) ( not ( = ?auto_21341 ?auto_21324 ) ) ( not ( = ?auto_21341 ?auto_21326 ) ) ( not ( = ?auto_21341 ?auto_21334 ) ) ( not ( = ?auto_21341 ?auto_21325 ) ) ( not ( = ?auto_21341 ?auto_21336 ) ) ( not ( = ?auto_21341 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21308 ) ) ( not ( = ?auto_21295 ?auto_21321 ) ) ( not ( = ?auto_21296 ?auto_21308 ) ) ( not ( = ?auto_21296 ?auto_21321 ) ) ( not ( = ?auto_21297 ?auto_21308 ) ) ( not ( = ?auto_21297 ?auto_21321 ) ) ( not ( = ?auto_21298 ?auto_21308 ) ) ( not ( = ?auto_21298 ?auto_21321 ) ) ( not ( = ?auto_21299 ?auto_21308 ) ) ( not ( = ?auto_21299 ?auto_21321 ) ) ( not ( = ?auto_21300 ?auto_21308 ) ) ( not ( = ?auto_21300 ?auto_21321 ) ) ( not ( = ?auto_21303 ?auto_21308 ) ) ( not ( = ?auto_21303 ?auto_21321 ) ) ( not ( = ?auto_21302 ?auto_21308 ) ) ( not ( = ?auto_21302 ?auto_21321 ) ) ( not ( = ?auto_21301 ?auto_21308 ) ) ( not ( = ?auto_21301 ?auto_21321 ) ) ( not ( = ?auto_21304 ?auto_21308 ) ) ( not ( = ?auto_21304 ?auto_21321 ) ) ( not ( = ?auto_21306 ?auto_21308 ) ) ( not ( = ?auto_21306 ?auto_21321 ) ) ( not ( = ?auto_21305 ?auto_21308 ) ) ( not ( = ?auto_21305 ?auto_21321 ) ) ( not ( = ?auto_21307 ?auto_21308 ) ) ( not ( = ?auto_21307 ?auto_21321 ) ) ( not ( = ?auto_21308 ?auto_21341 ) ) ( not ( = ?auto_21308 ?auto_21335 ) ) ( not ( = ?auto_21308 ?auto_21349 ) ) ( not ( = ?auto_21308 ?auto_21340 ) ) ( not ( = ?auto_21308 ?auto_21318 ) ) ( not ( = ?auto_21308 ?auto_21323 ) ) ( not ( = ?auto_21308 ?auto_21339 ) ) ( not ( = ?auto_21308 ?auto_21324 ) ) ( not ( = ?auto_21308 ?auto_21326 ) ) ( not ( = ?auto_21308 ?auto_21334 ) ) ( not ( = ?auto_21308 ?auto_21325 ) ) ( not ( = ?auto_21308 ?auto_21336 ) ) ( not ( = ?auto_21308 ?auto_21348 ) ) ( not ( = ?auto_21321 ?auto_21341 ) ) ( not ( = ?auto_21321 ?auto_21335 ) ) ( not ( = ?auto_21321 ?auto_21349 ) ) ( not ( = ?auto_21321 ?auto_21340 ) ) ( not ( = ?auto_21321 ?auto_21318 ) ) ( not ( = ?auto_21321 ?auto_21323 ) ) ( not ( = ?auto_21321 ?auto_21339 ) ) ( not ( = ?auto_21321 ?auto_21324 ) ) ( not ( = ?auto_21321 ?auto_21326 ) ) ( not ( = ?auto_21321 ?auto_21334 ) ) ( not ( = ?auto_21321 ?auto_21325 ) ) ( not ( = ?auto_21321 ?auto_21336 ) ) ( not ( = ?auto_21321 ?auto_21348 ) ) ( not ( = ?auto_21295 ?auto_21310 ) ) ( not ( = ?auto_21295 ?auto_21312 ) ) ( not ( = ?auto_21296 ?auto_21310 ) ) ( not ( = ?auto_21296 ?auto_21312 ) ) ( not ( = ?auto_21297 ?auto_21310 ) ) ( not ( = ?auto_21297 ?auto_21312 ) ) ( not ( = ?auto_21298 ?auto_21310 ) ) ( not ( = ?auto_21298 ?auto_21312 ) ) ( not ( = ?auto_21299 ?auto_21310 ) ) ( not ( = ?auto_21299 ?auto_21312 ) ) ( not ( = ?auto_21300 ?auto_21310 ) ) ( not ( = ?auto_21300 ?auto_21312 ) ) ( not ( = ?auto_21303 ?auto_21310 ) ) ( not ( = ?auto_21303 ?auto_21312 ) ) ( not ( = ?auto_21302 ?auto_21310 ) ) ( not ( = ?auto_21302 ?auto_21312 ) ) ( not ( = ?auto_21301 ?auto_21310 ) ) ( not ( = ?auto_21301 ?auto_21312 ) ) ( not ( = ?auto_21304 ?auto_21310 ) ) ( not ( = ?auto_21304 ?auto_21312 ) ) ( not ( = ?auto_21306 ?auto_21310 ) ) ( not ( = ?auto_21306 ?auto_21312 ) ) ( not ( = ?auto_21305 ?auto_21310 ) ) ( not ( = ?auto_21305 ?auto_21312 ) ) ( not ( = ?auto_21307 ?auto_21310 ) ) ( not ( = ?auto_21307 ?auto_21312 ) ) ( not ( = ?auto_21309 ?auto_21310 ) ) ( not ( = ?auto_21309 ?auto_21312 ) ) ( not ( = ?auto_21310 ?auto_21321 ) ) ( not ( = ?auto_21310 ?auto_21341 ) ) ( not ( = ?auto_21310 ?auto_21335 ) ) ( not ( = ?auto_21310 ?auto_21349 ) ) ( not ( = ?auto_21310 ?auto_21340 ) ) ( not ( = ?auto_21310 ?auto_21318 ) ) ( not ( = ?auto_21310 ?auto_21323 ) ) ( not ( = ?auto_21310 ?auto_21339 ) ) ( not ( = ?auto_21310 ?auto_21324 ) ) ( not ( = ?auto_21310 ?auto_21326 ) ) ( not ( = ?auto_21310 ?auto_21334 ) ) ( not ( = ?auto_21310 ?auto_21325 ) ) ( not ( = ?auto_21310 ?auto_21336 ) ) ( not ( = ?auto_21310 ?auto_21348 ) ) ( not ( = ?auto_21312 ?auto_21321 ) ) ( not ( = ?auto_21312 ?auto_21341 ) ) ( not ( = ?auto_21312 ?auto_21335 ) ) ( not ( = ?auto_21312 ?auto_21349 ) ) ( not ( = ?auto_21312 ?auto_21340 ) ) ( not ( = ?auto_21312 ?auto_21318 ) ) ( not ( = ?auto_21312 ?auto_21323 ) ) ( not ( = ?auto_21312 ?auto_21339 ) ) ( not ( = ?auto_21312 ?auto_21324 ) ) ( not ( = ?auto_21312 ?auto_21326 ) ) ( not ( = ?auto_21312 ?auto_21334 ) ) ( not ( = ?auto_21312 ?auto_21325 ) ) ( not ( = ?auto_21312 ?auto_21336 ) ) ( not ( = ?auto_21312 ?auto_21348 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_21295 ?auto_21296 ?auto_21297 ?auto_21298 ?auto_21299 ?auto_21300 ?auto_21303 ?auto_21302 ?auto_21301 ?auto_21304 ?auto_21306 ?auto_21305 ?auto_21307 ?auto_21309 ?auto_21308 )
      ( MAKE-1CRATE ?auto_21308 ?auto_21310 )
      ( MAKE-15CRATE-VERIFY ?auto_21295 ?auto_21296 ?auto_21297 ?auto_21298 ?auto_21299 ?auto_21300 ?auto_21303 ?auto_21302 ?auto_21301 ?auto_21304 ?auto_21306 ?auto_21305 ?auto_21307 ?auto_21309 ?auto_21308 ?auto_21310 ) )
  )

)

