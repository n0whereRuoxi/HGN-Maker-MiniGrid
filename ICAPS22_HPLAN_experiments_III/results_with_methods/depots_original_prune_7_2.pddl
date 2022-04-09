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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72508 - SURFACE
      ?auto_72509 - SURFACE
    )
    :vars
    (
      ?auto_72510 - HOIST
      ?auto_72511 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72510 ?auto_72511 ) ( SURFACE-AT ?auto_72508 ?auto_72511 ) ( CLEAR ?auto_72508 ) ( LIFTING ?auto_72510 ?auto_72509 ) ( IS-CRATE ?auto_72509 ) ( not ( = ?auto_72508 ?auto_72509 ) ) )
    :subtasks
    ( ( !DROP ?auto_72510 ?auto_72509 ?auto_72508 ?auto_72511 )
      ( MAKE-1CRATE-VERIFY ?auto_72508 ?auto_72509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72512 - SURFACE
      ?auto_72513 - SURFACE
    )
    :vars
    (
      ?auto_72515 - HOIST
      ?auto_72514 - PLACE
      ?auto_72516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72515 ?auto_72514 ) ( SURFACE-AT ?auto_72512 ?auto_72514 ) ( CLEAR ?auto_72512 ) ( IS-CRATE ?auto_72513 ) ( not ( = ?auto_72512 ?auto_72513 ) ) ( TRUCK-AT ?auto_72516 ?auto_72514 ) ( AVAILABLE ?auto_72515 ) ( IN ?auto_72513 ?auto_72516 ) )
    :subtasks
    ( ( !UNLOAD ?auto_72515 ?auto_72513 ?auto_72516 ?auto_72514 )
      ( MAKE-1CRATE ?auto_72512 ?auto_72513 )
      ( MAKE-1CRATE-VERIFY ?auto_72512 ?auto_72513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72517 - SURFACE
      ?auto_72518 - SURFACE
    )
    :vars
    (
      ?auto_72521 - HOIST
      ?auto_72519 - PLACE
      ?auto_72520 - TRUCK
      ?auto_72522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72521 ?auto_72519 ) ( SURFACE-AT ?auto_72517 ?auto_72519 ) ( CLEAR ?auto_72517 ) ( IS-CRATE ?auto_72518 ) ( not ( = ?auto_72517 ?auto_72518 ) ) ( AVAILABLE ?auto_72521 ) ( IN ?auto_72518 ?auto_72520 ) ( TRUCK-AT ?auto_72520 ?auto_72522 ) ( not ( = ?auto_72522 ?auto_72519 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72520 ?auto_72522 ?auto_72519 )
      ( MAKE-1CRATE ?auto_72517 ?auto_72518 )
      ( MAKE-1CRATE-VERIFY ?auto_72517 ?auto_72518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72523 - SURFACE
      ?auto_72524 - SURFACE
    )
    :vars
    (
      ?auto_72526 - HOIST
      ?auto_72527 - PLACE
      ?auto_72525 - TRUCK
      ?auto_72528 - PLACE
      ?auto_72529 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72526 ?auto_72527 ) ( SURFACE-AT ?auto_72523 ?auto_72527 ) ( CLEAR ?auto_72523 ) ( IS-CRATE ?auto_72524 ) ( not ( = ?auto_72523 ?auto_72524 ) ) ( AVAILABLE ?auto_72526 ) ( TRUCK-AT ?auto_72525 ?auto_72528 ) ( not ( = ?auto_72528 ?auto_72527 ) ) ( HOIST-AT ?auto_72529 ?auto_72528 ) ( LIFTING ?auto_72529 ?auto_72524 ) ( not ( = ?auto_72526 ?auto_72529 ) ) )
    :subtasks
    ( ( !LOAD ?auto_72529 ?auto_72524 ?auto_72525 ?auto_72528 )
      ( MAKE-1CRATE ?auto_72523 ?auto_72524 )
      ( MAKE-1CRATE-VERIFY ?auto_72523 ?auto_72524 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72530 - SURFACE
      ?auto_72531 - SURFACE
    )
    :vars
    (
      ?auto_72535 - HOIST
      ?auto_72534 - PLACE
      ?auto_72536 - TRUCK
      ?auto_72533 - PLACE
      ?auto_72532 - HOIST
      ?auto_72537 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72535 ?auto_72534 ) ( SURFACE-AT ?auto_72530 ?auto_72534 ) ( CLEAR ?auto_72530 ) ( IS-CRATE ?auto_72531 ) ( not ( = ?auto_72530 ?auto_72531 ) ) ( AVAILABLE ?auto_72535 ) ( TRUCK-AT ?auto_72536 ?auto_72533 ) ( not ( = ?auto_72533 ?auto_72534 ) ) ( HOIST-AT ?auto_72532 ?auto_72533 ) ( not ( = ?auto_72535 ?auto_72532 ) ) ( AVAILABLE ?auto_72532 ) ( SURFACE-AT ?auto_72531 ?auto_72533 ) ( ON ?auto_72531 ?auto_72537 ) ( CLEAR ?auto_72531 ) ( not ( = ?auto_72530 ?auto_72537 ) ) ( not ( = ?auto_72531 ?auto_72537 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72532 ?auto_72531 ?auto_72537 ?auto_72533 )
      ( MAKE-1CRATE ?auto_72530 ?auto_72531 )
      ( MAKE-1CRATE-VERIFY ?auto_72530 ?auto_72531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72538 - SURFACE
      ?auto_72539 - SURFACE
    )
    :vars
    (
      ?auto_72540 - HOIST
      ?auto_72545 - PLACE
      ?auto_72543 - PLACE
      ?auto_72542 - HOIST
      ?auto_72541 - SURFACE
      ?auto_72544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72540 ?auto_72545 ) ( SURFACE-AT ?auto_72538 ?auto_72545 ) ( CLEAR ?auto_72538 ) ( IS-CRATE ?auto_72539 ) ( not ( = ?auto_72538 ?auto_72539 ) ) ( AVAILABLE ?auto_72540 ) ( not ( = ?auto_72543 ?auto_72545 ) ) ( HOIST-AT ?auto_72542 ?auto_72543 ) ( not ( = ?auto_72540 ?auto_72542 ) ) ( AVAILABLE ?auto_72542 ) ( SURFACE-AT ?auto_72539 ?auto_72543 ) ( ON ?auto_72539 ?auto_72541 ) ( CLEAR ?auto_72539 ) ( not ( = ?auto_72538 ?auto_72541 ) ) ( not ( = ?auto_72539 ?auto_72541 ) ) ( TRUCK-AT ?auto_72544 ?auto_72545 ) )
    :subtasks
    ( ( !DRIVE ?auto_72544 ?auto_72545 ?auto_72543 )
      ( MAKE-1CRATE ?auto_72538 ?auto_72539 )
      ( MAKE-1CRATE-VERIFY ?auto_72538 ?auto_72539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72555 - SURFACE
      ?auto_72556 - SURFACE
      ?auto_72557 - SURFACE
    )
    :vars
    (
      ?auto_72558 - HOIST
      ?auto_72559 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72558 ?auto_72559 ) ( SURFACE-AT ?auto_72556 ?auto_72559 ) ( CLEAR ?auto_72556 ) ( LIFTING ?auto_72558 ?auto_72557 ) ( IS-CRATE ?auto_72557 ) ( not ( = ?auto_72556 ?auto_72557 ) ) ( ON ?auto_72556 ?auto_72555 ) ( not ( = ?auto_72555 ?auto_72556 ) ) ( not ( = ?auto_72555 ?auto_72557 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72556 ?auto_72557 )
      ( MAKE-2CRATE-VERIFY ?auto_72555 ?auto_72556 ?auto_72557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72565 - SURFACE
      ?auto_72566 - SURFACE
      ?auto_72567 - SURFACE
    )
    :vars
    (
      ?auto_72570 - HOIST
      ?auto_72568 - PLACE
      ?auto_72569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72570 ?auto_72568 ) ( SURFACE-AT ?auto_72566 ?auto_72568 ) ( CLEAR ?auto_72566 ) ( IS-CRATE ?auto_72567 ) ( not ( = ?auto_72566 ?auto_72567 ) ) ( TRUCK-AT ?auto_72569 ?auto_72568 ) ( AVAILABLE ?auto_72570 ) ( IN ?auto_72567 ?auto_72569 ) ( ON ?auto_72566 ?auto_72565 ) ( not ( = ?auto_72565 ?auto_72566 ) ) ( not ( = ?auto_72565 ?auto_72567 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72566 ?auto_72567 )
      ( MAKE-2CRATE-VERIFY ?auto_72565 ?auto_72566 ?auto_72567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72571 - SURFACE
      ?auto_72572 - SURFACE
    )
    :vars
    (
      ?auto_72576 - HOIST
      ?auto_72575 - PLACE
      ?auto_72574 - TRUCK
      ?auto_72573 - SURFACE
      ?auto_72577 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72576 ?auto_72575 ) ( SURFACE-AT ?auto_72571 ?auto_72575 ) ( CLEAR ?auto_72571 ) ( IS-CRATE ?auto_72572 ) ( not ( = ?auto_72571 ?auto_72572 ) ) ( AVAILABLE ?auto_72576 ) ( IN ?auto_72572 ?auto_72574 ) ( ON ?auto_72571 ?auto_72573 ) ( not ( = ?auto_72573 ?auto_72571 ) ) ( not ( = ?auto_72573 ?auto_72572 ) ) ( TRUCK-AT ?auto_72574 ?auto_72577 ) ( not ( = ?auto_72577 ?auto_72575 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72574 ?auto_72577 ?auto_72575 )
      ( MAKE-2CRATE ?auto_72573 ?auto_72571 ?auto_72572 )
      ( MAKE-1CRATE-VERIFY ?auto_72571 ?auto_72572 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72578 - SURFACE
      ?auto_72579 - SURFACE
      ?auto_72580 - SURFACE
    )
    :vars
    (
      ?auto_72582 - HOIST
      ?auto_72584 - PLACE
      ?auto_72581 - TRUCK
      ?auto_72583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72582 ?auto_72584 ) ( SURFACE-AT ?auto_72579 ?auto_72584 ) ( CLEAR ?auto_72579 ) ( IS-CRATE ?auto_72580 ) ( not ( = ?auto_72579 ?auto_72580 ) ) ( AVAILABLE ?auto_72582 ) ( IN ?auto_72580 ?auto_72581 ) ( ON ?auto_72579 ?auto_72578 ) ( not ( = ?auto_72578 ?auto_72579 ) ) ( not ( = ?auto_72578 ?auto_72580 ) ) ( TRUCK-AT ?auto_72581 ?auto_72583 ) ( not ( = ?auto_72583 ?auto_72584 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72579 ?auto_72580 )
      ( MAKE-2CRATE-VERIFY ?auto_72578 ?auto_72579 ?auto_72580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72585 - SURFACE
      ?auto_72586 - SURFACE
    )
    :vars
    (
      ?auto_72588 - HOIST
      ?auto_72589 - PLACE
      ?auto_72591 - SURFACE
      ?auto_72590 - TRUCK
      ?auto_72587 - PLACE
      ?auto_72592 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72588 ?auto_72589 ) ( SURFACE-AT ?auto_72585 ?auto_72589 ) ( CLEAR ?auto_72585 ) ( IS-CRATE ?auto_72586 ) ( not ( = ?auto_72585 ?auto_72586 ) ) ( AVAILABLE ?auto_72588 ) ( ON ?auto_72585 ?auto_72591 ) ( not ( = ?auto_72591 ?auto_72585 ) ) ( not ( = ?auto_72591 ?auto_72586 ) ) ( TRUCK-AT ?auto_72590 ?auto_72587 ) ( not ( = ?auto_72587 ?auto_72589 ) ) ( HOIST-AT ?auto_72592 ?auto_72587 ) ( LIFTING ?auto_72592 ?auto_72586 ) ( not ( = ?auto_72588 ?auto_72592 ) ) )
    :subtasks
    ( ( !LOAD ?auto_72592 ?auto_72586 ?auto_72590 ?auto_72587 )
      ( MAKE-2CRATE ?auto_72591 ?auto_72585 ?auto_72586 )
      ( MAKE-1CRATE-VERIFY ?auto_72585 ?auto_72586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72593 - SURFACE
      ?auto_72594 - SURFACE
      ?auto_72595 - SURFACE
    )
    :vars
    (
      ?auto_72597 - HOIST
      ?auto_72600 - PLACE
      ?auto_72599 - TRUCK
      ?auto_72598 - PLACE
      ?auto_72596 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72597 ?auto_72600 ) ( SURFACE-AT ?auto_72594 ?auto_72600 ) ( CLEAR ?auto_72594 ) ( IS-CRATE ?auto_72595 ) ( not ( = ?auto_72594 ?auto_72595 ) ) ( AVAILABLE ?auto_72597 ) ( ON ?auto_72594 ?auto_72593 ) ( not ( = ?auto_72593 ?auto_72594 ) ) ( not ( = ?auto_72593 ?auto_72595 ) ) ( TRUCK-AT ?auto_72599 ?auto_72598 ) ( not ( = ?auto_72598 ?auto_72600 ) ) ( HOIST-AT ?auto_72596 ?auto_72598 ) ( LIFTING ?auto_72596 ?auto_72595 ) ( not ( = ?auto_72597 ?auto_72596 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72594 ?auto_72595 )
      ( MAKE-2CRATE-VERIFY ?auto_72593 ?auto_72594 ?auto_72595 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72601 - SURFACE
      ?auto_72602 - SURFACE
    )
    :vars
    (
      ?auto_72606 - HOIST
      ?auto_72603 - PLACE
      ?auto_72604 - SURFACE
      ?auto_72607 - TRUCK
      ?auto_72605 - PLACE
      ?auto_72608 - HOIST
      ?auto_72609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72606 ?auto_72603 ) ( SURFACE-AT ?auto_72601 ?auto_72603 ) ( CLEAR ?auto_72601 ) ( IS-CRATE ?auto_72602 ) ( not ( = ?auto_72601 ?auto_72602 ) ) ( AVAILABLE ?auto_72606 ) ( ON ?auto_72601 ?auto_72604 ) ( not ( = ?auto_72604 ?auto_72601 ) ) ( not ( = ?auto_72604 ?auto_72602 ) ) ( TRUCK-AT ?auto_72607 ?auto_72605 ) ( not ( = ?auto_72605 ?auto_72603 ) ) ( HOIST-AT ?auto_72608 ?auto_72605 ) ( not ( = ?auto_72606 ?auto_72608 ) ) ( AVAILABLE ?auto_72608 ) ( SURFACE-AT ?auto_72602 ?auto_72605 ) ( ON ?auto_72602 ?auto_72609 ) ( CLEAR ?auto_72602 ) ( not ( = ?auto_72601 ?auto_72609 ) ) ( not ( = ?auto_72602 ?auto_72609 ) ) ( not ( = ?auto_72604 ?auto_72609 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72608 ?auto_72602 ?auto_72609 ?auto_72605 )
      ( MAKE-2CRATE ?auto_72604 ?auto_72601 ?auto_72602 )
      ( MAKE-1CRATE-VERIFY ?auto_72601 ?auto_72602 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72610 - SURFACE
      ?auto_72611 - SURFACE
      ?auto_72612 - SURFACE
    )
    :vars
    (
      ?auto_72614 - HOIST
      ?auto_72615 - PLACE
      ?auto_72617 - TRUCK
      ?auto_72616 - PLACE
      ?auto_72618 - HOIST
      ?auto_72613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72614 ?auto_72615 ) ( SURFACE-AT ?auto_72611 ?auto_72615 ) ( CLEAR ?auto_72611 ) ( IS-CRATE ?auto_72612 ) ( not ( = ?auto_72611 ?auto_72612 ) ) ( AVAILABLE ?auto_72614 ) ( ON ?auto_72611 ?auto_72610 ) ( not ( = ?auto_72610 ?auto_72611 ) ) ( not ( = ?auto_72610 ?auto_72612 ) ) ( TRUCK-AT ?auto_72617 ?auto_72616 ) ( not ( = ?auto_72616 ?auto_72615 ) ) ( HOIST-AT ?auto_72618 ?auto_72616 ) ( not ( = ?auto_72614 ?auto_72618 ) ) ( AVAILABLE ?auto_72618 ) ( SURFACE-AT ?auto_72612 ?auto_72616 ) ( ON ?auto_72612 ?auto_72613 ) ( CLEAR ?auto_72612 ) ( not ( = ?auto_72611 ?auto_72613 ) ) ( not ( = ?auto_72612 ?auto_72613 ) ) ( not ( = ?auto_72610 ?auto_72613 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72611 ?auto_72612 )
      ( MAKE-2CRATE-VERIFY ?auto_72610 ?auto_72611 ?auto_72612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72619 - SURFACE
      ?auto_72620 - SURFACE
    )
    :vars
    (
      ?auto_72627 - HOIST
      ?auto_72624 - PLACE
      ?auto_72622 - SURFACE
      ?auto_72626 - PLACE
      ?auto_72625 - HOIST
      ?auto_72623 - SURFACE
      ?auto_72621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72627 ?auto_72624 ) ( SURFACE-AT ?auto_72619 ?auto_72624 ) ( CLEAR ?auto_72619 ) ( IS-CRATE ?auto_72620 ) ( not ( = ?auto_72619 ?auto_72620 ) ) ( AVAILABLE ?auto_72627 ) ( ON ?auto_72619 ?auto_72622 ) ( not ( = ?auto_72622 ?auto_72619 ) ) ( not ( = ?auto_72622 ?auto_72620 ) ) ( not ( = ?auto_72626 ?auto_72624 ) ) ( HOIST-AT ?auto_72625 ?auto_72626 ) ( not ( = ?auto_72627 ?auto_72625 ) ) ( AVAILABLE ?auto_72625 ) ( SURFACE-AT ?auto_72620 ?auto_72626 ) ( ON ?auto_72620 ?auto_72623 ) ( CLEAR ?auto_72620 ) ( not ( = ?auto_72619 ?auto_72623 ) ) ( not ( = ?auto_72620 ?auto_72623 ) ) ( not ( = ?auto_72622 ?auto_72623 ) ) ( TRUCK-AT ?auto_72621 ?auto_72624 ) )
    :subtasks
    ( ( !DRIVE ?auto_72621 ?auto_72624 ?auto_72626 )
      ( MAKE-2CRATE ?auto_72622 ?auto_72619 ?auto_72620 )
      ( MAKE-1CRATE-VERIFY ?auto_72619 ?auto_72620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72628 - SURFACE
      ?auto_72629 - SURFACE
      ?auto_72630 - SURFACE
    )
    :vars
    (
      ?auto_72636 - HOIST
      ?auto_72632 - PLACE
      ?auto_72633 - PLACE
      ?auto_72635 - HOIST
      ?auto_72634 - SURFACE
      ?auto_72631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72636 ?auto_72632 ) ( SURFACE-AT ?auto_72629 ?auto_72632 ) ( CLEAR ?auto_72629 ) ( IS-CRATE ?auto_72630 ) ( not ( = ?auto_72629 ?auto_72630 ) ) ( AVAILABLE ?auto_72636 ) ( ON ?auto_72629 ?auto_72628 ) ( not ( = ?auto_72628 ?auto_72629 ) ) ( not ( = ?auto_72628 ?auto_72630 ) ) ( not ( = ?auto_72633 ?auto_72632 ) ) ( HOIST-AT ?auto_72635 ?auto_72633 ) ( not ( = ?auto_72636 ?auto_72635 ) ) ( AVAILABLE ?auto_72635 ) ( SURFACE-AT ?auto_72630 ?auto_72633 ) ( ON ?auto_72630 ?auto_72634 ) ( CLEAR ?auto_72630 ) ( not ( = ?auto_72629 ?auto_72634 ) ) ( not ( = ?auto_72630 ?auto_72634 ) ) ( not ( = ?auto_72628 ?auto_72634 ) ) ( TRUCK-AT ?auto_72631 ?auto_72632 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72629 ?auto_72630 )
      ( MAKE-2CRATE-VERIFY ?auto_72628 ?auto_72629 ?auto_72630 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72637 - SURFACE
      ?auto_72638 - SURFACE
    )
    :vars
    (
      ?auto_72642 - HOIST
      ?auto_72643 - PLACE
      ?auto_72644 - SURFACE
      ?auto_72645 - PLACE
      ?auto_72641 - HOIST
      ?auto_72639 - SURFACE
      ?auto_72640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72642 ?auto_72643 ) ( IS-CRATE ?auto_72638 ) ( not ( = ?auto_72637 ?auto_72638 ) ) ( not ( = ?auto_72644 ?auto_72637 ) ) ( not ( = ?auto_72644 ?auto_72638 ) ) ( not ( = ?auto_72645 ?auto_72643 ) ) ( HOIST-AT ?auto_72641 ?auto_72645 ) ( not ( = ?auto_72642 ?auto_72641 ) ) ( AVAILABLE ?auto_72641 ) ( SURFACE-AT ?auto_72638 ?auto_72645 ) ( ON ?auto_72638 ?auto_72639 ) ( CLEAR ?auto_72638 ) ( not ( = ?auto_72637 ?auto_72639 ) ) ( not ( = ?auto_72638 ?auto_72639 ) ) ( not ( = ?auto_72644 ?auto_72639 ) ) ( TRUCK-AT ?auto_72640 ?auto_72643 ) ( SURFACE-AT ?auto_72644 ?auto_72643 ) ( CLEAR ?auto_72644 ) ( LIFTING ?auto_72642 ?auto_72637 ) ( IS-CRATE ?auto_72637 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72644 ?auto_72637 )
      ( MAKE-2CRATE ?auto_72644 ?auto_72637 ?auto_72638 )
      ( MAKE-1CRATE-VERIFY ?auto_72637 ?auto_72638 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72646 - SURFACE
      ?auto_72647 - SURFACE
      ?auto_72648 - SURFACE
    )
    :vars
    (
      ?auto_72653 - HOIST
      ?auto_72654 - PLACE
      ?auto_72651 - PLACE
      ?auto_72652 - HOIST
      ?auto_72649 - SURFACE
      ?auto_72650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72653 ?auto_72654 ) ( IS-CRATE ?auto_72648 ) ( not ( = ?auto_72647 ?auto_72648 ) ) ( not ( = ?auto_72646 ?auto_72647 ) ) ( not ( = ?auto_72646 ?auto_72648 ) ) ( not ( = ?auto_72651 ?auto_72654 ) ) ( HOIST-AT ?auto_72652 ?auto_72651 ) ( not ( = ?auto_72653 ?auto_72652 ) ) ( AVAILABLE ?auto_72652 ) ( SURFACE-AT ?auto_72648 ?auto_72651 ) ( ON ?auto_72648 ?auto_72649 ) ( CLEAR ?auto_72648 ) ( not ( = ?auto_72647 ?auto_72649 ) ) ( not ( = ?auto_72648 ?auto_72649 ) ) ( not ( = ?auto_72646 ?auto_72649 ) ) ( TRUCK-AT ?auto_72650 ?auto_72654 ) ( SURFACE-AT ?auto_72646 ?auto_72654 ) ( CLEAR ?auto_72646 ) ( LIFTING ?auto_72653 ?auto_72647 ) ( IS-CRATE ?auto_72647 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72647 ?auto_72648 )
      ( MAKE-2CRATE-VERIFY ?auto_72646 ?auto_72647 ?auto_72648 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72655 - SURFACE
      ?auto_72656 - SURFACE
    )
    :vars
    (
      ?auto_72662 - HOIST
      ?auto_72658 - PLACE
      ?auto_72657 - SURFACE
      ?auto_72659 - PLACE
      ?auto_72663 - HOIST
      ?auto_72661 - SURFACE
      ?auto_72660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72662 ?auto_72658 ) ( IS-CRATE ?auto_72656 ) ( not ( = ?auto_72655 ?auto_72656 ) ) ( not ( = ?auto_72657 ?auto_72655 ) ) ( not ( = ?auto_72657 ?auto_72656 ) ) ( not ( = ?auto_72659 ?auto_72658 ) ) ( HOIST-AT ?auto_72663 ?auto_72659 ) ( not ( = ?auto_72662 ?auto_72663 ) ) ( AVAILABLE ?auto_72663 ) ( SURFACE-AT ?auto_72656 ?auto_72659 ) ( ON ?auto_72656 ?auto_72661 ) ( CLEAR ?auto_72656 ) ( not ( = ?auto_72655 ?auto_72661 ) ) ( not ( = ?auto_72656 ?auto_72661 ) ) ( not ( = ?auto_72657 ?auto_72661 ) ) ( TRUCK-AT ?auto_72660 ?auto_72658 ) ( SURFACE-AT ?auto_72657 ?auto_72658 ) ( CLEAR ?auto_72657 ) ( IS-CRATE ?auto_72655 ) ( AVAILABLE ?auto_72662 ) ( IN ?auto_72655 ?auto_72660 ) )
    :subtasks
    ( ( !UNLOAD ?auto_72662 ?auto_72655 ?auto_72660 ?auto_72658 )
      ( MAKE-2CRATE ?auto_72657 ?auto_72655 ?auto_72656 )
      ( MAKE-1CRATE-VERIFY ?auto_72655 ?auto_72656 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72664 - SURFACE
      ?auto_72665 - SURFACE
      ?auto_72666 - SURFACE
    )
    :vars
    (
      ?auto_72672 - HOIST
      ?auto_72670 - PLACE
      ?auto_72669 - PLACE
      ?auto_72667 - HOIST
      ?auto_72668 - SURFACE
      ?auto_72671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72672 ?auto_72670 ) ( IS-CRATE ?auto_72666 ) ( not ( = ?auto_72665 ?auto_72666 ) ) ( not ( = ?auto_72664 ?auto_72665 ) ) ( not ( = ?auto_72664 ?auto_72666 ) ) ( not ( = ?auto_72669 ?auto_72670 ) ) ( HOIST-AT ?auto_72667 ?auto_72669 ) ( not ( = ?auto_72672 ?auto_72667 ) ) ( AVAILABLE ?auto_72667 ) ( SURFACE-AT ?auto_72666 ?auto_72669 ) ( ON ?auto_72666 ?auto_72668 ) ( CLEAR ?auto_72666 ) ( not ( = ?auto_72665 ?auto_72668 ) ) ( not ( = ?auto_72666 ?auto_72668 ) ) ( not ( = ?auto_72664 ?auto_72668 ) ) ( TRUCK-AT ?auto_72671 ?auto_72670 ) ( SURFACE-AT ?auto_72664 ?auto_72670 ) ( CLEAR ?auto_72664 ) ( IS-CRATE ?auto_72665 ) ( AVAILABLE ?auto_72672 ) ( IN ?auto_72665 ?auto_72671 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72665 ?auto_72666 )
      ( MAKE-2CRATE-VERIFY ?auto_72664 ?auto_72665 ?auto_72666 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72709 - SURFACE
      ?auto_72710 - SURFACE
    )
    :vars
    (
      ?auto_72711 - HOIST
      ?auto_72712 - PLACE
      ?auto_72713 - SURFACE
      ?auto_72715 - PLACE
      ?auto_72717 - HOIST
      ?auto_72716 - SURFACE
      ?auto_72714 - TRUCK
      ?auto_72718 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72711 ?auto_72712 ) ( SURFACE-AT ?auto_72709 ?auto_72712 ) ( CLEAR ?auto_72709 ) ( IS-CRATE ?auto_72710 ) ( not ( = ?auto_72709 ?auto_72710 ) ) ( AVAILABLE ?auto_72711 ) ( ON ?auto_72709 ?auto_72713 ) ( not ( = ?auto_72713 ?auto_72709 ) ) ( not ( = ?auto_72713 ?auto_72710 ) ) ( not ( = ?auto_72715 ?auto_72712 ) ) ( HOIST-AT ?auto_72717 ?auto_72715 ) ( not ( = ?auto_72711 ?auto_72717 ) ) ( AVAILABLE ?auto_72717 ) ( SURFACE-AT ?auto_72710 ?auto_72715 ) ( ON ?auto_72710 ?auto_72716 ) ( CLEAR ?auto_72710 ) ( not ( = ?auto_72709 ?auto_72716 ) ) ( not ( = ?auto_72710 ?auto_72716 ) ) ( not ( = ?auto_72713 ?auto_72716 ) ) ( TRUCK-AT ?auto_72714 ?auto_72718 ) ( not ( = ?auto_72718 ?auto_72712 ) ) ( not ( = ?auto_72715 ?auto_72718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72714 ?auto_72718 ?auto_72712 )
      ( MAKE-1CRATE ?auto_72709 ?auto_72710 )
      ( MAKE-1CRATE-VERIFY ?auto_72709 ?auto_72710 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72748 - SURFACE
      ?auto_72749 - SURFACE
      ?auto_72750 - SURFACE
      ?auto_72751 - SURFACE
    )
    :vars
    (
      ?auto_72752 - HOIST
      ?auto_72753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72752 ?auto_72753 ) ( SURFACE-AT ?auto_72750 ?auto_72753 ) ( CLEAR ?auto_72750 ) ( LIFTING ?auto_72752 ?auto_72751 ) ( IS-CRATE ?auto_72751 ) ( not ( = ?auto_72750 ?auto_72751 ) ) ( ON ?auto_72749 ?auto_72748 ) ( ON ?auto_72750 ?auto_72749 ) ( not ( = ?auto_72748 ?auto_72749 ) ) ( not ( = ?auto_72748 ?auto_72750 ) ) ( not ( = ?auto_72748 ?auto_72751 ) ) ( not ( = ?auto_72749 ?auto_72750 ) ) ( not ( = ?auto_72749 ?auto_72751 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72750 ?auto_72751 )
      ( MAKE-3CRATE-VERIFY ?auto_72748 ?auto_72749 ?auto_72750 ?auto_72751 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72765 - SURFACE
      ?auto_72766 - SURFACE
      ?auto_72767 - SURFACE
      ?auto_72768 - SURFACE
    )
    :vars
    (
      ?auto_72769 - HOIST
      ?auto_72770 - PLACE
      ?auto_72771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72769 ?auto_72770 ) ( SURFACE-AT ?auto_72767 ?auto_72770 ) ( CLEAR ?auto_72767 ) ( IS-CRATE ?auto_72768 ) ( not ( = ?auto_72767 ?auto_72768 ) ) ( TRUCK-AT ?auto_72771 ?auto_72770 ) ( AVAILABLE ?auto_72769 ) ( IN ?auto_72768 ?auto_72771 ) ( ON ?auto_72767 ?auto_72766 ) ( not ( = ?auto_72766 ?auto_72767 ) ) ( not ( = ?auto_72766 ?auto_72768 ) ) ( ON ?auto_72766 ?auto_72765 ) ( not ( = ?auto_72765 ?auto_72766 ) ) ( not ( = ?auto_72765 ?auto_72767 ) ) ( not ( = ?auto_72765 ?auto_72768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72766 ?auto_72767 ?auto_72768 )
      ( MAKE-3CRATE-VERIFY ?auto_72765 ?auto_72766 ?auto_72767 ?auto_72768 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72786 - SURFACE
      ?auto_72787 - SURFACE
      ?auto_72788 - SURFACE
      ?auto_72789 - SURFACE
    )
    :vars
    (
      ?auto_72790 - HOIST
      ?auto_72793 - PLACE
      ?auto_72791 - TRUCK
      ?auto_72792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72790 ?auto_72793 ) ( SURFACE-AT ?auto_72788 ?auto_72793 ) ( CLEAR ?auto_72788 ) ( IS-CRATE ?auto_72789 ) ( not ( = ?auto_72788 ?auto_72789 ) ) ( AVAILABLE ?auto_72790 ) ( IN ?auto_72789 ?auto_72791 ) ( ON ?auto_72788 ?auto_72787 ) ( not ( = ?auto_72787 ?auto_72788 ) ) ( not ( = ?auto_72787 ?auto_72789 ) ) ( TRUCK-AT ?auto_72791 ?auto_72792 ) ( not ( = ?auto_72792 ?auto_72793 ) ) ( ON ?auto_72787 ?auto_72786 ) ( not ( = ?auto_72786 ?auto_72787 ) ) ( not ( = ?auto_72786 ?auto_72788 ) ) ( not ( = ?auto_72786 ?auto_72789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72787 ?auto_72788 ?auto_72789 )
      ( MAKE-3CRATE-VERIFY ?auto_72786 ?auto_72787 ?auto_72788 ?auto_72789 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72810 - SURFACE
      ?auto_72811 - SURFACE
      ?auto_72812 - SURFACE
      ?auto_72813 - SURFACE
    )
    :vars
    (
      ?auto_72817 - HOIST
      ?auto_72815 - PLACE
      ?auto_72818 - TRUCK
      ?auto_72814 - PLACE
      ?auto_72816 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72817 ?auto_72815 ) ( SURFACE-AT ?auto_72812 ?auto_72815 ) ( CLEAR ?auto_72812 ) ( IS-CRATE ?auto_72813 ) ( not ( = ?auto_72812 ?auto_72813 ) ) ( AVAILABLE ?auto_72817 ) ( ON ?auto_72812 ?auto_72811 ) ( not ( = ?auto_72811 ?auto_72812 ) ) ( not ( = ?auto_72811 ?auto_72813 ) ) ( TRUCK-AT ?auto_72818 ?auto_72814 ) ( not ( = ?auto_72814 ?auto_72815 ) ) ( HOIST-AT ?auto_72816 ?auto_72814 ) ( LIFTING ?auto_72816 ?auto_72813 ) ( not ( = ?auto_72817 ?auto_72816 ) ) ( ON ?auto_72811 ?auto_72810 ) ( not ( = ?auto_72810 ?auto_72811 ) ) ( not ( = ?auto_72810 ?auto_72812 ) ) ( not ( = ?auto_72810 ?auto_72813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72811 ?auto_72812 ?auto_72813 )
      ( MAKE-3CRATE-VERIFY ?auto_72810 ?auto_72811 ?auto_72812 ?auto_72813 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72837 - SURFACE
      ?auto_72838 - SURFACE
      ?auto_72839 - SURFACE
      ?auto_72840 - SURFACE
    )
    :vars
    (
      ?auto_72841 - HOIST
      ?auto_72843 - PLACE
      ?auto_72846 - TRUCK
      ?auto_72844 - PLACE
      ?auto_72845 - HOIST
      ?auto_72842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72841 ?auto_72843 ) ( SURFACE-AT ?auto_72839 ?auto_72843 ) ( CLEAR ?auto_72839 ) ( IS-CRATE ?auto_72840 ) ( not ( = ?auto_72839 ?auto_72840 ) ) ( AVAILABLE ?auto_72841 ) ( ON ?auto_72839 ?auto_72838 ) ( not ( = ?auto_72838 ?auto_72839 ) ) ( not ( = ?auto_72838 ?auto_72840 ) ) ( TRUCK-AT ?auto_72846 ?auto_72844 ) ( not ( = ?auto_72844 ?auto_72843 ) ) ( HOIST-AT ?auto_72845 ?auto_72844 ) ( not ( = ?auto_72841 ?auto_72845 ) ) ( AVAILABLE ?auto_72845 ) ( SURFACE-AT ?auto_72840 ?auto_72844 ) ( ON ?auto_72840 ?auto_72842 ) ( CLEAR ?auto_72840 ) ( not ( = ?auto_72839 ?auto_72842 ) ) ( not ( = ?auto_72840 ?auto_72842 ) ) ( not ( = ?auto_72838 ?auto_72842 ) ) ( ON ?auto_72838 ?auto_72837 ) ( not ( = ?auto_72837 ?auto_72838 ) ) ( not ( = ?auto_72837 ?auto_72839 ) ) ( not ( = ?auto_72837 ?auto_72840 ) ) ( not ( = ?auto_72837 ?auto_72842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72838 ?auto_72839 ?auto_72840 )
      ( MAKE-3CRATE-VERIFY ?auto_72837 ?auto_72838 ?auto_72839 ?auto_72840 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72865 - SURFACE
      ?auto_72866 - SURFACE
      ?auto_72867 - SURFACE
      ?auto_72868 - SURFACE
    )
    :vars
    (
      ?auto_72873 - HOIST
      ?auto_72871 - PLACE
      ?auto_72869 - PLACE
      ?auto_72872 - HOIST
      ?auto_72870 - SURFACE
      ?auto_72874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72873 ?auto_72871 ) ( SURFACE-AT ?auto_72867 ?auto_72871 ) ( CLEAR ?auto_72867 ) ( IS-CRATE ?auto_72868 ) ( not ( = ?auto_72867 ?auto_72868 ) ) ( AVAILABLE ?auto_72873 ) ( ON ?auto_72867 ?auto_72866 ) ( not ( = ?auto_72866 ?auto_72867 ) ) ( not ( = ?auto_72866 ?auto_72868 ) ) ( not ( = ?auto_72869 ?auto_72871 ) ) ( HOIST-AT ?auto_72872 ?auto_72869 ) ( not ( = ?auto_72873 ?auto_72872 ) ) ( AVAILABLE ?auto_72872 ) ( SURFACE-AT ?auto_72868 ?auto_72869 ) ( ON ?auto_72868 ?auto_72870 ) ( CLEAR ?auto_72868 ) ( not ( = ?auto_72867 ?auto_72870 ) ) ( not ( = ?auto_72868 ?auto_72870 ) ) ( not ( = ?auto_72866 ?auto_72870 ) ) ( TRUCK-AT ?auto_72874 ?auto_72871 ) ( ON ?auto_72866 ?auto_72865 ) ( not ( = ?auto_72865 ?auto_72866 ) ) ( not ( = ?auto_72865 ?auto_72867 ) ) ( not ( = ?auto_72865 ?auto_72868 ) ) ( not ( = ?auto_72865 ?auto_72870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72866 ?auto_72867 ?auto_72868 )
      ( MAKE-3CRATE-VERIFY ?auto_72865 ?auto_72866 ?auto_72867 ?auto_72868 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72893 - SURFACE
      ?auto_72894 - SURFACE
      ?auto_72895 - SURFACE
      ?auto_72896 - SURFACE
    )
    :vars
    (
      ?auto_72902 - HOIST
      ?auto_72901 - PLACE
      ?auto_72899 - PLACE
      ?auto_72898 - HOIST
      ?auto_72897 - SURFACE
      ?auto_72900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72902 ?auto_72901 ) ( IS-CRATE ?auto_72896 ) ( not ( = ?auto_72895 ?auto_72896 ) ) ( not ( = ?auto_72894 ?auto_72895 ) ) ( not ( = ?auto_72894 ?auto_72896 ) ) ( not ( = ?auto_72899 ?auto_72901 ) ) ( HOIST-AT ?auto_72898 ?auto_72899 ) ( not ( = ?auto_72902 ?auto_72898 ) ) ( AVAILABLE ?auto_72898 ) ( SURFACE-AT ?auto_72896 ?auto_72899 ) ( ON ?auto_72896 ?auto_72897 ) ( CLEAR ?auto_72896 ) ( not ( = ?auto_72895 ?auto_72897 ) ) ( not ( = ?auto_72896 ?auto_72897 ) ) ( not ( = ?auto_72894 ?auto_72897 ) ) ( TRUCK-AT ?auto_72900 ?auto_72901 ) ( SURFACE-AT ?auto_72894 ?auto_72901 ) ( CLEAR ?auto_72894 ) ( LIFTING ?auto_72902 ?auto_72895 ) ( IS-CRATE ?auto_72895 ) ( ON ?auto_72894 ?auto_72893 ) ( not ( = ?auto_72893 ?auto_72894 ) ) ( not ( = ?auto_72893 ?auto_72895 ) ) ( not ( = ?auto_72893 ?auto_72896 ) ) ( not ( = ?auto_72893 ?auto_72897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72894 ?auto_72895 ?auto_72896 )
      ( MAKE-3CRATE-VERIFY ?auto_72893 ?auto_72894 ?auto_72895 ?auto_72896 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72921 - SURFACE
      ?auto_72922 - SURFACE
      ?auto_72923 - SURFACE
      ?auto_72924 - SURFACE
    )
    :vars
    (
      ?auto_72927 - HOIST
      ?auto_72925 - PLACE
      ?auto_72929 - PLACE
      ?auto_72928 - HOIST
      ?auto_72926 - SURFACE
      ?auto_72930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72927 ?auto_72925 ) ( IS-CRATE ?auto_72924 ) ( not ( = ?auto_72923 ?auto_72924 ) ) ( not ( = ?auto_72922 ?auto_72923 ) ) ( not ( = ?auto_72922 ?auto_72924 ) ) ( not ( = ?auto_72929 ?auto_72925 ) ) ( HOIST-AT ?auto_72928 ?auto_72929 ) ( not ( = ?auto_72927 ?auto_72928 ) ) ( AVAILABLE ?auto_72928 ) ( SURFACE-AT ?auto_72924 ?auto_72929 ) ( ON ?auto_72924 ?auto_72926 ) ( CLEAR ?auto_72924 ) ( not ( = ?auto_72923 ?auto_72926 ) ) ( not ( = ?auto_72924 ?auto_72926 ) ) ( not ( = ?auto_72922 ?auto_72926 ) ) ( TRUCK-AT ?auto_72930 ?auto_72925 ) ( SURFACE-AT ?auto_72922 ?auto_72925 ) ( CLEAR ?auto_72922 ) ( IS-CRATE ?auto_72923 ) ( AVAILABLE ?auto_72927 ) ( IN ?auto_72923 ?auto_72930 ) ( ON ?auto_72922 ?auto_72921 ) ( not ( = ?auto_72921 ?auto_72922 ) ) ( not ( = ?auto_72921 ?auto_72923 ) ) ( not ( = ?auto_72921 ?auto_72924 ) ) ( not ( = ?auto_72921 ?auto_72926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72922 ?auto_72923 ?auto_72924 )
      ( MAKE-3CRATE-VERIFY ?auto_72921 ?auto_72922 ?auto_72923 ?auto_72924 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72931 - SURFACE
      ?auto_72932 - SURFACE
    )
    :vars
    (
      ?auto_72935 - HOIST
      ?auto_72933 - PLACE
      ?auto_72937 - SURFACE
      ?auto_72938 - PLACE
      ?auto_72936 - HOIST
      ?auto_72934 - SURFACE
      ?auto_72939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72935 ?auto_72933 ) ( IS-CRATE ?auto_72932 ) ( not ( = ?auto_72931 ?auto_72932 ) ) ( not ( = ?auto_72937 ?auto_72931 ) ) ( not ( = ?auto_72937 ?auto_72932 ) ) ( not ( = ?auto_72938 ?auto_72933 ) ) ( HOIST-AT ?auto_72936 ?auto_72938 ) ( not ( = ?auto_72935 ?auto_72936 ) ) ( AVAILABLE ?auto_72936 ) ( SURFACE-AT ?auto_72932 ?auto_72938 ) ( ON ?auto_72932 ?auto_72934 ) ( CLEAR ?auto_72932 ) ( not ( = ?auto_72931 ?auto_72934 ) ) ( not ( = ?auto_72932 ?auto_72934 ) ) ( not ( = ?auto_72937 ?auto_72934 ) ) ( SURFACE-AT ?auto_72937 ?auto_72933 ) ( CLEAR ?auto_72937 ) ( IS-CRATE ?auto_72931 ) ( AVAILABLE ?auto_72935 ) ( IN ?auto_72931 ?auto_72939 ) ( TRUCK-AT ?auto_72939 ?auto_72938 ) )
    :subtasks
    ( ( !DRIVE ?auto_72939 ?auto_72938 ?auto_72933 )
      ( MAKE-2CRATE ?auto_72937 ?auto_72931 ?auto_72932 )
      ( MAKE-1CRATE-VERIFY ?auto_72931 ?auto_72932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72940 - SURFACE
      ?auto_72941 - SURFACE
      ?auto_72942 - SURFACE
    )
    :vars
    (
      ?auto_72944 - HOIST
      ?auto_72947 - PLACE
      ?auto_72943 - PLACE
      ?auto_72946 - HOIST
      ?auto_72948 - SURFACE
      ?auto_72945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72944 ?auto_72947 ) ( IS-CRATE ?auto_72942 ) ( not ( = ?auto_72941 ?auto_72942 ) ) ( not ( = ?auto_72940 ?auto_72941 ) ) ( not ( = ?auto_72940 ?auto_72942 ) ) ( not ( = ?auto_72943 ?auto_72947 ) ) ( HOIST-AT ?auto_72946 ?auto_72943 ) ( not ( = ?auto_72944 ?auto_72946 ) ) ( AVAILABLE ?auto_72946 ) ( SURFACE-AT ?auto_72942 ?auto_72943 ) ( ON ?auto_72942 ?auto_72948 ) ( CLEAR ?auto_72942 ) ( not ( = ?auto_72941 ?auto_72948 ) ) ( not ( = ?auto_72942 ?auto_72948 ) ) ( not ( = ?auto_72940 ?auto_72948 ) ) ( SURFACE-AT ?auto_72940 ?auto_72947 ) ( CLEAR ?auto_72940 ) ( IS-CRATE ?auto_72941 ) ( AVAILABLE ?auto_72944 ) ( IN ?auto_72941 ?auto_72945 ) ( TRUCK-AT ?auto_72945 ?auto_72943 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72941 ?auto_72942 )
      ( MAKE-2CRATE-VERIFY ?auto_72940 ?auto_72941 ?auto_72942 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72949 - SURFACE
      ?auto_72950 - SURFACE
      ?auto_72951 - SURFACE
      ?auto_72952 - SURFACE
    )
    :vars
    (
      ?auto_72957 - HOIST
      ?auto_72958 - PLACE
      ?auto_72956 - PLACE
      ?auto_72954 - HOIST
      ?auto_72953 - SURFACE
      ?auto_72955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72957 ?auto_72958 ) ( IS-CRATE ?auto_72952 ) ( not ( = ?auto_72951 ?auto_72952 ) ) ( not ( = ?auto_72950 ?auto_72951 ) ) ( not ( = ?auto_72950 ?auto_72952 ) ) ( not ( = ?auto_72956 ?auto_72958 ) ) ( HOIST-AT ?auto_72954 ?auto_72956 ) ( not ( = ?auto_72957 ?auto_72954 ) ) ( AVAILABLE ?auto_72954 ) ( SURFACE-AT ?auto_72952 ?auto_72956 ) ( ON ?auto_72952 ?auto_72953 ) ( CLEAR ?auto_72952 ) ( not ( = ?auto_72951 ?auto_72953 ) ) ( not ( = ?auto_72952 ?auto_72953 ) ) ( not ( = ?auto_72950 ?auto_72953 ) ) ( SURFACE-AT ?auto_72950 ?auto_72958 ) ( CLEAR ?auto_72950 ) ( IS-CRATE ?auto_72951 ) ( AVAILABLE ?auto_72957 ) ( IN ?auto_72951 ?auto_72955 ) ( TRUCK-AT ?auto_72955 ?auto_72956 ) ( ON ?auto_72950 ?auto_72949 ) ( not ( = ?auto_72949 ?auto_72950 ) ) ( not ( = ?auto_72949 ?auto_72951 ) ) ( not ( = ?auto_72949 ?auto_72952 ) ) ( not ( = ?auto_72949 ?auto_72953 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72950 ?auto_72951 ?auto_72952 )
      ( MAKE-3CRATE-VERIFY ?auto_72949 ?auto_72950 ?auto_72951 ?auto_72952 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72959 - SURFACE
      ?auto_72960 - SURFACE
    )
    :vars
    (
      ?auto_72965 - HOIST
      ?auto_72967 - PLACE
      ?auto_72966 - SURFACE
      ?auto_72964 - PLACE
      ?auto_72962 - HOIST
      ?auto_72961 - SURFACE
      ?auto_72963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72965 ?auto_72967 ) ( IS-CRATE ?auto_72960 ) ( not ( = ?auto_72959 ?auto_72960 ) ) ( not ( = ?auto_72966 ?auto_72959 ) ) ( not ( = ?auto_72966 ?auto_72960 ) ) ( not ( = ?auto_72964 ?auto_72967 ) ) ( HOIST-AT ?auto_72962 ?auto_72964 ) ( not ( = ?auto_72965 ?auto_72962 ) ) ( SURFACE-AT ?auto_72960 ?auto_72964 ) ( ON ?auto_72960 ?auto_72961 ) ( CLEAR ?auto_72960 ) ( not ( = ?auto_72959 ?auto_72961 ) ) ( not ( = ?auto_72960 ?auto_72961 ) ) ( not ( = ?auto_72966 ?auto_72961 ) ) ( SURFACE-AT ?auto_72966 ?auto_72967 ) ( CLEAR ?auto_72966 ) ( IS-CRATE ?auto_72959 ) ( AVAILABLE ?auto_72965 ) ( TRUCK-AT ?auto_72963 ?auto_72964 ) ( LIFTING ?auto_72962 ?auto_72959 ) )
    :subtasks
    ( ( !LOAD ?auto_72962 ?auto_72959 ?auto_72963 ?auto_72964 )
      ( MAKE-2CRATE ?auto_72966 ?auto_72959 ?auto_72960 )
      ( MAKE-1CRATE-VERIFY ?auto_72959 ?auto_72960 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72968 - SURFACE
      ?auto_72969 - SURFACE
      ?auto_72970 - SURFACE
    )
    :vars
    (
      ?auto_72973 - HOIST
      ?auto_72976 - PLACE
      ?auto_72975 - PLACE
      ?auto_72974 - HOIST
      ?auto_72972 - SURFACE
      ?auto_72971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72973 ?auto_72976 ) ( IS-CRATE ?auto_72970 ) ( not ( = ?auto_72969 ?auto_72970 ) ) ( not ( = ?auto_72968 ?auto_72969 ) ) ( not ( = ?auto_72968 ?auto_72970 ) ) ( not ( = ?auto_72975 ?auto_72976 ) ) ( HOIST-AT ?auto_72974 ?auto_72975 ) ( not ( = ?auto_72973 ?auto_72974 ) ) ( SURFACE-AT ?auto_72970 ?auto_72975 ) ( ON ?auto_72970 ?auto_72972 ) ( CLEAR ?auto_72970 ) ( not ( = ?auto_72969 ?auto_72972 ) ) ( not ( = ?auto_72970 ?auto_72972 ) ) ( not ( = ?auto_72968 ?auto_72972 ) ) ( SURFACE-AT ?auto_72968 ?auto_72976 ) ( CLEAR ?auto_72968 ) ( IS-CRATE ?auto_72969 ) ( AVAILABLE ?auto_72973 ) ( TRUCK-AT ?auto_72971 ?auto_72975 ) ( LIFTING ?auto_72974 ?auto_72969 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72969 ?auto_72970 )
      ( MAKE-2CRATE-VERIFY ?auto_72968 ?auto_72969 ?auto_72970 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72977 - SURFACE
      ?auto_72978 - SURFACE
      ?auto_72979 - SURFACE
      ?auto_72980 - SURFACE
    )
    :vars
    (
      ?auto_72984 - HOIST
      ?auto_72983 - PLACE
      ?auto_72982 - PLACE
      ?auto_72986 - HOIST
      ?auto_72985 - SURFACE
      ?auto_72981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72984 ?auto_72983 ) ( IS-CRATE ?auto_72980 ) ( not ( = ?auto_72979 ?auto_72980 ) ) ( not ( = ?auto_72978 ?auto_72979 ) ) ( not ( = ?auto_72978 ?auto_72980 ) ) ( not ( = ?auto_72982 ?auto_72983 ) ) ( HOIST-AT ?auto_72986 ?auto_72982 ) ( not ( = ?auto_72984 ?auto_72986 ) ) ( SURFACE-AT ?auto_72980 ?auto_72982 ) ( ON ?auto_72980 ?auto_72985 ) ( CLEAR ?auto_72980 ) ( not ( = ?auto_72979 ?auto_72985 ) ) ( not ( = ?auto_72980 ?auto_72985 ) ) ( not ( = ?auto_72978 ?auto_72985 ) ) ( SURFACE-AT ?auto_72978 ?auto_72983 ) ( CLEAR ?auto_72978 ) ( IS-CRATE ?auto_72979 ) ( AVAILABLE ?auto_72984 ) ( TRUCK-AT ?auto_72981 ?auto_72982 ) ( LIFTING ?auto_72986 ?auto_72979 ) ( ON ?auto_72978 ?auto_72977 ) ( not ( = ?auto_72977 ?auto_72978 ) ) ( not ( = ?auto_72977 ?auto_72979 ) ) ( not ( = ?auto_72977 ?auto_72980 ) ) ( not ( = ?auto_72977 ?auto_72985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72978 ?auto_72979 ?auto_72980 )
      ( MAKE-3CRATE-VERIFY ?auto_72977 ?auto_72978 ?auto_72979 ?auto_72980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72987 - SURFACE
      ?auto_72988 - SURFACE
    )
    :vars
    (
      ?auto_72992 - HOIST
      ?auto_72991 - PLACE
      ?auto_72993 - SURFACE
      ?auto_72990 - PLACE
      ?auto_72995 - HOIST
      ?auto_72994 - SURFACE
      ?auto_72989 - TRUCK
      ?auto_72996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72992 ?auto_72991 ) ( IS-CRATE ?auto_72988 ) ( not ( = ?auto_72987 ?auto_72988 ) ) ( not ( = ?auto_72993 ?auto_72987 ) ) ( not ( = ?auto_72993 ?auto_72988 ) ) ( not ( = ?auto_72990 ?auto_72991 ) ) ( HOIST-AT ?auto_72995 ?auto_72990 ) ( not ( = ?auto_72992 ?auto_72995 ) ) ( SURFACE-AT ?auto_72988 ?auto_72990 ) ( ON ?auto_72988 ?auto_72994 ) ( CLEAR ?auto_72988 ) ( not ( = ?auto_72987 ?auto_72994 ) ) ( not ( = ?auto_72988 ?auto_72994 ) ) ( not ( = ?auto_72993 ?auto_72994 ) ) ( SURFACE-AT ?auto_72993 ?auto_72991 ) ( CLEAR ?auto_72993 ) ( IS-CRATE ?auto_72987 ) ( AVAILABLE ?auto_72992 ) ( TRUCK-AT ?auto_72989 ?auto_72990 ) ( AVAILABLE ?auto_72995 ) ( SURFACE-AT ?auto_72987 ?auto_72990 ) ( ON ?auto_72987 ?auto_72996 ) ( CLEAR ?auto_72987 ) ( not ( = ?auto_72987 ?auto_72996 ) ) ( not ( = ?auto_72988 ?auto_72996 ) ) ( not ( = ?auto_72993 ?auto_72996 ) ) ( not ( = ?auto_72994 ?auto_72996 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72995 ?auto_72987 ?auto_72996 ?auto_72990 )
      ( MAKE-2CRATE ?auto_72993 ?auto_72987 ?auto_72988 )
      ( MAKE-1CRATE-VERIFY ?auto_72987 ?auto_72988 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72997 - SURFACE
      ?auto_72998 - SURFACE
      ?auto_72999 - SURFACE
    )
    :vars
    (
      ?auto_73000 - HOIST
      ?auto_73003 - PLACE
      ?auto_73005 - PLACE
      ?auto_73006 - HOIST
      ?auto_73001 - SURFACE
      ?auto_73002 - TRUCK
      ?auto_73004 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73000 ?auto_73003 ) ( IS-CRATE ?auto_72999 ) ( not ( = ?auto_72998 ?auto_72999 ) ) ( not ( = ?auto_72997 ?auto_72998 ) ) ( not ( = ?auto_72997 ?auto_72999 ) ) ( not ( = ?auto_73005 ?auto_73003 ) ) ( HOIST-AT ?auto_73006 ?auto_73005 ) ( not ( = ?auto_73000 ?auto_73006 ) ) ( SURFACE-AT ?auto_72999 ?auto_73005 ) ( ON ?auto_72999 ?auto_73001 ) ( CLEAR ?auto_72999 ) ( not ( = ?auto_72998 ?auto_73001 ) ) ( not ( = ?auto_72999 ?auto_73001 ) ) ( not ( = ?auto_72997 ?auto_73001 ) ) ( SURFACE-AT ?auto_72997 ?auto_73003 ) ( CLEAR ?auto_72997 ) ( IS-CRATE ?auto_72998 ) ( AVAILABLE ?auto_73000 ) ( TRUCK-AT ?auto_73002 ?auto_73005 ) ( AVAILABLE ?auto_73006 ) ( SURFACE-AT ?auto_72998 ?auto_73005 ) ( ON ?auto_72998 ?auto_73004 ) ( CLEAR ?auto_72998 ) ( not ( = ?auto_72998 ?auto_73004 ) ) ( not ( = ?auto_72999 ?auto_73004 ) ) ( not ( = ?auto_72997 ?auto_73004 ) ) ( not ( = ?auto_73001 ?auto_73004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72998 ?auto_72999 )
      ( MAKE-2CRATE-VERIFY ?auto_72997 ?auto_72998 ?auto_72999 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73007 - SURFACE
      ?auto_73008 - SURFACE
      ?auto_73009 - SURFACE
      ?auto_73010 - SURFACE
    )
    :vars
    (
      ?auto_73013 - HOIST
      ?auto_73017 - PLACE
      ?auto_73011 - PLACE
      ?auto_73016 - HOIST
      ?auto_73014 - SURFACE
      ?auto_73012 - TRUCK
      ?auto_73015 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73013 ?auto_73017 ) ( IS-CRATE ?auto_73010 ) ( not ( = ?auto_73009 ?auto_73010 ) ) ( not ( = ?auto_73008 ?auto_73009 ) ) ( not ( = ?auto_73008 ?auto_73010 ) ) ( not ( = ?auto_73011 ?auto_73017 ) ) ( HOIST-AT ?auto_73016 ?auto_73011 ) ( not ( = ?auto_73013 ?auto_73016 ) ) ( SURFACE-AT ?auto_73010 ?auto_73011 ) ( ON ?auto_73010 ?auto_73014 ) ( CLEAR ?auto_73010 ) ( not ( = ?auto_73009 ?auto_73014 ) ) ( not ( = ?auto_73010 ?auto_73014 ) ) ( not ( = ?auto_73008 ?auto_73014 ) ) ( SURFACE-AT ?auto_73008 ?auto_73017 ) ( CLEAR ?auto_73008 ) ( IS-CRATE ?auto_73009 ) ( AVAILABLE ?auto_73013 ) ( TRUCK-AT ?auto_73012 ?auto_73011 ) ( AVAILABLE ?auto_73016 ) ( SURFACE-AT ?auto_73009 ?auto_73011 ) ( ON ?auto_73009 ?auto_73015 ) ( CLEAR ?auto_73009 ) ( not ( = ?auto_73009 ?auto_73015 ) ) ( not ( = ?auto_73010 ?auto_73015 ) ) ( not ( = ?auto_73008 ?auto_73015 ) ) ( not ( = ?auto_73014 ?auto_73015 ) ) ( ON ?auto_73008 ?auto_73007 ) ( not ( = ?auto_73007 ?auto_73008 ) ) ( not ( = ?auto_73007 ?auto_73009 ) ) ( not ( = ?auto_73007 ?auto_73010 ) ) ( not ( = ?auto_73007 ?auto_73014 ) ) ( not ( = ?auto_73007 ?auto_73015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73008 ?auto_73009 ?auto_73010 )
      ( MAKE-3CRATE-VERIFY ?auto_73007 ?auto_73008 ?auto_73009 ?auto_73010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_73018 - SURFACE
      ?auto_73019 - SURFACE
    )
    :vars
    (
      ?auto_73023 - HOIST
      ?auto_73027 - PLACE
      ?auto_73022 - SURFACE
      ?auto_73020 - PLACE
      ?auto_73026 - HOIST
      ?auto_73024 - SURFACE
      ?auto_73025 - SURFACE
      ?auto_73021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73023 ?auto_73027 ) ( IS-CRATE ?auto_73019 ) ( not ( = ?auto_73018 ?auto_73019 ) ) ( not ( = ?auto_73022 ?auto_73018 ) ) ( not ( = ?auto_73022 ?auto_73019 ) ) ( not ( = ?auto_73020 ?auto_73027 ) ) ( HOIST-AT ?auto_73026 ?auto_73020 ) ( not ( = ?auto_73023 ?auto_73026 ) ) ( SURFACE-AT ?auto_73019 ?auto_73020 ) ( ON ?auto_73019 ?auto_73024 ) ( CLEAR ?auto_73019 ) ( not ( = ?auto_73018 ?auto_73024 ) ) ( not ( = ?auto_73019 ?auto_73024 ) ) ( not ( = ?auto_73022 ?auto_73024 ) ) ( SURFACE-AT ?auto_73022 ?auto_73027 ) ( CLEAR ?auto_73022 ) ( IS-CRATE ?auto_73018 ) ( AVAILABLE ?auto_73023 ) ( AVAILABLE ?auto_73026 ) ( SURFACE-AT ?auto_73018 ?auto_73020 ) ( ON ?auto_73018 ?auto_73025 ) ( CLEAR ?auto_73018 ) ( not ( = ?auto_73018 ?auto_73025 ) ) ( not ( = ?auto_73019 ?auto_73025 ) ) ( not ( = ?auto_73022 ?auto_73025 ) ) ( not ( = ?auto_73024 ?auto_73025 ) ) ( TRUCK-AT ?auto_73021 ?auto_73027 ) )
    :subtasks
    ( ( !DRIVE ?auto_73021 ?auto_73027 ?auto_73020 )
      ( MAKE-2CRATE ?auto_73022 ?auto_73018 ?auto_73019 )
      ( MAKE-1CRATE-VERIFY ?auto_73018 ?auto_73019 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_73028 - SURFACE
      ?auto_73029 - SURFACE
      ?auto_73030 - SURFACE
    )
    :vars
    (
      ?auto_73031 - HOIST
      ?auto_73032 - PLACE
      ?auto_73037 - PLACE
      ?auto_73033 - HOIST
      ?auto_73035 - SURFACE
      ?auto_73036 - SURFACE
      ?auto_73034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73031 ?auto_73032 ) ( IS-CRATE ?auto_73030 ) ( not ( = ?auto_73029 ?auto_73030 ) ) ( not ( = ?auto_73028 ?auto_73029 ) ) ( not ( = ?auto_73028 ?auto_73030 ) ) ( not ( = ?auto_73037 ?auto_73032 ) ) ( HOIST-AT ?auto_73033 ?auto_73037 ) ( not ( = ?auto_73031 ?auto_73033 ) ) ( SURFACE-AT ?auto_73030 ?auto_73037 ) ( ON ?auto_73030 ?auto_73035 ) ( CLEAR ?auto_73030 ) ( not ( = ?auto_73029 ?auto_73035 ) ) ( not ( = ?auto_73030 ?auto_73035 ) ) ( not ( = ?auto_73028 ?auto_73035 ) ) ( SURFACE-AT ?auto_73028 ?auto_73032 ) ( CLEAR ?auto_73028 ) ( IS-CRATE ?auto_73029 ) ( AVAILABLE ?auto_73031 ) ( AVAILABLE ?auto_73033 ) ( SURFACE-AT ?auto_73029 ?auto_73037 ) ( ON ?auto_73029 ?auto_73036 ) ( CLEAR ?auto_73029 ) ( not ( = ?auto_73029 ?auto_73036 ) ) ( not ( = ?auto_73030 ?auto_73036 ) ) ( not ( = ?auto_73028 ?auto_73036 ) ) ( not ( = ?auto_73035 ?auto_73036 ) ) ( TRUCK-AT ?auto_73034 ?auto_73032 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73029 ?auto_73030 )
      ( MAKE-2CRATE-VERIFY ?auto_73028 ?auto_73029 ?auto_73030 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73038 - SURFACE
      ?auto_73039 - SURFACE
      ?auto_73040 - SURFACE
      ?auto_73041 - SURFACE
    )
    :vars
    (
      ?auto_73048 - HOIST
      ?auto_73044 - PLACE
      ?auto_73045 - PLACE
      ?auto_73042 - HOIST
      ?auto_73047 - SURFACE
      ?auto_73046 - SURFACE
      ?auto_73043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73048 ?auto_73044 ) ( IS-CRATE ?auto_73041 ) ( not ( = ?auto_73040 ?auto_73041 ) ) ( not ( = ?auto_73039 ?auto_73040 ) ) ( not ( = ?auto_73039 ?auto_73041 ) ) ( not ( = ?auto_73045 ?auto_73044 ) ) ( HOIST-AT ?auto_73042 ?auto_73045 ) ( not ( = ?auto_73048 ?auto_73042 ) ) ( SURFACE-AT ?auto_73041 ?auto_73045 ) ( ON ?auto_73041 ?auto_73047 ) ( CLEAR ?auto_73041 ) ( not ( = ?auto_73040 ?auto_73047 ) ) ( not ( = ?auto_73041 ?auto_73047 ) ) ( not ( = ?auto_73039 ?auto_73047 ) ) ( SURFACE-AT ?auto_73039 ?auto_73044 ) ( CLEAR ?auto_73039 ) ( IS-CRATE ?auto_73040 ) ( AVAILABLE ?auto_73048 ) ( AVAILABLE ?auto_73042 ) ( SURFACE-AT ?auto_73040 ?auto_73045 ) ( ON ?auto_73040 ?auto_73046 ) ( CLEAR ?auto_73040 ) ( not ( = ?auto_73040 ?auto_73046 ) ) ( not ( = ?auto_73041 ?auto_73046 ) ) ( not ( = ?auto_73039 ?auto_73046 ) ) ( not ( = ?auto_73047 ?auto_73046 ) ) ( TRUCK-AT ?auto_73043 ?auto_73044 ) ( ON ?auto_73039 ?auto_73038 ) ( not ( = ?auto_73038 ?auto_73039 ) ) ( not ( = ?auto_73038 ?auto_73040 ) ) ( not ( = ?auto_73038 ?auto_73041 ) ) ( not ( = ?auto_73038 ?auto_73047 ) ) ( not ( = ?auto_73038 ?auto_73046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73039 ?auto_73040 ?auto_73041 )
      ( MAKE-3CRATE-VERIFY ?auto_73038 ?auto_73039 ?auto_73040 ?auto_73041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_73049 - SURFACE
      ?auto_73050 - SURFACE
    )
    :vars
    (
      ?auto_73058 - HOIST
      ?auto_73054 - PLACE
      ?auto_73051 - SURFACE
      ?auto_73055 - PLACE
      ?auto_73052 - HOIST
      ?auto_73057 - SURFACE
      ?auto_73056 - SURFACE
      ?auto_73053 - TRUCK
      ?auto_73059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73058 ?auto_73054 ) ( IS-CRATE ?auto_73050 ) ( not ( = ?auto_73049 ?auto_73050 ) ) ( not ( = ?auto_73051 ?auto_73049 ) ) ( not ( = ?auto_73051 ?auto_73050 ) ) ( not ( = ?auto_73055 ?auto_73054 ) ) ( HOIST-AT ?auto_73052 ?auto_73055 ) ( not ( = ?auto_73058 ?auto_73052 ) ) ( SURFACE-AT ?auto_73050 ?auto_73055 ) ( ON ?auto_73050 ?auto_73057 ) ( CLEAR ?auto_73050 ) ( not ( = ?auto_73049 ?auto_73057 ) ) ( not ( = ?auto_73050 ?auto_73057 ) ) ( not ( = ?auto_73051 ?auto_73057 ) ) ( IS-CRATE ?auto_73049 ) ( AVAILABLE ?auto_73052 ) ( SURFACE-AT ?auto_73049 ?auto_73055 ) ( ON ?auto_73049 ?auto_73056 ) ( CLEAR ?auto_73049 ) ( not ( = ?auto_73049 ?auto_73056 ) ) ( not ( = ?auto_73050 ?auto_73056 ) ) ( not ( = ?auto_73051 ?auto_73056 ) ) ( not ( = ?auto_73057 ?auto_73056 ) ) ( TRUCK-AT ?auto_73053 ?auto_73054 ) ( SURFACE-AT ?auto_73059 ?auto_73054 ) ( CLEAR ?auto_73059 ) ( LIFTING ?auto_73058 ?auto_73051 ) ( IS-CRATE ?auto_73051 ) ( not ( = ?auto_73059 ?auto_73051 ) ) ( not ( = ?auto_73049 ?auto_73059 ) ) ( not ( = ?auto_73050 ?auto_73059 ) ) ( not ( = ?auto_73057 ?auto_73059 ) ) ( not ( = ?auto_73056 ?auto_73059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73059 ?auto_73051 )
      ( MAKE-2CRATE ?auto_73051 ?auto_73049 ?auto_73050 )
      ( MAKE-1CRATE-VERIFY ?auto_73049 ?auto_73050 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_73060 - SURFACE
      ?auto_73061 - SURFACE
      ?auto_73062 - SURFACE
    )
    :vars
    (
      ?auto_73069 - HOIST
      ?auto_73064 - PLACE
      ?auto_73068 - PLACE
      ?auto_73066 - HOIST
      ?auto_73065 - SURFACE
      ?auto_73067 - SURFACE
      ?auto_73063 - TRUCK
      ?auto_73070 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73069 ?auto_73064 ) ( IS-CRATE ?auto_73062 ) ( not ( = ?auto_73061 ?auto_73062 ) ) ( not ( = ?auto_73060 ?auto_73061 ) ) ( not ( = ?auto_73060 ?auto_73062 ) ) ( not ( = ?auto_73068 ?auto_73064 ) ) ( HOIST-AT ?auto_73066 ?auto_73068 ) ( not ( = ?auto_73069 ?auto_73066 ) ) ( SURFACE-AT ?auto_73062 ?auto_73068 ) ( ON ?auto_73062 ?auto_73065 ) ( CLEAR ?auto_73062 ) ( not ( = ?auto_73061 ?auto_73065 ) ) ( not ( = ?auto_73062 ?auto_73065 ) ) ( not ( = ?auto_73060 ?auto_73065 ) ) ( IS-CRATE ?auto_73061 ) ( AVAILABLE ?auto_73066 ) ( SURFACE-AT ?auto_73061 ?auto_73068 ) ( ON ?auto_73061 ?auto_73067 ) ( CLEAR ?auto_73061 ) ( not ( = ?auto_73061 ?auto_73067 ) ) ( not ( = ?auto_73062 ?auto_73067 ) ) ( not ( = ?auto_73060 ?auto_73067 ) ) ( not ( = ?auto_73065 ?auto_73067 ) ) ( TRUCK-AT ?auto_73063 ?auto_73064 ) ( SURFACE-AT ?auto_73070 ?auto_73064 ) ( CLEAR ?auto_73070 ) ( LIFTING ?auto_73069 ?auto_73060 ) ( IS-CRATE ?auto_73060 ) ( not ( = ?auto_73070 ?auto_73060 ) ) ( not ( = ?auto_73061 ?auto_73070 ) ) ( not ( = ?auto_73062 ?auto_73070 ) ) ( not ( = ?auto_73065 ?auto_73070 ) ) ( not ( = ?auto_73067 ?auto_73070 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73061 ?auto_73062 )
      ( MAKE-2CRATE-VERIFY ?auto_73060 ?auto_73061 ?auto_73062 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_73071 - SURFACE
      ?auto_73072 - SURFACE
      ?auto_73073 - SURFACE
      ?auto_73074 - SURFACE
    )
    :vars
    (
      ?auto_73076 - HOIST
      ?auto_73079 - PLACE
      ?auto_73077 - PLACE
      ?auto_73081 - HOIST
      ?auto_73078 - SURFACE
      ?auto_73080 - SURFACE
      ?auto_73075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73076 ?auto_73079 ) ( IS-CRATE ?auto_73074 ) ( not ( = ?auto_73073 ?auto_73074 ) ) ( not ( = ?auto_73072 ?auto_73073 ) ) ( not ( = ?auto_73072 ?auto_73074 ) ) ( not ( = ?auto_73077 ?auto_73079 ) ) ( HOIST-AT ?auto_73081 ?auto_73077 ) ( not ( = ?auto_73076 ?auto_73081 ) ) ( SURFACE-AT ?auto_73074 ?auto_73077 ) ( ON ?auto_73074 ?auto_73078 ) ( CLEAR ?auto_73074 ) ( not ( = ?auto_73073 ?auto_73078 ) ) ( not ( = ?auto_73074 ?auto_73078 ) ) ( not ( = ?auto_73072 ?auto_73078 ) ) ( IS-CRATE ?auto_73073 ) ( AVAILABLE ?auto_73081 ) ( SURFACE-AT ?auto_73073 ?auto_73077 ) ( ON ?auto_73073 ?auto_73080 ) ( CLEAR ?auto_73073 ) ( not ( = ?auto_73073 ?auto_73080 ) ) ( not ( = ?auto_73074 ?auto_73080 ) ) ( not ( = ?auto_73072 ?auto_73080 ) ) ( not ( = ?auto_73078 ?auto_73080 ) ) ( TRUCK-AT ?auto_73075 ?auto_73079 ) ( SURFACE-AT ?auto_73071 ?auto_73079 ) ( CLEAR ?auto_73071 ) ( LIFTING ?auto_73076 ?auto_73072 ) ( IS-CRATE ?auto_73072 ) ( not ( = ?auto_73071 ?auto_73072 ) ) ( not ( = ?auto_73073 ?auto_73071 ) ) ( not ( = ?auto_73074 ?auto_73071 ) ) ( not ( = ?auto_73078 ?auto_73071 ) ) ( not ( = ?auto_73080 ?auto_73071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73072 ?auto_73073 ?auto_73074 )
      ( MAKE-3CRATE-VERIFY ?auto_73071 ?auto_73072 ?auto_73073 ?auto_73074 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73217 - SURFACE
      ?auto_73218 - SURFACE
      ?auto_73219 - SURFACE
      ?auto_73220 - SURFACE
      ?auto_73221 - SURFACE
    )
    :vars
    (
      ?auto_73223 - HOIST
      ?auto_73222 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73223 ?auto_73222 ) ( SURFACE-AT ?auto_73220 ?auto_73222 ) ( CLEAR ?auto_73220 ) ( LIFTING ?auto_73223 ?auto_73221 ) ( IS-CRATE ?auto_73221 ) ( not ( = ?auto_73220 ?auto_73221 ) ) ( ON ?auto_73218 ?auto_73217 ) ( ON ?auto_73219 ?auto_73218 ) ( ON ?auto_73220 ?auto_73219 ) ( not ( = ?auto_73217 ?auto_73218 ) ) ( not ( = ?auto_73217 ?auto_73219 ) ) ( not ( = ?auto_73217 ?auto_73220 ) ) ( not ( = ?auto_73217 ?auto_73221 ) ) ( not ( = ?auto_73218 ?auto_73219 ) ) ( not ( = ?auto_73218 ?auto_73220 ) ) ( not ( = ?auto_73218 ?auto_73221 ) ) ( not ( = ?auto_73219 ?auto_73220 ) ) ( not ( = ?auto_73219 ?auto_73221 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73220 ?auto_73221 )
      ( MAKE-4CRATE-VERIFY ?auto_73217 ?auto_73218 ?auto_73219 ?auto_73220 ?auto_73221 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73242 - SURFACE
      ?auto_73243 - SURFACE
      ?auto_73244 - SURFACE
      ?auto_73245 - SURFACE
      ?auto_73246 - SURFACE
    )
    :vars
    (
      ?auto_73248 - HOIST
      ?auto_73247 - PLACE
      ?auto_73249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73248 ?auto_73247 ) ( SURFACE-AT ?auto_73245 ?auto_73247 ) ( CLEAR ?auto_73245 ) ( IS-CRATE ?auto_73246 ) ( not ( = ?auto_73245 ?auto_73246 ) ) ( TRUCK-AT ?auto_73249 ?auto_73247 ) ( AVAILABLE ?auto_73248 ) ( IN ?auto_73246 ?auto_73249 ) ( ON ?auto_73245 ?auto_73244 ) ( not ( = ?auto_73244 ?auto_73245 ) ) ( not ( = ?auto_73244 ?auto_73246 ) ) ( ON ?auto_73243 ?auto_73242 ) ( ON ?auto_73244 ?auto_73243 ) ( not ( = ?auto_73242 ?auto_73243 ) ) ( not ( = ?auto_73242 ?auto_73244 ) ) ( not ( = ?auto_73242 ?auto_73245 ) ) ( not ( = ?auto_73242 ?auto_73246 ) ) ( not ( = ?auto_73243 ?auto_73244 ) ) ( not ( = ?auto_73243 ?auto_73245 ) ) ( not ( = ?auto_73243 ?auto_73246 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73244 ?auto_73245 ?auto_73246 )
      ( MAKE-4CRATE-VERIFY ?auto_73242 ?auto_73243 ?auto_73244 ?auto_73245 ?auto_73246 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73272 - SURFACE
      ?auto_73273 - SURFACE
      ?auto_73274 - SURFACE
      ?auto_73275 - SURFACE
      ?auto_73276 - SURFACE
    )
    :vars
    (
      ?auto_73277 - HOIST
      ?auto_73278 - PLACE
      ?auto_73279 - TRUCK
      ?auto_73280 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73277 ?auto_73278 ) ( SURFACE-AT ?auto_73275 ?auto_73278 ) ( CLEAR ?auto_73275 ) ( IS-CRATE ?auto_73276 ) ( not ( = ?auto_73275 ?auto_73276 ) ) ( AVAILABLE ?auto_73277 ) ( IN ?auto_73276 ?auto_73279 ) ( ON ?auto_73275 ?auto_73274 ) ( not ( = ?auto_73274 ?auto_73275 ) ) ( not ( = ?auto_73274 ?auto_73276 ) ) ( TRUCK-AT ?auto_73279 ?auto_73280 ) ( not ( = ?auto_73280 ?auto_73278 ) ) ( ON ?auto_73273 ?auto_73272 ) ( ON ?auto_73274 ?auto_73273 ) ( not ( = ?auto_73272 ?auto_73273 ) ) ( not ( = ?auto_73272 ?auto_73274 ) ) ( not ( = ?auto_73272 ?auto_73275 ) ) ( not ( = ?auto_73272 ?auto_73276 ) ) ( not ( = ?auto_73273 ?auto_73274 ) ) ( not ( = ?auto_73273 ?auto_73275 ) ) ( not ( = ?auto_73273 ?auto_73276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73274 ?auto_73275 ?auto_73276 )
      ( MAKE-4CRATE-VERIFY ?auto_73272 ?auto_73273 ?auto_73274 ?auto_73275 ?auto_73276 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73306 - SURFACE
      ?auto_73307 - SURFACE
      ?auto_73308 - SURFACE
      ?auto_73309 - SURFACE
      ?auto_73310 - SURFACE
    )
    :vars
    (
      ?auto_73314 - HOIST
      ?auto_73311 - PLACE
      ?auto_73313 - TRUCK
      ?auto_73315 - PLACE
      ?auto_73312 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_73314 ?auto_73311 ) ( SURFACE-AT ?auto_73309 ?auto_73311 ) ( CLEAR ?auto_73309 ) ( IS-CRATE ?auto_73310 ) ( not ( = ?auto_73309 ?auto_73310 ) ) ( AVAILABLE ?auto_73314 ) ( ON ?auto_73309 ?auto_73308 ) ( not ( = ?auto_73308 ?auto_73309 ) ) ( not ( = ?auto_73308 ?auto_73310 ) ) ( TRUCK-AT ?auto_73313 ?auto_73315 ) ( not ( = ?auto_73315 ?auto_73311 ) ) ( HOIST-AT ?auto_73312 ?auto_73315 ) ( LIFTING ?auto_73312 ?auto_73310 ) ( not ( = ?auto_73314 ?auto_73312 ) ) ( ON ?auto_73307 ?auto_73306 ) ( ON ?auto_73308 ?auto_73307 ) ( not ( = ?auto_73306 ?auto_73307 ) ) ( not ( = ?auto_73306 ?auto_73308 ) ) ( not ( = ?auto_73306 ?auto_73309 ) ) ( not ( = ?auto_73306 ?auto_73310 ) ) ( not ( = ?auto_73307 ?auto_73308 ) ) ( not ( = ?auto_73307 ?auto_73309 ) ) ( not ( = ?auto_73307 ?auto_73310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73308 ?auto_73309 ?auto_73310 )
      ( MAKE-4CRATE-VERIFY ?auto_73306 ?auto_73307 ?auto_73308 ?auto_73309 ?auto_73310 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73344 - SURFACE
      ?auto_73345 - SURFACE
      ?auto_73346 - SURFACE
      ?auto_73347 - SURFACE
      ?auto_73348 - SURFACE
    )
    :vars
    (
      ?auto_73354 - HOIST
      ?auto_73352 - PLACE
      ?auto_73349 - TRUCK
      ?auto_73350 - PLACE
      ?auto_73351 - HOIST
      ?auto_73353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73354 ?auto_73352 ) ( SURFACE-AT ?auto_73347 ?auto_73352 ) ( CLEAR ?auto_73347 ) ( IS-CRATE ?auto_73348 ) ( not ( = ?auto_73347 ?auto_73348 ) ) ( AVAILABLE ?auto_73354 ) ( ON ?auto_73347 ?auto_73346 ) ( not ( = ?auto_73346 ?auto_73347 ) ) ( not ( = ?auto_73346 ?auto_73348 ) ) ( TRUCK-AT ?auto_73349 ?auto_73350 ) ( not ( = ?auto_73350 ?auto_73352 ) ) ( HOIST-AT ?auto_73351 ?auto_73350 ) ( not ( = ?auto_73354 ?auto_73351 ) ) ( AVAILABLE ?auto_73351 ) ( SURFACE-AT ?auto_73348 ?auto_73350 ) ( ON ?auto_73348 ?auto_73353 ) ( CLEAR ?auto_73348 ) ( not ( = ?auto_73347 ?auto_73353 ) ) ( not ( = ?auto_73348 ?auto_73353 ) ) ( not ( = ?auto_73346 ?auto_73353 ) ) ( ON ?auto_73345 ?auto_73344 ) ( ON ?auto_73346 ?auto_73345 ) ( not ( = ?auto_73344 ?auto_73345 ) ) ( not ( = ?auto_73344 ?auto_73346 ) ) ( not ( = ?auto_73344 ?auto_73347 ) ) ( not ( = ?auto_73344 ?auto_73348 ) ) ( not ( = ?auto_73344 ?auto_73353 ) ) ( not ( = ?auto_73345 ?auto_73346 ) ) ( not ( = ?auto_73345 ?auto_73347 ) ) ( not ( = ?auto_73345 ?auto_73348 ) ) ( not ( = ?auto_73345 ?auto_73353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73346 ?auto_73347 ?auto_73348 )
      ( MAKE-4CRATE-VERIFY ?auto_73344 ?auto_73345 ?auto_73346 ?auto_73347 ?auto_73348 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73383 - SURFACE
      ?auto_73384 - SURFACE
      ?auto_73385 - SURFACE
      ?auto_73386 - SURFACE
      ?auto_73387 - SURFACE
    )
    :vars
    (
      ?auto_73393 - HOIST
      ?auto_73389 - PLACE
      ?auto_73388 - PLACE
      ?auto_73390 - HOIST
      ?auto_73392 - SURFACE
      ?auto_73391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73393 ?auto_73389 ) ( SURFACE-AT ?auto_73386 ?auto_73389 ) ( CLEAR ?auto_73386 ) ( IS-CRATE ?auto_73387 ) ( not ( = ?auto_73386 ?auto_73387 ) ) ( AVAILABLE ?auto_73393 ) ( ON ?auto_73386 ?auto_73385 ) ( not ( = ?auto_73385 ?auto_73386 ) ) ( not ( = ?auto_73385 ?auto_73387 ) ) ( not ( = ?auto_73388 ?auto_73389 ) ) ( HOIST-AT ?auto_73390 ?auto_73388 ) ( not ( = ?auto_73393 ?auto_73390 ) ) ( AVAILABLE ?auto_73390 ) ( SURFACE-AT ?auto_73387 ?auto_73388 ) ( ON ?auto_73387 ?auto_73392 ) ( CLEAR ?auto_73387 ) ( not ( = ?auto_73386 ?auto_73392 ) ) ( not ( = ?auto_73387 ?auto_73392 ) ) ( not ( = ?auto_73385 ?auto_73392 ) ) ( TRUCK-AT ?auto_73391 ?auto_73389 ) ( ON ?auto_73384 ?auto_73383 ) ( ON ?auto_73385 ?auto_73384 ) ( not ( = ?auto_73383 ?auto_73384 ) ) ( not ( = ?auto_73383 ?auto_73385 ) ) ( not ( = ?auto_73383 ?auto_73386 ) ) ( not ( = ?auto_73383 ?auto_73387 ) ) ( not ( = ?auto_73383 ?auto_73392 ) ) ( not ( = ?auto_73384 ?auto_73385 ) ) ( not ( = ?auto_73384 ?auto_73386 ) ) ( not ( = ?auto_73384 ?auto_73387 ) ) ( not ( = ?auto_73384 ?auto_73392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73385 ?auto_73386 ?auto_73387 )
      ( MAKE-4CRATE-VERIFY ?auto_73383 ?auto_73384 ?auto_73385 ?auto_73386 ?auto_73387 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73422 - SURFACE
      ?auto_73423 - SURFACE
      ?auto_73424 - SURFACE
      ?auto_73425 - SURFACE
      ?auto_73426 - SURFACE
    )
    :vars
    (
      ?auto_73427 - HOIST
      ?auto_73428 - PLACE
      ?auto_73429 - PLACE
      ?auto_73431 - HOIST
      ?auto_73430 - SURFACE
      ?auto_73432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73427 ?auto_73428 ) ( IS-CRATE ?auto_73426 ) ( not ( = ?auto_73425 ?auto_73426 ) ) ( not ( = ?auto_73424 ?auto_73425 ) ) ( not ( = ?auto_73424 ?auto_73426 ) ) ( not ( = ?auto_73429 ?auto_73428 ) ) ( HOIST-AT ?auto_73431 ?auto_73429 ) ( not ( = ?auto_73427 ?auto_73431 ) ) ( AVAILABLE ?auto_73431 ) ( SURFACE-AT ?auto_73426 ?auto_73429 ) ( ON ?auto_73426 ?auto_73430 ) ( CLEAR ?auto_73426 ) ( not ( = ?auto_73425 ?auto_73430 ) ) ( not ( = ?auto_73426 ?auto_73430 ) ) ( not ( = ?auto_73424 ?auto_73430 ) ) ( TRUCK-AT ?auto_73432 ?auto_73428 ) ( SURFACE-AT ?auto_73424 ?auto_73428 ) ( CLEAR ?auto_73424 ) ( LIFTING ?auto_73427 ?auto_73425 ) ( IS-CRATE ?auto_73425 ) ( ON ?auto_73423 ?auto_73422 ) ( ON ?auto_73424 ?auto_73423 ) ( not ( = ?auto_73422 ?auto_73423 ) ) ( not ( = ?auto_73422 ?auto_73424 ) ) ( not ( = ?auto_73422 ?auto_73425 ) ) ( not ( = ?auto_73422 ?auto_73426 ) ) ( not ( = ?auto_73422 ?auto_73430 ) ) ( not ( = ?auto_73423 ?auto_73424 ) ) ( not ( = ?auto_73423 ?auto_73425 ) ) ( not ( = ?auto_73423 ?auto_73426 ) ) ( not ( = ?auto_73423 ?auto_73430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73424 ?auto_73425 ?auto_73426 )
      ( MAKE-4CRATE-VERIFY ?auto_73422 ?auto_73423 ?auto_73424 ?auto_73425 ?auto_73426 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73461 - SURFACE
      ?auto_73462 - SURFACE
      ?auto_73463 - SURFACE
      ?auto_73464 - SURFACE
      ?auto_73465 - SURFACE
    )
    :vars
    (
      ?auto_73471 - HOIST
      ?auto_73469 - PLACE
      ?auto_73468 - PLACE
      ?auto_73470 - HOIST
      ?auto_73467 - SURFACE
      ?auto_73466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73471 ?auto_73469 ) ( IS-CRATE ?auto_73465 ) ( not ( = ?auto_73464 ?auto_73465 ) ) ( not ( = ?auto_73463 ?auto_73464 ) ) ( not ( = ?auto_73463 ?auto_73465 ) ) ( not ( = ?auto_73468 ?auto_73469 ) ) ( HOIST-AT ?auto_73470 ?auto_73468 ) ( not ( = ?auto_73471 ?auto_73470 ) ) ( AVAILABLE ?auto_73470 ) ( SURFACE-AT ?auto_73465 ?auto_73468 ) ( ON ?auto_73465 ?auto_73467 ) ( CLEAR ?auto_73465 ) ( not ( = ?auto_73464 ?auto_73467 ) ) ( not ( = ?auto_73465 ?auto_73467 ) ) ( not ( = ?auto_73463 ?auto_73467 ) ) ( TRUCK-AT ?auto_73466 ?auto_73469 ) ( SURFACE-AT ?auto_73463 ?auto_73469 ) ( CLEAR ?auto_73463 ) ( IS-CRATE ?auto_73464 ) ( AVAILABLE ?auto_73471 ) ( IN ?auto_73464 ?auto_73466 ) ( ON ?auto_73462 ?auto_73461 ) ( ON ?auto_73463 ?auto_73462 ) ( not ( = ?auto_73461 ?auto_73462 ) ) ( not ( = ?auto_73461 ?auto_73463 ) ) ( not ( = ?auto_73461 ?auto_73464 ) ) ( not ( = ?auto_73461 ?auto_73465 ) ) ( not ( = ?auto_73461 ?auto_73467 ) ) ( not ( = ?auto_73462 ?auto_73463 ) ) ( not ( = ?auto_73462 ?auto_73464 ) ) ( not ( = ?auto_73462 ?auto_73465 ) ) ( not ( = ?auto_73462 ?auto_73467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73463 ?auto_73464 ?auto_73465 )
      ( MAKE-4CRATE-VERIFY ?auto_73461 ?auto_73462 ?auto_73463 ?auto_73464 ?auto_73465 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73500 - SURFACE
      ?auto_73501 - SURFACE
      ?auto_73502 - SURFACE
      ?auto_73503 - SURFACE
      ?auto_73504 - SURFACE
    )
    :vars
    (
      ?auto_73510 - HOIST
      ?auto_73506 - PLACE
      ?auto_73505 - PLACE
      ?auto_73507 - HOIST
      ?auto_73509 - SURFACE
      ?auto_73508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73510 ?auto_73506 ) ( IS-CRATE ?auto_73504 ) ( not ( = ?auto_73503 ?auto_73504 ) ) ( not ( = ?auto_73502 ?auto_73503 ) ) ( not ( = ?auto_73502 ?auto_73504 ) ) ( not ( = ?auto_73505 ?auto_73506 ) ) ( HOIST-AT ?auto_73507 ?auto_73505 ) ( not ( = ?auto_73510 ?auto_73507 ) ) ( AVAILABLE ?auto_73507 ) ( SURFACE-AT ?auto_73504 ?auto_73505 ) ( ON ?auto_73504 ?auto_73509 ) ( CLEAR ?auto_73504 ) ( not ( = ?auto_73503 ?auto_73509 ) ) ( not ( = ?auto_73504 ?auto_73509 ) ) ( not ( = ?auto_73502 ?auto_73509 ) ) ( SURFACE-AT ?auto_73502 ?auto_73506 ) ( CLEAR ?auto_73502 ) ( IS-CRATE ?auto_73503 ) ( AVAILABLE ?auto_73510 ) ( IN ?auto_73503 ?auto_73508 ) ( TRUCK-AT ?auto_73508 ?auto_73505 ) ( ON ?auto_73501 ?auto_73500 ) ( ON ?auto_73502 ?auto_73501 ) ( not ( = ?auto_73500 ?auto_73501 ) ) ( not ( = ?auto_73500 ?auto_73502 ) ) ( not ( = ?auto_73500 ?auto_73503 ) ) ( not ( = ?auto_73500 ?auto_73504 ) ) ( not ( = ?auto_73500 ?auto_73509 ) ) ( not ( = ?auto_73501 ?auto_73502 ) ) ( not ( = ?auto_73501 ?auto_73503 ) ) ( not ( = ?auto_73501 ?auto_73504 ) ) ( not ( = ?auto_73501 ?auto_73509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73502 ?auto_73503 ?auto_73504 )
      ( MAKE-4CRATE-VERIFY ?auto_73500 ?auto_73501 ?auto_73502 ?auto_73503 ?auto_73504 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73539 - SURFACE
      ?auto_73540 - SURFACE
      ?auto_73541 - SURFACE
      ?auto_73542 - SURFACE
      ?auto_73543 - SURFACE
    )
    :vars
    (
      ?auto_73547 - HOIST
      ?auto_73546 - PLACE
      ?auto_73549 - PLACE
      ?auto_73545 - HOIST
      ?auto_73544 - SURFACE
      ?auto_73548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73547 ?auto_73546 ) ( IS-CRATE ?auto_73543 ) ( not ( = ?auto_73542 ?auto_73543 ) ) ( not ( = ?auto_73541 ?auto_73542 ) ) ( not ( = ?auto_73541 ?auto_73543 ) ) ( not ( = ?auto_73549 ?auto_73546 ) ) ( HOIST-AT ?auto_73545 ?auto_73549 ) ( not ( = ?auto_73547 ?auto_73545 ) ) ( SURFACE-AT ?auto_73543 ?auto_73549 ) ( ON ?auto_73543 ?auto_73544 ) ( CLEAR ?auto_73543 ) ( not ( = ?auto_73542 ?auto_73544 ) ) ( not ( = ?auto_73543 ?auto_73544 ) ) ( not ( = ?auto_73541 ?auto_73544 ) ) ( SURFACE-AT ?auto_73541 ?auto_73546 ) ( CLEAR ?auto_73541 ) ( IS-CRATE ?auto_73542 ) ( AVAILABLE ?auto_73547 ) ( TRUCK-AT ?auto_73548 ?auto_73549 ) ( LIFTING ?auto_73545 ?auto_73542 ) ( ON ?auto_73540 ?auto_73539 ) ( ON ?auto_73541 ?auto_73540 ) ( not ( = ?auto_73539 ?auto_73540 ) ) ( not ( = ?auto_73539 ?auto_73541 ) ) ( not ( = ?auto_73539 ?auto_73542 ) ) ( not ( = ?auto_73539 ?auto_73543 ) ) ( not ( = ?auto_73539 ?auto_73544 ) ) ( not ( = ?auto_73540 ?auto_73541 ) ) ( not ( = ?auto_73540 ?auto_73542 ) ) ( not ( = ?auto_73540 ?auto_73543 ) ) ( not ( = ?auto_73540 ?auto_73544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73541 ?auto_73542 ?auto_73543 )
      ( MAKE-4CRATE-VERIFY ?auto_73539 ?auto_73540 ?auto_73541 ?auto_73542 ?auto_73543 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73581 - SURFACE
      ?auto_73582 - SURFACE
      ?auto_73583 - SURFACE
      ?auto_73584 - SURFACE
      ?auto_73585 - SURFACE
    )
    :vars
    (
      ?auto_73592 - HOIST
      ?auto_73586 - PLACE
      ?auto_73591 - PLACE
      ?auto_73588 - HOIST
      ?auto_73590 - SURFACE
      ?auto_73587 - TRUCK
      ?auto_73589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73592 ?auto_73586 ) ( IS-CRATE ?auto_73585 ) ( not ( = ?auto_73584 ?auto_73585 ) ) ( not ( = ?auto_73583 ?auto_73584 ) ) ( not ( = ?auto_73583 ?auto_73585 ) ) ( not ( = ?auto_73591 ?auto_73586 ) ) ( HOIST-AT ?auto_73588 ?auto_73591 ) ( not ( = ?auto_73592 ?auto_73588 ) ) ( SURFACE-AT ?auto_73585 ?auto_73591 ) ( ON ?auto_73585 ?auto_73590 ) ( CLEAR ?auto_73585 ) ( not ( = ?auto_73584 ?auto_73590 ) ) ( not ( = ?auto_73585 ?auto_73590 ) ) ( not ( = ?auto_73583 ?auto_73590 ) ) ( SURFACE-AT ?auto_73583 ?auto_73586 ) ( CLEAR ?auto_73583 ) ( IS-CRATE ?auto_73584 ) ( AVAILABLE ?auto_73592 ) ( TRUCK-AT ?auto_73587 ?auto_73591 ) ( AVAILABLE ?auto_73588 ) ( SURFACE-AT ?auto_73584 ?auto_73591 ) ( ON ?auto_73584 ?auto_73589 ) ( CLEAR ?auto_73584 ) ( not ( = ?auto_73584 ?auto_73589 ) ) ( not ( = ?auto_73585 ?auto_73589 ) ) ( not ( = ?auto_73583 ?auto_73589 ) ) ( not ( = ?auto_73590 ?auto_73589 ) ) ( ON ?auto_73582 ?auto_73581 ) ( ON ?auto_73583 ?auto_73582 ) ( not ( = ?auto_73581 ?auto_73582 ) ) ( not ( = ?auto_73581 ?auto_73583 ) ) ( not ( = ?auto_73581 ?auto_73584 ) ) ( not ( = ?auto_73581 ?auto_73585 ) ) ( not ( = ?auto_73581 ?auto_73590 ) ) ( not ( = ?auto_73581 ?auto_73589 ) ) ( not ( = ?auto_73582 ?auto_73583 ) ) ( not ( = ?auto_73582 ?auto_73584 ) ) ( not ( = ?auto_73582 ?auto_73585 ) ) ( not ( = ?auto_73582 ?auto_73590 ) ) ( not ( = ?auto_73582 ?auto_73589 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73583 ?auto_73584 ?auto_73585 )
      ( MAKE-4CRATE-VERIFY ?auto_73581 ?auto_73582 ?auto_73583 ?auto_73584 ?auto_73585 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73624 - SURFACE
      ?auto_73625 - SURFACE
      ?auto_73626 - SURFACE
      ?auto_73627 - SURFACE
      ?auto_73628 - SURFACE
    )
    :vars
    (
      ?auto_73632 - HOIST
      ?auto_73629 - PLACE
      ?auto_73630 - PLACE
      ?auto_73633 - HOIST
      ?auto_73631 - SURFACE
      ?auto_73635 - SURFACE
      ?auto_73634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73632 ?auto_73629 ) ( IS-CRATE ?auto_73628 ) ( not ( = ?auto_73627 ?auto_73628 ) ) ( not ( = ?auto_73626 ?auto_73627 ) ) ( not ( = ?auto_73626 ?auto_73628 ) ) ( not ( = ?auto_73630 ?auto_73629 ) ) ( HOIST-AT ?auto_73633 ?auto_73630 ) ( not ( = ?auto_73632 ?auto_73633 ) ) ( SURFACE-AT ?auto_73628 ?auto_73630 ) ( ON ?auto_73628 ?auto_73631 ) ( CLEAR ?auto_73628 ) ( not ( = ?auto_73627 ?auto_73631 ) ) ( not ( = ?auto_73628 ?auto_73631 ) ) ( not ( = ?auto_73626 ?auto_73631 ) ) ( SURFACE-AT ?auto_73626 ?auto_73629 ) ( CLEAR ?auto_73626 ) ( IS-CRATE ?auto_73627 ) ( AVAILABLE ?auto_73632 ) ( AVAILABLE ?auto_73633 ) ( SURFACE-AT ?auto_73627 ?auto_73630 ) ( ON ?auto_73627 ?auto_73635 ) ( CLEAR ?auto_73627 ) ( not ( = ?auto_73627 ?auto_73635 ) ) ( not ( = ?auto_73628 ?auto_73635 ) ) ( not ( = ?auto_73626 ?auto_73635 ) ) ( not ( = ?auto_73631 ?auto_73635 ) ) ( TRUCK-AT ?auto_73634 ?auto_73629 ) ( ON ?auto_73625 ?auto_73624 ) ( ON ?auto_73626 ?auto_73625 ) ( not ( = ?auto_73624 ?auto_73625 ) ) ( not ( = ?auto_73624 ?auto_73626 ) ) ( not ( = ?auto_73624 ?auto_73627 ) ) ( not ( = ?auto_73624 ?auto_73628 ) ) ( not ( = ?auto_73624 ?auto_73631 ) ) ( not ( = ?auto_73624 ?auto_73635 ) ) ( not ( = ?auto_73625 ?auto_73626 ) ) ( not ( = ?auto_73625 ?auto_73627 ) ) ( not ( = ?auto_73625 ?auto_73628 ) ) ( not ( = ?auto_73625 ?auto_73631 ) ) ( not ( = ?auto_73625 ?auto_73635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73626 ?auto_73627 ?auto_73628 )
      ( MAKE-4CRATE-VERIFY ?auto_73624 ?auto_73625 ?auto_73626 ?auto_73627 ?auto_73628 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73669 - SURFACE
      ?auto_73670 - SURFACE
      ?auto_73671 - SURFACE
      ?auto_73672 - SURFACE
      ?auto_73673 - SURFACE
    )
    :vars
    (
      ?auto_73679 - HOIST
      ?auto_73678 - PLACE
      ?auto_73674 - PLACE
      ?auto_73677 - HOIST
      ?auto_73680 - SURFACE
      ?auto_73676 - SURFACE
      ?auto_73675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73679 ?auto_73678 ) ( IS-CRATE ?auto_73673 ) ( not ( = ?auto_73672 ?auto_73673 ) ) ( not ( = ?auto_73671 ?auto_73672 ) ) ( not ( = ?auto_73671 ?auto_73673 ) ) ( not ( = ?auto_73674 ?auto_73678 ) ) ( HOIST-AT ?auto_73677 ?auto_73674 ) ( not ( = ?auto_73679 ?auto_73677 ) ) ( SURFACE-AT ?auto_73673 ?auto_73674 ) ( ON ?auto_73673 ?auto_73680 ) ( CLEAR ?auto_73673 ) ( not ( = ?auto_73672 ?auto_73680 ) ) ( not ( = ?auto_73673 ?auto_73680 ) ) ( not ( = ?auto_73671 ?auto_73680 ) ) ( IS-CRATE ?auto_73672 ) ( AVAILABLE ?auto_73677 ) ( SURFACE-AT ?auto_73672 ?auto_73674 ) ( ON ?auto_73672 ?auto_73676 ) ( CLEAR ?auto_73672 ) ( not ( = ?auto_73672 ?auto_73676 ) ) ( not ( = ?auto_73673 ?auto_73676 ) ) ( not ( = ?auto_73671 ?auto_73676 ) ) ( not ( = ?auto_73680 ?auto_73676 ) ) ( TRUCK-AT ?auto_73675 ?auto_73678 ) ( SURFACE-AT ?auto_73670 ?auto_73678 ) ( CLEAR ?auto_73670 ) ( LIFTING ?auto_73679 ?auto_73671 ) ( IS-CRATE ?auto_73671 ) ( not ( = ?auto_73670 ?auto_73671 ) ) ( not ( = ?auto_73672 ?auto_73670 ) ) ( not ( = ?auto_73673 ?auto_73670 ) ) ( not ( = ?auto_73680 ?auto_73670 ) ) ( not ( = ?auto_73676 ?auto_73670 ) ) ( ON ?auto_73670 ?auto_73669 ) ( not ( = ?auto_73669 ?auto_73670 ) ) ( not ( = ?auto_73669 ?auto_73671 ) ) ( not ( = ?auto_73669 ?auto_73672 ) ) ( not ( = ?auto_73669 ?auto_73673 ) ) ( not ( = ?auto_73669 ?auto_73680 ) ) ( not ( = ?auto_73669 ?auto_73676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73671 ?auto_73672 ?auto_73673 )
      ( MAKE-4CRATE-VERIFY ?auto_73669 ?auto_73670 ?auto_73671 ?auto_73672 ?auto_73673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_73755 - SURFACE
      ?auto_73756 - SURFACE
    )
    :vars
    (
      ?auto_73761 - HOIST
      ?auto_73762 - PLACE
      ?auto_73757 - SURFACE
      ?auto_73763 - PLACE
      ?auto_73759 - HOIST
      ?auto_73760 - SURFACE
      ?auto_73758 - TRUCK
      ?auto_73764 - SURFACE
      ?auto_73765 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73761 ?auto_73762 ) ( IS-CRATE ?auto_73756 ) ( not ( = ?auto_73755 ?auto_73756 ) ) ( not ( = ?auto_73757 ?auto_73755 ) ) ( not ( = ?auto_73757 ?auto_73756 ) ) ( not ( = ?auto_73763 ?auto_73762 ) ) ( HOIST-AT ?auto_73759 ?auto_73763 ) ( not ( = ?auto_73761 ?auto_73759 ) ) ( SURFACE-AT ?auto_73756 ?auto_73763 ) ( ON ?auto_73756 ?auto_73760 ) ( CLEAR ?auto_73756 ) ( not ( = ?auto_73755 ?auto_73760 ) ) ( not ( = ?auto_73756 ?auto_73760 ) ) ( not ( = ?auto_73757 ?auto_73760 ) ) ( SURFACE-AT ?auto_73757 ?auto_73762 ) ( CLEAR ?auto_73757 ) ( IS-CRATE ?auto_73755 ) ( AVAILABLE ?auto_73761 ) ( TRUCK-AT ?auto_73758 ?auto_73763 ) ( SURFACE-AT ?auto_73755 ?auto_73763 ) ( ON ?auto_73755 ?auto_73764 ) ( CLEAR ?auto_73755 ) ( not ( = ?auto_73755 ?auto_73764 ) ) ( not ( = ?auto_73756 ?auto_73764 ) ) ( not ( = ?auto_73757 ?auto_73764 ) ) ( not ( = ?auto_73760 ?auto_73764 ) ) ( LIFTING ?auto_73759 ?auto_73765 ) ( IS-CRATE ?auto_73765 ) ( not ( = ?auto_73755 ?auto_73765 ) ) ( not ( = ?auto_73756 ?auto_73765 ) ) ( not ( = ?auto_73757 ?auto_73765 ) ) ( not ( = ?auto_73760 ?auto_73765 ) ) ( not ( = ?auto_73764 ?auto_73765 ) ) )
    :subtasks
    ( ( !LOAD ?auto_73759 ?auto_73765 ?auto_73758 ?auto_73763 )
      ( MAKE-1CRATE ?auto_73755 ?auto_73756 )
      ( MAKE-1CRATE-VERIFY ?auto_73755 ?auto_73756 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74143 - SURFACE
      ?auto_74144 - SURFACE
      ?auto_74145 - SURFACE
      ?auto_74146 - SURFACE
      ?auto_74147 - SURFACE
      ?auto_74148 - SURFACE
    )
    :vars
    (
      ?auto_74150 - HOIST
      ?auto_74149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74150 ?auto_74149 ) ( SURFACE-AT ?auto_74147 ?auto_74149 ) ( CLEAR ?auto_74147 ) ( LIFTING ?auto_74150 ?auto_74148 ) ( IS-CRATE ?auto_74148 ) ( not ( = ?auto_74147 ?auto_74148 ) ) ( ON ?auto_74144 ?auto_74143 ) ( ON ?auto_74145 ?auto_74144 ) ( ON ?auto_74146 ?auto_74145 ) ( ON ?auto_74147 ?auto_74146 ) ( not ( = ?auto_74143 ?auto_74144 ) ) ( not ( = ?auto_74143 ?auto_74145 ) ) ( not ( = ?auto_74143 ?auto_74146 ) ) ( not ( = ?auto_74143 ?auto_74147 ) ) ( not ( = ?auto_74143 ?auto_74148 ) ) ( not ( = ?auto_74144 ?auto_74145 ) ) ( not ( = ?auto_74144 ?auto_74146 ) ) ( not ( = ?auto_74144 ?auto_74147 ) ) ( not ( = ?auto_74144 ?auto_74148 ) ) ( not ( = ?auto_74145 ?auto_74146 ) ) ( not ( = ?auto_74145 ?auto_74147 ) ) ( not ( = ?auto_74145 ?auto_74148 ) ) ( not ( = ?auto_74146 ?auto_74147 ) ) ( not ( = ?auto_74146 ?auto_74148 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_74147 ?auto_74148 )
      ( MAKE-5CRATE-VERIFY ?auto_74143 ?auto_74144 ?auto_74145 ?auto_74146 ?auto_74147 ?auto_74148 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74177 - SURFACE
      ?auto_74178 - SURFACE
      ?auto_74179 - SURFACE
      ?auto_74180 - SURFACE
      ?auto_74181 - SURFACE
      ?auto_74182 - SURFACE
    )
    :vars
    (
      ?auto_74184 - HOIST
      ?auto_74185 - PLACE
      ?auto_74183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74184 ?auto_74185 ) ( SURFACE-AT ?auto_74181 ?auto_74185 ) ( CLEAR ?auto_74181 ) ( IS-CRATE ?auto_74182 ) ( not ( = ?auto_74181 ?auto_74182 ) ) ( TRUCK-AT ?auto_74183 ?auto_74185 ) ( AVAILABLE ?auto_74184 ) ( IN ?auto_74182 ?auto_74183 ) ( ON ?auto_74181 ?auto_74180 ) ( not ( = ?auto_74180 ?auto_74181 ) ) ( not ( = ?auto_74180 ?auto_74182 ) ) ( ON ?auto_74178 ?auto_74177 ) ( ON ?auto_74179 ?auto_74178 ) ( ON ?auto_74180 ?auto_74179 ) ( not ( = ?auto_74177 ?auto_74178 ) ) ( not ( = ?auto_74177 ?auto_74179 ) ) ( not ( = ?auto_74177 ?auto_74180 ) ) ( not ( = ?auto_74177 ?auto_74181 ) ) ( not ( = ?auto_74177 ?auto_74182 ) ) ( not ( = ?auto_74178 ?auto_74179 ) ) ( not ( = ?auto_74178 ?auto_74180 ) ) ( not ( = ?auto_74178 ?auto_74181 ) ) ( not ( = ?auto_74178 ?auto_74182 ) ) ( not ( = ?auto_74179 ?auto_74180 ) ) ( not ( = ?auto_74179 ?auto_74181 ) ) ( not ( = ?auto_74179 ?auto_74182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74180 ?auto_74181 ?auto_74182 )
      ( MAKE-5CRATE-VERIFY ?auto_74177 ?auto_74178 ?auto_74179 ?auto_74180 ?auto_74181 ?auto_74182 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74217 - SURFACE
      ?auto_74218 - SURFACE
      ?auto_74219 - SURFACE
      ?auto_74220 - SURFACE
      ?auto_74221 - SURFACE
      ?auto_74222 - SURFACE
    )
    :vars
    (
      ?auto_74226 - HOIST
      ?auto_74223 - PLACE
      ?auto_74225 - TRUCK
      ?auto_74224 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74226 ?auto_74223 ) ( SURFACE-AT ?auto_74221 ?auto_74223 ) ( CLEAR ?auto_74221 ) ( IS-CRATE ?auto_74222 ) ( not ( = ?auto_74221 ?auto_74222 ) ) ( AVAILABLE ?auto_74226 ) ( IN ?auto_74222 ?auto_74225 ) ( ON ?auto_74221 ?auto_74220 ) ( not ( = ?auto_74220 ?auto_74221 ) ) ( not ( = ?auto_74220 ?auto_74222 ) ) ( TRUCK-AT ?auto_74225 ?auto_74224 ) ( not ( = ?auto_74224 ?auto_74223 ) ) ( ON ?auto_74218 ?auto_74217 ) ( ON ?auto_74219 ?auto_74218 ) ( ON ?auto_74220 ?auto_74219 ) ( not ( = ?auto_74217 ?auto_74218 ) ) ( not ( = ?auto_74217 ?auto_74219 ) ) ( not ( = ?auto_74217 ?auto_74220 ) ) ( not ( = ?auto_74217 ?auto_74221 ) ) ( not ( = ?auto_74217 ?auto_74222 ) ) ( not ( = ?auto_74218 ?auto_74219 ) ) ( not ( = ?auto_74218 ?auto_74220 ) ) ( not ( = ?auto_74218 ?auto_74221 ) ) ( not ( = ?auto_74218 ?auto_74222 ) ) ( not ( = ?auto_74219 ?auto_74220 ) ) ( not ( = ?auto_74219 ?auto_74221 ) ) ( not ( = ?auto_74219 ?auto_74222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74220 ?auto_74221 ?auto_74222 )
      ( MAKE-5CRATE-VERIFY ?auto_74217 ?auto_74218 ?auto_74219 ?auto_74220 ?auto_74221 ?auto_74222 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74262 - SURFACE
      ?auto_74263 - SURFACE
      ?auto_74264 - SURFACE
      ?auto_74265 - SURFACE
      ?auto_74266 - SURFACE
      ?auto_74267 - SURFACE
    )
    :vars
    (
      ?auto_74271 - HOIST
      ?auto_74272 - PLACE
      ?auto_74270 - TRUCK
      ?auto_74268 - PLACE
      ?auto_74269 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_74271 ?auto_74272 ) ( SURFACE-AT ?auto_74266 ?auto_74272 ) ( CLEAR ?auto_74266 ) ( IS-CRATE ?auto_74267 ) ( not ( = ?auto_74266 ?auto_74267 ) ) ( AVAILABLE ?auto_74271 ) ( ON ?auto_74266 ?auto_74265 ) ( not ( = ?auto_74265 ?auto_74266 ) ) ( not ( = ?auto_74265 ?auto_74267 ) ) ( TRUCK-AT ?auto_74270 ?auto_74268 ) ( not ( = ?auto_74268 ?auto_74272 ) ) ( HOIST-AT ?auto_74269 ?auto_74268 ) ( LIFTING ?auto_74269 ?auto_74267 ) ( not ( = ?auto_74271 ?auto_74269 ) ) ( ON ?auto_74263 ?auto_74262 ) ( ON ?auto_74264 ?auto_74263 ) ( ON ?auto_74265 ?auto_74264 ) ( not ( = ?auto_74262 ?auto_74263 ) ) ( not ( = ?auto_74262 ?auto_74264 ) ) ( not ( = ?auto_74262 ?auto_74265 ) ) ( not ( = ?auto_74262 ?auto_74266 ) ) ( not ( = ?auto_74262 ?auto_74267 ) ) ( not ( = ?auto_74263 ?auto_74264 ) ) ( not ( = ?auto_74263 ?auto_74265 ) ) ( not ( = ?auto_74263 ?auto_74266 ) ) ( not ( = ?auto_74263 ?auto_74267 ) ) ( not ( = ?auto_74264 ?auto_74265 ) ) ( not ( = ?auto_74264 ?auto_74266 ) ) ( not ( = ?auto_74264 ?auto_74267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74265 ?auto_74266 ?auto_74267 )
      ( MAKE-5CRATE-VERIFY ?auto_74262 ?auto_74263 ?auto_74264 ?auto_74265 ?auto_74266 ?auto_74267 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74312 - SURFACE
      ?auto_74313 - SURFACE
      ?auto_74314 - SURFACE
      ?auto_74315 - SURFACE
      ?auto_74316 - SURFACE
      ?auto_74317 - SURFACE
    )
    :vars
    (
      ?auto_74318 - HOIST
      ?auto_74320 - PLACE
      ?auto_74321 - TRUCK
      ?auto_74322 - PLACE
      ?auto_74323 - HOIST
      ?auto_74319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74318 ?auto_74320 ) ( SURFACE-AT ?auto_74316 ?auto_74320 ) ( CLEAR ?auto_74316 ) ( IS-CRATE ?auto_74317 ) ( not ( = ?auto_74316 ?auto_74317 ) ) ( AVAILABLE ?auto_74318 ) ( ON ?auto_74316 ?auto_74315 ) ( not ( = ?auto_74315 ?auto_74316 ) ) ( not ( = ?auto_74315 ?auto_74317 ) ) ( TRUCK-AT ?auto_74321 ?auto_74322 ) ( not ( = ?auto_74322 ?auto_74320 ) ) ( HOIST-AT ?auto_74323 ?auto_74322 ) ( not ( = ?auto_74318 ?auto_74323 ) ) ( AVAILABLE ?auto_74323 ) ( SURFACE-AT ?auto_74317 ?auto_74322 ) ( ON ?auto_74317 ?auto_74319 ) ( CLEAR ?auto_74317 ) ( not ( = ?auto_74316 ?auto_74319 ) ) ( not ( = ?auto_74317 ?auto_74319 ) ) ( not ( = ?auto_74315 ?auto_74319 ) ) ( ON ?auto_74313 ?auto_74312 ) ( ON ?auto_74314 ?auto_74313 ) ( ON ?auto_74315 ?auto_74314 ) ( not ( = ?auto_74312 ?auto_74313 ) ) ( not ( = ?auto_74312 ?auto_74314 ) ) ( not ( = ?auto_74312 ?auto_74315 ) ) ( not ( = ?auto_74312 ?auto_74316 ) ) ( not ( = ?auto_74312 ?auto_74317 ) ) ( not ( = ?auto_74312 ?auto_74319 ) ) ( not ( = ?auto_74313 ?auto_74314 ) ) ( not ( = ?auto_74313 ?auto_74315 ) ) ( not ( = ?auto_74313 ?auto_74316 ) ) ( not ( = ?auto_74313 ?auto_74317 ) ) ( not ( = ?auto_74313 ?auto_74319 ) ) ( not ( = ?auto_74314 ?auto_74315 ) ) ( not ( = ?auto_74314 ?auto_74316 ) ) ( not ( = ?auto_74314 ?auto_74317 ) ) ( not ( = ?auto_74314 ?auto_74319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74315 ?auto_74316 ?auto_74317 )
      ( MAKE-5CRATE-VERIFY ?auto_74312 ?auto_74313 ?auto_74314 ?auto_74315 ?auto_74316 ?auto_74317 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74363 - SURFACE
      ?auto_74364 - SURFACE
      ?auto_74365 - SURFACE
      ?auto_74366 - SURFACE
      ?auto_74367 - SURFACE
      ?auto_74368 - SURFACE
    )
    :vars
    (
      ?auto_74371 - HOIST
      ?auto_74372 - PLACE
      ?auto_74373 - PLACE
      ?auto_74374 - HOIST
      ?auto_74370 - SURFACE
      ?auto_74369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74371 ?auto_74372 ) ( SURFACE-AT ?auto_74367 ?auto_74372 ) ( CLEAR ?auto_74367 ) ( IS-CRATE ?auto_74368 ) ( not ( = ?auto_74367 ?auto_74368 ) ) ( AVAILABLE ?auto_74371 ) ( ON ?auto_74367 ?auto_74366 ) ( not ( = ?auto_74366 ?auto_74367 ) ) ( not ( = ?auto_74366 ?auto_74368 ) ) ( not ( = ?auto_74373 ?auto_74372 ) ) ( HOIST-AT ?auto_74374 ?auto_74373 ) ( not ( = ?auto_74371 ?auto_74374 ) ) ( AVAILABLE ?auto_74374 ) ( SURFACE-AT ?auto_74368 ?auto_74373 ) ( ON ?auto_74368 ?auto_74370 ) ( CLEAR ?auto_74368 ) ( not ( = ?auto_74367 ?auto_74370 ) ) ( not ( = ?auto_74368 ?auto_74370 ) ) ( not ( = ?auto_74366 ?auto_74370 ) ) ( TRUCK-AT ?auto_74369 ?auto_74372 ) ( ON ?auto_74364 ?auto_74363 ) ( ON ?auto_74365 ?auto_74364 ) ( ON ?auto_74366 ?auto_74365 ) ( not ( = ?auto_74363 ?auto_74364 ) ) ( not ( = ?auto_74363 ?auto_74365 ) ) ( not ( = ?auto_74363 ?auto_74366 ) ) ( not ( = ?auto_74363 ?auto_74367 ) ) ( not ( = ?auto_74363 ?auto_74368 ) ) ( not ( = ?auto_74363 ?auto_74370 ) ) ( not ( = ?auto_74364 ?auto_74365 ) ) ( not ( = ?auto_74364 ?auto_74366 ) ) ( not ( = ?auto_74364 ?auto_74367 ) ) ( not ( = ?auto_74364 ?auto_74368 ) ) ( not ( = ?auto_74364 ?auto_74370 ) ) ( not ( = ?auto_74365 ?auto_74366 ) ) ( not ( = ?auto_74365 ?auto_74367 ) ) ( not ( = ?auto_74365 ?auto_74368 ) ) ( not ( = ?auto_74365 ?auto_74370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74366 ?auto_74367 ?auto_74368 )
      ( MAKE-5CRATE-VERIFY ?auto_74363 ?auto_74364 ?auto_74365 ?auto_74366 ?auto_74367 ?auto_74368 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74414 - SURFACE
      ?auto_74415 - SURFACE
      ?auto_74416 - SURFACE
      ?auto_74417 - SURFACE
      ?auto_74418 - SURFACE
      ?auto_74419 - SURFACE
    )
    :vars
    (
      ?auto_74421 - HOIST
      ?auto_74425 - PLACE
      ?auto_74420 - PLACE
      ?auto_74422 - HOIST
      ?auto_74424 - SURFACE
      ?auto_74423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74421 ?auto_74425 ) ( IS-CRATE ?auto_74419 ) ( not ( = ?auto_74418 ?auto_74419 ) ) ( not ( = ?auto_74417 ?auto_74418 ) ) ( not ( = ?auto_74417 ?auto_74419 ) ) ( not ( = ?auto_74420 ?auto_74425 ) ) ( HOIST-AT ?auto_74422 ?auto_74420 ) ( not ( = ?auto_74421 ?auto_74422 ) ) ( AVAILABLE ?auto_74422 ) ( SURFACE-AT ?auto_74419 ?auto_74420 ) ( ON ?auto_74419 ?auto_74424 ) ( CLEAR ?auto_74419 ) ( not ( = ?auto_74418 ?auto_74424 ) ) ( not ( = ?auto_74419 ?auto_74424 ) ) ( not ( = ?auto_74417 ?auto_74424 ) ) ( TRUCK-AT ?auto_74423 ?auto_74425 ) ( SURFACE-AT ?auto_74417 ?auto_74425 ) ( CLEAR ?auto_74417 ) ( LIFTING ?auto_74421 ?auto_74418 ) ( IS-CRATE ?auto_74418 ) ( ON ?auto_74415 ?auto_74414 ) ( ON ?auto_74416 ?auto_74415 ) ( ON ?auto_74417 ?auto_74416 ) ( not ( = ?auto_74414 ?auto_74415 ) ) ( not ( = ?auto_74414 ?auto_74416 ) ) ( not ( = ?auto_74414 ?auto_74417 ) ) ( not ( = ?auto_74414 ?auto_74418 ) ) ( not ( = ?auto_74414 ?auto_74419 ) ) ( not ( = ?auto_74414 ?auto_74424 ) ) ( not ( = ?auto_74415 ?auto_74416 ) ) ( not ( = ?auto_74415 ?auto_74417 ) ) ( not ( = ?auto_74415 ?auto_74418 ) ) ( not ( = ?auto_74415 ?auto_74419 ) ) ( not ( = ?auto_74415 ?auto_74424 ) ) ( not ( = ?auto_74416 ?auto_74417 ) ) ( not ( = ?auto_74416 ?auto_74418 ) ) ( not ( = ?auto_74416 ?auto_74419 ) ) ( not ( = ?auto_74416 ?auto_74424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74417 ?auto_74418 ?auto_74419 )
      ( MAKE-5CRATE-VERIFY ?auto_74414 ?auto_74415 ?auto_74416 ?auto_74417 ?auto_74418 ?auto_74419 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74465 - SURFACE
      ?auto_74466 - SURFACE
      ?auto_74467 - SURFACE
      ?auto_74468 - SURFACE
      ?auto_74469 - SURFACE
      ?auto_74470 - SURFACE
    )
    :vars
    (
      ?auto_74474 - HOIST
      ?auto_74475 - PLACE
      ?auto_74476 - PLACE
      ?auto_74471 - HOIST
      ?auto_74473 - SURFACE
      ?auto_74472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74474 ?auto_74475 ) ( IS-CRATE ?auto_74470 ) ( not ( = ?auto_74469 ?auto_74470 ) ) ( not ( = ?auto_74468 ?auto_74469 ) ) ( not ( = ?auto_74468 ?auto_74470 ) ) ( not ( = ?auto_74476 ?auto_74475 ) ) ( HOIST-AT ?auto_74471 ?auto_74476 ) ( not ( = ?auto_74474 ?auto_74471 ) ) ( AVAILABLE ?auto_74471 ) ( SURFACE-AT ?auto_74470 ?auto_74476 ) ( ON ?auto_74470 ?auto_74473 ) ( CLEAR ?auto_74470 ) ( not ( = ?auto_74469 ?auto_74473 ) ) ( not ( = ?auto_74470 ?auto_74473 ) ) ( not ( = ?auto_74468 ?auto_74473 ) ) ( TRUCK-AT ?auto_74472 ?auto_74475 ) ( SURFACE-AT ?auto_74468 ?auto_74475 ) ( CLEAR ?auto_74468 ) ( IS-CRATE ?auto_74469 ) ( AVAILABLE ?auto_74474 ) ( IN ?auto_74469 ?auto_74472 ) ( ON ?auto_74466 ?auto_74465 ) ( ON ?auto_74467 ?auto_74466 ) ( ON ?auto_74468 ?auto_74467 ) ( not ( = ?auto_74465 ?auto_74466 ) ) ( not ( = ?auto_74465 ?auto_74467 ) ) ( not ( = ?auto_74465 ?auto_74468 ) ) ( not ( = ?auto_74465 ?auto_74469 ) ) ( not ( = ?auto_74465 ?auto_74470 ) ) ( not ( = ?auto_74465 ?auto_74473 ) ) ( not ( = ?auto_74466 ?auto_74467 ) ) ( not ( = ?auto_74466 ?auto_74468 ) ) ( not ( = ?auto_74466 ?auto_74469 ) ) ( not ( = ?auto_74466 ?auto_74470 ) ) ( not ( = ?auto_74466 ?auto_74473 ) ) ( not ( = ?auto_74467 ?auto_74468 ) ) ( not ( = ?auto_74467 ?auto_74469 ) ) ( not ( = ?auto_74467 ?auto_74470 ) ) ( not ( = ?auto_74467 ?auto_74473 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74468 ?auto_74469 ?auto_74470 )
      ( MAKE-5CRATE-VERIFY ?auto_74465 ?auto_74466 ?auto_74467 ?auto_74468 ?auto_74469 ?auto_74470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_74833 - SURFACE
      ?auto_74834 - SURFACE
    )
    :vars
    (
      ?auto_74838 - HOIST
      ?auto_74841 - PLACE
      ?auto_74837 - SURFACE
      ?auto_74840 - PLACE
      ?auto_74836 - HOIST
      ?auto_74835 - SURFACE
      ?auto_74839 - TRUCK
      ?auto_74842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74838 ?auto_74841 ) ( SURFACE-AT ?auto_74833 ?auto_74841 ) ( CLEAR ?auto_74833 ) ( IS-CRATE ?auto_74834 ) ( not ( = ?auto_74833 ?auto_74834 ) ) ( ON ?auto_74833 ?auto_74837 ) ( not ( = ?auto_74837 ?auto_74833 ) ) ( not ( = ?auto_74837 ?auto_74834 ) ) ( not ( = ?auto_74840 ?auto_74841 ) ) ( HOIST-AT ?auto_74836 ?auto_74840 ) ( not ( = ?auto_74838 ?auto_74836 ) ) ( AVAILABLE ?auto_74836 ) ( SURFACE-AT ?auto_74834 ?auto_74840 ) ( ON ?auto_74834 ?auto_74835 ) ( CLEAR ?auto_74834 ) ( not ( = ?auto_74833 ?auto_74835 ) ) ( not ( = ?auto_74834 ?auto_74835 ) ) ( not ( = ?auto_74837 ?auto_74835 ) ) ( TRUCK-AT ?auto_74839 ?auto_74841 ) ( LIFTING ?auto_74838 ?auto_74842 ) ( IS-CRATE ?auto_74842 ) ( not ( = ?auto_74833 ?auto_74842 ) ) ( not ( = ?auto_74834 ?auto_74842 ) ) ( not ( = ?auto_74837 ?auto_74842 ) ) ( not ( = ?auto_74835 ?auto_74842 ) ) )
    :subtasks
    ( ( !LOAD ?auto_74838 ?auto_74842 ?auto_74839 ?auto_74841 )
      ( MAKE-1CRATE ?auto_74833 ?auto_74834 )
      ( MAKE-1CRATE-VERIFY ?auto_74833 ?auto_74834 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75659 - SURFACE
      ?auto_75660 - SURFACE
      ?auto_75661 - SURFACE
      ?auto_75662 - SURFACE
      ?auto_75663 - SURFACE
      ?auto_75664 - SURFACE
      ?auto_75665 - SURFACE
    )
    :vars
    (
      ?auto_75667 - HOIST
      ?auto_75666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75667 ?auto_75666 ) ( SURFACE-AT ?auto_75664 ?auto_75666 ) ( CLEAR ?auto_75664 ) ( LIFTING ?auto_75667 ?auto_75665 ) ( IS-CRATE ?auto_75665 ) ( not ( = ?auto_75664 ?auto_75665 ) ) ( ON ?auto_75660 ?auto_75659 ) ( ON ?auto_75661 ?auto_75660 ) ( ON ?auto_75662 ?auto_75661 ) ( ON ?auto_75663 ?auto_75662 ) ( ON ?auto_75664 ?auto_75663 ) ( not ( = ?auto_75659 ?auto_75660 ) ) ( not ( = ?auto_75659 ?auto_75661 ) ) ( not ( = ?auto_75659 ?auto_75662 ) ) ( not ( = ?auto_75659 ?auto_75663 ) ) ( not ( = ?auto_75659 ?auto_75664 ) ) ( not ( = ?auto_75659 ?auto_75665 ) ) ( not ( = ?auto_75660 ?auto_75661 ) ) ( not ( = ?auto_75660 ?auto_75662 ) ) ( not ( = ?auto_75660 ?auto_75663 ) ) ( not ( = ?auto_75660 ?auto_75664 ) ) ( not ( = ?auto_75660 ?auto_75665 ) ) ( not ( = ?auto_75661 ?auto_75662 ) ) ( not ( = ?auto_75661 ?auto_75663 ) ) ( not ( = ?auto_75661 ?auto_75664 ) ) ( not ( = ?auto_75661 ?auto_75665 ) ) ( not ( = ?auto_75662 ?auto_75663 ) ) ( not ( = ?auto_75662 ?auto_75664 ) ) ( not ( = ?auto_75662 ?auto_75665 ) ) ( not ( = ?auto_75663 ?auto_75664 ) ) ( not ( = ?auto_75663 ?auto_75665 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_75664 ?auto_75665 )
      ( MAKE-6CRATE-VERIFY ?auto_75659 ?auto_75660 ?auto_75661 ?auto_75662 ?auto_75663 ?auto_75664 ?auto_75665 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75703 - SURFACE
      ?auto_75704 - SURFACE
      ?auto_75705 - SURFACE
      ?auto_75706 - SURFACE
      ?auto_75707 - SURFACE
      ?auto_75708 - SURFACE
      ?auto_75709 - SURFACE
    )
    :vars
    (
      ?auto_75712 - HOIST
      ?auto_75711 - PLACE
      ?auto_75710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75712 ?auto_75711 ) ( SURFACE-AT ?auto_75708 ?auto_75711 ) ( CLEAR ?auto_75708 ) ( IS-CRATE ?auto_75709 ) ( not ( = ?auto_75708 ?auto_75709 ) ) ( TRUCK-AT ?auto_75710 ?auto_75711 ) ( AVAILABLE ?auto_75712 ) ( IN ?auto_75709 ?auto_75710 ) ( ON ?auto_75708 ?auto_75707 ) ( not ( = ?auto_75707 ?auto_75708 ) ) ( not ( = ?auto_75707 ?auto_75709 ) ) ( ON ?auto_75704 ?auto_75703 ) ( ON ?auto_75705 ?auto_75704 ) ( ON ?auto_75706 ?auto_75705 ) ( ON ?auto_75707 ?auto_75706 ) ( not ( = ?auto_75703 ?auto_75704 ) ) ( not ( = ?auto_75703 ?auto_75705 ) ) ( not ( = ?auto_75703 ?auto_75706 ) ) ( not ( = ?auto_75703 ?auto_75707 ) ) ( not ( = ?auto_75703 ?auto_75708 ) ) ( not ( = ?auto_75703 ?auto_75709 ) ) ( not ( = ?auto_75704 ?auto_75705 ) ) ( not ( = ?auto_75704 ?auto_75706 ) ) ( not ( = ?auto_75704 ?auto_75707 ) ) ( not ( = ?auto_75704 ?auto_75708 ) ) ( not ( = ?auto_75704 ?auto_75709 ) ) ( not ( = ?auto_75705 ?auto_75706 ) ) ( not ( = ?auto_75705 ?auto_75707 ) ) ( not ( = ?auto_75705 ?auto_75708 ) ) ( not ( = ?auto_75705 ?auto_75709 ) ) ( not ( = ?auto_75706 ?auto_75707 ) ) ( not ( = ?auto_75706 ?auto_75708 ) ) ( not ( = ?auto_75706 ?auto_75709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75707 ?auto_75708 ?auto_75709 )
      ( MAKE-6CRATE-VERIFY ?auto_75703 ?auto_75704 ?auto_75705 ?auto_75706 ?auto_75707 ?auto_75708 ?auto_75709 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75754 - SURFACE
      ?auto_75755 - SURFACE
      ?auto_75756 - SURFACE
      ?auto_75757 - SURFACE
      ?auto_75758 - SURFACE
      ?auto_75759 - SURFACE
      ?auto_75760 - SURFACE
    )
    :vars
    (
      ?auto_75763 - HOIST
      ?auto_75761 - PLACE
      ?auto_75764 - TRUCK
      ?auto_75762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75763 ?auto_75761 ) ( SURFACE-AT ?auto_75759 ?auto_75761 ) ( CLEAR ?auto_75759 ) ( IS-CRATE ?auto_75760 ) ( not ( = ?auto_75759 ?auto_75760 ) ) ( AVAILABLE ?auto_75763 ) ( IN ?auto_75760 ?auto_75764 ) ( ON ?auto_75759 ?auto_75758 ) ( not ( = ?auto_75758 ?auto_75759 ) ) ( not ( = ?auto_75758 ?auto_75760 ) ) ( TRUCK-AT ?auto_75764 ?auto_75762 ) ( not ( = ?auto_75762 ?auto_75761 ) ) ( ON ?auto_75755 ?auto_75754 ) ( ON ?auto_75756 ?auto_75755 ) ( ON ?auto_75757 ?auto_75756 ) ( ON ?auto_75758 ?auto_75757 ) ( not ( = ?auto_75754 ?auto_75755 ) ) ( not ( = ?auto_75754 ?auto_75756 ) ) ( not ( = ?auto_75754 ?auto_75757 ) ) ( not ( = ?auto_75754 ?auto_75758 ) ) ( not ( = ?auto_75754 ?auto_75759 ) ) ( not ( = ?auto_75754 ?auto_75760 ) ) ( not ( = ?auto_75755 ?auto_75756 ) ) ( not ( = ?auto_75755 ?auto_75757 ) ) ( not ( = ?auto_75755 ?auto_75758 ) ) ( not ( = ?auto_75755 ?auto_75759 ) ) ( not ( = ?auto_75755 ?auto_75760 ) ) ( not ( = ?auto_75756 ?auto_75757 ) ) ( not ( = ?auto_75756 ?auto_75758 ) ) ( not ( = ?auto_75756 ?auto_75759 ) ) ( not ( = ?auto_75756 ?auto_75760 ) ) ( not ( = ?auto_75757 ?auto_75758 ) ) ( not ( = ?auto_75757 ?auto_75759 ) ) ( not ( = ?auto_75757 ?auto_75760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75758 ?auto_75759 ?auto_75760 )
      ( MAKE-6CRATE-VERIFY ?auto_75754 ?auto_75755 ?auto_75756 ?auto_75757 ?auto_75758 ?auto_75759 ?auto_75760 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75811 - SURFACE
      ?auto_75812 - SURFACE
      ?auto_75813 - SURFACE
      ?auto_75814 - SURFACE
      ?auto_75815 - SURFACE
      ?auto_75816 - SURFACE
      ?auto_75817 - SURFACE
    )
    :vars
    (
      ?auto_75820 - HOIST
      ?auto_75822 - PLACE
      ?auto_75818 - TRUCK
      ?auto_75821 - PLACE
      ?auto_75819 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_75820 ?auto_75822 ) ( SURFACE-AT ?auto_75816 ?auto_75822 ) ( CLEAR ?auto_75816 ) ( IS-CRATE ?auto_75817 ) ( not ( = ?auto_75816 ?auto_75817 ) ) ( AVAILABLE ?auto_75820 ) ( ON ?auto_75816 ?auto_75815 ) ( not ( = ?auto_75815 ?auto_75816 ) ) ( not ( = ?auto_75815 ?auto_75817 ) ) ( TRUCK-AT ?auto_75818 ?auto_75821 ) ( not ( = ?auto_75821 ?auto_75822 ) ) ( HOIST-AT ?auto_75819 ?auto_75821 ) ( LIFTING ?auto_75819 ?auto_75817 ) ( not ( = ?auto_75820 ?auto_75819 ) ) ( ON ?auto_75812 ?auto_75811 ) ( ON ?auto_75813 ?auto_75812 ) ( ON ?auto_75814 ?auto_75813 ) ( ON ?auto_75815 ?auto_75814 ) ( not ( = ?auto_75811 ?auto_75812 ) ) ( not ( = ?auto_75811 ?auto_75813 ) ) ( not ( = ?auto_75811 ?auto_75814 ) ) ( not ( = ?auto_75811 ?auto_75815 ) ) ( not ( = ?auto_75811 ?auto_75816 ) ) ( not ( = ?auto_75811 ?auto_75817 ) ) ( not ( = ?auto_75812 ?auto_75813 ) ) ( not ( = ?auto_75812 ?auto_75814 ) ) ( not ( = ?auto_75812 ?auto_75815 ) ) ( not ( = ?auto_75812 ?auto_75816 ) ) ( not ( = ?auto_75812 ?auto_75817 ) ) ( not ( = ?auto_75813 ?auto_75814 ) ) ( not ( = ?auto_75813 ?auto_75815 ) ) ( not ( = ?auto_75813 ?auto_75816 ) ) ( not ( = ?auto_75813 ?auto_75817 ) ) ( not ( = ?auto_75814 ?auto_75815 ) ) ( not ( = ?auto_75814 ?auto_75816 ) ) ( not ( = ?auto_75814 ?auto_75817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75815 ?auto_75816 ?auto_75817 )
      ( MAKE-6CRATE-VERIFY ?auto_75811 ?auto_75812 ?auto_75813 ?auto_75814 ?auto_75815 ?auto_75816 ?auto_75817 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75874 - SURFACE
      ?auto_75875 - SURFACE
      ?auto_75876 - SURFACE
      ?auto_75877 - SURFACE
      ?auto_75878 - SURFACE
      ?auto_75879 - SURFACE
      ?auto_75880 - SURFACE
    )
    :vars
    (
      ?auto_75882 - HOIST
      ?auto_75883 - PLACE
      ?auto_75884 - TRUCK
      ?auto_75881 - PLACE
      ?auto_75885 - HOIST
      ?auto_75886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75882 ?auto_75883 ) ( SURFACE-AT ?auto_75879 ?auto_75883 ) ( CLEAR ?auto_75879 ) ( IS-CRATE ?auto_75880 ) ( not ( = ?auto_75879 ?auto_75880 ) ) ( AVAILABLE ?auto_75882 ) ( ON ?auto_75879 ?auto_75878 ) ( not ( = ?auto_75878 ?auto_75879 ) ) ( not ( = ?auto_75878 ?auto_75880 ) ) ( TRUCK-AT ?auto_75884 ?auto_75881 ) ( not ( = ?auto_75881 ?auto_75883 ) ) ( HOIST-AT ?auto_75885 ?auto_75881 ) ( not ( = ?auto_75882 ?auto_75885 ) ) ( AVAILABLE ?auto_75885 ) ( SURFACE-AT ?auto_75880 ?auto_75881 ) ( ON ?auto_75880 ?auto_75886 ) ( CLEAR ?auto_75880 ) ( not ( = ?auto_75879 ?auto_75886 ) ) ( not ( = ?auto_75880 ?auto_75886 ) ) ( not ( = ?auto_75878 ?auto_75886 ) ) ( ON ?auto_75875 ?auto_75874 ) ( ON ?auto_75876 ?auto_75875 ) ( ON ?auto_75877 ?auto_75876 ) ( ON ?auto_75878 ?auto_75877 ) ( not ( = ?auto_75874 ?auto_75875 ) ) ( not ( = ?auto_75874 ?auto_75876 ) ) ( not ( = ?auto_75874 ?auto_75877 ) ) ( not ( = ?auto_75874 ?auto_75878 ) ) ( not ( = ?auto_75874 ?auto_75879 ) ) ( not ( = ?auto_75874 ?auto_75880 ) ) ( not ( = ?auto_75874 ?auto_75886 ) ) ( not ( = ?auto_75875 ?auto_75876 ) ) ( not ( = ?auto_75875 ?auto_75877 ) ) ( not ( = ?auto_75875 ?auto_75878 ) ) ( not ( = ?auto_75875 ?auto_75879 ) ) ( not ( = ?auto_75875 ?auto_75880 ) ) ( not ( = ?auto_75875 ?auto_75886 ) ) ( not ( = ?auto_75876 ?auto_75877 ) ) ( not ( = ?auto_75876 ?auto_75878 ) ) ( not ( = ?auto_75876 ?auto_75879 ) ) ( not ( = ?auto_75876 ?auto_75880 ) ) ( not ( = ?auto_75876 ?auto_75886 ) ) ( not ( = ?auto_75877 ?auto_75878 ) ) ( not ( = ?auto_75877 ?auto_75879 ) ) ( not ( = ?auto_75877 ?auto_75880 ) ) ( not ( = ?auto_75877 ?auto_75886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75878 ?auto_75879 ?auto_75880 )
      ( MAKE-6CRATE-VERIFY ?auto_75874 ?auto_75875 ?auto_75876 ?auto_75877 ?auto_75878 ?auto_75879 ?auto_75880 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75938 - SURFACE
      ?auto_75939 - SURFACE
      ?auto_75940 - SURFACE
      ?auto_75941 - SURFACE
      ?auto_75942 - SURFACE
      ?auto_75943 - SURFACE
      ?auto_75944 - SURFACE
    )
    :vars
    (
      ?auto_75946 - HOIST
      ?auto_75949 - PLACE
      ?auto_75948 - PLACE
      ?auto_75947 - HOIST
      ?auto_75950 - SURFACE
      ?auto_75945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75946 ?auto_75949 ) ( SURFACE-AT ?auto_75943 ?auto_75949 ) ( CLEAR ?auto_75943 ) ( IS-CRATE ?auto_75944 ) ( not ( = ?auto_75943 ?auto_75944 ) ) ( AVAILABLE ?auto_75946 ) ( ON ?auto_75943 ?auto_75942 ) ( not ( = ?auto_75942 ?auto_75943 ) ) ( not ( = ?auto_75942 ?auto_75944 ) ) ( not ( = ?auto_75948 ?auto_75949 ) ) ( HOIST-AT ?auto_75947 ?auto_75948 ) ( not ( = ?auto_75946 ?auto_75947 ) ) ( AVAILABLE ?auto_75947 ) ( SURFACE-AT ?auto_75944 ?auto_75948 ) ( ON ?auto_75944 ?auto_75950 ) ( CLEAR ?auto_75944 ) ( not ( = ?auto_75943 ?auto_75950 ) ) ( not ( = ?auto_75944 ?auto_75950 ) ) ( not ( = ?auto_75942 ?auto_75950 ) ) ( TRUCK-AT ?auto_75945 ?auto_75949 ) ( ON ?auto_75939 ?auto_75938 ) ( ON ?auto_75940 ?auto_75939 ) ( ON ?auto_75941 ?auto_75940 ) ( ON ?auto_75942 ?auto_75941 ) ( not ( = ?auto_75938 ?auto_75939 ) ) ( not ( = ?auto_75938 ?auto_75940 ) ) ( not ( = ?auto_75938 ?auto_75941 ) ) ( not ( = ?auto_75938 ?auto_75942 ) ) ( not ( = ?auto_75938 ?auto_75943 ) ) ( not ( = ?auto_75938 ?auto_75944 ) ) ( not ( = ?auto_75938 ?auto_75950 ) ) ( not ( = ?auto_75939 ?auto_75940 ) ) ( not ( = ?auto_75939 ?auto_75941 ) ) ( not ( = ?auto_75939 ?auto_75942 ) ) ( not ( = ?auto_75939 ?auto_75943 ) ) ( not ( = ?auto_75939 ?auto_75944 ) ) ( not ( = ?auto_75939 ?auto_75950 ) ) ( not ( = ?auto_75940 ?auto_75941 ) ) ( not ( = ?auto_75940 ?auto_75942 ) ) ( not ( = ?auto_75940 ?auto_75943 ) ) ( not ( = ?auto_75940 ?auto_75944 ) ) ( not ( = ?auto_75940 ?auto_75950 ) ) ( not ( = ?auto_75941 ?auto_75942 ) ) ( not ( = ?auto_75941 ?auto_75943 ) ) ( not ( = ?auto_75941 ?auto_75944 ) ) ( not ( = ?auto_75941 ?auto_75950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75942 ?auto_75943 ?auto_75944 )
      ( MAKE-6CRATE-VERIFY ?auto_75938 ?auto_75939 ?auto_75940 ?auto_75941 ?auto_75942 ?auto_75943 ?auto_75944 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_76002 - SURFACE
      ?auto_76003 - SURFACE
      ?auto_76004 - SURFACE
      ?auto_76005 - SURFACE
      ?auto_76006 - SURFACE
      ?auto_76007 - SURFACE
      ?auto_76008 - SURFACE
    )
    :vars
    (
      ?auto_76012 - HOIST
      ?auto_76011 - PLACE
      ?auto_76009 - PLACE
      ?auto_76014 - HOIST
      ?auto_76013 - SURFACE
      ?auto_76010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_76012 ?auto_76011 ) ( IS-CRATE ?auto_76008 ) ( not ( = ?auto_76007 ?auto_76008 ) ) ( not ( = ?auto_76006 ?auto_76007 ) ) ( not ( = ?auto_76006 ?auto_76008 ) ) ( not ( = ?auto_76009 ?auto_76011 ) ) ( HOIST-AT ?auto_76014 ?auto_76009 ) ( not ( = ?auto_76012 ?auto_76014 ) ) ( AVAILABLE ?auto_76014 ) ( SURFACE-AT ?auto_76008 ?auto_76009 ) ( ON ?auto_76008 ?auto_76013 ) ( CLEAR ?auto_76008 ) ( not ( = ?auto_76007 ?auto_76013 ) ) ( not ( = ?auto_76008 ?auto_76013 ) ) ( not ( = ?auto_76006 ?auto_76013 ) ) ( TRUCK-AT ?auto_76010 ?auto_76011 ) ( SURFACE-AT ?auto_76006 ?auto_76011 ) ( CLEAR ?auto_76006 ) ( LIFTING ?auto_76012 ?auto_76007 ) ( IS-CRATE ?auto_76007 ) ( ON ?auto_76003 ?auto_76002 ) ( ON ?auto_76004 ?auto_76003 ) ( ON ?auto_76005 ?auto_76004 ) ( ON ?auto_76006 ?auto_76005 ) ( not ( = ?auto_76002 ?auto_76003 ) ) ( not ( = ?auto_76002 ?auto_76004 ) ) ( not ( = ?auto_76002 ?auto_76005 ) ) ( not ( = ?auto_76002 ?auto_76006 ) ) ( not ( = ?auto_76002 ?auto_76007 ) ) ( not ( = ?auto_76002 ?auto_76008 ) ) ( not ( = ?auto_76002 ?auto_76013 ) ) ( not ( = ?auto_76003 ?auto_76004 ) ) ( not ( = ?auto_76003 ?auto_76005 ) ) ( not ( = ?auto_76003 ?auto_76006 ) ) ( not ( = ?auto_76003 ?auto_76007 ) ) ( not ( = ?auto_76003 ?auto_76008 ) ) ( not ( = ?auto_76003 ?auto_76013 ) ) ( not ( = ?auto_76004 ?auto_76005 ) ) ( not ( = ?auto_76004 ?auto_76006 ) ) ( not ( = ?auto_76004 ?auto_76007 ) ) ( not ( = ?auto_76004 ?auto_76008 ) ) ( not ( = ?auto_76004 ?auto_76013 ) ) ( not ( = ?auto_76005 ?auto_76006 ) ) ( not ( = ?auto_76005 ?auto_76007 ) ) ( not ( = ?auto_76005 ?auto_76008 ) ) ( not ( = ?auto_76005 ?auto_76013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_76006 ?auto_76007 ?auto_76008 )
      ( MAKE-6CRATE-VERIFY ?auto_76002 ?auto_76003 ?auto_76004 ?auto_76005 ?auto_76006 ?auto_76007 ?auto_76008 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_76066 - SURFACE
      ?auto_76067 - SURFACE
      ?auto_76068 - SURFACE
      ?auto_76069 - SURFACE
      ?auto_76070 - SURFACE
      ?auto_76071 - SURFACE
      ?auto_76072 - SURFACE
    )
    :vars
    (
      ?auto_76075 - HOIST
      ?auto_76073 - PLACE
      ?auto_76078 - PLACE
      ?auto_76077 - HOIST
      ?auto_76074 - SURFACE
      ?auto_76076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_76075 ?auto_76073 ) ( IS-CRATE ?auto_76072 ) ( not ( = ?auto_76071 ?auto_76072 ) ) ( not ( = ?auto_76070 ?auto_76071 ) ) ( not ( = ?auto_76070 ?auto_76072 ) ) ( not ( = ?auto_76078 ?auto_76073 ) ) ( HOIST-AT ?auto_76077 ?auto_76078 ) ( not ( = ?auto_76075 ?auto_76077 ) ) ( AVAILABLE ?auto_76077 ) ( SURFACE-AT ?auto_76072 ?auto_76078 ) ( ON ?auto_76072 ?auto_76074 ) ( CLEAR ?auto_76072 ) ( not ( = ?auto_76071 ?auto_76074 ) ) ( not ( = ?auto_76072 ?auto_76074 ) ) ( not ( = ?auto_76070 ?auto_76074 ) ) ( TRUCK-AT ?auto_76076 ?auto_76073 ) ( SURFACE-AT ?auto_76070 ?auto_76073 ) ( CLEAR ?auto_76070 ) ( IS-CRATE ?auto_76071 ) ( AVAILABLE ?auto_76075 ) ( IN ?auto_76071 ?auto_76076 ) ( ON ?auto_76067 ?auto_76066 ) ( ON ?auto_76068 ?auto_76067 ) ( ON ?auto_76069 ?auto_76068 ) ( ON ?auto_76070 ?auto_76069 ) ( not ( = ?auto_76066 ?auto_76067 ) ) ( not ( = ?auto_76066 ?auto_76068 ) ) ( not ( = ?auto_76066 ?auto_76069 ) ) ( not ( = ?auto_76066 ?auto_76070 ) ) ( not ( = ?auto_76066 ?auto_76071 ) ) ( not ( = ?auto_76066 ?auto_76072 ) ) ( not ( = ?auto_76066 ?auto_76074 ) ) ( not ( = ?auto_76067 ?auto_76068 ) ) ( not ( = ?auto_76067 ?auto_76069 ) ) ( not ( = ?auto_76067 ?auto_76070 ) ) ( not ( = ?auto_76067 ?auto_76071 ) ) ( not ( = ?auto_76067 ?auto_76072 ) ) ( not ( = ?auto_76067 ?auto_76074 ) ) ( not ( = ?auto_76068 ?auto_76069 ) ) ( not ( = ?auto_76068 ?auto_76070 ) ) ( not ( = ?auto_76068 ?auto_76071 ) ) ( not ( = ?auto_76068 ?auto_76072 ) ) ( not ( = ?auto_76068 ?auto_76074 ) ) ( not ( = ?auto_76069 ?auto_76070 ) ) ( not ( = ?auto_76069 ?auto_76071 ) ) ( not ( = ?auto_76069 ?auto_76072 ) ) ( not ( = ?auto_76069 ?auto_76074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_76070 ?auto_76071 ?auto_76072 )
      ( MAKE-6CRATE-VERIFY ?auto_76066 ?auto_76067 ?auto_76068 ?auto_76069 ?auto_76070 ?auto_76071 ?auto_76072 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78022 - SURFACE
      ?auto_78023 - SURFACE
      ?auto_78024 - SURFACE
      ?auto_78025 - SURFACE
      ?auto_78026 - SURFACE
      ?auto_78027 - SURFACE
      ?auto_78028 - SURFACE
      ?auto_78029 - SURFACE
    )
    :vars
    (
      ?auto_78031 - HOIST
      ?auto_78030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_78031 ?auto_78030 ) ( SURFACE-AT ?auto_78028 ?auto_78030 ) ( CLEAR ?auto_78028 ) ( LIFTING ?auto_78031 ?auto_78029 ) ( IS-CRATE ?auto_78029 ) ( not ( = ?auto_78028 ?auto_78029 ) ) ( ON ?auto_78023 ?auto_78022 ) ( ON ?auto_78024 ?auto_78023 ) ( ON ?auto_78025 ?auto_78024 ) ( ON ?auto_78026 ?auto_78025 ) ( ON ?auto_78027 ?auto_78026 ) ( ON ?auto_78028 ?auto_78027 ) ( not ( = ?auto_78022 ?auto_78023 ) ) ( not ( = ?auto_78022 ?auto_78024 ) ) ( not ( = ?auto_78022 ?auto_78025 ) ) ( not ( = ?auto_78022 ?auto_78026 ) ) ( not ( = ?auto_78022 ?auto_78027 ) ) ( not ( = ?auto_78022 ?auto_78028 ) ) ( not ( = ?auto_78022 ?auto_78029 ) ) ( not ( = ?auto_78023 ?auto_78024 ) ) ( not ( = ?auto_78023 ?auto_78025 ) ) ( not ( = ?auto_78023 ?auto_78026 ) ) ( not ( = ?auto_78023 ?auto_78027 ) ) ( not ( = ?auto_78023 ?auto_78028 ) ) ( not ( = ?auto_78023 ?auto_78029 ) ) ( not ( = ?auto_78024 ?auto_78025 ) ) ( not ( = ?auto_78024 ?auto_78026 ) ) ( not ( = ?auto_78024 ?auto_78027 ) ) ( not ( = ?auto_78024 ?auto_78028 ) ) ( not ( = ?auto_78024 ?auto_78029 ) ) ( not ( = ?auto_78025 ?auto_78026 ) ) ( not ( = ?auto_78025 ?auto_78027 ) ) ( not ( = ?auto_78025 ?auto_78028 ) ) ( not ( = ?auto_78025 ?auto_78029 ) ) ( not ( = ?auto_78026 ?auto_78027 ) ) ( not ( = ?auto_78026 ?auto_78028 ) ) ( not ( = ?auto_78026 ?auto_78029 ) ) ( not ( = ?auto_78027 ?auto_78028 ) ) ( not ( = ?auto_78027 ?auto_78029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_78028 ?auto_78029 )
      ( MAKE-7CRATE-VERIFY ?auto_78022 ?auto_78023 ?auto_78024 ?auto_78025 ?auto_78026 ?auto_78027 ?auto_78028 ?auto_78029 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78077 - SURFACE
      ?auto_78078 - SURFACE
      ?auto_78079 - SURFACE
      ?auto_78080 - SURFACE
      ?auto_78081 - SURFACE
      ?auto_78082 - SURFACE
      ?auto_78083 - SURFACE
      ?auto_78084 - SURFACE
    )
    :vars
    (
      ?auto_78087 - HOIST
      ?auto_78086 - PLACE
      ?auto_78085 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78087 ?auto_78086 ) ( SURFACE-AT ?auto_78083 ?auto_78086 ) ( CLEAR ?auto_78083 ) ( IS-CRATE ?auto_78084 ) ( not ( = ?auto_78083 ?auto_78084 ) ) ( TRUCK-AT ?auto_78085 ?auto_78086 ) ( AVAILABLE ?auto_78087 ) ( IN ?auto_78084 ?auto_78085 ) ( ON ?auto_78083 ?auto_78082 ) ( not ( = ?auto_78082 ?auto_78083 ) ) ( not ( = ?auto_78082 ?auto_78084 ) ) ( ON ?auto_78078 ?auto_78077 ) ( ON ?auto_78079 ?auto_78078 ) ( ON ?auto_78080 ?auto_78079 ) ( ON ?auto_78081 ?auto_78080 ) ( ON ?auto_78082 ?auto_78081 ) ( not ( = ?auto_78077 ?auto_78078 ) ) ( not ( = ?auto_78077 ?auto_78079 ) ) ( not ( = ?auto_78077 ?auto_78080 ) ) ( not ( = ?auto_78077 ?auto_78081 ) ) ( not ( = ?auto_78077 ?auto_78082 ) ) ( not ( = ?auto_78077 ?auto_78083 ) ) ( not ( = ?auto_78077 ?auto_78084 ) ) ( not ( = ?auto_78078 ?auto_78079 ) ) ( not ( = ?auto_78078 ?auto_78080 ) ) ( not ( = ?auto_78078 ?auto_78081 ) ) ( not ( = ?auto_78078 ?auto_78082 ) ) ( not ( = ?auto_78078 ?auto_78083 ) ) ( not ( = ?auto_78078 ?auto_78084 ) ) ( not ( = ?auto_78079 ?auto_78080 ) ) ( not ( = ?auto_78079 ?auto_78081 ) ) ( not ( = ?auto_78079 ?auto_78082 ) ) ( not ( = ?auto_78079 ?auto_78083 ) ) ( not ( = ?auto_78079 ?auto_78084 ) ) ( not ( = ?auto_78080 ?auto_78081 ) ) ( not ( = ?auto_78080 ?auto_78082 ) ) ( not ( = ?auto_78080 ?auto_78083 ) ) ( not ( = ?auto_78080 ?auto_78084 ) ) ( not ( = ?auto_78081 ?auto_78082 ) ) ( not ( = ?auto_78081 ?auto_78083 ) ) ( not ( = ?auto_78081 ?auto_78084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78082 ?auto_78083 ?auto_78084 )
      ( MAKE-7CRATE-VERIFY ?auto_78077 ?auto_78078 ?auto_78079 ?auto_78080 ?auto_78081 ?auto_78082 ?auto_78083 ?auto_78084 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78140 - SURFACE
      ?auto_78141 - SURFACE
      ?auto_78142 - SURFACE
      ?auto_78143 - SURFACE
      ?auto_78144 - SURFACE
      ?auto_78145 - SURFACE
      ?auto_78146 - SURFACE
      ?auto_78147 - SURFACE
    )
    :vars
    (
      ?auto_78149 - HOIST
      ?auto_78150 - PLACE
      ?auto_78148 - TRUCK
      ?auto_78151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_78149 ?auto_78150 ) ( SURFACE-AT ?auto_78146 ?auto_78150 ) ( CLEAR ?auto_78146 ) ( IS-CRATE ?auto_78147 ) ( not ( = ?auto_78146 ?auto_78147 ) ) ( AVAILABLE ?auto_78149 ) ( IN ?auto_78147 ?auto_78148 ) ( ON ?auto_78146 ?auto_78145 ) ( not ( = ?auto_78145 ?auto_78146 ) ) ( not ( = ?auto_78145 ?auto_78147 ) ) ( TRUCK-AT ?auto_78148 ?auto_78151 ) ( not ( = ?auto_78151 ?auto_78150 ) ) ( ON ?auto_78141 ?auto_78140 ) ( ON ?auto_78142 ?auto_78141 ) ( ON ?auto_78143 ?auto_78142 ) ( ON ?auto_78144 ?auto_78143 ) ( ON ?auto_78145 ?auto_78144 ) ( not ( = ?auto_78140 ?auto_78141 ) ) ( not ( = ?auto_78140 ?auto_78142 ) ) ( not ( = ?auto_78140 ?auto_78143 ) ) ( not ( = ?auto_78140 ?auto_78144 ) ) ( not ( = ?auto_78140 ?auto_78145 ) ) ( not ( = ?auto_78140 ?auto_78146 ) ) ( not ( = ?auto_78140 ?auto_78147 ) ) ( not ( = ?auto_78141 ?auto_78142 ) ) ( not ( = ?auto_78141 ?auto_78143 ) ) ( not ( = ?auto_78141 ?auto_78144 ) ) ( not ( = ?auto_78141 ?auto_78145 ) ) ( not ( = ?auto_78141 ?auto_78146 ) ) ( not ( = ?auto_78141 ?auto_78147 ) ) ( not ( = ?auto_78142 ?auto_78143 ) ) ( not ( = ?auto_78142 ?auto_78144 ) ) ( not ( = ?auto_78142 ?auto_78145 ) ) ( not ( = ?auto_78142 ?auto_78146 ) ) ( not ( = ?auto_78142 ?auto_78147 ) ) ( not ( = ?auto_78143 ?auto_78144 ) ) ( not ( = ?auto_78143 ?auto_78145 ) ) ( not ( = ?auto_78143 ?auto_78146 ) ) ( not ( = ?auto_78143 ?auto_78147 ) ) ( not ( = ?auto_78144 ?auto_78145 ) ) ( not ( = ?auto_78144 ?auto_78146 ) ) ( not ( = ?auto_78144 ?auto_78147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78145 ?auto_78146 ?auto_78147 )
      ( MAKE-7CRATE-VERIFY ?auto_78140 ?auto_78141 ?auto_78142 ?auto_78143 ?auto_78144 ?auto_78145 ?auto_78146 ?auto_78147 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78210 - SURFACE
      ?auto_78211 - SURFACE
      ?auto_78212 - SURFACE
      ?auto_78213 - SURFACE
      ?auto_78214 - SURFACE
      ?auto_78215 - SURFACE
      ?auto_78216 - SURFACE
      ?auto_78217 - SURFACE
    )
    :vars
    (
      ?auto_78218 - HOIST
      ?auto_78220 - PLACE
      ?auto_78221 - TRUCK
      ?auto_78219 - PLACE
      ?auto_78222 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_78218 ?auto_78220 ) ( SURFACE-AT ?auto_78216 ?auto_78220 ) ( CLEAR ?auto_78216 ) ( IS-CRATE ?auto_78217 ) ( not ( = ?auto_78216 ?auto_78217 ) ) ( AVAILABLE ?auto_78218 ) ( ON ?auto_78216 ?auto_78215 ) ( not ( = ?auto_78215 ?auto_78216 ) ) ( not ( = ?auto_78215 ?auto_78217 ) ) ( TRUCK-AT ?auto_78221 ?auto_78219 ) ( not ( = ?auto_78219 ?auto_78220 ) ) ( HOIST-AT ?auto_78222 ?auto_78219 ) ( LIFTING ?auto_78222 ?auto_78217 ) ( not ( = ?auto_78218 ?auto_78222 ) ) ( ON ?auto_78211 ?auto_78210 ) ( ON ?auto_78212 ?auto_78211 ) ( ON ?auto_78213 ?auto_78212 ) ( ON ?auto_78214 ?auto_78213 ) ( ON ?auto_78215 ?auto_78214 ) ( not ( = ?auto_78210 ?auto_78211 ) ) ( not ( = ?auto_78210 ?auto_78212 ) ) ( not ( = ?auto_78210 ?auto_78213 ) ) ( not ( = ?auto_78210 ?auto_78214 ) ) ( not ( = ?auto_78210 ?auto_78215 ) ) ( not ( = ?auto_78210 ?auto_78216 ) ) ( not ( = ?auto_78210 ?auto_78217 ) ) ( not ( = ?auto_78211 ?auto_78212 ) ) ( not ( = ?auto_78211 ?auto_78213 ) ) ( not ( = ?auto_78211 ?auto_78214 ) ) ( not ( = ?auto_78211 ?auto_78215 ) ) ( not ( = ?auto_78211 ?auto_78216 ) ) ( not ( = ?auto_78211 ?auto_78217 ) ) ( not ( = ?auto_78212 ?auto_78213 ) ) ( not ( = ?auto_78212 ?auto_78214 ) ) ( not ( = ?auto_78212 ?auto_78215 ) ) ( not ( = ?auto_78212 ?auto_78216 ) ) ( not ( = ?auto_78212 ?auto_78217 ) ) ( not ( = ?auto_78213 ?auto_78214 ) ) ( not ( = ?auto_78213 ?auto_78215 ) ) ( not ( = ?auto_78213 ?auto_78216 ) ) ( not ( = ?auto_78213 ?auto_78217 ) ) ( not ( = ?auto_78214 ?auto_78215 ) ) ( not ( = ?auto_78214 ?auto_78216 ) ) ( not ( = ?auto_78214 ?auto_78217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78215 ?auto_78216 ?auto_78217 )
      ( MAKE-7CRATE-VERIFY ?auto_78210 ?auto_78211 ?auto_78212 ?auto_78213 ?auto_78214 ?auto_78215 ?auto_78216 ?auto_78217 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78287 - SURFACE
      ?auto_78288 - SURFACE
      ?auto_78289 - SURFACE
      ?auto_78290 - SURFACE
      ?auto_78291 - SURFACE
      ?auto_78292 - SURFACE
      ?auto_78293 - SURFACE
      ?auto_78294 - SURFACE
    )
    :vars
    (
      ?auto_78296 - HOIST
      ?auto_78297 - PLACE
      ?auto_78299 - TRUCK
      ?auto_78298 - PLACE
      ?auto_78300 - HOIST
      ?auto_78295 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_78296 ?auto_78297 ) ( SURFACE-AT ?auto_78293 ?auto_78297 ) ( CLEAR ?auto_78293 ) ( IS-CRATE ?auto_78294 ) ( not ( = ?auto_78293 ?auto_78294 ) ) ( AVAILABLE ?auto_78296 ) ( ON ?auto_78293 ?auto_78292 ) ( not ( = ?auto_78292 ?auto_78293 ) ) ( not ( = ?auto_78292 ?auto_78294 ) ) ( TRUCK-AT ?auto_78299 ?auto_78298 ) ( not ( = ?auto_78298 ?auto_78297 ) ) ( HOIST-AT ?auto_78300 ?auto_78298 ) ( not ( = ?auto_78296 ?auto_78300 ) ) ( AVAILABLE ?auto_78300 ) ( SURFACE-AT ?auto_78294 ?auto_78298 ) ( ON ?auto_78294 ?auto_78295 ) ( CLEAR ?auto_78294 ) ( not ( = ?auto_78293 ?auto_78295 ) ) ( not ( = ?auto_78294 ?auto_78295 ) ) ( not ( = ?auto_78292 ?auto_78295 ) ) ( ON ?auto_78288 ?auto_78287 ) ( ON ?auto_78289 ?auto_78288 ) ( ON ?auto_78290 ?auto_78289 ) ( ON ?auto_78291 ?auto_78290 ) ( ON ?auto_78292 ?auto_78291 ) ( not ( = ?auto_78287 ?auto_78288 ) ) ( not ( = ?auto_78287 ?auto_78289 ) ) ( not ( = ?auto_78287 ?auto_78290 ) ) ( not ( = ?auto_78287 ?auto_78291 ) ) ( not ( = ?auto_78287 ?auto_78292 ) ) ( not ( = ?auto_78287 ?auto_78293 ) ) ( not ( = ?auto_78287 ?auto_78294 ) ) ( not ( = ?auto_78287 ?auto_78295 ) ) ( not ( = ?auto_78288 ?auto_78289 ) ) ( not ( = ?auto_78288 ?auto_78290 ) ) ( not ( = ?auto_78288 ?auto_78291 ) ) ( not ( = ?auto_78288 ?auto_78292 ) ) ( not ( = ?auto_78288 ?auto_78293 ) ) ( not ( = ?auto_78288 ?auto_78294 ) ) ( not ( = ?auto_78288 ?auto_78295 ) ) ( not ( = ?auto_78289 ?auto_78290 ) ) ( not ( = ?auto_78289 ?auto_78291 ) ) ( not ( = ?auto_78289 ?auto_78292 ) ) ( not ( = ?auto_78289 ?auto_78293 ) ) ( not ( = ?auto_78289 ?auto_78294 ) ) ( not ( = ?auto_78289 ?auto_78295 ) ) ( not ( = ?auto_78290 ?auto_78291 ) ) ( not ( = ?auto_78290 ?auto_78292 ) ) ( not ( = ?auto_78290 ?auto_78293 ) ) ( not ( = ?auto_78290 ?auto_78294 ) ) ( not ( = ?auto_78290 ?auto_78295 ) ) ( not ( = ?auto_78291 ?auto_78292 ) ) ( not ( = ?auto_78291 ?auto_78293 ) ) ( not ( = ?auto_78291 ?auto_78294 ) ) ( not ( = ?auto_78291 ?auto_78295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78292 ?auto_78293 ?auto_78294 )
      ( MAKE-7CRATE-VERIFY ?auto_78287 ?auto_78288 ?auto_78289 ?auto_78290 ?auto_78291 ?auto_78292 ?auto_78293 ?auto_78294 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78365 - SURFACE
      ?auto_78366 - SURFACE
      ?auto_78367 - SURFACE
      ?auto_78368 - SURFACE
      ?auto_78369 - SURFACE
      ?auto_78370 - SURFACE
      ?auto_78371 - SURFACE
      ?auto_78372 - SURFACE
    )
    :vars
    (
      ?auto_78378 - HOIST
      ?auto_78375 - PLACE
      ?auto_78374 - PLACE
      ?auto_78376 - HOIST
      ?auto_78373 - SURFACE
      ?auto_78377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78378 ?auto_78375 ) ( SURFACE-AT ?auto_78371 ?auto_78375 ) ( CLEAR ?auto_78371 ) ( IS-CRATE ?auto_78372 ) ( not ( = ?auto_78371 ?auto_78372 ) ) ( AVAILABLE ?auto_78378 ) ( ON ?auto_78371 ?auto_78370 ) ( not ( = ?auto_78370 ?auto_78371 ) ) ( not ( = ?auto_78370 ?auto_78372 ) ) ( not ( = ?auto_78374 ?auto_78375 ) ) ( HOIST-AT ?auto_78376 ?auto_78374 ) ( not ( = ?auto_78378 ?auto_78376 ) ) ( AVAILABLE ?auto_78376 ) ( SURFACE-AT ?auto_78372 ?auto_78374 ) ( ON ?auto_78372 ?auto_78373 ) ( CLEAR ?auto_78372 ) ( not ( = ?auto_78371 ?auto_78373 ) ) ( not ( = ?auto_78372 ?auto_78373 ) ) ( not ( = ?auto_78370 ?auto_78373 ) ) ( TRUCK-AT ?auto_78377 ?auto_78375 ) ( ON ?auto_78366 ?auto_78365 ) ( ON ?auto_78367 ?auto_78366 ) ( ON ?auto_78368 ?auto_78367 ) ( ON ?auto_78369 ?auto_78368 ) ( ON ?auto_78370 ?auto_78369 ) ( not ( = ?auto_78365 ?auto_78366 ) ) ( not ( = ?auto_78365 ?auto_78367 ) ) ( not ( = ?auto_78365 ?auto_78368 ) ) ( not ( = ?auto_78365 ?auto_78369 ) ) ( not ( = ?auto_78365 ?auto_78370 ) ) ( not ( = ?auto_78365 ?auto_78371 ) ) ( not ( = ?auto_78365 ?auto_78372 ) ) ( not ( = ?auto_78365 ?auto_78373 ) ) ( not ( = ?auto_78366 ?auto_78367 ) ) ( not ( = ?auto_78366 ?auto_78368 ) ) ( not ( = ?auto_78366 ?auto_78369 ) ) ( not ( = ?auto_78366 ?auto_78370 ) ) ( not ( = ?auto_78366 ?auto_78371 ) ) ( not ( = ?auto_78366 ?auto_78372 ) ) ( not ( = ?auto_78366 ?auto_78373 ) ) ( not ( = ?auto_78367 ?auto_78368 ) ) ( not ( = ?auto_78367 ?auto_78369 ) ) ( not ( = ?auto_78367 ?auto_78370 ) ) ( not ( = ?auto_78367 ?auto_78371 ) ) ( not ( = ?auto_78367 ?auto_78372 ) ) ( not ( = ?auto_78367 ?auto_78373 ) ) ( not ( = ?auto_78368 ?auto_78369 ) ) ( not ( = ?auto_78368 ?auto_78370 ) ) ( not ( = ?auto_78368 ?auto_78371 ) ) ( not ( = ?auto_78368 ?auto_78372 ) ) ( not ( = ?auto_78368 ?auto_78373 ) ) ( not ( = ?auto_78369 ?auto_78370 ) ) ( not ( = ?auto_78369 ?auto_78371 ) ) ( not ( = ?auto_78369 ?auto_78372 ) ) ( not ( = ?auto_78369 ?auto_78373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78370 ?auto_78371 ?auto_78372 )
      ( MAKE-7CRATE-VERIFY ?auto_78365 ?auto_78366 ?auto_78367 ?auto_78368 ?auto_78369 ?auto_78370 ?auto_78371 ?auto_78372 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78443 - SURFACE
      ?auto_78444 - SURFACE
      ?auto_78445 - SURFACE
      ?auto_78446 - SURFACE
      ?auto_78447 - SURFACE
      ?auto_78448 - SURFACE
      ?auto_78449 - SURFACE
      ?auto_78450 - SURFACE
    )
    :vars
    (
      ?auto_78453 - HOIST
      ?auto_78452 - PLACE
      ?auto_78451 - PLACE
      ?auto_78456 - HOIST
      ?auto_78455 - SURFACE
      ?auto_78454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78453 ?auto_78452 ) ( IS-CRATE ?auto_78450 ) ( not ( = ?auto_78449 ?auto_78450 ) ) ( not ( = ?auto_78448 ?auto_78449 ) ) ( not ( = ?auto_78448 ?auto_78450 ) ) ( not ( = ?auto_78451 ?auto_78452 ) ) ( HOIST-AT ?auto_78456 ?auto_78451 ) ( not ( = ?auto_78453 ?auto_78456 ) ) ( AVAILABLE ?auto_78456 ) ( SURFACE-AT ?auto_78450 ?auto_78451 ) ( ON ?auto_78450 ?auto_78455 ) ( CLEAR ?auto_78450 ) ( not ( = ?auto_78449 ?auto_78455 ) ) ( not ( = ?auto_78450 ?auto_78455 ) ) ( not ( = ?auto_78448 ?auto_78455 ) ) ( TRUCK-AT ?auto_78454 ?auto_78452 ) ( SURFACE-AT ?auto_78448 ?auto_78452 ) ( CLEAR ?auto_78448 ) ( LIFTING ?auto_78453 ?auto_78449 ) ( IS-CRATE ?auto_78449 ) ( ON ?auto_78444 ?auto_78443 ) ( ON ?auto_78445 ?auto_78444 ) ( ON ?auto_78446 ?auto_78445 ) ( ON ?auto_78447 ?auto_78446 ) ( ON ?auto_78448 ?auto_78447 ) ( not ( = ?auto_78443 ?auto_78444 ) ) ( not ( = ?auto_78443 ?auto_78445 ) ) ( not ( = ?auto_78443 ?auto_78446 ) ) ( not ( = ?auto_78443 ?auto_78447 ) ) ( not ( = ?auto_78443 ?auto_78448 ) ) ( not ( = ?auto_78443 ?auto_78449 ) ) ( not ( = ?auto_78443 ?auto_78450 ) ) ( not ( = ?auto_78443 ?auto_78455 ) ) ( not ( = ?auto_78444 ?auto_78445 ) ) ( not ( = ?auto_78444 ?auto_78446 ) ) ( not ( = ?auto_78444 ?auto_78447 ) ) ( not ( = ?auto_78444 ?auto_78448 ) ) ( not ( = ?auto_78444 ?auto_78449 ) ) ( not ( = ?auto_78444 ?auto_78450 ) ) ( not ( = ?auto_78444 ?auto_78455 ) ) ( not ( = ?auto_78445 ?auto_78446 ) ) ( not ( = ?auto_78445 ?auto_78447 ) ) ( not ( = ?auto_78445 ?auto_78448 ) ) ( not ( = ?auto_78445 ?auto_78449 ) ) ( not ( = ?auto_78445 ?auto_78450 ) ) ( not ( = ?auto_78445 ?auto_78455 ) ) ( not ( = ?auto_78446 ?auto_78447 ) ) ( not ( = ?auto_78446 ?auto_78448 ) ) ( not ( = ?auto_78446 ?auto_78449 ) ) ( not ( = ?auto_78446 ?auto_78450 ) ) ( not ( = ?auto_78446 ?auto_78455 ) ) ( not ( = ?auto_78447 ?auto_78448 ) ) ( not ( = ?auto_78447 ?auto_78449 ) ) ( not ( = ?auto_78447 ?auto_78450 ) ) ( not ( = ?auto_78447 ?auto_78455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78448 ?auto_78449 ?auto_78450 )
      ( MAKE-7CRATE-VERIFY ?auto_78443 ?auto_78444 ?auto_78445 ?auto_78446 ?auto_78447 ?auto_78448 ?auto_78449 ?auto_78450 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78521 - SURFACE
      ?auto_78522 - SURFACE
      ?auto_78523 - SURFACE
      ?auto_78524 - SURFACE
      ?auto_78525 - SURFACE
      ?auto_78526 - SURFACE
      ?auto_78527 - SURFACE
      ?auto_78528 - SURFACE
    )
    :vars
    (
      ?auto_78534 - HOIST
      ?auto_78531 - PLACE
      ?auto_78533 - PLACE
      ?auto_78532 - HOIST
      ?auto_78529 - SURFACE
      ?auto_78530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78534 ?auto_78531 ) ( IS-CRATE ?auto_78528 ) ( not ( = ?auto_78527 ?auto_78528 ) ) ( not ( = ?auto_78526 ?auto_78527 ) ) ( not ( = ?auto_78526 ?auto_78528 ) ) ( not ( = ?auto_78533 ?auto_78531 ) ) ( HOIST-AT ?auto_78532 ?auto_78533 ) ( not ( = ?auto_78534 ?auto_78532 ) ) ( AVAILABLE ?auto_78532 ) ( SURFACE-AT ?auto_78528 ?auto_78533 ) ( ON ?auto_78528 ?auto_78529 ) ( CLEAR ?auto_78528 ) ( not ( = ?auto_78527 ?auto_78529 ) ) ( not ( = ?auto_78528 ?auto_78529 ) ) ( not ( = ?auto_78526 ?auto_78529 ) ) ( TRUCK-AT ?auto_78530 ?auto_78531 ) ( SURFACE-AT ?auto_78526 ?auto_78531 ) ( CLEAR ?auto_78526 ) ( IS-CRATE ?auto_78527 ) ( AVAILABLE ?auto_78534 ) ( IN ?auto_78527 ?auto_78530 ) ( ON ?auto_78522 ?auto_78521 ) ( ON ?auto_78523 ?auto_78522 ) ( ON ?auto_78524 ?auto_78523 ) ( ON ?auto_78525 ?auto_78524 ) ( ON ?auto_78526 ?auto_78525 ) ( not ( = ?auto_78521 ?auto_78522 ) ) ( not ( = ?auto_78521 ?auto_78523 ) ) ( not ( = ?auto_78521 ?auto_78524 ) ) ( not ( = ?auto_78521 ?auto_78525 ) ) ( not ( = ?auto_78521 ?auto_78526 ) ) ( not ( = ?auto_78521 ?auto_78527 ) ) ( not ( = ?auto_78521 ?auto_78528 ) ) ( not ( = ?auto_78521 ?auto_78529 ) ) ( not ( = ?auto_78522 ?auto_78523 ) ) ( not ( = ?auto_78522 ?auto_78524 ) ) ( not ( = ?auto_78522 ?auto_78525 ) ) ( not ( = ?auto_78522 ?auto_78526 ) ) ( not ( = ?auto_78522 ?auto_78527 ) ) ( not ( = ?auto_78522 ?auto_78528 ) ) ( not ( = ?auto_78522 ?auto_78529 ) ) ( not ( = ?auto_78523 ?auto_78524 ) ) ( not ( = ?auto_78523 ?auto_78525 ) ) ( not ( = ?auto_78523 ?auto_78526 ) ) ( not ( = ?auto_78523 ?auto_78527 ) ) ( not ( = ?auto_78523 ?auto_78528 ) ) ( not ( = ?auto_78523 ?auto_78529 ) ) ( not ( = ?auto_78524 ?auto_78525 ) ) ( not ( = ?auto_78524 ?auto_78526 ) ) ( not ( = ?auto_78524 ?auto_78527 ) ) ( not ( = ?auto_78524 ?auto_78528 ) ) ( not ( = ?auto_78524 ?auto_78529 ) ) ( not ( = ?auto_78525 ?auto_78526 ) ) ( not ( = ?auto_78525 ?auto_78527 ) ) ( not ( = ?auto_78525 ?auto_78528 ) ) ( not ( = ?auto_78525 ?auto_78529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78526 ?auto_78527 ?auto_78528 )
      ( MAKE-7CRATE-VERIFY ?auto_78521 ?auto_78522 ?auto_78523 ?auto_78524 ?auto_78525 ?auto_78526 ?auto_78527 ?auto_78528 ) )
  )

)

