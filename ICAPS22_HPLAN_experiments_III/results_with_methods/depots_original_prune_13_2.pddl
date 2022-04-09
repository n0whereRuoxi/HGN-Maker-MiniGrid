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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976550 - SURFACE
      ?auto_976551 - SURFACE
    )
    :vars
    (
      ?auto_976552 - HOIST
      ?auto_976553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976552 ?auto_976553 ) ( SURFACE-AT ?auto_976550 ?auto_976553 ) ( CLEAR ?auto_976550 ) ( LIFTING ?auto_976552 ?auto_976551 ) ( IS-CRATE ?auto_976551 ) ( not ( = ?auto_976550 ?auto_976551 ) ) )
    :subtasks
    ( ( !DROP ?auto_976552 ?auto_976551 ?auto_976550 ?auto_976553 )
      ( MAKE-1CRATE-VERIFY ?auto_976550 ?auto_976551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976554 - SURFACE
      ?auto_976555 - SURFACE
    )
    :vars
    (
      ?auto_976557 - HOIST
      ?auto_976556 - PLACE
      ?auto_976558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976557 ?auto_976556 ) ( SURFACE-AT ?auto_976554 ?auto_976556 ) ( CLEAR ?auto_976554 ) ( IS-CRATE ?auto_976555 ) ( not ( = ?auto_976554 ?auto_976555 ) ) ( TRUCK-AT ?auto_976558 ?auto_976556 ) ( AVAILABLE ?auto_976557 ) ( IN ?auto_976555 ?auto_976558 ) )
    :subtasks
    ( ( !UNLOAD ?auto_976557 ?auto_976555 ?auto_976558 ?auto_976556 )
      ( MAKE-1CRATE ?auto_976554 ?auto_976555 )
      ( MAKE-1CRATE-VERIFY ?auto_976554 ?auto_976555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976559 - SURFACE
      ?auto_976560 - SURFACE
    )
    :vars
    (
      ?auto_976563 - HOIST
      ?auto_976561 - PLACE
      ?auto_976562 - TRUCK
      ?auto_976564 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976563 ?auto_976561 ) ( SURFACE-AT ?auto_976559 ?auto_976561 ) ( CLEAR ?auto_976559 ) ( IS-CRATE ?auto_976560 ) ( not ( = ?auto_976559 ?auto_976560 ) ) ( AVAILABLE ?auto_976563 ) ( IN ?auto_976560 ?auto_976562 ) ( TRUCK-AT ?auto_976562 ?auto_976564 ) ( not ( = ?auto_976564 ?auto_976561 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_976562 ?auto_976564 ?auto_976561 )
      ( MAKE-1CRATE ?auto_976559 ?auto_976560 )
      ( MAKE-1CRATE-VERIFY ?auto_976559 ?auto_976560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976565 - SURFACE
      ?auto_976566 - SURFACE
    )
    :vars
    (
      ?auto_976568 - HOIST
      ?auto_976570 - PLACE
      ?auto_976567 - TRUCK
      ?auto_976569 - PLACE
      ?auto_976571 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_976568 ?auto_976570 ) ( SURFACE-AT ?auto_976565 ?auto_976570 ) ( CLEAR ?auto_976565 ) ( IS-CRATE ?auto_976566 ) ( not ( = ?auto_976565 ?auto_976566 ) ) ( AVAILABLE ?auto_976568 ) ( TRUCK-AT ?auto_976567 ?auto_976569 ) ( not ( = ?auto_976569 ?auto_976570 ) ) ( HOIST-AT ?auto_976571 ?auto_976569 ) ( LIFTING ?auto_976571 ?auto_976566 ) ( not ( = ?auto_976568 ?auto_976571 ) ) )
    :subtasks
    ( ( !LOAD ?auto_976571 ?auto_976566 ?auto_976567 ?auto_976569 )
      ( MAKE-1CRATE ?auto_976565 ?auto_976566 )
      ( MAKE-1CRATE-VERIFY ?auto_976565 ?auto_976566 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976572 - SURFACE
      ?auto_976573 - SURFACE
    )
    :vars
    (
      ?auto_976575 - HOIST
      ?auto_976576 - PLACE
      ?auto_976577 - TRUCK
      ?auto_976578 - PLACE
      ?auto_976574 - HOIST
      ?auto_976579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976575 ?auto_976576 ) ( SURFACE-AT ?auto_976572 ?auto_976576 ) ( CLEAR ?auto_976572 ) ( IS-CRATE ?auto_976573 ) ( not ( = ?auto_976572 ?auto_976573 ) ) ( AVAILABLE ?auto_976575 ) ( TRUCK-AT ?auto_976577 ?auto_976578 ) ( not ( = ?auto_976578 ?auto_976576 ) ) ( HOIST-AT ?auto_976574 ?auto_976578 ) ( not ( = ?auto_976575 ?auto_976574 ) ) ( AVAILABLE ?auto_976574 ) ( SURFACE-AT ?auto_976573 ?auto_976578 ) ( ON ?auto_976573 ?auto_976579 ) ( CLEAR ?auto_976573 ) ( not ( = ?auto_976572 ?auto_976579 ) ) ( not ( = ?auto_976573 ?auto_976579 ) ) )
    :subtasks
    ( ( !LIFT ?auto_976574 ?auto_976573 ?auto_976579 ?auto_976578 )
      ( MAKE-1CRATE ?auto_976572 ?auto_976573 )
      ( MAKE-1CRATE-VERIFY ?auto_976572 ?auto_976573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976580 - SURFACE
      ?auto_976581 - SURFACE
    )
    :vars
    (
      ?auto_976587 - HOIST
      ?auto_976585 - PLACE
      ?auto_976583 - PLACE
      ?auto_976582 - HOIST
      ?auto_976586 - SURFACE
      ?auto_976584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976587 ?auto_976585 ) ( SURFACE-AT ?auto_976580 ?auto_976585 ) ( CLEAR ?auto_976580 ) ( IS-CRATE ?auto_976581 ) ( not ( = ?auto_976580 ?auto_976581 ) ) ( AVAILABLE ?auto_976587 ) ( not ( = ?auto_976583 ?auto_976585 ) ) ( HOIST-AT ?auto_976582 ?auto_976583 ) ( not ( = ?auto_976587 ?auto_976582 ) ) ( AVAILABLE ?auto_976582 ) ( SURFACE-AT ?auto_976581 ?auto_976583 ) ( ON ?auto_976581 ?auto_976586 ) ( CLEAR ?auto_976581 ) ( not ( = ?auto_976580 ?auto_976586 ) ) ( not ( = ?auto_976581 ?auto_976586 ) ) ( TRUCK-AT ?auto_976584 ?auto_976585 ) )
    :subtasks
    ( ( !DRIVE ?auto_976584 ?auto_976585 ?auto_976583 )
      ( MAKE-1CRATE ?auto_976580 ?auto_976581 )
      ( MAKE-1CRATE-VERIFY ?auto_976580 ?auto_976581 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976597 - SURFACE
      ?auto_976598 - SURFACE
      ?auto_976599 - SURFACE
    )
    :vars
    (
      ?auto_976601 - HOIST
      ?auto_976600 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976601 ?auto_976600 ) ( SURFACE-AT ?auto_976598 ?auto_976600 ) ( CLEAR ?auto_976598 ) ( LIFTING ?auto_976601 ?auto_976599 ) ( IS-CRATE ?auto_976599 ) ( not ( = ?auto_976598 ?auto_976599 ) ) ( ON ?auto_976598 ?auto_976597 ) ( not ( = ?auto_976597 ?auto_976598 ) ) ( not ( = ?auto_976597 ?auto_976599 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976598 ?auto_976599 )
      ( MAKE-2CRATE-VERIFY ?auto_976597 ?auto_976598 ?auto_976599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976607 - SURFACE
      ?auto_976608 - SURFACE
      ?auto_976609 - SURFACE
    )
    :vars
    (
      ?auto_976610 - HOIST
      ?auto_976611 - PLACE
      ?auto_976612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976610 ?auto_976611 ) ( SURFACE-AT ?auto_976608 ?auto_976611 ) ( CLEAR ?auto_976608 ) ( IS-CRATE ?auto_976609 ) ( not ( = ?auto_976608 ?auto_976609 ) ) ( TRUCK-AT ?auto_976612 ?auto_976611 ) ( AVAILABLE ?auto_976610 ) ( IN ?auto_976609 ?auto_976612 ) ( ON ?auto_976608 ?auto_976607 ) ( not ( = ?auto_976607 ?auto_976608 ) ) ( not ( = ?auto_976607 ?auto_976609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976608 ?auto_976609 )
      ( MAKE-2CRATE-VERIFY ?auto_976607 ?auto_976608 ?auto_976609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976613 - SURFACE
      ?auto_976614 - SURFACE
    )
    :vars
    (
      ?auto_976617 - HOIST
      ?auto_976615 - PLACE
      ?auto_976616 - TRUCK
      ?auto_976618 - SURFACE
      ?auto_976619 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976617 ?auto_976615 ) ( SURFACE-AT ?auto_976613 ?auto_976615 ) ( CLEAR ?auto_976613 ) ( IS-CRATE ?auto_976614 ) ( not ( = ?auto_976613 ?auto_976614 ) ) ( AVAILABLE ?auto_976617 ) ( IN ?auto_976614 ?auto_976616 ) ( ON ?auto_976613 ?auto_976618 ) ( not ( = ?auto_976618 ?auto_976613 ) ) ( not ( = ?auto_976618 ?auto_976614 ) ) ( TRUCK-AT ?auto_976616 ?auto_976619 ) ( not ( = ?auto_976619 ?auto_976615 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_976616 ?auto_976619 ?auto_976615 )
      ( MAKE-2CRATE ?auto_976618 ?auto_976613 ?auto_976614 )
      ( MAKE-1CRATE-VERIFY ?auto_976613 ?auto_976614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976620 - SURFACE
      ?auto_976621 - SURFACE
      ?auto_976622 - SURFACE
    )
    :vars
    (
      ?auto_976625 - HOIST
      ?auto_976626 - PLACE
      ?auto_976624 - TRUCK
      ?auto_976623 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976625 ?auto_976626 ) ( SURFACE-AT ?auto_976621 ?auto_976626 ) ( CLEAR ?auto_976621 ) ( IS-CRATE ?auto_976622 ) ( not ( = ?auto_976621 ?auto_976622 ) ) ( AVAILABLE ?auto_976625 ) ( IN ?auto_976622 ?auto_976624 ) ( ON ?auto_976621 ?auto_976620 ) ( not ( = ?auto_976620 ?auto_976621 ) ) ( not ( = ?auto_976620 ?auto_976622 ) ) ( TRUCK-AT ?auto_976624 ?auto_976623 ) ( not ( = ?auto_976623 ?auto_976626 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976621 ?auto_976622 )
      ( MAKE-2CRATE-VERIFY ?auto_976620 ?auto_976621 ?auto_976622 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976627 - SURFACE
      ?auto_976628 - SURFACE
    )
    :vars
    (
      ?auto_976629 - HOIST
      ?auto_976630 - PLACE
      ?auto_976632 - SURFACE
      ?auto_976631 - TRUCK
      ?auto_976633 - PLACE
      ?auto_976634 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_976629 ?auto_976630 ) ( SURFACE-AT ?auto_976627 ?auto_976630 ) ( CLEAR ?auto_976627 ) ( IS-CRATE ?auto_976628 ) ( not ( = ?auto_976627 ?auto_976628 ) ) ( AVAILABLE ?auto_976629 ) ( ON ?auto_976627 ?auto_976632 ) ( not ( = ?auto_976632 ?auto_976627 ) ) ( not ( = ?auto_976632 ?auto_976628 ) ) ( TRUCK-AT ?auto_976631 ?auto_976633 ) ( not ( = ?auto_976633 ?auto_976630 ) ) ( HOIST-AT ?auto_976634 ?auto_976633 ) ( LIFTING ?auto_976634 ?auto_976628 ) ( not ( = ?auto_976629 ?auto_976634 ) ) )
    :subtasks
    ( ( !LOAD ?auto_976634 ?auto_976628 ?auto_976631 ?auto_976633 )
      ( MAKE-2CRATE ?auto_976632 ?auto_976627 ?auto_976628 )
      ( MAKE-1CRATE-VERIFY ?auto_976627 ?auto_976628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976635 - SURFACE
      ?auto_976636 - SURFACE
      ?auto_976637 - SURFACE
    )
    :vars
    (
      ?auto_976639 - HOIST
      ?auto_976642 - PLACE
      ?auto_976641 - TRUCK
      ?auto_976638 - PLACE
      ?auto_976640 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_976639 ?auto_976642 ) ( SURFACE-AT ?auto_976636 ?auto_976642 ) ( CLEAR ?auto_976636 ) ( IS-CRATE ?auto_976637 ) ( not ( = ?auto_976636 ?auto_976637 ) ) ( AVAILABLE ?auto_976639 ) ( ON ?auto_976636 ?auto_976635 ) ( not ( = ?auto_976635 ?auto_976636 ) ) ( not ( = ?auto_976635 ?auto_976637 ) ) ( TRUCK-AT ?auto_976641 ?auto_976638 ) ( not ( = ?auto_976638 ?auto_976642 ) ) ( HOIST-AT ?auto_976640 ?auto_976638 ) ( LIFTING ?auto_976640 ?auto_976637 ) ( not ( = ?auto_976639 ?auto_976640 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976636 ?auto_976637 )
      ( MAKE-2CRATE-VERIFY ?auto_976635 ?auto_976636 ?auto_976637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976643 - SURFACE
      ?auto_976644 - SURFACE
    )
    :vars
    (
      ?auto_976645 - HOIST
      ?auto_976649 - PLACE
      ?auto_976646 - SURFACE
      ?auto_976647 - TRUCK
      ?auto_976650 - PLACE
      ?auto_976648 - HOIST
      ?auto_976651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976645 ?auto_976649 ) ( SURFACE-AT ?auto_976643 ?auto_976649 ) ( CLEAR ?auto_976643 ) ( IS-CRATE ?auto_976644 ) ( not ( = ?auto_976643 ?auto_976644 ) ) ( AVAILABLE ?auto_976645 ) ( ON ?auto_976643 ?auto_976646 ) ( not ( = ?auto_976646 ?auto_976643 ) ) ( not ( = ?auto_976646 ?auto_976644 ) ) ( TRUCK-AT ?auto_976647 ?auto_976650 ) ( not ( = ?auto_976650 ?auto_976649 ) ) ( HOIST-AT ?auto_976648 ?auto_976650 ) ( not ( = ?auto_976645 ?auto_976648 ) ) ( AVAILABLE ?auto_976648 ) ( SURFACE-AT ?auto_976644 ?auto_976650 ) ( ON ?auto_976644 ?auto_976651 ) ( CLEAR ?auto_976644 ) ( not ( = ?auto_976643 ?auto_976651 ) ) ( not ( = ?auto_976644 ?auto_976651 ) ) ( not ( = ?auto_976646 ?auto_976651 ) ) )
    :subtasks
    ( ( !LIFT ?auto_976648 ?auto_976644 ?auto_976651 ?auto_976650 )
      ( MAKE-2CRATE ?auto_976646 ?auto_976643 ?auto_976644 )
      ( MAKE-1CRATE-VERIFY ?auto_976643 ?auto_976644 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976652 - SURFACE
      ?auto_976653 - SURFACE
      ?auto_976654 - SURFACE
    )
    :vars
    (
      ?auto_976659 - HOIST
      ?auto_976657 - PLACE
      ?auto_976660 - TRUCK
      ?auto_976658 - PLACE
      ?auto_976656 - HOIST
      ?auto_976655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976659 ?auto_976657 ) ( SURFACE-AT ?auto_976653 ?auto_976657 ) ( CLEAR ?auto_976653 ) ( IS-CRATE ?auto_976654 ) ( not ( = ?auto_976653 ?auto_976654 ) ) ( AVAILABLE ?auto_976659 ) ( ON ?auto_976653 ?auto_976652 ) ( not ( = ?auto_976652 ?auto_976653 ) ) ( not ( = ?auto_976652 ?auto_976654 ) ) ( TRUCK-AT ?auto_976660 ?auto_976658 ) ( not ( = ?auto_976658 ?auto_976657 ) ) ( HOIST-AT ?auto_976656 ?auto_976658 ) ( not ( = ?auto_976659 ?auto_976656 ) ) ( AVAILABLE ?auto_976656 ) ( SURFACE-AT ?auto_976654 ?auto_976658 ) ( ON ?auto_976654 ?auto_976655 ) ( CLEAR ?auto_976654 ) ( not ( = ?auto_976653 ?auto_976655 ) ) ( not ( = ?auto_976654 ?auto_976655 ) ) ( not ( = ?auto_976652 ?auto_976655 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976653 ?auto_976654 )
      ( MAKE-2CRATE-VERIFY ?auto_976652 ?auto_976653 ?auto_976654 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976661 - SURFACE
      ?auto_976662 - SURFACE
    )
    :vars
    (
      ?auto_976665 - HOIST
      ?auto_976663 - PLACE
      ?auto_976667 - SURFACE
      ?auto_976664 - PLACE
      ?auto_976668 - HOIST
      ?auto_976669 - SURFACE
      ?auto_976666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976665 ?auto_976663 ) ( SURFACE-AT ?auto_976661 ?auto_976663 ) ( CLEAR ?auto_976661 ) ( IS-CRATE ?auto_976662 ) ( not ( = ?auto_976661 ?auto_976662 ) ) ( AVAILABLE ?auto_976665 ) ( ON ?auto_976661 ?auto_976667 ) ( not ( = ?auto_976667 ?auto_976661 ) ) ( not ( = ?auto_976667 ?auto_976662 ) ) ( not ( = ?auto_976664 ?auto_976663 ) ) ( HOIST-AT ?auto_976668 ?auto_976664 ) ( not ( = ?auto_976665 ?auto_976668 ) ) ( AVAILABLE ?auto_976668 ) ( SURFACE-AT ?auto_976662 ?auto_976664 ) ( ON ?auto_976662 ?auto_976669 ) ( CLEAR ?auto_976662 ) ( not ( = ?auto_976661 ?auto_976669 ) ) ( not ( = ?auto_976662 ?auto_976669 ) ) ( not ( = ?auto_976667 ?auto_976669 ) ) ( TRUCK-AT ?auto_976666 ?auto_976663 ) )
    :subtasks
    ( ( !DRIVE ?auto_976666 ?auto_976663 ?auto_976664 )
      ( MAKE-2CRATE ?auto_976667 ?auto_976661 ?auto_976662 )
      ( MAKE-1CRATE-VERIFY ?auto_976661 ?auto_976662 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976670 - SURFACE
      ?auto_976671 - SURFACE
      ?auto_976672 - SURFACE
    )
    :vars
    (
      ?auto_976674 - HOIST
      ?auto_976676 - PLACE
      ?auto_976675 - PLACE
      ?auto_976677 - HOIST
      ?auto_976673 - SURFACE
      ?auto_976678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976674 ?auto_976676 ) ( SURFACE-AT ?auto_976671 ?auto_976676 ) ( CLEAR ?auto_976671 ) ( IS-CRATE ?auto_976672 ) ( not ( = ?auto_976671 ?auto_976672 ) ) ( AVAILABLE ?auto_976674 ) ( ON ?auto_976671 ?auto_976670 ) ( not ( = ?auto_976670 ?auto_976671 ) ) ( not ( = ?auto_976670 ?auto_976672 ) ) ( not ( = ?auto_976675 ?auto_976676 ) ) ( HOIST-AT ?auto_976677 ?auto_976675 ) ( not ( = ?auto_976674 ?auto_976677 ) ) ( AVAILABLE ?auto_976677 ) ( SURFACE-AT ?auto_976672 ?auto_976675 ) ( ON ?auto_976672 ?auto_976673 ) ( CLEAR ?auto_976672 ) ( not ( = ?auto_976671 ?auto_976673 ) ) ( not ( = ?auto_976672 ?auto_976673 ) ) ( not ( = ?auto_976670 ?auto_976673 ) ) ( TRUCK-AT ?auto_976678 ?auto_976676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976671 ?auto_976672 )
      ( MAKE-2CRATE-VERIFY ?auto_976670 ?auto_976671 ?auto_976672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976679 - SURFACE
      ?auto_976680 - SURFACE
    )
    :vars
    (
      ?auto_976686 - HOIST
      ?auto_976683 - PLACE
      ?auto_976681 - SURFACE
      ?auto_976685 - PLACE
      ?auto_976682 - HOIST
      ?auto_976684 - SURFACE
      ?auto_976687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976686 ?auto_976683 ) ( IS-CRATE ?auto_976680 ) ( not ( = ?auto_976679 ?auto_976680 ) ) ( not ( = ?auto_976681 ?auto_976679 ) ) ( not ( = ?auto_976681 ?auto_976680 ) ) ( not ( = ?auto_976685 ?auto_976683 ) ) ( HOIST-AT ?auto_976682 ?auto_976685 ) ( not ( = ?auto_976686 ?auto_976682 ) ) ( AVAILABLE ?auto_976682 ) ( SURFACE-AT ?auto_976680 ?auto_976685 ) ( ON ?auto_976680 ?auto_976684 ) ( CLEAR ?auto_976680 ) ( not ( = ?auto_976679 ?auto_976684 ) ) ( not ( = ?auto_976680 ?auto_976684 ) ) ( not ( = ?auto_976681 ?auto_976684 ) ) ( TRUCK-AT ?auto_976687 ?auto_976683 ) ( SURFACE-AT ?auto_976681 ?auto_976683 ) ( CLEAR ?auto_976681 ) ( LIFTING ?auto_976686 ?auto_976679 ) ( IS-CRATE ?auto_976679 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976681 ?auto_976679 )
      ( MAKE-2CRATE ?auto_976681 ?auto_976679 ?auto_976680 )
      ( MAKE-1CRATE-VERIFY ?auto_976679 ?auto_976680 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976688 - SURFACE
      ?auto_976689 - SURFACE
      ?auto_976690 - SURFACE
    )
    :vars
    (
      ?auto_976691 - HOIST
      ?auto_976693 - PLACE
      ?auto_976694 - PLACE
      ?auto_976692 - HOIST
      ?auto_976695 - SURFACE
      ?auto_976696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976691 ?auto_976693 ) ( IS-CRATE ?auto_976690 ) ( not ( = ?auto_976689 ?auto_976690 ) ) ( not ( = ?auto_976688 ?auto_976689 ) ) ( not ( = ?auto_976688 ?auto_976690 ) ) ( not ( = ?auto_976694 ?auto_976693 ) ) ( HOIST-AT ?auto_976692 ?auto_976694 ) ( not ( = ?auto_976691 ?auto_976692 ) ) ( AVAILABLE ?auto_976692 ) ( SURFACE-AT ?auto_976690 ?auto_976694 ) ( ON ?auto_976690 ?auto_976695 ) ( CLEAR ?auto_976690 ) ( not ( = ?auto_976689 ?auto_976695 ) ) ( not ( = ?auto_976690 ?auto_976695 ) ) ( not ( = ?auto_976688 ?auto_976695 ) ) ( TRUCK-AT ?auto_976696 ?auto_976693 ) ( SURFACE-AT ?auto_976688 ?auto_976693 ) ( CLEAR ?auto_976688 ) ( LIFTING ?auto_976691 ?auto_976689 ) ( IS-CRATE ?auto_976689 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976689 ?auto_976690 )
      ( MAKE-2CRATE-VERIFY ?auto_976688 ?auto_976689 ?auto_976690 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976697 - SURFACE
      ?auto_976698 - SURFACE
    )
    :vars
    (
      ?auto_976703 - HOIST
      ?auto_976700 - PLACE
      ?auto_976699 - SURFACE
      ?auto_976702 - PLACE
      ?auto_976705 - HOIST
      ?auto_976701 - SURFACE
      ?auto_976704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976703 ?auto_976700 ) ( IS-CRATE ?auto_976698 ) ( not ( = ?auto_976697 ?auto_976698 ) ) ( not ( = ?auto_976699 ?auto_976697 ) ) ( not ( = ?auto_976699 ?auto_976698 ) ) ( not ( = ?auto_976702 ?auto_976700 ) ) ( HOIST-AT ?auto_976705 ?auto_976702 ) ( not ( = ?auto_976703 ?auto_976705 ) ) ( AVAILABLE ?auto_976705 ) ( SURFACE-AT ?auto_976698 ?auto_976702 ) ( ON ?auto_976698 ?auto_976701 ) ( CLEAR ?auto_976698 ) ( not ( = ?auto_976697 ?auto_976701 ) ) ( not ( = ?auto_976698 ?auto_976701 ) ) ( not ( = ?auto_976699 ?auto_976701 ) ) ( TRUCK-AT ?auto_976704 ?auto_976700 ) ( SURFACE-AT ?auto_976699 ?auto_976700 ) ( CLEAR ?auto_976699 ) ( IS-CRATE ?auto_976697 ) ( AVAILABLE ?auto_976703 ) ( IN ?auto_976697 ?auto_976704 ) )
    :subtasks
    ( ( !UNLOAD ?auto_976703 ?auto_976697 ?auto_976704 ?auto_976700 )
      ( MAKE-2CRATE ?auto_976699 ?auto_976697 ?auto_976698 )
      ( MAKE-1CRATE-VERIFY ?auto_976697 ?auto_976698 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976706 - SURFACE
      ?auto_976707 - SURFACE
      ?auto_976708 - SURFACE
    )
    :vars
    (
      ?auto_976709 - HOIST
      ?auto_976711 - PLACE
      ?auto_976712 - PLACE
      ?auto_976713 - HOIST
      ?auto_976710 - SURFACE
      ?auto_976714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976709 ?auto_976711 ) ( IS-CRATE ?auto_976708 ) ( not ( = ?auto_976707 ?auto_976708 ) ) ( not ( = ?auto_976706 ?auto_976707 ) ) ( not ( = ?auto_976706 ?auto_976708 ) ) ( not ( = ?auto_976712 ?auto_976711 ) ) ( HOIST-AT ?auto_976713 ?auto_976712 ) ( not ( = ?auto_976709 ?auto_976713 ) ) ( AVAILABLE ?auto_976713 ) ( SURFACE-AT ?auto_976708 ?auto_976712 ) ( ON ?auto_976708 ?auto_976710 ) ( CLEAR ?auto_976708 ) ( not ( = ?auto_976707 ?auto_976710 ) ) ( not ( = ?auto_976708 ?auto_976710 ) ) ( not ( = ?auto_976706 ?auto_976710 ) ) ( TRUCK-AT ?auto_976714 ?auto_976711 ) ( SURFACE-AT ?auto_976706 ?auto_976711 ) ( CLEAR ?auto_976706 ) ( IS-CRATE ?auto_976707 ) ( AVAILABLE ?auto_976709 ) ( IN ?auto_976707 ?auto_976714 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976707 ?auto_976708 )
      ( MAKE-2CRATE-VERIFY ?auto_976706 ?auto_976707 ?auto_976708 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976715 - SURFACE
      ?auto_976716 - SURFACE
    )
    :vars
    (
      ?auto_976722 - HOIST
      ?auto_976719 - PLACE
      ?auto_976720 - SURFACE
      ?auto_976721 - PLACE
      ?auto_976723 - HOIST
      ?auto_976718 - SURFACE
      ?auto_976717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976722 ?auto_976719 ) ( IS-CRATE ?auto_976716 ) ( not ( = ?auto_976715 ?auto_976716 ) ) ( not ( = ?auto_976720 ?auto_976715 ) ) ( not ( = ?auto_976720 ?auto_976716 ) ) ( not ( = ?auto_976721 ?auto_976719 ) ) ( HOIST-AT ?auto_976723 ?auto_976721 ) ( not ( = ?auto_976722 ?auto_976723 ) ) ( AVAILABLE ?auto_976723 ) ( SURFACE-AT ?auto_976716 ?auto_976721 ) ( ON ?auto_976716 ?auto_976718 ) ( CLEAR ?auto_976716 ) ( not ( = ?auto_976715 ?auto_976718 ) ) ( not ( = ?auto_976716 ?auto_976718 ) ) ( not ( = ?auto_976720 ?auto_976718 ) ) ( SURFACE-AT ?auto_976720 ?auto_976719 ) ( CLEAR ?auto_976720 ) ( IS-CRATE ?auto_976715 ) ( AVAILABLE ?auto_976722 ) ( IN ?auto_976715 ?auto_976717 ) ( TRUCK-AT ?auto_976717 ?auto_976721 ) )
    :subtasks
    ( ( !DRIVE ?auto_976717 ?auto_976721 ?auto_976719 )
      ( MAKE-2CRATE ?auto_976720 ?auto_976715 ?auto_976716 )
      ( MAKE-1CRATE-VERIFY ?auto_976715 ?auto_976716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976724 - SURFACE
      ?auto_976725 - SURFACE
      ?auto_976726 - SURFACE
    )
    :vars
    (
      ?auto_976732 - HOIST
      ?auto_976728 - PLACE
      ?auto_976729 - PLACE
      ?auto_976727 - HOIST
      ?auto_976731 - SURFACE
      ?auto_976730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976732 ?auto_976728 ) ( IS-CRATE ?auto_976726 ) ( not ( = ?auto_976725 ?auto_976726 ) ) ( not ( = ?auto_976724 ?auto_976725 ) ) ( not ( = ?auto_976724 ?auto_976726 ) ) ( not ( = ?auto_976729 ?auto_976728 ) ) ( HOIST-AT ?auto_976727 ?auto_976729 ) ( not ( = ?auto_976732 ?auto_976727 ) ) ( AVAILABLE ?auto_976727 ) ( SURFACE-AT ?auto_976726 ?auto_976729 ) ( ON ?auto_976726 ?auto_976731 ) ( CLEAR ?auto_976726 ) ( not ( = ?auto_976725 ?auto_976731 ) ) ( not ( = ?auto_976726 ?auto_976731 ) ) ( not ( = ?auto_976724 ?auto_976731 ) ) ( SURFACE-AT ?auto_976724 ?auto_976728 ) ( CLEAR ?auto_976724 ) ( IS-CRATE ?auto_976725 ) ( AVAILABLE ?auto_976732 ) ( IN ?auto_976725 ?auto_976730 ) ( TRUCK-AT ?auto_976730 ?auto_976729 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976725 ?auto_976726 )
      ( MAKE-2CRATE-VERIFY ?auto_976724 ?auto_976725 ?auto_976726 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976733 - SURFACE
      ?auto_976734 - SURFACE
    )
    :vars
    (
      ?auto_976741 - HOIST
      ?auto_976737 - PLACE
      ?auto_976740 - SURFACE
      ?auto_976736 - PLACE
      ?auto_976738 - HOIST
      ?auto_976735 - SURFACE
      ?auto_976739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976741 ?auto_976737 ) ( IS-CRATE ?auto_976734 ) ( not ( = ?auto_976733 ?auto_976734 ) ) ( not ( = ?auto_976740 ?auto_976733 ) ) ( not ( = ?auto_976740 ?auto_976734 ) ) ( not ( = ?auto_976736 ?auto_976737 ) ) ( HOIST-AT ?auto_976738 ?auto_976736 ) ( not ( = ?auto_976741 ?auto_976738 ) ) ( SURFACE-AT ?auto_976734 ?auto_976736 ) ( ON ?auto_976734 ?auto_976735 ) ( CLEAR ?auto_976734 ) ( not ( = ?auto_976733 ?auto_976735 ) ) ( not ( = ?auto_976734 ?auto_976735 ) ) ( not ( = ?auto_976740 ?auto_976735 ) ) ( SURFACE-AT ?auto_976740 ?auto_976737 ) ( CLEAR ?auto_976740 ) ( IS-CRATE ?auto_976733 ) ( AVAILABLE ?auto_976741 ) ( TRUCK-AT ?auto_976739 ?auto_976736 ) ( LIFTING ?auto_976738 ?auto_976733 ) )
    :subtasks
    ( ( !LOAD ?auto_976738 ?auto_976733 ?auto_976739 ?auto_976736 )
      ( MAKE-2CRATE ?auto_976740 ?auto_976733 ?auto_976734 )
      ( MAKE-1CRATE-VERIFY ?auto_976733 ?auto_976734 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976742 - SURFACE
      ?auto_976743 - SURFACE
      ?auto_976744 - SURFACE
    )
    :vars
    (
      ?auto_976748 - HOIST
      ?auto_976750 - PLACE
      ?auto_976746 - PLACE
      ?auto_976749 - HOIST
      ?auto_976745 - SURFACE
      ?auto_976747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976748 ?auto_976750 ) ( IS-CRATE ?auto_976744 ) ( not ( = ?auto_976743 ?auto_976744 ) ) ( not ( = ?auto_976742 ?auto_976743 ) ) ( not ( = ?auto_976742 ?auto_976744 ) ) ( not ( = ?auto_976746 ?auto_976750 ) ) ( HOIST-AT ?auto_976749 ?auto_976746 ) ( not ( = ?auto_976748 ?auto_976749 ) ) ( SURFACE-AT ?auto_976744 ?auto_976746 ) ( ON ?auto_976744 ?auto_976745 ) ( CLEAR ?auto_976744 ) ( not ( = ?auto_976743 ?auto_976745 ) ) ( not ( = ?auto_976744 ?auto_976745 ) ) ( not ( = ?auto_976742 ?auto_976745 ) ) ( SURFACE-AT ?auto_976742 ?auto_976750 ) ( CLEAR ?auto_976742 ) ( IS-CRATE ?auto_976743 ) ( AVAILABLE ?auto_976748 ) ( TRUCK-AT ?auto_976747 ?auto_976746 ) ( LIFTING ?auto_976749 ?auto_976743 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976743 ?auto_976744 )
      ( MAKE-2CRATE-VERIFY ?auto_976742 ?auto_976743 ?auto_976744 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976751 - SURFACE
      ?auto_976752 - SURFACE
    )
    :vars
    (
      ?auto_976758 - HOIST
      ?auto_976757 - PLACE
      ?auto_976759 - SURFACE
      ?auto_976756 - PLACE
      ?auto_976754 - HOIST
      ?auto_976753 - SURFACE
      ?auto_976755 - TRUCK
      ?auto_976760 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976758 ?auto_976757 ) ( IS-CRATE ?auto_976752 ) ( not ( = ?auto_976751 ?auto_976752 ) ) ( not ( = ?auto_976759 ?auto_976751 ) ) ( not ( = ?auto_976759 ?auto_976752 ) ) ( not ( = ?auto_976756 ?auto_976757 ) ) ( HOIST-AT ?auto_976754 ?auto_976756 ) ( not ( = ?auto_976758 ?auto_976754 ) ) ( SURFACE-AT ?auto_976752 ?auto_976756 ) ( ON ?auto_976752 ?auto_976753 ) ( CLEAR ?auto_976752 ) ( not ( = ?auto_976751 ?auto_976753 ) ) ( not ( = ?auto_976752 ?auto_976753 ) ) ( not ( = ?auto_976759 ?auto_976753 ) ) ( SURFACE-AT ?auto_976759 ?auto_976757 ) ( CLEAR ?auto_976759 ) ( IS-CRATE ?auto_976751 ) ( AVAILABLE ?auto_976758 ) ( TRUCK-AT ?auto_976755 ?auto_976756 ) ( AVAILABLE ?auto_976754 ) ( SURFACE-AT ?auto_976751 ?auto_976756 ) ( ON ?auto_976751 ?auto_976760 ) ( CLEAR ?auto_976751 ) ( not ( = ?auto_976751 ?auto_976760 ) ) ( not ( = ?auto_976752 ?auto_976760 ) ) ( not ( = ?auto_976759 ?auto_976760 ) ) ( not ( = ?auto_976753 ?auto_976760 ) ) )
    :subtasks
    ( ( !LIFT ?auto_976754 ?auto_976751 ?auto_976760 ?auto_976756 )
      ( MAKE-2CRATE ?auto_976759 ?auto_976751 ?auto_976752 )
      ( MAKE-1CRATE-VERIFY ?auto_976751 ?auto_976752 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976761 - SURFACE
      ?auto_976762 - SURFACE
      ?auto_976763 - SURFACE
    )
    :vars
    (
      ?auto_976765 - HOIST
      ?auto_976768 - PLACE
      ?auto_976766 - PLACE
      ?auto_976767 - HOIST
      ?auto_976764 - SURFACE
      ?auto_976770 - TRUCK
      ?auto_976769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976765 ?auto_976768 ) ( IS-CRATE ?auto_976763 ) ( not ( = ?auto_976762 ?auto_976763 ) ) ( not ( = ?auto_976761 ?auto_976762 ) ) ( not ( = ?auto_976761 ?auto_976763 ) ) ( not ( = ?auto_976766 ?auto_976768 ) ) ( HOIST-AT ?auto_976767 ?auto_976766 ) ( not ( = ?auto_976765 ?auto_976767 ) ) ( SURFACE-AT ?auto_976763 ?auto_976766 ) ( ON ?auto_976763 ?auto_976764 ) ( CLEAR ?auto_976763 ) ( not ( = ?auto_976762 ?auto_976764 ) ) ( not ( = ?auto_976763 ?auto_976764 ) ) ( not ( = ?auto_976761 ?auto_976764 ) ) ( SURFACE-AT ?auto_976761 ?auto_976768 ) ( CLEAR ?auto_976761 ) ( IS-CRATE ?auto_976762 ) ( AVAILABLE ?auto_976765 ) ( TRUCK-AT ?auto_976770 ?auto_976766 ) ( AVAILABLE ?auto_976767 ) ( SURFACE-AT ?auto_976762 ?auto_976766 ) ( ON ?auto_976762 ?auto_976769 ) ( CLEAR ?auto_976762 ) ( not ( = ?auto_976762 ?auto_976769 ) ) ( not ( = ?auto_976763 ?auto_976769 ) ) ( not ( = ?auto_976761 ?auto_976769 ) ) ( not ( = ?auto_976764 ?auto_976769 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976762 ?auto_976763 )
      ( MAKE-2CRATE-VERIFY ?auto_976761 ?auto_976762 ?auto_976763 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_976771 - SURFACE
      ?auto_976772 - SURFACE
    )
    :vars
    (
      ?auto_976779 - HOIST
      ?auto_976775 - PLACE
      ?auto_976774 - SURFACE
      ?auto_976780 - PLACE
      ?auto_976776 - HOIST
      ?auto_976777 - SURFACE
      ?auto_976773 - SURFACE
      ?auto_976778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976779 ?auto_976775 ) ( IS-CRATE ?auto_976772 ) ( not ( = ?auto_976771 ?auto_976772 ) ) ( not ( = ?auto_976774 ?auto_976771 ) ) ( not ( = ?auto_976774 ?auto_976772 ) ) ( not ( = ?auto_976780 ?auto_976775 ) ) ( HOIST-AT ?auto_976776 ?auto_976780 ) ( not ( = ?auto_976779 ?auto_976776 ) ) ( SURFACE-AT ?auto_976772 ?auto_976780 ) ( ON ?auto_976772 ?auto_976777 ) ( CLEAR ?auto_976772 ) ( not ( = ?auto_976771 ?auto_976777 ) ) ( not ( = ?auto_976772 ?auto_976777 ) ) ( not ( = ?auto_976774 ?auto_976777 ) ) ( SURFACE-AT ?auto_976774 ?auto_976775 ) ( CLEAR ?auto_976774 ) ( IS-CRATE ?auto_976771 ) ( AVAILABLE ?auto_976779 ) ( AVAILABLE ?auto_976776 ) ( SURFACE-AT ?auto_976771 ?auto_976780 ) ( ON ?auto_976771 ?auto_976773 ) ( CLEAR ?auto_976771 ) ( not ( = ?auto_976771 ?auto_976773 ) ) ( not ( = ?auto_976772 ?auto_976773 ) ) ( not ( = ?auto_976774 ?auto_976773 ) ) ( not ( = ?auto_976777 ?auto_976773 ) ) ( TRUCK-AT ?auto_976778 ?auto_976775 ) )
    :subtasks
    ( ( !DRIVE ?auto_976778 ?auto_976775 ?auto_976780 )
      ( MAKE-2CRATE ?auto_976774 ?auto_976771 ?auto_976772 )
      ( MAKE-1CRATE-VERIFY ?auto_976771 ?auto_976772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976781 - SURFACE
      ?auto_976782 - SURFACE
      ?auto_976783 - SURFACE
    )
    :vars
    (
      ?auto_976789 - HOIST
      ?auto_976785 - PLACE
      ?auto_976788 - PLACE
      ?auto_976787 - HOIST
      ?auto_976786 - SURFACE
      ?auto_976784 - SURFACE
      ?auto_976790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976789 ?auto_976785 ) ( IS-CRATE ?auto_976783 ) ( not ( = ?auto_976782 ?auto_976783 ) ) ( not ( = ?auto_976781 ?auto_976782 ) ) ( not ( = ?auto_976781 ?auto_976783 ) ) ( not ( = ?auto_976788 ?auto_976785 ) ) ( HOIST-AT ?auto_976787 ?auto_976788 ) ( not ( = ?auto_976789 ?auto_976787 ) ) ( SURFACE-AT ?auto_976783 ?auto_976788 ) ( ON ?auto_976783 ?auto_976786 ) ( CLEAR ?auto_976783 ) ( not ( = ?auto_976782 ?auto_976786 ) ) ( not ( = ?auto_976783 ?auto_976786 ) ) ( not ( = ?auto_976781 ?auto_976786 ) ) ( SURFACE-AT ?auto_976781 ?auto_976785 ) ( CLEAR ?auto_976781 ) ( IS-CRATE ?auto_976782 ) ( AVAILABLE ?auto_976789 ) ( AVAILABLE ?auto_976787 ) ( SURFACE-AT ?auto_976782 ?auto_976788 ) ( ON ?auto_976782 ?auto_976784 ) ( CLEAR ?auto_976782 ) ( not ( = ?auto_976782 ?auto_976784 ) ) ( not ( = ?auto_976783 ?auto_976784 ) ) ( not ( = ?auto_976781 ?auto_976784 ) ) ( not ( = ?auto_976786 ?auto_976784 ) ) ( TRUCK-AT ?auto_976790 ?auto_976785 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976782 ?auto_976783 )
      ( MAKE-2CRATE-VERIFY ?auto_976781 ?auto_976782 ?auto_976783 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976809 - SURFACE
      ?auto_976810 - SURFACE
      ?auto_976811 - SURFACE
      ?auto_976812 - SURFACE
    )
    :vars
    (
      ?auto_976814 - HOIST
      ?auto_976813 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976814 ?auto_976813 ) ( SURFACE-AT ?auto_976811 ?auto_976813 ) ( CLEAR ?auto_976811 ) ( LIFTING ?auto_976814 ?auto_976812 ) ( IS-CRATE ?auto_976812 ) ( not ( = ?auto_976811 ?auto_976812 ) ) ( ON ?auto_976810 ?auto_976809 ) ( ON ?auto_976811 ?auto_976810 ) ( not ( = ?auto_976809 ?auto_976810 ) ) ( not ( = ?auto_976809 ?auto_976811 ) ) ( not ( = ?auto_976809 ?auto_976812 ) ) ( not ( = ?auto_976810 ?auto_976811 ) ) ( not ( = ?auto_976810 ?auto_976812 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_976811 ?auto_976812 )
      ( MAKE-3CRATE-VERIFY ?auto_976809 ?auto_976810 ?auto_976811 ?auto_976812 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976826 - SURFACE
      ?auto_976827 - SURFACE
      ?auto_976828 - SURFACE
      ?auto_976829 - SURFACE
    )
    :vars
    (
      ?auto_976831 - HOIST
      ?auto_976830 - PLACE
      ?auto_976832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976831 ?auto_976830 ) ( SURFACE-AT ?auto_976828 ?auto_976830 ) ( CLEAR ?auto_976828 ) ( IS-CRATE ?auto_976829 ) ( not ( = ?auto_976828 ?auto_976829 ) ) ( TRUCK-AT ?auto_976832 ?auto_976830 ) ( AVAILABLE ?auto_976831 ) ( IN ?auto_976829 ?auto_976832 ) ( ON ?auto_976828 ?auto_976827 ) ( not ( = ?auto_976827 ?auto_976828 ) ) ( not ( = ?auto_976827 ?auto_976829 ) ) ( ON ?auto_976827 ?auto_976826 ) ( not ( = ?auto_976826 ?auto_976827 ) ) ( not ( = ?auto_976826 ?auto_976828 ) ) ( not ( = ?auto_976826 ?auto_976829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_976827 ?auto_976828 ?auto_976829 )
      ( MAKE-3CRATE-VERIFY ?auto_976826 ?auto_976827 ?auto_976828 ?auto_976829 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976847 - SURFACE
      ?auto_976848 - SURFACE
      ?auto_976849 - SURFACE
      ?auto_976850 - SURFACE
    )
    :vars
    (
      ?auto_976852 - HOIST
      ?auto_976854 - PLACE
      ?auto_976851 - TRUCK
      ?auto_976853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976852 ?auto_976854 ) ( SURFACE-AT ?auto_976849 ?auto_976854 ) ( CLEAR ?auto_976849 ) ( IS-CRATE ?auto_976850 ) ( not ( = ?auto_976849 ?auto_976850 ) ) ( AVAILABLE ?auto_976852 ) ( IN ?auto_976850 ?auto_976851 ) ( ON ?auto_976849 ?auto_976848 ) ( not ( = ?auto_976848 ?auto_976849 ) ) ( not ( = ?auto_976848 ?auto_976850 ) ) ( TRUCK-AT ?auto_976851 ?auto_976853 ) ( not ( = ?auto_976853 ?auto_976854 ) ) ( ON ?auto_976848 ?auto_976847 ) ( not ( = ?auto_976847 ?auto_976848 ) ) ( not ( = ?auto_976847 ?auto_976849 ) ) ( not ( = ?auto_976847 ?auto_976850 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_976848 ?auto_976849 ?auto_976850 )
      ( MAKE-3CRATE-VERIFY ?auto_976847 ?auto_976848 ?auto_976849 ?auto_976850 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976871 - SURFACE
      ?auto_976872 - SURFACE
      ?auto_976873 - SURFACE
      ?auto_976874 - SURFACE
    )
    :vars
    (
      ?auto_976875 - HOIST
      ?auto_976876 - PLACE
      ?auto_976878 - TRUCK
      ?auto_976879 - PLACE
      ?auto_976877 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_976875 ?auto_976876 ) ( SURFACE-AT ?auto_976873 ?auto_976876 ) ( CLEAR ?auto_976873 ) ( IS-CRATE ?auto_976874 ) ( not ( = ?auto_976873 ?auto_976874 ) ) ( AVAILABLE ?auto_976875 ) ( ON ?auto_976873 ?auto_976872 ) ( not ( = ?auto_976872 ?auto_976873 ) ) ( not ( = ?auto_976872 ?auto_976874 ) ) ( TRUCK-AT ?auto_976878 ?auto_976879 ) ( not ( = ?auto_976879 ?auto_976876 ) ) ( HOIST-AT ?auto_976877 ?auto_976879 ) ( LIFTING ?auto_976877 ?auto_976874 ) ( not ( = ?auto_976875 ?auto_976877 ) ) ( ON ?auto_976872 ?auto_976871 ) ( not ( = ?auto_976871 ?auto_976872 ) ) ( not ( = ?auto_976871 ?auto_976873 ) ) ( not ( = ?auto_976871 ?auto_976874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_976872 ?auto_976873 ?auto_976874 )
      ( MAKE-3CRATE-VERIFY ?auto_976871 ?auto_976872 ?auto_976873 ?auto_976874 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976898 - SURFACE
      ?auto_976899 - SURFACE
      ?auto_976900 - SURFACE
      ?auto_976901 - SURFACE
    )
    :vars
    (
      ?auto_976904 - HOIST
      ?auto_976906 - PLACE
      ?auto_976905 - TRUCK
      ?auto_976903 - PLACE
      ?auto_976902 - HOIST
      ?auto_976907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976904 ?auto_976906 ) ( SURFACE-AT ?auto_976900 ?auto_976906 ) ( CLEAR ?auto_976900 ) ( IS-CRATE ?auto_976901 ) ( not ( = ?auto_976900 ?auto_976901 ) ) ( AVAILABLE ?auto_976904 ) ( ON ?auto_976900 ?auto_976899 ) ( not ( = ?auto_976899 ?auto_976900 ) ) ( not ( = ?auto_976899 ?auto_976901 ) ) ( TRUCK-AT ?auto_976905 ?auto_976903 ) ( not ( = ?auto_976903 ?auto_976906 ) ) ( HOIST-AT ?auto_976902 ?auto_976903 ) ( not ( = ?auto_976904 ?auto_976902 ) ) ( AVAILABLE ?auto_976902 ) ( SURFACE-AT ?auto_976901 ?auto_976903 ) ( ON ?auto_976901 ?auto_976907 ) ( CLEAR ?auto_976901 ) ( not ( = ?auto_976900 ?auto_976907 ) ) ( not ( = ?auto_976901 ?auto_976907 ) ) ( not ( = ?auto_976899 ?auto_976907 ) ) ( ON ?auto_976899 ?auto_976898 ) ( not ( = ?auto_976898 ?auto_976899 ) ) ( not ( = ?auto_976898 ?auto_976900 ) ) ( not ( = ?auto_976898 ?auto_976901 ) ) ( not ( = ?auto_976898 ?auto_976907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_976899 ?auto_976900 ?auto_976901 )
      ( MAKE-3CRATE-VERIFY ?auto_976898 ?auto_976899 ?auto_976900 ?auto_976901 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976926 - SURFACE
      ?auto_976927 - SURFACE
      ?auto_976928 - SURFACE
      ?auto_976929 - SURFACE
    )
    :vars
    (
      ?auto_976933 - HOIST
      ?auto_976935 - PLACE
      ?auto_976931 - PLACE
      ?auto_976932 - HOIST
      ?auto_976930 - SURFACE
      ?auto_976934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976933 ?auto_976935 ) ( SURFACE-AT ?auto_976928 ?auto_976935 ) ( CLEAR ?auto_976928 ) ( IS-CRATE ?auto_976929 ) ( not ( = ?auto_976928 ?auto_976929 ) ) ( AVAILABLE ?auto_976933 ) ( ON ?auto_976928 ?auto_976927 ) ( not ( = ?auto_976927 ?auto_976928 ) ) ( not ( = ?auto_976927 ?auto_976929 ) ) ( not ( = ?auto_976931 ?auto_976935 ) ) ( HOIST-AT ?auto_976932 ?auto_976931 ) ( not ( = ?auto_976933 ?auto_976932 ) ) ( AVAILABLE ?auto_976932 ) ( SURFACE-AT ?auto_976929 ?auto_976931 ) ( ON ?auto_976929 ?auto_976930 ) ( CLEAR ?auto_976929 ) ( not ( = ?auto_976928 ?auto_976930 ) ) ( not ( = ?auto_976929 ?auto_976930 ) ) ( not ( = ?auto_976927 ?auto_976930 ) ) ( TRUCK-AT ?auto_976934 ?auto_976935 ) ( ON ?auto_976927 ?auto_976926 ) ( not ( = ?auto_976926 ?auto_976927 ) ) ( not ( = ?auto_976926 ?auto_976928 ) ) ( not ( = ?auto_976926 ?auto_976929 ) ) ( not ( = ?auto_976926 ?auto_976930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_976927 ?auto_976928 ?auto_976929 )
      ( MAKE-3CRATE-VERIFY ?auto_976926 ?auto_976927 ?auto_976928 ?auto_976929 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976954 - SURFACE
      ?auto_976955 - SURFACE
      ?auto_976956 - SURFACE
      ?auto_976957 - SURFACE
    )
    :vars
    (
      ?auto_976959 - HOIST
      ?auto_976961 - PLACE
      ?auto_976958 - PLACE
      ?auto_976960 - HOIST
      ?auto_976962 - SURFACE
      ?auto_976963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976959 ?auto_976961 ) ( IS-CRATE ?auto_976957 ) ( not ( = ?auto_976956 ?auto_976957 ) ) ( not ( = ?auto_976955 ?auto_976956 ) ) ( not ( = ?auto_976955 ?auto_976957 ) ) ( not ( = ?auto_976958 ?auto_976961 ) ) ( HOIST-AT ?auto_976960 ?auto_976958 ) ( not ( = ?auto_976959 ?auto_976960 ) ) ( AVAILABLE ?auto_976960 ) ( SURFACE-AT ?auto_976957 ?auto_976958 ) ( ON ?auto_976957 ?auto_976962 ) ( CLEAR ?auto_976957 ) ( not ( = ?auto_976956 ?auto_976962 ) ) ( not ( = ?auto_976957 ?auto_976962 ) ) ( not ( = ?auto_976955 ?auto_976962 ) ) ( TRUCK-AT ?auto_976963 ?auto_976961 ) ( SURFACE-AT ?auto_976955 ?auto_976961 ) ( CLEAR ?auto_976955 ) ( LIFTING ?auto_976959 ?auto_976956 ) ( IS-CRATE ?auto_976956 ) ( ON ?auto_976955 ?auto_976954 ) ( not ( = ?auto_976954 ?auto_976955 ) ) ( not ( = ?auto_976954 ?auto_976956 ) ) ( not ( = ?auto_976954 ?auto_976957 ) ) ( not ( = ?auto_976954 ?auto_976962 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_976955 ?auto_976956 ?auto_976957 )
      ( MAKE-3CRATE-VERIFY ?auto_976954 ?auto_976955 ?auto_976956 ?auto_976957 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_976982 - SURFACE
      ?auto_976983 - SURFACE
      ?auto_976984 - SURFACE
      ?auto_976985 - SURFACE
    )
    :vars
    (
      ?auto_976987 - HOIST
      ?auto_976986 - PLACE
      ?auto_976988 - PLACE
      ?auto_976989 - HOIST
      ?auto_976991 - SURFACE
      ?auto_976990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976987 ?auto_976986 ) ( IS-CRATE ?auto_976985 ) ( not ( = ?auto_976984 ?auto_976985 ) ) ( not ( = ?auto_976983 ?auto_976984 ) ) ( not ( = ?auto_976983 ?auto_976985 ) ) ( not ( = ?auto_976988 ?auto_976986 ) ) ( HOIST-AT ?auto_976989 ?auto_976988 ) ( not ( = ?auto_976987 ?auto_976989 ) ) ( AVAILABLE ?auto_976989 ) ( SURFACE-AT ?auto_976985 ?auto_976988 ) ( ON ?auto_976985 ?auto_976991 ) ( CLEAR ?auto_976985 ) ( not ( = ?auto_976984 ?auto_976991 ) ) ( not ( = ?auto_976985 ?auto_976991 ) ) ( not ( = ?auto_976983 ?auto_976991 ) ) ( TRUCK-AT ?auto_976990 ?auto_976986 ) ( SURFACE-AT ?auto_976983 ?auto_976986 ) ( CLEAR ?auto_976983 ) ( IS-CRATE ?auto_976984 ) ( AVAILABLE ?auto_976987 ) ( IN ?auto_976984 ?auto_976990 ) ( ON ?auto_976983 ?auto_976982 ) ( not ( = ?auto_976982 ?auto_976983 ) ) ( not ( = ?auto_976982 ?auto_976984 ) ) ( not ( = ?auto_976982 ?auto_976985 ) ) ( not ( = ?auto_976982 ?auto_976991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_976983 ?auto_976984 ?auto_976985 )
      ( MAKE-3CRATE-VERIFY ?auto_976982 ?auto_976983 ?auto_976984 ?auto_976985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977061 - SURFACE
      ?auto_977062 - SURFACE
    )
    :vars
    (
      ?auto_977063 - HOIST
      ?auto_977064 - PLACE
      ?auto_977068 - SURFACE
      ?auto_977069 - PLACE
      ?auto_977065 - HOIST
      ?auto_977067 - SURFACE
      ?auto_977066 - TRUCK
      ?auto_977070 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977063 ?auto_977064 ) ( SURFACE-AT ?auto_977061 ?auto_977064 ) ( CLEAR ?auto_977061 ) ( IS-CRATE ?auto_977062 ) ( not ( = ?auto_977061 ?auto_977062 ) ) ( AVAILABLE ?auto_977063 ) ( ON ?auto_977061 ?auto_977068 ) ( not ( = ?auto_977068 ?auto_977061 ) ) ( not ( = ?auto_977068 ?auto_977062 ) ) ( not ( = ?auto_977069 ?auto_977064 ) ) ( HOIST-AT ?auto_977065 ?auto_977069 ) ( not ( = ?auto_977063 ?auto_977065 ) ) ( AVAILABLE ?auto_977065 ) ( SURFACE-AT ?auto_977062 ?auto_977069 ) ( ON ?auto_977062 ?auto_977067 ) ( CLEAR ?auto_977062 ) ( not ( = ?auto_977061 ?auto_977067 ) ) ( not ( = ?auto_977062 ?auto_977067 ) ) ( not ( = ?auto_977068 ?auto_977067 ) ) ( TRUCK-AT ?auto_977066 ?auto_977070 ) ( not ( = ?auto_977070 ?auto_977064 ) ) ( not ( = ?auto_977069 ?auto_977070 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_977066 ?auto_977070 ?auto_977064 )
      ( MAKE-1CRATE ?auto_977061 ?auto_977062 )
      ( MAKE-1CRATE-VERIFY ?auto_977061 ?auto_977062 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977167 - SURFACE
      ?auto_977168 - SURFACE
    )
    :vars
    (
      ?auto_977171 - HOIST
      ?auto_977169 - PLACE
      ?auto_977170 - SURFACE
      ?auto_977175 - PLACE
      ?auto_977174 - HOIST
      ?auto_977172 - SURFACE
      ?auto_977173 - TRUCK
      ?auto_977176 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977171 ?auto_977169 ) ( SURFACE-AT ?auto_977167 ?auto_977169 ) ( CLEAR ?auto_977167 ) ( IS-CRATE ?auto_977168 ) ( not ( = ?auto_977167 ?auto_977168 ) ) ( ON ?auto_977167 ?auto_977170 ) ( not ( = ?auto_977170 ?auto_977167 ) ) ( not ( = ?auto_977170 ?auto_977168 ) ) ( not ( = ?auto_977175 ?auto_977169 ) ) ( HOIST-AT ?auto_977174 ?auto_977175 ) ( not ( = ?auto_977171 ?auto_977174 ) ) ( AVAILABLE ?auto_977174 ) ( SURFACE-AT ?auto_977168 ?auto_977175 ) ( ON ?auto_977168 ?auto_977172 ) ( CLEAR ?auto_977168 ) ( not ( = ?auto_977167 ?auto_977172 ) ) ( not ( = ?auto_977168 ?auto_977172 ) ) ( not ( = ?auto_977170 ?auto_977172 ) ) ( TRUCK-AT ?auto_977173 ?auto_977169 ) ( LIFTING ?auto_977171 ?auto_977176 ) ( IS-CRATE ?auto_977176 ) ( not ( = ?auto_977167 ?auto_977176 ) ) ( not ( = ?auto_977168 ?auto_977176 ) ) ( not ( = ?auto_977170 ?auto_977176 ) ) ( not ( = ?auto_977172 ?auto_977176 ) ) )
    :subtasks
    ( ( !LOAD ?auto_977171 ?auto_977176 ?auto_977173 ?auto_977169 )
      ( MAKE-1CRATE ?auto_977167 ?auto_977168 )
      ( MAKE-1CRATE-VERIFY ?auto_977167 ?auto_977168 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977275 - SURFACE
      ?auto_977276 - SURFACE
      ?auto_977277 - SURFACE
      ?auto_977279 - SURFACE
      ?auto_977278 - SURFACE
    )
    :vars
    (
      ?auto_977281 - HOIST
      ?auto_977280 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977281 ?auto_977280 ) ( SURFACE-AT ?auto_977279 ?auto_977280 ) ( CLEAR ?auto_977279 ) ( LIFTING ?auto_977281 ?auto_977278 ) ( IS-CRATE ?auto_977278 ) ( not ( = ?auto_977279 ?auto_977278 ) ) ( ON ?auto_977276 ?auto_977275 ) ( ON ?auto_977277 ?auto_977276 ) ( ON ?auto_977279 ?auto_977277 ) ( not ( = ?auto_977275 ?auto_977276 ) ) ( not ( = ?auto_977275 ?auto_977277 ) ) ( not ( = ?auto_977275 ?auto_977279 ) ) ( not ( = ?auto_977275 ?auto_977278 ) ) ( not ( = ?auto_977276 ?auto_977277 ) ) ( not ( = ?auto_977276 ?auto_977279 ) ) ( not ( = ?auto_977276 ?auto_977278 ) ) ( not ( = ?auto_977277 ?auto_977279 ) ) ( not ( = ?auto_977277 ?auto_977278 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977279 ?auto_977278 )
      ( MAKE-4CRATE-VERIFY ?auto_977275 ?auto_977276 ?auto_977277 ?auto_977279 ?auto_977278 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977300 - SURFACE
      ?auto_977301 - SURFACE
      ?auto_977302 - SURFACE
      ?auto_977304 - SURFACE
      ?auto_977303 - SURFACE
    )
    :vars
    (
      ?auto_977307 - HOIST
      ?auto_977306 - PLACE
      ?auto_977305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977307 ?auto_977306 ) ( SURFACE-AT ?auto_977304 ?auto_977306 ) ( CLEAR ?auto_977304 ) ( IS-CRATE ?auto_977303 ) ( not ( = ?auto_977304 ?auto_977303 ) ) ( TRUCK-AT ?auto_977305 ?auto_977306 ) ( AVAILABLE ?auto_977307 ) ( IN ?auto_977303 ?auto_977305 ) ( ON ?auto_977304 ?auto_977302 ) ( not ( = ?auto_977302 ?auto_977304 ) ) ( not ( = ?auto_977302 ?auto_977303 ) ) ( ON ?auto_977301 ?auto_977300 ) ( ON ?auto_977302 ?auto_977301 ) ( not ( = ?auto_977300 ?auto_977301 ) ) ( not ( = ?auto_977300 ?auto_977302 ) ) ( not ( = ?auto_977300 ?auto_977304 ) ) ( not ( = ?auto_977300 ?auto_977303 ) ) ( not ( = ?auto_977301 ?auto_977302 ) ) ( not ( = ?auto_977301 ?auto_977304 ) ) ( not ( = ?auto_977301 ?auto_977303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977302 ?auto_977304 ?auto_977303 )
      ( MAKE-4CRATE-VERIFY ?auto_977300 ?auto_977301 ?auto_977302 ?auto_977304 ?auto_977303 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977330 - SURFACE
      ?auto_977331 - SURFACE
      ?auto_977332 - SURFACE
      ?auto_977334 - SURFACE
      ?auto_977333 - SURFACE
    )
    :vars
    (
      ?auto_977335 - HOIST
      ?auto_977337 - PLACE
      ?auto_977338 - TRUCK
      ?auto_977336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977335 ?auto_977337 ) ( SURFACE-AT ?auto_977334 ?auto_977337 ) ( CLEAR ?auto_977334 ) ( IS-CRATE ?auto_977333 ) ( not ( = ?auto_977334 ?auto_977333 ) ) ( AVAILABLE ?auto_977335 ) ( IN ?auto_977333 ?auto_977338 ) ( ON ?auto_977334 ?auto_977332 ) ( not ( = ?auto_977332 ?auto_977334 ) ) ( not ( = ?auto_977332 ?auto_977333 ) ) ( TRUCK-AT ?auto_977338 ?auto_977336 ) ( not ( = ?auto_977336 ?auto_977337 ) ) ( ON ?auto_977331 ?auto_977330 ) ( ON ?auto_977332 ?auto_977331 ) ( not ( = ?auto_977330 ?auto_977331 ) ) ( not ( = ?auto_977330 ?auto_977332 ) ) ( not ( = ?auto_977330 ?auto_977334 ) ) ( not ( = ?auto_977330 ?auto_977333 ) ) ( not ( = ?auto_977331 ?auto_977332 ) ) ( not ( = ?auto_977331 ?auto_977334 ) ) ( not ( = ?auto_977331 ?auto_977333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977332 ?auto_977334 ?auto_977333 )
      ( MAKE-4CRATE-VERIFY ?auto_977330 ?auto_977331 ?auto_977332 ?auto_977334 ?auto_977333 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977364 - SURFACE
      ?auto_977365 - SURFACE
      ?auto_977366 - SURFACE
      ?auto_977368 - SURFACE
      ?auto_977367 - SURFACE
    )
    :vars
    (
      ?auto_977373 - HOIST
      ?auto_977370 - PLACE
      ?auto_977371 - TRUCK
      ?auto_977372 - PLACE
      ?auto_977369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_977373 ?auto_977370 ) ( SURFACE-AT ?auto_977368 ?auto_977370 ) ( CLEAR ?auto_977368 ) ( IS-CRATE ?auto_977367 ) ( not ( = ?auto_977368 ?auto_977367 ) ) ( AVAILABLE ?auto_977373 ) ( ON ?auto_977368 ?auto_977366 ) ( not ( = ?auto_977366 ?auto_977368 ) ) ( not ( = ?auto_977366 ?auto_977367 ) ) ( TRUCK-AT ?auto_977371 ?auto_977372 ) ( not ( = ?auto_977372 ?auto_977370 ) ) ( HOIST-AT ?auto_977369 ?auto_977372 ) ( LIFTING ?auto_977369 ?auto_977367 ) ( not ( = ?auto_977373 ?auto_977369 ) ) ( ON ?auto_977365 ?auto_977364 ) ( ON ?auto_977366 ?auto_977365 ) ( not ( = ?auto_977364 ?auto_977365 ) ) ( not ( = ?auto_977364 ?auto_977366 ) ) ( not ( = ?auto_977364 ?auto_977368 ) ) ( not ( = ?auto_977364 ?auto_977367 ) ) ( not ( = ?auto_977365 ?auto_977366 ) ) ( not ( = ?auto_977365 ?auto_977368 ) ) ( not ( = ?auto_977365 ?auto_977367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977366 ?auto_977368 ?auto_977367 )
      ( MAKE-4CRATE-VERIFY ?auto_977364 ?auto_977365 ?auto_977366 ?auto_977368 ?auto_977367 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977402 - SURFACE
      ?auto_977403 - SURFACE
      ?auto_977404 - SURFACE
      ?auto_977406 - SURFACE
      ?auto_977405 - SURFACE
    )
    :vars
    (
      ?auto_977407 - HOIST
      ?auto_977412 - PLACE
      ?auto_977411 - TRUCK
      ?auto_977408 - PLACE
      ?auto_977409 - HOIST
      ?auto_977410 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977407 ?auto_977412 ) ( SURFACE-AT ?auto_977406 ?auto_977412 ) ( CLEAR ?auto_977406 ) ( IS-CRATE ?auto_977405 ) ( not ( = ?auto_977406 ?auto_977405 ) ) ( AVAILABLE ?auto_977407 ) ( ON ?auto_977406 ?auto_977404 ) ( not ( = ?auto_977404 ?auto_977406 ) ) ( not ( = ?auto_977404 ?auto_977405 ) ) ( TRUCK-AT ?auto_977411 ?auto_977408 ) ( not ( = ?auto_977408 ?auto_977412 ) ) ( HOIST-AT ?auto_977409 ?auto_977408 ) ( not ( = ?auto_977407 ?auto_977409 ) ) ( AVAILABLE ?auto_977409 ) ( SURFACE-AT ?auto_977405 ?auto_977408 ) ( ON ?auto_977405 ?auto_977410 ) ( CLEAR ?auto_977405 ) ( not ( = ?auto_977406 ?auto_977410 ) ) ( not ( = ?auto_977405 ?auto_977410 ) ) ( not ( = ?auto_977404 ?auto_977410 ) ) ( ON ?auto_977403 ?auto_977402 ) ( ON ?auto_977404 ?auto_977403 ) ( not ( = ?auto_977402 ?auto_977403 ) ) ( not ( = ?auto_977402 ?auto_977404 ) ) ( not ( = ?auto_977402 ?auto_977406 ) ) ( not ( = ?auto_977402 ?auto_977405 ) ) ( not ( = ?auto_977402 ?auto_977410 ) ) ( not ( = ?auto_977403 ?auto_977404 ) ) ( not ( = ?auto_977403 ?auto_977406 ) ) ( not ( = ?auto_977403 ?auto_977405 ) ) ( not ( = ?auto_977403 ?auto_977410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977404 ?auto_977406 ?auto_977405 )
      ( MAKE-4CRATE-VERIFY ?auto_977402 ?auto_977403 ?auto_977404 ?auto_977406 ?auto_977405 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977441 - SURFACE
      ?auto_977442 - SURFACE
      ?auto_977443 - SURFACE
      ?auto_977445 - SURFACE
      ?auto_977444 - SURFACE
    )
    :vars
    (
      ?auto_977449 - HOIST
      ?auto_977448 - PLACE
      ?auto_977451 - PLACE
      ?auto_977450 - HOIST
      ?auto_977446 - SURFACE
      ?auto_977447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977449 ?auto_977448 ) ( SURFACE-AT ?auto_977445 ?auto_977448 ) ( CLEAR ?auto_977445 ) ( IS-CRATE ?auto_977444 ) ( not ( = ?auto_977445 ?auto_977444 ) ) ( AVAILABLE ?auto_977449 ) ( ON ?auto_977445 ?auto_977443 ) ( not ( = ?auto_977443 ?auto_977445 ) ) ( not ( = ?auto_977443 ?auto_977444 ) ) ( not ( = ?auto_977451 ?auto_977448 ) ) ( HOIST-AT ?auto_977450 ?auto_977451 ) ( not ( = ?auto_977449 ?auto_977450 ) ) ( AVAILABLE ?auto_977450 ) ( SURFACE-AT ?auto_977444 ?auto_977451 ) ( ON ?auto_977444 ?auto_977446 ) ( CLEAR ?auto_977444 ) ( not ( = ?auto_977445 ?auto_977446 ) ) ( not ( = ?auto_977444 ?auto_977446 ) ) ( not ( = ?auto_977443 ?auto_977446 ) ) ( TRUCK-AT ?auto_977447 ?auto_977448 ) ( ON ?auto_977442 ?auto_977441 ) ( ON ?auto_977443 ?auto_977442 ) ( not ( = ?auto_977441 ?auto_977442 ) ) ( not ( = ?auto_977441 ?auto_977443 ) ) ( not ( = ?auto_977441 ?auto_977445 ) ) ( not ( = ?auto_977441 ?auto_977444 ) ) ( not ( = ?auto_977441 ?auto_977446 ) ) ( not ( = ?auto_977442 ?auto_977443 ) ) ( not ( = ?auto_977442 ?auto_977445 ) ) ( not ( = ?auto_977442 ?auto_977444 ) ) ( not ( = ?auto_977442 ?auto_977446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977443 ?auto_977445 ?auto_977444 )
      ( MAKE-4CRATE-VERIFY ?auto_977441 ?auto_977442 ?auto_977443 ?auto_977445 ?auto_977444 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977480 - SURFACE
      ?auto_977481 - SURFACE
      ?auto_977482 - SURFACE
      ?auto_977484 - SURFACE
      ?auto_977483 - SURFACE
    )
    :vars
    (
      ?auto_977485 - HOIST
      ?auto_977487 - PLACE
      ?auto_977488 - PLACE
      ?auto_977490 - HOIST
      ?auto_977489 - SURFACE
      ?auto_977486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977485 ?auto_977487 ) ( IS-CRATE ?auto_977483 ) ( not ( = ?auto_977484 ?auto_977483 ) ) ( not ( = ?auto_977482 ?auto_977484 ) ) ( not ( = ?auto_977482 ?auto_977483 ) ) ( not ( = ?auto_977488 ?auto_977487 ) ) ( HOIST-AT ?auto_977490 ?auto_977488 ) ( not ( = ?auto_977485 ?auto_977490 ) ) ( AVAILABLE ?auto_977490 ) ( SURFACE-AT ?auto_977483 ?auto_977488 ) ( ON ?auto_977483 ?auto_977489 ) ( CLEAR ?auto_977483 ) ( not ( = ?auto_977484 ?auto_977489 ) ) ( not ( = ?auto_977483 ?auto_977489 ) ) ( not ( = ?auto_977482 ?auto_977489 ) ) ( TRUCK-AT ?auto_977486 ?auto_977487 ) ( SURFACE-AT ?auto_977482 ?auto_977487 ) ( CLEAR ?auto_977482 ) ( LIFTING ?auto_977485 ?auto_977484 ) ( IS-CRATE ?auto_977484 ) ( ON ?auto_977481 ?auto_977480 ) ( ON ?auto_977482 ?auto_977481 ) ( not ( = ?auto_977480 ?auto_977481 ) ) ( not ( = ?auto_977480 ?auto_977482 ) ) ( not ( = ?auto_977480 ?auto_977484 ) ) ( not ( = ?auto_977480 ?auto_977483 ) ) ( not ( = ?auto_977480 ?auto_977489 ) ) ( not ( = ?auto_977481 ?auto_977482 ) ) ( not ( = ?auto_977481 ?auto_977484 ) ) ( not ( = ?auto_977481 ?auto_977483 ) ) ( not ( = ?auto_977481 ?auto_977489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977482 ?auto_977484 ?auto_977483 )
      ( MAKE-4CRATE-VERIFY ?auto_977480 ?auto_977481 ?auto_977482 ?auto_977484 ?auto_977483 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_977519 - SURFACE
      ?auto_977520 - SURFACE
      ?auto_977521 - SURFACE
      ?auto_977523 - SURFACE
      ?auto_977522 - SURFACE
    )
    :vars
    (
      ?auto_977528 - HOIST
      ?auto_977524 - PLACE
      ?auto_977526 - PLACE
      ?auto_977529 - HOIST
      ?auto_977527 - SURFACE
      ?auto_977525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_977528 ?auto_977524 ) ( IS-CRATE ?auto_977522 ) ( not ( = ?auto_977523 ?auto_977522 ) ) ( not ( = ?auto_977521 ?auto_977523 ) ) ( not ( = ?auto_977521 ?auto_977522 ) ) ( not ( = ?auto_977526 ?auto_977524 ) ) ( HOIST-AT ?auto_977529 ?auto_977526 ) ( not ( = ?auto_977528 ?auto_977529 ) ) ( AVAILABLE ?auto_977529 ) ( SURFACE-AT ?auto_977522 ?auto_977526 ) ( ON ?auto_977522 ?auto_977527 ) ( CLEAR ?auto_977522 ) ( not ( = ?auto_977523 ?auto_977527 ) ) ( not ( = ?auto_977522 ?auto_977527 ) ) ( not ( = ?auto_977521 ?auto_977527 ) ) ( TRUCK-AT ?auto_977525 ?auto_977524 ) ( SURFACE-AT ?auto_977521 ?auto_977524 ) ( CLEAR ?auto_977521 ) ( IS-CRATE ?auto_977523 ) ( AVAILABLE ?auto_977528 ) ( IN ?auto_977523 ?auto_977525 ) ( ON ?auto_977520 ?auto_977519 ) ( ON ?auto_977521 ?auto_977520 ) ( not ( = ?auto_977519 ?auto_977520 ) ) ( not ( = ?auto_977519 ?auto_977521 ) ) ( not ( = ?auto_977519 ?auto_977523 ) ) ( not ( = ?auto_977519 ?auto_977522 ) ) ( not ( = ?auto_977519 ?auto_977527 ) ) ( not ( = ?auto_977520 ?auto_977521 ) ) ( not ( = ?auto_977520 ?auto_977523 ) ) ( not ( = ?auto_977520 ?auto_977522 ) ) ( not ( = ?auto_977520 ?auto_977527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_977521 ?auto_977523 ?auto_977522 )
      ( MAKE-4CRATE-VERIFY ?auto_977519 ?auto_977520 ?auto_977521 ?auto_977523 ?auto_977522 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977792 - SURFACE
      ?auto_977793 - SURFACE
    )
    :vars
    (
      ?auto_977797 - HOIST
      ?auto_977796 - PLACE
      ?auto_977795 - SURFACE
      ?auto_977800 - TRUCK
      ?auto_977798 - PLACE
      ?auto_977799 - HOIST
      ?auto_977794 - SURFACE
      ?auto_977801 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977797 ?auto_977796 ) ( SURFACE-AT ?auto_977792 ?auto_977796 ) ( CLEAR ?auto_977792 ) ( IS-CRATE ?auto_977793 ) ( not ( = ?auto_977792 ?auto_977793 ) ) ( AVAILABLE ?auto_977797 ) ( ON ?auto_977792 ?auto_977795 ) ( not ( = ?auto_977795 ?auto_977792 ) ) ( not ( = ?auto_977795 ?auto_977793 ) ) ( TRUCK-AT ?auto_977800 ?auto_977798 ) ( not ( = ?auto_977798 ?auto_977796 ) ) ( HOIST-AT ?auto_977799 ?auto_977798 ) ( not ( = ?auto_977797 ?auto_977799 ) ) ( SURFACE-AT ?auto_977793 ?auto_977798 ) ( ON ?auto_977793 ?auto_977794 ) ( CLEAR ?auto_977793 ) ( not ( = ?auto_977792 ?auto_977794 ) ) ( not ( = ?auto_977793 ?auto_977794 ) ) ( not ( = ?auto_977795 ?auto_977794 ) ) ( LIFTING ?auto_977799 ?auto_977801 ) ( IS-CRATE ?auto_977801 ) ( not ( = ?auto_977792 ?auto_977801 ) ) ( not ( = ?auto_977793 ?auto_977801 ) ) ( not ( = ?auto_977795 ?auto_977801 ) ) ( not ( = ?auto_977794 ?auto_977801 ) ) )
    :subtasks
    ( ( !LOAD ?auto_977799 ?auto_977801 ?auto_977800 ?auto_977798 )
      ( MAKE-1CRATE ?auto_977792 ?auto_977793 )
      ( MAKE-1CRATE-VERIFY ?auto_977792 ?auto_977793 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978170 - SURFACE
      ?auto_978171 - SURFACE
      ?auto_978172 - SURFACE
      ?auto_978174 - SURFACE
      ?auto_978173 - SURFACE
      ?auto_978175 - SURFACE
    )
    :vars
    (
      ?auto_978176 - HOIST
      ?auto_978177 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978176 ?auto_978177 ) ( SURFACE-AT ?auto_978173 ?auto_978177 ) ( CLEAR ?auto_978173 ) ( LIFTING ?auto_978176 ?auto_978175 ) ( IS-CRATE ?auto_978175 ) ( not ( = ?auto_978173 ?auto_978175 ) ) ( ON ?auto_978171 ?auto_978170 ) ( ON ?auto_978172 ?auto_978171 ) ( ON ?auto_978174 ?auto_978172 ) ( ON ?auto_978173 ?auto_978174 ) ( not ( = ?auto_978170 ?auto_978171 ) ) ( not ( = ?auto_978170 ?auto_978172 ) ) ( not ( = ?auto_978170 ?auto_978174 ) ) ( not ( = ?auto_978170 ?auto_978173 ) ) ( not ( = ?auto_978170 ?auto_978175 ) ) ( not ( = ?auto_978171 ?auto_978172 ) ) ( not ( = ?auto_978171 ?auto_978174 ) ) ( not ( = ?auto_978171 ?auto_978173 ) ) ( not ( = ?auto_978171 ?auto_978175 ) ) ( not ( = ?auto_978172 ?auto_978174 ) ) ( not ( = ?auto_978172 ?auto_978173 ) ) ( not ( = ?auto_978172 ?auto_978175 ) ) ( not ( = ?auto_978174 ?auto_978173 ) ) ( not ( = ?auto_978174 ?auto_978175 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_978173 ?auto_978175 )
      ( MAKE-5CRATE-VERIFY ?auto_978170 ?auto_978171 ?auto_978172 ?auto_978174 ?auto_978173 ?auto_978175 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978204 - SURFACE
      ?auto_978205 - SURFACE
      ?auto_978206 - SURFACE
      ?auto_978208 - SURFACE
      ?auto_978207 - SURFACE
      ?auto_978209 - SURFACE
    )
    :vars
    (
      ?auto_978210 - HOIST
      ?auto_978211 - PLACE
      ?auto_978212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978210 ?auto_978211 ) ( SURFACE-AT ?auto_978207 ?auto_978211 ) ( CLEAR ?auto_978207 ) ( IS-CRATE ?auto_978209 ) ( not ( = ?auto_978207 ?auto_978209 ) ) ( TRUCK-AT ?auto_978212 ?auto_978211 ) ( AVAILABLE ?auto_978210 ) ( IN ?auto_978209 ?auto_978212 ) ( ON ?auto_978207 ?auto_978208 ) ( not ( = ?auto_978208 ?auto_978207 ) ) ( not ( = ?auto_978208 ?auto_978209 ) ) ( ON ?auto_978205 ?auto_978204 ) ( ON ?auto_978206 ?auto_978205 ) ( ON ?auto_978208 ?auto_978206 ) ( not ( = ?auto_978204 ?auto_978205 ) ) ( not ( = ?auto_978204 ?auto_978206 ) ) ( not ( = ?auto_978204 ?auto_978208 ) ) ( not ( = ?auto_978204 ?auto_978207 ) ) ( not ( = ?auto_978204 ?auto_978209 ) ) ( not ( = ?auto_978205 ?auto_978206 ) ) ( not ( = ?auto_978205 ?auto_978208 ) ) ( not ( = ?auto_978205 ?auto_978207 ) ) ( not ( = ?auto_978205 ?auto_978209 ) ) ( not ( = ?auto_978206 ?auto_978208 ) ) ( not ( = ?auto_978206 ?auto_978207 ) ) ( not ( = ?auto_978206 ?auto_978209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978208 ?auto_978207 ?auto_978209 )
      ( MAKE-5CRATE-VERIFY ?auto_978204 ?auto_978205 ?auto_978206 ?auto_978208 ?auto_978207 ?auto_978209 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978244 - SURFACE
      ?auto_978245 - SURFACE
      ?auto_978246 - SURFACE
      ?auto_978248 - SURFACE
      ?auto_978247 - SURFACE
      ?auto_978249 - SURFACE
    )
    :vars
    (
      ?auto_978252 - HOIST
      ?auto_978253 - PLACE
      ?auto_978250 - TRUCK
      ?auto_978251 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978252 ?auto_978253 ) ( SURFACE-AT ?auto_978247 ?auto_978253 ) ( CLEAR ?auto_978247 ) ( IS-CRATE ?auto_978249 ) ( not ( = ?auto_978247 ?auto_978249 ) ) ( AVAILABLE ?auto_978252 ) ( IN ?auto_978249 ?auto_978250 ) ( ON ?auto_978247 ?auto_978248 ) ( not ( = ?auto_978248 ?auto_978247 ) ) ( not ( = ?auto_978248 ?auto_978249 ) ) ( TRUCK-AT ?auto_978250 ?auto_978251 ) ( not ( = ?auto_978251 ?auto_978253 ) ) ( ON ?auto_978245 ?auto_978244 ) ( ON ?auto_978246 ?auto_978245 ) ( ON ?auto_978248 ?auto_978246 ) ( not ( = ?auto_978244 ?auto_978245 ) ) ( not ( = ?auto_978244 ?auto_978246 ) ) ( not ( = ?auto_978244 ?auto_978248 ) ) ( not ( = ?auto_978244 ?auto_978247 ) ) ( not ( = ?auto_978244 ?auto_978249 ) ) ( not ( = ?auto_978245 ?auto_978246 ) ) ( not ( = ?auto_978245 ?auto_978248 ) ) ( not ( = ?auto_978245 ?auto_978247 ) ) ( not ( = ?auto_978245 ?auto_978249 ) ) ( not ( = ?auto_978246 ?auto_978248 ) ) ( not ( = ?auto_978246 ?auto_978247 ) ) ( not ( = ?auto_978246 ?auto_978249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978248 ?auto_978247 ?auto_978249 )
      ( MAKE-5CRATE-VERIFY ?auto_978244 ?auto_978245 ?auto_978246 ?auto_978248 ?auto_978247 ?auto_978249 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978289 - SURFACE
      ?auto_978290 - SURFACE
      ?auto_978291 - SURFACE
      ?auto_978293 - SURFACE
      ?auto_978292 - SURFACE
      ?auto_978294 - SURFACE
    )
    :vars
    (
      ?auto_978298 - HOIST
      ?auto_978296 - PLACE
      ?auto_978295 - TRUCK
      ?auto_978299 - PLACE
      ?auto_978297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_978298 ?auto_978296 ) ( SURFACE-AT ?auto_978292 ?auto_978296 ) ( CLEAR ?auto_978292 ) ( IS-CRATE ?auto_978294 ) ( not ( = ?auto_978292 ?auto_978294 ) ) ( AVAILABLE ?auto_978298 ) ( ON ?auto_978292 ?auto_978293 ) ( not ( = ?auto_978293 ?auto_978292 ) ) ( not ( = ?auto_978293 ?auto_978294 ) ) ( TRUCK-AT ?auto_978295 ?auto_978299 ) ( not ( = ?auto_978299 ?auto_978296 ) ) ( HOIST-AT ?auto_978297 ?auto_978299 ) ( LIFTING ?auto_978297 ?auto_978294 ) ( not ( = ?auto_978298 ?auto_978297 ) ) ( ON ?auto_978290 ?auto_978289 ) ( ON ?auto_978291 ?auto_978290 ) ( ON ?auto_978293 ?auto_978291 ) ( not ( = ?auto_978289 ?auto_978290 ) ) ( not ( = ?auto_978289 ?auto_978291 ) ) ( not ( = ?auto_978289 ?auto_978293 ) ) ( not ( = ?auto_978289 ?auto_978292 ) ) ( not ( = ?auto_978289 ?auto_978294 ) ) ( not ( = ?auto_978290 ?auto_978291 ) ) ( not ( = ?auto_978290 ?auto_978293 ) ) ( not ( = ?auto_978290 ?auto_978292 ) ) ( not ( = ?auto_978290 ?auto_978294 ) ) ( not ( = ?auto_978291 ?auto_978293 ) ) ( not ( = ?auto_978291 ?auto_978292 ) ) ( not ( = ?auto_978291 ?auto_978294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978293 ?auto_978292 ?auto_978294 )
      ( MAKE-5CRATE-VERIFY ?auto_978289 ?auto_978290 ?auto_978291 ?auto_978293 ?auto_978292 ?auto_978294 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978339 - SURFACE
      ?auto_978340 - SURFACE
      ?auto_978341 - SURFACE
      ?auto_978343 - SURFACE
      ?auto_978342 - SURFACE
      ?auto_978344 - SURFACE
    )
    :vars
    (
      ?auto_978345 - HOIST
      ?auto_978349 - PLACE
      ?auto_978347 - TRUCK
      ?auto_978346 - PLACE
      ?auto_978348 - HOIST
      ?auto_978350 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_978345 ?auto_978349 ) ( SURFACE-AT ?auto_978342 ?auto_978349 ) ( CLEAR ?auto_978342 ) ( IS-CRATE ?auto_978344 ) ( not ( = ?auto_978342 ?auto_978344 ) ) ( AVAILABLE ?auto_978345 ) ( ON ?auto_978342 ?auto_978343 ) ( not ( = ?auto_978343 ?auto_978342 ) ) ( not ( = ?auto_978343 ?auto_978344 ) ) ( TRUCK-AT ?auto_978347 ?auto_978346 ) ( not ( = ?auto_978346 ?auto_978349 ) ) ( HOIST-AT ?auto_978348 ?auto_978346 ) ( not ( = ?auto_978345 ?auto_978348 ) ) ( AVAILABLE ?auto_978348 ) ( SURFACE-AT ?auto_978344 ?auto_978346 ) ( ON ?auto_978344 ?auto_978350 ) ( CLEAR ?auto_978344 ) ( not ( = ?auto_978342 ?auto_978350 ) ) ( not ( = ?auto_978344 ?auto_978350 ) ) ( not ( = ?auto_978343 ?auto_978350 ) ) ( ON ?auto_978340 ?auto_978339 ) ( ON ?auto_978341 ?auto_978340 ) ( ON ?auto_978343 ?auto_978341 ) ( not ( = ?auto_978339 ?auto_978340 ) ) ( not ( = ?auto_978339 ?auto_978341 ) ) ( not ( = ?auto_978339 ?auto_978343 ) ) ( not ( = ?auto_978339 ?auto_978342 ) ) ( not ( = ?auto_978339 ?auto_978344 ) ) ( not ( = ?auto_978339 ?auto_978350 ) ) ( not ( = ?auto_978340 ?auto_978341 ) ) ( not ( = ?auto_978340 ?auto_978343 ) ) ( not ( = ?auto_978340 ?auto_978342 ) ) ( not ( = ?auto_978340 ?auto_978344 ) ) ( not ( = ?auto_978340 ?auto_978350 ) ) ( not ( = ?auto_978341 ?auto_978343 ) ) ( not ( = ?auto_978341 ?auto_978342 ) ) ( not ( = ?auto_978341 ?auto_978344 ) ) ( not ( = ?auto_978341 ?auto_978350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978343 ?auto_978342 ?auto_978344 )
      ( MAKE-5CRATE-VERIFY ?auto_978339 ?auto_978340 ?auto_978341 ?auto_978343 ?auto_978342 ?auto_978344 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978390 - SURFACE
      ?auto_978391 - SURFACE
      ?auto_978392 - SURFACE
      ?auto_978394 - SURFACE
      ?auto_978393 - SURFACE
      ?auto_978395 - SURFACE
    )
    :vars
    (
      ?auto_978398 - HOIST
      ?auto_978401 - PLACE
      ?auto_978400 - PLACE
      ?auto_978399 - HOIST
      ?auto_978396 - SURFACE
      ?auto_978397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978398 ?auto_978401 ) ( SURFACE-AT ?auto_978393 ?auto_978401 ) ( CLEAR ?auto_978393 ) ( IS-CRATE ?auto_978395 ) ( not ( = ?auto_978393 ?auto_978395 ) ) ( AVAILABLE ?auto_978398 ) ( ON ?auto_978393 ?auto_978394 ) ( not ( = ?auto_978394 ?auto_978393 ) ) ( not ( = ?auto_978394 ?auto_978395 ) ) ( not ( = ?auto_978400 ?auto_978401 ) ) ( HOIST-AT ?auto_978399 ?auto_978400 ) ( not ( = ?auto_978398 ?auto_978399 ) ) ( AVAILABLE ?auto_978399 ) ( SURFACE-AT ?auto_978395 ?auto_978400 ) ( ON ?auto_978395 ?auto_978396 ) ( CLEAR ?auto_978395 ) ( not ( = ?auto_978393 ?auto_978396 ) ) ( not ( = ?auto_978395 ?auto_978396 ) ) ( not ( = ?auto_978394 ?auto_978396 ) ) ( TRUCK-AT ?auto_978397 ?auto_978401 ) ( ON ?auto_978391 ?auto_978390 ) ( ON ?auto_978392 ?auto_978391 ) ( ON ?auto_978394 ?auto_978392 ) ( not ( = ?auto_978390 ?auto_978391 ) ) ( not ( = ?auto_978390 ?auto_978392 ) ) ( not ( = ?auto_978390 ?auto_978394 ) ) ( not ( = ?auto_978390 ?auto_978393 ) ) ( not ( = ?auto_978390 ?auto_978395 ) ) ( not ( = ?auto_978390 ?auto_978396 ) ) ( not ( = ?auto_978391 ?auto_978392 ) ) ( not ( = ?auto_978391 ?auto_978394 ) ) ( not ( = ?auto_978391 ?auto_978393 ) ) ( not ( = ?auto_978391 ?auto_978395 ) ) ( not ( = ?auto_978391 ?auto_978396 ) ) ( not ( = ?auto_978392 ?auto_978394 ) ) ( not ( = ?auto_978392 ?auto_978393 ) ) ( not ( = ?auto_978392 ?auto_978395 ) ) ( not ( = ?auto_978392 ?auto_978396 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978394 ?auto_978393 ?auto_978395 )
      ( MAKE-5CRATE-VERIFY ?auto_978390 ?auto_978391 ?auto_978392 ?auto_978394 ?auto_978393 ?auto_978395 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978441 - SURFACE
      ?auto_978442 - SURFACE
      ?auto_978443 - SURFACE
      ?auto_978445 - SURFACE
      ?auto_978444 - SURFACE
      ?auto_978446 - SURFACE
    )
    :vars
    (
      ?auto_978449 - HOIST
      ?auto_978450 - PLACE
      ?auto_978447 - PLACE
      ?auto_978448 - HOIST
      ?auto_978452 - SURFACE
      ?auto_978451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978449 ?auto_978450 ) ( IS-CRATE ?auto_978446 ) ( not ( = ?auto_978444 ?auto_978446 ) ) ( not ( = ?auto_978445 ?auto_978444 ) ) ( not ( = ?auto_978445 ?auto_978446 ) ) ( not ( = ?auto_978447 ?auto_978450 ) ) ( HOIST-AT ?auto_978448 ?auto_978447 ) ( not ( = ?auto_978449 ?auto_978448 ) ) ( AVAILABLE ?auto_978448 ) ( SURFACE-AT ?auto_978446 ?auto_978447 ) ( ON ?auto_978446 ?auto_978452 ) ( CLEAR ?auto_978446 ) ( not ( = ?auto_978444 ?auto_978452 ) ) ( not ( = ?auto_978446 ?auto_978452 ) ) ( not ( = ?auto_978445 ?auto_978452 ) ) ( TRUCK-AT ?auto_978451 ?auto_978450 ) ( SURFACE-AT ?auto_978445 ?auto_978450 ) ( CLEAR ?auto_978445 ) ( LIFTING ?auto_978449 ?auto_978444 ) ( IS-CRATE ?auto_978444 ) ( ON ?auto_978442 ?auto_978441 ) ( ON ?auto_978443 ?auto_978442 ) ( ON ?auto_978445 ?auto_978443 ) ( not ( = ?auto_978441 ?auto_978442 ) ) ( not ( = ?auto_978441 ?auto_978443 ) ) ( not ( = ?auto_978441 ?auto_978445 ) ) ( not ( = ?auto_978441 ?auto_978444 ) ) ( not ( = ?auto_978441 ?auto_978446 ) ) ( not ( = ?auto_978441 ?auto_978452 ) ) ( not ( = ?auto_978442 ?auto_978443 ) ) ( not ( = ?auto_978442 ?auto_978445 ) ) ( not ( = ?auto_978442 ?auto_978444 ) ) ( not ( = ?auto_978442 ?auto_978446 ) ) ( not ( = ?auto_978442 ?auto_978452 ) ) ( not ( = ?auto_978443 ?auto_978445 ) ) ( not ( = ?auto_978443 ?auto_978444 ) ) ( not ( = ?auto_978443 ?auto_978446 ) ) ( not ( = ?auto_978443 ?auto_978452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978445 ?auto_978444 ?auto_978446 )
      ( MAKE-5CRATE-VERIFY ?auto_978441 ?auto_978442 ?auto_978443 ?auto_978445 ?auto_978444 ?auto_978446 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_978492 - SURFACE
      ?auto_978493 - SURFACE
      ?auto_978494 - SURFACE
      ?auto_978496 - SURFACE
      ?auto_978495 - SURFACE
      ?auto_978497 - SURFACE
    )
    :vars
    (
      ?auto_978500 - HOIST
      ?auto_978501 - PLACE
      ?auto_978502 - PLACE
      ?auto_978499 - HOIST
      ?auto_978503 - SURFACE
      ?auto_978498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978500 ?auto_978501 ) ( IS-CRATE ?auto_978497 ) ( not ( = ?auto_978495 ?auto_978497 ) ) ( not ( = ?auto_978496 ?auto_978495 ) ) ( not ( = ?auto_978496 ?auto_978497 ) ) ( not ( = ?auto_978502 ?auto_978501 ) ) ( HOIST-AT ?auto_978499 ?auto_978502 ) ( not ( = ?auto_978500 ?auto_978499 ) ) ( AVAILABLE ?auto_978499 ) ( SURFACE-AT ?auto_978497 ?auto_978502 ) ( ON ?auto_978497 ?auto_978503 ) ( CLEAR ?auto_978497 ) ( not ( = ?auto_978495 ?auto_978503 ) ) ( not ( = ?auto_978497 ?auto_978503 ) ) ( not ( = ?auto_978496 ?auto_978503 ) ) ( TRUCK-AT ?auto_978498 ?auto_978501 ) ( SURFACE-AT ?auto_978496 ?auto_978501 ) ( CLEAR ?auto_978496 ) ( IS-CRATE ?auto_978495 ) ( AVAILABLE ?auto_978500 ) ( IN ?auto_978495 ?auto_978498 ) ( ON ?auto_978493 ?auto_978492 ) ( ON ?auto_978494 ?auto_978493 ) ( ON ?auto_978496 ?auto_978494 ) ( not ( = ?auto_978492 ?auto_978493 ) ) ( not ( = ?auto_978492 ?auto_978494 ) ) ( not ( = ?auto_978492 ?auto_978496 ) ) ( not ( = ?auto_978492 ?auto_978495 ) ) ( not ( = ?auto_978492 ?auto_978497 ) ) ( not ( = ?auto_978492 ?auto_978503 ) ) ( not ( = ?auto_978493 ?auto_978494 ) ) ( not ( = ?auto_978493 ?auto_978496 ) ) ( not ( = ?auto_978493 ?auto_978495 ) ) ( not ( = ?auto_978493 ?auto_978497 ) ) ( not ( = ?auto_978493 ?auto_978503 ) ) ( not ( = ?auto_978494 ?auto_978496 ) ) ( not ( = ?auto_978494 ?auto_978495 ) ) ( not ( = ?auto_978494 ?auto_978497 ) ) ( not ( = ?auto_978494 ?auto_978503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_978496 ?auto_978495 ?auto_978497 )
      ( MAKE-5CRATE-VERIFY ?auto_978492 ?auto_978493 ?auto_978494 ?auto_978496 ?auto_978495 ?auto_978497 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_979688 - SURFACE
      ?auto_979689 - SURFACE
      ?auto_979690 - SURFACE
      ?auto_979692 - SURFACE
      ?auto_979691 - SURFACE
      ?auto_979693 - SURFACE
      ?auto_979694 - SURFACE
    )
    :vars
    (
      ?auto_979696 - HOIST
      ?auto_979695 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_979696 ?auto_979695 ) ( SURFACE-AT ?auto_979693 ?auto_979695 ) ( CLEAR ?auto_979693 ) ( LIFTING ?auto_979696 ?auto_979694 ) ( IS-CRATE ?auto_979694 ) ( not ( = ?auto_979693 ?auto_979694 ) ) ( ON ?auto_979689 ?auto_979688 ) ( ON ?auto_979690 ?auto_979689 ) ( ON ?auto_979692 ?auto_979690 ) ( ON ?auto_979691 ?auto_979692 ) ( ON ?auto_979693 ?auto_979691 ) ( not ( = ?auto_979688 ?auto_979689 ) ) ( not ( = ?auto_979688 ?auto_979690 ) ) ( not ( = ?auto_979688 ?auto_979692 ) ) ( not ( = ?auto_979688 ?auto_979691 ) ) ( not ( = ?auto_979688 ?auto_979693 ) ) ( not ( = ?auto_979688 ?auto_979694 ) ) ( not ( = ?auto_979689 ?auto_979690 ) ) ( not ( = ?auto_979689 ?auto_979692 ) ) ( not ( = ?auto_979689 ?auto_979691 ) ) ( not ( = ?auto_979689 ?auto_979693 ) ) ( not ( = ?auto_979689 ?auto_979694 ) ) ( not ( = ?auto_979690 ?auto_979692 ) ) ( not ( = ?auto_979690 ?auto_979691 ) ) ( not ( = ?auto_979690 ?auto_979693 ) ) ( not ( = ?auto_979690 ?auto_979694 ) ) ( not ( = ?auto_979692 ?auto_979691 ) ) ( not ( = ?auto_979692 ?auto_979693 ) ) ( not ( = ?auto_979692 ?auto_979694 ) ) ( not ( = ?auto_979691 ?auto_979693 ) ) ( not ( = ?auto_979691 ?auto_979694 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_979693 ?auto_979694 )
      ( MAKE-6CRATE-VERIFY ?auto_979688 ?auto_979689 ?auto_979690 ?auto_979692 ?auto_979691 ?auto_979693 ?auto_979694 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_979732 - SURFACE
      ?auto_979733 - SURFACE
      ?auto_979734 - SURFACE
      ?auto_979736 - SURFACE
      ?auto_979735 - SURFACE
      ?auto_979737 - SURFACE
      ?auto_979738 - SURFACE
    )
    :vars
    (
      ?auto_979739 - HOIST
      ?auto_979740 - PLACE
      ?auto_979741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979739 ?auto_979740 ) ( SURFACE-AT ?auto_979737 ?auto_979740 ) ( CLEAR ?auto_979737 ) ( IS-CRATE ?auto_979738 ) ( not ( = ?auto_979737 ?auto_979738 ) ) ( TRUCK-AT ?auto_979741 ?auto_979740 ) ( AVAILABLE ?auto_979739 ) ( IN ?auto_979738 ?auto_979741 ) ( ON ?auto_979737 ?auto_979735 ) ( not ( = ?auto_979735 ?auto_979737 ) ) ( not ( = ?auto_979735 ?auto_979738 ) ) ( ON ?auto_979733 ?auto_979732 ) ( ON ?auto_979734 ?auto_979733 ) ( ON ?auto_979736 ?auto_979734 ) ( ON ?auto_979735 ?auto_979736 ) ( not ( = ?auto_979732 ?auto_979733 ) ) ( not ( = ?auto_979732 ?auto_979734 ) ) ( not ( = ?auto_979732 ?auto_979736 ) ) ( not ( = ?auto_979732 ?auto_979735 ) ) ( not ( = ?auto_979732 ?auto_979737 ) ) ( not ( = ?auto_979732 ?auto_979738 ) ) ( not ( = ?auto_979733 ?auto_979734 ) ) ( not ( = ?auto_979733 ?auto_979736 ) ) ( not ( = ?auto_979733 ?auto_979735 ) ) ( not ( = ?auto_979733 ?auto_979737 ) ) ( not ( = ?auto_979733 ?auto_979738 ) ) ( not ( = ?auto_979734 ?auto_979736 ) ) ( not ( = ?auto_979734 ?auto_979735 ) ) ( not ( = ?auto_979734 ?auto_979737 ) ) ( not ( = ?auto_979734 ?auto_979738 ) ) ( not ( = ?auto_979736 ?auto_979735 ) ) ( not ( = ?auto_979736 ?auto_979737 ) ) ( not ( = ?auto_979736 ?auto_979738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979735 ?auto_979737 ?auto_979738 )
      ( MAKE-6CRATE-VERIFY ?auto_979732 ?auto_979733 ?auto_979734 ?auto_979736 ?auto_979735 ?auto_979737 ?auto_979738 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_979783 - SURFACE
      ?auto_979784 - SURFACE
      ?auto_979785 - SURFACE
      ?auto_979787 - SURFACE
      ?auto_979786 - SURFACE
      ?auto_979788 - SURFACE
      ?auto_979789 - SURFACE
    )
    :vars
    (
      ?auto_979790 - HOIST
      ?auto_979792 - PLACE
      ?auto_979793 - TRUCK
      ?auto_979791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_979790 ?auto_979792 ) ( SURFACE-AT ?auto_979788 ?auto_979792 ) ( CLEAR ?auto_979788 ) ( IS-CRATE ?auto_979789 ) ( not ( = ?auto_979788 ?auto_979789 ) ) ( AVAILABLE ?auto_979790 ) ( IN ?auto_979789 ?auto_979793 ) ( ON ?auto_979788 ?auto_979786 ) ( not ( = ?auto_979786 ?auto_979788 ) ) ( not ( = ?auto_979786 ?auto_979789 ) ) ( TRUCK-AT ?auto_979793 ?auto_979791 ) ( not ( = ?auto_979791 ?auto_979792 ) ) ( ON ?auto_979784 ?auto_979783 ) ( ON ?auto_979785 ?auto_979784 ) ( ON ?auto_979787 ?auto_979785 ) ( ON ?auto_979786 ?auto_979787 ) ( not ( = ?auto_979783 ?auto_979784 ) ) ( not ( = ?auto_979783 ?auto_979785 ) ) ( not ( = ?auto_979783 ?auto_979787 ) ) ( not ( = ?auto_979783 ?auto_979786 ) ) ( not ( = ?auto_979783 ?auto_979788 ) ) ( not ( = ?auto_979783 ?auto_979789 ) ) ( not ( = ?auto_979784 ?auto_979785 ) ) ( not ( = ?auto_979784 ?auto_979787 ) ) ( not ( = ?auto_979784 ?auto_979786 ) ) ( not ( = ?auto_979784 ?auto_979788 ) ) ( not ( = ?auto_979784 ?auto_979789 ) ) ( not ( = ?auto_979785 ?auto_979787 ) ) ( not ( = ?auto_979785 ?auto_979786 ) ) ( not ( = ?auto_979785 ?auto_979788 ) ) ( not ( = ?auto_979785 ?auto_979789 ) ) ( not ( = ?auto_979787 ?auto_979786 ) ) ( not ( = ?auto_979787 ?auto_979788 ) ) ( not ( = ?auto_979787 ?auto_979789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979786 ?auto_979788 ?auto_979789 )
      ( MAKE-6CRATE-VERIFY ?auto_979783 ?auto_979784 ?auto_979785 ?auto_979787 ?auto_979786 ?auto_979788 ?auto_979789 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_979840 - SURFACE
      ?auto_979841 - SURFACE
      ?auto_979842 - SURFACE
      ?auto_979844 - SURFACE
      ?auto_979843 - SURFACE
      ?auto_979845 - SURFACE
      ?auto_979846 - SURFACE
    )
    :vars
    (
      ?auto_979847 - HOIST
      ?auto_979848 - PLACE
      ?auto_979849 - TRUCK
      ?auto_979851 - PLACE
      ?auto_979850 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_979847 ?auto_979848 ) ( SURFACE-AT ?auto_979845 ?auto_979848 ) ( CLEAR ?auto_979845 ) ( IS-CRATE ?auto_979846 ) ( not ( = ?auto_979845 ?auto_979846 ) ) ( AVAILABLE ?auto_979847 ) ( ON ?auto_979845 ?auto_979843 ) ( not ( = ?auto_979843 ?auto_979845 ) ) ( not ( = ?auto_979843 ?auto_979846 ) ) ( TRUCK-AT ?auto_979849 ?auto_979851 ) ( not ( = ?auto_979851 ?auto_979848 ) ) ( HOIST-AT ?auto_979850 ?auto_979851 ) ( LIFTING ?auto_979850 ?auto_979846 ) ( not ( = ?auto_979847 ?auto_979850 ) ) ( ON ?auto_979841 ?auto_979840 ) ( ON ?auto_979842 ?auto_979841 ) ( ON ?auto_979844 ?auto_979842 ) ( ON ?auto_979843 ?auto_979844 ) ( not ( = ?auto_979840 ?auto_979841 ) ) ( not ( = ?auto_979840 ?auto_979842 ) ) ( not ( = ?auto_979840 ?auto_979844 ) ) ( not ( = ?auto_979840 ?auto_979843 ) ) ( not ( = ?auto_979840 ?auto_979845 ) ) ( not ( = ?auto_979840 ?auto_979846 ) ) ( not ( = ?auto_979841 ?auto_979842 ) ) ( not ( = ?auto_979841 ?auto_979844 ) ) ( not ( = ?auto_979841 ?auto_979843 ) ) ( not ( = ?auto_979841 ?auto_979845 ) ) ( not ( = ?auto_979841 ?auto_979846 ) ) ( not ( = ?auto_979842 ?auto_979844 ) ) ( not ( = ?auto_979842 ?auto_979843 ) ) ( not ( = ?auto_979842 ?auto_979845 ) ) ( not ( = ?auto_979842 ?auto_979846 ) ) ( not ( = ?auto_979844 ?auto_979843 ) ) ( not ( = ?auto_979844 ?auto_979845 ) ) ( not ( = ?auto_979844 ?auto_979846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979843 ?auto_979845 ?auto_979846 )
      ( MAKE-6CRATE-VERIFY ?auto_979840 ?auto_979841 ?auto_979842 ?auto_979844 ?auto_979843 ?auto_979845 ?auto_979846 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_979903 - SURFACE
      ?auto_979904 - SURFACE
      ?auto_979905 - SURFACE
      ?auto_979907 - SURFACE
      ?auto_979906 - SURFACE
      ?auto_979908 - SURFACE
      ?auto_979909 - SURFACE
    )
    :vars
    (
      ?auto_979915 - HOIST
      ?auto_979910 - PLACE
      ?auto_979911 - TRUCK
      ?auto_979912 - PLACE
      ?auto_979913 - HOIST
      ?auto_979914 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_979915 ?auto_979910 ) ( SURFACE-AT ?auto_979908 ?auto_979910 ) ( CLEAR ?auto_979908 ) ( IS-CRATE ?auto_979909 ) ( not ( = ?auto_979908 ?auto_979909 ) ) ( AVAILABLE ?auto_979915 ) ( ON ?auto_979908 ?auto_979906 ) ( not ( = ?auto_979906 ?auto_979908 ) ) ( not ( = ?auto_979906 ?auto_979909 ) ) ( TRUCK-AT ?auto_979911 ?auto_979912 ) ( not ( = ?auto_979912 ?auto_979910 ) ) ( HOIST-AT ?auto_979913 ?auto_979912 ) ( not ( = ?auto_979915 ?auto_979913 ) ) ( AVAILABLE ?auto_979913 ) ( SURFACE-AT ?auto_979909 ?auto_979912 ) ( ON ?auto_979909 ?auto_979914 ) ( CLEAR ?auto_979909 ) ( not ( = ?auto_979908 ?auto_979914 ) ) ( not ( = ?auto_979909 ?auto_979914 ) ) ( not ( = ?auto_979906 ?auto_979914 ) ) ( ON ?auto_979904 ?auto_979903 ) ( ON ?auto_979905 ?auto_979904 ) ( ON ?auto_979907 ?auto_979905 ) ( ON ?auto_979906 ?auto_979907 ) ( not ( = ?auto_979903 ?auto_979904 ) ) ( not ( = ?auto_979903 ?auto_979905 ) ) ( not ( = ?auto_979903 ?auto_979907 ) ) ( not ( = ?auto_979903 ?auto_979906 ) ) ( not ( = ?auto_979903 ?auto_979908 ) ) ( not ( = ?auto_979903 ?auto_979909 ) ) ( not ( = ?auto_979903 ?auto_979914 ) ) ( not ( = ?auto_979904 ?auto_979905 ) ) ( not ( = ?auto_979904 ?auto_979907 ) ) ( not ( = ?auto_979904 ?auto_979906 ) ) ( not ( = ?auto_979904 ?auto_979908 ) ) ( not ( = ?auto_979904 ?auto_979909 ) ) ( not ( = ?auto_979904 ?auto_979914 ) ) ( not ( = ?auto_979905 ?auto_979907 ) ) ( not ( = ?auto_979905 ?auto_979906 ) ) ( not ( = ?auto_979905 ?auto_979908 ) ) ( not ( = ?auto_979905 ?auto_979909 ) ) ( not ( = ?auto_979905 ?auto_979914 ) ) ( not ( = ?auto_979907 ?auto_979906 ) ) ( not ( = ?auto_979907 ?auto_979908 ) ) ( not ( = ?auto_979907 ?auto_979909 ) ) ( not ( = ?auto_979907 ?auto_979914 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979906 ?auto_979908 ?auto_979909 )
      ( MAKE-6CRATE-VERIFY ?auto_979903 ?auto_979904 ?auto_979905 ?auto_979907 ?auto_979906 ?auto_979908 ?auto_979909 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_979967 - SURFACE
      ?auto_979968 - SURFACE
      ?auto_979969 - SURFACE
      ?auto_979971 - SURFACE
      ?auto_979970 - SURFACE
      ?auto_979972 - SURFACE
      ?auto_979973 - SURFACE
    )
    :vars
    (
      ?auto_979974 - HOIST
      ?auto_979979 - PLACE
      ?auto_979977 - PLACE
      ?auto_979978 - HOIST
      ?auto_979976 - SURFACE
      ?auto_979975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_979974 ?auto_979979 ) ( SURFACE-AT ?auto_979972 ?auto_979979 ) ( CLEAR ?auto_979972 ) ( IS-CRATE ?auto_979973 ) ( not ( = ?auto_979972 ?auto_979973 ) ) ( AVAILABLE ?auto_979974 ) ( ON ?auto_979972 ?auto_979970 ) ( not ( = ?auto_979970 ?auto_979972 ) ) ( not ( = ?auto_979970 ?auto_979973 ) ) ( not ( = ?auto_979977 ?auto_979979 ) ) ( HOIST-AT ?auto_979978 ?auto_979977 ) ( not ( = ?auto_979974 ?auto_979978 ) ) ( AVAILABLE ?auto_979978 ) ( SURFACE-AT ?auto_979973 ?auto_979977 ) ( ON ?auto_979973 ?auto_979976 ) ( CLEAR ?auto_979973 ) ( not ( = ?auto_979972 ?auto_979976 ) ) ( not ( = ?auto_979973 ?auto_979976 ) ) ( not ( = ?auto_979970 ?auto_979976 ) ) ( TRUCK-AT ?auto_979975 ?auto_979979 ) ( ON ?auto_979968 ?auto_979967 ) ( ON ?auto_979969 ?auto_979968 ) ( ON ?auto_979971 ?auto_979969 ) ( ON ?auto_979970 ?auto_979971 ) ( not ( = ?auto_979967 ?auto_979968 ) ) ( not ( = ?auto_979967 ?auto_979969 ) ) ( not ( = ?auto_979967 ?auto_979971 ) ) ( not ( = ?auto_979967 ?auto_979970 ) ) ( not ( = ?auto_979967 ?auto_979972 ) ) ( not ( = ?auto_979967 ?auto_979973 ) ) ( not ( = ?auto_979967 ?auto_979976 ) ) ( not ( = ?auto_979968 ?auto_979969 ) ) ( not ( = ?auto_979968 ?auto_979971 ) ) ( not ( = ?auto_979968 ?auto_979970 ) ) ( not ( = ?auto_979968 ?auto_979972 ) ) ( not ( = ?auto_979968 ?auto_979973 ) ) ( not ( = ?auto_979968 ?auto_979976 ) ) ( not ( = ?auto_979969 ?auto_979971 ) ) ( not ( = ?auto_979969 ?auto_979970 ) ) ( not ( = ?auto_979969 ?auto_979972 ) ) ( not ( = ?auto_979969 ?auto_979973 ) ) ( not ( = ?auto_979969 ?auto_979976 ) ) ( not ( = ?auto_979971 ?auto_979970 ) ) ( not ( = ?auto_979971 ?auto_979972 ) ) ( not ( = ?auto_979971 ?auto_979973 ) ) ( not ( = ?auto_979971 ?auto_979976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_979970 ?auto_979972 ?auto_979973 )
      ( MAKE-6CRATE-VERIFY ?auto_979967 ?auto_979968 ?auto_979969 ?auto_979971 ?auto_979970 ?auto_979972 ?auto_979973 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980031 - SURFACE
      ?auto_980032 - SURFACE
      ?auto_980033 - SURFACE
      ?auto_980035 - SURFACE
      ?auto_980034 - SURFACE
      ?auto_980036 - SURFACE
      ?auto_980037 - SURFACE
    )
    :vars
    (
      ?auto_980043 - HOIST
      ?auto_980040 - PLACE
      ?auto_980038 - PLACE
      ?auto_980041 - HOIST
      ?auto_980042 - SURFACE
      ?auto_980039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980043 ?auto_980040 ) ( IS-CRATE ?auto_980037 ) ( not ( = ?auto_980036 ?auto_980037 ) ) ( not ( = ?auto_980034 ?auto_980036 ) ) ( not ( = ?auto_980034 ?auto_980037 ) ) ( not ( = ?auto_980038 ?auto_980040 ) ) ( HOIST-AT ?auto_980041 ?auto_980038 ) ( not ( = ?auto_980043 ?auto_980041 ) ) ( AVAILABLE ?auto_980041 ) ( SURFACE-AT ?auto_980037 ?auto_980038 ) ( ON ?auto_980037 ?auto_980042 ) ( CLEAR ?auto_980037 ) ( not ( = ?auto_980036 ?auto_980042 ) ) ( not ( = ?auto_980037 ?auto_980042 ) ) ( not ( = ?auto_980034 ?auto_980042 ) ) ( TRUCK-AT ?auto_980039 ?auto_980040 ) ( SURFACE-AT ?auto_980034 ?auto_980040 ) ( CLEAR ?auto_980034 ) ( LIFTING ?auto_980043 ?auto_980036 ) ( IS-CRATE ?auto_980036 ) ( ON ?auto_980032 ?auto_980031 ) ( ON ?auto_980033 ?auto_980032 ) ( ON ?auto_980035 ?auto_980033 ) ( ON ?auto_980034 ?auto_980035 ) ( not ( = ?auto_980031 ?auto_980032 ) ) ( not ( = ?auto_980031 ?auto_980033 ) ) ( not ( = ?auto_980031 ?auto_980035 ) ) ( not ( = ?auto_980031 ?auto_980034 ) ) ( not ( = ?auto_980031 ?auto_980036 ) ) ( not ( = ?auto_980031 ?auto_980037 ) ) ( not ( = ?auto_980031 ?auto_980042 ) ) ( not ( = ?auto_980032 ?auto_980033 ) ) ( not ( = ?auto_980032 ?auto_980035 ) ) ( not ( = ?auto_980032 ?auto_980034 ) ) ( not ( = ?auto_980032 ?auto_980036 ) ) ( not ( = ?auto_980032 ?auto_980037 ) ) ( not ( = ?auto_980032 ?auto_980042 ) ) ( not ( = ?auto_980033 ?auto_980035 ) ) ( not ( = ?auto_980033 ?auto_980034 ) ) ( not ( = ?auto_980033 ?auto_980036 ) ) ( not ( = ?auto_980033 ?auto_980037 ) ) ( not ( = ?auto_980033 ?auto_980042 ) ) ( not ( = ?auto_980035 ?auto_980034 ) ) ( not ( = ?auto_980035 ?auto_980036 ) ) ( not ( = ?auto_980035 ?auto_980037 ) ) ( not ( = ?auto_980035 ?auto_980042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980034 ?auto_980036 ?auto_980037 )
      ( MAKE-6CRATE-VERIFY ?auto_980031 ?auto_980032 ?auto_980033 ?auto_980035 ?auto_980034 ?auto_980036 ?auto_980037 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980095 - SURFACE
      ?auto_980096 - SURFACE
      ?auto_980097 - SURFACE
      ?auto_980099 - SURFACE
      ?auto_980098 - SURFACE
      ?auto_980100 - SURFACE
      ?auto_980101 - SURFACE
    )
    :vars
    (
      ?auto_980105 - HOIST
      ?auto_980107 - PLACE
      ?auto_980102 - PLACE
      ?auto_980106 - HOIST
      ?auto_980104 - SURFACE
      ?auto_980103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980105 ?auto_980107 ) ( IS-CRATE ?auto_980101 ) ( not ( = ?auto_980100 ?auto_980101 ) ) ( not ( = ?auto_980098 ?auto_980100 ) ) ( not ( = ?auto_980098 ?auto_980101 ) ) ( not ( = ?auto_980102 ?auto_980107 ) ) ( HOIST-AT ?auto_980106 ?auto_980102 ) ( not ( = ?auto_980105 ?auto_980106 ) ) ( AVAILABLE ?auto_980106 ) ( SURFACE-AT ?auto_980101 ?auto_980102 ) ( ON ?auto_980101 ?auto_980104 ) ( CLEAR ?auto_980101 ) ( not ( = ?auto_980100 ?auto_980104 ) ) ( not ( = ?auto_980101 ?auto_980104 ) ) ( not ( = ?auto_980098 ?auto_980104 ) ) ( TRUCK-AT ?auto_980103 ?auto_980107 ) ( SURFACE-AT ?auto_980098 ?auto_980107 ) ( CLEAR ?auto_980098 ) ( IS-CRATE ?auto_980100 ) ( AVAILABLE ?auto_980105 ) ( IN ?auto_980100 ?auto_980103 ) ( ON ?auto_980096 ?auto_980095 ) ( ON ?auto_980097 ?auto_980096 ) ( ON ?auto_980099 ?auto_980097 ) ( ON ?auto_980098 ?auto_980099 ) ( not ( = ?auto_980095 ?auto_980096 ) ) ( not ( = ?auto_980095 ?auto_980097 ) ) ( not ( = ?auto_980095 ?auto_980099 ) ) ( not ( = ?auto_980095 ?auto_980098 ) ) ( not ( = ?auto_980095 ?auto_980100 ) ) ( not ( = ?auto_980095 ?auto_980101 ) ) ( not ( = ?auto_980095 ?auto_980104 ) ) ( not ( = ?auto_980096 ?auto_980097 ) ) ( not ( = ?auto_980096 ?auto_980099 ) ) ( not ( = ?auto_980096 ?auto_980098 ) ) ( not ( = ?auto_980096 ?auto_980100 ) ) ( not ( = ?auto_980096 ?auto_980101 ) ) ( not ( = ?auto_980096 ?auto_980104 ) ) ( not ( = ?auto_980097 ?auto_980099 ) ) ( not ( = ?auto_980097 ?auto_980098 ) ) ( not ( = ?auto_980097 ?auto_980100 ) ) ( not ( = ?auto_980097 ?auto_980101 ) ) ( not ( = ?auto_980097 ?auto_980104 ) ) ( not ( = ?auto_980099 ?auto_980098 ) ) ( not ( = ?auto_980099 ?auto_980100 ) ) ( not ( = ?auto_980099 ?auto_980101 ) ) ( not ( = ?auto_980099 ?auto_980104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980098 ?auto_980100 ?auto_980101 )
      ( MAKE-6CRATE-VERIFY ?auto_980095 ?auto_980096 ?auto_980097 ?auto_980099 ?auto_980098 ?auto_980100 ?auto_980101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_980126 - SURFACE
      ?auto_980127 - SURFACE
      ?auto_980128 - SURFACE
      ?auto_980129 - SURFACE
    )
    :vars
    (
      ?auto_980132 - HOIST
      ?auto_980131 - PLACE
      ?auto_980135 - PLACE
      ?auto_980134 - HOIST
      ?auto_980130 - SURFACE
      ?auto_980133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980132 ?auto_980131 ) ( IS-CRATE ?auto_980129 ) ( not ( = ?auto_980128 ?auto_980129 ) ) ( not ( = ?auto_980127 ?auto_980128 ) ) ( not ( = ?auto_980127 ?auto_980129 ) ) ( not ( = ?auto_980135 ?auto_980131 ) ) ( HOIST-AT ?auto_980134 ?auto_980135 ) ( not ( = ?auto_980132 ?auto_980134 ) ) ( AVAILABLE ?auto_980134 ) ( SURFACE-AT ?auto_980129 ?auto_980135 ) ( ON ?auto_980129 ?auto_980130 ) ( CLEAR ?auto_980129 ) ( not ( = ?auto_980128 ?auto_980130 ) ) ( not ( = ?auto_980129 ?auto_980130 ) ) ( not ( = ?auto_980127 ?auto_980130 ) ) ( SURFACE-AT ?auto_980127 ?auto_980131 ) ( CLEAR ?auto_980127 ) ( IS-CRATE ?auto_980128 ) ( AVAILABLE ?auto_980132 ) ( IN ?auto_980128 ?auto_980133 ) ( TRUCK-AT ?auto_980133 ?auto_980135 ) ( ON ?auto_980127 ?auto_980126 ) ( not ( = ?auto_980126 ?auto_980127 ) ) ( not ( = ?auto_980126 ?auto_980128 ) ) ( not ( = ?auto_980126 ?auto_980129 ) ) ( not ( = ?auto_980126 ?auto_980130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980127 ?auto_980128 ?auto_980129 )
      ( MAKE-3CRATE-VERIFY ?auto_980126 ?auto_980127 ?auto_980128 ?auto_980129 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_980136 - SURFACE
      ?auto_980137 - SURFACE
      ?auto_980138 - SURFACE
      ?auto_980140 - SURFACE
      ?auto_980139 - SURFACE
    )
    :vars
    (
      ?auto_980143 - HOIST
      ?auto_980142 - PLACE
      ?auto_980146 - PLACE
      ?auto_980145 - HOIST
      ?auto_980141 - SURFACE
      ?auto_980144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980143 ?auto_980142 ) ( IS-CRATE ?auto_980139 ) ( not ( = ?auto_980140 ?auto_980139 ) ) ( not ( = ?auto_980138 ?auto_980140 ) ) ( not ( = ?auto_980138 ?auto_980139 ) ) ( not ( = ?auto_980146 ?auto_980142 ) ) ( HOIST-AT ?auto_980145 ?auto_980146 ) ( not ( = ?auto_980143 ?auto_980145 ) ) ( AVAILABLE ?auto_980145 ) ( SURFACE-AT ?auto_980139 ?auto_980146 ) ( ON ?auto_980139 ?auto_980141 ) ( CLEAR ?auto_980139 ) ( not ( = ?auto_980140 ?auto_980141 ) ) ( not ( = ?auto_980139 ?auto_980141 ) ) ( not ( = ?auto_980138 ?auto_980141 ) ) ( SURFACE-AT ?auto_980138 ?auto_980142 ) ( CLEAR ?auto_980138 ) ( IS-CRATE ?auto_980140 ) ( AVAILABLE ?auto_980143 ) ( IN ?auto_980140 ?auto_980144 ) ( TRUCK-AT ?auto_980144 ?auto_980146 ) ( ON ?auto_980137 ?auto_980136 ) ( ON ?auto_980138 ?auto_980137 ) ( not ( = ?auto_980136 ?auto_980137 ) ) ( not ( = ?auto_980136 ?auto_980138 ) ) ( not ( = ?auto_980136 ?auto_980140 ) ) ( not ( = ?auto_980136 ?auto_980139 ) ) ( not ( = ?auto_980136 ?auto_980141 ) ) ( not ( = ?auto_980137 ?auto_980138 ) ) ( not ( = ?auto_980137 ?auto_980140 ) ) ( not ( = ?auto_980137 ?auto_980139 ) ) ( not ( = ?auto_980137 ?auto_980141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980138 ?auto_980140 ?auto_980139 )
      ( MAKE-4CRATE-VERIFY ?auto_980136 ?auto_980137 ?auto_980138 ?auto_980140 ?auto_980139 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_980147 - SURFACE
      ?auto_980148 - SURFACE
      ?auto_980149 - SURFACE
      ?auto_980151 - SURFACE
      ?auto_980150 - SURFACE
      ?auto_980152 - SURFACE
    )
    :vars
    (
      ?auto_980155 - HOIST
      ?auto_980154 - PLACE
      ?auto_980158 - PLACE
      ?auto_980157 - HOIST
      ?auto_980153 - SURFACE
      ?auto_980156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980155 ?auto_980154 ) ( IS-CRATE ?auto_980152 ) ( not ( = ?auto_980150 ?auto_980152 ) ) ( not ( = ?auto_980151 ?auto_980150 ) ) ( not ( = ?auto_980151 ?auto_980152 ) ) ( not ( = ?auto_980158 ?auto_980154 ) ) ( HOIST-AT ?auto_980157 ?auto_980158 ) ( not ( = ?auto_980155 ?auto_980157 ) ) ( AVAILABLE ?auto_980157 ) ( SURFACE-AT ?auto_980152 ?auto_980158 ) ( ON ?auto_980152 ?auto_980153 ) ( CLEAR ?auto_980152 ) ( not ( = ?auto_980150 ?auto_980153 ) ) ( not ( = ?auto_980152 ?auto_980153 ) ) ( not ( = ?auto_980151 ?auto_980153 ) ) ( SURFACE-AT ?auto_980151 ?auto_980154 ) ( CLEAR ?auto_980151 ) ( IS-CRATE ?auto_980150 ) ( AVAILABLE ?auto_980155 ) ( IN ?auto_980150 ?auto_980156 ) ( TRUCK-AT ?auto_980156 ?auto_980158 ) ( ON ?auto_980148 ?auto_980147 ) ( ON ?auto_980149 ?auto_980148 ) ( ON ?auto_980151 ?auto_980149 ) ( not ( = ?auto_980147 ?auto_980148 ) ) ( not ( = ?auto_980147 ?auto_980149 ) ) ( not ( = ?auto_980147 ?auto_980151 ) ) ( not ( = ?auto_980147 ?auto_980150 ) ) ( not ( = ?auto_980147 ?auto_980152 ) ) ( not ( = ?auto_980147 ?auto_980153 ) ) ( not ( = ?auto_980148 ?auto_980149 ) ) ( not ( = ?auto_980148 ?auto_980151 ) ) ( not ( = ?auto_980148 ?auto_980150 ) ) ( not ( = ?auto_980148 ?auto_980152 ) ) ( not ( = ?auto_980148 ?auto_980153 ) ) ( not ( = ?auto_980149 ?auto_980151 ) ) ( not ( = ?auto_980149 ?auto_980150 ) ) ( not ( = ?auto_980149 ?auto_980152 ) ) ( not ( = ?auto_980149 ?auto_980153 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980151 ?auto_980150 ?auto_980152 )
      ( MAKE-5CRATE-VERIFY ?auto_980147 ?auto_980148 ?auto_980149 ?auto_980151 ?auto_980150 ?auto_980152 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980159 - SURFACE
      ?auto_980160 - SURFACE
      ?auto_980161 - SURFACE
      ?auto_980163 - SURFACE
      ?auto_980162 - SURFACE
      ?auto_980164 - SURFACE
      ?auto_980165 - SURFACE
    )
    :vars
    (
      ?auto_980168 - HOIST
      ?auto_980167 - PLACE
      ?auto_980171 - PLACE
      ?auto_980170 - HOIST
      ?auto_980166 - SURFACE
      ?auto_980169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980168 ?auto_980167 ) ( IS-CRATE ?auto_980165 ) ( not ( = ?auto_980164 ?auto_980165 ) ) ( not ( = ?auto_980162 ?auto_980164 ) ) ( not ( = ?auto_980162 ?auto_980165 ) ) ( not ( = ?auto_980171 ?auto_980167 ) ) ( HOIST-AT ?auto_980170 ?auto_980171 ) ( not ( = ?auto_980168 ?auto_980170 ) ) ( AVAILABLE ?auto_980170 ) ( SURFACE-AT ?auto_980165 ?auto_980171 ) ( ON ?auto_980165 ?auto_980166 ) ( CLEAR ?auto_980165 ) ( not ( = ?auto_980164 ?auto_980166 ) ) ( not ( = ?auto_980165 ?auto_980166 ) ) ( not ( = ?auto_980162 ?auto_980166 ) ) ( SURFACE-AT ?auto_980162 ?auto_980167 ) ( CLEAR ?auto_980162 ) ( IS-CRATE ?auto_980164 ) ( AVAILABLE ?auto_980168 ) ( IN ?auto_980164 ?auto_980169 ) ( TRUCK-AT ?auto_980169 ?auto_980171 ) ( ON ?auto_980160 ?auto_980159 ) ( ON ?auto_980161 ?auto_980160 ) ( ON ?auto_980163 ?auto_980161 ) ( ON ?auto_980162 ?auto_980163 ) ( not ( = ?auto_980159 ?auto_980160 ) ) ( not ( = ?auto_980159 ?auto_980161 ) ) ( not ( = ?auto_980159 ?auto_980163 ) ) ( not ( = ?auto_980159 ?auto_980162 ) ) ( not ( = ?auto_980159 ?auto_980164 ) ) ( not ( = ?auto_980159 ?auto_980165 ) ) ( not ( = ?auto_980159 ?auto_980166 ) ) ( not ( = ?auto_980160 ?auto_980161 ) ) ( not ( = ?auto_980160 ?auto_980163 ) ) ( not ( = ?auto_980160 ?auto_980162 ) ) ( not ( = ?auto_980160 ?auto_980164 ) ) ( not ( = ?auto_980160 ?auto_980165 ) ) ( not ( = ?auto_980160 ?auto_980166 ) ) ( not ( = ?auto_980161 ?auto_980163 ) ) ( not ( = ?auto_980161 ?auto_980162 ) ) ( not ( = ?auto_980161 ?auto_980164 ) ) ( not ( = ?auto_980161 ?auto_980165 ) ) ( not ( = ?auto_980161 ?auto_980166 ) ) ( not ( = ?auto_980163 ?auto_980162 ) ) ( not ( = ?auto_980163 ?auto_980164 ) ) ( not ( = ?auto_980163 ?auto_980165 ) ) ( not ( = ?auto_980163 ?auto_980166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980162 ?auto_980164 ?auto_980165 )
      ( MAKE-6CRATE-VERIFY ?auto_980159 ?auto_980160 ?auto_980161 ?auto_980163 ?auto_980162 ?auto_980164 ?auto_980165 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_980190 - SURFACE
      ?auto_980191 - SURFACE
      ?auto_980192 - SURFACE
      ?auto_980193 - SURFACE
    )
    :vars
    (
      ?auto_980198 - HOIST
      ?auto_980199 - PLACE
      ?auto_980196 - PLACE
      ?auto_980197 - HOIST
      ?auto_980195 - SURFACE
      ?auto_980194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980198 ?auto_980199 ) ( IS-CRATE ?auto_980193 ) ( not ( = ?auto_980192 ?auto_980193 ) ) ( not ( = ?auto_980191 ?auto_980192 ) ) ( not ( = ?auto_980191 ?auto_980193 ) ) ( not ( = ?auto_980196 ?auto_980199 ) ) ( HOIST-AT ?auto_980197 ?auto_980196 ) ( not ( = ?auto_980198 ?auto_980197 ) ) ( SURFACE-AT ?auto_980193 ?auto_980196 ) ( ON ?auto_980193 ?auto_980195 ) ( CLEAR ?auto_980193 ) ( not ( = ?auto_980192 ?auto_980195 ) ) ( not ( = ?auto_980193 ?auto_980195 ) ) ( not ( = ?auto_980191 ?auto_980195 ) ) ( SURFACE-AT ?auto_980191 ?auto_980199 ) ( CLEAR ?auto_980191 ) ( IS-CRATE ?auto_980192 ) ( AVAILABLE ?auto_980198 ) ( TRUCK-AT ?auto_980194 ?auto_980196 ) ( LIFTING ?auto_980197 ?auto_980192 ) ( ON ?auto_980191 ?auto_980190 ) ( not ( = ?auto_980190 ?auto_980191 ) ) ( not ( = ?auto_980190 ?auto_980192 ) ) ( not ( = ?auto_980190 ?auto_980193 ) ) ( not ( = ?auto_980190 ?auto_980195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980191 ?auto_980192 ?auto_980193 )
      ( MAKE-3CRATE-VERIFY ?auto_980190 ?auto_980191 ?auto_980192 ?auto_980193 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_980200 - SURFACE
      ?auto_980201 - SURFACE
      ?auto_980202 - SURFACE
      ?auto_980204 - SURFACE
      ?auto_980203 - SURFACE
    )
    :vars
    (
      ?auto_980209 - HOIST
      ?auto_980210 - PLACE
      ?auto_980207 - PLACE
      ?auto_980208 - HOIST
      ?auto_980206 - SURFACE
      ?auto_980205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980209 ?auto_980210 ) ( IS-CRATE ?auto_980203 ) ( not ( = ?auto_980204 ?auto_980203 ) ) ( not ( = ?auto_980202 ?auto_980204 ) ) ( not ( = ?auto_980202 ?auto_980203 ) ) ( not ( = ?auto_980207 ?auto_980210 ) ) ( HOIST-AT ?auto_980208 ?auto_980207 ) ( not ( = ?auto_980209 ?auto_980208 ) ) ( SURFACE-AT ?auto_980203 ?auto_980207 ) ( ON ?auto_980203 ?auto_980206 ) ( CLEAR ?auto_980203 ) ( not ( = ?auto_980204 ?auto_980206 ) ) ( not ( = ?auto_980203 ?auto_980206 ) ) ( not ( = ?auto_980202 ?auto_980206 ) ) ( SURFACE-AT ?auto_980202 ?auto_980210 ) ( CLEAR ?auto_980202 ) ( IS-CRATE ?auto_980204 ) ( AVAILABLE ?auto_980209 ) ( TRUCK-AT ?auto_980205 ?auto_980207 ) ( LIFTING ?auto_980208 ?auto_980204 ) ( ON ?auto_980201 ?auto_980200 ) ( ON ?auto_980202 ?auto_980201 ) ( not ( = ?auto_980200 ?auto_980201 ) ) ( not ( = ?auto_980200 ?auto_980202 ) ) ( not ( = ?auto_980200 ?auto_980204 ) ) ( not ( = ?auto_980200 ?auto_980203 ) ) ( not ( = ?auto_980200 ?auto_980206 ) ) ( not ( = ?auto_980201 ?auto_980202 ) ) ( not ( = ?auto_980201 ?auto_980204 ) ) ( not ( = ?auto_980201 ?auto_980203 ) ) ( not ( = ?auto_980201 ?auto_980206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980202 ?auto_980204 ?auto_980203 )
      ( MAKE-4CRATE-VERIFY ?auto_980200 ?auto_980201 ?auto_980202 ?auto_980204 ?auto_980203 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_980211 - SURFACE
      ?auto_980212 - SURFACE
      ?auto_980213 - SURFACE
      ?auto_980215 - SURFACE
      ?auto_980214 - SURFACE
      ?auto_980216 - SURFACE
    )
    :vars
    (
      ?auto_980221 - HOIST
      ?auto_980222 - PLACE
      ?auto_980219 - PLACE
      ?auto_980220 - HOIST
      ?auto_980218 - SURFACE
      ?auto_980217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980221 ?auto_980222 ) ( IS-CRATE ?auto_980216 ) ( not ( = ?auto_980214 ?auto_980216 ) ) ( not ( = ?auto_980215 ?auto_980214 ) ) ( not ( = ?auto_980215 ?auto_980216 ) ) ( not ( = ?auto_980219 ?auto_980222 ) ) ( HOIST-AT ?auto_980220 ?auto_980219 ) ( not ( = ?auto_980221 ?auto_980220 ) ) ( SURFACE-AT ?auto_980216 ?auto_980219 ) ( ON ?auto_980216 ?auto_980218 ) ( CLEAR ?auto_980216 ) ( not ( = ?auto_980214 ?auto_980218 ) ) ( not ( = ?auto_980216 ?auto_980218 ) ) ( not ( = ?auto_980215 ?auto_980218 ) ) ( SURFACE-AT ?auto_980215 ?auto_980222 ) ( CLEAR ?auto_980215 ) ( IS-CRATE ?auto_980214 ) ( AVAILABLE ?auto_980221 ) ( TRUCK-AT ?auto_980217 ?auto_980219 ) ( LIFTING ?auto_980220 ?auto_980214 ) ( ON ?auto_980212 ?auto_980211 ) ( ON ?auto_980213 ?auto_980212 ) ( ON ?auto_980215 ?auto_980213 ) ( not ( = ?auto_980211 ?auto_980212 ) ) ( not ( = ?auto_980211 ?auto_980213 ) ) ( not ( = ?auto_980211 ?auto_980215 ) ) ( not ( = ?auto_980211 ?auto_980214 ) ) ( not ( = ?auto_980211 ?auto_980216 ) ) ( not ( = ?auto_980211 ?auto_980218 ) ) ( not ( = ?auto_980212 ?auto_980213 ) ) ( not ( = ?auto_980212 ?auto_980215 ) ) ( not ( = ?auto_980212 ?auto_980214 ) ) ( not ( = ?auto_980212 ?auto_980216 ) ) ( not ( = ?auto_980212 ?auto_980218 ) ) ( not ( = ?auto_980213 ?auto_980215 ) ) ( not ( = ?auto_980213 ?auto_980214 ) ) ( not ( = ?auto_980213 ?auto_980216 ) ) ( not ( = ?auto_980213 ?auto_980218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980215 ?auto_980214 ?auto_980216 )
      ( MAKE-5CRATE-VERIFY ?auto_980211 ?auto_980212 ?auto_980213 ?auto_980215 ?auto_980214 ?auto_980216 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980223 - SURFACE
      ?auto_980224 - SURFACE
      ?auto_980225 - SURFACE
      ?auto_980227 - SURFACE
      ?auto_980226 - SURFACE
      ?auto_980228 - SURFACE
      ?auto_980229 - SURFACE
    )
    :vars
    (
      ?auto_980234 - HOIST
      ?auto_980235 - PLACE
      ?auto_980232 - PLACE
      ?auto_980233 - HOIST
      ?auto_980231 - SURFACE
      ?auto_980230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980234 ?auto_980235 ) ( IS-CRATE ?auto_980229 ) ( not ( = ?auto_980228 ?auto_980229 ) ) ( not ( = ?auto_980226 ?auto_980228 ) ) ( not ( = ?auto_980226 ?auto_980229 ) ) ( not ( = ?auto_980232 ?auto_980235 ) ) ( HOIST-AT ?auto_980233 ?auto_980232 ) ( not ( = ?auto_980234 ?auto_980233 ) ) ( SURFACE-AT ?auto_980229 ?auto_980232 ) ( ON ?auto_980229 ?auto_980231 ) ( CLEAR ?auto_980229 ) ( not ( = ?auto_980228 ?auto_980231 ) ) ( not ( = ?auto_980229 ?auto_980231 ) ) ( not ( = ?auto_980226 ?auto_980231 ) ) ( SURFACE-AT ?auto_980226 ?auto_980235 ) ( CLEAR ?auto_980226 ) ( IS-CRATE ?auto_980228 ) ( AVAILABLE ?auto_980234 ) ( TRUCK-AT ?auto_980230 ?auto_980232 ) ( LIFTING ?auto_980233 ?auto_980228 ) ( ON ?auto_980224 ?auto_980223 ) ( ON ?auto_980225 ?auto_980224 ) ( ON ?auto_980227 ?auto_980225 ) ( ON ?auto_980226 ?auto_980227 ) ( not ( = ?auto_980223 ?auto_980224 ) ) ( not ( = ?auto_980223 ?auto_980225 ) ) ( not ( = ?auto_980223 ?auto_980227 ) ) ( not ( = ?auto_980223 ?auto_980226 ) ) ( not ( = ?auto_980223 ?auto_980228 ) ) ( not ( = ?auto_980223 ?auto_980229 ) ) ( not ( = ?auto_980223 ?auto_980231 ) ) ( not ( = ?auto_980224 ?auto_980225 ) ) ( not ( = ?auto_980224 ?auto_980227 ) ) ( not ( = ?auto_980224 ?auto_980226 ) ) ( not ( = ?auto_980224 ?auto_980228 ) ) ( not ( = ?auto_980224 ?auto_980229 ) ) ( not ( = ?auto_980224 ?auto_980231 ) ) ( not ( = ?auto_980225 ?auto_980227 ) ) ( not ( = ?auto_980225 ?auto_980226 ) ) ( not ( = ?auto_980225 ?auto_980228 ) ) ( not ( = ?auto_980225 ?auto_980229 ) ) ( not ( = ?auto_980225 ?auto_980231 ) ) ( not ( = ?auto_980227 ?auto_980226 ) ) ( not ( = ?auto_980227 ?auto_980228 ) ) ( not ( = ?auto_980227 ?auto_980229 ) ) ( not ( = ?auto_980227 ?auto_980231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980226 ?auto_980228 ?auto_980229 )
      ( MAKE-6CRATE-VERIFY ?auto_980223 ?auto_980224 ?auto_980225 ?auto_980227 ?auto_980226 ?auto_980228 ?auto_980229 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_980256 - SURFACE
      ?auto_980257 - SURFACE
      ?auto_980258 - SURFACE
      ?auto_980259 - SURFACE
    )
    :vars
    (
      ?auto_980261 - HOIST
      ?auto_980264 - PLACE
      ?auto_980266 - PLACE
      ?auto_980260 - HOIST
      ?auto_980263 - SURFACE
      ?auto_980262 - TRUCK
      ?auto_980265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980261 ?auto_980264 ) ( IS-CRATE ?auto_980259 ) ( not ( = ?auto_980258 ?auto_980259 ) ) ( not ( = ?auto_980257 ?auto_980258 ) ) ( not ( = ?auto_980257 ?auto_980259 ) ) ( not ( = ?auto_980266 ?auto_980264 ) ) ( HOIST-AT ?auto_980260 ?auto_980266 ) ( not ( = ?auto_980261 ?auto_980260 ) ) ( SURFACE-AT ?auto_980259 ?auto_980266 ) ( ON ?auto_980259 ?auto_980263 ) ( CLEAR ?auto_980259 ) ( not ( = ?auto_980258 ?auto_980263 ) ) ( not ( = ?auto_980259 ?auto_980263 ) ) ( not ( = ?auto_980257 ?auto_980263 ) ) ( SURFACE-AT ?auto_980257 ?auto_980264 ) ( CLEAR ?auto_980257 ) ( IS-CRATE ?auto_980258 ) ( AVAILABLE ?auto_980261 ) ( TRUCK-AT ?auto_980262 ?auto_980266 ) ( AVAILABLE ?auto_980260 ) ( SURFACE-AT ?auto_980258 ?auto_980266 ) ( ON ?auto_980258 ?auto_980265 ) ( CLEAR ?auto_980258 ) ( not ( = ?auto_980258 ?auto_980265 ) ) ( not ( = ?auto_980259 ?auto_980265 ) ) ( not ( = ?auto_980257 ?auto_980265 ) ) ( not ( = ?auto_980263 ?auto_980265 ) ) ( ON ?auto_980257 ?auto_980256 ) ( not ( = ?auto_980256 ?auto_980257 ) ) ( not ( = ?auto_980256 ?auto_980258 ) ) ( not ( = ?auto_980256 ?auto_980259 ) ) ( not ( = ?auto_980256 ?auto_980263 ) ) ( not ( = ?auto_980256 ?auto_980265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980257 ?auto_980258 ?auto_980259 )
      ( MAKE-3CRATE-VERIFY ?auto_980256 ?auto_980257 ?auto_980258 ?auto_980259 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_980267 - SURFACE
      ?auto_980268 - SURFACE
      ?auto_980269 - SURFACE
      ?auto_980271 - SURFACE
      ?auto_980270 - SURFACE
    )
    :vars
    (
      ?auto_980273 - HOIST
      ?auto_980276 - PLACE
      ?auto_980278 - PLACE
      ?auto_980272 - HOIST
      ?auto_980275 - SURFACE
      ?auto_980274 - TRUCK
      ?auto_980277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980273 ?auto_980276 ) ( IS-CRATE ?auto_980270 ) ( not ( = ?auto_980271 ?auto_980270 ) ) ( not ( = ?auto_980269 ?auto_980271 ) ) ( not ( = ?auto_980269 ?auto_980270 ) ) ( not ( = ?auto_980278 ?auto_980276 ) ) ( HOIST-AT ?auto_980272 ?auto_980278 ) ( not ( = ?auto_980273 ?auto_980272 ) ) ( SURFACE-AT ?auto_980270 ?auto_980278 ) ( ON ?auto_980270 ?auto_980275 ) ( CLEAR ?auto_980270 ) ( not ( = ?auto_980271 ?auto_980275 ) ) ( not ( = ?auto_980270 ?auto_980275 ) ) ( not ( = ?auto_980269 ?auto_980275 ) ) ( SURFACE-AT ?auto_980269 ?auto_980276 ) ( CLEAR ?auto_980269 ) ( IS-CRATE ?auto_980271 ) ( AVAILABLE ?auto_980273 ) ( TRUCK-AT ?auto_980274 ?auto_980278 ) ( AVAILABLE ?auto_980272 ) ( SURFACE-AT ?auto_980271 ?auto_980278 ) ( ON ?auto_980271 ?auto_980277 ) ( CLEAR ?auto_980271 ) ( not ( = ?auto_980271 ?auto_980277 ) ) ( not ( = ?auto_980270 ?auto_980277 ) ) ( not ( = ?auto_980269 ?auto_980277 ) ) ( not ( = ?auto_980275 ?auto_980277 ) ) ( ON ?auto_980268 ?auto_980267 ) ( ON ?auto_980269 ?auto_980268 ) ( not ( = ?auto_980267 ?auto_980268 ) ) ( not ( = ?auto_980267 ?auto_980269 ) ) ( not ( = ?auto_980267 ?auto_980271 ) ) ( not ( = ?auto_980267 ?auto_980270 ) ) ( not ( = ?auto_980267 ?auto_980275 ) ) ( not ( = ?auto_980267 ?auto_980277 ) ) ( not ( = ?auto_980268 ?auto_980269 ) ) ( not ( = ?auto_980268 ?auto_980271 ) ) ( not ( = ?auto_980268 ?auto_980270 ) ) ( not ( = ?auto_980268 ?auto_980275 ) ) ( not ( = ?auto_980268 ?auto_980277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980269 ?auto_980271 ?auto_980270 )
      ( MAKE-4CRATE-VERIFY ?auto_980267 ?auto_980268 ?auto_980269 ?auto_980271 ?auto_980270 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_980279 - SURFACE
      ?auto_980280 - SURFACE
      ?auto_980281 - SURFACE
      ?auto_980283 - SURFACE
      ?auto_980282 - SURFACE
      ?auto_980284 - SURFACE
    )
    :vars
    (
      ?auto_980286 - HOIST
      ?auto_980289 - PLACE
      ?auto_980291 - PLACE
      ?auto_980285 - HOIST
      ?auto_980288 - SURFACE
      ?auto_980287 - TRUCK
      ?auto_980290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980286 ?auto_980289 ) ( IS-CRATE ?auto_980284 ) ( not ( = ?auto_980282 ?auto_980284 ) ) ( not ( = ?auto_980283 ?auto_980282 ) ) ( not ( = ?auto_980283 ?auto_980284 ) ) ( not ( = ?auto_980291 ?auto_980289 ) ) ( HOIST-AT ?auto_980285 ?auto_980291 ) ( not ( = ?auto_980286 ?auto_980285 ) ) ( SURFACE-AT ?auto_980284 ?auto_980291 ) ( ON ?auto_980284 ?auto_980288 ) ( CLEAR ?auto_980284 ) ( not ( = ?auto_980282 ?auto_980288 ) ) ( not ( = ?auto_980284 ?auto_980288 ) ) ( not ( = ?auto_980283 ?auto_980288 ) ) ( SURFACE-AT ?auto_980283 ?auto_980289 ) ( CLEAR ?auto_980283 ) ( IS-CRATE ?auto_980282 ) ( AVAILABLE ?auto_980286 ) ( TRUCK-AT ?auto_980287 ?auto_980291 ) ( AVAILABLE ?auto_980285 ) ( SURFACE-AT ?auto_980282 ?auto_980291 ) ( ON ?auto_980282 ?auto_980290 ) ( CLEAR ?auto_980282 ) ( not ( = ?auto_980282 ?auto_980290 ) ) ( not ( = ?auto_980284 ?auto_980290 ) ) ( not ( = ?auto_980283 ?auto_980290 ) ) ( not ( = ?auto_980288 ?auto_980290 ) ) ( ON ?auto_980280 ?auto_980279 ) ( ON ?auto_980281 ?auto_980280 ) ( ON ?auto_980283 ?auto_980281 ) ( not ( = ?auto_980279 ?auto_980280 ) ) ( not ( = ?auto_980279 ?auto_980281 ) ) ( not ( = ?auto_980279 ?auto_980283 ) ) ( not ( = ?auto_980279 ?auto_980282 ) ) ( not ( = ?auto_980279 ?auto_980284 ) ) ( not ( = ?auto_980279 ?auto_980288 ) ) ( not ( = ?auto_980279 ?auto_980290 ) ) ( not ( = ?auto_980280 ?auto_980281 ) ) ( not ( = ?auto_980280 ?auto_980283 ) ) ( not ( = ?auto_980280 ?auto_980282 ) ) ( not ( = ?auto_980280 ?auto_980284 ) ) ( not ( = ?auto_980280 ?auto_980288 ) ) ( not ( = ?auto_980280 ?auto_980290 ) ) ( not ( = ?auto_980281 ?auto_980283 ) ) ( not ( = ?auto_980281 ?auto_980282 ) ) ( not ( = ?auto_980281 ?auto_980284 ) ) ( not ( = ?auto_980281 ?auto_980288 ) ) ( not ( = ?auto_980281 ?auto_980290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980283 ?auto_980282 ?auto_980284 )
      ( MAKE-5CRATE-VERIFY ?auto_980279 ?auto_980280 ?auto_980281 ?auto_980283 ?auto_980282 ?auto_980284 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980292 - SURFACE
      ?auto_980293 - SURFACE
      ?auto_980294 - SURFACE
      ?auto_980296 - SURFACE
      ?auto_980295 - SURFACE
      ?auto_980297 - SURFACE
      ?auto_980298 - SURFACE
    )
    :vars
    (
      ?auto_980300 - HOIST
      ?auto_980303 - PLACE
      ?auto_980305 - PLACE
      ?auto_980299 - HOIST
      ?auto_980302 - SURFACE
      ?auto_980301 - TRUCK
      ?auto_980304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980300 ?auto_980303 ) ( IS-CRATE ?auto_980298 ) ( not ( = ?auto_980297 ?auto_980298 ) ) ( not ( = ?auto_980295 ?auto_980297 ) ) ( not ( = ?auto_980295 ?auto_980298 ) ) ( not ( = ?auto_980305 ?auto_980303 ) ) ( HOIST-AT ?auto_980299 ?auto_980305 ) ( not ( = ?auto_980300 ?auto_980299 ) ) ( SURFACE-AT ?auto_980298 ?auto_980305 ) ( ON ?auto_980298 ?auto_980302 ) ( CLEAR ?auto_980298 ) ( not ( = ?auto_980297 ?auto_980302 ) ) ( not ( = ?auto_980298 ?auto_980302 ) ) ( not ( = ?auto_980295 ?auto_980302 ) ) ( SURFACE-AT ?auto_980295 ?auto_980303 ) ( CLEAR ?auto_980295 ) ( IS-CRATE ?auto_980297 ) ( AVAILABLE ?auto_980300 ) ( TRUCK-AT ?auto_980301 ?auto_980305 ) ( AVAILABLE ?auto_980299 ) ( SURFACE-AT ?auto_980297 ?auto_980305 ) ( ON ?auto_980297 ?auto_980304 ) ( CLEAR ?auto_980297 ) ( not ( = ?auto_980297 ?auto_980304 ) ) ( not ( = ?auto_980298 ?auto_980304 ) ) ( not ( = ?auto_980295 ?auto_980304 ) ) ( not ( = ?auto_980302 ?auto_980304 ) ) ( ON ?auto_980293 ?auto_980292 ) ( ON ?auto_980294 ?auto_980293 ) ( ON ?auto_980296 ?auto_980294 ) ( ON ?auto_980295 ?auto_980296 ) ( not ( = ?auto_980292 ?auto_980293 ) ) ( not ( = ?auto_980292 ?auto_980294 ) ) ( not ( = ?auto_980292 ?auto_980296 ) ) ( not ( = ?auto_980292 ?auto_980295 ) ) ( not ( = ?auto_980292 ?auto_980297 ) ) ( not ( = ?auto_980292 ?auto_980298 ) ) ( not ( = ?auto_980292 ?auto_980302 ) ) ( not ( = ?auto_980292 ?auto_980304 ) ) ( not ( = ?auto_980293 ?auto_980294 ) ) ( not ( = ?auto_980293 ?auto_980296 ) ) ( not ( = ?auto_980293 ?auto_980295 ) ) ( not ( = ?auto_980293 ?auto_980297 ) ) ( not ( = ?auto_980293 ?auto_980298 ) ) ( not ( = ?auto_980293 ?auto_980302 ) ) ( not ( = ?auto_980293 ?auto_980304 ) ) ( not ( = ?auto_980294 ?auto_980296 ) ) ( not ( = ?auto_980294 ?auto_980295 ) ) ( not ( = ?auto_980294 ?auto_980297 ) ) ( not ( = ?auto_980294 ?auto_980298 ) ) ( not ( = ?auto_980294 ?auto_980302 ) ) ( not ( = ?auto_980294 ?auto_980304 ) ) ( not ( = ?auto_980296 ?auto_980295 ) ) ( not ( = ?auto_980296 ?auto_980297 ) ) ( not ( = ?auto_980296 ?auto_980298 ) ) ( not ( = ?auto_980296 ?auto_980302 ) ) ( not ( = ?auto_980296 ?auto_980304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980295 ?auto_980297 ?auto_980298 )
      ( MAKE-6CRATE-VERIFY ?auto_980292 ?auto_980293 ?auto_980294 ?auto_980296 ?auto_980295 ?auto_980297 ?auto_980298 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_980326 - SURFACE
      ?auto_980327 - SURFACE
      ?auto_980328 - SURFACE
      ?auto_980329 - SURFACE
    )
    :vars
    (
      ?auto_980333 - HOIST
      ?auto_980336 - PLACE
      ?auto_980330 - PLACE
      ?auto_980334 - HOIST
      ?auto_980335 - SURFACE
      ?auto_980332 - SURFACE
      ?auto_980331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980333 ?auto_980336 ) ( IS-CRATE ?auto_980329 ) ( not ( = ?auto_980328 ?auto_980329 ) ) ( not ( = ?auto_980327 ?auto_980328 ) ) ( not ( = ?auto_980327 ?auto_980329 ) ) ( not ( = ?auto_980330 ?auto_980336 ) ) ( HOIST-AT ?auto_980334 ?auto_980330 ) ( not ( = ?auto_980333 ?auto_980334 ) ) ( SURFACE-AT ?auto_980329 ?auto_980330 ) ( ON ?auto_980329 ?auto_980335 ) ( CLEAR ?auto_980329 ) ( not ( = ?auto_980328 ?auto_980335 ) ) ( not ( = ?auto_980329 ?auto_980335 ) ) ( not ( = ?auto_980327 ?auto_980335 ) ) ( SURFACE-AT ?auto_980327 ?auto_980336 ) ( CLEAR ?auto_980327 ) ( IS-CRATE ?auto_980328 ) ( AVAILABLE ?auto_980333 ) ( AVAILABLE ?auto_980334 ) ( SURFACE-AT ?auto_980328 ?auto_980330 ) ( ON ?auto_980328 ?auto_980332 ) ( CLEAR ?auto_980328 ) ( not ( = ?auto_980328 ?auto_980332 ) ) ( not ( = ?auto_980329 ?auto_980332 ) ) ( not ( = ?auto_980327 ?auto_980332 ) ) ( not ( = ?auto_980335 ?auto_980332 ) ) ( TRUCK-AT ?auto_980331 ?auto_980336 ) ( ON ?auto_980327 ?auto_980326 ) ( not ( = ?auto_980326 ?auto_980327 ) ) ( not ( = ?auto_980326 ?auto_980328 ) ) ( not ( = ?auto_980326 ?auto_980329 ) ) ( not ( = ?auto_980326 ?auto_980335 ) ) ( not ( = ?auto_980326 ?auto_980332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980327 ?auto_980328 ?auto_980329 )
      ( MAKE-3CRATE-VERIFY ?auto_980326 ?auto_980327 ?auto_980328 ?auto_980329 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_980337 - SURFACE
      ?auto_980338 - SURFACE
      ?auto_980339 - SURFACE
      ?auto_980341 - SURFACE
      ?auto_980340 - SURFACE
    )
    :vars
    (
      ?auto_980345 - HOIST
      ?auto_980348 - PLACE
      ?auto_980342 - PLACE
      ?auto_980346 - HOIST
      ?auto_980347 - SURFACE
      ?auto_980344 - SURFACE
      ?auto_980343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980345 ?auto_980348 ) ( IS-CRATE ?auto_980340 ) ( not ( = ?auto_980341 ?auto_980340 ) ) ( not ( = ?auto_980339 ?auto_980341 ) ) ( not ( = ?auto_980339 ?auto_980340 ) ) ( not ( = ?auto_980342 ?auto_980348 ) ) ( HOIST-AT ?auto_980346 ?auto_980342 ) ( not ( = ?auto_980345 ?auto_980346 ) ) ( SURFACE-AT ?auto_980340 ?auto_980342 ) ( ON ?auto_980340 ?auto_980347 ) ( CLEAR ?auto_980340 ) ( not ( = ?auto_980341 ?auto_980347 ) ) ( not ( = ?auto_980340 ?auto_980347 ) ) ( not ( = ?auto_980339 ?auto_980347 ) ) ( SURFACE-AT ?auto_980339 ?auto_980348 ) ( CLEAR ?auto_980339 ) ( IS-CRATE ?auto_980341 ) ( AVAILABLE ?auto_980345 ) ( AVAILABLE ?auto_980346 ) ( SURFACE-AT ?auto_980341 ?auto_980342 ) ( ON ?auto_980341 ?auto_980344 ) ( CLEAR ?auto_980341 ) ( not ( = ?auto_980341 ?auto_980344 ) ) ( not ( = ?auto_980340 ?auto_980344 ) ) ( not ( = ?auto_980339 ?auto_980344 ) ) ( not ( = ?auto_980347 ?auto_980344 ) ) ( TRUCK-AT ?auto_980343 ?auto_980348 ) ( ON ?auto_980338 ?auto_980337 ) ( ON ?auto_980339 ?auto_980338 ) ( not ( = ?auto_980337 ?auto_980338 ) ) ( not ( = ?auto_980337 ?auto_980339 ) ) ( not ( = ?auto_980337 ?auto_980341 ) ) ( not ( = ?auto_980337 ?auto_980340 ) ) ( not ( = ?auto_980337 ?auto_980347 ) ) ( not ( = ?auto_980337 ?auto_980344 ) ) ( not ( = ?auto_980338 ?auto_980339 ) ) ( not ( = ?auto_980338 ?auto_980341 ) ) ( not ( = ?auto_980338 ?auto_980340 ) ) ( not ( = ?auto_980338 ?auto_980347 ) ) ( not ( = ?auto_980338 ?auto_980344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980339 ?auto_980341 ?auto_980340 )
      ( MAKE-4CRATE-VERIFY ?auto_980337 ?auto_980338 ?auto_980339 ?auto_980341 ?auto_980340 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_980349 - SURFACE
      ?auto_980350 - SURFACE
      ?auto_980351 - SURFACE
      ?auto_980353 - SURFACE
      ?auto_980352 - SURFACE
      ?auto_980354 - SURFACE
    )
    :vars
    (
      ?auto_980358 - HOIST
      ?auto_980361 - PLACE
      ?auto_980355 - PLACE
      ?auto_980359 - HOIST
      ?auto_980360 - SURFACE
      ?auto_980357 - SURFACE
      ?auto_980356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980358 ?auto_980361 ) ( IS-CRATE ?auto_980354 ) ( not ( = ?auto_980352 ?auto_980354 ) ) ( not ( = ?auto_980353 ?auto_980352 ) ) ( not ( = ?auto_980353 ?auto_980354 ) ) ( not ( = ?auto_980355 ?auto_980361 ) ) ( HOIST-AT ?auto_980359 ?auto_980355 ) ( not ( = ?auto_980358 ?auto_980359 ) ) ( SURFACE-AT ?auto_980354 ?auto_980355 ) ( ON ?auto_980354 ?auto_980360 ) ( CLEAR ?auto_980354 ) ( not ( = ?auto_980352 ?auto_980360 ) ) ( not ( = ?auto_980354 ?auto_980360 ) ) ( not ( = ?auto_980353 ?auto_980360 ) ) ( SURFACE-AT ?auto_980353 ?auto_980361 ) ( CLEAR ?auto_980353 ) ( IS-CRATE ?auto_980352 ) ( AVAILABLE ?auto_980358 ) ( AVAILABLE ?auto_980359 ) ( SURFACE-AT ?auto_980352 ?auto_980355 ) ( ON ?auto_980352 ?auto_980357 ) ( CLEAR ?auto_980352 ) ( not ( = ?auto_980352 ?auto_980357 ) ) ( not ( = ?auto_980354 ?auto_980357 ) ) ( not ( = ?auto_980353 ?auto_980357 ) ) ( not ( = ?auto_980360 ?auto_980357 ) ) ( TRUCK-AT ?auto_980356 ?auto_980361 ) ( ON ?auto_980350 ?auto_980349 ) ( ON ?auto_980351 ?auto_980350 ) ( ON ?auto_980353 ?auto_980351 ) ( not ( = ?auto_980349 ?auto_980350 ) ) ( not ( = ?auto_980349 ?auto_980351 ) ) ( not ( = ?auto_980349 ?auto_980353 ) ) ( not ( = ?auto_980349 ?auto_980352 ) ) ( not ( = ?auto_980349 ?auto_980354 ) ) ( not ( = ?auto_980349 ?auto_980360 ) ) ( not ( = ?auto_980349 ?auto_980357 ) ) ( not ( = ?auto_980350 ?auto_980351 ) ) ( not ( = ?auto_980350 ?auto_980353 ) ) ( not ( = ?auto_980350 ?auto_980352 ) ) ( not ( = ?auto_980350 ?auto_980354 ) ) ( not ( = ?auto_980350 ?auto_980360 ) ) ( not ( = ?auto_980350 ?auto_980357 ) ) ( not ( = ?auto_980351 ?auto_980353 ) ) ( not ( = ?auto_980351 ?auto_980352 ) ) ( not ( = ?auto_980351 ?auto_980354 ) ) ( not ( = ?auto_980351 ?auto_980360 ) ) ( not ( = ?auto_980351 ?auto_980357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980353 ?auto_980352 ?auto_980354 )
      ( MAKE-5CRATE-VERIFY ?auto_980349 ?auto_980350 ?auto_980351 ?auto_980353 ?auto_980352 ?auto_980354 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980362 - SURFACE
      ?auto_980363 - SURFACE
      ?auto_980364 - SURFACE
      ?auto_980366 - SURFACE
      ?auto_980365 - SURFACE
      ?auto_980367 - SURFACE
      ?auto_980368 - SURFACE
    )
    :vars
    (
      ?auto_980372 - HOIST
      ?auto_980375 - PLACE
      ?auto_980369 - PLACE
      ?auto_980373 - HOIST
      ?auto_980374 - SURFACE
      ?auto_980371 - SURFACE
      ?auto_980370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980372 ?auto_980375 ) ( IS-CRATE ?auto_980368 ) ( not ( = ?auto_980367 ?auto_980368 ) ) ( not ( = ?auto_980365 ?auto_980367 ) ) ( not ( = ?auto_980365 ?auto_980368 ) ) ( not ( = ?auto_980369 ?auto_980375 ) ) ( HOIST-AT ?auto_980373 ?auto_980369 ) ( not ( = ?auto_980372 ?auto_980373 ) ) ( SURFACE-AT ?auto_980368 ?auto_980369 ) ( ON ?auto_980368 ?auto_980374 ) ( CLEAR ?auto_980368 ) ( not ( = ?auto_980367 ?auto_980374 ) ) ( not ( = ?auto_980368 ?auto_980374 ) ) ( not ( = ?auto_980365 ?auto_980374 ) ) ( SURFACE-AT ?auto_980365 ?auto_980375 ) ( CLEAR ?auto_980365 ) ( IS-CRATE ?auto_980367 ) ( AVAILABLE ?auto_980372 ) ( AVAILABLE ?auto_980373 ) ( SURFACE-AT ?auto_980367 ?auto_980369 ) ( ON ?auto_980367 ?auto_980371 ) ( CLEAR ?auto_980367 ) ( not ( = ?auto_980367 ?auto_980371 ) ) ( not ( = ?auto_980368 ?auto_980371 ) ) ( not ( = ?auto_980365 ?auto_980371 ) ) ( not ( = ?auto_980374 ?auto_980371 ) ) ( TRUCK-AT ?auto_980370 ?auto_980375 ) ( ON ?auto_980363 ?auto_980362 ) ( ON ?auto_980364 ?auto_980363 ) ( ON ?auto_980366 ?auto_980364 ) ( ON ?auto_980365 ?auto_980366 ) ( not ( = ?auto_980362 ?auto_980363 ) ) ( not ( = ?auto_980362 ?auto_980364 ) ) ( not ( = ?auto_980362 ?auto_980366 ) ) ( not ( = ?auto_980362 ?auto_980365 ) ) ( not ( = ?auto_980362 ?auto_980367 ) ) ( not ( = ?auto_980362 ?auto_980368 ) ) ( not ( = ?auto_980362 ?auto_980374 ) ) ( not ( = ?auto_980362 ?auto_980371 ) ) ( not ( = ?auto_980363 ?auto_980364 ) ) ( not ( = ?auto_980363 ?auto_980366 ) ) ( not ( = ?auto_980363 ?auto_980365 ) ) ( not ( = ?auto_980363 ?auto_980367 ) ) ( not ( = ?auto_980363 ?auto_980368 ) ) ( not ( = ?auto_980363 ?auto_980374 ) ) ( not ( = ?auto_980363 ?auto_980371 ) ) ( not ( = ?auto_980364 ?auto_980366 ) ) ( not ( = ?auto_980364 ?auto_980365 ) ) ( not ( = ?auto_980364 ?auto_980367 ) ) ( not ( = ?auto_980364 ?auto_980368 ) ) ( not ( = ?auto_980364 ?auto_980374 ) ) ( not ( = ?auto_980364 ?auto_980371 ) ) ( not ( = ?auto_980366 ?auto_980365 ) ) ( not ( = ?auto_980366 ?auto_980367 ) ) ( not ( = ?auto_980366 ?auto_980368 ) ) ( not ( = ?auto_980366 ?auto_980374 ) ) ( not ( = ?auto_980366 ?auto_980371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980365 ?auto_980367 ?auto_980368 )
      ( MAKE-6CRATE-VERIFY ?auto_980362 ?auto_980363 ?auto_980364 ?auto_980366 ?auto_980365 ?auto_980367 ?auto_980368 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_980376 - SURFACE
      ?auto_980377 - SURFACE
    )
    :vars
    (
      ?auto_980382 - HOIST
      ?auto_980385 - PLACE
      ?auto_980379 - SURFACE
      ?auto_980378 - PLACE
      ?auto_980383 - HOIST
      ?auto_980384 - SURFACE
      ?auto_980381 - SURFACE
      ?auto_980380 - TRUCK
      ?auto_980386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980382 ?auto_980385 ) ( IS-CRATE ?auto_980377 ) ( not ( = ?auto_980376 ?auto_980377 ) ) ( not ( = ?auto_980379 ?auto_980376 ) ) ( not ( = ?auto_980379 ?auto_980377 ) ) ( not ( = ?auto_980378 ?auto_980385 ) ) ( HOIST-AT ?auto_980383 ?auto_980378 ) ( not ( = ?auto_980382 ?auto_980383 ) ) ( SURFACE-AT ?auto_980377 ?auto_980378 ) ( ON ?auto_980377 ?auto_980384 ) ( CLEAR ?auto_980377 ) ( not ( = ?auto_980376 ?auto_980384 ) ) ( not ( = ?auto_980377 ?auto_980384 ) ) ( not ( = ?auto_980379 ?auto_980384 ) ) ( IS-CRATE ?auto_980376 ) ( AVAILABLE ?auto_980383 ) ( SURFACE-AT ?auto_980376 ?auto_980378 ) ( ON ?auto_980376 ?auto_980381 ) ( CLEAR ?auto_980376 ) ( not ( = ?auto_980376 ?auto_980381 ) ) ( not ( = ?auto_980377 ?auto_980381 ) ) ( not ( = ?auto_980379 ?auto_980381 ) ) ( not ( = ?auto_980384 ?auto_980381 ) ) ( TRUCK-AT ?auto_980380 ?auto_980385 ) ( SURFACE-AT ?auto_980386 ?auto_980385 ) ( CLEAR ?auto_980386 ) ( LIFTING ?auto_980382 ?auto_980379 ) ( IS-CRATE ?auto_980379 ) ( not ( = ?auto_980386 ?auto_980379 ) ) ( not ( = ?auto_980376 ?auto_980386 ) ) ( not ( = ?auto_980377 ?auto_980386 ) ) ( not ( = ?auto_980384 ?auto_980386 ) ) ( not ( = ?auto_980381 ?auto_980386 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_980386 ?auto_980379 )
      ( MAKE-2CRATE ?auto_980379 ?auto_980376 ?auto_980377 )
      ( MAKE-1CRATE-VERIFY ?auto_980376 ?auto_980377 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_980387 - SURFACE
      ?auto_980388 - SURFACE
      ?auto_980389 - SURFACE
    )
    :vars
    (
      ?auto_980392 - HOIST
      ?auto_980395 - PLACE
      ?auto_980391 - PLACE
      ?auto_980396 - HOIST
      ?auto_980394 - SURFACE
      ?auto_980390 - SURFACE
      ?auto_980393 - TRUCK
      ?auto_980397 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_980392 ?auto_980395 ) ( IS-CRATE ?auto_980389 ) ( not ( = ?auto_980388 ?auto_980389 ) ) ( not ( = ?auto_980387 ?auto_980388 ) ) ( not ( = ?auto_980387 ?auto_980389 ) ) ( not ( = ?auto_980391 ?auto_980395 ) ) ( HOIST-AT ?auto_980396 ?auto_980391 ) ( not ( = ?auto_980392 ?auto_980396 ) ) ( SURFACE-AT ?auto_980389 ?auto_980391 ) ( ON ?auto_980389 ?auto_980394 ) ( CLEAR ?auto_980389 ) ( not ( = ?auto_980388 ?auto_980394 ) ) ( not ( = ?auto_980389 ?auto_980394 ) ) ( not ( = ?auto_980387 ?auto_980394 ) ) ( IS-CRATE ?auto_980388 ) ( AVAILABLE ?auto_980396 ) ( SURFACE-AT ?auto_980388 ?auto_980391 ) ( ON ?auto_980388 ?auto_980390 ) ( CLEAR ?auto_980388 ) ( not ( = ?auto_980388 ?auto_980390 ) ) ( not ( = ?auto_980389 ?auto_980390 ) ) ( not ( = ?auto_980387 ?auto_980390 ) ) ( not ( = ?auto_980394 ?auto_980390 ) ) ( TRUCK-AT ?auto_980393 ?auto_980395 ) ( SURFACE-AT ?auto_980397 ?auto_980395 ) ( CLEAR ?auto_980397 ) ( LIFTING ?auto_980392 ?auto_980387 ) ( IS-CRATE ?auto_980387 ) ( not ( = ?auto_980397 ?auto_980387 ) ) ( not ( = ?auto_980388 ?auto_980397 ) ) ( not ( = ?auto_980389 ?auto_980397 ) ) ( not ( = ?auto_980394 ?auto_980397 ) ) ( not ( = ?auto_980390 ?auto_980397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_980388 ?auto_980389 )
      ( MAKE-2CRATE-VERIFY ?auto_980387 ?auto_980388 ?auto_980389 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_980398 - SURFACE
      ?auto_980399 - SURFACE
      ?auto_980400 - SURFACE
      ?auto_980401 - SURFACE
    )
    :vars
    (
      ?auto_980402 - HOIST
      ?auto_980408 - PLACE
      ?auto_980407 - PLACE
      ?auto_980405 - HOIST
      ?auto_980403 - SURFACE
      ?auto_980404 - SURFACE
      ?auto_980406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980402 ?auto_980408 ) ( IS-CRATE ?auto_980401 ) ( not ( = ?auto_980400 ?auto_980401 ) ) ( not ( = ?auto_980399 ?auto_980400 ) ) ( not ( = ?auto_980399 ?auto_980401 ) ) ( not ( = ?auto_980407 ?auto_980408 ) ) ( HOIST-AT ?auto_980405 ?auto_980407 ) ( not ( = ?auto_980402 ?auto_980405 ) ) ( SURFACE-AT ?auto_980401 ?auto_980407 ) ( ON ?auto_980401 ?auto_980403 ) ( CLEAR ?auto_980401 ) ( not ( = ?auto_980400 ?auto_980403 ) ) ( not ( = ?auto_980401 ?auto_980403 ) ) ( not ( = ?auto_980399 ?auto_980403 ) ) ( IS-CRATE ?auto_980400 ) ( AVAILABLE ?auto_980405 ) ( SURFACE-AT ?auto_980400 ?auto_980407 ) ( ON ?auto_980400 ?auto_980404 ) ( CLEAR ?auto_980400 ) ( not ( = ?auto_980400 ?auto_980404 ) ) ( not ( = ?auto_980401 ?auto_980404 ) ) ( not ( = ?auto_980399 ?auto_980404 ) ) ( not ( = ?auto_980403 ?auto_980404 ) ) ( TRUCK-AT ?auto_980406 ?auto_980408 ) ( SURFACE-AT ?auto_980398 ?auto_980408 ) ( CLEAR ?auto_980398 ) ( LIFTING ?auto_980402 ?auto_980399 ) ( IS-CRATE ?auto_980399 ) ( not ( = ?auto_980398 ?auto_980399 ) ) ( not ( = ?auto_980400 ?auto_980398 ) ) ( not ( = ?auto_980401 ?auto_980398 ) ) ( not ( = ?auto_980403 ?auto_980398 ) ) ( not ( = ?auto_980404 ?auto_980398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980399 ?auto_980400 ?auto_980401 )
      ( MAKE-3CRATE-VERIFY ?auto_980398 ?auto_980399 ?auto_980400 ?auto_980401 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_980409 - SURFACE
      ?auto_980410 - SURFACE
      ?auto_980411 - SURFACE
      ?auto_980413 - SURFACE
      ?auto_980412 - SURFACE
    )
    :vars
    (
      ?auto_980414 - HOIST
      ?auto_980420 - PLACE
      ?auto_980419 - PLACE
      ?auto_980417 - HOIST
      ?auto_980415 - SURFACE
      ?auto_980416 - SURFACE
      ?auto_980418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980414 ?auto_980420 ) ( IS-CRATE ?auto_980412 ) ( not ( = ?auto_980413 ?auto_980412 ) ) ( not ( = ?auto_980411 ?auto_980413 ) ) ( not ( = ?auto_980411 ?auto_980412 ) ) ( not ( = ?auto_980419 ?auto_980420 ) ) ( HOIST-AT ?auto_980417 ?auto_980419 ) ( not ( = ?auto_980414 ?auto_980417 ) ) ( SURFACE-AT ?auto_980412 ?auto_980419 ) ( ON ?auto_980412 ?auto_980415 ) ( CLEAR ?auto_980412 ) ( not ( = ?auto_980413 ?auto_980415 ) ) ( not ( = ?auto_980412 ?auto_980415 ) ) ( not ( = ?auto_980411 ?auto_980415 ) ) ( IS-CRATE ?auto_980413 ) ( AVAILABLE ?auto_980417 ) ( SURFACE-AT ?auto_980413 ?auto_980419 ) ( ON ?auto_980413 ?auto_980416 ) ( CLEAR ?auto_980413 ) ( not ( = ?auto_980413 ?auto_980416 ) ) ( not ( = ?auto_980412 ?auto_980416 ) ) ( not ( = ?auto_980411 ?auto_980416 ) ) ( not ( = ?auto_980415 ?auto_980416 ) ) ( TRUCK-AT ?auto_980418 ?auto_980420 ) ( SURFACE-AT ?auto_980410 ?auto_980420 ) ( CLEAR ?auto_980410 ) ( LIFTING ?auto_980414 ?auto_980411 ) ( IS-CRATE ?auto_980411 ) ( not ( = ?auto_980410 ?auto_980411 ) ) ( not ( = ?auto_980413 ?auto_980410 ) ) ( not ( = ?auto_980412 ?auto_980410 ) ) ( not ( = ?auto_980415 ?auto_980410 ) ) ( not ( = ?auto_980416 ?auto_980410 ) ) ( ON ?auto_980410 ?auto_980409 ) ( not ( = ?auto_980409 ?auto_980410 ) ) ( not ( = ?auto_980409 ?auto_980411 ) ) ( not ( = ?auto_980409 ?auto_980413 ) ) ( not ( = ?auto_980409 ?auto_980412 ) ) ( not ( = ?auto_980409 ?auto_980415 ) ) ( not ( = ?auto_980409 ?auto_980416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980411 ?auto_980413 ?auto_980412 )
      ( MAKE-4CRATE-VERIFY ?auto_980409 ?auto_980410 ?auto_980411 ?auto_980413 ?auto_980412 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_980421 - SURFACE
      ?auto_980422 - SURFACE
      ?auto_980423 - SURFACE
      ?auto_980425 - SURFACE
      ?auto_980424 - SURFACE
      ?auto_980426 - SURFACE
    )
    :vars
    (
      ?auto_980427 - HOIST
      ?auto_980433 - PLACE
      ?auto_980432 - PLACE
      ?auto_980430 - HOIST
      ?auto_980428 - SURFACE
      ?auto_980429 - SURFACE
      ?auto_980431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980427 ?auto_980433 ) ( IS-CRATE ?auto_980426 ) ( not ( = ?auto_980424 ?auto_980426 ) ) ( not ( = ?auto_980425 ?auto_980424 ) ) ( not ( = ?auto_980425 ?auto_980426 ) ) ( not ( = ?auto_980432 ?auto_980433 ) ) ( HOIST-AT ?auto_980430 ?auto_980432 ) ( not ( = ?auto_980427 ?auto_980430 ) ) ( SURFACE-AT ?auto_980426 ?auto_980432 ) ( ON ?auto_980426 ?auto_980428 ) ( CLEAR ?auto_980426 ) ( not ( = ?auto_980424 ?auto_980428 ) ) ( not ( = ?auto_980426 ?auto_980428 ) ) ( not ( = ?auto_980425 ?auto_980428 ) ) ( IS-CRATE ?auto_980424 ) ( AVAILABLE ?auto_980430 ) ( SURFACE-AT ?auto_980424 ?auto_980432 ) ( ON ?auto_980424 ?auto_980429 ) ( CLEAR ?auto_980424 ) ( not ( = ?auto_980424 ?auto_980429 ) ) ( not ( = ?auto_980426 ?auto_980429 ) ) ( not ( = ?auto_980425 ?auto_980429 ) ) ( not ( = ?auto_980428 ?auto_980429 ) ) ( TRUCK-AT ?auto_980431 ?auto_980433 ) ( SURFACE-AT ?auto_980423 ?auto_980433 ) ( CLEAR ?auto_980423 ) ( LIFTING ?auto_980427 ?auto_980425 ) ( IS-CRATE ?auto_980425 ) ( not ( = ?auto_980423 ?auto_980425 ) ) ( not ( = ?auto_980424 ?auto_980423 ) ) ( not ( = ?auto_980426 ?auto_980423 ) ) ( not ( = ?auto_980428 ?auto_980423 ) ) ( not ( = ?auto_980429 ?auto_980423 ) ) ( ON ?auto_980422 ?auto_980421 ) ( ON ?auto_980423 ?auto_980422 ) ( not ( = ?auto_980421 ?auto_980422 ) ) ( not ( = ?auto_980421 ?auto_980423 ) ) ( not ( = ?auto_980421 ?auto_980425 ) ) ( not ( = ?auto_980421 ?auto_980424 ) ) ( not ( = ?auto_980421 ?auto_980426 ) ) ( not ( = ?auto_980421 ?auto_980428 ) ) ( not ( = ?auto_980421 ?auto_980429 ) ) ( not ( = ?auto_980422 ?auto_980423 ) ) ( not ( = ?auto_980422 ?auto_980425 ) ) ( not ( = ?auto_980422 ?auto_980424 ) ) ( not ( = ?auto_980422 ?auto_980426 ) ) ( not ( = ?auto_980422 ?auto_980428 ) ) ( not ( = ?auto_980422 ?auto_980429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980425 ?auto_980424 ?auto_980426 )
      ( MAKE-5CRATE-VERIFY ?auto_980421 ?auto_980422 ?auto_980423 ?auto_980425 ?auto_980424 ?auto_980426 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_980434 - SURFACE
      ?auto_980435 - SURFACE
      ?auto_980436 - SURFACE
      ?auto_980438 - SURFACE
      ?auto_980437 - SURFACE
      ?auto_980439 - SURFACE
      ?auto_980440 - SURFACE
    )
    :vars
    (
      ?auto_980441 - HOIST
      ?auto_980447 - PLACE
      ?auto_980446 - PLACE
      ?auto_980444 - HOIST
      ?auto_980442 - SURFACE
      ?auto_980443 - SURFACE
      ?auto_980445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_980441 ?auto_980447 ) ( IS-CRATE ?auto_980440 ) ( not ( = ?auto_980439 ?auto_980440 ) ) ( not ( = ?auto_980437 ?auto_980439 ) ) ( not ( = ?auto_980437 ?auto_980440 ) ) ( not ( = ?auto_980446 ?auto_980447 ) ) ( HOIST-AT ?auto_980444 ?auto_980446 ) ( not ( = ?auto_980441 ?auto_980444 ) ) ( SURFACE-AT ?auto_980440 ?auto_980446 ) ( ON ?auto_980440 ?auto_980442 ) ( CLEAR ?auto_980440 ) ( not ( = ?auto_980439 ?auto_980442 ) ) ( not ( = ?auto_980440 ?auto_980442 ) ) ( not ( = ?auto_980437 ?auto_980442 ) ) ( IS-CRATE ?auto_980439 ) ( AVAILABLE ?auto_980444 ) ( SURFACE-AT ?auto_980439 ?auto_980446 ) ( ON ?auto_980439 ?auto_980443 ) ( CLEAR ?auto_980439 ) ( not ( = ?auto_980439 ?auto_980443 ) ) ( not ( = ?auto_980440 ?auto_980443 ) ) ( not ( = ?auto_980437 ?auto_980443 ) ) ( not ( = ?auto_980442 ?auto_980443 ) ) ( TRUCK-AT ?auto_980445 ?auto_980447 ) ( SURFACE-AT ?auto_980438 ?auto_980447 ) ( CLEAR ?auto_980438 ) ( LIFTING ?auto_980441 ?auto_980437 ) ( IS-CRATE ?auto_980437 ) ( not ( = ?auto_980438 ?auto_980437 ) ) ( not ( = ?auto_980439 ?auto_980438 ) ) ( not ( = ?auto_980440 ?auto_980438 ) ) ( not ( = ?auto_980442 ?auto_980438 ) ) ( not ( = ?auto_980443 ?auto_980438 ) ) ( ON ?auto_980435 ?auto_980434 ) ( ON ?auto_980436 ?auto_980435 ) ( ON ?auto_980438 ?auto_980436 ) ( not ( = ?auto_980434 ?auto_980435 ) ) ( not ( = ?auto_980434 ?auto_980436 ) ) ( not ( = ?auto_980434 ?auto_980438 ) ) ( not ( = ?auto_980434 ?auto_980437 ) ) ( not ( = ?auto_980434 ?auto_980439 ) ) ( not ( = ?auto_980434 ?auto_980440 ) ) ( not ( = ?auto_980434 ?auto_980442 ) ) ( not ( = ?auto_980434 ?auto_980443 ) ) ( not ( = ?auto_980435 ?auto_980436 ) ) ( not ( = ?auto_980435 ?auto_980438 ) ) ( not ( = ?auto_980435 ?auto_980437 ) ) ( not ( = ?auto_980435 ?auto_980439 ) ) ( not ( = ?auto_980435 ?auto_980440 ) ) ( not ( = ?auto_980435 ?auto_980442 ) ) ( not ( = ?auto_980435 ?auto_980443 ) ) ( not ( = ?auto_980436 ?auto_980438 ) ) ( not ( = ?auto_980436 ?auto_980437 ) ) ( not ( = ?auto_980436 ?auto_980439 ) ) ( not ( = ?auto_980436 ?auto_980440 ) ) ( not ( = ?auto_980436 ?auto_980442 ) ) ( not ( = ?auto_980436 ?auto_980443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_980437 ?auto_980439 ?auto_980440 )
      ( MAKE-6CRATE-VERIFY ?auto_980434 ?auto_980435 ?auto_980436 ?auto_980438 ?auto_980437 ?auto_980439 ?auto_980440 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_981977 - SURFACE
      ?auto_981978 - SURFACE
      ?auto_981979 - SURFACE
      ?auto_981981 - SURFACE
      ?auto_981980 - SURFACE
      ?auto_981982 - SURFACE
      ?auto_981983 - SURFACE
      ?auto_981984 - SURFACE
    )
    :vars
    (
      ?auto_981985 - HOIST
      ?auto_981986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_981985 ?auto_981986 ) ( SURFACE-AT ?auto_981983 ?auto_981986 ) ( CLEAR ?auto_981983 ) ( LIFTING ?auto_981985 ?auto_981984 ) ( IS-CRATE ?auto_981984 ) ( not ( = ?auto_981983 ?auto_981984 ) ) ( ON ?auto_981978 ?auto_981977 ) ( ON ?auto_981979 ?auto_981978 ) ( ON ?auto_981981 ?auto_981979 ) ( ON ?auto_981980 ?auto_981981 ) ( ON ?auto_981982 ?auto_981980 ) ( ON ?auto_981983 ?auto_981982 ) ( not ( = ?auto_981977 ?auto_981978 ) ) ( not ( = ?auto_981977 ?auto_981979 ) ) ( not ( = ?auto_981977 ?auto_981981 ) ) ( not ( = ?auto_981977 ?auto_981980 ) ) ( not ( = ?auto_981977 ?auto_981982 ) ) ( not ( = ?auto_981977 ?auto_981983 ) ) ( not ( = ?auto_981977 ?auto_981984 ) ) ( not ( = ?auto_981978 ?auto_981979 ) ) ( not ( = ?auto_981978 ?auto_981981 ) ) ( not ( = ?auto_981978 ?auto_981980 ) ) ( not ( = ?auto_981978 ?auto_981982 ) ) ( not ( = ?auto_981978 ?auto_981983 ) ) ( not ( = ?auto_981978 ?auto_981984 ) ) ( not ( = ?auto_981979 ?auto_981981 ) ) ( not ( = ?auto_981979 ?auto_981980 ) ) ( not ( = ?auto_981979 ?auto_981982 ) ) ( not ( = ?auto_981979 ?auto_981983 ) ) ( not ( = ?auto_981979 ?auto_981984 ) ) ( not ( = ?auto_981981 ?auto_981980 ) ) ( not ( = ?auto_981981 ?auto_981982 ) ) ( not ( = ?auto_981981 ?auto_981983 ) ) ( not ( = ?auto_981981 ?auto_981984 ) ) ( not ( = ?auto_981980 ?auto_981982 ) ) ( not ( = ?auto_981980 ?auto_981983 ) ) ( not ( = ?auto_981980 ?auto_981984 ) ) ( not ( = ?auto_981982 ?auto_981983 ) ) ( not ( = ?auto_981982 ?auto_981984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_981983 ?auto_981984 )
      ( MAKE-7CRATE-VERIFY ?auto_981977 ?auto_981978 ?auto_981979 ?auto_981981 ?auto_981980 ?auto_981982 ?auto_981983 ?auto_981984 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982032 - SURFACE
      ?auto_982033 - SURFACE
      ?auto_982034 - SURFACE
      ?auto_982036 - SURFACE
      ?auto_982035 - SURFACE
      ?auto_982037 - SURFACE
      ?auto_982038 - SURFACE
      ?auto_982039 - SURFACE
    )
    :vars
    (
      ?auto_982041 - HOIST
      ?auto_982040 - PLACE
      ?auto_982042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_982041 ?auto_982040 ) ( SURFACE-AT ?auto_982038 ?auto_982040 ) ( CLEAR ?auto_982038 ) ( IS-CRATE ?auto_982039 ) ( not ( = ?auto_982038 ?auto_982039 ) ) ( TRUCK-AT ?auto_982042 ?auto_982040 ) ( AVAILABLE ?auto_982041 ) ( IN ?auto_982039 ?auto_982042 ) ( ON ?auto_982038 ?auto_982037 ) ( not ( = ?auto_982037 ?auto_982038 ) ) ( not ( = ?auto_982037 ?auto_982039 ) ) ( ON ?auto_982033 ?auto_982032 ) ( ON ?auto_982034 ?auto_982033 ) ( ON ?auto_982036 ?auto_982034 ) ( ON ?auto_982035 ?auto_982036 ) ( ON ?auto_982037 ?auto_982035 ) ( not ( = ?auto_982032 ?auto_982033 ) ) ( not ( = ?auto_982032 ?auto_982034 ) ) ( not ( = ?auto_982032 ?auto_982036 ) ) ( not ( = ?auto_982032 ?auto_982035 ) ) ( not ( = ?auto_982032 ?auto_982037 ) ) ( not ( = ?auto_982032 ?auto_982038 ) ) ( not ( = ?auto_982032 ?auto_982039 ) ) ( not ( = ?auto_982033 ?auto_982034 ) ) ( not ( = ?auto_982033 ?auto_982036 ) ) ( not ( = ?auto_982033 ?auto_982035 ) ) ( not ( = ?auto_982033 ?auto_982037 ) ) ( not ( = ?auto_982033 ?auto_982038 ) ) ( not ( = ?auto_982033 ?auto_982039 ) ) ( not ( = ?auto_982034 ?auto_982036 ) ) ( not ( = ?auto_982034 ?auto_982035 ) ) ( not ( = ?auto_982034 ?auto_982037 ) ) ( not ( = ?auto_982034 ?auto_982038 ) ) ( not ( = ?auto_982034 ?auto_982039 ) ) ( not ( = ?auto_982036 ?auto_982035 ) ) ( not ( = ?auto_982036 ?auto_982037 ) ) ( not ( = ?auto_982036 ?auto_982038 ) ) ( not ( = ?auto_982036 ?auto_982039 ) ) ( not ( = ?auto_982035 ?auto_982037 ) ) ( not ( = ?auto_982035 ?auto_982038 ) ) ( not ( = ?auto_982035 ?auto_982039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982037 ?auto_982038 ?auto_982039 )
      ( MAKE-7CRATE-VERIFY ?auto_982032 ?auto_982033 ?auto_982034 ?auto_982036 ?auto_982035 ?auto_982037 ?auto_982038 ?auto_982039 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982095 - SURFACE
      ?auto_982096 - SURFACE
      ?auto_982097 - SURFACE
      ?auto_982099 - SURFACE
      ?auto_982098 - SURFACE
      ?auto_982100 - SURFACE
      ?auto_982101 - SURFACE
      ?auto_982102 - SURFACE
    )
    :vars
    (
      ?auto_982103 - HOIST
      ?auto_982106 - PLACE
      ?auto_982104 - TRUCK
      ?auto_982105 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982103 ?auto_982106 ) ( SURFACE-AT ?auto_982101 ?auto_982106 ) ( CLEAR ?auto_982101 ) ( IS-CRATE ?auto_982102 ) ( not ( = ?auto_982101 ?auto_982102 ) ) ( AVAILABLE ?auto_982103 ) ( IN ?auto_982102 ?auto_982104 ) ( ON ?auto_982101 ?auto_982100 ) ( not ( = ?auto_982100 ?auto_982101 ) ) ( not ( = ?auto_982100 ?auto_982102 ) ) ( TRUCK-AT ?auto_982104 ?auto_982105 ) ( not ( = ?auto_982105 ?auto_982106 ) ) ( ON ?auto_982096 ?auto_982095 ) ( ON ?auto_982097 ?auto_982096 ) ( ON ?auto_982099 ?auto_982097 ) ( ON ?auto_982098 ?auto_982099 ) ( ON ?auto_982100 ?auto_982098 ) ( not ( = ?auto_982095 ?auto_982096 ) ) ( not ( = ?auto_982095 ?auto_982097 ) ) ( not ( = ?auto_982095 ?auto_982099 ) ) ( not ( = ?auto_982095 ?auto_982098 ) ) ( not ( = ?auto_982095 ?auto_982100 ) ) ( not ( = ?auto_982095 ?auto_982101 ) ) ( not ( = ?auto_982095 ?auto_982102 ) ) ( not ( = ?auto_982096 ?auto_982097 ) ) ( not ( = ?auto_982096 ?auto_982099 ) ) ( not ( = ?auto_982096 ?auto_982098 ) ) ( not ( = ?auto_982096 ?auto_982100 ) ) ( not ( = ?auto_982096 ?auto_982101 ) ) ( not ( = ?auto_982096 ?auto_982102 ) ) ( not ( = ?auto_982097 ?auto_982099 ) ) ( not ( = ?auto_982097 ?auto_982098 ) ) ( not ( = ?auto_982097 ?auto_982100 ) ) ( not ( = ?auto_982097 ?auto_982101 ) ) ( not ( = ?auto_982097 ?auto_982102 ) ) ( not ( = ?auto_982099 ?auto_982098 ) ) ( not ( = ?auto_982099 ?auto_982100 ) ) ( not ( = ?auto_982099 ?auto_982101 ) ) ( not ( = ?auto_982099 ?auto_982102 ) ) ( not ( = ?auto_982098 ?auto_982100 ) ) ( not ( = ?auto_982098 ?auto_982101 ) ) ( not ( = ?auto_982098 ?auto_982102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982100 ?auto_982101 ?auto_982102 )
      ( MAKE-7CRATE-VERIFY ?auto_982095 ?auto_982096 ?auto_982097 ?auto_982099 ?auto_982098 ?auto_982100 ?auto_982101 ?auto_982102 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982165 - SURFACE
      ?auto_982166 - SURFACE
      ?auto_982167 - SURFACE
      ?auto_982169 - SURFACE
      ?auto_982168 - SURFACE
      ?auto_982170 - SURFACE
      ?auto_982171 - SURFACE
      ?auto_982172 - SURFACE
    )
    :vars
    (
      ?auto_982174 - HOIST
      ?auto_982173 - PLACE
      ?auto_982176 - TRUCK
      ?auto_982177 - PLACE
      ?auto_982175 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_982174 ?auto_982173 ) ( SURFACE-AT ?auto_982171 ?auto_982173 ) ( CLEAR ?auto_982171 ) ( IS-CRATE ?auto_982172 ) ( not ( = ?auto_982171 ?auto_982172 ) ) ( AVAILABLE ?auto_982174 ) ( ON ?auto_982171 ?auto_982170 ) ( not ( = ?auto_982170 ?auto_982171 ) ) ( not ( = ?auto_982170 ?auto_982172 ) ) ( TRUCK-AT ?auto_982176 ?auto_982177 ) ( not ( = ?auto_982177 ?auto_982173 ) ) ( HOIST-AT ?auto_982175 ?auto_982177 ) ( LIFTING ?auto_982175 ?auto_982172 ) ( not ( = ?auto_982174 ?auto_982175 ) ) ( ON ?auto_982166 ?auto_982165 ) ( ON ?auto_982167 ?auto_982166 ) ( ON ?auto_982169 ?auto_982167 ) ( ON ?auto_982168 ?auto_982169 ) ( ON ?auto_982170 ?auto_982168 ) ( not ( = ?auto_982165 ?auto_982166 ) ) ( not ( = ?auto_982165 ?auto_982167 ) ) ( not ( = ?auto_982165 ?auto_982169 ) ) ( not ( = ?auto_982165 ?auto_982168 ) ) ( not ( = ?auto_982165 ?auto_982170 ) ) ( not ( = ?auto_982165 ?auto_982171 ) ) ( not ( = ?auto_982165 ?auto_982172 ) ) ( not ( = ?auto_982166 ?auto_982167 ) ) ( not ( = ?auto_982166 ?auto_982169 ) ) ( not ( = ?auto_982166 ?auto_982168 ) ) ( not ( = ?auto_982166 ?auto_982170 ) ) ( not ( = ?auto_982166 ?auto_982171 ) ) ( not ( = ?auto_982166 ?auto_982172 ) ) ( not ( = ?auto_982167 ?auto_982169 ) ) ( not ( = ?auto_982167 ?auto_982168 ) ) ( not ( = ?auto_982167 ?auto_982170 ) ) ( not ( = ?auto_982167 ?auto_982171 ) ) ( not ( = ?auto_982167 ?auto_982172 ) ) ( not ( = ?auto_982169 ?auto_982168 ) ) ( not ( = ?auto_982169 ?auto_982170 ) ) ( not ( = ?auto_982169 ?auto_982171 ) ) ( not ( = ?auto_982169 ?auto_982172 ) ) ( not ( = ?auto_982168 ?auto_982170 ) ) ( not ( = ?auto_982168 ?auto_982171 ) ) ( not ( = ?auto_982168 ?auto_982172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982170 ?auto_982171 ?auto_982172 )
      ( MAKE-7CRATE-VERIFY ?auto_982165 ?auto_982166 ?auto_982167 ?auto_982169 ?auto_982168 ?auto_982170 ?auto_982171 ?auto_982172 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982242 - SURFACE
      ?auto_982243 - SURFACE
      ?auto_982244 - SURFACE
      ?auto_982246 - SURFACE
      ?auto_982245 - SURFACE
      ?auto_982247 - SURFACE
      ?auto_982248 - SURFACE
      ?auto_982249 - SURFACE
    )
    :vars
    (
      ?auto_982251 - HOIST
      ?auto_982252 - PLACE
      ?auto_982255 - TRUCK
      ?auto_982254 - PLACE
      ?auto_982253 - HOIST
      ?auto_982250 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982251 ?auto_982252 ) ( SURFACE-AT ?auto_982248 ?auto_982252 ) ( CLEAR ?auto_982248 ) ( IS-CRATE ?auto_982249 ) ( not ( = ?auto_982248 ?auto_982249 ) ) ( AVAILABLE ?auto_982251 ) ( ON ?auto_982248 ?auto_982247 ) ( not ( = ?auto_982247 ?auto_982248 ) ) ( not ( = ?auto_982247 ?auto_982249 ) ) ( TRUCK-AT ?auto_982255 ?auto_982254 ) ( not ( = ?auto_982254 ?auto_982252 ) ) ( HOIST-AT ?auto_982253 ?auto_982254 ) ( not ( = ?auto_982251 ?auto_982253 ) ) ( AVAILABLE ?auto_982253 ) ( SURFACE-AT ?auto_982249 ?auto_982254 ) ( ON ?auto_982249 ?auto_982250 ) ( CLEAR ?auto_982249 ) ( not ( = ?auto_982248 ?auto_982250 ) ) ( not ( = ?auto_982249 ?auto_982250 ) ) ( not ( = ?auto_982247 ?auto_982250 ) ) ( ON ?auto_982243 ?auto_982242 ) ( ON ?auto_982244 ?auto_982243 ) ( ON ?auto_982246 ?auto_982244 ) ( ON ?auto_982245 ?auto_982246 ) ( ON ?auto_982247 ?auto_982245 ) ( not ( = ?auto_982242 ?auto_982243 ) ) ( not ( = ?auto_982242 ?auto_982244 ) ) ( not ( = ?auto_982242 ?auto_982246 ) ) ( not ( = ?auto_982242 ?auto_982245 ) ) ( not ( = ?auto_982242 ?auto_982247 ) ) ( not ( = ?auto_982242 ?auto_982248 ) ) ( not ( = ?auto_982242 ?auto_982249 ) ) ( not ( = ?auto_982242 ?auto_982250 ) ) ( not ( = ?auto_982243 ?auto_982244 ) ) ( not ( = ?auto_982243 ?auto_982246 ) ) ( not ( = ?auto_982243 ?auto_982245 ) ) ( not ( = ?auto_982243 ?auto_982247 ) ) ( not ( = ?auto_982243 ?auto_982248 ) ) ( not ( = ?auto_982243 ?auto_982249 ) ) ( not ( = ?auto_982243 ?auto_982250 ) ) ( not ( = ?auto_982244 ?auto_982246 ) ) ( not ( = ?auto_982244 ?auto_982245 ) ) ( not ( = ?auto_982244 ?auto_982247 ) ) ( not ( = ?auto_982244 ?auto_982248 ) ) ( not ( = ?auto_982244 ?auto_982249 ) ) ( not ( = ?auto_982244 ?auto_982250 ) ) ( not ( = ?auto_982246 ?auto_982245 ) ) ( not ( = ?auto_982246 ?auto_982247 ) ) ( not ( = ?auto_982246 ?auto_982248 ) ) ( not ( = ?auto_982246 ?auto_982249 ) ) ( not ( = ?auto_982246 ?auto_982250 ) ) ( not ( = ?auto_982245 ?auto_982247 ) ) ( not ( = ?auto_982245 ?auto_982248 ) ) ( not ( = ?auto_982245 ?auto_982249 ) ) ( not ( = ?auto_982245 ?auto_982250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982247 ?auto_982248 ?auto_982249 )
      ( MAKE-7CRATE-VERIFY ?auto_982242 ?auto_982243 ?auto_982244 ?auto_982246 ?auto_982245 ?auto_982247 ?auto_982248 ?auto_982249 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982320 - SURFACE
      ?auto_982321 - SURFACE
      ?auto_982322 - SURFACE
      ?auto_982324 - SURFACE
      ?auto_982323 - SURFACE
      ?auto_982325 - SURFACE
      ?auto_982326 - SURFACE
      ?auto_982327 - SURFACE
    )
    :vars
    (
      ?auto_982331 - HOIST
      ?auto_982333 - PLACE
      ?auto_982329 - PLACE
      ?auto_982330 - HOIST
      ?auto_982332 - SURFACE
      ?auto_982328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_982331 ?auto_982333 ) ( SURFACE-AT ?auto_982326 ?auto_982333 ) ( CLEAR ?auto_982326 ) ( IS-CRATE ?auto_982327 ) ( not ( = ?auto_982326 ?auto_982327 ) ) ( AVAILABLE ?auto_982331 ) ( ON ?auto_982326 ?auto_982325 ) ( not ( = ?auto_982325 ?auto_982326 ) ) ( not ( = ?auto_982325 ?auto_982327 ) ) ( not ( = ?auto_982329 ?auto_982333 ) ) ( HOIST-AT ?auto_982330 ?auto_982329 ) ( not ( = ?auto_982331 ?auto_982330 ) ) ( AVAILABLE ?auto_982330 ) ( SURFACE-AT ?auto_982327 ?auto_982329 ) ( ON ?auto_982327 ?auto_982332 ) ( CLEAR ?auto_982327 ) ( not ( = ?auto_982326 ?auto_982332 ) ) ( not ( = ?auto_982327 ?auto_982332 ) ) ( not ( = ?auto_982325 ?auto_982332 ) ) ( TRUCK-AT ?auto_982328 ?auto_982333 ) ( ON ?auto_982321 ?auto_982320 ) ( ON ?auto_982322 ?auto_982321 ) ( ON ?auto_982324 ?auto_982322 ) ( ON ?auto_982323 ?auto_982324 ) ( ON ?auto_982325 ?auto_982323 ) ( not ( = ?auto_982320 ?auto_982321 ) ) ( not ( = ?auto_982320 ?auto_982322 ) ) ( not ( = ?auto_982320 ?auto_982324 ) ) ( not ( = ?auto_982320 ?auto_982323 ) ) ( not ( = ?auto_982320 ?auto_982325 ) ) ( not ( = ?auto_982320 ?auto_982326 ) ) ( not ( = ?auto_982320 ?auto_982327 ) ) ( not ( = ?auto_982320 ?auto_982332 ) ) ( not ( = ?auto_982321 ?auto_982322 ) ) ( not ( = ?auto_982321 ?auto_982324 ) ) ( not ( = ?auto_982321 ?auto_982323 ) ) ( not ( = ?auto_982321 ?auto_982325 ) ) ( not ( = ?auto_982321 ?auto_982326 ) ) ( not ( = ?auto_982321 ?auto_982327 ) ) ( not ( = ?auto_982321 ?auto_982332 ) ) ( not ( = ?auto_982322 ?auto_982324 ) ) ( not ( = ?auto_982322 ?auto_982323 ) ) ( not ( = ?auto_982322 ?auto_982325 ) ) ( not ( = ?auto_982322 ?auto_982326 ) ) ( not ( = ?auto_982322 ?auto_982327 ) ) ( not ( = ?auto_982322 ?auto_982332 ) ) ( not ( = ?auto_982324 ?auto_982323 ) ) ( not ( = ?auto_982324 ?auto_982325 ) ) ( not ( = ?auto_982324 ?auto_982326 ) ) ( not ( = ?auto_982324 ?auto_982327 ) ) ( not ( = ?auto_982324 ?auto_982332 ) ) ( not ( = ?auto_982323 ?auto_982325 ) ) ( not ( = ?auto_982323 ?auto_982326 ) ) ( not ( = ?auto_982323 ?auto_982327 ) ) ( not ( = ?auto_982323 ?auto_982332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982325 ?auto_982326 ?auto_982327 )
      ( MAKE-7CRATE-VERIFY ?auto_982320 ?auto_982321 ?auto_982322 ?auto_982324 ?auto_982323 ?auto_982325 ?auto_982326 ?auto_982327 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982398 - SURFACE
      ?auto_982399 - SURFACE
      ?auto_982400 - SURFACE
      ?auto_982402 - SURFACE
      ?auto_982401 - SURFACE
      ?auto_982403 - SURFACE
      ?auto_982404 - SURFACE
      ?auto_982405 - SURFACE
    )
    :vars
    (
      ?auto_982411 - HOIST
      ?auto_982408 - PLACE
      ?auto_982410 - PLACE
      ?auto_982407 - HOIST
      ?auto_982406 - SURFACE
      ?auto_982409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_982411 ?auto_982408 ) ( IS-CRATE ?auto_982405 ) ( not ( = ?auto_982404 ?auto_982405 ) ) ( not ( = ?auto_982403 ?auto_982404 ) ) ( not ( = ?auto_982403 ?auto_982405 ) ) ( not ( = ?auto_982410 ?auto_982408 ) ) ( HOIST-AT ?auto_982407 ?auto_982410 ) ( not ( = ?auto_982411 ?auto_982407 ) ) ( AVAILABLE ?auto_982407 ) ( SURFACE-AT ?auto_982405 ?auto_982410 ) ( ON ?auto_982405 ?auto_982406 ) ( CLEAR ?auto_982405 ) ( not ( = ?auto_982404 ?auto_982406 ) ) ( not ( = ?auto_982405 ?auto_982406 ) ) ( not ( = ?auto_982403 ?auto_982406 ) ) ( TRUCK-AT ?auto_982409 ?auto_982408 ) ( SURFACE-AT ?auto_982403 ?auto_982408 ) ( CLEAR ?auto_982403 ) ( LIFTING ?auto_982411 ?auto_982404 ) ( IS-CRATE ?auto_982404 ) ( ON ?auto_982399 ?auto_982398 ) ( ON ?auto_982400 ?auto_982399 ) ( ON ?auto_982402 ?auto_982400 ) ( ON ?auto_982401 ?auto_982402 ) ( ON ?auto_982403 ?auto_982401 ) ( not ( = ?auto_982398 ?auto_982399 ) ) ( not ( = ?auto_982398 ?auto_982400 ) ) ( not ( = ?auto_982398 ?auto_982402 ) ) ( not ( = ?auto_982398 ?auto_982401 ) ) ( not ( = ?auto_982398 ?auto_982403 ) ) ( not ( = ?auto_982398 ?auto_982404 ) ) ( not ( = ?auto_982398 ?auto_982405 ) ) ( not ( = ?auto_982398 ?auto_982406 ) ) ( not ( = ?auto_982399 ?auto_982400 ) ) ( not ( = ?auto_982399 ?auto_982402 ) ) ( not ( = ?auto_982399 ?auto_982401 ) ) ( not ( = ?auto_982399 ?auto_982403 ) ) ( not ( = ?auto_982399 ?auto_982404 ) ) ( not ( = ?auto_982399 ?auto_982405 ) ) ( not ( = ?auto_982399 ?auto_982406 ) ) ( not ( = ?auto_982400 ?auto_982402 ) ) ( not ( = ?auto_982400 ?auto_982401 ) ) ( not ( = ?auto_982400 ?auto_982403 ) ) ( not ( = ?auto_982400 ?auto_982404 ) ) ( not ( = ?auto_982400 ?auto_982405 ) ) ( not ( = ?auto_982400 ?auto_982406 ) ) ( not ( = ?auto_982402 ?auto_982401 ) ) ( not ( = ?auto_982402 ?auto_982403 ) ) ( not ( = ?auto_982402 ?auto_982404 ) ) ( not ( = ?auto_982402 ?auto_982405 ) ) ( not ( = ?auto_982402 ?auto_982406 ) ) ( not ( = ?auto_982401 ?auto_982403 ) ) ( not ( = ?auto_982401 ?auto_982404 ) ) ( not ( = ?auto_982401 ?auto_982405 ) ) ( not ( = ?auto_982401 ?auto_982406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982403 ?auto_982404 ?auto_982405 )
      ( MAKE-7CRATE-VERIFY ?auto_982398 ?auto_982399 ?auto_982400 ?auto_982402 ?auto_982401 ?auto_982403 ?auto_982404 ?auto_982405 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_982476 - SURFACE
      ?auto_982477 - SURFACE
      ?auto_982478 - SURFACE
      ?auto_982480 - SURFACE
      ?auto_982479 - SURFACE
      ?auto_982481 - SURFACE
      ?auto_982482 - SURFACE
      ?auto_982483 - SURFACE
    )
    :vars
    (
      ?auto_982484 - HOIST
      ?auto_982485 - PLACE
      ?auto_982487 - PLACE
      ?auto_982488 - HOIST
      ?auto_982486 - SURFACE
      ?auto_982489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_982484 ?auto_982485 ) ( IS-CRATE ?auto_982483 ) ( not ( = ?auto_982482 ?auto_982483 ) ) ( not ( = ?auto_982481 ?auto_982482 ) ) ( not ( = ?auto_982481 ?auto_982483 ) ) ( not ( = ?auto_982487 ?auto_982485 ) ) ( HOIST-AT ?auto_982488 ?auto_982487 ) ( not ( = ?auto_982484 ?auto_982488 ) ) ( AVAILABLE ?auto_982488 ) ( SURFACE-AT ?auto_982483 ?auto_982487 ) ( ON ?auto_982483 ?auto_982486 ) ( CLEAR ?auto_982483 ) ( not ( = ?auto_982482 ?auto_982486 ) ) ( not ( = ?auto_982483 ?auto_982486 ) ) ( not ( = ?auto_982481 ?auto_982486 ) ) ( TRUCK-AT ?auto_982489 ?auto_982485 ) ( SURFACE-AT ?auto_982481 ?auto_982485 ) ( CLEAR ?auto_982481 ) ( IS-CRATE ?auto_982482 ) ( AVAILABLE ?auto_982484 ) ( IN ?auto_982482 ?auto_982489 ) ( ON ?auto_982477 ?auto_982476 ) ( ON ?auto_982478 ?auto_982477 ) ( ON ?auto_982480 ?auto_982478 ) ( ON ?auto_982479 ?auto_982480 ) ( ON ?auto_982481 ?auto_982479 ) ( not ( = ?auto_982476 ?auto_982477 ) ) ( not ( = ?auto_982476 ?auto_982478 ) ) ( not ( = ?auto_982476 ?auto_982480 ) ) ( not ( = ?auto_982476 ?auto_982479 ) ) ( not ( = ?auto_982476 ?auto_982481 ) ) ( not ( = ?auto_982476 ?auto_982482 ) ) ( not ( = ?auto_982476 ?auto_982483 ) ) ( not ( = ?auto_982476 ?auto_982486 ) ) ( not ( = ?auto_982477 ?auto_982478 ) ) ( not ( = ?auto_982477 ?auto_982480 ) ) ( not ( = ?auto_982477 ?auto_982479 ) ) ( not ( = ?auto_982477 ?auto_982481 ) ) ( not ( = ?auto_982477 ?auto_982482 ) ) ( not ( = ?auto_982477 ?auto_982483 ) ) ( not ( = ?auto_982477 ?auto_982486 ) ) ( not ( = ?auto_982478 ?auto_982480 ) ) ( not ( = ?auto_982478 ?auto_982479 ) ) ( not ( = ?auto_982478 ?auto_982481 ) ) ( not ( = ?auto_982478 ?auto_982482 ) ) ( not ( = ?auto_982478 ?auto_982483 ) ) ( not ( = ?auto_982478 ?auto_982486 ) ) ( not ( = ?auto_982480 ?auto_982479 ) ) ( not ( = ?auto_982480 ?auto_982481 ) ) ( not ( = ?auto_982480 ?auto_982482 ) ) ( not ( = ?auto_982480 ?auto_982483 ) ) ( not ( = ?auto_982480 ?auto_982486 ) ) ( not ( = ?auto_982479 ?auto_982481 ) ) ( not ( = ?auto_982479 ?auto_982482 ) ) ( not ( = ?auto_982479 ?auto_982483 ) ) ( not ( = ?auto_982479 ?auto_982486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_982481 ?auto_982482 ?auto_982483 )
      ( MAKE-7CRATE-VERIFY ?auto_982476 ?auto_982477 ?auto_982478 ?auto_982480 ?auto_982479 ?auto_982481 ?auto_982482 ?auto_982483 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985385 - SURFACE
      ?auto_985386 - SURFACE
      ?auto_985387 - SURFACE
      ?auto_985389 - SURFACE
      ?auto_985388 - SURFACE
      ?auto_985390 - SURFACE
      ?auto_985391 - SURFACE
      ?auto_985392 - SURFACE
      ?auto_985393 - SURFACE
    )
    :vars
    (
      ?auto_985395 - HOIST
      ?auto_985394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_985395 ?auto_985394 ) ( SURFACE-AT ?auto_985392 ?auto_985394 ) ( CLEAR ?auto_985392 ) ( LIFTING ?auto_985395 ?auto_985393 ) ( IS-CRATE ?auto_985393 ) ( not ( = ?auto_985392 ?auto_985393 ) ) ( ON ?auto_985386 ?auto_985385 ) ( ON ?auto_985387 ?auto_985386 ) ( ON ?auto_985389 ?auto_985387 ) ( ON ?auto_985388 ?auto_985389 ) ( ON ?auto_985390 ?auto_985388 ) ( ON ?auto_985391 ?auto_985390 ) ( ON ?auto_985392 ?auto_985391 ) ( not ( = ?auto_985385 ?auto_985386 ) ) ( not ( = ?auto_985385 ?auto_985387 ) ) ( not ( = ?auto_985385 ?auto_985389 ) ) ( not ( = ?auto_985385 ?auto_985388 ) ) ( not ( = ?auto_985385 ?auto_985390 ) ) ( not ( = ?auto_985385 ?auto_985391 ) ) ( not ( = ?auto_985385 ?auto_985392 ) ) ( not ( = ?auto_985385 ?auto_985393 ) ) ( not ( = ?auto_985386 ?auto_985387 ) ) ( not ( = ?auto_985386 ?auto_985389 ) ) ( not ( = ?auto_985386 ?auto_985388 ) ) ( not ( = ?auto_985386 ?auto_985390 ) ) ( not ( = ?auto_985386 ?auto_985391 ) ) ( not ( = ?auto_985386 ?auto_985392 ) ) ( not ( = ?auto_985386 ?auto_985393 ) ) ( not ( = ?auto_985387 ?auto_985389 ) ) ( not ( = ?auto_985387 ?auto_985388 ) ) ( not ( = ?auto_985387 ?auto_985390 ) ) ( not ( = ?auto_985387 ?auto_985391 ) ) ( not ( = ?auto_985387 ?auto_985392 ) ) ( not ( = ?auto_985387 ?auto_985393 ) ) ( not ( = ?auto_985389 ?auto_985388 ) ) ( not ( = ?auto_985389 ?auto_985390 ) ) ( not ( = ?auto_985389 ?auto_985391 ) ) ( not ( = ?auto_985389 ?auto_985392 ) ) ( not ( = ?auto_985389 ?auto_985393 ) ) ( not ( = ?auto_985388 ?auto_985390 ) ) ( not ( = ?auto_985388 ?auto_985391 ) ) ( not ( = ?auto_985388 ?auto_985392 ) ) ( not ( = ?auto_985388 ?auto_985393 ) ) ( not ( = ?auto_985390 ?auto_985391 ) ) ( not ( = ?auto_985390 ?auto_985392 ) ) ( not ( = ?auto_985390 ?auto_985393 ) ) ( not ( = ?auto_985391 ?auto_985392 ) ) ( not ( = ?auto_985391 ?auto_985393 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_985392 ?auto_985393 )
      ( MAKE-8CRATE-VERIFY ?auto_985385 ?auto_985386 ?auto_985387 ?auto_985389 ?auto_985388 ?auto_985390 ?auto_985391 ?auto_985392 ?auto_985393 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985452 - SURFACE
      ?auto_985453 - SURFACE
      ?auto_985454 - SURFACE
      ?auto_985456 - SURFACE
      ?auto_985455 - SURFACE
      ?auto_985457 - SURFACE
      ?auto_985458 - SURFACE
      ?auto_985459 - SURFACE
      ?auto_985460 - SURFACE
    )
    :vars
    (
      ?auto_985461 - HOIST
      ?auto_985463 - PLACE
      ?auto_985462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_985461 ?auto_985463 ) ( SURFACE-AT ?auto_985459 ?auto_985463 ) ( CLEAR ?auto_985459 ) ( IS-CRATE ?auto_985460 ) ( not ( = ?auto_985459 ?auto_985460 ) ) ( TRUCK-AT ?auto_985462 ?auto_985463 ) ( AVAILABLE ?auto_985461 ) ( IN ?auto_985460 ?auto_985462 ) ( ON ?auto_985459 ?auto_985458 ) ( not ( = ?auto_985458 ?auto_985459 ) ) ( not ( = ?auto_985458 ?auto_985460 ) ) ( ON ?auto_985453 ?auto_985452 ) ( ON ?auto_985454 ?auto_985453 ) ( ON ?auto_985456 ?auto_985454 ) ( ON ?auto_985455 ?auto_985456 ) ( ON ?auto_985457 ?auto_985455 ) ( ON ?auto_985458 ?auto_985457 ) ( not ( = ?auto_985452 ?auto_985453 ) ) ( not ( = ?auto_985452 ?auto_985454 ) ) ( not ( = ?auto_985452 ?auto_985456 ) ) ( not ( = ?auto_985452 ?auto_985455 ) ) ( not ( = ?auto_985452 ?auto_985457 ) ) ( not ( = ?auto_985452 ?auto_985458 ) ) ( not ( = ?auto_985452 ?auto_985459 ) ) ( not ( = ?auto_985452 ?auto_985460 ) ) ( not ( = ?auto_985453 ?auto_985454 ) ) ( not ( = ?auto_985453 ?auto_985456 ) ) ( not ( = ?auto_985453 ?auto_985455 ) ) ( not ( = ?auto_985453 ?auto_985457 ) ) ( not ( = ?auto_985453 ?auto_985458 ) ) ( not ( = ?auto_985453 ?auto_985459 ) ) ( not ( = ?auto_985453 ?auto_985460 ) ) ( not ( = ?auto_985454 ?auto_985456 ) ) ( not ( = ?auto_985454 ?auto_985455 ) ) ( not ( = ?auto_985454 ?auto_985457 ) ) ( not ( = ?auto_985454 ?auto_985458 ) ) ( not ( = ?auto_985454 ?auto_985459 ) ) ( not ( = ?auto_985454 ?auto_985460 ) ) ( not ( = ?auto_985456 ?auto_985455 ) ) ( not ( = ?auto_985456 ?auto_985457 ) ) ( not ( = ?auto_985456 ?auto_985458 ) ) ( not ( = ?auto_985456 ?auto_985459 ) ) ( not ( = ?auto_985456 ?auto_985460 ) ) ( not ( = ?auto_985455 ?auto_985457 ) ) ( not ( = ?auto_985455 ?auto_985458 ) ) ( not ( = ?auto_985455 ?auto_985459 ) ) ( not ( = ?auto_985455 ?auto_985460 ) ) ( not ( = ?auto_985457 ?auto_985458 ) ) ( not ( = ?auto_985457 ?auto_985459 ) ) ( not ( = ?auto_985457 ?auto_985460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_985458 ?auto_985459 ?auto_985460 )
      ( MAKE-8CRATE-VERIFY ?auto_985452 ?auto_985453 ?auto_985454 ?auto_985456 ?auto_985455 ?auto_985457 ?auto_985458 ?auto_985459 ?auto_985460 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985528 - SURFACE
      ?auto_985529 - SURFACE
      ?auto_985530 - SURFACE
      ?auto_985532 - SURFACE
      ?auto_985531 - SURFACE
      ?auto_985533 - SURFACE
      ?auto_985534 - SURFACE
      ?auto_985535 - SURFACE
      ?auto_985536 - SURFACE
    )
    :vars
    (
      ?auto_985538 - HOIST
      ?auto_985540 - PLACE
      ?auto_985539 - TRUCK
      ?auto_985537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_985538 ?auto_985540 ) ( SURFACE-AT ?auto_985535 ?auto_985540 ) ( CLEAR ?auto_985535 ) ( IS-CRATE ?auto_985536 ) ( not ( = ?auto_985535 ?auto_985536 ) ) ( AVAILABLE ?auto_985538 ) ( IN ?auto_985536 ?auto_985539 ) ( ON ?auto_985535 ?auto_985534 ) ( not ( = ?auto_985534 ?auto_985535 ) ) ( not ( = ?auto_985534 ?auto_985536 ) ) ( TRUCK-AT ?auto_985539 ?auto_985537 ) ( not ( = ?auto_985537 ?auto_985540 ) ) ( ON ?auto_985529 ?auto_985528 ) ( ON ?auto_985530 ?auto_985529 ) ( ON ?auto_985532 ?auto_985530 ) ( ON ?auto_985531 ?auto_985532 ) ( ON ?auto_985533 ?auto_985531 ) ( ON ?auto_985534 ?auto_985533 ) ( not ( = ?auto_985528 ?auto_985529 ) ) ( not ( = ?auto_985528 ?auto_985530 ) ) ( not ( = ?auto_985528 ?auto_985532 ) ) ( not ( = ?auto_985528 ?auto_985531 ) ) ( not ( = ?auto_985528 ?auto_985533 ) ) ( not ( = ?auto_985528 ?auto_985534 ) ) ( not ( = ?auto_985528 ?auto_985535 ) ) ( not ( = ?auto_985528 ?auto_985536 ) ) ( not ( = ?auto_985529 ?auto_985530 ) ) ( not ( = ?auto_985529 ?auto_985532 ) ) ( not ( = ?auto_985529 ?auto_985531 ) ) ( not ( = ?auto_985529 ?auto_985533 ) ) ( not ( = ?auto_985529 ?auto_985534 ) ) ( not ( = ?auto_985529 ?auto_985535 ) ) ( not ( = ?auto_985529 ?auto_985536 ) ) ( not ( = ?auto_985530 ?auto_985532 ) ) ( not ( = ?auto_985530 ?auto_985531 ) ) ( not ( = ?auto_985530 ?auto_985533 ) ) ( not ( = ?auto_985530 ?auto_985534 ) ) ( not ( = ?auto_985530 ?auto_985535 ) ) ( not ( = ?auto_985530 ?auto_985536 ) ) ( not ( = ?auto_985532 ?auto_985531 ) ) ( not ( = ?auto_985532 ?auto_985533 ) ) ( not ( = ?auto_985532 ?auto_985534 ) ) ( not ( = ?auto_985532 ?auto_985535 ) ) ( not ( = ?auto_985532 ?auto_985536 ) ) ( not ( = ?auto_985531 ?auto_985533 ) ) ( not ( = ?auto_985531 ?auto_985534 ) ) ( not ( = ?auto_985531 ?auto_985535 ) ) ( not ( = ?auto_985531 ?auto_985536 ) ) ( not ( = ?auto_985533 ?auto_985534 ) ) ( not ( = ?auto_985533 ?auto_985535 ) ) ( not ( = ?auto_985533 ?auto_985536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_985534 ?auto_985535 ?auto_985536 )
      ( MAKE-8CRATE-VERIFY ?auto_985528 ?auto_985529 ?auto_985530 ?auto_985532 ?auto_985531 ?auto_985533 ?auto_985534 ?auto_985535 ?auto_985536 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985612 - SURFACE
      ?auto_985613 - SURFACE
      ?auto_985614 - SURFACE
      ?auto_985616 - SURFACE
      ?auto_985615 - SURFACE
      ?auto_985617 - SURFACE
      ?auto_985618 - SURFACE
      ?auto_985619 - SURFACE
      ?auto_985620 - SURFACE
    )
    :vars
    (
      ?auto_985622 - HOIST
      ?auto_985621 - PLACE
      ?auto_985625 - TRUCK
      ?auto_985623 - PLACE
      ?auto_985624 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_985622 ?auto_985621 ) ( SURFACE-AT ?auto_985619 ?auto_985621 ) ( CLEAR ?auto_985619 ) ( IS-CRATE ?auto_985620 ) ( not ( = ?auto_985619 ?auto_985620 ) ) ( AVAILABLE ?auto_985622 ) ( ON ?auto_985619 ?auto_985618 ) ( not ( = ?auto_985618 ?auto_985619 ) ) ( not ( = ?auto_985618 ?auto_985620 ) ) ( TRUCK-AT ?auto_985625 ?auto_985623 ) ( not ( = ?auto_985623 ?auto_985621 ) ) ( HOIST-AT ?auto_985624 ?auto_985623 ) ( LIFTING ?auto_985624 ?auto_985620 ) ( not ( = ?auto_985622 ?auto_985624 ) ) ( ON ?auto_985613 ?auto_985612 ) ( ON ?auto_985614 ?auto_985613 ) ( ON ?auto_985616 ?auto_985614 ) ( ON ?auto_985615 ?auto_985616 ) ( ON ?auto_985617 ?auto_985615 ) ( ON ?auto_985618 ?auto_985617 ) ( not ( = ?auto_985612 ?auto_985613 ) ) ( not ( = ?auto_985612 ?auto_985614 ) ) ( not ( = ?auto_985612 ?auto_985616 ) ) ( not ( = ?auto_985612 ?auto_985615 ) ) ( not ( = ?auto_985612 ?auto_985617 ) ) ( not ( = ?auto_985612 ?auto_985618 ) ) ( not ( = ?auto_985612 ?auto_985619 ) ) ( not ( = ?auto_985612 ?auto_985620 ) ) ( not ( = ?auto_985613 ?auto_985614 ) ) ( not ( = ?auto_985613 ?auto_985616 ) ) ( not ( = ?auto_985613 ?auto_985615 ) ) ( not ( = ?auto_985613 ?auto_985617 ) ) ( not ( = ?auto_985613 ?auto_985618 ) ) ( not ( = ?auto_985613 ?auto_985619 ) ) ( not ( = ?auto_985613 ?auto_985620 ) ) ( not ( = ?auto_985614 ?auto_985616 ) ) ( not ( = ?auto_985614 ?auto_985615 ) ) ( not ( = ?auto_985614 ?auto_985617 ) ) ( not ( = ?auto_985614 ?auto_985618 ) ) ( not ( = ?auto_985614 ?auto_985619 ) ) ( not ( = ?auto_985614 ?auto_985620 ) ) ( not ( = ?auto_985616 ?auto_985615 ) ) ( not ( = ?auto_985616 ?auto_985617 ) ) ( not ( = ?auto_985616 ?auto_985618 ) ) ( not ( = ?auto_985616 ?auto_985619 ) ) ( not ( = ?auto_985616 ?auto_985620 ) ) ( not ( = ?auto_985615 ?auto_985617 ) ) ( not ( = ?auto_985615 ?auto_985618 ) ) ( not ( = ?auto_985615 ?auto_985619 ) ) ( not ( = ?auto_985615 ?auto_985620 ) ) ( not ( = ?auto_985617 ?auto_985618 ) ) ( not ( = ?auto_985617 ?auto_985619 ) ) ( not ( = ?auto_985617 ?auto_985620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_985618 ?auto_985619 ?auto_985620 )
      ( MAKE-8CRATE-VERIFY ?auto_985612 ?auto_985613 ?auto_985614 ?auto_985616 ?auto_985615 ?auto_985617 ?auto_985618 ?auto_985619 ?auto_985620 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985704 - SURFACE
      ?auto_985705 - SURFACE
      ?auto_985706 - SURFACE
      ?auto_985708 - SURFACE
      ?auto_985707 - SURFACE
      ?auto_985709 - SURFACE
      ?auto_985710 - SURFACE
      ?auto_985711 - SURFACE
      ?auto_985712 - SURFACE
    )
    :vars
    (
      ?auto_985718 - HOIST
      ?auto_985713 - PLACE
      ?auto_985717 - TRUCK
      ?auto_985716 - PLACE
      ?auto_985715 - HOIST
      ?auto_985714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_985718 ?auto_985713 ) ( SURFACE-AT ?auto_985711 ?auto_985713 ) ( CLEAR ?auto_985711 ) ( IS-CRATE ?auto_985712 ) ( not ( = ?auto_985711 ?auto_985712 ) ) ( AVAILABLE ?auto_985718 ) ( ON ?auto_985711 ?auto_985710 ) ( not ( = ?auto_985710 ?auto_985711 ) ) ( not ( = ?auto_985710 ?auto_985712 ) ) ( TRUCK-AT ?auto_985717 ?auto_985716 ) ( not ( = ?auto_985716 ?auto_985713 ) ) ( HOIST-AT ?auto_985715 ?auto_985716 ) ( not ( = ?auto_985718 ?auto_985715 ) ) ( AVAILABLE ?auto_985715 ) ( SURFACE-AT ?auto_985712 ?auto_985716 ) ( ON ?auto_985712 ?auto_985714 ) ( CLEAR ?auto_985712 ) ( not ( = ?auto_985711 ?auto_985714 ) ) ( not ( = ?auto_985712 ?auto_985714 ) ) ( not ( = ?auto_985710 ?auto_985714 ) ) ( ON ?auto_985705 ?auto_985704 ) ( ON ?auto_985706 ?auto_985705 ) ( ON ?auto_985708 ?auto_985706 ) ( ON ?auto_985707 ?auto_985708 ) ( ON ?auto_985709 ?auto_985707 ) ( ON ?auto_985710 ?auto_985709 ) ( not ( = ?auto_985704 ?auto_985705 ) ) ( not ( = ?auto_985704 ?auto_985706 ) ) ( not ( = ?auto_985704 ?auto_985708 ) ) ( not ( = ?auto_985704 ?auto_985707 ) ) ( not ( = ?auto_985704 ?auto_985709 ) ) ( not ( = ?auto_985704 ?auto_985710 ) ) ( not ( = ?auto_985704 ?auto_985711 ) ) ( not ( = ?auto_985704 ?auto_985712 ) ) ( not ( = ?auto_985704 ?auto_985714 ) ) ( not ( = ?auto_985705 ?auto_985706 ) ) ( not ( = ?auto_985705 ?auto_985708 ) ) ( not ( = ?auto_985705 ?auto_985707 ) ) ( not ( = ?auto_985705 ?auto_985709 ) ) ( not ( = ?auto_985705 ?auto_985710 ) ) ( not ( = ?auto_985705 ?auto_985711 ) ) ( not ( = ?auto_985705 ?auto_985712 ) ) ( not ( = ?auto_985705 ?auto_985714 ) ) ( not ( = ?auto_985706 ?auto_985708 ) ) ( not ( = ?auto_985706 ?auto_985707 ) ) ( not ( = ?auto_985706 ?auto_985709 ) ) ( not ( = ?auto_985706 ?auto_985710 ) ) ( not ( = ?auto_985706 ?auto_985711 ) ) ( not ( = ?auto_985706 ?auto_985712 ) ) ( not ( = ?auto_985706 ?auto_985714 ) ) ( not ( = ?auto_985708 ?auto_985707 ) ) ( not ( = ?auto_985708 ?auto_985709 ) ) ( not ( = ?auto_985708 ?auto_985710 ) ) ( not ( = ?auto_985708 ?auto_985711 ) ) ( not ( = ?auto_985708 ?auto_985712 ) ) ( not ( = ?auto_985708 ?auto_985714 ) ) ( not ( = ?auto_985707 ?auto_985709 ) ) ( not ( = ?auto_985707 ?auto_985710 ) ) ( not ( = ?auto_985707 ?auto_985711 ) ) ( not ( = ?auto_985707 ?auto_985712 ) ) ( not ( = ?auto_985707 ?auto_985714 ) ) ( not ( = ?auto_985709 ?auto_985710 ) ) ( not ( = ?auto_985709 ?auto_985711 ) ) ( not ( = ?auto_985709 ?auto_985712 ) ) ( not ( = ?auto_985709 ?auto_985714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_985710 ?auto_985711 ?auto_985712 )
      ( MAKE-8CRATE-VERIFY ?auto_985704 ?auto_985705 ?auto_985706 ?auto_985708 ?auto_985707 ?auto_985709 ?auto_985710 ?auto_985711 ?auto_985712 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985797 - SURFACE
      ?auto_985798 - SURFACE
      ?auto_985799 - SURFACE
      ?auto_985801 - SURFACE
      ?auto_985800 - SURFACE
      ?auto_985802 - SURFACE
      ?auto_985803 - SURFACE
      ?auto_985804 - SURFACE
      ?auto_985805 - SURFACE
    )
    :vars
    (
      ?auto_985811 - HOIST
      ?auto_985809 - PLACE
      ?auto_985806 - PLACE
      ?auto_985808 - HOIST
      ?auto_985810 - SURFACE
      ?auto_985807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_985811 ?auto_985809 ) ( SURFACE-AT ?auto_985804 ?auto_985809 ) ( CLEAR ?auto_985804 ) ( IS-CRATE ?auto_985805 ) ( not ( = ?auto_985804 ?auto_985805 ) ) ( AVAILABLE ?auto_985811 ) ( ON ?auto_985804 ?auto_985803 ) ( not ( = ?auto_985803 ?auto_985804 ) ) ( not ( = ?auto_985803 ?auto_985805 ) ) ( not ( = ?auto_985806 ?auto_985809 ) ) ( HOIST-AT ?auto_985808 ?auto_985806 ) ( not ( = ?auto_985811 ?auto_985808 ) ) ( AVAILABLE ?auto_985808 ) ( SURFACE-AT ?auto_985805 ?auto_985806 ) ( ON ?auto_985805 ?auto_985810 ) ( CLEAR ?auto_985805 ) ( not ( = ?auto_985804 ?auto_985810 ) ) ( not ( = ?auto_985805 ?auto_985810 ) ) ( not ( = ?auto_985803 ?auto_985810 ) ) ( TRUCK-AT ?auto_985807 ?auto_985809 ) ( ON ?auto_985798 ?auto_985797 ) ( ON ?auto_985799 ?auto_985798 ) ( ON ?auto_985801 ?auto_985799 ) ( ON ?auto_985800 ?auto_985801 ) ( ON ?auto_985802 ?auto_985800 ) ( ON ?auto_985803 ?auto_985802 ) ( not ( = ?auto_985797 ?auto_985798 ) ) ( not ( = ?auto_985797 ?auto_985799 ) ) ( not ( = ?auto_985797 ?auto_985801 ) ) ( not ( = ?auto_985797 ?auto_985800 ) ) ( not ( = ?auto_985797 ?auto_985802 ) ) ( not ( = ?auto_985797 ?auto_985803 ) ) ( not ( = ?auto_985797 ?auto_985804 ) ) ( not ( = ?auto_985797 ?auto_985805 ) ) ( not ( = ?auto_985797 ?auto_985810 ) ) ( not ( = ?auto_985798 ?auto_985799 ) ) ( not ( = ?auto_985798 ?auto_985801 ) ) ( not ( = ?auto_985798 ?auto_985800 ) ) ( not ( = ?auto_985798 ?auto_985802 ) ) ( not ( = ?auto_985798 ?auto_985803 ) ) ( not ( = ?auto_985798 ?auto_985804 ) ) ( not ( = ?auto_985798 ?auto_985805 ) ) ( not ( = ?auto_985798 ?auto_985810 ) ) ( not ( = ?auto_985799 ?auto_985801 ) ) ( not ( = ?auto_985799 ?auto_985800 ) ) ( not ( = ?auto_985799 ?auto_985802 ) ) ( not ( = ?auto_985799 ?auto_985803 ) ) ( not ( = ?auto_985799 ?auto_985804 ) ) ( not ( = ?auto_985799 ?auto_985805 ) ) ( not ( = ?auto_985799 ?auto_985810 ) ) ( not ( = ?auto_985801 ?auto_985800 ) ) ( not ( = ?auto_985801 ?auto_985802 ) ) ( not ( = ?auto_985801 ?auto_985803 ) ) ( not ( = ?auto_985801 ?auto_985804 ) ) ( not ( = ?auto_985801 ?auto_985805 ) ) ( not ( = ?auto_985801 ?auto_985810 ) ) ( not ( = ?auto_985800 ?auto_985802 ) ) ( not ( = ?auto_985800 ?auto_985803 ) ) ( not ( = ?auto_985800 ?auto_985804 ) ) ( not ( = ?auto_985800 ?auto_985805 ) ) ( not ( = ?auto_985800 ?auto_985810 ) ) ( not ( = ?auto_985802 ?auto_985803 ) ) ( not ( = ?auto_985802 ?auto_985804 ) ) ( not ( = ?auto_985802 ?auto_985805 ) ) ( not ( = ?auto_985802 ?auto_985810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_985803 ?auto_985804 ?auto_985805 )
      ( MAKE-8CRATE-VERIFY ?auto_985797 ?auto_985798 ?auto_985799 ?auto_985801 ?auto_985800 ?auto_985802 ?auto_985803 ?auto_985804 ?auto_985805 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985890 - SURFACE
      ?auto_985891 - SURFACE
      ?auto_985892 - SURFACE
      ?auto_985894 - SURFACE
      ?auto_985893 - SURFACE
      ?auto_985895 - SURFACE
      ?auto_985896 - SURFACE
      ?auto_985897 - SURFACE
      ?auto_985898 - SURFACE
    )
    :vars
    (
      ?auto_985900 - HOIST
      ?auto_985902 - PLACE
      ?auto_985903 - PLACE
      ?auto_985899 - HOIST
      ?auto_985901 - SURFACE
      ?auto_985904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_985900 ?auto_985902 ) ( IS-CRATE ?auto_985898 ) ( not ( = ?auto_985897 ?auto_985898 ) ) ( not ( = ?auto_985896 ?auto_985897 ) ) ( not ( = ?auto_985896 ?auto_985898 ) ) ( not ( = ?auto_985903 ?auto_985902 ) ) ( HOIST-AT ?auto_985899 ?auto_985903 ) ( not ( = ?auto_985900 ?auto_985899 ) ) ( AVAILABLE ?auto_985899 ) ( SURFACE-AT ?auto_985898 ?auto_985903 ) ( ON ?auto_985898 ?auto_985901 ) ( CLEAR ?auto_985898 ) ( not ( = ?auto_985897 ?auto_985901 ) ) ( not ( = ?auto_985898 ?auto_985901 ) ) ( not ( = ?auto_985896 ?auto_985901 ) ) ( TRUCK-AT ?auto_985904 ?auto_985902 ) ( SURFACE-AT ?auto_985896 ?auto_985902 ) ( CLEAR ?auto_985896 ) ( LIFTING ?auto_985900 ?auto_985897 ) ( IS-CRATE ?auto_985897 ) ( ON ?auto_985891 ?auto_985890 ) ( ON ?auto_985892 ?auto_985891 ) ( ON ?auto_985894 ?auto_985892 ) ( ON ?auto_985893 ?auto_985894 ) ( ON ?auto_985895 ?auto_985893 ) ( ON ?auto_985896 ?auto_985895 ) ( not ( = ?auto_985890 ?auto_985891 ) ) ( not ( = ?auto_985890 ?auto_985892 ) ) ( not ( = ?auto_985890 ?auto_985894 ) ) ( not ( = ?auto_985890 ?auto_985893 ) ) ( not ( = ?auto_985890 ?auto_985895 ) ) ( not ( = ?auto_985890 ?auto_985896 ) ) ( not ( = ?auto_985890 ?auto_985897 ) ) ( not ( = ?auto_985890 ?auto_985898 ) ) ( not ( = ?auto_985890 ?auto_985901 ) ) ( not ( = ?auto_985891 ?auto_985892 ) ) ( not ( = ?auto_985891 ?auto_985894 ) ) ( not ( = ?auto_985891 ?auto_985893 ) ) ( not ( = ?auto_985891 ?auto_985895 ) ) ( not ( = ?auto_985891 ?auto_985896 ) ) ( not ( = ?auto_985891 ?auto_985897 ) ) ( not ( = ?auto_985891 ?auto_985898 ) ) ( not ( = ?auto_985891 ?auto_985901 ) ) ( not ( = ?auto_985892 ?auto_985894 ) ) ( not ( = ?auto_985892 ?auto_985893 ) ) ( not ( = ?auto_985892 ?auto_985895 ) ) ( not ( = ?auto_985892 ?auto_985896 ) ) ( not ( = ?auto_985892 ?auto_985897 ) ) ( not ( = ?auto_985892 ?auto_985898 ) ) ( not ( = ?auto_985892 ?auto_985901 ) ) ( not ( = ?auto_985894 ?auto_985893 ) ) ( not ( = ?auto_985894 ?auto_985895 ) ) ( not ( = ?auto_985894 ?auto_985896 ) ) ( not ( = ?auto_985894 ?auto_985897 ) ) ( not ( = ?auto_985894 ?auto_985898 ) ) ( not ( = ?auto_985894 ?auto_985901 ) ) ( not ( = ?auto_985893 ?auto_985895 ) ) ( not ( = ?auto_985893 ?auto_985896 ) ) ( not ( = ?auto_985893 ?auto_985897 ) ) ( not ( = ?auto_985893 ?auto_985898 ) ) ( not ( = ?auto_985893 ?auto_985901 ) ) ( not ( = ?auto_985895 ?auto_985896 ) ) ( not ( = ?auto_985895 ?auto_985897 ) ) ( not ( = ?auto_985895 ?auto_985898 ) ) ( not ( = ?auto_985895 ?auto_985901 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_985896 ?auto_985897 ?auto_985898 )
      ( MAKE-8CRATE-VERIFY ?auto_985890 ?auto_985891 ?auto_985892 ?auto_985894 ?auto_985893 ?auto_985895 ?auto_985896 ?auto_985897 ?auto_985898 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_985983 - SURFACE
      ?auto_985984 - SURFACE
      ?auto_985985 - SURFACE
      ?auto_985987 - SURFACE
      ?auto_985986 - SURFACE
      ?auto_985988 - SURFACE
      ?auto_985989 - SURFACE
      ?auto_985990 - SURFACE
      ?auto_985991 - SURFACE
    )
    :vars
    (
      ?auto_985993 - HOIST
      ?auto_985994 - PLACE
      ?auto_985996 - PLACE
      ?auto_985992 - HOIST
      ?auto_985997 - SURFACE
      ?auto_985995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_985993 ?auto_985994 ) ( IS-CRATE ?auto_985991 ) ( not ( = ?auto_985990 ?auto_985991 ) ) ( not ( = ?auto_985989 ?auto_985990 ) ) ( not ( = ?auto_985989 ?auto_985991 ) ) ( not ( = ?auto_985996 ?auto_985994 ) ) ( HOIST-AT ?auto_985992 ?auto_985996 ) ( not ( = ?auto_985993 ?auto_985992 ) ) ( AVAILABLE ?auto_985992 ) ( SURFACE-AT ?auto_985991 ?auto_985996 ) ( ON ?auto_985991 ?auto_985997 ) ( CLEAR ?auto_985991 ) ( not ( = ?auto_985990 ?auto_985997 ) ) ( not ( = ?auto_985991 ?auto_985997 ) ) ( not ( = ?auto_985989 ?auto_985997 ) ) ( TRUCK-AT ?auto_985995 ?auto_985994 ) ( SURFACE-AT ?auto_985989 ?auto_985994 ) ( CLEAR ?auto_985989 ) ( IS-CRATE ?auto_985990 ) ( AVAILABLE ?auto_985993 ) ( IN ?auto_985990 ?auto_985995 ) ( ON ?auto_985984 ?auto_985983 ) ( ON ?auto_985985 ?auto_985984 ) ( ON ?auto_985987 ?auto_985985 ) ( ON ?auto_985986 ?auto_985987 ) ( ON ?auto_985988 ?auto_985986 ) ( ON ?auto_985989 ?auto_985988 ) ( not ( = ?auto_985983 ?auto_985984 ) ) ( not ( = ?auto_985983 ?auto_985985 ) ) ( not ( = ?auto_985983 ?auto_985987 ) ) ( not ( = ?auto_985983 ?auto_985986 ) ) ( not ( = ?auto_985983 ?auto_985988 ) ) ( not ( = ?auto_985983 ?auto_985989 ) ) ( not ( = ?auto_985983 ?auto_985990 ) ) ( not ( = ?auto_985983 ?auto_985991 ) ) ( not ( = ?auto_985983 ?auto_985997 ) ) ( not ( = ?auto_985984 ?auto_985985 ) ) ( not ( = ?auto_985984 ?auto_985987 ) ) ( not ( = ?auto_985984 ?auto_985986 ) ) ( not ( = ?auto_985984 ?auto_985988 ) ) ( not ( = ?auto_985984 ?auto_985989 ) ) ( not ( = ?auto_985984 ?auto_985990 ) ) ( not ( = ?auto_985984 ?auto_985991 ) ) ( not ( = ?auto_985984 ?auto_985997 ) ) ( not ( = ?auto_985985 ?auto_985987 ) ) ( not ( = ?auto_985985 ?auto_985986 ) ) ( not ( = ?auto_985985 ?auto_985988 ) ) ( not ( = ?auto_985985 ?auto_985989 ) ) ( not ( = ?auto_985985 ?auto_985990 ) ) ( not ( = ?auto_985985 ?auto_985991 ) ) ( not ( = ?auto_985985 ?auto_985997 ) ) ( not ( = ?auto_985987 ?auto_985986 ) ) ( not ( = ?auto_985987 ?auto_985988 ) ) ( not ( = ?auto_985987 ?auto_985989 ) ) ( not ( = ?auto_985987 ?auto_985990 ) ) ( not ( = ?auto_985987 ?auto_985991 ) ) ( not ( = ?auto_985987 ?auto_985997 ) ) ( not ( = ?auto_985986 ?auto_985988 ) ) ( not ( = ?auto_985986 ?auto_985989 ) ) ( not ( = ?auto_985986 ?auto_985990 ) ) ( not ( = ?auto_985986 ?auto_985991 ) ) ( not ( = ?auto_985986 ?auto_985997 ) ) ( not ( = ?auto_985988 ?auto_985989 ) ) ( not ( = ?auto_985988 ?auto_985990 ) ) ( not ( = ?auto_985988 ?auto_985991 ) ) ( not ( = ?auto_985988 ?auto_985997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_985989 ?auto_985990 ?auto_985991 )
      ( MAKE-8CRATE-VERIFY ?auto_985983 ?auto_985984 ?auto_985985 ?auto_985987 ?auto_985986 ?auto_985988 ?auto_985989 ?auto_985990 ?auto_985991 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990099 - SURFACE
      ?auto_990100 - SURFACE
      ?auto_990101 - SURFACE
      ?auto_990103 - SURFACE
      ?auto_990102 - SURFACE
      ?auto_990104 - SURFACE
      ?auto_990105 - SURFACE
      ?auto_990106 - SURFACE
      ?auto_990107 - SURFACE
      ?auto_990108 - SURFACE
    )
    :vars
    (
      ?auto_990110 - HOIST
      ?auto_990109 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_990110 ?auto_990109 ) ( SURFACE-AT ?auto_990107 ?auto_990109 ) ( CLEAR ?auto_990107 ) ( LIFTING ?auto_990110 ?auto_990108 ) ( IS-CRATE ?auto_990108 ) ( not ( = ?auto_990107 ?auto_990108 ) ) ( ON ?auto_990100 ?auto_990099 ) ( ON ?auto_990101 ?auto_990100 ) ( ON ?auto_990103 ?auto_990101 ) ( ON ?auto_990102 ?auto_990103 ) ( ON ?auto_990104 ?auto_990102 ) ( ON ?auto_990105 ?auto_990104 ) ( ON ?auto_990106 ?auto_990105 ) ( ON ?auto_990107 ?auto_990106 ) ( not ( = ?auto_990099 ?auto_990100 ) ) ( not ( = ?auto_990099 ?auto_990101 ) ) ( not ( = ?auto_990099 ?auto_990103 ) ) ( not ( = ?auto_990099 ?auto_990102 ) ) ( not ( = ?auto_990099 ?auto_990104 ) ) ( not ( = ?auto_990099 ?auto_990105 ) ) ( not ( = ?auto_990099 ?auto_990106 ) ) ( not ( = ?auto_990099 ?auto_990107 ) ) ( not ( = ?auto_990099 ?auto_990108 ) ) ( not ( = ?auto_990100 ?auto_990101 ) ) ( not ( = ?auto_990100 ?auto_990103 ) ) ( not ( = ?auto_990100 ?auto_990102 ) ) ( not ( = ?auto_990100 ?auto_990104 ) ) ( not ( = ?auto_990100 ?auto_990105 ) ) ( not ( = ?auto_990100 ?auto_990106 ) ) ( not ( = ?auto_990100 ?auto_990107 ) ) ( not ( = ?auto_990100 ?auto_990108 ) ) ( not ( = ?auto_990101 ?auto_990103 ) ) ( not ( = ?auto_990101 ?auto_990102 ) ) ( not ( = ?auto_990101 ?auto_990104 ) ) ( not ( = ?auto_990101 ?auto_990105 ) ) ( not ( = ?auto_990101 ?auto_990106 ) ) ( not ( = ?auto_990101 ?auto_990107 ) ) ( not ( = ?auto_990101 ?auto_990108 ) ) ( not ( = ?auto_990103 ?auto_990102 ) ) ( not ( = ?auto_990103 ?auto_990104 ) ) ( not ( = ?auto_990103 ?auto_990105 ) ) ( not ( = ?auto_990103 ?auto_990106 ) ) ( not ( = ?auto_990103 ?auto_990107 ) ) ( not ( = ?auto_990103 ?auto_990108 ) ) ( not ( = ?auto_990102 ?auto_990104 ) ) ( not ( = ?auto_990102 ?auto_990105 ) ) ( not ( = ?auto_990102 ?auto_990106 ) ) ( not ( = ?auto_990102 ?auto_990107 ) ) ( not ( = ?auto_990102 ?auto_990108 ) ) ( not ( = ?auto_990104 ?auto_990105 ) ) ( not ( = ?auto_990104 ?auto_990106 ) ) ( not ( = ?auto_990104 ?auto_990107 ) ) ( not ( = ?auto_990104 ?auto_990108 ) ) ( not ( = ?auto_990105 ?auto_990106 ) ) ( not ( = ?auto_990105 ?auto_990107 ) ) ( not ( = ?auto_990105 ?auto_990108 ) ) ( not ( = ?auto_990106 ?auto_990107 ) ) ( not ( = ?auto_990106 ?auto_990108 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_990107 ?auto_990108 )
      ( MAKE-9CRATE-VERIFY ?auto_990099 ?auto_990100 ?auto_990101 ?auto_990103 ?auto_990102 ?auto_990104 ?auto_990105 ?auto_990106 ?auto_990107 ?auto_990108 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990179 - SURFACE
      ?auto_990180 - SURFACE
      ?auto_990181 - SURFACE
      ?auto_990183 - SURFACE
      ?auto_990182 - SURFACE
      ?auto_990184 - SURFACE
      ?auto_990185 - SURFACE
      ?auto_990186 - SURFACE
      ?auto_990187 - SURFACE
      ?auto_990188 - SURFACE
    )
    :vars
    (
      ?auto_990190 - HOIST
      ?auto_990189 - PLACE
      ?auto_990191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_990190 ?auto_990189 ) ( SURFACE-AT ?auto_990187 ?auto_990189 ) ( CLEAR ?auto_990187 ) ( IS-CRATE ?auto_990188 ) ( not ( = ?auto_990187 ?auto_990188 ) ) ( TRUCK-AT ?auto_990191 ?auto_990189 ) ( AVAILABLE ?auto_990190 ) ( IN ?auto_990188 ?auto_990191 ) ( ON ?auto_990187 ?auto_990186 ) ( not ( = ?auto_990186 ?auto_990187 ) ) ( not ( = ?auto_990186 ?auto_990188 ) ) ( ON ?auto_990180 ?auto_990179 ) ( ON ?auto_990181 ?auto_990180 ) ( ON ?auto_990183 ?auto_990181 ) ( ON ?auto_990182 ?auto_990183 ) ( ON ?auto_990184 ?auto_990182 ) ( ON ?auto_990185 ?auto_990184 ) ( ON ?auto_990186 ?auto_990185 ) ( not ( = ?auto_990179 ?auto_990180 ) ) ( not ( = ?auto_990179 ?auto_990181 ) ) ( not ( = ?auto_990179 ?auto_990183 ) ) ( not ( = ?auto_990179 ?auto_990182 ) ) ( not ( = ?auto_990179 ?auto_990184 ) ) ( not ( = ?auto_990179 ?auto_990185 ) ) ( not ( = ?auto_990179 ?auto_990186 ) ) ( not ( = ?auto_990179 ?auto_990187 ) ) ( not ( = ?auto_990179 ?auto_990188 ) ) ( not ( = ?auto_990180 ?auto_990181 ) ) ( not ( = ?auto_990180 ?auto_990183 ) ) ( not ( = ?auto_990180 ?auto_990182 ) ) ( not ( = ?auto_990180 ?auto_990184 ) ) ( not ( = ?auto_990180 ?auto_990185 ) ) ( not ( = ?auto_990180 ?auto_990186 ) ) ( not ( = ?auto_990180 ?auto_990187 ) ) ( not ( = ?auto_990180 ?auto_990188 ) ) ( not ( = ?auto_990181 ?auto_990183 ) ) ( not ( = ?auto_990181 ?auto_990182 ) ) ( not ( = ?auto_990181 ?auto_990184 ) ) ( not ( = ?auto_990181 ?auto_990185 ) ) ( not ( = ?auto_990181 ?auto_990186 ) ) ( not ( = ?auto_990181 ?auto_990187 ) ) ( not ( = ?auto_990181 ?auto_990188 ) ) ( not ( = ?auto_990183 ?auto_990182 ) ) ( not ( = ?auto_990183 ?auto_990184 ) ) ( not ( = ?auto_990183 ?auto_990185 ) ) ( not ( = ?auto_990183 ?auto_990186 ) ) ( not ( = ?auto_990183 ?auto_990187 ) ) ( not ( = ?auto_990183 ?auto_990188 ) ) ( not ( = ?auto_990182 ?auto_990184 ) ) ( not ( = ?auto_990182 ?auto_990185 ) ) ( not ( = ?auto_990182 ?auto_990186 ) ) ( not ( = ?auto_990182 ?auto_990187 ) ) ( not ( = ?auto_990182 ?auto_990188 ) ) ( not ( = ?auto_990184 ?auto_990185 ) ) ( not ( = ?auto_990184 ?auto_990186 ) ) ( not ( = ?auto_990184 ?auto_990187 ) ) ( not ( = ?auto_990184 ?auto_990188 ) ) ( not ( = ?auto_990185 ?auto_990186 ) ) ( not ( = ?auto_990185 ?auto_990187 ) ) ( not ( = ?auto_990185 ?auto_990188 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990186 ?auto_990187 ?auto_990188 )
      ( MAKE-9CRATE-VERIFY ?auto_990179 ?auto_990180 ?auto_990181 ?auto_990183 ?auto_990182 ?auto_990184 ?auto_990185 ?auto_990186 ?auto_990187 ?auto_990188 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990269 - SURFACE
      ?auto_990270 - SURFACE
      ?auto_990271 - SURFACE
      ?auto_990273 - SURFACE
      ?auto_990272 - SURFACE
      ?auto_990274 - SURFACE
      ?auto_990275 - SURFACE
      ?auto_990276 - SURFACE
      ?auto_990277 - SURFACE
      ?auto_990278 - SURFACE
    )
    :vars
    (
      ?auto_990281 - HOIST
      ?auto_990279 - PLACE
      ?auto_990280 - TRUCK
      ?auto_990282 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_990281 ?auto_990279 ) ( SURFACE-AT ?auto_990277 ?auto_990279 ) ( CLEAR ?auto_990277 ) ( IS-CRATE ?auto_990278 ) ( not ( = ?auto_990277 ?auto_990278 ) ) ( AVAILABLE ?auto_990281 ) ( IN ?auto_990278 ?auto_990280 ) ( ON ?auto_990277 ?auto_990276 ) ( not ( = ?auto_990276 ?auto_990277 ) ) ( not ( = ?auto_990276 ?auto_990278 ) ) ( TRUCK-AT ?auto_990280 ?auto_990282 ) ( not ( = ?auto_990282 ?auto_990279 ) ) ( ON ?auto_990270 ?auto_990269 ) ( ON ?auto_990271 ?auto_990270 ) ( ON ?auto_990273 ?auto_990271 ) ( ON ?auto_990272 ?auto_990273 ) ( ON ?auto_990274 ?auto_990272 ) ( ON ?auto_990275 ?auto_990274 ) ( ON ?auto_990276 ?auto_990275 ) ( not ( = ?auto_990269 ?auto_990270 ) ) ( not ( = ?auto_990269 ?auto_990271 ) ) ( not ( = ?auto_990269 ?auto_990273 ) ) ( not ( = ?auto_990269 ?auto_990272 ) ) ( not ( = ?auto_990269 ?auto_990274 ) ) ( not ( = ?auto_990269 ?auto_990275 ) ) ( not ( = ?auto_990269 ?auto_990276 ) ) ( not ( = ?auto_990269 ?auto_990277 ) ) ( not ( = ?auto_990269 ?auto_990278 ) ) ( not ( = ?auto_990270 ?auto_990271 ) ) ( not ( = ?auto_990270 ?auto_990273 ) ) ( not ( = ?auto_990270 ?auto_990272 ) ) ( not ( = ?auto_990270 ?auto_990274 ) ) ( not ( = ?auto_990270 ?auto_990275 ) ) ( not ( = ?auto_990270 ?auto_990276 ) ) ( not ( = ?auto_990270 ?auto_990277 ) ) ( not ( = ?auto_990270 ?auto_990278 ) ) ( not ( = ?auto_990271 ?auto_990273 ) ) ( not ( = ?auto_990271 ?auto_990272 ) ) ( not ( = ?auto_990271 ?auto_990274 ) ) ( not ( = ?auto_990271 ?auto_990275 ) ) ( not ( = ?auto_990271 ?auto_990276 ) ) ( not ( = ?auto_990271 ?auto_990277 ) ) ( not ( = ?auto_990271 ?auto_990278 ) ) ( not ( = ?auto_990273 ?auto_990272 ) ) ( not ( = ?auto_990273 ?auto_990274 ) ) ( not ( = ?auto_990273 ?auto_990275 ) ) ( not ( = ?auto_990273 ?auto_990276 ) ) ( not ( = ?auto_990273 ?auto_990277 ) ) ( not ( = ?auto_990273 ?auto_990278 ) ) ( not ( = ?auto_990272 ?auto_990274 ) ) ( not ( = ?auto_990272 ?auto_990275 ) ) ( not ( = ?auto_990272 ?auto_990276 ) ) ( not ( = ?auto_990272 ?auto_990277 ) ) ( not ( = ?auto_990272 ?auto_990278 ) ) ( not ( = ?auto_990274 ?auto_990275 ) ) ( not ( = ?auto_990274 ?auto_990276 ) ) ( not ( = ?auto_990274 ?auto_990277 ) ) ( not ( = ?auto_990274 ?auto_990278 ) ) ( not ( = ?auto_990275 ?auto_990276 ) ) ( not ( = ?auto_990275 ?auto_990277 ) ) ( not ( = ?auto_990275 ?auto_990278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990276 ?auto_990277 ?auto_990278 )
      ( MAKE-9CRATE-VERIFY ?auto_990269 ?auto_990270 ?auto_990271 ?auto_990273 ?auto_990272 ?auto_990274 ?auto_990275 ?auto_990276 ?auto_990277 ?auto_990278 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990368 - SURFACE
      ?auto_990369 - SURFACE
      ?auto_990370 - SURFACE
      ?auto_990372 - SURFACE
      ?auto_990371 - SURFACE
      ?auto_990373 - SURFACE
      ?auto_990374 - SURFACE
      ?auto_990375 - SURFACE
      ?auto_990376 - SURFACE
      ?auto_990377 - SURFACE
    )
    :vars
    (
      ?auto_990378 - HOIST
      ?auto_990381 - PLACE
      ?auto_990382 - TRUCK
      ?auto_990379 - PLACE
      ?auto_990380 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_990378 ?auto_990381 ) ( SURFACE-AT ?auto_990376 ?auto_990381 ) ( CLEAR ?auto_990376 ) ( IS-CRATE ?auto_990377 ) ( not ( = ?auto_990376 ?auto_990377 ) ) ( AVAILABLE ?auto_990378 ) ( ON ?auto_990376 ?auto_990375 ) ( not ( = ?auto_990375 ?auto_990376 ) ) ( not ( = ?auto_990375 ?auto_990377 ) ) ( TRUCK-AT ?auto_990382 ?auto_990379 ) ( not ( = ?auto_990379 ?auto_990381 ) ) ( HOIST-AT ?auto_990380 ?auto_990379 ) ( LIFTING ?auto_990380 ?auto_990377 ) ( not ( = ?auto_990378 ?auto_990380 ) ) ( ON ?auto_990369 ?auto_990368 ) ( ON ?auto_990370 ?auto_990369 ) ( ON ?auto_990372 ?auto_990370 ) ( ON ?auto_990371 ?auto_990372 ) ( ON ?auto_990373 ?auto_990371 ) ( ON ?auto_990374 ?auto_990373 ) ( ON ?auto_990375 ?auto_990374 ) ( not ( = ?auto_990368 ?auto_990369 ) ) ( not ( = ?auto_990368 ?auto_990370 ) ) ( not ( = ?auto_990368 ?auto_990372 ) ) ( not ( = ?auto_990368 ?auto_990371 ) ) ( not ( = ?auto_990368 ?auto_990373 ) ) ( not ( = ?auto_990368 ?auto_990374 ) ) ( not ( = ?auto_990368 ?auto_990375 ) ) ( not ( = ?auto_990368 ?auto_990376 ) ) ( not ( = ?auto_990368 ?auto_990377 ) ) ( not ( = ?auto_990369 ?auto_990370 ) ) ( not ( = ?auto_990369 ?auto_990372 ) ) ( not ( = ?auto_990369 ?auto_990371 ) ) ( not ( = ?auto_990369 ?auto_990373 ) ) ( not ( = ?auto_990369 ?auto_990374 ) ) ( not ( = ?auto_990369 ?auto_990375 ) ) ( not ( = ?auto_990369 ?auto_990376 ) ) ( not ( = ?auto_990369 ?auto_990377 ) ) ( not ( = ?auto_990370 ?auto_990372 ) ) ( not ( = ?auto_990370 ?auto_990371 ) ) ( not ( = ?auto_990370 ?auto_990373 ) ) ( not ( = ?auto_990370 ?auto_990374 ) ) ( not ( = ?auto_990370 ?auto_990375 ) ) ( not ( = ?auto_990370 ?auto_990376 ) ) ( not ( = ?auto_990370 ?auto_990377 ) ) ( not ( = ?auto_990372 ?auto_990371 ) ) ( not ( = ?auto_990372 ?auto_990373 ) ) ( not ( = ?auto_990372 ?auto_990374 ) ) ( not ( = ?auto_990372 ?auto_990375 ) ) ( not ( = ?auto_990372 ?auto_990376 ) ) ( not ( = ?auto_990372 ?auto_990377 ) ) ( not ( = ?auto_990371 ?auto_990373 ) ) ( not ( = ?auto_990371 ?auto_990374 ) ) ( not ( = ?auto_990371 ?auto_990375 ) ) ( not ( = ?auto_990371 ?auto_990376 ) ) ( not ( = ?auto_990371 ?auto_990377 ) ) ( not ( = ?auto_990373 ?auto_990374 ) ) ( not ( = ?auto_990373 ?auto_990375 ) ) ( not ( = ?auto_990373 ?auto_990376 ) ) ( not ( = ?auto_990373 ?auto_990377 ) ) ( not ( = ?auto_990374 ?auto_990375 ) ) ( not ( = ?auto_990374 ?auto_990376 ) ) ( not ( = ?auto_990374 ?auto_990377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990375 ?auto_990376 ?auto_990377 )
      ( MAKE-9CRATE-VERIFY ?auto_990368 ?auto_990369 ?auto_990370 ?auto_990372 ?auto_990371 ?auto_990373 ?auto_990374 ?auto_990375 ?auto_990376 ?auto_990377 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990476 - SURFACE
      ?auto_990477 - SURFACE
      ?auto_990478 - SURFACE
      ?auto_990480 - SURFACE
      ?auto_990479 - SURFACE
      ?auto_990481 - SURFACE
      ?auto_990482 - SURFACE
      ?auto_990483 - SURFACE
      ?auto_990484 - SURFACE
      ?auto_990485 - SURFACE
    )
    :vars
    (
      ?auto_990489 - HOIST
      ?auto_990490 - PLACE
      ?auto_990487 - TRUCK
      ?auto_990491 - PLACE
      ?auto_990486 - HOIST
      ?auto_990488 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_990489 ?auto_990490 ) ( SURFACE-AT ?auto_990484 ?auto_990490 ) ( CLEAR ?auto_990484 ) ( IS-CRATE ?auto_990485 ) ( not ( = ?auto_990484 ?auto_990485 ) ) ( AVAILABLE ?auto_990489 ) ( ON ?auto_990484 ?auto_990483 ) ( not ( = ?auto_990483 ?auto_990484 ) ) ( not ( = ?auto_990483 ?auto_990485 ) ) ( TRUCK-AT ?auto_990487 ?auto_990491 ) ( not ( = ?auto_990491 ?auto_990490 ) ) ( HOIST-AT ?auto_990486 ?auto_990491 ) ( not ( = ?auto_990489 ?auto_990486 ) ) ( AVAILABLE ?auto_990486 ) ( SURFACE-AT ?auto_990485 ?auto_990491 ) ( ON ?auto_990485 ?auto_990488 ) ( CLEAR ?auto_990485 ) ( not ( = ?auto_990484 ?auto_990488 ) ) ( not ( = ?auto_990485 ?auto_990488 ) ) ( not ( = ?auto_990483 ?auto_990488 ) ) ( ON ?auto_990477 ?auto_990476 ) ( ON ?auto_990478 ?auto_990477 ) ( ON ?auto_990480 ?auto_990478 ) ( ON ?auto_990479 ?auto_990480 ) ( ON ?auto_990481 ?auto_990479 ) ( ON ?auto_990482 ?auto_990481 ) ( ON ?auto_990483 ?auto_990482 ) ( not ( = ?auto_990476 ?auto_990477 ) ) ( not ( = ?auto_990476 ?auto_990478 ) ) ( not ( = ?auto_990476 ?auto_990480 ) ) ( not ( = ?auto_990476 ?auto_990479 ) ) ( not ( = ?auto_990476 ?auto_990481 ) ) ( not ( = ?auto_990476 ?auto_990482 ) ) ( not ( = ?auto_990476 ?auto_990483 ) ) ( not ( = ?auto_990476 ?auto_990484 ) ) ( not ( = ?auto_990476 ?auto_990485 ) ) ( not ( = ?auto_990476 ?auto_990488 ) ) ( not ( = ?auto_990477 ?auto_990478 ) ) ( not ( = ?auto_990477 ?auto_990480 ) ) ( not ( = ?auto_990477 ?auto_990479 ) ) ( not ( = ?auto_990477 ?auto_990481 ) ) ( not ( = ?auto_990477 ?auto_990482 ) ) ( not ( = ?auto_990477 ?auto_990483 ) ) ( not ( = ?auto_990477 ?auto_990484 ) ) ( not ( = ?auto_990477 ?auto_990485 ) ) ( not ( = ?auto_990477 ?auto_990488 ) ) ( not ( = ?auto_990478 ?auto_990480 ) ) ( not ( = ?auto_990478 ?auto_990479 ) ) ( not ( = ?auto_990478 ?auto_990481 ) ) ( not ( = ?auto_990478 ?auto_990482 ) ) ( not ( = ?auto_990478 ?auto_990483 ) ) ( not ( = ?auto_990478 ?auto_990484 ) ) ( not ( = ?auto_990478 ?auto_990485 ) ) ( not ( = ?auto_990478 ?auto_990488 ) ) ( not ( = ?auto_990480 ?auto_990479 ) ) ( not ( = ?auto_990480 ?auto_990481 ) ) ( not ( = ?auto_990480 ?auto_990482 ) ) ( not ( = ?auto_990480 ?auto_990483 ) ) ( not ( = ?auto_990480 ?auto_990484 ) ) ( not ( = ?auto_990480 ?auto_990485 ) ) ( not ( = ?auto_990480 ?auto_990488 ) ) ( not ( = ?auto_990479 ?auto_990481 ) ) ( not ( = ?auto_990479 ?auto_990482 ) ) ( not ( = ?auto_990479 ?auto_990483 ) ) ( not ( = ?auto_990479 ?auto_990484 ) ) ( not ( = ?auto_990479 ?auto_990485 ) ) ( not ( = ?auto_990479 ?auto_990488 ) ) ( not ( = ?auto_990481 ?auto_990482 ) ) ( not ( = ?auto_990481 ?auto_990483 ) ) ( not ( = ?auto_990481 ?auto_990484 ) ) ( not ( = ?auto_990481 ?auto_990485 ) ) ( not ( = ?auto_990481 ?auto_990488 ) ) ( not ( = ?auto_990482 ?auto_990483 ) ) ( not ( = ?auto_990482 ?auto_990484 ) ) ( not ( = ?auto_990482 ?auto_990485 ) ) ( not ( = ?auto_990482 ?auto_990488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990483 ?auto_990484 ?auto_990485 )
      ( MAKE-9CRATE-VERIFY ?auto_990476 ?auto_990477 ?auto_990478 ?auto_990480 ?auto_990479 ?auto_990481 ?auto_990482 ?auto_990483 ?auto_990484 ?auto_990485 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990585 - SURFACE
      ?auto_990586 - SURFACE
      ?auto_990587 - SURFACE
      ?auto_990589 - SURFACE
      ?auto_990588 - SURFACE
      ?auto_990590 - SURFACE
      ?auto_990591 - SURFACE
      ?auto_990592 - SURFACE
      ?auto_990593 - SURFACE
      ?auto_990594 - SURFACE
    )
    :vars
    (
      ?auto_990600 - HOIST
      ?auto_990597 - PLACE
      ?auto_990596 - PLACE
      ?auto_990595 - HOIST
      ?auto_990598 - SURFACE
      ?auto_990599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_990600 ?auto_990597 ) ( SURFACE-AT ?auto_990593 ?auto_990597 ) ( CLEAR ?auto_990593 ) ( IS-CRATE ?auto_990594 ) ( not ( = ?auto_990593 ?auto_990594 ) ) ( AVAILABLE ?auto_990600 ) ( ON ?auto_990593 ?auto_990592 ) ( not ( = ?auto_990592 ?auto_990593 ) ) ( not ( = ?auto_990592 ?auto_990594 ) ) ( not ( = ?auto_990596 ?auto_990597 ) ) ( HOIST-AT ?auto_990595 ?auto_990596 ) ( not ( = ?auto_990600 ?auto_990595 ) ) ( AVAILABLE ?auto_990595 ) ( SURFACE-AT ?auto_990594 ?auto_990596 ) ( ON ?auto_990594 ?auto_990598 ) ( CLEAR ?auto_990594 ) ( not ( = ?auto_990593 ?auto_990598 ) ) ( not ( = ?auto_990594 ?auto_990598 ) ) ( not ( = ?auto_990592 ?auto_990598 ) ) ( TRUCK-AT ?auto_990599 ?auto_990597 ) ( ON ?auto_990586 ?auto_990585 ) ( ON ?auto_990587 ?auto_990586 ) ( ON ?auto_990589 ?auto_990587 ) ( ON ?auto_990588 ?auto_990589 ) ( ON ?auto_990590 ?auto_990588 ) ( ON ?auto_990591 ?auto_990590 ) ( ON ?auto_990592 ?auto_990591 ) ( not ( = ?auto_990585 ?auto_990586 ) ) ( not ( = ?auto_990585 ?auto_990587 ) ) ( not ( = ?auto_990585 ?auto_990589 ) ) ( not ( = ?auto_990585 ?auto_990588 ) ) ( not ( = ?auto_990585 ?auto_990590 ) ) ( not ( = ?auto_990585 ?auto_990591 ) ) ( not ( = ?auto_990585 ?auto_990592 ) ) ( not ( = ?auto_990585 ?auto_990593 ) ) ( not ( = ?auto_990585 ?auto_990594 ) ) ( not ( = ?auto_990585 ?auto_990598 ) ) ( not ( = ?auto_990586 ?auto_990587 ) ) ( not ( = ?auto_990586 ?auto_990589 ) ) ( not ( = ?auto_990586 ?auto_990588 ) ) ( not ( = ?auto_990586 ?auto_990590 ) ) ( not ( = ?auto_990586 ?auto_990591 ) ) ( not ( = ?auto_990586 ?auto_990592 ) ) ( not ( = ?auto_990586 ?auto_990593 ) ) ( not ( = ?auto_990586 ?auto_990594 ) ) ( not ( = ?auto_990586 ?auto_990598 ) ) ( not ( = ?auto_990587 ?auto_990589 ) ) ( not ( = ?auto_990587 ?auto_990588 ) ) ( not ( = ?auto_990587 ?auto_990590 ) ) ( not ( = ?auto_990587 ?auto_990591 ) ) ( not ( = ?auto_990587 ?auto_990592 ) ) ( not ( = ?auto_990587 ?auto_990593 ) ) ( not ( = ?auto_990587 ?auto_990594 ) ) ( not ( = ?auto_990587 ?auto_990598 ) ) ( not ( = ?auto_990589 ?auto_990588 ) ) ( not ( = ?auto_990589 ?auto_990590 ) ) ( not ( = ?auto_990589 ?auto_990591 ) ) ( not ( = ?auto_990589 ?auto_990592 ) ) ( not ( = ?auto_990589 ?auto_990593 ) ) ( not ( = ?auto_990589 ?auto_990594 ) ) ( not ( = ?auto_990589 ?auto_990598 ) ) ( not ( = ?auto_990588 ?auto_990590 ) ) ( not ( = ?auto_990588 ?auto_990591 ) ) ( not ( = ?auto_990588 ?auto_990592 ) ) ( not ( = ?auto_990588 ?auto_990593 ) ) ( not ( = ?auto_990588 ?auto_990594 ) ) ( not ( = ?auto_990588 ?auto_990598 ) ) ( not ( = ?auto_990590 ?auto_990591 ) ) ( not ( = ?auto_990590 ?auto_990592 ) ) ( not ( = ?auto_990590 ?auto_990593 ) ) ( not ( = ?auto_990590 ?auto_990594 ) ) ( not ( = ?auto_990590 ?auto_990598 ) ) ( not ( = ?auto_990591 ?auto_990592 ) ) ( not ( = ?auto_990591 ?auto_990593 ) ) ( not ( = ?auto_990591 ?auto_990594 ) ) ( not ( = ?auto_990591 ?auto_990598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990592 ?auto_990593 ?auto_990594 )
      ( MAKE-9CRATE-VERIFY ?auto_990585 ?auto_990586 ?auto_990587 ?auto_990589 ?auto_990588 ?auto_990590 ?auto_990591 ?auto_990592 ?auto_990593 ?auto_990594 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990694 - SURFACE
      ?auto_990695 - SURFACE
      ?auto_990696 - SURFACE
      ?auto_990698 - SURFACE
      ?auto_990697 - SURFACE
      ?auto_990699 - SURFACE
      ?auto_990700 - SURFACE
      ?auto_990701 - SURFACE
      ?auto_990702 - SURFACE
      ?auto_990703 - SURFACE
    )
    :vars
    (
      ?auto_990706 - HOIST
      ?auto_990709 - PLACE
      ?auto_990705 - PLACE
      ?auto_990704 - HOIST
      ?auto_990707 - SURFACE
      ?auto_990708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_990706 ?auto_990709 ) ( IS-CRATE ?auto_990703 ) ( not ( = ?auto_990702 ?auto_990703 ) ) ( not ( = ?auto_990701 ?auto_990702 ) ) ( not ( = ?auto_990701 ?auto_990703 ) ) ( not ( = ?auto_990705 ?auto_990709 ) ) ( HOIST-AT ?auto_990704 ?auto_990705 ) ( not ( = ?auto_990706 ?auto_990704 ) ) ( AVAILABLE ?auto_990704 ) ( SURFACE-AT ?auto_990703 ?auto_990705 ) ( ON ?auto_990703 ?auto_990707 ) ( CLEAR ?auto_990703 ) ( not ( = ?auto_990702 ?auto_990707 ) ) ( not ( = ?auto_990703 ?auto_990707 ) ) ( not ( = ?auto_990701 ?auto_990707 ) ) ( TRUCK-AT ?auto_990708 ?auto_990709 ) ( SURFACE-AT ?auto_990701 ?auto_990709 ) ( CLEAR ?auto_990701 ) ( LIFTING ?auto_990706 ?auto_990702 ) ( IS-CRATE ?auto_990702 ) ( ON ?auto_990695 ?auto_990694 ) ( ON ?auto_990696 ?auto_990695 ) ( ON ?auto_990698 ?auto_990696 ) ( ON ?auto_990697 ?auto_990698 ) ( ON ?auto_990699 ?auto_990697 ) ( ON ?auto_990700 ?auto_990699 ) ( ON ?auto_990701 ?auto_990700 ) ( not ( = ?auto_990694 ?auto_990695 ) ) ( not ( = ?auto_990694 ?auto_990696 ) ) ( not ( = ?auto_990694 ?auto_990698 ) ) ( not ( = ?auto_990694 ?auto_990697 ) ) ( not ( = ?auto_990694 ?auto_990699 ) ) ( not ( = ?auto_990694 ?auto_990700 ) ) ( not ( = ?auto_990694 ?auto_990701 ) ) ( not ( = ?auto_990694 ?auto_990702 ) ) ( not ( = ?auto_990694 ?auto_990703 ) ) ( not ( = ?auto_990694 ?auto_990707 ) ) ( not ( = ?auto_990695 ?auto_990696 ) ) ( not ( = ?auto_990695 ?auto_990698 ) ) ( not ( = ?auto_990695 ?auto_990697 ) ) ( not ( = ?auto_990695 ?auto_990699 ) ) ( not ( = ?auto_990695 ?auto_990700 ) ) ( not ( = ?auto_990695 ?auto_990701 ) ) ( not ( = ?auto_990695 ?auto_990702 ) ) ( not ( = ?auto_990695 ?auto_990703 ) ) ( not ( = ?auto_990695 ?auto_990707 ) ) ( not ( = ?auto_990696 ?auto_990698 ) ) ( not ( = ?auto_990696 ?auto_990697 ) ) ( not ( = ?auto_990696 ?auto_990699 ) ) ( not ( = ?auto_990696 ?auto_990700 ) ) ( not ( = ?auto_990696 ?auto_990701 ) ) ( not ( = ?auto_990696 ?auto_990702 ) ) ( not ( = ?auto_990696 ?auto_990703 ) ) ( not ( = ?auto_990696 ?auto_990707 ) ) ( not ( = ?auto_990698 ?auto_990697 ) ) ( not ( = ?auto_990698 ?auto_990699 ) ) ( not ( = ?auto_990698 ?auto_990700 ) ) ( not ( = ?auto_990698 ?auto_990701 ) ) ( not ( = ?auto_990698 ?auto_990702 ) ) ( not ( = ?auto_990698 ?auto_990703 ) ) ( not ( = ?auto_990698 ?auto_990707 ) ) ( not ( = ?auto_990697 ?auto_990699 ) ) ( not ( = ?auto_990697 ?auto_990700 ) ) ( not ( = ?auto_990697 ?auto_990701 ) ) ( not ( = ?auto_990697 ?auto_990702 ) ) ( not ( = ?auto_990697 ?auto_990703 ) ) ( not ( = ?auto_990697 ?auto_990707 ) ) ( not ( = ?auto_990699 ?auto_990700 ) ) ( not ( = ?auto_990699 ?auto_990701 ) ) ( not ( = ?auto_990699 ?auto_990702 ) ) ( not ( = ?auto_990699 ?auto_990703 ) ) ( not ( = ?auto_990699 ?auto_990707 ) ) ( not ( = ?auto_990700 ?auto_990701 ) ) ( not ( = ?auto_990700 ?auto_990702 ) ) ( not ( = ?auto_990700 ?auto_990703 ) ) ( not ( = ?auto_990700 ?auto_990707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990701 ?auto_990702 ?auto_990703 )
      ( MAKE-9CRATE-VERIFY ?auto_990694 ?auto_990695 ?auto_990696 ?auto_990698 ?auto_990697 ?auto_990699 ?auto_990700 ?auto_990701 ?auto_990702 ?auto_990703 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_990803 - SURFACE
      ?auto_990804 - SURFACE
      ?auto_990805 - SURFACE
      ?auto_990807 - SURFACE
      ?auto_990806 - SURFACE
      ?auto_990808 - SURFACE
      ?auto_990809 - SURFACE
      ?auto_990810 - SURFACE
      ?auto_990811 - SURFACE
      ?auto_990812 - SURFACE
    )
    :vars
    (
      ?auto_990815 - HOIST
      ?auto_990816 - PLACE
      ?auto_990814 - PLACE
      ?auto_990817 - HOIST
      ?auto_990818 - SURFACE
      ?auto_990813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_990815 ?auto_990816 ) ( IS-CRATE ?auto_990812 ) ( not ( = ?auto_990811 ?auto_990812 ) ) ( not ( = ?auto_990810 ?auto_990811 ) ) ( not ( = ?auto_990810 ?auto_990812 ) ) ( not ( = ?auto_990814 ?auto_990816 ) ) ( HOIST-AT ?auto_990817 ?auto_990814 ) ( not ( = ?auto_990815 ?auto_990817 ) ) ( AVAILABLE ?auto_990817 ) ( SURFACE-AT ?auto_990812 ?auto_990814 ) ( ON ?auto_990812 ?auto_990818 ) ( CLEAR ?auto_990812 ) ( not ( = ?auto_990811 ?auto_990818 ) ) ( not ( = ?auto_990812 ?auto_990818 ) ) ( not ( = ?auto_990810 ?auto_990818 ) ) ( TRUCK-AT ?auto_990813 ?auto_990816 ) ( SURFACE-AT ?auto_990810 ?auto_990816 ) ( CLEAR ?auto_990810 ) ( IS-CRATE ?auto_990811 ) ( AVAILABLE ?auto_990815 ) ( IN ?auto_990811 ?auto_990813 ) ( ON ?auto_990804 ?auto_990803 ) ( ON ?auto_990805 ?auto_990804 ) ( ON ?auto_990807 ?auto_990805 ) ( ON ?auto_990806 ?auto_990807 ) ( ON ?auto_990808 ?auto_990806 ) ( ON ?auto_990809 ?auto_990808 ) ( ON ?auto_990810 ?auto_990809 ) ( not ( = ?auto_990803 ?auto_990804 ) ) ( not ( = ?auto_990803 ?auto_990805 ) ) ( not ( = ?auto_990803 ?auto_990807 ) ) ( not ( = ?auto_990803 ?auto_990806 ) ) ( not ( = ?auto_990803 ?auto_990808 ) ) ( not ( = ?auto_990803 ?auto_990809 ) ) ( not ( = ?auto_990803 ?auto_990810 ) ) ( not ( = ?auto_990803 ?auto_990811 ) ) ( not ( = ?auto_990803 ?auto_990812 ) ) ( not ( = ?auto_990803 ?auto_990818 ) ) ( not ( = ?auto_990804 ?auto_990805 ) ) ( not ( = ?auto_990804 ?auto_990807 ) ) ( not ( = ?auto_990804 ?auto_990806 ) ) ( not ( = ?auto_990804 ?auto_990808 ) ) ( not ( = ?auto_990804 ?auto_990809 ) ) ( not ( = ?auto_990804 ?auto_990810 ) ) ( not ( = ?auto_990804 ?auto_990811 ) ) ( not ( = ?auto_990804 ?auto_990812 ) ) ( not ( = ?auto_990804 ?auto_990818 ) ) ( not ( = ?auto_990805 ?auto_990807 ) ) ( not ( = ?auto_990805 ?auto_990806 ) ) ( not ( = ?auto_990805 ?auto_990808 ) ) ( not ( = ?auto_990805 ?auto_990809 ) ) ( not ( = ?auto_990805 ?auto_990810 ) ) ( not ( = ?auto_990805 ?auto_990811 ) ) ( not ( = ?auto_990805 ?auto_990812 ) ) ( not ( = ?auto_990805 ?auto_990818 ) ) ( not ( = ?auto_990807 ?auto_990806 ) ) ( not ( = ?auto_990807 ?auto_990808 ) ) ( not ( = ?auto_990807 ?auto_990809 ) ) ( not ( = ?auto_990807 ?auto_990810 ) ) ( not ( = ?auto_990807 ?auto_990811 ) ) ( not ( = ?auto_990807 ?auto_990812 ) ) ( not ( = ?auto_990807 ?auto_990818 ) ) ( not ( = ?auto_990806 ?auto_990808 ) ) ( not ( = ?auto_990806 ?auto_990809 ) ) ( not ( = ?auto_990806 ?auto_990810 ) ) ( not ( = ?auto_990806 ?auto_990811 ) ) ( not ( = ?auto_990806 ?auto_990812 ) ) ( not ( = ?auto_990806 ?auto_990818 ) ) ( not ( = ?auto_990808 ?auto_990809 ) ) ( not ( = ?auto_990808 ?auto_990810 ) ) ( not ( = ?auto_990808 ?auto_990811 ) ) ( not ( = ?auto_990808 ?auto_990812 ) ) ( not ( = ?auto_990808 ?auto_990818 ) ) ( not ( = ?auto_990809 ?auto_990810 ) ) ( not ( = ?auto_990809 ?auto_990811 ) ) ( not ( = ?auto_990809 ?auto_990812 ) ) ( not ( = ?auto_990809 ?auto_990818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_990810 ?auto_990811 ?auto_990812 )
      ( MAKE-9CRATE-VERIFY ?auto_990803 ?auto_990804 ?auto_990805 ?auto_990807 ?auto_990806 ?auto_990808 ?auto_990809 ?auto_990810 ?auto_990811 ?auto_990812 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_996318 - SURFACE
      ?auto_996319 - SURFACE
      ?auto_996320 - SURFACE
      ?auto_996322 - SURFACE
      ?auto_996321 - SURFACE
      ?auto_996323 - SURFACE
      ?auto_996324 - SURFACE
      ?auto_996325 - SURFACE
      ?auto_996326 - SURFACE
      ?auto_996327 - SURFACE
      ?auto_996328 - SURFACE
    )
    :vars
    (
      ?auto_996330 - HOIST
      ?auto_996329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_996330 ?auto_996329 ) ( SURFACE-AT ?auto_996327 ?auto_996329 ) ( CLEAR ?auto_996327 ) ( LIFTING ?auto_996330 ?auto_996328 ) ( IS-CRATE ?auto_996328 ) ( not ( = ?auto_996327 ?auto_996328 ) ) ( ON ?auto_996319 ?auto_996318 ) ( ON ?auto_996320 ?auto_996319 ) ( ON ?auto_996322 ?auto_996320 ) ( ON ?auto_996321 ?auto_996322 ) ( ON ?auto_996323 ?auto_996321 ) ( ON ?auto_996324 ?auto_996323 ) ( ON ?auto_996325 ?auto_996324 ) ( ON ?auto_996326 ?auto_996325 ) ( ON ?auto_996327 ?auto_996326 ) ( not ( = ?auto_996318 ?auto_996319 ) ) ( not ( = ?auto_996318 ?auto_996320 ) ) ( not ( = ?auto_996318 ?auto_996322 ) ) ( not ( = ?auto_996318 ?auto_996321 ) ) ( not ( = ?auto_996318 ?auto_996323 ) ) ( not ( = ?auto_996318 ?auto_996324 ) ) ( not ( = ?auto_996318 ?auto_996325 ) ) ( not ( = ?auto_996318 ?auto_996326 ) ) ( not ( = ?auto_996318 ?auto_996327 ) ) ( not ( = ?auto_996318 ?auto_996328 ) ) ( not ( = ?auto_996319 ?auto_996320 ) ) ( not ( = ?auto_996319 ?auto_996322 ) ) ( not ( = ?auto_996319 ?auto_996321 ) ) ( not ( = ?auto_996319 ?auto_996323 ) ) ( not ( = ?auto_996319 ?auto_996324 ) ) ( not ( = ?auto_996319 ?auto_996325 ) ) ( not ( = ?auto_996319 ?auto_996326 ) ) ( not ( = ?auto_996319 ?auto_996327 ) ) ( not ( = ?auto_996319 ?auto_996328 ) ) ( not ( = ?auto_996320 ?auto_996322 ) ) ( not ( = ?auto_996320 ?auto_996321 ) ) ( not ( = ?auto_996320 ?auto_996323 ) ) ( not ( = ?auto_996320 ?auto_996324 ) ) ( not ( = ?auto_996320 ?auto_996325 ) ) ( not ( = ?auto_996320 ?auto_996326 ) ) ( not ( = ?auto_996320 ?auto_996327 ) ) ( not ( = ?auto_996320 ?auto_996328 ) ) ( not ( = ?auto_996322 ?auto_996321 ) ) ( not ( = ?auto_996322 ?auto_996323 ) ) ( not ( = ?auto_996322 ?auto_996324 ) ) ( not ( = ?auto_996322 ?auto_996325 ) ) ( not ( = ?auto_996322 ?auto_996326 ) ) ( not ( = ?auto_996322 ?auto_996327 ) ) ( not ( = ?auto_996322 ?auto_996328 ) ) ( not ( = ?auto_996321 ?auto_996323 ) ) ( not ( = ?auto_996321 ?auto_996324 ) ) ( not ( = ?auto_996321 ?auto_996325 ) ) ( not ( = ?auto_996321 ?auto_996326 ) ) ( not ( = ?auto_996321 ?auto_996327 ) ) ( not ( = ?auto_996321 ?auto_996328 ) ) ( not ( = ?auto_996323 ?auto_996324 ) ) ( not ( = ?auto_996323 ?auto_996325 ) ) ( not ( = ?auto_996323 ?auto_996326 ) ) ( not ( = ?auto_996323 ?auto_996327 ) ) ( not ( = ?auto_996323 ?auto_996328 ) ) ( not ( = ?auto_996324 ?auto_996325 ) ) ( not ( = ?auto_996324 ?auto_996326 ) ) ( not ( = ?auto_996324 ?auto_996327 ) ) ( not ( = ?auto_996324 ?auto_996328 ) ) ( not ( = ?auto_996325 ?auto_996326 ) ) ( not ( = ?auto_996325 ?auto_996327 ) ) ( not ( = ?auto_996325 ?auto_996328 ) ) ( not ( = ?auto_996326 ?auto_996327 ) ) ( not ( = ?auto_996326 ?auto_996328 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_996327 ?auto_996328 )
      ( MAKE-10CRATE-VERIFY ?auto_996318 ?auto_996319 ?auto_996320 ?auto_996322 ?auto_996321 ?auto_996323 ?auto_996324 ?auto_996325 ?auto_996326 ?auto_996327 ?auto_996328 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_996412 - SURFACE
      ?auto_996413 - SURFACE
      ?auto_996414 - SURFACE
      ?auto_996416 - SURFACE
      ?auto_996415 - SURFACE
      ?auto_996417 - SURFACE
      ?auto_996418 - SURFACE
      ?auto_996419 - SURFACE
      ?auto_996420 - SURFACE
      ?auto_996421 - SURFACE
      ?auto_996422 - SURFACE
    )
    :vars
    (
      ?auto_996425 - HOIST
      ?auto_996424 - PLACE
      ?auto_996423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_996425 ?auto_996424 ) ( SURFACE-AT ?auto_996421 ?auto_996424 ) ( CLEAR ?auto_996421 ) ( IS-CRATE ?auto_996422 ) ( not ( = ?auto_996421 ?auto_996422 ) ) ( TRUCK-AT ?auto_996423 ?auto_996424 ) ( AVAILABLE ?auto_996425 ) ( IN ?auto_996422 ?auto_996423 ) ( ON ?auto_996421 ?auto_996420 ) ( not ( = ?auto_996420 ?auto_996421 ) ) ( not ( = ?auto_996420 ?auto_996422 ) ) ( ON ?auto_996413 ?auto_996412 ) ( ON ?auto_996414 ?auto_996413 ) ( ON ?auto_996416 ?auto_996414 ) ( ON ?auto_996415 ?auto_996416 ) ( ON ?auto_996417 ?auto_996415 ) ( ON ?auto_996418 ?auto_996417 ) ( ON ?auto_996419 ?auto_996418 ) ( ON ?auto_996420 ?auto_996419 ) ( not ( = ?auto_996412 ?auto_996413 ) ) ( not ( = ?auto_996412 ?auto_996414 ) ) ( not ( = ?auto_996412 ?auto_996416 ) ) ( not ( = ?auto_996412 ?auto_996415 ) ) ( not ( = ?auto_996412 ?auto_996417 ) ) ( not ( = ?auto_996412 ?auto_996418 ) ) ( not ( = ?auto_996412 ?auto_996419 ) ) ( not ( = ?auto_996412 ?auto_996420 ) ) ( not ( = ?auto_996412 ?auto_996421 ) ) ( not ( = ?auto_996412 ?auto_996422 ) ) ( not ( = ?auto_996413 ?auto_996414 ) ) ( not ( = ?auto_996413 ?auto_996416 ) ) ( not ( = ?auto_996413 ?auto_996415 ) ) ( not ( = ?auto_996413 ?auto_996417 ) ) ( not ( = ?auto_996413 ?auto_996418 ) ) ( not ( = ?auto_996413 ?auto_996419 ) ) ( not ( = ?auto_996413 ?auto_996420 ) ) ( not ( = ?auto_996413 ?auto_996421 ) ) ( not ( = ?auto_996413 ?auto_996422 ) ) ( not ( = ?auto_996414 ?auto_996416 ) ) ( not ( = ?auto_996414 ?auto_996415 ) ) ( not ( = ?auto_996414 ?auto_996417 ) ) ( not ( = ?auto_996414 ?auto_996418 ) ) ( not ( = ?auto_996414 ?auto_996419 ) ) ( not ( = ?auto_996414 ?auto_996420 ) ) ( not ( = ?auto_996414 ?auto_996421 ) ) ( not ( = ?auto_996414 ?auto_996422 ) ) ( not ( = ?auto_996416 ?auto_996415 ) ) ( not ( = ?auto_996416 ?auto_996417 ) ) ( not ( = ?auto_996416 ?auto_996418 ) ) ( not ( = ?auto_996416 ?auto_996419 ) ) ( not ( = ?auto_996416 ?auto_996420 ) ) ( not ( = ?auto_996416 ?auto_996421 ) ) ( not ( = ?auto_996416 ?auto_996422 ) ) ( not ( = ?auto_996415 ?auto_996417 ) ) ( not ( = ?auto_996415 ?auto_996418 ) ) ( not ( = ?auto_996415 ?auto_996419 ) ) ( not ( = ?auto_996415 ?auto_996420 ) ) ( not ( = ?auto_996415 ?auto_996421 ) ) ( not ( = ?auto_996415 ?auto_996422 ) ) ( not ( = ?auto_996417 ?auto_996418 ) ) ( not ( = ?auto_996417 ?auto_996419 ) ) ( not ( = ?auto_996417 ?auto_996420 ) ) ( not ( = ?auto_996417 ?auto_996421 ) ) ( not ( = ?auto_996417 ?auto_996422 ) ) ( not ( = ?auto_996418 ?auto_996419 ) ) ( not ( = ?auto_996418 ?auto_996420 ) ) ( not ( = ?auto_996418 ?auto_996421 ) ) ( not ( = ?auto_996418 ?auto_996422 ) ) ( not ( = ?auto_996419 ?auto_996420 ) ) ( not ( = ?auto_996419 ?auto_996421 ) ) ( not ( = ?auto_996419 ?auto_996422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_996420 ?auto_996421 ?auto_996422 )
      ( MAKE-10CRATE-VERIFY ?auto_996412 ?auto_996413 ?auto_996414 ?auto_996416 ?auto_996415 ?auto_996417 ?auto_996418 ?auto_996419 ?auto_996420 ?auto_996421 ?auto_996422 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_996517 - SURFACE
      ?auto_996518 - SURFACE
      ?auto_996519 - SURFACE
      ?auto_996521 - SURFACE
      ?auto_996520 - SURFACE
      ?auto_996522 - SURFACE
      ?auto_996523 - SURFACE
      ?auto_996524 - SURFACE
      ?auto_996525 - SURFACE
      ?auto_996526 - SURFACE
      ?auto_996527 - SURFACE
    )
    :vars
    (
      ?auto_996531 - HOIST
      ?auto_996528 - PLACE
      ?auto_996530 - TRUCK
      ?auto_996529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_996531 ?auto_996528 ) ( SURFACE-AT ?auto_996526 ?auto_996528 ) ( CLEAR ?auto_996526 ) ( IS-CRATE ?auto_996527 ) ( not ( = ?auto_996526 ?auto_996527 ) ) ( AVAILABLE ?auto_996531 ) ( IN ?auto_996527 ?auto_996530 ) ( ON ?auto_996526 ?auto_996525 ) ( not ( = ?auto_996525 ?auto_996526 ) ) ( not ( = ?auto_996525 ?auto_996527 ) ) ( TRUCK-AT ?auto_996530 ?auto_996529 ) ( not ( = ?auto_996529 ?auto_996528 ) ) ( ON ?auto_996518 ?auto_996517 ) ( ON ?auto_996519 ?auto_996518 ) ( ON ?auto_996521 ?auto_996519 ) ( ON ?auto_996520 ?auto_996521 ) ( ON ?auto_996522 ?auto_996520 ) ( ON ?auto_996523 ?auto_996522 ) ( ON ?auto_996524 ?auto_996523 ) ( ON ?auto_996525 ?auto_996524 ) ( not ( = ?auto_996517 ?auto_996518 ) ) ( not ( = ?auto_996517 ?auto_996519 ) ) ( not ( = ?auto_996517 ?auto_996521 ) ) ( not ( = ?auto_996517 ?auto_996520 ) ) ( not ( = ?auto_996517 ?auto_996522 ) ) ( not ( = ?auto_996517 ?auto_996523 ) ) ( not ( = ?auto_996517 ?auto_996524 ) ) ( not ( = ?auto_996517 ?auto_996525 ) ) ( not ( = ?auto_996517 ?auto_996526 ) ) ( not ( = ?auto_996517 ?auto_996527 ) ) ( not ( = ?auto_996518 ?auto_996519 ) ) ( not ( = ?auto_996518 ?auto_996521 ) ) ( not ( = ?auto_996518 ?auto_996520 ) ) ( not ( = ?auto_996518 ?auto_996522 ) ) ( not ( = ?auto_996518 ?auto_996523 ) ) ( not ( = ?auto_996518 ?auto_996524 ) ) ( not ( = ?auto_996518 ?auto_996525 ) ) ( not ( = ?auto_996518 ?auto_996526 ) ) ( not ( = ?auto_996518 ?auto_996527 ) ) ( not ( = ?auto_996519 ?auto_996521 ) ) ( not ( = ?auto_996519 ?auto_996520 ) ) ( not ( = ?auto_996519 ?auto_996522 ) ) ( not ( = ?auto_996519 ?auto_996523 ) ) ( not ( = ?auto_996519 ?auto_996524 ) ) ( not ( = ?auto_996519 ?auto_996525 ) ) ( not ( = ?auto_996519 ?auto_996526 ) ) ( not ( = ?auto_996519 ?auto_996527 ) ) ( not ( = ?auto_996521 ?auto_996520 ) ) ( not ( = ?auto_996521 ?auto_996522 ) ) ( not ( = ?auto_996521 ?auto_996523 ) ) ( not ( = ?auto_996521 ?auto_996524 ) ) ( not ( = ?auto_996521 ?auto_996525 ) ) ( not ( = ?auto_996521 ?auto_996526 ) ) ( not ( = ?auto_996521 ?auto_996527 ) ) ( not ( = ?auto_996520 ?auto_996522 ) ) ( not ( = ?auto_996520 ?auto_996523 ) ) ( not ( = ?auto_996520 ?auto_996524 ) ) ( not ( = ?auto_996520 ?auto_996525 ) ) ( not ( = ?auto_996520 ?auto_996526 ) ) ( not ( = ?auto_996520 ?auto_996527 ) ) ( not ( = ?auto_996522 ?auto_996523 ) ) ( not ( = ?auto_996522 ?auto_996524 ) ) ( not ( = ?auto_996522 ?auto_996525 ) ) ( not ( = ?auto_996522 ?auto_996526 ) ) ( not ( = ?auto_996522 ?auto_996527 ) ) ( not ( = ?auto_996523 ?auto_996524 ) ) ( not ( = ?auto_996523 ?auto_996525 ) ) ( not ( = ?auto_996523 ?auto_996526 ) ) ( not ( = ?auto_996523 ?auto_996527 ) ) ( not ( = ?auto_996524 ?auto_996525 ) ) ( not ( = ?auto_996524 ?auto_996526 ) ) ( not ( = ?auto_996524 ?auto_996527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_996525 ?auto_996526 ?auto_996527 )
      ( MAKE-10CRATE-VERIFY ?auto_996517 ?auto_996518 ?auto_996519 ?auto_996521 ?auto_996520 ?auto_996522 ?auto_996523 ?auto_996524 ?auto_996525 ?auto_996526 ?auto_996527 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_996632 - SURFACE
      ?auto_996633 - SURFACE
      ?auto_996634 - SURFACE
      ?auto_996636 - SURFACE
      ?auto_996635 - SURFACE
      ?auto_996637 - SURFACE
      ?auto_996638 - SURFACE
      ?auto_996639 - SURFACE
      ?auto_996640 - SURFACE
      ?auto_996641 - SURFACE
      ?auto_996642 - SURFACE
    )
    :vars
    (
      ?auto_996647 - HOIST
      ?auto_996643 - PLACE
      ?auto_996644 - TRUCK
      ?auto_996646 - PLACE
      ?auto_996645 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_996647 ?auto_996643 ) ( SURFACE-AT ?auto_996641 ?auto_996643 ) ( CLEAR ?auto_996641 ) ( IS-CRATE ?auto_996642 ) ( not ( = ?auto_996641 ?auto_996642 ) ) ( AVAILABLE ?auto_996647 ) ( ON ?auto_996641 ?auto_996640 ) ( not ( = ?auto_996640 ?auto_996641 ) ) ( not ( = ?auto_996640 ?auto_996642 ) ) ( TRUCK-AT ?auto_996644 ?auto_996646 ) ( not ( = ?auto_996646 ?auto_996643 ) ) ( HOIST-AT ?auto_996645 ?auto_996646 ) ( LIFTING ?auto_996645 ?auto_996642 ) ( not ( = ?auto_996647 ?auto_996645 ) ) ( ON ?auto_996633 ?auto_996632 ) ( ON ?auto_996634 ?auto_996633 ) ( ON ?auto_996636 ?auto_996634 ) ( ON ?auto_996635 ?auto_996636 ) ( ON ?auto_996637 ?auto_996635 ) ( ON ?auto_996638 ?auto_996637 ) ( ON ?auto_996639 ?auto_996638 ) ( ON ?auto_996640 ?auto_996639 ) ( not ( = ?auto_996632 ?auto_996633 ) ) ( not ( = ?auto_996632 ?auto_996634 ) ) ( not ( = ?auto_996632 ?auto_996636 ) ) ( not ( = ?auto_996632 ?auto_996635 ) ) ( not ( = ?auto_996632 ?auto_996637 ) ) ( not ( = ?auto_996632 ?auto_996638 ) ) ( not ( = ?auto_996632 ?auto_996639 ) ) ( not ( = ?auto_996632 ?auto_996640 ) ) ( not ( = ?auto_996632 ?auto_996641 ) ) ( not ( = ?auto_996632 ?auto_996642 ) ) ( not ( = ?auto_996633 ?auto_996634 ) ) ( not ( = ?auto_996633 ?auto_996636 ) ) ( not ( = ?auto_996633 ?auto_996635 ) ) ( not ( = ?auto_996633 ?auto_996637 ) ) ( not ( = ?auto_996633 ?auto_996638 ) ) ( not ( = ?auto_996633 ?auto_996639 ) ) ( not ( = ?auto_996633 ?auto_996640 ) ) ( not ( = ?auto_996633 ?auto_996641 ) ) ( not ( = ?auto_996633 ?auto_996642 ) ) ( not ( = ?auto_996634 ?auto_996636 ) ) ( not ( = ?auto_996634 ?auto_996635 ) ) ( not ( = ?auto_996634 ?auto_996637 ) ) ( not ( = ?auto_996634 ?auto_996638 ) ) ( not ( = ?auto_996634 ?auto_996639 ) ) ( not ( = ?auto_996634 ?auto_996640 ) ) ( not ( = ?auto_996634 ?auto_996641 ) ) ( not ( = ?auto_996634 ?auto_996642 ) ) ( not ( = ?auto_996636 ?auto_996635 ) ) ( not ( = ?auto_996636 ?auto_996637 ) ) ( not ( = ?auto_996636 ?auto_996638 ) ) ( not ( = ?auto_996636 ?auto_996639 ) ) ( not ( = ?auto_996636 ?auto_996640 ) ) ( not ( = ?auto_996636 ?auto_996641 ) ) ( not ( = ?auto_996636 ?auto_996642 ) ) ( not ( = ?auto_996635 ?auto_996637 ) ) ( not ( = ?auto_996635 ?auto_996638 ) ) ( not ( = ?auto_996635 ?auto_996639 ) ) ( not ( = ?auto_996635 ?auto_996640 ) ) ( not ( = ?auto_996635 ?auto_996641 ) ) ( not ( = ?auto_996635 ?auto_996642 ) ) ( not ( = ?auto_996637 ?auto_996638 ) ) ( not ( = ?auto_996637 ?auto_996639 ) ) ( not ( = ?auto_996637 ?auto_996640 ) ) ( not ( = ?auto_996637 ?auto_996641 ) ) ( not ( = ?auto_996637 ?auto_996642 ) ) ( not ( = ?auto_996638 ?auto_996639 ) ) ( not ( = ?auto_996638 ?auto_996640 ) ) ( not ( = ?auto_996638 ?auto_996641 ) ) ( not ( = ?auto_996638 ?auto_996642 ) ) ( not ( = ?auto_996639 ?auto_996640 ) ) ( not ( = ?auto_996639 ?auto_996641 ) ) ( not ( = ?auto_996639 ?auto_996642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_996640 ?auto_996641 ?auto_996642 )
      ( MAKE-10CRATE-VERIFY ?auto_996632 ?auto_996633 ?auto_996634 ?auto_996636 ?auto_996635 ?auto_996637 ?auto_996638 ?auto_996639 ?auto_996640 ?auto_996641 ?auto_996642 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_996757 - SURFACE
      ?auto_996758 - SURFACE
      ?auto_996759 - SURFACE
      ?auto_996761 - SURFACE
      ?auto_996760 - SURFACE
      ?auto_996762 - SURFACE
      ?auto_996763 - SURFACE
      ?auto_996764 - SURFACE
      ?auto_996765 - SURFACE
      ?auto_996766 - SURFACE
      ?auto_996767 - SURFACE
    )
    :vars
    (
      ?auto_996772 - HOIST
      ?auto_996769 - PLACE
      ?auto_996773 - TRUCK
      ?auto_996768 - PLACE
      ?auto_996770 - HOIST
      ?auto_996771 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_996772 ?auto_996769 ) ( SURFACE-AT ?auto_996766 ?auto_996769 ) ( CLEAR ?auto_996766 ) ( IS-CRATE ?auto_996767 ) ( not ( = ?auto_996766 ?auto_996767 ) ) ( AVAILABLE ?auto_996772 ) ( ON ?auto_996766 ?auto_996765 ) ( not ( = ?auto_996765 ?auto_996766 ) ) ( not ( = ?auto_996765 ?auto_996767 ) ) ( TRUCK-AT ?auto_996773 ?auto_996768 ) ( not ( = ?auto_996768 ?auto_996769 ) ) ( HOIST-AT ?auto_996770 ?auto_996768 ) ( not ( = ?auto_996772 ?auto_996770 ) ) ( AVAILABLE ?auto_996770 ) ( SURFACE-AT ?auto_996767 ?auto_996768 ) ( ON ?auto_996767 ?auto_996771 ) ( CLEAR ?auto_996767 ) ( not ( = ?auto_996766 ?auto_996771 ) ) ( not ( = ?auto_996767 ?auto_996771 ) ) ( not ( = ?auto_996765 ?auto_996771 ) ) ( ON ?auto_996758 ?auto_996757 ) ( ON ?auto_996759 ?auto_996758 ) ( ON ?auto_996761 ?auto_996759 ) ( ON ?auto_996760 ?auto_996761 ) ( ON ?auto_996762 ?auto_996760 ) ( ON ?auto_996763 ?auto_996762 ) ( ON ?auto_996764 ?auto_996763 ) ( ON ?auto_996765 ?auto_996764 ) ( not ( = ?auto_996757 ?auto_996758 ) ) ( not ( = ?auto_996757 ?auto_996759 ) ) ( not ( = ?auto_996757 ?auto_996761 ) ) ( not ( = ?auto_996757 ?auto_996760 ) ) ( not ( = ?auto_996757 ?auto_996762 ) ) ( not ( = ?auto_996757 ?auto_996763 ) ) ( not ( = ?auto_996757 ?auto_996764 ) ) ( not ( = ?auto_996757 ?auto_996765 ) ) ( not ( = ?auto_996757 ?auto_996766 ) ) ( not ( = ?auto_996757 ?auto_996767 ) ) ( not ( = ?auto_996757 ?auto_996771 ) ) ( not ( = ?auto_996758 ?auto_996759 ) ) ( not ( = ?auto_996758 ?auto_996761 ) ) ( not ( = ?auto_996758 ?auto_996760 ) ) ( not ( = ?auto_996758 ?auto_996762 ) ) ( not ( = ?auto_996758 ?auto_996763 ) ) ( not ( = ?auto_996758 ?auto_996764 ) ) ( not ( = ?auto_996758 ?auto_996765 ) ) ( not ( = ?auto_996758 ?auto_996766 ) ) ( not ( = ?auto_996758 ?auto_996767 ) ) ( not ( = ?auto_996758 ?auto_996771 ) ) ( not ( = ?auto_996759 ?auto_996761 ) ) ( not ( = ?auto_996759 ?auto_996760 ) ) ( not ( = ?auto_996759 ?auto_996762 ) ) ( not ( = ?auto_996759 ?auto_996763 ) ) ( not ( = ?auto_996759 ?auto_996764 ) ) ( not ( = ?auto_996759 ?auto_996765 ) ) ( not ( = ?auto_996759 ?auto_996766 ) ) ( not ( = ?auto_996759 ?auto_996767 ) ) ( not ( = ?auto_996759 ?auto_996771 ) ) ( not ( = ?auto_996761 ?auto_996760 ) ) ( not ( = ?auto_996761 ?auto_996762 ) ) ( not ( = ?auto_996761 ?auto_996763 ) ) ( not ( = ?auto_996761 ?auto_996764 ) ) ( not ( = ?auto_996761 ?auto_996765 ) ) ( not ( = ?auto_996761 ?auto_996766 ) ) ( not ( = ?auto_996761 ?auto_996767 ) ) ( not ( = ?auto_996761 ?auto_996771 ) ) ( not ( = ?auto_996760 ?auto_996762 ) ) ( not ( = ?auto_996760 ?auto_996763 ) ) ( not ( = ?auto_996760 ?auto_996764 ) ) ( not ( = ?auto_996760 ?auto_996765 ) ) ( not ( = ?auto_996760 ?auto_996766 ) ) ( not ( = ?auto_996760 ?auto_996767 ) ) ( not ( = ?auto_996760 ?auto_996771 ) ) ( not ( = ?auto_996762 ?auto_996763 ) ) ( not ( = ?auto_996762 ?auto_996764 ) ) ( not ( = ?auto_996762 ?auto_996765 ) ) ( not ( = ?auto_996762 ?auto_996766 ) ) ( not ( = ?auto_996762 ?auto_996767 ) ) ( not ( = ?auto_996762 ?auto_996771 ) ) ( not ( = ?auto_996763 ?auto_996764 ) ) ( not ( = ?auto_996763 ?auto_996765 ) ) ( not ( = ?auto_996763 ?auto_996766 ) ) ( not ( = ?auto_996763 ?auto_996767 ) ) ( not ( = ?auto_996763 ?auto_996771 ) ) ( not ( = ?auto_996764 ?auto_996765 ) ) ( not ( = ?auto_996764 ?auto_996766 ) ) ( not ( = ?auto_996764 ?auto_996767 ) ) ( not ( = ?auto_996764 ?auto_996771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_996765 ?auto_996766 ?auto_996767 )
      ( MAKE-10CRATE-VERIFY ?auto_996757 ?auto_996758 ?auto_996759 ?auto_996761 ?auto_996760 ?auto_996762 ?auto_996763 ?auto_996764 ?auto_996765 ?auto_996766 ?auto_996767 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_996883 - SURFACE
      ?auto_996884 - SURFACE
      ?auto_996885 - SURFACE
      ?auto_996887 - SURFACE
      ?auto_996886 - SURFACE
      ?auto_996888 - SURFACE
      ?auto_996889 - SURFACE
      ?auto_996890 - SURFACE
      ?auto_996891 - SURFACE
      ?auto_996892 - SURFACE
      ?auto_996893 - SURFACE
    )
    :vars
    (
      ?auto_996898 - HOIST
      ?auto_996896 - PLACE
      ?auto_996894 - PLACE
      ?auto_996897 - HOIST
      ?auto_996895 - SURFACE
      ?auto_996899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_996898 ?auto_996896 ) ( SURFACE-AT ?auto_996892 ?auto_996896 ) ( CLEAR ?auto_996892 ) ( IS-CRATE ?auto_996893 ) ( not ( = ?auto_996892 ?auto_996893 ) ) ( AVAILABLE ?auto_996898 ) ( ON ?auto_996892 ?auto_996891 ) ( not ( = ?auto_996891 ?auto_996892 ) ) ( not ( = ?auto_996891 ?auto_996893 ) ) ( not ( = ?auto_996894 ?auto_996896 ) ) ( HOIST-AT ?auto_996897 ?auto_996894 ) ( not ( = ?auto_996898 ?auto_996897 ) ) ( AVAILABLE ?auto_996897 ) ( SURFACE-AT ?auto_996893 ?auto_996894 ) ( ON ?auto_996893 ?auto_996895 ) ( CLEAR ?auto_996893 ) ( not ( = ?auto_996892 ?auto_996895 ) ) ( not ( = ?auto_996893 ?auto_996895 ) ) ( not ( = ?auto_996891 ?auto_996895 ) ) ( TRUCK-AT ?auto_996899 ?auto_996896 ) ( ON ?auto_996884 ?auto_996883 ) ( ON ?auto_996885 ?auto_996884 ) ( ON ?auto_996887 ?auto_996885 ) ( ON ?auto_996886 ?auto_996887 ) ( ON ?auto_996888 ?auto_996886 ) ( ON ?auto_996889 ?auto_996888 ) ( ON ?auto_996890 ?auto_996889 ) ( ON ?auto_996891 ?auto_996890 ) ( not ( = ?auto_996883 ?auto_996884 ) ) ( not ( = ?auto_996883 ?auto_996885 ) ) ( not ( = ?auto_996883 ?auto_996887 ) ) ( not ( = ?auto_996883 ?auto_996886 ) ) ( not ( = ?auto_996883 ?auto_996888 ) ) ( not ( = ?auto_996883 ?auto_996889 ) ) ( not ( = ?auto_996883 ?auto_996890 ) ) ( not ( = ?auto_996883 ?auto_996891 ) ) ( not ( = ?auto_996883 ?auto_996892 ) ) ( not ( = ?auto_996883 ?auto_996893 ) ) ( not ( = ?auto_996883 ?auto_996895 ) ) ( not ( = ?auto_996884 ?auto_996885 ) ) ( not ( = ?auto_996884 ?auto_996887 ) ) ( not ( = ?auto_996884 ?auto_996886 ) ) ( not ( = ?auto_996884 ?auto_996888 ) ) ( not ( = ?auto_996884 ?auto_996889 ) ) ( not ( = ?auto_996884 ?auto_996890 ) ) ( not ( = ?auto_996884 ?auto_996891 ) ) ( not ( = ?auto_996884 ?auto_996892 ) ) ( not ( = ?auto_996884 ?auto_996893 ) ) ( not ( = ?auto_996884 ?auto_996895 ) ) ( not ( = ?auto_996885 ?auto_996887 ) ) ( not ( = ?auto_996885 ?auto_996886 ) ) ( not ( = ?auto_996885 ?auto_996888 ) ) ( not ( = ?auto_996885 ?auto_996889 ) ) ( not ( = ?auto_996885 ?auto_996890 ) ) ( not ( = ?auto_996885 ?auto_996891 ) ) ( not ( = ?auto_996885 ?auto_996892 ) ) ( not ( = ?auto_996885 ?auto_996893 ) ) ( not ( = ?auto_996885 ?auto_996895 ) ) ( not ( = ?auto_996887 ?auto_996886 ) ) ( not ( = ?auto_996887 ?auto_996888 ) ) ( not ( = ?auto_996887 ?auto_996889 ) ) ( not ( = ?auto_996887 ?auto_996890 ) ) ( not ( = ?auto_996887 ?auto_996891 ) ) ( not ( = ?auto_996887 ?auto_996892 ) ) ( not ( = ?auto_996887 ?auto_996893 ) ) ( not ( = ?auto_996887 ?auto_996895 ) ) ( not ( = ?auto_996886 ?auto_996888 ) ) ( not ( = ?auto_996886 ?auto_996889 ) ) ( not ( = ?auto_996886 ?auto_996890 ) ) ( not ( = ?auto_996886 ?auto_996891 ) ) ( not ( = ?auto_996886 ?auto_996892 ) ) ( not ( = ?auto_996886 ?auto_996893 ) ) ( not ( = ?auto_996886 ?auto_996895 ) ) ( not ( = ?auto_996888 ?auto_996889 ) ) ( not ( = ?auto_996888 ?auto_996890 ) ) ( not ( = ?auto_996888 ?auto_996891 ) ) ( not ( = ?auto_996888 ?auto_996892 ) ) ( not ( = ?auto_996888 ?auto_996893 ) ) ( not ( = ?auto_996888 ?auto_996895 ) ) ( not ( = ?auto_996889 ?auto_996890 ) ) ( not ( = ?auto_996889 ?auto_996891 ) ) ( not ( = ?auto_996889 ?auto_996892 ) ) ( not ( = ?auto_996889 ?auto_996893 ) ) ( not ( = ?auto_996889 ?auto_996895 ) ) ( not ( = ?auto_996890 ?auto_996891 ) ) ( not ( = ?auto_996890 ?auto_996892 ) ) ( not ( = ?auto_996890 ?auto_996893 ) ) ( not ( = ?auto_996890 ?auto_996895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_996891 ?auto_996892 ?auto_996893 )
      ( MAKE-10CRATE-VERIFY ?auto_996883 ?auto_996884 ?auto_996885 ?auto_996887 ?auto_996886 ?auto_996888 ?auto_996889 ?auto_996890 ?auto_996891 ?auto_996892 ?auto_996893 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997009 - SURFACE
      ?auto_997010 - SURFACE
      ?auto_997011 - SURFACE
      ?auto_997013 - SURFACE
      ?auto_997012 - SURFACE
      ?auto_997014 - SURFACE
      ?auto_997015 - SURFACE
      ?auto_997016 - SURFACE
      ?auto_997017 - SURFACE
      ?auto_997018 - SURFACE
      ?auto_997019 - SURFACE
    )
    :vars
    (
      ?auto_997022 - HOIST
      ?auto_997023 - PLACE
      ?auto_997021 - PLACE
      ?auto_997020 - HOIST
      ?auto_997025 - SURFACE
      ?auto_997024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997022 ?auto_997023 ) ( IS-CRATE ?auto_997019 ) ( not ( = ?auto_997018 ?auto_997019 ) ) ( not ( = ?auto_997017 ?auto_997018 ) ) ( not ( = ?auto_997017 ?auto_997019 ) ) ( not ( = ?auto_997021 ?auto_997023 ) ) ( HOIST-AT ?auto_997020 ?auto_997021 ) ( not ( = ?auto_997022 ?auto_997020 ) ) ( AVAILABLE ?auto_997020 ) ( SURFACE-AT ?auto_997019 ?auto_997021 ) ( ON ?auto_997019 ?auto_997025 ) ( CLEAR ?auto_997019 ) ( not ( = ?auto_997018 ?auto_997025 ) ) ( not ( = ?auto_997019 ?auto_997025 ) ) ( not ( = ?auto_997017 ?auto_997025 ) ) ( TRUCK-AT ?auto_997024 ?auto_997023 ) ( SURFACE-AT ?auto_997017 ?auto_997023 ) ( CLEAR ?auto_997017 ) ( LIFTING ?auto_997022 ?auto_997018 ) ( IS-CRATE ?auto_997018 ) ( ON ?auto_997010 ?auto_997009 ) ( ON ?auto_997011 ?auto_997010 ) ( ON ?auto_997013 ?auto_997011 ) ( ON ?auto_997012 ?auto_997013 ) ( ON ?auto_997014 ?auto_997012 ) ( ON ?auto_997015 ?auto_997014 ) ( ON ?auto_997016 ?auto_997015 ) ( ON ?auto_997017 ?auto_997016 ) ( not ( = ?auto_997009 ?auto_997010 ) ) ( not ( = ?auto_997009 ?auto_997011 ) ) ( not ( = ?auto_997009 ?auto_997013 ) ) ( not ( = ?auto_997009 ?auto_997012 ) ) ( not ( = ?auto_997009 ?auto_997014 ) ) ( not ( = ?auto_997009 ?auto_997015 ) ) ( not ( = ?auto_997009 ?auto_997016 ) ) ( not ( = ?auto_997009 ?auto_997017 ) ) ( not ( = ?auto_997009 ?auto_997018 ) ) ( not ( = ?auto_997009 ?auto_997019 ) ) ( not ( = ?auto_997009 ?auto_997025 ) ) ( not ( = ?auto_997010 ?auto_997011 ) ) ( not ( = ?auto_997010 ?auto_997013 ) ) ( not ( = ?auto_997010 ?auto_997012 ) ) ( not ( = ?auto_997010 ?auto_997014 ) ) ( not ( = ?auto_997010 ?auto_997015 ) ) ( not ( = ?auto_997010 ?auto_997016 ) ) ( not ( = ?auto_997010 ?auto_997017 ) ) ( not ( = ?auto_997010 ?auto_997018 ) ) ( not ( = ?auto_997010 ?auto_997019 ) ) ( not ( = ?auto_997010 ?auto_997025 ) ) ( not ( = ?auto_997011 ?auto_997013 ) ) ( not ( = ?auto_997011 ?auto_997012 ) ) ( not ( = ?auto_997011 ?auto_997014 ) ) ( not ( = ?auto_997011 ?auto_997015 ) ) ( not ( = ?auto_997011 ?auto_997016 ) ) ( not ( = ?auto_997011 ?auto_997017 ) ) ( not ( = ?auto_997011 ?auto_997018 ) ) ( not ( = ?auto_997011 ?auto_997019 ) ) ( not ( = ?auto_997011 ?auto_997025 ) ) ( not ( = ?auto_997013 ?auto_997012 ) ) ( not ( = ?auto_997013 ?auto_997014 ) ) ( not ( = ?auto_997013 ?auto_997015 ) ) ( not ( = ?auto_997013 ?auto_997016 ) ) ( not ( = ?auto_997013 ?auto_997017 ) ) ( not ( = ?auto_997013 ?auto_997018 ) ) ( not ( = ?auto_997013 ?auto_997019 ) ) ( not ( = ?auto_997013 ?auto_997025 ) ) ( not ( = ?auto_997012 ?auto_997014 ) ) ( not ( = ?auto_997012 ?auto_997015 ) ) ( not ( = ?auto_997012 ?auto_997016 ) ) ( not ( = ?auto_997012 ?auto_997017 ) ) ( not ( = ?auto_997012 ?auto_997018 ) ) ( not ( = ?auto_997012 ?auto_997019 ) ) ( not ( = ?auto_997012 ?auto_997025 ) ) ( not ( = ?auto_997014 ?auto_997015 ) ) ( not ( = ?auto_997014 ?auto_997016 ) ) ( not ( = ?auto_997014 ?auto_997017 ) ) ( not ( = ?auto_997014 ?auto_997018 ) ) ( not ( = ?auto_997014 ?auto_997019 ) ) ( not ( = ?auto_997014 ?auto_997025 ) ) ( not ( = ?auto_997015 ?auto_997016 ) ) ( not ( = ?auto_997015 ?auto_997017 ) ) ( not ( = ?auto_997015 ?auto_997018 ) ) ( not ( = ?auto_997015 ?auto_997019 ) ) ( not ( = ?auto_997015 ?auto_997025 ) ) ( not ( = ?auto_997016 ?auto_997017 ) ) ( not ( = ?auto_997016 ?auto_997018 ) ) ( not ( = ?auto_997016 ?auto_997019 ) ) ( not ( = ?auto_997016 ?auto_997025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997017 ?auto_997018 ?auto_997019 )
      ( MAKE-10CRATE-VERIFY ?auto_997009 ?auto_997010 ?auto_997011 ?auto_997013 ?auto_997012 ?auto_997014 ?auto_997015 ?auto_997016 ?auto_997017 ?auto_997018 ?auto_997019 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_997135 - SURFACE
      ?auto_997136 - SURFACE
      ?auto_997137 - SURFACE
      ?auto_997139 - SURFACE
      ?auto_997138 - SURFACE
      ?auto_997140 - SURFACE
      ?auto_997141 - SURFACE
      ?auto_997142 - SURFACE
      ?auto_997143 - SURFACE
      ?auto_997144 - SURFACE
      ?auto_997145 - SURFACE
    )
    :vars
    (
      ?auto_997147 - HOIST
      ?auto_997151 - PLACE
      ?auto_997150 - PLACE
      ?auto_997148 - HOIST
      ?auto_997146 - SURFACE
      ?auto_997149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_997147 ?auto_997151 ) ( IS-CRATE ?auto_997145 ) ( not ( = ?auto_997144 ?auto_997145 ) ) ( not ( = ?auto_997143 ?auto_997144 ) ) ( not ( = ?auto_997143 ?auto_997145 ) ) ( not ( = ?auto_997150 ?auto_997151 ) ) ( HOIST-AT ?auto_997148 ?auto_997150 ) ( not ( = ?auto_997147 ?auto_997148 ) ) ( AVAILABLE ?auto_997148 ) ( SURFACE-AT ?auto_997145 ?auto_997150 ) ( ON ?auto_997145 ?auto_997146 ) ( CLEAR ?auto_997145 ) ( not ( = ?auto_997144 ?auto_997146 ) ) ( not ( = ?auto_997145 ?auto_997146 ) ) ( not ( = ?auto_997143 ?auto_997146 ) ) ( TRUCK-AT ?auto_997149 ?auto_997151 ) ( SURFACE-AT ?auto_997143 ?auto_997151 ) ( CLEAR ?auto_997143 ) ( IS-CRATE ?auto_997144 ) ( AVAILABLE ?auto_997147 ) ( IN ?auto_997144 ?auto_997149 ) ( ON ?auto_997136 ?auto_997135 ) ( ON ?auto_997137 ?auto_997136 ) ( ON ?auto_997139 ?auto_997137 ) ( ON ?auto_997138 ?auto_997139 ) ( ON ?auto_997140 ?auto_997138 ) ( ON ?auto_997141 ?auto_997140 ) ( ON ?auto_997142 ?auto_997141 ) ( ON ?auto_997143 ?auto_997142 ) ( not ( = ?auto_997135 ?auto_997136 ) ) ( not ( = ?auto_997135 ?auto_997137 ) ) ( not ( = ?auto_997135 ?auto_997139 ) ) ( not ( = ?auto_997135 ?auto_997138 ) ) ( not ( = ?auto_997135 ?auto_997140 ) ) ( not ( = ?auto_997135 ?auto_997141 ) ) ( not ( = ?auto_997135 ?auto_997142 ) ) ( not ( = ?auto_997135 ?auto_997143 ) ) ( not ( = ?auto_997135 ?auto_997144 ) ) ( not ( = ?auto_997135 ?auto_997145 ) ) ( not ( = ?auto_997135 ?auto_997146 ) ) ( not ( = ?auto_997136 ?auto_997137 ) ) ( not ( = ?auto_997136 ?auto_997139 ) ) ( not ( = ?auto_997136 ?auto_997138 ) ) ( not ( = ?auto_997136 ?auto_997140 ) ) ( not ( = ?auto_997136 ?auto_997141 ) ) ( not ( = ?auto_997136 ?auto_997142 ) ) ( not ( = ?auto_997136 ?auto_997143 ) ) ( not ( = ?auto_997136 ?auto_997144 ) ) ( not ( = ?auto_997136 ?auto_997145 ) ) ( not ( = ?auto_997136 ?auto_997146 ) ) ( not ( = ?auto_997137 ?auto_997139 ) ) ( not ( = ?auto_997137 ?auto_997138 ) ) ( not ( = ?auto_997137 ?auto_997140 ) ) ( not ( = ?auto_997137 ?auto_997141 ) ) ( not ( = ?auto_997137 ?auto_997142 ) ) ( not ( = ?auto_997137 ?auto_997143 ) ) ( not ( = ?auto_997137 ?auto_997144 ) ) ( not ( = ?auto_997137 ?auto_997145 ) ) ( not ( = ?auto_997137 ?auto_997146 ) ) ( not ( = ?auto_997139 ?auto_997138 ) ) ( not ( = ?auto_997139 ?auto_997140 ) ) ( not ( = ?auto_997139 ?auto_997141 ) ) ( not ( = ?auto_997139 ?auto_997142 ) ) ( not ( = ?auto_997139 ?auto_997143 ) ) ( not ( = ?auto_997139 ?auto_997144 ) ) ( not ( = ?auto_997139 ?auto_997145 ) ) ( not ( = ?auto_997139 ?auto_997146 ) ) ( not ( = ?auto_997138 ?auto_997140 ) ) ( not ( = ?auto_997138 ?auto_997141 ) ) ( not ( = ?auto_997138 ?auto_997142 ) ) ( not ( = ?auto_997138 ?auto_997143 ) ) ( not ( = ?auto_997138 ?auto_997144 ) ) ( not ( = ?auto_997138 ?auto_997145 ) ) ( not ( = ?auto_997138 ?auto_997146 ) ) ( not ( = ?auto_997140 ?auto_997141 ) ) ( not ( = ?auto_997140 ?auto_997142 ) ) ( not ( = ?auto_997140 ?auto_997143 ) ) ( not ( = ?auto_997140 ?auto_997144 ) ) ( not ( = ?auto_997140 ?auto_997145 ) ) ( not ( = ?auto_997140 ?auto_997146 ) ) ( not ( = ?auto_997141 ?auto_997142 ) ) ( not ( = ?auto_997141 ?auto_997143 ) ) ( not ( = ?auto_997141 ?auto_997144 ) ) ( not ( = ?auto_997141 ?auto_997145 ) ) ( not ( = ?auto_997141 ?auto_997146 ) ) ( not ( = ?auto_997142 ?auto_997143 ) ) ( not ( = ?auto_997142 ?auto_997144 ) ) ( not ( = ?auto_997142 ?auto_997145 ) ) ( not ( = ?auto_997142 ?auto_997146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_997143 ?auto_997144 ?auto_997145 )
      ( MAKE-10CRATE-VERIFY ?auto_997135 ?auto_997136 ?auto_997137 ?auto_997139 ?auto_997138 ?auto_997140 ?auto_997141 ?auto_997142 ?auto_997143 ?auto_997144 ?auto_997145 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1004355 - SURFACE
      ?auto_1004356 - SURFACE
      ?auto_1004357 - SURFACE
      ?auto_1004359 - SURFACE
      ?auto_1004358 - SURFACE
      ?auto_1004360 - SURFACE
      ?auto_1004361 - SURFACE
      ?auto_1004362 - SURFACE
      ?auto_1004363 - SURFACE
      ?auto_1004364 - SURFACE
      ?auto_1004365 - SURFACE
      ?auto_1004366 - SURFACE
    )
    :vars
    (
      ?auto_1004367 - HOIST
      ?auto_1004368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004367 ?auto_1004368 ) ( SURFACE-AT ?auto_1004365 ?auto_1004368 ) ( CLEAR ?auto_1004365 ) ( LIFTING ?auto_1004367 ?auto_1004366 ) ( IS-CRATE ?auto_1004366 ) ( not ( = ?auto_1004365 ?auto_1004366 ) ) ( ON ?auto_1004356 ?auto_1004355 ) ( ON ?auto_1004357 ?auto_1004356 ) ( ON ?auto_1004359 ?auto_1004357 ) ( ON ?auto_1004358 ?auto_1004359 ) ( ON ?auto_1004360 ?auto_1004358 ) ( ON ?auto_1004361 ?auto_1004360 ) ( ON ?auto_1004362 ?auto_1004361 ) ( ON ?auto_1004363 ?auto_1004362 ) ( ON ?auto_1004364 ?auto_1004363 ) ( ON ?auto_1004365 ?auto_1004364 ) ( not ( = ?auto_1004355 ?auto_1004356 ) ) ( not ( = ?auto_1004355 ?auto_1004357 ) ) ( not ( = ?auto_1004355 ?auto_1004359 ) ) ( not ( = ?auto_1004355 ?auto_1004358 ) ) ( not ( = ?auto_1004355 ?auto_1004360 ) ) ( not ( = ?auto_1004355 ?auto_1004361 ) ) ( not ( = ?auto_1004355 ?auto_1004362 ) ) ( not ( = ?auto_1004355 ?auto_1004363 ) ) ( not ( = ?auto_1004355 ?auto_1004364 ) ) ( not ( = ?auto_1004355 ?auto_1004365 ) ) ( not ( = ?auto_1004355 ?auto_1004366 ) ) ( not ( = ?auto_1004356 ?auto_1004357 ) ) ( not ( = ?auto_1004356 ?auto_1004359 ) ) ( not ( = ?auto_1004356 ?auto_1004358 ) ) ( not ( = ?auto_1004356 ?auto_1004360 ) ) ( not ( = ?auto_1004356 ?auto_1004361 ) ) ( not ( = ?auto_1004356 ?auto_1004362 ) ) ( not ( = ?auto_1004356 ?auto_1004363 ) ) ( not ( = ?auto_1004356 ?auto_1004364 ) ) ( not ( = ?auto_1004356 ?auto_1004365 ) ) ( not ( = ?auto_1004356 ?auto_1004366 ) ) ( not ( = ?auto_1004357 ?auto_1004359 ) ) ( not ( = ?auto_1004357 ?auto_1004358 ) ) ( not ( = ?auto_1004357 ?auto_1004360 ) ) ( not ( = ?auto_1004357 ?auto_1004361 ) ) ( not ( = ?auto_1004357 ?auto_1004362 ) ) ( not ( = ?auto_1004357 ?auto_1004363 ) ) ( not ( = ?auto_1004357 ?auto_1004364 ) ) ( not ( = ?auto_1004357 ?auto_1004365 ) ) ( not ( = ?auto_1004357 ?auto_1004366 ) ) ( not ( = ?auto_1004359 ?auto_1004358 ) ) ( not ( = ?auto_1004359 ?auto_1004360 ) ) ( not ( = ?auto_1004359 ?auto_1004361 ) ) ( not ( = ?auto_1004359 ?auto_1004362 ) ) ( not ( = ?auto_1004359 ?auto_1004363 ) ) ( not ( = ?auto_1004359 ?auto_1004364 ) ) ( not ( = ?auto_1004359 ?auto_1004365 ) ) ( not ( = ?auto_1004359 ?auto_1004366 ) ) ( not ( = ?auto_1004358 ?auto_1004360 ) ) ( not ( = ?auto_1004358 ?auto_1004361 ) ) ( not ( = ?auto_1004358 ?auto_1004362 ) ) ( not ( = ?auto_1004358 ?auto_1004363 ) ) ( not ( = ?auto_1004358 ?auto_1004364 ) ) ( not ( = ?auto_1004358 ?auto_1004365 ) ) ( not ( = ?auto_1004358 ?auto_1004366 ) ) ( not ( = ?auto_1004360 ?auto_1004361 ) ) ( not ( = ?auto_1004360 ?auto_1004362 ) ) ( not ( = ?auto_1004360 ?auto_1004363 ) ) ( not ( = ?auto_1004360 ?auto_1004364 ) ) ( not ( = ?auto_1004360 ?auto_1004365 ) ) ( not ( = ?auto_1004360 ?auto_1004366 ) ) ( not ( = ?auto_1004361 ?auto_1004362 ) ) ( not ( = ?auto_1004361 ?auto_1004363 ) ) ( not ( = ?auto_1004361 ?auto_1004364 ) ) ( not ( = ?auto_1004361 ?auto_1004365 ) ) ( not ( = ?auto_1004361 ?auto_1004366 ) ) ( not ( = ?auto_1004362 ?auto_1004363 ) ) ( not ( = ?auto_1004362 ?auto_1004364 ) ) ( not ( = ?auto_1004362 ?auto_1004365 ) ) ( not ( = ?auto_1004362 ?auto_1004366 ) ) ( not ( = ?auto_1004363 ?auto_1004364 ) ) ( not ( = ?auto_1004363 ?auto_1004365 ) ) ( not ( = ?auto_1004363 ?auto_1004366 ) ) ( not ( = ?auto_1004364 ?auto_1004365 ) ) ( not ( = ?auto_1004364 ?auto_1004366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1004365 ?auto_1004366 )
      ( MAKE-11CRATE-VERIFY ?auto_1004355 ?auto_1004356 ?auto_1004357 ?auto_1004359 ?auto_1004358 ?auto_1004360 ?auto_1004361 ?auto_1004362 ?auto_1004363 ?auto_1004364 ?auto_1004365 ?auto_1004366 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1004464 - SURFACE
      ?auto_1004465 - SURFACE
      ?auto_1004466 - SURFACE
      ?auto_1004468 - SURFACE
      ?auto_1004467 - SURFACE
      ?auto_1004469 - SURFACE
      ?auto_1004470 - SURFACE
      ?auto_1004471 - SURFACE
      ?auto_1004472 - SURFACE
      ?auto_1004473 - SURFACE
      ?auto_1004474 - SURFACE
      ?auto_1004475 - SURFACE
    )
    :vars
    (
      ?auto_1004477 - HOIST
      ?auto_1004476 - PLACE
      ?auto_1004478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004477 ?auto_1004476 ) ( SURFACE-AT ?auto_1004474 ?auto_1004476 ) ( CLEAR ?auto_1004474 ) ( IS-CRATE ?auto_1004475 ) ( not ( = ?auto_1004474 ?auto_1004475 ) ) ( TRUCK-AT ?auto_1004478 ?auto_1004476 ) ( AVAILABLE ?auto_1004477 ) ( IN ?auto_1004475 ?auto_1004478 ) ( ON ?auto_1004474 ?auto_1004473 ) ( not ( = ?auto_1004473 ?auto_1004474 ) ) ( not ( = ?auto_1004473 ?auto_1004475 ) ) ( ON ?auto_1004465 ?auto_1004464 ) ( ON ?auto_1004466 ?auto_1004465 ) ( ON ?auto_1004468 ?auto_1004466 ) ( ON ?auto_1004467 ?auto_1004468 ) ( ON ?auto_1004469 ?auto_1004467 ) ( ON ?auto_1004470 ?auto_1004469 ) ( ON ?auto_1004471 ?auto_1004470 ) ( ON ?auto_1004472 ?auto_1004471 ) ( ON ?auto_1004473 ?auto_1004472 ) ( not ( = ?auto_1004464 ?auto_1004465 ) ) ( not ( = ?auto_1004464 ?auto_1004466 ) ) ( not ( = ?auto_1004464 ?auto_1004468 ) ) ( not ( = ?auto_1004464 ?auto_1004467 ) ) ( not ( = ?auto_1004464 ?auto_1004469 ) ) ( not ( = ?auto_1004464 ?auto_1004470 ) ) ( not ( = ?auto_1004464 ?auto_1004471 ) ) ( not ( = ?auto_1004464 ?auto_1004472 ) ) ( not ( = ?auto_1004464 ?auto_1004473 ) ) ( not ( = ?auto_1004464 ?auto_1004474 ) ) ( not ( = ?auto_1004464 ?auto_1004475 ) ) ( not ( = ?auto_1004465 ?auto_1004466 ) ) ( not ( = ?auto_1004465 ?auto_1004468 ) ) ( not ( = ?auto_1004465 ?auto_1004467 ) ) ( not ( = ?auto_1004465 ?auto_1004469 ) ) ( not ( = ?auto_1004465 ?auto_1004470 ) ) ( not ( = ?auto_1004465 ?auto_1004471 ) ) ( not ( = ?auto_1004465 ?auto_1004472 ) ) ( not ( = ?auto_1004465 ?auto_1004473 ) ) ( not ( = ?auto_1004465 ?auto_1004474 ) ) ( not ( = ?auto_1004465 ?auto_1004475 ) ) ( not ( = ?auto_1004466 ?auto_1004468 ) ) ( not ( = ?auto_1004466 ?auto_1004467 ) ) ( not ( = ?auto_1004466 ?auto_1004469 ) ) ( not ( = ?auto_1004466 ?auto_1004470 ) ) ( not ( = ?auto_1004466 ?auto_1004471 ) ) ( not ( = ?auto_1004466 ?auto_1004472 ) ) ( not ( = ?auto_1004466 ?auto_1004473 ) ) ( not ( = ?auto_1004466 ?auto_1004474 ) ) ( not ( = ?auto_1004466 ?auto_1004475 ) ) ( not ( = ?auto_1004468 ?auto_1004467 ) ) ( not ( = ?auto_1004468 ?auto_1004469 ) ) ( not ( = ?auto_1004468 ?auto_1004470 ) ) ( not ( = ?auto_1004468 ?auto_1004471 ) ) ( not ( = ?auto_1004468 ?auto_1004472 ) ) ( not ( = ?auto_1004468 ?auto_1004473 ) ) ( not ( = ?auto_1004468 ?auto_1004474 ) ) ( not ( = ?auto_1004468 ?auto_1004475 ) ) ( not ( = ?auto_1004467 ?auto_1004469 ) ) ( not ( = ?auto_1004467 ?auto_1004470 ) ) ( not ( = ?auto_1004467 ?auto_1004471 ) ) ( not ( = ?auto_1004467 ?auto_1004472 ) ) ( not ( = ?auto_1004467 ?auto_1004473 ) ) ( not ( = ?auto_1004467 ?auto_1004474 ) ) ( not ( = ?auto_1004467 ?auto_1004475 ) ) ( not ( = ?auto_1004469 ?auto_1004470 ) ) ( not ( = ?auto_1004469 ?auto_1004471 ) ) ( not ( = ?auto_1004469 ?auto_1004472 ) ) ( not ( = ?auto_1004469 ?auto_1004473 ) ) ( not ( = ?auto_1004469 ?auto_1004474 ) ) ( not ( = ?auto_1004469 ?auto_1004475 ) ) ( not ( = ?auto_1004470 ?auto_1004471 ) ) ( not ( = ?auto_1004470 ?auto_1004472 ) ) ( not ( = ?auto_1004470 ?auto_1004473 ) ) ( not ( = ?auto_1004470 ?auto_1004474 ) ) ( not ( = ?auto_1004470 ?auto_1004475 ) ) ( not ( = ?auto_1004471 ?auto_1004472 ) ) ( not ( = ?auto_1004471 ?auto_1004473 ) ) ( not ( = ?auto_1004471 ?auto_1004474 ) ) ( not ( = ?auto_1004471 ?auto_1004475 ) ) ( not ( = ?auto_1004472 ?auto_1004473 ) ) ( not ( = ?auto_1004472 ?auto_1004474 ) ) ( not ( = ?auto_1004472 ?auto_1004475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1004473 ?auto_1004474 ?auto_1004475 )
      ( MAKE-11CRATE-VERIFY ?auto_1004464 ?auto_1004465 ?auto_1004466 ?auto_1004468 ?auto_1004467 ?auto_1004469 ?auto_1004470 ?auto_1004471 ?auto_1004472 ?auto_1004473 ?auto_1004474 ?auto_1004475 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1004585 - SURFACE
      ?auto_1004586 - SURFACE
      ?auto_1004587 - SURFACE
      ?auto_1004589 - SURFACE
      ?auto_1004588 - SURFACE
      ?auto_1004590 - SURFACE
      ?auto_1004591 - SURFACE
      ?auto_1004592 - SURFACE
      ?auto_1004593 - SURFACE
      ?auto_1004594 - SURFACE
      ?auto_1004595 - SURFACE
      ?auto_1004596 - SURFACE
    )
    :vars
    (
      ?auto_1004599 - HOIST
      ?auto_1004597 - PLACE
      ?auto_1004598 - TRUCK
      ?auto_1004600 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004599 ?auto_1004597 ) ( SURFACE-AT ?auto_1004595 ?auto_1004597 ) ( CLEAR ?auto_1004595 ) ( IS-CRATE ?auto_1004596 ) ( not ( = ?auto_1004595 ?auto_1004596 ) ) ( AVAILABLE ?auto_1004599 ) ( IN ?auto_1004596 ?auto_1004598 ) ( ON ?auto_1004595 ?auto_1004594 ) ( not ( = ?auto_1004594 ?auto_1004595 ) ) ( not ( = ?auto_1004594 ?auto_1004596 ) ) ( TRUCK-AT ?auto_1004598 ?auto_1004600 ) ( not ( = ?auto_1004600 ?auto_1004597 ) ) ( ON ?auto_1004586 ?auto_1004585 ) ( ON ?auto_1004587 ?auto_1004586 ) ( ON ?auto_1004589 ?auto_1004587 ) ( ON ?auto_1004588 ?auto_1004589 ) ( ON ?auto_1004590 ?auto_1004588 ) ( ON ?auto_1004591 ?auto_1004590 ) ( ON ?auto_1004592 ?auto_1004591 ) ( ON ?auto_1004593 ?auto_1004592 ) ( ON ?auto_1004594 ?auto_1004593 ) ( not ( = ?auto_1004585 ?auto_1004586 ) ) ( not ( = ?auto_1004585 ?auto_1004587 ) ) ( not ( = ?auto_1004585 ?auto_1004589 ) ) ( not ( = ?auto_1004585 ?auto_1004588 ) ) ( not ( = ?auto_1004585 ?auto_1004590 ) ) ( not ( = ?auto_1004585 ?auto_1004591 ) ) ( not ( = ?auto_1004585 ?auto_1004592 ) ) ( not ( = ?auto_1004585 ?auto_1004593 ) ) ( not ( = ?auto_1004585 ?auto_1004594 ) ) ( not ( = ?auto_1004585 ?auto_1004595 ) ) ( not ( = ?auto_1004585 ?auto_1004596 ) ) ( not ( = ?auto_1004586 ?auto_1004587 ) ) ( not ( = ?auto_1004586 ?auto_1004589 ) ) ( not ( = ?auto_1004586 ?auto_1004588 ) ) ( not ( = ?auto_1004586 ?auto_1004590 ) ) ( not ( = ?auto_1004586 ?auto_1004591 ) ) ( not ( = ?auto_1004586 ?auto_1004592 ) ) ( not ( = ?auto_1004586 ?auto_1004593 ) ) ( not ( = ?auto_1004586 ?auto_1004594 ) ) ( not ( = ?auto_1004586 ?auto_1004595 ) ) ( not ( = ?auto_1004586 ?auto_1004596 ) ) ( not ( = ?auto_1004587 ?auto_1004589 ) ) ( not ( = ?auto_1004587 ?auto_1004588 ) ) ( not ( = ?auto_1004587 ?auto_1004590 ) ) ( not ( = ?auto_1004587 ?auto_1004591 ) ) ( not ( = ?auto_1004587 ?auto_1004592 ) ) ( not ( = ?auto_1004587 ?auto_1004593 ) ) ( not ( = ?auto_1004587 ?auto_1004594 ) ) ( not ( = ?auto_1004587 ?auto_1004595 ) ) ( not ( = ?auto_1004587 ?auto_1004596 ) ) ( not ( = ?auto_1004589 ?auto_1004588 ) ) ( not ( = ?auto_1004589 ?auto_1004590 ) ) ( not ( = ?auto_1004589 ?auto_1004591 ) ) ( not ( = ?auto_1004589 ?auto_1004592 ) ) ( not ( = ?auto_1004589 ?auto_1004593 ) ) ( not ( = ?auto_1004589 ?auto_1004594 ) ) ( not ( = ?auto_1004589 ?auto_1004595 ) ) ( not ( = ?auto_1004589 ?auto_1004596 ) ) ( not ( = ?auto_1004588 ?auto_1004590 ) ) ( not ( = ?auto_1004588 ?auto_1004591 ) ) ( not ( = ?auto_1004588 ?auto_1004592 ) ) ( not ( = ?auto_1004588 ?auto_1004593 ) ) ( not ( = ?auto_1004588 ?auto_1004594 ) ) ( not ( = ?auto_1004588 ?auto_1004595 ) ) ( not ( = ?auto_1004588 ?auto_1004596 ) ) ( not ( = ?auto_1004590 ?auto_1004591 ) ) ( not ( = ?auto_1004590 ?auto_1004592 ) ) ( not ( = ?auto_1004590 ?auto_1004593 ) ) ( not ( = ?auto_1004590 ?auto_1004594 ) ) ( not ( = ?auto_1004590 ?auto_1004595 ) ) ( not ( = ?auto_1004590 ?auto_1004596 ) ) ( not ( = ?auto_1004591 ?auto_1004592 ) ) ( not ( = ?auto_1004591 ?auto_1004593 ) ) ( not ( = ?auto_1004591 ?auto_1004594 ) ) ( not ( = ?auto_1004591 ?auto_1004595 ) ) ( not ( = ?auto_1004591 ?auto_1004596 ) ) ( not ( = ?auto_1004592 ?auto_1004593 ) ) ( not ( = ?auto_1004592 ?auto_1004594 ) ) ( not ( = ?auto_1004592 ?auto_1004595 ) ) ( not ( = ?auto_1004592 ?auto_1004596 ) ) ( not ( = ?auto_1004593 ?auto_1004594 ) ) ( not ( = ?auto_1004593 ?auto_1004595 ) ) ( not ( = ?auto_1004593 ?auto_1004596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1004594 ?auto_1004595 ?auto_1004596 )
      ( MAKE-11CRATE-VERIFY ?auto_1004585 ?auto_1004586 ?auto_1004587 ?auto_1004589 ?auto_1004588 ?auto_1004590 ?auto_1004591 ?auto_1004592 ?auto_1004593 ?auto_1004594 ?auto_1004595 ?auto_1004596 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1004717 - SURFACE
      ?auto_1004718 - SURFACE
      ?auto_1004719 - SURFACE
      ?auto_1004721 - SURFACE
      ?auto_1004720 - SURFACE
      ?auto_1004722 - SURFACE
      ?auto_1004723 - SURFACE
      ?auto_1004724 - SURFACE
      ?auto_1004725 - SURFACE
      ?auto_1004726 - SURFACE
      ?auto_1004727 - SURFACE
      ?auto_1004728 - SURFACE
    )
    :vars
    (
      ?auto_1004729 - HOIST
      ?auto_1004730 - PLACE
      ?auto_1004733 - TRUCK
      ?auto_1004731 - PLACE
      ?auto_1004732 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004729 ?auto_1004730 ) ( SURFACE-AT ?auto_1004727 ?auto_1004730 ) ( CLEAR ?auto_1004727 ) ( IS-CRATE ?auto_1004728 ) ( not ( = ?auto_1004727 ?auto_1004728 ) ) ( AVAILABLE ?auto_1004729 ) ( ON ?auto_1004727 ?auto_1004726 ) ( not ( = ?auto_1004726 ?auto_1004727 ) ) ( not ( = ?auto_1004726 ?auto_1004728 ) ) ( TRUCK-AT ?auto_1004733 ?auto_1004731 ) ( not ( = ?auto_1004731 ?auto_1004730 ) ) ( HOIST-AT ?auto_1004732 ?auto_1004731 ) ( LIFTING ?auto_1004732 ?auto_1004728 ) ( not ( = ?auto_1004729 ?auto_1004732 ) ) ( ON ?auto_1004718 ?auto_1004717 ) ( ON ?auto_1004719 ?auto_1004718 ) ( ON ?auto_1004721 ?auto_1004719 ) ( ON ?auto_1004720 ?auto_1004721 ) ( ON ?auto_1004722 ?auto_1004720 ) ( ON ?auto_1004723 ?auto_1004722 ) ( ON ?auto_1004724 ?auto_1004723 ) ( ON ?auto_1004725 ?auto_1004724 ) ( ON ?auto_1004726 ?auto_1004725 ) ( not ( = ?auto_1004717 ?auto_1004718 ) ) ( not ( = ?auto_1004717 ?auto_1004719 ) ) ( not ( = ?auto_1004717 ?auto_1004721 ) ) ( not ( = ?auto_1004717 ?auto_1004720 ) ) ( not ( = ?auto_1004717 ?auto_1004722 ) ) ( not ( = ?auto_1004717 ?auto_1004723 ) ) ( not ( = ?auto_1004717 ?auto_1004724 ) ) ( not ( = ?auto_1004717 ?auto_1004725 ) ) ( not ( = ?auto_1004717 ?auto_1004726 ) ) ( not ( = ?auto_1004717 ?auto_1004727 ) ) ( not ( = ?auto_1004717 ?auto_1004728 ) ) ( not ( = ?auto_1004718 ?auto_1004719 ) ) ( not ( = ?auto_1004718 ?auto_1004721 ) ) ( not ( = ?auto_1004718 ?auto_1004720 ) ) ( not ( = ?auto_1004718 ?auto_1004722 ) ) ( not ( = ?auto_1004718 ?auto_1004723 ) ) ( not ( = ?auto_1004718 ?auto_1004724 ) ) ( not ( = ?auto_1004718 ?auto_1004725 ) ) ( not ( = ?auto_1004718 ?auto_1004726 ) ) ( not ( = ?auto_1004718 ?auto_1004727 ) ) ( not ( = ?auto_1004718 ?auto_1004728 ) ) ( not ( = ?auto_1004719 ?auto_1004721 ) ) ( not ( = ?auto_1004719 ?auto_1004720 ) ) ( not ( = ?auto_1004719 ?auto_1004722 ) ) ( not ( = ?auto_1004719 ?auto_1004723 ) ) ( not ( = ?auto_1004719 ?auto_1004724 ) ) ( not ( = ?auto_1004719 ?auto_1004725 ) ) ( not ( = ?auto_1004719 ?auto_1004726 ) ) ( not ( = ?auto_1004719 ?auto_1004727 ) ) ( not ( = ?auto_1004719 ?auto_1004728 ) ) ( not ( = ?auto_1004721 ?auto_1004720 ) ) ( not ( = ?auto_1004721 ?auto_1004722 ) ) ( not ( = ?auto_1004721 ?auto_1004723 ) ) ( not ( = ?auto_1004721 ?auto_1004724 ) ) ( not ( = ?auto_1004721 ?auto_1004725 ) ) ( not ( = ?auto_1004721 ?auto_1004726 ) ) ( not ( = ?auto_1004721 ?auto_1004727 ) ) ( not ( = ?auto_1004721 ?auto_1004728 ) ) ( not ( = ?auto_1004720 ?auto_1004722 ) ) ( not ( = ?auto_1004720 ?auto_1004723 ) ) ( not ( = ?auto_1004720 ?auto_1004724 ) ) ( not ( = ?auto_1004720 ?auto_1004725 ) ) ( not ( = ?auto_1004720 ?auto_1004726 ) ) ( not ( = ?auto_1004720 ?auto_1004727 ) ) ( not ( = ?auto_1004720 ?auto_1004728 ) ) ( not ( = ?auto_1004722 ?auto_1004723 ) ) ( not ( = ?auto_1004722 ?auto_1004724 ) ) ( not ( = ?auto_1004722 ?auto_1004725 ) ) ( not ( = ?auto_1004722 ?auto_1004726 ) ) ( not ( = ?auto_1004722 ?auto_1004727 ) ) ( not ( = ?auto_1004722 ?auto_1004728 ) ) ( not ( = ?auto_1004723 ?auto_1004724 ) ) ( not ( = ?auto_1004723 ?auto_1004725 ) ) ( not ( = ?auto_1004723 ?auto_1004726 ) ) ( not ( = ?auto_1004723 ?auto_1004727 ) ) ( not ( = ?auto_1004723 ?auto_1004728 ) ) ( not ( = ?auto_1004724 ?auto_1004725 ) ) ( not ( = ?auto_1004724 ?auto_1004726 ) ) ( not ( = ?auto_1004724 ?auto_1004727 ) ) ( not ( = ?auto_1004724 ?auto_1004728 ) ) ( not ( = ?auto_1004725 ?auto_1004726 ) ) ( not ( = ?auto_1004725 ?auto_1004727 ) ) ( not ( = ?auto_1004725 ?auto_1004728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1004726 ?auto_1004727 ?auto_1004728 )
      ( MAKE-11CRATE-VERIFY ?auto_1004717 ?auto_1004718 ?auto_1004719 ?auto_1004721 ?auto_1004720 ?auto_1004722 ?auto_1004723 ?auto_1004724 ?auto_1004725 ?auto_1004726 ?auto_1004727 ?auto_1004728 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1004860 - SURFACE
      ?auto_1004861 - SURFACE
      ?auto_1004862 - SURFACE
      ?auto_1004864 - SURFACE
      ?auto_1004863 - SURFACE
      ?auto_1004865 - SURFACE
      ?auto_1004866 - SURFACE
      ?auto_1004867 - SURFACE
      ?auto_1004868 - SURFACE
      ?auto_1004869 - SURFACE
      ?auto_1004870 - SURFACE
      ?auto_1004871 - SURFACE
    )
    :vars
    (
      ?auto_1004877 - HOIST
      ?auto_1004872 - PLACE
      ?auto_1004875 - TRUCK
      ?auto_1004873 - PLACE
      ?auto_1004874 - HOIST
      ?auto_1004876 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004877 ?auto_1004872 ) ( SURFACE-AT ?auto_1004870 ?auto_1004872 ) ( CLEAR ?auto_1004870 ) ( IS-CRATE ?auto_1004871 ) ( not ( = ?auto_1004870 ?auto_1004871 ) ) ( AVAILABLE ?auto_1004877 ) ( ON ?auto_1004870 ?auto_1004869 ) ( not ( = ?auto_1004869 ?auto_1004870 ) ) ( not ( = ?auto_1004869 ?auto_1004871 ) ) ( TRUCK-AT ?auto_1004875 ?auto_1004873 ) ( not ( = ?auto_1004873 ?auto_1004872 ) ) ( HOIST-AT ?auto_1004874 ?auto_1004873 ) ( not ( = ?auto_1004877 ?auto_1004874 ) ) ( AVAILABLE ?auto_1004874 ) ( SURFACE-AT ?auto_1004871 ?auto_1004873 ) ( ON ?auto_1004871 ?auto_1004876 ) ( CLEAR ?auto_1004871 ) ( not ( = ?auto_1004870 ?auto_1004876 ) ) ( not ( = ?auto_1004871 ?auto_1004876 ) ) ( not ( = ?auto_1004869 ?auto_1004876 ) ) ( ON ?auto_1004861 ?auto_1004860 ) ( ON ?auto_1004862 ?auto_1004861 ) ( ON ?auto_1004864 ?auto_1004862 ) ( ON ?auto_1004863 ?auto_1004864 ) ( ON ?auto_1004865 ?auto_1004863 ) ( ON ?auto_1004866 ?auto_1004865 ) ( ON ?auto_1004867 ?auto_1004866 ) ( ON ?auto_1004868 ?auto_1004867 ) ( ON ?auto_1004869 ?auto_1004868 ) ( not ( = ?auto_1004860 ?auto_1004861 ) ) ( not ( = ?auto_1004860 ?auto_1004862 ) ) ( not ( = ?auto_1004860 ?auto_1004864 ) ) ( not ( = ?auto_1004860 ?auto_1004863 ) ) ( not ( = ?auto_1004860 ?auto_1004865 ) ) ( not ( = ?auto_1004860 ?auto_1004866 ) ) ( not ( = ?auto_1004860 ?auto_1004867 ) ) ( not ( = ?auto_1004860 ?auto_1004868 ) ) ( not ( = ?auto_1004860 ?auto_1004869 ) ) ( not ( = ?auto_1004860 ?auto_1004870 ) ) ( not ( = ?auto_1004860 ?auto_1004871 ) ) ( not ( = ?auto_1004860 ?auto_1004876 ) ) ( not ( = ?auto_1004861 ?auto_1004862 ) ) ( not ( = ?auto_1004861 ?auto_1004864 ) ) ( not ( = ?auto_1004861 ?auto_1004863 ) ) ( not ( = ?auto_1004861 ?auto_1004865 ) ) ( not ( = ?auto_1004861 ?auto_1004866 ) ) ( not ( = ?auto_1004861 ?auto_1004867 ) ) ( not ( = ?auto_1004861 ?auto_1004868 ) ) ( not ( = ?auto_1004861 ?auto_1004869 ) ) ( not ( = ?auto_1004861 ?auto_1004870 ) ) ( not ( = ?auto_1004861 ?auto_1004871 ) ) ( not ( = ?auto_1004861 ?auto_1004876 ) ) ( not ( = ?auto_1004862 ?auto_1004864 ) ) ( not ( = ?auto_1004862 ?auto_1004863 ) ) ( not ( = ?auto_1004862 ?auto_1004865 ) ) ( not ( = ?auto_1004862 ?auto_1004866 ) ) ( not ( = ?auto_1004862 ?auto_1004867 ) ) ( not ( = ?auto_1004862 ?auto_1004868 ) ) ( not ( = ?auto_1004862 ?auto_1004869 ) ) ( not ( = ?auto_1004862 ?auto_1004870 ) ) ( not ( = ?auto_1004862 ?auto_1004871 ) ) ( not ( = ?auto_1004862 ?auto_1004876 ) ) ( not ( = ?auto_1004864 ?auto_1004863 ) ) ( not ( = ?auto_1004864 ?auto_1004865 ) ) ( not ( = ?auto_1004864 ?auto_1004866 ) ) ( not ( = ?auto_1004864 ?auto_1004867 ) ) ( not ( = ?auto_1004864 ?auto_1004868 ) ) ( not ( = ?auto_1004864 ?auto_1004869 ) ) ( not ( = ?auto_1004864 ?auto_1004870 ) ) ( not ( = ?auto_1004864 ?auto_1004871 ) ) ( not ( = ?auto_1004864 ?auto_1004876 ) ) ( not ( = ?auto_1004863 ?auto_1004865 ) ) ( not ( = ?auto_1004863 ?auto_1004866 ) ) ( not ( = ?auto_1004863 ?auto_1004867 ) ) ( not ( = ?auto_1004863 ?auto_1004868 ) ) ( not ( = ?auto_1004863 ?auto_1004869 ) ) ( not ( = ?auto_1004863 ?auto_1004870 ) ) ( not ( = ?auto_1004863 ?auto_1004871 ) ) ( not ( = ?auto_1004863 ?auto_1004876 ) ) ( not ( = ?auto_1004865 ?auto_1004866 ) ) ( not ( = ?auto_1004865 ?auto_1004867 ) ) ( not ( = ?auto_1004865 ?auto_1004868 ) ) ( not ( = ?auto_1004865 ?auto_1004869 ) ) ( not ( = ?auto_1004865 ?auto_1004870 ) ) ( not ( = ?auto_1004865 ?auto_1004871 ) ) ( not ( = ?auto_1004865 ?auto_1004876 ) ) ( not ( = ?auto_1004866 ?auto_1004867 ) ) ( not ( = ?auto_1004866 ?auto_1004868 ) ) ( not ( = ?auto_1004866 ?auto_1004869 ) ) ( not ( = ?auto_1004866 ?auto_1004870 ) ) ( not ( = ?auto_1004866 ?auto_1004871 ) ) ( not ( = ?auto_1004866 ?auto_1004876 ) ) ( not ( = ?auto_1004867 ?auto_1004868 ) ) ( not ( = ?auto_1004867 ?auto_1004869 ) ) ( not ( = ?auto_1004867 ?auto_1004870 ) ) ( not ( = ?auto_1004867 ?auto_1004871 ) ) ( not ( = ?auto_1004867 ?auto_1004876 ) ) ( not ( = ?auto_1004868 ?auto_1004869 ) ) ( not ( = ?auto_1004868 ?auto_1004870 ) ) ( not ( = ?auto_1004868 ?auto_1004871 ) ) ( not ( = ?auto_1004868 ?auto_1004876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1004869 ?auto_1004870 ?auto_1004871 )
      ( MAKE-11CRATE-VERIFY ?auto_1004860 ?auto_1004861 ?auto_1004862 ?auto_1004864 ?auto_1004863 ?auto_1004865 ?auto_1004866 ?auto_1004867 ?auto_1004868 ?auto_1004869 ?auto_1004870 ?auto_1004871 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005004 - SURFACE
      ?auto_1005005 - SURFACE
      ?auto_1005006 - SURFACE
      ?auto_1005008 - SURFACE
      ?auto_1005007 - SURFACE
      ?auto_1005009 - SURFACE
      ?auto_1005010 - SURFACE
      ?auto_1005011 - SURFACE
      ?auto_1005012 - SURFACE
      ?auto_1005013 - SURFACE
      ?auto_1005014 - SURFACE
      ?auto_1005015 - SURFACE
    )
    :vars
    (
      ?auto_1005018 - HOIST
      ?auto_1005019 - PLACE
      ?auto_1005020 - PLACE
      ?auto_1005021 - HOIST
      ?auto_1005016 - SURFACE
      ?auto_1005017 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005018 ?auto_1005019 ) ( SURFACE-AT ?auto_1005014 ?auto_1005019 ) ( CLEAR ?auto_1005014 ) ( IS-CRATE ?auto_1005015 ) ( not ( = ?auto_1005014 ?auto_1005015 ) ) ( AVAILABLE ?auto_1005018 ) ( ON ?auto_1005014 ?auto_1005013 ) ( not ( = ?auto_1005013 ?auto_1005014 ) ) ( not ( = ?auto_1005013 ?auto_1005015 ) ) ( not ( = ?auto_1005020 ?auto_1005019 ) ) ( HOIST-AT ?auto_1005021 ?auto_1005020 ) ( not ( = ?auto_1005018 ?auto_1005021 ) ) ( AVAILABLE ?auto_1005021 ) ( SURFACE-AT ?auto_1005015 ?auto_1005020 ) ( ON ?auto_1005015 ?auto_1005016 ) ( CLEAR ?auto_1005015 ) ( not ( = ?auto_1005014 ?auto_1005016 ) ) ( not ( = ?auto_1005015 ?auto_1005016 ) ) ( not ( = ?auto_1005013 ?auto_1005016 ) ) ( TRUCK-AT ?auto_1005017 ?auto_1005019 ) ( ON ?auto_1005005 ?auto_1005004 ) ( ON ?auto_1005006 ?auto_1005005 ) ( ON ?auto_1005008 ?auto_1005006 ) ( ON ?auto_1005007 ?auto_1005008 ) ( ON ?auto_1005009 ?auto_1005007 ) ( ON ?auto_1005010 ?auto_1005009 ) ( ON ?auto_1005011 ?auto_1005010 ) ( ON ?auto_1005012 ?auto_1005011 ) ( ON ?auto_1005013 ?auto_1005012 ) ( not ( = ?auto_1005004 ?auto_1005005 ) ) ( not ( = ?auto_1005004 ?auto_1005006 ) ) ( not ( = ?auto_1005004 ?auto_1005008 ) ) ( not ( = ?auto_1005004 ?auto_1005007 ) ) ( not ( = ?auto_1005004 ?auto_1005009 ) ) ( not ( = ?auto_1005004 ?auto_1005010 ) ) ( not ( = ?auto_1005004 ?auto_1005011 ) ) ( not ( = ?auto_1005004 ?auto_1005012 ) ) ( not ( = ?auto_1005004 ?auto_1005013 ) ) ( not ( = ?auto_1005004 ?auto_1005014 ) ) ( not ( = ?auto_1005004 ?auto_1005015 ) ) ( not ( = ?auto_1005004 ?auto_1005016 ) ) ( not ( = ?auto_1005005 ?auto_1005006 ) ) ( not ( = ?auto_1005005 ?auto_1005008 ) ) ( not ( = ?auto_1005005 ?auto_1005007 ) ) ( not ( = ?auto_1005005 ?auto_1005009 ) ) ( not ( = ?auto_1005005 ?auto_1005010 ) ) ( not ( = ?auto_1005005 ?auto_1005011 ) ) ( not ( = ?auto_1005005 ?auto_1005012 ) ) ( not ( = ?auto_1005005 ?auto_1005013 ) ) ( not ( = ?auto_1005005 ?auto_1005014 ) ) ( not ( = ?auto_1005005 ?auto_1005015 ) ) ( not ( = ?auto_1005005 ?auto_1005016 ) ) ( not ( = ?auto_1005006 ?auto_1005008 ) ) ( not ( = ?auto_1005006 ?auto_1005007 ) ) ( not ( = ?auto_1005006 ?auto_1005009 ) ) ( not ( = ?auto_1005006 ?auto_1005010 ) ) ( not ( = ?auto_1005006 ?auto_1005011 ) ) ( not ( = ?auto_1005006 ?auto_1005012 ) ) ( not ( = ?auto_1005006 ?auto_1005013 ) ) ( not ( = ?auto_1005006 ?auto_1005014 ) ) ( not ( = ?auto_1005006 ?auto_1005015 ) ) ( not ( = ?auto_1005006 ?auto_1005016 ) ) ( not ( = ?auto_1005008 ?auto_1005007 ) ) ( not ( = ?auto_1005008 ?auto_1005009 ) ) ( not ( = ?auto_1005008 ?auto_1005010 ) ) ( not ( = ?auto_1005008 ?auto_1005011 ) ) ( not ( = ?auto_1005008 ?auto_1005012 ) ) ( not ( = ?auto_1005008 ?auto_1005013 ) ) ( not ( = ?auto_1005008 ?auto_1005014 ) ) ( not ( = ?auto_1005008 ?auto_1005015 ) ) ( not ( = ?auto_1005008 ?auto_1005016 ) ) ( not ( = ?auto_1005007 ?auto_1005009 ) ) ( not ( = ?auto_1005007 ?auto_1005010 ) ) ( not ( = ?auto_1005007 ?auto_1005011 ) ) ( not ( = ?auto_1005007 ?auto_1005012 ) ) ( not ( = ?auto_1005007 ?auto_1005013 ) ) ( not ( = ?auto_1005007 ?auto_1005014 ) ) ( not ( = ?auto_1005007 ?auto_1005015 ) ) ( not ( = ?auto_1005007 ?auto_1005016 ) ) ( not ( = ?auto_1005009 ?auto_1005010 ) ) ( not ( = ?auto_1005009 ?auto_1005011 ) ) ( not ( = ?auto_1005009 ?auto_1005012 ) ) ( not ( = ?auto_1005009 ?auto_1005013 ) ) ( not ( = ?auto_1005009 ?auto_1005014 ) ) ( not ( = ?auto_1005009 ?auto_1005015 ) ) ( not ( = ?auto_1005009 ?auto_1005016 ) ) ( not ( = ?auto_1005010 ?auto_1005011 ) ) ( not ( = ?auto_1005010 ?auto_1005012 ) ) ( not ( = ?auto_1005010 ?auto_1005013 ) ) ( not ( = ?auto_1005010 ?auto_1005014 ) ) ( not ( = ?auto_1005010 ?auto_1005015 ) ) ( not ( = ?auto_1005010 ?auto_1005016 ) ) ( not ( = ?auto_1005011 ?auto_1005012 ) ) ( not ( = ?auto_1005011 ?auto_1005013 ) ) ( not ( = ?auto_1005011 ?auto_1005014 ) ) ( not ( = ?auto_1005011 ?auto_1005015 ) ) ( not ( = ?auto_1005011 ?auto_1005016 ) ) ( not ( = ?auto_1005012 ?auto_1005013 ) ) ( not ( = ?auto_1005012 ?auto_1005014 ) ) ( not ( = ?auto_1005012 ?auto_1005015 ) ) ( not ( = ?auto_1005012 ?auto_1005016 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005013 ?auto_1005014 ?auto_1005015 )
      ( MAKE-11CRATE-VERIFY ?auto_1005004 ?auto_1005005 ?auto_1005006 ?auto_1005008 ?auto_1005007 ?auto_1005009 ?auto_1005010 ?auto_1005011 ?auto_1005012 ?auto_1005013 ?auto_1005014 ?auto_1005015 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005148 - SURFACE
      ?auto_1005149 - SURFACE
      ?auto_1005150 - SURFACE
      ?auto_1005152 - SURFACE
      ?auto_1005151 - SURFACE
      ?auto_1005153 - SURFACE
      ?auto_1005154 - SURFACE
      ?auto_1005155 - SURFACE
      ?auto_1005156 - SURFACE
      ?auto_1005157 - SURFACE
      ?auto_1005158 - SURFACE
      ?auto_1005159 - SURFACE
    )
    :vars
    (
      ?auto_1005161 - HOIST
      ?auto_1005165 - PLACE
      ?auto_1005164 - PLACE
      ?auto_1005163 - HOIST
      ?auto_1005162 - SURFACE
      ?auto_1005160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005161 ?auto_1005165 ) ( IS-CRATE ?auto_1005159 ) ( not ( = ?auto_1005158 ?auto_1005159 ) ) ( not ( = ?auto_1005157 ?auto_1005158 ) ) ( not ( = ?auto_1005157 ?auto_1005159 ) ) ( not ( = ?auto_1005164 ?auto_1005165 ) ) ( HOIST-AT ?auto_1005163 ?auto_1005164 ) ( not ( = ?auto_1005161 ?auto_1005163 ) ) ( AVAILABLE ?auto_1005163 ) ( SURFACE-AT ?auto_1005159 ?auto_1005164 ) ( ON ?auto_1005159 ?auto_1005162 ) ( CLEAR ?auto_1005159 ) ( not ( = ?auto_1005158 ?auto_1005162 ) ) ( not ( = ?auto_1005159 ?auto_1005162 ) ) ( not ( = ?auto_1005157 ?auto_1005162 ) ) ( TRUCK-AT ?auto_1005160 ?auto_1005165 ) ( SURFACE-AT ?auto_1005157 ?auto_1005165 ) ( CLEAR ?auto_1005157 ) ( LIFTING ?auto_1005161 ?auto_1005158 ) ( IS-CRATE ?auto_1005158 ) ( ON ?auto_1005149 ?auto_1005148 ) ( ON ?auto_1005150 ?auto_1005149 ) ( ON ?auto_1005152 ?auto_1005150 ) ( ON ?auto_1005151 ?auto_1005152 ) ( ON ?auto_1005153 ?auto_1005151 ) ( ON ?auto_1005154 ?auto_1005153 ) ( ON ?auto_1005155 ?auto_1005154 ) ( ON ?auto_1005156 ?auto_1005155 ) ( ON ?auto_1005157 ?auto_1005156 ) ( not ( = ?auto_1005148 ?auto_1005149 ) ) ( not ( = ?auto_1005148 ?auto_1005150 ) ) ( not ( = ?auto_1005148 ?auto_1005152 ) ) ( not ( = ?auto_1005148 ?auto_1005151 ) ) ( not ( = ?auto_1005148 ?auto_1005153 ) ) ( not ( = ?auto_1005148 ?auto_1005154 ) ) ( not ( = ?auto_1005148 ?auto_1005155 ) ) ( not ( = ?auto_1005148 ?auto_1005156 ) ) ( not ( = ?auto_1005148 ?auto_1005157 ) ) ( not ( = ?auto_1005148 ?auto_1005158 ) ) ( not ( = ?auto_1005148 ?auto_1005159 ) ) ( not ( = ?auto_1005148 ?auto_1005162 ) ) ( not ( = ?auto_1005149 ?auto_1005150 ) ) ( not ( = ?auto_1005149 ?auto_1005152 ) ) ( not ( = ?auto_1005149 ?auto_1005151 ) ) ( not ( = ?auto_1005149 ?auto_1005153 ) ) ( not ( = ?auto_1005149 ?auto_1005154 ) ) ( not ( = ?auto_1005149 ?auto_1005155 ) ) ( not ( = ?auto_1005149 ?auto_1005156 ) ) ( not ( = ?auto_1005149 ?auto_1005157 ) ) ( not ( = ?auto_1005149 ?auto_1005158 ) ) ( not ( = ?auto_1005149 ?auto_1005159 ) ) ( not ( = ?auto_1005149 ?auto_1005162 ) ) ( not ( = ?auto_1005150 ?auto_1005152 ) ) ( not ( = ?auto_1005150 ?auto_1005151 ) ) ( not ( = ?auto_1005150 ?auto_1005153 ) ) ( not ( = ?auto_1005150 ?auto_1005154 ) ) ( not ( = ?auto_1005150 ?auto_1005155 ) ) ( not ( = ?auto_1005150 ?auto_1005156 ) ) ( not ( = ?auto_1005150 ?auto_1005157 ) ) ( not ( = ?auto_1005150 ?auto_1005158 ) ) ( not ( = ?auto_1005150 ?auto_1005159 ) ) ( not ( = ?auto_1005150 ?auto_1005162 ) ) ( not ( = ?auto_1005152 ?auto_1005151 ) ) ( not ( = ?auto_1005152 ?auto_1005153 ) ) ( not ( = ?auto_1005152 ?auto_1005154 ) ) ( not ( = ?auto_1005152 ?auto_1005155 ) ) ( not ( = ?auto_1005152 ?auto_1005156 ) ) ( not ( = ?auto_1005152 ?auto_1005157 ) ) ( not ( = ?auto_1005152 ?auto_1005158 ) ) ( not ( = ?auto_1005152 ?auto_1005159 ) ) ( not ( = ?auto_1005152 ?auto_1005162 ) ) ( not ( = ?auto_1005151 ?auto_1005153 ) ) ( not ( = ?auto_1005151 ?auto_1005154 ) ) ( not ( = ?auto_1005151 ?auto_1005155 ) ) ( not ( = ?auto_1005151 ?auto_1005156 ) ) ( not ( = ?auto_1005151 ?auto_1005157 ) ) ( not ( = ?auto_1005151 ?auto_1005158 ) ) ( not ( = ?auto_1005151 ?auto_1005159 ) ) ( not ( = ?auto_1005151 ?auto_1005162 ) ) ( not ( = ?auto_1005153 ?auto_1005154 ) ) ( not ( = ?auto_1005153 ?auto_1005155 ) ) ( not ( = ?auto_1005153 ?auto_1005156 ) ) ( not ( = ?auto_1005153 ?auto_1005157 ) ) ( not ( = ?auto_1005153 ?auto_1005158 ) ) ( not ( = ?auto_1005153 ?auto_1005159 ) ) ( not ( = ?auto_1005153 ?auto_1005162 ) ) ( not ( = ?auto_1005154 ?auto_1005155 ) ) ( not ( = ?auto_1005154 ?auto_1005156 ) ) ( not ( = ?auto_1005154 ?auto_1005157 ) ) ( not ( = ?auto_1005154 ?auto_1005158 ) ) ( not ( = ?auto_1005154 ?auto_1005159 ) ) ( not ( = ?auto_1005154 ?auto_1005162 ) ) ( not ( = ?auto_1005155 ?auto_1005156 ) ) ( not ( = ?auto_1005155 ?auto_1005157 ) ) ( not ( = ?auto_1005155 ?auto_1005158 ) ) ( not ( = ?auto_1005155 ?auto_1005159 ) ) ( not ( = ?auto_1005155 ?auto_1005162 ) ) ( not ( = ?auto_1005156 ?auto_1005157 ) ) ( not ( = ?auto_1005156 ?auto_1005158 ) ) ( not ( = ?auto_1005156 ?auto_1005159 ) ) ( not ( = ?auto_1005156 ?auto_1005162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005157 ?auto_1005158 ?auto_1005159 )
      ( MAKE-11CRATE-VERIFY ?auto_1005148 ?auto_1005149 ?auto_1005150 ?auto_1005152 ?auto_1005151 ?auto_1005153 ?auto_1005154 ?auto_1005155 ?auto_1005156 ?auto_1005157 ?auto_1005158 ?auto_1005159 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1005292 - SURFACE
      ?auto_1005293 - SURFACE
      ?auto_1005294 - SURFACE
      ?auto_1005296 - SURFACE
      ?auto_1005295 - SURFACE
      ?auto_1005297 - SURFACE
      ?auto_1005298 - SURFACE
      ?auto_1005299 - SURFACE
      ?auto_1005300 - SURFACE
      ?auto_1005301 - SURFACE
      ?auto_1005302 - SURFACE
      ?auto_1005303 - SURFACE
    )
    :vars
    (
      ?auto_1005304 - HOIST
      ?auto_1005307 - PLACE
      ?auto_1005306 - PLACE
      ?auto_1005305 - HOIST
      ?auto_1005309 - SURFACE
      ?auto_1005308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005304 ?auto_1005307 ) ( IS-CRATE ?auto_1005303 ) ( not ( = ?auto_1005302 ?auto_1005303 ) ) ( not ( = ?auto_1005301 ?auto_1005302 ) ) ( not ( = ?auto_1005301 ?auto_1005303 ) ) ( not ( = ?auto_1005306 ?auto_1005307 ) ) ( HOIST-AT ?auto_1005305 ?auto_1005306 ) ( not ( = ?auto_1005304 ?auto_1005305 ) ) ( AVAILABLE ?auto_1005305 ) ( SURFACE-AT ?auto_1005303 ?auto_1005306 ) ( ON ?auto_1005303 ?auto_1005309 ) ( CLEAR ?auto_1005303 ) ( not ( = ?auto_1005302 ?auto_1005309 ) ) ( not ( = ?auto_1005303 ?auto_1005309 ) ) ( not ( = ?auto_1005301 ?auto_1005309 ) ) ( TRUCK-AT ?auto_1005308 ?auto_1005307 ) ( SURFACE-AT ?auto_1005301 ?auto_1005307 ) ( CLEAR ?auto_1005301 ) ( IS-CRATE ?auto_1005302 ) ( AVAILABLE ?auto_1005304 ) ( IN ?auto_1005302 ?auto_1005308 ) ( ON ?auto_1005293 ?auto_1005292 ) ( ON ?auto_1005294 ?auto_1005293 ) ( ON ?auto_1005296 ?auto_1005294 ) ( ON ?auto_1005295 ?auto_1005296 ) ( ON ?auto_1005297 ?auto_1005295 ) ( ON ?auto_1005298 ?auto_1005297 ) ( ON ?auto_1005299 ?auto_1005298 ) ( ON ?auto_1005300 ?auto_1005299 ) ( ON ?auto_1005301 ?auto_1005300 ) ( not ( = ?auto_1005292 ?auto_1005293 ) ) ( not ( = ?auto_1005292 ?auto_1005294 ) ) ( not ( = ?auto_1005292 ?auto_1005296 ) ) ( not ( = ?auto_1005292 ?auto_1005295 ) ) ( not ( = ?auto_1005292 ?auto_1005297 ) ) ( not ( = ?auto_1005292 ?auto_1005298 ) ) ( not ( = ?auto_1005292 ?auto_1005299 ) ) ( not ( = ?auto_1005292 ?auto_1005300 ) ) ( not ( = ?auto_1005292 ?auto_1005301 ) ) ( not ( = ?auto_1005292 ?auto_1005302 ) ) ( not ( = ?auto_1005292 ?auto_1005303 ) ) ( not ( = ?auto_1005292 ?auto_1005309 ) ) ( not ( = ?auto_1005293 ?auto_1005294 ) ) ( not ( = ?auto_1005293 ?auto_1005296 ) ) ( not ( = ?auto_1005293 ?auto_1005295 ) ) ( not ( = ?auto_1005293 ?auto_1005297 ) ) ( not ( = ?auto_1005293 ?auto_1005298 ) ) ( not ( = ?auto_1005293 ?auto_1005299 ) ) ( not ( = ?auto_1005293 ?auto_1005300 ) ) ( not ( = ?auto_1005293 ?auto_1005301 ) ) ( not ( = ?auto_1005293 ?auto_1005302 ) ) ( not ( = ?auto_1005293 ?auto_1005303 ) ) ( not ( = ?auto_1005293 ?auto_1005309 ) ) ( not ( = ?auto_1005294 ?auto_1005296 ) ) ( not ( = ?auto_1005294 ?auto_1005295 ) ) ( not ( = ?auto_1005294 ?auto_1005297 ) ) ( not ( = ?auto_1005294 ?auto_1005298 ) ) ( not ( = ?auto_1005294 ?auto_1005299 ) ) ( not ( = ?auto_1005294 ?auto_1005300 ) ) ( not ( = ?auto_1005294 ?auto_1005301 ) ) ( not ( = ?auto_1005294 ?auto_1005302 ) ) ( not ( = ?auto_1005294 ?auto_1005303 ) ) ( not ( = ?auto_1005294 ?auto_1005309 ) ) ( not ( = ?auto_1005296 ?auto_1005295 ) ) ( not ( = ?auto_1005296 ?auto_1005297 ) ) ( not ( = ?auto_1005296 ?auto_1005298 ) ) ( not ( = ?auto_1005296 ?auto_1005299 ) ) ( not ( = ?auto_1005296 ?auto_1005300 ) ) ( not ( = ?auto_1005296 ?auto_1005301 ) ) ( not ( = ?auto_1005296 ?auto_1005302 ) ) ( not ( = ?auto_1005296 ?auto_1005303 ) ) ( not ( = ?auto_1005296 ?auto_1005309 ) ) ( not ( = ?auto_1005295 ?auto_1005297 ) ) ( not ( = ?auto_1005295 ?auto_1005298 ) ) ( not ( = ?auto_1005295 ?auto_1005299 ) ) ( not ( = ?auto_1005295 ?auto_1005300 ) ) ( not ( = ?auto_1005295 ?auto_1005301 ) ) ( not ( = ?auto_1005295 ?auto_1005302 ) ) ( not ( = ?auto_1005295 ?auto_1005303 ) ) ( not ( = ?auto_1005295 ?auto_1005309 ) ) ( not ( = ?auto_1005297 ?auto_1005298 ) ) ( not ( = ?auto_1005297 ?auto_1005299 ) ) ( not ( = ?auto_1005297 ?auto_1005300 ) ) ( not ( = ?auto_1005297 ?auto_1005301 ) ) ( not ( = ?auto_1005297 ?auto_1005302 ) ) ( not ( = ?auto_1005297 ?auto_1005303 ) ) ( not ( = ?auto_1005297 ?auto_1005309 ) ) ( not ( = ?auto_1005298 ?auto_1005299 ) ) ( not ( = ?auto_1005298 ?auto_1005300 ) ) ( not ( = ?auto_1005298 ?auto_1005301 ) ) ( not ( = ?auto_1005298 ?auto_1005302 ) ) ( not ( = ?auto_1005298 ?auto_1005303 ) ) ( not ( = ?auto_1005298 ?auto_1005309 ) ) ( not ( = ?auto_1005299 ?auto_1005300 ) ) ( not ( = ?auto_1005299 ?auto_1005301 ) ) ( not ( = ?auto_1005299 ?auto_1005302 ) ) ( not ( = ?auto_1005299 ?auto_1005303 ) ) ( not ( = ?auto_1005299 ?auto_1005309 ) ) ( not ( = ?auto_1005300 ?auto_1005301 ) ) ( not ( = ?auto_1005300 ?auto_1005302 ) ) ( not ( = ?auto_1005300 ?auto_1005303 ) ) ( not ( = ?auto_1005300 ?auto_1005309 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1005301 ?auto_1005302 ?auto_1005303 )
      ( MAKE-11CRATE-VERIFY ?auto_1005292 ?auto_1005293 ?auto_1005294 ?auto_1005296 ?auto_1005295 ?auto_1005297 ?auto_1005298 ?auto_1005299 ?auto_1005300 ?auto_1005301 ?auto_1005302 ?auto_1005303 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1014583 - SURFACE
      ?auto_1014584 - SURFACE
      ?auto_1014585 - SURFACE
      ?auto_1014587 - SURFACE
      ?auto_1014586 - SURFACE
      ?auto_1014588 - SURFACE
      ?auto_1014589 - SURFACE
      ?auto_1014590 - SURFACE
      ?auto_1014591 - SURFACE
      ?auto_1014592 - SURFACE
      ?auto_1014593 - SURFACE
      ?auto_1014594 - SURFACE
      ?auto_1014595 - SURFACE
    )
    :vars
    (
      ?auto_1014597 - HOIST
      ?auto_1014596 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1014597 ?auto_1014596 ) ( SURFACE-AT ?auto_1014594 ?auto_1014596 ) ( CLEAR ?auto_1014594 ) ( LIFTING ?auto_1014597 ?auto_1014595 ) ( IS-CRATE ?auto_1014595 ) ( not ( = ?auto_1014594 ?auto_1014595 ) ) ( ON ?auto_1014584 ?auto_1014583 ) ( ON ?auto_1014585 ?auto_1014584 ) ( ON ?auto_1014587 ?auto_1014585 ) ( ON ?auto_1014586 ?auto_1014587 ) ( ON ?auto_1014588 ?auto_1014586 ) ( ON ?auto_1014589 ?auto_1014588 ) ( ON ?auto_1014590 ?auto_1014589 ) ( ON ?auto_1014591 ?auto_1014590 ) ( ON ?auto_1014592 ?auto_1014591 ) ( ON ?auto_1014593 ?auto_1014592 ) ( ON ?auto_1014594 ?auto_1014593 ) ( not ( = ?auto_1014583 ?auto_1014584 ) ) ( not ( = ?auto_1014583 ?auto_1014585 ) ) ( not ( = ?auto_1014583 ?auto_1014587 ) ) ( not ( = ?auto_1014583 ?auto_1014586 ) ) ( not ( = ?auto_1014583 ?auto_1014588 ) ) ( not ( = ?auto_1014583 ?auto_1014589 ) ) ( not ( = ?auto_1014583 ?auto_1014590 ) ) ( not ( = ?auto_1014583 ?auto_1014591 ) ) ( not ( = ?auto_1014583 ?auto_1014592 ) ) ( not ( = ?auto_1014583 ?auto_1014593 ) ) ( not ( = ?auto_1014583 ?auto_1014594 ) ) ( not ( = ?auto_1014583 ?auto_1014595 ) ) ( not ( = ?auto_1014584 ?auto_1014585 ) ) ( not ( = ?auto_1014584 ?auto_1014587 ) ) ( not ( = ?auto_1014584 ?auto_1014586 ) ) ( not ( = ?auto_1014584 ?auto_1014588 ) ) ( not ( = ?auto_1014584 ?auto_1014589 ) ) ( not ( = ?auto_1014584 ?auto_1014590 ) ) ( not ( = ?auto_1014584 ?auto_1014591 ) ) ( not ( = ?auto_1014584 ?auto_1014592 ) ) ( not ( = ?auto_1014584 ?auto_1014593 ) ) ( not ( = ?auto_1014584 ?auto_1014594 ) ) ( not ( = ?auto_1014584 ?auto_1014595 ) ) ( not ( = ?auto_1014585 ?auto_1014587 ) ) ( not ( = ?auto_1014585 ?auto_1014586 ) ) ( not ( = ?auto_1014585 ?auto_1014588 ) ) ( not ( = ?auto_1014585 ?auto_1014589 ) ) ( not ( = ?auto_1014585 ?auto_1014590 ) ) ( not ( = ?auto_1014585 ?auto_1014591 ) ) ( not ( = ?auto_1014585 ?auto_1014592 ) ) ( not ( = ?auto_1014585 ?auto_1014593 ) ) ( not ( = ?auto_1014585 ?auto_1014594 ) ) ( not ( = ?auto_1014585 ?auto_1014595 ) ) ( not ( = ?auto_1014587 ?auto_1014586 ) ) ( not ( = ?auto_1014587 ?auto_1014588 ) ) ( not ( = ?auto_1014587 ?auto_1014589 ) ) ( not ( = ?auto_1014587 ?auto_1014590 ) ) ( not ( = ?auto_1014587 ?auto_1014591 ) ) ( not ( = ?auto_1014587 ?auto_1014592 ) ) ( not ( = ?auto_1014587 ?auto_1014593 ) ) ( not ( = ?auto_1014587 ?auto_1014594 ) ) ( not ( = ?auto_1014587 ?auto_1014595 ) ) ( not ( = ?auto_1014586 ?auto_1014588 ) ) ( not ( = ?auto_1014586 ?auto_1014589 ) ) ( not ( = ?auto_1014586 ?auto_1014590 ) ) ( not ( = ?auto_1014586 ?auto_1014591 ) ) ( not ( = ?auto_1014586 ?auto_1014592 ) ) ( not ( = ?auto_1014586 ?auto_1014593 ) ) ( not ( = ?auto_1014586 ?auto_1014594 ) ) ( not ( = ?auto_1014586 ?auto_1014595 ) ) ( not ( = ?auto_1014588 ?auto_1014589 ) ) ( not ( = ?auto_1014588 ?auto_1014590 ) ) ( not ( = ?auto_1014588 ?auto_1014591 ) ) ( not ( = ?auto_1014588 ?auto_1014592 ) ) ( not ( = ?auto_1014588 ?auto_1014593 ) ) ( not ( = ?auto_1014588 ?auto_1014594 ) ) ( not ( = ?auto_1014588 ?auto_1014595 ) ) ( not ( = ?auto_1014589 ?auto_1014590 ) ) ( not ( = ?auto_1014589 ?auto_1014591 ) ) ( not ( = ?auto_1014589 ?auto_1014592 ) ) ( not ( = ?auto_1014589 ?auto_1014593 ) ) ( not ( = ?auto_1014589 ?auto_1014594 ) ) ( not ( = ?auto_1014589 ?auto_1014595 ) ) ( not ( = ?auto_1014590 ?auto_1014591 ) ) ( not ( = ?auto_1014590 ?auto_1014592 ) ) ( not ( = ?auto_1014590 ?auto_1014593 ) ) ( not ( = ?auto_1014590 ?auto_1014594 ) ) ( not ( = ?auto_1014590 ?auto_1014595 ) ) ( not ( = ?auto_1014591 ?auto_1014592 ) ) ( not ( = ?auto_1014591 ?auto_1014593 ) ) ( not ( = ?auto_1014591 ?auto_1014594 ) ) ( not ( = ?auto_1014591 ?auto_1014595 ) ) ( not ( = ?auto_1014592 ?auto_1014593 ) ) ( not ( = ?auto_1014592 ?auto_1014594 ) ) ( not ( = ?auto_1014592 ?auto_1014595 ) ) ( not ( = ?auto_1014593 ?auto_1014594 ) ) ( not ( = ?auto_1014593 ?auto_1014595 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1014594 ?auto_1014595 )
      ( MAKE-12CRATE-VERIFY ?auto_1014583 ?auto_1014584 ?auto_1014585 ?auto_1014587 ?auto_1014586 ?auto_1014588 ?auto_1014589 ?auto_1014590 ?auto_1014591 ?auto_1014592 ?auto_1014593 ?auto_1014594 ?auto_1014595 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1014708 - SURFACE
      ?auto_1014709 - SURFACE
      ?auto_1014710 - SURFACE
      ?auto_1014712 - SURFACE
      ?auto_1014711 - SURFACE
      ?auto_1014713 - SURFACE
      ?auto_1014714 - SURFACE
      ?auto_1014715 - SURFACE
      ?auto_1014716 - SURFACE
      ?auto_1014717 - SURFACE
      ?auto_1014718 - SURFACE
      ?auto_1014719 - SURFACE
      ?auto_1014720 - SURFACE
    )
    :vars
    (
      ?auto_1014723 - HOIST
      ?auto_1014722 - PLACE
      ?auto_1014721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1014723 ?auto_1014722 ) ( SURFACE-AT ?auto_1014719 ?auto_1014722 ) ( CLEAR ?auto_1014719 ) ( IS-CRATE ?auto_1014720 ) ( not ( = ?auto_1014719 ?auto_1014720 ) ) ( TRUCK-AT ?auto_1014721 ?auto_1014722 ) ( AVAILABLE ?auto_1014723 ) ( IN ?auto_1014720 ?auto_1014721 ) ( ON ?auto_1014719 ?auto_1014718 ) ( not ( = ?auto_1014718 ?auto_1014719 ) ) ( not ( = ?auto_1014718 ?auto_1014720 ) ) ( ON ?auto_1014709 ?auto_1014708 ) ( ON ?auto_1014710 ?auto_1014709 ) ( ON ?auto_1014712 ?auto_1014710 ) ( ON ?auto_1014711 ?auto_1014712 ) ( ON ?auto_1014713 ?auto_1014711 ) ( ON ?auto_1014714 ?auto_1014713 ) ( ON ?auto_1014715 ?auto_1014714 ) ( ON ?auto_1014716 ?auto_1014715 ) ( ON ?auto_1014717 ?auto_1014716 ) ( ON ?auto_1014718 ?auto_1014717 ) ( not ( = ?auto_1014708 ?auto_1014709 ) ) ( not ( = ?auto_1014708 ?auto_1014710 ) ) ( not ( = ?auto_1014708 ?auto_1014712 ) ) ( not ( = ?auto_1014708 ?auto_1014711 ) ) ( not ( = ?auto_1014708 ?auto_1014713 ) ) ( not ( = ?auto_1014708 ?auto_1014714 ) ) ( not ( = ?auto_1014708 ?auto_1014715 ) ) ( not ( = ?auto_1014708 ?auto_1014716 ) ) ( not ( = ?auto_1014708 ?auto_1014717 ) ) ( not ( = ?auto_1014708 ?auto_1014718 ) ) ( not ( = ?auto_1014708 ?auto_1014719 ) ) ( not ( = ?auto_1014708 ?auto_1014720 ) ) ( not ( = ?auto_1014709 ?auto_1014710 ) ) ( not ( = ?auto_1014709 ?auto_1014712 ) ) ( not ( = ?auto_1014709 ?auto_1014711 ) ) ( not ( = ?auto_1014709 ?auto_1014713 ) ) ( not ( = ?auto_1014709 ?auto_1014714 ) ) ( not ( = ?auto_1014709 ?auto_1014715 ) ) ( not ( = ?auto_1014709 ?auto_1014716 ) ) ( not ( = ?auto_1014709 ?auto_1014717 ) ) ( not ( = ?auto_1014709 ?auto_1014718 ) ) ( not ( = ?auto_1014709 ?auto_1014719 ) ) ( not ( = ?auto_1014709 ?auto_1014720 ) ) ( not ( = ?auto_1014710 ?auto_1014712 ) ) ( not ( = ?auto_1014710 ?auto_1014711 ) ) ( not ( = ?auto_1014710 ?auto_1014713 ) ) ( not ( = ?auto_1014710 ?auto_1014714 ) ) ( not ( = ?auto_1014710 ?auto_1014715 ) ) ( not ( = ?auto_1014710 ?auto_1014716 ) ) ( not ( = ?auto_1014710 ?auto_1014717 ) ) ( not ( = ?auto_1014710 ?auto_1014718 ) ) ( not ( = ?auto_1014710 ?auto_1014719 ) ) ( not ( = ?auto_1014710 ?auto_1014720 ) ) ( not ( = ?auto_1014712 ?auto_1014711 ) ) ( not ( = ?auto_1014712 ?auto_1014713 ) ) ( not ( = ?auto_1014712 ?auto_1014714 ) ) ( not ( = ?auto_1014712 ?auto_1014715 ) ) ( not ( = ?auto_1014712 ?auto_1014716 ) ) ( not ( = ?auto_1014712 ?auto_1014717 ) ) ( not ( = ?auto_1014712 ?auto_1014718 ) ) ( not ( = ?auto_1014712 ?auto_1014719 ) ) ( not ( = ?auto_1014712 ?auto_1014720 ) ) ( not ( = ?auto_1014711 ?auto_1014713 ) ) ( not ( = ?auto_1014711 ?auto_1014714 ) ) ( not ( = ?auto_1014711 ?auto_1014715 ) ) ( not ( = ?auto_1014711 ?auto_1014716 ) ) ( not ( = ?auto_1014711 ?auto_1014717 ) ) ( not ( = ?auto_1014711 ?auto_1014718 ) ) ( not ( = ?auto_1014711 ?auto_1014719 ) ) ( not ( = ?auto_1014711 ?auto_1014720 ) ) ( not ( = ?auto_1014713 ?auto_1014714 ) ) ( not ( = ?auto_1014713 ?auto_1014715 ) ) ( not ( = ?auto_1014713 ?auto_1014716 ) ) ( not ( = ?auto_1014713 ?auto_1014717 ) ) ( not ( = ?auto_1014713 ?auto_1014718 ) ) ( not ( = ?auto_1014713 ?auto_1014719 ) ) ( not ( = ?auto_1014713 ?auto_1014720 ) ) ( not ( = ?auto_1014714 ?auto_1014715 ) ) ( not ( = ?auto_1014714 ?auto_1014716 ) ) ( not ( = ?auto_1014714 ?auto_1014717 ) ) ( not ( = ?auto_1014714 ?auto_1014718 ) ) ( not ( = ?auto_1014714 ?auto_1014719 ) ) ( not ( = ?auto_1014714 ?auto_1014720 ) ) ( not ( = ?auto_1014715 ?auto_1014716 ) ) ( not ( = ?auto_1014715 ?auto_1014717 ) ) ( not ( = ?auto_1014715 ?auto_1014718 ) ) ( not ( = ?auto_1014715 ?auto_1014719 ) ) ( not ( = ?auto_1014715 ?auto_1014720 ) ) ( not ( = ?auto_1014716 ?auto_1014717 ) ) ( not ( = ?auto_1014716 ?auto_1014718 ) ) ( not ( = ?auto_1014716 ?auto_1014719 ) ) ( not ( = ?auto_1014716 ?auto_1014720 ) ) ( not ( = ?auto_1014717 ?auto_1014718 ) ) ( not ( = ?auto_1014717 ?auto_1014719 ) ) ( not ( = ?auto_1014717 ?auto_1014720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1014718 ?auto_1014719 ?auto_1014720 )
      ( MAKE-12CRATE-VERIFY ?auto_1014708 ?auto_1014709 ?auto_1014710 ?auto_1014712 ?auto_1014711 ?auto_1014713 ?auto_1014714 ?auto_1014715 ?auto_1014716 ?auto_1014717 ?auto_1014718 ?auto_1014719 ?auto_1014720 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1014846 - SURFACE
      ?auto_1014847 - SURFACE
      ?auto_1014848 - SURFACE
      ?auto_1014850 - SURFACE
      ?auto_1014849 - SURFACE
      ?auto_1014851 - SURFACE
      ?auto_1014852 - SURFACE
      ?auto_1014853 - SURFACE
      ?auto_1014854 - SURFACE
      ?auto_1014855 - SURFACE
      ?auto_1014856 - SURFACE
      ?auto_1014857 - SURFACE
      ?auto_1014858 - SURFACE
    )
    :vars
    (
      ?auto_1014859 - HOIST
      ?auto_1014860 - PLACE
      ?auto_1014862 - TRUCK
      ?auto_1014861 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1014859 ?auto_1014860 ) ( SURFACE-AT ?auto_1014857 ?auto_1014860 ) ( CLEAR ?auto_1014857 ) ( IS-CRATE ?auto_1014858 ) ( not ( = ?auto_1014857 ?auto_1014858 ) ) ( AVAILABLE ?auto_1014859 ) ( IN ?auto_1014858 ?auto_1014862 ) ( ON ?auto_1014857 ?auto_1014856 ) ( not ( = ?auto_1014856 ?auto_1014857 ) ) ( not ( = ?auto_1014856 ?auto_1014858 ) ) ( TRUCK-AT ?auto_1014862 ?auto_1014861 ) ( not ( = ?auto_1014861 ?auto_1014860 ) ) ( ON ?auto_1014847 ?auto_1014846 ) ( ON ?auto_1014848 ?auto_1014847 ) ( ON ?auto_1014850 ?auto_1014848 ) ( ON ?auto_1014849 ?auto_1014850 ) ( ON ?auto_1014851 ?auto_1014849 ) ( ON ?auto_1014852 ?auto_1014851 ) ( ON ?auto_1014853 ?auto_1014852 ) ( ON ?auto_1014854 ?auto_1014853 ) ( ON ?auto_1014855 ?auto_1014854 ) ( ON ?auto_1014856 ?auto_1014855 ) ( not ( = ?auto_1014846 ?auto_1014847 ) ) ( not ( = ?auto_1014846 ?auto_1014848 ) ) ( not ( = ?auto_1014846 ?auto_1014850 ) ) ( not ( = ?auto_1014846 ?auto_1014849 ) ) ( not ( = ?auto_1014846 ?auto_1014851 ) ) ( not ( = ?auto_1014846 ?auto_1014852 ) ) ( not ( = ?auto_1014846 ?auto_1014853 ) ) ( not ( = ?auto_1014846 ?auto_1014854 ) ) ( not ( = ?auto_1014846 ?auto_1014855 ) ) ( not ( = ?auto_1014846 ?auto_1014856 ) ) ( not ( = ?auto_1014846 ?auto_1014857 ) ) ( not ( = ?auto_1014846 ?auto_1014858 ) ) ( not ( = ?auto_1014847 ?auto_1014848 ) ) ( not ( = ?auto_1014847 ?auto_1014850 ) ) ( not ( = ?auto_1014847 ?auto_1014849 ) ) ( not ( = ?auto_1014847 ?auto_1014851 ) ) ( not ( = ?auto_1014847 ?auto_1014852 ) ) ( not ( = ?auto_1014847 ?auto_1014853 ) ) ( not ( = ?auto_1014847 ?auto_1014854 ) ) ( not ( = ?auto_1014847 ?auto_1014855 ) ) ( not ( = ?auto_1014847 ?auto_1014856 ) ) ( not ( = ?auto_1014847 ?auto_1014857 ) ) ( not ( = ?auto_1014847 ?auto_1014858 ) ) ( not ( = ?auto_1014848 ?auto_1014850 ) ) ( not ( = ?auto_1014848 ?auto_1014849 ) ) ( not ( = ?auto_1014848 ?auto_1014851 ) ) ( not ( = ?auto_1014848 ?auto_1014852 ) ) ( not ( = ?auto_1014848 ?auto_1014853 ) ) ( not ( = ?auto_1014848 ?auto_1014854 ) ) ( not ( = ?auto_1014848 ?auto_1014855 ) ) ( not ( = ?auto_1014848 ?auto_1014856 ) ) ( not ( = ?auto_1014848 ?auto_1014857 ) ) ( not ( = ?auto_1014848 ?auto_1014858 ) ) ( not ( = ?auto_1014850 ?auto_1014849 ) ) ( not ( = ?auto_1014850 ?auto_1014851 ) ) ( not ( = ?auto_1014850 ?auto_1014852 ) ) ( not ( = ?auto_1014850 ?auto_1014853 ) ) ( not ( = ?auto_1014850 ?auto_1014854 ) ) ( not ( = ?auto_1014850 ?auto_1014855 ) ) ( not ( = ?auto_1014850 ?auto_1014856 ) ) ( not ( = ?auto_1014850 ?auto_1014857 ) ) ( not ( = ?auto_1014850 ?auto_1014858 ) ) ( not ( = ?auto_1014849 ?auto_1014851 ) ) ( not ( = ?auto_1014849 ?auto_1014852 ) ) ( not ( = ?auto_1014849 ?auto_1014853 ) ) ( not ( = ?auto_1014849 ?auto_1014854 ) ) ( not ( = ?auto_1014849 ?auto_1014855 ) ) ( not ( = ?auto_1014849 ?auto_1014856 ) ) ( not ( = ?auto_1014849 ?auto_1014857 ) ) ( not ( = ?auto_1014849 ?auto_1014858 ) ) ( not ( = ?auto_1014851 ?auto_1014852 ) ) ( not ( = ?auto_1014851 ?auto_1014853 ) ) ( not ( = ?auto_1014851 ?auto_1014854 ) ) ( not ( = ?auto_1014851 ?auto_1014855 ) ) ( not ( = ?auto_1014851 ?auto_1014856 ) ) ( not ( = ?auto_1014851 ?auto_1014857 ) ) ( not ( = ?auto_1014851 ?auto_1014858 ) ) ( not ( = ?auto_1014852 ?auto_1014853 ) ) ( not ( = ?auto_1014852 ?auto_1014854 ) ) ( not ( = ?auto_1014852 ?auto_1014855 ) ) ( not ( = ?auto_1014852 ?auto_1014856 ) ) ( not ( = ?auto_1014852 ?auto_1014857 ) ) ( not ( = ?auto_1014852 ?auto_1014858 ) ) ( not ( = ?auto_1014853 ?auto_1014854 ) ) ( not ( = ?auto_1014853 ?auto_1014855 ) ) ( not ( = ?auto_1014853 ?auto_1014856 ) ) ( not ( = ?auto_1014853 ?auto_1014857 ) ) ( not ( = ?auto_1014853 ?auto_1014858 ) ) ( not ( = ?auto_1014854 ?auto_1014855 ) ) ( not ( = ?auto_1014854 ?auto_1014856 ) ) ( not ( = ?auto_1014854 ?auto_1014857 ) ) ( not ( = ?auto_1014854 ?auto_1014858 ) ) ( not ( = ?auto_1014855 ?auto_1014856 ) ) ( not ( = ?auto_1014855 ?auto_1014857 ) ) ( not ( = ?auto_1014855 ?auto_1014858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1014856 ?auto_1014857 ?auto_1014858 )
      ( MAKE-12CRATE-VERIFY ?auto_1014846 ?auto_1014847 ?auto_1014848 ?auto_1014850 ?auto_1014849 ?auto_1014851 ?auto_1014852 ?auto_1014853 ?auto_1014854 ?auto_1014855 ?auto_1014856 ?auto_1014857 ?auto_1014858 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1014996 - SURFACE
      ?auto_1014997 - SURFACE
      ?auto_1014998 - SURFACE
      ?auto_1015000 - SURFACE
      ?auto_1014999 - SURFACE
      ?auto_1015001 - SURFACE
      ?auto_1015002 - SURFACE
      ?auto_1015003 - SURFACE
      ?auto_1015004 - SURFACE
      ?auto_1015005 - SURFACE
      ?auto_1015006 - SURFACE
      ?auto_1015007 - SURFACE
      ?auto_1015008 - SURFACE
    )
    :vars
    (
      ?auto_1015010 - HOIST
      ?auto_1015009 - PLACE
      ?auto_1015012 - TRUCK
      ?auto_1015011 - PLACE
      ?auto_1015013 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015010 ?auto_1015009 ) ( SURFACE-AT ?auto_1015007 ?auto_1015009 ) ( CLEAR ?auto_1015007 ) ( IS-CRATE ?auto_1015008 ) ( not ( = ?auto_1015007 ?auto_1015008 ) ) ( AVAILABLE ?auto_1015010 ) ( ON ?auto_1015007 ?auto_1015006 ) ( not ( = ?auto_1015006 ?auto_1015007 ) ) ( not ( = ?auto_1015006 ?auto_1015008 ) ) ( TRUCK-AT ?auto_1015012 ?auto_1015011 ) ( not ( = ?auto_1015011 ?auto_1015009 ) ) ( HOIST-AT ?auto_1015013 ?auto_1015011 ) ( LIFTING ?auto_1015013 ?auto_1015008 ) ( not ( = ?auto_1015010 ?auto_1015013 ) ) ( ON ?auto_1014997 ?auto_1014996 ) ( ON ?auto_1014998 ?auto_1014997 ) ( ON ?auto_1015000 ?auto_1014998 ) ( ON ?auto_1014999 ?auto_1015000 ) ( ON ?auto_1015001 ?auto_1014999 ) ( ON ?auto_1015002 ?auto_1015001 ) ( ON ?auto_1015003 ?auto_1015002 ) ( ON ?auto_1015004 ?auto_1015003 ) ( ON ?auto_1015005 ?auto_1015004 ) ( ON ?auto_1015006 ?auto_1015005 ) ( not ( = ?auto_1014996 ?auto_1014997 ) ) ( not ( = ?auto_1014996 ?auto_1014998 ) ) ( not ( = ?auto_1014996 ?auto_1015000 ) ) ( not ( = ?auto_1014996 ?auto_1014999 ) ) ( not ( = ?auto_1014996 ?auto_1015001 ) ) ( not ( = ?auto_1014996 ?auto_1015002 ) ) ( not ( = ?auto_1014996 ?auto_1015003 ) ) ( not ( = ?auto_1014996 ?auto_1015004 ) ) ( not ( = ?auto_1014996 ?auto_1015005 ) ) ( not ( = ?auto_1014996 ?auto_1015006 ) ) ( not ( = ?auto_1014996 ?auto_1015007 ) ) ( not ( = ?auto_1014996 ?auto_1015008 ) ) ( not ( = ?auto_1014997 ?auto_1014998 ) ) ( not ( = ?auto_1014997 ?auto_1015000 ) ) ( not ( = ?auto_1014997 ?auto_1014999 ) ) ( not ( = ?auto_1014997 ?auto_1015001 ) ) ( not ( = ?auto_1014997 ?auto_1015002 ) ) ( not ( = ?auto_1014997 ?auto_1015003 ) ) ( not ( = ?auto_1014997 ?auto_1015004 ) ) ( not ( = ?auto_1014997 ?auto_1015005 ) ) ( not ( = ?auto_1014997 ?auto_1015006 ) ) ( not ( = ?auto_1014997 ?auto_1015007 ) ) ( not ( = ?auto_1014997 ?auto_1015008 ) ) ( not ( = ?auto_1014998 ?auto_1015000 ) ) ( not ( = ?auto_1014998 ?auto_1014999 ) ) ( not ( = ?auto_1014998 ?auto_1015001 ) ) ( not ( = ?auto_1014998 ?auto_1015002 ) ) ( not ( = ?auto_1014998 ?auto_1015003 ) ) ( not ( = ?auto_1014998 ?auto_1015004 ) ) ( not ( = ?auto_1014998 ?auto_1015005 ) ) ( not ( = ?auto_1014998 ?auto_1015006 ) ) ( not ( = ?auto_1014998 ?auto_1015007 ) ) ( not ( = ?auto_1014998 ?auto_1015008 ) ) ( not ( = ?auto_1015000 ?auto_1014999 ) ) ( not ( = ?auto_1015000 ?auto_1015001 ) ) ( not ( = ?auto_1015000 ?auto_1015002 ) ) ( not ( = ?auto_1015000 ?auto_1015003 ) ) ( not ( = ?auto_1015000 ?auto_1015004 ) ) ( not ( = ?auto_1015000 ?auto_1015005 ) ) ( not ( = ?auto_1015000 ?auto_1015006 ) ) ( not ( = ?auto_1015000 ?auto_1015007 ) ) ( not ( = ?auto_1015000 ?auto_1015008 ) ) ( not ( = ?auto_1014999 ?auto_1015001 ) ) ( not ( = ?auto_1014999 ?auto_1015002 ) ) ( not ( = ?auto_1014999 ?auto_1015003 ) ) ( not ( = ?auto_1014999 ?auto_1015004 ) ) ( not ( = ?auto_1014999 ?auto_1015005 ) ) ( not ( = ?auto_1014999 ?auto_1015006 ) ) ( not ( = ?auto_1014999 ?auto_1015007 ) ) ( not ( = ?auto_1014999 ?auto_1015008 ) ) ( not ( = ?auto_1015001 ?auto_1015002 ) ) ( not ( = ?auto_1015001 ?auto_1015003 ) ) ( not ( = ?auto_1015001 ?auto_1015004 ) ) ( not ( = ?auto_1015001 ?auto_1015005 ) ) ( not ( = ?auto_1015001 ?auto_1015006 ) ) ( not ( = ?auto_1015001 ?auto_1015007 ) ) ( not ( = ?auto_1015001 ?auto_1015008 ) ) ( not ( = ?auto_1015002 ?auto_1015003 ) ) ( not ( = ?auto_1015002 ?auto_1015004 ) ) ( not ( = ?auto_1015002 ?auto_1015005 ) ) ( not ( = ?auto_1015002 ?auto_1015006 ) ) ( not ( = ?auto_1015002 ?auto_1015007 ) ) ( not ( = ?auto_1015002 ?auto_1015008 ) ) ( not ( = ?auto_1015003 ?auto_1015004 ) ) ( not ( = ?auto_1015003 ?auto_1015005 ) ) ( not ( = ?auto_1015003 ?auto_1015006 ) ) ( not ( = ?auto_1015003 ?auto_1015007 ) ) ( not ( = ?auto_1015003 ?auto_1015008 ) ) ( not ( = ?auto_1015004 ?auto_1015005 ) ) ( not ( = ?auto_1015004 ?auto_1015006 ) ) ( not ( = ?auto_1015004 ?auto_1015007 ) ) ( not ( = ?auto_1015004 ?auto_1015008 ) ) ( not ( = ?auto_1015005 ?auto_1015006 ) ) ( not ( = ?auto_1015005 ?auto_1015007 ) ) ( not ( = ?auto_1015005 ?auto_1015008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015006 ?auto_1015007 ?auto_1015008 )
      ( MAKE-12CRATE-VERIFY ?auto_1014996 ?auto_1014997 ?auto_1014998 ?auto_1015000 ?auto_1014999 ?auto_1015001 ?auto_1015002 ?auto_1015003 ?auto_1015004 ?auto_1015005 ?auto_1015006 ?auto_1015007 ?auto_1015008 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015158 - SURFACE
      ?auto_1015159 - SURFACE
      ?auto_1015160 - SURFACE
      ?auto_1015162 - SURFACE
      ?auto_1015161 - SURFACE
      ?auto_1015163 - SURFACE
      ?auto_1015164 - SURFACE
      ?auto_1015165 - SURFACE
      ?auto_1015166 - SURFACE
      ?auto_1015167 - SURFACE
      ?auto_1015168 - SURFACE
      ?auto_1015169 - SURFACE
      ?auto_1015170 - SURFACE
    )
    :vars
    (
      ?auto_1015172 - HOIST
      ?auto_1015171 - PLACE
      ?auto_1015174 - TRUCK
      ?auto_1015175 - PLACE
      ?auto_1015176 - HOIST
      ?auto_1015173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015172 ?auto_1015171 ) ( SURFACE-AT ?auto_1015169 ?auto_1015171 ) ( CLEAR ?auto_1015169 ) ( IS-CRATE ?auto_1015170 ) ( not ( = ?auto_1015169 ?auto_1015170 ) ) ( AVAILABLE ?auto_1015172 ) ( ON ?auto_1015169 ?auto_1015168 ) ( not ( = ?auto_1015168 ?auto_1015169 ) ) ( not ( = ?auto_1015168 ?auto_1015170 ) ) ( TRUCK-AT ?auto_1015174 ?auto_1015175 ) ( not ( = ?auto_1015175 ?auto_1015171 ) ) ( HOIST-AT ?auto_1015176 ?auto_1015175 ) ( not ( = ?auto_1015172 ?auto_1015176 ) ) ( AVAILABLE ?auto_1015176 ) ( SURFACE-AT ?auto_1015170 ?auto_1015175 ) ( ON ?auto_1015170 ?auto_1015173 ) ( CLEAR ?auto_1015170 ) ( not ( = ?auto_1015169 ?auto_1015173 ) ) ( not ( = ?auto_1015170 ?auto_1015173 ) ) ( not ( = ?auto_1015168 ?auto_1015173 ) ) ( ON ?auto_1015159 ?auto_1015158 ) ( ON ?auto_1015160 ?auto_1015159 ) ( ON ?auto_1015162 ?auto_1015160 ) ( ON ?auto_1015161 ?auto_1015162 ) ( ON ?auto_1015163 ?auto_1015161 ) ( ON ?auto_1015164 ?auto_1015163 ) ( ON ?auto_1015165 ?auto_1015164 ) ( ON ?auto_1015166 ?auto_1015165 ) ( ON ?auto_1015167 ?auto_1015166 ) ( ON ?auto_1015168 ?auto_1015167 ) ( not ( = ?auto_1015158 ?auto_1015159 ) ) ( not ( = ?auto_1015158 ?auto_1015160 ) ) ( not ( = ?auto_1015158 ?auto_1015162 ) ) ( not ( = ?auto_1015158 ?auto_1015161 ) ) ( not ( = ?auto_1015158 ?auto_1015163 ) ) ( not ( = ?auto_1015158 ?auto_1015164 ) ) ( not ( = ?auto_1015158 ?auto_1015165 ) ) ( not ( = ?auto_1015158 ?auto_1015166 ) ) ( not ( = ?auto_1015158 ?auto_1015167 ) ) ( not ( = ?auto_1015158 ?auto_1015168 ) ) ( not ( = ?auto_1015158 ?auto_1015169 ) ) ( not ( = ?auto_1015158 ?auto_1015170 ) ) ( not ( = ?auto_1015158 ?auto_1015173 ) ) ( not ( = ?auto_1015159 ?auto_1015160 ) ) ( not ( = ?auto_1015159 ?auto_1015162 ) ) ( not ( = ?auto_1015159 ?auto_1015161 ) ) ( not ( = ?auto_1015159 ?auto_1015163 ) ) ( not ( = ?auto_1015159 ?auto_1015164 ) ) ( not ( = ?auto_1015159 ?auto_1015165 ) ) ( not ( = ?auto_1015159 ?auto_1015166 ) ) ( not ( = ?auto_1015159 ?auto_1015167 ) ) ( not ( = ?auto_1015159 ?auto_1015168 ) ) ( not ( = ?auto_1015159 ?auto_1015169 ) ) ( not ( = ?auto_1015159 ?auto_1015170 ) ) ( not ( = ?auto_1015159 ?auto_1015173 ) ) ( not ( = ?auto_1015160 ?auto_1015162 ) ) ( not ( = ?auto_1015160 ?auto_1015161 ) ) ( not ( = ?auto_1015160 ?auto_1015163 ) ) ( not ( = ?auto_1015160 ?auto_1015164 ) ) ( not ( = ?auto_1015160 ?auto_1015165 ) ) ( not ( = ?auto_1015160 ?auto_1015166 ) ) ( not ( = ?auto_1015160 ?auto_1015167 ) ) ( not ( = ?auto_1015160 ?auto_1015168 ) ) ( not ( = ?auto_1015160 ?auto_1015169 ) ) ( not ( = ?auto_1015160 ?auto_1015170 ) ) ( not ( = ?auto_1015160 ?auto_1015173 ) ) ( not ( = ?auto_1015162 ?auto_1015161 ) ) ( not ( = ?auto_1015162 ?auto_1015163 ) ) ( not ( = ?auto_1015162 ?auto_1015164 ) ) ( not ( = ?auto_1015162 ?auto_1015165 ) ) ( not ( = ?auto_1015162 ?auto_1015166 ) ) ( not ( = ?auto_1015162 ?auto_1015167 ) ) ( not ( = ?auto_1015162 ?auto_1015168 ) ) ( not ( = ?auto_1015162 ?auto_1015169 ) ) ( not ( = ?auto_1015162 ?auto_1015170 ) ) ( not ( = ?auto_1015162 ?auto_1015173 ) ) ( not ( = ?auto_1015161 ?auto_1015163 ) ) ( not ( = ?auto_1015161 ?auto_1015164 ) ) ( not ( = ?auto_1015161 ?auto_1015165 ) ) ( not ( = ?auto_1015161 ?auto_1015166 ) ) ( not ( = ?auto_1015161 ?auto_1015167 ) ) ( not ( = ?auto_1015161 ?auto_1015168 ) ) ( not ( = ?auto_1015161 ?auto_1015169 ) ) ( not ( = ?auto_1015161 ?auto_1015170 ) ) ( not ( = ?auto_1015161 ?auto_1015173 ) ) ( not ( = ?auto_1015163 ?auto_1015164 ) ) ( not ( = ?auto_1015163 ?auto_1015165 ) ) ( not ( = ?auto_1015163 ?auto_1015166 ) ) ( not ( = ?auto_1015163 ?auto_1015167 ) ) ( not ( = ?auto_1015163 ?auto_1015168 ) ) ( not ( = ?auto_1015163 ?auto_1015169 ) ) ( not ( = ?auto_1015163 ?auto_1015170 ) ) ( not ( = ?auto_1015163 ?auto_1015173 ) ) ( not ( = ?auto_1015164 ?auto_1015165 ) ) ( not ( = ?auto_1015164 ?auto_1015166 ) ) ( not ( = ?auto_1015164 ?auto_1015167 ) ) ( not ( = ?auto_1015164 ?auto_1015168 ) ) ( not ( = ?auto_1015164 ?auto_1015169 ) ) ( not ( = ?auto_1015164 ?auto_1015170 ) ) ( not ( = ?auto_1015164 ?auto_1015173 ) ) ( not ( = ?auto_1015165 ?auto_1015166 ) ) ( not ( = ?auto_1015165 ?auto_1015167 ) ) ( not ( = ?auto_1015165 ?auto_1015168 ) ) ( not ( = ?auto_1015165 ?auto_1015169 ) ) ( not ( = ?auto_1015165 ?auto_1015170 ) ) ( not ( = ?auto_1015165 ?auto_1015173 ) ) ( not ( = ?auto_1015166 ?auto_1015167 ) ) ( not ( = ?auto_1015166 ?auto_1015168 ) ) ( not ( = ?auto_1015166 ?auto_1015169 ) ) ( not ( = ?auto_1015166 ?auto_1015170 ) ) ( not ( = ?auto_1015166 ?auto_1015173 ) ) ( not ( = ?auto_1015167 ?auto_1015168 ) ) ( not ( = ?auto_1015167 ?auto_1015169 ) ) ( not ( = ?auto_1015167 ?auto_1015170 ) ) ( not ( = ?auto_1015167 ?auto_1015173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015168 ?auto_1015169 ?auto_1015170 )
      ( MAKE-12CRATE-VERIFY ?auto_1015158 ?auto_1015159 ?auto_1015160 ?auto_1015162 ?auto_1015161 ?auto_1015163 ?auto_1015164 ?auto_1015165 ?auto_1015166 ?auto_1015167 ?auto_1015168 ?auto_1015169 ?auto_1015170 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015321 - SURFACE
      ?auto_1015322 - SURFACE
      ?auto_1015323 - SURFACE
      ?auto_1015325 - SURFACE
      ?auto_1015324 - SURFACE
      ?auto_1015326 - SURFACE
      ?auto_1015327 - SURFACE
      ?auto_1015328 - SURFACE
      ?auto_1015329 - SURFACE
      ?auto_1015330 - SURFACE
      ?auto_1015331 - SURFACE
      ?auto_1015332 - SURFACE
      ?auto_1015333 - SURFACE
    )
    :vars
    (
      ?auto_1015336 - HOIST
      ?auto_1015334 - PLACE
      ?auto_1015338 - PLACE
      ?auto_1015335 - HOIST
      ?auto_1015337 - SURFACE
      ?auto_1015339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015336 ?auto_1015334 ) ( SURFACE-AT ?auto_1015332 ?auto_1015334 ) ( CLEAR ?auto_1015332 ) ( IS-CRATE ?auto_1015333 ) ( not ( = ?auto_1015332 ?auto_1015333 ) ) ( AVAILABLE ?auto_1015336 ) ( ON ?auto_1015332 ?auto_1015331 ) ( not ( = ?auto_1015331 ?auto_1015332 ) ) ( not ( = ?auto_1015331 ?auto_1015333 ) ) ( not ( = ?auto_1015338 ?auto_1015334 ) ) ( HOIST-AT ?auto_1015335 ?auto_1015338 ) ( not ( = ?auto_1015336 ?auto_1015335 ) ) ( AVAILABLE ?auto_1015335 ) ( SURFACE-AT ?auto_1015333 ?auto_1015338 ) ( ON ?auto_1015333 ?auto_1015337 ) ( CLEAR ?auto_1015333 ) ( not ( = ?auto_1015332 ?auto_1015337 ) ) ( not ( = ?auto_1015333 ?auto_1015337 ) ) ( not ( = ?auto_1015331 ?auto_1015337 ) ) ( TRUCK-AT ?auto_1015339 ?auto_1015334 ) ( ON ?auto_1015322 ?auto_1015321 ) ( ON ?auto_1015323 ?auto_1015322 ) ( ON ?auto_1015325 ?auto_1015323 ) ( ON ?auto_1015324 ?auto_1015325 ) ( ON ?auto_1015326 ?auto_1015324 ) ( ON ?auto_1015327 ?auto_1015326 ) ( ON ?auto_1015328 ?auto_1015327 ) ( ON ?auto_1015329 ?auto_1015328 ) ( ON ?auto_1015330 ?auto_1015329 ) ( ON ?auto_1015331 ?auto_1015330 ) ( not ( = ?auto_1015321 ?auto_1015322 ) ) ( not ( = ?auto_1015321 ?auto_1015323 ) ) ( not ( = ?auto_1015321 ?auto_1015325 ) ) ( not ( = ?auto_1015321 ?auto_1015324 ) ) ( not ( = ?auto_1015321 ?auto_1015326 ) ) ( not ( = ?auto_1015321 ?auto_1015327 ) ) ( not ( = ?auto_1015321 ?auto_1015328 ) ) ( not ( = ?auto_1015321 ?auto_1015329 ) ) ( not ( = ?auto_1015321 ?auto_1015330 ) ) ( not ( = ?auto_1015321 ?auto_1015331 ) ) ( not ( = ?auto_1015321 ?auto_1015332 ) ) ( not ( = ?auto_1015321 ?auto_1015333 ) ) ( not ( = ?auto_1015321 ?auto_1015337 ) ) ( not ( = ?auto_1015322 ?auto_1015323 ) ) ( not ( = ?auto_1015322 ?auto_1015325 ) ) ( not ( = ?auto_1015322 ?auto_1015324 ) ) ( not ( = ?auto_1015322 ?auto_1015326 ) ) ( not ( = ?auto_1015322 ?auto_1015327 ) ) ( not ( = ?auto_1015322 ?auto_1015328 ) ) ( not ( = ?auto_1015322 ?auto_1015329 ) ) ( not ( = ?auto_1015322 ?auto_1015330 ) ) ( not ( = ?auto_1015322 ?auto_1015331 ) ) ( not ( = ?auto_1015322 ?auto_1015332 ) ) ( not ( = ?auto_1015322 ?auto_1015333 ) ) ( not ( = ?auto_1015322 ?auto_1015337 ) ) ( not ( = ?auto_1015323 ?auto_1015325 ) ) ( not ( = ?auto_1015323 ?auto_1015324 ) ) ( not ( = ?auto_1015323 ?auto_1015326 ) ) ( not ( = ?auto_1015323 ?auto_1015327 ) ) ( not ( = ?auto_1015323 ?auto_1015328 ) ) ( not ( = ?auto_1015323 ?auto_1015329 ) ) ( not ( = ?auto_1015323 ?auto_1015330 ) ) ( not ( = ?auto_1015323 ?auto_1015331 ) ) ( not ( = ?auto_1015323 ?auto_1015332 ) ) ( not ( = ?auto_1015323 ?auto_1015333 ) ) ( not ( = ?auto_1015323 ?auto_1015337 ) ) ( not ( = ?auto_1015325 ?auto_1015324 ) ) ( not ( = ?auto_1015325 ?auto_1015326 ) ) ( not ( = ?auto_1015325 ?auto_1015327 ) ) ( not ( = ?auto_1015325 ?auto_1015328 ) ) ( not ( = ?auto_1015325 ?auto_1015329 ) ) ( not ( = ?auto_1015325 ?auto_1015330 ) ) ( not ( = ?auto_1015325 ?auto_1015331 ) ) ( not ( = ?auto_1015325 ?auto_1015332 ) ) ( not ( = ?auto_1015325 ?auto_1015333 ) ) ( not ( = ?auto_1015325 ?auto_1015337 ) ) ( not ( = ?auto_1015324 ?auto_1015326 ) ) ( not ( = ?auto_1015324 ?auto_1015327 ) ) ( not ( = ?auto_1015324 ?auto_1015328 ) ) ( not ( = ?auto_1015324 ?auto_1015329 ) ) ( not ( = ?auto_1015324 ?auto_1015330 ) ) ( not ( = ?auto_1015324 ?auto_1015331 ) ) ( not ( = ?auto_1015324 ?auto_1015332 ) ) ( not ( = ?auto_1015324 ?auto_1015333 ) ) ( not ( = ?auto_1015324 ?auto_1015337 ) ) ( not ( = ?auto_1015326 ?auto_1015327 ) ) ( not ( = ?auto_1015326 ?auto_1015328 ) ) ( not ( = ?auto_1015326 ?auto_1015329 ) ) ( not ( = ?auto_1015326 ?auto_1015330 ) ) ( not ( = ?auto_1015326 ?auto_1015331 ) ) ( not ( = ?auto_1015326 ?auto_1015332 ) ) ( not ( = ?auto_1015326 ?auto_1015333 ) ) ( not ( = ?auto_1015326 ?auto_1015337 ) ) ( not ( = ?auto_1015327 ?auto_1015328 ) ) ( not ( = ?auto_1015327 ?auto_1015329 ) ) ( not ( = ?auto_1015327 ?auto_1015330 ) ) ( not ( = ?auto_1015327 ?auto_1015331 ) ) ( not ( = ?auto_1015327 ?auto_1015332 ) ) ( not ( = ?auto_1015327 ?auto_1015333 ) ) ( not ( = ?auto_1015327 ?auto_1015337 ) ) ( not ( = ?auto_1015328 ?auto_1015329 ) ) ( not ( = ?auto_1015328 ?auto_1015330 ) ) ( not ( = ?auto_1015328 ?auto_1015331 ) ) ( not ( = ?auto_1015328 ?auto_1015332 ) ) ( not ( = ?auto_1015328 ?auto_1015333 ) ) ( not ( = ?auto_1015328 ?auto_1015337 ) ) ( not ( = ?auto_1015329 ?auto_1015330 ) ) ( not ( = ?auto_1015329 ?auto_1015331 ) ) ( not ( = ?auto_1015329 ?auto_1015332 ) ) ( not ( = ?auto_1015329 ?auto_1015333 ) ) ( not ( = ?auto_1015329 ?auto_1015337 ) ) ( not ( = ?auto_1015330 ?auto_1015331 ) ) ( not ( = ?auto_1015330 ?auto_1015332 ) ) ( not ( = ?auto_1015330 ?auto_1015333 ) ) ( not ( = ?auto_1015330 ?auto_1015337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015331 ?auto_1015332 ?auto_1015333 )
      ( MAKE-12CRATE-VERIFY ?auto_1015321 ?auto_1015322 ?auto_1015323 ?auto_1015325 ?auto_1015324 ?auto_1015326 ?auto_1015327 ?auto_1015328 ?auto_1015329 ?auto_1015330 ?auto_1015331 ?auto_1015332 ?auto_1015333 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015484 - SURFACE
      ?auto_1015485 - SURFACE
      ?auto_1015486 - SURFACE
      ?auto_1015488 - SURFACE
      ?auto_1015487 - SURFACE
      ?auto_1015489 - SURFACE
      ?auto_1015490 - SURFACE
      ?auto_1015491 - SURFACE
      ?auto_1015492 - SURFACE
      ?auto_1015493 - SURFACE
      ?auto_1015494 - SURFACE
      ?auto_1015495 - SURFACE
      ?auto_1015496 - SURFACE
    )
    :vars
    (
      ?auto_1015499 - HOIST
      ?auto_1015497 - PLACE
      ?auto_1015502 - PLACE
      ?auto_1015501 - HOIST
      ?auto_1015498 - SURFACE
      ?auto_1015500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015499 ?auto_1015497 ) ( IS-CRATE ?auto_1015496 ) ( not ( = ?auto_1015495 ?auto_1015496 ) ) ( not ( = ?auto_1015494 ?auto_1015495 ) ) ( not ( = ?auto_1015494 ?auto_1015496 ) ) ( not ( = ?auto_1015502 ?auto_1015497 ) ) ( HOIST-AT ?auto_1015501 ?auto_1015502 ) ( not ( = ?auto_1015499 ?auto_1015501 ) ) ( AVAILABLE ?auto_1015501 ) ( SURFACE-AT ?auto_1015496 ?auto_1015502 ) ( ON ?auto_1015496 ?auto_1015498 ) ( CLEAR ?auto_1015496 ) ( not ( = ?auto_1015495 ?auto_1015498 ) ) ( not ( = ?auto_1015496 ?auto_1015498 ) ) ( not ( = ?auto_1015494 ?auto_1015498 ) ) ( TRUCK-AT ?auto_1015500 ?auto_1015497 ) ( SURFACE-AT ?auto_1015494 ?auto_1015497 ) ( CLEAR ?auto_1015494 ) ( LIFTING ?auto_1015499 ?auto_1015495 ) ( IS-CRATE ?auto_1015495 ) ( ON ?auto_1015485 ?auto_1015484 ) ( ON ?auto_1015486 ?auto_1015485 ) ( ON ?auto_1015488 ?auto_1015486 ) ( ON ?auto_1015487 ?auto_1015488 ) ( ON ?auto_1015489 ?auto_1015487 ) ( ON ?auto_1015490 ?auto_1015489 ) ( ON ?auto_1015491 ?auto_1015490 ) ( ON ?auto_1015492 ?auto_1015491 ) ( ON ?auto_1015493 ?auto_1015492 ) ( ON ?auto_1015494 ?auto_1015493 ) ( not ( = ?auto_1015484 ?auto_1015485 ) ) ( not ( = ?auto_1015484 ?auto_1015486 ) ) ( not ( = ?auto_1015484 ?auto_1015488 ) ) ( not ( = ?auto_1015484 ?auto_1015487 ) ) ( not ( = ?auto_1015484 ?auto_1015489 ) ) ( not ( = ?auto_1015484 ?auto_1015490 ) ) ( not ( = ?auto_1015484 ?auto_1015491 ) ) ( not ( = ?auto_1015484 ?auto_1015492 ) ) ( not ( = ?auto_1015484 ?auto_1015493 ) ) ( not ( = ?auto_1015484 ?auto_1015494 ) ) ( not ( = ?auto_1015484 ?auto_1015495 ) ) ( not ( = ?auto_1015484 ?auto_1015496 ) ) ( not ( = ?auto_1015484 ?auto_1015498 ) ) ( not ( = ?auto_1015485 ?auto_1015486 ) ) ( not ( = ?auto_1015485 ?auto_1015488 ) ) ( not ( = ?auto_1015485 ?auto_1015487 ) ) ( not ( = ?auto_1015485 ?auto_1015489 ) ) ( not ( = ?auto_1015485 ?auto_1015490 ) ) ( not ( = ?auto_1015485 ?auto_1015491 ) ) ( not ( = ?auto_1015485 ?auto_1015492 ) ) ( not ( = ?auto_1015485 ?auto_1015493 ) ) ( not ( = ?auto_1015485 ?auto_1015494 ) ) ( not ( = ?auto_1015485 ?auto_1015495 ) ) ( not ( = ?auto_1015485 ?auto_1015496 ) ) ( not ( = ?auto_1015485 ?auto_1015498 ) ) ( not ( = ?auto_1015486 ?auto_1015488 ) ) ( not ( = ?auto_1015486 ?auto_1015487 ) ) ( not ( = ?auto_1015486 ?auto_1015489 ) ) ( not ( = ?auto_1015486 ?auto_1015490 ) ) ( not ( = ?auto_1015486 ?auto_1015491 ) ) ( not ( = ?auto_1015486 ?auto_1015492 ) ) ( not ( = ?auto_1015486 ?auto_1015493 ) ) ( not ( = ?auto_1015486 ?auto_1015494 ) ) ( not ( = ?auto_1015486 ?auto_1015495 ) ) ( not ( = ?auto_1015486 ?auto_1015496 ) ) ( not ( = ?auto_1015486 ?auto_1015498 ) ) ( not ( = ?auto_1015488 ?auto_1015487 ) ) ( not ( = ?auto_1015488 ?auto_1015489 ) ) ( not ( = ?auto_1015488 ?auto_1015490 ) ) ( not ( = ?auto_1015488 ?auto_1015491 ) ) ( not ( = ?auto_1015488 ?auto_1015492 ) ) ( not ( = ?auto_1015488 ?auto_1015493 ) ) ( not ( = ?auto_1015488 ?auto_1015494 ) ) ( not ( = ?auto_1015488 ?auto_1015495 ) ) ( not ( = ?auto_1015488 ?auto_1015496 ) ) ( not ( = ?auto_1015488 ?auto_1015498 ) ) ( not ( = ?auto_1015487 ?auto_1015489 ) ) ( not ( = ?auto_1015487 ?auto_1015490 ) ) ( not ( = ?auto_1015487 ?auto_1015491 ) ) ( not ( = ?auto_1015487 ?auto_1015492 ) ) ( not ( = ?auto_1015487 ?auto_1015493 ) ) ( not ( = ?auto_1015487 ?auto_1015494 ) ) ( not ( = ?auto_1015487 ?auto_1015495 ) ) ( not ( = ?auto_1015487 ?auto_1015496 ) ) ( not ( = ?auto_1015487 ?auto_1015498 ) ) ( not ( = ?auto_1015489 ?auto_1015490 ) ) ( not ( = ?auto_1015489 ?auto_1015491 ) ) ( not ( = ?auto_1015489 ?auto_1015492 ) ) ( not ( = ?auto_1015489 ?auto_1015493 ) ) ( not ( = ?auto_1015489 ?auto_1015494 ) ) ( not ( = ?auto_1015489 ?auto_1015495 ) ) ( not ( = ?auto_1015489 ?auto_1015496 ) ) ( not ( = ?auto_1015489 ?auto_1015498 ) ) ( not ( = ?auto_1015490 ?auto_1015491 ) ) ( not ( = ?auto_1015490 ?auto_1015492 ) ) ( not ( = ?auto_1015490 ?auto_1015493 ) ) ( not ( = ?auto_1015490 ?auto_1015494 ) ) ( not ( = ?auto_1015490 ?auto_1015495 ) ) ( not ( = ?auto_1015490 ?auto_1015496 ) ) ( not ( = ?auto_1015490 ?auto_1015498 ) ) ( not ( = ?auto_1015491 ?auto_1015492 ) ) ( not ( = ?auto_1015491 ?auto_1015493 ) ) ( not ( = ?auto_1015491 ?auto_1015494 ) ) ( not ( = ?auto_1015491 ?auto_1015495 ) ) ( not ( = ?auto_1015491 ?auto_1015496 ) ) ( not ( = ?auto_1015491 ?auto_1015498 ) ) ( not ( = ?auto_1015492 ?auto_1015493 ) ) ( not ( = ?auto_1015492 ?auto_1015494 ) ) ( not ( = ?auto_1015492 ?auto_1015495 ) ) ( not ( = ?auto_1015492 ?auto_1015496 ) ) ( not ( = ?auto_1015492 ?auto_1015498 ) ) ( not ( = ?auto_1015493 ?auto_1015494 ) ) ( not ( = ?auto_1015493 ?auto_1015495 ) ) ( not ( = ?auto_1015493 ?auto_1015496 ) ) ( not ( = ?auto_1015493 ?auto_1015498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015494 ?auto_1015495 ?auto_1015496 )
      ( MAKE-12CRATE-VERIFY ?auto_1015484 ?auto_1015485 ?auto_1015486 ?auto_1015488 ?auto_1015487 ?auto_1015489 ?auto_1015490 ?auto_1015491 ?auto_1015492 ?auto_1015493 ?auto_1015494 ?auto_1015495 ?auto_1015496 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1015647 - SURFACE
      ?auto_1015648 - SURFACE
      ?auto_1015649 - SURFACE
      ?auto_1015651 - SURFACE
      ?auto_1015650 - SURFACE
      ?auto_1015652 - SURFACE
      ?auto_1015653 - SURFACE
      ?auto_1015654 - SURFACE
      ?auto_1015655 - SURFACE
      ?auto_1015656 - SURFACE
      ?auto_1015657 - SURFACE
      ?auto_1015658 - SURFACE
      ?auto_1015659 - SURFACE
    )
    :vars
    (
      ?auto_1015665 - HOIST
      ?auto_1015661 - PLACE
      ?auto_1015664 - PLACE
      ?auto_1015660 - HOIST
      ?auto_1015662 - SURFACE
      ?auto_1015663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015665 ?auto_1015661 ) ( IS-CRATE ?auto_1015659 ) ( not ( = ?auto_1015658 ?auto_1015659 ) ) ( not ( = ?auto_1015657 ?auto_1015658 ) ) ( not ( = ?auto_1015657 ?auto_1015659 ) ) ( not ( = ?auto_1015664 ?auto_1015661 ) ) ( HOIST-AT ?auto_1015660 ?auto_1015664 ) ( not ( = ?auto_1015665 ?auto_1015660 ) ) ( AVAILABLE ?auto_1015660 ) ( SURFACE-AT ?auto_1015659 ?auto_1015664 ) ( ON ?auto_1015659 ?auto_1015662 ) ( CLEAR ?auto_1015659 ) ( not ( = ?auto_1015658 ?auto_1015662 ) ) ( not ( = ?auto_1015659 ?auto_1015662 ) ) ( not ( = ?auto_1015657 ?auto_1015662 ) ) ( TRUCK-AT ?auto_1015663 ?auto_1015661 ) ( SURFACE-AT ?auto_1015657 ?auto_1015661 ) ( CLEAR ?auto_1015657 ) ( IS-CRATE ?auto_1015658 ) ( AVAILABLE ?auto_1015665 ) ( IN ?auto_1015658 ?auto_1015663 ) ( ON ?auto_1015648 ?auto_1015647 ) ( ON ?auto_1015649 ?auto_1015648 ) ( ON ?auto_1015651 ?auto_1015649 ) ( ON ?auto_1015650 ?auto_1015651 ) ( ON ?auto_1015652 ?auto_1015650 ) ( ON ?auto_1015653 ?auto_1015652 ) ( ON ?auto_1015654 ?auto_1015653 ) ( ON ?auto_1015655 ?auto_1015654 ) ( ON ?auto_1015656 ?auto_1015655 ) ( ON ?auto_1015657 ?auto_1015656 ) ( not ( = ?auto_1015647 ?auto_1015648 ) ) ( not ( = ?auto_1015647 ?auto_1015649 ) ) ( not ( = ?auto_1015647 ?auto_1015651 ) ) ( not ( = ?auto_1015647 ?auto_1015650 ) ) ( not ( = ?auto_1015647 ?auto_1015652 ) ) ( not ( = ?auto_1015647 ?auto_1015653 ) ) ( not ( = ?auto_1015647 ?auto_1015654 ) ) ( not ( = ?auto_1015647 ?auto_1015655 ) ) ( not ( = ?auto_1015647 ?auto_1015656 ) ) ( not ( = ?auto_1015647 ?auto_1015657 ) ) ( not ( = ?auto_1015647 ?auto_1015658 ) ) ( not ( = ?auto_1015647 ?auto_1015659 ) ) ( not ( = ?auto_1015647 ?auto_1015662 ) ) ( not ( = ?auto_1015648 ?auto_1015649 ) ) ( not ( = ?auto_1015648 ?auto_1015651 ) ) ( not ( = ?auto_1015648 ?auto_1015650 ) ) ( not ( = ?auto_1015648 ?auto_1015652 ) ) ( not ( = ?auto_1015648 ?auto_1015653 ) ) ( not ( = ?auto_1015648 ?auto_1015654 ) ) ( not ( = ?auto_1015648 ?auto_1015655 ) ) ( not ( = ?auto_1015648 ?auto_1015656 ) ) ( not ( = ?auto_1015648 ?auto_1015657 ) ) ( not ( = ?auto_1015648 ?auto_1015658 ) ) ( not ( = ?auto_1015648 ?auto_1015659 ) ) ( not ( = ?auto_1015648 ?auto_1015662 ) ) ( not ( = ?auto_1015649 ?auto_1015651 ) ) ( not ( = ?auto_1015649 ?auto_1015650 ) ) ( not ( = ?auto_1015649 ?auto_1015652 ) ) ( not ( = ?auto_1015649 ?auto_1015653 ) ) ( not ( = ?auto_1015649 ?auto_1015654 ) ) ( not ( = ?auto_1015649 ?auto_1015655 ) ) ( not ( = ?auto_1015649 ?auto_1015656 ) ) ( not ( = ?auto_1015649 ?auto_1015657 ) ) ( not ( = ?auto_1015649 ?auto_1015658 ) ) ( not ( = ?auto_1015649 ?auto_1015659 ) ) ( not ( = ?auto_1015649 ?auto_1015662 ) ) ( not ( = ?auto_1015651 ?auto_1015650 ) ) ( not ( = ?auto_1015651 ?auto_1015652 ) ) ( not ( = ?auto_1015651 ?auto_1015653 ) ) ( not ( = ?auto_1015651 ?auto_1015654 ) ) ( not ( = ?auto_1015651 ?auto_1015655 ) ) ( not ( = ?auto_1015651 ?auto_1015656 ) ) ( not ( = ?auto_1015651 ?auto_1015657 ) ) ( not ( = ?auto_1015651 ?auto_1015658 ) ) ( not ( = ?auto_1015651 ?auto_1015659 ) ) ( not ( = ?auto_1015651 ?auto_1015662 ) ) ( not ( = ?auto_1015650 ?auto_1015652 ) ) ( not ( = ?auto_1015650 ?auto_1015653 ) ) ( not ( = ?auto_1015650 ?auto_1015654 ) ) ( not ( = ?auto_1015650 ?auto_1015655 ) ) ( not ( = ?auto_1015650 ?auto_1015656 ) ) ( not ( = ?auto_1015650 ?auto_1015657 ) ) ( not ( = ?auto_1015650 ?auto_1015658 ) ) ( not ( = ?auto_1015650 ?auto_1015659 ) ) ( not ( = ?auto_1015650 ?auto_1015662 ) ) ( not ( = ?auto_1015652 ?auto_1015653 ) ) ( not ( = ?auto_1015652 ?auto_1015654 ) ) ( not ( = ?auto_1015652 ?auto_1015655 ) ) ( not ( = ?auto_1015652 ?auto_1015656 ) ) ( not ( = ?auto_1015652 ?auto_1015657 ) ) ( not ( = ?auto_1015652 ?auto_1015658 ) ) ( not ( = ?auto_1015652 ?auto_1015659 ) ) ( not ( = ?auto_1015652 ?auto_1015662 ) ) ( not ( = ?auto_1015653 ?auto_1015654 ) ) ( not ( = ?auto_1015653 ?auto_1015655 ) ) ( not ( = ?auto_1015653 ?auto_1015656 ) ) ( not ( = ?auto_1015653 ?auto_1015657 ) ) ( not ( = ?auto_1015653 ?auto_1015658 ) ) ( not ( = ?auto_1015653 ?auto_1015659 ) ) ( not ( = ?auto_1015653 ?auto_1015662 ) ) ( not ( = ?auto_1015654 ?auto_1015655 ) ) ( not ( = ?auto_1015654 ?auto_1015656 ) ) ( not ( = ?auto_1015654 ?auto_1015657 ) ) ( not ( = ?auto_1015654 ?auto_1015658 ) ) ( not ( = ?auto_1015654 ?auto_1015659 ) ) ( not ( = ?auto_1015654 ?auto_1015662 ) ) ( not ( = ?auto_1015655 ?auto_1015656 ) ) ( not ( = ?auto_1015655 ?auto_1015657 ) ) ( not ( = ?auto_1015655 ?auto_1015658 ) ) ( not ( = ?auto_1015655 ?auto_1015659 ) ) ( not ( = ?auto_1015655 ?auto_1015662 ) ) ( not ( = ?auto_1015656 ?auto_1015657 ) ) ( not ( = ?auto_1015656 ?auto_1015658 ) ) ( not ( = ?auto_1015656 ?auto_1015659 ) ) ( not ( = ?auto_1015656 ?auto_1015662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1015657 ?auto_1015658 ?auto_1015659 )
      ( MAKE-12CRATE-VERIFY ?auto_1015647 ?auto_1015648 ?auto_1015649 ?auto_1015651 ?auto_1015650 ?auto_1015652 ?auto_1015653 ?auto_1015654 ?auto_1015655 ?auto_1015656 ?auto_1015657 ?auto_1015658 ?auto_1015659 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027226 - SURFACE
      ?auto_1027227 - SURFACE
      ?auto_1027228 - SURFACE
      ?auto_1027230 - SURFACE
      ?auto_1027229 - SURFACE
      ?auto_1027231 - SURFACE
      ?auto_1027232 - SURFACE
      ?auto_1027233 - SURFACE
      ?auto_1027234 - SURFACE
      ?auto_1027235 - SURFACE
      ?auto_1027236 - SURFACE
      ?auto_1027237 - SURFACE
      ?auto_1027238 - SURFACE
      ?auto_1027239 - SURFACE
    )
    :vars
    (
      ?auto_1027240 - HOIST
      ?auto_1027241 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027240 ?auto_1027241 ) ( SURFACE-AT ?auto_1027238 ?auto_1027241 ) ( CLEAR ?auto_1027238 ) ( LIFTING ?auto_1027240 ?auto_1027239 ) ( IS-CRATE ?auto_1027239 ) ( not ( = ?auto_1027238 ?auto_1027239 ) ) ( ON ?auto_1027227 ?auto_1027226 ) ( ON ?auto_1027228 ?auto_1027227 ) ( ON ?auto_1027230 ?auto_1027228 ) ( ON ?auto_1027229 ?auto_1027230 ) ( ON ?auto_1027231 ?auto_1027229 ) ( ON ?auto_1027232 ?auto_1027231 ) ( ON ?auto_1027233 ?auto_1027232 ) ( ON ?auto_1027234 ?auto_1027233 ) ( ON ?auto_1027235 ?auto_1027234 ) ( ON ?auto_1027236 ?auto_1027235 ) ( ON ?auto_1027237 ?auto_1027236 ) ( ON ?auto_1027238 ?auto_1027237 ) ( not ( = ?auto_1027226 ?auto_1027227 ) ) ( not ( = ?auto_1027226 ?auto_1027228 ) ) ( not ( = ?auto_1027226 ?auto_1027230 ) ) ( not ( = ?auto_1027226 ?auto_1027229 ) ) ( not ( = ?auto_1027226 ?auto_1027231 ) ) ( not ( = ?auto_1027226 ?auto_1027232 ) ) ( not ( = ?auto_1027226 ?auto_1027233 ) ) ( not ( = ?auto_1027226 ?auto_1027234 ) ) ( not ( = ?auto_1027226 ?auto_1027235 ) ) ( not ( = ?auto_1027226 ?auto_1027236 ) ) ( not ( = ?auto_1027226 ?auto_1027237 ) ) ( not ( = ?auto_1027226 ?auto_1027238 ) ) ( not ( = ?auto_1027226 ?auto_1027239 ) ) ( not ( = ?auto_1027227 ?auto_1027228 ) ) ( not ( = ?auto_1027227 ?auto_1027230 ) ) ( not ( = ?auto_1027227 ?auto_1027229 ) ) ( not ( = ?auto_1027227 ?auto_1027231 ) ) ( not ( = ?auto_1027227 ?auto_1027232 ) ) ( not ( = ?auto_1027227 ?auto_1027233 ) ) ( not ( = ?auto_1027227 ?auto_1027234 ) ) ( not ( = ?auto_1027227 ?auto_1027235 ) ) ( not ( = ?auto_1027227 ?auto_1027236 ) ) ( not ( = ?auto_1027227 ?auto_1027237 ) ) ( not ( = ?auto_1027227 ?auto_1027238 ) ) ( not ( = ?auto_1027227 ?auto_1027239 ) ) ( not ( = ?auto_1027228 ?auto_1027230 ) ) ( not ( = ?auto_1027228 ?auto_1027229 ) ) ( not ( = ?auto_1027228 ?auto_1027231 ) ) ( not ( = ?auto_1027228 ?auto_1027232 ) ) ( not ( = ?auto_1027228 ?auto_1027233 ) ) ( not ( = ?auto_1027228 ?auto_1027234 ) ) ( not ( = ?auto_1027228 ?auto_1027235 ) ) ( not ( = ?auto_1027228 ?auto_1027236 ) ) ( not ( = ?auto_1027228 ?auto_1027237 ) ) ( not ( = ?auto_1027228 ?auto_1027238 ) ) ( not ( = ?auto_1027228 ?auto_1027239 ) ) ( not ( = ?auto_1027230 ?auto_1027229 ) ) ( not ( = ?auto_1027230 ?auto_1027231 ) ) ( not ( = ?auto_1027230 ?auto_1027232 ) ) ( not ( = ?auto_1027230 ?auto_1027233 ) ) ( not ( = ?auto_1027230 ?auto_1027234 ) ) ( not ( = ?auto_1027230 ?auto_1027235 ) ) ( not ( = ?auto_1027230 ?auto_1027236 ) ) ( not ( = ?auto_1027230 ?auto_1027237 ) ) ( not ( = ?auto_1027230 ?auto_1027238 ) ) ( not ( = ?auto_1027230 ?auto_1027239 ) ) ( not ( = ?auto_1027229 ?auto_1027231 ) ) ( not ( = ?auto_1027229 ?auto_1027232 ) ) ( not ( = ?auto_1027229 ?auto_1027233 ) ) ( not ( = ?auto_1027229 ?auto_1027234 ) ) ( not ( = ?auto_1027229 ?auto_1027235 ) ) ( not ( = ?auto_1027229 ?auto_1027236 ) ) ( not ( = ?auto_1027229 ?auto_1027237 ) ) ( not ( = ?auto_1027229 ?auto_1027238 ) ) ( not ( = ?auto_1027229 ?auto_1027239 ) ) ( not ( = ?auto_1027231 ?auto_1027232 ) ) ( not ( = ?auto_1027231 ?auto_1027233 ) ) ( not ( = ?auto_1027231 ?auto_1027234 ) ) ( not ( = ?auto_1027231 ?auto_1027235 ) ) ( not ( = ?auto_1027231 ?auto_1027236 ) ) ( not ( = ?auto_1027231 ?auto_1027237 ) ) ( not ( = ?auto_1027231 ?auto_1027238 ) ) ( not ( = ?auto_1027231 ?auto_1027239 ) ) ( not ( = ?auto_1027232 ?auto_1027233 ) ) ( not ( = ?auto_1027232 ?auto_1027234 ) ) ( not ( = ?auto_1027232 ?auto_1027235 ) ) ( not ( = ?auto_1027232 ?auto_1027236 ) ) ( not ( = ?auto_1027232 ?auto_1027237 ) ) ( not ( = ?auto_1027232 ?auto_1027238 ) ) ( not ( = ?auto_1027232 ?auto_1027239 ) ) ( not ( = ?auto_1027233 ?auto_1027234 ) ) ( not ( = ?auto_1027233 ?auto_1027235 ) ) ( not ( = ?auto_1027233 ?auto_1027236 ) ) ( not ( = ?auto_1027233 ?auto_1027237 ) ) ( not ( = ?auto_1027233 ?auto_1027238 ) ) ( not ( = ?auto_1027233 ?auto_1027239 ) ) ( not ( = ?auto_1027234 ?auto_1027235 ) ) ( not ( = ?auto_1027234 ?auto_1027236 ) ) ( not ( = ?auto_1027234 ?auto_1027237 ) ) ( not ( = ?auto_1027234 ?auto_1027238 ) ) ( not ( = ?auto_1027234 ?auto_1027239 ) ) ( not ( = ?auto_1027235 ?auto_1027236 ) ) ( not ( = ?auto_1027235 ?auto_1027237 ) ) ( not ( = ?auto_1027235 ?auto_1027238 ) ) ( not ( = ?auto_1027235 ?auto_1027239 ) ) ( not ( = ?auto_1027236 ?auto_1027237 ) ) ( not ( = ?auto_1027236 ?auto_1027238 ) ) ( not ( = ?auto_1027236 ?auto_1027239 ) ) ( not ( = ?auto_1027237 ?auto_1027238 ) ) ( not ( = ?auto_1027237 ?auto_1027239 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1027238 ?auto_1027239 )
      ( MAKE-13CRATE-VERIFY ?auto_1027226 ?auto_1027227 ?auto_1027228 ?auto_1027230 ?auto_1027229 ?auto_1027231 ?auto_1027232 ?auto_1027233 ?auto_1027234 ?auto_1027235 ?auto_1027236 ?auto_1027237 ?auto_1027238 ?auto_1027239 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027368 - SURFACE
      ?auto_1027369 - SURFACE
      ?auto_1027370 - SURFACE
      ?auto_1027372 - SURFACE
      ?auto_1027371 - SURFACE
      ?auto_1027373 - SURFACE
      ?auto_1027374 - SURFACE
      ?auto_1027375 - SURFACE
      ?auto_1027376 - SURFACE
      ?auto_1027377 - SURFACE
      ?auto_1027378 - SURFACE
      ?auto_1027379 - SURFACE
      ?auto_1027380 - SURFACE
      ?auto_1027381 - SURFACE
    )
    :vars
    (
      ?auto_1027384 - HOIST
      ?auto_1027383 - PLACE
      ?auto_1027382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027384 ?auto_1027383 ) ( SURFACE-AT ?auto_1027380 ?auto_1027383 ) ( CLEAR ?auto_1027380 ) ( IS-CRATE ?auto_1027381 ) ( not ( = ?auto_1027380 ?auto_1027381 ) ) ( TRUCK-AT ?auto_1027382 ?auto_1027383 ) ( AVAILABLE ?auto_1027384 ) ( IN ?auto_1027381 ?auto_1027382 ) ( ON ?auto_1027380 ?auto_1027379 ) ( not ( = ?auto_1027379 ?auto_1027380 ) ) ( not ( = ?auto_1027379 ?auto_1027381 ) ) ( ON ?auto_1027369 ?auto_1027368 ) ( ON ?auto_1027370 ?auto_1027369 ) ( ON ?auto_1027372 ?auto_1027370 ) ( ON ?auto_1027371 ?auto_1027372 ) ( ON ?auto_1027373 ?auto_1027371 ) ( ON ?auto_1027374 ?auto_1027373 ) ( ON ?auto_1027375 ?auto_1027374 ) ( ON ?auto_1027376 ?auto_1027375 ) ( ON ?auto_1027377 ?auto_1027376 ) ( ON ?auto_1027378 ?auto_1027377 ) ( ON ?auto_1027379 ?auto_1027378 ) ( not ( = ?auto_1027368 ?auto_1027369 ) ) ( not ( = ?auto_1027368 ?auto_1027370 ) ) ( not ( = ?auto_1027368 ?auto_1027372 ) ) ( not ( = ?auto_1027368 ?auto_1027371 ) ) ( not ( = ?auto_1027368 ?auto_1027373 ) ) ( not ( = ?auto_1027368 ?auto_1027374 ) ) ( not ( = ?auto_1027368 ?auto_1027375 ) ) ( not ( = ?auto_1027368 ?auto_1027376 ) ) ( not ( = ?auto_1027368 ?auto_1027377 ) ) ( not ( = ?auto_1027368 ?auto_1027378 ) ) ( not ( = ?auto_1027368 ?auto_1027379 ) ) ( not ( = ?auto_1027368 ?auto_1027380 ) ) ( not ( = ?auto_1027368 ?auto_1027381 ) ) ( not ( = ?auto_1027369 ?auto_1027370 ) ) ( not ( = ?auto_1027369 ?auto_1027372 ) ) ( not ( = ?auto_1027369 ?auto_1027371 ) ) ( not ( = ?auto_1027369 ?auto_1027373 ) ) ( not ( = ?auto_1027369 ?auto_1027374 ) ) ( not ( = ?auto_1027369 ?auto_1027375 ) ) ( not ( = ?auto_1027369 ?auto_1027376 ) ) ( not ( = ?auto_1027369 ?auto_1027377 ) ) ( not ( = ?auto_1027369 ?auto_1027378 ) ) ( not ( = ?auto_1027369 ?auto_1027379 ) ) ( not ( = ?auto_1027369 ?auto_1027380 ) ) ( not ( = ?auto_1027369 ?auto_1027381 ) ) ( not ( = ?auto_1027370 ?auto_1027372 ) ) ( not ( = ?auto_1027370 ?auto_1027371 ) ) ( not ( = ?auto_1027370 ?auto_1027373 ) ) ( not ( = ?auto_1027370 ?auto_1027374 ) ) ( not ( = ?auto_1027370 ?auto_1027375 ) ) ( not ( = ?auto_1027370 ?auto_1027376 ) ) ( not ( = ?auto_1027370 ?auto_1027377 ) ) ( not ( = ?auto_1027370 ?auto_1027378 ) ) ( not ( = ?auto_1027370 ?auto_1027379 ) ) ( not ( = ?auto_1027370 ?auto_1027380 ) ) ( not ( = ?auto_1027370 ?auto_1027381 ) ) ( not ( = ?auto_1027372 ?auto_1027371 ) ) ( not ( = ?auto_1027372 ?auto_1027373 ) ) ( not ( = ?auto_1027372 ?auto_1027374 ) ) ( not ( = ?auto_1027372 ?auto_1027375 ) ) ( not ( = ?auto_1027372 ?auto_1027376 ) ) ( not ( = ?auto_1027372 ?auto_1027377 ) ) ( not ( = ?auto_1027372 ?auto_1027378 ) ) ( not ( = ?auto_1027372 ?auto_1027379 ) ) ( not ( = ?auto_1027372 ?auto_1027380 ) ) ( not ( = ?auto_1027372 ?auto_1027381 ) ) ( not ( = ?auto_1027371 ?auto_1027373 ) ) ( not ( = ?auto_1027371 ?auto_1027374 ) ) ( not ( = ?auto_1027371 ?auto_1027375 ) ) ( not ( = ?auto_1027371 ?auto_1027376 ) ) ( not ( = ?auto_1027371 ?auto_1027377 ) ) ( not ( = ?auto_1027371 ?auto_1027378 ) ) ( not ( = ?auto_1027371 ?auto_1027379 ) ) ( not ( = ?auto_1027371 ?auto_1027380 ) ) ( not ( = ?auto_1027371 ?auto_1027381 ) ) ( not ( = ?auto_1027373 ?auto_1027374 ) ) ( not ( = ?auto_1027373 ?auto_1027375 ) ) ( not ( = ?auto_1027373 ?auto_1027376 ) ) ( not ( = ?auto_1027373 ?auto_1027377 ) ) ( not ( = ?auto_1027373 ?auto_1027378 ) ) ( not ( = ?auto_1027373 ?auto_1027379 ) ) ( not ( = ?auto_1027373 ?auto_1027380 ) ) ( not ( = ?auto_1027373 ?auto_1027381 ) ) ( not ( = ?auto_1027374 ?auto_1027375 ) ) ( not ( = ?auto_1027374 ?auto_1027376 ) ) ( not ( = ?auto_1027374 ?auto_1027377 ) ) ( not ( = ?auto_1027374 ?auto_1027378 ) ) ( not ( = ?auto_1027374 ?auto_1027379 ) ) ( not ( = ?auto_1027374 ?auto_1027380 ) ) ( not ( = ?auto_1027374 ?auto_1027381 ) ) ( not ( = ?auto_1027375 ?auto_1027376 ) ) ( not ( = ?auto_1027375 ?auto_1027377 ) ) ( not ( = ?auto_1027375 ?auto_1027378 ) ) ( not ( = ?auto_1027375 ?auto_1027379 ) ) ( not ( = ?auto_1027375 ?auto_1027380 ) ) ( not ( = ?auto_1027375 ?auto_1027381 ) ) ( not ( = ?auto_1027376 ?auto_1027377 ) ) ( not ( = ?auto_1027376 ?auto_1027378 ) ) ( not ( = ?auto_1027376 ?auto_1027379 ) ) ( not ( = ?auto_1027376 ?auto_1027380 ) ) ( not ( = ?auto_1027376 ?auto_1027381 ) ) ( not ( = ?auto_1027377 ?auto_1027378 ) ) ( not ( = ?auto_1027377 ?auto_1027379 ) ) ( not ( = ?auto_1027377 ?auto_1027380 ) ) ( not ( = ?auto_1027377 ?auto_1027381 ) ) ( not ( = ?auto_1027378 ?auto_1027379 ) ) ( not ( = ?auto_1027378 ?auto_1027380 ) ) ( not ( = ?auto_1027378 ?auto_1027381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1027379 ?auto_1027380 ?auto_1027381 )
      ( MAKE-13CRATE-VERIFY ?auto_1027368 ?auto_1027369 ?auto_1027370 ?auto_1027372 ?auto_1027371 ?auto_1027373 ?auto_1027374 ?auto_1027375 ?auto_1027376 ?auto_1027377 ?auto_1027378 ?auto_1027379 ?auto_1027380 ?auto_1027381 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027524 - SURFACE
      ?auto_1027525 - SURFACE
      ?auto_1027526 - SURFACE
      ?auto_1027528 - SURFACE
      ?auto_1027527 - SURFACE
      ?auto_1027529 - SURFACE
      ?auto_1027530 - SURFACE
      ?auto_1027531 - SURFACE
      ?auto_1027532 - SURFACE
      ?auto_1027533 - SURFACE
      ?auto_1027534 - SURFACE
      ?auto_1027535 - SURFACE
      ?auto_1027536 - SURFACE
      ?auto_1027537 - SURFACE
    )
    :vars
    (
      ?auto_1027541 - HOIST
      ?auto_1027538 - PLACE
      ?auto_1027540 - TRUCK
      ?auto_1027539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027541 ?auto_1027538 ) ( SURFACE-AT ?auto_1027536 ?auto_1027538 ) ( CLEAR ?auto_1027536 ) ( IS-CRATE ?auto_1027537 ) ( not ( = ?auto_1027536 ?auto_1027537 ) ) ( AVAILABLE ?auto_1027541 ) ( IN ?auto_1027537 ?auto_1027540 ) ( ON ?auto_1027536 ?auto_1027535 ) ( not ( = ?auto_1027535 ?auto_1027536 ) ) ( not ( = ?auto_1027535 ?auto_1027537 ) ) ( TRUCK-AT ?auto_1027540 ?auto_1027539 ) ( not ( = ?auto_1027539 ?auto_1027538 ) ) ( ON ?auto_1027525 ?auto_1027524 ) ( ON ?auto_1027526 ?auto_1027525 ) ( ON ?auto_1027528 ?auto_1027526 ) ( ON ?auto_1027527 ?auto_1027528 ) ( ON ?auto_1027529 ?auto_1027527 ) ( ON ?auto_1027530 ?auto_1027529 ) ( ON ?auto_1027531 ?auto_1027530 ) ( ON ?auto_1027532 ?auto_1027531 ) ( ON ?auto_1027533 ?auto_1027532 ) ( ON ?auto_1027534 ?auto_1027533 ) ( ON ?auto_1027535 ?auto_1027534 ) ( not ( = ?auto_1027524 ?auto_1027525 ) ) ( not ( = ?auto_1027524 ?auto_1027526 ) ) ( not ( = ?auto_1027524 ?auto_1027528 ) ) ( not ( = ?auto_1027524 ?auto_1027527 ) ) ( not ( = ?auto_1027524 ?auto_1027529 ) ) ( not ( = ?auto_1027524 ?auto_1027530 ) ) ( not ( = ?auto_1027524 ?auto_1027531 ) ) ( not ( = ?auto_1027524 ?auto_1027532 ) ) ( not ( = ?auto_1027524 ?auto_1027533 ) ) ( not ( = ?auto_1027524 ?auto_1027534 ) ) ( not ( = ?auto_1027524 ?auto_1027535 ) ) ( not ( = ?auto_1027524 ?auto_1027536 ) ) ( not ( = ?auto_1027524 ?auto_1027537 ) ) ( not ( = ?auto_1027525 ?auto_1027526 ) ) ( not ( = ?auto_1027525 ?auto_1027528 ) ) ( not ( = ?auto_1027525 ?auto_1027527 ) ) ( not ( = ?auto_1027525 ?auto_1027529 ) ) ( not ( = ?auto_1027525 ?auto_1027530 ) ) ( not ( = ?auto_1027525 ?auto_1027531 ) ) ( not ( = ?auto_1027525 ?auto_1027532 ) ) ( not ( = ?auto_1027525 ?auto_1027533 ) ) ( not ( = ?auto_1027525 ?auto_1027534 ) ) ( not ( = ?auto_1027525 ?auto_1027535 ) ) ( not ( = ?auto_1027525 ?auto_1027536 ) ) ( not ( = ?auto_1027525 ?auto_1027537 ) ) ( not ( = ?auto_1027526 ?auto_1027528 ) ) ( not ( = ?auto_1027526 ?auto_1027527 ) ) ( not ( = ?auto_1027526 ?auto_1027529 ) ) ( not ( = ?auto_1027526 ?auto_1027530 ) ) ( not ( = ?auto_1027526 ?auto_1027531 ) ) ( not ( = ?auto_1027526 ?auto_1027532 ) ) ( not ( = ?auto_1027526 ?auto_1027533 ) ) ( not ( = ?auto_1027526 ?auto_1027534 ) ) ( not ( = ?auto_1027526 ?auto_1027535 ) ) ( not ( = ?auto_1027526 ?auto_1027536 ) ) ( not ( = ?auto_1027526 ?auto_1027537 ) ) ( not ( = ?auto_1027528 ?auto_1027527 ) ) ( not ( = ?auto_1027528 ?auto_1027529 ) ) ( not ( = ?auto_1027528 ?auto_1027530 ) ) ( not ( = ?auto_1027528 ?auto_1027531 ) ) ( not ( = ?auto_1027528 ?auto_1027532 ) ) ( not ( = ?auto_1027528 ?auto_1027533 ) ) ( not ( = ?auto_1027528 ?auto_1027534 ) ) ( not ( = ?auto_1027528 ?auto_1027535 ) ) ( not ( = ?auto_1027528 ?auto_1027536 ) ) ( not ( = ?auto_1027528 ?auto_1027537 ) ) ( not ( = ?auto_1027527 ?auto_1027529 ) ) ( not ( = ?auto_1027527 ?auto_1027530 ) ) ( not ( = ?auto_1027527 ?auto_1027531 ) ) ( not ( = ?auto_1027527 ?auto_1027532 ) ) ( not ( = ?auto_1027527 ?auto_1027533 ) ) ( not ( = ?auto_1027527 ?auto_1027534 ) ) ( not ( = ?auto_1027527 ?auto_1027535 ) ) ( not ( = ?auto_1027527 ?auto_1027536 ) ) ( not ( = ?auto_1027527 ?auto_1027537 ) ) ( not ( = ?auto_1027529 ?auto_1027530 ) ) ( not ( = ?auto_1027529 ?auto_1027531 ) ) ( not ( = ?auto_1027529 ?auto_1027532 ) ) ( not ( = ?auto_1027529 ?auto_1027533 ) ) ( not ( = ?auto_1027529 ?auto_1027534 ) ) ( not ( = ?auto_1027529 ?auto_1027535 ) ) ( not ( = ?auto_1027529 ?auto_1027536 ) ) ( not ( = ?auto_1027529 ?auto_1027537 ) ) ( not ( = ?auto_1027530 ?auto_1027531 ) ) ( not ( = ?auto_1027530 ?auto_1027532 ) ) ( not ( = ?auto_1027530 ?auto_1027533 ) ) ( not ( = ?auto_1027530 ?auto_1027534 ) ) ( not ( = ?auto_1027530 ?auto_1027535 ) ) ( not ( = ?auto_1027530 ?auto_1027536 ) ) ( not ( = ?auto_1027530 ?auto_1027537 ) ) ( not ( = ?auto_1027531 ?auto_1027532 ) ) ( not ( = ?auto_1027531 ?auto_1027533 ) ) ( not ( = ?auto_1027531 ?auto_1027534 ) ) ( not ( = ?auto_1027531 ?auto_1027535 ) ) ( not ( = ?auto_1027531 ?auto_1027536 ) ) ( not ( = ?auto_1027531 ?auto_1027537 ) ) ( not ( = ?auto_1027532 ?auto_1027533 ) ) ( not ( = ?auto_1027532 ?auto_1027534 ) ) ( not ( = ?auto_1027532 ?auto_1027535 ) ) ( not ( = ?auto_1027532 ?auto_1027536 ) ) ( not ( = ?auto_1027532 ?auto_1027537 ) ) ( not ( = ?auto_1027533 ?auto_1027534 ) ) ( not ( = ?auto_1027533 ?auto_1027535 ) ) ( not ( = ?auto_1027533 ?auto_1027536 ) ) ( not ( = ?auto_1027533 ?auto_1027537 ) ) ( not ( = ?auto_1027534 ?auto_1027535 ) ) ( not ( = ?auto_1027534 ?auto_1027536 ) ) ( not ( = ?auto_1027534 ?auto_1027537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1027535 ?auto_1027536 ?auto_1027537 )
      ( MAKE-13CRATE-VERIFY ?auto_1027524 ?auto_1027525 ?auto_1027526 ?auto_1027528 ?auto_1027527 ?auto_1027529 ?auto_1027530 ?auto_1027531 ?auto_1027532 ?auto_1027533 ?auto_1027534 ?auto_1027535 ?auto_1027536 ?auto_1027537 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027693 - SURFACE
      ?auto_1027694 - SURFACE
      ?auto_1027695 - SURFACE
      ?auto_1027697 - SURFACE
      ?auto_1027696 - SURFACE
      ?auto_1027698 - SURFACE
      ?auto_1027699 - SURFACE
      ?auto_1027700 - SURFACE
      ?auto_1027701 - SURFACE
      ?auto_1027702 - SURFACE
      ?auto_1027703 - SURFACE
      ?auto_1027704 - SURFACE
      ?auto_1027705 - SURFACE
      ?auto_1027706 - SURFACE
    )
    :vars
    (
      ?auto_1027709 - HOIST
      ?auto_1027711 - PLACE
      ?auto_1027707 - TRUCK
      ?auto_1027710 - PLACE
      ?auto_1027708 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027709 ?auto_1027711 ) ( SURFACE-AT ?auto_1027705 ?auto_1027711 ) ( CLEAR ?auto_1027705 ) ( IS-CRATE ?auto_1027706 ) ( not ( = ?auto_1027705 ?auto_1027706 ) ) ( AVAILABLE ?auto_1027709 ) ( ON ?auto_1027705 ?auto_1027704 ) ( not ( = ?auto_1027704 ?auto_1027705 ) ) ( not ( = ?auto_1027704 ?auto_1027706 ) ) ( TRUCK-AT ?auto_1027707 ?auto_1027710 ) ( not ( = ?auto_1027710 ?auto_1027711 ) ) ( HOIST-AT ?auto_1027708 ?auto_1027710 ) ( LIFTING ?auto_1027708 ?auto_1027706 ) ( not ( = ?auto_1027709 ?auto_1027708 ) ) ( ON ?auto_1027694 ?auto_1027693 ) ( ON ?auto_1027695 ?auto_1027694 ) ( ON ?auto_1027697 ?auto_1027695 ) ( ON ?auto_1027696 ?auto_1027697 ) ( ON ?auto_1027698 ?auto_1027696 ) ( ON ?auto_1027699 ?auto_1027698 ) ( ON ?auto_1027700 ?auto_1027699 ) ( ON ?auto_1027701 ?auto_1027700 ) ( ON ?auto_1027702 ?auto_1027701 ) ( ON ?auto_1027703 ?auto_1027702 ) ( ON ?auto_1027704 ?auto_1027703 ) ( not ( = ?auto_1027693 ?auto_1027694 ) ) ( not ( = ?auto_1027693 ?auto_1027695 ) ) ( not ( = ?auto_1027693 ?auto_1027697 ) ) ( not ( = ?auto_1027693 ?auto_1027696 ) ) ( not ( = ?auto_1027693 ?auto_1027698 ) ) ( not ( = ?auto_1027693 ?auto_1027699 ) ) ( not ( = ?auto_1027693 ?auto_1027700 ) ) ( not ( = ?auto_1027693 ?auto_1027701 ) ) ( not ( = ?auto_1027693 ?auto_1027702 ) ) ( not ( = ?auto_1027693 ?auto_1027703 ) ) ( not ( = ?auto_1027693 ?auto_1027704 ) ) ( not ( = ?auto_1027693 ?auto_1027705 ) ) ( not ( = ?auto_1027693 ?auto_1027706 ) ) ( not ( = ?auto_1027694 ?auto_1027695 ) ) ( not ( = ?auto_1027694 ?auto_1027697 ) ) ( not ( = ?auto_1027694 ?auto_1027696 ) ) ( not ( = ?auto_1027694 ?auto_1027698 ) ) ( not ( = ?auto_1027694 ?auto_1027699 ) ) ( not ( = ?auto_1027694 ?auto_1027700 ) ) ( not ( = ?auto_1027694 ?auto_1027701 ) ) ( not ( = ?auto_1027694 ?auto_1027702 ) ) ( not ( = ?auto_1027694 ?auto_1027703 ) ) ( not ( = ?auto_1027694 ?auto_1027704 ) ) ( not ( = ?auto_1027694 ?auto_1027705 ) ) ( not ( = ?auto_1027694 ?auto_1027706 ) ) ( not ( = ?auto_1027695 ?auto_1027697 ) ) ( not ( = ?auto_1027695 ?auto_1027696 ) ) ( not ( = ?auto_1027695 ?auto_1027698 ) ) ( not ( = ?auto_1027695 ?auto_1027699 ) ) ( not ( = ?auto_1027695 ?auto_1027700 ) ) ( not ( = ?auto_1027695 ?auto_1027701 ) ) ( not ( = ?auto_1027695 ?auto_1027702 ) ) ( not ( = ?auto_1027695 ?auto_1027703 ) ) ( not ( = ?auto_1027695 ?auto_1027704 ) ) ( not ( = ?auto_1027695 ?auto_1027705 ) ) ( not ( = ?auto_1027695 ?auto_1027706 ) ) ( not ( = ?auto_1027697 ?auto_1027696 ) ) ( not ( = ?auto_1027697 ?auto_1027698 ) ) ( not ( = ?auto_1027697 ?auto_1027699 ) ) ( not ( = ?auto_1027697 ?auto_1027700 ) ) ( not ( = ?auto_1027697 ?auto_1027701 ) ) ( not ( = ?auto_1027697 ?auto_1027702 ) ) ( not ( = ?auto_1027697 ?auto_1027703 ) ) ( not ( = ?auto_1027697 ?auto_1027704 ) ) ( not ( = ?auto_1027697 ?auto_1027705 ) ) ( not ( = ?auto_1027697 ?auto_1027706 ) ) ( not ( = ?auto_1027696 ?auto_1027698 ) ) ( not ( = ?auto_1027696 ?auto_1027699 ) ) ( not ( = ?auto_1027696 ?auto_1027700 ) ) ( not ( = ?auto_1027696 ?auto_1027701 ) ) ( not ( = ?auto_1027696 ?auto_1027702 ) ) ( not ( = ?auto_1027696 ?auto_1027703 ) ) ( not ( = ?auto_1027696 ?auto_1027704 ) ) ( not ( = ?auto_1027696 ?auto_1027705 ) ) ( not ( = ?auto_1027696 ?auto_1027706 ) ) ( not ( = ?auto_1027698 ?auto_1027699 ) ) ( not ( = ?auto_1027698 ?auto_1027700 ) ) ( not ( = ?auto_1027698 ?auto_1027701 ) ) ( not ( = ?auto_1027698 ?auto_1027702 ) ) ( not ( = ?auto_1027698 ?auto_1027703 ) ) ( not ( = ?auto_1027698 ?auto_1027704 ) ) ( not ( = ?auto_1027698 ?auto_1027705 ) ) ( not ( = ?auto_1027698 ?auto_1027706 ) ) ( not ( = ?auto_1027699 ?auto_1027700 ) ) ( not ( = ?auto_1027699 ?auto_1027701 ) ) ( not ( = ?auto_1027699 ?auto_1027702 ) ) ( not ( = ?auto_1027699 ?auto_1027703 ) ) ( not ( = ?auto_1027699 ?auto_1027704 ) ) ( not ( = ?auto_1027699 ?auto_1027705 ) ) ( not ( = ?auto_1027699 ?auto_1027706 ) ) ( not ( = ?auto_1027700 ?auto_1027701 ) ) ( not ( = ?auto_1027700 ?auto_1027702 ) ) ( not ( = ?auto_1027700 ?auto_1027703 ) ) ( not ( = ?auto_1027700 ?auto_1027704 ) ) ( not ( = ?auto_1027700 ?auto_1027705 ) ) ( not ( = ?auto_1027700 ?auto_1027706 ) ) ( not ( = ?auto_1027701 ?auto_1027702 ) ) ( not ( = ?auto_1027701 ?auto_1027703 ) ) ( not ( = ?auto_1027701 ?auto_1027704 ) ) ( not ( = ?auto_1027701 ?auto_1027705 ) ) ( not ( = ?auto_1027701 ?auto_1027706 ) ) ( not ( = ?auto_1027702 ?auto_1027703 ) ) ( not ( = ?auto_1027702 ?auto_1027704 ) ) ( not ( = ?auto_1027702 ?auto_1027705 ) ) ( not ( = ?auto_1027702 ?auto_1027706 ) ) ( not ( = ?auto_1027703 ?auto_1027704 ) ) ( not ( = ?auto_1027703 ?auto_1027705 ) ) ( not ( = ?auto_1027703 ?auto_1027706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1027704 ?auto_1027705 ?auto_1027706 )
      ( MAKE-13CRATE-VERIFY ?auto_1027693 ?auto_1027694 ?auto_1027695 ?auto_1027697 ?auto_1027696 ?auto_1027698 ?auto_1027699 ?auto_1027700 ?auto_1027701 ?auto_1027702 ?auto_1027703 ?auto_1027704 ?auto_1027705 ?auto_1027706 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1027875 - SURFACE
      ?auto_1027876 - SURFACE
      ?auto_1027877 - SURFACE
      ?auto_1027879 - SURFACE
      ?auto_1027878 - SURFACE
      ?auto_1027880 - SURFACE
      ?auto_1027881 - SURFACE
      ?auto_1027882 - SURFACE
      ?auto_1027883 - SURFACE
      ?auto_1027884 - SURFACE
      ?auto_1027885 - SURFACE
      ?auto_1027886 - SURFACE
      ?auto_1027887 - SURFACE
      ?auto_1027888 - SURFACE
    )
    :vars
    (
      ?auto_1027893 - HOIST
      ?auto_1027894 - PLACE
      ?auto_1027892 - TRUCK
      ?auto_1027890 - PLACE
      ?auto_1027889 - HOIST
      ?auto_1027891 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1027893 ?auto_1027894 ) ( SURFACE-AT ?auto_1027887 ?auto_1027894 ) ( CLEAR ?auto_1027887 ) ( IS-CRATE ?auto_1027888 ) ( not ( = ?auto_1027887 ?auto_1027888 ) ) ( AVAILABLE ?auto_1027893 ) ( ON ?auto_1027887 ?auto_1027886 ) ( not ( = ?auto_1027886 ?auto_1027887 ) ) ( not ( = ?auto_1027886 ?auto_1027888 ) ) ( TRUCK-AT ?auto_1027892 ?auto_1027890 ) ( not ( = ?auto_1027890 ?auto_1027894 ) ) ( HOIST-AT ?auto_1027889 ?auto_1027890 ) ( not ( = ?auto_1027893 ?auto_1027889 ) ) ( AVAILABLE ?auto_1027889 ) ( SURFACE-AT ?auto_1027888 ?auto_1027890 ) ( ON ?auto_1027888 ?auto_1027891 ) ( CLEAR ?auto_1027888 ) ( not ( = ?auto_1027887 ?auto_1027891 ) ) ( not ( = ?auto_1027888 ?auto_1027891 ) ) ( not ( = ?auto_1027886 ?auto_1027891 ) ) ( ON ?auto_1027876 ?auto_1027875 ) ( ON ?auto_1027877 ?auto_1027876 ) ( ON ?auto_1027879 ?auto_1027877 ) ( ON ?auto_1027878 ?auto_1027879 ) ( ON ?auto_1027880 ?auto_1027878 ) ( ON ?auto_1027881 ?auto_1027880 ) ( ON ?auto_1027882 ?auto_1027881 ) ( ON ?auto_1027883 ?auto_1027882 ) ( ON ?auto_1027884 ?auto_1027883 ) ( ON ?auto_1027885 ?auto_1027884 ) ( ON ?auto_1027886 ?auto_1027885 ) ( not ( = ?auto_1027875 ?auto_1027876 ) ) ( not ( = ?auto_1027875 ?auto_1027877 ) ) ( not ( = ?auto_1027875 ?auto_1027879 ) ) ( not ( = ?auto_1027875 ?auto_1027878 ) ) ( not ( = ?auto_1027875 ?auto_1027880 ) ) ( not ( = ?auto_1027875 ?auto_1027881 ) ) ( not ( = ?auto_1027875 ?auto_1027882 ) ) ( not ( = ?auto_1027875 ?auto_1027883 ) ) ( not ( = ?auto_1027875 ?auto_1027884 ) ) ( not ( = ?auto_1027875 ?auto_1027885 ) ) ( not ( = ?auto_1027875 ?auto_1027886 ) ) ( not ( = ?auto_1027875 ?auto_1027887 ) ) ( not ( = ?auto_1027875 ?auto_1027888 ) ) ( not ( = ?auto_1027875 ?auto_1027891 ) ) ( not ( = ?auto_1027876 ?auto_1027877 ) ) ( not ( = ?auto_1027876 ?auto_1027879 ) ) ( not ( = ?auto_1027876 ?auto_1027878 ) ) ( not ( = ?auto_1027876 ?auto_1027880 ) ) ( not ( = ?auto_1027876 ?auto_1027881 ) ) ( not ( = ?auto_1027876 ?auto_1027882 ) ) ( not ( = ?auto_1027876 ?auto_1027883 ) ) ( not ( = ?auto_1027876 ?auto_1027884 ) ) ( not ( = ?auto_1027876 ?auto_1027885 ) ) ( not ( = ?auto_1027876 ?auto_1027886 ) ) ( not ( = ?auto_1027876 ?auto_1027887 ) ) ( not ( = ?auto_1027876 ?auto_1027888 ) ) ( not ( = ?auto_1027876 ?auto_1027891 ) ) ( not ( = ?auto_1027877 ?auto_1027879 ) ) ( not ( = ?auto_1027877 ?auto_1027878 ) ) ( not ( = ?auto_1027877 ?auto_1027880 ) ) ( not ( = ?auto_1027877 ?auto_1027881 ) ) ( not ( = ?auto_1027877 ?auto_1027882 ) ) ( not ( = ?auto_1027877 ?auto_1027883 ) ) ( not ( = ?auto_1027877 ?auto_1027884 ) ) ( not ( = ?auto_1027877 ?auto_1027885 ) ) ( not ( = ?auto_1027877 ?auto_1027886 ) ) ( not ( = ?auto_1027877 ?auto_1027887 ) ) ( not ( = ?auto_1027877 ?auto_1027888 ) ) ( not ( = ?auto_1027877 ?auto_1027891 ) ) ( not ( = ?auto_1027879 ?auto_1027878 ) ) ( not ( = ?auto_1027879 ?auto_1027880 ) ) ( not ( = ?auto_1027879 ?auto_1027881 ) ) ( not ( = ?auto_1027879 ?auto_1027882 ) ) ( not ( = ?auto_1027879 ?auto_1027883 ) ) ( not ( = ?auto_1027879 ?auto_1027884 ) ) ( not ( = ?auto_1027879 ?auto_1027885 ) ) ( not ( = ?auto_1027879 ?auto_1027886 ) ) ( not ( = ?auto_1027879 ?auto_1027887 ) ) ( not ( = ?auto_1027879 ?auto_1027888 ) ) ( not ( = ?auto_1027879 ?auto_1027891 ) ) ( not ( = ?auto_1027878 ?auto_1027880 ) ) ( not ( = ?auto_1027878 ?auto_1027881 ) ) ( not ( = ?auto_1027878 ?auto_1027882 ) ) ( not ( = ?auto_1027878 ?auto_1027883 ) ) ( not ( = ?auto_1027878 ?auto_1027884 ) ) ( not ( = ?auto_1027878 ?auto_1027885 ) ) ( not ( = ?auto_1027878 ?auto_1027886 ) ) ( not ( = ?auto_1027878 ?auto_1027887 ) ) ( not ( = ?auto_1027878 ?auto_1027888 ) ) ( not ( = ?auto_1027878 ?auto_1027891 ) ) ( not ( = ?auto_1027880 ?auto_1027881 ) ) ( not ( = ?auto_1027880 ?auto_1027882 ) ) ( not ( = ?auto_1027880 ?auto_1027883 ) ) ( not ( = ?auto_1027880 ?auto_1027884 ) ) ( not ( = ?auto_1027880 ?auto_1027885 ) ) ( not ( = ?auto_1027880 ?auto_1027886 ) ) ( not ( = ?auto_1027880 ?auto_1027887 ) ) ( not ( = ?auto_1027880 ?auto_1027888 ) ) ( not ( = ?auto_1027880 ?auto_1027891 ) ) ( not ( = ?auto_1027881 ?auto_1027882 ) ) ( not ( = ?auto_1027881 ?auto_1027883 ) ) ( not ( = ?auto_1027881 ?auto_1027884 ) ) ( not ( = ?auto_1027881 ?auto_1027885 ) ) ( not ( = ?auto_1027881 ?auto_1027886 ) ) ( not ( = ?auto_1027881 ?auto_1027887 ) ) ( not ( = ?auto_1027881 ?auto_1027888 ) ) ( not ( = ?auto_1027881 ?auto_1027891 ) ) ( not ( = ?auto_1027882 ?auto_1027883 ) ) ( not ( = ?auto_1027882 ?auto_1027884 ) ) ( not ( = ?auto_1027882 ?auto_1027885 ) ) ( not ( = ?auto_1027882 ?auto_1027886 ) ) ( not ( = ?auto_1027882 ?auto_1027887 ) ) ( not ( = ?auto_1027882 ?auto_1027888 ) ) ( not ( = ?auto_1027882 ?auto_1027891 ) ) ( not ( = ?auto_1027883 ?auto_1027884 ) ) ( not ( = ?auto_1027883 ?auto_1027885 ) ) ( not ( = ?auto_1027883 ?auto_1027886 ) ) ( not ( = ?auto_1027883 ?auto_1027887 ) ) ( not ( = ?auto_1027883 ?auto_1027888 ) ) ( not ( = ?auto_1027883 ?auto_1027891 ) ) ( not ( = ?auto_1027884 ?auto_1027885 ) ) ( not ( = ?auto_1027884 ?auto_1027886 ) ) ( not ( = ?auto_1027884 ?auto_1027887 ) ) ( not ( = ?auto_1027884 ?auto_1027888 ) ) ( not ( = ?auto_1027884 ?auto_1027891 ) ) ( not ( = ?auto_1027885 ?auto_1027886 ) ) ( not ( = ?auto_1027885 ?auto_1027887 ) ) ( not ( = ?auto_1027885 ?auto_1027888 ) ) ( not ( = ?auto_1027885 ?auto_1027891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1027886 ?auto_1027887 ?auto_1027888 )
      ( MAKE-13CRATE-VERIFY ?auto_1027875 ?auto_1027876 ?auto_1027877 ?auto_1027879 ?auto_1027878 ?auto_1027880 ?auto_1027881 ?auto_1027882 ?auto_1027883 ?auto_1027884 ?auto_1027885 ?auto_1027886 ?auto_1027887 ?auto_1027888 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028058 - SURFACE
      ?auto_1028059 - SURFACE
      ?auto_1028060 - SURFACE
      ?auto_1028062 - SURFACE
      ?auto_1028061 - SURFACE
      ?auto_1028063 - SURFACE
      ?auto_1028064 - SURFACE
      ?auto_1028065 - SURFACE
      ?auto_1028066 - SURFACE
      ?auto_1028067 - SURFACE
      ?auto_1028068 - SURFACE
      ?auto_1028069 - SURFACE
      ?auto_1028070 - SURFACE
      ?auto_1028071 - SURFACE
    )
    :vars
    (
      ?auto_1028076 - HOIST
      ?auto_1028074 - PLACE
      ?auto_1028073 - PLACE
      ?auto_1028077 - HOIST
      ?auto_1028072 - SURFACE
      ?auto_1028075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028076 ?auto_1028074 ) ( SURFACE-AT ?auto_1028070 ?auto_1028074 ) ( CLEAR ?auto_1028070 ) ( IS-CRATE ?auto_1028071 ) ( not ( = ?auto_1028070 ?auto_1028071 ) ) ( AVAILABLE ?auto_1028076 ) ( ON ?auto_1028070 ?auto_1028069 ) ( not ( = ?auto_1028069 ?auto_1028070 ) ) ( not ( = ?auto_1028069 ?auto_1028071 ) ) ( not ( = ?auto_1028073 ?auto_1028074 ) ) ( HOIST-AT ?auto_1028077 ?auto_1028073 ) ( not ( = ?auto_1028076 ?auto_1028077 ) ) ( AVAILABLE ?auto_1028077 ) ( SURFACE-AT ?auto_1028071 ?auto_1028073 ) ( ON ?auto_1028071 ?auto_1028072 ) ( CLEAR ?auto_1028071 ) ( not ( = ?auto_1028070 ?auto_1028072 ) ) ( not ( = ?auto_1028071 ?auto_1028072 ) ) ( not ( = ?auto_1028069 ?auto_1028072 ) ) ( TRUCK-AT ?auto_1028075 ?auto_1028074 ) ( ON ?auto_1028059 ?auto_1028058 ) ( ON ?auto_1028060 ?auto_1028059 ) ( ON ?auto_1028062 ?auto_1028060 ) ( ON ?auto_1028061 ?auto_1028062 ) ( ON ?auto_1028063 ?auto_1028061 ) ( ON ?auto_1028064 ?auto_1028063 ) ( ON ?auto_1028065 ?auto_1028064 ) ( ON ?auto_1028066 ?auto_1028065 ) ( ON ?auto_1028067 ?auto_1028066 ) ( ON ?auto_1028068 ?auto_1028067 ) ( ON ?auto_1028069 ?auto_1028068 ) ( not ( = ?auto_1028058 ?auto_1028059 ) ) ( not ( = ?auto_1028058 ?auto_1028060 ) ) ( not ( = ?auto_1028058 ?auto_1028062 ) ) ( not ( = ?auto_1028058 ?auto_1028061 ) ) ( not ( = ?auto_1028058 ?auto_1028063 ) ) ( not ( = ?auto_1028058 ?auto_1028064 ) ) ( not ( = ?auto_1028058 ?auto_1028065 ) ) ( not ( = ?auto_1028058 ?auto_1028066 ) ) ( not ( = ?auto_1028058 ?auto_1028067 ) ) ( not ( = ?auto_1028058 ?auto_1028068 ) ) ( not ( = ?auto_1028058 ?auto_1028069 ) ) ( not ( = ?auto_1028058 ?auto_1028070 ) ) ( not ( = ?auto_1028058 ?auto_1028071 ) ) ( not ( = ?auto_1028058 ?auto_1028072 ) ) ( not ( = ?auto_1028059 ?auto_1028060 ) ) ( not ( = ?auto_1028059 ?auto_1028062 ) ) ( not ( = ?auto_1028059 ?auto_1028061 ) ) ( not ( = ?auto_1028059 ?auto_1028063 ) ) ( not ( = ?auto_1028059 ?auto_1028064 ) ) ( not ( = ?auto_1028059 ?auto_1028065 ) ) ( not ( = ?auto_1028059 ?auto_1028066 ) ) ( not ( = ?auto_1028059 ?auto_1028067 ) ) ( not ( = ?auto_1028059 ?auto_1028068 ) ) ( not ( = ?auto_1028059 ?auto_1028069 ) ) ( not ( = ?auto_1028059 ?auto_1028070 ) ) ( not ( = ?auto_1028059 ?auto_1028071 ) ) ( not ( = ?auto_1028059 ?auto_1028072 ) ) ( not ( = ?auto_1028060 ?auto_1028062 ) ) ( not ( = ?auto_1028060 ?auto_1028061 ) ) ( not ( = ?auto_1028060 ?auto_1028063 ) ) ( not ( = ?auto_1028060 ?auto_1028064 ) ) ( not ( = ?auto_1028060 ?auto_1028065 ) ) ( not ( = ?auto_1028060 ?auto_1028066 ) ) ( not ( = ?auto_1028060 ?auto_1028067 ) ) ( not ( = ?auto_1028060 ?auto_1028068 ) ) ( not ( = ?auto_1028060 ?auto_1028069 ) ) ( not ( = ?auto_1028060 ?auto_1028070 ) ) ( not ( = ?auto_1028060 ?auto_1028071 ) ) ( not ( = ?auto_1028060 ?auto_1028072 ) ) ( not ( = ?auto_1028062 ?auto_1028061 ) ) ( not ( = ?auto_1028062 ?auto_1028063 ) ) ( not ( = ?auto_1028062 ?auto_1028064 ) ) ( not ( = ?auto_1028062 ?auto_1028065 ) ) ( not ( = ?auto_1028062 ?auto_1028066 ) ) ( not ( = ?auto_1028062 ?auto_1028067 ) ) ( not ( = ?auto_1028062 ?auto_1028068 ) ) ( not ( = ?auto_1028062 ?auto_1028069 ) ) ( not ( = ?auto_1028062 ?auto_1028070 ) ) ( not ( = ?auto_1028062 ?auto_1028071 ) ) ( not ( = ?auto_1028062 ?auto_1028072 ) ) ( not ( = ?auto_1028061 ?auto_1028063 ) ) ( not ( = ?auto_1028061 ?auto_1028064 ) ) ( not ( = ?auto_1028061 ?auto_1028065 ) ) ( not ( = ?auto_1028061 ?auto_1028066 ) ) ( not ( = ?auto_1028061 ?auto_1028067 ) ) ( not ( = ?auto_1028061 ?auto_1028068 ) ) ( not ( = ?auto_1028061 ?auto_1028069 ) ) ( not ( = ?auto_1028061 ?auto_1028070 ) ) ( not ( = ?auto_1028061 ?auto_1028071 ) ) ( not ( = ?auto_1028061 ?auto_1028072 ) ) ( not ( = ?auto_1028063 ?auto_1028064 ) ) ( not ( = ?auto_1028063 ?auto_1028065 ) ) ( not ( = ?auto_1028063 ?auto_1028066 ) ) ( not ( = ?auto_1028063 ?auto_1028067 ) ) ( not ( = ?auto_1028063 ?auto_1028068 ) ) ( not ( = ?auto_1028063 ?auto_1028069 ) ) ( not ( = ?auto_1028063 ?auto_1028070 ) ) ( not ( = ?auto_1028063 ?auto_1028071 ) ) ( not ( = ?auto_1028063 ?auto_1028072 ) ) ( not ( = ?auto_1028064 ?auto_1028065 ) ) ( not ( = ?auto_1028064 ?auto_1028066 ) ) ( not ( = ?auto_1028064 ?auto_1028067 ) ) ( not ( = ?auto_1028064 ?auto_1028068 ) ) ( not ( = ?auto_1028064 ?auto_1028069 ) ) ( not ( = ?auto_1028064 ?auto_1028070 ) ) ( not ( = ?auto_1028064 ?auto_1028071 ) ) ( not ( = ?auto_1028064 ?auto_1028072 ) ) ( not ( = ?auto_1028065 ?auto_1028066 ) ) ( not ( = ?auto_1028065 ?auto_1028067 ) ) ( not ( = ?auto_1028065 ?auto_1028068 ) ) ( not ( = ?auto_1028065 ?auto_1028069 ) ) ( not ( = ?auto_1028065 ?auto_1028070 ) ) ( not ( = ?auto_1028065 ?auto_1028071 ) ) ( not ( = ?auto_1028065 ?auto_1028072 ) ) ( not ( = ?auto_1028066 ?auto_1028067 ) ) ( not ( = ?auto_1028066 ?auto_1028068 ) ) ( not ( = ?auto_1028066 ?auto_1028069 ) ) ( not ( = ?auto_1028066 ?auto_1028070 ) ) ( not ( = ?auto_1028066 ?auto_1028071 ) ) ( not ( = ?auto_1028066 ?auto_1028072 ) ) ( not ( = ?auto_1028067 ?auto_1028068 ) ) ( not ( = ?auto_1028067 ?auto_1028069 ) ) ( not ( = ?auto_1028067 ?auto_1028070 ) ) ( not ( = ?auto_1028067 ?auto_1028071 ) ) ( not ( = ?auto_1028067 ?auto_1028072 ) ) ( not ( = ?auto_1028068 ?auto_1028069 ) ) ( not ( = ?auto_1028068 ?auto_1028070 ) ) ( not ( = ?auto_1028068 ?auto_1028071 ) ) ( not ( = ?auto_1028068 ?auto_1028072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028069 ?auto_1028070 ?auto_1028071 )
      ( MAKE-13CRATE-VERIFY ?auto_1028058 ?auto_1028059 ?auto_1028060 ?auto_1028062 ?auto_1028061 ?auto_1028063 ?auto_1028064 ?auto_1028065 ?auto_1028066 ?auto_1028067 ?auto_1028068 ?auto_1028069 ?auto_1028070 ?auto_1028071 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028241 - SURFACE
      ?auto_1028242 - SURFACE
      ?auto_1028243 - SURFACE
      ?auto_1028245 - SURFACE
      ?auto_1028244 - SURFACE
      ?auto_1028246 - SURFACE
      ?auto_1028247 - SURFACE
      ?auto_1028248 - SURFACE
      ?auto_1028249 - SURFACE
      ?auto_1028250 - SURFACE
      ?auto_1028251 - SURFACE
      ?auto_1028252 - SURFACE
      ?auto_1028253 - SURFACE
      ?auto_1028254 - SURFACE
    )
    :vars
    (
      ?auto_1028258 - HOIST
      ?auto_1028259 - PLACE
      ?auto_1028260 - PLACE
      ?auto_1028257 - HOIST
      ?auto_1028256 - SURFACE
      ?auto_1028255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028258 ?auto_1028259 ) ( IS-CRATE ?auto_1028254 ) ( not ( = ?auto_1028253 ?auto_1028254 ) ) ( not ( = ?auto_1028252 ?auto_1028253 ) ) ( not ( = ?auto_1028252 ?auto_1028254 ) ) ( not ( = ?auto_1028260 ?auto_1028259 ) ) ( HOIST-AT ?auto_1028257 ?auto_1028260 ) ( not ( = ?auto_1028258 ?auto_1028257 ) ) ( AVAILABLE ?auto_1028257 ) ( SURFACE-AT ?auto_1028254 ?auto_1028260 ) ( ON ?auto_1028254 ?auto_1028256 ) ( CLEAR ?auto_1028254 ) ( not ( = ?auto_1028253 ?auto_1028256 ) ) ( not ( = ?auto_1028254 ?auto_1028256 ) ) ( not ( = ?auto_1028252 ?auto_1028256 ) ) ( TRUCK-AT ?auto_1028255 ?auto_1028259 ) ( SURFACE-AT ?auto_1028252 ?auto_1028259 ) ( CLEAR ?auto_1028252 ) ( LIFTING ?auto_1028258 ?auto_1028253 ) ( IS-CRATE ?auto_1028253 ) ( ON ?auto_1028242 ?auto_1028241 ) ( ON ?auto_1028243 ?auto_1028242 ) ( ON ?auto_1028245 ?auto_1028243 ) ( ON ?auto_1028244 ?auto_1028245 ) ( ON ?auto_1028246 ?auto_1028244 ) ( ON ?auto_1028247 ?auto_1028246 ) ( ON ?auto_1028248 ?auto_1028247 ) ( ON ?auto_1028249 ?auto_1028248 ) ( ON ?auto_1028250 ?auto_1028249 ) ( ON ?auto_1028251 ?auto_1028250 ) ( ON ?auto_1028252 ?auto_1028251 ) ( not ( = ?auto_1028241 ?auto_1028242 ) ) ( not ( = ?auto_1028241 ?auto_1028243 ) ) ( not ( = ?auto_1028241 ?auto_1028245 ) ) ( not ( = ?auto_1028241 ?auto_1028244 ) ) ( not ( = ?auto_1028241 ?auto_1028246 ) ) ( not ( = ?auto_1028241 ?auto_1028247 ) ) ( not ( = ?auto_1028241 ?auto_1028248 ) ) ( not ( = ?auto_1028241 ?auto_1028249 ) ) ( not ( = ?auto_1028241 ?auto_1028250 ) ) ( not ( = ?auto_1028241 ?auto_1028251 ) ) ( not ( = ?auto_1028241 ?auto_1028252 ) ) ( not ( = ?auto_1028241 ?auto_1028253 ) ) ( not ( = ?auto_1028241 ?auto_1028254 ) ) ( not ( = ?auto_1028241 ?auto_1028256 ) ) ( not ( = ?auto_1028242 ?auto_1028243 ) ) ( not ( = ?auto_1028242 ?auto_1028245 ) ) ( not ( = ?auto_1028242 ?auto_1028244 ) ) ( not ( = ?auto_1028242 ?auto_1028246 ) ) ( not ( = ?auto_1028242 ?auto_1028247 ) ) ( not ( = ?auto_1028242 ?auto_1028248 ) ) ( not ( = ?auto_1028242 ?auto_1028249 ) ) ( not ( = ?auto_1028242 ?auto_1028250 ) ) ( not ( = ?auto_1028242 ?auto_1028251 ) ) ( not ( = ?auto_1028242 ?auto_1028252 ) ) ( not ( = ?auto_1028242 ?auto_1028253 ) ) ( not ( = ?auto_1028242 ?auto_1028254 ) ) ( not ( = ?auto_1028242 ?auto_1028256 ) ) ( not ( = ?auto_1028243 ?auto_1028245 ) ) ( not ( = ?auto_1028243 ?auto_1028244 ) ) ( not ( = ?auto_1028243 ?auto_1028246 ) ) ( not ( = ?auto_1028243 ?auto_1028247 ) ) ( not ( = ?auto_1028243 ?auto_1028248 ) ) ( not ( = ?auto_1028243 ?auto_1028249 ) ) ( not ( = ?auto_1028243 ?auto_1028250 ) ) ( not ( = ?auto_1028243 ?auto_1028251 ) ) ( not ( = ?auto_1028243 ?auto_1028252 ) ) ( not ( = ?auto_1028243 ?auto_1028253 ) ) ( not ( = ?auto_1028243 ?auto_1028254 ) ) ( not ( = ?auto_1028243 ?auto_1028256 ) ) ( not ( = ?auto_1028245 ?auto_1028244 ) ) ( not ( = ?auto_1028245 ?auto_1028246 ) ) ( not ( = ?auto_1028245 ?auto_1028247 ) ) ( not ( = ?auto_1028245 ?auto_1028248 ) ) ( not ( = ?auto_1028245 ?auto_1028249 ) ) ( not ( = ?auto_1028245 ?auto_1028250 ) ) ( not ( = ?auto_1028245 ?auto_1028251 ) ) ( not ( = ?auto_1028245 ?auto_1028252 ) ) ( not ( = ?auto_1028245 ?auto_1028253 ) ) ( not ( = ?auto_1028245 ?auto_1028254 ) ) ( not ( = ?auto_1028245 ?auto_1028256 ) ) ( not ( = ?auto_1028244 ?auto_1028246 ) ) ( not ( = ?auto_1028244 ?auto_1028247 ) ) ( not ( = ?auto_1028244 ?auto_1028248 ) ) ( not ( = ?auto_1028244 ?auto_1028249 ) ) ( not ( = ?auto_1028244 ?auto_1028250 ) ) ( not ( = ?auto_1028244 ?auto_1028251 ) ) ( not ( = ?auto_1028244 ?auto_1028252 ) ) ( not ( = ?auto_1028244 ?auto_1028253 ) ) ( not ( = ?auto_1028244 ?auto_1028254 ) ) ( not ( = ?auto_1028244 ?auto_1028256 ) ) ( not ( = ?auto_1028246 ?auto_1028247 ) ) ( not ( = ?auto_1028246 ?auto_1028248 ) ) ( not ( = ?auto_1028246 ?auto_1028249 ) ) ( not ( = ?auto_1028246 ?auto_1028250 ) ) ( not ( = ?auto_1028246 ?auto_1028251 ) ) ( not ( = ?auto_1028246 ?auto_1028252 ) ) ( not ( = ?auto_1028246 ?auto_1028253 ) ) ( not ( = ?auto_1028246 ?auto_1028254 ) ) ( not ( = ?auto_1028246 ?auto_1028256 ) ) ( not ( = ?auto_1028247 ?auto_1028248 ) ) ( not ( = ?auto_1028247 ?auto_1028249 ) ) ( not ( = ?auto_1028247 ?auto_1028250 ) ) ( not ( = ?auto_1028247 ?auto_1028251 ) ) ( not ( = ?auto_1028247 ?auto_1028252 ) ) ( not ( = ?auto_1028247 ?auto_1028253 ) ) ( not ( = ?auto_1028247 ?auto_1028254 ) ) ( not ( = ?auto_1028247 ?auto_1028256 ) ) ( not ( = ?auto_1028248 ?auto_1028249 ) ) ( not ( = ?auto_1028248 ?auto_1028250 ) ) ( not ( = ?auto_1028248 ?auto_1028251 ) ) ( not ( = ?auto_1028248 ?auto_1028252 ) ) ( not ( = ?auto_1028248 ?auto_1028253 ) ) ( not ( = ?auto_1028248 ?auto_1028254 ) ) ( not ( = ?auto_1028248 ?auto_1028256 ) ) ( not ( = ?auto_1028249 ?auto_1028250 ) ) ( not ( = ?auto_1028249 ?auto_1028251 ) ) ( not ( = ?auto_1028249 ?auto_1028252 ) ) ( not ( = ?auto_1028249 ?auto_1028253 ) ) ( not ( = ?auto_1028249 ?auto_1028254 ) ) ( not ( = ?auto_1028249 ?auto_1028256 ) ) ( not ( = ?auto_1028250 ?auto_1028251 ) ) ( not ( = ?auto_1028250 ?auto_1028252 ) ) ( not ( = ?auto_1028250 ?auto_1028253 ) ) ( not ( = ?auto_1028250 ?auto_1028254 ) ) ( not ( = ?auto_1028250 ?auto_1028256 ) ) ( not ( = ?auto_1028251 ?auto_1028252 ) ) ( not ( = ?auto_1028251 ?auto_1028253 ) ) ( not ( = ?auto_1028251 ?auto_1028254 ) ) ( not ( = ?auto_1028251 ?auto_1028256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028252 ?auto_1028253 ?auto_1028254 )
      ( MAKE-13CRATE-VERIFY ?auto_1028241 ?auto_1028242 ?auto_1028243 ?auto_1028245 ?auto_1028244 ?auto_1028246 ?auto_1028247 ?auto_1028248 ?auto_1028249 ?auto_1028250 ?auto_1028251 ?auto_1028252 ?auto_1028253 ?auto_1028254 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1028424 - SURFACE
      ?auto_1028425 - SURFACE
      ?auto_1028426 - SURFACE
      ?auto_1028428 - SURFACE
      ?auto_1028427 - SURFACE
      ?auto_1028429 - SURFACE
      ?auto_1028430 - SURFACE
      ?auto_1028431 - SURFACE
      ?auto_1028432 - SURFACE
      ?auto_1028433 - SURFACE
      ?auto_1028434 - SURFACE
      ?auto_1028435 - SURFACE
      ?auto_1028436 - SURFACE
      ?auto_1028437 - SURFACE
    )
    :vars
    (
      ?auto_1028438 - HOIST
      ?auto_1028439 - PLACE
      ?auto_1028441 - PLACE
      ?auto_1028440 - HOIST
      ?auto_1028443 - SURFACE
      ?auto_1028442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028438 ?auto_1028439 ) ( IS-CRATE ?auto_1028437 ) ( not ( = ?auto_1028436 ?auto_1028437 ) ) ( not ( = ?auto_1028435 ?auto_1028436 ) ) ( not ( = ?auto_1028435 ?auto_1028437 ) ) ( not ( = ?auto_1028441 ?auto_1028439 ) ) ( HOIST-AT ?auto_1028440 ?auto_1028441 ) ( not ( = ?auto_1028438 ?auto_1028440 ) ) ( AVAILABLE ?auto_1028440 ) ( SURFACE-AT ?auto_1028437 ?auto_1028441 ) ( ON ?auto_1028437 ?auto_1028443 ) ( CLEAR ?auto_1028437 ) ( not ( = ?auto_1028436 ?auto_1028443 ) ) ( not ( = ?auto_1028437 ?auto_1028443 ) ) ( not ( = ?auto_1028435 ?auto_1028443 ) ) ( TRUCK-AT ?auto_1028442 ?auto_1028439 ) ( SURFACE-AT ?auto_1028435 ?auto_1028439 ) ( CLEAR ?auto_1028435 ) ( IS-CRATE ?auto_1028436 ) ( AVAILABLE ?auto_1028438 ) ( IN ?auto_1028436 ?auto_1028442 ) ( ON ?auto_1028425 ?auto_1028424 ) ( ON ?auto_1028426 ?auto_1028425 ) ( ON ?auto_1028428 ?auto_1028426 ) ( ON ?auto_1028427 ?auto_1028428 ) ( ON ?auto_1028429 ?auto_1028427 ) ( ON ?auto_1028430 ?auto_1028429 ) ( ON ?auto_1028431 ?auto_1028430 ) ( ON ?auto_1028432 ?auto_1028431 ) ( ON ?auto_1028433 ?auto_1028432 ) ( ON ?auto_1028434 ?auto_1028433 ) ( ON ?auto_1028435 ?auto_1028434 ) ( not ( = ?auto_1028424 ?auto_1028425 ) ) ( not ( = ?auto_1028424 ?auto_1028426 ) ) ( not ( = ?auto_1028424 ?auto_1028428 ) ) ( not ( = ?auto_1028424 ?auto_1028427 ) ) ( not ( = ?auto_1028424 ?auto_1028429 ) ) ( not ( = ?auto_1028424 ?auto_1028430 ) ) ( not ( = ?auto_1028424 ?auto_1028431 ) ) ( not ( = ?auto_1028424 ?auto_1028432 ) ) ( not ( = ?auto_1028424 ?auto_1028433 ) ) ( not ( = ?auto_1028424 ?auto_1028434 ) ) ( not ( = ?auto_1028424 ?auto_1028435 ) ) ( not ( = ?auto_1028424 ?auto_1028436 ) ) ( not ( = ?auto_1028424 ?auto_1028437 ) ) ( not ( = ?auto_1028424 ?auto_1028443 ) ) ( not ( = ?auto_1028425 ?auto_1028426 ) ) ( not ( = ?auto_1028425 ?auto_1028428 ) ) ( not ( = ?auto_1028425 ?auto_1028427 ) ) ( not ( = ?auto_1028425 ?auto_1028429 ) ) ( not ( = ?auto_1028425 ?auto_1028430 ) ) ( not ( = ?auto_1028425 ?auto_1028431 ) ) ( not ( = ?auto_1028425 ?auto_1028432 ) ) ( not ( = ?auto_1028425 ?auto_1028433 ) ) ( not ( = ?auto_1028425 ?auto_1028434 ) ) ( not ( = ?auto_1028425 ?auto_1028435 ) ) ( not ( = ?auto_1028425 ?auto_1028436 ) ) ( not ( = ?auto_1028425 ?auto_1028437 ) ) ( not ( = ?auto_1028425 ?auto_1028443 ) ) ( not ( = ?auto_1028426 ?auto_1028428 ) ) ( not ( = ?auto_1028426 ?auto_1028427 ) ) ( not ( = ?auto_1028426 ?auto_1028429 ) ) ( not ( = ?auto_1028426 ?auto_1028430 ) ) ( not ( = ?auto_1028426 ?auto_1028431 ) ) ( not ( = ?auto_1028426 ?auto_1028432 ) ) ( not ( = ?auto_1028426 ?auto_1028433 ) ) ( not ( = ?auto_1028426 ?auto_1028434 ) ) ( not ( = ?auto_1028426 ?auto_1028435 ) ) ( not ( = ?auto_1028426 ?auto_1028436 ) ) ( not ( = ?auto_1028426 ?auto_1028437 ) ) ( not ( = ?auto_1028426 ?auto_1028443 ) ) ( not ( = ?auto_1028428 ?auto_1028427 ) ) ( not ( = ?auto_1028428 ?auto_1028429 ) ) ( not ( = ?auto_1028428 ?auto_1028430 ) ) ( not ( = ?auto_1028428 ?auto_1028431 ) ) ( not ( = ?auto_1028428 ?auto_1028432 ) ) ( not ( = ?auto_1028428 ?auto_1028433 ) ) ( not ( = ?auto_1028428 ?auto_1028434 ) ) ( not ( = ?auto_1028428 ?auto_1028435 ) ) ( not ( = ?auto_1028428 ?auto_1028436 ) ) ( not ( = ?auto_1028428 ?auto_1028437 ) ) ( not ( = ?auto_1028428 ?auto_1028443 ) ) ( not ( = ?auto_1028427 ?auto_1028429 ) ) ( not ( = ?auto_1028427 ?auto_1028430 ) ) ( not ( = ?auto_1028427 ?auto_1028431 ) ) ( not ( = ?auto_1028427 ?auto_1028432 ) ) ( not ( = ?auto_1028427 ?auto_1028433 ) ) ( not ( = ?auto_1028427 ?auto_1028434 ) ) ( not ( = ?auto_1028427 ?auto_1028435 ) ) ( not ( = ?auto_1028427 ?auto_1028436 ) ) ( not ( = ?auto_1028427 ?auto_1028437 ) ) ( not ( = ?auto_1028427 ?auto_1028443 ) ) ( not ( = ?auto_1028429 ?auto_1028430 ) ) ( not ( = ?auto_1028429 ?auto_1028431 ) ) ( not ( = ?auto_1028429 ?auto_1028432 ) ) ( not ( = ?auto_1028429 ?auto_1028433 ) ) ( not ( = ?auto_1028429 ?auto_1028434 ) ) ( not ( = ?auto_1028429 ?auto_1028435 ) ) ( not ( = ?auto_1028429 ?auto_1028436 ) ) ( not ( = ?auto_1028429 ?auto_1028437 ) ) ( not ( = ?auto_1028429 ?auto_1028443 ) ) ( not ( = ?auto_1028430 ?auto_1028431 ) ) ( not ( = ?auto_1028430 ?auto_1028432 ) ) ( not ( = ?auto_1028430 ?auto_1028433 ) ) ( not ( = ?auto_1028430 ?auto_1028434 ) ) ( not ( = ?auto_1028430 ?auto_1028435 ) ) ( not ( = ?auto_1028430 ?auto_1028436 ) ) ( not ( = ?auto_1028430 ?auto_1028437 ) ) ( not ( = ?auto_1028430 ?auto_1028443 ) ) ( not ( = ?auto_1028431 ?auto_1028432 ) ) ( not ( = ?auto_1028431 ?auto_1028433 ) ) ( not ( = ?auto_1028431 ?auto_1028434 ) ) ( not ( = ?auto_1028431 ?auto_1028435 ) ) ( not ( = ?auto_1028431 ?auto_1028436 ) ) ( not ( = ?auto_1028431 ?auto_1028437 ) ) ( not ( = ?auto_1028431 ?auto_1028443 ) ) ( not ( = ?auto_1028432 ?auto_1028433 ) ) ( not ( = ?auto_1028432 ?auto_1028434 ) ) ( not ( = ?auto_1028432 ?auto_1028435 ) ) ( not ( = ?auto_1028432 ?auto_1028436 ) ) ( not ( = ?auto_1028432 ?auto_1028437 ) ) ( not ( = ?auto_1028432 ?auto_1028443 ) ) ( not ( = ?auto_1028433 ?auto_1028434 ) ) ( not ( = ?auto_1028433 ?auto_1028435 ) ) ( not ( = ?auto_1028433 ?auto_1028436 ) ) ( not ( = ?auto_1028433 ?auto_1028437 ) ) ( not ( = ?auto_1028433 ?auto_1028443 ) ) ( not ( = ?auto_1028434 ?auto_1028435 ) ) ( not ( = ?auto_1028434 ?auto_1028436 ) ) ( not ( = ?auto_1028434 ?auto_1028437 ) ) ( not ( = ?auto_1028434 ?auto_1028443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1028435 ?auto_1028436 ?auto_1028437 )
      ( MAKE-13CRATE-VERIFY ?auto_1028424 ?auto_1028425 ?auto_1028426 ?auto_1028428 ?auto_1028427 ?auto_1028429 ?auto_1028430 ?auto_1028431 ?auto_1028432 ?auto_1028433 ?auto_1028434 ?auto_1028435 ?auto_1028436 ?auto_1028437 ) )
  )

)

