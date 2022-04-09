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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9539 - SURFACE
      ?auto_9540 - SURFACE
    )
    :vars
    (
      ?auto_9541 - HOIST
      ?auto_9542 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9541 ?auto_9542 ) ( SURFACE-AT ?auto_9539 ?auto_9542 ) ( CLEAR ?auto_9539 ) ( LIFTING ?auto_9541 ?auto_9540 ) ( IS-CRATE ?auto_9540 ) ( not ( = ?auto_9539 ?auto_9540 ) ) )
    :subtasks
    ( ( !DROP ?auto_9541 ?auto_9540 ?auto_9539 ?auto_9542 )
      ( MAKE-1CRATE-VERIFY ?auto_9539 ?auto_9540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9543 - SURFACE
      ?auto_9544 - SURFACE
    )
    :vars
    (
      ?auto_9546 - HOIST
      ?auto_9545 - PLACE
      ?auto_9547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9546 ?auto_9545 ) ( SURFACE-AT ?auto_9543 ?auto_9545 ) ( CLEAR ?auto_9543 ) ( IS-CRATE ?auto_9544 ) ( not ( = ?auto_9543 ?auto_9544 ) ) ( TRUCK-AT ?auto_9547 ?auto_9545 ) ( AVAILABLE ?auto_9546 ) ( IN ?auto_9544 ?auto_9547 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9546 ?auto_9544 ?auto_9547 ?auto_9545 )
      ( MAKE-1CRATE ?auto_9543 ?auto_9544 )
      ( MAKE-1CRATE-VERIFY ?auto_9543 ?auto_9544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9548 - SURFACE
      ?auto_9549 - SURFACE
    )
    :vars
    (
      ?auto_9550 - HOIST
      ?auto_9552 - PLACE
      ?auto_9551 - TRUCK
      ?auto_9553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9550 ?auto_9552 ) ( SURFACE-AT ?auto_9548 ?auto_9552 ) ( CLEAR ?auto_9548 ) ( IS-CRATE ?auto_9549 ) ( not ( = ?auto_9548 ?auto_9549 ) ) ( AVAILABLE ?auto_9550 ) ( IN ?auto_9549 ?auto_9551 ) ( TRUCK-AT ?auto_9551 ?auto_9553 ) ( not ( = ?auto_9553 ?auto_9552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9551 ?auto_9553 ?auto_9552 )
      ( MAKE-1CRATE ?auto_9548 ?auto_9549 )
      ( MAKE-1CRATE-VERIFY ?auto_9548 ?auto_9549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9554 - SURFACE
      ?auto_9555 - SURFACE
    )
    :vars
    (
      ?auto_9559 - HOIST
      ?auto_9558 - PLACE
      ?auto_9556 - TRUCK
      ?auto_9557 - PLACE
      ?auto_9560 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9559 ?auto_9558 ) ( SURFACE-AT ?auto_9554 ?auto_9558 ) ( CLEAR ?auto_9554 ) ( IS-CRATE ?auto_9555 ) ( not ( = ?auto_9554 ?auto_9555 ) ) ( AVAILABLE ?auto_9559 ) ( TRUCK-AT ?auto_9556 ?auto_9557 ) ( not ( = ?auto_9557 ?auto_9558 ) ) ( HOIST-AT ?auto_9560 ?auto_9557 ) ( LIFTING ?auto_9560 ?auto_9555 ) ( not ( = ?auto_9559 ?auto_9560 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9560 ?auto_9555 ?auto_9556 ?auto_9557 )
      ( MAKE-1CRATE ?auto_9554 ?auto_9555 )
      ( MAKE-1CRATE-VERIFY ?auto_9554 ?auto_9555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9561 - SURFACE
      ?auto_9562 - SURFACE
    )
    :vars
    (
      ?auto_9567 - HOIST
      ?auto_9566 - PLACE
      ?auto_9565 - TRUCK
      ?auto_9564 - PLACE
      ?auto_9563 - HOIST
      ?auto_9568 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9567 ?auto_9566 ) ( SURFACE-AT ?auto_9561 ?auto_9566 ) ( CLEAR ?auto_9561 ) ( IS-CRATE ?auto_9562 ) ( not ( = ?auto_9561 ?auto_9562 ) ) ( AVAILABLE ?auto_9567 ) ( TRUCK-AT ?auto_9565 ?auto_9564 ) ( not ( = ?auto_9564 ?auto_9566 ) ) ( HOIST-AT ?auto_9563 ?auto_9564 ) ( not ( = ?auto_9567 ?auto_9563 ) ) ( AVAILABLE ?auto_9563 ) ( SURFACE-AT ?auto_9562 ?auto_9564 ) ( ON ?auto_9562 ?auto_9568 ) ( CLEAR ?auto_9562 ) ( not ( = ?auto_9561 ?auto_9568 ) ) ( not ( = ?auto_9562 ?auto_9568 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9563 ?auto_9562 ?auto_9568 ?auto_9564 )
      ( MAKE-1CRATE ?auto_9561 ?auto_9562 )
      ( MAKE-1CRATE-VERIFY ?auto_9561 ?auto_9562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9569 - SURFACE
      ?auto_9570 - SURFACE
    )
    :vars
    (
      ?auto_9576 - HOIST
      ?auto_9575 - PLACE
      ?auto_9574 - PLACE
      ?auto_9573 - HOIST
      ?auto_9572 - SURFACE
      ?auto_9571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9576 ?auto_9575 ) ( SURFACE-AT ?auto_9569 ?auto_9575 ) ( CLEAR ?auto_9569 ) ( IS-CRATE ?auto_9570 ) ( not ( = ?auto_9569 ?auto_9570 ) ) ( AVAILABLE ?auto_9576 ) ( not ( = ?auto_9574 ?auto_9575 ) ) ( HOIST-AT ?auto_9573 ?auto_9574 ) ( not ( = ?auto_9576 ?auto_9573 ) ) ( AVAILABLE ?auto_9573 ) ( SURFACE-AT ?auto_9570 ?auto_9574 ) ( ON ?auto_9570 ?auto_9572 ) ( CLEAR ?auto_9570 ) ( not ( = ?auto_9569 ?auto_9572 ) ) ( not ( = ?auto_9570 ?auto_9572 ) ) ( TRUCK-AT ?auto_9571 ?auto_9575 ) )
    :subtasks
    ( ( !DRIVE ?auto_9571 ?auto_9575 ?auto_9574 )
      ( MAKE-1CRATE ?auto_9569 ?auto_9570 )
      ( MAKE-1CRATE-VERIFY ?auto_9569 ?auto_9570 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9582 - SURFACE
      ?auto_9583 - SURFACE
    )
    :vars
    (
      ?auto_9584 - HOIST
      ?auto_9585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9584 ?auto_9585 ) ( SURFACE-AT ?auto_9582 ?auto_9585 ) ( CLEAR ?auto_9582 ) ( LIFTING ?auto_9584 ?auto_9583 ) ( IS-CRATE ?auto_9583 ) ( not ( = ?auto_9582 ?auto_9583 ) ) )
    :subtasks
    ( ( !DROP ?auto_9584 ?auto_9583 ?auto_9582 ?auto_9585 )
      ( MAKE-1CRATE-VERIFY ?auto_9582 ?auto_9583 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9586 - SURFACE
      ?auto_9587 - SURFACE
      ?auto_9588 - SURFACE
    )
    :vars
    (
      ?auto_9589 - HOIST
      ?auto_9590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9589 ?auto_9590 ) ( SURFACE-AT ?auto_9587 ?auto_9590 ) ( CLEAR ?auto_9587 ) ( LIFTING ?auto_9589 ?auto_9588 ) ( IS-CRATE ?auto_9588 ) ( not ( = ?auto_9587 ?auto_9588 ) ) ( ON ?auto_9587 ?auto_9586 ) ( not ( = ?auto_9586 ?auto_9587 ) ) ( not ( = ?auto_9586 ?auto_9588 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9587 ?auto_9588 )
      ( MAKE-2CRATE-VERIFY ?auto_9586 ?auto_9587 ?auto_9588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9591 - SURFACE
      ?auto_9592 - SURFACE
    )
    :vars
    (
      ?auto_9593 - HOIST
      ?auto_9594 - PLACE
      ?auto_9595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9593 ?auto_9594 ) ( SURFACE-AT ?auto_9591 ?auto_9594 ) ( CLEAR ?auto_9591 ) ( IS-CRATE ?auto_9592 ) ( not ( = ?auto_9591 ?auto_9592 ) ) ( TRUCK-AT ?auto_9595 ?auto_9594 ) ( AVAILABLE ?auto_9593 ) ( IN ?auto_9592 ?auto_9595 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9593 ?auto_9592 ?auto_9595 ?auto_9594 )
      ( MAKE-1CRATE ?auto_9591 ?auto_9592 )
      ( MAKE-1CRATE-VERIFY ?auto_9591 ?auto_9592 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9596 - SURFACE
      ?auto_9597 - SURFACE
      ?auto_9598 - SURFACE
    )
    :vars
    (
      ?auto_9599 - HOIST
      ?auto_9601 - PLACE
      ?auto_9600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9599 ?auto_9601 ) ( SURFACE-AT ?auto_9597 ?auto_9601 ) ( CLEAR ?auto_9597 ) ( IS-CRATE ?auto_9598 ) ( not ( = ?auto_9597 ?auto_9598 ) ) ( TRUCK-AT ?auto_9600 ?auto_9601 ) ( AVAILABLE ?auto_9599 ) ( IN ?auto_9598 ?auto_9600 ) ( ON ?auto_9597 ?auto_9596 ) ( not ( = ?auto_9596 ?auto_9597 ) ) ( not ( = ?auto_9596 ?auto_9598 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9597 ?auto_9598 )
      ( MAKE-2CRATE-VERIFY ?auto_9596 ?auto_9597 ?auto_9598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9602 - SURFACE
      ?auto_9603 - SURFACE
    )
    :vars
    (
      ?auto_9607 - HOIST
      ?auto_9605 - PLACE
      ?auto_9606 - TRUCK
      ?auto_9604 - SURFACE
      ?auto_9608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9607 ?auto_9605 ) ( SURFACE-AT ?auto_9602 ?auto_9605 ) ( CLEAR ?auto_9602 ) ( IS-CRATE ?auto_9603 ) ( not ( = ?auto_9602 ?auto_9603 ) ) ( AVAILABLE ?auto_9607 ) ( IN ?auto_9603 ?auto_9606 ) ( ON ?auto_9602 ?auto_9604 ) ( not ( = ?auto_9604 ?auto_9602 ) ) ( not ( = ?auto_9604 ?auto_9603 ) ) ( TRUCK-AT ?auto_9606 ?auto_9608 ) ( not ( = ?auto_9608 ?auto_9605 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9606 ?auto_9608 ?auto_9605 )
      ( MAKE-2CRATE ?auto_9604 ?auto_9602 ?auto_9603 )
      ( MAKE-1CRATE-VERIFY ?auto_9602 ?auto_9603 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9609 - SURFACE
      ?auto_9610 - SURFACE
      ?auto_9611 - SURFACE
    )
    :vars
    (
      ?auto_9613 - HOIST
      ?auto_9612 - PLACE
      ?auto_9614 - TRUCK
      ?auto_9615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9613 ?auto_9612 ) ( SURFACE-AT ?auto_9610 ?auto_9612 ) ( CLEAR ?auto_9610 ) ( IS-CRATE ?auto_9611 ) ( not ( = ?auto_9610 ?auto_9611 ) ) ( AVAILABLE ?auto_9613 ) ( IN ?auto_9611 ?auto_9614 ) ( ON ?auto_9610 ?auto_9609 ) ( not ( = ?auto_9609 ?auto_9610 ) ) ( not ( = ?auto_9609 ?auto_9611 ) ) ( TRUCK-AT ?auto_9614 ?auto_9615 ) ( not ( = ?auto_9615 ?auto_9612 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9610 ?auto_9611 )
      ( MAKE-2CRATE-VERIFY ?auto_9609 ?auto_9610 ?auto_9611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9616 - SURFACE
      ?auto_9617 - SURFACE
    )
    :vars
    (
      ?auto_9620 - HOIST
      ?auto_9619 - PLACE
      ?auto_9622 - SURFACE
      ?auto_9618 - TRUCK
      ?auto_9621 - PLACE
      ?auto_9623 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9620 ?auto_9619 ) ( SURFACE-AT ?auto_9616 ?auto_9619 ) ( CLEAR ?auto_9616 ) ( IS-CRATE ?auto_9617 ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( AVAILABLE ?auto_9620 ) ( ON ?auto_9616 ?auto_9622 ) ( not ( = ?auto_9622 ?auto_9616 ) ) ( not ( = ?auto_9622 ?auto_9617 ) ) ( TRUCK-AT ?auto_9618 ?auto_9621 ) ( not ( = ?auto_9621 ?auto_9619 ) ) ( HOIST-AT ?auto_9623 ?auto_9621 ) ( LIFTING ?auto_9623 ?auto_9617 ) ( not ( = ?auto_9620 ?auto_9623 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9623 ?auto_9617 ?auto_9618 ?auto_9621 )
      ( MAKE-2CRATE ?auto_9622 ?auto_9616 ?auto_9617 )
      ( MAKE-1CRATE-VERIFY ?auto_9616 ?auto_9617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9624 - SURFACE
      ?auto_9625 - SURFACE
      ?auto_9626 - SURFACE
    )
    :vars
    (
      ?auto_9628 - HOIST
      ?auto_9627 - PLACE
      ?auto_9631 - TRUCK
      ?auto_9629 - PLACE
      ?auto_9630 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9628 ?auto_9627 ) ( SURFACE-AT ?auto_9625 ?auto_9627 ) ( CLEAR ?auto_9625 ) ( IS-CRATE ?auto_9626 ) ( not ( = ?auto_9625 ?auto_9626 ) ) ( AVAILABLE ?auto_9628 ) ( ON ?auto_9625 ?auto_9624 ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( not ( = ?auto_9624 ?auto_9626 ) ) ( TRUCK-AT ?auto_9631 ?auto_9629 ) ( not ( = ?auto_9629 ?auto_9627 ) ) ( HOIST-AT ?auto_9630 ?auto_9629 ) ( LIFTING ?auto_9630 ?auto_9626 ) ( not ( = ?auto_9628 ?auto_9630 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9625 ?auto_9626 )
      ( MAKE-2CRATE-VERIFY ?auto_9624 ?auto_9625 ?auto_9626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9632 - SURFACE
      ?auto_9633 - SURFACE
    )
    :vars
    (
      ?auto_9635 - HOIST
      ?auto_9636 - PLACE
      ?auto_9634 - SURFACE
      ?auto_9639 - TRUCK
      ?auto_9637 - PLACE
      ?auto_9638 - HOIST
      ?auto_9640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9635 ?auto_9636 ) ( SURFACE-AT ?auto_9632 ?auto_9636 ) ( CLEAR ?auto_9632 ) ( IS-CRATE ?auto_9633 ) ( not ( = ?auto_9632 ?auto_9633 ) ) ( AVAILABLE ?auto_9635 ) ( ON ?auto_9632 ?auto_9634 ) ( not ( = ?auto_9634 ?auto_9632 ) ) ( not ( = ?auto_9634 ?auto_9633 ) ) ( TRUCK-AT ?auto_9639 ?auto_9637 ) ( not ( = ?auto_9637 ?auto_9636 ) ) ( HOIST-AT ?auto_9638 ?auto_9637 ) ( not ( = ?auto_9635 ?auto_9638 ) ) ( AVAILABLE ?auto_9638 ) ( SURFACE-AT ?auto_9633 ?auto_9637 ) ( ON ?auto_9633 ?auto_9640 ) ( CLEAR ?auto_9633 ) ( not ( = ?auto_9632 ?auto_9640 ) ) ( not ( = ?auto_9633 ?auto_9640 ) ) ( not ( = ?auto_9634 ?auto_9640 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9638 ?auto_9633 ?auto_9640 ?auto_9637 )
      ( MAKE-2CRATE ?auto_9634 ?auto_9632 ?auto_9633 )
      ( MAKE-1CRATE-VERIFY ?auto_9632 ?auto_9633 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9641 - SURFACE
      ?auto_9642 - SURFACE
      ?auto_9643 - SURFACE
    )
    :vars
    (
      ?auto_9646 - HOIST
      ?auto_9648 - PLACE
      ?auto_9645 - TRUCK
      ?auto_9649 - PLACE
      ?auto_9644 - HOIST
      ?auto_9647 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9646 ?auto_9648 ) ( SURFACE-AT ?auto_9642 ?auto_9648 ) ( CLEAR ?auto_9642 ) ( IS-CRATE ?auto_9643 ) ( not ( = ?auto_9642 ?auto_9643 ) ) ( AVAILABLE ?auto_9646 ) ( ON ?auto_9642 ?auto_9641 ) ( not ( = ?auto_9641 ?auto_9642 ) ) ( not ( = ?auto_9641 ?auto_9643 ) ) ( TRUCK-AT ?auto_9645 ?auto_9649 ) ( not ( = ?auto_9649 ?auto_9648 ) ) ( HOIST-AT ?auto_9644 ?auto_9649 ) ( not ( = ?auto_9646 ?auto_9644 ) ) ( AVAILABLE ?auto_9644 ) ( SURFACE-AT ?auto_9643 ?auto_9649 ) ( ON ?auto_9643 ?auto_9647 ) ( CLEAR ?auto_9643 ) ( not ( = ?auto_9642 ?auto_9647 ) ) ( not ( = ?auto_9643 ?auto_9647 ) ) ( not ( = ?auto_9641 ?auto_9647 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9642 ?auto_9643 )
      ( MAKE-2CRATE-VERIFY ?auto_9641 ?auto_9642 ?auto_9643 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9650 - SURFACE
      ?auto_9651 - SURFACE
    )
    :vars
    (
      ?auto_9652 - HOIST
      ?auto_9657 - PLACE
      ?auto_9656 - SURFACE
      ?auto_9658 - PLACE
      ?auto_9655 - HOIST
      ?auto_9653 - SURFACE
      ?auto_9654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9652 ?auto_9657 ) ( SURFACE-AT ?auto_9650 ?auto_9657 ) ( CLEAR ?auto_9650 ) ( IS-CRATE ?auto_9651 ) ( not ( = ?auto_9650 ?auto_9651 ) ) ( AVAILABLE ?auto_9652 ) ( ON ?auto_9650 ?auto_9656 ) ( not ( = ?auto_9656 ?auto_9650 ) ) ( not ( = ?auto_9656 ?auto_9651 ) ) ( not ( = ?auto_9658 ?auto_9657 ) ) ( HOIST-AT ?auto_9655 ?auto_9658 ) ( not ( = ?auto_9652 ?auto_9655 ) ) ( AVAILABLE ?auto_9655 ) ( SURFACE-AT ?auto_9651 ?auto_9658 ) ( ON ?auto_9651 ?auto_9653 ) ( CLEAR ?auto_9651 ) ( not ( = ?auto_9650 ?auto_9653 ) ) ( not ( = ?auto_9651 ?auto_9653 ) ) ( not ( = ?auto_9656 ?auto_9653 ) ) ( TRUCK-AT ?auto_9654 ?auto_9657 ) )
    :subtasks
    ( ( !DRIVE ?auto_9654 ?auto_9657 ?auto_9658 )
      ( MAKE-2CRATE ?auto_9656 ?auto_9650 ?auto_9651 )
      ( MAKE-1CRATE-VERIFY ?auto_9650 ?auto_9651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9659 - SURFACE
      ?auto_9660 - SURFACE
      ?auto_9661 - SURFACE
    )
    :vars
    (
      ?auto_9662 - HOIST
      ?auto_9666 - PLACE
      ?auto_9664 - PLACE
      ?auto_9667 - HOIST
      ?auto_9663 - SURFACE
      ?auto_9665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9662 ?auto_9666 ) ( SURFACE-AT ?auto_9660 ?auto_9666 ) ( CLEAR ?auto_9660 ) ( IS-CRATE ?auto_9661 ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( AVAILABLE ?auto_9662 ) ( ON ?auto_9660 ?auto_9659 ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( not ( = ?auto_9659 ?auto_9661 ) ) ( not ( = ?auto_9664 ?auto_9666 ) ) ( HOIST-AT ?auto_9667 ?auto_9664 ) ( not ( = ?auto_9662 ?auto_9667 ) ) ( AVAILABLE ?auto_9667 ) ( SURFACE-AT ?auto_9661 ?auto_9664 ) ( ON ?auto_9661 ?auto_9663 ) ( CLEAR ?auto_9661 ) ( not ( = ?auto_9660 ?auto_9663 ) ) ( not ( = ?auto_9661 ?auto_9663 ) ) ( not ( = ?auto_9659 ?auto_9663 ) ) ( TRUCK-AT ?auto_9665 ?auto_9666 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9660 ?auto_9661 )
      ( MAKE-2CRATE-VERIFY ?auto_9659 ?auto_9660 ?auto_9661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9668 - SURFACE
      ?auto_9669 - SURFACE
    )
    :vars
    (
      ?auto_9674 - HOIST
      ?auto_9675 - PLACE
      ?auto_9671 - SURFACE
      ?auto_9676 - PLACE
      ?auto_9673 - HOIST
      ?auto_9670 - SURFACE
      ?auto_9672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9674 ?auto_9675 ) ( IS-CRATE ?auto_9669 ) ( not ( = ?auto_9668 ?auto_9669 ) ) ( not ( = ?auto_9671 ?auto_9668 ) ) ( not ( = ?auto_9671 ?auto_9669 ) ) ( not ( = ?auto_9676 ?auto_9675 ) ) ( HOIST-AT ?auto_9673 ?auto_9676 ) ( not ( = ?auto_9674 ?auto_9673 ) ) ( AVAILABLE ?auto_9673 ) ( SURFACE-AT ?auto_9669 ?auto_9676 ) ( ON ?auto_9669 ?auto_9670 ) ( CLEAR ?auto_9669 ) ( not ( = ?auto_9668 ?auto_9670 ) ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( not ( = ?auto_9671 ?auto_9670 ) ) ( TRUCK-AT ?auto_9672 ?auto_9675 ) ( SURFACE-AT ?auto_9671 ?auto_9675 ) ( CLEAR ?auto_9671 ) ( LIFTING ?auto_9674 ?auto_9668 ) ( IS-CRATE ?auto_9668 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9671 ?auto_9668 )
      ( MAKE-2CRATE ?auto_9671 ?auto_9668 ?auto_9669 )
      ( MAKE-1CRATE-VERIFY ?auto_9668 ?auto_9669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9677 - SURFACE
      ?auto_9678 - SURFACE
      ?auto_9679 - SURFACE
    )
    :vars
    (
      ?auto_9682 - HOIST
      ?auto_9684 - PLACE
      ?auto_9683 - PLACE
      ?auto_9685 - HOIST
      ?auto_9681 - SURFACE
      ?auto_9680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9682 ?auto_9684 ) ( IS-CRATE ?auto_9679 ) ( not ( = ?auto_9678 ?auto_9679 ) ) ( not ( = ?auto_9677 ?auto_9678 ) ) ( not ( = ?auto_9677 ?auto_9679 ) ) ( not ( = ?auto_9683 ?auto_9684 ) ) ( HOIST-AT ?auto_9685 ?auto_9683 ) ( not ( = ?auto_9682 ?auto_9685 ) ) ( AVAILABLE ?auto_9685 ) ( SURFACE-AT ?auto_9679 ?auto_9683 ) ( ON ?auto_9679 ?auto_9681 ) ( CLEAR ?auto_9679 ) ( not ( = ?auto_9678 ?auto_9681 ) ) ( not ( = ?auto_9679 ?auto_9681 ) ) ( not ( = ?auto_9677 ?auto_9681 ) ) ( TRUCK-AT ?auto_9680 ?auto_9684 ) ( SURFACE-AT ?auto_9677 ?auto_9684 ) ( CLEAR ?auto_9677 ) ( LIFTING ?auto_9682 ?auto_9678 ) ( IS-CRATE ?auto_9678 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9678 ?auto_9679 )
      ( MAKE-2CRATE-VERIFY ?auto_9677 ?auto_9678 ?auto_9679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9686 - SURFACE
      ?auto_9687 - SURFACE
    )
    :vars
    (
      ?auto_9689 - HOIST
      ?auto_9691 - PLACE
      ?auto_9690 - SURFACE
      ?auto_9692 - PLACE
      ?auto_9693 - HOIST
      ?auto_9694 - SURFACE
      ?auto_9688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9689 ?auto_9691 ) ( IS-CRATE ?auto_9687 ) ( not ( = ?auto_9686 ?auto_9687 ) ) ( not ( = ?auto_9690 ?auto_9686 ) ) ( not ( = ?auto_9690 ?auto_9687 ) ) ( not ( = ?auto_9692 ?auto_9691 ) ) ( HOIST-AT ?auto_9693 ?auto_9692 ) ( not ( = ?auto_9689 ?auto_9693 ) ) ( AVAILABLE ?auto_9693 ) ( SURFACE-AT ?auto_9687 ?auto_9692 ) ( ON ?auto_9687 ?auto_9694 ) ( CLEAR ?auto_9687 ) ( not ( = ?auto_9686 ?auto_9694 ) ) ( not ( = ?auto_9687 ?auto_9694 ) ) ( not ( = ?auto_9690 ?auto_9694 ) ) ( TRUCK-AT ?auto_9688 ?auto_9691 ) ( SURFACE-AT ?auto_9690 ?auto_9691 ) ( CLEAR ?auto_9690 ) ( IS-CRATE ?auto_9686 ) ( AVAILABLE ?auto_9689 ) ( IN ?auto_9686 ?auto_9688 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9689 ?auto_9686 ?auto_9688 ?auto_9691 )
      ( MAKE-2CRATE ?auto_9690 ?auto_9686 ?auto_9687 )
      ( MAKE-1CRATE-VERIFY ?auto_9686 ?auto_9687 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9695 - SURFACE
      ?auto_9696 - SURFACE
      ?auto_9697 - SURFACE
    )
    :vars
    (
      ?auto_9701 - HOIST
      ?auto_9703 - PLACE
      ?auto_9699 - PLACE
      ?auto_9700 - HOIST
      ?auto_9702 - SURFACE
      ?auto_9698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9701 ?auto_9703 ) ( IS-CRATE ?auto_9697 ) ( not ( = ?auto_9696 ?auto_9697 ) ) ( not ( = ?auto_9695 ?auto_9696 ) ) ( not ( = ?auto_9695 ?auto_9697 ) ) ( not ( = ?auto_9699 ?auto_9703 ) ) ( HOIST-AT ?auto_9700 ?auto_9699 ) ( not ( = ?auto_9701 ?auto_9700 ) ) ( AVAILABLE ?auto_9700 ) ( SURFACE-AT ?auto_9697 ?auto_9699 ) ( ON ?auto_9697 ?auto_9702 ) ( CLEAR ?auto_9697 ) ( not ( = ?auto_9696 ?auto_9702 ) ) ( not ( = ?auto_9697 ?auto_9702 ) ) ( not ( = ?auto_9695 ?auto_9702 ) ) ( TRUCK-AT ?auto_9698 ?auto_9703 ) ( SURFACE-AT ?auto_9695 ?auto_9703 ) ( CLEAR ?auto_9695 ) ( IS-CRATE ?auto_9696 ) ( AVAILABLE ?auto_9701 ) ( IN ?auto_9696 ?auto_9698 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9696 ?auto_9697 )
      ( MAKE-2CRATE-VERIFY ?auto_9695 ?auto_9696 ?auto_9697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9704 - SURFACE
      ?auto_9705 - SURFACE
    )
    :vars
    (
      ?auto_9709 - HOIST
      ?auto_9707 - PLACE
      ?auto_9712 - SURFACE
      ?auto_9711 - PLACE
      ?auto_9708 - HOIST
      ?auto_9706 - SURFACE
      ?auto_9710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9709 ?auto_9707 ) ( IS-CRATE ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( not ( = ?auto_9712 ?auto_9704 ) ) ( not ( = ?auto_9712 ?auto_9705 ) ) ( not ( = ?auto_9711 ?auto_9707 ) ) ( HOIST-AT ?auto_9708 ?auto_9711 ) ( not ( = ?auto_9709 ?auto_9708 ) ) ( AVAILABLE ?auto_9708 ) ( SURFACE-AT ?auto_9705 ?auto_9711 ) ( ON ?auto_9705 ?auto_9706 ) ( CLEAR ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( not ( = ?auto_9712 ?auto_9706 ) ) ( SURFACE-AT ?auto_9712 ?auto_9707 ) ( CLEAR ?auto_9712 ) ( IS-CRATE ?auto_9704 ) ( AVAILABLE ?auto_9709 ) ( IN ?auto_9704 ?auto_9710 ) ( TRUCK-AT ?auto_9710 ?auto_9711 ) )
    :subtasks
    ( ( !DRIVE ?auto_9710 ?auto_9711 ?auto_9707 )
      ( MAKE-2CRATE ?auto_9712 ?auto_9704 ?auto_9705 )
      ( MAKE-1CRATE-VERIFY ?auto_9704 ?auto_9705 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9713 - SURFACE
      ?auto_9714 - SURFACE
      ?auto_9715 - SURFACE
    )
    :vars
    (
      ?auto_9720 - HOIST
      ?auto_9721 - PLACE
      ?auto_9718 - PLACE
      ?auto_9716 - HOIST
      ?auto_9719 - SURFACE
      ?auto_9717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9720 ?auto_9721 ) ( IS-CRATE ?auto_9715 ) ( not ( = ?auto_9714 ?auto_9715 ) ) ( not ( = ?auto_9713 ?auto_9714 ) ) ( not ( = ?auto_9713 ?auto_9715 ) ) ( not ( = ?auto_9718 ?auto_9721 ) ) ( HOIST-AT ?auto_9716 ?auto_9718 ) ( not ( = ?auto_9720 ?auto_9716 ) ) ( AVAILABLE ?auto_9716 ) ( SURFACE-AT ?auto_9715 ?auto_9718 ) ( ON ?auto_9715 ?auto_9719 ) ( CLEAR ?auto_9715 ) ( not ( = ?auto_9714 ?auto_9719 ) ) ( not ( = ?auto_9715 ?auto_9719 ) ) ( not ( = ?auto_9713 ?auto_9719 ) ) ( SURFACE-AT ?auto_9713 ?auto_9721 ) ( CLEAR ?auto_9713 ) ( IS-CRATE ?auto_9714 ) ( AVAILABLE ?auto_9720 ) ( IN ?auto_9714 ?auto_9717 ) ( TRUCK-AT ?auto_9717 ?auto_9718 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9714 ?auto_9715 )
      ( MAKE-2CRATE-VERIFY ?auto_9713 ?auto_9714 ?auto_9715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9722 - SURFACE
      ?auto_9723 - SURFACE
    )
    :vars
    (
      ?auto_9729 - HOIST
      ?auto_9728 - PLACE
      ?auto_9724 - SURFACE
      ?auto_9727 - PLACE
      ?auto_9730 - HOIST
      ?auto_9726 - SURFACE
      ?auto_9725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9729 ?auto_9728 ) ( IS-CRATE ?auto_9723 ) ( not ( = ?auto_9722 ?auto_9723 ) ) ( not ( = ?auto_9724 ?auto_9722 ) ) ( not ( = ?auto_9724 ?auto_9723 ) ) ( not ( = ?auto_9727 ?auto_9728 ) ) ( HOIST-AT ?auto_9730 ?auto_9727 ) ( not ( = ?auto_9729 ?auto_9730 ) ) ( SURFACE-AT ?auto_9723 ?auto_9727 ) ( ON ?auto_9723 ?auto_9726 ) ( CLEAR ?auto_9723 ) ( not ( = ?auto_9722 ?auto_9726 ) ) ( not ( = ?auto_9723 ?auto_9726 ) ) ( not ( = ?auto_9724 ?auto_9726 ) ) ( SURFACE-AT ?auto_9724 ?auto_9728 ) ( CLEAR ?auto_9724 ) ( IS-CRATE ?auto_9722 ) ( AVAILABLE ?auto_9729 ) ( TRUCK-AT ?auto_9725 ?auto_9727 ) ( LIFTING ?auto_9730 ?auto_9722 ) )
    :subtasks
    ( ( !LOAD ?auto_9730 ?auto_9722 ?auto_9725 ?auto_9727 )
      ( MAKE-2CRATE ?auto_9724 ?auto_9722 ?auto_9723 )
      ( MAKE-1CRATE-VERIFY ?auto_9722 ?auto_9723 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9731 - SURFACE
      ?auto_9732 - SURFACE
      ?auto_9733 - SURFACE
    )
    :vars
    (
      ?auto_9739 - HOIST
      ?auto_9734 - PLACE
      ?auto_9737 - PLACE
      ?auto_9736 - HOIST
      ?auto_9735 - SURFACE
      ?auto_9738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9739 ?auto_9734 ) ( IS-CRATE ?auto_9733 ) ( not ( = ?auto_9732 ?auto_9733 ) ) ( not ( = ?auto_9731 ?auto_9732 ) ) ( not ( = ?auto_9731 ?auto_9733 ) ) ( not ( = ?auto_9737 ?auto_9734 ) ) ( HOIST-AT ?auto_9736 ?auto_9737 ) ( not ( = ?auto_9739 ?auto_9736 ) ) ( SURFACE-AT ?auto_9733 ?auto_9737 ) ( ON ?auto_9733 ?auto_9735 ) ( CLEAR ?auto_9733 ) ( not ( = ?auto_9732 ?auto_9735 ) ) ( not ( = ?auto_9733 ?auto_9735 ) ) ( not ( = ?auto_9731 ?auto_9735 ) ) ( SURFACE-AT ?auto_9731 ?auto_9734 ) ( CLEAR ?auto_9731 ) ( IS-CRATE ?auto_9732 ) ( AVAILABLE ?auto_9739 ) ( TRUCK-AT ?auto_9738 ?auto_9737 ) ( LIFTING ?auto_9736 ?auto_9732 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9732 ?auto_9733 )
      ( MAKE-2CRATE-VERIFY ?auto_9731 ?auto_9732 ?auto_9733 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9740 - SURFACE
      ?auto_9741 - SURFACE
    )
    :vars
    (
      ?auto_9747 - HOIST
      ?auto_9748 - PLACE
      ?auto_9746 - SURFACE
      ?auto_9744 - PLACE
      ?auto_9742 - HOIST
      ?auto_9743 - SURFACE
      ?auto_9745 - TRUCK
      ?auto_9749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9747 ?auto_9748 ) ( IS-CRATE ?auto_9741 ) ( not ( = ?auto_9740 ?auto_9741 ) ) ( not ( = ?auto_9746 ?auto_9740 ) ) ( not ( = ?auto_9746 ?auto_9741 ) ) ( not ( = ?auto_9744 ?auto_9748 ) ) ( HOIST-AT ?auto_9742 ?auto_9744 ) ( not ( = ?auto_9747 ?auto_9742 ) ) ( SURFACE-AT ?auto_9741 ?auto_9744 ) ( ON ?auto_9741 ?auto_9743 ) ( CLEAR ?auto_9741 ) ( not ( = ?auto_9740 ?auto_9743 ) ) ( not ( = ?auto_9741 ?auto_9743 ) ) ( not ( = ?auto_9746 ?auto_9743 ) ) ( SURFACE-AT ?auto_9746 ?auto_9748 ) ( CLEAR ?auto_9746 ) ( IS-CRATE ?auto_9740 ) ( AVAILABLE ?auto_9747 ) ( TRUCK-AT ?auto_9745 ?auto_9744 ) ( AVAILABLE ?auto_9742 ) ( SURFACE-AT ?auto_9740 ?auto_9744 ) ( ON ?auto_9740 ?auto_9749 ) ( CLEAR ?auto_9740 ) ( not ( = ?auto_9740 ?auto_9749 ) ) ( not ( = ?auto_9741 ?auto_9749 ) ) ( not ( = ?auto_9746 ?auto_9749 ) ) ( not ( = ?auto_9743 ?auto_9749 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9742 ?auto_9740 ?auto_9749 ?auto_9744 )
      ( MAKE-2CRATE ?auto_9746 ?auto_9740 ?auto_9741 )
      ( MAKE-1CRATE-VERIFY ?auto_9740 ?auto_9741 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9750 - SURFACE
      ?auto_9751 - SURFACE
      ?auto_9752 - SURFACE
    )
    :vars
    (
      ?auto_9755 - HOIST
      ?auto_9759 - PLACE
      ?auto_9754 - PLACE
      ?auto_9758 - HOIST
      ?auto_9757 - SURFACE
      ?auto_9756 - TRUCK
      ?auto_9753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9755 ?auto_9759 ) ( IS-CRATE ?auto_9752 ) ( not ( = ?auto_9751 ?auto_9752 ) ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9750 ?auto_9752 ) ) ( not ( = ?auto_9754 ?auto_9759 ) ) ( HOIST-AT ?auto_9758 ?auto_9754 ) ( not ( = ?auto_9755 ?auto_9758 ) ) ( SURFACE-AT ?auto_9752 ?auto_9754 ) ( ON ?auto_9752 ?auto_9757 ) ( CLEAR ?auto_9752 ) ( not ( = ?auto_9751 ?auto_9757 ) ) ( not ( = ?auto_9752 ?auto_9757 ) ) ( not ( = ?auto_9750 ?auto_9757 ) ) ( SURFACE-AT ?auto_9750 ?auto_9759 ) ( CLEAR ?auto_9750 ) ( IS-CRATE ?auto_9751 ) ( AVAILABLE ?auto_9755 ) ( TRUCK-AT ?auto_9756 ?auto_9754 ) ( AVAILABLE ?auto_9758 ) ( SURFACE-AT ?auto_9751 ?auto_9754 ) ( ON ?auto_9751 ?auto_9753 ) ( CLEAR ?auto_9751 ) ( not ( = ?auto_9751 ?auto_9753 ) ) ( not ( = ?auto_9752 ?auto_9753 ) ) ( not ( = ?auto_9750 ?auto_9753 ) ) ( not ( = ?auto_9757 ?auto_9753 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9751 ?auto_9752 )
      ( MAKE-2CRATE-VERIFY ?auto_9750 ?auto_9751 ?auto_9752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9760 - SURFACE
      ?auto_9761 - SURFACE
    )
    :vars
    (
      ?auto_9763 - HOIST
      ?auto_9769 - PLACE
      ?auto_9764 - SURFACE
      ?auto_9766 - PLACE
      ?auto_9765 - HOIST
      ?auto_9762 - SURFACE
      ?auto_9767 - SURFACE
      ?auto_9768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9763 ?auto_9769 ) ( IS-CRATE ?auto_9761 ) ( not ( = ?auto_9760 ?auto_9761 ) ) ( not ( = ?auto_9764 ?auto_9760 ) ) ( not ( = ?auto_9764 ?auto_9761 ) ) ( not ( = ?auto_9766 ?auto_9769 ) ) ( HOIST-AT ?auto_9765 ?auto_9766 ) ( not ( = ?auto_9763 ?auto_9765 ) ) ( SURFACE-AT ?auto_9761 ?auto_9766 ) ( ON ?auto_9761 ?auto_9762 ) ( CLEAR ?auto_9761 ) ( not ( = ?auto_9760 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( not ( = ?auto_9764 ?auto_9762 ) ) ( SURFACE-AT ?auto_9764 ?auto_9769 ) ( CLEAR ?auto_9764 ) ( IS-CRATE ?auto_9760 ) ( AVAILABLE ?auto_9763 ) ( AVAILABLE ?auto_9765 ) ( SURFACE-AT ?auto_9760 ?auto_9766 ) ( ON ?auto_9760 ?auto_9767 ) ( CLEAR ?auto_9760 ) ( not ( = ?auto_9760 ?auto_9767 ) ) ( not ( = ?auto_9761 ?auto_9767 ) ) ( not ( = ?auto_9764 ?auto_9767 ) ) ( not ( = ?auto_9762 ?auto_9767 ) ) ( TRUCK-AT ?auto_9768 ?auto_9769 ) )
    :subtasks
    ( ( !DRIVE ?auto_9768 ?auto_9769 ?auto_9766 )
      ( MAKE-2CRATE ?auto_9764 ?auto_9760 ?auto_9761 )
      ( MAKE-1CRATE-VERIFY ?auto_9760 ?auto_9761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9770 - SURFACE
      ?auto_9771 - SURFACE
      ?auto_9772 - SURFACE
    )
    :vars
    (
      ?auto_9778 - HOIST
      ?auto_9777 - PLACE
      ?auto_9779 - PLACE
      ?auto_9774 - HOIST
      ?auto_9776 - SURFACE
      ?auto_9773 - SURFACE
      ?auto_9775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9778 ?auto_9777 ) ( IS-CRATE ?auto_9772 ) ( not ( = ?auto_9771 ?auto_9772 ) ) ( not ( = ?auto_9770 ?auto_9771 ) ) ( not ( = ?auto_9770 ?auto_9772 ) ) ( not ( = ?auto_9779 ?auto_9777 ) ) ( HOIST-AT ?auto_9774 ?auto_9779 ) ( not ( = ?auto_9778 ?auto_9774 ) ) ( SURFACE-AT ?auto_9772 ?auto_9779 ) ( ON ?auto_9772 ?auto_9776 ) ( CLEAR ?auto_9772 ) ( not ( = ?auto_9771 ?auto_9776 ) ) ( not ( = ?auto_9772 ?auto_9776 ) ) ( not ( = ?auto_9770 ?auto_9776 ) ) ( SURFACE-AT ?auto_9770 ?auto_9777 ) ( CLEAR ?auto_9770 ) ( IS-CRATE ?auto_9771 ) ( AVAILABLE ?auto_9778 ) ( AVAILABLE ?auto_9774 ) ( SURFACE-AT ?auto_9771 ?auto_9779 ) ( ON ?auto_9771 ?auto_9773 ) ( CLEAR ?auto_9771 ) ( not ( = ?auto_9771 ?auto_9773 ) ) ( not ( = ?auto_9772 ?auto_9773 ) ) ( not ( = ?auto_9770 ?auto_9773 ) ) ( not ( = ?auto_9776 ?auto_9773 ) ) ( TRUCK-AT ?auto_9775 ?auto_9777 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9771 ?auto_9772 )
      ( MAKE-2CRATE-VERIFY ?auto_9770 ?auto_9771 ?auto_9772 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9789 - SURFACE
      ?auto_9790 - SURFACE
    )
    :vars
    (
      ?auto_9791 - HOIST
      ?auto_9792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9791 ?auto_9792 ) ( SURFACE-AT ?auto_9789 ?auto_9792 ) ( CLEAR ?auto_9789 ) ( LIFTING ?auto_9791 ?auto_9790 ) ( IS-CRATE ?auto_9790 ) ( not ( = ?auto_9789 ?auto_9790 ) ) )
    :subtasks
    ( ( !DROP ?auto_9791 ?auto_9790 ?auto_9789 ?auto_9792 )
      ( MAKE-1CRATE-VERIFY ?auto_9789 ?auto_9790 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9793 - SURFACE
      ?auto_9794 - SURFACE
      ?auto_9795 - SURFACE
    )
    :vars
    (
      ?auto_9796 - HOIST
      ?auto_9797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9796 ?auto_9797 ) ( SURFACE-AT ?auto_9794 ?auto_9797 ) ( CLEAR ?auto_9794 ) ( LIFTING ?auto_9796 ?auto_9795 ) ( IS-CRATE ?auto_9795 ) ( not ( = ?auto_9794 ?auto_9795 ) ) ( ON ?auto_9794 ?auto_9793 ) ( not ( = ?auto_9793 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9795 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9794 ?auto_9795 )
      ( MAKE-2CRATE-VERIFY ?auto_9793 ?auto_9794 ?auto_9795 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9798 - SURFACE
      ?auto_9799 - SURFACE
      ?auto_9800 - SURFACE
      ?auto_9801 - SURFACE
    )
    :vars
    (
      ?auto_9802 - HOIST
      ?auto_9803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9802 ?auto_9803 ) ( SURFACE-AT ?auto_9800 ?auto_9803 ) ( CLEAR ?auto_9800 ) ( LIFTING ?auto_9802 ?auto_9801 ) ( IS-CRATE ?auto_9801 ) ( not ( = ?auto_9800 ?auto_9801 ) ) ( ON ?auto_9799 ?auto_9798 ) ( ON ?auto_9800 ?auto_9799 ) ( not ( = ?auto_9798 ?auto_9799 ) ) ( not ( = ?auto_9798 ?auto_9800 ) ) ( not ( = ?auto_9798 ?auto_9801 ) ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( not ( = ?auto_9799 ?auto_9801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9800 ?auto_9801 )
      ( MAKE-3CRATE-VERIFY ?auto_9798 ?auto_9799 ?auto_9800 ?auto_9801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9804 - SURFACE
      ?auto_9805 - SURFACE
    )
    :vars
    (
      ?auto_9806 - HOIST
      ?auto_9807 - PLACE
      ?auto_9808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9806 ?auto_9807 ) ( SURFACE-AT ?auto_9804 ?auto_9807 ) ( CLEAR ?auto_9804 ) ( IS-CRATE ?auto_9805 ) ( not ( = ?auto_9804 ?auto_9805 ) ) ( TRUCK-AT ?auto_9808 ?auto_9807 ) ( AVAILABLE ?auto_9806 ) ( IN ?auto_9805 ?auto_9808 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9806 ?auto_9805 ?auto_9808 ?auto_9807 )
      ( MAKE-1CRATE ?auto_9804 ?auto_9805 )
      ( MAKE-1CRATE-VERIFY ?auto_9804 ?auto_9805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9809 - SURFACE
      ?auto_9810 - SURFACE
      ?auto_9811 - SURFACE
    )
    :vars
    (
      ?auto_9812 - HOIST
      ?auto_9813 - PLACE
      ?auto_9814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9812 ?auto_9813 ) ( SURFACE-AT ?auto_9810 ?auto_9813 ) ( CLEAR ?auto_9810 ) ( IS-CRATE ?auto_9811 ) ( not ( = ?auto_9810 ?auto_9811 ) ) ( TRUCK-AT ?auto_9814 ?auto_9813 ) ( AVAILABLE ?auto_9812 ) ( IN ?auto_9811 ?auto_9814 ) ( ON ?auto_9810 ?auto_9809 ) ( not ( = ?auto_9809 ?auto_9810 ) ) ( not ( = ?auto_9809 ?auto_9811 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9810 ?auto_9811 )
      ( MAKE-2CRATE-VERIFY ?auto_9809 ?auto_9810 ?auto_9811 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9815 - SURFACE
      ?auto_9816 - SURFACE
      ?auto_9817 - SURFACE
      ?auto_9818 - SURFACE
    )
    :vars
    (
      ?auto_9819 - HOIST
      ?auto_9820 - PLACE
      ?auto_9821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9819 ?auto_9820 ) ( SURFACE-AT ?auto_9817 ?auto_9820 ) ( CLEAR ?auto_9817 ) ( IS-CRATE ?auto_9818 ) ( not ( = ?auto_9817 ?auto_9818 ) ) ( TRUCK-AT ?auto_9821 ?auto_9820 ) ( AVAILABLE ?auto_9819 ) ( IN ?auto_9818 ?auto_9821 ) ( ON ?auto_9817 ?auto_9816 ) ( not ( = ?auto_9816 ?auto_9817 ) ) ( not ( = ?auto_9816 ?auto_9818 ) ) ( ON ?auto_9816 ?auto_9815 ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( not ( = ?auto_9815 ?auto_9817 ) ) ( not ( = ?auto_9815 ?auto_9818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9816 ?auto_9817 ?auto_9818 )
      ( MAKE-3CRATE-VERIFY ?auto_9815 ?auto_9816 ?auto_9817 ?auto_9818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9822 - SURFACE
      ?auto_9823 - SURFACE
    )
    :vars
    (
      ?auto_9824 - HOIST
      ?auto_9825 - PLACE
      ?auto_9826 - TRUCK
      ?auto_9827 - SURFACE
      ?auto_9828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9824 ?auto_9825 ) ( SURFACE-AT ?auto_9822 ?auto_9825 ) ( CLEAR ?auto_9822 ) ( IS-CRATE ?auto_9823 ) ( not ( = ?auto_9822 ?auto_9823 ) ) ( AVAILABLE ?auto_9824 ) ( IN ?auto_9823 ?auto_9826 ) ( ON ?auto_9822 ?auto_9827 ) ( not ( = ?auto_9827 ?auto_9822 ) ) ( not ( = ?auto_9827 ?auto_9823 ) ) ( TRUCK-AT ?auto_9826 ?auto_9828 ) ( not ( = ?auto_9828 ?auto_9825 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9826 ?auto_9828 ?auto_9825 )
      ( MAKE-2CRATE ?auto_9827 ?auto_9822 ?auto_9823 )
      ( MAKE-1CRATE-VERIFY ?auto_9822 ?auto_9823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9829 - SURFACE
      ?auto_9830 - SURFACE
      ?auto_9831 - SURFACE
    )
    :vars
    (
      ?auto_9832 - HOIST
      ?auto_9833 - PLACE
      ?auto_9835 - TRUCK
      ?auto_9834 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9832 ?auto_9833 ) ( SURFACE-AT ?auto_9830 ?auto_9833 ) ( CLEAR ?auto_9830 ) ( IS-CRATE ?auto_9831 ) ( not ( = ?auto_9830 ?auto_9831 ) ) ( AVAILABLE ?auto_9832 ) ( IN ?auto_9831 ?auto_9835 ) ( ON ?auto_9830 ?auto_9829 ) ( not ( = ?auto_9829 ?auto_9830 ) ) ( not ( = ?auto_9829 ?auto_9831 ) ) ( TRUCK-AT ?auto_9835 ?auto_9834 ) ( not ( = ?auto_9834 ?auto_9833 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9830 ?auto_9831 )
      ( MAKE-2CRATE-VERIFY ?auto_9829 ?auto_9830 ?auto_9831 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9836 - SURFACE
      ?auto_9837 - SURFACE
      ?auto_9838 - SURFACE
      ?auto_9839 - SURFACE
    )
    :vars
    (
      ?auto_9842 - HOIST
      ?auto_9841 - PLACE
      ?auto_9843 - TRUCK
      ?auto_9840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9842 ?auto_9841 ) ( SURFACE-AT ?auto_9838 ?auto_9841 ) ( CLEAR ?auto_9838 ) ( IS-CRATE ?auto_9839 ) ( not ( = ?auto_9838 ?auto_9839 ) ) ( AVAILABLE ?auto_9842 ) ( IN ?auto_9839 ?auto_9843 ) ( ON ?auto_9838 ?auto_9837 ) ( not ( = ?auto_9837 ?auto_9838 ) ) ( not ( = ?auto_9837 ?auto_9839 ) ) ( TRUCK-AT ?auto_9843 ?auto_9840 ) ( not ( = ?auto_9840 ?auto_9841 ) ) ( ON ?auto_9837 ?auto_9836 ) ( not ( = ?auto_9836 ?auto_9837 ) ) ( not ( = ?auto_9836 ?auto_9838 ) ) ( not ( = ?auto_9836 ?auto_9839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9837 ?auto_9838 ?auto_9839 )
      ( MAKE-3CRATE-VERIFY ?auto_9836 ?auto_9837 ?auto_9838 ?auto_9839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9844 - SURFACE
      ?auto_9845 - SURFACE
    )
    :vars
    (
      ?auto_9848 - HOIST
      ?auto_9847 - PLACE
      ?auto_9849 - SURFACE
      ?auto_9850 - TRUCK
      ?auto_9846 - PLACE
      ?auto_9851 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9848 ?auto_9847 ) ( SURFACE-AT ?auto_9844 ?auto_9847 ) ( CLEAR ?auto_9844 ) ( IS-CRATE ?auto_9845 ) ( not ( = ?auto_9844 ?auto_9845 ) ) ( AVAILABLE ?auto_9848 ) ( ON ?auto_9844 ?auto_9849 ) ( not ( = ?auto_9849 ?auto_9844 ) ) ( not ( = ?auto_9849 ?auto_9845 ) ) ( TRUCK-AT ?auto_9850 ?auto_9846 ) ( not ( = ?auto_9846 ?auto_9847 ) ) ( HOIST-AT ?auto_9851 ?auto_9846 ) ( LIFTING ?auto_9851 ?auto_9845 ) ( not ( = ?auto_9848 ?auto_9851 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9851 ?auto_9845 ?auto_9850 ?auto_9846 )
      ( MAKE-2CRATE ?auto_9849 ?auto_9844 ?auto_9845 )
      ( MAKE-1CRATE-VERIFY ?auto_9844 ?auto_9845 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9852 - SURFACE
      ?auto_9853 - SURFACE
      ?auto_9854 - SURFACE
    )
    :vars
    (
      ?auto_9859 - HOIST
      ?auto_9857 - PLACE
      ?auto_9855 - TRUCK
      ?auto_9856 - PLACE
      ?auto_9858 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9859 ?auto_9857 ) ( SURFACE-AT ?auto_9853 ?auto_9857 ) ( CLEAR ?auto_9853 ) ( IS-CRATE ?auto_9854 ) ( not ( = ?auto_9853 ?auto_9854 ) ) ( AVAILABLE ?auto_9859 ) ( ON ?auto_9853 ?auto_9852 ) ( not ( = ?auto_9852 ?auto_9853 ) ) ( not ( = ?auto_9852 ?auto_9854 ) ) ( TRUCK-AT ?auto_9855 ?auto_9856 ) ( not ( = ?auto_9856 ?auto_9857 ) ) ( HOIST-AT ?auto_9858 ?auto_9856 ) ( LIFTING ?auto_9858 ?auto_9854 ) ( not ( = ?auto_9859 ?auto_9858 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9853 ?auto_9854 )
      ( MAKE-2CRATE-VERIFY ?auto_9852 ?auto_9853 ?auto_9854 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9860 - SURFACE
      ?auto_9861 - SURFACE
      ?auto_9862 - SURFACE
      ?auto_9863 - SURFACE
    )
    :vars
    (
      ?auto_9866 - HOIST
      ?auto_9867 - PLACE
      ?auto_9864 - TRUCK
      ?auto_9868 - PLACE
      ?auto_9865 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9866 ?auto_9867 ) ( SURFACE-AT ?auto_9862 ?auto_9867 ) ( CLEAR ?auto_9862 ) ( IS-CRATE ?auto_9863 ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( AVAILABLE ?auto_9866 ) ( ON ?auto_9862 ?auto_9861 ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( not ( = ?auto_9861 ?auto_9863 ) ) ( TRUCK-AT ?auto_9864 ?auto_9868 ) ( not ( = ?auto_9868 ?auto_9867 ) ) ( HOIST-AT ?auto_9865 ?auto_9868 ) ( LIFTING ?auto_9865 ?auto_9863 ) ( not ( = ?auto_9866 ?auto_9865 ) ) ( ON ?auto_9861 ?auto_9860 ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9860 ?auto_9863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9861 ?auto_9862 ?auto_9863 )
      ( MAKE-3CRATE-VERIFY ?auto_9860 ?auto_9861 ?auto_9862 ?auto_9863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9869 - SURFACE
      ?auto_9870 - SURFACE
    )
    :vars
    (
      ?auto_9873 - HOIST
      ?auto_9874 - PLACE
      ?auto_9875 - SURFACE
      ?auto_9871 - TRUCK
      ?auto_9876 - PLACE
      ?auto_9872 - HOIST
      ?auto_9877 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9873 ?auto_9874 ) ( SURFACE-AT ?auto_9869 ?auto_9874 ) ( CLEAR ?auto_9869 ) ( IS-CRATE ?auto_9870 ) ( not ( = ?auto_9869 ?auto_9870 ) ) ( AVAILABLE ?auto_9873 ) ( ON ?auto_9869 ?auto_9875 ) ( not ( = ?auto_9875 ?auto_9869 ) ) ( not ( = ?auto_9875 ?auto_9870 ) ) ( TRUCK-AT ?auto_9871 ?auto_9876 ) ( not ( = ?auto_9876 ?auto_9874 ) ) ( HOIST-AT ?auto_9872 ?auto_9876 ) ( not ( = ?auto_9873 ?auto_9872 ) ) ( AVAILABLE ?auto_9872 ) ( SURFACE-AT ?auto_9870 ?auto_9876 ) ( ON ?auto_9870 ?auto_9877 ) ( CLEAR ?auto_9870 ) ( not ( = ?auto_9869 ?auto_9877 ) ) ( not ( = ?auto_9870 ?auto_9877 ) ) ( not ( = ?auto_9875 ?auto_9877 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9872 ?auto_9870 ?auto_9877 ?auto_9876 )
      ( MAKE-2CRATE ?auto_9875 ?auto_9869 ?auto_9870 )
      ( MAKE-1CRATE-VERIFY ?auto_9869 ?auto_9870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9878 - SURFACE
      ?auto_9879 - SURFACE
      ?auto_9880 - SURFACE
    )
    :vars
    (
      ?auto_9882 - HOIST
      ?auto_9881 - PLACE
      ?auto_9885 - TRUCK
      ?auto_9884 - PLACE
      ?auto_9886 - HOIST
      ?auto_9883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9882 ?auto_9881 ) ( SURFACE-AT ?auto_9879 ?auto_9881 ) ( CLEAR ?auto_9879 ) ( IS-CRATE ?auto_9880 ) ( not ( = ?auto_9879 ?auto_9880 ) ) ( AVAILABLE ?auto_9882 ) ( ON ?auto_9879 ?auto_9878 ) ( not ( = ?auto_9878 ?auto_9879 ) ) ( not ( = ?auto_9878 ?auto_9880 ) ) ( TRUCK-AT ?auto_9885 ?auto_9884 ) ( not ( = ?auto_9884 ?auto_9881 ) ) ( HOIST-AT ?auto_9886 ?auto_9884 ) ( not ( = ?auto_9882 ?auto_9886 ) ) ( AVAILABLE ?auto_9886 ) ( SURFACE-AT ?auto_9880 ?auto_9884 ) ( ON ?auto_9880 ?auto_9883 ) ( CLEAR ?auto_9880 ) ( not ( = ?auto_9879 ?auto_9883 ) ) ( not ( = ?auto_9880 ?auto_9883 ) ) ( not ( = ?auto_9878 ?auto_9883 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9879 ?auto_9880 )
      ( MAKE-2CRATE-VERIFY ?auto_9878 ?auto_9879 ?auto_9880 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9887 - SURFACE
      ?auto_9888 - SURFACE
      ?auto_9889 - SURFACE
      ?auto_9890 - SURFACE
    )
    :vars
    (
      ?auto_9891 - HOIST
      ?auto_9892 - PLACE
      ?auto_9893 - TRUCK
      ?auto_9896 - PLACE
      ?auto_9894 - HOIST
      ?auto_9895 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9891 ?auto_9892 ) ( SURFACE-AT ?auto_9889 ?auto_9892 ) ( CLEAR ?auto_9889 ) ( IS-CRATE ?auto_9890 ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( AVAILABLE ?auto_9891 ) ( ON ?auto_9889 ?auto_9888 ) ( not ( = ?auto_9888 ?auto_9889 ) ) ( not ( = ?auto_9888 ?auto_9890 ) ) ( TRUCK-AT ?auto_9893 ?auto_9896 ) ( not ( = ?auto_9896 ?auto_9892 ) ) ( HOIST-AT ?auto_9894 ?auto_9896 ) ( not ( = ?auto_9891 ?auto_9894 ) ) ( AVAILABLE ?auto_9894 ) ( SURFACE-AT ?auto_9890 ?auto_9896 ) ( ON ?auto_9890 ?auto_9895 ) ( CLEAR ?auto_9890 ) ( not ( = ?auto_9889 ?auto_9895 ) ) ( not ( = ?auto_9890 ?auto_9895 ) ) ( not ( = ?auto_9888 ?auto_9895 ) ) ( ON ?auto_9888 ?auto_9887 ) ( not ( = ?auto_9887 ?auto_9888 ) ) ( not ( = ?auto_9887 ?auto_9889 ) ) ( not ( = ?auto_9887 ?auto_9890 ) ) ( not ( = ?auto_9887 ?auto_9895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9888 ?auto_9889 ?auto_9890 )
      ( MAKE-3CRATE-VERIFY ?auto_9887 ?auto_9888 ?auto_9889 ?auto_9890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9897 - SURFACE
      ?auto_9898 - SURFACE
    )
    :vars
    (
      ?auto_9899 - HOIST
      ?auto_9900 - PLACE
      ?auto_9901 - SURFACE
      ?auto_9905 - PLACE
      ?auto_9903 - HOIST
      ?auto_9904 - SURFACE
      ?auto_9902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9899 ?auto_9900 ) ( SURFACE-AT ?auto_9897 ?auto_9900 ) ( CLEAR ?auto_9897 ) ( IS-CRATE ?auto_9898 ) ( not ( = ?auto_9897 ?auto_9898 ) ) ( AVAILABLE ?auto_9899 ) ( ON ?auto_9897 ?auto_9901 ) ( not ( = ?auto_9901 ?auto_9897 ) ) ( not ( = ?auto_9901 ?auto_9898 ) ) ( not ( = ?auto_9905 ?auto_9900 ) ) ( HOIST-AT ?auto_9903 ?auto_9905 ) ( not ( = ?auto_9899 ?auto_9903 ) ) ( AVAILABLE ?auto_9903 ) ( SURFACE-AT ?auto_9898 ?auto_9905 ) ( ON ?auto_9898 ?auto_9904 ) ( CLEAR ?auto_9898 ) ( not ( = ?auto_9897 ?auto_9904 ) ) ( not ( = ?auto_9898 ?auto_9904 ) ) ( not ( = ?auto_9901 ?auto_9904 ) ) ( TRUCK-AT ?auto_9902 ?auto_9900 ) )
    :subtasks
    ( ( !DRIVE ?auto_9902 ?auto_9900 ?auto_9905 )
      ( MAKE-2CRATE ?auto_9901 ?auto_9897 ?auto_9898 )
      ( MAKE-1CRATE-VERIFY ?auto_9897 ?auto_9898 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9906 - SURFACE
      ?auto_9907 - SURFACE
      ?auto_9908 - SURFACE
    )
    :vars
    (
      ?auto_9910 - HOIST
      ?auto_9914 - PLACE
      ?auto_9912 - PLACE
      ?auto_9911 - HOIST
      ?auto_9909 - SURFACE
      ?auto_9913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9910 ?auto_9914 ) ( SURFACE-AT ?auto_9907 ?auto_9914 ) ( CLEAR ?auto_9907 ) ( IS-CRATE ?auto_9908 ) ( not ( = ?auto_9907 ?auto_9908 ) ) ( AVAILABLE ?auto_9910 ) ( ON ?auto_9907 ?auto_9906 ) ( not ( = ?auto_9906 ?auto_9907 ) ) ( not ( = ?auto_9906 ?auto_9908 ) ) ( not ( = ?auto_9912 ?auto_9914 ) ) ( HOIST-AT ?auto_9911 ?auto_9912 ) ( not ( = ?auto_9910 ?auto_9911 ) ) ( AVAILABLE ?auto_9911 ) ( SURFACE-AT ?auto_9908 ?auto_9912 ) ( ON ?auto_9908 ?auto_9909 ) ( CLEAR ?auto_9908 ) ( not ( = ?auto_9907 ?auto_9909 ) ) ( not ( = ?auto_9908 ?auto_9909 ) ) ( not ( = ?auto_9906 ?auto_9909 ) ) ( TRUCK-AT ?auto_9913 ?auto_9914 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9907 ?auto_9908 )
      ( MAKE-2CRATE-VERIFY ?auto_9906 ?auto_9907 ?auto_9908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9915 - SURFACE
      ?auto_9916 - SURFACE
      ?auto_9917 - SURFACE
      ?auto_9918 - SURFACE
    )
    :vars
    (
      ?auto_9923 - HOIST
      ?auto_9921 - PLACE
      ?auto_9919 - PLACE
      ?auto_9924 - HOIST
      ?auto_9922 - SURFACE
      ?auto_9920 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9923 ?auto_9921 ) ( SURFACE-AT ?auto_9917 ?auto_9921 ) ( CLEAR ?auto_9917 ) ( IS-CRATE ?auto_9918 ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( AVAILABLE ?auto_9923 ) ( ON ?auto_9917 ?auto_9916 ) ( not ( = ?auto_9916 ?auto_9917 ) ) ( not ( = ?auto_9916 ?auto_9918 ) ) ( not ( = ?auto_9919 ?auto_9921 ) ) ( HOIST-AT ?auto_9924 ?auto_9919 ) ( not ( = ?auto_9923 ?auto_9924 ) ) ( AVAILABLE ?auto_9924 ) ( SURFACE-AT ?auto_9918 ?auto_9919 ) ( ON ?auto_9918 ?auto_9922 ) ( CLEAR ?auto_9918 ) ( not ( = ?auto_9917 ?auto_9922 ) ) ( not ( = ?auto_9918 ?auto_9922 ) ) ( not ( = ?auto_9916 ?auto_9922 ) ) ( TRUCK-AT ?auto_9920 ?auto_9921 ) ( ON ?auto_9916 ?auto_9915 ) ( not ( = ?auto_9915 ?auto_9916 ) ) ( not ( = ?auto_9915 ?auto_9917 ) ) ( not ( = ?auto_9915 ?auto_9918 ) ) ( not ( = ?auto_9915 ?auto_9922 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9916 ?auto_9917 ?auto_9918 )
      ( MAKE-3CRATE-VERIFY ?auto_9915 ?auto_9916 ?auto_9917 ?auto_9918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9925 - SURFACE
      ?auto_9926 - SURFACE
    )
    :vars
    (
      ?auto_9932 - HOIST
      ?auto_9929 - PLACE
      ?auto_9931 - SURFACE
      ?auto_9927 - PLACE
      ?auto_9933 - HOIST
      ?auto_9930 - SURFACE
      ?auto_9928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9932 ?auto_9929 ) ( IS-CRATE ?auto_9926 ) ( not ( = ?auto_9925 ?auto_9926 ) ) ( not ( = ?auto_9931 ?auto_9925 ) ) ( not ( = ?auto_9931 ?auto_9926 ) ) ( not ( = ?auto_9927 ?auto_9929 ) ) ( HOIST-AT ?auto_9933 ?auto_9927 ) ( not ( = ?auto_9932 ?auto_9933 ) ) ( AVAILABLE ?auto_9933 ) ( SURFACE-AT ?auto_9926 ?auto_9927 ) ( ON ?auto_9926 ?auto_9930 ) ( CLEAR ?auto_9926 ) ( not ( = ?auto_9925 ?auto_9930 ) ) ( not ( = ?auto_9926 ?auto_9930 ) ) ( not ( = ?auto_9931 ?auto_9930 ) ) ( TRUCK-AT ?auto_9928 ?auto_9929 ) ( SURFACE-AT ?auto_9931 ?auto_9929 ) ( CLEAR ?auto_9931 ) ( LIFTING ?auto_9932 ?auto_9925 ) ( IS-CRATE ?auto_9925 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9931 ?auto_9925 )
      ( MAKE-2CRATE ?auto_9931 ?auto_9925 ?auto_9926 )
      ( MAKE-1CRATE-VERIFY ?auto_9925 ?auto_9926 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9934 - SURFACE
      ?auto_9935 - SURFACE
      ?auto_9936 - SURFACE
    )
    :vars
    (
      ?auto_9940 - HOIST
      ?auto_9941 - PLACE
      ?auto_9937 - PLACE
      ?auto_9938 - HOIST
      ?auto_9942 - SURFACE
      ?auto_9939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9940 ?auto_9941 ) ( IS-CRATE ?auto_9936 ) ( not ( = ?auto_9935 ?auto_9936 ) ) ( not ( = ?auto_9934 ?auto_9935 ) ) ( not ( = ?auto_9934 ?auto_9936 ) ) ( not ( = ?auto_9937 ?auto_9941 ) ) ( HOIST-AT ?auto_9938 ?auto_9937 ) ( not ( = ?auto_9940 ?auto_9938 ) ) ( AVAILABLE ?auto_9938 ) ( SURFACE-AT ?auto_9936 ?auto_9937 ) ( ON ?auto_9936 ?auto_9942 ) ( CLEAR ?auto_9936 ) ( not ( = ?auto_9935 ?auto_9942 ) ) ( not ( = ?auto_9936 ?auto_9942 ) ) ( not ( = ?auto_9934 ?auto_9942 ) ) ( TRUCK-AT ?auto_9939 ?auto_9941 ) ( SURFACE-AT ?auto_9934 ?auto_9941 ) ( CLEAR ?auto_9934 ) ( LIFTING ?auto_9940 ?auto_9935 ) ( IS-CRATE ?auto_9935 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9935 ?auto_9936 )
      ( MAKE-2CRATE-VERIFY ?auto_9934 ?auto_9935 ?auto_9936 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9943 - SURFACE
      ?auto_9944 - SURFACE
      ?auto_9945 - SURFACE
      ?auto_9946 - SURFACE
    )
    :vars
    (
      ?auto_9949 - HOIST
      ?auto_9947 - PLACE
      ?auto_9952 - PLACE
      ?auto_9951 - HOIST
      ?auto_9948 - SURFACE
      ?auto_9950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9949 ?auto_9947 ) ( IS-CRATE ?auto_9946 ) ( not ( = ?auto_9945 ?auto_9946 ) ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( not ( = ?auto_9944 ?auto_9946 ) ) ( not ( = ?auto_9952 ?auto_9947 ) ) ( HOIST-AT ?auto_9951 ?auto_9952 ) ( not ( = ?auto_9949 ?auto_9951 ) ) ( AVAILABLE ?auto_9951 ) ( SURFACE-AT ?auto_9946 ?auto_9952 ) ( ON ?auto_9946 ?auto_9948 ) ( CLEAR ?auto_9946 ) ( not ( = ?auto_9945 ?auto_9948 ) ) ( not ( = ?auto_9946 ?auto_9948 ) ) ( not ( = ?auto_9944 ?auto_9948 ) ) ( TRUCK-AT ?auto_9950 ?auto_9947 ) ( SURFACE-AT ?auto_9944 ?auto_9947 ) ( CLEAR ?auto_9944 ) ( LIFTING ?auto_9949 ?auto_9945 ) ( IS-CRATE ?auto_9945 ) ( ON ?auto_9944 ?auto_9943 ) ( not ( = ?auto_9943 ?auto_9944 ) ) ( not ( = ?auto_9943 ?auto_9945 ) ) ( not ( = ?auto_9943 ?auto_9946 ) ) ( not ( = ?auto_9943 ?auto_9948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9944 ?auto_9945 ?auto_9946 )
      ( MAKE-3CRATE-VERIFY ?auto_9943 ?auto_9944 ?auto_9945 ?auto_9946 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9953 - SURFACE
      ?auto_9954 - SURFACE
    )
    :vars
    (
      ?auto_9957 - HOIST
      ?auto_9955 - PLACE
      ?auto_9959 - SURFACE
      ?auto_9961 - PLACE
      ?auto_9960 - HOIST
      ?auto_9956 - SURFACE
      ?auto_9958 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9957 ?auto_9955 ) ( IS-CRATE ?auto_9954 ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( not ( = ?auto_9959 ?auto_9953 ) ) ( not ( = ?auto_9959 ?auto_9954 ) ) ( not ( = ?auto_9961 ?auto_9955 ) ) ( HOIST-AT ?auto_9960 ?auto_9961 ) ( not ( = ?auto_9957 ?auto_9960 ) ) ( AVAILABLE ?auto_9960 ) ( SURFACE-AT ?auto_9954 ?auto_9961 ) ( ON ?auto_9954 ?auto_9956 ) ( CLEAR ?auto_9954 ) ( not ( = ?auto_9953 ?auto_9956 ) ) ( not ( = ?auto_9954 ?auto_9956 ) ) ( not ( = ?auto_9959 ?auto_9956 ) ) ( TRUCK-AT ?auto_9958 ?auto_9955 ) ( SURFACE-AT ?auto_9959 ?auto_9955 ) ( CLEAR ?auto_9959 ) ( IS-CRATE ?auto_9953 ) ( AVAILABLE ?auto_9957 ) ( IN ?auto_9953 ?auto_9958 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9957 ?auto_9953 ?auto_9958 ?auto_9955 )
      ( MAKE-2CRATE ?auto_9959 ?auto_9953 ?auto_9954 )
      ( MAKE-1CRATE-VERIFY ?auto_9953 ?auto_9954 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9962 - SURFACE
      ?auto_9963 - SURFACE
      ?auto_9964 - SURFACE
    )
    :vars
    (
      ?auto_9967 - HOIST
      ?auto_9966 - PLACE
      ?auto_9965 - PLACE
      ?auto_9969 - HOIST
      ?auto_9970 - SURFACE
      ?auto_9968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9967 ?auto_9966 ) ( IS-CRATE ?auto_9964 ) ( not ( = ?auto_9963 ?auto_9964 ) ) ( not ( = ?auto_9962 ?auto_9963 ) ) ( not ( = ?auto_9962 ?auto_9964 ) ) ( not ( = ?auto_9965 ?auto_9966 ) ) ( HOIST-AT ?auto_9969 ?auto_9965 ) ( not ( = ?auto_9967 ?auto_9969 ) ) ( AVAILABLE ?auto_9969 ) ( SURFACE-AT ?auto_9964 ?auto_9965 ) ( ON ?auto_9964 ?auto_9970 ) ( CLEAR ?auto_9964 ) ( not ( = ?auto_9963 ?auto_9970 ) ) ( not ( = ?auto_9964 ?auto_9970 ) ) ( not ( = ?auto_9962 ?auto_9970 ) ) ( TRUCK-AT ?auto_9968 ?auto_9966 ) ( SURFACE-AT ?auto_9962 ?auto_9966 ) ( CLEAR ?auto_9962 ) ( IS-CRATE ?auto_9963 ) ( AVAILABLE ?auto_9967 ) ( IN ?auto_9963 ?auto_9968 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9963 ?auto_9964 )
      ( MAKE-2CRATE-VERIFY ?auto_9962 ?auto_9963 ?auto_9964 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9971 - SURFACE
      ?auto_9972 - SURFACE
      ?auto_9973 - SURFACE
      ?auto_9974 - SURFACE
    )
    :vars
    (
      ?auto_9975 - HOIST
      ?auto_9976 - PLACE
      ?auto_9977 - PLACE
      ?auto_9980 - HOIST
      ?auto_9978 - SURFACE
      ?auto_9979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9975 ?auto_9976 ) ( IS-CRATE ?auto_9974 ) ( not ( = ?auto_9973 ?auto_9974 ) ) ( not ( = ?auto_9972 ?auto_9973 ) ) ( not ( = ?auto_9972 ?auto_9974 ) ) ( not ( = ?auto_9977 ?auto_9976 ) ) ( HOIST-AT ?auto_9980 ?auto_9977 ) ( not ( = ?auto_9975 ?auto_9980 ) ) ( AVAILABLE ?auto_9980 ) ( SURFACE-AT ?auto_9974 ?auto_9977 ) ( ON ?auto_9974 ?auto_9978 ) ( CLEAR ?auto_9974 ) ( not ( = ?auto_9973 ?auto_9978 ) ) ( not ( = ?auto_9974 ?auto_9978 ) ) ( not ( = ?auto_9972 ?auto_9978 ) ) ( TRUCK-AT ?auto_9979 ?auto_9976 ) ( SURFACE-AT ?auto_9972 ?auto_9976 ) ( CLEAR ?auto_9972 ) ( IS-CRATE ?auto_9973 ) ( AVAILABLE ?auto_9975 ) ( IN ?auto_9973 ?auto_9979 ) ( ON ?auto_9972 ?auto_9971 ) ( not ( = ?auto_9971 ?auto_9972 ) ) ( not ( = ?auto_9971 ?auto_9973 ) ) ( not ( = ?auto_9971 ?auto_9974 ) ) ( not ( = ?auto_9971 ?auto_9978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9972 ?auto_9973 ?auto_9974 )
      ( MAKE-3CRATE-VERIFY ?auto_9971 ?auto_9972 ?auto_9973 ?auto_9974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9981 - SURFACE
      ?auto_9982 - SURFACE
    )
    :vars
    (
      ?auto_9983 - HOIST
      ?auto_9984 - PLACE
      ?auto_9989 - SURFACE
      ?auto_9985 - PLACE
      ?auto_9988 - HOIST
      ?auto_9986 - SURFACE
      ?auto_9987 - TRUCK
      ?auto_9990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9983 ?auto_9984 ) ( IS-CRATE ?auto_9982 ) ( not ( = ?auto_9981 ?auto_9982 ) ) ( not ( = ?auto_9989 ?auto_9981 ) ) ( not ( = ?auto_9989 ?auto_9982 ) ) ( not ( = ?auto_9985 ?auto_9984 ) ) ( HOIST-AT ?auto_9988 ?auto_9985 ) ( not ( = ?auto_9983 ?auto_9988 ) ) ( AVAILABLE ?auto_9988 ) ( SURFACE-AT ?auto_9982 ?auto_9985 ) ( ON ?auto_9982 ?auto_9986 ) ( CLEAR ?auto_9982 ) ( not ( = ?auto_9981 ?auto_9986 ) ) ( not ( = ?auto_9982 ?auto_9986 ) ) ( not ( = ?auto_9989 ?auto_9986 ) ) ( SURFACE-AT ?auto_9989 ?auto_9984 ) ( CLEAR ?auto_9989 ) ( IS-CRATE ?auto_9981 ) ( AVAILABLE ?auto_9983 ) ( IN ?auto_9981 ?auto_9987 ) ( TRUCK-AT ?auto_9987 ?auto_9990 ) ( not ( = ?auto_9990 ?auto_9984 ) ) ( not ( = ?auto_9985 ?auto_9990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9987 ?auto_9990 ?auto_9984 )
      ( MAKE-2CRATE ?auto_9989 ?auto_9981 ?auto_9982 )
      ( MAKE-1CRATE-VERIFY ?auto_9981 ?auto_9982 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9991 - SURFACE
      ?auto_9992 - SURFACE
      ?auto_9993 - SURFACE
    )
    :vars
    (
      ?auto_9997 - HOIST
      ?auto_10000 - PLACE
      ?auto_9995 - PLACE
      ?auto_9999 - HOIST
      ?auto_9996 - SURFACE
      ?auto_9998 - TRUCK
      ?auto_9994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9997 ?auto_10000 ) ( IS-CRATE ?auto_9993 ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( not ( = ?auto_9991 ?auto_9992 ) ) ( not ( = ?auto_9991 ?auto_9993 ) ) ( not ( = ?auto_9995 ?auto_10000 ) ) ( HOIST-AT ?auto_9999 ?auto_9995 ) ( not ( = ?auto_9997 ?auto_9999 ) ) ( AVAILABLE ?auto_9999 ) ( SURFACE-AT ?auto_9993 ?auto_9995 ) ( ON ?auto_9993 ?auto_9996 ) ( CLEAR ?auto_9993 ) ( not ( = ?auto_9992 ?auto_9996 ) ) ( not ( = ?auto_9993 ?auto_9996 ) ) ( not ( = ?auto_9991 ?auto_9996 ) ) ( SURFACE-AT ?auto_9991 ?auto_10000 ) ( CLEAR ?auto_9991 ) ( IS-CRATE ?auto_9992 ) ( AVAILABLE ?auto_9997 ) ( IN ?auto_9992 ?auto_9998 ) ( TRUCK-AT ?auto_9998 ?auto_9994 ) ( not ( = ?auto_9994 ?auto_10000 ) ) ( not ( = ?auto_9995 ?auto_9994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9992 ?auto_9993 )
      ( MAKE-2CRATE-VERIFY ?auto_9991 ?auto_9992 ?auto_9993 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10001 - SURFACE
      ?auto_10002 - SURFACE
      ?auto_10003 - SURFACE
      ?auto_10004 - SURFACE
    )
    :vars
    (
      ?auto_10008 - HOIST
      ?auto_10007 - PLACE
      ?auto_10009 - PLACE
      ?auto_10006 - HOIST
      ?auto_10011 - SURFACE
      ?auto_10010 - TRUCK
      ?auto_10005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10008 ?auto_10007 ) ( IS-CRATE ?auto_10004 ) ( not ( = ?auto_10003 ?auto_10004 ) ) ( not ( = ?auto_10002 ?auto_10003 ) ) ( not ( = ?auto_10002 ?auto_10004 ) ) ( not ( = ?auto_10009 ?auto_10007 ) ) ( HOIST-AT ?auto_10006 ?auto_10009 ) ( not ( = ?auto_10008 ?auto_10006 ) ) ( AVAILABLE ?auto_10006 ) ( SURFACE-AT ?auto_10004 ?auto_10009 ) ( ON ?auto_10004 ?auto_10011 ) ( CLEAR ?auto_10004 ) ( not ( = ?auto_10003 ?auto_10011 ) ) ( not ( = ?auto_10004 ?auto_10011 ) ) ( not ( = ?auto_10002 ?auto_10011 ) ) ( SURFACE-AT ?auto_10002 ?auto_10007 ) ( CLEAR ?auto_10002 ) ( IS-CRATE ?auto_10003 ) ( AVAILABLE ?auto_10008 ) ( IN ?auto_10003 ?auto_10010 ) ( TRUCK-AT ?auto_10010 ?auto_10005 ) ( not ( = ?auto_10005 ?auto_10007 ) ) ( not ( = ?auto_10009 ?auto_10005 ) ) ( ON ?auto_10002 ?auto_10001 ) ( not ( = ?auto_10001 ?auto_10002 ) ) ( not ( = ?auto_10001 ?auto_10003 ) ) ( not ( = ?auto_10001 ?auto_10004 ) ) ( not ( = ?auto_10001 ?auto_10011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10002 ?auto_10003 ?auto_10004 )
      ( MAKE-3CRATE-VERIFY ?auto_10001 ?auto_10002 ?auto_10003 ?auto_10004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10012 - SURFACE
      ?auto_10013 - SURFACE
    )
    :vars
    (
      ?auto_10018 - HOIST
      ?auto_10017 - PLACE
      ?auto_10015 - SURFACE
      ?auto_10019 - PLACE
      ?auto_10016 - HOIST
      ?auto_10021 - SURFACE
      ?auto_10020 - TRUCK
      ?auto_10014 - PLACE
      ?auto_10022 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10018 ?auto_10017 ) ( IS-CRATE ?auto_10013 ) ( not ( = ?auto_10012 ?auto_10013 ) ) ( not ( = ?auto_10015 ?auto_10012 ) ) ( not ( = ?auto_10015 ?auto_10013 ) ) ( not ( = ?auto_10019 ?auto_10017 ) ) ( HOIST-AT ?auto_10016 ?auto_10019 ) ( not ( = ?auto_10018 ?auto_10016 ) ) ( AVAILABLE ?auto_10016 ) ( SURFACE-AT ?auto_10013 ?auto_10019 ) ( ON ?auto_10013 ?auto_10021 ) ( CLEAR ?auto_10013 ) ( not ( = ?auto_10012 ?auto_10021 ) ) ( not ( = ?auto_10013 ?auto_10021 ) ) ( not ( = ?auto_10015 ?auto_10021 ) ) ( SURFACE-AT ?auto_10015 ?auto_10017 ) ( CLEAR ?auto_10015 ) ( IS-CRATE ?auto_10012 ) ( AVAILABLE ?auto_10018 ) ( TRUCK-AT ?auto_10020 ?auto_10014 ) ( not ( = ?auto_10014 ?auto_10017 ) ) ( not ( = ?auto_10019 ?auto_10014 ) ) ( HOIST-AT ?auto_10022 ?auto_10014 ) ( LIFTING ?auto_10022 ?auto_10012 ) ( not ( = ?auto_10018 ?auto_10022 ) ) ( not ( = ?auto_10016 ?auto_10022 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10022 ?auto_10012 ?auto_10020 ?auto_10014 )
      ( MAKE-2CRATE ?auto_10015 ?auto_10012 ?auto_10013 )
      ( MAKE-1CRATE-VERIFY ?auto_10012 ?auto_10013 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10023 - SURFACE
      ?auto_10024 - SURFACE
      ?auto_10025 - SURFACE
    )
    :vars
    (
      ?auto_10032 - HOIST
      ?auto_10031 - PLACE
      ?auto_10029 - PLACE
      ?auto_10026 - HOIST
      ?auto_10033 - SURFACE
      ?auto_10030 - TRUCK
      ?auto_10027 - PLACE
      ?auto_10028 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10032 ?auto_10031 ) ( IS-CRATE ?auto_10025 ) ( not ( = ?auto_10024 ?auto_10025 ) ) ( not ( = ?auto_10023 ?auto_10024 ) ) ( not ( = ?auto_10023 ?auto_10025 ) ) ( not ( = ?auto_10029 ?auto_10031 ) ) ( HOIST-AT ?auto_10026 ?auto_10029 ) ( not ( = ?auto_10032 ?auto_10026 ) ) ( AVAILABLE ?auto_10026 ) ( SURFACE-AT ?auto_10025 ?auto_10029 ) ( ON ?auto_10025 ?auto_10033 ) ( CLEAR ?auto_10025 ) ( not ( = ?auto_10024 ?auto_10033 ) ) ( not ( = ?auto_10025 ?auto_10033 ) ) ( not ( = ?auto_10023 ?auto_10033 ) ) ( SURFACE-AT ?auto_10023 ?auto_10031 ) ( CLEAR ?auto_10023 ) ( IS-CRATE ?auto_10024 ) ( AVAILABLE ?auto_10032 ) ( TRUCK-AT ?auto_10030 ?auto_10027 ) ( not ( = ?auto_10027 ?auto_10031 ) ) ( not ( = ?auto_10029 ?auto_10027 ) ) ( HOIST-AT ?auto_10028 ?auto_10027 ) ( LIFTING ?auto_10028 ?auto_10024 ) ( not ( = ?auto_10032 ?auto_10028 ) ) ( not ( = ?auto_10026 ?auto_10028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10024 ?auto_10025 )
      ( MAKE-2CRATE-VERIFY ?auto_10023 ?auto_10024 ?auto_10025 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10034 - SURFACE
      ?auto_10035 - SURFACE
      ?auto_10036 - SURFACE
      ?auto_10037 - SURFACE
    )
    :vars
    (
      ?auto_10039 - HOIST
      ?auto_10038 - PLACE
      ?auto_10043 - PLACE
      ?auto_10042 - HOIST
      ?auto_10044 - SURFACE
      ?auto_10040 - TRUCK
      ?auto_10041 - PLACE
      ?auto_10045 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10039 ?auto_10038 ) ( IS-CRATE ?auto_10037 ) ( not ( = ?auto_10036 ?auto_10037 ) ) ( not ( = ?auto_10035 ?auto_10036 ) ) ( not ( = ?auto_10035 ?auto_10037 ) ) ( not ( = ?auto_10043 ?auto_10038 ) ) ( HOIST-AT ?auto_10042 ?auto_10043 ) ( not ( = ?auto_10039 ?auto_10042 ) ) ( AVAILABLE ?auto_10042 ) ( SURFACE-AT ?auto_10037 ?auto_10043 ) ( ON ?auto_10037 ?auto_10044 ) ( CLEAR ?auto_10037 ) ( not ( = ?auto_10036 ?auto_10044 ) ) ( not ( = ?auto_10037 ?auto_10044 ) ) ( not ( = ?auto_10035 ?auto_10044 ) ) ( SURFACE-AT ?auto_10035 ?auto_10038 ) ( CLEAR ?auto_10035 ) ( IS-CRATE ?auto_10036 ) ( AVAILABLE ?auto_10039 ) ( TRUCK-AT ?auto_10040 ?auto_10041 ) ( not ( = ?auto_10041 ?auto_10038 ) ) ( not ( = ?auto_10043 ?auto_10041 ) ) ( HOIST-AT ?auto_10045 ?auto_10041 ) ( LIFTING ?auto_10045 ?auto_10036 ) ( not ( = ?auto_10039 ?auto_10045 ) ) ( not ( = ?auto_10042 ?auto_10045 ) ) ( ON ?auto_10035 ?auto_10034 ) ( not ( = ?auto_10034 ?auto_10035 ) ) ( not ( = ?auto_10034 ?auto_10036 ) ) ( not ( = ?auto_10034 ?auto_10037 ) ) ( not ( = ?auto_10034 ?auto_10044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10035 ?auto_10036 ?auto_10037 )
      ( MAKE-3CRATE-VERIFY ?auto_10034 ?auto_10035 ?auto_10036 ?auto_10037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10046 - SURFACE
      ?auto_10047 - SURFACE
    )
    :vars
    (
      ?auto_10049 - HOIST
      ?auto_10048 - PLACE
      ?auto_10056 - SURFACE
      ?auto_10053 - PLACE
      ?auto_10052 - HOIST
      ?auto_10054 - SURFACE
      ?auto_10050 - TRUCK
      ?auto_10051 - PLACE
      ?auto_10055 - HOIST
      ?auto_10057 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10049 ?auto_10048 ) ( IS-CRATE ?auto_10047 ) ( not ( = ?auto_10046 ?auto_10047 ) ) ( not ( = ?auto_10056 ?auto_10046 ) ) ( not ( = ?auto_10056 ?auto_10047 ) ) ( not ( = ?auto_10053 ?auto_10048 ) ) ( HOIST-AT ?auto_10052 ?auto_10053 ) ( not ( = ?auto_10049 ?auto_10052 ) ) ( AVAILABLE ?auto_10052 ) ( SURFACE-AT ?auto_10047 ?auto_10053 ) ( ON ?auto_10047 ?auto_10054 ) ( CLEAR ?auto_10047 ) ( not ( = ?auto_10046 ?auto_10054 ) ) ( not ( = ?auto_10047 ?auto_10054 ) ) ( not ( = ?auto_10056 ?auto_10054 ) ) ( SURFACE-AT ?auto_10056 ?auto_10048 ) ( CLEAR ?auto_10056 ) ( IS-CRATE ?auto_10046 ) ( AVAILABLE ?auto_10049 ) ( TRUCK-AT ?auto_10050 ?auto_10051 ) ( not ( = ?auto_10051 ?auto_10048 ) ) ( not ( = ?auto_10053 ?auto_10051 ) ) ( HOIST-AT ?auto_10055 ?auto_10051 ) ( not ( = ?auto_10049 ?auto_10055 ) ) ( not ( = ?auto_10052 ?auto_10055 ) ) ( AVAILABLE ?auto_10055 ) ( SURFACE-AT ?auto_10046 ?auto_10051 ) ( ON ?auto_10046 ?auto_10057 ) ( CLEAR ?auto_10046 ) ( not ( = ?auto_10046 ?auto_10057 ) ) ( not ( = ?auto_10047 ?auto_10057 ) ) ( not ( = ?auto_10056 ?auto_10057 ) ) ( not ( = ?auto_10054 ?auto_10057 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10055 ?auto_10046 ?auto_10057 ?auto_10051 )
      ( MAKE-2CRATE ?auto_10056 ?auto_10046 ?auto_10047 )
      ( MAKE-1CRATE-VERIFY ?auto_10046 ?auto_10047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10058 - SURFACE
      ?auto_10059 - SURFACE
      ?auto_10060 - SURFACE
    )
    :vars
    (
      ?auto_10064 - HOIST
      ?auto_10062 - PLACE
      ?auto_10061 - PLACE
      ?auto_10066 - HOIST
      ?auto_10069 - SURFACE
      ?auto_10065 - TRUCK
      ?auto_10068 - PLACE
      ?auto_10063 - HOIST
      ?auto_10067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10064 ?auto_10062 ) ( IS-CRATE ?auto_10060 ) ( not ( = ?auto_10059 ?auto_10060 ) ) ( not ( = ?auto_10058 ?auto_10059 ) ) ( not ( = ?auto_10058 ?auto_10060 ) ) ( not ( = ?auto_10061 ?auto_10062 ) ) ( HOIST-AT ?auto_10066 ?auto_10061 ) ( not ( = ?auto_10064 ?auto_10066 ) ) ( AVAILABLE ?auto_10066 ) ( SURFACE-AT ?auto_10060 ?auto_10061 ) ( ON ?auto_10060 ?auto_10069 ) ( CLEAR ?auto_10060 ) ( not ( = ?auto_10059 ?auto_10069 ) ) ( not ( = ?auto_10060 ?auto_10069 ) ) ( not ( = ?auto_10058 ?auto_10069 ) ) ( SURFACE-AT ?auto_10058 ?auto_10062 ) ( CLEAR ?auto_10058 ) ( IS-CRATE ?auto_10059 ) ( AVAILABLE ?auto_10064 ) ( TRUCK-AT ?auto_10065 ?auto_10068 ) ( not ( = ?auto_10068 ?auto_10062 ) ) ( not ( = ?auto_10061 ?auto_10068 ) ) ( HOIST-AT ?auto_10063 ?auto_10068 ) ( not ( = ?auto_10064 ?auto_10063 ) ) ( not ( = ?auto_10066 ?auto_10063 ) ) ( AVAILABLE ?auto_10063 ) ( SURFACE-AT ?auto_10059 ?auto_10068 ) ( ON ?auto_10059 ?auto_10067 ) ( CLEAR ?auto_10059 ) ( not ( = ?auto_10059 ?auto_10067 ) ) ( not ( = ?auto_10060 ?auto_10067 ) ) ( not ( = ?auto_10058 ?auto_10067 ) ) ( not ( = ?auto_10069 ?auto_10067 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10059 ?auto_10060 )
      ( MAKE-2CRATE-VERIFY ?auto_10058 ?auto_10059 ?auto_10060 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10070 - SURFACE
      ?auto_10071 - SURFACE
      ?auto_10072 - SURFACE
      ?auto_10073 - SURFACE
    )
    :vars
    (
      ?auto_10080 - HOIST
      ?auto_10078 - PLACE
      ?auto_10076 - PLACE
      ?auto_10081 - HOIST
      ?auto_10077 - SURFACE
      ?auto_10075 - TRUCK
      ?auto_10079 - PLACE
      ?auto_10082 - HOIST
      ?auto_10074 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10080 ?auto_10078 ) ( IS-CRATE ?auto_10073 ) ( not ( = ?auto_10072 ?auto_10073 ) ) ( not ( = ?auto_10071 ?auto_10072 ) ) ( not ( = ?auto_10071 ?auto_10073 ) ) ( not ( = ?auto_10076 ?auto_10078 ) ) ( HOIST-AT ?auto_10081 ?auto_10076 ) ( not ( = ?auto_10080 ?auto_10081 ) ) ( AVAILABLE ?auto_10081 ) ( SURFACE-AT ?auto_10073 ?auto_10076 ) ( ON ?auto_10073 ?auto_10077 ) ( CLEAR ?auto_10073 ) ( not ( = ?auto_10072 ?auto_10077 ) ) ( not ( = ?auto_10073 ?auto_10077 ) ) ( not ( = ?auto_10071 ?auto_10077 ) ) ( SURFACE-AT ?auto_10071 ?auto_10078 ) ( CLEAR ?auto_10071 ) ( IS-CRATE ?auto_10072 ) ( AVAILABLE ?auto_10080 ) ( TRUCK-AT ?auto_10075 ?auto_10079 ) ( not ( = ?auto_10079 ?auto_10078 ) ) ( not ( = ?auto_10076 ?auto_10079 ) ) ( HOIST-AT ?auto_10082 ?auto_10079 ) ( not ( = ?auto_10080 ?auto_10082 ) ) ( not ( = ?auto_10081 ?auto_10082 ) ) ( AVAILABLE ?auto_10082 ) ( SURFACE-AT ?auto_10072 ?auto_10079 ) ( ON ?auto_10072 ?auto_10074 ) ( CLEAR ?auto_10072 ) ( not ( = ?auto_10072 ?auto_10074 ) ) ( not ( = ?auto_10073 ?auto_10074 ) ) ( not ( = ?auto_10071 ?auto_10074 ) ) ( not ( = ?auto_10077 ?auto_10074 ) ) ( ON ?auto_10071 ?auto_10070 ) ( not ( = ?auto_10070 ?auto_10071 ) ) ( not ( = ?auto_10070 ?auto_10072 ) ) ( not ( = ?auto_10070 ?auto_10073 ) ) ( not ( = ?auto_10070 ?auto_10077 ) ) ( not ( = ?auto_10070 ?auto_10074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10071 ?auto_10072 ?auto_10073 )
      ( MAKE-3CRATE-VERIFY ?auto_10070 ?auto_10071 ?auto_10072 ?auto_10073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10083 - SURFACE
      ?auto_10084 - SURFACE
    )
    :vars
    (
      ?auto_10091 - HOIST
      ?auto_10089 - PLACE
      ?auto_10094 - SURFACE
      ?auto_10087 - PLACE
      ?auto_10092 - HOIST
      ?auto_10088 - SURFACE
      ?auto_10090 - PLACE
      ?auto_10093 - HOIST
      ?auto_10085 - SURFACE
      ?auto_10086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10091 ?auto_10089 ) ( IS-CRATE ?auto_10084 ) ( not ( = ?auto_10083 ?auto_10084 ) ) ( not ( = ?auto_10094 ?auto_10083 ) ) ( not ( = ?auto_10094 ?auto_10084 ) ) ( not ( = ?auto_10087 ?auto_10089 ) ) ( HOIST-AT ?auto_10092 ?auto_10087 ) ( not ( = ?auto_10091 ?auto_10092 ) ) ( AVAILABLE ?auto_10092 ) ( SURFACE-AT ?auto_10084 ?auto_10087 ) ( ON ?auto_10084 ?auto_10088 ) ( CLEAR ?auto_10084 ) ( not ( = ?auto_10083 ?auto_10088 ) ) ( not ( = ?auto_10084 ?auto_10088 ) ) ( not ( = ?auto_10094 ?auto_10088 ) ) ( SURFACE-AT ?auto_10094 ?auto_10089 ) ( CLEAR ?auto_10094 ) ( IS-CRATE ?auto_10083 ) ( AVAILABLE ?auto_10091 ) ( not ( = ?auto_10090 ?auto_10089 ) ) ( not ( = ?auto_10087 ?auto_10090 ) ) ( HOIST-AT ?auto_10093 ?auto_10090 ) ( not ( = ?auto_10091 ?auto_10093 ) ) ( not ( = ?auto_10092 ?auto_10093 ) ) ( AVAILABLE ?auto_10093 ) ( SURFACE-AT ?auto_10083 ?auto_10090 ) ( ON ?auto_10083 ?auto_10085 ) ( CLEAR ?auto_10083 ) ( not ( = ?auto_10083 ?auto_10085 ) ) ( not ( = ?auto_10084 ?auto_10085 ) ) ( not ( = ?auto_10094 ?auto_10085 ) ) ( not ( = ?auto_10088 ?auto_10085 ) ) ( TRUCK-AT ?auto_10086 ?auto_10089 ) )
    :subtasks
    ( ( !DRIVE ?auto_10086 ?auto_10089 ?auto_10090 )
      ( MAKE-2CRATE ?auto_10094 ?auto_10083 ?auto_10084 )
      ( MAKE-1CRATE-VERIFY ?auto_10083 ?auto_10084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10095 - SURFACE
      ?auto_10096 - SURFACE
      ?auto_10097 - SURFACE
    )
    :vars
    (
      ?auto_10105 - HOIST
      ?auto_10106 - PLACE
      ?auto_10099 - PLACE
      ?auto_10103 - HOIST
      ?auto_10098 - SURFACE
      ?auto_10101 - PLACE
      ?auto_10102 - HOIST
      ?auto_10104 - SURFACE
      ?auto_10100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10105 ?auto_10106 ) ( IS-CRATE ?auto_10097 ) ( not ( = ?auto_10096 ?auto_10097 ) ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( not ( = ?auto_10095 ?auto_10097 ) ) ( not ( = ?auto_10099 ?auto_10106 ) ) ( HOIST-AT ?auto_10103 ?auto_10099 ) ( not ( = ?auto_10105 ?auto_10103 ) ) ( AVAILABLE ?auto_10103 ) ( SURFACE-AT ?auto_10097 ?auto_10099 ) ( ON ?auto_10097 ?auto_10098 ) ( CLEAR ?auto_10097 ) ( not ( = ?auto_10096 ?auto_10098 ) ) ( not ( = ?auto_10097 ?auto_10098 ) ) ( not ( = ?auto_10095 ?auto_10098 ) ) ( SURFACE-AT ?auto_10095 ?auto_10106 ) ( CLEAR ?auto_10095 ) ( IS-CRATE ?auto_10096 ) ( AVAILABLE ?auto_10105 ) ( not ( = ?auto_10101 ?auto_10106 ) ) ( not ( = ?auto_10099 ?auto_10101 ) ) ( HOIST-AT ?auto_10102 ?auto_10101 ) ( not ( = ?auto_10105 ?auto_10102 ) ) ( not ( = ?auto_10103 ?auto_10102 ) ) ( AVAILABLE ?auto_10102 ) ( SURFACE-AT ?auto_10096 ?auto_10101 ) ( ON ?auto_10096 ?auto_10104 ) ( CLEAR ?auto_10096 ) ( not ( = ?auto_10096 ?auto_10104 ) ) ( not ( = ?auto_10097 ?auto_10104 ) ) ( not ( = ?auto_10095 ?auto_10104 ) ) ( not ( = ?auto_10098 ?auto_10104 ) ) ( TRUCK-AT ?auto_10100 ?auto_10106 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10096 ?auto_10097 )
      ( MAKE-2CRATE-VERIFY ?auto_10095 ?auto_10096 ?auto_10097 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10107 - SURFACE
      ?auto_10108 - SURFACE
      ?auto_10109 - SURFACE
      ?auto_10110 - SURFACE
    )
    :vars
    (
      ?auto_10118 - HOIST
      ?auto_10113 - PLACE
      ?auto_10111 - PLACE
      ?auto_10115 - HOIST
      ?auto_10114 - SURFACE
      ?auto_10119 - PLACE
      ?auto_10117 - HOIST
      ?auto_10116 - SURFACE
      ?auto_10112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10118 ?auto_10113 ) ( IS-CRATE ?auto_10110 ) ( not ( = ?auto_10109 ?auto_10110 ) ) ( not ( = ?auto_10108 ?auto_10109 ) ) ( not ( = ?auto_10108 ?auto_10110 ) ) ( not ( = ?auto_10111 ?auto_10113 ) ) ( HOIST-AT ?auto_10115 ?auto_10111 ) ( not ( = ?auto_10118 ?auto_10115 ) ) ( AVAILABLE ?auto_10115 ) ( SURFACE-AT ?auto_10110 ?auto_10111 ) ( ON ?auto_10110 ?auto_10114 ) ( CLEAR ?auto_10110 ) ( not ( = ?auto_10109 ?auto_10114 ) ) ( not ( = ?auto_10110 ?auto_10114 ) ) ( not ( = ?auto_10108 ?auto_10114 ) ) ( SURFACE-AT ?auto_10108 ?auto_10113 ) ( CLEAR ?auto_10108 ) ( IS-CRATE ?auto_10109 ) ( AVAILABLE ?auto_10118 ) ( not ( = ?auto_10119 ?auto_10113 ) ) ( not ( = ?auto_10111 ?auto_10119 ) ) ( HOIST-AT ?auto_10117 ?auto_10119 ) ( not ( = ?auto_10118 ?auto_10117 ) ) ( not ( = ?auto_10115 ?auto_10117 ) ) ( AVAILABLE ?auto_10117 ) ( SURFACE-AT ?auto_10109 ?auto_10119 ) ( ON ?auto_10109 ?auto_10116 ) ( CLEAR ?auto_10109 ) ( not ( = ?auto_10109 ?auto_10116 ) ) ( not ( = ?auto_10110 ?auto_10116 ) ) ( not ( = ?auto_10108 ?auto_10116 ) ) ( not ( = ?auto_10114 ?auto_10116 ) ) ( TRUCK-AT ?auto_10112 ?auto_10113 ) ( ON ?auto_10108 ?auto_10107 ) ( not ( = ?auto_10107 ?auto_10108 ) ) ( not ( = ?auto_10107 ?auto_10109 ) ) ( not ( = ?auto_10107 ?auto_10110 ) ) ( not ( = ?auto_10107 ?auto_10114 ) ) ( not ( = ?auto_10107 ?auto_10116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10108 ?auto_10109 ?auto_10110 )
      ( MAKE-3CRATE-VERIFY ?auto_10107 ?auto_10108 ?auto_10109 ?auto_10110 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10120 - SURFACE
      ?auto_10121 - SURFACE
    )
    :vars
    (
      ?auto_10130 - HOIST
      ?auto_10124 - PLACE
      ?auto_10126 - SURFACE
      ?auto_10122 - PLACE
      ?auto_10127 - HOIST
      ?auto_10125 - SURFACE
      ?auto_10131 - PLACE
      ?auto_10129 - HOIST
      ?auto_10128 - SURFACE
      ?auto_10123 - TRUCK
      ?auto_10132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10130 ?auto_10124 ) ( IS-CRATE ?auto_10121 ) ( not ( = ?auto_10120 ?auto_10121 ) ) ( not ( = ?auto_10126 ?auto_10120 ) ) ( not ( = ?auto_10126 ?auto_10121 ) ) ( not ( = ?auto_10122 ?auto_10124 ) ) ( HOIST-AT ?auto_10127 ?auto_10122 ) ( not ( = ?auto_10130 ?auto_10127 ) ) ( AVAILABLE ?auto_10127 ) ( SURFACE-AT ?auto_10121 ?auto_10122 ) ( ON ?auto_10121 ?auto_10125 ) ( CLEAR ?auto_10121 ) ( not ( = ?auto_10120 ?auto_10125 ) ) ( not ( = ?auto_10121 ?auto_10125 ) ) ( not ( = ?auto_10126 ?auto_10125 ) ) ( IS-CRATE ?auto_10120 ) ( not ( = ?auto_10131 ?auto_10124 ) ) ( not ( = ?auto_10122 ?auto_10131 ) ) ( HOIST-AT ?auto_10129 ?auto_10131 ) ( not ( = ?auto_10130 ?auto_10129 ) ) ( not ( = ?auto_10127 ?auto_10129 ) ) ( AVAILABLE ?auto_10129 ) ( SURFACE-AT ?auto_10120 ?auto_10131 ) ( ON ?auto_10120 ?auto_10128 ) ( CLEAR ?auto_10120 ) ( not ( = ?auto_10120 ?auto_10128 ) ) ( not ( = ?auto_10121 ?auto_10128 ) ) ( not ( = ?auto_10126 ?auto_10128 ) ) ( not ( = ?auto_10125 ?auto_10128 ) ) ( TRUCK-AT ?auto_10123 ?auto_10124 ) ( SURFACE-AT ?auto_10132 ?auto_10124 ) ( CLEAR ?auto_10132 ) ( LIFTING ?auto_10130 ?auto_10126 ) ( IS-CRATE ?auto_10126 ) ( not ( = ?auto_10132 ?auto_10126 ) ) ( not ( = ?auto_10120 ?auto_10132 ) ) ( not ( = ?auto_10121 ?auto_10132 ) ) ( not ( = ?auto_10125 ?auto_10132 ) ) ( not ( = ?auto_10128 ?auto_10132 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10132 ?auto_10126 )
      ( MAKE-2CRATE ?auto_10126 ?auto_10120 ?auto_10121 )
      ( MAKE-1CRATE-VERIFY ?auto_10120 ?auto_10121 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10133 - SURFACE
      ?auto_10134 - SURFACE
      ?auto_10135 - SURFACE
    )
    :vars
    (
      ?auto_10139 - HOIST
      ?auto_10136 - PLACE
      ?auto_10137 - PLACE
      ?auto_10140 - HOIST
      ?auto_10144 - SURFACE
      ?auto_10138 - PLACE
      ?auto_10142 - HOIST
      ?auto_10141 - SURFACE
      ?auto_10145 - TRUCK
      ?auto_10143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10139 ?auto_10136 ) ( IS-CRATE ?auto_10135 ) ( not ( = ?auto_10134 ?auto_10135 ) ) ( not ( = ?auto_10133 ?auto_10134 ) ) ( not ( = ?auto_10133 ?auto_10135 ) ) ( not ( = ?auto_10137 ?auto_10136 ) ) ( HOIST-AT ?auto_10140 ?auto_10137 ) ( not ( = ?auto_10139 ?auto_10140 ) ) ( AVAILABLE ?auto_10140 ) ( SURFACE-AT ?auto_10135 ?auto_10137 ) ( ON ?auto_10135 ?auto_10144 ) ( CLEAR ?auto_10135 ) ( not ( = ?auto_10134 ?auto_10144 ) ) ( not ( = ?auto_10135 ?auto_10144 ) ) ( not ( = ?auto_10133 ?auto_10144 ) ) ( IS-CRATE ?auto_10134 ) ( not ( = ?auto_10138 ?auto_10136 ) ) ( not ( = ?auto_10137 ?auto_10138 ) ) ( HOIST-AT ?auto_10142 ?auto_10138 ) ( not ( = ?auto_10139 ?auto_10142 ) ) ( not ( = ?auto_10140 ?auto_10142 ) ) ( AVAILABLE ?auto_10142 ) ( SURFACE-AT ?auto_10134 ?auto_10138 ) ( ON ?auto_10134 ?auto_10141 ) ( CLEAR ?auto_10134 ) ( not ( = ?auto_10134 ?auto_10141 ) ) ( not ( = ?auto_10135 ?auto_10141 ) ) ( not ( = ?auto_10133 ?auto_10141 ) ) ( not ( = ?auto_10144 ?auto_10141 ) ) ( TRUCK-AT ?auto_10145 ?auto_10136 ) ( SURFACE-AT ?auto_10143 ?auto_10136 ) ( CLEAR ?auto_10143 ) ( LIFTING ?auto_10139 ?auto_10133 ) ( IS-CRATE ?auto_10133 ) ( not ( = ?auto_10143 ?auto_10133 ) ) ( not ( = ?auto_10134 ?auto_10143 ) ) ( not ( = ?auto_10135 ?auto_10143 ) ) ( not ( = ?auto_10144 ?auto_10143 ) ) ( not ( = ?auto_10141 ?auto_10143 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10134 ?auto_10135 )
      ( MAKE-2CRATE-VERIFY ?auto_10133 ?auto_10134 ?auto_10135 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10146 - SURFACE
      ?auto_10147 - SURFACE
      ?auto_10148 - SURFACE
      ?auto_10149 - SURFACE
    )
    :vars
    (
      ?auto_10157 - HOIST
      ?auto_10151 - PLACE
      ?auto_10154 - PLACE
      ?auto_10153 - HOIST
      ?auto_10158 - SURFACE
      ?auto_10150 - PLACE
      ?auto_10156 - HOIST
      ?auto_10152 - SURFACE
      ?auto_10155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10157 ?auto_10151 ) ( IS-CRATE ?auto_10149 ) ( not ( = ?auto_10148 ?auto_10149 ) ) ( not ( = ?auto_10147 ?auto_10148 ) ) ( not ( = ?auto_10147 ?auto_10149 ) ) ( not ( = ?auto_10154 ?auto_10151 ) ) ( HOIST-AT ?auto_10153 ?auto_10154 ) ( not ( = ?auto_10157 ?auto_10153 ) ) ( AVAILABLE ?auto_10153 ) ( SURFACE-AT ?auto_10149 ?auto_10154 ) ( ON ?auto_10149 ?auto_10158 ) ( CLEAR ?auto_10149 ) ( not ( = ?auto_10148 ?auto_10158 ) ) ( not ( = ?auto_10149 ?auto_10158 ) ) ( not ( = ?auto_10147 ?auto_10158 ) ) ( IS-CRATE ?auto_10148 ) ( not ( = ?auto_10150 ?auto_10151 ) ) ( not ( = ?auto_10154 ?auto_10150 ) ) ( HOIST-AT ?auto_10156 ?auto_10150 ) ( not ( = ?auto_10157 ?auto_10156 ) ) ( not ( = ?auto_10153 ?auto_10156 ) ) ( AVAILABLE ?auto_10156 ) ( SURFACE-AT ?auto_10148 ?auto_10150 ) ( ON ?auto_10148 ?auto_10152 ) ( CLEAR ?auto_10148 ) ( not ( = ?auto_10148 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10152 ) ) ( not ( = ?auto_10147 ?auto_10152 ) ) ( not ( = ?auto_10158 ?auto_10152 ) ) ( TRUCK-AT ?auto_10155 ?auto_10151 ) ( SURFACE-AT ?auto_10146 ?auto_10151 ) ( CLEAR ?auto_10146 ) ( LIFTING ?auto_10157 ?auto_10147 ) ( IS-CRATE ?auto_10147 ) ( not ( = ?auto_10146 ?auto_10147 ) ) ( not ( = ?auto_10148 ?auto_10146 ) ) ( not ( = ?auto_10149 ?auto_10146 ) ) ( not ( = ?auto_10158 ?auto_10146 ) ) ( not ( = ?auto_10152 ?auto_10146 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10147 ?auto_10148 ?auto_10149 )
      ( MAKE-3CRATE-VERIFY ?auto_10146 ?auto_10147 ?auto_10148 ?auto_10149 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10159 - SURFACE
      ?auto_10160 - SURFACE
    )
    :vars
    (
      ?auto_10170 - HOIST
      ?auto_10162 - PLACE
      ?auto_10164 - SURFACE
      ?auto_10166 - PLACE
      ?auto_10165 - HOIST
      ?auto_10171 - SURFACE
      ?auto_10161 - PLACE
      ?auto_10169 - HOIST
      ?auto_10163 - SURFACE
      ?auto_10168 - TRUCK
      ?auto_10167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10170 ?auto_10162 ) ( IS-CRATE ?auto_10160 ) ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10164 ?auto_10159 ) ) ( not ( = ?auto_10164 ?auto_10160 ) ) ( not ( = ?auto_10166 ?auto_10162 ) ) ( HOIST-AT ?auto_10165 ?auto_10166 ) ( not ( = ?auto_10170 ?auto_10165 ) ) ( AVAILABLE ?auto_10165 ) ( SURFACE-AT ?auto_10160 ?auto_10166 ) ( ON ?auto_10160 ?auto_10171 ) ( CLEAR ?auto_10160 ) ( not ( = ?auto_10159 ?auto_10171 ) ) ( not ( = ?auto_10160 ?auto_10171 ) ) ( not ( = ?auto_10164 ?auto_10171 ) ) ( IS-CRATE ?auto_10159 ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( not ( = ?auto_10166 ?auto_10161 ) ) ( HOIST-AT ?auto_10169 ?auto_10161 ) ( not ( = ?auto_10170 ?auto_10169 ) ) ( not ( = ?auto_10165 ?auto_10169 ) ) ( AVAILABLE ?auto_10169 ) ( SURFACE-AT ?auto_10159 ?auto_10161 ) ( ON ?auto_10159 ?auto_10163 ) ( CLEAR ?auto_10159 ) ( not ( = ?auto_10159 ?auto_10163 ) ) ( not ( = ?auto_10160 ?auto_10163 ) ) ( not ( = ?auto_10164 ?auto_10163 ) ) ( not ( = ?auto_10171 ?auto_10163 ) ) ( TRUCK-AT ?auto_10168 ?auto_10162 ) ( SURFACE-AT ?auto_10167 ?auto_10162 ) ( CLEAR ?auto_10167 ) ( IS-CRATE ?auto_10164 ) ( not ( = ?auto_10167 ?auto_10164 ) ) ( not ( = ?auto_10159 ?auto_10167 ) ) ( not ( = ?auto_10160 ?auto_10167 ) ) ( not ( = ?auto_10171 ?auto_10167 ) ) ( not ( = ?auto_10163 ?auto_10167 ) ) ( AVAILABLE ?auto_10170 ) ( IN ?auto_10164 ?auto_10168 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10170 ?auto_10164 ?auto_10168 ?auto_10162 )
      ( MAKE-2CRATE ?auto_10164 ?auto_10159 ?auto_10160 )
      ( MAKE-1CRATE-VERIFY ?auto_10159 ?auto_10160 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10172 - SURFACE
      ?auto_10173 - SURFACE
      ?auto_10174 - SURFACE
    )
    :vars
    (
      ?auto_10178 - HOIST
      ?auto_10183 - PLACE
      ?auto_10175 - PLACE
      ?auto_10179 - HOIST
      ?auto_10182 - SURFACE
      ?auto_10181 - PLACE
      ?auto_10180 - HOIST
      ?auto_10177 - SURFACE
      ?auto_10176 - TRUCK
      ?auto_10184 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10178 ?auto_10183 ) ( IS-CRATE ?auto_10174 ) ( not ( = ?auto_10173 ?auto_10174 ) ) ( not ( = ?auto_10172 ?auto_10173 ) ) ( not ( = ?auto_10172 ?auto_10174 ) ) ( not ( = ?auto_10175 ?auto_10183 ) ) ( HOIST-AT ?auto_10179 ?auto_10175 ) ( not ( = ?auto_10178 ?auto_10179 ) ) ( AVAILABLE ?auto_10179 ) ( SURFACE-AT ?auto_10174 ?auto_10175 ) ( ON ?auto_10174 ?auto_10182 ) ( CLEAR ?auto_10174 ) ( not ( = ?auto_10173 ?auto_10182 ) ) ( not ( = ?auto_10174 ?auto_10182 ) ) ( not ( = ?auto_10172 ?auto_10182 ) ) ( IS-CRATE ?auto_10173 ) ( not ( = ?auto_10181 ?auto_10183 ) ) ( not ( = ?auto_10175 ?auto_10181 ) ) ( HOIST-AT ?auto_10180 ?auto_10181 ) ( not ( = ?auto_10178 ?auto_10180 ) ) ( not ( = ?auto_10179 ?auto_10180 ) ) ( AVAILABLE ?auto_10180 ) ( SURFACE-AT ?auto_10173 ?auto_10181 ) ( ON ?auto_10173 ?auto_10177 ) ( CLEAR ?auto_10173 ) ( not ( = ?auto_10173 ?auto_10177 ) ) ( not ( = ?auto_10174 ?auto_10177 ) ) ( not ( = ?auto_10172 ?auto_10177 ) ) ( not ( = ?auto_10182 ?auto_10177 ) ) ( TRUCK-AT ?auto_10176 ?auto_10183 ) ( SURFACE-AT ?auto_10184 ?auto_10183 ) ( CLEAR ?auto_10184 ) ( IS-CRATE ?auto_10172 ) ( not ( = ?auto_10184 ?auto_10172 ) ) ( not ( = ?auto_10173 ?auto_10184 ) ) ( not ( = ?auto_10174 ?auto_10184 ) ) ( not ( = ?auto_10182 ?auto_10184 ) ) ( not ( = ?auto_10177 ?auto_10184 ) ) ( AVAILABLE ?auto_10178 ) ( IN ?auto_10172 ?auto_10176 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10173 ?auto_10174 )
      ( MAKE-2CRATE-VERIFY ?auto_10172 ?auto_10173 ?auto_10174 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10185 - SURFACE
      ?auto_10186 - SURFACE
      ?auto_10187 - SURFACE
      ?auto_10188 - SURFACE
    )
    :vars
    (
      ?auto_10196 - HOIST
      ?auto_10195 - PLACE
      ?auto_10193 - PLACE
      ?auto_10197 - HOIST
      ?auto_10190 - SURFACE
      ?auto_10194 - PLACE
      ?auto_10191 - HOIST
      ?auto_10189 - SURFACE
      ?auto_10192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10196 ?auto_10195 ) ( IS-CRATE ?auto_10188 ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10186 ?auto_10187 ) ) ( not ( = ?auto_10186 ?auto_10188 ) ) ( not ( = ?auto_10193 ?auto_10195 ) ) ( HOIST-AT ?auto_10197 ?auto_10193 ) ( not ( = ?auto_10196 ?auto_10197 ) ) ( AVAILABLE ?auto_10197 ) ( SURFACE-AT ?auto_10188 ?auto_10193 ) ( ON ?auto_10188 ?auto_10190 ) ( CLEAR ?auto_10188 ) ( not ( = ?auto_10187 ?auto_10190 ) ) ( not ( = ?auto_10188 ?auto_10190 ) ) ( not ( = ?auto_10186 ?auto_10190 ) ) ( IS-CRATE ?auto_10187 ) ( not ( = ?auto_10194 ?auto_10195 ) ) ( not ( = ?auto_10193 ?auto_10194 ) ) ( HOIST-AT ?auto_10191 ?auto_10194 ) ( not ( = ?auto_10196 ?auto_10191 ) ) ( not ( = ?auto_10197 ?auto_10191 ) ) ( AVAILABLE ?auto_10191 ) ( SURFACE-AT ?auto_10187 ?auto_10194 ) ( ON ?auto_10187 ?auto_10189 ) ( CLEAR ?auto_10187 ) ( not ( = ?auto_10187 ?auto_10189 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) ( not ( = ?auto_10186 ?auto_10189 ) ) ( not ( = ?auto_10190 ?auto_10189 ) ) ( TRUCK-AT ?auto_10192 ?auto_10195 ) ( SURFACE-AT ?auto_10185 ?auto_10195 ) ( CLEAR ?auto_10185 ) ( IS-CRATE ?auto_10186 ) ( not ( = ?auto_10185 ?auto_10186 ) ) ( not ( = ?auto_10187 ?auto_10185 ) ) ( not ( = ?auto_10188 ?auto_10185 ) ) ( not ( = ?auto_10190 ?auto_10185 ) ) ( not ( = ?auto_10189 ?auto_10185 ) ) ( AVAILABLE ?auto_10196 ) ( IN ?auto_10186 ?auto_10192 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10186 ?auto_10187 ?auto_10188 )
      ( MAKE-3CRATE-VERIFY ?auto_10185 ?auto_10186 ?auto_10187 ?auto_10188 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10198 - SURFACE
      ?auto_10199 - SURFACE
    )
    :vars
    (
      ?auto_10208 - HOIST
      ?auto_10207 - PLACE
      ?auto_10209 - SURFACE
      ?auto_10205 - PLACE
      ?auto_10210 - HOIST
      ?auto_10201 - SURFACE
      ?auto_10206 - PLACE
      ?auto_10202 - HOIST
      ?auto_10200 - SURFACE
      ?auto_10204 - SURFACE
      ?auto_10203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10208 ?auto_10207 ) ( IS-CRATE ?auto_10199 ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10209 ?auto_10198 ) ) ( not ( = ?auto_10209 ?auto_10199 ) ) ( not ( = ?auto_10205 ?auto_10207 ) ) ( HOIST-AT ?auto_10210 ?auto_10205 ) ( not ( = ?auto_10208 ?auto_10210 ) ) ( AVAILABLE ?auto_10210 ) ( SURFACE-AT ?auto_10199 ?auto_10205 ) ( ON ?auto_10199 ?auto_10201 ) ( CLEAR ?auto_10199 ) ( not ( = ?auto_10198 ?auto_10201 ) ) ( not ( = ?auto_10199 ?auto_10201 ) ) ( not ( = ?auto_10209 ?auto_10201 ) ) ( IS-CRATE ?auto_10198 ) ( not ( = ?auto_10206 ?auto_10207 ) ) ( not ( = ?auto_10205 ?auto_10206 ) ) ( HOIST-AT ?auto_10202 ?auto_10206 ) ( not ( = ?auto_10208 ?auto_10202 ) ) ( not ( = ?auto_10210 ?auto_10202 ) ) ( AVAILABLE ?auto_10202 ) ( SURFACE-AT ?auto_10198 ?auto_10206 ) ( ON ?auto_10198 ?auto_10200 ) ( CLEAR ?auto_10198 ) ( not ( = ?auto_10198 ?auto_10200 ) ) ( not ( = ?auto_10199 ?auto_10200 ) ) ( not ( = ?auto_10209 ?auto_10200 ) ) ( not ( = ?auto_10201 ?auto_10200 ) ) ( SURFACE-AT ?auto_10204 ?auto_10207 ) ( CLEAR ?auto_10204 ) ( IS-CRATE ?auto_10209 ) ( not ( = ?auto_10204 ?auto_10209 ) ) ( not ( = ?auto_10198 ?auto_10204 ) ) ( not ( = ?auto_10199 ?auto_10204 ) ) ( not ( = ?auto_10201 ?auto_10204 ) ) ( not ( = ?auto_10200 ?auto_10204 ) ) ( AVAILABLE ?auto_10208 ) ( IN ?auto_10209 ?auto_10203 ) ( TRUCK-AT ?auto_10203 ?auto_10206 ) )
    :subtasks
    ( ( !DRIVE ?auto_10203 ?auto_10206 ?auto_10207 )
      ( MAKE-2CRATE ?auto_10209 ?auto_10198 ?auto_10199 )
      ( MAKE-1CRATE-VERIFY ?auto_10198 ?auto_10199 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10211 - SURFACE
      ?auto_10212 - SURFACE
      ?auto_10213 - SURFACE
    )
    :vars
    (
      ?auto_10216 - HOIST
      ?auto_10214 - PLACE
      ?auto_10222 - PLACE
      ?auto_10221 - HOIST
      ?auto_10223 - SURFACE
      ?auto_10217 - PLACE
      ?auto_10220 - HOIST
      ?auto_10219 - SURFACE
      ?auto_10215 - SURFACE
      ?auto_10218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10216 ?auto_10214 ) ( IS-CRATE ?auto_10213 ) ( not ( = ?auto_10212 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10212 ) ) ( not ( = ?auto_10211 ?auto_10213 ) ) ( not ( = ?auto_10222 ?auto_10214 ) ) ( HOIST-AT ?auto_10221 ?auto_10222 ) ( not ( = ?auto_10216 ?auto_10221 ) ) ( AVAILABLE ?auto_10221 ) ( SURFACE-AT ?auto_10213 ?auto_10222 ) ( ON ?auto_10213 ?auto_10223 ) ( CLEAR ?auto_10213 ) ( not ( = ?auto_10212 ?auto_10223 ) ) ( not ( = ?auto_10213 ?auto_10223 ) ) ( not ( = ?auto_10211 ?auto_10223 ) ) ( IS-CRATE ?auto_10212 ) ( not ( = ?auto_10217 ?auto_10214 ) ) ( not ( = ?auto_10222 ?auto_10217 ) ) ( HOIST-AT ?auto_10220 ?auto_10217 ) ( not ( = ?auto_10216 ?auto_10220 ) ) ( not ( = ?auto_10221 ?auto_10220 ) ) ( AVAILABLE ?auto_10220 ) ( SURFACE-AT ?auto_10212 ?auto_10217 ) ( ON ?auto_10212 ?auto_10219 ) ( CLEAR ?auto_10212 ) ( not ( = ?auto_10212 ?auto_10219 ) ) ( not ( = ?auto_10213 ?auto_10219 ) ) ( not ( = ?auto_10211 ?auto_10219 ) ) ( not ( = ?auto_10223 ?auto_10219 ) ) ( SURFACE-AT ?auto_10215 ?auto_10214 ) ( CLEAR ?auto_10215 ) ( IS-CRATE ?auto_10211 ) ( not ( = ?auto_10215 ?auto_10211 ) ) ( not ( = ?auto_10212 ?auto_10215 ) ) ( not ( = ?auto_10213 ?auto_10215 ) ) ( not ( = ?auto_10223 ?auto_10215 ) ) ( not ( = ?auto_10219 ?auto_10215 ) ) ( AVAILABLE ?auto_10216 ) ( IN ?auto_10211 ?auto_10218 ) ( TRUCK-AT ?auto_10218 ?auto_10217 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10212 ?auto_10213 )
      ( MAKE-2CRATE-VERIFY ?auto_10211 ?auto_10212 ?auto_10213 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10224 - SURFACE
      ?auto_10225 - SURFACE
      ?auto_10226 - SURFACE
      ?auto_10227 - SURFACE
    )
    :vars
    (
      ?auto_10235 - HOIST
      ?auto_10228 - PLACE
      ?auto_10236 - PLACE
      ?auto_10233 - HOIST
      ?auto_10230 - SURFACE
      ?auto_10229 - PLACE
      ?auto_10232 - HOIST
      ?auto_10234 - SURFACE
      ?auto_10231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10235 ?auto_10228 ) ( IS-CRATE ?auto_10227 ) ( not ( = ?auto_10226 ?auto_10227 ) ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( not ( = ?auto_10225 ?auto_10227 ) ) ( not ( = ?auto_10236 ?auto_10228 ) ) ( HOIST-AT ?auto_10233 ?auto_10236 ) ( not ( = ?auto_10235 ?auto_10233 ) ) ( AVAILABLE ?auto_10233 ) ( SURFACE-AT ?auto_10227 ?auto_10236 ) ( ON ?auto_10227 ?auto_10230 ) ( CLEAR ?auto_10227 ) ( not ( = ?auto_10226 ?auto_10230 ) ) ( not ( = ?auto_10227 ?auto_10230 ) ) ( not ( = ?auto_10225 ?auto_10230 ) ) ( IS-CRATE ?auto_10226 ) ( not ( = ?auto_10229 ?auto_10228 ) ) ( not ( = ?auto_10236 ?auto_10229 ) ) ( HOIST-AT ?auto_10232 ?auto_10229 ) ( not ( = ?auto_10235 ?auto_10232 ) ) ( not ( = ?auto_10233 ?auto_10232 ) ) ( AVAILABLE ?auto_10232 ) ( SURFACE-AT ?auto_10226 ?auto_10229 ) ( ON ?auto_10226 ?auto_10234 ) ( CLEAR ?auto_10226 ) ( not ( = ?auto_10226 ?auto_10234 ) ) ( not ( = ?auto_10227 ?auto_10234 ) ) ( not ( = ?auto_10225 ?auto_10234 ) ) ( not ( = ?auto_10230 ?auto_10234 ) ) ( SURFACE-AT ?auto_10224 ?auto_10228 ) ( CLEAR ?auto_10224 ) ( IS-CRATE ?auto_10225 ) ( not ( = ?auto_10224 ?auto_10225 ) ) ( not ( = ?auto_10226 ?auto_10224 ) ) ( not ( = ?auto_10227 ?auto_10224 ) ) ( not ( = ?auto_10230 ?auto_10224 ) ) ( not ( = ?auto_10234 ?auto_10224 ) ) ( AVAILABLE ?auto_10235 ) ( IN ?auto_10225 ?auto_10231 ) ( TRUCK-AT ?auto_10231 ?auto_10229 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10225 ?auto_10226 ?auto_10227 )
      ( MAKE-3CRATE-VERIFY ?auto_10224 ?auto_10225 ?auto_10226 ?auto_10227 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10237 - SURFACE
      ?auto_10238 - SURFACE
    )
    :vars
    (
      ?auto_10248 - HOIST
      ?auto_10240 - PLACE
      ?auto_10247 - SURFACE
      ?auto_10249 - PLACE
      ?auto_10245 - HOIST
      ?auto_10242 - SURFACE
      ?auto_10241 - PLACE
      ?auto_10244 - HOIST
      ?auto_10246 - SURFACE
      ?auto_10239 - SURFACE
      ?auto_10243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10248 ?auto_10240 ) ( IS-CRATE ?auto_10238 ) ( not ( = ?auto_10237 ?auto_10238 ) ) ( not ( = ?auto_10247 ?auto_10237 ) ) ( not ( = ?auto_10247 ?auto_10238 ) ) ( not ( = ?auto_10249 ?auto_10240 ) ) ( HOIST-AT ?auto_10245 ?auto_10249 ) ( not ( = ?auto_10248 ?auto_10245 ) ) ( AVAILABLE ?auto_10245 ) ( SURFACE-AT ?auto_10238 ?auto_10249 ) ( ON ?auto_10238 ?auto_10242 ) ( CLEAR ?auto_10238 ) ( not ( = ?auto_10237 ?auto_10242 ) ) ( not ( = ?auto_10238 ?auto_10242 ) ) ( not ( = ?auto_10247 ?auto_10242 ) ) ( IS-CRATE ?auto_10237 ) ( not ( = ?auto_10241 ?auto_10240 ) ) ( not ( = ?auto_10249 ?auto_10241 ) ) ( HOIST-AT ?auto_10244 ?auto_10241 ) ( not ( = ?auto_10248 ?auto_10244 ) ) ( not ( = ?auto_10245 ?auto_10244 ) ) ( SURFACE-AT ?auto_10237 ?auto_10241 ) ( ON ?auto_10237 ?auto_10246 ) ( CLEAR ?auto_10237 ) ( not ( = ?auto_10237 ?auto_10246 ) ) ( not ( = ?auto_10238 ?auto_10246 ) ) ( not ( = ?auto_10247 ?auto_10246 ) ) ( not ( = ?auto_10242 ?auto_10246 ) ) ( SURFACE-AT ?auto_10239 ?auto_10240 ) ( CLEAR ?auto_10239 ) ( IS-CRATE ?auto_10247 ) ( not ( = ?auto_10239 ?auto_10247 ) ) ( not ( = ?auto_10237 ?auto_10239 ) ) ( not ( = ?auto_10238 ?auto_10239 ) ) ( not ( = ?auto_10242 ?auto_10239 ) ) ( not ( = ?auto_10246 ?auto_10239 ) ) ( AVAILABLE ?auto_10248 ) ( TRUCK-AT ?auto_10243 ?auto_10241 ) ( LIFTING ?auto_10244 ?auto_10247 ) )
    :subtasks
    ( ( !LOAD ?auto_10244 ?auto_10247 ?auto_10243 ?auto_10241 )
      ( MAKE-2CRATE ?auto_10247 ?auto_10237 ?auto_10238 )
      ( MAKE-1CRATE-VERIFY ?auto_10237 ?auto_10238 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10250 - SURFACE
      ?auto_10251 - SURFACE
      ?auto_10252 - SURFACE
    )
    :vars
    (
      ?auto_10255 - HOIST
      ?auto_10259 - PLACE
      ?auto_10256 - PLACE
      ?auto_10262 - HOIST
      ?auto_10257 - SURFACE
      ?auto_10258 - PLACE
      ?auto_10254 - HOIST
      ?auto_10261 - SURFACE
      ?auto_10260 - SURFACE
      ?auto_10253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10255 ?auto_10259 ) ( IS-CRATE ?auto_10252 ) ( not ( = ?auto_10251 ?auto_10252 ) ) ( not ( = ?auto_10250 ?auto_10251 ) ) ( not ( = ?auto_10250 ?auto_10252 ) ) ( not ( = ?auto_10256 ?auto_10259 ) ) ( HOIST-AT ?auto_10262 ?auto_10256 ) ( not ( = ?auto_10255 ?auto_10262 ) ) ( AVAILABLE ?auto_10262 ) ( SURFACE-AT ?auto_10252 ?auto_10256 ) ( ON ?auto_10252 ?auto_10257 ) ( CLEAR ?auto_10252 ) ( not ( = ?auto_10251 ?auto_10257 ) ) ( not ( = ?auto_10252 ?auto_10257 ) ) ( not ( = ?auto_10250 ?auto_10257 ) ) ( IS-CRATE ?auto_10251 ) ( not ( = ?auto_10258 ?auto_10259 ) ) ( not ( = ?auto_10256 ?auto_10258 ) ) ( HOIST-AT ?auto_10254 ?auto_10258 ) ( not ( = ?auto_10255 ?auto_10254 ) ) ( not ( = ?auto_10262 ?auto_10254 ) ) ( SURFACE-AT ?auto_10251 ?auto_10258 ) ( ON ?auto_10251 ?auto_10261 ) ( CLEAR ?auto_10251 ) ( not ( = ?auto_10251 ?auto_10261 ) ) ( not ( = ?auto_10252 ?auto_10261 ) ) ( not ( = ?auto_10250 ?auto_10261 ) ) ( not ( = ?auto_10257 ?auto_10261 ) ) ( SURFACE-AT ?auto_10260 ?auto_10259 ) ( CLEAR ?auto_10260 ) ( IS-CRATE ?auto_10250 ) ( not ( = ?auto_10260 ?auto_10250 ) ) ( not ( = ?auto_10251 ?auto_10260 ) ) ( not ( = ?auto_10252 ?auto_10260 ) ) ( not ( = ?auto_10257 ?auto_10260 ) ) ( not ( = ?auto_10261 ?auto_10260 ) ) ( AVAILABLE ?auto_10255 ) ( TRUCK-AT ?auto_10253 ?auto_10258 ) ( LIFTING ?auto_10254 ?auto_10250 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10251 ?auto_10252 )
      ( MAKE-2CRATE-VERIFY ?auto_10250 ?auto_10251 ?auto_10252 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10263 - SURFACE
      ?auto_10264 - SURFACE
      ?auto_10265 - SURFACE
      ?auto_10266 - SURFACE
    )
    :vars
    (
      ?auto_10271 - HOIST
      ?auto_10269 - PLACE
      ?auto_10275 - PLACE
      ?auto_10270 - HOIST
      ?auto_10267 - SURFACE
      ?auto_10274 - PLACE
      ?auto_10272 - HOIST
      ?auto_10273 - SURFACE
      ?auto_10268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10271 ?auto_10269 ) ( IS-CRATE ?auto_10266 ) ( not ( = ?auto_10265 ?auto_10266 ) ) ( not ( = ?auto_10264 ?auto_10265 ) ) ( not ( = ?auto_10264 ?auto_10266 ) ) ( not ( = ?auto_10275 ?auto_10269 ) ) ( HOIST-AT ?auto_10270 ?auto_10275 ) ( not ( = ?auto_10271 ?auto_10270 ) ) ( AVAILABLE ?auto_10270 ) ( SURFACE-AT ?auto_10266 ?auto_10275 ) ( ON ?auto_10266 ?auto_10267 ) ( CLEAR ?auto_10266 ) ( not ( = ?auto_10265 ?auto_10267 ) ) ( not ( = ?auto_10266 ?auto_10267 ) ) ( not ( = ?auto_10264 ?auto_10267 ) ) ( IS-CRATE ?auto_10265 ) ( not ( = ?auto_10274 ?auto_10269 ) ) ( not ( = ?auto_10275 ?auto_10274 ) ) ( HOIST-AT ?auto_10272 ?auto_10274 ) ( not ( = ?auto_10271 ?auto_10272 ) ) ( not ( = ?auto_10270 ?auto_10272 ) ) ( SURFACE-AT ?auto_10265 ?auto_10274 ) ( ON ?auto_10265 ?auto_10273 ) ( CLEAR ?auto_10265 ) ( not ( = ?auto_10265 ?auto_10273 ) ) ( not ( = ?auto_10266 ?auto_10273 ) ) ( not ( = ?auto_10264 ?auto_10273 ) ) ( not ( = ?auto_10267 ?auto_10273 ) ) ( SURFACE-AT ?auto_10263 ?auto_10269 ) ( CLEAR ?auto_10263 ) ( IS-CRATE ?auto_10264 ) ( not ( = ?auto_10263 ?auto_10264 ) ) ( not ( = ?auto_10265 ?auto_10263 ) ) ( not ( = ?auto_10266 ?auto_10263 ) ) ( not ( = ?auto_10267 ?auto_10263 ) ) ( not ( = ?auto_10273 ?auto_10263 ) ) ( AVAILABLE ?auto_10271 ) ( TRUCK-AT ?auto_10268 ?auto_10274 ) ( LIFTING ?auto_10272 ?auto_10264 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10264 ?auto_10265 ?auto_10266 )
      ( MAKE-3CRATE-VERIFY ?auto_10263 ?auto_10264 ?auto_10265 ?auto_10266 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10276 - SURFACE
      ?auto_10277 - SURFACE
    )
    :vars
    (
      ?auto_10283 - HOIST
      ?auto_10280 - PLACE
      ?auto_10287 - SURFACE
      ?auto_10288 - PLACE
      ?auto_10282 - HOIST
      ?auto_10278 - SURFACE
      ?auto_10286 - PLACE
      ?auto_10284 - HOIST
      ?auto_10285 - SURFACE
      ?auto_10281 - SURFACE
      ?auto_10279 - TRUCK
      ?auto_10289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10283 ?auto_10280 ) ( IS-CRATE ?auto_10277 ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10287 ?auto_10276 ) ) ( not ( = ?auto_10287 ?auto_10277 ) ) ( not ( = ?auto_10288 ?auto_10280 ) ) ( HOIST-AT ?auto_10282 ?auto_10288 ) ( not ( = ?auto_10283 ?auto_10282 ) ) ( AVAILABLE ?auto_10282 ) ( SURFACE-AT ?auto_10277 ?auto_10288 ) ( ON ?auto_10277 ?auto_10278 ) ( CLEAR ?auto_10277 ) ( not ( = ?auto_10276 ?auto_10278 ) ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( not ( = ?auto_10287 ?auto_10278 ) ) ( IS-CRATE ?auto_10276 ) ( not ( = ?auto_10286 ?auto_10280 ) ) ( not ( = ?auto_10288 ?auto_10286 ) ) ( HOIST-AT ?auto_10284 ?auto_10286 ) ( not ( = ?auto_10283 ?auto_10284 ) ) ( not ( = ?auto_10282 ?auto_10284 ) ) ( SURFACE-AT ?auto_10276 ?auto_10286 ) ( ON ?auto_10276 ?auto_10285 ) ( CLEAR ?auto_10276 ) ( not ( = ?auto_10276 ?auto_10285 ) ) ( not ( = ?auto_10277 ?auto_10285 ) ) ( not ( = ?auto_10287 ?auto_10285 ) ) ( not ( = ?auto_10278 ?auto_10285 ) ) ( SURFACE-AT ?auto_10281 ?auto_10280 ) ( CLEAR ?auto_10281 ) ( IS-CRATE ?auto_10287 ) ( not ( = ?auto_10281 ?auto_10287 ) ) ( not ( = ?auto_10276 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10281 ) ) ( not ( = ?auto_10278 ?auto_10281 ) ) ( not ( = ?auto_10285 ?auto_10281 ) ) ( AVAILABLE ?auto_10283 ) ( TRUCK-AT ?auto_10279 ?auto_10286 ) ( AVAILABLE ?auto_10284 ) ( SURFACE-AT ?auto_10287 ?auto_10286 ) ( ON ?auto_10287 ?auto_10289 ) ( CLEAR ?auto_10287 ) ( not ( = ?auto_10276 ?auto_10289 ) ) ( not ( = ?auto_10277 ?auto_10289 ) ) ( not ( = ?auto_10287 ?auto_10289 ) ) ( not ( = ?auto_10278 ?auto_10289 ) ) ( not ( = ?auto_10285 ?auto_10289 ) ) ( not ( = ?auto_10281 ?auto_10289 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10284 ?auto_10287 ?auto_10289 ?auto_10286 )
      ( MAKE-2CRATE ?auto_10287 ?auto_10276 ?auto_10277 )
      ( MAKE-1CRATE-VERIFY ?auto_10276 ?auto_10277 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10290 - SURFACE
      ?auto_10291 - SURFACE
      ?auto_10292 - SURFACE
    )
    :vars
    (
      ?auto_10301 - HOIST
      ?auto_10300 - PLACE
      ?auto_10293 - PLACE
      ?auto_10303 - HOIST
      ?auto_10294 - SURFACE
      ?auto_10302 - PLACE
      ?auto_10295 - HOIST
      ?auto_10296 - SURFACE
      ?auto_10297 - SURFACE
      ?auto_10299 - TRUCK
      ?auto_10298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10301 ?auto_10300 ) ( IS-CRATE ?auto_10292 ) ( not ( = ?auto_10291 ?auto_10292 ) ) ( not ( = ?auto_10290 ?auto_10291 ) ) ( not ( = ?auto_10290 ?auto_10292 ) ) ( not ( = ?auto_10293 ?auto_10300 ) ) ( HOIST-AT ?auto_10303 ?auto_10293 ) ( not ( = ?auto_10301 ?auto_10303 ) ) ( AVAILABLE ?auto_10303 ) ( SURFACE-AT ?auto_10292 ?auto_10293 ) ( ON ?auto_10292 ?auto_10294 ) ( CLEAR ?auto_10292 ) ( not ( = ?auto_10291 ?auto_10294 ) ) ( not ( = ?auto_10292 ?auto_10294 ) ) ( not ( = ?auto_10290 ?auto_10294 ) ) ( IS-CRATE ?auto_10291 ) ( not ( = ?auto_10302 ?auto_10300 ) ) ( not ( = ?auto_10293 ?auto_10302 ) ) ( HOIST-AT ?auto_10295 ?auto_10302 ) ( not ( = ?auto_10301 ?auto_10295 ) ) ( not ( = ?auto_10303 ?auto_10295 ) ) ( SURFACE-AT ?auto_10291 ?auto_10302 ) ( ON ?auto_10291 ?auto_10296 ) ( CLEAR ?auto_10291 ) ( not ( = ?auto_10291 ?auto_10296 ) ) ( not ( = ?auto_10292 ?auto_10296 ) ) ( not ( = ?auto_10290 ?auto_10296 ) ) ( not ( = ?auto_10294 ?auto_10296 ) ) ( SURFACE-AT ?auto_10297 ?auto_10300 ) ( CLEAR ?auto_10297 ) ( IS-CRATE ?auto_10290 ) ( not ( = ?auto_10297 ?auto_10290 ) ) ( not ( = ?auto_10291 ?auto_10297 ) ) ( not ( = ?auto_10292 ?auto_10297 ) ) ( not ( = ?auto_10294 ?auto_10297 ) ) ( not ( = ?auto_10296 ?auto_10297 ) ) ( AVAILABLE ?auto_10301 ) ( TRUCK-AT ?auto_10299 ?auto_10302 ) ( AVAILABLE ?auto_10295 ) ( SURFACE-AT ?auto_10290 ?auto_10302 ) ( ON ?auto_10290 ?auto_10298 ) ( CLEAR ?auto_10290 ) ( not ( = ?auto_10291 ?auto_10298 ) ) ( not ( = ?auto_10292 ?auto_10298 ) ) ( not ( = ?auto_10290 ?auto_10298 ) ) ( not ( = ?auto_10294 ?auto_10298 ) ) ( not ( = ?auto_10296 ?auto_10298 ) ) ( not ( = ?auto_10297 ?auto_10298 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10291 ?auto_10292 )
      ( MAKE-2CRATE-VERIFY ?auto_10290 ?auto_10291 ?auto_10292 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10304 - SURFACE
      ?auto_10305 - SURFACE
      ?auto_10306 - SURFACE
      ?auto_10307 - SURFACE
    )
    :vars
    (
      ?auto_10317 - HOIST
      ?auto_10310 - PLACE
      ?auto_10309 - PLACE
      ?auto_10312 - HOIST
      ?auto_10315 - SURFACE
      ?auto_10311 - PLACE
      ?auto_10316 - HOIST
      ?auto_10313 - SURFACE
      ?auto_10308 - TRUCK
      ?auto_10314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10317 ?auto_10310 ) ( IS-CRATE ?auto_10307 ) ( not ( = ?auto_10306 ?auto_10307 ) ) ( not ( = ?auto_10305 ?auto_10306 ) ) ( not ( = ?auto_10305 ?auto_10307 ) ) ( not ( = ?auto_10309 ?auto_10310 ) ) ( HOIST-AT ?auto_10312 ?auto_10309 ) ( not ( = ?auto_10317 ?auto_10312 ) ) ( AVAILABLE ?auto_10312 ) ( SURFACE-AT ?auto_10307 ?auto_10309 ) ( ON ?auto_10307 ?auto_10315 ) ( CLEAR ?auto_10307 ) ( not ( = ?auto_10306 ?auto_10315 ) ) ( not ( = ?auto_10307 ?auto_10315 ) ) ( not ( = ?auto_10305 ?auto_10315 ) ) ( IS-CRATE ?auto_10306 ) ( not ( = ?auto_10311 ?auto_10310 ) ) ( not ( = ?auto_10309 ?auto_10311 ) ) ( HOIST-AT ?auto_10316 ?auto_10311 ) ( not ( = ?auto_10317 ?auto_10316 ) ) ( not ( = ?auto_10312 ?auto_10316 ) ) ( SURFACE-AT ?auto_10306 ?auto_10311 ) ( ON ?auto_10306 ?auto_10313 ) ( CLEAR ?auto_10306 ) ( not ( = ?auto_10306 ?auto_10313 ) ) ( not ( = ?auto_10307 ?auto_10313 ) ) ( not ( = ?auto_10305 ?auto_10313 ) ) ( not ( = ?auto_10315 ?auto_10313 ) ) ( SURFACE-AT ?auto_10304 ?auto_10310 ) ( CLEAR ?auto_10304 ) ( IS-CRATE ?auto_10305 ) ( not ( = ?auto_10304 ?auto_10305 ) ) ( not ( = ?auto_10306 ?auto_10304 ) ) ( not ( = ?auto_10307 ?auto_10304 ) ) ( not ( = ?auto_10315 ?auto_10304 ) ) ( not ( = ?auto_10313 ?auto_10304 ) ) ( AVAILABLE ?auto_10317 ) ( TRUCK-AT ?auto_10308 ?auto_10311 ) ( AVAILABLE ?auto_10316 ) ( SURFACE-AT ?auto_10305 ?auto_10311 ) ( ON ?auto_10305 ?auto_10314 ) ( CLEAR ?auto_10305 ) ( not ( = ?auto_10306 ?auto_10314 ) ) ( not ( = ?auto_10307 ?auto_10314 ) ) ( not ( = ?auto_10305 ?auto_10314 ) ) ( not ( = ?auto_10315 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10304 ?auto_10314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10305 ?auto_10306 ?auto_10307 )
      ( MAKE-3CRATE-VERIFY ?auto_10304 ?auto_10305 ?auto_10306 ?auto_10307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10318 - SURFACE
      ?auto_10319 - SURFACE
    )
    :vars
    (
      ?auto_10330 - HOIST
      ?auto_10322 - PLACE
      ?auto_10331 - SURFACE
      ?auto_10321 - PLACE
      ?auto_10324 - HOIST
      ?auto_10328 - SURFACE
      ?auto_10323 - PLACE
      ?auto_10329 - HOIST
      ?auto_10325 - SURFACE
      ?auto_10327 - SURFACE
      ?auto_10326 - SURFACE
      ?auto_10320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10330 ?auto_10322 ) ( IS-CRATE ?auto_10319 ) ( not ( = ?auto_10318 ?auto_10319 ) ) ( not ( = ?auto_10331 ?auto_10318 ) ) ( not ( = ?auto_10331 ?auto_10319 ) ) ( not ( = ?auto_10321 ?auto_10322 ) ) ( HOIST-AT ?auto_10324 ?auto_10321 ) ( not ( = ?auto_10330 ?auto_10324 ) ) ( AVAILABLE ?auto_10324 ) ( SURFACE-AT ?auto_10319 ?auto_10321 ) ( ON ?auto_10319 ?auto_10328 ) ( CLEAR ?auto_10319 ) ( not ( = ?auto_10318 ?auto_10328 ) ) ( not ( = ?auto_10319 ?auto_10328 ) ) ( not ( = ?auto_10331 ?auto_10328 ) ) ( IS-CRATE ?auto_10318 ) ( not ( = ?auto_10323 ?auto_10322 ) ) ( not ( = ?auto_10321 ?auto_10323 ) ) ( HOIST-AT ?auto_10329 ?auto_10323 ) ( not ( = ?auto_10330 ?auto_10329 ) ) ( not ( = ?auto_10324 ?auto_10329 ) ) ( SURFACE-AT ?auto_10318 ?auto_10323 ) ( ON ?auto_10318 ?auto_10325 ) ( CLEAR ?auto_10318 ) ( not ( = ?auto_10318 ?auto_10325 ) ) ( not ( = ?auto_10319 ?auto_10325 ) ) ( not ( = ?auto_10331 ?auto_10325 ) ) ( not ( = ?auto_10328 ?auto_10325 ) ) ( SURFACE-AT ?auto_10327 ?auto_10322 ) ( CLEAR ?auto_10327 ) ( IS-CRATE ?auto_10331 ) ( not ( = ?auto_10327 ?auto_10331 ) ) ( not ( = ?auto_10318 ?auto_10327 ) ) ( not ( = ?auto_10319 ?auto_10327 ) ) ( not ( = ?auto_10328 ?auto_10327 ) ) ( not ( = ?auto_10325 ?auto_10327 ) ) ( AVAILABLE ?auto_10330 ) ( AVAILABLE ?auto_10329 ) ( SURFACE-AT ?auto_10331 ?auto_10323 ) ( ON ?auto_10331 ?auto_10326 ) ( CLEAR ?auto_10331 ) ( not ( = ?auto_10318 ?auto_10326 ) ) ( not ( = ?auto_10319 ?auto_10326 ) ) ( not ( = ?auto_10331 ?auto_10326 ) ) ( not ( = ?auto_10328 ?auto_10326 ) ) ( not ( = ?auto_10325 ?auto_10326 ) ) ( not ( = ?auto_10327 ?auto_10326 ) ) ( TRUCK-AT ?auto_10320 ?auto_10322 ) )
    :subtasks
    ( ( !DRIVE ?auto_10320 ?auto_10322 ?auto_10323 )
      ( MAKE-2CRATE ?auto_10331 ?auto_10318 ?auto_10319 )
      ( MAKE-1CRATE-VERIFY ?auto_10318 ?auto_10319 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10332 - SURFACE
      ?auto_10333 - SURFACE
      ?auto_10334 - SURFACE
    )
    :vars
    (
      ?auto_10337 - HOIST
      ?auto_10336 - PLACE
      ?auto_10343 - PLACE
      ?auto_10342 - HOIST
      ?auto_10335 - SURFACE
      ?auto_10340 - PLACE
      ?auto_10339 - HOIST
      ?auto_10344 - SURFACE
      ?auto_10341 - SURFACE
      ?auto_10345 - SURFACE
      ?auto_10338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10337 ?auto_10336 ) ( IS-CRATE ?auto_10334 ) ( not ( = ?auto_10333 ?auto_10334 ) ) ( not ( = ?auto_10332 ?auto_10333 ) ) ( not ( = ?auto_10332 ?auto_10334 ) ) ( not ( = ?auto_10343 ?auto_10336 ) ) ( HOIST-AT ?auto_10342 ?auto_10343 ) ( not ( = ?auto_10337 ?auto_10342 ) ) ( AVAILABLE ?auto_10342 ) ( SURFACE-AT ?auto_10334 ?auto_10343 ) ( ON ?auto_10334 ?auto_10335 ) ( CLEAR ?auto_10334 ) ( not ( = ?auto_10333 ?auto_10335 ) ) ( not ( = ?auto_10334 ?auto_10335 ) ) ( not ( = ?auto_10332 ?auto_10335 ) ) ( IS-CRATE ?auto_10333 ) ( not ( = ?auto_10340 ?auto_10336 ) ) ( not ( = ?auto_10343 ?auto_10340 ) ) ( HOIST-AT ?auto_10339 ?auto_10340 ) ( not ( = ?auto_10337 ?auto_10339 ) ) ( not ( = ?auto_10342 ?auto_10339 ) ) ( SURFACE-AT ?auto_10333 ?auto_10340 ) ( ON ?auto_10333 ?auto_10344 ) ( CLEAR ?auto_10333 ) ( not ( = ?auto_10333 ?auto_10344 ) ) ( not ( = ?auto_10334 ?auto_10344 ) ) ( not ( = ?auto_10332 ?auto_10344 ) ) ( not ( = ?auto_10335 ?auto_10344 ) ) ( SURFACE-AT ?auto_10341 ?auto_10336 ) ( CLEAR ?auto_10341 ) ( IS-CRATE ?auto_10332 ) ( not ( = ?auto_10341 ?auto_10332 ) ) ( not ( = ?auto_10333 ?auto_10341 ) ) ( not ( = ?auto_10334 ?auto_10341 ) ) ( not ( = ?auto_10335 ?auto_10341 ) ) ( not ( = ?auto_10344 ?auto_10341 ) ) ( AVAILABLE ?auto_10337 ) ( AVAILABLE ?auto_10339 ) ( SURFACE-AT ?auto_10332 ?auto_10340 ) ( ON ?auto_10332 ?auto_10345 ) ( CLEAR ?auto_10332 ) ( not ( = ?auto_10333 ?auto_10345 ) ) ( not ( = ?auto_10334 ?auto_10345 ) ) ( not ( = ?auto_10332 ?auto_10345 ) ) ( not ( = ?auto_10335 ?auto_10345 ) ) ( not ( = ?auto_10344 ?auto_10345 ) ) ( not ( = ?auto_10341 ?auto_10345 ) ) ( TRUCK-AT ?auto_10338 ?auto_10336 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10333 ?auto_10334 )
      ( MAKE-2CRATE-VERIFY ?auto_10332 ?auto_10333 ?auto_10334 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10346 - SURFACE
      ?auto_10347 - SURFACE
      ?auto_10348 - SURFACE
      ?auto_10349 - SURFACE
    )
    :vars
    (
      ?auto_10359 - HOIST
      ?auto_10350 - PLACE
      ?auto_10355 - PLACE
      ?auto_10358 - HOIST
      ?auto_10357 - SURFACE
      ?auto_10351 - PLACE
      ?auto_10354 - HOIST
      ?auto_10356 - SURFACE
      ?auto_10353 - SURFACE
      ?auto_10352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10359 ?auto_10350 ) ( IS-CRATE ?auto_10349 ) ( not ( = ?auto_10348 ?auto_10349 ) ) ( not ( = ?auto_10347 ?auto_10348 ) ) ( not ( = ?auto_10347 ?auto_10349 ) ) ( not ( = ?auto_10355 ?auto_10350 ) ) ( HOIST-AT ?auto_10358 ?auto_10355 ) ( not ( = ?auto_10359 ?auto_10358 ) ) ( AVAILABLE ?auto_10358 ) ( SURFACE-AT ?auto_10349 ?auto_10355 ) ( ON ?auto_10349 ?auto_10357 ) ( CLEAR ?auto_10349 ) ( not ( = ?auto_10348 ?auto_10357 ) ) ( not ( = ?auto_10349 ?auto_10357 ) ) ( not ( = ?auto_10347 ?auto_10357 ) ) ( IS-CRATE ?auto_10348 ) ( not ( = ?auto_10351 ?auto_10350 ) ) ( not ( = ?auto_10355 ?auto_10351 ) ) ( HOIST-AT ?auto_10354 ?auto_10351 ) ( not ( = ?auto_10359 ?auto_10354 ) ) ( not ( = ?auto_10358 ?auto_10354 ) ) ( SURFACE-AT ?auto_10348 ?auto_10351 ) ( ON ?auto_10348 ?auto_10356 ) ( CLEAR ?auto_10348 ) ( not ( = ?auto_10348 ?auto_10356 ) ) ( not ( = ?auto_10349 ?auto_10356 ) ) ( not ( = ?auto_10347 ?auto_10356 ) ) ( not ( = ?auto_10357 ?auto_10356 ) ) ( SURFACE-AT ?auto_10346 ?auto_10350 ) ( CLEAR ?auto_10346 ) ( IS-CRATE ?auto_10347 ) ( not ( = ?auto_10346 ?auto_10347 ) ) ( not ( = ?auto_10348 ?auto_10346 ) ) ( not ( = ?auto_10349 ?auto_10346 ) ) ( not ( = ?auto_10357 ?auto_10346 ) ) ( not ( = ?auto_10356 ?auto_10346 ) ) ( AVAILABLE ?auto_10359 ) ( AVAILABLE ?auto_10354 ) ( SURFACE-AT ?auto_10347 ?auto_10351 ) ( ON ?auto_10347 ?auto_10353 ) ( CLEAR ?auto_10347 ) ( not ( = ?auto_10348 ?auto_10353 ) ) ( not ( = ?auto_10349 ?auto_10353 ) ) ( not ( = ?auto_10347 ?auto_10353 ) ) ( not ( = ?auto_10357 ?auto_10353 ) ) ( not ( = ?auto_10356 ?auto_10353 ) ) ( not ( = ?auto_10346 ?auto_10353 ) ) ( TRUCK-AT ?auto_10352 ?auto_10350 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10347 ?auto_10348 ?auto_10349 )
      ( MAKE-3CRATE-VERIFY ?auto_10346 ?auto_10347 ?auto_10348 ?auto_10349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10374 - SURFACE
      ?auto_10375 - SURFACE
    )
    :vars
    (
      ?auto_10376 - HOIST
      ?auto_10377 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10376 ?auto_10377 ) ( SURFACE-AT ?auto_10374 ?auto_10377 ) ( CLEAR ?auto_10374 ) ( LIFTING ?auto_10376 ?auto_10375 ) ( IS-CRATE ?auto_10375 ) ( not ( = ?auto_10374 ?auto_10375 ) ) )
    :subtasks
    ( ( !DROP ?auto_10376 ?auto_10375 ?auto_10374 ?auto_10377 )
      ( MAKE-1CRATE-VERIFY ?auto_10374 ?auto_10375 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10378 - SURFACE
      ?auto_10379 - SURFACE
      ?auto_10380 - SURFACE
    )
    :vars
    (
      ?auto_10382 - HOIST
      ?auto_10381 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10382 ?auto_10381 ) ( SURFACE-AT ?auto_10379 ?auto_10381 ) ( CLEAR ?auto_10379 ) ( LIFTING ?auto_10382 ?auto_10380 ) ( IS-CRATE ?auto_10380 ) ( not ( = ?auto_10379 ?auto_10380 ) ) ( ON ?auto_10379 ?auto_10378 ) ( not ( = ?auto_10378 ?auto_10379 ) ) ( not ( = ?auto_10378 ?auto_10380 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10379 ?auto_10380 )
      ( MAKE-2CRATE-VERIFY ?auto_10378 ?auto_10379 ?auto_10380 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10383 - SURFACE
      ?auto_10384 - SURFACE
      ?auto_10385 - SURFACE
      ?auto_10386 - SURFACE
    )
    :vars
    (
      ?auto_10388 - HOIST
      ?auto_10387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10388 ?auto_10387 ) ( SURFACE-AT ?auto_10385 ?auto_10387 ) ( CLEAR ?auto_10385 ) ( LIFTING ?auto_10388 ?auto_10386 ) ( IS-CRATE ?auto_10386 ) ( not ( = ?auto_10385 ?auto_10386 ) ) ( ON ?auto_10384 ?auto_10383 ) ( ON ?auto_10385 ?auto_10384 ) ( not ( = ?auto_10383 ?auto_10384 ) ) ( not ( = ?auto_10383 ?auto_10385 ) ) ( not ( = ?auto_10383 ?auto_10386 ) ) ( not ( = ?auto_10384 ?auto_10385 ) ) ( not ( = ?auto_10384 ?auto_10386 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10385 ?auto_10386 )
      ( MAKE-3CRATE-VERIFY ?auto_10383 ?auto_10384 ?auto_10385 ?auto_10386 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10389 - SURFACE
      ?auto_10390 - SURFACE
      ?auto_10391 - SURFACE
      ?auto_10392 - SURFACE
      ?auto_10393 - SURFACE
    )
    :vars
    (
      ?auto_10395 - HOIST
      ?auto_10394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10395 ?auto_10394 ) ( SURFACE-AT ?auto_10392 ?auto_10394 ) ( CLEAR ?auto_10392 ) ( LIFTING ?auto_10395 ?auto_10393 ) ( IS-CRATE ?auto_10393 ) ( not ( = ?auto_10392 ?auto_10393 ) ) ( ON ?auto_10390 ?auto_10389 ) ( ON ?auto_10391 ?auto_10390 ) ( ON ?auto_10392 ?auto_10391 ) ( not ( = ?auto_10389 ?auto_10390 ) ) ( not ( = ?auto_10389 ?auto_10391 ) ) ( not ( = ?auto_10389 ?auto_10392 ) ) ( not ( = ?auto_10389 ?auto_10393 ) ) ( not ( = ?auto_10390 ?auto_10391 ) ) ( not ( = ?auto_10390 ?auto_10392 ) ) ( not ( = ?auto_10390 ?auto_10393 ) ) ( not ( = ?auto_10391 ?auto_10392 ) ) ( not ( = ?auto_10391 ?auto_10393 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10392 ?auto_10393 )
      ( MAKE-4CRATE-VERIFY ?auto_10389 ?auto_10390 ?auto_10391 ?auto_10392 ?auto_10393 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10396 - SURFACE
      ?auto_10397 - SURFACE
    )
    :vars
    (
      ?auto_10399 - HOIST
      ?auto_10398 - PLACE
      ?auto_10400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10399 ?auto_10398 ) ( SURFACE-AT ?auto_10396 ?auto_10398 ) ( CLEAR ?auto_10396 ) ( IS-CRATE ?auto_10397 ) ( not ( = ?auto_10396 ?auto_10397 ) ) ( TRUCK-AT ?auto_10400 ?auto_10398 ) ( AVAILABLE ?auto_10399 ) ( IN ?auto_10397 ?auto_10400 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10399 ?auto_10397 ?auto_10400 ?auto_10398 )
      ( MAKE-1CRATE ?auto_10396 ?auto_10397 )
      ( MAKE-1CRATE-VERIFY ?auto_10396 ?auto_10397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10401 - SURFACE
      ?auto_10402 - SURFACE
      ?auto_10403 - SURFACE
    )
    :vars
    (
      ?auto_10404 - HOIST
      ?auto_10405 - PLACE
      ?auto_10406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10404 ?auto_10405 ) ( SURFACE-AT ?auto_10402 ?auto_10405 ) ( CLEAR ?auto_10402 ) ( IS-CRATE ?auto_10403 ) ( not ( = ?auto_10402 ?auto_10403 ) ) ( TRUCK-AT ?auto_10406 ?auto_10405 ) ( AVAILABLE ?auto_10404 ) ( IN ?auto_10403 ?auto_10406 ) ( ON ?auto_10402 ?auto_10401 ) ( not ( = ?auto_10401 ?auto_10402 ) ) ( not ( = ?auto_10401 ?auto_10403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10402 ?auto_10403 )
      ( MAKE-2CRATE-VERIFY ?auto_10401 ?auto_10402 ?auto_10403 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10407 - SURFACE
      ?auto_10408 - SURFACE
      ?auto_10409 - SURFACE
      ?auto_10410 - SURFACE
    )
    :vars
    (
      ?auto_10411 - HOIST
      ?auto_10413 - PLACE
      ?auto_10412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10411 ?auto_10413 ) ( SURFACE-AT ?auto_10409 ?auto_10413 ) ( CLEAR ?auto_10409 ) ( IS-CRATE ?auto_10410 ) ( not ( = ?auto_10409 ?auto_10410 ) ) ( TRUCK-AT ?auto_10412 ?auto_10413 ) ( AVAILABLE ?auto_10411 ) ( IN ?auto_10410 ?auto_10412 ) ( ON ?auto_10409 ?auto_10408 ) ( not ( = ?auto_10408 ?auto_10409 ) ) ( not ( = ?auto_10408 ?auto_10410 ) ) ( ON ?auto_10408 ?auto_10407 ) ( not ( = ?auto_10407 ?auto_10408 ) ) ( not ( = ?auto_10407 ?auto_10409 ) ) ( not ( = ?auto_10407 ?auto_10410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10408 ?auto_10409 ?auto_10410 )
      ( MAKE-3CRATE-VERIFY ?auto_10407 ?auto_10408 ?auto_10409 ?auto_10410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10414 - SURFACE
      ?auto_10415 - SURFACE
      ?auto_10416 - SURFACE
      ?auto_10417 - SURFACE
      ?auto_10418 - SURFACE
    )
    :vars
    (
      ?auto_10419 - HOIST
      ?auto_10421 - PLACE
      ?auto_10420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10419 ?auto_10421 ) ( SURFACE-AT ?auto_10417 ?auto_10421 ) ( CLEAR ?auto_10417 ) ( IS-CRATE ?auto_10418 ) ( not ( = ?auto_10417 ?auto_10418 ) ) ( TRUCK-AT ?auto_10420 ?auto_10421 ) ( AVAILABLE ?auto_10419 ) ( IN ?auto_10418 ?auto_10420 ) ( ON ?auto_10417 ?auto_10416 ) ( not ( = ?auto_10416 ?auto_10417 ) ) ( not ( = ?auto_10416 ?auto_10418 ) ) ( ON ?auto_10415 ?auto_10414 ) ( ON ?auto_10416 ?auto_10415 ) ( not ( = ?auto_10414 ?auto_10415 ) ) ( not ( = ?auto_10414 ?auto_10416 ) ) ( not ( = ?auto_10414 ?auto_10417 ) ) ( not ( = ?auto_10414 ?auto_10418 ) ) ( not ( = ?auto_10415 ?auto_10416 ) ) ( not ( = ?auto_10415 ?auto_10417 ) ) ( not ( = ?auto_10415 ?auto_10418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10416 ?auto_10417 ?auto_10418 )
      ( MAKE-4CRATE-VERIFY ?auto_10414 ?auto_10415 ?auto_10416 ?auto_10417 ?auto_10418 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10422 - SURFACE
      ?auto_10423 - SURFACE
    )
    :vars
    (
      ?auto_10424 - HOIST
      ?auto_10427 - PLACE
      ?auto_10425 - TRUCK
      ?auto_10426 - SURFACE
      ?auto_10428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10424 ?auto_10427 ) ( SURFACE-AT ?auto_10422 ?auto_10427 ) ( CLEAR ?auto_10422 ) ( IS-CRATE ?auto_10423 ) ( not ( = ?auto_10422 ?auto_10423 ) ) ( AVAILABLE ?auto_10424 ) ( IN ?auto_10423 ?auto_10425 ) ( ON ?auto_10422 ?auto_10426 ) ( not ( = ?auto_10426 ?auto_10422 ) ) ( not ( = ?auto_10426 ?auto_10423 ) ) ( TRUCK-AT ?auto_10425 ?auto_10428 ) ( not ( = ?auto_10428 ?auto_10427 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10425 ?auto_10428 ?auto_10427 )
      ( MAKE-2CRATE ?auto_10426 ?auto_10422 ?auto_10423 )
      ( MAKE-1CRATE-VERIFY ?auto_10422 ?auto_10423 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10429 - SURFACE
      ?auto_10430 - SURFACE
      ?auto_10431 - SURFACE
    )
    :vars
    (
      ?auto_10434 - HOIST
      ?auto_10433 - PLACE
      ?auto_10432 - TRUCK
      ?auto_10435 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10434 ?auto_10433 ) ( SURFACE-AT ?auto_10430 ?auto_10433 ) ( CLEAR ?auto_10430 ) ( IS-CRATE ?auto_10431 ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( AVAILABLE ?auto_10434 ) ( IN ?auto_10431 ?auto_10432 ) ( ON ?auto_10430 ?auto_10429 ) ( not ( = ?auto_10429 ?auto_10430 ) ) ( not ( = ?auto_10429 ?auto_10431 ) ) ( TRUCK-AT ?auto_10432 ?auto_10435 ) ( not ( = ?auto_10435 ?auto_10433 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10430 ?auto_10431 )
      ( MAKE-2CRATE-VERIFY ?auto_10429 ?auto_10430 ?auto_10431 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10436 - SURFACE
      ?auto_10437 - SURFACE
      ?auto_10438 - SURFACE
      ?auto_10439 - SURFACE
    )
    :vars
    (
      ?auto_10443 - HOIST
      ?auto_10442 - PLACE
      ?auto_10440 - TRUCK
      ?auto_10441 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10443 ?auto_10442 ) ( SURFACE-AT ?auto_10438 ?auto_10442 ) ( CLEAR ?auto_10438 ) ( IS-CRATE ?auto_10439 ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( AVAILABLE ?auto_10443 ) ( IN ?auto_10439 ?auto_10440 ) ( ON ?auto_10438 ?auto_10437 ) ( not ( = ?auto_10437 ?auto_10438 ) ) ( not ( = ?auto_10437 ?auto_10439 ) ) ( TRUCK-AT ?auto_10440 ?auto_10441 ) ( not ( = ?auto_10441 ?auto_10442 ) ) ( ON ?auto_10437 ?auto_10436 ) ( not ( = ?auto_10436 ?auto_10437 ) ) ( not ( = ?auto_10436 ?auto_10438 ) ) ( not ( = ?auto_10436 ?auto_10439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10437 ?auto_10438 ?auto_10439 )
      ( MAKE-3CRATE-VERIFY ?auto_10436 ?auto_10437 ?auto_10438 ?auto_10439 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10444 - SURFACE
      ?auto_10445 - SURFACE
      ?auto_10446 - SURFACE
      ?auto_10447 - SURFACE
      ?auto_10448 - SURFACE
    )
    :vars
    (
      ?auto_10452 - HOIST
      ?auto_10451 - PLACE
      ?auto_10449 - TRUCK
      ?auto_10450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10452 ?auto_10451 ) ( SURFACE-AT ?auto_10447 ?auto_10451 ) ( CLEAR ?auto_10447 ) ( IS-CRATE ?auto_10448 ) ( not ( = ?auto_10447 ?auto_10448 ) ) ( AVAILABLE ?auto_10452 ) ( IN ?auto_10448 ?auto_10449 ) ( ON ?auto_10447 ?auto_10446 ) ( not ( = ?auto_10446 ?auto_10447 ) ) ( not ( = ?auto_10446 ?auto_10448 ) ) ( TRUCK-AT ?auto_10449 ?auto_10450 ) ( not ( = ?auto_10450 ?auto_10451 ) ) ( ON ?auto_10445 ?auto_10444 ) ( ON ?auto_10446 ?auto_10445 ) ( not ( = ?auto_10444 ?auto_10445 ) ) ( not ( = ?auto_10444 ?auto_10446 ) ) ( not ( = ?auto_10444 ?auto_10447 ) ) ( not ( = ?auto_10444 ?auto_10448 ) ) ( not ( = ?auto_10445 ?auto_10446 ) ) ( not ( = ?auto_10445 ?auto_10447 ) ) ( not ( = ?auto_10445 ?auto_10448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10446 ?auto_10447 ?auto_10448 )
      ( MAKE-4CRATE-VERIFY ?auto_10444 ?auto_10445 ?auto_10446 ?auto_10447 ?auto_10448 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10453 - SURFACE
      ?auto_10454 - SURFACE
    )
    :vars
    (
      ?auto_10459 - HOIST
      ?auto_10458 - PLACE
      ?auto_10455 - SURFACE
      ?auto_10456 - TRUCK
      ?auto_10457 - PLACE
      ?auto_10460 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10459 ?auto_10458 ) ( SURFACE-AT ?auto_10453 ?auto_10458 ) ( CLEAR ?auto_10453 ) ( IS-CRATE ?auto_10454 ) ( not ( = ?auto_10453 ?auto_10454 ) ) ( AVAILABLE ?auto_10459 ) ( ON ?auto_10453 ?auto_10455 ) ( not ( = ?auto_10455 ?auto_10453 ) ) ( not ( = ?auto_10455 ?auto_10454 ) ) ( TRUCK-AT ?auto_10456 ?auto_10457 ) ( not ( = ?auto_10457 ?auto_10458 ) ) ( HOIST-AT ?auto_10460 ?auto_10457 ) ( LIFTING ?auto_10460 ?auto_10454 ) ( not ( = ?auto_10459 ?auto_10460 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10460 ?auto_10454 ?auto_10456 ?auto_10457 )
      ( MAKE-2CRATE ?auto_10455 ?auto_10453 ?auto_10454 )
      ( MAKE-1CRATE-VERIFY ?auto_10453 ?auto_10454 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10461 - SURFACE
      ?auto_10462 - SURFACE
      ?auto_10463 - SURFACE
    )
    :vars
    (
      ?auto_10467 - HOIST
      ?auto_10464 - PLACE
      ?auto_10465 - TRUCK
      ?auto_10468 - PLACE
      ?auto_10466 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10467 ?auto_10464 ) ( SURFACE-AT ?auto_10462 ?auto_10464 ) ( CLEAR ?auto_10462 ) ( IS-CRATE ?auto_10463 ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( AVAILABLE ?auto_10467 ) ( ON ?auto_10462 ?auto_10461 ) ( not ( = ?auto_10461 ?auto_10462 ) ) ( not ( = ?auto_10461 ?auto_10463 ) ) ( TRUCK-AT ?auto_10465 ?auto_10468 ) ( not ( = ?auto_10468 ?auto_10464 ) ) ( HOIST-AT ?auto_10466 ?auto_10468 ) ( LIFTING ?auto_10466 ?auto_10463 ) ( not ( = ?auto_10467 ?auto_10466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10462 ?auto_10463 )
      ( MAKE-2CRATE-VERIFY ?auto_10461 ?auto_10462 ?auto_10463 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10469 - SURFACE
      ?auto_10470 - SURFACE
      ?auto_10471 - SURFACE
      ?auto_10472 - SURFACE
    )
    :vars
    (
      ?auto_10475 - HOIST
      ?auto_10473 - PLACE
      ?auto_10476 - TRUCK
      ?auto_10474 - PLACE
      ?auto_10477 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10475 ?auto_10473 ) ( SURFACE-AT ?auto_10471 ?auto_10473 ) ( CLEAR ?auto_10471 ) ( IS-CRATE ?auto_10472 ) ( not ( = ?auto_10471 ?auto_10472 ) ) ( AVAILABLE ?auto_10475 ) ( ON ?auto_10471 ?auto_10470 ) ( not ( = ?auto_10470 ?auto_10471 ) ) ( not ( = ?auto_10470 ?auto_10472 ) ) ( TRUCK-AT ?auto_10476 ?auto_10474 ) ( not ( = ?auto_10474 ?auto_10473 ) ) ( HOIST-AT ?auto_10477 ?auto_10474 ) ( LIFTING ?auto_10477 ?auto_10472 ) ( not ( = ?auto_10475 ?auto_10477 ) ) ( ON ?auto_10470 ?auto_10469 ) ( not ( = ?auto_10469 ?auto_10470 ) ) ( not ( = ?auto_10469 ?auto_10471 ) ) ( not ( = ?auto_10469 ?auto_10472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10470 ?auto_10471 ?auto_10472 )
      ( MAKE-3CRATE-VERIFY ?auto_10469 ?auto_10470 ?auto_10471 ?auto_10472 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10478 - SURFACE
      ?auto_10479 - SURFACE
      ?auto_10480 - SURFACE
      ?auto_10481 - SURFACE
      ?auto_10482 - SURFACE
    )
    :vars
    (
      ?auto_10485 - HOIST
      ?auto_10483 - PLACE
      ?auto_10486 - TRUCK
      ?auto_10484 - PLACE
      ?auto_10487 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10485 ?auto_10483 ) ( SURFACE-AT ?auto_10481 ?auto_10483 ) ( CLEAR ?auto_10481 ) ( IS-CRATE ?auto_10482 ) ( not ( = ?auto_10481 ?auto_10482 ) ) ( AVAILABLE ?auto_10485 ) ( ON ?auto_10481 ?auto_10480 ) ( not ( = ?auto_10480 ?auto_10481 ) ) ( not ( = ?auto_10480 ?auto_10482 ) ) ( TRUCK-AT ?auto_10486 ?auto_10484 ) ( not ( = ?auto_10484 ?auto_10483 ) ) ( HOIST-AT ?auto_10487 ?auto_10484 ) ( LIFTING ?auto_10487 ?auto_10482 ) ( not ( = ?auto_10485 ?auto_10487 ) ) ( ON ?auto_10479 ?auto_10478 ) ( ON ?auto_10480 ?auto_10479 ) ( not ( = ?auto_10478 ?auto_10479 ) ) ( not ( = ?auto_10478 ?auto_10480 ) ) ( not ( = ?auto_10478 ?auto_10481 ) ) ( not ( = ?auto_10478 ?auto_10482 ) ) ( not ( = ?auto_10479 ?auto_10480 ) ) ( not ( = ?auto_10479 ?auto_10481 ) ) ( not ( = ?auto_10479 ?auto_10482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10480 ?auto_10481 ?auto_10482 )
      ( MAKE-4CRATE-VERIFY ?auto_10478 ?auto_10479 ?auto_10480 ?auto_10481 ?auto_10482 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10488 - SURFACE
      ?auto_10489 - SURFACE
    )
    :vars
    (
      ?auto_10492 - HOIST
      ?auto_10490 - PLACE
      ?auto_10495 - SURFACE
      ?auto_10493 - TRUCK
      ?auto_10491 - PLACE
      ?auto_10494 - HOIST
      ?auto_10496 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10492 ?auto_10490 ) ( SURFACE-AT ?auto_10488 ?auto_10490 ) ( CLEAR ?auto_10488 ) ( IS-CRATE ?auto_10489 ) ( not ( = ?auto_10488 ?auto_10489 ) ) ( AVAILABLE ?auto_10492 ) ( ON ?auto_10488 ?auto_10495 ) ( not ( = ?auto_10495 ?auto_10488 ) ) ( not ( = ?auto_10495 ?auto_10489 ) ) ( TRUCK-AT ?auto_10493 ?auto_10491 ) ( not ( = ?auto_10491 ?auto_10490 ) ) ( HOIST-AT ?auto_10494 ?auto_10491 ) ( not ( = ?auto_10492 ?auto_10494 ) ) ( AVAILABLE ?auto_10494 ) ( SURFACE-AT ?auto_10489 ?auto_10491 ) ( ON ?auto_10489 ?auto_10496 ) ( CLEAR ?auto_10489 ) ( not ( = ?auto_10488 ?auto_10496 ) ) ( not ( = ?auto_10489 ?auto_10496 ) ) ( not ( = ?auto_10495 ?auto_10496 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10494 ?auto_10489 ?auto_10496 ?auto_10491 )
      ( MAKE-2CRATE ?auto_10495 ?auto_10488 ?auto_10489 )
      ( MAKE-1CRATE-VERIFY ?auto_10488 ?auto_10489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10497 - SURFACE
      ?auto_10498 - SURFACE
      ?auto_10499 - SURFACE
    )
    :vars
    (
      ?auto_10505 - HOIST
      ?auto_10503 - PLACE
      ?auto_10501 - TRUCK
      ?auto_10502 - PLACE
      ?auto_10504 - HOIST
      ?auto_10500 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10505 ?auto_10503 ) ( SURFACE-AT ?auto_10498 ?auto_10503 ) ( CLEAR ?auto_10498 ) ( IS-CRATE ?auto_10499 ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( AVAILABLE ?auto_10505 ) ( ON ?auto_10498 ?auto_10497 ) ( not ( = ?auto_10497 ?auto_10498 ) ) ( not ( = ?auto_10497 ?auto_10499 ) ) ( TRUCK-AT ?auto_10501 ?auto_10502 ) ( not ( = ?auto_10502 ?auto_10503 ) ) ( HOIST-AT ?auto_10504 ?auto_10502 ) ( not ( = ?auto_10505 ?auto_10504 ) ) ( AVAILABLE ?auto_10504 ) ( SURFACE-AT ?auto_10499 ?auto_10502 ) ( ON ?auto_10499 ?auto_10500 ) ( CLEAR ?auto_10499 ) ( not ( = ?auto_10498 ?auto_10500 ) ) ( not ( = ?auto_10499 ?auto_10500 ) ) ( not ( = ?auto_10497 ?auto_10500 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10498 ?auto_10499 )
      ( MAKE-2CRATE-VERIFY ?auto_10497 ?auto_10498 ?auto_10499 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10506 - SURFACE
      ?auto_10507 - SURFACE
      ?auto_10508 - SURFACE
      ?auto_10509 - SURFACE
    )
    :vars
    (
      ?auto_10512 - HOIST
      ?auto_10513 - PLACE
      ?auto_10510 - TRUCK
      ?auto_10511 - PLACE
      ?auto_10515 - HOIST
      ?auto_10514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10512 ?auto_10513 ) ( SURFACE-AT ?auto_10508 ?auto_10513 ) ( CLEAR ?auto_10508 ) ( IS-CRATE ?auto_10509 ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( AVAILABLE ?auto_10512 ) ( ON ?auto_10508 ?auto_10507 ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( TRUCK-AT ?auto_10510 ?auto_10511 ) ( not ( = ?auto_10511 ?auto_10513 ) ) ( HOIST-AT ?auto_10515 ?auto_10511 ) ( not ( = ?auto_10512 ?auto_10515 ) ) ( AVAILABLE ?auto_10515 ) ( SURFACE-AT ?auto_10509 ?auto_10511 ) ( ON ?auto_10509 ?auto_10514 ) ( CLEAR ?auto_10509 ) ( not ( = ?auto_10508 ?auto_10514 ) ) ( not ( = ?auto_10509 ?auto_10514 ) ) ( not ( = ?auto_10507 ?auto_10514 ) ) ( ON ?auto_10507 ?auto_10506 ) ( not ( = ?auto_10506 ?auto_10507 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( not ( = ?auto_10506 ?auto_10509 ) ) ( not ( = ?auto_10506 ?auto_10514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10507 ?auto_10508 ?auto_10509 )
      ( MAKE-3CRATE-VERIFY ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10509 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10516 - SURFACE
      ?auto_10517 - SURFACE
      ?auto_10518 - SURFACE
      ?auto_10519 - SURFACE
      ?auto_10520 - SURFACE
    )
    :vars
    (
      ?auto_10523 - HOIST
      ?auto_10524 - PLACE
      ?auto_10521 - TRUCK
      ?auto_10522 - PLACE
      ?auto_10526 - HOIST
      ?auto_10525 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10523 ?auto_10524 ) ( SURFACE-AT ?auto_10519 ?auto_10524 ) ( CLEAR ?auto_10519 ) ( IS-CRATE ?auto_10520 ) ( not ( = ?auto_10519 ?auto_10520 ) ) ( AVAILABLE ?auto_10523 ) ( ON ?auto_10519 ?auto_10518 ) ( not ( = ?auto_10518 ?auto_10519 ) ) ( not ( = ?auto_10518 ?auto_10520 ) ) ( TRUCK-AT ?auto_10521 ?auto_10522 ) ( not ( = ?auto_10522 ?auto_10524 ) ) ( HOIST-AT ?auto_10526 ?auto_10522 ) ( not ( = ?auto_10523 ?auto_10526 ) ) ( AVAILABLE ?auto_10526 ) ( SURFACE-AT ?auto_10520 ?auto_10522 ) ( ON ?auto_10520 ?auto_10525 ) ( CLEAR ?auto_10520 ) ( not ( = ?auto_10519 ?auto_10525 ) ) ( not ( = ?auto_10520 ?auto_10525 ) ) ( not ( = ?auto_10518 ?auto_10525 ) ) ( ON ?auto_10517 ?auto_10516 ) ( ON ?auto_10518 ?auto_10517 ) ( not ( = ?auto_10516 ?auto_10517 ) ) ( not ( = ?auto_10516 ?auto_10518 ) ) ( not ( = ?auto_10516 ?auto_10519 ) ) ( not ( = ?auto_10516 ?auto_10520 ) ) ( not ( = ?auto_10516 ?auto_10525 ) ) ( not ( = ?auto_10517 ?auto_10518 ) ) ( not ( = ?auto_10517 ?auto_10519 ) ) ( not ( = ?auto_10517 ?auto_10520 ) ) ( not ( = ?auto_10517 ?auto_10525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10518 ?auto_10519 ?auto_10520 )
      ( MAKE-4CRATE-VERIFY ?auto_10516 ?auto_10517 ?auto_10518 ?auto_10519 ?auto_10520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10527 - SURFACE
      ?auto_10528 - SURFACE
    )
    :vars
    (
      ?auto_10531 - HOIST
      ?auto_10532 - PLACE
      ?auto_10533 - SURFACE
      ?auto_10530 - PLACE
      ?auto_10535 - HOIST
      ?auto_10534 - SURFACE
      ?auto_10529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10531 ?auto_10532 ) ( SURFACE-AT ?auto_10527 ?auto_10532 ) ( CLEAR ?auto_10527 ) ( IS-CRATE ?auto_10528 ) ( not ( = ?auto_10527 ?auto_10528 ) ) ( AVAILABLE ?auto_10531 ) ( ON ?auto_10527 ?auto_10533 ) ( not ( = ?auto_10533 ?auto_10527 ) ) ( not ( = ?auto_10533 ?auto_10528 ) ) ( not ( = ?auto_10530 ?auto_10532 ) ) ( HOIST-AT ?auto_10535 ?auto_10530 ) ( not ( = ?auto_10531 ?auto_10535 ) ) ( AVAILABLE ?auto_10535 ) ( SURFACE-AT ?auto_10528 ?auto_10530 ) ( ON ?auto_10528 ?auto_10534 ) ( CLEAR ?auto_10528 ) ( not ( = ?auto_10527 ?auto_10534 ) ) ( not ( = ?auto_10528 ?auto_10534 ) ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( TRUCK-AT ?auto_10529 ?auto_10532 ) )
    :subtasks
    ( ( !DRIVE ?auto_10529 ?auto_10532 ?auto_10530 )
      ( MAKE-2CRATE ?auto_10533 ?auto_10527 ?auto_10528 )
      ( MAKE-1CRATE-VERIFY ?auto_10527 ?auto_10528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10536 - SURFACE
      ?auto_10537 - SURFACE
      ?auto_10538 - SURFACE
    )
    :vars
    (
      ?auto_10542 - HOIST
      ?auto_10541 - PLACE
      ?auto_10543 - PLACE
      ?auto_10539 - HOIST
      ?auto_10540 - SURFACE
      ?auto_10544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10542 ?auto_10541 ) ( SURFACE-AT ?auto_10537 ?auto_10541 ) ( CLEAR ?auto_10537 ) ( IS-CRATE ?auto_10538 ) ( not ( = ?auto_10537 ?auto_10538 ) ) ( AVAILABLE ?auto_10542 ) ( ON ?auto_10537 ?auto_10536 ) ( not ( = ?auto_10536 ?auto_10537 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10543 ?auto_10541 ) ) ( HOIST-AT ?auto_10539 ?auto_10543 ) ( not ( = ?auto_10542 ?auto_10539 ) ) ( AVAILABLE ?auto_10539 ) ( SURFACE-AT ?auto_10538 ?auto_10543 ) ( ON ?auto_10538 ?auto_10540 ) ( CLEAR ?auto_10538 ) ( not ( = ?auto_10537 ?auto_10540 ) ) ( not ( = ?auto_10538 ?auto_10540 ) ) ( not ( = ?auto_10536 ?auto_10540 ) ) ( TRUCK-AT ?auto_10544 ?auto_10541 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10537 ?auto_10538 )
      ( MAKE-2CRATE-VERIFY ?auto_10536 ?auto_10537 ?auto_10538 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10545 - SURFACE
      ?auto_10546 - SURFACE
      ?auto_10547 - SURFACE
      ?auto_10548 - SURFACE
    )
    :vars
    (
      ?auto_10549 - HOIST
      ?auto_10550 - PLACE
      ?auto_10552 - PLACE
      ?auto_10551 - HOIST
      ?auto_10553 - SURFACE
      ?auto_10554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10549 ?auto_10550 ) ( SURFACE-AT ?auto_10547 ?auto_10550 ) ( CLEAR ?auto_10547 ) ( IS-CRATE ?auto_10548 ) ( not ( = ?auto_10547 ?auto_10548 ) ) ( AVAILABLE ?auto_10549 ) ( ON ?auto_10547 ?auto_10546 ) ( not ( = ?auto_10546 ?auto_10547 ) ) ( not ( = ?auto_10546 ?auto_10548 ) ) ( not ( = ?auto_10552 ?auto_10550 ) ) ( HOIST-AT ?auto_10551 ?auto_10552 ) ( not ( = ?auto_10549 ?auto_10551 ) ) ( AVAILABLE ?auto_10551 ) ( SURFACE-AT ?auto_10548 ?auto_10552 ) ( ON ?auto_10548 ?auto_10553 ) ( CLEAR ?auto_10548 ) ( not ( = ?auto_10547 ?auto_10553 ) ) ( not ( = ?auto_10548 ?auto_10553 ) ) ( not ( = ?auto_10546 ?auto_10553 ) ) ( TRUCK-AT ?auto_10554 ?auto_10550 ) ( ON ?auto_10546 ?auto_10545 ) ( not ( = ?auto_10545 ?auto_10546 ) ) ( not ( = ?auto_10545 ?auto_10547 ) ) ( not ( = ?auto_10545 ?auto_10548 ) ) ( not ( = ?auto_10545 ?auto_10553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10546 ?auto_10547 ?auto_10548 )
      ( MAKE-3CRATE-VERIFY ?auto_10545 ?auto_10546 ?auto_10547 ?auto_10548 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10555 - SURFACE
      ?auto_10556 - SURFACE
      ?auto_10557 - SURFACE
      ?auto_10558 - SURFACE
      ?auto_10559 - SURFACE
    )
    :vars
    (
      ?auto_10560 - HOIST
      ?auto_10561 - PLACE
      ?auto_10563 - PLACE
      ?auto_10562 - HOIST
      ?auto_10564 - SURFACE
      ?auto_10565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10560 ?auto_10561 ) ( SURFACE-AT ?auto_10558 ?auto_10561 ) ( CLEAR ?auto_10558 ) ( IS-CRATE ?auto_10559 ) ( not ( = ?auto_10558 ?auto_10559 ) ) ( AVAILABLE ?auto_10560 ) ( ON ?auto_10558 ?auto_10557 ) ( not ( = ?auto_10557 ?auto_10558 ) ) ( not ( = ?auto_10557 ?auto_10559 ) ) ( not ( = ?auto_10563 ?auto_10561 ) ) ( HOIST-AT ?auto_10562 ?auto_10563 ) ( not ( = ?auto_10560 ?auto_10562 ) ) ( AVAILABLE ?auto_10562 ) ( SURFACE-AT ?auto_10559 ?auto_10563 ) ( ON ?auto_10559 ?auto_10564 ) ( CLEAR ?auto_10559 ) ( not ( = ?auto_10558 ?auto_10564 ) ) ( not ( = ?auto_10559 ?auto_10564 ) ) ( not ( = ?auto_10557 ?auto_10564 ) ) ( TRUCK-AT ?auto_10565 ?auto_10561 ) ( ON ?auto_10556 ?auto_10555 ) ( ON ?auto_10557 ?auto_10556 ) ( not ( = ?auto_10555 ?auto_10556 ) ) ( not ( = ?auto_10555 ?auto_10557 ) ) ( not ( = ?auto_10555 ?auto_10558 ) ) ( not ( = ?auto_10555 ?auto_10559 ) ) ( not ( = ?auto_10555 ?auto_10564 ) ) ( not ( = ?auto_10556 ?auto_10557 ) ) ( not ( = ?auto_10556 ?auto_10558 ) ) ( not ( = ?auto_10556 ?auto_10559 ) ) ( not ( = ?auto_10556 ?auto_10564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10557 ?auto_10558 ?auto_10559 )
      ( MAKE-4CRATE-VERIFY ?auto_10555 ?auto_10556 ?auto_10557 ?auto_10558 ?auto_10559 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10566 - SURFACE
      ?auto_10567 - SURFACE
    )
    :vars
    (
      ?auto_10568 - HOIST
      ?auto_10569 - PLACE
      ?auto_10571 - SURFACE
      ?auto_10572 - PLACE
      ?auto_10570 - HOIST
      ?auto_10573 - SURFACE
      ?auto_10574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10568 ?auto_10569 ) ( IS-CRATE ?auto_10567 ) ( not ( = ?auto_10566 ?auto_10567 ) ) ( not ( = ?auto_10571 ?auto_10566 ) ) ( not ( = ?auto_10571 ?auto_10567 ) ) ( not ( = ?auto_10572 ?auto_10569 ) ) ( HOIST-AT ?auto_10570 ?auto_10572 ) ( not ( = ?auto_10568 ?auto_10570 ) ) ( AVAILABLE ?auto_10570 ) ( SURFACE-AT ?auto_10567 ?auto_10572 ) ( ON ?auto_10567 ?auto_10573 ) ( CLEAR ?auto_10567 ) ( not ( = ?auto_10566 ?auto_10573 ) ) ( not ( = ?auto_10567 ?auto_10573 ) ) ( not ( = ?auto_10571 ?auto_10573 ) ) ( TRUCK-AT ?auto_10574 ?auto_10569 ) ( SURFACE-AT ?auto_10571 ?auto_10569 ) ( CLEAR ?auto_10571 ) ( LIFTING ?auto_10568 ?auto_10566 ) ( IS-CRATE ?auto_10566 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10571 ?auto_10566 )
      ( MAKE-2CRATE ?auto_10571 ?auto_10566 ?auto_10567 )
      ( MAKE-1CRATE-VERIFY ?auto_10566 ?auto_10567 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10575 - SURFACE
      ?auto_10576 - SURFACE
      ?auto_10577 - SURFACE
    )
    :vars
    (
      ?auto_10578 - HOIST
      ?auto_10582 - PLACE
      ?auto_10581 - PLACE
      ?auto_10583 - HOIST
      ?auto_10580 - SURFACE
      ?auto_10579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10578 ?auto_10582 ) ( IS-CRATE ?auto_10577 ) ( not ( = ?auto_10576 ?auto_10577 ) ) ( not ( = ?auto_10575 ?auto_10576 ) ) ( not ( = ?auto_10575 ?auto_10577 ) ) ( not ( = ?auto_10581 ?auto_10582 ) ) ( HOIST-AT ?auto_10583 ?auto_10581 ) ( not ( = ?auto_10578 ?auto_10583 ) ) ( AVAILABLE ?auto_10583 ) ( SURFACE-AT ?auto_10577 ?auto_10581 ) ( ON ?auto_10577 ?auto_10580 ) ( CLEAR ?auto_10577 ) ( not ( = ?auto_10576 ?auto_10580 ) ) ( not ( = ?auto_10577 ?auto_10580 ) ) ( not ( = ?auto_10575 ?auto_10580 ) ) ( TRUCK-AT ?auto_10579 ?auto_10582 ) ( SURFACE-AT ?auto_10575 ?auto_10582 ) ( CLEAR ?auto_10575 ) ( LIFTING ?auto_10578 ?auto_10576 ) ( IS-CRATE ?auto_10576 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10576 ?auto_10577 )
      ( MAKE-2CRATE-VERIFY ?auto_10575 ?auto_10576 ?auto_10577 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10584 - SURFACE
      ?auto_10585 - SURFACE
      ?auto_10586 - SURFACE
      ?auto_10587 - SURFACE
    )
    :vars
    (
      ?auto_10593 - HOIST
      ?auto_10590 - PLACE
      ?auto_10589 - PLACE
      ?auto_10591 - HOIST
      ?auto_10588 - SURFACE
      ?auto_10592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10593 ?auto_10590 ) ( IS-CRATE ?auto_10587 ) ( not ( = ?auto_10586 ?auto_10587 ) ) ( not ( = ?auto_10585 ?auto_10586 ) ) ( not ( = ?auto_10585 ?auto_10587 ) ) ( not ( = ?auto_10589 ?auto_10590 ) ) ( HOIST-AT ?auto_10591 ?auto_10589 ) ( not ( = ?auto_10593 ?auto_10591 ) ) ( AVAILABLE ?auto_10591 ) ( SURFACE-AT ?auto_10587 ?auto_10589 ) ( ON ?auto_10587 ?auto_10588 ) ( CLEAR ?auto_10587 ) ( not ( = ?auto_10586 ?auto_10588 ) ) ( not ( = ?auto_10587 ?auto_10588 ) ) ( not ( = ?auto_10585 ?auto_10588 ) ) ( TRUCK-AT ?auto_10592 ?auto_10590 ) ( SURFACE-AT ?auto_10585 ?auto_10590 ) ( CLEAR ?auto_10585 ) ( LIFTING ?auto_10593 ?auto_10586 ) ( IS-CRATE ?auto_10586 ) ( ON ?auto_10585 ?auto_10584 ) ( not ( = ?auto_10584 ?auto_10585 ) ) ( not ( = ?auto_10584 ?auto_10586 ) ) ( not ( = ?auto_10584 ?auto_10587 ) ) ( not ( = ?auto_10584 ?auto_10588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10585 ?auto_10586 ?auto_10587 )
      ( MAKE-3CRATE-VERIFY ?auto_10584 ?auto_10585 ?auto_10586 ?auto_10587 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10594 - SURFACE
      ?auto_10595 - SURFACE
      ?auto_10596 - SURFACE
      ?auto_10597 - SURFACE
      ?auto_10598 - SURFACE
    )
    :vars
    (
      ?auto_10604 - HOIST
      ?auto_10601 - PLACE
      ?auto_10600 - PLACE
      ?auto_10602 - HOIST
      ?auto_10599 - SURFACE
      ?auto_10603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10604 ?auto_10601 ) ( IS-CRATE ?auto_10598 ) ( not ( = ?auto_10597 ?auto_10598 ) ) ( not ( = ?auto_10596 ?auto_10597 ) ) ( not ( = ?auto_10596 ?auto_10598 ) ) ( not ( = ?auto_10600 ?auto_10601 ) ) ( HOIST-AT ?auto_10602 ?auto_10600 ) ( not ( = ?auto_10604 ?auto_10602 ) ) ( AVAILABLE ?auto_10602 ) ( SURFACE-AT ?auto_10598 ?auto_10600 ) ( ON ?auto_10598 ?auto_10599 ) ( CLEAR ?auto_10598 ) ( not ( = ?auto_10597 ?auto_10599 ) ) ( not ( = ?auto_10598 ?auto_10599 ) ) ( not ( = ?auto_10596 ?auto_10599 ) ) ( TRUCK-AT ?auto_10603 ?auto_10601 ) ( SURFACE-AT ?auto_10596 ?auto_10601 ) ( CLEAR ?auto_10596 ) ( LIFTING ?auto_10604 ?auto_10597 ) ( IS-CRATE ?auto_10597 ) ( ON ?auto_10595 ?auto_10594 ) ( ON ?auto_10596 ?auto_10595 ) ( not ( = ?auto_10594 ?auto_10595 ) ) ( not ( = ?auto_10594 ?auto_10596 ) ) ( not ( = ?auto_10594 ?auto_10597 ) ) ( not ( = ?auto_10594 ?auto_10598 ) ) ( not ( = ?auto_10594 ?auto_10599 ) ) ( not ( = ?auto_10595 ?auto_10596 ) ) ( not ( = ?auto_10595 ?auto_10597 ) ) ( not ( = ?auto_10595 ?auto_10598 ) ) ( not ( = ?auto_10595 ?auto_10599 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10596 ?auto_10597 ?auto_10598 )
      ( MAKE-4CRATE-VERIFY ?auto_10594 ?auto_10595 ?auto_10596 ?auto_10597 ?auto_10598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10605 - SURFACE
      ?auto_10606 - SURFACE
    )
    :vars
    (
      ?auto_10613 - HOIST
      ?auto_10610 - PLACE
      ?auto_10608 - SURFACE
      ?auto_10609 - PLACE
      ?auto_10611 - HOIST
      ?auto_10607 - SURFACE
      ?auto_10612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10613 ?auto_10610 ) ( IS-CRATE ?auto_10606 ) ( not ( = ?auto_10605 ?auto_10606 ) ) ( not ( = ?auto_10608 ?auto_10605 ) ) ( not ( = ?auto_10608 ?auto_10606 ) ) ( not ( = ?auto_10609 ?auto_10610 ) ) ( HOIST-AT ?auto_10611 ?auto_10609 ) ( not ( = ?auto_10613 ?auto_10611 ) ) ( AVAILABLE ?auto_10611 ) ( SURFACE-AT ?auto_10606 ?auto_10609 ) ( ON ?auto_10606 ?auto_10607 ) ( CLEAR ?auto_10606 ) ( not ( = ?auto_10605 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10607 ) ) ( not ( = ?auto_10608 ?auto_10607 ) ) ( TRUCK-AT ?auto_10612 ?auto_10610 ) ( SURFACE-AT ?auto_10608 ?auto_10610 ) ( CLEAR ?auto_10608 ) ( IS-CRATE ?auto_10605 ) ( AVAILABLE ?auto_10613 ) ( IN ?auto_10605 ?auto_10612 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10613 ?auto_10605 ?auto_10612 ?auto_10610 )
      ( MAKE-2CRATE ?auto_10608 ?auto_10605 ?auto_10606 )
      ( MAKE-1CRATE-VERIFY ?auto_10605 ?auto_10606 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10614 - SURFACE
      ?auto_10615 - SURFACE
      ?auto_10616 - SURFACE
    )
    :vars
    (
      ?auto_10617 - HOIST
      ?auto_10621 - PLACE
      ?auto_10618 - PLACE
      ?auto_10619 - HOIST
      ?auto_10620 - SURFACE
      ?auto_10622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10617 ?auto_10621 ) ( IS-CRATE ?auto_10616 ) ( not ( = ?auto_10615 ?auto_10616 ) ) ( not ( = ?auto_10614 ?auto_10615 ) ) ( not ( = ?auto_10614 ?auto_10616 ) ) ( not ( = ?auto_10618 ?auto_10621 ) ) ( HOIST-AT ?auto_10619 ?auto_10618 ) ( not ( = ?auto_10617 ?auto_10619 ) ) ( AVAILABLE ?auto_10619 ) ( SURFACE-AT ?auto_10616 ?auto_10618 ) ( ON ?auto_10616 ?auto_10620 ) ( CLEAR ?auto_10616 ) ( not ( = ?auto_10615 ?auto_10620 ) ) ( not ( = ?auto_10616 ?auto_10620 ) ) ( not ( = ?auto_10614 ?auto_10620 ) ) ( TRUCK-AT ?auto_10622 ?auto_10621 ) ( SURFACE-AT ?auto_10614 ?auto_10621 ) ( CLEAR ?auto_10614 ) ( IS-CRATE ?auto_10615 ) ( AVAILABLE ?auto_10617 ) ( IN ?auto_10615 ?auto_10622 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10615 ?auto_10616 )
      ( MAKE-2CRATE-VERIFY ?auto_10614 ?auto_10615 ?auto_10616 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10623 - SURFACE
      ?auto_10624 - SURFACE
      ?auto_10625 - SURFACE
      ?auto_10626 - SURFACE
    )
    :vars
    (
      ?auto_10628 - HOIST
      ?auto_10630 - PLACE
      ?auto_10627 - PLACE
      ?auto_10629 - HOIST
      ?auto_10631 - SURFACE
      ?auto_10632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10628 ?auto_10630 ) ( IS-CRATE ?auto_10626 ) ( not ( = ?auto_10625 ?auto_10626 ) ) ( not ( = ?auto_10624 ?auto_10625 ) ) ( not ( = ?auto_10624 ?auto_10626 ) ) ( not ( = ?auto_10627 ?auto_10630 ) ) ( HOIST-AT ?auto_10629 ?auto_10627 ) ( not ( = ?auto_10628 ?auto_10629 ) ) ( AVAILABLE ?auto_10629 ) ( SURFACE-AT ?auto_10626 ?auto_10627 ) ( ON ?auto_10626 ?auto_10631 ) ( CLEAR ?auto_10626 ) ( not ( = ?auto_10625 ?auto_10631 ) ) ( not ( = ?auto_10626 ?auto_10631 ) ) ( not ( = ?auto_10624 ?auto_10631 ) ) ( TRUCK-AT ?auto_10632 ?auto_10630 ) ( SURFACE-AT ?auto_10624 ?auto_10630 ) ( CLEAR ?auto_10624 ) ( IS-CRATE ?auto_10625 ) ( AVAILABLE ?auto_10628 ) ( IN ?auto_10625 ?auto_10632 ) ( ON ?auto_10624 ?auto_10623 ) ( not ( = ?auto_10623 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10625 ) ) ( not ( = ?auto_10623 ?auto_10626 ) ) ( not ( = ?auto_10623 ?auto_10631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10624 ?auto_10625 ?auto_10626 )
      ( MAKE-3CRATE-VERIFY ?auto_10623 ?auto_10624 ?auto_10625 ?auto_10626 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10633 - SURFACE
      ?auto_10634 - SURFACE
      ?auto_10635 - SURFACE
      ?auto_10636 - SURFACE
      ?auto_10637 - SURFACE
    )
    :vars
    (
      ?auto_10639 - HOIST
      ?auto_10641 - PLACE
      ?auto_10638 - PLACE
      ?auto_10640 - HOIST
      ?auto_10642 - SURFACE
      ?auto_10643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10639 ?auto_10641 ) ( IS-CRATE ?auto_10637 ) ( not ( = ?auto_10636 ?auto_10637 ) ) ( not ( = ?auto_10635 ?auto_10636 ) ) ( not ( = ?auto_10635 ?auto_10637 ) ) ( not ( = ?auto_10638 ?auto_10641 ) ) ( HOIST-AT ?auto_10640 ?auto_10638 ) ( not ( = ?auto_10639 ?auto_10640 ) ) ( AVAILABLE ?auto_10640 ) ( SURFACE-AT ?auto_10637 ?auto_10638 ) ( ON ?auto_10637 ?auto_10642 ) ( CLEAR ?auto_10637 ) ( not ( = ?auto_10636 ?auto_10642 ) ) ( not ( = ?auto_10637 ?auto_10642 ) ) ( not ( = ?auto_10635 ?auto_10642 ) ) ( TRUCK-AT ?auto_10643 ?auto_10641 ) ( SURFACE-AT ?auto_10635 ?auto_10641 ) ( CLEAR ?auto_10635 ) ( IS-CRATE ?auto_10636 ) ( AVAILABLE ?auto_10639 ) ( IN ?auto_10636 ?auto_10643 ) ( ON ?auto_10634 ?auto_10633 ) ( ON ?auto_10635 ?auto_10634 ) ( not ( = ?auto_10633 ?auto_10634 ) ) ( not ( = ?auto_10633 ?auto_10635 ) ) ( not ( = ?auto_10633 ?auto_10636 ) ) ( not ( = ?auto_10633 ?auto_10637 ) ) ( not ( = ?auto_10633 ?auto_10642 ) ) ( not ( = ?auto_10634 ?auto_10635 ) ) ( not ( = ?auto_10634 ?auto_10636 ) ) ( not ( = ?auto_10634 ?auto_10637 ) ) ( not ( = ?auto_10634 ?auto_10642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10635 ?auto_10636 ?auto_10637 )
      ( MAKE-4CRATE-VERIFY ?auto_10633 ?auto_10634 ?auto_10635 ?auto_10636 ?auto_10637 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10644 - SURFACE
      ?auto_10645 - SURFACE
    )
    :vars
    (
      ?auto_10647 - HOIST
      ?auto_10650 - PLACE
      ?auto_10649 - SURFACE
      ?auto_10646 - PLACE
      ?auto_10648 - HOIST
      ?auto_10651 - SURFACE
      ?auto_10652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10647 ?auto_10650 ) ( IS-CRATE ?auto_10645 ) ( not ( = ?auto_10644 ?auto_10645 ) ) ( not ( = ?auto_10649 ?auto_10644 ) ) ( not ( = ?auto_10649 ?auto_10645 ) ) ( not ( = ?auto_10646 ?auto_10650 ) ) ( HOIST-AT ?auto_10648 ?auto_10646 ) ( not ( = ?auto_10647 ?auto_10648 ) ) ( AVAILABLE ?auto_10648 ) ( SURFACE-AT ?auto_10645 ?auto_10646 ) ( ON ?auto_10645 ?auto_10651 ) ( CLEAR ?auto_10645 ) ( not ( = ?auto_10644 ?auto_10651 ) ) ( not ( = ?auto_10645 ?auto_10651 ) ) ( not ( = ?auto_10649 ?auto_10651 ) ) ( SURFACE-AT ?auto_10649 ?auto_10650 ) ( CLEAR ?auto_10649 ) ( IS-CRATE ?auto_10644 ) ( AVAILABLE ?auto_10647 ) ( IN ?auto_10644 ?auto_10652 ) ( TRUCK-AT ?auto_10652 ?auto_10646 ) )
    :subtasks
    ( ( !DRIVE ?auto_10652 ?auto_10646 ?auto_10650 )
      ( MAKE-2CRATE ?auto_10649 ?auto_10644 ?auto_10645 )
      ( MAKE-1CRATE-VERIFY ?auto_10644 ?auto_10645 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10653 - SURFACE
      ?auto_10654 - SURFACE
      ?auto_10655 - SURFACE
    )
    :vars
    (
      ?auto_10659 - HOIST
      ?auto_10658 - PLACE
      ?auto_10656 - PLACE
      ?auto_10660 - HOIST
      ?auto_10661 - SURFACE
      ?auto_10657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10659 ?auto_10658 ) ( IS-CRATE ?auto_10655 ) ( not ( = ?auto_10654 ?auto_10655 ) ) ( not ( = ?auto_10653 ?auto_10654 ) ) ( not ( = ?auto_10653 ?auto_10655 ) ) ( not ( = ?auto_10656 ?auto_10658 ) ) ( HOIST-AT ?auto_10660 ?auto_10656 ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( AVAILABLE ?auto_10660 ) ( SURFACE-AT ?auto_10655 ?auto_10656 ) ( ON ?auto_10655 ?auto_10661 ) ( CLEAR ?auto_10655 ) ( not ( = ?auto_10654 ?auto_10661 ) ) ( not ( = ?auto_10655 ?auto_10661 ) ) ( not ( = ?auto_10653 ?auto_10661 ) ) ( SURFACE-AT ?auto_10653 ?auto_10658 ) ( CLEAR ?auto_10653 ) ( IS-CRATE ?auto_10654 ) ( AVAILABLE ?auto_10659 ) ( IN ?auto_10654 ?auto_10657 ) ( TRUCK-AT ?auto_10657 ?auto_10656 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10654 ?auto_10655 )
      ( MAKE-2CRATE-VERIFY ?auto_10653 ?auto_10654 ?auto_10655 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10662 - SURFACE
      ?auto_10663 - SURFACE
      ?auto_10664 - SURFACE
      ?auto_10665 - SURFACE
    )
    :vars
    (
      ?auto_10668 - HOIST
      ?auto_10671 - PLACE
      ?auto_10669 - PLACE
      ?auto_10670 - HOIST
      ?auto_10666 - SURFACE
      ?auto_10667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10668 ?auto_10671 ) ( IS-CRATE ?auto_10665 ) ( not ( = ?auto_10664 ?auto_10665 ) ) ( not ( = ?auto_10663 ?auto_10664 ) ) ( not ( = ?auto_10663 ?auto_10665 ) ) ( not ( = ?auto_10669 ?auto_10671 ) ) ( HOIST-AT ?auto_10670 ?auto_10669 ) ( not ( = ?auto_10668 ?auto_10670 ) ) ( AVAILABLE ?auto_10670 ) ( SURFACE-AT ?auto_10665 ?auto_10669 ) ( ON ?auto_10665 ?auto_10666 ) ( CLEAR ?auto_10665 ) ( not ( = ?auto_10664 ?auto_10666 ) ) ( not ( = ?auto_10665 ?auto_10666 ) ) ( not ( = ?auto_10663 ?auto_10666 ) ) ( SURFACE-AT ?auto_10663 ?auto_10671 ) ( CLEAR ?auto_10663 ) ( IS-CRATE ?auto_10664 ) ( AVAILABLE ?auto_10668 ) ( IN ?auto_10664 ?auto_10667 ) ( TRUCK-AT ?auto_10667 ?auto_10669 ) ( ON ?auto_10663 ?auto_10662 ) ( not ( = ?auto_10662 ?auto_10663 ) ) ( not ( = ?auto_10662 ?auto_10664 ) ) ( not ( = ?auto_10662 ?auto_10665 ) ) ( not ( = ?auto_10662 ?auto_10666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10663 ?auto_10664 ?auto_10665 )
      ( MAKE-3CRATE-VERIFY ?auto_10662 ?auto_10663 ?auto_10664 ?auto_10665 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10672 - SURFACE
      ?auto_10673 - SURFACE
      ?auto_10674 - SURFACE
      ?auto_10675 - SURFACE
      ?auto_10676 - SURFACE
    )
    :vars
    (
      ?auto_10679 - HOIST
      ?auto_10682 - PLACE
      ?auto_10680 - PLACE
      ?auto_10681 - HOIST
      ?auto_10677 - SURFACE
      ?auto_10678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10679 ?auto_10682 ) ( IS-CRATE ?auto_10676 ) ( not ( = ?auto_10675 ?auto_10676 ) ) ( not ( = ?auto_10674 ?auto_10675 ) ) ( not ( = ?auto_10674 ?auto_10676 ) ) ( not ( = ?auto_10680 ?auto_10682 ) ) ( HOIST-AT ?auto_10681 ?auto_10680 ) ( not ( = ?auto_10679 ?auto_10681 ) ) ( AVAILABLE ?auto_10681 ) ( SURFACE-AT ?auto_10676 ?auto_10680 ) ( ON ?auto_10676 ?auto_10677 ) ( CLEAR ?auto_10676 ) ( not ( = ?auto_10675 ?auto_10677 ) ) ( not ( = ?auto_10676 ?auto_10677 ) ) ( not ( = ?auto_10674 ?auto_10677 ) ) ( SURFACE-AT ?auto_10674 ?auto_10682 ) ( CLEAR ?auto_10674 ) ( IS-CRATE ?auto_10675 ) ( AVAILABLE ?auto_10679 ) ( IN ?auto_10675 ?auto_10678 ) ( TRUCK-AT ?auto_10678 ?auto_10680 ) ( ON ?auto_10673 ?auto_10672 ) ( ON ?auto_10674 ?auto_10673 ) ( not ( = ?auto_10672 ?auto_10673 ) ) ( not ( = ?auto_10672 ?auto_10674 ) ) ( not ( = ?auto_10672 ?auto_10675 ) ) ( not ( = ?auto_10672 ?auto_10676 ) ) ( not ( = ?auto_10672 ?auto_10677 ) ) ( not ( = ?auto_10673 ?auto_10674 ) ) ( not ( = ?auto_10673 ?auto_10675 ) ) ( not ( = ?auto_10673 ?auto_10676 ) ) ( not ( = ?auto_10673 ?auto_10677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10674 ?auto_10675 ?auto_10676 )
      ( MAKE-4CRATE-VERIFY ?auto_10672 ?auto_10673 ?auto_10674 ?auto_10675 ?auto_10676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10683 - SURFACE
      ?auto_10684 - SURFACE
    )
    :vars
    (
      ?auto_10687 - HOIST
      ?auto_10691 - PLACE
      ?auto_10690 - SURFACE
      ?auto_10688 - PLACE
      ?auto_10689 - HOIST
      ?auto_10685 - SURFACE
      ?auto_10686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10687 ?auto_10691 ) ( IS-CRATE ?auto_10684 ) ( not ( = ?auto_10683 ?auto_10684 ) ) ( not ( = ?auto_10690 ?auto_10683 ) ) ( not ( = ?auto_10690 ?auto_10684 ) ) ( not ( = ?auto_10688 ?auto_10691 ) ) ( HOIST-AT ?auto_10689 ?auto_10688 ) ( not ( = ?auto_10687 ?auto_10689 ) ) ( SURFACE-AT ?auto_10684 ?auto_10688 ) ( ON ?auto_10684 ?auto_10685 ) ( CLEAR ?auto_10684 ) ( not ( = ?auto_10683 ?auto_10685 ) ) ( not ( = ?auto_10684 ?auto_10685 ) ) ( not ( = ?auto_10690 ?auto_10685 ) ) ( SURFACE-AT ?auto_10690 ?auto_10691 ) ( CLEAR ?auto_10690 ) ( IS-CRATE ?auto_10683 ) ( AVAILABLE ?auto_10687 ) ( TRUCK-AT ?auto_10686 ?auto_10688 ) ( LIFTING ?auto_10689 ?auto_10683 ) )
    :subtasks
    ( ( !LOAD ?auto_10689 ?auto_10683 ?auto_10686 ?auto_10688 )
      ( MAKE-2CRATE ?auto_10690 ?auto_10683 ?auto_10684 )
      ( MAKE-1CRATE-VERIFY ?auto_10683 ?auto_10684 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10692 - SURFACE
      ?auto_10693 - SURFACE
      ?auto_10694 - SURFACE
    )
    :vars
    (
      ?auto_10696 - HOIST
      ?auto_10700 - PLACE
      ?auto_10697 - PLACE
      ?auto_10698 - HOIST
      ?auto_10699 - SURFACE
      ?auto_10695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10696 ?auto_10700 ) ( IS-CRATE ?auto_10694 ) ( not ( = ?auto_10693 ?auto_10694 ) ) ( not ( = ?auto_10692 ?auto_10693 ) ) ( not ( = ?auto_10692 ?auto_10694 ) ) ( not ( = ?auto_10697 ?auto_10700 ) ) ( HOIST-AT ?auto_10698 ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10698 ) ) ( SURFACE-AT ?auto_10694 ?auto_10697 ) ( ON ?auto_10694 ?auto_10699 ) ( CLEAR ?auto_10694 ) ( not ( = ?auto_10693 ?auto_10699 ) ) ( not ( = ?auto_10694 ?auto_10699 ) ) ( not ( = ?auto_10692 ?auto_10699 ) ) ( SURFACE-AT ?auto_10692 ?auto_10700 ) ( CLEAR ?auto_10692 ) ( IS-CRATE ?auto_10693 ) ( AVAILABLE ?auto_10696 ) ( TRUCK-AT ?auto_10695 ?auto_10697 ) ( LIFTING ?auto_10698 ?auto_10693 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10693 ?auto_10694 )
      ( MAKE-2CRATE-VERIFY ?auto_10692 ?auto_10693 ?auto_10694 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10701 - SURFACE
      ?auto_10702 - SURFACE
      ?auto_10703 - SURFACE
      ?auto_10704 - SURFACE
    )
    :vars
    (
      ?auto_10710 - HOIST
      ?auto_10706 - PLACE
      ?auto_10707 - PLACE
      ?auto_10709 - HOIST
      ?auto_10708 - SURFACE
      ?auto_10705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10710 ?auto_10706 ) ( IS-CRATE ?auto_10704 ) ( not ( = ?auto_10703 ?auto_10704 ) ) ( not ( = ?auto_10702 ?auto_10703 ) ) ( not ( = ?auto_10702 ?auto_10704 ) ) ( not ( = ?auto_10707 ?auto_10706 ) ) ( HOIST-AT ?auto_10709 ?auto_10707 ) ( not ( = ?auto_10710 ?auto_10709 ) ) ( SURFACE-AT ?auto_10704 ?auto_10707 ) ( ON ?auto_10704 ?auto_10708 ) ( CLEAR ?auto_10704 ) ( not ( = ?auto_10703 ?auto_10708 ) ) ( not ( = ?auto_10704 ?auto_10708 ) ) ( not ( = ?auto_10702 ?auto_10708 ) ) ( SURFACE-AT ?auto_10702 ?auto_10706 ) ( CLEAR ?auto_10702 ) ( IS-CRATE ?auto_10703 ) ( AVAILABLE ?auto_10710 ) ( TRUCK-AT ?auto_10705 ?auto_10707 ) ( LIFTING ?auto_10709 ?auto_10703 ) ( ON ?auto_10702 ?auto_10701 ) ( not ( = ?auto_10701 ?auto_10702 ) ) ( not ( = ?auto_10701 ?auto_10703 ) ) ( not ( = ?auto_10701 ?auto_10704 ) ) ( not ( = ?auto_10701 ?auto_10708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10702 ?auto_10703 ?auto_10704 )
      ( MAKE-3CRATE-VERIFY ?auto_10701 ?auto_10702 ?auto_10703 ?auto_10704 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10711 - SURFACE
      ?auto_10712 - SURFACE
      ?auto_10713 - SURFACE
      ?auto_10714 - SURFACE
      ?auto_10715 - SURFACE
    )
    :vars
    (
      ?auto_10721 - HOIST
      ?auto_10717 - PLACE
      ?auto_10718 - PLACE
      ?auto_10720 - HOIST
      ?auto_10719 - SURFACE
      ?auto_10716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10721 ?auto_10717 ) ( IS-CRATE ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10715 ) ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10715 ) ) ( not ( = ?auto_10718 ?auto_10717 ) ) ( HOIST-AT ?auto_10720 ?auto_10718 ) ( not ( = ?auto_10721 ?auto_10720 ) ) ( SURFACE-AT ?auto_10715 ?auto_10718 ) ( ON ?auto_10715 ?auto_10719 ) ( CLEAR ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10719 ) ) ( not ( = ?auto_10715 ?auto_10719 ) ) ( not ( = ?auto_10713 ?auto_10719 ) ) ( SURFACE-AT ?auto_10713 ?auto_10717 ) ( CLEAR ?auto_10713 ) ( IS-CRATE ?auto_10714 ) ( AVAILABLE ?auto_10721 ) ( TRUCK-AT ?auto_10716 ?auto_10718 ) ( LIFTING ?auto_10720 ?auto_10714 ) ( ON ?auto_10712 ?auto_10711 ) ( ON ?auto_10713 ?auto_10712 ) ( not ( = ?auto_10711 ?auto_10712 ) ) ( not ( = ?auto_10711 ?auto_10713 ) ) ( not ( = ?auto_10711 ?auto_10714 ) ) ( not ( = ?auto_10711 ?auto_10715 ) ) ( not ( = ?auto_10711 ?auto_10719 ) ) ( not ( = ?auto_10712 ?auto_10713 ) ) ( not ( = ?auto_10712 ?auto_10714 ) ) ( not ( = ?auto_10712 ?auto_10715 ) ) ( not ( = ?auto_10712 ?auto_10719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10713 ?auto_10714 ?auto_10715 )
      ( MAKE-4CRATE-VERIFY ?auto_10711 ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10722 - SURFACE
      ?auto_10723 - SURFACE
    )
    :vars
    (
      ?auto_10730 - HOIST
      ?auto_10725 - PLACE
      ?auto_10726 - SURFACE
      ?auto_10727 - PLACE
      ?auto_10729 - HOIST
      ?auto_10728 - SURFACE
      ?auto_10724 - TRUCK
      ?auto_10731 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10730 ?auto_10725 ) ( IS-CRATE ?auto_10723 ) ( not ( = ?auto_10722 ?auto_10723 ) ) ( not ( = ?auto_10726 ?auto_10722 ) ) ( not ( = ?auto_10726 ?auto_10723 ) ) ( not ( = ?auto_10727 ?auto_10725 ) ) ( HOIST-AT ?auto_10729 ?auto_10727 ) ( not ( = ?auto_10730 ?auto_10729 ) ) ( SURFACE-AT ?auto_10723 ?auto_10727 ) ( ON ?auto_10723 ?auto_10728 ) ( CLEAR ?auto_10723 ) ( not ( = ?auto_10722 ?auto_10728 ) ) ( not ( = ?auto_10723 ?auto_10728 ) ) ( not ( = ?auto_10726 ?auto_10728 ) ) ( SURFACE-AT ?auto_10726 ?auto_10725 ) ( CLEAR ?auto_10726 ) ( IS-CRATE ?auto_10722 ) ( AVAILABLE ?auto_10730 ) ( TRUCK-AT ?auto_10724 ?auto_10727 ) ( AVAILABLE ?auto_10729 ) ( SURFACE-AT ?auto_10722 ?auto_10727 ) ( ON ?auto_10722 ?auto_10731 ) ( CLEAR ?auto_10722 ) ( not ( = ?auto_10722 ?auto_10731 ) ) ( not ( = ?auto_10723 ?auto_10731 ) ) ( not ( = ?auto_10726 ?auto_10731 ) ) ( not ( = ?auto_10728 ?auto_10731 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10729 ?auto_10722 ?auto_10731 ?auto_10727 )
      ( MAKE-2CRATE ?auto_10726 ?auto_10722 ?auto_10723 )
      ( MAKE-1CRATE-VERIFY ?auto_10722 ?auto_10723 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10732 - SURFACE
      ?auto_10733 - SURFACE
      ?auto_10734 - SURFACE
    )
    :vars
    (
      ?auto_10738 - HOIST
      ?auto_10740 - PLACE
      ?auto_10741 - PLACE
      ?auto_10739 - HOIST
      ?auto_10737 - SURFACE
      ?auto_10735 - TRUCK
      ?auto_10736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10738 ?auto_10740 ) ( IS-CRATE ?auto_10734 ) ( not ( = ?auto_10733 ?auto_10734 ) ) ( not ( = ?auto_10732 ?auto_10733 ) ) ( not ( = ?auto_10732 ?auto_10734 ) ) ( not ( = ?auto_10741 ?auto_10740 ) ) ( HOIST-AT ?auto_10739 ?auto_10741 ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( SURFACE-AT ?auto_10734 ?auto_10741 ) ( ON ?auto_10734 ?auto_10737 ) ( CLEAR ?auto_10734 ) ( not ( = ?auto_10733 ?auto_10737 ) ) ( not ( = ?auto_10734 ?auto_10737 ) ) ( not ( = ?auto_10732 ?auto_10737 ) ) ( SURFACE-AT ?auto_10732 ?auto_10740 ) ( CLEAR ?auto_10732 ) ( IS-CRATE ?auto_10733 ) ( AVAILABLE ?auto_10738 ) ( TRUCK-AT ?auto_10735 ?auto_10741 ) ( AVAILABLE ?auto_10739 ) ( SURFACE-AT ?auto_10733 ?auto_10741 ) ( ON ?auto_10733 ?auto_10736 ) ( CLEAR ?auto_10733 ) ( not ( = ?auto_10733 ?auto_10736 ) ) ( not ( = ?auto_10734 ?auto_10736 ) ) ( not ( = ?auto_10732 ?auto_10736 ) ) ( not ( = ?auto_10737 ?auto_10736 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10733 ?auto_10734 )
      ( MAKE-2CRATE-VERIFY ?auto_10732 ?auto_10733 ?auto_10734 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10742 - SURFACE
      ?auto_10743 - SURFACE
      ?auto_10744 - SURFACE
      ?auto_10745 - SURFACE
    )
    :vars
    (
      ?auto_10751 - HOIST
      ?auto_10752 - PLACE
      ?auto_10747 - PLACE
      ?auto_10750 - HOIST
      ?auto_10748 - SURFACE
      ?auto_10746 - TRUCK
      ?auto_10749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10751 ?auto_10752 ) ( IS-CRATE ?auto_10745 ) ( not ( = ?auto_10744 ?auto_10745 ) ) ( not ( = ?auto_10743 ?auto_10744 ) ) ( not ( = ?auto_10743 ?auto_10745 ) ) ( not ( = ?auto_10747 ?auto_10752 ) ) ( HOIST-AT ?auto_10750 ?auto_10747 ) ( not ( = ?auto_10751 ?auto_10750 ) ) ( SURFACE-AT ?auto_10745 ?auto_10747 ) ( ON ?auto_10745 ?auto_10748 ) ( CLEAR ?auto_10745 ) ( not ( = ?auto_10744 ?auto_10748 ) ) ( not ( = ?auto_10745 ?auto_10748 ) ) ( not ( = ?auto_10743 ?auto_10748 ) ) ( SURFACE-AT ?auto_10743 ?auto_10752 ) ( CLEAR ?auto_10743 ) ( IS-CRATE ?auto_10744 ) ( AVAILABLE ?auto_10751 ) ( TRUCK-AT ?auto_10746 ?auto_10747 ) ( AVAILABLE ?auto_10750 ) ( SURFACE-AT ?auto_10744 ?auto_10747 ) ( ON ?auto_10744 ?auto_10749 ) ( CLEAR ?auto_10744 ) ( not ( = ?auto_10744 ?auto_10749 ) ) ( not ( = ?auto_10745 ?auto_10749 ) ) ( not ( = ?auto_10743 ?auto_10749 ) ) ( not ( = ?auto_10748 ?auto_10749 ) ) ( ON ?auto_10743 ?auto_10742 ) ( not ( = ?auto_10742 ?auto_10743 ) ) ( not ( = ?auto_10742 ?auto_10744 ) ) ( not ( = ?auto_10742 ?auto_10745 ) ) ( not ( = ?auto_10742 ?auto_10748 ) ) ( not ( = ?auto_10742 ?auto_10749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10743 ?auto_10744 ?auto_10745 )
      ( MAKE-3CRATE-VERIFY ?auto_10742 ?auto_10743 ?auto_10744 ?auto_10745 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10753 - SURFACE
      ?auto_10754 - SURFACE
      ?auto_10755 - SURFACE
      ?auto_10756 - SURFACE
      ?auto_10757 - SURFACE
    )
    :vars
    (
      ?auto_10763 - HOIST
      ?auto_10764 - PLACE
      ?auto_10759 - PLACE
      ?auto_10762 - HOIST
      ?auto_10760 - SURFACE
      ?auto_10758 - TRUCK
      ?auto_10761 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10763 ?auto_10764 ) ( IS-CRATE ?auto_10757 ) ( not ( = ?auto_10756 ?auto_10757 ) ) ( not ( = ?auto_10755 ?auto_10756 ) ) ( not ( = ?auto_10755 ?auto_10757 ) ) ( not ( = ?auto_10759 ?auto_10764 ) ) ( HOIST-AT ?auto_10762 ?auto_10759 ) ( not ( = ?auto_10763 ?auto_10762 ) ) ( SURFACE-AT ?auto_10757 ?auto_10759 ) ( ON ?auto_10757 ?auto_10760 ) ( CLEAR ?auto_10757 ) ( not ( = ?auto_10756 ?auto_10760 ) ) ( not ( = ?auto_10757 ?auto_10760 ) ) ( not ( = ?auto_10755 ?auto_10760 ) ) ( SURFACE-AT ?auto_10755 ?auto_10764 ) ( CLEAR ?auto_10755 ) ( IS-CRATE ?auto_10756 ) ( AVAILABLE ?auto_10763 ) ( TRUCK-AT ?auto_10758 ?auto_10759 ) ( AVAILABLE ?auto_10762 ) ( SURFACE-AT ?auto_10756 ?auto_10759 ) ( ON ?auto_10756 ?auto_10761 ) ( CLEAR ?auto_10756 ) ( not ( = ?auto_10756 ?auto_10761 ) ) ( not ( = ?auto_10757 ?auto_10761 ) ) ( not ( = ?auto_10755 ?auto_10761 ) ) ( not ( = ?auto_10760 ?auto_10761 ) ) ( ON ?auto_10754 ?auto_10753 ) ( ON ?auto_10755 ?auto_10754 ) ( not ( = ?auto_10753 ?auto_10754 ) ) ( not ( = ?auto_10753 ?auto_10755 ) ) ( not ( = ?auto_10753 ?auto_10756 ) ) ( not ( = ?auto_10753 ?auto_10757 ) ) ( not ( = ?auto_10753 ?auto_10760 ) ) ( not ( = ?auto_10753 ?auto_10761 ) ) ( not ( = ?auto_10754 ?auto_10755 ) ) ( not ( = ?auto_10754 ?auto_10756 ) ) ( not ( = ?auto_10754 ?auto_10757 ) ) ( not ( = ?auto_10754 ?auto_10760 ) ) ( not ( = ?auto_10754 ?auto_10761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10755 ?auto_10756 ?auto_10757 )
      ( MAKE-4CRATE-VERIFY ?auto_10753 ?auto_10754 ?auto_10755 ?auto_10756 ?auto_10757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10765 - SURFACE
      ?auto_10766 - SURFACE
    )
    :vars
    (
      ?auto_10773 - HOIST
      ?auto_10774 - PLACE
      ?auto_10769 - SURFACE
      ?auto_10768 - PLACE
      ?auto_10772 - HOIST
      ?auto_10770 - SURFACE
      ?auto_10771 - SURFACE
      ?auto_10767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10773 ?auto_10774 ) ( IS-CRATE ?auto_10766 ) ( not ( = ?auto_10765 ?auto_10766 ) ) ( not ( = ?auto_10769 ?auto_10765 ) ) ( not ( = ?auto_10769 ?auto_10766 ) ) ( not ( = ?auto_10768 ?auto_10774 ) ) ( HOIST-AT ?auto_10772 ?auto_10768 ) ( not ( = ?auto_10773 ?auto_10772 ) ) ( SURFACE-AT ?auto_10766 ?auto_10768 ) ( ON ?auto_10766 ?auto_10770 ) ( CLEAR ?auto_10766 ) ( not ( = ?auto_10765 ?auto_10770 ) ) ( not ( = ?auto_10766 ?auto_10770 ) ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( SURFACE-AT ?auto_10769 ?auto_10774 ) ( CLEAR ?auto_10769 ) ( IS-CRATE ?auto_10765 ) ( AVAILABLE ?auto_10773 ) ( AVAILABLE ?auto_10772 ) ( SURFACE-AT ?auto_10765 ?auto_10768 ) ( ON ?auto_10765 ?auto_10771 ) ( CLEAR ?auto_10765 ) ( not ( = ?auto_10765 ?auto_10771 ) ) ( not ( = ?auto_10766 ?auto_10771 ) ) ( not ( = ?auto_10769 ?auto_10771 ) ) ( not ( = ?auto_10770 ?auto_10771 ) ) ( TRUCK-AT ?auto_10767 ?auto_10774 ) )
    :subtasks
    ( ( !DRIVE ?auto_10767 ?auto_10774 ?auto_10768 )
      ( MAKE-2CRATE ?auto_10769 ?auto_10765 ?auto_10766 )
      ( MAKE-1CRATE-VERIFY ?auto_10765 ?auto_10766 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10775 - SURFACE
      ?auto_10776 - SURFACE
      ?auto_10777 - SURFACE
    )
    :vars
    (
      ?auto_10784 - HOIST
      ?auto_10778 - PLACE
      ?auto_10781 - PLACE
      ?auto_10780 - HOIST
      ?auto_10783 - SURFACE
      ?auto_10779 - SURFACE
      ?auto_10782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10784 ?auto_10778 ) ( IS-CRATE ?auto_10777 ) ( not ( = ?auto_10776 ?auto_10777 ) ) ( not ( = ?auto_10775 ?auto_10776 ) ) ( not ( = ?auto_10775 ?auto_10777 ) ) ( not ( = ?auto_10781 ?auto_10778 ) ) ( HOIST-AT ?auto_10780 ?auto_10781 ) ( not ( = ?auto_10784 ?auto_10780 ) ) ( SURFACE-AT ?auto_10777 ?auto_10781 ) ( ON ?auto_10777 ?auto_10783 ) ( CLEAR ?auto_10777 ) ( not ( = ?auto_10776 ?auto_10783 ) ) ( not ( = ?auto_10777 ?auto_10783 ) ) ( not ( = ?auto_10775 ?auto_10783 ) ) ( SURFACE-AT ?auto_10775 ?auto_10778 ) ( CLEAR ?auto_10775 ) ( IS-CRATE ?auto_10776 ) ( AVAILABLE ?auto_10784 ) ( AVAILABLE ?auto_10780 ) ( SURFACE-AT ?auto_10776 ?auto_10781 ) ( ON ?auto_10776 ?auto_10779 ) ( CLEAR ?auto_10776 ) ( not ( = ?auto_10776 ?auto_10779 ) ) ( not ( = ?auto_10777 ?auto_10779 ) ) ( not ( = ?auto_10775 ?auto_10779 ) ) ( not ( = ?auto_10783 ?auto_10779 ) ) ( TRUCK-AT ?auto_10782 ?auto_10778 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10776 ?auto_10777 )
      ( MAKE-2CRATE-VERIFY ?auto_10775 ?auto_10776 ?auto_10777 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10785 - SURFACE
      ?auto_10786 - SURFACE
      ?auto_10787 - SURFACE
      ?auto_10788 - SURFACE
    )
    :vars
    (
      ?auto_10794 - HOIST
      ?auto_10790 - PLACE
      ?auto_10793 - PLACE
      ?auto_10792 - HOIST
      ?auto_10795 - SURFACE
      ?auto_10791 - SURFACE
      ?auto_10789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10794 ?auto_10790 ) ( IS-CRATE ?auto_10788 ) ( not ( = ?auto_10787 ?auto_10788 ) ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10786 ?auto_10788 ) ) ( not ( = ?auto_10793 ?auto_10790 ) ) ( HOIST-AT ?auto_10792 ?auto_10793 ) ( not ( = ?auto_10794 ?auto_10792 ) ) ( SURFACE-AT ?auto_10788 ?auto_10793 ) ( ON ?auto_10788 ?auto_10795 ) ( CLEAR ?auto_10788 ) ( not ( = ?auto_10787 ?auto_10795 ) ) ( not ( = ?auto_10788 ?auto_10795 ) ) ( not ( = ?auto_10786 ?auto_10795 ) ) ( SURFACE-AT ?auto_10786 ?auto_10790 ) ( CLEAR ?auto_10786 ) ( IS-CRATE ?auto_10787 ) ( AVAILABLE ?auto_10794 ) ( AVAILABLE ?auto_10792 ) ( SURFACE-AT ?auto_10787 ?auto_10793 ) ( ON ?auto_10787 ?auto_10791 ) ( CLEAR ?auto_10787 ) ( not ( = ?auto_10787 ?auto_10791 ) ) ( not ( = ?auto_10788 ?auto_10791 ) ) ( not ( = ?auto_10786 ?auto_10791 ) ) ( not ( = ?auto_10795 ?auto_10791 ) ) ( TRUCK-AT ?auto_10789 ?auto_10790 ) ( ON ?auto_10786 ?auto_10785 ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10787 ) ) ( not ( = ?auto_10785 ?auto_10788 ) ) ( not ( = ?auto_10785 ?auto_10795 ) ) ( not ( = ?auto_10785 ?auto_10791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10786 ?auto_10787 ?auto_10788 )
      ( MAKE-3CRATE-VERIFY ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10788 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10796 - SURFACE
      ?auto_10797 - SURFACE
      ?auto_10798 - SURFACE
      ?auto_10799 - SURFACE
      ?auto_10800 - SURFACE
    )
    :vars
    (
      ?auto_10806 - HOIST
      ?auto_10802 - PLACE
      ?auto_10805 - PLACE
      ?auto_10804 - HOIST
      ?auto_10807 - SURFACE
      ?auto_10803 - SURFACE
      ?auto_10801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10806 ?auto_10802 ) ( IS-CRATE ?auto_10800 ) ( not ( = ?auto_10799 ?auto_10800 ) ) ( not ( = ?auto_10798 ?auto_10799 ) ) ( not ( = ?auto_10798 ?auto_10800 ) ) ( not ( = ?auto_10805 ?auto_10802 ) ) ( HOIST-AT ?auto_10804 ?auto_10805 ) ( not ( = ?auto_10806 ?auto_10804 ) ) ( SURFACE-AT ?auto_10800 ?auto_10805 ) ( ON ?auto_10800 ?auto_10807 ) ( CLEAR ?auto_10800 ) ( not ( = ?auto_10799 ?auto_10807 ) ) ( not ( = ?auto_10800 ?auto_10807 ) ) ( not ( = ?auto_10798 ?auto_10807 ) ) ( SURFACE-AT ?auto_10798 ?auto_10802 ) ( CLEAR ?auto_10798 ) ( IS-CRATE ?auto_10799 ) ( AVAILABLE ?auto_10806 ) ( AVAILABLE ?auto_10804 ) ( SURFACE-AT ?auto_10799 ?auto_10805 ) ( ON ?auto_10799 ?auto_10803 ) ( CLEAR ?auto_10799 ) ( not ( = ?auto_10799 ?auto_10803 ) ) ( not ( = ?auto_10800 ?auto_10803 ) ) ( not ( = ?auto_10798 ?auto_10803 ) ) ( not ( = ?auto_10807 ?auto_10803 ) ) ( TRUCK-AT ?auto_10801 ?auto_10802 ) ( ON ?auto_10797 ?auto_10796 ) ( ON ?auto_10798 ?auto_10797 ) ( not ( = ?auto_10796 ?auto_10797 ) ) ( not ( = ?auto_10796 ?auto_10798 ) ) ( not ( = ?auto_10796 ?auto_10799 ) ) ( not ( = ?auto_10796 ?auto_10800 ) ) ( not ( = ?auto_10796 ?auto_10807 ) ) ( not ( = ?auto_10796 ?auto_10803 ) ) ( not ( = ?auto_10797 ?auto_10798 ) ) ( not ( = ?auto_10797 ?auto_10799 ) ) ( not ( = ?auto_10797 ?auto_10800 ) ) ( not ( = ?auto_10797 ?auto_10807 ) ) ( not ( = ?auto_10797 ?auto_10803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10798 ?auto_10799 ?auto_10800 )
      ( MAKE-4CRATE-VERIFY ?auto_10796 ?auto_10797 ?auto_10798 ?auto_10799 ?auto_10800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10808 - SURFACE
      ?auto_10809 - SURFACE
    )
    :vars
    (
      ?auto_10815 - HOIST
      ?auto_10811 - PLACE
      ?auto_10817 - SURFACE
      ?auto_10814 - PLACE
      ?auto_10813 - HOIST
      ?auto_10816 - SURFACE
      ?auto_10812 - SURFACE
      ?auto_10810 - TRUCK
      ?auto_10818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10815 ?auto_10811 ) ( IS-CRATE ?auto_10809 ) ( not ( = ?auto_10808 ?auto_10809 ) ) ( not ( = ?auto_10817 ?auto_10808 ) ) ( not ( = ?auto_10817 ?auto_10809 ) ) ( not ( = ?auto_10814 ?auto_10811 ) ) ( HOIST-AT ?auto_10813 ?auto_10814 ) ( not ( = ?auto_10815 ?auto_10813 ) ) ( SURFACE-AT ?auto_10809 ?auto_10814 ) ( ON ?auto_10809 ?auto_10816 ) ( CLEAR ?auto_10809 ) ( not ( = ?auto_10808 ?auto_10816 ) ) ( not ( = ?auto_10809 ?auto_10816 ) ) ( not ( = ?auto_10817 ?auto_10816 ) ) ( IS-CRATE ?auto_10808 ) ( AVAILABLE ?auto_10813 ) ( SURFACE-AT ?auto_10808 ?auto_10814 ) ( ON ?auto_10808 ?auto_10812 ) ( CLEAR ?auto_10808 ) ( not ( = ?auto_10808 ?auto_10812 ) ) ( not ( = ?auto_10809 ?auto_10812 ) ) ( not ( = ?auto_10817 ?auto_10812 ) ) ( not ( = ?auto_10816 ?auto_10812 ) ) ( TRUCK-AT ?auto_10810 ?auto_10811 ) ( SURFACE-AT ?auto_10818 ?auto_10811 ) ( CLEAR ?auto_10818 ) ( LIFTING ?auto_10815 ?auto_10817 ) ( IS-CRATE ?auto_10817 ) ( not ( = ?auto_10818 ?auto_10817 ) ) ( not ( = ?auto_10808 ?auto_10818 ) ) ( not ( = ?auto_10809 ?auto_10818 ) ) ( not ( = ?auto_10816 ?auto_10818 ) ) ( not ( = ?auto_10812 ?auto_10818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10818 ?auto_10817 )
      ( MAKE-2CRATE ?auto_10817 ?auto_10808 ?auto_10809 )
      ( MAKE-1CRATE-VERIFY ?auto_10808 ?auto_10809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10819 - SURFACE
      ?auto_10820 - SURFACE
      ?auto_10821 - SURFACE
    )
    :vars
    (
      ?auto_10829 - HOIST
      ?auto_10826 - PLACE
      ?auto_10824 - PLACE
      ?auto_10822 - HOIST
      ?auto_10828 - SURFACE
      ?auto_10823 - SURFACE
      ?auto_10827 - TRUCK
      ?auto_10825 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10829 ?auto_10826 ) ( IS-CRATE ?auto_10821 ) ( not ( = ?auto_10820 ?auto_10821 ) ) ( not ( = ?auto_10819 ?auto_10820 ) ) ( not ( = ?auto_10819 ?auto_10821 ) ) ( not ( = ?auto_10824 ?auto_10826 ) ) ( HOIST-AT ?auto_10822 ?auto_10824 ) ( not ( = ?auto_10829 ?auto_10822 ) ) ( SURFACE-AT ?auto_10821 ?auto_10824 ) ( ON ?auto_10821 ?auto_10828 ) ( CLEAR ?auto_10821 ) ( not ( = ?auto_10820 ?auto_10828 ) ) ( not ( = ?auto_10821 ?auto_10828 ) ) ( not ( = ?auto_10819 ?auto_10828 ) ) ( IS-CRATE ?auto_10820 ) ( AVAILABLE ?auto_10822 ) ( SURFACE-AT ?auto_10820 ?auto_10824 ) ( ON ?auto_10820 ?auto_10823 ) ( CLEAR ?auto_10820 ) ( not ( = ?auto_10820 ?auto_10823 ) ) ( not ( = ?auto_10821 ?auto_10823 ) ) ( not ( = ?auto_10819 ?auto_10823 ) ) ( not ( = ?auto_10828 ?auto_10823 ) ) ( TRUCK-AT ?auto_10827 ?auto_10826 ) ( SURFACE-AT ?auto_10825 ?auto_10826 ) ( CLEAR ?auto_10825 ) ( LIFTING ?auto_10829 ?auto_10819 ) ( IS-CRATE ?auto_10819 ) ( not ( = ?auto_10825 ?auto_10819 ) ) ( not ( = ?auto_10820 ?auto_10825 ) ) ( not ( = ?auto_10821 ?auto_10825 ) ) ( not ( = ?auto_10828 ?auto_10825 ) ) ( not ( = ?auto_10823 ?auto_10825 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10820 ?auto_10821 )
      ( MAKE-2CRATE-VERIFY ?auto_10819 ?auto_10820 ?auto_10821 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10830 - SURFACE
      ?auto_10831 - SURFACE
      ?auto_10832 - SURFACE
      ?auto_10833 - SURFACE
    )
    :vars
    (
      ?auto_10834 - HOIST
      ?auto_10840 - PLACE
      ?auto_10836 - PLACE
      ?auto_10835 - HOIST
      ?auto_10838 - SURFACE
      ?auto_10839 - SURFACE
      ?auto_10837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10834 ?auto_10840 ) ( IS-CRATE ?auto_10833 ) ( not ( = ?auto_10832 ?auto_10833 ) ) ( not ( = ?auto_10831 ?auto_10832 ) ) ( not ( = ?auto_10831 ?auto_10833 ) ) ( not ( = ?auto_10836 ?auto_10840 ) ) ( HOIST-AT ?auto_10835 ?auto_10836 ) ( not ( = ?auto_10834 ?auto_10835 ) ) ( SURFACE-AT ?auto_10833 ?auto_10836 ) ( ON ?auto_10833 ?auto_10838 ) ( CLEAR ?auto_10833 ) ( not ( = ?auto_10832 ?auto_10838 ) ) ( not ( = ?auto_10833 ?auto_10838 ) ) ( not ( = ?auto_10831 ?auto_10838 ) ) ( IS-CRATE ?auto_10832 ) ( AVAILABLE ?auto_10835 ) ( SURFACE-AT ?auto_10832 ?auto_10836 ) ( ON ?auto_10832 ?auto_10839 ) ( CLEAR ?auto_10832 ) ( not ( = ?auto_10832 ?auto_10839 ) ) ( not ( = ?auto_10833 ?auto_10839 ) ) ( not ( = ?auto_10831 ?auto_10839 ) ) ( not ( = ?auto_10838 ?auto_10839 ) ) ( TRUCK-AT ?auto_10837 ?auto_10840 ) ( SURFACE-AT ?auto_10830 ?auto_10840 ) ( CLEAR ?auto_10830 ) ( LIFTING ?auto_10834 ?auto_10831 ) ( IS-CRATE ?auto_10831 ) ( not ( = ?auto_10830 ?auto_10831 ) ) ( not ( = ?auto_10832 ?auto_10830 ) ) ( not ( = ?auto_10833 ?auto_10830 ) ) ( not ( = ?auto_10838 ?auto_10830 ) ) ( not ( = ?auto_10839 ?auto_10830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10831 ?auto_10832 ?auto_10833 )
      ( MAKE-3CRATE-VERIFY ?auto_10830 ?auto_10831 ?auto_10832 ?auto_10833 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10841 - SURFACE
      ?auto_10842 - SURFACE
      ?auto_10843 - SURFACE
      ?auto_10844 - SURFACE
      ?auto_10845 - SURFACE
    )
    :vars
    (
      ?auto_10846 - HOIST
      ?auto_10852 - PLACE
      ?auto_10848 - PLACE
      ?auto_10847 - HOIST
      ?auto_10850 - SURFACE
      ?auto_10851 - SURFACE
      ?auto_10849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10846 ?auto_10852 ) ( IS-CRATE ?auto_10845 ) ( not ( = ?auto_10844 ?auto_10845 ) ) ( not ( = ?auto_10843 ?auto_10844 ) ) ( not ( = ?auto_10843 ?auto_10845 ) ) ( not ( = ?auto_10848 ?auto_10852 ) ) ( HOIST-AT ?auto_10847 ?auto_10848 ) ( not ( = ?auto_10846 ?auto_10847 ) ) ( SURFACE-AT ?auto_10845 ?auto_10848 ) ( ON ?auto_10845 ?auto_10850 ) ( CLEAR ?auto_10845 ) ( not ( = ?auto_10844 ?auto_10850 ) ) ( not ( = ?auto_10845 ?auto_10850 ) ) ( not ( = ?auto_10843 ?auto_10850 ) ) ( IS-CRATE ?auto_10844 ) ( AVAILABLE ?auto_10847 ) ( SURFACE-AT ?auto_10844 ?auto_10848 ) ( ON ?auto_10844 ?auto_10851 ) ( CLEAR ?auto_10844 ) ( not ( = ?auto_10844 ?auto_10851 ) ) ( not ( = ?auto_10845 ?auto_10851 ) ) ( not ( = ?auto_10843 ?auto_10851 ) ) ( not ( = ?auto_10850 ?auto_10851 ) ) ( TRUCK-AT ?auto_10849 ?auto_10852 ) ( SURFACE-AT ?auto_10842 ?auto_10852 ) ( CLEAR ?auto_10842 ) ( LIFTING ?auto_10846 ?auto_10843 ) ( IS-CRATE ?auto_10843 ) ( not ( = ?auto_10842 ?auto_10843 ) ) ( not ( = ?auto_10844 ?auto_10842 ) ) ( not ( = ?auto_10845 ?auto_10842 ) ) ( not ( = ?auto_10850 ?auto_10842 ) ) ( not ( = ?auto_10851 ?auto_10842 ) ) ( ON ?auto_10842 ?auto_10841 ) ( not ( = ?auto_10841 ?auto_10842 ) ) ( not ( = ?auto_10841 ?auto_10843 ) ) ( not ( = ?auto_10841 ?auto_10844 ) ) ( not ( = ?auto_10841 ?auto_10845 ) ) ( not ( = ?auto_10841 ?auto_10850 ) ) ( not ( = ?auto_10841 ?auto_10851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10843 ?auto_10844 ?auto_10845 )
      ( MAKE-4CRATE-VERIFY ?auto_10841 ?auto_10842 ?auto_10843 ?auto_10844 ?auto_10845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10853 - SURFACE
      ?auto_10854 - SURFACE
    )
    :vars
    (
      ?auto_10855 - HOIST
      ?auto_10863 - PLACE
      ?auto_10857 - SURFACE
      ?auto_10859 - PLACE
      ?auto_10858 - HOIST
      ?auto_10861 - SURFACE
      ?auto_10862 - SURFACE
      ?auto_10860 - TRUCK
      ?auto_10856 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10855 ?auto_10863 ) ( IS-CRATE ?auto_10854 ) ( not ( = ?auto_10853 ?auto_10854 ) ) ( not ( = ?auto_10857 ?auto_10853 ) ) ( not ( = ?auto_10857 ?auto_10854 ) ) ( not ( = ?auto_10859 ?auto_10863 ) ) ( HOIST-AT ?auto_10858 ?auto_10859 ) ( not ( = ?auto_10855 ?auto_10858 ) ) ( SURFACE-AT ?auto_10854 ?auto_10859 ) ( ON ?auto_10854 ?auto_10861 ) ( CLEAR ?auto_10854 ) ( not ( = ?auto_10853 ?auto_10861 ) ) ( not ( = ?auto_10854 ?auto_10861 ) ) ( not ( = ?auto_10857 ?auto_10861 ) ) ( IS-CRATE ?auto_10853 ) ( AVAILABLE ?auto_10858 ) ( SURFACE-AT ?auto_10853 ?auto_10859 ) ( ON ?auto_10853 ?auto_10862 ) ( CLEAR ?auto_10853 ) ( not ( = ?auto_10853 ?auto_10862 ) ) ( not ( = ?auto_10854 ?auto_10862 ) ) ( not ( = ?auto_10857 ?auto_10862 ) ) ( not ( = ?auto_10861 ?auto_10862 ) ) ( TRUCK-AT ?auto_10860 ?auto_10863 ) ( SURFACE-AT ?auto_10856 ?auto_10863 ) ( CLEAR ?auto_10856 ) ( IS-CRATE ?auto_10857 ) ( not ( = ?auto_10856 ?auto_10857 ) ) ( not ( = ?auto_10853 ?auto_10856 ) ) ( not ( = ?auto_10854 ?auto_10856 ) ) ( not ( = ?auto_10861 ?auto_10856 ) ) ( not ( = ?auto_10862 ?auto_10856 ) ) ( AVAILABLE ?auto_10855 ) ( IN ?auto_10857 ?auto_10860 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10855 ?auto_10857 ?auto_10860 ?auto_10863 )
      ( MAKE-2CRATE ?auto_10857 ?auto_10853 ?auto_10854 )
      ( MAKE-1CRATE-VERIFY ?auto_10853 ?auto_10854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10864 - SURFACE
      ?auto_10865 - SURFACE
      ?auto_10866 - SURFACE
    )
    :vars
    (
      ?auto_10869 - HOIST
      ?auto_10868 - PLACE
      ?auto_10872 - PLACE
      ?auto_10873 - HOIST
      ?auto_10874 - SURFACE
      ?auto_10870 - SURFACE
      ?auto_10871 - TRUCK
      ?auto_10867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10869 ?auto_10868 ) ( IS-CRATE ?auto_10866 ) ( not ( = ?auto_10865 ?auto_10866 ) ) ( not ( = ?auto_10864 ?auto_10865 ) ) ( not ( = ?auto_10864 ?auto_10866 ) ) ( not ( = ?auto_10872 ?auto_10868 ) ) ( HOIST-AT ?auto_10873 ?auto_10872 ) ( not ( = ?auto_10869 ?auto_10873 ) ) ( SURFACE-AT ?auto_10866 ?auto_10872 ) ( ON ?auto_10866 ?auto_10874 ) ( CLEAR ?auto_10866 ) ( not ( = ?auto_10865 ?auto_10874 ) ) ( not ( = ?auto_10866 ?auto_10874 ) ) ( not ( = ?auto_10864 ?auto_10874 ) ) ( IS-CRATE ?auto_10865 ) ( AVAILABLE ?auto_10873 ) ( SURFACE-AT ?auto_10865 ?auto_10872 ) ( ON ?auto_10865 ?auto_10870 ) ( CLEAR ?auto_10865 ) ( not ( = ?auto_10865 ?auto_10870 ) ) ( not ( = ?auto_10866 ?auto_10870 ) ) ( not ( = ?auto_10864 ?auto_10870 ) ) ( not ( = ?auto_10874 ?auto_10870 ) ) ( TRUCK-AT ?auto_10871 ?auto_10868 ) ( SURFACE-AT ?auto_10867 ?auto_10868 ) ( CLEAR ?auto_10867 ) ( IS-CRATE ?auto_10864 ) ( not ( = ?auto_10867 ?auto_10864 ) ) ( not ( = ?auto_10865 ?auto_10867 ) ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10874 ?auto_10867 ) ) ( not ( = ?auto_10870 ?auto_10867 ) ) ( AVAILABLE ?auto_10869 ) ( IN ?auto_10864 ?auto_10871 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10865 ?auto_10866 )
      ( MAKE-2CRATE-VERIFY ?auto_10864 ?auto_10865 ?auto_10866 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10875 - SURFACE
      ?auto_10876 - SURFACE
      ?auto_10877 - SURFACE
      ?auto_10878 - SURFACE
    )
    :vars
    (
      ?auto_10885 - HOIST
      ?auto_10882 - PLACE
      ?auto_10883 - PLACE
      ?auto_10881 - HOIST
      ?auto_10884 - SURFACE
      ?auto_10880 - SURFACE
      ?auto_10879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10885 ?auto_10882 ) ( IS-CRATE ?auto_10878 ) ( not ( = ?auto_10877 ?auto_10878 ) ) ( not ( = ?auto_10876 ?auto_10877 ) ) ( not ( = ?auto_10876 ?auto_10878 ) ) ( not ( = ?auto_10883 ?auto_10882 ) ) ( HOIST-AT ?auto_10881 ?auto_10883 ) ( not ( = ?auto_10885 ?auto_10881 ) ) ( SURFACE-AT ?auto_10878 ?auto_10883 ) ( ON ?auto_10878 ?auto_10884 ) ( CLEAR ?auto_10878 ) ( not ( = ?auto_10877 ?auto_10884 ) ) ( not ( = ?auto_10878 ?auto_10884 ) ) ( not ( = ?auto_10876 ?auto_10884 ) ) ( IS-CRATE ?auto_10877 ) ( AVAILABLE ?auto_10881 ) ( SURFACE-AT ?auto_10877 ?auto_10883 ) ( ON ?auto_10877 ?auto_10880 ) ( CLEAR ?auto_10877 ) ( not ( = ?auto_10877 ?auto_10880 ) ) ( not ( = ?auto_10878 ?auto_10880 ) ) ( not ( = ?auto_10876 ?auto_10880 ) ) ( not ( = ?auto_10884 ?auto_10880 ) ) ( TRUCK-AT ?auto_10879 ?auto_10882 ) ( SURFACE-AT ?auto_10875 ?auto_10882 ) ( CLEAR ?auto_10875 ) ( IS-CRATE ?auto_10876 ) ( not ( = ?auto_10875 ?auto_10876 ) ) ( not ( = ?auto_10877 ?auto_10875 ) ) ( not ( = ?auto_10878 ?auto_10875 ) ) ( not ( = ?auto_10884 ?auto_10875 ) ) ( not ( = ?auto_10880 ?auto_10875 ) ) ( AVAILABLE ?auto_10885 ) ( IN ?auto_10876 ?auto_10879 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10876 ?auto_10877 ?auto_10878 )
      ( MAKE-3CRATE-VERIFY ?auto_10875 ?auto_10876 ?auto_10877 ?auto_10878 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10886 - SURFACE
      ?auto_10887 - SURFACE
      ?auto_10888 - SURFACE
      ?auto_10889 - SURFACE
      ?auto_10890 - SURFACE
    )
    :vars
    (
      ?auto_10897 - HOIST
      ?auto_10894 - PLACE
      ?auto_10895 - PLACE
      ?auto_10893 - HOIST
      ?auto_10896 - SURFACE
      ?auto_10892 - SURFACE
      ?auto_10891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10897 ?auto_10894 ) ( IS-CRATE ?auto_10890 ) ( not ( = ?auto_10889 ?auto_10890 ) ) ( not ( = ?auto_10888 ?auto_10889 ) ) ( not ( = ?auto_10888 ?auto_10890 ) ) ( not ( = ?auto_10895 ?auto_10894 ) ) ( HOIST-AT ?auto_10893 ?auto_10895 ) ( not ( = ?auto_10897 ?auto_10893 ) ) ( SURFACE-AT ?auto_10890 ?auto_10895 ) ( ON ?auto_10890 ?auto_10896 ) ( CLEAR ?auto_10890 ) ( not ( = ?auto_10889 ?auto_10896 ) ) ( not ( = ?auto_10890 ?auto_10896 ) ) ( not ( = ?auto_10888 ?auto_10896 ) ) ( IS-CRATE ?auto_10889 ) ( AVAILABLE ?auto_10893 ) ( SURFACE-AT ?auto_10889 ?auto_10895 ) ( ON ?auto_10889 ?auto_10892 ) ( CLEAR ?auto_10889 ) ( not ( = ?auto_10889 ?auto_10892 ) ) ( not ( = ?auto_10890 ?auto_10892 ) ) ( not ( = ?auto_10888 ?auto_10892 ) ) ( not ( = ?auto_10896 ?auto_10892 ) ) ( TRUCK-AT ?auto_10891 ?auto_10894 ) ( SURFACE-AT ?auto_10887 ?auto_10894 ) ( CLEAR ?auto_10887 ) ( IS-CRATE ?auto_10888 ) ( not ( = ?auto_10887 ?auto_10888 ) ) ( not ( = ?auto_10889 ?auto_10887 ) ) ( not ( = ?auto_10890 ?auto_10887 ) ) ( not ( = ?auto_10896 ?auto_10887 ) ) ( not ( = ?auto_10892 ?auto_10887 ) ) ( AVAILABLE ?auto_10897 ) ( IN ?auto_10888 ?auto_10891 ) ( ON ?auto_10887 ?auto_10886 ) ( not ( = ?auto_10886 ?auto_10887 ) ) ( not ( = ?auto_10886 ?auto_10888 ) ) ( not ( = ?auto_10886 ?auto_10889 ) ) ( not ( = ?auto_10886 ?auto_10890 ) ) ( not ( = ?auto_10886 ?auto_10896 ) ) ( not ( = ?auto_10886 ?auto_10892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10888 ?auto_10889 ?auto_10890 )
      ( MAKE-4CRATE-VERIFY ?auto_10886 ?auto_10887 ?auto_10888 ?auto_10889 ?auto_10890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10898 - SURFACE
      ?auto_10899 - SURFACE
    )
    :vars
    (
      ?auto_10908 - HOIST
      ?auto_10903 - PLACE
      ?auto_10904 - SURFACE
      ?auto_10906 - PLACE
      ?auto_10902 - HOIST
      ?auto_10907 - SURFACE
      ?auto_10901 - SURFACE
      ?auto_10905 - SURFACE
      ?auto_10900 - TRUCK
      ?auto_10909 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10908 ?auto_10903 ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10904 ?auto_10898 ) ) ( not ( = ?auto_10904 ?auto_10899 ) ) ( not ( = ?auto_10906 ?auto_10903 ) ) ( HOIST-AT ?auto_10902 ?auto_10906 ) ( not ( = ?auto_10908 ?auto_10902 ) ) ( SURFACE-AT ?auto_10899 ?auto_10906 ) ( ON ?auto_10899 ?auto_10907 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10907 ) ) ( not ( = ?auto_10899 ?auto_10907 ) ) ( not ( = ?auto_10904 ?auto_10907 ) ) ( IS-CRATE ?auto_10898 ) ( AVAILABLE ?auto_10902 ) ( SURFACE-AT ?auto_10898 ?auto_10906 ) ( ON ?auto_10898 ?auto_10901 ) ( CLEAR ?auto_10898 ) ( not ( = ?auto_10898 ?auto_10901 ) ) ( not ( = ?auto_10899 ?auto_10901 ) ) ( not ( = ?auto_10904 ?auto_10901 ) ) ( not ( = ?auto_10907 ?auto_10901 ) ) ( SURFACE-AT ?auto_10905 ?auto_10903 ) ( CLEAR ?auto_10905 ) ( IS-CRATE ?auto_10904 ) ( not ( = ?auto_10905 ?auto_10904 ) ) ( not ( = ?auto_10898 ?auto_10905 ) ) ( not ( = ?auto_10899 ?auto_10905 ) ) ( not ( = ?auto_10907 ?auto_10905 ) ) ( not ( = ?auto_10901 ?auto_10905 ) ) ( AVAILABLE ?auto_10908 ) ( IN ?auto_10904 ?auto_10900 ) ( TRUCK-AT ?auto_10900 ?auto_10909 ) ( not ( = ?auto_10909 ?auto_10903 ) ) ( not ( = ?auto_10906 ?auto_10909 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10900 ?auto_10909 ?auto_10903 )
      ( MAKE-2CRATE ?auto_10904 ?auto_10898 ?auto_10899 )
      ( MAKE-1CRATE-VERIFY ?auto_10898 ?auto_10899 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10910 - SURFACE
      ?auto_10911 - SURFACE
      ?auto_10912 - SURFACE
    )
    :vars
    (
      ?auto_10913 - HOIST
      ?auto_10916 - PLACE
      ?auto_10919 - PLACE
      ?auto_10915 - HOIST
      ?auto_10917 - SURFACE
      ?auto_10914 - SURFACE
      ?auto_10918 - SURFACE
      ?auto_10921 - TRUCK
      ?auto_10920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10913 ?auto_10916 ) ( IS-CRATE ?auto_10912 ) ( not ( = ?auto_10911 ?auto_10912 ) ) ( not ( = ?auto_10910 ?auto_10911 ) ) ( not ( = ?auto_10910 ?auto_10912 ) ) ( not ( = ?auto_10919 ?auto_10916 ) ) ( HOIST-AT ?auto_10915 ?auto_10919 ) ( not ( = ?auto_10913 ?auto_10915 ) ) ( SURFACE-AT ?auto_10912 ?auto_10919 ) ( ON ?auto_10912 ?auto_10917 ) ( CLEAR ?auto_10912 ) ( not ( = ?auto_10911 ?auto_10917 ) ) ( not ( = ?auto_10912 ?auto_10917 ) ) ( not ( = ?auto_10910 ?auto_10917 ) ) ( IS-CRATE ?auto_10911 ) ( AVAILABLE ?auto_10915 ) ( SURFACE-AT ?auto_10911 ?auto_10919 ) ( ON ?auto_10911 ?auto_10914 ) ( CLEAR ?auto_10911 ) ( not ( = ?auto_10911 ?auto_10914 ) ) ( not ( = ?auto_10912 ?auto_10914 ) ) ( not ( = ?auto_10910 ?auto_10914 ) ) ( not ( = ?auto_10917 ?auto_10914 ) ) ( SURFACE-AT ?auto_10918 ?auto_10916 ) ( CLEAR ?auto_10918 ) ( IS-CRATE ?auto_10910 ) ( not ( = ?auto_10918 ?auto_10910 ) ) ( not ( = ?auto_10911 ?auto_10918 ) ) ( not ( = ?auto_10912 ?auto_10918 ) ) ( not ( = ?auto_10917 ?auto_10918 ) ) ( not ( = ?auto_10914 ?auto_10918 ) ) ( AVAILABLE ?auto_10913 ) ( IN ?auto_10910 ?auto_10921 ) ( TRUCK-AT ?auto_10921 ?auto_10920 ) ( not ( = ?auto_10920 ?auto_10916 ) ) ( not ( = ?auto_10919 ?auto_10920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10911 ?auto_10912 )
      ( MAKE-2CRATE-VERIFY ?auto_10910 ?auto_10911 ?auto_10912 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10922 - SURFACE
      ?auto_10923 - SURFACE
      ?auto_10924 - SURFACE
      ?auto_10925 - SURFACE
    )
    :vars
    (
      ?auto_10931 - HOIST
      ?auto_10928 - PLACE
      ?auto_10930 - PLACE
      ?auto_10926 - HOIST
      ?auto_10933 - SURFACE
      ?auto_10932 - SURFACE
      ?auto_10929 - TRUCK
      ?auto_10927 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10931 ?auto_10928 ) ( IS-CRATE ?auto_10925 ) ( not ( = ?auto_10924 ?auto_10925 ) ) ( not ( = ?auto_10923 ?auto_10924 ) ) ( not ( = ?auto_10923 ?auto_10925 ) ) ( not ( = ?auto_10930 ?auto_10928 ) ) ( HOIST-AT ?auto_10926 ?auto_10930 ) ( not ( = ?auto_10931 ?auto_10926 ) ) ( SURFACE-AT ?auto_10925 ?auto_10930 ) ( ON ?auto_10925 ?auto_10933 ) ( CLEAR ?auto_10925 ) ( not ( = ?auto_10924 ?auto_10933 ) ) ( not ( = ?auto_10925 ?auto_10933 ) ) ( not ( = ?auto_10923 ?auto_10933 ) ) ( IS-CRATE ?auto_10924 ) ( AVAILABLE ?auto_10926 ) ( SURFACE-AT ?auto_10924 ?auto_10930 ) ( ON ?auto_10924 ?auto_10932 ) ( CLEAR ?auto_10924 ) ( not ( = ?auto_10924 ?auto_10932 ) ) ( not ( = ?auto_10925 ?auto_10932 ) ) ( not ( = ?auto_10923 ?auto_10932 ) ) ( not ( = ?auto_10933 ?auto_10932 ) ) ( SURFACE-AT ?auto_10922 ?auto_10928 ) ( CLEAR ?auto_10922 ) ( IS-CRATE ?auto_10923 ) ( not ( = ?auto_10922 ?auto_10923 ) ) ( not ( = ?auto_10924 ?auto_10922 ) ) ( not ( = ?auto_10925 ?auto_10922 ) ) ( not ( = ?auto_10933 ?auto_10922 ) ) ( not ( = ?auto_10932 ?auto_10922 ) ) ( AVAILABLE ?auto_10931 ) ( IN ?auto_10923 ?auto_10929 ) ( TRUCK-AT ?auto_10929 ?auto_10927 ) ( not ( = ?auto_10927 ?auto_10928 ) ) ( not ( = ?auto_10930 ?auto_10927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10923 ?auto_10924 ?auto_10925 )
      ( MAKE-3CRATE-VERIFY ?auto_10922 ?auto_10923 ?auto_10924 ?auto_10925 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10934 - SURFACE
      ?auto_10935 - SURFACE
      ?auto_10936 - SURFACE
      ?auto_10937 - SURFACE
      ?auto_10938 - SURFACE
    )
    :vars
    (
      ?auto_10944 - HOIST
      ?auto_10941 - PLACE
      ?auto_10943 - PLACE
      ?auto_10939 - HOIST
      ?auto_10946 - SURFACE
      ?auto_10945 - SURFACE
      ?auto_10942 - TRUCK
      ?auto_10940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10944 ?auto_10941 ) ( IS-CRATE ?auto_10938 ) ( not ( = ?auto_10937 ?auto_10938 ) ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10938 ) ) ( not ( = ?auto_10943 ?auto_10941 ) ) ( HOIST-AT ?auto_10939 ?auto_10943 ) ( not ( = ?auto_10944 ?auto_10939 ) ) ( SURFACE-AT ?auto_10938 ?auto_10943 ) ( ON ?auto_10938 ?auto_10946 ) ( CLEAR ?auto_10938 ) ( not ( = ?auto_10937 ?auto_10946 ) ) ( not ( = ?auto_10938 ?auto_10946 ) ) ( not ( = ?auto_10936 ?auto_10946 ) ) ( IS-CRATE ?auto_10937 ) ( AVAILABLE ?auto_10939 ) ( SURFACE-AT ?auto_10937 ?auto_10943 ) ( ON ?auto_10937 ?auto_10945 ) ( CLEAR ?auto_10937 ) ( not ( = ?auto_10937 ?auto_10945 ) ) ( not ( = ?auto_10938 ?auto_10945 ) ) ( not ( = ?auto_10936 ?auto_10945 ) ) ( not ( = ?auto_10946 ?auto_10945 ) ) ( SURFACE-AT ?auto_10935 ?auto_10941 ) ( CLEAR ?auto_10935 ) ( IS-CRATE ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10937 ?auto_10935 ) ) ( not ( = ?auto_10938 ?auto_10935 ) ) ( not ( = ?auto_10946 ?auto_10935 ) ) ( not ( = ?auto_10945 ?auto_10935 ) ) ( AVAILABLE ?auto_10944 ) ( IN ?auto_10936 ?auto_10942 ) ( TRUCK-AT ?auto_10942 ?auto_10940 ) ( not ( = ?auto_10940 ?auto_10941 ) ) ( not ( = ?auto_10943 ?auto_10940 ) ) ( ON ?auto_10935 ?auto_10934 ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10936 ) ) ( not ( = ?auto_10934 ?auto_10937 ) ) ( not ( = ?auto_10934 ?auto_10938 ) ) ( not ( = ?auto_10934 ?auto_10946 ) ) ( not ( = ?auto_10934 ?auto_10945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10936 ?auto_10937 ?auto_10938 )
      ( MAKE-4CRATE-VERIFY ?auto_10934 ?auto_10935 ?auto_10936 ?auto_10937 ?auto_10938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10947 - SURFACE
      ?auto_10948 - SURFACE
    )
    :vars
    (
      ?auto_10956 - HOIST
      ?auto_10951 - PLACE
      ?auto_10952 - SURFACE
      ?auto_10954 - PLACE
      ?auto_10949 - HOIST
      ?auto_10958 - SURFACE
      ?auto_10957 - SURFACE
      ?auto_10955 - SURFACE
      ?auto_10953 - TRUCK
      ?auto_10950 - PLACE
      ?auto_10959 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10956 ?auto_10951 ) ( IS-CRATE ?auto_10948 ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10952 ?auto_10947 ) ) ( not ( = ?auto_10952 ?auto_10948 ) ) ( not ( = ?auto_10954 ?auto_10951 ) ) ( HOIST-AT ?auto_10949 ?auto_10954 ) ( not ( = ?auto_10956 ?auto_10949 ) ) ( SURFACE-AT ?auto_10948 ?auto_10954 ) ( ON ?auto_10948 ?auto_10958 ) ( CLEAR ?auto_10948 ) ( not ( = ?auto_10947 ?auto_10958 ) ) ( not ( = ?auto_10948 ?auto_10958 ) ) ( not ( = ?auto_10952 ?auto_10958 ) ) ( IS-CRATE ?auto_10947 ) ( AVAILABLE ?auto_10949 ) ( SURFACE-AT ?auto_10947 ?auto_10954 ) ( ON ?auto_10947 ?auto_10957 ) ( CLEAR ?auto_10947 ) ( not ( = ?auto_10947 ?auto_10957 ) ) ( not ( = ?auto_10948 ?auto_10957 ) ) ( not ( = ?auto_10952 ?auto_10957 ) ) ( not ( = ?auto_10958 ?auto_10957 ) ) ( SURFACE-AT ?auto_10955 ?auto_10951 ) ( CLEAR ?auto_10955 ) ( IS-CRATE ?auto_10952 ) ( not ( = ?auto_10955 ?auto_10952 ) ) ( not ( = ?auto_10947 ?auto_10955 ) ) ( not ( = ?auto_10948 ?auto_10955 ) ) ( not ( = ?auto_10958 ?auto_10955 ) ) ( not ( = ?auto_10957 ?auto_10955 ) ) ( AVAILABLE ?auto_10956 ) ( TRUCK-AT ?auto_10953 ?auto_10950 ) ( not ( = ?auto_10950 ?auto_10951 ) ) ( not ( = ?auto_10954 ?auto_10950 ) ) ( HOIST-AT ?auto_10959 ?auto_10950 ) ( LIFTING ?auto_10959 ?auto_10952 ) ( not ( = ?auto_10956 ?auto_10959 ) ) ( not ( = ?auto_10949 ?auto_10959 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10959 ?auto_10952 ?auto_10953 ?auto_10950 )
      ( MAKE-2CRATE ?auto_10952 ?auto_10947 ?auto_10948 )
      ( MAKE-1CRATE-VERIFY ?auto_10947 ?auto_10948 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10960 - SURFACE
      ?auto_10961 - SURFACE
      ?auto_10962 - SURFACE
    )
    :vars
    (
      ?auto_10969 - HOIST
      ?auto_10964 - PLACE
      ?auto_10963 - PLACE
      ?auto_10968 - HOIST
      ?auto_10970 - SURFACE
      ?auto_10971 - SURFACE
      ?auto_10965 - SURFACE
      ?auto_10972 - TRUCK
      ?auto_10967 - PLACE
      ?auto_10966 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10969 ?auto_10964 ) ( IS-CRATE ?auto_10962 ) ( not ( = ?auto_10961 ?auto_10962 ) ) ( not ( = ?auto_10960 ?auto_10961 ) ) ( not ( = ?auto_10960 ?auto_10962 ) ) ( not ( = ?auto_10963 ?auto_10964 ) ) ( HOIST-AT ?auto_10968 ?auto_10963 ) ( not ( = ?auto_10969 ?auto_10968 ) ) ( SURFACE-AT ?auto_10962 ?auto_10963 ) ( ON ?auto_10962 ?auto_10970 ) ( CLEAR ?auto_10962 ) ( not ( = ?auto_10961 ?auto_10970 ) ) ( not ( = ?auto_10962 ?auto_10970 ) ) ( not ( = ?auto_10960 ?auto_10970 ) ) ( IS-CRATE ?auto_10961 ) ( AVAILABLE ?auto_10968 ) ( SURFACE-AT ?auto_10961 ?auto_10963 ) ( ON ?auto_10961 ?auto_10971 ) ( CLEAR ?auto_10961 ) ( not ( = ?auto_10961 ?auto_10971 ) ) ( not ( = ?auto_10962 ?auto_10971 ) ) ( not ( = ?auto_10960 ?auto_10971 ) ) ( not ( = ?auto_10970 ?auto_10971 ) ) ( SURFACE-AT ?auto_10965 ?auto_10964 ) ( CLEAR ?auto_10965 ) ( IS-CRATE ?auto_10960 ) ( not ( = ?auto_10965 ?auto_10960 ) ) ( not ( = ?auto_10961 ?auto_10965 ) ) ( not ( = ?auto_10962 ?auto_10965 ) ) ( not ( = ?auto_10970 ?auto_10965 ) ) ( not ( = ?auto_10971 ?auto_10965 ) ) ( AVAILABLE ?auto_10969 ) ( TRUCK-AT ?auto_10972 ?auto_10967 ) ( not ( = ?auto_10967 ?auto_10964 ) ) ( not ( = ?auto_10963 ?auto_10967 ) ) ( HOIST-AT ?auto_10966 ?auto_10967 ) ( LIFTING ?auto_10966 ?auto_10960 ) ( not ( = ?auto_10969 ?auto_10966 ) ) ( not ( = ?auto_10968 ?auto_10966 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10961 ?auto_10962 )
      ( MAKE-2CRATE-VERIFY ?auto_10960 ?auto_10961 ?auto_10962 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10973 - SURFACE
      ?auto_10974 - SURFACE
      ?auto_10975 - SURFACE
      ?auto_10976 - SURFACE
    )
    :vars
    (
      ?auto_10980 - HOIST
      ?auto_10979 - PLACE
      ?auto_10981 - PLACE
      ?auto_10977 - HOIST
      ?auto_10982 - SURFACE
      ?auto_10985 - SURFACE
      ?auto_10983 - TRUCK
      ?auto_10978 - PLACE
      ?auto_10984 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10980 ?auto_10979 ) ( IS-CRATE ?auto_10976 ) ( not ( = ?auto_10975 ?auto_10976 ) ) ( not ( = ?auto_10974 ?auto_10975 ) ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( not ( = ?auto_10981 ?auto_10979 ) ) ( HOIST-AT ?auto_10977 ?auto_10981 ) ( not ( = ?auto_10980 ?auto_10977 ) ) ( SURFACE-AT ?auto_10976 ?auto_10981 ) ( ON ?auto_10976 ?auto_10982 ) ( CLEAR ?auto_10976 ) ( not ( = ?auto_10975 ?auto_10982 ) ) ( not ( = ?auto_10976 ?auto_10982 ) ) ( not ( = ?auto_10974 ?auto_10982 ) ) ( IS-CRATE ?auto_10975 ) ( AVAILABLE ?auto_10977 ) ( SURFACE-AT ?auto_10975 ?auto_10981 ) ( ON ?auto_10975 ?auto_10985 ) ( CLEAR ?auto_10975 ) ( not ( = ?auto_10975 ?auto_10985 ) ) ( not ( = ?auto_10976 ?auto_10985 ) ) ( not ( = ?auto_10974 ?auto_10985 ) ) ( not ( = ?auto_10982 ?auto_10985 ) ) ( SURFACE-AT ?auto_10973 ?auto_10979 ) ( CLEAR ?auto_10973 ) ( IS-CRATE ?auto_10974 ) ( not ( = ?auto_10973 ?auto_10974 ) ) ( not ( = ?auto_10975 ?auto_10973 ) ) ( not ( = ?auto_10976 ?auto_10973 ) ) ( not ( = ?auto_10982 ?auto_10973 ) ) ( not ( = ?auto_10985 ?auto_10973 ) ) ( AVAILABLE ?auto_10980 ) ( TRUCK-AT ?auto_10983 ?auto_10978 ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( not ( = ?auto_10981 ?auto_10978 ) ) ( HOIST-AT ?auto_10984 ?auto_10978 ) ( LIFTING ?auto_10984 ?auto_10974 ) ( not ( = ?auto_10980 ?auto_10984 ) ) ( not ( = ?auto_10977 ?auto_10984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10974 ?auto_10975 ?auto_10976 )
      ( MAKE-3CRATE-VERIFY ?auto_10973 ?auto_10974 ?auto_10975 ?auto_10976 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10986 - SURFACE
      ?auto_10987 - SURFACE
      ?auto_10988 - SURFACE
      ?auto_10989 - SURFACE
      ?auto_10990 - SURFACE
    )
    :vars
    (
      ?auto_10994 - HOIST
      ?auto_10993 - PLACE
      ?auto_10995 - PLACE
      ?auto_10991 - HOIST
      ?auto_10996 - SURFACE
      ?auto_10999 - SURFACE
      ?auto_10997 - TRUCK
      ?auto_10992 - PLACE
      ?auto_10998 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10994 ?auto_10993 ) ( IS-CRATE ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10988 ?auto_10989 ) ) ( not ( = ?auto_10988 ?auto_10990 ) ) ( not ( = ?auto_10995 ?auto_10993 ) ) ( HOIST-AT ?auto_10991 ?auto_10995 ) ( not ( = ?auto_10994 ?auto_10991 ) ) ( SURFACE-AT ?auto_10990 ?auto_10995 ) ( ON ?auto_10990 ?auto_10996 ) ( CLEAR ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10996 ) ) ( not ( = ?auto_10990 ?auto_10996 ) ) ( not ( = ?auto_10988 ?auto_10996 ) ) ( IS-CRATE ?auto_10989 ) ( AVAILABLE ?auto_10991 ) ( SURFACE-AT ?auto_10989 ?auto_10995 ) ( ON ?auto_10989 ?auto_10999 ) ( CLEAR ?auto_10989 ) ( not ( = ?auto_10989 ?auto_10999 ) ) ( not ( = ?auto_10990 ?auto_10999 ) ) ( not ( = ?auto_10988 ?auto_10999 ) ) ( not ( = ?auto_10996 ?auto_10999 ) ) ( SURFACE-AT ?auto_10987 ?auto_10993 ) ( CLEAR ?auto_10987 ) ( IS-CRATE ?auto_10988 ) ( not ( = ?auto_10987 ?auto_10988 ) ) ( not ( = ?auto_10989 ?auto_10987 ) ) ( not ( = ?auto_10990 ?auto_10987 ) ) ( not ( = ?auto_10996 ?auto_10987 ) ) ( not ( = ?auto_10999 ?auto_10987 ) ) ( AVAILABLE ?auto_10994 ) ( TRUCK-AT ?auto_10997 ?auto_10992 ) ( not ( = ?auto_10992 ?auto_10993 ) ) ( not ( = ?auto_10995 ?auto_10992 ) ) ( HOIST-AT ?auto_10998 ?auto_10992 ) ( LIFTING ?auto_10998 ?auto_10988 ) ( not ( = ?auto_10994 ?auto_10998 ) ) ( not ( = ?auto_10991 ?auto_10998 ) ) ( ON ?auto_10987 ?auto_10986 ) ( not ( = ?auto_10986 ?auto_10987 ) ) ( not ( = ?auto_10986 ?auto_10988 ) ) ( not ( = ?auto_10986 ?auto_10989 ) ) ( not ( = ?auto_10986 ?auto_10990 ) ) ( not ( = ?auto_10986 ?auto_10996 ) ) ( not ( = ?auto_10986 ?auto_10999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10988 ?auto_10989 ?auto_10990 )
      ( MAKE-4CRATE-VERIFY ?auto_10986 ?auto_10987 ?auto_10988 ?auto_10989 ?auto_10990 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11000 - SURFACE
      ?auto_11001 - SURFACE
    )
    :vars
    (
      ?auto_11006 - HOIST
      ?auto_11005 - PLACE
      ?auto_11002 - SURFACE
      ?auto_11007 - PLACE
      ?auto_11003 - HOIST
      ?auto_11008 - SURFACE
      ?auto_11011 - SURFACE
      ?auto_11012 - SURFACE
      ?auto_11009 - TRUCK
      ?auto_11004 - PLACE
      ?auto_11010 - HOIST
      ?auto_11013 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11006 ?auto_11005 ) ( IS-CRATE ?auto_11001 ) ( not ( = ?auto_11000 ?auto_11001 ) ) ( not ( = ?auto_11002 ?auto_11000 ) ) ( not ( = ?auto_11002 ?auto_11001 ) ) ( not ( = ?auto_11007 ?auto_11005 ) ) ( HOIST-AT ?auto_11003 ?auto_11007 ) ( not ( = ?auto_11006 ?auto_11003 ) ) ( SURFACE-AT ?auto_11001 ?auto_11007 ) ( ON ?auto_11001 ?auto_11008 ) ( CLEAR ?auto_11001 ) ( not ( = ?auto_11000 ?auto_11008 ) ) ( not ( = ?auto_11001 ?auto_11008 ) ) ( not ( = ?auto_11002 ?auto_11008 ) ) ( IS-CRATE ?auto_11000 ) ( AVAILABLE ?auto_11003 ) ( SURFACE-AT ?auto_11000 ?auto_11007 ) ( ON ?auto_11000 ?auto_11011 ) ( CLEAR ?auto_11000 ) ( not ( = ?auto_11000 ?auto_11011 ) ) ( not ( = ?auto_11001 ?auto_11011 ) ) ( not ( = ?auto_11002 ?auto_11011 ) ) ( not ( = ?auto_11008 ?auto_11011 ) ) ( SURFACE-AT ?auto_11012 ?auto_11005 ) ( CLEAR ?auto_11012 ) ( IS-CRATE ?auto_11002 ) ( not ( = ?auto_11012 ?auto_11002 ) ) ( not ( = ?auto_11000 ?auto_11012 ) ) ( not ( = ?auto_11001 ?auto_11012 ) ) ( not ( = ?auto_11008 ?auto_11012 ) ) ( not ( = ?auto_11011 ?auto_11012 ) ) ( AVAILABLE ?auto_11006 ) ( TRUCK-AT ?auto_11009 ?auto_11004 ) ( not ( = ?auto_11004 ?auto_11005 ) ) ( not ( = ?auto_11007 ?auto_11004 ) ) ( HOIST-AT ?auto_11010 ?auto_11004 ) ( not ( = ?auto_11006 ?auto_11010 ) ) ( not ( = ?auto_11003 ?auto_11010 ) ) ( AVAILABLE ?auto_11010 ) ( SURFACE-AT ?auto_11002 ?auto_11004 ) ( ON ?auto_11002 ?auto_11013 ) ( CLEAR ?auto_11002 ) ( not ( = ?auto_11000 ?auto_11013 ) ) ( not ( = ?auto_11001 ?auto_11013 ) ) ( not ( = ?auto_11002 ?auto_11013 ) ) ( not ( = ?auto_11008 ?auto_11013 ) ) ( not ( = ?auto_11011 ?auto_11013 ) ) ( not ( = ?auto_11012 ?auto_11013 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11010 ?auto_11002 ?auto_11013 ?auto_11004 )
      ( MAKE-2CRATE ?auto_11002 ?auto_11000 ?auto_11001 )
      ( MAKE-1CRATE-VERIFY ?auto_11000 ?auto_11001 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11014 - SURFACE
      ?auto_11015 - SURFACE
      ?auto_11016 - SURFACE
    )
    :vars
    (
      ?auto_11023 - HOIST
      ?auto_11021 - PLACE
      ?auto_11018 - PLACE
      ?auto_11022 - HOIST
      ?auto_11025 - SURFACE
      ?auto_11017 - SURFACE
      ?auto_11020 - SURFACE
      ?auto_11024 - TRUCK
      ?auto_11027 - PLACE
      ?auto_11019 - HOIST
      ?auto_11026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11023 ?auto_11021 ) ( IS-CRATE ?auto_11016 ) ( not ( = ?auto_11015 ?auto_11016 ) ) ( not ( = ?auto_11014 ?auto_11015 ) ) ( not ( = ?auto_11014 ?auto_11016 ) ) ( not ( = ?auto_11018 ?auto_11021 ) ) ( HOIST-AT ?auto_11022 ?auto_11018 ) ( not ( = ?auto_11023 ?auto_11022 ) ) ( SURFACE-AT ?auto_11016 ?auto_11018 ) ( ON ?auto_11016 ?auto_11025 ) ( CLEAR ?auto_11016 ) ( not ( = ?auto_11015 ?auto_11025 ) ) ( not ( = ?auto_11016 ?auto_11025 ) ) ( not ( = ?auto_11014 ?auto_11025 ) ) ( IS-CRATE ?auto_11015 ) ( AVAILABLE ?auto_11022 ) ( SURFACE-AT ?auto_11015 ?auto_11018 ) ( ON ?auto_11015 ?auto_11017 ) ( CLEAR ?auto_11015 ) ( not ( = ?auto_11015 ?auto_11017 ) ) ( not ( = ?auto_11016 ?auto_11017 ) ) ( not ( = ?auto_11014 ?auto_11017 ) ) ( not ( = ?auto_11025 ?auto_11017 ) ) ( SURFACE-AT ?auto_11020 ?auto_11021 ) ( CLEAR ?auto_11020 ) ( IS-CRATE ?auto_11014 ) ( not ( = ?auto_11020 ?auto_11014 ) ) ( not ( = ?auto_11015 ?auto_11020 ) ) ( not ( = ?auto_11016 ?auto_11020 ) ) ( not ( = ?auto_11025 ?auto_11020 ) ) ( not ( = ?auto_11017 ?auto_11020 ) ) ( AVAILABLE ?auto_11023 ) ( TRUCK-AT ?auto_11024 ?auto_11027 ) ( not ( = ?auto_11027 ?auto_11021 ) ) ( not ( = ?auto_11018 ?auto_11027 ) ) ( HOIST-AT ?auto_11019 ?auto_11027 ) ( not ( = ?auto_11023 ?auto_11019 ) ) ( not ( = ?auto_11022 ?auto_11019 ) ) ( AVAILABLE ?auto_11019 ) ( SURFACE-AT ?auto_11014 ?auto_11027 ) ( ON ?auto_11014 ?auto_11026 ) ( CLEAR ?auto_11014 ) ( not ( = ?auto_11015 ?auto_11026 ) ) ( not ( = ?auto_11016 ?auto_11026 ) ) ( not ( = ?auto_11014 ?auto_11026 ) ) ( not ( = ?auto_11025 ?auto_11026 ) ) ( not ( = ?auto_11017 ?auto_11026 ) ) ( not ( = ?auto_11020 ?auto_11026 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11015 ?auto_11016 )
      ( MAKE-2CRATE-VERIFY ?auto_11014 ?auto_11015 ?auto_11016 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11028 - SURFACE
      ?auto_11029 - SURFACE
      ?auto_11030 - SURFACE
      ?auto_11031 - SURFACE
    )
    :vars
    (
      ?auto_11033 - HOIST
      ?auto_11035 - PLACE
      ?auto_11041 - PLACE
      ?auto_11039 - HOIST
      ?auto_11038 - SURFACE
      ?auto_11034 - SURFACE
      ?auto_11037 - TRUCK
      ?auto_11036 - PLACE
      ?auto_11040 - HOIST
      ?auto_11032 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11033 ?auto_11035 ) ( IS-CRATE ?auto_11031 ) ( not ( = ?auto_11030 ?auto_11031 ) ) ( not ( = ?auto_11029 ?auto_11030 ) ) ( not ( = ?auto_11029 ?auto_11031 ) ) ( not ( = ?auto_11041 ?auto_11035 ) ) ( HOIST-AT ?auto_11039 ?auto_11041 ) ( not ( = ?auto_11033 ?auto_11039 ) ) ( SURFACE-AT ?auto_11031 ?auto_11041 ) ( ON ?auto_11031 ?auto_11038 ) ( CLEAR ?auto_11031 ) ( not ( = ?auto_11030 ?auto_11038 ) ) ( not ( = ?auto_11031 ?auto_11038 ) ) ( not ( = ?auto_11029 ?auto_11038 ) ) ( IS-CRATE ?auto_11030 ) ( AVAILABLE ?auto_11039 ) ( SURFACE-AT ?auto_11030 ?auto_11041 ) ( ON ?auto_11030 ?auto_11034 ) ( CLEAR ?auto_11030 ) ( not ( = ?auto_11030 ?auto_11034 ) ) ( not ( = ?auto_11031 ?auto_11034 ) ) ( not ( = ?auto_11029 ?auto_11034 ) ) ( not ( = ?auto_11038 ?auto_11034 ) ) ( SURFACE-AT ?auto_11028 ?auto_11035 ) ( CLEAR ?auto_11028 ) ( IS-CRATE ?auto_11029 ) ( not ( = ?auto_11028 ?auto_11029 ) ) ( not ( = ?auto_11030 ?auto_11028 ) ) ( not ( = ?auto_11031 ?auto_11028 ) ) ( not ( = ?auto_11038 ?auto_11028 ) ) ( not ( = ?auto_11034 ?auto_11028 ) ) ( AVAILABLE ?auto_11033 ) ( TRUCK-AT ?auto_11037 ?auto_11036 ) ( not ( = ?auto_11036 ?auto_11035 ) ) ( not ( = ?auto_11041 ?auto_11036 ) ) ( HOIST-AT ?auto_11040 ?auto_11036 ) ( not ( = ?auto_11033 ?auto_11040 ) ) ( not ( = ?auto_11039 ?auto_11040 ) ) ( AVAILABLE ?auto_11040 ) ( SURFACE-AT ?auto_11029 ?auto_11036 ) ( ON ?auto_11029 ?auto_11032 ) ( CLEAR ?auto_11029 ) ( not ( = ?auto_11030 ?auto_11032 ) ) ( not ( = ?auto_11031 ?auto_11032 ) ) ( not ( = ?auto_11029 ?auto_11032 ) ) ( not ( = ?auto_11038 ?auto_11032 ) ) ( not ( = ?auto_11034 ?auto_11032 ) ) ( not ( = ?auto_11028 ?auto_11032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11029 ?auto_11030 ?auto_11031 )
      ( MAKE-3CRATE-VERIFY ?auto_11028 ?auto_11029 ?auto_11030 ?auto_11031 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11042 - SURFACE
      ?auto_11043 - SURFACE
      ?auto_11044 - SURFACE
      ?auto_11045 - SURFACE
      ?auto_11046 - SURFACE
    )
    :vars
    (
      ?auto_11048 - HOIST
      ?auto_11050 - PLACE
      ?auto_11056 - PLACE
      ?auto_11054 - HOIST
      ?auto_11053 - SURFACE
      ?auto_11049 - SURFACE
      ?auto_11052 - TRUCK
      ?auto_11051 - PLACE
      ?auto_11055 - HOIST
      ?auto_11047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11048 ?auto_11050 ) ( IS-CRATE ?auto_11046 ) ( not ( = ?auto_11045 ?auto_11046 ) ) ( not ( = ?auto_11044 ?auto_11045 ) ) ( not ( = ?auto_11044 ?auto_11046 ) ) ( not ( = ?auto_11056 ?auto_11050 ) ) ( HOIST-AT ?auto_11054 ?auto_11056 ) ( not ( = ?auto_11048 ?auto_11054 ) ) ( SURFACE-AT ?auto_11046 ?auto_11056 ) ( ON ?auto_11046 ?auto_11053 ) ( CLEAR ?auto_11046 ) ( not ( = ?auto_11045 ?auto_11053 ) ) ( not ( = ?auto_11046 ?auto_11053 ) ) ( not ( = ?auto_11044 ?auto_11053 ) ) ( IS-CRATE ?auto_11045 ) ( AVAILABLE ?auto_11054 ) ( SURFACE-AT ?auto_11045 ?auto_11056 ) ( ON ?auto_11045 ?auto_11049 ) ( CLEAR ?auto_11045 ) ( not ( = ?auto_11045 ?auto_11049 ) ) ( not ( = ?auto_11046 ?auto_11049 ) ) ( not ( = ?auto_11044 ?auto_11049 ) ) ( not ( = ?auto_11053 ?auto_11049 ) ) ( SURFACE-AT ?auto_11043 ?auto_11050 ) ( CLEAR ?auto_11043 ) ( IS-CRATE ?auto_11044 ) ( not ( = ?auto_11043 ?auto_11044 ) ) ( not ( = ?auto_11045 ?auto_11043 ) ) ( not ( = ?auto_11046 ?auto_11043 ) ) ( not ( = ?auto_11053 ?auto_11043 ) ) ( not ( = ?auto_11049 ?auto_11043 ) ) ( AVAILABLE ?auto_11048 ) ( TRUCK-AT ?auto_11052 ?auto_11051 ) ( not ( = ?auto_11051 ?auto_11050 ) ) ( not ( = ?auto_11056 ?auto_11051 ) ) ( HOIST-AT ?auto_11055 ?auto_11051 ) ( not ( = ?auto_11048 ?auto_11055 ) ) ( not ( = ?auto_11054 ?auto_11055 ) ) ( AVAILABLE ?auto_11055 ) ( SURFACE-AT ?auto_11044 ?auto_11051 ) ( ON ?auto_11044 ?auto_11047 ) ( CLEAR ?auto_11044 ) ( not ( = ?auto_11045 ?auto_11047 ) ) ( not ( = ?auto_11046 ?auto_11047 ) ) ( not ( = ?auto_11044 ?auto_11047 ) ) ( not ( = ?auto_11053 ?auto_11047 ) ) ( not ( = ?auto_11049 ?auto_11047 ) ) ( not ( = ?auto_11043 ?auto_11047 ) ) ( ON ?auto_11043 ?auto_11042 ) ( not ( = ?auto_11042 ?auto_11043 ) ) ( not ( = ?auto_11042 ?auto_11044 ) ) ( not ( = ?auto_11042 ?auto_11045 ) ) ( not ( = ?auto_11042 ?auto_11046 ) ) ( not ( = ?auto_11042 ?auto_11053 ) ) ( not ( = ?auto_11042 ?auto_11049 ) ) ( not ( = ?auto_11042 ?auto_11047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11044 ?auto_11045 ?auto_11046 )
      ( MAKE-4CRATE-VERIFY ?auto_11042 ?auto_11043 ?auto_11044 ?auto_11045 ?auto_11046 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11057 - SURFACE
      ?auto_11058 - SURFACE
    )
    :vars
    (
      ?auto_11061 - HOIST
      ?auto_11064 - PLACE
      ?auto_11059 - SURFACE
      ?auto_11070 - PLACE
      ?auto_11068 - HOIST
      ?auto_11067 - SURFACE
      ?auto_11063 - SURFACE
      ?auto_11062 - SURFACE
      ?auto_11065 - PLACE
      ?auto_11069 - HOIST
      ?auto_11060 - SURFACE
      ?auto_11066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11061 ?auto_11064 ) ( IS-CRATE ?auto_11058 ) ( not ( = ?auto_11057 ?auto_11058 ) ) ( not ( = ?auto_11059 ?auto_11057 ) ) ( not ( = ?auto_11059 ?auto_11058 ) ) ( not ( = ?auto_11070 ?auto_11064 ) ) ( HOIST-AT ?auto_11068 ?auto_11070 ) ( not ( = ?auto_11061 ?auto_11068 ) ) ( SURFACE-AT ?auto_11058 ?auto_11070 ) ( ON ?auto_11058 ?auto_11067 ) ( CLEAR ?auto_11058 ) ( not ( = ?auto_11057 ?auto_11067 ) ) ( not ( = ?auto_11058 ?auto_11067 ) ) ( not ( = ?auto_11059 ?auto_11067 ) ) ( IS-CRATE ?auto_11057 ) ( AVAILABLE ?auto_11068 ) ( SURFACE-AT ?auto_11057 ?auto_11070 ) ( ON ?auto_11057 ?auto_11063 ) ( CLEAR ?auto_11057 ) ( not ( = ?auto_11057 ?auto_11063 ) ) ( not ( = ?auto_11058 ?auto_11063 ) ) ( not ( = ?auto_11059 ?auto_11063 ) ) ( not ( = ?auto_11067 ?auto_11063 ) ) ( SURFACE-AT ?auto_11062 ?auto_11064 ) ( CLEAR ?auto_11062 ) ( IS-CRATE ?auto_11059 ) ( not ( = ?auto_11062 ?auto_11059 ) ) ( not ( = ?auto_11057 ?auto_11062 ) ) ( not ( = ?auto_11058 ?auto_11062 ) ) ( not ( = ?auto_11067 ?auto_11062 ) ) ( not ( = ?auto_11063 ?auto_11062 ) ) ( AVAILABLE ?auto_11061 ) ( not ( = ?auto_11065 ?auto_11064 ) ) ( not ( = ?auto_11070 ?auto_11065 ) ) ( HOIST-AT ?auto_11069 ?auto_11065 ) ( not ( = ?auto_11061 ?auto_11069 ) ) ( not ( = ?auto_11068 ?auto_11069 ) ) ( AVAILABLE ?auto_11069 ) ( SURFACE-AT ?auto_11059 ?auto_11065 ) ( ON ?auto_11059 ?auto_11060 ) ( CLEAR ?auto_11059 ) ( not ( = ?auto_11057 ?auto_11060 ) ) ( not ( = ?auto_11058 ?auto_11060 ) ) ( not ( = ?auto_11059 ?auto_11060 ) ) ( not ( = ?auto_11067 ?auto_11060 ) ) ( not ( = ?auto_11063 ?auto_11060 ) ) ( not ( = ?auto_11062 ?auto_11060 ) ) ( TRUCK-AT ?auto_11066 ?auto_11064 ) )
    :subtasks
    ( ( !DRIVE ?auto_11066 ?auto_11064 ?auto_11065 )
      ( MAKE-2CRATE ?auto_11059 ?auto_11057 ?auto_11058 )
      ( MAKE-1CRATE-VERIFY ?auto_11057 ?auto_11058 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11071 - SURFACE
      ?auto_11072 - SURFACE
      ?auto_11073 - SURFACE
    )
    :vars
    (
      ?auto_11078 - HOIST
      ?auto_11079 - PLACE
      ?auto_11074 - PLACE
      ?auto_11083 - HOIST
      ?auto_11077 - SURFACE
      ?auto_11075 - SURFACE
      ?auto_11081 - SURFACE
      ?auto_11082 - PLACE
      ?auto_11084 - HOIST
      ?auto_11080 - SURFACE
      ?auto_11076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11078 ?auto_11079 ) ( IS-CRATE ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11073 ) ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11071 ?auto_11073 ) ) ( not ( = ?auto_11074 ?auto_11079 ) ) ( HOIST-AT ?auto_11083 ?auto_11074 ) ( not ( = ?auto_11078 ?auto_11083 ) ) ( SURFACE-AT ?auto_11073 ?auto_11074 ) ( ON ?auto_11073 ?auto_11077 ) ( CLEAR ?auto_11073 ) ( not ( = ?auto_11072 ?auto_11077 ) ) ( not ( = ?auto_11073 ?auto_11077 ) ) ( not ( = ?auto_11071 ?auto_11077 ) ) ( IS-CRATE ?auto_11072 ) ( AVAILABLE ?auto_11083 ) ( SURFACE-AT ?auto_11072 ?auto_11074 ) ( ON ?auto_11072 ?auto_11075 ) ( CLEAR ?auto_11072 ) ( not ( = ?auto_11072 ?auto_11075 ) ) ( not ( = ?auto_11073 ?auto_11075 ) ) ( not ( = ?auto_11071 ?auto_11075 ) ) ( not ( = ?auto_11077 ?auto_11075 ) ) ( SURFACE-AT ?auto_11081 ?auto_11079 ) ( CLEAR ?auto_11081 ) ( IS-CRATE ?auto_11071 ) ( not ( = ?auto_11081 ?auto_11071 ) ) ( not ( = ?auto_11072 ?auto_11081 ) ) ( not ( = ?auto_11073 ?auto_11081 ) ) ( not ( = ?auto_11077 ?auto_11081 ) ) ( not ( = ?auto_11075 ?auto_11081 ) ) ( AVAILABLE ?auto_11078 ) ( not ( = ?auto_11082 ?auto_11079 ) ) ( not ( = ?auto_11074 ?auto_11082 ) ) ( HOIST-AT ?auto_11084 ?auto_11082 ) ( not ( = ?auto_11078 ?auto_11084 ) ) ( not ( = ?auto_11083 ?auto_11084 ) ) ( AVAILABLE ?auto_11084 ) ( SURFACE-AT ?auto_11071 ?auto_11082 ) ( ON ?auto_11071 ?auto_11080 ) ( CLEAR ?auto_11071 ) ( not ( = ?auto_11072 ?auto_11080 ) ) ( not ( = ?auto_11073 ?auto_11080 ) ) ( not ( = ?auto_11071 ?auto_11080 ) ) ( not ( = ?auto_11077 ?auto_11080 ) ) ( not ( = ?auto_11075 ?auto_11080 ) ) ( not ( = ?auto_11081 ?auto_11080 ) ) ( TRUCK-AT ?auto_11076 ?auto_11079 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11072 ?auto_11073 )
      ( MAKE-2CRATE-VERIFY ?auto_11071 ?auto_11072 ?auto_11073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11085 - SURFACE
      ?auto_11086 - SURFACE
      ?auto_11087 - SURFACE
      ?auto_11088 - SURFACE
    )
    :vars
    (
      ?auto_11091 - HOIST
      ?auto_11090 - PLACE
      ?auto_11096 - PLACE
      ?auto_11093 - HOIST
      ?auto_11092 - SURFACE
      ?auto_11098 - SURFACE
      ?auto_11095 - PLACE
      ?auto_11089 - HOIST
      ?auto_11097 - SURFACE
      ?auto_11094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11091 ?auto_11090 ) ( IS-CRATE ?auto_11088 ) ( not ( = ?auto_11087 ?auto_11088 ) ) ( not ( = ?auto_11086 ?auto_11087 ) ) ( not ( = ?auto_11086 ?auto_11088 ) ) ( not ( = ?auto_11096 ?auto_11090 ) ) ( HOIST-AT ?auto_11093 ?auto_11096 ) ( not ( = ?auto_11091 ?auto_11093 ) ) ( SURFACE-AT ?auto_11088 ?auto_11096 ) ( ON ?auto_11088 ?auto_11092 ) ( CLEAR ?auto_11088 ) ( not ( = ?auto_11087 ?auto_11092 ) ) ( not ( = ?auto_11088 ?auto_11092 ) ) ( not ( = ?auto_11086 ?auto_11092 ) ) ( IS-CRATE ?auto_11087 ) ( AVAILABLE ?auto_11093 ) ( SURFACE-AT ?auto_11087 ?auto_11096 ) ( ON ?auto_11087 ?auto_11098 ) ( CLEAR ?auto_11087 ) ( not ( = ?auto_11087 ?auto_11098 ) ) ( not ( = ?auto_11088 ?auto_11098 ) ) ( not ( = ?auto_11086 ?auto_11098 ) ) ( not ( = ?auto_11092 ?auto_11098 ) ) ( SURFACE-AT ?auto_11085 ?auto_11090 ) ( CLEAR ?auto_11085 ) ( IS-CRATE ?auto_11086 ) ( not ( = ?auto_11085 ?auto_11086 ) ) ( not ( = ?auto_11087 ?auto_11085 ) ) ( not ( = ?auto_11088 ?auto_11085 ) ) ( not ( = ?auto_11092 ?auto_11085 ) ) ( not ( = ?auto_11098 ?auto_11085 ) ) ( AVAILABLE ?auto_11091 ) ( not ( = ?auto_11095 ?auto_11090 ) ) ( not ( = ?auto_11096 ?auto_11095 ) ) ( HOIST-AT ?auto_11089 ?auto_11095 ) ( not ( = ?auto_11091 ?auto_11089 ) ) ( not ( = ?auto_11093 ?auto_11089 ) ) ( AVAILABLE ?auto_11089 ) ( SURFACE-AT ?auto_11086 ?auto_11095 ) ( ON ?auto_11086 ?auto_11097 ) ( CLEAR ?auto_11086 ) ( not ( = ?auto_11087 ?auto_11097 ) ) ( not ( = ?auto_11088 ?auto_11097 ) ) ( not ( = ?auto_11086 ?auto_11097 ) ) ( not ( = ?auto_11092 ?auto_11097 ) ) ( not ( = ?auto_11098 ?auto_11097 ) ) ( not ( = ?auto_11085 ?auto_11097 ) ) ( TRUCK-AT ?auto_11094 ?auto_11090 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11086 ?auto_11087 ?auto_11088 )
      ( MAKE-3CRATE-VERIFY ?auto_11085 ?auto_11086 ?auto_11087 ?auto_11088 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11099 - SURFACE
      ?auto_11100 - SURFACE
      ?auto_11101 - SURFACE
      ?auto_11102 - SURFACE
      ?auto_11103 - SURFACE
    )
    :vars
    (
      ?auto_11106 - HOIST
      ?auto_11105 - PLACE
      ?auto_11111 - PLACE
      ?auto_11108 - HOIST
      ?auto_11107 - SURFACE
      ?auto_11113 - SURFACE
      ?auto_11110 - PLACE
      ?auto_11104 - HOIST
      ?auto_11112 - SURFACE
      ?auto_11109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11106 ?auto_11105 ) ( IS-CRATE ?auto_11103 ) ( not ( = ?auto_11102 ?auto_11103 ) ) ( not ( = ?auto_11101 ?auto_11102 ) ) ( not ( = ?auto_11101 ?auto_11103 ) ) ( not ( = ?auto_11111 ?auto_11105 ) ) ( HOIST-AT ?auto_11108 ?auto_11111 ) ( not ( = ?auto_11106 ?auto_11108 ) ) ( SURFACE-AT ?auto_11103 ?auto_11111 ) ( ON ?auto_11103 ?auto_11107 ) ( CLEAR ?auto_11103 ) ( not ( = ?auto_11102 ?auto_11107 ) ) ( not ( = ?auto_11103 ?auto_11107 ) ) ( not ( = ?auto_11101 ?auto_11107 ) ) ( IS-CRATE ?auto_11102 ) ( AVAILABLE ?auto_11108 ) ( SURFACE-AT ?auto_11102 ?auto_11111 ) ( ON ?auto_11102 ?auto_11113 ) ( CLEAR ?auto_11102 ) ( not ( = ?auto_11102 ?auto_11113 ) ) ( not ( = ?auto_11103 ?auto_11113 ) ) ( not ( = ?auto_11101 ?auto_11113 ) ) ( not ( = ?auto_11107 ?auto_11113 ) ) ( SURFACE-AT ?auto_11100 ?auto_11105 ) ( CLEAR ?auto_11100 ) ( IS-CRATE ?auto_11101 ) ( not ( = ?auto_11100 ?auto_11101 ) ) ( not ( = ?auto_11102 ?auto_11100 ) ) ( not ( = ?auto_11103 ?auto_11100 ) ) ( not ( = ?auto_11107 ?auto_11100 ) ) ( not ( = ?auto_11113 ?auto_11100 ) ) ( AVAILABLE ?auto_11106 ) ( not ( = ?auto_11110 ?auto_11105 ) ) ( not ( = ?auto_11111 ?auto_11110 ) ) ( HOIST-AT ?auto_11104 ?auto_11110 ) ( not ( = ?auto_11106 ?auto_11104 ) ) ( not ( = ?auto_11108 ?auto_11104 ) ) ( AVAILABLE ?auto_11104 ) ( SURFACE-AT ?auto_11101 ?auto_11110 ) ( ON ?auto_11101 ?auto_11112 ) ( CLEAR ?auto_11101 ) ( not ( = ?auto_11102 ?auto_11112 ) ) ( not ( = ?auto_11103 ?auto_11112 ) ) ( not ( = ?auto_11101 ?auto_11112 ) ) ( not ( = ?auto_11107 ?auto_11112 ) ) ( not ( = ?auto_11113 ?auto_11112 ) ) ( not ( = ?auto_11100 ?auto_11112 ) ) ( TRUCK-AT ?auto_11109 ?auto_11105 ) ( ON ?auto_11100 ?auto_11099 ) ( not ( = ?auto_11099 ?auto_11100 ) ) ( not ( = ?auto_11099 ?auto_11101 ) ) ( not ( = ?auto_11099 ?auto_11102 ) ) ( not ( = ?auto_11099 ?auto_11103 ) ) ( not ( = ?auto_11099 ?auto_11107 ) ) ( not ( = ?auto_11099 ?auto_11113 ) ) ( not ( = ?auto_11099 ?auto_11112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11101 ?auto_11102 ?auto_11103 )
      ( MAKE-4CRATE-VERIFY ?auto_11099 ?auto_11100 ?auto_11101 ?auto_11102 ?auto_11103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11114 - SURFACE
      ?auto_11115 - SURFACE
    )
    :vars
    (
      ?auto_11118 - HOIST
      ?auto_11117 - PLACE
      ?auto_11120 - SURFACE
      ?auto_11125 - PLACE
      ?auto_11121 - HOIST
      ?auto_11119 - SURFACE
      ?auto_11127 - SURFACE
      ?auto_11122 - SURFACE
      ?auto_11124 - PLACE
      ?auto_11116 - HOIST
      ?auto_11126 - SURFACE
      ?auto_11123 - TRUCK
      ?auto_11128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11118 ?auto_11117 ) ( IS-CRATE ?auto_11115 ) ( not ( = ?auto_11114 ?auto_11115 ) ) ( not ( = ?auto_11120 ?auto_11114 ) ) ( not ( = ?auto_11120 ?auto_11115 ) ) ( not ( = ?auto_11125 ?auto_11117 ) ) ( HOIST-AT ?auto_11121 ?auto_11125 ) ( not ( = ?auto_11118 ?auto_11121 ) ) ( SURFACE-AT ?auto_11115 ?auto_11125 ) ( ON ?auto_11115 ?auto_11119 ) ( CLEAR ?auto_11115 ) ( not ( = ?auto_11114 ?auto_11119 ) ) ( not ( = ?auto_11115 ?auto_11119 ) ) ( not ( = ?auto_11120 ?auto_11119 ) ) ( IS-CRATE ?auto_11114 ) ( AVAILABLE ?auto_11121 ) ( SURFACE-AT ?auto_11114 ?auto_11125 ) ( ON ?auto_11114 ?auto_11127 ) ( CLEAR ?auto_11114 ) ( not ( = ?auto_11114 ?auto_11127 ) ) ( not ( = ?auto_11115 ?auto_11127 ) ) ( not ( = ?auto_11120 ?auto_11127 ) ) ( not ( = ?auto_11119 ?auto_11127 ) ) ( IS-CRATE ?auto_11120 ) ( not ( = ?auto_11122 ?auto_11120 ) ) ( not ( = ?auto_11114 ?auto_11122 ) ) ( not ( = ?auto_11115 ?auto_11122 ) ) ( not ( = ?auto_11119 ?auto_11122 ) ) ( not ( = ?auto_11127 ?auto_11122 ) ) ( not ( = ?auto_11124 ?auto_11117 ) ) ( not ( = ?auto_11125 ?auto_11124 ) ) ( HOIST-AT ?auto_11116 ?auto_11124 ) ( not ( = ?auto_11118 ?auto_11116 ) ) ( not ( = ?auto_11121 ?auto_11116 ) ) ( AVAILABLE ?auto_11116 ) ( SURFACE-AT ?auto_11120 ?auto_11124 ) ( ON ?auto_11120 ?auto_11126 ) ( CLEAR ?auto_11120 ) ( not ( = ?auto_11114 ?auto_11126 ) ) ( not ( = ?auto_11115 ?auto_11126 ) ) ( not ( = ?auto_11120 ?auto_11126 ) ) ( not ( = ?auto_11119 ?auto_11126 ) ) ( not ( = ?auto_11127 ?auto_11126 ) ) ( not ( = ?auto_11122 ?auto_11126 ) ) ( TRUCK-AT ?auto_11123 ?auto_11117 ) ( SURFACE-AT ?auto_11128 ?auto_11117 ) ( CLEAR ?auto_11128 ) ( LIFTING ?auto_11118 ?auto_11122 ) ( IS-CRATE ?auto_11122 ) ( not ( = ?auto_11128 ?auto_11122 ) ) ( not ( = ?auto_11114 ?auto_11128 ) ) ( not ( = ?auto_11115 ?auto_11128 ) ) ( not ( = ?auto_11120 ?auto_11128 ) ) ( not ( = ?auto_11119 ?auto_11128 ) ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11128 ?auto_11122 )
      ( MAKE-2CRATE ?auto_11120 ?auto_11114 ?auto_11115 )
      ( MAKE-1CRATE-VERIFY ?auto_11114 ?auto_11115 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11129 - SURFACE
      ?auto_11130 - SURFACE
      ?auto_11131 - SURFACE
    )
    :vars
    (
      ?auto_11137 - HOIST
      ?auto_11142 - PLACE
      ?auto_11141 - PLACE
      ?auto_11138 - HOIST
      ?auto_11136 - SURFACE
      ?auto_11134 - SURFACE
      ?auto_11139 - SURFACE
      ?auto_11135 - PLACE
      ?auto_11132 - HOIST
      ?auto_11140 - SURFACE
      ?auto_11133 - TRUCK
      ?auto_11143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11137 ?auto_11142 ) ( IS-CRATE ?auto_11131 ) ( not ( = ?auto_11130 ?auto_11131 ) ) ( not ( = ?auto_11129 ?auto_11130 ) ) ( not ( = ?auto_11129 ?auto_11131 ) ) ( not ( = ?auto_11141 ?auto_11142 ) ) ( HOIST-AT ?auto_11138 ?auto_11141 ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( SURFACE-AT ?auto_11131 ?auto_11141 ) ( ON ?auto_11131 ?auto_11136 ) ( CLEAR ?auto_11131 ) ( not ( = ?auto_11130 ?auto_11136 ) ) ( not ( = ?auto_11131 ?auto_11136 ) ) ( not ( = ?auto_11129 ?auto_11136 ) ) ( IS-CRATE ?auto_11130 ) ( AVAILABLE ?auto_11138 ) ( SURFACE-AT ?auto_11130 ?auto_11141 ) ( ON ?auto_11130 ?auto_11134 ) ( CLEAR ?auto_11130 ) ( not ( = ?auto_11130 ?auto_11134 ) ) ( not ( = ?auto_11131 ?auto_11134 ) ) ( not ( = ?auto_11129 ?auto_11134 ) ) ( not ( = ?auto_11136 ?auto_11134 ) ) ( IS-CRATE ?auto_11129 ) ( not ( = ?auto_11139 ?auto_11129 ) ) ( not ( = ?auto_11130 ?auto_11139 ) ) ( not ( = ?auto_11131 ?auto_11139 ) ) ( not ( = ?auto_11136 ?auto_11139 ) ) ( not ( = ?auto_11134 ?auto_11139 ) ) ( not ( = ?auto_11135 ?auto_11142 ) ) ( not ( = ?auto_11141 ?auto_11135 ) ) ( HOIST-AT ?auto_11132 ?auto_11135 ) ( not ( = ?auto_11137 ?auto_11132 ) ) ( not ( = ?auto_11138 ?auto_11132 ) ) ( AVAILABLE ?auto_11132 ) ( SURFACE-AT ?auto_11129 ?auto_11135 ) ( ON ?auto_11129 ?auto_11140 ) ( CLEAR ?auto_11129 ) ( not ( = ?auto_11130 ?auto_11140 ) ) ( not ( = ?auto_11131 ?auto_11140 ) ) ( not ( = ?auto_11129 ?auto_11140 ) ) ( not ( = ?auto_11136 ?auto_11140 ) ) ( not ( = ?auto_11134 ?auto_11140 ) ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( TRUCK-AT ?auto_11133 ?auto_11142 ) ( SURFACE-AT ?auto_11143 ?auto_11142 ) ( CLEAR ?auto_11143 ) ( LIFTING ?auto_11137 ?auto_11139 ) ( IS-CRATE ?auto_11139 ) ( not ( = ?auto_11143 ?auto_11139 ) ) ( not ( = ?auto_11130 ?auto_11143 ) ) ( not ( = ?auto_11131 ?auto_11143 ) ) ( not ( = ?auto_11129 ?auto_11143 ) ) ( not ( = ?auto_11136 ?auto_11143 ) ) ( not ( = ?auto_11134 ?auto_11143 ) ) ( not ( = ?auto_11140 ?auto_11143 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11130 ?auto_11131 )
      ( MAKE-2CRATE-VERIFY ?auto_11129 ?auto_11130 ?auto_11131 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11144 - SURFACE
      ?auto_11145 - SURFACE
      ?auto_11146 - SURFACE
      ?auto_11147 - SURFACE
    )
    :vars
    (
      ?auto_11155 - HOIST
      ?auto_11154 - PLACE
      ?auto_11150 - PLACE
      ?auto_11149 - HOIST
      ?auto_11152 - SURFACE
      ?auto_11156 - SURFACE
      ?auto_11148 - PLACE
      ?auto_11157 - HOIST
      ?auto_11151 - SURFACE
      ?auto_11153 - TRUCK
      ?auto_11158 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11155 ?auto_11154 ) ( IS-CRATE ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( not ( = ?auto_11145 ?auto_11146 ) ) ( not ( = ?auto_11145 ?auto_11147 ) ) ( not ( = ?auto_11150 ?auto_11154 ) ) ( HOIST-AT ?auto_11149 ?auto_11150 ) ( not ( = ?auto_11155 ?auto_11149 ) ) ( SURFACE-AT ?auto_11147 ?auto_11150 ) ( ON ?auto_11147 ?auto_11152 ) ( CLEAR ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11152 ) ) ( not ( = ?auto_11147 ?auto_11152 ) ) ( not ( = ?auto_11145 ?auto_11152 ) ) ( IS-CRATE ?auto_11146 ) ( AVAILABLE ?auto_11149 ) ( SURFACE-AT ?auto_11146 ?auto_11150 ) ( ON ?auto_11146 ?auto_11156 ) ( CLEAR ?auto_11146 ) ( not ( = ?auto_11146 ?auto_11156 ) ) ( not ( = ?auto_11147 ?auto_11156 ) ) ( not ( = ?auto_11145 ?auto_11156 ) ) ( not ( = ?auto_11152 ?auto_11156 ) ) ( IS-CRATE ?auto_11145 ) ( not ( = ?auto_11144 ?auto_11145 ) ) ( not ( = ?auto_11146 ?auto_11144 ) ) ( not ( = ?auto_11147 ?auto_11144 ) ) ( not ( = ?auto_11152 ?auto_11144 ) ) ( not ( = ?auto_11156 ?auto_11144 ) ) ( not ( = ?auto_11148 ?auto_11154 ) ) ( not ( = ?auto_11150 ?auto_11148 ) ) ( HOIST-AT ?auto_11157 ?auto_11148 ) ( not ( = ?auto_11155 ?auto_11157 ) ) ( not ( = ?auto_11149 ?auto_11157 ) ) ( AVAILABLE ?auto_11157 ) ( SURFACE-AT ?auto_11145 ?auto_11148 ) ( ON ?auto_11145 ?auto_11151 ) ( CLEAR ?auto_11145 ) ( not ( = ?auto_11146 ?auto_11151 ) ) ( not ( = ?auto_11147 ?auto_11151 ) ) ( not ( = ?auto_11145 ?auto_11151 ) ) ( not ( = ?auto_11152 ?auto_11151 ) ) ( not ( = ?auto_11156 ?auto_11151 ) ) ( not ( = ?auto_11144 ?auto_11151 ) ) ( TRUCK-AT ?auto_11153 ?auto_11154 ) ( SURFACE-AT ?auto_11158 ?auto_11154 ) ( CLEAR ?auto_11158 ) ( LIFTING ?auto_11155 ?auto_11144 ) ( IS-CRATE ?auto_11144 ) ( not ( = ?auto_11158 ?auto_11144 ) ) ( not ( = ?auto_11146 ?auto_11158 ) ) ( not ( = ?auto_11147 ?auto_11158 ) ) ( not ( = ?auto_11145 ?auto_11158 ) ) ( not ( = ?auto_11152 ?auto_11158 ) ) ( not ( = ?auto_11156 ?auto_11158 ) ) ( not ( = ?auto_11151 ?auto_11158 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11145 ?auto_11146 ?auto_11147 )
      ( MAKE-3CRATE-VERIFY ?auto_11144 ?auto_11145 ?auto_11146 ?auto_11147 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11159 - SURFACE
      ?auto_11160 - SURFACE
      ?auto_11161 - SURFACE
      ?auto_11162 - SURFACE
      ?auto_11163 - SURFACE
    )
    :vars
    (
      ?auto_11171 - HOIST
      ?auto_11170 - PLACE
      ?auto_11166 - PLACE
      ?auto_11165 - HOIST
      ?auto_11168 - SURFACE
      ?auto_11172 - SURFACE
      ?auto_11164 - PLACE
      ?auto_11173 - HOIST
      ?auto_11167 - SURFACE
      ?auto_11169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11171 ?auto_11170 ) ( IS-CRATE ?auto_11163 ) ( not ( = ?auto_11162 ?auto_11163 ) ) ( not ( = ?auto_11161 ?auto_11162 ) ) ( not ( = ?auto_11161 ?auto_11163 ) ) ( not ( = ?auto_11166 ?auto_11170 ) ) ( HOIST-AT ?auto_11165 ?auto_11166 ) ( not ( = ?auto_11171 ?auto_11165 ) ) ( SURFACE-AT ?auto_11163 ?auto_11166 ) ( ON ?auto_11163 ?auto_11168 ) ( CLEAR ?auto_11163 ) ( not ( = ?auto_11162 ?auto_11168 ) ) ( not ( = ?auto_11163 ?auto_11168 ) ) ( not ( = ?auto_11161 ?auto_11168 ) ) ( IS-CRATE ?auto_11162 ) ( AVAILABLE ?auto_11165 ) ( SURFACE-AT ?auto_11162 ?auto_11166 ) ( ON ?auto_11162 ?auto_11172 ) ( CLEAR ?auto_11162 ) ( not ( = ?auto_11162 ?auto_11172 ) ) ( not ( = ?auto_11163 ?auto_11172 ) ) ( not ( = ?auto_11161 ?auto_11172 ) ) ( not ( = ?auto_11168 ?auto_11172 ) ) ( IS-CRATE ?auto_11161 ) ( not ( = ?auto_11160 ?auto_11161 ) ) ( not ( = ?auto_11162 ?auto_11160 ) ) ( not ( = ?auto_11163 ?auto_11160 ) ) ( not ( = ?auto_11168 ?auto_11160 ) ) ( not ( = ?auto_11172 ?auto_11160 ) ) ( not ( = ?auto_11164 ?auto_11170 ) ) ( not ( = ?auto_11166 ?auto_11164 ) ) ( HOIST-AT ?auto_11173 ?auto_11164 ) ( not ( = ?auto_11171 ?auto_11173 ) ) ( not ( = ?auto_11165 ?auto_11173 ) ) ( AVAILABLE ?auto_11173 ) ( SURFACE-AT ?auto_11161 ?auto_11164 ) ( ON ?auto_11161 ?auto_11167 ) ( CLEAR ?auto_11161 ) ( not ( = ?auto_11162 ?auto_11167 ) ) ( not ( = ?auto_11163 ?auto_11167 ) ) ( not ( = ?auto_11161 ?auto_11167 ) ) ( not ( = ?auto_11168 ?auto_11167 ) ) ( not ( = ?auto_11172 ?auto_11167 ) ) ( not ( = ?auto_11160 ?auto_11167 ) ) ( TRUCK-AT ?auto_11169 ?auto_11170 ) ( SURFACE-AT ?auto_11159 ?auto_11170 ) ( CLEAR ?auto_11159 ) ( LIFTING ?auto_11171 ?auto_11160 ) ( IS-CRATE ?auto_11160 ) ( not ( = ?auto_11159 ?auto_11160 ) ) ( not ( = ?auto_11162 ?auto_11159 ) ) ( not ( = ?auto_11163 ?auto_11159 ) ) ( not ( = ?auto_11161 ?auto_11159 ) ) ( not ( = ?auto_11168 ?auto_11159 ) ) ( not ( = ?auto_11172 ?auto_11159 ) ) ( not ( = ?auto_11167 ?auto_11159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11161 ?auto_11162 ?auto_11163 )
      ( MAKE-4CRATE-VERIFY ?auto_11159 ?auto_11160 ?auto_11161 ?auto_11162 ?auto_11163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11174 - SURFACE
      ?auto_11175 - SURFACE
    )
    :vars
    (
      ?auto_11183 - HOIST
      ?auto_11182 - PLACE
      ?auto_11188 - SURFACE
      ?auto_11178 - PLACE
      ?auto_11177 - HOIST
      ?auto_11180 - SURFACE
      ?auto_11184 - SURFACE
      ?auto_11186 - SURFACE
      ?auto_11176 - PLACE
      ?auto_11185 - HOIST
      ?auto_11179 - SURFACE
      ?auto_11181 - TRUCK
      ?auto_11187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11183 ?auto_11182 ) ( IS-CRATE ?auto_11175 ) ( not ( = ?auto_11174 ?auto_11175 ) ) ( not ( = ?auto_11188 ?auto_11174 ) ) ( not ( = ?auto_11188 ?auto_11175 ) ) ( not ( = ?auto_11178 ?auto_11182 ) ) ( HOIST-AT ?auto_11177 ?auto_11178 ) ( not ( = ?auto_11183 ?auto_11177 ) ) ( SURFACE-AT ?auto_11175 ?auto_11178 ) ( ON ?auto_11175 ?auto_11180 ) ( CLEAR ?auto_11175 ) ( not ( = ?auto_11174 ?auto_11180 ) ) ( not ( = ?auto_11175 ?auto_11180 ) ) ( not ( = ?auto_11188 ?auto_11180 ) ) ( IS-CRATE ?auto_11174 ) ( AVAILABLE ?auto_11177 ) ( SURFACE-AT ?auto_11174 ?auto_11178 ) ( ON ?auto_11174 ?auto_11184 ) ( CLEAR ?auto_11174 ) ( not ( = ?auto_11174 ?auto_11184 ) ) ( not ( = ?auto_11175 ?auto_11184 ) ) ( not ( = ?auto_11188 ?auto_11184 ) ) ( not ( = ?auto_11180 ?auto_11184 ) ) ( IS-CRATE ?auto_11188 ) ( not ( = ?auto_11186 ?auto_11188 ) ) ( not ( = ?auto_11174 ?auto_11186 ) ) ( not ( = ?auto_11175 ?auto_11186 ) ) ( not ( = ?auto_11180 ?auto_11186 ) ) ( not ( = ?auto_11184 ?auto_11186 ) ) ( not ( = ?auto_11176 ?auto_11182 ) ) ( not ( = ?auto_11178 ?auto_11176 ) ) ( HOIST-AT ?auto_11185 ?auto_11176 ) ( not ( = ?auto_11183 ?auto_11185 ) ) ( not ( = ?auto_11177 ?auto_11185 ) ) ( AVAILABLE ?auto_11185 ) ( SURFACE-AT ?auto_11188 ?auto_11176 ) ( ON ?auto_11188 ?auto_11179 ) ( CLEAR ?auto_11188 ) ( not ( = ?auto_11174 ?auto_11179 ) ) ( not ( = ?auto_11175 ?auto_11179 ) ) ( not ( = ?auto_11188 ?auto_11179 ) ) ( not ( = ?auto_11180 ?auto_11179 ) ) ( not ( = ?auto_11184 ?auto_11179 ) ) ( not ( = ?auto_11186 ?auto_11179 ) ) ( TRUCK-AT ?auto_11181 ?auto_11182 ) ( SURFACE-AT ?auto_11187 ?auto_11182 ) ( CLEAR ?auto_11187 ) ( IS-CRATE ?auto_11186 ) ( not ( = ?auto_11187 ?auto_11186 ) ) ( not ( = ?auto_11174 ?auto_11187 ) ) ( not ( = ?auto_11175 ?auto_11187 ) ) ( not ( = ?auto_11188 ?auto_11187 ) ) ( not ( = ?auto_11180 ?auto_11187 ) ) ( not ( = ?auto_11184 ?auto_11187 ) ) ( not ( = ?auto_11179 ?auto_11187 ) ) ( AVAILABLE ?auto_11183 ) ( IN ?auto_11186 ?auto_11181 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11183 ?auto_11186 ?auto_11181 ?auto_11182 )
      ( MAKE-2CRATE ?auto_11188 ?auto_11174 ?auto_11175 )
      ( MAKE-1CRATE-VERIFY ?auto_11174 ?auto_11175 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11189 - SURFACE
      ?auto_11190 - SURFACE
      ?auto_11191 - SURFACE
    )
    :vars
    (
      ?auto_11194 - HOIST
      ?auto_11199 - PLACE
      ?auto_11192 - PLACE
      ?auto_11198 - HOIST
      ?auto_11201 - SURFACE
      ?auto_11203 - SURFACE
      ?auto_11193 - SURFACE
      ?auto_11200 - PLACE
      ?auto_11202 - HOIST
      ?auto_11197 - SURFACE
      ?auto_11196 - TRUCK
      ?auto_11195 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11194 ?auto_11199 ) ( IS-CRATE ?auto_11191 ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( not ( = ?auto_11189 ?auto_11191 ) ) ( not ( = ?auto_11192 ?auto_11199 ) ) ( HOIST-AT ?auto_11198 ?auto_11192 ) ( not ( = ?auto_11194 ?auto_11198 ) ) ( SURFACE-AT ?auto_11191 ?auto_11192 ) ( ON ?auto_11191 ?auto_11201 ) ( CLEAR ?auto_11191 ) ( not ( = ?auto_11190 ?auto_11201 ) ) ( not ( = ?auto_11191 ?auto_11201 ) ) ( not ( = ?auto_11189 ?auto_11201 ) ) ( IS-CRATE ?auto_11190 ) ( AVAILABLE ?auto_11198 ) ( SURFACE-AT ?auto_11190 ?auto_11192 ) ( ON ?auto_11190 ?auto_11203 ) ( CLEAR ?auto_11190 ) ( not ( = ?auto_11190 ?auto_11203 ) ) ( not ( = ?auto_11191 ?auto_11203 ) ) ( not ( = ?auto_11189 ?auto_11203 ) ) ( not ( = ?auto_11201 ?auto_11203 ) ) ( IS-CRATE ?auto_11189 ) ( not ( = ?auto_11193 ?auto_11189 ) ) ( not ( = ?auto_11190 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( not ( = ?auto_11201 ?auto_11193 ) ) ( not ( = ?auto_11203 ?auto_11193 ) ) ( not ( = ?auto_11200 ?auto_11199 ) ) ( not ( = ?auto_11192 ?auto_11200 ) ) ( HOIST-AT ?auto_11202 ?auto_11200 ) ( not ( = ?auto_11194 ?auto_11202 ) ) ( not ( = ?auto_11198 ?auto_11202 ) ) ( AVAILABLE ?auto_11202 ) ( SURFACE-AT ?auto_11189 ?auto_11200 ) ( ON ?auto_11189 ?auto_11197 ) ( CLEAR ?auto_11189 ) ( not ( = ?auto_11190 ?auto_11197 ) ) ( not ( = ?auto_11191 ?auto_11197 ) ) ( not ( = ?auto_11189 ?auto_11197 ) ) ( not ( = ?auto_11201 ?auto_11197 ) ) ( not ( = ?auto_11203 ?auto_11197 ) ) ( not ( = ?auto_11193 ?auto_11197 ) ) ( TRUCK-AT ?auto_11196 ?auto_11199 ) ( SURFACE-AT ?auto_11195 ?auto_11199 ) ( CLEAR ?auto_11195 ) ( IS-CRATE ?auto_11193 ) ( not ( = ?auto_11195 ?auto_11193 ) ) ( not ( = ?auto_11190 ?auto_11195 ) ) ( not ( = ?auto_11191 ?auto_11195 ) ) ( not ( = ?auto_11189 ?auto_11195 ) ) ( not ( = ?auto_11201 ?auto_11195 ) ) ( not ( = ?auto_11203 ?auto_11195 ) ) ( not ( = ?auto_11197 ?auto_11195 ) ) ( AVAILABLE ?auto_11194 ) ( IN ?auto_11193 ?auto_11196 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11190 ?auto_11191 )
      ( MAKE-2CRATE-VERIFY ?auto_11189 ?auto_11190 ?auto_11191 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11204 - SURFACE
      ?auto_11205 - SURFACE
      ?auto_11206 - SURFACE
      ?auto_11207 - SURFACE
    )
    :vars
    (
      ?auto_11210 - HOIST
      ?auto_11209 - PLACE
      ?auto_11215 - PLACE
      ?auto_11208 - HOIST
      ?auto_11217 - SURFACE
      ?auto_11212 - SURFACE
      ?auto_11216 - PLACE
      ?auto_11214 - HOIST
      ?auto_11218 - SURFACE
      ?auto_11213 - TRUCK
      ?auto_11211 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11210 ?auto_11209 ) ( IS-CRATE ?auto_11207 ) ( not ( = ?auto_11206 ?auto_11207 ) ) ( not ( = ?auto_11205 ?auto_11206 ) ) ( not ( = ?auto_11205 ?auto_11207 ) ) ( not ( = ?auto_11215 ?auto_11209 ) ) ( HOIST-AT ?auto_11208 ?auto_11215 ) ( not ( = ?auto_11210 ?auto_11208 ) ) ( SURFACE-AT ?auto_11207 ?auto_11215 ) ( ON ?auto_11207 ?auto_11217 ) ( CLEAR ?auto_11207 ) ( not ( = ?auto_11206 ?auto_11217 ) ) ( not ( = ?auto_11207 ?auto_11217 ) ) ( not ( = ?auto_11205 ?auto_11217 ) ) ( IS-CRATE ?auto_11206 ) ( AVAILABLE ?auto_11208 ) ( SURFACE-AT ?auto_11206 ?auto_11215 ) ( ON ?auto_11206 ?auto_11212 ) ( CLEAR ?auto_11206 ) ( not ( = ?auto_11206 ?auto_11212 ) ) ( not ( = ?auto_11207 ?auto_11212 ) ) ( not ( = ?auto_11205 ?auto_11212 ) ) ( not ( = ?auto_11217 ?auto_11212 ) ) ( IS-CRATE ?auto_11205 ) ( not ( = ?auto_11204 ?auto_11205 ) ) ( not ( = ?auto_11206 ?auto_11204 ) ) ( not ( = ?auto_11207 ?auto_11204 ) ) ( not ( = ?auto_11217 ?auto_11204 ) ) ( not ( = ?auto_11212 ?auto_11204 ) ) ( not ( = ?auto_11216 ?auto_11209 ) ) ( not ( = ?auto_11215 ?auto_11216 ) ) ( HOIST-AT ?auto_11214 ?auto_11216 ) ( not ( = ?auto_11210 ?auto_11214 ) ) ( not ( = ?auto_11208 ?auto_11214 ) ) ( AVAILABLE ?auto_11214 ) ( SURFACE-AT ?auto_11205 ?auto_11216 ) ( ON ?auto_11205 ?auto_11218 ) ( CLEAR ?auto_11205 ) ( not ( = ?auto_11206 ?auto_11218 ) ) ( not ( = ?auto_11207 ?auto_11218 ) ) ( not ( = ?auto_11205 ?auto_11218 ) ) ( not ( = ?auto_11217 ?auto_11218 ) ) ( not ( = ?auto_11212 ?auto_11218 ) ) ( not ( = ?auto_11204 ?auto_11218 ) ) ( TRUCK-AT ?auto_11213 ?auto_11209 ) ( SURFACE-AT ?auto_11211 ?auto_11209 ) ( CLEAR ?auto_11211 ) ( IS-CRATE ?auto_11204 ) ( not ( = ?auto_11211 ?auto_11204 ) ) ( not ( = ?auto_11206 ?auto_11211 ) ) ( not ( = ?auto_11207 ?auto_11211 ) ) ( not ( = ?auto_11205 ?auto_11211 ) ) ( not ( = ?auto_11217 ?auto_11211 ) ) ( not ( = ?auto_11212 ?auto_11211 ) ) ( not ( = ?auto_11218 ?auto_11211 ) ) ( AVAILABLE ?auto_11210 ) ( IN ?auto_11204 ?auto_11213 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11205 ?auto_11206 ?auto_11207 )
      ( MAKE-3CRATE-VERIFY ?auto_11204 ?auto_11205 ?auto_11206 ?auto_11207 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11219 - SURFACE
      ?auto_11220 - SURFACE
      ?auto_11221 - SURFACE
      ?auto_11222 - SURFACE
      ?auto_11223 - SURFACE
    )
    :vars
    (
      ?auto_11226 - HOIST
      ?auto_11225 - PLACE
      ?auto_11230 - PLACE
      ?auto_11224 - HOIST
      ?auto_11232 - SURFACE
      ?auto_11227 - SURFACE
      ?auto_11231 - PLACE
      ?auto_11229 - HOIST
      ?auto_11233 - SURFACE
      ?auto_11228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11226 ?auto_11225 ) ( IS-CRATE ?auto_11223 ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( not ( = ?auto_11221 ?auto_11222 ) ) ( not ( = ?auto_11221 ?auto_11223 ) ) ( not ( = ?auto_11230 ?auto_11225 ) ) ( HOIST-AT ?auto_11224 ?auto_11230 ) ( not ( = ?auto_11226 ?auto_11224 ) ) ( SURFACE-AT ?auto_11223 ?auto_11230 ) ( ON ?auto_11223 ?auto_11232 ) ( CLEAR ?auto_11223 ) ( not ( = ?auto_11222 ?auto_11232 ) ) ( not ( = ?auto_11223 ?auto_11232 ) ) ( not ( = ?auto_11221 ?auto_11232 ) ) ( IS-CRATE ?auto_11222 ) ( AVAILABLE ?auto_11224 ) ( SURFACE-AT ?auto_11222 ?auto_11230 ) ( ON ?auto_11222 ?auto_11227 ) ( CLEAR ?auto_11222 ) ( not ( = ?auto_11222 ?auto_11227 ) ) ( not ( = ?auto_11223 ?auto_11227 ) ) ( not ( = ?auto_11221 ?auto_11227 ) ) ( not ( = ?auto_11232 ?auto_11227 ) ) ( IS-CRATE ?auto_11221 ) ( not ( = ?auto_11220 ?auto_11221 ) ) ( not ( = ?auto_11222 ?auto_11220 ) ) ( not ( = ?auto_11223 ?auto_11220 ) ) ( not ( = ?auto_11232 ?auto_11220 ) ) ( not ( = ?auto_11227 ?auto_11220 ) ) ( not ( = ?auto_11231 ?auto_11225 ) ) ( not ( = ?auto_11230 ?auto_11231 ) ) ( HOIST-AT ?auto_11229 ?auto_11231 ) ( not ( = ?auto_11226 ?auto_11229 ) ) ( not ( = ?auto_11224 ?auto_11229 ) ) ( AVAILABLE ?auto_11229 ) ( SURFACE-AT ?auto_11221 ?auto_11231 ) ( ON ?auto_11221 ?auto_11233 ) ( CLEAR ?auto_11221 ) ( not ( = ?auto_11222 ?auto_11233 ) ) ( not ( = ?auto_11223 ?auto_11233 ) ) ( not ( = ?auto_11221 ?auto_11233 ) ) ( not ( = ?auto_11232 ?auto_11233 ) ) ( not ( = ?auto_11227 ?auto_11233 ) ) ( not ( = ?auto_11220 ?auto_11233 ) ) ( TRUCK-AT ?auto_11228 ?auto_11225 ) ( SURFACE-AT ?auto_11219 ?auto_11225 ) ( CLEAR ?auto_11219 ) ( IS-CRATE ?auto_11220 ) ( not ( = ?auto_11219 ?auto_11220 ) ) ( not ( = ?auto_11222 ?auto_11219 ) ) ( not ( = ?auto_11223 ?auto_11219 ) ) ( not ( = ?auto_11221 ?auto_11219 ) ) ( not ( = ?auto_11232 ?auto_11219 ) ) ( not ( = ?auto_11227 ?auto_11219 ) ) ( not ( = ?auto_11233 ?auto_11219 ) ) ( AVAILABLE ?auto_11226 ) ( IN ?auto_11220 ?auto_11228 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11221 ?auto_11222 ?auto_11223 )
      ( MAKE-4CRATE-VERIFY ?auto_11219 ?auto_11220 ?auto_11221 ?auto_11222 ?auto_11223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11234 - SURFACE
      ?auto_11235 - SURFACE
    )
    :vars
    (
      ?auto_11240 - HOIST
      ?auto_11239 - PLACE
      ?auto_11236 - SURFACE
      ?auto_11245 - PLACE
      ?auto_11238 - HOIST
      ?auto_11247 - SURFACE
      ?auto_11242 - SURFACE
      ?auto_11237 - SURFACE
      ?auto_11246 - PLACE
      ?auto_11244 - HOIST
      ?auto_11248 - SURFACE
      ?auto_11241 - SURFACE
      ?auto_11243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11240 ?auto_11239 ) ( IS-CRATE ?auto_11235 ) ( not ( = ?auto_11234 ?auto_11235 ) ) ( not ( = ?auto_11236 ?auto_11234 ) ) ( not ( = ?auto_11236 ?auto_11235 ) ) ( not ( = ?auto_11245 ?auto_11239 ) ) ( HOIST-AT ?auto_11238 ?auto_11245 ) ( not ( = ?auto_11240 ?auto_11238 ) ) ( SURFACE-AT ?auto_11235 ?auto_11245 ) ( ON ?auto_11235 ?auto_11247 ) ( CLEAR ?auto_11235 ) ( not ( = ?auto_11234 ?auto_11247 ) ) ( not ( = ?auto_11235 ?auto_11247 ) ) ( not ( = ?auto_11236 ?auto_11247 ) ) ( IS-CRATE ?auto_11234 ) ( AVAILABLE ?auto_11238 ) ( SURFACE-AT ?auto_11234 ?auto_11245 ) ( ON ?auto_11234 ?auto_11242 ) ( CLEAR ?auto_11234 ) ( not ( = ?auto_11234 ?auto_11242 ) ) ( not ( = ?auto_11235 ?auto_11242 ) ) ( not ( = ?auto_11236 ?auto_11242 ) ) ( not ( = ?auto_11247 ?auto_11242 ) ) ( IS-CRATE ?auto_11236 ) ( not ( = ?auto_11237 ?auto_11236 ) ) ( not ( = ?auto_11234 ?auto_11237 ) ) ( not ( = ?auto_11235 ?auto_11237 ) ) ( not ( = ?auto_11247 ?auto_11237 ) ) ( not ( = ?auto_11242 ?auto_11237 ) ) ( not ( = ?auto_11246 ?auto_11239 ) ) ( not ( = ?auto_11245 ?auto_11246 ) ) ( HOIST-AT ?auto_11244 ?auto_11246 ) ( not ( = ?auto_11240 ?auto_11244 ) ) ( not ( = ?auto_11238 ?auto_11244 ) ) ( AVAILABLE ?auto_11244 ) ( SURFACE-AT ?auto_11236 ?auto_11246 ) ( ON ?auto_11236 ?auto_11248 ) ( CLEAR ?auto_11236 ) ( not ( = ?auto_11234 ?auto_11248 ) ) ( not ( = ?auto_11235 ?auto_11248 ) ) ( not ( = ?auto_11236 ?auto_11248 ) ) ( not ( = ?auto_11247 ?auto_11248 ) ) ( not ( = ?auto_11242 ?auto_11248 ) ) ( not ( = ?auto_11237 ?auto_11248 ) ) ( SURFACE-AT ?auto_11241 ?auto_11239 ) ( CLEAR ?auto_11241 ) ( IS-CRATE ?auto_11237 ) ( not ( = ?auto_11241 ?auto_11237 ) ) ( not ( = ?auto_11234 ?auto_11241 ) ) ( not ( = ?auto_11235 ?auto_11241 ) ) ( not ( = ?auto_11236 ?auto_11241 ) ) ( not ( = ?auto_11247 ?auto_11241 ) ) ( not ( = ?auto_11242 ?auto_11241 ) ) ( not ( = ?auto_11248 ?auto_11241 ) ) ( AVAILABLE ?auto_11240 ) ( IN ?auto_11237 ?auto_11243 ) ( TRUCK-AT ?auto_11243 ?auto_11246 ) )
    :subtasks
    ( ( !DRIVE ?auto_11243 ?auto_11246 ?auto_11239 )
      ( MAKE-2CRATE ?auto_11236 ?auto_11234 ?auto_11235 )
      ( MAKE-1CRATE-VERIFY ?auto_11234 ?auto_11235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11249 - SURFACE
      ?auto_11250 - SURFACE
      ?auto_11251 - SURFACE
    )
    :vars
    (
      ?auto_11257 - HOIST
      ?auto_11252 - PLACE
      ?auto_11262 - PLACE
      ?auto_11260 - HOIST
      ?auto_11256 - SURFACE
      ?auto_11258 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11253 - PLACE
      ?auto_11255 - HOIST
      ?auto_11261 - SURFACE
      ?auto_11259 - SURFACE
      ?auto_11263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11257 ?auto_11252 ) ( IS-CRATE ?auto_11251 ) ( not ( = ?auto_11250 ?auto_11251 ) ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11251 ) ) ( not ( = ?auto_11262 ?auto_11252 ) ) ( HOIST-AT ?auto_11260 ?auto_11262 ) ( not ( = ?auto_11257 ?auto_11260 ) ) ( SURFACE-AT ?auto_11251 ?auto_11262 ) ( ON ?auto_11251 ?auto_11256 ) ( CLEAR ?auto_11251 ) ( not ( = ?auto_11250 ?auto_11256 ) ) ( not ( = ?auto_11251 ?auto_11256 ) ) ( not ( = ?auto_11249 ?auto_11256 ) ) ( IS-CRATE ?auto_11250 ) ( AVAILABLE ?auto_11260 ) ( SURFACE-AT ?auto_11250 ?auto_11262 ) ( ON ?auto_11250 ?auto_11258 ) ( CLEAR ?auto_11250 ) ( not ( = ?auto_11250 ?auto_11258 ) ) ( not ( = ?auto_11251 ?auto_11258 ) ) ( not ( = ?auto_11249 ?auto_11258 ) ) ( not ( = ?auto_11256 ?auto_11258 ) ) ( IS-CRATE ?auto_11249 ) ( not ( = ?auto_11254 ?auto_11249 ) ) ( not ( = ?auto_11250 ?auto_11254 ) ) ( not ( = ?auto_11251 ?auto_11254 ) ) ( not ( = ?auto_11256 ?auto_11254 ) ) ( not ( = ?auto_11258 ?auto_11254 ) ) ( not ( = ?auto_11253 ?auto_11252 ) ) ( not ( = ?auto_11262 ?auto_11253 ) ) ( HOIST-AT ?auto_11255 ?auto_11253 ) ( not ( = ?auto_11257 ?auto_11255 ) ) ( not ( = ?auto_11260 ?auto_11255 ) ) ( AVAILABLE ?auto_11255 ) ( SURFACE-AT ?auto_11249 ?auto_11253 ) ( ON ?auto_11249 ?auto_11261 ) ( CLEAR ?auto_11249 ) ( not ( = ?auto_11250 ?auto_11261 ) ) ( not ( = ?auto_11251 ?auto_11261 ) ) ( not ( = ?auto_11249 ?auto_11261 ) ) ( not ( = ?auto_11256 ?auto_11261 ) ) ( not ( = ?auto_11258 ?auto_11261 ) ) ( not ( = ?auto_11254 ?auto_11261 ) ) ( SURFACE-AT ?auto_11259 ?auto_11252 ) ( CLEAR ?auto_11259 ) ( IS-CRATE ?auto_11254 ) ( not ( = ?auto_11259 ?auto_11254 ) ) ( not ( = ?auto_11250 ?auto_11259 ) ) ( not ( = ?auto_11251 ?auto_11259 ) ) ( not ( = ?auto_11249 ?auto_11259 ) ) ( not ( = ?auto_11256 ?auto_11259 ) ) ( not ( = ?auto_11258 ?auto_11259 ) ) ( not ( = ?auto_11261 ?auto_11259 ) ) ( AVAILABLE ?auto_11257 ) ( IN ?auto_11254 ?auto_11263 ) ( TRUCK-AT ?auto_11263 ?auto_11253 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11250 ?auto_11251 )
      ( MAKE-2CRATE-VERIFY ?auto_11249 ?auto_11250 ?auto_11251 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11264 - SURFACE
      ?auto_11265 - SURFACE
      ?auto_11266 - SURFACE
      ?auto_11267 - SURFACE
    )
    :vars
    (
      ?auto_11271 - HOIST
      ?auto_11273 - PLACE
      ?auto_11268 - PLACE
      ?auto_11272 - HOIST
      ?auto_11277 - SURFACE
      ?auto_11269 - SURFACE
      ?auto_11274 - PLACE
      ?auto_11278 - HOIST
      ?auto_11275 - SURFACE
      ?auto_11270 - SURFACE
      ?auto_11276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11271 ?auto_11273 ) ( IS-CRATE ?auto_11267 ) ( not ( = ?auto_11266 ?auto_11267 ) ) ( not ( = ?auto_11265 ?auto_11266 ) ) ( not ( = ?auto_11265 ?auto_11267 ) ) ( not ( = ?auto_11268 ?auto_11273 ) ) ( HOIST-AT ?auto_11272 ?auto_11268 ) ( not ( = ?auto_11271 ?auto_11272 ) ) ( SURFACE-AT ?auto_11267 ?auto_11268 ) ( ON ?auto_11267 ?auto_11277 ) ( CLEAR ?auto_11267 ) ( not ( = ?auto_11266 ?auto_11277 ) ) ( not ( = ?auto_11267 ?auto_11277 ) ) ( not ( = ?auto_11265 ?auto_11277 ) ) ( IS-CRATE ?auto_11266 ) ( AVAILABLE ?auto_11272 ) ( SURFACE-AT ?auto_11266 ?auto_11268 ) ( ON ?auto_11266 ?auto_11269 ) ( CLEAR ?auto_11266 ) ( not ( = ?auto_11266 ?auto_11269 ) ) ( not ( = ?auto_11267 ?auto_11269 ) ) ( not ( = ?auto_11265 ?auto_11269 ) ) ( not ( = ?auto_11277 ?auto_11269 ) ) ( IS-CRATE ?auto_11265 ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( not ( = ?auto_11266 ?auto_11264 ) ) ( not ( = ?auto_11267 ?auto_11264 ) ) ( not ( = ?auto_11277 ?auto_11264 ) ) ( not ( = ?auto_11269 ?auto_11264 ) ) ( not ( = ?auto_11274 ?auto_11273 ) ) ( not ( = ?auto_11268 ?auto_11274 ) ) ( HOIST-AT ?auto_11278 ?auto_11274 ) ( not ( = ?auto_11271 ?auto_11278 ) ) ( not ( = ?auto_11272 ?auto_11278 ) ) ( AVAILABLE ?auto_11278 ) ( SURFACE-AT ?auto_11265 ?auto_11274 ) ( ON ?auto_11265 ?auto_11275 ) ( CLEAR ?auto_11265 ) ( not ( = ?auto_11266 ?auto_11275 ) ) ( not ( = ?auto_11267 ?auto_11275 ) ) ( not ( = ?auto_11265 ?auto_11275 ) ) ( not ( = ?auto_11277 ?auto_11275 ) ) ( not ( = ?auto_11269 ?auto_11275 ) ) ( not ( = ?auto_11264 ?auto_11275 ) ) ( SURFACE-AT ?auto_11270 ?auto_11273 ) ( CLEAR ?auto_11270 ) ( IS-CRATE ?auto_11264 ) ( not ( = ?auto_11270 ?auto_11264 ) ) ( not ( = ?auto_11266 ?auto_11270 ) ) ( not ( = ?auto_11267 ?auto_11270 ) ) ( not ( = ?auto_11265 ?auto_11270 ) ) ( not ( = ?auto_11277 ?auto_11270 ) ) ( not ( = ?auto_11269 ?auto_11270 ) ) ( not ( = ?auto_11275 ?auto_11270 ) ) ( AVAILABLE ?auto_11271 ) ( IN ?auto_11264 ?auto_11276 ) ( TRUCK-AT ?auto_11276 ?auto_11274 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11265 ?auto_11266 ?auto_11267 )
      ( MAKE-3CRATE-VERIFY ?auto_11264 ?auto_11265 ?auto_11266 ?auto_11267 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11279 - SURFACE
      ?auto_11280 - SURFACE
      ?auto_11281 - SURFACE
      ?auto_11282 - SURFACE
      ?auto_11283 - SURFACE
    )
    :vars
    (
      ?auto_11286 - HOIST
      ?auto_11288 - PLACE
      ?auto_11284 - PLACE
      ?auto_11287 - HOIST
      ?auto_11292 - SURFACE
      ?auto_11285 - SURFACE
      ?auto_11289 - PLACE
      ?auto_11293 - HOIST
      ?auto_11290 - SURFACE
      ?auto_11291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11286 ?auto_11288 ) ( IS-CRATE ?auto_11283 ) ( not ( = ?auto_11282 ?auto_11283 ) ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11281 ?auto_11283 ) ) ( not ( = ?auto_11284 ?auto_11288 ) ) ( HOIST-AT ?auto_11287 ?auto_11284 ) ( not ( = ?auto_11286 ?auto_11287 ) ) ( SURFACE-AT ?auto_11283 ?auto_11284 ) ( ON ?auto_11283 ?auto_11292 ) ( CLEAR ?auto_11283 ) ( not ( = ?auto_11282 ?auto_11292 ) ) ( not ( = ?auto_11283 ?auto_11292 ) ) ( not ( = ?auto_11281 ?auto_11292 ) ) ( IS-CRATE ?auto_11282 ) ( AVAILABLE ?auto_11287 ) ( SURFACE-AT ?auto_11282 ?auto_11284 ) ( ON ?auto_11282 ?auto_11285 ) ( CLEAR ?auto_11282 ) ( not ( = ?auto_11282 ?auto_11285 ) ) ( not ( = ?auto_11283 ?auto_11285 ) ) ( not ( = ?auto_11281 ?auto_11285 ) ) ( not ( = ?auto_11292 ?auto_11285 ) ) ( IS-CRATE ?auto_11281 ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11282 ?auto_11280 ) ) ( not ( = ?auto_11283 ?auto_11280 ) ) ( not ( = ?auto_11292 ?auto_11280 ) ) ( not ( = ?auto_11285 ?auto_11280 ) ) ( not ( = ?auto_11289 ?auto_11288 ) ) ( not ( = ?auto_11284 ?auto_11289 ) ) ( HOIST-AT ?auto_11293 ?auto_11289 ) ( not ( = ?auto_11286 ?auto_11293 ) ) ( not ( = ?auto_11287 ?auto_11293 ) ) ( AVAILABLE ?auto_11293 ) ( SURFACE-AT ?auto_11281 ?auto_11289 ) ( ON ?auto_11281 ?auto_11290 ) ( CLEAR ?auto_11281 ) ( not ( = ?auto_11282 ?auto_11290 ) ) ( not ( = ?auto_11283 ?auto_11290 ) ) ( not ( = ?auto_11281 ?auto_11290 ) ) ( not ( = ?auto_11292 ?auto_11290 ) ) ( not ( = ?auto_11285 ?auto_11290 ) ) ( not ( = ?auto_11280 ?auto_11290 ) ) ( SURFACE-AT ?auto_11279 ?auto_11288 ) ( CLEAR ?auto_11279 ) ( IS-CRATE ?auto_11280 ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( not ( = ?auto_11282 ?auto_11279 ) ) ( not ( = ?auto_11283 ?auto_11279 ) ) ( not ( = ?auto_11281 ?auto_11279 ) ) ( not ( = ?auto_11292 ?auto_11279 ) ) ( not ( = ?auto_11285 ?auto_11279 ) ) ( not ( = ?auto_11290 ?auto_11279 ) ) ( AVAILABLE ?auto_11286 ) ( IN ?auto_11280 ?auto_11291 ) ( TRUCK-AT ?auto_11291 ?auto_11289 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11281 ?auto_11282 ?auto_11283 )
      ( MAKE-4CRATE-VERIFY ?auto_11279 ?auto_11280 ?auto_11281 ?auto_11282 ?auto_11283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11294 - SURFACE
      ?auto_11295 - SURFACE
    )
    :vars
    (
      ?auto_11299 - HOIST
      ?auto_11301 - PLACE
      ?auto_11308 - SURFACE
      ?auto_11296 - PLACE
      ?auto_11300 - HOIST
      ?auto_11305 - SURFACE
      ?auto_11297 - SURFACE
      ?auto_11307 - SURFACE
      ?auto_11302 - PLACE
      ?auto_11306 - HOIST
      ?auto_11303 - SURFACE
      ?auto_11298 - SURFACE
      ?auto_11304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11299 ?auto_11301 ) ( IS-CRATE ?auto_11295 ) ( not ( = ?auto_11294 ?auto_11295 ) ) ( not ( = ?auto_11308 ?auto_11294 ) ) ( not ( = ?auto_11308 ?auto_11295 ) ) ( not ( = ?auto_11296 ?auto_11301 ) ) ( HOIST-AT ?auto_11300 ?auto_11296 ) ( not ( = ?auto_11299 ?auto_11300 ) ) ( SURFACE-AT ?auto_11295 ?auto_11296 ) ( ON ?auto_11295 ?auto_11305 ) ( CLEAR ?auto_11295 ) ( not ( = ?auto_11294 ?auto_11305 ) ) ( not ( = ?auto_11295 ?auto_11305 ) ) ( not ( = ?auto_11308 ?auto_11305 ) ) ( IS-CRATE ?auto_11294 ) ( AVAILABLE ?auto_11300 ) ( SURFACE-AT ?auto_11294 ?auto_11296 ) ( ON ?auto_11294 ?auto_11297 ) ( CLEAR ?auto_11294 ) ( not ( = ?auto_11294 ?auto_11297 ) ) ( not ( = ?auto_11295 ?auto_11297 ) ) ( not ( = ?auto_11308 ?auto_11297 ) ) ( not ( = ?auto_11305 ?auto_11297 ) ) ( IS-CRATE ?auto_11308 ) ( not ( = ?auto_11307 ?auto_11308 ) ) ( not ( = ?auto_11294 ?auto_11307 ) ) ( not ( = ?auto_11295 ?auto_11307 ) ) ( not ( = ?auto_11305 ?auto_11307 ) ) ( not ( = ?auto_11297 ?auto_11307 ) ) ( not ( = ?auto_11302 ?auto_11301 ) ) ( not ( = ?auto_11296 ?auto_11302 ) ) ( HOIST-AT ?auto_11306 ?auto_11302 ) ( not ( = ?auto_11299 ?auto_11306 ) ) ( not ( = ?auto_11300 ?auto_11306 ) ) ( SURFACE-AT ?auto_11308 ?auto_11302 ) ( ON ?auto_11308 ?auto_11303 ) ( CLEAR ?auto_11308 ) ( not ( = ?auto_11294 ?auto_11303 ) ) ( not ( = ?auto_11295 ?auto_11303 ) ) ( not ( = ?auto_11308 ?auto_11303 ) ) ( not ( = ?auto_11305 ?auto_11303 ) ) ( not ( = ?auto_11297 ?auto_11303 ) ) ( not ( = ?auto_11307 ?auto_11303 ) ) ( SURFACE-AT ?auto_11298 ?auto_11301 ) ( CLEAR ?auto_11298 ) ( IS-CRATE ?auto_11307 ) ( not ( = ?auto_11298 ?auto_11307 ) ) ( not ( = ?auto_11294 ?auto_11298 ) ) ( not ( = ?auto_11295 ?auto_11298 ) ) ( not ( = ?auto_11308 ?auto_11298 ) ) ( not ( = ?auto_11305 ?auto_11298 ) ) ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11303 ?auto_11298 ) ) ( AVAILABLE ?auto_11299 ) ( TRUCK-AT ?auto_11304 ?auto_11302 ) ( LIFTING ?auto_11306 ?auto_11307 ) )
    :subtasks
    ( ( !LOAD ?auto_11306 ?auto_11307 ?auto_11304 ?auto_11302 )
      ( MAKE-2CRATE ?auto_11308 ?auto_11294 ?auto_11295 )
      ( MAKE-1CRATE-VERIFY ?auto_11294 ?auto_11295 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11309 - SURFACE
      ?auto_11310 - SURFACE
      ?auto_11311 - SURFACE
    )
    :vars
    (
      ?auto_11312 - HOIST
      ?auto_11321 - PLACE
      ?auto_11314 - PLACE
      ?auto_11315 - HOIST
      ?auto_11318 - SURFACE
      ?auto_11323 - SURFACE
      ?auto_11316 - SURFACE
      ?auto_11313 - PLACE
      ?auto_11320 - HOIST
      ?auto_11319 - SURFACE
      ?auto_11322 - SURFACE
      ?auto_11317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11312 ?auto_11321 ) ( IS-CRATE ?auto_11311 ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( not ( = ?auto_11309 ?auto_11310 ) ) ( not ( = ?auto_11309 ?auto_11311 ) ) ( not ( = ?auto_11314 ?auto_11321 ) ) ( HOIST-AT ?auto_11315 ?auto_11314 ) ( not ( = ?auto_11312 ?auto_11315 ) ) ( SURFACE-AT ?auto_11311 ?auto_11314 ) ( ON ?auto_11311 ?auto_11318 ) ( CLEAR ?auto_11311 ) ( not ( = ?auto_11310 ?auto_11318 ) ) ( not ( = ?auto_11311 ?auto_11318 ) ) ( not ( = ?auto_11309 ?auto_11318 ) ) ( IS-CRATE ?auto_11310 ) ( AVAILABLE ?auto_11315 ) ( SURFACE-AT ?auto_11310 ?auto_11314 ) ( ON ?auto_11310 ?auto_11323 ) ( CLEAR ?auto_11310 ) ( not ( = ?auto_11310 ?auto_11323 ) ) ( not ( = ?auto_11311 ?auto_11323 ) ) ( not ( = ?auto_11309 ?auto_11323 ) ) ( not ( = ?auto_11318 ?auto_11323 ) ) ( IS-CRATE ?auto_11309 ) ( not ( = ?auto_11316 ?auto_11309 ) ) ( not ( = ?auto_11310 ?auto_11316 ) ) ( not ( = ?auto_11311 ?auto_11316 ) ) ( not ( = ?auto_11318 ?auto_11316 ) ) ( not ( = ?auto_11323 ?auto_11316 ) ) ( not ( = ?auto_11313 ?auto_11321 ) ) ( not ( = ?auto_11314 ?auto_11313 ) ) ( HOIST-AT ?auto_11320 ?auto_11313 ) ( not ( = ?auto_11312 ?auto_11320 ) ) ( not ( = ?auto_11315 ?auto_11320 ) ) ( SURFACE-AT ?auto_11309 ?auto_11313 ) ( ON ?auto_11309 ?auto_11319 ) ( CLEAR ?auto_11309 ) ( not ( = ?auto_11310 ?auto_11319 ) ) ( not ( = ?auto_11311 ?auto_11319 ) ) ( not ( = ?auto_11309 ?auto_11319 ) ) ( not ( = ?auto_11318 ?auto_11319 ) ) ( not ( = ?auto_11323 ?auto_11319 ) ) ( not ( = ?auto_11316 ?auto_11319 ) ) ( SURFACE-AT ?auto_11322 ?auto_11321 ) ( CLEAR ?auto_11322 ) ( IS-CRATE ?auto_11316 ) ( not ( = ?auto_11322 ?auto_11316 ) ) ( not ( = ?auto_11310 ?auto_11322 ) ) ( not ( = ?auto_11311 ?auto_11322 ) ) ( not ( = ?auto_11309 ?auto_11322 ) ) ( not ( = ?auto_11318 ?auto_11322 ) ) ( not ( = ?auto_11323 ?auto_11322 ) ) ( not ( = ?auto_11319 ?auto_11322 ) ) ( AVAILABLE ?auto_11312 ) ( TRUCK-AT ?auto_11317 ?auto_11313 ) ( LIFTING ?auto_11320 ?auto_11316 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11310 ?auto_11311 )
      ( MAKE-2CRATE-VERIFY ?auto_11309 ?auto_11310 ?auto_11311 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11324 - SURFACE
      ?auto_11325 - SURFACE
      ?auto_11326 - SURFACE
      ?auto_11327 - SURFACE
    )
    :vars
    (
      ?auto_11328 - HOIST
      ?auto_11337 - PLACE
      ?auto_11332 - PLACE
      ?auto_11335 - HOIST
      ?auto_11333 - SURFACE
      ?auto_11329 - SURFACE
      ?auto_11331 - PLACE
      ?auto_11334 - HOIST
      ?auto_11338 - SURFACE
      ?auto_11330 - SURFACE
      ?auto_11336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11328 ?auto_11337 ) ( IS-CRATE ?auto_11327 ) ( not ( = ?auto_11326 ?auto_11327 ) ) ( not ( = ?auto_11325 ?auto_11326 ) ) ( not ( = ?auto_11325 ?auto_11327 ) ) ( not ( = ?auto_11332 ?auto_11337 ) ) ( HOIST-AT ?auto_11335 ?auto_11332 ) ( not ( = ?auto_11328 ?auto_11335 ) ) ( SURFACE-AT ?auto_11327 ?auto_11332 ) ( ON ?auto_11327 ?auto_11333 ) ( CLEAR ?auto_11327 ) ( not ( = ?auto_11326 ?auto_11333 ) ) ( not ( = ?auto_11327 ?auto_11333 ) ) ( not ( = ?auto_11325 ?auto_11333 ) ) ( IS-CRATE ?auto_11326 ) ( AVAILABLE ?auto_11335 ) ( SURFACE-AT ?auto_11326 ?auto_11332 ) ( ON ?auto_11326 ?auto_11329 ) ( CLEAR ?auto_11326 ) ( not ( = ?auto_11326 ?auto_11329 ) ) ( not ( = ?auto_11327 ?auto_11329 ) ) ( not ( = ?auto_11325 ?auto_11329 ) ) ( not ( = ?auto_11333 ?auto_11329 ) ) ( IS-CRATE ?auto_11325 ) ( not ( = ?auto_11324 ?auto_11325 ) ) ( not ( = ?auto_11326 ?auto_11324 ) ) ( not ( = ?auto_11327 ?auto_11324 ) ) ( not ( = ?auto_11333 ?auto_11324 ) ) ( not ( = ?auto_11329 ?auto_11324 ) ) ( not ( = ?auto_11331 ?auto_11337 ) ) ( not ( = ?auto_11332 ?auto_11331 ) ) ( HOIST-AT ?auto_11334 ?auto_11331 ) ( not ( = ?auto_11328 ?auto_11334 ) ) ( not ( = ?auto_11335 ?auto_11334 ) ) ( SURFACE-AT ?auto_11325 ?auto_11331 ) ( ON ?auto_11325 ?auto_11338 ) ( CLEAR ?auto_11325 ) ( not ( = ?auto_11326 ?auto_11338 ) ) ( not ( = ?auto_11327 ?auto_11338 ) ) ( not ( = ?auto_11325 ?auto_11338 ) ) ( not ( = ?auto_11333 ?auto_11338 ) ) ( not ( = ?auto_11329 ?auto_11338 ) ) ( not ( = ?auto_11324 ?auto_11338 ) ) ( SURFACE-AT ?auto_11330 ?auto_11337 ) ( CLEAR ?auto_11330 ) ( IS-CRATE ?auto_11324 ) ( not ( = ?auto_11330 ?auto_11324 ) ) ( not ( = ?auto_11326 ?auto_11330 ) ) ( not ( = ?auto_11327 ?auto_11330 ) ) ( not ( = ?auto_11325 ?auto_11330 ) ) ( not ( = ?auto_11333 ?auto_11330 ) ) ( not ( = ?auto_11329 ?auto_11330 ) ) ( not ( = ?auto_11338 ?auto_11330 ) ) ( AVAILABLE ?auto_11328 ) ( TRUCK-AT ?auto_11336 ?auto_11331 ) ( LIFTING ?auto_11334 ?auto_11324 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11325 ?auto_11326 ?auto_11327 )
      ( MAKE-3CRATE-VERIFY ?auto_11324 ?auto_11325 ?auto_11326 ?auto_11327 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11339 - SURFACE
      ?auto_11340 - SURFACE
      ?auto_11341 - SURFACE
      ?auto_11342 - SURFACE
      ?auto_11343 - SURFACE
    )
    :vars
    (
      ?auto_11344 - HOIST
      ?auto_11352 - PLACE
      ?auto_11347 - PLACE
      ?auto_11350 - HOIST
      ?auto_11348 - SURFACE
      ?auto_11345 - SURFACE
      ?auto_11346 - PLACE
      ?auto_11349 - HOIST
      ?auto_11353 - SURFACE
      ?auto_11351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11344 ?auto_11352 ) ( IS-CRATE ?auto_11343 ) ( not ( = ?auto_11342 ?auto_11343 ) ) ( not ( = ?auto_11341 ?auto_11342 ) ) ( not ( = ?auto_11341 ?auto_11343 ) ) ( not ( = ?auto_11347 ?auto_11352 ) ) ( HOIST-AT ?auto_11350 ?auto_11347 ) ( not ( = ?auto_11344 ?auto_11350 ) ) ( SURFACE-AT ?auto_11343 ?auto_11347 ) ( ON ?auto_11343 ?auto_11348 ) ( CLEAR ?auto_11343 ) ( not ( = ?auto_11342 ?auto_11348 ) ) ( not ( = ?auto_11343 ?auto_11348 ) ) ( not ( = ?auto_11341 ?auto_11348 ) ) ( IS-CRATE ?auto_11342 ) ( AVAILABLE ?auto_11350 ) ( SURFACE-AT ?auto_11342 ?auto_11347 ) ( ON ?auto_11342 ?auto_11345 ) ( CLEAR ?auto_11342 ) ( not ( = ?auto_11342 ?auto_11345 ) ) ( not ( = ?auto_11343 ?auto_11345 ) ) ( not ( = ?auto_11341 ?auto_11345 ) ) ( not ( = ?auto_11348 ?auto_11345 ) ) ( IS-CRATE ?auto_11341 ) ( not ( = ?auto_11340 ?auto_11341 ) ) ( not ( = ?auto_11342 ?auto_11340 ) ) ( not ( = ?auto_11343 ?auto_11340 ) ) ( not ( = ?auto_11348 ?auto_11340 ) ) ( not ( = ?auto_11345 ?auto_11340 ) ) ( not ( = ?auto_11346 ?auto_11352 ) ) ( not ( = ?auto_11347 ?auto_11346 ) ) ( HOIST-AT ?auto_11349 ?auto_11346 ) ( not ( = ?auto_11344 ?auto_11349 ) ) ( not ( = ?auto_11350 ?auto_11349 ) ) ( SURFACE-AT ?auto_11341 ?auto_11346 ) ( ON ?auto_11341 ?auto_11353 ) ( CLEAR ?auto_11341 ) ( not ( = ?auto_11342 ?auto_11353 ) ) ( not ( = ?auto_11343 ?auto_11353 ) ) ( not ( = ?auto_11341 ?auto_11353 ) ) ( not ( = ?auto_11348 ?auto_11353 ) ) ( not ( = ?auto_11345 ?auto_11353 ) ) ( not ( = ?auto_11340 ?auto_11353 ) ) ( SURFACE-AT ?auto_11339 ?auto_11352 ) ( CLEAR ?auto_11339 ) ( IS-CRATE ?auto_11340 ) ( not ( = ?auto_11339 ?auto_11340 ) ) ( not ( = ?auto_11342 ?auto_11339 ) ) ( not ( = ?auto_11343 ?auto_11339 ) ) ( not ( = ?auto_11341 ?auto_11339 ) ) ( not ( = ?auto_11348 ?auto_11339 ) ) ( not ( = ?auto_11345 ?auto_11339 ) ) ( not ( = ?auto_11353 ?auto_11339 ) ) ( AVAILABLE ?auto_11344 ) ( TRUCK-AT ?auto_11351 ?auto_11346 ) ( LIFTING ?auto_11349 ?auto_11340 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11341 ?auto_11342 ?auto_11343 )
      ( MAKE-4CRATE-VERIFY ?auto_11339 ?auto_11340 ?auto_11341 ?auto_11342 ?auto_11343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11354 - SURFACE
      ?auto_11355 - SURFACE
    )
    :vars
    (
      ?auto_11356 - HOIST
      ?auto_11366 - PLACE
      ?auto_11368 - SURFACE
      ?auto_11361 - PLACE
      ?auto_11364 - HOIST
      ?auto_11362 - SURFACE
      ?auto_11357 - SURFACE
      ?auto_11360 - SURFACE
      ?auto_11359 - PLACE
      ?auto_11363 - HOIST
      ?auto_11367 - SURFACE
      ?auto_11358 - SURFACE
      ?auto_11365 - TRUCK
      ?auto_11369 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11356 ?auto_11366 ) ( IS-CRATE ?auto_11355 ) ( not ( = ?auto_11354 ?auto_11355 ) ) ( not ( = ?auto_11368 ?auto_11354 ) ) ( not ( = ?auto_11368 ?auto_11355 ) ) ( not ( = ?auto_11361 ?auto_11366 ) ) ( HOIST-AT ?auto_11364 ?auto_11361 ) ( not ( = ?auto_11356 ?auto_11364 ) ) ( SURFACE-AT ?auto_11355 ?auto_11361 ) ( ON ?auto_11355 ?auto_11362 ) ( CLEAR ?auto_11355 ) ( not ( = ?auto_11354 ?auto_11362 ) ) ( not ( = ?auto_11355 ?auto_11362 ) ) ( not ( = ?auto_11368 ?auto_11362 ) ) ( IS-CRATE ?auto_11354 ) ( AVAILABLE ?auto_11364 ) ( SURFACE-AT ?auto_11354 ?auto_11361 ) ( ON ?auto_11354 ?auto_11357 ) ( CLEAR ?auto_11354 ) ( not ( = ?auto_11354 ?auto_11357 ) ) ( not ( = ?auto_11355 ?auto_11357 ) ) ( not ( = ?auto_11368 ?auto_11357 ) ) ( not ( = ?auto_11362 ?auto_11357 ) ) ( IS-CRATE ?auto_11368 ) ( not ( = ?auto_11360 ?auto_11368 ) ) ( not ( = ?auto_11354 ?auto_11360 ) ) ( not ( = ?auto_11355 ?auto_11360 ) ) ( not ( = ?auto_11362 ?auto_11360 ) ) ( not ( = ?auto_11357 ?auto_11360 ) ) ( not ( = ?auto_11359 ?auto_11366 ) ) ( not ( = ?auto_11361 ?auto_11359 ) ) ( HOIST-AT ?auto_11363 ?auto_11359 ) ( not ( = ?auto_11356 ?auto_11363 ) ) ( not ( = ?auto_11364 ?auto_11363 ) ) ( SURFACE-AT ?auto_11368 ?auto_11359 ) ( ON ?auto_11368 ?auto_11367 ) ( CLEAR ?auto_11368 ) ( not ( = ?auto_11354 ?auto_11367 ) ) ( not ( = ?auto_11355 ?auto_11367 ) ) ( not ( = ?auto_11368 ?auto_11367 ) ) ( not ( = ?auto_11362 ?auto_11367 ) ) ( not ( = ?auto_11357 ?auto_11367 ) ) ( not ( = ?auto_11360 ?auto_11367 ) ) ( SURFACE-AT ?auto_11358 ?auto_11366 ) ( CLEAR ?auto_11358 ) ( IS-CRATE ?auto_11360 ) ( not ( = ?auto_11358 ?auto_11360 ) ) ( not ( = ?auto_11354 ?auto_11358 ) ) ( not ( = ?auto_11355 ?auto_11358 ) ) ( not ( = ?auto_11368 ?auto_11358 ) ) ( not ( = ?auto_11362 ?auto_11358 ) ) ( not ( = ?auto_11357 ?auto_11358 ) ) ( not ( = ?auto_11367 ?auto_11358 ) ) ( AVAILABLE ?auto_11356 ) ( TRUCK-AT ?auto_11365 ?auto_11359 ) ( AVAILABLE ?auto_11363 ) ( SURFACE-AT ?auto_11360 ?auto_11359 ) ( ON ?auto_11360 ?auto_11369 ) ( CLEAR ?auto_11360 ) ( not ( = ?auto_11354 ?auto_11369 ) ) ( not ( = ?auto_11355 ?auto_11369 ) ) ( not ( = ?auto_11368 ?auto_11369 ) ) ( not ( = ?auto_11362 ?auto_11369 ) ) ( not ( = ?auto_11357 ?auto_11369 ) ) ( not ( = ?auto_11360 ?auto_11369 ) ) ( not ( = ?auto_11367 ?auto_11369 ) ) ( not ( = ?auto_11358 ?auto_11369 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11363 ?auto_11360 ?auto_11369 ?auto_11359 )
      ( MAKE-2CRATE ?auto_11368 ?auto_11354 ?auto_11355 )
      ( MAKE-1CRATE-VERIFY ?auto_11354 ?auto_11355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11370 - SURFACE
      ?auto_11371 - SURFACE
      ?auto_11372 - SURFACE
    )
    :vars
    (
      ?auto_11385 - HOIST
      ?auto_11381 - PLACE
      ?auto_11380 - PLACE
      ?auto_11378 - HOIST
      ?auto_11382 - SURFACE
      ?auto_11374 - SURFACE
      ?auto_11379 - SURFACE
      ?auto_11373 - PLACE
      ?auto_11375 - HOIST
      ?auto_11376 - SURFACE
      ?auto_11384 - SURFACE
      ?auto_11377 - TRUCK
      ?auto_11383 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11385 ?auto_11381 ) ( IS-CRATE ?auto_11372 ) ( not ( = ?auto_11371 ?auto_11372 ) ) ( not ( = ?auto_11370 ?auto_11371 ) ) ( not ( = ?auto_11370 ?auto_11372 ) ) ( not ( = ?auto_11380 ?auto_11381 ) ) ( HOIST-AT ?auto_11378 ?auto_11380 ) ( not ( = ?auto_11385 ?auto_11378 ) ) ( SURFACE-AT ?auto_11372 ?auto_11380 ) ( ON ?auto_11372 ?auto_11382 ) ( CLEAR ?auto_11372 ) ( not ( = ?auto_11371 ?auto_11382 ) ) ( not ( = ?auto_11372 ?auto_11382 ) ) ( not ( = ?auto_11370 ?auto_11382 ) ) ( IS-CRATE ?auto_11371 ) ( AVAILABLE ?auto_11378 ) ( SURFACE-AT ?auto_11371 ?auto_11380 ) ( ON ?auto_11371 ?auto_11374 ) ( CLEAR ?auto_11371 ) ( not ( = ?auto_11371 ?auto_11374 ) ) ( not ( = ?auto_11372 ?auto_11374 ) ) ( not ( = ?auto_11370 ?auto_11374 ) ) ( not ( = ?auto_11382 ?auto_11374 ) ) ( IS-CRATE ?auto_11370 ) ( not ( = ?auto_11379 ?auto_11370 ) ) ( not ( = ?auto_11371 ?auto_11379 ) ) ( not ( = ?auto_11372 ?auto_11379 ) ) ( not ( = ?auto_11382 ?auto_11379 ) ) ( not ( = ?auto_11374 ?auto_11379 ) ) ( not ( = ?auto_11373 ?auto_11381 ) ) ( not ( = ?auto_11380 ?auto_11373 ) ) ( HOIST-AT ?auto_11375 ?auto_11373 ) ( not ( = ?auto_11385 ?auto_11375 ) ) ( not ( = ?auto_11378 ?auto_11375 ) ) ( SURFACE-AT ?auto_11370 ?auto_11373 ) ( ON ?auto_11370 ?auto_11376 ) ( CLEAR ?auto_11370 ) ( not ( = ?auto_11371 ?auto_11376 ) ) ( not ( = ?auto_11372 ?auto_11376 ) ) ( not ( = ?auto_11370 ?auto_11376 ) ) ( not ( = ?auto_11382 ?auto_11376 ) ) ( not ( = ?auto_11374 ?auto_11376 ) ) ( not ( = ?auto_11379 ?auto_11376 ) ) ( SURFACE-AT ?auto_11384 ?auto_11381 ) ( CLEAR ?auto_11384 ) ( IS-CRATE ?auto_11379 ) ( not ( = ?auto_11384 ?auto_11379 ) ) ( not ( = ?auto_11371 ?auto_11384 ) ) ( not ( = ?auto_11372 ?auto_11384 ) ) ( not ( = ?auto_11370 ?auto_11384 ) ) ( not ( = ?auto_11382 ?auto_11384 ) ) ( not ( = ?auto_11374 ?auto_11384 ) ) ( not ( = ?auto_11376 ?auto_11384 ) ) ( AVAILABLE ?auto_11385 ) ( TRUCK-AT ?auto_11377 ?auto_11373 ) ( AVAILABLE ?auto_11375 ) ( SURFACE-AT ?auto_11379 ?auto_11373 ) ( ON ?auto_11379 ?auto_11383 ) ( CLEAR ?auto_11379 ) ( not ( = ?auto_11371 ?auto_11383 ) ) ( not ( = ?auto_11372 ?auto_11383 ) ) ( not ( = ?auto_11370 ?auto_11383 ) ) ( not ( = ?auto_11382 ?auto_11383 ) ) ( not ( = ?auto_11374 ?auto_11383 ) ) ( not ( = ?auto_11379 ?auto_11383 ) ) ( not ( = ?auto_11376 ?auto_11383 ) ) ( not ( = ?auto_11384 ?auto_11383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11371 ?auto_11372 )
      ( MAKE-2CRATE-VERIFY ?auto_11370 ?auto_11371 ?auto_11372 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11386 - SURFACE
      ?auto_11387 - SURFACE
      ?auto_11388 - SURFACE
      ?auto_11389 - SURFACE
    )
    :vars
    (
      ?auto_11390 - HOIST
      ?auto_11397 - PLACE
      ?auto_11401 - PLACE
      ?auto_11394 - HOIST
      ?auto_11400 - SURFACE
      ?auto_11393 - SURFACE
      ?auto_11392 - PLACE
      ?auto_11396 - HOIST
      ?auto_11399 - SURFACE
      ?auto_11398 - SURFACE
      ?auto_11395 - TRUCK
      ?auto_11391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11390 ?auto_11397 ) ( IS-CRATE ?auto_11389 ) ( not ( = ?auto_11388 ?auto_11389 ) ) ( not ( = ?auto_11387 ?auto_11388 ) ) ( not ( = ?auto_11387 ?auto_11389 ) ) ( not ( = ?auto_11401 ?auto_11397 ) ) ( HOIST-AT ?auto_11394 ?auto_11401 ) ( not ( = ?auto_11390 ?auto_11394 ) ) ( SURFACE-AT ?auto_11389 ?auto_11401 ) ( ON ?auto_11389 ?auto_11400 ) ( CLEAR ?auto_11389 ) ( not ( = ?auto_11388 ?auto_11400 ) ) ( not ( = ?auto_11389 ?auto_11400 ) ) ( not ( = ?auto_11387 ?auto_11400 ) ) ( IS-CRATE ?auto_11388 ) ( AVAILABLE ?auto_11394 ) ( SURFACE-AT ?auto_11388 ?auto_11401 ) ( ON ?auto_11388 ?auto_11393 ) ( CLEAR ?auto_11388 ) ( not ( = ?auto_11388 ?auto_11393 ) ) ( not ( = ?auto_11389 ?auto_11393 ) ) ( not ( = ?auto_11387 ?auto_11393 ) ) ( not ( = ?auto_11400 ?auto_11393 ) ) ( IS-CRATE ?auto_11387 ) ( not ( = ?auto_11386 ?auto_11387 ) ) ( not ( = ?auto_11388 ?auto_11386 ) ) ( not ( = ?auto_11389 ?auto_11386 ) ) ( not ( = ?auto_11400 ?auto_11386 ) ) ( not ( = ?auto_11393 ?auto_11386 ) ) ( not ( = ?auto_11392 ?auto_11397 ) ) ( not ( = ?auto_11401 ?auto_11392 ) ) ( HOIST-AT ?auto_11396 ?auto_11392 ) ( not ( = ?auto_11390 ?auto_11396 ) ) ( not ( = ?auto_11394 ?auto_11396 ) ) ( SURFACE-AT ?auto_11387 ?auto_11392 ) ( ON ?auto_11387 ?auto_11399 ) ( CLEAR ?auto_11387 ) ( not ( = ?auto_11388 ?auto_11399 ) ) ( not ( = ?auto_11389 ?auto_11399 ) ) ( not ( = ?auto_11387 ?auto_11399 ) ) ( not ( = ?auto_11400 ?auto_11399 ) ) ( not ( = ?auto_11393 ?auto_11399 ) ) ( not ( = ?auto_11386 ?auto_11399 ) ) ( SURFACE-AT ?auto_11398 ?auto_11397 ) ( CLEAR ?auto_11398 ) ( IS-CRATE ?auto_11386 ) ( not ( = ?auto_11398 ?auto_11386 ) ) ( not ( = ?auto_11388 ?auto_11398 ) ) ( not ( = ?auto_11389 ?auto_11398 ) ) ( not ( = ?auto_11387 ?auto_11398 ) ) ( not ( = ?auto_11400 ?auto_11398 ) ) ( not ( = ?auto_11393 ?auto_11398 ) ) ( not ( = ?auto_11399 ?auto_11398 ) ) ( AVAILABLE ?auto_11390 ) ( TRUCK-AT ?auto_11395 ?auto_11392 ) ( AVAILABLE ?auto_11396 ) ( SURFACE-AT ?auto_11386 ?auto_11392 ) ( ON ?auto_11386 ?auto_11391 ) ( CLEAR ?auto_11386 ) ( not ( = ?auto_11388 ?auto_11391 ) ) ( not ( = ?auto_11389 ?auto_11391 ) ) ( not ( = ?auto_11387 ?auto_11391 ) ) ( not ( = ?auto_11400 ?auto_11391 ) ) ( not ( = ?auto_11393 ?auto_11391 ) ) ( not ( = ?auto_11386 ?auto_11391 ) ) ( not ( = ?auto_11399 ?auto_11391 ) ) ( not ( = ?auto_11398 ?auto_11391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11387 ?auto_11388 ?auto_11389 )
      ( MAKE-3CRATE-VERIFY ?auto_11386 ?auto_11387 ?auto_11388 ?auto_11389 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11402 - SURFACE
      ?auto_11403 - SURFACE
      ?auto_11404 - SURFACE
      ?auto_11405 - SURFACE
      ?auto_11406 - SURFACE
    )
    :vars
    (
      ?auto_11407 - HOIST
      ?auto_11414 - PLACE
      ?auto_11417 - PLACE
      ?auto_11411 - HOIST
      ?auto_11416 - SURFACE
      ?auto_11410 - SURFACE
      ?auto_11409 - PLACE
      ?auto_11413 - HOIST
      ?auto_11415 - SURFACE
      ?auto_11412 - TRUCK
      ?auto_11408 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11407 ?auto_11414 ) ( IS-CRATE ?auto_11406 ) ( not ( = ?auto_11405 ?auto_11406 ) ) ( not ( = ?auto_11404 ?auto_11405 ) ) ( not ( = ?auto_11404 ?auto_11406 ) ) ( not ( = ?auto_11417 ?auto_11414 ) ) ( HOIST-AT ?auto_11411 ?auto_11417 ) ( not ( = ?auto_11407 ?auto_11411 ) ) ( SURFACE-AT ?auto_11406 ?auto_11417 ) ( ON ?auto_11406 ?auto_11416 ) ( CLEAR ?auto_11406 ) ( not ( = ?auto_11405 ?auto_11416 ) ) ( not ( = ?auto_11406 ?auto_11416 ) ) ( not ( = ?auto_11404 ?auto_11416 ) ) ( IS-CRATE ?auto_11405 ) ( AVAILABLE ?auto_11411 ) ( SURFACE-AT ?auto_11405 ?auto_11417 ) ( ON ?auto_11405 ?auto_11410 ) ( CLEAR ?auto_11405 ) ( not ( = ?auto_11405 ?auto_11410 ) ) ( not ( = ?auto_11406 ?auto_11410 ) ) ( not ( = ?auto_11404 ?auto_11410 ) ) ( not ( = ?auto_11416 ?auto_11410 ) ) ( IS-CRATE ?auto_11404 ) ( not ( = ?auto_11403 ?auto_11404 ) ) ( not ( = ?auto_11405 ?auto_11403 ) ) ( not ( = ?auto_11406 ?auto_11403 ) ) ( not ( = ?auto_11416 ?auto_11403 ) ) ( not ( = ?auto_11410 ?auto_11403 ) ) ( not ( = ?auto_11409 ?auto_11414 ) ) ( not ( = ?auto_11417 ?auto_11409 ) ) ( HOIST-AT ?auto_11413 ?auto_11409 ) ( not ( = ?auto_11407 ?auto_11413 ) ) ( not ( = ?auto_11411 ?auto_11413 ) ) ( SURFACE-AT ?auto_11404 ?auto_11409 ) ( ON ?auto_11404 ?auto_11415 ) ( CLEAR ?auto_11404 ) ( not ( = ?auto_11405 ?auto_11415 ) ) ( not ( = ?auto_11406 ?auto_11415 ) ) ( not ( = ?auto_11404 ?auto_11415 ) ) ( not ( = ?auto_11416 ?auto_11415 ) ) ( not ( = ?auto_11410 ?auto_11415 ) ) ( not ( = ?auto_11403 ?auto_11415 ) ) ( SURFACE-AT ?auto_11402 ?auto_11414 ) ( CLEAR ?auto_11402 ) ( IS-CRATE ?auto_11403 ) ( not ( = ?auto_11402 ?auto_11403 ) ) ( not ( = ?auto_11405 ?auto_11402 ) ) ( not ( = ?auto_11406 ?auto_11402 ) ) ( not ( = ?auto_11404 ?auto_11402 ) ) ( not ( = ?auto_11416 ?auto_11402 ) ) ( not ( = ?auto_11410 ?auto_11402 ) ) ( not ( = ?auto_11415 ?auto_11402 ) ) ( AVAILABLE ?auto_11407 ) ( TRUCK-AT ?auto_11412 ?auto_11409 ) ( AVAILABLE ?auto_11413 ) ( SURFACE-AT ?auto_11403 ?auto_11409 ) ( ON ?auto_11403 ?auto_11408 ) ( CLEAR ?auto_11403 ) ( not ( = ?auto_11405 ?auto_11408 ) ) ( not ( = ?auto_11406 ?auto_11408 ) ) ( not ( = ?auto_11404 ?auto_11408 ) ) ( not ( = ?auto_11416 ?auto_11408 ) ) ( not ( = ?auto_11410 ?auto_11408 ) ) ( not ( = ?auto_11403 ?auto_11408 ) ) ( not ( = ?auto_11415 ?auto_11408 ) ) ( not ( = ?auto_11402 ?auto_11408 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11404 ?auto_11405 ?auto_11406 )
      ( MAKE-4CRATE-VERIFY ?auto_11402 ?auto_11403 ?auto_11404 ?auto_11405 ?auto_11406 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11418 - SURFACE
      ?auto_11419 - SURFACE
    )
    :vars
    (
      ?auto_11420 - HOIST
      ?auto_11427 - PLACE
      ?auto_11433 - SURFACE
      ?auto_11431 - PLACE
      ?auto_11424 - HOIST
      ?auto_11430 - SURFACE
      ?auto_11423 - SURFACE
      ?auto_11432 - SURFACE
      ?auto_11422 - PLACE
      ?auto_11426 - HOIST
      ?auto_11429 - SURFACE
      ?auto_11428 - SURFACE
      ?auto_11421 - SURFACE
      ?auto_11425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11420 ?auto_11427 ) ( IS-CRATE ?auto_11419 ) ( not ( = ?auto_11418 ?auto_11419 ) ) ( not ( = ?auto_11433 ?auto_11418 ) ) ( not ( = ?auto_11433 ?auto_11419 ) ) ( not ( = ?auto_11431 ?auto_11427 ) ) ( HOIST-AT ?auto_11424 ?auto_11431 ) ( not ( = ?auto_11420 ?auto_11424 ) ) ( SURFACE-AT ?auto_11419 ?auto_11431 ) ( ON ?auto_11419 ?auto_11430 ) ( CLEAR ?auto_11419 ) ( not ( = ?auto_11418 ?auto_11430 ) ) ( not ( = ?auto_11419 ?auto_11430 ) ) ( not ( = ?auto_11433 ?auto_11430 ) ) ( IS-CRATE ?auto_11418 ) ( AVAILABLE ?auto_11424 ) ( SURFACE-AT ?auto_11418 ?auto_11431 ) ( ON ?auto_11418 ?auto_11423 ) ( CLEAR ?auto_11418 ) ( not ( = ?auto_11418 ?auto_11423 ) ) ( not ( = ?auto_11419 ?auto_11423 ) ) ( not ( = ?auto_11433 ?auto_11423 ) ) ( not ( = ?auto_11430 ?auto_11423 ) ) ( IS-CRATE ?auto_11433 ) ( not ( = ?auto_11432 ?auto_11433 ) ) ( not ( = ?auto_11418 ?auto_11432 ) ) ( not ( = ?auto_11419 ?auto_11432 ) ) ( not ( = ?auto_11430 ?auto_11432 ) ) ( not ( = ?auto_11423 ?auto_11432 ) ) ( not ( = ?auto_11422 ?auto_11427 ) ) ( not ( = ?auto_11431 ?auto_11422 ) ) ( HOIST-AT ?auto_11426 ?auto_11422 ) ( not ( = ?auto_11420 ?auto_11426 ) ) ( not ( = ?auto_11424 ?auto_11426 ) ) ( SURFACE-AT ?auto_11433 ?auto_11422 ) ( ON ?auto_11433 ?auto_11429 ) ( CLEAR ?auto_11433 ) ( not ( = ?auto_11418 ?auto_11429 ) ) ( not ( = ?auto_11419 ?auto_11429 ) ) ( not ( = ?auto_11433 ?auto_11429 ) ) ( not ( = ?auto_11430 ?auto_11429 ) ) ( not ( = ?auto_11423 ?auto_11429 ) ) ( not ( = ?auto_11432 ?auto_11429 ) ) ( SURFACE-AT ?auto_11428 ?auto_11427 ) ( CLEAR ?auto_11428 ) ( IS-CRATE ?auto_11432 ) ( not ( = ?auto_11428 ?auto_11432 ) ) ( not ( = ?auto_11418 ?auto_11428 ) ) ( not ( = ?auto_11419 ?auto_11428 ) ) ( not ( = ?auto_11433 ?auto_11428 ) ) ( not ( = ?auto_11430 ?auto_11428 ) ) ( not ( = ?auto_11423 ?auto_11428 ) ) ( not ( = ?auto_11429 ?auto_11428 ) ) ( AVAILABLE ?auto_11420 ) ( AVAILABLE ?auto_11426 ) ( SURFACE-AT ?auto_11432 ?auto_11422 ) ( ON ?auto_11432 ?auto_11421 ) ( CLEAR ?auto_11432 ) ( not ( = ?auto_11418 ?auto_11421 ) ) ( not ( = ?auto_11419 ?auto_11421 ) ) ( not ( = ?auto_11433 ?auto_11421 ) ) ( not ( = ?auto_11430 ?auto_11421 ) ) ( not ( = ?auto_11423 ?auto_11421 ) ) ( not ( = ?auto_11432 ?auto_11421 ) ) ( not ( = ?auto_11429 ?auto_11421 ) ) ( not ( = ?auto_11428 ?auto_11421 ) ) ( TRUCK-AT ?auto_11425 ?auto_11427 ) )
    :subtasks
    ( ( !DRIVE ?auto_11425 ?auto_11427 ?auto_11422 )
      ( MAKE-2CRATE ?auto_11433 ?auto_11418 ?auto_11419 )
      ( MAKE-1CRATE-VERIFY ?auto_11418 ?auto_11419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11434 - SURFACE
      ?auto_11435 - SURFACE
      ?auto_11436 - SURFACE
    )
    :vars
    (
      ?auto_11444 - HOIST
      ?auto_11448 - PLACE
      ?auto_11438 - PLACE
      ?auto_11445 - HOIST
      ?auto_11449 - SURFACE
      ?auto_11437 - SURFACE
      ?auto_11442 - SURFACE
      ?auto_11446 - PLACE
      ?auto_11439 - HOIST
      ?auto_11447 - SURFACE
      ?auto_11443 - SURFACE
      ?auto_11440 - SURFACE
      ?auto_11441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11444 ?auto_11448 ) ( IS-CRATE ?auto_11436 ) ( not ( = ?auto_11435 ?auto_11436 ) ) ( not ( = ?auto_11434 ?auto_11435 ) ) ( not ( = ?auto_11434 ?auto_11436 ) ) ( not ( = ?auto_11438 ?auto_11448 ) ) ( HOIST-AT ?auto_11445 ?auto_11438 ) ( not ( = ?auto_11444 ?auto_11445 ) ) ( SURFACE-AT ?auto_11436 ?auto_11438 ) ( ON ?auto_11436 ?auto_11449 ) ( CLEAR ?auto_11436 ) ( not ( = ?auto_11435 ?auto_11449 ) ) ( not ( = ?auto_11436 ?auto_11449 ) ) ( not ( = ?auto_11434 ?auto_11449 ) ) ( IS-CRATE ?auto_11435 ) ( AVAILABLE ?auto_11445 ) ( SURFACE-AT ?auto_11435 ?auto_11438 ) ( ON ?auto_11435 ?auto_11437 ) ( CLEAR ?auto_11435 ) ( not ( = ?auto_11435 ?auto_11437 ) ) ( not ( = ?auto_11436 ?auto_11437 ) ) ( not ( = ?auto_11434 ?auto_11437 ) ) ( not ( = ?auto_11449 ?auto_11437 ) ) ( IS-CRATE ?auto_11434 ) ( not ( = ?auto_11442 ?auto_11434 ) ) ( not ( = ?auto_11435 ?auto_11442 ) ) ( not ( = ?auto_11436 ?auto_11442 ) ) ( not ( = ?auto_11449 ?auto_11442 ) ) ( not ( = ?auto_11437 ?auto_11442 ) ) ( not ( = ?auto_11446 ?auto_11448 ) ) ( not ( = ?auto_11438 ?auto_11446 ) ) ( HOIST-AT ?auto_11439 ?auto_11446 ) ( not ( = ?auto_11444 ?auto_11439 ) ) ( not ( = ?auto_11445 ?auto_11439 ) ) ( SURFACE-AT ?auto_11434 ?auto_11446 ) ( ON ?auto_11434 ?auto_11447 ) ( CLEAR ?auto_11434 ) ( not ( = ?auto_11435 ?auto_11447 ) ) ( not ( = ?auto_11436 ?auto_11447 ) ) ( not ( = ?auto_11434 ?auto_11447 ) ) ( not ( = ?auto_11449 ?auto_11447 ) ) ( not ( = ?auto_11437 ?auto_11447 ) ) ( not ( = ?auto_11442 ?auto_11447 ) ) ( SURFACE-AT ?auto_11443 ?auto_11448 ) ( CLEAR ?auto_11443 ) ( IS-CRATE ?auto_11442 ) ( not ( = ?auto_11443 ?auto_11442 ) ) ( not ( = ?auto_11435 ?auto_11443 ) ) ( not ( = ?auto_11436 ?auto_11443 ) ) ( not ( = ?auto_11434 ?auto_11443 ) ) ( not ( = ?auto_11449 ?auto_11443 ) ) ( not ( = ?auto_11437 ?auto_11443 ) ) ( not ( = ?auto_11447 ?auto_11443 ) ) ( AVAILABLE ?auto_11444 ) ( AVAILABLE ?auto_11439 ) ( SURFACE-AT ?auto_11442 ?auto_11446 ) ( ON ?auto_11442 ?auto_11440 ) ( CLEAR ?auto_11442 ) ( not ( = ?auto_11435 ?auto_11440 ) ) ( not ( = ?auto_11436 ?auto_11440 ) ) ( not ( = ?auto_11434 ?auto_11440 ) ) ( not ( = ?auto_11449 ?auto_11440 ) ) ( not ( = ?auto_11437 ?auto_11440 ) ) ( not ( = ?auto_11442 ?auto_11440 ) ) ( not ( = ?auto_11447 ?auto_11440 ) ) ( not ( = ?auto_11443 ?auto_11440 ) ) ( TRUCK-AT ?auto_11441 ?auto_11448 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11435 ?auto_11436 )
      ( MAKE-2CRATE-VERIFY ?auto_11434 ?auto_11435 ?auto_11436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11450 - SURFACE
      ?auto_11451 - SURFACE
      ?auto_11452 - SURFACE
      ?auto_11453 - SURFACE
    )
    :vars
    (
      ?auto_11463 - HOIST
      ?auto_11461 - PLACE
      ?auto_11462 - PLACE
      ?auto_11458 - HOIST
      ?auto_11456 - SURFACE
      ?auto_11454 - SURFACE
      ?auto_11455 - PLACE
      ?auto_11465 - HOIST
      ?auto_11457 - SURFACE
      ?auto_11464 - SURFACE
      ?auto_11460 - SURFACE
      ?auto_11459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11463 ?auto_11461 ) ( IS-CRATE ?auto_11453 ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( not ( = ?auto_11451 ?auto_11452 ) ) ( not ( = ?auto_11451 ?auto_11453 ) ) ( not ( = ?auto_11462 ?auto_11461 ) ) ( HOIST-AT ?auto_11458 ?auto_11462 ) ( not ( = ?auto_11463 ?auto_11458 ) ) ( SURFACE-AT ?auto_11453 ?auto_11462 ) ( ON ?auto_11453 ?auto_11456 ) ( CLEAR ?auto_11453 ) ( not ( = ?auto_11452 ?auto_11456 ) ) ( not ( = ?auto_11453 ?auto_11456 ) ) ( not ( = ?auto_11451 ?auto_11456 ) ) ( IS-CRATE ?auto_11452 ) ( AVAILABLE ?auto_11458 ) ( SURFACE-AT ?auto_11452 ?auto_11462 ) ( ON ?auto_11452 ?auto_11454 ) ( CLEAR ?auto_11452 ) ( not ( = ?auto_11452 ?auto_11454 ) ) ( not ( = ?auto_11453 ?auto_11454 ) ) ( not ( = ?auto_11451 ?auto_11454 ) ) ( not ( = ?auto_11456 ?auto_11454 ) ) ( IS-CRATE ?auto_11451 ) ( not ( = ?auto_11450 ?auto_11451 ) ) ( not ( = ?auto_11452 ?auto_11450 ) ) ( not ( = ?auto_11453 ?auto_11450 ) ) ( not ( = ?auto_11456 ?auto_11450 ) ) ( not ( = ?auto_11454 ?auto_11450 ) ) ( not ( = ?auto_11455 ?auto_11461 ) ) ( not ( = ?auto_11462 ?auto_11455 ) ) ( HOIST-AT ?auto_11465 ?auto_11455 ) ( not ( = ?auto_11463 ?auto_11465 ) ) ( not ( = ?auto_11458 ?auto_11465 ) ) ( SURFACE-AT ?auto_11451 ?auto_11455 ) ( ON ?auto_11451 ?auto_11457 ) ( CLEAR ?auto_11451 ) ( not ( = ?auto_11452 ?auto_11457 ) ) ( not ( = ?auto_11453 ?auto_11457 ) ) ( not ( = ?auto_11451 ?auto_11457 ) ) ( not ( = ?auto_11456 ?auto_11457 ) ) ( not ( = ?auto_11454 ?auto_11457 ) ) ( not ( = ?auto_11450 ?auto_11457 ) ) ( SURFACE-AT ?auto_11464 ?auto_11461 ) ( CLEAR ?auto_11464 ) ( IS-CRATE ?auto_11450 ) ( not ( = ?auto_11464 ?auto_11450 ) ) ( not ( = ?auto_11452 ?auto_11464 ) ) ( not ( = ?auto_11453 ?auto_11464 ) ) ( not ( = ?auto_11451 ?auto_11464 ) ) ( not ( = ?auto_11456 ?auto_11464 ) ) ( not ( = ?auto_11454 ?auto_11464 ) ) ( not ( = ?auto_11457 ?auto_11464 ) ) ( AVAILABLE ?auto_11463 ) ( AVAILABLE ?auto_11465 ) ( SURFACE-AT ?auto_11450 ?auto_11455 ) ( ON ?auto_11450 ?auto_11460 ) ( CLEAR ?auto_11450 ) ( not ( = ?auto_11452 ?auto_11460 ) ) ( not ( = ?auto_11453 ?auto_11460 ) ) ( not ( = ?auto_11451 ?auto_11460 ) ) ( not ( = ?auto_11456 ?auto_11460 ) ) ( not ( = ?auto_11454 ?auto_11460 ) ) ( not ( = ?auto_11450 ?auto_11460 ) ) ( not ( = ?auto_11457 ?auto_11460 ) ) ( not ( = ?auto_11464 ?auto_11460 ) ) ( TRUCK-AT ?auto_11459 ?auto_11461 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11451 ?auto_11452 ?auto_11453 )
      ( MAKE-3CRATE-VERIFY ?auto_11450 ?auto_11451 ?auto_11452 ?auto_11453 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11466 - SURFACE
      ?auto_11467 - SURFACE
      ?auto_11468 - SURFACE
      ?auto_11469 - SURFACE
      ?auto_11470 - SURFACE
    )
    :vars
    (
      ?auto_11480 - HOIST
      ?auto_11478 - PLACE
      ?auto_11479 - PLACE
      ?auto_11475 - HOIST
      ?auto_11473 - SURFACE
      ?auto_11471 - SURFACE
      ?auto_11472 - PLACE
      ?auto_11481 - HOIST
      ?auto_11474 - SURFACE
      ?auto_11477 - SURFACE
      ?auto_11476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11480 ?auto_11478 ) ( IS-CRATE ?auto_11470 ) ( not ( = ?auto_11469 ?auto_11470 ) ) ( not ( = ?auto_11468 ?auto_11469 ) ) ( not ( = ?auto_11468 ?auto_11470 ) ) ( not ( = ?auto_11479 ?auto_11478 ) ) ( HOIST-AT ?auto_11475 ?auto_11479 ) ( not ( = ?auto_11480 ?auto_11475 ) ) ( SURFACE-AT ?auto_11470 ?auto_11479 ) ( ON ?auto_11470 ?auto_11473 ) ( CLEAR ?auto_11470 ) ( not ( = ?auto_11469 ?auto_11473 ) ) ( not ( = ?auto_11470 ?auto_11473 ) ) ( not ( = ?auto_11468 ?auto_11473 ) ) ( IS-CRATE ?auto_11469 ) ( AVAILABLE ?auto_11475 ) ( SURFACE-AT ?auto_11469 ?auto_11479 ) ( ON ?auto_11469 ?auto_11471 ) ( CLEAR ?auto_11469 ) ( not ( = ?auto_11469 ?auto_11471 ) ) ( not ( = ?auto_11470 ?auto_11471 ) ) ( not ( = ?auto_11468 ?auto_11471 ) ) ( not ( = ?auto_11473 ?auto_11471 ) ) ( IS-CRATE ?auto_11468 ) ( not ( = ?auto_11467 ?auto_11468 ) ) ( not ( = ?auto_11469 ?auto_11467 ) ) ( not ( = ?auto_11470 ?auto_11467 ) ) ( not ( = ?auto_11473 ?auto_11467 ) ) ( not ( = ?auto_11471 ?auto_11467 ) ) ( not ( = ?auto_11472 ?auto_11478 ) ) ( not ( = ?auto_11479 ?auto_11472 ) ) ( HOIST-AT ?auto_11481 ?auto_11472 ) ( not ( = ?auto_11480 ?auto_11481 ) ) ( not ( = ?auto_11475 ?auto_11481 ) ) ( SURFACE-AT ?auto_11468 ?auto_11472 ) ( ON ?auto_11468 ?auto_11474 ) ( CLEAR ?auto_11468 ) ( not ( = ?auto_11469 ?auto_11474 ) ) ( not ( = ?auto_11470 ?auto_11474 ) ) ( not ( = ?auto_11468 ?auto_11474 ) ) ( not ( = ?auto_11473 ?auto_11474 ) ) ( not ( = ?auto_11471 ?auto_11474 ) ) ( not ( = ?auto_11467 ?auto_11474 ) ) ( SURFACE-AT ?auto_11466 ?auto_11478 ) ( CLEAR ?auto_11466 ) ( IS-CRATE ?auto_11467 ) ( not ( = ?auto_11466 ?auto_11467 ) ) ( not ( = ?auto_11469 ?auto_11466 ) ) ( not ( = ?auto_11470 ?auto_11466 ) ) ( not ( = ?auto_11468 ?auto_11466 ) ) ( not ( = ?auto_11473 ?auto_11466 ) ) ( not ( = ?auto_11471 ?auto_11466 ) ) ( not ( = ?auto_11474 ?auto_11466 ) ) ( AVAILABLE ?auto_11480 ) ( AVAILABLE ?auto_11481 ) ( SURFACE-AT ?auto_11467 ?auto_11472 ) ( ON ?auto_11467 ?auto_11477 ) ( CLEAR ?auto_11467 ) ( not ( = ?auto_11469 ?auto_11477 ) ) ( not ( = ?auto_11470 ?auto_11477 ) ) ( not ( = ?auto_11468 ?auto_11477 ) ) ( not ( = ?auto_11473 ?auto_11477 ) ) ( not ( = ?auto_11471 ?auto_11477 ) ) ( not ( = ?auto_11467 ?auto_11477 ) ) ( not ( = ?auto_11474 ?auto_11477 ) ) ( not ( = ?auto_11466 ?auto_11477 ) ) ( TRUCK-AT ?auto_11476 ?auto_11478 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11468 ?auto_11469 ?auto_11470 )
      ( MAKE-4CRATE-VERIFY ?auto_11466 ?auto_11467 ?auto_11468 ?auto_11469 ?auto_11470 ) )
  )

)

