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
      ?auto_2390570 - SURFACE
      ?auto_2390571 - SURFACE
    )
    :vars
    (
      ?auto_2390572 - HOIST
      ?auto_2390573 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390572 ?auto_2390573 ) ( SURFACE-AT ?auto_2390570 ?auto_2390573 ) ( CLEAR ?auto_2390570 ) ( LIFTING ?auto_2390572 ?auto_2390571 ) ( IS-CRATE ?auto_2390571 ) ( not ( = ?auto_2390570 ?auto_2390571 ) ) )
    :subtasks
    ( ( !DROP ?auto_2390572 ?auto_2390571 ?auto_2390570 ?auto_2390573 )
      ( MAKE-1CRATE-VERIFY ?auto_2390570 ?auto_2390571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390574 - SURFACE
      ?auto_2390575 - SURFACE
    )
    :vars
    (
      ?auto_2390576 - HOIST
      ?auto_2390577 - PLACE
      ?auto_2390578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390576 ?auto_2390577 ) ( SURFACE-AT ?auto_2390574 ?auto_2390577 ) ( CLEAR ?auto_2390574 ) ( IS-CRATE ?auto_2390575 ) ( not ( = ?auto_2390574 ?auto_2390575 ) ) ( TRUCK-AT ?auto_2390578 ?auto_2390577 ) ( AVAILABLE ?auto_2390576 ) ( IN ?auto_2390575 ?auto_2390578 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2390576 ?auto_2390575 ?auto_2390578 ?auto_2390577 )
      ( MAKE-1CRATE ?auto_2390574 ?auto_2390575 )
      ( MAKE-1CRATE-VERIFY ?auto_2390574 ?auto_2390575 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390579 - SURFACE
      ?auto_2390580 - SURFACE
    )
    :vars
    (
      ?auto_2390583 - HOIST
      ?auto_2390581 - PLACE
      ?auto_2390582 - TRUCK
      ?auto_2390584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390583 ?auto_2390581 ) ( SURFACE-AT ?auto_2390579 ?auto_2390581 ) ( CLEAR ?auto_2390579 ) ( IS-CRATE ?auto_2390580 ) ( not ( = ?auto_2390579 ?auto_2390580 ) ) ( AVAILABLE ?auto_2390583 ) ( IN ?auto_2390580 ?auto_2390582 ) ( TRUCK-AT ?auto_2390582 ?auto_2390584 ) ( not ( = ?auto_2390584 ?auto_2390581 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2390582 ?auto_2390584 ?auto_2390581 )
      ( MAKE-1CRATE ?auto_2390579 ?auto_2390580 )
      ( MAKE-1CRATE-VERIFY ?auto_2390579 ?auto_2390580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390585 - SURFACE
      ?auto_2390586 - SURFACE
    )
    :vars
    (
      ?auto_2390590 - HOIST
      ?auto_2390589 - PLACE
      ?auto_2390587 - TRUCK
      ?auto_2390588 - PLACE
      ?auto_2390591 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390590 ?auto_2390589 ) ( SURFACE-AT ?auto_2390585 ?auto_2390589 ) ( CLEAR ?auto_2390585 ) ( IS-CRATE ?auto_2390586 ) ( not ( = ?auto_2390585 ?auto_2390586 ) ) ( AVAILABLE ?auto_2390590 ) ( TRUCK-AT ?auto_2390587 ?auto_2390588 ) ( not ( = ?auto_2390588 ?auto_2390589 ) ) ( HOIST-AT ?auto_2390591 ?auto_2390588 ) ( LIFTING ?auto_2390591 ?auto_2390586 ) ( not ( = ?auto_2390590 ?auto_2390591 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2390591 ?auto_2390586 ?auto_2390587 ?auto_2390588 )
      ( MAKE-1CRATE ?auto_2390585 ?auto_2390586 )
      ( MAKE-1CRATE-VERIFY ?auto_2390585 ?auto_2390586 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390592 - SURFACE
      ?auto_2390593 - SURFACE
    )
    :vars
    (
      ?auto_2390595 - HOIST
      ?auto_2390597 - PLACE
      ?auto_2390596 - TRUCK
      ?auto_2390598 - PLACE
      ?auto_2390594 - HOIST
      ?auto_2390599 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390595 ?auto_2390597 ) ( SURFACE-AT ?auto_2390592 ?auto_2390597 ) ( CLEAR ?auto_2390592 ) ( IS-CRATE ?auto_2390593 ) ( not ( = ?auto_2390592 ?auto_2390593 ) ) ( AVAILABLE ?auto_2390595 ) ( TRUCK-AT ?auto_2390596 ?auto_2390598 ) ( not ( = ?auto_2390598 ?auto_2390597 ) ) ( HOIST-AT ?auto_2390594 ?auto_2390598 ) ( not ( = ?auto_2390595 ?auto_2390594 ) ) ( AVAILABLE ?auto_2390594 ) ( SURFACE-AT ?auto_2390593 ?auto_2390598 ) ( ON ?auto_2390593 ?auto_2390599 ) ( CLEAR ?auto_2390593 ) ( not ( = ?auto_2390592 ?auto_2390599 ) ) ( not ( = ?auto_2390593 ?auto_2390599 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2390594 ?auto_2390593 ?auto_2390599 ?auto_2390598 )
      ( MAKE-1CRATE ?auto_2390592 ?auto_2390593 )
      ( MAKE-1CRATE-VERIFY ?auto_2390592 ?auto_2390593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390600 - SURFACE
      ?auto_2390601 - SURFACE
    )
    :vars
    (
      ?auto_2390604 - HOIST
      ?auto_2390602 - PLACE
      ?auto_2390605 - PLACE
      ?auto_2390603 - HOIST
      ?auto_2390606 - SURFACE
      ?auto_2390607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390604 ?auto_2390602 ) ( SURFACE-AT ?auto_2390600 ?auto_2390602 ) ( CLEAR ?auto_2390600 ) ( IS-CRATE ?auto_2390601 ) ( not ( = ?auto_2390600 ?auto_2390601 ) ) ( AVAILABLE ?auto_2390604 ) ( not ( = ?auto_2390605 ?auto_2390602 ) ) ( HOIST-AT ?auto_2390603 ?auto_2390605 ) ( not ( = ?auto_2390604 ?auto_2390603 ) ) ( AVAILABLE ?auto_2390603 ) ( SURFACE-AT ?auto_2390601 ?auto_2390605 ) ( ON ?auto_2390601 ?auto_2390606 ) ( CLEAR ?auto_2390601 ) ( not ( = ?auto_2390600 ?auto_2390606 ) ) ( not ( = ?auto_2390601 ?auto_2390606 ) ) ( TRUCK-AT ?auto_2390607 ?auto_2390602 ) )
    :subtasks
    ( ( !DRIVE ?auto_2390607 ?auto_2390602 ?auto_2390605 )
      ( MAKE-1CRATE ?auto_2390600 ?auto_2390601 )
      ( MAKE-1CRATE-VERIFY ?auto_2390600 ?auto_2390601 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390617 - SURFACE
      ?auto_2390618 - SURFACE
      ?auto_2390619 - SURFACE
    )
    :vars
    (
      ?auto_2390620 - HOIST
      ?auto_2390621 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390620 ?auto_2390621 ) ( SURFACE-AT ?auto_2390618 ?auto_2390621 ) ( CLEAR ?auto_2390618 ) ( LIFTING ?auto_2390620 ?auto_2390619 ) ( IS-CRATE ?auto_2390619 ) ( not ( = ?auto_2390618 ?auto_2390619 ) ) ( ON ?auto_2390618 ?auto_2390617 ) ( not ( = ?auto_2390617 ?auto_2390618 ) ) ( not ( = ?auto_2390617 ?auto_2390619 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390618 ?auto_2390619 )
      ( MAKE-2CRATE-VERIFY ?auto_2390617 ?auto_2390618 ?auto_2390619 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390627 - SURFACE
      ?auto_2390628 - SURFACE
      ?auto_2390629 - SURFACE
    )
    :vars
    (
      ?auto_2390631 - HOIST
      ?auto_2390632 - PLACE
      ?auto_2390630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390631 ?auto_2390632 ) ( SURFACE-AT ?auto_2390628 ?auto_2390632 ) ( CLEAR ?auto_2390628 ) ( IS-CRATE ?auto_2390629 ) ( not ( = ?auto_2390628 ?auto_2390629 ) ) ( TRUCK-AT ?auto_2390630 ?auto_2390632 ) ( AVAILABLE ?auto_2390631 ) ( IN ?auto_2390629 ?auto_2390630 ) ( ON ?auto_2390628 ?auto_2390627 ) ( not ( = ?auto_2390627 ?auto_2390628 ) ) ( not ( = ?auto_2390627 ?auto_2390629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390628 ?auto_2390629 )
      ( MAKE-2CRATE-VERIFY ?auto_2390627 ?auto_2390628 ?auto_2390629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390633 - SURFACE
      ?auto_2390634 - SURFACE
    )
    :vars
    (
      ?auto_2390636 - HOIST
      ?auto_2390637 - PLACE
      ?auto_2390638 - TRUCK
      ?auto_2390635 - SURFACE
      ?auto_2390639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390636 ?auto_2390637 ) ( SURFACE-AT ?auto_2390633 ?auto_2390637 ) ( CLEAR ?auto_2390633 ) ( IS-CRATE ?auto_2390634 ) ( not ( = ?auto_2390633 ?auto_2390634 ) ) ( AVAILABLE ?auto_2390636 ) ( IN ?auto_2390634 ?auto_2390638 ) ( ON ?auto_2390633 ?auto_2390635 ) ( not ( = ?auto_2390635 ?auto_2390633 ) ) ( not ( = ?auto_2390635 ?auto_2390634 ) ) ( TRUCK-AT ?auto_2390638 ?auto_2390639 ) ( not ( = ?auto_2390639 ?auto_2390637 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2390638 ?auto_2390639 ?auto_2390637 )
      ( MAKE-2CRATE ?auto_2390635 ?auto_2390633 ?auto_2390634 )
      ( MAKE-1CRATE-VERIFY ?auto_2390633 ?auto_2390634 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390640 - SURFACE
      ?auto_2390641 - SURFACE
      ?auto_2390642 - SURFACE
    )
    :vars
    (
      ?auto_2390645 - HOIST
      ?auto_2390643 - PLACE
      ?auto_2390644 - TRUCK
      ?auto_2390646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390645 ?auto_2390643 ) ( SURFACE-AT ?auto_2390641 ?auto_2390643 ) ( CLEAR ?auto_2390641 ) ( IS-CRATE ?auto_2390642 ) ( not ( = ?auto_2390641 ?auto_2390642 ) ) ( AVAILABLE ?auto_2390645 ) ( IN ?auto_2390642 ?auto_2390644 ) ( ON ?auto_2390641 ?auto_2390640 ) ( not ( = ?auto_2390640 ?auto_2390641 ) ) ( not ( = ?auto_2390640 ?auto_2390642 ) ) ( TRUCK-AT ?auto_2390644 ?auto_2390646 ) ( not ( = ?auto_2390646 ?auto_2390643 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390641 ?auto_2390642 )
      ( MAKE-2CRATE-VERIFY ?auto_2390640 ?auto_2390641 ?auto_2390642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390647 - SURFACE
      ?auto_2390648 - SURFACE
    )
    :vars
    (
      ?auto_2390652 - HOIST
      ?auto_2390653 - PLACE
      ?auto_2390650 - SURFACE
      ?auto_2390649 - TRUCK
      ?auto_2390651 - PLACE
      ?auto_2390654 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390652 ?auto_2390653 ) ( SURFACE-AT ?auto_2390647 ?auto_2390653 ) ( CLEAR ?auto_2390647 ) ( IS-CRATE ?auto_2390648 ) ( not ( = ?auto_2390647 ?auto_2390648 ) ) ( AVAILABLE ?auto_2390652 ) ( ON ?auto_2390647 ?auto_2390650 ) ( not ( = ?auto_2390650 ?auto_2390647 ) ) ( not ( = ?auto_2390650 ?auto_2390648 ) ) ( TRUCK-AT ?auto_2390649 ?auto_2390651 ) ( not ( = ?auto_2390651 ?auto_2390653 ) ) ( HOIST-AT ?auto_2390654 ?auto_2390651 ) ( LIFTING ?auto_2390654 ?auto_2390648 ) ( not ( = ?auto_2390652 ?auto_2390654 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2390654 ?auto_2390648 ?auto_2390649 ?auto_2390651 )
      ( MAKE-2CRATE ?auto_2390650 ?auto_2390647 ?auto_2390648 )
      ( MAKE-1CRATE-VERIFY ?auto_2390647 ?auto_2390648 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390655 - SURFACE
      ?auto_2390656 - SURFACE
      ?auto_2390657 - SURFACE
    )
    :vars
    (
      ?auto_2390662 - HOIST
      ?auto_2390660 - PLACE
      ?auto_2390658 - TRUCK
      ?auto_2390659 - PLACE
      ?auto_2390661 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390662 ?auto_2390660 ) ( SURFACE-AT ?auto_2390656 ?auto_2390660 ) ( CLEAR ?auto_2390656 ) ( IS-CRATE ?auto_2390657 ) ( not ( = ?auto_2390656 ?auto_2390657 ) ) ( AVAILABLE ?auto_2390662 ) ( ON ?auto_2390656 ?auto_2390655 ) ( not ( = ?auto_2390655 ?auto_2390656 ) ) ( not ( = ?auto_2390655 ?auto_2390657 ) ) ( TRUCK-AT ?auto_2390658 ?auto_2390659 ) ( not ( = ?auto_2390659 ?auto_2390660 ) ) ( HOIST-AT ?auto_2390661 ?auto_2390659 ) ( LIFTING ?auto_2390661 ?auto_2390657 ) ( not ( = ?auto_2390662 ?auto_2390661 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390656 ?auto_2390657 )
      ( MAKE-2CRATE-VERIFY ?auto_2390655 ?auto_2390656 ?auto_2390657 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390663 - SURFACE
      ?auto_2390664 - SURFACE
    )
    :vars
    (
      ?auto_2390669 - HOIST
      ?auto_2390670 - PLACE
      ?auto_2390667 - SURFACE
      ?auto_2390665 - TRUCK
      ?auto_2390666 - PLACE
      ?auto_2390668 - HOIST
      ?auto_2390671 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390669 ?auto_2390670 ) ( SURFACE-AT ?auto_2390663 ?auto_2390670 ) ( CLEAR ?auto_2390663 ) ( IS-CRATE ?auto_2390664 ) ( not ( = ?auto_2390663 ?auto_2390664 ) ) ( AVAILABLE ?auto_2390669 ) ( ON ?auto_2390663 ?auto_2390667 ) ( not ( = ?auto_2390667 ?auto_2390663 ) ) ( not ( = ?auto_2390667 ?auto_2390664 ) ) ( TRUCK-AT ?auto_2390665 ?auto_2390666 ) ( not ( = ?auto_2390666 ?auto_2390670 ) ) ( HOIST-AT ?auto_2390668 ?auto_2390666 ) ( not ( = ?auto_2390669 ?auto_2390668 ) ) ( AVAILABLE ?auto_2390668 ) ( SURFACE-AT ?auto_2390664 ?auto_2390666 ) ( ON ?auto_2390664 ?auto_2390671 ) ( CLEAR ?auto_2390664 ) ( not ( = ?auto_2390663 ?auto_2390671 ) ) ( not ( = ?auto_2390664 ?auto_2390671 ) ) ( not ( = ?auto_2390667 ?auto_2390671 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2390668 ?auto_2390664 ?auto_2390671 ?auto_2390666 )
      ( MAKE-2CRATE ?auto_2390667 ?auto_2390663 ?auto_2390664 )
      ( MAKE-1CRATE-VERIFY ?auto_2390663 ?auto_2390664 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390672 - SURFACE
      ?auto_2390673 - SURFACE
      ?auto_2390674 - SURFACE
    )
    :vars
    (
      ?auto_2390679 - HOIST
      ?auto_2390677 - PLACE
      ?auto_2390675 - TRUCK
      ?auto_2390680 - PLACE
      ?auto_2390678 - HOIST
      ?auto_2390676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390679 ?auto_2390677 ) ( SURFACE-AT ?auto_2390673 ?auto_2390677 ) ( CLEAR ?auto_2390673 ) ( IS-CRATE ?auto_2390674 ) ( not ( = ?auto_2390673 ?auto_2390674 ) ) ( AVAILABLE ?auto_2390679 ) ( ON ?auto_2390673 ?auto_2390672 ) ( not ( = ?auto_2390672 ?auto_2390673 ) ) ( not ( = ?auto_2390672 ?auto_2390674 ) ) ( TRUCK-AT ?auto_2390675 ?auto_2390680 ) ( not ( = ?auto_2390680 ?auto_2390677 ) ) ( HOIST-AT ?auto_2390678 ?auto_2390680 ) ( not ( = ?auto_2390679 ?auto_2390678 ) ) ( AVAILABLE ?auto_2390678 ) ( SURFACE-AT ?auto_2390674 ?auto_2390680 ) ( ON ?auto_2390674 ?auto_2390676 ) ( CLEAR ?auto_2390674 ) ( not ( = ?auto_2390673 ?auto_2390676 ) ) ( not ( = ?auto_2390674 ?auto_2390676 ) ) ( not ( = ?auto_2390672 ?auto_2390676 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390673 ?auto_2390674 )
      ( MAKE-2CRATE-VERIFY ?auto_2390672 ?auto_2390673 ?auto_2390674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390681 - SURFACE
      ?auto_2390682 - SURFACE
    )
    :vars
    (
      ?auto_2390683 - HOIST
      ?auto_2390689 - PLACE
      ?auto_2390684 - SURFACE
      ?auto_2390686 - PLACE
      ?auto_2390685 - HOIST
      ?auto_2390688 - SURFACE
      ?auto_2390687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390683 ?auto_2390689 ) ( SURFACE-AT ?auto_2390681 ?auto_2390689 ) ( CLEAR ?auto_2390681 ) ( IS-CRATE ?auto_2390682 ) ( not ( = ?auto_2390681 ?auto_2390682 ) ) ( AVAILABLE ?auto_2390683 ) ( ON ?auto_2390681 ?auto_2390684 ) ( not ( = ?auto_2390684 ?auto_2390681 ) ) ( not ( = ?auto_2390684 ?auto_2390682 ) ) ( not ( = ?auto_2390686 ?auto_2390689 ) ) ( HOIST-AT ?auto_2390685 ?auto_2390686 ) ( not ( = ?auto_2390683 ?auto_2390685 ) ) ( AVAILABLE ?auto_2390685 ) ( SURFACE-AT ?auto_2390682 ?auto_2390686 ) ( ON ?auto_2390682 ?auto_2390688 ) ( CLEAR ?auto_2390682 ) ( not ( = ?auto_2390681 ?auto_2390688 ) ) ( not ( = ?auto_2390682 ?auto_2390688 ) ) ( not ( = ?auto_2390684 ?auto_2390688 ) ) ( TRUCK-AT ?auto_2390687 ?auto_2390689 ) )
    :subtasks
    ( ( !DRIVE ?auto_2390687 ?auto_2390689 ?auto_2390686 )
      ( MAKE-2CRATE ?auto_2390684 ?auto_2390681 ?auto_2390682 )
      ( MAKE-1CRATE-VERIFY ?auto_2390681 ?auto_2390682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390690 - SURFACE
      ?auto_2390691 - SURFACE
      ?auto_2390692 - SURFACE
    )
    :vars
    (
      ?auto_2390697 - HOIST
      ?auto_2390698 - PLACE
      ?auto_2390693 - PLACE
      ?auto_2390695 - HOIST
      ?auto_2390694 - SURFACE
      ?auto_2390696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390697 ?auto_2390698 ) ( SURFACE-AT ?auto_2390691 ?auto_2390698 ) ( CLEAR ?auto_2390691 ) ( IS-CRATE ?auto_2390692 ) ( not ( = ?auto_2390691 ?auto_2390692 ) ) ( AVAILABLE ?auto_2390697 ) ( ON ?auto_2390691 ?auto_2390690 ) ( not ( = ?auto_2390690 ?auto_2390691 ) ) ( not ( = ?auto_2390690 ?auto_2390692 ) ) ( not ( = ?auto_2390693 ?auto_2390698 ) ) ( HOIST-AT ?auto_2390695 ?auto_2390693 ) ( not ( = ?auto_2390697 ?auto_2390695 ) ) ( AVAILABLE ?auto_2390695 ) ( SURFACE-AT ?auto_2390692 ?auto_2390693 ) ( ON ?auto_2390692 ?auto_2390694 ) ( CLEAR ?auto_2390692 ) ( not ( = ?auto_2390691 ?auto_2390694 ) ) ( not ( = ?auto_2390692 ?auto_2390694 ) ) ( not ( = ?auto_2390690 ?auto_2390694 ) ) ( TRUCK-AT ?auto_2390696 ?auto_2390698 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390691 ?auto_2390692 )
      ( MAKE-2CRATE-VERIFY ?auto_2390690 ?auto_2390691 ?auto_2390692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390699 - SURFACE
      ?auto_2390700 - SURFACE
    )
    :vars
    (
      ?auto_2390702 - HOIST
      ?auto_2390703 - PLACE
      ?auto_2390706 - SURFACE
      ?auto_2390701 - PLACE
      ?auto_2390707 - HOIST
      ?auto_2390704 - SURFACE
      ?auto_2390705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390702 ?auto_2390703 ) ( IS-CRATE ?auto_2390700 ) ( not ( = ?auto_2390699 ?auto_2390700 ) ) ( not ( = ?auto_2390706 ?auto_2390699 ) ) ( not ( = ?auto_2390706 ?auto_2390700 ) ) ( not ( = ?auto_2390701 ?auto_2390703 ) ) ( HOIST-AT ?auto_2390707 ?auto_2390701 ) ( not ( = ?auto_2390702 ?auto_2390707 ) ) ( AVAILABLE ?auto_2390707 ) ( SURFACE-AT ?auto_2390700 ?auto_2390701 ) ( ON ?auto_2390700 ?auto_2390704 ) ( CLEAR ?auto_2390700 ) ( not ( = ?auto_2390699 ?auto_2390704 ) ) ( not ( = ?auto_2390700 ?auto_2390704 ) ) ( not ( = ?auto_2390706 ?auto_2390704 ) ) ( TRUCK-AT ?auto_2390705 ?auto_2390703 ) ( SURFACE-AT ?auto_2390706 ?auto_2390703 ) ( CLEAR ?auto_2390706 ) ( LIFTING ?auto_2390702 ?auto_2390699 ) ( IS-CRATE ?auto_2390699 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390706 ?auto_2390699 )
      ( MAKE-2CRATE ?auto_2390706 ?auto_2390699 ?auto_2390700 )
      ( MAKE-1CRATE-VERIFY ?auto_2390699 ?auto_2390700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390708 - SURFACE
      ?auto_2390709 - SURFACE
      ?auto_2390710 - SURFACE
    )
    :vars
    (
      ?auto_2390712 - HOIST
      ?auto_2390711 - PLACE
      ?auto_2390715 - PLACE
      ?auto_2390713 - HOIST
      ?auto_2390716 - SURFACE
      ?auto_2390714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390712 ?auto_2390711 ) ( IS-CRATE ?auto_2390710 ) ( not ( = ?auto_2390709 ?auto_2390710 ) ) ( not ( = ?auto_2390708 ?auto_2390709 ) ) ( not ( = ?auto_2390708 ?auto_2390710 ) ) ( not ( = ?auto_2390715 ?auto_2390711 ) ) ( HOIST-AT ?auto_2390713 ?auto_2390715 ) ( not ( = ?auto_2390712 ?auto_2390713 ) ) ( AVAILABLE ?auto_2390713 ) ( SURFACE-AT ?auto_2390710 ?auto_2390715 ) ( ON ?auto_2390710 ?auto_2390716 ) ( CLEAR ?auto_2390710 ) ( not ( = ?auto_2390709 ?auto_2390716 ) ) ( not ( = ?auto_2390710 ?auto_2390716 ) ) ( not ( = ?auto_2390708 ?auto_2390716 ) ) ( TRUCK-AT ?auto_2390714 ?auto_2390711 ) ( SURFACE-AT ?auto_2390708 ?auto_2390711 ) ( CLEAR ?auto_2390708 ) ( LIFTING ?auto_2390712 ?auto_2390709 ) ( IS-CRATE ?auto_2390709 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390709 ?auto_2390710 )
      ( MAKE-2CRATE-VERIFY ?auto_2390708 ?auto_2390709 ?auto_2390710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390717 - SURFACE
      ?auto_2390718 - SURFACE
    )
    :vars
    (
      ?auto_2390719 - HOIST
      ?auto_2390724 - PLACE
      ?auto_2390725 - SURFACE
      ?auto_2390720 - PLACE
      ?auto_2390721 - HOIST
      ?auto_2390723 - SURFACE
      ?auto_2390722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390719 ?auto_2390724 ) ( IS-CRATE ?auto_2390718 ) ( not ( = ?auto_2390717 ?auto_2390718 ) ) ( not ( = ?auto_2390725 ?auto_2390717 ) ) ( not ( = ?auto_2390725 ?auto_2390718 ) ) ( not ( = ?auto_2390720 ?auto_2390724 ) ) ( HOIST-AT ?auto_2390721 ?auto_2390720 ) ( not ( = ?auto_2390719 ?auto_2390721 ) ) ( AVAILABLE ?auto_2390721 ) ( SURFACE-AT ?auto_2390718 ?auto_2390720 ) ( ON ?auto_2390718 ?auto_2390723 ) ( CLEAR ?auto_2390718 ) ( not ( = ?auto_2390717 ?auto_2390723 ) ) ( not ( = ?auto_2390718 ?auto_2390723 ) ) ( not ( = ?auto_2390725 ?auto_2390723 ) ) ( TRUCK-AT ?auto_2390722 ?auto_2390724 ) ( SURFACE-AT ?auto_2390725 ?auto_2390724 ) ( CLEAR ?auto_2390725 ) ( IS-CRATE ?auto_2390717 ) ( AVAILABLE ?auto_2390719 ) ( IN ?auto_2390717 ?auto_2390722 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2390719 ?auto_2390717 ?auto_2390722 ?auto_2390724 )
      ( MAKE-2CRATE ?auto_2390725 ?auto_2390717 ?auto_2390718 )
      ( MAKE-1CRATE-VERIFY ?auto_2390717 ?auto_2390718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2390726 - SURFACE
      ?auto_2390727 - SURFACE
      ?auto_2390728 - SURFACE
    )
    :vars
    (
      ?auto_2390730 - HOIST
      ?auto_2390732 - PLACE
      ?auto_2390734 - PLACE
      ?auto_2390731 - HOIST
      ?auto_2390733 - SURFACE
      ?auto_2390729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390730 ?auto_2390732 ) ( IS-CRATE ?auto_2390728 ) ( not ( = ?auto_2390727 ?auto_2390728 ) ) ( not ( = ?auto_2390726 ?auto_2390727 ) ) ( not ( = ?auto_2390726 ?auto_2390728 ) ) ( not ( = ?auto_2390734 ?auto_2390732 ) ) ( HOIST-AT ?auto_2390731 ?auto_2390734 ) ( not ( = ?auto_2390730 ?auto_2390731 ) ) ( AVAILABLE ?auto_2390731 ) ( SURFACE-AT ?auto_2390728 ?auto_2390734 ) ( ON ?auto_2390728 ?auto_2390733 ) ( CLEAR ?auto_2390728 ) ( not ( = ?auto_2390727 ?auto_2390733 ) ) ( not ( = ?auto_2390728 ?auto_2390733 ) ) ( not ( = ?auto_2390726 ?auto_2390733 ) ) ( TRUCK-AT ?auto_2390729 ?auto_2390732 ) ( SURFACE-AT ?auto_2390726 ?auto_2390732 ) ( CLEAR ?auto_2390726 ) ( IS-CRATE ?auto_2390727 ) ( AVAILABLE ?auto_2390730 ) ( IN ?auto_2390727 ?auto_2390729 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390727 ?auto_2390728 )
      ( MAKE-2CRATE-VERIFY ?auto_2390726 ?auto_2390727 ?auto_2390728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2390771 - SURFACE
      ?auto_2390772 - SURFACE
    )
    :vars
    (
      ?auto_2390774 - HOIST
      ?auto_2390779 - PLACE
      ?auto_2390776 - SURFACE
      ?auto_2390778 - PLACE
      ?auto_2390777 - HOIST
      ?auto_2390773 - SURFACE
      ?auto_2390775 - TRUCK
      ?auto_2390780 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390774 ?auto_2390779 ) ( SURFACE-AT ?auto_2390771 ?auto_2390779 ) ( CLEAR ?auto_2390771 ) ( IS-CRATE ?auto_2390772 ) ( not ( = ?auto_2390771 ?auto_2390772 ) ) ( AVAILABLE ?auto_2390774 ) ( ON ?auto_2390771 ?auto_2390776 ) ( not ( = ?auto_2390776 ?auto_2390771 ) ) ( not ( = ?auto_2390776 ?auto_2390772 ) ) ( not ( = ?auto_2390778 ?auto_2390779 ) ) ( HOIST-AT ?auto_2390777 ?auto_2390778 ) ( not ( = ?auto_2390774 ?auto_2390777 ) ) ( AVAILABLE ?auto_2390777 ) ( SURFACE-AT ?auto_2390772 ?auto_2390778 ) ( ON ?auto_2390772 ?auto_2390773 ) ( CLEAR ?auto_2390772 ) ( not ( = ?auto_2390771 ?auto_2390773 ) ) ( not ( = ?auto_2390772 ?auto_2390773 ) ) ( not ( = ?auto_2390776 ?auto_2390773 ) ) ( TRUCK-AT ?auto_2390775 ?auto_2390780 ) ( not ( = ?auto_2390780 ?auto_2390779 ) ) ( not ( = ?auto_2390778 ?auto_2390780 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2390775 ?auto_2390780 ?auto_2390779 )
      ( MAKE-1CRATE ?auto_2390771 ?auto_2390772 )
      ( MAKE-1CRATE-VERIFY ?auto_2390771 ?auto_2390772 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390810 - SURFACE
      ?auto_2390811 - SURFACE
      ?auto_2390812 - SURFACE
      ?auto_2390813 - SURFACE
    )
    :vars
    (
      ?auto_2390815 - HOIST
      ?auto_2390814 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390815 ?auto_2390814 ) ( SURFACE-AT ?auto_2390812 ?auto_2390814 ) ( CLEAR ?auto_2390812 ) ( LIFTING ?auto_2390815 ?auto_2390813 ) ( IS-CRATE ?auto_2390813 ) ( not ( = ?auto_2390812 ?auto_2390813 ) ) ( ON ?auto_2390811 ?auto_2390810 ) ( ON ?auto_2390812 ?auto_2390811 ) ( not ( = ?auto_2390810 ?auto_2390811 ) ) ( not ( = ?auto_2390810 ?auto_2390812 ) ) ( not ( = ?auto_2390810 ?auto_2390813 ) ) ( not ( = ?auto_2390811 ?auto_2390812 ) ) ( not ( = ?auto_2390811 ?auto_2390813 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2390812 ?auto_2390813 )
      ( MAKE-3CRATE-VERIFY ?auto_2390810 ?auto_2390811 ?auto_2390812 ?auto_2390813 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390827 - SURFACE
      ?auto_2390828 - SURFACE
      ?auto_2390829 - SURFACE
      ?auto_2390830 - SURFACE
    )
    :vars
    (
      ?auto_2390832 - HOIST
      ?auto_2390833 - PLACE
      ?auto_2390831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390832 ?auto_2390833 ) ( SURFACE-AT ?auto_2390829 ?auto_2390833 ) ( CLEAR ?auto_2390829 ) ( IS-CRATE ?auto_2390830 ) ( not ( = ?auto_2390829 ?auto_2390830 ) ) ( TRUCK-AT ?auto_2390831 ?auto_2390833 ) ( AVAILABLE ?auto_2390832 ) ( IN ?auto_2390830 ?auto_2390831 ) ( ON ?auto_2390829 ?auto_2390828 ) ( not ( = ?auto_2390828 ?auto_2390829 ) ) ( not ( = ?auto_2390828 ?auto_2390830 ) ) ( ON ?auto_2390828 ?auto_2390827 ) ( not ( = ?auto_2390827 ?auto_2390828 ) ) ( not ( = ?auto_2390827 ?auto_2390829 ) ) ( not ( = ?auto_2390827 ?auto_2390830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2390828 ?auto_2390829 ?auto_2390830 )
      ( MAKE-3CRATE-VERIFY ?auto_2390827 ?auto_2390828 ?auto_2390829 ?auto_2390830 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390848 - SURFACE
      ?auto_2390849 - SURFACE
      ?auto_2390850 - SURFACE
      ?auto_2390851 - SURFACE
    )
    :vars
    (
      ?auto_2390855 - HOIST
      ?auto_2390854 - PLACE
      ?auto_2390852 - TRUCK
      ?auto_2390853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390855 ?auto_2390854 ) ( SURFACE-AT ?auto_2390850 ?auto_2390854 ) ( CLEAR ?auto_2390850 ) ( IS-CRATE ?auto_2390851 ) ( not ( = ?auto_2390850 ?auto_2390851 ) ) ( AVAILABLE ?auto_2390855 ) ( IN ?auto_2390851 ?auto_2390852 ) ( ON ?auto_2390850 ?auto_2390849 ) ( not ( = ?auto_2390849 ?auto_2390850 ) ) ( not ( = ?auto_2390849 ?auto_2390851 ) ) ( TRUCK-AT ?auto_2390852 ?auto_2390853 ) ( not ( = ?auto_2390853 ?auto_2390854 ) ) ( ON ?auto_2390849 ?auto_2390848 ) ( not ( = ?auto_2390848 ?auto_2390849 ) ) ( not ( = ?auto_2390848 ?auto_2390850 ) ) ( not ( = ?auto_2390848 ?auto_2390851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2390849 ?auto_2390850 ?auto_2390851 )
      ( MAKE-3CRATE-VERIFY ?auto_2390848 ?auto_2390849 ?auto_2390850 ?auto_2390851 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390872 - SURFACE
      ?auto_2390873 - SURFACE
      ?auto_2390874 - SURFACE
      ?auto_2390875 - SURFACE
    )
    :vars
    (
      ?auto_2390879 - HOIST
      ?auto_2390876 - PLACE
      ?auto_2390877 - TRUCK
      ?auto_2390878 - PLACE
      ?auto_2390880 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390879 ?auto_2390876 ) ( SURFACE-AT ?auto_2390874 ?auto_2390876 ) ( CLEAR ?auto_2390874 ) ( IS-CRATE ?auto_2390875 ) ( not ( = ?auto_2390874 ?auto_2390875 ) ) ( AVAILABLE ?auto_2390879 ) ( ON ?auto_2390874 ?auto_2390873 ) ( not ( = ?auto_2390873 ?auto_2390874 ) ) ( not ( = ?auto_2390873 ?auto_2390875 ) ) ( TRUCK-AT ?auto_2390877 ?auto_2390878 ) ( not ( = ?auto_2390878 ?auto_2390876 ) ) ( HOIST-AT ?auto_2390880 ?auto_2390878 ) ( LIFTING ?auto_2390880 ?auto_2390875 ) ( not ( = ?auto_2390879 ?auto_2390880 ) ) ( ON ?auto_2390873 ?auto_2390872 ) ( not ( = ?auto_2390872 ?auto_2390873 ) ) ( not ( = ?auto_2390872 ?auto_2390874 ) ) ( not ( = ?auto_2390872 ?auto_2390875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2390873 ?auto_2390874 ?auto_2390875 )
      ( MAKE-3CRATE-VERIFY ?auto_2390872 ?auto_2390873 ?auto_2390874 ?auto_2390875 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390899 - SURFACE
      ?auto_2390900 - SURFACE
      ?auto_2390901 - SURFACE
      ?auto_2390902 - SURFACE
    )
    :vars
    (
      ?auto_2390903 - HOIST
      ?auto_2390906 - PLACE
      ?auto_2390905 - TRUCK
      ?auto_2390907 - PLACE
      ?auto_2390904 - HOIST
      ?auto_2390908 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390903 ?auto_2390906 ) ( SURFACE-AT ?auto_2390901 ?auto_2390906 ) ( CLEAR ?auto_2390901 ) ( IS-CRATE ?auto_2390902 ) ( not ( = ?auto_2390901 ?auto_2390902 ) ) ( AVAILABLE ?auto_2390903 ) ( ON ?auto_2390901 ?auto_2390900 ) ( not ( = ?auto_2390900 ?auto_2390901 ) ) ( not ( = ?auto_2390900 ?auto_2390902 ) ) ( TRUCK-AT ?auto_2390905 ?auto_2390907 ) ( not ( = ?auto_2390907 ?auto_2390906 ) ) ( HOIST-AT ?auto_2390904 ?auto_2390907 ) ( not ( = ?auto_2390903 ?auto_2390904 ) ) ( AVAILABLE ?auto_2390904 ) ( SURFACE-AT ?auto_2390902 ?auto_2390907 ) ( ON ?auto_2390902 ?auto_2390908 ) ( CLEAR ?auto_2390902 ) ( not ( = ?auto_2390901 ?auto_2390908 ) ) ( not ( = ?auto_2390902 ?auto_2390908 ) ) ( not ( = ?auto_2390900 ?auto_2390908 ) ) ( ON ?auto_2390900 ?auto_2390899 ) ( not ( = ?auto_2390899 ?auto_2390900 ) ) ( not ( = ?auto_2390899 ?auto_2390901 ) ) ( not ( = ?auto_2390899 ?auto_2390902 ) ) ( not ( = ?auto_2390899 ?auto_2390908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2390900 ?auto_2390901 ?auto_2390902 )
      ( MAKE-3CRATE-VERIFY ?auto_2390899 ?auto_2390900 ?auto_2390901 ?auto_2390902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390927 - SURFACE
      ?auto_2390928 - SURFACE
      ?auto_2390929 - SURFACE
      ?auto_2390930 - SURFACE
    )
    :vars
    (
      ?auto_2390936 - HOIST
      ?auto_2390934 - PLACE
      ?auto_2390931 - PLACE
      ?auto_2390933 - HOIST
      ?auto_2390935 - SURFACE
      ?auto_2390932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390936 ?auto_2390934 ) ( SURFACE-AT ?auto_2390929 ?auto_2390934 ) ( CLEAR ?auto_2390929 ) ( IS-CRATE ?auto_2390930 ) ( not ( = ?auto_2390929 ?auto_2390930 ) ) ( AVAILABLE ?auto_2390936 ) ( ON ?auto_2390929 ?auto_2390928 ) ( not ( = ?auto_2390928 ?auto_2390929 ) ) ( not ( = ?auto_2390928 ?auto_2390930 ) ) ( not ( = ?auto_2390931 ?auto_2390934 ) ) ( HOIST-AT ?auto_2390933 ?auto_2390931 ) ( not ( = ?auto_2390936 ?auto_2390933 ) ) ( AVAILABLE ?auto_2390933 ) ( SURFACE-AT ?auto_2390930 ?auto_2390931 ) ( ON ?auto_2390930 ?auto_2390935 ) ( CLEAR ?auto_2390930 ) ( not ( = ?auto_2390929 ?auto_2390935 ) ) ( not ( = ?auto_2390930 ?auto_2390935 ) ) ( not ( = ?auto_2390928 ?auto_2390935 ) ) ( TRUCK-AT ?auto_2390932 ?auto_2390934 ) ( ON ?auto_2390928 ?auto_2390927 ) ( not ( = ?auto_2390927 ?auto_2390928 ) ) ( not ( = ?auto_2390927 ?auto_2390929 ) ) ( not ( = ?auto_2390927 ?auto_2390930 ) ) ( not ( = ?auto_2390927 ?auto_2390935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2390928 ?auto_2390929 ?auto_2390930 )
      ( MAKE-3CRATE-VERIFY ?auto_2390927 ?auto_2390928 ?auto_2390929 ?auto_2390930 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390955 - SURFACE
      ?auto_2390956 - SURFACE
      ?auto_2390957 - SURFACE
      ?auto_2390958 - SURFACE
    )
    :vars
    (
      ?auto_2390961 - HOIST
      ?auto_2390959 - PLACE
      ?auto_2390964 - PLACE
      ?auto_2390960 - HOIST
      ?auto_2390963 - SURFACE
      ?auto_2390962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390961 ?auto_2390959 ) ( IS-CRATE ?auto_2390958 ) ( not ( = ?auto_2390957 ?auto_2390958 ) ) ( not ( = ?auto_2390956 ?auto_2390957 ) ) ( not ( = ?auto_2390956 ?auto_2390958 ) ) ( not ( = ?auto_2390964 ?auto_2390959 ) ) ( HOIST-AT ?auto_2390960 ?auto_2390964 ) ( not ( = ?auto_2390961 ?auto_2390960 ) ) ( AVAILABLE ?auto_2390960 ) ( SURFACE-AT ?auto_2390958 ?auto_2390964 ) ( ON ?auto_2390958 ?auto_2390963 ) ( CLEAR ?auto_2390958 ) ( not ( = ?auto_2390957 ?auto_2390963 ) ) ( not ( = ?auto_2390958 ?auto_2390963 ) ) ( not ( = ?auto_2390956 ?auto_2390963 ) ) ( TRUCK-AT ?auto_2390962 ?auto_2390959 ) ( SURFACE-AT ?auto_2390956 ?auto_2390959 ) ( CLEAR ?auto_2390956 ) ( LIFTING ?auto_2390961 ?auto_2390957 ) ( IS-CRATE ?auto_2390957 ) ( ON ?auto_2390956 ?auto_2390955 ) ( not ( = ?auto_2390955 ?auto_2390956 ) ) ( not ( = ?auto_2390955 ?auto_2390957 ) ) ( not ( = ?auto_2390955 ?auto_2390958 ) ) ( not ( = ?auto_2390955 ?auto_2390963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2390956 ?auto_2390957 ?auto_2390958 )
      ( MAKE-3CRATE-VERIFY ?auto_2390955 ?auto_2390956 ?auto_2390957 ?auto_2390958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2390983 - SURFACE
      ?auto_2390984 - SURFACE
      ?auto_2390985 - SURFACE
      ?auto_2390986 - SURFACE
    )
    :vars
    (
      ?auto_2390987 - HOIST
      ?auto_2390992 - PLACE
      ?auto_2390990 - PLACE
      ?auto_2390988 - HOIST
      ?auto_2390989 - SURFACE
      ?auto_2390991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390987 ?auto_2390992 ) ( IS-CRATE ?auto_2390986 ) ( not ( = ?auto_2390985 ?auto_2390986 ) ) ( not ( = ?auto_2390984 ?auto_2390985 ) ) ( not ( = ?auto_2390984 ?auto_2390986 ) ) ( not ( = ?auto_2390990 ?auto_2390992 ) ) ( HOIST-AT ?auto_2390988 ?auto_2390990 ) ( not ( = ?auto_2390987 ?auto_2390988 ) ) ( AVAILABLE ?auto_2390988 ) ( SURFACE-AT ?auto_2390986 ?auto_2390990 ) ( ON ?auto_2390986 ?auto_2390989 ) ( CLEAR ?auto_2390986 ) ( not ( = ?auto_2390985 ?auto_2390989 ) ) ( not ( = ?auto_2390986 ?auto_2390989 ) ) ( not ( = ?auto_2390984 ?auto_2390989 ) ) ( TRUCK-AT ?auto_2390991 ?auto_2390992 ) ( SURFACE-AT ?auto_2390984 ?auto_2390992 ) ( CLEAR ?auto_2390984 ) ( IS-CRATE ?auto_2390985 ) ( AVAILABLE ?auto_2390987 ) ( IN ?auto_2390985 ?auto_2390991 ) ( ON ?auto_2390984 ?auto_2390983 ) ( not ( = ?auto_2390983 ?auto_2390984 ) ) ( not ( = ?auto_2390983 ?auto_2390985 ) ) ( not ( = ?auto_2390983 ?auto_2390986 ) ) ( not ( = ?auto_2390983 ?auto_2390989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2390984 ?auto_2390985 ?auto_2390986 )
      ( MAKE-3CRATE-VERIFY ?auto_2390983 ?auto_2390984 ?auto_2390985 ?auto_2390986 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391274 - SURFACE
      ?auto_2391275 - SURFACE
      ?auto_2391276 - SURFACE
      ?auto_2391278 - SURFACE
      ?auto_2391277 - SURFACE
    )
    :vars
    (
      ?auto_2391279 - HOIST
      ?auto_2391280 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391279 ?auto_2391280 ) ( SURFACE-AT ?auto_2391278 ?auto_2391280 ) ( CLEAR ?auto_2391278 ) ( LIFTING ?auto_2391279 ?auto_2391277 ) ( IS-CRATE ?auto_2391277 ) ( not ( = ?auto_2391278 ?auto_2391277 ) ) ( ON ?auto_2391275 ?auto_2391274 ) ( ON ?auto_2391276 ?auto_2391275 ) ( ON ?auto_2391278 ?auto_2391276 ) ( not ( = ?auto_2391274 ?auto_2391275 ) ) ( not ( = ?auto_2391274 ?auto_2391276 ) ) ( not ( = ?auto_2391274 ?auto_2391278 ) ) ( not ( = ?auto_2391274 ?auto_2391277 ) ) ( not ( = ?auto_2391275 ?auto_2391276 ) ) ( not ( = ?auto_2391275 ?auto_2391278 ) ) ( not ( = ?auto_2391275 ?auto_2391277 ) ) ( not ( = ?auto_2391276 ?auto_2391278 ) ) ( not ( = ?auto_2391276 ?auto_2391277 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2391278 ?auto_2391277 )
      ( MAKE-4CRATE-VERIFY ?auto_2391274 ?auto_2391275 ?auto_2391276 ?auto_2391278 ?auto_2391277 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391299 - SURFACE
      ?auto_2391300 - SURFACE
      ?auto_2391301 - SURFACE
      ?auto_2391303 - SURFACE
      ?auto_2391302 - SURFACE
    )
    :vars
    (
      ?auto_2391304 - HOIST
      ?auto_2391305 - PLACE
      ?auto_2391306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391304 ?auto_2391305 ) ( SURFACE-AT ?auto_2391303 ?auto_2391305 ) ( CLEAR ?auto_2391303 ) ( IS-CRATE ?auto_2391302 ) ( not ( = ?auto_2391303 ?auto_2391302 ) ) ( TRUCK-AT ?auto_2391306 ?auto_2391305 ) ( AVAILABLE ?auto_2391304 ) ( IN ?auto_2391302 ?auto_2391306 ) ( ON ?auto_2391303 ?auto_2391301 ) ( not ( = ?auto_2391301 ?auto_2391303 ) ) ( not ( = ?auto_2391301 ?auto_2391302 ) ) ( ON ?auto_2391300 ?auto_2391299 ) ( ON ?auto_2391301 ?auto_2391300 ) ( not ( = ?auto_2391299 ?auto_2391300 ) ) ( not ( = ?auto_2391299 ?auto_2391301 ) ) ( not ( = ?auto_2391299 ?auto_2391303 ) ) ( not ( = ?auto_2391299 ?auto_2391302 ) ) ( not ( = ?auto_2391300 ?auto_2391301 ) ) ( not ( = ?auto_2391300 ?auto_2391303 ) ) ( not ( = ?auto_2391300 ?auto_2391302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2391301 ?auto_2391303 ?auto_2391302 )
      ( MAKE-4CRATE-VERIFY ?auto_2391299 ?auto_2391300 ?auto_2391301 ?auto_2391303 ?auto_2391302 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391329 - SURFACE
      ?auto_2391330 - SURFACE
      ?auto_2391331 - SURFACE
      ?auto_2391333 - SURFACE
      ?auto_2391332 - SURFACE
    )
    :vars
    (
      ?auto_2391336 - HOIST
      ?auto_2391335 - PLACE
      ?auto_2391334 - TRUCK
      ?auto_2391337 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391336 ?auto_2391335 ) ( SURFACE-AT ?auto_2391333 ?auto_2391335 ) ( CLEAR ?auto_2391333 ) ( IS-CRATE ?auto_2391332 ) ( not ( = ?auto_2391333 ?auto_2391332 ) ) ( AVAILABLE ?auto_2391336 ) ( IN ?auto_2391332 ?auto_2391334 ) ( ON ?auto_2391333 ?auto_2391331 ) ( not ( = ?auto_2391331 ?auto_2391333 ) ) ( not ( = ?auto_2391331 ?auto_2391332 ) ) ( TRUCK-AT ?auto_2391334 ?auto_2391337 ) ( not ( = ?auto_2391337 ?auto_2391335 ) ) ( ON ?auto_2391330 ?auto_2391329 ) ( ON ?auto_2391331 ?auto_2391330 ) ( not ( = ?auto_2391329 ?auto_2391330 ) ) ( not ( = ?auto_2391329 ?auto_2391331 ) ) ( not ( = ?auto_2391329 ?auto_2391333 ) ) ( not ( = ?auto_2391329 ?auto_2391332 ) ) ( not ( = ?auto_2391330 ?auto_2391331 ) ) ( not ( = ?auto_2391330 ?auto_2391333 ) ) ( not ( = ?auto_2391330 ?auto_2391332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2391331 ?auto_2391333 ?auto_2391332 )
      ( MAKE-4CRATE-VERIFY ?auto_2391329 ?auto_2391330 ?auto_2391331 ?auto_2391333 ?auto_2391332 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391363 - SURFACE
      ?auto_2391364 - SURFACE
      ?auto_2391365 - SURFACE
      ?auto_2391367 - SURFACE
      ?auto_2391366 - SURFACE
    )
    :vars
    (
      ?auto_2391368 - HOIST
      ?auto_2391369 - PLACE
      ?auto_2391370 - TRUCK
      ?auto_2391372 - PLACE
      ?auto_2391371 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391368 ?auto_2391369 ) ( SURFACE-AT ?auto_2391367 ?auto_2391369 ) ( CLEAR ?auto_2391367 ) ( IS-CRATE ?auto_2391366 ) ( not ( = ?auto_2391367 ?auto_2391366 ) ) ( AVAILABLE ?auto_2391368 ) ( ON ?auto_2391367 ?auto_2391365 ) ( not ( = ?auto_2391365 ?auto_2391367 ) ) ( not ( = ?auto_2391365 ?auto_2391366 ) ) ( TRUCK-AT ?auto_2391370 ?auto_2391372 ) ( not ( = ?auto_2391372 ?auto_2391369 ) ) ( HOIST-AT ?auto_2391371 ?auto_2391372 ) ( LIFTING ?auto_2391371 ?auto_2391366 ) ( not ( = ?auto_2391368 ?auto_2391371 ) ) ( ON ?auto_2391364 ?auto_2391363 ) ( ON ?auto_2391365 ?auto_2391364 ) ( not ( = ?auto_2391363 ?auto_2391364 ) ) ( not ( = ?auto_2391363 ?auto_2391365 ) ) ( not ( = ?auto_2391363 ?auto_2391367 ) ) ( not ( = ?auto_2391363 ?auto_2391366 ) ) ( not ( = ?auto_2391364 ?auto_2391365 ) ) ( not ( = ?auto_2391364 ?auto_2391367 ) ) ( not ( = ?auto_2391364 ?auto_2391366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2391365 ?auto_2391367 ?auto_2391366 )
      ( MAKE-4CRATE-VERIFY ?auto_2391363 ?auto_2391364 ?auto_2391365 ?auto_2391367 ?auto_2391366 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391401 - SURFACE
      ?auto_2391402 - SURFACE
      ?auto_2391403 - SURFACE
      ?auto_2391405 - SURFACE
      ?auto_2391404 - SURFACE
    )
    :vars
    (
      ?auto_2391406 - HOIST
      ?auto_2391410 - PLACE
      ?auto_2391407 - TRUCK
      ?auto_2391408 - PLACE
      ?auto_2391409 - HOIST
      ?auto_2391411 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391406 ?auto_2391410 ) ( SURFACE-AT ?auto_2391405 ?auto_2391410 ) ( CLEAR ?auto_2391405 ) ( IS-CRATE ?auto_2391404 ) ( not ( = ?auto_2391405 ?auto_2391404 ) ) ( AVAILABLE ?auto_2391406 ) ( ON ?auto_2391405 ?auto_2391403 ) ( not ( = ?auto_2391403 ?auto_2391405 ) ) ( not ( = ?auto_2391403 ?auto_2391404 ) ) ( TRUCK-AT ?auto_2391407 ?auto_2391408 ) ( not ( = ?auto_2391408 ?auto_2391410 ) ) ( HOIST-AT ?auto_2391409 ?auto_2391408 ) ( not ( = ?auto_2391406 ?auto_2391409 ) ) ( AVAILABLE ?auto_2391409 ) ( SURFACE-AT ?auto_2391404 ?auto_2391408 ) ( ON ?auto_2391404 ?auto_2391411 ) ( CLEAR ?auto_2391404 ) ( not ( = ?auto_2391405 ?auto_2391411 ) ) ( not ( = ?auto_2391404 ?auto_2391411 ) ) ( not ( = ?auto_2391403 ?auto_2391411 ) ) ( ON ?auto_2391402 ?auto_2391401 ) ( ON ?auto_2391403 ?auto_2391402 ) ( not ( = ?auto_2391401 ?auto_2391402 ) ) ( not ( = ?auto_2391401 ?auto_2391403 ) ) ( not ( = ?auto_2391401 ?auto_2391405 ) ) ( not ( = ?auto_2391401 ?auto_2391404 ) ) ( not ( = ?auto_2391401 ?auto_2391411 ) ) ( not ( = ?auto_2391402 ?auto_2391403 ) ) ( not ( = ?auto_2391402 ?auto_2391405 ) ) ( not ( = ?auto_2391402 ?auto_2391404 ) ) ( not ( = ?auto_2391402 ?auto_2391411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2391403 ?auto_2391405 ?auto_2391404 )
      ( MAKE-4CRATE-VERIFY ?auto_2391401 ?auto_2391402 ?auto_2391403 ?auto_2391405 ?auto_2391404 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391440 - SURFACE
      ?auto_2391441 - SURFACE
      ?auto_2391442 - SURFACE
      ?auto_2391444 - SURFACE
      ?auto_2391443 - SURFACE
    )
    :vars
    (
      ?auto_2391450 - HOIST
      ?auto_2391449 - PLACE
      ?auto_2391445 - PLACE
      ?auto_2391447 - HOIST
      ?auto_2391448 - SURFACE
      ?auto_2391446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391450 ?auto_2391449 ) ( SURFACE-AT ?auto_2391444 ?auto_2391449 ) ( CLEAR ?auto_2391444 ) ( IS-CRATE ?auto_2391443 ) ( not ( = ?auto_2391444 ?auto_2391443 ) ) ( AVAILABLE ?auto_2391450 ) ( ON ?auto_2391444 ?auto_2391442 ) ( not ( = ?auto_2391442 ?auto_2391444 ) ) ( not ( = ?auto_2391442 ?auto_2391443 ) ) ( not ( = ?auto_2391445 ?auto_2391449 ) ) ( HOIST-AT ?auto_2391447 ?auto_2391445 ) ( not ( = ?auto_2391450 ?auto_2391447 ) ) ( AVAILABLE ?auto_2391447 ) ( SURFACE-AT ?auto_2391443 ?auto_2391445 ) ( ON ?auto_2391443 ?auto_2391448 ) ( CLEAR ?auto_2391443 ) ( not ( = ?auto_2391444 ?auto_2391448 ) ) ( not ( = ?auto_2391443 ?auto_2391448 ) ) ( not ( = ?auto_2391442 ?auto_2391448 ) ) ( TRUCK-AT ?auto_2391446 ?auto_2391449 ) ( ON ?auto_2391441 ?auto_2391440 ) ( ON ?auto_2391442 ?auto_2391441 ) ( not ( = ?auto_2391440 ?auto_2391441 ) ) ( not ( = ?auto_2391440 ?auto_2391442 ) ) ( not ( = ?auto_2391440 ?auto_2391444 ) ) ( not ( = ?auto_2391440 ?auto_2391443 ) ) ( not ( = ?auto_2391440 ?auto_2391448 ) ) ( not ( = ?auto_2391441 ?auto_2391442 ) ) ( not ( = ?auto_2391441 ?auto_2391444 ) ) ( not ( = ?auto_2391441 ?auto_2391443 ) ) ( not ( = ?auto_2391441 ?auto_2391448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2391442 ?auto_2391444 ?auto_2391443 )
      ( MAKE-4CRATE-VERIFY ?auto_2391440 ?auto_2391441 ?auto_2391442 ?auto_2391444 ?auto_2391443 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391479 - SURFACE
      ?auto_2391480 - SURFACE
      ?auto_2391481 - SURFACE
      ?auto_2391483 - SURFACE
      ?auto_2391482 - SURFACE
    )
    :vars
    (
      ?auto_2391484 - HOIST
      ?auto_2391487 - PLACE
      ?auto_2391488 - PLACE
      ?auto_2391486 - HOIST
      ?auto_2391489 - SURFACE
      ?auto_2391485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391484 ?auto_2391487 ) ( IS-CRATE ?auto_2391482 ) ( not ( = ?auto_2391483 ?auto_2391482 ) ) ( not ( = ?auto_2391481 ?auto_2391483 ) ) ( not ( = ?auto_2391481 ?auto_2391482 ) ) ( not ( = ?auto_2391488 ?auto_2391487 ) ) ( HOIST-AT ?auto_2391486 ?auto_2391488 ) ( not ( = ?auto_2391484 ?auto_2391486 ) ) ( AVAILABLE ?auto_2391486 ) ( SURFACE-AT ?auto_2391482 ?auto_2391488 ) ( ON ?auto_2391482 ?auto_2391489 ) ( CLEAR ?auto_2391482 ) ( not ( = ?auto_2391483 ?auto_2391489 ) ) ( not ( = ?auto_2391482 ?auto_2391489 ) ) ( not ( = ?auto_2391481 ?auto_2391489 ) ) ( TRUCK-AT ?auto_2391485 ?auto_2391487 ) ( SURFACE-AT ?auto_2391481 ?auto_2391487 ) ( CLEAR ?auto_2391481 ) ( LIFTING ?auto_2391484 ?auto_2391483 ) ( IS-CRATE ?auto_2391483 ) ( ON ?auto_2391480 ?auto_2391479 ) ( ON ?auto_2391481 ?auto_2391480 ) ( not ( = ?auto_2391479 ?auto_2391480 ) ) ( not ( = ?auto_2391479 ?auto_2391481 ) ) ( not ( = ?auto_2391479 ?auto_2391483 ) ) ( not ( = ?auto_2391479 ?auto_2391482 ) ) ( not ( = ?auto_2391479 ?auto_2391489 ) ) ( not ( = ?auto_2391480 ?auto_2391481 ) ) ( not ( = ?auto_2391480 ?auto_2391483 ) ) ( not ( = ?auto_2391480 ?auto_2391482 ) ) ( not ( = ?auto_2391480 ?auto_2391489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2391481 ?auto_2391483 ?auto_2391482 )
      ( MAKE-4CRATE-VERIFY ?auto_2391479 ?auto_2391480 ?auto_2391481 ?auto_2391483 ?auto_2391482 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2391518 - SURFACE
      ?auto_2391519 - SURFACE
      ?auto_2391520 - SURFACE
      ?auto_2391522 - SURFACE
      ?auto_2391521 - SURFACE
    )
    :vars
    (
      ?auto_2391526 - HOIST
      ?auto_2391525 - PLACE
      ?auto_2391528 - PLACE
      ?auto_2391527 - HOIST
      ?auto_2391524 - SURFACE
      ?auto_2391523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391526 ?auto_2391525 ) ( IS-CRATE ?auto_2391521 ) ( not ( = ?auto_2391522 ?auto_2391521 ) ) ( not ( = ?auto_2391520 ?auto_2391522 ) ) ( not ( = ?auto_2391520 ?auto_2391521 ) ) ( not ( = ?auto_2391528 ?auto_2391525 ) ) ( HOIST-AT ?auto_2391527 ?auto_2391528 ) ( not ( = ?auto_2391526 ?auto_2391527 ) ) ( AVAILABLE ?auto_2391527 ) ( SURFACE-AT ?auto_2391521 ?auto_2391528 ) ( ON ?auto_2391521 ?auto_2391524 ) ( CLEAR ?auto_2391521 ) ( not ( = ?auto_2391522 ?auto_2391524 ) ) ( not ( = ?auto_2391521 ?auto_2391524 ) ) ( not ( = ?auto_2391520 ?auto_2391524 ) ) ( TRUCK-AT ?auto_2391523 ?auto_2391525 ) ( SURFACE-AT ?auto_2391520 ?auto_2391525 ) ( CLEAR ?auto_2391520 ) ( IS-CRATE ?auto_2391522 ) ( AVAILABLE ?auto_2391526 ) ( IN ?auto_2391522 ?auto_2391523 ) ( ON ?auto_2391519 ?auto_2391518 ) ( ON ?auto_2391520 ?auto_2391519 ) ( not ( = ?auto_2391518 ?auto_2391519 ) ) ( not ( = ?auto_2391518 ?auto_2391520 ) ) ( not ( = ?auto_2391518 ?auto_2391522 ) ) ( not ( = ?auto_2391518 ?auto_2391521 ) ) ( not ( = ?auto_2391518 ?auto_2391524 ) ) ( not ( = ?auto_2391519 ?auto_2391520 ) ) ( not ( = ?auto_2391519 ?auto_2391522 ) ) ( not ( = ?auto_2391519 ?auto_2391521 ) ) ( not ( = ?auto_2391519 ?auto_2391524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2391520 ?auto_2391522 ?auto_2391521 )
      ( MAKE-4CRATE-VERIFY ?auto_2391518 ?auto_2391519 ?auto_2391520 ?auto_2391522 ?auto_2391521 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392178 - SURFACE
      ?auto_2392179 - SURFACE
      ?auto_2392180 - SURFACE
      ?auto_2392182 - SURFACE
      ?auto_2392181 - SURFACE
      ?auto_2392183 - SURFACE
    )
    :vars
    (
      ?auto_2392185 - HOIST
      ?auto_2392184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392185 ?auto_2392184 ) ( SURFACE-AT ?auto_2392181 ?auto_2392184 ) ( CLEAR ?auto_2392181 ) ( LIFTING ?auto_2392185 ?auto_2392183 ) ( IS-CRATE ?auto_2392183 ) ( not ( = ?auto_2392181 ?auto_2392183 ) ) ( ON ?auto_2392179 ?auto_2392178 ) ( ON ?auto_2392180 ?auto_2392179 ) ( ON ?auto_2392182 ?auto_2392180 ) ( ON ?auto_2392181 ?auto_2392182 ) ( not ( = ?auto_2392178 ?auto_2392179 ) ) ( not ( = ?auto_2392178 ?auto_2392180 ) ) ( not ( = ?auto_2392178 ?auto_2392182 ) ) ( not ( = ?auto_2392178 ?auto_2392181 ) ) ( not ( = ?auto_2392178 ?auto_2392183 ) ) ( not ( = ?auto_2392179 ?auto_2392180 ) ) ( not ( = ?auto_2392179 ?auto_2392182 ) ) ( not ( = ?auto_2392179 ?auto_2392181 ) ) ( not ( = ?auto_2392179 ?auto_2392183 ) ) ( not ( = ?auto_2392180 ?auto_2392182 ) ) ( not ( = ?auto_2392180 ?auto_2392181 ) ) ( not ( = ?auto_2392180 ?auto_2392183 ) ) ( not ( = ?auto_2392182 ?auto_2392181 ) ) ( not ( = ?auto_2392182 ?auto_2392183 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2392181 ?auto_2392183 )
      ( MAKE-5CRATE-VERIFY ?auto_2392178 ?auto_2392179 ?auto_2392180 ?auto_2392182 ?auto_2392181 ?auto_2392183 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392212 - SURFACE
      ?auto_2392213 - SURFACE
      ?auto_2392214 - SURFACE
      ?auto_2392216 - SURFACE
      ?auto_2392215 - SURFACE
      ?auto_2392217 - SURFACE
    )
    :vars
    (
      ?auto_2392219 - HOIST
      ?auto_2392218 - PLACE
      ?auto_2392220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392219 ?auto_2392218 ) ( SURFACE-AT ?auto_2392215 ?auto_2392218 ) ( CLEAR ?auto_2392215 ) ( IS-CRATE ?auto_2392217 ) ( not ( = ?auto_2392215 ?auto_2392217 ) ) ( TRUCK-AT ?auto_2392220 ?auto_2392218 ) ( AVAILABLE ?auto_2392219 ) ( IN ?auto_2392217 ?auto_2392220 ) ( ON ?auto_2392215 ?auto_2392216 ) ( not ( = ?auto_2392216 ?auto_2392215 ) ) ( not ( = ?auto_2392216 ?auto_2392217 ) ) ( ON ?auto_2392213 ?auto_2392212 ) ( ON ?auto_2392214 ?auto_2392213 ) ( ON ?auto_2392216 ?auto_2392214 ) ( not ( = ?auto_2392212 ?auto_2392213 ) ) ( not ( = ?auto_2392212 ?auto_2392214 ) ) ( not ( = ?auto_2392212 ?auto_2392216 ) ) ( not ( = ?auto_2392212 ?auto_2392215 ) ) ( not ( = ?auto_2392212 ?auto_2392217 ) ) ( not ( = ?auto_2392213 ?auto_2392214 ) ) ( not ( = ?auto_2392213 ?auto_2392216 ) ) ( not ( = ?auto_2392213 ?auto_2392215 ) ) ( not ( = ?auto_2392213 ?auto_2392217 ) ) ( not ( = ?auto_2392214 ?auto_2392216 ) ) ( not ( = ?auto_2392214 ?auto_2392215 ) ) ( not ( = ?auto_2392214 ?auto_2392217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392216 ?auto_2392215 ?auto_2392217 )
      ( MAKE-5CRATE-VERIFY ?auto_2392212 ?auto_2392213 ?auto_2392214 ?auto_2392216 ?auto_2392215 ?auto_2392217 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392252 - SURFACE
      ?auto_2392253 - SURFACE
      ?auto_2392254 - SURFACE
      ?auto_2392256 - SURFACE
      ?auto_2392255 - SURFACE
      ?auto_2392257 - SURFACE
    )
    :vars
    (
      ?auto_2392259 - HOIST
      ?auto_2392260 - PLACE
      ?auto_2392258 - TRUCK
      ?auto_2392261 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392259 ?auto_2392260 ) ( SURFACE-AT ?auto_2392255 ?auto_2392260 ) ( CLEAR ?auto_2392255 ) ( IS-CRATE ?auto_2392257 ) ( not ( = ?auto_2392255 ?auto_2392257 ) ) ( AVAILABLE ?auto_2392259 ) ( IN ?auto_2392257 ?auto_2392258 ) ( ON ?auto_2392255 ?auto_2392256 ) ( not ( = ?auto_2392256 ?auto_2392255 ) ) ( not ( = ?auto_2392256 ?auto_2392257 ) ) ( TRUCK-AT ?auto_2392258 ?auto_2392261 ) ( not ( = ?auto_2392261 ?auto_2392260 ) ) ( ON ?auto_2392253 ?auto_2392252 ) ( ON ?auto_2392254 ?auto_2392253 ) ( ON ?auto_2392256 ?auto_2392254 ) ( not ( = ?auto_2392252 ?auto_2392253 ) ) ( not ( = ?auto_2392252 ?auto_2392254 ) ) ( not ( = ?auto_2392252 ?auto_2392256 ) ) ( not ( = ?auto_2392252 ?auto_2392255 ) ) ( not ( = ?auto_2392252 ?auto_2392257 ) ) ( not ( = ?auto_2392253 ?auto_2392254 ) ) ( not ( = ?auto_2392253 ?auto_2392256 ) ) ( not ( = ?auto_2392253 ?auto_2392255 ) ) ( not ( = ?auto_2392253 ?auto_2392257 ) ) ( not ( = ?auto_2392254 ?auto_2392256 ) ) ( not ( = ?auto_2392254 ?auto_2392255 ) ) ( not ( = ?auto_2392254 ?auto_2392257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392256 ?auto_2392255 ?auto_2392257 )
      ( MAKE-5CRATE-VERIFY ?auto_2392252 ?auto_2392253 ?auto_2392254 ?auto_2392256 ?auto_2392255 ?auto_2392257 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392297 - SURFACE
      ?auto_2392298 - SURFACE
      ?auto_2392299 - SURFACE
      ?auto_2392301 - SURFACE
      ?auto_2392300 - SURFACE
      ?auto_2392302 - SURFACE
    )
    :vars
    (
      ?auto_2392305 - HOIST
      ?auto_2392303 - PLACE
      ?auto_2392304 - TRUCK
      ?auto_2392306 - PLACE
      ?auto_2392307 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392305 ?auto_2392303 ) ( SURFACE-AT ?auto_2392300 ?auto_2392303 ) ( CLEAR ?auto_2392300 ) ( IS-CRATE ?auto_2392302 ) ( not ( = ?auto_2392300 ?auto_2392302 ) ) ( AVAILABLE ?auto_2392305 ) ( ON ?auto_2392300 ?auto_2392301 ) ( not ( = ?auto_2392301 ?auto_2392300 ) ) ( not ( = ?auto_2392301 ?auto_2392302 ) ) ( TRUCK-AT ?auto_2392304 ?auto_2392306 ) ( not ( = ?auto_2392306 ?auto_2392303 ) ) ( HOIST-AT ?auto_2392307 ?auto_2392306 ) ( LIFTING ?auto_2392307 ?auto_2392302 ) ( not ( = ?auto_2392305 ?auto_2392307 ) ) ( ON ?auto_2392298 ?auto_2392297 ) ( ON ?auto_2392299 ?auto_2392298 ) ( ON ?auto_2392301 ?auto_2392299 ) ( not ( = ?auto_2392297 ?auto_2392298 ) ) ( not ( = ?auto_2392297 ?auto_2392299 ) ) ( not ( = ?auto_2392297 ?auto_2392301 ) ) ( not ( = ?auto_2392297 ?auto_2392300 ) ) ( not ( = ?auto_2392297 ?auto_2392302 ) ) ( not ( = ?auto_2392298 ?auto_2392299 ) ) ( not ( = ?auto_2392298 ?auto_2392301 ) ) ( not ( = ?auto_2392298 ?auto_2392300 ) ) ( not ( = ?auto_2392298 ?auto_2392302 ) ) ( not ( = ?auto_2392299 ?auto_2392301 ) ) ( not ( = ?auto_2392299 ?auto_2392300 ) ) ( not ( = ?auto_2392299 ?auto_2392302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392301 ?auto_2392300 ?auto_2392302 )
      ( MAKE-5CRATE-VERIFY ?auto_2392297 ?auto_2392298 ?auto_2392299 ?auto_2392301 ?auto_2392300 ?auto_2392302 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392347 - SURFACE
      ?auto_2392348 - SURFACE
      ?auto_2392349 - SURFACE
      ?auto_2392351 - SURFACE
      ?auto_2392350 - SURFACE
      ?auto_2392352 - SURFACE
    )
    :vars
    (
      ?auto_2392354 - HOIST
      ?auto_2392357 - PLACE
      ?auto_2392353 - TRUCK
      ?auto_2392355 - PLACE
      ?auto_2392356 - HOIST
      ?auto_2392358 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392354 ?auto_2392357 ) ( SURFACE-AT ?auto_2392350 ?auto_2392357 ) ( CLEAR ?auto_2392350 ) ( IS-CRATE ?auto_2392352 ) ( not ( = ?auto_2392350 ?auto_2392352 ) ) ( AVAILABLE ?auto_2392354 ) ( ON ?auto_2392350 ?auto_2392351 ) ( not ( = ?auto_2392351 ?auto_2392350 ) ) ( not ( = ?auto_2392351 ?auto_2392352 ) ) ( TRUCK-AT ?auto_2392353 ?auto_2392355 ) ( not ( = ?auto_2392355 ?auto_2392357 ) ) ( HOIST-AT ?auto_2392356 ?auto_2392355 ) ( not ( = ?auto_2392354 ?auto_2392356 ) ) ( AVAILABLE ?auto_2392356 ) ( SURFACE-AT ?auto_2392352 ?auto_2392355 ) ( ON ?auto_2392352 ?auto_2392358 ) ( CLEAR ?auto_2392352 ) ( not ( = ?auto_2392350 ?auto_2392358 ) ) ( not ( = ?auto_2392352 ?auto_2392358 ) ) ( not ( = ?auto_2392351 ?auto_2392358 ) ) ( ON ?auto_2392348 ?auto_2392347 ) ( ON ?auto_2392349 ?auto_2392348 ) ( ON ?auto_2392351 ?auto_2392349 ) ( not ( = ?auto_2392347 ?auto_2392348 ) ) ( not ( = ?auto_2392347 ?auto_2392349 ) ) ( not ( = ?auto_2392347 ?auto_2392351 ) ) ( not ( = ?auto_2392347 ?auto_2392350 ) ) ( not ( = ?auto_2392347 ?auto_2392352 ) ) ( not ( = ?auto_2392347 ?auto_2392358 ) ) ( not ( = ?auto_2392348 ?auto_2392349 ) ) ( not ( = ?auto_2392348 ?auto_2392351 ) ) ( not ( = ?auto_2392348 ?auto_2392350 ) ) ( not ( = ?auto_2392348 ?auto_2392352 ) ) ( not ( = ?auto_2392348 ?auto_2392358 ) ) ( not ( = ?auto_2392349 ?auto_2392351 ) ) ( not ( = ?auto_2392349 ?auto_2392350 ) ) ( not ( = ?auto_2392349 ?auto_2392352 ) ) ( not ( = ?auto_2392349 ?auto_2392358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392351 ?auto_2392350 ?auto_2392352 )
      ( MAKE-5CRATE-VERIFY ?auto_2392347 ?auto_2392348 ?auto_2392349 ?auto_2392351 ?auto_2392350 ?auto_2392352 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392398 - SURFACE
      ?auto_2392399 - SURFACE
      ?auto_2392400 - SURFACE
      ?auto_2392402 - SURFACE
      ?auto_2392401 - SURFACE
      ?auto_2392403 - SURFACE
    )
    :vars
    (
      ?auto_2392406 - HOIST
      ?auto_2392409 - PLACE
      ?auto_2392407 - PLACE
      ?auto_2392404 - HOIST
      ?auto_2392405 - SURFACE
      ?auto_2392408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392406 ?auto_2392409 ) ( SURFACE-AT ?auto_2392401 ?auto_2392409 ) ( CLEAR ?auto_2392401 ) ( IS-CRATE ?auto_2392403 ) ( not ( = ?auto_2392401 ?auto_2392403 ) ) ( AVAILABLE ?auto_2392406 ) ( ON ?auto_2392401 ?auto_2392402 ) ( not ( = ?auto_2392402 ?auto_2392401 ) ) ( not ( = ?auto_2392402 ?auto_2392403 ) ) ( not ( = ?auto_2392407 ?auto_2392409 ) ) ( HOIST-AT ?auto_2392404 ?auto_2392407 ) ( not ( = ?auto_2392406 ?auto_2392404 ) ) ( AVAILABLE ?auto_2392404 ) ( SURFACE-AT ?auto_2392403 ?auto_2392407 ) ( ON ?auto_2392403 ?auto_2392405 ) ( CLEAR ?auto_2392403 ) ( not ( = ?auto_2392401 ?auto_2392405 ) ) ( not ( = ?auto_2392403 ?auto_2392405 ) ) ( not ( = ?auto_2392402 ?auto_2392405 ) ) ( TRUCK-AT ?auto_2392408 ?auto_2392409 ) ( ON ?auto_2392399 ?auto_2392398 ) ( ON ?auto_2392400 ?auto_2392399 ) ( ON ?auto_2392402 ?auto_2392400 ) ( not ( = ?auto_2392398 ?auto_2392399 ) ) ( not ( = ?auto_2392398 ?auto_2392400 ) ) ( not ( = ?auto_2392398 ?auto_2392402 ) ) ( not ( = ?auto_2392398 ?auto_2392401 ) ) ( not ( = ?auto_2392398 ?auto_2392403 ) ) ( not ( = ?auto_2392398 ?auto_2392405 ) ) ( not ( = ?auto_2392399 ?auto_2392400 ) ) ( not ( = ?auto_2392399 ?auto_2392402 ) ) ( not ( = ?auto_2392399 ?auto_2392401 ) ) ( not ( = ?auto_2392399 ?auto_2392403 ) ) ( not ( = ?auto_2392399 ?auto_2392405 ) ) ( not ( = ?auto_2392400 ?auto_2392402 ) ) ( not ( = ?auto_2392400 ?auto_2392401 ) ) ( not ( = ?auto_2392400 ?auto_2392403 ) ) ( not ( = ?auto_2392400 ?auto_2392405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392402 ?auto_2392401 ?auto_2392403 )
      ( MAKE-5CRATE-VERIFY ?auto_2392398 ?auto_2392399 ?auto_2392400 ?auto_2392402 ?auto_2392401 ?auto_2392403 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392449 - SURFACE
      ?auto_2392450 - SURFACE
      ?auto_2392451 - SURFACE
      ?auto_2392453 - SURFACE
      ?auto_2392452 - SURFACE
      ?auto_2392454 - SURFACE
    )
    :vars
    (
      ?auto_2392455 - HOIST
      ?auto_2392459 - PLACE
      ?auto_2392458 - PLACE
      ?auto_2392460 - HOIST
      ?auto_2392457 - SURFACE
      ?auto_2392456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392455 ?auto_2392459 ) ( IS-CRATE ?auto_2392454 ) ( not ( = ?auto_2392452 ?auto_2392454 ) ) ( not ( = ?auto_2392453 ?auto_2392452 ) ) ( not ( = ?auto_2392453 ?auto_2392454 ) ) ( not ( = ?auto_2392458 ?auto_2392459 ) ) ( HOIST-AT ?auto_2392460 ?auto_2392458 ) ( not ( = ?auto_2392455 ?auto_2392460 ) ) ( AVAILABLE ?auto_2392460 ) ( SURFACE-AT ?auto_2392454 ?auto_2392458 ) ( ON ?auto_2392454 ?auto_2392457 ) ( CLEAR ?auto_2392454 ) ( not ( = ?auto_2392452 ?auto_2392457 ) ) ( not ( = ?auto_2392454 ?auto_2392457 ) ) ( not ( = ?auto_2392453 ?auto_2392457 ) ) ( TRUCK-AT ?auto_2392456 ?auto_2392459 ) ( SURFACE-AT ?auto_2392453 ?auto_2392459 ) ( CLEAR ?auto_2392453 ) ( LIFTING ?auto_2392455 ?auto_2392452 ) ( IS-CRATE ?auto_2392452 ) ( ON ?auto_2392450 ?auto_2392449 ) ( ON ?auto_2392451 ?auto_2392450 ) ( ON ?auto_2392453 ?auto_2392451 ) ( not ( = ?auto_2392449 ?auto_2392450 ) ) ( not ( = ?auto_2392449 ?auto_2392451 ) ) ( not ( = ?auto_2392449 ?auto_2392453 ) ) ( not ( = ?auto_2392449 ?auto_2392452 ) ) ( not ( = ?auto_2392449 ?auto_2392454 ) ) ( not ( = ?auto_2392449 ?auto_2392457 ) ) ( not ( = ?auto_2392450 ?auto_2392451 ) ) ( not ( = ?auto_2392450 ?auto_2392453 ) ) ( not ( = ?auto_2392450 ?auto_2392452 ) ) ( not ( = ?auto_2392450 ?auto_2392454 ) ) ( not ( = ?auto_2392450 ?auto_2392457 ) ) ( not ( = ?auto_2392451 ?auto_2392453 ) ) ( not ( = ?auto_2392451 ?auto_2392452 ) ) ( not ( = ?auto_2392451 ?auto_2392454 ) ) ( not ( = ?auto_2392451 ?auto_2392457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392453 ?auto_2392452 ?auto_2392454 )
      ( MAKE-5CRATE-VERIFY ?auto_2392449 ?auto_2392450 ?auto_2392451 ?auto_2392453 ?auto_2392452 ?auto_2392454 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2392500 - SURFACE
      ?auto_2392501 - SURFACE
      ?auto_2392502 - SURFACE
      ?auto_2392504 - SURFACE
      ?auto_2392503 - SURFACE
      ?auto_2392505 - SURFACE
    )
    :vars
    (
      ?auto_2392511 - HOIST
      ?auto_2392510 - PLACE
      ?auto_2392508 - PLACE
      ?auto_2392507 - HOIST
      ?auto_2392506 - SURFACE
      ?auto_2392509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392511 ?auto_2392510 ) ( IS-CRATE ?auto_2392505 ) ( not ( = ?auto_2392503 ?auto_2392505 ) ) ( not ( = ?auto_2392504 ?auto_2392503 ) ) ( not ( = ?auto_2392504 ?auto_2392505 ) ) ( not ( = ?auto_2392508 ?auto_2392510 ) ) ( HOIST-AT ?auto_2392507 ?auto_2392508 ) ( not ( = ?auto_2392511 ?auto_2392507 ) ) ( AVAILABLE ?auto_2392507 ) ( SURFACE-AT ?auto_2392505 ?auto_2392508 ) ( ON ?auto_2392505 ?auto_2392506 ) ( CLEAR ?auto_2392505 ) ( not ( = ?auto_2392503 ?auto_2392506 ) ) ( not ( = ?auto_2392505 ?auto_2392506 ) ) ( not ( = ?auto_2392504 ?auto_2392506 ) ) ( TRUCK-AT ?auto_2392509 ?auto_2392510 ) ( SURFACE-AT ?auto_2392504 ?auto_2392510 ) ( CLEAR ?auto_2392504 ) ( IS-CRATE ?auto_2392503 ) ( AVAILABLE ?auto_2392511 ) ( IN ?auto_2392503 ?auto_2392509 ) ( ON ?auto_2392501 ?auto_2392500 ) ( ON ?auto_2392502 ?auto_2392501 ) ( ON ?auto_2392504 ?auto_2392502 ) ( not ( = ?auto_2392500 ?auto_2392501 ) ) ( not ( = ?auto_2392500 ?auto_2392502 ) ) ( not ( = ?auto_2392500 ?auto_2392504 ) ) ( not ( = ?auto_2392500 ?auto_2392503 ) ) ( not ( = ?auto_2392500 ?auto_2392505 ) ) ( not ( = ?auto_2392500 ?auto_2392506 ) ) ( not ( = ?auto_2392501 ?auto_2392502 ) ) ( not ( = ?auto_2392501 ?auto_2392504 ) ) ( not ( = ?auto_2392501 ?auto_2392503 ) ) ( not ( = ?auto_2392501 ?auto_2392505 ) ) ( not ( = ?auto_2392501 ?auto_2392506 ) ) ( not ( = ?auto_2392502 ?auto_2392504 ) ) ( not ( = ?auto_2392502 ?auto_2392503 ) ) ( not ( = ?auto_2392502 ?auto_2392505 ) ) ( not ( = ?auto_2392502 ?auto_2392506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2392504 ?auto_2392503 ?auto_2392505 )
      ( MAKE-5CRATE-VERIFY ?auto_2392500 ?auto_2392501 ?auto_2392502 ?auto_2392504 ?auto_2392503 ?auto_2392505 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2392868 - SURFACE
      ?auto_2392869 - SURFACE
    )
    :vars
    (
      ?auto_2392873 - HOIST
      ?auto_2392875 - PLACE
      ?auto_2392871 - SURFACE
      ?auto_2392876 - TRUCK
      ?auto_2392872 - PLACE
      ?auto_2392874 - HOIST
      ?auto_2392870 - SURFACE
      ?auto_2392877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392873 ?auto_2392875 ) ( SURFACE-AT ?auto_2392868 ?auto_2392875 ) ( CLEAR ?auto_2392868 ) ( IS-CRATE ?auto_2392869 ) ( not ( = ?auto_2392868 ?auto_2392869 ) ) ( AVAILABLE ?auto_2392873 ) ( ON ?auto_2392868 ?auto_2392871 ) ( not ( = ?auto_2392871 ?auto_2392868 ) ) ( not ( = ?auto_2392871 ?auto_2392869 ) ) ( TRUCK-AT ?auto_2392876 ?auto_2392872 ) ( not ( = ?auto_2392872 ?auto_2392875 ) ) ( HOIST-AT ?auto_2392874 ?auto_2392872 ) ( not ( = ?auto_2392873 ?auto_2392874 ) ) ( SURFACE-AT ?auto_2392869 ?auto_2392872 ) ( ON ?auto_2392869 ?auto_2392870 ) ( CLEAR ?auto_2392869 ) ( not ( = ?auto_2392868 ?auto_2392870 ) ) ( not ( = ?auto_2392869 ?auto_2392870 ) ) ( not ( = ?auto_2392871 ?auto_2392870 ) ) ( LIFTING ?auto_2392874 ?auto_2392877 ) ( IS-CRATE ?auto_2392877 ) ( not ( = ?auto_2392868 ?auto_2392877 ) ) ( not ( = ?auto_2392869 ?auto_2392877 ) ) ( not ( = ?auto_2392871 ?auto_2392877 ) ) ( not ( = ?auto_2392870 ?auto_2392877 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2392874 ?auto_2392877 ?auto_2392876 ?auto_2392872 )
      ( MAKE-1CRATE ?auto_2392868 ?auto_2392869 )
      ( MAKE-1CRATE-VERIFY ?auto_2392868 ?auto_2392869 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2393705 - SURFACE
      ?auto_2393706 - SURFACE
      ?auto_2393707 - SURFACE
      ?auto_2393709 - SURFACE
      ?auto_2393708 - SURFACE
      ?auto_2393710 - SURFACE
      ?auto_2393711 - SURFACE
    )
    :vars
    (
      ?auto_2393713 - HOIST
      ?auto_2393712 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393713 ?auto_2393712 ) ( SURFACE-AT ?auto_2393710 ?auto_2393712 ) ( CLEAR ?auto_2393710 ) ( LIFTING ?auto_2393713 ?auto_2393711 ) ( IS-CRATE ?auto_2393711 ) ( not ( = ?auto_2393710 ?auto_2393711 ) ) ( ON ?auto_2393706 ?auto_2393705 ) ( ON ?auto_2393707 ?auto_2393706 ) ( ON ?auto_2393709 ?auto_2393707 ) ( ON ?auto_2393708 ?auto_2393709 ) ( ON ?auto_2393710 ?auto_2393708 ) ( not ( = ?auto_2393705 ?auto_2393706 ) ) ( not ( = ?auto_2393705 ?auto_2393707 ) ) ( not ( = ?auto_2393705 ?auto_2393709 ) ) ( not ( = ?auto_2393705 ?auto_2393708 ) ) ( not ( = ?auto_2393705 ?auto_2393710 ) ) ( not ( = ?auto_2393705 ?auto_2393711 ) ) ( not ( = ?auto_2393706 ?auto_2393707 ) ) ( not ( = ?auto_2393706 ?auto_2393709 ) ) ( not ( = ?auto_2393706 ?auto_2393708 ) ) ( not ( = ?auto_2393706 ?auto_2393710 ) ) ( not ( = ?auto_2393706 ?auto_2393711 ) ) ( not ( = ?auto_2393707 ?auto_2393709 ) ) ( not ( = ?auto_2393707 ?auto_2393708 ) ) ( not ( = ?auto_2393707 ?auto_2393710 ) ) ( not ( = ?auto_2393707 ?auto_2393711 ) ) ( not ( = ?auto_2393709 ?auto_2393708 ) ) ( not ( = ?auto_2393709 ?auto_2393710 ) ) ( not ( = ?auto_2393709 ?auto_2393711 ) ) ( not ( = ?auto_2393708 ?auto_2393710 ) ) ( not ( = ?auto_2393708 ?auto_2393711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2393710 ?auto_2393711 )
      ( MAKE-6CRATE-VERIFY ?auto_2393705 ?auto_2393706 ?auto_2393707 ?auto_2393709 ?auto_2393708 ?auto_2393710 ?auto_2393711 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2393749 - SURFACE
      ?auto_2393750 - SURFACE
      ?auto_2393751 - SURFACE
      ?auto_2393753 - SURFACE
      ?auto_2393752 - SURFACE
      ?auto_2393754 - SURFACE
      ?auto_2393755 - SURFACE
    )
    :vars
    (
      ?auto_2393756 - HOIST
      ?auto_2393757 - PLACE
      ?auto_2393758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393756 ?auto_2393757 ) ( SURFACE-AT ?auto_2393754 ?auto_2393757 ) ( CLEAR ?auto_2393754 ) ( IS-CRATE ?auto_2393755 ) ( not ( = ?auto_2393754 ?auto_2393755 ) ) ( TRUCK-AT ?auto_2393758 ?auto_2393757 ) ( AVAILABLE ?auto_2393756 ) ( IN ?auto_2393755 ?auto_2393758 ) ( ON ?auto_2393754 ?auto_2393752 ) ( not ( = ?auto_2393752 ?auto_2393754 ) ) ( not ( = ?auto_2393752 ?auto_2393755 ) ) ( ON ?auto_2393750 ?auto_2393749 ) ( ON ?auto_2393751 ?auto_2393750 ) ( ON ?auto_2393753 ?auto_2393751 ) ( ON ?auto_2393752 ?auto_2393753 ) ( not ( = ?auto_2393749 ?auto_2393750 ) ) ( not ( = ?auto_2393749 ?auto_2393751 ) ) ( not ( = ?auto_2393749 ?auto_2393753 ) ) ( not ( = ?auto_2393749 ?auto_2393752 ) ) ( not ( = ?auto_2393749 ?auto_2393754 ) ) ( not ( = ?auto_2393749 ?auto_2393755 ) ) ( not ( = ?auto_2393750 ?auto_2393751 ) ) ( not ( = ?auto_2393750 ?auto_2393753 ) ) ( not ( = ?auto_2393750 ?auto_2393752 ) ) ( not ( = ?auto_2393750 ?auto_2393754 ) ) ( not ( = ?auto_2393750 ?auto_2393755 ) ) ( not ( = ?auto_2393751 ?auto_2393753 ) ) ( not ( = ?auto_2393751 ?auto_2393752 ) ) ( not ( = ?auto_2393751 ?auto_2393754 ) ) ( not ( = ?auto_2393751 ?auto_2393755 ) ) ( not ( = ?auto_2393753 ?auto_2393752 ) ) ( not ( = ?auto_2393753 ?auto_2393754 ) ) ( not ( = ?auto_2393753 ?auto_2393755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393752 ?auto_2393754 ?auto_2393755 )
      ( MAKE-6CRATE-VERIFY ?auto_2393749 ?auto_2393750 ?auto_2393751 ?auto_2393753 ?auto_2393752 ?auto_2393754 ?auto_2393755 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2393800 - SURFACE
      ?auto_2393801 - SURFACE
      ?auto_2393802 - SURFACE
      ?auto_2393804 - SURFACE
      ?auto_2393803 - SURFACE
      ?auto_2393805 - SURFACE
      ?auto_2393806 - SURFACE
    )
    :vars
    (
      ?auto_2393808 - HOIST
      ?auto_2393809 - PLACE
      ?auto_2393807 - TRUCK
      ?auto_2393810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393808 ?auto_2393809 ) ( SURFACE-AT ?auto_2393805 ?auto_2393809 ) ( CLEAR ?auto_2393805 ) ( IS-CRATE ?auto_2393806 ) ( not ( = ?auto_2393805 ?auto_2393806 ) ) ( AVAILABLE ?auto_2393808 ) ( IN ?auto_2393806 ?auto_2393807 ) ( ON ?auto_2393805 ?auto_2393803 ) ( not ( = ?auto_2393803 ?auto_2393805 ) ) ( not ( = ?auto_2393803 ?auto_2393806 ) ) ( TRUCK-AT ?auto_2393807 ?auto_2393810 ) ( not ( = ?auto_2393810 ?auto_2393809 ) ) ( ON ?auto_2393801 ?auto_2393800 ) ( ON ?auto_2393802 ?auto_2393801 ) ( ON ?auto_2393804 ?auto_2393802 ) ( ON ?auto_2393803 ?auto_2393804 ) ( not ( = ?auto_2393800 ?auto_2393801 ) ) ( not ( = ?auto_2393800 ?auto_2393802 ) ) ( not ( = ?auto_2393800 ?auto_2393804 ) ) ( not ( = ?auto_2393800 ?auto_2393803 ) ) ( not ( = ?auto_2393800 ?auto_2393805 ) ) ( not ( = ?auto_2393800 ?auto_2393806 ) ) ( not ( = ?auto_2393801 ?auto_2393802 ) ) ( not ( = ?auto_2393801 ?auto_2393804 ) ) ( not ( = ?auto_2393801 ?auto_2393803 ) ) ( not ( = ?auto_2393801 ?auto_2393805 ) ) ( not ( = ?auto_2393801 ?auto_2393806 ) ) ( not ( = ?auto_2393802 ?auto_2393804 ) ) ( not ( = ?auto_2393802 ?auto_2393803 ) ) ( not ( = ?auto_2393802 ?auto_2393805 ) ) ( not ( = ?auto_2393802 ?auto_2393806 ) ) ( not ( = ?auto_2393804 ?auto_2393803 ) ) ( not ( = ?auto_2393804 ?auto_2393805 ) ) ( not ( = ?auto_2393804 ?auto_2393806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393803 ?auto_2393805 ?auto_2393806 )
      ( MAKE-6CRATE-VERIFY ?auto_2393800 ?auto_2393801 ?auto_2393802 ?auto_2393804 ?auto_2393803 ?auto_2393805 ?auto_2393806 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2393857 - SURFACE
      ?auto_2393858 - SURFACE
      ?auto_2393859 - SURFACE
      ?auto_2393861 - SURFACE
      ?auto_2393860 - SURFACE
      ?auto_2393862 - SURFACE
      ?auto_2393863 - SURFACE
    )
    :vars
    (
      ?auto_2393865 - HOIST
      ?auto_2393866 - PLACE
      ?auto_2393867 - TRUCK
      ?auto_2393868 - PLACE
      ?auto_2393864 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393865 ?auto_2393866 ) ( SURFACE-AT ?auto_2393862 ?auto_2393866 ) ( CLEAR ?auto_2393862 ) ( IS-CRATE ?auto_2393863 ) ( not ( = ?auto_2393862 ?auto_2393863 ) ) ( AVAILABLE ?auto_2393865 ) ( ON ?auto_2393862 ?auto_2393860 ) ( not ( = ?auto_2393860 ?auto_2393862 ) ) ( not ( = ?auto_2393860 ?auto_2393863 ) ) ( TRUCK-AT ?auto_2393867 ?auto_2393868 ) ( not ( = ?auto_2393868 ?auto_2393866 ) ) ( HOIST-AT ?auto_2393864 ?auto_2393868 ) ( LIFTING ?auto_2393864 ?auto_2393863 ) ( not ( = ?auto_2393865 ?auto_2393864 ) ) ( ON ?auto_2393858 ?auto_2393857 ) ( ON ?auto_2393859 ?auto_2393858 ) ( ON ?auto_2393861 ?auto_2393859 ) ( ON ?auto_2393860 ?auto_2393861 ) ( not ( = ?auto_2393857 ?auto_2393858 ) ) ( not ( = ?auto_2393857 ?auto_2393859 ) ) ( not ( = ?auto_2393857 ?auto_2393861 ) ) ( not ( = ?auto_2393857 ?auto_2393860 ) ) ( not ( = ?auto_2393857 ?auto_2393862 ) ) ( not ( = ?auto_2393857 ?auto_2393863 ) ) ( not ( = ?auto_2393858 ?auto_2393859 ) ) ( not ( = ?auto_2393858 ?auto_2393861 ) ) ( not ( = ?auto_2393858 ?auto_2393860 ) ) ( not ( = ?auto_2393858 ?auto_2393862 ) ) ( not ( = ?auto_2393858 ?auto_2393863 ) ) ( not ( = ?auto_2393859 ?auto_2393861 ) ) ( not ( = ?auto_2393859 ?auto_2393860 ) ) ( not ( = ?auto_2393859 ?auto_2393862 ) ) ( not ( = ?auto_2393859 ?auto_2393863 ) ) ( not ( = ?auto_2393861 ?auto_2393860 ) ) ( not ( = ?auto_2393861 ?auto_2393862 ) ) ( not ( = ?auto_2393861 ?auto_2393863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393860 ?auto_2393862 ?auto_2393863 )
      ( MAKE-6CRATE-VERIFY ?auto_2393857 ?auto_2393858 ?auto_2393859 ?auto_2393861 ?auto_2393860 ?auto_2393862 ?auto_2393863 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2393920 - SURFACE
      ?auto_2393921 - SURFACE
      ?auto_2393922 - SURFACE
      ?auto_2393924 - SURFACE
      ?auto_2393923 - SURFACE
      ?auto_2393925 - SURFACE
      ?auto_2393926 - SURFACE
    )
    :vars
    (
      ?auto_2393931 - HOIST
      ?auto_2393929 - PLACE
      ?auto_2393928 - TRUCK
      ?auto_2393930 - PLACE
      ?auto_2393927 - HOIST
      ?auto_2393932 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393931 ?auto_2393929 ) ( SURFACE-AT ?auto_2393925 ?auto_2393929 ) ( CLEAR ?auto_2393925 ) ( IS-CRATE ?auto_2393926 ) ( not ( = ?auto_2393925 ?auto_2393926 ) ) ( AVAILABLE ?auto_2393931 ) ( ON ?auto_2393925 ?auto_2393923 ) ( not ( = ?auto_2393923 ?auto_2393925 ) ) ( not ( = ?auto_2393923 ?auto_2393926 ) ) ( TRUCK-AT ?auto_2393928 ?auto_2393930 ) ( not ( = ?auto_2393930 ?auto_2393929 ) ) ( HOIST-AT ?auto_2393927 ?auto_2393930 ) ( not ( = ?auto_2393931 ?auto_2393927 ) ) ( AVAILABLE ?auto_2393927 ) ( SURFACE-AT ?auto_2393926 ?auto_2393930 ) ( ON ?auto_2393926 ?auto_2393932 ) ( CLEAR ?auto_2393926 ) ( not ( = ?auto_2393925 ?auto_2393932 ) ) ( not ( = ?auto_2393926 ?auto_2393932 ) ) ( not ( = ?auto_2393923 ?auto_2393932 ) ) ( ON ?auto_2393921 ?auto_2393920 ) ( ON ?auto_2393922 ?auto_2393921 ) ( ON ?auto_2393924 ?auto_2393922 ) ( ON ?auto_2393923 ?auto_2393924 ) ( not ( = ?auto_2393920 ?auto_2393921 ) ) ( not ( = ?auto_2393920 ?auto_2393922 ) ) ( not ( = ?auto_2393920 ?auto_2393924 ) ) ( not ( = ?auto_2393920 ?auto_2393923 ) ) ( not ( = ?auto_2393920 ?auto_2393925 ) ) ( not ( = ?auto_2393920 ?auto_2393926 ) ) ( not ( = ?auto_2393920 ?auto_2393932 ) ) ( not ( = ?auto_2393921 ?auto_2393922 ) ) ( not ( = ?auto_2393921 ?auto_2393924 ) ) ( not ( = ?auto_2393921 ?auto_2393923 ) ) ( not ( = ?auto_2393921 ?auto_2393925 ) ) ( not ( = ?auto_2393921 ?auto_2393926 ) ) ( not ( = ?auto_2393921 ?auto_2393932 ) ) ( not ( = ?auto_2393922 ?auto_2393924 ) ) ( not ( = ?auto_2393922 ?auto_2393923 ) ) ( not ( = ?auto_2393922 ?auto_2393925 ) ) ( not ( = ?auto_2393922 ?auto_2393926 ) ) ( not ( = ?auto_2393922 ?auto_2393932 ) ) ( not ( = ?auto_2393924 ?auto_2393923 ) ) ( not ( = ?auto_2393924 ?auto_2393925 ) ) ( not ( = ?auto_2393924 ?auto_2393926 ) ) ( not ( = ?auto_2393924 ?auto_2393932 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393923 ?auto_2393925 ?auto_2393926 )
      ( MAKE-6CRATE-VERIFY ?auto_2393920 ?auto_2393921 ?auto_2393922 ?auto_2393924 ?auto_2393923 ?auto_2393925 ?auto_2393926 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2393984 - SURFACE
      ?auto_2393985 - SURFACE
      ?auto_2393986 - SURFACE
      ?auto_2393988 - SURFACE
      ?auto_2393987 - SURFACE
      ?auto_2393989 - SURFACE
      ?auto_2393990 - SURFACE
    )
    :vars
    (
      ?auto_2393994 - HOIST
      ?auto_2393992 - PLACE
      ?auto_2393991 - PLACE
      ?auto_2393993 - HOIST
      ?auto_2393996 - SURFACE
      ?auto_2393995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2393994 ?auto_2393992 ) ( SURFACE-AT ?auto_2393989 ?auto_2393992 ) ( CLEAR ?auto_2393989 ) ( IS-CRATE ?auto_2393990 ) ( not ( = ?auto_2393989 ?auto_2393990 ) ) ( AVAILABLE ?auto_2393994 ) ( ON ?auto_2393989 ?auto_2393987 ) ( not ( = ?auto_2393987 ?auto_2393989 ) ) ( not ( = ?auto_2393987 ?auto_2393990 ) ) ( not ( = ?auto_2393991 ?auto_2393992 ) ) ( HOIST-AT ?auto_2393993 ?auto_2393991 ) ( not ( = ?auto_2393994 ?auto_2393993 ) ) ( AVAILABLE ?auto_2393993 ) ( SURFACE-AT ?auto_2393990 ?auto_2393991 ) ( ON ?auto_2393990 ?auto_2393996 ) ( CLEAR ?auto_2393990 ) ( not ( = ?auto_2393989 ?auto_2393996 ) ) ( not ( = ?auto_2393990 ?auto_2393996 ) ) ( not ( = ?auto_2393987 ?auto_2393996 ) ) ( TRUCK-AT ?auto_2393995 ?auto_2393992 ) ( ON ?auto_2393985 ?auto_2393984 ) ( ON ?auto_2393986 ?auto_2393985 ) ( ON ?auto_2393988 ?auto_2393986 ) ( ON ?auto_2393987 ?auto_2393988 ) ( not ( = ?auto_2393984 ?auto_2393985 ) ) ( not ( = ?auto_2393984 ?auto_2393986 ) ) ( not ( = ?auto_2393984 ?auto_2393988 ) ) ( not ( = ?auto_2393984 ?auto_2393987 ) ) ( not ( = ?auto_2393984 ?auto_2393989 ) ) ( not ( = ?auto_2393984 ?auto_2393990 ) ) ( not ( = ?auto_2393984 ?auto_2393996 ) ) ( not ( = ?auto_2393985 ?auto_2393986 ) ) ( not ( = ?auto_2393985 ?auto_2393988 ) ) ( not ( = ?auto_2393985 ?auto_2393987 ) ) ( not ( = ?auto_2393985 ?auto_2393989 ) ) ( not ( = ?auto_2393985 ?auto_2393990 ) ) ( not ( = ?auto_2393985 ?auto_2393996 ) ) ( not ( = ?auto_2393986 ?auto_2393988 ) ) ( not ( = ?auto_2393986 ?auto_2393987 ) ) ( not ( = ?auto_2393986 ?auto_2393989 ) ) ( not ( = ?auto_2393986 ?auto_2393990 ) ) ( not ( = ?auto_2393986 ?auto_2393996 ) ) ( not ( = ?auto_2393988 ?auto_2393987 ) ) ( not ( = ?auto_2393988 ?auto_2393989 ) ) ( not ( = ?auto_2393988 ?auto_2393990 ) ) ( not ( = ?auto_2393988 ?auto_2393996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2393987 ?auto_2393989 ?auto_2393990 )
      ( MAKE-6CRATE-VERIFY ?auto_2393984 ?auto_2393985 ?auto_2393986 ?auto_2393988 ?auto_2393987 ?auto_2393989 ?auto_2393990 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2394048 - SURFACE
      ?auto_2394049 - SURFACE
      ?auto_2394050 - SURFACE
      ?auto_2394052 - SURFACE
      ?auto_2394051 - SURFACE
      ?auto_2394053 - SURFACE
      ?auto_2394054 - SURFACE
    )
    :vars
    (
      ?auto_2394060 - HOIST
      ?auto_2394057 - PLACE
      ?auto_2394055 - PLACE
      ?auto_2394059 - HOIST
      ?auto_2394056 - SURFACE
      ?auto_2394058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394060 ?auto_2394057 ) ( IS-CRATE ?auto_2394054 ) ( not ( = ?auto_2394053 ?auto_2394054 ) ) ( not ( = ?auto_2394051 ?auto_2394053 ) ) ( not ( = ?auto_2394051 ?auto_2394054 ) ) ( not ( = ?auto_2394055 ?auto_2394057 ) ) ( HOIST-AT ?auto_2394059 ?auto_2394055 ) ( not ( = ?auto_2394060 ?auto_2394059 ) ) ( AVAILABLE ?auto_2394059 ) ( SURFACE-AT ?auto_2394054 ?auto_2394055 ) ( ON ?auto_2394054 ?auto_2394056 ) ( CLEAR ?auto_2394054 ) ( not ( = ?auto_2394053 ?auto_2394056 ) ) ( not ( = ?auto_2394054 ?auto_2394056 ) ) ( not ( = ?auto_2394051 ?auto_2394056 ) ) ( TRUCK-AT ?auto_2394058 ?auto_2394057 ) ( SURFACE-AT ?auto_2394051 ?auto_2394057 ) ( CLEAR ?auto_2394051 ) ( LIFTING ?auto_2394060 ?auto_2394053 ) ( IS-CRATE ?auto_2394053 ) ( ON ?auto_2394049 ?auto_2394048 ) ( ON ?auto_2394050 ?auto_2394049 ) ( ON ?auto_2394052 ?auto_2394050 ) ( ON ?auto_2394051 ?auto_2394052 ) ( not ( = ?auto_2394048 ?auto_2394049 ) ) ( not ( = ?auto_2394048 ?auto_2394050 ) ) ( not ( = ?auto_2394048 ?auto_2394052 ) ) ( not ( = ?auto_2394048 ?auto_2394051 ) ) ( not ( = ?auto_2394048 ?auto_2394053 ) ) ( not ( = ?auto_2394048 ?auto_2394054 ) ) ( not ( = ?auto_2394048 ?auto_2394056 ) ) ( not ( = ?auto_2394049 ?auto_2394050 ) ) ( not ( = ?auto_2394049 ?auto_2394052 ) ) ( not ( = ?auto_2394049 ?auto_2394051 ) ) ( not ( = ?auto_2394049 ?auto_2394053 ) ) ( not ( = ?auto_2394049 ?auto_2394054 ) ) ( not ( = ?auto_2394049 ?auto_2394056 ) ) ( not ( = ?auto_2394050 ?auto_2394052 ) ) ( not ( = ?auto_2394050 ?auto_2394051 ) ) ( not ( = ?auto_2394050 ?auto_2394053 ) ) ( not ( = ?auto_2394050 ?auto_2394054 ) ) ( not ( = ?auto_2394050 ?auto_2394056 ) ) ( not ( = ?auto_2394052 ?auto_2394051 ) ) ( not ( = ?auto_2394052 ?auto_2394053 ) ) ( not ( = ?auto_2394052 ?auto_2394054 ) ) ( not ( = ?auto_2394052 ?auto_2394056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394051 ?auto_2394053 ?auto_2394054 )
      ( MAKE-6CRATE-VERIFY ?auto_2394048 ?auto_2394049 ?auto_2394050 ?auto_2394052 ?auto_2394051 ?auto_2394053 ?auto_2394054 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2394112 - SURFACE
      ?auto_2394113 - SURFACE
      ?auto_2394114 - SURFACE
      ?auto_2394116 - SURFACE
      ?auto_2394115 - SURFACE
      ?auto_2394117 - SURFACE
      ?auto_2394118 - SURFACE
    )
    :vars
    (
      ?auto_2394123 - HOIST
      ?auto_2394122 - PLACE
      ?auto_2394121 - PLACE
      ?auto_2394124 - HOIST
      ?auto_2394120 - SURFACE
      ?auto_2394119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394123 ?auto_2394122 ) ( IS-CRATE ?auto_2394118 ) ( not ( = ?auto_2394117 ?auto_2394118 ) ) ( not ( = ?auto_2394115 ?auto_2394117 ) ) ( not ( = ?auto_2394115 ?auto_2394118 ) ) ( not ( = ?auto_2394121 ?auto_2394122 ) ) ( HOIST-AT ?auto_2394124 ?auto_2394121 ) ( not ( = ?auto_2394123 ?auto_2394124 ) ) ( AVAILABLE ?auto_2394124 ) ( SURFACE-AT ?auto_2394118 ?auto_2394121 ) ( ON ?auto_2394118 ?auto_2394120 ) ( CLEAR ?auto_2394118 ) ( not ( = ?auto_2394117 ?auto_2394120 ) ) ( not ( = ?auto_2394118 ?auto_2394120 ) ) ( not ( = ?auto_2394115 ?auto_2394120 ) ) ( TRUCK-AT ?auto_2394119 ?auto_2394122 ) ( SURFACE-AT ?auto_2394115 ?auto_2394122 ) ( CLEAR ?auto_2394115 ) ( IS-CRATE ?auto_2394117 ) ( AVAILABLE ?auto_2394123 ) ( IN ?auto_2394117 ?auto_2394119 ) ( ON ?auto_2394113 ?auto_2394112 ) ( ON ?auto_2394114 ?auto_2394113 ) ( ON ?auto_2394116 ?auto_2394114 ) ( ON ?auto_2394115 ?auto_2394116 ) ( not ( = ?auto_2394112 ?auto_2394113 ) ) ( not ( = ?auto_2394112 ?auto_2394114 ) ) ( not ( = ?auto_2394112 ?auto_2394116 ) ) ( not ( = ?auto_2394112 ?auto_2394115 ) ) ( not ( = ?auto_2394112 ?auto_2394117 ) ) ( not ( = ?auto_2394112 ?auto_2394118 ) ) ( not ( = ?auto_2394112 ?auto_2394120 ) ) ( not ( = ?auto_2394113 ?auto_2394114 ) ) ( not ( = ?auto_2394113 ?auto_2394116 ) ) ( not ( = ?auto_2394113 ?auto_2394115 ) ) ( not ( = ?auto_2394113 ?auto_2394117 ) ) ( not ( = ?auto_2394113 ?auto_2394118 ) ) ( not ( = ?auto_2394113 ?auto_2394120 ) ) ( not ( = ?auto_2394114 ?auto_2394116 ) ) ( not ( = ?auto_2394114 ?auto_2394115 ) ) ( not ( = ?auto_2394114 ?auto_2394117 ) ) ( not ( = ?auto_2394114 ?auto_2394118 ) ) ( not ( = ?auto_2394114 ?auto_2394120 ) ) ( not ( = ?auto_2394116 ?auto_2394115 ) ) ( not ( = ?auto_2394116 ?auto_2394117 ) ) ( not ( = ?auto_2394116 ?auto_2394118 ) ) ( not ( = ?auto_2394116 ?auto_2394120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2394115 ?auto_2394117 ?auto_2394118 )
      ( MAKE-6CRATE-VERIFY ?auto_2394112 ?auto_2394113 ?auto_2394114 ?auto_2394116 ?auto_2394115 ?auto_2394117 ?auto_2394118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2394984 - SURFACE
      ?auto_2394985 - SURFACE
    )
    :vars
    (
      ?auto_2394986 - HOIST
      ?auto_2394988 - PLACE
      ?auto_2394987 - SURFACE
      ?auto_2394992 - PLACE
      ?auto_2394990 - HOIST
      ?auto_2394991 - SURFACE
      ?auto_2394989 - TRUCK
      ?auto_2394993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394986 ?auto_2394988 ) ( SURFACE-AT ?auto_2394984 ?auto_2394988 ) ( CLEAR ?auto_2394984 ) ( IS-CRATE ?auto_2394985 ) ( not ( = ?auto_2394984 ?auto_2394985 ) ) ( ON ?auto_2394984 ?auto_2394987 ) ( not ( = ?auto_2394987 ?auto_2394984 ) ) ( not ( = ?auto_2394987 ?auto_2394985 ) ) ( not ( = ?auto_2394992 ?auto_2394988 ) ) ( HOIST-AT ?auto_2394990 ?auto_2394992 ) ( not ( = ?auto_2394986 ?auto_2394990 ) ) ( AVAILABLE ?auto_2394990 ) ( SURFACE-AT ?auto_2394985 ?auto_2394992 ) ( ON ?auto_2394985 ?auto_2394991 ) ( CLEAR ?auto_2394985 ) ( not ( = ?auto_2394984 ?auto_2394991 ) ) ( not ( = ?auto_2394985 ?auto_2394991 ) ) ( not ( = ?auto_2394987 ?auto_2394991 ) ) ( TRUCK-AT ?auto_2394989 ?auto_2394988 ) ( LIFTING ?auto_2394986 ?auto_2394993 ) ( IS-CRATE ?auto_2394993 ) ( not ( = ?auto_2394984 ?auto_2394993 ) ) ( not ( = ?auto_2394985 ?auto_2394993 ) ) ( not ( = ?auto_2394987 ?auto_2394993 ) ) ( not ( = ?auto_2394991 ?auto_2394993 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2394986 ?auto_2394993 ?auto_2394989 ?auto_2394988 )
      ( MAKE-1CRATE ?auto_2394984 ?auto_2394985 )
      ( MAKE-1CRATE-VERIFY ?auto_2394984 ?auto_2394985 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396062 - SURFACE
      ?auto_2396063 - SURFACE
      ?auto_2396064 - SURFACE
      ?auto_2396066 - SURFACE
      ?auto_2396065 - SURFACE
      ?auto_2396067 - SURFACE
      ?auto_2396068 - SURFACE
      ?auto_2396069 - SURFACE
    )
    :vars
    (
      ?auto_2396070 - HOIST
      ?auto_2396071 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396070 ?auto_2396071 ) ( SURFACE-AT ?auto_2396068 ?auto_2396071 ) ( CLEAR ?auto_2396068 ) ( LIFTING ?auto_2396070 ?auto_2396069 ) ( IS-CRATE ?auto_2396069 ) ( not ( = ?auto_2396068 ?auto_2396069 ) ) ( ON ?auto_2396063 ?auto_2396062 ) ( ON ?auto_2396064 ?auto_2396063 ) ( ON ?auto_2396066 ?auto_2396064 ) ( ON ?auto_2396065 ?auto_2396066 ) ( ON ?auto_2396067 ?auto_2396065 ) ( ON ?auto_2396068 ?auto_2396067 ) ( not ( = ?auto_2396062 ?auto_2396063 ) ) ( not ( = ?auto_2396062 ?auto_2396064 ) ) ( not ( = ?auto_2396062 ?auto_2396066 ) ) ( not ( = ?auto_2396062 ?auto_2396065 ) ) ( not ( = ?auto_2396062 ?auto_2396067 ) ) ( not ( = ?auto_2396062 ?auto_2396068 ) ) ( not ( = ?auto_2396062 ?auto_2396069 ) ) ( not ( = ?auto_2396063 ?auto_2396064 ) ) ( not ( = ?auto_2396063 ?auto_2396066 ) ) ( not ( = ?auto_2396063 ?auto_2396065 ) ) ( not ( = ?auto_2396063 ?auto_2396067 ) ) ( not ( = ?auto_2396063 ?auto_2396068 ) ) ( not ( = ?auto_2396063 ?auto_2396069 ) ) ( not ( = ?auto_2396064 ?auto_2396066 ) ) ( not ( = ?auto_2396064 ?auto_2396065 ) ) ( not ( = ?auto_2396064 ?auto_2396067 ) ) ( not ( = ?auto_2396064 ?auto_2396068 ) ) ( not ( = ?auto_2396064 ?auto_2396069 ) ) ( not ( = ?auto_2396066 ?auto_2396065 ) ) ( not ( = ?auto_2396066 ?auto_2396067 ) ) ( not ( = ?auto_2396066 ?auto_2396068 ) ) ( not ( = ?auto_2396066 ?auto_2396069 ) ) ( not ( = ?auto_2396065 ?auto_2396067 ) ) ( not ( = ?auto_2396065 ?auto_2396068 ) ) ( not ( = ?auto_2396065 ?auto_2396069 ) ) ( not ( = ?auto_2396067 ?auto_2396068 ) ) ( not ( = ?auto_2396067 ?auto_2396069 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2396068 ?auto_2396069 )
      ( MAKE-7CRATE-VERIFY ?auto_2396062 ?auto_2396063 ?auto_2396064 ?auto_2396066 ?auto_2396065 ?auto_2396067 ?auto_2396068 ?auto_2396069 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396117 - SURFACE
      ?auto_2396118 - SURFACE
      ?auto_2396119 - SURFACE
      ?auto_2396121 - SURFACE
      ?auto_2396120 - SURFACE
      ?auto_2396122 - SURFACE
      ?auto_2396123 - SURFACE
      ?auto_2396124 - SURFACE
    )
    :vars
    (
      ?auto_2396125 - HOIST
      ?auto_2396127 - PLACE
      ?auto_2396126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396125 ?auto_2396127 ) ( SURFACE-AT ?auto_2396123 ?auto_2396127 ) ( CLEAR ?auto_2396123 ) ( IS-CRATE ?auto_2396124 ) ( not ( = ?auto_2396123 ?auto_2396124 ) ) ( TRUCK-AT ?auto_2396126 ?auto_2396127 ) ( AVAILABLE ?auto_2396125 ) ( IN ?auto_2396124 ?auto_2396126 ) ( ON ?auto_2396123 ?auto_2396122 ) ( not ( = ?auto_2396122 ?auto_2396123 ) ) ( not ( = ?auto_2396122 ?auto_2396124 ) ) ( ON ?auto_2396118 ?auto_2396117 ) ( ON ?auto_2396119 ?auto_2396118 ) ( ON ?auto_2396121 ?auto_2396119 ) ( ON ?auto_2396120 ?auto_2396121 ) ( ON ?auto_2396122 ?auto_2396120 ) ( not ( = ?auto_2396117 ?auto_2396118 ) ) ( not ( = ?auto_2396117 ?auto_2396119 ) ) ( not ( = ?auto_2396117 ?auto_2396121 ) ) ( not ( = ?auto_2396117 ?auto_2396120 ) ) ( not ( = ?auto_2396117 ?auto_2396122 ) ) ( not ( = ?auto_2396117 ?auto_2396123 ) ) ( not ( = ?auto_2396117 ?auto_2396124 ) ) ( not ( = ?auto_2396118 ?auto_2396119 ) ) ( not ( = ?auto_2396118 ?auto_2396121 ) ) ( not ( = ?auto_2396118 ?auto_2396120 ) ) ( not ( = ?auto_2396118 ?auto_2396122 ) ) ( not ( = ?auto_2396118 ?auto_2396123 ) ) ( not ( = ?auto_2396118 ?auto_2396124 ) ) ( not ( = ?auto_2396119 ?auto_2396121 ) ) ( not ( = ?auto_2396119 ?auto_2396120 ) ) ( not ( = ?auto_2396119 ?auto_2396122 ) ) ( not ( = ?auto_2396119 ?auto_2396123 ) ) ( not ( = ?auto_2396119 ?auto_2396124 ) ) ( not ( = ?auto_2396121 ?auto_2396120 ) ) ( not ( = ?auto_2396121 ?auto_2396122 ) ) ( not ( = ?auto_2396121 ?auto_2396123 ) ) ( not ( = ?auto_2396121 ?auto_2396124 ) ) ( not ( = ?auto_2396120 ?auto_2396122 ) ) ( not ( = ?auto_2396120 ?auto_2396123 ) ) ( not ( = ?auto_2396120 ?auto_2396124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396122 ?auto_2396123 ?auto_2396124 )
      ( MAKE-7CRATE-VERIFY ?auto_2396117 ?auto_2396118 ?auto_2396119 ?auto_2396121 ?auto_2396120 ?auto_2396122 ?auto_2396123 ?auto_2396124 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396180 - SURFACE
      ?auto_2396181 - SURFACE
      ?auto_2396182 - SURFACE
      ?auto_2396184 - SURFACE
      ?auto_2396183 - SURFACE
      ?auto_2396185 - SURFACE
      ?auto_2396186 - SURFACE
      ?auto_2396187 - SURFACE
    )
    :vars
    (
      ?auto_2396189 - HOIST
      ?auto_2396191 - PLACE
      ?auto_2396190 - TRUCK
      ?auto_2396188 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396189 ?auto_2396191 ) ( SURFACE-AT ?auto_2396186 ?auto_2396191 ) ( CLEAR ?auto_2396186 ) ( IS-CRATE ?auto_2396187 ) ( not ( = ?auto_2396186 ?auto_2396187 ) ) ( AVAILABLE ?auto_2396189 ) ( IN ?auto_2396187 ?auto_2396190 ) ( ON ?auto_2396186 ?auto_2396185 ) ( not ( = ?auto_2396185 ?auto_2396186 ) ) ( not ( = ?auto_2396185 ?auto_2396187 ) ) ( TRUCK-AT ?auto_2396190 ?auto_2396188 ) ( not ( = ?auto_2396188 ?auto_2396191 ) ) ( ON ?auto_2396181 ?auto_2396180 ) ( ON ?auto_2396182 ?auto_2396181 ) ( ON ?auto_2396184 ?auto_2396182 ) ( ON ?auto_2396183 ?auto_2396184 ) ( ON ?auto_2396185 ?auto_2396183 ) ( not ( = ?auto_2396180 ?auto_2396181 ) ) ( not ( = ?auto_2396180 ?auto_2396182 ) ) ( not ( = ?auto_2396180 ?auto_2396184 ) ) ( not ( = ?auto_2396180 ?auto_2396183 ) ) ( not ( = ?auto_2396180 ?auto_2396185 ) ) ( not ( = ?auto_2396180 ?auto_2396186 ) ) ( not ( = ?auto_2396180 ?auto_2396187 ) ) ( not ( = ?auto_2396181 ?auto_2396182 ) ) ( not ( = ?auto_2396181 ?auto_2396184 ) ) ( not ( = ?auto_2396181 ?auto_2396183 ) ) ( not ( = ?auto_2396181 ?auto_2396185 ) ) ( not ( = ?auto_2396181 ?auto_2396186 ) ) ( not ( = ?auto_2396181 ?auto_2396187 ) ) ( not ( = ?auto_2396182 ?auto_2396184 ) ) ( not ( = ?auto_2396182 ?auto_2396183 ) ) ( not ( = ?auto_2396182 ?auto_2396185 ) ) ( not ( = ?auto_2396182 ?auto_2396186 ) ) ( not ( = ?auto_2396182 ?auto_2396187 ) ) ( not ( = ?auto_2396184 ?auto_2396183 ) ) ( not ( = ?auto_2396184 ?auto_2396185 ) ) ( not ( = ?auto_2396184 ?auto_2396186 ) ) ( not ( = ?auto_2396184 ?auto_2396187 ) ) ( not ( = ?auto_2396183 ?auto_2396185 ) ) ( not ( = ?auto_2396183 ?auto_2396186 ) ) ( not ( = ?auto_2396183 ?auto_2396187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396185 ?auto_2396186 ?auto_2396187 )
      ( MAKE-7CRATE-VERIFY ?auto_2396180 ?auto_2396181 ?auto_2396182 ?auto_2396184 ?auto_2396183 ?auto_2396185 ?auto_2396186 ?auto_2396187 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396250 - SURFACE
      ?auto_2396251 - SURFACE
      ?auto_2396252 - SURFACE
      ?auto_2396254 - SURFACE
      ?auto_2396253 - SURFACE
      ?auto_2396255 - SURFACE
      ?auto_2396256 - SURFACE
      ?auto_2396257 - SURFACE
    )
    :vars
    (
      ?auto_2396260 - HOIST
      ?auto_2396261 - PLACE
      ?auto_2396262 - TRUCK
      ?auto_2396258 - PLACE
      ?auto_2396259 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396260 ?auto_2396261 ) ( SURFACE-AT ?auto_2396256 ?auto_2396261 ) ( CLEAR ?auto_2396256 ) ( IS-CRATE ?auto_2396257 ) ( not ( = ?auto_2396256 ?auto_2396257 ) ) ( AVAILABLE ?auto_2396260 ) ( ON ?auto_2396256 ?auto_2396255 ) ( not ( = ?auto_2396255 ?auto_2396256 ) ) ( not ( = ?auto_2396255 ?auto_2396257 ) ) ( TRUCK-AT ?auto_2396262 ?auto_2396258 ) ( not ( = ?auto_2396258 ?auto_2396261 ) ) ( HOIST-AT ?auto_2396259 ?auto_2396258 ) ( LIFTING ?auto_2396259 ?auto_2396257 ) ( not ( = ?auto_2396260 ?auto_2396259 ) ) ( ON ?auto_2396251 ?auto_2396250 ) ( ON ?auto_2396252 ?auto_2396251 ) ( ON ?auto_2396254 ?auto_2396252 ) ( ON ?auto_2396253 ?auto_2396254 ) ( ON ?auto_2396255 ?auto_2396253 ) ( not ( = ?auto_2396250 ?auto_2396251 ) ) ( not ( = ?auto_2396250 ?auto_2396252 ) ) ( not ( = ?auto_2396250 ?auto_2396254 ) ) ( not ( = ?auto_2396250 ?auto_2396253 ) ) ( not ( = ?auto_2396250 ?auto_2396255 ) ) ( not ( = ?auto_2396250 ?auto_2396256 ) ) ( not ( = ?auto_2396250 ?auto_2396257 ) ) ( not ( = ?auto_2396251 ?auto_2396252 ) ) ( not ( = ?auto_2396251 ?auto_2396254 ) ) ( not ( = ?auto_2396251 ?auto_2396253 ) ) ( not ( = ?auto_2396251 ?auto_2396255 ) ) ( not ( = ?auto_2396251 ?auto_2396256 ) ) ( not ( = ?auto_2396251 ?auto_2396257 ) ) ( not ( = ?auto_2396252 ?auto_2396254 ) ) ( not ( = ?auto_2396252 ?auto_2396253 ) ) ( not ( = ?auto_2396252 ?auto_2396255 ) ) ( not ( = ?auto_2396252 ?auto_2396256 ) ) ( not ( = ?auto_2396252 ?auto_2396257 ) ) ( not ( = ?auto_2396254 ?auto_2396253 ) ) ( not ( = ?auto_2396254 ?auto_2396255 ) ) ( not ( = ?auto_2396254 ?auto_2396256 ) ) ( not ( = ?auto_2396254 ?auto_2396257 ) ) ( not ( = ?auto_2396253 ?auto_2396255 ) ) ( not ( = ?auto_2396253 ?auto_2396256 ) ) ( not ( = ?auto_2396253 ?auto_2396257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396255 ?auto_2396256 ?auto_2396257 )
      ( MAKE-7CRATE-VERIFY ?auto_2396250 ?auto_2396251 ?auto_2396252 ?auto_2396254 ?auto_2396253 ?auto_2396255 ?auto_2396256 ?auto_2396257 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396327 - SURFACE
      ?auto_2396328 - SURFACE
      ?auto_2396329 - SURFACE
      ?auto_2396331 - SURFACE
      ?auto_2396330 - SURFACE
      ?auto_2396332 - SURFACE
      ?auto_2396333 - SURFACE
      ?auto_2396334 - SURFACE
    )
    :vars
    (
      ?auto_2396335 - HOIST
      ?auto_2396339 - PLACE
      ?auto_2396338 - TRUCK
      ?auto_2396340 - PLACE
      ?auto_2396337 - HOIST
      ?auto_2396336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396335 ?auto_2396339 ) ( SURFACE-AT ?auto_2396333 ?auto_2396339 ) ( CLEAR ?auto_2396333 ) ( IS-CRATE ?auto_2396334 ) ( not ( = ?auto_2396333 ?auto_2396334 ) ) ( AVAILABLE ?auto_2396335 ) ( ON ?auto_2396333 ?auto_2396332 ) ( not ( = ?auto_2396332 ?auto_2396333 ) ) ( not ( = ?auto_2396332 ?auto_2396334 ) ) ( TRUCK-AT ?auto_2396338 ?auto_2396340 ) ( not ( = ?auto_2396340 ?auto_2396339 ) ) ( HOIST-AT ?auto_2396337 ?auto_2396340 ) ( not ( = ?auto_2396335 ?auto_2396337 ) ) ( AVAILABLE ?auto_2396337 ) ( SURFACE-AT ?auto_2396334 ?auto_2396340 ) ( ON ?auto_2396334 ?auto_2396336 ) ( CLEAR ?auto_2396334 ) ( not ( = ?auto_2396333 ?auto_2396336 ) ) ( not ( = ?auto_2396334 ?auto_2396336 ) ) ( not ( = ?auto_2396332 ?auto_2396336 ) ) ( ON ?auto_2396328 ?auto_2396327 ) ( ON ?auto_2396329 ?auto_2396328 ) ( ON ?auto_2396331 ?auto_2396329 ) ( ON ?auto_2396330 ?auto_2396331 ) ( ON ?auto_2396332 ?auto_2396330 ) ( not ( = ?auto_2396327 ?auto_2396328 ) ) ( not ( = ?auto_2396327 ?auto_2396329 ) ) ( not ( = ?auto_2396327 ?auto_2396331 ) ) ( not ( = ?auto_2396327 ?auto_2396330 ) ) ( not ( = ?auto_2396327 ?auto_2396332 ) ) ( not ( = ?auto_2396327 ?auto_2396333 ) ) ( not ( = ?auto_2396327 ?auto_2396334 ) ) ( not ( = ?auto_2396327 ?auto_2396336 ) ) ( not ( = ?auto_2396328 ?auto_2396329 ) ) ( not ( = ?auto_2396328 ?auto_2396331 ) ) ( not ( = ?auto_2396328 ?auto_2396330 ) ) ( not ( = ?auto_2396328 ?auto_2396332 ) ) ( not ( = ?auto_2396328 ?auto_2396333 ) ) ( not ( = ?auto_2396328 ?auto_2396334 ) ) ( not ( = ?auto_2396328 ?auto_2396336 ) ) ( not ( = ?auto_2396329 ?auto_2396331 ) ) ( not ( = ?auto_2396329 ?auto_2396330 ) ) ( not ( = ?auto_2396329 ?auto_2396332 ) ) ( not ( = ?auto_2396329 ?auto_2396333 ) ) ( not ( = ?auto_2396329 ?auto_2396334 ) ) ( not ( = ?auto_2396329 ?auto_2396336 ) ) ( not ( = ?auto_2396331 ?auto_2396330 ) ) ( not ( = ?auto_2396331 ?auto_2396332 ) ) ( not ( = ?auto_2396331 ?auto_2396333 ) ) ( not ( = ?auto_2396331 ?auto_2396334 ) ) ( not ( = ?auto_2396331 ?auto_2396336 ) ) ( not ( = ?auto_2396330 ?auto_2396332 ) ) ( not ( = ?auto_2396330 ?auto_2396333 ) ) ( not ( = ?auto_2396330 ?auto_2396334 ) ) ( not ( = ?auto_2396330 ?auto_2396336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396332 ?auto_2396333 ?auto_2396334 )
      ( MAKE-7CRATE-VERIFY ?auto_2396327 ?auto_2396328 ?auto_2396329 ?auto_2396331 ?auto_2396330 ?auto_2396332 ?auto_2396333 ?auto_2396334 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396405 - SURFACE
      ?auto_2396406 - SURFACE
      ?auto_2396407 - SURFACE
      ?auto_2396409 - SURFACE
      ?auto_2396408 - SURFACE
      ?auto_2396410 - SURFACE
      ?auto_2396411 - SURFACE
      ?auto_2396412 - SURFACE
    )
    :vars
    (
      ?auto_2396416 - HOIST
      ?auto_2396418 - PLACE
      ?auto_2396414 - PLACE
      ?auto_2396417 - HOIST
      ?auto_2396415 - SURFACE
      ?auto_2396413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396416 ?auto_2396418 ) ( SURFACE-AT ?auto_2396411 ?auto_2396418 ) ( CLEAR ?auto_2396411 ) ( IS-CRATE ?auto_2396412 ) ( not ( = ?auto_2396411 ?auto_2396412 ) ) ( AVAILABLE ?auto_2396416 ) ( ON ?auto_2396411 ?auto_2396410 ) ( not ( = ?auto_2396410 ?auto_2396411 ) ) ( not ( = ?auto_2396410 ?auto_2396412 ) ) ( not ( = ?auto_2396414 ?auto_2396418 ) ) ( HOIST-AT ?auto_2396417 ?auto_2396414 ) ( not ( = ?auto_2396416 ?auto_2396417 ) ) ( AVAILABLE ?auto_2396417 ) ( SURFACE-AT ?auto_2396412 ?auto_2396414 ) ( ON ?auto_2396412 ?auto_2396415 ) ( CLEAR ?auto_2396412 ) ( not ( = ?auto_2396411 ?auto_2396415 ) ) ( not ( = ?auto_2396412 ?auto_2396415 ) ) ( not ( = ?auto_2396410 ?auto_2396415 ) ) ( TRUCK-AT ?auto_2396413 ?auto_2396418 ) ( ON ?auto_2396406 ?auto_2396405 ) ( ON ?auto_2396407 ?auto_2396406 ) ( ON ?auto_2396409 ?auto_2396407 ) ( ON ?auto_2396408 ?auto_2396409 ) ( ON ?auto_2396410 ?auto_2396408 ) ( not ( = ?auto_2396405 ?auto_2396406 ) ) ( not ( = ?auto_2396405 ?auto_2396407 ) ) ( not ( = ?auto_2396405 ?auto_2396409 ) ) ( not ( = ?auto_2396405 ?auto_2396408 ) ) ( not ( = ?auto_2396405 ?auto_2396410 ) ) ( not ( = ?auto_2396405 ?auto_2396411 ) ) ( not ( = ?auto_2396405 ?auto_2396412 ) ) ( not ( = ?auto_2396405 ?auto_2396415 ) ) ( not ( = ?auto_2396406 ?auto_2396407 ) ) ( not ( = ?auto_2396406 ?auto_2396409 ) ) ( not ( = ?auto_2396406 ?auto_2396408 ) ) ( not ( = ?auto_2396406 ?auto_2396410 ) ) ( not ( = ?auto_2396406 ?auto_2396411 ) ) ( not ( = ?auto_2396406 ?auto_2396412 ) ) ( not ( = ?auto_2396406 ?auto_2396415 ) ) ( not ( = ?auto_2396407 ?auto_2396409 ) ) ( not ( = ?auto_2396407 ?auto_2396408 ) ) ( not ( = ?auto_2396407 ?auto_2396410 ) ) ( not ( = ?auto_2396407 ?auto_2396411 ) ) ( not ( = ?auto_2396407 ?auto_2396412 ) ) ( not ( = ?auto_2396407 ?auto_2396415 ) ) ( not ( = ?auto_2396409 ?auto_2396408 ) ) ( not ( = ?auto_2396409 ?auto_2396410 ) ) ( not ( = ?auto_2396409 ?auto_2396411 ) ) ( not ( = ?auto_2396409 ?auto_2396412 ) ) ( not ( = ?auto_2396409 ?auto_2396415 ) ) ( not ( = ?auto_2396408 ?auto_2396410 ) ) ( not ( = ?auto_2396408 ?auto_2396411 ) ) ( not ( = ?auto_2396408 ?auto_2396412 ) ) ( not ( = ?auto_2396408 ?auto_2396415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396410 ?auto_2396411 ?auto_2396412 )
      ( MAKE-7CRATE-VERIFY ?auto_2396405 ?auto_2396406 ?auto_2396407 ?auto_2396409 ?auto_2396408 ?auto_2396410 ?auto_2396411 ?auto_2396412 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396483 - SURFACE
      ?auto_2396484 - SURFACE
      ?auto_2396485 - SURFACE
      ?auto_2396487 - SURFACE
      ?auto_2396486 - SURFACE
      ?auto_2396488 - SURFACE
      ?auto_2396489 - SURFACE
      ?auto_2396490 - SURFACE
    )
    :vars
    (
      ?auto_2396493 - HOIST
      ?auto_2396492 - PLACE
      ?auto_2396496 - PLACE
      ?auto_2396494 - HOIST
      ?auto_2396495 - SURFACE
      ?auto_2396491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396493 ?auto_2396492 ) ( IS-CRATE ?auto_2396490 ) ( not ( = ?auto_2396489 ?auto_2396490 ) ) ( not ( = ?auto_2396488 ?auto_2396489 ) ) ( not ( = ?auto_2396488 ?auto_2396490 ) ) ( not ( = ?auto_2396496 ?auto_2396492 ) ) ( HOIST-AT ?auto_2396494 ?auto_2396496 ) ( not ( = ?auto_2396493 ?auto_2396494 ) ) ( AVAILABLE ?auto_2396494 ) ( SURFACE-AT ?auto_2396490 ?auto_2396496 ) ( ON ?auto_2396490 ?auto_2396495 ) ( CLEAR ?auto_2396490 ) ( not ( = ?auto_2396489 ?auto_2396495 ) ) ( not ( = ?auto_2396490 ?auto_2396495 ) ) ( not ( = ?auto_2396488 ?auto_2396495 ) ) ( TRUCK-AT ?auto_2396491 ?auto_2396492 ) ( SURFACE-AT ?auto_2396488 ?auto_2396492 ) ( CLEAR ?auto_2396488 ) ( LIFTING ?auto_2396493 ?auto_2396489 ) ( IS-CRATE ?auto_2396489 ) ( ON ?auto_2396484 ?auto_2396483 ) ( ON ?auto_2396485 ?auto_2396484 ) ( ON ?auto_2396487 ?auto_2396485 ) ( ON ?auto_2396486 ?auto_2396487 ) ( ON ?auto_2396488 ?auto_2396486 ) ( not ( = ?auto_2396483 ?auto_2396484 ) ) ( not ( = ?auto_2396483 ?auto_2396485 ) ) ( not ( = ?auto_2396483 ?auto_2396487 ) ) ( not ( = ?auto_2396483 ?auto_2396486 ) ) ( not ( = ?auto_2396483 ?auto_2396488 ) ) ( not ( = ?auto_2396483 ?auto_2396489 ) ) ( not ( = ?auto_2396483 ?auto_2396490 ) ) ( not ( = ?auto_2396483 ?auto_2396495 ) ) ( not ( = ?auto_2396484 ?auto_2396485 ) ) ( not ( = ?auto_2396484 ?auto_2396487 ) ) ( not ( = ?auto_2396484 ?auto_2396486 ) ) ( not ( = ?auto_2396484 ?auto_2396488 ) ) ( not ( = ?auto_2396484 ?auto_2396489 ) ) ( not ( = ?auto_2396484 ?auto_2396490 ) ) ( not ( = ?auto_2396484 ?auto_2396495 ) ) ( not ( = ?auto_2396485 ?auto_2396487 ) ) ( not ( = ?auto_2396485 ?auto_2396486 ) ) ( not ( = ?auto_2396485 ?auto_2396488 ) ) ( not ( = ?auto_2396485 ?auto_2396489 ) ) ( not ( = ?auto_2396485 ?auto_2396490 ) ) ( not ( = ?auto_2396485 ?auto_2396495 ) ) ( not ( = ?auto_2396487 ?auto_2396486 ) ) ( not ( = ?auto_2396487 ?auto_2396488 ) ) ( not ( = ?auto_2396487 ?auto_2396489 ) ) ( not ( = ?auto_2396487 ?auto_2396490 ) ) ( not ( = ?auto_2396487 ?auto_2396495 ) ) ( not ( = ?auto_2396486 ?auto_2396488 ) ) ( not ( = ?auto_2396486 ?auto_2396489 ) ) ( not ( = ?auto_2396486 ?auto_2396490 ) ) ( not ( = ?auto_2396486 ?auto_2396495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396488 ?auto_2396489 ?auto_2396490 )
      ( MAKE-7CRATE-VERIFY ?auto_2396483 ?auto_2396484 ?auto_2396485 ?auto_2396487 ?auto_2396486 ?auto_2396488 ?auto_2396489 ?auto_2396490 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2396561 - SURFACE
      ?auto_2396562 - SURFACE
      ?auto_2396563 - SURFACE
      ?auto_2396565 - SURFACE
      ?auto_2396564 - SURFACE
      ?auto_2396566 - SURFACE
      ?auto_2396567 - SURFACE
      ?auto_2396568 - SURFACE
    )
    :vars
    (
      ?auto_2396569 - HOIST
      ?auto_2396572 - PLACE
      ?auto_2396574 - PLACE
      ?auto_2396570 - HOIST
      ?auto_2396571 - SURFACE
      ?auto_2396573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2396569 ?auto_2396572 ) ( IS-CRATE ?auto_2396568 ) ( not ( = ?auto_2396567 ?auto_2396568 ) ) ( not ( = ?auto_2396566 ?auto_2396567 ) ) ( not ( = ?auto_2396566 ?auto_2396568 ) ) ( not ( = ?auto_2396574 ?auto_2396572 ) ) ( HOIST-AT ?auto_2396570 ?auto_2396574 ) ( not ( = ?auto_2396569 ?auto_2396570 ) ) ( AVAILABLE ?auto_2396570 ) ( SURFACE-AT ?auto_2396568 ?auto_2396574 ) ( ON ?auto_2396568 ?auto_2396571 ) ( CLEAR ?auto_2396568 ) ( not ( = ?auto_2396567 ?auto_2396571 ) ) ( not ( = ?auto_2396568 ?auto_2396571 ) ) ( not ( = ?auto_2396566 ?auto_2396571 ) ) ( TRUCK-AT ?auto_2396573 ?auto_2396572 ) ( SURFACE-AT ?auto_2396566 ?auto_2396572 ) ( CLEAR ?auto_2396566 ) ( IS-CRATE ?auto_2396567 ) ( AVAILABLE ?auto_2396569 ) ( IN ?auto_2396567 ?auto_2396573 ) ( ON ?auto_2396562 ?auto_2396561 ) ( ON ?auto_2396563 ?auto_2396562 ) ( ON ?auto_2396565 ?auto_2396563 ) ( ON ?auto_2396564 ?auto_2396565 ) ( ON ?auto_2396566 ?auto_2396564 ) ( not ( = ?auto_2396561 ?auto_2396562 ) ) ( not ( = ?auto_2396561 ?auto_2396563 ) ) ( not ( = ?auto_2396561 ?auto_2396565 ) ) ( not ( = ?auto_2396561 ?auto_2396564 ) ) ( not ( = ?auto_2396561 ?auto_2396566 ) ) ( not ( = ?auto_2396561 ?auto_2396567 ) ) ( not ( = ?auto_2396561 ?auto_2396568 ) ) ( not ( = ?auto_2396561 ?auto_2396571 ) ) ( not ( = ?auto_2396562 ?auto_2396563 ) ) ( not ( = ?auto_2396562 ?auto_2396565 ) ) ( not ( = ?auto_2396562 ?auto_2396564 ) ) ( not ( = ?auto_2396562 ?auto_2396566 ) ) ( not ( = ?auto_2396562 ?auto_2396567 ) ) ( not ( = ?auto_2396562 ?auto_2396568 ) ) ( not ( = ?auto_2396562 ?auto_2396571 ) ) ( not ( = ?auto_2396563 ?auto_2396565 ) ) ( not ( = ?auto_2396563 ?auto_2396564 ) ) ( not ( = ?auto_2396563 ?auto_2396566 ) ) ( not ( = ?auto_2396563 ?auto_2396567 ) ) ( not ( = ?auto_2396563 ?auto_2396568 ) ) ( not ( = ?auto_2396563 ?auto_2396571 ) ) ( not ( = ?auto_2396565 ?auto_2396564 ) ) ( not ( = ?auto_2396565 ?auto_2396566 ) ) ( not ( = ?auto_2396565 ?auto_2396567 ) ) ( not ( = ?auto_2396565 ?auto_2396568 ) ) ( not ( = ?auto_2396565 ?auto_2396571 ) ) ( not ( = ?auto_2396564 ?auto_2396566 ) ) ( not ( = ?auto_2396564 ?auto_2396567 ) ) ( not ( = ?auto_2396564 ?auto_2396568 ) ) ( not ( = ?auto_2396564 ?auto_2396571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396566 ?auto_2396567 ?auto_2396568 )
      ( MAKE-7CRATE-VERIFY ?auto_2396561 ?auto_2396562 ?auto_2396563 ?auto_2396565 ?auto_2396564 ?auto_2396566 ?auto_2396567 ?auto_2396568 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2399480 - SURFACE
      ?auto_2399481 - SURFACE
      ?auto_2399482 - SURFACE
      ?auto_2399484 - SURFACE
      ?auto_2399483 - SURFACE
      ?auto_2399485 - SURFACE
      ?auto_2399486 - SURFACE
      ?auto_2399487 - SURFACE
      ?auto_2399488 - SURFACE
    )
    :vars
    (
      ?auto_2399490 - HOIST
      ?auto_2399489 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399490 ?auto_2399489 ) ( SURFACE-AT ?auto_2399487 ?auto_2399489 ) ( CLEAR ?auto_2399487 ) ( LIFTING ?auto_2399490 ?auto_2399488 ) ( IS-CRATE ?auto_2399488 ) ( not ( = ?auto_2399487 ?auto_2399488 ) ) ( ON ?auto_2399481 ?auto_2399480 ) ( ON ?auto_2399482 ?auto_2399481 ) ( ON ?auto_2399484 ?auto_2399482 ) ( ON ?auto_2399483 ?auto_2399484 ) ( ON ?auto_2399485 ?auto_2399483 ) ( ON ?auto_2399486 ?auto_2399485 ) ( ON ?auto_2399487 ?auto_2399486 ) ( not ( = ?auto_2399480 ?auto_2399481 ) ) ( not ( = ?auto_2399480 ?auto_2399482 ) ) ( not ( = ?auto_2399480 ?auto_2399484 ) ) ( not ( = ?auto_2399480 ?auto_2399483 ) ) ( not ( = ?auto_2399480 ?auto_2399485 ) ) ( not ( = ?auto_2399480 ?auto_2399486 ) ) ( not ( = ?auto_2399480 ?auto_2399487 ) ) ( not ( = ?auto_2399480 ?auto_2399488 ) ) ( not ( = ?auto_2399481 ?auto_2399482 ) ) ( not ( = ?auto_2399481 ?auto_2399484 ) ) ( not ( = ?auto_2399481 ?auto_2399483 ) ) ( not ( = ?auto_2399481 ?auto_2399485 ) ) ( not ( = ?auto_2399481 ?auto_2399486 ) ) ( not ( = ?auto_2399481 ?auto_2399487 ) ) ( not ( = ?auto_2399481 ?auto_2399488 ) ) ( not ( = ?auto_2399482 ?auto_2399484 ) ) ( not ( = ?auto_2399482 ?auto_2399483 ) ) ( not ( = ?auto_2399482 ?auto_2399485 ) ) ( not ( = ?auto_2399482 ?auto_2399486 ) ) ( not ( = ?auto_2399482 ?auto_2399487 ) ) ( not ( = ?auto_2399482 ?auto_2399488 ) ) ( not ( = ?auto_2399484 ?auto_2399483 ) ) ( not ( = ?auto_2399484 ?auto_2399485 ) ) ( not ( = ?auto_2399484 ?auto_2399486 ) ) ( not ( = ?auto_2399484 ?auto_2399487 ) ) ( not ( = ?auto_2399484 ?auto_2399488 ) ) ( not ( = ?auto_2399483 ?auto_2399485 ) ) ( not ( = ?auto_2399483 ?auto_2399486 ) ) ( not ( = ?auto_2399483 ?auto_2399487 ) ) ( not ( = ?auto_2399483 ?auto_2399488 ) ) ( not ( = ?auto_2399485 ?auto_2399486 ) ) ( not ( = ?auto_2399485 ?auto_2399487 ) ) ( not ( = ?auto_2399485 ?auto_2399488 ) ) ( not ( = ?auto_2399486 ?auto_2399487 ) ) ( not ( = ?auto_2399486 ?auto_2399488 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2399487 ?auto_2399488 )
      ( MAKE-8CRATE-VERIFY ?auto_2399480 ?auto_2399481 ?auto_2399482 ?auto_2399484 ?auto_2399483 ?auto_2399485 ?auto_2399486 ?auto_2399487 ?auto_2399488 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2399547 - SURFACE
      ?auto_2399548 - SURFACE
      ?auto_2399549 - SURFACE
      ?auto_2399551 - SURFACE
      ?auto_2399550 - SURFACE
      ?auto_2399552 - SURFACE
      ?auto_2399553 - SURFACE
      ?auto_2399554 - SURFACE
      ?auto_2399555 - SURFACE
    )
    :vars
    (
      ?auto_2399558 - HOIST
      ?auto_2399556 - PLACE
      ?auto_2399557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399558 ?auto_2399556 ) ( SURFACE-AT ?auto_2399554 ?auto_2399556 ) ( CLEAR ?auto_2399554 ) ( IS-CRATE ?auto_2399555 ) ( not ( = ?auto_2399554 ?auto_2399555 ) ) ( TRUCK-AT ?auto_2399557 ?auto_2399556 ) ( AVAILABLE ?auto_2399558 ) ( IN ?auto_2399555 ?auto_2399557 ) ( ON ?auto_2399554 ?auto_2399553 ) ( not ( = ?auto_2399553 ?auto_2399554 ) ) ( not ( = ?auto_2399553 ?auto_2399555 ) ) ( ON ?auto_2399548 ?auto_2399547 ) ( ON ?auto_2399549 ?auto_2399548 ) ( ON ?auto_2399551 ?auto_2399549 ) ( ON ?auto_2399550 ?auto_2399551 ) ( ON ?auto_2399552 ?auto_2399550 ) ( ON ?auto_2399553 ?auto_2399552 ) ( not ( = ?auto_2399547 ?auto_2399548 ) ) ( not ( = ?auto_2399547 ?auto_2399549 ) ) ( not ( = ?auto_2399547 ?auto_2399551 ) ) ( not ( = ?auto_2399547 ?auto_2399550 ) ) ( not ( = ?auto_2399547 ?auto_2399552 ) ) ( not ( = ?auto_2399547 ?auto_2399553 ) ) ( not ( = ?auto_2399547 ?auto_2399554 ) ) ( not ( = ?auto_2399547 ?auto_2399555 ) ) ( not ( = ?auto_2399548 ?auto_2399549 ) ) ( not ( = ?auto_2399548 ?auto_2399551 ) ) ( not ( = ?auto_2399548 ?auto_2399550 ) ) ( not ( = ?auto_2399548 ?auto_2399552 ) ) ( not ( = ?auto_2399548 ?auto_2399553 ) ) ( not ( = ?auto_2399548 ?auto_2399554 ) ) ( not ( = ?auto_2399548 ?auto_2399555 ) ) ( not ( = ?auto_2399549 ?auto_2399551 ) ) ( not ( = ?auto_2399549 ?auto_2399550 ) ) ( not ( = ?auto_2399549 ?auto_2399552 ) ) ( not ( = ?auto_2399549 ?auto_2399553 ) ) ( not ( = ?auto_2399549 ?auto_2399554 ) ) ( not ( = ?auto_2399549 ?auto_2399555 ) ) ( not ( = ?auto_2399551 ?auto_2399550 ) ) ( not ( = ?auto_2399551 ?auto_2399552 ) ) ( not ( = ?auto_2399551 ?auto_2399553 ) ) ( not ( = ?auto_2399551 ?auto_2399554 ) ) ( not ( = ?auto_2399551 ?auto_2399555 ) ) ( not ( = ?auto_2399550 ?auto_2399552 ) ) ( not ( = ?auto_2399550 ?auto_2399553 ) ) ( not ( = ?auto_2399550 ?auto_2399554 ) ) ( not ( = ?auto_2399550 ?auto_2399555 ) ) ( not ( = ?auto_2399552 ?auto_2399553 ) ) ( not ( = ?auto_2399552 ?auto_2399554 ) ) ( not ( = ?auto_2399552 ?auto_2399555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2399553 ?auto_2399554 ?auto_2399555 )
      ( MAKE-8CRATE-VERIFY ?auto_2399547 ?auto_2399548 ?auto_2399549 ?auto_2399551 ?auto_2399550 ?auto_2399552 ?auto_2399553 ?auto_2399554 ?auto_2399555 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2399623 - SURFACE
      ?auto_2399624 - SURFACE
      ?auto_2399625 - SURFACE
      ?auto_2399627 - SURFACE
      ?auto_2399626 - SURFACE
      ?auto_2399628 - SURFACE
      ?auto_2399629 - SURFACE
      ?auto_2399630 - SURFACE
      ?auto_2399631 - SURFACE
    )
    :vars
    (
      ?auto_2399633 - HOIST
      ?auto_2399632 - PLACE
      ?auto_2399634 - TRUCK
      ?auto_2399635 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399633 ?auto_2399632 ) ( SURFACE-AT ?auto_2399630 ?auto_2399632 ) ( CLEAR ?auto_2399630 ) ( IS-CRATE ?auto_2399631 ) ( not ( = ?auto_2399630 ?auto_2399631 ) ) ( AVAILABLE ?auto_2399633 ) ( IN ?auto_2399631 ?auto_2399634 ) ( ON ?auto_2399630 ?auto_2399629 ) ( not ( = ?auto_2399629 ?auto_2399630 ) ) ( not ( = ?auto_2399629 ?auto_2399631 ) ) ( TRUCK-AT ?auto_2399634 ?auto_2399635 ) ( not ( = ?auto_2399635 ?auto_2399632 ) ) ( ON ?auto_2399624 ?auto_2399623 ) ( ON ?auto_2399625 ?auto_2399624 ) ( ON ?auto_2399627 ?auto_2399625 ) ( ON ?auto_2399626 ?auto_2399627 ) ( ON ?auto_2399628 ?auto_2399626 ) ( ON ?auto_2399629 ?auto_2399628 ) ( not ( = ?auto_2399623 ?auto_2399624 ) ) ( not ( = ?auto_2399623 ?auto_2399625 ) ) ( not ( = ?auto_2399623 ?auto_2399627 ) ) ( not ( = ?auto_2399623 ?auto_2399626 ) ) ( not ( = ?auto_2399623 ?auto_2399628 ) ) ( not ( = ?auto_2399623 ?auto_2399629 ) ) ( not ( = ?auto_2399623 ?auto_2399630 ) ) ( not ( = ?auto_2399623 ?auto_2399631 ) ) ( not ( = ?auto_2399624 ?auto_2399625 ) ) ( not ( = ?auto_2399624 ?auto_2399627 ) ) ( not ( = ?auto_2399624 ?auto_2399626 ) ) ( not ( = ?auto_2399624 ?auto_2399628 ) ) ( not ( = ?auto_2399624 ?auto_2399629 ) ) ( not ( = ?auto_2399624 ?auto_2399630 ) ) ( not ( = ?auto_2399624 ?auto_2399631 ) ) ( not ( = ?auto_2399625 ?auto_2399627 ) ) ( not ( = ?auto_2399625 ?auto_2399626 ) ) ( not ( = ?auto_2399625 ?auto_2399628 ) ) ( not ( = ?auto_2399625 ?auto_2399629 ) ) ( not ( = ?auto_2399625 ?auto_2399630 ) ) ( not ( = ?auto_2399625 ?auto_2399631 ) ) ( not ( = ?auto_2399627 ?auto_2399626 ) ) ( not ( = ?auto_2399627 ?auto_2399628 ) ) ( not ( = ?auto_2399627 ?auto_2399629 ) ) ( not ( = ?auto_2399627 ?auto_2399630 ) ) ( not ( = ?auto_2399627 ?auto_2399631 ) ) ( not ( = ?auto_2399626 ?auto_2399628 ) ) ( not ( = ?auto_2399626 ?auto_2399629 ) ) ( not ( = ?auto_2399626 ?auto_2399630 ) ) ( not ( = ?auto_2399626 ?auto_2399631 ) ) ( not ( = ?auto_2399628 ?auto_2399629 ) ) ( not ( = ?auto_2399628 ?auto_2399630 ) ) ( not ( = ?auto_2399628 ?auto_2399631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2399629 ?auto_2399630 ?auto_2399631 )
      ( MAKE-8CRATE-VERIFY ?auto_2399623 ?auto_2399624 ?auto_2399625 ?auto_2399627 ?auto_2399626 ?auto_2399628 ?auto_2399629 ?auto_2399630 ?auto_2399631 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2399707 - SURFACE
      ?auto_2399708 - SURFACE
      ?auto_2399709 - SURFACE
      ?auto_2399711 - SURFACE
      ?auto_2399710 - SURFACE
      ?auto_2399712 - SURFACE
      ?auto_2399713 - SURFACE
      ?auto_2399714 - SURFACE
      ?auto_2399715 - SURFACE
    )
    :vars
    (
      ?auto_2399717 - HOIST
      ?auto_2399716 - PLACE
      ?auto_2399720 - TRUCK
      ?auto_2399719 - PLACE
      ?auto_2399718 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399717 ?auto_2399716 ) ( SURFACE-AT ?auto_2399714 ?auto_2399716 ) ( CLEAR ?auto_2399714 ) ( IS-CRATE ?auto_2399715 ) ( not ( = ?auto_2399714 ?auto_2399715 ) ) ( AVAILABLE ?auto_2399717 ) ( ON ?auto_2399714 ?auto_2399713 ) ( not ( = ?auto_2399713 ?auto_2399714 ) ) ( not ( = ?auto_2399713 ?auto_2399715 ) ) ( TRUCK-AT ?auto_2399720 ?auto_2399719 ) ( not ( = ?auto_2399719 ?auto_2399716 ) ) ( HOIST-AT ?auto_2399718 ?auto_2399719 ) ( LIFTING ?auto_2399718 ?auto_2399715 ) ( not ( = ?auto_2399717 ?auto_2399718 ) ) ( ON ?auto_2399708 ?auto_2399707 ) ( ON ?auto_2399709 ?auto_2399708 ) ( ON ?auto_2399711 ?auto_2399709 ) ( ON ?auto_2399710 ?auto_2399711 ) ( ON ?auto_2399712 ?auto_2399710 ) ( ON ?auto_2399713 ?auto_2399712 ) ( not ( = ?auto_2399707 ?auto_2399708 ) ) ( not ( = ?auto_2399707 ?auto_2399709 ) ) ( not ( = ?auto_2399707 ?auto_2399711 ) ) ( not ( = ?auto_2399707 ?auto_2399710 ) ) ( not ( = ?auto_2399707 ?auto_2399712 ) ) ( not ( = ?auto_2399707 ?auto_2399713 ) ) ( not ( = ?auto_2399707 ?auto_2399714 ) ) ( not ( = ?auto_2399707 ?auto_2399715 ) ) ( not ( = ?auto_2399708 ?auto_2399709 ) ) ( not ( = ?auto_2399708 ?auto_2399711 ) ) ( not ( = ?auto_2399708 ?auto_2399710 ) ) ( not ( = ?auto_2399708 ?auto_2399712 ) ) ( not ( = ?auto_2399708 ?auto_2399713 ) ) ( not ( = ?auto_2399708 ?auto_2399714 ) ) ( not ( = ?auto_2399708 ?auto_2399715 ) ) ( not ( = ?auto_2399709 ?auto_2399711 ) ) ( not ( = ?auto_2399709 ?auto_2399710 ) ) ( not ( = ?auto_2399709 ?auto_2399712 ) ) ( not ( = ?auto_2399709 ?auto_2399713 ) ) ( not ( = ?auto_2399709 ?auto_2399714 ) ) ( not ( = ?auto_2399709 ?auto_2399715 ) ) ( not ( = ?auto_2399711 ?auto_2399710 ) ) ( not ( = ?auto_2399711 ?auto_2399712 ) ) ( not ( = ?auto_2399711 ?auto_2399713 ) ) ( not ( = ?auto_2399711 ?auto_2399714 ) ) ( not ( = ?auto_2399711 ?auto_2399715 ) ) ( not ( = ?auto_2399710 ?auto_2399712 ) ) ( not ( = ?auto_2399710 ?auto_2399713 ) ) ( not ( = ?auto_2399710 ?auto_2399714 ) ) ( not ( = ?auto_2399710 ?auto_2399715 ) ) ( not ( = ?auto_2399712 ?auto_2399713 ) ) ( not ( = ?auto_2399712 ?auto_2399714 ) ) ( not ( = ?auto_2399712 ?auto_2399715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2399713 ?auto_2399714 ?auto_2399715 )
      ( MAKE-8CRATE-VERIFY ?auto_2399707 ?auto_2399708 ?auto_2399709 ?auto_2399711 ?auto_2399710 ?auto_2399712 ?auto_2399713 ?auto_2399714 ?auto_2399715 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2399799 - SURFACE
      ?auto_2399800 - SURFACE
      ?auto_2399801 - SURFACE
      ?auto_2399803 - SURFACE
      ?auto_2399802 - SURFACE
      ?auto_2399804 - SURFACE
      ?auto_2399805 - SURFACE
      ?auto_2399806 - SURFACE
      ?auto_2399807 - SURFACE
    )
    :vars
    (
      ?auto_2399809 - HOIST
      ?auto_2399810 - PLACE
      ?auto_2399812 - TRUCK
      ?auto_2399813 - PLACE
      ?auto_2399811 - HOIST
      ?auto_2399808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399809 ?auto_2399810 ) ( SURFACE-AT ?auto_2399806 ?auto_2399810 ) ( CLEAR ?auto_2399806 ) ( IS-CRATE ?auto_2399807 ) ( not ( = ?auto_2399806 ?auto_2399807 ) ) ( AVAILABLE ?auto_2399809 ) ( ON ?auto_2399806 ?auto_2399805 ) ( not ( = ?auto_2399805 ?auto_2399806 ) ) ( not ( = ?auto_2399805 ?auto_2399807 ) ) ( TRUCK-AT ?auto_2399812 ?auto_2399813 ) ( not ( = ?auto_2399813 ?auto_2399810 ) ) ( HOIST-AT ?auto_2399811 ?auto_2399813 ) ( not ( = ?auto_2399809 ?auto_2399811 ) ) ( AVAILABLE ?auto_2399811 ) ( SURFACE-AT ?auto_2399807 ?auto_2399813 ) ( ON ?auto_2399807 ?auto_2399808 ) ( CLEAR ?auto_2399807 ) ( not ( = ?auto_2399806 ?auto_2399808 ) ) ( not ( = ?auto_2399807 ?auto_2399808 ) ) ( not ( = ?auto_2399805 ?auto_2399808 ) ) ( ON ?auto_2399800 ?auto_2399799 ) ( ON ?auto_2399801 ?auto_2399800 ) ( ON ?auto_2399803 ?auto_2399801 ) ( ON ?auto_2399802 ?auto_2399803 ) ( ON ?auto_2399804 ?auto_2399802 ) ( ON ?auto_2399805 ?auto_2399804 ) ( not ( = ?auto_2399799 ?auto_2399800 ) ) ( not ( = ?auto_2399799 ?auto_2399801 ) ) ( not ( = ?auto_2399799 ?auto_2399803 ) ) ( not ( = ?auto_2399799 ?auto_2399802 ) ) ( not ( = ?auto_2399799 ?auto_2399804 ) ) ( not ( = ?auto_2399799 ?auto_2399805 ) ) ( not ( = ?auto_2399799 ?auto_2399806 ) ) ( not ( = ?auto_2399799 ?auto_2399807 ) ) ( not ( = ?auto_2399799 ?auto_2399808 ) ) ( not ( = ?auto_2399800 ?auto_2399801 ) ) ( not ( = ?auto_2399800 ?auto_2399803 ) ) ( not ( = ?auto_2399800 ?auto_2399802 ) ) ( not ( = ?auto_2399800 ?auto_2399804 ) ) ( not ( = ?auto_2399800 ?auto_2399805 ) ) ( not ( = ?auto_2399800 ?auto_2399806 ) ) ( not ( = ?auto_2399800 ?auto_2399807 ) ) ( not ( = ?auto_2399800 ?auto_2399808 ) ) ( not ( = ?auto_2399801 ?auto_2399803 ) ) ( not ( = ?auto_2399801 ?auto_2399802 ) ) ( not ( = ?auto_2399801 ?auto_2399804 ) ) ( not ( = ?auto_2399801 ?auto_2399805 ) ) ( not ( = ?auto_2399801 ?auto_2399806 ) ) ( not ( = ?auto_2399801 ?auto_2399807 ) ) ( not ( = ?auto_2399801 ?auto_2399808 ) ) ( not ( = ?auto_2399803 ?auto_2399802 ) ) ( not ( = ?auto_2399803 ?auto_2399804 ) ) ( not ( = ?auto_2399803 ?auto_2399805 ) ) ( not ( = ?auto_2399803 ?auto_2399806 ) ) ( not ( = ?auto_2399803 ?auto_2399807 ) ) ( not ( = ?auto_2399803 ?auto_2399808 ) ) ( not ( = ?auto_2399802 ?auto_2399804 ) ) ( not ( = ?auto_2399802 ?auto_2399805 ) ) ( not ( = ?auto_2399802 ?auto_2399806 ) ) ( not ( = ?auto_2399802 ?auto_2399807 ) ) ( not ( = ?auto_2399802 ?auto_2399808 ) ) ( not ( = ?auto_2399804 ?auto_2399805 ) ) ( not ( = ?auto_2399804 ?auto_2399806 ) ) ( not ( = ?auto_2399804 ?auto_2399807 ) ) ( not ( = ?auto_2399804 ?auto_2399808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2399805 ?auto_2399806 ?auto_2399807 )
      ( MAKE-8CRATE-VERIFY ?auto_2399799 ?auto_2399800 ?auto_2399801 ?auto_2399803 ?auto_2399802 ?auto_2399804 ?auto_2399805 ?auto_2399806 ?auto_2399807 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2399892 - SURFACE
      ?auto_2399893 - SURFACE
      ?auto_2399894 - SURFACE
      ?auto_2399896 - SURFACE
      ?auto_2399895 - SURFACE
      ?auto_2399897 - SURFACE
      ?auto_2399898 - SURFACE
      ?auto_2399899 - SURFACE
      ?auto_2399900 - SURFACE
    )
    :vars
    (
      ?auto_2399905 - HOIST
      ?auto_2399902 - PLACE
      ?auto_2399903 - PLACE
      ?auto_2399904 - HOIST
      ?auto_2399901 - SURFACE
      ?auto_2399906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399905 ?auto_2399902 ) ( SURFACE-AT ?auto_2399899 ?auto_2399902 ) ( CLEAR ?auto_2399899 ) ( IS-CRATE ?auto_2399900 ) ( not ( = ?auto_2399899 ?auto_2399900 ) ) ( AVAILABLE ?auto_2399905 ) ( ON ?auto_2399899 ?auto_2399898 ) ( not ( = ?auto_2399898 ?auto_2399899 ) ) ( not ( = ?auto_2399898 ?auto_2399900 ) ) ( not ( = ?auto_2399903 ?auto_2399902 ) ) ( HOIST-AT ?auto_2399904 ?auto_2399903 ) ( not ( = ?auto_2399905 ?auto_2399904 ) ) ( AVAILABLE ?auto_2399904 ) ( SURFACE-AT ?auto_2399900 ?auto_2399903 ) ( ON ?auto_2399900 ?auto_2399901 ) ( CLEAR ?auto_2399900 ) ( not ( = ?auto_2399899 ?auto_2399901 ) ) ( not ( = ?auto_2399900 ?auto_2399901 ) ) ( not ( = ?auto_2399898 ?auto_2399901 ) ) ( TRUCK-AT ?auto_2399906 ?auto_2399902 ) ( ON ?auto_2399893 ?auto_2399892 ) ( ON ?auto_2399894 ?auto_2399893 ) ( ON ?auto_2399896 ?auto_2399894 ) ( ON ?auto_2399895 ?auto_2399896 ) ( ON ?auto_2399897 ?auto_2399895 ) ( ON ?auto_2399898 ?auto_2399897 ) ( not ( = ?auto_2399892 ?auto_2399893 ) ) ( not ( = ?auto_2399892 ?auto_2399894 ) ) ( not ( = ?auto_2399892 ?auto_2399896 ) ) ( not ( = ?auto_2399892 ?auto_2399895 ) ) ( not ( = ?auto_2399892 ?auto_2399897 ) ) ( not ( = ?auto_2399892 ?auto_2399898 ) ) ( not ( = ?auto_2399892 ?auto_2399899 ) ) ( not ( = ?auto_2399892 ?auto_2399900 ) ) ( not ( = ?auto_2399892 ?auto_2399901 ) ) ( not ( = ?auto_2399893 ?auto_2399894 ) ) ( not ( = ?auto_2399893 ?auto_2399896 ) ) ( not ( = ?auto_2399893 ?auto_2399895 ) ) ( not ( = ?auto_2399893 ?auto_2399897 ) ) ( not ( = ?auto_2399893 ?auto_2399898 ) ) ( not ( = ?auto_2399893 ?auto_2399899 ) ) ( not ( = ?auto_2399893 ?auto_2399900 ) ) ( not ( = ?auto_2399893 ?auto_2399901 ) ) ( not ( = ?auto_2399894 ?auto_2399896 ) ) ( not ( = ?auto_2399894 ?auto_2399895 ) ) ( not ( = ?auto_2399894 ?auto_2399897 ) ) ( not ( = ?auto_2399894 ?auto_2399898 ) ) ( not ( = ?auto_2399894 ?auto_2399899 ) ) ( not ( = ?auto_2399894 ?auto_2399900 ) ) ( not ( = ?auto_2399894 ?auto_2399901 ) ) ( not ( = ?auto_2399896 ?auto_2399895 ) ) ( not ( = ?auto_2399896 ?auto_2399897 ) ) ( not ( = ?auto_2399896 ?auto_2399898 ) ) ( not ( = ?auto_2399896 ?auto_2399899 ) ) ( not ( = ?auto_2399896 ?auto_2399900 ) ) ( not ( = ?auto_2399896 ?auto_2399901 ) ) ( not ( = ?auto_2399895 ?auto_2399897 ) ) ( not ( = ?auto_2399895 ?auto_2399898 ) ) ( not ( = ?auto_2399895 ?auto_2399899 ) ) ( not ( = ?auto_2399895 ?auto_2399900 ) ) ( not ( = ?auto_2399895 ?auto_2399901 ) ) ( not ( = ?auto_2399897 ?auto_2399898 ) ) ( not ( = ?auto_2399897 ?auto_2399899 ) ) ( not ( = ?auto_2399897 ?auto_2399900 ) ) ( not ( = ?auto_2399897 ?auto_2399901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2399898 ?auto_2399899 ?auto_2399900 )
      ( MAKE-8CRATE-VERIFY ?auto_2399892 ?auto_2399893 ?auto_2399894 ?auto_2399896 ?auto_2399895 ?auto_2399897 ?auto_2399898 ?auto_2399899 ?auto_2399900 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2399985 - SURFACE
      ?auto_2399986 - SURFACE
      ?auto_2399987 - SURFACE
      ?auto_2399989 - SURFACE
      ?auto_2399988 - SURFACE
      ?auto_2399990 - SURFACE
      ?auto_2399991 - SURFACE
      ?auto_2399992 - SURFACE
      ?auto_2399993 - SURFACE
    )
    :vars
    (
      ?auto_2399994 - HOIST
      ?auto_2399998 - PLACE
      ?auto_2399997 - PLACE
      ?auto_2399996 - HOIST
      ?auto_2399995 - SURFACE
      ?auto_2399999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399994 ?auto_2399998 ) ( IS-CRATE ?auto_2399993 ) ( not ( = ?auto_2399992 ?auto_2399993 ) ) ( not ( = ?auto_2399991 ?auto_2399992 ) ) ( not ( = ?auto_2399991 ?auto_2399993 ) ) ( not ( = ?auto_2399997 ?auto_2399998 ) ) ( HOIST-AT ?auto_2399996 ?auto_2399997 ) ( not ( = ?auto_2399994 ?auto_2399996 ) ) ( AVAILABLE ?auto_2399996 ) ( SURFACE-AT ?auto_2399993 ?auto_2399997 ) ( ON ?auto_2399993 ?auto_2399995 ) ( CLEAR ?auto_2399993 ) ( not ( = ?auto_2399992 ?auto_2399995 ) ) ( not ( = ?auto_2399993 ?auto_2399995 ) ) ( not ( = ?auto_2399991 ?auto_2399995 ) ) ( TRUCK-AT ?auto_2399999 ?auto_2399998 ) ( SURFACE-AT ?auto_2399991 ?auto_2399998 ) ( CLEAR ?auto_2399991 ) ( LIFTING ?auto_2399994 ?auto_2399992 ) ( IS-CRATE ?auto_2399992 ) ( ON ?auto_2399986 ?auto_2399985 ) ( ON ?auto_2399987 ?auto_2399986 ) ( ON ?auto_2399989 ?auto_2399987 ) ( ON ?auto_2399988 ?auto_2399989 ) ( ON ?auto_2399990 ?auto_2399988 ) ( ON ?auto_2399991 ?auto_2399990 ) ( not ( = ?auto_2399985 ?auto_2399986 ) ) ( not ( = ?auto_2399985 ?auto_2399987 ) ) ( not ( = ?auto_2399985 ?auto_2399989 ) ) ( not ( = ?auto_2399985 ?auto_2399988 ) ) ( not ( = ?auto_2399985 ?auto_2399990 ) ) ( not ( = ?auto_2399985 ?auto_2399991 ) ) ( not ( = ?auto_2399985 ?auto_2399992 ) ) ( not ( = ?auto_2399985 ?auto_2399993 ) ) ( not ( = ?auto_2399985 ?auto_2399995 ) ) ( not ( = ?auto_2399986 ?auto_2399987 ) ) ( not ( = ?auto_2399986 ?auto_2399989 ) ) ( not ( = ?auto_2399986 ?auto_2399988 ) ) ( not ( = ?auto_2399986 ?auto_2399990 ) ) ( not ( = ?auto_2399986 ?auto_2399991 ) ) ( not ( = ?auto_2399986 ?auto_2399992 ) ) ( not ( = ?auto_2399986 ?auto_2399993 ) ) ( not ( = ?auto_2399986 ?auto_2399995 ) ) ( not ( = ?auto_2399987 ?auto_2399989 ) ) ( not ( = ?auto_2399987 ?auto_2399988 ) ) ( not ( = ?auto_2399987 ?auto_2399990 ) ) ( not ( = ?auto_2399987 ?auto_2399991 ) ) ( not ( = ?auto_2399987 ?auto_2399992 ) ) ( not ( = ?auto_2399987 ?auto_2399993 ) ) ( not ( = ?auto_2399987 ?auto_2399995 ) ) ( not ( = ?auto_2399989 ?auto_2399988 ) ) ( not ( = ?auto_2399989 ?auto_2399990 ) ) ( not ( = ?auto_2399989 ?auto_2399991 ) ) ( not ( = ?auto_2399989 ?auto_2399992 ) ) ( not ( = ?auto_2399989 ?auto_2399993 ) ) ( not ( = ?auto_2399989 ?auto_2399995 ) ) ( not ( = ?auto_2399988 ?auto_2399990 ) ) ( not ( = ?auto_2399988 ?auto_2399991 ) ) ( not ( = ?auto_2399988 ?auto_2399992 ) ) ( not ( = ?auto_2399988 ?auto_2399993 ) ) ( not ( = ?auto_2399988 ?auto_2399995 ) ) ( not ( = ?auto_2399990 ?auto_2399991 ) ) ( not ( = ?auto_2399990 ?auto_2399992 ) ) ( not ( = ?auto_2399990 ?auto_2399993 ) ) ( not ( = ?auto_2399990 ?auto_2399995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2399991 ?auto_2399992 ?auto_2399993 )
      ( MAKE-8CRATE-VERIFY ?auto_2399985 ?auto_2399986 ?auto_2399987 ?auto_2399989 ?auto_2399988 ?auto_2399990 ?auto_2399991 ?auto_2399992 ?auto_2399993 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2400078 - SURFACE
      ?auto_2400079 - SURFACE
      ?auto_2400080 - SURFACE
      ?auto_2400082 - SURFACE
      ?auto_2400081 - SURFACE
      ?auto_2400083 - SURFACE
      ?auto_2400084 - SURFACE
      ?auto_2400085 - SURFACE
      ?auto_2400086 - SURFACE
    )
    :vars
    (
      ?auto_2400091 - HOIST
      ?auto_2400089 - PLACE
      ?auto_2400090 - PLACE
      ?auto_2400087 - HOIST
      ?auto_2400092 - SURFACE
      ?auto_2400088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2400091 ?auto_2400089 ) ( IS-CRATE ?auto_2400086 ) ( not ( = ?auto_2400085 ?auto_2400086 ) ) ( not ( = ?auto_2400084 ?auto_2400085 ) ) ( not ( = ?auto_2400084 ?auto_2400086 ) ) ( not ( = ?auto_2400090 ?auto_2400089 ) ) ( HOIST-AT ?auto_2400087 ?auto_2400090 ) ( not ( = ?auto_2400091 ?auto_2400087 ) ) ( AVAILABLE ?auto_2400087 ) ( SURFACE-AT ?auto_2400086 ?auto_2400090 ) ( ON ?auto_2400086 ?auto_2400092 ) ( CLEAR ?auto_2400086 ) ( not ( = ?auto_2400085 ?auto_2400092 ) ) ( not ( = ?auto_2400086 ?auto_2400092 ) ) ( not ( = ?auto_2400084 ?auto_2400092 ) ) ( TRUCK-AT ?auto_2400088 ?auto_2400089 ) ( SURFACE-AT ?auto_2400084 ?auto_2400089 ) ( CLEAR ?auto_2400084 ) ( IS-CRATE ?auto_2400085 ) ( AVAILABLE ?auto_2400091 ) ( IN ?auto_2400085 ?auto_2400088 ) ( ON ?auto_2400079 ?auto_2400078 ) ( ON ?auto_2400080 ?auto_2400079 ) ( ON ?auto_2400082 ?auto_2400080 ) ( ON ?auto_2400081 ?auto_2400082 ) ( ON ?auto_2400083 ?auto_2400081 ) ( ON ?auto_2400084 ?auto_2400083 ) ( not ( = ?auto_2400078 ?auto_2400079 ) ) ( not ( = ?auto_2400078 ?auto_2400080 ) ) ( not ( = ?auto_2400078 ?auto_2400082 ) ) ( not ( = ?auto_2400078 ?auto_2400081 ) ) ( not ( = ?auto_2400078 ?auto_2400083 ) ) ( not ( = ?auto_2400078 ?auto_2400084 ) ) ( not ( = ?auto_2400078 ?auto_2400085 ) ) ( not ( = ?auto_2400078 ?auto_2400086 ) ) ( not ( = ?auto_2400078 ?auto_2400092 ) ) ( not ( = ?auto_2400079 ?auto_2400080 ) ) ( not ( = ?auto_2400079 ?auto_2400082 ) ) ( not ( = ?auto_2400079 ?auto_2400081 ) ) ( not ( = ?auto_2400079 ?auto_2400083 ) ) ( not ( = ?auto_2400079 ?auto_2400084 ) ) ( not ( = ?auto_2400079 ?auto_2400085 ) ) ( not ( = ?auto_2400079 ?auto_2400086 ) ) ( not ( = ?auto_2400079 ?auto_2400092 ) ) ( not ( = ?auto_2400080 ?auto_2400082 ) ) ( not ( = ?auto_2400080 ?auto_2400081 ) ) ( not ( = ?auto_2400080 ?auto_2400083 ) ) ( not ( = ?auto_2400080 ?auto_2400084 ) ) ( not ( = ?auto_2400080 ?auto_2400085 ) ) ( not ( = ?auto_2400080 ?auto_2400086 ) ) ( not ( = ?auto_2400080 ?auto_2400092 ) ) ( not ( = ?auto_2400082 ?auto_2400081 ) ) ( not ( = ?auto_2400082 ?auto_2400083 ) ) ( not ( = ?auto_2400082 ?auto_2400084 ) ) ( not ( = ?auto_2400082 ?auto_2400085 ) ) ( not ( = ?auto_2400082 ?auto_2400086 ) ) ( not ( = ?auto_2400082 ?auto_2400092 ) ) ( not ( = ?auto_2400081 ?auto_2400083 ) ) ( not ( = ?auto_2400081 ?auto_2400084 ) ) ( not ( = ?auto_2400081 ?auto_2400085 ) ) ( not ( = ?auto_2400081 ?auto_2400086 ) ) ( not ( = ?auto_2400081 ?auto_2400092 ) ) ( not ( = ?auto_2400083 ?auto_2400084 ) ) ( not ( = ?auto_2400083 ?auto_2400085 ) ) ( not ( = ?auto_2400083 ?auto_2400086 ) ) ( not ( = ?auto_2400083 ?auto_2400092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2400084 ?auto_2400085 ?auto_2400086 )
      ( MAKE-8CRATE-VERIFY ?auto_2400078 ?auto_2400079 ?auto_2400080 ?auto_2400082 ?auto_2400081 ?auto_2400083 ?auto_2400084 ?auto_2400085 ?auto_2400086 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404194 - SURFACE
      ?auto_2404195 - SURFACE
      ?auto_2404196 - SURFACE
      ?auto_2404198 - SURFACE
      ?auto_2404197 - SURFACE
      ?auto_2404199 - SURFACE
      ?auto_2404200 - SURFACE
      ?auto_2404201 - SURFACE
      ?auto_2404202 - SURFACE
      ?auto_2404203 - SURFACE
    )
    :vars
    (
      ?auto_2404205 - HOIST
      ?auto_2404204 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404205 ?auto_2404204 ) ( SURFACE-AT ?auto_2404202 ?auto_2404204 ) ( CLEAR ?auto_2404202 ) ( LIFTING ?auto_2404205 ?auto_2404203 ) ( IS-CRATE ?auto_2404203 ) ( not ( = ?auto_2404202 ?auto_2404203 ) ) ( ON ?auto_2404195 ?auto_2404194 ) ( ON ?auto_2404196 ?auto_2404195 ) ( ON ?auto_2404198 ?auto_2404196 ) ( ON ?auto_2404197 ?auto_2404198 ) ( ON ?auto_2404199 ?auto_2404197 ) ( ON ?auto_2404200 ?auto_2404199 ) ( ON ?auto_2404201 ?auto_2404200 ) ( ON ?auto_2404202 ?auto_2404201 ) ( not ( = ?auto_2404194 ?auto_2404195 ) ) ( not ( = ?auto_2404194 ?auto_2404196 ) ) ( not ( = ?auto_2404194 ?auto_2404198 ) ) ( not ( = ?auto_2404194 ?auto_2404197 ) ) ( not ( = ?auto_2404194 ?auto_2404199 ) ) ( not ( = ?auto_2404194 ?auto_2404200 ) ) ( not ( = ?auto_2404194 ?auto_2404201 ) ) ( not ( = ?auto_2404194 ?auto_2404202 ) ) ( not ( = ?auto_2404194 ?auto_2404203 ) ) ( not ( = ?auto_2404195 ?auto_2404196 ) ) ( not ( = ?auto_2404195 ?auto_2404198 ) ) ( not ( = ?auto_2404195 ?auto_2404197 ) ) ( not ( = ?auto_2404195 ?auto_2404199 ) ) ( not ( = ?auto_2404195 ?auto_2404200 ) ) ( not ( = ?auto_2404195 ?auto_2404201 ) ) ( not ( = ?auto_2404195 ?auto_2404202 ) ) ( not ( = ?auto_2404195 ?auto_2404203 ) ) ( not ( = ?auto_2404196 ?auto_2404198 ) ) ( not ( = ?auto_2404196 ?auto_2404197 ) ) ( not ( = ?auto_2404196 ?auto_2404199 ) ) ( not ( = ?auto_2404196 ?auto_2404200 ) ) ( not ( = ?auto_2404196 ?auto_2404201 ) ) ( not ( = ?auto_2404196 ?auto_2404202 ) ) ( not ( = ?auto_2404196 ?auto_2404203 ) ) ( not ( = ?auto_2404198 ?auto_2404197 ) ) ( not ( = ?auto_2404198 ?auto_2404199 ) ) ( not ( = ?auto_2404198 ?auto_2404200 ) ) ( not ( = ?auto_2404198 ?auto_2404201 ) ) ( not ( = ?auto_2404198 ?auto_2404202 ) ) ( not ( = ?auto_2404198 ?auto_2404203 ) ) ( not ( = ?auto_2404197 ?auto_2404199 ) ) ( not ( = ?auto_2404197 ?auto_2404200 ) ) ( not ( = ?auto_2404197 ?auto_2404201 ) ) ( not ( = ?auto_2404197 ?auto_2404202 ) ) ( not ( = ?auto_2404197 ?auto_2404203 ) ) ( not ( = ?auto_2404199 ?auto_2404200 ) ) ( not ( = ?auto_2404199 ?auto_2404201 ) ) ( not ( = ?auto_2404199 ?auto_2404202 ) ) ( not ( = ?auto_2404199 ?auto_2404203 ) ) ( not ( = ?auto_2404200 ?auto_2404201 ) ) ( not ( = ?auto_2404200 ?auto_2404202 ) ) ( not ( = ?auto_2404200 ?auto_2404203 ) ) ( not ( = ?auto_2404201 ?auto_2404202 ) ) ( not ( = ?auto_2404201 ?auto_2404203 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2404202 ?auto_2404203 )
      ( MAKE-9CRATE-VERIFY ?auto_2404194 ?auto_2404195 ?auto_2404196 ?auto_2404198 ?auto_2404197 ?auto_2404199 ?auto_2404200 ?auto_2404201 ?auto_2404202 ?auto_2404203 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404274 - SURFACE
      ?auto_2404275 - SURFACE
      ?auto_2404276 - SURFACE
      ?auto_2404278 - SURFACE
      ?auto_2404277 - SURFACE
      ?auto_2404279 - SURFACE
      ?auto_2404280 - SURFACE
      ?auto_2404281 - SURFACE
      ?auto_2404282 - SURFACE
      ?auto_2404283 - SURFACE
    )
    :vars
    (
      ?auto_2404286 - HOIST
      ?auto_2404284 - PLACE
      ?auto_2404285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404286 ?auto_2404284 ) ( SURFACE-AT ?auto_2404282 ?auto_2404284 ) ( CLEAR ?auto_2404282 ) ( IS-CRATE ?auto_2404283 ) ( not ( = ?auto_2404282 ?auto_2404283 ) ) ( TRUCK-AT ?auto_2404285 ?auto_2404284 ) ( AVAILABLE ?auto_2404286 ) ( IN ?auto_2404283 ?auto_2404285 ) ( ON ?auto_2404282 ?auto_2404281 ) ( not ( = ?auto_2404281 ?auto_2404282 ) ) ( not ( = ?auto_2404281 ?auto_2404283 ) ) ( ON ?auto_2404275 ?auto_2404274 ) ( ON ?auto_2404276 ?auto_2404275 ) ( ON ?auto_2404278 ?auto_2404276 ) ( ON ?auto_2404277 ?auto_2404278 ) ( ON ?auto_2404279 ?auto_2404277 ) ( ON ?auto_2404280 ?auto_2404279 ) ( ON ?auto_2404281 ?auto_2404280 ) ( not ( = ?auto_2404274 ?auto_2404275 ) ) ( not ( = ?auto_2404274 ?auto_2404276 ) ) ( not ( = ?auto_2404274 ?auto_2404278 ) ) ( not ( = ?auto_2404274 ?auto_2404277 ) ) ( not ( = ?auto_2404274 ?auto_2404279 ) ) ( not ( = ?auto_2404274 ?auto_2404280 ) ) ( not ( = ?auto_2404274 ?auto_2404281 ) ) ( not ( = ?auto_2404274 ?auto_2404282 ) ) ( not ( = ?auto_2404274 ?auto_2404283 ) ) ( not ( = ?auto_2404275 ?auto_2404276 ) ) ( not ( = ?auto_2404275 ?auto_2404278 ) ) ( not ( = ?auto_2404275 ?auto_2404277 ) ) ( not ( = ?auto_2404275 ?auto_2404279 ) ) ( not ( = ?auto_2404275 ?auto_2404280 ) ) ( not ( = ?auto_2404275 ?auto_2404281 ) ) ( not ( = ?auto_2404275 ?auto_2404282 ) ) ( not ( = ?auto_2404275 ?auto_2404283 ) ) ( not ( = ?auto_2404276 ?auto_2404278 ) ) ( not ( = ?auto_2404276 ?auto_2404277 ) ) ( not ( = ?auto_2404276 ?auto_2404279 ) ) ( not ( = ?auto_2404276 ?auto_2404280 ) ) ( not ( = ?auto_2404276 ?auto_2404281 ) ) ( not ( = ?auto_2404276 ?auto_2404282 ) ) ( not ( = ?auto_2404276 ?auto_2404283 ) ) ( not ( = ?auto_2404278 ?auto_2404277 ) ) ( not ( = ?auto_2404278 ?auto_2404279 ) ) ( not ( = ?auto_2404278 ?auto_2404280 ) ) ( not ( = ?auto_2404278 ?auto_2404281 ) ) ( not ( = ?auto_2404278 ?auto_2404282 ) ) ( not ( = ?auto_2404278 ?auto_2404283 ) ) ( not ( = ?auto_2404277 ?auto_2404279 ) ) ( not ( = ?auto_2404277 ?auto_2404280 ) ) ( not ( = ?auto_2404277 ?auto_2404281 ) ) ( not ( = ?auto_2404277 ?auto_2404282 ) ) ( not ( = ?auto_2404277 ?auto_2404283 ) ) ( not ( = ?auto_2404279 ?auto_2404280 ) ) ( not ( = ?auto_2404279 ?auto_2404281 ) ) ( not ( = ?auto_2404279 ?auto_2404282 ) ) ( not ( = ?auto_2404279 ?auto_2404283 ) ) ( not ( = ?auto_2404280 ?auto_2404281 ) ) ( not ( = ?auto_2404280 ?auto_2404282 ) ) ( not ( = ?auto_2404280 ?auto_2404283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2404281 ?auto_2404282 ?auto_2404283 )
      ( MAKE-9CRATE-VERIFY ?auto_2404274 ?auto_2404275 ?auto_2404276 ?auto_2404278 ?auto_2404277 ?auto_2404279 ?auto_2404280 ?auto_2404281 ?auto_2404282 ?auto_2404283 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404364 - SURFACE
      ?auto_2404365 - SURFACE
      ?auto_2404366 - SURFACE
      ?auto_2404368 - SURFACE
      ?auto_2404367 - SURFACE
      ?auto_2404369 - SURFACE
      ?auto_2404370 - SURFACE
      ?auto_2404371 - SURFACE
      ?auto_2404372 - SURFACE
      ?auto_2404373 - SURFACE
    )
    :vars
    (
      ?auto_2404374 - HOIST
      ?auto_2404375 - PLACE
      ?auto_2404377 - TRUCK
      ?auto_2404376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404374 ?auto_2404375 ) ( SURFACE-AT ?auto_2404372 ?auto_2404375 ) ( CLEAR ?auto_2404372 ) ( IS-CRATE ?auto_2404373 ) ( not ( = ?auto_2404372 ?auto_2404373 ) ) ( AVAILABLE ?auto_2404374 ) ( IN ?auto_2404373 ?auto_2404377 ) ( ON ?auto_2404372 ?auto_2404371 ) ( not ( = ?auto_2404371 ?auto_2404372 ) ) ( not ( = ?auto_2404371 ?auto_2404373 ) ) ( TRUCK-AT ?auto_2404377 ?auto_2404376 ) ( not ( = ?auto_2404376 ?auto_2404375 ) ) ( ON ?auto_2404365 ?auto_2404364 ) ( ON ?auto_2404366 ?auto_2404365 ) ( ON ?auto_2404368 ?auto_2404366 ) ( ON ?auto_2404367 ?auto_2404368 ) ( ON ?auto_2404369 ?auto_2404367 ) ( ON ?auto_2404370 ?auto_2404369 ) ( ON ?auto_2404371 ?auto_2404370 ) ( not ( = ?auto_2404364 ?auto_2404365 ) ) ( not ( = ?auto_2404364 ?auto_2404366 ) ) ( not ( = ?auto_2404364 ?auto_2404368 ) ) ( not ( = ?auto_2404364 ?auto_2404367 ) ) ( not ( = ?auto_2404364 ?auto_2404369 ) ) ( not ( = ?auto_2404364 ?auto_2404370 ) ) ( not ( = ?auto_2404364 ?auto_2404371 ) ) ( not ( = ?auto_2404364 ?auto_2404372 ) ) ( not ( = ?auto_2404364 ?auto_2404373 ) ) ( not ( = ?auto_2404365 ?auto_2404366 ) ) ( not ( = ?auto_2404365 ?auto_2404368 ) ) ( not ( = ?auto_2404365 ?auto_2404367 ) ) ( not ( = ?auto_2404365 ?auto_2404369 ) ) ( not ( = ?auto_2404365 ?auto_2404370 ) ) ( not ( = ?auto_2404365 ?auto_2404371 ) ) ( not ( = ?auto_2404365 ?auto_2404372 ) ) ( not ( = ?auto_2404365 ?auto_2404373 ) ) ( not ( = ?auto_2404366 ?auto_2404368 ) ) ( not ( = ?auto_2404366 ?auto_2404367 ) ) ( not ( = ?auto_2404366 ?auto_2404369 ) ) ( not ( = ?auto_2404366 ?auto_2404370 ) ) ( not ( = ?auto_2404366 ?auto_2404371 ) ) ( not ( = ?auto_2404366 ?auto_2404372 ) ) ( not ( = ?auto_2404366 ?auto_2404373 ) ) ( not ( = ?auto_2404368 ?auto_2404367 ) ) ( not ( = ?auto_2404368 ?auto_2404369 ) ) ( not ( = ?auto_2404368 ?auto_2404370 ) ) ( not ( = ?auto_2404368 ?auto_2404371 ) ) ( not ( = ?auto_2404368 ?auto_2404372 ) ) ( not ( = ?auto_2404368 ?auto_2404373 ) ) ( not ( = ?auto_2404367 ?auto_2404369 ) ) ( not ( = ?auto_2404367 ?auto_2404370 ) ) ( not ( = ?auto_2404367 ?auto_2404371 ) ) ( not ( = ?auto_2404367 ?auto_2404372 ) ) ( not ( = ?auto_2404367 ?auto_2404373 ) ) ( not ( = ?auto_2404369 ?auto_2404370 ) ) ( not ( = ?auto_2404369 ?auto_2404371 ) ) ( not ( = ?auto_2404369 ?auto_2404372 ) ) ( not ( = ?auto_2404369 ?auto_2404373 ) ) ( not ( = ?auto_2404370 ?auto_2404371 ) ) ( not ( = ?auto_2404370 ?auto_2404372 ) ) ( not ( = ?auto_2404370 ?auto_2404373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2404371 ?auto_2404372 ?auto_2404373 )
      ( MAKE-9CRATE-VERIFY ?auto_2404364 ?auto_2404365 ?auto_2404366 ?auto_2404368 ?auto_2404367 ?auto_2404369 ?auto_2404370 ?auto_2404371 ?auto_2404372 ?auto_2404373 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404463 - SURFACE
      ?auto_2404464 - SURFACE
      ?auto_2404465 - SURFACE
      ?auto_2404467 - SURFACE
      ?auto_2404466 - SURFACE
      ?auto_2404468 - SURFACE
      ?auto_2404469 - SURFACE
      ?auto_2404470 - SURFACE
      ?auto_2404471 - SURFACE
      ?auto_2404472 - SURFACE
    )
    :vars
    (
      ?auto_2404473 - HOIST
      ?auto_2404475 - PLACE
      ?auto_2404476 - TRUCK
      ?auto_2404477 - PLACE
      ?auto_2404474 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404473 ?auto_2404475 ) ( SURFACE-AT ?auto_2404471 ?auto_2404475 ) ( CLEAR ?auto_2404471 ) ( IS-CRATE ?auto_2404472 ) ( not ( = ?auto_2404471 ?auto_2404472 ) ) ( AVAILABLE ?auto_2404473 ) ( ON ?auto_2404471 ?auto_2404470 ) ( not ( = ?auto_2404470 ?auto_2404471 ) ) ( not ( = ?auto_2404470 ?auto_2404472 ) ) ( TRUCK-AT ?auto_2404476 ?auto_2404477 ) ( not ( = ?auto_2404477 ?auto_2404475 ) ) ( HOIST-AT ?auto_2404474 ?auto_2404477 ) ( LIFTING ?auto_2404474 ?auto_2404472 ) ( not ( = ?auto_2404473 ?auto_2404474 ) ) ( ON ?auto_2404464 ?auto_2404463 ) ( ON ?auto_2404465 ?auto_2404464 ) ( ON ?auto_2404467 ?auto_2404465 ) ( ON ?auto_2404466 ?auto_2404467 ) ( ON ?auto_2404468 ?auto_2404466 ) ( ON ?auto_2404469 ?auto_2404468 ) ( ON ?auto_2404470 ?auto_2404469 ) ( not ( = ?auto_2404463 ?auto_2404464 ) ) ( not ( = ?auto_2404463 ?auto_2404465 ) ) ( not ( = ?auto_2404463 ?auto_2404467 ) ) ( not ( = ?auto_2404463 ?auto_2404466 ) ) ( not ( = ?auto_2404463 ?auto_2404468 ) ) ( not ( = ?auto_2404463 ?auto_2404469 ) ) ( not ( = ?auto_2404463 ?auto_2404470 ) ) ( not ( = ?auto_2404463 ?auto_2404471 ) ) ( not ( = ?auto_2404463 ?auto_2404472 ) ) ( not ( = ?auto_2404464 ?auto_2404465 ) ) ( not ( = ?auto_2404464 ?auto_2404467 ) ) ( not ( = ?auto_2404464 ?auto_2404466 ) ) ( not ( = ?auto_2404464 ?auto_2404468 ) ) ( not ( = ?auto_2404464 ?auto_2404469 ) ) ( not ( = ?auto_2404464 ?auto_2404470 ) ) ( not ( = ?auto_2404464 ?auto_2404471 ) ) ( not ( = ?auto_2404464 ?auto_2404472 ) ) ( not ( = ?auto_2404465 ?auto_2404467 ) ) ( not ( = ?auto_2404465 ?auto_2404466 ) ) ( not ( = ?auto_2404465 ?auto_2404468 ) ) ( not ( = ?auto_2404465 ?auto_2404469 ) ) ( not ( = ?auto_2404465 ?auto_2404470 ) ) ( not ( = ?auto_2404465 ?auto_2404471 ) ) ( not ( = ?auto_2404465 ?auto_2404472 ) ) ( not ( = ?auto_2404467 ?auto_2404466 ) ) ( not ( = ?auto_2404467 ?auto_2404468 ) ) ( not ( = ?auto_2404467 ?auto_2404469 ) ) ( not ( = ?auto_2404467 ?auto_2404470 ) ) ( not ( = ?auto_2404467 ?auto_2404471 ) ) ( not ( = ?auto_2404467 ?auto_2404472 ) ) ( not ( = ?auto_2404466 ?auto_2404468 ) ) ( not ( = ?auto_2404466 ?auto_2404469 ) ) ( not ( = ?auto_2404466 ?auto_2404470 ) ) ( not ( = ?auto_2404466 ?auto_2404471 ) ) ( not ( = ?auto_2404466 ?auto_2404472 ) ) ( not ( = ?auto_2404468 ?auto_2404469 ) ) ( not ( = ?auto_2404468 ?auto_2404470 ) ) ( not ( = ?auto_2404468 ?auto_2404471 ) ) ( not ( = ?auto_2404468 ?auto_2404472 ) ) ( not ( = ?auto_2404469 ?auto_2404470 ) ) ( not ( = ?auto_2404469 ?auto_2404471 ) ) ( not ( = ?auto_2404469 ?auto_2404472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2404470 ?auto_2404471 ?auto_2404472 )
      ( MAKE-9CRATE-VERIFY ?auto_2404463 ?auto_2404464 ?auto_2404465 ?auto_2404467 ?auto_2404466 ?auto_2404468 ?auto_2404469 ?auto_2404470 ?auto_2404471 ?auto_2404472 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404571 - SURFACE
      ?auto_2404572 - SURFACE
      ?auto_2404573 - SURFACE
      ?auto_2404575 - SURFACE
      ?auto_2404574 - SURFACE
      ?auto_2404576 - SURFACE
      ?auto_2404577 - SURFACE
      ?auto_2404578 - SURFACE
      ?auto_2404579 - SURFACE
      ?auto_2404580 - SURFACE
    )
    :vars
    (
      ?auto_2404586 - HOIST
      ?auto_2404583 - PLACE
      ?auto_2404582 - TRUCK
      ?auto_2404584 - PLACE
      ?auto_2404585 - HOIST
      ?auto_2404581 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404586 ?auto_2404583 ) ( SURFACE-AT ?auto_2404579 ?auto_2404583 ) ( CLEAR ?auto_2404579 ) ( IS-CRATE ?auto_2404580 ) ( not ( = ?auto_2404579 ?auto_2404580 ) ) ( AVAILABLE ?auto_2404586 ) ( ON ?auto_2404579 ?auto_2404578 ) ( not ( = ?auto_2404578 ?auto_2404579 ) ) ( not ( = ?auto_2404578 ?auto_2404580 ) ) ( TRUCK-AT ?auto_2404582 ?auto_2404584 ) ( not ( = ?auto_2404584 ?auto_2404583 ) ) ( HOIST-AT ?auto_2404585 ?auto_2404584 ) ( not ( = ?auto_2404586 ?auto_2404585 ) ) ( AVAILABLE ?auto_2404585 ) ( SURFACE-AT ?auto_2404580 ?auto_2404584 ) ( ON ?auto_2404580 ?auto_2404581 ) ( CLEAR ?auto_2404580 ) ( not ( = ?auto_2404579 ?auto_2404581 ) ) ( not ( = ?auto_2404580 ?auto_2404581 ) ) ( not ( = ?auto_2404578 ?auto_2404581 ) ) ( ON ?auto_2404572 ?auto_2404571 ) ( ON ?auto_2404573 ?auto_2404572 ) ( ON ?auto_2404575 ?auto_2404573 ) ( ON ?auto_2404574 ?auto_2404575 ) ( ON ?auto_2404576 ?auto_2404574 ) ( ON ?auto_2404577 ?auto_2404576 ) ( ON ?auto_2404578 ?auto_2404577 ) ( not ( = ?auto_2404571 ?auto_2404572 ) ) ( not ( = ?auto_2404571 ?auto_2404573 ) ) ( not ( = ?auto_2404571 ?auto_2404575 ) ) ( not ( = ?auto_2404571 ?auto_2404574 ) ) ( not ( = ?auto_2404571 ?auto_2404576 ) ) ( not ( = ?auto_2404571 ?auto_2404577 ) ) ( not ( = ?auto_2404571 ?auto_2404578 ) ) ( not ( = ?auto_2404571 ?auto_2404579 ) ) ( not ( = ?auto_2404571 ?auto_2404580 ) ) ( not ( = ?auto_2404571 ?auto_2404581 ) ) ( not ( = ?auto_2404572 ?auto_2404573 ) ) ( not ( = ?auto_2404572 ?auto_2404575 ) ) ( not ( = ?auto_2404572 ?auto_2404574 ) ) ( not ( = ?auto_2404572 ?auto_2404576 ) ) ( not ( = ?auto_2404572 ?auto_2404577 ) ) ( not ( = ?auto_2404572 ?auto_2404578 ) ) ( not ( = ?auto_2404572 ?auto_2404579 ) ) ( not ( = ?auto_2404572 ?auto_2404580 ) ) ( not ( = ?auto_2404572 ?auto_2404581 ) ) ( not ( = ?auto_2404573 ?auto_2404575 ) ) ( not ( = ?auto_2404573 ?auto_2404574 ) ) ( not ( = ?auto_2404573 ?auto_2404576 ) ) ( not ( = ?auto_2404573 ?auto_2404577 ) ) ( not ( = ?auto_2404573 ?auto_2404578 ) ) ( not ( = ?auto_2404573 ?auto_2404579 ) ) ( not ( = ?auto_2404573 ?auto_2404580 ) ) ( not ( = ?auto_2404573 ?auto_2404581 ) ) ( not ( = ?auto_2404575 ?auto_2404574 ) ) ( not ( = ?auto_2404575 ?auto_2404576 ) ) ( not ( = ?auto_2404575 ?auto_2404577 ) ) ( not ( = ?auto_2404575 ?auto_2404578 ) ) ( not ( = ?auto_2404575 ?auto_2404579 ) ) ( not ( = ?auto_2404575 ?auto_2404580 ) ) ( not ( = ?auto_2404575 ?auto_2404581 ) ) ( not ( = ?auto_2404574 ?auto_2404576 ) ) ( not ( = ?auto_2404574 ?auto_2404577 ) ) ( not ( = ?auto_2404574 ?auto_2404578 ) ) ( not ( = ?auto_2404574 ?auto_2404579 ) ) ( not ( = ?auto_2404574 ?auto_2404580 ) ) ( not ( = ?auto_2404574 ?auto_2404581 ) ) ( not ( = ?auto_2404576 ?auto_2404577 ) ) ( not ( = ?auto_2404576 ?auto_2404578 ) ) ( not ( = ?auto_2404576 ?auto_2404579 ) ) ( not ( = ?auto_2404576 ?auto_2404580 ) ) ( not ( = ?auto_2404576 ?auto_2404581 ) ) ( not ( = ?auto_2404577 ?auto_2404578 ) ) ( not ( = ?auto_2404577 ?auto_2404579 ) ) ( not ( = ?auto_2404577 ?auto_2404580 ) ) ( not ( = ?auto_2404577 ?auto_2404581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2404578 ?auto_2404579 ?auto_2404580 )
      ( MAKE-9CRATE-VERIFY ?auto_2404571 ?auto_2404572 ?auto_2404573 ?auto_2404575 ?auto_2404574 ?auto_2404576 ?auto_2404577 ?auto_2404578 ?auto_2404579 ?auto_2404580 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404680 - SURFACE
      ?auto_2404681 - SURFACE
      ?auto_2404682 - SURFACE
      ?auto_2404684 - SURFACE
      ?auto_2404683 - SURFACE
      ?auto_2404685 - SURFACE
      ?auto_2404686 - SURFACE
      ?auto_2404687 - SURFACE
      ?auto_2404688 - SURFACE
      ?auto_2404689 - SURFACE
    )
    :vars
    (
      ?auto_2404692 - HOIST
      ?auto_2404694 - PLACE
      ?auto_2404690 - PLACE
      ?auto_2404691 - HOIST
      ?auto_2404693 - SURFACE
      ?auto_2404695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404692 ?auto_2404694 ) ( SURFACE-AT ?auto_2404688 ?auto_2404694 ) ( CLEAR ?auto_2404688 ) ( IS-CRATE ?auto_2404689 ) ( not ( = ?auto_2404688 ?auto_2404689 ) ) ( AVAILABLE ?auto_2404692 ) ( ON ?auto_2404688 ?auto_2404687 ) ( not ( = ?auto_2404687 ?auto_2404688 ) ) ( not ( = ?auto_2404687 ?auto_2404689 ) ) ( not ( = ?auto_2404690 ?auto_2404694 ) ) ( HOIST-AT ?auto_2404691 ?auto_2404690 ) ( not ( = ?auto_2404692 ?auto_2404691 ) ) ( AVAILABLE ?auto_2404691 ) ( SURFACE-AT ?auto_2404689 ?auto_2404690 ) ( ON ?auto_2404689 ?auto_2404693 ) ( CLEAR ?auto_2404689 ) ( not ( = ?auto_2404688 ?auto_2404693 ) ) ( not ( = ?auto_2404689 ?auto_2404693 ) ) ( not ( = ?auto_2404687 ?auto_2404693 ) ) ( TRUCK-AT ?auto_2404695 ?auto_2404694 ) ( ON ?auto_2404681 ?auto_2404680 ) ( ON ?auto_2404682 ?auto_2404681 ) ( ON ?auto_2404684 ?auto_2404682 ) ( ON ?auto_2404683 ?auto_2404684 ) ( ON ?auto_2404685 ?auto_2404683 ) ( ON ?auto_2404686 ?auto_2404685 ) ( ON ?auto_2404687 ?auto_2404686 ) ( not ( = ?auto_2404680 ?auto_2404681 ) ) ( not ( = ?auto_2404680 ?auto_2404682 ) ) ( not ( = ?auto_2404680 ?auto_2404684 ) ) ( not ( = ?auto_2404680 ?auto_2404683 ) ) ( not ( = ?auto_2404680 ?auto_2404685 ) ) ( not ( = ?auto_2404680 ?auto_2404686 ) ) ( not ( = ?auto_2404680 ?auto_2404687 ) ) ( not ( = ?auto_2404680 ?auto_2404688 ) ) ( not ( = ?auto_2404680 ?auto_2404689 ) ) ( not ( = ?auto_2404680 ?auto_2404693 ) ) ( not ( = ?auto_2404681 ?auto_2404682 ) ) ( not ( = ?auto_2404681 ?auto_2404684 ) ) ( not ( = ?auto_2404681 ?auto_2404683 ) ) ( not ( = ?auto_2404681 ?auto_2404685 ) ) ( not ( = ?auto_2404681 ?auto_2404686 ) ) ( not ( = ?auto_2404681 ?auto_2404687 ) ) ( not ( = ?auto_2404681 ?auto_2404688 ) ) ( not ( = ?auto_2404681 ?auto_2404689 ) ) ( not ( = ?auto_2404681 ?auto_2404693 ) ) ( not ( = ?auto_2404682 ?auto_2404684 ) ) ( not ( = ?auto_2404682 ?auto_2404683 ) ) ( not ( = ?auto_2404682 ?auto_2404685 ) ) ( not ( = ?auto_2404682 ?auto_2404686 ) ) ( not ( = ?auto_2404682 ?auto_2404687 ) ) ( not ( = ?auto_2404682 ?auto_2404688 ) ) ( not ( = ?auto_2404682 ?auto_2404689 ) ) ( not ( = ?auto_2404682 ?auto_2404693 ) ) ( not ( = ?auto_2404684 ?auto_2404683 ) ) ( not ( = ?auto_2404684 ?auto_2404685 ) ) ( not ( = ?auto_2404684 ?auto_2404686 ) ) ( not ( = ?auto_2404684 ?auto_2404687 ) ) ( not ( = ?auto_2404684 ?auto_2404688 ) ) ( not ( = ?auto_2404684 ?auto_2404689 ) ) ( not ( = ?auto_2404684 ?auto_2404693 ) ) ( not ( = ?auto_2404683 ?auto_2404685 ) ) ( not ( = ?auto_2404683 ?auto_2404686 ) ) ( not ( = ?auto_2404683 ?auto_2404687 ) ) ( not ( = ?auto_2404683 ?auto_2404688 ) ) ( not ( = ?auto_2404683 ?auto_2404689 ) ) ( not ( = ?auto_2404683 ?auto_2404693 ) ) ( not ( = ?auto_2404685 ?auto_2404686 ) ) ( not ( = ?auto_2404685 ?auto_2404687 ) ) ( not ( = ?auto_2404685 ?auto_2404688 ) ) ( not ( = ?auto_2404685 ?auto_2404689 ) ) ( not ( = ?auto_2404685 ?auto_2404693 ) ) ( not ( = ?auto_2404686 ?auto_2404687 ) ) ( not ( = ?auto_2404686 ?auto_2404688 ) ) ( not ( = ?auto_2404686 ?auto_2404689 ) ) ( not ( = ?auto_2404686 ?auto_2404693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2404687 ?auto_2404688 ?auto_2404689 )
      ( MAKE-9CRATE-VERIFY ?auto_2404680 ?auto_2404681 ?auto_2404682 ?auto_2404684 ?auto_2404683 ?auto_2404685 ?auto_2404686 ?auto_2404687 ?auto_2404688 ?auto_2404689 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404789 - SURFACE
      ?auto_2404790 - SURFACE
      ?auto_2404791 - SURFACE
      ?auto_2404793 - SURFACE
      ?auto_2404792 - SURFACE
      ?auto_2404794 - SURFACE
      ?auto_2404795 - SURFACE
      ?auto_2404796 - SURFACE
      ?auto_2404797 - SURFACE
      ?auto_2404798 - SURFACE
    )
    :vars
    (
      ?auto_2404800 - HOIST
      ?auto_2404804 - PLACE
      ?auto_2404802 - PLACE
      ?auto_2404803 - HOIST
      ?auto_2404799 - SURFACE
      ?auto_2404801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404800 ?auto_2404804 ) ( IS-CRATE ?auto_2404798 ) ( not ( = ?auto_2404797 ?auto_2404798 ) ) ( not ( = ?auto_2404796 ?auto_2404797 ) ) ( not ( = ?auto_2404796 ?auto_2404798 ) ) ( not ( = ?auto_2404802 ?auto_2404804 ) ) ( HOIST-AT ?auto_2404803 ?auto_2404802 ) ( not ( = ?auto_2404800 ?auto_2404803 ) ) ( AVAILABLE ?auto_2404803 ) ( SURFACE-AT ?auto_2404798 ?auto_2404802 ) ( ON ?auto_2404798 ?auto_2404799 ) ( CLEAR ?auto_2404798 ) ( not ( = ?auto_2404797 ?auto_2404799 ) ) ( not ( = ?auto_2404798 ?auto_2404799 ) ) ( not ( = ?auto_2404796 ?auto_2404799 ) ) ( TRUCK-AT ?auto_2404801 ?auto_2404804 ) ( SURFACE-AT ?auto_2404796 ?auto_2404804 ) ( CLEAR ?auto_2404796 ) ( LIFTING ?auto_2404800 ?auto_2404797 ) ( IS-CRATE ?auto_2404797 ) ( ON ?auto_2404790 ?auto_2404789 ) ( ON ?auto_2404791 ?auto_2404790 ) ( ON ?auto_2404793 ?auto_2404791 ) ( ON ?auto_2404792 ?auto_2404793 ) ( ON ?auto_2404794 ?auto_2404792 ) ( ON ?auto_2404795 ?auto_2404794 ) ( ON ?auto_2404796 ?auto_2404795 ) ( not ( = ?auto_2404789 ?auto_2404790 ) ) ( not ( = ?auto_2404789 ?auto_2404791 ) ) ( not ( = ?auto_2404789 ?auto_2404793 ) ) ( not ( = ?auto_2404789 ?auto_2404792 ) ) ( not ( = ?auto_2404789 ?auto_2404794 ) ) ( not ( = ?auto_2404789 ?auto_2404795 ) ) ( not ( = ?auto_2404789 ?auto_2404796 ) ) ( not ( = ?auto_2404789 ?auto_2404797 ) ) ( not ( = ?auto_2404789 ?auto_2404798 ) ) ( not ( = ?auto_2404789 ?auto_2404799 ) ) ( not ( = ?auto_2404790 ?auto_2404791 ) ) ( not ( = ?auto_2404790 ?auto_2404793 ) ) ( not ( = ?auto_2404790 ?auto_2404792 ) ) ( not ( = ?auto_2404790 ?auto_2404794 ) ) ( not ( = ?auto_2404790 ?auto_2404795 ) ) ( not ( = ?auto_2404790 ?auto_2404796 ) ) ( not ( = ?auto_2404790 ?auto_2404797 ) ) ( not ( = ?auto_2404790 ?auto_2404798 ) ) ( not ( = ?auto_2404790 ?auto_2404799 ) ) ( not ( = ?auto_2404791 ?auto_2404793 ) ) ( not ( = ?auto_2404791 ?auto_2404792 ) ) ( not ( = ?auto_2404791 ?auto_2404794 ) ) ( not ( = ?auto_2404791 ?auto_2404795 ) ) ( not ( = ?auto_2404791 ?auto_2404796 ) ) ( not ( = ?auto_2404791 ?auto_2404797 ) ) ( not ( = ?auto_2404791 ?auto_2404798 ) ) ( not ( = ?auto_2404791 ?auto_2404799 ) ) ( not ( = ?auto_2404793 ?auto_2404792 ) ) ( not ( = ?auto_2404793 ?auto_2404794 ) ) ( not ( = ?auto_2404793 ?auto_2404795 ) ) ( not ( = ?auto_2404793 ?auto_2404796 ) ) ( not ( = ?auto_2404793 ?auto_2404797 ) ) ( not ( = ?auto_2404793 ?auto_2404798 ) ) ( not ( = ?auto_2404793 ?auto_2404799 ) ) ( not ( = ?auto_2404792 ?auto_2404794 ) ) ( not ( = ?auto_2404792 ?auto_2404795 ) ) ( not ( = ?auto_2404792 ?auto_2404796 ) ) ( not ( = ?auto_2404792 ?auto_2404797 ) ) ( not ( = ?auto_2404792 ?auto_2404798 ) ) ( not ( = ?auto_2404792 ?auto_2404799 ) ) ( not ( = ?auto_2404794 ?auto_2404795 ) ) ( not ( = ?auto_2404794 ?auto_2404796 ) ) ( not ( = ?auto_2404794 ?auto_2404797 ) ) ( not ( = ?auto_2404794 ?auto_2404798 ) ) ( not ( = ?auto_2404794 ?auto_2404799 ) ) ( not ( = ?auto_2404795 ?auto_2404796 ) ) ( not ( = ?auto_2404795 ?auto_2404797 ) ) ( not ( = ?auto_2404795 ?auto_2404798 ) ) ( not ( = ?auto_2404795 ?auto_2404799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2404796 ?auto_2404797 ?auto_2404798 )
      ( MAKE-9CRATE-VERIFY ?auto_2404789 ?auto_2404790 ?auto_2404791 ?auto_2404793 ?auto_2404792 ?auto_2404794 ?auto_2404795 ?auto_2404796 ?auto_2404797 ?auto_2404798 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2404898 - SURFACE
      ?auto_2404899 - SURFACE
      ?auto_2404900 - SURFACE
      ?auto_2404902 - SURFACE
      ?auto_2404901 - SURFACE
      ?auto_2404903 - SURFACE
      ?auto_2404904 - SURFACE
      ?auto_2404905 - SURFACE
      ?auto_2404906 - SURFACE
      ?auto_2404907 - SURFACE
    )
    :vars
    (
      ?auto_2404913 - HOIST
      ?auto_2404909 - PLACE
      ?auto_2404911 - PLACE
      ?auto_2404908 - HOIST
      ?auto_2404910 - SURFACE
      ?auto_2404912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2404913 ?auto_2404909 ) ( IS-CRATE ?auto_2404907 ) ( not ( = ?auto_2404906 ?auto_2404907 ) ) ( not ( = ?auto_2404905 ?auto_2404906 ) ) ( not ( = ?auto_2404905 ?auto_2404907 ) ) ( not ( = ?auto_2404911 ?auto_2404909 ) ) ( HOIST-AT ?auto_2404908 ?auto_2404911 ) ( not ( = ?auto_2404913 ?auto_2404908 ) ) ( AVAILABLE ?auto_2404908 ) ( SURFACE-AT ?auto_2404907 ?auto_2404911 ) ( ON ?auto_2404907 ?auto_2404910 ) ( CLEAR ?auto_2404907 ) ( not ( = ?auto_2404906 ?auto_2404910 ) ) ( not ( = ?auto_2404907 ?auto_2404910 ) ) ( not ( = ?auto_2404905 ?auto_2404910 ) ) ( TRUCK-AT ?auto_2404912 ?auto_2404909 ) ( SURFACE-AT ?auto_2404905 ?auto_2404909 ) ( CLEAR ?auto_2404905 ) ( IS-CRATE ?auto_2404906 ) ( AVAILABLE ?auto_2404913 ) ( IN ?auto_2404906 ?auto_2404912 ) ( ON ?auto_2404899 ?auto_2404898 ) ( ON ?auto_2404900 ?auto_2404899 ) ( ON ?auto_2404902 ?auto_2404900 ) ( ON ?auto_2404901 ?auto_2404902 ) ( ON ?auto_2404903 ?auto_2404901 ) ( ON ?auto_2404904 ?auto_2404903 ) ( ON ?auto_2404905 ?auto_2404904 ) ( not ( = ?auto_2404898 ?auto_2404899 ) ) ( not ( = ?auto_2404898 ?auto_2404900 ) ) ( not ( = ?auto_2404898 ?auto_2404902 ) ) ( not ( = ?auto_2404898 ?auto_2404901 ) ) ( not ( = ?auto_2404898 ?auto_2404903 ) ) ( not ( = ?auto_2404898 ?auto_2404904 ) ) ( not ( = ?auto_2404898 ?auto_2404905 ) ) ( not ( = ?auto_2404898 ?auto_2404906 ) ) ( not ( = ?auto_2404898 ?auto_2404907 ) ) ( not ( = ?auto_2404898 ?auto_2404910 ) ) ( not ( = ?auto_2404899 ?auto_2404900 ) ) ( not ( = ?auto_2404899 ?auto_2404902 ) ) ( not ( = ?auto_2404899 ?auto_2404901 ) ) ( not ( = ?auto_2404899 ?auto_2404903 ) ) ( not ( = ?auto_2404899 ?auto_2404904 ) ) ( not ( = ?auto_2404899 ?auto_2404905 ) ) ( not ( = ?auto_2404899 ?auto_2404906 ) ) ( not ( = ?auto_2404899 ?auto_2404907 ) ) ( not ( = ?auto_2404899 ?auto_2404910 ) ) ( not ( = ?auto_2404900 ?auto_2404902 ) ) ( not ( = ?auto_2404900 ?auto_2404901 ) ) ( not ( = ?auto_2404900 ?auto_2404903 ) ) ( not ( = ?auto_2404900 ?auto_2404904 ) ) ( not ( = ?auto_2404900 ?auto_2404905 ) ) ( not ( = ?auto_2404900 ?auto_2404906 ) ) ( not ( = ?auto_2404900 ?auto_2404907 ) ) ( not ( = ?auto_2404900 ?auto_2404910 ) ) ( not ( = ?auto_2404902 ?auto_2404901 ) ) ( not ( = ?auto_2404902 ?auto_2404903 ) ) ( not ( = ?auto_2404902 ?auto_2404904 ) ) ( not ( = ?auto_2404902 ?auto_2404905 ) ) ( not ( = ?auto_2404902 ?auto_2404906 ) ) ( not ( = ?auto_2404902 ?auto_2404907 ) ) ( not ( = ?auto_2404902 ?auto_2404910 ) ) ( not ( = ?auto_2404901 ?auto_2404903 ) ) ( not ( = ?auto_2404901 ?auto_2404904 ) ) ( not ( = ?auto_2404901 ?auto_2404905 ) ) ( not ( = ?auto_2404901 ?auto_2404906 ) ) ( not ( = ?auto_2404901 ?auto_2404907 ) ) ( not ( = ?auto_2404901 ?auto_2404910 ) ) ( not ( = ?auto_2404903 ?auto_2404904 ) ) ( not ( = ?auto_2404903 ?auto_2404905 ) ) ( not ( = ?auto_2404903 ?auto_2404906 ) ) ( not ( = ?auto_2404903 ?auto_2404907 ) ) ( not ( = ?auto_2404903 ?auto_2404910 ) ) ( not ( = ?auto_2404904 ?auto_2404905 ) ) ( not ( = ?auto_2404904 ?auto_2404906 ) ) ( not ( = ?auto_2404904 ?auto_2404907 ) ) ( not ( = ?auto_2404904 ?auto_2404910 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2404905 ?auto_2404906 ?auto_2404907 )
      ( MAKE-9CRATE-VERIFY ?auto_2404898 ?auto_2404899 ?auto_2404900 ?auto_2404902 ?auto_2404901 ?auto_2404903 ?auto_2404904 ?auto_2404905 ?auto_2404906 ?auto_2404907 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2410463 - SURFACE
      ?auto_2410464 - SURFACE
      ?auto_2410465 - SURFACE
      ?auto_2410467 - SURFACE
      ?auto_2410466 - SURFACE
      ?auto_2410468 - SURFACE
      ?auto_2410469 - SURFACE
      ?auto_2410470 - SURFACE
      ?auto_2410471 - SURFACE
      ?auto_2410472 - SURFACE
      ?auto_2410473 - SURFACE
    )
    :vars
    (
      ?auto_2410474 - HOIST
      ?auto_2410475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2410474 ?auto_2410475 ) ( SURFACE-AT ?auto_2410472 ?auto_2410475 ) ( CLEAR ?auto_2410472 ) ( LIFTING ?auto_2410474 ?auto_2410473 ) ( IS-CRATE ?auto_2410473 ) ( not ( = ?auto_2410472 ?auto_2410473 ) ) ( ON ?auto_2410464 ?auto_2410463 ) ( ON ?auto_2410465 ?auto_2410464 ) ( ON ?auto_2410467 ?auto_2410465 ) ( ON ?auto_2410466 ?auto_2410467 ) ( ON ?auto_2410468 ?auto_2410466 ) ( ON ?auto_2410469 ?auto_2410468 ) ( ON ?auto_2410470 ?auto_2410469 ) ( ON ?auto_2410471 ?auto_2410470 ) ( ON ?auto_2410472 ?auto_2410471 ) ( not ( = ?auto_2410463 ?auto_2410464 ) ) ( not ( = ?auto_2410463 ?auto_2410465 ) ) ( not ( = ?auto_2410463 ?auto_2410467 ) ) ( not ( = ?auto_2410463 ?auto_2410466 ) ) ( not ( = ?auto_2410463 ?auto_2410468 ) ) ( not ( = ?auto_2410463 ?auto_2410469 ) ) ( not ( = ?auto_2410463 ?auto_2410470 ) ) ( not ( = ?auto_2410463 ?auto_2410471 ) ) ( not ( = ?auto_2410463 ?auto_2410472 ) ) ( not ( = ?auto_2410463 ?auto_2410473 ) ) ( not ( = ?auto_2410464 ?auto_2410465 ) ) ( not ( = ?auto_2410464 ?auto_2410467 ) ) ( not ( = ?auto_2410464 ?auto_2410466 ) ) ( not ( = ?auto_2410464 ?auto_2410468 ) ) ( not ( = ?auto_2410464 ?auto_2410469 ) ) ( not ( = ?auto_2410464 ?auto_2410470 ) ) ( not ( = ?auto_2410464 ?auto_2410471 ) ) ( not ( = ?auto_2410464 ?auto_2410472 ) ) ( not ( = ?auto_2410464 ?auto_2410473 ) ) ( not ( = ?auto_2410465 ?auto_2410467 ) ) ( not ( = ?auto_2410465 ?auto_2410466 ) ) ( not ( = ?auto_2410465 ?auto_2410468 ) ) ( not ( = ?auto_2410465 ?auto_2410469 ) ) ( not ( = ?auto_2410465 ?auto_2410470 ) ) ( not ( = ?auto_2410465 ?auto_2410471 ) ) ( not ( = ?auto_2410465 ?auto_2410472 ) ) ( not ( = ?auto_2410465 ?auto_2410473 ) ) ( not ( = ?auto_2410467 ?auto_2410466 ) ) ( not ( = ?auto_2410467 ?auto_2410468 ) ) ( not ( = ?auto_2410467 ?auto_2410469 ) ) ( not ( = ?auto_2410467 ?auto_2410470 ) ) ( not ( = ?auto_2410467 ?auto_2410471 ) ) ( not ( = ?auto_2410467 ?auto_2410472 ) ) ( not ( = ?auto_2410467 ?auto_2410473 ) ) ( not ( = ?auto_2410466 ?auto_2410468 ) ) ( not ( = ?auto_2410466 ?auto_2410469 ) ) ( not ( = ?auto_2410466 ?auto_2410470 ) ) ( not ( = ?auto_2410466 ?auto_2410471 ) ) ( not ( = ?auto_2410466 ?auto_2410472 ) ) ( not ( = ?auto_2410466 ?auto_2410473 ) ) ( not ( = ?auto_2410468 ?auto_2410469 ) ) ( not ( = ?auto_2410468 ?auto_2410470 ) ) ( not ( = ?auto_2410468 ?auto_2410471 ) ) ( not ( = ?auto_2410468 ?auto_2410472 ) ) ( not ( = ?auto_2410468 ?auto_2410473 ) ) ( not ( = ?auto_2410469 ?auto_2410470 ) ) ( not ( = ?auto_2410469 ?auto_2410471 ) ) ( not ( = ?auto_2410469 ?auto_2410472 ) ) ( not ( = ?auto_2410469 ?auto_2410473 ) ) ( not ( = ?auto_2410470 ?auto_2410471 ) ) ( not ( = ?auto_2410470 ?auto_2410472 ) ) ( not ( = ?auto_2410470 ?auto_2410473 ) ) ( not ( = ?auto_2410471 ?auto_2410472 ) ) ( not ( = ?auto_2410471 ?auto_2410473 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2410472 ?auto_2410473 )
      ( MAKE-10CRATE-VERIFY ?auto_2410463 ?auto_2410464 ?auto_2410465 ?auto_2410467 ?auto_2410466 ?auto_2410468 ?auto_2410469 ?auto_2410470 ?auto_2410471 ?auto_2410472 ?auto_2410473 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2410557 - SURFACE
      ?auto_2410558 - SURFACE
      ?auto_2410559 - SURFACE
      ?auto_2410561 - SURFACE
      ?auto_2410560 - SURFACE
      ?auto_2410562 - SURFACE
      ?auto_2410563 - SURFACE
      ?auto_2410564 - SURFACE
      ?auto_2410565 - SURFACE
      ?auto_2410566 - SURFACE
      ?auto_2410567 - SURFACE
    )
    :vars
    (
      ?auto_2410569 - HOIST
      ?auto_2410568 - PLACE
      ?auto_2410570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2410569 ?auto_2410568 ) ( SURFACE-AT ?auto_2410566 ?auto_2410568 ) ( CLEAR ?auto_2410566 ) ( IS-CRATE ?auto_2410567 ) ( not ( = ?auto_2410566 ?auto_2410567 ) ) ( TRUCK-AT ?auto_2410570 ?auto_2410568 ) ( AVAILABLE ?auto_2410569 ) ( IN ?auto_2410567 ?auto_2410570 ) ( ON ?auto_2410566 ?auto_2410565 ) ( not ( = ?auto_2410565 ?auto_2410566 ) ) ( not ( = ?auto_2410565 ?auto_2410567 ) ) ( ON ?auto_2410558 ?auto_2410557 ) ( ON ?auto_2410559 ?auto_2410558 ) ( ON ?auto_2410561 ?auto_2410559 ) ( ON ?auto_2410560 ?auto_2410561 ) ( ON ?auto_2410562 ?auto_2410560 ) ( ON ?auto_2410563 ?auto_2410562 ) ( ON ?auto_2410564 ?auto_2410563 ) ( ON ?auto_2410565 ?auto_2410564 ) ( not ( = ?auto_2410557 ?auto_2410558 ) ) ( not ( = ?auto_2410557 ?auto_2410559 ) ) ( not ( = ?auto_2410557 ?auto_2410561 ) ) ( not ( = ?auto_2410557 ?auto_2410560 ) ) ( not ( = ?auto_2410557 ?auto_2410562 ) ) ( not ( = ?auto_2410557 ?auto_2410563 ) ) ( not ( = ?auto_2410557 ?auto_2410564 ) ) ( not ( = ?auto_2410557 ?auto_2410565 ) ) ( not ( = ?auto_2410557 ?auto_2410566 ) ) ( not ( = ?auto_2410557 ?auto_2410567 ) ) ( not ( = ?auto_2410558 ?auto_2410559 ) ) ( not ( = ?auto_2410558 ?auto_2410561 ) ) ( not ( = ?auto_2410558 ?auto_2410560 ) ) ( not ( = ?auto_2410558 ?auto_2410562 ) ) ( not ( = ?auto_2410558 ?auto_2410563 ) ) ( not ( = ?auto_2410558 ?auto_2410564 ) ) ( not ( = ?auto_2410558 ?auto_2410565 ) ) ( not ( = ?auto_2410558 ?auto_2410566 ) ) ( not ( = ?auto_2410558 ?auto_2410567 ) ) ( not ( = ?auto_2410559 ?auto_2410561 ) ) ( not ( = ?auto_2410559 ?auto_2410560 ) ) ( not ( = ?auto_2410559 ?auto_2410562 ) ) ( not ( = ?auto_2410559 ?auto_2410563 ) ) ( not ( = ?auto_2410559 ?auto_2410564 ) ) ( not ( = ?auto_2410559 ?auto_2410565 ) ) ( not ( = ?auto_2410559 ?auto_2410566 ) ) ( not ( = ?auto_2410559 ?auto_2410567 ) ) ( not ( = ?auto_2410561 ?auto_2410560 ) ) ( not ( = ?auto_2410561 ?auto_2410562 ) ) ( not ( = ?auto_2410561 ?auto_2410563 ) ) ( not ( = ?auto_2410561 ?auto_2410564 ) ) ( not ( = ?auto_2410561 ?auto_2410565 ) ) ( not ( = ?auto_2410561 ?auto_2410566 ) ) ( not ( = ?auto_2410561 ?auto_2410567 ) ) ( not ( = ?auto_2410560 ?auto_2410562 ) ) ( not ( = ?auto_2410560 ?auto_2410563 ) ) ( not ( = ?auto_2410560 ?auto_2410564 ) ) ( not ( = ?auto_2410560 ?auto_2410565 ) ) ( not ( = ?auto_2410560 ?auto_2410566 ) ) ( not ( = ?auto_2410560 ?auto_2410567 ) ) ( not ( = ?auto_2410562 ?auto_2410563 ) ) ( not ( = ?auto_2410562 ?auto_2410564 ) ) ( not ( = ?auto_2410562 ?auto_2410565 ) ) ( not ( = ?auto_2410562 ?auto_2410566 ) ) ( not ( = ?auto_2410562 ?auto_2410567 ) ) ( not ( = ?auto_2410563 ?auto_2410564 ) ) ( not ( = ?auto_2410563 ?auto_2410565 ) ) ( not ( = ?auto_2410563 ?auto_2410566 ) ) ( not ( = ?auto_2410563 ?auto_2410567 ) ) ( not ( = ?auto_2410564 ?auto_2410565 ) ) ( not ( = ?auto_2410564 ?auto_2410566 ) ) ( not ( = ?auto_2410564 ?auto_2410567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2410565 ?auto_2410566 ?auto_2410567 )
      ( MAKE-10CRATE-VERIFY ?auto_2410557 ?auto_2410558 ?auto_2410559 ?auto_2410561 ?auto_2410560 ?auto_2410562 ?auto_2410563 ?auto_2410564 ?auto_2410565 ?auto_2410566 ?auto_2410567 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2410662 - SURFACE
      ?auto_2410663 - SURFACE
      ?auto_2410664 - SURFACE
      ?auto_2410666 - SURFACE
      ?auto_2410665 - SURFACE
      ?auto_2410667 - SURFACE
      ?auto_2410668 - SURFACE
      ?auto_2410669 - SURFACE
      ?auto_2410670 - SURFACE
      ?auto_2410671 - SURFACE
      ?auto_2410672 - SURFACE
    )
    :vars
    (
      ?auto_2410674 - HOIST
      ?auto_2410676 - PLACE
      ?auto_2410675 - TRUCK
      ?auto_2410673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2410674 ?auto_2410676 ) ( SURFACE-AT ?auto_2410671 ?auto_2410676 ) ( CLEAR ?auto_2410671 ) ( IS-CRATE ?auto_2410672 ) ( not ( = ?auto_2410671 ?auto_2410672 ) ) ( AVAILABLE ?auto_2410674 ) ( IN ?auto_2410672 ?auto_2410675 ) ( ON ?auto_2410671 ?auto_2410670 ) ( not ( = ?auto_2410670 ?auto_2410671 ) ) ( not ( = ?auto_2410670 ?auto_2410672 ) ) ( TRUCK-AT ?auto_2410675 ?auto_2410673 ) ( not ( = ?auto_2410673 ?auto_2410676 ) ) ( ON ?auto_2410663 ?auto_2410662 ) ( ON ?auto_2410664 ?auto_2410663 ) ( ON ?auto_2410666 ?auto_2410664 ) ( ON ?auto_2410665 ?auto_2410666 ) ( ON ?auto_2410667 ?auto_2410665 ) ( ON ?auto_2410668 ?auto_2410667 ) ( ON ?auto_2410669 ?auto_2410668 ) ( ON ?auto_2410670 ?auto_2410669 ) ( not ( = ?auto_2410662 ?auto_2410663 ) ) ( not ( = ?auto_2410662 ?auto_2410664 ) ) ( not ( = ?auto_2410662 ?auto_2410666 ) ) ( not ( = ?auto_2410662 ?auto_2410665 ) ) ( not ( = ?auto_2410662 ?auto_2410667 ) ) ( not ( = ?auto_2410662 ?auto_2410668 ) ) ( not ( = ?auto_2410662 ?auto_2410669 ) ) ( not ( = ?auto_2410662 ?auto_2410670 ) ) ( not ( = ?auto_2410662 ?auto_2410671 ) ) ( not ( = ?auto_2410662 ?auto_2410672 ) ) ( not ( = ?auto_2410663 ?auto_2410664 ) ) ( not ( = ?auto_2410663 ?auto_2410666 ) ) ( not ( = ?auto_2410663 ?auto_2410665 ) ) ( not ( = ?auto_2410663 ?auto_2410667 ) ) ( not ( = ?auto_2410663 ?auto_2410668 ) ) ( not ( = ?auto_2410663 ?auto_2410669 ) ) ( not ( = ?auto_2410663 ?auto_2410670 ) ) ( not ( = ?auto_2410663 ?auto_2410671 ) ) ( not ( = ?auto_2410663 ?auto_2410672 ) ) ( not ( = ?auto_2410664 ?auto_2410666 ) ) ( not ( = ?auto_2410664 ?auto_2410665 ) ) ( not ( = ?auto_2410664 ?auto_2410667 ) ) ( not ( = ?auto_2410664 ?auto_2410668 ) ) ( not ( = ?auto_2410664 ?auto_2410669 ) ) ( not ( = ?auto_2410664 ?auto_2410670 ) ) ( not ( = ?auto_2410664 ?auto_2410671 ) ) ( not ( = ?auto_2410664 ?auto_2410672 ) ) ( not ( = ?auto_2410666 ?auto_2410665 ) ) ( not ( = ?auto_2410666 ?auto_2410667 ) ) ( not ( = ?auto_2410666 ?auto_2410668 ) ) ( not ( = ?auto_2410666 ?auto_2410669 ) ) ( not ( = ?auto_2410666 ?auto_2410670 ) ) ( not ( = ?auto_2410666 ?auto_2410671 ) ) ( not ( = ?auto_2410666 ?auto_2410672 ) ) ( not ( = ?auto_2410665 ?auto_2410667 ) ) ( not ( = ?auto_2410665 ?auto_2410668 ) ) ( not ( = ?auto_2410665 ?auto_2410669 ) ) ( not ( = ?auto_2410665 ?auto_2410670 ) ) ( not ( = ?auto_2410665 ?auto_2410671 ) ) ( not ( = ?auto_2410665 ?auto_2410672 ) ) ( not ( = ?auto_2410667 ?auto_2410668 ) ) ( not ( = ?auto_2410667 ?auto_2410669 ) ) ( not ( = ?auto_2410667 ?auto_2410670 ) ) ( not ( = ?auto_2410667 ?auto_2410671 ) ) ( not ( = ?auto_2410667 ?auto_2410672 ) ) ( not ( = ?auto_2410668 ?auto_2410669 ) ) ( not ( = ?auto_2410668 ?auto_2410670 ) ) ( not ( = ?auto_2410668 ?auto_2410671 ) ) ( not ( = ?auto_2410668 ?auto_2410672 ) ) ( not ( = ?auto_2410669 ?auto_2410670 ) ) ( not ( = ?auto_2410669 ?auto_2410671 ) ) ( not ( = ?auto_2410669 ?auto_2410672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2410670 ?auto_2410671 ?auto_2410672 )
      ( MAKE-10CRATE-VERIFY ?auto_2410662 ?auto_2410663 ?auto_2410664 ?auto_2410666 ?auto_2410665 ?auto_2410667 ?auto_2410668 ?auto_2410669 ?auto_2410670 ?auto_2410671 ?auto_2410672 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2410777 - SURFACE
      ?auto_2410778 - SURFACE
      ?auto_2410779 - SURFACE
      ?auto_2410781 - SURFACE
      ?auto_2410780 - SURFACE
      ?auto_2410782 - SURFACE
      ?auto_2410783 - SURFACE
      ?auto_2410784 - SURFACE
      ?auto_2410785 - SURFACE
      ?auto_2410786 - SURFACE
      ?auto_2410787 - SURFACE
    )
    :vars
    (
      ?auto_2410790 - HOIST
      ?auto_2410788 - PLACE
      ?auto_2410792 - TRUCK
      ?auto_2410789 - PLACE
      ?auto_2410791 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2410790 ?auto_2410788 ) ( SURFACE-AT ?auto_2410786 ?auto_2410788 ) ( CLEAR ?auto_2410786 ) ( IS-CRATE ?auto_2410787 ) ( not ( = ?auto_2410786 ?auto_2410787 ) ) ( AVAILABLE ?auto_2410790 ) ( ON ?auto_2410786 ?auto_2410785 ) ( not ( = ?auto_2410785 ?auto_2410786 ) ) ( not ( = ?auto_2410785 ?auto_2410787 ) ) ( TRUCK-AT ?auto_2410792 ?auto_2410789 ) ( not ( = ?auto_2410789 ?auto_2410788 ) ) ( HOIST-AT ?auto_2410791 ?auto_2410789 ) ( LIFTING ?auto_2410791 ?auto_2410787 ) ( not ( = ?auto_2410790 ?auto_2410791 ) ) ( ON ?auto_2410778 ?auto_2410777 ) ( ON ?auto_2410779 ?auto_2410778 ) ( ON ?auto_2410781 ?auto_2410779 ) ( ON ?auto_2410780 ?auto_2410781 ) ( ON ?auto_2410782 ?auto_2410780 ) ( ON ?auto_2410783 ?auto_2410782 ) ( ON ?auto_2410784 ?auto_2410783 ) ( ON ?auto_2410785 ?auto_2410784 ) ( not ( = ?auto_2410777 ?auto_2410778 ) ) ( not ( = ?auto_2410777 ?auto_2410779 ) ) ( not ( = ?auto_2410777 ?auto_2410781 ) ) ( not ( = ?auto_2410777 ?auto_2410780 ) ) ( not ( = ?auto_2410777 ?auto_2410782 ) ) ( not ( = ?auto_2410777 ?auto_2410783 ) ) ( not ( = ?auto_2410777 ?auto_2410784 ) ) ( not ( = ?auto_2410777 ?auto_2410785 ) ) ( not ( = ?auto_2410777 ?auto_2410786 ) ) ( not ( = ?auto_2410777 ?auto_2410787 ) ) ( not ( = ?auto_2410778 ?auto_2410779 ) ) ( not ( = ?auto_2410778 ?auto_2410781 ) ) ( not ( = ?auto_2410778 ?auto_2410780 ) ) ( not ( = ?auto_2410778 ?auto_2410782 ) ) ( not ( = ?auto_2410778 ?auto_2410783 ) ) ( not ( = ?auto_2410778 ?auto_2410784 ) ) ( not ( = ?auto_2410778 ?auto_2410785 ) ) ( not ( = ?auto_2410778 ?auto_2410786 ) ) ( not ( = ?auto_2410778 ?auto_2410787 ) ) ( not ( = ?auto_2410779 ?auto_2410781 ) ) ( not ( = ?auto_2410779 ?auto_2410780 ) ) ( not ( = ?auto_2410779 ?auto_2410782 ) ) ( not ( = ?auto_2410779 ?auto_2410783 ) ) ( not ( = ?auto_2410779 ?auto_2410784 ) ) ( not ( = ?auto_2410779 ?auto_2410785 ) ) ( not ( = ?auto_2410779 ?auto_2410786 ) ) ( not ( = ?auto_2410779 ?auto_2410787 ) ) ( not ( = ?auto_2410781 ?auto_2410780 ) ) ( not ( = ?auto_2410781 ?auto_2410782 ) ) ( not ( = ?auto_2410781 ?auto_2410783 ) ) ( not ( = ?auto_2410781 ?auto_2410784 ) ) ( not ( = ?auto_2410781 ?auto_2410785 ) ) ( not ( = ?auto_2410781 ?auto_2410786 ) ) ( not ( = ?auto_2410781 ?auto_2410787 ) ) ( not ( = ?auto_2410780 ?auto_2410782 ) ) ( not ( = ?auto_2410780 ?auto_2410783 ) ) ( not ( = ?auto_2410780 ?auto_2410784 ) ) ( not ( = ?auto_2410780 ?auto_2410785 ) ) ( not ( = ?auto_2410780 ?auto_2410786 ) ) ( not ( = ?auto_2410780 ?auto_2410787 ) ) ( not ( = ?auto_2410782 ?auto_2410783 ) ) ( not ( = ?auto_2410782 ?auto_2410784 ) ) ( not ( = ?auto_2410782 ?auto_2410785 ) ) ( not ( = ?auto_2410782 ?auto_2410786 ) ) ( not ( = ?auto_2410782 ?auto_2410787 ) ) ( not ( = ?auto_2410783 ?auto_2410784 ) ) ( not ( = ?auto_2410783 ?auto_2410785 ) ) ( not ( = ?auto_2410783 ?auto_2410786 ) ) ( not ( = ?auto_2410783 ?auto_2410787 ) ) ( not ( = ?auto_2410784 ?auto_2410785 ) ) ( not ( = ?auto_2410784 ?auto_2410786 ) ) ( not ( = ?auto_2410784 ?auto_2410787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2410785 ?auto_2410786 ?auto_2410787 )
      ( MAKE-10CRATE-VERIFY ?auto_2410777 ?auto_2410778 ?auto_2410779 ?auto_2410781 ?auto_2410780 ?auto_2410782 ?auto_2410783 ?auto_2410784 ?auto_2410785 ?auto_2410786 ?auto_2410787 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2410902 - SURFACE
      ?auto_2410903 - SURFACE
      ?auto_2410904 - SURFACE
      ?auto_2410906 - SURFACE
      ?auto_2410905 - SURFACE
      ?auto_2410907 - SURFACE
      ?auto_2410908 - SURFACE
      ?auto_2410909 - SURFACE
      ?auto_2410910 - SURFACE
      ?auto_2410911 - SURFACE
      ?auto_2410912 - SURFACE
    )
    :vars
    (
      ?auto_2410916 - HOIST
      ?auto_2410914 - PLACE
      ?auto_2410917 - TRUCK
      ?auto_2410913 - PLACE
      ?auto_2410915 - HOIST
      ?auto_2410918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2410916 ?auto_2410914 ) ( SURFACE-AT ?auto_2410911 ?auto_2410914 ) ( CLEAR ?auto_2410911 ) ( IS-CRATE ?auto_2410912 ) ( not ( = ?auto_2410911 ?auto_2410912 ) ) ( AVAILABLE ?auto_2410916 ) ( ON ?auto_2410911 ?auto_2410910 ) ( not ( = ?auto_2410910 ?auto_2410911 ) ) ( not ( = ?auto_2410910 ?auto_2410912 ) ) ( TRUCK-AT ?auto_2410917 ?auto_2410913 ) ( not ( = ?auto_2410913 ?auto_2410914 ) ) ( HOIST-AT ?auto_2410915 ?auto_2410913 ) ( not ( = ?auto_2410916 ?auto_2410915 ) ) ( AVAILABLE ?auto_2410915 ) ( SURFACE-AT ?auto_2410912 ?auto_2410913 ) ( ON ?auto_2410912 ?auto_2410918 ) ( CLEAR ?auto_2410912 ) ( not ( = ?auto_2410911 ?auto_2410918 ) ) ( not ( = ?auto_2410912 ?auto_2410918 ) ) ( not ( = ?auto_2410910 ?auto_2410918 ) ) ( ON ?auto_2410903 ?auto_2410902 ) ( ON ?auto_2410904 ?auto_2410903 ) ( ON ?auto_2410906 ?auto_2410904 ) ( ON ?auto_2410905 ?auto_2410906 ) ( ON ?auto_2410907 ?auto_2410905 ) ( ON ?auto_2410908 ?auto_2410907 ) ( ON ?auto_2410909 ?auto_2410908 ) ( ON ?auto_2410910 ?auto_2410909 ) ( not ( = ?auto_2410902 ?auto_2410903 ) ) ( not ( = ?auto_2410902 ?auto_2410904 ) ) ( not ( = ?auto_2410902 ?auto_2410906 ) ) ( not ( = ?auto_2410902 ?auto_2410905 ) ) ( not ( = ?auto_2410902 ?auto_2410907 ) ) ( not ( = ?auto_2410902 ?auto_2410908 ) ) ( not ( = ?auto_2410902 ?auto_2410909 ) ) ( not ( = ?auto_2410902 ?auto_2410910 ) ) ( not ( = ?auto_2410902 ?auto_2410911 ) ) ( not ( = ?auto_2410902 ?auto_2410912 ) ) ( not ( = ?auto_2410902 ?auto_2410918 ) ) ( not ( = ?auto_2410903 ?auto_2410904 ) ) ( not ( = ?auto_2410903 ?auto_2410906 ) ) ( not ( = ?auto_2410903 ?auto_2410905 ) ) ( not ( = ?auto_2410903 ?auto_2410907 ) ) ( not ( = ?auto_2410903 ?auto_2410908 ) ) ( not ( = ?auto_2410903 ?auto_2410909 ) ) ( not ( = ?auto_2410903 ?auto_2410910 ) ) ( not ( = ?auto_2410903 ?auto_2410911 ) ) ( not ( = ?auto_2410903 ?auto_2410912 ) ) ( not ( = ?auto_2410903 ?auto_2410918 ) ) ( not ( = ?auto_2410904 ?auto_2410906 ) ) ( not ( = ?auto_2410904 ?auto_2410905 ) ) ( not ( = ?auto_2410904 ?auto_2410907 ) ) ( not ( = ?auto_2410904 ?auto_2410908 ) ) ( not ( = ?auto_2410904 ?auto_2410909 ) ) ( not ( = ?auto_2410904 ?auto_2410910 ) ) ( not ( = ?auto_2410904 ?auto_2410911 ) ) ( not ( = ?auto_2410904 ?auto_2410912 ) ) ( not ( = ?auto_2410904 ?auto_2410918 ) ) ( not ( = ?auto_2410906 ?auto_2410905 ) ) ( not ( = ?auto_2410906 ?auto_2410907 ) ) ( not ( = ?auto_2410906 ?auto_2410908 ) ) ( not ( = ?auto_2410906 ?auto_2410909 ) ) ( not ( = ?auto_2410906 ?auto_2410910 ) ) ( not ( = ?auto_2410906 ?auto_2410911 ) ) ( not ( = ?auto_2410906 ?auto_2410912 ) ) ( not ( = ?auto_2410906 ?auto_2410918 ) ) ( not ( = ?auto_2410905 ?auto_2410907 ) ) ( not ( = ?auto_2410905 ?auto_2410908 ) ) ( not ( = ?auto_2410905 ?auto_2410909 ) ) ( not ( = ?auto_2410905 ?auto_2410910 ) ) ( not ( = ?auto_2410905 ?auto_2410911 ) ) ( not ( = ?auto_2410905 ?auto_2410912 ) ) ( not ( = ?auto_2410905 ?auto_2410918 ) ) ( not ( = ?auto_2410907 ?auto_2410908 ) ) ( not ( = ?auto_2410907 ?auto_2410909 ) ) ( not ( = ?auto_2410907 ?auto_2410910 ) ) ( not ( = ?auto_2410907 ?auto_2410911 ) ) ( not ( = ?auto_2410907 ?auto_2410912 ) ) ( not ( = ?auto_2410907 ?auto_2410918 ) ) ( not ( = ?auto_2410908 ?auto_2410909 ) ) ( not ( = ?auto_2410908 ?auto_2410910 ) ) ( not ( = ?auto_2410908 ?auto_2410911 ) ) ( not ( = ?auto_2410908 ?auto_2410912 ) ) ( not ( = ?auto_2410908 ?auto_2410918 ) ) ( not ( = ?auto_2410909 ?auto_2410910 ) ) ( not ( = ?auto_2410909 ?auto_2410911 ) ) ( not ( = ?auto_2410909 ?auto_2410912 ) ) ( not ( = ?auto_2410909 ?auto_2410918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2410910 ?auto_2410911 ?auto_2410912 )
      ( MAKE-10CRATE-VERIFY ?auto_2410902 ?auto_2410903 ?auto_2410904 ?auto_2410906 ?auto_2410905 ?auto_2410907 ?auto_2410908 ?auto_2410909 ?auto_2410910 ?auto_2410911 ?auto_2410912 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2411028 - SURFACE
      ?auto_2411029 - SURFACE
      ?auto_2411030 - SURFACE
      ?auto_2411032 - SURFACE
      ?auto_2411031 - SURFACE
      ?auto_2411033 - SURFACE
      ?auto_2411034 - SURFACE
      ?auto_2411035 - SURFACE
      ?auto_2411036 - SURFACE
      ?auto_2411037 - SURFACE
      ?auto_2411038 - SURFACE
    )
    :vars
    (
      ?auto_2411044 - HOIST
      ?auto_2411039 - PLACE
      ?auto_2411040 - PLACE
      ?auto_2411043 - HOIST
      ?auto_2411042 - SURFACE
      ?auto_2411041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2411044 ?auto_2411039 ) ( SURFACE-AT ?auto_2411037 ?auto_2411039 ) ( CLEAR ?auto_2411037 ) ( IS-CRATE ?auto_2411038 ) ( not ( = ?auto_2411037 ?auto_2411038 ) ) ( AVAILABLE ?auto_2411044 ) ( ON ?auto_2411037 ?auto_2411036 ) ( not ( = ?auto_2411036 ?auto_2411037 ) ) ( not ( = ?auto_2411036 ?auto_2411038 ) ) ( not ( = ?auto_2411040 ?auto_2411039 ) ) ( HOIST-AT ?auto_2411043 ?auto_2411040 ) ( not ( = ?auto_2411044 ?auto_2411043 ) ) ( AVAILABLE ?auto_2411043 ) ( SURFACE-AT ?auto_2411038 ?auto_2411040 ) ( ON ?auto_2411038 ?auto_2411042 ) ( CLEAR ?auto_2411038 ) ( not ( = ?auto_2411037 ?auto_2411042 ) ) ( not ( = ?auto_2411038 ?auto_2411042 ) ) ( not ( = ?auto_2411036 ?auto_2411042 ) ) ( TRUCK-AT ?auto_2411041 ?auto_2411039 ) ( ON ?auto_2411029 ?auto_2411028 ) ( ON ?auto_2411030 ?auto_2411029 ) ( ON ?auto_2411032 ?auto_2411030 ) ( ON ?auto_2411031 ?auto_2411032 ) ( ON ?auto_2411033 ?auto_2411031 ) ( ON ?auto_2411034 ?auto_2411033 ) ( ON ?auto_2411035 ?auto_2411034 ) ( ON ?auto_2411036 ?auto_2411035 ) ( not ( = ?auto_2411028 ?auto_2411029 ) ) ( not ( = ?auto_2411028 ?auto_2411030 ) ) ( not ( = ?auto_2411028 ?auto_2411032 ) ) ( not ( = ?auto_2411028 ?auto_2411031 ) ) ( not ( = ?auto_2411028 ?auto_2411033 ) ) ( not ( = ?auto_2411028 ?auto_2411034 ) ) ( not ( = ?auto_2411028 ?auto_2411035 ) ) ( not ( = ?auto_2411028 ?auto_2411036 ) ) ( not ( = ?auto_2411028 ?auto_2411037 ) ) ( not ( = ?auto_2411028 ?auto_2411038 ) ) ( not ( = ?auto_2411028 ?auto_2411042 ) ) ( not ( = ?auto_2411029 ?auto_2411030 ) ) ( not ( = ?auto_2411029 ?auto_2411032 ) ) ( not ( = ?auto_2411029 ?auto_2411031 ) ) ( not ( = ?auto_2411029 ?auto_2411033 ) ) ( not ( = ?auto_2411029 ?auto_2411034 ) ) ( not ( = ?auto_2411029 ?auto_2411035 ) ) ( not ( = ?auto_2411029 ?auto_2411036 ) ) ( not ( = ?auto_2411029 ?auto_2411037 ) ) ( not ( = ?auto_2411029 ?auto_2411038 ) ) ( not ( = ?auto_2411029 ?auto_2411042 ) ) ( not ( = ?auto_2411030 ?auto_2411032 ) ) ( not ( = ?auto_2411030 ?auto_2411031 ) ) ( not ( = ?auto_2411030 ?auto_2411033 ) ) ( not ( = ?auto_2411030 ?auto_2411034 ) ) ( not ( = ?auto_2411030 ?auto_2411035 ) ) ( not ( = ?auto_2411030 ?auto_2411036 ) ) ( not ( = ?auto_2411030 ?auto_2411037 ) ) ( not ( = ?auto_2411030 ?auto_2411038 ) ) ( not ( = ?auto_2411030 ?auto_2411042 ) ) ( not ( = ?auto_2411032 ?auto_2411031 ) ) ( not ( = ?auto_2411032 ?auto_2411033 ) ) ( not ( = ?auto_2411032 ?auto_2411034 ) ) ( not ( = ?auto_2411032 ?auto_2411035 ) ) ( not ( = ?auto_2411032 ?auto_2411036 ) ) ( not ( = ?auto_2411032 ?auto_2411037 ) ) ( not ( = ?auto_2411032 ?auto_2411038 ) ) ( not ( = ?auto_2411032 ?auto_2411042 ) ) ( not ( = ?auto_2411031 ?auto_2411033 ) ) ( not ( = ?auto_2411031 ?auto_2411034 ) ) ( not ( = ?auto_2411031 ?auto_2411035 ) ) ( not ( = ?auto_2411031 ?auto_2411036 ) ) ( not ( = ?auto_2411031 ?auto_2411037 ) ) ( not ( = ?auto_2411031 ?auto_2411038 ) ) ( not ( = ?auto_2411031 ?auto_2411042 ) ) ( not ( = ?auto_2411033 ?auto_2411034 ) ) ( not ( = ?auto_2411033 ?auto_2411035 ) ) ( not ( = ?auto_2411033 ?auto_2411036 ) ) ( not ( = ?auto_2411033 ?auto_2411037 ) ) ( not ( = ?auto_2411033 ?auto_2411038 ) ) ( not ( = ?auto_2411033 ?auto_2411042 ) ) ( not ( = ?auto_2411034 ?auto_2411035 ) ) ( not ( = ?auto_2411034 ?auto_2411036 ) ) ( not ( = ?auto_2411034 ?auto_2411037 ) ) ( not ( = ?auto_2411034 ?auto_2411038 ) ) ( not ( = ?auto_2411034 ?auto_2411042 ) ) ( not ( = ?auto_2411035 ?auto_2411036 ) ) ( not ( = ?auto_2411035 ?auto_2411037 ) ) ( not ( = ?auto_2411035 ?auto_2411038 ) ) ( not ( = ?auto_2411035 ?auto_2411042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2411036 ?auto_2411037 ?auto_2411038 )
      ( MAKE-10CRATE-VERIFY ?auto_2411028 ?auto_2411029 ?auto_2411030 ?auto_2411032 ?auto_2411031 ?auto_2411033 ?auto_2411034 ?auto_2411035 ?auto_2411036 ?auto_2411037 ?auto_2411038 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2411154 - SURFACE
      ?auto_2411155 - SURFACE
      ?auto_2411156 - SURFACE
      ?auto_2411158 - SURFACE
      ?auto_2411157 - SURFACE
      ?auto_2411159 - SURFACE
      ?auto_2411160 - SURFACE
      ?auto_2411161 - SURFACE
      ?auto_2411162 - SURFACE
      ?auto_2411163 - SURFACE
      ?auto_2411164 - SURFACE
    )
    :vars
    (
      ?auto_2411167 - HOIST
      ?auto_2411169 - PLACE
      ?auto_2411166 - PLACE
      ?auto_2411168 - HOIST
      ?auto_2411170 - SURFACE
      ?auto_2411165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2411167 ?auto_2411169 ) ( IS-CRATE ?auto_2411164 ) ( not ( = ?auto_2411163 ?auto_2411164 ) ) ( not ( = ?auto_2411162 ?auto_2411163 ) ) ( not ( = ?auto_2411162 ?auto_2411164 ) ) ( not ( = ?auto_2411166 ?auto_2411169 ) ) ( HOIST-AT ?auto_2411168 ?auto_2411166 ) ( not ( = ?auto_2411167 ?auto_2411168 ) ) ( AVAILABLE ?auto_2411168 ) ( SURFACE-AT ?auto_2411164 ?auto_2411166 ) ( ON ?auto_2411164 ?auto_2411170 ) ( CLEAR ?auto_2411164 ) ( not ( = ?auto_2411163 ?auto_2411170 ) ) ( not ( = ?auto_2411164 ?auto_2411170 ) ) ( not ( = ?auto_2411162 ?auto_2411170 ) ) ( TRUCK-AT ?auto_2411165 ?auto_2411169 ) ( SURFACE-AT ?auto_2411162 ?auto_2411169 ) ( CLEAR ?auto_2411162 ) ( LIFTING ?auto_2411167 ?auto_2411163 ) ( IS-CRATE ?auto_2411163 ) ( ON ?auto_2411155 ?auto_2411154 ) ( ON ?auto_2411156 ?auto_2411155 ) ( ON ?auto_2411158 ?auto_2411156 ) ( ON ?auto_2411157 ?auto_2411158 ) ( ON ?auto_2411159 ?auto_2411157 ) ( ON ?auto_2411160 ?auto_2411159 ) ( ON ?auto_2411161 ?auto_2411160 ) ( ON ?auto_2411162 ?auto_2411161 ) ( not ( = ?auto_2411154 ?auto_2411155 ) ) ( not ( = ?auto_2411154 ?auto_2411156 ) ) ( not ( = ?auto_2411154 ?auto_2411158 ) ) ( not ( = ?auto_2411154 ?auto_2411157 ) ) ( not ( = ?auto_2411154 ?auto_2411159 ) ) ( not ( = ?auto_2411154 ?auto_2411160 ) ) ( not ( = ?auto_2411154 ?auto_2411161 ) ) ( not ( = ?auto_2411154 ?auto_2411162 ) ) ( not ( = ?auto_2411154 ?auto_2411163 ) ) ( not ( = ?auto_2411154 ?auto_2411164 ) ) ( not ( = ?auto_2411154 ?auto_2411170 ) ) ( not ( = ?auto_2411155 ?auto_2411156 ) ) ( not ( = ?auto_2411155 ?auto_2411158 ) ) ( not ( = ?auto_2411155 ?auto_2411157 ) ) ( not ( = ?auto_2411155 ?auto_2411159 ) ) ( not ( = ?auto_2411155 ?auto_2411160 ) ) ( not ( = ?auto_2411155 ?auto_2411161 ) ) ( not ( = ?auto_2411155 ?auto_2411162 ) ) ( not ( = ?auto_2411155 ?auto_2411163 ) ) ( not ( = ?auto_2411155 ?auto_2411164 ) ) ( not ( = ?auto_2411155 ?auto_2411170 ) ) ( not ( = ?auto_2411156 ?auto_2411158 ) ) ( not ( = ?auto_2411156 ?auto_2411157 ) ) ( not ( = ?auto_2411156 ?auto_2411159 ) ) ( not ( = ?auto_2411156 ?auto_2411160 ) ) ( not ( = ?auto_2411156 ?auto_2411161 ) ) ( not ( = ?auto_2411156 ?auto_2411162 ) ) ( not ( = ?auto_2411156 ?auto_2411163 ) ) ( not ( = ?auto_2411156 ?auto_2411164 ) ) ( not ( = ?auto_2411156 ?auto_2411170 ) ) ( not ( = ?auto_2411158 ?auto_2411157 ) ) ( not ( = ?auto_2411158 ?auto_2411159 ) ) ( not ( = ?auto_2411158 ?auto_2411160 ) ) ( not ( = ?auto_2411158 ?auto_2411161 ) ) ( not ( = ?auto_2411158 ?auto_2411162 ) ) ( not ( = ?auto_2411158 ?auto_2411163 ) ) ( not ( = ?auto_2411158 ?auto_2411164 ) ) ( not ( = ?auto_2411158 ?auto_2411170 ) ) ( not ( = ?auto_2411157 ?auto_2411159 ) ) ( not ( = ?auto_2411157 ?auto_2411160 ) ) ( not ( = ?auto_2411157 ?auto_2411161 ) ) ( not ( = ?auto_2411157 ?auto_2411162 ) ) ( not ( = ?auto_2411157 ?auto_2411163 ) ) ( not ( = ?auto_2411157 ?auto_2411164 ) ) ( not ( = ?auto_2411157 ?auto_2411170 ) ) ( not ( = ?auto_2411159 ?auto_2411160 ) ) ( not ( = ?auto_2411159 ?auto_2411161 ) ) ( not ( = ?auto_2411159 ?auto_2411162 ) ) ( not ( = ?auto_2411159 ?auto_2411163 ) ) ( not ( = ?auto_2411159 ?auto_2411164 ) ) ( not ( = ?auto_2411159 ?auto_2411170 ) ) ( not ( = ?auto_2411160 ?auto_2411161 ) ) ( not ( = ?auto_2411160 ?auto_2411162 ) ) ( not ( = ?auto_2411160 ?auto_2411163 ) ) ( not ( = ?auto_2411160 ?auto_2411164 ) ) ( not ( = ?auto_2411160 ?auto_2411170 ) ) ( not ( = ?auto_2411161 ?auto_2411162 ) ) ( not ( = ?auto_2411161 ?auto_2411163 ) ) ( not ( = ?auto_2411161 ?auto_2411164 ) ) ( not ( = ?auto_2411161 ?auto_2411170 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2411162 ?auto_2411163 ?auto_2411164 )
      ( MAKE-10CRATE-VERIFY ?auto_2411154 ?auto_2411155 ?auto_2411156 ?auto_2411158 ?auto_2411157 ?auto_2411159 ?auto_2411160 ?auto_2411161 ?auto_2411162 ?auto_2411163 ?auto_2411164 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2411280 - SURFACE
      ?auto_2411281 - SURFACE
      ?auto_2411282 - SURFACE
      ?auto_2411284 - SURFACE
      ?auto_2411283 - SURFACE
      ?auto_2411285 - SURFACE
      ?auto_2411286 - SURFACE
      ?auto_2411287 - SURFACE
      ?auto_2411288 - SURFACE
      ?auto_2411289 - SURFACE
      ?auto_2411290 - SURFACE
    )
    :vars
    (
      ?auto_2411291 - HOIST
      ?auto_2411294 - PLACE
      ?auto_2411296 - PLACE
      ?auto_2411293 - HOIST
      ?auto_2411295 - SURFACE
      ?auto_2411292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2411291 ?auto_2411294 ) ( IS-CRATE ?auto_2411290 ) ( not ( = ?auto_2411289 ?auto_2411290 ) ) ( not ( = ?auto_2411288 ?auto_2411289 ) ) ( not ( = ?auto_2411288 ?auto_2411290 ) ) ( not ( = ?auto_2411296 ?auto_2411294 ) ) ( HOIST-AT ?auto_2411293 ?auto_2411296 ) ( not ( = ?auto_2411291 ?auto_2411293 ) ) ( AVAILABLE ?auto_2411293 ) ( SURFACE-AT ?auto_2411290 ?auto_2411296 ) ( ON ?auto_2411290 ?auto_2411295 ) ( CLEAR ?auto_2411290 ) ( not ( = ?auto_2411289 ?auto_2411295 ) ) ( not ( = ?auto_2411290 ?auto_2411295 ) ) ( not ( = ?auto_2411288 ?auto_2411295 ) ) ( TRUCK-AT ?auto_2411292 ?auto_2411294 ) ( SURFACE-AT ?auto_2411288 ?auto_2411294 ) ( CLEAR ?auto_2411288 ) ( IS-CRATE ?auto_2411289 ) ( AVAILABLE ?auto_2411291 ) ( IN ?auto_2411289 ?auto_2411292 ) ( ON ?auto_2411281 ?auto_2411280 ) ( ON ?auto_2411282 ?auto_2411281 ) ( ON ?auto_2411284 ?auto_2411282 ) ( ON ?auto_2411283 ?auto_2411284 ) ( ON ?auto_2411285 ?auto_2411283 ) ( ON ?auto_2411286 ?auto_2411285 ) ( ON ?auto_2411287 ?auto_2411286 ) ( ON ?auto_2411288 ?auto_2411287 ) ( not ( = ?auto_2411280 ?auto_2411281 ) ) ( not ( = ?auto_2411280 ?auto_2411282 ) ) ( not ( = ?auto_2411280 ?auto_2411284 ) ) ( not ( = ?auto_2411280 ?auto_2411283 ) ) ( not ( = ?auto_2411280 ?auto_2411285 ) ) ( not ( = ?auto_2411280 ?auto_2411286 ) ) ( not ( = ?auto_2411280 ?auto_2411287 ) ) ( not ( = ?auto_2411280 ?auto_2411288 ) ) ( not ( = ?auto_2411280 ?auto_2411289 ) ) ( not ( = ?auto_2411280 ?auto_2411290 ) ) ( not ( = ?auto_2411280 ?auto_2411295 ) ) ( not ( = ?auto_2411281 ?auto_2411282 ) ) ( not ( = ?auto_2411281 ?auto_2411284 ) ) ( not ( = ?auto_2411281 ?auto_2411283 ) ) ( not ( = ?auto_2411281 ?auto_2411285 ) ) ( not ( = ?auto_2411281 ?auto_2411286 ) ) ( not ( = ?auto_2411281 ?auto_2411287 ) ) ( not ( = ?auto_2411281 ?auto_2411288 ) ) ( not ( = ?auto_2411281 ?auto_2411289 ) ) ( not ( = ?auto_2411281 ?auto_2411290 ) ) ( not ( = ?auto_2411281 ?auto_2411295 ) ) ( not ( = ?auto_2411282 ?auto_2411284 ) ) ( not ( = ?auto_2411282 ?auto_2411283 ) ) ( not ( = ?auto_2411282 ?auto_2411285 ) ) ( not ( = ?auto_2411282 ?auto_2411286 ) ) ( not ( = ?auto_2411282 ?auto_2411287 ) ) ( not ( = ?auto_2411282 ?auto_2411288 ) ) ( not ( = ?auto_2411282 ?auto_2411289 ) ) ( not ( = ?auto_2411282 ?auto_2411290 ) ) ( not ( = ?auto_2411282 ?auto_2411295 ) ) ( not ( = ?auto_2411284 ?auto_2411283 ) ) ( not ( = ?auto_2411284 ?auto_2411285 ) ) ( not ( = ?auto_2411284 ?auto_2411286 ) ) ( not ( = ?auto_2411284 ?auto_2411287 ) ) ( not ( = ?auto_2411284 ?auto_2411288 ) ) ( not ( = ?auto_2411284 ?auto_2411289 ) ) ( not ( = ?auto_2411284 ?auto_2411290 ) ) ( not ( = ?auto_2411284 ?auto_2411295 ) ) ( not ( = ?auto_2411283 ?auto_2411285 ) ) ( not ( = ?auto_2411283 ?auto_2411286 ) ) ( not ( = ?auto_2411283 ?auto_2411287 ) ) ( not ( = ?auto_2411283 ?auto_2411288 ) ) ( not ( = ?auto_2411283 ?auto_2411289 ) ) ( not ( = ?auto_2411283 ?auto_2411290 ) ) ( not ( = ?auto_2411283 ?auto_2411295 ) ) ( not ( = ?auto_2411285 ?auto_2411286 ) ) ( not ( = ?auto_2411285 ?auto_2411287 ) ) ( not ( = ?auto_2411285 ?auto_2411288 ) ) ( not ( = ?auto_2411285 ?auto_2411289 ) ) ( not ( = ?auto_2411285 ?auto_2411290 ) ) ( not ( = ?auto_2411285 ?auto_2411295 ) ) ( not ( = ?auto_2411286 ?auto_2411287 ) ) ( not ( = ?auto_2411286 ?auto_2411288 ) ) ( not ( = ?auto_2411286 ?auto_2411289 ) ) ( not ( = ?auto_2411286 ?auto_2411290 ) ) ( not ( = ?auto_2411286 ?auto_2411295 ) ) ( not ( = ?auto_2411287 ?auto_2411288 ) ) ( not ( = ?auto_2411287 ?auto_2411289 ) ) ( not ( = ?auto_2411287 ?auto_2411290 ) ) ( not ( = ?auto_2411287 ?auto_2411295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2411288 ?auto_2411289 ?auto_2411290 )
      ( MAKE-10CRATE-VERIFY ?auto_2411280 ?auto_2411281 ?auto_2411282 ?auto_2411284 ?auto_2411283 ?auto_2411285 ?auto_2411286 ?auto_2411287 ?auto_2411288 ?auto_2411289 ?auto_2411290 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2418564 - SURFACE
      ?auto_2418565 - SURFACE
      ?auto_2418566 - SURFACE
      ?auto_2418568 - SURFACE
      ?auto_2418567 - SURFACE
      ?auto_2418569 - SURFACE
      ?auto_2418570 - SURFACE
      ?auto_2418571 - SURFACE
      ?auto_2418572 - SURFACE
      ?auto_2418573 - SURFACE
      ?auto_2418574 - SURFACE
      ?auto_2418575 - SURFACE
    )
    :vars
    (
      ?auto_2418576 - HOIST
      ?auto_2418577 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2418576 ?auto_2418577 ) ( SURFACE-AT ?auto_2418574 ?auto_2418577 ) ( CLEAR ?auto_2418574 ) ( LIFTING ?auto_2418576 ?auto_2418575 ) ( IS-CRATE ?auto_2418575 ) ( not ( = ?auto_2418574 ?auto_2418575 ) ) ( ON ?auto_2418565 ?auto_2418564 ) ( ON ?auto_2418566 ?auto_2418565 ) ( ON ?auto_2418568 ?auto_2418566 ) ( ON ?auto_2418567 ?auto_2418568 ) ( ON ?auto_2418569 ?auto_2418567 ) ( ON ?auto_2418570 ?auto_2418569 ) ( ON ?auto_2418571 ?auto_2418570 ) ( ON ?auto_2418572 ?auto_2418571 ) ( ON ?auto_2418573 ?auto_2418572 ) ( ON ?auto_2418574 ?auto_2418573 ) ( not ( = ?auto_2418564 ?auto_2418565 ) ) ( not ( = ?auto_2418564 ?auto_2418566 ) ) ( not ( = ?auto_2418564 ?auto_2418568 ) ) ( not ( = ?auto_2418564 ?auto_2418567 ) ) ( not ( = ?auto_2418564 ?auto_2418569 ) ) ( not ( = ?auto_2418564 ?auto_2418570 ) ) ( not ( = ?auto_2418564 ?auto_2418571 ) ) ( not ( = ?auto_2418564 ?auto_2418572 ) ) ( not ( = ?auto_2418564 ?auto_2418573 ) ) ( not ( = ?auto_2418564 ?auto_2418574 ) ) ( not ( = ?auto_2418564 ?auto_2418575 ) ) ( not ( = ?auto_2418565 ?auto_2418566 ) ) ( not ( = ?auto_2418565 ?auto_2418568 ) ) ( not ( = ?auto_2418565 ?auto_2418567 ) ) ( not ( = ?auto_2418565 ?auto_2418569 ) ) ( not ( = ?auto_2418565 ?auto_2418570 ) ) ( not ( = ?auto_2418565 ?auto_2418571 ) ) ( not ( = ?auto_2418565 ?auto_2418572 ) ) ( not ( = ?auto_2418565 ?auto_2418573 ) ) ( not ( = ?auto_2418565 ?auto_2418574 ) ) ( not ( = ?auto_2418565 ?auto_2418575 ) ) ( not ( = ?auto_2418566 ?auto_2418568 ) ) ( not ( = ?auto_2418566 ?auto_2418567 ) ) ( not ( = ?auto_2418566 ?auto_2418569 ) ) ( not ( = ?auto_2418566 ?auto_2418570 ) ) ( not ( = ?auto_2418566 ?auto_2418571 ) ) ( not ( = ?auto_2418566 ?auto_2418572 ) ) ( not ( = ?auto_2418566 ?auto_2418573 ) ) ( not ( = ?auto_2418566 ?auto_2418574 ) ) ( not ( = ?auto_2418566 ?auto_2418575 ) ) ( not ( = ?auto_2418568 ?auto_2418567 ) ) ( not ( = ?auto_2418568 ?auto_2418569 ) ) ( not ( = ?auto_2418568 ?auto_2418570 ) ) ( not ( = ?auto_2418568 ?auto_2418571 ) ) ( not ( = ?auto_2418568 ?auto_2418572 ) ) ( not ( = ?auto_2418568 ?auto_2418573 ) ) ( not ( = ?auto_2418568 ?auto_2418574 ) ) ( not ( = ?auto_2418568 ?auto_2418575 ) ) ( not ( = ?auto_2418567 ?auto_2418569 ) ) ( not ( = ?auto_2418567 ?auto_2418570 ) ) ( not ( = ?auto_2418567 ?auto_2418571 ) ) ( not ( = ?auto_2418567 ?auto_2418572 ) ) ( not ( = ?auto_2418567 ?auto_2418573 ) ) ( not ( = ?auto_2418567 ?auto_2418574 ) ) ( not ( = ?auto_2418567 ?auto_2418575 ) ) ( not ( = ?auto_2418569 ?auto_2418570 ) ) ( not ( = ?auto_2418569 ?auto_2418571 ) ) ( not ( = ?auto_2418569 ?auto_2418572 ) ) ( not ( = ?auto_2418569 ?auto_2418573 ) ) ( not ( = ?auto_2418569 ?auto_2418574 ) ) ( not ( = ?auto_2418569 ?auto_2418575 ) ) ( not ( = ?auto_2418570 ?auto_2418571 ) ) ( not ( = ?auto_2418570 ?auto_2418572 ) ) ( not ( = ?auto_2418570 ?auto_2418573 ) ) ( not ( = ?auto_2418570 ?auto_2418574 ) ) ( not ( = ?auto_2418570 ?auto_2418575 ) ) ( not ( = ?auto_2418571 ?auto_2418572 ) ) ( not ( = ?auto_2418571 ?auto_2418573 ) ) ( not ( = ?auto_2418571 ?auto_2418574 ) ) ( not ( = ?auto_2418571 ?auto_2418575 ) ) ( not ( = ?auto_2418572 ?auto_2418573 ) ) ( not ( = ?auto_2418572 ?auto_2418574 ) ) ( not ( = ?auto_2418572 ?auto_2418575 ) ) ( not ( = ?auto_2418573 ?auto_2418574 ) ) ( not ( = ?auto_2418573 ?auto_2418575 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2418574 ?auto_2418575 )
      ( MAKE-11CRATE-VERIFY ?auto_2418564 ?auto_2418565 ?auto_2418566 ?auto_2418568 ?auto_2418567 ?auto_2418569 ?auto_2418570 ?auto_2418571 ?auto_2418572 ?auto_2418573 ?auto_2418574 ?auto_2418575 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2418673 - SURFACE
      ?auto_2418674 - SURFACE
      ?auto_2418675 - SURFACE
      ?auto_2418677 - SURFACE
      ?auto_2418676 - SURFACE
      ?auto_2418678 - SURFACE
      ?auto_2418679 - SURFACE
      ?auto_2418680 - SURFACE
      ?auto_2418681 - SURFACE
      ?auto_2418682 - SURFACE
      ?auto_2418683 - SURFACE
      ?auto_2418684 - SURFACE
    )
    :vars
    (
      ?auto_2418687 - HOIST
      ?auto_2418685 - PLACE
      ?auto_2418686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2418687 ?auto_2418685 ) ( SURFACE-AT ?auto_2418683 ?auto_2418685 ) ( CLEAR ?auto_2418683 ) ( IS-CRATE ?auto_2418684 ) ( not ( = ?auto_2418683 ?auto_2418684 ) ) ( TRUCK-AT ?auto_2418686 ?auto_2418685 ) ( AVAILABLE ?auto_2418687 ) ( IN ?auto_2418684 ?auto_2418686 ) ( ON ?auto_2418683 ?auto_2418682 ) ( not ( = ?auto_2418682 ?auto_2418683 ) ) ( not ( = ?auto_2418682 ?auto_2418684 ) ) ( ON ?auto_2418674 ?auto_2418673 ) ( ON ?auto_2418675 ?auto_2418674 ) ( ON ?auto_2418677 ?auto_2418675 ) ( ON ?auto_2418676 ?auto_2418677 ) ( ON ?auto_2418678 ?auto_2418676 ) ( ON ?auto_2418679 ?auto_2418678 ) ( ON ?auto_2418680 ?auto_2418679 ) ( ON ?auto_2418681 ?auto_2418680 ) ( ON ?auto_2418682 ?auto_2418681 ) ( not ( = ?auto_2418673 ?auto_2418674 ) ) ( not ( = ?auto_2418673 ?auto_2418675 ) ) ( not ( = ?auto_2418673 ?auto_2418677 ) ) ( not ( = ?auto_2418673 ?auto_2418676 ) ) ( not ( = ?auto_2418673 ?auto_2418678 ) ) ( not ( = ?auto_2418673 ?auto_2418679 ) ) ( not ( = ?auto_2418673 ?auto_2418680 ) ) ( not ( = ?auto_2418673 ?auto_2418681 ) ) ( not ( = ?auto_2418673 ?auto_2418682 ) ) ( not ( = ?auto_2418673 ?auto_2418683 ) ) ( not ( = ?auto_2418673 ?auto_2418684 ) ) ( not ( = ?auto_2418674 ?auto_2418675 ) ) ( not ( = ?auto_2418674 ?auto_2418677 ) ) ( not ( = ?auto_2418674 ?auto_2418676 ) ) ( not ( = ?auto_2418674 ?auto_2418678 ) ) ( not ( = ?auto_2418674 ?auto_2418679 ) ) ( not ( = ?auto_2418674 ?auto_2418680 ) ) ( not ( = ?auto_2418674 ?auto_2418681 ) ) ( not ( = ?auto_2418674 ?auto_2418682 ) ) ( not ( = ?auto_2418674 ?auto_2418683 ) ) ( not ( = ?auto_2418674 ?auto_2418684 ) ) ( not ( = ?auto_2418675 ?auto_2418677 ) ) ( not ( = ?auto_2418675 ?auto_2418676 ) ) ( not ( = ?auto_2418675 ?auto_2418678 ) ) ( not ( = ?auto_2418675 ?auto_2418679 ) ) ( not ( = ?auto_2418675 ?auto_2418680 ) ) ( not ( = ?auto_2418675 ?auto_2418681 ) ) ( not ( = ?auto_2418675 ?auto_2418682 ) ) ( not ( = ?auto_2418675 ?auto_2418683 ) ) ( not ( = ?auto_2418675 ?auto_2418684 ) ) ( not ( = ?auto_2418677 ?auto_2418676 ) ) ( not ( = ?auto_2418677 ?auto_2418678 ) ) ( not ( = ?auto_2418677 ?auto_2418679 ) ) ( not ( = ?auto_2418677 ?auto_2418680 ) ) ( not ( = ?auto_2418677 ?auto_2418681 ) ) ( not ( = ?auto_2418677 ?auto_2418682 ) ) ( not ( = ?auto_2418677 ?auto_2418683 ) ) ( not ( = ?auto_2418677 ?auto_2418684 ) ) ( not ( = ?auto_2418676 ?auto_2418678 ) ) ( not ( = ?auto_2418676 ?auto_2418679 ) ) ( not ( = ?auto_2418676 ?auto_2418680 ) ) ( not ( = ?auto_2418676 ?auto_2418681 ) ) ( not ( = ?auto_2418676 ?auto_2418682 ) ) ( not ( = ?auto_2418676 ?auto_2418683 ) ) ( not ( = ?auto_2418676 ?auto_2418684 ) ) ( not ( = ?auto_2418678 ?auto_2418679 ) ) ( not ( = ?auto_2418678 ?auto_2418680 ) ) ( not ( = ?auto_2418678 ?auto_2418681 ) ) ( not ( = ?auto_2418678 ?auto_2418682 ) ) ( not ( = ?auto_2418678 ?auto_2418683 ) ) ( not ( = ?auto_2418678 ?auto_2418684 ) ) ( not ( = ?auto_2418679 ?auto_2418680 ) ) ( not ( = ?auto_2418679 ?auto_2418681 ) ) ( not ( = ?auto_2418679 ?auto_2418682 ) ) ( not ( = ?auto_2418679 ?auto_2418683 ) ) ( not ( = ?auto_2418679 ?auto_2418684 ) ) ( not ( = ?auto_2418680 ?auto_2418681 ) ) ( not ( = ?auto_2418680 ?auto_2418682 ) ) ( not ( = ?auto_2418680 ?auto_2418683 ) ) ( not ( = ?auto_2418680 ?auto_2418684 ) ) ( not ( = ?auto_2418681 ?auto_2418682 ) ) ( not ( = ?auto_2418681 ?auto_2418683 ) ) ( not ( = ?auto_2418681 ?auto_2418684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2418682 ?auto_2418683 ?auto_2418684 )
      ( MAKE-11CRATE-VERIFY ?auto_2418673 ?auto_2418674 ?auto_2418675 ?auto_2418677 ?auto_2418676 ?auto_2418678 ?auto_2418679 ?auto_2418680 ?auto_2418681 ?auto_2418682 ?auto_2418683 ?auto_2418684 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2418794 - SURFACE
      ?auto_2418795 - SURFACE
      ?auto_2418796 - SURFACE
      ?auto_2418798 - SURFACE
      ?auto_2418797 - SURFACE
      ?auto_2418799 - SURFACE
      ?auto_2418800 - SURFACE
      ?auto_2418801 - SURFACE
      ?auto_2418802 - SURFACE
      ?auto_2418803 - SURFACE
      ?auto_2418804 - SURFACE
      ?auto_2418805 - SURFACE
    )
    :vars
    (
      ?auto_2418808 - HOIST
      ?auto_2418809 - PLACE
      ?auto_2418806 - TRUCK
      ?auto_2418807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2418808 ?auto_2418809 ) ( SURFACE-AT ?auto_2418804 ?auto_2418809 ) ( CLEAR ?auto_2418804 ) ( IS-CRATE ?auto_2418805 ) ( not ( = ?auto_2418804 ?auto_2418805 ) ) ( AVAILABLE ?auto_2418808 ) ( IN ?auto_2418805 ?auto_2418806 ) ( ON ?auto_2418804 ?auto_2418803 ) ( not ( = ?auto_2418803 ?auto_2418804 ) ) ( not ( = ?auto_2418803 ?auto_2418805 ) ) ( TRUCK-AT ?auto_2418806 ?auto_2418807 ) ( not ( = ?auto_2418807 ?auto_2418809 ) ) ( ON ?auto_2418795 ?auto_2418794 ) ( ON ?auto_2418796 ?auto_2418795 ) ( ON ?auto_2418798 ?auto_2418796 ) ( ON ?auto_2418797 ?auto_2418798 ) ( ON ?auto_2418799 ?auto_2418797 ) ( ON ?auto_2418800 ?auto_2418799 ) ( ON ?auto_2418801 ?auto_2418800 ) ( ON ?auto_2418802 ?auto_2418801 ) ( ON ?auto_2418803 ?auto_2418802 ) ( not ( = ?auto_2418794 ?auto_2418795 ) ) ( not ( = ?auto_2418794 ?auto_2418796 ) ) ( not ( = ?auto_2418794 ?auto_2418798 ) ) ( not ( = ?auto_2418794 ?auto_2418797 ) ) ( not ( = ?auto_2418794 ?auto_2418799 ) ) ( not ( = ?auto_2418794 ?auto_2418800 ) ) ( not ( = ?auto_2418794 ?auto_2418801 ) ) ( not ( = ?auto_2418794 ?auto_2418802 ) ) ( not ( = ?auto_2418794 ?auto_2418803 ) ) ( not ( = ?auto_2418794 ?auto_2418804 ) ) ( not ( = ?auto_2418794 ?auto_2418805 ) ) ( not ( = ?auto_2418795 ?auto_2418796 ) ) ( not ( = ?auto_2418795 ?auto_2418798 ) ) ( not ( = ?auto_2418795 ?auto_2418797 ) ) ( not ( = ?auto_2418795 ?auto_2418799 ) ) ( not ( = ?auto_2418795 ?auto_2418800 ) ) ( not ( = ?auto_2418795 ?auto_2418801 ) ) ( not ( = ?auto_2418795 ?auto_2418802 ) ) ( not ( = ?auto_2418795 ?auto_2418803 ) ) ( not ( = ?auto_2418795 ?auto_2418804 ) ) ( not ( = ?auto_2418795 ?auto_2418805 ) ) ( not ( = ?auto_2418796 ?auto_2418798 ) ) ( not ( = ?auto_2418796 ?auto_2418797 ) ) ( not ( = ?auto_2418796 ?auto_2418799 ) ) ( not ( = ?auto_2418796 ?auto_2418800 ) ) ( not ( = ?auto_2418796 ?auto_2418801 ) ) ( not ( = ?auto_2418796 ?auto_2418802 ) ) ( not ( = ?auto_2418796 ?auto_2418803 ) ) ( not ( = ?auto_2418796 ?auto_2418804 ) ) ( not ( = ?auto_2418796 ?auto_2418805 ) ) ( not ( = ?auto_2418798 ?auto_2418797 ) ) ( not ( = ?auto_2418798 ?auto_2418799 ) ) ( not ( = ?auto_2418798 ?auto_2418800 ) ) ( not ( = ?auto_2418798 ?auto_2418801 ) ) ( not ( = ?auto_2418798 ?auto_2418802 ) ) ( not ( = ?auto_2418798 ?auto_2418803 ) ) ( not ( = ?auto_2418798 ?auto_2418804 ) ) ( not ( = ?auto_2418798 ?auto_2418805 ) ) ( not ( = ?auto_2418797 ?auto_2418799 ) ) ( not ( = ?auto_2418797 ?auto_2418800 ) ) ( not ( = ?auto_2418797 ?auto_2418801 ) ) ( not ( = ?auto_2418797 ?auto_2418802 ) ) ( not ( = ?auto_2418797 ?auto_2418803 ) ) ( not ( = ?auto_2418797 ?auto_2418804 ) ) ( not ( = ?auto_2418797 ?auto_2418805 ) ) ( not ( = ?auto_2418799 ?auto_2418800 ) ) ( not ( = ?auto_2418799 ?auto_2418801 ) ) ( not ( = ?auto_2418799 ?auto_2418802 ) ) ( not ( = ?auto_2418799 ?auto_2418803 ) ) ( not ( = ?auto_2418799 ?auto_2418804 ) ) ( not ( = ?auto_2418799 ?auto_2418805 ) ) ( not ( = ?auto_2418800 ?auto_2418801 ) ) ( not ( = ?auto_2418800 ?auto_2418802 ) ) ( not ( = ?auto_2418800 ?auto_2418803 ) ) ( not ( = ?auto_2418800 ?auto_2418804 ) ) ( not ( = ?auto_2418800 ?auto_2418805 ) ) ( not ( = ?auto_2418801 ?auto_2418802 ) ) ( not ( = ?auto_2418801 ?auto_2418803 ) ) ( not ( = ?auto_2418801 ?auto_2418804 ) ) ( not ( = ?auto_2418801 ?auto_2418805 ) ) ( not ( = ?auto_2418802 ?auto_2418803 ) ) ( not ( = ?auto_2418802 ?auto_2418804 ) ) ( not ( = ?auto_2418802 ?auto_2418805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2418803 ?auto_2418804 ?auto_2418805 )
      ( MAKE-11CRATE-VERIFY ?auto_2418794 ?auto_2418795 ?auto_2418796 ?auto_2418798 ?auto_2418797 ?auto_2418799 ?auto_2418800 ?auto_2418801 ?auto_2418802 ?auto_2418803 ?auto_2418804 ?auto_2418805 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2418926 - SURFACE
      ?auto_2418927 - SURFACE
      ?auto_2418928 - SURFACE
      ?auto_2418930 - SURFACE
      ?auto_2418929 - SURFACE
      ?auto_2418931 - SURFACE
      ?auto_2418932 - SURFACE
      ?auto_2418933 - SURFACE
      ?auto_2418934 - SURFACE
      ?auto_2418935 - SURFACE
      ?auto_2418936 - SURFACE
      ?auto_2418937 - SURFACE
    )
    :vars
    (
      ?auto_2418938 - HOIST
      ?auto_2418940 - PLACE
      ?auto_2418939 - TRUCK
      ?auto_2418942 - PLACE
      ?auto_2418941 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2418938 ?auto_2418940 ) ( SURFACE-AT ?auto_2418936 ?auto_2418940 ) ( CLEAR ?auto_2418936 ) ( IS-CRATE ?auto_2418937 ) ( not ( = ?auto_2418936 ?auto_2418937 ) ) ( AVAILABLE ?auto_2418938 ) ( ON ?auto_2418936 ?auto_2418935 ) ( not ( = ?auto_2418935 ?auto_2418936 ) ) ( not ( = ?auto_2418935 ?auto_2418937 ) ) ( TRUCK-AT ?auto_2418939 ?auto_2418942 ) ( not ( = ?auto_2418942 ?auto_2418940 ) ) ( HOIST-AT ?auto_2418941 ?auto_2418942 ) ( LIFTING ?auto_2418941 ?auto_2418937 ) ( not ( = ?auto_2418938 ?auto_2418941 ) ) ( ON ?auto_2418927 ?auto_2418926 ) ( ON ?auto_2418928 ?auto_2418927 ) ( ON ?auto_2418930 ?auto_2418928 ) ( ON ?auto_2418929 ?auto_2418930 ) ( ON ?auto_2418931 ?auto_2418929 ) ( ON ?auto_2418932 ?auto_2418931 ) ( ON ?auto_2418933 ?auto_2418932 ) ( ON ?auto_2418934 ?auto_2418933 ) ( ON ?auto_2418935 ?auto_2418934 ) ( not ( = ?auto_2418926 ?auto_2418927 ) ) ( not ( = ?auto_2418926 ?auto_2418928 ) ) ( not ( = ?auto_2418926 ?auto_2418930 ) ) ( not ( = ?auto_2418926 ?auto_2418929 ) ) ( not ( = ?auto_2418926 ?auto_2418931 ) ) ( not ( = ?auto_2418926 ?auto_2418932 ) ) ( not ( = ?auto_2418926 ?auto_2418933 ) ) ( not ( = ?auto_2418926 ?auto_2418934 ) ) ( not ( = ?auto_2418926 ?auto_2418935 ) ) ( not ( = ?auto_2418926 ?auto_2418936 ) ) ( not ( = ?auto_2418926 ?auto_2418937 ) ) ( not ( = ?auto_2418927 ?auto_2418928 ) ) ( not ( = ?auto_2418927 ?auto_2418930 ) ) ( not ( = ?auto_2418927 ?auto_2418929 ) ) ( not ( = ?auto_2418927 ?auto_2418931 ) ) ( not ( = ?auto_2418927 ?auto_2418932 ) ) ( not ( = ?auto_2418927 ?auto_2418933 ) ) ( not ( = ?auto_2418927 ?auto_2418934 ) ) ( not ( = ?auto_2418927 ?auto_2418935 ) ) ( not ( = ?auto_2418927 ?auto_2418936 ) ) ( not ( = ?auto_2418927 ?auto_2418937 ) ) ( not ( = ?auto_2418928 ?auto_2418930 ) ) ( not ( = ?auto_2418928 ?auto_2418929 ) ) ( not ( = ?auto_2418928 ?auto_2418931 ) ) ( not ( = ?auto_2418928 ?auto_2418932 ) ) ( not ( = ?auto_2418928 ?auto_2418933 ) ) ( not ( = ?auto_2418928 ?auto_2418934 ) ) ( not ( = ?auto_2418928 ?auto_2418935 ) ) ( not ( = ?auto_2418928 ?auto_2418936 ) ) ( not ( = ?auto_2418928 ?auto_2418937 ) ) ( not ( = ?auto_2418930 ?auto_2418929 ) ) ( not ( = ?auto_2418930 ?auto_2418931 ) ) ( not ( = ?auto_2418930 ?auto_2418932 ) ) ( not ( = ?auto_2418930 ?auto_2418933 ) ) ( not ( = ?auto_2418930 ?auto_2418934 ) ) ( not ( = ?auto_2418930 ?auto_2418935 ) ) ( not ( = ?auto_2418930 ?auto_2418936 ) ) ( not ( = ?auto_2418930 ?auto_2418937 ) ) ( not ( = ?auto_2418929 ?auto_2418931 ) ) ( not ( = ?auto_2418929 ?auto_2418932 ) ) ( not ( = ?auto_2418929 ?auto_2418933 ) ) ( not ( = ?auto_2418929 ?auto_2418934 ) ) ( not ( = ?auto_2418929 ?auto_2418935 ) ) ( not ( = ?auto_2418929 ?auto_2418936 ) ) ( not ( = ?auto_2418929 ?auto_2418937 ) ) ( not ( = ?auto_2418931 ?auto_2418932 ) ) ( not ( = ?auto_2418931 ?auto_2418933 ) ) ( not ( = ?auto_2418931 ?auto_2418934 ) ) ( not ( = ?auto_2418931 ?auto_2418935 ) ) ( not ( = ?auto_2418931 ?auto_2418936 ) ) ( not ( = ?auto_2418931 ?auto_2418937 ) ) ( not ( = ?auto_2418932 ?auto_2418933 ) ) ( not ( = ?auto_2418932 ?auto_2418934 ) ) ( not ( = ?auto_2418932 ?auto_2418935 ) ) ( not ( = ?auto_2418932 ?auto_2418936 ) ) ( not ( = ?auto_2418932 ?auto_2418937 ) ) ( not ( = ?auto_2418933 ?auto_2418934 ) ) ( not ( = ?auto_2418933 ?auto_2418935 ) ) ( not ( = ?auto_2418933 ?auto_2418936 ) ) ( not ( = ?auto_2418933 ?auto_2418937 ) ) ( not ( = ?auto_2418934 ?auto_2418935 ) ) ( not ( = ?auto_2418934 ?auto_2418936 ) ) ( not ( = ?auto_2418934 ?auto_2418937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2418935 ?auto_2418936 ?auto_2418937 )
      ( MAKE-11CRATE-VERIFY ?auto_2418926 ?auto_2418927 ?auto_2418928 ?auto_2418930 ?auto_2418929 ?auto_2418931 ?auto_2418932 ?auto_2418933 ?auto_2418934 ?auto_2418935 ?auto_2418936 ?auto_2418937 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2419069 - SURFACE
      ?auto_2419070 - SURFACE
      ?auto_2419071 - SURFACE
      ?auto_2419073 - SURFACE
      ?auto_2419072 - SURFACE
      ?auto_2419074 - SURFACE
      ?auto_2419075 - SURFACE
      ?auto_2419076 - SURFACE
      ?auto_2419077 - SURFACE
      ?auto_2419078 - SURFACE
      ?auto_2419079 - SURFACE
      ?auto_2419080 - SURFACE
    )
    :vars
    (
      ?auto_2419084 - HOIST
      ?auto_2419085 - PLACE
      ?auto_2419081 - TRUCK
      ?auto_2419082 - PLACE
      ?auto_2419083 - HOIST
      ?auto_2419086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2419084 ?auto_2419085 ) ( SURFACE-AT ?auto_2419079 ?auto_2419085 ) ( CLEAR ?auto_2419079 ) ( IS-CRATE ?auto_2419080 ) ( not ( = ?auto_2419079 ?auto_2419080 ) ) ( AVAILABLE ?auto_2419084 ) ( ON ?auto_2419079 ?auto_2419078 ) ( not ( = ?auto_2419078 ?auto_2419079 ) ) ( not ( = ?auto_2419078 ?auto_2419080 ) ) ( TRUCK-AT ?auto_2419081 ?auto_2419082 ) ( not ( = ?auto_2419082 ?auto_2419085 ) ) ( HOIST-AT ?auto_2419083 ?auto_2419082 ) ( not ( = ?auto_2419084 ?auto_2419083 ) ) ( AVAILABLE ?auto_2419083 ) ( SURFACE-AT ?auto_2419080 ?auto_2419082 ) ( ON ?auto_2419080 ?auto_2419086 ) ( CLEAR ?auto_2419080 ) ( not ( = ?auto_2419079 ?auto_2419086 ) ) ( not ( = ?auto_2419080 ?auto_2419086 ) ) ( not ( = ?auto_2419078 ?auto_2419086 ) ) ( ON ?auto_2419070 ?auto_2419069 ) ( ON ?auto_2419071 ?auto_2419070 ) ( ON ?auto_2419073 ?auto_2419071 ) ( ON ?auto_2419072 ?auto_2419073 ) ( ON ?auto_2419074 ?auto_2419072 ) ( ON ?auto_2419075 ?auto_2419074 ) ( ON ?auto_2419076 ?auto_2419075 ) ( ON ?auto_2419077 ?auto_2419076 ) ( ON ?auto_2419078 ?auto_2419077 ) ( not ( = ?auto_2419069 ?auto_2419070 ) ) ( not ( = ?auto_2419069 ?auto_2419071 ) ) ( not ( = ?auto_2419069 ?auto_2419073 ) ) ( not ( = ?auto_2419069 ?auto_2419072 ) ) ( not ( = ?auto_2419069 ?auto_2419074 ) ) ( not ( = ?auto_2419069 ?auto_2419075 ) ) ( not ( = ?auto_2419069 ?auto_2419076 ) ) ( not ( = ?auto_2419069 ?auto_2419077 ) ) ( not ( = ?auto_2419069 ?auto_2419078 ) ) ( not ( = ?auto_2419069 ?auto_2419079 ) ) ( not ( = ?auto_2419069 ?auto_2419080 ) ) ( not ( = ?auto_2419069 ?auto_2419086 ) ) ( not ( = ?auto_2419070 ?auto_2419071 ) ) ( not ( = ?auto_2419070 ?auto_2419073 ) ) ( not ( = ?auto_2419070 ?auto_2419072 ) ) ( not ( = ?auto_2419070 ?auto_2419074 ) ) ( not ( = ?auto_2419070 ?auto_2419075 ) ) ( not ( = ?auto_2419070 ?auto_2419076 ) ) ( not ( = ?auto_2419070 ?auto_2419077 ) ) ( not ( = ?auto_2419070 ?auto_2419078 ) ) ( not ( = ?auto_2419070 ?auto_2419079 ) ) ( not ( = ?auto_2419070 ?auto_2419080 ) ) ( not ( = ?auto_2419070 ?auto_2419086 ) ) ( not ( = ?auto_2419071 ?auto_2419073 ) ) ( not ( = ?auto_2419071 ?auto_2419072 ) ) ( not ( = ?auto_2419071 ?auto_2419074 ) ) ( not ( = ?auto_2419071 ?auto_2419075 ) ) ( not ( = ?auto_2419071 ?auto_2419076 ) ) ( not ( = ?auto_2419071 ?auto_2419077 ) ) ( not ( = ?auto_2419071 ?auto_2419078 ) ) ( not ( = ?auto_2419071 ?auto_2419079 ) ) ( not ( = ?auto_2419071 ?auto_2419080 ) ) ( not ( = ?auto_2419071 ?auto_2419086 ) ) ( not ( = ?auto_2419073 ?auto_2419072 ) ) ( not ( = ?auto_2419073 ?auto_2419074 ) ) ( not ( = ?auto_2419073 ?auto_2419075 ) ) ( not ( = ?auto_2419073 ?auto_2419076 ) ) ( not ( = ?auto_2419073 ?auto_2419077 ) ) ( not ( = ?auto_2419073 ?auto_2419078 ) ) ( not ( = ?auto_2419073 ?auto_2419079 ) ) ( not ( = ?auto_2419073 ?auto_2419080 ) ) ( not ( = ?auto_2419073 ?auto_2419086 ) ) ( not ( = ?auto_2419072 ?auto_2419074 ) ) ( not ( = ?auto_2419072 ?auto_2419075 ) ) ( not ( = ?auto_2419072 ?auto_2419076 ) ) ( not ( = ?auto_2419072 ?auto_2419077 ) ) ( not ( = ?auto_2419072 ?auto_2419078 ) ) ( not ( = ?auto_2419072 ?auto_2419079 ) ) ( not ( = ?auto_2419072 ?auto_2419080 ) ) ( not ( = ?auto_2419072 ?auto_2419086 ) ) ( not ( = ?auto_2419074 ?auto_2419075 ) ) ( not ( = ?auto_2419074 ?auto_2419076 ) ) ( not ( = ?auto_2419074 ?auto_2419077 ) ) ( not ( = ?auto_2419074 ?auto_2419078 ) ) ( not ( = ?auto_2419074 ?auto_2419079 ) ) ( not ( = ?auto_2419074 ?auto_2419080 ) ) ( not ( = ?auto_2419074 ?auto_2419086 ) ) ( not ( = ?auto_2419075 ?auto_2419076 ) ) ( not ( = ?auto_2419075 ?auto_2419077 ) ) ( not ( = ?auto_2419075 ?auto_2419078 ) ) ( not ( = ?auto_2419075 ?auto_2419079 ) ) ( not ( = ?auto_2419075 ?auto_2419080 ) ) ( not ( = ?auto_2419075 ?auto_2419086 ) ) ( not ( = ?auto_2419076 ?auto_2419077 ) ) ( not ( = ?auto_2419076 ?auto_2419078 ) ) ( not ( = ?auto_2419076 ?auto_2419079 ) ) ( not ( = ?auto_2419076 ?auto_2419080 ) ) ( not ( = ?auto_2419076 ?auto_2419086 ) ) ( not ( = ?auto_2419077 ?auto_2419078 ) ) ( not ( = ?auto_2419077 ?auto_2419079 ) ) ( not ( = ?auto_2419077 ?auto_2419080 ) ) ( not ( = ?auto_2419077 ?auto_2419086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2419078 ?auto_2419079 ?auto_2419080 )
      ( MAKE-11CRATE-VERIFY ?auto_2419069 ?auto_2419070 ?auto_2419071 ?auto_2419073 ?auto_2419072 ?auto_2419074 ?auto_2419075 ?auto_2419076 ?auto_2419077 ?auto_2419078 ?auto_2419079 ?auto_2419080 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2419213 - SURFACE
      ?auto_2419214 - SURFACE
      ?auto_2419215 - SURFACE
      ?auto_2419217 - SURFACE
      ?auto_2419216 - SURFACE
      ?auto_2419218 - SURFACE
      ?auto_2419219 - SURFACE
      ?auto_2419220 - SURFACE
      ?auto_2419221 - SURFACE
      ?auto_2419222 - SURFACE
      ?auto_2419223 - SURFACE
      ?auto_2419224 - SURFACE
    )
    :vars
    (
      ?auto_2419228 - HOIST
      ?auto_2419226 - PLACE
      ?auto_2419225 - PLACE
      ?auto_2419230 - HOIST
      ?auto_2419227 - SURFACE
      ?auto_2419229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2419228 ?auto_2419226 ) ( SURFACE-AT ?auto_2419223 ?auto_2419226 ) ( CLEAR ?auto_2419223 ) ( IS-CRATE ?auto_2419224 ) ( not ( = ?auto_2419223 ?auto_2419224 ) ) ( AVAILABLE ?auto_2419228 ) ( ON ?auto_2419223 ?auto_2419222 ) ( not ( = ?auto_2419222 ?auto_2419223 ) ) ( not ( = ?auto_2419222 ?auto_2419224 ) ) ( not ( = ?auto_2419225 ?auto_2419226 ) ) ( HOIST-AT ?auto_2419230 ?auto_2419225 ) ( not ( = ?auto_2419228 ?auto_2419230 ) ) ( AVAILABLE ?auto_2419230 ) ( SURFACE-AT ?auto_2419224 ?auto_2419225 ) ( ON ?auto_2419224 ?auto_2419227 ) ( CLEAR ?auto_2419224 ) ( not ( = ?auto_2419223 ?auto_2419227 ) ) ( not ( = ?auto_2419224 ?auto_2419227 ) ) ( not ( = ?auto_2419222 ?auto_2419227 ) ) ( TRUCK-AT ?auto_2419229 ?auto_2419226 ) ( ON ?auto_2419214 ?auto_2419213 ) ( ON ?auto_2419215 ?auto_2419214 ) ( ON ?auto_2419217 ?auto_2419215 ) ( ON ?auto_2419216 ?auto_2419217 ) ( ON ?auto_2419218 ?auto_2419216 ) ( ON ?auto_2419219 ?auto_2419218 ) ( ON ?auto_2419220 ?auto_2419219 ) ( ON ?auto_2419221 ?auto_2419220 ) ( ON ?auto_2419222 ?auto_2419221 ) ( not ( = ?auto_2419213 ?auto_2419214 ) ) ( not ( = ?auto_2419213 ?auto_2419215 ) ) ( not ( = ?auto_2419213 ?auto_2419217 ) ) ( not ( = ?auto_2419213 ?auto_2419216 ) ) ( not ( = ?auto_2419213 ?auto_2419218 ) ) ( not ( = ?auto_2419213 ?auto_2419219 ) ) ( not ( = ?auto_2419213 ?auto_2419220 ) ) ( not ( = ?auto_2419213 ?auto_2419221 ) ) ( not ( = ?auto_2419213 ?auto_2419222 ) ) ( not ( = ?auto_2419213 ?auto_2419223 ) ) ( not ( = ?auto_2419213 ?auto_2419224 ) ) ( not ( = ?auto_2419213 ?auto_2419227 ) ) ( not ( = ?auto_2419214 ?auto_2419215 ) ) ( not ( = ?auto_2419214 ?auto_2419217 ) ) ( not ( = ?auto_2419214 ?auto_2419216 ) ) ( not ( = ?auto_2419214 ?auto_2419218 ) ) ( not ( = ?auto_2419214 ?auto_2419219 ) ) ( not ( = ?auto_2419214 ?auto_2419220 ) ) ( not ( = ?auto_2419214 ?auto_2419221 ) ) ( not ( = ?auto_2419214 ?auto_2419222 ) ) ( not ( = ?auto_2419214 ?auto_2419223 ) ) ( not ( = ?auto_2419214 ?auto_2419224 ) ) ( not ( = ?auto_2419214 ?auto_2419227 ) ) ( not ( = ?auto_2419215 ?auto_2419217 ) ) ( not ( = ?auto_2419215 ?auto_2419216 ) ) ( not ( = ?auto_2419215 ?auto_2419218 ) ) ( not ( = ?auto_2419215 ?auto_2419219 ) ) ( not ( = ?auto_2419215 ?auto_2419220 ) ) ( not ( = ?auto_2419215 ?auto_2419221 ) ) ( not ( = ?auto_2419215 ?auto_2419222 ) ) ( not ( = ?auto_2419215 ?auto_2419223 ) ) ( not ( = ?auto_2419215 ?auto_2419224 ) ) ( not ( = ?auto_2419215 ?auto_2419227 ) ) ( not ( = ?auto_2419217 ?auto_2419216 ) ) ( not ( = ?auto_2419217 ?auto_2419218 ) ) ( not ( = ?auto_2419217 ?auto_2419219 ) ) ( not ( = ?auto_2419217 ?auto_2419220 ) ) ( not ( = ?auto_2419217 ?auto_2419221 ) ) ( not ( = ?auto_2419217 ?auto_2419222 ) ) ( not ( = ?auto_2419217 ?auto_2419223 ) ) ( not ( = ?auto_2419217 ?auto_2419224 ) ) ( not ( = ?auto_2419217 ?auto_2419227 ) ) ( not ( = ?auto_2419216 ?auto_2419218 ) ) ( not ( = ?auto_2419216 ?auto_2419219 ) ) ( not ( = ?auto_2419216 ?auto_2419220 ) ) ( not ( = ?auto_2419216 ?auto_2419221 ) ) ( not ( = ?auto_2419216 ?auto_2419222 ) ) ( not ( = ?auto_2419216 ?auto_2419223 ) ) ( not ( = ?auto_2419216 ?auto_2419224 ) ) ( not ( = ?auto_2419216 ?auto_2419227 ) ) ( not ( = ?auto_2419218 ?auto_2419219 ) ) ( not ( = ?auto_2419218 ?auto_2419220 ) ) ( not ( = ?auto_2419218 ?auto_2419221 ) ) ( not ( = ?auto_2419218 ?auto_2419222 ) ) ( not ( = ?auto_2419218 ?auto_2419223 ) ) ( not ( = ?auto_2419218 ?auto_2419224 ) ) ( not ( = ?auto_2419218 ?auto_2419227 ) ) ( not ( = ?auto_2419219 ?auto_2419220 ) ) ( not ( = ?auto_2419219 ?auto_2419221 ) ) ( not ( = ?auto_2419219 ?auto_2419222 ) ) ( not ( = ?auto_2419219 ?auto_2419223 ) ) ( not ( = ?auto_2419219 ?auto_2419224 ) ) ( not ( = ?auto_2419219 ?auto_2419227 ) ) ( not ( = ?auto_2419220 ?auto_2419221 ) ) ( not ( = ?auto_2419220 ?auto_2419222 ) ) ( not ( = ?auto_2419220 ?auto_2419223 ) ) ( not ( = ?auto_2419220 ?auto_2419224 ) ) ( not ( = ?auto_2419220 ?auto_2419227 ) ) ( not ( = ?auto_2419221 ?auto_2419222 ) ) ( not ( = ?auto_2419221 ?auto_2419223 ) ) ( not ( = ?auto_2419221 ?auto_2419224 ) ) ( not ( = ?auto_2419221 ?auto_2419227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2419222 ?auto_2419223 ?auto_2419224 )
      ( MAKE-11CRATE-VERIFY ?auto_2419213 ?auto_2419214 ?auto_2419215 ?auto_2419217 ?auto_2419216 ?auto_2419218 ?auto_2419219 ?auto_2419220 ?auto_2419221 ?auto_2419222 ?auto_2419223 ?auto_2419224 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2419357 - SURFACE
      ?auto_2419358 - SURFACE
      ?auto_2419359 - SURFACE
      ?auto_2419361 - SURFACE
      ?auto_2419360 - SURFACE
      ?auto_2419362 - SURFACE
      ?auto_2419363 - SURFACE
      ?auto_2419364 - SURFACE
      ?auto_2419365 - SURFACE
      ?auto_2419366 - SURFACE
      ?auto_2419367 - SURFACE
      ?auto_2419368 - SURFACE
    )
    :vars
    (
      ?auto_2419374 - HOIST
      ?auto_2419370 - PLACE
      ?auto_2419372 - PLACE
      ?auto_2419371 - HOIST
      ?auto_2419373 - SURFACE
      ?auto_2419369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2419374 ?auto_2419370 ) ( IS-CRATE ?auto_2419368 ) ( not ( = ?auto_2419367 ?auto_2419368 ) ) ( not ( = ?auto_2419366 ?auto_2419367 ) ) ( not ( = ?auto_2419366 ?auto_2419368 ) ) ( not ( = ?auto_2419372 ?auto_2419370 ) ) ( HOIST-AT ?auto_2419371 ?auto_2419372 ) ( not ( = ?auto_2419374 ?auto_2419371 ) ) ( AVAILABLE ?auto_2419371 ) ( SURFACE-AT ?auto_2419368 ?auto_2419372 ) ( ON ?auto_2419368 ?auto_2419373 ) ( CLEAR ?auto_2419368 ) ( not ( = ?auto_2419367 ?auto_2419373 ) ) ( not ( = ?auto_2419368 ?auto_2419373 ) ) ( not ( = ?auto_2419366 ?auto_2419373 ) ) ( TRUCK-AT ?auto_2419369 ?auto_2419370 ) ( SURFACE-AT ?auto_2419366 ?auto_2419370 ) ( CLEAR ?auto_2419366 ) ( LIFTING ?auto_2419374 ?auto_2419367 ) ( IS-CRATE ?auto_2419367 ) ( ON ?auto_2419358 ?auto_2419357 ) ( ON ?auto_2419359 ?auto_2419358 ) ( ON ?auto_2419361 ?auto_2419359 ) ( ON ?auto_2419360 ?auto_2419361 ) ( ON ?auto_2419362 ?auto_2419360 ) ( ON ?auto_2419363 ?auto_2419362 ) ( ON ?auto_2419364 ?auto_2419363 ) ( ON ?auto_2419365 ?auto_2419364 ) ( ON ?auto_2419366 ?auto_2419365 ) ( not ( = ?auto_2419357 ?auto_2419358 ) ) ( not ( = ?auto_2419357 ?auto_2419359 ) ) ( not ( = ?auto_2419357 ?auto_2419361 ) ) ( not ( = ?auto_2419357 ?auto_2419360 ) ) ( not ( = ?auto_2419357 ?auto_2419362 ) ) ( not ( = ?auto_2419357 ?auto_2419363 ) ) ( not ( = ?auto_2419357 ?auto_2419364 ) ) ( not ( = ?auto_2419357 ?auto_2419365 ) ) ( not ( = ?auto_2419357 ?auto_2419366 ) ) ( not ( = ?auto_2419357 ?auto_2419367 ) ) ( not ( = ?auto_2419357 ?auto_2419368 ) ) ( not ( = ?auto_2419357 ?auto_2419373 ) ) ( not ( = ?auto_2419358 ?auto_2419359 ) ) ( not ( = ?auto_2419358 ?auto_2419361 ) ) ( not ( = ?auto_2419358 ?auto_2419360 ) ) ( not ( = ?auto_2419358 ?auto_2419362 ) ) ( not ( = ?auto_2419358 ?auto_2419363 ) ) ( not ( = ?auto_2419358 ?auto_2419364 ) ) ( not ( = ?auto_2419358 ?auto_2419365 ) ) ( not ( = ?auto_2419358 ?auto_2419366 ) ) ( not ( = ?auto_2419358 ?auto_2419367 ) ) ( not ( = ?auto_2419358 ?auto_2419368 ) ) ( not ( = ?auto_2419358 ?auto_2419373 ) ) ( not ( = ?auto_2419359 ?auto_2419361 ) ) ( not ( = ?auto_2419359 ?auto_2419360 ) ) ( not ( = ?auto_2419359 ?auto_2419362 ) ) ( not ( = ?auto_2419359 ?auto_2419363 ) ) ( not ( = ?auto_2419359 ?auto_2419364 ) ) ( not ( = ?auto_2419359 ?auto_2419365 ) ) ( not ( = ?auto_2419359 ?auto_2419366 ) ) ( not ( = ?auto_2419359 ?auto_2419367 ) ) ( not ( = ?auto_2419359 ?auto_2419368 ) ) ( not ( = ?auto_2419359 ?auto_2419373 ) ) ( not ( = ?auto_2419361 ?auto_2419360 ) ) ( not ( = ?auto_2419361 ?auto_2419362 ) ) ( not ( = ?auto_2419361 ?auto_2419363 ) ) ( not ( = ?auto_2419361 ?auto_2419364 ) ) ( not ( = ?auto_2419361 ?auto_2419365 ) ) ( not ( = ?auto_2419361 ?auto_2419366 ) ) ( not ( = ?auto_2419361 ?auto_2419367 ) ) ( not ( = ?auto_2419361 ?auto_2419368 ) ) ( not ( = ?auto_2419361 ?auto_2419373 ) ) ( not ( = ?auto_2419360 ?auto_2419362 ) ) ( not ( = ?auto_2419360 ?auto_2419363 ) ) ( not ( = ?auto_2419360 ?auto_2419364 ) ) ( not ( = ?auto_2419360 ?auto_2419365 ) ) ( not ( = ?auto_2419360 ?auto_2419366 ) ) ( not ( = ?auto_2419360 ?auto_2419367 ) ) ( not ( = ?auto_2419360 ?auto_2419368 ) ) ( not ( = ?auto_2419360 ?auto_2419373 ) ) ( not ( = ?auto_2419362 ?auto_2419363 ) ) ( not ( = ?auto_2419362 ?auto_2419364 ) ) ( not ( = ?auto_2419362 ?auto_2419365 ) ) ( not ( = ?auto_2419362 ?auto_2419366 ) ) ( not ( = ?auto_2419362 ?auto_2419367 ) ) ( not ( = ?auto_2419362 ?auto_2419368 ) ) ( not ( = ?auto_2419362 ?auto_2419373 ) ) ( not ( = ?auto_2419363 ?auto_2419364 ) ) ( not ( = ?auto_2419363 ?auto_2419365 ) ) ( not ( = ?auto_2419363 ?auto_2419366 ) ) ( not ( = ?auto_2419363 ?auto_2419367 ) ) ( not ( = ?auto_2419363 ?auto_2419368 ) ) ( not ( = ?auto_2419363 ?auto_2419373 ) ) ( not ( = ?auto_2419364 ?auto_2419365 ) ) ( not ( = ?auto_2419364 ?auto_2419366 ) ) ( not ( = ?auto_2419364 ?auto_2419367 ) ) ( not ( = ?auto_2419364 ?auto_2419368 ) ) ( not ( = ?auto_2419364 ?auto_2419373 ) ) ( not ( = ?auto_2419365 ?auto_2419366 ) ) ( not ( = ?auto_2419365 ?auto_2419367 ) ) ( not ( = ?auto_2419365 ?auto_2419368 ) ) ( not ( = ?auto_2419365 ?auto_2419373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2419366 ?auto_2419367 ?auto_2419368 )
      ( MAKE-11CRATE-VERIFY ?auto_2419357 ?auto_2419358 ?auto_2419359 ?auto_2419361 ?auto_2419360 ?auto_2419362 ?auto_2419363 ?auto_2419364 ?auto_2419365 ?auto_2419366 ?auto_2419367 ?auto_2419368 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2419501 - SURFACE
      ?auto_2419502 - SURFACE
      ?auto_2419503 - SURFACE
      ?auto_2419505 - SURFACE
      ?auto_2419504 - SURFACE
      ?auto_2419506 - SURFACE
      ?auto_2419507 - SURFACE
      ?auto_2419508 - SURFACE
      ?auto_2419509 - SURFACE
      ?auto_2419510 - SURFACE
      ?auto_2419511 - SURFACE
      ?auto_2419512 - SURFACE
    )
    :vars
    (
      ?auto_2419518 - HOIST
      ?auto_2419516 - PLACE
      ?auto_2419517 - PLACE
      ?auto_2419515 - HOIST
      ?auto_2419513 - SURFACE
      ?auto_2419514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2419518 ?auto_2419516 ) ( IS-CRATE ?auto_2419512 ) ( not ( = ?auto_2419511 ?auto_2419512 ) ) ( not ( = ?auto_2419510 ?auto_2419511 ) ) ( not ( = ?auto_2419510 ?auto_2419512 ) ) ( not ( = ?auto_2419517 ?auto_2419516 ) ) ( HOIST-AT ?auto_2419515 ?auto_2419517 ) ( not ( = ?auto_2419518 ?auto_2419515 ) ) ( AVAILABLE ?auto_2419515 ) ( SURFACE-AT ?auto_2419512 ?auto_2419517 ) ( ON ?auto_2419512 ?auto_2419513 ) ( CLEAR ?auto_2419512 ) ( not ( = ?auto_2419511 ?auto_2419513 ) ) ( not ( = ?auto_2419512 ?auto_2419513 ) ) ( not ( = ?auto_2419510 ?auto_2419513 ) ) ( TRUCK-AT ?auto_2419514 ?auto_2419516 ) ( SURFACE-AT ?auto_2419510 ?auto_2419516 ) ( CLEAR ?auto_2419510 ) ( IS-CRATE ?auto_2419511 ) ( AVAILABLE ?auto_2419518 ) ( IN ?auto_2419511 ?auto_2419514 ) ( ON ?auto_2419502 ?auto_2419501 ) ( ON ?auto_2419503 ?auto_2419502 ) ( ON ?auto_2419505 ?auto_2419503 ) ( ON ?auto_2419504 ?auto_2419505 ) ( ON ?auto_2419506 ?auto_2419504 ) ( ON ?auto_2419507 ?auto_2419506 ) ( ON ?auto_2419508 ?auto_2419507 ) ( ON ?auto_2419509 ?auto_2419508 ) ( ON ?auto_2419510 ?auto_2419509 ) ( not ( = ?auto_2419501 ?auto_2419502 ) ) ( not ( = ?auto_2419501 ?auto_2419503 ) ) ( not ( = ?auto_2419501 ?auto_2419505 ) ) ( not ( = ?auto_2419501 ?auto_2419504 ) ) ( not ( = ?auto_2419501 ?auto_2419506 ) ) ( not ( = ?auto_2419501 ?auto_2419507 ) ) ( not ( = ?auto_2419501 ?auto_2419508 ) ) ( not ( = ?auto_2419501 ?auto_2419509 ) ) ( not ( = ?auto_2419501 ?auto_2419510 ) ) ( not ( = ?auto_2419501 ?auto_2419511 ) ) ( not ( = ?auto_2419501 ?auto_2419512 ) ) ( not ( = ?auto_2419501 ?auto_2419513 ) ) ( not ( = ?auto_2419502 ?auto_2419503 ) ) ( not ( = ?auto_2419502 ?auto_2419505 ) ) ( not ( = ?auto_2419502 ?auto_2419504 ) ) ( not ( = ?auto_2419502 ?auto_2419506 ) ) ( not ( = ?auto_2419502 ?auto_2419507 ) ) ( not ( = ?auto_2419502 ?auto_2419508 ) ) ( not ( = ?auto_2419502 ?auto_2419509 ) ) ( not ( = ?auto_2419502 ?auto_2419510 ) ) ( not ( = ?auto_2419502 ?auto_2419511 ) ) ( not ( = ?auto_2419502 ?auto_2419512 ) ) ( not ( = ?auto_2419502 ?auto_2419513 ) ) ( not ( = ?auto_2419503 ?auto_2419505 ) ) ( not ( = ?auto_2419503 ?auto_2419504 ) ) ( not ( = ?auto_2419503 ?auto_2419506 ) ) ( not ( = ?auto_2419503 ?auto_2419507 ) ) ( not ( = ?auto_2419503 ?auto_2419508 ) ) ( not ( = ?auto_2419503 ?auto_2419509 ) ) ( not ( = ?auto_2419503 ?auto_2419510 ) ) ( not ( = ?auto_2419503 ?auto_2419511 ) ) ( not ( = ?auto_2419503 ?auto_2419512 ) ) ( not ( = ?auto_2419503 ?auto_2419513 ) ) ( not ( = ?auto_2419505 ?auto_2419504 ) ) ( not ( = ?auto_2419505 ?auto_2419506 ) ) ( not ( = ?auto_2419505 ?auto_2419507 ) ) ( not ( = ?auto_2419505 ?auto_2419508 ) ) ( not ( = ?auto_2419505 ?auto_2419509 ) ) ( not ( = ?auto_2419505 ?auto_2419510 ) ) ( not ( = ?auto_2419505 ?auto_2419511 ) ) ( not ( = ?auto_2419505 ?auto_2419512 ) ) ( not ( = ?auto_2419505 ?auto_2419513 ) ) ( not ( = ?auto_2419504 ?auto_2419506 ) ) ( not ( = ?auto_2419504 ?auto_2419507 ) ) ( not ( = ?auto_2419504 ?auto_2419508 ) ) ( not ( = ?auto_2419504 ?auto_2419509 ) ) ( not ( = ?auto_2419504 ?auto_2419510 ) ) ( not ( = ?auto_2419504 ?auto_2419511 ) ) ( not ( = ?auto_2419504 ?auto_2419512 ) ) ( not ( = ?auto_2419504 ?auto_2419513 ) ) ( not ( = ?auto_2419506 ?auto_2419507 ) ) ( not ( = ?auto_2419506 ?auto_2419508 ) ) ( not ( = ?auto_2419506 ?auto_2419509 ) ) ( not ( = ?auto_2419506 ?auto_2419510 ) ) ( not ( = ?auto_2419506 ?auto_2419511 ) ) ( not ( = ?auto_2419506 ?auto_2419512 ) ) ( not ( = ?auto_2419506 ?auto_2419513 ) ) ( not ( = ?auto_2419507 ?auto_2419508 ) ) ( not ( = ?auto_2419507 ?auto_2419509 ) ) ( not ( = ?auto_2419507 ?auto_2419510 ) ) ( not ( = ?auto_2419507 ?auto_2419511 ) ) ( not ( = ?auto_2419507 ?auto_2419512 ) ) ( not ( = ?auto_2419507 ?auto_2419513 ) ) ( not ( = ?auto_2419508 ?auto_2419509 ) ) ( not ( = ?auto_2419508 ?auto_2419510 ) ) ( not ( = ?auto_2419508 ?auto_2419511 ) ) ( not ( = ?auto_2419508 ?auto_2419512 ) ) ( not ( = ?auto_2419508 ?auto_2419513 ) ) ( not ( = ?auto_2419509 ?auto_2419510 ) ) ( not ( = ?auto_2419509 ?auto_2419511 ) ) ( not ( = ?auto_2419509 ?auto_2419512 ) ) ( not ( = ?auto_2419509 ?auto_2419513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2419510 ?auto_2419511 ?auto_2419512 )
      ( MAKE-11CRATE-VERIFY ?auto_2419501 ?auto_2419502 ?auto_2419503 ?auto_2419505 ?auto_2419504 ?auto_2419506 ?auto_2419507 ?auto_2419508 ?auto_2419509 ?auto_2419510 ?auto_2419511 ?auto_2419512 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2428792 - SURFACE
      ?auto_2428793 - SURFACE
      ?auto_2428794 - SURFACE
      ?auto_2428796 - SURFACE
      ?auto_2428795 - SURFACE
      ?auto_2428797 - SURFACE
      ?auto_2428798 - SURFACE
      ?auto_2428799 - SURFACE
      ?auto_2428800 - SURFACE
      ?auto_2428801 - SURFACE
      ?auto_2428802 - SURFACE
      ?auto_2428803 - SURFACE
      ?auto_2428804 - SURFACE
    )
    :vars
    (
      ?auto_2428805 - HOIST
      ?auto_2428806 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2428805 ?auto_2428806 ) ( SURFACE-AT ?auto_2428803 ?auto_2428806 ) ( CLEAR ?auto_2428803 ) ( LIFTING ?auto_2428805 ?auto_2428804 ) ( IS-CRATE ?auto_2428804 ) ( not ( = ?auto_2428803 ?auto_2428804 ) ) ( ON ?auto_2428793 ?auto_2428792 ) ( ON ?auto_2428794 ?auto_2428793 ) ( ON ?auto_2428796 ?auto_2428794 ) ( ON ?auto_2428795 ?auto_2428796 ) ( ON ?auto_2428797 ?auto_2428795 ) ( ON ?auto_2428798 ?auto_2428797 ) ( ON ?auto_2428799 ?auto_2428798 ) ( ON ?auto_2428800 ?auto_2428799 ) ( ON ?auto_2428801 ?auto_2428800 ) ( ON ?auto_2428802 ?auto_2428801 ) ( ON ?auto_2428803 ?auto_2428802 ) ( not ( = ?auto_2428792 ?auto_2428793 ) ) ( not ( = ?auto_2428792 ?auto_2428794 ) ) ( not ( = ?auto_2428792 ?auto_2428796 ) ) ( not ( = ?auto_2428792 ?auto_2428795 ) ) ( not ( = ?auto_2428792 ?auto_2428797 ) ) ( not ( = ?auto_2428792 ?auto_2428798 ) ) ( not ( = ?auto_2428792 ?auto_2428799 ) ) ( not ( = ?auto_2428792 ?auto_2428800 ) ) ( not ( = ?auto_2428792 ?auto_2428801 ) ) ( not ( = ?auto_2428792 ?auto_2428802 ) ) ( not ( = ?auto_2428792 ?auto_2428803 ) ) ( not ( = ?auto_2428792 ?auto_2428804 ) ) ( not ( = ?auto_2428793 ?auto_2428794 ) ) ( not ( = ?auto_2428793 ?auto_2428796 ) ) ( not ( = ?auto_2428793 ?auto_2428795 ) ) ( not ( = ?auto_2428793 ?auto_2428797 ) ) ( not ( = ?auto_2428793 ?auto_2428798 ) ) ( not ( = ?auto_2428793 ?auto_2428799 ) ) ( not ( = ?auto_2428793 ?auto_2428800 ) ) ( not ( = ?auto_2428793 ?auto_2428801 ) ) ( not ( = ?auto_2428793 ?auto_2428802 ) ) ( not ( = ?auto_2428793 ?auto_2428803 ) ) ( not ( = ?auto_2428793 ?auto_2428804 ) ) ( not ( = ?auto_2428794 ?auto_2428796 ) ) ( not ( = ?auto_2428794 ?auto_2428795 ) ) ( not ( = ?auto_2428794 ?auto_2428797 ) ) ( not ( = ?auto_2428794 ?auto_2428798 ) ) ( not ( = ?auto_2428794 ?auto_2428799 ) ) ( not ( = ?auto_2428794 ?auto_2428800 ) ) ( not ( = ?auto_2428794 ?auto_2428801 ) ) ( not ( = ?auto_2428794 ?auto_2428802 ) ) ( not ( = ?auto_2428794 ?auto_2428803 ) ) ( not ( = ?auto_2428794 ?auto_2428804 ) ) ( not ( = ?auto_2428796 ?auto_2428795 ) ) ( not ( = ?auto_2428796 ?auto_2428797 ) ) ( not ( = ?auto_2428796 ?auto_2428798 ) ) ( not ( = ?auto_2428796 ?auto_2428799 ) ) ( not ( = ?auto_2428796 ?auto_2428800 ) ) ( not ( = ?auto_2428796 ?auto_2428801 ) ) ( not ( = ?auto_2428796 ?auto_2428802 ) ) ( not ( = ?auto_2428796 ?auto_2428803 ) ) ( not ( = ?auto_2428796 ?auto_2428804 ) ) ( not ( = ?auto_2428795 ?auto_2428797 ) ) ( not ( = ?auto_2428795 ?auto_2428798 ) ) ( not ( = ?auto_2428795 ?auto_2428799 ) ) ( not ( = ?auto_2428795 ?auto_2428800 ) ) ( not ( = ?auto_2428795 ?auto_2428801 ) ) ( not ( = ?auto_2428795 ?auto_2428802 ) ) ( not ( = ?auto_2428795 ?auto_2428803 ) ) ( not ( = ?auto_2428795 ?auto_2428804 ) ) ( not ( = ?auto_2428797 ?auto_2428798 ) ) ( not ( = ?auto_2428797 ?auto_2428799 ) ) ( not ( = ?auto_2428797 ?auto_2428800 ) ) ( not ( = ?auto_2428797 ?auto_2428801 ) ) ( not ( = ?auto_2428797 ?auto_2428802 ) ) ( not ( = ?auto_2428797 ?auto_2428803 ) ) ( not ( = ?auto_2428797 ?auto_2428804 ) ) ( not ( = ?auto_2428798 ?auto_2428799 ) ) ( not ( = ?auto_2428798 ?auto_2428800 ) ) ( not ( = ?auto_2428798 ?auto_2428801 ) ) ( not ( = ?auto_2428798 ?auto_2428802 ) ) ( not ( = ?auto_2428798 ?auto_2428803 ) ) ( not ( = ?auto_2428798 ?auto_2428804 ) ) ( not ( = ?auto_2428799 ?auto_2428800 ) ) ( not ( = ?auto_2428799 ?auto_2428801 ) ) ( not ( = ?auto_2428799 ?auto_2428802 ) ) ( not ( = ?auto_2428799 ?auto_2428803 ) ) ( not ( = ?auto_2428799 ?auto_2428804 ) ) ( not ( = ?auto_2428800 ?auto_2428801 ) ) ( not ( = ?auto_2428800 ?auto_2428802 ) ) ( not ( = ?auto_2428800 ?auto_2428803 ) ) ( not ( = ?auto_2428800 ?auto_2428804 ) ) ( not ( = ?auto_2428801 ?auto_2428802 ) ) ( not ( = ?auto_2428801 ?auto_2428803 ) ) ( not ( = ?auto_2428801 ?auto_2428804 ) ) ( not ( = ?auto_2428802 ?auto_2428803 ) ) ( not ( = ?auto_2428802 ?auto_2428804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2428803 ?auto_2428804 )
      ( MAKE-12CRATE-VERIFY ?auto_2428792 ?auto_2428793 ?auto_2428794 ?auto_2428796 ?auto_2428795 ?auto_2428797 ?auto_2428798 ?auto_2428799 ?auto_2428800 ?auto_2428801 ?auto_2428802 ?auto_2428803 ?auto_2428804 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2428917 - SURFACE
      ?auto_2428918 - SURFACE
      ?auto_2428919 - SURFACE
      ?auto_2428921 - SURFACE
      ?auto_2428920 - SURFACE
      ?auto_2428922 - SURFACE
      ?auto_2428923 - SURFACE
      ?auto_2428924 - SURFACE
      ?auto_2428925 - SURFACE
      ?auto_2428926 - SURFACE
      ?auto_2428927 - SURFACE
      ?auto_2428928 - SURFACE
      ?auto_2428929 - SURFACE
    )
    :vars
    (
      ?auto_2428931 - HOIST
      ?auto_2428932 - PLACE
      ?auto_2428930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2428931 ?auto_2428932 ) ( SURFACE-AT ?auto_2428928 ?auto_2428932 ) ( CLEAR ?auto_2428928 ) ( IS-CRATE ?auto_2428929 ) ( not ( = ?auto_2428928 ?auto_2428929 ) ) ( TRUCK-AT ?auto_2428930 ?auto_2428932 ) ( AVAILABLE ?auto_2428931 ) ( IN ?auto_2428929 ?auto_2428930 ) ( ON ?auto_2428928 ?auto_2428927 ) ( not ( = ?auto_2428927 ?auto_2428928 ) ) ( not ( = ?auto_2428927 ?auto_2428929 ) ) ( ON ?auto_2428918 ?auto_2428917 ) ( ON ?auto_2428919 ?auto_2428918 ) ( ON ?auto_2428921 ?auto_2428919 ) ( ON ?auto_2428920 ?auto_2428921 ) ( ON ?auto_2428922 ?auto_2428920 ) ( ON ?auto_2428923 ?auto_2428922 ) ( ON ?auto_2428924 ?auto_2428923 ) ( ON ?auto_2428925 ?auto_2428924 ) ( ON ?auto_2428926 ?auto_2428925 ) ( ON ?auto_2428927 ?auto_2428926 ) ( not ( = ?auto_2428917 ?auto_2428918 ) ) ( not ( = ?auto_2428917 ?auto_2428919 ) ) ( not ( = ?auto_2428917 ?auto_2428921 ) ) ( not ( = ?auto_2428917 ?auto_2428920 ) ) ( not ( = ?auto_2428917 ?auto_2428922 ) ) ( not ( = ?auto_2428917 ?auto_2428923 ) ) ( not ( = ?auto_2428917 ?auto_2428924 ) ) ( not ( = ?auto_2428917 ?auto_2428925 ) ) ( not ( = ?auto_2428917 ?auto_2428926 ) ) ( not ( = ?auto_2428917 ?auto_2428927 ) ) ( not ( = ?auto_2428917 ?auto_2428928 ) ) ( not ( = ?auto_2428917 ?auto_2428929 ) ) ( not ( = ?auto_2428918 ?auto_2428919 ) ) ( not ( = ?auto_2428918 ?auto_2428921 ) ) ( not ( = ?auto_2428918 ?auto_2428920 ) ) ( not ( = ?auto_2428918 ?auto_2428922 ) ) ( not ( = ?auto_2428918 ?auto_2428923 ) ) ( not ( = ?auto_2428918 ?auto_2428924 ) ) ( not ( = ?auto_2428918 ?auto_2428925 ) ) ( not ( = ?auto_2428918 ?auto_2428926 ) ) ( not ( = ?auto_2428918 ?auto_2428927 ) ) ( not ( = ?auto_2428918 ?auto_2428928 ) ) ( not ( = ?auto_2428918 ?auto_2428929 ) ) ( not ( = ?auto_2428919 ?auto_2428921 ) ) ( not ( = ?auto_2428919 ?auto_2428920 ) ) ( not ( = ?auto_2428919 ?auto_2428922 ) ) ( not ( = ?auto_2428919 ?auto_2428923 ) ) ( not ( = ?auto_2428919 ?auto_2428924 ) ) ( not ( = ?auto_2428919 ?auto_2428925 ) ) ( not ( = ?auto_2428919 ?auto_2428926 ) ) ( not ( = ?auto_2428919 ?auto_2428927 ) ) ( not ( = ?auto_2428919 ?auto_2428928 ) ) ( not ( = ?auto_2428919 ?auto_2428929 ) ) ( not ( = ?auto_2428921 ?auto_2428920 ) ) ( not ( = ?auto_2428921 ?auto_2428922 ) ) ( not ( = ?auto_2428921 ?auto_2428923 ) ) ( not ( = ?auto_2428921 ?auto_2428924 ) ) ( not ( = ?auto_2428921 ?auto_2428925 ) ) ( not ( = ?auto_2428921 ?auto_2428926 ) ) ( not ( = ?auto_2428921 ?auto_2428927 ) ) ( not ( = ?auto_2428921 ?auto_2428928 ) ) ( not ( = ?auto_2428921 ?auto_2428929 ) ) ( not ( = ?auto_2428920 ?auto_2428922 ) ) ( not ( = ?auto_2428920 ?auto_2428923 ) ) ( not ( = ?auto_2428920 ?auto_2428924 ) ) ( not ( = ?auto_2428920 ?auto_2428925 ) ) ( not ( = ?auto_2428920 ?auto_2428926 ) ) ( not ( = ?auto_2428920 ?auto_2428927 ) ) ( not ( = ?auto_2428920 ?auto_2428928 ) ) ( not ( = ?auto_2428920 ?auto_2428929 ) ) ( not ( = ?auto_2428922 ?auto_2428923 ) ) ( not ( = ?auto_2428922 ?auto_2428924 ) ) ( not ( = ?auto_2428922 ?auto_2428925 ) ) ( not ( = ?auto_2428922 ?auto_2428926 ) ) ( not ( = ?auto_2428922 ?auto_2428927 ) ) ( not ( = ?auto_2428922 ?auto_2428928 ) ) ( not ( = ?auto_2428922 ?auto_2428929 ) ) ( not ( = ?auto_2428923 ?auto_2428924 ) ) ( not ( = ?auto_2428923 ?auto_2428925 ) ) ( not ( = ?auto_2428923 ?auto_2428926 ) ) ( not ( = ?auto_2428923 ?auto_2428927 ) ) ( not ( = ?auto_2428923 ?auto_2428928 ) ) ( not ( = ?auto_2428923 ?auto_2428929 ) ) ( not ( = ?auto_2428924 ?auto_2428925 ) ) ( not ( = ?auto_2428924 ?auto_2428926 ) ) ( not ( = ?auto_2428924 ?auto_2428927 ) ) ( not ( = ?auto_2428924 ?auto_2428928 ) ) ( not ( = ?auto_2428924 ?auto_2428929 ) ) ( not ( = ?auto_2428925 ?auto_2428926 ) ) ( not ( = ?auto_2428925 ?auto_2428927 ) ) ( not ( = ?auto_2428925 ?auto_2428928 ) ) ( not ( = ?auto_2428925 ?auto_2428929 ) ) ( not ( = ?auto_2428926 ?auto_2428927 ) ) ( not ( = ?auto_2428926 ?auto_2428928 ) ) ( not ( = ?auto_2428926 ?auto_2428929 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2428927 ?auto_2428928 ?auto_2428929 )
      ( MAKE-12CRATE-VERIFY ?auto_2428917 ?auto_2428918 ?auto_2428919 ?auto_2428921 ?auto_2428920 ?auto_2428922 ?auto_2428923 ?auto_2428924 ?auto_2428925 ?auto_2428926 ?auto_2428927 ?auto_2428928 ?auto_2428929 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2429055 - SURFACE
      ?auto_2429056 - SURFACE
      ?auto_2429057 - SURFACE
      ?auto_2429059 - SURFACE
      ?auto_2429058 - SURFACE
      ?auto_2429060 - SURFACE
      ?auto_2429061 - SURFACE
      ?auto_2429062 - SURFACE
      ?auto_2429063 - SURFACE
      ?auto_2429064 - SURFACE
      ?auto_2429065 - SURFACE
      ?auto_2429066 - SURFACE
      ?auto_2429067 - SURFACE
    )
    :vars
    (
      ?auto_2429070 - HOIST
      ?auto_2429068 - PLACE
      ?auto_2429071 - TRUCK
      ?auto_2429069 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2429070 ?auto_2429068 ) ( SURFACE-AT ?auto_2429066 ?auto_2429068 ) ( CLEAR ?auto_2429066 ) ( IS-CRATE ?auto_2429067 ) ( not ( = ?auto_2429066 ?auto_2429067 ) ) ( AVAILABLE ?auto_2429070 ) ( IN ?auto_2429067 ?auto_2429071 ) ( ON ?auto_2429066 ?auto_2429065 ) ( not ( = ?auto_2429065 ?auto_2429066 ) ) ( not ( = ?auto_2429065 ?auto_2429067 ) ) ( TRUCK-AT ?auto_2429071 ?auto_2429069 ) ( not ( = ?auto_2429069 ?auto_2429068 ) ) ( ON ?auto_2429056 ?auto_2429055 ) ( ON ?auto_2429057 ?auto_2429056 ) ( ON ?auto_2429059 ?auto_2429057 ) ( ON ?auto_2429058 ?auto_2429059 ) ( ON ?auto_2429060 ?auto_2429058 ) ( ON ?auto_2429061 ?auto_2429060 ) ( ON ?auto_2429062 ?auto_2429061 ) ( ON ?auto_2429063 ?auto_2429062 ) ( ON ?auto_2429064 ?auto_2429063 ) ( ON ?auto_2429065 ?auto_2429064 ) ( not ( = ?auto_2429055 ?auto_2429056 ) ) ( not ( = ?auto_2429055 ?auto_2429057 ) ) ( not ( = ?auto_2429055 ?auto_2429059 ) ) ( not ( = ?auto_2429055 ?auto_2429058 ) ) ( not ( = ?auto_2429055 ?auto_2429060 ) ) ( not ( = ?auto_2429055 ?auto_2429061 ) ) ( not ( = ?auto_2429055 ?auto_2429062 ) ) ( not ( = ?auto_2429055 ?auto_2429063 ) ) ( not ( = ?auto_2429055 ?auto_2429064 ) ) ( not ( = ?auto_2429055 ?auto_2429065 ) ) ( not ( = ?auto_2429055 ?auto_2429066 ) ) ( not ( = ?auto_2429055 ?auto_2429067 ) ) ( not ( = ?auto_2429056 ?auto_2429057 ) ) ( not ( = ?auto_2429056 ?auto_2429059 ) ) ( not ( = ?auto_2429056 ?auto_2429058 ) ) ( not ( = ?auto_2429056 ?auto_2429060 ) ) ( not ( = ?auto_2429056 ?auto_2429061 ) ) ( not ( = ?auto_2429056 ?auto_2429062 ) ) ( not ( = ?auto_2429056 ?auto_2429063 ) ) ( not ( = ?auto_2429056 ?auto_2429064 ) ) ( not ( = ?auto_2429056 ?auto_2429065 ) ) ( not ( = ?auto_2429056 ?auto_2429066 ) ) ( not ( = ?auto_2429056 ?auto_2429067 ) ) ( not ( = ?auto_2429057 ?auto_2429059 ) ) ( not ( = ?auto_2429057 ?auto_2429058 ) ) ( not ( = ?auto_2429057 ?auto_2429060 ) ) ( not ( = ?auto_2429057 ?auto_2429061 ) ) ( not ( = ?auto_2429057 ?auto_2429062 ) ) ( not ( = ?auto_2429057 ?auto_2429063 ) ) ( not ( = ?auto_2429057 ?auto_2429064 ) ) ( not ( = ?auto_2429057 ?auto_2429065 ) ) ( not ( = ?auto_2429057 ?auto_2429066 ) ) ( not ( = ?auto_2429057 ?auto_2429067 ) ) ( not ( = ?auto_2429059 ?auto_2429058 ) ) ( not ( = ?auto_2429059 ?auto_2429060 ) ) ( not ( = ?auto_2429059 ?auto_2429061 ) ) ( not ( = ?auto_2429059 ?auto_2429062 ) ) ( not ( = ?auto_2429059 ?auto_2429063 ) ) ( not ( = ?auto_2429059 ?auto_2429064 ) ) ( not ( = ?auto_2429059 ?auto_2429065 ) ) ( not ( = ?auto_2429059 ?auto_2429066 ) ) ( not ( = ?auto_2429059 ?auto_2429067 ) ) ( not ( = ?auto_2429058 ?auto_2429060 ) ) ( not ( = ?auto_2429058 ?auto_2429061 ) ) ( not ( = ?auto_2429058 ?auto_2429062 ) ) ( not ( = ?auto_2429058 ?auto_2429063 ) ) ( not ( = ?auto_2429058 ?auto_2429064 ) ) ( not ( = ?auto_2429058 ?auto_2429065 ) ) ( not ( = ?auto_2429058 ?auto_2429066 ) ) ( not ( = ?auto_2429058 ?auto_2429067 ) ) ( not ( = ?auto_2429060 ?auto_2429061 ) ) ( not ( = ?auto_2429060 ?auto_2429062 ) ) ( not ( = ?auto_2429060 ?auto_2429063 ) ) ( not ( = ?auto_2429060 ?auto_2429064 ) ) ( not ( = ?auto_2429060 ?auto_2429065 ) ) ( not ( = ?auto_2429060 ?auto_2429066 ) ) ( not ( = ?auto_2429060 ?auto_2429067 ) ) ( not ( = ?auto_2429061 ?auto_2429062 ) ) ( not ( = ?auto_2429061 ?auto_2429063 ) ) ( not ( = ?auto_2429061 ?auto_2429064 ) ) ( not ( = ?auto_2429061 ?auto_2429065 ) ) ( not ( = ?auto_2429061 ?auto_2429066 ) ) ( not ( = ?auto_2429061 ?auto_2429067 ) ) ( not ( = ?auto_2429062 ?auto_2429063 ) ) ( not ( = ?auto_2429062 ?auto_2429064 ) ) ( not ( = ?auto_2429062 ?auto_2429065 ) ) ( not ( = ?auto_2429062 ?auto_2429066 ) ) ( not ( = ?auto_2429062 ?auto_2429067 ) ) ( not ( = ?auto_2429063 ?auto_2429064 ) ) ( not ( = ?auto_2429063 ?auto_2429065 ) ) ( not ( = ?auto_2429063 ?auto_2429066 ) ) ( not ( = ?auto_2429063 ?auto_2429067 ) ) ( not ( = ?auto_2429064 ?auto_2429065 ) ) ( not ( = ?auto_2429064 ?auto_2429066 ) ) ( not ( = ?auto_2429064 ?auto_2429067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2429065 ?auto_2429066 ?auto_2429067 )
      ( MAKE-12CRATE-VERIFY ?auto_2429055 ?auto_2429056 ?auto_2429057 ?auto_2429059 ?auto_2429058 ?auto_2429060 ?auto_2429061 ?auto_2429062 ?auto_2429063 ?auto_2429064 ?auto_2429065 ?auto_2429066 ?auto_2429067 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2429205 - SURFACE
      ?auto_2429206 - SURFACE
      ?auto_2429207 - SURFACE
      ?auto_2429209 - SURFACE
      ?auto_2429208 - SURFACE
      ?auto_2429210 - SURFACE
      ?auto_2429211 - SURFACE
      ?auto_2429212 - SURFACE
      ?auto_2429213 - SURFACE
      ?auto_2429214 - SURFACE
      ?auto_2429215 - SURFACE
      ?auto_2429216 - SURFACE
      ?auto_2429217 - SURFACE
    )
    :vars
    (
      ?auto_2429221 - HOIST
      ?auto_2429219 - PLACE
      ?auto_2429222 - TRUCK
      ?auto_2429218 - PLACE
      ?auto_2429220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2429221 ?auto_2429219 ) ( SURFACE-AT ?auto_2429216 ?auto_2429219 ) ( CLEAR ?auto_2429216 ) ( IS-CRATE ?auto_2429217 ) ( not ( = ?auto_2429216 ?auto_2429217 ) ) ( AVAILABLE ?auto_2429221 ) ( ON ?auto_2429216 ?auto_2429215 ) ( not ( = ?auto_2429215 ?auto_2429216 ) ) ( not ( = ?auto_2429215 ?auto_2429217 ) ) ( TRUCK-AT ?auto_2429222 ?auto_2429218 ) ( not ( = ?auto_2429218 ?auto_2429219 ) ) ( HOIST-AT ?auto_2429220 ?auto_2429218 ) ( LIFTING ?auto_2429220 ?auto_2429217 ) ( not ( = ?auto_2429221 ?auto_2429220 ) ) ( ON ?auto_2429206 ?auto_2429205 ) ( ON ?auto_2429207 ?auto_2429206 ) ( ON ?auto_2429209 ?auto_2429207 ) ( ON ?auto_2429208 ?auto_2429209 ) ( ON ?auto_2429210 ?auto_2429208 ) ( ON ?auto_2429211 ?auto_2429210 ) ( ON ?auto_2429212 ?auto_2429211 ) ( ON ?auto_2429213 ?auto_2429212 ) ( ON ?auto_2429214 ?auto_2429213 ) ( ON ?auto_2429215 ?auto_2429214 ) ( not ( = ?auto_2429205 ?auto_2429206 ) ) ( not ( = ?auto_2429205 ?auto_2429207 ) ) ( not ( = ?auto_2429205 ?auto_2429209 ) ) ( not ( = ?auto_2429205 ?auto_2429208 ) ) ( not ( = ?auto_2429205 ?auto_2429210 ) ) ( not ( = ?auto_2429205 ?auto_2429211 ) ) ( not ( = ?auto_2429205 ?auto_2429212 ) ) ( not ( = ?auto_2429205 ?auto_2429213 ) ) ( not ( = ?auto_2429205 ?auto_2429214 ) ) ( not ( = ?auto_2429205 ?auto_2429215 ) ) ( not ( = ?auto_2429205 ?auto_2429216 ) ) ( not ( = ?auto_2429205 ?auto_2429217 ) ) ( not ( = ?auto_2429206 ?auto_2429207 ) ) ( not ( = ?auto_2429206 ?auto_2429209 ) ) ( not ( = ?auto_2429206 ?auto_2429208 ) ) ( not ( = ?auto_2429206 ?auto_2429210 ) ) ( not ( = ?auto_2429206 ?auto_2429211 ) ) ( not ( = ?auto_2429206 ?auto_2429212 ) ) ( not ( = ?auto_2429206 ?auto_2429213 ) ) ( not ( = ?auto_2429206 ?auto_2429214 ) ) ( not ( = ?auto_2429206 ?auto_2429215 ) ) ( not ( = ?auto_2429206 ?auto_2429216 ) ) ( not ( = ?auto_2429206 ?auto_2429217 ) ) ( not ( = ?auto_2429207 ?auto_2429209 ) ) ( not ( = ?auto_2429207 ?auto_2429208 ) ) ( not ( = ?auto_2429207 ?auto_2429210 ) ) ( not ( = ?auto_2429207 ?auto_2429211 ) ) ( not ( = ?auto_2429207 ?auto_2429212 ) ) ( not ( = ?auto_2429207 ?auto_2429213 ) ) ( not ( = ?auto_2429207 ?auto_2429214 ) ) ( not ( = ?auto_2429207 ?auto_2429215 ) ) ( not ( = ?auto_2429207 ?auto_2429216 ) ) ( not ( = ?auto_2429207 ?auto_2429217 ) ) ( not ( = ?auto_2429209 ?auto_2429208 ) ) ( not ( = ?auto_2429209 ?auto_2429210 ) ) ( not ( = ?auto_2429209 ?auto_2429211 ) ) ( not ( = ?auto_2429209 ?auto_2429212 ) ) ( not ( = ?auto_2429209 ?auto_2429213 ) ) ( not ( = ?auto_2429209 ?auto_2429214 ) ) ( not ( = ?auto_2429209 ?auto_2429215 ) ) ( not ( = ?auto_2429209 ?auto_2429216 ) ) ( not ( = ?auto_2429209 ?auto_2429217 ) ) ( not ( = ?auto_2429208 ?auto_2429210 ) ) ( not ( = ?auto_2429208 ?auto_2429211 ) ) ( not ( = ?auto_2429208 ?auto_2429212 ) ) ( not ( = ?auto_2429208 ?auto_2429213 ) ) ( not ( = ?auto_2429208 ?auto_2429214 ) ) ( not ( = ?auto_2429208 ?auto_2429215 ) ) ( not ( = ?auto_2429208 ?auto_2429216 ) ) ( not ( = ?auto_2429208 ?auto_2429217 ) ) ( not ( = ?auto_2429210 ?auto_2429211 ) ) ( not ( = ?auto_2429210 ?auto_2429212 ) ) ( not ( = ?auto_2429210 ?auto_2429213 ) ) ( not ( = ?auto_2429210 ?auto_2429214 ) ) ( not ( = ?auto_2429210 ?auto_2429215 ) ) ( not ( = ?auto_2429210 ?auto_2429216 ) ) ( not ( = ?auto_2429210 ?auto_2429217 ) ) ( not ( = ?auto_2429211 ?auto_2429212 ) ) ( not ( = ?auto_2429211 ?auto_2429213 ) ) ( not ( = ?auto_2429211 ?auto_2429214 ) ) ( not ( = ?auto_2429211 ?auto_2429215 ) ) ( not ( = ?auto_2429211 ?auto_2429216 ) ) ( not ( = ?auto_2429211 ?auto_2429217 ) ) ( not ( = ?auto_2429212 ?auto_2429213 ) ) ( not ( = ?auto_2429212 ?auto_2429214 ) ) ( not ( = ?auto_2429212 ?auto_2429215 ) ) ( not ( = ?auto_2429212 ?auto_2429216 ) ) ( not ( = ?auto_2429212 ?auto_2429217 ) ) ( not ( = ?auto_2429213 ?auto_2429214 ) ) ( not ( = ?auto_2429213 ?auto_2429215 ) ) ( not ( = ?auto_2429213 ?auto_2429216 ) ) ( not ( = ?auto_2429213 ?auto_2429217 ) ) ( not ( = ?auto_2429214 ?auto_2429215 ) ) ( not ( = ?auto_2429214 ?auto_2429216 ) ) ( not ( = ?auto_2429214 ?auto_2429217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2429215 ?auto_2429216 ?auto_2429217 )
      ( MAKE-12CRATE-VERIFY ?auto_2429205 ?auto_2429206 ?auto_2429207 ?auto_2429209 ?auto_2429208 ?auto_2429210 ?auto_2429211 ?auto_2429212 ?auto_2429213 ?auto_2429214 ?auto_2429215 ?auto_2429216 ?auto_2429217 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2429367 - SURFACE
      ?auto_2429368 - SURFACE
      ?auto_2429369 - SURFACE
      ?auto_2429371 - SURFACE
      ?auto_2429370 - SURFACE
      ?auto_2429372 - SURFACE
      ?auto_2429373 - SURFACE
      ?auto_2429374 - SURFACE
      ?auto_2429375 - SURFACE
      ?auto_2429376 - SURFACE
      ?auto_2429377 - SURFACE
      ?auto_2429378 - SURFACE
      ?auto_2429379 - SURFACE
    )
    :vars
    (
      ?auto_2429384 - HOIST
      ?auto_2429385 - PLACE
      ?auto_2429380 - TRUCK
      ?auto_2429381 - PLACE
      ?auto_2429383 - HOIST
      ?auto_2429382 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2429384 ?auto_2429385 ) ( SURFACE-AT ?auto_2429378 ?auto_2429385 ) ( CLEAR ?auto_2429378 ) ( IS-CRATE ?auto_2429379 ) ( not ( = ?auto_2429378 ?auto_2429379 ) ) ( AVAILABLE ?auto_2429384 ) ( ON ?auto_2429378 ?auto_2429377 ) ( not ( = ?auto_2429377 ?auto_2429378 ) ) ( not ( = ?auto_2429377 ?auto_2429379 ) ) ( TRUCK-AT ?auto_2429380 ?auto_2429381 ) ( not ( = ?auto_2429381 ?auto_2429385 ) ) ( HOIST-AT ?auto_2429383 ?auto_2429381 ) ( not ( = ?auto_2429384 ?auto_2429383 ) ) ( AVAILABLE ?auto_2429383 ) ( SURFACE-AT ?auto_2429379 ?auto_2429381 ) ( ON ?auto_2429379 ?auto_2429382 ) ( CLEAR ?auto_2429379 ) ( not ( = ?auto_2429378 ?auto_2429382 ) ) ( not ( = ?auto_2429379 ?auto_2429382 ) ) ( not ( = ?auto_2429377 ?auto_2429382 ) ) ( ON ?auto_2429368 ?auto_2429367 ) ( ON ?auto_2429369 ?auto_2429368 ) ( ON ?auto_2429371 ?auto_2429369 ) ( ON ?auto_2429370 ?auto_2429371 ) ( ON ?auto_2429372 ?auto_2429370 ) ( ON ?auto_2429373 ?auto_2429372 ) ( ON ?auto_2429374 ?auto_2429373 ) ( ON ?auto_2429375 ?auto_2429374 ) ( ON ?auto_2429376 ?auto_2429375 ) ( ON ?auto_2429377 ?auto_2429376 ) ( not ( = ?auto_2429367 ?auto_2429368 ) ) ( not ( = ?auto_2429367 ?auto_2429369 ) ) ( not ( = ?auto_2429367 ?auto_2429371 ) ) ( not ( = ?auto_2429367 ?auto_2429370 ) ) ( not ( = ?auto_2429367 ?auto_2429372 ) ) ( not ( = ?auto_2429367 ?auto_2429373 ) ) ( not ( = ?auto_2429367 ?auto_2429374 ) ) ( not ( = ?auto_2429367 ?auto_2429375 ) ) ( not ( = ?auto_2429367 ?auto_2429376 ) ) ( not ( = ?auto_2429367 ?auto_2429377 ) ) ( not ( = ?auto_2429367 ?auto_2429378 ) ) ( not ( = ?auto_2429367 ?auto_2429379 ) ) ( not ( = ?auto_2429367 ?auto_2429382 ) ) ( not ( = ?auto_2429368 ?auto_2429369 ) ) ( not ( = ?auto_2429368 ?auto_2429371 ) ) ( not ( = ?auto_2429368 ?auto_2429370 ) ) ( not ( = ?auto_2429368 ?auto_2429372 ) ) ( not ( = ?auto_2429368 ?auto_2429373 ) ) ( not ( = ?auto_2429368 ?auto_2429374 ) ) ( not ( = ?auto_2429368 ?auto_2429375 ) ) ( not ( = ?auto_2429368 ?auto_2429376 ) ) ( not ( = ?auto_2429368 ?auto_2429377 ) ) ( not ( = ?auto_2429368 ?auto_2429378 ) ) ( not ( = ?auto_2429368 ?auto_2429379 ) ) ( not ( = ?auto_2429368 ?auto_2429382 ) ) ( not ( = ?auto_2429369 ?auto_2429371 ) ) ( not ( = ?auto_2429369 ?auto_2429370 ) ) ( not ( = ?auto_2429369 ?auto_2429372 ) ) ( not ( = ?auto_2429369 ?auto_2429373 ) ) ( not ( = ?auto_2429369 ?auto_2429374 ) ) ( not ( = ?auto_2429369 ?auto_2429375 ) ) ( not ( = ?auto_2429369 ?auto_2429376 ) ) ( not ( = ?auto_2429369 ?auto_2429377 ) ) ( not ( = ?auto_2429369 ?auto_2429378 ) ) ( not ( = ?auto_2429369 ?auto_2429379 ) ) ( not ( = ?auto_2429369 ?auto_2429382 ) ) ( not ( = ?auto_2429371 ?auto_2429370 ) ) ( not ( = ?auto_2429371 ?auto_2429372 ) ) ( not ( = ?auto_2429371 ?auto_2429373 ) ) ( not ( = ?auto_2429371 ?auto_2429374 ) ) ( not ( = ?auto_2429371 ?auto_2429375 ) ) ( not ( = ?auto_2429371 ?auto_2429376 ) ) ( not ( = ?auto_2429371 ?auto_2429377 ) ) ( not ( = ?auto_2429371 ?auto_2429378 ) ) ( not ( = ?auto_2429371 ?auto_2429379 ) ) ( not ( = ?auto_2429371 ?auto_2429382 ) ) ( not ( = ?auto_2429370 ?auto_2429372 ) ) ( not ( = ?auto_2429370 ?auto_2429373 ) ) ( not ( = ?auto_2429370 ?auto_2429374 ) ) ( not ( = ?auto_2429370 ?auto_2429375 ) ) ( not ( = ?auto_2429370 ?auto_2429376 ) ) ( not ( = ?auto_2429370 ?auto_2429377 ) ) ( not ( = ?auto_2429370 ?auto_2429378 ) ) ( not ( = ?auto_2429370 ?auto_2429379 ) ) ( not ( = ?auto_2429370 ?auto_2429382 ) ) ( not ( = ?auto_2429372 ?auto_2429373 ) ) ( not ( = ?auto_2429372 ?auto_2429374 ) ) ( not ( = ?auto_2429372 ?auto_2429375 ) ) ( not ( = ?auto_2429372 ?auto_2429376 ) ) ( not ( = ?auto_2429372 ?auto_2429377 ) ) ( not ( = ?auto_2429372 ?auto_2429378 ) ) ( not ( = ?auto_2429372 ?auto_2429379 ) ) ( not ( = ?auto_2429372 ?auto_2429382 ) ) ( not ( = ?auto_2429373 ?auto_2429374 ) ) ( not ( = ?auto_2429373 ?auto_2429375 ) ) ( not ( = ?auto_2429373 ?auto_2429376 ) ) ( not ( = ?auto_2429373 ?auto_2429377 ) ) ( not ( = ?auto_2429373 ?auto_2429378 ) ) ( not ( = ?auto_2429373 ?auto_2429379 ) ) ( not ( = ?auto_2429373 ?auto_2429382 ) ) ( not ( = ?auto_2429374 ?auto_2429375 ) ) ( not ( = ?auto_2429374 ?auto_2429376 ) ) ( not ( = ?auto_2429374 ?auto_2429377 ) ) ( not ( = ?auto_2429374 ?auto_2429378 ) ) ( not ( = ?auto_2429374 ?auto_2429379 ) ) ( not ( = ?auto_2429374 ?auto_2429382 ) ) ( not ( = ?auto_2429375 ?auto_2429376 ) ) ( not ( = ?auto_2429375 ?auto_2429377 ) ) ( not ( = ?auto_2429375 ?auto_2429378 ) ) ( not ( = ?auto_2429375 ?auto_2429379 ) ) ( not ( = ?auto_2429375 ?auto_2429382 ) ) ( not ( = ?auto_2429376 ?auto_2429377 ) ) ( not ( = ?auto_2429376 ?auto_2429378 ) ) ( not ( = ?auto_2429376 ?auto_2429379 ) ) ( not ( = ?auto_2429376 ?auto_2429382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2429377 ?auto_2429378 ?auto_2429379 )
      ( MAKE-12CRATE-VERIFY ?auto_2429367 ?auto_2429368 ?auto_2429369 ?auto_2429371 ?auto_2429370 ?auto_2429372 ?auto_2429373 ?auto_2429374 ?auto_2429375 ?auto_2429376 ?auto_2429377 ?auto_2429378 ?auto_2429379 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2429530 - SURFACE
      ?auto_2429531 - SURFACE
      ?auto_2429532 - SURFACE
      ?auto_2429534 - SURFACE
      ?auto_2429533 - SURFACE
      ?auto_2429535 - SURFACE
      ?auto_2429536 - SURFACE
      ?auto_2429537 - SURFACE
      ?auto_2429538 - SURFACE
      ?auto_2429539 - SURFACE
      ?auto_2429540 - SURFACE
      ?auto_2429541 - SURFACE
      ?auto_2429542 - SURFACE
    )
    :vars
    (
      ?auto_2429547 - HOIST
      ?auto_2429548 - PLACE
      ?auto_2429543 - PLACE
      ?auto_2429546 - HOIST
      ?auto_2429544 - SURFACE
      ?auto_2429545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2429547 ?auto_2429548 ) ( SURFACE-AT ?auto_2429541 ?auto_2429548 ) ( CLEAR ?auto_2429541 ) ( IS-CRATE ?auto_2429542 ) ( not ( = ?auto_2429541 ?auto_2429542 ) ) ( AVAILABLE ?auto_2429547 ) ( ON ?auto_2429541 ?auto_2429540 ) ( not ( = ?auto_2429540 ?auto_2429541 ) ) ( not ( = ?auto_2429540 ?auto_2429542 ) ) ( not ( = ?auto_2429543 ?auto_2429548 ) ) ( HOIST-AT ?auto_2429546 ?auto_2429543 ) ( not ( = ?auto_2429547 ?auto_2429546 ) ) ( AVAILABLE ?auto_2429546 ) ( SURFACE-AT ?auto_2429542 ?auto_2429543 ) ( ON ?auto_2429542 ?auto_2429544 ) ( CLEAR ?auto_2429542 ) ( not ( = ?auto_2429541 ?auto_2429544 ) ) ( not ( = ?auto_2429542 ?auto_2429544 ) ) ( not ( = ?auto_2429540 ?auto_2429544 ) ) ( TRUCK-AT ?auto_2429545 ?auto_2429548 ) ( ON ?auto_2429531 ?auto_2429530 ) ( ON ?auto_2429532 ?auto_2429531 ) ( ON ?auto_2429534 ?auto_2429532 ) ( ON ?auto_2429533 ?auto_2429534 ) ( ON ?auto_2429535 ?auto_2429533 ) ( ON ?auto_2429536 ?auto_2429535 ) ( ON ?auto_2429537 ?auto_2429536 ) ( ON ?auto_2429538 ?auto_2429537 ) ( ON ?auto_2429539 ?auto_2429538 ) ( ON ?auto_2429540 ?auto_2429539 ) ( not ( = ?auto_2429530 ?auto_2429531 ) ) ( not ( = ?auto_2429530 ?auto_2429532 ) ) ( not ( = ?auto_2429530 ?auto_2429534 ) ) ( not ( = ?auto_2429530 ?auto_2429533 ) ) ( not ( = ?auto_2429530 ?auto_2429535 ) ) ( not ( = ?auto_2429530 ?auto_2429536 ) ) ( not ( = ?auto_2429530 ?auto_2429537 ) ) ( not ( = ?auto_2429530 ?auto_2429538 ) ) ( not ( = ?auto_2429530 ?auto_2429539 ) ) ( not ( = ?auto_2429530 ?auto_2429540 ) ) ( not ( = ?auto_2429530 ?auto_2429541 ) ) ( not ( = ?auto_2429530 ?auto_2429542 ) ) ( not ( = ?auto_2429530 ?auto_2429544 ) ) ( not ( = ?auto_2429531 ?auto_2429532 ) ) ( not ( = ?auto_2429531 ?auto_2429534 ) ) ( not ( = ?auto_2429531 ?auto_2429533 ) ) ( not ( = ?auto_2429531 ?auto_2429535 ) ) ( not ( = ?auto_2429531 ?auto_2429536 ) ) ( not ( = ?auto_2429531 ?auto_2429537 ) ) ( not ( = ?auto_2429531 ?auto_2429538 ) ) ( not ( = ?auto_2429531 ?auto_2429539 ) ) ( not ( = ?auto_2429531 ?auto_2429540 ) ) ( not ( = ?auto_2429531 ?auto_2429541 ) ) ( not ( = ?auto_2429531 ?auto_2429542 ) ) ( not ( = ?auto_2429531 ?auto_2429544 ) ) ( not ( = ?auto_2429532 ?auto_2429534 ) ) ( not ( = ?auto_2429532 ?auto_2429533 ) ) ( not ( = ?auto_2429532 ?auto_2429535 ) ) ( not ( = ?auto_2429532 ?auto_2429536 ) ) ( not ( = ?auto_2429532 ?auto_2429537 ) ) ( not ( = ?auto_2429532 ?auto_2429538 ) ) ( not ( = ?auto_2429532 ?auto_2429539 ) ) ( not ( = ?auto_2429532 ?auto_2429540 ) ) ( not ( = ?auto_2429532 ?auto_2429541 ) ) ( not ( = ?auto_2429532 ?auto_2429542 ) ) ( not ( = ?auto_2429532 ?auto_2429544 ) ) ( not ( = ?auto_2429534 ?auto_2429533 ) ) ( not ( = ?auto_2429534 ?auto_2429535 ) ) ( not ( = ?auto_2429534 ?auto_2429536 ) ) ( not ( = ?auto_2429534 ?auto_2429537 ) ) ( not ( = ?auto_2429534 ?auto_2429538 ) ) ( not ( = ?auto_2429534 ?auto_2429539 ) ) ( not ( = ?auto_2429534 ?auto_2429540 ) ) ( not ( = ?auto_2429534 ?auto_2429541 ) ) ( not ( = ?auto_2429534 ?auto_2429542 ) ) ( not ( = ?auto_2429534 ?auto_2429544 ) ) ( not ( = ?auto_2429533 ?auto_2429535 ) ) ( not ( = ?auto_2429533 ?auto_2429536 ) ) ( not ( = ?auto_2429533 ?auto_2429537 ) ) ( not ( = ?auto_2429533 ?auto_2429538 ) ) ( not ( = ?auto_2429533 ?auto_2429539 ) ) ( not ( = ?auto_2429533 ?auto_2429540 ) ) ( not ( = ?auto_2429533 ?auto_2429541 ) ) ( not ( = ?auto_2429533 ?auto_2429542 ) ) ( not ( = ?auto_2429533 ?auto_2429544 ) ) ( not ( = ?auto_2429535 ?auto_2429536 ) ) ( not ( = ?auto_2429535 ?auto_2429537 ) ) ( not ( = ?auto_2429535 ?auto_2429538 ) ) ( not ( = ?auto_2429535 ?auto_2429539 ) ) ( not ( = ?auto_2429535 ?auto_2429540 ) ) ( not ( = ?auto_2429535 ?auto_2429541 ) ) ( not ( = ?auto_2429535 ?auto_2429542 ) ) ( not ( = ?auto_2429535 ?auto_2429544 ) ) ( not ( = ?auto_2429536 ?auto_2429537 ) ) ( not ( = ?auto_2429536 ?auto_2429538 ) ) ( not ( = ?auto_2429536 ?auto_2429539 ) ) ( not ( = ?auto_2429536 ?auto_2429540 ) ) ( not ( = ?auto_2429536 ?auto_2429541 ) ) ( not ( = ?auto_2429536 ?auto_2429542 ) ) ( not ( = ?auto_2429536 ?auto_2429544 ) ) ( not ( = ?auto_2429537 ?auto_2429538 ) ) ( not ( = ?auto_2429537 ?auto_2429539 ) ) ( not ( = ?auto_2429537 ?auto_2429540 ) ) ( not ( = ?auto_2429537 ?auto_2429541 ) ) ( not ( = ?auto_2429537 ?auto_2429542 ) ) ( not ( = ?auto_2429537 ?auto_2429544 ) ) ( not ( = ?auto_2429538 ?auto_2429539 ) ) ( not ( = ?auto_2429538 ?auto_2429540 ) ) ( not ( = ?auto_2429538 ?auto_2429541 ) ) ( not ( = ?auto_2429538 ?auto_2429542 ) ) ( not ( = ?auto_2429538 ?auto_2429544 ) ) ( not ( = ?auto_2429539 ?auto_2429540 ) ) ( not ( = ?auto_2429539 ?auto_2429541 ) ) ( not ( = ?auto_2429539 ?auto_2429542 ) ) ( not ( = ?auto_2429539 ?auto_2429544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2429540 ?auto_2429541 ?auto_2429542 )
      ( MAKE-12CRATE-VERIFY ?auto_2429530 ?auto_2429531 ?auto_2429532 ?auto_2429534 ?auto_2429533 ?auto_2429535 ?auto_2429536 ?auto_2429537 ?auto_2429538 ?auto_2429539 ?auto_2429540 ?auto_2429541 ?auto_2429542 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2429693 - SURFACE
      ?auto_2429694 - SURFACE
      ?auto_2429695 - SURFACE
      ?auto_2429697 - SURFACE
      ?auto_2429696 - SURFACE
      ?auto_2429698 - SURFACE
      ?auto_2429699 - SURFACE
      ?auto_2429700 - SURFACE
      ?auto_2429701 - SURFACE
      ?auto_2429702 - SURFACE
      ?auto_2429703 - SURFACE
      ?auto_2429704 - SURFACE
      ?auto_2429705 - SURFACE
    )
    :vars
    (
      ?auto_2429710 - HOIST
      ?auto_2429711 - PLACE
      ?auto_2429706 - PLACE
      ?auto_2429708 - HOIST
      ?auto_2429709 - SURFACE
      ?auto_2429707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2429710 ?auto_2429711 ) ( IS-CRATE ?auto_2429705 ) ( not ( = ?auto_2429704 ?auto_2429705 ) ) ( not ( = ?auto_2429703 ?auto_2429704 ) ) ( not ( = ?auto_2429703 ?auto_2429705 ) ) ( not ( = ?auto_2429706 ?auto_2429711 ) ) ( HOIST-AT ?auto_2429708 ?auto_2429706 ) ( not ( = ?auto_2429710 ?auto_2429708 ) ) ( AVAILABLE ?auto_2429708 ) ( SURFACE-AT ?auto_2429705 ?auto_2429706 ) ( ON ?auto_2429705 ?auto_2429709 ) ( CLEAR ?auto_2429705 ) ( not ( = ?auto_2429704 ?auto_2429709 ) ) ( not ( = ?auto_2429705 ?auto_2429709 ) ) ( not ( = ?auto_2429703 ?auto_2429709 ) ) ( TRUCK-AT ?auto_2429707 ?auto_2429711 ) ( SURFACE-AT ?auto_2429703 ?auto_2429711 ) ( CLEAR ?auto_2429703 ) ( LIFTING ?auto_2429710 ?auto_2429704 ) ( IS-CRATE ?auto_2429704 ) ( ON ?auto_2429694 ?auto_2429693 ) ( ON ?auto_2429695 ?auto_2429694 ) ( ON ?auto_2429697 ?auto_2429695 ) ( ON ?auto_2429696 ?auto_2429697 ) ( ON ?auto_2429698 ?auto_2429696 ) ( ON ?auto_2429699 ?auto_2429698 ) ( ON ?auto_2429700 ?auto_2429699 ) ( ON ?auto_2429701 ?auto_2429700 ) ( ON ?auto_2429702 ?auto_2429701 ) ( ON ?auto_2429703 ?auto_2429702 ) ( not ( = ?auto_2429693 ?auto_2429694 ) ) ( not ( = ?auto_2429693 ?auto_2429695 ) ) ( not ( = ?auto_2429693 ?auto_2429697 ) ) ( not ( = ?auto_2429693 ?auto_2429696 ) ) ( not ( = ?auto_2429693 ?auto_2429698 ) ) ( not ( = ?auto_2429693 ?auto_2429699 ) ) ( not ( = ?auto_2429693 ?auto_2429700 ) ) ( not ( = ?auto_2429693 ?auto_2429701 ) ) ( not ( = ?auto_2429693 ?auto_2429702 ) ) ( not ( = ?auto_2429693 ?auto_2429703 ) ) ( not ( = ?auto_2429693 ?auto_2429704 ) ) ( not ( = ?auto_2429693 ?auto_2429705 ) ) ( not ( = ?auto_2429693 ?auto_2429709 ) ) ( not ( = ?auto_2429694 ?auto_2429695 ) ) ( not ( = ?auto_2429694 ?auto_2429697 ) ) ( not ( = ?auto_2429694 ?auto_2429696 ) ) ( not ( = ?auto_2429694 ?auto_2429698 ) ) ( not ( = ?auto_2429694 ?auto_2429699 ) ) ( not ( = ?auto_2429694 ?auto_2429700 ) ) ( not ( = ?auto_2429694 ?auto_2429701 ) ) ( not ( = ?auto_2429694 ?auto_2429702 ) ) ( not ( = ?auto_2429694 ?auto_2429703 ) ) ( not ( = ?auto_2429694 ?auto_2429704 ) ) ( not ( = ?auto_2429694 ?auto_2429705 ) ) ( not ( = ?auto_2429694 ?auto_2429709 ) ) ( not ( = ?auto_2429695 ?auto_2429697 ) ) ( not ( = ?auto_2429695 ?auto_2429696 ) ) ( not ( = ?auto_2429695 ?auto_2429698 ) ) ( not ( = ?auto_2429695 ?auto_2429699 ) ) ( not ( = ?auto_2429695 ?auto_2429700 ) ) ( not ( = ?auto_2429695 ?auto_2429701 ) ) ( not ( = ?auto_2429695 ?auto_2429702 ) ) ( not ( = ?auto_2429695 ?auto_2429703 ) ) ( not ( = ?auto_2429695 ?auto_2429704 ) ) ( not ( = ?auto_2429695 ?auto_2429705 ) ) ( not ( = ?auto_2429695 ?auto_2429709 ) ) ( not ( = ?auto_2429697 ?auto_2429696 ) ) ( not ( = ?auto_2429697 ?auto_2429698 ) ) ( not ( = ?auto_2429697 ?auto_2429699 ) ) ( not ( = ?auto_2429697 ?auto_2429700 ) ) ( not ( = ?auto_2429697 ?auto_2429701 ) ) ( not ( = ?auto_2429697 ?auto_2429702 ) ) ( not ( = ?auto_2429697 ?auto_2429703 ) ) ( not ( = ?auto_2429697 ?auto_2429704 ) ) ( not ( = ?auto_2429697 ?auto_2429705 ) ) ( not ( = ?auto_2429697 ?auto_2429709 ) ) ( not ( = ?auto_2429696 ?auto_2429698 ) ) ( not ( = ?auto_2429696 ?auto_2429699 ) ) ( not ( = ?auto_2429696 ?auto_2429700 ) ) ( not ( = ?auto_2429696 ?auto_2429701 ) ) ( not ( = ?auto_2429696 ?auto_2429702 ) ) ( not ( = ?auto_2429696 ?auto_2429703 ) ) ( not ( = ?auto_2429696 ?auto_2429704 ) ) ( not ( = ?auto_2429696 ?auto_2429705 ) ) ( not ( = ?auto_2429696 ?auto_2429709 ) ) ( not ( = ?auto_2429698 ?auto_2429699 ) ) ( not ( = ?auto_2429698 ?auto_2429700 ) ) ( not ( = ?auto_2429698 ?auto_2429701 ) ) ( not ( = ?auto_2429698 ?auto_2429702 ) ) ( not ( = ?auto_2429698 ?auto_2429703 ) ) ( not ( = ?auto_2429698 ?auto_2429704 ) ) ( not ( = ?auto_2429698 ?auto_2429705 ) ) ( not ( = ?auto_2429698 ?auto_2429709 ) ) ( not ( = ?auto_2429699 ?auto_2429700 ) ) ( not ( = ?auto_2429699 ?auto_2429701 ) ) ( not ( = ?auto_2429699 ?auto_2429702 ) ) ( not ( = ?auto_2429699 ?auto_2429703 ) ) ( not ( = ?auto_2429699 ?auto_2429704 ) ) ( not ( = ?auto_2429699 ?auto_2429705 ) ) ( not ( = ?auto_2429699 ?auto_2429709 ) ) ( not ( = ?auto_2429700 ?auto_2429701 ) ) ( not ( = ?auto_2429700 ?auto_2429702 ) ) ( not ( = ?auto_2429700 ?auto_2429703 ) ) ( not ( = ?auto_2429700 ?auto_2429704 ) ) ( not ( = ?auto_2429700 ?auto_2429705 ) ) ( not ( = ?auto_2429700 ?auto_2429709 ) ) ( not ( = ?auto_2429701 ?auto_2429702 ) ) ( not ( = ?auto_2429701 ?auto_2429703 ) ) ( not ( = ?auto_2429701 ?auto_2429704 ) ) ( not ( = ?auto_2429701 ?auto_2429705 ) ) ( not ( = ?auto_2429701 ?auto_2429709 ) ) ( not ( = ?auto_2429702 ?auto_2429703 ) ) ( not ( = ?auto_2429702 ?auto_2429704 ) ) ( not ( = ?auto_2429702 ?auto_2429705 ) ) ( not ( = ?auto_2429702 ?auto_2429709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2429703 ?auto_2429704 ?auto_2429705 )
      ( MAKE-12CRATE-VERIFY ?auto_2429693 ?auto_2429694 ?auto_2429695 ?auto_2429697 ?auto_2429696 ?auto_2429698 ?auto_2429699 ?auto_2429700 ?auto_2429701 ?auto_2429702 ?auto_2429703 ?auto_2429704 ?auto_2429705 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2429856 - SURFACE
      ?auto_2429857 - SURFACE
      ?auto_2429858 - SURFACE
      ?auto_2429860 - SURFACE
      ?auto_2429859 - SURFACE
      ?auto_2429861 - SURFACE
      ?auto_2429862 - SURFACE
      ?auto_2429863 - SURFACE
      ?auto_2429864 - SURFACE
      ?auto_2429865 - SURFACE
      ?auto_2429866 - SURFACE
      ?auto_2429867 - SURFACE
      ?auto_2429868 - SURFACE
    )
    :vars
    (
      ?auto_2429871 - HOIST
      ?auto_2429872 - PLACE
      ?auto_2429870 - PLACE
      ?auto_2429869 - HOIST
      ?auto_2429873 - SURFACE
      ?auto_2429874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2429871 ?auto_2429872 ) ( IS-CRATE ?auto_2429868 ) ( not ( = ?auto_2429867 ?auto_2429868 ) ) ( not ( = ?auto_2429866 ?auto_2429867 ) ) ( not ( = ?auto_2429866 ?auto_2429868 ) ) ( not ( = ?auto_2429870 ?auto_2429872 ) ) ( HOIST-AT ?auto_2429869 ?auto_2429870 ) ( not ( = ?auto_2429871 ?auto_2429869 ) ) ( AVAILABLE ?auto_2429869 ) ( SURFACE-AT ?auto_2429868 ?auto_2429870 ) ( ON ?auto_2429868 ?auto_2429873 ) ( CLEAR ?auto_2429868 ) ( not ( = ?auto_2429867 ?auto_2429873 ) ) ( not ( = ?auto_2429868 ?auto_2429873 ) ) ( not ( = ?auto_2429866 ?auto_2429873 ) ) ( TRUCK-AT ?auto_2429874 ?auto_2429872 ) ( SURFACE-AT ?auto_2429866 ?auto_2429872 ) ( CLEAR ?auto_2429866 ) ( IS-CRATE ?auto_2429867 ) ( AVAILABLE ?auto_2429871 ) ( IN ?auto_2429867 ?auto_2429874 ) ( ON ?auto_2429857 ?auto_2429856 ) ( ON ?auto_2429858 ?auto_2429857 ) ( ON ?auto_2429860 ?auto_2429858 ) ( ON ?auto_2429859 ?auto_2429860 ) ( ON ?auto_2429861 ?auto_2429859 ) ( ON ?auto_2429862 ?auto_2429861 ) ( ON ?auto_2429863 ?auto_2429862 ) ( ON ?auto_2429864 ?auto_2429863 ) ( ON ?auto_2429865 ?auto_2429864 ) ( ON ?auto_2429866 ?auto_2429865 ) ( not ( = ?auto_2429856 ?auto_2429857 ) ) ( not ( = ?auto_2429856 ?auto_2429858 ) ) ( not ( = ?auto_2429856 ?auto_2429860 ) ) ( not ( = ?auto_2429856 ?auto_2429859 ) ) ( not ( = ?auto_2429856 ?auto_2429861 ) ) ( not ( = ?auto_2429856 ?auto_2429862 ) ) ( not ( = ?auto_2429856 ?auto_2429863 ) ) ( not ( = ?auto_2429856 ?auto_2429864 ) ) ( not ( = ?auto_2429856 ?auto_2429865 ) ) ( not ( = ?auto_2429856 ?auto_2429866 ) ) ( not ( = ?auto_2429856 ?auto_2429867 ) ) ( not ( = ?auto_2429856 ?auto_2429868 ) ) ( not ( = ?auto_2429856 ?auto_2429873 ) ) ( not ( = ?auto_2429857 ?auto_2429858 ) ) ( not ( = ?auto_2429857 ?auto_2429860 ) ) ( not ( = ?auto_2429857 ?auto_2429859 ) ) ( not ( = ?auto_2429857 ?auto_2429861 ) ) ( not ( = ?auto_2429857 ?auto_2429862 ) ) ( not ( = ?auto_2429857 ?auto_2429863 ) ) ( not ( = ?auto_2429857 ?auto_2429864 ) ) ( not ( = ?auto_2429857 ?auto_2429865 ) ) ( not ( = ?auto_2429857 ?auto_2429866 ) ) ( not ( = ?auto_2429857 ?auto_2429867 ) ) ( not ( = ?auto_2429857 ?auto_2429868 ) ) ( not ( = ?auto_2429857 ?auto_2429873 ) ) ( not ( = ?auto_2429858 ?auto_2429860 ) ) ( not ( = ?auto_2429858 ?auto_2429859 ) ) ( not ( = ?auto_2429858 ?auto_2429861 ) ) ( not ( = ?auto_2429858 ?auto_2429862 ) ) ( not ( = ?auto_2429858 ?auto_2429863 ) ) ( not ( = ?auto_2429858 ?auto_2429864 ) ) ( not ( = ?auto_2429858 ?auto_2429865 ) ) ( not ( = ?auto_2429858 ?auto_2429866 ) ) ( not ( = ?auto_2429858 ?auto_2429867 ) ) ( not ( = ?auto_2429858 ?auto_2429868 ) ) ( not ( = ?auto_2429858 ?auto_2429873 ) ) ( not ( = ?auto_2429860 ?auto_2429859 ) ) ( not ( = ?auto_2429860 ?auto_2429861 ) ) ( not ( = ?auto_2429860 ?auto_2429862 ) ) ( not ( = ?auto_2429860 ?auto_2429863 ) ) ( not ( = ?auto_2429860 ?auto_2429864 ) ) ( not ( = ?auto_2429860 ?auto_2429865 ) ) ( not ( = ?auto_2429860 ?auto_2429866 ) ) ( not ( = ?auto_2429860 ?auto_2429867 ) ) ( not ( = ?auto_2429860 ?auto_2429868 ) ) ( not ( = ?auto_2429860 ?auto_2429873 ) ) ( not ( = ?auto_2429859 ?auto_2429861 ) ) ( not ( = ?auto_2429859 ?auto_2429862 ) ) ( not ( = ?auto_2429859 ?auto_2429863 ) ) ( not ( = ?auto_2429859 ?auto_2429864 ) ) ( not ( = ?auto_2429859 ?auto_2429865 ) ) ( not ( = ?auto_2429859 ?auto_2429866 ) ) ( not ( = ?auto_2429859 ?auto_2429867 ) ) ( not ( = ?auto_2429859 ?auto_2429868 ) ) ( not ( = ?auto_2429859 ?auto_2429873 ) ) ( not ( = ?auto_2429861 ?auto_2429862 ) ) ( not ( = ?auto_2429861 ?auto_2429863 ) ) ( not ( = ?auto_2429861 ?auto_2429864 ) ) ( not ( = ?auto_2429861 ?auto_2429865 ) ) ( not ( = ?auto_2429861 ?auto_2429866 ) ) ( not ( = ?auto_2429861 ?auto_2429867 ) ) ( not ( = ?auto_2429861 ?auto_2429868 ) ) ( not ( = ?auto_2429861 ?auto_2429873 ) ) ( not ( = ?auto_2429862 ?auto_2429863 ) ) ( not ( = ?auto_2429862 ?auto_2429864 ) ) ( not ( = ?auto_2429862 ?auto_2429865 ) ) ( not ( = ?auto_2429862 ?auto_2429866 ) ) ( not ( = ?auto_2429862 ?auto_2429867 ) ) ( not ( = ?auto_2429862 ?auto_2429868 ) ) ( not ( = ?auto_2429862 ?auto_2429873 ) ) ( not ( = ?auto_2429863 ?auto_2429864 ) ) ( not ( = ?auto_2429863 ?auto_2429865 ) ) ( not ( = ?auto_2429863 ?auto_2429866 ) ) ( not ( = ?auto_2429863 ?auto_2429867 ) ) ( not ( = ?auto_2429863 ?auto_2429868 ) ) ( not ( = ?auto_2429863 ?auto_2429873 ) ) ( not ( = ?auto_2429864 ?auto_2429865 ) ) ( not ( = ?auto_2429864 ?auto_2429866 ) ) ( not ( = ?auto_2429864 ?auto_2429867 ) ) ( not ( = ?auto_2429864 ?auto_2429868 ) ) ( not ( = ?auto_2429864 ?auto_2429873 ) ) ( not ( = ?auto_2429865 ?auto_2429866 ) ) ( not ( = ?auto_2429865 ?auto_2429867 ) ) ( not ( = ?auto_2429865 ?auto_2429868 ) ) ( not ( = ?auto_2429865 ?auto_2429873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2429866 ?auto_2429867 ?auto_2429868 )
      ( MAKE-12CRATE-VERIFY ?auto_2429856 ?auto_2429857 ?auto_2429858 ?auto_2429860 ?auto_2429859 ?auto_2429861 ?auto_2429862 ?auto_2429863 ?auto_2429864 ?auto_2429865 ?auto_2429866 ?auto_2429867 ?auto_2429868 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2441460 - SURFACE
      ?auto_2441461 - SURFACE
      ?auto_2441462 - SURFACE
      ?auto_2441464 - SURFACE
      ?auto_2441463 - SURFACE
      ?auto_2441465 - SURFACE
      ?auto_2441466 - SURFACE
      ?auto_2441467 - SURFACE
      ?auto_2441468 - SURFACE
      ?auto_2441469 - SURFACE
      ?auto_2441470 - SURFACE
      ?auto_2441471 - SURFACE
      ?auto_2441472 - SURFACE
      ?auto_2441473 - SURFACE
    )
    :vars
    (
      ?auto_2441474 - HOIST
      ?auto_2441475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2441474 ?auto_2441475 ) ( SURFACE-AT ?auto_2441472 ?auto_2441475 ) ( CLEAR ?auto_2441472 ) ( LIFTING ?auto_2441474 ?auto_2441473 ) ( IS-CRATE ?auto_2441473 ) ( not ( = ?auto_2441472 ?auto_2441473 ) ) ( ON ?auto_2441461 ?auto_2441460 ) ( ON ?auto_2441462 ?auto_2441461 ) ( ON ?auto_2441464 ?auto_2441462 ) ( ON ?auto_2441463 ?auto_2441464 ) ( ON ?auto_2441465 ?auto_2441463 ) ( ON ?auto_2441466 ?auto_2441465 ) ( ON ?auto_2441467 ?auto_2441466 ) ( ON ?auto_2441468 ?auto_2441467 ) ( ON ?auto_2441469 ?auto_2441468 ) ( ON ?auto_2441470 ?auto_2441469 ) ( ON ?auto_2441471 ?auto_2441470 ) ( ON ?auto_2441472 ?auto_2441471 ) ( not ( = ?auto_2441460 ?auto_2441461 ) ) ( not ( = ?auto_2441460 ?auto_2441462 ) ) ( not ( = ?auto_2441460 ?auto_2441464 ) ) ( not ( = ?auto_2441460 ?auto_2441463 ) ) ( not ( = ?auto_2441460 ?auto_2441465 ) ) ( not ( = ?auto_2441460 ?auto_2441466 ) ) ( not ( = ?auto_2441460 ?auto_2441467 ) ) ( not ( = ?auto_2441460 ?auto_2441468 ) ) ( not ( = ?auto_2441460 ?auto_2441469 ) ) ( not ( = ?auto_2441460 ?auto_2441470 ) ) ( not ( = ?auto_2441460 ?auto_2441471 ) ) ( not ( = ?auto_2441460 ?auto_2441472 ) ) ( not ( = ?auto_2441460 ?auto_2441473 ) ) ( not ( = ?auto_2441461 ?auto_2441462 ) ) ( not ( = ?auto_2441461 ?auto_2441464 ) ) ( not ( = ?auto_2441461 ?auto_2441463 ) ) ( not ( = ?auto_2441461 ?auto_2441465 ) ) ( not ( = ?auto_2441461 ?auto_2441466 ) ) ( not ( = ?auto_2441461 ?auto_2441467 ) ) ( not ( = ?auto_2441461 ?auto_2441468 ) ) ( not ( = ?auto_2441461 ?auto_2441469 ) ) ( not ( = ?auto_2441461 ?auto_2441470 ) ) ( not ( = ?auto_2441461 ?auto_2441471 ) ) ( not ( = ?auto_2441461 ?auto_2441472 ) ) ( not ( = ?auto_2441461 ?auto_2441473 ) ) ( not ( = ?auto_2441462 ?auto_2441464 ) ) ( not ( = ?auto_2441462 ?auto_2441463 ) ) ( not ( = ?auto_2441462 ?auto_2441465 ) ) ( not ( = ?auto_2441462 ?auto_2441466 ) ) ( not ( = ?auto_2441462 ?auto_2441467 ) ) ( not ( = ?auto_2441462 ?auto_2441468 ) ) ( not ( = ?auto_2441462 ?auto_2441469 ) ) ( not ( = ?auto_2441462 ?auto_2441470 ) ) ( not ( = ?auto_2441462 ?auto_2441471 ) ) ( not ( = ?auto_2441462 ?auto_2441472 ) ) ( not ( = ?auto_2441462 ?auto_2441473 ) ) ( not ( = ?auto_2441464 ?auto_2441463 ) ) ( not ( = ?auto_2441464 ?auto_2441465 ) ) ( not ( = ?auto_2441464 ?auto_2441466 ) ) ( not ( = ?auto_2441464 ?auto_2441467 ) ) ( not ( = ?auto_2441464 ?auto_2441468 ) ) ( not ( = ?auto_2441464 ?auto_2441469 ) ) ( not ( = ?auto_2441464 ?auto_2441470 ) ) ( not ( = ?auto_2441464 ?auto_2441471 ) ) ( not ( = ?auto_2441464 ?auto_2441472 ) ) ( not ( = ?auto_2441464 ?auto_2441473 ) ) ( not ( = ?auto_2441463 ?auto_2441465 ) ) ( not ( = ?auto_2441463 ?auto_2441466 ) ) ( not ( = ?auto_2441463 ?auto_2441467 ) ) ( not ( = ?auto_2441463 ?auto_2441468 ) ) ( not ( = ?auto_2441463 ?auto_2441469 ) ) ( not ( = ?auto_2441463 ?auto_2441470 ) ) ( not ( = ?auto_2441463 ?auto_2441471 ) ) ( not ( = ?auto_2441463 ?auto_2441472 ) ) ( not ( = ?auto_2441463 ?auto_2441473 ) ) ( not ( = ?auto_2441465 ?auto_2441466 ) ) ( not ( = ?auto_2441465 ?auto_2441467 ) ) ( not ( = ?auto_2441465 ?auto_2441468 ) ) ( not ( = ?auto_2441465 ?auto_2441469 ) ) ( not ( = ?auto_2441465 ?auto_2441470 ) ) ( not ( = ?auto_2441465 ?auto_2441471 ) ) ( not ( = ?auto_2441465 ?auto_2441472 ) ) ( not ( = ?auto_2441465 ?auto_2441473 ) ) ( not ( = ?auto_2441466 ?auto_2441467 ) ) ( not ( = ?auto_2441466 ?auto_2441468 ) ) ( not ( = ?auto_2441466 ?auto_2441469 ) ) ( not ( = ?auto_2441466 ?auto_2441470 ) ) ( not ( = ?auto_2441466 ?auto_2441471 ) ) ( not ( = ?auto_2441466 ?auto_2441472 ) ) ( not ( = ?auto_2441466 ?auto_2441473 ) ) ( not ( = ?auto_2441467 ?auto_2441468 ) ) ( not ( = ?auto_2441467 ?auto_2441469 ) ) ( not ( = ?auto_2441467 ?auto_2441470 ) ) ( not ( = ?auto_2441467 ?auto_2441471 ) ) ( not ( = ?auto_2441467 ?auto_2441472 ) ) ( not ( = ?auto_2441467 ?auto_2441473 ) ) ( not ( = ?auto_2441468 ?auto_2441469 ) ) ( not ( = ?auto_2441468 ?auto_2441470 ) ) ( not ( = ?auto_2441468 ?auto_2441471 ) ) ( not ( = ?auto_2441468 ?auto_2441472 ) ) ( not ( = ?auto_2441468 ?auto_2441473 ) ) ( not ( = ?auto_2441469 ?auto_2441470 ) ) ( not ( = ?auto_2441469 ?auto_2441471 ) ) ( not ( = ?auto_2441469 ?auto_2441472 ) ) ( not ( = ?auto_2441469 ?auto_2441473 ) ) ( not ( = ?auto_2441470 ?auto_2441471 ) ) ( not ( = ?auto_2441470 ?auto_2441472 ) ) ( not ( = ?auto_2441470 ?auto_2441473 ) ) ( not ( = ?auto_2441471 ?auto_2441472 ) ) ( not ( = ?auto_2441471 ?auto_2441473 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2441472 ?auto_2441473 )
      ( MAKE-13CRATE-VERIFY ?auto_2441460 ?auto_2441461 ?auto_2441462 ?auto_2441464 ?auto_2441463 ?auto_2441465 ?auto_2441466 ?auto_2441467 ?auto_2441468 ?auto_2441469 ?auto_2441470 ?auto_2441471 ?auto_2441472 ?auto_2441473 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2441602 - SURFACE
      ?auto_2441603 - SURFACE
      ?auto_2441604 - SURFACE
      ?auto_2441606 - SURFACE
      ?auto_2441605 - SURFACE
      ?auto_2441607 - SURFACE
      ?auto_2441608 - SURFACE
      ?auto_2441609 - SURFACE
      ?auto_2441610 - SURFACE
      ?auto_2441611 - SURFACE
      ?auto_2441612 - SURFACE
      ?auto_2441613 - SURFACE
      ?auto_2441614 - SURFACE
      ?auto_2441615 - SURFACE
    )
    :vars
    (
      ?auto_2441616 - HOIST
      ?auto_2441618 - PLACE
      ?auto_2441617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2441616 ?auto_2441618 ) ( SURFACE-AT ?auto_2441614 ?auto_2441618 ) ( CLEAR ?auto_2441614 ) ( IS-CRATE ?auto_2441615 ) ( not ( = ?auto_2441614 ?auto_2441615 ) ) ( TRUCK-AT ?auto_2441617 ?auto_2441618 ) ( AVAILABLE ?auto_2441616 ) ( IN ?auto_2441615 ?auto_2441617 ) ( ON ?auto_2441614 ?auto_2441613 ) ( not ( = ?auto_2441613 ?auto_2441614 ) ) ( not ( = ?auto_2441613 ?auto_2441615 ) ) ( ON ?auto_2441603 ?auto_2441602 ) ( ON ?auto_2441604 ?auto_2441603 ) ( ON ?auto_2441606 ?auto_2441604 ) ( ON ?auto_2441605 ?auto_2441606 ) ( ON ?auto_2441607 ?auto_2441605 ) ( ON ?auto_2441608 ?auto_2441607 ) ( ON ?auto_2441609 ?auto_2441608 ) ( ON ?auto_2441610 ?auto_2441609 ) ( ON ?auto_2441611 ?auto_2441610 ) ( ON ?auto_2441612 ?auto_2441611 ) ( ON ?auto_2441613 ?auto_2441612 ) ( not ( = ?auto_2441602 ?auto_2441603 ) ) ( not ( = ?auto_2441602 ?auto_2441604 ) ) ( not ( = ?auto_2441602 ?auto_2441606 ) ) ( not ( = ?auto_2441602 ?auto_2441605 ) ) ( not ( = ?auto_2441602 ?auto_2441607 ) ) ( not ( = ?auto_2441602 ?auto_2441608 ) ) ( not ( = ?auto_2441602 ?auto_2441609 ) ) ( not ( = ?auto_2441602 ?auto_2441610 ) ) ( not ( = ?auto_2441602 ?auto_2441611 ) ) ( not ( = ?auto_2441602 ?auto_2441612 ) ) ( not ( = ?auto_2441602 ?auto_2441613 ) ) ( not ( = ?auto_2441602 ?auto_2441614 ) ) ( not ( = ?auto_2441602 ?auto_2441615 ) ) ( not ( = ?auto_2441603 ?auto_2441604 ) ) ( not ( = ?auto_2441603 ?auto_2441606 ) ) ( not ( = ?auto_2441603 ?auto_2441605 ) ) ( not ( = ?auto_2441603 ?auto_2441607 ) ) ( not ( = ?auto_2441603 ?auto_2441608 ) ) ( not ( = ?auto_2441603 ?auto_2441609 ) ) ( not ( = ?auto_2441603 ?auto_2441610 ) ) ( not ( = ?auto_2441603 ?auto_2441611 ) ) ( not ( = ?auto_2441603 ?auto_2441612 ) ) ( not ( = ?auto_2441603 ?auto_2441613 ) ) ( not ( = ?auto_2441603 ?auto_2441614 ) ) ( not ( = ?auto_2441603 ?auto_2441615 ) ) ( not ( = ?auto_2441604 ?auto_2441606 ) ) ( not ( = ?auto_2441604 ?auto_2441605 ) ) ( not ( = ?auto_2441604 ?auto_2441607 ) ) ( not ( = ?auto_2441604 ?auto_2441608 ) ) ( not ( = ?auto_2441604 ?auto_2441609 ) ) ( not ( = ?auto_2441604 ?auto_2441610 ) ) ( not ( = ?auto_2441604 ?auto_2441611 ) ) ( not ( = ?auto_2441604 ?auto_2441612 ) ) ( not ( = ?auto_2441604 ?auto_2441613 ) ) ( not ( = ?auto_2441604 ?auto_2441614 ) ) ( not ( = ?auto_2441604 ?auto_2441615 ) ) ( not ( = ?auto_2441606 ?auto_2441605 ) ) ( not ( = ?auto_2441606 ?auto_2441607 ) ) ( not ( = ?auto_2441606 ?auto_2441608 ) ) ( not ( = ?auto_2441606 ?auto_2441609 ) ) ( not ( = ?auto_2441606 ?auto_2441610 ) ) ( not ( = ?auto_2441606 ?auto_2441611 ) ) ( not ( = ?auto_2441606 ?auto_2441612 ) ) ( not ( = ?auto_2441606 ?auto_2441613 ) ) ( not ( = ?auto_2441606 ?auto_2441614 ) ) ( not ( = ?auto_2441606 ?auto_2441615 ) ) ( not ( = ?auto_2441605 ?auto_2441607 ) ) ( not ( = ?auto_2441605 ?auto_2441608 ) ) ( not ( = ?auto_2441605 ?auto_2441609 ) ) ( not ( = ?auto_2441605 ?auto_2441610 ) ) ( not ( = ?auto_2441605 ?auto_2441611 ) ) ( not ( = ?auto_2441605 ?auto_2441612 ) ) ( not ( = ?auto_2441605 ?auto_2441613 ) ) ( not ( = ?auto_2441605 ?auto_2441614 ) ) ( not ( = ?auto_2441605 ?auto_2441615 ) ) ( not ( = ?auto_2441607 ?auto_2441608 ) ) ( not ( = ?auto_2441607 ?auto_2441609 ) ) ( not ( = ?auto_2441607 ?auto_2441610 ) ) ( not ( = ?auto_2441607 ?auto_2441611 ) ) ( not ( = ?auto_2441607 ?auto_2441612 ) ) ( not ( = ?auto_2441607 ?auto_2441613 ) ) ( not ( = ?auto_2441607 ?auto_2441614 ) ) ( not ( = ?auto_2441607 ?auto_2441615 ) ) ( not ( = ?auto_2441608 ?auto_2441609 ) ) ( not ( = ?auto_2441608 ?auto_2441610 ) ) ( not ( = ?auto_2441608 ?auto_2441611 ) ) ( not ( = ?auto_2441608 ?auto_2441612 ) ) ( not ( = ?auto_2441608 ?auto_2441613 ) ) ( not ( = ?auto_2441608 ?auto_2441614 ) ) ( not ( = ?auto_2441608 ?auto_2441615 ) ) ( not ( = ?auto_2441609 ?auto_2441610 ) ) ( not ( = ?auto_2441609 ?auto_2441611 ) ) ( not ( = ?auto_2441609 ?auto_2441612 ) ) ( not ( = ?auto_2441609 ?auto_2441613 ) ) ( not ( = ?auto_2441609 ?auto_2441614 ) ) ( not ( = ?auto_2441609 ?auto_2441615 ) ) ( not ( = ?auto_2441610 ?auto_2441611 ) ) ( not ( = ?auto_2441610 ?auto_2441612 ) ) ( not ( = ?auto_2441610 ?auto_2441613 ) ) ( not ( = ?auto_2441610 ?auto_2441614 ) ) ( not ( = ?auto_2441610 ?auto_2441615 ) ) ( not ( = ?auto_2441611 ?auto_2441612 ) ) ( not ( = ?auto_2441611 ?auto_2441613 ) ) ( not ( = ?auto_2441611 ?auto_2441614 ) ) ( not ( = ?auto_2441611 ?auto_2441615 ) ) ( not ( = ?auto_2441612 ?auto_2441613 ) ) ( not ( = ?auto_2441612 ?auto_2441614 ) ) ( not ( = ?auto_2441612 ?auto_2441615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2441613 ?auto_2441614 ?auto_2441615 )
      ( MAKE-13CRATE-VERIFY ?auto_2441602 ?auto_2441603 ?auto_2441604 ?auto_2441606 ?auto_2441605 ?auto_2441607 ?auto_2441608 ?auto_2441609 ?auto_2441610 ?auto_2441611 ?auto_2441612 ?auto_2441613 ?auto_2441614 ?auto_2441615 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2441758 - SURFACE
      ?auto_2441759 - SURFACE
      ?auto_2441760 - SURFACE
      ?auto_2441762 - SURFACE
      ?auto_2441761 - SURFACE
      ?auto_2441763 - SURFACE
      ?auto_2441764 - SURFACE
      ?auto_2441765 - SURFACE
      ?auto_2441766 - SURFACE
      ?auto_2441767 - SURFACE
      ?auto_2441768 - SURFACE
      ?auto_2441769 - SURFACE
      ?auto_2441770 - SURFACE
      ?auto_2441771 - SURFACE
    )
    :vars
    (
      ?auto_2441775 - HOIST
      ?auto_2441772 - PLACE
      ?auto_2441774 - TRUCK
      ?auto_2441773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2441775 ?auto_2441772 ) ( SURFACE-AT ?auto_2441770 ?auto_2441772 ) ( CLEAR ?auto_2441770 ) ( IS-CRATE ?auto_2441771 ) ( not ( = ?auto_2441770 ?auto_2441771 ) ) ( AVAILABLE ?auto_2441775 ) ( IN ?auto_2441771 ?auto_2441774 ) ( ON ?auto_2441770 ?auto_2441769 ) ( not ( = ?auto_2441769 ?auto_2441770 ) ) ( not ( = ?auto_2441769 ?auto_2441771 ) ) ( TRUCK-AT ?auto_2441774 ?auto_2441773 ) ( not ( = ?auto_2441773 ?auto_2441772 ) ) ( ON ?auto_2441759 ?auto_2441758 ) ( ON ?auto_2441760 ?auto_2441759 ) ( ON ?auto_2441762 ?auto_2441760 ) ( ON ?auto_2441761 ?auto_2441762 ) ( ON ?auto_2441763 ?auto_2441761 ) ( ON ?auto_2441764 ?auto_2441763 ) ( ON ?auto_2441765 ?auto_2441764 ) ( ON ?auto_2441766 ?auto_2441765 ) ( ON ?auto_2441767 ?auto_2441766 ) ( ON ?auto_2441768 ?auto_2441767 ) ( ON ?auto_2441769 ?auto_2441768 ) ( not ( = ?auto_2441758 ?auto_2441759 ) ) ( not ( = ?auto_2441758 ?auto_2441760 ) ) ( not ( = ?auto_2441758 ?auto_2441762 ) ) ( not ( = ?auto_2441758 ?auto_2441761 ) ) ( not ( = ?auto_2441758 ?auto_2441763 ) ) ( not ( = ?auto_2441758 ?auto_2441764 ) ) ( not ( = ?auto_2441758 ?auto_2441765 ) ) ( not ( = ?auto_2441758 ?auto_2441766 ) ) ( not ( = ?auto_2441758 ?auto_2441767 ) ) ( not ( = ?auto_2441758 ?auto_2441768 ) ) ( not ( = ?auto_2441758 ?auto_2441769 ) ) ( not ( = ?auto_2441758 ?auto_2441770 ) ) ( not ( = ?auto_2441758 ?auto_2441771 ) ) ( not ( = ?auto_2441759 ?auto_2441760 ) ) ( not ( = ?auto_2441759 ?auto_2441762 ) ) ( not ( = ?auto_2441759 ?auto_2441761 ) ) ( not ( = ?auto_2441759 ?auto_2441763 ) ) ( not ( = ?auto_2441759 ?auto_2441764 ) ) ( not ( = ?auto_2441759 ?auto_2441765 ) ) ( not ( = ?auto_2441759 ?auto_2441766 ) ) ( not ( = ?auto_2441759 ?auto_2441767 ) ) ( not ( = ?auto_2441759 ?auto_2441768 ) ) ( not ( = ?auto_2441759 ?auto_2441769 ) ) ( not ( = ?auto_2441759 ?auto_2441770 ) ) ( not ( = ?auto_2441759 ?auto_2441771 ) ) ( not ( = ?auto_2441760 ?auto_2441762 ) ) ( not ( = ?auto_2441760 ?auto_2441761 ) ) ( not ( = ?auto_2441760 ?auto_2441763 ) ) ( not ( = ?auto_2441760 ?auto_2441764 ) ) ( not ( = ?auto_2441760 ?auto_2441765 ) ) ( not ( = ?auto_2441760 ?auto_2441766 ) ) ( not ( = ?auto_2441760 ?auto_2441767 ) ) ( not ( = ?auto_2441760 ?auto_2441768 ) ) ( not ( = ?auto_2441760 ?auto_2441769 ) ) ( not ( = ?auto_2441760 ?auto_2441770 ) ) ( not ( = ?auto_2441760 ?auto_2441771 ) ) ( not ( = ?auto_2441762 ?auto_2441761 ) ) ( not ( = ?auto_2441762 ?auto_2441763 ) ) ( not ( = ?auto_2441762 ?auto_2441764 ) ) ( not ( = ?auto_2441762 ?auto_2441765 ) ) ( not ( = ?auto_2441762 ?auto_2441766 ) ) ( not ( = ?auto_2441762 ?auto_2441767 ) ) ( not ( = ?auto_2441762 ?auto_2441768 ) ) ( not ( = ?auto_2441762 ?auto_2441769 ) ) ( not ( = ?auto_2441762 ?auto_2441770 ) ) ( not ( = ?auto_2441762 ?auto_2441771 ) ) ( not ( = ?auto_2441761 ?auto_2441763 ) ) ( not ( = ?auto_2441761 ?auto_2441764 ) ) ( not ( = ?auto_2441761 ?auto_2441765 ) ) ( not ( = ?auto_2441761 ?auto_2441766 ) ) ( not ( = ?auto_2441761 ?auto_2441767 ) ) ( not ( = ?auto_2441761 ?auto_2441768 ) ) ( not ( = ?auto_2441761 ?auto_2441769 ) ) ( not ( = ?auto_2441761 ?auto_2441770 ) ) ( not ( = ?auto_2441761 ?auto_2441771 ) ) ( not ( = ?auto_2441763 ?auto_2441764 ) ) ( not ( = ?auto_2441763 ?auto_2441765 ) ) ( not ( = ?auto_2441763 ?auto_2441766 ) ) ( not ( = ?auto_2441763 ?auto_2441767 ) ) ( not ( = ?auto_2441763 ?auto_2441768 ) ) ( not ( = ?auto_2441763 ?auto_2441769 ) ) ( not ( = ?auto_2441763 ?auto_2441770 ) ) ( not ( = ?auto_2441763 ?auto_2441771 ) ) ( not ( = ?auto_2441764 ?auto_2441765 ) ) ( not ( = ?auto_2441764 ?auto_2441766 ) ) ( not ( = ?auto_2441764 ?auto_2441767 ) ) ( not ( = ?auto_2441764 ?auto_2441768 ) ) ( not ( = ?auto_2441764 ?auto_2441769 ) ) ( not ( = ?auto_2441764 ?auto_2441770 ) ) ( not ( = ?auto_2441764 ?auto_2441771 ) ) ( not ( = ?auto_2441765 ?auto_2441766 ) ) ( not ( = ?auto_2441765 ?auto_2441767 ) ) ( not ( = ?auto_2441765 ?auto_2441768 ) ) ( not ( = ?auto_2441765 ?auto_2441769 ) ) ( not ( = ?auto_2441765 ?auto_2441770 ) ) ( not ( = ?auto_2441765 ?auto_2441771 ) ) ( not ( = ?auto_2441766 ?auto_2441767 ) ) ( not ( = ?auto_2441766 ?auto_2441768 ) ) ( not ( = ?auto_2441766 ?auto_2441769 ) ) ( not ( = ?auto_2441766 ?auto_2441770 ) ) ( not ( = ?auto_2441766 ?auto_2441771 ) ) ( not ( = ?auto_2441767 ?auto_2441768 ) ) ( not ( = ?auto_2441767 ?auto_2441769 ) ) ( not ( = ?auto_2441767 ?auto_2441770 ) ) ( not ( = ?auto_2441767 ?auto_2441771 ) ) ( not ( = ?auto_2441768 ?auto_2441769 ) ) ( not ( = ?auto_2441768 ?auto_2441770 ) ) ( not ( = ?auto_2441768 ?auto_2441771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2441769 ?auto_2441770 ?auto_2441771 )
      ( MAKE-13CRATE-VERIFY ?auto_2441758 ?auto_2441759 ?auto_2441760 ?auto_2441762 ?auto_2441761 ?auto_2441763 ?auto_2441764 ?auto_2441765 ?auto_2441766 ?auto_2441767 ?auto_2441768 ?auto_2441769 ?auto_2441770 ?auto_2441771 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2441927 - SURFACE
      ?auto_2441928 - SURFACE
      ?auto_2441929 - SURFACE
      ?auto_2441931 - SURFACE
      ?auto_2441930 - SURFACE
      ?auto_2441932 - SURFACE
      ?auto_2441933 - SURFACE
      ?auto_2441934 - SURFACE
      ?auto_2441935 - SURFACE
      ?auto_2441936 - SURFACE
      ?auto_2441937 - SURFACE
      ?auto_2441938 - SURFACE
      ?auto_2441939 - SURFACE
      ?auto_2441940 - SURFACE
    )
    :vars
    (
      ?auto_2441942 - HOIST
      ?auto_2441945 - PLACE
      ?auto_2441941 - TRUCK
      ?auto_2441943 - PLACE
      ?auto_2441944 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2441942 ?auto_2441945 ) ( SURFACE-AT ?auto_2441939 ?auto_2441945 ) ( CLEAR ?auto_2441939 ) ( IS-CRATE ?auto_2441940 ) ( not ( = ?auto_2441939 ?auto_2441940 ) ) ( AVAILABLE ?auto_2441942 ) ( ON ?auto_2441939 ?auto_2441938 ) ( not ( = ?auto_2441938 ?auto_2441939 ) ) ( not ( = ?auto_2441938 ?auto_2441940 ) ) ( TRUCK-AT ?auto_2441941 ?auto_2441943 ) ( not ( = ?auto_2441943 ?auto_2441945 ) ) ( HOIST-AT ?auto_2441944 ?auto_2441943 ) ( LIFTING ?auto_2441944 ?auto_2441940 ) ( not ( = ?auto_2441942 ?auto_2441944 ) ) ( ON ?auto_2441928 ?auto_2441927 ) ( ON ?auto_2441929 ?auto_2441928 ) ( ON ?auto_2441931 ?auto_2441929 ) ( ON ?auto_2441930 ?auto_2441931 ) ( ON ?auto_2441932 ?auto_2441930 ) ( ON ?auto_2441933 ?auto_2441932 ) ( ON ?auto_2441934 ?auto_2441933 ) ( ON ?auto_2441935 ?auto_2441934 ) ( ON ?auto_2441936 ?auto_2441935 ) ( ON ?auto_2441937 ?auto_2441936 ) ( ON ?auto_2441938 ?auto_2441937 ) ( not ( = ?auto_2441927 ?auto_2441928 ) ) ( not ( = ?auto_2441927 ?auto_2441929 ) ) ( not ( = ?auto_2441927 ?auto_2441931 ) ) ( not ( = ?auto_2441927 ?auto_2441930 ) ) ( not ( = ?auto_2441927 ?auto_2441932 ) ) ( not ( = ?auto_2441927 ?auto_2441933 ) ) ( not ( = ?auto_2441927 ?auto_2441934 ) ) ( not ( = ?auto_2441927 ?auto_2441935 ) ) ( not ( = ?auto_2441927 ?auto_2441936 ) ) ( not ( = ?auto_2441927 ?auto_2441937 ) ) ( not ( = ?auto_2441927 ?auto_2441938 ) ) ( not ( = ?auto_2441927 ?auto_2441939 ) ) ( not ( = ?auto_2441927 ?auto_2441940 ) ) ( not ( = ?auto_2441928 ?auto_2441929 ) ) ( not ( = ?auto_2441928 ?auto_2441931 ) ) ( not ( = ?auto_2441928 ?auto_2441930 ) ) ( not ( = ?auto_2441928 ?auto_2441932 ) ) ( not ( = ?auto_2441928 ?auto_2441933 ) ) ( not ( = ?auto_2441928 ?auto_2441934 ) ) ( not ( = ?auto_2441928 ?auto_2441935 ) ) ( not ( = ?auto_2441928 ?auto_2441936 ) ) ( not ( = ?auto_2441928 ?auto_2441937 ) ) ( not ( = ?auto_2441928 ?auto_2441938 ) ) ( not ( = ?auto_2441928 ?auto_2441939 ) ) ( not ( = ?auto_2441928 ?auto_2441940 ) ) ( not ( = ?auto_2441929 ?auto_2441931 ) ) ( not ( = ?auto_2441929 ?auto_2441930 ) ) ( not ( = ?auto_2441929 ?auto_2441932 ) ) ( not ( = ?auto_2441929 ?auto_2441933 ) ) ( not ( = ?auto_2441929 ?auto_2441934 ) ) ( not ( = ?auto_2441929 ?auto_2441935 ) ) ( not ( = ?auto_2441929 ?auto_2441936 ) ) ( not ( = ?auto_2441929 ?auto_2441937 ) ) ( not ( = ?auto_2441929 ?auto_2441938 ) ) ( not ( = ?auto_2441929 ?auto_2441939 ) ) ( not ( = ?auto_2441929 ?auto_2441940 ) ) ( not ( = ?auto_2441931 ?auto_2441930 ) ) ( not ( = ?auto_2441931 ?auto_2441932 ) ) ( not ( = ?auto_2441931 ?auto_2441933 ) ) ( not ( = ?auto_2441931 ?auto_2441934 ) ) ( not ( = ?auto_2441931 ?auto_2441935 ) ) ( not ( = ?auto_2441931 ?auto_2441936 ) ) ( not ( = ?auto_2441931 ?auto_2441937 ) ) ( not ( = ?auto_2441931 ?auto_2441938 ) ) ( not ( = ?auto_2441931 ?auto_2441939 ) ) ( not ( = ?auto_2441931 ?auto_2441940 ) ) ( not ( = ?auto_2441930 ?auto_2441932 ) ) ( not ( = ?auto_2441930 ?auto_2441933 ) ) ( not ( = ?auto_2441930 ?auto_2441934 ) ) ( not ( = ?auto_2441930 ?auto_2441935 ) ) ( not ( = ?auto_2441930 ?auto_2441936 ) ) ( not ( = ?auto_2441930 ?auto_2441937 ) ) ( not ( = ?auto_2441930 ?auto_2441938 ) ) ( not ( = ?auto_2441930 ?auto_2441939 ) ) ( not ( = ?auto_2441930 ?auto_2441940 ) ) ( not ( = ?auto_2441932 ?auto_2441933 ) ) ( not ( = ?auto_2441932 ?auto_2441934 ) ) ( not ( = ?auto_2441932 ?auto_2441935 ) ) ( not ( = ?auto_2441932 ?auto_2441936 ) ) ( not ( = ?auto_2441932 ?auto_2441937 ) ) ( not ( = ?auto_2441932 ?auto_2441938 ) ) ( not ( = ?auto_2441932 ?auto_2441939 ) ) ( not ( = ?auto_2441932 ?auto_2441940 ) ) ( not ( = ?auto_2441933 ?auto_2441934 ) ) ( not ( = ?auto_2441933 ?auto_2441935 ) ) ( not ( = ?auto_2441933 ?auto_2441936 ) ) ( not ( = ?auto_2441933 ?auto_2441937 ) ) ( not ( = ?auto_2441933 ?auto_2441938 ) ) ( not ( = ?auto_2441933 ?auto_2441939 ) ) ( not ( = ?auto_2441933 ?auto_2441940 ) ) ( not ( = ?auto_2441934 ?auto_2441935 ) ) ( not ( = ?auto_2441934 ?auto_2441936 ) ) ( not ( = ?auto_2441934 ?auto_2441937 ) ) ( not ( = ?auto_2441934 ?auto_2441938 ) ) ( not ( = ?auto_2441934 ?auto_2441939 ) ) ( not ( = ?auto_2441934 ?auto_2441940 ) ) ( not ( = ?auto_2441935 ?auto_2441936 ) ) ( not ( = ?auto_2441935 ?auto_2441937 ) ) ( not ( = ?auto_2441935 ?auto_2441938 ) ) ( not ( = ?auto_2441935 ?auto_2441939 ) ) ( not ( = ?auto_2441935 ?auto_2441940 ) ) ( not ( = ?auto_2441936 ?auto_2441937 ) ) ( not ( = ?auto_2441936 ?auto_2441938 ) ) ( not ( = ?auto_2441936 ?auto_2441939 ) ) ( not ( = ?auto_2441936 ?auto_2441940 ) ) ( not ( = ?auto_2441937 ?auto_2441938 ) ) ( not ( = ?auto_2441937 ?auto_2441939 ) ) ( not ( = ?auto_2441937 ?auto_2441940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2441938 ?auto_2441939 ?auto_2441940 )
      ( MAKE-13CRATE-VERIFY ?auto_2441927 ?auto_2441928 ?auto_2441929 ?auto_2441931 ?auto_2441930 ?auto_2441932 ?auto_2441933 ?auto_2441934 ?auto_2441935 ?auto_2441936 ?auto_2441937 ?auto_2441938 ?auto_2441939 ?auto_2441940 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2442109 - SURFACE
      ?auto_2442110 - SURFACE
      ?auto_2442111 - SURFACE
      ?auto_2442113 - SURFACE
      ?auto_2442112 - SURFACE
      ?auto_2442114 - SURFACE
      ?auto_2442115 - SURFACE
      ?auto_2442116 - SURFACE
      ?auto_2442117 - SURFACE
      ?auto_2442118 - SURFACE
      ?auto_2442119 - SURFACE
      ?auto_2442120 - SURFACE
      ?auto_2442121 - SURFACE
      ?auto_2442122 - SURFACE
    )
    :vars
    (
      ?auto_2442128 - HOIST
      ?auto_2442126 - PLACE
      ?auto_2442124 - TRUCK
      ?auto_2442127 - PLACE
      ?auto_2442125 - HOIST
      ?auto_2442123 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2442128 ?auto_2442126 ) ( SURFACE-AT ?auto_2442121 ?auto_2442126 ) ( CLEAR ?auto_2442121 ) ( IS-CRATE ?auto_2442122 ) ( not ( = ?auto_2442121 ?auto_2442122 ) ) ( AVAILABLE ?auto_2442128 ) ( ON ?auto_2442121 ?auto_2442120 ) ( not ( = ?auto_2442120 ?auto_2442121 ) ) ( not ( = ?auto_2442120 ?auto_2442122 ) ) ( TRUCK-AT ?auto_2442124 ?auto_2442127 ) ( not ( = ?auto_2442127 ?auto_2442126 ) ) ( HOIST-AT ?auto_2442125 ?auto_2442127 ) ( not ( = ?auto_2442128 ?auto_2442125 ) ) ( AVAILABLE ?auto_2442125 ) ( SURFACE-AT ?auto_2442122 ?auto_2442127 ) ( ON ?auto_2442122 ?auto_2442123 ) ( CLEAR ?auto_2442122 ) ( not ( = ?auto_2442121 ?auto_2442123 ) ) ( not ( = ?auto_2442122 ?auto_2442123 ) ) ( not ( = ?auto_2442120 ?auto_2442123 ) ) ( ON ?auto_2442110 ?auto_2442109 ) ( ON ?auto_2442111 ?auto_2442110 ) ( ON ?auto_2442113 ?auto_2442111 ) ( ON ?auto_2442112 ?auto_2442113 ) ( ON ?auto_2442114 ?auto_2442112 ) ( ON ?auto_2442115 ?auto_2442114 ) ( ON ?auto_2442116 ?auto_2442115 ) ( ON ?auto_2442117 ?auto_2442116 ) ( ON ?auto_2442118 ?auto_2442117 ) ( ON ?auto_2442119 ?auto_2442118 ) ( ON ?auto_2442120 ?auto_2442119 ) ( not ( = ?auto_2442109 ?auto_2442110 ) ) ( not ( = ?auto_2442109 ?auto_2442111 ) ) ( not ( = ?auto_2442109 ?auto_2442113 ) ) ( not ( = ?auto_2442109 ?auto_2442112 ) ) ( not ( = ?auto_2442109 ?auto_2442114 ) ) ( not ( = ?auto_2442109 ?auto_2442115 ) ) ( not ( = ?auto_2442109 ?auto_2442116 ) ) ( not ( = ?auto_2442109 ?auto_2442117 ) ) ( not ( = ?auto_2442109 ?auto_2442118 ) ) ( not ( = ?auto_2442109 ?auto_2442119 ) ) ( not ( = ?auto_2442109 ?auto_2442120 ) ) ( not ( = ?auto_2442109 ?auto_2442121 ) ) ( not ( = ?auto_2442109 ?auto_2442122 ) ) ( not ( = ?auto_2442109 ?auto_2442123 ) ) ( not ( = ?auto_2442110 ?auto_2442111 ) ) ( not ( = ?auto_2442110 ?auto_2442113 ) ) ( not ( = ?auto_2442110 ?auto_2442112 ) ) ( not ( = ?auto_2442110 ?auto_2442114 ) ) ( not ( = ?auto_2442110 ?auto_2442115 ) ) ( not ( = ?auto_2442110 ?auto_2442116 ) ) ( not ( = ?auto_2442110 ?auto_2442117 ) ) ( not ( = ?auto_2442110 ?auto_2442118 ) ) ( not ( = ?auto_2442110 ?auto_2442119 ) ) ( not ( = ?auto_2442110 ?auto_2442120 ) ) ( not ( = ?auto_2442110 ?auto_2442121 ) ) ( not ( = ?auto_2442110 ?auto_2442122 ) ) ( not ( = ?auto_2442110 ?auto_2442123 ) ) ( not ( = ?auto_2442111 ?auto_2442113 ) ) ( not ( = ?auto_2442111 ?auto_2442112 ) ) ( not ( = ?auto_2442111 ?auto_2442114 ) ) ( not ( = ?auto_2442111 ?auto_2442115 ) ) ( not ( = ?auto_2442111 ?auto_2442116 ) ) ( not ( = ?auto_2442111 ?auto_2442117 ) ) ( not ( = ?auto_2442111 ?auto_2442118 ) ) ( not ( = ?auto_2442111 ?auto_2442119 ) ) ( not ( = ?auto_2442111 ?auto_2442120 ) ) ( not ( = ?auto_2442111 ?auto_2442121 ) ) ( not ( = ?auto_2442111 ?auto_2442122 ) ) ( not ( = ?auto_2442111 ?auto_2442123 ) ) ( not ( = ?auto_2442113 ?auto_2442112 ) ) ( not ( = ?auto_2442113 ?auto_2442114 ) ) ( not ( = ?auto_2442113 ?auto_2442115 ) ) ( not ( = ?auto_2442113 ?auto_2442116 ) ) ( not ( = ?auto_2442113 ?auto_2442117 ) ) ( not ( = ?auto_2442113 ?auto_2442118 ) ) ( not ( = ?auto_2442113 ?auto_2442119 ) ) ( not ( = ?auto_2442113 ?auto_2442120 ) ) ( not ( = ?auto_2442113 ?auto_2442121 ) ) ( not ( = ?auto_2442113 ?auto_2442122 ) ) ( not ( = ?auto_2442113 ?auto_2442123 ) ) ( not ( = ?auto_2442112 ?auto_2442114 ) ) ( not ( = ?auto_2442112 ?auto_2442115 ) ) ( not ( = ?auto_2442112 ?auto_2442116 ) ) ( not ( = ?auto_2442112 ?auto_2442117 ) ) ( not ( = ?auto_2442112 ?auto_2442118 ) ) ( not ( = ?auto_2442112 ?auto_2442119 ) ) ( not ( = ?auto_2442112 ?auto_2442120 ) ) ( not ( = ?auto_2442112 ?auto_2442121 ) ) ( not ( = ?auto_2442112 ?auto_2442122 ) ) ( not ( = ?auto_2442112 ?auto_2442123 ) ) ( not ( = ?auto_2442114 ?auto_2442115 ) ) ( not ( = ?auto_2442114 ?auto_2442116 ) ) ( not ( = ?auto_2442114 ?auto_2442117 ) ) ( not ( = ?auto_2442114 ?auto_2442118 ) ) ( not ( = ?auto_2442114 ?auto_2442119 ) ) ( not ( = ?auto_2442114 ?auto_2442120 ) ) ( not ( = ?auto_2442114 ?auto_2442121 ) ) ( not ( = ?auto_2442114 ?auto_2442122 ) ) ( not ( = ?auto_2442114 ?auto_2442123 ) ) ( not ( = ?auto_2442115 ?auto_2442116 ) ) ( not ( = ?auto_2442115 ?auto_2442117 ) ) ( not ( = ?auto_2442115 ?auto_2442118 ) ) ( not ( = ?auto_2442115 ?auto_2442119 ) ) ( not ( = ?auto_2442115 ?auto_2442120 ) ) ( not ( = ?auto_2442115 ?auto_2442121 ) ) ( not ( = ?auto_2442115 ?auto_2442122 ) ) ( not ( = ?auto_2442115 ?auto_2442123 ) ) ( not ( = ?auto_2442116 ?auto_2442117 ) ) ( not ( = ?auto_2442116 ?auto_2442118 ) ) ( not ( = ?auto_2442116 ?auto_2442119 ) ) ( not ( = ?auto_2442116 ?auto_2442120 ) ) ( not ( = ?auto_2442116 ?auto_2442121 ) ) ( not ( = ?auto_2442116 ?auto_2442122 ) ) ( not ( = ?auto_2442116 ?auto_2442123 ) ) ( not ( = ?auto_2442117 ?auto_2442118 ) ) ( not ( = ?auto_2442117 ?auto_2442119 ) ) ( not ( = ?auto_2442117 ?auto_2442120 ) ) ( not ( = ?auto_2442117 ?auto_2442121 ) ) ( not ( = ?auto_2442117 ?auto_2442122 ) ) ( not ( = ?auto_2442117 ?auto_2442123 ) ) ( not ( = ?auto_2442118 ?auto_2442119 ) ) ( not ( = ?auto_2442118 ?auto_2442120 ) ) ( not ( = ?auto_2442118 ?auto_2442121 ) ) ( not ( = ?auto_2442118 ?auto_2442122 ) ) ( not ( = ?auto_2442118 ?auto_2442123 ) ) ( not ( = ?auto_2442119 ?auto_2442120 ) ) ( not ( = ?auto_2442119 ?auto_2442121 ) ) ( not ( = ?auto_2442119 ?auto_2442122 ) ) ( not ( = ?auto_2442119 ?auto_2442123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2442120 ?auto_2442121 ?auto_2442122 )
      ( MAKE-13CRATE-VERIFY ?auto_2442109 ?auto_2442110 ?auto_2442111 ?auto_2442113 ?auto_2442112 ?auto_2442114 ?auto_2442115 ?auto_2442116 ?auto_2442117 ?auto_2442118 ?auto_2442119 ?auto_2442120 ?auto_2442121 ?auto_2442122 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2442292 - SURFACE
      ?auto_2442293 - SURFACE
      ?auto_2442294 - SURFACE
      ?auto_2442296 - SURFACE
      ?auto_2442295 - SURFACE
      ?auto_2442297 - SURFACE
      ?auto_2442298 - SURFACE
      ?auto_2442299 - SURFACE
      ?auto_2442300 - SURFACE
      ?auto_2442301 - SURFACE
      ?auto_2442302 - SURFACE
      ?auto_2442303 - SURFACE
      ?auto_2442304 - SURFACE
      ?auto_2442305 - SURFACE
    )
    :vars
    (
      ?auto_2442311 - HOIST
      ?auto_2442308 - PLACE
      ?auto_2442310 - PLACE
      ?auto_2442309 - HOIST
      ?auto_2442307 - SURFACE
      ?auto_2442306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2442311 ?auto_2442308 ) ( SURFACE-AT ?auto_2442304 ?auto_2442308 ) ( CLEAR ?auto_2442304 ) ( IS-CRATE ?auto_2442305 ) ( not ( = ?auto_2442304 ?auto_2442305 ) ) ( AVAILABLE ?auto_2442311 ) ( ON ?auto_2442304 ?auto_2442303 ) ( not ( = ?auto_2442303 ?auto_2442304 ) ) ( not ( = ?auto_2442303 ?auto_2442305 ) ) ( not ( = ?auto_2442310 ?auto_2442308 ) ) ( HOIST-AT ?auto_2442309 ?auto_2442310 ) ( not ( = ?auto_2442311 ?auto_2442309 ) ) ( AVAILABLE ?auto_2442309 ) ( SURFACE-AT ?auto_2442305 ?auto_2442310 ) ( ON ?auto_2442305 ?auto_2442307 ) ( CLEAR ?auto_2442305 ) ( not ( = ?auto_2442304 ?auto_2442307 ) ) ( not ( = ?auto_2442305 ?auto_2442307 ) ) ( not ( = ?auto_2442303 ?auto_2442307 ) ) ( TRUCK-AT ?auto_2442306 ?auto_2442308 ) ( ON ?auto_2442293 ?auto_2442292 ) ( ON ?auto_2442294 ?auto_2442293 ) ( ON ?auto_2442296 ?auto_2442294 ) ( ON ?auto_2442295 ?auto_2442296 ) ( ON ?auto_2442297 ?auto_2442295 ) ( ON ?auto_2442298 ?auto_2442297 ) ( ON ?auto_2442299 ?auto_2442298 ) ( ON ?auto_2442300 ?auto_2442299 ) ( ON ?auto_2442301 ?auto_2442300 ) ( ON ?auto_2442302 ?auto_2442301 ) ( ON ?auto_2442303 ?auto_2442302 ) ( not ( = ?auto_2442292 ?auto_2442293 ) ) ( not ( = ?auto_2442292 ?auto_2442294 ) ) ( not ( = ?auto_2442292 ?auto_2442296 ) ) ( not ( = ?auto_2442292 ?auto_2442295 ) ) ( not ( = ?auto_2442292 ?auto_2442297 ) ) ( not ( = ?auto_2442292 ?auto_2442298 ) ) ( not ( = ?auto_2442292 ?auto_2442299 ) ) ( not ( = ?auto_2442292 ?auto_2442300 ) ) ( not ( = ?auto_2442292 ?auto_2442301 ) ) ( not ( = ?auto_2442292 ?auto_2442302 ) ) ( not ( = ?auto_2442292 ?auto_2442303 ) ) ( not ( = ?auto_2442292 ?auto_2442304 ) ) ( not ( = ?auto_2442292 ?auto_2442305 ) ) ( not ( = ?auto_2442292 ?auto_2442307 ) ) ( not ( = ?auto_2442293 ?auto_2442294 ) ) ( not ( = ?auto_2442293 ?auto_2442296 ) ) ( not ( = ?auto_2442293 ?auto_2442295 ) ) ( not ( = ?auto_2442293 ?auto_2442297 ) ) ( not ( = ?auto_2442293 ?auto_2442298 ) ) ( not ( = ?auto_2442293 ?auto_2442299 ) ) ( not ( = ?auto_2442293 ?auto_2442300 ) ) ( not ( = ?auto_2442293 ?auto_2442301 ) ) ( not ( = ?auto_2442293 ?auto_2442302 ) ) ( not ( = ?auto_2442293 ?auto_2442303 ) ) ( not ( = ?auto_2442293 ?auto_2442304 ) ) ( not ( = ?auto_2442293 ?auto_2442305 ) ) ( not ( = ?auto_2442293 ?auto_2442307 ) ) ( not ( = ?auto_2442294 ?auto_2442296 ) ) ( not ( = ?auto_2442294 ?auto_2442295 ) ) ( not ( = ?auto_2442294 ?auto_2442297 ) ) ( not ( = ?auto_2442294 ?auto_2442298 ) ) ( not ( = ?auto_2442294 ?auto_2442299 ) ) ( not ( = ?auto_2442294 ?auto_2442300 ) ) ( not ( = ?auto_2442294 ?auto_2442301 ) ) ( not ( = ?auto_2442294 ?auto_2442302 ) ) ( not ( = ?auto_2442294 ?auto_2442303 ) ) ( not ( = ?auto_2442294 ?auto_2442304 ) ) ( not ( = ?auto_2442294 ?auto_2442305 ) ) ( not ( = ?auto_2442294 ?auto_2442307 ) ) ( not ( = ?auto_2442296 ?auto_2442295 ) ) ( not ( = ?auto_2442296 ?auto_2442297 ) ) ( not ( = ?auto_2442296 ?auto_2442298 ) ) ( not ( = ?auto_2442296 ?auto_2442299 ) ) ( not ( = ?auto_2442296 ?auto_2442300 ) ) ( not ( = ?auto_2442296 ?auto_2442301 ) ) ( not ( = ?auto_2442296 ?auto_2442302 ) ) ( not ( = ?auto_2442296 ?auto_2442303 ) ) ( not ( = ?auto_2442296 ?auto_2442304 ) ) ( not ( = ?auto_2442296 ?auto_2442305 ) ) ( not ( = ?auto_2442296 ?auto_2442307 ) ) ( not ( = ?auto_2442295 ?auto_2442297 ) ) ( not ( = ?auto_2442295 ?auto_2442298 ) ) ( not ( = ?auto_2442295 ?auto_2442299 ) ) ( not ( = ?auto_2442295 ?auto_2442300 ) ) ( not ( = ?auto_2442295 ?auto_2442301 ) ) ( not ( = ?auto_2442295 ?auto_2442302 ) ) ( not ( = ?auto_2442295 ?auto_2442303 ) ) ( not ( = ?auto_2442295 ?auto_2442304 ) ) ( not ( = ?auto_2442295 ?auto_2442305 ) ) ( not ( = ?auto_2442295 ?auto_2442307 ) ) ( not ( = ?auto_2442297 ?auto_2442298 ) ) ( not ( = ?auto_2442297 ?auto_2442299 ) ) ( not ( = ?auto_2442297 ?auto_2442300 ) ) ( not ( = ?auto_2442297 ?auto_2442301 ) ) ( not ( = ?auto_2442297 ?auto_2442302 ) ) ( not ( = ?auto_2442297 ?auto_2442303 ) ) ( not ( = ?auto_2442297 ?auto_2442304 ) ) ( not ( = ?auto_2442297 ?auto_2442305 ) ) ( not ( = ?auto_2442297 ?auto_2442307 ) ) ( not ( = ?auto_2442298 ?auto_2442299 ) ) ( not ( = ?auto_2442298 ?auto_2442300 ) ) ( not ( = ?auto_2442298 ?auto_2442301 ) ) ( not ( = ?auto_2442298 ?auto_2442302 ) ) ( not ( = ?auto_2442298 ?auto_2442303 ) ) ( not ( = ?auto_2442298 ?auto_2442304 ) ) ( not ( = ?auto_2442298 ?auto_2442305 ) ) ( not ( = ?auto_2442298 ?auto_2442307 ) ) ( not ( = ?auto_2442299 ?auto_2442300 ) ) ( not ( = ?auto_2442299 ?auto_2442301 ) ) ( not ( = ?auto_2442299 ?auto_2442302 ) ) ( not ( = ?auto_2442299 ?auto_2442303 ) ) ( not ( = ?auto_2442299 ?auto_2442304 ) ) ( not ( = ?auto_2442299 ?auto_2442305 ) ) ( not ( = ?auto_2442299 ?auto_2442307 ) ) ( not ( = ?auto_2442300 ?auto_2442301 ) ) ( not ( = ?auto_2442300 ?auto_2442302 ) ) ( not ( = ?auto_2442300 ?auto_2442303 ) ) ( not ( = ?auto_2442300 ?auto_2442304 ) ) ( not ( = ?auto_2442300 ?auto_2442305 ) ) ( not ( = ?auto_2442300 ?auto_2442307 ) ) ( not ( = ?auto_2442301 ?auto_2442302 ) ) ( not ( = ?auto_2442301 ?auto_2442303 ) ) ( not ( = ?auto_2442301 ?auto_2442304 ) ) ( not ( = ?auto_2442301 ?auto_2442305 ) ) ( not ( = ?auto_2442301 ?auto_2442307 ) ) ( not ( = ?auto_2442302 ?auto_2442303 ) ) ( not ( = ?auto_2442302 ?auto_2442304 ) ) ( not ( = ?auto_2442302 ?auto_2442305 ) ) ( not ( = ?auto_2442302 ?auto_2442307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2442303 ?auto_2442304 ?auto_2442305 )
      ( MAKE-13CRATE-VERIFY ?auto_2442292 ?auto_2442293 ?auto_2442294 ?auto_2442296 ?auto_2442295 ?auto_2442297 ?auto_2442298 ?auto_2442299 ?auto_2442300 ?auto_2442301 ?auto_2442302 ?auto_2442303 ?auto_2442304 ?auto_2442305 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2442475 - SURFACE
      ?auto_2442476 - SURFACE
      ?auto_2442477 - SURFACE
      ?auto_2442479 - SURFACE
      ?auto_2442478 - SURFACE
      ?auto_2442480 - SURFACE
      ?auto_2442481 - SURFACE
      ?auto_2442482 - SURFACE
      ?auto_2442483 - SURFACE
      ?auto_2442484 - SURFACE
      ?auto_2442485 - SURFACE
      ?auto_2442486 - SURFACE
      ?auto_2442487 - SURFACE
      ?auto_2442488 - SURFACE
    )
    :vars
    (
      ?auto_2442492 - HOIST
      ?auto_2442491 - PLACE
      ?auto_2442489 - PLACE
      ?auto_2442493 - HOIST
      ?auto_2442494 - SURFACE
      ?auto_2442490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2442492 ?auto_2442491 ) ( IS-CRATE ?auto_2442488 ) ( not ( = ?auto_2442487 ?auto_2442488 ) ) ( not ( = ?auto_2442486 ?auto_2442487 ) ) ( not ( = ?auto_2442486 ?auto_2442488 ) ) ( not ( = ?auto_2442489 ?auto_2442491 ) ) ( HOIST-AT ?auto_2442493 ?auto_2442489 ) ( not ( = ?auto_2442492 ?auto_2442493 ) ) ( AVAILABLE ?auto_2442493 ) ( SURFACE-AT ?auto_2442488 ?auto_2442489 ) ( ON ?auto_2442488 ?auto_2442494 ) ( CLEAR ?auto_2442488 ) ( not ( = ?auto_2442487 ?auto_2442494 ) ) ( not ( = ?auto_2442488 ?auto_2442494 ) ) ( not ( = ?auto_2442486 ?auto_2442494 ) ) ( TRUCK-AT ?auto_2442490 ?auto_2442491 ) ( SURFACE-AT ?auto_2442486 ?auto_2442491 ) ( CLEAR ?auto_2442486 ) ( LIFTING ?auto_2442492 ?auto_2442487 ) ( IS-CRATE ?auto_2442487 ) ( ON ?auto_2442476 ?auto_2442475 ) ( ON ?auto_2442477 ?auto_2442476 ) ( ON ?auto_2442479 ?auto_2442477 ) ( ON ?auto_2442478 ?auto_2442479 ) ( ON ?auto_2442480 ?auto_2442478 ) ( ON ?auto_2442481 ?auto_2442480 ) ( ON ?auto_2442482 ?auto_2442481 ) ( ON ?auto_2442483 ?auto_2442482 ) ( ON ?auto_2442484 ?auto_2442483 ) ( ON ?auto_2442485 ?auto_2442484 ) ( ON ?auto_2442486 ?auto_2442485 ) ( not ( = ?auto_2442475 ?auto_2442476 ) ) ( not ( = ?auto_2442475 ?auto_2442477 ) ) ( not ( = ?auto_2442475 ?auto_2442479 ) ) ( not ( = ?auto_2442475 ?auto_2442478 ) ) ( not ( = ?auto_2442475 ?auto_2442480 ) ) ( not ( = ?auto_2442475 ?auto_2442481 ) ) ( not ( = ?auto_2442475 ?auto_2442482 ) ) ( not ( = ?auto_2442475 ?auto_2442483 ) ) ( not ( = ?auto_2442475 ?auto_2442484 ) ) ( not ( = ?auto_2442475 ?auto_2442485 ) ) ( not ( = ?auto_2442475 ?auto_2442486 ) ) ( not ( = ?auto_2442475 ?auto_2442487 ) ) ( not ( = ?auto_2442475 ?auto_2442488 ) ) ( not ( = ?auto_2442475 ?auto_2442494 ) ) ( not ( = ?auto_2442476 ?auto_2442477 ) ) ( not ( = ?auto_2442476 ?auto_2442479 ) ) ( not ( = ?auto_2442476 ?auto_2442478 ) ) ( not ( = ?auto_2442476 ?auto_2442480 ) ) ( not ( = ?auto_2442476 ?auto_2442481 ) ) ( not ( = ?auto_2442476 ?auto_2442482 ) ) ( not ( = ?auto_2442476 ?auto_2442483 ) ) ( not ( = ?auto_2442476 ?auto_2442484 ) ) ( not ( = ?auto_2442476 ?auto_2442485 ) ) ( not ( = ?auto_2442476 ?auto_2442486 ) ) ( not ( = ?auto_2442476 ?auto_2442487 ) ) ( not ( = ?auto_2442476 ?auto_2442488 ) ) ( not ( = ?auto_2442476 ?auto_2442494 ) ) ( not ( = ?auto_2442477 ?auto_2442479 ) ) ( not ( = ?auto_2442477 ?auto_2442478 ) ) ( not ( = ?auto_2442477 ?auto_2442480 ) ) ( not ( = ?auto_2442477 ?auto_2442481 ) ) ( not ( = ?auto_2442477 ?auto_2442482 ) ) ( not ( = ?auto_2442477 ?auto_2442483 ) ) ( not ( = ?auto_2442477 ?auto_2442484 ) ) ( not ( = ?auto_2442477 ?auto_2442485 ) ) ( not ( = ?auto_2442477 ?auto_2442486 ) ) ( not ( = ?auto_2442477 ?auto_2442487 ) ) ( not ( = ?auto_2442477 ?auto_2442488 ) ) ( not ( = ?auto_2442477 ?auto_2442494 ) ) ( not ( = ?auto_2442479 ?auto_2442478 ) ) ( not ( = ?auto_2442479 ?auto_2442480 ) ) ( not ( = ?auto_2442479 ?auto_2442481 ) ) ( not ( = ?auto_2442479 ?auto_2442482 ) ) ( not ( = ?auto_2442479 ?auto_2442483 ) ) ( not ( = ?auto_2442479 ?auto_2442484 ) ) ( not ( = ?auto_2442479 ?auto_2442485 ) ) ( not ( = ?auto_2442479 ?auto_2442486 ) ) ( not ( = ?auto_2442479 ?auto_2442487 ) ) ( not ( = ?auto_2442479 ?auto_2442488 ) ) ( not ( = ?auto_2442479 ?auto_2442494 ) ) ( not ( = ?auto_2442478 ?auto_2442480 ) ) ( not ( = ?auto_2442478 ?auto_2442481 ) ) ( not ( = ?auto_2442478 ?auto_2442482 ) ) ( not ( = ?auto_2442478 ?auto_2442483 ) ) ( not ( = ?auto_2442478 ?auto_2442484 ) ) ( not ( = ?auto_2442478 ?auto_2442485 ) ) ( not ( = ?auto_2442478 ?auto_2442486 ) ) ( not ( = ?auto_2442478 ?auto_2442487 ) ) ( not ( = ?auto_2442478 ?auto_2442488 ) ) ( not ( = ?auto_2442478 ?auto_2442494 ) ) ( not ( = ?auto_2442480 ?auto_2442481 ) ) ( not ( = ?auto_2442480 ?auto_2442482 ) ) ( not ( = ?auto_2442480 ?auto_2442483 ) ) ( not ( = ?auto_2442480 ?auto_2442484 ) ) ( not ( = ?auto_2442480 ?auto_2442485 ) ) ( not ( = ?auto_2442480 ?auto_2442486 ) ) ( not ( = ?auto_2442480 ?auto_2442487 ) ) ( not ( = ?auto_2442480 ?auto_2442488 ) ) ( not ( = ?auto_2442480 ?auto_2442494 ) ) ( not ( = ?auto_2442481 ?auto_2442482 ) ) ( not ( = ?auto_2442481 ?auto_2442483 ) ) ( not ( = ?auto_2442481 ?auto_2442484 ) ) ( not ( = ?auto_2442481 ?auto_2442485 ) ) ( not ( = ?auto_2442481 ?auto_2442486 ) ) ( not ( = ?auto_2442481 ?auto_2442487 ) ) ( not ( = ?auto_2442481 ?auto_2442488 ) ) ( not ( = ?auto_2442481 ?auto_2442494 ) ) ( not ( = ?auto_2442482 ?auto_2442483 ) ) ( not ( = ?auto_2442482 ?auto_2442484 ) ) ( not ( = ?auto_2442482 ?auto_2442485 ) ) ( not ( = ?auto_2442482 ?auto_2442486 ) ) ( not ( = ?auto_2442482 ?auto_2442487 ) ) ( not ( = ?auto_2442482 ?auto_2442488 ) ) ( not ( = ?auto_2442482 ?auto_2442494 ) ) ( not ( = ?auto_2442483 ?auto_2442484 ) ) ( not ( = ?auto_2442483 ?auto_2442485 ) ) ( not ( = ?auto_2442483 ?auto_2442486 ) ) ( not ( = ?auto_2442483 ?auto_2442487 ) ) ( not ( = ?auto_2442483 ?auto_2442488 ) ) ( not ( = ?auto_2442483 ?auto_2442494 ) ) ( not ( = ?auto_2442484 ?auto_2442485 ) ) ( not ( = ?auto_2442484 ?auto_2442486 ) ) ( not ( = ?auto_2442484 ?auto_2442487 ) ) ( not ( = ?auto_2442484 ?auto_2442488 ) ) ( not ( = ?auto_2442484 ?auto_2442494 ) ) ( not ( = ?auto_2442485 ?auto_2442486 ) ) ( not ( = ?auto_2442485 ?auto_2442487 ) ) ( not ( = ?auto_2442485 ?auto_2442488 ) ) ( not ( = ?auto_2442485 ?auto_2442494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2442486 ?auto_2442487 ?auto_2442488 )
      ( MAKE-13CRATE-VERIFY ?auto_2442475 ?auto_2442476 ?auto_2442477 ?auto_2442479 ?auto_2442478 ?auto_2442480 ?auto_2442481 ?auto_2442482 ?auto_2442483 ?auto_2442484 ?auto_2442485 ?auto_2442486 ?auto_2442487 ?auto_2442488 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2442658 - SURFACE
      ?auto_2442659 - SURFACE
      ?auto_2442660 - SURFACE
      ?auto_2442662 - SURFACE
      ?auto_2442661 - SURFACE
      ?auto_2442663 - SURFACE
      ?auto_2442664 - SURFACE
      ?auto_2442665 - SURFACE
      ?auto_2442666 - SURFACE
      ?auto_2442667 - SURFACE
      ?auto_2442668 - SURFACE
      ?auto_2442669 - SURFACE
      ?auto_2442670 - SURFACE
      ?auto_2442671 - SURFACE
    )
    :vars
    (
      ?auto_2442672 - HOIST
      ?auto_2442677 - PLACE
      ?auto_2442674 - PLACE
      ?auto_2442676 - HOIST
      ?auto_2442675 - SURFACE
      ?auto_2442673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2442672 ?auto_2442677 ) ( IS-CRATE ?auto_2442671 ) ( not ( = ?auto_2442670 ?auto_2442671 ) ) ( not ( = ?auto_2442669 ?auto_2442670 ) ) ( not ( = ?auto_2442669 ?auto_2442671 ) ) ( not ( = ?auto_2442674 ?auto_2442677 ) ) ( HOIST-AT ?auto_2442676 ?auto_2442674 ) ( not ( = ?auto_2442672 ?auto_2442676 ) ) ( AVAILABLE ?auto_2442676 ) ( SURFACE-AT ?auto_2442671 ?auto_2442674 ) ( ON ?auto_2442671 ?auto_2442675 ) ( CLEAR ?auto_2442671 ) ( not ( = ?auto_2442670 ?auto_2442675 ) ) ( not ( = ?auto_2442671 ?auto_2442675 ) ) ( not ( = ?auto_2442669 ?auto_2442675 ) ) ( TRUCK-AT ?auto_2442673 ?auto_2442677 ) ( SURFACE-AT ?auto_2442669 ?auto_2442677 ) ( CLEAR ?auto_2442669 ) ( IS-CRATE ?auto_2442670 ) ( AVAILABLE ?auto_2442672 ) ( IN ?auto_2442670 ?auto_2442673 ) ( ON ?auto_2442659 ?auto_2442658 ) ( ON ?auto_2442660 ?auto_2442659 ) ( ON ?auto_2442662 ?auto_2442660 ) ( ON ?auto_2442661 ?auto_2442662 ) ( ON ?auto_2442663 ?auto_2442661 ) ( ON ?auto_2442664 ?auto_2442663 ) ( ON ?auto_2442665 ?auto_2442664 ) ( ON ?auto_2442666 ?auto_2442665 ) ( ON ?auto_2442667 ?auto_2442666 ) ( ON ?auto_2442668 ?auto_2442667 ) ( ON ?auto_2442669 ?auto_2442668 ) ( not ( = ?auto_2442658 ?auto_2442659 ) ) ( not ( = ?auto_2442658 ?auto_2442660 ) ) ( not ( = ?auto_2442658 ?auto_2442662 ) ) ( not ( = ?auto_2442658 ?auto_2442661 ) ) ( not ( = ?auto_2442658 ?auto_2442663 ) ) ( not ( = ?auto_2442658 ?auto_2442664 ) ) ( not ( = ?auto_2442658 ?auto_2442665 ) ) ( not ( = ?auto_2442658 ?auto_2442666 ) ) ( not ( = ?auto_2442658 ?auto_2442667 ) ) ( not ( = ?auto_2442658 ?auto_2442668 ) ) ( not ( = ?auto_2442658 ?auto_2442669 ) ) ( not ( = ?auto_2442658 ?auto_2442670 ) ) ( not ( = ?auto_2442658 ?auto_2442671 ) ) ( not ( = ?auto_2442658 ?auto_2442675 ) ) ( not ( = ?auto_2442659 ?auto_2442660 ) ) ( not ( = ?auto_2442659 ?auto_2442662 ) ) ( not ( = ?auto_2442659 ?auto_2442661 ) ) ( not ( = ?auto_2442659 ?auto_2442663 ) ) ( not ( = ?auto_2442659 ?auto_2442664 ) ) ( not ( = ?auto_2442659 ?auto_2442665 ) ) ( not ( = ?auto_2442659 ?auto_2442666 ) ) ( not ( = ?auto_2442659 ?auto_2442667 ) ) ( not ( = ?auto_2442659 ?auto_2442668 ) ) ( not ( = ?auto_2442659 ?auto_2442669 ) ) ( not ( = ?auto_2442659 ?auto_2442670 ) ) ( not ( = ?auto_2442659 ?auto_2442671 ) ) ( not ( = ?auto_2442659 ?auto_2442675 ) ) ( not ( = ?auto_2442660 ?auto_2442662 ) ) ( not ( = ?auto_2442660 ?auto_2442661 ) ) ( not ( = ?auto_2442660 ?auto_2442663 ) ) ( not ( = ?auto_2442660 ?auto_2442664 ) ) ( not ( = ?auto_2442660 ?auto_2442665 ) ) ( not ( = ?auto_2442660 ?auto_2442666 ) ) ( not ( = ?auto_2442660 ?auto_2442667 ) ) ( not ( = ?auto_2442660 ?auto_2442668 ) ) ( not ( = ?auto_2442660 ?auto_2442669 ) ) ( not ( = ?auto_2442660 ?auto_2442670 ) ) ( not ( = ?auto_2442660 ?auto_2442671 ) ) ( not ( = ?auto_2442660 ?auto_2442675 ) ) ( not ( = ?auto_2442662 ?auto_2442661 ) ) ( not ( = ?auto_2442662 ?auto_2442663 ) ) ( not ( = ?auto_2442662 ?auto_2442664 ) ) ( not ( = ?auto_2442662 ?auto_2442665 ) ) ( not ( = ?auto_2442662 ?auto_2442666 ) ) ( not ( = ?auto_2442662 ?auto_2442667 ) ) ( not ( = ?auto_2442662 ?auto_2442668 ) ) ( not ( = ?auto_2442662 ?auto_2442669 ) ) ( not ( = ?auto_2442662 ?auto_2442670 ) ) ( not ( = ?auto_2442662 ?auto_2442671 ) ) ( not ( = ?auto_2442662 ?auto_2442675 ) ) ( not ( = ?auto_2442661 ?auto_2442663 ) ) ( not ( = ?auto_2442661 ?auto_2442664 ) ) ( not ( = ?auto_2442661 ?auto_2442665 ) ) ( not ( = ?auto_2442661 ?auto_2442666 ) ) ( not ( = ?auto_2442661 ?auto_2442667 ) ) ( not ( = ?auto_2442661 ?auto_2442668 ) ) ( not ( = ?auto_2442661 ?auto_2442669 ) ) ( not ( = ?auto_2442661 ?auto_2442670 ) ) ( not ( = ?auto_2442661 ?auto_2442671 ) ) ( not ( = ?auto_2442661 ?auto_2442675 ) ) ( not ( = ?auto_2442663 ?auto_2442664 ) ) ( not ( = ?auto_2442663 ?auto_2442665 ) ) ( not ( = ?auto_2442663 ?auto_2442666 ) ) ( not ( = ?auto_2442663 ?auto_2442667 ) ) ( not ( = ?auto_2442663 ?auto_2442668 ) ) ( not ( = ?auto_2442663 ?auto_2442669 ) ) ( not ( = ?auto_2442663 ?auto_2442670 ) ) ( not ( = ?auto_2442663 ?auto_2442671 ) ) ( not ( = ?auto_2442663 ?auto_2442675 ) ) ( not ( = ?auto_2442664 ?auto_2442665 ) ) ( not ( = ?auto_2442664 ?auto_2442666 ) ) ( not ( = ?auto_2442664 ?auto_2442667 ) ) ( not ( = ?auto_2442664 ?auto_2442668 ) ) ( not ( = ?auto_2442664 ?auto_2442669 ) ) ( not ( = ?auto_2442664 ?auto_2442670 ) ) ( not ( = ?auto_2442664 ?auto_2442671 ) ) ( not ( = ?auto_2442664 ?auto_2442675 ) ) ( not ( = ?auto_2442665 ?auto_2442666 ) ) ( not ( = ?auto_2442665 ?auto_2442667 ) ) ( not ( = ?auto_2442665 ?auto_2442668 ) ) ( not ( = ?auto_2442665 ?auto_2442669 ) ) ( not ( = ?auto_2442665 ?auto_2442670 ) ) ( not ( = ?auto_2442665 ?auto_2442671 ) ) ( not ( = ?auto_2442665 ?auto_2442675 ) ) ( not ( = ?auto_2442666 ?auto_2442667 ) ) ( not ( = ?auto_2442666 ?auto_2442668 ) ) ( not ( = ?auto_2442666 ?auto_2442669 ) ) ( not ( = ?auto_2442666 ?auto_2442670 ) ) ( not ( = ?auto_2442666 ?auto_2442671 ) ) ( not ( = ?auto_2442666 ?auto_2442675 ) ) ( not ( = ?auto_2442667 ?auto_2442668 ) ) ( not ( = ?auto_2442667 ?auto_2442669 ) ) ( not ( = ?auto_2442667 ?auto_2442670 ) ) ( not ( = ?auto_2442667 ?auto_2442671 ) ) ( not ( = ?auto_2442667 ?auto_2442675 ) ) ( not ( = ?auto_2442668 ?auto_2442669 ) ) ( not ( = ?auto_2442668 ?auto_2442670 ) ) ( not ( = ?auto_2442668 ?auto_2442671 ) ) ( not ( = ?auto_2442668 ?auto_2442675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2442669 ?auto_2442670 ?auto_2442671 )
      ( MAKE-13CRATE-VERIFY ?auto_2442658 ?auto_2442659 ?auto_2442660 ?auto_2442662 ?auto_2442661 ?auto_2442663 ?auto_2442664 ?auto_2442665 ?auto_2442666 ?auto_2442667 ?auto_2442668 ?auto_2442669 ?auto_2442670 ?auto_2442671 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2456899 - SURFACE
      ?auto_2456900 - SURFACE
      ?auto_2456901 - SURFACE
      ?auto_2456903 - SURFACE
      ?auto_2456902 - SURFACE
      ?auto_2456904 - SURFACE
      ?auto_2456905 - SURFACE
      ?auto_2456906 - SURFACE
      ?auto_2456907 - SURFACE
      ?auto_2456908 - SURFACE
      ?auto_2456909 - SURFACE
      ?auto_2456910 - SURFACE
      ?auto_2456911 - SURFACE
      ?auto_2456912 - SURFACE
      ?auto_2456913 - SURFACE
    )
    :vars
    (
      ?auto_2456915 - HOIST
      ?auto_2456914 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2456915 ?auto_2456914 ) ( SURFACE-AT ?auto_2456912 ?auto_2456914 ) ( CLEAR ?auto_2456912 ) ( LIFTING ?auto_2456915 ?auto_2456913 ) ( IS-CRATE ?auto_2456913 ) ( not ( = ?auto_2456912 ?auto_2456913 ) ) ( ON ?auto_2456900 ?auto_2456899 ) ( ON ?auto_2456901 ?auto_2456900 ) ( ON ?auto_2456903 ?auto_2456901 ) ( ON ?auto_2456902 ?auto_2456903 ) ( ON ?auto_2456904 ?auto_2456902 ) ( ON ?auto_2456905 ?auto_2456904 ) ( ON ?auto_2456906 ?auto_2456905 ) ( ON ?auto_2456907 ?auto_2456906 ) ( ON ?auto_2456908 ?auto_2456907 ) ( ON ?auto_2456909 ?auto_2456908 ) ( ON ?auto_2456910 ?auto_2456909 ) ( ON ?auto_2456911 ?auto_2456910 ) ( ON ?auto_2456912 ?auto_2456911 ) ( not ( = ?auto_2456899 ?auto_2456900 ) ) ( not ( = ?auto_2456899 ?auto_2456901 ) ) ( not ( = ?auto_2456899 ?auto_2456903 ) ) ( not ( = ?auto_2456899 ?auto_2456902 ) ) ( not ( = ?auto_2456899 ?auto_2456904 ) ) ( not ( = ?auto_2456899 ?auto_2456905 ) ) ( not ( = ?auto_2456899 ?auto_2456906 ) ) ( not ( = ?auto_2456899 ?auto_2456907 ) ) ( not ( = ?auto_2456899 ?auto_2456908 ) ) ( not ( = ?auto_2456899 ?auto_2456909 ) ) ( not ( = ?auto_2456899 ?auto_2456910 ) ) ( not ( = ?auto_2456899 ?auto_2456911 ) ) ( not ( = ?auto_2456899 ?auto_2456912 ) ) ( not ( = ?auto_2456899 ?auto_2456913 ) ) ( not ( = ?auto_2456900 ?auto_2456901 ) ) ( not ( = ?auto_2456900 ?auto_2456903 ) ) ( not ( = ?auto_2456900 ?auto_2456902 ) ) ( not ( = ?auto_2456900 ?auto_2456904 ) ) ( not ( = ?auto_2456900 ?auto_2456905 ) ) ( not ( = ?auto_2456900 ?auto_2456906 ) ) ( not ( = ?auto_2456900 ?auto_2456907 ) ) ( not ( = ?auto_2456900 ?auto_2456908 ) ) ( not ( = ?auto_2456900 ?auto_2456909 ) ) ( not ( = ?auto_2456900 ?auto_2456910 ) ) ( not ( = ?auto_2456900 ?auto_2456911 ) ) ( not ( = ?auto_2456900 ?auto_2456912 ) ) ( not ( = ?auto_2456900 ?auto_2456913 ) ) ( not ( = ?auto_2456901 ?auto_2456903 ) ) ( not ( = ?auto_2456901 ?auto_2456902 ) ) ( not ( = ?auto_2456901 ?auto_2456904 ) ) ( not ( = ?auto_2456901 ?auto_2456905 ) ) ( not ( = ?auto_2456901 ?auto_2456906 ) ) ( not ( = ?auto_2456901 ?auto_2456907 ) ) ( not ( = ?auto_2456901 ?auto_2456908 ) ) ( not ( = ?auto_2456901 ?auto_2456909 ) ) ( not ( = ?auto_2456901 ?auto_2456910 ) ) ( not ( = ?auto_2456901 ?auto_2456911 ) ) ( not ( = ?auto_2456901 ?auto_2456912 ) ) ( not ( = ?auto_2456901 ?auto_2456913 ) ) ( not ( = ?auto_2456903 ?auto_2456902 ) ) ( not ( = ?auto_2456903 ?auto_2456904 ) ) ( not ( = ?auto_2456903 ?auto_2456905 ) ) ( not ( = ?auto_2456903 ?auto_2456906 ) ) ( not ( = ?auto_2456903 ?auto_2456907 ) ) ( not ( = ?auto_2456903 ?auto_2456908 ) ) ( not ( = ?auto_2456903 ?auto_2456909 ) ) ( not ( = ?auto_2456903 ?auto_2456910 ) ) ( not ( = ?auto_2456903 ?auto_2456911 ) ) ( not ( = ?auto_2456903 ?auto_2456912 ) ) ( not ( = ?auto_2456903 ?auto_2456913 ) ) ( not ( = ?auto_2456902 ?auto_2456904 ) ) ( not ( = ?auto_2456902 ?auto_2456905 ) ) ( not ( = ?auto_2456902 ?auto_2456906 ) ) ( not ( = ?auto_2456902 ?auto_2456907 ) ) ( not ( = ?auto_2456902 ?auto_2456908 ) ) ( not ( = ?auto_2456902 ?auto_2456909 ) ) ( not ( = ?auto_2456902 ?auto_2456910 ) ) ( not ( = ?auto_2456902 ?auto_2456911 ) ) ( not ( = ?auto_2456902 ?auto_2456912 ) ) ( not ( = ?auto_2456902 ?auto_2456913 ) ) ( not ( = ?auto_2456904 ?auto_2456905 ) ) ( not ( = ?auto_2456904 ?auto_2456906 ) ) ( not ( = ?auto_2456904 ?auto_2456907 ) ) ( not ( = ?auto_2456904 ?auto_2456908 ) ) ( not ( = ?auto_2456904 ?auto_2456909 ) ) ( not ( = ?auto_2456904 ?auto_2456910 ) ) ( not ( = ?auto_2456904 ?auto_2456911 ) ) ( not ( = ?auto_2456904 ?auto_2456912 ) ) ( not ( = ?auto_2456904 ?auto_2456913 ) ) ( not ( = ?auto_2456905 ?auto_2456906 ) ) ( not ( = ?auto_2456905 ?auto_2456907 ) ) ( not ( = ?auto_2456905 ?auto_2456908 ) ) ( not ( = ?auto_2456905 ?auto_2456909 ) ) ( not ( = ?auto_2456905 ?auto_2456910 ) ) ( not ( = ?auto_2456905 ?auto_2456911 ) ) ( not ( = ?auto_2456905 ?auto_2456912 ) ) ( not ( = ?auto_2456905 ?auto_2456913 ) ) ( not ( = ?auto_2456906 ?auto_2456907 ) ) ( not ( = ?auto_2456906 ?auto_2456908 ) ) ( not ( = ?auto_2456906 ?auto_2456909 ) ) ( not ( = ?auto_2456906 ?auto_2456910 ) ) ( not ( = ?auto_2456906 ?auto_2456911 ) ) ( not ( = ?auto_2456906 ?auto_2456912 ) ) ( not ( = ?auto_2456906 ?auto_2456913 ) ) ( not ( = ?auto_2456907 ?auto_2456908 ) ) ( not ( = ?auto_2456907 ?auto_2456909 ) ) ( not ( = ?auto_2456907 ?auto_2456910 ) ) ( not ( = ?auto_2456907 ?auto_2456911 ) ) ( not ( = ?auto_2456907 ?auto_2456912 ) ) ( not ( = ?auto_2456907 ?auto_2456913 ) ) ( not ( = ?auto_2456908 ?auto_2456909 ) ) ( not ( = ?auto_2456908 ?auto_2456910 ) ) ( not ( = ?auto_2456908 ?auto_2456911 ) ) ( not ( = ?auto_2456908 ?auto_2456912 ) ) ( not ( = ?auto_2456908 ?auto_2456913 ) ) ( not ( = ?auto_2456909 ?auto_2456910 ) ) ( not ( = ?auto_2456909 ?auto_2456911 ) ) ( not ( = ?auto_2456909 ?auto_2456912 ) ) ( not ( = ?auto_2456909 ?auto_2456913 ) ) ( not ( = ?auto_2456910 ?auto_2456911 ) ) ( not ( = ?auto_2456910 ?auto_2456912 ) ) ( not ( = ?auto_2456910 ?auto_2456913 ) ) ( not ( = ?auto_2456911 ?auto_2456912 ) ) ( not ( = ?auto_2456911 ?auto_2456913 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2456912 ?auto_2456913 )
      ( MAKE-14CRATE-VERIFY ?auto_2456899 ?auto_2456900 ?auto_2456901 ?auto_2456903 ?auto_2456902 ?auto_2456904 ?auto_2456905 ?auto_2456906 ?auto_2456907 ?auto_2456908 ?auto_2456909 ?auto_2456910 ?auto_2456911 ?auto_2456912 ?auto_2456913 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2457059 - SURFACE
      ?auto_2457060 - SURFACE
      ?auto_2457061 - SURFACE
      ?auto_2457063 - SURFACE
      ?auto_2457062 - SURFACE
      ?auto_2457064 - SURFACE
      ?auto_2457065 - SURFACE
      ?auto_2457066 - SURFACE
      ?auto_2457067 - SURFACE
      ?auto_2457068 - SURFACE
      ?auto_2457069 - SURFACE
      ?auto_2457070 - SURFACE
      ?auto_2457071 - SURFACE
      ?auto_2457072 - SURFACE
      ?auto_2457073 - SURFACE
    )
    :vars
    (
      ?auto_2457075 - HOIST
      ?auto_2457074 - PLACE
      ?auto_2457076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2457075 ?auto_2457074 ) ( SURFACE-AT ?auto_2457072 ?auto_2457074 ) ( CLEAR ?auto_2457072 ) ( IS-CRATE ?auto_2457073 ) ( not ( = ?auto_2457072 ?auto_2457073 ) ) ( TRUCK-AT ?auto_2457076 ?auto_2457074 ) ( AVAILABLE ?auto_2457075 ) ( IN ?auto_2457073 ?auto_2457076 ) ( ON ?auto_2457072 ?auto_2457071 ) ( not ( = ?auto_2457071 ?auto_2457072 ) ) ( not ( = ?auto_2457071 ?auto_2457073 ) ) ( ON ?auto_2457060 ?auto_2457059 ) ( ON ?auto_2457061 ?auto_2457060 ) ( ON ?auto_2457063 ?auto_2457061 ) ( ON ?auto_2457062 ?auto_2457063 ) ( ON ?auto_2457064 ?auto_2457062 ) ( ON ?auto_2457065 ?auto_2457064 ) ( ON ?auto_2457066 ?auto_2457065 ) ( ON ?auto_2457067 ?auto_2457066 ) ( ON ?auto_2457068 ?auto_2457067 ) ( ON ?auto_2457069 ?auto_2457068 ) ( ON ?auto_2457070 ?auto_2457069 ) ( ON ?auto_2457071 ?auto_2457070 ) ( not ( = ?auto_2457059 ?auto_2457060 ) ) ( not ( = ?auto_2457059 ?auto_2457061 ) ) ( not ( = ?auto_2457059 ?auto_2457063 ) ) ( not ( = ?auto_2457059 ?auto_2457062 ) ) ( not ( = ?auto_2457059 ?auto_2457064 ) ) ( not ( = ?auto_2457059 ?auto_2457065 ) ) ( not ( = ?auto_2457059 ?auto_2457066 ) ) ( not ( = ?auto_2457059 ?auto_2457067 ) ) ( not ( = ?auto_2457059 ?auto_2457068 ) ) ( not ( = ?auto_2457059 ?auto_2457069 ) ) ( not ( = ?auto_2457059 ?auto_2457070 ) ) ( not ( = ?auto_2457059 ?auto_2457071 ) ) ( not ( = ?auto_2457059 ?auto_2457072 ) ) ( not ( = ?auto_2457059 ?auto_2457073 ) ) ( not ( = ?auto_2457060 ?auto_2457061 ) ) ( not ( = ?auto_2457060 ?auto_2457063 ) ) ( not ( = ?auto_2457060 ?auto_2457062 ) ) ( not ( = ?auto_2457060 ?auto_2457064 ) ) ( not ( = ?auto_2457060 ?auto_2457065 ) ) ( not ( = ?auto_2457060 ?auto_2457066 ) ) ( not ( = ?auto_2457060 ?auto_2457067 ) ) ( not ( = ?auto_2457060 ?auto_2457068 ) ) ( not ( = ?auto_2457060 ?auto_2457069 ) ) ( not ( = ?auto_2457060 ?auto_2457070 ) ) ( not ( = ?auto_2457060 ?auto_2457071 ) ) ( not ( = ?auto_2457060 ?auto_2457072 ) ) ( not ( = ?auto_2457060 ?auto_2457073 ) ) ( not ( = ?auto_2457061 ?auto_2457063 ) ) ( not ( = ?auto_2457061 ?auto_2457062 ) ) ( not ( = ?auto_2457061 ?auto_2457064 ) ) ( not ( = ?auto_2457061 ?auto_2457065 ) ) ( not ( = ?auto_2457061 ?auto_2457066 ) ) ( not ( = ?auto_2457061 ?auto_2457067 ) ) ( not ( = ?auto_2457061 ?auto_2457068 ) ) ( not ( = ?auto_2457061 ?auto_2457069 ) ) ( not ( = ?auto_2457061 ?auto_2457070 ) ) ( not ( = ?auto_2457061 ?auto_2457071 ) ) ( not ( = ?auto_2457061 ?auto_2457072 ) ) ( not ( = ?auto_2457061 ?auto_2457073 ) ) ( not ( = ?auto_2457063 ?auto_2457062 ) ) ( not ( = ?auto_2457063 ?auto_2457064 ) ) ( not ( = ?auto_2457063 ?auto_2457065 ) ) ( not ( = ?auto_2457063 ?auto_2457066 ) ) ( not ( = ?auto_2457063 ?auto_2457067 ) ) ( not ( = ?auto_2457063 ?auto_2457068 ) ) ( not ( = ?auto_2457063 ?auto_2457069 ) ) ( not ( = ?auto_2457063 ?auto_2457070 ) ) ( not ( = ?auto_2457063 ?auto_2457071 ) ) ( not ( = ?auto_2457063 ?auto_2457072 ) ) ( not ( = ?auto_2457063 ?auto_2457073 ) ) ( not ( = ?auto_2457062 ?auto_2457064 ) ) ( not ( = ?auto_2457062 ?auto_2457065 ) ) ( not ( = ?auto_2457062 ?auto_2457066 ) ) ( not ( = ?auto_2457062 ?auto_2457067 ) ) ( not ( = ?auto_2457062 ?auto_2457068 ) ) ( not ( = ?auto_2457062 ?auto_2457069 ) ) ( not ( = ?auto_2457062 ?auto_2457070 ) ) ( not ( = ?auto_2457062 ?auto_2457071 ) ) ( not ( = ?auto_2457062 ?auto_2457072 ) ) ( not ( = ?auto_2457062 ?auto_2457073 ) ) ( not ( = ?auto_2457064 ?auto_2457065 ) ) ( not ( = ?auto_2457064 ?auto_2457066 ) ) ( not ( = ?auto_2457064 ?auto_2457067 ) ) ( not ( = ?auto_2457064 ?auto_2457068 ) ) ( not ( = ?auto_2457064 ?auto_2457069 ) ) ( not ( = ?auto_2457064 ?auto_2457070 ) ) ( not ( = ?auto_2457064 ?auto_2457071 ) ) ( not ( = ?auto_2457064 ?auto_2457072 ) ) ( not ( = ?auto_2457064 ?auto_2457073 ) ) ( not ( = ?auto_2457065 ?auto_2457066 ) ) ( not ( = ?auto_2457065 ?auto_2457067 ) ) ( not ( = ?auto_2457065 ?auto_2457068 ) ) ( not ( = ?auto_2457065 ?auto_2457069 ) ) ( not ( = ?auto_2457065 ?auto_2457070 ) ) ( not ( = ?auto_2457065 ?auto_2457071 ) ) ( not ( = ?auto_2457065 ?auto_2457072 ) ) ( not ( = ?auto_2457065 ?auto_2457073 ) ) ( not ( = ?auto_2457066 ?auto_2457067 ) ) ( not ( = ?auto_2457066 ?auto_2457068 ) ) ( not ( = ?auto_2457066 ?auto_2457069 ) ) ( not ( = ?auto_2457066 ?auto_2457070 ) ) ( not ( = ?auto_2457066 ?auto_2457071 ) ) ( not ( = ?auto_2457066 ?auto_2457072 ) ) ( not ( = ?auto_2457066 ?auto_2457073 ) ) ( not ( = ?auto_2457067 ?auto_2457068 ) ) ( not ( = ?auto_2457067 ?auto_2457069 ) ) ( not ( = ?auto_2457067 ?auto_2457070 ) ) ( not ( = ?auto_2457067 ?auto_2457071 ) ) ( not ( = ?auto_2457067 ?auto_2457072 ) ) ( not ( = ?auto_2457067 ?auto_2457073 ) ) ( not ( = ?auto_2457068 ?auto_2457069 ) ) ( not ( = ?auto_2457068 ?auto_2457070 ) ) ( not ( = ?auto_2457068 ?auto_2457071 ) ) ( not ( = ?auto_2457068 ?auto_2457072 ) ) ( not ( = ?auto_2457068 ?auto_2457073 ) ) ( not ( = ?auto_2457069 ?auto_2457070 ) ) ( not ( = ?auto_2457069 ?auto_2457071 ) ) ( not ( = ?auto_2457069 ?auto_2457072 ) ) ( not ( = ?auto_2457069 ?auto_2457073 ) ) ( not ( = ?auto_2457070 ?auto_2457071 ) ) ( not ( = ?auto_2457070 ?auto_2457072 ) ) ( not ( = ?auto_2457070 ?auto_2457073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2457071 ?auto_2457072 ?auto_2457073 )
      ( MAKE-14CRATE-VERIFY ?auto_2457059 ?auto_2457060 ?auto_2457061 ?auto_2457063 ?auto_2457062 ?auto_2457064 ?auto_2457065 ?auto_2457066 ?auto_2457067 ?auto_2457068 ?auto_2457069 ?auto_2457070 ?auto_2457071 ?auto_2457072 ?auto_2457073 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2457234 - SURFACE
      ?auto_2457235 - SURFACE
      ?auto_2457236 - SURFACE
      ?auto_2457238 - SURFACE
      ?auto_2457237 - SURFACE
      ?auto_2457239 - SURFACE
      ?auto_2457240 - SURFACE
      ?auto_2457241 - SURFACE
      ?auto_2457242 - SURFACE
      ?auto_2457243 - SURFACE
      ?auto_2457244 - SURFACE
      ?auto_2457245 - SURFACE
      ?auto_2457246 - SURFACE
      ?auto_2457247 - SURFACE
      ?auto_2457248 - SURFACE
    )
    :vars
    (
      ?auto_2457252 - HOIST
      ?auto_2457249 - PLACE
      ?auto_2457251 - TRUCK
      ?auto_2457250 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2457252 ?auto_2457249 ) ( SURFACE-AT ?auto_2457247 ?auto_2457249 ) ( CLEAR ?auto_2457247 ) ( IS-CRATE ?auto_2457248 ) ( not ( = ?auto_2457247 ?auto_2457248 ) ) ( AVAILABLE ?auto_2457252 ) ( IN ?auto_2457248 ?auto_2457251 ) ( ON ?auto_2457247 ?auto_2457246 ) ( not ( = ?auto_2457246 ?auto_2457247 ) ) ( not ( = ?auto_2457246 ?auto_2457248 ) ) ( TRUCK-AT ?auto_2457251 ?auto_2457250 ) ( not ( = ?auto_2457250 ?auto_2457249 ) ) ( ON ?auto_2457235 ?auto_2457234 ) ( ON ?auto_2457236 ?auto_2457235 ) ( ON ?auto_2457238 ?auto_2457236 ) ( ON ?auto_2457237 ?auto_2457238 ) ( ON ?auto_2457239 ?auto_2457237 ) ( ON ?auto_2457240 ?auto_2457239 ) ( ON ?auto_2457241 ?auto_2457240 ) ( ON ?auto_2457242 ?auto_2457241 ) ( ON ?auto_2457243 ?auto_2457242 ) ( ON ?auto_2457244 ?auto_2457243 ) ( ON ?auto_2457245 ?auto_2457244 ) ( ON ?auto_2457246 ?auto_2457245 ) ( not ( = ?auto_2457234 ?auto_2457235 ) ) ( not ( = ?auto_2457234 ?auto_2457236 ) ) ( not ( = ?auto_2457234 ?auto_2457238 ) ) ( not ( = ?auto_2457234 ?auto_2457237 ) ) ( not ( = ?auto_2457234 ?auto_2457239 ) ) ( not ( = ?auto_2457234 ?auto_2457240 ) ) ( not ( = ?auto_2457234 ?auto_2457241 ) ) ( not ( = ?auto_2457234 ?auto_2457242 ) ) ( not ( = ?auto_2457234 ?auto_2457243 ) ) ( not ( = ?auto_2457234 ?auto_2457244 ) ) ( not ( = ?auto_2457234 ?auto_2457245 ) ) ( not ( = ?auto_2457234 ?auto_2457246 ) ) ( not ( = ?auto_2457234 ?auto_2457247 ) ) ( not ( = ?auto_2457234 ?auto_2457248 ) ) ( not ( = ?auto_2457235 ?auto_2457236 ) ) ( not ( = ?auto_2457235 ?auto_2457238 ) ) ( not ( = ?auto_2457235 ?auto_2457237 ) ) ( not ( = ?auto_2457235 ?auto_2457239 ) ) ( not ( = ?auto_2457235 ?auto_2457240 ) ) ( not ( = ?auto_2457235 ?auto_2457241 ) ) ( not ( = ?auto_2457235 ?auto_2457242 ) ) ( not ( = ?auto_2457235 ?auto_2457243 ) ) ( not ( = ?auto_2457235 ?auto_2457244 ) ) ( not ( = ?auto_2457235 ?auto_2457245 ) ) ( not ( = ?auto_2457235 ?auto_2457246 ) ) ( not ( = ?auto_2457235 ?auto_2457247 ) ) ( not ( = ?auto_2457235 ?auto_2457248 ) ) ( not ( = ?auto_2457236 ?auto_2457238 ) ) ( not ( = ?auto_2457236 ?auto_2457237 ) ) ( not ( = ?auto_2457236 ?auto_2457239 ) ) ( not ( = ?auto_2457236 ?auto_2457240 ) ) ( not ( = ?auto_2457236 ?auto_2457241 ) ) ( not ( = ?auto_2457236 ?auto_2457242 ) ) ( not ( = ?auto_2457236 ?auto_2457243 ) ) ( not ( = ?auto_2457236 ?auto_2457244 ) ) ( not ( = ?auto_2457236 ?auto_2457245 ) ) ( not ( = ?auto_2457236 ?auto_2457246 ) ) ( not ( = ?auto_2457236 ?auto_2457247 ) ) ( not ( = ?auto_2457236 ?auto_2457248 ) ) ( not ( = ?auto_2457238 ?auto_2457237 ) ) ( not ( = ?auto_2457238 ?auto_2457239 ) ) ( not ( = ?auto_2457238 ?auto_2457240 ) ) ( not ( = ?auto_2457238 ?auto_2457241 ) ) ( not ( = ?auto_2457238 ?auto_2457242 ) ) ( not ( = ?auto_2457238 ?auto_2457243 ) ) ( not ( = ?auto_2457238 ?auto_2457244 ) ) ( not ( = ?auto_2457238 ?auto_2457245 ) ) ( not ( = ?auto_2457238 ?auto_2457246 ) ) ( not ( = ?auto_2457238 ?auto_2457247 ) ) ( not ( = ?auto_2457238 ?auto_2457248 ) ) ( not ( = ?auto_2457237 ?auto_2457239 ) ) ( not ( = ?auto_2457237 ?auto_2457240 ) ) ( not ( = ?auto_2457237 ?auto_2457241 ) ) ( not ( = ?auto_2457237 ?auto_2457242 ) ) ( not ( = ?auto_2457237 ?auto_2457243 ) ) ( not ( = ?auto_2457237 ?auto_2457244 ) ) ( not ( = ?auto_2457237 ?auto_2457245 ) ) ( not ( = ?auto_2457237 ?auto_2457246 ) ) ( not ( = ?auto_2457237 ?auto_2457247 ) ) ( not ( = ?auto_2457237 ?auto_2457248 ) ) ( not ( = ?auto_2457239 ?auto_2457240 ) ) ( not ( = ?auto_2457239 ?auto_2457241 ) ) ( not ( = ?auto_2457239 ?auto_2457242 ) ) ( not ( = ?auto_2457239 ?auto_2457243 ) ) ( not ( = ?auto_2457239 ?auto_2457244 ) ) ( not ( = ?auto_2457239 ?auto_2457245 ) ) ( not ( = ?auto_2457239 ?auto_2457246 ) ) ( not ( = ?auto_2457239 ?auto_2457247 ) ) ( not ( = ?auto_2457239 ?auto_2457248 ) ) ( not ( = ?auto_2457240 ?auto_2457241 ) ) ( not ( = ?auto_2457240 ?auto_2457242 ) ) ( not ( = ?auto_2457240 ?auto_2457243 ) ) ( not ( = ?auto_2457240 ?auto_2457244 ) ) ( not ( = ?auto_2457240 ?auto_2457245 ) ) ( not ( = ?auto_2457240 ?auto_2457246 ) ) ( not ( = ?auto_2457240 ?auto_2457247 ) ) ( not ( = ?auto_2457240 ?auto_2457248 ) ) ( not ( = ?auto_2457241 ?auto_2457242 ) ) ( not ( = ?auto_2457241 ?auto_2457243 ) ) ( not ( = ?auto_2457241 ?auto_2457244 ) ) ( not ( = ?auto_2457241 ?auto_2457245 ) ) ( not ( = ?auto_2457241 ?auto_2457246 ) ) ( not ( = ?auto_2457241 ?auto_2457247 ) ) ( not ( = ?auto_2457241 ?auto_2457248 ) ) ( not ( = ?auto_2457242 ?auto_2457243 ) ) ( not ( = ?auto_2457242 ?auto_2457244 ) ) ( not ( = ?auto_2457242 ?auto_2457245 ) ) ( not ( = ?auto_2457242 ?auto_2457246 ) ) ( not ( = ?auto_2457242 ?auto_2457247 ) ) ( not ( = ?auto_2457242 ?auto_2457248 ) ) ( not ( = ?auto_2457243 ?auto_2457244 ) ) ( not ( = ?auto_2457243 ?auto_2457245 ) ) ( not ( = ?auto_2457243 ?auto_2457246 ) ) ( not ( = ?auto_2457243 ?auto_2457247 ) ) ( not ( = ?auto_2457243 ?auto_2457248 ) ) ( not ( = ?auto_2457244 ?auto_2457245 ) ) ( not ( = ?auto_2457244 ?auto_2457246 ) ) ( not ( = ?auto_2457244 ?auto_2457247 ) ) ( not ( = ?auto_2457244 ?auto_2457248 ) ) ( not ( = ?auto_2457245 ?auto_2457246 ) ) ( not ( = ?auto_2457245 ?auto_2457247 ) ) ( not ( = ?auto_2457245 ?auto_2457248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2457246 ?auto_2457247 ?auto_2457248 )
      ( MAKE-14CRATE-VERIFY ?auto_2457234 ?auto_2457235 ?auto_2457236 ?auto_2457238 ?auto_2457237 ?auto_2457239 ?auto_2457240 ?auto_2457241 ?auto_2457242 ?auto_2457243 ?auto_2457244 ?auto_2457245 ?auto_2457246 ?auto_2457247 ?auto_2457248 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2457423 - SURFACE
      ?auto_2457424 - SURFACE
      ?auto_2457425 - SURFACE
      ?auto_2457427 - SURFACE
      ?auto_2457426 - SURFACE
      ?auto_2457428 - SURFACE
      ?auto_2457429 - SURFACE
      ?auto_2457430 - SURFACE
      ?auto_2457431 - SURFACE
      ?auto_2457432 - SURFACE
      ?auto_2457433 - SURFACE
      ?auto_2457434 - SURFACE
      ?auto_2457435 - SURFACE
      ?auto_2457436 - SURFACE
      ?auto_2457437 - SURFACE
    )
    :vars
    (
      ?auto_2457441 - HOIST
      ?auto_2457442 - PLACE
      ?auto_2457440 - TRUCK
      ?auto_2457438 - PLACE
      ?auto_2457439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2457441 ?auto_2457442 ) ( SURFACE-AT ?auto_2457436 ?auto_2457442 ) ( CLEAR ?auto_2457436 ) ( IS-CRATE ?auto_2457437 ) ( not ( = ?auto_2457436 ?auto_2457437 ) ) ( AVAILABLE ?auto_2457441 ) ( ON ?auto_2457436 ?auto_2457435 ) ( not ( = ?auto_2457435 ?auto_2457436 ) ) ( not ( = ?auto_2457435 ?auto_2457437 ) ) ( TRUCK-AT ?auto_2457440 ?auto_2457438 ) ( not ( = ?auto_2457438 ?auto_2457442 ) ) ( HOIST-AT ?auto_2457439 ?auto_2457438 ) ( LIFTING ?auto_2457439 ?auto_2457437 ) ( not ( = ?auto_2457441 ?auto_2457439 ) ) ( ON ?auto_2457424 ?auto_2457423 ) ( ON ?auto_2457425 ?auto_2457424 ) ( ON ?auto_2457427 ?auto_2457425 ) ( ON ?auto_2457426 ?auto_2457427 ) ( ON ?auto_2457428 ?auto_2457426 ) ( ON ?auto_2457429 ?auto_2457428 ) ( ON ?auto_2457430 ?auto_2457429 ) ( ON ?auto_2457431 ?auto_2457430 ) ( ON ?auto_2457432 ?auto_2457431 ) ( ON ?auto_2457433 ?auto_2457432 ) ( ON ?auto_2457434 ?auto_2457433 ) ( ON ?auto_2457435 ?auto_2457434 ) ( not ( = ?auto_2457423 ?auto_2457424 ) ) ( not ( = ?auto_2457423 ?auto_2457425 ) ) ( not ( = ?auto_2457423 ?auto_2457427 ) ) ( not ( = ?auto_2457423 ?auto_2457426 ) ) ( not ( = ?auto_2457423 ?auto_2457428 ) ) ( not ( = ?auto_2457423 ?auto_2457429 ) ) ( not ( = ?auto_2457423 ?auto_2457430 ) ) ( not ( = ?auto_2457423 ?auto_2457431 ) ) ( not ( = ?auto_2457423 ?auto_2457432 ) ) ( not ( = ?auto_2457423 ?auto_2457433 ) ) ( not ( = ?auto_2457423 ?auto_2457434 ) ) ( not ( = ?auto_2457423 ?auto_2457435 ) ) ( not ( = ?auto_2457423 ?auto_2457436 ) ) ( not ( = ?auto_2457423 ?auto_2457437 ) ) ( not ( = ?auto_2457424 ?auto_2457425 ) ) ( not ( = ?auto_2457424 ?auto_2457427 ) ) ( not ( = ?auto_2457424 ?auto_2457426 ) ) ( not ( = ?auto_2457424 ?auto_2457428 ) ) ( not ( = ?auto_2457424 ?auto_2457429 ) ) ( not ( = ?auto_2457424 ?auto_2457430 ) ) ( not ( = ?auto_2457424 ?auto_2457431 ) ) ( not ( = ?auto_2457424 ?auto_2457432 ) ) ( not ( = ?auto_2457424 ?auto_2457433 ) ) ( not ( = ?auto_2457424 ?auto_2457434 ) ) ( not ( = ?auto_2457424 ?auto_2457435 ) ) ( not ( = ?auto_2457424 ?auto_2457436 ) ) ( not ( = ?auto_2457424 ?auto_2457437 ) ) ( not ( = ?auto_2457425 ?auto_2457427 ) ) ( not ( = ?auto_2457425 ?auto_2457426 ) ) ( not ( = ?auto_2457425 ?auto_2457428 ) ) ( not ( = ?auto_2457425 ?auto_2457429 ) ) ( not ( = ?auto_2457425 ?auto_2457430 ) ) ( not ( = ?auto_2457425 ?auto_2457431 ) ) ( not ( = ?auto_2457425 ?auto_2457432 ) ) ( not ( = ?auto_2457425 ?auto_2457433 ) ) ( not ( = ?auto_2457425 ?auto_2457434 ) ) ( not ( = ?auto_2457425 ?auto_2457435 ) ) ( not ( = ?auto_2457425 ?auto_2457436 ) ) ( not ( = ?auto_2457425 ?auto_2457437 ) ) ( not ( = ?auto_2457427 ?auto_2457426 ) ) ( not ( = ?auto_2457427 ?auto_2457428 ) ) ( not ( = ?auto_2457427 ?auto_2457429 ) ) ( not ( = ?auto_2457427 ?auto_2457430 ) ) ( not ( = ?auto_2457427 ?auto_2457431 ) ) ( not ( = ?auto_2457427 ?auto_2457432 ) ) ( not ( = ?auto_2457427 ?auto_2457433 ) ) ( not ( = ?auto_2457427 ?auto_2457434 ) ) ( not ( = ?auto_2457427 ?auto_2457435 ) ) ( not ( = ?auto_2457427 ?auto_2457436 ) ) ( not ( = ?auto_2457427 ?auto_2457437 ) ) ( not ( = ?auto_2457426 ?auto_2457428 ) ) ( not ( = ?auto_2457426 ?auto_2457429 ) ) ( not ( = ?auto_2457426 ?auto_2457430 ) ) ( not ( = ?auto_2457426 ?auto_2457431 ) ) ( not ( = ?auto_2457426 ?auto_2457432 ) ) ( not ( = ?auto_2457426 ?auto_2457433 ) ) ( not ( = ?auto_2457426 ?auto_2457434 ) ) ( not ( = ?auto_2457426 ?auto_2457435 ) ) ( not ( = ?auto_2457426 ?auto_2457436 ) ) ( not ( = ?auto_2457426 ?auto_2457437 ) ) ( not ( = ?auto_2457428 ?auto_2457429 ) ) ( not ( = ?auto_2457428 ?auto_2457430 ) ) ( not ( = ?auto_2457428 ?auto_2457431 ) ) ( not ( = ?auto_2457428 ?auto_2457432 ) ) ( not ( = ?auto_2457428 ?auto_2457433 ) ) ( not ( = ?auto_2457428 ?auto_2457434 ) ) ( not ( = ?auto_2457428 ?auto_2457435 ) ) ( not ( = ?auto_2457428 ?auto_2457436 ) ) ( not ( = ?auto_2457428 ?auto_2457437 ) ) ( not ( = ?auto_2457429 ?auto_2457430 ) ) ( not ( = ?auto_2457429 ?auto_2457431 ) ) ( not ( = ?auto_2457429 ?auto_2457432 ) ) ( not ( = ?auto_2457429 ?auto_2457433 ) ) ( not ( = ?auto_2457429 ?auto_2457434 ) ) ( not ( = ?auto_2457429 ?auto_2457435 ) ) ( not ( = ?auto_2457429 ?auto_2457436 ) ) ( not ( = ?auto_2457429 ?auto_2457437 ) ) ( not ( = ?auto_2457430 ?auto_2457431 ) ) ( not ( = ?auto_2457430 ?auto_2457432 ) ) ( not ( = ?auto_2457430 ?auto_2457433 ) ) ( not ( = ?auto_2457430 ?auto_2457434 ) ) ( not ( = ?auto_2457430 ?auto_2457435 ) ) ( not ( = ?auto_2457430 ?auto_2457436 ) ) ( not ( = ?auto_2457430 ?auto_2457437 ) ) ( not ( = ?auto_2457431 ?auto_2457432 ) ) ( not ( = ?auto_2457431 ?auto_2457433 ) ) ( not ( = ?auto_2457431 ?auto_2457434 ) ) ( not ( = ?auto_2457431 ?auto_2457435 ) ) ( not ( = ?auto_2457431 ?auto_2457436 ) ) ( not ( = ?auto_2457431 ?auto_2457437 ) ) ( not ( = ?auto_2457432 ?auto_2457433 ) ) ( not ( = ?auto_2457432 ?auto_2457434 ) ) ( not ( = ?auto_2457432 ?auto_2457435 ) ) ( not ( = ?auto_2457432 ?auto_2457436 ) ) ( not ( = ?auto_2457432 ?auto_2457437 ) ) ( not ( = ?auto_2457433 ?auto_2457434 ) ) ( not ( = ?auto_2457433 ?auto_2457435 ) ) ( not ( = ?auto_2457433 ?auto_2457436 ) ) ( not ( = ?auto_2457433 ?auto_2457437 ) ) ( not ( = ?auto_2457434 ?auto_2457435 ) ) ( not ( = ?auto_2457434 ?auto_2457436 ) ) ( not ( = ?auto_2457434 ?auto_2457437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2457435 ?auto_2457436 ?auto_2457437 )
      ( MAKE-14CRATE-VERIFY ?auto_2457423 ?auto_2457424 ?auto_2457425 ?auto_2457427 ?auto_2457426 ?auto_2457428 ?auto_2457429 ?auto_2457430 ?auto_2457431 ?auto_2457432 ?auto_2457433 ?auto_2457434 ?auto_2457435 ?auto_2457436 ?auto_2457437 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2457626 - SURFACE
      ?auto_2457627 - SURFACE
      ?auto_2457628 - SURFACE
      ?auto_2457630 - SURFACE
      ?auto_2457629 - SURFACE
      ?auto_2457631 - SURFACE
      ?auto_2457632 - SURFACE
      ?auto_2457633 - SURFACE
      ?auto_2457634 - SURFACE
      ?auto_2457635 - SURFACE
      ?auto_2457636 - SURFACE
      ?auto_2457637 - SURFACE
      ?auto_2457638 - SURFACE
      ?auto_2457639 - SURFACE
      ?auto_2457640 - SURFACE
    )
    :vars
    (
      ?auto_2457643 - HOIST
      ?auto_2457642 - PLACE
      ?auto_2457645 - TRUCK
      ?auto_2457646 - PLACE
      ?auto_2457644 - HOIST
      ?auto_2457641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2457643 ?auto_2457642 ) ( SURFACE-AT ?auto_2457639 ?auto_2457642 ) ( CLEAR ?auto_2457639 ) ( IS-CRATE ?auto_2457640 ) ( not ( = ?auto_2457639 ?auto_2457640 ) ) ( AVAILABLE ?auto_2457643 ) ( ON ?auto_2457639 ?auto_2457638 ) ( not ( = ?auto_2457638 ?auto_2457639 ) ) ( not ( = ?auto_2457638 ?auto_2457640 ) ) ( TRUCK-AT ?auto_2457645 ?auto_2457646 ) ( not ( = ?auto_2457646 ?auto_2457642 ) ) ( HOIST-AT ?auto_2457644 ?auto_2457646 ) ( not ( = ?auto_2457643 ?auto_2457644 ) ) ( AVAILABLE ?auto_2457644 ) ( SURFACE-AT ?auto_2457640 ?auto_2457646 ) ( ON ?auto_2457640 ?auto_2457641 ) ( CLEAR ?auto_2457640 ) ( not ( = ?auto_2457639 ?auto_2457641 ) ) ( not ( = ?auto_2457640 ?auto_2457641 ) ) ( not ( = ?auto_2457638 ?auto_2457641 ) ) ( ON ?auto_2457627 ?auto_2457626 ) ( ON ?auto_2457628 ?auto_2457627 ) ( ON ?auto_2457630 ?auto_2457628 ) ( ON ?auto_2457629 ?auto_2457630 ) ( ON ?auto_2457631 ?auto_2457629 ) ( ON ?auto_2457632 ?auto_2457631 ) ( ON ?auto_2457633 ?auto_2457632 ) ( ON ?auto_2457634 ?auto_2457633 ) ( ON ?auto_2457635 ?auto_2457634 ) ( ON ?auto_2457636 ?auto_2457635 ) ( ON ?auto_2457637 ?auto_2457636 ) ( ON ?auto_2457638 ?auto_2457637 ) ( not ( = ?auto_2457626 ?auto_2457627 ) ) ( not ( = ?auto_2457626 ?auto_2457628 ) ) ( not ( = ?auto_2457626 ?auto_2457630 ) ) ( not ( = ?auto_2457626 ?auto_2457629 ) ) ( not ( = ?auto_2457626 ?auto_2457631 ) ) ( not ( = ?auto_2457626 ?auto_2457632 ) ) ( not ( = ?auto_2457626 ?auto_2457633 ) ) ( not ( = ?auto_2457626 ?auto_2457634 ) ) ( not ( = ?auto_2457626 ?auto_2457635 ) ) ( not ( = ?auto_2457626 ?auto_2457636 ) ) ( not ( = ?auto_2457626 ?auto_2457637 ) ) ( not ( = ?auto_2457626 ?auto_2457638 ) ) ( not ( = ?auto_2457626 ?auto_2457639 ) ) ( not ( = ?auto_2457626 ?auto_2457640 ) ) ( not ( = ?auto_2457626 ?auto_2457641 ) ) ( not ( = ?auto_2457627 ?auto_2457628 ) ) ( not ( = ?auto_2457627 ?auto_2457630 ) ) ( not ( = ?auto_2457627 ?auto_2457629 ) ) ( not ( = ?auto_2457627 ?auto_2457631 ) ) ( not ( = ?auto_2457627 ?auto_2457632 ) ) ( not ( = ?auto_2457627 ?auto_2457633 ) ) ( not ( = ?auto_2457627 ?auto_2457634 ) ) ( not ( = ?auto_2457627 ?auto_2457635 ) ) ( not ( = ?auto_2457627 ?auto_2457636 ) ) ( not ( = ?auto_2457627 ?auto_2457637 ) ) ( not ( = ?auto_2457627 ?auto_2457638 ) ) ( not ( = ?auto_2457627 ?auto_2457639 ) ) ( not ( = ?auto_2457627 ?auto_2457640 ) ) ( not ( = ?auto_2457627 ?auto_2457641 ) ) ( not ( = ?auto_2457628 ?auto_2457630 ) ) ( not ( = ?auto_2457628 ?auto_2457629 ) ) ( not ( = ?auto_2457628 ?auto_2457631 ) ) ( not ( = ?auto_2457628 ?auto_2457632 ) ) ( not ( = ?auto_2457628 ?auto_2457633 ) ) ( not ( = ?auto_2457628 ?auto_2457634 ) ) ( not ( = ?auto_2457628 ?auto_2457635 ) ) ( not ( = ?auto_2457628 ?auto_2457636 ) ) ( not ( = ?auto_2457628 ?auto_2457637 ) ) ( not ( = ?auto_2457628 ?auto_2457638 ) ) ( not ( = ?auto_2457628 ?auto_2457639 ) ) ( not ( = ?auto_2457628 ?auto_2457640 ) ) ( not ( = ?auto_2457628 ?auto_2457641 ) ) ( not ( = ?auto_2457630 ?auto_2457629 ) ) ( not ( = ?auto_2457630 ?auto_2457631 ) ) ( not ( = ?auto_2457630 ?auto_2457632 ) ) ( not ( = ?auto_2457630 ?auto_2457633 ) ) ( not ( = ?auto_2457630 ?auto_2457634 ) ) ( not ( = ?auto_2457630 ?auto_2457635 ) ) ( not ( = ?auto_2457630 ?auto_2457636 ) ) ( not ( = ?auto_2457630 ?auto_2457637 ) ) ( not ( = ?auto_2457630 ?auto_2457638 ) ) ( not ( = ?auto_2457630 ?auto_2457639 ) ) ( not ( = ?auto_2457630 ?auto_2457640 ) ) ( not ( = ?auto_2457630 ?auto_2457641 ) ) ( not ( = ?auto_2457629 ?auto_2457631 ) ) ( not ( = ?auto_2457629 ?auto_2457632 ) ) ( not ( = ?auto_2457629 ?auto_2457633 ) ) ( not ( = ?auto_2457629 ?auto_2457634 ) ) ( not ( = ?auto_2457629 ?auto_2457635 ) ) ( not ( = ?auto_2457629 ?auto_2457636 ) ) ( not ( = ?auto_2457629 ?auto_2457637 ) ) ( not ( = ?auto_2457629 ?auto_2457638 ) ) ( not ( = ?auto_2457629 ?auto_2457639 ) ) ( not ( = ?auto_2457629 ?auto_2457640 ) ) ( not ( = ?auto_2457629 ?auto_2457641 ) ) ( not ( = ?auto_2457631 ?auto_2457632 ) ) ( not ( = ?auto_2457631 ?auto_2457633 ) ) ( not ( = ?auto_2457631 ?auto_2457634 ) ) ( not ( = ?auto_2457631 ?auto_2457635 ) ) ( not ( = ?auto_2457631 ?auto_2457636 ) ) ( not ( = ?auto_2457631 ?auto_2457637 ) ) ( not ( = ?auto_2457631 ?auto_2457638 ) ) ( not ( = ?auto_2457631 ?auto_2457639 ) ) ( not ( = ?auto_2457631 ?auto_2457640 ) ) ( not ( = ?auto_2457631 ?auto_2457641 ) ) ( not ( = ?auto_2457632 ?auto_2457633 ) ) ( not ( = ?auto_2457632 ?auto_2457634 ) ) ( not ( = ?auto_2457632 ?auto_2457635 ) ) ( not ( = ?auto_2457632 ?auto_2457636 ) ) ( not ( = ?auto_2457632 ?auto_2457637 ) ) ( not ( = ?auto_2457632 ?auto_2457638 ) ) ( not ( = ?auto_2457632 ?auto_2457639 ) ) ( not ( = ?auto_2457632 ?auto_2457640 ) ) ( not ( = ?auto_2457632 ?auto_2457641 ) ) ( not ( = ?auto_2457633 ?auto_2457634 ) ) ( not ( = ?auto_2457633 ?auto_2457635 ) ) ( not ( = ?auto_2457633 ?auto_2457636 ) ) ( not ( = ?auto_2457633 ?auto_2457637 ) ) ( not ( = ?auto_2457633 ?auto_2457638 ) ) ( not ( = ?auto_2457633 ?auto_2457639 ) ) ( not ( = ?auto_2457633 ?auto_2457640 ) ) ( not ( = ?auto_2457633 ?auto_2457641 ) ) ( not ( = ?auto_2457634 ?auto_2457635 ) ) ( not ( = ?auto_2457634 ?auto_2457636 ) ) ( not ( = ?auto_2457634 ?auto_2457637 ) ) ( not ( = ?auto_2457634 ?auto_2457638 ) ) ( not ( = ?auto_2457634 ?auto_2457639 ) ) ( not ( = ?auto_2457634 ?auto_2457640 ) ) ( not ( = ?auto_2457634 ?auto_2457641 ) ) ( not ( = ?auto_2457635 ?auto_2457636 ) ) ( not ( = ?auto_2457635 ?auto_2457637 ) ) ( not ( = ?auto_2457635 ?auto_2457638 ) ) ( not ( = ?auto_2457635 ?auto_2457639 ) ) ( not ( = ?auto_2457635 ?auto_2457640 ) ) ( not ( = ?auto_2457635 ?auto_2457641 ) ) ( not ( = ?auto_2457636 ?auto_2457637 ) ) ( not ( = ?auto_2457636 ?auto_2457638 ) ) ( not ( = ?auto_2457636 ?auto_2457639 ) ) ( not ( = ?auto_2457636 ?auto_2457640 ) ) ( not ( = ?auto_2457636 ?auto_2457641 ) ) ( not ( = ?auto_2457637 ?auto_2457638 ) ) ( not ( = ?auto_2457637 ?auto_2457639 ) ) ( not ( = ?auto_2457637 ?auto_2457640 ) ) ( not ( = ?auto_2457637 ?auto_2457641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2457638 ?auto_2457639 ?auto_2457640 )
      ( MAKE-14CRATE-VERIFY ?auto_2457626 ?auto_2457627 ?auto_2457628 ?auto_2457630 ?auto_2457629 ?auto_2457631 ?auto_2457632 ?auto_2457633 ?auto_2457634 ?auto_2457635 ?auto_2457636 ?auto_2457637 ?auto_2457638 ?auto_2457639 ?auto_2457640 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2457830 - SURFACE
      ?auto_2457831 - SURFACE
      ?auto_2457832 - SURFACE
      ?auto_2457834 - SURFACE
      ?auto_2457833 - SURFACE
      ?auto_2457835 - SURFACE
      ?auto_2457836 - SURFACE
      ?auto_2457837 - SURFACE
      ?auto_2457838 - SURFACE
      ?auto_2457839 - SURFACE
      ?auto_2457840 - SURFACE
      ?auto_2457841 - SURFACE
      ?auto_2457842 - SURFACE
      ?auto_2457843 - SURFACE
      ?auto_2457844 - SURFACE
    )
    :vars
    (
      ?auto_2457849 - HOIST
      ?auto_2457848 - PLACE
      ?auto_2457847 - PLACE
      ?auto_2457845 - HOIST
      ?auto_2457850 - SURFACE
      ?auto_2457846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2457849 ?auto_2457848 ) ( SURFACE-AT ?auto_2457843 ?auto_2457848 ) ( CLEAR ?auto_2457843 ) ( IS-CRATE ?auto_2457844 ) ( not ( = ?auto_2457843 ?auto_2457844 ) ) ( AVAILABLE ?auto_2457849 ) ( ON ?auto_2457843 ?auto_2457842 ) ( not ( = ?auto_2457842 ?auto_2457843 ) ) ( not ( = ?auto_2457842 ?auto_2457844 ) ) ( not ( = ?auto_2457847 ?auto_2457848 ) ) ( HOIST-AT ?auto_2457845 ?auto_2457847 ) ( not ( = ?auto_2457849 ?auto_2457845 ) ) ( AVAILABLE ?auto_2457845 ) ( SURFACE-AT ?auto_2457844 ?auto_2457847 ) ( ON ?auto_2457844 ?auto_2457850 ) ( CLEAR ?auto_2457844 ) ( not ( = ?auto_2457843 ?auto_2457850 ) ) ( not ( = ?auto_2457844 ?auto_2457850 ) ) ( not ( = ?auto_2457842 ?auto_2457850 ) ) ( TRUCK-AT ?auto_2457846 ?auto_2457848 ) ( ON ?auto_2457831 ?auto_2457830 ) ( ON ?auto_2457832 ?auto_2457831 ) ( ON ?auto_2457834 ?auto_2457832 ) ( ON ?auto_2457833 ?auto_2457834 ) ( ON ?auto_2457835 ?auto_2457833 ) ( ON ?auto_2457836 ?auto_2457835 ) ( ON ?auto_2457837 ?auto_2457836 ) ( ON ?auto_2457838 ?auto_2457837 ) ( ON ?auto_2457839 ?auto_2457838 ) ( ON ?auto_2457840 ?auto_2457839 ) ( ON ?auto_2457841 ?auto_2457840 ) ( ON ?auto_2457842 ?auto_2457841 ) ( not ( = ?auto_2457830 ?auto_2457831 ) ) ( not ( = ?auto_2457830 ?auto_2457832 ) ) ( not ( = ?auto_2457830 ?auto_2457834 ) ) ( not ( = ?auto_2457830 ?auto_2457833 ) ) ( not ( = ?auto_2457830 ?auto_2457835 ) ) ( not ( = ?auto_2457830 ?auto_2457836 ) ) ( not ( = ?auto_2457830 ?auto_2457837 ) ) ( not ( = ?auto_2457830 ?auto_2457838 ) ) ( not ( = ?auto_2457830 ?auto_2457839 ) ) ( not ( = ?auto_2457830 ?auto_2457840 ) ) ( not ( = ?auto_2457830 ?auto_2457841 ) ) ( not ( = ?auto_2457830 ?auto_2457842 ) ) ( not ( = ?auto_2457830 ?auto_2457843 ) ) ( not ( = ?auto_2457830 ?auto_2457844 ) ) ( not ( = ?auto_2457830 ?auto_2457850 ) ) ( not ( = ?auto_2457831 ?auto_2457832 ) ) ( not ( = ?auto_2457831 ?auto_2457834 ) ) ( not ( = ?auto_2457831 ?auto_2457833 ) ) ( not ( = ?auto_2457831 ?auto_2457835 ) ) ( not ( = ?auto_2457831 ?auto_2457836 ) ) ( not ( = ?auto_2457831 ?auto_2457837 ) ) ( not ( = ?auto_2457831 ?auto_2457838 ) ) ( not ( = ?auto_2457831 ?auto_2457839 ) ) ( not ( = ?auto_2457831 ?auto_2457840 ) ) ( not ( = ?auto_2457831 ?auto_2457841 ) ) ( not ( = ?auto_2457831 ?auto_2457842 ) ) ( not ( = ?auto_2457831 ?auto_2457843 ) ) ( not ( = ?auto_2457831 ?auto_2457844 ) ) ( not ( = ?auto_2457831 ?auto_2457850 ) ) ( not ( = ?auto_2457832 ?auto_2457834 ) ) ( not ( = ?auto_2457832 ?auto_2457833 ) ) ( not ( = ?auto_2457832 ?auto_2457835 ) ) ( not ( = ?auto_2457832 ?auto_2457836 ) ) ( not ( = ?auto_2457832 ?auto_2457837 ) ) ( not ( = ?auto_2457832 ?auto_2457838 ) ) ( not ( = ?auto_2457832 ?auto_2457839 ) ) ( not ( = ?auto_2457832 ?auto_2457840 ) ) ( not ( = ?auto_2457832 ?auto_2457841 ) ) ( not ( = ?auto_2457832 ?auto_2457842 ) ) ( not ( = ?auto_2457832 ?auto_2457843 ) ) ( not ( = ?auto_2457832 ?auto_2457844 ) ) ( not ( = ?auto_2457832 ?auto_2457850 ) ) ( not ( = ?auto_2457834 ?auto_2457833 ) ) ( not ( = ?auto_2457834 ?auto_2457835 ) ) ( not ( = ?auto_2457834 ?auto_2457836 ) ) ( not ( = ?auto_2457834 ?auto_2457837 ) ) ( not ( = ?auto_2457834 ?auto_2457838 ) ) ( not ( = ?auto_2457834 ?auto_2457839 ) ) ( not ( = ?auto_2457834 ?auto_2457840 ) ) ( not ( = ?auto_2457834 ?auto_2457841 ) ) ( not ( = ?auto_2457834 ?auto_2457842 ) ) ( not ( = ?auto_2457834 ?auto_2457843 ) ) ( not ( = ?auto_2457834 ?auto_2457844 ) ) ( not ( = ?auto_2457834 ?auto_2457850 ) ) ( not ( = ?auto_2457833 ?auto_2457835 ) ) ( not ( = ?auto_2457833 ?auto_2457836 ) ) ( not ( = ?auto_2457833 ?auto_2457837 ) ) ( not ( = ?auto_2457833 ?auto_2457838 ) ) ( not ( = ?auto_2457833 ?auto_2457839 ) ) ( not ( = ?auto_2457833 ?auto_2457840 ) ) ( not ( = ?auto_2457833 ?auto_2457841 ) ) ( not ( = ?auto_2457833 ?auto_2457842 ) ) ( not ( = ?auto_2457833 ?auto_2457843 ) ) ( not ( = ?auto_2457833 ?auto_2457844 ) ) ( not ( = ?auto_2457833 ?auto_2457850 ) ) ( not ( = ?auto_2457835 ?auto_2457836 ) ) ( not ( = ?auto_2457835 ?auto_2457837 ) ) ( not ( = ?auto_2457835 ?auto_2457838 ) ) ( not ( = ?auto_2457835 ?auto_2457839 ) ) ( not ( = ?auto_2457835 ?auto_2457840 ) ) ( not ( = ?auto_2457835 ?auto_2457841 ) ) ( not ( = ?auto_2457835 ?auto_2457842 ) ) ( not ( = ?auto_2457835 ?auto_2457843 ) ) ( not ( = ?auto_2457835 ?auto_2457844 ) ) ( not ( = ?auto_2457835 ?auto_2457850 ) ) ( not ( = ?auto_2457836 ?auto_2457837 ) ) ( not ( = ?auto_2457836 ?auto_2457838 ) ) ( not ( = ?auto_2457836 ?auto_2457839 ) ) ( not ( = ?auto_2457836 ?auto_2457840 ) ) ( not ( = ?auto_2457836 ?auto_2457841 ) ) ( not ( = ?auto_2457836 ?auto_2457842 ) ) ( not ( = ?auto_2457836 ?auto_2457843 ) ) ( not ( = ?auto_2457836 ?auto_2457844 ) ) ( not ( = ?auto_2457836 ?auto_2457850 ) ) ( not ( = ?auto_2457837 ?auto_2457838 ) ) ( not ( = ?auto_2457837 ?auto_2457839 ) ) ( not ( = ?auto_2457837 ?auto_2457840 ) ) ( not ( = ?auto_2457837 ?auto_2457841 ) ) ( not ( = ?auto_2457837 ?auto_2457842 ) ) ( not ( = ?auto_2457837 ?auto_2457843 ) ) ( not ( = ?auto_2457837 ?auto_2457844 ) ) ( not ( = ?auto_2457837 ?auto_2457850 ) ) ( not ( = ?auto_2457838 ?auto_2457839 ) ) ( not ( = ?auto_2457838 ?auto_2457840 ) ) ( not ( = ?auto_2457838 ?auto_2457841 ) ) ( not ( = ?auto_2457838 ?auto_2457842 ) ) ( not ( = ?auto_2457838 ?auto_2457843 ) ) ( not ( = ?auto_2457838 ?auto_2457844 ) ) ( not ( = ?auto_2457838 ?auto_2457850 ) ) ( not ( = ?auto_2457839 ?auto_2457840 ) ) ( not ( = ?auto_2457839 ?auto_2457841 ) ) ( not ( = ?auto_2457839 ?auto_2457842 ) ) ( not ( = ?auto_2457839 ?auto_2457843 ) ) ( not ( = ?auto_2457839 ?auto_2457844 ) ) ( not ( = ?auto_2457839 ?auto_2457850 ) ) ( not ( = ?auto_2457840 ?auto_2457841 ) ) ( not ( = ?auto_2457840 ?auto_2457842 ) ) ( not ( = ?auto_2457840 ?auto_2457843 ) ) ( not ( = ?auto_2457840 ?auto_2457844 ) ) ( not ( = ?auto_2457840 ?auto_2457850 ) ) ( not ( = ?auto_2457841 ?auto_2457842 ) ) ( not ( = ?auto_2457841 ?auto_2457843 ) ) ( not ( = ?auto_2457841 ?auto_2457844 ) ) ( not ( = ?auto_2457841 ?auto_2457850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2457842 ?auto_2457843 ?auto_2457844 )
      ( MAKE-14CRATE-VERIFY ?auto_2457830 ?auto_2457831 ?auto_2457832 ?auto_2457834 ?auto_2457833 ?auto_2457835 ?auto_2457836 ?auto_2457837 ?auto_2457838 ?auto_2457839 ?auto_2457840 ?auto_2457841 ?auto_2457842 ?auto_2457843 ?auto_2457844 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2458034 - SURFACE
      ?auto_2458035 - SURFACE
      ?auto_2458036 - SURFACE
      ?auto_2458038 - SURFACE
      ?auto_2458037 - SURFACE
      ?auto_2458039 - SURFACE
      ?auto_2458040 - SURFACE
      ?auto_2458041 - SURFACE
      ?auto_2458042 - SURFACE
      ?auto_2458043 - SURFACE
      ?auto_2458044 - SURFACE
      ?auto_2458045 - SURFACE
      ?auto_2458046 - SURFACE
      ?auto_2458047 - SURFACE
      ?auto_2458048 - SURFACE
    )
    :vars
    (
      ?auto_2458050 - HOIST
      ?auto_2458053 - PLACE
      ?auto_2458054 - PLACE
      ?auto_2458051 - HOIST
      ?auto_2458052 - SURFACE
      ?auto_2458049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2458050 ?auto_2458053 ) ( IS-CRATE ?auto_2458048 ) ( not ( = ?auto_2458047 ?auto_2458048 ) ) ( not ( = ?auto_2458046 ?auto_2458047 ) ) ( not ( = ?auto_2458046 ?auto_2458048 ) ) ( not ( = ?auto_2458054 ?auto_2458053 ) ) ( HOIST-AT ?auto_2458051 ?auto_2458054 ) ( not ( = ?auto_2458050 ?auto_2458051 ) ) ( AVAILABLE ?auto_2458051 ) ( SURFACE-AT ?auto_2458048 ?auto_2458054 ) ( ON ?auto_2458048 ?auto_2458052 ) ( CLEAR ?auto_2458048 ) ( not ( = ?auto_2458047 ?auto_2458052 ) ) ( not ( = ?auto_2458048 ?auto_2458052 ) ) ( not ( = ?auto_2458046 ?auto_2458052 ) ) ( TRUCK-AT ?auto_2458049 ?auto_2458053 ) ( SURFACE-AT ?auto_2458046 ?auto_2458053 ) ( CLEAR ?auto_2458046 ) ( LIFTING ?auto_2458050 ?auto_2458047 ) ( IS-CRATE ?auto_2458047 ) ( ON ?auto_2458035 ?auto_2458034 ) ( ON ?auto_2458036 ?auto_2458035 ) ( ON ?auto_2458038 ?auto_2458036 ) ( ON ?auto_2458037 ?auto_2458038 ) ( ON ?auto_2458039 ?auto_2458037 ) ( ON ?auto_2458040 ?auto_2458039 ) ( ON ?auto_2458041 ?auto_2458040 ) ( ON ?auto_2458042 ?auto_2458041 ) ( ON ?auto_2458043 ?auto_2458042 ) ( ON ?auto_2458044 ?auto_2458043 ) ( ON ?auto_2458045 ?auto_2458044 ) ( ON ?auto_2458046 ?auto_2458045 ) ( not ( = ?auto_2458034 ?auto_2458035 ) ) ( not ( = ?auto_2458034 ?auto_2458036 ) ) ( not ( = ?auto_2458034 ?auto_2458038 ) ) ( not ( = ?auto_2458034 ?auto_2458037 ) ) ( not ( = ?auto_2458034 ?auto_2458039 ) ) ( not ( = ?auto_2458034 ?auto_2458040 ) ) ( not ( = ?auto_2458034 ?auto_2458041 ) ) ( not ( = ?auto_2458034 ?auto_2458042 ) ) ( not ( = ?auto_2458034 ?auto_2458043 ) ) ( not ( = ?auto_2458034 ?auto_2458044 ) ) ( not ( = ?auto_2458034 ?auto_2458045 ) ) ( not ( = ?auto_2458034 ?auto_2458046 ) ) ( not ( = ?auto_2458034 ?auto_2458047 ) ) ( not ( = ?auto_2458034 ?auto_2458048 ) ) ( not ( = ?auto_2458034 ?auto_2458052 ) ) ( not ( = ?auto_2458035 ?auto_2458036 ) ) ( not ( = ?auto_2458035 ?auto_2458038 ) ) ( not ( = ?auto_2458035 ?auto_2458037 ) ) ( not ( = ?auto_2458035 ?auto_2458039 ) ) ( not ( = ?auto_2458035 ?auto_2458040 ) ) ( not ( = ?auto_2458035 ?auto_2458041 ) ) ( not ( = ?auto_2458035 ?auto_2458042 ) ) ( not ( = ?auto_2458035 ?auto_2458043 ) ) ( not ( = ?auto_2458035 ?auto_2458044 ) ) ( not ( = ?auto_2458035 ?auto_2458045 ) ) ( not ( = ?auto_2458035 ?auto_2458046 ) ) ( not ( = ?auto_2458035 ?auto_2458047 ) ) ( not ( = ?auto_2458035 ?auto_2458048 ) ) ( not ( = ?auto_2458035 ?auto_2458052 ) ) ( not ( = ?auto_2458036 ?auto_2458038 ) ) ( not ( = ?auto_2458036 ?auto_2458037 ) ) ( not ( = ?auto_2458036 ?auto_2458039 ) ) ( not ( = ?auto_2458036 ?auto_2458040 ) ) ( not ( = ?auto_2458036 ?auto_2458041 ) ) ( not ( = ?auto_2458036 ?auto_2458042 ) ) ( not ( = ?auto_2458036 ?auto_2458043 ) ) ( not ( = ?auto_2458036 ?auto_2458044 ) ) ( not ( = ?auto_2458036 ?auto_2458045 ) ) ( not ( = ?auto_2458036 ?auto_2458046 ) ) ( not ( = ?auto_2458036 ?auto_2458047 ) ) ( not ( = ?auto_2458036 ?auto_2458048 ) ) ( not ( = ?auto_2458036 ?auto_2458052 ) ) ( not ( = ?auto_2458038 ?auto_2458037 ) ) ( not ( = ?auto_2458038 ?auto_2458039 ) ) ( not ( = ?auto_2458038 ?auto_2458040 ) ) ( not ( = ?auto_2458038 ?auto_2458041 ) ) ( not ( = ?auto_2458038 ?auto_2458042 ) ) ( not ( = ?auto_2458038 ?auto_2458043 ) ) ( not ( = ?auto_2458038 ?auto_2458044 ) ) ( not ( = ?auto_2458038 ?auto_2458045 ) ) ( not ( = ?auto_2458038 ?auto_2458046 ) ) ( not ( = ?auto_2458038 ?auto_2458047 ) ) ( not ( = ?auto_2458038 ?auto_2458048 ) ) ( not ( = ?auto_2458038 ?auto_2458052 ) ) ( not ( = ?auto_2458037 ?auto_2458039 ) ) ( not ( = ?auto_2458037 ?auto_2458040 ) ) ( not ( = ?auto_2458037 ?auto_2458041 ) ) ( not ( = ?auto_2458037 ?auto_2458042 ) ) ( not ( = ?auto_2458037 ?auto_2458043 ) ) ( not ( = ?auto_2458037 ?auto_2458044 ) ) ( not ( = ?auto_2458037 ?auto_2458045 ) ) ( not ( = ?auto_2458037 ?auto_2458046 ) ) ( not ( = ?auto_2458037 ?auto_2458047 ) ) ( not ( = ?auto_2458037 ?auto_2458048 ) ) ( not ( = ?auto_2458037 ?auto_2458052 ) ) ( not ( = ?auto_2458039 ?auto_2458040 ) ) ( not ( = ?auto_2458039 ?auto_2458041 ) ) ( not ( = ?auto_2458039 ?auto_2458042 ) ) ( not ( = ?auto_2458039 ?auto_2458043 ) ) ( not ( = ?auto_2458039 ?auto_2458044 ) ) ( not ( = ?auto_2458039 ?auto_2458045 ) ) ( not ( = ?auto_2458039 ?auto_2458046 ) ) ( not ( = ?auto_2458039 ?auto_2458047 ) ) ( not ( = ?auto_2458039 ?auto_2458048 ) ) ( not ( = ?auto_2458039 ?auto_2458052 ) ) ( not ( = ?auto_2458040 ?auto_2458041 ) ) ( not ( = ?auto_2458040 ?auto_2458042 ) ) ( not ( = ?auto_2458040 ?auto_2458043 ) ) ( not ( = ?auto_2458040 ?auto_2458044 ) ) ( not ( = ?auto_2458040 ?auto_2458045 ) ) ( not ( = ?auto_2458040 ?auto_2458046 ) ) ( not ( = ?auto_2458040 ?auto_2458047 ) ) ( not ( = ?auto_2458040 ?auto_2458048 ) ) ( not ( = ?auto_2458040 ?auto_2458052 ) ) ( not ( = ?auto_2458041 ?auto_2458042 ) ) ( not ( = ?auto_2458041 ?auto_2458043 ) ) ( not ( = ?auto_2458041 ?auto_2458044 ) ) ( not ( = ?auto_2458041 ?auto_2458045 ) ) ( not ( = ?auto_2458041 ?auto_2458046 ) ) ( not ( = ?auto_2458041 ?auto_2458047 ) ) ( not ( = ?auto_2458041 ?auto_2458048 ) ) ( not ( = ?auto_2458041 ?auto_2458052 ) ) ( not ( = ?auto_2458042 ?auto_2458043 ) ) ( not ( = ?auto_2458042 ?auto_2458044 ) ) ( not ( = ?auto_2458042 ?auto_2458045 ) ) ( not ( = ?auto_2458042 ?auto_2458046 ) ) ( not ( = ?auto_2458042 ?auto_2458047 ) ) ( not ( = ?auto_2458042 ?auto_2458048 ) ) ( not ( = ?auto_2458042 ?auto_2458052 ) ) ( not ( = ?auto_2458043 ?auto_2458044 ) ) ( not ( = ?auto_2458043 ?auto_2458045 ) ) ( not ( = ?auto_2458043 ?auto_2458046 ) ) ( not ( = ?auto_2458043 ?auto_2458047 ) ) ( not ( = ?auto_2458043 ?auto_2458048 ) ) ( not ( = ?auto_2458043 ?auto_2458052 ) ) ( not ( = ?auto_2458044 ?auto_2458045 ) ) ( not ( = ?auto_2458044 ?auto_2458046 ) ) ( not ( = ?auto_2458044 ?auto_2458047 ) ) ( not ( = ?auto_2458044 ?auto_2458048 ) ) ( not ( = ?auto_2458044 ?auto_2458052 ) ) ( not ( = ?auto_2458045 ?auto_2458046 ) ) ( not ( = ?auto_2458045 ?auto_2458047 ) ) ( not ( = ?auto_2458045 ?auto_2458048 ) ) ( not ( = ?auto_2458045 ?auto_2458052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2458046 ?auto_2458047 ?auto_2458048 )
      ( MAKE-14CRATE-VERIFY ?auto_2458034 ?auto_2458035 ?auto_2458036 ?auto_2458038 ?auto_2458037 ?auto_2458039 ?auto_2458040 ?auto_2458041 ?auto_2458042 ?auto_2458043 ?auto_2458044 ?auto_2458045 ?auto_2458046 ?auto_2458047 ?auto_2458048 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2458238 - SURFACE
      ?auto_2458239 - SURFACE
      ?auto_2458240 - SURFACE
      ?auto_2458242 - SURFACE
      ?auto_2458241 - SURFACE
      ?auto_2458243 - SURFACE
      ?auto_2458244 - SURFACE
      ?auto_2458245 - SURFACE
      ?auto_2458246 - SURFACE
      ?auto_2458247 - SURFACE
      ?auto_2458248 - SURFACE
      ?auto_2458249 - SURFACE
      ?auto_2458250 - SURFACE
      ?auto_2458251 - SURFACE
      ?auto_2458252 - SURFACE
    )
    :vars
    (
      ?auto_2458258 - HOIST
      ?auto_2458253 - PLACE
      ?auto_2458255 - PLACE
      ?auto_2458256 - HOIST
      ?auto_2458257 - SURFACE
      ?auto_2458254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2458258 ?auto_2458253 ) ( IS-CRATE ?auto_2458252 ) ( not ( = ?auto_2458251 ?auto_2458252 ) ) ( not ( = ?auto_2458250 ?auto_2458251 ) ) ( not ( = ?auto_2458250 ?auto_2458252 ) ) ( not ( = ?auto_2458255 ?auto_2458253 ) ) ( HOIST-AT ?auto_2458256 ?auto_2458255 ) ( not ( = ?auto_2458258 ?auto_2458256 ) ) ( AVAILABLE ?auto_2458256 ) ( SURFACE-AT ?auto_2458252 ?auto_2458255 ) ( ON ?auto_2458252 ?auto_2458257 ) ( CLEAR ?auto_2458252 ) ( not ( = ?auto_2458251 ?auto_2458257 ) ) ( not ( = ?auto_2458252 ?auto_2458257 ) ) ( not ( = ?auto_2458250 ?auto_2458257 ) ) ( TRUCK-AT ?auto_2458254 ?auto_2458253 ) ( SURFACE-AT ?auto_2458250 ?auto_2458253 ) ( CLEAR ?auto_2458250 ) ( IS-CRATE ?auto_2458251 ) ( AVAILABLE ?auto_2458258 ) ( IN ?auto_2458251 ?auto_2458254 ) ( ON ?auto_2458239 ?auto_2458238 ) ( ON ?auto_2458240 ?auto_2458239 ) ( ON ?auto_2458242 ?auto_2458240 ) ( ON ?auto_2458241 ?auto_2458242 ) ( ON ?auto_2458243 ?auto_2458241 ) ( ON ?auto_2458244 ?auto_2458243 ) ( ON ?auto_2458245 ?auto_2458244 ) ( ON ?auto_2458246 ?auto_2458245 ) ( ON ?auto_2458247 ?auto_2458246 ) ( ON ?auto_2458248 ?auto_2458247 ) ( ON ?auto_2458249 ?auto_2458248 ) ( ON ?auto_2458250 ?auto_2458249 ) ( not ( = ?auto_2458238 ?auto_2458239 ) ) ( not ( = ?auto_2458238 ?auto_2458240 ) ) ( not ( = ?auto_2458238 ?auto_2458242 ) ) ( not ( = ?auto_2458238 ?auto_2458241 ) ) ( not ( = ?auto_2458238 ?auto_2458243 ) ) ( not ( = ?auto_2458238 ?auto_2458244 ) ) ( not ( = ?auto_2458238 ?auto_2458245 ) ) ( not ( = ?auto_2458238 ?auto_2458246 ) ) ( not ( = ?auto_2458238 ?auto_2458247 ) ) ( not ( = ?auto_2458238 ?auto_2458248 ) ) ( not ( = ?auto_2458238 ?auto_2458249 ) ) ( not ( = ?auto_2458238 ?auto_2458250 ) ) ( not ( = ?auto_2458238 ?auto_2458251 ) ) ( not ( = ?auto_2458238 ?auto_2458252 ) ) ( not ( = ?auto_2458238 ?auto_2458257 ) ) ( not ( = ?auto_2458239 ?auto_2458240 ) ) ( not ( = ?auto_2458239 ?auto_2458242 ) ) ( not ( = ?auto_2458239 ?auto_2458241 ) ) ( not ( = ?auto_2458239 ?auto_2458243 ) ) ( not ( = ?auto_2458239 ?auto_2458244 ) ) ( not ( = ?auto_2458239 ?auto_2458245 ) ) ( not ( = ?auto_2458239 ?auto_2458246 ) ) ( not ( = ?auto_2458239 ?auto_2458247 ) ) ( not ( = ?auto_2458239 ?auto_2458248 ) ) ( not ( = ?auto_2458239 ?auto_2458249 ) ) ( not ( = ?auto_2458239 ?auto_2458250 ) ) ( not ( = ?auto_2458239 ?auto_2458251 ) ) ( not ( = ?auto_2458239 ?auto_2458252 ) ) ( not ( = ?auto_2458239 ?auto_2458257 ) ) ( not ( = ?auto_2458240 ?auto_2458242 ) ) ( not ( = ?auto_2458240 ?auto_2458241 ) ) ( not ( = ?auto_2458240 ?auto_2458243 ) ) ( not ( = ?auto_2458240 ?auto_2458244 ) ) ( not ( = ?auto_2458240 ?auto_2458245 ) ) ( not ( = ?auto_2458240 ?auto_2458246 ) ) ( not ( = ?auto_2458240 ?auto_2458247 ) ) ( not ( = ?auto_2458240 ?auto_2458248 ) ) ( not ( = ?auto_2458240 ?auto_2458249 ) ) ( not ( = ?auto_2458240 ?auto_2458250 ) ) ( not ( = ?auto_2458240 ?auto_2458251 ) ) ( not ( = ?auto_2458240 ?auto_2458252 ) ) ( not ( = ?auto_2458240 ?auto_2458257 ) ) ( not ( = ?auto_2458242 ?auto_2458241 ) ) ( not ( = ?auto_2458242 ?auto_2458243 ) ) ( not ( = ?auto_2458242 ?auto_2458244 ) ) ( not ( = ?auto_2458242 ?auto_2458245 ) ) ( not ( = ?auto_2458242 ?auto_2458246 ) ) ( not ( = ?auto_2458242 ?auto_2458247 ) ) ( not ( = ?auto_2458242 ?auto_2458248 ) ) ( not ( = ?auto_2458242 ?auto_2458249 ) ) ( not ( = ?auto_2458242 ?auto_2458250 ) ) ( not ( = ?auto_2458242 ?auto_2458251 ) ) ( not ( = ?auto_2458242 ?auto_2458252 ) ) ( not ( = ?auto_2458242 ?auto_2458257 ) ) ( not ( = ?auto_2458241 ?auto_2458243 ) ) ( not ( = ?auto_2458241 ?auto_2458244 ) ) ( not ( = ?auto_2458241 ?auto_2458245 ) ) ( not ( = ?auto_2458241 ?auto_2458246 ) ) ( not ( = ?auto_2458241 ?auto_2458247 ) ) ( not ( = ?auto_2458241 ?auto_2458248 ) ) ( not ( = ?auto_2458241 ?auto_2458249 ) ) ( not ( = ?auto_2458241 ?auto_2458250 ) ) ( not ( = ?auto_2458241 ?auto_2458251 ) ) ( not ( = ?auto_2458241 ?auto_2458252 ) ) ( not ( = ?auto_2458241 ?auto_2458257 ) ) ( not ( = ?auto_2458243 ?auto_2458244 ) ) ( not ( = ?auto_2458243 ?auto_2458245 ) ) ( not ( = ?auto_2458243 ?auto_2458246 ) ) ( not ( = ?auto_2458243 ?auto_2458247 ) ) ( not ( = ?auto_2458243 ?auto_2458248 ) ) ( not ( = ?auto_2458243 ?auto_2458249 ) ) ( not ( = ?auto_2458243 ?auto_2458250 ) ) ( not ( = ?auto_2458243 ?auto_2458251 ) ) ( not ( = ?auto_2458243 ?auto_2458252 ) ) ( not ( = ?auto_2458243 ?auto_2458257 ) ) ( not ( = ?auto_2458244 ?auto_2458245 ) ) ( not ( = ?auto_2458244 ?auto_2458246 ) ) ( not ( = ?auto_2458244 ?auto_2458247 ) ) ( not ( = ?auto_2458244 ?auto_2458248 ) ) ( not ( = ?auto_2458244 ?auto_2458249 ) ) ( not ( = ?auto_2458244 ?auto_2458250 ) ) ( not ( = ?auto_2458244 ?auto_2458251 ) ) ( not ( = ?auto_2458244 ?auto_2458252 ) ) ( not ( = ?auto_2458244 ?auto_2458257 ) ) ( not ( = ?auto_2458245 ?auto_2458246 ) ) ( not ( = ?auto_2458245 ?auto_2458247 ) ) ( not ( = ?auto_2458245 ?auto_2458248 ) ) ( not ( = ?auto_2458245 ?auto_2458249 ) ) ( not ( = ?auto_2458245 ?auto_2458250 ) ) ( not ( = ?auto_2458245 ?auto_2458251 ) ) ( not ( = ?auto_2458245 ?auto_2458252 ) ) ( not ( = ?auto_2458245 ?auto_2458257 ) ) ( not ( = ?auto_2458246 ?auto_2458247 ) ) ( not ( = ?auto_2458246 ?auto_2458248 ) ) ( not ( = ?auto_2458246 ?auto_2458249 ) ) ( not ( = ?auto_2458246 ?auto_2458250 ) ) ( not ( = ?auto_2458246 ?auto_2458251 ) ) ( not ( = ?auto_2458246 ?auto_2458252 ) ) ( not ( = ?auto_2458246 ?auto_2458257 ) ) ( not ( = ?auto_2458247 ?auto_2458248 ) ) ( not ( = ?auto_2458247 ?auto_2458249 ) ) ( not ( = ?auto_2458247 ?auto_2458250 ) ) ( not ( = ?auto_2458247 ?auto_2458251 ) ) ( not ( = ?auto_2458247 ?auto_2458252 ) ) ( not ( = ?auto_2458247 ?auto_2458257 ) ) ( not ( = ?auto_2458248 ?auto_2458249 ) ) ( not ( = ?auto_2458248 ?auto_2458250 ) ) ( not ( = ?auto_2458248 ?auto_2458251 ) ) ( not ( = ?auto_2458248 ?auto_2458252 ) ) ( not ( = ?auto_2458248 ?auto_2458257 ) ) ( not ( = ?auto_2458249 ?auto_2458250 ) ) ( not ( = ?auto_2458249 ?auto_2458251 ) ) ( not ( = ?auto_2458249 ?auto_2458252 ) ) ( not ( = ?auto_2458249 ?auto_2458257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2458250 ?auto_2458251 ?auto_2458252 )
      ( MAKE-14CRATE-VERIFY ?auto_2458238 ?auto_2458239 ?auto_2458240 ?auto_2458242 ?auto_2458241 ?auto_2458243 ?auto_2458244 ?auto_2458245 ?auto_2458246 ?auto_2458247 ?auto_2458248 ?auto_2458249 ?auto_2458250 ?auto_2458251 ?auto_2458252 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2475458 - SURFACE
      ?auto_2475459 - SURFACE
      ?auto_2475460 - SURFACE
      ?auto_2475462 - SURFACE
      ?auto_2475461 - SURFACE
      ?auto_2475463 - SURFACE
      ?auto_2475464 - SURFACE
      ?auto_2475465 - SURFACE
      ?auto_2475466 - SURFACE
      ?auto_2475467 - SURFACE
      ?auto_2475468 - SURFACE
      ?auto_2475469 - SURFACE
      ?auto_2475470 - SURFACE
      ?auto_2475471 - SURFACE
      ?auto_2475472 - SURFACE
      ?auto_2475473 - SURFACE
    )
    :vars
    (
      ?auto_2475475 - HOIST
      ?auto_2475474 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2475475 ?auto_2475474 ) ( SURFACE-AT ?auto_2475472 ?auto_2475474 ) ( CLEAR ?auto_2475472 ) ( LIFTING ?auto_2475475 ?auto_2475473 ) ( IS-CRATE ?auto_2475473 ) ( not ( = ?auto_2475472 ?auto_2475473 ) ) ( ON ?auto_2475459 ?auto_2475458 ) ( ON ?auto_2475460 ?auto_2475459 ) ( ON ?auto_2475462 ?auto_2475460 ) ( ON ?auto_2475461 ?auto_2475462 ) ( ON ?auto_2475463 ?auto_2475461 ) ( ON ?auto_2475464 ?auto_2475463 ) ( ON ?auto_2475465 ?auto_2475464 ) ( ON ?auto_2475466 ?auto_2475465 ) ( ON ?auto_2475467 ?auto_2475466 ) ( ON ?auto_2475468 ?auto_2475467 ) ( ON ?auto_2475469 ?auto_2475468 ) ( ON ?auto_2475470 ?auto_2475469 ) ( ON ?auto_2475471 ?auto_2475470 ) ( ON ?auto_2475472 ?auto_2475471 ) ( not ( = ?auto_2475458 ?auto_2475459 ) ) ( not ( = ?auto_2475458 ?auto_2475460 ) ) ( not ( = ?auto_2475458 ?auto_2475462 ) ) ( not ( = ?auto_2475458 ?auto_2475461 ) ) ( not ( = ?auto_2475458 ?auto_2475463 ) ) ( not ( = ?auto_2475458 ?auto_2475464 ) ) ( not ( = ?auto_2475458 ?auto_2475465 ) ) ( not ( = ?auto_2475458 ?auto_2475466 ) ) ( not ( = ?auto_2475458 ?auto_2475467 ) ) ( not ( = ?auto_2475458 ?auto_2475468 ) ) ( not ( = ?auto_2475458 ?auto_2475469 ) ) ( not ( = ?auto_2475458 ?auto_2475470 ) ) ( not ( = ?auto_2475458 ?auto_2475471 ) ) ( not ( = ?auto_2475458 ?auto_2475472 ) ) ( not ( = ?auto_2475458 ?auto_2475473 ) ) ( not ( = ?auto_2475459 ?auto_2475460 ) ) ( not ( = ?auto_2475459 ?auto_2475462 ) ) ( not ( = ?auto_2475459 ?auto_2475461 ) ) ( not ( = ?auto_2475459 ?auto_2475463 ) ) ( not ( = ?auto_2475459 ?auto_2475464 ) ) ( not ( = ?auto_2475459 ?auto_2475465 ) ) ( not ( = ?auto_2475459 ?auto_2475466 ) ) ( not ( = ?auto_2475459 ?auto_2475467 ) ) ( not ( = ?auto_2475459 ?auto_2475468 ) ) ( not ( = ?auto_2475459 ?auto_2475469 ) ) ( not ( = ?auto_2475459 ?auto_2475470 ) ) ( not ( = ?auto_2475459 ?auto_2475471 ) ) ( not ( = ?auto_2475459 ?auto_2475472 ) ) ( not ( = ?auto_2475459 ?auto_2475473 ) ) ( not ( = ?auto_2475460 ?auto_2475462 ) ) ( not ( = ?auto_2475460 ?auto_2475461 ) ) ( not ( = ?auto_2475460 ?auto_2475463 ) ) ( not ( = ?auto_2475460 ?auto_2475464 ) ) ( not ( = ?auto_2475460 ?auto_2475465 ) ) ( not ( = ?auto_2475460 ?auto_2475466 ) ) ( not ( = ?auto_2475460 ?auto_2475467 ) ) ( not ( = ?auto_2475460 ?auto_2475468 ) ) ( not ( = ?auto_2475460 ?auto_2475469 ) ) ( not ( = ?auto_2475460 ?auto_2475470 ) ) ( not ( = ?auto_2475460 ?auto_2475471 ) ) ( not ( = ?auto_2475460 ?auto_2475472 ) ) ( not ( = ?auto_2475460 ?auto_2475473 ) ) ( not ( = ?auto_2475462 ?auto_2475461 ) ) ( not ( = ?auto_2475462 ?auto_2475463 ) ) ( not ( = ?auto_2475462 ?auto_2475464 ) ) ( not ( = ?auto_2475462 ?auto_2475465 ) ) ( not ( = ?auto_2475462 ?auto_2475466 ) ) ( not ( = ?auto_2475462 ?auto_2475467 ) ) ( not ( = ?auto_2475462 ?auto_2475468 ) ) ( not ( = ?auto_2475462 ?auto_2475469 ) ) ( not ( = ?auto_2475462 ?auto_2475470 ) ) ( not ( = ?auto_2475462 ?auto_2475471 ) ) ( not ( = ?auto_2475462 ?auto_2475472 ) ) ( not ( = ?auto_2475462 ?auto_2475473 ) ) ( not ( = ?auto_2475461 ?auto_2475463 ) ) ( not ( = ?auto_2475461 ?auto_2475464 ) ) ( not ( = ?auto_2475461 ?auto_2475465 ) ) ( not ( = ?auto_2475461 ?auto_2475466 ) ) ( not ( = ?auto_2475461 ?auto_2475467 ) ) ( not ( = ?auto_2475461 ?auto_2475468 ) ) ( not ( = ?auto_2475461 ?auto_2475469 ) ) ( not ( = ?auto_2475461 ?auto_2475470 ) ) ( not ( = ?auto_2475461 ?auto_2475471 ) ) ( not ( = ?auto_2475461 ?auto_2475472 ) ) ( not ( = ?auto_2475461 ?auto_2475473 ) ) ( not ( = ?auto_2475463 ?auto_2475464 ) ) ( not ( = ?auto_2475463 ?auto_2475465 ) ) ( not ( = ?auto_2475463 ?auto_2475466 ) ) ( not ( = ?auto_2475463 ?auto_2475467 ) ) ( not ( = ?auto_2475463 ?auto_2475468 ) ) ( not ( = ?auto_2475463 ?auto_2475469 ) ) ( not ( = ?auto_2475463 ?auto_2475470 ) ) ( not ( = ?auto_2475463 ?auto_2475471 ) ) ( not ( = ?auto_2475463 ?auto_2475472 ) ) ( not ( = ?auto_2475463 ?auto_2475473 ) ) ( not ( = ?auto_2475464 ?auto_2475465 ) ) ( not ( = ?auto_2475464 ?auto_2475466 ) ) ( not ( = ?auto_2475464 ?auto_2475467 ) ) ( not ( = ?auto_2475464 ?auto_2475468 ) ) ( not ( = ?auto_2475464 ?auto_2475469 ) ) ( not ( = ?auto_2475464 ?auto_2475470 ) ) ( not ( = ?auto_2475464 ?auto_2475471 ) ) ( not ( = ?auto_2475464 ?auto_2475472 ) ) ( not ( = ?auto_2475464 ?auto_2475473 ) ) ( not ( = ?auto_2475465 ?auto_2475466 ) ) ( not ( = ?auto_2475465 ?auto_2475467 ) ) ( not ( = ?auto_2475465 ?auto_2475468 ) ) ( not ( = ?auto_2475465 ?auto_2475469 ) ) ( not ( = ?auto_2475465 ?auto_2475470 ) ) ( not ( = ?auto_2475465 ?auto_2475471 ) ) ( not ( = ?auto_2475465 ?auto_2475472 ) ) ( not ( = ?auto_2475465 ?auto_2475473 ) ) ( not ( = ?auto_2475466 ?auto_2475467 ) ) ( not ( = ?auto_2475466 ?auto_2475468 ) ) ( not ( = ?auto_2475466 ?auto_2475469 ) ) ( not ( = ?auto_2475466 ?auto_2475470 ) ) ( not ( = ?auto_2475466 ?auto_2475471 ) ) ( not ( = ?auto_2475466 ?auto_2475472 ) ) ( not ( = ?auto_2475466 ?auto_2475473 ) ) ( not ( = ?auto_2475467 ?auto_2475468 ) ) ( not ( = ?auto_2475467 ?auto_2475469 ) ) ( not ( = ?auto_2475467 ?auto_2475470 ) ) ( not ( = ?auto_2475467 ?auto_2475471 ) ) ( not ( = ?auto_2475467 ?auto_2475472 ) ) ( not ( = ?auto_2475467 ?auto_2475473 ) ) ( not ( = ?auto_2475468 ?auto_2475469 ) ) ( not ( = ?auto_2475468 ?auto_2475470 ) ) ( not ( = ?auto_2475468 ?auto_2475471 ) ) ( not ( = ?auto_2475468 ?auto_2475472 ) ) ( not ( = ?auto_2475468 ?auto_2475473 ) ) ( not ( = ?auto_2475469 ?auto_2475470 ) ) ( not ( = ?auto_2475469 ?auto_2475471 ) ) ( not ( = ?auto_2475469 ?auto_2475472 ) ) ( not ( = ?auto_2475469 ?auto_2475473 ) ) ( not ( = ?auto_2475470 ?auto_2475471 ) ) ( not ( = ?auto_2475470 ?auto_2475472 ) ) ( not ( = ?auto_2475470 ?auto_2475473 ) ) ( not ( = ?auto_2475471 ?auto_2475472 ) ) ( not ( = ?auto_2475471 ?auto_2475473 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2475472 ?auto_2475473 )
      ( MAKE-15CRATE-VERIFY ?auto_2475458 ?auto_2475459 ?auto_2475460 ?auto_2475462 ?auto_2475461 ?auto_2475463 ?auto_2475464 ?auto_2475465 ?auto_2475466 ?auto_2475467 ?auto_2475468 ?auto_2475469 ?auto_2475470 ?auto_2475471 ?auto_2475472 ?auto_2475473 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2475637 - SURFACE
      ?auto_2475638 - SURFACE
      ?auto_2475639 - SURFACE
      ?auto_2475641 - SURFACE
      ?auto_2475640 - SURFACE
      ?auto_2475642 - SURFACE
      ?auto_2475643 - SURFACE
      ?auto_2475644 - SURFACE
      ?auto_2475645 - SURFACE
      ?auto_2475646 - SURFACE
      ?auto_2475647 - SURFACE
      ?auto_2475648 - SURFACE
      ?auto_2475649 - SURFACE
      ?auto_2475650 - SURFACE
      ?auto_2475651 - SURFACE
      ?auto_2475652 - SURFACE
    )
    :vars
    (
      ?auto_2475654 - HOIST
      ?auto_2475653 - PLACE
      ?auto_2475655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2475654 ?auto_2475653 ) ( SURFACE-AT ?auto_2475651 ?auto_2475653 ) ( CLEAR ?auto_2475651 ) ( IS-CRATE ?auto_2475652 ) ( not ( = ?auto_2475651 ?auto_2475652 ) ) ( TRUCK-AT ?auto_2475655 ?auto_2475653 ) ( AVAILABLE ?auto_2475654 ) ( IN ?auto_2475652 ?auto_2475655 ) ( ON ?auto_2475651 ?auto_2475650 ) ( not ( = ?auto_2475650 ?auto_2475651 ) ) ( not ( = ?auto_2475650 ?auto_2475652 ) ) ( ON ?auto_2475638 ?auto_2475637 ) ( ON ?auto_2475639 ?auto_2475638 ) ( ON ?auto_2475641 ?auto_2475639 ) ( ON ?auto_2475640 ?auto_2475641 ) ( ON ?auto_2475642 ?auto_2475640 ) ( ON ?auto_2475643 ?auto_2475642 ) ( ON ?auto_2475644 ?auto_2475643 ) ( ON ?auto_2475645 ?auto_2475644 ) ( ON ?auto_2475646 ?auto_2475645 ) ( ON ?auto_2475647 ?auto_2475646 ) ( ON ?auto_2475648 ?auto_2475647 ) ( ON ?auto_2475649 ?auto_2475648 ) ( ON ?auto_2475650 ?auto_2475649 ) ( not ( = ?auto_2475637 ?auto_2475638 ) ) ( not ( = ?auto_2475637 ?auto_2475639 ) ) ( not ( = ?auto_2475637 ?auto_2475641 ) ) ( not ( = ?auto_2475637 ?auto_2475640 ) ) ( not ( = ?auto_2475637 ?auto_2475642 ) ) ( not ( = ?auto_2475637 ?auto_2475643 ) ) ( not ( = ?auto_2475637 ?auto_2475644 ) ) ( not ( = ?auto_2475637 ?auto_2475645 ) ) ( not ( = ?auto_2475637 ?auto_2475646 ) ) ( not ( = ?auto_2475637 ?auto_2475647 ) ) ( not ( = ?auto_2475637 ?auto_2475648 ) ) ( not ( = ?auto_2475637 ?auto_2475649 ) ) ( not ( = ?auto_2475637 ?auto_2475650 ) ) ( not ( = ?auto_2475637 ?auto_2475651 ) ) ( not ( = ?auto_2475637 ?auto_2475652 ) ) ( not ( = ?auto_2475638 ?auto_2475639 ) ) ( not ( = ?auto_2475638 ?auto_2475641 ) ) ( not ( = ?auto_2475638 ?auto_2475640 ) ) ( not ( = ?auto_2475638 ?auto_2475642 ) ) ( not ( = ?auto_2475638 ?auto_2475643 ) ) ( not ( = ?auto_2475638 ?auto_2475644 ) ) ( not ( = ?auto_2475638 ?auto_2475645 ) ) ( not ( = ?auto_2475638 ?auto_2475646 ) ) ( not ( = ?auto_2475638 ?auto_2475647 ) ) ( not ( = ?auto_2475638 ?auto_2475648 ) ) ( not ( = ?auto_2475638 ?auto_2475649 ) ) ( not ( = ?auto_2475638 ?auto_2475650 ) ) ( not ( = ?auto_2475638 ?auto_2475651 ) ) ( not ( = ?auto_2475638 ?auto_2475652 ) ) ( not ( = ?auto_2475639 ?auto_2475641 ) ) ( not ( = ?auto_2475639 ?auto_2475640 ) ) ( not ( = ?auto_2475639 ?auto_2475642 ) ) ( not ( = ?auto_2475639 ?auto_2475643 ) ) ( not ( = ?auto_2475639 ?auto_2475644 ) ) ( not ( = ?auto_2475639 ?auto_2475645 ) ) ( not ( = ?auto_2475639 ?auto_2475646 ) ) ( not ( = ?auto_2475639 ?auto_2475647 ) ) ( not ( = ?auto_2475639 ?auto_2475648 ) ) ( not ( = ?auto_2475639 ?auto_2475649 ) ) ( not ( = ?auto_2475639 ?auto_2475650 ) ) ( not ( = ?auto_2475639 ?auto_2475651 ) ) ( not ( = ?auto_2475639 ?auto_2475652 ) ) ( not ( = ?auto_2475641 ?auto_2475640 ) ) ( not ( = ?auto_2475641 ?auto_2475642 ) ) ( not ( = ?auto_2475641 ?auto_2475643 ) ) ( not ( = ?auto_2475641 ?auto_2475644 ) ) ( not ( = ?auto_2475641 ?auto_2475645 ) ) ( not ( = ?auto_2475641 ?auto_2475646 ) ) ( not ( = ?auto_2475641 ?auto_2475647 ) ) ( not ( = ?auto_2475641 ?auto_2475648 ) ) ( not ( = ?auto_2475641 ?auto_2475649 ) ) ( not ( = ?auto_2475641 ?auto_2475650 ) ) ( not ( = ?auto_2475641 ?auto_2475651 ) ) ( not ( = ?auto_2475641 ?auto_2475652 ) ) ( not ( = ?auto_2475640 ?auto_2475642 ) ) ( not ( = ?auto_2475640 ?auto_2475643 ) ) ( not ( = ?auto_2475640 ?auto_2475644 ) ) ( not ( = ?auto_2475640 ?auto_2475645 ) ) ( not ( = ?auto_2475640 ?auto_2475646 ) ) ( not ( = ?auto_2475640 ?auto_2475647 ) ) ( not ( = ?auto_2475640 ?auto_2475648 ) ) ( not ( = ?auto_2475640 ?auto_2475649 ) ) ( not ( = ?auto_2475640 ?auto_2475650 ) ) ( not ( = ?auto_2475640 ?auto_2475651 ) ) ( not ( = ?auto_2475640 ?auto_2475652 ) ) ( not ( = ?auto_2475642 ?auto_2475643 ) ) ( not ( = ?auto_2475642 ?auto_2475644 ) ) ( not ( = ?auto_2475642 ?auto_2475645 ) ) ( not ( = ?auto_2475642 ?auto_2475646 ) ) ( not ( = ?auto_2475642 ?auto_2475647 ) ) ( not ( = ?auto_2475642 ?auto_2475648 ) ) ( not ( = ?auto_2475642 ?auto_2475649 ) ) ( not ( = ?auto_2475642 ?auto_2475650 ) ) ( not ( = ?auto_2475642 ?auto_2475651 ) ) ( not ( = ?auto_2475642 ?auto_2475652 ) ) ( not ( = ?auto_2475643 ?auto_2475644 ) ) ( not ( = ?auto_2475643 ?auto_2475645 ) ) ( not ( = ?auto_2475643 ?auto_2475646 ) ) ( not ( = ?auto_2475643 ?auto_2475647 ) ) ( not ( = ?auto_2475643 ?auto_2475648 ) ) ( not ( = ?auto_2475643 ?auto_2475649 ) ) ( not ( = ?auto_2475643 ?auto_2475650 ) ) ( not ( = ?auto_2475643 ?auto_2475651 ) ) ( not ( = ?auto_2475643 ?auto_2475652 ) ) ( not ( = ?auto_2475644 ?auto_2475645 ) ) ( not ( = ?auto_2475644 ?auto_2475646 ) ) ( not ( = ?auto_2475644 ?auto_2475647 ) ) ( not ( = ?auto_2475644 ?auto_2475648 ) ) ( not ( = ?auto_2475644 ?auto_2475649 ) ) ( not ( = ?auto_2475644 ?auto_2475650 ) ) ( not ( = ?auto_2475644 ?auto_2475651 ) ) ( not ( = ?auto_2475644 ?auto_2475652 ) ) ( not ( = ?auto_2475645 ?auto_2475646 ) ) ( not ( = ?auto_2475645 ?auto_2475647 ) ) ( not ( = ?auto_2475645 ?auto_2475648 ) ) ( not ( = ?auto_2475645 ?auto_2475649 ) ) ( not ( = ?auto_2475645 ?auto_2475650 ) ) ( not ( = ?auto_2475645 ?auto_2475651 ) ) ( not ( = ?auto_2475645 ?auto_2475652 ) ) ( not ( = ?auto_2475646 ?auto_2475647 ) ) ( not ( = ?auto_2475646 ?auto_2475648 ) ) ( not ( = ?auto_2475646 ?auto_2475649 ) ) ( not ( = ?auto_2475646 ?auto_2475650 ) ) ( not ( = ?auto_2475646 ?auto_2475651 ) ) ( not ( = ?auto_2475646 ?auto_2475652 ) ) ( not ( = ?auto_2475647 ?auto_2475648 ) ) ( not ( = ?auto_2475647 ?auto_2475649 ) ) ( not ( = ?auto_2475647 ?auto_2475650 ) ) ( not ( = ?auto_2475647 ?auto_2475651 ) ) ( not ( = ?auto_2475647 ?auto_2475652 ) ) ( not ( = ?auto_2475648 ?auto_2475649 ) ) ( not ( = ?auto_2475648 ?auto_2475650 ) ) ( not ( = ?auto_2475648 ?auto_2475651 ) ) ( not ( = ?auto_2475648 ?auto_2475652 ) ) ( not ( = ?auto_2475649 ?auto_2475650 ) ) ( not ( = ?auto_2475649 ?auto_2475651 ) ) ( not ( = ?auto_2475649 ?auto_2475652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2475650 ?auto_2475651 ?auto_2475652 )
      ( MAKE-15CRATE-VERIFY ?auto_2475637 ?auto_2475638 ?auto_2475639 ?auto_2475641 ?auto_2475640 ?auto_2475642 ?auto_2475643 ?auto_2475644 ?auto_2475645 ?auto_2475646 ?auto_2475647 ?auto_2475648 ?auto_2475649 ?auto_2475650 ?auto_2475651 ?auto_2475652 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2475832 - SURFACE
      ?auto_2475833 - SURFACE
      ?auto_2475834 - SURFACE
      ?auto_2475836 - SURFACE
      ?auto_2475835 - SURFACE
      ?auto_2475837 - SURFACE
      ?auto_2475838 - SURFACE
      ?auto_2475839 - SURFACE
      ?auto_2475840 - SURFACE
      ?auto_2475841 - SURFACE
      ?auto_2475842 - SURFACE
      ?auto_2475843 - SURFACE
      ?auto_2475844 - SURFACE
      ?auto_2475845 - SURFACE
      ?auto_2475846 - SURFACE
      ?auto_2475847 - SURFACE
    )
    :vars
    (
      ?auto_2475851 - HOIST
      ?auto_2475848 - PLACE
      ?auto_2475850 - TRUCK
      ?auto_2475849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2475851 ?auto_2475848 ) ( SURFACE-AT ?auto_2475846 ?auto_2475848 ) ( CLEAR ?auto_2475846 ) ( IS-CRATE ?auto_2475847 ) ( not ( = ?auto_2475846 ?auto_2475847 ) ) ( AVAILABLE ?auto_2475851 ) ( IN ?auto_2475847 ?auto_2475850 ) ( ON ?auto_2475846 ?auto_2475845 ) ( not ( = ?auto_2475845 ?auto_2475846 ) ) ( not ( = ?auto_2475845 ?auto_2475847 ) ) ( TRUCK-AT ?auto_2475850 ?auto_2475849 ) ( not ( = ?auto_2475849 ?auto_2475848 ) ) ( ON ?auto_2475833 ?auto_2475832 ) ( ON ?auto_2475834 ?auto_2475833 ) ( ON ?auto_2475836 ?auto_2475834 ) ( ON ?auto_2475835 ?auto_2475836 ) ( ON ?auto_2475837 ?auto_2475835 ) ( ON ?auto_2475838 ?auto_2475837 ) ( ON ?auto_2475839 ?auto_2475838 ) ( ON ?auto_2475840 ?auto_2475839 ) ( ON ?auto_2475841 ?auto_2475840 ) ( ON ?auto_2475842 ?auto_2475841 ) ( ON ?auto_2475843 ?auto_2475842 ) ( ON ?auto_2475844 ?auto_2475843 ) ( ON ?auto_2475845 ?auto_2475844 ) ( not ( = ?auto_2475832 ?auto_2475833 ) ) ( not ( = ?auto_2475832 ?auto_2475834 ) ) ( not ( = ?auto_2475832 ?auto_2475836 ) ) ( not ( = ?auto_2475832 ?auto_2475835 ) ) ( not ( = ?auto_2475832 ?auto_2475837 ) ) ( not ( = ?auto_2475832 ?auto_2475838 ) ) ( not ( = ?auto_2475832 ?auto_2475839 ) ) ( not ( = ?auto_2475832 ?auto_2475840 ) ) ( not ( = ?auto_2475832 ?auto_2475841 ) ) ( not ( = ?auto_2475832 ?auto_2475842 ) ) ( not ( = ?auto_2475832 ?auto_2475843 ) ) ( not ( = ?auto_2475832 ?auto_2475844 ) ) ( not ( = ?auto_2475832 ?auto_2475845 ) ) ( not ( = ?auto_2475832 ?auto_2475846 ) ) ( not ( = ?auto_2475832 ?auto_2475847 ) ) ( not ( = ?auto_2475833 ?auto_2475834 ) ) ( not ( = ?auto_2475833 ?auto_2475836 ) ) ( not ( = ?auto_2475833 ?auto_2475835 ) ) ( not ( = ?auto_2475833 ?auto_2475837 ) ) ( not ( = ?auto_2475833 ?auto_2475838 ) ) ( not ( = ?auto_2475833 ?auto_2475839 ) ) ( not ( = ?auto_2475833 ?auto_2475840 ) ) ( not ( = ?auto_2475833 ?auto_2475841 ) ) ( not ( = ?auto_2475833 ?auto_2475842 ) ) ( not ( = ?auto_2475833 ?auto_2475843 ) ) ( not ( = ?auto_2475833 ?auto_2475844 ) ) ( not ( = ?auto_2475833 ?auto_2475845 ) ) ( not ( = ?auto_2475833 ?auto_2475846 ) ) ( not ( = ?auto_2475833 ?auto_2475847 ) ) ( not ( = ?auto_2475834 ?auto_2475836 ) ) ( not ( = ?auto_2475834 ?auto_2475835 ) ) ( not ( = ?auto_2475834 ?auto_2475837 ) ) ( not ( = ?auto_2475834 ?auto_2475838 ) ) ( not ( = ?auto_2475834 ?auto_2475839 ) ) ( not ( = ?auto_2475834 ?auto_2475840 ) ) ( not ( = ?auto_2475834 ?auto_2475841 ) ) ( not ( = ?auto_2475834 ?auto_2475842 ) ) ( not ( = ?auto_2475834 ?auto_2475843 ) ) ( not ( = ?auto_2475834 ?auto_2475844 ) ) ( not ( = ?auto_2475834 ?auto_2475845 ) ) ( not ( = ?auto_2475834 ?auto_2475846 ) ) ( not ( = ?auto_2475834 ?auto_2475847 ) ) ( not ( = ?auto_2475836 ?auto_2475835 ) ) ( not ( = ?auto_2475836 ?auto_2475837 ) ) ( not ( = ?auto_2475836 ?auto_2475838 ) ) ( not ( = ?auto_2475836 ?auto_2475839 ) ) ( not ( = ?auto_2475836 ?auto_2475840 ) ) ( not ( = ?auto_2475836 ?auto_2475841 ) ) ( not ( = ?auto_2475836 ?auto_2475842 ) ) ( not ( = ?auto_2475836 ?auto_2475843 ) ) ( not ( = ?auto_2475836 ?auto_2475844 ) ) ( not ( = ?auto_2475836 ?auto_2475845 ) ) ( not ( = ?auto_2475836 ?auto_2475846 ) ) ( not ( = ?auto_2475836 ?auto_2475847 ) ) ( not ( = ?auto_2475835 ?auto_2475837 ) ) ( not ( = ?auto_2475835 ?auto_2475838 ) ) ( not ( = ?auto_2475835 ?auto_2475839 ) ) ( not ( = ?auto_2475835 ?auto_2475840 ) ) ( not ( = ?auto_2475835 ?auto_2475841 ) ) ( not ( = ?auto_2475835 ?auto_2475842 ) ) ( not ( = ?auto_2475835 ?auto_2475843 ) ) ( not ( = ?auto_2475835 ?auto_2475844 ) ) ( not ( = ?auto_2475835 ?auto_2475845 ) ) ( not ( = ?auto_2475835 ?auto_2475846 ) ) ( not ( = ?auto_2475835 ?auto_2475847 ) ) ( not ( = ?auto_2475837 ?auto_2475838 ) ) ( not ( = ?auto_2475837 ?auto_2475839 ) ) ( not ( = ?auto_2475837 ?auto_2475840 ) ) ( not ( = ?auto_2475837 ?auto_2475841 ) ) ( not ( = ?auto_2475837 ?auto_2475842 ) ) ( not ( = ?auto_2475837 ?auto_2475843 ) ) ( not ( = ?auto_2475837 ?auto_2475844 ) ) ( not ( = ?auto_2475837 ?auto_2475845 ) ) ( not ( = ?auto_2475837 ?auto_2475846 ) ) ( not ( = ?auto_2475837 ?auto_2475847 ) ) ( not ( = ?auto_2475838 ?auto_2475839 ) ) ( not ( = ?auto_2475838 ?auto_2475840 ) ) ( not ( = ?auto_2475838 ?auto_2475841 ) ) ( not ( = ?auto_2475838 ?auto_2475842 ) ) ( not ( = ?auto_2475838 ?auto_2475843 ) ) ( not ( = ?auto_2475838 ?auto_2475844 ) ) ( not ( = ?auto_2475838 ?auto_2475845 ) ) ( not ( = ?auto_2475838 ?auto_2475846 ) ) ( not ( = ?auto_2475838 ?auto_2475847 ) ) ( not ( = ?auto_2475839 ?auto_2475840 ) ) ( not ( = ?auto_2475839 ?auto_2475841 ) ) ( not ( = ?auto_2475839 ?auto_2475842 ) ) ( not ( = ?auto_2475839 ?auto_2475843 ) ) ( not ( = ?auto_2475839 ?auto_2475844 ) ) ( not ( = ?auto_2475839 ?auto_2475845 ) ) ( not ( = ?auto_2475839 ?auto_2475846 ) ) ( not ( = ?auto_2475839 ?auto_2475847 ) ) ( not ( = ?auto_2475840 ?auto_2475841 ) ) ( not ( = ?auto_2475840 ?auto_2475842 ) ) ( not ( = ?auto_2475840 ?auto_2475843 ) ) ( not ( = ?auto_2475840 ?auto_2475844 ) ) ( not ( = ?auto_2475840 ?auto_2475845 ) ) ( not ( = ?auto_2475840 ?auto_2475846 ) ) ( not ( = ?auto_2475840 ?auto_2475847 ) ) ( not ( = ?auto_2475841 ?auto_2475842 ) ) ( not ( = ?auto_2475841 ?auto_2475843 ) ) ( not ( = ?auto_2475841 ?auto_2475844 ) ) ( not ( = ?auto_2475841 ?auto_2475845 ) ) ( not ( = ?auto_2475841 ?auto_2475846 ) ) ( not ( = ?auto_2475841 ?auto_2475847 ) ) ( not ( = ?auto_2475842 ?auto_2475843 ) ) ( not ( = ?auto_2475842 ?auto_2475844 ) ) ( not ( = ?auto_2475842 ?auto_2475845 ) ) ( not ( = ?auto_2475842 ?auto_2475846 ) ) ( not ( = ?auto_2475842 ?auto_2475847 ) ) ( not ( = ?auto_2475843 ?auto_2475844 ) ) ( not ( = ?auto_2475843 ?auto_2475845 ) ) ( not ( = ?auto_2475843 ?auto_2475846 ) ) ( not ( = ?auto_2475843 ?auto_2475847 ) ) ( not ( = ?auto_2475844 ?auto_2475845 ) ) ( not ( = ?auto_2475844 ?auto_2475846 ) ) ( not ( = ?auto_2475844 ?auto_2475847 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2475845 ?auto_2475846 ?auto_2475847 )
      ( MAKE-15CRATE-VERIFY ?auto_2475832 ?auto_2475833 ?auto_2475834 ?auto_2475836 ?auto_2475835 ?auto_2475837 ?auto_2475838 ?auto_2475839 ?auto_2475840 ?auto_2475841 ?auto_2475842 ?auto_2475843 ?auto_2475844 ?auto_2475845 ?auto_2475846 ?auto_2475847 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2476042 - SURFACE
      ?auto_2476043 - SURFACE
      ?auto_2476044 - SURFACE
      ?auto_2476046 - SURFACE
      ?auto_2476045 - SURFACE
      ?auto_2476047 - SURFACE
      ?auto_2476048 - SURFACE
      ?auto_2476049 - SURFACE
      ?auto_2476050 - SURFACE
      ?auto_2476051 - SURFACE
      ?auto_2476052 - SURFACE
      ?auto_2476053 - SURFACE
      ?auto_2476054 - SURFACE
      ?auto_2476055 - SURFACE
      ?auto_2476056 - SURFACE
      ?auto_2476057 - SURFACE
    )
    :vars
    (
      ?auto_2476058 - HOIST
      ?auto_2476061 - PLACE
      ?auto_2476059 - TRUCK
      ?auto_2476060 - PLACE
      ?auto_2476062 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2476058 ?auto_2476061 ) ( SURFACE-AT ?auto_2476056 ?auto_2476061 ) ( CLEAR ?auto_2476056 ) ( IS-CRATE ?auto_2476057 ) ( not ( = ?auto_2476056 ?auto_2476057 ) ) ( AVAILABLE ?auto_2476058 ) ( ON ?auto_2476056 ?auto_2476055 ) ( not ( = ?auto_2476055 ?auto_2476056 ) ) ( not ( = ?auto_2476055 ?auto_2476057 ) ) ( TRUCK-AT ?auto_2476059 ?auto_2476060 ) ( not ( = ?auto_2476060 ?auto_2476061 ) ) ( HOIST-AT ?auto_2476062 ?auto_2476060 ) ( LIFTING ?auto_2476062 ?auto_2476057 ) ( not ( = ?auto_2476058 ?auto_2476062 ) ) ( ON ?auto_2476043 ?auto_2476042 ) ( ON ?auto_2476044 ?auto_2476043 ) ( ON ?auto_2476046 ?auto_2476044 ) ( ON ?auto_2476045 ?auto_2476046 ) ( ON ?auto_2476047 ?auto_2476045 ) ( ON ?auto_2476048 ?auto_2476047 ) ( ON ?auto_2476049 ?auto_2476048 ) ( ON ?auto_2476050 ?auto_2476049 ) ( ON ?auto_2476051 ?auto_2476050 ) ( ON ?auto_2476052 ?auto_2476051 ) ( ON ?auto_2476053 ?auto_2476052 ) ( ON ?auto_2476054 ?auto_2476053 ) ( ON ?auto_2476055 ?auto_2476054 ) ( not ( = ?auto_2476042 ?auto_2476043 ) ) ( not ( = ?auto_2476042 ?auto_2476044 ) ) ( not ( = ?auto_2476042 ?auto_2476046 ) ) ( not ( = ?auto_2476042 ?auto_2476045 ) ) ( not ( = ?auto_2476042 ?auto_2476047 ) ) ( not ( = ?auto_2476042 ?auto_2476048 ) ) ( not ( = ?auto_2476042 ?auto_2476049 ) ) ( not ( = ?auto_2476042 ?auto_2476050 ) ) ( not ( = ?auto_2476042 ?auto_2476051 ) ) ( not ( = ?auto_2476042 ?auto_2476052 ) ) ( not ( = ?auto_2476042 ?auto_2476053 ) ) ( not ( = ?auto_2476042 ?auto_2476054 ) ) ( not ( = ?auto_2476042 ?auto_2476055 ) ) ( not ( = ?auto_2476042 ?auto_2476056 ) ) ( not ( = ?auto_2476042 ?auto_2476057 ) ) ( not ( = ?auto_2476043 ?auto_2476044 ) ) ( not ( = ?auto_2476043 ?auto_2476046 ) ) ( not ( = ?auto_2476043 ?auto_2476045 ) ) ( not ( = ?auto_2476043 ?auto_2476047 ) ) ( not ( = ?auto_2476043 ?auto_2476048 ) ) ( not ( = ?auto_2476043 ?auto_2476049 ) ) ( not ( = ?auto_2476043 ?auto_2476050 ) ) ( not ( = ?auto_2476043 ?auto_2476051 ) ) ( not ( = ?auto_2476043 ?auto_2476052 ) ) ( not ( = ?auto_2476043 ?auto_2476053 ) ) ( not ( = ?auto_2476043 ?auto_2476054 ) ) ( not ( = ?auto_2476043 ?auto_2476055 ) ) ( not ( = ?auto_2476043 ?auto_2476056 ) ) ( not ( = ?auto_2476043 ?auto_2476057 ) ) ( not ( = ?auto_2476044 ?auto_2476046 ) ) ( not ( = ?auto_2476044 ?auto_2476045 ) ) ( not ( = ?auto_2476044 ?auto_2476047 ) ) ( not ( = ?auto_2476044 ?auto_2476048 ) ) ( not ( = ?auto_2476044 ?auto_2476049 ) ) ( not ( = ?auto_2476044 ?auto_2476050 ) ) ( not ( = ?auto_2476044 ?auto_2476051 ) ) ( not ( = ?auto_2476044 ?auto_2476052 ) ) ( not ( = ?auto_2476044 ?auto_2476053 ) ) ( not ( = ?auto_2476044 ?auto_2476054 ) ) ( not ( = ?auto_2476044 ?auto_2476055 ) ) ( not ( = ?auto_2476044 ?auto_2476056 ) ) ( not ( = ?auto_2476044 ?auto_2476057 ) ) ( not ( = ?auto_2476046 ?auto_2476045 ) ) ( not ( = ?auto_2476046 ?auto_2476047 ) ) ( not ( = ?auto_2476046 ?auto_2476048 ) ) ( not ( = ?auto_2476046 ?auto_2476049 ) ) ( not ( = ?auto_2476046 ?auto_2476050 ) ) ( not ( = ?auto_2476046 ?auto_2476051 ) ) ( not ( = ?auto_2476046 ?auto_2476052 ) ) ( not ( = ?auto_2476046 ?auto_2476053 ) ) ( not ( = ?auto_2476046 ?auto_2476054 ) ) ( not ( = ?auto_2476046 ?auto_2476055 ) ) ( not ( = ?auto_2476046 ?auto_2476056 ) ) ( not ( = ?auto_2476046 ?auto_2476057 ) ) ( not ( = ?auto_2476045 ?auto_2476047 ) ) ( not ( = ?auto_2476045 ?auto_2476048 ) ) ( not ( = ?auto_2476045 ?auto_2476049 ) ) ( not ( = ?auto_2476045 ?auto_2476050 ) ) ( not ( = ?auto_2476045 ?auto_2476051 ) ) ( not ( = ?auto_2476045 ?auto_2476052 ) ) ( not ( = ?auto_2476045 ?auto_2476053 ) ) ( not ( = ?auto_2476045 ?auto_2476054 ) ) ( not ( = ?auto_2476045 ?auto_2476055 ) ) ( not ( = ?auto_2476045 ?auto_2476056 ) ) ( not ( = ?auto_2476045 ?auto_2476057 ) ) ( not ( = ?auto_2476047 ?auto_2476048 ) ) ( not ( = ?auto_2476047 ?auto_2476049 ) ) ( not ( = ?auto_2476047 ?auto_2476050 ) ) ( not ( = ?auto_2476047 ?auto_2476051 ) ) ( not ( = ?auto_2476047 ?auto_2476052 ) ) ( not ( = ?auto_2476047 ?auto_2476053 ) ) ( not ( = ?auto_2476047 ?auto_2476054 ) ) ( not ( = ?auto_2476047 ?auto_2476055 ) ) ( not ( = ?auto_2476047 ?auto_2476056 ) ) ( not ( = ?auto_2476047 ?auto_2476057 ) ) ( not ( = ?auto_2476048 ?auto_2476049 ) ) ( not ( = ?auto_2476048 ?auto_2476050 ) ) ( not ( = ?auto_2476048 ?auto_2476051 ) ) ( not ( = ?auto_2476048 ?auto_2476052 ) ) ( not ( = ?auto_2476048 ?auto_2476053 ) ) ( not ( = ?auto_2476048 ?auto_2476054 ) ) ( not ( = ?auto_2476048 ?auto_2476055 ) ) ( not ( = ?auto_2476048 ?auto_2476056 ) ) ( not ( = ?auto_2476048 ?auto_2476057 ) ) ( not ( = ?auto_2476049 ?auto_2476050 ) ) ( not ( = ?auto_2476049 ?auto_2476051 ) ) ( not ( = ?auto_2476049 ?auto_2476052 ) ) ( not ( = ?auto_2476049 ?auto_2476053 ) ) ( not ( = ?auto_2476049 ?auto_2476054 ) ) ( not ( = ?auto_2476049 ?auto_2476055 ) ) ( not ( = ?auto_2476049 ?auto_2476056 ) ) ( not ( = ?auto_2476049 ?auto_2476057 ) ) ( not ( = ?auto_2476050 ?auto_2476051 ) ) ( not ( = ?auto_2476050 ?auto_2476052 ) ) ( not ( = ?auto_2476050 ?auto_2476053 ) ) ( not ( = ?auto_2476050 ?auto_2476054 ) ) ( not ( = ?auto_2476050 ?auto_2476055 ) ) ( not ( = ?auto_2476050 ?auto_2476056 ) ) ( not ( = ?auto_2476050 ?auto_2476057 ) ) ( not ( = ?auto_2476051 ?auto_2476052 ) ) ( not ( = ?auto_2476051 ?auto_2476053 ) ) ( not ( = ?auto_2476051 ?auto_2476054 ) ) ( not ( = ?auto_2476051 ?auto_2476055 ) ) ( not ( = ?auto_2476051 ?auto_2476056 ) ) ( not ( = ?auto_2476051 ?auto_2476057 ) ) ( not ( = ?auto_2476052 ?auto_2476053 ) ) ( not ( = ?auto_2476052 ?auto_2476054 ) ) ( not ( = ?auto_2476052 ?auto_2476055 ) ) ( not ( = ?auto_2476052 ?auto_2476056 ) ) ( not ( = ?auto_2476052 ?auto_2476057 ) ) ( not ( = ?auto_2476053 ?auto_2476054 ) ) ( not ( = ?auto_2476053 ?auto_2476055 ) ) ( not ( = ?auto_2476053 ?auto_2476056 ) ) ( not ( = ?auto_2476053 ?auto_2476057 ) ) ( not ( = ?auto_2476054 ?auto_2476055 ) ) ( not ( = ?auto_2476054 ?auto_2476056 ) ) ( not ( = ?auto_2476054 ?auto_2476057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2476055 ?auto_2476056 ?auto_2476057 )
      ( MAKE-15CRATE-VERIFY ?auto_2476042 ?auto_2476043 ?auto_2476044 ?auto_2476046 ?auto_2476045 ?auto_2476047 ?auto_2476048 ?auto_2476049 ?auto_2476050 ?auto_2476051 ?auto_2476052 ?auto_2476053 ?auto_2476054 ?auto_2476055 ?auto_2476056 ?auto_2476057 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2476267 - SURFACE
      ?auto_2476268 - SURFACE
      ?auto_2476269 - SURFACE
      ?auto_2476271 - SURFACE
      ?auto_2476270 - SURFACE
      ?auto_2476272 - SURFACE
      ?auto_2476273 - SURFACE
      ?auto_2476274 - SURFACE
      ?auto_2476275 - SURFACE
      ?auto_2476276 - SURFACE
      ?auto_2476277 - SURFACE
      ?auto_2476278 - SURFACE
      ?auto_2476279 - SURFACE
      ?auto_2476280 - SURFACE
      ?auto_2476281 - SURFACE
      ?auto_2476282 - SURFACE
    )
    :vars
    (
      ?auto_2476285 - HOIST
      ?auto_2476283 - PLACE
      ?auto_2476287 - TRUCK
      ?auto_2476288 - PLACE
      ?auto_2476286 - HOIST
      ?auto_2476284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2476285 ?auto_2476283 ) ( SURFACE-AT ?auto_2476281 ?auto_2476283 ) ( CLEAR ?auto_2476281 ) ( IS-CRATE ?auto_2476282 ) ( not ( = ?auto_2476281 ?auto_2476282 ) ) ( AVAILABLE ?auto_2476285 ) ( ON ?auto_2476281 ?auto_2476280 ) ( not ( = ?auto_2476280 ?auto_2476281 ) ) ( not ( = ?auto_2476280 ?auto_2476282 ) ) ( TRUCK-AT ?auto_2476287 ?auto_2476288 ) ( not ( = ?auto_2476288 ?auto_2476283 ) ) ( HOIST-AT ?auto_2476286 ?auto_2476288 ) ( not ( = ?auto_2476285 ?auto_2476286 ) ) ( AVAILABLE ?auto_2476286 ) ( SURFACE-AT ?auto_2476282 ?auto_2476288 ) ( ON ?auto_2476282 ?auto_2476284 ) ( CLEAR ?auto_2476282 ) ( not ( = ?auto_2476281 ?auto_2476284 ) ) ( not ( = ?auto_2476282 ?auto_2476284 ) ) ( not ( = ?auto_2476280 ?auto_2476284 ) ) ( ON ?auto_2476268 ?auto_2476267 ) ( ON ?auto_2476269 ?auto_2476268 ) ( ON ?auto_2476271 ?auto_2476269 ) ( ON ?auto_2476270 ?auto_2476271 ) ( ON ?auto_2476272 ?auto_2476270 ) ( ON ?auto_2476273 ?auto_2476272 ) ( ON ?auto_2476274 ?auto_2476273 ) ( ON ?auto_2476275 ?auto_2476274 ) ( ON ?auto_2476276 ?auto_2476275 ) ( ON ?auto_2476277 ?auto_2476276 ) ( ON ?auto_2476278 ?auto_2476277 ) ( ON ?auto_2476279 ?auto_2476278 ) ( ON ?auto_2476280 ?auto_2476279 ) ( not ( = ?auto_2476267 ?auto_2476268 ) ) ( not ( = ?auto_2476267 ?auto_2476269 ) ) ( not ( = ?auto_2476267 ?auto_2476271 ) ) ( not ( = ?auto_2476267 ?auto_2476270 ) ) ( not ( = ?auto_2476267 ?auto_2476272 ) ) ( not ( = ?auto_2476267 ?auto_2476273 ) ) ( not ( = ?auto_2476267 ?auto_2476274 ) ) ( not ( = ?auto_2476267 ?auto_2476275 ) ) ( not ( = ?auto_2476267 ?auto_2476276 ) ) ( not ( = ?auto_2476267 ?auto_2476277 ) ) ( not ( = ?auto_2476267 ?auto_2476278 ) ) ( not ( = ?auto_2476267 ?auto_2476279 ) ) ( not ( = ?auto_2476267 ?auto_2476280 ) ) ( not ( = ?auto_2476267 ?auto_2476281 ) ) ( not ( = ?auto_2476267 ?auto_2476282 ) ) ( not ( = ?auto_2476267 ?auto_2476284 ) ) ( not ( = ?auto_2476268 ?auto_2476269 ) ) ( not ( = ?auto_2476268 ?auto_2476271 ) ) ( not ( = ?auto_2476268 ?auto_2476270 ) ) ( not ( = ?auto_2476268 ?auto_2476272 ) ) ( not ( = ?auto_2476268 ?auto_2476273 ) ) ( not ( = ?auto_2476268 ?auto_2476274 ) ) ( not ( = ?auto_2476268 ?auto_2476275 ) ) ( not ( = ?auto_2476268 ?auto_2476276 ) ) ( not ( = ?auto_2476268 ?auto_2476277 ) ) ( not ( = ?auto_2476268 ?auto_2476278 ) ) ( not ( = ?auto_2476268 ?auto_2476279 ) ) ( not ( = ?auto_2476268 ?auto_2476280 ) ) ( not ( = ?auto_2476268 ?auto_2476281 ) ) ( not ( = ?auto_2476268 ?auto_2476282 ) ) ( not ( = ?auto_2476268 ?auto_2476284 ) ) ( not ( = ?auto_2476269 ?auto_2476271 ) ) ( not ( = ?auto_2476269 ?auto_2476270 ) ) ( not ( = ?auto_2476269 ?auto_2476272 ) ) ( not ( = ?auto_2476269 ?auto_2476273 ) ) ( not ( = ?auto_2476269 ?auto_2476274 ) ) ( not ( = ?auto_2476269 ?auto_2476275 ) ) ( not ( = ?auto_2476269 ?auto_2476276 ) ) ( not ( = ?auto_2476269 ?auto_2476277 ) ) ( not ( = ?auto_2476269 ?auto_2476278 ) ) ( not ( = ?auto_2476269 ?auto_2476279 ) ) ( not ( = ?auto_2476269 ?auto_2476280 ) ) ( not ( = ?auto_2476269 ?auto_2476281 ) ) ( not ( = ?auto_2476269 ?auto_2476282 ) ) ( not ( = ?auto_2476269 ?auto_2476284 ) ) ( not ( = ?auto_2476271 ?auto_2476270 ) ) ( not ( = ?auto_2476271 ?auto_2476272 ) ) ( not ( = ?auto_2476271 ?auto_2476273 ) ) ( not ( = ?auto_2476271 ?auto_2476274 ) ) ( not ( = ?auto_2476271 ?auto_2476275 ) ) ( not ( = ?auto_2476271 ?auto_2476276 ) ) ( not ( = ?auto_2476271 ?auto_2476277 ) ) ( not ( = ?auto_2476271 ?auto_2476278 ) ) ( not ( = ?auto_2476271 ?auto_2476279 ) ) ( not ( = ?auto_2476271 ?auto_2476280 ) ) ( not ( = ?auto_2476271 ?auto_2476281 ) ) ( not ( = ?auto_2476271 ?auto_2476282 ) ) ( not ( = ?auto_2476271 ?auto_2476284 ) ) ( not ( = ?auto_2476270 ?auto_2476272 ) ) ( not ( = ?auto_2476270 ?auto_2476273 ) ) ( not ( = ?auto_2476270 ?auto_2476274 ) ) ( not ( = ?auto_2476270 ?auto_2476275 ) ) ( not ( = ?auto_2476270 ?auto_2476276 ) ) ( not ( = ?auto_2476270 ?auto_2476277 ) ) ( not ( = ?auto_2476270 ?auto_2476278 ) ) ( not ( = ?auto_2476270 ?auto_2476279 ) ) ( not ( = ?auto_2476270 ?auto_2476280 ) ) ( not ( = ?auto_2476270 ?auto_2476281 ) ) ( not ( = ?auto_2476270 ?auto_2476282 ) ) ( not ( = ?auto_2476270 ?auto_2476284 ) ) ( not ( = ?auto_2476272 ?auto_2476273 ) ) ( not ( = ?auto_2476272 ?auto_2476274 ) ) ( not ( = ?auto_2476272 ?auto_2476275 ) ) ( not ( = ?auto_2476272 ?auto_2476276 ) ) ( not ( = ?auto_2476272 ?auto_2476277 ) ) ( not ( = ?auto_2476272 ?auto_2476278 ) ) ( not ( = ?auto_2476272 ?auto_2476279 ) ) ( not ( = ?auto_2476272 ?auto_2476280 ) ) ( not ( = ?auto_2476272 ?auto_2476281 ) ) ( not ( = ?auto_2476272 ?auto_2476282 ) ) ( not ( = ?auto_2476272 ?auto_2476284 ) ) ( not ( = ?auto_2476273 ?auto_2476274 ) ) ( not ( = ?auto_2476273 ?auto_2476275 ) ) ( not ( = ?auto_2476273 ?auto_2476276 ) ) ( not ( = ?auto_2476273 ?auto_2476277 ) ) ( not ( = ?auto_2476273 ?auto_2476278 ) ) ( not ( = ?auto_2476273 ?auto_2476279 ) ) ( not ( = ?auto_2476273 ?auto_2476280 ) ) ( not ( = ?auto_2476273 ?auto_2476281 ) ) ( not ( = ?auto_2476273 ?auto_2476282 ) ) ( not ( = ?auto_2476273 ?auto_2476284 ) ) ( not ( = ?auto_2476274 ?auto_2476275 ) ) ( not ( = ?auto_2476274 ?auto_2476276 ) ) ( not ( = ?auto_2476274 ?auto_2476277 ) ) ( not ( = ?auto_2476274 ?auto_2476278 ) ) ( not ( = ?auto_2476274 ?auto_2476279 ) ) ( not ( = ?auto_2476274 ?auto_2476280 ) ) ( not ( = ?auto_2476274 ?auto_2476281 ) ) ( not ( = ?auto_2476274 ?auto_2476282 ) ) ( not ( = ?auto_2476274 ?auto_2476284 ) ) ( not ( = ?auto_2476275 ?auto_2476276 ) ) ( not ( = ?auto_2476275 ?auto_2476277 ) ) ( not ( = ?auto_2476275 ?auto_2476278 ) ) ( not ( = ?auto_2476275 ?auto_2476279 ) ) ( not ( = ?auto_2476275 ?auto_2476280 ) ) ( not ( = ?auto_2476275 ?auto_2476281 ) ) ( not ( = ?auto_2476275 ?auto_2476282 ) ) ( not ( = ?auto_2476275 ?auto_2476284 ) ) ( not ( = ?auto_2476276 ?auto_2476277 ) ) ( not ( = ?auto_2476276 ?auto_2476278 ) ) ( not ( = ?auto_2476276 ?auto_2476279 ) ) ( not ( = ?auto_2476276 ?auto_2476280 ) ) ( not ( = ?auto_2476276 ?auto_2476281 ) ) ( not ( = ?auto_2476276 ?auto_2476282 ) ) ( not ( = ?auto_2476276 ?auto_2476284 ) ) ( not ( = ?auto_2476277 ?auto_2476278 ) ) ( not ( = ?auto_2476277 ?auto_2476279 ) ) ( not ( = ?auto_2476277 ?auto_2476280 ) ) ( not ( = ?auto_2476277 ?auto_2476281 ) ) ( not ( = ?auto_2476277 ?auto_2476282 ) ) ( not ( = ?auto_2476277 ?auto_2476284 ) ) ( not ( = ?auto_2476278 ?auto_2476279 ) ) ( not ( = ?auto_2476278 ?auto_2476280 ) ) ( not ( = ?auto_2476278 ?auto_2476281 ) ) ( not ( = ?auto_2476278 ?auto_2476282 ) ) ( not ( = ?auto_2476278 ?auto_2476284 ) ) ( not ( = ?auto_2476279 ?auto_2476280 ) ) ( not ( = ?auto_2476279 ?auto_2476281 ) ) ( not ( = ?auto_2476279 ?auto_2476282 ) ) ( not ( = ?auto_2476279 ?auto_2476284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2476280 ?auto_2476281 ?auto_2476282 )
      ( MAKE-15CRATE-VERIFY ?auto_2476267 ?auto_2476268 ?auto_2476269 ?auto_2476271 ?auto_2476270 ?auto_2476272 ?auto_2476273 ?auto_2476274 ?auto_2476275 ?auto_2476276 ?auto_2476277 ?auto_2476278 ?auto_2476279 ?auto_2476280 ?auto_2476281 ?auto_2476282 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2476493 - SURFACE
      ?auto_2476494 - SURFACE
      ?auto_2476495 - SURFACE
      ?auto_2476497 - SURFACE
      ?auto_2476496 - SURFACE
      ?auto_2476498 - SURFACE
      ?auto_2476499 - SURFACE
      ?auto_2476500 - SURFACE
      ?auto_2476501 - SURFACE
      ?auto_2476502 - SURFACE
      ?auto_2476503 - SURFACE
      ?auto_2476504 - SURFACE
      ?auto_2476505 - SURFACE
      ?auto_2476506 - SURFACE
      ?auto_2476507 - SURFACE
      ?auto_2476508 - SURFACE
    )
    :vars
    (
      ?auto_2476510 - HOIST
      ?auto_2476509 - PLACE
      ?auto_2476512 - PLACE
      ?auto_2476514 - HOIST
      ?auto_2476513 - SURFACE
      ?auto_2476511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2476510 ?auto_2476509 ) ( SURFACE-AT ?auto_2476507 ?auto_2476509 ) ( CLEAR ?auto_2476507 ) ( IS-CRATE ?auto_2476508 ) ( not ( = ?auto_2476507 ?auto_2476508 ) ) ( AVAILABLE ?auto_2476510 ) ( ON ?auto_2476507 ?auto_2476506 ) ( not ( = ?auto_2476506 ?auto_2476507 ) ) ( not ( = ?auto_2476506 ?auto_2476508 ) ) ( not ( = ?auto_2476512 ?auto_2476509 ) ) ( HOIST-AT ?auto_2476514 ?auto_2476512 ) ( not ( = ?auto_2476510 ?auto_2476514 ) ) ( AVAILABLE ?auto_2476514 ) ( SURFACE-AT ?auto_2476508 ?auto_2476512 ) ( ON ?auto_2476508 ?auto_2476513 ) ( CLEAR ?auto_2476508 ) ( not ( = ?auto_2476507 ?auto_2476513 ) ) ( not ( = ?auto_2476508 ?auto_2476513 ) ) ( not ( = ?auto_2476506 ?auto_2476513 ) ) ( TRUCK-AT ?auto_2476511 ?auto_2476509 ) ( ON ?auto_2476494 ?auto_2476493 ) ( ON ?auto_2476495 ?auto_2476494 ) ( ON ?auto_2476497 ?auto_2476495 ) ( ON ?auto_2476496 ?auto_2476497 ) ( ON ?auto_2476498 ?auto_2476496 ) ( ON ?auto_2476499 ?auto_2476498 ) ( ON ?auto_2476500 ?auto_2476499 ) ( ON ?auto_2476501 ?auto_2476500 ) ( ON ?auto_2476502 ?auto_2476501 ) ( ON ?auto_2476503 ?auto_2476502 ) ( ON ?auto_2476504 ?auto_2476503 ) ( ON ?auto_2476505 ?auto_2476504 ) ( ON ?auto_2476506 ?auto_2476505 ) ( not ( = ?auto_2476493 ?auto_2476494 ) ) ( not ( = ?auto_2476493 ?auto_2476495 ) ) ( not ( = ?auto_2476493 ?auto_2476497 ) ) ( not ( = ?auto_2476493 ?auto_2476496 ) ) ( not ( = ?auto_2476493 ?auto_2476498 ) ) ( not ( = ?auto_2476493 ?auto_2476499 ) ) ( not ( = ?auto_2476493 ?auto_2476500 ) ) ( not ( = ?auto_2476493 ?auto_2476501 ) ) ( not ( = ?auto_2476493 ?auto_2476502 ) ) ( not ( = ?auto_2476493 ?auto_2476503 ) ) ( not ( = ?auto_2476493 ?auto_2476504 ) ) ( not ( = ?auto_2476493 ?auto_2476505 ) ) ( not ( = ?auto_2476493 ?auto_2476506 ) ) ( not ( = ?auto_2476493 ?auto_2476507 ) ) ( not ( = ?auto_2476493 ?auto_2476508 ) ) ( not ( = ?auto_2476493 ?auto_2476513 ) ) ( not ( = ?auto_2476494 ?auto_2476495 ) ) ( not ( = ?auto_2476494 ?auto_2476497 ) ) ( not ( = ?auto_2476494 ?auto_2476496 ) ) ( not ( = ?auto_2476494 ?auto_2476498 ) ) ( not ( = ?auto_2476494 ?auto_2476499 ) ) ( not ( = ?auto_2476494 ?auto_2476500 ) ) ( not ( = ?auto_2476494 ?auto_2476501 ) ) ( not ( = ?auto_2476494 ?auto_2476502 ) ) ( not ( = ?auto_2476494 ?auto_2476503 ) ) ( not ( = ?auto_2476494 ?auto_2476504 ) ) ( not ( = ?auto_2476494 ?auto_2476505 ) ) ( not ( = ?auto_2476494 ?auto_2476506 ) ) ( not ( = ?auto_2476494 ?auto_2476507 ) ) ( not ( = ?auto_2476494 ?auto_2476508 ) ) ( not ( = ?auto_2476494 ?auto_2476513 ) ) ( not ( = ?auto_2476495 ?auto_2476497 ) ) ( not ( = ?auto_2476495 ?auto_2476496 ) ) ( not ( = ?auto_2476495 ?auto_2476498 ) ) ( not ( = ?auto_2476495 ?auto_2476499 ) ) ( not ( = ?auto_2476495 ?auto_2476500 ) ) ( not ( = ?auto_2476495 ?auto_2476501 ) ) ( not ( = ?auto_2476495 ?auto_2476502 ) ) ( not ( = ?auto_2476495 ?auto_2476503 ) ) ( not ( = ?auto_2476495 ?auto_2476504 ) ) ( not ( = ?auto_2476495 ?auto_2476505 ) ) ( not ( = ?auto_2476495 ?auto_2476506 ) ) ( not ( = ?auto_2476495 ?auto_2476507 ) ) ( not ( = ?auto_2476495 ?auto_2476508 ) ) ( not ( = ?auto_2476495 ?auto_2476513 ) ) ( not ( = ?auto_2476497 ?auto_2476496 ) ) ( not ( = ?auto_2476497 ?auto_2476498 ) ) ( not ( = ?auto_2476497 ?auto_2476499 ) ) ( not ( = ?auto_2476497 ?auto_2476500 ) ) ( not ( = ?auto_2476497 ?auto_2476501 ) ) ( not ( = ?auto_2476497 ?auto_2476502 ) ) ( not ( = ?auto_2476497 ?auto_2476503 ) ) ( not ( = ?auto_2476497 ?auto_2476504 ) ) ( not ( = ?auto_2476497 ?auto_2476505 ) ) ( not ( = ?auto_2476497 ?auto_2476506 ) ) ( not ( = ?auto_2476497 ?auto_2476507 ) ) ( not ( = ?auto_2476497 ?auto_2476508 ) ) ( not ( = ?auto_2476497 ?auto_2476513 ) ) ( not ( = ?auto_2476496 ?auto_2476498 ) ) ( not ( = ?auto_2476496 ?auto_2476499 ) ) ( not ( = ?auto_2476496 ?auto_2476500 ) ) ( not ( = ?auto_2476496 ?auto_2476501 ) ) ( not ( = ?auto_2476496 ?auto_2476502 ) ) ( not ( = ?auto_2476496 ?auto_2476503 ) ) ( not ( = ?auto_2476496 ?auto_2476504 ) ) ( not ( = ?auto_2476496 ?auto_2476505 ) ) ( not ( = ?auto_2476496 ?auto_2476506 ) ) ( not ( = ?auto_2476496 ?auto_2476507 ) ) ( not ( = ?auto_2476496 ?auto_2476508 ) ) ( not ( = ?auto_2476496 ?auto_2476513 ) ) ( not ( = ?auto_2476498 ?auto_2476499 ) ) ( not ( = ?auto_2476498 ?auto_2476500 ) ) ( not ( = ?auto_2476498 ?auto_2476501 ) ) ( not ( = ?auto_2476498 ?auto_2476502 ) ) ( not ( = ?auto_2476498 ?auto_2476503 ) ) ( not ( = ?auto_2476498 ?auto_2476504 ) ) ( not ( = ?auto_2476498 ?auto_2476505 ) ) ( not ( = ?auto_2476498 ?auto_2476506 ) ) ( not ( = ?auto_2476498 ?auto_2476507 ) ) ( not ( = ?auto_2476498 ?auto_2476508 ) ) ( not ( = ?auto_2476498 ?auto_2476513 ) ) ( not ( = ?auto_2476499 ?auto_2476500 ) ) ( not ( = ?auto_2476499 ?auto_2476501 ) ) ( not ( = ?auto_2476499 ?auto_2476502 ) ) ( not ( = ?auto_2476499 ?auto_2476503 ) ) ( not ( = ?auto_2476499 ?auto_2476504 ) ) ( not ( = ?auto_2476499 ?auto_2476505 ) ) ( not ( = ?auto_2476499 ?auto_2476506 ) ) ( not ( = ?auto_2476499 ?auto_2476507 ) ) ( not ( = ?auto_2476499 ?auto_2476508 ) ) ( not ( = ?auto_2476499 ?auto_2476513 ) ) ( not ( = ?auto_2476500 ?auto_2476501 ) ) ( not ( = ?auto_2476500 ?auto_2476502 ) ) ( not ( = ?auto_2476500 ?auto_2476503 ) ) ( not ( = ?auto_2476500 ?auto_2476504 ) ) ( not ( = ?auto_2476500 ?auto_2476505 ) ) ( not ( = ?auto_2476500 ?auto_2476506 ) ) ( not ( = ?auto_2476500 ?auto_2476507 ) ) ( not ( = ?auto_2476500 ?auto_2476508 ) ) ( not ( = ?auto_2476500 ?auto_2476513 ) ) ( not ( = ?auto_2476501 ?auto_2476502 ) ) ( not ( = ?auto_2476501 ?auto_2476503 ) ) ( not ( = ?auto_2476501 ?auto_2476504 ) ) ( not ( = ?auto_2476501 ?auto_2476505 ) ) ( not ( = ?auto_2476501 ?auto_2476506 ) ) ( not ( = ?auto_2476501 ?auto_2476507 ) ) ( not ( = ?auto_2476501 ?auto_2476508 ) ) ( not ( = ?auto_2476501 ?auto_2476513 ) ) ( not ( = ?auto_2476502 ?auto_2476503 ) ) ( not ( = ?auto_2476502 ?auto_2476504 ) ) ( not ( = ?auto_2476502 ?auto_2476505 ) ) ( not ( = ?auto_2476502 ?auto_2476506 ) ) ( not ( = ?auto_2476502 ?auto_2476507 ) ) ( not ( = ?auto_2476502 ?auto_2476508 ) ) ( not ( = ?auto_2476502 ?auto_2476513 ) ) ( not ( = ?auto_2476503 ?auto_2476504 ) ) ( not ( = ?auto_2476503 ?auto_2476505 ) ) ( not ( = ?auto_2476503 ?auto_2476506 ) ) ( not ( = ?auto_2476503 ?auto_2476507 ) ) ( not ( = ?auto_2476503 ?auto_2476508 ) ) ( not ( = ?auto_2476503 ?auto_2476513 ) ) ( not ( = ?auto_2476504 ?auto_2476505 ) ) ( not ( = ?auto_2476504 ?auto_2476506 ) ) ( not ( = ?auto_2476504 ?auto_2476507 ) ) ( not ( = ?auto_2476504 ?auto_2476508 ) ) ( not ( = ?auto_2476504 ?auto_2476513 ) ) ( not ( = ?auto_2476505 ?auto_2476506 ) ) ( not ( = ?auto_2476505 ?auto_2476507 ) ) ( not ( = ?auto_2476505 ?auto_2476508 ) ) ( not ( = ?auto_2476505 ?auto_2476513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2476506 ?auto_2476507 ?auto_2476508 )
      ( MAKE-15CRATE-VERIFY ?auto_2476493 ?auto_2476494 ?auto_2476495 ?auto_2476497 ?auto_2476496 ?auto_2476498 ?auto_2476499 ?auto_2476500 ?auto_2476501 ?auto_2476502 ?auto_2476503 ?auto_2476504 ?auto_2476505 ?auto_2476506 ?auto_2476507 ?auto_2476508 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2476719 - SURFACE
      ?auto_2476720 - SURFACE
      ?auto_2476721 - SURFACE
      ?auto_2476723 - SURFACE
      ?auto_2476722 - SURFACE
      ?auto_2476724 - SURFACE
      ?auto_2476725 - SURFACE
      ?auto_2476726 - SURFACE
      ?auto_2476727 - SURFACE
      ?auto_2476728 - SURFACE
      ?auto_2476729 - SURFACE
      ?auto_2476730 - SURFACE
      ?auto_2476731 - SURFACE
      ?auto_2476732 - SURFACE
      ?auto_2476733 - SURFACE
      ?auto_2476734 - SURFACE
    )
    :vars
    (
      ?auto_2476739 - HOIST
      ?auto_2476740 - PLACE
      ?auto_2476736 - PLACE
      ?auto_2476737 - HOIST
      ?auto_2476735 - SURFACE
      ?auto_2476738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2476739 ?auto_2476740 ) ( IS-CRATE ?auto_2476734 ) ( not ( = ?auto_2476733 ?auto_2476734 ) ) ( not ( = ?auto_2476732 ?auto_2476733 ) ) ( not ( = ?auto_2476732 ?auto_2476734 ) ) ( not ( = ?auto_2476736 ?auto_2476740 ) ) ( HOIST-AT ?auto_2476737 ?auto_2476736 ) ( not ( = ?auto_2476739 ?auto_2476737 ) ) ( AVAILABLE ?auto_2476737 ) ( SURFACE-AT ?auto_2476734 ?auto_2476736 ) ( ON ?auto_2476734 ?auto_2476735 ) ( CLEAR ?auto_2476734 ) ( not ( = ?auto_2476733 ?auto_2476735 ) ) ( not ( = ?auto_2476734 ?auto_2476735 ) ) ( not ( = ?auto_2476732 ?auto_2476735 ) ) ( TRUCK-AT ?auto_2476738 ?auto_2476740 ) ( SURFACE-AT ?auto_2476732 ?auto_2476740 ) ( CLEAR ?auto_2476732 ) ( LIFTING ?auto_2476739 ?auto_2476733 ) ( IS-CRATE ?auto_2476733 ) ( ON ?auto_2476720 ?auto_2476719 ) ( ON ?auto_2476721 ?auto_2476720 ) ( ON ?auto_2476723 ?auto_2476721 ) ( ON ?auto_2476722 ?auto_2476723 ) ( ON ?auto_2476724 ?auto_2476722 ) ( ON ?auto_2476725 ?auto_2476724 ) ( ON ?auto_2476726 ?auto_2476725 ) ( ON ?auto_2476727 ?auto_2476726 ) ( ON ?auto_2476728 ?auto_2476727 ) ( ON ?auto_2476729 ?auto_2476728 ) ( ON ?auto_2476730 ?auto_2476729 ) ( ON ?auto_2476731 ?auto_2476730 ) ( ON ?auto_2476732 ?auto_2476731 ) ( not ( = ?auto_2476719 ?auto_2476720 ) ) ( not ( = ?auto_2476719 ?auto_2476721 ) ) ( not ( = ?auto_2476719 ?auto_2476723 ) ) ( not ( = ?auto_2476719 ?auto_2476722 ) ) ( not ( = ?auto_2476719 ?auto_2476724 ) ) ( not ( = ?auto_2476719 ?auto_2476725 ) ) ( not ( = ?auto_2476719 ?auto_2476726 ) ) ( not ( = ?auto_2476719 ?auto_2476727 ) ) ( not ( = ?auto_2476719 ?auto_2476728 ) ) ( not ( = ?auto_2476719 ?auto_2476729 ) ) ( not ( = ?auto_2476719 ?auto_2476730 ) ) ( not ( = ?auto_2476719 ?auto_2476731 ) ) ( not ( = ?auto_2476719 ?auto_2476732 ) ) ( not ( = ?auto_2476719 ?auto_2476733 ) ) ( not ( = ?auto_2476719 ?auto_2476734 ) ) ( not ( = ?auto_2476719 ?auto_2476735 ) ) ( not ( = ?auto_2476720 ?auto_2476721 ) ) ( not ( = ?auto_2476720 ?auto_2476723 ) ) ( not ( = ?auto_2476720 ?auto_2476722 ) ) ( not ( = ?auto_2476720 ?auto_2476724 ) ) ( not ( = ?auto_2476720 ?auto_2476725 ) ) ( not ( = ?auto_2476720 ?auto_2476726 ) ) ( not ( = ?auto_2476720 ?auto_2476727 ) ) ( not ( = ?auto_2476720 ?auto_2476728 ) ) ( not ( = ?auto_2476720 ?auto_2476729 ) ) ( not ( = ?auto_2476720 ?auto_2476730 ) ) ( not ( = ?auto_2476720 ?auto_2476731 ) ) ( not ( = ?auto_2476720 ?auto_2476732 ) ) ( not ( = ?auto_2476720 ?auto_2476733 ) ) ( not ( = ?auto_2476720 ?auto_2476734 ) ) ( not ( = ?auto_2476720 ?auto_2476735 ) ) ( not ( = ?auto_2476721 ?auto_2476723 ) ) ( not ( = ?auto_2476721 ?auto_2476722 ) ) ( not ( = ?auto_2476721 ?auto_2476724 ) ) ( not ( = ?auto_2476721 ?auto_2476725 ) ) ( not ( = ?auto_2476721 ?auto_2476726 ) ) ( not ( = ?auto_2476721 ?auto_2476727 ) ) ( not ( = ?auto_2476721 ?auto_2476728 ) ) ( not ( = ?auto_2476721 ?auto_2476729 ) ) ( not ( = ?auto_2476721 ?auto_2476730 ) ) ( not ( = ?auto_2476721 ?auto_2476731 ) ) ( not ( = ?auto_2476721 ?auto_2476732 ) ) ( not ( = ?auto_2476721 ?auto_2476733 ) ) ( not ( = ?auto_2476721 ?auto_2476734 ) ) ( not ( = ?auto_2476721 ?auto_2476735 ) ) ( not ( = ?auto_2476723 ?auto_2476722 ) ) ( not ( = ?auto_2476723 ?auto_2476724 ) ) ( not ( = ?auto_2476723 ?auto_2476725 ) ) ( not ( = ?auto_2476723 ?auto_2476726 ) ) ( not ( = ?auto_2476723 ?auto_2476727 ) ) ( not ( = ?auto_2476723 ?auto_2476728 ) ) ( not ( = ?auto_2476723 ?auto_2476729 ) ) ( not ( = ?auto_2476723 ?auto_2476730 ) ) ( not ( = ?auto_2476723 ?auto_2476731 ) ) ( not ( = ?auto_2476723 ?auto_2476732 ) ) ( not ( = ?auto_2476723 ?auto_2476733 ) ) ( not ( = ?auto_2476723 ?auto_2476734 ) ) ( not ( = ?auto_2476723 ?auto_2476735 ) ) ( not ( = ?auto_2476722 ?auto_2476724 ) ) ( not ( = ?auto_2476722 ?auto_2476725 ) ) ( not ( = ?auto_2476722 ?auto_2476726 ) ) ( not ( = ?auto_2476722 ?auto_2476727 ) ) ( not ( = ?auto_2476722 ?auto_2476728 ) ) ( not ( = ?auto_2476722 ?auto_2476729 ) ) ( not ( = ?auto_2476722 ?auto_2476730 ) ) ( not ( = ?auto_2476722 ?auto_2476731 ) ) ( not ( = ?auto_2476722 ?auto_2476732 ) ) ( not ( = ?auto_2476722 ?auto_2476733 ) ) ( not ( = ?auto_2476722 ?auto_2476734 ) ) ( not ( = ?auto_2476722 ?auto_2476735 ) ) ( not ( = ?auto_2476724 ?auto_2476725 ) ) ( not ( = ?auto_2476724 ?auto_2476726 ) ) ( not ( = ?auto_2476724 ?auto_2476727 ) ) ( not ( = ?auto_2476724 ?auto_2476728 ) ) ( not ( = ?auto_2476724 ?auto_2476729 ) ) ( not ( = ?auto_2476724 ?auto_2476730 ) ) ( not ( = ?auto_2476724 ?auto_2476731 ) ) ( not ( = ?auto_2476724 ?auto_2476732 ) ) ( not ( = ?auto_2476724 ?auto_2476733 ) ) ( not ( = ?auto_2476724 ?auto_2476734 ) ) ( not ( = ?auto_2476724 ?auto_2476735 ) ) ( not ( = ?auto_2476725 ?auto_2476726 ) ) ( not ( = ?auto_2476725 ?auto_2476727 ) ) ( not ( = ?auto_2476725 ?auto_2476728 ) ) ( not ( = ?auto_2476725 ?auto_2476729 ) ) ( not ( = ?auto_2476725 ?auto_2476730 ) ) ( not ( = ?auto_2476725 ?auto_2476731 ) ) ( not ( = ?auto_2476725 ?auto_2476732 ) ) ( not ( = ?auto_2476725 ?auto_2476733 ) ) ( not ( = ?auto_2476725 ?auto_2476734 ) ) ( not ( = ?auto_2476725 ?auto_2476735 ) ) ( not ( = ?auto_2476726 ?auto_2476727 ) ) ( not ( = ?auto_2476726 ?auto_2476728 ) ) ( not ( = ?auto_2476726 ?auto_2476729 ) ) ( not ( = ?auto_2476726 ?auto_2476730 ) ) ( not ( = ?auto_2476726 ?auto_2476731 ) ) ( not ( = ?auto_2476726 ?auto_2476732 ) ) ( not ( = ?auto_2476726 ?auto_2476733 ) ) ( not ( = ?auto_2476726 ?auto_2476734 ) ) ( not ( = ?auto_2476726 ?auto_2476735 ) ) ( not ( = ?auto_2476727 ?auto_2476728 ) ) ( not ( = ?auto_2476727 ?auto_2476729 ) ) ( not ( = ?auto_2476727 ?auto_2476730 ) ) ( not ( = ?auto_2476727 ?auto_2476731 ) ) ( not ( = ?auto_2476727 ?auto_2476732 ) ) ( not ( = ?auto_2476727 ?auto_2476733 ) ) ( not ( = ?auto_2476727 ?auto_2476734 ) ) ( not ( = ?auto_2476727 ?auto_2476735 ) ) ( not ( = ?auto_2476728 ?auto_2476729 ) ) ( not ( = ?auto_2476728 ?auto_2476730 ) ) ( not ( = ?auto_2476728 ?auto_2476731 ) ) ( not ( = ?auto_2476728 ?auto_2476732 ) ) ( not ( = ?auto_2476728 ?auto_2476733 ) ) ( not ( = ?auto_2476728 ?auto_2476734 ) ) ( not ( = ?auto_2476728 ?auto_2476735 ) ) ( not ( = ?auto_2476729 ?auto_2476730 ) ) ( not ( = ?auto_2476729 ?auto_2476731 ) ) ( not ( = ?auto_2476729 ?auto_2476732 ) ) ( not ( = ?auto_2476729 ?auto_2476733 ) ) ( not ( = ?auto_2476729 ?auto_2476734 ) ) ( not ( = ?auto_2476729 ?auto_2476735 ) ) ( not ( = ?auto_2476730 ?auto_2476731 ) ) ( not ( = ?auto_2476730 ?auto_2476732 ) ) ( not ( = ?auto_2476730 ?auto_2476733 ) ) ( not ( = ?auto_2476730 ?auto_2476734 ) ) ( not ( = ?auto_2476730 ?auto_2476735 ) ) ( not ( = ?auto_2476731 ?auto_2476732 ) ) ( not ( = ?auto_2476731 ?auto_2476733 ) ) ( not ( = ?auto_2476731 ?auto_2476734 ) ) ( not ( = ?auto_2476731 ?auto_2476735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2476732 ?auto_2476733 ?auto_2476734 )
      ( MAKE-15CRATE-VERIFY ?auto_2476719 ?auto_2476720 ?auto_2476721 ?auto_2476723 ?auto_2476722 ?auto_2476724 ?auto_2476725 ?auto_2476726 ?auto_2476727 ?auto_2476728 ?auto_2476729 ?auto_2476730 ?auto_2476731 ?auto_2476732 ?auto_2476733 ?auto_2476734 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2476945 - SURFACE
      ?auto_2476946 - SURFACE
      ?auto_2476947 - SURFACE
      ?auto_2476949 - SURFACE
      ?auto_2476948 - SURFACE
      ?auto_2476950 - SURFACE
      ?auto_2476951 - SURFACE
      ?auto_2476952 - SURFACE
      ?auto_2476953 - SURFACE
      ?auto_2476954 - SURFACE
      ?auto_2476955 - SURFACE
      ?auto_2476956 - SURFACE
      ?auto_2476957 - SURFACE
      ?auto_2476958 - SURFACE
      ?auto_2476959 - SURFACE
      ?auto_2476960 - SURFACE
    )
    :vars
    (
      ?auto_2476961 - HOIST
      ?auto_2476964 - PLACE
      ?auto_2476966 - PLACE
      ?auto_2476965 - HOIST
      ?auto_2476962 - SURFACE
      ?auto_2476963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2476961 ?auto_2476964 ) ( IS-CRATE ?auto_2476960 ) ( not ( = ?auto_2476959 ?auto_2476960 ) ) ( not ( = ?auto_2476958 ?auto_2476959 ) ) ( not ( = ?auto_2476958 ?auto_2476960 ) ) ( not ( = ?auto_2476966 ?auto_2476964 ) ) ( HOIST-AT ?auto_2476965 ?auto_2476966 ) ( not ( = ?auto_2476961 ?auto_2476965 ) ) ( AVAILABLE ?auto_2476965 ) ( SURFACE-AT ?auto_2476960 ?auto_2476966 ) ( ON ?auto_2476960 ?auto_2476962 ) ( CLEAR ?auto_2476960 ) ( not ( = ?auto_2476959 ?auto_2476962 ) ) ( not ( = ?auto_2476960 ?auto_2476962 ) ) ( not ( = ?auto_2476958 ?auto_2476962 ) ) ( TRUCK-AT ?auto_2476963 ?auto_2476964 ) ( SURFACE-AT ?auto_2476958 ?auto_2476964 ) ( CLEAR ?auto_2476958 ) ( IS-CRATE ?auto_2476959 ) ( AVAILABLE ?auto_2476961 ) ( IN ?auto_2476959 ?auto_2476963 ) ( ON ?auto_2476946 ?auto_2476945 ) ( ON ?auto_2476947 ?auto_2476946 ) ( ON ?auto_2476949 ?auto_2476947 ) ( ON ?auto_2476948 ?auto_2476949 ) ( ON ?auto_2476950 ?auto_2476948 ) ( ON ?auto_2476951 ?auto_2476950 ) ( ON ?auto_2476952 ?auto_2476951 ) ( ON ?auto_2476953 ?auto_2476952 ) ( ON ?auto_2476954 ?auto_2476953 ) ( ON ?auto_2476955 ?auto_2476954 ) ( ON ?auto_2476956 ?auto_2476955 ) ( ON ?auto_2476957 ?auto_2476956 ) ( ON ?auto_2476958 ?auto_2476957 ) ( not ( = ?auto_2476945 ?auto_2476946 ) ) ( not ( = ?auto_2476945 ?auto_2476947 ) ) ( not ( = ?auto_2476945 ?auto_2476949 ) ) ( not ( = ?auto_2476945 ?auto_2476948 ) ) ( not ( = ?auto_2476945 ?auto_2476950 ) ) ( not ( = ?auto_2476945 ?auto_2476951 ) ) ( not ( = ?auto_2476945 ?auto_2476952 ) ) ( not ( = ?auto_2476945 ?auto_2476953 ) ) ( not ( = ?auto_2476945 ?auto_2476954 ) ) ( not ( = ?auto_2476945 ?auto_2476955 ) ) ( not ( = ?auto_2476945 ?auto_2476956 ) ) ( not ( = ?auto_2476945 ?auto_2476957 ) ) ( not ( = ?auto_2476945 ?auto_2476958 ) ) ( not ( = ?auto_2476945 ?auto_2476959 ) ) ( not ( = ?auto_2476945 ?auto_2476960 ) ) ( not ( = ?auto_2476945 ?auto_2476962 ) ) ( not ( = ?auto_2476946 ?auto_2476947 ) ) ( not ( = ?auto_2476946 ?auto_2476949 ) ) ( not ( = ?auto_2476946 ?auto_2476948 ) ) ( not ( = ?auto_2476946 ?auto_2476950 ) ) ( not ( = ?auto_2476946 ?auto_2476951 ) ) ( not ( = ?auto_2476946 ?auto_2476952 ) ) ( not ( = ?auto_2476946 ?auto_2476953 ) ) ( not ( = ?auto_2476946 ?auto_2476954 ) ) ( not ( = ?auto_2476946 ?auto_2476955 ) ) ( not ( = ?auto_2476946 ?auto_2476956 ) ) ( not ( = ?auto_2476946 ?auto_2476957 ) ) ( not ( = ?auto_2476946 ?auto_2476958 ) ) ( not ( = ?auto_2476946 ?auto_2476959 ) ) ( not ( = ?auto_2476946 ?auto_2476960 ) ) ( not ( = ?auto_2476946 ?auto_2476962 ) ) ( not ( = ?auto_2476947 ?auto_2476949 ) ) ( not ( = ?auto_2476947 ?auto_2476948 ) ) ( not ( = ?auto_2476947 ?auto_2476950 ) ) ( not ( = ?auto_2476947 ?auto_2476951 ) ) ( not ( = ?auto_2476947 ?auto_2476952 ) ) ( not ( = ?auto_2476947 ?auto_2476953 ) ) ( not ( = ?auto_2476947 ?auto_2476954 ) ) ( not ( = ?auto_2476947 ?auto_2476955 ) ) ( not ( = ?auto_2476947 ?auto_2476956 ) ) ( not ( = ?auto_2476947 ?auto_2476957 ) ) ( not ( = ?auto_2476947 ?auto_2476958 ) ) ( not ( = ?auto_2476947 ?auto_2476959 ) ) ( not ( = ?auto_2476947 ?auto_2476960 ) ) ( not ( = ?auto_2476947 ?auto_2476962 ) ) ( not ( = ?auto_2476949 ?auto_2476948 ) ) ( not ( = ?auto_2476949 ?auto_2476950 ) ) ( not ( = ?auto_2476949 ?auto_2476951 ) ) ( not ( = ?auto_2476949 ?auto_2476952 ) ) ( not ( = ?auto_2476949 ?auto_2476953 ) ) ( not ( = ?auto_2476949 ?auto_2476954 ) ) ( not ( = ?auto_2476949 ?auto_2476955 ) ) ( not ( = ?auto_2476949 ?auto_2476956 ) ) ( not ( = ?auto_2476949 ?auto_2476957 ) ) ( not ( = ?auto_2476949 ?auto_2476958 ) ) ( not ( = ?auto_2476949 ?auto_2476959 ) ) ( not ( = ?auto_2476949 ?auto_2476960 ) ) ( not ( = ?auto_2476949 ?auto_2476962 ) ) ( not ( = ?auto_2476948 ?auto_2476950 ) ) ( not ( = ?auto_2476948 ?auto_2476951 ) ) ( not ( = ?auto_2476948 ?auto_2476952 ) ) ( not ( = ?auto_2476948 ?auto_2476953 ) ) ( not ( = ?auto_2476948 ?auto_2476954 ) ) ( not ( = ?auto_2476948 ?auto_2476955 ) ) ( not ( = ?auto_2476948 ?auto_2476956 ) ) ( not ( = ?auto_2476948 ?auto_2476957 ) ) ( not ( = ?auto_2476948 ?auto_2476958 ) ) ( not ( = ?auto_2476948 ?auto_2476959 ) ) ( not ( = ?auto_2476948 ?auto_2476960 ) ) ( not ( = ?auto_2476948 ?auto_2476962 ) ) ( not ( = ?auto_2476950 ?auto_2476951 ) ) ( not ( = ?auto_2476950 ?auto_2476952 ) ) ( not ( = ?auto_2476950 ?auto_2476953 ) ) ( not ( = ?auto_2476950 ?auto_2476954 ) ) ( not ( = ?auto_2476950 ?auto_2476955 ) ) ( not ( = ?auto_2476950 ?auto_2476956 ) ) ( not ( = ?auto_2476950 ?auto_2476957 ) ) ( not ( = ?auto_2476950 ?auto_2476958 ) ) ( not ( = ?auto_2476950 ?auto_2476959 ) ) ( not ( = ?auto_2476950 ?auto_2476960 ) ) ( not ( = ?auto_2476950 ?auto_2476962 ) ) ( not ( = ?auto_2476951 ?auto_2476952 ) ) ( not ( = ?auto_2476951 ?auto_2476953 ) ) ( not ( = ?auto_2476951 ?auto_2476954 ) ) ( not ( = ?auto_2476951 ?auto_2476955 ) ) ( not ( = ?auto_2476951 ?auto_2476956 ) ) ( not ( = ?auto_2476951 ?auto_2476957 ) ) ( not ( = ?auto_2476951 ?auto_2476958 ) ) ( not ( = ?auto_2476951 ?auto_2476959 ) ) ( not ( = ?auto_2476951 ?auto_2476960 ) ) ( not ( = ?auto_2476951 ?auto_2476962 ) ) ( not ( = ?auto_2476952 ?auto_2476953 ) ) ( not ( = ?auto_2476952 ?auto_2476954 ) ) ( not ( = ?auto_2476952 ?auto_2476955 ) ) ( not ( = ?auto_2476952 ?auto_2476956 ) ) ( not ( = ?auto_2476952 ?auto_2476957 ) ) ( not ( = ?auto_2476952 ?auto_2476958 ) ) ( not ( = ?auto_2476952 ?auto_2476959 ) ) ( not ( = ?auto_2476952 ?auto_2476960 ) ) ( not ( = ?auto_2476952 ?auto_2476962 ) ) ( not ( = ?auto_2476953 ?auto_2476954 ) ) ( not ( = ?auto_2476953 ?auto_2476955 ) ) ( not ( = ?auto_2476953 ?auto_2476956 ) ) ( not ( = ?auto_2476953 ?auto_2476957 ) ) ( not ( = ?auto_2476953 ?auto_2476958 ) ) ( not ( = ?auto_2476953 ?auto_2476959 ) ) ( not ( = ?auto_2476953 ?auto_2476960 ) ) ( not ( = ?auto_2476953 ?auto_2476962 ) ) ( not ( = ?auto_2476954 ?auto_2476955 ) ) ( not ( = ?auto_2476954 ?auto_2476956 ) ) ( not ( = ?auto_2476954 ?auto_2476957 ) ) ( not ( = ?auto_2476954 ?auto_2476958 ) ) ( not ( = ?auto_2476954 ?auto_2476959 ) ) ( not ( = ?auto_2476954 ?auto_2476960 ) ) ( not ( = ?auto_2476954 ?auto_2476962 ) ) ( not ( = ?auto_2476955 ?auto_2476956 ) ) ( not ( = ?auto_2476955 ?auto_2476957 ) ) ( not ( = ?auto_2476955 ?auto_2476958 ) ) ( not ( = ?auto_2476955 ?auto_2476959 ) ) ( not ( = ?auto_2476955 ?auto_2476960 ) ) ( not ( = ?auto_2476955 ?auto_2476962 ) ) ( not ( = ?auto_2476956 ?auto_2476957 ) ) ( not ( = ?auto_2476956 ?auto_2476958 ) ) ( not ( = ?auto_2476956 ?auto_2476959 ) ) ( not ( = ?auto_2476956 ?auto_2476960 ) ) ( not ( = ?auto_2476956 ?auto_2476962 ) ) ( not ( = ?auto_2476957 ?auto_2476958 ) ) ( not ( = ?auto_2476957 ?auto_2476959 ) ) ( not ( = ?auto_2476957 ?auto_2476960 ) ) ( not ( = ?auto_2476957 ?auto_2476962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2476958 ?auto_2476959 ?auto_2476960 )
      ( MAKE-15CRATE-VERIFY ?auto_2476945 ?auto_2476946 ?auto_2476947 ?auto_2476949 ?auto_2476948 ?auto_2476950 ?auto_2476951 ?auto_2476952 ?auto_2476953 ?auto_2476954 ?auto_2476955 ?auto_2476956 ?auto_2476957 ?auto_2476958 ?auto_2476959 ?auto_2476960 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2497504 - SURFACE
      ?auto_2497505 - SURFACE
      ?auto_2497506 - SURFACE
      ?auto_2497508 - SURFACE
      ?auto_2497507 - SURFACE
      ?auto_2497509 - SURFACE
      ?auto_2497510 - SURFACE
      ?auto_2497511 - SURFACE
      ?auto_2497512 - SURFACE
      ?auto_2497513 - SURFACE
      ?auto_2497514 - SURFACE
      ?auto_2497515 - SURFACE
      ?auto_2497516 - SURFACE
      ?auto_2497517 - SURFACE
      ?auto_2497518 - SURFACE
      ?auto_2497519 - SURFACE
      ?auto_2497520 - SURFACE
    )
    :vars
    (
      ?auto_2497521 - HOIST
      ?auto_2497522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2497521 ?auto_2497522 ) ( SURFACE-AT ?auto_2497519 ?auto_2497522 ) ( CLEAR ?auto_2497519 ) ( LIFTING ?auto_2497521 ?auto_2497520 ) ( IS-CRATE ?auto_2497520 ) ( not ( = ?auto_2497519 ?auto_2497520 ) ) ( ON ?auto_2497505 ?auto_2497504 ) ( ON ?auto_2497506 ?auto_2497505 ) ( ON ?auto_2497508 ?auto_2497506 ) ( ON ?auto_2497507 ?auto_2497508 ) ( ON ?auto_2497509 ?auto_2497507 ) ( ON ?auto_2497510 ?auto_2497509 ) ( ON ?auto_2497511 ?auto_2497510 ) ( ON ?auto_2497512 ?auto_2497511 ) ( ON ?auto_2497513 ?auto_2497512 ) ( ON ?auto_2497514 ?auto_2497513 ) ( ON ?auto_2497515 ?auto_2497514 ) ( ON ?auto_2497516 ?auto_2497515 ) ( ON ?auto_2497517 ?auto_2497516 ) ( ON ?auto_2497518 ?auto_2497517 ) ( ON ?auto_2497519 ?auto_2497518 ) ( not ( = ?auto_2497504 ?auto_2497505 ) ) ( not ( = ?auto_2497504 ?auto_2497506 ) ) ( not ( = ?auto_2497504 ?auto_2497508 ) ) ( not ( = ?auto_2497504 ?auto_2497507 ) ) ( not ( = ?auto_2497504 ?auto_2497509 ) ) ( not ( = ?auto_2497504 ?auto_2497510 ) ) ( not ( = ?auto_2497504 ?auto_2497511 ) ) ( not ( = ?auto_2497504 ?auto_2497512 ) ) ( not ( = ?auto_2497504 ?auto_2497513 ) ) ( not ( = ?auto_2497504 ?auto_2497514 ) ) ( not ( = ?auto_2497504 ?auto_2497515 ) ) ( not ( = ?auto_2497504 ?auto_2497516 ) ) ( not ( = ?auto_2497504 ?auto_2497517 ) ) ( not ( = ?auto_2497504 ?auto_2497518 ) ) ( not ( = ?auto_2497504 ?auto_2497519 ) ) ( not ( = ?auto_2497504 ?auto_2497520 ) ) ( not ( = ?auto_2497505 ?auto_2497506 ) ) ( not ( = ?auto_2497505 ?auto_2497508 ) ) ( not ( = ?auto_2497505 ?auto_2497507 ) ) ( not ( = ?auto_2497505 ?auto_2497509 ) ) ( not ( = ?auto_2497505 ?auto_2497510 ) ) ( not ( = ?auto_2497505 ?auto_2497511 ) ) ( not ( = ?auto_2497505 ?auto_2497512 ) ) ( not ( = ?auto_2497505 ?auto_2497513 ) ) ( not ( = ?auto_2497505 ?auto_2497514 ) ) ( not ( = ?auto_2497505 ?auto_2497515 ) ) ( not ( = ?auto_2497505 ?auto_2497516 ) ) ( not ( = ?auto_2497505 ?auto_2497517 ) ) ( not ( = ?auto_2497505 ?auto_2497518 ) ) ( not ( = ?auto_2497505 ?auto_2497519 ) ) ( not ( = ?auto_2497505 ?auto_2497520 ) ) ( not ( = ?auto_2497506 ?auto_2497508 ) ) ( not ( = ?auto_2497506 ?auto_2497507 ) ) ( not ( = ?auto_2497506 ?auto_2497509 ) ) ( not ( = ?auto_2497506 ?auto_2497510 ) ) ( not ( = ?auto_2497506 ?auto_2497511 ) ) ( not ( = ?auto_2497506 ?auto_2497512 ) ) ( not ( = ?auto_2497506 ?auto_2497513 ) ) ( not ( = ?auto_2497506 ?auto_2497514 ) ) ( not ( = ?auto_2497506 ?auto_2497515 ) ) ( not ( = ?auto_2497506 ?auto_2497516 ) ) ( not ( = ?auto_2497506 ?auto_2497517 ) ) ( not ( = ?auto_2497506 ?auto_2497518 ) ) ( not ( = ?auto_2497506 ?auto_2497519 ) ) ( not ( = ?auto_2497506 ?auto_2497520 ) ) ( not ( = ?auto_2497508 ?auto_2497507 ) ) ( not ( = ?auto_2497508 ?auto_2497509 ) ) ( not ( = ?auto_2497508 ?auto_2497510 ) ) ( not ( = ?auto_2497508 ?auto_2497511 ) ) ( not ( = ?auto_2497508 ?auto_2497512 ) ) ( not ( = ?auto_2497508 ?auto_2497513 ) ) ( not ( = ?auto_2497508 ?auto_2497514 ) ) ( not ( = ?auto_2497508 ?auto_2497515 ) ) ( not ( = ?auto_2497508 ?auto_2497516 ) ) ( not ( = ?auto_2497508 ?auto_2497517 ) ) ( not ( = ?auto_2497508 ?auto_2497518 ) ) ( not ( = ?auto_2497508 ?auto_2497519 ) ) ( not ( = ?auto_2497508 ?auto_2497520 ) ) ( not ( = ?auto_2497507 ?auto_2497509 ) ) ( not ( = ?auto_2497507 ?auto_2497510 ) ) ( not ( = ?auto_2497507 ?auto_2497511 ) ) ( not ( = ?auto_2497507 ?auto_2497512 ) ) ( not ( = ?auto_2497507 ?auto_2497513 ) ) ( not ( = ?auto_2497507 ?auto_2497514 ) ) ( not ( = ?auto_2497507 ?auto_2497515 ) ) ( not ( = ?auto_2497507 ?auto_2497516 ) ) ( not ( = ?auto_2497507 ?auto_2497517 ) ) ( not ( = ?auto_2497507 ?auto_2497518 ) ) ( not ( = ?auto_2497507 ?auto_2497519 ) ) ( not ( = ?auto_2497507 ?auto_2497520 ) ) ( not ( = ?auto_2497509 ?auto_2497510 ) ) ( not ( = ?auto_2497509 ?auto_2497511 ) ) ( not ( = ?auto_2497509 ?auto_2497512 ) ) ( not ( = ?auto_2497509 ?auto_2497513 ) ) ( not ( = ?auto_2497509 ?auto_2497514 ) ) ( not ( = ?auto_2497509 ?auto_2497515 ) ) ( not ( = ?auto_2497509 ?auto_2497516 ) ) ( not ( = ?auto_2497509 ?auto_2497517 ) ) ( not ( = ?auto_2497509 ?auto_2497518 ) ) ( not ( = ?auto_2497509 ?auto_2497519 ) ) ( not ( = ?auto_2497509 ?auto_2497520 ) ) ( not ( = ?auto_2497510 ?auto_2497511 ) ) ( not ( = ?auto_2497510 ?auto_2497512 ) ) ( not ( = ?auto_2497510 ?auto_2497513 ) ) ( not ( = ?auto_2497510 ?auto_2497514 ) ) ( not ( = ?auto_2497510 ?auto_2497515 ) ) ( not ( = ?auto_2497510 ?auto_2497516 ) ) ( not ( = ?auto_2497510 ?auto_2497517 ) ) ( not ( = ?auto_2497510 ?auto_2497518 ) ) ( not ( = ?auto_2497510 ?auto_2497519 ) ) ( not ( = ?auto_2497510 ?auto_2497520 ) ) ( not ( = ?auto_2497511 ?auto_2497512 ) ) ( not ( = ?auto_2497511 ?auto_2497513 ) ) ( not ( = ?auto_2497511 ?auto_2497514 ) ) ( not ( = ?auto_2497511 ?auto_2497515 ) ) ( not ( = ?auto_2497511 ?auto_2497516 ) ) ( not ( = ?auto_2497511 ?auto_2497517 ) ) ( not ( = ?auto_2497511 ?auto_2497518 ) ) ( not ( = ?auto_2497511 ?auto_2497519 ) ) ( not ( = ?auto_2497511 ?auto_2497520 ) ) ( not ( = ?auto_2497512 ?auto_2497513 ) ) ( not ( = ?auto_2497512 ?auto_2497514 ) ) ( not ( = ?auto_2497512 ?auto_2497515 ) ) ( not ( = ?auto_2497512 ?auto_2497516 ) ) ( not ( = ?auto_2497512 ?auto_2497517 ) ) ( not ( = ?auto_2497512 ?auto_2497518 ) ) ( not ( = ?auto_2497512 ?auto_2497519 ) ) ( not ( = ?auto_2497512 ?auto_2497520 ) ) ( not ( = ?auto_2497513 ?auto_2497514 ) ) ( not ( = ?auto_2497513 ?auto_2497515 ) ) ( not ( = ?auto_2497513 ?auto_2497516 ) ) ( not ( = ?auto_2497513 ?auto_2497517 ) ) ( not ( = ?auto_2497513 ?auto_2497518 ) ) ( not ( = ?auto_2497513 ?auto_2497519 ) ) ( not ( = ?auto_2497513 ?auto_2497520 ) ) ( not ( = ?auto_2497514 ?auto_2497515 ) ) ( not ( = ?auto_2497514 ?auto_2497516 ) ) ( not ( = ?auto_2497514 ?auto_2497517 ) ) ( not ( = ?auto_2497514 ?auto_2497518 ) ) ( not ( = ?auto_2497514 ?auto_2497519 ) ) ( not ( = ?auto_2497514 ?auto_2497520 ) ) ( not ( = ?auto_2497515 ?auto_2497516 ) ) ( not ( = ?auto_2497515 ?auto_2497517 ) ) ( not ( = ?auto_2497515 ?auto_2497518 ) ) ( not ( = ?auto_2497515 ?auto_2497519 ) ) ( not ( = ?auto_2497515 ?auto_2497520 ) ) ( not ( = ?auto_2497516 ?auto_2497517 ) ) ( not ( = ?auto_2497516 ?auto_2497518 ) ) ( not ( = ?auto_2497516 ?auto_2497519 ) ) ( not ( = ?auto_2497516 ?auto_2497520 ) ) ( not ( = ?auto_2497517 ?auto_2497518 ) ) ( not ( = ?auto_2497517 ?auto_2497519 ) ) ( not ( = ?auto_2497517 ?auto_2497520 ) ) ( not ( = ?auto_2497518 ?auto_2497519 ) ) ( not ( = ?auto_2497518 ?auto_2497520 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2497519 ?auto_2497520 )
      ( MAKE-16CRATE-VERIFY ?auto_2497504 ?auto_2497505 ?auto_2497506 ?auto_2497508 ?auto_2497507 ?auto_2497509 ?auto_2497510 ?auto_2497511 ?auto_2497512 ?auto_2497513 ?auto_2497514 ?auto_2497515 ?auto_2497516 ?auto_2497517 ?auto_2497518 ?auto_2497519 ?auto_2497520 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2497703 - SURFACE
      ?auto_2497704 - SURFACE
      ?auto_2497705 - SURFACE
      ?auto_2497707 - SURFACE
      ?auto_2497706 - SURFACE
      ?auto_2497708 - SURFACE
      ?auto_2497709 - SURFACE
      ?auto_2497710 - SURFACE
      ?auto_2497711 - SURFACE
      ?auto_2497712 - SURFACE
      ?auto_2497713 - SURFACE
      ?auto_2497714 - SURFACE
      ?auto_2497715 - SURFACE
      ?auto_2497716 - SURFACE
      ?auto_2497717 - SURFACE
      ?auto_2497718 - SURFACE
      ?auto_2497719 - SURFACE
    )
    :vars
    (
      ?auto_2497722 - HOIST
      ?auto_2497720 - PLACE
      ?auto_2497721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2497722 ?auto_2497720 ) ( SURFACE-AT ?auto_2497718 ?auto_2497720 ) ( CLEAR ?auto_2497718 ) ( IS-CRATE ?auto_2497719 ) ( not ( = ?auto_2497718 ?auto_2497719 ) ) ( TRUCK-AT ?auto_2497721 ?auto_2497720 ) ( AVAILABLE ?auto_2497722 ) ( IN ?auto_2497719 ?auto_2497721 ) ( ON ?auto_2497718 ?auto_2497717 ) ( not ( = ?auto_2497717 ?auto_2497718 ) ) ( not ( = ?auto_2497717 ?auto_2497719 ) ) ( ON ?auto_2497704 ?auto_2497703 ) ( ON ?auto_2497705 ?auto_2497704 ) ( ON ?auto_2497707 ?auto_2497705 ) ( ON ?auto_2497706 ?auto_2497707 ) ( ON ?auto_2497708 ?auto_2497706 ) ( ON ?auto_2497709 ?auto_2497708 ) ( ON ?auto_2497710 ?auto_2497709 ) ( ON ?auto_2497711 ?auto_2497710 ) ( ON ?auto_2497712 ?auto_2497711 ) ( ON ?auto_2497713 ?auto_2497712 ) ( ON ?auto_2497714 ?auto_2497713 ) ( ON ?auto_2497715 ?auto_2497714 ) ( ON ?auto_2497716 ?auto_2497715 ) ( ON ?auto_2497717 ?auto_2497716 ) ( not ( = ?auto_2497703 ?auto_2497704 ) ) ( not ( = ?auto_2497703 ?auto_2497705 ) ) ( not ( = ?auto_2497703 ?auto_2497707 ) ) ( not ( = ?auto_2497703 ?auto_2497706 ) ) ( not ( = ?auto_2497703 ?auto_2497708 ) ) ( not ( = ?auto_2497703 ?auto_2497709 ) ) ( not ( = ?auto_2497703 ?auto_2497710 ) ) ( not ( = ?auto_2497703 ?auto_2497711 ) ) ( not ( = ?auto_2497703 ?auto_2497712 ) ) ( not ( = ?auto_2497703 ?auto_2497713 ) ) ( not ( = ?auto_2497703 ?auto_2497714 ) ) ( not ( = ?auto_2497703 ?auto_2497715 ) ) ( not ( = ?auto_2497703 ?auto_2497716 ) ) ( not ( = ?auto_2497703 ?auto_2497717 ) ) ( not ( = ?auto_2497703 ?auto_2497718 ) ) ( not ( = ?auto_2497703 ?auto_2497719 ) ) ( not ( = ?auto_2497704 ?auto_2497705 ) ) ( not ( = ?auto_2497704 ?auto_2497707 ) ) ( not ( = ?auto_2497704 ?auto_2497706 ) ) ( not ( = ?auto_2497704 ?auto_2497708 ) ) ( not ( = ?auto_2497704 ?auto_2497709 ) ) ( not ( = ?auto_2497704 ?auto_2497710 ) ) ( not ( = ?auto_2497704 ?auto_2497711 ) ) ( not ( = ?auto_2497704 ?auto_2497712 ) ) ( not ( = ?auto_2497704 ?auto_2497713 ) ) ( not ( = ?auto_2497704 ?auto_2497714 ) ) ( not ( = ?auto_2497704 ?auto_2497715 ) ) ( not ( = ?auto_2497704 ?auto_2497716 ) ) ( not ( = ?auto_2497704 ?auto_2497717 ) ) ( not ( = ?auto_2497704 ?auto_2497718 ) ) ( not ( = ?auto_2497704 ?auto_2497719 ) ) ( not ( = ?auto_2497705 ?auto_2497707 ) ) ( not ( = ?auto_2497705 ?auto_2497706 ) ) ( not ( = ?auto_2497705 ?auto_2497708 ) ) ( not ( = ?auto_2497705 ?auto_2497709 ) ) ( not ( = ?auto_2497705 ?auto_2497710 ) ) ( not ( = ?auto_2497705 ?auto_2497711 ) ) ( not ( = ?auto_2497705 ?auto_2497712 ) ) ( not ( = ?auto_2497705 ?auto_2497713 ) ) ( not ( = ?auto_2497705 ?auto_2497714 ) ) ( not ( = ?auto_2497705 ?auto_2497715 ) ) ( not ( = ?auto_2497705 ?auto_2497716 ) ) ( not ( = ?auto_2497705 ?auto_2497717 ) ) ( not ( = ?auto_2497705 ?auto_2497718 ) ) ( not ( = ?auto_2497705 ?auto_2497719 ) ) ( not ( = ?auto_2497707 ?auto_2497706 ) ) ( not ( = ?auto_2497707 ?auto_2497708 ) ) ( not ( = ?auto_2497707 ?auto_2497709 ) ) ( not ( = ?auto_2497707 ?auto_2497710 ) ) ( not ( = ?auto_2497707 ?auto_2497711 ) ) ( not ( = ?auto_2497707 ?auto_2497712 ) ) ( not ( = ?auto_2497707 ?auto_2497713 ) ) ( not ( = ?auto_2497707 ?auto_2497714 ) ) ( not ( = ?auto_2497707 ?auto_2497715 ) ) ( not ( = ?auto_2497707 ?auto_2497716 ) ) ( not ( = ?auto_2497707 ?auto_2497717 ) ) ( not ( = ?auto_2497707 ?auto_2497718 ) ) ( not ( = ?auto_2497707 ?auto_2497719 ) ) ( not ( = ?auto_2497706 ?auto_2497708 ) ) ( not ( = ?auto_2497706 ?auto_2497709 ) ) ( not ( = ?auto_2497706 ?auto_2497710 ) ) ( not ( = ?auto_2497706 ?auto_2497711 ) ) ( not ( = ?auto_2497706 ?auto_2497712 ) ) ( not ( = ?auto_2497706 ?auto_2497713 ) ) ( not ( = ?auto_2497706 ?auto_2497714 ) ) ( not ( = ?auto_2497706 ?auto_2497715 ) ) ( not ( = ?auto_2497706 ?auto_2497716 ) ) ( not ( = ?auto_2497706 ?auto_2497717 ) ) ( not ( = ?auto_2497706 ?auto_2497718 ) ) ( not ( = ?auto_2497706 ?auto_2497719 ) ) ( not ( = ?auto_2497708 ?auto_2497709 ) ) ( not ( = ?auto_2497708 ?auto_2497710 ) ) ( not ( = ?auto_2497708 ?auto_2497711 ) ) ( not ( = ?auto_2497708 ?auto_2497712 ) ) ( not ( = ?auto_2497708 ?auto_2497713 ) ) ( not ( = ?auto_2497708 ?auto_2497714 ) ) ( not ( = ?auto_2497708 ?auto_2497715 ) ) ( not ( = ?auto_2497708 ?auto_2497716 ) ) ( not ( = ?auto_2497708 ?auto_2497717 ) ) ( not ( = ?auto_2497708 ?auto_2497718 ) ) ( not ( = ?auto_2497708 ?auto_2497719 ) ) ( not ( = ?auto_2497709 ?auto_2497710 ) ) ( not ( = ?auto_2497709 ?auto_2497711 ) ) ( not ( = ?auto_2497709 ?auto_2497712 ) ) ( not ( = ?auto_2497709 ?auto_2497713 ) ) ( not ( = ?auto_2497709 ?auto_2497714 ) ) ( not ( = ?auto_2497709 ?auto_2497715 ) ) ( not ( = ?auto_2497709 ?auto_2497716 ) ) ( not ( = ?auto_2497709 ?auto_2497717 ) ) ( not ( = ?auto_2497709 ?auto_2497718 ) ) ( not ( = ?auto_2497709 ?auto_2497719 ) ) ( not ( = ?auto_2497710 ?auto_2497711 ) ) ( not ( = ?auto_2497710 ?auto_2497712 ) ) ( not ( = ?auto_2497710 ?auto_2497713 ) ) ( not ( = ?auto_2497710 ?auto_2497714 ) ) ( not ( = ?auto_2497710 ?auto_2497715 ) ) ( not ( = ?auto_2497710 ?auto_2497716 ) ) ( not ( = ?auto_2497710 ?auto_2497717 ) ) ( not ( = ?auto_2497710 ?auto_2497718 ) ) ( not ( = ?auto_2497710 ?auto_2497719 ) ) ( not ( = ?auto_2497711 ?auto_2497712 ) ) ( not ( = ?auto_2497711 ?auto_2497713 ) ) ( not ( = ?auto_2497711 ?auto_2497714 ) ) ( not ( = ?auto_2497711 ?auto_2497715 ) ) ( not ( = ?auto_2497711 ?auto_2497716 ) ) ( not ( = ?auto_2497711 ?auto_2497717 ) ) ( not ( = ?auto_2497711 ?auto_2497718 ) ) ( not ( = ?auto_2497711 ?auto_2497719 ) ) ( not ( = ?auto_2497712 ?auto_2497713 ) ) ( not ( = ?auto_2497712 ?auto_2497714 ) ) ( not ( = ?auto_2497712 ?auto_2497715 ) ) ( not ( = ?auto_2497712 ?auto_2497716 ) ) ( not ( = ?auto_2497712 ?auto_2497717 ) ) ( not ( = ?auto_2497712 ?auto_2497718 ) ) ( not ( = ?auto_2497712 ?auto_2497719 ) ) ( not ( = ?auto_2497713 ?auto_2497714 ) ) ( not ( = ?auto_2497713 ?auto_2497715 ) ) ( not ( = ?auto_2497713 ?auto_2497716 ) ) ( not ( = ?auto_2497713 ?auto_2497717 ) ) ( not ( = ?auto_2497713 ?auto_2497718 ) ) ( not ( = ?auto_2497713 ?auto_2497719 ) ) ( not ( = ?auto_2497714 ?auto_2497715 ) ) ( not ( = ?auto_2497714 ?auto_2497716 ) ) ( not ( = ?auto_2497714 ?auto_2497717 ) ) ( not ( = ?auto_2497714 ?auto_2497718 ) ) ( not ( = ?auto_2497714 ?auto_2497719 ) ) ( not ( = ?auto_2497715 ?auto_2497716 ) ) ( not ( = ?auto_2497715 ?auto_2497717 ) ) ( not ( = ?auto_2497715 ?auto_2497718 ) ) ( not ( = ?auto_2497715 ?auto_2497719 ) ) ( not ( = ?auto_2497716 ?auto_2497717 ) ) ( not ( = ?auto_2497716 ?auto_2497718 ) ) ( not ( = ?auto_2497716 ?auto_2497719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2497717 ?auto_2497718 ?auto_2497719 )
      ( MAKE-16CRATE-VERIFY ?auto_2497703 ?auto_2497704 ?auto_2497705 ?auto_2497707 ?auto_2497706 ?auto_2497708 ?auto_2497709 ?auto_2497710 ?auto_2497711 ?auto_2497712 ?auto_2497713 ?auto_2497714 ?auto_2497715 ?auto_2497716 ?auto_2497717 ?auto_2497718 ?auto_2497719 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2497919 - SURFACE
      ?auto_2497920 - SURFACE
      ?auto_2497921 - SURFACE
      ?auto_2497923 - SURFACE
      ?auto_2497922 - SURFACE
      ?auto_2497924 - SURFACE
      ?auto_2497925 - SURFACE
      ?auto_2497926 - SURFACE
      ?auto_2497927 - SURFACE
      ?auto_2497928 - SURFACE
      ?auto_2497929 - SURFACE
      ?auto_2497930 - SURFACE
      ?auto_2497931 - SURFACE
      ?auto_2497932 - SURFACE
      ?auto_2497933 - SURFACE
      ?auto_2497934 - SURFACE
      ?auto_2497935 - SURFACE
    )
    :vars
    (
      ?auto_2497937 - HOIST
      ?auto_2497936 - PLACE
      ?auto_2497939 - TRUCK
      ?auto_2497938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2497937 ?auto_2497936 ) ( SURFACE-AT ?auto_2497934 ?auto_2497936 ) ( CLEAR ?auto_2497934 ) ( IS-CRATE ?auto_2497935 ) ( not ( = ?auto_2497934 ?auto_2497935 ) ) ( AVAILABLE ?auto_2497937 ) ( IN ?auto_2497935 ?auto_2497939 ) ( ON ?auto_2497934 ?auto_2497933 ) ( not ( = ?auto_2497933 ?auto_2497934 ) ) ( not ( = ?auto_2497933 ?auto_2497935 ) ) ( TRUCK-AT ?auto_2497939 ?auto_2497938 ) ( not ( = ?auto_2497938 ?auto_2497936 ) ) ( ON ?auto_2497920 ?auto_2497919 ) ( ON ?auto_2497921 ?auto_2497920 ) ( ON ?auto_2497923 ?auto_2497921 ) ( ON ?auto_2497922 ?auto_2497923 ) ( ON ?auto_2497924 ?auto_2497922 ) ( ON ?auto_2497925 ?auto_2497924 ) ( ON ?auto_2497926 ?auto_2497925 ) ( ON ?auto_2497927 ?auto_2497926 ) ( ON ?auto_2497928 ?auto_2497927 ) ( ON ?auto_2497929 ?auto_2497928 ) ( ON ?auto_2497930 ?auto_2497929 ) ( ON ?auto_2497931 ?auto_2497930 ) ( ON ?auto_2497932 ?auto_2497931 ) ( ON ?auto_2497933 ?auto_2497932 ) ( not ( = ?auto_2497919 ?auto_2497920 ) ) ( not ( = ?auto_2497919 ?auto_2497921 ) ) ( not ( = ?auto_2497919 ?auto_2497923 ) ) ( not ( = ?auto_2497919 ?auto_2497922 ) ) ( not ( = ?auto_2497919 ?auto_2497924 ) ) ( not ( = ?auto_2497919 ?auto_2497925 ) ) ( not ( = ?auto_2497919 ?auto_2497926 ) ) ( not ( = ?auto_2497919 ?auto_2497927 ) ) ( not ( = ?auto_2497919 ?auto_2497928 ) ) ( not ( = ?auto_2497919 ?auto_2497929 ) ) ( not ( = ?auto_2497919 ?auto_2497930 ) ) ( not ( = ?auto_2497919 ?auto_2497931 ) ) ( not ( = ?auto_2497919 ?auto_2497932 ) ) ( not ( = ?auto_2497919 ?auto_2497933 ) ) ( not ( = ?auto_2497919 ?auto_2497934 ) ) ( not ( = ?auto_2497919 ?auto_2497935 ) ) ( not ( = ?auto_2497920 ?auto_2497921 ) ) ( not ( = ?auto_2497920 ?auto_2497923 ) ) ( not ( = ?auto_2497920 ?auto_2497922 ) ) ( not ( = ?auto_2497920 ?auto_2497924 ) ) ( not ( = ?auto_2497920 ?auto_2497925 ) ) ( not ( = ?auto_2497920 ?auto_2497926 ) ) ( not ( = ?auto_2497920 ?auto_2497927 ) ) ( not ( = ?auto_2497920 ?auto_2497928 ) ) ( not ( = ?auto_2497920 ?auto_2497929 ) ) ( not ( = ?auto_2497920 ?auto_2497930 ) ) ( not ( = ?auto_2497920 ?auto_2497931 ) ) ( not ( = ?auto_2497920 ?auto_2497932 ) ) ( not ( = ?auto_2497920 ?auto_2497933 ) ) ( not ( = ?auto_2497920 ?auto_2497934 ) ) ( not ( = ?auto_2497920 ?auto_2497935 ) ) ( not ( = ?auto_2497921 ?auto_2497923 ) ) ( not ( = ?auto_2497921 ?auto_2497922 ) ) ( not ( = ?auto_2497921 ?auto_2497924 ) ) ( not ( = ?auto_2497921 ?auto_2497925 ) ) ( not ( = ?auto_2497921 ?auto_2497926 ) ) ( not ( = ?auto_2497921 ?auto_2497927 ) ) ( not ( = ?auto_2497921 ?auto_2497928 ) ) ( not ( = ?auto_2497921 ?auto_2497929 ) ) ( not ( = ?auto_2497921 ?auto_2497930 ) ) ( not ( = ?auto_2497921 ?auto_2497931 ) ) ( not ( = ?auto_2497921 ?auto_2497932 ) ) ( not ( = ?auto_2497921 ?auto_2497933 ) ) ( not ( = ?auto_2497921 ?auto_2497934 ) ) ( not ( = ?auto_2497921 ?auto_2497935 ) ) ( not ( = ?auto_2497923 ?auto_2497922 ) ) ( not ( = ?auto_2497923 ?auto_2497924 ) ) ( not ( = ?auto_2497923 ?auto_2497925 ) ) ( not ( = ?auto_2497923 ?auto_2497926 ) ) ( not ( = ?auto_2497923 ?auto_2497927 ) ) ( not ( = ?auto_2497923 ?auto_2497928 ) ) ( not ( = ?auto_2497923 ?auto_2497929 ) ) ( not ( = ?auto_2497923 ?auto_2497930 ) ) ( not ( = ?auto_2497923 ?auto_2497931 ) ) ( not ( = ?auto_2497923 ?auto_2497932 ) ) ( not ( = ?auto_2497923 ?auto_2497933 ) ) ( not ( = ?auto_2497923 ?auto_2497934 ) ) ( not ( = ?auto_2497923 ?auto_2497935 ) ) ( not ( = ?auto_2497922 ?auto_2497924 ) ) ( not ( = ?auto_2497922 ?auto_2497925 ) ) ( not ( = ?auto_2497922 ?auto_2497926 ) ) ( not ( = ?auto_2497922 ?auto_2497927 ) ) ( not ( = ?auto_2497922 ?auto_2497928 ) ) ( not ( = ?auto_2497922 ?auto_2497929 ) ) ( not ( = ?auto_2497922 ?auto_2497930 ) ) ( not ( = ?auto_2497922 ?auto_2497931 ) ) ( not ( = ?auto_2497922 ?auto_2497932 ) ) ( not ( = ?auto_2497922 ?auto_2497933 ) ) ( not ( = ?auto_2497922 ?auto_2497934 ) ) ( not ( = ?auto_2497922 ?auto_2497935 ) ) ( not ( = ?auto_2497924 ?auto_2497925 ) ) ( not ( = ?auto_2497924 ?auto_2497926 ) ) ( not ( = ?auto_2497924 ?auto_2497927 ) ) ( not ( = ?auto_2497924 ?auto_2497928 ) ) ( not ( = ?auto_2497924 ?auto_2497929 ) ) ( not ( = ?auto_2497924 ?auto_2497930 ) ) ( not ( = ?auto_2497924 ?auto_2497931 ) ) ( not ( = ?auto_2497924 ?auto_2497932 ) ) ( not ( = ?auto_2497924 ?auto_2497933 ) ) ( not ( = ?auto_2497924 ?auto_2497934 ) ) ( not ( = ?auto_2497924 ?auto_2497935 ) ) ( not ( = ?auto_2497925 ?auto_2497926 ) ) ( not ( = ?auto_2497925 ?auto_2497927 ) ) ( not ( = ?auto_2497925 ?auto_2497928 ) ) ( not ( = ?auto_2497925 ?auto_2497929 ) ) ( not ( = ?auto_2497925 ?auto_2497930 ) ) ( not ( = ?auto_2497925 ?auto_2497931 ) ) ( not ( = ?auto_2497925 ?auto_2497932 ) ) ( not ( = ?auto_2497925 ?auto_2497933 ) ) ( not ( = ?auto_2497925 ?auto_2497934 ) ) ( not ( = ?auto_2497925 ?auto_2497935 ) ) ( not ( = ?auto_2497926 ?auto_2497927 ) ) ( not ( = ?auto_2497926 ?auto_2497928 ) ) ( not ( = ?auto_2497926 ?auto_2497929 ) ) ( not ( = ?auto_2497926 ?auto_2497930 ) ) ( not ( = ?auto_2497926 ?auto_2497931 ) ) ( not ( = ?auto_2497926 ?auto_2497932 ) ) ( not ( = ?auto_2497926 ?auto_2497933 ) ) ( not ( = ?auto_2497926 ?auto_2497934 ) ) ( not ( = ?auto_2497926 ?auto_2497935 ) ) ( not ( = ?auto_2497927 ?auto_2497928 ) ) ( not ( = ?auto_2497927 ?auto_2497929 ) ) ( not ( = ?auto_2497927 ?auto_2497930 ) ) ( not ( = ?auto_2497927 ?auto_2497931 ) ) ( not ( = ?auto_2497927 ?auto_2497932 ) ) ( not ( = ?auto_2497927 ?auto_2497933 ) ) ( not ( = ?auto_2497927 ?auto_2497934 ) ) ( not ( = ?auto_2497927 ?auto_2497935 ) ) ( not ( = ?auto_2497928 ?auto_2497929 ) ) ( not ( = ?auto_2497928 ?auto_2497930 ) ) ( not ( = ?auto_2497928 ?auto_2497931 ) ) ( not ( = ?auto_2497928 ?auto_2497932 ) ) ( not ( = ?auto_2497928 ?auto_2497933 ) ) ( not ( = ?auto_2497928 ?auto_2497934 ) ) ( not ( = ?auto_2497928 ?auto_2497935 ) ) ( not ( = ?auto_2497929 ?auto_2497930 ) ) ( not ( = ?auto_2497929 ?auto_2497931 ) ) ( not ( = ?auto_2497929 ?auto_2497932 ) ) ( not ( = ?auto_2497929 ?auto_2497933 ) ) ( not ( = ?auto_2497929 ?auto_2497934 ) ) ( not ( = ?auto_2497929 ?auto_2497935 ) ) ( not ( = ?auto_2497930 ?auto_2497931 ) ) ( not ( = ?auto_2497930 ?auto_2497932 ) ) ( not ( = ?auto_2497930 ?auto_2497933 ) ) ( not ( = ?auto_2497930 ?auto_2497934 ) ) ( not ( = ?auto_2497930 ?auto_2497935 ) ) ( not ( = ?auto_2497931 ?auto_2497932 ) ) ( not ( = ?auto_2497931 ?auto_2497933 ) ) ( not ( = ?auto_2497931 ?auto_2497934 ) ) ( not ( = ?auto_2497931 ?auto_2497935 ) ) ( not ( = ?auto_2497932 ?auto_2497933 ) ) ( not ( = ?auto_2497932 ?auto_2497934 ) ) ( not ( = ?auto_2497932 ?auto_2497935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2497933 ?auto_2497934 ?auto_2497935 )
      ( MAKE-16CRATE-VERIFY ?auto_2497919 ?auto_2497920 ?auto_2497921 ?auto_2497923 ?auto_2497922 ?auto_2497924 ?auto_2497925 ?auto_2497926 ?auto_2497927 ?auto_2497928 ?auto_2497929 ?auto_2497930 ?auto_2497931 ?auto_2497932 ?auto_2497933 ?auto_2497934 ?auto_2497935 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2498151 - SURFACE
      ?auto_2498152 - SURFACE
      ?auto_2498153 - SURFACE
      ?auto_2498155 - SURFACE
      ?auto_2498154 - SURFACE
      ?auto_2498156 - SURFACE
      ?auto_2498157 - SURFACE
      ?auto_2498158 - SURFACE
      ?auto_2498159 - SURFACE
      ?auto_2498160 - SURFACE
      ?auto_2498161 - SURFACE
      ?auto_2498162 - SURFACE
      ?auto_2498163 - SURFACE
      ?auto_2498164 - SURFACE
      ?auto_2498165 - SURFACE
      ?auto_2498166 - SURFACE
      ?auto_2498167 - SURFACE
    )
    :vars
    (
      ?auto_2498169 - HOIST
      ?auto_2498170 - PLACE
      ?auto_2498172 - TRUCK
      ?auto_2498168 - PLACE
      ?auto_2498171 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2498169 ?auto_2498170 ) ( SURFACE-AT ?auto_2498166 ?auto_2498170 ) ( CLEAR ?auto_2498166 ) ( IS-CRATE ?auto_2498167 ) ( not ( = ?auto_2498166 ?auto_2498167 ) ) ( AVAILABLE ?auto_2498169 ) ( ON ?auto_2498166 ?auto_2498165 ) ( not ( = ?auto_2498165 ?auto_2498166 ) ) ( not ( = ?auto_2498165 ?auto_2498167 ) ) ( TRUCK-AT ?auto_2498172 ?auto_2498168 ) ( not ( = ?auto_2498168 ?auto_2498170 ) ) ( HOIST-AT ?auto_2498171 ?auto_2498168 ) ( LIFTING ?auto_2498171 ?auto_2498167 ) ( not ( = ?auto_2498169 ?auto_2498171 ) ) ( ON ?auto_2498152 ?auto_2498151 ) ( ON ?auto_2498153 ?auto_2498152 ) ( ON ?auto_2498155 ?auto_2498153 ) ( ON ?auto_2498154 ?auto_2498155 ) ( ON ?auto_2498156 ?auto_2498154 ) ( ON ?auto_2498157 ?auto_2498156 ) ( ON ?auto_2498158 ?auto_2498157 ) ( ON ?auto_2498159 ?auto_2498158 ) ( ON ?auto_2498160 ?auto_2498159 ) ( ON ?auto_2498161 ?auto_2498160 ) ( ON ?auto_2498162 ?auto_2498161 ) ( ON ?auto_2498163 ?auto_2498162 ) ( ON ?auto_2498164 ?auto_2498163 ) ( ON ?auto_2498165 ?auto_2498164 ) ( not ( = ?auto_2498151 ?auto_2498152 ) ) ( not ( = ?auto_2498151 ?auto_2498153 ) ) ( not ( = ?auto_2498151 ?auto_2498155 ) ) ( not ( = ?auto_2498151 ?auto_2498154 ) ) ( not ( = ?auto_2498151 ?auto_2498156 ) ) ( not ( = ?auto_2498151 ?auto_2498157 ) ) ( not ( = ?auto_2498151 ?auto_2498158 ) ) ( not ( = ?auto_2498151 ?auto_2498159 ) ) ( not ( = ?auto_2498151 ?auto_2498160 ) ) ( not ( = ?auto_2498151 ?auto_2498161 ) ) ( not ( = ?auto_2498151 ?auto_2498162 ) ) ( not ( = ?auto_2498151 ?auto_2498163 ) ) ( not ( = ?auto_2498151 ?auto_2498164 ) ) ( not ( = ?auto_2498151 ?auto_2498165 ) ) ( not ( = ?auto_2498151 ?auto_2498166 ) ) ( not ( = ?auto_2498151 ?auto_2498167 ) ) ( not ( = ?auto_2498152 ?auto_2498153 ) ) ( not ( = ?auto_2498152 ?auto_2498155 ) ) ( not ( = ?auto_2498152 ?auto_2498154 ) ) ( not ( = ?auto_2498152 ?auto_2498156 ) ) ( not ( = ?auto_2498152 ?auto_2498157 ) ) ( not ( = ?auto_2498152 ?auto_2498158 ) ) ( not ( = ?auto_2498152 ?auto_2498159 ) ) ( not ( = ?auto_2498152 ?auto_2498160 ) ) ( not ( = ?auto_2498152 ?auto_2498161 ) ) ( not ( = ?auto_2498152 ?auto_2498162 ) ) ( not ( = ?auto_2498152 ?auto_2498163 ) ) ( not ( = ?auto_2498152 ?auto_2498164 ) ) ( not ( = ?auto_2498152 ?auto_2498165 ) ) ( not ( = ?auto_2498152 ?auto_2498166 ) ) ( not ( = ?auto_2498152 ?auto_2498167 ) ) ( not ( = ?auto_2498153 ?auto_2498155 ) ) ( not ( = ?auto_2498153 ?auto_2498154 ) ) ( not ( = ?auto_2498153 ?auto_2498156 ) ) ( not ( = ?auto_2498153 ?auto_2498157 ) ) ( not ( = ?auto_2498153 ?auto_2498158 ) ) ( not ( = ?auto_2498153 ?auto_2498159 ) ) ( not ( = ?auto_2498153 ?auto_2498160 ) ) ( not ( = ?auto_2498153 ?auto_2498161 ) ) ( not ( = ?auto_2498153 ?auto_2498162 ) ) ( not ( = ?auto_2498153 ?auto_2498163 ) ) ( not ( = ?auto_2498153 ?auto_2498164 ) ) ( not ( = ?auto_2498153 ?auto_2498165 ) ) ( not ( = ?auto_2498153 ?auto_2498166 ) ) ( not ( = ?auto_2498153 ?auto_2498167 ) ) ( not ( = ?auto_2498155 ?auto_2498154 ) ) ( not ( = ?auto_2498155 ?auto_2498156 ) ) ( not ( = ?auto_2498155 ?auto_2498157 ) ) ( not ( = ?auto_2498155 ?auto_2498158 ) ) ( not ( = ?auto_2498155 ?auto_2498159 ) ) ( not ( = ?auto_2498155 ?auto_2498160 ) ) ( not ( = ?auto_2498155 ?auto_2498161 ) ) ( not ( = ?auto_2498155 ?auto_2498162 ) ) ( not ( = ?auto_2498155 ?auto_2498163 ) ) ( not ( = ?auto_2498155 ?auto_2498164 ) ) ( not ( = ?auto_2498155 ?auto_2498165 ) ) ( not ( = ?auto_2498155 ?auto_2498166 ) ) ( not ( = ?auto_2498155 ?auto_2498167 ) ) ( not ( = ?auto_2498154 ?auto_2498156 ) ) ( not ( = ?auto_2498154 ?auto_2498157 ) ) ( not ( = ?auto_2498154 ?auto_2498158 ) ) ( not ( = ?auto_2498154 ?auto_2498159 ) ) ( not ( = ?auto_2498154 ?auto_2498160 ) ) ( not ( = ?auto_2498154 ?auto_2498161 ) ) ( not ( = ?auto_2498154 ?auto_2498162 ) ) ( not ( = ?auto_2498154 ?auto_2498163 ) ) ( not ( = ?auto_2498154 ?auto_2498164 ) ) ( not ( = ?auto_2498154 ?auto_2498165 ) ) ( not ( = ?auto_2498154 ?auto_2498166 ) ) ( not ( = ?auto_2498154 ?auto_2498167 ) ) ( not ( = ?auto_2498156 ?auto_2498157 ) ) ( not ( = ?auto_2498156 ?auto_2498158 ) ) ( not ( = ?auto_2498156 ?auto_2498159 ) ) ( not ( = ?auto_2498156 ?auto_2498160 ) ) ( not ( = ?auto_2498156 ?auto_2498161 ) ) ( not ( = ?auto_2498156 ?auto_2498162 ) ) ( not ( = ?auto_2498156 ?auto_2498163 ) ) ( not ( = ?auto_2498156 ?auto_2498164 ) ) ( not ( = ?auto_2498156 ?auto_2498165 ) ) ( not ( = ?auto_2498156 ?auto_2498166 ) ) ( not ( = ?auto_2498156 ?auto_2498167 ) ) ( not ( = ?auto_2498157 ?auto_2498158 ) ) ( not ( = ?auto_2498157 ?auto_2498159 ) ) ( not ( = ?auto_2498157 ?auto_2498160 ) ) ( not ( = ?auto_2498157 ?auto_2498161 ) ) ( not ( = ?auto_2498157 ?auto_2498162 ) ) ( not ( = ?auto_2498157 ?auto_2498163 ) ) ( not ( = ?auto_2498157 ?auto_2498164 ) ) ( not ( = ?auto_2498157 ?auto_2498165 ) ) ( not ( = ?auto_2498157 ?auto_2498166 ) ) ( not ( = ?auto_2498157 ?auto_2498167 ) ) ( not ( = ?auto_2498158 ?auto_2498159 ) ) ( not ( = ?auto_2498158 ?auto_2498160 ) ) ( not ( = ?auto_2498158 ?auto_2498161 ) ) ( not ( = ?auto_2498158 ?auto_2498162 ) ) ( not ( = ?auto_2498158 ?auto_2498163 ) ) ( not ( = ?auto_2498158 ?auto_2498164 ) ) ( not ( = ?auto_2498158 ?auto_2498165 ) ) ( not ( = ?auto_2498158 ?auto_2498166 ) ) ( not ( = ?auto_2498158 ?auto_2498167 ) ) ( not ( = ?auto_2498159 ?auto_2498160 ) ) ( not ( = ?auto_2498159 ?auto_2498161 ) ) ( not ( = ?auto_2498159 ?auto_2498162 ) ) ( not ( = ?auto_2498159 ?auto_2498163 ) ) ( not ( = ?auto_2498159 ?auto_2498164 ) ) ( not ( = ?auto_2498159 ?auto_2498165 ) ) ( not ( = ?auto_2498159 ?auto_2498166 ) ) ( not ( = ?auto_2498159 ?auto_2498167 ) ) ( not ( = ?auto_2498160 ?auto_2498161 ) ) ( not ( = ?auto_2498160 ?auto_2498162 ) ) ( not ( = ?auto_2498160 ?auto_2498163 ) ) ( not ( = ?auto_2498160 ?auto_2498164 ) ) ( not ( = ?auto_2498160 ?auto_2498165 ) ) ( not ( = ?auto_2498160 ?auto_2498166 ) ) ( not ( = ?auto_2498160 ?auto_2498167 ) ) ( not ( = ?auto_2498161 ?auto_2498162 ) ) ( not ( = ?auto_2498161 ?auto_2498163 ) ) ( not ( = ?auto_2498161 ?auto_2498164 ) ) ( not ( = ?auto_2498161 ?auto_2498165 ) ) ( not ( = ?auto_2498161 ?auto_2498166 ) ) ( not ( = ?auto_2498161 ?auto_2498167 ) ) ( not ( = ?auto_2498162 ?auto_2498163 ) ) ( not ( = ?auto_2498162 ?auto_2498164 ) ) ( not ( = ?auto_2498162 ?auto_2498165 ) ) ( not ( = ?auto_2498162 ?auto_2498166 ) ) ( not ( = ?auto_2498162 ?auto_2498167 ) ) ( not ( = ?auto_2498163 ?auto_2498164 ) ) ( not ( = ?auto_2498163 ?auto_2498165 ) ) ( not ( = ?auto_2498163 ?auto_2498166 ) ) ( not ( = ?auto_2498163 ?auto_2498167 ) ) ( not ( = ?auto_2498164 ?auto_2498165 ) ) ( not ( = ?auto_2498164 ?auto_2498166 ) ) ( not ( = ?auto_2498164 ?auto_2498167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2498165 ?auto_2498166 ?auto_2498167 )
      ( MAKE-16CRATE-VERIFY ?auto_2498151 ?auto_2498152 ?auto_2498153 ?auto_2498155 ?auto_2498154 ?auto_2498156 ?auto_2498157 ?auto_2498158 ?auto_2498159 ?auto_2498160 ?auto_2498161 ?auto_2498162 ?auto_2498163 ?auto_2498164 ?auto_2498165 ?auto_2498166 ?auto_2498167 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2498399 - SURFACE
      ?auto_2498400 - SURFACE
      ?auto_2498401 - SURFACE
      ?auto_2498403 - SURFACE
      ?auto_2498402 - SURFACE
      ?auto_2498404 - SURFACE
      ?auto_2498405 - SURFACE
      ?auto_2498406 - SURFACE
      ?auto_2498407 - SURFACE
      ?auto_2498408 - SURFACE
      ?auto_2498409 - SURFACE
      ?auto_2498410 - SURFACE
      ?auto_2498411 - SURFACE
      ?auto_2498412 - SURFACE
      ?auto_2498413 - SURFACE
      ?auto_2498414 - SURFACE
      ?auto_2498415 - SURFACE
    )
    :vars
    (
      ?auto_2498416 - HOIST
      ?auto_2498418 - PLACE
      ?auto_2498421 - TRUCK
      ?auto_2498417 - PLACE
      ?auto_2498420 - HOIST
      ?auto_2498419 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2498416 ?auto_2498418 ) ( SURFACE-AT ?auto_2498414 ?auto_2498418 ) ( CLEAR ?auto_2498414 ) ( IS-CRATE ?auto_2498415 ) ( not ( = ?auto_2498414 ?auto_2498415 ) ) ( AVAILABLE ?auto_2498416 ) ( ON ?auto_2498414 ?auto_2498413 ) ( not ( = ?auto_2498413 ?auto_2498414 ) ) ( not ( = ?auto_2498413 ?auto_2498415 ) ) ( TRUCK-AT ?auto_2498421 ?auto_2498417 ) ( not ( = ?auto_2498417 ?auto_2498418 ) ) ( HOIST-AT ?auto_2498420 ?auto_2498417 ) ( not ( = ?auto_2498416 ?auto_2498420 ) ) ( AVAILABLE ?auto_2498420 ) ( SURFACE-AT ?auto_2498415 ?auto_2498417 ) ( ON ?auto_2498415 ?auto_2498419 ) ( CLEAR ?auto_2498415 ) ( not ( = ?auto_2498414 ?auto_2498419 ) ) ( not ( = ?auto_2498415 ?auto_2498419 ) ) ( not ( = ?auto_2498413 ?auto_2498419 ) ) ( ON ?auto_2498400 ?auto_2498399 ) ( ON ?auto_2498401 ?auto_2498400 ) ( ON ?auto_2498403 ?auto_2498401 ) ( ON ?auto_2498402 ?auto_2498403 ) ( ON ?auto_2498404 ?auto_2498402 ) ( ON ?auto_2498405 ?auto_2498404 ) ( ON ?auto_2498406 ?auto_2498405 ) ( ON ?auto_2498407 ?auto_2498406 ) ( ON ?auto_2498408 ?auto_2498407 ) ( ON ?auto_2498409 ?auto_2498408 ) ( ON ?auto_2498410 ?auto_2498409 ) ( ON ?auto_2498411 ?auto_2498410 ) ( ON ?auto_2498412 ?auto_2498411 ) ( ON ?auto_2498413 ?auto_2498412 ) ( not ( = ?auto_2498399 ?auto_2498400 ) ) ( not ( = ?auto_2498399 ?auto_2498401 ) ) ( not ( = ?auto_2498399 ?auto_2498403 ) ) ( not ( = ?auto_2498399 ?auto_2498402 ) ) ( not ( = ?auto_2498399 ?auto_2498404 ) ) ( not ( = ?auto_2498399 ?auto_2498405 ) ) ( not ( = ?auto_2498399 ?auto_2498406 ) ) ( not ( = ?auto_2498399 ?auto_2498407 ) ) ( not ( = ?auto_2498399 ?auto_2498408 ) ) ( not ( = ?auto_2498399 ?auto_2498409 ) ) ( not ( = ?auto_2498399 ?auto_2498410 ) ) ( not ( = ?auto_2498399 ?auto_2498411 ) ) ( not ( = ?auto_2498399 ?auto_2498412 ) ) ( not ( = ?auto_2498399 ?auto_2498413 ) ) ( not ( = ?auto_2498399 ?auto_2498414 ) ) ( not ( = ?auto_2498399 ?auto_2498415 ) ) ( not ( = ?auto_2498399 ?auto_2498419 ) ) ( not ( = ?auto_2498400 ?auto_2498401 ) ) ( not ( = ?auto_2498400 ?auto_2498403 ) ) ( not ( = ?auto_2498400 ?auto_2498402 ) ) ( not ( = ?auto_2498400 ?auto_2498404 ) ) ( not ( = ?auto_2498400 ?auto_2498405 ) ) ( not ( = ?auto_2498400 ?auto_2498406 ) ) ( not ( = ?auto_2498400 ?auto_2498407 ) ) ( not ( = ?auto_2498400 ?auto_2498408 ) ) ( not ( = ?auto_2498400 ?auto_2498409 ) ) ( not ( = ?auto_2498400 ?auto_2498410 ) ) ( not ( = ?auto_2498400 ?auto_2498411 ) ) ( not ( = ?auto_2498400 ?auto_2498412 ) ) ( not ( = ?auto_2498400 ?auto_2498413 ) ) ( not ( = ?auto_2498400 ?auto_2498414 ) ) ( not ( = ?auto_2498400 ?auto_2498415 ) ) ( not ( = ?auto_2498400 ?auto_2498419 ) ) ( not ( = ?auto_2498401 ?auto_2498403 ) ) ( not ( = ?auto_2498401 ?auto_2498402 ) ) ( not ( = ?auto_2498401 ?auto_2498404 ) ) ( not ( = ?auto_2498401 ?auto_2498405 ) ) ( not ( = ?auto_2498401 ?auto_2498406 ) ) ( not ( = ?auto_2498401 ?auto_2498407 ) ) ( not ( = ?auto_2498401 ?auto_2498408 ) ) ( not ( = ?auto_2498401 ?auto_2498409 ) ) ( not ( = ?auto_2498401 ?auto_2498410 ) ) ( not ( = ?auto_2498401 ?auto_2498411 ) ) ( not ( = ?auto_2498401 ?auto_2498412 ) ) ( not ( = ?auto_2498401 ?auto_2498413 ) ) ( not ( = ?auto_2498401 ?auto_2498414 ) ) ( not ( = ?auto_2498401 ?auto_2498415 ) ) ( not ( = ?auto_2498401 ?auto_2498419 ) ) ( not ( = ?auto_2498403 ?auto_2498402 ) ) ( not ( = ?auto_2498403 ?auto_2498404 ) ) ( not ( = ?auto_2498403 ?auto_2498405 ) ) ( not ( = ?auto_2498403 ?auto_2498406 ) ) ( not ( = ?auto_2498403 ?auto_2498407 ) ) ( not ( = ?auto_2498403 ?auto_2498408 ) ) ( not ( = ?auto_2498403 ?auto_2498409 ) ) ( not ( = ?auto_2498403 ?auto_2498410 ) ) ( not ( = ?auto_2498403 ?auto_2498411 ) ) ( not ( = ?auto_2498403 ?auto_2498412 ) ) ( not ( = ?auto_2498403 ?auto_2498413 ) ) ( not ( = ?auto_2498403 ?auto_2498414 ) ) ( not ( = ?auto_2498403 ?auto_2498415 ) ) ( not ( = ?auto_2498403 ?auto_2498419 ) ) ( not ( = ?auto_2498402 ?auto_2498404 ) ) ( not ( = ?auto_2498402 ?auto_2498405 ) ) ( not ( = ?auto_2498402 ?auto_2498406 ) ) ( not ( = ?auto_2498402 ?auto_2498407 ) ) ( not ( = ?auto_2498402 ?auto_2498408 ) ) ( not ( = ?auto_2498402 ?auto_2498409 ) ) ( not ( = ?auto_2498402 ?auto_2498410 ) ) ( not ( = ?auto_2498402 ?auto_2498411 ) ) ( not ( = ?auto_2498402 ?auto_2498412 ) ) ( not ( = ?auto_2498402 ?auto_2498413 ) ) ( not ( = ?auto_2498402 ?auto_2498414 ) ) ( not ( = ?auto_2498402 ?auto_2498415 ) ) ( not ( = ?auto_2498402 ?auto_2498419 ) ) ( not ( = ?auto_2498404 ?auto_2498405 ) ) ( not ( = ?auto_2498404 ?auto_2498406 ) ) ( not ( = ?auto_2498404 ?auto_2498407 ) ) ( not ( = ?auto_2498404 ?auto_2498408 ) ) ( not ( = ?auto_2498404 ?auto_2498409 ) ) ( not ( = ?auto_2498404 ?auto_2498410 ) ) ( not ( = ?auto_2498404 ?auto_2498411 ) ) ( not ( = ?auto_2498404 ?auto_2498412 ) ) ( not ( = ?auto_2498404 ?auto_2498413 ) ) ( not ( = ?auto_2498404 ?auto_2498414 ) ) ( not ( = ?auto_2498404 ?auto_2498415 ) ) ( not ( = ?auto_2498404 ?auto_2498419 ) ) ( not ( = ?auto_2498405 ?auto_2498406 ) ) ( not ( = ?auto_2498405 ?auto_2498407 ) ) ( not ( = ?auto_2498405 ?auto_2498408 ) ) ( not ( = ?auto_2498405 ?auto_2498409 ) ) ( not ( = ?auto_2498405 ?auto_2498410 ) ) ( not ( = ?auto_2498405 ?auto_2498411 ) ) ( not ( = ?auto_2498405 ?auto_2498412 ) ) ( not ( = ?auto_2498405 ?auto_2498413 ) ) ( not ( = ?auto_2498405 ?auto_2498414 ) ) ( not ( = ?auto_2498405 ?auto_2498415 ) ) ( not ( = ?auto_2498405 ?auto_2498419 ) ) ( not ( = ?auto_2498406 ?auto_2498407 ) ) ( not ( = ?auto_2498406 ?auto_2498408 ) ) ( not ( = ?auto_2498406 ?auto_2498409 ) ) ( not ( = ?auto_2498406 ?auto_2498410 ) ) ( not ( = ?auto_2498406 ?auto_2498411 ) ) ( not ( = ?auto_2498406 ?auto_2498412 ) ) ( not ( = ?auto_2498406 ?auto_2498413 ) ) ( not ( = ?auto_2498406 ?auto_2498414 ) ) ( not ( = ?auto_2498406 ?auto_2498415 ) ) ( not ( = ?auto_2498406 ?auto_2498419 ) ) ( not ( = ?auto_2498407 ?auto_2498408 ) ) ( not ( = ?auto_2498407 ?auto_2498409 ) ) ( not ( = ?auto_2498407 ?auto_2498410 ) ) ( not ( = ?auto_2498407 ?auto_2498411 ) ) ( not ( = ?auto_2498407 ?auto_2498412 ) ) ( not ( = ?auto_2498407 ?auto_2498413 ) ) ( not ( = ?auto_2498407 ?auto_2498414 ) ) ( not ( = ?auto_2498407 ?auto_2498415 ) ) ( not ( = ?auto_2498407 ?auto_2498419 ) ) ( not ( = ?auto_2498408 ?auto_2498409 ) ) ( not ( = ?auto_2498408 ?auto_2498410 ) ) ( not ( = ?auto_2498408 ?auto_2498411 ) ) ( not ( = ?auto_2498408 ?auto_2498412 ) ) ( not ( = ?auto_2498408 ?auto_2498413 ) ) ( not ( = ?auto_2498408 ?auto_2498414 ) ) ( not ( = ?auto_2498408 ?auto_2498415 ) ) ( not ( = ?auto_2498408 ?auto_2498419 ) ) ( not ( = ?auto_2498409 ?auto_2498410 ) ) ( not ( = ?auto_2498409 ?auto_2498411 ) ) ( not ( = ?auto_2498409 ?auto_2498412 ) ) ( not ( = ?auto_2498409 ?auto_2498413 ) ) ( not ( = ?auto_2498409 ?auto_2498414 ) ) ( not ( = ?auto_2498409 ?auto_2498415 ) ) ( not ( = ?auto_2498409 ?auto_2498419 ) ) ( not ( = ?auto_2498410 ?auto_2498411 ) ) ( not ( = ?auto_2498410 ?auto_2498412 ) ) ( not ( = ?auto_2498410 ?auto_2498413 ) ) ( not ( = ?auto_2498410 ?auto_2498414 ) ) ( not ( = ?auto_2498410 ?auto_2498415 ) ) ( not ( = ?auto_2498410 ?auto_2498419 ) ) ( not ( = ?auto_2498411 ?auto_2498412 ) ) ( not ( = ?auto_2498411 ?auto_2498413 ) ) ( not ( = ?auto_2498411 ?auto_2498414 ) ) ( not ( = ?auto_2498411 ?auto_2498415 ) ) ( not ( = ?auto_2498411 ?auto_2498419 ) ) ( not ( = ?auto_2498412 ?auto_2498413 ) ) ( not ( = ?auto_2498412 ?auto_2498414 ) ) ( not ( = ?auto_2498412 ?auto_2498415 ) ) ( not ( = ?auto_2498412 ?auto_2498419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2498413 ?auto_2498414 ?auto_2498415 )
      ( MAKE-16CRATE-VERIFY ?auto_2498399 ?auto_2498400 ?auto_2498401 ?auto_2498403 ?auto_2498402 ?auto_2498404 ?auto_2498405 ?auto_2498406 ?auto_2498407 ?auto_2498408 ?auto_2498409 ?auto_2498410 ?auto_2498411 ?auto_2498412 ?auto_2498413 ?auto_2498414 ?auto_2498415 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2498648 - SURFACE
      ?auto_2498649 - SURFACE
      ?auto_2498650 - SURFACE
      ?auto_2498652 - SURFACE
      ?auto_2498651 - SURFACE
      ?auto_2498653 - SURFACE
      ?auto_2498654 - SURFACE
      ?auto_2498655 - SURFACE
      ?auto_2498656 - SURFACE
      ?auto_2498657 - SURFACE
      ?auto_2498658 - SURFACE
      ?auto_2498659 - SURFACE
      ?auto_2498660 - SURFACE
      ?auto_2498661 - SURFACE
      ?auto_2498662 - SURFACE
      ?auto_2498663 - SURFACE
      ?auto_2498664 - SURFACE
    )
    :vars
    (
      ?auto_2498670 - HOIST
      ?auto_2498666 - PLACE
      ?auto_2498667 - PLACE
      ?auto_2498668 - HOIST
      ?auto_2498665 - SURFACE
      ?auto_2498669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2498670 ?auto_2498666 ) ( SURFACE-AT ?auto_2498663 ?auto_2498666 ) ( CLEAR ?auto_2498663 ) ( IS-CRATE ?auto_2498664 ) ( not ( = ?auto_2498663 ?auto_2498664 ) ) ( AVAILABLE ?auto_2498670 ) ( ON ?auto_2498663 ?auto_2498662 ) ( not ( = ?auto_2498662 ?auto_2498663 ) ) ( not ( = ?auto_2498662 ?auto_2498664 ) ) ( not ( = ?auto_2498667 ?auto_2498666 ) ) ( HOIST-AT ?auto_2498668 ?auto_2498667 ) ( not ( = ?auto_2498670 ?auto_2498668 ) ) ( AVAILABLE ?auto_2498668 ) ( SURFACE-AT ?auto_2498664 ?auto_2498667 ) ( ON ?auto_2498664 ?auto_2498665 ) ( CLEAR ?auto_2498664 ) ( not ( = ?auto_2498663 ?auto_2498665 ) ) ( not ( = ?auto_2498664 ?auto_2498665 ) ) ( not ( = ?auto_2498662 ?auto_2498665 ) ) ( TRUCK-AT ?auto_2498669 ?auto_2498666 ) ( ON ?auto_2498649 ?auto_2498648 ) ( ON ?auto_2498650 ?auto_2498649 ) ( ON ?auto_2498652 ?auto_2498650 ) ( ON ?auto_2498651 ?auto_2498652 ) ( ON ?auto_2498653 ?auto_2498651 ) ( ON ?auto_2498654 ?auto_2498653 ) ( ON ?auto_2498655 ?auto_2498654 ) ( ON ?auto_2498656 ?auto_2498655 ) ( ON ?auto_2498657 ?auto_2498656 ) ( ON ?auto_2498658 ?auto_2498657 ) ( ON ?auto_2498659 ?auto_2498658 ) ( ON ?auto_2498660 ?auto_2498659 ) ( ON ?auto_2498661 ?auto_2498660 ) ( ON ?auto_2498662 ?auto_2498661 ) ( not ( = ?auto_2498648 ?auto_2498649 ) ) ( not ( = ?auto_2498648 ?auto_2498650 ) ) ( not ( = ?auto_2498648 ?auto_2498652 ) ) ( not ( = ?auto_2498648 ?auto_2498651 ) ) ( not ( = ?auto_2498648 ?auto_2498653 ) ) ( not ( = ?auto_2498648 ?auto_2498654 ) ) ( not ( = ?auto_2498648 ?auto_2498655 ) ) ( not ( = ?auto_2498648 ?auto_2498656 ) ) ( not ( = ?auto_2498648 ?auto_2498657 ) ) ( not ( = ?auto_2498648 ?auto_2498658 ) ) ( not ( = ?auto_2498648 ?auto_2498659 ) ) ( not ( = ?auto_2498648 ?auto_2498660 ) ) ( not ( = ?auto_2498648 ?auto_2498661 ) ) ( not ( = ?auto_2498648 ?auto_2498662 ) ) ( not ( = ?auto_2498648 ?auto_2498663 ) ) ( not ( = ?auto_2498648 ?auto_2498664 ) ) ( not ( = ?auto_2498648 ?auto_2498665 ) ) ( not ( = ?auto_2498649 ?auto_2498650 ) ) ( not ( = ?auto_2498649 ?auto_2498652 ) ) ( not ( = ?auto_2498649 ?auto_2498651 ) ) ( not ( = ?auto_2498649 ?auto_2498653 ) ) ( not ( = ?auto_2498649 ?auto_2498654 ) ) ( not ( = ?auto_2498649 ?auto_2498655 ) ) ( not ( = ?auto_2498649 ?auto_2498656 ) ) ( not ( = ?auto_2498649 ?auto_2498657 ) ) ( not ( = ?auto_2498649 ?auto_2498658 ) ) ( not ( = ?auto_2498649 ?auto_2498659 ) ) ( not ( = ?auto_2498649 ?auto_2498660 ) ) ( not ( = ?auto_2498649 ?auto_2498661 ) ) ( not ( = ?auto_2498649 ?auto_2498662 ) ) ( not ( = ?auto_2498649 ?auto_2498663 ) ) ( not ( = ?auto_2498649 ?auto_2498664 ) ) ( not ( = ?auto_2498649 ?auto_2498665 ) ) ( not ( = ?auto_2498650 ?auto_2498652 ) ) ( not ( = ?auto_2498650 ?auto_2498651 ) ) ( not ( = ?auto_2498650 ?auto_2498653 ) ) ( not ( = ?auto_2498650 ?auto_2498654 ) ) ( not ( = ?auto_2498650 ?auto_2498655 ) ) ( not ( = ?auto_2498650 ?auto_2498656 ) ) ( not ( = ?auto_2498650 ?auto_2498657 ) ) ( not ( = ?auto_2498650 ?auto_2498658 ) ) ( not ( = ?auto_2498650 ?auto_2498659 ) ) ( not ( = ?auto_2498650 ?auto_2498660 ) ) ( not ( = ?auto_2498650 ?auto_2498661 ) ) ( not ( = ?auto_2498650 ?auto_2498662 ) ) ( not ( = ?auto_2498650 ?auto_2498663 ) ) ( not ( = ?auto_2498650 ?auto_2498664 ) ) ( not ( = ?auto_2498650 ?auto_2498665 ) ) ( not ( = ?auto_2498652 ?auto_2498651 ) ) ( not ( = ?auto_2498652 ?auto_2498653 ) ) ( not ( = ?auto_2498652 ?auto_2498654 ) ) ( not ( = ?auto_2498652 ?auto_2498655 ) ) ( not ( = ?auto_2498652 ?auto_2498656 ) ) ( not ( = ?auto_2498652 ?auto_2498657 ) ) ( not ( = ?auto_2498652 ?auto_2498658 ) ) ( not ( = ?auto_2498652 ?auto_2498659 ) ) ( not ( = ?auto_2498652 ?auto_2498660 ) ) ( not ( = ?auto_2498652 ?auto_2498661 ) ) ( not ( = ?auto_2498652 ?auto_2498662 ) ) ( not ( = ?auto_2498652 ?auto_2498663 ) ) ( not ( = ?auto_2498652 ?auto_2498664 ) ) ( not ( = ?auto_2498652 ?auto_2498665 ) ) ( not ( = ?auto_2498651 ?auto_2498653 ) ) ( not ( = ?auto_2498651 ?auto_2498654 ) ) ( not ( = ?auto_2498651 ?auto_2498655 ) ) ( not ( = ?auto_2498651 ?auto_2498656 ) ) ( not ( = ?auto_2498651 ?auto_2498657 ) ) ( not ( = ?auto_2498651 ?auto_2498658 ) ) ( not ( = ?auto_2498651 ?auto_2498659 ) ) ( not ( = ?auto_2498651 ?auto_2498660 ) ) ( not ( = ?auto_2498651 ?auto_2498661 ) ) ( not ( = ?auto_2498651 ?auto_2498662 ) ) ( not ( = ?auto_2498651 ?auto_2498663 ) ) ( not ( = ?auto_2498651 ?auto_2498664 ) ) ( not ( = ?auto_2498651 ?auto_2498665 ) ) ( not ( = ?auto_2498653 ?auto_2498654 ) ) ( not ( = ?auto_2498653 ?auto_2498655 ) ) ( not ( = ?auto_2498653 ?auto_2498656 ) ) ( not ( = ?auto_2498653 ?auto_2498657 ) ) ( not ( = ?auto_2498653 ?auto_2498658 ) ) ( not ( = ?auto_2498653 ?auto_2498659 ) ) ( not ( = ?auto_2498653 ?auto_2498660 ) ) ( not ( = ?auto_2498653 ?auto_2498661 ) ) ( not ( = ?auto_2498653 ?auto_2498662 ) ) ( not ( = ?auto_2498653 ?auto_2498663 ) ) ( not ( = ?auto_2498653 ?auto_2498664 ) ) ( not ( = ?auto_2498653 ?auto_2498665 ) ) ( not ( = ?auto_2498654 ?auto_2498655 ) ) ( not ( = ?auto_2498654 ?auto_2498656 ) ) ( not ( = ?auto_2498654 ?auto_2498657 ) ) ( not ( = ?auto_2498654 ?auto_2498658 ) ) ( not ( = ?auto_2498654 ?auto_2498659 ) ) ( not ( = ?auto_2498654 ?auto_2498660 ) ) ( not ( = ?auto_2498654 ?auto_2498661 ) ) ( not ( = ?auto_2498654 ?auto_2498662 ) ) ( not ( = ?auto_2498654 ?auto_2498663 ) ) ( not ( = ?auto_2498654 ?auto_2498664 ) ) ( not ( = ?auto_2498654 ?auto_2498665 ) ) ( not ( = ?auto_2498655 ?auto_2498656 ) ) ( not ( = ?auto_2498655 ?auto_2498657 ) ) ( not ( = ?auto_2498655 ?auto_2498658 ) ) ( not ( = ?auto_2498655 ?auto_2498659 ) ) ( not ( = ?auto_2498655 ?auto_2498660 ) ) ( not ( = ?auto_2498655 ?auto_2498661 ) ) ( not ( = ?auto_2498655 ?auto_2498662 ) ) ( not ( = ?auto_2498655 ?auto_2498663 ) ) ( not ( = ?auto_2498655 ?auto_2498664 ) ) ( not ( = ?auto_2498655 ?auto_2498665 ) ) ( not ( = ?auto_2498656 ?auto_2498657 ) ) ( not ( = ?auto_2498656 ?auto_2498658 ) ) ( not ( = ?auto_2498656 ?auto_2498659 ) ) ( not ( = ?auto_2498656 ?auto_2498660 ) ) ( not ( = ?auto_2498656 ?auto_2498661 ) ) ( not ( = ?auto_2498656 ?auto_2498662 ) ) ( not ( = ?auto_2498656 ?auto_2498663 ) ) ( not ( = ?auto_2498656 ?auto_2498664 ) ) ( not ( = ?auto_2498656 ?auto_2498665 ) ) ( not ( = ?auto_2498657 ?auto_2498658 ) ) ( not ( = ?auto_2498657 ?auto_2498659 ) ) ( not ( = ?auto_2498657 ?auto_2498660 ) ) ( not ( = ?auto_2498657 ?auto_2498661 ) ) ( not ( = ?auto_2498657 ?auto_2498662 ) ) ( not ( = ?auto_2498657 ?auto_2498663 ) ) ( not ( = ?auto_2498657 ?auto_2498664 ) ) ( not ( = ?auto_2498657 ?auto_2498665 ) ) ( not ( = ?auto_2498658 ?auto_2498659 ) ) ( not ( = ?auto_2498658 ?auto_2498660 ) ) ( not ( = ?auto_2498658 ?auto_2498661 ) ) ( not ( = ?auto_2498658 ?auto_2498662 ) ) ( not ( = ?auto_2498658 ?auto_2498663 ) ) ( not ( = ?auto_2498658 ?auto_2498664 ) ) ( not ( = ?auto_2498658 ?auto_2498665 ) ) ( not ( = ?auto_2498659 ?auto_2498660 ) ) ( not ( = ?auto_2498659 ?auto_2498661 ) ) ( not ( = ?auto_2498659 ?auto_2498662 ) ) ( not ( = ?auto_2498659 ?auto_2498663 ) ) ( not ( = ?auto_2498659 ?auto_2498664 ) ) ( not ( = ?auto_2498659 ?auto_2498665 ) ) ( not ( = ?auto_2498660 ?auto_2498661 ) ) ( not ( = ?auto_2498660 ?auto_2498662 ) ) ( not ( = ?auto_2498660 ?auto_2498663 ) ) ( not ( = ?auto_2498660 ?auto_2498664 ) ) ( not ( = ?auto_2498660 ?auto_2498665 ) ) ( not ( = ?auto_2498661 ?auto_2498662 ) ) ( not ( = ?auto_2498661 ?auto_2498663 ) ) ( not ( = ?auto_2498661 ?auto_2498664 ) ) ( not ( = ?auto_2498661 ?auto_2498665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2498662 ?auto_2498663 ?auto_2498664 )
      ( MAKE-16CRATE-VERIFY ?auto_2498648 ?auto_2498649 ?auto_2498650 ?auto_2498652 ?auto_2498651 ?auto_2498653 ?auto_2498654 ?auto_2498655 ?auto_2498656 ?auto_2498657 ?auto_2498658 ?auto_2498659 ?auto_2498660 ?auto_2498661 ?auto_2498662 ?auto_2498663 ?auto_2498664 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2498897 - SURFACE
      ?auto_2498898 - SURFACE
      ?auto_2498899 - SURFACE
      ?auto_2498901 - SURFACE
      ?auto_2498900 - SURFACE
      ?auto_2498902 - SURFACE
      ?auto_2498903 - SURFACE
      ?auto_2498904 - SURFACE
      ?auto_2498905 - SURFACE
      ?auto_2498906 - SURFACE
      ?auto_2498907 - SURFACE
      ?auto_2498908 - SURFACE
      ?auto_2498909 - SURFACE
      ?auto_2498910 - SURFACE
      ?auto_2498911 - SURFACE
      ?auto_2498912 - SURFACE
      ?auto_2498913 - SURFACE
    )
    :vars
    (
      ?auto_2498917 - HOIST
      ?auto_2498918 - PLACE
      ?auto_2498916 - PLACE
      ?auto_2498919 - HOIST
      ?auto_2498914 - SURFACE
      ?auto_2498915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2498917 ?auto_2498918 ) ( IS-CRATE ?auto_2498913 ) ( not ( = ?auto_2498912 ?auto_2498913 ) ) ( not ( = ?auto_2498911 ?auto_2498912 ) ) ( not ( = ?auto_2498911 ?auto_2498913 ) ) ( not ( = ?auto_2498916 ?auto_2498918 ) ) ( HOIST-AT ?auto_2498919 ?auto_2498916 ) ( not ( = ?auto_2498917 ?auto_2498919 ) ) ( AVAILABLE ?auto_2498919 ) ( SURFACE-AT ?auto_2498913 ?auto_2498916 ) ( ON ?auto_2498913 ?auto_2498914 ) ( CLEAR ?auto_2498913 ) ( not ( = ?auto_2498912 ?auto_2498914 ) ) ( not ( = ?auto_2498913 ?auto_2498914 ) ) ( not ( = ?auto_2498911 ?auto_2498914 ) ) ( TRUCK-AT ?auto_2498915 ?auto_2498918 ) ( SURFACE-AT ?auto_2498911 ?auto_2498918 ) ( CLEAR ?auto_2498911 ) ( LIFTING ?auto_2498917 ?auto_2498912 ) ( IS-CRATE ?auto_2498912 ) ( ON ?auto_2498898 ?auto_2498897 ) ( ON ?auto_2498899 ?auto_2498898 ) ( ON ?auto_2498901 ?auto_2498899 ) ( ON ?auto_2498900 ?auto_2498901 ) ( ON ?auto_2498902 ?auto_2498900 ) ( ON ?auto_2498903 ?auto_2498902 ) ( ON ?auto_2498904 ?auto_2498903 ) ( ON ?auto_2498905 ?auto_2498904 ) ( ON ?auto_2498906 ?auto_2498905 ) ( ON ?auto_2498907 ?auto_2498906 ) ( ON ?auto_2498908 ?auto_2498907 ) ( ON ?auto_2498909 ?auto_2498908 ) ( ON ?auto_2498910 ?auto_2498909 ) ( ON ?auto_2498911 ?auto_2498910 ) ( not ( = ?auto_2498897 ?auto_2498898 ) ) ( not ( = ?auto_2498897 ?auto_2498899 ) ) ( not ( = ?auto_2498897 ?auto_2498901 ) ) ( not ( = ?auto_2498897 ?auto_2498900 ) ) ( not ( = ?auto_2498897 ?auto_2498902 ) ) ( not ( = ?auto_2498897 ?auto_2498903 ) ) ( not ( = ?auto_2498897 ?auto_2498904 ) ) ( not ( = ?auto_2498897 ?auto_2498905 ) ) ( not ( = ?auto_2498897 ?auto_2498906 ) ) ( not ( = ?auto_2498897 ?auto_2498907 ) ) ( not ( = ?auto_2498897 ?auto_2498908 ) ) ( not ( = ?auto_2498897 ?auto_2498909 ) ) ( not ( = ?auto_2498897 ?auto_2498910 ) ) ( not ( = ?auto_2498897 ?auto_2498911 ) ) ( not ( = ?auto_2498897 ?auto_2498912 ) ) ( not ( = ?auto_2498897 ?auto_2498913 ) ) ( not ( = ?auto_2498897 ?auto_2498914 ) ) ( not ( = ?auto_2498898 ?auto_2498899 ) ) ( not ( = ?auto_2498898 ?auto_2498901 ) ) ( not ( = ?auto_2498898 ?auto_2498900 ) ) ( not ( = ?auto_2498898 ?auto_2498902 ) ) ( not ( = ?auto_2498898 ?auto_2498903 ) ) ( not ( = ?auto_2498898 ?auto_2498904 ) ) ( not ( = ?auto_2498898 ?auto_2498905 ) ) ( not ( = ?auto_2498898 ?auto_2498906 ) ) ( not ( = ?auto_2498898 ?auto_2498907 ) ) ( not ( = ?auto_2498898 ?auto_2498908 ) ) ( not ( = ?auto_2498898 ?auto_2498909 ) ) ( not ( = ?auto_2498898 ?auto_2498910 ) ) ( not ( = ?auto_2498898 ?auto_2498911 ) ) ( not ( = ?auto_2498898 ?auto_2498912 ) ) ( not ( = ?auto_2498898 ?auto_2498913 ) ) ( not ( = ?auto_2498898 ?auto_2498914 ) ) ( not ( = ?auto_2498899 ?auto_2498901 ) ) ( not ( = ?auto_2498899 ?auto_2498900 ) ) ( not ( = ?auto_2498899 ?auto_2498902 ) ) ( not ( = ?auto_2498899 ?auto_2498903 ) ) ( not ( = ?auto_2498899 ?auto_2498904 ) ) ( not ( = ?auto_2498899 ?auto_2498905 ) ) ( not ( = ?auto_2498899 ?auto_2498906 ) ) ( not ( = ?auto_2498899 ?auto_2498907 ) ) ( not ( = ?auto_2498899 ?auto_2498908 ) ) ( not ( = ?auto_2498899 ?auto_2498909 ) ) ( not ( = ?auto_2498899 ?auto_2498910 ) ) ( not ( = ?auto_2498899 ?auto_2498911 ) ) ( not ( = ?auto_2498899 ?auto_2498912 ) ) ( not ( = ?auto_2498899 ?auto_2498913 ) ) ( not ( = ?auto_2498899 ?auto_2498914 ) ) ( not ( = ?auto_2498901 ?auto_2498900 ) ) ( not ( = ?auto_2498901 ?auto_2498902 ) ) ( not ( = ?auto_2498901 ?auto_2498903 ) ) ( not ( = ?auto_2498901 ?auto_2498904 ) ) ( not ( = ?auto_2498901 ?auto_2498905 ) ) ( not ( = ?auto_2498901 ?auto_2498906 ) ) ( not ( = ?auto_2498901 ?auto_2498907 ) ) ( not ( = ?auto_2498901 ?auto_2498908 ) ) ( not ( = ?auto_2498901 ?auto_2498909 ) ) ( not ( = ?auto_2498901 ?auto_2498910 ) ) ( not ( = ?auto_2498901 ?auto_2498911 ) ) ( not ( = ?auto_2498901 ?auto_2498912 ) ) ( not ( = ?auto_2498901 ?auto_2498913 ) ) ( not ( = ?auto_2498901 ?auto_2498914 ) ) ( not ( = ?auto_2498900 ?auto_2498902 ) ) ( not ( = ?auto_2498900 ?auto_2498903 ) ) ( not ( = ?auto_2498900 ?auto_2498904 ) ) ( not ( = ?auto_2498900 ?auto_2498905 ) ) ( not ( = ?auto_2498900 ?auto_2498906 ) ) ( not ( = ?auto_2498900 ?auto_2498907 ) ) ( not ( = ?auto_2498900 ?auto_2498908 ) ) ( not ( = ?auto_2498900 ?auto_2498909 ) ) ( not ( = ?auto_2498900 ?auto_2498910 ) ) ( not ( = ?auto_2498900 ?auto_2498911 ) ) ( not ( = ?auto_2498900 ?auto_2498912 ) ) ( not ( = ?auto_2498900 ?auto_2498913 ) ) ( not ( = ?auto_2498900 ?auto_2498914 ) ) ( not ( = ?auto_2498902 ?auto_2498903 ) ) ( not ( = ?auto_2498902 ?auto_2498904 ) ) ( not ( = ?auto_2498902 ?auto_2498905 ) ) ( not ( = ?auto_2498902 ?auto_2498906 ) ) ( not ( = ?auto_2498902 ?auto_2498907 ) ) ( not ( = ?auto_2498902 ?auto_2498908 ) ) ( not ( = ?auto_2498902 ?auto_2498909 ) ) ( not ( = ?auto_2498902 ?auto_2498910 ) ) ( not ( = ?auto_2498902 ?auto_2498911 ) ) ( not ( = ?auto_2498902 ?auto_2498912 ) ) ( not ( = ?auto_2498902 ?auto_2498913 ) ) ( not ( = ?auto_2498902 ?auto_2498914 ) ) ( not ( = ?auto_2498903 ?auto_2498904 ) ) ( not ( = ?auto_2498903 ?auto_2498905 ) ) ( not ( = ?auto_2498903 ?auto_2498906 ) ) ( not ( = ?auto_2498903 ?auto_2498907 ) ) ( not ( = ?auto_2498903 ?auto_2498908 ) ) ( not ( = ?auto_2498903 ?auto_2498909 ) ) ( not ( = ?auto_2498903 ?auto_2498910 ) ) ( not ( = ?auto_2498903 ?auto_2498911 ) ) ( not ( = ?auto_2498903 ?auto_2498912 ) ) ( not ( = ?auto_2498903 ?auto_2498913 ) ) ( not ( = ?auto_2498903 ?auto_2498914 ) ) ( not ( = ?auto_2498904 ?auto_2498905 ) ) ( not ( = ?auto_2498904 ?auto_2498906 ) ) ( not ( = ?auto_2498904 ?auto_2498907 ) ) ( not ( = ?auto_2498904 ?auto_2498908 ) ) ( not ( = ?auto_2498904 ?auto_2498909 ) ) ( not ( = ?auto_2498904 ?auto_2498910 ) ) ( not ( = ?auto_2498904 ?auto_2498911 ) ) ( not ( = ?auto_2498904 ?auto_2498912 ) ) ( not ( = ?auto_2498904 ?auto_2498913 ) ) ( not ( = ?auto_2498904 ?auto_2498914 ) ) ( not ( = ?auto_2498905 ?auto_2498906 ) ) ( not ( = ?auto_2498905 ?auto_2498907 ) ) ( not ( = ?auto_2498905 ?auto_2498908 ) ) ( not ( = ?auto_2498905 ?auto_2498909 ) ) ( not ( = ?auto_2498905 ?auto_2498910 ) ) ( not ( = ?auto_2498905 ?auto_2498911 ) ) ( not ( = ?auto_2498905 ?auto_2498912 ) ) ( not ( = ?auto_2498905 ?auto_2498913 ) ) ( not ( = ?auto_2498905 ?auto_2498914 ) ) ( not ( = ?auto_2498906 ?auto_2498907 ) ) ( not ( = ?auto_2498906 ?auto_2498908 ) ) ( not ( = ?auto_2498906 ?auto_2498909 ) ) ( not ( = ?auto_2498906 ?auto_2498910 ) ) ( not ( = ?auto_2498906 ?auto_2498911 ) ) ( not ( = ?auto_2498906 ?auto_2498912 ) ) ( not ( = ?auto_2498906 ?auto_2498913 ) ) ( not ( = ?auto_2498906 ?auto_2498914 ) ) ( not ( = ?auto_2498907 ?auto_2498908 ) ) ( not ( = ?auto_2498907 ?auto_2498909 ) ) ( not ( = ?auto_2498907 ?auto_2498910 ) ) ( not ( = ?auto_2498907 ?auto_2498911 ) ) ( not ( = ?auto_2498907 ?auto_2498912 ) ) ( not ( = ?auto_2498907 ?auto_2498913 ) ) ( not ( = ?auto_2498907 ?auto_2498914 ) ) ( not ( = ?auto_2498908 ?auto_2498909 ) ) ( not ( = ?auto_2498908 ?auto_2498910 ) ) ( not ( = ?auto_2498908 ?auto_2498911 ) ) ( not ( = ?auto_2498908 ?auto_2498912 ) ) ( not ( = ?auto_2498908 ?auto_2498913 ) ) ( not ( = ?auto_2498908 ?auto_2498914 ) ) ( not ( = ?auto_2498909 ?auto_2498910 ) ) ( not ( = ?auto_2498909 ?auto_2498911 ) ) ( not ( = ?auto_2498909 ?auto_2498912 ) ) ( not ( = ?auto_2498909 ?auto_2498913 ) ) ( not ( = ?auto_2498909 ?auto_2498914 ) ) ( not ( = ?auto_2498910 ?auto_2498911 ) ) ( not ( = ?auto_2498910 ?auto_2498912 ) ) ( not ( = ?auto_2498910 ?auto_2498913 ) ) ( not ( = ?auto_2498910 ?auto_2498914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2498911 ?auto_2498912 ?auto_2498913 )
      ( MAKE-16CRATE-VERIFY ?auto_2498897 ?auto_2498898 ?auto_2498899 ?auto_2498901 ?auto_2498900 ?auto_2498902 ?auto_2498903 ?auto_2498904 ?auto_2498905 ?auto_2498906 ?auto_2498907 ?auto_2498908 ?auto_2498909 ?auto_2498910 ?auto_2498911 ?auto_2498912 ?auto_2498913 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2499146 - SURFACE
      ?auto_2499147 - SURFACE
      ?auto_2499148 - SURFACE
      ?auto_2499150 - SURFACE
      ?auto_2499149 - SURFACE
      ?auto_2499151 - SURFACE
      ?auto_2499152 - SURFACE
      ?auto_2499153 - SURFACE
      ?auto_2499154 - SURFACE
      ?auto_2499155 - SURFACE
      ?auto_2499156 - SURFACE
      ?auto_2499157 - SURFACE
      ?auto_2499158 - SURFACE
      ?auto_2499159 - SURFACE
      ?auto_2499160 - SURFACE
      ?auto_2499161 - SURFACE
      ?auto_2499162 - SURFACE
    )
    :vars
    (
      ?auto_2499165 - HOIST
      ?auto_2499167 - PLACE
      ?auto_2499166 - PLACE
      ?auto_2499168 - HOIST
      ?auto_2499164 - SURFACE
      ?auto_2499163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2499165 ?auto_2499167 ) ( IS-CRATE ?auto_2499162 ) ( not ( = ?auto_2499161 ?auto_2499162 ) ) ( not ( = ?auto_2499160 ?auto_2499161 ) ) ( not ( = ?auto_2499160 ?auto_2499162 ) ) ( not ( = ?auto_2499166 ?auto_2499167 ) ) ( HOIST-AT ?auto_2499168 ?auto_2499166 ) ( not ( = ?auto_2499165 ?auto_2499168 ) ) ( AVAILABLE ?auto_2499168 ) ( SURFACE-AT ?auto_2499162 ?auto_2499166 ) ( ON ?auto_2499162 ?auto_2499164 ) ( CLEAR ?auto_2499162 ) ( not ( = ?auto_2499161 ?auto_2499164 ) ) ( not ( = ?auto_2499162 ?auto_2499164 ) ) ( not ( = ?auto_2499160 ?auto_2499164 ) ) ( TRUCK-AT ?auto_2499163 ?auto_2499167 ) ( SURFACE-AT ?auto_2499160 ?auto_2499167 ) ( CLEAR ?auto_2499160 ) ( IS-CRATE ?auto_2499161 ) ( AVAILABLE ?auto_2499165 ) ( IN ?auto_2499161 ?auto_2499163 ) ( ON ?auto_2499147 ?auto_2499146 ) ( ON ?auto_2499148 ?auto_2499147 ) ( ON ?auto_2499150 ?auto_2499148 ) ( ON ?auto_2499149 ?auto_2499150 ) ( ON ?auto_2499151 ?auto_2499149 ) ( ON ?auto_2499152 ?auto_2499151 ) ( ON ?auto_2499153 ?auto_2499152 ) ( ON ?auto_2499154 ?auto_2499153 ) ( ON ?auto_2499155 ?auto_2499154 ) ( ON ?auto_2499156 ?auto_2499155 ) ( ON ?auto_2499157 ?auto_2499156 ) ( ON ?auto_2499158 ?auto_2499157 ) ( ON ?auto_2499159 ?auto_2499158 ) ( ON ?auto_2499160 ?auto_2499159 ) ( not ( = ?auto_2499146 ?auto_2499147 ) ) ( not ( = ?auto_2499146 ?auto_2499148 ) ) ( not ( = ?auto_2499146 ?auto_2499150 ) ) ( not ( = ?auto_2499146 ?auto_2499149 ) ) ( not ( = ?auto_2499146 ?auto_2499151 ) ) ( not ( = ?auto_2499146 ?auto_2499152 ) ) ( not ( = ?auto_2499146 ?auto_2499153 ) ) ( not ( = ?auto_2499146 ?auto_2499154 ) ) ( not ( = ?auto_2499146 ?auto_2499155 ) ) ( not ( = ?auto_2499146 ?auto_2499156 ) ) ( not ( = ?auto_2499146 ?auto_2499157 ) ) ( not ( = ?auto_2499146 ?auto_2499158 ) ) ( not ( = ?auto_2499146 ?auto_2499159 ) ) ( not ( = ?auto_2499146 ?auto_2499160 ) ) ( not ( = ?auto_2499146 ?auto_2499161 ) ) ( not ( = ?auto_2499146 ?auto_2499162 ) ) ( not ( = ?auto_2499146 ?auto_2499164 ) ) ( not ( = ?auto_2499147 ?auto_2499148 ) ) ( not ( = ?auto_2499147 ?auto_2499150 ) ) ( not ( = ?auto_2499147 ?auto_2499149 ) ) ( not ( = ?auto_2499147 ?auto_2499151 ) ) ( not ( = ?auto_2499147 ?auto_2499152 ) ) ( not ( = ?auto_2499147 ?auto_2499153 ) ) ( not ( = ?auto_2499147 ?auto_2499154 ) ) ( not ( = ?auto_2499147 ?auto_2499155 ) ) ( not ( = ?auto_2499147 ?auto_2499156 ) ) ( not ( = ?auto_2499147 ?auto_2499157 ) ) ( not ( = ?auto_2499147 ?auto_2499158 ) ) ( not ( = ?auto_2499147 ?auto_2499159 ) ) ( not ( = ?auto_2499147 ?auto_2499160 ) ) ( not ( = ?auto_2499147 ?auto_2499161 ) ) ( not ( = ?auto_2499147 ?auto_2499162 ) ) ( not ( = ?auto_2499147 ?auto_2499164 ) ) ( not ( = ?auto_2499148 ?auto_2499150 ) ) ( not ( = ?auto_2499148 ?auto_2499149 ) ) ( not ( = ?auto_2499148 ?auto_2499151 ) ) ( not ( = ?auto_2499148 ?auto_2499152 ) ) ( not ( = ?auto_2499148 ?auto_2499153 ) ) ( not ( = ?auto_2499148 ?auto_2499154 ) ) ( not ( = ?auto_2499148 ?auto_2499155 ) ) ( not ( = ?auto_2499148 ?auto_2499156 ) ) ( not ( = ?auto_2499148 ?auto_2499157 ) ) ( not ( = ?auto_2499148 ?auto_2499158 ) ) ( not ( = ?auto_2499148 ?auto_2499159 ) ) ( not ( = ?auto_2499148 ?auto_2499160 ) ) ( not ( = ?auto_2499148 ?auto_2499161 ) ) ( not ( = ?auto_2499148 ?auto_2499162 ) ) ( not ( = ?auto_2499148 ?auto_2499164 ) ) ( not ( = ?auto_2499150 ?auto_2499149 ) ) ( not ( = ?auto_2499150 ?auto_2499151 ) ) ( not ( = ?auto_2499150 ?auto_2499152 ) ) ( not ( = ?auto_2499150 ?auto_2499153 ) ) ( not ( = ?auto_2499150 ?auto_2499154 ) ) ( not ( = ?auto_2499150 ?auto_2499155 ) ) ( not ( = ?auto_2499150 ?auto_2499156 ) ) ( not ( = ?auto_2499150 ?auto_2499157 ) ) ( not ( = ?auto_2499150 ?auto_2499158 ) ) ( not ( = ?auto_2499150 ?auto_2499159 ) ) ( not ( = ?auto_2499150 ?auto_2499160 ) ) ( not ( = ?auto_2499150 ?auto_2499161 ) ) ( not ( = ?auto_2499150 ?auto_2499162 ) ) ( not ( = ?auto_2499150 ?auto_2499164 ) ) ( not ( = ?auto_2499149 ?auto_2499151 ) ) ( not ( = ?auto_2499149 ?auto_2499152 ) ) ( not ( = ?auto_2499149 ?auto_2499153 ) ) ( not ( = ?auto_2499149 ?auto_2499154 ) ) ( not ( = ?auto_2499149 ?auto_2499155 ) ) ( not ( = ?auto_2499149 ?auto_2499156 ) ) ( not ( = ?auto_2499149 ?auto_2499157 ) ) ( not ( = ?auto_2499149 ?auto_2499158 ) ) ( not ( = ?auto_2499149 ?auto_2499159 ) ) ( not ( = ?auto_2499149 ?auto_2499160 ) ) ( not ( = ?auto_2499149 ?auto_2499161 ) ) ( not ( = ?auto_2499149 ?auto_2499162 ) ) ( not ( = ?auto_2499149 ?auto_2499164 ) ) ( not ( = ?auto_2499151 ?auto_2499152 ) ) ( not ( = ?auto_2499151 ?auto_2499153 ) ) ( not ( = ?auto_2499151 ?auto_2499154 ) ) ( not ( = ?auto_2499151 ?auto_2499155 ) ) ( not ( = ?auto_2499151 ?auto_2499156 ) ) ( not ( = ?auto_2499151 ?auto_2499157 ) ) ( not ( = ?auto_2499151 ?auto_2499158 ) ) ( not ( = ?auto_2499151 ?auto_2499159 ) ) ( not ( = ?auto_2499151 ?auto_2499160 ) ) ( not ( = ?auto_2499151 ?auto_2499161 ) ) ( not ( = ?auto_2499151 ?auto_2499162 ) ) ( not ( = ?auto_2499151 ?auto_2499164 ) ) ( not ( = ?auto_2499152 ?auto_2499153 ) ) ( not ( = ?auto_2499152 ?auto_2499154 ) ) ( not ( = ?auto_2499152 ?auto_2499155 ) ) ( not ( = ?auto_2499152 ?auto_2499156 ) ) ( not ( = ?auto_2499152 ?auto_2499157 ) ) ( not ( = ?auto_2499152 ?auto_2499158 ) ) ( not ( = ?auto_2499152 ?auto_2499159 ) ) ( not ( = ?auto_2499152 ?auto_2499160 ) ) ( not ( = ?auto_2499152 ?auto_2499161 ) ) ( not ( = ?auto_2499152 ?auto_2499162 ) ) ( not ( = ?auto_2499152 ?auto_2499164 ) ) ( not ( = ?auto_2499153 ?auto_2499154 ) ) ( not ( = ?auto_2499153 ?auto_2499155 ) ) ( not ( = ?auto_2499153 ?auto_2499156 ) ) ( not ( = ?auto_2499153 ?auto_2499157 ) ) ( not ( = ?auto_2499153 ?auto_2499158 ) ) ( not ( = ?auto_2499153 ?auto_2499159 ) ) ( not ( = ?auto_2499153 ?auto_2499160 ) ) ( not ( = ?auto_2499153 ?auto_2499161 ) ) ( not ( = ?auto_2499153 ?auto_2499162 ) ) ( not ( = ?auto_2499153 ?auto_2499164 ) ) ( not ( = ?auto_2499154 ?auto_2499155 ) ) ( not ( = ?auto_2499154 ?auto_2499156 ) ) ( not ( = ?auto_2499154 ?auto_2499157 ) ) ( not ( = ?auto_2499154 ?auto_2499158 ) ) ( not ( = ?auto_2499154 ?auto_2499159 ) ) ( not ( = ?auto_2499154 ?auto_2499160 ) ) ( not ( = ?auto_2499154 ?auto_2499161 ) ) ( not ( = ?auto_2499154 ?auto_2499162 ) ) ( not ( = ?auto_2499154 ?auto_2499164 ) ) ( not ( = ?auto_2499155 ?auto_2499156 ) ) ( not ( = ?auto_2499155 ?auto_2499157 ) ) ( not ( = ?auto_2499155 ?auto_2499158 ) ) ( not ( = ?auto_2499155 ?auto_2499159 ) ) ( not ( = ?auto_2499155 ?auto_2499160 ) ) ( not ( = ?auto_2499155 ?auto_2499161 ) ) ( not ( = ?auto_2499155 ?auto_2499162 ) ) ( not ( = ?auto_2499155 ?auto_2499164 ) ) ( not ( = ?auto_2499156 ?auto_2499157 ) ) ( not ( = ?auto_2499156 ?auto_2499158 ) ) ( not ( = ?auto_2499156 ?auto_2499159 ) ) ( not ( = ?auto_2499156 ?auto_2499160 ) ) ( not ( = ?auto_2499156 ?auto_2499161 ) ) ( not ( = ?auto_2499156 ?auto_2499162 ) ) ( not ( = ?auto_2499156 ?auto_2499164 ) ) ( not ( = ?auto_2499157 ?auto_2499158 ) ) ( not ( = ?auto_2499157 ?auto_2499159 ) ) ( not ( = ?auto_2499157 ?auto_2499160 ) ) ( not ( = ?auto_2499157 ?auto_2499161 ) ) ( not ( = ?auto_2499157 ?auto_2499162 ) ) ( not ( = ?auto_2499157 ?auto_2499164 ) ) ( not ( = ?auto_2499158 ?auto_2499159 ) ) ( not ( = ?auto_2499158 ?auto_2499160 ) ) ( not ( = ?auto_2499158 ?auto_2499161 ) ) ( not ( = ?auto_2499158 ?auto_2499162 ) ) ( not ( = ?auto_2499158 ?auto_2499164 ) ) ( not ( = ?auto_2499159 ?auto_2499160 ) ) ( not ( = ?auto_2499159 ?auto_2499161 ) ) ( not ( = ?auto_2499159 ?auto_2499162 ) ) ( not ( = ?auto_2499159 ?auto_2499164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2499160 ?auto_2499161 ?auto_2499162 )
      ( MAKE-16CRATE-VERIFY ?auto_2499146 ?auto_2499147 ?auto_2499148 ?auto_2499150 ?auto_2499149 ?auto_2499151 ?auto_2499152 ?auto_2499153 ?auto_2499154 ?auto_2499155 ?auto_2499156 ?auto_2499157 ?auto_2499158 ?auto_2499159 ?auto_2499160 ?auto_2499161 ?auto_2499162 ) )
  )

)

