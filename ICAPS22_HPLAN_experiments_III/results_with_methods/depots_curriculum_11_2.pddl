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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9507 - SURFACE
      ?auto_9508 - SURFACE
    )
    :vars
    (
      ?auto_9509 - HOIST
      ?auto_9510 - PLACE
      ?auto_9512 - PLACE
      ?auto_9513 - HOIST
      ?auto_9514 - SURFACE
      ?auto_9511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9509 ?auto_9510 ) ( SURFACE-AT ?auto_9507 ?auto_9510 ) ( CLEAR ?auto_9507 ) ( IS-CRATE ?auto_9508 ) ( AVAILABLE ?auto_9509 ) ( not ( = ?auto_9512 ?auto_9510 ) ) ( HOIST-AT ?auto_9513 ?auto_9512 ) ( AVAILABLE ?auto_9513 ) ( SURFACE-AT ?auto_9508 ?auto_9512 ) ( ON ?auto_9508 ?auto_9514 ) ( CLEAR ?auto_9508 ) ( TRUCK-AT ?auto_9511 ?auto_9510 ) ( not ( = ?auto_9507 ?auto_9508 ) ) ( not ( = ?auto_9507 ?auto_9514 ) ) ( not ( = ?auto_9508 ?auto_9514 ) ) ( not ( = ?auto_9509 ?auto_9513 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9511 ?auto_9510 ?auto_9512 )
      ( !LIFT ?auto_9513 ?auto_9508 ?auto_9514 ?auto_9512 )
      ( !LOAD ?auto_9513 ?auto_9508 ?auto_9511 ?auto_9512 )
      ( !DRIVE ?auto_9511 ?auto_9512 ?auto_9510 )
      ( !UNLOAD ?auto_9509 ?auto_9508 ?auto_9511 ?auto_9510 )
      ( !DROP ?auto_9509 ?auto_9508 ?auto_9507 ?auto_9510 )
      ( MAKE-1CRATE-VERIFY ?auto_9507 ?auto_9508 ) )
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
      ?auto_9526 - HOIST
      ?auto_9521 - PLACE
      ?auto_9523 - PLACE
      ?auto_9525 - HOIST
      ?auto_9524 - SURFACE
      ?auto_9528 - PLACE
      ?auto_9527 - HOIST
      ?auto_9529 - SURFACE
      ?auto_9522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9526 ?auto_9521 ) ( IS-CRATE ?auto_9520 ) ( not ( = ?auto_9523 ?auto_9521 ) ) ( HOIST-AT ?auto_9525 ?auto_9523 ) ( AVAILABLE ?auto_9525 ) ( SURFACE-AT ?auto_9520 ?auto_9523 ) ( ON ?auto_9520 ?auto_9524 ) ( CLEAR ?auto_9520 ) ( not ( = ?auto_9519 ?auto_9520 ) ) ( not ( = ?auto_9519 ?auto_9524 ) ) ( not ( = ?auto_9520 ?auto_9524 ) ) ( not ( = ?auto_9526 ?auto_9525 ) ) ( SURFACE-AT ?auto_9518 ?auto_9521 ) ( CLEAR ?auto_9518 ) ( IS-CRATE ?auto_9519 ) ( AVAILABLE ?auto_9526 ) ( not ( = ?auto_9528 ?auto_9521 ) ) ( HOIST-AT ?auto_9527 ?auto_9528 ) ( AVAILABLE ?auto_9527 ) ( SURFACE-AT ?auto_9519 ?auto_9528 ) ( ON ?auto_9519 ?auto_9529 ) ( CLEAR ?auto_9519 ) ( TRUCK-AT ?auto_9522 ?auto_9521 ) ( not ( = ?auto_9518 ?auto_9519 ) ) ( not ( = ?auto_9518 ?auto_9529 ) ) ( not ( = ?auto_9519 ?auto_9529 ) ) ( not ( = ?auto_9526 ?auto_9527 ) ) ( not ( = ?auto_9518 ?auto_9520 ) ) ( not ( = ?auto_9518 ?auto_9524 ) ) ( not ( = ?auto_9520 ?auto_9529 ) ) ( not ( = ?auto_9523 ?auto_9528 ) ) ( not ( = ?auto_9525 ?auto_9527 ) ) ( not ( = ?auto_9524 ?auto_9529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9518 ?auto_9519 )
      ( MAKE-1CRATE ?auto_9519 ?auto_9520 )
      ( MAKE-2CRATE-VERIFY ?auto_9518 ?auto_9519 ?auto_9520 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9532 - SURFACE
      ?auto_9533 - SURFACE
    )
    :vars
    (
      ?auto_9534 - HOIST
      ?auto_9535 - PLACE
      ?auto_9537 - PLACE
      ?auto_9538 - HOIST
      ?auto_9539 - SURFACE
      ?auto_9536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9534 ?auto_9535 ) ( SURFACE-AT ?auto_9532 ?auto_9535 ) ( CLEAR ?auto_9532 ) ( IS-CRATE ?auto_9533 ) ( AVAILABLE ?auto_9534 ) ( not ( = ?auto_9537 ?auto_9535 ) ) ( HOIST-AT ?auto_9538 ?auto_9537 ) ( AVAILABLE ?auto_9538 ) ( SURFACE-AT ?auto_9533 ?auto_9537 ) ( ON ?auto_9533 ?auto_9539 ) ( CLEAR ?auto_9533 ) ( TRUCK-AT ?auto_9536 ?auto_9535 ) ( not ( = ?auto_9532 ?auto_9533 ) ) ( not ( = ?auto_9532 ?auto_9539 ) ) ( not ( = ?auto_9533 ?auto_9539 ) ) ( not ( = ?auto_9534 ?auto_9538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9536 ?auto_9535 ?auto_9537 )
      ( !LIFT ?auto_9538 ?auto_9533 ?auto_9539 ?auto_9537 )
      ( !LOAD ?auto_9538 ?auto_9533 ?auto_9536 ?auto_9537 )
      ( !DRIVE ?auto_9536 ?auto_9537 ?auto_9535 )
      ( !UNLOAD ?auto_9534 ?auto_9533 ?auto_9536 ?auto_9535 )
      ( !DROP ?auto_9534 ?auto_9533 ?auto_9532 ?auto_9535 )
      ( MAKE-1CRATE-VERIFY ?auto_9532 ?auto_9533 ) )
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
      ?auto_9551 - PLACE
      ?auto_9550 - PLACE
      ?auto_9553 - HOIST
      ?auto_9552 - SURFACE
      ?auto_9558 - PLACE
      ?auto_9554 - HOIST
      ?auto_9559 - SURFACE
      ?auto_9555 - PLACE
      ?auto_9557 - HOIST
      ?auto_9556 - SURFACE
      ?auto_9549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9548 ?auto_9551 ) ( IS-CRATE ?auto_9547 ) ( not ( = ?auto_9550 ?auto_9551 ) ) ( HOIST-AT ?auto_9553 ?auto_9550 ) ( AVAILABLE ?auto_9553 ) ( SURFACE-AT ?auto_9547 ?auto_9550 ) ( ON ?auto_9547 ?auto_9552 ) ( CLEAR ?auto_9547 ) ( not ( = ?auto_9546 ?auto_9547 ) ) ( not ( = ?auto_9546 ?auto_9552 ) ) ( not ( = ?auto_9547 ?auto_9552 ) ) ( not ( = ?auto_9548 ?auto_9553 ) ) ( IS-CRATE ?auto_9546 ) ( not ( = ?auto_9558 ?auto_9551 ) ) ( HOIST-AT ?auto_9554 ?auto_9558 ) ( AVAILABLE ?auto_9554 ) ( SURFACE-AT ?auto_9546 ?auto_9558 ) ( ON ?auto_9546 ?auto_9559 ) ( CLEAR ?auto_9546 ) ( not ( = ?auto_9545 ?auto_9546 ) ) ( not ( = ?auto_9545 ?auto_9559 ) ) ( not ( = ?auto_9546 ?auto_9559 ) ) ( not ( = ?auto_9548 ?auto_9554 ) ) ( SURFACE-AT ?auto_9544 ?auto_9551 ) ( CLEAR ?auto_9544 ) ( IS-CRATE ?auto_9545 ) ( AVAILABLE ?auto_9548 ) ( not ( = ?auto_9555 ?auto_9551 ) ) ( HOIST-AT ?auto_9557 ?auto_9555 ) ( AVAILABLE ?auto_9557 ) ( SURFACE-AT ?auto_9545 ?auto_9555 ) ( ON ?auto_9545 ?auto_9556 ) ( CLEAR ?auto_9545 ) ( TRUCK-AT ?auto_9549 ?auto_9551 ) ( not ( = ?auto_9544 ?auto_9545 ) ) ( not ( = ?auto_9544 ?auto_9556 ) ) ( not ( = ?auto_9545 ?auto_9556 ) ) ( not ( = ?auto_9548 ?auto_9557 ) ) ( not ( = ?auto_9544 ?auto_9546 ) ) ( not ( = ?auto_9544 ?auto_9559 ) ) ( not ( = ?auto_9546 ?auto_9556 ) ) ( not ( = ?auto_9558 ?auto_9555 ) ) ( not ( = ?auto_9554 ?auto_9557 ) ) ( not ( = ?auto_9559 ?auto_9556 ) ) ( not ( = ?auto_9544 ?auto_9547 ) ) ( not ( = ?auto_9544 ?auto_9552 ) ) ( not ( = ?auto_9545 ?auto_9547 ) ) ( not ( = ?auto_9545 ?auto_9552 ) ) ( not ( = ?auto_9547 ?auto_9559 ) ) ( not ( = ?auto_9547 ?auto_9556 ) ) ( not ( = ?auto_9550 ?auto_9558 ) ) ( not ( = ?auto_9550 ?auto_9555 ) ) ( not ( = ?auto_9553 ?auto_9554 ) ) ( not ( = ?auto_9553 ?auto_9557 ) ) ( not ( = ?auto_9552 ?auto_9559 ) ) ( not ( = ?auto_9552 ?auto_9556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9544 ?auto_9545 ?auto_9546 )
      ( MAKE-1CRATE ?auto_9546 ?auto_9547 )
      ( MAKE-3CRATE-VERIFY ?auto_9544 ?auto_9545 ?auto_9546 ?auto_9547 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9562 - SURFACE
      ?auto_9563 - SURFACE
    )
    :vars
    (
      ?auto_9564 - HOIST
      ?auto_9565 - PLACE
      ?auto_9567 - PLACE
      ?auto_9568 - HOIST
      ?auto_9569 - SURFACE
      ?auto_9566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9564 ?auto_9565 ) ( SURFACE-AT ?auto_9562 ?auto_9565 ) ( CLEAR ?auto_9562 ) ( IS-CRATE ?auto_9563 ) ( AVAILABLE ?auto_9564 ) ( not ( = ?auto_9567 ?auto_9565 ) ) ( HOIST-AT ?auto_9568 ?auto_9567 ) ( AVAILABLE ?auto_9568 ) ( SURFACE-AT ?auto_9563 ?auto_9567 ) ( ON ?auto_9563 ?auto_9569 ) ( CLEAR ?auto_9563 ) ( TRUCK-AT ?auto_9566 ?auto_9565 ) ( not ( = ?auto_9562 ?auto_9563 ) ) ( not ( = ?auto_9562 ?auto_9569 ) ) ( not ( = ?auto_9563 ?auto_9569 ) ) ( not ( = ?auto_9564 ?auto_9568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9566 ?auto_9565 ?auto_9567 )
      ( !LIFT ?auto_9568 ?auto_9563 ?auto_9569 ?auto_9567 )
      ( !LOAD ?auto_9568 ?auto_9563 ?auto_9566 ?auto_9567 )
      ( !DRIVE ?auto_9566 ?auto_9567 ?auto_9565 )
      ( !UNLOAD ?auto_9564 ?auto_9563 ?auto_9566 ?auto_9565 )
      ( !DROP ?auto_9564 ?auto_9563 ?auto_9562 ?auto_9565 )
      ( MAKE-1CRATE-VERIFY ?auto_9562 ?auto_9563 ) )
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
      ?auto_9585 - HOIST
      ?auto_9584 - PLACE
      ?auto_9580 - PLACE
      ?auto_9582 - HOIST
      ?auto_9581 - SURFACE
      ?auto_9589 - PLACE
      ?auto_9592 - HOIST
      ?auto_9586 - SURFACE
      ?auto_9591 - PLACE
      ?auto_9587 - HOIST
      ?auto_9594 - SURFACE
      ?auto_9588 - PLACE
      ?auto_9593 - HOIST
      ?auto_9590 - SURFACE
      ?auto_9583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9585 ?auto_9584 ) ( IS-CRATE ?auto_9579 ) ( not ( = ?auto_9580 ?auto_9584 ) ) ( HOIST-AT ?auto_9582 ?auto_9580 ) ( AVAILABLE ?auto_9582 ) ( SURFACE-AT ?auto_9579 ?auto_9580 ) ( ON ?auto_9579 ?auto_9581 ) ( CLEAR ?auto_9579 ) ( not ( = ?auto_9578 ?auto_9579 ) ) ( not ( = ?auto_9578 ?auto_9581 ) ) ( not ( = ?auto_9579 ?auto_9581 ) ) ( not ( = ?auto_9585 ?auto_9582 ) ) ( IS-CRATE ?auto_9578 ) ( not ( = ?auto_9589 ?auto_9584 ) ) ( HOIST-AT ?auto_9592 ?auto_9589 ) ( AVAILABLE ?auto_9592 ) ( SURFACE-AT ?auto_9578 ?auto_9589 ) ( ON ?auto_9578 ?auto_9586 ) ( CLEAR ?auto_9578 ) ( not ( = ?auto_9577 ?auto_9578 ) ) ( not ( = ?auto_9577 ?auto_9586 ) ) ( not ( = ?auto_9578 ?auto_9586 ) ) ( not ( = ?auto_9585 ?auto_9592 ) ) ( IS-CRATE ?auto_9577 ) ( not ( = ?auto_9591 ?auto_9584 ) ) ( HOIST-AT ?auto_9587 ?auto_9591 ) ( AVAILABLE ?auto_9587 ) ( SURFACE-AT ?auto_9577 ?auto_9591 ) ( ON ?auto_9577 ?auto_9594 ) ( CLEAR ?auto_9577 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9576 ?auto_9594 ) ) ( not ( = ?auto_9577 ?auto_9594 ) ) ( not ( = ?auto_9585 ?auto_9587 ) ) ( SURFACE-AT ?auto_9575 ?auto_9584 ) ( CLEAR ?auto_9575 ) ( IS-CRATE ?auto_9576 ) ( AVAILABLE ?auto_9585 ) ( not ( = ?auto_9588 ?auto_9584 ) ) ( HOIST-AT ?auto_9593 ?auto_9588 ) ( AVAILABLE ?auto_9593 ) ( SURFACE-AT ?auto_9576 ?auto_9588 ) ( ON ?auto_9576 ?auto_9590 ) ( CLEAR ?auto_9576 ) ( TRUCK-AT ?auto_9583 ?auto_9584 ) ( not ( = ?auto_9575 ?auto_9576 ) ) ( not ( = ?auto_9575 ?auto_9590 ) ) ( not ( = ?auto_9576 ?auto_9590 ) ) ( not ( = ?auto_9585 ?auto_9593 ) ) ( not ( = ?auto_9575 ?auto_9577 ) ) ( not ( = ?auto_9575 ?auto_9594 ) ) ( not ( = ?auto_9577 ?auto_9590 ) ) ( not ( = ?auto_9591 ?auto_9588 ) ) ( not ( = ?auto_9587 ?auto_9593 ) ) ( not ( = ?auto_9594 ?auto_9590 ) ) ( not ( = ?auto_9575 ?auto_9578 ) ) ( not ( = ?auto_9575 ?auto_9586 ) ) ( not ( = ?auto_9576 ?auto_9578 ) ) ( not ( = ?auto_9576 ?auto_9586 ) ) ( not ( = ?auto_9578 ?auto_9594 ) ) ( not ( = ?auto_9578 ?auto_9590 ) ) ( not ( = ?auto_9589 ?auto_9591 ) ) ( not ( = ?auto_9589 ?auto_9588 ) ) ( not ( = ?auto_9592 ?auto_9587 ) ) ( not ( = ?auto_9592 ?auto_9593 ) ) ( not ( = ?auto_9586 ?auto_9594 ) ) ( not ( = ?auto_9586 ?auto_9590 ) ) ( not ( = ?auto_9575 ?auto_9579 ) ) ( not ( = ?auto_9575 ?auto_9581 ) ) ( not ( = ?auto_9576 ?auto_9579 ) ) ( not ( = ?auto_9576 ?auto_9581 ) ) ( not ( = ?auto_9577 ?auto_9579 ) ) ( not ( = ?auto_9577 ?auto_9581 ) ) ( not ( = ?auto_9579 ?auto_9586 ) ) ( not ( = ?auto_9579 ?auto_9594 ) ) ( not ( = ?auto_9579 ?auto_9590 ) ) ( not ( = ?auto_9580 ?auto_9589 ) ) ( not ( = ?auto_9580 ?auto_9591 ) ) ( not ( = ?auto_9580 ?auto_9588 ) ) ( not ( = ?auto_9582 ?auto_9592 ) ) ( not ( = ?auto_9582 ?auto_9587 ) ) ( not ( = ?auto_9582 ?auto_9593 ) ) ( not ( = ?auto_9581 ?auto_9586 ) ) ( not ( = ?auto_9581 ?auto_9594 ) ) ( not ( = ?auto_9581 ?auto_9590 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9575 ?auto_9576 ?auto_9577 ?auto_9578 )
      ( MAKE-1CRATE ?auto_9578 ?auto_9579 )
      ( MAKE-4CRATE-VERIFY ?auto_9575 ?auto_9576 ?auto_9577 ?auto_9578 ?auto_9579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9597 - SURFACE
      ?auto_9598 - SURFACE
    )
    :vars
    (
      ?auto_9599 - HOIST
      ?auto_9600 - PLACE
      ?auto_9602 - PLACE
      ?auto_9603 - HOIST
      ?auto_9604 - SURFACE
      ?auto_9601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9599 ?auto_9600 ) ( SURFACE-AT ?auto_9597 ?auto_9600 ) ( CLEAR ?auto_9597 ) ( IS-CRATE ?auto_9598 ) ( AVAILABLE ?auto_9599 ) ( not ( = ?auto_9602 ?auto_9600 ) ) ( HOIST-AT ?auto_9603 ?auto_9602 ) ( AVAILABLE ?auto_9603 ) ( SURFACE-AT ?auto_9598 ?auto_9602 ) ( ON ?auto_9598 ?auto_9604 ) ( CLEAR ?auto_9598 ) ( TRUCK-AT ?auto_9601 ?auto_9600 ) ( not ( = ?auto_9597 ?auto_9598 ) ) ( not ( = ?auto_9597 ?auto_9604 ) ) ( not ( = ?auto_9598 ?auto_9604 ) ) ( not ( = ?auto_9599 ?auto_9603 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9601 ?auto_9600 ?auto_9602 )
      ( !LIFT ?auto_9603 ?auto_9598 ?auto_9604 ?auto_9602 )
      ( !LOAD ?auto_9603 ?auto_9598 ?auto_9601 ?auto_9602 )
      ( !DRIVE ?auto_9601 ?auto_9602 ?auto_9600 )
      ( !UNLOAD ?auto_9599 ?auto_9598 ?auto_9601 ?auto_9600 )
      ( !DROP ?auto_9599 ?auto_9598 ?auto_9597 ?auto_9600 )
      ( MAKE-1CRATE-VERIFY ?auto_9597 ?auto_9598 ) )
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
      ?auto_9617 - HOIST
      ?auto_9618 - PLACE
      ?auto_9621 - PLACE
      ?auto_9620 - HOIST
      ?auto_9619 - SURFACE
      ?auto_9629 - PLACE
      ?auto_9633 - HOIST
      ?auto_9623 - SURFACE
      ?auto_9631 - PLACE
      ?auto_9634 - HOIST
      ?auto_9626 - SURFACE
      ?auto_9625 - PLACE
      ?auto_9632 - HOIST
      ?auto_9628 - SURFACE
      ?auto_9627 - PLACE
      ?auto_9630 - HOIST
      ?auto_9624 - SURFACE
      ?auto_9622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9617 ?auto_9618 ) ( IS-CRATE ?auto_9616 ) ( not ( = ?auto_9621 ?auto_9618 ) ) ( HOIST-AT ?auto_9620 ?auto_9621 ) ( AVAILABLE ?auto_9620 ) ( SURFACE-AT ?auto_9616 ?auto_9621 ) ( ON ?auto_9616 ?auto_9619 ) ( CLEAR ?auto_9616 ) ( not ( = ?auto_9615 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9619 ) ) ( not ( = ?auto_9616 ?auto_9619 ) ) ( not ( = ?auto_9617 ?auto_9620 ) ) ( IS-CRATE ?auto_9615 ) ( not ( = ?auto_9629 ?auto_9618 ) ) ( HOIST-AT ?auto_9633 ?auto_9629 ) ( AVAILABLE ?auto_9633 ) ( SURFACE-AT ?auto_9615 ?auto_9629 ) ( ON ?auto_9615 ?auto_9623 ) ( CLEAR ?auto_9615 ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9623 ) ) ( not ( = ?auto_9615 ?auto_9623 ) ) ( not ( = ?auto_9617 ?auto_9633 ) ) ( IS-CRATE ?auto_9614 ) ( not ( = ?auto_9631 ?auto_9618 ) ) ( HOIST-AT ?auto_9634 ?auto_9631 ) ( AVAILABLE ?auto_9634 ) ( SURFACE-AT ?auto_9614 ?auto_9631 ) ( ON ?auto_9614 ?auto_9626 ) ( CLEAR ?auto_9614 ) ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9613 ?auto_9626 ) ) ( not ( = ?auto_9614 ?auto_9626 ) ) ( not ( = ?auto_9617 ?auto_9634 ) ) ( IS-CRATE ?auto_9613 ) ( not ( = ?auto_9625 ?auto_9618 ) ) ( HOIST-AT ?auto_9632 ?auto_9625 ) ( AVAILABLE ?auto_9632 ) ( SURFACE-AT ?auto_9613 ?auto_9625 ) ( ON ?auto_9613 ?auto_9628 ) ( CLEAR ?auto_9613 ) ( not ( = ?auto_9612 ?auto_9613 ) ) ( not ( = ?auto_9612 ?auto_9628 ) ) ( not ( = ?auto_9613 ?auto_9628 ) ) ( not ( = ?auto_9617 ?auto_9632 ) ) ( SURFACE-AT ?auto_9611 ?auto_9618 ) ( CLEAR ?auto_9611 ) ( IS-CRATE ?auto_9612 ) ( AVAILABLE ?auto_9617 ) ( not ( = ?auto_9627 ?auto_9618 ) ) ( HOIST-AT ?auto_9630 ?auto_9627 ) ( AVAILABLE ?auto_9630 ) ( SURFACE-AT ?auto_9612 ?auto_9627 ) ( ON ?auto_9612 ?auto_9624 ) ( CLEAR ?auto_9612 ) ( TRUCK-AT ?auto_9622 ?auto_9618 ) ( not ( = ?auto_9611 ?auto_9612 ) ) ( not ( = ?auto_9611 ?auto_9624 ) ) ( not ( = ?auto_9612 ?auto_9624 ) ) ( not ( = ?auto_9617 ?auto_9630 ) ) ( not ( = ?auto_9611 ?auto_9613 ) ) ( not ( = ?auto_9611 ?auto_9628 ) ) ( not ( = ?auto_9613 ?auto_9624 ) ) ( not ( = ?auto_9625 ?auto_9627 ) ) ( not ( = ?auto_9632 ?auto_9630 ) ) ( not ( = ?auto_9628 ?auto_9624 ) ) ( not ( = ?auto_9611 ?auto_9614 ) ) ( not ( = ?auto_9611 ?auto_9626 ) ) ( not ( = ?auto_9612 ?auto_9614 ) ) ( not ( = ?auto_9612 ?auto_9626 ) ) ( not ( = ?auto_9614 ?auto_9628 ) ) ( not ( = ?auto_9614 ?auto_9624 ) ) ( not ( = ?auto_9631 ?auto_9625 ) ) ( not ( = ?auto_9631 ?auto_9627 ) ) ( not ( = ?auto_9634 ?auto_9632 ) ) ( not ( = ?auto_9634 ?auto_9630 ) ) ( not ( = ?auto_9626 ?auto_9628 ) ) ( not ( = ?auto_9626 ?auto_9624 ) ) ( not ( = ?auto_9611 ?auto_9615 ) ) ( not ( = ?auto_9611 ?auto_9623 ) ) ( not ( = ?auto_9612 ?auto_9615 ) ) ( not ( = ?auto_9612 ?auto_9623 ) ) ( not ( = ?auto_9613 ?auto_9615 ) ) ( not ( = ?auto_9613 ?auto_9623 ) ) ( not ( = ?auto_9615 ?auto_9626 ) ) ( not ( = ?auto_9615 ?auto_9628 ) ) ( not ( = ?auto_9615 ?auto_9624 ) ) ( not ( = ?auto_9629 ?auto_9631 ) ) ( not ( = ?auto_9629 ?auto_9625 ) ) ( not ( = ?auto_9629 ?auto_9627 ) ) ( not ( = ?auto_9633 ?auto_9634 ) ) ( not ( = ?auto_9633 ?auto_9632 ) ) ( not ( = ?auto_9633 ?auto_9630 ) ) ( not ( = ?auto_9623 ?auto_9626 ) ) ( not ( = ?auto_9623 ?auto_9628 ) ) ( not ( = ?auto_9623 ?auto_9624 ) ) ( not ( = ?auto_9611 ?auto_9616 ) ) ( not ( = ?auto_9611 ?auto_9619 ) ) ( not ( = ?auto_9612 ?auto_9616 ) ) ( not ( = ?auto_9612 ?auto_9619 ) ) ( not ( = ?auto_9613 ?auto_9616 ) ) ( not ( = ?auto_9613 ?auto_9619 ) ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9619 ) ) ( not ( = ?auto_9616 ?auto_9623 ) ) ( not ( = ?auto_9616 ?auto_9626 ) ) ( not ( = ?auto_9616 ?auto_9628 ) ) ( not ( = ?auto_9616 ?auto_9624 ) ) ( not ( = ?auto_9621 ?auto_9629 ) ) ( not ( = ?auto_9621 ?auto_9631 ) ) ( not ( = ?auto_9621 ?auto_9625 ) ) ( not ( = ?auto_9621 ?auto_9627 ) ) ( not ( = ?auto_9620 ?auto_9633 ) ) ( not ( = ?auto_9620 ?auto_9634 ) ) ( not ( = ?auto_9620 ?auto_9632 ) ) ( not ( = ?auto_9620 ?auto_9630 ) ) ( not ( = ?auto_9619 ?auto_9623 ) ) ( not ( = ?auto_9619 ?auto_9626 ) ) ( not ( = ?auto_9619 ?auto_9628 ) ) ( not ( = ?auto_9619 ?auto_9624 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 )
      ( MAKE-1CRATE ?auto_9615 ?auto_9616 )
      ( MAKE-5CRATE-VERIFY ?auto_9611 ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 ?auto_9616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9637 - SURFACE
      ?auto_9638 - SURFACE
    )
    :vars
    (
      ?auto_9639 - HOIST
      ?auto_9640 - PLACE
      ?auto_9642 - PLACE
      ?auto_9643 - HOIST
      ?auto_9644 - SURFACE
      ?auto_9641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9639 ?auto_9640 ) ( SURFACE-AT ?auto_9637 ?auto_9640 ) ( CLEAR ?auto_9637 ) ( IS-CRATE ?auto_9638 ) ( AVAILABLE ?auto_9639 ) ( not ( = ?auto_9642 ?auto_9640 ) ) ( HOIST-AT ?auto_9643 ?auto_9642 ) ( AVAILABLE ?auto_9643 ) ( SURFACE-AT ?auto_9638 ?auto_9642 ) ( ON ?auto_9638 ?auto_9644 ) ( CLEAR ?auto_9638 ) ( TRUCK-AT ?auto_9641 ?auto_9640 ) ( not ( = ?auto_9637 ?auto_9638 ) ) ( not ( = ?auto_9637 ?auto_9644 ) ) ( not ( = ?auto_9638 ?auto_9644 ) ) ( not ( = ?auto_9639 ?auto_9643 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9641 ?auto_9640 ?auto_9642 )
      ( !LIFT ?auto_9643 ?auto_9638 ?auto_9644 ?auto_9642 )
      ( !LOAD ?auto_9643 ?auto_9638 ?auto_9641 ?auto_9642 )
      ( !DRIVE ?auto_9641 ?auto_9642 ?auto_9640 )
      ( !UNLOAD ?auto_9639 ?auto_9638 ?auto_9641 ?auto_9640 )
      ( !DROP ?auto_9639 ?auto_9638 ?auto_9637 ?auto_9640 )
      ( MAKE-1CRATE-VERIFY ?auto_9637 ?auto_9638 ) )
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
      ?auto_9664 - PLACE
      ?auto_9660 - PLACE
      ?auto_9662 - HOIST
      ?auto_9659 - SURFACE
      ?auto_9673 - PLACE
      ?auto_9665 - HOIST
      ?auto_9666 - SURFACE
      ?auto_9677 - PLACE
      ?auto_9669 - HOIST
      ?auto_9675 - SURFACE
      ?auto_9672 - PLACE
      ?auto_9668 - HOIST
      ?auto_9671 - SURFACE
      ?auto_9667 - PLACE
      ?auto_9676 - HOIST
      ?auto_9678 - SURFACE
      ?auto_9679 - PLACE
      ?auto_9670 - HOIST
      ?auto_9674 - SURFACE
      ?auto_9661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9663 ?auto_9664 ) ( IS-CRATE ?auto_9658 ) ( not ( = ?auto_9660 ?auto_9664 ) ) ( HOIST-AT ?auto_9662 ?auto_9660 ) ( AVAILABLE ?auto_9662 ) ( SURFACE-AT ?auto_9658 ?auto_9660 ) ( ON ?auto_9658 ?auto_9659 ) ( CLEAR ?auto_9658 ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( not ( = ?auto_9663 ?auto_9662 ) ) ( IS-CRATE ?auto_9657 ) ( not ( = ?auto_9673 ?auto_9664 ) ) ( HOIST-AT ?auto_9665 ?auto_9673 ) ( AVAILABLE ?auto_9665 ) ( SURFACE-AT ?auto_9657 ?auto_9673 ) ( ON ?auto_9657 ?auto_9666 ) ( CLEAR ?auto_9657 ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9666 ) ) ( not ( = ?auto_9657 ?auto_9666 ) ) ( not ( = ?auto_9663 ?auto_9665 ) ) ( IS-CRATE ?auto_9656 ) ( not ( = ?auto_9677 ?auto_9664 ) ) ( HOIST-AT ?auto_9669 ?auto_9677 ) ( AVAILABLE ?auto_9669 ) ( SURFACE-AT ?auto_9656 ?auto_9677 ) ( ON ?auto_9656 ?auto_9675 ) ( CLEAR ?auto_9656 ) ( not ( = ?auto_9655 ?auto_9656 ) ) ( not ( = ?auto_9655 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9675 ) ) ( not ( = ?auto_9663 ?auto_9669 ) ) ( IS-CRATE ?auto_9655 ) ( not ( = ?auto_9672 ?auto_9664 ) ) ( HOIST-AT ?auto_9668 ?auto_9672 ) ( AVAILABLE ?auto_9668 ) ( SURFACE-AT ?auto_9655 ?auto_9672 ) ( ON ?auto_9655 ?auto_9671 ) ( CLEAR ?auto_9655 ) ( not ( = ?auto_9654 ?auto_9655 ) ) ( not ( = ?auto_9654 ?auto_9671 ) ) ( not ( = ?auto_9655 ?auto_9671 ) ) ( not ( = ?auto_9663 ?auto_9668 ) ) ( IS-CRATE ?auto_9654 ) ( not ( = ?auto_9667 ?auto_9664 ) ) ( HOIST-AT ?auto_9676 ?auto_9667 ) ( AVAILABLE ?auto_9676 ) ( SURFACE-AT ?auto_9654 ?auto_9667 ) ( ON ?auto_9654 ?auto_9678 ) ( CLEAR ?auto_9654 ) ( not ( = ?auto_9653 ?auto_9654 ) ) ( not ( = ?auto_9653 ?auto_9678 ) ) ( not ( = ?auto_9654 ?auto_9678 ) ) ( not ( = ?auto_9663 ?auto_9676 ) ) ( SURFACE-AT ?auto_9652 ?auto_9664 ) ( CLEAR ?auto_9652 ) ( IS-CRATE ?auto_9653 ) ( AVAILABLE ?auto_9663 ) ( not ( = ?auto_9679 ?auto_9664 ) ) ( HOIST-AT ?auto_9670 ?auto_9679 ) ( AVAILABLE ?auto_9670 ) ( SURFACE-AT ?auto_9653 ?auto_9679 ) ( ON ?auto_9653 ?auto_9674 ) ( CLEAR ?auto_9653 ) ( TRUCK-AT ?auto_9661 ?auto_9664 ) ( not ( = ?auto_9652 ?auto_9653 ) ) ( not ( = ?auto_9652 ?auto_9674 ) ) ( not ( = ?auto_9653 ?auto_9674 ) ) ( not ( = ?auto_9663 ?auto_9670 ) ) ( not ( = ?auto_9652 ?auto_9654 ) ) ( not ( = ?auto_9652 ?auto_9678 ) ) ( not ( = ?auto_9654 ?auto_9674 ) ) ( not ( = ?auto_9667 ?auto_9679 ) ) ( not ( = ?auto_9676 ?auto_9670 ) ) ( not ( = ?auto_9678 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9655 ) ) ( not ( = ?auto_9652 ?auto_9671 ) ) ( not ( = ?auto_9653 ?auto_9655 ) ) ( not ( = ?auto_9653 ?auto_9671 ) ) ( not ( = ?auto_9655 ?auto_9678 ) ) ( not ( = ?auto_9655 ?auto_9674 ) ) ( not ( = ?auto_9672 ?auto_9667 ) ) ( not ( = ?auto_9672 ?auto_9679 ) ) ( not ( = ?auto_9668 ?auto_9676 ) ) ( not ( = ?auto_9668 ?auto_9670 ) ) ( not ( = ?auto_9671 ?auto_9678 ) ) ( not ( = ?auto_9671 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9656 ) ) ( not ( = ?auto_9652 ?auto_9675 ) ) ( not ( = ?auto_9653 ?auto_9656 ) ) ( not ( = ?auto_9653 ?auto_9675 ) ) ( not ( = ?auto_9654 ?auto_9656 ) ) ( not ( = ?auto_9654 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9671 ) ) ( not ( = ?auto_9656 ?auto_9678 ) ) ( not ( = ?auto_9656 ?auto_9674 ) ) ( not ( = ?auto_9677 ?auto_9672 ) ) ( not ( = ?auto_9677 ?auto_9667 ) ) ( not ( = ?auto_9677 ?auto_9679 ) ) ( not ( = ?auto_9669 ?auto_9668 ) ) ( not ( = ?auto_9669 ?auto_9676 ) ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( not ( = ?auto_9675 ?auto_9671 ) ) ( not ( = ?auto_9675 ?auto_9678 ) ) ( not ( = ?auto_9675 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9657 ) ) ( not ( = ?auto_9652 ?auto_9666 ) ) ( not ( = ?auto_9653 ?auto_9657 ) ) ( not ( = ?auto_9653 ?auto_9666 ) ) ( not ( = ?auto_9654 ?auto_9657 ) ) ( not ( = ?auto_9654 ?auto_9666 ) ) ( not ( = ?auto_9655 ?auto_9657 ) ) ( not ( = ?auto_9655 ?auto_9666 ) ) ( not ( = ?auto_9657 ?auto_9675 ) ) ( not ( = ?auto_9657 ?auto_9671 ) ) ( not ( = ?auto_9657 ?auto_9678 ) ) ( not ( = ?auto_9657 ?auto_9674 ) ) ( not ( = ?auto_9673 ?auto_9677 ) ) ( not ( = ?auto_9673 ?auto_9672 ) ) ( not ( = ?auto_9673 ?auto_9667 ) ) ( not ( = ?auto_9673 ?auto_9679 ) ) ( not ( = ?auto_9665 ?auto_9669 ) ) ( not ( = ?auto_9665 ?auto_9668 ) ) ( not ( = ?auto_9665 ?auto_9676 ) ) ( not ( = ?auto_9665 ?auto_9670 ) ) ( not ( = ?auto_9666 ?auto_9675 ) ) ( not ( = ?auto_9666 ?auto_9671 ) ) ( not ( = ?auto_9666 ?auto_9678 ) ) ( not ( = ?auto_9666 ?auto_9674 ) ) ( not ( = ?auto_9652 ?auto_9658 ) ) ( not ( = ?auto_9652 ?auto_9659 ) ) ( not ( = ?auto_9653 ?auto_9658 ) ) ( not ( = ?auto_9653 ?auto_9659 ) ) ( not ( = ?auto_9654 ?auto_9658 ) ) ( not ( = ?auto_9654 ?auto_9659 ) ) ( not ( = ?auto_9655 ?auto_9658 ) ) ( not ( = ?auto_9655 ?auto_9659 ) ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( not ( = ?auto_9656 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9666 ) ) ( not ( = ?auto_9658 ?auto_9675 ) ) ( not ( = ?auto_9658 ?auto_9671 ) ) ( not ( = ?auto_9658 ?auto_9678 ) ) ( not ( = ?auto_9658 ?auto_9674 ) ) ( not ( = ?auto_9660 ?auto_9673 ) ) ( not ( = ?auto_9660 ?auto_9677 ) ) ( not ( = ?auto_9660 ?auto_9672 ) ) ( not ( = ?auto_9660 ?auto_9667 ) ) ( not ( = ?auto_9660 ?auto_9679 ) ) ( not ( = ?auto_9662 ?auto_9665 ) ) ( not ( = ?auto_9662 ?auto_9669 ) ) ( not ( = ?auto_9662 ?auto_9668 ) ) ( not ( = ?auto_9662 ?auto_9676 ) ) ( not ( = ?auto_9662 ?auto_9670 ) ) ( not ( = ?auto_9659 ?auto_9666 ) ) ( not ( = ?auto_9659 ?auto_9675 ) ) ( not ( = ?auto_9659 ?auto_9671 ) ) ( not ( = ?auto_9659 ?auto_9678 ) ) ( not ( = ?auto_9659 ?auto_9674 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9652 ?auto_9653 ?auto_9654 ?auto_9655 ?auto_9656 ?auto_9657 )
      ( MAKE-1CRATE ?auto_9657 ?auto_9658 )
      ( MAKE-6CRATE-VERIFY ?auto_9652 ?auto_9653 ?auto_9654 ?auto_9655 ?auto_9656 ?auto_9657 ?auto_9658 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9682 - SURFACE
      ?auto_9683 - SURFACE
    )
    :vars
    (
      ?auto_9684 - HOIST
      ?auto_9685 - PLACE
      ?auto_9687 - PLACE
      ?auto_9688 - HOIST
      ?auto_9689 - SURFACE
      ?auto_9686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9684 ?auto_9685 ) ( SURFACE-AT ?auto_9682 ?auto_9685 ) ( CLEAR ?auto_9682 ) ( IS-CRATE ?auto_9683 ) ( AVAILABLE ?auto_9684 ) ( not ( = ?auto_9687 ?auto_9685 ) ) ( HOIST-AT ?auto_9688 ?auto_9687 ) ( AVAILABLE ?auto_9688 ) ( SURFACE-AT ?auto_9683 ?auto_9687 ) ( ON ?auto_9683 ?auto_9689 ) ( CLEAR ?auto_9683 ) ( TRUCK-AT ?auto_9686 ?auto_9685 ) ( not ( = ?auto_9682 ?auto_9683 ) ) ( not ( = ?auto_9682 ?auto_9689 ) ) ( not ( = ?auto_9683 ?auto_9689 ) ) ( not ( = ?auto_9684 ?auto_9688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9686 ?auto_9685 ?auto_9687 )
      ( !LIFT ?auto_9688 ?auto_9683 ?auto_9689 ?auto_9687 )
      ( !LOAD ?auto_9688 ?auto_9683 ?auto_9686 ?auto_9687 )
      ( !DRIVE ?auto_9686 ?auto_9687 ?auto_9685 )
      ( !UNLOAD ?auto_9684 ?auto_9683 ?auto_9686 ?auto_9685 )
      ( !DROP ?auto_9684 ?auto_9683 ?auto_9682 ?auto_9685 )
      ( MAKE-1CRATE-VERIFY ?auto_9682 ?auto_9683 ) )
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
      ?auto_9707 - PLACE
      ?auto_9708 - PLACE
      ?auto_9706 - HOIST
      ?auto_9710 - SURFACE
      ?auto_9726 - PLACE
      ?auto_9727 - HOIST
      ?auto_9720 - SURFACE
      ?auto_9715 - PLACE
      ?auto_9716 - HOIST
      ?auto_9721 - SURFACE
      ?auto_9725 - PLACE
      ?auto_9713 - HOIST
      ?auto_9714 - SURFACE
      ?auto_9724 - SURFACE
      ?auto_9722 - PLACE
      ?auto_9718 - HOIST
      ?auto_9723 - SURFACE
      ?auto_9719 - PLACE
      ?auto_9712 - HOIST
      ?auto_9717 - SURFACE
      ?auto_9711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9709 ?auto_9707 ) ( IS-CRATE ?auto_9705 ) ( not ( = ?auto_9708 ?auto_9707 ) ) ( HOIST-AT ?auto_9706 ?auto_9708 ) ( SURFACE-AT ?auto_9705 ?auto_9708 ) ( ON ?auto_9705 ?auto_9710 ) ( CLEAR ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( not ( = ?auto_9704 ?auto_9710 ) ) ( not ( = ?auto_9705 ?auto_9710 ) ) ( not ( = ?auto_9709 ?auto_9706 ) ) ( IS-CRATE ?auto_9704 ) ( not ( = ?auto_9726 ?auto_9707 ) ) ( HOIST-AT ?auto_9727 ?auto_9726 ) ( AVAILABLE ?auto_9727 ) ( SURFACE-AT ?auto_9704 ?auto_9726 ) ( ON ?auto_9704 ?auto_9720 ) ( CLEAR ?auto_9704 ) ( not ( = ?auto_9703 ?auto_9704 ) ) ( not ( = ?auto_9703 ?auto_9720 ) ) ( not ( = ?auto_9704 ?auto_9720 ) ) ( not ( = ?auto_9709 ?auto_9727 ) ) ( IS-CRATE ?auto_9703 ) ( not ( = ?auto_9715 ?auto_9707 ) ) ( HOIST-AT ?auto_9716 ?auto_9715 ) ( AVAILABLE ?auto_9716 ) ( SURFACE-AT ?auto_9703 ?auto_9715 ) ( ON ?auto_9703 ?auto_9721 ) ( CLEAR ?auto_9703 ) ( not ( = ?auto_9702 ?auto_9703 ) ) ( not ( = ?auto_9702 ?auto_9721 ) ) ( not ( = ?auto_9703 ?auto_9721 ) ) ( not ( = ?auto_9709 ?auto_9716 ) ) ( IS-CRATE ?auto_9702 ) ( not ( = ?auto_9725 ?auto_9707 ) ) ( HOIST-AT ?auto_9713 ?auto_9725 ) ( AVAILABLE ?auto_9713 ) ( SURFACE-AT ?auto_9702 ?auto_9725 ) ( ON ?auto_9702 ?auto_9714 ) ( CLEAR ?auto_9702 ) ( not ( = ?auto_9701 ?auto_9702 ) ) ( not ( = ?auto_9701 ?auto_9714 ) ) ( not ( = ?auto_9702 ?auto_9714 ) ) ( not ( = ?auto_9709 ?auto_9713 ) ) ( IS-CRATE ?auto_9701 ) ( AVAILABLE ?auto_9706 ) ( SURFACE-AT ?auto_9701 ?auto_9708 ) ( ON ?auto_9701 ?auto_9724 ) ( CLEAR ?auto_9701 ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( not ( = ?auto_9700 ?auto_9724 ) ) ( not ( = ?auto_9701 ?auto_9724 ) ) ( IS-CRATE ?auto_9700 ) ( not ( = ?auto_9722 ?auto_9707 ) ) ( HOIST-AT ?auto_9718 ?auto_9722 ) ( AVAILABLE ?auto_9718 ) ( SURFACE-AT ?auto_9700 ?auto_9722 ) ( ON ?auto_9700 ?auto_9723 ) ( CLEAR ?auto_9700 ) ( not ( = ?auto_9699 ?auto_9700 ) ) ( not ( = ?auto_9699 ?auto_9723 ) ) ( not ( = ?auto_9700 ?auto_9723 ) ) ( not ( = ?auto_9709 ?auto_9718 ) ) ( SURFACE-AT ?auto_9698 ?auto_9707 ) ( CLEAR ?auto_9698 ) ( IS-CRATE ?auto_9699 ) ( AVAILABLE ?auto_9709 ) ( not ( = ?auto_9719 ?auto_9707 ) ) ( HOIST-AT ?auto_9712 ?auto_9719 ) ( AVAILABLE ?auto_9712 ) ( SURFACE-AT ?auto_9699 ?auto_9719 ) ( ON ?auto_9699 ?auto_9717 ) ( CLEAR ?auto_9699 ) ( TRUCK-AT ?auto_9711 ?auto_9707 ) ( not ( = ?auto_9698 ?auto_9699 ) ) ( not ( = ?auto_9698 ?auto_9717 ) ) ( not ( = ?auto_9699 ?auto_9717 ) ) ( not ( = ?auto_9709 ?auto_9712 ) ) ( not ( = ?auto_9698 ?auto_9700 ) ) ( not ( = ?auto_9698 ?auto_9723 ) ) ( not ( = ?auto_9700 ?auto_9717 ) ) ( not ( = ?auto_9722 ?auto_9719 ) ) ( not ( = ?auto_9718 ?auto_9712 ) ) ( not ( = ?auto_9723 ?auto_9717 ) ) ( not ( = ?auto_9698 ?auto_9701 ) ) ( not ( = ?auto_9698 ?auto_9724 ) ) ( not ( = ?auto_9699 ?auto_9701 ) ) ( not ( = ?auto_9699 ?auto_9724 ) ) ( not ( = ?auto_9701 ?auto_9723 ) ) ( not ( = ?auto_9701 ?auto_9717 ) ) ( not ( = ?auto_9708 ?auto_9722 ) ) ( not ( = ?auto_9708 ?auto_9719 ) ) ( not ( = ?auto_9706 ?auto_9718 ) ) ( not ( = ?auto_9706 ?auto_9712 ) ) ( not ( = ?auto_9724 ?auto_9723 ) ) ( not ( = ?auto_9724 ?auto_9717 ) ) ( not ( = ?auto_9698 ?auto_9702 ) ) ( not ( = ?auto_9698 ?auto_9714 ) ) ( not ( = ?auto_9699 ?auto_9702 ) ) ( not ( = ?auto_9699 ?auto_9714 ) ) ( not ( = ?auto_9700 ?auto_9702 ) ) ( not ( = ?auto_9700 ?auto_9714 ) ) ( not ( = ?auto_9702 ?auto_9724 ) ) ( not ( = ?auto_9702 ?auto_9723 ) ) ( not ( = ?auto_9702 ?auto_9717 ) ) ( not ( = ?auto_9725 ?auto_9708 ) ) ( not ( = ?auto_9725 ?auto_9722 ) ) ( not ( = ?auto_9725 ?auto_9719 ) ) ( not ( = ?auto_9713 ?auto_9706 ) ) ( not ( = ?auto_9713 ?auto_9718 ) ) ( not ( = ?auto_9713 ?auto_9712 ) ) ( not ( = ?auto_9714 ?auto_9724 ) ) ( not ( = ?auto_9714 ?auto_9723 ) ) ( not ( = ?auto_9714 ?auto_9717 ) ) ( not ( = ?auto_9698 ?auto_9703 ) ) ( not ( = ?auto_9698 ?auto_9721 ) ) ( not ( = ?auto_9699 ?auto_9703 ) ) ( not ( = ?auto_9699 ?auto_9721 ) ) ( not ( = ?auto_9700 ?auto_9703 ) ) ( not ( = ?auto_9700 ?auto_9721 ) ) ( not ( = ?auto_9701 ?auto_9703 ) ) ( not ( = ?auto_9701 ?auto_9721 ) ) ( not ( = ?auto_9703 ?auto_9714 ) ) ( not ( = ?auto_9703 ?auto_9724 ) ) ( not ( = ?auto_9703 ?auto_9723 ) ) ( not ( = ?auto_9703 ?auto_9717 ) ) ( not ( = ?auto_9715 ?auto_9725 ) ) ( not ( = ?auto_9715 ?auto_9708 ) ) ( not ( = ?auto_9715 ?auto_9722 ) ) ( not ( = ?auto_9715 ?auto_9719 ) ) ( not ( = ?auto_9716 ?auto_9713 ) ) ( not ( = ?auto_9716 ?auto_9706 ) ) ( not ( = ?auto_9716 ?auto_9718 ) ) ( not ( = ?auto_9716 ?auto_9712 ) ) ( not ( = ?auto_9721 ?auto_9714 ) ) ( not ( = ?auto_9721 ?auto_9724 ) ) ( not ( = ?auto_9721 ?auto_9723 ) ) ( not ( = ?auto_9721 ?auto_9717 ) ) ( not ( = ?auto_9698 ?auto_9704 ) ) ( not ( = ?auto_9698 ?auto_9720 ) ) ( not ( = ?auto_9699 ?auto_9704 ) ) ( not ( = ?auto_9699 ?auto_9720 ) ) ( not ( = ?auto_9700 ?auto_9704 ) ) ( not ( = ?auto_9700 ?auto_9720 ) ) ( not ( = ?auto_9701 ?auto_9704 ) ) ( not ( = ?auto_9701 ?auto_9720 ) ) ( not ( = ?auto_9702 ?auto_9704 ) ) ( not ( = ?auto_9702 ?auto_9720 ) ) ( not ( = ?auto_9704 ?auto_9721 ) ) ( not ( = ?auto_9704 ?auto_9714 ) ) ( not ( = ?auto_9704 ?auto_9724 ) ) ( not ( = ?auto_9704 ?auto_9723 ) ) ( not ( = ?auto_9704 ?auto_9717 ) ) ( not ( = ?auto_9726 ?auto_9715 ) ) ( not ( = ?auto_9726 ?auto_9725 ) ) ( not ( = ?auto_9726 ?auto_9708 ) ) ( not ( = ?auto_9726 ?auto_9722 ) ) ( not ( = ?auto_9726 ?auto_9719 ) ) ( not ( = ?auto_9727 ?auto_9716 ) ) ( not ( = ?auto_9727 ?auto_9713 ) ) ( not ( = ?auto_9727 ?auto_9706 ) ) ( not ( = ?auto_9727 ?auto_9718 ) ) ( not ( = ?auto_9727 ?auto_9712 ) ) ( not ( = ?auto_9720 ?auto_9721 ) ) ( not ( = ?auto_9720 ?auto_9714 ) ) ( not ( = ?auto_9720 ?auto_9724 ) ) ( not ( = ?auto_9720 ?auto_9723 ) ) ( not ( = ?auto_9720 ?auto_9717 ) ) ( not ( = ?auto_9698 ?auto_9705 ) ) ( not ( = ?auto_9698 ?auto_9710 ) ) ( not ( = ?auto_9699 ?auto_9705 ) ) ( not ( = ?auto_9699 ?auto_9710 ) ) ( not ( = ?auto_9700 ?auto_9705 ) ) ( not ( = ?auto_9700 ?auto_9710 ) ) ( not ( = ?auto_9701 ?auto_9705 ) ) ( not ( = ?auto_9701 ?auto_9710 ) ) ( not ( = ?auto_9702 ?auto_9705 ) ) ( not ( = ?auto_9702 ?auto_9710 ) ) ( not ( = ?auto_9703 ?auto_9705 ) ) ( not ( = ?auto_9703 ?auto_9710 ) ) ( not ( = ?auto_9705 ?auto_9720 ) ) ( not ( = ?auto_9705 ?auto_9721 ) ) ( not ( = ?auto_9705 ?auto_9714 ) ) ( not ( = ?auto_9705 ?auto_9724 ) ) ( not ( = ?auto_9705 ?auto_9723 ) ) ( not ( = ?auto_9705 ?auto_9717 ) ) ( not ( = ?auto_9710 ?auto_9720 ) ) ( not ( = ?auto_9710 ?auto_9721 ) ) ( not ( = ?auto_9710 ?auto_9714 ) ) ( not ( = ?auto_9710 ?auto_9724 ) ) ( not ( = ?auto_9710 ?auto_9723 ) ) ( not ( = ?auto_9710 ?auto_9717 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9698 ?auto_9699 ?auto_9700 ?auto_9701 ?auto_9702 ?auto_9703 ?auto_9704 )
      ( MAKE-1CRATE ?auto_9704 ?auto_9705 )
      ( MAKE-7CRATE-VERIFY ?auto_9698 ?auto_9699 ?auto_9700 ?auto_9701 ?auto_9702 ?auto_9703 ?auto_9704 ?auto_9705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9730 - SURFACE
      ?auto_9731 - SURFACE
    )
    :vars
    (
      ?auto_9732 - HOIST
      ?auto_9733 - PLACE
      ?auto_9735 - PLACE
      ?auto_9736 - HOIST
      ?auto_9737 - SURFACE
      ?auto_9734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9732 ?auto_9733 ) ( SURFACE-AT ?auto_9730 ?auto_9733 ) ( CLEAR ?auto_9730 ) ( IS-CRATE ?auto_9731 ) ( AVAILABLE ?auto_9732 ) ( not ( = ?auto_9735 ?auto_9733 ) ) ( HOIST-AT ?auto_9736 ?auto_9735 ) ( AVAILABLE ?auto_9736 ) ( SURFACE-AT ?auto_9731 ?auto_9735 ) ( ON ?auto_9731 ?auto_9737 ) ( CLEAR ?auto_9731 ) ( TRUCK-AT ?auto_9734 ?auto_9733 ) ( not ( = ?auto_9730 ?auto_9731 ) ) ( not ( = ?auto_9730 ?auto_9737 ) ) ( not ( = ?auto_9731 ?auto_9737 ) ) ( not ( = ?auto_9732 ?auto_9736 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9734 ?auto_9733 ?auto_9735 )
      ( !LIFT ?auto_9736 ?auto_9731 ?auto_9737 ?auto_9735 )
      ( !LOAD ?auto_9736 ?auto_9731 ?auto_9734 ?auto_9735 )
      ( !DRIVE ?auto_9734 ?auto_9735 ?auto_9733 )
      ( !UNLOAD ?auto_9732 ?auto_9731 ?auto_9734 ?auto_9733 )
      ( !DROP ?auto_9732 ?auto_9731 ?auto_9730 ?auto_9733 )
      ( MAKE-1CRATE-VERIFY ?auto_9730 ?auto_9731 ) )
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
      ?auto_9755 - SURFACE
      ?auto_9754 - SURFACE
    )
    :vars
    (
      ?auto_9758 - HOIST
      ?auto_9759 - PLACE
      ?auto_9756 - PLACE
      ?auto_9757 - HOIST
      ?auto_9761 - SURFACE
      ?auto_9765 - PLACE
      ?auto_9778 - HOIST
      ?auto_9764 - SURFACE
      ?auto_9769 - PLACE
      ?auto_9771 - HOIST
      ?auto_9772 - SURFACE
      ?auto_9766 - PLACE
      ?auto_9763 - HOIST
      ?auto_9773 - SURFACE
      ?auto_9776 - PLACE
      ?auto_9767 - HOIST
      ?auto_9768 - SURFACE
      ?auto_9775 - SURFACE
      ?auto_9774 - SURFACE
      ?auto_9777 - PLACE
      ?auto_9770 - HOIST
      ?auto_9762 - SURFACE
      ?auto_9760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9758 ?auto_9759 ) ( IS-CRATE ?auto_9754 ) ( not ( = ?auto_9756 ?auto_9759 ) ) ( HOIST-AT ?auto_9757 ?auto_9756 ) ( SURFACE-AT ?auto_9754 ?auto_9756 ) ( ON ?auto_9754 ?auto_9761 ) ( CLEAR ?auto_9754 ) ( not ( = ?auto_9755 ?auto_9754 ) ) ( not ( = ?auto_9755 ?auto_9761 ) ) ( not ( = ?auto_9754 ?auto_9761 ) ) ( not ( = ?auto_9758 ?auto_9757 ) ) ( IS-CRATE ?auto_9755 ) ( not ( = ?auto_9765 ?auto_9759 ) ) ( HOIST-AT ?auto_9778 ?auto_9765 ) ( SURFACE-AT ?auto_9755 ?auto_9765 ) ( ON ?auto_9755 ?auto_9764 ) ( CLEAR ?auto_9755 ) ( not ( = ?auto_9753 ?auto_9755 ) ) ( not ( = ?auto_9753 ?auto_9764 ) ) ( not ( = ?auto_9755 ?auto_9764 ) ) ( not ( = ?auto_9758 ?auto_9778 ) ) ( IS-CRATE ?auto_9753 ) ( not ( = ?auto_9769 ?auto_9759 ) ) ( HOIST-AT ?auto_9771 ?auto_9769 ) ( AVAILABLE ?auto_9771 ) ( SURFACE-AT ?auto_9753 ?auto_9769 ) ( ON ?auto_9753 ?auto_9772 ) ( CLEAR ?auto_9753 ) ( not ( = ?auto_9752 ?auto_9753 ) ) ( not ( = ?auto_9752 ?auto_9772 ) ) ( not ( = ?auto_9753 ?auto_9772 ) ) ( not ( = ?auto_9758 ?auto_9771 ) ) ( IS-CRATE ?auto_9752 ) ( not ( = ?auto_9766 ?auto_9759 ) ) ( HOIST-AT ?auto_9763 ?auto_9766 ) ( AVAILABLE ?auto_9763 ) ( SURFACE-AT ?auto_9752 ?auto_9766 ) ( ON ?auto_9752 ?auto_9773 ) ( CLEAR ?auto_9752 ) ( not ( = ?auto_9751 ?auto_9752 ) ) ( not ( = ?auto_9751 ?auto_9773 ) ) ( not ( = ?auto_9752 ?auto_9773 ) ) ( not ( = ?auto_9758 ?auto_9763 ) ) ( IS-CRATE ?auto_9751 ) ( not ( = ?auto_9776 ?auto_9759 ) ) ( HOIST-AT ?auto_9767 ?auto_9776 ) ( AVAILABLE ?auto_9767 ) ( SURFACE-AT ?auto_9751 ?auto_9776 ) ( ON ?auto_9751 ?auto_9768 ) ( CLEAR ?auto_9751 ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9750 ?auto_9768 ) ) ( not ( = ?auto_9751 ?auto_9768 ) ) ( not ( = ?auto_9758 ?auto_9767 ) ) ( IS-CRATE ?auto_9750 ) ( AVAILABLE ?auto_9778 ) ( SURFACE-AT ?auto_9750 ?auto_9765 ) ( ON ?auto_9750 ?auto_9775 ) ( CLEAR ?auto_9750 ) ( not ( = ?auto_9749 ?auto_9750 ) ) ( not ( = ?auto_9749 ?auto_9775 ) ) ( not ( = ?auto_9750 ?auto_9775 ) ) ( IS-CRATE ?auto_9749 ) ( AVAILABLE ?auto_9757 ) ( SURFACE-AT ?auto_9749 ?auto_9756 ) ( ON ?auto_9749 ?auto_9774 ) ( CLEAR ?auto_9749 ) ( not ( = ?auto_9748 ?auto_9749 ) ) ( not ( = ?auto_9748 ?auto_9774 ) ) ( not ( = ?auto_9749 ?auto_9774 ) ) ( SURFACE-AT ?auto_9747 ?auto_9759 ) ( CLEAR ?auto_9747 ) ( IS-CRATE ?auto_9748 ) ( AVAILABLE ?auto_9758 ) ( not ( = ?auto_9777 ?auto_9759 ) ) ( HOIST-AT ?auto_9770 ?auto_9777 ) ( AVAILABLE ?auto_9770 ) ( SURFACE-AT ?auto_9748 ?auto_9777 ) ( ON ?auto_9748 ?auto_9762 ) ( CLEAR ?auto_9748 ) ( TRUCK-AT ?auto_9760 ?auto_9759 ) ( not ( = ?auto_9747 ?auto_9748 ) ) ( not ( = ?auto_9747 ?auto_9762 ) ) ( not ( = ?auto_9748 ?auto_9762 ) ) ( not ( = ?auto_9758 ?auto_9770 ) ) ( not ( = ?auto_9747 ?auto_9749 ) ) ( not ( = ?auto_9747 ?auto_9774 ) ) ( not ( = ?auto_9749 ?auto_9762 ) ) ( not ( = ?auto_9756 ?auto_9777 ) ) ( not ( = ?auto_9757 ?auto_9770 ) ) ( not ( = ?auto_9774 ?auto_9762 ) ) ( not ( = ?auto_9747 ?auto_9750 ) ) ( not ( = ?auto_9747 ?auto_9775 ) ) ( not ( = ?auto_9748 ?auto_9750 ) ) ( not ( = ?auto_9748 ?auto_9775 ) ) ( not ( = ?auto_9750 ?auto_9774 ) ) ( not ( = ?auto_9750 ?auto_9762 ) ) ( not ( = ?auto_9765 ?auto_9756 ) ) ( not ( = ?auto_9765 ?auto_9777 ) ) ( not ( = ?auto_9778 ?auto_9757 ) ) ( not ( = ?auto_9778 ?auto_9770 ) ) ( not ( = ?auto_9775 ?auto_9774 ) ) ( not ( = ?auto_9775 ?auto_9762 ) ) ( not ( = ?auto_9747 ?auto_9751 ) ) ( not ( = ?auto_9747 ?auto_9768 ) ) ( not ( = ?auto_9748 ?auto_9751 ) ) ( not ( = ?auto_9748 ?auto_9768 ) ) ( not ( = ?auto_9749 ?auto_9751 ) ) ( not ( = ?auto_9749 ?auto_9768 ) ) ( not ( = ?auto_9751 ?auto_9775 ) ) ( not ( = ?auto_9751 ?auto_9774 ) ) ( not ( = ?auto_9751 ?auto_9762 ) ) ( not ( = ?auto_9776 ?auto_9765 ) ) ( not ( = ?auto_9776 ?auto_9756 ) ) ( not ( = ?auto_9776 ?auto_9777 ) ) ( not ( = ?auto_9767 ?auto_9778 ) ) ( not ( = ?auto_9767 ?auto_9757 ) ) ( not ( = ?auto_9767 ?auto_9770 ) ) ( not ( = ?auto_9768 ?auto_9775 ) ) ( not ( = ?auto_9768 ?auto_9774 ) ) ( not ( = ?auto_9768 ?auto_9762 ) ) ( not ( = ?auto_9747 ?auto_9752 ) ) ( not ( = ?auto_9747 ?auto_9773 ) ) ( not ( = ?auto_9748 ?auto_9752 ) ) ( not ( = ?auto_9748 ?auto_9773 ) ) ( not ( = ?auto_9749 ?auto_9752 ) ) ( not ( = ?auto_9749 ?auto_9773 ) ) ( not ( = ?auto_9750 ?auto_9752 ) ) ( not ( = ?auto_9750 ?auto_9773 ) ) ( not ( = ?auto_9752 ?auto_9768 ) ) ( not ( = ?auto_9752 ?auto_9775 ) ) ( not ( = ?auto_9752 ?auto_9774 ) ) ( not ( = ?auto_9752 ?auto_9762 ) ) ( not ( = ?auto_9766 ?auto_9776 ) ) ( not ( = ?auto_9766 ?auto_9765 ) ) ( not ( = ?auto_9766 ?auto_9756 ) ) ( not ( = ?auto_9766 ?auto_9777 ) ) ( not ( = ?auto_9763 ?auto_9767 ) ) ( not ( = ?auto_9763 ?auto_9778 ) ) ( not ( = ?auto_9763 ?auto_9757 ) ) ( not ( = ?auto_9763 ?auto_9770 ) ) ( not ( = ?auto_9773 ?auto_9768 ) ) ( not ( = ?auto_9773 ?auto_9775 ) ) ( not ( = ?auto_9773 ?auto_9774 ) ) ( not ( = ?auto_9773 ?auto_9762 ) ) ( not ( = ?auto_9747 ?auto_9753 ) ) ( not ( = ?auto_9747 ?auto_9772 ) ) ( not ( = ?auto_9748 ?auto_9753 ) ) ( not ( = ?auto_9748 ?auto_9772 ) ) ( not ( = ?auto_9749 ?auto_9753 ) ) ( not ( = ?auto_9749 ?auto_9772 ) ) ( not ( = ?auto_9750 ?auto_9753 ) ) ( not ( = ?auto_9750 ?auto_9772 ) ) ( not ( = ?auto_9751 ?auto_9753 ) ) ( not ( = ?auto_9751 ?auto_9772 ) ) ( not ( = ?auto_9753 ?auto_9773 ) ) ( not ( = ?auto_9753 ?auto_9768 ) ) ( not ( = ?auto_9753 ?auto_9775 ) ) ( not ( = ?auto_9753 ?auto_9774 ) ) ( not ( = ?auto_9753 ?auto_9762 ) ) ( not ( = ?auto_9769 ?auto_9766 ) ) ( not ( = ?auto_9769 ?auto_9776 ) ) ( not ( = ?auto_9769 ?auto_9765 ) ) ( not ( = ?auto_9769 ?auto_9756 ) ) ( not ( = ?auto_9769 ?auto_9777 ) ) ( not ( = ?auto_9771 ?auto_9763 ) ) ( not ( = ?auto_9771 ?auto_9767 ) ) ( not ( = ?auto_9771 ?auto_9778 ) ) ( not ( = ?auto_9771 ?auto_9757 ) ) ( not ( = ?auto_9771 ?auto_9770 ) ) ( not ( = ?auto_9772 ?auto_9773 ) ) ( not ( = ?auto_9772 ?auto_9768 ) ) ( not ( = ?auto_9772 ?auto_9775 ) ) ( not ( = ?auto_9772 ?auto_9774 ) ) ( not ( = ?auto_9772 ?auto_9762 ) ) ( not ( = ?auto_9747 ?auto_9755 ) ) ( not ( = ?auto_9747 ?auto_9764 ) ) ( not ( = ?auto_9748 ?auto_9755 ) ) ( not ( = ?auto_9748 ?auto_9764 ) ) ( not ( = ?auto_9749 ?auto_9755 ) ) ( not ( = ?auto_9749 ?auto_9764 ) ) ( not ( = ?auto_9750 ?auto_9755 ) ) ( not ( = ?auto_9750 ?auto_9764 ) ) ( not ( = ?auto_9751 ?auto_9755 ) ) ( not ( = ?auto_9751 ?auto_9764 ) ) ( not ( = ?auto_9752 ?auto_9755 ) ) ( not ( = ?auto_9752 ?auto_9764 ) ) ( not ( = ?auto_9755 ?auto_9772 ) ) ( not ( = ?auto_9755 ?auto_9773 ) ) ( not ( = ?auto_9755 ?auto_9768 ) ) ( not ( = ?auto_9755 ?auto_9775 ) ) ( not ( = ?auto_9755 ?auto_9774 ) ) ( not ( = ?auto_9755 ?auto_9762 ) ) ( not ( = ?auto_9764 ?auto_9772 ) ) ( not ( = ?auto_9764 ?auto_9773 ) ) ( not ( = ?auto_9764 ?auto_9768 ) ) ( not ( = ?auto_9764 ?auto_9775 ) ) ( not ( = ?auto_9764 ?auto_9774 ) ) ( not ( = ?auto_9764 ?auto_9762 ) ) ( not ( = ?auto_9747 ?auto_9754 ) ) ( not ( = ?auto_9747 ?auto_9761 ) ) ( not ( = ?auto_9748 ?auto_9754 ) ) ( not ( = ?auto_9748 ?auto_9761 ) ) ( not ( = ?auto_9749 ?auto_9754 ) ) ( not ( = ?auto_9749 ?auto_9761 ) ) ( not ( = ?auto_9750 ?auto_9754 ) ) ( not ( = ?auto_9750 ?auto_9761 ) ) ( not ( = ?auto_9751 ?auto_9754 ) ) ( not ( = ?auto_9751 ?auto_9761 ) ) ( not ( = ?auto_9752 ?auto_9754 ) ) ( not ( = ?auto_9752 ?auto_9761 ) ) ( not ( = ?auto_9753 ?auto_9754 ) ) ( not ( = ?auto_9753 ?auto_9761 ) ) ( not ( = ?auto_9754 ?auto_9764 ) ) ( not ( = ?auto_9754 ?auto_9772 ) ) ( not ( = ?auto_9754 ?auto_9773 ) ) ( not ( = ?auto_9754 ?auto_9768 ) ) ( not ( = ?auto_9754 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9774 ) ) ( not ( = ?auto_9754 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9764 ) ) ( not ( = ?auto_9761 ?auto_9772 ) ) ( not ( = ?auto_9761 ?auto_9773 ) ) ( not ( = ?auto_9761 ?auto_9768 ) ) ( not ( = ?auto_9761 ?auto_9775 ) ) ( not ( = ?auto_9761 ?auto_9774 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9747 ?auto_9748 ?auto_9749 ?auto_9750 ?auto_9751 ?auto_9752 ?auto_9753 ?auto_9755 )
      ( MAKE-1CRATE ?auto_9755 ?auto_9754 )
      ( MAKE-8CRATE-VERIFY ?auto_9747 ?auto_9748 ?auto_9749 ?auto_9750 ?auto_9751 ?auto_9752 ?auto_9753 ?auto_9755 ?auto_9754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9781 - SURFACE
      ?auto_9782 - SURFACE
    )
    :vars
    (
      ?auto_9783 - HOIST
      ?auto_9784 - PLACE
      ?auto_9786 - PLACE
      ?auto_9787 - HOIST
      ?auto_9788 - SURFACE
      ?auto_9785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9783 ?auto_9784 ) ( SURFACE-AT ?auto_9781 ?auto_9784 ) ( CLEAR ?auto_9781 ) ( IS-CRATE ?auto_9782 ) ( AVAILABLE ?auto_9783 ) ( not ( = ?auto_9786 ?auto_9784 ) ) ( HOIST-AT ?auto_9787 ?auto_9786 ) ( AVAILABLE ?auto_9787 ) ( SURFACE-AT ?auto_9782 ?auto_9786 ) ( ON ?auto_9782 ?auto_9788 ) ( CLEAR ?auto_9782 ) ( TRUCK-AT ?auto_9785 ?auto_9784 ) ( not ( = ?auto_9781 ?auto_9782 ) ) ( not ( = ?auto_9781 ?auto_9788 ) ) ( not ( = ?auto_9782 ?auto_9788 ) ) ( not ( = ?auto_9783 ?auto_9787 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9785 ?auto_9784 ?auto_9786 )
      ( !LIFT ?auto_9787 ?auto_9782 ?auto_9788 ?auto_9786 )
      ( !LOAD ?auto_9787 ?auto_9782 ?auto_9785 ?auto_9786 )
      ( !DRIVE ?auto_9785 ?auto_9786 ?auto_9784 )
      ( !UNLOAD ?auto_9783 ?auto_9782 ?auto_9785 ?auto_9784 )
      ( !DROP ?auto_9783 ?auto_9782 ?auto_9781 ?auto_9784 )
      ( MAKE-1CRATE-VERIFY ?auto_9781 ?auto_9782 ) )
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
      ?auto_9808 - SURFACE
      ?auto_9807 - SURFACE
      ?auto_9806 - SURFACE
    )
    :vars
    (
      ?auto_9809 - HOIST
      ?auto_9813 - PLACE
      ?auto_9810 - PLACE
      ?auto_9812 - HOIST
      ?auto_9811 - SURFACE
      ?auto_9816 - PLACE
      ?auto_9819 - HOIST
      ?auto_9818 - SURFACE
      ?auto_9817 - PLACE
      ?auto_9815 - HOIST
      ?auto_9834 - SURFACE
      ?auto_9824 - PLACE
      ?auto_9820 - HOIST
      ?auto_9828 - SURFACE
      ?auto_9831 - PLACE
      ?auto_9833 - HOIST
      ?auto_9821 - SURFACE
      ?auto_9832 - PLACE
      ?auto_9830 - HOIST
      ?auto_9825 - SURFACE
      ?auto_9823 - SURFACE
      ?auto_9822 - SURFACE
      ?auto_9827 - PLACE
      ?auto_9829 - HOIST
      ?auto_9826 - SURFACE
      ?auto_9814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9809 ?auto_9813 ) ( IS-CRATE ?auto_9806 ) ( not ( = ?auto_9810 ?auto_9813 ) ) ( HOIST-AT ?auto_9812 ?auto_9810 ) ( AVAILABLE ?auto_9812 ) ( SURFACE-AT ?auto_9806 ?auto_9810 ) ( ON ?auto_9806 ?auto_9811 ) ( CLEAR ?auto_9806 ) ( not ( = ?auto_9807 ?auto_9806 ) ) ( not ( = ?auto_9807 ?auto_9811 ) ) ( not ( = ?auto_9806 ?auto_9811 ) ) ( not ( = ?auto_9809 ?auto_9812 ) ) ( IS-CRATE ?auto_9807 ) ( not ( = ?auto_9816 ?auto_9813 ) ) ( HOIST-AT ?auto_9819 ?auto_9816 ) ( SURFACE-AT ?auto_9807 ?auto_9816 ) ( ON ?auto_9807 ?auto_9818 ) ( CLEAR ?auto_9807 ) ( not ( = ?auto_9808 ?auto_9807 ) ) ( not ( = ?auto_9808 ?auto_9818 ) ) ( not ( = ?auto_9807 ?auto_9818 ) ) ( not ( = ?auto_9809 ?auto_9819 ) ) ( IS-CRATE ?auto_9808 ) ( not ( = ?auto_9817 ?auto_9813 ) ) ( HOIST-AT ?auto_9815 ?auto_9817 ) ( SURFACE-AT ?auto_9808 ?auto_9817 ) ( ON ?auto_9808 ?auto_9834 ) ( CLEAR ?auto_9808 ) ( not ( = ?auto_9805 ?auto_9808 ) ) ( not ( = ?auto_9805 ?auto_9834 ) ) ( not ( = ?auto_9808 ?auto_9834 ) ) ( not ( = ?auto_9809 ?auto_9815 ) ) ( IS-CRATE ?auto_9805 ) ( not ( = ?auto_9824 ?auto_9813 ) ) ( HOIST-AT ?auto_9820 ?auto_9824 ) ( AVAILABLE ?auto_9820 ) ( SURFACE-AT ?auto_9805 ?auto_9824 ) ( ON ?auto_9805 ?auto_9828 ) ( CLEAR ?auto_9805 ) ( not ( = ?auto_9804 ?auto_9805 ) ) ( not ( = ?auto_9804 ?auto_9828 ) ) ( not ( = ?auto_9805 ?auto_9828 ) ) ( not ( = ?auto_9809 ?auto_9820 ) ) ( IS-CRATE ?auto_9804 ) ( not ( = ?auto_9831 ?auto_9813 ) ) ( HOIST-AT ?auto_9833 ?auto_9831 ) ( AVAILABLE ?auto_9833 ) ( SURFACE-AT ?auto_9804 ?auto_9831 ) ( ON ?auto_9804 ?auto_9821 ) ( CLEAR ?auto_9804 ) ( not ( = ?auto_9803 ?auto_9804 ) ) ( not ( = ?auto_9803 ?auto_9821 ) ) ( not ( = ?auto_9804 ?auto_9821 ) ) ( not ( = ?auto_9809 ?auto_9833 ) ) ( IS-CRATE ?auto_9803 ) ( not ( = ?auto_9832 ?auto_9813 ) ) ( HOIST-AT ?auto_9830 ?auto_9832 ) ( AVAILABLE ?auto_9830 ) ( SURFACE-AT ?auto_9803 ?auto_9832 ) ( ON ?auto_9803 ?auto_9825 ) ( CLEAR ?auto_9803 ) ( not ( = ?auto_9802 ?auto_9803 ) ) ( not ( = ?auto_9802 ?auto_9825 ) ) ( not ( = ?auto_9803 ?auto_9825 ) ) ( not ( = ?auto_9809 ?auto_9830 ) ) ( IS-CRATE ?auto_9802 ) ( AVAILABLE ?auto_9815 ) ( SURFACE-AT ?auto_9802 ?auto_9817 ) ( ON ?auto_9802 ?auto_9823 ) ( CLEAR ?auto_9802 ) ( not ( = ?auto_9801 ?auto_9802 ) ) ( not ( = ?auto_9801 ?auto_9823 ) ) ( not ( = ?auto_9802 ?auto_9823 ) ) ( IS-CRATE ?auto_9801 ) ( AVAILABLE ?auto_9819 ) ( SURFACE-AT ?auto_9801 ?auto_9816 ) ( ON ?auto_9801 ?auto_9822 ) ( CLEAR ?auto_9801 ) ( not ( = ?auto_9800 ?auto_9801 ) ) ( not ( = ?auto_9800 ?auto_9822 ) ) ( not ( = ?auto_9801 ?auto_9822 ) ) ( SURFACE-AT ?auto_9799 ?auto_9813 ) ( CLEAR ?auto_9799 ) ( IS-CRATE ?auto_9800 ) ( AVAILABLE ?auto_9809 ) ( not ( = ?auto_9827 ?auto_9813 ) ) ( HOIST-AT ?auto_9829 ?auto_9827 ) ( AVAILABLE ?auto_9829 ) ( SURFACE-AT ?auto_9800 ?auto_9827 ) ( ON ?auto_9800 ?auto_9826 ) ( CLEAR ?auto_9800 ) ( TRUCK-AT ?auto_9814 ?auto_9813 ) ( not ( = ?auto_9799 ?auto_9800 ) ) ( not ( = ?auto_9799 ?auto_9826 ) ) ( not ( = ?auto_9800 ?auto_9826 ) ) ( not ( = ?auto_9809 ?auto_9829 ) ) ( not ( = ?auto_9799 ?auto_9801 ) ) ( not ( = ?auto_9799 ?auto_9822 ) ) ( not ( = ?auto_9801 ?auto_9826 ) ) ( not ( = ?auto_9816 ?auto_9827 ) ) ( not ( = ?auto_9819 ?auto_9829 ) ) ( not ( = ?auto_9822 ?auto_9826 ) ) ( not ( = ?auto_9799 ?auto_9802 ) ) ( not ( = ?auto_9799 ?auto_9823 ) ) ( not ( = ?auto_9800 ?auto_9802 ) ) ( not ( = ?auto_9800 ?auto_9823 ) ) ( not ( = ?auto_9802 ?auto_9822 ) ) ( not ( = ?auto_9802 ?auto_9826 ) ) ( not ( = ?auto_9817 ?auto_9816 ) ) ( not ( = ?auto_9817 ?auto_9827 ) ) ( not ( = ?auto_9815 ?auto_9819 ) ) ( not ( = ?auto_9815 ?auto_9829 ) ) ( not ( = ?auto_9823 ?auto_9822 ) ) ( not ( = ?auto_9823 ?auto_9826 ) ) ( not ( = ?auto_9799 ?auto_9803 ) ) ( not ( = ?auto_9799 ?auto_9825 ) ) ( not ( = ?auto_9800 ?auto_9803 ) ) ( not ( = ?auto_9800 ?auto_9825 ) ) ( not ( = ?auto_9801 ?auto_9803 ) ) ( not ( = ?auto_9801 ?auto_9825 ) ) ( not ( = ?auto_9803 ?auto_9823 ) ) ( not ( = ?auto_9803 ?auto_9822 ) ) ( not ( = ?auto_9803 ?auto_9826 ) ) ( not ( = ?auto_9832 ?auto_9817 ) ) ( not ( = ?auto_9832 ?auto_9816 ) ) ( not ( = ?auto_9832 ?auto_9827 ) ) ( not ( = ?auto_9830 ?auto_9815 ) ) ( not ( = ?auto_9830 ?auto_9819 ) ) ( not ( = ?auto_9830 ?auto_9829 ) ) ( not ( = ?auto_9825 ?auto_9823 ) ) ( not ( = ?auto_9825 ?auto_9822 ) ) ( not ( = ?auto_9825 ?auto_9826 ) ) ( not ( = ?auto_9799 ?auto_9804 ) ) ( not ( = ?auto_9799 ?auto_9821 ) ) ( not ( = ?auto_9800 ?auto_9804 ) ) ( not ( = ?auto_9800 ?auto_9821 ) ) ( not ( = ?auto_9801 ?auto_9804 ) ) ( not ( = ?auto_9801 ?auto_9821 ) ) ( not ( = ?auto_9802 ?auto_9804 ) ) ( not ( = ?auto_9802 ?auto_9821 ) ) ( not ( = ?auto_9804 ?auto_9825 ) ) ( not ( = ?auto_9804 ?auto_9823 ) ) ( not ( = ?auto_9804 ?auto_9822 ) ) ( not ( = ?auto_9804 ?auto_9826 ) ) ( not ( = ?auto_9831 ?auto_9832 ) ) ( not ( = ?auto_9831 ?auto_9817 ) ) ( not ( = ?auto_9831 ?auto_9816 ) ) ( not ( = ?auto_9831 ?auto_9827 ) ) ( not ( = ?auto_9833 ?auto_9830 ) ) ( not ( = ?auto_9833 ?auto_9815 ) ) ( not ( = ?auto_9833 ?auto_9819 ) ) ( not ( = ?auto_9833 ?auto_9829 ) ) ( not ( = ?auto_9821 ?auto_9825 ) ) ( not ( = ?auto_9821 ?auto_9823 ) ) ( not ( = ?auto_9821 ?auto_9822 ) ) ( not ( = ?auto_9821 ?auto_9826 ) ) ( not ( = ?auto_9799 ?auto_9805 ) ) ( not ( = ?auto_9799 ?auto_9828 ) ) ( not ( = ?auto_9800 ?auto_9805 ) ) ( not ( = ?auto_9800 ?auto_9828 ) ) ( not ( = ?auto_9801 ?auto_9805 ) ) ( not ( = ?auto_9801 ?auto_9828 ) ) ( not ( = ?auto_9802 ?auto_9805 ) ) ( not ( = ?auto_9802 ?auto_9828 ) ) ( not ( = ?auto_9803 ?auto_9805 ) ) ( not ( = ?auto_9803 ?auto_9828 ) ) ( not ( = ?auto_9805 ?auto_9821 ) ) ( not ( = ?auto_9805 ?auto_9825 ) ) ( not ( = ?auto_9805 ?auto_9823 ) ) ( not ( = ?auto_9805 ?auto_9822 ) ) ( not ( = ?auto_9805 ?auto_9826 ) ) ( not ( = ?auto_9824 ?auto_9831 ) ) ( not ( = ?auto_9824 ?auto_9832 ) ) ( not ( = ?auto_9824 ?auto_9817 ) ) ( not ( = ?auto_9824 ?auto_9816 ) ) ( not ( = ?auto_9824 ?auto_9827 ) ) ( not ( = ?auto_9820 ?auto_9833 ) ) ( not ( = ?auto_9820 ?auto_9830 ) ) ( not ( = ?auto_9820 ?auto_9815 ) ) ( not ( = ?auto_9820 ?auto_9819 ) ) ( not ( = ?auto_9820 ?auto_9829 ) ) ( not ( = ?auto_9828 ?auto_9821 ) ) ( not ( = ?auto_9828 ?auto_9825 ) ) ( not ( = ?auto_9828 ?auto_9823 ) ) ( not ( = ?auto_9828 ?auto_9822 ) ) ( not ( = ?auto_9828 ?auto_9826 ) ) ( not ( = ?auto_9799 ?auto_9808 ) ) ( not ( = ?auto_9799 ?auto_9834 ) ) ( not ( = ?auto_9800 ?auto_9808 ) ) ( not ( = ?auto_9800 ?auto_9834 ) ) ( not ( = ?auto_9801 ?auto_9808 ) ) ( not ( = ?auto_9801 ?auto_9834 ) ) ( not ( = ?auto_9802 ?auto_9808 ) ) ( not ( = ?auto_9802 ?auto_9834 ) ) ( not ( = ?auto_9803 ?auto_9808 ) ) ( not ( = ?auto_9803 ?auto_9834 ) ) ( not ( = ?auto_9804 ?auto_9808 ) ) ( not ( = ?auto_9804 ?auto_9834 ) ) ( not ( = ?auto_9808 ?auto_9828 ) ) ( not ( = ?auto_9808 ?auto_9821 ) ) ( not ( = ?auto_9808 ?auto_9825 ) ) ( not ( = ?auto_9808 ?auto_9823 ) ) ( not ( = ?auto_9808 ?auto_9822 ) ) ( not ( = ?auto_9808 ?auto_9826 ) ) ( not ( = ?auto_9834 ?auto_9828 ) ) ( not ( = ?auto_9834 ?auto_9821 ) ) ( not ( = ?auto_9834 ?auto_9825 ) ) ( not ( = ?auto_9834 ?auto_9823 ) ) ( not ( = ?auto_9834 ?auto_9822 ) ) ( not ( = ?auto_9834 ?auto_9826 ) ) ( not ( = ?auto_9799 ?auto_9807 ) ) ( not ( = ?auto_9799 ?auto_9818 ) ) ( not ( = ?auto_9800 ?auto_9807 ) ) ( not ( = ?auto_9800 ?auto_9818 ) ) ( not ( = ?auto_9801 ?auto_9807 ) ) ( not ( = ?auto_9801 ?auto_9818 ) ) ( not ( = ?auto_9802 ?auto_9807 ) ) ( not ( = ?auto_9802 ?auto_9818 ) ) ( not ( = ?auto_9803 ?auto_9807 ) ) ( not ( = ?auto_9803 ?auto_9818 ) ) ( not ( = ?auto_9804 ?auto_9807 ) ) ( not ( = ?auto_9804 ?auto_9818 ) ) ( not ( = ?auto_9805 ?auto_9807 ) ) ( not ( = ?auto_9805 ?auto_9818 ) ) ( not ( = ?auto_9807 ?auto_9834 ) ) ( not ( = ?auto_9807 ?auto_9828 ) ) ( not ( = ?auto_9807 ?auto_9821 ) ) ( not ( = ?auto_9807 ?auto_9825 ) ) ( not ( = ?auto_9807 ?auto_9823 ) ) ( not ( = ?auto_9807 ?auto_9822 ) ) ( not ( = ?auto_9807 ?auto_9826 ) ) ( not ( = ?auto_9818 ?auto_9834 ) ) ( not ( = ?auto_9818 ?auto_9828 ) ) ( not ( = ?auto_9818 ?auto_9821 ) ) ( not ( = ?auto_9818 ?auto_9825 ) ) ( not ( = ?auto_9818 ?auto_9823 ) ) ( not ( = ?auto_9818 ?auto_9822 ) ) ( not ( = ?auto_9818 ?auto_9826 ) ) ( not ( = ?auto_9799 ?auto_9806 ) ) ( not ( = ?auto_9799 ?auto_9811 ) ) ( not ( = ?auto_9800 ?auto_9806 ) ) ( not ( = ?auto_9800 ?auto_9811 ) ) ( not ( = ?auto_9801 ?auto_9806 ) ) ( not ( = ?auto_9801 ?auto_9811 ) ) ( not ( = ?auto_9802 ?auto_9806 ) ) ( not ( = ?auto_9802 ?auto_9811 ) ) ( not ( = ?auto_9803 ?auto_9806 ) ) ( not ( = ?auto_9803 ?auto_9811 ) ) ( not ( = ?auto_9804 ?auto_9806 ) ) ( not ( = ?auto_9804 ?auto_9811 ) ) ( not ( = ?auto_9805 ?auto_9806 ) ) ( not ( = ?auto_9805 ?auto_9811 ) ) ( not ( = ?auto_9808 ?auto_9806 ) ) ( not ( = ?auto_9808 ?auto_9811 ) ) ( not ( = ?auto_9806 ?auto_9818 ) ) ( not ( = ?auto_9806 ?auto_9834 ) ) ( not ( = ?auto_9806 ?auto_9828 ) ) ( not ( = ?auto_9806 ?auto_9821 ) ) ( not ( = ?auto_9806 ?auto_9825 ) ) ( not ( = ?auto_9806 ?auto_9823 ) ) ( not ( = ?auto_9806 ?auto_9822 ) ) ( not ( = ?auto_9806 ?auto_9826 ) ) ( not ( = ?auto_9810 ?auto_9816 ) ) ( not ( = ?auto_9810 ?auto_9817 ) ) ( not ( = ?auto_9810 ?auto_9824 ) ) ( not ( = ?auto_9810 ?auto_9831 ) ) ( not ( = ?auto_9810 ?auto_9832 ) ) ( not ( = ?auto_9810 ?auto_9827 ) ) ( not ( = ?auto_9812 ?auto_9819 ) ) ( not ( = ?auto_9812 ?auto_9815 ) ) ( not ( = ?auto_9812 ?auto_9820 ) ) ( not ( = ?auto_9812 ?auto_9833 ) ) ( not ( = ?auto_9812 ?auto_9830 ) ) ( not ( = ?auto_9812 ?auto_9829 ) ) ( not ( = ?auto_9811 ?auto_9818 ) ) ( not ( = ?auto_9811 ?auto_9834 ) ) ( not ( = ?auto_9811 ?auto_9828 ) ) ( not ( = ?auto_9811 ?auto_9821 ) ) ( not ( = ?auto_9811 ?auto_9825 ) ) ( not ( = ?auto_9811 ?auto_9823 ) ) ( not ( = ?auto_9811 ?auto_9822 ) ) ( not ( = ?auto_9811 ?auto_9826 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9803 ?auto_9804 ?auto_9805 ?auto_9808 ?auto_9807 )
      ( MAKE-1CRATE ?auto_9807 ?auto_9806 )
      ( MAKE-9CRATE-VERIFY ?auto_9799 ?auto_9800 ?auto_9801 ?auto_9802 ?auto_9803 ?auto_9804 ?auto_9805 ?auto_9808 ?auto_9807 ?auto_9806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9837 - SURFACE
      ?auto_9838 - SURFACE
    )
    :vars
    (
      ?auto_9839 - HOIST
      ?auto_9840 - PLACE
      ?auto_9842 - PLACE
      ?auto_9843 - HOIST
      ?auto_9844 - SURFACE
      ?auto_9841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9839 ?auto_9840 ) ( SURFACE-AT ?auto_9837 ?auto_9840 ) ( CLEAR ?auto_9837 ) ( IS-CRATE ?auto_9838 ) ( AVAILABLE ?auto_9839 ) ( not ( = ?auto_9842 ?auto_9840 ) ) ( HOIST-AT ?auto_9843 ?auto_9842 ) ( AVAILABLE ?auto_9843 ) ( SURFACE-AT ?auto_9838 ?auto_9842 ) ( ON ?auto_9838 ?auto_9844 ) ( CLEAR ?auto_9838 ) ( TRUCK-AT ?auto_9841 ?auto_9840 ) ( not ( = ?auto_9837 ?auto_9838 ) ) ( not ( = ?auto_9837 ?auto_9844 ) ) ( not ( = ?auto_9838 ?auto_9844 ) ) ( not ( = ?auto_9839 ?auto_9843 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9841 ?auto_9840 ?auto_9842 )
      ( !LIFT ?auto_9843 ?auto_9838 ?auto_9844 ?auto_9842 )
      ( !LOAD ?auto_9843 ?auto_9838 ?auto_9841 ?auto_9842 )
      ( !DRIVE ?auto_9841 ?auto_9842 ?auto_9840 )
      ( !UNLOAD ?auto_9839 ?auto_9838 ?auto_9841 ?auto_9840 )
      ( !DROP ?auto_9839 ?auto_9838 ?auto_9837 ?auto_9840 )
      ( MAKE-1CRATE-VERIFY ?auto_9837 ?auto_9838 ) )
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
      ?auto_9865 - SURFACE
      ?auto_9864 - SURFACE
      ?auto_9863 - SURFACE
      ?auto_9866 - SURFACE
    )
    :vars
    (
      ?auto_9869 - HOIST
      ?auto_9868 - PLACE
      ?auto_9872 - PLACE
      ?auto_9867 - HOIST
      ?auto_9871 - SURFACE
      ?auto_9891 - PLACE
      ?auto_9879 - HOIST
      ?auto_9878 - SURFACE
      ?auto_9875 - PLACE
      ?auto_9890 - HOIST
      ?auto_9877 - SURFACE
      ?auto_9887 - PLACE
      ?auto_9874 - HOIST
      ?auto_9880 - SURFACE
      ?auto_9884 - PLACE
      ?auto_9889 - HOIST
      ?auto_9883 - SURFACE
      ?auto_9886 - PLACE
      ?auto_9892 - HOIST
      ?auto_9873 - SURFACE
      ?auto_9876 - PLACE
      ?auto_9881 - HOIST
      ?auto_9888 - SURFACE
      ?auto_9885 - SURFACE
      ?auto_9882 - SURFACE
      ?auto_9893 - SURFACE
      ?auto_9870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9869 ?auto_9868 ) ( IS-CRATE ?auto_9866 ) ( not ( = ?auto_9872 ?auto_9868 ) ) ( HOIST-AT ?auto_9867 ?auto_9872 ) ( SURFACE-AT ?auto_9866 ?auto_9872 ) ( ON ?auto_9866 ?auto_9871 ) ( CLEAR ?auto_9866 ) ( not ( = ?auto_9863 ?auto_9866 ) ) ( not ( = ?auto_9863 ?auto_9871 ) ) ( not ( = ?auto_9866 ?auto_9871 ) ) ( not ( = ?auto_9869 ?auto_9867 ) ) ( IS-CRATE ?auto_9863 ) ( not ( = ?auto_9891 ?auto_9868 ) ) ( HOIST-AT ?auto_9879 ?auto_9891 ) ( AVAILABLE ?auto_9879 ) ( SURFACE-AT ?auto_9863 ?auto_9891 ) ( ON ?auto_9863 ?auto_9878 ) ( CLEAR ?auto_9863 ) ( not ( = ?auto_9864 ?auto_9863 ) ) ( not ( = ?auto_9864 ?auto_9878 ) ) ( not ( = ?auto_9863 ?auto_9878 ) ) ( not ( = ?auto_9869 ?auto_9879 ) ) ( IS-CRATE ?auto_9864 ) ( not ( = ?auto_9875 ?auto_9868 ) ) ( HOIST-AT ?auto_9890 ?auto_9875 ) ( SURFACE-AT ?auto_9864 ?auto_9875 ) ( ON ?auto_9864 ?auto_9877 ) ( CLEAR ?auto_9864 ) ( not ( = ?auto_9865 ?auto_9864 ) ) ( not ( = ?auto_9865 ?auto_9877 ) ) ( not ( = ?auto_9864 ?auto_9877 ) ) ( not ( = ?auto_9869 ?auto_9890 ) ) ( IS-CRATE ?auto_9865 ) ( not ( = ?auto_9887 ?auto_9868 ) ) ( HOIST-AT ?auto_9874 ?auto_9887 ) ( SURFACE-AT ?auto_9865 ?auto_9887 ) ( ON ?auto_9865 ?auto_9880 ) ( CLEAR ?auto_9865 ) ( not ( = ?auto_9862 ?auto_9865 ) ) ( not ( = ?auto_9862 ?auto_9880 ) ) ( not ( = ?auto_9865 ?auto_9880 ) ) ( not ( = ?auto_9869 ?auto_9874 ) ) ( IS-CRATE ?auto_9862 ) ( not ( = ?auto_9884 ?auto_9868 ) ) ( HOIST-AT ?auto_9889 ?auto_9884 ) ( AVAILABLE ?auto_9889 ) ( SURFACE-AT ?auto_9862 ?auto_9884 ) ( ON ?auto_9862 ?auto_9883 ) ( CLEAR ?auto_9862 ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( not ( = ?auto_9861 ?auto_9883 ) ) ( not ( = ?auto_9862 ?auto_9883 ) ) ( not ( = ?auto_9869 ?auto_9889 ) ) ( IS-CRATE ?auto_9861 ) ( not ( = ?auto_9886 ?auto_9868 ) ) ( HOIST-AT ?auto_9892 ?auto_9886 ) ( AVAILABLE ?auto_9892 ) ( SURFACE-AT ?auto_9861 ?auto_9886 ) ( ON ?auto_9861 ?auto_9873 ) ( CLEAR ?auto_9861 ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9860 ?auto_9873 ) ) ( not ( = ?auto_9861 ?auto_9873 ) ) ( not ( = ?auto_9869 ?auto_9892 ) ) ( IS-CRATE ?auto_9860 ) ( not ( = ?auto_9876 ?auto_9868 ) ) ( HOIST-AT ?auto_9881 ?auto_9876 ) ( AVAILABLE ?auto_9881 ) ( SURFACE-AT ?auto_9860 ?auto_9876 ) ( ON ?auto_9860 ?auto_9888 ) ( CLEAR ?auto_9860 ) ( not ( = ?auto_9859 ?auto_9860 ) ) ( not ( = ?auto_9859 ?auto_9888 ) ) ( not ( = ?auto_9860 ?auto_9888 ) ) ( not ( = ?auto_9869 ?auto_9881 ) ) ( IS-CRATE ?auto_9859 ) ( AVAILABLE ?auto_9874 ) ( SURFACE-AT ?auto_9859 ?auto_9887 ) ( ON ?auto_9859 ?auto_9885 ) ( CLEAR ?auto_9859 ) ( not ( = ?auto_9858 ?auto_9859 ) ) ( not ( = ?auto_9858 ?auto_9885 ) ) ( not ( = ?auto_9859 ?auto_9885 ) ) ( IS-CRATE ?auto_9858 ) ( AVAILABLE ?auto_9890 ) ( SURFACE-AT ?auto_9858 ?auto_9875 ) ( ON ?auto_9858 ?auto_9882 ) ( CLEAR ?auto_9858 ) ( not ( = ?auto_9857 ?auto_9858 ) ) ( not ( = ?auto_9857 ?auto_9882 ) ) ( not ( = ?auto_9858 ?auto_9882 ) ) ( SURFACE-AT ?auto_9856 ?auto_9868 ) ( CLEAR ?auto_9856 ) ( IS-CRATE ?auto_9857 ) ( AVAILABLE ?auto_9869 ) ( AVAILABLE ?auto_9867 ) ( SURFACE-AT ?auto_9857 ?auto_9872 ) ( ON ?auto_9857 ?auto_9893 ) ( CLEAR ?auto_9857 ) ( TRUCK-AT ?auto_9870 ?auto_9868 ) ( not ( = ?auto_9856 ?auto_9857 ) ) ( not ( = ?auto_9856 ?auto_9893 ) ) ( not ( = ?auto_9857 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9858 ) ) ( not ( = ?auto_9856 ?auto_9882 ) ) ( not ( = ?auto_9858 ?auto_9893 ) ) ( not ( = ?auto_9875 ?auto_9872 ) ) ( not ( = ?auto_9890 ?auto_9867 ) ) ( not ( = ?auto_9882 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9859 ) ) ( not ( = ?auto_9856 ?auto_9885 ) ) ( not ( = ?auto_9857 ?auto_9859 ) ) ( not ( = ?auto_9857 ?auto_9885 ) ) ( not ( = ?auto_9859 ?auto_9882 ) ) ( not ( = ?auto_9859 ?auto_9893 ) ) ( not ( = ?auto_9887 ?auto_9875 ) ) ( not ( = ?auto_9887 ?auto_9872 ) ) ( not ( = ?auto_9874 ?auto_9890 ) ) ( not ( = ?auto_9874 ?auto_9867 ) ) ( not ( = ?auto_9885 ?auto_9882 ) ) ( not ( = ?auto_9885 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9860 ) ) ( not ( = ?auto_9856 ?auto_9888 ) ) ( not ( = ?auto_9857 ?auto_9860 ) ) ( not ( = ?auto_9857 ?auto_9888 ) ) ( not ( = ?auto_9858 ?auto_9860 ) ) ( not ( = ?auto_9858 ?auto_9888 ) ) ( not ( = ?auto_9860 ?auto_9885 ) ) ( not ( = ?auto_9860 ?auto_9882 ) ) ( not ( = ?auto_9860 ?auto_9893 ) ) ( not ( = ?auto_9876 ?auto_9887 ) ) ( not ( = ?auto_9876 ?auto_9875 ) ) ( not ( = ?auto_9876 ?auto_9872 ) ) ( not ( = ?auto_9881 ?auto_9874 ) ) ( not ( = ?auto_9881 ?auto_9890 ) ) ( not ( = ?auto_9881 ?auto_9867 ) ) ( not ( = ?auto_9888 ?auto_9885 ) ) ( not ( = ?auto_9888 ?auto_9882 ) ) ( not ( = ?auto_9888 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9861 ) ) ( not ( = ?auto_9856 ?auto_9873 ) ) ( not ( = ?auto_9857 ?auto_9861 ) ) ( not ( = ?auto_9857 ?auto_9873 ) ) ( not ( = ?auto_9858 ?auto_9861 ) ) ( not ( = ?auto_9858 ?auto_9873 ) ) ( not ( = ?auto_9859 ?auto_9861 ) ) ( not ( = ?auto_9859 ?auto_9873 ) ) ( not ( = ?auto_9861 ?auto_9888 ) ) ( not ( = ?auto_9861 ?auto_9885 ) ) ( not ( = ?auto_9861 ?auto_9882 ) ) ( not ( = ?auto_9861 ?auto_9893 ) ) ( not ( = ?auto_9886 ?auto_9876 ) ) ( not ( = ?auto_9886 ?auto_9887 ) ) ( not ( = ?auto_9886 ?auto_9875 ) ) ( not ( = ?auto_9886 ?auto_9872 ) ) ( not ( = ?auto_9892 ?auto_9881 ) ) ( not ( = ?auto_9892 ?auto_9874 ) ) ( not ( = ?auto_9892 ?auto_9890 ) ) ( not ( = ?auto_9892 ?auto_9867 ) ) ( not ( = ?auto_9873 ?auto_9888 ) ) ( not ( = ?auto_9873 ?auto_9885 ) ) ( not ( = ?auto_9873 ?auto_9882 ) ) ( not ( = ?auto_9873 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9862 ) ) ( not ( = ?auto_9856 ?auto_9883 ) ) ( not ( = ?auto_9857 ?auto_9862 ) ) ( not ( = ?auto_9857 ?auto_9883 ) ) ( not ( = ?auto_9858 ?auto_9862 ) ) ( not ( = ?auto_9858 ?auto_9883 ) ) ( not ( = ?auto_9859 ?auto_9862 ) ) ( not ( = ?auto_9859 ?auto_9883 ) ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9860 ?auto_9883 ) ) ( not ( = ?auto_9862 ?auto_9873 ) ) ( not ( = ?auto_9862 ?auto_9888 ) ) ( not ( = ?auto_9862 ?auto_9885 ) ) ( not ( = ?auto_9862 ?auto_9882 ) ) ( not ( = ?auto_9862 ?auto_9893 ) ) ( not ( = ?auto_9884 ?auto_9886 ) ) ( not ( = ?auto_9884 ?auto_9876 ) ) ( not ( = ?auto_9884 ?auto_9887 ) ) ( not ( = ?auto_9884 ?auto_9875 ) ) ( not ( = ?auto_9884 ?auto_9872 ) ) ( not ( = ?auto_9889 ?auto_9892 ) ) ( not ( = ?auto_9889 ?auto_9881 ) ) ( not ( = ?auto_9889 ?auto_9874 ) ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( not ( = ?auto_9889 ?auto_9867 ) ) ( not ( = ?auto_9883 ?auto_9873 ) ) ( not ( = ?auto_9883 ?auto_9888 ) ) ( not ( = ?auto_9883 ?auto_9885 ) ) ( not ( = ?auto_9883 ?auto_9882 ) ) ( not ( = ?auto_9883 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9865 ) ) ( not ( = ?auto_9856 ?auto_9880 ) ) ( not ( = ?auto_9857 ?auto_9865 ) ) ( not ( = ?auto_9857 ?auto_9880 ) ) ( not ( = ?auto_9858 ?auto_9865 ) ) ( not ( = ?auto_9858 ?auto_9880 ) ) ( not ( = ?auto_9859 ?auto_9865 ) ) ( not ( = ?auto_9859 ?auto_9880 ) ) ( not ( = ?auto_9860 ?auto_9865 ) ) ( not ( = ?auto_9860 ?auto_9880 ) ) ( not ( = ?auto_9861 ?auto_9865 ) ) ( not ( = ?auto_9861 ?auto_9880 ) ) ( not ( = ?auto_9865 ?auto_9883 ) ) ( not ( = ?auto_9865 ?auto_9873 ) ) ( not ( = ?auto_9865 ?auto_9888 ) ) ( not ( = ?auto_9865 ?auto_9885 ) ) ( not ( = ?auto_9865 ?auto_9882 ) ) ( not ( = ?auto_9865 ?auto_9893 ) ) ( not ( = ?auto_9880 ?auto_9883 ) ) ( not ( = ?auto_9880 ?auto_9873 ) ) ( not ( = ?auto_9880 ?auto_9888 ) ) ( not ( = ?auto_9880 ?auto_9885 ) ) ( not ( = ?auto_9880 ?auto_9882 ) ) ( not ( = ?auto_9880 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9864 ) ) ( not ( = ?auto_9856 ?auto_9877 ) ) ( not ( = ?auto_9857 ?auto_9864 ) ) ( not ( = ?auto_9857 ?auto_9877 ) ) ( not ( = ?auto_9858 ?auto_9864 ) ) ( not ( = ?auto_9858 ?auto_9877 ) ) ( not ( = ?auto_9859 ?auto_9864 ) ) ( not ( = ?auto_9859 ?auto_9877 ) ) ( not ( = ?auto_9860 ?auto_9864 ) ) ( not ( = ?auto_9860 ?auto_9877 ) ) ( not ( = ?auto_9861 ?auto_9864 ) ) ( not ( = ?auto_9861 ?auto_9877 ) ) ( not ( = ?auto_9862 ?auto_9864 ) ) ( not ( = ?auto_9862 ?auto_9877 ) ) ( not ( = ?auto_9864 ?auto_9880 ) ) ( not ( = ?auto_9864 ?auto_9883 ) ) ( not ( = ?auto_9864 ?auto_9873 ) ) ( not ( = ?auto_9864 ?auto_9888 ) ) ( not ( = ?auto_9864 ?auto_9885 ) ) ( not ( = ?auto_9864 ?auto_9882 ) ) ( not ( = ?auto_9864 ?auto_9893 ) ) ( not ( = ?auto_9877 ?auto_9880 ) ) ( not ( = ?auto_9877 ?auto_9883 ) ) ( not ( = ?auto_9877 ?auto_9873 ) ) ( not ( = ?auto_9877 ?auto_9888 ) ) ( not ( = ?auto_9877 ?auto_9885 ) ) ( not ( = ?auto_9877 ?auto_9882 ) ) ( not ( = ?auto_9877 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9863 ) ) ( not ( = ?auto_9856 ?auto_9878 ) ) ( not ( = ?auto_9857 ?auto_9863 ) ) ( not ( = ?auto_9857 ?auto_9878 ) ) ( not ( = ?auto_9858 ?auto_9863 ) ) ( not ( = ?auto_9858 ?auto_9878 ) ) ( not ( = ?auto_9859 ?auto_9863 ) ) ( not ( = ?auto_9859 ?auto_9878 ) ) ( not ( = ?auto_9860 ?auto_9863 ) ) ( not ( = ?auto_9860 ?auto_9878 ) ) ( not ( = ?auto_9861 ?auto_9863 ) ) ( not ( = ?auto_9861 ?auto_9878 ) ) ( not ( = ?auto_9862 ?auto_9863 ) ) ( not ( = ?auto_9862 ?auto_9878 ) ) ( not ( = ?auto_9865 ?auto_9863 ) ) ( not ( = ?auto_9865 ?auto_9878 ) ) ( not ( = ?auto_9863 ?auto_9877 ) ) ( not ( = ?auto_9863 ?auto_9880 ) ) ( not ( = ?auto_9863 ?auto_9883 ) ) ( not ( = ?auto_9863 ?auto_9873 ) ) ( not ( = ?auto_9863 ?auto_9888 ) ) ( not ( = ?auto_9863 ?auto_9885 ) ) ( not ( = ?auto_9863 ?auto_9882 ) ) ( not ( = ?auto_9863 ?auto_9893 ) ) ( not ( = ?auto_9891 ?auto_9875 ) ) ( not ( = ?auto_9891 ?auto_9887 ) ) ( not ( = ?auto_9891 ?auto_9884 ) ) ( not ( = ?auto_9891 ?auto_9886 ) ) ( not ( = ?auto_9891 ?auto_9876 ) ) ( not ( = ?auto_9891 ?auto_9872 ) ) ( not ( = ?auto_9879 ?auto_9890 ) ) ( not ( = ?auto_9879 ?auto_9874 ) ) ( not ( = ?auto_9879 ?auto_9889 ) ) ( not ( = ?auto_9879 ?auto_9892 ) ) ( not ( = ?auto_9879 ?auto_9881 ) ) ( not ( = ?auto_9879 ?auto_9867 ) ) ( not ( = ?auto_9878 ?auto_9877 ) ) ( not ( = ?auto_9878 ?auto_9880 ) ) ( not ( = ?auto_9878 ?auto_9883 ) ) ( not ( = ?auto_9878 ?auto_9873 ) ) ( not ( = ?auto_9878 ?auto_9888 ) ) ( not ( = ?auto_9878 ?auto_9885 ) ) ( not ( = ?auto_9878 ?auto_9882 ) ) ( not ( = ?auto_9878 ?auto_9893 ) ) ( not ( = ?auto_9856 ?auto_9866 ) ) ( not ( = ?auto_9856 ?auto_9871 ) ) ( not ( = ?auto_9857 ?auto_9866 ) ) ( not ( = ?auto_9857 ?auto_9871 ) ) ( not ( = ?auto_9858 ?auto_9866 ) ) ( not ( = ?auto_9858 ?auto_9871 ) ) ( not ( = ?auto_9859 ?auto_9866 ) ) ( not ( = ?auto_9859 ?auto_9871 ) ) ( not ( = ?auto_9860 ?auto_9866 ) ) ( not ( = ?auto_9860 ?auto_9871 ) ) ( not ( = ?auto_9861 ?auto_9866 ) ) ( not ( = ?auto_9861 ?auto_9871 ) ) ( not ( = ?auto_9862 ?auto_9866 ) ) ( not ( = ?auto_9862 ?auto_9871 ) ) ( not ( = ?auto_9865 ?auto_9866 ) ) ( not ( = ?auto_9865 ?auto_9871 ) ) ( not ( = ?auto_9864 ?auto_9866 ) ) ( not ( = ?auto_9864 ?auto_9871 ) ) ( not ( = ?auto_9866 ?auto_9878 ) ) ( not ( = ?auto_9866 ?auto_9877 ) ) ( not ( = ?auto_9866 ?auto_9880 ) ) ( not ( = ?auto_9866 ?auto_9883 ) ) ( not ( = ?auto_9866 ?auto_9873 ) ) ( not ( = ?auto_9866 ?auto_9888 ) ) ( not ( = ?auto_9866 ?auto_9885 ) ) ( not ( = ?auto_9866 ?auto_9882 ) ) ( not ( = ?auto_9866 ?auto_9893 ) ) ( not ( = ?auto_9871 ?auto_9878 ) ) ( not ( = ?auto_9871 ?auto_9877 ) ) ( not ( = ?auto_9871 ?auto_9880 ) ) ( not ( = ?auto_9871 ?auto_9883 ) ) ( not ( = ?auto_9871 ?auto_9873 ) ) ( not ( = ?auto_9871 ?auto_9888 ) ) ( not ( = ?auto_9871 ?auto_9885 ) ) ( not ( = ?auto_9871 ?auto_9882 ) ) ( not ( = ?auto_9871 ?auto_9893 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9856 ?auto_9857 ?auto_9858 ?auto_9859 ?auto_9860 ?auto_9861 ?auto_9862 ?auto_9865 ?auto_9864 ?auto_9863 )
      ( MAKE-1CRATE ?auto_9863 ?auto_9866 )
      ( MAKE-10CRATE-VERIFY ?auto_9856 ?auto_9857 ?auto_9858 ?auto_9859 ?auto_9860 ?auto_9861 ?auto_9862 ?auto_9865 ?auto_9864 ?auto_9863 ?auto_9866 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9896 - SURFACE
      ?auto_9897 - SURFACE
    )
    :vars
    (
      ?auto_9898 - HOIST
      ?auto_9899 - PLACE
      ?auto_9901 - PLACE
      ?auto_9902 - HOIST
      ?auto_9903 - SURFACE
      ?auto_9900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9898 ?auto_9899 ) ( SURFACE-AT ?auto_9896 ?auto_9899 ) ( CLEAR ?auto_9896 ) ( IS-CRATE ?auto_9897 ) ( AVAILABLE ?auto_9898 ) ( not ( = ?auto_9901 ?auto_9899 ) ) ( HOIST-AT ?auto_9902 ?auto_9901 ) ( AVAILABLE ?auto_9902 ) ( SURFACE-AT ?auto_9897 ?auto_9901 ) ( ON ?auto_9897 ?auto_9903 ) ( CLEAR ?auto_9897 ) ( TRUCK-AT ?auto_9900 ?auto_9899 ) ( not ( = ?auto_9896 ?auto_9897 ) ) ( not ( = ?auto_9896 ?auto_9903 ) ) ( not ( = ?auto_9897 ?auto_9903 ) ) ( not ( = ?auto_9898 ?auto_9902 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9900 ?auto_9899 ?auto_9901 )
      ( !LIFT ?auto_9902 ?auto_9897 ?auto_9903 ?auto_9901 )
      ( !LOAD ?auto_9902 ?auto_9897 ?auto_9900 ?auto_9901 )
      ( !DRIVE ?auto_9900 ?auto_9901 ?auto_9899 )
      ( !UNLOAD ?auto_9898 ?auto_9897 ?auto_9900 ?auto_9899 )
      ( !DROP ?auto_9898 ?auto_9897 ?auto_9896 ?auto_9899 )
      ( MAKE-1CRATE-VERIFY ?auto_9896 ?auto_9897 ) )
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
      ?auto_9925 - SURFACE
      ?auto_9924 - SURFACE
      ?auto_9923 - SURFACE
      ?auto_9926 - SURFACE
      ?auto_9927 - SURFACE
    )
    :vars
    (
      ?auto_9929 - HOIST
      ?auto_9933 - PLACE
      ?auto_9931 - PLACE
      ?auto_9928 - HOIST
      ?auto_9930 - SURFACE
      ?auto_9957 - PLACE
      ?auto_9956 - HOIST
      ?auto_9951 - SURFACE
      ?auto_9941 - PLACE
      ?auto_9935 - HOIST
      ?auto_9939 - SURFACE
      ?auto_9944 - PLACE
      ?auto_9946 - HOIST
      ?auto_9947 - SURFACE
      ?auto_9955 - PLACE
      ?auto_9934 - HOIST
      ?auto_9948 - SURFACE
      ?auto_9945 - PLACE
      ?auto_9943 - HOIST
      ?auto_9953 - SURFACE
      ?auto_9936 - PLACE
      ?auto_9950 - HOIST
      ?auto_9940 - SURFACE
      ?auto_9942 - PLACE
      ?auto_9938 - HOIST
      ?auto_9937 - SURFACE
      ?auto_9952 - SURFACE
      ?auto_9954 - SURFACE
      ?auto_9949 - SURFACE
      ?auto_9932 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9929 ?auto_9933 ) ( IS-CRATE ?auto_9927 ) ( not ( = ?auto_9931 ?auto_9933 ) ) ( HOIST-AT ?auto_9928 ?auto_9931 ) ( AVAILABLE ?auto_9928 ) ( SURFACE-AT ?auto_9927 ?auto_9931 ) ( ON ?auto_9927 ?auto_9930 ) ( CLEAR ?auto_9927 ) ( not ( = ?auto_9926 ?auto_9927 ) ) ( not ( = ?auto_9926 ?auto_9930 ) ) ( not ( = ?auto_9927 ?auto_9930 ) ) ( not ( = ?auto_9929 ?auto_9928 ) ) ( IS-CRATE ?auto_9926 ) ( not ( = ?auto_9957 ?auto_9933 ) ) ( HOIST-AT ?auto_9956 ?auto_9957 ) ( SURFACE-AT ?auto_9926 ?auto_9957 ) ( ON ?auto_9926 ?auto_9951 ) ( CLEAR ?auto_9926 ) ( not ( = ?auto_9923 ?auto_9926 ) ) ( not ( = ?auto_9923 ?auto_9951 ) ) ( not ( = ?auto_9926 ?auto_9951 ) ) ( not ( = ?auto_9929 ?auto_9956 ) ) ( IS-CRATE ?auto_9923 ) ( not ( = ?auto_9941 ?auto_9933 ) ) ( HOIST-AT ?auto_9935 ?auto_9941 ) ( AVAILABLE ?auto_9935 ) ( SURFACE-AT ?auto_9923 ?auto_9941 ) ( ON ?auto_9923 ?auto_9939 ) ( CLEAR ?auto_9923 ) ( not ( = ?auto_9924 ?auto_9923 ) ) ( not ( = ?auto_9924 ?auto_9939 ) ) ( not ( = ?auto_9923 ?auto_9939 ) ) ( not ( = ?auto_9929 ?auto_9935 ) ) ( IS-CRATE ?auto_9924 ) ( not ( = ?auto_9944 ?auto_9933 ) ) ( HOIST-AT ?auto_9946 ?auto_9944 ) ( SURFACE-AT ?auto_9924 ?auto_9944 ) ( ON ?auto_9924 ?auto_9947 ) ( CLEAR ?auto_9924 ) ( not ( = ?auto_9925 ?auto_9924 ) ) ( not ( = ?auto_9925 ?auto_9947 ) ) ( not ( = ?auto_9924 ?auto_9947 ) ) ( not ( = ?auto_9929 ?auto_9946 ) ) ( IS-CRATE ?auto_9925 ) ( not ( = ?auto_9955 ?auto_9933 ) ) ( HOIST-AT ?auto_9934 ?auto_9955 ) ( SURFACE-AT ?auto_9925 ?auto_9955 ) ( ON ?auto_9925 ?auto_9948 ) ( CLEAR ?auto_9925 ) ( not ( = ?auto_9922 ?auto_9925 ) ) ( not ( = ?auto_9922 ?auto_9948 ) ) ( not ( = ?auto_9925 ?auto_9948 ) ) ( not ( = ?auto_9929 ?auto_9934 ) ) ( IS-CRATE ?auto_9922 ) ( not ( = ?auto_9945 ?auto_9933 ) ) ( HOIST-AT ?auto_9943 ?auto_9945 ) ( AVAILABLE ?auto_9943 ) ( SURFACE-AT ?auto_9922 ?auto_9945 ) ( ON ?auto_9922 ?auto_9953 ) ( CLEAR ?auto_9922 ) ( not ( = ?auto_9921 ?auto_9922 ) ) ( not ( = ?auto_9921 ?auto_9953 ) ) ( not ( = ?auto_9922 ?auto_9953 ) ) ( not ( = ?auto_9929 ?auto_9943 ) ) ( IS-CRATE ?auto_9921 ) ( not ( = ?auto_9936 ?auto_9933 ) ) ( HOIST-AT ?auto_9950 ?auto_9936 ) ( AVAILABLE ?auto_9950 ) ( SURFACE-AT ?auto_9921 ?auto_9936 ) ( ON ?auto_9921 ?auto_9940 ) ( CLEAR ?auto_9921 ) ( not ( = ?auto_9920 ?auto_9921 ) ) ( not ( = ?auto_9920 ?auto_9940 ) ) ( not ( = ?auto_9921 ?auto_9940 ) ) ( not ( = ?auto_9929 ?auto_9950 ) ) ( IS-CRATE ?auto_9920 ) ( not ( = ?auto_9942 ?auto_9933 ) ) ( HOIST-AT ?auto_9938 ?auto_9942 ) ( AVAILABLE ?auto_9938 ) ( SURFACE-AT ?auto_9920 ?auto_9942 ) ( ON ?auto_9920 ?auto_9937 ) ( CLEAR ?auto_9920 ) ( not ( = ?auto_9919 ?auto_9920 ) ) ( not ( = ?auto_9919 ?auto_9937 ) ) ( not ( = ?auto_9920 ?auto_9937 ) ) ( not ( = ?auto_9929 ?auto_9938 ) ) ( IS-CRATE ?auto_9919 ) ( AVAILABLE ?auto_9934 ) ( SURFACE-AT ?auto_9919 ?auto_9955 ) ( ON ?auto_9919 ?auto_9952 ) ( CLEAR ?auto_9919 ) ( not ( = ?auto_9918 ?auto_9919 ) ) ( not ( = ?auto_9918 ?auto_9952 ) ) ( not ( = ?auto_9919 ?auto_9952 ) ) ( IS-CRATE ?auto_9918 ) ( AVAILABLE ?auto_9946 ) ( SURFACE-AT ?auto_9918 ?auto_9944 ) ( ON ?auto_9918 ?auto_9954 ) ( CLEAR ?auto_9918 ) ( not ( = ?auto_9917 ?auto_9918 ) ) ( not ( = ?auto_9917 ?auto_9954 ) ) ( not ( = ?auto_9918 ?auto_9954 ) ) ( SURFACE-AT ?auto_9916 ?auto_9933 ) ( CLEAR ?auto_9916 ) ( IS-CRATE ?auto_9917 ) ( AVAILABLE ?auto_9929 ) ( AVAILABLE ?auto_9956 ) ( SURFACE-AT ?auto_9917 ?auto_9957 ) ( ON ?auto_9917 ?auto_9949 ) ( CLEAR ?auto_9917 ) ( TRUCK-AT ?auto_9932 ?auto_9933 ) ( not ( = ?auto_9916 ?auto_9917 ) ) ( not ( = ?auto_9916 ?auto_9949 ) ) ( not ( = ?auto_9917 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9918 ) ) ( not ( = ?auto_9916 ?auto_9954 ) ) ( not ( = ?auto_9918 ?auto_9949 ) ) ( not ( = ?auto_9944 ?auto_9957 ) ) ( not ( = ?auto_9946 ?auto_9956 ) ) ( not ( = ?auto_9954 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9919 ) ) ( not ( = ?auto_9916 ?auto_9952 ) ) ( not ( = ?auto_9917 ?auto_9919 ) ) ( not ( = ?auto_9917 ?auto_9952 ) ) ( not ( = ?auto_9919 ?auto_9954 ) ) ( not ( = ?auto_9919 ?auto_9949 ) ) ( not ( = ?auto_9955 ?auto_9944 ) ) ( not ( = ?auto_9955 ?auto_9957 ) ) ( not ( = ?auto_9934 ?auto_9946 ) ) ( not ( = ?auto_9934 ?auto_9956 ) ) ( not ( = ?auto_9952 ?auto_9954 ) ) ( not ( = ?auto_9952 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9920 ) ) ( not ( = ?auto_9916 ?auto_9937 ) ) ( not ( = ?auto_9917 ?auto_9920 ) ) ( not ( = ?auto_9917 ?auto_9937 ) ) ( not ( = ?auto_9918 ?auto_9920 ) ) ( not ( = ?auto_9918 ?auto_9937 ) ) ( not ( = ?auto_9920 ?auto_9952 ) ) ( not ( = ?auto_9920 ?auto_9954 ) ) ( not ( = ?auto_9920 ?auto_9949 ) ) ( not ( = ?auto_9942 ?auto_9955 ) ) ( not ( = ?auto_9942 ?auto_9944 ) ) ( not ( = ?auto_9942 ?auto_9957 ) ) ( not ( = ?auto_9938 ?auto_9934 ) ) ( not ( = ?auto_9938 ?auto_9946 ) ) ( not ( = ?auto_9938 ?auto_9956 ) ) ( not ( = ?auto_9937 ?auto_9952 ) ) ( not ( = ?auto_9937 ?auto_9954 ) ) ( not ( = ?auto_9937 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9921 ) ) ( not ( = ?auto_9916 ?auto_9940 ) ) ( not ( = ?auto_9917 ?auto_9921 ) ) ( not ( = ?auto_9917 ?auto_9940 ) ) ( not ( = ?auto_9918 ?auto_9921 ) ) ( not ( = ?auto_9918 ?auto_9940 ) ) ( not ( = ?auto_9919 ?auto_9921 ) ) ( not ( = ?auto_9919 ?auto_9940 ) ) ( not ( = ?auto_9921 ?auto_9937 ) ) ( not ( = ?auto_9921 ?auto_9952 ) ) ( not ( = ?auto_9921 ?auto_9954 ) ) ( not ( = ?auto_9921 ?auto_9949 ) ) ( not ( = ?auto_9936 ?auto_9942 ) ) ( not ( = ?auto_9936 ?auto_9955 ) ) ( not ( = ?auto_9936 ?auto_9944 ) ) ( not ( = ?auto_9936 ?auto_9957 ) ) ( not ( = ?auto_9950 ?auto_9938 ) ) ( not ( = ?auto_9950 ?auto_9934 ) ) ( not ( = ?auto_9950 ?auto_9946 ) ) ( not ( = ?auto_9950 ?auto_9956 ) ) ( not ( = ?auto_9940 ?auto_9937 ) ) ( not ( = ?auto_9940 ?auto_9952 ) ) ( not ( = ?auto_9940 ?auto_9954 ) ) ( not ( = ?auto_9940 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9922 ) ) ( not ( = ?auto_9916 ?auto_9953 ) ) ( not ( = ?auto_9917 ?auto_9922 ) ) ( not ( = ?auto_9917 ?auto_9953 ) ) ( not ( = ?auto_9918 ?auto_9922 ) ) ( not ( = ?auto_9918 ?auto_9953 ) ) ( not ( = ?auto_9919 ?auto_9922 ) ) ( not ( = ?auto_9919 ?auto_9953 ) ) ( not ( = ?auto_9920 ?auto_9922 ) ) ( not ( = ?auto_9920 ?auto_9953 ) ) ( not ( = ?auto_9922 ?auto_9940 ) ) ( not ( = ?auto_9922 ?auto_9937 ) ) ( not ( = ?auto_9922 ?auto_9952 ) ) ( not ( = ?auto_9922 ?auto_9954 ) ) ( not ( = ?auto_9922 ?auto_9949 ) ) ( not ( = ?auto_9945 ?auto_9936 ) ) ( not ( = ?auto_9945 ?auto_9942 ) ) ( not ( = ?auto_9945 ?auto_9955 ) ) ( not ( = ?auto_9945 ?auto_9944 ) ) ( not ( = ?auto_9945 ?auto_9957 ) ) ( not ( = ?auto_9943 ?auto_9950 ) ) ( not ( = ?auto_9943 ?auto_9938 ) ) ( not ( = ?auto_9943 ?auto_9934 ) ) ( not ( = ?auto_9943 ?auto_9946 ) ) ( not ( = ?auto_9943 ?auto_9956 ) ) ( not ( = ?auto_9953 ?auto_9940 ) ) ( not ( = ?auto_9953 ?auto_9937 ) ) ( not ( = ?auto_9953 ?auto_9952 ) ) ( not ( = ?auto_9953 ?auto_9954 ) ) ( not ( = ?auto_9953 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9925 ) ) ( not ( = ?auto_9916 ?auto_9948 ) ) ( not ( = ?auto_9917 ?auto_9925 ) ) ( not ( = ?auto_9917 ?auto_9948 ) ) ( not ( = ?auto_9918 ?auto_9925 ) ) ( not ( = ?auto_9918 ?auto_9948 ) ) ( not ( = ?auto_9919 ?auto_9925 ) ) ( not ( = ?auto_9919 ?auto_9948 ) ) ( not ( = ?auto_9920 ?auto_9925 ) ) ( not ( = ?auto_9920 ?auto_9948 ) ) ( not ( = ?auto_9921 ?auto_9925 ) ) ( not ( = ?auto_9921 ?auto_9948 ) ) ( not ( = ?auto_9925 ?auto_9953 ) ) ( not ( = ?auto_9925 ?auto_9940 ) ) ( not ( = ?auto_9925 ?auto_9937 ) ) ( not ( = ?auto_9925 ?auto_9952 ) ) ( not ( = ?auto_9925 ?auto_9954 ) ) ( not ( = ?auto_9925 ?auto_9949 ) ) ( not ( = ?auto_9948 ?auto_9953 ) ) ( not ( = ?auto_9948 ?auto_9940 ) ) ( not ( = ?auto_9948 ?auto_9937 ) ) ( not ( = ?auto_9948 ?auto_9952 ) ) ( not ( = ?auto_9948 ?auto_9954 ) ) ( not ( = ?auto_9948 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9924 ) ) ( not ( = ?auto_9916 ?auto_9947 ) ) ( not ( = ?auto_9917 ?auto_9924 ) ) ( not ( = ?auto_9917 ?auto_9947 ) ) ( not ( = ?auto_9918 ?auto_9924 ) ) ( not ( = ?auto_9918 ?auto_9947 ) ) ( not ( = ?auto_9919 ?auto_9924 ) ) ( not ( = ?auto_9919 ?auto_9947 ) ) ( not ( = ?auto_9920 ?auto_9924 ) ) ( not ( = ?auto_9920 ?auto_9947 ) ) ( not ( = ?auto_9921 ?auto_9924 ) ) ( not ( = ?auto_9921 ?auto_9947 ) ) ( not ( = ?auto_9922 ?auto_9924 ) ) ( not ( = ?auto_9922 ?auto_9947 ) ) ( not ( = ?auto_9924 ?auto_9948 ) ) ( not ( = ?auto_9924 ?auto_9953 ) ) ( not ( = ?auto_9924 ?auto_9940 ) ) ( not ( = ?auto_9924 ?auto_9937 ) ) ( not ( = ?auto_9924 ?auto_9952 ) ) ( not ( = ?auto_9924 ?auto_9954 ) ) ( not ( = ?auto_9924 ?auto_9949 ) ) ( not ( = ?auto_9947 ?auto_9948 ) ) ( not ( = ?auto_9947 ?auto_9953 ) ) ( not ( = ?auto_9947 ?auto_9940 ) ) ( not ( = ?auto_9947 ?auto_9937 ) ) ( not ( = ?auto_9947 ?auto_9952 ) ) ( not ( = ?auto_9947 ?auto_9954 ) ) ( not ( = ?auto_9947 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9923 ) ) ( not ( = ?auto_9916 ?auto_9939 ) ) ( not ( = ?auto_9917 ?auto_9923 ) ) ( not ( = ?auto_9917 ?auto_9939 ) ) ( not ( = ?auto_9918 ?auto_9923 ) ) ( not ( = ?auto_9918 ?auto_9939 ) ) ( not ( = ?auto_9919 ?auto_9923 ) ) ( not ( = ?auto_9919 ?auto_9939 ) ) ( not ( = ?auto_9920 ?auto_9923 ) ) ( not ( = ?auto_9920 ?auto_9939 ) ) ( not ( = ?auto_9921 ?auto_9923 ) ) ( not ( = ?auto_9921 ?auto_9939 ) ) ( not ( = ?auto_9922 ?auto_9923 ) ) ( not ( = ?auto_9922 ?auto_9939 ) ) ( not ( = ?auto_9925 ?auto_9923 ) ) ( not ( = ?auto_9925 ?auto_9939 ) ) ( not ( = ?auto_9923 ?auto_9947 ) ) ( not ( = ?auto_9923 ?auto_9948 ) ) ( not ( = ?auto_9923 ?auto_9953 ) ) ( not ( = ?auto_9923 ?auto_9940 ) ) ( not ( = ?auto_9923 ?auto_9937 ) ) ( not ( = ?auto_9923 ?auto_9952 ) ) ( not ( = ?auto_9923 ?auto_9954 ) ) ( not ( = ?auto_9923 ?auto_9949 ) ) ( not ( = ?auto_9941 ?auto_9944 ) ) ( not ( = ?auto_9941 ?auto_9955 ) ) ( not ( = ?auto_9941 ?auto_9945 ) ) ( not ( = ?auto_9941 ?auto_9936 ) ) ( not ( = ?auto_9941 ?auto_9942 ) ) ( not ( = ?auto_9941 ?auto_9957 ) ) ( not ( = ?auto_9935 ?auto_9946 ) ) ( not ( = ?auto_9935 ?auto_9934 ) ) ( not ( = ?auto_9935 ?auto_9943 ) ) ( not ( = ?auto_9935 ?auto_9950 ) ) ( not ( = ?auto_9935 ?auto_9938 ) ) ( not ( = ?auto_9935 ?auto_9956 ) ) ( not ( = ?auto_9939 ?auto_9947 ) ) ( not ( = ?auto_9939 ?auto_9948 ) ) ( not ( = ?auto_9939 ?auto_9953 ) ) ( not ( = ?auto_9939 ?auto_9940 ) ) ( not ( = ?auto_9939 ?auto_9937 ) ) ( not ( = ?auto_9939 ?auto_9952 ) ) ( not ( = ?auto_9939 ?auto_9954 ) ) ( not ( = ?auto_9939 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9926 ) ) ( not ( = ?auto_9916 ?auto_9951 ) ) ( not ( = ?auto_9917 ?auto_9926 ) ) ( not ( = ?auto_9917 ?auto_9951 ) ) ( not ( = ?auto_9918 ?auto_9926 ) ) ( not ( = ?auto_9918 ?auto_9951 ) ) ( not ( = ?auto_9919 ?auto_9926 ) ) ( not ( = ?auto_9919 ?auto_9951 ) ) ( not ( = ?auto_9920 ?auto_9926 ) ) ( not ( = ?auto_9920 ?auto_9951 ) ) ( not ( = ?auto_9921 ?auto_9926 ) ) ( not ( = ?auto_9921 ?auto_9951 ) ) ( not ( = ?auto_9922 ?auto_9926 ) ) ( not ( = ?auto_9922 ?auto_9951 ) ) ( not ( = ?auto_9925 ?auto_9926 ) ) ( not ( = ?auto_9925 ?auto_9951 ) ) ( not ( = ?auto_9924 ?auto_9926 ) ) ( not ( = ?auto_9924 ?auto_9951 ) ) ( not ( = ?auto_9926 ?auto_9939 ) ) ( not ( = ?auto_9926 ?auto_9947 ) ) ( not ( = ?auto_9926 ?auto_9948 ) ) ( not ( = ?auto_9926 ?auto_9953 ) ) ( not ( = ?auto_9926 ?auto_9940 ) ) ( not ( = ?auto_9926 ?auto_9937 ) ) ( not ( = ?auto_9926 ?auto_9952 ) ) ( not ( = ?auto_9926 ?auto_9954 ) ) ( not ( = ?auto_9926 ?auto_9949 ) ) ( not ( = ?auto_9951 ?auto_9939 ) ) ( not ( = ?auto_9951 ?auto_9947 ) ) ( not ( = ?auto_9951 ?auto_9948 ) ) ( not ( = ?auto_9951 ?auto_9953 ) ) ( not ( = ?auto_9951 ?auto_9940 ) ) ( not ( = ?auto_9951 ?auto_9937 ) ) ( not ( = ?auto_9951 ?auto_9952 ) ) ( not ( = ?auto_9951 ?auto_9954 ) ) ( not ( = ?auto_9951 ?auto_9949 ) ) ( not ( = ?auto_9916 ?auto_9927 ) ) ( not ( = ?auto_9916 ?auto_9930 ) ) ( not ( = ?auto_9917 ?auto_9927 ) ) ( not ( = ?auto_9917 ?auto_9930 ) ) ( not ( = ?auto_9918 ?auto_9927 ) ) ( not ( = ?auto_9918 ?auto_9930 ) ) ( not ( = ?auto_9919 ?auto_9927 ) ) ( not ( = ?auto_9919 ?auto_9930 ) ) ( not ( = ?auto_9920 ?auto_9927 ) ) ( not ( = ?auto_9920 ?auto_9930 ) ) ( not ( = ?auto_9921 ?auto_9927 ) ) ( not ( = ?auto_9921 ?auto_9930 ) ) ( not ( = ?auto_9922 ?auto_9927 ) ) ( not ( = ?auto_9922 ?auto_9930 ) ) ( not ( = ?auto_9925 ?auto_9927 ) ) ( not ( = ?auto_9925 ?auto_9930 ) ) ( not ( = ?auto_9924 ?auto_9927 ) ) ( not ( = ?auto_9924 ?auto_9930 ) ) ( not ( = ?auto_9923 ?auto_9927 ) ) ( not ( = ?auto_9923 ?auto_9930 ) ) ( not ( = ?auto_9927 ?auto_9951 ) ) ( not ( = ?auto_9927 ?auto_9939 ) ) ( not ( = ?auto_9927 ?auto_9947 ) ) ( not ( = ?auto_9927 ?auto_9948 ) ) ( not ( = ?auto_9927 ?auto_9953 ) ) ( not ( = ?auto_9927 ?auto_9940 ) ) ( not ( = ?auto_9927 ?auto_9937 ) ) ( not ( = ?auto_9927 ?auto_9952 ) ) ( not ( = ?auto_9927 ?auto_9954 ) ) ( not ( = ?auto_9927 ?auto_9949 ) ) ( not ( = ?auto_9931 ?auto_9957 ) ) ( not ( = ?auto_9931 ?auto_9941 ) ) ( not ( = ?auto_9931 ?auto_9944 ) ) ( not ( = ?auto_9931 ?auto_9955 ) ) ( not ( = ?auto_9931 ?auto_9945 ) ) ( not ( = ?auto_9931 ?auto_9936 ) ) ( not ( = ?auto_9931 ?auto_9942 ) ) ( not ( = ?auto_9928 ?auto_9956 ) ) ( not ( = ?auto_9928 ?auto_9935 ) ) ( not ( = ?auto_9928 ?auto_9946 ) ) ( not ( = ?auto_9928 ?auto_9934 ) ) ( not ( = ?auto_9928 ?auto_9943 ) ) ( not ( = ?auto_9928 ?auto_9950 ) ) ( not ( = ?auto_9928 ?auto_9938 ) ) ( not ( = ?auto_9930 ?auto_9951 ) ) ( not ( = ?auto_9930 ?auto_9939 ) ) ( not ( = ?auto_9930 ?auto_9947 ) ) ( not ( = ?auto_9930 ?auto_9948 ) ) ( not ( = ?auto_9930 ?auto_9953 ) ) ( not ( = ?auto_9930 ?auto_9940 ) ) ( not ( = ?auto_9930 ?auto_9937 ) ) ( not ( = ?auto_9930 ?auto_9952 ) ) ( not ( = ?auto_9930 ?auto_9954 ) ) ( not ( = ?auto_9930 ?auto_9949 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9916 ?auto_9917 ?auto_9918 ?auto_9919 ?auto_9920 ?auto_9921 ?auto_9922 ?auto_9925 ?auto_9924 ?auto_9923 ?auto_9926 )
      ( MAKE-1CRATE ?auto_9926 ?auto_9927 )
      ( MAKE-11CRATE-VERIFY ?auto_9916 ?auto_9917 ?auto_9918 ?auto_9919 ?auto_9920 ?auto_9921 ?auto_9922 ?auto_9925 ?auto_9924 ?auto_9923 ?auto_9926 ?auto_9927 ) )
  )

)

