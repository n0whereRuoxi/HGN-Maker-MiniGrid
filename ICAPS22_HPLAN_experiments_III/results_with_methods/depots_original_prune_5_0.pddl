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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12501 - SURFACE
      ?auto_12502 - SURFACE
    )
    :vars
    (
      ?auto_12503 - HOIST
      ?auto_12504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12503 ?auto_12504 ) ( SURFACE-AT ?auto_12501 ?auto_12504 ) ( CLEAR ?auto_12501 ) ( LIFTING ?auto_12503 ?auto_12502 ) ( IS-CRATE ?auto_12502 ) ( not ( = ?auto_12501 ?auto_12502 ) ) )
    :subtasks
    ( ( !DROP ?auto_12503 ?auto_12502 ?auto_12501 ?auto_12504 )
      ( MAKE-1CRATE-VERIFY ?auto_12501 ?auto_12502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12505 - SURFACE
      ?auto_12506 - SURFACE
    )
    :vars
    (
      ?auto_12507 - HOIST
      ?auto_12508 - PLACE
      ?auto_12509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12507 ?auto_12508 ) ( SURFACE-AT ?auto_12505 ?auto_12508 ) ( CLEAR ?auto_12505 ) ( IS-CRATE ?auto_12506 ) ( not ( = ?auto_12505 ?auto_12506 ) ) ( TRUCK-AT ?auto_12509 ?auto_12508 ) ( AVAILABLE ?auto_12507 ) ( IN ?auto_12506 ?auto_12509 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12507 ?auto_12506 ?auto_12509 ?auto_12508 )
      ( MAKE-1CRATE ?auto_12505 ?auto_12506 )
      ( MAKE-1CRATE-VERIFY ?auto_12505 ?auto_12506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12510 - SURFACE
      ?auto_12511 - SURFACE
    )
    :vars
    (
      ?auto_12513 - HOIST
      ?auto_12512 - PLACE
      ?auto_12514 - TRUCK
      ?auto_12515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12513 ?auto_12512 ) ( SURFACE-AT ?auto_12510 ?auto_12512 ) ( CLEAR ?auto_12510 ) ( IS-CRATE ?auto_12511 ) ( not ( = ?auto_12510 ?auto_12511 ) ) ( AVAILABLE ?auto_12513 ) ( IN ?auto_12511 ?auto_12514 ) ( TRUCK-AT ?auto_12514 ?auto_12515 ) ( not ( = ?auto_12515 ?auto_12512 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12514 ?auto_12515 ?auto_12512 )
      ( MAKE-1CRATE ?auto_12510 ?auto_12511 )
      ( MAKE-1CRATE-VERIFY ?auto_12510 ?auto_12511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12516 - SURFACE
      ?auto_12517 - SURFACE
    )
    :vars
    (
      ?auto_12518 - HOIST
      ?auto_12520 - PLACE
      ?auto_12519 - TRUCK
      ?auto_12521 - PLACE
      ?auto_12522 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12518 ?auto_12520 ) ( SURFACE-AT ?auto_12516 ?auto_12520 ) ( CLEAR ?auto_12516 ) ( IS-CRATE ?auto_12517 ) ( not ( = ?auto_12516 ?auto_12517 ) ) ( AVAILABLE ?auto_12518 ) ( TRUCK-AT ?auto_12519 ?auto_12521 ) ( not ( = ?auto_12521 ?auto_12520 ) ) ( HOIST-AT ?auto_12522 ?auto_12521 ) ( LIFTING ?auto_12522 ?auto_12517 ) ( not ( = ?auto_12518 ?auto_12522 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12522 ?auto_12517 ?auto_12519 ?auto_12521 )
      ( MAKE-1CRATE ?auto_12516 ?auto_12517 )
      ( MAKE-1CRATE-VERIFY ?auto_12516 ?auto_12517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12523 - SURFACE
      ?auto_12524 - SURFACE
    )
    :vars
    (
      ?auto_12528 - HOIST
      ?auto_12527 - PLACE
      ?auto_12525 - TRUCK
      ?auto_12526 - PLACE
      ?auto_12529 - HOIST
      ?auto_12530 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12528 ?auto_12527 ) ( SURFACE-AT ?auto_12523 ?auto_12527 ) ( CLEAR ?auto_12523 ) ( IS-CRATE ?auto_12524 ) ( not ( = ?auto_12523 ?auto_12524 ) ) ( AVAILABLE ?auto_12528 ) ( TRUCK-AT ?auto_12525 ?auto_12526 ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( HOIST-AT ?auto_12529 ?auto_12526 ) ( not ( = ?auto_12528 ?auto_12529 ) ) ( AVAILABLE ?auto_12529 ) ( SURFACE-AT ?auto_12524 ?auto_12526 ) ( ON ?auto_12524 ?auto_12530 ) ( CLEAR ?auto_12524 ) ( not ( = ?auto_12523 ?auto_12530 ) ) ( not ( = ?auto_12524 ?auto_12530 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12529 ?auto_12524 ?auto_12530 ?auto_12526 )
      ( MAKE-1CRATE ?auto_12523 ?auto_12524 )
      ( MAKE-1CRATE-VERIFY ?auto_12523 ?auto_12524 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12531 - SURFACE
      ?auto_12532 - SURFACE
    )
    :vars
    (
      ?auto_12537 - HOIST
      ?auto_12536 - PLACE
      ?auto_12535 - PLACE
      ?auto_12533 - HOIST
      ?auto_12538 - SURFACE
      ?auto_12534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12537 ?auto_12536 ) ( SURFACE-AT ?auto_12531 ?auto_12536 ) ( CLEAR ?auto_12531 ) ( IS-CRATE ?auto_12532 ) ( not ( = ?auto_12531 ?auto_12532 ) ) ( AVAILABLE ?auto_12537 ) ( not ( = ?auto_12535 ?auto_12536 ) ) ( HOIST-AT ?auto_12533 ?auto_12535 ) ( not ( = ?auto_12537 ?auto_12533 ) ) ( AVAILABLE ?auto_12533 ) ( SURFACE-AT ?auto_12532 ?auto_12535 ) ( ON ?auto_12532 ?auto_12538 ) ( CLEAR ?auto_12532 ) ( not ( = ?auto_12531 ?auto_12538 ) ) ( not ( = ?auto_12532 ?auto_12538 ) ) ( TRUCK-AT ?auto_12534 ?auto_12536 ) )
    :subtasks
    ( ( !DRIVE ?auto_12534 ?auto_12536 ?auto_12535 )
      ( MAKE-1CRATE ?auto_12531 ?auto_12532 )
      ( MAKE-1CRATE-VERIFY ?auto_12531 ?auto_12532 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12548 - SURFACE
      ?auto_12549 - SURFACE
      ?auto_12550 - SURFACE
    )
    :vars
    (
      ?auto_12552 - HOIST
      ?auto_12551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12552 ?auto_12551 ) ( SURFACE-AT ?auto_12549 ?auto_12551 ) ( CLEAR ?auto_12549 ) ( LIFTING ?auto_12552 ?auto_12550 ) ( IS-CRATE ?auto_12550 ) ( not ( = ?auto_12549 ?auto_12550 ) ) ( ON ?auto_12549 ?auto_12548 ) ( not ( = ?auto_12548 ?auto_12549 ) ) ( not ( = ?auto_12548 ?auto_12550 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12549 ?auto_12550 )
      ( MAKE-2CRATE-VERIFY ?auto_12548 ?auto_12549 ?auto_12550 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12558 - SURFACE
      ?auto_12559 - SURFACE
      ?auto_12560 - SURFACE
    )
    :vars
    (
      ?auto_12563 - HOIST
      ?auto_12561 - PLACE
      ?auto_12562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12563 ?auto_12561 ) ( SURFACE-AT ?auto_12559 ?auto_12561 ) ( CLEAR ?auto_12559 ) ( IS-CRATE ?auto_12560 ) ( not ( = ?auto_12559 ?auto_12560 ) ) ( TRUCK-AT ?auto_12562 ?auto_12561 ) ( AVAILABLE ?auto_12563 ) ( IN ?auto_12560 ?auto_12562 ) ( ON ?auto_12559 ?auto_12558 ) ( not ( = ?auto_12558 ?auto_12559 ) ) ( not ( = ?auto_12558 ?auto_12560 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12559 ?auto_12560 )
      ( MAKE-2CRATE-VERIFY ?auto_12558 ?auto_12559 ?auto_12560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12564 - SURFACE
      ?auto_12565 - SURFACE
    )
    :vars
    (
      ?auto_12568 - HOIST
      ?auto_12567 - PLACE
      ?auto_12569 - TRUCK
      ?auto_12566 - SURFACE
      ?auto_12570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12568 ?auto_12567 ) ( SURFACE-AT ?auto_12564 ?auto_12567 ) ( CLEAR ?auto_12564 ) ( IS-CRATE ?auto_12565 ) ( not ( = ?auto_12564 ?auto_12565 ) ) ( AVAILABLE ?auto_12568 ) ( IN ?auto_12565 ?auto_12569 ) ( ON ?auto_12564 ?auto_12566 ) ( not ( = ?auto_12566 ?auto_12564 ) ) ( not ( = ?auto_12566 ?auto_12565 ) ) ( TRUCK-AT ?auto_12569 ?auto_12570 ) ( not ( = ?auto_12570 ?auto_12567 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12569 ?auto_12570 ?auto_12567 )
      ( MAKE-2CRATE ?auto_12566 ?auto_12564 ?auto_12565 )
      ( MAKE-1CRATE-VERIFY ?auto_12564 ?auto_12565 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12571 - SURFACE
      ?auto_12572 - SURFACE
      ?auto_12573 - SURFACE
    )
    :vars
    (
      ?auto_12574 - HOIST
      ?auto_12576 - PLACE
      ?auto_12577 - TRUCK
      ?auto_12575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12574 ?auto_12576 ) ( SURFACE-AT ?auto_12572 ?auto_12576 ) ( CLEAR ?auto_12572 ) ( IS-CRATE ?auto_12573 ) ( not ( = ?auto_12572 ?auto_12573 ) ) ( AVAILABLE ?auto_12574 ) ( IN ?auto_12573 ?auto_12577 ) ( ON ?auto_12572 ?auto_12571 ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12573 ) ) ( TRUCK-AT ?auto_12577 ?auto_12575 ) ( not ( = ?auto_12575 ?auto_12576 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12572 ?auto_12573 )
      ( MAKE-2CRATE-VERIFY ?auto_12571 ?auto_12572 ?auto_12573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12578 - SURFACE
      ?auto_12579 - SURFACE
    )
    :vars
    (
      ?auto_12581 - HOIST
      ?auto_12584 - PLACE
      ?auto_12583 - SURFACE
      ?auto_12580 - TRUCK
      ?auto_12582 - PLACE
      ?auto_12585 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12581 ?auto_12584 ) ( SURFACE-AT ?auto_12578 ?auto_12584 ) ( CLEAR ?auto_12578 ) ( IS-CRATE ?auto_12579 ) ( not ( = ?auto_12578 ?auto_12579 ) ) ( AVAILABLE ?auto_12581 ) ( ON ?auto_12578 ?auto_12583 ) ( not ( = ?auto_12583 ?auto_12578 ) ) ( not ( = ?auto_12583 ?auto_12579 ) ) ( TRUCK-AT ?auto_12580 ?auto_12582 ) ( not ( = ?auto_12582 ?auto_12584 ) ) ( HOIST-AT ?auto_12585 ?auto_12582 ) ( LIFTING ?auto_12585 ?auto_12579 ) ( not ( = ?auto_12581 ?auto_12585 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12585 ?auto_12579 ?auto_12580 ?auto_12582 )
      ( MAKE-2CRATE ?auto_12583 ?auto_12578 ?auto_12579 )
      ( MAKE-1CRATE-VERIFY ?auto_12578 ?auto_12579 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12586 - SURFACE
      ?auto_12587 - SURFACE
      ?auto_12588 - SURFACE
    )
    :vars
    (
      ?auto_12592 - HOIST
      ?auto_12590 - PLACE
      ?auto_12593 - TRUCK
      ?auto_12589 - PLACE
      ?auto_12591 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12592 ?auto_12590 ) ( SURFACE-AT ?auto_12587 ?auto_12590 ) ( CLEAR ?auto_12587 ) ( IS-CRATE ?auto_12588 ) ( not ( = ?auto_12587 ?auto_12588 ) ) ( AVAILABLE ?auto_12592 ) ( ON ?auto_12587 ?auto_12586 ) ( not ( = ?auto_12586 ?auto_12587 ) ) ( not ( = ?auto_12586 ?auto_12588 ) ) ( TRUCK-AT ?auto_12593 ?auto_12589 ) ( not ( = ?auto_12589 ?auto_12590 ) ) ( HOIST-AT ?auto_12591 ?auto_12589 ) ( LIFTING ?auto_12591 ?auto_12588 ) ( not ( = ?auto_12592 ?auto_12591 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12587 ?auto_12588 )
      ( MAKE-2CRATE-VERIFY ?auto_12586 ?auto_12587 ?auto_12588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12594 - SURFACE
      ?auto_12595 - SURFACE
    )
    :vars
    (
      ?auto_12600 - HOIST
      ?auto_12598 - PLACE
      ?auto_12597 - SURFACE
      ?auto_12601 - TRUCK
      ?auto_12596 - PLACE
      ?auto_12599 - HOIST
      ?auto_12602 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12600 ?auto_12598 ) ( SURFACE-AT ?auto_12594 ?auto_12598 ) ( CLEAR ?auto_12594 ) ( IS-CRATE ?auto_12595 ) ( not ( = ?auto_12594 ?auto_12595 ) ) ( AVAILABLE ?auto_12600 ) ( ON ?auto_12594 ?auto_12597 ) ( not ( = ?auto_12597 ?auto_12594 ) ) ( not ( = ?auto_12597 ?auto_12595 ) ) ( TRUCK-AT ?auto_12601 ?auto_12596 ) ( not ( = ?auto_12596 ?auto_12598 ) ) ( HOIST-AT ?auto_12599 ?auto_12596 ) ( not ( = ?auto_12600 ?auto_12599 ) ) ( AVAILABLE ?auto_12599 ) ( SURFACE-AT ?auto_12595 ?auto_12596 ) ( ON ?auto_12595 ?auto_12602 ) ( CLEAR ?auto_12595 ) ( not ( = ?auto_12594 ?auto_12602 ) ) ( not ( = ?auto_12595 ?auto_12602 ) ) ( not ( = ?auto_12597 ?auto_12602 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12599 ?auto_12595 ?auto_12602 ?auto_12596 )
      ( MAKE-2CRATE ?auto_12597 ?auto_12594 ?auto_12595 )
      ( MAKE-1CRATE-VERIFY ?auto_12594 ?auto_12595 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12603 - SURFACE
      ?auto_12604 - SURFACE
      ?auto_12605 - SURFACE
    )
    :vars
    (
      ?auto_12607 - HOIST
      ?auto_12608 - PLACE
      ?auto_12610 - TRUCK
      ?auto_12606 - PLACE
      ?auto_12611 - HOIST
      ?auto_12609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12607 ?auto_12608 ) ( SURFACE-AT ?auto_12604 ?auto_12608 ) ( CLEAR ?auto_12604 ) ( IS-CRATE ?auto_12605 ) ( not ( = ?auto_12604 ?auto_12605 ) ) ( AVAILABLE ?auto_12607 ) ( ON ?auto_12604 ?auto_12603 ) ( not ( = ?auto_12603 ?auto_12604 ) ) ( not ( = ?auto_12603 ?auto_12605 ) ) ( TRUCK-AT ?auto_12610 ?auto_12606 ) ( not ( = ?auto_12606 ?auto_12608 ) ) ( HOIST-AT ?auto_12611 ?auto_12606 ) ( not ( = ?auto_12607 ?auto_12611 ) ) ( AVAILABLE ?auto_12611 ) ( SURFACE-AT ?auto_12605 ?auto_12606 ) ( ON ?auto_12605 ?auto_12609 ) ( CLEAR ?auto_12605 ) ( not ( = ?auto_12604 ?auto_12609 ) ) ( not ( = ?auto_12605 ?auto_12609 ) ) ( not ( = ?auto_12603 ?auto_12609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12604 ?auto_12605 )
      ( MAKE-2CRATE-VERIFY ?auto_12603 ?auto_12604 ?auto_12605 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12612 - SURFACE
      ?auto_12613 - SURFACE
    )
    :vars
    (
      ?auto_12618 - HOIST
      ?auto_12614 - PLACE
      ?auto_12615 - SURFACE
      ?auto_12620 - PLACE
      ?auto_12617 - HOIST
      ?auto_12616 - SURFACE
      ?auto_12619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12618 ?auto_12614 ) ( SURFACE-AT ?auto_12612 ?auto_12614 ) ( CLEAR ?auto_12612 ) ( IS-CRATE ?auto_12613 ) ( not ( = ?auto_12612 ?auto_12613 ) ) ( AVAILABLE ?auto_12618 ) ( ON ?auto_12612 ?auto_12615 ) ( not ( = ?auto_12615 ?auto_12612 ) ) ( not ( = ?auto_12615 ?auto_12613 ) ) ( not ( = ?auto_12620 ?auto_12614 ) ) ( HOIST-AT ?auto_12617 ?auto_12620 ) ( not ( = ?auto_12618 ?auto_12617 ) ) ( AVAILABLE ?auto_12617 ) ( SURFACE-AT ?auto_12613 ?auto_12620 ) ( ON ?auto_12613 ?auto_12616 ) ( CLEAR ?auto_12613 ) ( not ( = ?auto_12612 ?auto_12616 ) ) ( not ( = ?auto_12613 ?auto_12616 ) ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( TRUCK-AT ?auto_12619 ?auto_12614 ) )
    :subtasks
    ( ( !DRIVE ?auto_12619 ?auto_12614 ?auto_12620 )
      ( MAKE-2CRATE ?auto_12615 ?auto_12612 ?auto_12613 )
      ( MAKE-1CRATE-VERIFY ?auto_12612 ?auto_12613 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12621 - SURFACE
      ?auto_12622 - SURFACE
      ?auto_12623 - SURFACE
    )
    :vars
    (
      ?auto_12627 - HOIST
      ?auto_12624 - PLACE
      ?auto_12629 - PLACE
      ?auto_12626 - HOIST
      ?auto_12628 - SURFACE
      ?auto_12625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12627 ?auto_12624 ) ( SURFACE-AT ?auto_12622 ?auto_12624 ) ( CLEAR ?auto_12622 ) ( IS-CRATE ?auto_12623 ) ( not ( = ?auto_12622 ?auto_12623 ) ) ( AVAILABLE ?auto_12627 ) ( ON ?auto_12622 ?auto_12621 ) ( not ( = ?auto_12621 ?auto_12622 ) ) ( not ( = ?auto_12621 ?auto_12623 ) ) ( not ( = ?auto_12629 ?auto_12624 ) ) ( HOIST-AT ?auto_12626 ?auto_12629 ) ( not ( = ?auto_12627 ?auto_12626 ) ) ( AVAILABLE ?auto_12626 ) ( SURFACE-AT ?auto_12623 ?auto_12629 ) ( ON ?auto_12623 ?auto_12628 ) ( CLEAR ?auto_12623 ) ( not ( = ?auto_12622 ?auto_12628 ) ) ( not ( = ?auto_12623 ?auto_12628 ) ) ( not ( = ?auto_12621 ?auto_12628 ) ) ( TRUCK-AT ?auto_12625 ?auto_12624 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12622 ?auto_12623 )
      ( MAKE-2CRATE-VERIFY ?auto_12621 ?auto_12622 ?auto_12623 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12630 - SURFACE
      ?auto_12631 - SURFACE
    )
    :vars
    (
      ?auto_12634 - HOIST
      ?auto_12637 - PLACE
      ?auto_12636 - SURFACE
      ?auto_12638 - PLACE
      ?auto_12635 - HOIST
      ?auto_12632 - SURFACE
      ?auto_12633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12634 ?auto_12637 ) ( IS-CRATE ?auto_12631 ) ( not ( = ?auto_12630 ?auto_12631 ) ) ( not ( = ?auto_12636 ?auto_12630 ) ) ( not ( = ?auto_12636 ?auto_12631 ) ) ( not ( = ?auto_12638 ?auto_12637 ) ) ( HOIST-AT ?auto_12635 ?auto_12638 ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( AVAILABLE ?auto_12635 ) ( SURFACE-AT ?auto_12631 ?auto_12638 ) ( ON ?auto_12631 ?auto_12632 ) ( CLEAR ?auto_12631 ) ( not ( = ?auto_12630 ?auto_12632 ) ) ( not ( = ?auto_12631 ?auto_12632 ) ) ( not ( = ?auto_12636 ?auto_12632 ) ) ( TRUCK-AT ?auto_12633 ?auto_12637 ) ( SURFACE-AT ?auto_12636 ?auto_12637 ) ( CLEAR ?auto_12636 ) ( LIFTING ?auto_12634 ?auto_12630 ) ( IS-CRATE ?auto_12630 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12636 ?auto_12630 )
      ( MAKE-2CRATE ?auto_12636 ?auto_12630 ?auto_12631 )
      ( MAKE-1CRATE-VERIFY ?auto_12630 ?auto_12631 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12639 - SURFACE
      ?auto_12640 - SURFACE
      ?auto_12641 - SURFACE
    )
    :vars
    (
      ?auto_12643 - HOIST
      ?auto_12642 - PLACE
      ?auto_12645 - PLACE
      ?auto_12647 - HOIST
      ?auto_12646 - SURFACE
      ?auto_12644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12643 ?auto_12642 ) ( IS-CRATE ?auto_12641 ) ( not ( = ?auto_12640 ?auto_12641 ) ) ( not ( = ?auto_12639 ?auto_12640 ) ) ( not ( = ?auto_12639 ?auto_12641 ) ) ( not ( = ?auto_12645 ?auto_12642 ) ) ( HOIST-AT ?auto_12647 ?auto_12645 ) ( not ( = ?auto_12643 ?auto_12647 ) ) ( AVAILABLE ?auto_12647 ) ( SURFACE-AT ?auto_12641 ?auto_12645 ) ( ON ?auto_12641 ?auto_12646 ) ( CLEAR ?auto_12641 ) ( not ( = ?auto_12640 ?auto_12646 ) ) ( not ( = ?auto_12641 ?auto_12646 ) ) ( not ( = ?auto_12639 ?auto_12646 ) ) ( TRUCK-AT ?auto_12644 ?auto_12642 ) ( SURFACE-AT ?auto_12639 ?auto_12642 ) ( CLEAR ?auto_12639 ) ( LIFTING ?auto_12643 ?auto_12640 ) ( IS-CRATE ?auto_12640 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12640 ?auto_12641 )
      ( MAKE-2CRATE-VERIFY ?auto_12639 ?auto_12640 ?auto_12641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12648 - SURFACE
      ?auto_12649 - SURFACE
    )
    :vars
    (
      ?auto_12653 - HOIST
      ?auto_12655 - PLACE
      ?auto_12652 - SURFACE
      ?auto_12651 - PLACE
      ?auto_12656 - HOIST
      ?auto_12654 - SURFACE
      ?auto_12650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12653 ?auto_12655 ) ( IS-CRATE ?auto_12649 ) ( not ( = ?auto_12648 ?auto_12649 ) ) ( not ( = ?auto_12652 ?auto_12648 ) ) ( not ( = ?auto_12652 ?auto_12649 ) ) ( not ( = ?auto_12651 ?auto_12655 ) ) ( HOIST-AT ?auto_12656 ?auto_12651 ) ( not ( = ?auto_12653 ?auto_12656 ) ) ( AVAILABLE ?auto_12656 ) ( SURFACE-AT ?auto_12649 ?auto_12651 ) ( ON ?auto_12649 ?auto_12654 ) ( CLEAR ?auto_12649 ) ( not ( = ?auto_12648 ?auto_12654 ) ) ( not ( = ?auto_12649 ?auto_12654 ) ) ( not ( = ?auto_12652 ?auto_12654 ) ) ( TRUCK-AT ?auto_12650 ?auto_12655 ) ( SURFACE-AT ?auto_12652 ?auto_12655 ) ( CLEAR ?auto_12652 ) ( IS-CRATE ?auto_12648 ) ( AVAILABLE ?auto_12653 ) ( IN ?auto_12648 ?auto_12650 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12653 ?auto_12648 ?auto_12650 ?auto_12655 )
      ( MAKE-2CRATE ?auto_12652 ?auto_12648 ?auto_12649 )
      ( MAKE-1CRATE-VERIFY ?auto_12648 ?auto_12649 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12657 - SURFACE
      ?auto_12658 - SURFACE
      ?auto_12659 - SURFACE
    )
    :vars
    (
      ?auto_12664 - HOIST
      ?auto_12665 - PLACE
      ?auto_12663 - PLACE
      ?auto_12660 - HOIST
      ?auto_12661 - SURFACE
      ?auto_12662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12664 ?auto_12665 ) ( IS-CRATE ?auto_12659 ) ( not ( = ?auto_12658 ?auto_12659 ) ) ( not ( = ?auto_12657 ?auto_12658 ) ) ( not ( = ?auto_12657 ?auto_12659 ) ) ( not ( = ?auto_12663 ?auto_12665 ) ) ( HOIST-AT ?auto_12660 ?auto_12663 ) ( not ( = ?auto_12664 ?auto_12660 ) ) ( AVAILABLE ?auto_12660 ) ( SURFACE-AT ?auto_12659 ?auto_12663 ) ( ON ?auto_12659 ?auto_12661 ) ( CLEAR ?auto_12659 ) ( not ( = ?auto_12658 ?auto_12661 ) ) ( not ( = ?auto_12659 ?auto_12661 ) ) ( not ( = ?auto_12657 ?auto_12661 ) ) ( TRUCK-AT ?auto_12662 ?auto_12665 ) ( SURFACE-AT ?auto_12657 ?auto_12665 ) ( CLEAR ?auto_12657 ) ( IS-CRATE ?auto_12658 ) ( AVAILABLE ?auto_12664 ) ( IN ?auto_12658 ?auto_12662 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12658 ?auto_12659 )
      ( MAKE-2CRATE-VERIFY ?auto_12657 ?auto_12658 ?auto_12659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12702 - SURFACE
      ?auto_12703 - SURFACE
    )
    :vars
    (
      ?auto_12708 - HOIST
      ?auto_12710 - PLACE
      ?auto_12707 - SURFACE
      ?auto_12705 - PLACE
      ?auto_12706 - HOIST
      ?auto_12704 - SURFACE
      ?auto_12709 - TRUCK
      ?auto_12711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12708 ?auto_12710 ) ( SURFACE-AT ?auto_12702 ?auto_12710 ) ( CLEAR ?auto_12702 ) ( IS-CRATE ?auto_12703 ) ( not ( = ?auto_12702 ?auto_12703 ) ) ( AVAILABLE ?auto_12708 ) ( ON ?auto_12702 ?auto_12707 ) ( not ( = ?auto_12707 ?auto_12702 ) ) ( not ( = ?auto_12707 ?auto_12703 ) ) ( not ( = ?auto_12705 ?auto_12710 ) ) ( HOIST-AT ?auto_12706 ?auto_12705 ) ( not ( = ?auto_12708 ?auto_12706 ) ) ( AVAILABLE ?auto_12706 ) ( SURFACE-AT ?auto_12703 ?auto_12705 ) ( ON ?auto_12703 ?auto_12704 ) ( CLEAR ?auto_12703 ) ( not ( = ?auto_12702 ?auto_12704 ) ) ( not ( = ?auto_12703 ?auto_12704 ) ) ( not ( = ?auto_12707 ?auto_12704 ) ) ( TRUCK-AT ?auto_12709 ?auto_12711 ) ( not ( = ?auto_12711 ?auto_12710 ) ) ( not ( = ?auto_12705 ?auto_12711 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12709 ?auto_12711 ?auto_12710 )
      ( MAKE-1CRATE ?auto_12702 ?auto_12703 )
      ( MAKE-1CRATE-VERIFY ?auto_12702 ?auto_12703 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12741 - SURFACE
      ?auto_12742 - SURFACE
      ?auto_12743 - SURFACE
      ?auto_12744 - SURFACE
    )
    :vars
    (
      ?auto_12746 - HOIST
      ?auto_12745 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12746 ?auto_12745 ) ( SURFACE-AT ?auto_12743 ?auto_12745 ) ( CLEAR ?auto_12743 ) ( LIFTING ?auto_12746 ?auto_12744 ) ( IS-CRATE ?auto_12744 ) ( not ( = ?auto_12743 ?auto_12744 ) ) ( ON ?auto_12742 ?auto_12741 ) ( ON ?auto_12743 ?auto_12742 ) ( not ( = ?auto_12741 ?auto_12742 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12744 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12742 ?auto_12744 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12743 ?auto_12744 )
      ( MAKE-3CRATE-VERIFY ?auto_12741 ?auto_12742 ?auto_12743 ?auto_12744 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12758 - SURFACE
      ?auto_12759 - SURFACE
      ?auto_12760 - SURFACE
      ?auto_12761 - SURFACE
    )
    :vars
    (
      ?auto_12764 - HOIST
      ?auto_12762 - PLACE
      ?auto_12763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12764 ?auto_12762 ) ( SURFACE-AT ?auto_12760 ?auto_12762 ) ( CLEAR ?auto_12760 ) ( IS-CRATE ?auto_12761 ) ( not ( = ?auto_12760 ?auto_12761 ) ) ( TRUCK-AT ?auto_12763 ?auto_12762 ) ( AVAILABLE ?auto_12764 ) ( IN ?auto_12761 ?auto_12763 ) ( ON ?auto_12760 ?auto_12759 ) ( not ( = ?auto_12759 ?auto_12760 ) ) ( not ( = ?auto_12759 ?auto_12761 ) ) ( ON ?auto_12759 ?auto_12758 ) ( not ( = ?auto_12758 ?auto_12759 ) ) ( not ( = ?auto_12758 ?auto_12760 ) ) ( not ( = ?auto_12758 ?auto_12761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12759 ?auto_12760 ?auto_12761 )
      ( MAKE-3CRATE-VERIFY ?auto_12758 ?auto_12759 ?auto_12760 ?auto_12761 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12779 - SURFACE
      ?auto_12780 - SURFACE
      ?auto_12781 - SURFACE
      ?auto_12782 - SURFACE
    )
    :vars
    (
      ?auto_12783 - HOIST
      ?auto_12786 - PLACE
      ?auto_12785 - TRUCK
      ?auto_12784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12783 ?auto_12786 ) ( SURFACE-AT ?auto_12781 ?auto_12786 ) ( CLEAR ?auto_12781 ) ( IS-CRATE ?auto_12782 ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( AVAILABLE ?auto_12783 ) ( IN ?auto_12782 ?auto_12785 ) ( ON ?auto_12781 ?auto_12780 ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( not ( = ?auto_12780 ?auto_12782 ) ) ( TRUCK-AT ?auto_12785 ?auto_12784 ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( ON ?auto_12780 ?auto_12779 ) ( not ( = ?auto_12779 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12781 ) ) ( not ( = ?auto_12779 ?auto_12782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12780 ?auto_12781 ?auto_12782 )
      ( MAKE-3CRATE-VERIFY ?auto_12779 ?auto_12780 ?auto_12781 ?auto_12782 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12803 - SURFACE
      ?auto_12804 - SURFACE
      ?auto_12805 - SURFACE
      ?auto_12806 - SURFACE
    )
    :vars
    (
      ?auto_12809 - HOIST
      ?auto_12807 - PLACE
      ?auto_12808 - TRUCK
      ?auto_12811 - PLACE
      ?auto_12810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12809 ?auto_12807 ) ( SURFACE-AT ?auto_12805 ?auto_12807 ) ( CLEAR ?auto_12805 ) ( IS-CRATE ?auto_12806 ) ( not ( = ?auto_12805 ?auto_12806 ) ) ( AVAILABLE ?auto_12809 ) ( ON ?auto_12805 ?auto_12804 ) ( not ( = ?auto_12804 ?auto_12805 ) ) ( not ( = ?auto_12804 ?auto_12806 ) ) ( TRUCK-AT ?auto_12808 ?auto_12811 ) ( not ( = ?auto_12811 ?auto_12807 ) ) ( HOIST-AT ?auto_12810 ?auto_12811 ) ( LIFTING ?auto_12810 ?auto_12806 ) ( not ( = ?auto_12809 ?auto_12810 ) ) ( ON ?auto_12804 ?auto_12803 ) ( not ( = ?auto_12803 ?auto_12804 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12804 ?auto_12805 ?auto_12806 )
      ( MAKE-3CRATE-VERIFY ?auto_12803 ?auto_12804 ?auto_12805 ?auto_12806 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12830 - SURFACE
      ?auto_12831 - SURFACE
      ?auto_12832 - SURFACE
      ?auto_12833 - SURFACE
    )
    :vars
    (
      ?auto_12838 - HOIST
      ?auto_12834 - PLACE
      ?auto_12837 - TRUCK
      ?auto_12835 - PLACE
      ?auto_12839 - HOIST
      ?auto_12836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12838 ?auto_12834 ) ( SURFACE-AT ?auto_12832 ?auto_12834 ) ( CLEAR ?auto_12832 ) ( IS-CRATE ?auto_12833 ) ( not ( = ?auto_12832 ?auto_12833 ) ) ( AVAILABLE ?auto_12838 ) ( ON ?auto_12832 ?auto_12831 ) ( not ( = ?auto_12831 ?auto_12832 ) ) ( not ( = ?auto_12831 ?auto_12833 ) ) ( TRUCK-AT ?auto_12837 ?auto_12835 ) ( not ( = ?auto_12835 ?auto_12834 ) ) ( HOIST-AT ?auto_12839 ?auto_12835 ) ( not ( = ?auto_12838 ?auto_12839 ) ) ( AVAILABLE ?auto_12839 ) ( SURFACE-AT ?auto_12833 ?auto_12835 ) ( ON ?auto_12833 ?auto_12836 ) ( CLEAR ?auto_12833 ) ( not ( = ?auto_12832 ?auto_12836 ) ) ( not ( = ?auto_12833 ?auto_12836 ) ) ( not ( = ?auto_12831 ?auto_12836 ) ) ( ON ?auto_12831 ?auto_12830 ) ( not ( = ?auto_12830 ?auto_12831 ) ) ( not ( = ?auto_12830 ?auto_12832 ) ) ( not ( = ?auto_12830 ?auto_12833 ) ) ( not ( = ?auto_12830 ?auto_12836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12831 ?auto_12832 ?auto_12833 )
      ( MAKE-3CRATE-VERIFY ?auto_12830 ?auto_12831 ?auto_12832 ?auto_12833 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12858 - SURFACE
      ?auto_12859 - SURFACE
      ?auto_12860 - SURFACE
      ?auto_12861 - SURFACE
    )
    :vars
    (
      ?auto_12865 - HOIST
      ?auto_12864 - PLACE
      ?auto_12866 - PLACE
      ?auto_12862 - HOIST
      ?auto_12863 - SURFACE
      ?auto_12867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12865 ?auto_12864 ) ( SURFACE-AT ?auto_12860 ?auto_12864 ) ( CLEAR ?auto_12860 ) ( IS-CRATE ?auto_12861 ) ( not ( = ?auto_12860 ?auto_12861 ) ) ( AVAILABLE ?auto_12865 ) ( ON ?auto_12860 ?auto_12859 ) ( not ( = ?auto_12859 ?auto_12860 ) ) ( not ( = ?auto_12859 ?auto_12861 ) ) ( not ( = ?auto_12866 ?auto_12864 ) ) ( HOIST-AT ?auto_12862 ?auto_12866 ) ( not ( = ?auto_12865 ?auto_12862 ) ) ( AVAILABLE ?auto_12862 ) ( SURFACE-AT ?auto_12861 ?auto_12866 ) ( ON ?auto_12861 ?auto_12863 ) ( CLEAR ?auto_12861 ) ( not ( = ?auto_12860 ?auto_12863 ) ) ( not ( = ?auto_12861 ?auto_12863 ) ) ( not ( = ?auto_12859 ?auto_12863 ) ) ( TRUCK-AT ?auto_12867 ?auto_12864 ) ( ON ?auto_12859 ?auto_12858 ) ( not ( = ?auto_12858 ?auto_12859 ) ) ( not ( = ?auto_12858 ?auto_12860 ) ) ( not ( = ?auto_12858 ?auto_12861 ) ) ( not ( = ?auto_12858 ?auto_12863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12859 ?auto_12860 ?auto_12861 )
      ( MAKE-3CRATE-VERIFY ?auto_12858 ?auto_12859 ?auto_12860 ?auto_12861 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12886 - SURFACE
      ?auto_12887 - SURFACE
      ?auto_12888 - SURFACE
      ?auto_12889 - SURFACE
    )
    :vars
    (
      ?auto_12890 - HOIST
      ?auto_12892 - PLACE
      ?auto_12893 - PLACE
      ?auto_12891 - HOIST
      ?auto_12895 - SURFACE
      ?auto_12894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12890 ?auto_12892 ) ( IS-CRATE ?auto_12889 ) ( not ( = ?auto_12888 ?auto_12889 ) ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12887 ?auto_12889 ) ) ( not ( = ?auto_12893 ?auto_12892 ) ) ( HOIST-AT ?auto_12891 ?auto_12893 ) ( not ( = ?auto_12890 ?auto_12891 ) ) ( AVAILABLE ?auto_12891 ) ( SURFACE-AT ?auto_12889 ?auto_12893 ) ( ON ?auto_12889 ?auto_12895 ) ( CLEAR ?auto_12889 ) ( not ( = ?auto_12888 ?auto_12895 ) ) ( not ( = ?auto_12889 ?auto_12895 ) ) ( not ( = ?auto_12887 ?auto_12895 ) ) ( TRUCK-AT ?auto_12894 ?auto_12892 ) ( SURFACE-AT ?auto_12887 ?auto_12892 ) ( CLEAR ?auto_12887 ) ( LIFTING ?auto_12890 ?auto_12888 ) ( IS-CRATE ?auto_12888 ) ( ON ?auto_12887 ?auto_12886 ) ( not ( = ?auto_12886 ?auto_12887 ) ) ( not ( = ?auto_12886 ?auto_12888 ) ) ( not ( = ?auto_12886 ?auto_12889 ) ) ( not ( = ?auto_12886 ?auto_12895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12887 ?auto_12888 ?auto_12889 )
      ( MAKE-3CRATE-VERIFY ?auto_12886 ?auto_12887 ?auto_12888 ?auto_12889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12914 - SURFACE
      ?auto_12915 - SURFACE
      ?auto_12916 - SURFACE
      ?auto_12917 - SURFACE
    )
    :vars
    (
      ?auto_12919 - HOIST
      ?auto_12922 - PLACE
      ?auto_12923 - PLACE
      ?auto_12920 - HOIST
      ?auto_12918 - SURFACE
      ?auto_12921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12919 ?auto_12922 ) ( IS-CRATE ?auto_12917 ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( not ( = ?auto_12915 ?auto_12916 ) ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( not ( = ?auto_12923 ?auto_12922 ) ) ( HOIST-AT ?auto_12920 ?auto_12923 ) ( not ( = ?auto_12919 ?auto_12920 ) ) ( AVAILABLE ?auto_12920 ) ( SURFACE-AT ?auto_12917 ?auto_12923 ) ( ON ?auto_12917 ?auto_12918 ) ( CLEAR ?auto_12917 ) ( not ( = ?auto_12916 ?auto_12918 ) ) ( not ( = ?auto_12917 ?auto_12918 ) ) ( not ( = ?auto_12915 ?auto_12918 ) ) ( TRUCK-AT ?auto_12921 ?auto_12922 ) ( SURFACE-AT ?auto_12915 ?auto_12922 ) ( CLEAR ?auto_12915 ) ( IS-CRATE ?auto_12916 ) ( AVAILABLE ?auto_12919 ) ( IN ?auto_12916 ?auto_12921 ) ( ON ?auto_12915 ?auto_12914 ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12915 ?auto_12916 ?auto_12917 )
      ( MAKE-3CRATE-VERIFY ?auto_12914 ?auto_12915 ?auto_12916 ?auto_12917 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13205 - SURFACE
      ?auto_13206 - SURFACE
      ?auto_13207 - SURFACE
      ?auto_13208 - SURFACE
      ?auto_13209 - SURFACE
    )
    :vars
    (
      ?auto_13211 - HOIST
      ?auto_13210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13211 ?auto_13210 ) ( SURFACE-AT ?auto_13208 ?auto_13210 ) ( CLEAR ?auto_13208 ) ( LIFTING ?auto_13211 ?auto_13209 ) ( IS-CRATE ?auto_13209 ) ( not ( = ?auto_13208 ?auto_13209 ) ) ( ON ?auto_13206 ?auto_13205 ) ( ON ?auto_13207 ?auto_13206 ) ( ON ?auto_13208 ?auto_13207 ) ( not ( = ?auto_13205 ?auto_13206 ) ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( not ( = ?auto_13205 ?auto_13209 ) ) ( not ( = ?auto_13206 ?auto_13207 ) ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13206 ?auto_13209 ) ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13209 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13208 ?auto_13209 )
      ( MAKE-4CRATE-VERIFY ?auto_13205 ?auto_13206 ?auto_13207 ?auto_13208 ?auto_13209 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13230 - SURFACE
      ?auto_13231 - SURFACE
      ?auto_13232 - SURFACE
      ?auto_13233 - SURFACE
      ?auto_13234 - SURFACE
    )
    :vars
    (
      ?auto_13235 - HOIST
      ?auto_13236 - PLACE
      ?auto_13237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13235 ?auto_13236 ) ( SURFACE-AT ?auto_13233 ?auto_13236 ) ( CLEAR ?auto_13233 ) ( IS-CRATE ?auto_13234 ) ( not ( = ?auto_13233 ?auto_13234 ) ) ( TRUCK-AT ?auto_13237 ?auto_13236 ) ( AVAILABLE ?auto_13235 ) ( IN ?auto_13234 ?auto_13237 ) ( ON ?auto_13233 ?auto_13232 ) ( not ( = ?auto_13232 ?auto_13233 ) ) ( not ( = ?auto_13232 ?auto_13234 ) ) ( ON ?auto_13231 ?auto_13230 ) ( ON ?auto_13232 ?auto_13231 ) ( not ( = ?auto_13230 ?auto_13231 ) ) ( not ( = ?auto_13230 ?auto_13232 ) ) ( not ( = ?auto_13230 ?auto_13233 ) ) ( not ( = ?auto_13230 ?auto_13234 ) ) ( not ( = ?auto_13231 ?auto_13232 ) ) ( not ( = ?auto_13231 ?auto_13233 ) ) ( not ( = ?auto_13231 ?auto_13234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13232 ?auto_13233 ?auto_13234 )
      ( MAKE-4CRATE-VERIFY ?auto_13230 ?auto_13231 ?auto_13232 ?auto_13233 ?auto_13234 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13260 - SURFACE
      ?auto_13261 - SURFACE
      ?auto_13262 - SURFACE
      ?auto_13263 - SURFACE
      ?auto_13264 - SURFACE
    )
    :vars
    (
      ?auto_13265 - HOIST
      ?auto_13268 - PLACE
      ?auto_13266 - TRUCK
      ?auto_13267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13265 ?auto_13268 ) ( SURFACE-AT ?auto_13263 ?auto_13268 ) ( CLEAR ?auto_13263 ) ( IS-CRATE ?auto_13264 ) ( not ( = ?auto_13263 ?auto_13264 ) ) ( AVAILABLE ?auto_13265 ) ( IN ?auto_13264 ?auto_13266 ) ( ON ?auto_13263 ?auto_13262 ) ( not ( = ?auto_13262 ?auto_13263 ) ) ( not ( = ?auto_13262 ?auto_13264 ) ) ( TRUCK-AT ?auto_13266 ?auto_13267 ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( ON ?auto_13261 ?auto_13260 ) ( ON ?auto_13262 ?auto_13261 ) ( not ( = ?auto_13260 ?auto_13261 ) ) ( not ( = ?auto_13260 ?auto_13262 ) ) ( not ( = ?auto_13260 ?auto_13263 ) ) ( not ( = ?auto_13260 ?auto_13264 ) ) ( not ( = ?auto_13261 ?auto_13262 ) ) ( not ( = ?auto_13261 ?auto_13263 ) ) ( not ( = ?auto_13261 ?auto_13264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13262 ?auto_13263 ?auto_13264 )
      ( MAKE-4CRATE-VERIFY ?auto_13260 ?auto_13261 ?auto_13262 ?auto_13263 ?auto_13264 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13294 - SURFACE
      ?auto_13295 - SURFACE
      ?auto_13296 - SURFACE
      ?auto_13297 - SURFACE
      ?auto_13298 - SURFACE
    )
    :vars
    (
      ?auto_13302 - HOIST
      ?auto_13299 - PLACE
      ?auto_13300 - TRUCK
      ?auto_13303 - PLACE
      ?auto_13301 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13302 ?auto_13299 ) ( SURFACE-AT ?auto_13297 ?auto_13299 ) ( CLEAR ?auto_13297 ) ( IS-CRATE ?auto_13298 ) ( not ( = ?auto_13297 ?auto_13298 ) ) ( AVAILABLE ?auto_13302 ) ( ON ?auto_13297 ?auto_13296 ) ( not ( = ?auto_13296 ?auto_13297 ) ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( TRUCK-AT ?auto_13300 ?auto_13303 ) ( not ( = ?auto_13303 ?auto_13299 ) ) ( HOIST-AT ?auto_13301 ?auto_13303 ) ( LIFTING ?auto_13301 ?auto_13298 ) ( not ( = ?auto_13302 ?auto_13301 ) ) ( ON ?auto_13295 ?auto_13294 ) ( ON ?auto_13296 ?auto_13295 ) ( not ( = ?auto_13294 ?auto_13295 ) ) ( not ( = ?auto_13294 ?auto_13296 ) ) ( not ( = ?auto_13294 ?auto_13297 ) ) ( not ( = ?auto_13294 ?auto_13298 ) ) ( not ( = ?auto_13295 ?auto_13296 ) ) ( not ( = ?auto_13295 ?auto_13297 ) ) ( not ( = ?auto_13295 ?auto_13298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13296 ?auto_13297 ?auto_13298 )
      ( MAKE-4CRATE-VERIFY ?auto_13294 ?auto_13295 ?auto_13296 ?auto_13297 ?auto_13298 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13332 - SURFACE
      ?auto_13333 - SURFACE
      ?auto_13334 - SURFACE
      ?auto_13335 - SURFACE
      ?auto_13336 - SURFACE
    )
    :vars
    (
      ?auto_13341 - HOIST
      ?auto_13342 - PLACE
      ?auto_13338 - TRUCK
      ?auto_13337 - PLACE
      ?auto_13340 - HOIST
      ?auto_13339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13341 ?auto_13342 ) ( SURFACE-AT ?auto_13335 ?auto_13342 ) ( CLEAR ?auto_13335 ) ( IS-CRATE ?auto_13336 ) ( not ( = ?auto_13335 ?auto_13336 ) ) ( AVAILABLE ?auto_13341 ) ( ON ?auto_13335 ?auto_13334 ) ( not ( = ?auto_13334 ?auto_13335 ) ) ( not ( = ?auto_13334 ?auto_13336 ) ) ( TRUCK-AT ?auto_13338 ?auto_13337 ) ( not ( = ?auto_13337 ?auto_13342 ) ) ( HOIST-AT ?auto_13340 ?auto_13337 ) ( not ( = ?auto_13341 ?auto_13340 ) ) ( AVAILABLE ?auto_13340 ) ( SURFACE-AT ?auto_13336 ?auto_13337 ) ( ON ?auto_13336 ?auto_13339 ) ( CLEAR ?auto_13336 ) ( not ( = ?auto_13335 ?auto_13339 ) ) ( not ( = ?auto_13336 ?auto_13339 ) ) ( not ( = ?auto_13334 ?auto_13339 ) ) ( ON ?auto_13333 ?auto_13332 ) ( ON ?auto_13334 ?auto_13333 ) ( not ( = ?auto_13332 ?auto_13333 ) ) ( not ( = ?auto_13332 ?auto_13334 ) ) ( not ( = ?auto_13332 ?auto_13335 ) ) ( not ( = ?auto_13332 ?auto_13336 ) ) ( not ( = ?auto_13332 ?auto_13339 ) ) ( not ( = ?auto_13333 ?auto_13334 ) ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( not ( = ?auto_13333 ?auto_13336 ) ) ( not ( = ?auto_13333 ?auto_13339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13334 ?auto_13335 ?auto_13336 )
      ( MAKE-4CRATE-VERIFY ?auto_13332 ?auto_13333 ?auto_13334 ?auto_13335 ?auto_13336 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13371 - SURFACE
      ?auto_13372 - SURFACE
      ?auto_13373 - SURFACE
      ?auto_13374 - SURFACE
      ?auto_13375 - SURFACE
    )
    :vars
    (
      ?auto_13378 - HOIST
      ?auto_13381 - PLACE
      ?auto_13377 - PLACE
      ?auto_13380 - HOIST
      ?auto_13376 - SURFACE
      ?auto_13379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13378 ?auto_13381 ) ( SURFACE-AT ?auto_13374 ?auto_13381 ) ( CLEAR ?auto_13374 ) ( IS-CRATE ?auto_13375 ) ( not ( = ?auto_13374 ?auto_13375 ) ) ( AVAILABLE ?auto_13378 ) ( ON ?auto_13374 ?auto_13373 ) ( not ( = ?auto_13373 ?auto_13374 ) ) ( not ( = ?auto_13373 ?auto_13375 ) ) ( not ( = ?auto_13377 ?auto_13381 ) ) ( HOIST-AT ?auto_13380 ?auto_13377 ) ( not ( = ?auto_13378 ?auto_13380 ) ) ( AVAILABLE ?auto_13380 ) ( SURFACE-AT ?auto_13375 ?auto_13377 ) ( ON ?auto_13375 ?auto_13376 ) ( CLEAR ?auto_13375 ) ( not ( = ?auto_13374 ?auto_13376 ) ) ( not ( = ?auto_13375 ?auto_13376 ) ) ( not ( = ?auto_13373 ?auto_13376 ) ) ( TRUCK-AT ?auto_13379 ?auto_13381 ) ( ON ?auto_13372 ?auto_13371 ) ( ON ?auto_13373 ?auto_13372 ) ( not ( = ?auto_13371 ?auto_13372 ) ) ( not ( = ?auto_13371 ?auto_13373 ) ) ( not ( = ?auto_13371 ?auto_13374 ) ) ( not ( = ?auto_13371 ?auto_13375 ) ) ( not ( = ?auto_13371 ?auto_13376 ) ) ( not ( = ?auto_13372 ?auto_13373 ) ) ( not ( = ?auto_13372 ?auto_13374 ) ) ( not ( = ?auto_13372 ?auto_13375 ) ) ( not ( = ?auto_13372 ?auto_13376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13373 ?auto_13374 ?auto_13375 )
      ( MAKE-4CRATE-VERIFY ?auto_13371 ?auto_13372 ?auto_13373 ?auto_13374 ?auto_13375 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13410 - SURFACE
      ?auto_13411 - SURFACE
      ?auto_13412 - SURFACE
      ?auto_13413 - SURFACE
      ?auto_13414 - SURFACE
    )
    :vars
    (
      ?auto_13420 - HOIST
      ?auto_13416 - PLACE
      ?auto_13419 - PLACE
      ?auto_13418 - HOIST
      ?auto_13417 - SURFACE
      ?auto_13415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13420 ?auto_13416 ) ( IS-CRATE ?auto_13414 ) ( not ( = ?auto_13413 ?auto_13414 ) ) ( not ( = ?auto_13412 ?auto_13413 ) ) ( not ( = ?auto_13412 ?auto_13414 ) ) ( not ( = ?auto_13419 ?auto_13416 ) ) ( HOIST-AT ?auto_13418 ?auto_13419 ) ( not ( = ?auto_13420 ?auto_13418 ) ) ( AVAILABLE ?auto_13418 ) ( SURFACE-AT ?auto_13414 ?auto_13419 ) ( ON ?auto_13414 ?auto_13417 ) ( CLEAR ?auto_13414 ) ( not ( = ?auto_13413 ?auto_13417 ) ) ( not ( = ?auto_13414 ?auto_13417 ) ) ( not ( = ?auto_13412 ?auto_13417 ) ) ( TRUCK-AT ?auto_13415 ?auto_13416 ) ( SURFACE-AT ?auto_13412 ?auto_13416 ) ( CLEAR ?auto_13412 ) ( LIFTING ?auto_13420 ?auto_13413 ) ( IS-CRATE ?auto_13413 ) ( ON ?auto_13411 ?auto_13410 ) ( ON ?auto_13412 ?auto_13411 ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13410 ?auto_13413 ) ) ( not ( = ?auto_13410 ?auto_13414 ) ) ( not ( = ?auto_13410 ?auto_13417 ) ) ( not ( = ?auto_13411 ?auto_13412 ) ) ( not ( = ?auto_13411 ?auto_13413 ) ) ( not ( = ?auto_13411 ?auto_13414 ) ) ( not ( = ?auto_13411 ?auto_13417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13412 ?auto_13413 ?auto_13414 )
      ( MAKE-4CRATE-VERIFY ?auto_13410 ?auto_13411 ?auto_13412 ?auto_13413 ?auto_13414 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13449 - SURFACE
      ?auto_13450 - SURFACE
      ?auto_13451 - SURFACE
      ?auto_13452 - SURFACE
      ?auto_13453 - SURFACE
    )
    :vars
    (
      ?auto_13458 - HOIST
      ?auto_13454 - PLACE
      ?auto_13457 - PLACE
      ?auto_13459 - HOIST
      ?auto_13456 - SURFACE
      ?auto_13455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13458 ?auto_13454 ) ( IS-CRATE ?auto_13453 ) ( not ( = ?auto_13452 ?auto_13453 ) ) ( not ( = ?auto_13451 ?auto_13452 ) ) ( not ( = ?auto_13451 ?auto_13453 ) ) ( not ( = ?auto_13457 ?auto_13454 ) ) ( HOIST-AT ?auto_13459 ?auto_13457 ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( AVAILABLE ?auto_13459 ) ( SURFACE-AT ?auto_13453 ?auto_13457 ) ( ON ?auto_13453 ?auto_13456 ) ( CLEAR ?auto_13453 ) ( not ( = ?auto_13452 ?auto_13456 ) ) ( not ( = ?auto_13453 ?auto_13456 ) ) ( not ( = ?auto_13451 ?auto_13456 ) ) ( TRUCK-AT ?auto_13455 ?auto_13454 ) ( SURFACE-AT ?auto_13451 ?auto_13454 ) ( CLEAR ?auto_13451 ) ( IS-CRATE ?auto_13452 ) ( AVAILABLE ?auto_13458 ) ( IN ?auto_13452 ?auto_13455 ) ( ON ?auto_13450 ?auto_13449 ) ( ON ?auto_13451 ?auto_13450 ) ( not ( = ?auto_13449 ?auto_13450 ) ) ( not ( = ?auto_13449 ?auto_13451 ) ) ( not ( = ?auto_13449 ?auto_13452 ) ) ( not ( = ?auto_13449 ?auto_13453 ) ) ( not ( = ?auto_13449 ?auto_13456 ) ) ( not ( = ?auto_13450 ?auto_13451 ) ) ( not ( = ?auto_13450 ?auto_13452 ) ) ( not ( = ?auto_13450 ?auto_13453 ) ) ( not ( = ?auto_13450 ?auto_13456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13451 ?auto_13452 ?auto_13453 )
      ( MAKE-4CRATE-VERIFY ?auto_13449 ?auto_13450 ?auto_13451 ?auto_13452 ?auto_13453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13460 - SURFACE
      ?auto_13461 - SURFACE
    )
    :vars
    (
      ?auto_13466 - HOIST
      ?auto_13462 - PLACE
      ?auto_13468 - SURFACE
      ?auto_13465 - PLACE
      ?auto_13467 - HOIST
      ?auto_13464 - SURFACE
      ?auto_13463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13466 ?auto_13462 ) ( IS-CRATE ?auto_13461 ) ( not ( = ?auto_13460 ?auto_13461 ) ) ( not ( = ?auto_13468 ?auto_13460 ) ) ( not ( = ?auto_13468 ?auto_13461 ) ) ( not ( = ?auto_13465 ?auto_13462 ) ) ( HOIST-AT ?auto_13467 ?auto_13465 ) ( not ( = ?auto_13466 ?auto_13467 ) ) ( AVAILABLE ?auto_13467 ) ( SURFACE-AT ?auto_13461 ?auto_13465 ) ( ON ?auto_13461 ?auto_13464 ) ( CLEAR ?auto_13461 ) ( not ( = ?auto_13460 ?auto_13464 ) ) ( not ( = ?auto_13461 ?auto_13464 ) ) ( not ( = ?auto_13468 ?auto_13464 ) ) ( SURFACE-AT ?auto_13468 ?auto_13462 ) ( CLEAR ?auto_13468 ) ( IS-CRATE ?auto_13460 ) ( AVAILABLE ?auto_13466 ) ( IN ?auto_13460 ?auto_13463 ) ( TRUCK-AT ?auto_13463 ?auto_13465 ) )
    :subtasks
    ( ( !DRIVE ?auto_13463 ?auto_13465 ?auto_13462 )
      ( MAKE-2CRATE ?auto_13468 ?auto_13460 ?auto_13461 )
      ( MAKE-1CRATE-VERIFY ?auto_13460 ?auto_13461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13469 - SURFACE
      ?auto_13470 - SURFACE
      ?auto_13471 - SURFACE
    )
    :vars
    (
      ?auto_13476 - HOIST
      ?auto_13474 - PLACE
      ?auto_13475 - PLACE
      ?auto_13473 - HOIST
      ?auto_13472 - SURFACE
      ?auto_13477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13476 ?auto_13474 ) ( IS-CRATE ?auto_13471 ) ( not ( = ?auto_13470 ?auto_13471 ) ) ( not ( = ?auto_13469 ?auto_13470 ) ) ( not ( = ?auto_13469 ?auto_13471 ) ) ( not ( = ?auto_13475 ?auto_13474 ) ) ( HOIST-AT ?auto_13473 ?auto_13475 ) ( not ( = ?auto_13476 ?auto_13473 ) ) ( AVAILABLE ?auto_13473 ) ( SURFACE-AT ?auto_13471 ?auto_13475 ) ( ON ?auto_13471 ?auto_13472 ) ( CLEAR ?auto_13471 ) ( not ( = ?auto_13470 ?auto_13472 ) ) ( not ( = ?auto_13471 ?auto_13472 ) ) ( not ( = ?auto_13469 ?auto_13472 ) ) ( SURFACE-AT ?auto_13469 ?auto_13474 ) ( CLEAR ?auto_13469 ) ( IS-CRATE ?auto_13470 ) ( AVAILABLE ?auto_13476 ) ( IN ?auto_13470 ?auto_13477 ) ( TRUCK-AT ?auto_13477 ?auto_13475 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13470 ?auto_13471 )
      ( MAKE-2CRATE-VERIFY ?auto_13469 ?auto_13470 ?auto_13471 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13478 - SURFACE
      ?auto_13479 - SURFACE
      ?auto_13480 - SURFACE
      ?auto_13481 - SURFACE
    )
    :vars
    (
      ?auto_13486 - HOIST
      ?auto_13482 - PLACE
      ?auto_13483 - PLACE
      ?auto_13484 - HOIST
      ?auto_13487 - SURFACE
      ?auto_13485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13486 ?auto_13482 ) ( IS-CRATE ?auto_13481 ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( not ( = ?auto_13479 ?auto_13480 ) ) ( not ( = ?auto_13479 ?auto_13481 ) ) ( not ( = ?auto_13483 ?auto_13482 ) ) ( HOIST-AT ?auto_13484 ?auto_13483 ) ( not ( = ?auto_13486 ?auto_13484 ) ) ( AVAILABLE ?auto_13484 ) ( SURFACE-AT ?auto_13481 ?auto_13483 ) ( ON ?auto_13481 ?auto_13487 ) ( CLEAR ?auto_13481 ) ( not ( = ?auto_13480 ?auto_13487 ) ) ( not ( = ?auto_13481 ?auto_13487 ) ) ( not ( = ?auto_13479 ?auto_13487 ) ) ( SURFACE-AT ?auto_13479 ?auto_13482 ) ( CLEAR ?auto_13479 ) ( IS-CRATE ?auto_13480 ) ( AVAILABLE ?auto_13486 ) ( IN ?auto_13480 ?auto_13485 ) ( TRUCK-AT ?auto_13485 ?auto_13483 ) ( ON ?auto_13479 ?auto_13478 ) ( not ( = ?auto_13478 ?auto_13479 ) ) ( not ( = ?auto_13478 ?auto_13480 ) ) ( not ( = ?auto_13478 ?auto_13481 ) ) ( not ( = ?auto_13478 ?auto_13487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13479 ?auto_13480 ?auto_13481 )
      ( MAKE-3CRATE-VERIFY ?auto_13478 ?auto_13479 ?auto_13480 ?auto_13481 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13488 - SURFACE
      ?auto_13489 - SURFACE
      ?auto_13490 - SURFACE
      ?auto_13491 - SURFACE
      ?auto_13492 - SURFACE
    )
    :vars
    (
      ?auto_13497 - HOIST
      ?auto_13493 - PLACE
      ?auto_13494 - PLACE
      ?auto_13495 - HOIST
      ?auto_13498 - SURFACE
      ?auto_13496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13497 ?auto_13493 ) ( IS-CRATE ?auto_13492 ) ( not ( = ?auto_13491 ?auto_13492 ) ) ( not ( = ?auto_13490 ?auto_13491 ) ) ( not ( = ?auto_13490 ?auto_13492 ) ) ( not ( = ?auto_13494 ?auto_13493 ) ) ( HOIST-AT ?auto_13495 ?auto_13494 ) ( not ( = ?auto_13497 ?auto_13495 ) ) ( AVAILABLE ?auto_13495 ) ( SURFACE-AT ?auto_13492 ?auto_13494 ) ( ON ?auto_13492 ?auto_13498 ) ( CLEAR ?auto_13492 ) ( not ( = ?auto_13491 ?auto_13498 ) ) ( not ( = ?auto_13492 ?auto_13498 ) ) ( not ( = ?auto_13490 ?auto_13498 ) ) ( SURFACE-AT ?auto_13490 ?auto_13493 ) ( CLEAR ?auto_13490 ) ( IS-CRATE ?auto_13491 ) ( AVAILABLE ?auto_13497 ) ( IN ?auto_13491 ?auto_13496 ) ( TRUCK-AT ?auto_13496 ?auto_13494 ) ( ON ?auto_13489 ?auto_13488 ) ( ON ?auto_13490 ?auto_13489 ) ( not ( = ?auto_13488 ?auto_13489 ) ) ( not ( = ?auto_13488 ?auto_13490 ) ) ( not ( = ?auto_13488 ?auto_13491 ) ) ( not ( = ?auto_13488 ?auto_13492 ) ) ( not ( = ?auto_13488 ?auto_13498 ) ) ( not ( = ?auto_13489 ?auto_13490 ) ) ( not ( = ?auto_13489 ?auto_13491 ) ) ( not ( = ?auto_13489 ?auto_13492 ) ) ( not ( = ?auto_13489 ?auto_13498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13490 ?auto_13491 ?auto_13492 )
      ( MAKE-4CRATE-VERIFY ?auto_13488 ?auto_13489 ?auto_13490 ?auto_13491 ?auto_13492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13499 - SURFACE
      ?auto_13500 - SURFACE
    )
    :vars
    (
      ?auto_13506 - HOIST
      ?auto_13501 - PLACE
      ?auto_13503 - SURFACE
      ?auto_13502 - PLACE
      ?auto_13504 - HOIST
      ?auto_13507 - SURFACE
      ?auto_13505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13506 ?auto_13501 ) ( IS-CRATE ?auto_13500 ) ( not ( = ?auto_13499 ?auto_13500 ) ) ( not ( = ?auto_13503 ?auto_13499 ) ) ( not ( = ?auto_13503 ?auto_13500 ) ) ( not ( = ?auto_13502 ?auto_13501 ) ) ( HOIST-AT ?auto_13504 ?auto_13502 ) ( not ( = ?auto_13506 ?auto_13504 ) ) ( SURFACE-AT ?auto_13500 ?auto_13502 ) ( ON ?auto_13500 ?auto_13507 ) ( CLEAR ?auto_13500 ) ( not ( = ?auto_13499 ?auto_13507 ) ) ( not ( = ?auto_13500 ?auto_13507 ) ) ( not ( = ?auto_13503 ?auto_13507 ) ) ( SURFACE-AT ?auto_13503 ?auto_13501 ) ( CLEAR ?auto_13503 ) ( IS-CRATE ?auto_13499 ) ( AVAILABLE ?auto_13506 ) ( TRUCK-AT ?auto_13505 ?auto_13502 ) ( LIFTING ?auto_13504 ?auto_13499 ) )
    :subtasks
    ( ( !LOAD ?auto_13504 ?auto_13499 ?auto_13505 ?auto_13502 )
      ( MAKE-2CRATE ?auto_13503 ?auto_13499 ?auto_13500 )
      ( MAKE-1CRATE-VERIFY ?auto_13499 ?auto_13500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13508 - SURFACE
      ?auto_13509 - SURFACE
      ?auto_13510 - SURFACE
    )
    :vars
    (
      ?auto_13516 - HOIST
      ?auto_13513 - PLACE
      ?auto_13511 - PLACE
      ?auto_13515 - HOIST
      ?auto_13514 - SURFACE
      ?auto_13512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13516 ?auto_13513 ) ( IS-CRATE ?auto_13510 ) ( not ( = ?auto_13509 ?auto_13510 ) ) ( not ( = ?auto_13508 ?auto_13509 ) ) ( not ( = ?auto_13508 ?auto_13510 ) ) ( not ( = ?auto_13511 ?auto_13513 ) ) ( HOIST-AT ?auto_13515 ?auto_13511 ) ( not ( = ?auto_13516 ?auto_13515 ) ) ( SURFACE-AT ?auto_13510 ?auto_13511 ) ( ON ?auto_13510 ?auto_13514 ) ( CLEAR ?auto_13510 ) ( not ( = ?auto_13509 ?auto_13514 ) ) ( not ( = ?auto_13510 ?auto_13514 ) ) ( not ( = ?auto_13508 ?auto_13514 ) ) ( SURFACE-AT ?auto_13508 ?auto_13513 ) ( CLEAR ?auto_13508 ) ( IS-CRATE ?auto_13509 ) ( AVAILABLE ?auto_13516 ) ( TRUCK-AT ?auto_13512 ?auto_13511 ) ( LIFTING ?auto_13515 ?auto_13509 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13509 ?auto_13510 )
      ( MAKE-2CRATE-VERIFY ?auto_13508 ?auto_13509 ?auto_13510 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13517 - SURFACE
      ?auto_13518 - SURFACE
      ?auto_13519 - SURFACE
      ?auto_13520 - SURFACE
    )
    :vars
    (
      ?auto_13521 - HOIST
      ?auto_13524 - PLACE
      ?auto_13526 - PLACE
      ?auto_13523 - HOIST
      ?auto_13525 - SURFACE
      ?auto_13522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13521 ?auto_13524 ) ( IS-CRATE ?auto_13520 ) ( not ( = ?auto_13519 ?auto_13520 ) ) ( not ( = ?auto_13518 ?auto_13519 ) ) ( not ( = ?auto_13518 ?auto_13520 ) ) ( not ( = ?auto_13526 ?auto_13524 ) ) ( HOIST-AT ?auto_13523 ?auto_13526 ) ( not ( = ?auto_13521 ?auto_13523 ) ) ( SURFACE-AT ?auto_13520 ?auto_13526 ) ( ON ?auto_13520 ?auto_13525 ) ( CLEAR ?auto_13520 ) ( not ( = ?auto_13519 ?auto_13525 ) ) ( not ( = ?auto_13520 ?auto_13525 ) ) ( not ( = ?auto_13518 ?auto_13525 ) ) ( SURFACE-AT ?auto_13518 ?auto_13524 ) ( CLEAR ?auto_13518 ) ( IS-CRATE ?auto_13519 ) ( AVAILABLE ?auto_13521 ) ( TRUCK-AT ?auto_13522 ?auto_13526 ) ( LIFTING ?auto_13523 ?auto_13519 ) ( ON ?auto_13518 ?auto_13517 ) ( not ( = ?auto_13517 ?auto_13518 ) ) ( not ( = ?auto_13517 ?auto_13519 ) ) ( not ( = ?auto_13517 ?auto_13520 ) ) ( not ( = ?auto_13517 ?auto_13525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13518 ?auto_13519 ?auto_13520 )
      ( MAKE-3CRATE-VERIFY ?auto_13517 ?auto_13518 ?auto_13519 ?auto_13520 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13527 - SURFACE
      ?auto_13528 - SURFACE
      ?auto_13529 - SURFACE
      ?auto_13530 - SURFACE
      ?auto_13531 - SURFACE
    )
    :vars
    (
      ?auto_13532 - HOIST
      ?auto_13535 - PLACE
      ?auto_13537 - PLACE
      ?auto_13534 - HOIST
      ?auto_13536 - SURFACE
      ?auto_13533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13532 ?auto_13535 ) ( IS-CRATE ?auto_13531 ) ( not ( = ?auto_13530 ?auto_13531 ) ) ( not ( = ?auto_13529 ?auto_13530 ) ) ( not ( = ?auto_13529 ?auto_13531 ) ) ( not ( = ?auto_13537 ?auto_13535 ) ) ( HOIST-AT ?auto_13534 ?auto_13537 ) ( not ( = ?auto_13532 ?auto_13534 ) ) ( SURFACE-AT ?auto_13531 ?auto_13537 ) ( ON ?auto_13531 ?auto_13536 ) ( CLEAR ?auto_13531 ) ( not ( = ?auto_13530 ?auto_13536 ) ) ( not ( = ?auto_13531 ?auto_13536 ) ) ( not ( = ?auto_13529 ?auto_13536 ) ) ( SURFACE-AT ?auto_13529 ?auto_13535 ) ( CLEAR ?auto_13529 ) ( IS-CRATE ?auto_13530 ) ( AVAILABLE ?auto_13532 ) ( TRUCK-AT ?auto_13533 ?auto_13537 ) ( LIFTING ?auto_13534 ?auto_13530 ) ( ON ?auto_13528 ?auto_13527 ) ( ON ?auto_13529 ?auto_13528 ) ( not ( = ?auto_13527 ?auto_13528 ) ) ( not ( = ?auto_13527 ?auto_13529 ) ) ( not ( = ?auto_13527 ?auto_13530 ) ) ( not ( = ?auto_13527 ?auto_13531 ) ) ( not ( = ?auto_13527 ?auto_13536 ) ) ( not ( = ?auto_13528 ?auto_13529 ) ) ( not ( = ?auto_13528 ?auto_13530 ) ) ( not ( = ?auto_13528 ?auto_13531 ) ) ( not ( = ?auto_13528 ?auto_13536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13529 ?auto_13530 ?auto_13531 )
      ( MAKE-4CRATE-VERIFY ?auto_13527 ?auto_13528 ?auto_13529 ?auto_13530 ?auto_13531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13538 - SURFACE
      ?auto_13539 - SURFACE
    )
    :vars
    (
      ?auto_13540 - HOIST
      ?auto_13543 - PLACE
      ?auto_13545 - SURFACE
      ?auto_13546 - PLACE
      ?auto_13542 - HOIST
      ?auto_13544 - SURFACE
      ?auto_13541 - TRUCK
      ?auto_13547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13540 ?auto_13543 ) ( IS-CRATE ?auto_13539 ) ( not ( = ?auto_13538 ?auto_13539 ) ) ( not ( = ?auto_13545 ?auto_13538 ) ) ( not ( = ?auto_13545 ?auto_13539 ) ) ( not ( = ?auto_13546 ?auto_13543 ) ) ( HOIST-AT ?auto_13542 ?auto_13546 ) ( not ( = ?auto_13540 ?auto_13542 ) ) ( SURFACE-AT ?auto_13539 ?auto_13546 ) ( ON ?auto_13539 ?auto_13544 ) ( CLEAR ?auto_13539 ) ( not ( = ?auto_13538 ?auto_13544 ) ) ( not ( = ?auto_13539 ?auto_13544 ) ) ( not ( = ?auto_13545 ?auto_13544 ) ) ( SURFACE-AT ?auto_13545 ?auto_13543 ) ( CLEAR ?auto_13545 ) ( IS-CRATE ?auto_13538 ) ( AVAILABLE ?auto_13540 ) ( TRUCK-AT ?auto_13541 ?auto_13546 ) ( AVAILABLE ?auto_13542 ) ( SURFACE-AT ?auto_13538 ?auto_13546 ) ( ON ?auto_13538 ?auto_13547 ) ( CLEAR ?auto_13538 ) ( not ( = ?auto_13538 ?auto_13547 ) ) ( not ( = ?auto_13539 ?auto_13547 ) ) ( not ( = ?auto_13545 ?auto_13547 ) ) ( not ( = ?auto_13544 ?auto_13547 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13542 ?auto_13538 ?auto_13547 ?auto_13546 )
      ( MAKE-2CRATE ?auto_13545 ?auto_13538 ?auto_13539 )
      ( MAKE-1CRATE-VERIFY ?auto_13538 ?auto_13539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13548 - SURFACE
      ?auto_13549 - SURFACE
      ?auto_13550 - SURFACE
    )
    :vars
    (
      ?auto_13555 - HOIST
      ?auto_13554 - PLACE
      ?auto_13556 - PLACE
      ?auto_13551 - HOIST
      ?auto_13557 - SURFACE
      ?auto_13552 - TRUCK
      ?auto_13553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13555 ?auto_13554 ) ( IS-CRATE ?auto_13550 ) ( not ( = ?auto_13549 ?auto_13550 ) ) ( not ( = ?auto_13548 ?auto_13549 ) ) ( not ( = ?auto_13548 ?auto_13550 ) ) ( not ( = ?auto_13556 ?auto_13554 ) ) ( HOIST-AT ?auto_13551 ?auto_13556 ) ( not ( = ?auto_13555 ?auto_13551 ) ) ( SURFACE-AT ?auto_13550 ?auto_13556 ) ( ON ?auto_13550 ?auto_13557 ) ( CLEAR ?auto_13550 ) ( not ( = ?auto_13549 ?auto_13557 ) ) ( not ( = ?auto_13550 ?auto_13557 ) ) ( not ( = ?auto_13548 ?auto_13557 ) ) ( SURFACE-AT ?auto_13548 ?auto_13554 ) ( CLEAR ?auto_13548 ) ( IS-CRATE ?auto_13549 ) ( AVAILABLE ?auto_13555 ) ( TRUCK-AT ?auto_13552 ?auto_13556 ) ( AVAILABLE ?auto_13551 ) ( SURFACE-AT ?auto_13549 ?auto_13556 ) ( ON ?auto_13549 ?auto_13553 ) ( CLEAR ?auto_13549 ) ( not ( = ?auto_13549 ?auto_13553 ) ) ( not ( = ?auto_13550 ?auto_13553 ) ) ( not ( = ?auto_13548 ?auto_13553 ) ) ( not ( = ?auto_13557 ?auto_13553 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13549 ?auto_13550 )
      ( MAKE-2CRATE-VERIFY ?auto_13548 ?auto_13549 ?auto_13550 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13558 - SURFACE
      ?auto_13559 - SURFACE
      ?auto_13560 - SURFACE
      ?auto_13561 - SURFACE
    )
    :vars
    (
      ?auto_13566 - HOIST
      ?auto_13564 - PLACE
      ?auto_13568 - PLACE
      ?auto_13562 - HOIST
      ?auto_13567 - SURFACE
      ?auto_13565 - TRUCK
      ?auto_13563 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13566 ?auto_13564 ) ( IS-CRATE ?auto_13561 ) ( not ( = ?auto_13560 ?auto_13561 ) ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( not ( = ?auto_13559 ?auto_13561 ) ) ( not ( = ?auto_13568 ?auto_13564 ) ) ( HOIST-AT ?auto_13562 ?auto_13568 ) ( not ( = ?auto_13566 ?auto_13562 ) ) ( SURFACE-AT ?auto_13561 ?auto_13568 ) ( ON ?auto_13561 ?auto_13567 ) ( CLEAR ?auto_13561 ) ( not ( = ?auto_13560 ?auto_13567 ) ) ( not ( = ?auto_13561 ?auto_13567 ) ) ( not ( = ?auto_13559 ?auto_13567 ) ) ( SURFACE-AT ?auto_13559 ?auto_13564 ) ( CLEAR ?auto_13559 ) ( IS-CRATE ?auto_13560 ) ( AVAILABLE ?auto_13566 ) ( TRUCK-AT ?auto_13565 ?auto_13568 ) ( AVAILABLE ?auto_13562 ) ( SURFACE-AT ?auto_13560 ?auto_13568 ) ( ON ?auto_13560 ?auto_13563 ) ( CLEAR ?auto_13560 ) ( not ( = ?auto_13560 ?auto_13563 ) ) ( not ( = ?auto_13561 ?auto_13563 ) ) ( not ( = ?auto_13559 ?auto_13563 ) ) ( not ( = ?auto_13567 ?auto_13563 ) ) ( ON ?auto_13559 ?auto_13558 ) ( not ( = ?auto_13558 ?auto_13559 ) ) ( not ( = ?auto_13558 ?auto_13560 ) ) ( not ( = ?auto_13558 ?auto_13561 ) ) ( not ( = ?auto_13558 ?auto_13567 ) ) ( not ( = ?auto_13558 ?auto_13563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13559 ?auto_13560 ?auto_13561 )
      ( MAKE-3CRATE-VERIFY ?auto_13558 ?auto_13559 ?auto_13560 ?auto_13561 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13569 - SURFACE
      ?auto_13570 - SURFACE
      ?auto_13571 - SURFACE
      ?auto_13572 - SURFACE
      ?auto_13573 - SURFACE
    )
    :vars
    (
      ?auto_13578 - HOIST
      ?auto_13576 - PLACE
      ?auto_13580 - PLACE
      ?auto_13574 - HOIST
      ?auto_13579 - SURFACE
      ?auto_13577 - TRUCK
      ?auto_13575 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13578 ?auto_13576 ) ( IS-CRATE ?auto_13573 ) ( not ( = ?auto_13572 ?auto_13573 ) ) ( not ( = ?auto_13571 ?auto_13572 ) ) ( not ( = ?auto_13571 ?auto_13573 ) ) ( not ( = ?auto_13580 ?auto_13576 ) ) ( HOIST-AT ?auto_13574 ?auto_13580 ) ( not ( = ?auto_13578 ?auto_13574 ) ) ( SURFACE-AT ?auto_13573 ?auto_13580 ) ( ON ?auto_13573 ?auto_13579 ) ( CLEAR ?auto_13573 ) ( not ( = ?auto_13572 ?auto_13579 ) ) ( not ( = ?auto_13573 ?auto_13579 ) ) ( not ( = ?auto_13571 ?auto_13579 ) ) ( SURFACE-AT ?auto_13571 ?auto_13576 ) ( CLEAR ?auto_13571 ) ( IS-CRATE ?auto_13572 ) ( AVAILABLE ?auto_13578 ) ( TRUCK-AT ?auto_13577 ?auto_13580 ) ( AVAILABLE ?auto_13574 ) ( SURFACE-AT ?auto_13572 ?auto_13580 ) ( ON ?auto_13572 ?auto_13575 ) ( CLEAR ?auto_13572 ) ( not ( = ?auto_13572 ?auto_13575 ) ) ( not ( = ?auto_13573 ?auto_13575 ) ) ( not ( = ?auto_13571 ?auto_13575 ) ) ( not ( = ?auto_13579 ?auto_13575 ) ) ( ON ?auto_13570 ?auto_13569 ) ( ON ?auto_13571 ?auto_13570 ) ( not ( = ?auto_13569 ?auto_13570 ) ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( not ( = ?auto_13569 ?auto_13572 ) ) ( not ( = ?auto_13569 ?auto_13573 ) ) ( not ( = ?auto_13569 ?auto_13579 ) ) ( not ( = ?auto_13569 ?auto_13575 ) ) ( not ( = ?auto_13570 ?auto_13571 ) ) ( not ( = ?auto_13570 ?auto_13572 ) ) ( not ( = ?auto_13570 ?auto_13573 ) ) ( not ( = ?auto_13570 ?auto_13579 ) ) ( not ( = ?auto_13570 ?auto_13575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13571 ?auto_13572 ?auto_13573 )
      ( MAKE-4CRATE-VERIFY ?auto_13569 ?auto_13570 ?auto_13571 ?auto_13572 ?auto_13573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13581 - SURFACE
      ?auto_13582 - SURFACE
    )
    :vars
    (
      ?auto_13587 - HOIST
      ?auto_13585 - PLACE
      ?auto_13590 - SURFACE
      ?auto_13589 - PLACE
      ?auto_13583 - HOIST
      ?auto_13588 - SURFACE
      ?auto_13584 - SURFACE
      ?auto_13586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13587 ?auto_13585 ) ( IS-CRATE ?auto_13582 ) ( not ( = ?auto_13581 ?auto_13582 ) ) ( not ( = ?auto_13590 ?auto_13581 ) ) ( not ( = ?auto_13590 ?auto_13582 ) ) ( not ( = ?auto_13589 ?auto_13585 ) ) ( HOIST-AT ?auto_13583 ?auto_13589 ) ( not ( = ?auto_13587 ?auto_13583 ) ) ( SURFACE-AT ?auto_13582 ?auto_13589 ) ( ON ?auto_13582 ?auto_13588 ) ( CLEAR ?auto_13582 ) ( not ( = ?auto_13581 ?auto_13588 ) ) ( not ( = ?auto_13582 ?auto_13588 ) ) ( not ( = ?auto_13590 ?auto_13588 ) ) ( SURFACE-AT ?auto_13590 ?auto_13585 ) ( CLEAR ?auto_13590 ) ( IS-CRATE ?auto_13581 ) ( AVAILABLE ?auto_13587 ) ( AVAILABLE ?auto_13583 ) ( SURFACE-AT ?auto_13581 ?auto_13589 ) ( ON ?auto_13581 ?auto_13584 ) ( CLEAR ?auto_13581 ) ( not ( = ?auto_13581 ?auto_13584 ) ) ( not ( = ?auto_13582 ?auto_13584 ) ) ( not ( = ?auto_13590 ?auto_13584 ) ) ( not ( = ?auto_13588 ?auto_13584 ) ) ( TRUCK-AT ?auto_13586 ?auto_13585 ) )
    :subtasks
    ( ( !DRIVE ?auto_13586 ?auto_13585 ?auto_13589 )
      ( MAKE-2CRATE ?auto_13590 ?auto_13581 ?auto_13582 )
      ( MAKE-1CRATE-VERIFY ?auto_13581 ?auto_13582 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13591 - SURFACE
      ?auto_13592 - SURFACE
      ?auto_13593 - SURFACE
    )
    :vars
    (
      ?auto_13596 - HOIST
      ?auto_13597 - PLACE
      ?auto_13599 - PLACE
      ?auto_13595 - HOIST
      ?auto_13594 - SURFACE
      ?auto_13600 - SURFACE
      ?auto_13598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13596 ?auto_13597 ) ( IS-CRATE ?auto_13593 ) ( not ( = ?auto_13592 ?auto_13593 ) ) ( not ( = ?auto_13591 ?auto_13592 ) ) ( not ( = ?auto_13591 ?auto_13593 ) ) ( not ( = ?auto_13599 ?auto_13597 ) ) ( HOIST-AT ?auto_13595 ?auto_13599 ) ( not ( = ?auto_13596 ?auto_13595 ) ) ( SURFACE-AT ?auto_13593 ?auto_13599 ) ( ON ?auto_13593 ?auto_13594 ) ( CLEAR ?auto_13593 ) ( not ( = ?auto_13592 ?auto_13594 ) ) ( not ( = ?auto_13593 ?auto_13594 ) ) ( not ( = ?auto_13591 ?auto_13594 ) ) ( SURFACE-AT ?auto_13591 ?auto_13597 ) ( CLEAR ?auto_13591 ) ( IS-CRATE ?auto_13592 ) ( AVAILABLE ?auto_13596 ) ( AVAILABLE ?auto_13595 ) ( SURFACE-AT ?auto_13592 ?auto_13599 ) ( ON ?auto_13592 ?auto_13600 ) ( CLEAR ?auto_13592 ) ( not ( = ?auto_13592 ?auto_13600 ) ) ( not ( = ?auto_13593 ?auto_13600 ) ) ( not ( = ?auto_13591 ?auto_13600 ) ) ( not ( = ?auto_13594 ?auto_13600 ) ) ( TRUCK-AT ?auto_13598 ?auto_13597 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13592 ?auto_13593 )
      ( MAKE-2CRATE-VERIFY ?auto_13591 ?auto_13592 ?auto_13593 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13601 - SURFACE
      ?auto_13602 - SURFACE
      ?auto_13603 - SURFACE
      ?auto_13604 - SURFACE
    )
    :vars
    (
      ?auto_13609 - HOIST
      ?auto_13608 - PLACE
      ?auto_13606 - PLACE
      ?auto_13611 - HOIST
      ?auto_13607 - SURFACE
      ?auto_13605 - SURFACE
      ?auto_13610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13609 ?auto_13608 ) ( IS-CRATE ?auto_13604 ) ( not ( = ?auto_13603 ?auto_13604 ) ) ( not ( = ?auto_13602 ?auto_13603 ) ) ( not ( = ?auto_13602 ?auto_13604 ) ) ( not ( = ?auto_13606 ?auto_13608 ) ) ( HOIST-AT ?auto_13611 ?auto_13606 ) ( not ( = ?auto_13609 ?auto_13611 ) ) ( SURFACE-AT ?auto_13604 ?auto_13606 ) ( ON ?auto_13604 ?auto_13607 ) ( CLEAR ?auto_13604 ) ( not ( = ?auto_13603 ?auto_13607 ) ) ( not ( = ?auto_13604 ?auto_13607 ) ) ( not ( = ?auto_13602 ?auto_13607 ) ) ( SURFACE-AT ?auto_13602 ?auto_13608 ) ( CLEAR ?auto_13602 ) ( IS-CRATE ?auto_13603 ) ( AVAILABLE ?auto_13609 ) ( AVAILABLE ?auto_13611 ) ( SURFACE-AT ?auto_13603 ?auto_13606 ) ( ON ?auto_13603 ?auto_13605 ) ( CLEAR ?auto_13603 ) ( not ( = ?auto_13603 ?auto_13605 ) ) ( not ( = ?auto_13604 ?auto_13605 ) ) ( not ( = ?auto_13602 ?auto_13605 ) ) ( not ( = ?auto_13607 ?auto_13605 ) ) ( TRUCK-AT ?auto_13610 ?auto_13608 ) ( ON ?auto_13602 ?auto_13601 ) ( not ( = ?auto_13601 ?auto_13602 ) ) ( not ( = ?auto_13601 ?auto_13603 ) ) ( not ( = ?auto_13601 ?auto_13604 ) ) ( not ( = ?auto_13601 ?auto_13607 ) ) ( not ( = ?auto_13601 ?auto_13605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13602 ?auto_13603 ?auto_13604 )
      ( MAKE-3CRATE-VERIFY ?auto_13601 ?auto_13602 ?auto_13603 ?auto_13604 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13612 - SURFACE
      ?auto_13613 - SURFACE
      ?auto_13614 - SURFACE
      ?auto_13615 - SURFACE
      ?auto_13616 - SURFACE
    )
    :vars
    (
      ?auto_13621 - HOIST
      ?auto_13620 - PLACE
      ?auto_13618 - PLACE
      ?auto_13623 - HOIST
      ?auto_13619 - SURFACE
      ?auto_13617 - SURFACE
      ?auto_13622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13621 ?auto_13620 ) ( IS-CRATE ?auto_13616 ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( not ( = ?auto_13614 ?auto_13615 ) ) ( not ( = ?auto_13614 ?auto_13616 ) ) ( not ( = ?auto_13618 ?auto_13620 ) ) ( HOIST-AT ?auto_13623 ?auto_13618 ) ( not ( = ?auto_13621 ?auto_13623 ) ) ( SURFACE-AT ?auto_13616 ?auto_13618 ) ( ON ?auto_13616 ?auto_13619 ) ( CLEAR ?auto_13616 ) ( not ( = ?auto_13615 ?auto_13619 ) ) ( not ( = ?auto_13616 ?auto_13619 ) ) ( not ( = ?auto_13614 ?auto_13619 ) ) ( SURFACE-AT ?auto_13614 ?auto_13620 ) ( CLEAR ?auto_13614 ) ( IS-CRATE ?auto_13615 ) ( AVAILABLE ?auto_13621 ) ( AVAILABLE ?auto_13623 ) ( SURFACE-AT ?auto_13615 ?auto_13618 ) ( ON ?auto_13615 ?auto_13617 ) ( CLEAR ?auto_13615 ) ( not ( = ?auto_13615 ?auto_13617 ) ) ( not ( = ?auto_13616 ?auto_13617 ) ) ( not ( = ?auto_13614 ?auto_13617 ) ) ( not ( = ?auto_13619 ?auto_13617 ) ) ( TRUCK-AT ?auto_13622 ?auto_13620 ) ( ON ?auto_13613 ?auto_13612 ) ( ON ?auto_13614 ?auto_13613 ) ( not ( = ?auto_13612 ?auto_13613 ) ) ( not ( = ?auto_13612 ?auto_13614 ) ) ( not ( = ?auto_13612 ?auto_13615 ) ) ( not ( = ?auto_13612 ?auto_13616 ) ) ( not ( = ?auto_13612 ?auto_13619 ) ) ( not ( = ?auto_13612 ?auto_13617 ) ) ( not ( = ?auto_13613 ?auto_13614 ) ) ( not ( = ?auto_13613 ?auto_13615 ) ) ( not ( = ?auto_13613 ?auto_13616 ) ) ( not ( = ?auto_13613 ?auto_13619 ) ) ( not ( = ?auto_13613 ?auto_13617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13614 ?auto_13615 ?auto_13616 )
      ( MAKE-4CRATE-VERIFY ?auto_13612 ?auto_13613 ?auto_13614 ?auto_13615 ?auto_13616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13624 - SURFACE
      ?auto_13625 - SURFACE
    )
    :vars
    (
      ?auto_13631 - HOIST
      ?auto_13630 - PLACE
      ?auto_13628 - SURFACE
      ?auto_13627 - PLACE
      ?auto_13633 - HOIST
      ?auto_13629 - SURFACE
      ?auto_13626 - SURFACE
      ?auto_13632 - TRUCK
      ?auto_13634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13631 ?auto_13630 ) ( IS-CRATE ?auto_13625 ) ( not ( = ?auto_13624 ?auto_13625 ) ) ( not ( = ?auto_13628 ?auto_13624 ) ) ( not ( = ?auto_13628 ?auto_13625 ) ) ( not ( = ?auto_13627 ?auto_13630 ) ) ( HOIST-AT ?auto_13633 ?auto_13627 ) ( not ( = ?auto_13631 ?auto_13633 ) ) ( SURFACE-AT ?auto_13625 ?auto_13627 ) ( ON ?auto_13625 ?auto_13629 ) ( CLEAR ?auto_13625 ) ( not ( = ?auto_13624 ?auto_13629 ) ) ( not ( = ?auto_13625 ?auto_13629 ) ) ( not ( = ?auto_13628 ?auto_13629 ) ) ( IS-CRATE ?auto_13624 ) ( AVAILABLE ?auto_13633 ) ( SURFACE-AT ?auto_13624 ?auto_13627 ) ( ON ?auto_13624 ?auto_13626 ) ( CLEAR ?auto_13624 ) ( not ( = ?auto_13624 ?auto_13626 ) ) ( not ( = ?auto_13625 ?auto_13626 ) ) ( not ( = ?auto_13628 ?auto_13626 ) ) ( not ( = ?auto_13629 ?auto_13626 ) ) ( TRUCK-AT ?auto_13632 ?auto_13630 ) ( SURFACE-AT ?auto_13634 ?auto_13630 ) ( CLEAR ?auto_13634 ) ( LIFTING ?auto_13631 ?auto_13628 ) ( IS-CRATE ?auto_13628 ) ( not ( = ?auto_13634 ?auto_13628 ) ) ( not ( = ?auto_13624 ?auto_13634 ) ) ( not ( = ?auto_13625 ?auto_13634 ) ) ( not ( = ?auto_13629 ?auto_13634 ) ) ( not ( = ?auto_13626 ?auto_13634 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13634 ?auto_13628 )
      ( MAKE-2CRATE ?auto_13628 ?auto_13624 ?auto_13625 )
      ( MAKE-1CRATE-VERIFY ?auto_13624 ?auto_13625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13635 - SURFACE
      ?auto_13636 - SURFACE
      ?auto_13637 - SURFACE
    )
    :vars
    (
      ?auto_13645 - HOIST
      ?auto_13641 - PLACE
      ?auto_13644 - PLACE
      ?auto_13643 - HOIST
      ?auto_13642 - SURFACE
      ?auto_13638 - SURFACE
      ?auto_13639 - TRUCK
      ?auto_13640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13645 ?auto_13641 ) ( IS-CRATE ?auto_13637 ) ( not ( = ?auto_13636 ?auto_13637 ) ) ( not ( = ?auto_13635 ?auto_13636 ) ) ( not ( = ?auto_13635 ?auto_13637 ) ) ( not ( = ?auto_13644 ?auto_13641 ) ) ( HOIST-AT ?auto_13643 ?auto_13644 ) ( not ( = ?auto_13645 ?auto_13643 ) ) ( SURFACE-AT ?auto_13637 ?auto_13644 ) ( ON ?auto_13637 ?auto_13642 ) ( CLEAR ?auto_13637 ) ( not ( = ?auto_13636 ?auto_13642 ) ) ( not ( = ?auto_13637 ?auto_13642 ) ) ( not ( = ?auto_13635 ?auto_13642 ) ) ( IS-CRATE ?auto_13636 ) ( AVAILABLE ?auto_13643 ) ( SURFACE-AT ?auto_13636 ?auto_13644 ) ( ON ?auto_13636 ?auto_13638 ) ( CLEAR ?auto_13636 ) ( not ( = ?auto_13636 ?auto_13638 ) ) ( not ( = ?auto_13637 ?auto_13638 ) ) ( not ( = ?auto_13635 ?auto_13638 ) ) ( not ( = ?auto_13642 ?auto_13638 ) ) ( TRUCK-AT ?auto_13639 ?auto_13641 ) ( SURFACE-AT ?auto_13640 ?auto_13641 ) ( CLEAR ?auto_13640 ) ( LIFTING ?auto_13645 ?auto_13635 ) ( IS-CRATE ?auto_13635 ) ( not ( = ?auto_13640 ?auto_13635 ) ) ( not ( = ?auto_13636 ?auto_13640 ) ) ( not ( = ?auto_13637 ?auto_13640 ) ) ( not ( = ?auto_13642 ?auto_13640 ) ) ( not ( = ?auto_13638 ?auto_13640 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13636 ?auto_13637 )
      ( MAKE-2CRATE-VERIFY ?auto_13635 ?auto_13636 ?auto_13637 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13646 - SURFACE
      ?auto_13647 - SURFACE
      ?auto_13648 - SURFACE
      ?auto_13649 - SURFACE
    )
    :vars
    (
      ?auto_13656 - HOIST
      ?auto_13655 - PLACE
      ?auto_13652 - PLACE
      ?auto_13653 - HOIST
      ?auto_13651 - SURFACE
      ?auto_13654 - SURFACE
      ?auto_13650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13656 ?auto_13655 ) ( IS-CRATE ?auto_13649 ) ( not ( = ?auto_13648 ?auto_13649 ) ) ( not ( = ?auto_13647 ?auto_13648 ) ) ( not ( = ?auto_13647 ?auto_13649 ) ) ( not ( = ?auto_13652 ?auto_13655 ) ) ( HOIST-AT ?auto_13653 ?auto_13652 ) ( not ( = ?auto_13656 ?auto_13653 ) ) ( SURFACE-AT ?auto_13649 ?auto_13652 ) ( ON ?auto_13649 ?auto_13651 ) ( CLEAR ?auto_13649 ) ( not ( = ?auto_13648 ?auto_13651 ) ) ( not ( = ?auto_13649 ?auto_13651 ) ) ( not ( = ?auto_13647 ?auto_13651 ) ) ( IS-CRATE ?auto_13648 ) ( AVAILABLE ?auto_13653 ) ( SURFACE-AT ?auto_13648 ?auto_13652 ) ( ON ?auto_13648 ?auto_13654 ) ( CLEAR ?auto_13648 ) ( not ( = ?auto_13648 ?auto_13654 ) ) ( not ( = ?auto_13649 ?auto_13654 ) ) ( not ( = ?auto_13647 ?auto_13654 ) ) ( not ( = ?auto_13651 ?auto_13654 ) ) ( TRUCK-AT ?auto_13650 ?auto_13655 ) ( SURFACE-AT ?auto_13646 ?auto_13655 ) ( CLEAR ?auto_13646 ) ( LIFTING ?auto_13656 ?auto_13647 ) ( IS-CRATE ?auto_13647 ) ( not ( = ?auto_13646 ?auto_13647 ) ) ( not ( = ?auto_13648 ?auto_13646 ) ) ( not ( = ?auto_13649 ?auto_13646 ) ) ( not ( = ?auto_13651 ?auto_13646 ) ) ( not ( = ?auto_13654 ?auto_13646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13647 ?auto_13648 ?auto_13649 )
      ( MAKE-3CRATE-VERIFY ?auto_13646 ?auto_13647 ?auto_13648 ?auto_13649 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13657 - SURFACE
      ?auto_13658 - SURFACE
      ?auto_13659 - SURFACE
      ?auto_13660 - SURFACE
      ?auto_13661 - SURFACE
    )
    :vars
    (
      ?auto_13668 - HOIST
      ?auto_13667 - PLACE
      ?auto_13664 - PLACE
      ?auto_13665 - HOIST
      ?auto_13663 - SURFACE
      ?auto_13666 - SURFACE
      ?auto_13662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13668 ?auto_13667 ) ( IS-CRATE ?auto_13661 ) ( not ( = ?auto_13660 ?auto_13661 ) ) ( not ( = ?auto_13659 ?auto_13660 ) ) ( not ( = ?auto_13659 ?auto_13661 ) ) ( not ( = ?auto_13664 ?auto_13667 ) ) ( HOIST-AT ?auto_13665 ?auto_13664 ) ( not ( = ?auto_13668 ?auto_13665 ) ) ( SURFACE-AT ?auto_13661 ?auto_13664 ) ( ON ?auto_13661 ?auto_13663 ) ( CLEAR ?auto_13661 ) ( not ( = ?auto_13660 ?auto_13663 ) ) ( not ( = ?auto_13661 ?auto_13663 ) ) ( not ( = ?auto_13659 ?auto_13663 ) ) ( IS-CRATE ?auto_13660 ) ( AVAILABLE ?auto_13665 ) ( SURFACE-AT ?auto_13660 ?auto_13664 ) ( ON ?auto_13660 ?auto_13666 ) ( CLEAR ?auto_13660 ) ( not ( = ?auto_13660 ?auto_13666 ) ) ( not ( = ?auto_13661 ?auto_13666 ) ) ( not ( = ?auto_13659 ?auto_13666 ) ) ( not ( = ?auto_13663 ?auto_13666 ) ) ( TRUCK-AT ?auto_13662 ?auto_13667 ) ( SURFACE-AT ?auto_13658 ?auto_13667 ) ( CLEAR ?auto_13658 ) ( LIFTING ?auto_13668 ?auto_13659 ) ( IS-CRATE ?auto_13659 ) ( not ( = ?auto_13658 ?auto_13659 ) ) ( not ( = ?auto_13660 ?auto_13658 ) ) ( not ( = ?auto_13661 ?auto_13658 ) ) ( not ( = ?auto_13663 ?auto_13658 ) ) ( not ( = ?auto_13666 ?auto_13658 ) ) ( ON ?auto_13658 ?auto_13657 ) ( not ( = ?auto_13657 ?auto_13658 ) ) ( not ( = ?auto_13657 ?auto_13659 ) ) ( not ( = ?auto_13657 ?auto_13660 ) ) ( not ( = ?auto_13657 ?auto_13661 ) ) ( not ( = ?auto_13657 ?auto_13663 ) ) ( not ( = ?auto_13657 ?auto_13666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13659 ?auto_13660 ?auto_13661 )
      ( MAKE-4CRATE-VERIFY ?auto_13657 ?auto_13658 ?auto_13659 ?auto_13660 ?auto_13661 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14104 - SURFACE
      ?auto_14105 - SURFACE
      ?auto_14106 - SURFACE
      ?auto_14107 - SURFACE
      ?auto_14108 - SURFACE
      ?auto_14109 - SURFACE
    )
    :vars
    (
      ?auto_14111 - HOIST
      ?auto_14110 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14111 ?auto_14110 ) ( SURFACE-AT ?auto_14108 ?auto_14110 ) ( CLEAR ?auto_14108 ) ( LIFTING ?auto_14111 ?auto_14109 ) ( IS-CRATE ?auto_14109 ) ( not ( = ?auto_14108 ?auto_14109 ) ) ( ON ?auto_14105 ?auto_14104 ) ( ON ?auto_14106 ?auto_14105 ) ( ON ?auto_14107 ?auto_14106 ) ( ON ?auto_14108 ?auto_14107 ) ( not ( = ?auto_14104 ?auto_14105 ) ) ( not ( = ?auto_14104 ?auto_14106 ) ) ( not ( = ?auto_14104 ?auto_14107 ) ) ( not ( = ?auto_14104 ?auto_14108 ) ) ( not ( = ?auto_14104 ?auto_14109 ) ) ( not ( = ?auto_14105 ?auto_14106 ) ) ( not ( = ?auto_14105 ?auto_14107 ) ) ( not ( = ?auto_14105 ?auto_14108 ) ) ( not ( = ?auto_14105 ?auto_14109 ) ) ( not ( = ?auto_14106 ?auto_14107 ) ) ( not ( = ?auto_14106 ?auto_14108 ) ) ( not ( = ?auto_14106 ?auto_14109 ) ) ( not ( = ?auto_14107 ?auto_14108 ) ) ( not ( = ?auto_14107 ?auto_14109 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_14108 ?auto_14109 )
      ( MAKE-5CRATE-VERIFY ?auto_14104 ?auto_14105 ?auto_14106 ?auto_14107 ?auto_14108 ?auto_14109 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14138 - SURFACE
      ?auto_14139 - SURFACE
      ?auto_14140 - SURFACE
      ?auto_14141 - SURFACE
      ?auto_14142 - SURFACE
      ?auto_14143 - SURFACE
    )
    :vars
    (
      ?auto_14145 - HOIST
      ?auto_14146 - PLACE
      ?auto_14144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14145 ?auto_14146 ) ( SURFACE-AT ?auto_14142 ?auto_14146 ) ( CLEAR ?auto_14142 ) ( IS-CRATE ?auto_14143 ) ( not ( = ?auto_14142 ?auto_14143 ) ) ( TRUCK-AT ?auto_14144 ?auto_14146 ) ( AVAILABLE ?auto_14145 ) ( IN ?auto_14143 ?auto_14144 ) ( ON ?auto_14142 ?auto_14141 ) ( not ( = ?auto_14141 ?auto_14142 ) ) ( not ( = ?auto_14141 ?auto_14143 ) ) ( ON ?auto_14139 ?auto_14138 ) ( ON ?auto_14140 ?auto_14139 ) ( ON ?auto_14141 ?auto_14140 ) ( not ( = ?auto_14138 ?auto_14139 ) ) ( not ( = ?auto_14138 ?auto_14140 ) ) ( not ( = ?auto_14138 ?auto_14141 ) ) ( not ( = ?auto_14138 ?auto_14142 ) ) ( not ( = ?auto_14138 ?auto_14143 ) ) ( not ( = ?auto_14139 ?auto_14140 ) ) ( not ( = ?auto_14139 ?auto_14141 ) ) ( not ( = ?auto_14139 ?auto_14142 ) ) ( not ( = ?auto_14139 ?auto_14143 ) ) ( not ( = ?auto_14140 ?auto_14141 ) ) ( not ( = ?auto_14140 ?auto_14142 ) ) ( not ( = ?auto_14140 ?auto_14143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14141 ?auto_14142 ?auto_14143 )
      ( MAKE-5CRATE-VERIFY ?auto_14138 ?auto_14139 ?auto_14140 ?auto_14141 ?auto_14142 ?auto_14143 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14178 - SURFACE
      ?auto_14179 - SURFACE
      ?auto_14180 - SURFACE
      ?auto_14181 - SURFACE
      ?auto_14182 - SURFACE
      ?auto_14183 - SURFACE
    )
    :vars
    (
      ?auto_14184 - HOIST
      ?auto_14186 - PLACE
      ?auto_14185 - TRUCK
      ?auto_14187 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14184 ?auto_14186 ) ( SURFACE-AT ?auto_14182 ?auto_14186 ) ( CLEAR ?auto_14182 ) ( IS-CRATE ?auto_14183 ) ( not ( = ?auto_14182 ?auto_14183 ) ) ( AVAILABLE ?auto_14184 ) ( IN ?auto_14183 ?auto_14185 ) ( ON ?auto_14182 ?auto_14181 ) ( not ( = ?auto_14181 ?auto_14182 ) ) ( not ( = ?auto_14181 ?auto_14183 ) ) ( TRUCK-AT ?auto_14185 ?auto_14187 ) ( not ( = ?auto_14187 ?auto_14186 ) ) ( ON ?auto_14179 ?auto_14178 ) ( ON ?auto_14180 ?auto_14179 ) ( ON ?auto_14181 ?auto_14180 ) ( not ( = ?auto_14178 ?auto_14179 ) ) ( not ( = ?auto_14178 ?auto_14180 ) ) ( not ( = ?auto_14178 ?auto_14181 ) ) ( not ( = ?auto_14178 ?auto_14182 ) ) ( not ( = ?auto_14178 ?auto_14183 ) ) ( not ( = ?auto_14179 ?auto_14180 ) ) ( not ( = ?auto_14179 ?auto_14181 ) ) ( not ( = ?auto_14179 ?auto_14182 ) ) ( not ( = ?auto_14179 ?auto_14183 ) ) ( not ( = ?auto_14180 ?auto_14181 ) ) ( not ( = ?auto_14180 ?auto_14182 ) ) ( not ( = ?auto_14180 ?auto_14183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14181 ?auto_14182 ?auto_14183 )
      ( MAKE-5CRATE-VERIFY ?auto_14178 ?auto_14179 ?auto_14180 ?auto_14181 ?auto_14182 ?auto_14183 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14223 - SURFACE
      ?auto_14224 - SURFACE
      ?auto_14225 - SURFACE
      ?auto_14226 - SURFACE
      ?auto_14227 - SURFACE
      ?auto_14228 - SURFACE
    )
    :vars
    (
      ?auto_14230 - HOIST
      ?auto_14229 - PLACE
      ?auto_14232 - TRUCK
      ?auto_14231 - PLACE
      ?auto_14233 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_14230 ?auto_14229 ) ( SURFACE-AT ?auto_14227 ?auto_14229 ) ( CLEAR ?auto_14227 ) ( IS-CRATE ?auto_14228 ) ( not ( = ?auto_14227 ?auto_14228 ) ) ( AVAILABLE ?auto_14230 ) ( ON ?auto_14227 ?auto_14226 ) ( not ( = ?auto_14226 ?auto_14227 ) ) ( not ( = ?auto_14226 ?auto_14228 ) ) ( TRUCK-AT ?auto_14232 ?auto_14231 ) ( not ( = ?auto_14231 ?auto_14229 ) ) ( HOIST-AT ?auto_14233 ?auto_14231 ) ( LIFTING ?auto_14233 ?auto_14228 ) ( not ( = ?auto_14230 ?auto_14233 ) ) ( ON ?auto_14224 ?auto_14223 ) ( ON ?auto_14225 ?auto_14224 ) ( ON ?auto_14226 ?auto_14225 ) ( not ( = ?auto_14223 ?auto_14224 ) ) ( not ( = ?auto_14223 ?auto_14225 ) ) ( not ( = ?auto_14223 ?auto_14226 ) ) ( not ( = ?auto_14223 ?auto_14227 ) ) ( not ( = ?auto_14223 ?auto_14228 ) ) ( not ( = ?auto_14224 ?auto_14225 ) ) ( not ( = ?auto_14224 ?auto_14226 ) ) ( not ( = ?auto_14224 ?auto_14227 ) ) ( not ( = ?auto_14224 ?auto_14228 ) ) ( not ( = ?auto_14225 ?auto_14226 ) ) ( not ( = ?auto_14225 ?auto_14227 ) ) ( not ( = ?auto_14225 ?auto_14228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14226 ?auto_14227 ?auto_14228 )
      ( MAKE-5CRATE-VERIFY ?auto_14223 ?auto_14224 ?auto_14225 ?auto_14226 ?auto_14227 ?auto_14228 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14273 - SURFACE
      ?auto_14274 - SURFACE
      ?auto_14275 - SURFACE
      ?auto_14276 - SURFACE
      ?auto_14277 - SURFACE
      ?auto_14278 - SURFACE
    )
    :vars
    (
      ?auto_14281 - HOIST
      ?auto_14280 - PLACE
      ?auto_14279 - TRUCK
      ?auto_14283 - PLACE
      ?auto_14282 - HOIST
      ?auto_14284 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14281 ?auto_14280 ) ( SURFACE-AT ?auto_14277 ?auto_14280 ) ( CLEAR ?auto_14277 ) ( IS-CRATE ?auto_14278 ) ( not ( = ?auto_14277 ?auto_14278 ) ) ( AVAILABLE ?auto_14281 ) ( ON ?auto_14277 ?auto_14276 ) ( not ( = ?auto_14276 ?auto_14277 ) ) ( not ( = ?auto_14276 ?auto_14278 ) ) ( TRUCK-AT ?auto_14279 ?auto_14283 ) ( not ( = ?auto_14283 ?auto_14280 ) ) ( HOIST-AT ?auto_14282 ?auto_14283 ) ( not ( = ?auto_14281 ?auto_14282 ) ) ( AVAILABLE ?auto_14282 ) ( SURFACE-AT ?auto_14278 ?auto_14283 ) ( ON ?auto_14278 ?auto_14284 ) ( CLEAR ?auto_14278 ) ( not ( = ?auto_14277 ?auto_14284 ) ) ( not ( = ?auto_14278 ?auto_14284 ) ) ( not ( = ?auto_14276 ?auto_14284 ) ) ( ON ?auto_14274 ?auto_14273 ) ( ON ?auto_14275 ?auto_14274 ) ( ON ?auto_14276 ?auto_14275 ) ( not ( = ?auto_14273 ?auto_14274 ) ) ( not ( = ?auto_14273 ?auto_14275 ) ) ( not ( = ?auto_14273 ?auto_14276 ) ) ( not ( = ?auto_14273 ?auto_14277 ) ) ( not ( = ?auto_14273 ?auto_14278 ) ) ( not ( = ?auto_14273 ?auto_14284 ) ) ( not ( = ?auto_14274 ?auto_14275 ) ) ( not ( = ?auto_14274 ?auto_14276 ) ) ( not ( = ?auto_14274 ?auto_14277 ) ) ( not ( = ?auto_14274 ?auto_14278 ) ) ( not ( = ?auto_14274 ?auto_14284 ) ) ( not ( = ?auto_14275 ?auto_14276 ) ) ( not ( = ?auto_14275 ?auto_14277 ) ) ( not ( = ?auto_14275 ?auto_14278 ) ) ( not ( = ?auto_14275 ?auto_14284 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14276 ?auto_14277 ?auto_14278 )
      ( MAKE-5CRATE-VERIFY ?auto_14273 ?auto_14274 ?auto_14275 ?auto_14276 ?auto_14277 ?auto_14278 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14324 - SURFACE
      ?auto_14325 - SURFACE
      ?auto_14326 - SURFACE
      ?auto_14327 - SURFACE
      ?auto_14328 - SURFACE
      ?auto_14329 - SURFACE
    )
    :vars
    (
      ?auto_14331 - HOIST
      ?auto_14334 - PLACE
      ?auto_14330 - PLACE
      ?auto_14333 - HOIST
      ?auto_14332 - SURFACE
      ?auto_14335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14331 ?auto_14334 ) ( SURFACE-AT ?auto_14328 ?auto_14334 ) ( CLEAR ?auto_14328 ) ( IS-CRATE ?auto_14329 ) ( not ( = ?auto_14328 ?auto_14329 ) ) ( AVAILABLE ?auto_14331 ) ( ON ?auto_14328 ?auto_14327 ) ( not ( = ?auto_14327 ?auto_14328 ) ) ( not ( = ?auto_14327 ?auto_14329 ) ) ( not ( = ?auto_14330 ?auto_14334 ) ) ( HOIST-AT ?auto_14333 ?auto_14330 ) ( not ( = ?auto_14331 ?auto_14333 ) ) ( AVAILABLE ?auto_14333 ) ( SURFACE-AT ?auto_14329 ?auto_14330 ) ( ON ?auto_14329 ?auto_14332 ) ( CLEAR ?auto_14329 ) ( not ( = ?auto_14328 ?auto_14332 ) ) ( not ( = ?auto_14329 ?auto_14332 ) ) ( not ( = ?auto_14327 ?auto_14332 ) ) ( TRUCK-AT ?auto_14335 ?auto_14334 ) ( ON ?auto_14325 ?auto_14324 ) ( ON ?auto_14326 ?auto_14325 ) ( ON ?auto_14327 ?auto_14326 ) ( not ( = ?auto_14324 ?auto_14325 ) ) ( not ( = ?auto_14324 ?auto_14326 ) ) ( not ( = ?auto_14324 ?auto_14327 ) ) ( not ( = ?auto_14324 ?auto_14328 ) ) ( not ( = ?auto_14324 ?auto_14329 ) ) ( not ( = ?auto_14324 ?auto_14332 ) ) ( not ( = ?auto_14325 ?auto_14326 ) ) ( not ( = ?auto_14325 ?auto_14327 ) ) ( not ( = ?auto_14325 ?auto_14328 ) ) ( not ( = ?auto_14325 ?auto_14329 ) ) ( not ( = ?auto_14325 ?auto_14332 ) ) ( not ( = ?auto_14326 ?auto_14327 ) ) ( not ( = ?auto_14326 ?auto_14328 ) ) ( not ( = ?auto_14326 ?auto_14329 ) ) ( not ( = ?auto_14326 ?auto_14332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14327 ?auto_14328 ?auto_14329 )
      ( MAKE-5CRATE-VERIFY ?auto_14324 ?auto_14325 ?auto_14326 ?auto_14327 ?auto_14328 ?auto_14329 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14375 - SURFACE
      ?auto_14376 - SURFACE
      ?auto_14377 - SURFACE
      ?auto_14378 - SURFACE
      ?auto_14379 - SURFACE
      ?auto_14380 - SURFACE
    )
    :vars
    (
      ?auto_14381 - HOIST
      ?auto_14386 - PLACE
      ?auto_14385 - PLACE
      ?auto_14382 - HOIST
      ?auto_14384 - SURFACE
      ?auto_14383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14381 ?auto_14386 ) ( IS-CRATE ?auto_14380 ) ( not ( = ?auto_14379 ?auto_14380 ) ) ( not ( = ?auto_14378 ?auto_14379 ) ) ( not ( = ?auto_14378 ?auto_14380 ) ) ( not ( = ?auto_14385 ?auto_14386 ) ) ( HOIST-AT ?auto_14382 ?auto_14385 ) ( not ( = ?auto_14381 ?auto_14382 ) ) ( AVAILABLE ?auto_14382 ) ( SURFACE-AT ?auto_14380 ?auto_14385 ) ( ON ?auto_14380 ?auto_14384 ) ( CLEAR ?auto_14380 ) ( not ( = ?auto_14379 ?auto_14384 ) ) ( not ( = ?auto_14380 ?auto_14384 ) ) ( not ( = ?auto_14378 ?auto_14384 ) ) ( TRUCK-AT ?auto_14383 ?auto_14386 ) ( SURFACE-AT ?auto_14378 ?auto_14386 ) ( CLEAR ?auto_14378 ) ( LIFTING ?auto_14381 ?auto_14379 ) ( IS-CRATE ?auto_14379 ) ( ON ?auto_14376 ?auto_14375 ) ( ON ?auto_14377 ?auto_14376 ) ( ON ?auto_14378 ?auto_14377 ) ( not ( = ?auto_14375 ?auto_14376 ) ) ( not ( = ?auto_14375 ?auto_14377 ) ) ( not ( = ?auto_14375 ?auto_14378 ) ) ( not ( = ?auto_14375 ?auto_14379 ) ) ( not ( = ?auto_14375 ?auto_14380 ) ) ( not ( = ?auto_14375 ?auto_14384 ) ) ( not ( = ?auto_14376 ?auto_14377 ) ) ( not ( = ?auto_14376 ?auto_14378 ) ) ( not ( = ?auto_14376 ?auto_14379 ) ) ( not ( = ?auto_14376 ?auto_14380 ) ) ( not ( = ?auto_14376 ?auto_14384 ) ) ( not ( = ?auto_14377 ?auto_14378 ) ) ( not ( = ?auto_14377 ?auto_14379 ) ) ( not ( = ?auto_14377 ?auto_14380 ) ) ( not ( = ?auto_14377 ?auto_14384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14378 ?auto_14379 ?auto_14380 )
      ( MAKE-5CRATE-VERIFY ?auto_14375 ?auto_14376 ?auto_14377 ?auto_14378 ?auto_14379 ?auto_14380 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_14426 - SURFACE
      ?auto_14427 - SURFACE
      ?auto_14428 - SURFACE
      ?auto_14429 - SURFACE
      ?auto_14430 - SURFACE
      ?auto_14431 - SURFACE
    )
    :vars
    (
      ?auto_14437 - HOIST
      ?auto_14434 - PLACE
      ?auto_14432 - PLACE
      ?auto_14433 - HOIST
      ?auto_14435 - SURFACE
      ?auto_14436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_14437 ?auto_14434 ) ( IS-CRATE ?auto_14431 ) ( not ( = ?auto_14430 ?auto_14431 ) ) ( not ( = ?auto_14429 ?auto_14430 ) ) ( not ( = ?auto_14429 ?auto_14431 ) ) ( not ( = ?auto_14432 ?auto_14434 ) ) ( HOIST-AT ?auto_14433 ?auto_14432 ) ( not ( = ?auto_14437 ?auto_14433 ) ) ( AVAILABLE ?auto_14433 ) ( SURFACE-AT ?auto_14431 ?auto_14432 ) ( ON ?auto_14431 ?auto_14435 ) ( CLEAR ?auto_14431 ) ( not ( = ?auto_14430 ?auto_14435 ) ) ( not ( = ?auto_14431 ?auto_14435 ) ) ( not ( = ?auto_14429 ?auto_14435 ) ) ( TRUCK-AT ?auto_14436 ?auto_14434 ) ( SURFACE-AT ?auto_14429 ?auto_14434 ) ( CLEAR ?auto_14429 ) ( IS-CRATE ?auto_14430 ) ( AVAILABLE ?auto_14437 ) ( IN ?auto_14430 ?auto_14436 ) ( ON ?auto_14427 ?auto_14426 ) ( ON ?auto_14428 ?auto_14427 ) ( ON ?auto_14429 ?auto_14428 ) ( not ( = ?auto_14426 ?auto_14427 ) ) ( not ( = ?auto_14426 ?auto_14428 ) ) ( not ( = ?auto_14426 ?auto_14429 ) ) ( not ( = ?auto_14426 ?auto_14430 ) ) ( not ( = ?auto_14426 ?auto_14431 ) ) ( not ( = ?auto_14426 ?auto_14435 ) ) ( not ( = ?auto_14427 ?auto_14428 ) ) ( not ( = ?auto_14427 ?auto_14429 ) ) ( not ( = ?auto_14427 ?auto_14430 ) ) ( not ( = ?auto_14427 ?auto_14431 ) ) ( not ( = ?auto_14427 ?auto_14435 ) ) ( not ( = ?auto_14428 ?auto_14429 ) ) ( not ( = ?auto_14428 ?auto_14430 ) ) ( not ( = ?auto_14428 ?auto_14431 ) ) ( not ( = ?auto_14428 ?auto_14435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_14429 ?auto_14430 ?auto_14431 )
      ( MAKE-5CRATE-VERIFY ?auto_14426 ?auto_14427 ?auto_14428 ?auto_14429 ?auto_14430 ?auto_14431 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_14794 - SURFACE
      ?auto_14795 - SURFACE
    )
    :vars
    (
      ?auto_14796 - HOIST
      ?auto_14800 - PLACE
      ?auto_14799 - SURFACE
      ?auto_14801 - PLACE
      ?auto_14797 - HOIST
      ?auto_14802 - SURFACE
      ?auto_14798 - TRUCK
      ?auto_14803 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_14796 ?auto_14800 ) ( SURFACE-AT ?auto_14794 ?auto_14800 ) ( CLEAR ?auto_14794 ) ( IS-CRATE ?auto_14795 ) ( not ( = ?auto_14794 ?auto_14795 ) ) ( ON ?auto_14794 ?auto_14799 ) ( not ( = ?auto_14799 ?auto_14794 ) ) ( not ( = ?auto_14799 ?auto_14795 ) ) ( not ( = ?auto_14801 ?auto_14800 ) ) ( HOIST-AT ?auto_14797 ?auto_14801 ) ( not ( = ?auto_14796 ?auto_14797 ) ) ( AVAILABLE ?auto_14797 ) ( SURFACE-AT ?auto_14795 ?auto_14801 ) ( ON ?auto_14795 ?auto_14802 ) ( CLEAR ?auto_14795 ) ( not ( = ?auto_14794 ?auto_14802 ) ) ( not ( = ?auto_14795 ?auto_14802 ) ) ( not ( = ?auto_14799 ?auto_14802 ) ) ( TRUCK-AT ?auto_14798 ?auto_14800 ) ( LIFTING ?auto_14796 ?auto_14803 ) ( IS-CRATE ?auto_14803 ) ( not ( = ?auto_14794 ?auto_14803 ) ) ( not ( = ?auto_14795 ?auto_14803 ) ) ( not ( = ?auto_14799 ?auto_14803 ) ) ( not ( = ?auto_14802 ?auto_14803 ) ) )
    :subtasks
    ( ( !LOAD ?auto_14796 ?auto_14803 ?auto_14798 ?auto_14800 )
      ( MAKE-1CRATE ?auto_14794 ?auto_14795 )
      ( MAKE-1CRATE-VERIFY ?auto_14794 ?auto_14795 ) )
  )

)

