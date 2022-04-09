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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554515 - SURFACE
      ?auto_554516 - SURFACE
    )
    :vars
    (
      ?auto_554517 - HOIST
      ?auto_554518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554517 ?auto_554518 ) ( SURFACE-AT ?auto_554515 ?auto_554518 ) ( CLEAR ?auto_554515 ) ( LIFTING ?auto_554517 ?auto_554516 ) ( IS-CRATE ?auto_554516 ) ( not ( = ?auto_554515 ?auto_554516 ) ) )
    :subtasks
    ( ( !DROP ?auto_554517 ?auto_554516 ?auto_554515 ?auto_554518 )
      ( MAKE-1CRATE-VERIFY ?auto_554515 ?auto_554516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554519 - SURFACE
      ?auto_554520 - SURFACE
    )
    :vars
    (
      ?auto_554522 - HOIST
      ?auto_554521 - PLACE
      ?auto_554523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554522 ?auto_554521 ) ( SURFACE-AT ?auto_554519 ?auto_554521 ) ( CLEAR ?auto_554519 ) ( IS-CRATE ?auto_554520 ) ( not ( = ?auto_554519 ?auto_554520 ) ) ( TRUCK-AT ?auto_554523 ?auto_554521 ) ( AVAILABLE ?auto_554522 ) ( IN ?auto_554520 ?auto_554523 ) )
    :subtasks
    ( ( !UNLOAD ?auto_554522 ?auto_554520 ?auto_554523 ?auto_554521 )
      ( MAKE-1CRATE ?auto_554519 ?auto_554520 )
      ( MAKE-1CRATE-VERIFY ?auto_554519 ?auto_554520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554524 - SURFACE
      ?auto_554525 - SURFACE
    )
    :vars
    (
      ?auto_554527 - HOIST
      ?auto_554526 - PLACE
      ?auto_554528 - TRUCK
      ?auto_554529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554527 ?auto_554526 ) ( SURFACE-AT ?auto_554524 ?auto_554526 ) ( CLEAR ?auto_554524 ) ( IS-CRATE ?auto_554525 ) ( not ( = ?auto_554524 ?auto_554525 ) ) ( AVAILABLE ?auto_554527 ) ( IN ?auto_554525 ?auto_554528 ) ( TRUCK-AT ?auto_554528 ?auto_554529 ) ( not ( = ?auto_554529 ?auto_554526 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_554528 ?auto_554529 ?auto_554526 )
      ( MAKE-1CRATE ?auto_554524 ?auto_554525 )
      ( MAKE-1CRATE-VERIFY ?auto_554524 ?auto_554525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554530 - SURFACE
      ?auto_554531 - SURFACE
    )
    :vars
    (
      ?auto_554532 - HOIST
      ?auto_554534 - PLACE
      ?auto_554535 - TRUCK
      ?auto_554533 - PLACE
      ?auto_554536 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_554532 ?auto_554534 ) ( SURFACE-AT ?auto_554530 ?auto_554534 ) ( CLEAR ?auto_554530 ) ( IS-CRATE ?auto_554531 ) ( not ( = ?auto_554530 ?auto_554531 ) ) ( AVAILABLE ?auto_554532 ) ( TRUCK-AT ?auto_554535 ?auto_554533 ) ( not ( = ?auto_554533 ?auto_554534 ) ) ( HOIST-AT ?auto_554536 ?auto_554533 ) ( LIFTING ?auto_554536 ?auto_554531 ) ( not ( = ?auto_554532 ?auto_554536 ) ) )
    :subtasks
    ( ( !LOAD ?auto_554536 ?auto_554531 ?auto_554535 ?auto_554533 )
      ( MAKE-1CRATE ?auto_554530 ?auto_554531 )
      ( MAKE-1CRATE-VERIFY ?auto_554530 ?auto_554531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554537 - SURFACE
      ?auto_554538 - SURFACE
    )
    :vars
    (
      ?auto_554542 - HOIST
      ?auto_554543 - PLACE
      ?auto_554541 - TRUCK
      ?auto_554539 - PLACE
      ?auto_554540 - HOIST
      ?auto_554544 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554542 ?auto_554543 ) ( SURFACE-AT ?auto_554537 ?auto_554543 ) ( CLEAR ?auto_554537 ) ( IS-CRATE ?auto_554538 ) ( not ( = ?auto_554537 ?auto_554538 ) ) ( AVAILABLE ?auto_554542 ) ( TRUCK-AT ?auto_554541 ?auto_554539 ) ( not ( = ?auto_554539 ?auto_554543 ) ) ( HOIST-AT ?auto_554540 ?auto_554539 ) ( not ( = ?auto_554542 ?auto_554540 ) ) ( AVAILABLE ?auto_554540 ) ( SURFACE-AT ?auto_554538 ?auto_554539 ) ( ON ?auto_554538 ?auto_554544 ) ( CLEAR ?auto_554538 ) ( not ( = ?auto_554537 ?auto_554544 ) ) ( not ( = ?auto_554538 ?auto_554544 ) ) )
    :subtasks
    ( ( !LIFT ?auto_554540 ?auto_554538 ?auto_554544 ?auto_554539 )
      ( MAKE-1CRATE ?auto_554537 ?auto_554538 )
      ( MAKE-1CRATE-VERIFY ?auto_554537 ?auto_554538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554545 - SURFACE
      ?auto_554546 - SURFACE
    )
    :vars
    (
      ?auto_554551 - HOIST
      ?auto_554548 - PLACE
      ?auto_554549 - PLACE
      ?auto_554552 - HOIST
      ?auto_554547 - SURFACE
      ?auto_554550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554551 ?auto_554548 ) ( SURFACE-AT ?auto_554545 ?auto_554548 ) ( CLEAR ?auto_554545 ) ( IS-CRATE ?auto_554546 ) ( not ( = ?auto_554545 ?auto_554546 ) ) ( AVAILABLE ?auto_554551 ) ( not ( = ?auto_554549 ?auto_554548 ) ) ( HOIST-AT ?auto_554552 ?auto_554549 ) ( not ( = ?auto_554551 ?auto_554552 ) ) ( AVAILABLE ?auto_554552 ) ( SURFACE-AT ?auto_554546 ?auto_554549 ) ( ON ?auto_554546 ?auto_554547 ) ( CLEAR ?auto_554546 ) ( not ( = ?auto_554545 ?auto_554547 ) ) ( not ( = ?auto_554546 ?auto_554547 ) ) ( TRUCK-AT ?auto_554550 ?auto_554548 ) )
    :subtasks
    ( ( !DRIVE ?auto_554550 ?auto_554548 ?auto_554549 )
      ( MAKE-1CRATE ?auto_554545 ?auto_554546 )
      ( MAKE-1CRATE-VERIFY ?auto_554545 ?auto_554546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554562 - SURFACE
      ?auto_554563 - SURFACE
      ?auto_554564 - SURFACE
    )
    :vars
    (
      ?auto_554565 - HOIST
      ?auto_554566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554565 ?auto_554566 ) ( SURFACE-AT ?auto_554563 ?auto_554566 ) ( CLEAR ?auto_554563 ) ( LIFTING ?auto_554565 ?auto_554564 ) ( IS-CRATE ?auto_554564 ) ( not ( = ?auto_554563 ?auto_554564 ) ) ( ON ?auto_554563 ?auto_554562 ) ( not ( = ?auto_554562 ?auto_554563 ) ) ( not ( = ?auto_554562 ?auto_554564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554563 ?auto_554564 )
      ( MAKE-2CRATE-VERIFY ?auto_554562 ?auto_554563 ?auto_554564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554572 - SURFACE
      ?auto_554573 - SURFACE
      ?auto_554574 - SURFACE
    )
    :vars
    (
      ?auto_554576 - HOIST
      ?auto_554575 - PLACE
      ?auto_554577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554576 ?auto_554575 ) ( SURFACE-AT ?auto_554573 ?auto_554575 ) ( CLEAR ?auto_554573 ) ( IS-CRATE ?auto_554574 ) ( not ( = ?auto_554573 ?auto_554574 ) ) ( TRUCK-AT ?auto_554577 ?auto_554575 ) ( AVAILABLE ?auto_554576 ) ( IN ?auto_554574 ?auto_554577 ) ( ON ?auto_554573 ?auto_554572 ) ( not ( = ?auto_554572 ?auto_554573 ) ) ( not ( = ?auto_554572 ?auto_554574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554573 ?auto_554574 )
      ( MAKE-2CRATE-VERIFY ?auto_554572 ?auto_554573 ?auto_554574 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554578 - SURFACE
      ?auto_554579 - SURFACE
    )
    :vars
    (
      ?auto_554582 - HOIST
      ?auto_554581 - PLACE
      ?auto_554583 - TRUCK
      ?auto_554580 - SURFACE
      ?auto_554584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554582 ?auto_554581 ) ( SURFACE-AT ?auto_554578 ?auto_554581 ) ( CLEAR ?auto_554578 ) ( IS-CRATE ?auto_554579 ) ( not ( = ?auto_554578 ?auto_554579 ) ) ( AVAILABLE ?auto_554582 ) ( IN ?auto_554579 ?auto_554583 ) ( ON ?auto_554578 ?auto_554580 ) ( not ( = ?auto_554580 ?auto_554578 ) ) ( not ( = ?auto_554580 ?auto_554579 ) ) ( TRUCK-AT ?auto_554583 ?auto_554584 ) ( not ( = ?auto_554584 ?auto_554581 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_554583 ?auto_554584 ?auto_554581 )
      ( MAKE-2CRATE ?auto_554580 ?auto_554578 ?auto_554579 )
      ( MAKE-1CRATE-VERIFY ?auto_554578 ?auto_554579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554585 - SURFACE
      ?auto_554586 - SURFACE
      ?auto_554587 - SURFACE
    )
    :vars
    (
      ?auto_554591 - HOIST
      ?auto_554590 - PLACE
      ?auto_554589 - TRUCK
      ?auto_554588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554591 ?auto_554590 ) ( SURFACE-AT ?auto_554586 ?auto_554590 ) ( CLEAR ?auto_554586 ) ( IS-CRATE ?auto_554587 ) ( not ( = ?auto_554586 ?auto_554587 ) ) ( AVAILABLE ?auto_554591 ) ( IN ?auto_554587 ?auto_554589 ) ( ON ?auto_554586 ?auto_554585 ) ( not ( = ?auto_554585 ?auto_554586 ) ) ( not ( = ?auto_554585 ?auto_554587 ) ) ( TRUCK-AT ?auto_554589 ?auto_554588 ) ( not ( = ?auto_554588 ?auto_554590 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554586 ?auto_554587 )
      ( MAKE-2CRATE-VERIFY ?auto_554585 ?auto_554586 ?auto_554587 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554592 - SURFACE
      ?auto_554593 - SURFACE
    )
    :vars
    (
      ?auto_554598 - HOIST
      ?auto_554597 - PLACE
      ?auto_554596 - SURFACE
      ?auto_554594 - TRUCK
      ?auto_554595 - PLACE
      ?auto_554599 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_554598 ?auto_554597 ) ( SURFACE-AT ?auto_554592 ?auto_554597 ) ( CLEAR ?auto_554592 ) ( IS-CRATE ?auto_554593 ) ( not ( = ?auto_554592 ?auto_554593 ) ) ( AVAILABLE ?auto_554598 ) ( ON ?auto_554592 ?auto_554596 ) ( not ( = ?auto_554596 ?auto_554592 ) ) ( not ( = ?auto_554596 ?auto_554593 ) ) ( TRUCK-AT ?auto_554594 ?auto_554595 ) ( not ( = ?auto_554595 ?auto_554597 ) ) ( HOIST-AT ?auto_554599 ?auto_554595 ) ( LIFTING ?auto_554599 ?auto_554593 ) ( not ( = ?auto_554598 ?auto_554599 ) ) )
    :subtasks
    ( ( !LOAD ?auto_554599 ?auto_554593 ?auto_554594 ?auto_554595 )
      ( MAKE-2CRATE ?auto_554596 ?auto_554592 ?auto_554593 )
      ( MAKE-1CRATE-VERIFY ?auto_554592 ?auto_554593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554600 - SURFACE
      ?auto_554601 - SURFACE
      ?auto_554602 - SURFACE
    )
    :vars
    (
      ?auto_554607 - HOIST
      ?auto_554606 - PLACE
      ?auto_554605 - TRUCK
      ?auto_554603 - PLACE
      ?auto_554604 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_554607 ?auto_554606 ) ( SURFACE-AT ?auto_554601 ?auto_554606 ) ( CLEAR ?auto_554601 ) ( IS-CRATE ?auto_554602 ) ( not ( = ?auto_554601 ?auto_554602 ) ) ( AVAILABLE ?auto_554607 ) ( ON ?auto_554601 ?auto_554600 ) ( not ( = ?auto_554600 ?auto_554601 ) ) ( not ( = ?auto_554600 ?auto_554602 ) ) ( TRUCK-AT ?auto_554605 ?auto_554603 ) ( not ( = ?auto_554603 ?auto_554606 ) ) ( HOIST-AT ?auto_554604 ?auto_554603 ) ( LIFTING ?auto_554604 ?auto_554602 ) ( not ( = ?auto_554607 ?auto_554604 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554601 ?auto_554602 )
      ( MAKE-2CRATE-VERIFY ?auto_554600 ?auto_554601 ?auto_554602 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554608 - SURFACE
      ?auto_554609 - SURFACE
    )
    :vars
    (
      ?auto_554615 - HOIST
      ?auto_554612 - PLACE
      ?auto_554611 - SURFACE
      ?auto_554613 - TRUCK
      ?auto_554610 - PLACE
      ?auto_554614 - HOIST
      ?auto_554616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554615 ?auto_554612 ) ( SURFACE-AT ?auto_554608 ?auto_554612 ) ( CLEAR ?auto_554608 ) ( IS-CRATE ?auto_554609 ) ( not ( = ?auto_554608 ?auto_554609 ) ) ( AVAILABLE ?auto_554615 ) ( ON ?auto_554608 ?auto_554611 ) ( not ( = ?auto_554611 ?auto_554608 ) ) ( not ( = ?auto_554611 ?auto_554609 ) ) ( TRUCK-AT ?auto_554613 ?auto_554610 ) ( not ( = ?auto_554610 ?auto_554612 ) ) ( HOIST-AT ?auto_554614 ?auto_554610 ) ( not ( = ?auto_554615 ?auto_554614 ) ) ( AVAILABLE ?auto_554614 ) ( SURFACE-AT ?auto_554609 ?auto_554610 ) ( ON ?auto_554609 ?auto_554616 ) ( CLEAR ?auto_554609 ) ( not ( = ?auto_554608 ?auto_554616 ) ) ( not ( = ?auto_554609 ?auto_554616 ) ) ( not ( = ?auto_554611 ?auto_554616 ) ) )
    :subtasks
    ( ( !LIFT ?auto_554614 ?auto_554609 ?auto_554616 ?auto_554610 )
      ( MAKE-2CRATE ?auto_554611 ?auto_554608 ?auto_554609 )
      ( MAKE-1CRATE-VERIFY ?auto_554608 ?auto_554609 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554617 - SURFACE
      ?auto_554618 - SURFACE
      ?auto_554619 - SURFACE
    )
    :vars
    (
      ?auto_554625 - HOIST
      ?auto_554622 - PLACE
      ?auto_554623 - TRUCK
      ?auto_554620 - PLACE
      ?auto_554624 - HOIST
      ?auto_554621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554625 ?auto_554622 ) ( SURFACE-AT ?auto_554618 ?auto_554622 ) ( CLEAR ?auto_554618 ) ( IS-CRATE ?auto_554619 ) ( not ( = ?auto_554618 ?auto_554619 ) ) ( AVAILABLE ?auto_554625 ) ( ON ?auto_554618 ?auto_554617 ) ( not ( = ?auto_554617 ?auto_554618 ) ) ( not ( = ?auto_554617 ?auto_554619 ) ) ( TRUCK-AT ?auto_554623 ?auto_554620 ) ( not ( = ?auto_554620 ?auto_554622 ) ) ( HOIST-AT ?auto_554624 ?auto_554620 ) ( not ( = ?auto_554625 ?auto_554624 ) ) ( AVAILABLE ?auto_554624 ) ( SURFACE-AT ?auto_554619 ?auto_554620 ) ( ON ?auto_554619 ?auto_554621 ) ( CLEAR ?auto_554619 ) ( not ( = ?auto_554618 ?auto_554621 ) ) ( not ( = ?auto_554619 ?auto_554621 ) ) ( not ( = ?auto_554617 ?auto_554621 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554618 ?auto_554619 )
      ( MAKE-2CRATE-VERIFY ?auto_554617 ?auto_554618 ?auto_554619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554626 - SURFACE
      ?auto_554627 - SURFACE
    )
    :vars
    (
      ?auto_554634 - HOIST
      ?auto_554633 - PLACE
      ?auto_554631 - SURFACE
      ?auto_554630 - PLACE
      ?auto_554629 - HOIST
      ?auto_554632 - SURFACE
      ?auto_554628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554634 ?auto_554633 ) ( SURFACE-AT ?auto_554626 ?auto_554633 ) ( CLEAR ?auto_554626 ) ( IS-CRATE ?auto_554627 ) ( not ( = ?auto_554626 ?auto_554627 ) ) ( AVAILABLE ?auto_554634 ) ( ON ?auto_554626 ?auto_554631 ) ( not ( = ?auto_554631 ?auto_554626 ) ) ( not ( = ?auto_554631 ?auto_554627 ) ) ( not ( = ?auto_554630 ?auto_554633 ) ) ( HOIST-AT ?auto_554629 ?auto_554630 ) ( not ( = ?auto_554634 ?auto_554629 ) ) ( AVAILABLE ?auto_554629 ) ( SURFACE-AT ?auto_554627 ?auto_554630 ) ( ON ?auto_554627 ?auto_554632 ) ( CLEAR ?auto_554627 ) ( not ( = ?auto_554626 ?auto_554632 ) ) ( not ( = ?auto_554627 ?auto_554632 ) ) ( not ( = ?auto_554631 ?auto_554632 ) ) ( TRUCK-AT ?auto_554628 ?auto_554633 ) )
    :subtasks
    ( ( !DRIVE ?auto_554628 ?auto_554633 ?auto_554630 )
      ( MAKE-2CRATE ?auto_554631 ?auto_554626 ?auto_554627 )
      ( MAKE-1CRATE-VERIFY ?auto_554626 ?auto_554627 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554635 - SURFACE
      ?auto_554636 - SURFACE
      ?auto_554637 - SURFACE
    )
    :vars
    (
      ?auto_554643 - HOIST
      ?auto_554639 - PLACE
      ?auto_554640 - PLACE
      ?auto_554638 - HOIST
      ?auto_554641 - SURFACE
      ?auto_554642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554643 ?auto_554639 ) ( SURFACE-AT ?auto_554636 ?auto_554639 ) ( CLEAR ?auto_554636 ) ( IS-CRATE ?auto_554637 ) ( not ( = ?auto_554636 ?auto_554637 ) ) ( AVAILABLE ?auto_554643 ) ( ON ?auto_554636 ?auto_554635 ) ( not ( = ?auto_554635 ?auto_554636 ) ) ( not ( = ?auto_554635 ?auto_554637 ) ) ( not ( = ?auto_554640 ?auto_554639 ) ) ( HOIST-AT ?auto_554638 ?auto_554640 ) ( not ( = ?auto_554643 ?auto_554638 ) ) ( AVAILABLE ?auto_554638 ) ( SURFACE-AT ?auto_554637 ?auto_554640 ) ( ON ?auto_554637 ?auto_554641 ) ( CLEAR ?auto_554637 ) ( not ( = ?auto_554636 ?auto_554641 ) ) ( not ( = ?auto_554637 ?auto_554641 ) ) ( not ( = ?auto_554635 ?auto_554641 ) ) ( TRUCK-AT ?auto_554642 ?auto_554639 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554636 ?auto_554637 )
      ( MAKE-2CRATE-VERIFY ?auto_554635 ?auto_554636 ?auto_554637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554644 - SURFACE
      ?auto_554645 - SURFACE
    )
    :vars
    (
      ?auto_554650 - HOIST
      ?auto_554648 - PLACE
      ?auto_554647 - SURFACE
      ?auto_554652 - PLACE
      ?auto_554651 - HOIST
      ?auto_554649 - SURFACE
      ?auto_554646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554650 ?auto_554648 ) ( IS-CRATE ?auto_554645 ) ( not ( = ?auto_554644 ?auto_554645 ) ) ( not ( = ?auto_554647 ?auto_554644 ) ) ( not ( = ?auto_554647 ?auto_554645 ) ) ( not ( = ?auto_554652 ?auto_554648 ) ) ( HOIST-AT ?auto_554651 ?auto_554652 ) ( not ( = ?auto_554650 ?auto_554651 ) ) ( AVAILABLE ?auto_554651 ) ( SURFACE-AT ?auto_554645 ?auto_554652 ) ( ON ?auto_554645 ?auto_554649 ) ( CLEAR ?auto_554645 ) ( not ( = ?auto_554644 ?auto_554649 ) ) ( not ( = ?auto_554645 ?auto_554649 ) ) ( not ( = ?auto_554647 ?auto_554649 ) ) ( TRUCK-AT ?auto_554646 ?auto_554648 ) ( SURFACE-AT ?auto_554647 ?auto_554648 ) ( CLEAR ?auto_554647 ) ( LIFTING ?auto_554650 ?auto_554644 ) ( IS-CRATE ?auto_554644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554647 ?auto_554644 )
      ( MAKE-2CRATE ?auto_554647 ?auto_554644 ?auto_554645 )
      ( MAKE-1CRATE-VERIFY ?auto_554644 ?auto_554645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554653 - SURFACE
      ?auto_554654 - SURFACE
      ?auto_554655 - SURFACE
    )
    :vars
    (
      ?auto_554656 - HOIST
      ?auto_554660 - PLACE
      ?auto_554661 - PLACE
      ?auto_554657 - HOIST
      ?auto_554658 - SURFACE
      ?auto_554659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554656 ?auto_554660 ) ( IS-CRATE ?auto_554655 ) ( not ( = ?auto_554654 ?auto_554655 ) ) ( not ( = ?auto_554653 ?auto_554654 ) ) ( not ( = ?auto_554653 ?auto_554655 ) ) ( not ( = ?auto_554661 ?auto_554660 ) ) ( HOIST-AT ?auto_554657 ?auto_554661 ) ( not ( = ?auto_554656 ?auto_554657 ) ) ( AVAILABLE ?auto_554657 ) ( SURFACE-AT ?auto_554655 ?auto_554661 ) ( ON ?auto_554655 ?auto_554658 ) ( CLEAR ?auto_554655 ) ( not ( = ?auto_554654 ?auto_554658 ) ) ( not ( = ?auto_554655 ?auto_554658 ) ) ( not ( = ?auto_554653 ?auto_554658 ) ) ( TRUCK-AT ?auto_554659 ?auto_554660 ) ( SURFACE-AT ?auto_554653 ?auto_554660 ) ( CLEAR ?auto_554653 ) ( LIFTING ?auto_554656 ?auto_554654 ) ( IS-CRATE ?auto_554654 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554654 ?auto_554655 )
      ( MAKE-2CRATE-VERIFY ?auto_554653 ?auto_554654 ?auto_554655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554662 - SURFACE
      ?auto_554663 - SURFACE
    )
    :vars
    (
      ?auto_554669 - HOIST
      ?auto_554667 - PLACE
      ?auto_554670 - SURFACE
      ?auto_554666 - PLACE
      ?auto_554664 - HOIST
      ?auto_554668 - SURFACE
      ?auto_554665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554669 ?auto_554667 ) ( IS-CRATE ?auto_554663 ) ( not ( = ?auto_554662 ?auto_554663 ) ) ( not ( = ?auto_554670 ?auto_554662 ) ) ( not ( = ?auto_554670 ?auto_554663 ) ) ( not ( = ?auto_554666 ?auto_554667 ) ) ( HOIST-AT ?auto_554664 ?auto_554666 ) ( not ( = ?auto_554669 ?auto_554664 ) ) ( AVAILABLE ?auto_554664 ) ( SURFACE-AT ?auto_554663 ?auto_554666 ) ( ON ?auto_554663 ?auto_554668 ) ( CLEAR ?auto_554663 ) ( not ( = ?auto_554662 ?auto_554668 ) ) ( not ( = ?auto_554663 ?auto_554668 ) ) ( not ( = ?auto_554670 ?auto_554668 ) ) ( TRUCK-AT ?auto_554665 ?auto_554667 ) ( SURFACE-AT ?auto_554670 ?auto_554667 ) ( CLEAR ?auto_554670 ) ( IS-CRATE ?auto_554662 ) ( AVAILABLE ?auto_554669 ) ( IN ?auto_554662 ?auto_554665 ) )
    :subtasks
    ( ( !UNLOAD ?auto_554669 ?auto_554662 ?auto_554665 ?auto_554667 )
      ( MAKE-2CRATE ?auto_554670 ?auto_554662 ?auto_554663 )
      ( MAKE-1CRATE-VERIFY ?auto_554662 ?auto_554663 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554671 - SURFACE
      ?auto_554672 - SURFACE
      ?auto_554673 - SURFACE
    )
    :vars
    (
      ?auto_554678 - HOIST
      ?auto_554674 - PLACE
      ?auto_554677 - PLACE
      ?auto_554676 - HOIST
      ?auto_554675 - SURFACE
      ?auto_554679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554678 ?auto_554674 ) ( IS-CRATE ?auto_554673 ) ( not ( = ?auto_554672 ?auto_554673 ) ) ( not ( = ?auto_554671 ?auto_554672 ) ) ( not ( = ?auto_554671 ?auto_554673 ) ) ( not ( = ?auto_554677 ?auto_554674 ) ) ( HOIST-AT ?auto_554676 ?auto_554677 ) ( not ( = ?auto_554678 ?auto_554676 ) ) ( AVAILABLE ?auto_554676 ) ( SURFACE-AT ?auto_554673 ?auto_554677 ) ( ON ?auto_554673 ?auto_554675 ) ( CLEAR ?auto_554673 ) ( not ( = ?auto_554672 ?auto_554675 ) ) ( not ( = ?auto_554673 ?auto_554675 ) ) ( not ( = ?auto_554671 ?auto_554675 ) ) ( TRUCK-AT ?auto_554679 ?auto_554674 ) ( SURFACE-AT ?auto_554671 ?auto_554674 ) ( CLEAR ?auto_554671 ) ( IS-CRATE ?auto_554672 ) ( AVAILABLE ?auto_554678 ) ( IN ?auto_554672 ?auto_554679 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554672 ?auto_554673 )
      ( MAKE-2CRATE-VERIFY ?auto_554671 ?auto_554672 ?auto_554673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554716 - SURFACE
      ?auto_554717 - SURFACE
    )
    :vars
    (
      ?auto_554720 - HOIST
      ?auto_554721 - PLACE
      ?auto_554724 - SURFACE
      ?auto_554723 - PLACE
      ?auto_554722 - HOIST
      ?auto_554719 - SURFACE
      ?auto_554718 - TRUCK
      ?auto_554725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554720 ?auto_554721 ) ( SURFACE-AT ?auto_554716 ?auto_554721 ) ( CLEAR ?auto_554716 ) ( IS-CRATE ?auto_554717 ) ( not ( = ?auto_554716 ?auto_554717 ) ) ( AVAILABLE ?auto_554720 ) ( ON ?auto_554716 ?auto_554724 ) ( not ( = ?auto_554724 ?auto_554716 ) ) ( not ( = ?auto_554724 ?auto_554717 ) ) ( not ( = ?auto_554723 ?auto_554721 ) ) ( HOIST-AT ?auto_554722 ?auto_554723 ) ( not ( = ?auto_554720 ?auto_554722 ) ) ( AVAILABLE ?auto_554722 ) ( SURFACE-AT ?auto_554717 ?auto_554723 ) ( ON ?auto_554717 ?auto_554719 ) ( CLEAR ?auto_554717 ) ( not ( = ?auto_554716 ?auto_554719 ) ) ( not ( = ?auto_554717 ?auto_554719 ) ) ( not ( = ?auto_554724 ?auto_554719 ) ) ( TRUCK-AT ?auto_554718 ?auto_554725 ) ( not ( = ?auto_554725 ?auto_554721 ) ) ( not ( = ?auto_554723 ?auto_554725 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_554718 ?auto_554725 ?auto_554721 )
      ( MAKE-1CRATE ?auto_554716 ?auto_554717 )
      ( MAKE-1CRATE-VERIFY ?auto_554716 ?auto_554717 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554755 - SURFACE
      ?auto_554756 - SURFACE
      ?auto_554757 - SURFACE
      ?auto_554758 - SURFACE
    )
    :vars
    (
      ?auto_554759 - HOIST
      ?auto_554760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554759 ?auto_554760 ) ( SURFACE-AT ?auto_554757 ?auto_554760 ) ( CLEAR ?auto_554757 ) ( LIFTING ?auto_554759 ?auto_554758 ) ( IS-CRATE ?auto_554758 ) ( not ( = ?auto_554757 ?auto_554758 ) ) ( ON ?auto_554756 ?auto_554755 ) ( ON ?auto_554757 ?auto_554756 ) ( not ( = ?auto_554755 ?auto_554756 ) ) ( not ( = ?auto_554755 ?auto_554757 ) ) ( not ( = ?auto_554755 ?auto_554758 ) ) ( not ( = ?auto_554756 ?auto_554757 ) ) ( not ( = ?auto_554756 ?auto_554758 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_554757 ?auto_554758 )
      ( MAKE-3CRATE-VERIFY ?auto_554755 ?auto_554756 ?auto_554757 ?auto_554758 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554772 - SURFACE
      ?auto_554773 - SURFACE
      ?auto_554774 - SURFACE
      ?auto_554775 - SURFACE
    )
    :vars
    (
      ?auto_554776 - HOIST
      ?auto_554778 - PLACE
      ?auto_554777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554776 ?auto_554778 ) ( SURFACE-AT ?auto_554774 ?auto_554778 ) ( CLEAR ?auto_554774 ) ( IS-CRATE ?auto_554775 ) ( not ( = ?auto_554774 ?auto_554775 ) ) ( TRUCK-AT ?auto_554777 ?auto_554778 ) ( AVAILABLE ?auto_554776 ) ( IN ?auto_554775 ?auto_554777 ) ( ON ?auto_554774 ?auto_554773 ) ( not ( = ?auto_554773 ?auto_554774 ) ) ( not ( = ?auto_554773 ?auto_554775 ) ) ( ON ?auto_554773 ?auto_554772 ) ( not ( = ?auto_554772 ?auto_554773 ) ) ( not ( = ?auto_554772 ?auto_554774 ) ) ( not ( = ?auto_554772 ?auto_554775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_554773 ?auto_554774 ?auto_554775 )
      ( MAKE-3CRATE-VERIFY ?auto_554772 ?auto_554773 ?auto_554774 ?auto_554775 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554793 - SURFACE
      ?auto_554794 - SURFACE
      ?auto_554795 - SURFACE
      ?auto_554796 - SURFACE
    )
    :vars
    (
      ?auto_554798 - HOIST
      ?auto_554799 - PLACE
      ?auto_554800 - TRUCK
      ?auto_554797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554798 ?auto_554799 ) ( SURFACE-AT ?auto_554795 ?auto_554799 ) ( CLEAR ?auto_554795 ) ( IS-CRATE ?auto_554796 ) ( not ( = ?auto_554795 ?auto_554796 ) ) ( AVAILABLE ?auto_554798 ) ( IN ?auto_554796 ?auto_554800 ) ( ON ?auto_554795 ?auto_554794 ) ( not ( = ?auto_554794 ?auto_554795 ) ) ( not ( = ?auto_554794 ?auto_554796 ) ) ( TRUCK-AT ?auto_554800 ?auto_554797 ) ( not ( = ?auto_554797 ?auto_554799 ) ) ( ON ?auto_554794 ?auto_554793 ) ( not ( = ?auto_554793 ?auto_554794 ) ) ( not ( = ?auto_554793 ?auto_554795 ) ) ( not ( = ?auto_554793 ?auto_554796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_554794 ?auto_554795 ?auto_554796 )
      ( MAKE-3CRATE-VERIFY ?auto_554793 ?auto_554794 ?auto_554795 ?auto_554796 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554817 - SURFACE
      ?auto_554818 - SURFACE
      ?auto_554819 - SURFACE
      ?auto_554820 - SURFACE
    )
    :vars
    (
      ?auto_554821 - HOIST
      ?auto_554823 - PLACE
      ?auto_554825 - TRUCK
      ?auto_554824 - PLACE
      ?auto_554822 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_554821 ?auto_554823 ) ( SURFACE-AT ?auto_554819 ?auto_554823 ) ( CLEAR ?auto_554819 ) ( IS-CRATE ?auto_554820 ) ( not ( = ?auto_554819 ?auto_554820 ) ) ( AVAILABLE ?auto_554821 ) ( ON ?auto_554819 ?auto_554818 ) ( not ( = ?auto_554818 ?auto_554819 ) ) ( not ( = ?auto_554818 ?auto_554820 ) ) ( TRUCK-AT ?auto_554825 ?auto_554824 ) ( not ( = ?auto_554824 ?auto_554823 ) ) ( HOIST-AT ?auto_554822 ?auto_554824 ) ( LIFTING ?auto_554822 ?auto_554820 ) ( not ( = ?auto_554821 ?auto_554822 ) ) ( ON ?auto_554818 ?auto_554817 ) ( not ( = ?auto_554817 ?auto_554818 ) ) ( not ( = ?auto_554817 ?auto_554819 ) ) ( not ( = ?auto_554817 ?auto_554820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_554818 ?auto_554819 ?auto_554820 )
      ( MAKE-3CRATE-VERIFY ?auto_554817 ?auto_554818 ?auto_554819 ?auto_554820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554844 - SURFACE
      ?auto_554845 - SURFACE
      ?auto_554846 - SURFACE
      ?auto_554847 - SURFACE
    )
    :vars
    (
      ?auto_554850 - HOIST
      ?auto_554853 - PLACE
      ?auto_554851 - TRUCK
      ?auto_554849 - PLACE
      ?auto_554848 - HOIST
      ?auto_554852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_554850 ?auto_554853 ) ( SURFACE-AT ?auto_554846 ?auto_554853 ) ( CLEAR ?auto_554846 ) ( IS-CRATE ?auto_554847 ) ( not ( = ?auto_554846 ?auto_554847 ) ) ( AVAILABLE ?auto_554850 ) ( ON ?auto_554846 ?auto_554845 ) ( not ( = ?auto_554845 ?auto_554846 ) ) ( not ( = ?auto_554845 ?auto_554847 ) ) ( TRUCK-AT ?auto_554851 ?auto_554849 ) ( not ( = ?auto_554849 ?auto_554853 ) ) ( HOIST-AT ?auto_554848 ?auto_554849 ) ( not ( = ?auto_554850 ?auto_554848 ) ) ( AVAILABLE ?auto_554848 ) ( SURFACE-AT ?auto_554847 ?auto_554849 ) ( ON ?auto_554847 ?auto_554852 ) ( CLEAR ?auto_554847 ) ( not ( = ?auto_554846 ?auto_554852 ) ) ( not ( = ?auto_554847 ?auto_554852 ) ) ( not ( = ?auto_554845 ?auto_554852 ) ) ( ON ?auto_554845 ?auto_554844 ) ( not ( = ?auto_554844 ?auto_554845 ) ) ( not ( = ?auto_554844 ?auto_554846 ) ) ( not ( = ?auto_554844 ?auto_554847 ) ) ( not ( = ?auto_554844 ?auto_554852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_554845 ?auto_554846 ?auto_554847 )
      ( MAKE-3CRATE-VERIFY ?auto_554844 ?auto_554845 ?auto_554846 ?auto_554847 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554872 - SURFACE
      ?auto_554873 - SURFACE
      ?auto_554874 - SURFACE
      ?auto_554875 - SURFACE
    )
    :vars
    (
      ?auto_554876 - HOIST
      ?auto_554877 - PLACE
      ?auto_554881 - PLACE
      ?auto_554880 - HOIST
      ?auto_554878 - SURFACE
      ?auto_554879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554876 ?auto_554877 ) ( SURFACE-AT ?auto_554874 ?auto_554877 ) ( CLEAR ?auto_554874 ) ( IS-CRATE ?auto_554875 ) ( not ( = ?auto_554874 ?auto_554875 ) ) ( AVAILABLE ?auto_554876 ) ( ON ?auto_554874 ?auto_554873 ) ( not ( = ?auto_554873 ?auto_554874 ) ) ( not ( = ?auto_554873 ?auto_554875 ) ) ( not ( = ?auto_554881 ?auto_554877 ) ) ( HOIST-AT ?auto_554880 ?auto_554881 ) ( not ( = ?auto_554876 ?auto_554880 ) ) ( AVAILABLE ?auto_554880 ) ( SURFACE-AT ?auto_554875 ?auto_554881 ) ( ON ?auto_554875 ?auto_554878 ) ( CLEAR ?auto_554875 ) ( not ( = ?auto_554874 ?auto_554878 ) ) ( not ( = ?auto_554875 ?auto_554878 ) ) ( not ( = ?auto_554873 ?auto_554878 ) ) ( TRUCK-AT ?auto_554879 ?auto_554877 ) ( ON ?auto_554873 ?auto_554872 ) ( not ( = ?auto_554872 ?auto_554873 ) ) ( not ( = ?auto_554872 ?auto_554874 ) ) ( not ( = ?auto_554872 ?auto_554875 ) ) ( not ( = ?auto_554872 ?auto_554878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_554873 ?auto_554874 ?auto_554875 )
      ( MAKE-3CRATE-VERIFY ?auto_554872 ?auto_554873 ?auto_554874 ?auto_554875 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554900 - SURFACE
      ?auto_554901 - SURFACE
      ?auto_554902 - SURFACE
      ?auto_554903 - SURFACE
    )
    :vars
    (
      ?auto_554907 - HOIST
      ?auto_554905 - PLACE
      ?auto_554904 - PLACE
      ?auto_554909 - HOIST
      ?auto_554906 - SURFACE
      ?auto_554908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554907 ?auto_554905 ) ( IS-CRATE ?auto_554903 ) ( not ( = ?auto_554902 ?auto_554903 ) ) ( not ( = ?auto_554901 ?auto_554902 ) ) ( not ( = ?auto_554901 ?auto_554903 ) ) ( not ( = ?auto_554904 ?auto_554905 ) ) ( HOIST-AT ?auto_554909 ?auto_554904 ) ( not ( = ?auto_554907 ?auto_554909 ) ) ( AVAILABLE ?auto_554909 ) ( SURFACE-AT ?auto_554903 ?auto_554904 ) ( ON ?auto_554903 ?auto_554906 ) ( CLEAR ?auto_554903 ) ( not ( = ?auto_554902 ?auto_554906 ) ) ( not ( = ?auto_554903 ?auto_554906 ) ) ( not ( = ?auto_554901 ?auto_554906 ) ) ( TRUCK-AT ?auto_554908 ?auto_554905 ) ( SURFACE-AT ?auto_554901 ?auto_554905 ) ( CLEAR ?auto_554901 ) ( LIFTING ?auto_554907 ?auto_554902 ) ( IS-CRATE ?auto_554902 ) ( ON ?auto_554901 ?auto_554900 ) ( not ( = ?auto_554900 ?auto_554901 ) ) ( not ( = ?auto_554900 ?auto_554902 ) ) ( not ( = ?auto_554900 ?auto_554903 ) ) ( not ( = ?auto_554900 ?auto_554906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_554901 ?auto_554902 ?auto_554903 )
      ( MAKE-3CRATE-VERIFY ?auto_554900 ?auto_554901 ?auto_554902 ?auto_554903 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_554928 - SURFACE
      ?auto_554929 - SURFACE
      ?auto_554930 - SURFACE
      ?auto_554931 - SURFACE
    )
    :vars
    (
      ?auto_554935 - HOIST
      ?auto_554932 - PLACE
      ?auto_554936 - PLACE
      ?auto_554934 - HOIST
      ?auto_554937 - SURFACE
      ?auto_554933 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_554935 ?auto_554932 ) ( IS-CRATE ?auto_554931 ) ( not ( = ?auto_554930 ?auto_554931 ) ) ( not ( = ?auto_554929 ?auto_554930 ) ) ( not ( = ?auto_554929 ?auto_554931 ) ) ( not ( = ?auto_554936 ?auto_554932 ) ) ( HOIST-AT ?auto_554934 ?auto_554936 ) ( not ( = ?auto_554935 ?auto_554934 ) ) ( AVAILABLE ?auto_554934 ) ( SURFACE-AT ?auto_554931 ?auto_554936 ) ( ON ?auto_554931 ?auto_554937 ) ( CLEAR ?auto_554931 ) ( not ( = ?auto_554930 ?auto_554937 ) ) ( not ( = ?auto_554931 ?auto_554937 ) ) ( not ( = ?auto_554929 ?auto_554937 ) ) ( TRUCK-AT ?auto_554933 ?auto_554932 ) ( SURFACE-AT ?auto_554929 ?auto_554932 ) ( CLEAR ?auto_554929 ) ( IS-CRATE ?auto_554930 ) ( AVAILABLE ?auto_554935 ) ( IN ?auto_554930 ?auto_554933 ) ( ON ?auto_554929 ?auto_554928 ) ( not ( = ?auto_554928 ?auto_554929 ) ) ( not ( = ?auto_554928 ?auto_554930 ) ) ( not ( = ?auto_554928 ?auto_554931 ) ) ( not ( = ?auto_554928 ?auto_554937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_554929 ?auto_554930 ?auto_554931 )
      ( MAKE-3CRATE-VERIFY ?auto_554928 ?auto_554929 ?auto_554930 ?auto_554931 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555219 - SURFACE
      ?auto_555220 - SURFACE
      ?auto_555221 - SURFACE
      ?auto_555223 - SURFACE
      ?auto_555222 - SURFACE
    )
    :vars
    (
      ?auto_555225 - HOIST
      ?auto_555224 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555225 ?auto_555224 ) ( SURFACE-AT ?auto_555223 ?auto_555224 ) ( CLEAR ?auto_555223 ) ( LIFTING ?auto_555225 ?auto_555222 ) ( IS-CRATE ?auto_555222 ) ( not ( = ?auto_555223 ?auto_555222 ) ) ( ON ?auto_555220 ?auto_555219 ) ( ON ?auto_555221 ?auto_555220 ) ( ON ?auto_555223 ?auto_555221 ) ( not ( = ?auto_555219 ?auto_555220 ) ) ( not ( = ?auto_555219 ?auto_555221 ) ) ( not ( = ?auto_555219 ?auto_555223 ) ) ( not ( = ?auto_555219 ?auto_555222 ) ) ( not ( = ?auto_555220 ?auto_555221 ) ) ( not ( = ?auto_555220 ?auto_555223 ) ) ( not ( = ?auto_555220 ?auto_555222 ) ) ( not ( = ?auto_555221 ?auto_555223 ) ) ( not ( = ?auto_555221 ?auto_555222 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555223 ?auto_555222 )
      ( MAKE-4CRATE-VERIFY ?auto_555219 ?auto_555220 ?auto_555221 ?auto_555223 ?auto_555222 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555244 - SURFACE
      ?auto_555245 - SURFACE
      ?auto_555246 - SURFACE
      ?auto_555248 - SURFACE
      ?auto_555247 - SURFACE
    )
    :vars
    (
      ?auto_555249 - HOIST
      ?auto_555250 - PLACE
      ?auto_555251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555249 ?auto_555250 ) ( SURFACE-AT ?auto_555248 ?auto_555250 ) ( CLEAR ?auto_555248 ) ( IS-CRATE ?auto_555247 ) ( not ( = ?auto_555248 ?auto_555247 ) ) ( TRUCK-AT ?auto_555251 ?auto_555250 ) ( AVAILABLE ?auto_555249 ) ( IN ?auto_555247 ?auto_555251 ) ( ON ?auto_555248 ?auto_555246 ) ( not ( = ?auto_555246 ?auto_555248 ) ) ( not ( = ?auto_555246 ?auto_555247 ) ) ( ON ?auto_555245 ?auto_555244 ) ( ON ?auto_555246 ?auto_555245 ) ( not ( = ?auto_555244 ?auto_555245 ) ) ( not ( = ?auto_555244 ?auto_555246 ) ) ( not ( = ?auto_555244 ?auto_555248 ) ) ( not ( = ?auto_555244 ?auto_555247 ) ) ( not ( = ?auto_555245 ?auto_555246 ) ) ( not ( = ?auto_555245 ?auto_555248 ) ) ( not ( = ?auto_555245 ?auto_555247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555246 ?auto_555248 ?auto_555247 )
      ( MAKE-4CRATE-VERIFY ?auto_555244 ?auto_555245 ?auto_555246 ?auto_555248 ?auto_555247 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555274 - SURFACE
      ?auto_555275 - SURFACE
      ?auto_555276 - SURFACE
      ?auto_555278 - SURFACE
      ?auto_555277 - SURFACE
    )
    :vars
    (
      ?auto_555279 - HOIST
      ?auto_555282 - PLACE
      ?auto_555280 - TRUCK
      ?auto_555281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555279 ?auto_555282 ) ( SURFACE-AT ?auto_555278 ?auto_555282 ) ( CLEAR ?auto_555278 ) ( IS-CRATE ?auto_555277 ) ( not ( = ?auto_555278 ?auto_555277 ) ) ( AVAILABLE ?auto_555279 ) ( IN ?auto_555277 ?auto_555280 ) ( ON ?auto_555278 ?auto_555276 ) ( not ( = ?auto_555276 ?auto_555278 ) ) ( not ( = ?auto_555276 ?auto_555277 ) ) ( TRUCK-AT ?auto_555280 ?auto_555281 ) ( not ( = ?auto_555281 ?auto_555282 ) ) ( ON ?auto_555275 ?auto_555274 ) ( ON ?auto_555276 ?auto_555275 ) ( not ( = ?auto_555274 ?auto_555275 ) ) ( not ( = ?auto_555274 ?auto_555276 ) ) ( not ( = ?auto_555274 ?auto_555278 ) ) ( not ( = ?auto_555274 ?auto_555277 ) ) ( not ( = ?auto_555275 ?auto_555276 ) ) ( not ( = ?auto_555275 ?auto_555278 ) ) ( not ( = ?auto_555275 ?auto_555277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555276 ?auto_555278 ?auto_555277 )
      ( MAKE-4CRATE-VERIFY ?auto_555274 ?auto_555275 ?auto_555276 ?auto_555278 ?auto_555277 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555308 - SURFACE
      ?auto_555309 - SURFACE
      ?auto_555310 - SURFACE
      ?auto_555312 - SURFACE
      ?auto_555311 - SURFACE
    )
    :vars
    (
      ?auto_555314 - HOIST
      ?auto_555316 - PLACE
      ?auto_555317 - TRUCK
      ?auto_555313 - PLACE
      ?auto_555315 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_555314 ?auto_555316 ) ( SURFACE-AT ?auto_555312 ?auto_555316 ) ( CLEAR ?auto_555312 ) ( IS-CRATE ?auto_555311 ) ( not ( = ?auto_555312 ?auto_555311 ) ) ( AVAILABLE ?auto_555314 ) ( ON ?auto_555312 ?auto_555310 ) ( not ( = ?auto_555310 ?auto_555312 ) ) ( not ( = ?auto_555310 ?auto_555311 ) ) ( TRUCK-AT ?auto_555317 ?auto_555313 ) ( not ( = ?auto_555313 ?auto_555316 ) ) ( HOIST-AT ?auto_555315 ?auto_555313 ) ( LIFTING ?auto_555315 ?auto_555311 ) ( not ( = ?auto_555314 ?auto_555315 ) ) ( ON ?auto_555309 ?auto_555308 ) ( ON ?auto_555310 ?auto_555309 ) ( not ( = ?auto_555308 ?auto_555309 ) ) ( not ( = ?auto_555308 ?auto_555310 ) ) ( not ( = ?auto_555308 ?auto_555312 ) ) ( not ( = ?auto_555308 ?auto_555311 ) ) ( not ( = ?auto_555309 ?auto_555310 ) ) ( not ( = ?auto_555309 ?auto_555312 ) ) ( not ( = ?auto_555309 ?auto_555311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555310 ?auto_555312 ?auto_555311 )
      ( MAKE-4CRATE-VERIFY ?auto_555308 ?auto_555309 ?auto_555310 ?auto_555312 ?auto_555311 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555346 - SURFACE
      ?auto_555347 - SURFACE
      ?auto_555348 - SURFACE
      ?auto_555350 - SURFACE
      ?auto_555349 - SURFACE
    )
    :vars
    (
      ?auto_555353 - HOIST
      ?auto_555356 - PLACE
      ?auto_555354 - TRUCK
      ?auto_555352 - PLACE
      ?auto_555355 - HOIST
      ?auto_555351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555353 ?auto_555356 ) ( SURFACE-AT ?auto_555350 ?auto_555356 ) ( CLEAR ?auto_555350 ) ( IS-CRATE ?auto_555349 ) ( not ( = ?auto_555350 ?auto_555349 ) ) ( AVAILABLE ?auto_555353 ) ( ON ?auto_555350 ?auto_555348 ) ( not ( = ?auto_555348 ?auto_555350 ) ) ( not ( = ?auto_555348 ?auto_555349 ) ) ( TRUCK-AT ?auto_555354 ?auto_555352 ) ( not ( = ?auto_555352 ?auto_555356 ) ) ( HOIST-AT ?auto_555355 ?auto_555352 ) ( not ( = ?auto_555353 ?auto_555355 ) ) ( AVAILABLE ?auto_555355 ) ( SURFACE-AT ?auto_555349 ?auto_555352 ) ( ON ?auto_555349 ?auto_555351 ) ( CLEAR ?auto_555349 ) ( not ( = ?auto_555350 ?auto_555351 ) ) ( not ( = ?auto_555349 ?auto_555351 ) ) ( not ( = ?auto_555348 ?auto_555351 ) ) ( ON ?auto_555347 ?auto_555346 ) ( ON ?auto_555348 ?auto_555347 ) ( not ( = ?auto_555346 ?auto_555347 ) ) ( not ( = ?auto_555346 ?auto_555348 ) ) ( not ( = ?auto_555346 ?auto_555350 ) ) ( not ( = ?auto_555346 ?auto_555349 ) ) ( not ( = ?auto_555346 ?auto_555351 ) ) ( not ( = ?auto_555347 ?auto_555348 ) ) ( not ( = ?auto_555347 ?auto_555350 ) ) ( not ( = ?auto_555347 ?auto_555349 ) ) ( not ( = ?auto_555347 ?auto_555351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555348 ?auto_555350 ?auto_555349 )
      ( MAKE-4CRATE-VERIFY ?auto_555346 ?auto_555347 ?auto_555348 ?auto_555350 ?auto_555349 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555385 - SURFACE
      ?auto_555386 - SURFACE
      ?auto_555387 - SURFACE
      ?auto_555389 - SURFACE
      ?auto_555388 - SURFACE
    )
    :vars
    (
      ?auto_555393 - HOIST
      ?auto_555391 - PLACE
      ?auto_555392 - PLACE
      ?auto_555390 - HOIST
      ?auto_555395 - SURFACE
      ?auto_555394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555393 ?auto_555391 ) ( SURFACE-AT ?auto_555389 ?auto_555391 ) ( CLEAR ?auto_555389 ) ( IS-CRATE ?auto_555388 ) ( not ( = ?auto_555389 ?auto_555388 ) ) ( AVAILABLE ?auto_555393 ) ( ON ?auto_555389 ?auto_555387 ) ( not ( = ?auto_555387 ?auto_555389 ) ) ( not ( = ?auto_555387 ?auto_555388 ) ) ( not ( = ?auto_555392 ?auto_555391 ) ) ( HOIST-AT ?auto_555390 ?auto_555392 ) ( not ( = ?auto_555393 ?auto_555390 ) ) ( AVAILABLE ?auto_555390 ) ( SURFACE-AT ?auto_555388 ?auto_555392 ) ( ON ?auto_555388 ?auto_555395 ) ( CLEAR ?auto_555388 ) ( not ( = ?auto_555389 ?auto_555395 ) ) ( not ( = ?auto_555388 ?auto_555395 ) ) ( not ( = ?auto_555387 ?auto_555395 ) ) ( TRUCK-AT ?auto_555394 ?auto_555391 ) ( ON ?auto_555386 ?auto_555385 ) ( ON ?auto_555387 ?auto_555386 ) ( not ( = ?auto_555385 ?auto_555386 ) ) ( not ( = ?auto_555385 ?auto_555387 ) ) ( not ( = ?auto_555385 ?auto_555389 ) ) ( not ( = ?auto_555385 ?auto_555388 ) ) ( not ( = ?auto_555385 ?auto_555395 ) ) ( not ( = ?auto_555386 ?auto_555387 ) ) ( not ( = ?auto_555386 ?auto_555389 ) ) ( not ( = ?auto_555386 ?auto_555388 ) ) ( not ( = ?auto_555386 ?auto_555395 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555387 ?auto_555389 ?auto_555388 )
      ( MAKE-4CRATE-VERIFY ?auto_555385 ?auto_555386 ?auto_555387 ?auto_555389 ?auto_555388 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555424 - SURFACE
      ?auto_555425 - SURFACE
      ?auto_555426 - SURFACE
      ?auto_555428 - SURFACE
      ?auto_555427 - SURFACE
    )
    :vars
    (
      ?auto_555434 - HOIST
      ?auto_555431 - PLACE
      ?auto_555433 - PLACE
      ?auto_555429 - HOIST
      ?auto_555432 - SURFACE
      ?auto_555430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555434 ?auto_555431 ) ( IS-CRATE ?auto_555427 ) ( not ( = ?auto_555428 ?auto_555427 ) ) ( not ( = ?auto_555426 ?auto_555428 ) ) ( not ( = ?auto_555426 ?auto_555427 ) ) ( not ( = ?auto_555433 ?auto_555431 ) ) ( HOIST-AT ?auto_555429 ?auto_555433 ) ( not ( = ?auto_555434 ?auto_555429 ) ) ( AVAILABLE ?auto_555429 ) ( SURFACE-AT ?auto_555427 ?auto_555433 ) ( ON ?auto_555427 ?auto_555432 ) ( CLEAR ?auto_555427 ) ( not ( = ?auto_555428 ?auto_555432 ) ) ( not ( = ?auto_555427 ?auto_555432 ) ) ( not ( = ?auto_555426 ?auto_555432 ) ) ( TRUCK-AT ?auto_555430 ?auto_555431 ) ( SURFACE-AT ?auto_555426 ?auto_555431 ) ( CLEAR ?auto_555426 ) ( LIFTING ?auto_555434 ?auto_555428 ) ( IS-CRATE ?auto_555428 ) ( ON ?auto_555425 ?auto_555424 ) ( ON ?auto_555426 ?auto_555425 ) ( not ( = ?auto_555424 ?auto_555425 ) ) ( not ( = ?auto_555424 ?auto_555426 ) ) ( not ( = ?auto_555424 ?auto_555428 ) ) ( not ( = ?auto_555424 ?auto_555427 ) ) ( not ( = ?auto_555424 ?auto_555432 ) ) ( not ( = ?auto_555425 ?auto_555426 ) ) ( not ( = ?auto_555425 ?auto_555428 ) ) ( not ( = ?auto_555425 ?auto_555427 ) ) ( not ( = ?auto_555425 ?auto_555432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555426 ?auto_555428 ?auto_555427 )
      ( MAKE-4CRATE-VERIFY ?auto_555424 ?auto_555425 ?auto_555426 ?auto_555428 ?auto_555427 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_555463 - SURFACE
      ?auto_555464 - SURFACE
      ?auto_555465 - SURFACE
      ?auto_555467 - SURFACE
      ?auto_555466 - SURFACE
    )
    :vars
    (
      ?auto_555470 - HOIST
      ?auto_555472 - PLACE
      ?auto_555471 - PLACE
      ?auto_555468 - HOIST
      ?auto_555469 - SURFACE
      ?auto_555473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_555470 ?auto_555472 ) ( IS-CRATE ?auto_555466 ) ( not ( = ?auto_555467 ?auto_555466 ) ) ( not ( = ?auto_555465 ?auto_555467 ) ) ( not ( = ?auto_555465 ?auto_555466 ) ) ( not ( = ?auto_555471 ?auto_555472 ) ) ( HOIST-AT ?auto_555468 ?auto_555471 ) ( not ( = ?auto_555470 ?auto_555468 ) ) ( AVAILABLE ?auto_555468 ) ( SURFACE-AT ?auto_555466 ?auto_555471 ) ( ON ?auto_555466 ?auto_555469 ) ( CLEAR ?auto_555466 ) ( not ( = ?auto_555467 ?auto_555469 ) ) ( not ( = ?auto_555466 ?auto_555469 ) ) ( not ( = ?auto_555465 ?auto_555469 ) ) ( TRUCK-AT ?auto_555473 ?auto_555472 ) ( SURFACE-AT ?auto_555465 ?auto_555472 ) ( CLEAR ?auto_555465 ) ( IS-CRATE ?auto_555467 ) ( AVAILABLE ?auto_555470 ) ( IN ?auto_555467 ?auto_555473 ) ( ON ?auto_555464 ?auto_555463 ) ( ON ?auto_555465 ?auto_555464 ) ( not ( = ?auto_555463 ?auto_555464 ) ) ( not ( = ?auto_555463 ?auto_555465 ) ) ( not ( = ?auto_555463 ?auto_555467 ) ) ( not ( = ?auto_555463 ?auto_555466 ) ) ( not ( = ?auto_555463 ?auto_555469 ) ) ( not ( = ?auto_555464 ?auto_555465 ) ) ( not ( = ?auto_555464 ?auto_555467 ) ) ( not ( = ?auto_555464 ?auto_555466 ) ) ( not ( = ?auto_555464 ?auto_555469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_555465 ?auto_555467 ?auto_555466 )
      ( MAKE-4CRATE-VERIFY ?auto_555463 ?auto_555464 ?auto_555465 ?auto_555467 ?auto_555466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555964 - SURFACE
      ?auto_555965 - SURFACE
    )
    :vars
    (
      ?auto_555969 - HOIST
      ?auto_555968 - PLACE
      ?auto_555971 - SURFACE
      ?auto_555970 - TRUCK
      ?auto_555967 - PLACE
      ?auto_555966 - HOIST
      ?auto_555972 - SURFACE
      ?auto_555973 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555969 ?auto_555968 ) ( SURFACE-AT ?auto_555964 ?auto_555968 ) ( CLEAR ?auto_555964 ) ( IS-CRATE ?auto_555965 ) ( not ( = ?auto_555964 ?auto_555965 ) ) ( AVAILABLE ?auto_555969 ) ( ON ?auto_555964 ?auto_555971 ) ( not ( = ?auto_555971 ?auto_555964 ) ) ( not ( = ?auto_555971 ?auto_555965 ) ) ( TRUCK-AT ?auto_555970 ?auto_555967 ) ( not ( = ?auto_555967 ?auto_555968 ) ) ( HOIST-AT ?auto_555966 ?auto_555967 ) ( not ( = ?auto_555969 ?auto_555966 ) ) ( SURFACE-AT ?auto_555965 ?auto_555967 ) ( ON ?auto_555965 ?auto_555972 ) ( CLEAR ?auto_555965 ) ( not ( = ?auto_555964 ?auto_555972 ) ) ( not ( = ?auto_555965 ?auto_555972 ) ) ( not ( = ?auto_555971 ?auto_555972 ) ) ( LIFTING ?auto_555966 ?auto_555973 ) ( IS-CRATE ?auto_555973 ) ( not ( = ?auto_555964 ?auto_555973 ) ) ( not ( = ?auto_555965 ?auto_555973 ) ) ( not ( = ?auto_555971 ?auto_555973 ) ) ( not ( = ?auto_555972 ?auto_555973 ) ) )
    :subtasks
    ( ( !LOAD ?auto_555966 ?auto_555973 ?auto_555970 ?auto_555967 )
      ( MAKE-1CRATE ?auto_555964 ?auto_555965 )
      ( MAKE-1CRATE-VERIFY ?auto_555964 ?auto_555965 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556123 - SURFACE
      ?auto_556124 - SURFACE
      ?auto_556125 - SURFACE
      ?auto_556127 - SURFACE
      ?auto_556126 - SURFACE
      ?auto_556128 - SURFACE
    )
    :vars
    (
      ?auto_556130 - HOIST
      ?auto_556129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556130 ?auto_556129 ) ( SURFACE-AT ?auto_556126 ?auto_556129 ) ( CLEAR ?auto_556126 ) ( LIFTING ?auto_556130 ?auto_556128 ) ( IS-CRATE ?auto_556128 ) ( not ( = ?auto_556126 ?auto_556128 ) ) ( ON ?auto_556124 ?auto_556123 ) ( ON ?auto_556125 ?auto_556124 ) ( ON ?auto_556127 ?auto_556125 ) ( ON ?auto_556126 ?auto_556127 ) ( not ( = ?auto_556123 ?auto_556124 ) ) ( not ( = ?auto_556123 ?auto_556125 ) ) ( not ( = ?auto_556123 ?auto_556127 ) ) ( not ( = ?auto_556123 ?auto_556126 ) ) ( not ( = ?auto_556123 ?auto_556128 ) ) ( not ( = ?auto_556124 ?auto_556125 ) ) ( not ( = ?auto_556124 ?auto_556127 ) ) ( not ( = ?auto_556124 ?auto_556126 ) ) ( not ( = ?auto_556124 ?auto_556128 ) ) ( not ( = ?auto_556125 ?auto_556127 ) ) ( not ( = ?auto_556125 ?auto_556126 ) ) ( not ( = ?auto_556125 ?auto_556128 ) ) ( not ( = ?auto_556127 ?auto_556126 ) ) ( not ( = ?auto_556127 ?auto_556128 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_556126 ?auto_556128 )
      ( MAKE-5CRATE-VERIFY ?auto_556123 ?auto_556124 ?auto_556125 ?auto_556127 ?auto_556126 ?auto_556128 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556157 - SURFACE
      ?auto_556158 - SURFACE
      ?auto_556159 - SURFACE
      ?auto_556161 - SURFACE
      ?auto_556160 - SURFACE
      ?auto_556162 - SURFACE
    )
    :vars
    (
      ?auto_556164 - HOIST
      ?auto_556163 - PLACE
      ?auto_556165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556164 ?auto_556163 ) ( SURFACE-AT ?auto_556160 ?auto_556163 ) ( CLEAR ?auto_556160 ) ( IS-CRATE ?auto_556162 ) ( not ( = ?auto_556160 ?auto_556162 ) ) ( TRUCK-AT ?auto_556165 ?auto_556163 ) ( AVAILABLE ?auto_556164 ) ( IN ?auto_556162 ?auto_556165 ) ( ON ?auto_556160 ?auto_556161 ) ( not ( = ?auto_556161 ?auto_556160 ) ) ( not ( = ?auto_556161 ?auto_556162 ) ) ( ON ?auto_556158 ?auto_556157 ) ( ON ?auto_556159 ?auto_556158 ) ( ON ?auto_556161 ?auto_556159 ) ( not ( = ?auto_556157 ?auto_556158 ) ) ( not ( = ?auto_556157 ?auto_556159 ) ) ( not ( = ?auto_556157 ?auto_556161 ) ) ( not ( = ?auto_556157 ?auto_556160 ) ) ( not ( = ?auto_556157 ?auto_556162 ) ) ( not ( = ?auto_556158 ?auto_556159 ) ) ( not ( = ?auto_556158 ?auto_556161 ) ) ( not ( = ?auto_556158 ?auto_556160 ) ) ( not ( = ?auto_556158 ?auto_556162 ) ) ( not ( = ?auto_556159 ?auto_556161 ) ) ( not ( = ?auto_556159 ?auto_556160 ) ) ( not ( = ?auto_556159 ?auto_556162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556161 ?auto_556160 ?auto_556162 )
      ( MAKE-5CRATE-VERIFY ?auto_556157 ?auto_556158 ?auto_556159 ?auto_556161 ?auto_556160 ?auto_556162 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556197 - SURFACE
      ?auto_556198 - SURFACE
      ?auto_556199 - SURFACE
      ?auto_556201 - SURFACE
      ?auto_556200 - SURFACE
      ?auto_556202 - SURFACE
    )
    :vars
    (
      ?auto_556204 - HOIST
      ?auto_556206 - PLACE
      ?auto_556205 - TRUCK
      ?auto_556203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556204 ?auto_556206 ) ( SURFACE-AT ?auto_556200 ?auto_556206 ) ( CLEAR ?auto_556200 ) ( IS-CRATE ?auto_556202 ) ( not ( = ?auto_556200 ?auto_556202 ) ) ( AVAILABLE ?auto_556204 ) ( IN ?auto_556202 ?auto_556205 ) ( ON ?auto_556200 ?auto_556201 ) ( not ( = ?auto_556201 ?auto_556200 ) ) ( not ( = ?auto_556201 ?auto_556202 ) ) ( TRUCK-AT ?auto_556205 ?auto_556203 ) ( not ( = ?auto_556203 ?auto_556206 ) ) ( ON ?auto_556198 ?auto_556197 ) ( ON ?auto_556199 ?auto_556198 ) ( ON ?auto_556201 ?auto_556199 ) ( not ( = ?auto_556197 ?auto_556198 ) ) ( not ( = ?auto_556197 ?auto_556199 ) ) ( not ( = ?auto_556197 ?auto_556201 ) ) ( not ( = ?auto_556197 ?auto_556200 ) ) ( not ( = ?auto_556197 ?auto_556202 ) ) ( not ( = ?auto_556198 ?auto_556199 ) ) ( not ( = ?auto_556198 ?auto_556201 ) ) ( not ( = ?auto_556198 ?auto_556200 ) ) ( not ( = ?auto_556198 ?auto_556202 ) ) ( not ( = ?auto_556199 ?auto_556201 ) ) ( not ( = ?auto_556199 ?auto_556200 ) ) ( not ( = ?auto_556199 ?auto_556202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556201 ?auto_556200 ?auto_556202 )
      ( MAKE-5CRATE-VERIFY ?auto_556197 ?auto_556198 ?auto_556199 ?auto_556201 ?auto_556200 ?auto_556202 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556242 - SURFACE
      ?auto_556243 - SURFACE
      ?auto_556244 - SURFACE
      ?auto_556246 - SURFACE
      ?auto_556245 - SURFACE
      ?auto_556247 - SURFACE
    )
    :vars
    (
      ?auto_556248 - HOIST
      ?auto_556252 - PLACE
      ?auto_556250 - TRUCK
      ?auto_556249 - PLACE
      ?auto_556251 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_556248 ?auto_556252 ) ( SURFACE-AT ?auto_556245 ?auto_556252 ) ( CLEAR ?auto_556245 ) ( IS-CRATE ?auto_556247 ) ( not ( = ?auto_556245 ?auto_556247 ) ) ( AVAILABLE ?auto_556248 ) ( ON ?auto_556245 ?auto_556246 ) ( not ( = ?auto_556246 ?auto_556245 ) ) ( not ( = ?auto_556246 ?auto_556247 ) ) ( TRUCK-AT ?auto_556250 ?auto_556249 ) ( not ( = ?auto_556249 ?auto_556252 ) ) ( HOIST-AT ?auto_556251 ?auto_556249 ) ( LIFTING ?auto_556251 ?auto_556247 ) ( not ( = ?auto_556248 ?auto_556251 ) ) ( ON ?auto_556243 ?auto_556242 ) ( ON ?auto_556244 ?auto_556243 ) ( ON ?auto_556246 ?auto_556244 ) ( not ( = ?auto_556242 ?auto_556243 ) ) ( not ( = ?auto_556242 ?auto_556244 ) ) ( not ( = ?auto_556242 ?auto_556246 ) ) ( not ( = ?auto_556242 ?auto_556245 ) ) ( not ( = ?auto_556242 ?auto_556247 ) ) ( not ( = ?auto_556243 ?auto_556244 ) ) ( not ( = ?auto_556243 ?auto_556246 ) ) ( not ( = ?auto_556243 ?auto_556245 ) ) ( not ( = ?auto_556243 ?auto_556247 ) ) ( not ( = ?auto_556244 ?auto_556246 ) ) ( not ( = ?auto_556244 ?auto_556245 ) ) ( not ( = ?auto_556244 ?auto_556247 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556246 ?auto_556245 ?auto_556247 )
      ( MAKE-5CRATE-VERIFY ?auto_556242 ?auto_556243 ?auto_556244 ?auto_556246 ?auto_556245 ?auto_556247 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556292 - SURFACE
      ?auto_556293 - SURFACE
      ?auto_556294 - SURFACE
      ?auto_556296 - SURFACE
      ?auto_556295 - SURFACE
      ?auto_556297 - SURFACE
    )
    :vars
    (
      ?auto_556298 - HOIST
      ?auto_556303 - PLACE
      ?auto_556301 - TRUCK
      ?auto_556302 - PLACE
      ?auto_556300 - HOIST
      ?auto_556299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_556298 ?auto_556303 ) ( SURFACE-AT ?auto_556295 ?auto_556303 ) ( CLEAR ?auto_556295 ) ( IS-CRATE ?auto_556297 ) ( not ( = ?auto_556295 ?auto_556297 ) ) ( AVAILABLE ?auto_556298 ) ( ON ?auto_556295 ?auto_556296 ) ( not ( = ?auto_556296 ?auto_556295 ) ) ( not ( = ?auto_556296 ?auto_556297 ) ) ( TRUCK-AT ?auto_556301 ?auto_556302 ) ( not ( = ?auto_556302 ?auto_556303 ) ) ( HOIST-AT ?auto_556300 ?auto_556302 ) ( not ( = ?auto_556298 ?auto_556300 ) ) ( AVAILABLE ?auto_556300 ) ( SURFACE-AT ?auto_556297 ?auto_556302 ) ( ON ?auto_556297 ?auto_556299 ) ( CLEAR ?auto_556297 ) ( not ( = ?auto_556295 ?auto_556299 ) ) ( not ( = ?auto_556297 ?auto_556299 ) ) ( not ( = ?auto_556296 ?auto_556299 ) ) ( ON ?auto_556293 ?auto_556292 ) ( ON ?auto_556294 ?auto_556293 ) ( ON ?auto_556296 ?auto_556294 ) ( not ( = ?auto_556292 ?auto_556293 ) ) ( not ( = ?auto_556292 ?auto_556294 ) ) ( not ( = ?auto_556292 ?auto_556296 ) ) ( not ( = ?auto_556292 ?auto_556295 ) ) ( not ( = ?auto_556292 ?auto_556297 ) ) ( not ( = ?auto_556292 ?auto_556299 ) ) ( not ( = ?auto_556293 ?auto_556294 ) ) ( not ( = ?auto_556293 ?auto_556296 ) ) ( not ( = ?auto_556293 ?auto_556295 ) ) ( not ( = ?auto_556293 ?auto_556297 ) ) ( not ( = ?auto_556293 ?auto_556299 ) ) ( not ( = ?auto_556294 ?auto_556296 ) ) ( not ( = ?auto_556294 ?auto_556295 ) ) ( not ( = ?auto_556294 ?auto_556297 ) ) ( not ( = ?auto_556294 ?auto_556299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556296 ?auto_556295 ?auto_556297 )
      ( MAKE-5CRATE-VERIFY ?auto_556292 ?auto_556293 ?auto_556294 ?auto_556296 ?auto_556295 ?auto_556297 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556343 - SURFACE
      ?auto_556344 - SURFACE
      ?auto_556345 - SURFACE
      ?auto_556347 - SURFACE
      ?auto_556346 - SURFACE
      ?auto_556348 - SURFACE
    )
    :vars
    (
      ?auto_556352 - HOIST
      ?auto_556351 - PLACE
      ?auto_556353 - PLACE
      ?auto_556349 - HOIST
      ?auto_556354 - SURFACE
      ?auto_556350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556352 ?auto_556351 ) ( SURFACE-AT ?auto_556346 ?auto_556351 ) ( CLEAR ?auto_556346 ) ( IS-CRATE ?auto_556348 ) ( not ( = ?auto_556346 ?auto_556348 ) ) ( AVAILABLE ?auto_556352 ) ( ON ?auto_556346 ?auto_556347 ) ( not ( = ?auto_556347 ?auto_556346 ) ) ( not ( = ?auto_556347 ?auto_556348 ) ) ( not ( = ?auto_556353 ?auto_556351 ) ) ( HOIST-AT ?auto_556349 ?auto_556353 ) ( not ( = ?auto_556352 ?auto_556349 ) ) ( AVAILABLE ?auto_556349 ) ( SURFACE-AT ?auto_556348 ?auto_556353 ) ( ON ?auto_556348 ?auto_556354 ) ( CLEAR ?auto_556348 ) ( not ( = ?auto_556346 ?auto_556354 ) ) ( not ( = ?auto_556348 ?auto_556354 ) ) ( not ( = ?auto_556347 ?auto_556354 ) ) ( TRUCK-AT ?auto_556350 ?auto_556351 ) ( ON ?auto_556344 ?auto_556343 ) ( ON ?auto_556345 ?auto_556344 ) ( ON ?auto_556347 ?auto_556345 ) ( not ( = ?auto_556343 ?auto_556344 ) ) ( not ( = ?auto_556343 ?auto_556345 ) ) ( not ( = ?auto_556343 ?auto_556347 ) ) ( not ( = ?auto_556343 ?auto_556346 ) ) ( not ( = ?auto_556343 ?auto_556348 ) ) ( not ( = ?auto_556343 ?auto_556354 ) ) ( not ( = ?auto_556344 ?auto_556345 ) ) ( not ( = ?auto_556344 ?auto_556347 ) ) ( not ( = ?auto_556344 ?auto_556346 ) ) ( not ( = ?auto_556344 ?auto_556348 ) ) ( not ( = ?auto_556344 ?auto_556354 ) ) ( not ( = ?auto_556345 ?auto_556347 ) ) ( not ( = ?auto_556345 ?auto_556346 ) ) ( not ( = ?auto_556345 ?auto_556348 ) ) ( not ( = ?auto_556345 ?auto_556354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556347 ?auto_556346 ?auto_556348 )
      ( MAKE-5CRATE-VERIFY ?auto_556343 ?auto_556344 ?auto_556345 ?auto_556347 ?auto_556346 ?auto_556348 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556394 - SURFACE
      ?auto_556395 - SURFACE
      ?auto_556396 - SURFACE
      ?auto_556398 - SURFACE
      ?auto_556397 - SURFACE
      ?auto_556399 - SURFACE
    )
    :vars
    (
      ?auto_556405 - HOIST
      ?auto_556401 - PLACE
      ?auto_556404 - PLACE
      ?auto_556403 - HOIST
      ?auto_556402 - SURFACE
      ?auto_556400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556405 ?auto_556401 ) ( IS-CRATE ?auto_556399 ) ( not ( = ?auto_556397 ?auto_556399 ) ) ( not ( = ?auto_556398 ?auto_556397 ) ) ( not ( = ?auto_556398 ?auto_556399 ) ) ( not ( = ?auto_556404 ?auto_556401 ) ) ( HOIST-AT ?auto_556403 ?auto_556404 ) ( not ( = ?auto_556405 ?auto_556403 ) ) ( AVAILABLE ?auto_556403 ) ( SURFACE-AT ?auto_556399 ?auto_556404 ) ( ON ?auto_556399 ?auto_556402 ) ( CLEAR ?auto_556399 ) ( not ( = ?auto_556397 ?auto_556402 ) ) ( not ( = ?auto_556399 ?auto_556402 ) ) ( not ( = ?auto_556398 ?auto_556402 ) ) ( TRUCK-AT ?auto_556400 ?auto_556401 ) ( SURFACE-AT ?auto_556398 ?auto_556401 ) ( CLEAR ?auto_556398 ) ( LIFTING ?auto_556405 ?auto_556397 ) ( IS-CRATE ?auto_556397 ) ( ON ?auto_556395 ?auto_556394 ) ( ON ?auto_556396 ?auto_556395 ) ( ON ?auto_556398 ?auto_556396 ) ( not ( = ?auto_556394 ?auto_556395 ) ) ( not ( = ?auto_556394 ?auto_556396 ) ) ( not ( = ?auto_556394 ?auto_556398 ) ) ( not ( = ?auto_556394 ?auto_556397 ) ) ( not ( = ?auto_556394 ?auto_556399 ) ) ( not ( = ?auto_556394 ?auto_556402 ) ) ( not ( = ?auto_556395 ?auto_556396 ) ) ( not ( = ?auto_556395 ?auto_556398 ) ) ( not ( = ?auto_556395 ?auto_556397 ) ) ( not ( = ?auto_556395 ?auto_556399 ) ) ( not ( = ?auto_556395 ?auto_556402 ) ) ( not ( = ?auto_556396 ?auto_556398 ) ) ( not ( = ?auto_556396 ?auto_556397 ) ) ( not ( = ?auto_556396 ?auto_556399 ) ) ( not ( = ?auto_556396 ?auto_556402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556398 ?auto_556397 ?auto_556399 )
      ( MAKE-5CRATE-VERIFY ?auto_556394 ?auto_556395 ?auto_556396 ?auto_556398 ?auto_556397 ?auto_556399 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_556445 - SURFACE
      ?auto_556446 - SURFACE
      ?auto_556447 - SURFACE
      ?auto_556449 - SURFACE
      ?auto_556448 - SURFACE
      ?auto_556450 - SURFACE
    )
    :vars
    (
      ?auto_556455 - HOIST
      ?auto_556453 - PLACE
      ?auto_556451 - PLACE
      ?auto_556454 - HOIST
      ?auto_556456 - SURFACE
      ?auto_556452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_556455 ?auto_556453 ) ( IS-CRATE ?auto_556450 ) ( not ( = ?auto_556448 ?auto_556450 ) ) ( not ( = ?auto_556449 ?auto_556448 ) ) ( not ( = ?auto_556449 ?auto_556450 ) ) ( not ( = ?auto_556451 ?auto_556453 ) ) ( HOIST-AT ?auto_556454 ?auto_556451 ) ( not ( = ?auto_556455 ?auto_556454 ) ) ( AVAILABLE ?auto_556454 ) ( SURFACE-AT ?auto_556450 ?auto_556451 ) ( ON ?auto_556450 ?auto_556456 ) ( CLEAR ?auto_556450 ) ( not ( = ?auto_556448 ?auto_556456 ) ) ( not ( = ?auto_556450 ?auto_556456 ) ) ( not ( = ?auto_556449 ?auto_556456 ) ) ( TRUCK-AT ?auto_556452 ?auto_556453 ) ( SURFACE-AT ?auto_556449 ?auto_556453 ) ( CLEAR ?auto_556449 ) ( IS-CRATE ?auto_556448 ) ( AVAILABLE ?auto_556455 ) ( IN ?auto_556448 ?auto_556452 ) ( ON ?auto_556446 ?auto_556445 ) ( ON ?auto_556447 ?auto_556446 ) ( ON ?auto_556449 ?auto_556447 ) ( not ( = ?auto_556445 ?auto_556446 ) ) ( not ( = ?auto_556445 ?auto_556447 ) ) ( not ( = ?auto_556445 ?auto_556449 ) ) ( not ( = ?auto_556445 ?auto_556448 ) ) ( not ( = ?auto_556445 ?auto_556450 ) ) ( not ( = ?auto_556445 ?auto_556456 ) ) ( not ( = ?auto_556446 ?auto_556447 ) ) ( not ( = ?auto_556446 ?auto_556449 ) ) ( not ( = ?auto_556446 ?auto_556448 ) ) ( not ( = ?auto_556446 ?auto_556450 ) ) ( not ( = ?auto_556446 ?auto_556456 ) ) ( not ( = ?auto_556447 ?auto_556449 ) ) ( not ( = ?auto_556447 ?auto_556448 ) ) ( not ( = ?auto_556447 ?auto_556450 ) ) ( not ( = ?auto_556447 ?auto_556456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_556449 ?auto_556448 ?auto_556450 )
      ( MAKE-5CRATE-VERIFY ?auto_556445 ?auto_556446 ?auto_556447 ?auto_556449 ?auto_556448 ?auto_556450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_557437 - SURFACE
      ?auto_557438 - SURFACE
    )
    :vars
    (
      ?auto_557444 - HOIST
      ?auto_557441 - PLACE
      ?auto_557442 - SURFACE
      ?auto_557445 - PLACE
      ?auto_557439 - HOIST
      ?auto_557440 - SURFACE
      ?auto_557443 - TRUCK
      ?auto_557446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_557444 ?auto_557441 ) ( SURFACE-AT ?auto_557437 ?auto_557441 ) ( CLEAR ?auto_557437 ) ( IS-CRATE ?auto_557438 ) ( not ( = ?auto_557437 ?auto_557438 ) ) ( ON ?auto_557437 ?auto_557442 ) ( not ( = ?auto_557442 ?auto_557437 ) ) ( not ( = ?auto_557442 ?auto_557438 ) ) ( not ( = ?auto_557445 ?auto_557441 ) ) ( HOIST-AT ?auto_557439 ?auto_557445 ) ( not ( = ?auto_557444 ?auto_557439 ) ) ( AVAILABLE ?auto_557439 ) ( SURFACE-AT ?auto_557438 ?auto_557445 ) ( ON ?auto_557438 ?auto_557440 ) ( CLEAR ?auto_557438 ) ( not ( = ?auto_557437 ?auto_557440 ) ) ( not ( = ?auto_557438 ?auto_557440 ) ) ( not ( = ?auto_557442 ?auto_557440 ) ) ( TRUCK-AT ?auto_557443 ?auto_557441 ) ( LIFTING ?auto_557444 ?auto_557446 ) ( IS-CRATE ?auto_557446 ) ( not ( = ?auto_557437 ?auto_557446 ) ) ( not ( = ?auto_557438 ?auto_557446 ) ) ( not ( = ?auto_557442 ?auto_557446 ) ) ( not ( = ?auto_557440 ?auto_557446 ) ) )
    :subtasks
    ( ( !LOAD ?auto_557444 ?auto_557446 ?auto_557443 ?auto_557441 )
      ( MAKE-1CRATE ?auto_557437 ?auto_557438 )
      ( MAKE-1CRATE-VERIFY ?auto_557437 ?auto_557438 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_557652 - SURFACE
      ?auto_557653 - SURFACE
      ?auto_557654 - SURFACE
      ?auto_557656 - SURFACE
      ?auto_557655 - SURFACE
      ?auto_557657 - SURFACE
      ?auto_557658 - SURFACE
    )
    :vars
    (
      ?auto_557659 - HOIST
      ?auto_557660 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_557659 ?auto_557660 ) ( SURFACE-AT ?auto_557657 ?auto_557660 ) ( CLEAR ?auto_557657 ) ( LIFTING ?auto_557659 ?auto_557658 ) ( IS-CRATE ?auto_557658 ) ( not ( = ?auto_557657 ?auto_557658 ) ) ( ON ?auto_557653 ?auto_557652 ) ( ON ?auto_557654 ?auto_557653 ) ( ON ?auto_557656 ?auto_557654 ) ( ON ?auto_557655 ?auto_557656 ) ( ON ?auto_557657 ?auto_557655 ) ( not ( = ?auto_557652 ?auto_557653 ) ) ( not ( = ?auto_557652 ?auto_557654 ) ) ( not ( = ?auto_557652 ?auto_557656 ) ) ( not ( = ?auto_557652 ?auto_557655 ) ) ( not ( = ?auto_557652 ?auto_557657 ) ) ( not ( = ?auto_557652 ?auto_557658 ) ) ( not ( = ?auto_557653 ?auto_557654 ) ) ( not ( = ?auto_557653 ?auto_557656 ) ) ( not ( = ?auto_557653 ?auto_557655 ) ) ( not ( = ?auto_557653 ?auto_557657 ) ) ( not ( = ?auto_557653 ?auto_557658 ) ) ( not ( = ?auto_557654 ?auto_557656 ) ) ( not ( = ?auto_557654 ?auto_557655 ) ) ( not ( = ?auto_557654 ?auto_557657 ) ) ( not ( = ?auto_557654 ?auto_557658 ) ) ( not ( = ?auto_557656 ?auto_557655 ) ) ( not ( = ?auto_557656 ?auto_557657 ) ) ( not ( = ?auto_557656 ?auto_557658 ) ) ( not ( = ?auto_557655 ?auto_557657 ) ) ( not ( = ?auto_557655 ?auto_557658 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_557657 ?auto_557658 )
      ( MAKE-6CRATE-VERIFY ?auto_557652 ?auto_557653 ?auto_557654 ?auto_557656 ?auto_557655 ?auto_557657 ?auto_557658 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_557696 - SURFACE
      ?auto_557697 - SURFACE
      ?auto_557698 - SURFACE
      ?auto_557700 - SURFACE
      ?auto_557699 - SURFACE
      ?auto_557701 - SURFACE
      ?auto_557702 - SURFACE
    )
    :vars
    (
      ?auto_557703 - HOIST
      ?auto_557705 - PLACE
      ?auto_557704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_557703 ?auto_557705 ) ( SURFACE-AT ?auto_557701 ?auto_557705 ) ( CLEAR ?auto_557701 ) ( IS-CRATE ?auto_557702 ) ( not ( = ?auto_557701 ?auto_557702 ) ) ( TRUCK-AT ?auto_557704 ?auto_557705 ) ( AVAILABLE ?auto_557703 ) ( IN ?auto_557702 ?auto_557704 ) ( ON ?auto_557701 ?auto_557699 ) ( not ( = ?auto_557699 ?auto_557701 ) ) ( not ( = ?auto_557699 ?auto_557702 ) ) ( ON ?auto_557697 ?auto_557696 ) ( ON ?auto_557698 ?auto_557697 ) ( ON ?auto_557700 ?auto_557698 ) ( ON ?auto_557699 ?auto_557700 ) ( not ( = ?auto_557696 ?auto_557697 ) ) ( not ( = ?auto_557696 ?auto_557698 ) ) ( not ( = ?auto_557696 ?auto_557700 ) ) ( not ( = ?auto_557696 ?auto_557699 ) ) ( not ( = ?auto_557696 ?auto_557701 ) ) ( not ( = ?auto_557696 ?auto_557702 ) ) ( not ( = ?auto_557697 ?auto_557698 ) ) ( not ( = ?auto_557697 ?auto_557700 ) ) ( not ( = ?auto_557697 ?auto_557699 ) ) ( not ( = ?auto_557697 ?auto_557701 ) ) ( not ( = ?auto_557697 ?auto_557702 ) ) ( not ( = ?auto_557698 ?auto_557700 ) ) ( not ( = ?auto_557698 ?auto_557699 ) ) ( not ( = ?auto_557698 ?auto_557701 ) ) ( not ( = ?auto_557698 ?auto_557702 ) ) ( not ( = ?auto_557700 ?auto_557699 ) ) ( not ( = ?auto_557700 ?auto_557701 ) ) ( not ( = ?auto_557700 ?auto_557702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557699 ?auto_557701 ?auto_557702 )
      ( MAKE-6CRATE-VERIFY ?auto_557696 ?auto_557697 ?auto_557698 ?auto_557700 ?auto_557699 ?auto_557701 ?auto_557702 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_557747 - SURFACE
      ?auto_557748 - SURFACE
      ?auto_557749 - SURFACE
      ?auto_557751 - SURFACE
      ?auto_557750 - SURFACE
      ?auto_557752 - SURFACE
      ?auto_557753 - SURFACE
    )
    :vars
    (
      ?auto_557756 - HOIST
      ?auto_557757 - PLACE
      ?auto_557755 - TRUCK
      ?auto_557754 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_557756 ?auto_557757 ) ( SURFACE-AT ?auto_557752 ?auto_557757 ) ( CLEAR ?auto_557752 ) ( IS-CRATE ?auto_557753 ) ( not ( = ?auto_557752 ?auto_557753 ) ) ( AVAILABLE ?auto_557756 ) ( IN ?auto_557753 ?auto_557755 ) ( ON ?auto_557752 ?auto_557750 ) ( not ( = ?auto_557750 ?auto_557752 ) ) ( not ( = ?auto_557750 ?auto_557753 ) ) ( TRUCK-AT ?auto_557755 ?auto_557754 ) ( not ( = ?auto_557754 ?auto_557757 ) ) ( ON ?auto_557748 ?auto_557747 ) ( ON ?auto_557749 ?auto_557748 ) ( ON ?auto_557751 ?auto_557749 ) ( ON ?auto_557750 ?auto_557751 ) ( not ( = ?auto_557747 ?auto_557748 ) ) ( not ( = ?auto_557747 ?auto_557749 ) ) ( not ( = ?auto_557747 ?auto_557751 ) ) ( not ( = ?auto_557747 ?auto_557750 ) ) ( not ( = ?auto_557747 ?auto_557752 ) ) ( not ( = ?auto_557747 ?auto_557753 ) ) ( not ( = ?auto_557748 ?auto_557749 ) ) ( not ( = ?auto_557748 ?auto_557751 ) ) ( not ( = ?auto_557748 ?auto_557750 ) ) ( not ( = ?auto_557748 ?auto_557752 ) ) ( not ( = ?auto_557748 ?auto_557753 ) ) ( not ( = ?auto_557749 ?auto_557751 ) ) ( not ( = ?auto_557749 ?auto_557750 ) ) ( not ( = ?auto_557749 ?auto_557752 ) ) ( not ( = ?auto_557749 ?auto_557753 ) ) ( not ( = ?auto_557751 ?auto_557750 ) ) ( not ( = ?auto_557751 ?auto_557752 ) ) ( not ( = ?auto_557751 ?auto_557753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557750 ?auto_557752 ?auto_557753 )
      ( MAKE-6CRATE-VERIFY ?auto_557747 ?auto_557748 ?auto_557749 ?auto_557751 ?auto_557750 ?auto_557752 ?auto_557753 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_557804 - SURFACE
      ?auto_557805 - SURFACE
      ?auto_557806 - SURFACE
      ?auto_557808 - SURFACE
      ?auto_557807 - SURFACE
      ?auto_557809 - SURFACE
      ?auto_557810 - SURFACE
    )
    :vars
    (
      ?auto_557815 - HOIST
      ?auto_557812 - PLACE
      ?auto_557813 - TRUCK
      ?auto_557811 - PLACE
      ?auto_557814 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_557815 ?auto_557812 ) ( SURFACE-AT ?auto_557809 ?auto_557812 ) ( CLEAR ?auto_557809 ) ( IS-CRATE ?auto_557810 ) ( not ( = ?auto_557809 ?auto_557810 ) ) ( AVAILABLE ?auto_557815 ) ( ON ?auto_557809 ?auto_557807 ) ( not ( = ?auto_557807 ?auto_557809 ) ) ( not ( = ?auto_557807 ?auto_557810 ) ) ( TRUCK-AT ?auto_557813 ?auto_557811 ) ( not ( = ?auto_557811 ?auto_557812 ) ) ( HOIST-AT ?auto_557814 ?auto_557811 ) ( LIFTING ?auto_557814 ?auto_557810 ) ( not ( = ?auto_557815 ?auto_557814 ) ) ( ON ?auto_557805 ?auto_557804 ) ( ON ?auto_557806 ?auto_557805 ) ( ON ?auto_557808 ?auto_557806 ) ( ON ?auto_557807 ?auto_557808 ) ( not ( = ?auto_557804 ?auto_557805 ) ) ( not ( = ?auto_557804 ?auto_557806 ) ) ( not ( = ?auto_557804 ?auto_557808 ) ) ( not ( = ?auto_557804 ?auto_557807 ) ) ( not ( = ?auto_557804 ?auto_557809 ) ) ( not ( = ?auto_557804 ?auto_557810 ) ) ( not ( = ?auto_557805 ?auto_557806 ) ) ( not ( = ?auto_557805 ?auto_557808 ) ) ( not ( = ?auto_557805 ?auto_557807 ) ) ( not ( = ?auto_557805 ?auto_557809 ) ) ( not ( = ?auto_557805 ?auto_557810 ) ) ( not ( = ?auto_557806 ?auto_557808 ) ) ( not ( = ?auto_557806 ?auto_557807 ) ) ( not ( = ?auto_557806 ?auto_557809 ) ) ( not ( = ?auto_557806 ?auto_557810 ) ) ( not ( = ?auto_557808 ?auto_557807 ) ) ( not ( = ?auto_557808 ?auto_557809 ) ) ( not ( = ?auto_557808 ?auto_557810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557807 ?auto_557809 ?auto_557810 )
      ( MAKE-6CRATE-VERIFY ?auto_557804 ?auto_557805 ?auto_557806 ?auto_557808 ?auto_557807 ?auto_557809 ?auto_557810 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_557867 - SURFACE
      ?auto_557868 - SURFACE
      ?auto_557869 - SURFACE
      ?auto_557871 - SURFACE
      ?auto_557870 - SURFACE
      ?auto_557872 - SURFACE
      ?auto_557873 - SURFACE
    )
    :vars
    (
      ?auto_557874 - HOIST
      ?auto_557875 - PLACE
      ?auto_557878 - TRUCK
      ?auto_557879 - PLACE
      ?auto_557876 - HOIST
      ?auto_557877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_557874 ?auto_557875 ) ( SURFACE-AT ?auto_557872 ?auto_557875 ) ( CLEAR ?auto_557872 ) ( IS-CRATE ?auto_557873 ) ( not ( = ?auto_557872 ?auto_557873 ) ) ( AVAILABLE ?auto_557874 ) ( ON ?auto_557872 ?auto_557870 ) ( not ( = ?auto_557870 ?auto_557872 ) ) ( not ( = ?auto_557870 ?auto_557873 ) ) ( TRUCK-AT ?auto_557878 ?auto_557879 ) ( not ( = ?auto_557879 ?auto_557875 ) ) ( HOIST-AT ?auto_557876 ?auto_557879 ) ( not ( = ?auto_557874 ?auto_557876 ) ) ( AVAILABLE ?auto_557876 ) ( SURFACE-AT ?auto_557873 ?auto_557879 ) ( ON ?auto_557873 ?auto_557877 ) ( CLEAR ?auto_557873 ) ( not ( = ?auto_557872 ?auto_557877 ) ) ( not ( = ?auto_557873 ?auto_557877 ) ) ( not ( = ?auto_557870 ?auto_557877 ) ) ( ON ?auto_557868 ?auto_557867 ) ( ON ?auto_557869 ?auto_557868 ) ( ON ?auto_557871 ?auto_557869 ) ( ON ?auto_557870 ?auto_557871 ) ( not ( = ?auto_557867 ?auto_557868 ) ) ( not ( = ?auto_557867 ?auto_557869 ) ) ( not ( = ?auto_557867 ?auto_557871 ) ) ( not ( = ?auto_557867 ?auto_557870 ) ) ( not ( = ?auto_557867 ?auto_557872 ) ) ( not ( = ?auto_557867 ?auto_557873 ) ) ( not ( = ?auto_557867 ?auto_557877 ) ) ( not ( = ?auto_557868 ?auto_557869 ) ) ( not ( = ?auto_557868 ?auto_557871 ) ) ( not ( = ?auto_557868 ?auto_557870 ) ) ( not ( = ?auto_557868 ?auto_557872 ) ) ( not ( = ?auto_557868 ?auto_557873 ) ) ( not ( = ?auto_557868 ?auto_557877 ) ) ( not ( = ?auto_557869 ?auto_557871 ) ) ( not ( = ?auto_557869 ?auto_557870 ) ) ( not ( = ?auto_557869 ?auto_557872 ) ) ( not ( = ?auto_557869 ?auto_557873 ) ) ( not ( = ?auto_557869 ?auto_557877 ) ) ( not ( = ?auto_557871 ?auto_557870 ) ) ( not ( = ?auto_557871 ?auto_557872 ) ) ( not ( = ?auto_557871 ?auto_557873 ) ) ( not ( = ?auto_557871 ?auto_557877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557870 ?auto_557872 ?auto_557873 )
      ( MAKE-6CRATE-VERIFY ?auto_557867 ?auto_557868 ?auto_557869 ?auto_557871 ?auto_557870 ?auto_557872 ?auto_557873 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_557931 - SURFACE
      ?auto_557932 - SURFACE
      ?auto_557933 - SURFACE
      ?auto_557935 - SURFACE
      ?auto_557934 - SURFACE
      ?auto_557936 - SURFACE
      ?auto_557937 - SURFACE
    )
    :vars
    (
      ?auto_557943 - HOIST
      ?auto_557939 - PLACE
      ?auto_557938 - PLACE
      ?auto_557940 - HOIST
      ?auto_557942 - SURFACE
      ?auto_557941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_557943 ?auto_557939 ) ( SURFACE-AT ?auto_557936 ?auto_557939 ) ( CLEAR ?auto_557936 ) ( IS-CRATE ?auto_557937 ) ( not ( = ?auto_557936 ?auto_557937 ) ) ( AVAILABLE ?auto_557943 ) ( ON ?auto_557936 ?auto_557934 ) ( not ( = ?auto_557934 ?auto_557936 ) ) ( not ( = ?auto_557934 ?auto_557937 ) ) ( not ( = ?auto_557938 ?auto_557939 ) ) ( HOIST-AT ?auto_557940 ?auto_557938 ) ( not ( = ?auto_557943 ?auto_557940 ) ) ( AVAILABLE ?auto_557940 ) ( SURFACE-AT ?auto_557937 ?auto_557938 ) ( ON ?auto_557937 ?auto_557942 ) ( CLEAR ?auto_557937 ) ( not ( = ?auto_557936 ?auto_557942 ) ) ( not ( = ?auto_557937 ?auto_557942 ) ) ( not ( = ?auto_557934 ?auto_557942 ) ) ( TRUCK-AT ?auto_557941 ?auto_557939 ) ( ON ?auto_557932 ?auto_557931 ) ( ON ?auto_557933 ?auto_557932 ) ( ON ?auto_557935 ?auto_557933 ) ( ON ?auto_557934 ?auto_557935 ) ( not ( = ?auto_557931 ?auto_557932 ) ) ( not ( = ?auto_557931 ?auto_557933 ) ) ( not ( = ?auto_557931 ?auto_557935 ) ) ( not ( = ?auto_557931 ?auto_557934 ) ) ( not ( = ?auto_557931 ?auto_557936 ) ) ( not ( = ?auto_557931 ?auto_557937 ) ) ( not ( = ?auto_557931 ?auto_557942 ) ) ( not ( = ?auto_557932 ?auto_557933 ) ) ( not ( = ?auto_557932 ?auto_557935 ) ) ( not ( = ?auto_557932 ?auto_557934 ) ) ( not ( = ?auto_557932 ?auto_557936 ) ) ( not ( = ?auto_557932 ?auto_557937 ) ) ( not ( = ?auto_557932 ?auto_557942 ) ) ( not ( = ?auto_557933 ?auto_557935 ) ) ( not ( = ?auto_557933 ?auto_557934 ) ) ( not ( = ?auto_557933 ?auto_557936 ) ) ( not ( = ?auto_557933 ?auto_557937 ) ) ( not ( = ?auto_557933 ?auto_557942 ) ) ( not ( = ?auto_557935 ?auto_557934 ) ) ( not ( = ?auto_557935 ?auto_557936 ) ) ( not ( = ?auto_557935 ?auto_557937 ) ) ( not ( = ?auto_557935 ?auto_557942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557934 ?auto_557936 ?auto_557937 )
      ( MAKE-6CRATE-VERIFY ?auto_557931 ?auto_557932 ?auto_557933 ?auto_557935 ?auto_557934 ?auto_557936 ?auto_557937 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_557995 - SURFACE
      ?auto_557996 - SURFACE
      ?auto_557997 - SURFACE
      ?auto_557999 - SURFACE
      ?auto_557998 - SURFACE
      ?auto_558000 - SURFACE
      ?auto_558001 - SURFACE
    )
    :vars
    (
      ?auto_558007 - HOIST
      ?auto_558002 - PLACE
      ?auto_558005 - PLACE
      ?auto_558004 - HOIST
      ?auto_558003 - SURFACE
      ?auto_558006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558007 ?auto_558002 ) ( IS-CRATE ?auto_558001 ) ( not ( = ?auto_558000 ?auto_558001 ) ) ( not ( = ?auto_557998 ?auto_558000 ) ) ( not ( = ?auto_557998 ?auto_558001 ) ) ( not ( = ?auto_558005 ?auto_558002 ) ) ( HOIST-AT ?auto_558004 ?auto_558005 ) ( not ( = ?auto_558007 ?auto_558004 ) ) ( AVAILABLE ?auto_558004 ) ( SURFACE-AT ?auto_558001 ?auto_558005 ) ( ON ?auto_558001 ?auto_558003 ) ( CLEAR ?auto_558001 ) ( not ( = ?auto_558000 ?auto_558003 ) ) ( not ( = ?auto_558001 ?auto_558003 ) ) ( not ( = ?auto_557998 ?auto_558003 ) ) ( TRUCK-AT ?auto_558006 ?auto_558002 ) ( SURFACE-AT ?auto_557998 ?auto_558002 ) ( CLEAR ?auto_557998 ) ( LIFTING ?auto_558007 ?auto_558000 ) ( IS-CRATE ?auto_558000 ) ( ON ?auto_557996 ?auto_557995 ) ( ON ?auto_557997 ?auto_557996 ) ( ON ?auto_557999 ?auto_557997 ) ( ON ?auto_557998 ?auto_557999 ) ( not ( = ?auto_557995 ?auto_557996 ) ) ( not ( = ?auto_557995 ?auto_557997 ) ) ( not ( = ?auto_557995 ?auto_557999 ) ) ( not ( = ?auto_557995 ?auto_557998 ) ) ( not ( = ?auto_557995 ?auto_558000 ) ) ( not ( = ?auto_557995 ?auto_558001 ) ) ( not ( = ?auto_557995 ?auto_558003 ) ) ( not ( = ?auto_557996 ?auto_557997 ) ) ( not ( = ?auto_557996 ?auto_557999 ) ) ( not ( = ?auto_557996 ?auto_557998 ) ) ( not ( = ?auto_557996 ?auto_558000 ) ) ( not ( = ?auto_557996 ?auto_558001 ) ) ( not ( = ?auto_557996 ?auto_558003 ) ) ( not ( = ?auto_557997 ?auto_557999 ) ) ( not ( = ?auto_557997 ?auto_557998 ) ) ( not ( = ?auto_557997 ?auto_558000 ) ) ( not ( = ?auto_557997 ?auto_558001 ) ) ( not ( = ?auto_557997 ?auto_558003 ) ) ( not ( = ?auto_557999 ?auto_557998 ) ) ( not ( = ?auto_557999 ?auto_558000 ) ) ( not ( = ?auto_557999 ?auto_558001 ) ) ( not ( = ?auto_557999 ?auto_558003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_557998 ?auto_558000 ?auto_558001 )
      ( MAKE-6CRATE-VERIFY ?auto_557995 ?auto_557996 ?auto_557997 ?auto_557999 ?auto_557998 ?auto_558000 ?auto_558001 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_558059 - SURFACE
      ?auto_558060 - SURFACE
      ?auto_558061 - SURFACE
      ?auto_558063 - SURFACE
      ?auto_558062 - SURFACE
      ?auto_558064 - SURFACE
      ?auto_558065 - SURFACE
    )
    :vars
    (
      ?auto_558068 - HOIST
      ?auto_558071 - PLACE
      ?auto_558070 - PLACE
      ?auto_558067 - HOIST
      ?auto_558069 - SURFACE
      ?auto_558066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_558068 ?auto_558071 ) ( IS-CRATE ?auto_558065 ) ( not ( = ?auto_558064 ?auto_558065 ) ) ( not ( = ?auto_558062 ?auto_558064 ) ) ( not ( = ?auto_558062 ?auto_558065 ) ) ( not ( = ?auto_558070 ?auto_558071 ) ) ( HOIST-AT ?auto_558067 ?auto_558070 ) ( not ( = ?auto_558068 ?auto_558067 ) ) ( AVAILABLE ?auto_558067 ) ( SURFACE-AT ?auto_558065 ?auto_558070 ) ( ON ?auto_558065 ?auto_558069 ) ( CLEAR ?auto_558065 ) ( not ( = ?auto_558064 ?auto_558069 ) ) ( not ( = ?auto_558065 ?auto_558069 ) ) ( not ( = ?auto_558062 ?auto_558069 ) ) ( TRUCK-AT ?auto_558066 ?auto_558071 ) ( SURFACE-AT ?auto_558062 ?auto_558071 ) ( CLEAR ?auto_558062 ) ( IS-CRATE ?auto_558064 ) ( AVAILABLE ?auto_558068 ) ( IN ?auto_558064 ?auto_558066 ) ( ON ?auto_558060 ?auto_558059 ) ( ON ?auto_558061 ?auto_558060 ) ( ON ?auto_558063 ?auto_558061 ) ( ON ?auto_558062 ?auto_558063 ) ( not ( = ?auto_558059 ?auto_558060 ) ) ( not ( = ?auto_558059 ?auto_558061 ) ) ( not ( = ?auto_558059 ?auto_558063 ) ) ( not ( = ?auto_558059 ?auto_558062 ) ) ( not ( = ?auto_558059 ?auto_558064 ) ) ( not ( = ?auto_558059 ?auto_558065 ) ) ( not ( = ?auto_558059 ?auto_558069 ) ) ( not ( = ?auto_558060 ?auto_558061 ) ) ( not ( = ?auto_558060 ?auto_558063 ) ) ( not ( = ?auto_558060 ?auto_558062 ) ) ( not ( = ?auto_558060 ?auto_558064 ) ) ( not ( = ?auto_558060 ?auto_558065 ) ) ( not ( = ?auto_558060 ?auto_558069 ) ) ( not ( = ?auto_558061 ?auto_558063 ) ) ( not ( = ?auto_558061 ?auto_558062 ) ) ( not ( = ?auto_558061 ?auto_558064 ) ) ( not ( = ?auto_558061 ?auto_558065 ) ) ( not ( = ?auto_558061 ?auto_558069 ) ) ( not ( = ?auto_558063 ?auto_558062 ) ) ( not ( = ?auto_558063 ?auto_558064 ) ) ( not ( = ?auto_558063 ?auto_558065 ) ) ( not ( = ?auto_558063 ?auto_558069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_558062 ?auto_558064 ?auto_558065 )
      ( MAKE-6CRATE-VERIFY ?auto_558059 ?auto_558060 ?auto_558061 ?auto_558063 ?auto_558062 ?auto_558064 ?auto_558065 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560010 - SURFACE
      ?auto_560011 - SURFACE
      ?auto_560012 - SURFACE
      ?auto_560014 - SURFACE
      ?auto_560013 - SURFACE
      ?auto_560015 - SURFACE
      ?auto_560016 - SURFACE
      ?auto_560017 - SURFACE
    )
    :vars
    (
      ?auto_560018 - HOIST
      ?auto_560019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560018 ?auto_560019 ) ( SURFACE-AT ?auto_560016 ?auto_560019 ) ( CLEAR ?auto_560016 ) ( LIFTING ?auto_560018 ?auto_560017 ) ( IS-CRATE ?auto_560017 ) ( not ( = ?auto_560016 ?auto_560017 ) ) ( ON ?auto_560011 ?auto_560010 ) ( ON ?auto_560012 ?auto_560011 ) ( ON ?auto_560014 ?auto_560012 ) ( ON ?auto_560013 ?auto_560014 ) ( ON ?auto_560015 ?auto_560013 ) ( ON ?auto_560016 ?auto_560015 ) ( not ( = ?auto_560010 ?auto_560011 ) ) ( not ( = ?auto_560010 ?auto_560012 ) ) ( not ( = ?auto_560010 ?auto_560014 ) ) ( not ( = ?auto_560010 ?auto_560013 ) ) ( not ( = ?auto_560010 ?auto_560015 ) ) ( not ( = ?auto_560010 ?auto_560016 ) ) ( not ( = ?auto_560010 ?auto_560017 ) ) ( not ( = ?auto_560011 ?auto_560012 ) ) ( not ( = ?auto_560011 ?auto_560014 ) ) ( not ( = ?auto_560011 ?auto_560013 ) ) ( not ( = ?auto_560011 ?auto_560015 ) ) ( not ( = ?auto_560011 ?auto_560016 ) ) ( not ( = ?auto_560011 ?auto_560017 ) ) ( not ( = ?auto_560012 ?auto_560014 ) ) ( not ( = ?auto_560012 ?auto_560013 ) ) ( not ( = ?auto_560012 ?auto_560015 ) ) ( not ( = ?auto_560012 ?auto_560016 ) ) ( not ( = ?auto_560012 ?auto_560017 ) ) ( not ( = ?auto_560014 ?auto_560013 ) ) ( not ( = ?auto_560014 ?auto_560015 ) ) ( not ( = ?auto_560014 ?auto_560016 ) ) ( not ( = ?auto_560014 ?auto_560017 ) ) ( not ( = ?auto_560013 ?auto_560015 ) ) ( not ( = ?auto_560013 ?auto_560016 ) ) ( not ( = ?auto_560013 ?auto_560017 ) ) ( not ( = ?auto_560015 ?auto_560016 ) ) ( not ( = ?auto_560015 ?auto_560017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_560016 ?auto_560017 )
      ( MAKE-7CRATE-VERIFY ?auto_560010 ?auto_560011 ?auto_560012 ?auto_560014 ?auto_560013 ?auto_560015 ?auto_560016 ?auto_560017 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560065 - SURFACE
      ?auto_560066 - SURFACE
      ?auto_560067 - SURFACE
      ?auto_560069 - SURFACE
      ?auto_560068 - SURFACE
      ?auto_560070 - SURFACE
      ?auto_560071 - SURFACE
      ?auto_560072 - SURFACE
    )
    :vars
    (
      ?auto_560075 - HOIST
      ?auto_560074 - PLACE
      ?auto_560073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560075 ?auto_560074 ) ( SURFACE-AT ?auto_560071 ?auto_560074 ) ( CLEAR ?auto_560071 ) ( IS-CRATE ?auto_560072 ) ( not ( = ?auto_560071 ?auto_560072 ) ) ( TRUCK-AT ?auto_560073 ?auto_560074 ) ( AVAILABLE ?auto_560075 ) ( IN ?auto_560072 ?auto_560073 ) ( ON ?auto_560071 ?auto_560070 ) ( not ( = ?auto_560070 ?auto_560071 ) ) ( not ( = ?auto_560070 ?auto_560072 ) ) ( ON ?auto_560066 ?auto_560065 ) ( ON ?auto_560067 ?auto_560066 ) ( ON ?auto_560069 ?auto_560067 ) ( ON ?auto_560068 ?auto_560069 ) ( ON ?auto_560070 ?auto_560068 ) ( not ( = ?auto_560065 ?auto_560066 ) ) ( not ( = ?auto_560065 ?auto_560067 ) ) ( not ( = ?auto_560065 ?auto_560069 ) ) ( not ( = ?auto_560065 ?auto_560068 ) ) ( not ( = ?auto_560065 ?auto_560070 ) ) ( not ( = ?auto_560065 ?auto_560071 ) ) ( not ( = ?auto_560065 ?auto_560072 ) ) ( not ( = ?auto_560066 ?auto_560067 ) ) ( not ( = ?auto_560066 ?auto_560069 ) ) ( not ( = ?auto_560066 ?auto_560068 ) ) ( not ( = ?auto_560066 ?auto_560070 ) ) ( not ( = ?auto_560066 ?auto_560071 ) ) ( not ( = ?auto_560066 ?auto_560072 ) ) ( not ( = ?auto_560067 ?auto_560069 ) ) ( not ( = ?auto_560067 ?auto_560068 ) ) ( not ( = ?auto_560067 ?auto_560070 ) ) ( not ( = ?auto_560067 ?auto_560071 ) ) ( not ( = ?auto_560067 ?auto_560072 ) ) ( not ( = ?auto_560069 ?auto_560068 ) ) ( not ( = ?auto_560069 ?auto_560070 ) ) ( not ( = ?auto_560069 ?auto_560071 ) ) ( not ( = ?auto_560069 ?auto_560072 ) ) ( not ( = ?auto_560068 ?auto_560070 ) ) ( not ( = ?auto_560068 ?auto_560071 ) ) ( not ( = ?auto_560068 ?auto_560072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560070 ?auto_560071 ?auto_560072 )
      ( MAKE-7CRATE-VERIFY ?auto_560065 ?auto_560066 ?auto_560067 ?auto_560069 ?auto_560068 ?auto_560070 ?auto_560071 ?auto_560072 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560128 - SURFACE
      ?auto_560129 - SURFACE
      ?auto_560130 - SURFACE
      ?auto_560132 - SURFACE
      ?auto_560131 - SURFACE
      ?auto_560133 - SURFACE
      ?auto_560134 - SURFACE
      ?auto_560135 - SURFACE
    )
    :vars
    (
      ?auto_560139 - HOIST
      ?auto_560137 - PLACE
      ?auto_560138 - TRUCK
      ?auto_560136 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560139 ?auto_560137 ) ( SURFACE-AT ?auto_560134 ?auto_560137 ) ( CLEAR ?auto_560134 ) ( IS-CRATE ?auto_560135 ) ( not ( = ?auto_560134 ?auto_560135 ) ) ( AVAILABLE ?auto_560139 ) ( IN ?auto_560135 ?auto_560138 ) ( ON ?auto_560134 ?auto_560133 ) ( not ( = ?auto_560133 ?auto_560134 ) ) ( not ( = ?auto_560133 ?auto_560135 ) ) ( TRUCK-AT ?auto_560138 ?auto_560136 ) ( not ( = ?auto_560136 ?auto_560137 ) ) ( ON ?auto_560129 ?auto_560128 ) ( ON ?auto_560130 ?auto_560129 ) ( ON ?auto_560132 ?auto_560130 ) ( ON ?auto_560131 ?auto_560132 ) ( ON ?auto_560133 ?auto_560131 ) ( not ( = ?auto_560128 ?auto_560129 ) ) ( not ( = ?auto_560128 ?auto_560130 ) ) ( not ( = ?auto_560128 ?auto_560132 ) ) ( not ( = ?auto_560128 ?auto_560131 ) ) ( not ( = ?auto_560128 ?auto_560133 ) ) ( not ( = ?auto_560128 ?auto_560134 ) ) ( not ( = ?auto_560128 ?auto_560135 ) ) ( not ( = ?auto_560129 ?auto_560130 ) ) ( not ( = ?auto_560129 ?auto_560132 ) ) ( not ( = ?auto_560129 ?auto_560131 ) ) ( not ( = ?auto_560129 ?auto_560133 ) ) ( not ( = ?auto_560129 ?auto_560134 ) ) ( not ( = ?auto_560129 ?auto_560135 ) ) ( not ( = ?auto_560130 ?auto_560132 ) ) ( not ( = ?auto_560130 ?auto_560131 ) ) ( not ( = ?auto_560130 ?auto_560133 ) ) ( not ( = ?auto_560130 ?auto_560134 ) ) ( not ( = ?auto_560130 ?auto_560135 ) ) ( not ( = ?auto_560132 ?auto_560131 ) ) ( not ( = ?auto_560132 ?auto_560133 ) ) ( not ( = ?auto_560132 ?auto_560134 ) ) ( not ( = ?auto_560132 ?auto_560135 ) ) ( not ( = ?auto_560131 ?auto_560133 ) ) ( not ( = ?auto_560131 ?auto_560134 ) ) ( not ( = ?auto_560131 ?auto_560135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560133 ?auto_560134 ?auto_560135 )
      ( MAKE-7CRATE-VERIFY ?auto_560128 ?auto_560129 ?auto_560130 ?auto_560132 ?auto_560131 ?auto_560133 ?auto_560134 ?auto_560135 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560198 - SURFACE
      ?auto_560199 - SURFACE
      ?auto_560200 - SURFACE
      ?auto_560202 - SURFACE
      ?auto_560201 - SURFACE
      ?auto_560203 - SURFACE
      ?auto_560204 - SURFACE
      ?auto_560205 - SURFACE
    )
    :vars
    (
      ?auto_560208 - HOIST
      ?auto_560206 - PLACE
      ?auto_560210 - TRUCK
      ?auto_560209 - PLACE
      ?auto_560207 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_560208 ?auto_560206 ) ( SURFACE-AT ?auto_560204 ?auto_560206 ) ( CLEAR ?auto_560204 ) ( IS-CRATE ?auto_560205 ) ( not ( = ?auto_560204 ?auto_560205 ) ) ( AVAILABLE ?auto_560208 ) ( ON ?auto_560204 ?auto_560203 ) ( not ( = ?auto_560203 ?auto_560204 ) ) ( not ( = ?auto_560203 ?auto_560205 ) ) ( TRUCK-AT ?auto_560210 ?auto_560209 ) ( not ( = ?auto_560209 ?auto_560206 ) ) ( HOIST-AT ?auto_560207 ?auto_560209 ) ( LIFTING ?auto_560207 ?auto_560205 ) ( not ( = ?auto_560208 ?auto_560207 ) ) ( ON ?auto_560199 ?auto_560198 ) ( ON ?auto_560200 ?auto_560199 ) ( ON ?auto_560202 ?auto_560200 ) ( ON ?auto_560201 ?auto_560202 ) ( ON ?auto_560203 ?auto_560201 ) ( not ( = ?auto_560198 ?auto_560199 ) ) ( not ( = ?auto_560198 ?auto_560200 ) ) ( not ( = ?auto_560198 ?auto_560202 ) ) ( not ( = ?auto_560198 ?auto_560201 ) ) ( not ( = ?auto_560198 ?auto_560203 ) ) ( not ( = ?auto_560198 ?auto_560204 ) ) ( not ( = ?auto_560198 ?auto_560205 ) ) ( not ( = ?auto_560199 ?auto_560200 ) ) ( not ( = ?auto_560199 ?auto_560202 ) ) ( not ( = ?auto_560199 ?auto_560201 ) ) ( not ( = ?auto_560199 ?auto_560203 ) ) ( not ( = ?auto_560199 ?auto_560204 ) ) ( not ( = ?auto_560199 ?auto_560205 ) ) ( not ( = ?auto_560200 ?auto_560202 ) ) ( not ( = ?auto_560200 ?auto_560201 ) ) ( not ( = ?auto_560200 ?auto_560203 ) ) ( not ( = ?auto_560200 ?auto_560204 ) ) ( not ( = ?auto_560200 ?auto_560205 ) ) ( not ( = ?auto_560202 ?auto_560201 ) ) ( not ( = ?auto_560202 ?auto_560203 ) ) ( not ( = ?auto_560202 ?auto_560204 ) ) ( not ( = ?auto_560202 ?auto_560205 ) ) ( not ( = ?auto_560201 ?auto_560203 ) ) ( not ( = ?auto_560201 ?auto_560204 ) ) ( not ( = ?auto_560201 ?auto_560205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560203 ?auto_560204 ?auto_560205 )
      ( MAKE-7CRATE-VERIFY ?auto_560198 ?auto_560199 ?auto_560200 ?auto_560202 ?auto_560201 ?auto_560203 ?auto_560204 ?auto_560205 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560275 - SURFACE
      ?auto_560276 - SURFACE
      ?auto_560277 - SURFACE
      ?auto_560279 - SURFACE
      ?auto_560278 - SURFACE
      ?auto_560280 - SURFACE
      ?auto_560281 - SURFACE
      ?auto_560282 - SURFACE
    )
    :vars
    (
      ?auto_560285 - HOIST
      ?auto_560287 - PLACE
      ?auto_560286 - TRUCK
      ?auto_560288 - PLACE
      ?auto_560283 - HOIST
      ?auto_560284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560285 ?auto_560287 ) ( SURFACE-AT ?auto_560281 ?auto_560287 ) ( CLEAR ?auto_560281 ) ( IS-CRATE ?auto_560282 ) ( not ( = ?auto_560281 ?auto_560282 ) ) ( AVAILABLE ?auto_560285 ) ( ON ?auto_560281 ?auto_560280 ) ( not ( = ?auto_560280 ?auto_560281 ) ) ( not ( = ?auto_560280 ?auto_560282 ) ) ( TRUCK-AT ?auto_560286 ?auto_560288 ) ( not ( = ?auto_560288 ?auto_560287 ) ) ( HOIST-AT ?auto_560283 ?auto_560288 ) ( not ( = ?auto_560285 ?auto_560283 ) ) ( AVAILABLE ?auto_560283 ) ( SURFACE-AT ?auto_560282 ?auto_560288 ) ( ON ?auto_560282 ?auto_560284 ) ( CLEAR ?auto_560282 ) ( not ( = ?auto_560281 ?auto_560284 ) ) ( not ( = ?auto_560282 ?auto_560284 ) ) ( not ( = ?auto_560280 ?auto_560284 ) ) ( ON ?auto_560276 ?auto_560275 ) ( ON ?auto_560277 ?auto_560276 ) ( ON ?auto_560279 ?auto_560277 ) ( ON ?auto_560278 ?auto_560279 ) ( ON ?auto_560280 ?auto_560278 ) ( not ( = ?auto_560275 ?auto_560276 ) ) ( not ( = ?auto_560275 ?auto_560277 ) ) ( not ( = ?auto_560275 ?auto_560279 ) ) ( not ( = ?auto_560275 ?auto_560278 ) ) ( not ( = ?auto_560275 ?auto_560280 ) ) ( not ( = ?auto_560275 ?auto_560281 ) ) ( not ( = ?auto_560275 ?auto_560282 ) ) ( not ( = ?auto_560275 ?auto_560284 ) ) ( not ( = ?auto_560276 ?auto_560277 ) ) ( not ( = ?auto_560276 ?auto_560279 ) ) ( not ( = ?auto_560276 ?auto_560278 ) ) ( not ( = ?auto_560276 ?auto_560280 ) ) ( not ( = ?auto_560276 ?auto_560281 ) ) ( not ( = ?auto_560276 ?auto_560282 ) ) ( not ( = ?auto_560276 ?auto_560284 ) ) ( not ( = ?auto_560277 ?auto_560279 ) ) ( not ( = ?auto_560277 ?auto_560278 ) ) ( not ( = ?auto_560277 ?auto_560280 ) ) ( not ( = ?auto_560277 ?auto_560281 ) ) ( not ( = ?auto_560277 ?auto_560282 ) ) ( not ( = ?auto_560277 ?auto_560284 ) ) ( not ( = ?auto_560279 ?auto_560278 ) ) ( not ( = ?auto_560279 ?auto_560280 ) ) ( not ( = ?auto_560279 ?auto_560281 ) ) ( not ( = ?auto_560279 ?auto_560282 ) ) ( not ( = ?auto_560279 ?auto_560284 ) ) ( not ( = ?auto_560278 ?auto_560280 ) ) ( not ( = ?auto_560278 ?auto_560281 ) ) ( not ( = ?auto_560278 ?auto_560282 ) ) ( not ( = ?auto_560278 ?auto_560284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560280 ?auto_560281 ?auto_560282 )
      ( MAKE-7CRATE-VERIFY ?auto_560275 ?auto_560276 ?auto_560277 ?auto_560279 ?auto_560278 ?auto_560280 ?auto_560281 ?auto_560282 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560353 - SURFACE
      ?auto_560354 - SURFACE
      ?auto_560355 - SURFACE
      ?auto_560357 - SURFACE
      ?auto_560356 - SURFACE
      ?auto_560358 - SURFACE
      ?auto_560359 - SURFACE
      ?auto_560360 - SURFACE
    )
    :vars
    (
      ?auto_560365 - HOIST
      ?auto_560364 - PLACE
      ?auto_560361 - PLACE
      ?auto_560363 - HOIST
      ?auto_560362 - SURFACE
      ?auto_560366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560365 ?auto_560364 ) ( SURFACE-AT ?auto_560359 ?auto_560364 ) ( CLEAR ?auto_560359 ) ( IS-CRATE ?auto_560360 ) ( not ( = ?auto_560359 ?auto_560360 ) ) ( AVAILABLE ?auto_560365 ) ( ON ?auto_560359 ?auto_560358 ) ( not ( = ?auto_560358 ?auto_560359 ) ) ( not ( = ?auto_560358 ?auto_560360 ) ) ( not ( = ?auto_560361 ?auto_560364 ) ) ( HOIST-AT ?auto_560363 ?auto_560361 ) ( not ( = ?auto_560365 ?auto_560363 ) ) ( AVAILABLE ?auto_560363 ) ( SURFACE-AT ?auto_560360 ?auto_560361 ) ( ON ?auto_560360 ?auto_560362 ) ( CLEAR ?auto_560360 ) ( not ( = ?auto_560359 ?auto_560362 ) ) ( not ( = ?auto_560360 ?auto_560362 ) ) ( not ( = ?auto_560358 ?auto_560362 ) ) ( TRUCK-AT ?auto_560366 ?auto_560364 ) ( ON ?auto_560354 ?auto_560353 ) ( ON ?auto_560355 ?auto_560354 ) ( ON ?auto_560357 ?auto_560355 ) ( ON ?auto_560356 ?auto_560357 ) ( ON ?auto_560358 ?auto_560356 ) ( not ( = ?auto_560353 ?auto_560354 ) ) ( not ( = ?auto_560353 ?auto_560355 ) ) ( not ( = ?auto_560353 ?auto_560357 ) ) ( not ( = ?auto_560353 ?auto_560356 ) ) ( not ( = ?auto_560353 ?auto_560358 ) ) ( not ( = ?auto_560353 ?auto_560359 ) ) ( not ( = ?auto_560353 ?auto_560360 ) ) ( not ( = ?auto_560353 ?auto_560362 ) ) ( not ( = ?auto_560354 ?auto_560355 ) ) ( not ( = ?auto_560354 ?auto_560357 ) ) ( not ( = ?auto_560354 ?auto_560356 ) ) ( not ( = ?auto_560354 ?auto_560358 ) ) ( not ( = ?auto_560354 ?auto_560359 ) ) ( not ( = ?auto_560354 ?auto_560360 ) ) ( not ( = ?auto_560354 ?auto_560362 ) ) ( not ( = ?auto_560355 ?auto_560357 ) ) ( not ( = ?auto_560355 ?auto_560356 ) ) ( not ( = ?auto_560355 ?auto_560358 ) ) ( not ( = ?auto_560355 ?auto_560359 ) ) ( not ( = ?auto_560355 ?auto_560360 ) ) ( not ( = ?auto_560355 ?auto_560362 ) ) ( not ( = ?auto_560357 ?auto_560356 ) ) ( not ( = ?auto_560357 ?auto_560358 ) ) ( not ( = ?auto_560357 ?auto_560359 ) ) ( not ( = ?auto_560357 ?auto_560360 ) ) ( not ( = ?auto_560357 ?auto_560362 ) ) ( not ( = ?auto_560356 ?auto_560358 ) ) ( not ( = ?auto_560356 ?auto_560359 ) ) ( not ( = ?auto_560356 ?auto_560360 ) ) ( not ( = ?auto_560356 ?auto_560362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560358 ?auto_560359 ?auto_560360 )
      ( MAKE-7CRATE-VERIFY ?auto_560353 ?auto_560354 ?auto_560355 ?auto_560357 ?auto_560356 ?auto_560358 ?auto_560359 ?auto_560360 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560431 - SURFACE
      ?auto_560432 - SURFACE
      ?auto_560433 - SURFACE
      ?auto_560435 - SURFACE
      ?auto_560434 - SURFACE
      ?auto_560436 - SURFACE
      ?auto_560437 - SURFACE
      ?auto_560438 - SURFACE
    )
    :vars
    (
      ?auto_560442 - HOIST
      ?auto_560443 - PLACE
      ?auto_560439 - PLACE
      ?auto_560444 - HOIST
      ?auto_560440 - SURFACE
      ?auto_560441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560442 ?auto_560443 ) ( IS-CRATE ?auto_560438 ) ( not ( = ?auto_560437 ?auto_560438 ) ) ( not ( = ?auto_560436 ?auto_560437 ) ) ( not ( = ?auto_560436 ?auto_560438 ) ) ( not ( = ?auto_560439 ?auto_560443 ) ) ( HOIST-AT ?auto_560444 ?auto_560439 ) ( not ( = ?auto_560442 ?auto_560444 ) ) ( AVAILABLE ?auto_560444 ) ( SURFACE-AT ?auto_560438 ?auto_560439 ) ( ON ?auto_560438 ?auto_560440 ) ( CLEAR ?auto_560438 ) ( not ( = ?auto_560437 ?auto_560440 ) ) ( not ( = ?auto_560438 ?auto_560440 ) ) ( not ( = ?auto_560436 ?auto_560440 ) ) ( TRUCK-AT ?auto_560441 ?auto_560443 ) ( SURFACE-AT ?auto_560436 ?auto_560443 ) ( CLEAR ?auto_560436 ) ( LIFTING ?auto_560442 ?auto_560437 ) ( IS-CRATE ?auto_560437 ) ( ON ?auto_560432 ?auto_560431 ) ( ON ?auto_560433 ?auto_560432 ) ( ON ?auto_560435 ?auto_560433 ) ( ON ?auto_560434 ?auto_560435 ) ( ON ?auto_560436 ?auto_560434 ) ( not ( = ?auto_560431 ?auto_560432 ) ) ( not ( = ?auto_560431 ?auto_560433 ) ) ( not ( = ?auto_560431 ?auto_560435 ) ) ( not ( = ?auto_560431 ?auto_560434 ) ) ( not ( = ?auto_560431 ?auto_560436 ) ) ( not ( = ?auto_560431 ?auto_560437 ) ) ( not ( = ?auto_560431 ?auto_560438 ) ) ( not ( = ?auto_560431 ?auto_560440 ) ) ( not ( = ?auto_560432 ?auto_560433 ) ) ( not ( = ?auto_560432 ?auto_560435 ) ) ( not ( = ?auto_560432 ?auto_560434 ) ) ( not ( = ?auto_560432 ?auto_560436 ) ) ( not ( = ?auto_560432 ?auto_560437 ) ) ( not ( = ?auto_560432 ?auto_560438 ) ) ( not ( = ?auto_560432 ?auto_560440 ) ) ( not ( = ?auto_560433 ?auto_560435 ) ) ( not ( = ?auto_560433 ?auto_560434 ) ) ( not ( = ?auto_560433 ?auto_560436 ) ) ( not ( = ?auto_560433 ?auto_560437 ) ) ( not ( = ?auto_560433 ?auto_560438 ) ) ( not ( = ?auto_560433 ?auto_560440 ) ) ( not ( = ?auto_560435 ?auto_560434 ) ) ( not ( = ?auto_560435 ?auto_560436 ) ) ( not ( = ?auto_560435 ?auto_560437 ) ) ( not ( = ?auto_560435 ?auto_560438 ) ) ( not ( = ?auto_560435 ?auto_560440 ) ) ( not ( = ?auto_560434 ?auto_560436 ) ) ( not ( = ?auto_560434 ?auto_560437 ) ) ( not ( = ?auto_560434 ?auto_560438 ) ) ( not ( = ?auto_560434 ?auto_560440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560436 ?auto_560437 ?auto_560438 )
      ( MAKE-7CRATE-VERIFY ?auto_560431 ?auto_560432 ?auto_560433 ?auto_560435 ?auto_560434 ?auto_560436 ?auto_560437 ?auto_560438 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_560509 - SURFACE
      ?auto_560510 - SURFACE
      ?auto_560511 - SURFACE
      ?auto_560513 - SURFACE
      ?auto_560512 - SURFACE
      ?auto_560514 - SURFACE
      ?auto_560515 - SURFACE
      ?auto_560516 - SURFACE
    )
    :vars
    (
      ?auto_560521 - HOIST
      ?auto_560519 - PLACE
      ?auto_560522 - PLACE
      ?auto_560518 - HOIST
      ?auto_560520 - SURFACE
      ?auto_560517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_560521 ?auto_560519 ) ( IS-CRATE ?auto_560516 ) ( not ( = ?auto_560515 ?auto_560516 ) ) ( not ( = ?auto_560514 ?auto_560515 ) ) ( not ( = ?auto_560514 ?auto_560516 ) ) ( not ( = ?auto_560522 ?auto_560519 ) ) ( HOIST-AT ?auto_560518 ?auto_560522 ) ( not ( = ?auto_560521 ?auto_560518 ) ) ( AVAILABLE ?auto_560518 ) ( SURFACE-AT ?auto_560516 ?auto_560522 ) ( ON ?auto_560516 ?auto_560520 ) ( CLEAR ?auto_560516 ) ( not ( = ?auto_560515 ?auto_560520 ) ) ( not ( = ?auto_560516 ?auto_560520 ) ) ( not ( = ?auto_560514 ?auto_560520 ) ) ( TRUCK-AT ?auto_560517 ?auto_560519 ) ( SURFACE-AT ?auto_560514 ?auto_560519 ) ( CLEAR ?auto_560514 ) ( IS-CRATE ?auto_560515 ) ( AVAILABLE ?auto_560521 ) ( IN ?auto_560515 ?auto_560517 ) ( ON ?auto_560510 ?auto_560509 ) ( ON ?auto_560511 ?auto_560510 ) ( ON ?auto_560513 ?auto_560511 ) ( ON ?auto_560512 ?auto_560513 ) ( ON ?auto_560514 ?auto_560512 ) ( not ( = ?auto_560509 ?auto_560510 ) ) ( not ( = ?auto_560509 ?auto_560511 ) ) ( not ( = ?auto_560509 ?auto_560513 ) ) ( not ( = ?auto_560509 ?auto_560512 ) ) ( not ( = ?auto_560509 ?auto_560514 ) ) ( not ( = ?auto_560509 ?auto_560515 ) ) ( not ( = ?auto_560509 ?auto_560516 ) ) ( not ( = ?auto_560509 ?auto_560520 ) ) ( not ( = ?auto_560510 ?auto_560511 ) ) ( not ( = ?auto_560510 ?auto_560513 ) ) ( not ( = ?auto_560510 ?auto_560512 ) ) ( not ( = ?auto_560510 ?auto_560514 ) ) ( not ( = ?auto_560510 ?auto_560515 ) ) ( not ( = ?auto_560510 ?auto_560516 ) ) ( not ( = ?auto_560510 ?auto_560520 ) ) ( not ( = ?auto_560511 ?auto_560513 ) ) ( not ( = ?auto_560511 ?auto_560512 ) ) ( not ( = ?auto_560511 ?auto_560514 ) ) ( not ( = ?auto_560511 ?auto_560515 ) ) ( not ( = ?auto_560511 ?auto_560516 ) ) ( not ( = ?auto_560511 ?auto_560520 ) ) ( not ( = ?auto_560513 ?auto_560512 ) ) ( not ( = ?auto_560513 ?auto_560514 ) ) ( not ( = ?auto_560513 ?auto_560515 ) ) ( not ( = ?auto_560513 ?auto_560516 ) ) ( not ( = ?auto_560513 ?auto_560520 ) ) ( not ( = ?auto_560512 ?auto_560514 ) ) ( not ( = ?auto_560512 ?auto_560515 ) ) ( not ( = ?auto_560512 ?auto_560516 ) ) ( not ( = ?auto_560512 ?auto_560520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_560514 ?auto_560515 ?auto_560516 )
      ( MAKE-7CRATE-VERIFY ?auto_560509 ?auto_560510 ?auto_560511 ?auto_560513 ?auto_560512 ?auto_560514 ?auto_560515 ?auto_560516 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563398 - SURFACE
      ?auto_563399 - SURFACE
      ?auto_563400 - SURFACE
      ?auto_563402 - SURFACE
      ?auto_563401 - SURFACE
      ?auto_563403 - SURFACE
      ?auto_563404 - SURFACE
      ?auto_563405 - SURFACE
      ?auto_563406 - SURFACE
    )
    :vars
    (
      ?auto_563408 - HOIST
      ?auto_563407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_563408 ?auto_563407 ) ( SURFACE-AT ?auto_563405 ?auto_563407 ) ( CLEAR ?auto_563405 ) ( LIFTING ?auto_563408 ?auto_563406 ) ( IS-CRATE ?auto_563406 ) ( not ( = ?auto_563405 ?auto_563406 ) ) ( ON ?auto_563399 ?auto_563398 ) ( ON ?auto_563400 ?auto_563399 ) ( ON ?auto_563402 ?auto_563400 ) ( ON ?auto_563401 ?auto_563402 ) ( ON ?auto_563403 ?auto_563401 ) ( ON ?auto_563404 ?auto_563403 ) ( ON ?auto_563405 ?auto_563404 ) ( not ( = ?auto_563398 ?auto_563399 ) ) ( not ( = ?auto_563398 ?auto_563400 ) ) ( not ( = ?auto_563398 ?auto_563402 ) ) ( not ( = ?auto_563398 ?auto_563401 ) ) ( not ( = ?auto_563398 ?auto_563403 ) ) ( not ( = ?auto_563398 ?auto_563404 ) ) ( not ( = ?auto_563398 ?auto_563405 ) ) ( not ( = ?auto_563398 ?auto_563406 ) ) ( not ( = ?auto_563399 ?auto_563400 ) ) ( not ( = ?auto_563399 ?auto_563402 ) ) ( not ( = ?auto_563399 ?auto_563401 ) ) ( not ( = ?auto_563399 ?auto_563403 ) ) ( not ( = ?auto_563399 ?auto_563404 ) ) ( not ( = ?auto_563399 ?auto_563405 ) ) ( not ( = ?auto_563399 ?auto_563406 ) ) ( not ( = ?auto_563400 ?auto_563402 ) ) ( not ( = ?auto_563400 ?auto_563401 ) ) ( not ( = ?auto_563400 ?auto_563403 ) ) ( not ( = ?auto_563400 ?auto_563404 ) ) ( not ( = ?auto_563400 ?auto_563405 ) ) ( not ( = ?auto_563400 ?auto_563406 ) ) ( not ( = ?auto_563402 ?auto_563401 ) ) ( not ( = ?auto_563402 ?auto_563403 ) ) ( not ( = ?auto_563402 ?auto_563404 ) ) ( not ( = ?auto_563402 ?auto_563405 ) ) ( not ( = ?auto_563402 ?auto_563406 ) ) ( not ( = ?auto_563401 ?auto_563403 ) ) ( not ( = ?auto_563401 ?auto_563404 ) ) ( not ( = ?auto_563401 ?auto_563405 ) ) ( not ( = ?auto_563401 ?auto_563406 ) ) ( not ( = ?auto_563403 ?auto_563404 ) ) ( not ( = ?auto_563403 ?auto_563405 ) ) ( not ( = ?auto_563403 ?auto_563406 ) ) ( not ( = ?auto_563404 ?auto_563405 ) ) ( not ( = ?auto_563404 ?auto_563406 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_563405 ?auto_563406 )
      ( MAKE-8CRATE-VERIFY ?auto_563398 ?auto_563399 ?auto_563400 ?auto_563402 ?auto_563401 ?auto_563403 ?auto_563404 ?auto_563405 ?auto_563406 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563465 - SURFACE
      ?auto_563466 - SURFACE
      ?auto_563467 - SURFACE
      ?auto_563469 - SURFACE
      ?auto_563468 - SURFACE
      ?auto_563470 - SURFACE
      ?auto_563471 - SURFACE
      ?auto_563472 - SURFACE
      ?auto_563473 - SURFACE
    )
    :vars
    (
      ?auto_563475 - HOIST
      ?auto_563476 - PLACE
      ?auto_563474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_563475 ?auto_563476 ) ( SURFACE-AT ?auto_563472 ?auto_563476 ) ( CLEAR ?auto_563472 ) ( IS-CRATE ?auto_563473 ) ( not ( = ?auto_563472 ?auto_563473 ) ) ( TRUCK-AT ?auto_563474 ?auto_563476 ) ( AVAILABLE ?auto_563475 ) ( IN ?auto_563473 ?auto_563474 ) ( ON ?auto_563472 ?auto_563471 ) ( not ( = ?auto_563471 ?auto_563472 ) ) ( not ( = ?auto_563471 ?auto_563473 ) ) ( ON ?auto_563466 ?auto_563465 ) ( ON ?auto_563467 ?auto_563466 ) ( ON ?auto_563469 ?auto_563467 ) ( ON ?auto_563468 ?auto_563469 ) ( ON ?auto_563470 ?auto_563468 ) ( ON ?auto_563471 ?auto_563470 ) ( not ( = ?auto_563465 ?auto_563466 ) ) ( not ( = ?auto_563465 ?auto_563467 ) ) ( not ( = ?auto_563465 ?auto_563469 ) ) ( not ( = ?auto_563465 ?auto_563468 ) ) ( not ( = ?auto_563465 ?auto_563470 ) ) ( not ( = ?auto_563465 ?auto_563471 ) ) ( not ( = ?auto_563465 ?auto_563472 ) ) ( not ( = ?auto_563465 ?auto_563473 ) ) ( not ( = ?auto_563466 ?auto_563467 ) ) ( not ( = ?auto_563466 ?auto_563469 ) ) ( not ( = ?auto_563466 ?auto_563468 ) ) ( not ( = ?auto_563466 ?auto_563470 ) ) ( not ( = ?auto_563466 ?auto_563471 ) ) ( not ( = ?auto_563466 ?auto_563472 ) ) ( not ( = ?auto_563466 ?auto_563473 ) ) ( not ( = ?auto_563467 ?auto_563469 ) ) ( not ( = ?auto_563467 ?auto_563468 ) ) ( not ( = ?auto_563467 ?auto_563470 ) ) ( not ( = ?auto_563467 ?auto_563471 ) ) ( not ( = ?auto_563467 ?auto_563472 ) ) ( not ( = ?auto_563467 ?auto_563473 ) ) ( not ( = ?auto_563469 ?auto_563468 ) ) ( not ( = ?auto_563469 ?auto_563470 ) ) ( not ( = ?auto_563469 ?auto_563471 ) ) ( not ( = ?auto_563469 ?auto_563472 ) ) ( not ( = ?auto_563469 ?auto_563473 ) ) ( not ( = ?auto_563468 ?auto_563470 ) ) ( not ( = ?auto_563468 ?auto_563471 ) ) ( not ( = ?auto_563468 ?auto_563472 ) ) ( not ( = ?auto_563468 ?auto_563473 ) ) ( not ( = ?auto_563470 ?auto_563471 ) ) ( not ( = ?auto_563470 ?auto_563472 ) ) ( not ( = ?auto_563470 ?auto_563473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563471 ?auto_563472 ?auto_563473 )
      ( MAKE-8CRATE-VERIFY ?auto_563465 ?auto_563466 ?auto_563467 ?auto_563469 ?auto_563468 ?auto_563470 ?auto_563471 ?auto_563472 ?auto_563473 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563541 - SURFACE
      ?auto_563542 - SURFACE
      ?auto_563543 - SURFACE
      ?auto_563545 - SURFACE
      ?auto_563544 - SURFACE
      ?auto_563546 - SURFACE
      ?auto_563547 - SURFACE
      ?auto_563548 - SURFACE
      ?auto_563549 - SURFACE
    )
    :vars
    (
      ?auto_563553 - HOIST
      ?auto_563550 - PLACE
      ?auto_563552 - TRUCK
      ?auto_563551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_563553 ?auto_563550 ) ( SURFACE-AT ?auto_563548 ?auto_563550 ) ( CLEAR ?auto_563548 ) ( IS-CRATE ?auto_563549 ) ( not ( = ?auto_563548 ?auto_563549 ) ) ( AVAILABLE ?auto_563553 ) ( IN ?auto_563549 ?auto_563552 ) ( ON ?auto_563548 ?auto_563547 ) ( not ( = ?auto_563547 ?auto_563548 ) ) ( not ( = ?auto_563547 ?auto_563549 ) ) ( TRUCK-AT ?auto_563552 ?auto_563551 ) ( not ( = ?auto_563551 ?auto_563550 ) ) ( ON ?auto_563542 ?auto_563541 ) ( ON ?auto_563543 ?auto_563542 ) ( ON ?auto_563545 ?auto_563543 ) ( ON ?auto_563544 ?auto_563545 ) ( ON ?auto_563546 ?auto_563544 ) ( ON ?auto_563547 ?auto_563546 ) ( not ( = ?auto_563541 ?auto_563542 ) ) ( not ( = ?auto_563541 ?auto_563543 ) ) ( not ( = ?auto_563541 ?auto_563545 ) ) ( not ( = ?auto_563541 ?auto_563544 ) ) ( not ( = ?auto_563541 ?auto_563546 ) ) ( not ( = ?auto_563541 ?auto_563547 ) ) ( not ( = ?auto_563541 ?auto_563548 ) ) ( not ( = ?auto_563541 ?auto_563549 ) ) ( not ( = ?auto_563542 ?auto_563543 ) ) ( not ( = ?auto_563542 ?auto_563545 ) ) ( not ( = ?auto_563542 ?auto_563544 ) ) ( not ( = ?auto_563542 ?auto_563546 ) ) ( not ( = ?auto_563542 ?auto_563547 ) ) ( not ( = ?auto_563542 ?auto_563548 ) ) ( not ( = ?auto_563542 ?auto_563549 ) ) ( not ( = ?auto_563543 ?auto_563545 ) ) ( not ( = ?auto_563543 ?auto_563544 ) ) ( not ( = ?auto_563543 ?auto_563546 ) ) ( not ( = ?auto_563543 ?auto_563547 ) ) ( not ( = ?auto_563543 ?auto_563548 ) ) ( not ( = ?auto_563543 ?auto_563549 ) ) ( not ( = ?auto_563545 ?auto_563544 ) ) ( not ( = ?auto_563545 ?auto_563546 ) ) ( not ( = ?auto_563545 ?auto_563547 ) ) ( not ( = ?auto_563545 ?auto_563548 ) ) ( not ( = ?auto_563545 ?auto_563549 ) ) ( not ( = ?auto_563544 ?auto_563546 ) ) ( not ( = ?auto_563544 ?auto_563547 ) ) ( not ( = ?auto_563544 ?auto_563548 ) ) ( not ( = ?auto_563544 ?auto_563549 ) ) ( not ( = ?auto_563546 ?auto_563547 ) ) ( not ( = ?auto_563546 ?auto_563548 ) ) ( not ( = ?auto_563546 ?auto_563549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563547 ?auto_563548 ?auto_563549 )
      ( MAKE-8CRATE-VERIFY ?auto_563541 ?auto_563542 ?auto_563543 ?auto_563545 ?auto_563544 ?auto_563546 ?auto_563547 ?auto_563548 ?auto_563549 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563625 - SURFACE
      ?auto_563626 - SURFACE
      ?auto_563627 - SURFACE
      ?auto_563629 - SURFACE
      ?auto_563628 - SURFACE
      ?auto_563630 - SURFACE
      ?auto_563631 - SURFACE
      ?auto_563632 - SURFACE
      ?auto_563633 - SURFACE
    )
    :vars
    (
      ?auto_563635 - HOIST
      ?auto_563637 - PLACE
      ?auto_563634 - TRUCK
      ?auto_563638 - PLACE
      ?auto_563636 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_563635 ?auto_563637 ) ( SURFACE-AT ?auto_563632 ?auto_563637 ) ( CLEAR ?auto_563632 ) ( IS-CRATE ?auto_563633 ) ( not ( = ?auto_563632 ?auto_563633 ) ) ( AVAILABLE ?auto_563635 ) ( ON ?auto_563632 ?auto_563631 ) ( not ( = ?auto_563631 ?auto_563632 ) ) ( not ( = ?auto_563631 ?auto_563633 ) ) ( TRUCK-AT ?auto_563634 ?auto_563638 ) ( not ( = ?auto_563638 ?auto_563637 ) ) ( HOIST-AT ?auto_563636 ?auto_563638 ) ( LIFTING ?auto_563636 ?auto_563633 ) ( not ( = ?auto_563635 ?auto_563636 ) ) ( ON ?auto_563626 ?auto_563625 ) ( ON ?auto_563627 ?auto_563626 ) ( ON ?auto_563629 ?auto_563627 ) ( ON ?auto_563628 ?auto_563629 ) ( ON ?auto_563630 ?auto_563628 ) ( ON ?auto_563631 ?auto_563630 ) ( not ( = ?auto_563625 ?auto_563626 ) ) ( not ( = ?auto_563625 ?auto_563627 ) ) ( not ( = ?auto_563625 ?auto_563629 ) ) ( not ( = ?auto_563625 ?auto_563628 ) ) ( not ( = ?auto_563625 ?auto_563630 ) ) ( not ( = ?auto_563625 ?auto_563631 ) ) ( not ( = ?auto_563625 ?auto_563632 ) ) ( not ( = ?auto_563625 ?auto_563633 ) ) ( not ( = ?auto_563626 ?auto_563627 ) ) ( not ( = ?auto_563626 ?auto_563629 ) ) ( not ( = ?auto_563626 ?auto_563628 ) ) ( not ( = ?auto_563626 ?auto_563630 ) ) ( not ( = ?auto_563626 ?auto_563631 ) ) ( not ( = ?auto_563626 ?auto_563632 ) ) ( not ( = ?auto_563626 ?auto_563633 ) ) ( not ( = ?auto_563627 ?auto_563629 ) ) ( not ( = ?auto_563627 ?auto_563628 ) ) ( not ( = ?auto_563627 ?auto_563630 ) ) ( not ( = ?auto_563627 ?auto_563631 ) ) ( not ( = ?auto_563627 ?auto_563632 ) ) ( not ( = ?auto_563627 ?auto_563633 ) ) ( not ( = ?auto_563629 ?auto_563628 ) ) ( not ( = ?auto_563629 ?auto_563630 ) ) ( not ( = ?auto_563629 ?auto_563631 ) ) ( not ( = ?auto_563629 ?auto_563632 ) ) ( not ( = ?auto_563629 ?auto_563633 ) ) ( not ( = ?auto_563628 ?auto_563630 ) ) ( not ( = ?auto_563628 ?auto_563631 ) ) ( not ( = ?auto_563628 ?auto_563632 ) ) ( not ( = ?auto_563628 ?auto_563633 ) ) ( not ( = ?auto_563630 ?auto_563631 ) ) ( not ( = ?auto_563630 ?auto_563632 ) ) ( not ( = ?auto_563630 ?auto_563633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563631 ?auto_563632 ?auto_563633 )
      ( MAKE-8CRATE-VERIFY ?auto_563625 ?auto_563626 ?auto_563627 ?auto_563629 ?auto_563628 ?auto_563630 ?auto_563631 ?auto_563632 ?auto_563633 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563717 - SURFACE
      ?auto_563718 - SURFACE
      ?auto_563719 - SURFACE
      ?auto_563721 - SURFACE
      ?auto_563720 - SURFACE
      ?auto_563722 - SURFACE
      ?auto_563723 - SURFACE
      ?auto_563724 - SURFACE
      ?auto_563725 - SURFACE
    )
    :vars
    (
      ?auto_563726 - HOIST
      ?auto_563729 - PLACE
      ?auto_563728 - TRUCK
      ?auto_563730 - PLACE
      ?auto_563731 - HOIST
      ?auto_563727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_563726 ?auto_563729 ) ( SURFACE-AT ?auto_563724 ?auto_563729 ) ( CLEAR ?auto_563724 ) ( IS-CRATE ?auto_563725 ) ( not ( = ?auto_563724 ?auto_563725 ) ) ( AVAILABLE ?auto_563726 ) ( ON ?auto_563724 ?auto_563723 ) ( not ( = ?auto_563723 ?auto_563724 ) ) ( not ( = ?auto_563723 ?auto_563725 ) ) ( TRUCK-AT ?auto_563728 ?auto_563730 ) ( not ( = ?auto_563730 ?auto_563729 ) ) ( HOIST-AT ?auto_563731 ?auto_563730 ) ( not ( = ?auto_563726 ?auto_563731 ) ) ( AVAILABLE ?auto_563731 ) ( SURFACE-AT ?auto_563725 ?auto_563730 ) ( ON ?auto_563725 ?auto_563727 ) ( CLEAR ?auto_563725 ) ( not ( = ?auto_563724 ?auto_563727 ) ) ( not ( = ?auto_563725 ?auto_563727 ) ) ( not ( = ?auto_563723 ?auto_563727 ) ) ( ON ?auto_563718 ?auto_563717 ) ( ON ?auto_563719 ?auto_563718 ) ( ON ?auto_563721 ?auto_563719 ) ( ON ?auto_563720 ?auto_563721 ) ( ON ?auto_563722 ?auto_563720 ) ( ON ?auto_563723 ?auto_563722 ) ( not ( = ?auto_563717 ?auto_563718 ) ) ( not ( = ?auto_563717 ?auto_563719 ) ) ( not ( = ?auto_563717 ?auto_563721 ) ) ( not ( = ?auto_563717 ?auto_563720 ) ) ( not ( = ?auto_563717 ?auto_563722 ) ) ( not ( = ?auto_563717 ?auto_563723 ) ) ( not ( = ?auto_563717 ?auto_563724 ) ) ( not ( = ?auto_563717 ?auto_563725 ) ) ( not ( = ?auto_563717 ?auto_563727 ) ) ( not ( = ?auto_563718 ?auto_563719 ) ) ( not ( = ?auto_563718 ?auto_563721 ) ) ( not ( = ?auto_563718 ?auto_563720 ) ) ( not ( = ?auto_563718 ?auto_563722 ) ) ( not ( = ?auto_563718 ?auto_563723 ) ) ( not ( = ?auto_563718 ?auto_563724 ) ) ( not ( = ?auto_563718 ?auto_563725 ) ) ( not ( = ?auto_563718 ?auto_563727 ) ) ( not ( = ?auto_563719 ?auto_563721 ) ) ( not ( = ?auto_563719 ?auto_563720 ) ) ( not ( = ?auto_563719 ?auto_563722 ) ) ( not ( = ?auto_563719 ?auto_563723 ) ) ( not ( = ?auto_563719 ?auto_563724 ) ) ( not ( = ?auto_563719 ?auto_563725 ) ) ( not ( = ?auto_563719 ?auto_563727 ) ) ( not ( = ?auto_563721 ?auto_563720 ) ) ( not ( = ?auto_563721 ?auto_563722 ) ) ( not ( = ?auto_563721 ?auto_563723 ) ) ( not ( = ?auto_563721 ?auto_563724 ) ) ( not ( = ?auto_563721 ?auto_563725 ) ) ( not ( = ?auto_563721 ?auto_563727 ) ) ( not ( = ?auto_563720 ?auto_563722 ) ) ( not ( = ?auto_563720 ?auto_563723 ) ) ( not ( = ?auto_563720 ?auto_563724 ) ) ( not ( = ?auto_563720 ?auto_563725 ) ) ( not ( = ?auto_563720 ?auto_563727 ) ) ( not ( = ?auto_563722 ?auto_563723 ) ) ( not ( = ?auto_563722 ?auto_563724 ) ) ( not ( = ?auto_563722 ?auto_563725 ) ) ( not ( = ?auto_563722 ?auto_563727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563723 ?auto_563724 ?auto_563725 )
      ( MAKE-8CRATE-VERIFY ?auto_563717 ?auto_563718 ?auto_563719 ?auto_563721 ?auto_563720 ?auto_563722 ?auto_563723 ?auto_563724 ?auto_563725 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563810 - SURFACE
      ?auto_563811 - SURFACE
      ?auto_563812 - SURFACE
      ?auto_563814 - SURFACE
      ?auto_563813 - SURFACE
      ?auto_563815 - SURFACE
      ?auto_563816 - SURFACE
      ?auto_563817 - SURFACE
      ?auto_563818 - SURFACE
    )
    :vars
    (
      ?auto_563821 - HOIST
      ?auto_563824 - PLACE
      ?auto_563822 - PLACE
      ?auto_563823 - HOIST
      ?auto_563820 - SURFACE
      ?auto_563819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_563821 ?auto_563824 ) ( SURFACE-AT ?auto_563817 ?auto_563824 ) ( CLEAR ?auto_563817 ) ( IS-CRATE ?auto_563818 ) ( not ( = ?auto_563817 ?auto_563818 ) ) ( AVAILABLE ?auto_563821 ) ( ON ?auto_563817 ?auto_563816 ) ( not ( = ?auto_563816 ?auto_563817 ) ) ( not ( = ?auto_563816 ?auto_563818 ) ) ( not ( = ?auto_563822 ?auto_563824 ) ) ( HOIST-AT ?auto_563823 ?auto_563822 ) ( not ( = ?auto_563821 ?auto_563823 ) ) ( AVAILABLE ?auto_563823 ) ( SURFACE-AT ?auto_563818 ?auto_563822 ) ( ON ?auto_563818 ?auto_563820 ) ( CLEAR ?auto_563818 ) ( not ( = ?auto_563817 ?auto_563820 ) ) ( not ( = ?auto_563818 ?auto_563820 ) ) ( not ( = ?auto_563816 ?auto_563820 ) ) ( TRUCK-AT ?auto_563819 ?auto_563824 ) ( ON ?auto_563811 ?auto_563810 ) ( ON ?auto_563812 ?auto_563811 ) ( ON ?auto_563814 ?auto_563812 ) ( ON ?auto_563813 ?auto_563814 ) ( ON ?auto_563815 ?auto_563813 ) ( ON ?auto_563816 ?auto_563815 ) ( not ( = ?auto_563810 ?auto_563811 ) ) ( not ( = ?auto_563810 ?auto_563812 ) ) ( not ( = ?auto_563810 ?auto_563814 ) ) ( not ( = ?auto_563810 ?auto_563813 ) ) ( not ( = ?auto_563810 ?auto_563815 ) ) ( not ( = ?auto_563810 ?auto_563816 ) ) ( not ( = ?auto_563810 ?auto_563817 ) ) ( not ( = ?auto_563810 ?auto_563818 ) ) ( not ( = ?auto_563810 ?auto_563820 ) ) ( not ( = ?auto_563811 ?auto_563812 ) ) ( not ( = ?auto_563811 ?auto_563814 ) ) ( not ( = ?auto_563811 ?auto_563813 ) ) ( not ( = ?auto_563811 ?auto_563815 ) ) ( not ( = ?auto_563811 ?auto_563816 ) ) ( not ( = ?auto_563811 ?auto_563817 ) ) ( not ( = ?auto_563811 ?auto_563818 ) ) ( not ( = ?auto_563811 ?auto_563820 ) ) ( not ( = ?auto_563812 ?auto_563814 ) ) ( not ( = ?auto_563812 ?auto_563813 ) ) ( not ( = ?auto_563812 ?auto_563815 ) ) ( not ( = ?auto_563812 ?auto_563816 ) ) ( not ( = ?auto_563812 ?auto_563817 ) ) ( not ( = ?auto_563812 ?auto_563818 ) ) ( not ( = ?auto_563812 ?auto_563820 ) ) ( not ( = ?auto_563814 ?auto_563813 ) ) ( not ( = ?auto_563814 ?auto_563815 ) ) ( not ( = ?auto_563814 ?auto_563816 ) ) ( not ( = ?auto_563814 ?auto_563817 ) ) ( not ( = ?auto_563814 ?auto_563818 ) ) ( not ( = ?auto_563814 ?auto_563820 ) ) ( not ( = ?auto_563813 ?auto_563815 ) ) ( not ( = ?auto_563813 ?auto_563816 ) ) ( not ( = ?auto_563813 ?auto_563817 ) ) ( not ( = ?auto_563813 ?auto_563818 ) ) ( not ( = ?auto_563813 ?auto_563820 ) ) ( not ( = ?auto_563815 ?auto_563816 ) ) ( not ( = ?auto_563815 ?auto_563817 ) ) ( not ( = ?auto_563815 ?auto_563818 ) ) ( not ( = ?auto_563815 ?auto_563820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563816 ?auto_563817 ?auto_563818 )
      ( MAKE-8CRATE-VERIFY ?auto_563810 ?auto_563811 ?auto_563812 ?auto_563814 ?auto_563813 ?auto_563815 ?auto_563816 ?auto_563817 ?auto_563818 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563903 - SURFACE
      ?auto_563904 - SURFACE
      ?auto_563905 - SURFACE
      ?auto_563907 - SURFACE
      ?auto_563906 - SURFACE
      ?auto_563908 - SURFACE
      ?auto_563909 - SURFACE
      ?auto_563910 - SURFACE
      ?auto_563911 - SURFACE
    )
    :vars
    (
      ?auto_563916 - HOIST
      ?auto_563915 - PLACE
      ?auto_563912 - PLACE
      ?auto_563917 - HOIST
      ?auto_563913 - SURFACE
      ?auto_563914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_563916 ?auto_563915 ) ( IS-CRATE ?auto_563911 ) ( not ( = ?auto_563910 ?auto_563911 ) ) ( not ( = ?auto_563909 ?auto_563910 ) ) ( not ( = ?auto_563909 ?auto_563911 ) ) ( not ( = ?auto_563912 ?auto_563915 ) ) ( HOIST-AT ?auto_563917 ?auto_563912 ) ( not ( = ?auto_563916 ?auto_563917 ) ) ( AVAILABLE ?auto_563917 ) ( SURFACE-AT ?auto_563911 ?auto_563912 ) ( ON ?auto_563911 ?auto_563913 ) ( CLEAR ?auto_563911 ) ( not ( = ?auto_563910 ?auto_563913 ) ) ( not ( = ?auto_563911 ?auto_563913 ) ) ( not ( = ?auto_563909 ?auto_563913 ) ) ( TRUCK-AT ?auto_563914 ?auto_563915 ) ( SURFACE-AT ?auto_563909 ?auto_563915 ) ( CLEAR ?auto_563909 ) ( LIFTING ?auto_563916 ?auto_563910 ) ( IS-CRATE ?auto_563910 ) ( ON ?auto_563904 ?auto_563903 ) ( ON ?auto_563905 ?auto_563904 ) ( ON ?auto_563907 ?auto_563905 ) ( ON ?auto_563906 ?auto_563907 ) ( ON ?auto_563908 ?auto_563906 ) ( ON ?auto_563909 ?auto_563908 ) ( not ( = ?auto_563903 ?auto_563904 ) ) ( not ( = ?auto_563903 ?auto_563905 ) ) ( not ( = ?auto_563903 ?auto_563907 ) ) ( not ( = ?auto_563903 ?auto_563906 ) ) ( not ( = ?auto_563903 ?auto_563908 ) ) ( not ( = ?auto_563903 ?auto_563909 ) ) ( not ( = ?auto_563903 ?auto_563910 ) ) ( not ( = ?auto_563903 ?auto_563911 ) ) ( not ( = ?auto_563903 ?auto_563913 ) ) ( not ( = ?auto_563904 ?auto_563905 ) ) ( not ( = ?auto_563904 ?auto_563907 ) ) ( not ( = ?auto_563904 ?auto_563906 ) ) ( not ( = ?auto_563904 ?auto_563908 ) ) ( not ( = ?auto_563904 ?auto_563909 ) ) ( not ( = ?auto_563904 ?auto_563910 ) ) ( not ( = ?auto_563904 ?auto_563911 ) ) ( not ( = ?auto_563904 ?auto_563913 ) ) ( not ( = ?auto_563905 ?auto_563907 ) ) ( not ( = ?auto_563905 ?auto_563906 ) ) ( not ( = ?auto_563905 ?auto_563908 ) ) ( not ( = ?auto_563905 ?auto_563909 ) ) ( not ( = ?auto_563905 ?auto_563910 ) ) ( not ( = ?auto_563905 ?auto_563911 ) ) ( not ( = ?auto_563905 ?auto_563913 ) ) ( not ( = ?auto_563907 ?auto_563906 ) ) ( not ( = ?auto_563907 ?auto_563908 ) ) ( not ( = ?auto_563907 ?auto_563909 ) ) ( not ( = ?auto_563907 ?auto_563910 ) ) ( not ( = ?auto_563907 ?auto_563911 ) ) ( not ( = ?auto_563907 ?auto_563913 ) ) ( not ( = ?auto_563906 ?auto_563908 ) ) ( not ( = ?auto_563906 ?auto_563909 ) ) ( not ( = ?auto_563906 ?auto_563910 ) ) ( not ( = ?auto_563906 ?auto_563911 ) ) ( not ( = ?auto_563906 ?auto_563913 ) ) ( not ( = ?auto_563908 ?auto_563909 ) ) ( not ( = ?auto_563908 ?auto_563910 ) ) ( not ( = ?auto_563908 ?auto_563911 ) ) ( not ( = ?auto_563908 ?auto_563913 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_563909 ?auto_563910 ?auto_563911 )
      ( MAKE-8CRATE-VERIFY ?auto_563903 ?auto_563904 ?auto_563905 ?auto_563907 ?auto_563906 ?auto_563908 ?auto_563909 ?auto_563910 ?auto_563911 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_563996 - SURFACE
      ?auto_563997 - SURFACE
      ?auto_563998 - SURFACE
      ?auto_564000 - SURFACE
      ?auto_563999 - SURFACE
      ?auto_564001 - SURFACE
      ?auto_564002 - SURFACE
      ?auto_564003 - SURFACE
      ?auto_564004 - SURFACE
    )
    :vars
    (
      ?auto_564006 - HOIST
      ?auto_564010 - PLACE
      ?auto_564005 - PLACE
      ?auto_564008 - HOIST
      ?auto_564009 - SURFACE
      ?auto_564007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_564006 ?auto_564010 ) ( IS-CRATE ?auto_564004 ) ( not ( = ?auto_564003 ?auto_564004 ) ) ( not ( = ?auto_564002 ?auto_564003 ) ) ( not ( = ?auto_564002 ?auto_564004 ) ) ( not ( = ?auto_564005 ?auto_564010 ) ) ( HOIST-AT ?auto_564008 ?auto_564005 ) ( not ( = ?auto_564006 ?auto_564008 ) ) ( AVAILABLE ?auto_564008 ) ( SURFACE-AT ?auto_564004 ?auto_564005 ) ( ON ?auto_564004 ?auto_564009 ) ( CLEAR ?auto_564004 ) ( not ( = ?auto_564003 ?auto_564009 ) ) ( not ( = ?auto_564004 ?auto_564009 ) ) ( not ( = ?auto_564002 ?auto_564009 ) ) ( TRUCK-AT ?auto_564007 ?auto_564010 ) ( SURFACE-AT ?auto_564002 ?auto_564010 ) ( CLEAR ?auto_564002 ) ( IS-CRATE ?auto_564003 ) ( AVAILABLE ?auto_564006 ) ( IN ?auto_564003 ?auto_564007 ) ( ON ?auto_563997 ?auto_563996 ) ( ON ?auto_563998 ?auto_563997 ) ( ON ?auto_564000 ?auto_563998 ) ( ON ?auto_563999 ?auto_564000 ) ( ON ?auto_564001 ?auto_563999 ) ( ON ?auto_564002 ?auto_564001 ) ( not ( = ?auto_563996 ?auto_563997 ) ) ( not ( = ?auto_563996 ?auto_563998 ) ) ( not ( = ?auto_563996 ?auto_564000 ) ) ( not ( = ?auto_563996 ?auto_563999 ) ) ( not ( = ?auto_563996 ?auto_564001 ) ) ( not ( = ?auto_563996 ?auto_564002 ) ) ( not ( = ?auto_563996 ?auto_564003 ) ) ( not ( = ?auto_563996 ?auto_564004 ) ) ( not ( = ?auto_563996 ?auto_564009 ) ) ( not ( = ?auto_563997 ?auto_563998 ) ) ( not ( = ?auto_563997 ?auto_564000 ) ) ( not ( = ?auto_563997 ?auto_563999 ) ) ( not ( = ?auto_563997 ?auto_564001 ) ) ( not ( = ?auto_563997 ?auto_564002 ) ) ( not ( = ?auto_563997 ?auto_564003 ) ) ( not ( = ?auto_563997 ?auto_564004 ) ) ( not ( = ?auto_563997 ?auto_564009 ) ) ( not ( = ?auto_563998 ?auto_564000 ) ) ( not ( = ?auto_563998 ?auto_563999 ) ) ( not ( = ?auto_563998 ?auto_564001 ) ) ( not ( = ?auto_563998 ?auto_564002 ) ) ( not ( = ?auto_563998 ?auto_564003 ) ) ( not ( = ?auto_563998 ?auto_564004 ) ) ( not ( = ?auto_563998 ?auto_564009 ) ) ( not ( = ?auto_564000 ?auto_563999 ) ) ( not ( = ?auto_564000 ?auto_564001 ) ) ( not ( = ?auto_564000 ?auto_564002 ) ) ( not ( = ?auto_564000 ?auto_564003 ) ) ( not ( = ?auto_564000 ?auto_564004 ) ) ( not ( = ?auto_564000 ?auto_564009 ) ) ( not ( = ?auto_563999 ?auto_564001 ) ) ( not ( = ?auto_563999 ?auto_564002 ) ) ( not ( = ?auto_563999 ?auto_564003 ) ) ( not ( = ?auto_563999 ?auto_564004 ) ) ( not ( = ?auto_563999 ?auto_564009 ) ) ( not ( = ?auto_564001 ?auto_564002 ) ) ( not ( = ?auto_564001 ?auto_564003 ) ) ( not ( = ?auto_564001 ?auto_564004 ) ) ( not ( = ?auto_564001 ?auto_564009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_564002 ?auto_564003 ?auto_564004 )
      ( MAKE-8CRATE-VERIFY ?auto_563996 ?auto_563997 ?auto_563998 ?auto_564000 ?auto_563999 ?auto_564001 ?auto_564002 ?auto_564003 ?auto_564004 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568085 - SURFACE
      ?auto_568086 - SURFACE
      ?auto_568087 - SURFACE
      ?auto_568089 - SURFACE
      ?auto_568088 - SURFACE
      ?auto_568090 - SURFACE
      ?auto_568091 - SURFACE
      ?auto_568092 - SURFACE
      ?auto_568093 - SURFACE
      ?auto_568094 - SURFACE
    )
    :vars
    (
      ?auto_568096 - HOIST
      ?auto_568095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568096 ?auto_568095 ) ( SURFACE-AT ?auto_568093 ?auto_568095 ) ( CLEAR ?auto_568093 ) ( LIFTING ?auto_568096 ?auto_568094 ) ( IS-CRATE ?auto_568094 ) ( not ( = ?auto_568093 ?auto_568094 ) ) ( ON ?auto_568086 ?auto_568085 ) ( ON ?auto_568087 ?auto_568086 ) ( ON ?auto_568089 ?auto_568087 ) ( ON ?auto_568088 ?auto_568089 ) ( ON ?auto_568090 ?auto_568088 ) ( ON ?auto_568091 ?auto_568090 ) ( ON ?auto_568092 ?auto_568091 ) ( ON ?auto_568093 ?auto_568092 ) ( not ( = ?auto_568085 ?auto_568086 ) ) ( not ( = ?auto_568085 ?auto_568087 ) ) ( not ( = ?auto_568085 ?auto_568089 ) ) ( not ( = ?auto_568085 ?auto_568088 ) ) ( not ( = ?auto_568085 ?auto_568090 ) ) ( not ( = ?auto_568085 ?auto_568091 ) ) ( not ( = ?auto_568085 ?auto_568092 ) ) ( not ( = ?auto_568085 ?auto_568093 ) ) ( not ( = ?auto_568085 ?auto_568094 ) ) ( not ( = ?auto_568086 ?auto_568087 ) ) ( not ( = ?auto_568086 ?auto_568089 ) ) ( not ( = ?auto_568086 ?auto_568088 ) ) ( not ( = ?auto_568086 ?auto_568090 ) ) ( not ( = ?auto_568086 ?auto_568091 ) ) ( not ( = ?auto_568086 ?auto_568092 ) ) ( not ( = ?auto_568086 ?auto_568093 ) ) ( not ( = ?auto_568086 ?auto_568094 ) ) ( not ( = ?auto_568087 ?auto_568089 ) ) ( not ( = ?auto_568087 ?auto_568088 ) ) ( not ( = ?auto_568087 ?auto_568090 ) ) ( not ( = ?auto_568087 ?auto_568091 ) ) ( not ( = ?auto_568087 ?auto_568092 ) ) ( not ( = ?auto_568087 ?auto_568093 ) ) ( not ( = ?auto_568087 ?auto_568094 ) ) ( not ( = ?auto_568089 ?auto_568088 ) ) ( not ( = ?auto_568089 ?auto_568090 ) ) ( not ( = ?auto_568089 ?auto_568091 ) ) ( not ( = ?auto_568089 ?auto_568092 ) ) ( not ( = ?auto_568089 ?auto_568093 ) ) ( not ( = ?auto_568089 ?auto_568094 ) ) ( not ( = ?auto_568088 ?auto_568090 ) ) ( not ( = ?auto_568088 ?auto_568091 ) ) ( not ( = ?auto_568088 ?auto_568092 ) ) ( not ( = ?auto_568088 ?auto_568093 ) ) ( not ( = ?auto_568088 ?auto_568094 ) ) ( not ( = ?auto_568090 ?auto_568091 ) ) ( not ( = ?auto_568090 ?auto_568092 ) ) ( not ( = ?auto_568090 ?auto_568093 ) ) ( not ( = ?auto_568090 ?auto_568094 ) ) ( not ( = ?auto_568091 ?auto_568092 ) ) ( not ( = ?auto_568091 ?auto_568093 ) ) ( not ( = ?auto_568091 ?auto_568094 ) ) ( not ( = ?auto_568092 ?auto_568093 ) ) ( not ( = ?auto_568092 ?auto_568094 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_568093 ?auto_568094 )
      ( MAKE-9CRATE-VERIFY ?auto_568085 ?auto_568086 ?auto_568087 ?auto_568089 ?auto_568088 ?auto_568090 ?auto_568091 ?auto_568092 ?auto_568093 ?auto_568094 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568165 - SURFACE
      ?auto_568166 - SURFACE
      ?auto_568167 - SURFACE
      ?auto_568169 - SURFACE
      ?auto_568168 - SURFACE
      ?auto_568170 - SURFACE
      ?auto_568171 - SURFACE
      ?auto_568172 - SURFACE
      ?auto_568173 - SURFACE
      ?auto_568174 - SURFACE
    )
    :vars
    (
      ?auto_568176 - HOIST
      ?auto_568175 - PLACE
      ?auto_568177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_568176 ?auto_568175 ) ( SURFACE-AT ?auto_568173 ?auto_568175 ) ( CLEAR ?auto_568173 ) ( IS-CRATE ?auto_568174 ) ( not ( = ?auto_568173 ?auto_568174 ) ) ( TRUCK-AT ?auto_568177 ?auto_568175 ) ( AVAILABLE ?auto_568176 ) ( IN ?auto_568174 ?auto_568177 ) ( ON ?auto_568173 ?auto_568172 ) ( not ( = ?auto_568172 ?auto_568173 ) ) ( not ( = ?auto_568172 ?auto_568174 ) ) ( ON ?auto_568166 ?auto_568165 ) ( ON ?auto_568167 ?auto_568166 ) ( ON ?auto_568169 ?auto_568167 ) ( ON ?auto_568168 ?auto_568169 ) ( ON ?auto_568170 ?auto_568168 ) ( ON ?auto_568171 ?auto_568170 ) ( ON ?auto_568172 ?auto_568171 ) ( not ( = ?auto_568165 ?auto_568166 ) ) ( not ( = ?auto_568165 ?auto_568167 ) ) ( not ( = ?auto_568165 ?auto_568169 ) ) ( not ( = ?auto_568165 ?auto_568168 ) ) ( not ( = ?auto_568165 ?auto_568170 ) ) ( not ( = ?auto_568165 ?auto_568171 ) ) ( not ( = ?auto_568165 ?auto_568172 ) ) ( not ( = ?auto_568165 ?auto_568173 ) ) ( not ( = ?auto_568165 ?auto_568174 ) ) ( not ( = ?auto_568166 ?auto_568167 ) ) ( not ( = ?auto_568166 ?auto_568169 ) ) ( not ( = ?auto_568166 ?auto_568168 ) ) ( not ( = ?auto_568166 ?auto_568170 ) ) ( not ( = ?auto_568166 ?auto_568171 ) ) ( not ( = ?auto_568166 ?auto_568172 ) ) ( not ( = ?auto_568166 ?auto_568173 ) ) ( not ( = ?auto_568166 ?auto_568174 ) ) ( not ( = ?auto_568167 ?auto_568169 ) ) ( not ( = ?auto_568167 ?auto_568168 ) ) ( not ( = ?auto_568167 ?auto_568170 ) ) ( not ( = ?auto_568167 ?auto_568171 ) ) ( not ( = ?auto_568167 ?auto_568172 ) ) ( not ( = ?auto_568167 ?auto_568173 ) ) ( not ( = ?auto_568167 ?auto_568174 ) ) ( not ( = ?auto_568169 ?auto_568168 ) ) ( not ( = ?auto_568169 ?auto_568170 ) ) ( not ( = ?auto_568169 ?auto_568171 ) ) ( not ( = ?auto_568169 ?auto_568172 ) ) ( not ( = ?auto_568169 ?auto_568173 ) ) ( not ( = ?auto_568169 ?auto_568174 ) ) ( not ( = ?auto_568168 ?auto_568170 ) ) ( not ( = ?auto_568168 ?auto_568171 ) ) ( not ( = ?auto_568168 ?auto_568172 ) ) ( not ( = ?auto_568168 ?auto_568173 ) ) ( not ( = ?auto_568168 ?auto_568174 ) ) ( not ( = ?auto_568170 ?auto_568171 ) ) ( not ( = ?auto_568170 ?auto_568172 ) ) ( not ( = ?auto_568170 ?auto_568173 ) ) ( not ( = ?auto_568170 ?auto_568174 ) ) ( not ( = ?auto_568171 ?auto_568172 ) ) ( not ( = ?auto_568171 ?auto_568173 ) ) ( not ( = ?auto_568171 ?auto_568174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568172 ?auto_568173 ?auto_568174 )
      ( MAKE-9CRATE-VERIFY ?auto_568165 ?auto_568166 ?auto_568167 ?auto_568169 ?auto_568168 ?auto_568170 ?auto_568171 ?auto_568172 ?auto_568173 ?auto_568174 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568255 - SURFACE
      ?auto_568256 - SURFACE
      ?auto_568257 - SURFACE
      ?auto_568259 - SURFACE
      ?auto_568258 - SURFACE
      ?auto_568260 - SURFACE
      ?auto_568261 - SURFACE
      ?auto_568262 - SURFACE
      ?auto_568263 - SURFACE
      ?auto_568264 - SURFACE
    )
    :vars
    (
      ?auto_568265 - HOIST
      ?auto_568266 - PLACE
      ?auto_568268 - TRUCK
      ?auto_568267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568265 ?auto_568266 ) ( SURFACE-AT ?auto_568263 ?auto_568266 ) ( CLEAR ?auto_568263 ) ( IS-CRATE ?auto_568264 ) ( not ( = ?auto_568263 ?auto_568264 ) ) ( AVAILABLE ?auto_568265 ) ( IN ?auto_568264 ?auto_568268 ) ( ON ?auto_568263 ?auto_568262 ) ( not ( = ?auto_568262 ?auto_568263 ) ) ( not ( = ?auto_568262 ?auto_568264 ) ) ( TRUCK-AT ?auto_568268 ?auto_568267 ) ( not ( = ?auto_568267 ?auto_568266 ) ) ( ON ?auto_568256 ?auto_568255 ) ( ON ?auto_568257 ?auto_568256 ) ( ON ?auto_568259 ?auto_568257 ) ( ON ?auto_568258 ?auto_568259 ) ( ON ?auto_568260 ?auto_568258 ) ( ON ?auto_568261 ?auto_568260 ) ( ON ?auto_568262 ?auto_568261 ) ( not ( = ?auto_568255 ?auto_568256 ) ) ( not ( = ?auto_568255 ?auto_568257 ) ) ( not ( = ?auto_568255 ?auto_568259 ) ) ( not ( = ?auto_568255 ?auto_568258 ) ) ( not ( = ?auto_568255 ?auto_568260 ) ) ( not ( = ?auto_568255 ?auto_568261 ) ) ( not ( = ?auto_568255 ?auto_568262 ) ) ( not ( = ?auto_568255 ?auto_568263 ) ) ( not ( = ?auto_568255 ?auto_568264 ) ) ( not ( = ?auto_568256 ?auto_568257 ) ) ( not ( = ?auto_568256 ?auto_568259 ) ) ( not ( = ?auto_568256 ?auto_568258 ) ) ( not ( = ?auto_568256 ?auto_568260 ) ) ( not ( = ?auto_568256 ?auto_568261 ) ) ( not ( = ?auto_568256 ?auto_568262 ) ) ( not ( = ?auto_568256 ?auto_568263 ) ) ( not ( = ?auto_568256 ?auto_568264 ) ) ( not ( = ?auto_568257 ?auto_568259 ) ) ( not ( = ?auto_568257 ?auto_568258 ) ) ( not ( = ?auto_568257 ?auto_568260 ) ) ( not ( = ?auto_568257 ?auto_568261 ) ) ( not ( = ?auto_568257 ?auto_568262 ) ) ( not ( = ?auto_568257 ?auto_568263 ) ) ( not ( = ?auto_568257 ?auto_568264 ) ) ( not ( = ?auto_568259 ?auto_568258 ) ) ( not ( = ?auto_568259 ?auto_568260 ) ) ( not ( = ?auto_568259 ?auto_568261 ) ) ( not ( = ?auto_568259 ?auto_568262 ) ) ( not ( = ?auto_568259 ?auto_568263 ) ) ( not ( = ?auto_568259 ?auto_568264 ) ) ( not ( = ?auto_568258 ?auto_568260 ) ) ( not ( = ?auto_568258 ?auto_568261 ) ) ( not ( = ?auto_568258 ?auto_568262 ) ) ( not ( = ?auto_568258 ?auto_568263 ) ) ( not ( = ?auto_568258 ?auto_568264 ) ) ( not ( = ?auto_568260 ?auto_568261 ) ) ( not ( = ?auto_568260 ?auto_568262 ) ) ( not ( = ?auto_568260 ?auto_568263 ) ) ( not ( = ?auto_568260 ?auto_568264 ) ) ( not ( = ?auto_568261 ?auto_568262 ) ) ( not ( = ?auto_568261 ?auto_568263 ) ) ( not ( = ?auto_568261 ?auto_568264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568262 ?auto_568263 ?auto_568264 )
      ( MAKE-9CRATE-VERIFY ?auto_568255 ?auto_568256 ?auto_568257 ?auto_568259 ?auto_568258 ?auto_568260 ?auto_568261 ?auto_568262 ?auto_568263 ?auto_568264 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568354 - SURFACE
      ?auto_568355 - SURFACE
      ?auto_568356 - SURFACE
      ?auto_568358 - SURFACE
      ?auto_568357 - SURFACE
      ?auto_568359 - SURFACE
      ?auto_568360 - SURFACE
      ?auto_568361 - SURFACE
      ?auto_568362 - SURFACE
      ?auto_568363 - SURFACE
    )
    :vars
    (
      ?auto_568366 - HOIST
      ?auto_568365 - PLACE
      ?auto_568368 - TRUCK
      ?auto_568364 - PLACE
      ?auto_568367 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_568366 ?auto_568365 ) ( SURFACE-AT ?auto_568362 ?auto_568365 ) ( CLEAR ?auto_568362 ) ( IS-CRATE ?auto_568363 ) ( not ( = ?auto_568362 ?auto_568363 ) ) ( AVAILABLE ?auto_568366 ) ( ON ?auto_568362 ?auto_568361 ) ( not ( = ?auto_568361 ?auto_568362 ) ) ( not ( = ?auto_568361 ?auto_568363 ) ) ( TRUCK-AT ?auto_568368 ?auto_568364 ) ( not ( = ?auto_568364 ?auto_568365 ) ) ( HOIST-AT ?auto_568367 ?auto_568364 ) ( LIFTING ?auto_568367 ?auto_568363 ) ( not ( = ?auto_568366 ?auto_568367 ) ) ( ON ?auto_568355 ?auto_568354 ) ( ON ?auto_568356 ?auto_568355 ) ( ON ?auto_568358 ?auto_568356 ) ( ON ?auto_568357 ?auto_568358 ) ( ON ?auto_568359 ?auto_568357 ) ( ON ?auto_568360 ?auto_568359 ) ( ON ?auto_568361 ?auto_568360 ) ( not ( = ?auto_568354 ?auto_568355 ) ) ( not ( = ?auto_568354 ?auto_568356 ) ) ( not ( = ?auto_568354 ?auto_568358 ) ) ( not ( = ?auto_568354 ?auto_568357 ) ) ( not ( = ?auto_568354 ?auto_568359 ) ) ( not ( = ?auto_568354 ?auto_568360 ) ) ( not ( = ?auto_568354 ?auto_568361 ) ) ( not ( = ?auto_568354 ?auto_568362 ) ) ( not ( = ?auto_568354 ?auto_568363 ) ) ( not ( = ?auto_568355 ?auto_568356 ) ) ( not ( = ?auto_568355 ?auto_568358 ) ) ( not ( = ?auto_568355 ?auto_568357 ) ) ( not ( = ?auto_568355 ?auto_568359 ) ) ( not ( = ?auto_568355 ?auto_568360 ) ) ( not ( = ?auto_568355 ?auto_568361 ) ) ( not ( = ?auto_568355 ?auto_568362 ) ) ( not ( = ?auto_568355 ?auto_568363 ) ) ( not ( = ?auto_568356 ?auto_568358 ) ) ( not ( = ?auto_568356 ?auto_568357 ) ) ( not ( = ?auto_568356 ?auto_568359 ) ) ( not ( = ?auto_568356 ?auto_568360 ) ) ( not ( = ?auto_568356 ?auto_568361 ) ) ( not ( = ?auto_568356 ?auto_568362 ) ) ( not ( = ?auto_568356 ?auto_568363 ) ) ( not ( = ?auto_568358 ?auto_568357 ) ) ( not ( = ?auto_568358 ?auto_568359 ) ) ( not ( = ?auto_568358 ?auto_568360 ) ) ( not ( = ?auto_568358 ?auto_568361 ) ) ( not ( = ?auto_568358 ?auto_568362 ) ) ( not ( = ?auto_568358 ?auto_568363 ) ) ( not ( = ?auto_568357 ?auto_568359 ) ) ( not ( = ?auto_568357 ?auto_568360 ) ) ( not ( = ?auto_568357 ?auto_568361 ) ) ( not ( = ?auto_568357 ?auto_568362 ) ) ( not ( = ?auto_568357 ?auto_568363 ) ) ( not ( = ?auto_568359 ?auto_568360 ) ) ( not ( = ?auto_568359 ?auto_568361 ) ) ( not ( = ?auto_568359 ?auto_568362 ) ) ( not ( = ?auto_568359 ?auto_568363 ) ) ( not ( = ?auto_568360 ?auto_568361 ) ) ( not ( = ?auto_568360 ?auto_568362 ) ) ( not ( = ?auto_568360 ?auto_568363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568361 ?auto_568362 ?auto_568363 )
      ( MAKE-9CRATE-VERIFY ?auto_568354 ?auto_568355 ?auto_568356 ?auto_568358 ?auto_568357 ?auto_568359 ?auto_568360 ?auto_568361 ?auto_568362 ?auto_568363 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568462 - SURFACE
      ?auto_568463 - SURFACE
      ?auto_568464 - SURFACE
      ?auto_568466 - SURFACE
      ?auto_568465 - SURFACE
      ?auto_568467 - SURFACE
      ?auto_568468 - SURFACE
      ?auto_568469 - SURFACE
      ?auto_568470 - SURFACE
      ?auto_568471 - SURFACE
    )
    :vars
    (
      ?auto_568472 - HOIST
      ?auto_568473 - PLACE
      ?auto_568476 - TRUCK
      ?auto_568475 - PLACE
      ?auto_568474 - HOIST
      ?auto_568477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568472 ?auto_568473 ) ( SURFACE-AT ?auto_568470 ?auto_568473 ) ( CLEAR ?auto_568470 ) ( IS-CRATE ?auto_568471 ) ( not ( = ?auto_568470 ?auto_568471 ) ) ( AVAILABLE ?auto_568472 ) ( ON ?auto_568470 ?auto_568469 ) ( not ( = ?auto_568469 ?auto_568470 ) ) ( not ( = ?auto_568469 ?auto_568471 ) ) ( TRUCK-AT ?auto_568476 ?auto_568475 ) ( not ( = ?auto_568475 ?auto_568473 ) ) ( HOIST-AT ?auto_568474 ?auto_568475 ) ( not ( = ?auto_568472 ?auto_568474 ) ) ( AVAILABLE ?auto_568474 ) ( SURFACE-AT ?auto_568471 ?auto_568475 ) ( ON ?auto_568471 ?auto_568477 ) ( CLEAR ?auto_568471 ) ( not ( = ?auto_568470 ?auto_568477 ) ) ( not ( = ?auto_568471 ?auto_568477 ) ) ( not ( = ?auto_568469 ?auto_568477 ) ) ( ON ?auto_568463 ?auto_568462 ) ( ON ?auto_568464 ?auto_568463 ) ( ON ?auto_568466 ?auto_568464 ) ( ON ?auto_568465 ?auto_568466 ) ( ON ?auto_568467 ?auto_568465 ) ( ON ?auto_568468 ?auto_568467 ) ( ON ?auto_568469 ?auto_568468 ) ( not ( = ?auto_568462 ?auto_568463 ) ) ( not ( = ?auto_568462 ?auto_568464 ) ) ( not ( = ?auto_568462 ?auto_568466 ) ) ( not ( = ?auto_568462 ?auto_568465 ) ) ( not ( = ?auto_568462 ?auto_568467 ) ) ( not ( = ?auto_568462 ?auto_568468 ) ) ( not ( = ?auto_568462 ?auto_568469 ) ) ( not ( = ?auto_568462 ?auto_568470 ) ) ( not ( = ?auto_568462 ?auto_568471 ) ) ( not ( = ?auto_568462 ?auto_568477 ) ) ( not ( = ?auto_568463 ?auto_568464 ) ) ( not ( = ?auto_568463 ?auto_568466 ) ) ( not ( = ?auto_568463 ?auto_568465 ) ) ( not ( = ?auto_568463 ?auto_568467 ) ) ( not ( = ?auto_568463 ?auto_568468 ) ) ( not ( = ?auto_568463 ?auto_568469 ) ) ( not ( = ?auto_568463 ?auto_568470 ) ) ( not ( = ?auto_568463 ?auto_568471 ) ) ( not ( = ?auto_568463 ?auto_568477 ) ) ( not ( = ?auto_568464 ?auto_568466 ) ) ( not ( = ?auto_568464 ?auto_568465 ) ) ( not ( = ?auto_568464 ?auto_568467 ) ) ( not ( = ?auto_568464 ?auto_568468 ) ) ( not ( = ?auto_568464 ?auto_568469 ) ) ( not ( = ?auto_568464 ?auto_568470 ) ) ( not ( = ?auto_568464 ?auto_568471 ) ) ( not ( = ?auto_568464 ?auto_568477 ) ) ( not ( = ?auto_568466 ?auto_568465 ) ) ( not ( = ?auto_568466 ?auto_568467 ) ) ( not ( = ?auto_568466 ?auto_568468 ) ) ( not ( = ?auto_568466 ?auto_568469 ) ) ( not ( = ?auto_568466 ?auto_568470 ) ) ( not ( = ?auto_568466 ?auto_568471 ) ) ( not ( = ?auto_568466 ?auto_568477 ) ) ( not ( = ?auto_568465 ?auto_568467 ) ) ( not ( = ?auto_568465 ?auto_568468 ) ) ( not ( = ?auto_568465 ?auto_568469 ) ) ( not ( = ?auto_568465 ?auto_568470 ) ) ( not ( = ?auto_568465 ?auto_568471 ) ) ( not ( = ?auto_568465 ?auto_568477 ) ) ( not ( = ?auto_568467 ?auto_568468 ) ) ( not ( = ?auto_568467 ?auto_568469 ) ) ( not ( = ?auto_568467 ?auto_568470 ) ) ( not ( = ?auto_568467 ?auto_568471 ) ) ( not ( = ?auto_568467 ?auto_568477 ) ) ( not ( = ?auto_568468 ?auto_568469 ) ) ( not ( = ?auto_568468 ?auto_568470 ) ) ( not ( = ?auto_568468 ?auto_568471 ) ) ( not ( = ?auto_568468 ?auto_568477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568469 ?auto_568470 ?auto_568471 )
      ( MAKE-9CRATE-VERIFY ?auto_568462 ?auto_568463 ?auto_568464 ?auto_568466 ?auto_568465 ?auto_568467 ?auto_568468 ?auto_568469 ?auto_568470 ?auto_568471 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568571 - SURFACE
      ?auto_568572 - SURFACE
      ?auto_568573 - SURFACE
      ?auto_568575 - SURFACE
      ?auto_568574 - SURFACE
      ?auto_568576 - SURFACE
      ?auto_568577 - SURFACE
      ?auto_568578 - SURFACE
      ?auto_568579 - SURFACE
      ?auto_568580 - SURFACE
    )
    :vars
    (
      ?auto_568584 - HOIST
      ?auto_568586 - PLACE
      ?auto_568582 - PLACE
      ?auto_568585 - HOIST
      ?auto_568581 - SURFACE
      ?auto_568583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_568584 ?auto_568586 ) ( SURFACE-AT ?auto_568579 ?auto_568586 ) ( CLEAR ?auto_568579 ) ( IS-CRATE ?auto_568580 ) ( not ( = ?auto_568579 ?auto_568580 ) ) ( AVAILABLE ?auto_568584 ) ( ON ?auto_568579 ?auto_568578 ) ( not ( = ?auto_568578 ?auto_568579 ) ) ( not ( = ?auto_568578 ?auto_568580 ) ) ( not ( = ?auto_568582 ?auto_568586 ) ) ( HOIST-AT ?auto_568585 ?auto_568582 ) ( not ( = ?auto_568584 ?auto_568585 ) ) ( AVAILABLE ?auto_568585 ) ( SURFACE-AT ?auto_568580 ?auto_568582 ) ( ON ?auto_568580 ?auto_568581 ) ( CLEAR ?auto_568580 ) ( not ( = ?auto_568579 ?auto_568581 ) ) ( not ( = ?auto_568580 ?auto_568581 ) ) ( not ( = ?auto_568578 ?auto_568581 ) ) ( TRUCK-AT ?auto_568583 ?auto_568586 ) ( ON ?auto_568572 ?auto_568571 ) ( ON ?auto_568573 ?auto_568572 ) ( ON ?auto_568575 ?auto_568573 ) ( ON ?auto_568574 ?auto_568575 ) ( ON ?auto_568576 ?auto_568574 ) ( ON ?auto_568577 ?auto_568576 ) ( ON ?auto_568578 ?auto_568577 ) ( not ( = ?auto_568571 ?auto_568572 ) ) ( not ( = ?auto_568571 ?auto_568573 ) ) ( not ( = ?auto_568571 ?auto_568575 ) ) ( not ( = ?auto_568571 ?auto_568574 ) ) ( not ( = ?auto_568571 ?auto_568576 ) ) ( not ( = ?auto_568571 ?auto_568577 ) ) ( not ( = ?auto_568571 ?auto_568578 ) ) ( not ( = ?auto_568571 ?auto_568579 ) ) ( not ( = ?auto_568571 ?auto_568580 ) ) ( not ( = ?auto_568571 ?auto_568581 ) ) ( not ( = ?auto_568572 ?auto_568573 ) ) ( not ( = ?auto_568572 ?auto_568575 ) ) ( not ( = ?auto_568572 ?auto_568574 ) ) ( not ( = ?auto_568572 ?auto_568576 ) ) ( not ( = ?auto_568572 ?auto_568577 ) ) ( not ( = ?auto_568572 ?auto_568578 ) ) ( not ( = ?auto_568572 ?auto_568579 ) ) ( not ( = ?auto_568572 ?auto_568580 ) ) ( not ( = ?auto_568572 ?auto_568581 ) ) ( not ( = ?auto_568573 ?auto_568575 ) ) ( not ( = ?auto_568573 ?auto_568574 ) ) ( not ( = ?auto_568573 ?auto_568576 ) ) ( not ( = ?auto_568573 ?auto_568577 ) ) ( not ( = ?auto_568573 ?auto_568578 ) ) ( not ( = ?auto_568573 ?auto_568579 ) ) ( not ( = ?auto_568573 ?auto_568580 ) ) ( not ( = ?auto_568573 ?auto_568581 ) ) ( not ( = ?auto_568575 ?auto_568574 ) ) ( not ( = ?auto_568575 ?auto_568576 ) ) ( not ( = ?auto_568575 ?auto_568577 ) ) ( not ( = ?auto_568575 ?auto_568578 ) ) ( not ( = ?auto_568575 ?auto_568579 ) ) ( not ( = ?auto_568575 ?auto_568580 ) ) ( not ( = ?auto_568575 ?auto_568581 ) ) ( not ( = ?auto_568574 ?auto_568576 ) ) ( not ( = ?auto_568574 ?auto_568577 ) ) ( not ( = ?auto_568574 ?auto_568578 ) ) ( not ( = ?auto_568574 ?auto_568579 ) ) ( not ( = ?auto_568574 ?auto_568580 ) ) ( not ( = ?auto_568574 ?auto_568581 ) ) ( not ( = ?auto_568576 ?auto_568577 ) ) ( not ( = ?auto_568576 ?auto_568578 ) ) ( not ( = ?auto_568576 ?auto_568579 ) ) ( not ( = ?auto_568576 ?auto_568580 ) ) ( not ( = ?auto_568576 ?auto_568581 ) ) ( not ( = ?auto_568577 ?auto_568578 ) ) ( not ( = ?auto_568577 ?auto_568579 ) ) ( not ( = ?auto_568577 ?auto_568580 ) ) ( not ( = ?auto_568577 ?auto_568581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568578 ?auto_568579 ?auto_568580 )
      ( MAKE-9CRATE-VERIFY ?auto_568571 ?auto_568572 ?auto_568573 ?auto_568575 ?auto_568574 ?auto_568576 ?auto_568577 ?auto_568578 ?auto_568579 ?auto_568580 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568680 - SURFACE
      ?auto_568681 - SURFACE
      ?auto_568682 - SURFACE
      ?auto_568684 - SURFACE
      ?auto_568683 - SURFACE
      ?auto_568685 - SURFACE
      ?auto_568686 - SURFACE
      ?auto_568687 - SURFACE
      ?auto_568688 - SURFACE
      ?auto_568689 - SURFACE
    )
    :vars
    (
      ?auto_568690 - HOIST
      ?auto_568693 - PLACE
      ?auto_568692 - PLACE
      ?auto_568695 - HOIST
      ?auto_568691 - SURFACE
      ?auto_568694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_568690 ?auto_568693 ) ( IS-CRATE ?auto_568689 ) ( not ( = ?auto_568688 ?auto_568689 ) ) ( not ( = ?auto_568687 ?auto_568688 ) ) ( not ( = ?auto_568687 ?auto_568689 ) ) ( not ( = ?auto_568692 ?auto_568693 ) ) ( HOIST-AT ?auto_568695 ?auto_568692 ) ( not ( = ?auto_568690 ?auto_568695 ) ) ( AVAILABLE ?auto_568695 ) ( SURFACE-AT ?auto_568689 ?auto_568692 ) ( ON ?auto_568689 ?auto_568691 ) ( CLEAR ?auto_568689 ) ( not ( = ?auto_568688 ?auto_568691 ) ) ( not ( = ?auto_568689 ?auto_568691 ) ) ( not ( = ?auto_568687 ?auto_568691 ) ) ( TRUCK-AT ?auto_568694 ?auto_568693 ) ( SURFACE-AT ?auto_568687 ?auto_568693 ) ( CLEAR ?auto_568687 ) ( LIFTING ?auto_568690 ?auto_568688 ) ( IS-CRATE ?auto_568688 ) ( ON ?auto_568681 ?auto_568680 ) ( ON ?auto_568682 ?auto_568681 ) ( ON ?auto_568684 ?auto_568682 ) ( ON ?auto_568683 ?auto_568684 ) ( ON ?auto_568685 ?auto_568683 ) ( ON ?auto_568686 ?auto_568685 ) ( ON ?auto_568687 ?auto_568686 ) ( not ( = ?auto_568680 ?auto_568681 ) ) ( not ( = ?auto_568680 ?auto_568682 ) ) ( not ( = ?auto_568680 ?auto_568684 ) ) ( not ( = ?auto_568680 ?auto_568683 ) ) ( not ( = ?auto_568680 ?auto_568685 ) ) ( not ( = ?auto_568680 ?auto_568686 ) ) ( not ( = ?auto_568680 ?auto_568687 ) ) ( not ( = ?auto_568680 ?auto_568688 ) ) ( not ( = ?auto_568680 ?auto_568689 ) ) ( not ( = ?auto_568680 ?auto_568691 ) ) ( not ( = ?auto_568681 ?auto_568682 ) ) ( not ( = ?auto_568681 ?auto_568684 ) ) ( not ( = ?auto_568681 ?auto_568683 ) ) ( not ( = ?auto_568681 ?auto_568685 ) ) ( not ( = ?auto_568681 ?auto_568686 ) ) ( not ( = ?auto_568681 ?auto_568687 ) ) ( not ( = ?auto_568681 ?auto_568688 ) ) ( not ( = ?auto_568681 ?auto_568689 ) ) ( not ( = ?auto_568681 ?auto_568691 ) ) ( not ( = ?auto_568682 ?auto_568684 ) ) ( not ( = ?auto_568682 ?auto_568683 ) ) ( not ( = ?auto_568682 ?auto_568685 ) ) ( not ( = ?auto_568682 ?auto_568686 ) ) ( not ( = ?auto_568682 ?auto_568687 ) ) ( not ( = ?auto_568682 ?auto_568688 ) ) ( not ( = ?auto_568682 ?auto_568689 ) ) ( not ( = ?auto_568682 ?auto_568691 ) ) ( not ( = ?auto_568684 ?auto_568683 ) ) ( not ( = ?auto_568684 ?auto_568685 ) ) ( not ( = ?auto_568684 ?auto_568686 ) ) ( not ( = ?auto_568684 ?auto_568687 ) ) ( not ( = ?auto_568684 ?auto_568688 ) ) ( not ( = ?auto_568684 ?auto_568689 ) ) ( not ( = ?auto_568684 ?auto_568691 ) ) ( not ( = ?auto_568683 ?auto_568685 ) ) ( not ( = ?auto_568683 ?auto_568686 ) ) ( not ( = ?auto_568683 ?auto_568687 ) ) ( not ( = ?auto_568683 ?auto_568688 ) ) ( not ( = ?auto_568683 ?auto_568689 ) ) ( not ( = ?auto_568683 ?auto_568691 ) ) ( not ( = ?auto_568685 ?auto_568686 ) ) ( not ( = ?auto_568685 ?auto_568687 ) ) ( not ( = ?auto_568685 ?auto_568688 ) ) ( not ( = ?auto_568685 ?auto_568689 ) ) ( not ( = ?auto_568685 ?auto_568691 ) ) ( not ( = ?auto_568686 ?auto_568687 ) ) ( not ( = ?auto_568686 ?auto_568688 ) ) ( not ( = ?auto_568686 ?auto_568689 ) ) ( not ( = ?auto_568686 ?auto_568691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568687 ?auto_568688 ?auto_568689 )
      ( MAKE-9CRATE-VERIFY ?auto_568680 ?auto_568681 ?auto_568682 ?auto_568684 ?auto_568683 ?auto_568685 ?auto_568686 ?auto_568687 ?auto_568688 ?auto_568689 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_568789 - SURFACE
      ?auto_568790 - SURFACE
      ?auto_568791 - SURFACE
      ?auto_568793 - SURFACE
      ?auto_568792 - SURFACE
      ?auto_568794 - SURFACE
      ?auto_568795 - SURFACE
      ?auto_568796 - SURFACE
      ?auto_568797 - SURFACE
      ?auto_568798 - SURFACE
    )
    :vars
    (
      ?auto_568800 - HOIST
      ?auto_568803 - PLACE
      ?auto_568802 - PLACE
      ?auto_568799 - HOIST
      ?auto_568804 - SURFACE
      ?auto_568801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_568800 ?auto_568803 ) ( IS-CRATE ?auto_568798 ) ( not ( = ?auto_568797 ?auto_568798 ) ) ( not ( = ?auto_568796 ?auto_568797 ) ) ( not ( = ?auto_568796 ?auto_568798 ) ) ( not ( = ?auto_568802 ?auto_568803 ) ) ( HOIST-AT ?auto_568799 ?auto_568802 ) ( not ( = ?auto_568800 ?auto_568799 ) ) ( AVAILABLE ?auto_568799 ) ( SURFACE-AT ?auto_568798 ?auto_568802 ) ( ON ?auto_568798 ?auto_568804 ) ( CLEAR ?auto_568798 ) ( not ( = ?auto_568797 ?auto_568804 ) ) ( not ( = ?auto_568798 ?auto_568804 ) ) ( not ( = ?auto_568796 ?auto_568804 ) ) ( TRUCK-AT ?auto_568801 ?auto_568803 ) ( SURFACE-AT ?auto_568796 ?auto_568803 ) ( CLEAR ?auto_568796 ) ( IS-CRATE ?auto_568797 ) ( AVAILABLE ?auto_568800 ) ( IN ?auto_568797 ?auto_568801 ) ( ON ?auto_568790 ?auto_568789 ) ( ON ?auto_568791 ?auto_568790 ) ( ON ?auto_568793 ?auto_568791 ) ( ON ?auto_568792 ?auto_568793 ) ( ON ?auto_568794 ?auto_568792 ) ( ON ?auto_568795 ?auto_568794 ) ( ON ?auto_568796 ?auto_568795 ) ( not ( = ?auto_568789 ?auto_568790 ) ) ( not ( = ?auto_568789 ?auto_568791 ) ) ( not ( = ?auto_568789 ?auto_568793 ) ) ( not ( = ?auto_568789 ?auto_568792 ) ) ( not ( = ?auto_568789 ?auto_568794 ) ) ( not ( = ?auto_568789 ?auto_568795 ) ) ( not ( = ?auto_568789 ?auto_568796 ) ) ( not ( = ?auto_568789 ?auto_568797 ) ) ( not ( = ?auto_568789 ?auto_568798 ) ) ( not ( = ?auto_568789 ?auto_568804 ) ) ( not ( = ?auto_568790 ?auto_568791 ) ) ( not ( = ?auto_568790 ?auto_568793 ) ) ( not ( = ?auto_568790 ?auto_568792 ) ) ( not ( = ?auto_568790 ?auto_568794 ) ) ( not ( = ?auto_568790 ?auto_568795 ) ) ( not ( = ?auto_568790 ?auto_568796 ) ) ( not ( = ?auto_568790 ?auto_568797 ) ) ( not ( = ?auto_568790 ?auto_568798 ) ) ( not ( = ?auto_568790 ?auto_568804 ) ) ( not ( = ?auto_568791 ?auto_568793 ) ) ( not ( = ?auto_568791 ?auto_568792 ) ) ( not ( = ?auto_568791 ?auto_568794 ) ) ( not ( = ?auto_568791 ?auto_568795 ) ) ( not ( = ?auto_568791 ?auto_568796 ) ) ( not ( = ?auto_568791 ?auto_568797 ) ) ( not ( = ?auto_568791 ?auto_568798 ) ) ( not ( = ?auto_568791 ?auto_568804 ) ) ( not ( = ?auto_568793 ?auto_568792 ) ) ( not ( = ?auto_568793 ?auto_568794 ) ) ( not ( = ?auto_568793 ?auto_568795 ) ) ( not ( = ?auto_568793 ?auto_568796 ) ) ( not ( = ?auto_568793 ?auto_568797 ) ) ( not ( = ?auto_568793 ?auto_568798 ) ) ( not ( = ?auto_568793 ?auto_568804 ) ) ( not ( = ?auto_568792 ?auto_568794 ) ) ( not ( = ?auto_568792 ?auto_568795 ) ) ( not ( = ?auto_568792 ?auto_568796 ) ) ( not ( = ?auto_568792 ?auto_568797 ) ) ( not ( = ?auto_568792 ?auto_568798 ) ) ( not ( = ?auto_568792 ?auto_568804 ) ) ( not ( = ?auto_568794 ?auto_568795 ) ) ( not ( = ?auto_568794 ?auto_568796 ) ) ( not ( = ?auto_568794 ?auto_568797 ) ) ( not ( = ?auto_568794 ?auto_568798 ) ) ( not ( = ?auto_568794 ?auto_568804 ) ) ( not ( = ?auto_568795 ?auto_568796 ) ) ( not ( = ?auto_568795 ?auto_568797 ) ) ( not ( = ?auto_568795 ?auto_568798 ) ) ( not ( = ?auto_568795 ?auto_568804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_568796 ?auto_568797 ?auto_568798 )
      ( MAKE-9CRATE-VERIFY ?auto_568789 ?auto_568790 ?auto_568791 ?auto_568793 ?auto_568792 ?auto_568794 ?auto_568795 ?auto_568796 ?auto_568797 ?auto_568798 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574340 - SURFACE
      ?auto_574341 - SURFACE
      ?auto_574342 - SURFACE
      ?auto_574344 - SURFACE
      ?auto_574343 - SURFACE
      ?auto_574345 - SURFACE
      ?auto_574346 - SURFACE
      ?auto_574347 - SURFACE
      ?auto_574348 - SURFACE
      ?auto_574349 - SURFACE
      ?auto_574350 - SURFACE
    )
    :vars
    (
      ?auto_574352 - HOIST
      ?auto_574351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_574352 ?auto_574351 ) ( SURFACE-AT ?auto_574349 ?auto_574351 ) ( CLEAR ?auto_574349 ) ( LIFTING ?auto_574352 ?auto_574350 ) ( IS-CRATE ?auto_574350 ) ( not ( = ?auto_574349 ?auto_574350 ) ) ( ON ?auto_574341 ?auto_574340 ) ( ON ?auto_574342 ?auto_574341 ) ( ON ?auto_574344 ?auto_574342 ) ( ON ?auto_574343 ?auto_574344 ) ( ON ?auto_574345 ?auto_574343 ) ( ON ?auto_574346 ?auto_574345 ) ( ON ?auto_574347 ?auto_574346 ) ( ON ?auto_574348 ?auto_574347 ) ( ON ?auto_574349 ?auto_574348 ) ( not ( = ?auto_574340 ?auto_574341 ) ) ( not ( = ?auto_574340 ?auto_574342 ) ) ( not ( = ?auto_574340 ?auto_574344 ) ) ( not ( = ?auto_574340 ?auto_574343 ) ) ( not ( = ?auto_574340 ?auto_574345 ) ) ( not ( = ?auto_574340 ?auto_574346 ) ) ( not ( = ?auto_574340 ?auto_574347 ) ) ( not ( = ?auto_574340 ?auto_574348 ) ) ( not ( = ?auto_574340 ?auto_574349 ) ) ( not ( = ?auto_574340 ?auto_574350 ) ) ( not ( = ?auto_574341 ?auto_574342 ) ) ( not ( = ?auto_574341 ?auto_574344 ) ) ( not ( = ?auto_574341 ?auto_574343 ) ) ( not ( = ?auto_574341 ?auto_574345 ) ) ( not ( = ?auto_574341 ?auto_574346 ) ) ( not ( = ?auto_574341 ?auto_574347 ) ) ( not ( = ?auto_574341 ?auto_574348 ) ) ( not ( = ?auto_574341 ?auto_574349 ) ) ( not ( = ?auto_574341 ?auto_574350 ) ) ( not ( = ?auto_574342 ?auto_574344 ) ) ( not ( = ?auto_574342 ?auto_574343 ) ) ( not ( = ?auto_574342 ?auto_574345 ) ) ( not ( = ?auto_574342 ?auto_574346 ) ) ( not ( = ?auto_574342 ?auto_574347 ) ) ( not ( = ?auto_574342 ?auto_574348 ) ) ( not ( = ?auto_574342 ?auto_574349 ) ) ( not ( = ?auto_574342 ?auto_574350 ) ) ( not ( = ?auto_574344 ?auto_574343 ) ) ( not ( = ?auto_574344 ?auto_574345 ) ) ( not ( = ?auto_574344 ?auto_574346 ) ) ( not ( = ?auto_574344 ?auto_574347 ) ) ( not ( = ?auto_574344 ?auto_574348 ) ) ( not ( = ?auto_574344 ?auto_574349 ) ) ( not ( = ?auto_574344 ?auto_574350 ) ) ( not ( = ?auto_574343 ?auto_574345 ) ) ( not ( = ?auto_574343 ?auto_574346 ) ) ( not ( = ?auto_574343 ?auto_574347 ) ) ( not ( = ?auto_574343 ?auto_574348 ) ) ( not ( = ?auto_574343 ?auto_574349 ) ) ( not ( = ?auto_574343 ?auto_574350 ) ) ( not ( = ?auto_574345 ?auto_574346 ) ) ( not ( = ?auto_574345 ?auto_574347 ) ) ( not ( = ?auto_574345 ?auto_574348 ) ) ( not ( = ?auto_574345 ?auto_574349 ) ) ( not ( = ?auto_574345 ?auto_574350 ) ) ( not ( = ?auto_574346 ?auto_574347 ) ) ( not ( = ?auto_574346 ?auto_574348 ) ) ( not ( = ?auto_574346 ?auto_574349 ) ) ( not ( = ?auto_574346 ?auto_574350 ) ) ( not ( = ?auto_574347 ?auto_574348 ) ) ( not ( = ?auto_574347 ?auto_574349 ) ) ( not ( = ?auto_574347 ?auto_574350 ) ) ( not ( = ?auto_574348 ?auto_574349 ) ) ( not ( = ?auto_574348 ?auto_574350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_574349 ?auto_574350 )
      ( MAKE-10CRATE-VERIFY ?auto_574340 ?auto_574341 ?auto_574342 ?auto_574344 ?auto_574343 ?auto_574345 ?auto_574346 ?auto_574347 ?auto_574348 ?auto_574349 ?auto_574350 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574434 - SURFACE
      ?auto_574435 - SURFACE
      ?auto_574436 - SURFACE
      ?auto_574438 - SURFACE
      ?auto_574437 - SURFACE
      ?auto_574439 - SURFACE
      ?auto_574440 - SURFACE
      ?auto_574441 - SURFACE
      ?auto_574442 - SURFACE
      ?auto_574443 - SURFACE
      ?auto_574444 - SURFACE
    )
    :vars
    (
      ?auto_574447 - HOIST
      ?auto_574446 - PLACE
      ?auto_574445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_574447 ?auto_574446 ) ( SURFACE-AT ?auto_574443 ?auto_574446 ) ( CLEAR ?auto_574443 ) ( IS-CRATE ?auto_574444 ) ( not ( = ?auto_574443 ?auto_574444 ) ) ( TRUCK-AT ?auto_574445 ?auto_574446 ) ( AVAILABLE ?auto_574447 ) ( IN ?auto_574444 ?auto_574445 ) ( ON ?auto_574443 ?auto_574442 ) ( not ( = ?auto_574442 ?auto_574443 ) ) ( not ( = ?auto_574442 ?auto_574444 ) ) ( ON ?auto_574435 ?auto_574434 ) ( ON ?auto_574436 ?auto_574435 ) ( ON ?auto_574438 ?auto_574436 ) ( ON ?auto_574437 ?auto_574438 ) ( ON ?auto_574439 ?auto_574437 ) ( ON ?auto_574440 ?auto_574439 ) ( ON ?auto_574441 ?auto_574440 ) ( ON ?auto_574442 ?auto_574441 ) ( not ( = ?auto_574434 ?auto_574435 ) ) ( not ( = ?auto_574434 ?auto_574436 ) ) ( not ( = ?auto_574434 ?auto_574438 ) ) ( not ( = ?auto_574434 ?auto_574437 ) ) ( not ( = ?auto_574434 ?auto_574439 ) ) ( not ( = ?auto_574434 ?auto_574440 ) ) ( not ( = ?auto_574434 ?auto_574441 ) ) ( not ( = ?auto_574434 ?auto_574442 ) ) ( not ( = ?auto_574434 ?auto_574443 ) ) ( not ( = ?auto_574434 ?auto_574444 ) ) ( not ( = ?auto_574435 ?auto_574436 ) ) ( not ( = ?auto_574435 ?auto_574438 ) ) ( not ( = ?auto_574435 ?auto_574437 ) ) ( not ( = ?auto_574435 ?auto_574439 ) ) ( not ( = ?auto_574435 ?auto_574440 ) ) ( not ( = ?auto_574435 ?auto_574441 ) ) ( not ( = ?auto_574435 ?auto_574442 ) ) ( not ( = ?auto_574435 ?auto_574443 ) ) ( not ( = ?auto_574435 ?auto_574444 ) ) ( not ( = ?auto_574436 ?auto_574438 ) ) ( not ( = ?auto_574436 ?auto_574437 ) ) ( not ( = ?auto_574436 ?auto_574439 ) ) ( not ( = ?auto_574436 ?auto_574440 ) ) ( not ( = ?auto_574436 ?auto_574441 ) ) ( not ( = ?auto_574436 ?auto_574442 ) ) ( not ( = ?auto_574436 ?auto_574443 ) ) ( not ( = ?auto_574436 ?auto_574444 ) ) ( not ( = ?auto_574438 ?auto_574437 ) ) ( not ( = ?auto_574438 ?auto_574439 ) ) ( not ( = ?auto_574438 ?auto_574440 ) ) ( not ( = ?auto_574438 ?auto_574441 ) ) ( not ( = ?auto_574438 ?auto_574442 ) ) ( not ( = ?auto_574438 ?auto_574443 ) ) ( not ( = ?auto_574438 ?auto_574444 ) ) ( not ( = ?auto_574437 ?auto_574439 ) ) ( not ( = ?auto_574437 ?auto_574440 ) ) ( not ( = ?auto_574437 ?auto_574441 ) ) ( not ( = ?auto_574437 ?auto_574442 ) ) ( not ( = ?auto_574437 ?auto_574443 ) ) ( not ( = ?auto_574437 ?auto_574444 ) ) ( not ( = ?auto_574439 ?auto_574440 ) ) ( not ( = ?auto_574439 ?auto_574441 ) ) ( not ( = ?auto_574439 ?auto_574442 ) ) ( not ( = ?auto_574439 ?auto_574443 ) ) ( not ( = ?auto_574439 ?auto_574444 ) ) ( not ( = ?auto_574440 ?auto_574441 ) ) ( not ( = ?auto_574440 ?auto_574442 ) ) ( not ( = ?auto_574440 ?auto_574443 ) ) ( not ( = ?auto_574440 ?auto_574444 ) ) ( not ( = ?auto_574441 ?auto_574442 ) ) ( not ( = ?auto_574441 ?auto_574443 ) ) ( not ( = ?auto_574441 ?auto_574444 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_574442 ?auto_574443 ?auto_574444 )
      ( MAKE-10CRATE-VERIFY ?auto_574434 ?auto_574435 ?auto_574436 ?auto_574438 ?auto_574437 ?auto_574439 ?auto_574440 ?auto_574441 ?auto_574442 ?auto_574443 ?auto_574444 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574539 - SURFACE
      ?auto_574540 - SURFACE
      ?auto_574541 - SURFACE
      ?auto_574543 - SURFACE
      ?auto_574542 - SURFACE
      ?auto_574544 - SURFACE
      ?auto_574545 - SURFACE
      ?auto_574546 - SURFACE
      ?auto_574547 - SURFACE
      ?auto_574548 - SURFACE
      ?auto_574549 - SURFACE
    )
    :vars
    (
      ?auto_574550 - HOIST
      ?auto_574553 - PLACE
      ?auto_574552 - TRUCK
      ?auto_574551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_574550 ?auto_574553 ) ( SURFACE-AT ?auto_574548 ?auto_574553 ) ( CLEAR ?auto_574548 ) ( IS-CRATE ?auto_574549 ) ( not ( = ?auto_574548 ?auto_574549 ) ) ( AVAILABLE ?auto_574550 ) ( IN ?auto_574549 ?auto_574552 ) ( ON ?auto_574548 ?auto_574547 ) ( not ( = ?auto_574547 ?auto_574548 ) ) ( not ( = ?auto_574547 ?auto_574549 ) ) ( TRUCK-AT ?auto_574552 ?auto_574551 ) ( not ( = ?auto_574551 ?auto_574553 ) ) ( ON ?auto_574540 ?auto_574539 ) ( ON ?auto_574541 ?auto_574540 ) ( ON ?auto_574543 ?auto_574541 ) ( ON ?auto_574542 ?auto_574543 ) ( ON ?auto_574544 ?auto_574542 ) ( ON ?auto_574545 ?auto_574544 ) ( ON ?auto_574546 ?auto_574545 ) ( ON ?auto_574547 ?auto_574546 ) ( not ( = ?auto_574539 ?auto_574540 ) ) ( not ( = ?auto_574539 ?auto_574541 ) ) ( not ( = ?auto_574539 ?auto_574543 ) ) ( not ( = ?auto_574539 ?auto_574542 ) ) ( not ( = ?auto_574539 ?auto_574544 ) ) ( not ( = ?auto_574539 ?auto_574545 ) ) ( not ( = ?auto_574539 ?auto_574546 ) ) ( not ( = ?auto_574539 ?auto_574547 ) ) ( not ( = ?auto_574539 ?auto_574548 ) ) ( not ( = ?auto_574539 ?auto_574549 ) ) ( not ( = ?auto_574540 ?auto_574541 ) ) ( not ( = ?auto_574540 ?auto_574543 ) ) ( not ( = ?auto_574540 ?auto_574542 ) ) ( not ( = ?auto_574540 ?auto_574544 ) ) ( not ( = ?auto_574540 ?auto_574545 ) ) ( not ( = ?auto_574540 ?auto_574546 ) ) ( not ( = ?auto_574540 ?auto_574547 ) ) ( not ( = ?auto_574540 ?auto_574548 ) ) ( not ( = ?auto_574540 ?auto_574549 ) ) ( not ( = ?auto_574541 ?auto_574543 ) ) ( not ( = ?auto_574541 ?auto_574542 ) ) ( not ( = ?auto_574541 ?auto_574544 ) ) ( not ( = ?auto_574541 ?auto_574545 ) ) ( not ( = ?auto_574541 ?auto_574546 ) ) ( not ( = ?auto_574541 ?auto_574547 ) ) ( not ( = ?auto_574541 ?auto_574548 ) ) ( not ( = ?auto_574541 ?auto_574549 ) ) ( not ( = ?auto_574543 ?auto_574542 ) ) ( not ( = ?auto_574543 ?auto_574544 ) ) ( not ( = ?auto_574543 ?auto_574545 ) ) ( not ( = ?auto_574543 ?auto_574546 ) ) ( not ( = ?auto_574543 ?auto_574547 ) ) ( not ( = ?auto_574543 ?auto_574548 ) ) ( not ( = ?auto_574543 ?auto_574549 ) ) ( not ( = ?auto_574542 ?auto_574544 ) ) ( not ( = ?auto_574542 ?auto_574545 ) ) ( not ( = ?auto_574542 ?auto_574546 ) ) ( not ( = ?auto_574542 ?auto_574547 ) ) ( not ( = ?auto_574542 ?auto_574548 ) ) ( not ( = ?auto_574542 ?auto_574549 ) ) ( not ( = ?auto_574544 ?auto_574545 ) ) ( not ( = ?auto_574544 ?auto_574546 ) ) ( not ( = ?auto_574544 ?auto_574547 ) ) ( not ( = ?auto_574544 ?auto_574548 ) ) ( not ( = ?auto_574544 ?auto_574549 ) ) ( not ( = ?auto_574545 ?auto_574546 ) ) ( not ( = ?auto_574545 ?auto_574547 ) ) ( not ( = ?auto_574545 ?auto_574548 ) ) ( not ( = ?auto_574545 ?auto_574549 ) ) ( not ( = ?auto_574546 ?auto_574547 ) ) ( not ( = ?auto_574546 ?auto_574548 ) ) ( not ( = ?auto_574546 ?auto_574549 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_574547 ?auto_574548 ?auto_574549 )
      ( MAKE-10CRATE-VERIFY ?auto_574539 ?auto_574540 ?auto_574541 ?auto_574543 ?auto_574542 ?auto_574544 ?auto_574545 ?auto_574546 ?auto_574547 ?auto_574548 ?auto_574549 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574654 - SURFACE
      ?auto_574655 - SURFACE
      ?auto_574656 - SURFACE
      ?auto_574658 - SURFACE
      ?auto_574657 - SURFACE
      ?auto_574659 - SURFACE
      ?auto_574660 - SURFACE
      ?auto_574661 - SURFACE
      ?auto_574662 - SURFACE
      ?auto_574663 - SURFACE
      ?auto_574664 - SURFACE
    )
    :vars
    (
      ?auto_574666 - HOIST
      ?auto_574667 - PLACE
      ?auto_574669 - TRUCK
      ?auto_574668 - PLACE
      ?auto_574665 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_574666 ?auto_574667 ) ( SURFACE-AT ?auto_574663 ?auto_574667 ) ( CLEAR ?auto_574663 ) ( IS-CRATE ?auto_574664 ) ( not ( = ?auto_574663 ?auto_574664 ) ) ( AVAILABLE ?auto_574666 ) ( ON ?auto_574663 ?auto_574662 ) ( not ( = ?auto_574662 ?auto_574663 ) ) ( not ( = ?auto_574662 ?auto_574664 ) ) ( TRUCK-AT ?auto_574669 ?auto_574668 ) ( not ( = ?auto_574668 ?auto_574667 ) ) ( HOIST-AT ?auto_574665 ?auto_574668 ) ( LIFTING ?auto_574665 ?auto_574664 ) ( not ( = ?auto_574666 ?auto_574665 ) ) ( ON ?auto_574655 ?auto_574654 ) ( ON ?auto_574656 ?auto_574655 ) ( ON ?auto_574658 ?auto_574656 ) ( ON ?auto_574657 ?auto_574658 ) ( ON ?auto_574659 ?auto_574657 ) ( ON ?auto_574660 ?auto_574659 ) ( ON ?auto_574661 ?auto_574660 ) ( ON ?auto_574662 ?auto_574661 ) ( not ( = ?auto_574654 ?auto_574655 ) ) ( not ( = ?auto_574654 ?auto_574656 ) ) ( not ( = ?auto_574654 ?auto_574658 ) ) ( not ( = ?auto_574654 ?auto_574657 ) ) ( not ( = ?auto_574654 ?auto_574659 ) ) ( not ( = ?auto_574654 ?auto_574660 ) ) ( not ( = ?auto_574654 ?auto_574661 ) ) ( not ( = ?auto_574654 ?auto_574662 ) ) ( not ( = ?auto_574654 ?auto_574663 ) ) ( not ( = ?auto_574654 ?auto_574664 ) ) ( not ( = ?auto_574655 ?auto_574656 ) ) ( not ( = ?auto_574655 ?auto_574658 ) ) ( not ( = ?auto_574655 ?auto_574657 ) ) ( not ( = ?auto_574655 ?auto_574659 ) ) ( not ( = ?auto_574655 ?auto_574660 ) ) ( not ( = ?auto_574655 ?auto_574661 ) ) ( not ( = ?auto_574655 ?auto_574662 ) ) ( not ( = ?auto_574655 ?auto_574663 ) ) ( not ( = ?auto_574655 ?auto_574664 ) ) ( not ( = ?auto_574656 ?auto_574658 ) ) ( not ( = ?auto_574656 ?auto_574657 ) ) ( not ( = ?auto_574656 ?auto_574659 ) ) ( not ( = ?auto_574656 ?auto_574660 ) ) ( not ( = ?auto_574656 ?auto_574661 ) ) ( not ( = ?auto_574656 ?auto_574662 ) ) ( not ( = ?auto_574656 ?auto_574663 ) ) ( not ( = ?auto_574656 ?auto_574664 ) ) ( not ( = ?auto_574658 ?auto_574657 ) ) ( not ( = ?auto_574658 ?auto_574659 ) ) ( not ( = ?auto_574658 ?auto_574660 ) ) ( not ( = ?auto_574658 ?auto_574661 ) ) ( not ( = ?auto_574658 ?auto_574662 ) ) ( not ( = ?auto_574658 ?auto_574663 ) ) ( not ( = ?auto_574658 ?auto_574664 ) ) ( not ( = ?auto_574657 ?auto_574659 ) ) ( not ( = ?auto_574657 ?auto_574660 ) ) ( not ( = ?auto_574657 ?auto_574661 ) ) ( not ( = ?auto_574657 ?auto_574662 ) ) ( not ( = ?auto_574657 ?auto_574663 ) ) ( not ( = ?auto_574657 ?auto_574664 ) ) ( not ( = ?auto_574659 ?auto_574660 ) ) ( not ( = ?auto_574659 ?auto_574661 ) ) ( not ( = ?auto_574659 ?auto_574662 ) ) ( not ( = ?auto_574659 ?auto_574663 ) ) ( not ( = ?auto_574659 ?auto_574664 ) ) ( not ( = ?auto_574660 ?auto_574661 ) ) ( not ( = ?auto_574660 ?auto_574662 ) ) ( not ( = ?auto_574660 ?auto_574663 ) ) ( not ( = ?auto_574660 ?auto_574664 ) ) ( not ( = ?auto_574661 ?auto_574662 ) ) ( not ( = ?auto_574661 ?auto_574663 ) ) ( not ( = ?auto_574661 ?auto_574664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_574662 ?auto_574663 ?auto_574664 )
      ( MAKE-10CRATE-VERIFY ?auto_574654 ?auto_574655 ?auto_574656 ?auto_574658 ?auto_574657 ?auto_574659 ?auto_574660 ?auto_574661 ?auto_574662 ?auto_574663 ?auto_574664 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574779 - SURFACE
      ?auto_574780 - SURFACE
      ?auto_574781 - SURFACE
      ?auto_574783 - SURFACE
      ?auto_574782 - SURFACE
      ?auto_574784 - SURFACE
      ?auto_574785 - SURFACE
      ?auto_574786 - SURFACE
      ?auto_574787 - SURFACE
      ?auto_574788 - SURFACE
      ?auto_574789 - SURFACE
    )
    :vars
    (
      ?auto_574790 - HOIST
      ?auto_574791 - PLACE
      ?auto_574794 - TRUCK
      ?auto_574793 - PLACE
      ?auto_574795 - HOIST
      ?auto_574792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_574790 ?auto_574791 ) ( SURFACE-AT ?auto_574788 ?auto_574791 ) ( CLEAR ?auto_574788 ) ( IS-CRATE ?auto_574789 ) ( not ( = ?auto_574788 ?auto_574789 ) ) ( AVAILABLE ?auto_574790 ) ( ON ?auto_574788 ?auto_574787 ) ( not ( = ?auto_574787 ?auto_574788 ) ) ( not ( = ?auto_574787 ?auto_574789 ) ) ( TRUCK-AT ?auto_574794 ?auto_574793 ) ( not ( = ?auto_574793 ?auto_574791 ) ) ( HOIST-AT ?auto_574795 ?auto_574793 ) ( not ( = ?auto_574790 ?auto_574795 ) ) ( AVAILABLE ?auto_574795 ) ( SURFACE-AT ?auto_574789 ?auto_574793 ) ( ON ?auto_574789 ?auto_574792 ) ( CLEAR ?auto_574789 ) ( not ( = ?auto_574788 ?auto_574792 ) ) ( not ( = ?auto_574789 ?auto_574792 ) ) ( not ( = ?auto_574787 ?auto_574792 ) ) ( ON ?auto_574780 ?auto_574779 ) ( ON ?auto_574781 ?auto_574780 ) ( ON ?auto_574783 ?auto_574781 ) ( ON ?auto_574782 ?auto_574783 ) ( ON ?auto_574784 ?auto_574782 ) ( ON ?auto_574785 ?auto_574784 ) ( ON ?auto_574786 ?auto_574785 ) ( ON ?auto_574787 ?auto_574786 ) ( not ( = ?auto_574779 ?auto_574780 ) ) ( not ( = ?auto_574779 ?auto_574781 ) ) ( not ( = ?auto_574779 ?auto_574783 ) ) ( not ( = ?auto_574779 ?auto_574782 ) ) ( not ( = ?auto_574779 ?auto_574784 ) ) ( not ( = ?auto_574779 ?auto_574785 ) ) ( not ( = ?auto_574779 ?auto_574786 ) ) ( not ( = ?auto_574779 ?auto_574787 ) ) ( not ( = ?auto_574779 ?auto_574788 ) ) ( not ( = ?auto_574779 ?auto_574789 ) ) ( not ( = ?auto_574779 ?auto_574792 ) ) ( not ( = ?auto_574780 ?auto_574781 ) ) ( not ( = ?auto_574780 ?auto_574783 ) ) ( not ( = ?auto_574780 ?auto_574782 ) ) ( not ( = ?auto_574780 ?auto_574784 ) ) ( not ( = ?auto_574780 ?auto_574785 ) ) ( not ( = ?auto_574780 ?auto_574786 ) ) ( not ( = ?auto_574780 ?auto_574787 ) ) ( not ( = ?auto_574780 ?auto_574788 ) ) ( not ( = ?auto_574780 ?auto_574789 ) ) ( not ( = ?auto_574780 ?auto_574792 ) ) ( not ( = ?auto_574781 ?auto_574783 ) ) ( not ( = ?auto_574781 ?auto_574782 ) ) ( not ( = ?auto_574781 ?auto_574784 ) ) ( not ( = ?auto_574781 ?auto_574785 ) ) ( not ( = ?auto_574781 ?auto_574786 ) ) ( not ( = ?auto_574781 ?auto_574787 ) ) ( not ( = ?auto_574781 ?auto_574788 ) ) ( not ( = ?auto_574781 ?auto_574789 ) ) ( not ( = ?auto_574781 ?auto_574792 ) ) ( not ( = ?auto_574783 ?auto_574782 ) ) ( not ( = ?auto_574783 ?auto_574784 ) ) ( not ( = ?auto_574783 ?auto_574785 ) ) ( not ( = ?auto_574783 ?auto_574786 ) ) ( not ( = ?auto_574783 ?auto_574787 ) ) ( not ( = ?auto_574783 ?auto_574788 ) ) ( not ( = ?auto_574783 ?auto_574789 ) ) ( not ( = ?auto_574783 ?auto_574792 ) ) ( not ( = ?auto_574782 ?auto_574784 ) ) ( not ( = ?auto_574782 ?auto_574785 ) ) ( not ( = ?auto_574782 ?auto_574786 ) ) ( not ( = ?auto_574782 ?auto_574787 ) ) ( not ( = ?auto_574782 ?auto_574788 ) ) ( not ( = ?auto_574782 ?auto_574789 ) ) ( not ( = ?auto_574782 ?auto_574792 ) ) ( not ( = ?auto_574784 ?auto_574785 ) ) ( not ( = ?auto_574784 ?auto_574786 ) ) ( not ( = ?auto_574784 ?auto_574787 ) ) ( not ( = ?auto_574784 ?auto_574788 ) ) ( not ( = ?auto_574784 ?auto_574789 ) ) ( not ( = ?auto_574784 ?auto_574792 ) ) ( not ( = ?auto_574785 ?auto_574786 ) ) ( not ( = ?auto_574785 ?auto_574787 ) ) ( not ( = ?auto_574785 ?auto_574788 ) ) ( not ( = ?auto_574785 ?auto_574789 ) ) ( not ( = ?auto_574785 ?auto_574792 ) ) ( not ( = ?auto_574786 ?auto_574787 ) ) ( not ( = ?auto_574786 ?auto_574788 ) ) ( not ( = ?auto_574786 ?auto_574789 ) ) ( not ( = ?auto_574786 ?auto_574792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_574787 ?auto_574788 ?auto_574789 )
      ( MAKE-10CRATE-VERIFY ?auto_574779 ?auto_574780 ?auto_574781 ?auto_574783 ?auto_574782 ?auto_574784 ?auto_574785 ?auto_574786 ?auto_574787 ?auto_574788 ?auto_574789 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_574905 - SURFACE
      ?auto_574906 - SURFACE
      ?auto_574907 - SURFACE
      ?auto_574909 - SURFACE
      ?auto_574908 - SURFACE
      ?auto_574910 - SURFACE
      ?auto_574911 - SURFACE
      ?auto_574912 - SURFACE
      ?auto_574913 - SURFACE
      ?auto_574914 - SURFACE
      ?auto_574915 - SURFACE
    )
    :vars
    (
      ?auto_574916 - HOIST
      ?auto_574921 - PLACE
      ?auto_574917 - PLACE
      ?auto_574918 - HOIST
      ?auto_574920 - SURFACE
      ?auto_574919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_574916 ?auto_574921 ) ( SURFACE-AT ?auto_574914 ?auto_574921 ) ( CLEAR ?auto_574914 ) ( IS-CRATE ?auto_574915 ) ( not ( = ?auto_574914 ?auto_574915 ) ) ( AVAILABLE ?auto_574916 ) ( ON ?auto_574914 ?auto_574913 ) ( not ( = ?auto_574913 ?auto_574914 ) ) ( not ( = ?auto_574913 ?auto_574915 ) ) ( not ( = ?auto_574917 ?auto_574921 ) ) ( HOIST-AT ?auto_574918 ?auto_574917 ) ( not ( = ?auto_574916 ?auto_574918 ) ) ( AVAILABLE ?auto_574918 ) ( SURFACE-AT ?auto_574915 ?auto_574917 ) ( ON ?auto_574915 ?auto_574920 ) ( CLEAR ?auto_574915 ) ( not ( = ?auto_574914 ?auto_574920 ) ) ( not ( = ?auto_574915 ?auto_574920 ) ) ( not ( = ?auto_574913 ?auto_574920 ) ) ( TRUCK-AT ?auto_574919 ?auto_574921 ) ( ON ?auto_574906 ?auto_574905 ) ( ON ?auto_574907 ?auto_574906 ) ( ON ?auto_574909 ?auto_574907 ) ( ON ?auto_574908 ?auto_574909 ) ( ON ?auto_574910 ?auto_574908 ) ( ON ?auto_574911 ?auto_574910 ) ( ON ?auto_574912 ?auto_574911 ) ( ON ?auto_574913 ?auto_574912 ) ( not ( = ?auto_574905 ?auto_574906 ) ) ( not ( = ?auto_574905 ?auto_574907 ) ) ( not ( = ?auto_574905 ?auto_574909 ) ) ( not ( = ?auto_574905 ?auto_574908 ) ) ( not ( = ?auto_574905 ?auto_574910 ) ) ( not ( = ?auto_574905 ?auto_574911 ) ) ( not ( = ?auto_574905 ?auto_574912 ) ) ( not ( = ?auto_574905 ?auto_574913 ) ) ( not ( = ?auto_574905 ?auto_574914 ) ) ( not ( = ?auto_574905 ?auto_574915 ) ) ( not ( = ?auto_574905 ?auto_574920 ) ) ( not ( = ?auto_574906 ?auto_574907 ) ) ( not ( = ?auto_574906 ?auto_574909 ) ) ( not ( = ?auto_574906 ?auto_574908 ) ) ( not ( = ?auto_574906 ?auto_574910 ) ) ( not ( = ?auto_574906 ?auto_574911 ) ) ( not ( = ?auto_574906 ?auto_574912 ) ) ( not ( = ?auto_574906 ?auto_574913 ) ) ( not ( = ?auto_574906 ?auto_574914 ) ) ( not ( = ?auto_574906 ?auto_574915 ) ) ( not ( = ?auto_574906 ?auto_574920 ) ) ( not ( = ?auto_574907 ?auto_574909 ) ) ( not ( = ?auto_574907 ?auto_574908 ) ) ( not ( = ?auto_574907 ?auto_574910 ) ) ( not ( = ?auto_574907 ?auto_574911 ) ) ( not ( = ?auto_574907 ?auto_574912 ) ) ( not ( = ?auto_574907 ?auto_574913 ) ) ( not ( = ?auto_574907 ?auto_574914 ) ) ( not ( = ?auto_574907 ?auto_574915 ) ) ( not ( = ?auto_574907 ?auto_574920 ) ) ( not ( = ?auto_574909 ?auto_574908 ) ) ( not ( = ?auto_574909 ?auto_574910 ) ) ( not ( = ?auto_574909 ?auto_574911 ) ) ( not ( = ?auto_574909 ?auto_574912 ) ) ( not ( = ?auto_574909 ?auto_574913 ) ) ( not ( = ?auto_574909 ?auto_574914 ) ) ( not ( = ?auto_574909 ?auto_574915 ) ) ( not ( = ?auto_574909 ?auto_574920 ) ) ( not ( = ?auto_574908 ?auto_574910 ) ) ( not ( = ?auto_574908 ?auto_574911 ) ) ( not ( = ?auto_574908 ?auto_574912 ) ) ( not ( = ?auto_574908 ?auto_574913 ) ) ( not ( = ?auto_574908 ?auto_574914 ) ) ( not ( = ?auto_574908 ?auto_574915 ) ) ( not ( = ?auto_574908 ?auto_574920 ) ) ( not ( = ?auto_574910 ?auto_574911 ) ) ( not ( = ?auto_574910 ?auto_574912 ) ) ( not ( = ?auto_574910 ?auto_574913 ) ) ( not ( = ?auto_574910 ?auto_574914 ) ) ( not ( = ?auto_574910 ?auto_574915 ) ) ( not ( = ?auto_574910 ?auto_574920 ) ) ( not ( = ?auto_574911 ?auto_574912 ) ) ( not ( = ?auto_574911 ?auto_574913 ) ) ( not ( = ?auto_574911 ?auto_574914 ) ) ( not ( = ?auto_574911 ?auto_574915 ) ) ( not ( = ?auto_574911 ?auto_574920 ) ) ( not ( = ?auto_574912 ?auto_574913 ) ) ( not ( = ?auto_574912 ?auto_574914 ) ) ( not ( = ?auto_574912 ?auto_574915 ) ) ( not ( = ?auto_574912 ?auto_574920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_574913 ?auto_574914 ?auto_574915 )
      ( MAKE-10CRATE-VERIFY ?auto_574905 ?auto_574906 ?auto_574907 ?auto_574909 ?auto_574908 ?auto_574910 ?auto_574911 ?auto_574912 ?auto_574913 ?auto_574914 ?auto_574915 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575031 - SURFACE
      ?auto_575032 - SURFACE
      ?auto_575033 - SURFACE
      ?auto_575035 - SURFACE
      ?auto_575034 - SURFACE
      ?auto_575036 - SURFACE
      ?auto_575037 - SURFACE
      ?auto_575038 - SURFACE
      ?auto_575039 - SURFACE
      ?auto_575040 - SURFACE
      ?auto_575041 - SURFACE
    )
    :vars
    (
      ?auto_575046 - HOIST
      ?auto_575045 - PLACE
      ?auto_575042 - PLACE
      ?auto_575043 - HOIST
      ?auto_575044 - SURFACE
      ?auto_575047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575046 ?auto_575045 ) ( IS-CRATE ?auto_575041 ) ( not ( = ?auto_575040 ?auto_575041 ) ) ( not ( = ?auto_575039 ?auto_575040 ) ) ( not ( = ?auto_575039 ?auto_575041 ) ) ( not ( = ?auto_575042 ?auto_575045 ) ) ( HOIST-AT ?auto_575043 ?auto_575042 ) ( not ( = ?auto_575046 ?auto_575043 ) ) ( AVAILABLE ?auto_575043 ) ( SURFACE-AT ?auto_575041 ?auto_575042 ) ( ON ?auto_575041 ?auto_575044 ) ( CLEAR ?auto_575041 ) ( not ( = ?auto_575040 ?auto_575044 ) ) ( not ( = ?auto_575041 ?auto_575044 ) ) ( not ( = ?auto_575039 ?auto_575044 ) ) ( TRUCK-AT ?auto_575047 ?auto_575045 ) ( SURFACE-AT ?auto_575039 ?auto_575045 ) ( CLEAR ?auto_575039 ) ( LIFTING ?auto_575046 ?auto_575040 ) ( IS-CRATE ?auto_575040 ) ( ON ?auto_575032 ?auto_575031 ) ( ON ?auto_575033 ?auto_575032 ) ( ON ?auto_575035 ?auto_575033 ) ( ON ?auto_575034 ?auto_575035 ) ( ON ?auto_575036 ?auto_575034 ) ( ON ?auto_575037 ?auto_575036 ) ( ON ?auto_575038 ?auto_575037 ) ( ON ?auto_575039 ?auto_575038 ) ( not ( = ?auto_575031 ?auto_575032 ) ) ( not ( = ?auto_575031 ?auto_575033 ) ) ( not ( = ?auto_575031 ?auto_575035 ) ) ( not ( = ?auto_575031 ?auto_575034 ) ) ( not ( = ?auto_575031 ?auto_575036 ) ) ( not ( = ?auto_575031 ?auto_575037 ) ) ( not ( = ?auto_575031 ?auto_575038 ) ) ( not ( = ?auto_575031 ?auto_575039 ) ) ( not ( = ?auto_575031 ?auto_575040 ) ) ( not ( = ?auto_575031 ?auto_575041 ) ) ( not ( = ?auto_575031 ?auto_575044 ) ) ( not ( = ?auto_575032 ?auto_575033 ) ) ( not ( = ?auto_575032 ?auto_575035 ) ) ( not ( = ?auto_575032 ?auto_575034 ) ) ( not ( = ?auto_575032 ?auto_575036 ) ) ( not ( = ?auto_575032 ?auto_575037 ) ) ( not ( = ?auto_575032 ?auto_575038 ) ) ( not ( = ?auto_575032 ?auto_575039 ) ) ( not ( = ?auto_575032 ?auto_575040 ) ) ( not ( = ?auto_575032 ?auto_575041 ) ) ( not ( = ?auto_575032 ?auto_575044 ) ) ( not ( = ?auto_575033 ?auto_575035 ) ) ( not ( = ?auto_575033 ?auto_575034 ) ) ( not ( = ?auto_575033 ?auto_575036 ) ) ( not ( = ?auto_575033 ?auto_575037 ) ) ( not ( = ?auto_575033 ?auto_575038 ) ) ( not ( = ?auto_575033 ?auto_575039 ) ) ( not ( = ?auto_575033 ?auto_575040 ) ) ( not ( = ?auto_575033 ?auto_575041 ) ) ( not ( = ?auto_575033 ?auto_575044 ) ) ( not ( = ?auto_575035 ?auto_575034 ) ) ( not ( = ?auto_575035 ?auto_575036 ) ) ( not ( = ?auto_575035 ?auto_575037 ) ) ( not ( = ?auto_575035 ?auto_575038 ) ) ( not ( = ?auto_575035 ?auto_575039 ) ) ( not ( = ?auto_575035 ?auto_575040 ) ) ( not ( = ?auto_575035 ?auto_575041 ) ) ( not ( = ?auto_575035 ?auto_575044 ) ) ( not ( = ?auto_575034 ?auto_575036 ) ) ( not ( = ?auto_575034 ?auto_575037 ) ) ( not ( = ?auto_575034 ?auto_575038 ) ) ( not ( = ?auto_575034 ?auto_575039 ) ) ( not ( = ?auto_575034 ?auto_575040 ) ) ( not ( = ?auto_575034 ?auto_575041 ) ) ( not ( = ?auto_575034 ?auto_575044 ) ) ( not ( = ?auto_575036 ?auto_575037 ) ) ( not ( = ?auto_575036 ?auto_575038 ) ) ( not ( = ?auto_575036 ?auto_575039 ) ) ( not ( = ?auto_575036 ?auto_575040 ) ) ( not ( = ?auto_575036 ?auto_575041 ) ) ( not ( = ?auto_575036 ?auto_575044 ) ) ( not ( = ?auto_575037 ?auto_575038 ) ) ( not ( = ?auto_575037 ?auto_575039 ) ) ( not ( = ?auto_575037 ?auto_575040 ) ) ( not ( = ?auto_575037 ?auto_575041 ) ) ( not ( = ?auto_575037 ?auto_575044 ) ) ( not ( = ?auto_575038 ?auto_575039 ) ) ( not ( = ?auto_575038 ?auto_575040 ) ) ( not ( = ?auto_575038 ?auto_575041 ) ) ( not ( = ?auto_575038 ?auto_575044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575039 ?auto_575040 ?auto_575041 )
      ( MAKE-10CRATE-VERIFY ?auto_575031 ?auto_575032 ?auto_575033 ?auto_575035 ?auto_575034 ?auto_575036 ?auto_575037 ?auto_575038 ?auto_575039 ?auto_575040 ?auto_575041 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575157 - SURFACE
      ?auto_575158 - SURFACE
      ?auto_575159 - SURFACE
      ?auto_575161 - SURFACE
      ?auto_575160 - SURFACE
      ?auto_575162 - SURFACE
      ?auto_575163 - SURFACE
      ?auto_575164 - SURFACE
      ?auto_575165 - SURFACE
      ?auto_575166 - SURFACE
      ?auto_575167 - SURFACE
    )
    :vars
    (
      ?auto_575170 - HOIST
      ?auto_575168 - PLACE
      ?auto_575171 - PLACE
      ?auto_575169 - HOIST
      ?auto_575173 - SURFACE
      ?auto_575172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575170 ?auto_575168 ) ( IS-CRATE ?auto_575167 ) ( not ( = ?auto_575166 ?auto_575167 ) ) ( not ( = ?auto_575165 ?auto_575166 ) ) ( not ( = ?auto_575165 ?auto_575167 ) ) ( not ( = ?auto_575171 ?auto_575168 ) ) ( HOIST-AT ?auto_575169 ?auto_575171 ) ( not ( = ?auto_575170 ?auto_575169 ) ) ( AVAILABLE ?auto_575169 ) ( SURFACE-AT ?auto_575167 ?auto_575171 ) ( ON ?auto_575167 ?auto_575173 ) ( CLEAR ?auto_575167 ) ( not ( = ?auto_575166 ?auto_575173 ) ) ( not ( = ?auto_575167 ?auto_575173 ) ) ( not ( = ?auto_575165 ?auto_575173 ) ) ( TRUCK-AT ?auto_575172 ?auto_575168 ) ( SURFACE-AT ?auto_575165 ?auto_575168 ) ( CLEAR ?auto_575165 ) ( IS-CRATE ?auto_575166 ) ( AVAILABLE ?auto_575170 ) ( IN ?auto_575166 ?auto_575172 ) ( ON ?auto_575158 ?auto_575157 ) ( ON ?auto_575159 ?auto_575158 ) ( ON ?auto_575161 ?auto_575159 ) ( ON ?auto_575160 ?auto_575161 ) ( ON ?auto_575162 ?auto_575160 ) ( ON ?auto_575163 ?auto_575162 ) ( ON ?auto_575164 ?auto_575163 ) ( ON ?auto_575165 ?auto_575164 ) ( not ( = ?auto_575157 ?auto_575158 ) ) ( not ( = ?auto_575157 ?auto_575159 ) ) ( not ( = ?auto_575157 ?auto_575161 ) ) ( not ( = ?auto_575157 ?auto_575160 ) ) ( not ( = ?auto_575157 ?auto_575162 ) ) ( not ( = ?auto_575157 ?auto_575163 ) ) ( not ( = ?auto_575157 ?auto_575164 ) ) ( not ( = ?auto_575157 ?auto_575165 ) ) ( not ( = ?auto_575157 ?auto_575166 ) ) ( not ( = ?auto_575157 ?auto_575167 ) ) ( not ( = ?auto_575157 ?auto_575173 ) ) ( not ( = ?auto_575158 ?auto_575159 ) ) ( not ( = ?auto_575158 ?auto_575161 ) ) ( not ( = ?auto_575158 ?auto_575160 ) ) ( not ( = ?auto_575158 ?auto_575162 ) ) ( not ( = ?auto_575158 ?auto_575163 ) ) ( not ( = ?auto_575158 ?auto_575164 ) ) ( not ( = ?auto_575158 ?auto_575165 ) ) ( not ( = ?auto_575158 ?auto_575166 ) ) ( not ( = ?auto_575158 ?auto_575167 ) ) ( not ( = ?auto_575158 ?auto_575173 ) ) ( not ( = ?auto_575159 ?auto_575161 ) ) ( not ( = ?auto_575159 ?auto_575160 ) ) ( not ( = ?auto_575159 ?auto_575162 ) ) ( not ( = ?auto_575159 ?auto_575163 ) ) ( not ( = ?auto_575159 ?auto_575164 ) ) ( not ( = ?auto_575159 ?auto_575165 ) ) ( not ( = ?auto_575159 ?auto_575166 ) ) ( not ( = ?auto_575159 ?auto_575167 ) ) ( not ( = ?auto_575159 ?auto_575173 ) ) ( not ( = ?auto_575161 ?auto_575160 ) ) ( not ( = ?auto_575161 ?auto_575162 ) ) ( not ( = ?auto_575161 ?auto_575163 ) ) ( not ( = ?auto_575161 ?auto_575164 ) ) ( not ( = ?auto_575161 ?auto_575165 ) ) ( not ( = ?auto_575161 ?auto_575166 ) ) ( not ( = ?auto_575161 ?auto_575167 ) ) ( not ( = ?auto_575161 ?auto_575173 ) ) ( not ( = ?auto_575160 ?auto_575162 ) ) ( not ( = ?auto_575160 ?auto_575163 ) ) ( not ( = ?auto_575160 ?auto_575164 ) ) ( not ( = ?auto_575160 ?auto_575165 ) ) ( not ( = ?auto_575160 ?auto_575166 ) ) ( not ( = ?auto_575160 ?auto_575167 ) ) ( not ( = ?auto_575160 ?auto_575173 ) ) ( not ( = ?auto_575162 ?auto_575163 ) ) ( not ( = ?auto_575162 ?auto_575164 ) ) ( not ( = ?auto_575162 ?auto_575165 ) ) ( not ( = ?auto_575162 ?auto_575166 ) ) ( not ( = ?auto_575162 ?auto_575167 ) ) ( not ( = ?auto_575162 ?auto_575173 ) ) ( not ( = ?auto_575163 ?auto_575164 ) ) ( not ( = ?auto_575163 ?auto_575165 ) ) ( not ( = ?auto_575163 ?auto_575166 ) ) ( not ( = ?auto_575163 ?auto_575167 ) ) ( not ( = ?auto_575163 ?auto_575173 ) ) ( not ( = ?auto_575164 ?auto_575165 ) ) ( not ( = ?auto_575164 ?auto_575166 ) ) ( not ( = ?auto_575164 ?auto_575167 ) ) ( not ( = ?auto_575164 ?auto_575173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575165 ?auto_575166 ?auto_575167 )
      ( MAKE-10CRATE-VERIFY ?auto_575157 ?auto_575158 ?auto_575159 ?auto_575161 ?auto_575160 ?auto_575162 ?auto_575163 ?auto_575164 ?auto_575165 ?auto_575166 ?auto_575167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_575174 - SURFACE
      ?auto_575175 - SURFACE
    )
    :vars
    (
      ?auto_575178 - HOIST
      ?auto_575176 - PLACE
      ?auto_575182 - SURFACE
      ?auto_575179 - PLACE
      ?auto_575177 - HOIST
      ?auto_575181 - SURFACE
      ?auto_575180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575178 ?auto_575176 ) ( IS-CRATE ?auto_575175 ) ( not ( = ?auto_575174 ?auto_575175 ) ) ( not ( = ?auto_575182 ?auto_575174 ) ) ( not ( = ?auto_575182 ?auto_575175 ) ) ( not ( = ?auto_575179 ?auto_575176 ) ) ( HOIST-AT ?auto_575177 ?auto_575179 ) ( not ( = ?auto_575178 ?auto_575177 ) ) ( AVAILABLE ?auto_575177 ) ( SURFACE-AT ?auto_575175 ?auto_575179 ) ( ON ?auto_575175 ?auto_575181 ) ( CLEAR ?auto_575175 ) ( not ( = ?auto_575174 ?auto_575181 ) ) ( not ( = ?auto_575175 ?auto_575181 ) ) ( not ( = ?auto_575182 ?auto_575181 ) ) ( SURFACE-AT ?auto_575182 ?auto_575176 ) ( CLEAR ?auto_575182 ) ( IS-CRATE ?auto_575174 ) ( AVAILABLE ?auto_575178 ) ( IN ?auto_575174 ?auto_575180 ) ( TRUCK-AT ?auto_575180 ?auto_575179 ) )
    :subtasks
    ( ( !DRIVE ?auto_575180 ?auto_575179 ?auto_575176 )
      ( MAKE-2CRATE ?auto_575182 ?auto_575174 ?auto_575175 )
      ( MAKE-1CRATE-VERIFY ?auto_575174 ?auto_575175 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_575183 - SURFACE
      ?auto_575184 - SURFACE
      ?auto_575185 - SURFACE
    )
    :vars
    (
      ?auto_575186 - HOIST
      ?auto_575187 - PLACE
      ?auto_575188 - PLACE
      ?auto_575191 - HOIST
      ?auto_575189 - SURFACE
      ?auto_575190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575186 ?auto_575187 ) ( IS-CRATE ?auto_575185 ) ( not ( = ?auto_575184 ?auto_575185 ) ) ( not ( = ?auto_575183 ?auto_575184 ) ) ( not ( = ?auto_575183 ?auto_575185 ) ) ( not ( = ?auto_575188 ?auto_575187 ) ) ( HOIST-AT ?auto_575191 ?auto_575188 ) ( not ( = ?auto_575186 ?auto_575191 ) ) ( AVAILABLE ?auto_575191 ) ( SURFACE-AT ?auto_575185 ?auto_575188 ) ( ON ?auto_575185 ?auto_575189 ) ( CLEAR ?auto_575185 ) ( not ( = ?auto_575184 ?auto_575189 ) ) ( not ( = ?auto_575185 ?auto_575189 ) ) ( not ( = ?auto_575183 ?auto_575189 ) ) ( SURFACE-AT ?auto_575183 ?auto_575187 ) ( CLEAR ?auto_575183 ) ( IS-CRATE ?auto_575184 ) ( AVAILABLE ?auto_575186 ) ( IN ?auto_575184 ?auto_575190 ) ( TRUCK-AT ?auto_575190 ?auto_575188 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_575184 ?auto_575185 )
      ( MAKE-2CRATE-VERIFY ?auto_575183 ?auto_575184 ?auto_575185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_575192 - SURFACE
      ?auto_575193 - SURFACE
      ?auto_575194 - SURFACE
      ?auto_575195 - SURFACE
    )
    :vars
    (
      ?auto_575197 - HOIST
      ?auto_575198 - PLACE
      ?auto_575201 - PLACE
      ?auto_575199 - HOIST
      ?auto_575196 - SURFACE
      ?auto_575200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575197 ?auto_575198 ) ( IS-CRATE ?auto_575195 ) ( not ( = ?auto_575194 ?auto_575195 ) ) ( not ( = ?auto_575193 ?auto_575194 ) ) ( not ( = ?auto_575193 ?auto_575195 ) ) ( not ( = ?auto_575201 ?auto_575198 ) ) ( HOIST-AT ?auto_575199 ?auto_575201 ) ( not ( = ?auto_575197 ?auto_575199 ) ) ( AVAILABLE ?auto_575199 ) ( SURFACE-AT ?auto_575195 ?auto_575201 ) ( ON ?auto_575195 ?auto_575196 ) ( CLEAR ?auto_575195 ) ( not ( = ?auto_575194 ?auto_575196 ) ) ( not ( = ?auto_575195 ?auto_575196 ) ) ( not ( = ?auto_575193 ?auto_575196 ) ) ( SURFACE-AT ?auto_575193 ?auto_575198 ) ( CLEAR ?auto_575193 ) ( IS-CRATE ?auto_575194 ) ( AVAILABLE ?auto_575197 ) ( IN ?auto_575194 ?auto_575200 ) ( TRUCK-AT ?auto_575200 ?auto_575201 ) ( ON ?auto_575193 ?auto_575192 ) ( not ( = ?auto_575192 ?auto_575193 ) ) ( not ( = ?auto_575192 ?auto_575194 ) ) ( not ( = ?auto_575192 ?auto_575195 ) ) ( not ( = ?auto_575192 ?auto_575196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575193 ?auto_575194 ?auto_575195 )
      ( MAKE-3CRATE-VERIFY ?auto_575192 ?auto_575193 ?auto_575194 ?auto_575195 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_575202 - SURFACE
      ?auto_575203 - SURFACE
      ?auto_575204 - SURFACE
      ?auto_575206 - SURFACE
      ?auto_575205 - SURFACE
    )
    :vars
    (
      ?auto_575208 - HOIST
      ?auto_575209 - PLACE
      ?auto_575212 - PLACE
      ?auto_575210 - HOIST
      ?auto_575207 - SURFACE
      ?auto_575211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575208 ?auto_575209 ) ( IS-CRATE ?auto_575205 ) ( not ( = ?auto_575206 ?auto_575205 ) ) ( not ( = ?auto_575204 ?auto_575206 ) ) ( not ( = ?auto_575204 ?auto_575205 ) ) ( not ( = ?auto_575212 ?auto_575209 ) ) ( HOIST-AT ?auto_575210 ?auto_575212 ) ( not ( = ?auto_575208 ?auto_575210 ) ) ( AVAILABLE ?auto_575210 ) ( SURFACE-AT ?auto_575205 ?auto_575212 ) ( ON ?auto_575205 ?auto_575207 ) ( CLEAR ?auto_575205 ) ( not ( = ?auto_575206 ?auto_575207 ) ) ( not ( = ?auto_575205 ?auto_575207 ) ) ( not ( = ?auto_575204 ?auto_575207 ) ) ( SURFACE-AT ?auto_575204 ?auto_575209 ) ( CLEAR ?auto_575204 ) ( IS-CRATE ?auto_575206 ) ( AVAILABLE ?auto_575208 ) ( IN ?auto_575206 ?auto_575211 ) ( TRUCK-AT ?auto_575211 ?auto_575212 ) ( ON ?auto_575203 ?auto_575202 ) ( ON ?auto_575204 ?auto_575203 ) ( not ( = ?auto_575202 ?auto_575203 ) ) ( not ( = ?auto_575202 ?auto_575204 ) ) ( not ( = ?auto_575202 ?auto_575206 ) ) ( not ( = ?auto_575202 ?auto_575205 ) ) ( not ( = ?auto_575202 ?auto_575207 ) ) ( not ( = ?auto_575203 ?auto_575204 ) ) ( not ( = ?auto_575203 ?auto_575206 ) ) ( not ( = ?auto_575203 ?auto_575205 ) ) ( not ( = ?auto_575203 ?auto_575207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575204 ?auto_575206 ?auto_575205 )
      ( MAKE-4CRATE-VERIFY ?auto_575202 ?auto_575203 ?auto_575204 ?auto_575206 ?auto_575205 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_575213 - SURFACE
      ?auto_575214 - SURFACE
      ?auto_575215 - SURFACE
      ?auto_575217 - SURFACE
      ?auto_575216 - SURFACE
      ?auto_575218 - SURFACE
    )
    :vars
    (
      ?auto_575220 - HOIST
      ?auto_575221 - PLACE
      ?auto_575224 - PLACE
      ?auto_575222 - HOIST
      ?auto_575219 - SURFACE
      ?auto_575223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575220 ?auto_575221 ) ( IS-CRATE ?auto_575218 ) ( not ( = ?auto_575216 ?auto_575218 ) ) ( not ( = ?auto_575217 ?auto_575216 ) ) ( not ( = ?auto_575217 ?auto_575218 ) ) ( not ( = ?auto_575224 ?auto_575221 ) ) ( HOIST-AT ?auto_575222 ?auto_575224 ) ( not ( = ?auto_575220 ?auto_575222 ) ) ( AVAILABLE ?auto_575222 ) ( SURFACE-AT ?auto_575218 ?auto_575224 ) ( ON ?auto_575218 ?auto_575219 ) ( CLEAR ?auto_575218 ) ( not ( = ?auto_575216 ?auto_575219 ) ) ( not ( = ?auto_575218 ?auto_575219 ) ) ( not ( = ?auto_575217 ?auto_575219 ) ) ( SURFACE-AT ?auto_575217 ?auto_575221 ) ( CLEAR ?auto_575217 ) ( IS-CRATE ?auto_575216 ) ( AVAILABLE ?auto_575220 ) ( IN ?auto_575216 ?auto_575223 ) ( TRUCK-AT ?auto_575223 ?auto_575224 ) ( ON ?auto_575214 ?auto_575213 ) ( ON ?auto_575215 ?auto_575214 ) ( ON ?auto_575217 ?auto_575215 ) ( not ( = ?auto_575213 ?auto_575214 ) ) ( not ( = ?auto_575213 ?auto_575215 ) ) ( not ( = ?auto_575213 ?auto_575217 ) ) ( not ( = ?auto_575213 ?auto_575216 ) ) ( not ( = ?auto_575213 ?auto_575218 ) ) ( not ( = ?auto_575213 ?auto_575219 ) ) ( not ( = ?auto_575214 ?auto_575215 ) ) ( not ( = ?auto_575214 ?auto_575217 ) ) ( not ( = ?auto_575214 ?auto_575216 ) ) ( not ( = ?auto_575214 ?auto_575218 ) ) ( not ( = ?auto_575214 ?auto_575219 ) ) ( not ( = ?auto_575215 ?auto_575217 ) ) ( not ( = ?auto_575215 ?auto_575216 ) ) ( not ( = ?auto_575215 ?auto_575218 ) ) ( not ( = ?auto_575215 ?auto_575219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575217 ?auto_575216 ?auto_575218 )
      ( MAKE-5CRATE-VERIFY ?auto_575213 ?auto_575214 ?auto_575215 ?auto_575217 ?auto_575216 ?auto_575218 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_575225 - SURFACE
      ?auto_575226 - SURFACE
      ?auto_575227 - SURFACE
      ?auto_575229 - SURFACE
      ?auto_575228 - SURFACE
      ?auto_575230 - SURFACE
      ?auto_575231 - SURFACE
    )
    :vars
    (
      ?auto_575233 - HOIST
      ?auto_575234 - PLACE
      ?auto_575237 - PLACE
      ?auto_575235 - HOIST
      ?auto_575232 - SURFACE
      ?auto_575236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575233 ?auto_575234 ) ( IS-CRATE ?auto_575231 ) ( not ( = ?auto_575230 ?auto_575231 ) ) ( not ( = ?auto_575228 ?auto_575230 ) ) ( not ( = ?auto_575228 ?auto_575231 ) ) ( not ( = ?auto_575237 ?auto_575234 ) ) ( HOIST-AT ?auto_575235 ?auto_575237 ) ( not ( = ?auto_575233 ?auto_575235 ) ) ( AVAILABLE ?auto_575235 ) ( SURFACE-AT ?auto_575231 ?auto_575237 ) ( ON ?auto_575231 ?auto_575232 ) ( CLEAR ?auto_575231 ) ( not ( = ?auto_575230 ?auto_575232 ) ) ( not ( = ?auto_575231 ?auto_575232 ) ) ( not ( = ?auto_575228 ?auto_575232 ) ) ( SURFACE-AT ?auto_575228 ?auto_575234 ) ( CLEAR ?auto_575228 ) ( IS-CRATE ?auto_575230 ) ( AVAILABLE ?auto_575233 ) ( IN ?auto_575230 ?auto_575236 ) ( TRUCK-AT ?auto_575236 ?auto_575237 ) ( ON ?auto_575226 ?auto_575225 ) ( ON ?auto_575227 ?auto_575226 ) ( ON ?auto_575229 ?auto_575227 ) ( ON ?auto_575228 ?auto_575229 ) ( not ( = ?auto_575225 ?auto_575226 ) ) ( not ( = ?auto_575225 ?auto_575227 ) ) ( not ( = ?auto_575225 ?auto_575229 ) ) ( not ( = ?auto_575225 ?auto_575228 ) ) ( not ( = ?auto_575225 ?auto_575230 ) ) ( not ( = ?auto_575225 ?auto_575231 ) ) ( not ( = ?auto_575225 ?auto_575232 ) ) ( not ( = ?auto_575226 ?auto_575227 ) ) ( not ( = ?auto_575226 ?auto_575229 ) ) ( not ( = ?auto_575226 ?auto_575228 ) ) ( not ( = ?auto_575226 ?auto_575230 ) ) ( not ( = ?auto_575226 ?auto_575231 ) ) ( not ( = ?auto_575226 ?auto_575232 ) ) ( not ( = ?auto_575227 ?auto_575229 ) ) ( not ( = ?auto_575227 ?auto_575228 ) ) ( not ( = ?auto_575227 ?auto_575230 ) ) ( not ( = ?auto_575227 ?auto_575231 ) ) ( not ( = ?auto_575227 ?auto_575232 ) ) ( not ( = ?auto_575229 ?auto_575228 ) ) ( not ( = ?auto_575229 ?auto_575230 ) ) ( not ( = ?auto_575229 ?auto_575231 ) ) ( not ( = ?auto_575229 ?auto_575232 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575228 ?auto_575230 ?auto_575231 )
      ( MAKE-6CRATE-VERIFY ?auto_575225 ?auto_575226 ?auto_575227 ?auto_575229 ?auto_575228 ?auto_575230 ?auto_575231 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_575238 - SURFACE
      ?auto_575239 - SURFACE
      ?auto_575240 - SURFACE
      ?auto_575242 - SURFACE
      ?auto_575241 - SURFACE
      ?auto_575243 - SURFACE
      ?auto_575244 - SURFACE
      ?auto_575245 - SURFACE
    )
    :vars
    (
      ?auto_575247 - HOIST
      ?auto_575248 - PLACE
      ?auto_575251 - PLACE
      ?auto_575249 - HOIST
      ?auto_575246 - SURFACE
      ?auto_575250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575247 ?auto_575248 ) ( IS-CRATE ?auto_575245 ) ( not ( = ?auto_575244 ?auto_575245 ) ) ( not ( = ?auto_575243 ?auto_575244 ) ) ( not ( = ?auto_575243 ?auto_575245 ) ) ( not ( = ?auto_575251 ?auto_575248 ) ) ( HOIST-AT ?auto_575249 ?auto_575251 ) ( not ( = ?auto_575247 ?auto_575249 ) ) ( AVAILABLE ?auto_575249 ) ( SURFACE-AT ?auto_575245 ?auto_575251 ) ( ON ?auto_575245 ?auto_575246 ) ( CLEAR ?auto_575245 ) ( not ( = ?auto_575244 ?auto_575246 ) ) ( not ( = ?auto_575245 ?auto_575246 ) ) ( not ( = ?auto_575243 ?auto_575246 ) ) ( SURFACE-AT ?auto_575243 ?auto_575248 ) ( CLEAR ?auto_575243 ) ( IS-CRATE ?auto_575244 ) ( AVAILABLE ?auto_575247 ) ( IN ?auto_575244 ?auto_575250 ) ( TRUCK-AT ?auto_575250 ?auto_575251 ) ( ON ?auto_575239 ?auto_575238 ) ( ON ?auto_575240 ?auto_575239 ) ( ON ?auto_575242 ?auto_575240 ) ( ON ?auto_575241 ?auto_575242 ) ( ON ?auto_575243 ?auto_575241 ) ( not ( = ?auto_575238 ?auto_575239 ) ) ( not ( = ?auto_575238 ?auto_575240 ) ) ( not ( = ?auto_575238 ?auto_575242 ) ) ( not ( = ?auto_575238 ?auto_575241 ) ) ( not ( = ?auto_575238 ?auto_575243 ) ) ( not ( = ?auto_575238 ?auto_575244 ) ) ( not ( = ?auto_575238 ?auto_575245 ) ) ( not ( = ?auto_575238 ?auto_575246 ) ) ( not ( = ?auto_575239 ?auto_575240 ) ) ( not ( = ?auto_575239 ?auto_575242 ) ) ( not ( = ?auto_575239 ?auto_575241 ) ) ( not ( = ?auto_575239 ?auto_575243 ) ) ( not ( = ?auto_575239 ?auto_575244 ) ) ( not ( = ?auto_575239 ?auto_575245 ) ) ( not ( = ?auto_575239 ?auto_575246 ) ) ( not ( = ?auto_575240 ?auto_575242 ) ) ( not ( = ?auto_575240 ?auto_575241 ) ) ( not ( = ?auto_575240 ?auto_575243 ) ) ( not ( = ?auto_575240 ?auto_575244 ) ) ( not ( = ?auto_575240 ?auto_575245 ) ) ( not ( = ?auto_575240 ?auto_575246 ) ) ( not ( = ?auto_575242 ?auto_575241 ) ) ( not ( = ?auto_575242 ?auto_575243 ) ) ( not ( = ?auto_575242 ?auto_575244 ) ) ( not ( = ?auto_575242 ?auto_575245 ) ) ( not ( = ?auto_575242 ?auto_575246 ) ) ( not ( = ?auto_575241 ?auto_575243 ) ) ( not ( = ?auto_575241 ?auto_575244 ) ) ( not ( = ?auto_575241 ?auto_575245 ) ) ( not ( = ?auto_575241 ?auto_575246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575243 ?auto_575244 ?auto_575245 )
      ( MAKE-7CRATE-VERIFY ?auto_575238 ?auto_575239 ?auto_575240 ?auto_575242 ?auto_575241 ?auto_575243 ?auto_575244 ?auto_575245 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_575252 - SURFACE
      ?auto_575253 - SURFACE
      ?auto_575254 - SURFACE
      ?auto_575256 - SURFACE
      ?auto_575255 - SURFACE
      ?auto_575257 - SURFACE
      ?auto_575258 - SURFACE
      ?auto_575259 - SURFACE
      ?auto_575260 - SURFACE
    )
    :vars
    (
      ?auto_575262 - HOIST
      ?auto_575263 - PLACE
      ?auto_575266 - PLACE
      ?auto_575264 - HOIST
      ?auto_575261 - SURFACE
      ?auto_575265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575262 ?auto_575263 ) ( IS-CRATE ?auto_575260 ) ( not ( = ?auto_575259 ?auto_575260 ) ) ( not ( = ?auto_575258 ?auto_575259 ) ) ( not ( = ?auto_575258 ?auto_575260 ) ) ( not ( = ?auto_575266 ?auto_575263 ) ) ( HOIST-AT ?auto_575264 ?auto_575266 ) ( not ( = ?auto_575262 ?auto_575264 ) ) ( AVAILABLE ?auto_575264 ) ( SURFACE-AT ?auto_575260 ?auto_575266 ) ( ON ?auto_575260 ?auto_575261 ) ( CLEAR ?auto_575260 ) ( not ( = ?auto_575259 ?auto_575261 ) ) ( not ( = ?auto_575260 ?auto_575261 ) ) ( not ( = ?auto_575258 ?auto_575261 ) ) ( SURFACE-AT ?auto_575258 ?auto_575263 ) ( CLEAR ?auto_575258 ) ( IS-CRATE ?auto_575259 ) ( AVAILABLE ?auto_575262 ) ( IN ?auto_575259 ?auto_575265 ) ( TRUCK-AT ?auto_575265 ?auto_575266 ) ( ON ?auto_575253 ?auto_575252 ) ( ON ?auto_575254 ?auto_575253 ) ( ON ?auto_575256 ?auto_575254 ) ( ON ?auto_575255 ?auto_575256 ) ( ON ?auto_575257 ?auto_575255 ) ( ON ?auto_575258 ?auto_575257 ) ( not ( = ?auto_575252 ?auto_575253 ) ) ( not ( = ?auto_575252 ?auto_575254 ) ) ( not ( = ?auto_575252 ?auto_575256 ) ) ( not ( = ?auto_575252 ?auto_575255 ) ) ( not ( = ?auto_575252 ?auto_575257 ) ) ( not ( = ?auto_575252 ?auto_575258 ) ) ( not ( = ?auto_575252 ?auto_575259 ) ) ( not ( = ?auto_575252 ?auto_575260 ) ) ( not ( = ?auto_575252 ?auto_575261 ) ) ( not ( = ?auto_575253 ?auto_575254 ) ) ( not ( = ?auto_575253 ?auto_575256 ) ) ( not ( = ?auto_575253 ?auto_575255 ) ) ( not ( = ?auto_575253 ?auto_575257 ) ) ( not ( = ?auto_575253 ?auto_575258 ) ) ( not ( = ?auto_575253 ?auto_575259 ) ) ( not ( = ?auto_575253 ?auto_575260 ) ) ( not ( = ?auto_575253 ?auto_575261 ) ) ( not ( = ?auto_575254 ?auto_575256 ) ) ( not ( = ?auto_575254 ?auto_575255 ) ) ( not ( = ?auto_575254 ?auto_575257 ) ) ( not ( = ?auto_575254 ?auto_575258 ) ) ( not ( = ?auto_575254 ?auto_575259 ) ) ( not ( = ?auto_575254 ?auto_575260 ) ) ( not ( = ?auto_575254 ?auto_575261 ) ) ( not ( = ?auto_575256 ?auto_575255 ) ) ( not ( = ?auto_575256 ?auto_575257 ) ) ( not ( = ?auto_575256 ?auto_575258 ) ) ( not ( = ?auto_575256 ?auto_575259 ) ) ( not ( = ?auto_575256 ?auto_575260 ) ) ( not ( = ?auto_575256 ?auto_575261 ) ) ( not ( = ?auto_575255 ?auto_575257 ) ) ( not ( = ?auto_575255 ?auto_575258 ) ) ( not ( = ?auto_575255 ?auto_575259 ) ) ( not ( = ?auto_575255 ?auto_575260 ) ) ( not ( = ?auto_575255 ?auto_575261 ) ) ( not ( = ?auto_575257 ?auto_575258 ) ) ( not ( = ?auto_575257 ?auto_575259 ) ) ( not ( = ?auto_575257 ?auto_575260 ) ) ( not ( = ?auto_575257 ?auto_575261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575258 ?auto_575259 ?auto_575260 )
      ( MAKE-8CRATE-VERIFY ?auto_575252 ?auto_575253 ?auto_575254 ?auto_575256 ?auto_575255 ?auto_575257 ?auto_575258 ?auto_575259 ?auto_575260 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_575267 - SURFACE
      ?auto_575268 - SURFACE
      ?auto_575269 - SURFACE
      ?auto_575271 - SURFACE
      ?auto_575270 - SURFACE
      ?auto_575272 - SURFACE
      ?auto_575273 - SURFACE
      ?auto_575274 - SURFACE
      ?auto_575275 - SURFACE
      ?auto_575276 - SURFACE
    )
    :vars
    (
      ?auto_575278 - HOIST
      ?auto_575279 - PLACE
      ?auto_575282 - PLACE
      ?auto_575280 - HOIST
      ?auto_575277 - SURFACE
      ?auto_575281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575278 ?auto_575279 ) ( IS-CRATE ?auto_575276 ) ( not ( = ?auto_575275 ?auto_575276 ) ) ( not ( = ?auto_575274 ?auto_575275 ) ) ( not ( = ?auto_575274 ?auto_575276 ) ) ( not ( = ?auto_575282 ?auto_575279 ) ) ( HOIST-AT ?auto_575280 ?auto_575282 ) ( not ( = ?auto_575278 ?auto_575280 ) ) ( AVAILABLE ?auto_575280 ) ( SURFACE-AT ?auto_575276 ?auto_575282 ) ( ON ?auto_575276 ?auto_575277 ) ( CLEAR ?auto_575276 ) ( not ( = ?auto_575275 ?auto_575277 ) ) ( not ( = ?auto_575276 ?auto_575277 ) ) ( not ( = ?auto_575274 ?auto_575277 ) ) ( SURFACE-AT ?auto_575274 ?auto_575279 ) ( CLEAR ?auto_575274 ) ( IS-CRATE ?auto_575275 ) ( AVAILABLE ?auto_575278 ) ( IN ?auto_575275 ?auto_575281 ) ( TRUCK-AT ?auto_575281 ?auto_575282 ) ( ON ?auto_575268 ?auto_575267 ) ( ON ?auto_575269 ?auto_575268 ) ( ON ?auto_575271 ?auto_575269 ) ( ON ?auto_575270 ?auto_575271 ) ( ON ?auto_575272 ?auto_575270 ) ( ON ?auto_575273 ?auto_575272 ) ( ON ?auto_575274 ?auto_575273 ) ( not ( = ?auto_575267 ?auto_575268 ) ) ( not ( = ?auto_575267 ?auto_575269 ) ) ( not ( = ?auto_575267 ?auto_575271 ) ) ( not ( = ?auto_575267 ?auto_575270 ) ) ( not ( = ?auto_575267 ?auto_575272 ) ) ( not ( = ?auto_575267 ?auto_575273 ) ) ( not ( = ?auto_575267 ?auto_575274 ) ) ( not ( = ?auto_575267 ?auto_575275 ) ) ( not ( = ?auto_575267 ?auto_575276 ) ) ( not ( = ?auto_575267 ?auto_575277 ) ) ( not ( = ?auto_575268 ?auto_575269 ) ) ( not ( = ?auto_575268 ?auto_575271 ) ) ( not ( = ?auto_575268 ?auto_575270 ) ) ( not ( = ?auto_575268 ?auto_575272 ) ) ( not ( = ?auto_575268 ?auto_575273 ) ) ( not ( = ?auto_575268 ?auto_575274 ) ) ( not ( = ?auto_575268 ?auto_575275 ) ) ( not ( = ?auto_575268 ?auto_575276 ) ) ( not ( = ?auto_575268 ?auto_575277 ) ) ( not ( = ?auto_575269 ?auto_575271 ) ) ( not ( = ?auto_575269 ?auto_575270 ) ) ( not ( = ?auto_575269 ?auto_575272 ) ) ( not ( = ?auto_575269 ?auto_575273 ) ) ( not ( = ?auto_575269 ?auto_575274 ) ) ( not ( = ?auto_575269 ?auto_575275 ) ) ( not ( = ?auto_575269 ?auto_575276 ) ) ( not ( = ?auto_575269 ?auto_575277 ) ) ( not ( = ?auto_575271 ?auto_575270 ) ) ( not ( = ?auto_575271 ?auto_575272 ) ) ( not ( = ?auto_575271 ?auto_575273 ) ) ( not ( = ?auto_575271 ?auto_575274 ) ) ( not ( = ?auto_575271 ?auto_575275 ) ) ( not ( = ?auto_575271 ?auto_575276 ) ) ( not ( = ?auto_575271 ?auto_575277 ) ) ( not ( = ?auto_575270 ?auto_575272 ) ) ( not ( = ?auto_575270 ?auto_575273 ) ) ( not ( = ?auto_575270 ?auto_575274 ) ) ( not ( = ?auto_575270 ?auto_575275 ) ) ( not ( = ?auto_575270 ?auto_575276 ) ) ( not ( = ?auto_575270 ?auto_575277 ) ) ( not ( = ?auto_575272 ?auto_575273 ) ) ( not ( = ?auto_575272 ?auto_575274 ) ) ( not ( = ?auto_575272 ?auto_575275 ) ) ( not ( = ?auto_575272 ?auto_575276 ) ) ( not ( = ?auto_575272 ?auto_575277 ) ) ( not ( = ?auto_575273 ?auto_575274 ) ) ( not ( = ?auto_575273 ?auto_575275 ) ) ( not ( = ?auto_575273 ?auto_575276 ) ) ( not ( = ?auto_575273 ?auto_575277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575274 ?auto_575275 ?auto_575276 )
      ( MAKE-9CRATE-VERIFY ?auto_575267 ?auto_575268 ?auto_575269 ?auto_575271 ?auto_575270 ?auto_575272 ?auto_575273 ?auto_575274 ?auto_575275 ?auto_575276 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575283 - SURFACE
      ?auto_575284 - SURFACE
      ?auto_575285 - SURFACE
      ?auto_575287 - SURFACE
      ?auto_575286 - SURFACE
      ?auto_575288 - SURFACE
      ?auto_575289 - SURFACE
      ?auto_575290 - SURFACE
      ?auto_575291 - SURFACE
      ?auto_575292 - SURFACE
      ?auto_575293 - SURFACE
    )
    :vars
    (
      ?auto_575295 - HOIST
      ?auto_575296 - PLACE
      ?auto_575299 - PLACE
      ?auto_575297 - HOIST
      ?auto_575294 - SURFACE
      ?auto_575298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575295 ?auto_575296 ) ( IS-CRATE ?auto_575293 ) ( not ( = ?auto_575292 ?auto_575293 ) ) ( not ( = ?auto_575291 ?auto_575292 ) ) ( not ( = ?auto_575291 ?auto_575293 ) ) ( not ( = ?auto_575299 ?auto_575296 ) ) ( HOIST-AT ?auto_575297 ?auto_575299 ) ( not ( = ?auto_575295 ?auto_575297 ) ) ( AVAILABLE ?auto_575297 ) ( SURFACE-AT ?auto_575293 ?auto_575299 ) ( ON ?auto_575293 ?auto_575294 ) ( CLEAR ?auto_575293 ) ( not ( = ?auto_575292 ?auto_575294 ) ) ( not ( = ?auto_575293 ?auto_575294 ) ) ( not ( = ?auto_575291 ?auto_575294 ) ) ( SURFACE-AT ?auto_575291 ?auto_575296 ) ( CLEAR ?auto_575291 ) ( IS-CRATE ?auto_575292 ) ( AVAILABLE ?auto_575295 ) ( IN ?auto_575292 ?auto_575298 ) ( TRUCK-AT ?auto_575298 ?auto_575299 ) ( ON ?auto_575284 ?auto_575283 ) ( ON ?auto_575285 ?auto_575284 ) ( ON ?auto_575287 ?auto_575285 ) ( ON ?auto_575286 ?auto_575287 ) ( ON ?auto_575288 ?auto_575286 ) ( ON ?auto_575289 ?auto_575288 ) ( ON ?auto_575290 ?auto_575289 ) ( ON ?auto_575291 ?auto_575290 ) ( not ( = ?auto_575283 ?auto_575284 ) ) ( not ( = ?auto_575283 ?auto_575285 ) ) ( not ( = ?auto_575283 ?auto_575287 ) ) ( not ( = ?auto_575283 ?auto_575286 ) ) ( not ( = ?auto_575283 ?auto_575288 ) ) ( not ( = ?auto_575283 ?auto_575289 ) ) ( not ( = ?auto_575283 ?auto_575290 ) ) ( not ( = ?auto_575283 ?auto_575291 ) ) ( not ( = ?auto_575283 ?auto_575292 ) ) ( not ( = ?auto_575283 ?auto_575293 ) ) ( not ( = ?auto_575283 ?auto_575294 ) ) ( not ( = ?auto_575284 ?auto_575285 ) ) ( not ( = ?auto_575284 ?auto_575287 ) ) ( not ( = ?auto_575284 ?auto_575286 ) ) ( not ( = ?auto_575284 ?auto_575288 ) ) ( not ( = ?auto_575284 ?auto_575289 ) ) ( not ( = ?auto_575284 ?auto_575290 ) ) ( not ( = ?auto_575284 ?auto_575291 ) ) ( not ( = ?auto_575284 ?auto_575292 ) ) ( not ( = ?auto_575284 ?auto_575293 ) ) ( not ( = ?auto_575284 ?auto_575294 ) ) ( not ( = ?auto_575285 ?auto_575287 ) ) ( not ( = ?auto_575285 ?auto_575286 ) ) ( not ( = ?auto_575285 ?auto_575288 ) ) ( not ( = ?auto_575285 ?auto_575289 ) ) ( not ( = ?auto_575285 ?auto_575290 ) ) ( not ( = ?auto_575285 ?auto_575291 ) ) ( not ( = ?auto_575285 ?auto_575292 ) ) ( not ( = ?auto_575285 ?auto_575293 ) ) ( not ( = ?auto_575285 ?auto_575294 ) ) ( not ( = ?auto_575287 ?auto_575286 ) ) ( not ( = ?auto_575287 ?auto_575288 ) ) ( not ( = ?auto_575287 ?auto_575289 ) ) ( not ( = ?auto_575287 ?auto_575290 ) ) ( not ( = ?auto_575287 ?auto_575291 ) ) ( not ( = ?auto_575287 ?auto_575292 ) ) ( not ( = ?auto_575287 ?auto_575293 ) ) ( not ( = ?auto_575287 ?auto_575294 ) ) ( not ( = ?auto_575286 ?auto_575288 ) ) ( not ( = ?auto_575286 ?auto_575289 ) ) ( not ( = ?auto_575286 ?auto_575290 ) ) ( not ( = ?auto_575286 ?auto_575291 ) ) ( not ( = ?auto_575286 ?auto_575292 ) ) ( not ( = ?auto_575286 ?auto_575293 ) ) ( not ( = ?auto_575286 ?auto_575294 ) ) ( not ( = ?auto_575288 ?auto_575289 ) ) ( not ( = ?auto_575288 ?auto_575290 ) ) ( not ( = ?auto_575288 ?auto_575291 ) ) ( not ( = ?auto_575288 ?auto_575292 ) ) ( not ( = ?auto_575288 ?auto_575293 ) ) ( not ( = ?auto_575288 ?auto_575294 ) ) ( not ( = ?auto_575289 ?auto_575290 ) ) ( not ( = ?auto_575289 ?auto_575291 ) ) ( not ( = ?auto_575289 ?auto_575292 ) ) ( not ( = ?auto_575289 ?auto_575293 ) ) ( not ( = ?auto_575289 ?auto_575294 ) ) ( not ( = ?auto_575290 ?auto_575291 ) ) ( not ( = ?auto_575290 ?auto_575292 ) ) ( not ( = ?auto_575290 ?auto_575293 ) ) ( not ( = ?auto_575290 ?auto_575294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575291 ?auto_575292 ?auto_575293 )
      ( MAKE-10CRATE-VERIFY ?auto_575283 ?auto_575284 ?auto_575285 ?auto_575287 ?auto_575286 ?auto_575288 ?auto_575289 ?auto_575290 ?auto_575291 ?auto_575292 ?auto_575293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_575300 - SURFACE
      ?auto_575301 - SURFACE
    )
    :vars
    (
      ?auto_575303 - HOIST
      ?auto_575305 - PLACE
      ?auto_575304 - SURFACE
      ?auto_575308 - PLACE
      ?auto_575306 - HOIST
      ?auto_575302 - SURFACE
      ?auto_575307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575303 ?auto_575305 ) ( IS-CRATE ?auto_575301 ) ( not ( = ?auto_575300 ?auto_575301 ) ) ( not ( = ?auto_575304 ?auto_575300 ) ) ( not ( = ?auto_575304 ?auto_575301 ) ) ( not ( = ?auto_575308 ?auto_575305 ) ) ( HOIST-AT ?auto_575306 ?auto_575308 ) ( not ( = ?auto_575303 ?auto_575306 ) ) ( SURFACE-AT ?auto_575301 ?auto_575308 ) ( ON ?auto_575301 ?auto_575302 ) ( CLEAR ?auto_575301 ) ( not ( = ?auto_575300 ?auto_575302 ) ) ( not ( = ?auto_575301 ?auto_575302 ) ) ( not ( = ?auto_575304 ?auto_575302 ) ) ( SURFACE-AT ?auto_575304 ?auto_575305 ) ( CLEAR ?auto_575304 ) ( IS-CRATE ?auto_575300 ) ( AVAILABLE ?auto_575303 ) ( TRUCK-AT ?auto_575307 ?auto_575308 ) ( LIFTING ?auto_575306 ?auto_575300 ) )
    :subtasks
    ( ( !LOAD ?auto_575306 ?auto_575300 ?auto_575307 ?auto_575308 )
      ( MAKE-2CRATE ?auto_575304 ?auto_575300 ?auto_575301 )
      ( MAKE-1CRATE-VERIFY ?auto_575300 ?auto_575301 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_575309 - SURFACE
      ?auto_575310 - SURFACE
      ?auto_575311 - SURFACE
    )
    :vars
    (
      ?auto_575315 - HOIST
      ?auto_575314 - PLACE
      ?auto_575317 - PLACE
      ?auto_575313 - HOIST
      ?auto_575312 - SURFACE
      ?auto_575316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575315 ?auto_575314 ) ( IS-CRATE ?auto_575311 ) ( not ( = ?auto_575310 ?auto_575311 ) ) ( not ( = ?auto_575309 ?auto_575310 ) ) ( not ( = ?auto_575309 ?auto_575311 ) ) ( not ( = ?auto_575317 ?auto_575314 ) ) ( HOIST-AT ?auto_575313 ?auto_575317 ) ( not ( = ?auto_575315 ?auto_575313 ) ) ( SURFACE-AT ?auto_575311 ?auto_575317 ) ( ON ?auto_575311 ?auto_575312 ) ( CLEAR ?auto_575311 ) ( not ( = ?auto_575310 ?auto_575312 ) ) ( not ( = ?auto_575311 ?auto_575312 ) ) ( not ( = ?auto_575309 ?auto_575312 ) ) ( SURFACE-AT ?auto_575309 ?auto_575314 ) ( CLEAR ?auto_575309 ) ( IS-CRATE ?auto_575310 ) ( AVAILABLE ?auto_575315 ) ( TRUCK-AT ?auto_575316 ?auto_575317 ) ( LIFTING ?auto_575313 ?auto_575310 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_575310 ?auto_575311 )
      ( MAKE-2CRATE-VERIFY ?auto_575309 ?auto_575310 ?auto_575311 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_575318 - SURFACE
      ?auto_575319 - SURFACE
      ?auto_575320 - SURFACE
      ?auto_575321 - SURFACE
    )
    :vars
    (
      ?auto_575327 - HOIST
      ?auto_575325 - PLACE
      ?auto_575323 - PLACE
      ?auto_575322 - HOIST
      ?auto_575324 - SURFACE
      ?auto_575326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575327 ?auto_575325 ) ( IS-CRATE ?auto_575321 ) ( not ( = ?auto_575320 ?auto_575321 ) ) ( not ( = ?auto_575319 ?auto_575320 ) ) ( not ( = ?auto_575319 ?auto_575321 ) ) ( not ( = ?auto_575323 ?auto_575325 ) ) ( HOIST-AT ?auto_575322 ?auto_575323 ) ( not ( = ?auto_575327 ?auto_575322 ) ) ( SURFACE-AT ?auto_575321 ?auto_575323 ) ( ON ?auto_575321 ?auto_575324 ) ( CLEAR ?auto_575321 ) ( not ( = ?auto_575320 ?auto_575324 ) ) ( not ( = ?auto_575321 ?auto_575324 ) ) ( not ( = ?auto_575319 ?auto_575324 ) ) ( SURFACE-AT ?auto_575319 ?auto_575325 ) ( CLEAR ?auto_575319 ) ( IS-CRATE ?auto_575320 ) ( AVAILABLE ?auto_575327 ) ( TRUCK-AT ?auto_575326 ?auto_575323 ) ( LIFTING ?auto_575322 ?auto_575320 ) ( ON ?auto_575319 ?auto_575318 ) ( not ( = ?auto_575318 ?auto_575319 ) ) ( not ( = ?auto_575318 ?auto_575320 ) ) ( not ( = ?auto_575318 ?auto_575321 ) ) ( not ( = ?auto_575318 ?auto_575324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575319 ?auto_575320 ?auto_575321 )
      ( MAKE-3CRATE-VERIFY ?auto_575318 ?auto_575319 ?auto_575320 ?auto_575321 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_575328 - SURFACE
      ?auto_575329 - SURFACE
      ?auto_575330 - SURFACE
      ?auto_575332 - SURFACE
      ?auto_575331 - SURFACE
    )
    :vars
    (
      ?auto_575338 - HOIST
      ?auto_575336 - PLACE
      ?auto_575334 - PLACE
      ?auto_575333 - HOIST
      ?auto_575335 - SURFACE
      ?auto_575337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575338 ?auto_575336 ) ( IS-CRATE ?auto_575331 ) ( not ( = ?auto_575332 ?auto_575331 ) ) ( not ( = ?auto_575330 ?auto_575332 ) ) ( not ( = ?auto_575330 ?auto_575331 ) ) ( not ( = ?auto_575334 ?auto_575336 ) ) ( HOIST-AT ?auto_575333 ?auto_575334 ) ( not ( = ?auto_575338 ?auto_575333 ) ) ( SURFACE-AT ?auto_575331 ?auto_575334 ) ( ON ?auto_575331 ?auto_575335 ) ( CLEAR ?auto_575331 ) ( not ( = ?auto_575332 ?auto_575335 ) ) ( not ( = ?auto_575331 ?auto_575335 ) ) ( not ( = ?auto_575330 ?auto_575335 ) ) ( SURFACE-AT ?auto_575330 ?auto_575336 ) ( CLEAR ?auto_575330 ) ( IS-CRATE ?auto_575332 ) ( AVAILABLE ?auto_575338 ) ( TRUCK-AT ?auto_575337 ?auto_575334 ) ( LIFTING ?auto_575333 ?auto_575332 ) ( ON ?auto_575329 ?auto_575328 ) ( ON ?auto_575330 ?auto_575329 ) ( not ( = ?auto_575328 ?auto_575329 ) ) ( not ( = ?auto_575328 ?auto_575330 ) ) ( not ( = ?auto_575328 ?auto_575332 ) ) ( not ( = ?auto_575328 ?auto_575331 ) ) ( not ( = ?auto_575328 ?auto_575335 ) ) ( not ( = ?auto_575329 ?auto_575330 ) ) ( not ( = ?auto_575329 ?auto_575332 ) ) ( not ( = ?auto_575329 ?auto_575331 ) ) ( not ( = ?auto_575329 ?auto_575335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575330 ?auto_575332 ?auto_575331 )
      ( MAKE-4CRATE-VERIFY ?auto_575328 ?auto_575329 ?auto_575330 ?auto_575332 ?auto_575331 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_575339 - SURFACE
      ?auto_575340 - SURFACE
      ?auto_575341 - SURFACE
      ?auto_575343 - SURFACE
      ?auto_575342 - SURFACE
      ?auto_575344 - SURFACE
    )
    :vars
    (
      ?auto_575350 - HOIST
      ?auto_575348 - PLACE
      ?auto_575346 - PLACE
      ?auto_575345 - HOIST
      ?auto_575347 - SURFACE
      ?auto_575349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575350 ?auto_575348 ) ( IS-CRATE ?auto_575344 ) ( not ( = ?auto_575342 ?auto_575344 ) ) ( not ( = ?auto_575343 ?auto_575342 ) ) ( not ( = ?auto_575343 ?auto_575344 ) ) ( not ( = ?auto_575346 ?auto_575348 ) ) ( HOIST-AT ?auto_575345 ?auto_575346 ) ( not ( = ?auto_575350 ?auto_575345 ) ) ( SURFACE-AT ?auto_575344 ?auto_575346 ) ( ON ?auto_575344 ?auto_575347 ) ( CLEAR ?auto_575344 ) ( not ( = ?auto_575342 ?auto_575347 ) ) ( not ( = ?auto_575344 ?auto_575347 ) ) ( not ( = ?auto_575343 ?auto_575347 ) ) ( SURFACE-AT ?auto_575343 ?auto_575348 ) ( CLEAR ?auto_575343 ) ( IS-CRATE ?auto_575342 ) ( AVAILABLE ?auto_575350 ) ( TRUCK-AT ?auto_575349 ?auto_575346 ) ( LIFTING ?auto_575345 ?auto_575342 ) ( ON ?auto_575340 ?auto_575339 ) ( ON ?auto_575341 ?auto_575340 ) ( ON ?auto_575343 ?auto_575341 ) ( not ( = ?auto_575339 ?auto_575340 ) ) ( not ( = ?auto_575339 ?auto_575341 ) ) ( not ( = ?auto_575339 ?auto_575343 ) ) ( not ( = ?auto_575339 ?auto_575342 ) ) ( not ( = ?auto_575339 ?auto_575344 ) ) ( not ( = ?auto_575339 ?auto_575347 ) ) ( not ( = ?auto_575340 ?auto_575341 ) ) ( not ( = ?auto_575340 ?auto_575343 ) ) ( not ( = ?auto_575340 ?auto_575342 ) ) ( not ( = ?auto_575340 ?auto_575344 ) ) ( not ( = ?auto_575340 ?auto_575347 ) ) ( not ( = ?auto_575341 ?auto_575343 ) ) ( not ( = ?auto_575341 ?auto_575342 ) ) ( not ( = ?auto_575341 ?auto_575344 ) ) ( not ( = ?auto_575341 ?auto_575347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575343 ?auto_575342 ?auto_575344 )
      ( MAKE-5CRATE-VERIFY ?auto_575339 ?auto_575340 ?auto_575341 ?auto_575343 ?auto_575342 ?auto_575344 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_575351 - SURFACE
      ?auto_575352 - SURFACE
      ?auto_575353 - SURFACE
      ?auto_575355 - SURFACE
      ?auto_575354 - SURFACE
      ?auto_575356 - SURFACE
      ?auto_575357 - SURFACE
    )
    :vars
    (
      ?auto_575363 - HOIST
      ?auto_575361 - PLACE
      ?auto_575359 - PLACE
      ?auto_575358 - HOIST
      ?auto_575360 - SURFACE
      ?auto_575362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575363 ?auto_575361 ) ( IS-CRATE ?auto_575357 ) ( not ( = ?auto_575356 ?auto_575357 ) ) ( not ( = ?auto_575354 ?auto_575356 ) ) ( not ( = ?auto_575354 ?auto_575357 ) ) ( not ( = ?auto_575359 ?auto_575361 ) ) ( HOIST-AT ?auto_575358 ?auto_575359 ) ( not ( = ?auto_575363 ?auto_575358 ) ) ( SURFACE-AT ?auto_575357 ?auto_575359 ) ( ON ?auto_575357 ?auto_575360 ) ( CLEAR ?auto_575357 ) ( not ( = ?auto_575356 ?auto_575360 ) ) ( not ( = ?auto_575357 ?auto_575360 ) ) ( not ( = ?auto_575354 ?auto_575360 ) ) ( SURFACE-AT ?auto_575354 ?auto_575361 ) ( CLEAR ?auto_575354 ) ( IS-CRATE ?auto_575356 ) ( AVAILABLE ?auto_575363 ) ( TRUCK-AT ?auto_575362 ?auto_575359 ) ( LIFTING ?auto_575358 ?auto_575356 ) ( ON ?auto_575352 ?auto_575351 ) ( ON ?auto_575353 ?auto_575352 ) ( ON ?auto_575355 ?auto_575353 ) ( ON ?auto_575354 ?auto_575355 ) ( not ( = ?auto_575351 ?auto_575352 ) ) ( not ( = ?auto_575351 ?auto_575353 ) ) ( not ( = ?auto_575351 ?auto_575355 ) ) ( not ( = ?auto_575351 ?auto_575354 ) ) ( not ( = ?auto_575351 ?auto_575356 ) ) ( not ( = ?auto_575351 ?auto_575357 ) ) ( not ( = ?auto_575351 ?auto_575360 ) ) ( not ( = ?auto_575352 ?auto_575353 ) ) ( not ( = ?auto_575352 ?auto_575355 ) ) ( not ( = ?auto_575352 ?auto_575354 ) ) ( not ( = ?auto_575352 ?auto_575356 ) ) ( not ( = ?auto_575352 ?auto_575357 ) ) ( not ( = ?auto_575352 ?auto_575360 ) ) ( not ( = ?auto_575353 ?auto_575355 ) ) ( not ( = ?auto_575353 ?auto_575354 ) ) ( not ( = ?auto_575353 ?auto_575356 ) ) ( not ( = ?auto_575353 ?auto_575357 ) ) ( not ( = ?auto_575353 ?auto_575360 ) ) ( not ( = ?auto_575355 ?auto_575354 ) ) ( not ( = ?auto_575355 ?auto_575356 ) ) ( not ( = ?auto_575355 ?auto_575357 ) ) ( not ( = ?auto_575355 ?auto_575360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575354 ?auto_575356 ?auto_575357 )
      ( MAKE-6CRATE-VERIFY ?auto_575351 ?auto_575352 ?auto_575353 ?auto_575355 ?auto_575354 ?auto_575356 ?auto_575357 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_575364 - SURFACE
      ?auto_575365 - SURFACE
      ?auto_575366 - SURFACE
      ?auto_575368 - SURFACE
      ?auto_575367 - SURFACE
      ?auto_575369 - SURFACE
      ?auto_575370 - SURFACE
      ?auto_575371 - SURFACE
    )
    :vars
    (
      ?auto_575377 - HOIST
      ?auto_575375 - PLACE
      ?auto_575373 - PLACE
      ?auto_575372 - HOIST
      ?auto_575374 - SURFACE
      ?auto_575376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575377 ?auto_575375 ) ( IS-CRATE ?auto_575371 ) ( not ( = ?auto_575370 ?auto_575371 ) ) ( not ( = ?auto_575369 ?auto_575370 ) ) ( not ( = ?auto_575369 ?auto_575371 ) ) ( not ( = ?auto_575373 ?auto_575375 ) ) ( HOIST-AT ?auto_575372 ?auto_575373 ) ( not ( = ?auto_575377 ?auto_575372 ) ) ( SURFACE-AT ?auto_575371 ?auto_575373 ) ( ON ?auto_575371 ?auto_575374 ) ( CLEAR ?auto_575371 ) ( not ( = ?auto_575370 ?auto_575374 ) ) ( not ( = ?auto_575371 ?auto_575374 ) ) ( not ( = ?auto_575369 ?auto_575374 ) ) ( SURFACE-AT ?auto_575369 ?auto_575375 ) ( CLEAR ?auto_575369 ) ( IS-CRATE ?auto_575370 ) ( AVAILABLE ?auto_575377 ) ( TRUCK-AT ?auto_575376 ?auto_575373 ) ( LIFTING ?auto_575372 ?auto_575370 ) ( ON ?auto_575365 ?auto_575364 ) ( ON ?auto_575366 ?auto_575365 ) ( ON ?auto_575368 ?auto_575366 ) ( ON ?auto_575367 ?auto_575368 ) ( ON ?auto_575369 ?auto_575367 ) ( not ( = ?auto_575364 ?auto_575365 ) ) ( not ( = ?auto_575364 ?auto_575366 ) ) ( not ( = ?auto_575364 ?auto_575368 ) ) ( not ( = ?auto_575364 ?auto_575367 ) ) ( not ( = ?auto_575364 ?auto_575369 ) ) ( not ( = ?auto_575364 ?auto_575370 ) ) ( not ( = ?auto_575364 ?auto_575371 ) ) ( not ( = ?auto_575364 ?auto_575374 ) ) ( not ( = ?auto_575365 ?auto_575366 ) ) ( not ( = ?auto_575365 ?auto_575368 ) ) ( not ( = ?auto_575365 ?auto_575367 ) ) ( not ( = ?auto_575365 ?auto_575369 ) ) ( not ( = ?auto_575365 ?auto_575370 ) ) ( not ( = ?auto_575365 ?auto_575371 ) ) ( not ( = ?auto_575365 ?auto_575374 ) ) ( not ( = ?auto_575366 ?auto_575368 ) ) ( not ( = ?auto_575366 ?auto_575367 ) ) ( not ( = ?auto_575366 ?auto_575369 ) ) ( not ( = ?auto_575366 ?auto_575370 ) ) ( not ( = ?auto_575366 ?auto_575371 ) ) ( not ( = ?auto_575366 ?auto_575374 ) ) ( not ( = ?auto_575368 ?auto_575367 ) ) ( not ( = ?auto_575368 ?auto_575369 ) ) ( not ( = ?auto_575368 ?auto_575370 ) ) ( not ( = ?auto_575368 ?auto_575371 ) ) ( not ( = ?auto_575368 ?auto_575374 ) ) ( not ( = ?auto_575367 ?auto_575369 ) ) ( not ( = ?auto_575367 ?auto_575370 ) ) ( not ( = ?auto_575367 ?auto_575371 ) ) ( not ( = ?auto_575367 ?auto_575374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575369 ?auto_575370 ?auto_575371 )
      ( MAKE-7CRATE-VERIFY ?auto_575364 ?auto_575365 ?auto_575366 ?auto_575368 ?auto_575367 ?auto_575369 ?auto_575370 ?auto_575371 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_575378 - SURFACE
      ?auto_575379 - SURFACE
      ?auto_575380 - SURFACE
      ?auto_575382 - SURFACE
      ?auto_575381 - SURFACE
      ?auto_575383 - SURFACE
      ?auto_575384 - SURFACE
      ?auto_575385 - SURFACE
      ?auto_575386 - SURFACE
    )
    :vars
    (
      ?auto_575392 - HOIST
      ?auto_575390 - PLACE
      ?auto_575388 - PLACE
      ?auto_575387 - HOIST
      ?auto_575389 - SURFACE
      ?auto_575391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575392 ?auto_575390 ) ( IS-CRATE ?auto_575386 ) ( not ( = ?auto_575385 ?auto_575386 ) ) ( not ( = ?auto_575384 ?auto_575385 ) ) ( not ( = ?auto_575384 ?auto_575386 ) ) ( not ( = ?auto_575388 ?auto_575390 ) ) ( HOIST-AT ?auto_575387 ?auto_575388 ) ( not ( = ?auto_575392 ?auto_575387 ) ) ( SURFACE-AT ?auto_575386 ?auto_575388 ) ( ON ?auto_575386 ?auto_575389 ) ( CLEAR ?auto_575386 ) ( not ( = ?auto_575385 ?auto_575389 ) ) ( not ( = ?auto_575386 ?auto_575389 ) ) ( not ( = ?auto_575384 ?auto_575389 ) ) ( SURFACE-AT ?auto_575384 ?auto_575390 ) ( CLEAR ?auto_575384 ) ( IS-CRATE ?auto_575385 ) ( AVAILABLE ?auto_575392 ) ( TRUCK-AT ?auto_575391 ?auto_575388 ) ( LIFTING ?auto_575387 ?auto_575385 ) ( ON ?auto_575379 ?auto_575378 ) ( ON ?auto_575380 ?auto_575379 ) ( ON ?auto_575382 ?auto_575380 ) ( ON ?auto_575381 ?auto_575382 ) ( ON ?auto_575383 ?auto_575381 ) ( ON ?auto_575384 ?auto_575383 ) ( not ( = ?auto_575378 ?auto_575379 ) ) ( not ( = ?auto_575378 ?auto_575380 ) ) ( not ( = ?auto_575378 ?auto_575382 ) ) ( not ( = ?auto_575378 ?auto_575381 ) ) ( not ( = ?auto_575378 ?auto_575383 ) ) ( not ( = ?auto_575378 ?auto_575384 ) ) ( not ( = ?auto_575378 ?auto_575385 ) ) ( not ( = ?auto_575378 ?auto_575386 ) ) ( not ( = ?auto_575378 ?auto_575389 ) ) ( not ( = ?auto_575379 ?auto_575380 ) ) ( not ( = ?auto_575379 ?auto_575382 ) ) ( not ( = ?auto_575379 ?auto_575381 ) ) ( not ( = ?auto_575379 ?auto_575383 ) ) ( not ( = ?auto_575379 ?auto_575384 ) ) ( not ( = ?auto_575379 ?auto_575385 ) ) ( not ( = ?auto_575379 ?auto_575386 ) ) ( not ( = ?auto_575379 ?auto_575389 ) ) ( not ( = ?auto_575380 ?auto_575382 ) ) ( not ( = ?auto_575380 ?auto_575381 ) ) ( not ( = ?auto_575380 ?auto_575383 ) ) ( not ( = ?auto_575380 ?auto_575384 ) ) ( not ( = ?auto_575380 ?auto_575385 ) ) ( not ( = ?auto_575380 ?auto_575386 ) ) ( not ( = ?auto_575380 ?auto_575389 ) ) ( not ( = ?auto_575382 ?auto_575381 ) ) ( not ( = ?auto_575382 ?auto_575383 ) ) ( not ( = ?auto_575382 ?auto_575384 ) ) ( not ( = ?auto_575382 ?auto_575385 ) ) ( not ( = ?auto_575382 ?auto_575386 ) ) ( not ( = ?auto_575382 ?auto_575389 ) ) ( not ( = ?auto_575381 ?auto_575383 ) ) ( not ( = ?auto_575381 ?auto_575384 ) ) ( not ( = ?auto_575381 ?auto_575385 ) ) ( not ( = ?auto_575381 ?auto_575386 ) ) ( not ( = ?auto_575381 ?auto_575389 ) ) ( not ( = ?auto_575383 ?auto_575384 ) ) ( not ( = ?auto_575383 ?auto_575385 ) ) ( not ( = ?auto_575383 ?auto_575386 ) ) ( not ( = ?auto_575383 ?auto_575389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575384 ?auto_575385 ?auto_575386 )
      ( MAKE-8CRATE-VERIFY ?auto_575378 ?auto_575379 ?auto_575380 ?auto_575382 ?auto_575381 ?auto_575383 ?auto_575384 ?auto_575385 ?auto_575386 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_575393 - SURFACE
      ?auto_575394 - SURFACE
      ?auto_575395 - SURFACE
      ?auto_575397 - SURFACE
      ?auto_575396 - SURFACE
      ?auto_575398 - SURFACE
      ?auto_575399 - SURFACE
      ?auto_575400 - SURFACE
      ?auto_575401 - SURFACE
      ?auto_575402 - SURFACE
    )
    :vars
    (
      ?auto_575408 - HOIST
      ?auto_575406 - PLACE
      ?auto_575404 - PLACE
      ?auto_575403 - HOIST
      ?auto_575405 - SURFACE
      ?auto_575407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575408 ?auto_575406 ) ( IS-CRATE ?auto_575402 ) ( not ( = ?auto_575401 ?auto_575402 ) ) ( not ( = ?auto_575400 ?auto_575401 ) ) ( not ( = ?auto_575400 ?auto_575402 ) ) ( not ( = ?auto_575404 ?auto_575406 ) ) ( HOIST-AT ?auto_575403 ?auto_575404 ) ( not ( = ?auto_575408 ?auto_575403 ) ) ( SURFACE-AT ?auto_575402 ?auto_575404 ) ( ON ?auto_575402 ?auto_575405 ) ( CLEAR ?auto_575402 ) ( not ( = ?auto_575401 ?auto_575405 ) ) ( not ( = ?auto_575402 ?auto_575405 ) ) ( not ( = ?auto_575400 ?auto_575405 ) ) ( SURFACE-AT ?auto_575400 ?auto_575406 ) ( CLEAR ?auto_575400 ) ( IS-CRATE ?auto_575401 ) ( AVAILABLE ?auto_575408 ) ( TRUCK-AT ?auto_575407 ?auto_575404 ) ( LIFTING ?auto_575403 ?auto_575401 ) ( ON ?auto_575394 ?auto_575393 ) ( ON ?auto_575395 ?auto_575394 ) ( ON ?auto_575397 ?auto_575395 ) ( ON ?auto_575396 ?auto_575397 ) ( ON ?auto_575398 ?auto_575396 ) ( ON ?auto_575399 ?auto_575398 ) ( ON ?auto_575400 ?auto_575399 ) ( not ( = ?auto_575393 ?auto_575394 ) ) ( not ( = ?auto_575393 ?auto_575395 ) ) ( not ( = ?auto_575393 ?auto_575397 ) ) ( not ( = ?auto_575393 ?auto_575396 ) ) ( not ( = ?auto_575393 ?auto_575398 ) ) ( not ( = ?auto_575393 ?auto_575399 ) ) ( not ( = ?auto_575393 ?auto_575400 ) ) ( not ( = ?auto_575393 ?auto_575401 ) ) ( not ( = ?auto_575393 ?auto_575402 ) ) ( not ( = ?auto_575393 ?auto_575405 ) ) ( not ( = ?auto_575394 ?auto_575395 ) ) ( not ( = ?auto_575394 ?auto_575397 ) ) ( not ( = ?auto_575394 ?auto_575396 ) ) ( not ( = ?auto_575394 ?auto_575398 ) ) ( not ( = ?auto_575394 ?auto_575399 ) ) ( not ( = ?auto_575394 ?auto_575400 ) ) ( not ( = ?auto_575394 ?auto_575401 ) ) ( not ( = ?auto_575394 ?auto_575402 ) ) ( not ( = ?auto_575394 ?auto_575405 ) ) ( not ( = ?auto_575395 ?auto_575397 ) ) ( not ( = ?auto_575395 ?auto_575396 ) ) ( not ( = ?auto_575395 ?auto_575398 ) ) ( not ( = ?auto_575395 ?auto_575399 ) ) ( not ( = ?auto_575395 ?auto_575400 ) ) ( not ( = ?auto_575395 ?auto_575401 ) ) ( not ( = ?auto_575395 ?auto_575402 ) ) ( not ( = ?auto_575395 ?auto_575405 ) ) ( not ( = ?auto_575397 ?auto_575396 ) ) ( not ( = ?auto_575397 ?auto_575398 ) ) ( not ( = ?auto_575397 ?auto_575399 ) ) ( not ( = ?auto_575397 ?auto_575400 ) ) ( not ( = ?auto_575397 ?auto_575401 ) ) ( not ( = ?auto_575397 ?auto_575402 ) ) ( not ( = ?auto_575397 ?auto_575405 ) ) ( not ( = ?auto_575396 ?auto_575398 ) ) ( not ( = ?auto_575396 ?auto_575399 ) ) ( not ( = ?auto_575396 ?auto_575400 ) ) ( not ( = ?auto_575396 ?auto_575401 ) ) ( not ( = ?auto_575396 ?auto_575402 ) ) ( not ( = ?auto_575396 ?auto_575405 ) ) ( not ( = ?auto_575398 ?auto_575399 ) ) ( not ( = ?auto_575398 ?auto_575400 ) ) ( not ( = ?auto_575398 ?auto_575401 ) ) ( not ( = ?auto_575398 ?auto_575402 ) ) ( not ( = ?auto_575398 ?auto_575405 ) ) ( not ( = ?auto_575399 ?auto_575400 ) ) ( not ( = ?auto_575399 ?auto_575401 ) ) ( not ( = ?auto_575399 ?auto_575402 ) ) ( not ( = ?auto_575399 ?auto_575405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575400 ?auto_575401 ?auto_575402 )
      ( MAKE-9CRATE-VERIFY ?auto_575393 ?auto_575394 ?auto_575395 ?auto_575397 ?auto_575396 ?auto_575398 ?auto_575399 ?auto_575400 ?auto_575401 ?auto_575402 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575409 - SURFACE
      ?auto_575410 - SURFACE
      ?auto_575411 - SURFACE
      ?auto_575413 - SURFACE
      ?auto_575412 - SURFACE
      ?auto_575414 - SURFACE
      ?auto_575415 - SURFACE
      ?auto_575416 - SURFACE
      ?auto_575417 - SURFACE
      ?auto_575418 - SURFACE
      ?auto_575419 - SURFACE
    )
    :vars
    (
      ?auto_575425 - HOIST
      ?auto_575423 - PLACE
      ?auto_575421 - PLACE
      ?auto_575420 - HOIST
      ?auto_575422 - SURFACE
      ?auto_575424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575425 ?auto_575423 ) ( IS-CRATE ?auto_575419 ) ( not ( = ?auto_575418 ?auto_575419 ) ) ( not ( = ?auto_575417 ?auto_575418 ) ) ( not ( = ?auto_575417 ?auto_575419 ) ) ( not ( = ?auto_575421 ?auto_575423 ) ) ( HOIST-AT ?auto_575420 ?auto_575421 ) ( not ( = ?auto_575425 ?auto_575420 ) ) ( SURFACE-AT ?auto_575419 ?auto_575421 ) ( ON ?auto_575419 ?auto_575422 ) ( CLEAR ?auto_575419 ) ( not ( = ?auto_575418 ?auto_575422 ) ) ( not ( = ?auto_575419 ?auto_575422 ) ) ( not ( = ?auto_575417 ?auto_575422 ) ) ( SURFACE-AT ?auto_575417 ?auto_575423 ) ( CLEAR ?auto_575417 ) ( IS-CRATE ?auto_575418 ) ( AVAILABLE ?auto_575425 ) ( TRUCK-AT ?auto_575424 ?auto_575421 ) ( LIFTING ?auto_575420 ?auto_575418 ) ( ON ?auto_575410 ?auto_575409 ) ( ON ?auto_575411 ?auto_575410 ) ( ON ?auto_575413 ?auto_575411 ) ( ON ?auto_575412 ?auto_575413 ) ( ON ?auto_575414 ?auto_575412 ) ( ON ?auto_575415 ?auto_575414 ) ( ON ?auto_575416 ?auto_575415 ) ( ON ?auto_575417 ?auto_575416 ) ( not ( = ?auto_575409 ?auto_575410 ) ) ( not ( = ?auto_575409 ?auto_575411 ) ) ( not ( = ?auto_575409 ?auto_575413 ) ) ( not ( = ?auto_575409 ?auto_575412 ) ) ( not ( = ?auto_575409 ?auto_575414 ) ) ( not ( = ?auto_575409 ?auto_575415 ) ) ( not ( = ?auto_575409 ?auto_575416 ) ) ( not ( = ?auto_575409 ?auto_575417 ) ) ( not ( = ?auto_575409 ?auto_575418 ) ) ( not ( = ?auto_575409 ?auto_575419 ) ) ( not ( = ?auto_575409 ?auto_575422 ) ) ( not ( = ?auto_575410 ?auto_575411 ) ) ( not ( = ?auto_575410 ?auto_575413 ) ) ( not ( = ?auto_575410 ?auto_575412 ) ) ( not ( = ?auto_575410 ?auto_575414 ) ) ( not ( = ?auto_575410 ?auto_575415 ) ) ( not ( = ?auto_575410 ?auto_575416 ) ) ( not ( = ?auto_575410 ?auto_575417 ) ) ( not ( = ?auto_575410 ?auto_575418 ) ) ( not ( = ?auto_575410 ?auto_575419 ) ) ( not ( = ?auto_575410 ?auto_575422 ) ) ( not ( = ?auto_575411 ?auto_575413 ) ) ( not ( = ?auto_575411 ?auto_575412 ) ) ( not ( = ?auto_575411 ?auto_575414 ) ) ( not ( = ?auto_575411 ?auto_575415 ) ) ( not ( = ?auto_575411 ?auto_575416 ) ) ( not ( = ?auto_575411 ?auto_575417 ) ) ( not ( = ?auto_575411 ?auto_575418 ) ) ( not ( = ?auto_575411 ?auto_575419 ) ) ( not ( = ?auto_575411 ?auto_575422 ) ) ( not ( = ?auto_575413 ?auto_575412 ) ) ( not ( = ?auto_575413 ?auto_575414 ) ) ( not ( = ?auto_575413 ?auto_575415 ) ) ( not ( = ?auto_575413 ?auto_575416 ) ) ( not ( = ?auto_575413 ?auto_575417 ) ) ( not ( = ?auto_575413 ?auto_575418 ) ) ( not ( = ?auto_575413 ?auto_575419 ) ) ( not ( = ?auto_575413 ?auto_575422 ) ) ( not ( = ?auto_575412 ?auto_575414 ) ) ( not ( = ?auto_575412 ?auto_575415 ) ) ( not ( = ?auto_575412 ?auto_575416 ) ) ( not ( = ?auto_575412 ?auto_575417 ) ) ( not ( = ?auto_575412 ?auto_575418 ) ) ( not ( = ?auto_575412 ?auto_575419 ) ) ( not ( = ?auto_575412 ?auto_575422 ) ) ( not ( = ?auto_575414 ?auto_575415 ) ) ( not ( = ?auto_575414 ?auto_575416 ) ) ( not ( = ?auto_575414 ?auto_575417 ) ) ( not ( = ?auto_575414 ?auto_575418 ) ) ( not ( = ?auto_575414 ?auto_575419 ) ) ( not ( = ?auto_575414 ?auto_575422 ) ) ( not ( = ?auto_575415 ?auto_575416 ) ) ( not ( = ?auto_575415 ?auto_575417 ) ) ( not ( = ?auto_575415 ?auto_575418 ) ) ( not ( = ?auto_575415 ?auto_575419 ) ) ( not ( = ?auto_575415 ?auto_575422 ) ) ( not ( = ?auto_575416 ?auto_575417 ) ) ( not ( = ?auto_575416 ?auto_575418 ) ) ( not ( = ?auto_575416 ?auto_575419 ) ) ( not ( = ?auto_575416 ?auto_575422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575417 ?auto_575418 ?auto_575419 )
      ( MAKE-10CRATE-VERIFY ?auto_575409 ?auto_575410 ?auto_575411 ?auto_575413 ?auto_575412 ?auto_575414 ?auto_575415 ?auto_575416 ?auto_575417 ?auto_575418 ?auto_575419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_575426 - SURFACE
      ?auto_575427 - SURFACE
    )
    :vars
    (
      ?auto_575434 - HOIST
      ?auto_575432 - PLACE
      ?auto_575429 - SURFACE
      ?auto_575430 - PLACE
      ?auto_575428 - HOIST
      ?auto_575431 - SURFACE
      ?auto_575433 - TRUCK
      ?auto_575435 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575434 ?auto_575432 ) ( IS-CRATE ?auto_575427 ) ( not ( = ?auto_575426 ?auto_575427 ) ) ( not ( = ?auto_575429 ?auto_575426 ) ) ( not ( = ?auto_575429 ?auto_575427 ) ) ( not ( = ?auto_575430 ?auto_575432 ) ) ( HOIST-AT ?auto_575428 ?auto_575430 ) ( not ( = ?auto_575434 ?auto_575428 ) ) ( SURFACE-AT ?auto_575427 ?auto_575430 ) ( ON ?auto_575427 ?auto_575431 ) ( CLEAR ?auto_575427 ) ( not ( = ?auto_575426 ?auto_575431 ) ) ( not ( = ?auto_575427 ?auto_575431 ) ) ( not ( = ?auto_575429 ?auto_575431 ) ) ( SURFACE-AT ?auto_575429 ?auto_575432 ) ( CLEAR ?auto_575429 ) ( IS-CRATE ?auto_575426 ) ( AVAILABLE ?auto_575434 ) ( TRUCK-AT ?auto_575433 ?auto_575430 ) ( AVAILABLE ?auto_575428 ) ( SURFACE-AT ?auto_575426 ?auto_575430 ) ( ON ?auto_575426 ?auto_575435 ) ( CLEAR ?auto_575426 ) ( not ( = ?auto_575426 ?auto_575435 ) ) ( not ( = ?auto_575427 ?auto_575435 ) ) ( not ( = ?auto_575429 ?auto_575435 ) ) ( not ( = ?auto_575431 ?auto_575435 ) ) )
    :subtasks
    ( ( !LIFT ?auto_575428 ?auto_575426 ?auto_575435 ?auto_575430 )
      ( MAKE-2CRATE ?auto_575429 ?auto_575426 ?auto_575427 )
      ( MAKE-1CRATE-VERIFY ?auto_575426 ?auto_575427 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_575436 - SURFACE
      ?auto_575437 - SURFACE
      ?auto_575438 - SURFACE
    )
    :vars
    (
      ?auto_575442 - HOIST
      ?auto_575441 - PLACE
      ?auto_575439 - PLACE
      ?auto_575445 - HOIST
      ?auto_575443 - SURFACE
      ?auto_575444 - TRUCK
      ?auto_575440 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575442 ?auto_575441 ) ( IS-CRATE ?auto_575438 ) ( not ( = ?auto_575437 ?auto_575438 ) ) ( not ( = ?auto_575436 ?auto_575437 ) ) ( not ( = ?auto_575436 ?auto_575438 ) ) ( not ( = ?auto_575439 ?auto_575441 ) ) ( HOIST-AT ?auto_575445 ?auto_575439 ) ( not ( = ?auto_575442 ?auto_575445 ) ) ( SURFACE-AT ?auto_575438 ?auto_575439 ) ( ON ?auto_575438 ?auto_575443 ) ( CLEAR ?auto_575438 ) ( not ( = ?auto_575437 ?auto_575443 ) ) ( not ( = ?auto_575438 ?auto_575443 ) ) ( not ( = ?auto_575436 ?auto_575443 ) ) ( SURFACE-AT ?auto_575436 ?auto_575441 ) ( CLEAR ?auto_575436 ) ( IS-CRATE ?auto_575437 ) ( AVAILABLE ?auto_575442 ) ( TRUCK-AT ?auto_575444 ?auto_575439 ) ( AVAILABLE ?auto_575445 ) ( SURFACE-AT ?auto_575437 ?auto_575439 ) ( ON ?auto_575437 ?auto_575440 ) ( CLEAR ?auto_575437 ) ( not ( = ?auto_575437 ?auto_575440 ) ) ( not ( = ?auto_575438 ?auto_575440 ) ) ( not ( = ?auto_575436 ?auto_575440 ) ) ( not ( = ?auto_575443 ?auto_575440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_575437 ?auto_575438 )
      ( MAKE-2CRATE-VERIFY ?auto_575436 ?auto_575437 ?auto_575438 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_575446 - SURFACE
      ?auto_575447 - SURFACE
      ?auto_575448 - SURFACE
      ?auto_575449 - SURFACE
    )
    :vars
    (
      ?auto_575453 - HOIST
      ?auto_575450 - PLACE
      ?auto_575455 - PLACE
      ?auto_575454 - HOIST
      ?auto_575456 - SURFACE
      ?auto_575451 - TRUCK
      ?auto_575452 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575453 ?auto_575450 ) ( IS-CRATE ?auto_575449 ) ( not ( = ?auto_575448 ?auto_575449 ) ) ( not ( = ?auto_575447 ?auto_575448 ) ) ( not ( = ?auto_575447 ?auto_575449 ) ) ( not ( = ?auto_575455 ?auto_575450 ) ) ( HOIST-AT ?auto_575454 ?auto_575455 ) ( not ( = ?auto_575453 ?auto_575454 ) ) ( SURFACE-AT ?auto_575449 ?auto_575455 ) ( ON ?auto_575449 ?auto_575456 ) ( CLEAR ?auto_575449 ) ( not ( = ?auto_575448 ?auto_575456 ) ) ( not ( = ?auto_575449 ?auto_575456 ) ) ( not ( = ?auto_575447 ?auto_575456 ) ) ( SURFACE-AT ?auto_575447 ?auto_575450 ) ( CLEAR ?auto_575447 ) ( IS-CRATE ?auto_575448 ) ( AVAILABLE ?auto_575453 ) ( TRUCK-AT ?auto_575451 ?auto_575455 ) ( AVAILABLE ?auto_575454 ) ( SURFACE-AT ?auto_575448 ?auto_575455 ) ( ON ?auto_575448 ?auto_575452 ) ( CLEAR ?auto_575448 ) ( not ( = ?auto_575448 ?auto_575452 ) ) ( not ( = ?auto_575449 ?auto_575452 ) ) ( not ( = ?auto_575447 ?auto_575452 ) ) ( not ( = ?auto_575456 ?auto_575452 ) ) ( ON ?auto_575447 ?auto_575446 ) ( not ( = ?auto_575446 ?auto_575447 ) ) ( not ( = ?auto_575446 ?auto_575448 ) ) ( not ( = ?auto_575446 ?auto_575449 ) ) ( not ( = ?auto_575446 ?auto_575456 ) ) ( not ( = ?auto_575446 ?auto_575452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575447 ?auto_575448 ?auto_575449 )
      ( MAKE-3CRATE-VERIFY ?auto_575446 ?auto_575447 ?auto_575448 ?auto_575449 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_575457 - SURFACE
      ?auto_575458 - SURFACE
      ?auto_575459 - SURFACE
      ?auto_575461 - SURFACE
      ?auto_575460 - SURFACE
    )
    :vars
    (
      ?auto_575465 - HOIST
      ?auto_575462 - PLACE
      ?auto_575467 - PLACE
      ?auto_575466 - HOIST
      ?auto_575468 - SURFACE
      ?auto_575463 - TRUCK
      ?auto_575464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575465 ?auto_575462 ) ( IS-CRATE ?auto_575460 ) ( not ( = ?auto_575461 ?auto_575460 ) ) ( not ( = ?auto_575459 ?auto_575461 ) ) ( not ( = ?auto_575459 ?auto_575460 ) ) ( not ( = ?auto_575467 ?auto_575462 ) ) ( HOIST-AT ?auto_575466 ?auto_575467 ) ( not ( = ?auto_575465 ?auto_575466 ) ) ( SURFACE-AT ?auto_575460 ?auto_575467 ) ( ON ?auto_575460 ?auto_575468 ) ( CLEAR ?auto_575460 ) ( not ( = ?auto_575461 ?auto_575468 ) ) ( not ( = ?auto_575460 ?auto_575468 ) ) ( not ( = ?auto_575459 ?auto_575468 ) ) ( SURFACE-AT ?auto_575459 ?auto_575462 ) ( CLEAR ?auto_575459 ) ( IS-CRATE ?auto_575461 ) ( AVAILABLE ?auto_575465 ) ( TRUCK-AT ?auto_575463 ?auto_575467 ) ( AVAILABLE ?auto_575466 ) ( SURFACE-AT ?auto_575461 ?auto_575467 ) ( ON ?auto_575461 ?auto_575464 ) ( CLEAR ?auto_575461 ) ( not ( = ?auto_575461 ?auto_575464 ) ) ( not ( = ?auto_575460 ?auto_575464 ) ) ( not ( = ?auto_575459 ?auto_575464 ) ) ( not ( = ?auto_575468 ?auto_575464 ) ) ( ON ?auto_575458 ?auto_575457 ) ( ON ?auto_575459 ?auto_575458 ) ( not ( = ?auto_575457 ?auto_575458 ) ) ( not ( = ?auto_575457 ?auto_575459 ) ) ( not ( = ?auto_575457 ?auto_575461 ) ) ( not ( = ?auto_575457 ?auto_575460 ) ) ( not ( = ?auto_575457 ?auto_575468 ) ) ( not ( = ?auto_575457 ?auto_575464 ) ) ( not ( = ?auto_575458 ?auto_575459 ) ) ( not ( = ?auto_575458 ?auto_575461 ) ) ( not ( = ?auto_575458 ?auto_575460 ) ) ( not ( = ?auto_575458 ?auto_575468 ) ) ( not ( = ?auto_575458 ?auto_575464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575459 ?auto_575461 ?auto_575460 )
      ( MAKE-4CRATE-VERIFY ?auto_575457 ?auto_575458 ?auto_575459 ?auto_575461 ?auto_575460 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_575469 - SURFACE
      ?auto_575470 - SURFACE
      ?auto_575471 - SURFACE
      ?auto_575473 - SURFACE
      ?auto_575472 - SURFACE
      ?auto_575474 - SURFACE
    )
    :vars
    (
      ?auto_575478 - HOIST
      ?auto_575475 - PLACE
      ?auto_575480 - PLACE
      ?auto_575479 - HOIST
      ?auto_575481 - SURFACE
      ?auto_575476 - TRUCK
      ?auto_575477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575478 ?auto_575475 ) ( IS-CRATE ?auto_575474 ) ( not ( = ?auto_575472 ?auto_575474 ) ) ( not ( = ?auto_575473 ?auto_575472 ) ) ( not ( = ?auto_575473 ?auto_575474 ) ) ( not ( = ?auto_575480 ?auto_575475 ) ) ( HOIST-AT ?auto_575479 ?auto_575480 ) ( not ( = ?auto_575478 ?auto_575479 ) ) ( SURFACE-AT ?auto_575474 ?auto_575480 ) ( ON ?auto_575474 ?auto_575481 ) ( CLEAR ?auto_575474 ) ( not ( = ?auto_575472 ?auto_575481 ) ) ( not ( = ?auto_575474 ?auto_575481 ) ) ( not ( = ?auto_575473 ?auto_575481 ) ) ( SURFACE-AT ?auto_575473 ?auto_575475 ) ( CLEAR ?auto_575473 ) ( IS-CRATE ?auto_575472 ) ( AVAILABLE ?auto_575478 ) ( TRUCK-AT ?auto_575476 ?auto_575480 ) ( AVAILABLE ?auto_575479 ) ( SURFACE-AT ?auto_575472 ?auto_575480 ) ( ON ?auto_575472 ?auto_575477 ) ( CLEAR ?auto_575472 ) ( not ( = ?auto_575472 ?auto_575477 ) ) ( not ( = ?auto_575474 ?auto_575477 ) ) ( not ( = ?auto_575473 ?auto_575477 ) ) ( not ( = ?auto_575481 ?auto_575477 ) ) ( ON ?auto_575470 ?auto_575469 ) ( ON ?auto_575471 ?auto_575470 ) ( ON ?auto_575473 ?auto_575471 ) ( not ( = ?auto_575469 ?auto_575470 ) ) ( not ( = ?auto_575469 ?auto_575471 ) ) ( not ( = ?auto_575469 ?auto_575473 ) ) ( not ( = ?auto_575469 ?auto_575472 ) ) ( not ( = ?auto_575469 ?auto_575474 ) ) ( not ( = ?auto_575469 ?auto_575481 ) ) ( not ( = ?auto_575469 ?auto_575477 ) ) ( not ( = ?auto_575470 ?auto_575471 ) ) ( not ( = ?auto_575470 ?auto_575473 ) ) ( not ( = ?auto_575470 ?auto_575472 ) ) ( not ( = ?auto_575470 ?auto_575474 ) ) ( not ( = ?auto_575470 ?auto_575481 ) ) ( not ( = ?auto_575470 ?auto_575477 ) ) ( not ( = ?auto_575471 ?auto_575473 ) ) ( not ( = ?auto_575471 ?auto_575472 ) ) ( not ( = ?auto_575471 ?auto_575474 ) ) ( not ( = ?auto_575471 ?auto_575481 ) ) ( not ( = ?auto_575471 ?auto_575477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575473 ?auto_575472 ?auto_575474 )
      ( MAKE-5CRATE-VERIFY ?auto_575469 ?auto_575470 ?auto_575471 ?auto_575473 ?auto_575472 ?auto_575474 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_575482 - SURFACE
      ?auto_575483 - SURFACE
      ?auto_575484 - SURFACE
      ?auto_575486 - SURFACE
      ?auto_575485 - SURFACE
      ?auto_575487 - SURFACE
      ?auto_575488 - SURFACE
    )
    :vars
    (
      ?auto_575492 - HOIST
      ?auto_575489 - PLACE
      ?auto_575494 - PLACE
      ?auto_575493 - HOIST
      ?auto_575495 - SURFACE
      ?auto_575490 - TRUCK
      ?auto_575491 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575492 ?auto_575489 ) ( IS-CRATE ?auto_575488 ) ( not ( = ?auto_575487 ?auto_575488 ) ) ( not ( = ?auto_575485 ?auto_575487 ) ) ( not ( = ?auto_575485 ?auto_575488 ) ) ( not ( = ?auto_575494 ?auto_575489 ) ) ( HOIST-AT ?auto_575493 ?auto_575494 ) ( not ( = ?auto_575492 ?auto_575493 ) ) ( SURFACE-AT ?auto_575488 ?auto_575494 ) ( ON ?auto_575488 ?auto_575495 ) ( CLEAR ?auto_575488 ) ( not ( = ?auto_575487 ?auto_575495 ) ) ( not ( = ?auto_575488 ?auto_575495 ) ) ( not ( = ?auto_575485 ?auto_575495 ) ) ( SURFACE-AT ?auto_575485 ?auto_575489 ) ( CLEAR ?auto_575485 ) ( IS-CRATE ?auto_575487 ) ( AVAILABLE ?auto_575492 ) ( TRUCK-AT ?auto_575490 ?auto_575494 ) ( AVAILABLE ?auto_575493 ) ( SURFACE-AT ?auto_575487 ?auto_575494 ) ( ON ?auto_575487 ?auto_575491 ) ( CLEAR ?auto_575487 ) ( not ( = ?auto_575487 ?auto_575491 ) ) ( not ( = ?auto_575488 ?auto_575491 ) ) ( not ( = ?auto_575485 ?auto_575491 ) ) ( not ( = ?auto_575495 ?auto_575491 ) ) ( ON ?auto_575483 ?auto_575482 ) ( ON ?auto_575484 ?auto_575483 ) ( ON ?auto_575486 ?auto_575484 ) ( ON ?auto_575485 ?auto_575486 ) ( not ( = ?auto_575482 ?auto_575483 ) ) ( not ( = ?auto_575482 ?auto_575484 ) ) ( not ( = ?auto_575482 ?auto_575486 ) ) ( not ( = ?auto_575482 ?auto_575485 ) ) ( not ( = ?auto_575482 ?auto_575487 ) ) ( not ( = ?auto_575482 ?auto_575488 ) ) ( not ( = ?auto_575482 ?auto_575495 ) ) ( not ( = ?auto_575482 ?auto_575491 ) ) ( not ( = ?auto_575483 ?auto_575484 ) ) ( not ( = ?auto_575483 ?auto_575486 ) ) ( not ( = ?auto_575483 ?auto_575485 ) ) ( not ( = ?auto_575483 ?auto_575487 ) ) ( not ( = ?auto_575483 ?auto_575488 ) ) ( not ( = ?auto_575483 ?auto_575495 ) ) ( not ( = ?auto_575483 ?auto_575491 ) ) ( not ( = ?auto_575484 ?auto_575486 ) ) ( not ( = ?auto_575484 ?auto_575485 ) ) ( not ( = ?auto_575484 ?auto_575487 ) ) ( not ( = ?auto_575484 ?auto_575488 ) ) ( not ( = ?auto_575484 ?auto_575495 ) ) ( not ( = ?auto_575484 ?auto_575491 ) ) ( not ( = ?auto_575486 ?auto_575485 ) ) ( not ( = ?auto_575486 ?auto_575487 ) ) ( not ( = ?auto_575486 ?auto_575488 ) ) ( not ( = ?auto_575486 ?auto_575495 ) ) ( not ( = ?auto_575486 ?auto_575491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575485 ?auto_575487 ?auto_575488 )
      ( MAKE-6CRATE-VERIFY ?auto_575482 ?auto_575483 ?auto_575484 ?auto_575486 ?auto_575485 ?auto_575487 ?auto_575488 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_575496 - SURFACE
      ?auto_575497 - SURFACE
      ?auto_575498 - SURFACE
      ?auto_575500 - SURFACE
      ?auto_575499 - SURFACE
      ?auto_575501 - SURFACE
      ?auto_575502 - SURFACE
      ?auto_575503 - SURFACE
    )
    :vars
    (
      ?auto_575507 - HOIST
      ?auto_575504 - PLACE
      ?auto_575509 - PLACE
      ?auto_575508 - HOIST
      ?auto_575510 - SURFACE
      ?auto_575505 - TRUCK
      ?auto_575506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575507 ?auto_575504 ) ( IS-CRATE ?auto_575503 ) ( not ( = ?auto_575502 ?auto_575503 ) ) ( not ( = ?auto_575501 ?auto_575502 ) ) ( not ( = ?auto_575501 ?auto_575503 ) ) ( not ( = ?auto_575509 ?auto_575504 ) ) ( HOIST-AT ?auto_575508 ?auto_575509 ) ( not ( = ?auto_575507 ?auto_575508 ) ) ( SURFACE-AT ?auto_575503 ?auto_575509 ) ( ON ?auto_575503 ?auto_575510 ) ( CLEAR ?auto_575503 ) ( not ( = ?auto_575502 ?auto_575510 ) ) ( not ( = ?auto_575503 ?auto_575510 ) ) ( not ( = ?auto_575501 ?auto_575510 ) ) ( SURFACE-AT ?auto_575501 ?auto_575504 ) ( CLEAR ?auto_575501 ) ( IS-CRATE ?auto_575502 ) ( AVAILABLE ?auto_575507 ) ( TRUCK-AT ?auto_575505 ?auto_575509 ) ( AVAILABLE ?auto_575508 ) ( SURFACE-AT ?auto_575502 ?auto_575509 ) ( ON ?auto_575502 ?auto_575506 ) ( CLEAR ?auto_575502 ) ( not ( = ?auto_575502 ?auto_575506 ) ) ( not ( = ?auto_575503 ?auto_575506 ) ) ( not ( = ?auto_575501 ?auto_575506 ) ) ( not ( = ?auto_575510 ?auto_575506 ) ) ( ON ?auto_575497 ?auto_575496 ) ( ON ?auto_575498 ?auto_575497 ) ( ON ?auto_575500 ?auto_575498 ) ( ON ?auto_575499 ?auto_575500 ) ( ON ?auto_575501 ?auto_575499 ) ( not ( = ?auto_575496 ?auto_575497 ) ) ( not ( = ?auto_575496 ?auto_575498 ) ) ( not ( = ?auto_575496 ?auto_575500 ) ) ( not ( = ?auto_575496 ?auto_575499 ) ) ( not ( = ?auto_575496 ?auto_575501 ) ) ( not ( = ?auto_575496 ?auto_575502 ) ) ( not ( = ?auto_575496 ?auto_575503 ) ) ( not ( = ?auto_575496 ?auto_575510 ) ) ( not ( = ?auto_575496 ?auto_575506 ) ) ( not ( = ?auto_575497 ?auto_575498 ) ) ( not ( = ?auto_575497 ?auto_575500 ) ) ( not ( = ?auto_575497 ?auto_575499 ) ) ( not ( = ?auto_575497 ?auto_575501 ) ) ( not ( = ?auto_575497 ?auto_575502 ) ) ( not ( = ?auto_575497 ?auto_575503 ) ) ( not ( = ?auto_575497 ?auto_575510 ) ) ( not ( = ?auto_575497 ?auto_575506 ) ) ( not ( = ?auto_575498 ?auto_575500 ) ) ( not ( = ?auto_575498 ?auto_575499 ) ) ( not ( = ?auto_575498 ?auto_575501 ) ) ( not ( = ?auto_575498 ?auto_575502 ) ) ( not ( = ?auto_575498 ?auto_575503 ) ) ( not ( = ?auto_575498 ?auto_575510 ) ) ( not ( = ?auto_575498 ?auto_575506 ) ) ( not ( = ?auto_575500 ?auto_575499 ) ) ( not ( = ?auto_575500 ?auto_575501 ) ) ( not ( = ?auto_575500 ?auto_575502 ) ) ( not ( = ?auto_575500 ?auto_575503 ) ) ( not ( = ?auto_575500 ?auto_575510 ) ) ( not ( = ?auto_575500 ?auto_575506 ) ) ( not ( = ?auto_575499 ?auto_575501 ) ) ( not ( = ?auto_575499 ?auto_575502 ) ) ( not ( = ?auto_575499 ?auto_575503 ) ) ( not ( = ?auto_575499 ?auto_575510 ) ) ( not ( = ?auto_575499 ?auto_575506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575501 ?auto_575502 ?auto_575503 )
      ( MAKE-7CRATE-VERIFY ?auto_575496 ?auto_575497 ?auto_575498 ?auto_575500 ?auto_575499 ?auto_575501 ?auto_575502 ?auto_575503 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_575511 - SURFACE
      ?auto_575512 - SURFACE
      ?auto_575513 - SURFACE
      ?auto_575515 - SURFACE
      ?auto_575514 - SURFACE
      ?auto_575516 - SURFACE
      ?auto_575517 - SURFACE
      ?auto_575518 - SURFACE
      ?auto_575519 - SURFACE
    )
    :vars
    (
      ?auto_575523 - HOIST
      ?auto_575520 - PLACE
      ?auto_575525 - PLACE
      ?auto_575524 - HOIST
      ?auto_575526 - SURFACE
      ?auto_575521 - TRUCK
      ?auto_575522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575523 ?auto_575520 ) ( IS-CRATE ?auto_575519 ) ( not ( = ?auto_575518 ?auto_575519 ) ) ( not ( = ?auto_575517 ?auto_575518 ) ) ( not ( = ?auto_575517 ?auto_575519 ) ) ( not ( = ?auto_575525 ?auto_575520 ) ) ( HOIST-AT ?auto_575524 ?auto_575525 ) ( not ( = ?auto_575523 ?auto_575524 ) ) ( SURFACE-AT ?auto_575519 ?auto_575525 ) ( ON ?auto_575519 ?auto_575526 ) ( CLEAR ?auto_575519 ) ( not ( = ?auto_575518 ?auto_575526 ) ) ( not ( = ?auto_575519 ?auto_575526 ) ) ( not ( = ?auto_575517 ?auto_575526 ) ) ( SURFACE-AT ?auto_575517 ?auto_575520 ) ( CLEAR ?auto_575517 ) ( IS-CRATE ?auto_575518 ) ( AVAILABLE ?auto_575523 ) ( TRUCK-AT ?auto_575521 ?auto_575525 ) ( AVAILABLE ?auto_575524 ) ( SURFACE-AT ?auto_575518 ?auto_575525 ) ( ON ?auto_575518 ?auto_575522 ) ( CLEAR ?auto_575518 ) ( not ( = ?auto_575518 ?auto_575522 ) ) ( not ( = ?auto_575519 ?auto_575522 ) ) ( not ( = ?auto_575517 ?auto_575522 ) ) ( not ( = ?auto_575526 ?auto_575522 ) ) ( ON ?auto_575512 ?auto_575511 ) ( ON ?auto_575513 ?auto_575512 ) ( ON ?auto_575515 ?auto_575513 ) ( ON ?auto_575514 ?auto_575515 ) ( ON ?auto_575516 ?auto_575514 ) ( ON ?auto_575517 ?auto_575516 ) ( not ( = ?auto_575511 ?auto_575512 ) ) ( not ( = ?auto_575511 ?auto_575513 ) ) ( not ( = ?auto_575511 ?auto_575515 ) ) ( not ( = ?auto_575511 ?auto_575514 ) ) ( not ( = ?auto_575511 ?auto_575516 ) ) ( not ( = ?auto_575511 ?auto_575517 ) ) ( not ( = ?auto_575511 ?auto_575518 ) ) ( not ( = ?auto_575511 ?auto_575519 ) ) ( not ( = ?auto_575511 ?auto_575526 ) ) ( not ( = ?auto_575511 ?auto_575522 ) ) ( not ( = ?auto_575512 ?auto_575513 ) ) ( not ( = ?auto_575512 ?auto_575515 ) ) ( not ( = ?auto_575512 ?auto_575514 ) ) ( not ( = ?auto_575512 ?auto_575516 ) ) ( not ( = ?auto_575512 ?auto_575517 ) ) ( not ( = ?auto_575512 ?auto_575518 ) ) ( not ( = ?auto_575512 ?auto_575519 ) ) ( not ( = ?auto_575512 ?auto_575526 ) ) ( not ( = ?auto_575512 ?auto_575522 ) ) ( not ( = ?auto_575513 ?auto_575515 ) ) ( not ( = ?auto_575513 ?auto_575514 ) ) ( not ( = ?auto_575513 ?auto_575516 ) ) ( not ( = ?auto_575513 ?auto_575517 ) ) ( not ( = ?auto_575513 ?auto_575518 ) ) ( not ( = ?auto_575513 ?auto_575519 ) ) ( not ( = ?auto_575513 ?auto_575526 ) ) ( not ( = ?auto_575513 ?auto_575522 ) ) ( not ( = ?auto_575515 ?auto_575514 ) ) ( not ( = ?auto_575515 ?auto_575516 ) ) ( not ( = ?auto_575515 ?auto_575517 ) ) ( not ( = ?auto_575515 ?auto_575518 ) ) ( not ( = ?auto_575515 ?auto_575519 ) ) ( not ( = ?auto_575515 ?auto_575526 ) ) ( not ( = ?auto_575515 ?auto_575522 ) ) ( not ( = ?auto_575514 ?auto_575516 ) ) ( not ( = ?auto_575514 ?auto_575517 ) ) ( not ( = ?auto_575514 ?auto_575518 ) ) ( not ( = ?auto_575514 ?auto_575519 ) ) ( not ( = ?auto_575514 ?auto_575526 ) ) ( not ( = ?auto_575514 ?auto_575522 ) ) ( not ( = ?auto_575516 ?auto_575517 ) ) ( not ( = ?auto_575516 ?auto_575518 ) ) ( not ( = ?auto_575516 ?auto_575519 ) ) ( not ( = ?auto_575516 ?auto_575526 ) ) ( not ( = ?auto_575516 ?auto_575522 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575517 ?auto_575518 ?auto_575519 )
      ( MAKE-8CRATE-VERIFY ?auto_575511 ?auto_575512 ?auto_575513 ?auto_575515 ?auto_575514 ?auto_575516 ?auto_575517 ?auto_575518 ?auto_575519 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_575527 - SURFACE
      ?auto_575528 - SURFACE
      ?auto_575529 - SURFACE
      ?auto_575531 - SURFACE
      ?auto_575530 - SURFACE
      ?auto_575532 - SURFACE
      ?auto_575533 - SURFACE
      ?auto_575534 - SURFACE
      ?auto_575535 - SURFACE
      ?auto_575536 - SURFACE
    )
    :vars
    (
      ?auto_575540 - HOIST
      ?auto_575537 - PLACE
      ?auto_575542 - PLACE
      ?auto_575541 - HOIST
      ?auto_575543 - SURFACE
      ?auto_575538 - TRUCK
      ?auto_575539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575540 ?auto_575537 ) ( IS-CRATE ?auto_575536 ) ( not ( = ?auto_575535 ?auto_575536 ) ) ( not ( = ?auto_575534 ?auto_575535 ) ) ( not ( = ?auto_575534 ?auto_575536 ) ) ( not ( = ?auto_575542 ?auto_575537 ) ) ( HOIST-AT ?auto_575541 ?auto_575542 ) ( not ( = ?auto_575540 ?auto_575541 ) ) ( SURFACE-AT ?auto_575536 ?auto_575542 ) ( ON ?auto_575536 ?auto_575543 ) ( CLEAR ?auto_575536 ) ( not ( = ?auto_575535 ?auto_575543 ) ) ( not ( = ?auto_575536 ?auto_575543 ) ) ( not ( = ?auto_575534 ?auto_575543 ) ) ( SURFACE-AT ?auto_575534 ?auto_575537 ) ( CLEAR ?auto_575534 ) ( IS-CRATE ?auto_575535 ) ( AVAILABLE ?auto_575540 ) ( TRUCK-AT ?auto_575538 ?auto_575542 ) ( AVAILABLE ?auto_575541 ) ( SURFACE-AT ?auto_575535 ?auto_575542 ) ( ON ?auto_575535 ?auto_575539 ) ( CLEAR ?auto_575535 ) ( not ( = ?auto_575535 ?auto_575539 ) ) ( not ( = ?auto_575536 ?auto_575539 ) ) ( not ( = ?auto_575534 ?auto_575539 ) ) ( not ( = ?auto_575543 ?auto_575539 ) ) ( ON ?auto_575528 ?auto_575527 ) ( ON ?auto_575529 ?auto_575528 ) ( ON ?auto_575531 ?auto_575529 ) ( ON ?auto_575530 ?auto_575531 ) ( ON ?auto_575532 ?auto_575530 ) ( ON ?auto_575533 ?auto_575532 ) ( ON ?auto_575534 ?auto_575533 ) ( not ( = ?auto_575527 ?auto_575528 ) ) ( not ( = ?auto_575527 ?auto_575529 ) ) ( not ( = ?auto_575527 ?auto_575531 ) ) ( not ( = ?auto_575527 ?auto_575530 ) ) ( not ( = ?auto_575527 ?auto_575532 ) ) ( not ( = ?auto_575527 ?auto_575533 ) ) ( not ( = ?auto_575527 ?auto_575534 ) ) ( not ( = ?auto_575527 ?auto_575535 ) ) ( not ( = ?auto_575527 ?auto_575536 ) ) ( not ( = ?auto_575527 ?auto_575543 ) ) ( not ( = ?auto_575527 ?auto_575539 ) ) ( not ( = ?auto_575528 ?auto_575529 ) ) ( not ( = ?auto_575528 ?auto_575531 ) ) ( not ( = ?auto_575528 ?auto_575530 ) ) ( not ( = ?auto_575528 ?auto_575532 ) ) ( not ( = ?auto_575528 ?auto_575533 ) ) ( not ( = ?auto_575528 ?auto_575534 ) ) ( not ( = ?auto_575528 ?auto_575535 ) ) ( not ( = ?auto_575528 ?auto_575536 ) ) ( not ( = ?auto_575528 ?auto_575543 ) ) ( not ( = ?auto_575528 ?auto_575539 ) ) ( not ( = ?auto_575529 ?auto_575531 ) ) ( not ( = ?auto_575529 ?auto_575530 ) ) ( not ( = ?auto_575529 ?auto_575532 ) ) ( not ( = ?auto_575529 ?auto_575533 ) ) ( not ( = ?auto_575529 ?auto_575534 ) ) ( not ( = ?auto_575529 ?auto_575535 ) ) ( not ( = ?auto_575529 ?auto_575536 ) ) ( not ( = ?auto_575529 ?auto_575543 ) ) ( not ( = ?auto_575529 ?auto_575539 ) ) ( not ( = ?auto_575531 ?auto_575530 ) ) ( not ( = ?auto_575531 ?auto_575532 ) ) ( not ( = ?auto_575531 ?auto_575533 ) ) ( not ( = ?auto_575531 ?auto_575534 ) ) ( not ( = ?auto_575531 ?auto_575535 ) ) ( not ( = ?auto_575531 ?auto_575536 ) ) ( not ( = ?auto_575531 ?auto_575543 ) ) ( not ( = ?auto_575531 ?auto_575539 ) ) ( not ( = ?auto_575530 ?auto_575532 ) ) ( not ( = ?auto_575530 ?auto_575533 ) ) ( not ( = ?auto_575530 ?auto_575534 ) ) ( not ( = ?auto_575530 ?auto_575535 ) ) ( not ( = ?auto_575530 ?auto_575536 ) ) ( not ( = ?auto_575530 ?auto_575543 ) ) ( not ( = ?auto_575530 ?auto_575539 ) ) ( not ( = ?auto_575532 ?auto_575533 ) ) ( not ( = ?auto_575532 ?auto_575534 ) ) ( not ( = ?auto_575532 ?auto_575535 ) ) ( not ( = ?auto_575532 ?auto_575536 ) ) ( not ( = ?auto_575532 ?auto_575543 ) ) ( not ( = ?auto_575532 ?auto_575539 ) ) ( not ( = ?auto_575533 ?auto_575534 ) ) ( not ( = ?auto_575533 ?auto_575535 ) ) ( not ( = ?auto_575533 ?auto_575536 ) ) ( not ( = ?auto_575533 ?auto_575543 ) ) ( not ( = ?auto_575533 ?auto_575539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575534 ?auto_575535 ?auto_575536 )
      ( MAKE-9CRATE-VERIFY ?auto_575527 ?auto_575528 ?auto_575529 ?auto_575531 ?auto_575530 ?auto_575532 ?auto_575533 ?auto_575534 ?auto_575535 ?auto_575536 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575544 - SURFACE
      ?auto_575545 - SURFACE
      ?auto_575546 - SURFACE
      ?auto_575548 - SURFACE
      ?auto_575547 - SURFACE
      ?auto_575549 - SURFACE
      ?auto_575550 - SURFACE
      ?auto_575551 - SURFACE
      ?auto_575552 - SURFACE
      ?auto_575553 - SURFACE
      ?auto_575554 - SURFACE
    )
    :vars
    (
      ?auto_575558 - HOIST
      ?auto_575555 - PLACE
      ?auto_575560 - PLACE
      ?auto_575559 - HOIST
      ?auto_575561 - SURFACE
      ?auto_575556 - TRUCK
      ?auto_575557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575558 ?auto_575555 ) ( IS-CRATE ?auto_575554 ) ( not ( = ?auto_575553 ?auto_575554 ) ) ( not ( = ?auto_575552 ?auto_575553 ) ) ( not ( = ?auto_575552 ?auto_575554 ) ) ( not ( = ?auto_575560 ?auto_575555 ) ) ( HOIST-AT ?auto_575559 ?auto_575560 ) ( not ( = ?auto_575558 ?auto_575559 ) ) ( SURFACE-AT ?auto_575554 ?auto_575560 ) ( ON ?auto_575554 ?auto_575561 ) ( CLEAR ?auto_575554 ) ( not ( = ?auto_575553 ?auto_575561 ) ) ( not ( = ?auto_575554 ?auto_575561 ) ) ( not ( = ?auto_575552 ?auto_575561 ) ) ( SURFACE-AT ?auto_575552 ?auto_575555 ) ( CLEAR ?auto_575552 ) ( IS-CRATE ?auto_575553 ) ( AVAILABLE ?auto_575558 ) ( TRUCK-AT ?auto_575556 ?auto_575560 ) ( AVAILABLE ?auto_575559 ) ( SURFACE-AT ?auto_575553 ?auto_575560 ) ( ON ?auto_575553 ?auto_575557 ) ( CLEAR ?auto_575553 ) ( not ( = ?auto_575553 ?auto_575557 ) ) ( not ( = ?auto_575554 ?auto_575557 ) ) ( not ( = ?auto_575552 ?auto_575557 ) ) ( not ( = ?auto_575561 ?auto_575557 ) ) ( ON ?auto_575545 ?auto_575544 ) ( ON ?auto_575546 ?auto_575545 ) ( ON ?auto_575548 ?auto_575546 ) ( ON ?auto_575547 ?auto_575548 ) ( ON ?auto_575549 ?auto_575547 ) ( ON ?auto_575550 ?auto_575549 ) ( ON ?auto_575551 ?auto_575550 ) ( ON ?auto_575552 ?auto_575551 ) ( not ( = ?auto_575544 ?auto_575545 ) ) ( not ( = ?auto_575544 ?auto_575546 ) ) ( not ( = ?auto_575544 ?auto_575548 ) ) ( not ( = ?auto_575544 ?auto_575547 ) ) ( not ( = ?auto_575544 ?auto_575549 ) ) ( not ( = ?auto_575544 ?auto_575550 ) ) ( not ( = ?auto_575544 ?auto_575551 ) ) ( not ( = ?auto_575544 ?auto_575552 ) ) ( not ( = ?auto_575544 ?auto_575553 ) ) ( not ( = ?auto_575544 ?auto_575554 ) ) ( not ( = ?auto_575544 ?auto_575561 ) ) ( not ( = ?auto_575544 ?auto_575557 ) ) ( not ( = ?auto_575545 ?auto_575546 ) ) ( not ( = ?auto_575545 ?auto_575548 ) ) ( not ( = ?auto_575545 ?auto_575547 ) ) ( not ( = ?auto_575545 ?auto_575549 ) ) ( not ( = ?auto_575545 ?auto_575550 ) ) ( not ( = ?auto_575545 ?auto_575551 ) ) ( not ( = ?auto_575545 ?auto_575552 ) ) ( not ( = ?auto_575545 ?auto_575553 ) ) ( not ( = ?auto_575545 ?auto_575554 ) ) ( not ( = ?auto_575545 ?auto_575561 ) ) ( not ( = ?auto_575545 ?auto_575557 ) ) ( not ( = ?auto_575546 ?auto_575548 ) ) ( not ( = ?auto_575546 ?auto_575547 ) ) ( not ( = ?auto_575546 ?auto_575549 ) ) ( not ( = ?auto_575546 ?auto_575550 ) ) ( not ( = ?auto_575546 ?auto_575551 ) ) ( not ( = ?auto_575546 ?auto_575552 ) ) ( not ( = ?auto_575546 ?auto_575553 ) ) ( not ( = ?auto_575546 ?auto_575554 ) ) ( not ( = ?auto_575546 ?auto_575561 ) ) ( not ( = ?auto_575546 ?auto_575557 ) ) ( not ( = ?auto_575548 ?auto_575547 ) ) ( not ( = ?auto_575548 ?auto_575549 ) ) ( not ( = ?auto_575548 ?auto_575550 ) ) ( not ( = ?auto_575548 ?auto_575551 ) ) ( not ( = ?auto_575548 ?auto_575552 ) ) ( not ( = ?auto_575548 ?auto_575553 ) ) ( not ( = ?auto_575548 ?auto_575554 ) ) ( not ( = ?auto_575548 ?auto_575561 ) ) ( not ( = ?auto_575548 ?auto_575557 ) ) ( not ( = ?auto_575547 ?auto_575549 ) ) ( not ( = ?auto_575547 ?auto_575550 ) ) ( not ( = ?auto_575547 ?auto_575551 ) ) ( not ( = ?auto_575547 ?auto_575552 ) ) ( not ( = ?auto_575547 ?auto_575553 ) ) ( not ( = ?auto_575547 ?auto_575554 ) ) ( not ( = ?auto_575547 ?auto_575561 ) ) ( not ( = ?auto_575547 ?auto_575557 ) ) ( not ( = ?auto_575549 ?auto_575550 ) ) ( not ( = ?auto_575549 ?auto_575551 ) ) ( not ( = ?auto_575549 ?auto_575552 ) ) ( not ( = ?auto_575549 ?auto_575553 ) ) ( not ( = ?auto_575549 ?auto_575554 ) ) ( not ( = ?auto_575549 ?auto_575561 ) ) ( not ( = ?auto_575549 ?auto_575557 ) ) ( not ( = ?auto_575550 ?auto_575551 ) ) ( not ( = ?auto_575550 ?auto_575552 ) ) ( not ( = ?auto_575550 ?auto_575553 ) ) ( not ( = ?auto_575550 ?auto_575554 ) ) ( not ( = ?auto_575550 ?auto_575561 ) ) ( not ( = ?auto_575550 ?auto_575557 ) ) ( not ( = ?auto_575551 ?auto_575552 ) ) ( not ( = ?auto_575551 ?auto_575553 ) ) ( not ( = ?auto_575551 ?auto_575554 ) ) ( not ( = ?auto_575551 ?auto_575561 ) ) ( not ( = ?auto_575551 ?auto_575557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575552 ?auto_575553 ?auto_575554 )
      ( MAKE-10CRATE-VERIFY ?auto_575544 ?auto_575545 ?auto_575546 ?auto_575548 ?auto_575547 ?auto_575549 ?auto_575550 ?auto_575551 ?auto_575552 ?auto_575553 ?auto_575554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_575562 - SURFACE
      ?auto_575563 - SURFACE
    )
    :vars
    (
      ?auto_575568 - HOIST
      ?auto_575565 - PLACE
      ?auto_575564 - SURFACE
      ?auto_575570 - PLACE
      ?auto_575569 - HOIST
      ?auto_575571 - SURFACE
      ?auto_575567 - SURFACE
      ?auto_575566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575568 ?auto_575565 ) ( IS-CRATE ?auto_575563 ) ( not ( = ?auto_575562 ?auto_575563 ) ) ( not ( = ?auto_575564 ?auto_575562 ) ) ( not ( = ?auto_575564 ?auto_575563 ) ) ( not ( = ?auto_575570 ?auto_575565 ) ) ( HOIST-AT ?auto_575569 ?auto_575570 ) ( not ( = ?auto_575568 ?auto_575569 ) ) ( SURFACE-AT ?auto_575563 ?auto_575570 ) ( ON ?auto_575563 ?auto_575571 ) ( CLEAR ?auto_575563 ) ( not ( = ?auto_575562 ?auto_575571 ) ) ( not ( = ?auto_575563 ?auto_575571 ) ) ( not ( = ?auto_575564 ?auto_575571 ) ) ( SURFACE-AT ?auto_575564 ?auto_575565 ) ( CLEAR ?auto_575564 ) ( IS-CRATE ?auto_575562 ) ( AVAILABLE ?auto_575568 ) ( AVAILABLE ?auto_575569 ) ( SURFACE-AT ?auto_575562 ?auto_575570 ) ( ON ?auto_575562 ?auto_575567 ) ( CLEAR ?auto_575562 ) ( not ( = ?auto_575562 ?auto_575567 ) ) ( not ( = ?auto_575563 ?auto_575567 ) ) ( not ( = ?auto_575564 ?auto_575567 ) ) ( not ( = ?auto_575571 ?auto_575567 ) ) ( TRUCK-AT ?auto_575566 ?auto_575565 ) )
    :subtasks
    ( ( !DRIVE ?auto_575566 ?auto_575565 ?auto_575570 )
      ( MAKE-2CRATE ?auto_575564 ?auto_575562 ?auto_575563 )
      ( MAKE-1CRATE-VERIFY ?auto_575562 ?auto_575563 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_575572 - SURFACE
      ?auto_575573 - SURFACE
      ?auto_575574 - SURFACE
    )
    :vars
    (
      ?auto_575580 - HOIST
      ?auto_575579 - PLACE
      ?auto_575578 - PLACE
      ?auto_575575 - HOIST
      ?auto_575577 - SURFACE
      ?auto_575581 - SURFACE
      ?auto_575576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575580 ?auto_575579 ) ( IS-CRATE ?auto_575574 ) ( not ( = ?auto_575573 ?auto_575574 ) ) ( not ( = ?auto_575572 ?auto_575573 ) ) ( not ( = ?auto_575572 ?auto_575574 ) ) ( not ( = ?auto_575578 ?auto_575579 ) ) ( HOIST-AT ?auto_575575 ?auto_575578 ) ( not ( = ?auto_575580 ?auto_575575 ) ) ( SURFACE-AT ?auto_575574 ?auto_575578 ) ( ON ?auto_575574 ?auto_575577 ) ( CLEAR ?auto_575574 ) ( not ( = ?auto_575573 ?auto_575577 ) ) ( not ( = ?auto_575574 ?auto_575577 ) ) ( not ( = ?auto_575572 ?auto_575577 ) ) ( SURFACE-AT ?auto_575572 ?auto_575579 ) ( CLEAR ?auto_575572 ) ( IS-CRATE ?auto_575573 ) ( AVAILABLE ?auto_575580 ) ( AVAILABLE ?auto_575575 ) ( SURFACE-AT ?auto_575573 ?auto_575578 ) ( ON ?auto_575573 ?auto_575581 ) ( CLEAR ?auto_575573 ) ( not ( = ?auto_575573 ?auto_575581 ) ) ( not ( = ?auto_575574 ?auto_575581 ) ) ( not ( = ?auto_575572 ?auto_575581 ) ) ( not ( = ?auto_575577 ?auto_575581 ) ) ( TRUCK-AT ?auto_575576 ?auto_575579 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_575573 ?auto_575574 )
      ( MAKE-2CRATE-VERIFY ?auto_575572 ?auto_575573 ?auto_575574 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_575582 - SURFACE
      ?auto_575583 - SURFACE
      ?auto_575584 - SURFACE
      ?auto_575585 - SURFACE
    )
    :vars
    (
      ?auto_575592 - HOIST
      ?auto_575586 - PLACE
      ?auto_575590 - PLACE
      ?auto_575589 - HOIST
      ?auto_575588 - SURFACE
      ?auto_575587 - SURFACE
      ?auto_575591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575592 ?auto_575586 ) ( IS-CRATE ?auto_575585 ) ( not ( = ?auto_575584 ?auto_575585 ) ) ( not ( = ?auto_575583 ?auto_575584 ) ) ( not ( = ?auto_575583 ?auto_575585 ) ) ( not ( = ?auto_575590 ?auto_575586 ) ) ( HOIST-AT ?auto_575589 ?auto_575590 ) ( not ( = ?auto_575592 ?auto_575589 ) ) ( SURFACE-AT ?auto_575585 ?auto_575590 ) ( ON ?auto_575585 ?auto_575588 ) ( CLEAR ?auto_575585 ) ( not ( = ?auto_575584 ?auto_575588 ) ) ( not ( = ?auto_575585 ?auto_575588 ) ) ( not ( = ?auto_575583 ?auto_575588 ) ) ( SURFACE-AT ?auto_575583 ?auto_575586 ) ( CLEAR ?auto_575583 ) ( IS-CRATE ?auto_575584 ) ( AVAILABLE ?auto_575592 ) ( AVAILABLE ?auto_575589 ) ( SURFACE-AT ?auto_575584 ?auto_575590 ) ( ON ?auto_575584 ?auto_575587 ) ( CLEAR ?auto_575584 ) ( not ( = ?auto_575584 ?auto_575587 ) ) ( not ( = ?auto_575585 ?auto_575587 ) ) ( not ( = ?auto_575583 ?auto_575587 ) ) ( not ( = ?auto_575588 ?auto_575587 ) ) ( TRUCK-AT ?auto_575591 ?auto_575586 ) ( ON ?auto_575583 ?auto_575582 ) ( not ( = ?auto_575582 ?auto_575583 ) ) ( not ( = ?auto_575582 ?auto_575584 ) ) ( not ( = ?auto_575582 ?auto_575585 ) ) ( not ( = ?auto_575582 ?auto_575588 ) ) ( not ( = ?auto_575582 ?auto_575587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575583 ?auto_575584 ?auto_575585 )
      ( MAKE-3CRATE-VERIFY ?auto_575582 ?auto_575583 ?auto_575584 ?auto_575585 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_575593 - SURFACE
      ?auto_575594 - SURFACE
      ?auto_575595 - SURFACE
      ?auto_575597 - SURFACE
      ?auto_575596 - SURFACE
    )
    :vars
    (
      ?auto_575604 - HOIST
      ?auto_575598 - PLACE
      ?auto_575602 - PLACE
      ?auto_575601 - HOIST
      ?auto_575600 - SURFACE
      ?auto_575599 - SURFACE
      ?auto_575603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575604 ?auto_575598 ) ( IS-CRATE ?auto_575596 ) ( not ( = ?auto_575597 ?auto_575596 ) ) ( not ( = ?auto_575595 ?auto_575597 ) ) ( not ( = ?auto_575595 ?auto_575596 ) ) ( not ( = ?auto_575602 ?auto_575598 ) ) ( HOIST-AT ?auto_575601 ?auto_575602 ) ( not ( = ?auto_575604 ?auto_575601 ) ) ( SURFACE-AT ?auto_575596 ?auto_575602 ) ( ON ?auto_575596 ?auto_575600 ) ( CLEAR ?auto_575596 ) ( not ( = ?auto_575597 ?auto_575600 ) ) ( not ( = ?auto_575596 ?auto_575600 ) ) ( not ( = ?auto_575595 ?auto_575600 ) ) ( SURFACE-AT ?auto_575595 ?auto_575598 ) ( CLEAR ?auto_575595 ) ( IS-CRATE ?auto_575597 ) ( AVAILABLE ?auto_575604 ) ( AVAILABLE ?auto_575601 ) ( SURFACE-AT ?auto_575597 ?auto_575602 ) ( ON ?auto_575597 ?auto_575599 ) ( CLEAR ?auto_575597 ) ( not ( = ?auto_575597 ?auto_575599 ) ) ( not ( = ?auto_575596 ?auto_575599 ) ) ( not ( = ?auto_575595 ?auto_575599 ) ) ( not ( = ?auto_575600 ?auto_575599 ) ) ( TRUCK-AT ?auto_575603 ?auto_575598 ) ( ON ?auto_575594 ?auto_575593 ) ( ON ?auto_575595 ?auto_575594 ) ( not ( = ?auto_575593 ?auto_575594 ) ) ( not ( = ?auto_575593 ?auto_575595 ) ) ( not ( = ?auto_575593 ?auto_575597 ) ) ( not ( = ?auto_575593 ?auto_575596 ) ) ( not ( = ?auto_575593 ?auto_575600 ) ) ( not ( = ?auto_575593 ?auto_575599 ) ) ( not ( = ?auto_575594 ?auto_575595 ) ) ( not ( = ?auto_575594 ?auto_575597 ) ) ( not ( = ?auto_575594 ?auto_575596 ) ) ( not ( = ?auto_575594 ?auto_575600 ) ) ( not ( = ?auto_575594 ?auto_575599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575595 ?auto_575597 ?auto_575596 )
      ( MAKE-4CRATE-VERIFY ?auto_575593 ?auto_575594 ?auto_575595 ?auto_575597 ?auto_575596 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_575605 - SURFACE
      ?auto_575606 - SURFACE
      ?auto_575607 - SURFACE
      ?auto_575609 - SURFACE
      ?auto_575608 - SURFACE
      ?auto_575610 - SURFACE
    )
    :vars
    (
      ?auto_575617 - HOIST
      ?auto_575611 - PLACE
      ?auto_575615 - PLACE
      ?auto_575614 - HOIST
      ?auto_575613 - SURFACE
      ?auto_575612 - SURFACE
      ?auto_575616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575617 ?auto_575611 ) ( IS-CRATE ?auto_575610 ) ( not ( = ?auto_575608 ?auto_575610 ) ) ( not ( = ?auto_575609 ?auto_575608 ) ) ( not ( = ?auto_575609 ?auto_575610 ) ) ( not ( = ?auto_575615 ?auto_575611 ) ) ( HOIST-AT ?auto_575614 ?auto_575615 ) ( not ( = ?auto_575617 ?auto_575614 ) ) ( SURFACE-AT ?auto_575610 ?auto_575615 ) ( ON ?auto_575610 ?auto_575613 ) ( CLEAR ?auto_575610 ) ( not ( = ?auto_575608 ?auto_575613 ) ) ( not ( = ?auto_575610 ?auto_575613 ) ) ( not ( = ?auto_575609 ?auto_575613 ) ) ( SURFACE-AT ?auto_575609 ?auto_575611 ) ( CLEAR ?auto_575609 ) ( IS-CRATE ?auto_575608 ) ( AVAILABLE ?auto_575617 ) ( AVAILABLE ?auto_575614 ) ( SURFACE-AT ?auto_575608 ?auto_575615 ) ( ON ?auto_575608 ?auto_575612 ) ( CLEAR ?auto_575608 ) ( not ( = ?auto_575608 ?auto_575612 ) ) ( not ( = ?auto_575610 ?auto_575612 ) ) ( not ( = ?auto_575609 ?auto_575612 ) ) ( not ( = ?auto_575613 ?auto_575612 ) ) ( TRUCK-AT ?auto_575616 ?auto_575611 ) ( ON ?auto_575606 ?auto_575605 ) ( ON ?auto_575607 ?auto_575606 ) ( ON ?auto_575609 ?auto_575607 ) ( not ( = ?auto_575605 ?auto_575606 ) ) ( not ( = ?auto_575605 ?auto_575607 ) ) ( not ( = ?auto_575605 ?auto_575609 ) ) ( not ( = ?auto_575605 ?auto_575608 ) ) ( not ( = ?auto_575605 ?auto_575610 ) ) ( not ( = ?auto_575605 ?auto_575613 ) ) ( not ( = ?auto_575605 ?auto_575612 ) ) ( not ( = ?auto_575606 ?auto_575607 ) ) ( not ( = ?auto_575606 ?auto_575609 ) ) ( not ( = ?auto_575606 ?auto_575608 ) ) ( not ( = ?auto_575606 ?auto_575610 ) ) ( not ( = ?auto_575606 ?auto_575613 ) ) ( not ( = ?auto_575606 ?auto_575612 ) ) ( not ( = ?auto_575607 ?auto_575609 ) ) ( not ( = ?auto_575607 ?auto_575608 ) ) ( not ( = ?auto_575607 ?auto_575610 ) ) ( not ( = ?auto_575607 ?auto_575613 ) ) ( not ( = ?auto_575607 ?auto_575612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575609 ?auto_575608 ?auto_575610 )
      ( MAKE-5CRATE-VERIFY ?auto_575605 ?auto_575606 ?auto_575607 ?auto_575609 ?auto_575608 ?auto_575610 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_575618 - SURFACE
      ?auto_575619 - SURFACE
      ?auto_575620 - SURFACE
      ?auto_575622 - SURFACE
      ?auto_575621 - SURFACE
      ?auto_575623 - SURFACE
      ?auto_575624 - SURFACE
    )
    :vars
    (
      ?auto_575631 - HOIST
      ?auto_575625 - PLACE
      ?auto_575629 - PLACE
      ?auto_575628 - HOIST
      ?auto_575627 - SURFACE
      ?auto_575626 - SURFACE
      ?auto_575630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575631 ?auto_575625 ) ( IS-CRATE ?auto_575624 ) ( not ( = ?auto_575623 ?auto_575624 ) ) ( not ( = ?auto_575621 ?auto_575623 ) ) ( not ( = ?auto_575621 ?auto_575624 ) ) ( not ( = ?auto_575629 ?auto_575625 ) ) ( HOIST-AT ?auto_575628 ?auto_575629 ) ( not ( = ?auto_575631 ?auto_575628 ) ) ( SURFACE-AT ?auto_575624 ?auto_575629 ) ( ON ?auto_575624 ?auto_575627 ) ( CLEAR ?auto_575624 ) ( not ( = ?auto_575623 ?auto_575627 ) ) ( not ( = ?auto_575624 ?auto_575627 ) ) ( not ( = ?auto_575621 ?auto_575627 ) ) ( SURFACE-AT ?auto_575621 ?auto_575625 ) ( CLEAR ?auto_575621 ) ( IS-CRATE ?auto_575623 ) ( AVAILABLE ?auto_575631 ) ( AVAILABLE ?auto_575628 ) ( SURFACE-AT ?auto_575623 ?auto_575629 ) ( ON ?auto_575623 ?auto_575626 ) ( CLEAR ?auto_575623 ) ( not ( = ?auto_575623 ?auto_575626 ) ) ( not ( = ?auto_575624 ?auto_575626 ) ) ( not ( = ?auto_575621 ?auto_575626 ) ) ( not ( = ?auto_575627 ?auto_575626 ) ) ( TRUCK-AT ?auto_575630 ?auto_575625 ) ( ON ?auto_575619 ?auto_575618 ) ( ON ?auto_575620 ?auto_575619 ) ( ON ?auto_575622 ?auto_575620 ) ( ON ?auto_575621 ?auto_575622 ) ( not ( = ?auto_575618 ?auto_575619 ) ) ( not ( = ?auto_575618 ?auto_575620 ) ) ( not ( = ?auto_575618 ?auto_575622 ) ) ( not ( = ?auto_575618 ?auto_575621 ) ) ( not ( = ?auto_575618 ?auto_575623 ) ) ( not ( = ?auto_575618 ?auto_575624 ) ) ( not ( = ?auto_575618 ?auto_575627 ) ) ( not ( = ?auto_575618 ?auto_575626 ) ) ( not ( = ?auto_575619 ?auto_575620 ) ) ( not ( = ?auto_575619 ?auto_575622 ) ) ( not ( = ?auto_575619 ?auto_575621 ) ) ( not ( = ?auto_575619 ?auto_575623 ) ) ( not ( = ?auto_575619 ?auto_575624 ) ) ( not ( = ?auto_575619 ?auto_575627 ) ) ( not ( = ?auto_575619 ?auto_575626 ) ) ( not ( = ?auto_575620 ?auto_575622 ) ) ( not ( = ?auto_575620 ?auto_575621 ) ) ( not ( = ?auto_575620 ?auto_575623 ) ) ( not ( = ?auto_575620 ?auto_575624 ) ) ( not ( = ?auto_575620 ?auto_575627 ) ) ( not ( = ?auto_575620 ?auto_575626 ) ) ( not ( = ?auto_575622 ?auto_575621 ) ) ( not ( = ?auto_575622 ?auto_575623 ) ) ( not ( = ?auto_575622 ?auto_575624 ) ) ( not ( = ?auto_575622 ?auto_575627 ) ) ( not ( = ?auto_575622 ?auto_575626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575621 ?auto_575623 ?auto_575624 )
      ( MAKE-6CRATE-VERIFY ?auto_575618 ?auto_575619 ?auto_575620 ?auto_575622 ?auto_575621 ?auto_575623 ?auto_575624 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_575632 - SURFACE
      ?auto_575633 - SURFACE
      ?auto_575634 - SURFACE
      ?auto_575636 - SURFACE
      ?auto_575635 - SURFACE
      ?auto_575637 - SURFACE
      ?auto_575638 - SURFACE
      ?auto_575639 - SURFACE
    )
    :vars
    (
      ?auto_575646 - HOIST
      ?auto_575640 - PLACE
      ?auto_575644 - PLACE
      ?auto_575643 - HOIST
      ?auto_575642 - SURFACE
      ?auto_575641 - SURFACE
      ?auto_575645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575646 ?auto_575640 ) ( IS-CRATE ?auto_575639 ) ( not ( = ?auto_575638 ?auto_575639 ) ) ( not ( = ?auto_575637 ?auto_575638 ) ) ( not ( = ?auto_575637 ?auto_575639 ) ) ( not ( = ?auto_575644 ?auto_575640 ) ) ( HOIST-AT ?auto_575643 ?auto_575644 ) ( not ( = ?auto_575646 ?auto_575643 ) ) ( SURFACE-AT ?auto_575639 ?auto_575644 ) ( ON ?auto_575639 ?auto_575642 ) ( CLEAR ?auto_575639 ) ( not ( = ?auto_575638 ?auto_575642 ) ) ( not ( = ?auto_575639 ?auto_575642 ) ) ( not ( = ?auto_575637 ?auto_575642 ) ) ( SURFACE-AT ?auto_575637 ?auto_575640 ) ( CLEAR ?auto_575637 ) ( IS-CRATE ?auto_575638 ) ( AVAILABLE ?auto_575646 ) ( AVAILABLE ?auto_575643 ) ( SURFACE-AT ?auto_575638 ?auto_575644 ) ( ON ?auto_575638 ?auto_575641 ) ( CLEAR ?auto_575638 ) ( not ( = ?auto_575638 ?auto_575641 ) ) ( not ( = ?auto_575639 ?auto_575641 ) ) ( not ( = ?auto_575637 ?auto_575641 ) ) ( not ( = ?auto_575642 ?auto_575641 ) ) ( TRUCK-AT ?auto_575645 ?auto_575640 ) ( ON ?auto_575633 ?auto_575632 ) ( ON ?auto_575634 ?auto_575633 ) ( ON ?auto_575636 ?auto_575634 ) ( ON ?auto_575635 ?auto_575636 ) ( ON ?auto_575637 ?auto_575635 ) ( not ( = ?auto_575632 ?auto_575633 ) ) ( not ( = ?auto_575632 ?auto_575634 ) ) ( not ( = ?auto_575632 ?auto_575636 ) ) ( not ( = ?auto_575632 ?auto_575635 ) ) ( not ( = ?auto_575632 ?auto_575637 ) ) ( not ( = ?auto_575632 ?auto_575638 ) ) ( not ( = ?auto_575632 ?auto_575639 ) ) ( not ( = ?auto_575632 ?auto_575642 ) ) ( not ( = ?auto_575632 ?auto_575641 ) ) ( not ( = ?auto_575633 ?auto_575634 ) ) ( not ( = ?auto_575633 ?auto_575636 ) ) ( not ( = ?auto_575633 ?auto_575635 ) ) ( not ( = ?auto_575633 ?auto_575637 ) ) ( not ( = ?auto_575633 ?auto_575638 ) ) ( not ( = ?auto_575633 ?auto_575639 ) ) ( not ( = ?auto_575633 ?auto_575642 ) ) ( not ( = ?auto_575633 ?auto_575641 ) ) ( not ( = ?auto_575634 ?auto_575636 ) ) ( not ( = ?auto_575634 ?auto_575635 ) ) ( not ( = ?auto_575634 ?auto_575637 ) ) ( not ( = ?auto_575634 ?auto_575638 ) ) ( not ( = ?auto_575634 ?auto_575639 ) ) ( not ( = ?auto_575634 ?auto_575642 ) ) ( not ( = ?auto_575634 ?auto_575641 ) ) ( not ( = ?auto_575636 ?auto_575635 ) ) ( not ( = ?auto_575636 ?auto_575637 ) ) ( not ( = ?auto_575636 ?auto_575638 ) ) ( not ( = ?auto_575636 ?auto_575639 ) ) ( not ( = ?auto_575636 ?auto_575642 ) ) ( not ( = ?auto_575636 ?auto_575641 ) ) ( not ( = ?auto_575635 ?auto_575637 ) ) ( not ( = ?auto_575635 ?auto_575638 ) ) ( not ( = ?auto_575635 ?auto_575639 ) ) ( not ( = ?auto_575635 ?auto_575642 ) ) ( not ( = ?auto_575635 ?auto_575641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575637 ?auto_575638 ?auto_575639 )
      ( MAKE-7CRATE-VERIFY ?auto_575632 ?auto_575633 ?auto_575634 ?auto_575636 ?auto_575635 ?auto_575637 ?auto_575638 ?auto_575639 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_575647 - SURFACE
      ?auto_575648 - SURFACE
      ?auto_575649 - SURFACE
      ?auto_575651 - SURFACE
      ?auto_575650 - SURFACE
      ?auto_575652 - SURFACE
      ?auto_575653 - SURFACE
      ?auto_575654 - SURFACE
      ?auto_575655 - SURFACE
    )
    :vars
    (
      ?auto_575662 - HOIST
      ?auto_575656 - PLACE
      ?auto_575660 - PLACE
      ?auto_575659 - HOIST
      ?auto_575658 - SURFACE
      ?auto_575657 - SURFACE
      ?auto_575661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575662 ?auto_575656 ) ( IS-CRATE ?auto_575655 ) ( not ( = ?auto_575654 ?auto_575655 ) ) ( not ( = ?auto_575653 ?auto_575654 ) ) ( not ( = ?auto_575653 ?auto_575655 ) ) ( not ( = ?auto_575660 ?auto_575656 ) ) ( HOIST-AT ?auto_575659 ?auto_575660 ) ( not ( = ?auto_575662 ?auto_575659 ) ) ( SURFACE-AT ?auto_575655 ?auto_575660 ) ( ON ?auto_575655 ?auto_575658 ) ( CLEAR ?auto_575655 ) ( not ( = ?auto_575654 ?auto_575658 ) ) ( not ( = ?auto_575655 ?auto_575658 ) ) ( not ( = ?auto_575653 ?auto_575658 ) ) ( SURFACE-AT ?auto_575653 ?auto_575656 ) ( CLEAR ?auto_575653 ) ( IS-CRATE ?auto_575654 ) ( AVAILABLE ?auto_575662 ) ( AVAILABLE ?auto_575659 ) ( SURFACE-AT ?auto_575654 ?auto_575660 ) ( ON ?auto_575654 ?auto_575657 ) ( CLEAR ?auto_575654 ) ( not ( = ?auto_575654 ?auto_575657 ) ) ( not ( = ?auto_575655 ?auto_575657 ) ) ( not ( = ?auto_575653 ?auto_575657 ) ) ( not ( = ?auto_575658 ?auto_575657 ) ) ( TRUCK-AT ?auto_575661 ?auto_575656 ) ( ON ?auto_575648 ?auto_575647 ) ( ON ?auto_575649 ?auto_575648 ) ( ON ?auto_575651 ?auto_575649 ) ( ON ?auto_575650 ?auto_575651 ) ( ON ?auto_575652 ?auto_575650 ) ( ON ?auto_575653 ?auto_575652 ) ( not ( = ?auto_575647 ?auto_575648 ) ) ( not ( = ?auto_575647 ?auto_575649 ) ) ( not ( = ?auto_575647 ?auto_575651 ) ) ( not ( = ?auto_575647 ?auto_575650 ) ) ( not ( = ?auto_575647 ?auto_575652 ) ) ( not ( = ?auto_575647 ?auto_575653 ) ) ( not ( = ?auto_575647 ?auto_575654 ) ) ( not ( = ?auto_575647 ?auto_575655 ) ) ( not ( = ?auto_575647 ?auto_575658 ) ) ( not ( = ?auto_575647 ?auto_575657 ) ) ( not ( = ?auto_575648 ?auto_575649 ) ) ( not ( = ?auto_575648 ?auto_575651 ) ) ( not ( = ?auto_575648 ?auto_575650 ) ) ( not ( = ?auto_575648 ?auto_575652 ) ) ( not ( = ?auto_575648 ?auto_575653 ) ) ( not ( = ?auto_575648 ?auto_575654 ) ) ( not ( = ?auto_575648 ?auto_575655 ) ) ( not ( = ?auto_575648 ?auto_575658 ) ) ( not ( = ?auto_575648 ?auto_575657 ) ) ( not ( = ?auto_575649 ?auto_575651 ) ) ( not ( = ?auto_575649 ?auto_575650 ) ) ( not ( = ?auto_575649 ?auto_575652 ) ) ( not ( = ?auto_575649 ?auto_575653 ) ) ( not ( = ?auto_575649 ?auto_575654 ) ) ( not ( = ?auto_575649 ?auto_575655 ) ) ( not ( = ?auto_575649 ?auto_575658 ) ) ( not ( = ?auto_575649 ?auto_575657 ) ) ( not ( = ?auto_575651 ?auto_575650 ) ) ( not ( = ?auto_575651 ?auto_575652 ) ) ( not ( = ?auto_575651 ?auto_575653 ) ) ( not ( = ?auto_575651 ?auto_575654 ) ) ( not ( = ?auto_575651 ?auto_575655 ) ) ( not ( = ?auto_575651 ?auto_575658 ) ) ( not ( = ?auto_575651 ?auto_575657 ) ) ( not ( = ?auto_575650 ?auto_575652 ) ) ( not ( = ?auto_575650 ?auto_575653 ) ) ( not ( = ?auto_575650 ?auto_575654 ) ) ( not ( = ?auto_575650 ?auto_575655 ) ) ( not ( = ?auto_575650 ?auto_575658 ) ) ( not ( = ?auto_575650 ?auto_575657 ) ) ( not ( = ?auto_575652 ?auto_575653 ) ) ( not ( = ?auto_575652 ?auto_575654 ) ) ( not ( = ?auto_575652 ?auto_575655 ) ) ( not ( = ?auto_575652 ?auto_575658 ) ) ( not ( = ?auto_575652 ?auto_575657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575653 ?auto_575654 ?auto_575655 )
      ( MAKE-8CRATE-VERIFY ?auto_575647 ?auto_575648 ?auto_575649 ?auto_575651 ?auto_575650 ?auto_575652 ?auto_575653 ?auto_575654 ?auto_575655 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_575663 - SURFACE
      ?auto_575664 - SURFACE
      ?auto_575665 - SURFACE
      ?auto_575667 - SURFACE
      ?auto_575666 - SURFACE
      ?auto_575668 - SURFACE
      ?auto_575669 - SURFACE
      ?auto_575670 - SURFACE
      ?auto_575671 - SURFACE
      ?auto_575672 - SURFACE
    )
    :vars
    (
      ?auto_575679 - HOIST
      ?auto_575673 - PLACE
      ?auto_575677 - PLACE
      ?auto_575676 - HOIST
      ?auto_575675 - SURFACE
      ?auto_575674 - SURFACE
      ?auto_575678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575679 ?auto_575673 ) ( IS-CRATE ?auto_575672 ) ( not ( = ?auto_575671 ?auto_575672 ) ) ( not ( = ?auto_575670 ?auto_575671 ) ) ( not ( = ?auto_575670 ?auto_575672 ) ) ( not ( = ?auto_575677 ?auto_575673 ) ) ( HOIST-AT ?auto_575676 ?auto_575677 ) ( not ( = ?auto_575679 ?auto_575676 ) ) ( SURFACE-AT ?auto_575672 ?auto_575677 ) ( ON ?auto_575672 ?auto_575675 ) ( CLEAR ?auto_575672 ) ( not ( = ?auto_575671 ?auto_575675 ) ) ( not ( = ?auto_575672 ?auto_575675 ) ) ( not ( = ?auto_575670 ?auto_575675 ) ) ( SURFACE-AT ?auto_575670 ?auto_575673 ) ( CLEAR ?auto_575670 ) ( IS-CRATE ?auto_575671 ) ( AVAILABLE ?auto_575679 ) ( AVAILABLE ?auto_575676 ) ( SURFACE-AT ?auto_575671 ?auto_575677 ) ( ON ?auto_575671 ?auto_575674 ) ( CLEAR ?auto_575671 ) ( not ( = ?auto_575671 ?auto_575674 ) ) ( not ( = ?auto_575672 ?auto_575674 ) ) ( not ( = ?auto_575670 ?auto_575674 ) ) ( not ( = ?auto_575675 ?auto_575674 ) ) ( TRUCK-AT ?auto_575678 ?auto_575673 ) ( ON ?auto_575664 ?auto_575663 ) ( ON ?auto_575665 ?auto_575664 ) ( ON ?auto_575667 ?auto_575665 ) ( ON ?auto_575666 ?auto_575667 ) ( ON ?auto_575668 ?auto_575666 ) ( ON ?auto_575669 ?auto_575668 ) ( ON ?auto_575670 ?auto_575669 ) ( not ( = ?auto_575663 ?auto_575664 ) ) ( not ( = ?auto_575663 ?auto_575665 ) ) ( not ( = ?auto_575663 ?auto_575667 ) ) ( not ( = ?auto_575663 ?auto_575666 ) ) ( not ( = ?auto_575663 ?auto_575668 ) ) ( not ( = ?auto_575663 ?auto_575669 ) ) ( not ( = ?auto_575663 ?auto_575670 ) ) ( not ( = ?auto_575663 ?auto_575671 ) ) ( not ( = ?auto_575663 ?auto_575672 ) ) ( not ( = ?auto_575663 ?auto_575675 ) ) ( not ( = ?auto_575663 ?auto_575674 ) ) ( not ( = ?auto_575664 ?auto_575665 ) ) ( not ( = ?auto_575664 ?auto_575667 ) ) ( not ( = ?auto_575664 ?auto_575666 ) ) ( not ( = ?auto_575664 ?auto_575668 ) ) ( not ( = ?auto_575664 ?auto_575669 ) ) ( not ( = ?auto_575664 ?auto_575670 ) ) ( not ( = ?auto_575664 ?auto_575671 ) ) ( not ( = ?auto_575664 ?auto_575672 ) ) ( not ( = ?auto_575664 ?auto_575675 ) ) ( not ( = ?auto_575664 ?auto_575674 ) ) ( not ( = ?auto_575665 ?auto_575667 ) ) ( not ( = ?auto_575665 ?auto_575666 ) ) ( not ( = ?auto_575665 ?auto_575668 ) ) ( not ( = ?auto_575665 ?auto_575669 ) ) ( not ( = ?auto_575665 ?auto_575670 ) ) ( not ( = ?auto_575665 ?auto_575671 ) ) ( not ( = ?auto_575665 ?auto_575672 ) ) ( not ( = ?auto_575665 ?auto_575675 ) ) ( not ( = ?auto_575665 ?auto_575674 ) ) ( not ( = ?auto_575667 ?auto_575666 ) ) ( not ( = ?auto_575667 ?auto_575668 ) ) ( not ( = ?auto_575667 ?auto_575669 ) ) ( not ( = ?auto_575667 ?auto_575670 ) ) ( not ( = ?auto_575667 ?auto_575671 ) ) ( not ( = ?auto_575667 ?auto_575672 ) ) ( not ( = ?auto_575667 ?auto_575675 ) ) ( not ( = ?auto_575667 ?auto_575674 ) ) ( not ( = ?auto_575666 ?auto_575668 ) ) ( not ( = ?auto_575666 ?auto_575669 ) ) ( not ( = ?auto_575666 ?auto_575670 ) ) ( not ( = ?auto_575666 ?auto_575671 ) ) ( not ( = ?auto_575666 ?auto_575672 ) ) ( not ( = ?auto_575666 ?auto_575675 ) ) ( not ( = ?auto_575666 ?auto_575674 ) ) ( not ( = ?auto_575668 ?auto_575669 ) ) ( not ( = ?auto_575668 ?auto_575670 ) ) ( not ( = ?auto_575668 ?auto_575671 ) ) ( not ( = ?auto_575668 ?auto_575672 ) ) ( not ( = ?auto_575668 ?auto_575675 ) ) ( not ( = ?auto_575668 ?auto_575674 ) ) ( not ( = ?auto_575669 ?auto_575670 ) ) ( not ( = ?auto_575669 ?auto_575671 ) ) ( not ( = ?auto_575669 ?auto_575672 ) ) ( not ( = ?auto_575669 ?auto_575675 ) ) ( not ( = ?auto_575669 ?auto_575674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575670 ?auto_575671 ?auto_575672 )
      ( MAKE-9CRATE-VERIFY ?auto_575663 ?auto_575664 ?auto_575665 ?auto_575667 ?auto_575666 ?auto_575668 ?auto_575669 ?auto_575670 ?auto_575671 ?auto_575672 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575680 - SURFACE
      ?auto_575681 - SURFACE
      ?auto_575682 - SURFACE
      ?auto_575684 - SURFACE
      ?auto_575683 - SURFACE
      ?auto_575685 - SURFACE
      ?auto_575686 - SURFACE
      ?auto_575687 - SURFACE
      ?auto_575688 - SURFACE
      ?auto_575689 - SURFACE
      ?auto_575690 - SURFACE
    )
    :vars
    (
      ?auto_575697 - HOIST
      ?auto_575691 - PLACE
      ?auto_575695 - PLACE
      ?auto_575694 - HOIST
      ?auto_575693 - SURFACE
      ?auto_575692 - SURFACE
      ?auto_575696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575697 ?auto_575691 ) ( IS-CRATE ?auto_575690 ) ( not ( = ?auto_575689 ?auto_575690 ) ) ( not ( = ?auto_575688 ?auto_575689 ) ) ( not ( = ?auto_575688 ?auto_575690 ) ) ( not ( = ?auto_575695 ?auto_575691 ) ) ( HOIST-AT ?auto_575694 ?auto_575695 ) ( not ( = ?auto_575697 ?auto_575694 ) ) ( SURFACE-AT ?auto_575690 ?auto_575695 ) ( ON ?auto_575690 ?auto_575693 ) ( CLEAR ?auto_575690 ) ( not ( = ?auto_575689 ?auto_575693 ) ) ( not ( = ?auto_575690 ?auto_575693 ) ) ( not ( = ?auto_575688 ?auto_575693 ) ) ( SURFACE-AT ?auto_575688 ?auto_575691 ) ( CLEAR ?auto_575688 ) ( IS-CRATE ?auto_575689 ) ( AVAILABLE ?auto_575697 ) ( AVAILABLE ?auto_575694 ) ( SURFACE-AT ?auto_575689 ?auto_575695 ) ( ON ?auto_575689 ?auto_575692 ) ( CLEAR ?auto_575689 ) ( not ( = ?auto_575689 ?auto_575692 ) ) ( not ( = ?auto_575690 ?auto_575692 ) ) ( not ( = ?auto_575688 ?auto_575692 ) ) ( not ( = ?auto_575693 ?auto_575692 ) ) ( TRUCK-AT ?auto_575696 ?auto_575691 ) ( ON ?auto_575681 ?auto_575680 ) ( ON ?auto_575682 ?auto_575681 ) ( ON ?auto_575684 ?auto_575682 ) ( ON ?auto_575683 ?auto_575684 ) ( ON ?auto_575685 ?auto_575683 ) ( ON ?auto_575686 ?auto_575685 ) ( ON ?auto_575687 ?auto_575686 ) ( ON ?auto_575688 ?auto_575687 ) ( not ( = ?auto_575680 ?auto_575681 ) ) ( not ( = ?auto_575680 ?auto_575682 ) ) ( not ( = ?auto_575680 ?auto_575684 ) ) ( not ( = ?auto_575680 ?auto_575683 ) ) ( not ( = ?auto_575680 ?auto_575685 ) ) ( not ( = ?auto_575680 ?auto_575686 ) ) ( not ( = ?auto_575680 ?auto_575687 ) ) ( not ( = ?auto_575680 ?auto_575688 ) ) ( not ( = ?auto_575680 ?auto_575689 ) ) ( not ( = ?auto_575680 ?auto_575690 ) ) ( not ( = ?auto_575680 ?auto_575693 ) ) ( not ( = ?auto_575680 ?auto_575692 ) ) ( not ( = ?auto_575681 ?auto_575682 ) ) ( not ( = ?auto_575681 ?auto_575684 ) ) ( not ( = ?auto_575681 ?auto_575683 ) ) ( not ( = ?auto_575681 ?auto_575685 ) ) ( not ( = ?auto_575681 ?auto_575686 ) ) ( not ( = ?auto_575681 ?auto_575687 ) ) ( not ( = ?auto_575681 ?auto_575688 ) ) ( not ( = ?auto_575681 ?auto_575689 ) ) ( not ( = ?auto_575681 ?auto_575690 ) ) ( not ( = ?auto_575681 ?auto_575693 ) ) ( not ( = ?auto_575681 ?auto_575692 ) ) ( not ( = ?auto_575682 ?auto_575684 ) ) ( not ( = ?auto_575682 ?auto_575683 ) ) ( not ( = ?auto_575682 ?auto_575685 ) ) ( not ( = ?auto_575682 ?auto_575686 ) ) ( not ( = ?auto_575682 ?auto_575687 ) ) ( not ( = ?auto_575682 ?auto_575688 ) ) ( not ( = ?auto_575682 ?auto_575689 ) ) ( not ( = ?auto_575682 ?auto_575690 ) ) ( not ( = ?auto_575682 ?auto_575693 ) ) ( not ( = ?auto_575682 ?auto_575692 ) ) ( not ( = ?auto_575684 ?auto_575683 ) ) ( not ( = ?auto_575684 ?auto_575685 ) ) ( not ( = ?auto_575684 ?auto_575686 ) ) ( not ( = ?auto_575684 ?auto_575687 ) ) ( not ( = ?auto_575684 ?auto_575688 ) ) ( not ( = ?auto_575684 ?auto_575689 ) ) ( not ( = ?auto_575684 ?auto_575690 ) ) ( not ( = ?auto_575684 ?auto_575693 ) ) ( not ( = ?auto_575684 ?auto_575692 ) ) ( not ( = ?auto_575683 ?auto_575685 ) ) ( not ( = ?auto_575683 ?auto_575686 ) ) ( not ( = ?auto_575683 ?auto_575687 ) ) ( not ( = ?auto_575683 ?auto_575688 ) ) ( not ( = ?auto_575683 ?auto_575689 ) ) ( not ( = ?auto_575683 ?auto_575690 ) ) ( not ( = ?auto_575683 ?auto_575693 ) ) ( not ( = ?auto_575683 ?auto_575692 ) ) ( not ( = ?auto_575685 ?auto_575686 ) ) ( not ( = ?auto_575685 ?auto_575687 ) ) ( not ( = ?auto_575685 ?auto_575688 ) ) ( not ( = ?auto_575685 ?auto_575689 ) ) ( not ( = ?auto_575685 ?auto_575690 ) ) ( not ( = ?auto_575685 ?auto_575693 ) ) ( not ( = ?auto_575685 ?auto_575692 ) ) ( not ( = ?auto_575686 ?auto_575687 ) ) ( not ( = ?auto_575686 ?auto_575688 ) ) ( not ( = ?auto_575686 ?auto_575689 ) ) ( not ( = ?auto_575686 ?auto_575690 ) ) ( not ( = ?auto_575686 ?auto_575693 ) ) ( not ( = ?auto_575686 ?auto_575692 ) ) ( not ( = ?auto_575687 ?auto_575688 ) ) ( not ( = ?auto_575687 ?auto_575689 ) ) ( not ( = ?auto_575687 ?auto_575690 ) ) ( not ( = ?auto_575687 ?auto_575693 ) ) ( not ( = ?auto_575687 ?auto_575692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575688 ?auto_575689 ?auto_575690 )
      ( MAKE-10CRATE-VERIFY ?auto_575680 ?auto_575681 ?auto_575682 ?auto_575684 ?auto_575683 ?auto_575685 ?auto_575686 ?auto_575687 ?auto_575688 ?auto_575689 ?auto_575690 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_575698 - SURFACE
      ?auto_575699 - SURFACE
    )
    :vars
    (
      ?auto_575707 - HOIST
      ?auto_575700 - PLACE
      ?auto_575706 - SURFACE
      ?auto_575704 - PLACE
      ?auto_575703 - HOIST
      ?auto_575702 - SURFACE
      ?auto_575701 - SURFACE
      ?auto_575705 - TRUCK
      ?auto_575708 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575707 ?auto_575700 ) ( IS-CRATE ?auto_575699 ) ( not ( = ?auto_575698 ?auto_575699 ) ) ( not ( = ?auto_575706 ?auto_575698 ) ) ( not ( = ?auto_575706 ?auto_575699 ) ) ( not ( = ?auto_575704 ?auto_575700 ) ) ( HOIST-AT ?auto_575703 ?auto_575704 ) ( not ( = ?auto_575707 ?auto_575703 ) ) ( SURFACE-AT ?auto_575699 ?auto_575704 ) ( ON ?auto_575699 ?auto_575702 ) ( CLEAR ?auto_575699 ) ( not ( = ?auto_575698 ?auto_575702 ) ) ( not ( = ?auto_575699 ?auto_575702 ) ) ( not ( = ?auto_575706 ?auto_575702 ) ) ( IS-CRATE ?auto_575698 ) ( AVAILABLE ?auto_575703 ) ( SURFACE-AT ?auto_575698 ?auto_575704 ) ( ON ?auto_575698 ?auto_575701 ) ( CLEAR ?auto_575698 ) ( not ( = ?auto_575698 ?auto_575701 ) ) ( not ( = ?auto_575699 ?auto_575701 ) ) ( not ( = ?auto_575706 ?auto_575701 ) ) ( not ( = ?auto_575702 ?auto_575701 ) ) ( TRUCK-AT ?auto_575705 ?auto_575700 ) ( SURFACE-AT ?auto_575708 ?auto_575700 ) ( CLEAR ?auto_575708 ) ( LIFTING ?auto_575707 ?auto_575706 ) ( IS-CRATE ?auto_575706 ) ( not ( = ?auto_575708 ?auto_575706 ) ) ( not ( = ?auto_575698 ?auto_575708 ) ) ( not ( = ?auto_575699 ?auto_575708 ) ) ( not ( = ?auto_575702 ?auto_575708 ) ) ( not ( = ?auto_575701 ?auto_575708 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_575708 ?auto_575706 )
      ( MAKE-2CRATE ?auto_575706 ?auto_575698 ?auto_575699 )
      ( MAKE-1CRATE-VERIFY ?auto_575698 ?auto_575699 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_575709 - SURFACE
      ?auto_575710 - SURFACE
      ?auto_575711 - SURFACE
    )
    :vars
    (
      ?auto_575712 - HOIST
      ?auto_575718 - PLACE
      ?auto_575714 - PLACE
      ?auto_575715 - HOIST
      ?auto_575716 - SURFACE
      ?auto_575719 - SURFACE
      ?auto_575713 - TRUCK
      ?auto_575717 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575712 ?auto_575718 ) ( IS-CRATE ?auto_575711 ) ( not ( = ?auto_575710 ?auto_575711 ) ) ( not ( = ?auto_575709 ?auto_575710 ) ) ( not ( = ?auto_575709 ?auto_575711 ) ) ( not ( = ?auto_575714 ?auto_575718 ) ) ( HOIST-AT ?auto_575715 ?auto_575714 ) ( not ( = ?auto_575712 ?auto_575715 ) ) ( SURFACE-AT ?auto_575711 ?auto_575714 ) ( ON ?auto_575711 ?auto_575716 ) ( CLEAR ?auto_575711 ) ( not ( = ?auto_575710 ?auto_575716 ) ) ( not ( = ?auto_575711 ?auto_575716 ) ) ( not ( = ?auto_575709 ?auto_575716 ) ) ( IS-CRATE ?auto_575710 ) ( AVAILABLE ?auto_575715 ) ( SURFACE-AT ?auto_575710 ?auto_575714 ) ( ON ?auto_575710 ?auto_575719 ) ( CLEAR ?auto_575710 ) ( not ( = ?auto_575710 ?auto_575719 ) ) ( not ( = ?auto_575711 ?auto_575719 ) ) ( not ( = ?auto_575709 ?auto_575719 ) ) ( not ( = ?auto_575716 ?auto_575719 ) ) ( TRUCK-AT ?auto_575713 ?auto_575718 ) ( SURFACE-AT ?auto_575717 ?auto_575718 ) ( CLEAR ?auto_575717 ) ( LIFTING ?auto_575712 ?auto_575709 ) ( IS-CRATE ?auto_575709 ) ( not ( = ?auto_575717 ?auto_575709 ) ) ( not ( = ?auto_575710 ?auto_575717 ) ) ( not ( = ?auto_575711 ?auto_575717 ) ) ( not ( = ?auto_575716 ?auto_575717 ) ) ( not ( = ?auto_575719 ?auto_575717 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_575710 ?auto_575711 )
      ( MAKE-2CRATE-VERIFY ?auto_575709 ?auto_575710 ?auto_575711 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_575720 - SURFACE
      ?auto_575721 - SURFACE
      ?auto_575722 - SURFACE
      ?auto_575723 - SURFACE
    )
    :vars
    (
      ?auto_575727 - HOIST
      ?auto_575728 - PLACE
      ?auto_575730 - PLACE
      ?auto_575726 - HOIST
      ?auto_575725 - SURFACE
      ?auto_575724 - SURFACE
      ?auto_575729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575727 ?auto_575728 ) ( IS-CRATE ?auto_575723 ) ( not ( = ?auto_575722 ?auto_575723 ) ) ( not ( = ?auto_575721 ?auto_575722 ) ) ( not ( = ?auto_575721 ?auto_575723 ) ) ( not ( = ?auto_575730 ?auto_575728 ) ) ( HOIST-AT ?auto_575726 ?auto_575730 ) ( not ( = ?auto_575727 ?auto_575726 ) ) ( SURFACE-AT ?auto_575723 ?auto_575730 ) ( ON ?auto_575723 ?auto_575725 ) ( CLEAR ?auto_575723 ) ( not ( = ?auto_575722 ?auto_575725 ) ) ( not ( = ?auto_575723 ?auto_575725 ) ) ( not ( = ?auto_575721 ?auto_575725 ) ) ( IS-CRATE ?auto_575722 ) ( AVAILABLE ?auto_575726 ) ( SURFACE-AT ?auto_575722 ?auto_575730 ) ( ON ?auto_575722 ?auto_575724 ) ( CLEAR ?auto_575722 ) ( not ( = ?auto_575722 ?auto_575724 ) ) ( not ( = ?auto_575723 ?auto_575724 ) ) ( not ( = ?auto_575721 ?auto_575724 ) ) ( not ( = ?auto_575725 ?auto_575724 ) ) ( TRUCK-AT ?auto_575729 ?auto_575728 ) ( SURFACE-AT ?auto_575720 ?auto_575728 ) ( CLEAR ?auto_575720 ) ( LIFTING ?auto_575727 ?auto_575721 ) ( IS-CRATE ?auto_575721 ) ( not ( = ?auto_575720 ?auto_575721 ) ) ( not ( = ?auto_575722 ?auto_575720 ) ) ( not ( = ?auto_575723 ?auto_575720 ) ) ( not ( = ?auto_575725 ?auto_575720 ) ) ( not ( = ?auto_575724 ?auto_575720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575721 ?auto_575722 ?auto_575723 )
      ( MAKE-3CRATE-VERIFY ?auto_575720 ?auto_575721 ?auto_575722 ?auto_575723 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_575731 - SURFACE
      ?auto_575732 - SURFACE
      ?auto_575733 - SURFACE
      ?auto_575735 - SURFACE
      ?auto_575734 - SURFACE
    )
    :vars
    (
      ?auto_575739 - HOIST
      ?auto_575740 - PLACE
      ?auto_575742 - PLACE
      ?auto_575738 - HOIST
      ?auto_575737 - SURFACE
      ?auto_575736 - SURFACE
      ?auto_575741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575739 ?auto_575740 ) ( IS-CRATE ?auto_575734 ) ( not ( = ?auto_575735 ?auto_575734 ) ) ( not ( = ?auto_575733 ?auto_575735 ) ) ( not ( = ?auto_575733 ?auto_575734 ) ) ( not ( = ?auto_575742 ?auto_575740 ) ) ( HOIST-AT ?auto_575738 ?auto_575742 ) ( not ( = ?auto_575739 ?auto_575738 ) ) ( SURFACE-AT ?auto_575734 ?auto_575742 ) ( ON ?auto_575734 ?auto_575737 ) ( CLEAR ?auto_575734 ) ( not ( = ?auto_575735 ?auto_575737 ) ) ( not ( = ?auto_575734 ?auto_575737 ) ) ( not ( = ?auto_575733 ?auto_575737 ) ) ( IS-CRATE ?auto_575735 ) ( AVAILABLE ?auto_575738 ) ( SURFACE-AT ?auto_575735 ?auto_575742 ) ( ON ?auto_575735 ?auto_575736 ) ( CLEAR ?auto_575735 ) ( not ( = ?auto_575735 ?auto_575736 ) ) ( not ( = ?auto_575734 ?auto_575736 ) ) ( not ( = ?auto_575733 ?auto_575736 ) ) ( not ( = ?auto_575737 ?auto_575736 ) ) ( TRUCK-AT ?auto_575741 ?auto_575740 ) ( SURFACE-AT ?auto_575732 ?auto_575740 ) ( CLEAR ?auto_575732 ) ( LIFTING ?auto_575739 ?auto_575733 ) ( IS-CRATE ?auto_575733 ) ( not ( = ?auto_575732 ?auto_575733 ) ) ( not ( = ?auto_575735 ?auto_575732 ) ) ( not ( = ?auto_575734 ?auto_575732 ) ) ( not ( = ?auto_575737 ?auto_575732 ) ) ( not ( = ?auto_575736 ?auto_575732 ) ) ( ON ?auto_575732 ?auto_575731 ) ( not ( = ?auto_575731 ?auto_575732 ) ) ( not ( = ?auto_575731 ?auto_575733 ) ) ( not ( = ?auto_575731 ?auto_575735 ) ) ( not ( = ?auto_575731 ?auto_575734 ) ) ( not ( = ?auto_575731 ?auto_575737 ) ) ( not ( = ?auto_575731 ?auto_575736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575733 ?auto_575735 ?auto_575734 )
      ( MAKE-4CRATE-VERIFY ?auto_575731 ?auto_575732 ?auto_575733 ?auto_575735 ?auto_575734 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_575743 - SURFACE
      ?auto_575744 - SURFACE
      ?auto_575745 - SURFACE
      ?auto_575747 - SURFACE
      ?auto_575746 - SURFACE
      ?auto_575748 - SURFACE
    )
    :vars
    (
      ?auto_575752 - HOIST
      ?auto_575753 - PLACE
      ?auto_575755 - PLACE
      ?auto_575751 - HOIST
      ?auto_575750 - SURFACE
      ?auto_575749 - SURFACE
      ?auto_575754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575752 ?auto_575753 ) ( IS-CRATE ?auto_575748 ) ( not ( = ?auto_575746 ?auto_575748 ) ) ( not ( = ?auto_575747 ?auto_575746 ) ) ( not ( = ?auto_575747 ?auto_575748 ) ) ( not ( = ?auto_575755 ?auto_575753 ) ) ( HOIST-AT ?auto_575751 ?auto_575755 ) ( not ( = ?auto_575752 ?auto_575751 ) ) ( SURFACE-AT ?auto_575748 ?auto_575755 ) ( ON ?auto_575748 ?auto_575750 ) ( CLEAR ?auto_575748 ) ( not ( = ?auto_575746 ?auto_575750 ) ) ( not ( = ?auto_575748 ?auto_575750 ) ) ( not ( = ?auto_575747 ?auto_575750 ) ) ( IS-CRATE ?auto_575746 ) ( AVAILABLE ?auto_575751 ) ( SURFACE-AT ?auto_575746 ?auto_575755 ) ( ON ?auto_575746 ?auto_575749 ) ( CLEAR ?auto_575746 ) ( not ( = ?auto_575746 ?auto_575749 ) ) ( not ( = ?auto_575748 ?auto_575749 ) ) ( not ( = ?auto_575747 ?auto_575749 ) ) ( not ( = ?auto_575750 ?auto_575749 ) ) ( TRUCK-AT ?auto_575754 ?auto_575753 ) ( SURFACE-AT ?auto_575745 ?auto_575753 ) ( CLEAR ?auto_575745 ) ( LIFTING ?auto_575752 ?auto_575747 ) ( IS-CRATE ?auto_575747 ) ( not ( = ?auto_575745 ?auto_575747 ) ) ( not ( = ?auto_575746 ?auto_575745 ) ) ( not ( = ?auto_575748 ?auto_575745 ) ) ( not ( = ?auto_575750 ?auto_575745 ) ) ( not ( = ?auto_575749 ?auto_575745 ) ) ( ON ?auto_575744 ?auto_575743 ) ( ON ?auto_575745 ?auto_575744 ) ( not ( = ?auto_575743 ?auto_575744 ) ) ( not ( = ?auto_575743 ?auto_575745 ) ) ( not ( = ?auto_575743 ?auto_575747 ) ) ( not ( = ?auto_575743 ?auto_575746 ) ) ( not ( = ?auto_575743 ?auto_575748 ) ) ( not ( = ?auto_575743 ?auto_575750 ) ) ( not ( = ?auto_575743 ?auto_575749 ) ) ( not ( = ?auto_575744 ?auto_575745 ) ) ( not ( = ?auto_575744 ?auto_575747 ) ) ( not ( = ?auto_575744 ?auto_575746 ) ) ( not ( = ?auto_575744 ?auto_575748 ) ) ( not ( = ?auto_575744 ?auto_575750 ) ) ( not ( = ?auto_575744 ?auto_575749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575747 ?auto_575746 ?auto_575748 )
      ( MAKE-5CRATE-VERIFY ?auto_575743 ?auto_575744 ?auto_575745 ?auto_575747 ?auto_575746 ?auto_575748 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_575756 - SURFACE
      ?auto_575757 - SURFACE
      ?auto_575758 - SURFACE
      ?auto_575760 - SURFACE
      ?auto_575759 - SURFACE
      ?auto_575761 - SURFACE
      ?auto_575762 - SURFACE
    )
    :vars
    (
      ?auto_575766 - HOIST
      ?auto_575767 - PLACE
      ?auto_575769 - PLACE
      ?auto_575765 - HOIST
      ?auto_575764 - SURFACE
      ?auto_575763 - SURFACE
      ?auto_575768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575766 ?auto_575767 ) ( IS-CRATE ?auto_575762 ) ( not ( = ?auto_575761 ?auto_575762 ) ) ( not ( = ?auto_575759 ?auto_575761 ) ) ( not ( = ?auto_575759 ?auto_575762 ) ) ( not ( = ?auto_575769 ?auto_575767 ) ) ( HOIST-AT ?auto_575765 ?auto_575769 ) ( not ( = ?auto_575766 ?auto_575765 ) ) ( SURFACE-AT ?auto_575762 ?auto_575769 ) ( ON ?auto_575762 ?auto_575764 ) ( CLEAR ?auto_575762 ) ( not ( = ?auto_575761 ?auto_575764 ) ) ( not ( = ?auto_575762 ?auto_575764 ) ) ( not ( = ?auto_575759 ?auto_575764 ) ) ( IS-CRATE ?auto_575761 ) ( AVAILABLE ?auto_575765 ) ( SURFACE-AT ?auto_575761 ?auto_575769 ) ( ON ?auto_575761 ?auto_575763 ) ( CLEAR ?auto_575761 ) ( not ( = ?auto_575761 ?auto_575763 ) ) ( not ( = ?auto_575762 ?auto_575763 ) ) ( not ( = ?auto_575759 ?auto_575763 ) ) ( not ( = ?auto_575764 ?auto_575763 ) ) ( TRUCK-AT ?auto_575768 ?auto_575767 ) ( SURFACE-AT ?auto_575760 ?auto_575767 ) ( CLEAR ?auto_575760 ) ( LIFTING ?auto_575766 ?auto_575759 ) ( IS-CRATE ?auto_575759 ) ( not ( = ?auto_575760 ?auto_575759 ) ) ( not ( = ?auto_575761 ?auto_575760 ) ) ( not ( = ?auto_575762 ?auto_575760 ) ) ( not ( = ?auto_575764 ?auto_575760 ) ) ( not ( = ?auto_575763 ?auto_575760 ) ) ( ON ?auto_575757 ?auto_575756 ) ( ON ?auto_575758 ?auto_575757 ) ( ON ?auto_575760 ?auto_575758 ) ( not ( = ?auto_575756 ?auto_575757 ) ) ( not ( = ?auto_575756 ?auto_575758 ) ) ( not ( = ?auto_575756 ?auto_575760 ) ) ( not ( = ?auto_575756 ?auto_575759 ) ) ( not ( = ?auto_575756 ?auto_575761 ) ) ( not ( = ?auto_575756 ?auto_575762 ) ) ( not ( = ?auto_575756 ?auto_575764 ) ) ( not ( = ?auto_575756 ?auto_575763 ) ) ( not ( = ?auto_575757 ?auto_575758 ) ) ( not ( = ?auto_575757 ?auto_575760 ) ) ( not ( = ?auto_575757 ?auto_575759 ) ) ( not ( = ?auto_575757 ?auto_575761 ) ) ( not ( = ?auto_575757 ?auto_575762 ) ) ( not ( = ?auto_575757 ?auto_575764 ) ) ( not ( = ?auto_575757 ?auto_575763 ) ) ( not ( = ?auto_575758 ?auto_575760 ) ) ( not ( = ?auto_575758 ?auto_575759 ) ) ( not ( = ?auto_575758 ?auto_575761 ) ) ( not ( = ?auto_575758 ?auto_575762 ) ) ( not ( = ?auto_575758 ?auto_575764 ) ) ( not ( = ?auto_575758 ?auto_575763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575759 ?auto_575761 ?auto_575762 )
      ( MAKE-6CRATE-VERIFY ?auto_575756 ?auto_575757 ?auto_575758 ?auto_575760 ?auto_575759 ?auto_575761 ?auto_575762 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_575770 - SURFACE
      ?auto_575771 - SURFACE
      ?auto_575772 - SURFACE
      ?auto_575774 - SURFACE
      ?auto_575773 - SURFACE
      ?auto_575775 - SURFACE
      ?auto_575776 - SURFACE
      ?auto_575777 - SURFACE
    )
    :vars
    (
      ?auto_575781 - HOIST
      ?auto_575782 - PLACE
      ?auto_575784 - PLACE
      ?auto_575780 - HOIST
      ?auto_575779 - SURFACE
      ?auto_575778 - SURFACE
      ?auto_575783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575781 ?auto_575782 ) ( IS-CRATE ?auto_575777 ) ( not ( = ?auto_575776 ?auto_575777 ) ) ( not ( = ?auto_575775 ?auto_575776 ) ) ( not ( = ?auto_575775 ?auto_575777 ) ) ( not ( = ?auto_575784 ?auto_575782 ) ) ( HOIST-AT ?auto_575780 ?auto_575784 ) ( not ( = ?auto_575781 ?auto_575780 ) ) ( SURFACE-AT ?auto_575777 ?auto_575784 ) ( ON ?auto_575777 ?auto_575779 ) ( CLEAR ?auto_575777 ) ( not ( = ?auto_575776 ?auto_575779 ) ) ( not ( = ?auto_575777 ?auto_575779 ) ) ( not ( = ?auto_575775 ?auto_575779 ) ) ( IS-CRATE ?auto_575776 ) ( AVAILABLE ?auto_575780 ) ( SURFACE-AT ?auto_575776 ?auto_575784 ) ( ON ?auto_575776 ?auto_575778 ) ( CLEAR ?auto_575776 ) ( not ( = ?auto_575776 ?auto_575778 ) ) ( not ( = ?auto_575777 ?auto_575778 ) ) ( not ( = ?auto_575775 ?auto_575778 ) ) ( not ( = ?auto_575779 ?auto_575778 ) ) ( TRUCK-AT ?auto_575783 ?auto_575782 ) ( SURFACE-AT ?auto_575773 ?auto_575782 ) ( CLEAR ?auto_575773 ) ( LIFTING ?auto_575781 ?auto_575775 ) ( IS-CRATE ?auto_575775 ) ( not ( = ?auto_575773 ?auto_575775 ) ) ( not ( = ?auto_575776 ?auto_575773 ) ) ( not ( = ?auto_575777 ?auto_575773 ) ) ( not ( = ?auto_575779 ?auto_575773 ) ) ( not ( = ?auto_575778 ?auto_575773 ) ) ( ON ?auto_575771 ?auto_575770 ) ( ON ?auto_575772 ?auto_575771 ) ( ON ?auto_575774 ?auto_575772 ) ( ON ?auto_575773 ?auto_575774 ) ( not ( = ?auto_575770 ?auto_575771 ) ) ( not ( = ?auto_575770 ?auto_575772 ) ) ( not ( = ?auto_575770 ?auto_575774 ) ) ( not ( = ?auto_575770 ?auto_575773 ) ) ( not ( = ?auto_575770 ?auto_575775 ) ) ( not ( = ?auto_575770 ?auto_575776 ) ) ( not ( = ?auto_575770 ?auto_575777 ) ) ( not ( = ?auto_575770 ?auto_575779 ) ) ( not ( = ?auto_575770 ?auto_575778 ) ) ( not ( = ?auto_575771 ?auto_575772 ) ) ( not ( = ?auto_575771 ?auto_575774 ) ) ( not ( = ?auto_575771 ?auto_575773 ) ) ( not ( = ?auto_575771 ?auto_575775 ) ) ( not ( = ?auto_575771 ?auto_575776 ) ) ( not ( = ?auto_575771 ?auto_575777 ) ) ( not ( = ?auto_575771 ?auto_575779 ) ) ( not ( = ?auto_575771 ?auto_575778 ) ) ( not ( = ?auto_575772 ?auto_575774 ) ) ( not ( = ?auto_575772 ?auto_575773 ) ) ( not ( = ?auto_575772 ?auto_575775 ) ) ( not ( = ?auto_575772 ?auto_575776 ) ) ( not ( = ?auto_575772 ?auto_575777 ) ) ( not ( = ?auto_575772 ?auto_575779 ) ) ( not ( = ?auto_575772 ?auto_575778 ) ) ( not ( = ?auto_575774 ?auto_575773 ) ) ( not ( = ?auto_575774 ?auto_575775 ) ) ( not ( = ?auto_575774 ?auto_575776 ) ) ( not ( = ?auto_575774 ?auto_575777 ) ) ( not ( = ?auto_575774 ?auto_575779 ) ) ( not ( = ?auto_575774 ?auto_575778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575775 ?auto_575776 ?auto_575777 )
      ( MAKE-7CRATE-VERIFY ?auto_575770 ?auto_575771 ?auto_575772 ?auto_575774 ?auto_575773 ?auto_575775 ?auto_575776 ?auto_575777 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_575785 - SURFACE
      ?auto_575786 - SURFACE
      ?auto_575787 - SURFACE
      ?auto_575789 - SURFACE
      ?auto_575788 - SURFACE
      ?auto_575790 - SURFACE
      ?auto_575791 - SURFACE
      ?auto_575792 - SURFACE
      ?auto_575793 - SURFACE
    )
    :vars
    (
      ?auto_575797 - HOIST
      ?auto_575798 - PLACE
      ?auto_575800 - PLACE
      ?auto_575796 - HOIST
      ?auto_575795 - SURFACE
      ?auto_575794 - SURFACE
      ?auto_575799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575797 ?auto_575798 ) ( IS-CRATE ?auto_575793 ) ( not ( = ?auto_575792 ?auto_575793 ) ) ( not ( = ?auto_575791 ?auto_575792 ) ) ( not ( = ?auto_575791 ?auto_575793 ) ) ( not ( = ?auto_575800 ?auto_575798 ) ) ( HOIST-AT ?auto_575796 ?auto_575800 ) ( not ( = ?auto_575797 ?auto_575796 ) ) ( SURFACE-AT ?auto_575793 ?auto_575800 ) ( ON ?auto_575793 ?auto_575795 ) ( CLEAR ?auto_575793 ) ( not ( = ?auto_575792 ?auto_575795 ) ) ( not ( = ?auto_575793 ?auto_575795 ) ) ( not ( = ?auto_575791 ?auto_575795 ) ) ( IS-CRATE ?auto_575792 ) ( AVAILABLE ?auto_575796 ) ( SURFACE-AT ?auto_575792 ?auto_575800 ) ( ON ?auto_575792 ?auto_575794 ) ( CLEAR ?auto_575792 ) ( not ( = ?auto_575792 ?auto_575794 ) ) ( not ( = ?auto_575793 ?auto_575794 ) ) ( not ( = ?auto_575791 ?auto_575794 ) ) ( not ( = ?auto_575795 ?auto_575794 ) ) ( TRUCK-AT ?auto_575799 ?auto_575798 ) ( SURFACE-AT ?auto_575790 ?auto_575798 ) ( CLEAR ?auto_575790 ) ( LIFTING ?auto_575797 ?auto_575791 ) ( IS-CRATE ?auto_575791 ) ( not ( = ?auto_575790 ?auto_575791 ) ) ( not ( = ?auto_575792 ?auto_575790 ) ) ( not ( = ?auto_575793 ?auto_575790 ) ) ( not ( = ?auto_575795 ?auto_575790 ) ) ( not ( = ?auto_575794 ?auto_575790 ) ) ( ON ?auto_575786 ?auto_575785 ) ( ON ?auto_575787 ?auto_575786 ) ( ON ?auto_575789 ?auto_575787 ) ( ON ?auto_575788 ?auto_575789 ) ( ON ?auto_575790 ?auto_575788 ) ( not ( = ?auto_575785 ?auto_575786 ) ) ( not ( = ?auto_575785 ?auto_575787 ) ) ( not ( = ?auto_575785 ?auto_575789 ) ) ( not ( = ?auto_575785 ?auto_575788 ) ) ( not ( = ?auto_575785 ?auto_575790 ) ) ( not ( = ?auto_575785 ?auto_575791 ) ) ( not ( = ?auto_575785 ?auto_575792 ) ) ( not ( = ?auto_575785 ?auto_575793 ) ) ( not ( = ?auto_575785 ?auto_575795 ) ) ( not ( = ?auto_575785 ?auto_575794 ) ) ( not ( = ?auto_575786 ?auto_575787 ) ) ( not ( = ?auto_575786 ?auto_575789 ) ) ( not ( = ?auto_575786 ?auto_575788 ) ) ( not ( = ?auto_575786 ?auto_575790 ) ) ( not ( = ?auto_575786 ?auto_575791 ) ) ( not ( = ?auto_575786 ?auto_575792 ) ) ( not ( = ?auto_575786 ?auto_575793 ) ) ( not ( = ?auto_575786 ?auto_575795 ) ) ( not ( = ?auto_575786 ?auto_575794 ) ) ( not ( = ?auto_575787 ?auto_575789 ) ) ( not ( = ?auto_575787 ?auto_575788 ) ) ( not ( = ?auto_575787 ?auto_575790 ) ) ( not ( = ?auto_575787 ?auto_575791 ) ) ( not ( = ?auto_575787 ?auto_575792 ) ) ( not ( = ?auto_575787 ?auto_575793 ) ) ( not ( = ?auto_575787 ?auto_575795 ) ) ( not ( = ?auto_575787 ?auto_575794 ) ) ( not ( = ?auto_575789 ?auto_575788 ) ) ( not ( = ?auto_575789 ?auto_575790 ) ) ( not ( = ?auto_575789 ?auto_575791 ) ) ( not ( = ?auto_575789 ?auto_575792 ) ) ( not ( = ?auto_575789 ?auto_575793 ) ) ( not ( = ?auto_575789 ?auto_575795 ) ) ( not ( = ?auto_575789 ?auto_575794 ) ) ( not ( = ?auto_575788 ?auto_575790 ) ) ( not ( = ?auto_575788 ?auto_575791 ) ) ( not ( = ?auto_575788 ?auto_575792 ) ) ( not ( = ?auto_575788 ?auto_575793 ) ) ( not ( = ?auto_575788 ?auto_575795 ) ) ( not ( = ?auto_575788 ?auto_575794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575791 ?auto_575792 ?auto_575793 )
      ( MAKE-8CRATE-VERIFY ?auto_575785 ?auto_575786 ?auto_575787 ?auto_575789 ?auto_575788 ?auto_575790 ?auto_575791 ?auto_575792 ?auto_575793 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_575801 - SURFACE
      ?auto_575802 - SURFACE
      ?auto_575803 - SURFACE
      ?auto_575805 - SURFACE
      ?auto_575804 - SURFACE
      ?auto_575806 - SURFACE
      ?auto_575807 - SURFACE
      ?auto_575808 - SURFACE
      ?auto_575809 - SURFACE
      ?auto_575810 - SURFACE
    )
    :vars
    (
      ?auto_575814 - HOIST
      ?auto_575815 - PLACE
      ?auto_575817 - PLACE
      ?auto_575813 - HOIST
      ?auto_575812 - SURFACE
      ?auto_575811 - SURFACE
      ?auto_575816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575814 ?auto_575815 ) ( IS-CRATE ?auto_575810 ) ( not ( = ?auto_575809 ?auto_575810 ) ) ( not ( = ?auto_575808 ?auto_575809 ) ) ( not ( = ?auto_575808 ?auto_575810 ) ) ( not ( = ?auto_575817 ?auto_575815 ) ) ( HOIST-AT ?auto_575813 ?auto_575817 ) ( not ( = ?auto_575814 ?auto_575813 ) ) ( SURFACE-AT ?auto_575810 ?auto_575817 ) ( ON ?auto_575810 ?auto_575812 ) ( CLEAR ?auto_575810 ) ( not ( = ?auto_575809 ?auto_575812 ) ) ( not ( = ?auto_575810 ?auto_575812 ) ) ( not ( = ?auto_575808 ?auto_575812 ) ) ( IS-CRATE ?auto_575809 ) ( AVAILABLE ?auto_575813 ) ( SURFACE-AT ?auto_575809 ?auto_575817 ) ( ON ?auto_575809 ?auto_575811 ) ( CLEAR ?auto_575809 ) ( not ( = ?auto_575809 ?auto_575811 ) ) ( not ( = ?auto_575810 ?auto_575811 ) ) ( not ( = ?auto_575808 ?auto_575811 ) ) ( not ( = ?auto_575812 ?auto_575811 ) ) ( TRUCK-AT ?auto_575816 ?auto_575815 ) ( SURFACE-AT ?auto_575807 ?auto_575815 ) ( CLEAR ?auto_575807 ) ( LIFTING ?auto_575814 ?auto_575808 ) ( IS-CRATE ?auto_575808 ) ( not ( = ?auto_575807 ?auto_575808 ) ) ( not ( = ?auto_575809 ?auto_575807 ) ) ( not ( = ?auto_575810 ?auto_575807 ) ) ( not ( = ?auto_575812 ?auto_575807 ) ) ( not ( = ?auto_575811 ?auto_575807 ) ) ( ON ?auto_575802 ?auto_575801 ) ( ON ?auto_575803 ?auto_575802 ) ( ON ?auto_575805 ?auto_575803 ) ( ON ?auto_575804 ?auto_575805 ) ( ON ?auto_575806 ?auto_575804 ) ( ON ?auto_575807 ?auto_575806 ) ( not ( = ?auto_575801 ?auto_575802 ) ) ( not ( = ?auto_575801 ?auto_575803 ) ) ( not ( = ?auto_575801 ?auto_575805 ) ) ( not ( = ?auto_575801 ?auto_575804 ) ) ( not ( = ?auto_575801 ?auto_575806 ) ) ( not ( = ?auto_575801 ?auto_575807 ) ) ( not ( = ?auto_575801 ?auto_575808 ) ) ( not ( = ?auto_575801 ?auto_575809 ) ) ( not ( = ?auto_575801 ?auto_575810 ) ) ( not ( = ?auto_575801 ?auto_575812 ) ) ( not ( = ?auto_575801 ?auto_575811 ) ) ( not ( = ?auto_575802 ?auto_575803 ) ) ( not ( = ?auto_575802 ?auto_575805 ) ) ( not ( = ?auto_575802 ?auto_575804 ) ) ( not ( = ?auto_575802 ?auto_575806 ) ) ( not ( = ?auto_575802 ?auto_575807 ) ) ( not ( = ?auto_575802 ?auto_575808 ) ) ( not ( = ?auto_575802 ?auto_575809 ) ) ( not ( = ?auto_575802 ?auto_575810 ) ) ( not ( = ?auto_575802 ?auto_575812 ) ) ( not ( = ?auto_575802 ?auto_575811 ) ) ( not ( = ?auto_575803 ?auto_575805 ) ) ( not ( = ?auto_575803 ?auto_575804 ) ) ( not ( = ?auto_575803 ?auto_575806 ) ) ( not ( = ?auto_575803 ?auto_575807 ) ) ( not ( = ?auto_575803 ?auto_575808 ) ) ( not ( = ?auto_575803 ?auto_575809 ) ) ( not ( = ?auto_575803 ?auto_575810 ) ) ( not ( = ?auto_575803 ?auto_575812 ) ) ( not ( = ?auto_575803 ?auto_575811 ) ) ( not ( = ?auto_575805 ?auto_575804 ) ) ( not ( = ?auto_575805 ?auto_575806 ) ) ( not ( = ?auto_575805 ?auto_575807 ) ) ( not ( = ?auto_575805 ?auto_575808 ) ) ( not ( = ?auto_575805 ?auto_575809 ) ) ( not ( = ?auto_575805 ?auto_575810 ) ) ( not ( = ?auto_575805 ?auto_575812 ) ) ( not ( = ?auto_575805 ?auto_575811 ) ) ( not ( = ?auto_575804 ?auto_575806 ) ) ( not ( = ?auto_575804 ?auto_575807 ) ) ( not ( = ?auto_575804 ?auto_575808 ) ) ( not ( = ?auto_575804 ?auto_575809 ) ) ( not ( = ?auto_575804 ?auto_575810 ) ) ( not ( = ?auto_575804 ?auto_575812 ) ) ( not ( = ?auto_575804 ?auto_575811 ) ) ( not ( = ?auto_575806 ?auto_575807 ) ) ( not ( = ?auto_575806 ?auto_575808 ) ) ( not ( = ?auto_575806 ?auto_575809 ) ) ( not ( = ?auto_575806 ?auto_575810 ) ) ( not ( = ?auto_575806 ?auto_575812 ) ) ( not ( = ?auto_575806 ?auto_575811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575808 ?auto_575809 ?auto_575810 )
      ( MAKE-9CRATE-VERIFY ?auto_575801 ?auto_575802 ?auto_575803 ?auto_575805 ?auto_575804 ?auto_575806 ?auto_575807 ?auto_575808 ?auto_575809 ?auto_575810 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_575818 - SURFACE
      ?auto_575819 - SURFACE
      ?auto_575820 - SURFACE
      ?auto_575822 - SURFACE
      ?auto_575821 - SURFACE
      ?auto_575823 - SURFACE
      ?auto_575824 - SURFACE
      ?auto_575825 - SURFACE
      ?auto_575826 - SURFACE
      ?auto_575827 - SURFACE
      ?auto_575828 - SURFACE
    )
    :vars
    (
      ?auto_575832 - HOIST
      ?auto_575833 - PLACE
      ?auto_575835 - PLACE
      ?auto_575831 - HOIST
      ?auto_575830 - SURFACE
      ?auto_575829 - SURFACE
      ?auto_575834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575832 ?auto_575833 ) ( IS-CRATE ?auto_575828 ) ( not ( = ?auto_575827 ?auto_575828 ) ) ( not ( = ?auto_575826 ?auto_575827 ) ) ( not ( = ?auto_575826 ?auto_575828 ) ) ( not ( = ?auto_575835 ?auto_575833 ) ) ( HOIST-AT ?auto_575831 ?auto_575835 ) ( not ( = ?auto_575832 ?auto_575831 ) ) ( SURFACE-AT ?auto_575828 ?auto_575835 ) ( ON ?auto_575828 ?auto_575830 ) ( CLEAR ?auto_575828 ) ( not ( = ?auto_575827 ?auto_575830 ) ) ( not ( = ?auto_575828 ?auto_575830 ) ) ( not ( = ?auto_575826 ?auto_575830 ) ) ( IS-CRATE ?auto_575827 ) ( AVAILABLE ?auto_575831 ) ( SURFACE-AT ?auto_575827 ?auto_575835 ) ( ON ?auto_575827 ?auto_575829 ) ( CLEAR ?auto_575827 ) ( not ( = ?auto_575827 ?auto_575829 ) ) ( not ( = ?auto_575828 ?auto_575829 ) ) ( not ( = ?auto_575826 ?auto_575829 ) ) ( not ( = ?auto_575830 ?auto_575829 ) ) ( TRUCK-AT ?auto_575834 ?auto_575833 ) ( SURFACE-AT ?auto_575825 ?auto_575833 ) ( CLEAR ?auto_575825 ) ( LIFTING ?auto_575832 ?auto_575826 ) ( IS-CRATE ?auto_575826 ) ( not ( = ?auto_575825 ?auto_575826 ) ) ( not ( = ?auto_575827 ?auto_575825 ) ) ( not ( = ?auto_575828 ?auto_575825 ) ) ( not ( = ?auto_575830 ?auto_575825 ) ) ( not ( = ?auto_575829 ?auto_575825 ) ) ( ON ?auto_575819 ?auto_575818 ) ( ON ?auto_575820 ?auto_575819 ) ( ON ?auto_575822 ?auto_575820 ) ( ON ?auto_575821 ?auto_575822 ) ( ON ?auto_575823 ?auto_575821 ) ( ON ?auto_575824 ?auto_575823 ) ( ON ?auto_575825 ?auto_575824 ) ( not ( = ?auto_575818 ?auto_575819 ) ) ( not ( = ?auto_575818 ?auto_575820 ) ) ( not ( = ?auto_575818 ?auto_575822 ) ) ( not ( = ?auto_575818 ?auto_575821 ) ) ( not ( = ?auto_575818 ?auto_575823 ) ) ( not ( = ?auto_575818 ?auto_575824 ) ) ( not ( = ?auto_575818 ?auto_575825 ) ) ( not ( = ?auto_575818 ?auto_575826 ) ) ( not ( = ?auto_575818 ?auto_575827 ) ) ( not ( = ?auto_575818 ?auto_575828 ) ) ( not ( = ?auto_575818 ?auto_575830 ) ) ( not ( = ?auto_575818 ?auto_575829 ) ) ( not ( = ?auto_575819 ?auto_575820 ) ) ( not ( = ?auto_575819 ?auto_575822 ) ) ( not ( = ?auto_575819 ?auto_575821 ) ) ( not ( = ?auto_575819 ?auto_575823 ) ) ( not ( = ?auto_575819 ?auto_575824 ) ) ( not ( = ?auto_575819 ?auto_575825 ) ) ( not ( = ?auto_575819 ?auto_575826 ) ) ( not ( = ?auto_575819 ?auto_575827 ) ) ( not ( = ?auto_575819 ?auto_575828 ) ) ( not ( = ?auto_575819 ?auto_575830 ) ) ( not ( = ?auto_575819 ?auto_575829 ) ) ( not ( = ?auto_575820 ?auto_575822 ) ) ( not ( = ?auto_575820 ?auto_575821 ) ) ( not ( = ?auto_575820 ?auto_575823 ) ) ( not ( = ?auto_575820 ?auto_575824 ) ) ( not ( = ?auto_575820 ?auto_575825 ) ) ( not ( = ?auto_575820 ?auto_575826 ) ) ( not ( = ?auto_575820 ?auto_575827 ) ) ( not ( = ?auto_575820 ?auto_575828 ) ) ( not ( = ?auto_575820 ?auto_575830 ) ) ( not ( = ?auto_575820 ?auto_575829 ) ) ( not ( = ?auto_575822 ?auto_575821 ) ) ( not ( = ?auto_575822 ?auto_575823 ) ) ( not ( = ?auto_575822 ?auto_575824 ) ) ( not ( = ?auto_575822 ?auto_575825 ) ) ( not ( = ?auto_575822 ?auto_575826 ) ) ( not ( = ?auto_575822 ?auto_575827 ) ) ( not ( = ?auto_575822 ?auto_575828 ) ) ( not ( = ?auto_575822 ?auto_575830 ) ) ( not ( = ?auto_575822 ?auto_575829 ) ) ( not ( = ?auto_575821 ?auto_575823 ) ) ( not ( = ?auto_575821 ?auto_575824 ) ) ( not ( = ?auto_575821 ?auto_575825 ) ) ( not ( = ?auto_575821 ?auto_575826 ) ) ( not ( = ?auto_575821 ?auto_575827 ) ) ( not ( = ?auto_575821 ?auto_575828 ) ) ( not ( = ?auto_575821 ?auto_575830 ) ) ( not ( = ?auto_575821 ?auto_575829 ) ) ( not ( = ?auto_575823 ?auto_575824 ) ) ( not ( = ?auto_575823 ?auto_575825 ) ) ( not ( = ?auto_575823 ?auto_575826 ) ) ( not ( = ?auto_575823 ?auto_575827 ) ) ( not ( = ?auto_575823 ?auto_575828 ) ) ( not ( = ?auto_575823 ?auto_575830 ) ) ( not ( = ?auto_575823 ?auto_575829 ) ) ( not ( = ?auto_575824 ?auto_575825 ) ) ( not ( = ?auto_575824 ?auto_575826 ) ) ( not ( = ?auto_575824 ?auto_575827 ) ) ( not ( = ?auto_575824 ?auto_575828 ) ) ( not ( = ?auto_575824 ?auto_575830 ) ) ( not ( = ?auto_575824 ?auto_575829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_575826 ?auto_575827 ?auto_575828 )
      ( MAKE-10CRATE-VERIFY ?auto_575818 ?auto_575819 ?auto_575820 ?auto_575822 ?auto_575821 ?auto_575823 ?auto_575824 ?auto_575825 ?auto_575826 ?auto_575827 ?auto_575828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_578480 - SURFACE
      ?auto_578481 - SURFACE
    )
    :vars
    (
      ?auto_578489 - HOIST
      ?auto_578485 - PLACE
      ?auto_578487 - SURFACE
      ?auto_578482 - PLACE
      ?auto_578488 - HOIST
      ?auto_578483 - SURFACE
      ?auto_578486 - TRUCK
      ?auto_578484 - SURFACE
      ?auto_578490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_578489 ?auto_578485 ) ( IS-CRATE ?auto_578481 ) ( not ( = ?auto_578480 ?auto_578481 ) ) ( not ( = ?auto_578487 ?auto_578480 ) ) ( not ( = ?auto_578487 ?auto_578481 ) ) ( not ( = ?auto_578482 ?auto_578485 ) ) ( HOIST-AT ?auto_578488 ?auto_578482 ) ( not ( = ?auto_578489 ?auto_578488 ) ) ( SURFACE-AT ?auto_578481 ?auto_578482 ) ( ON ?auto_578481 ?auto_578483 ) ( CLEAR ?auto_578481 ) ( not ( = ?auto_578480 ?auto_578483 ) ) ( not ( = ?auto_578481 ?auto_578483 ) ) ( not ( = ?auto_578487 ?auto_578483 ) ) ( SURFACE-AT ?auto_578487 ?auto_578485 ) ( CLEAR ?auto_578487 ) ( IS-CRATE ?auto_578480 ) ( AVAILABLE ?auto_578489 ) ( TRUCK-AT ?auto_578486 ?auto_578482 ) ( SURFACE-AT ?auto_578480 ?auto_578482 ) ( ON ?auto_578480 ?auto_578484 ) ( CLEAR ?auto_578480 ) ( not ( = ?auto_578480 ?auto_578484 ) ) ( not ( = ?auto_578481 ?auto_578484 ) ) ( not ( = ?auto_578487 ?auto_578484 ) ) ( not ( = ?auto_578483 ?auto_578484 ) ) ( LIFTING ?auto_578488 ?auto_578490 ) ( IS-CRATE ?auto_578490 ) ( not ( = ?auto_578480 ?auto_578490 ) ) ( not ( = ?auto_578481 ?auto_578490 ) ) ( not ( = ?auto_578487 ?auto_578490 ) ) ( not ( = ?auto_578483 ?auto_578490 ) ) ( not ( = ?auto_578484 ?auto_578490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_578488 ?auto_578490 ?auto_578486 ?auto_578482 )
      ( MAKE-2CRATE ?auto_578487 ?auto_578480 ?auto_578481 )
      ( MAKE-1CRATE-VERIFY ?auto_578480 ?auto_578481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_578491 - SURFACE
      ?auto_578492 - SURFACE
      ?auto_578493 - SURFACE
    )
    :vars
    (
      ?auto_578495 - HOIST
      ?auto_578496 - PLACE
      ?auto_578498 - PLACE
      ?auto_578494 - HOIST
      ?auto_578497 - SURFACE
      ?auto_578499 - TRUCK
      ?auto_578500 - SURFACE
      ?auto_578501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_578495 ?auto_578496 ) ( IS-CRATE ?auto_578493 ) ( not ( = ?auto_578492 ?auto_578493 ) ) ( not ( = ?auto_578491 ?auto_578492 ) ) ( not ( = ?auto_578491 ?auto_578493 ) ) ( not ( = ?auto_578498 ?auto_578496 ) ) ( HOIST-AT ?auto_578494 ?auto_578498 ) ( not ( = ?auto_578495 ?auto_578494 ) ) ( SURFACE-AT ?auto_578493 ?auto_578498 ) ( ON ?auto_578493 ?auto_578497 ) ( CLEAR ?auto_578493 ) ( not ( = ?auto_578492 ?auto_578497 ) ) ( not ( = ?auto_578493 ?auto_578497 ) ) ( not ( = ?auto_578491 ?auto_578497 ) ) ( SURFACE-AT ?auto_578491 ?auto_578496 ) ( CLEAR ?auto_578491 ) ( IS-CRATE ?auto_578492 ) ( AVAILABLE ?auto_578495 ) ( TRUCK-AT ?auto_578499 ?auto_578498 ) ( SURFACE-AT ?auto_578492 ?auto_578498 ) ( ON ?auto_578492 ?auto_578500 ) ( CLEAR ?auto_578492 ) ( not ( = ?auto_578492 ?auto_578500 ) ) ( not ( = ?auto_578493 ?auto_578500 ) ) ( not ( = ?auto_578491 ?auto_578500 ) ) ( not ( = ?auto_578497 ?auto_578500 ) ) ( LIFTING ?auto_578494 ?auto_578501 ) ( IS-CRATE ?auto_578501 ) ( not ( = ?auto_578492 ?auto_578501 ) ) ( not ( = ?auto_578493 ?auto_578501 ) ) ( not ( = ?auto_578491 ?auto_578501 ) ) ( not ( = ?auto_578497 ?auto_578501 ) ) ( not ( = ?auto_578500 ?auto_578501 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_578492 ?auto_578493 )
      ( MAKE-2CRATE-VERIFY ?auto_578491 ?auto_578492 ?auto_578493 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582328 - SURFACE
      ?auto_582329 - SURFACE
      ?auto_582330 - SURFACE
      ?auto_582332 - SURFACE
      ?auto_582331 - SURFACE
      ?auto_582333 - SURFACE
      ?auto_582334 - SURFACE
      ?auto_582335 - SURFACE
      ?auto_582336 - SURFACE
      ?auto_582337 - SURFACE
      ?auto_582338 - SURFACE
      ?auto_582339 - SURFACE
    )
    :vars
    (
      ?auto_582340 - HOIST
      ?auto_582341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_582340 ?auto_582341 ) ( SURFACE-AT ?auto_582338 ?auto_582341 ) ( CLEAR ?auto_582338 ) ( LIFTING ?auto_582340 ?auto_582339 ) ( IS-CRATE ?auto_582339 ) ( not ( = ?auto_582338 ?auto_582339 ) ) ( ON ?auto_582329 ?auto_582328 ) ( ON ?auto_582330 ?auto_582329 ) ( ON ?auto_582332 ?auto_582330 ) ( ON ?auto_582331 ?auto_582332 ) ( ON ?auto_582333 ?auto_582331 ) ( ON ?auto_582334 ?auto_582333 ) ( ON ?auto_582335 ?auto_582334 ) ( ON ?auto_582336 ?auto_582335 ) ( ON ?auto_582337 ?auto_582336 ) ( ON ?auto_582338 ?auto_582337 ) ( not ( = ?auto_582328 ?auto_582329 ) ) ( not ( = ?auto_582328 ?auto_582330 ) ) ( not ( = ?auto_582328 ?auto_582332 ) ) ( not ( = ?auto_582328 ?auto_582331 ) ) ( not ( = ?auto_582328 ?auto_582333 ) ) ( not ( = ?auto_582328 ?auto_582334 ) ) ( not ( = ?auto_582328 ?auto_582335 ) ) ( not ( = ?auto_582328 ?auto_582336 ) ) ( not ( = ?auto_582328 ?auto_582337 ) ) ( not ( = ?auto_582328 ?auto_582338 ) ) ( not ( = ?auto_582328 ?auto_582339 ) ) ( not ( = ?auto_582329 ?auto_582330 ) ) ( not ( = ?auto_582329 ?auto_582332 ) ) ( not ( = ?auto_582329 ?auto_582331 ) ) ( not ( = ?auto_582329 ?auto_582333 ) ) ( not ( = ?auto_582329 ?auto_582334 ) ) ( not ( = ?auto_582329 ?auto_582335 ) ) ( not ( = ?auto_582329 ?auto_582336 ) ) ( not ( = ?auto_582329 ?auto_582337 ) ) ( not ( = ?auto_582329 ?auto_582338 ) ) ( not ( = ?auto_582329 ?auto_582339 ) ) ( not ( = ?auto_582330 ?auto_582332 ) ) ( not ( = ?auto_582330 ?auto_582331 ) ) ( not ( = ?auto_582330 ?auto_582333 ) ) ( not ( = ?auto_582330 ?auto_582334 ) ) ( not ( = ?auto_582330 ?auto_582335 ) ) ( not ( = ?auto_582330 ?auto_582336 ) ) ( not ( = ?auto_582330 ?auto_582337 ) ) ( not ( = ?auto_582330 ?auto_582338 ) ) ( not ( = ?auto_582330 ?auto_582339 ) ) ( not ( = ?auto_582332 ?auto_582331 ) ) ( not ( = ?auto_582332 ?auto_582333 ) ) ( not ( = ?auto_582332 ?auto_582334 ) ) ( not ( = ?auto_582332 ?auto_582335 ) ) ( not ( = ?auto_582332 ?auto_582336 ) ) ( not ( = ?auto_582332 ?auto_582337 ) ) ( not ( = ?auto_582332 ?auto_582338 ) ) ( not ( = ?auto_582332 ?auto_582339 ) ) ( not ( = ?auto_582331 ?auto_582333 ) ) ( not ( = ?auto_582331 ?auto_582334 ) ) ( not ( = ?auto_582331 ?auto_582335 ) ) ( not ( = ?auto_582331 ?auto_582336 ) ) ( not ( = ?auto_582331 ?auto_582337 ) ) ( not ( = ?auto_582331 ?auto_582338 ) ) ( not ( = ?auto_582331 ?auto_582339 ) ) ( not ( = ?auto_582333 ?auto_582334 ) ) ( not ( = ?auto_582333 ?auto_582335 ) ) ( not ( = ?auto_582333 ?auto_582336 ) ) ( not ( = ?auto_582333 ?auto_582337 ) ) ( not ( = ?auto_582333 ?auto_582338 ) ) ( not ( = ?auto_582333 ?auto_582339 ) ) ( not ( = ?auto_582334 ?auto_582335 ) ) ( not ( = ?auto_582334 ?auto_582336 ) ) ( not ( = ?auto_582334 ?auto_582337 ) ) ( not ( = ?auto_582334 ?auto_582338 ) ) ( not ( = ?auto_582334 ?auto_582339 ) ) ( not ( = ?auto_582335 ?auto_582336 ) ) ( not ( = ?auto_582335 ?auto_582337 ) ) ( not ( = ?auto_582335 ?auto_582338 ) ) ( not ( = ?auto_582335 ?auto_582339 ) ) ( not ( = ?auto_582336 ?auto_582337 ) ) ( not ( = ?auto_582336 ?auto_582338 ) ) ( not ( = ?auto_582336 ?auto_582339 ) ) ( not ( = ?auto_582337 ?auto_582338 ) ) ( not ( = ?auto_582337 ?auto_582339 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_582338 ?auto_582339 )
      ( MAKE-11CRATE-VERIFY ?auto_582328 ?auto_582329 ?auto_582330 ?auto_582332 ?auto_582331 ?auto_582333 ?auto_582334 ?auto_582335 ?auto_582336 ?auto_582337 ?auto_582338 ?auto_582339 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582437 - SURFACE
      ?auto_582438 - SURFACE
      ?auto_582439 - SURFACE
      ?auto_582441 - SURFACE
      ?auto_582440 - SURFACE
      ?auto_582442 - SURFACE
      ?auto_582443 - SURFACE
      ?auto_582444 - SURFACE
      ?auto_582445 - SURFACE
      ?auto_582446 - SURFACE
      ?auto_582447 - SURFACE
      ?auto_582448 - SURFACE
    )
    :vars
    (
      ?auto_582451 - HOIST
      ?auto_582450 - PLACE
      ?auto_582449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_582451 ?auto_582450 ) ( SURFACE-AT ?auto_582447 ?auto_582450 ) ( CLEAR ?auto_582447 ) ( IS-CRATE ?auto_582448 ) ( not ( = ?auto_582447 ?auto_582448 ) ) ( TRUCK-AT ?auto_582449 ?auto_582450 ) ( AVAILABLE ?auto_582451 ) ( IN ?auto_582448 ?auto_582449 ) ( ON ?auto_582447 ?auto_582446 ) ( not ( = ?auto_582446 ?auto_582447 ) ) ( not ( = ?auto_582446 ?auto_582448 ) ) ( ON ?auto_582438 ?auto_582437 ) ( ON ?auto_582439 ?auto_582438 ) ( ON ?auto_582441 ?auto_582439 ) ( ON ?auto_582440 ?auto_582441 ) ( ON ?auto_582442 ?auto_582440 ) ( ON ?auto_582443 ?auto_582442 ) ( ON ?auto_582444 ?auto_582443 ) ( ON ?auto_582445 ?auto_582444 ) ( ON ?auto_582446 ?auto_582445 ) ( not ( = ?auto_582437 ?auto_582438 ) ) ( not ( = ?auto_582437 ?auto_582439 ) ) ( not ( = ?auto_582437 ?auto_582441 ) ) ( not ( = ?auto_582437 ?auto_582440 ) ) ( not ( = ?auto_582437 ?auto_582442 ) ) ( not ( = ?auto_582437 ?auto_582443 ) ) ( not ( = ?auto_582437 ?auto_582444 ) ) ( not ( = ?auto_582437 ?auto_582445 ) ) ( not ( = ?auto_582437 ?auto_582446 ) ) ( not ( = ?auto_582437 ?auto_582447 ) ) ( not ( = ?auto_582437 ?auto_582448 ) ) ( not ( = ?auto_582438 ?auto_582439 ) ) ( not ( = ?auto_582438 ?auto_582441 ) ) ( not ( = ?auto_582438 ?auto_582440 ) ) ( not ( = ?auto_582438 ?auto_582442 ) ) ( not ( = ?auto_582438 ?auto_582443 ) ) ( not ( = ?auto_582438 ?auto_582444 ) ) ( not ( = ?auto_582438 ?auto_582445 ) ) ( not ( = ?auto_582438 ?auto_582446 ) ) ( not ( = ?auto_582438 ?auto_582447 ) ) ( not ( = ?auto_582438 ?auto_582448 ) ) ( not ( = ?auto_582439 ?auto_582441 ) ) ( not ( = ?auto_582439 ?auto_582440 ) ) ( not ( = ?auto_582439 ?auto_582442 ) ) ( not ( = ?auto_582439 ?auto_582443 ) ) ( not ( = ?auto_582439 ?auto_582444 ) ) ( not ( = ?auto_582439 ?auto_582445 ) ) ( not ( = ?auto_582439 ?auto_582446 ) ) ( not ( = ?auto_582439 ?auto_582447 ) ) ( not ( = ?auto_582439 ?auto_582448 ) ) ( not ( = ?auto_582441 ?auto_582440 ) ) ( not ( = ?auto_582441 ?auto_582442 ) ) ( not ( = ?auto_582441 ?auto_582443 ) ) ( not ( = ?auto_582441 ?auto_582444 ) ) ( not ( = ?auto_582441 ?auto_582445 ) ) ( not ( = ?auto_582441 ?auto_582446 ) ) ( not ( = ?auto_582441 ?auto_582447 ) ) ( not ( = ?auto_582441 ?auto_582448 ) ) ( not ( = ?auto_582440 ?auto_582442 ) ) ( not ( = ?auto_582440 ?auto_582443 ) ) ( not ( = ?auto_582440 ?auto_582444 ) ) ( not ( = ?auto_582440 ?auto_582445 ) ) ( not ( = ?auto_582440 ?auto_582446 ) ) ( not ( = ?auto_582440 ?auto_582447 ) ) ( not ( = ?auto_582440 ?auto_582448 ) ) ( not ( = ?auto_582442 ?auto_582443 ) ) ( not ( = ?auto_582442 ?auto_582444 ) ) ( not ( = ?auto_582442 ?auto_582445 ) ) ( not ( = ?auto_582442 ?auto_582446 ) ) ( not ( = ?auto_582442 ?auto_582447 ) ) ( not ( = ?auto_582442 ?auto_582448 ) ) ( not ( = ?auto_582443 ?auto_582444 ) ) ( not ( = ?auto_582443 ?auto_582445 ) ) ( not ( = ?auto_582443 ?auto_582446 ) ) ( not ( = ?auto_582443 ?auto_582447 ) ) ( not ( = ?auto_582443 ?auto_582448 ) ) ( not ( = ?auto_582444 ?auto_582445 ) ) ( not ( = ?auto_582444 ?auto_582446 ) ) ( not ( = ?auto_582444 ?auto_582447 ) ) ( not ( = ?auto_582444 ?auto_582448 ) ) ( not ( = ?auto_582445 ?auto_582446 ) ) ( not ( = ?auto_582445 ?auto_582447 ) ) ( not ( = ?auto_582445 ?auto_582448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_582446 ?auto_582447 ?auto_582448 )
      ( MAKE-11CRATE-VERIFY ?auto_582437 ?auto_582438 ?auto_582439 ?auto_582441 ?auto_582440 ?auto_582442 ?auto_582443 ?auto_582444 ?auto_582445 ?auto_582446 ?auto_582447 ?auto_582448 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582558 - SURFACE
      ?auto_582559 - SURFACE
      ?auto_582560 - SURFACE
      ?auto_582562 - SURFACE
      ?auto_582561 - SURFACE
      ?auto_582563 - SURFACE
      ?auto_582564 - SURFACE
      ?auto_582565 - SURFACE
      ?auto_582566 - SURFACE
      ?auto_582567 - SURFACE
      ?auto_582568 - SURFACE
      ?auto_582569 - SURFACE
    )
    :vars
    (
      ?auto_582573 - HOIST
      ?auto_582572 - PLACE
      ?auto_582571 - TRUCK
      ?auto_582570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_582573 ?auto_582572 ) ( SURFACE-AT ?auto_582568 ?auto_582572 ) ( CLEAR ?auto_582568 ) ( IS-CRATE ?auto_582569 ) ( not ( = ?auto_582568 ?auto_582569 ) ) ( AVAILABLE ?auto_582573 ) ( IN ?auto_582569 ?auto_582571 ) ( ON ?auto_582568 ?auto_582567 ) ( not ( = ?auto_582567 ?auto_582568 ) ) ( not ( = ?auto_582567 ?auto_582569 ) ) ( TRUCK-AT ?auto_582571 ?auto_582570 ) ( not ( = ?auto_582570 ?auto_582572 ) ) ( ON ?auto_582559 ?auto_582558 ) ( ON ?auto_582560 ?auto_582559 ) ( ON ?auto_582562 ?auto_582560 ) ( ON ?auto_582561 ?auto_582562 ) ( ON ?auto_582563 ?auto_582561 ) ( ON ?auto_582564 ?auto_582563 ) ( ON ?auto_582565 ?auto_582564 ) ( ON ?auto_582566 ?auto_582565 ) ( ON ?auto_582567 ?auto_582566 ) ( not ( = ?auto_582558 ?auto_582559 ) ) ( not ( = ?auto_582558 ?auto_582560 ) ) ( not ( = ?auto_582558 ?auto_582562 ) ) ( not ( = ?auto_582558 ?auto_582561 ) ) ( not ( = ?auto_582558 ?auto_582563 ) ) ( not ( = ?auto_582558 ?auto_582564 ) ) ( not ( = ?auto_582558 ?auto_582565 ) ) ( not ( = ?auto_582558 ?auto_582566 ) ) ( not ( = ?auto_582558 ?auto_582567 ) ) ( not ( = ?auto_582558 ?auto_582568 ) ) ( not ( = ?auto_582558 ?auto_582569 ) ) ( not ( = ?auto_582559 ?auto_582560 ) ) ( not ( = ?auto_582559 ?auto_582562 ) ) ( not ( = ?auto_582559 ?auto_582561 ) ) ( not ( = ?auto_582559 ?auto_582563 ) ) ( not ( = ?auto_582559 ?auto_582564 ) ) ( not ( = ?auto_582559 ?auto_582565 ) ) ( not ( = ?auto_582559 ?auto_582566 ) ) ( not ( = ?auto_582559 ?auto_582567 ) ) ( not ( = ?auto_582559 ?auto_582568 ) ) ( not ( = ?auto_582559 ?auto_582569 ) ) ( not ( = ?auto_582560 ?auto_582562 ) ) ( not ( = ?auto_582560 ?auto_582561 ) ) ( not ( = ?auto_582560 ?auto_582563 ) ) ( not ( = ?auto_582560 ?auto_582564 ) ) ( not ( = ?auto_582560 ?auto_582565 ) ) ( not ( = ?auto_582560 ?auto_582566 ) ) ( not ( = ?auto_582560 ?auto_582567 ) ) ( not ( = ?auto_582560 ?auto_582568 ) ) ( not ( = ?auto_582560 ?auto_582569 ) ) ( not ( = ?auto_582562 ?auto_582561 ) ) ( not ( = ?auto_582562 ?auto_582563 ) ) ( not ( = ?auto_582562 ?auto_582564 ) ) ( not ( = ?auto_582562 ?auto_582565 ) ) ( not ( = ?auto_582562 ?auto_582566 ) ) ( not ( = ?auto_582562 ?auto_582567 ) ) ( not ( = ?auto_582562 ?auto_582568 ) ) ( not ( = ?auto_582562 ?auto_582569 ) ) ( not ( = ?auto_582561 ?auto_582563 ) ) ( not ( = ?auto_582561 ?auto_582564 ) ) ( not ( = ?auto_582561 ?auto_582565 ) ) ( not ( = ?auto_582561 ?auto_582566 ) ) ( not ( = ?auto_582561 ?auto_582567 ) ) ( not ( = ?auto_582561 ?auto_582568 ) ) ( not ( = ?auto_582561 ?auto_582569 ) ) ( not ( = ?auto_582563 ?auto_582564 ) ) ( not ( = ?auto_582563 ?auto_582565 ) ) ( not ( = ?auto_582563 ?auto_582566 ) ) ( not ( = ?auto_582563 ?auto_582567 ) ) ( not ( = ?auto_582563 ?auto_582568 ) ) ( not ( = ?auto_582563 ?auto_582569 ) ) ( not ( = ?auto_582564 ?auto_582565 ) ) ( not ( = ?auto_582564 ?auto_582566 ) ) ( not ( = ?auto_582564 ?auto_582567 ) ) ( not ( = ?auto_582564 ?auto_582568 ) ) ( not ( = ?auto_582564 ?auto_582569 ) ) ( not ( = ?auto_582565 ?auto_582566 ) ) ( not ( = ?auto_582565 ?auto_582567 ) ) ( not ( = ?auto_582565 ?auto_582568 ) ) ( not ( = ?auto_582565 ?auto_582569 ) ) ( not ( = ?auto_582566 ?auto_582567 ) ) ( not ( = ?auto_582566 ?auto_582568 ) ) ( not ( = ?auto_582566 ?auto_582569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_582567 ?auto_582568 ?auto_582569 )
      ( MAKE-11CRATE-VERIFY ?auto_582558 ?auto_582559 ?auto_582560 ?auto_582562 ?auto_582561 ?auto_582563 ?auto_582564 ?auto_582565 ?auto_582566 ?auto_582567 ?auto_582568 ?auto_582569 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582690 - SURFACE
      ?auto_582691 - SURFACE
      ?auto_582692 - SURFACE
      ?auto_582694 - SURFACE
      ?auto_582693 - SURFACE
      ?auto_582695 - SURFACE
      ?auto_582696 - SURFACE
      ?auto_582697 - SURFACE
      ?auto_582698 - SURFACE
      ?auto_582699 - SURFACE
      ?auto_582700 - SURFACE
      ?auto_582701 - SURFACE
    )
    :vars
    (
      ?auto_582702 - HOIST
      ?auto_582703 - PLACE
      ?auto_582706 - TRUCK
      ?auto_582705 - PLACE
      ?auto_582704 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_582702 ?auto_582703 ) ( SURFACE-AT ?auto_582700 ?auto_582703 ) ( CLEAR ?auto_582700 ) ( IS-CRATE ?auto_582701 ) ( not ( = ?auto_582700 ?auto_582701 ) ) ( AVAILABLE ?auto_582702 ) ( ON ?auto_582700 ?auto_582699 ) ( not ( = ?auto_582699 ?auto_582700 ) ) ( not ( = ?auto_582699 ?auto_582701 ) ) ( TRUCK-AT ?auto_582706 ?auto_582705 ) ( not ( = ?auto_582705 ?auto_582703 ) ) ( HOIST-AT ?auto_582704 ?auto_582705 ) ( LIFTING ?auto_582704 ?auto_582701 ) ( not ( = ?auto_582702 ?auto_582704 ) ) ( ON ?auto_582691 ?auto_582690 ) ( ON ?auto_582692 ?auto_582691 ) ( ON ?auto_582694 ?auto_582692 ) ( ON ?auto_582693 ?auto_582694 ) ( ON ?auto_582695 ?auto_582693 ) ( ON ?auto_582696 ?auto_582695 ) ( ON ?auto_582697 ?auto_582696 ) ( ON ?auto_582698 ?auto_582697 ) ( ON ?auto_582699 ?auto_582698 ) ( not ( = ?auto_582690 ?auto_582691 ) ) ( not ( = ?auto_582690 ?auto_582692 ) ) ( not ( = ?auto_582690 ?auto_582694 ) ) ( not ( = ?auto_582690 ?auto_582693 ) ) ( not ( = ?auto_582690 ?auto_582695 ) ) ( not ( = ?auto_582690 ?auto_582696 ) ) ( not ( = ?auto_582690 ?auto_582697 ) ) ( not ( = ?auto_582690 ?auto_582698 ) ) ( not ( = ?auto_582690 ?auto_582699 ) ) ( not ( = ?auto_582690 ?auto_582700 ) ) ( not ( = ?auto_582690 ?auto_582701 ) ) ( not ( = ?auto_582691 ?auto_582692 ) ) ( not ( = ?auto_582691 ?auto_582694 ) ) ( not ( = ?auto_582691 ?auto_582693 ) ) ( not ( = ?auto_582691 ?auto_582695 ) ) ( not ( = ?auto_582691 ?auto_582696 ) ) ( not ( = ?auto_582691 ?auto_582697 ) ) ( not ( = ?auto_582691 ?auto_582698 ) ) ( not ( = ?auto_582691 ?auto_582699 ) ) ( not ( = ?auto_582691 ?auto_582700 ) ) ( not ( = ?auto_582691 ?auto_582701 ) ) ( not ( = ?auto_582692 ?auto_582694 ) ) ( not ( = ?auto_582692 ?auto_582693 ) ) ( not ( = ?auto_582692 ?auto_582695 ) ) ( not ( = ?auto_582692 ?auto_582696 ) ) ( not ( = ?auto_582692 ?auto_582697 ) ) ( not ( = ?auto_582692 ?auto_582698 ) ) ( not ( = ?auto_582692 ?auto_582699 ) ) ( not ( = ?auto_582692 ?auto_582700 ) ) ( not ( = ?auto_582692 ?auto_582701 ) ) ( not ( = ?auto_582694 ?auto_582693 ) ) ( not ( = ?auto_582694 ?auto_582695 ) ) ( not ( = ?auto_582694 ?auto_582696 ) ) ( not ( = ?auto_582694 ?auto_582697 ) ) ( not ( = ?auto_582694 ?auto_582698 ) ) ( not ( = ?auto_582694 ?auto_582699 ) ) ( not ( = ?auto_582694 ?auto_582700 ) ) ( not ( = ?auto_582694 ?auto_582701 ) ) ( not ( = ?auto_582693 ?auto_582695 ) ) ( not ( = ?auto_582693 ?auto_582696 ) ) ( not ( = ?auto_582693 ?auto_582697 ) ) ( not ( = ?auto_582693 ?auto_582698 ) ) ( not ( = ?auto_582693 ?auto_582699 ) ) ( not ( = ?auto_582693 ?auto_582700 ) ) ( not ( = ?auto_582693 ?auto_582701 ) ) ( not ( = ?auto_582695 ?auto_582696 ) ) ( not ( = ?auto_582695 ?auto_582697 ) ) ( not ( = ?auto_582695 ?auto_582698 ) ) ( not ( = ?auto_582695 ?auto_582699 ) ) ( not ( = ?auto_582695 ?auto_582700 ) ) ( not ( = ?auto_582695 ?auto_582701 ) ) ( not ( = ?auto_582696 ?auto_582697 ) ) ( not ( = ?auto_582696 ?auto_582698 ) ) ( not ( = ?auto_582696 ?auto_582699 ) ) ( not ( = ?auto_582696 ?auto_582700 ) ) ( not ( = ?auto_582696 ?auto_582701 ) ) ( not ( = ?auto_582697 ?auto_582698 ) ) ( not ( = ?auto_582697 ?auto_582699 ) ) ( not ( = ?auto_582697 ?auto_582700 ) ) ( not ( = ?auto_582697 ?auto_582701 ) ) ( not ( = ?auto_582698 ?auto_582699 ) ) ( not ( = ?auto_582698 ?auto_582700 ) ) ( not ( = ?auto_582698 ?auto_582701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_582699 ?auto_582700 ?auto_582701 )
      ( MAKE-11CRATE-VERIFY ?auto_582690 ?auto_582691 ?auto_582692 ?auto_582694 ?auto_582693 ?auto_582695 ?auto_582696 ?auto_582697 ?auto_582698 ?auto_582699 ?auto_582700 ?auto_582701 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582833 - SURFACE
      ?auto_582834 - SURFACE
      ?auto_582835 - SURFACE
      ?auto_582837 - SURFACE
      ?auto_582836 - SURFACE
      ?auto_582838 - SURFACE
      ?auto_582839 - SURFACE
      ?auto_582840 - SURFACE
      ?auto_582841 - SURFACE
      ?auto_582842 - SURFACE
      ?auto_582843 - SURFACE
      ?auto_582844 - SURFACE
    )
    :vars
    (
      ?auto_582846 - HOIST
      ?auto_582847 - PLACE
      ?auto_582845 - TRUCK
      ?auto_582850 - PLACE
      ?auto_582849 - HOIST
      ?auto_582848 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_582846 ?auto_582847 ) ( SURFACE-AT ?auto_582843 ?auto_582847 ) ( CLEAR ?auto_582843 ) ( IS-CRATE ?auto_582844 ) ( not ( = ?auto_582843 ?auto_582844 ) ) ( AVAILABLE ?auto_582846 ) ( ON ?auto_582843 ?auto_582842 ) ( not ( = ?auto_582842 ?auto_582843 ) ) ( not ( = ?auto_582842 ?auto_582844 ) ) ( TRUCK-AT ?auto_582845 ?auto_582850 ) ( not ( = ?auto_582850 ?auto_582847 ) ) ( HOIST-AT ?auto_582849 ?auto_582850 ) ( not ( = ?auto_582846 ?auto_582849 ) ) ( AVAILABLE ?auto_582849 ) ( SURFACE-AT ?auto_582844 ?auto_582850 ) ( ON ?auto_582844 ?auto_582848 ) ( CLEAR ?auto_582844 ) ( not ( = ?auto_582843 ?auto_582848 ) ) ( not ( = ?auto_582844 ?auto_582848 ) ) ( not ( = ?auto_582842 ?auto_582848 ) ) ( ON ?auto_582834 ?auto_582833 ) ( ON ?auto_582835 ?auto_582834 ) ( ON ?auto_582837 ?auto_582835 ) ( ON ?auto_582836 ?auto_582837 ) ( ON ?auto_582838 ?auto_582836 ) ( ON ?auto_582839 ?auto_582838 ) ( ON ?auto_582840 ?auto_582839 ) ( ON ?auto_582841 ?auto_582840 ) ( ON ?auto_582842 ?auto_582841 ) ( not ( = ?auto_582833 ?auto_582834 ) ) ( not ( = ?auto_582833 ?auto_582835 ) ) ( not ( = ?auto_582833 ?auto_582837 ) ) ( not ( = ?auto_582833 ?auto_582836 ) ) ( not ( = ?auto_582833 ?auto_582838 ) ) ( not ( = ?auto_582833 ?auto_582839 ) ) ( not ( = ?auto_582833 ?auto_582840 ) ) ( not ( = ?auto_582833 ?auto_582841 ) ) ( not ( = ?auto_582833 ?auto_582842 ) ) ( not ( = ?auto_582833 ?auto_582843 ) ) ( not ( = ?auto_582833 ?auto_582844 ) ) ( not ( = ?auto_582833 ?auto_582848 ) ) ( not ( = ?auto_582834 ?auto_582835 ) ) ( not ( = ?auto_582834 ?auto_582837 ) ) ( not ( = ?auto_582834 ?auto_582836 ) ) ( not ( = ?auto_582834 ?auto_582838 ) ) ( not ( = ?auto_582834 ?auto_582839 ) ) ( not ( = ?auto_582834 ?auto_582840 ) ) ( not ( = ?auto_582834 ?auto_582841 ) ) ( not ( = ?auto_582834 ?auto_582842 ) ) ( not ( = ?auto_582834 ?auto_582843 ) ) ( not ( = ?auto_582834 ?auto_582844 ) ) ( not ( = ?auto_582834 ?auto_582848 ) ) ( not ( = ?auto_582835 ?auto_582837 ) ) ( not ( = ?auto_582835 ?auto_582836 ) ) ( not ( = ?auto_582835 ?auto_582838 ) ) ( not ( = ?auto_582835 ?auto_582839 ) ) ( not ( = ?auto_582835 ?auto_582840 ) ) ( not ( = ?auto_582835 ?auto_582841 ) ) ( not ( = ?auto_582835 ?auto_582842 ) ) ( not ( = ?auto_582835 ?auto_582843 ) ) ( not ( = ?auto_582835 ?auto_582844 ) ) ( not ( = ?auto_582835 ?auto_582848 ) ) ( not ( = ?auto_582837 ?auto_582836 ) ) ( not ( = ?auto_582837 ?auto_582838 ) ) ( not ( = ?auto_582837 ?auto_582839 ) ) ( not ( = ?auto_582837 ?auto_582840 ) ) ( not ( = ?auto_582837 ?auto_582841 ) ) ( not ( = ?auto_582837 ?auto_582842 ) ) ( not ( = ?auto_582837 ?auto_582843 ) ) ( not ( = ?auto_582837 ?auto_582844 ) ) ( not ( = ?auto_582837 ?auto_582848 ) ) ( not ( = ?auto_582836 ?auto_582838 ) ) ( not ( = ?auto_582836 ?auto_582839 ) ) ( not ( = ?auto_582836 ?auto_582840 ) ) ( not ( = ?auto_582836 ?auto_582841 ) ) ( not ( = ?auto_582836 ?auto_582842 ) ) ( not ( = ?auto_582836 ?auto_582843 ) ) ( not ( = ?auto_582836 ?auto_582844 ) ) ( not ( = ?auto_582836 ?auto_582848 ) ) ( not ( = ?auto_582838 ?auto_582839 ) ) ( not ( = ?auto_582838 ?auto_582840 ) ) ( not ( = ?auto_582838 ?auto_582841 ) ) ( not ( = ?auto_582838 ?auto_582842 ) ) ( not ( = ?auto_582838 ?auto_582843 ) ) ( not ( = ?auto_582838 ?auto_582844 ) ) ( not ( = ?auto_582838 ?auto_582848 ) ) ( not ( = ?auto_582839 ?auto_582840 ) ) ( not ( = ?auto_582839 ?auto_582841 ) ) ( not ( = ?auto_582839 ?auto_582842 ) ) ( not ( = ?auto_582839 ?auto_582843 ) ) ( not ( = ?auto_582839 ?auto_582844 ) ) ( not ( = ?auto_582839 ?auto_582848 ) ) ( not ( = ?auto_582840 ?auto_582841 ) ) ( not ( = ?auto_582840 ?auto_582842 ) ) ( not ( = ?auto_582840 ?auto_582843 ) ) ( not ( = ?auto_582840 ?auto_582844 ) ) ( not ( = ?auto_582840 ?auto_582848 ) ) ( not ( = ?auto_582841 ?auto_582842 ) ) ( not ( = ?auto_582841 ?auto_582843 ) ) ( not ( = ?auto_582841 ?auto_582844 ) ) ( not ( = ?auto_582841 ?auto_582848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_582842 ?auto_582843 ?auto_582844 )
      ( MAKE-11CRATE-VERIFY ?auto_582833 ?auto_582834 ?auto_582835 ?auto_582837 ?auto_582836 ?auto_582838 ?auto_582839 ?auto_582840 ?auto_582841 ?auto_582842 ?auto_582843 ?auto_582844 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_582977 - SURFACE
      ?auto_582978 - SURFACE
      ?auto_582979 - SURFACE
      ?auto_582981 - SURFACE
      ?auto_582980 - SURFACE
      ?auto_582982 - SURFACE
      ?auto_582983 - SURFACE
      ?auto_582984 - SURFACE
      ?auto_582985 - SURFACE
      ?auto_582986 - SURFACE
      ?auto_582987 - SURFACE
      ?auto_582988 - SURFACE
    )
    :vars
    (
      ?auto_582993 - HOIST
      ?auto_582992 - PLACE
      ?auto_582990 - PLACE
      ?auto_582989 - HOIST
      ?auto_582991 - SURFACE
      ?auto_582994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_582993 ?auto_582992 ) ( SURFACE-AT ?auto_582987 ?auto_582992 ) ( CLEAR ?auto_582987 ) ( IS-CRATE ?auto_582988 ) ( not ( = ?auto_582987 ?auto_582988 ) ) ( AVAILABLE ?auto_582993 ) ( ON ?auto_582987 ?auto_582986 ) ( not ( = ?auto_582986 ?auto_582987 ) ) ( not ( = ?auto_582986 ?auto_582988 ) ) ( not ( = ?auto_582990 ?auto_582992 ) ) ( HOIST-AT ?auto_582989 ?auto_582990 ) ( not ( = ?auto_582993 ?auto_582989 ) ) ( AVAILABLE ?auto_582989 ) ( SURFACE-AT ?auto_582988 ?auto_582990 ) ( ON ?auto_582988 ?auto_582991 ) ( CLEAR ?auto_582988 ) ( not ( = ?auto_582987 ?auto_582991 ) ) ( not ( = ?auto_582988 ?auto_582991 ) ) ( not ( = ?auto_582986 ?auto_582991 ) ) ( TRUCK-AT ?auto_582994 ?auto_582992 ) ( ON ?auto_582978 ?auto_582977 ) ( ON ?auto_582979 ?auto_582978 ) ( ON ?auto_582981 ?auto_582979 ) ( ON ?auto_582980 ?auto_582981 ) ( ON ?auto_582982 ?auto_582980 ) ( ON ?auto_582983 ?auto_582982 ) ( ON ?auto_582984 ?auto_582983 ) ( ON ?auto_582985 ?auto_582984 ) ( ON ?auto_582986 ?auto_582985 ) ( not ( = ?auto_582977 ?auto_582978 ) ) ( not ( = ?auto_582977 ?auto_582979 ) ) ( not ( = ?auto_582977 ?auto_582981 ) ) ( not ( = ?auto_582977 ?auto_582980 ) ) ( not ( = ?auto_582977 ?auto_582982 ) ) ( not ( = ?auto_582977 ?auto_582983 ) ) ( not ( = ?auto_582977 ?auto_582984 ) ) ( not ( = ?auto_582977 ?auto_582985 ) ) ( not ( = ?auto_582977 ?auto_582986 ) ) ( not ( = ?auto_582977 ?auto_582987 ) ) ( not ( = ?auto_582977 ?auto_582988 ) ) ( not ( = ?auto_582977 ?auto_582991 ) ) ( not ( = ?auto_582978 ?auto_582979 ) ) ( not ( = ?auto_582978 ?auto_582981 ) ) ( not ( = ?auto_582978 ?auto_582980 ) ) ( not ( = ?auto_582978 ?auto_582982 ) ) ( not ( = ?auto_582978 ?auto_582983 ) ) ( not ( = ?auto_582978 ?auto_582984 ) ) ( not ( = ?auto_582978 ?auto_582985 ) ) ( not ( = ?auto_582978 ?auto_582986 ) ) ( not ( = ?auto_582978 ?auto_582987 ) ) ( not ( = ?auto_582978 ?auto_582988 ) ) ( not ( = ?auto_582978 ?auto_582991 ) ) ( not ( = ?auto_582979 ?auto_582981 ) ) ( not ( = ?auto_582979 ?auto_582980 ) ) ( not ( = ?auto_582979 ?auto_582982 ) ) ( not ( = ?auto_582979 ?auto_582983 ) ) ( not ( = ?auto_582979 ?auto_582984 ) ) ( not ( = ?auto_582979 ?auto_582985 ) ) ( not ( = ?auto_582979 ?auto_582986 ) ) ( not ( = ?auto_582979 ?auto_582987 ) ) ( not ( = ?auto_582979 ?auto_582988 ) ) ( not ( = ?auto_582979 ?auto_582991 ) ) ( not ( = ?auto_582981 ?auto_582980 ) ) ( not ( = ?auto_582981 ?auto_582982 ) ) ( not ( = ?auto_582981 ?auto_582983 ) ) ( not ( = ?auto_582981 ?auto_582984 ) ) ( not ( = ?auto_582981 ?auto_582985 ) ) ( not ( = ?auto_582981 ?auto_582986 ) ) ( not ( = ?auto_582981 ?auto_582987 ) ) ( not ( = ?auto_582981 ?auto_582988 ) ) ( not ( = ?auto_582981 ?auto_582991 ) ) ( not ( = ?auto_582980 ?auto_582982 ) ) ( not ( = ?auto_582980 ?auto_582983 ) ) ( not ( = ?auto_582980 ?auto_582984 ) ) ( not ( = ?auto_582980 ?auto_582985 ) ) ( not ( = ?auto_582980 ?auto_582986 ) ) ( not ( = ?auto_582980 ?auto_582987 ) ) ( not ( = ?auto_582980 ?auto_582988 ) ) ( not ( = ?auto_582980 ?auto_582991 ) ) ( not ( = ?auto_582982 ?auto_582983 ) ) ( not ( = ?auto_582982 ?auto_582984 ) ) ( not ( = ?auto_582982 ?auto_582985 ) ) ( not ( = ?auto_582982 ?auto_582986 ) ) ( not ( = ?auto_582982 ?auto_582987 ) ) ( not ( = ?auto_582982 ?auto_582988 ) ) ( not ( = ?auto_582982 ?auto_582991 ) ) ( not ( = ?auto_582983 ?auto_582984 ) ) ( not ( = ?auto_582983 ?auto_582985 ) ) ( not ( = ?auto_582983 ?auto_582986 ) ) ( not ( = ?auto_582983 ?auto_582987 ) ) ( not ( = ?auto_582983 ?auto_582988 ) ) ( not ( = ?auto_582983 ?auto_582991 ) ) ( not ( = ?auto_582984 ?auto_582985 ) ) ( not ( = ?auto_582984 ?auto_582986 ) ) ( not ( = ?auto_582984 ?auto_582987 ) ) ( not ( = ?auto_582984 ?auto_582988 ) ) ( not ( = ?auto_582984 ?auto_582991 ) ) ( not ( = ?auto_582985 ?auto_582986 ) ) ( not ( = ?auto_582985 ?auto_582987 ) ) ( not ( = ?auto_582985 ?auto_582988 ) ) ( not ( = ?auto_582985 ?auto_582991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_582986 ?auto_582987 ?auto_582988 )
      ( MAKE-11CRATE-VERIFY ?auto_582977 ?auto_582978 ?auto_582979 ?auto_582981 ?auto_582980 ?auto_582982 ?auto_582983 ?auto_582984 ?auto_582985 ?auto_582986 ?auto_582987 ?auto_582988 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583121 - SURFACE
      ?auto_583122 - SURFACE
      ?auto_583123 - SURFACE
      ?auto_583125 - SURFACE
      ?auto_583124 - SURFACE
      ?auto_583126 - SURFACE
      ?auto_583127 - SURFACE
      ?auto_583128 - SURFACE
      ?auto_583129 - SURFACE
      ?auto_583130 - SURFACE
      ?auto_583131 - SURFACE
      ?auto_583132 - SURFACE
    )
    :vars
    (
      ?auto_583134 - HOIST
      ?auto_583133 - PLACE
      ?auto_583135 - PLACE
      ?auto_583136 - HOIST
      ?auto_583138 - SURFACE
      ?auto_583137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583134 ?auto_583133 ) ( IS-CRATE ?auto_583132 ) ( not ( = ?auto_583131 ?auto_583132 ) ) ( not ( = ?auto_583130 ?auto_583131 ) ) ( not ( = ?auto_583130 ?auto_583132 ) ) ( not ( = ?auto_583135 ?auto_583133 ) ) ( HOIST-AT ?auto_583136 ?auto_583135 ) ( not ( = ?auto_583134 ?auto_583136 ) ) ( AVAILABLE ?auto_583136 ) ( SURFACE-AT ?auto_583132 ?auto_583135 ) ( ON ?auto_583132 ?auto_583138 ) ( CLEAR ?auto_583132 ) ( not ( = ?auto_583131 ?auto_583138 ) ) ( not ( = ?auto_583132 ?auto_583138 ) ) ( not ( = ?auto_583130 ?auto_583138 ) ) ( TRUCK-AT ?auto_583137 ?auto_583133 ) ( SURFACE-AT ?auto_583130 ?auto_583133 ) ( CLEAR ?auto_583130 ) ( LIFTING ?auto_583134 ?auto_583131 ) ( IS-CRATE ?auto_583131 ) ( ON ?auto_583122 ?auto_583121 ) ( ON ?auto_583123 ?auto_583122 ) ( ON ?auto_583125 ?auto_583123 ) ( ON ?auto_583124 ?auto_583125 ) ( ON ?auto_583126 ?auto_583124 ) ( ON ?auto_583127 ?auto_583126 ) ( ON ?auto_583128 ?auto_583127 ) ( ON ?auto_583129 ?auto_583128 ) ( ON ?auto_583130 ?auto_583129 ) ( not ( = ?auto_583121 ?auto_583122 ) ) ( not ( = ?auto_583121 ?auto_583123 ) ) ( not ( = ?auto_583121 ?auto_583125 ) ) ( not ( = ?auto_583121 ?auto_583124 ) ) ( not ( = ?auto_583121 ?auto_583126 ) ) ( not ( = ?auto_583121 ?auto_583127 ) ) ( not ( = ?auto_583121 ?auto_583128 ) ) ( not ( = ?auto_583121 ?auto_583129 ) ) ( not ( = ?auto_583121 ?auto_583130 ) ) ( not ( = ?auto_583121 ?auto_583131 ) ) ( not ( = ?auto_583121 ?auto_583132 ) ) ( not ( = ?auto_583121 ?auto_583138 ) ) ( not ( = ?auto_583122 ?auto_583123 ) ) ( not ( = ?auto_583122 ?auto_583125 ) ) ( not ( = ?auto_583122 ?auto_583124 ) ) ( not ( = ?auto_583122 ?auto_583126 ) ) ( not ( = ?auto_583122 ?auto_583127 ) ) ( not ( = ?auto_583122 ?auto_583128 ) ) ( not ( = ?auto_583122 ?auto_583129 ) ) ( not ( = ?auto_583122 ?auto_583130 ) ) ( not ( = ?auto_583122 ?auto_583131 ) ) ( not ( = ?auto_583122 ?auto_583132 ) ) ( not ( = ?auto_583122 ?auto_583138 ) ) ( not ( = ?auto_583123 ?auto_583125 ) ) ( not ( = ?auto_583123 ?auto_583124 ) ) ( not ( = ?auto_583123 ?auto_583126 ) ) ( not ( = ?auto_583123 ?auto_583127 ) ) ( not ( = ?auto_583123 ?auto_583128 ) ) ( not ( = ?auto_583123 ?auto_583129 ) ) ( not ( = ?auto_583123 ?auto_583130 ) ) ( not ( = ?auto_583123 ?auto_583131 ) ) ( not ( = ?auto_583123 ?auto_583132 ) ) ( not ( = ?auto_583123 ?auto_583138 ) ) ( not ( = ?auto_583125 ?auto_583124 ) ) ( not ( = ?auto_583125 ?auto_583126 ) ) ( not ( = ?auto_583125 ?auto_583127 ) ) ( not ( = ?auto_583125 ?auto_583128 ) ) ( not ( = ?auto_583125 ?auto_583129 ) ) ( not ( = ?auto_583125 ?auto_583130 ) ) ( not ( = ?auto_583125 ?auto_583131 ) ) ( not ( = ?auto_583125 ?auto_583132 ) ) ( not ( = ?auto_583125 ?auto_583138 ) ) ( not ( = ?auto_583124 ?auto_583126 ) ) ( not ( = ?auto_583124 ?auto_583127 ) ) ( not ( = ?auto_583124 ?auto_583128 ) ) ( not ( = ?auto_583124 ?auto_583129 ) ) ( not ( = ?auto_583124 ?auto_583130 ) ) ( not ( = ?auto_583124 ?auto_583131 ) ) ( not ( = ?auto_583124 ?auto_583132 ) ) ( not ( = ?auto_583124 ?auto_583138 ) ) ( not ( = ?auto_583126 ?auto_583127 ) ) ( not ( = ?auto_583126 ?auto_583128 ) ) ( not ( = ?auto_583126 ?auto_583129 ) ) ( not ( = ?auto_583126 ?auto_583130 ) ) ( not ( = ?auto_583126 ?auto_583131 ) ) ( not ( = ?auto_583126 ?auto_583132 ) ) ( not ( = ?auto_583126 ?auto_583138 ) ) ( not ( = ?auto_583127 ?auto_583128 ) ) ( not ( = ?auto_583127 ?auto_583129 ) ) ( not ( = ?auto_583127 ?auto_583130 ) ) ( not ( = ?auto_583127 ?auto_583131 ) ) ( not ( = ?auto_583127 ?auto_583132 ) ) ( not ( = ?auto_583127 ?auto_583138 ) ) ( not ( = ?auto_583128 ?auto_583129 ) ) ( not ( = ?auto_583128 ?auto_583130 ) ) ( not ( = ?auto_583128 ?auto_583131 ) ) ( not ( = ?auto_583128 ?auto_583132 ) ) ( not ( = ?auto_583128 ?auto_583138 ) ) ( not ( = ?auto_583129 ?auto_583130 ) ) ( not ( = ?auto_583129 ?auto_583131 ) ) ( not ( = ?auto_583129 ?auto_583132 ) ) ( not ( = ?auto_583129 ?auto_583138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583130 ?auto_583131 ?auto_583132 )
      ( MAKE-11CRATE-VERIFY ?auto_583121 ?auto_583122 ?auto_583123 ?auto_583125 ?auto_583124 ?auto_583126 ?auto_583127 ?auto_583128 ?auto_583129 ?auto_583130 ?auto_583131 ?auto_583132 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_583265 - SURFACE
      ?auto_583266 - SURFACE
      ?auto_583267 - SURFACE
      ?auto_583269 - SURFACE
      ?auto_583268 - SURFACE
      ?auto_583270 - SURFACE
      ?auto_583271 - SURFACE
      ?auto_583272 - SURFACE
      ?auto_583273 - SURFACE
      ?auto_583274 - SURFACE
      ?auto_583275 - SURFACE
      ?auto_583276 - SURFACE
    )
    :vars
    (
      ?auto_583279 - HOIST
      ?auto_583277 - PLACE
      ?auto_583281 - PLACE
      ?auto_583280 - HOIST
      ?auto_583278 - SURFACE
      ?auto_583282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_583279 ?auto_583277 ) ( IS-CRATE ?auto_583276 ) ( not ( = ?auto_583275 ?auto_583276 ) ) ( not ( = ?auto_583274 ?auto_583275 ) ) ( not ( = ?auto_583274 ?auto_583276 ) ) ( not ( = ?auto_583281 ?auto_583277 ) ) ( HOIST-AT ?auto_583280 ?auto_583281 ) ( not ( = ?auto_583279 ?auto_583280 ) ) ( AVAILABLE ?auto_583280 ) ( SURFACE-AT ?auto_583276 ?auto_583281 ) ( ON ?auto_583276 ?auto_583278 ) ( CLEAR ?auto_583276 ) ( not ( = ?auto_583275 ?auto_583278 ) ) ( not ( = ?auto_583276 ?auto_583278 ) ) ( not ( = ?auto_583274 ?auto_583278 ) ) ( TRUCK-AT ?auto_583282 ?auto_583277 ) ( SURFACE-AT ?auto_583274 ?auto_583277 ) ( CLEAR ?auto_583274 ) ( IS-CRATE ?auto_583275 ) ( AVAILABLE ?auto_583279 ) ( IN ?auto_583275 ?auto_583282 ) ( ON ?auto_583266 ?auto_583265 ) ( ON ?auto_583267 ?auto_583266 ) ( ON ?auto_583269 ?auto_583267 ) ( ON ?auto_583268 ?auto_583269 ) ( ON ?auto_583270 ?auto_583268 ) ( ON ?auto_583271 ?auto_583270 ) ( ON ?auto_583272 ?auto_583271 ) ( ON ?auto_583273 ?auto_583272 ) ( ON ?auto_583274 ?auto_583273 ) ( not ( = ?auto_583265 ?auto_583266 ) ) ( not ( = ?auto_583265 ?auto_583267 ) ) ( not ( = ?auto_583265 ?auto_583269 ) ) ( not ( = ?auto_583265 ?auto_583268 ) ) ( not ( = ?auto_583265 ?auto_583270 ) ) ( not ( = ?auto_583265 ?auto_583271 ) ) ( not ( = ?auto_583265 ?auto_583272 ) ) ( not ( = ?auto_583265 ?auto_583273 ) ) ( not ( = ?auto_583265 ?auto_583274 ) ) ( not ( = ?auto_583265 ?auto_583275 ) ) ( not ( = ?auto_583265 ?auto_583276 ) ) ( not ( = ?auto_583265 ?auto_583278 ) ) ( not ( = ?auto_583266 ?auto_583267 ) ) ( not ( = ?auto_583266 ?auto_583269 ) ) ( not ( = ?auto_583266 ?auto_583268 ) ) ( not ( = ?auto_583266 ?auto_583270 ) ) ( not ( = ?auto_583266 ?auto_583271 ) ) ( not ( = ?auto_583266 ?auto_583272 ) ) ( not ( = ?auto_583266 ?auto_583273 ) ) ( not ( = ?auto_583266 ?auto_583274 ) ) ( not ( = ?auto_583266 ?auto_583275 ) ) ( not ( = ?auto_583266 ?auto_583276 ) ) ( not ( = ?auto_583266 ?auto_583278 ) ) ( not ( = ?auto_583267 ?auto_583269 ) ) ( not ( = ?auto_583267 ?auto_583268 ) ) ( not ( = ?auto_583267 ?auto_583270 ) ) ( not ( = ?auto_583267 ?auto_583271 ) ) ( not ( = ?auto_583267 ?auto_583272 ) ) ( not ( = ?auto_583267 ?auto_583273 ) ) ( not ( = ?auto_583267 ?auto_583274 ) ) ( not ( = ?auto_583267 ?auto_583275 ) ) ( not ( = ?auto_583267 ?auto_583276 ) ) ( not ( = ?auto_583267 ?auto_583278 ) ) ( not ( = ?auto_583269 ?auto_583268 ) ) ( not ( = ?auto_583269 ?auto_583270 ) ) ( not ( = ?auto_583269 ?auto_583271 ) ) ( not ( = ?auto_583269 ?auto_583272 ) ) ( not ( = ?auto_583269 ?auto_583273 ) ) ( not ( = ?auto_583269 ?auto_583274 ) ) ( not ( = ?auto_583269 ?auto_583275 ) ) ( not ( = ?auto_583269 ?auto_583276 ) ) ( not ( = ?auto_583269 ?auto_583278 ) ) ( not ( = ?auto_583268 ?auto_583270 ) ) ( not ( = ?auto_583268 ?auto_583271 ) ) ( not ( = ?auto_583268 ?auto_583272 ) ) ( not ( = ?auto_583268 ?auto_583273 ) ) ( not ( = ?auto_583268 ?auto_583274 ) ) ( not ( = ?auto_583268 ?auto_583275 ) ) ( not ( = ?auto_583268 ?auto_583276 ) ) ( not ( = ?auto_583268 ?auto_583278 ) ) ( not ( = ?auto_583270 ?auto_583271 ) ) ( not ( = ?auto_583270 ?auto_583272 ) ) ( not ( = ?auto_583270 ?auto_583273 ) ) ( not ( = ?auto_583270 ?auto_583274 ) ) ( not ( = ?auto_583270 ?auto_583275 ) ) ( not ( = ?auto_583270 ?auto_583276 ) ) ( not ( = ?auto_583270 ?auto_583278 ) ) ( not ( = ?auto_583271 ?auto_583272 ) ) ( not ( = ?auto_583271 ?auto_583273 ) ) ( not ( = ?auto_583271 ?auto_583274 ) ) ( not ( = ?auto_583271 ?auto_583275 ) ) ( not ( = ?auto_583271 ?auto_583276 ) ) ( not ( = ?auto_583271 ?auto_583278 ) ) ( not ( = ?auto_583272 ?auto_583273 ) ) ( not ( = ?auto_583272 ?auto_583274 ) ) ( not ( = ?auto_583272 ?auto_583275 ) ) ( not ( = ?auto_583272 ?auto_583276 ) ) ( not ( = ?auto_583272 ?auto_583278 ) ) ( not ( = ?auto_583273 ?auto_583274 ) ) ( not ( = ?auto_583273 ?auto_583275 ) ) ( not ( = ?auto_583273 ?auto_583276 ) ) ( not ( = ?auto_583273 ?auto_583278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_583274 ?auto_583275 ?auto_583276 )
      ( MAKE-11CRATE-VERIFY ?auto_583265 ?auto_583266 ?auto_583267 ?auto_583269 ?auto_583268 ?auto_583270 ?auto_583271 ?auto_583272 ?auto_583273 ?auto_583274 ?auto_583275 ?auto_583276 ) )
  )

)

