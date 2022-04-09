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
      ?auto_9497 - SURFACE
      ?auto_9498 - SURFACE
    )
    :vars
    (
      ?auto_9499 - HOIST
      ?auto_9500 - PLACE
      ?auto_9502 - PLACE
      ?auto_9503 - HOIST
      ?auto_9504 - SURFACE
      ?auto_9501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9499 ?auto_9500 ) ( SURFACE-AT ?auto_9497 ?auto_9500 ) ( CLEAR ?auto_9497 ) ( IS-CRATE ?auto_9498 ) ( AVAILABLE ?auto_9499 ) ( not ( = ?auto_9502 ?auto_9500 ) ) ( HOIST-AT ?auto_9503 ?auto_9502 ) ( AVAILABLE ?auto_9503 ) ( SURFACE-AT ?auto_9498 ?auto_9502 ) ( ON ?auto_9498 ?auto_9504 ) ( CLEAR ?auto_9498 ) ( TRUCK-AT ?auto_9501 ?auto_9500 ) ( not ( = ?auto_9497 ?auto_9498 ) ) ( not ( = ?auto_9497 ?auto_9504 ) ) ( not ( = ?auto_9498 ?auto_9504 ) ) ( not ( = ?auto_9499 ?auto_9503 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9501 ?auto_9500 ?auto_9502 )
      ( !LIFT ?auto_9503 ?auto_9498 ?auto_9504 ?auto_9502 )
      ( !LOAD ?auto_9503 ?auto_9498 ?auto_9501 ?auto_9502 )
      ( !DRIVE ?auto_9501 ?auto_9502 ?auto_9500 )
      ( !UNLOAD ?auto_9499 ?auto_9498 ?auto_9501 ?auto_9500 )
      ( !DROP ?auto_9499 ?auto_9498 ?auto_9497 ?auto_9500 )
      ( MAKE-1CRATE-VERIFY ?auto_9497 ?auto_9498 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9518 - SURFACE
      ?auto_9519 - SURFACE
      ?auto_9520 - SURFACE
    )
    :vars
    (
      ?auto_9521 - HOIST
      ?auto_9523 - PLACE
      ?auto_9526 - PLACE
      ?auto_9522 - HOIST
      ?auto_9524 - SURFACE
      ?auto_9529 - PLACE
      ?auto_9527 - HOIST
      ?auto_9528 - SURFACE
      ?auto_9525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9521 ?auto_9523 ) ( IS-CRATE ?auto_9520 ) ( not ( = ?auto_9526 ?auto_9523 ) ) ( HOIST-AT ?auto_9522 ?auto_9526 ) ( AVAILABLE ?auto_9522 ) ( SURFACE-AT ?auto_9520 ?auto_9526 ) ( ON ?auto_9520 ?auto_9524 ) ( CLEAR ?auto_9520 ) ( not ( = ?auto_9519 ?auto_9520 ) ) ( not ( = ?auto_9519 ?auto_9524 ) ) ( not ( = ?auto_9520 ?auto_9524 ) ) ( not ( = ?auto_9521 ?auto_9522 ) ) ( SURFACE-AT ?auto_9518 ?auto_9523 ) ( CLEAR ?auto_9518 ) ( IS-CRATE ?auto_9519 ) ( AVAILABLE ?auto_9521 ) ( not ( = ?auto_9529 ?auto_9523 ) ) ( HOIST-AT ?auto_9527 ?auto_9529 ) ( AVAILABLE ?auto_9527 ) ( SURFACE-AT ?auto_9519 ?auto_9529 ) ( ON ?auto_9519 ?auto_9528 ) ( CLEAR ?auto_9519 ) ( TRUCK-AT ?auto_9525 ?auto_9523 ) ( not ( = ?auto_9518 ?auto_9519 ) ) ( not ( = ?auto_9518 ?auto_9528 ) ) ( not ( = ?auto_9519 ?auto_9528 ) ) ( not ( = ?auto_9521 ?auto_9527 ) ) ( not ( = ?auto_9518 ?auto_9520 ) ) ( not ( = ?auto_9518 ?auto_9524 ) ) ( not ( = ?auto_9520 ?auto_9528 ) ) ( not ( = ?auto_9526 ?auto_9529 ) ) ( not ( = ?auto_9522 ?auto_9527 ) ) ( not ( = ?auto_9524 ?auto_9528 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9518 ?auto_9519 )
      ( MAKE-1CRATE ?auto_9519 ?auto_9520 )
      ( MAKE-2CRATE-VERIFY ?auto_9518 ?auto_9519 ?auto_9520 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9544 - SURFACE
      ?auto_9545 - SURFACE
      ?auto_9546 - SURFACE
      ?auto_9547 - SURFACE
    )
    :vars
    (
      ?auto_9548 - HOIST
      ?auto_9550 - PLACE
      ?auto_9553 - PLACE
      ?auto_9551 - HOIST
      ?auto_9549 - SURFACE
      ?auto_9554 - PLACE
      ?auto_9556 - HOIST
      ?auto_9555 - SURFACE
      ?auto_9558 - PLACE
      ?auto_9557 - HOIST
      ?auto_9559 - SURFACE
      ?auto_9552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9548 ?auto_9550 ) ( IS-CRATE ?auto_9547 ) ( not ( = ?auto_9553 ?auto_9550 ) ) ( HOIST-AT ?auto_9551 ?auto_9553 ) ( AVAILABLE ?auto_9551 ) ( SURFACE-AT ?auto_9547 ?auto_9553 ) ( ON ?auto_9547 ?auto_9549 ) ( CLEAR ?auto_9547 ) ( not ( = ?auto_9546 ?auto_9547 ) ) ( not ( = ?auto_9546 ?auto_9549 ) ) ( not ( = ?auto_9547 ?auto_9549 ) ) ( not ( = ?auto_9548 ?auto_9551 ) ) ( IS-CRATE ?auto_9546 ) ( not ( = ?auto_9554 ?auto_9550 ) ) ( HOIST-AT ?auto_9556 ?auto_9554 ) ( AVAILABLE ?auto_9556 ) ( SURFACE-AT ?auto_9546 ?auto_9554 ) ( ON ?auto_9546 ?auto_9555 ) ( CLEAR ?auto_9546 ) ( not ( = ?auto_9545 ?auto_9546 ) ) ( not ( = ?auto_9545 ?auto_9555 ) ) ( not ( = ?auto_9546 ?auto_9555 ) ) ( not ( = ?auto_9548 ?auto_9556 ) ) ( SURFACE-AT ?auto_9544 ?auto_9550 ) ( CLEAR ?auto_9544 ) ( IS-CRATE ?auto_9545 ) ( AVAILABLE ?auto_9548 ) ( not ( = ?auto_9558 ?auto_9550 ) ) ( HOIST-AT ?auto_9557 ?auto_9558 ) ( AVAILABLE ?auto_9557 ) ( SURFACE-AT ?auto_9545 ?auto_9558 ) ( ON ?auto_9545 ?auto_9559 ) ( CLEAR ?auto_9545 ) ( TRUCK-AT ?auto_9552 ?auto_9550 ) ( not ( = ?auto_9544 ?auto_9545 ) ) ( not ( = ?auto_9544 ?auto_9559 ) ) ( not ( = ?auto_9545 ?auto_9559 ) ) ( not ( = ?auto_9548 ?auto_9557 ) ) ( not ( = ?auto_9544 ?auto_9546 ) ) ( not ( = ?auto_9544 ?auto_9555 ) ) ( not ( = ?auto_9546 ?auto_9559 ) ) ( not ( = ?auto_9554 ?auto_9558 ) ) ( not ( = ?auto_9556 ?auto_9557 ) ) ( not ( = ?auto_9555 ?auto_9559 ) ) ( not ( = ?auto_9544 ?auto_9547 ) ) ( not ( = ?auto_9544 ?auto_9549 ) ) ( not ( = ?auto_9545 ?auto_9547 ) ) ( not ( = ?auto_9545 ?auto_9549 ) ) ( not ( = ?auto_9547 ?auto_9555 ) ) ( not ( = ?auto_9547 ?auto_9559 ) ) ( not ( = ?auto_9553 ?auto_9554 ) ) ( not ( = ?auto_9553 ?auto_9558 ) ) ( not ( = ?auto_9551 ?auto_9556 ) ) ( not ( = ?auto_9551 ?auto_9557 ) ) ( not ( = ?auto_9549 ?auto_9555 ) ) ( not ( = ?auto_9549 ?auto_9559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9544 ?auto_9545 ?auto_9546 )
      ( MAKE-1CRATE ?auto_9546 ?auto_9547 )
      ( MAKE-3CRATE-VERIFY ?auto_9544 ?auto_9545 ?auto_9546 ?auto_9547 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9575 - SURFACE
      ?auto_9576 - SURFACE
      ?auto_9577 - SURFACE
      ?auto_9578 - SURFACE
      ?auto_9579 - SURFACE
    )
    :vars
    (
      ?auto_9583 - HOIST
      ?auto_9582 - PLACE
      ?auto_9585 - PLACE
      ?auto_9581 - HOIST
      ?auto_9584 - SURFACE
      ?auto_9593 - PLACE
      ?auto_9587 - HOIST
      ?auto_9592 - SURFACE
      ?auto_9586 - PLACE
      ?auto_9589 - HOIST
      ?auto_9590 - SURFACE
      ?auto_9594 - PLACE
      ?auto_9588 - HOIST
      ?auto_9591 - SURFACE
      ?auto_9580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9583 ?auto_9582 ) ( IS-CRATE ?auto_9579 ) ( not ( = ?auto_9585 ?auto_9582 ) ) ( HOIST-AT ?auto_9581 ?auto_9585 ) ( AVAILABLE ?auto_9581 ) ( SURFACE-AT ?auto_9579 ?auto_9585 ) ( ON ?auto_9579 ?auto_9584 ) ( CLEAR ?auto_9579 ) ( not ( = ?auto_9578 ?auto_9579 ) ) ( not ( = ?auto_9578 ?auto_9584 ) ) ( not ( = ?auto_9579 ?auto_9584 ) ) ( not ( = ?auto_9583 ?auto_9581 ) ) ( IS-CRATE ?auto_9578 ) ( not ( = ?auto_9593 ?auto_9582 ) ) ( HOIST-AT ?auto_9587 ?auto_9593 ) ( AVAILABLE ?auto_9587 ) ( SURFACE-AT ?auto_9578 ?auto_9593 ) ( ON ?auto_9578 ?auto_9592 ) ( CLEAR ?auto_9578 ) ( not ( = ?auto_9577 ?auto_9578 ) ) ( not ( = ?auto_9577 ?auto_9592 ) ) ( not ( = ?auto_9578 ?auto_9592 ) ) ( not ( = ?auto_9583 ?auto_9587 ) ) ( IS-CRATE ?auto_9577 ) ( not ( = ?auto_9586 ?auto_9582 ) ) ( HOIST-AT ?auto_9589 ?auto_9586 ) ( AVAILABLE ?auto_9589 ) ( SURFACE-AT ?auto_9577 ?auto_9586 ) ( ON ?auto_9577 ?auto_9590 ) ( CLEAR ?auto_9577 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9576 ?auto_9590 ) ) ( not ( = ?auto_9577 ?auto_9590 ) ) ( not ( = ?auto_9583 ?auto_9589 ) ) ( SURFACE-AT ?auto_9575 ?auto_9582 ) ( CLEAR ?auto_9575 ) ( IS-CRATE ?auto_9576 ) ( AVAILABLE ?auto_9583 ) ( not ( = ?auto_9594 ?auto_9582 ) ) ( HOIST-AT ?auto_9588 ?auto_9594 ) ( AVAILABLE ?auto_9588 ) ( SURFACE-AT ?auto_9576 ?auto_9594 ) ( ON ?auto_9576 ?auto_9591 ) ( CLEAR ?auto_9576 ) ( TRUCK-AT ?auto_9580 ?auto_9582 ) ( not ( = ?auto_9575 ?auto_9576 ) ) ( not ( = ?auto_9575 ?auto_9591 ) ) ( not ( = ?auto_9576 ?auto_9591 ) ) ( not ( = ?auto_9583 ?auto_9588 ) ) ( not ( = ?auto_9575 ?auto_9577 ) ) ( not ( = ?auto_9575 ?auto_9590 ) ) ( not ( = ?auto_9577 ?auto_9591 ) ) ( not ( = ?auto_9586 ?auto_9594 ) ) ( not ( = ?auto_9589 ?auto_9588 ) ) ( not ( = ?auto_9590 ?auto_9591 ) ) ( not ( = ?auto_9575 ?auto_9578 ) ) ( not ( = ?auto_9575 ?auto_9592 ) ) ( not ( = ?auto_9576 ?auto_9578 ) ) ( not ( = ?auto_9576 ?auto_9592 ) ) ( not ( = ?auto_9578 ?auto_9590 ) ) ( not ( = ?auto_9578 ?auto_9591 ) ) ( not ( = ?auto_9593 ?auto_9586 ) ) ( not ( = ?auto_9593 ?auto_9594 ) ) ( not ( = ?auto_9587 ?auto_9589 ) ) ( not ( = ?auto_9587 ?auto_9588 ) ) ( not ( = ?auto_9592 ?auto_9590 ) ) ( not ( = ?auto_9592 ?auto_9591 ) ) ( not ( = ?auto_9575 ?auto_9579 ) ) ( not ( = ?auto_9575 ?auto_9584 ) ) ( not ( = ?auto_9576 ?auto_9579 ) ) ( not ( = ?auto_9576 ?auto_9584 ) ) ( not ( = ?auto_9577 ?auto_9579 ) ) ( not ( = ?auto_9577 ?auto_9584 ) ) ( not ( = ?auto_9579 ?auto_9592 ) ) ( not ( = ?auto_9579 ?auto_9590 ) ) ( not ( = ?auto_9579 ?auto_9591 ) ) ( not ( = ?auto_9585 ?auto_9593 ) ) ( not ( = ?auto_9585 ?auto_9586 ) ) ( not ( = ?auto_9585 ?auto_9594 ) ) ( not ( = ?auto_9581 ?auto_9587 ) ) ( not ( = ?auto_9581 ?auto_9589 ) ) ( not ( = ?auto_9581 ?auto_9588 ) ) ( not ( = ?auto_9584 ?auto_9592 ) ) ( not ( = ?auto_9584 ?auto_9590 ) ) ( not ( = ?auto_9584 ?auto_9591 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9575 ?auto_9576 ?auto_9577 ?auto_9578 )
      ( MAKE-1CRATE ?auto_9578 ?auto_9579 )
      ( MAKE-4CRATE-VERIFY ?auto_9575 ?auto_9576 ?auto_9577 ?auto_9578 ?auto_9579 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_9611 - SURFACE
      ?auto_9612 - SURFACE
      ?auto_9613 - SURFACE
      ?auto_9614 - SURFACE
      ?auto_9615 - SURFACE
      ?auto_9616 - SURFACE
    )
    :vars
    (
      ?auto_9618 - HOIST
      ?auto_9619 - PLACE
      ?auto_9622 - PLACE
      ?auto_9617 - HOIST
      ?auto_9620 - SURFACE
      ?auto_9624 - PLACE
      ?auto_9632 - HOIST
      ?auto_9623 - SURFACE
      ?auto_9631 - PLACE
      ?auto_9630 - HOIST
      ?auto_9634 - SURFACE
      ?auto_9627 - PLACE
      ?auto_9625 - HOIST
      ?auto_9626 - SURFACE
      ?auto_9628 - PLACE
      ?auto_9629 - HOIST
      ?auto_9633 - SURFACE
      ?auto_9621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9618 ?auto_9619 ) ( IS-CRATE ?auto_9616 ) ( not ( = ?auto_9622 ?auto_9619 ) ) ( HOIST-AT ?auto_9617 ?auto_9622 ) ( AVAILABLE ?auto_9617 ) ( SURFACE-AT ?auto_9616 ?auto_9622 ) ( ON ?auto_9616 ?auto_9620 ) ( CLEAR ?auto_9616 ) ( not ( = ?auto_9615 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9620 ) ) ( not ( = ?auto_9616 ?auto_9620 ) ) ( not ( = ?auto_9618 ?auto_9617 ) ) ( IS-CRATE ?auto_9615 ) ( not ( = ?auto_9624 ?auto_9619 ) ) ( HOIST-AT ?auto_9632 ?auto_9624 ) ( AVAILABLE ?auto_9632 ) ( SURFACE-AT ?auto_9615 ?auto_9624 ) ( ON ?auto_9615 ?auto_9623 ) ( CLEAR ?auto_9615 ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9623 ) ) ( not ( = ?auto_9615 ?auto_9623 ) ) ( not ( = ?auto_9618 ?auto_9632 ) ) ( IS-CRATE ?auto_9614 ) ( not ( = ?auto_9631 ?auto_9619 ) ) ( HOIST-AT ?auto_9630 ?auto_9631 ) ( AVAILABLE ?auto_9630 ) ( SURFACE-AT ?auto_9614 ?auto_9631 ) ( ON ?auto_9614 ?auto_9634 ) ( CLEAR ?auto_9614 ) ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9613 ?auto_9634 ) ) ( not ( = ?auto_9614 ?auto_9634 ) ) ( not ( = ?auto_9618 ?auto_9630 ) ) ( IS-CRATE ?auto_9613 ) ( not ( = ?auto_9627 ?auto_9619 ) ) ( HOIST-AT ?auto_9625 ?auto_9627 ) ( AVAILABLE ?auto_9625 ) ( SURFACE-AT ?auto_9613 ?auto_9627 ) ( ON ?auto_9613 ?auto_9626 ) ( CLEAR ?auto_9613 ) ( not ( = ?auto_9612 ?auto_9613 ) ) ( not ( = ?auto_9612 ?auto_9626 ) ) ( not ( = ?auto_9613 ?auto_9626 ) ) ( not ( = ?auto_9618 ?auto_9625 ) ) ( SURFACE-AT ?auto_9611 ?auto_9619 ) ( CLEAR ?auto_9611 ) ( IS-CRATE ?auto_9612 ) ( AVAILABLE ?auto_9618 ) ( not ( = ?auto_9628 ?auto_9619 ) ) ( HOIST-AT ?auto_9629 ?auto_9628 ) ( AVAILABLE ?auto_9629 ) ( SURFACE-AT ?auto_9612 ?auto_9628 ) ( ON ?auto_9612 ?auto_9633 ) ( CLEAR ?auto_9612 ) ( TRUCK-AT ?auto_9621 ?auto_9619 ) ( not ( = ?auto_9611 ?auto_9612 ) ) ( not ( = ?auto_9611 ?auto_9633 ) ) ( not ( = ?auto_9612 ?auto_9633 ) ) ( not ( = ?auto_9618 ?auto_9629 ) ) ( not ( = ?auto_9611 ?auto_9613 ) ) ( not ( = ?auto_9611 ?auto_9626 ) ) ( not ( = ?auto_9613 ?auto_9633 ) ) ( not ( = ?auto_9627 ?auto_9628 ) ) ( not ( = ?auto_9625 ?auto_9629 ) ) ( not ( = ?auto_9626 ?auto_9633 ) ) ( not ( = ?auto_9611 ?auto_9614 ) ) ( not ( = ?auto_9611 ?auto_9634 ) ) ( not ( = ?auto_9612 ?auto_9614 ) ) ( not ( = ?auto_9612 ?auto_9634 ) ) ( not ( = ?auto_9614 ?auto_9626 ) ) ( not ( = ?auto_9614 ?auto_9633 ) ) ( not ( = ?auto_9631 ?auto_9627 ) ) ( not ( = ?auto_9631 ?auto_9628 ) ) ( not ( = ?auto_9630 ?auto_9625 ) ) ( not ( = ?auto_9630 ?auto_9629 ) ) ( not ( = ?auto_9634 ?auto_9626 ) ) ( not ( = ?auto_9634 ?auto_9633 ) ) ( not ( = ?auto_9611 ?auto_9615 ) ) ( not ( = ?auto_9611 ?auto_9623 ) ) ( not ( = ?auto_9612 ?auto_9615 ) ) ( not ( = ?auto_9612 ?auto_9623 ) ) ( not ( = ?auto_9613 ?auto_9615 ) ) ( not ( = ?auto_9613 ?auto_9623 ) ) ( not ( = ?auto_9615 ?auto_9634 ) ) ( not ( = ?auto_9615 ?auto_9626 ) ) ( not ( = ?auto_9615 ?auto_9633 ) ) ( not ( = ?auto_9624 ?auto_9631 ) ) ( not ( = ?auto_9624 ?auto_9627 ) ) ( not ( = ?auto_9624 ?auto_9628 ) ) ( not ( = ?auto_9632 ?auto_9630 ) ) ( not ( = ?auto_9632 ?auto_9625 ) ) ( not ( = ?auto_9632 ?auto_9629 ) ) ( not ( = ?auto_9623 ?auto_9634 ) ) ( not ( = ?auto_9623 ?auto_9626 ) ) ( not ( = ?auto_9623 ?auto_9633 ) ) ( not ( = ?auto_9611 ?auto_9616 ) ) ( not ( = ?auto_9611 ?auto_9620 ) ) ( not ( = ?auto_9612 ?auto_9616 ) ) ( not ( = ?auto_9612 ?auto_9620 ) ) ( not ( = ?auto_9613 ?auto_9616 ) ) ( not ( = ?auto_9613 ?auto_9620 ) ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9620 ) ) ( not ( = ?auto_9616 ?auto_9623 ) ) ( not ( = ?auto_9616 ?auto_9634 ) ) ( not ( = ?auto_9616 ?auto_9626 ) ) ( not ( = ?auto_9616 ?auto_9633 ) ) ( not ( = ?auto_9622 ?auto_9624 ) ) ( not ( = ?auto_9622 ?auto_9631 ) ) ( not ( = ?auto_9622 ?auto_9627 ) ) ( not ( = ?auto_9622 ?auto_9628 ) ) ( not ( = ?auto_9617 ?auto_9632 ) ) ( not ( = ?auto_9617 ?auto_9630 ) ) ( not ( = ?auto_9617 ?auto_9625 ) ) ( not ( = ?auto_9617 ?auto_9629 ) ) ( not ( = ?auto_9620 ?auto_9623 ) ) ( not ( = ?auto_9620 ?auto_9634 ) ) ( not ( = ?auto_9620 ?auto_9626 ) ) ( not ( = ?auto_9620 ?auto_9633 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 )
      ( MAKE-1CRATE ?auto_9615 ?auto_9616 )
      ( MAKE-5CRATE-VERIFY ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 ?auto_9616 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9652 - SURFACE
      ?auto_9653 - SURFACE
      ?auto_9654 - SURFACE
      ?auto_9655 - SURFACE
      ?auto_9656 - SURFACE
      ?auto_9657 - SURFACE
      ?auto_9658 - SURFACE
    )
    :vars
    (
      ?auto_9663 - HOIST
      ?auto_9662 - PLACE
      ?auto_9664 - PLACE
      ?auto_9660 - HOIST
      ?auto_9659 - SURFACE
      ?auto_9671 - PLACE
      ?auto_9667 - HOIST
      ?auto_9666 - SURFACE
      ?auto_9676 - PLACE
      ?auto_9679 - HOIST
      ?auto_9677 - SURFACE
      ?auto_9672 - PLACE
      ?auto_9665 - HOIST
      ?auto_9673 - SURFACE
      ?auto_9669 - PLACE
      ?auto_9675 - HOIST
      ?auto_9678 - SURFACE
      ?auto_9670 - PLACE
      ?auto_9668 - HOIST
      ?auto_9674 - SURFACE
      ?auto_9661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9663 ?auto_9662 ) ( IS-CRATE ?auto_9658 ) ( not ( = ?auto_9664 ?auto_9662 ) ) ( HOIST-AT ?auto_9660 ?auto_9664 ) ( AVAILABLE ?auto_9660 ) ( SURFACE-AT ?auto_9658 ?auto_9664 ) ( ON ?auto_9658 ?auto_9659 ) ( CLEAR ?auto_9658 ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( not ( = ?auto_9663 ?auto_9660 ) ) ( IS-CRATE ?auto_9657 ) ( not ( = ?auto_9671 ?auto_9662 ) ) ( HOIST-AT ?auto_9667 ?auto_9671 ) ( AVAILABLE ?auto_9667 ) ( SURFACE-AT ?auto_9657 ?auto_9671 ) ( ON ?auto_9657 ?auto_9666 ) ( CLEAR ?auto_9657 ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9666 ) ) ( not ( = ?auto_9657 ?auto_9666 ) ) ( not ( = ?auto_9663 ?auto_9667 ) ) ( IS-CRATE ?auto_9656 ) ( not ( = ?auto_9676 ?auto_9662 ) ) ( HOIST-AT ?auto_9679 ?auto_9676 ) ( AVAILABLE ?auto_9679 ) ( SURFACE-AT ?auto_9656 ?auto_9676 ) ( ON ?auto_9656 ?auto_9677 ) ( CLEAR ?auto_9656 ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9677 ) ) ( not ( = ?auto_9656 ?auto_9677 ) ) ( not ( = ?auto_9663 ?auto_9679 ) ) ( IS-CRATE ?auto_9655 ) ( not ( = ?auto_9672 ?auto_9662 ) ) ( HOIST-AT ?auto_9665 ?auto_9672 ) ( AVAILABLE ?auto_9665 ) ( SURFACE-AT ?auto_9655 ?auto_9672 ) ( ON ?auto_9655 ?auto_9673 ) ( CLEAR ?auto_9655 ) ( not ( = ?auto_9654 ?auto_9655 ) ) ( not ( = ?auto_9654 ?auto_9673 ) ) ( not ( = ?auto_9655 ?auto_9673 ) ) ( not ( = ?auto_9663 ?auto_9665 ) ) ( IS-CRATE ?auto_9654 ) ( not ( = ?auto_9669 ?auto_9662 ) ) ( HOIST-AT ?auto_9675 ?auto_9669 ) ( AVAILABLE ?auto_9675 ) ( SURFACE-AT ?auto_9654 ?auto_9669 ) ( ON ?auto_9654 ?auto_9678 ) ( CLEAR ?auto_9654 ) ( not ( = ?auto_9653 ?auto_9654 ) ) ( not ( = ?auto_9653 ?auto_9678 ) ) ( not ( = ?auto_9654 ?auto_9678 ) ) ( not ( = ?auto_9663 ?auto_9675 ) ) ( SURFACE-AT ?auto_9652 ?auto_9662 ) ( CLEAR ?auto_9652 ) ( IS-CRATE ?auto_9653 ) ( AVAILABLE ?auto_9663 ) ( not ( = ?auto_9670 ?auto_9662 ) ) ( HOIST-AT ?auto_9668 ?auto_9670 ) ( AVAILABLE ?auto_9668 ) ( SURFACE-AT ?auto_9653 ?auto_9670 ) ( ON ?auto_9653 ?auto_9674 ) ( CLEAR ?auto_9653 ) ( TRUCK-AT ?auto_9661 ?auto_9662 ) ( not ( = ?auto_9652 ?auto_9653 ) ) ( not ( = ?auto_9652 ?auto_9674 ) ) ( not ( = ?auto_9653 ?auto_9674 ) ) ( not ( = ?auto_9663 ?auto_9668 ) ) ( not ( = ?auto_9652 ?auto_9654 ) ) ( not ( = ?auto_9652 ?auto_9678 ) ) ( not ( = ?auto_9654 ?auto_9674 ) ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( not ( = ?auto_9675 ?auto_9668 ) ) ( not ( = ?auto_9678 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9655 ) ) ( not ( = ?auto_9652 ?auto_9673 ) ) ( not ( = ?auto_9653 ?auto_9655 ) ) ( not ( = ?auto_9653 ?auto_9673 ) ) ( not ( = ?auto_9655 ?auto_9678 ) ) ( not ( = ?auto_9655 ?auto_9674 ) ) ( not ( = ?auto_9672 ?auto_9669 ) ) ( not ( = ?auto_9672 ?auto_9670 ) ) ( not ( = ?auto_9665 ?auto_9675 ) ) ( not ( = ?auto_9665 ?auto_9668 ) ) ( not ( = ?auto_9673 ?auto_9678 ) ) ( not ( = ?auto_9673 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9656 ) ) ( not ( = ?auto_9652 ?auto_9677 ) ) ( not ( = ?auto_9653 ?auto_9656 ) ) ( not ( = ?auto_9653 ?auto_9677 ) ) ( not ( = ?auto_9654 ?auto_9656 ) ) ( not ( = ?auto_9654 ?auto_9677 ) ) ( not ( = ?auto_9656 ?auto_9673 ) ) ( not ( = ?auto_9656 ?auto_9678 ) ) ( not ( = ?auto_9656 ?auto_9674 ) ) ( not ( = ?auto_9676 ?auto_9672 ) ) ( not ( = ?auto_9676 ?auto_9669 ) ) ( not ( = ?auto_9676 ?auto_9670 ) ) ( not ( = ?auto_9679 ?auto_9665 ) ) ( not ( = ?auto_9679 ?auto_9675 ) ) ( not ( = ?auto_9679 ?auto_9668 ) ) ( not ( = ?auto_9677 ?auto_9673 ) ) ( not ( = ?auto_9677 ?auto_9678 ) ) ( not ( = ?auto_9677 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9657 ) ) ( not ( = ?auto_9652 ?auto_9666 ) ) ( not ( = ?auto_9653 ?auto_9657 ) ) ( not ( = ?auto_9653 ?auto_9666 ) ) ( not ( = ?auto_9654 ?auto_9657 ) ) ( not ( = ?auto_9654 ?auto_9666 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9666 ) ) ( not ( = ?auto_9657 ?auto_9677 ) ) ( not ( = ?auto_9657 ?auto_9673 ) ) ( not ( = ?auto_9657 ?auto_9678 ) ) ( not ( = ?auto_9657 ?auto_9674 ) ) ( not ( = ?auto_9671 ?auto_9676 ) ) ( not ( = ?auto_9671 ?auto_9672 ) ) ( not ( = ?auto_9671 ?auto_9669 ) ) ( not ( = ?auto_9671 ?auto_9670 ) ) ( not ( = ?auto_9667 ?auto_9679 ) ) ( not ( = ?auto_9667 ?auto_9665 ) ) ( not ( = ?auto_9667 ?auto_9675 ) ) ( not ( = ?auto_9667 ?auto_9668 ) ) ( not ( = ?auto_9666 ?auto_9677 ) ) ( not ( = ?auto_9666 ?auto_9673 ) ) ( not ( = ?auto_9666 ?auto_9678 ) ) ( not ( = ?auto_9666 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9658 ) ) ( not ( = ?auto_9652 ?auto_9659 ) ) ( not ( = ?auto_9653 ?auto_9658 ) ) ( not ( = ?auto_9653 ?auto_9659 ) ) ( not ( = ?auto_9654 ?auto_9658 ) ) ( not ( = ?auto_9654 ?auto_9659 ) ) ( not ( = ?auto_9655 ?auto_9658 ) ) ( not ( = ?auto_9655 ?auto_9659 ) ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( not ( = ?auto_9656 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9666 ) ) ( not ( = ?auto_9658 ?auto_9677 ) ) ( not ( = ?auto_9658 ?auto_9673 ) ) ( not ( = ?auto_9658 ?auto_9678 ) ) ( not ( = ?auto_9658 ?auto_9674 ) ) ( not ( = ?auto_9664 ?auto_9671 ) ) ( not ( = ?auto_9664 ?auto_9676 ) ) ( not ( = ?auto_9664 ?auto_9672 ) ) ( not ( = ?auto_9664 ?auto_9669 ) ) ( not ( = ?auto_9664 ?auto_9670 ) ) ( not ( = ?auto_9660 ?auto_9667 ) ) ( not ( = ?auto_9660 ?auto_9679 ) ) ( not ( = ?auto_9660 ?auto_9665 ) ) ( not ( = ?auto_9660 ?auto_9675 ) ) ( not ( = ?auto_9660 ?auto_9668 ) ) ( not ( = ?auto_9659 ?auto_9666 ) ) ( not ( = ?auto_9659 ?auto_9677 ) ) ( not ( = ?auto_9659 ?auto_9673 ) ) ( not ( = ?auto_9659 ?auto_9678 ) ) ( not ( = ?auto_9659 ?auto_9674 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9652 ?auto_9653 ?auto_9654 ?auto_9655 ?auto_9656 ?auto_9657 )
      ( MAKE-1CRATE ?auto_9657 ?auto_9658 )
      ( MAKE-6CRATE-VERIFY ?auto_9652 ?auto_9653 ?auto_9654 ?auto_9655 ?auto_9656 ?auto_9657 ?auto_9658 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9698 - SURFACE
      ?auto_9699 - SURFACE
      ?auto_9700 - SURFACE
      ?auto_9701 - SURFACE
      ?auto_9702 - SURFACE
      ?auto_9703 - SURFACE
      ?auto_9704 - SURFACE
      ?auto_9705 - SURFACE
    )
    :vars
    (
      ?auto_9709 - HOIST
      ?auto_9711 - PLACE
      ?auto_9707 - PLACE
      ?auto_9708 - HOIST
      ?auto_9706 - SURFACE
      ?auto_9723 - PLACE
      ?auto_9725 - HOIST
      ?auto_9727 - SURFACE
      ?auto_9718 - PLACE
      ?auto_9714 - HOIST
      ?auto_9712 - SURFACE
      ?auto_9719 - PLACE
      ?auto_9715 - HOIST
      ?auto_9716 - SURFACE
      ?auto_9720 - SURFACE
      ?auto_9726 - PLACE
      ?auto_9721 - HOIST
      ?auto_9722 - SURFACE
      ?auto_9724 - PLACE
      ?auto_9717 - HOIST
      ?auto_9713 - SURFACE
      ?auto_9710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9709 ?auto_9711 ) ( IS-CRATE ?auto_9705 ) ( not ( = ?auto_9707 ?auto_9711 ) ) ( HOIST-AT ?auto_9708 ?auto_9707 ) ( SURFACE-AT ?auto_9705 ?auto_9707 ) ( ON ?auto_9705 ?auto_9706 ) ( CLEAR ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( not ( = ?auto_9709 ?auto_9708 ) ) ( IS-CRATE ?auto_9704 ) ( not ( = ?auto_9723 ?auto_9711 ) ) ( HOIST-AT ?auto_9725 ?auto_9723 ) ( AVAILABLE ?auto_9725 ) ( SURFACE-AT ?auto_9704 ?auto_9723 ) ( ON ?auto_9704 ?auto_9727 ) ( CLEAR ?auto_9704 ) ( not ( = ?auto_9703 ?auto_9704 ) ) ( not ( = ?auto_9703 ?auto_9727 ) ) ( not ( = ?auto_9704 ?auto_9727 ) ) ( not ( = ?auto_9709 ?auto_9725 ) ) ( IS-CRATE ?auto_9703 ) ( not ( = ?auto_9718 ?auto_9711 ) ) ( HOIST-AT ?auto_9714 ?auto_9718 ) ( AVAILABLE ?auto_9714 ) ( SURFACE-AT ?auto_9703 ?auto_9718 ) ( ON ?auto_9703 ?auto_9712 ) ( CLEAR ?auto_9703 ) ( not ( = ?auto_9702 ?auto_9703 ) ) ( not ( = ?auto_9702 ?auto_9712 ) ) ( not ( = ?auto_9703 ?auto_9712 ) ) ( not ( = ?auto_9709 ?auto_9714 ) ) ( IS-CRATE ?auto_9702 ) ( not ( = ?auto_9719 ?auto_9711 ) ) ( HOIST-AT ?auto_9715 ?auto_9719 ) ( AVAILABLE ?auto_9715 ) ( SURFACE-AT ?auto_9702 ?auto_9719 ) ( ON ?auto_9702 ?auto_9716 ) ( CLEAR ?auto_9702 ) ( not ( = ?auto_9701 ?auto_9702 ) ) ( not ( = ?auto_9701 ?auto_9716 ) ) ( not ( = ?auto_9702 ?auto_9716 ) ) ( not ( = ?auto_9709 ?auto_9715 ) ) ( IS-CRATE ?auto_9701 ) ( AVAILABLE ?auto_9708 ) ( SURFACE-AT ?auto_9701 ?auto_9707 ) ( ON ?auto_9701 ?auto_9720 ) ( CLEAR ?auto_9701 ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( not ( = ?auto_9700 ?auto_9720 ) ) ( not ( = ?auto_9701 ?auto_9720 ) ) ( IS-CRATE ?auto_9700 ) ( not ( = ?auto_9726 ?auto_9711 ) ) ( HOIST-AT ?auto_9721 ?auto_9726 ) ( AVAILABLE ?auto_9721 ) ( SURFACE-AT ?auto_9700 ?auto_9726 ) ( ON ?auto_9700 ?auto_9722 ) ( CLEAR ?auto_9700 ) ( not ( = ?auto_9699 ?auto_9700 ) ) ( not ( = ?auto_9699 ?auto_9722 ) ) ( not ( = ?auto_9700 ?auto_9722 ) ) ( not ( = ?auto_9709 ?auto_9721 ) ) ( SURFACE-AT ?auto_9698 ?auto_9711 ) ( CLEAR ?auto_9698 ) ( IS-CRATE ?auto_9699 ) ( AVAILABLE ?auto_9709 ) ( not ( = ?auto_9724 ?auto_9711 ) ) ( HOIST-AT ?auto_9717 ?auto_9724 ) ( AVAILABLE ?auto_9717 ) ( SURFACE-AT ?auto_9699 ?auto_9724 ) ( ON ?auto_9699 ?auto_9713 ) ( CLEAR ?auto_9699 ) ( TRUCK-AT ?auto_9710 ?auto_9711 ) ( not ( = ?auto_9698 ?auto_9699 ) ) ( not ( = ?auto_9698 ?auto_9713 ) ) ( not ( = ?auto_9699 ?auto_9713 ) ) ( not ( = ?auto_9709 ?auto_9717 ) ) ( not ( = ?auto_9698 ?auto_9700 ) ) ( not ( = ?auto_9698 ?auto_9722 ) ) ( not ( = ?auto_9700 ?auto_9713 ) ) ( not ( = ?auto_9726 ?auto_9724 ) ) ( not ( = ?auto_9721 ?auto_9717 ) ) ( not ( = ?auto_9722 ?auto_9713 ) ) ( not ( = ?auto_9698 ?auto_9701 ) ) ( not ( = ?auto_9698 ?auto_9720 ) ) ( not ( = ?auto_9699 ?auto_9701 ) ) ( not ( = ?auto_9699 ?auto_9720 ) ) ( not ( = ?auto_9701 ?auto_9722 ) ) ( not ( = ?auto_9701 ?auto_9713 ) ) ( not ( = ?auto_9707 ?auto_9726 ) ) ( not ( = ?auto_9707 ?auto_9724 ) ) ( not ( = ?auto_9708 ?auto_9721 ) ) ( not ( = ?auto_9708 ?auto_9717 ) ) ( not ( = ?auto_9720 ?auto_9722 ) ) ( not ( = ?auto_9720 ?auto_9713 ) ) ( not ( = ?auto_9698 ?auto_9702 ) ) ( not ( = ?auto_9698 ?auto_9716 ) ) ( not ( = ?auto_9699 ?auto_9702 ) ) ( not ( = ?auto_9699 ?auto_9716 ) ) ( not ( = ?auto_9700 ?auto_9702 ) ) ( not ( = ?auto_9700 ?auto_9716 ) ) ( not ( = ?auto_9702 ?auto_9720 ) ) ( not ( = ?auto_9702 ?auto_9722 ) ) ( not ( = ?auto_9702 ?auto_9713 ) ) ( not ( = ?auto_9719 ?auto_9707 ) ) ( not ( = ?auto_9719 ?auto_9726 ) ) ( not ( = ?auto_9719 ?auto_9724 ) ) ( not ( = ?auto_9715 ?auto_9708 ) ) ( not ( = ?auto_9715 ?auto_9721 ) ) ( not ( = ?auto_9715 ?auto_9717 ) ) ( not ( = ?auto_9716 ?auto_9720 ) ) ( not ( = ?auto_9716 ?auto_9722 ) ) ( not ( = ?auto_9716 ?auto_9713 ) ) ( not ( = ?auto_9698 ?auto_9703 ) ) ( not ( = ?auto_9698 ?auto_9712 ) ) ( not ( = ?auto_9699 ?auto_9703 ) ) ( not ( = ?auto_9699 ?auto_9712 ) ) ( not ( = ?auto_9700 ?auto_9703 ) ) ( not ( = ?auto_9700 ?auto_9712 ) ) ( not ( = ?auto_9701 ?auto_9703 ) ) ( not ( = ?auto_9701 ?auto_9712 ) ) ( not ( = ?auto_9703 ?auto_9716 ) ) ( not ( = ?auto_9703 ?auto_9720 ) ) ( not ( = ?auto_9703 ?auto_9722 ) ) ( not ( = ?auto_9703 ?auto_9713 ) ) ( not ( = ?auto_9718 ?auto_9719 ) ) ( not ( = ?auto_9718 ?auto_9707 ) ) ( not ( = ?auto_9718 ?auto_9726 ) ) ( not ( = ?auto_9718 ?auto_9724 ) ) ( not ( = ?auto_9714 ?auto_9715 ) ) ( not ( = ?auto_9714 ?auto_9708 ) ) ( not ( = ?auto_9714 ?auto_9721 ) ) ( not ( = ?auto_9714 ?auto_9717 ) ) ( not ( = ?auto_9712 ?auto_9716 ) ) ( not ( = ?auto_9712 ?auto_9720 ) ) ( not ( = ?auto_9712 ?auto_9722 ) ) ( not ( = ?auto_9712 ?auto_9713 ) ) ( not ( = ?auto_9698 ?auto_9704 ) ) ( not ( = ?auto_9698 ?auto_9727 ) ) ( not ( = ?auto_9699 ?auto_9704 ) ) ( not ( = ?auto_9699 ?auto_9727 ) ) ( not ( = ?auto_9700 ?auto_9704 ) ) ( not ( = ?auto_9700 ?auto_9727 ) ) ( not ( = ?auto_9701 ?auto_9704 ) ) ( not ( = ?auto_9701 ?auto_9727 ) ) ( not ( = ?auto_9702 ?auto_9704 ) ) ( not ( = ?auto_9702 ?auto_9727 ) ) ( not ( = ?auto_9704 ?auto_9712 ) ) ( not ( = ?auto_9704 ?auto_9716 ) ) ( not ( = ?auto_9704 ?auto_9720 ) ) ( not ( = ?auto_9704 ?auto_9722 ) ) ( not ( = ?auto_9704 ?auto_9713 ) ) ( not ( = ?auto_9723 ?auto_9718 ) ) ( not ( = ?auto_9723 ?auto_9719 ) ) ( not ( = ?auto_9723 ?auto_9707 ) ) ( not ( = ?auto_9723 ?auto_9726 ) ) ( not ( = ?auto_9723 ?auto_9724 ) ) ( not ( = ?auto_9725 ?auto_9714 ) ) ( not ( = ?auto_9725 ?auto_9715 ) ) ( not ( = ?auto_9725 ?auto_9708 ) ) ( not ( = ?auto_9725 ?auto_9721 ) ) ( not ( = ?auto_9725 ?auto_9717 ) ) ( not ( = ?auto_9727 ?auto_9712 ) ) ( not ( = ?auto_9727 ?auto_9716 ) ) ( not ( = ?auto_9727 ?auto_9720 ) ) ( not ( = ?auto_9727 ?auto_9722 ) ) ( not ( = ?auto_9727 ?auto_9713 ) ) ( not ( = ?auto_9698 ?auto_9705 ) ) ( not ( = ?auto_9698 ?auto_9706 ) ) ( not ( = ?auto_9699 ?auto_9705 ) ) ( not ( = ?auto_9699 ?auto_9706 ) ) ( not ( = ?auto_9700 ?auto_9705 ) ) ( not ( = ?auto_9700 ?auto_9706 ) ) ( not ( = ?auto_9701 ?auto_9705 ) ) ( not ( = ?auto_9701 ?auto_9706 ) ) ( not ( = ?auto_9702 ?auto_9705 ) ) ( not ( = ?auto_9702 ?auto_9706 ) ) ( not ( = ?auto_9703 ?auto_9705 ) ) ( not ( = ?auto_9703 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9727 ) ) ( not ( = ?auto_9705 ?auto_9712 ) ) ( not ( = ?auto_9705 ?auto_9716 ) ) ( not ( = ?auto_9705 ?auto_9720 ) ) ( not ( = ?auto_9705 ?auto_9722 ) ) ( not ( = ?auto_9705 ?auto_9713 ) ) ( not ( = ?auto_9706 ?auto_9727 ) ) ( not ( = ?auto_9706 ?auto_9712 ) ) ( not ( = ?auto_9706 ?auto_9716 ) ) ( not ( = ?auto_9706 ?auto_9720 ) ) ( not ( = ?auto_9706 ?auto_9722 ) ) ( not ( = ?auto_9706 ?auto_9713 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9698 ?auto_9699 ?auto_9700 ?auto_9701 ?auto_9702 ?auto_9703 ?auto_9704 )
      ( MAKE-1CRATE ?auto_9704 ?auto_9705 )
      ( MAKE-7CRATE-VERIFY ?auto_9698 ?auto_9699 ?auto_9700 ?auto_9701 ?auto_9702 ?auto_9703 ?auto_9704 ?auto_9705 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9747 - SURFACE
      ?auto_9748 - SURFACE
      ?auto_9749 - SURFACE
      ?auto_9750 - SURFACE
      ?auto_9751 - SURFACE
      ?auto_9752 - SURFACE
      ?auto_9753 - SURFACE
      ?auto_9754 - SURFACE
      ?auto_9755 - SURFACE
    )
    :vars
    (
      ?auto_9759 - HOIST
      ?auto_9761 - PLACE
      ?auto_9757 - PLACE
      ?auto_9756 - HOIST
      ?auto_9758 - SURFACE
      ?auto_9763 - PLACE
      ?auto_9769 - HOIST
      ?auto_9774 - SURFACE
      ?auto_9767 - PLACE
      ?auto_9776 - HOIST
      ?auto_9772 - SURFACE
      ?auto_9771 - PLACE
      ?auto_9778 - HOIST
      ?auto_9768 - SURFACE
      ?auto_9777 - PLACE
      ?auto_9775 - HOIST
      ?auto_9766 - SURFACE
      ?auto_9764 - SURFACE
      ?auto_9770 - SURFACE
      ?auto_9765 - PLACE
      ?auto_9762 - HOIST
      ?auto_9773 - SURFACE
      ?auto_9760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9759 ?auto_9761 ) ( IS-CRATE ?auto_9755 ) ( not ( = ?auto_9757 ?auto_9761 ) ) ( HOIST-AT ?auto_9756 ?auto_9757 ) ( SURFACE-AT ?auto_9755 ?auto_9757 ) ( ON ?auto_9755 ?auto_9758 ) ( CLEAR ?auto_9755 ) ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9758 ) ) ( not ( = ?auto_9755 ?auto_9758 ) ) ( not ( = ?auto_9759 ?auto_9756 ) ) ( IS-CRATE ?auto_9754 ) ( not ( = ?auto_9763 ?auto_9761 ) ) ( HOIST-AT ?auto_9769 ?auto_9763 ) ( SURFACE-AT ?auto_9754 ?auto_9763 ) ( ON ?auto_9754 ?auto_9774 ) ( CLEAR ?auto_9754 ) ( not ( = ?auto_9753 ?auto_9754 ) ) ( not ( = ?auto_9753 ?auto_9774 ) ) ( not ( = ?auto_9754 ?auto_9774 ) ) ( not ( = ?auto_9759 ?auto_9769 ) ) ( IS-CRATE ?auto_9753 ) ( not ( = ?auto_9767 ?auto_9761 ) ) ( HOIST-AT ?auto_9776 ?auto_9767 ) ( AVAILABLE ?auto_9776 ) ( SURFACE-AT ?auto_9753 ?auto_9767 ) ( ON ?auto_9753 ?auto_9772 ) ( CLEAR ?auto_9753 ) ( not ( = ?auto_9752 ?auto_9753 ) ) ( not ( = ?auto_9752 ?auto_9772 ) ) ( not ( = ?auto_9753 ?auto_9772 ) ) ( not ( = ?auto_9759 ?auto_9776 ) ) ( IS-CRATE ?auto_9752 ) ( not ( = ?auto_9771 ?auto_9761 ) ) ( HOIST-AT ?auto_9778 ?auto_9771 ) ( AVAILABLE ?auto_9778 ) ( SURFACE-AT ?auto_9752 ?auto_9771 ) ( ON ?auto_9752 ?auto_9768 ) ( CLEAR ?auto_9752 ) ( not ( = ?auto_9751 ?auto_9752 ) ) ( not ( = ?auto_9751 ?auto_9768 ) ) ( not ( = ?auto_9752 ?auto_9768 ) ) ( not ( = ?auto_9759 ?auto_9778 ) ) ( IS-CRATE ?auto_9751 ) ( not ( = ?auto_9777 ?auto_9761 ) ) ( HOIST-AT ?auto_9775 ?auto_9777 ) ( AVAILABLE ?auto_9775 ) ( SURFACE-AT ?auto_9751 ?auto_9777 ) ( ON ?auto_9751 ?auto_9766 ) ( CLEAR ?auto_9751 ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9750 ?auto_9766 ) ) ( not ( = ?auto_9751 ?auto_9766 ) ) ( not ( = ?auto_9759 ?auto_9775 ) ) ( IS-CRATE ?auto_9750 ) ( AVAILABLE ?auto_9769 ) ( SURFACE-AT ?auto_9750 ?auto_9763 ) ( ON ?auto_9750 ?auto_9764 ) ( CLEAR ?auto_9750 ) ( not ( = ?auto_9749 ?auto_9750 ) ) ( not ( = ?auto_9749 ?auto_9764 ) ) ( not ( = ?auto_9750 ?auto_9764 ) ) ( IS-CRATE ?auto_9749 ) ( AVAILABLE ?auto_9756 ) ( SURFACE-AT ?auto_9749 ?auto_9757 ) ( ON ?auto_9749 ?auto_9770 ) ( CLEAR ?auto_9749 ) ( not ( = ?auto_9748 ?auto_9749 ) ) ( not ( = ?auto_9748 ?auto_9770 ) ) ( not ( = ?auto_9749 ?auto_9770 ) ) ( SURFACE-AT ?auto_9747 ?auto_9761 ) ( CLEAR ?auto_9747 ) ( IS-CRATE ?auto_9748 ) ( AVAILABLE ?auto_9759 ) ( not ( = ?auto_9765 ?auto_9761 ) ) ( HOIST-AT ?auto_9762 ?auto_9765 ) ( AVAILABLE ?auto_9762 ) ( SURFACE-AT ?auto_9748 ?auto_9765 ) ( ON ?auto_9748 ?auto_9773 ) ( CLEAR ?auto_9748 ) ( TRUCK-AT ?auto_9760 ?auto_9761 ) ( not ( = ?auto_9747 ?auto_9748 ) ) ( not ( = ?auto_9747 ?auto_9773 ) ) ( not ( = ?auto_9748 ?auto_9773 ) ) ( not ( = ?auto_9759 ?auto_9762 ) ) ( not ( = ?auto_9747 ?auto_9749 ) ) ( not ( = ?auto_9747 ?auto_9770 ) ) ( not ( = ?auto_9749 ?auto_9773 ) ) ( not ( = ?auto_9757 ?auto_9765 ) ) ( not ( = ?auto_9756 ?auto_9762 ) ) ( not ( = ?auto_9770 ?auto_9773 ) ) ( not ( = ?auto_9747 ?auto_9750 ) ) ( not ( = ?auto_9747 ?auto_9764 ) ) ( not ( = ?auto_9748 ?auto_9750 ) ) ( not ( = ?auto_9748 ?auto_9764 ) ) ( not ( = ?auto_9750 ?auto_9770 ) ) ( not ( = ?auto_9750 ?auto_9773 ) ) ( not ( = ?auto_9763 ?auto_9757 ) ) ( not ( = ?auto_9763 ?auto_9765 ) ) ( not ( = ?auto_9769 ?auto_9756 ) ) ( not ( = ?auto_9769 ?auto_9762 ) ) ( not ( = ?auto_9764 ?auto_9770 ) ) ( not ( = ?auto_9764 ?auto_9773 ) ) ( not ( = ?auto_9747 ?auto_9751 ) ) ( not ( = ?auto_9747 ?auto_9766 ) ) ( not ( = ?auto_9748 ?auto_9751 ) ) ( not ( = ?auto_9748 ?auto_9766 ) ) ( not ( = ?auto_9749 ?auto_9751 ) ) ( not ( = ?auto_9749 ?auto_9766 ) ) ( not ( = ?auto_9751 ?auto_9764 ) ) ( not ( = ?auto_9751 ?auto_9770 ) ) ( not ( = ?auto_9751 ?auto_9773 ) ) ( not ( = ?auto_9777 ?auto_9763 ) ) ( not ( = ?auto_9777 ?auto_9757 ) ) ( not ( = ?auto_9777 ?auto_9765 ) ) ( not ( = ?auto_9775 ?auto_9769 ) ) ( not ( = ?auto_9775 ?auto_9756 ) ) ( not ( = ?auto_9775 ?auto_9762 ) ) ( not ( = ?auto_9766 ?auto_9764 ) ) ( not ( = ?auto_9766 ?auto_9770 ) ) ( not ( = ?auto_9766 ?auto_9773 ) ) ( not ( = ?auto_9747 ?auto_9752 ) ) ( not ( = ?auto_9747 ?auto_9768 ) ) ( not ( = ?auto_9748 ?auto_9752 ) ) ( not ( = ?auto_9748 ?auto_9768 ) ) ( not ( = ?auto_9749 ?auto_9752 ) ) ( not ( = ?auto_9749 ?auto_9768 ) ) ( not ( = ?auto_9750 ?auto_9752 ) ) ( not ( = ?auto_9750 ?auto_9768 ) ) ( not ( = ?auto_9752 ?auto_9766 ) ) ( not ( = ?auto_9752 ?auto_9764 ) ) ( not ( = ?auto_9752 ?auto_9770 ) ) ( not ( = ?auto_9752 ?auto_9773 ) ) ( not ( = ?auto_9771 ?auto_9777 ) ) ( not ( = ?auto_9771 ?auto_9763 ) ) ( not ( = ?auto_9771 ?auto_9757 ) ) ( not ( = ?auto_9771 ?auto_9765 ) ) ( not ( = ?auto_9778 ?auto_9775 ) ) ( not ( = ?auto_9778 ?auto_9769 ) ) ( not ( = ?auto_9778 ?auto_9756 ) ) ( not ( = ?auto_9778 ?auto_9762 ) ) ( not ( = ?auto_9768 ?auto_9766 ) ) ( not ( = ?auto_9768 ?auto_9764 ) ) ( not ( = ?auto_9768 ?auto_9770 ) ) ( not ( = ?auto_9768 ?auto_9773 ) ) ( not ( = ?auto_9747 ?auto_9753 ) ) ( not ( = ?auto_9747 ?auto_9772 ) ) ( not ( = ?auto_9748 ?auto_9753 ) ) ( not ( = ?auto_9748 ?auto_9772 ) ) ( not ( = ?auto_9749 ?auto_9753 ) ) ( not ( = ?auto_9749 ?auto_9772 ) ) ( not ( = ?auto_9750 ?auto_9753 ) ) ( not ( = ?auto_9750 ?auto_9772 ) ) ( not ( = ?auto_9751 ?auto_9753 ) ) ( not ( = ?auto_9751 ?auto_9772 ) ) ( not ( = ?auto_9753 ?auto_9768 ) ) ( not ( = ?auto_9753 ?auto_9766 ) ) ( not ( = ?auto_9753 ?auto_9764 ) ) ( not ( = ?auto_9753 ?auto_9770 ) ) ( not ( = ?auto_9753 ?auto_9773 ) ) ( not ( = ?auto_9767 ?auto_9771 ) ) ( not ( = ?auto_9767 ?auto_9777 ) ) ( not ( = ?auto_9767 ?auto_9763 ) ) ( not ( = ?auto_9767 ?auto_9757 ) ) ( not ( = ?auto_9767 ?auto_9765 ) ) ( not ( = ?auto_9776 ?auto_9778 ) ) ( not ( = ?auto_9776 ?auto_9775 ) ) ( not ( = ?auto_9776 ?auto_9769 ) ) ( not ( = ?auto_9776 ?auto_9756 ) ) ( not ( = ?auto_9776 ?auto_9762 ) ) ( not ( = ?auto_9772 ?auto_9768 ) ) ( not ( = ?auto_9772 ?auto_9766 ) ) ( not ( = ?auto_9772 ?auto_9764 ) ) ( not ( = ?auto_9772 ?auto_9770 ) ) ( not ( = ?auto_9772 ?auto_9773 ) ) ( not ( = ?auto_9747 ?auto_9754 ) ) ( not ( = ?auto_9747 ?auto_9774 ) ) ( not ( = ?auto_9748 ?auto_9754 ) ) ( not ( = ?auto_9748 ?auto_9774 ) ) ( not ( = ?auto_9749 ?auto_9754 ) ) ( not ( = ?auto_9749 ?auto_9774 ) ) ( not ( = ?auto_9750 ?auto_9754 ) ) ( not ( = ?auto_9750 ?auto_9774 ) ) ( not ( = ?auto_9751 ?auto_9754 ) ) ( not ( = ?auto_9751 ?auto_9774 ) ) ( not ( = ?auto_9752 ?auto_9754 ) ) ( not ( = ?auto_9752 ?auto_9774 ) ) ( not ( = ?auto_9754 ?auto_9772 ) ) ( not ( = ?auto_9754 ?auto_9768 ) ) ( not ( = ?auto_9754 ?auto_9766 ) ) ( not ( = ?auto_9754 ?auto_9764 ) ) ( not ( = ?auto_9754 ?auto_9770 ) ) ( not ( = ?auto_9754 ?auto_9773 ) ) ( not ( = ?auto_9774 ?auto_9772 ) ) ( not ( = ?auto_9774 ?auto_9768 ) ) ( not ( = ?auto_9774 ?auto_9766 ) ) ( not ( = ?auto_9774 ?auto_9764 ) ) ( not ( = ?auto_9774 ?auto_9770 ) ) ( not ( = ?auto_9774 ?auto_9773 ) ) ( not ( = ?auto_9747 ?auto_9755 ) ) ( not ( = ?auto_9747 ?auto_9758 ) ) ( not ( = ?auto_9748 ?auto_9755 ) ) ( not ( = ?auto_9748 ?auto_9758 ) ) ( not ( = ?auto_9749 ?auto_9755 ) ) ( not ( = ?auto_9749 ?auto_9758 ) ) ( not ( = ?auto_9750 ?auto_9755 ) ) ( not ( = ?auto_9750 ?auto_9758 ) ) ( not ( = ?auto_9751 ?auto_9755 ) ) ( not ( = ?auto_9751 ?auto_9758 ) ) ( not ( = ?auto_9752 ?auto_9755 ) ) ( not ( = ?auto_9752 ?auto_9758 ) ) ( not ( = ?auto_9753 ?auto_9755 ) ) ( not ( = ?auto_9753 ?auto_9758 ) ) ( not ( = ?auto_9755 ?auto_9774 ) ) ( not ( = ?auto_9755 ?auto_9772 ) ) ( not ( = ?auto_9755 ?auto_9768 ) ) ( not ( = ?auto_9755 ?auto_9766 ) ) ( not ( = ?auto_9755 ?auto_9764 ) ) ( not ( = ?auto_9755 ?auto_9770 ) ) ( not ( = ?auto_9755 ?auto_9773 ) ) ( not ( = ?auto_9758 ?auto_9774 ) ) ( not ( = ?auto_9758 ?auto_9772 ) ) ( not ( = ?auto_9758 ?auto_9768 ) ) ( not ( = ?auto_9758 ?auto_9766 ) ) ( not ( = ?auto_9758 ?auto_9764 ) ) ( not ( = ?auto_9758 ?auto_9770 ) ) ( not ( = ?auto_9758 ?auto_9773 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9747 ?auto_9748 ?auto_9749 ?auto_9750 ?auto_9751 ?auto_9752 ?auto_9753 ?auto_9754 )
      ( MAKE-1CRATE ?auto_9754 ?auto_9755 )
      ( MAKE-8CRATE-VERIFY ?auto_9747 ?auto_9748 ?auto_9749 ?auto_9750 ?auto_9751 ?auto_9752 ?auto_9753 ?auto_9754 ?auto_9755 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9799 - SURFACE
      ?auto_9800 - SURFACE
      ?auto_9801 - SURFACE
      ?auto_9802 - SURFACE
      ?auto_9803 - SURFACE
      ?auto_9804 - SURFACE
      ?auto_9805 - SURFACE
      ?auto_9806 - SURFACE
      ?auto_9807 - SURFACE
      ?auto_9808 - SURFACE
    )
    :vars
    (
      ?auto_9814 - HOIST
      ?auto_9810 - PLACE
      ?auto_9811 - PLACE
      ?auto_9809 - HOIST
      ?auto_9812 - SURFACE
      ?auto_9822 - PLACE
      ?auto_9826 - HOIST
      ?auto_9819 - SURFACE
      ?auto_9833 - PLACE
      ?auto_9815 - HOIST
      ?auto_9818 - SURFACE
      ?auto_9834 - PLACE
      ?auto_9821 - HOIST
      ?auto_9832 - SURFACE
      ?auto_9829 - PLACE
      ?auto_9820 - HOIST
      ?auto_9823 - SURFACE
      ?auto_9824 - PLACE
      ?auto_9825 - HOIST
      ?auto_9816 - SURFACE
      ?auto_9817 - SURFACE
      ?auto_9831 - SURFACE
      ?auto_9827 - PLACE
      ?auto_9828 - HOIST
      ?auto_9830 - SURFACE
      ?auto_9813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9814 ?auto_9810 ) ( IS-CRATE ?auto_9808 ) ( not ( = ?auto_9811 ?auto_9810 ) ) ( HOIST-AT ?auto_9809 ?auto_9811 ) ( AVAILABLE ?auto_9809 ) ( SURFACE-AT ?auto_9808 ?auto_9811 ) ( ON ?auto_9808 ?auto_9812 ) ( CLEAR ?auto_9808 ) ( not ( = ?auto_9807 ?auto_9808 ) ) ( not ( = ?auto_9807 ?auto_9812 ) ) ( not ( = ?auto_9808 ?auto_9812 ) ) ( not ( = ?auto_9814 ?auto_9809 ) ) ( IS-CRATE ?auto_9807 ) ( not ( = ?auto_9822 ?auto_9810 ) ) ( HOIST-AT ?auto_9826 ?auto_9822 ) ( SURFACE-AT ?auto_9807 ?auto_9822 ) ( ON ?auto_9807 ?auto_9819 ) ( CLEAR ?auto_9807 ) ( not ( = ?auto_9806 ?auto_9807 ) ) ( not ( = ?auto_9806 ?auto_9819 ) ) ( not ( = ?auto_9807 ?auto_9819 ) ) ( not ( = ?auto_9814 ?auto_9826 ) ) ( IS-CRATE ?auto_9806 ) ( not ( = ?auto_9833 ?auto_9810 ) ) ( HOIST-AT ?auto_9815 ?auto_9833 ) ( SURFACE-AT ?auto_9806 ?auto_9833 ) ( ON ?auto_9806 ?auto_9818 ) ( CLEAR ?auto_9806 ) ( not ( = ?auto_9805 ?auto_9806 ) ) ( not ( = ?auto_9805 ?auto_9818 ) ) ( not ( = ?auto_9806 ?auto_9818 ) ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( IS-CRATE ?auto_9805 ) ( not ( = ?auto_9834 ?auto_9810 ) ) ( HOIST-AT ?auto_9821 ?auto_9834 ) ( AVAILABLE ?auto_9821 ) ( SURFACE-AT ?auto_9805 ?auto_9834 ) ( ON ?auto_9805 ?auto_9832 ) ( CLEAR ?auto_9805 ) ( not ( = ?auto_9804 ?auto_9805 ) ) ( not ( = ?auto_9804 ?auto_9832 ) ) ( not ( = ?auto_9805 ?auto_9832 ) ) ( not ( = ?auto_9814 ?auto_9821 ) ) ( IS-CRATE ?auto_9804 ) ( not ( = ?auto_9829 ?auto_9810 ) ) ( HOIST-AT ?auto_9820 ?auto_9829 ) ( AVAILABLE ?auto_9820 ) ( SURFACE-AT ?auto_9804 ?auto_9829 ) ( ON ?auto_9804 ?auto_9823 ) ( CLEAR ?auto_9804 ) ( not ( = ?auto_9803 ?auto_9804 ) ) ( not ( = ?auto_9803 ?auto_9823 ) ) ( not ( = ?auto_9804 ?auto_9823 ) ) ( not ( = ?auto_9814 ?auto_9820 ) ) ( IS-CRATE ?auto_9803 ) ( not ( = ?auto_9824 ?auto_9810 ) ) ( HOIST-AT ?auto_9825 ?auto_9824 ) ( AVAILABLE ?auto_9825 ) ( SURFACE-AT ?auto_9803 ?auto_9824 ) ( ON ?auto_9803 ?auto_9816 ) ( CLEAR ?auto_9803 ) ( not ( = ?auto_9802 ?auto_9803 ) ) ( not ( = ?auto_9802 ?auto_9816 ) ) ( not ( = ?auto_9803 ?auto_9816 ) ) ( not ( = ?auto_9814 ?auto_9825 ) ) ( IS-CRATE ?auto_9802 ) ( AVAILABLE ?auto_9815 ) ( SURFACE-AT ?auto_9802 ?auto_9833 ) ( ON ?auto_9802 ?auto_9817 ) ( CLEAR ?auto_9802 ) ( not ( = ?auto_9801 ?auto_9802 ) ) ( not ( = ?auto_9801 ?auto_9817 ) ) ( not ( = ?auto_9802 ?auto_9817 ) ) ( IS-CRATE ?auto_9801 ) ( AVAILABLE ?auto_9826 ) ( SURFACE-AT ?auto_9801 ?auto_9822 ) ( ON ?auto_9801 ?auto_9831 ) ( CLEAR ?auto_9801 ) ( not ( = ?auto_9800 ?auto_9801 ) ) ( not ( = ?auto_9800 ?auto_9831 ) ) ( not ( = ?auto_9801 ?auto_9831 ) ) ( SURFACE-AT ?auto_9799 ?auto_9810 ) ( CLEAR ?auto_9799 ) ( IS-CRATE ?auto_9800 ) ( AVAILABLE ?auto_9814 ) ( not ( = ?auto_9827 ?auto_9810 ) ) ( HOIST-AT ?auto_9828 ?auto_9827 ) ( AVAILABLE ?auto_9828 ) ( SURFACE-AT ?auto_9800 ?auto_9827 ) ( ON ?auto_9800 ?auto_9830 ) ( CLEAR ?auto_9800 ) ( TRUCK-AT ?auto_9813 ?auto_9810 ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( not ( = ?auto_9799 ?auto_9830 ) ) ( not ( = ?auto_9800 ?auto_9830 ) ) ( not ( = ?auto_9814 ?auto_9828 ) ) ( not ( = ?auto_9799 ?auto_9801 ) ) ( not ( = ?auto_9799 ?auto_9831 ) ) ( not ( = ?auto_9801 ?auto_9830 ) ) ( not ( = ?auto_9822 ?auto_9827 ) ) ( not ( = ?auto_9826 ?auto_9828 ) ) ( not ( = ?auto_9831 ?auto_9830 ) ) ( not ( = ?auto_9799 ?auto_9802 ) ) ( not ( = ?auto_9799 ?auto_9817 ) ) ( not ( = ?auto_9800 ?auto_9802 ) ) ( not ( = ?auto_9800 ?auto_9817 ) ) ( not ( = ?auto_9802 ?auto_9831 ) ) ( not ( = ?auto_9802 ?auto_9830 ) ) ( not ( = ?auto_9833 ?auto_9822 ) ) ( not ( = ?auto_9833 ?auto_9827 ) ) ( not ( = ?auto_9815 ?auto_9826 ) ) ( not ( = ?auto_9815 ?auto_9828 ) ) ( not ( = ?auto_9817 ?auto_9831 ) ) ( not ( = ?auto_9817 ?auto_9830 ) ) ( not ( = ?auto_9799 ?auto_9803 ) ) ( not ( = ?auto_9799 ?auto_9816 ) ) ( not ( = ?auto_9800 ?auto_9803 ) ) ( not ( = ?auto_9800 ?auto_9816 ) ) ( not ( = ?auto_9801 ?auto_9803 ) ) ( not ( = ?auto_9801 ?auto_9816 ) ) ( not ( = ?auto_9803 ?auto_9817 ) ) ( not ( = ?auto_9803 ?auto_9831 ) ) ( not ( = ?auto_9803 ?auto_9830 ) ) ( not ( = ?auto_9824 ?auto_9833 ) ) ( not ( = ?auto_9824 ?auto_9822 ) ) ( not ( = ?auto_9824 ?auto_9827 ) ) ( not ( = ?auto_9825 ?auto_9815 ) ) ( not ( = ?auto_9825 ?auto_9826 ) ) ( not ( = ?auto_9825 ?auto_9828 ) ) ( not ( = ?auto_9816 ?auto_9817 ) ) ( not ( = ?auto_9816 ?auto_9831 ) ) ( not ( = ?auto_9816 ?auto_9830 ) ) ( not ( = ?auto_9799 ?auto_9804 ) ) ( not ( = ?auto_9799 ?auto_9823 ) ) ( not ( = ?auto_9800 ?auto_9804 ) ) ( not ( = ?auto_9800 ?auto_9823 ) ) ( not ( = ?auto_9801 ?auto_9804 ) ) ( not ( = ?auto_9801 ?auto_9823 ) ) ( not ( = ?auto_9802 ?auto_9804 ) ) ( not ( = ?auto_9802 ?auto_9823 ) ) ( not ( = ?auto_9804 ?auto_9816 ) ) ( not ( = ?auto_9804 ?auto_9817 ) ) ( not ( = ?auto_9804 ?auto_9831 ) ) ( not ( = ?auto_9804 ?auto_9830 ) ) ( not ( = ?auto_9829 ?auto_9824 ) ) ( not ( = ?auto_9829 ?auto_9833 ) ) ( not ( = ?auto_9829 ?auto_9822 ) ) ( not ( = ?auto_9829 ?auto_9827 ) ) ( not ( = ?auto_9820 ?auto_9825 ) ) ( not ( = ?auto_9820 ?auto_9815 ) ) ( not ( = ?auto_9820 ?auto_9826 ) ) ( not ( = ?auto_9820 ?auto_9828 ) ) ( not ( = ?auto_9823 ?auto_9816 ) ) ( not ( = ?auto_9823 ?auto_9817 ) ) ( not ( = ?auto_9823 ?auto_9831 ) ) ( not ( = ?auto_9823 ?auto_9830 ) ) ( not ( = ?auto_9799 ?auto_9805 ) ) ( not ( = ?auto_9799 ?auto_9832 ) ) ( not ( = ?auto_9800 ?auto_9805 ) ) ( not ( = ?auto_9800 ?auto_9832 ) ) ( not ( = ?auto_9801 ?auto_9805 ) ) ( not ( = ?auto_9801 ?auto_9832 ) ) ( not ( = ?auto_9802 ?auto_9805 ) ) ( not ( = ?auto_9802 ?auto_9832 ) ) ( not ( = ?auto_9803 ?auto_9805 ) ) ( not ( = ?auto_9803 ?auto_9832 ) ) ( not ( = ?auto_9805 ?auto_9823 ) ) ( not ( = ?auto_9805 ?auto_9816 ) ) ( not ( = ?auto_9805 ?auto_9817 ) ) ( not ( = ?auto_9805 ?auto_9831 ) ) ( not ( = ?auto_9805 ?auto_9830 ) ) ( not ( = ?auto_9834 ?auto_9829 ) ) ( not ( = ?auto_9834 ?auto_9824 ) ) ( not ( = ?auto_9834 ?auto_9833 ) ) ( not ( = ?auto_9834 ?auto_9822 ) ) ( not ( = ?auto_9834 ?auto_9827 ) ) ( not ( = ?auto_9821 ?auto_9820 ) ) ( not ( = ?auto_9821 ?auto_9825 ) ) ( not ( = ?auto_9821 ?auto_9815 ) ) ( not ( = ?auto_9821 ?auto_9826 ) ) ( not ( = ?auto_9821 ?auto_9828 ) ) ( not ( = ?auto_9832 ?auto_9823 ) ) ( not ( = ?auto_9832 ?auto_9816 ) ) ( not ( = ?auto_9832 ?auto_9817 ) ) ( not ( = ?auto_9832 ?auto_9831 ) ) ( not ( = ?auto_9832 ?auto_9830 ) ) ( not ( = ?auto_9799 ?auto_9806 ) ) ( not ( = ?auto_9799 ?auto_9818 ) ) ( not ( = ?auto_9800 ?auto_9806 ) ) ( not ( = ?auto_9800 ?auto_9818 ) ) ( not ( = ?auto_9801 ?auto_9806 ) ) ( not ( = ?auto_9801 ?auto_9818 ) ) ( not ( = ?auto_9802 ?auto_9806 ) ) ( not ( = ?auto_9802 ?auto_9818 ) ) ( not ( = ?auto_9803 ?auto_9806 ) ) ( not ( = ?auto_9803 ?auto_9818 ) ) ( not ( = ?auto_9804 ?auto_9806 ) ) ( not ( = ?auto_9804 ?auto_9818 ) ) ( not ( = ?auto_9806 ?auto_9832 ) ) ( not ( = ?auto_9806 ?auto_9823 ) ) ( not ( = ?auto_9806 ?auto_9816 ) ) ( not ( = ?auto_9806 ?auto_9817 ) ) ( not ( = ?auto_9806 ?auto_9831 ) ) ( not ( = ?auto_9806 ?auto_9830 ) ) ( not ( = ?auto_9818 ?auto_9832 ) ) ( not ( = ?auto_9818 ?auto_9823 ) ) ( not ( = ?auto_9818 ?auto_9816 ) ) ( not ( = ?auto_9818 ?auto_9817 ) ) ( not ( = ?auto_9818 ?auto_9831 ) ) ( not ( = ?auto_9818 ?auto_9830 ) ) ( not ( = ?auto_9799 ?auto_9807 ) ) ( not ( = ?auto_9799 ?auto_9819 ) ) ( not ( = ?auto_9800 ?auto_9807 ) ) ( not ( = ?auto_9800 ?auto_9819 ) ) ( not ( = ?auto_9801 ?auto_9807 ) ) ( not ( = ?auto_9801 ?auto_9819 ) ) ( not ( = ?auto_9802 ?auto_9807 ) ) ( not ( = ?auto_9802 ?auto_9819 ) ) ( not ( = ?auto_9803 ?auto_9807 ) ) ( not ( = ?auto_9803 ?auto_9819 ) ) ( not ( = ?auto_9804 ?auto_9807 ) ) ( not ( = ?auto_9804 ?auto_9819 ) ) ( not ( = ?auto_9805 ?auto_9807 ) ) ( not ( = ?auto_9805 ?auto_9819 ) ) ( not ( = ?auto_9807 ?auto_9818 ) ) ( not ( = ?auto_9807 ?auto_9832 ) ) ( not ( = ?auto_9807 ?auto_9823 ) ) ( not ( = ?auto_9807 ?auto_9816 ) ) ( not ( = ?auto_9807 ?auto_9817 ) ) ( not ( = ?auto_9807 ?auto_9831 ) ) ( not ( = ?auto_9807 ?auto_9830 ) ) ( not ( = ?auto_9819 ?auto_9818 ) ) ( not ( = ?auto_9819 ?auto_9832 ) ) ( not ( = ?auto_9819 ?auto_9823 ) ) ( not ( = ?auto_9819 ?auto_9816 ) ) ( not ( = ?auto_9819 ?auto_9817 ) ) ( not ( = ?auto_9819 ?auto_9831 ) ) ( not ( = ?auto_9819 ?auto_9830 ) ) ( not ( = ?auto_9799 ?auto_9808 ) ) ( not ( = ?auto_9799 ?auto_9812 ) ) ( not ( = ?auto_9800 ?auto_9808 ) ) ( not ( = ?auto_9800 ?auto_9812 ) ) ( not ( = ?auto_9801 ?auto_9808 ) ) ( not ( = ?auto_9801 ?auto_9812 ) ) ( not ( = ?auto_9802 ?auto_9808 ) ) ( not ( = ?auto_9802 ?auto_9812 ) ) ( not ( = ?auto_9803 ?auto_9808 ) ) ( not ( = ?auto_9803 ?auto_9812 ) ) ( not ( = ?auto_9804 ?auto_9808 ) ) ( not ( = ?auto_9804 ?auto_9812 ) ) ( not ( = ?auto_9805 ?auto_9808 ) ) ( not ( = ?auto_9805 ?auto_9812 ) ) ( not ( = ?auto_9806 ?auto_9808 ) ) ( not ( = ?auto_9806 ?auto_9812 ) ) ( not ( = ?auto_9808 ?auto_9819 ) ) ( not ( = ?auto_9808 ?auto_9818 ) ) ( not ( = ?auto_9808 ?auto_9832 ) ) ( not ( = ?auto_9808 ?auto_9823 ) ) ( not ( = ?auto_9808 ?auto_9816 ) ) ( not ( = ?auto_9808 ?auto_9817 ) ) ( not ( = ?auto_9808 ?auto_9831 ) ) ( not ( = ?auto_9808 ?auto_9830 ) ) ( not ( = ?auto_9811 ?auto_9822 ) ) ( not ( = ?auto_9811 ?auto_9833 ) ) ( not ( = ?auto_9811 ?auto_9834 ) ) ( not ( = ?auto_9811 ?auto_9829 ) ) ( not ( = ?auto_9811 ?auto_9824 ) ) ( not ( = ?auto_9811 ?auto_9827 ) ) ( not ( = ?auto_9809 ?auto_9826 ) ) ( not ( = ?auto_9809 ?auto_9815 ) ) ( not ( = ?auto_9809 ?auto_9821 ) ) ( not ( = ?auto_9809 ?auto_9820 ) ) ( not ( = ?auto_9809 ?auto_9825 ) ) ( not ( = ?auto_9809 ?auto_9828 ) ) ( not ( = ?auto_9812 ?auto_9819 ) ) ( not ( = ?auto_9812 ?auto_9818 ) ) ( not ( = ?auto_9812 ?auto_9832 ) ) ( not ( = ?auto_9812 ?auto_9823 ) ) ( not ( = ?auto_9812 ?auto_9816 ) ) ( not ( = ?auto_9812 ?auto_9817 ) ) ( not ( = ?auto_9812 ?auto_9831 ) ) ( not ( = ?auto_9812 ?auto_9830 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9803 ?auto_9804 ?auto_9805 ?auto_9806 ?auto_9807 )
      ( MAKE-1CRATE ?auto_9807 ?auto_9808 )
      ( MAKE-9CRATE-VERIFY ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9803 ?auto_9804 ?auto_9805 ?auto_9806 ?auto_9807 ?auto_9808 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9856 - SURFACE
      ?auto_9857 - SURFACE
      ?auto_9858 - SURFACE
      ?auto_9859 - SURFACE
      ?auto_9860 - SURFACE
      ?auto_9861 - SURFACE
      ?auto_9862 - SURFACE
      ?auto_9863 - SURFACE
      ?auto_9864 - SURFACE
      ?auto_9865 - SURFACE
      ?auto_9866 - SURFACE
    )
    :vars
    (
      ?auto_9871 - HOIST
      ?auto_9868 - PLACE
      ?auto_9867 - PLACE
      ?auto_9869 - HOIST
      ?auto_9870 - SURFACE
      ?auto_9893 - PLACE
      ?auto_9874 - HOIST
      ?auto_9877 - SURFACE
      ?auto_9883 - PLACE
      ?auto_9876 - HOIST
      ?auto_9882 - SURFACE
      ?auto_9884 - PLACE
      ?auto_9886 - HOIST
      ?auto_9891 - SURFACE
      ?auto_9892 - PLACE
      ?auto_9890 - HOIST
      ?auto_9888 - SURFACE
      ?auto_9873 - PLACE
      ?auto_9875 - HOIST
      ?auto_9881 - SURFACE
      ?auto_9879 - PLACE
      ?auto_9880 - HOIST
      ?auto_9887 - SURFACE
      ?auto_9878 - SURFACE
      ?auto_9885 - SURFACE
      ?auto_9889 - SURFACE
      ?auto_9872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9871 ?auto_9868 ) ( IS-CRATE ?auto_9866 ) ( not ( = ?auto_9867 ?auto_9868 ) ) ( HOIST-AT ?auto_9869 ?auto_9867 ) ( SURFACE-AT ?auto_9866 ?auto_9867 ) ( ON ?auto_9866 ?auto_9870 ) ( CLEAR ?auto_9866 ) ( not ( = ?auto_9865 ?auto_9866 ) ) ( not ( = ?auto_9865 ?auto_9870 ) ) ( not ( = ?auto_9866 ?auto_9870 ) ) ( not ( = ?auto_9871 ?auto_9869 ) ) ( IS-CRATE ?auto_9865 ) ( not ( = ?auto_9893 ?auto_9868 ) ) ( HOIST-AT ?auto_9874 ?auto_9893 ) ( AVAILABLE ?auto_9874 ) ( SURFACE-AT ?auto_9865 ?auto_9893 ) ( ON ?auto_9865 ?auto_9877 ) ( CLEAR ?auto_9865 ) ( not ( = ?auto_9864 ?auto_9865 ) ) ( not ( = ?auto_9864 ?auto_9877 ) ) ( not ( = ?auto_9865 ?auto_9877 ) ) ( not ( = ?auto_9871 ?auto_9874 ) ) ( IS-CRATE ?auto_9864 ) ( not ( = ?auto_9883 ?auto_9868 ) ) ( HOIST-AT ?auto_9876 ?auto_9883 ) ( SURFACE-AT ?auto_9864 ?auto_9883 ) ( ON ?auto_9864 ?auto_9882 ) ( CLEAR ?auto_9864 ) ( not ( = ?auto_9863 ?auto_9864 ) ) ( not ( = ?auto_9863 ?auto_9882 ) ) ( not ( = ?auto_9864 ?auto_9882 ) ) ( not ( = ?auto_9871 ?auto_9876 ) ) ( IS-CRATE ?auto_9863 ) ( not ( = ?auto_9884 ?auto_9868 ) ) ( HOIST-AT ?auto_9886 ?auto_9884 ) ( SURFACE-AT ?auto_9863 ?auto_9884 ) ( ON ?auto_9863 ?auto_9891 ) ( CLEAR ?auto_9863 ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( not ( = ?auto_9862 ?auto_9891 ) ) ( not ( = ?auto_9863 ?auto_9891 ) ) ( not ( = ?auto_9871 ?auto_9886 ) ) ( IS-CRATE ?auto_9862 ) ( not ( = ?auto_9892 ?auto_9868 ) ) ( HOIST-AT ?auto_9890 ?auto_9892 ) ( AVAILABLE ?auto_9890 ) ( SURFACE-AT ?auto_9862 ?auto_9892 ) ( ON ?auto_9862 ?auto_9888 ) ( CLEAR ?auto_9862 ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( not ( = ?auto_9861 ?auto_9888 ) ) ( not ( = ?auto_9862 ?auto_9888 ) ) ( not ( = ?auto_9871 ?auto_9890 ) ) ( IS-CRATE ?auto_9861 ) ( not ( = ?auto_9873 ?auto_9868 ) ) ( HOIST-AT ?auto_9875 ?auto_9873 ) ( AVAILABLE ?auto_9875 ) ( SURFACE-AT ?auto_9861 ?auto_9873 ) ( ON ?auto_9861 ?auto_9881 ) ( CLEAR ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9860 ?auto_9881 ) ) ( not ( = ?auto_9861 ?auto_9881 ) ) ( not ( = ?auto_9871 ?auto_9875 ) ) ( IS-CRATE ?auto_9860 ) ( not ( = ?auto_9879 ?auto_9868 ) ) ( HOIST-AT ?auto_9880 ?auto_9879 ) ( AVAILABLE ?auto_9880 ) ( SURFACE-AT ?auto_9860 ?auto_9879 ) ( ON ?auto_9860 ?auto_9887 ) ( CLEAR ?auto_9860 ) ( not ( = ?auto_9859 ?auto_9860 ) ) ( not ( = ?auto_9859 ?auto_9887 ) ) ( not ( = ?auto_9860 ?auto_9887 ) ) ( not ( = ?auto_9871 ?auto_9880 ) ) ( IS-CRATE ?auto_9859 ) ( AVAILABLE ?auto_9886 ) ( SURFACE-AT ?auto_9859 ?auto_9884 ) ( ON ?auto_9859 ?auto_9878 ) ( CLEAR ?auto_9859 ) ( not ( = ?auto_9858 ?auto_9859 ) ) ( not ( = ?auto_9858 ?auto_9878 ) ) ( not ( = ?auto_9859 ?auto_9878 ) ) ( IS-CRATE ?auto_9858 ) ( AVAILABLE ?auto_9876 ) ( SURFACE-AT ?auto_9858 ?auto_9883 ) ( ON ?auto_9858 ?auto_9885 ) ( CLEAR ?auto_9858 ) ( not ( = ?auto_9857 ?auto_9858 ) ) ( not ( = ?auto_9857 ?auto_9885 ) ) ( not ( = ?auto_9858 ?auto_9885 ) ) ( SURFACE-AT ?auto_9856 ?auto_9868 ) ( CLEAR ?auto_9856 ) ( IS-CRATE ?auto_9857 ) ( AVAILABLE ?auto_9871 ) ( AVAILABLE ?auto_9869 ) ( SURFACE-AT ?auto_9857 ?auto_9867 ) ( ON ?auto_9857 ?auto_9889 ) ( CLEAR ?auto_9857 ) ( TRUCK-AT ?auto_9872 ?auto_9868 ) ( not ( = ?auto_9856 ?auto_9857 ) ) ( not ( = ?auto_9856 ?auto_9889 ) ) ( not ( = ?auto_9857 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9858 ) ) ( not ( = ?auto_9856 ?auto_9885 ) ) ( not ( = ?auto_9858 ?auto_9889 ) ) ( not ( = ?auto_9883 ?auto_9867 ) ) ( not ( = ?auto_9876 ?auto_9869 ) ) ( not ( = ?auto_9885 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9859 ) ) ( not ( = ?auto_9856 ?auto_9878 ) ) ( not ( = ?auto_9857 ?auto_9859 ) ) ( not ( = ?auto_9857 ?auto_9878 ) ) ( not ( = ?auto_9859 ?auto_9885 ) ) ( not ( = ?auto_9859 ?auto_9889 ) ) ( not ( = ?auto_9884 ?auto_9883 ) ) ( not ( = ?auto_9884 ?auto_9867 ) ) ( not ( = ?auto_9886 ?auto_9876 ) ) ( not ( = ?auto_9886 ?auto_9869 ) ) ( not ( = ?auto_9878 ?auto_9885 ) ) ( not ( = ?auto_9878 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9860 ) ) ( not ( = ?auto_9856 ?auto_9887 ) ) ( not ( = ?auto_9857 ?auto_9860 ) ) ( not ( = ?auto_9857 ?auto_9887 ) ) ( not ( = ?auto_9858 ?auto_9860 ) ) ( not ( = ?auto_9858 ?auto_9887 ) ) ( not ( = ?auto_9860 ?auto_9878 ) ) ( not ( = ?auto_9860 ?auto_9885 ) ) ( not ( = ?auto_9860 ?auto_9889 ) ) ( not ( = ?auto_9879 ?auto_9884 ) ) ( not ( = ?auto_9879 ?auto_9883 ) ) ( not ( = ?auto_9879 ?auto_9867 ) ) ( not ( = ?auto_9880 ?auto_9886 ) ) ( not ( = ?auto_9880 ?auto_9876 ) ) ( not ( = ?auto_9880 ?auto_9869 ) ) ( not ( = ?auto_9887 ?auto_9878 ) ) ( not ( = ?auto_9887 ?auto_9885 ) ) ( not ( = ?auto_9887 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9861 ) ) ( not ( = ?auto_9856 ?auto_9881 ) ) ( not ( = ?auto_9857 ?auto_9861 ) ) ( not ( = ?auto_9857 ?auto_9881 ) ) ( not ( = ?auto_9858 ?auto_9861 ) ) ( not ( = ?auto_9858 ?auto_9881 ) ) ( not ( = ?auto_9859 ?auto_9861 ) ) ( not ( = ?auto_9859 ?auto_9881 ) ) ( not ( = ?auto_9861 ?auto_9887 ) ) ( not ( = ?auto_9861 ?auto_9878 ) ) ( not ( = ?auto_9861 ?auto_9885 ) ) ( not ( = ?auto_9861 ?auto_9889 ) ) ( not ( = ?auto_9873 ?auto_9879 ) ) ( not ( = ?auto_9873 ?auto_9884 ) ) ( not ( = ?auto_9873 ?auto_9883 ) ) ( not ( = ?auto_9873 ?auto_9867 ) ) ( not ( = ?auto_9875 ?auto_9880 ) ) ( not ( = ?auto_9875 ?auto_9886 ) ) ( not ( = ?auto_9875 ?auto_9876 ) ) ( not ( = ?auto_9875 ?auto_9869 ) ) ( not ( = ?auto_9881 ?auto_9887 ) ) ( not ( = ?auto_9881 ?auto_9878 ) ) ( not ( = ?auto_9881 ?auto_9885 ) ) ( not ( = ?auto_9881 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9862 ) ) ( not ( = ?auto_9856 ?auto_9888 ) ) ( not ( = ?auto_9857 ?auto_9862 ) ) ( not ( = ?auto_9857 ?auto_9888 ) ) ( not ( = ?auto_9858 ?auto_9862 ) ) ( not ( = ?auto_9858 ?auto_9888 ) ) ( not ( = ?auto_9859 ?auto_9862 ) ) ( not ( = ?auto_9859 ?auto_9888 ) ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9860 ?auto_9888 ) ) ( not ( = ?auto_9862 ?auto_9881 ) ) ( not ( = ?auto_9862 ?auto_9887 ) ) ( not ( = ?auto_9862 ?auto_9878 ) ) ( not ( = ?auto_9862 ?auto_9885 ) ) ( not ( = ?auto_9862 ?auto_9889 ) ) ( not ( = ?auto_9892 ?auto_9873 ) ) ( not ( = ?auto_9892 ?auto_9879 ) ) ( not ( = ?auto_9892 ?auto_9884 ) ) ( not ( = ?auto_9892 ?auto_9883 ) ) ( not ( = ?auto_9892 ?auto_9867 ) ) ( not ( = ?auto_9890 ?auto_9875 ) ) ( not ( = ?auto_9890 ?auto_9880 ) ) ( not ( = ?auto_9890 ?auto_9886 ) ) ( not ( = ?auto_9890 ?auto_9876 ) ) ( not ( = ?auto_9890 ?auto_9869 ) ) ( not ( = ?auto_9888 ?auto_9881 ) ) ( not ( = ?auto_9888 ?auto_9887 ) ) ( not ( = ?auto_9888 ?auto_9878 ) ) ( not ( = ?auto_9888 ?auto_9885 ) ) ( not ( = ?auto_9888 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9863 ) ) ( not ( = ?auto_9856 ?auto_9891 ) ) ( not ( = ?auto_9857 ?auto_9863 ) ) ( not ( = ?auto_9857 ?auto_9891 ) ) ( not ( = ?auto_9858 ?auto_9863 ) ) ( not ( = ?auto_9858 ?auto_9891 ) ) ( not ( = ?auto_9859 ?auto_9863 ) ) ( not ( = ?auto_9859 ?auto_9891 ) ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9860 ?auto_9891 ) ) ( not ( = ?auto_9861 ?auto_9863 ) ) ( not ( = ?auto_9861 ?auto_9891 ) ) ( not ( = ?auto_9863 ?auto_9888 ) ) ( not ( = ?auto_9863 ?auto_9881 ) ) ( not ( = ?auto_9863 ?auto_9887 ) ) ( not ( = ?auto_9863 ?auto_9878 ) ) ( not ( = ?auto_9863 ?auto_9885 ) ) ( not ( = ?auto_9863 ?auto_9889 ) ) ( not ( = ?auto_9891 ?auto_9888 ) ) ( not ( = ?auto_9891 ?auto_9881 ) ) ( not ( = ?auto_9891 ?auto_9887 ) ) ( not ( = ?auto_9891 ?auto_9878 ) ) ( not ( = ?auto_9891 ?auto_9885 ) ) ( not ( = ?auto_9891 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9864 ) ) ( not ( = ?auto_9856 ?auto_9882 ) ) ( not ( = ?auto_9857 ?auto_9864 ) ) ( not ( = ?auto_9857 ?auto_9882 ) ) ( not ( = ?auto_9858 ?auto_9864 ) ) ( not ( = ?auto_9858 ?auto_9882 ) ) ( not ( = ?auto_9859 ?auto_9864 ) ) ( not ( = ?auto_9859 ?auto_9882 ) ) ( not ( = ?auto_9860 ?auto_9864 ) ) ( not ( = ?auto_9860 ?auto_9882 ) ) ( not ( = ?auto_9861 ?auto_9864 ) ) ( not ( = ?auto_9861 ?auto_9882 ) ) ( not ( = ?auto_9862 ?auto_9864 ) ) ( not ( = ?auto_9862 ?auto_9882 ) ) ( not ( = ?auto_9864 ?auto_9891 ) ) ( not ( = ?auto_9864 ?auto_9888 ) ) ( not ( = ?auto_9864 ?auto_9881 ) ) ( not ( = ?auto_9864 ?auto_9887 ) ) ( not ( = ?auto_9864 ?auto_9878 ) ) ( not ( = ?auto_9864 ?auto_9885 ) ) ( not ( = ?auto_9864 ?auto_9889 ) ) ( not ( = ?auto_9882 ?auto_9891 ) ) ( not ( = ?auto_9882 ?auto_9888 ) ) ( not ( = ?auto_9882 ?auto_9881 ) ) ( not ( = ?auto_9882 ?auto_9887 ) ) ( not ( = ?auto_9882 ?auto_9878 ) ) ( not ( = ?auto_9882 ?auto_9885 ) ) ( not ( = ?auto_9882 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9865 ) ) ( not ( = ?auto_9856 ?auto_9877 ) ) ( not ( = ?auto_9857 ?auto_9865 ) ) ( not ( = ?auto_9857 ?auto_9877 ) ) ( not ( = ?auto_9858 ?auto_9865 ) ) ( not ( = ?auto_9858 ?auto_9877 ) ) ( not ( = ?auto_9859 ?auto_9865 ) ) ( not ( = ?auto_9859 ?auto_9877 ) ) ( not ( = ?auto_9860 ?auto_9865 ) ) ( not ( = ?auto_9860 ?auto_9877 ) ) ( not ( = ?auto_9861 ?auto_9865 ) ) ( not ( = ?auto_9861 ?auto_9877 ) ) ( not ( = ?auto_9862 ?auto_9865 ) ) ( not ( = ?auto_9862 ?auto_9877 ) ) ( not ( = ?auto_9863 ?auto_9865 ) ) ( not ( = ?auto_9863 ?auto_9877 ) ) ( not ( = ?auto_9865 ?auto_9882 ) ) ( not ( = ?auto_9865 ?auto_9891 ) ) ( not ( = ?auto_9865 ?auto_9888 ) ) ( not ( = ?auto_9865 ?auto_9881 ) ) ( not ( = ?auto_9865 ?auto_9887 ) ) ( not ( = ?auto_9865 ?auto_9878 ) ) ( not ( = ?auto_9865 ?auto_9885 ) ) ( not ( = ?auto_9865 ?auto_9889 ) ) ( not ( = ?auto_9893 ?auto_9883 ) ) ( not ( = ?auto_9893 ?auto_9884 ) ) ( not ( = ?auto_9893 ?auto_9892 ) ) ( not ( = ?auto_9893 ?auto_9873 ) ) ( not ( = ?auto_9893 ?auto_9879 ) ) ( not ( = ?auto_9893 ?auto_9867 ) ) ( not ( = ?auto_9874 ?auto_9876 ) ) ( not ( = ?auto_9874 ?auto_9886 ) ) ( not ( = ?auto_9874 ?auto_9890 ) ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( not ( = ?auto_9874 ?auto_9880 ) ) ( not ( = ?auto_9874 ?auto_9869 ) ) ( not ( = ?auto_9877 ?auto_9882 ) ) ( not ( = ?auto_9877 ?auto_9891 ) ) ( not ( = ?auto_9877 ?auto_9888 ) ) ( not ( = ?auto_9877 ?auto_9881 ) ) ( not ( = ?auto_9877 ?auto_9887 ) ) ( not ( = ?auto_9877 ?auto_9878 ) ) ( not ( = ?auto_9877 ?auto_9885 ) ) ( not ( = ?auto_9877 ?auto_9889 ) ) ( not ( = ?auto_9856 ?auto_9866 ) ) ( not ( = ?auto_9856 ?auto_9870 ) ) ( not ( = ?auto_9857 ?auto_9866 ) ) ( not ( = ?auto_9857 ?auto_9870 ) ) ( not ( = ?auto_9858 ?auto_9866 ) ) ( not ( = ?auto_9858 ?auto_9870 ) ) ( not ( = ?auto_9859 ?auto_9866 ) ) ( not ( = ?auto_9859 ?auto_9870 ) ) ( not ( = ?auto_9860 ?auto_9866 ) ) ( not ( = ?auto_9860 ?auto_9870 ) ) ( not ( = ?auto_9861 ?auto_9866 ) ) ( not ( = ?auto_9861 ?auto_9870 ) ) ( not ( = ?auto_9862 ?auto_9866 ) ) ( not ( = ?auto_9862 ?auto_9870 ) ) ( not ( = ?auto_9863 ?auto_9866 ) ) ( not ( = ?auto_9863 ?auto_9870 ) ) ( not ( = ?auto_9864 ?auto_9866 ) ) ( not ( = ?auto_9864 ?auto_9870 ) ) ( not ( = ?auto_9866 ?auto_9877 ) ) ( not ( = ?auto_9866 ?auto_9882 ) ) ( not ( = ?auto_9866 ?auto_9891 ) ) ( not ( = ?auto_9866 ?auto_9888 ) ) ( not ( = ?auto_9866 ?auto_9881 ) ) ( not ( = ?auto_9866 ?auto_9887 ) ) ( not ( = ?auto_9866 ?auto_9878 ) ) ( not ( = ?auto_9866 ?auto_9885 ) ) ( not ( = ?auto_9866 ?auto_9889 ) ) ( not ( = ?auto_9870 ?auto_9877 ) ) ( not ( = ?auto_9870 ?auto_9882 ) ) ( not ( = ?auto_9870 ?auto_9891 ) ) ( not ( = ?auto_9870 ?auto_9888 ) ) ( not ( = ?auto_9870 ?auto_9881 ) ) ( not ( = ?auto_9870 ?auto_9887 ) ) ( not ( = ?auto_9870 ?auto_9878 ) ) ( not ( = ?auto_9870 ?auto_9885 ) ) ( not ( = ?auto_9870 ?auto_9889 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9856 ?auto_9857 ?auto_9858 ?auto_9859 ?auto_9860 ?auto_9861 ?auto_9862 ?auto_9863 ?auto_9864 ?auto_9865 )
      ( MAKE-1CRATE ?auto_9865 ?auto_9866 )
      ( MAKE-10CRATE-VERIFY ?auto_9856 ?auto_9857 ?auto_9858 ?auto_9859 ?auto_9860 ?auto_9861 ?auto_9862 ?auto_9863 ?auto_9864 ?auto_9865 ?auto_9866 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9916 - SURFACE
      ?auto_9917 - SURFACE
      ?auto_9918 - SURFACE
      ?auto_9919 - SURFACE
      ?auto_9920 - SURFACE
      ?auto_9921 - SURFACE
      ?auto_9922 - SURFACE
      ?auto_9923 - SURFACE
      ?auto_9924 - SURFACE
      ?auto_9925 - SURFACE
      ?auto_9926 - SURFACE
      ?auto_9927 - SURFACE
    )
    :vars
    (
      ?auto_9932 - HOIST
      ?auto_9928 - PLACE
      ?auto_9931 - PLACE
      ?auto_9933 - HOIST
      ?auto_9930 - SURFACE
      ?auto_9950 - PLACE
      ?auto_9943 - HOIST
      ?auto_9949 - SURFACE
      ?auto_9947 - PLACE
      ?auto_9956 - HOIST
      ?auto_9939 - SURFACE
      ?auto_9935 - PLACE
      ?auto_9941 - HOIST
      ?auto_9953 - SURFACE
      ?auto_9944 - PLACE
      ?auto_9957 - HOIST
      ?auto_9936 - SURFACE
      ?auto_9955 - PLACE
      ?auto_9948 - HOIST
      ?auto_9952 - SURFACE
      ?auto_9938 - PLACE
      ?auto_9940 - HOIST
      ?auto_9945 - SURFACE
      ?auto_9951 - PLACE
      ?auto_9942 - HOIST
      ?auto_9946 - SURFACE
      ?auto_9954 - SURFACE
      ?auto_9934 - SURFACE
      ?auto_9937 - SURFACE
      ?auto_9929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9932 ?auto_9928 ) ( IS-CRATE ?auto_9927 ) ( not ( = ?auto_9931 ?auto_9928 ) ) ( HOIST-AT ?auto_9933 ?auto_9931 ) ( AVAILABLE ?auto_9933 ) ( SURFACE-AT ?auto_9927 ?auto_9931 ) ( ON ?auto_9927 ?auto_9930 ) ( CLEAR ?auto_9927 ) ( not ( = ?auto_9926 ?auto_9927 ) ) ( not ( = ?auto_9926 ?auto_9930 ) ) ( not ( = ?auto_9927 ?auto_9930 ) ) ( not ( = ?auto_9932 ?auto_9933 ) ) ( IS-CRATE ?auto_9926 ) ( not ( = ?auto_9950 ?auto_9928 ) ) ( HOIST-AT ?auto_9943 ?auto_9950 ) ( SURFACE-AT ?auto_9926 ?auto_9950 ) ( ON ?auto_9926 ?auto_9949 ) ( CLEAR ?auto_9926 ) ( not ( = ?auto_9925 ?auto_9926 ) ) ( not ( = ?auto_9925 ?auto_9949 ) ) ( not ( = ?auto_9926 ?auto_9949 ) ) ( not ( = ?auto_9932 ?auto_9943 ) ) ( IS-CRATE ?auto_9925 ) ( not ( = ?auto_9947 ?auto_9928 ) ) ( HOIST-AT ?auto_9956 ?auto_9947 ) ( AVAILABLE ?auto_9956 ) ( SURFACE-AT ?auto_9925 ?auto_9947 ) ( ON ?auto_9925 ?auto_9939 ) ( CLEAR ?auto_9925 ) ( not ( = ?auto_9924 ?auto_9925 ) ) ( not ( = ?auto_9924 ?auto_9939 ) ) ( not ( = ?auto_9925 ?auto_9939 ) ) ( not ( = ?auto_9932 ?auto_9956 ) ) ( IS-CRATE ?auto_9924 ) ( not ( = ?auto_9935 ?auto_9928 ) ) ( HOIST-AT ?auto_9941 ?auto_9935 ) ( SURFACE-AT ?auto_9924 ?auto_9935 ) ( ON ?auto_9924 ?auto_9953 ) ( CLEAR ?auto_9924 ) ( not ( = ?auto_9923 ?auto_9924 ) ) ( not ( = ?auto_9923 ?auto_9953 ) ) ( not ( = ?auto_9924 ?auto_9953 ) ) ( not ( = ?auto_9932 ?auto_9941 ) ) ( IS-CRATE ?auto_9923 ) ( not ( = ?auto_9944 ?auto_9928 ) ) ( HOIST-AT ?auto_9957 ?auto_9944 ) ( SURFACE-AT ?auto_9923 ?auto_9944 ) ( ON ?auto_9923 ?auto_9936 ) ( CLEAR ?auto_9923 ) ( not ( = ?auto_9922 ?auto_9923 ) ) ( not ( = ?auto_9922 ?auto_9936 ) ) ( not ( = ?auto_9923 ?auto_9936 ) ) ( not ( = ?auto_9932 ?auto_9957 ) ) ( IS-CRATE ?auto_9922 ) ( not ( = ?auto_9955 ?auto_9928 ) ) ( HOIST-AT ?auto_9948 ?auto_9955 ) ( AVAILABLE ?auto_9948 ) ( SURFACE-AT ?auto_9922 ?auto_9955 ) ( ON ?auto_9922 ?auto_9952 ) ( CLEAR ?auto_9922 ) ( not ( = ?auto_9921 ?auto_9922 ) ) ( not ( = ?auto_9921 ?auto_9952 ) ) ( not ( = ?auto_9922 ?auto_9952 ) ) ( not ( = ?auto_9932 ?auto_9948 ) ) ( IS-CRATE ?auto_9921 ) ( not ( = ?auto_9938 ?auto_9928 ) ) ( HOIST-AT ?auto_9940 ?auto_9938 ) ( AVAILABLE ?auto_9940 ) ( SURFACE-AT ?auto_9921 ?auto_9938 ) ( ON ?auto_9921 ?auto_9945 ) ( CLEAR ?auto_9921 ) ( not ( = ?auto_9920 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9945 ) ) ( not ( = ?auto_9921 ?auto_9945 ) ) ( not ( = ?auto_9932 ?auto_9940 ) ) ( IS-CRATE ?auto_9920 ) ( not ( = ?auto_9951 ?auto_9928 ) ) ( HOIST-AT ?auto_9942 ?auto_9951 ) ( AVAILABLE ?auto_9942 ) ( SURFACE-AT ?auto_9920 ?auto_9951 ) ( ON ?auto_9920 ?auto_9946 ) ( CLEAR ?auto_9920 ) ( not ( = ?auto_9919 ?auto_9920 ) ) ( not ( = ?auto_9919 ?auto_9946 ) ) ( not ( = ?auto_9920 ?auto_9946 ) ) ( not ( = ?auto_9932 ?auto_9942 ) ) ( IS-CRATE ?auto_9919 ) ( AVAILABLE ?auto_9957 ) ( SURFACE-AT ?auto_9919 ?auto_9944 ) ( ON ?auto_9919 ?auto_9954 ) ( CLEAR ?auto_9919 ) ( not ( = ?auto_9918 ?auto_9919 ) ) ( not ( = ?auto_9918 ?auto_9954 ) ) ( not ( = ?auto_9919 ?auto_9954 ) ) ( IS-CRATE ?auto_9918 ) ( AVAILABLE ?auto_9941 ) ( SURFACE-AT ?auto_9918 ?auto_9935 ) ( ON ?auto_9918 ?auto_9934 ) ( CLEAR ?auto_9918 ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( not ( = ?auto_9917 ?auto_9934 ) ) ( not ( = ?auto_9918 ?auto_9934 ) ) ( SURFACE-AT ?auto_9916 ?auto_9928 ) ( CLEAR ?auto_9916 ) ( IS-CRATE ?auto_9917 ) ( AVAILABLE ?auto_9932 ) ( AVAILABLE ?auto_9943 ) ( SURFACE-AT ?auto_9917 ?auto_9950 ) ( ON ?auto_9917 ?auto_9937 ) ( CLEAR ?auto_9917 ) ( TRUCK-AT ?auto_9929 ?auto_9928 ) ( not ( = ?auto_9916 ?auto_9917 ) ) ( not ( = ?auto_9916 ?auto_9937 ) ) ( not ( = ?auto_9917 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9918 ) ) ( not ( = ?auto_9916 ?auto_9934 ) ) ( not ( = ?auto_9918 ?auto_9937 ) ) ( not ( = ?auto_9935 ?auto_9950 ) ) ( not ( = ?auto_9941 ?auto_9943 ) ) ( not ( = ?auto_9934 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9919 ) ) ( not ( = ?auto_9916 ?auto_9954 ) ) ( not ( = ?auto_9917 ?auto_9919 ) ) ( not ( = ?auto_9917 ?auto_9954 ) ) ( not ( = ?auto_9919 ?auto_9934 ) ) ( not ( = ?auto_9919 ?auto_9937 ) ) ( not ( = ?auto_9944 ?auto_9935 ) ) ( not ( = ?auto_9944 ?auto_9950 ) ) ( not ( = ?auto_9957 ?auto_9941 ) ) ( not ( = ?auto_9957 ?auto_9943 ) ) ( not ( = ?auto_9954 ?auto_9934 ) ) ( not ( = ?auto_9954 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9920 ) ) ( not ( = ?auto_9916 ?auto_9946 ) ) ( not ( = ?auto_9917 ?auto_9920 ) ) ( not ( = ?auto_9917 ?auto_9946 ) ) ( not ( = ?auto_9918 ?auto_9920 ) ) ( not ( = ?auto_9918 ?auto_9946 ) ) ( not ( = ?auto_9920 ?auto_9954 ) ) ( not ( = ?auto_9920 ?auto_9934 ) ) ( not ( = ?auto_9920 ?auto_9937 ) ) ( not ( = ?auto_9951 ?auto_9944 ) ) ( not ( = ?auto_9951 ?auto_9935 ) ) ( not ( = ?auto_9951 ?auto_9950 ) ) ( not ( = ?auto_9942 ?auto_9957 ) ) ( not ( = ?auto_9942 ?auto_9941 ) ) ( not ( = ?auto_9942 ?auto_9943 ) ) ( not ( = ?auto_9946 ?auto_9954 ) ) ( not ( = ?auto_9946 ?auto_9934 ) ) ( not ( = ?auto_9946 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9921 ) ) ( not ( = ?auto_9916 ?auto_9945 ) ) ( not ( = ?auto_9917 ?auto_9921 ) ) ( not ( = ?auto_9917 ?auto_9945 ) ) ( not ( = ?auto_9918 ?auto_9921 ) ) ( not ( = ?auto_9918 ?auto_9945 ) ) ( not ( = ?auto_9919 ?auto_9921 ) ) ( not ( = ?auto_9919 ?auto_9945 ) ) ( not ( = ?auto_9921 ?auto_9946 ) ) ( not ( = ?auto_9921 ?auto_9954 ) ) ( not ( = ?auto_9921 ?auto_9934 ) ) ( not ( = ?auto_9921 ?auto_9937 ) ) ( not ( = ?auto_9938 ?auto_9951 ) ) ( not ( = ?auto_9938 ?auto_9944 ) ) ( not ( = ?auto_9938 ?auto_9935 ) ) ( not ( = ?auto_9938 ?auto_9950 ) ) ( not ( = ?auto_9940 ?auto_9942 ) ) ( not ( = ?auto_9940 ?auto_9957 ) ) ( not ( = ?auto_9940 ?auto_9941 ) ) ( not ( = ?auto_9940 ?auto_9943 ) ) ( not ( = ?auto_9945 ?auto_9946 ) ) ( not ( = ?auto_9945 ?auto_9954 ) ) ( not ( = ?auto_9945 ?auto_9934 ) ) ( not ( = ?auto_9945 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9922 ) ) ( not ( = ?auto_9916 ?auto_9952 ) ) ( not ( = ?auto_9917 ?auto_9922 ) ) ( not ( = ?auto_9917 ?auto_9952 ) ) ( not ( = ?auto_9918 ?auto_9922 ) ) ( not ( = ?auto_9918 ?auto_9952 ) ) ( not ( = ?auto_9919 ?auto_9922 ) ) ( not ( = ?auto_9919 ?auto_9952 ) ) ( not ( = ?auto_9920 ?auto_9922 ) ) ( not ( = ?auto_9920 ?auto_9952 ) ) ( not ( = ?auto_9922 ?auto_9945 ) ) ( not ( = ?auto_9922 ?auto_9946 ) ) ( not ( = ?auto_9922 ?auto_9954 ) ) ( not ( = ?auto_9922 ?auto_9934 ) ) ( not ( = ?auto_9922 ?auto_9937 ) ) ( not ( = ?auto_9955 ?auto_9938 ) ) ( not ( = ?auto_9955 ?auto_9951 ) ) ( not ( = ?auto_9955 ?auto_9944 ) ) ( not ( = ?auto_9955 ?auto_9935 ) ) ( not ( = ?auto_9955 ?auto_9950 ) ) ( not ( = ?auto_9948 ?auto_9940 ) ) ( not ( = ?auto_9948 ?auto_9942 ) ) ( not ( = ?auto_9948 ?auto_9957 ) ) ( not ( = ?auto_9948 ?auto_9941 ) ) ( not ( = ?auto_9948 ?auto_9943 ) ) ( not ( = ?auto_9952 ?auto_9945 ) ) ( not ( = ?auto_9952 ?auto_9946 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( not ( = ?auto_9952 ?auto_9934 ) ) ( not ( = ?auto_9952 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9923 ) ) ( not ( = ?auto_9916 ?auto_9936 ) ) ( not ( = ?auto_9917 ?auto_9923 ) ) ( not ( = ?auto_9917 ?auto_9936 ) ) ( not ( = ?auto_9918 ?auto_9923 ) ) ( not ( = ?auto_9918 ?auto_9936 ) ) ( not ( = ?auto_9919 ?auto_9923 ) ) ( not ( = ?auto_9919 ?auto_9936 ) ) ( not ( = ?auto_9920 ?auto_9923 ) ) ( not ( = ?auto_9920 ?auto_9936 ) ) ( not ( = ?auto_9921 ?auto_9923 ) ) ( not ( = ?auto_9921 ?auto_9936 ) ) ( not ( = ?auto_9923 ?auto_9952 ) ) ( not ( = ?auto_9923 ?auto_9945 ) ) ( not ( = ?auto_9923 ?auto_9946 ) ) ( not ( = ?auto_9923 ?auto_9954 ) ) ( not ( = ?auto_9923 ?auto_9934 ) ) ( not ( = ?auto_9923 ?auto_9937 ) ) ( not ( = ?auto_9936 ?auto_9952 ) ) ( not ( = ?auto_9936 ?auto_9945 ) ) ( not ( = ?auto_9936 ?auto_9946 ) ) ( not ( = ?auto_9936 ?auto_9954 ) ) ( not ( = ?auto_9936 ?auto_9934 ) ) ( not ( = ?auto_9936 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9924 ) ) ( not ( = ?auto_9916 ?auto_9953 ) ) ( not ( = ?auto_9917 ?auto_9924 ) ) ( not ( = ?auto_9917 ?auto_9953 ) ) ( not ( = ?auto_9918 ?auto_9924 ) ) ( not ( = ?auto_9918 ?auto_9953 ) ) ( not ( = ?auto_9919 ?auto_9924 ) ) ( not ( = ?auto_9919 ?auto_9953 ) ) ( not ( = ?auto_9920 ?auto_9924 ) ) ( not ( = ?auto_9920 ?auto_9953 ) ) ( not ( = ?auto_9921 ?auto_9924 ) ) ( not ( = ?auto_9921 ?auto_9953 ) ) ( not ( = ?auto_9922 ?auto_9924 ) ) ( not ( = ?auto_9922 ?auto_9953 ) ) ( not ( = ?auto_9924 ?auto_9936 ) ) ( not ( = ?auto_9924 ?auto_9952 ) ) ( not ( = ?auto_9924 ?auto_9945 ) ) ( not ( = ?auto_9924 ?auto_9946 ) ) ( not ( = ?auto_9924 ?auto_9954 ) ) ( not ( = ?auto_9924 ?auto_9934 ) ) ( not ( = ?auto_9924 ?auto_9937 ) ) ( not ( = ?auto_9953 ?auto_9936 ) ) ( not ( = ?auto_9953 ?auto_9952 ) ) ( not ( = ?auto_9953 ?auto_9945 ) ) ( not ( = ?auto_9953 ?auto_9946 ) ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( not ( = ?auto_9953 ?auto_9934 ) ) ( not ( = ?auto_9953 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9925 ) ) ( not ( = ?auto_9916 ?auto_9939 ) ) ( not ( = ?auto_9917 ?auto_9925 ) ) ( not ( = ?auto_9917 ?auto_9939 ) ) ( not ( = ?auto_9918 ?auto_9925 ) ) ( not ( = ?auto_9918 ?auto_9939 ) ) ( not ( = ?auto_9919 ?auto_9925 ) ) ( not ( = ?auto_9919 ?auto_9939 ) ) ( not ( = ?auto_9920 ?auto_9925 ) ) ( not ( = ?auto_9920 ?auto_9939 ) ) ( not ( = ?auto_9921 ?auto_9925 ) ) ( not ( = ?auto_9921 ?auto_9939 ) ) ( not ( = ?auto_9922 ?auto_9925 ) ) ( not ( = ?auto_9922 ?auto_9939 ) ) ( not ( = ?auto_9923 ?auto_9925 ) ) ( not ( = ?auto_9923 ?auto_9939 ) ) ( not ( = ?auto_9925 ?auto_9953 ) ) ( not ( = ?auto_9925 ?auto_9936 ) ) ( not ( = ?auto_9925 ?auto_9952 ) ) ( not ( = ?auto_9925 ?auto_9945 ) ) ( not ( = ?auto_9925 ?auto_9946 ) ) ( not ( = ?auto_9925 ?auto_9954 ) ) ( not ( = ?auto_9925 ?auto_9934 ) ) ( not ( = ?auto_9925 ?auto_9937 ) ) ( not ( = ?auto_9947 ?auto_9935 ) ) ( not ( = ?auto_9947 ?auto_9944 ) ) ( not ( = ?auto_9947 ?auto_9955 ) ) ( not ( = ?auto_9947 ?auto_9938 ) ) ( not ( = ?auto_9947 ?auto_9951 ) ) ( not ( = ?auto_9947 ?auto_9950 ) ) ( not ( = ?auto_9956 ?auto_9941 ) ) ( not ( = ?auto_9956 ?auto_9957 ) ) ( not ( = ?auto_9956 ?auto_9948 ) ) ( not ( = ?auto_9956 ?auto_9940 ) ) ( not ( = ?auto_9956 ?auto_9942 ) ) ( not ( = ?auto_9956 ?auto_9943 ) ) ( not ( = ?auto_9939 ?auto_9953 ) ) ( not ( = ?auto_9939 ?auto_9936 ) ) ( not ( = ?auto_9939 ?auto_9952 ) ) ( not ( = ?auto_9939 ?auto_9945 ) ) ( not ( = ?auto_9939 ?auto_9946 ) ) ( not ( = ?auto_9939 ?auto_9954 ) ) ( not ( = ?auto_9939 ?auto_9934 ) ) ( not ( = ?auto_9939 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9926 ) ) ( not ( = ?auto_9916 ?auto_9949 ) ) ( not ( = ?auto_9917 ?auto_9926 ) ) ( not ( = ?auto_9917 ?auto_9949 ) ) ( not ( = ?auto_9918 ?auto_9926 ) ) ( not ( = ?auto_9918 ?auto_9949 ) ) ( not ( = ?auto_9919 ?auto_9926 ) ) ( not ( = ?auto_9919 ?auto_9949 ) ) ( not ( = ?auto_9920 ?auto_9926 ) ) ( not ( = ?auto_9920 ?auto_9949 ) ) ( not ( = ?auto_9921 ?auto_9926 ) ) ( not ( = ?auto_9921 ?auto_9949 ) ) ( not ( = ?auto_9922 ?auto_9926 ) ) ( not ( = ?auto_9922 ?auto_9949 ) ) ( not ( = ?auto_9923 ?auto_9926 ) ) ( not ( = ?auto_9923 ?auto_9949 ) ) ( not ( = ?auto_9924 ?auto_9926 ) ) ( not ( = ?auto_9924 ?auto_9949 ) ) ( not ( = ?auto_9926 ?auto_9939 ) ) ( not ( = ?auto_9926 ?auto_9953 ) ) ( not ( = ?auto_9926 ?auto_9936 ) ) ( not ( = ?auto_9926 ?auto_9952 ) ) ( not ( = ?auto_9926 ?auto_9945 ) ) ( not ( = ?auto_9926 ?auto_9946 ) ) ( not ( = ?auto_9926 ?auto_9954 ) ) ( not ( = ?auto_9926 ?auto_9934 ) ) ( not ( = ?auto_9926 ?auto_9937 ) ) ( not ( = ?auto_9949 ?auto_9939 ) ) ( not ( = ?auto_9949 ?auto_9953 ) ) ( not ( = ?auto_9949 ?auto_9936 ) ) ( not ( = ?auto_9949 ?auto_9952 ) ) ( not ( = ?auto_9949 ?auto_9945 ) ) ( not ( = ?auto_9949 ?auto_9946 ) ) ( not ( = ?auto_9949 ?auto_9954 ) ) ( not ( = ?auto_9949 ?auto_9934 ) ) ( not ( = ?auto_9949 ?auto_9937 ) ) ( not ( = ?auto_9916 ?auto_9927 ) ) ( not ( = ?auto_9916 ?auto_9930 ) ) ( not ( = ?auto_9917 ?auto_9927 ) ) ( not ( = ?auto_9917 ?auto_9930 ) ) ( not ( = ?auto_9918 ?auto_9927 ) ) ( not ( = ?auto_9918 ?auto_9930 ) ) ( not ( = ?auto_9919 ?auto_9927 ) ) ( not ( = ?auto_9919 ?auto_9930 ) ) ( not ( = ?auto_9920 ?auto_9927 ) ) ( not ( = ?auto_9920 ?auto_9930 ) ) ( not ( = ?auto_9921 ?auto_9927 ) ) ( not ( = ?auto_9921 ?auto_9930 ) ) ( not ( = ?auto_9922 ?auto_9927 ) ) ( not ( = ?auto_9922 ?auto_9930 ) ) ( not ( = ?auto_9923 ?auto_9927 ) ) ( not ( = ?auto_9923 ?auto_9930 ) ) ( not ( = ?auto_9924 ?auto_9927 ) ) ( not ( = ?auto_9924 ?auto_9930 ) ) ( not ( = ?auto_9925 ?auto_9927 ) ) ( not ( = ?auto_9925 ?auto_9930 ) ) ( not ( = ?auto_9927 ?auto_9949 ) ) ( not ( = ?auto_9927 ?auto_9939 ) ) ( not ( = ?auto_9927 ?auto_9953 ) ) ( not ( = ?auto_9927 ?auto_9936 ) ) ( not ( = ?auto_9927 ?auto_9952 ) ) ( not ( = ?auto_9927 ?auto_9945 ) ) ( not ( = ?auto_9927 ?auto_9946 ) ) ( not ( = ?auto_9927 ?auto_9954 ) ) ( not ( = ?auto_9927 ?auto_9934 ) ) ( not ( = ?auto_9927 ?auto_9937 ) ) ( not ( = ?auto_9931 ?auto_9950 ) ) ( not ( = ?auto_9931 ?auto_9947 ) ) ( not ( = ?auto_9931 ?auto_9935 ) ) ( not ( = ?auto_9931 ?auto_9944 ) ) ( not ( = ?auto_9931 ?auto_9955 ) ) ( not ( = ?auto_9931 ?auto_9938 ) ) ( not ( = ?auto_9931 ?auto_9951 ) ) ( not ( = ?auto_9933 ?auto_9943 ) ) ( not ( = ?auto_9933 ?auto_9956 ) ) ( not ( = ?auto_9933 ?auto_9941 ) ) ( not ( = ?auto_9933 ?auto_9957 ) ) ( not ( = ?auto_9933 ?auto_9948 ) ) ( not ( = ?auto_9933 ?auto_9940 ) ) ( not ( = ?auto_9933 ?auto_9942 ) ) ( not ( = ?auto_9930 ?auto_9949 ) ) ( not ( = ?auto_9930 ?auto_9939 ) ) ( not ( = ?auto_9930 ?auto_9953 ) ) ( not ( = ?auto_9930 ?auto_9936 ) ) ( not ( = ?auto_9930 ?auto_9952 ) ) ( not ( = ?auto_9930 ?auto_9945 ) ) ( not ( = ?auto_9930 ?auto_9946 ) ) ( not ( = ?auto_9930 ?auto_9954 ) ) ( not ( = ?auto_9930 ?auto_9934 ) ) ( not ( = ?auto_9930 ?auto_9937 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9916 ?auto_9917 ?auto_9918 ?auto_9919 ?auto_9920 ?auto_9921 ?auto_9922 ?auto_9923 ?auto_9924 ?auto_9925 ?auto_9926 )
      ( MAKE-1CRATE ?auto_9926 ?auto_9927 )
      ( MAKE-11CRATE-VERIFY ?auto_9916 ?auto_9917 ?auto_9918 ?auto_9919 ?auto_9920 ?auto_9921 ?auto_9922 ?auto_9923 ?auto_9924 ?auto_9925 ?auto_9926 ?auto_9927 ) )
  )

)

