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
      ?auto_9461 - SURFACE
      ?auto_9462 - SURFACE
    )
    :vars
    (
      ?auto_9463 - HOIST
      ?auto_9464 - PLACE
      ?auto_9466 - PLACE
      ?auto_9467 - HOIST
      ?auto_9468 - SURFACE
      ?auto_9465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9463 ?auto_9464 ) ( SURFACE-AT ?auto_9461 ?auto_9464 ) ( CLEAR ?auto_9461 ) ( IS-CRATE ?auto_9462 ) ( AVAILABLE ?auto_9463 ) ( not ( = ?auto_9466 ?auto_9464 ) ) ( HOIST-AT ?auto_9467 ?auto_9466 ) ( AVAILABLE ?auto_9467 ) ( SURFACE-AT ?auto_9462 ?auto_9466 ) ( ON ?auto_9462 ?auto_9468 ) ( CLEAR ?auto_9462 ) ( TRUCK-AT ?auto_9465 ?auto_9464 ) ( not ( = ?auto_9461 ?auto_9462 ) ) ( not ( = ?auto_9461 ?auto_9468 ) ) ( not ( = ?auto_9462 ?auto_9468 ) ) ( not ( = ?auto_9463 ?auto_9467 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9465 ?auto_9464 ?auto_9466 )
      ( !LIFT ?auto_9467 ?auto_9462 ?auto_9468 ?auto_9466 )
      ( !LOAD ?auto_9467 ?auto_9462 ?auto_9465 ?auto_9466 )
      ( !DRIVE ?auto_9465 ?auto_9466 ?auto_9464 )
      ( !UNLOAD ?auto_9463 ?auto_9462 ?auto_9465 ?auto_9464 )
      ( !DROP ?auto_9463 ?auto_9462 ?auto_9461 ?auto_9464 )
      ( MAKE-1CRATE-VERIFY ?auto_9461 ?auto_9462 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9482 - SURFACE
      ?auto_9483 - SURFACE
      ?auto_9484 - SURFACE
    )
    :vars
    (
      ?auto_9486 - HOIST
      ?auto_9488 - PLACE
      ?auto_9490 - PLACE
      ?auto_9489 - HOIST
      ?auto_9485 - SURFACE
      ?auto_9491 - PLACE
      ?auto_9493 - HOIST
      ?auto_9492 - SURFACE
      ?auto_9487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9486 ?auto_9488 ) ( IS-CRATE ?auto_9484 ) ( not ( = ?auto_9490 ?auto_9488 ) ) ( HOIST-AT ?auto_9489 ?auto_9490 ) ( AVAILABLE ?auto_9489 ) ( SURFACE-AT ?auto_9484 ?auto_9490 ) ( ON ?auto_9484 ?auto_9485 ) ( CLEAR ?auto_9484 ) ( not ( = ?auto_9483 ?auto_9484 ) ) ( not ( = ?auto_9483 ?auto_9485 ) ) ( not ( = ?auto_9484 ?auto_9485 ) ) ( not ( = ?auto_9486 ?auto_9489 ) ) ( SURFACE-AT ?auto_9482 ?auto_9488 ) ( CLEAR ?auto_9482 ) ( IS-CRATE ?auto_9483 ) ( AVAILABLE ?auto_9486 ) ( not ( = ?auto_9491 ?auto_9488 ) ) ( HOIST-AT ?auto_9493 ?auto_9491 ) ( AVAILABLE ?auto_9493 ) ( SURFACE-AT ?auto_9483 ?auto_9491 ) ( ON ?auto_9483 ?auto_9492 ) ( CLEAR ?auto_9483 ) ( TRUCK-AT ?auto_9487 ?auto_9488 ) ( not ( = ?auto_9482 ?auto_9483 ) ) ( not ( = ?auto_9482 ?auto_9492 ) ) ( not ( = ?auto_9483 ?auto_9492 ) ) ( not ( = ?auto_9486 ?auto_9493 ) ) ( not ( = ?auto_9482 ?auto_9484 ) ) ( not ( = ?auto_9482 ?auto_9485 ) ) ( not ( = ?auto_9484 ?auto_9492 ) ) ( not ( = ?auto_9490 ?auto_9491 ) ) ( not ( = ?auto_9489 ?auto_9493 ) ) ( not ( = ?auto_9485 ?auto_9492 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9482 ?auto_9483 )
      ( MAKE-1CRATE ?auto_9483 ?auto_9484 )
      ( MAKE-2CRATE-VERIFY ?auto_9482 ?auto_9483 ?auto_9484 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9508 - SURFACE
      ?auto_9509 - SURFACE
      ?auto_9510 - SURFACE
      ?auto_9511 - SURFACE
    )
    :vars
    (
      ?auto_9513 - HOIST
      ?auto_9517 - PLACE
      ?auto_9512 - PLACE
      ?auto_9516 - HOIST
      ?auto_9514 - SURFACE
      ?auto_9522 - PLACE
      ?auto_9523 - HOIST
      ?auto_9519 - SURFACE
      ?auto_9521 - PLACE
      ?auto_9520 - HOIST
      ?auto_9518 - SURFACE
      ?auto_9515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9513 ?auto_9517 ) ( IS-CRATE ?auto_9511 ) ( not ( = ?auto_9512 ?auto_9517 ) ) ( HOIST-AT ?auto_9516 ?auto_9512 ) ( AVAILABLE ?auto_9516 ) ( SURFACE-AT ?auto_9511 ?auto_9512 ) ( ON ?auto_9511 ?auto_9514 ) ( CLEAR ?auto_9511 ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( not ( = ?auto_9510 ?auto_9514 ) ) ( not ( = ?auto_9511 ?auto_9514 ) ) ( not ( = ?auto_9513 ?auto_9516 ) ) ( IS-CRATE ?auto_9510 ) ( not ( = ?auto_9522 ?auto_9517 ) ) ( HOIST-AT ?auto_9523 ?auto_9522 ) ( AVAILABLE ?auto_9523 ) ( SURFACE-AT ?auto_9510 ?auto_9522 ) ( ON ?auto_9510 ?auto_9519 ) ( CLEAR ?auto_9510 ) ( not ( = ?auto_9509 ?auto_9510 ) ) ( not ( = ?auto_9509 ?auto_9519 ) ) ( not ( = ?auto_9510 ?auto_9519 ) ) ( not ( = ?auto_9513 ?auto_9523 ) ) ( SURFACE-AT ?auto_9508 ?auto_9517 ) ( CLEAR ?auto_9508 ) ( IS-CRATE ?auto_9509 ) ( AVAILABLE ?auto_9513 ) ( not ( = ?auto_9521 ?auto_9517 ) ) ( HOIST-AT ?auto_9520 ?auto_9521 ) ( AVAILABLE ?auto_9520 ) ( SURFACE-AT ?auto_9509 ?auto_9521 ) ( ON ?auto_9509 ?auto_9518 ) ( CLEAR ?auto_9509 ) ( TRUCK-AT ?auto_9515 ?auto_9517 ) ( not ( = ?auto_9508 ?auto_9509 ) ) ( not ( = ?auto_9508 ?auto_9518 ) ) ( not ( = ?auto_9509 ?auto_9518 ) ) ( not ( = ?auto_9513 ?auto_9520 ) ) ( not ( = ?auto_9508 ?auto_9510 ) ) ( not ( = ?auto_9508 ?auto_9519 ) ) ( not ( = ?auto_9510 ?auto_9518 ) ) ( not ( = ?auto_9522 ?auto_9521 ) ) ( not ( = ?auto_9523 ?auto_9520 ) ) ( not ( = ?auto_9519 ?auto_9518 ) ) ( not ( = ?auto_9508 ?auto_9511 ) ) ( not ( = ?auto_9508 ?auto_9514 ) ) ( not ( = ?auto_9509 ?auto_9511 ) ) ( not ( = ?auto_9509 ?auto_9514 ) ) ( not ( = ?auto_9511 ?auto_9519 ) ) ( not ( = ?auto_9511 ?auto_9518 ) ) ( not ( = ?auto_9512 ?auto_9522 ) ) ( not ( = ?auto_9512 ?auto_9521 ) ) ( not ( = ?auto_9516 ?auto_9523 ) ) ( not ( = ?auto_9516 ?auto_9520 ) ) ( not ( = ?auto_9514 ?auto_9519 ) ) ( not ( = ?auto_9514 ?auto_9518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9508 ?auto_9509 ?auto_9510 )
      ( MAKE-1CRATE ?auto_9510 ?auto_9511 )
      ( MAKE-3CRATE-VERIFY ?auto_9508 ?auto_9509 ?auto_9510 ?auto_9511 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9539 - SURFACE
      ?auto_9540 - SURFACE
      ?auto_9541 - SURFACE
      ?auto_9542 - SURFACE
      ?auto_9543 - SURFACE
    )
    :vars
    (
      ?auto_9545 - HOIST
      ?auto_9544 - PLACE
      ?auto_9547 - PLACE
      ?auto_9549 - HOIST
      ?auto_9546 - SURFACE
      ?auto_9552 - PLACE
      ?auto_9551 - HOIST
      ?auto_9556 - SURFACE
      ?auto_9554 - PLACE
      ?auto_9553 - HOIST
      ?auto_9550 - SURFACE
      ?auto_9555 - SURFACE
      ?auto_9548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9545 ?auto_9544 ) ( IS-CRATE ?auto_9543 ) ( not ( = ?auto_9547 ?auto_9544 ) ) ( HOIST-AT ?auto_9549 ?auto_9547 ) ( SURFACE-AT ?auto_9543 ?auto_9547 ) ( ON ?auto_9543 ?auto_9546 ) ( CLEAR ?auto_9543 ) ( not ( = ?auto_9542 ?auto_9543 ) ) ( not ( = ?auto_9542 ?auto_9546 ) ) ( not ( = ?auto_9543 ?auto_9546 ) ) ( not ( = ?auto_9545 ?auto_9549 ) ) ( IS-CRATE ?auto_9542 ) ( not ( = ?auto_9552 ?auto_9544 ) ) ( HOIST-AT ?auto_9551 ?auto_9552 ) ( AVAILABLE ?auto_9551 ) ( SURFACE-AT ?auto_9542 ?auto_9552 ) ( ON ?auto_9542 ?auto_9556 ) ( CLEAR ?auto_9542 ) ( not ( = ?auto_9541 ?auto_9542 ) ) ( not ( = ?auto_9541 ?auto_9556 ) ) ( not ( = ?auto_9542 ?auto_9556 ) ) ( not ( = ?auto_9545 ?auto_9551 ) ) ( IS-CRATE ?auto_9541 ) ( not ( = ?auto_9554 ?auto_9544 ) ) ( HOIST-AT ?auto_9553 ?auto_9554 ) ( AVAILABLE ?auto_9553 ) ( SURFACE-AT ?auto_9541 ?auto_9554 ) ( ON ?auto_9541 ?auto_9550 ) ( CLEAR ?auto_9541 ) ( not ( = ?auto_9540 ?auto_9541 ) ) ( not ( = ?auto_9540 ?auto_9550 ) ) ( not ( = ?auto_9541 ?auto_9550 ) ) ( not ( = ?auto_9545 ?auto_9553 ) ) ( SURFACE-AT ?auto_9539 ?auto_9544 ) ( CLEAR ?auto_9539 ) ( IS-CRATE ?auto_9540 ) ( AVAILABLE ?auto_9545 ) ( AVAILABLE ?auto_9549 ) ( SURFACE-AT ?auto_9540 ?auto_9547 ) ( ON ?auto_9540 ?auto_9555 ) ( CLEAR ?auto_9540 ) ( TRUCK-AT ?auto_9548 ?auto_9544 ) ( not ( = ?auto_9539 ?auto_9540 ) ) ( not ( = ?auto_9539 ?auto_9555 ) ) ( not ( = ?auto_9540 ?auto_9555 ) ) ( not ( = ?auto_9539 ?auto_9541 ) ) ( not ( = ?auto_9539 ?auto_9550 ) ) ( not ( = ?auto_9541 ?auto_9555 ) ) ( not ( = ?auto_9554 ?auto_9547 ) ) ( not ( = ?auto_9553 ?auto_9549 ) ) ( not ( = ?auto_9550 ?auto_9555 ) ) ( not ( = ?auto_9539 ?auto_9542 ) ) ( not ( = ?auto_9539 ?auto_9556 ) ) ( not ( = ?auto_9540 ?auto_9542 ) ) ( not ( = ?auto_9540 ?auto_9556 ) ) ( not ( = ?auto_9542 ?auto_9550 ) ) ( not ( = ?auto_9542 ?auto_9555 ) ) ( not ( = ?auto_9552 ?auto_9554 ) ) ( not ( = ?auto_9552 ?auto_9547 ) ) ( not ( = ?auto_9551 ?auto_9553 ) ) ( not ( = ?auto_9551 ?auto_9549 ) ) ( not ( = ?auto_9556 ?auto_9550 ) ) ( not ( = ?auto_9556 ?auto_9555 ) ) ( not ( = ?auto_9539 ?auto_9543 ) ) ( not ( = ?auto_9539 ?auto_9546 ) ) ( not ( = ?auto_9540 ?auto_9543 ) ) ( not ( = ?auto_9540 ?auto_9546 ) ) ( not ( = ?auto_9541 ?auto_9543 ) ) ( not ( = ?auto_9541 ?auto_9546 ) ) ( not ( = ?auto_9543 ?auto_9556 ) ) ( not ( = ?auto_9543 ?auto_9550 ) ) ( not ( = ?auto_9543 ?auto_9555 ) ) ( not ( = ?auto_9546 ?auto_9556 ) ) ( not ( = ?auto_9546 ?auto_9550 ) ) ( not ( = ?auto_9546 ?auto_9555 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9539 ?auto_9540 ?auto_9541 ?auto_9542 )
      ( MAKE-1CRATE ?auto_9542 ?auto_9543 )
      ( MAKE-4CRATE-VERIFY ?auto_9539 ?auto_9540 ?auto_9541 ?auto_9542 ?auto_9543 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_9573 - SURFACE
      ?auto_9574 - SURFACE
      ?auto_9575 - SURFACE
      ?auto_9576 - SURFACE
      ?auto_9577 - SURFACE
      ?auto_9578 - SURFACE
    )
    :vars
    (
      ?auto_9583 - HOIST
      ?auto_9584 - PLACE
      ?auto_9581 - PLACE
      ?auto_9580 - HOIST
      ?auto_9579 - SURFACE
      ?auto_9587 - PLACE
      ?auto_9594 - HOIST
      ?auto_9592 - SURFACE
      ?auto_9591 - PLACE
      ?auto_9590 - HOIST
      ?auto_9586 - SURFACE
      ?auto_9593 - PLACE
      ?auto_9588 - HOIST
      ?auto_9589 - SURFACE
      ?auto_9585 - SURFACE
      ?auto_9582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9583 ?auto_9584 ) ( IS-CRATE ?auto_9578 ) ( not ( = ?auto_9581 ?auto_9584 ) ) ( HOIST-AT ?auto_9580 ?auto_9581 ) ( AVAILABLE ?auto_9580 ) ( SURFACE-AT ?auto_9578 ?auto_9581 ) ( ON ?auto_9578 ?auto_9579 ) ( CLEAR ?auto_9578 ) ( not ( = ?auto_9577 ?auto_9578 ) ) ( not ( = ?auto_9577 ?auto_9579 ) ) ( not ( = ?auto_9578 ?auto_9579 ) ) ( not ( = ?auto_9583 ?auto_9580 ) ) ( IS-CRATE ?auto_9577 ) ( not ( = ?auto_9587 ?auto_9584 ) ) ( HOIST-AT ?auto_9594 ?auto_9587 ) ( SURFACE-AT ?auto_9577 ?auto_9587 ) ( ON ?auto_9577 ?auto_9592 ) ( CLEAR ?auto_9577 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9576 ?auto_9592 ) ) ( not ( = ?auto_9577 ?auto_9592 ) ) ( not ( = ?auto_9583 ?auto_9594 ) ) ( IS-CRATE ?auto_9576 ) ( not ( = ?auto_9591 ?auto_9584 ) ) ( HOIST-AT ?auto_9590 ?auto_9591 ) ( AVAILABLE ?auto_9590 ) ( SURFACE-AT ?auto_9576 ?auto_9591 ) ( ON ?auto_9576 ?auto_9586 ) ( CLEAR ?auto_9576 ) ( not ( = ?auto_9575 ?auto_9576 ) ) ( not ( = ?auto_9575 ?auto_9586 ) ) ( not ( = ?auto_9576 ?auto_9586 ) ) ( not ( = ?auto_9583 ?auto_9590 ) ) ( IS-CRATE ?auto_9575 ) ( not ( = ?auto_9593 ?auto_9584 ) ) ( HOIST-AT ?auto_9588 ?auto_9593 ) ( AVAILABLE ?auto_9588 ) ( SURFACE-AT ?auto_9575 ?auto_9593 ) ( ON ?auto_9575 ?auto_9589 ) ( CLEAR ?auto_9575 ) ( not ( = ?auto_9574 ?auto_9575 ) ) ( not ( = ?auto_9574 ?auto_9589 ) ) ( not ( = ?auto_9575 ?auto_9589 ) ) ( not ( = ?auto_9583 ?auto_9588 ) ) ( SURFACE-AT ?auto_9573 ?auto_9584 ) ( CLEAR ?auto_9573 ) ( IS-CRATE ?auto_9574 ) ( AVAILABLE ?auto_9583 ) ( AVAILABLE ?auto_9594 ) ( SURFACE-AT ?auto_9574 ?auto_9587 ) ( ON ?auto_9574 ?auto_9585 ) ( CLEAR ?auto_9574 ) ( TRUCK-AT ?auto_9582 ?auto_9584 ) ( not ( = ?auto_9573 ?auto_9574 ) ) ( not ( = ?auto_9573 ?auto_9585 ) ) ( not ( = ?auto_9574 ?auto_9585 ) ) ( not ( = ?auto_9573 ?auto_9575 ) ) ( not ( = ?auto_9573 ?auto_9589 ) ) ( not ( = ?auto_9575 ?auto_9585 ) ) ( not ( = ?auto_9593 ?auto_9587 ) ) ( not ( = ?auto_9588 ?auto_9594 ) ) ( not ( = ?auto_9589 ?auto_9585 ) ) ( not ( = ?auto_9573 ?auto_9576 ) ) ( not ( = ?auto_9573 ?auto_9586 ) ) ( not ( = ?auto_9574 ?auto_9576 ) ) ( not ( = ?auto_9574 ?auto_9586 ) ) ( not ( = ?auto_9576 ?auto_9589 ) ) ( not ( = ?auto_9576 ?auto_9585 ) ) ( not ( = ?auto_9591 ?auto_9593 ) ) ( not ( = ?auto_9591 ?auto_9587 ) ) ( not ( = ?auto_9590 ?auto_9588 ) ) ( not ( = ?auto_9590 ?auto_9594 ) ) ( not ( = ?auto_9586 ?auto_9589 ) ) ( not ( = ?auto_9586 ?auto_9585 ) ) ( not ( = ?auto_9573 ?auto_9577 ) ) ( not ( = ?auto_9573 ?auto_9592 ) ) ( not ( = ?auto_9574 ?auto_9577 ) ) ( not ( = ?auto_9574 ?auto_9592 ) ) ( not ( = ?auto_9575 ?auto_9577 ) ) ( not ( = ?auto_9575 ?auto_9592 ) ) ( not ( = ?auto_9577 ?auto_9586 ) ) ( not ( = ?auto_9577 ?auto_9589 ) ) ( not ( = ?auto_9577 ?auto_9585 ) ) ( not ( = ?auto_9592 ?auto_9586 ) ) ( not ( = ?auto_9592 ?auto_9589 ) ) ( not ( = ?auto_9592 ?auto_9585 ) ) ( not ( = ?auto_9573 ?auto_9578 ) ) ( not ( = ?auto_9573 ?auto_9579 ) ) ( not ( = ?auto_9574 ?auto_9578 ) ) ( not ( = ?auto_9574 ?auto_9579 ) ) ( not ( = ?auto_9575 ?auto_9578 ) ) ( not ( = ?auto_9575 ?auto_9579 ) ) ( not ( = ?auto_9576 ?auto_9578 ) ) ( not ( = ?auto_9576 ?auto_9579 ) ) ( not ( = ?auto_9578 ?auto_9592 ) ) ( not ( = ?auto_9578 ?auto_9586 ) ) ( not ( = ?auto_9578 ?auto_9589 ) ) ( not ( = ?auto_9578 ?auto_9585 ) ) ( not ( = ?auto_9581 ?auto_9587 ) ) ( not ( = ?auto_9581 ?auto_9591 ) ) ( not ( = ?auto_9581 ?auto_9593 ) ) ( not ( = ?auto_9580 ?auto_9594 ) ) ( not ( = ?auto_9580 ?auto_9590 ) ) ( not ( = ?auto_9580 ?auto_9588 ) ) ( not ( = ?auto_9579 ?auto_9592 ) ) ( not ( = ?auto_9579 ?auto_9586 ) ) ( not ( = ?auto_9579 ?auto_9589 ) ) ( not ( = ?auto_9579 ?auto_9585 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9573 ?auto_9574 ?auto_9575 ?auto_9576 ?auto_9577 )
      ( MAKE-1CRATE ?auto_9577 ?auto_9578 )
      ( MAKE-5CRATE-VERIFY ?auto_9573 ?auto_9574 ?auto_9575 ?auto_9576 ?auto_9577 ?auto_9578 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9612 - SURFACE
      ?auto_9613 - SURFACE
      ?auto_9614 - SURFACE
      ?auto_9615 - SURFACE
      ?auto_9616 - SURFACE
      ?auto_9617 - SURFACE
      ?auto_9618 - SURFACE
    )
    :vars
    (
      ?auto_9620 - HOIST
      ?auto_9623 - PLACE
      ?auto_9622 - PLACE
      ?auto_9624 - HOIST
      ?auto_9619 - SURFACE
      ?auto_9626 - PLACE
      ?auto_9625 - HOIST
      ?auto_9627 - SURFACE
      ?auto_9629 - PLACE
      ?auto_9628 - HOIST
      ?auto_9636 - SURFACE
      ?auto_9635 - PLACE
      ?auto_9633 - HOIST
      ?auto_9630 - SURFACE
      ?auto_9637 - PLACE
      ?auto_9632 - HOIST
      ?auto_9634 - SURFACE
      ?auto_9631 - SURFACE
      ?auto_9621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9620 ?auto_9623 ) ( IS-CRATE ?auto_9618 ) ( not ( = ?auto_9622 ?auto_9623 ) ) ( HOIST-AT ?auto_9624 ?auto_9622 ) ( AVAILABLE ?auto_9624 ) ( SURFACE-AT ?auto_9618 ?auto_9622 ) ( ON ?auto_9618 ?auto_9619 ) ( CLEAR ?auto_9618 ) ( not ( = ?auto_9617 ?auto_9618 ) ) ( not ( = ?auto_9617 ?auto_9619 ) ) ( not ( = ?auto_9618 ?auto_9619 ) ) ( not ( = ?auto_9620 ?auto_9624 ) ) ( IS-CRATE ?auto_9617 ) ( not ( = ?auto_9626 ?auto_9623 ) ) ( HOIST-AT ?auto_9625 ?auto_9626 ) ( AVAILABLE ?auto_9625 ) ( SURFACE-AT ?auto_9617 ?auto_9626 ) ( ON ?auto_9617 ?auto_9627 ) ( CLEAR ?auto_9617 ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( not ( = ?auto_9616 ?auto_9627 ) ) ( not ( = ?auto_9617 ?auto_9627 ) ) ( not ( = ?auto_9620 ?auto_9625 ) ) ( IS-CRATE ?auto_9616 ) ( not ( = ?auto_9629 ?auto_9623 ) ) ( HOIST-AT ?auto_9628 ?auto_9629 ) ( SURFACE-AT ?auto_9616 ?auto_9629 ) ( ON ?auto_9616 ?auto_9636 ) ( CLEAR ?auto_9616 ) ( not ( = ?auto_9615 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9636 ) ) ( not ( = ?auto_9616 ?auto_9636 ) ) ( not ( = ?auto_9620 ?auto_9628 ) ) ( IS-CRATE ?auto_9615 ) ( not ( = ?auto_9635 ?auto_9623 ) ) ( HOIST-AT ?auto_9633 ?auto_9635 ) ( AVAILABLE ?auto_9633 ) ( SURFACE-AT ?auto_9615 ?auto_9635 ) ( ON ?auto_9615 ?auto_9630 ) ( CLEAR ?auto_9615 ) ( not ( = ?auto_9614 ?auto_9615 ) ) ( not ( = ?auto_9614 ?auto_9630 ) ) ( not ( = ?auto_9615 ?auto_9630 ) ) ( not ( = ?auto_9620 ?auto_9633 ) ) ( IS-CRATE ?auto_9614 ) ( not ( = ?auto_9637 ?auto_9623 ) ) ( HOIST-AT ?auto_9632 ?auto_9637 ) ( AVAILABLE ?auto_9632 ) ( SURFACE-AT ?auto_9614 ?auto_9637 ) ( ON ?auto_9614 ?auto_9634 ) ( CLEAR ?auto_9614 ) ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9613 ?auto_9634 ) ) ( not ( = ?auto_9614 ?auto_9634 ) ) ( not ( = ?auto_9620 ?auto_9632 ) ) ( SURFACE-AT ?auto_9612 ?auto_9623 ) ( CLEAR ?auto_9612 ) ( IS-CRATE ?auto_9613 ) ( AVAILABLE ?auto_9620 ) ( AVAILABLE ?auto_9628 ) ( SURFACE-AT ?auto_9613 ?auto_9629 ) ( ON ?auto_9613 ?auto_9631 ) ( CLEAR ?auto_9613 ) ( TRUCK-AT ?auto_9621 ?auto_9623 ) ( not ( = ?auto_9612 ?auto_9613 ) ) ( not ( = ?auto_9612 ?auto_9631 ) ) ( not ( = ?auto_9613 ?auto_9631 ) ) ( not ( = ?auto_9612 ?auto_9614 ) ) ( not ( = ?auto_9612 ?auto_9634 ) ) ( not ( = ?auto_9614 ?auto_9631 ) ) ( not ( = ?auto_9637 ?auto_9629 ) ) ( not ( = ?auto_9632 ?auto_9628 ) ) ( not ( = ?auto_9634 ?auto_9631 ) ) ( not ( = ?auto_9612 ?auto_9615 ) ) ( not ( = ?auto_9612 ?auto_9630 ) ) ( not ( = ?auto_9613 ?auto_9615 ) ) ( not ( = ?auto_9613 ?auto_9630 ) ) ( not ( = ?auto_9615 ?auto_9634 ) ) ( not ( = ?auto_9615 ?auto_9631 ) ) ( not ( = ?auto_9635 ?auto_9637 ) ) ( not ( = ?auto_9635 ?auto_9629 ) ) ( not ( = ?auto_9633 ?auto_9632 ) ) ( not ( = ?auto_9633 ?auto_9628 ) ) ( not ( = ?auto_9630 ?auto_9634 ) ) ( not ( = ?auto_9630 ?auto_9631 ) ) ( not ( = ?auto_9612 ?auto_9616 ) ) ( not ( = ?auto_9612 ?auto_9636 ) ) ( not ( = ?auto_9613 ?auto_9616 ) ) ( not ( = ?auto_9613 ?auto_9636 ) ) ( not ( = ?auto_9614 ?auto_9616 ) ) ( not ( = ?auto_9614 ?auto_9636 ) ) ( not ( = ?auto_9616 ?auto_9630 ) ) ( not ( = ?auto_9616 ?auto_9634 ) ) ( not ( = ?auto_9616 ?auto_9631 ) ) ( not ( = ?auto_9636 ?auto_9630 ) ) ( not ( = ?auto_9636 ?auto_9634 ) ) ( not ( = ?auto_9636 ?auto_9631 ) ) ( not ( = ?auto_9612 ?auto_9617 ) ) ( not ( = ?auto_9612 ?auto_9627 ) ) ( not ( = ?auto_9613 ?auto_9617 ) ) ( not ( = ?auto_9613 ?auto_9627 ) ) ( not ( = ?auto_9614 ?auto_9617 ) ) ( not ( = ?auto_9614 ?auto_9627 ) ) ( not ( = ?auto_9615 ?auto_9617 ) ) ( not ( = ?auto_9615 ?auto_9627 ) ) ( not ( = ?auto_9617 ?auto_9636 ) ) ( not ( = ?auto_9617 ?auto_9630 ) ) ( not ( = ?auto_9617 ?auto_9634 ) ) ( not ( = ?auto_9617 ?auto_9631 ) ) ( not ( = ?auto_9626 ?auto_9629 ) ) ( not ( = ?auto_9626 ?auto_9635 ) ) ( not ( = ?auto_9626 ?auto_9637 ) ) ( not ( = ?auto_9625 ?auto_9628 ) ) ( not ( = ?auto_9625 ?auto_9633 ) ) ( not ( = ?auto_9625 ?auto_9632 ) ) ( not ( = ?auto_9627 ?auto_9636 ) ) ( not ( = ?auto_9627 ?auto_9630 ) ) ( not ( = ?auto_9627 ?auto_9634 ) ) ( not ( = ?auto_9627 ?auto_9631 ) ) ( not ( = ?auto_9612 ?auto_9618 ) ) ( not ( = ?auto_9612 ?auto_9619 ) ) ( not ( = ?auto_9613 ?auto_9618 ) ) ( not ( = ?auto_9613 ?auto_9619 ) ) ( not ( = ?auto_9614 ?auto_9618 ) ) ( not ( = ?auto_9614 ?auto_9619 ) ) ( not ( = ?auto_9615 ?auto_9618 ) ) ( not ( = ?auto_9615 ?auto_9619 ) ) ( not ( = ?auto_9616 ?auto_9618 ) ) ( not ( = ?auto_9616 ?auto_9619 ) ) ( not ( = ?auto_9618 ?auto_9627 ) ) ( not ( = ?auto_9618 ?auto_9636 ) ) ( not ( = ?auto_9618 ?auto_9630 ) ) ( not ( = ?auto_9618 ?auto_9634 ) ) ( not ( = ?auto_9618 ?auto_9631 ) ) ( not ( = ?auto_9622 ?auto_9626 ) ) ( not ( = ?auto_9622 ?auto_9629 ) ) ( not ( = ?auto_9622 ?auto_9635 ) ) ( not ( = ?auto_9622 ?auto_9637 ) ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( not ( = ?auto_9624 ?auto_9628 ) ) ( not ( = ?auto_9624 ?auto_9633 ) ) ( not ( = ?auto_9624 ?auto_9632 ) ) ( not ( = ?auto_9619 ?auto_9627 ) ) ( not ( = ?auto_9619 ?auto_9636 ) ) ( not ( = ?auto_9619 ?auto_9630 ) ) ( not ( = ?auto_9619 ?auto_9634 ) ) ( not ( = ?auto_9619 ?auto_9631 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 ?auto_9616 ?auto_9617 )
      ( MAKE-1CRATE ?auto_9617 ?auto_9618 )
      ( MAKE-6CRATE-VERIFY ?auto_9612 ?auto_9613 ?auto_9614 ?auto_9615 ?auto_9616 ?auto_9617 ?auto_9618 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9656 - SURFACE
      ?auto_9657 - SURFACE
      ?auto_9658 - SURFACE
      ?auto_9659 - SURFACE
      ?auto_9660 - SURFACE
      ?auto_9661 - SURFACE
      ?auto_9662 - SURFACE
      ?auto_9663 - SURFACE
    )
    :vars
    (
      ?auto_9668 - HOIST
      ?auto_9667 - PLACE
      ?auto_9665 - PLACE
      ?auto_9666 - HOIST
      ?auto_9669 - SURFACE
      ?auto_9674 - PLACE
      ?auto_9671 - HOIST
      ?auto_9673 - SURFACE
      ?auto_9670 - PLACE
      ?auto_9682 - HOIST
      ?auto_9677 - SURFACE
      ?auto_9681 - PLACE
      ?auto_9678 - HOIST
      ?auto_9679 - SURFACE
      ?auto_9676 - PLACE
      ?auto_9683 - HOIST
      ?auto_9680 - SURFACE
      ?auto_9672 - SURFACE
      ?auto_9675 - SURFACE
      ?auto_9664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9668 ?auto_9667 ) ( IS-CRATE ?auto_9663 ) ( not ( = ?auto_9665 ?auto_9667 ) ) ( HOIST-AT ?auto_9666 ?auto_9665 ) ( SURFACE-AT ?auto_9663 ?auto_9665 ) ( ON ?auto_9663 ?auto_9669 ) ( CLEAR ?auto_9663 ) ( not ( = ?auto_9662 ?auto_9663 ) ) ( not ( = ?auto_9662 ?auto_9669 ) ) ( not ( = ?auto_9663 ?auto_9669 ) ) ( not ( = ?auto_9668 ?auto_9666 ) ) ( IS-CRATE ?auto_9662 ) ( not ( = ?auto_9674 ?auto_9667 ) ) ( HOIST-AT ?auto_9671 ?auto_9674 ) ( AVAILABLE ?auto_9671 ) ( SURFACE-AT ?auto_9662 ?auto_9674 ) ( ON ?auto_9662 ?auto_9673 ) ( CLEAR ?auto_9662 ) ( not ( = ?auto_9661 ?auto_9662 ) ) ( not ( = ?auto_9661 ?auto_9673 ) ) ( not ( = ?auto_9662 ?auto_9673 ) ) ( not ( = ?auto_9668 ?auto_9671 ) ) ( IS-CRATE ?auto_9661 ) ( not ( = ?auto_9670 ?auto_9667 ) ) ( HOIST-AT ?auto_9682 ?auto_9670 ) ( AVAILABLE ?auto_9682 ) ( SURFACE-AT ?auto_9661 ?auto_9670 ) ( ON ?auto_9661 ?auto_9677 ) ( CLEAR ?auto_9661 ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( not ( = ?auto_9660 ?auto_9677 ) ) ( not ( = ?auto_9661 ?auto_9677 ) ) ( not ( = ?auto_9668 ?auto_9682 ) ) ( IS-CRATE ?auto_9660 ) ( not ( = ?auto_9681 ?auto_9667 ) ) ( HOIST-AT ?auto_9678 ?auto_9681 ) ( SURFACE-AT ?auto_9660 ?auto_9681 ) ( ON ?auto_9660 ?auto_9679 ) ( CLEAR ?auto_9660 ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( not ( = ?auto_9659 ?auto_9679 ) ) ( not ( = ?auto_9660 ?auto_9679 ) ) ( not ( = ?auto_9668 ?auto_9678 ) ) ( IS-CRATE ?auto_9659 ) ( not ( = ?auto_9676 ?auto_9667 ) ) ( HOIST-AT ?auto_9683 ?auto_9676 ) ( AVAILABLE ?auto_9683 ) ( SURFACE-AT ?auto_9659 ?auto_9676 ) ( ON ?auto_9659 ?auto_9680 ) ( CLEAR ?auto_9659 ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9680 ) ) ( not ( = ?auto_9659 ?auto_9680 ) ) ( not ( = ?auto_9668 ?auto_9683 ) ) ( IS-CRATE ?auto_9658 ) ( AVAILABLE ?auto_9666 ) ( SURFACE-AT ?auto_9658 ?auto_9665 ) ( ON ?auto_9658 ?auto_9672 ) ( CLEAR ?auto_9658 ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9672 ) ) ( not ( = ?auto_9658 ?auto_9672 ) ) ( SURFACE-AT ?auto_9656 ?auto_9667 ) ( CLEAR ?auto_9656 ) ( IS-CRATE ?auto_9657 ) ( AVAILABLE ?auto_9668 ) ( AVAILABLE ?auto_9678 ) ( SURFACE-AT ?auto_9657 ?auto_9681 ) ( ON ?auto_9657 ?auto_9675 ) ( CLEAR ?auto_9657 ) ( TRUCK-AT ?auto_9664 ?auto_9667 ) ( not ( = ?auto_9656 ?auto_9657 ) ) ( not ( = ?auto_9656 ?auto_9675 ) ) ( not ( = ?auto_9657 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9658 ) ) ( not ( = ?auto_9656 ?auto_9672 ) ) ( not ( = ?auto_9658 ?auto_9675 ) ) ( not ( = ?auto_9665 ?auto_9681 ) ) ( not ( = ?auto_9666 ?auto_9678 ) ) ( not ( = ?auto_9672 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9659 ) ) ( not ( = ?auto_9656 ?auto_9680 ) ) ( not ( = ?auto_9657 ?auto_9659 ) ) ( not ( = ?auto_9657 ?auto_9680 ) ) ( not ( = ?auto_9659 ?auto_9672 ) ) ( not ( = ?auto_9659 ?auto_9675 ) ) ( not ( = ?auto_9676 ?auto_9665 ) ) ( not ( = ?auto_9676 ?auto_9681 ) ) ( not ( = ?auto_9683 ?auto_9666 ) ) ( not ( = ?auto_9683 ?auto_9678 ) ) ( not ( = ?auto_9680 ?auto_9672 ) ) ( not ( = ?auto_9680 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9660 ) ) ( not ( = ?auto_9656 ?auto_9679 ) ) ( not ( = ?auto_9657 ?auto_9660 ) ) ( not ( = ?auto_9657 ?auto_9679 ) ) ( not ( = ?auto_9658 ?auto_9660 ) ) ( not ( = ?auto_9658 ?auto_9679 ) ) ( not ( = ?auto_9660 ?auto_9680 ) ) ( not ( = ?auto_9660 ?auto_9672 ) ) ( not ( = ?auto_9660 ?auto_9675 ) ) ( not ( = ?auto_9679 ?auto_9680 ) ) ( not ( = ?auto_9679 ?auto_9672 ) ) ( not ( = ?auto_9679 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9661 ) ) ( not ( = ?auto_9656 ?auto_9677 ) ) ( not ( = ?auto_9657 ?auto_9661 ) ) ( not ( = ?auto_9657 ?auto_9677 ) ) ( not ( = ?auto_9658 ?auto_9661 ) ) ( not ( = ?auto_9658 ?auto_9677 ) ) ( not ( = ?auto_9659 ?auto_9661 ) ) ( not ( = ?auto_9659 ?auto_9677 ) ) ( not ( = ?auto_9661 ?auto_9679 ) ) ( not ( = ?auto_9661 ?auto_9680 ) ) ( not ( = ?auto_9661 ?auto_9672 ) ) ( not ( = ?auto_9661 ?auto_9675 ) ) ( not ( = ?auto_9670 ?auto_9681 ) ) ( not ( = ?auto_9670 ?auto_9676 ) ) ( not ( = ?auto_9670 ?auto_9665 ) ) ( not ( = ?auto_9682 ?auto_9678 ) ) ( not ( = ?auto_9682 ?auto_9683 ) ) ( not ( = ?auto_9682 ?auto_9666 ) ) ( not ( = ?auto_9677 ?auto_9679 ) ) ( not ( = ?auto_9677 ?auto_9680 ) ) ( not ( = ?auto_9677 ?auto_9672 ) ) ( not ( = ?auto_9677 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9662 ) ) ( not ( = ?auto_9656 ?auto_9673 ) ) ( not ( = ?auto_9657 ?auto_9662 ) ) ( not ( = ?auto_9657 ?auto_9673 ) ) ( not ( = ?auto_9658 ?auto_9662 ) ) ( not ( = ?auto_9658 ?auto_9673 ) ) ( not ( = ?auto_9659 ?auto_9662 ) ) ( not ( = ?auto_9659 ?auto_9673 ) ) ( not ( = ?auto_9660 ?auto_9662 ) ) ( not ( = ?auto_9660 ?auto_9673 ) ) ( not ( = ?auto_9662 ?auto_9677 ) ) ( not ( = ?auto_9662 ?auto_9679 ) ) ( not ( = ?auto_9662 ?auto_9680 ) ) ( not ( = ?auto_9662 ?auto_9672 ) ) ( not ( = ?auto_9662 ?auto_9675 ) ) ( not ( = ?auto_9674 ?auto_9670 ) ) ( not ( = ?auto_9674 ?auto_9681 ) ) ( not ( = ?auto_9674 ?auto_9676 ) ) ( not ( = ?auto_9674 ?auto_9665 ) ) ( not ( = ?auto_9671 ?auto_9682 ) ) ( not ( = ?auto_9671 ?auto_9678 ) ) ( not ( = ?auto_9671 ?auto_9683 ) ) ( not ( = ?auto_9671 ?auto_9666 ) ) ( not ( = ?auto_9673 ?auto_9677 ) ) ( not ( = ?auto_9673 ?auto_9679 ) ) ( not ( = ?auto_9673 ?auto_9680 ) ) ( not ( = ?auto_9673 ?auto_9672 ) ) ( not ( = ?auto_9673 ?auto_9675 ) ) ( not ( = ?auto_9656 ?auto_9663 ) ) ( not ( = ?auto_9656 ?auto_9669 ) ) ( not ( = ?auto_9657 ?auto_9663 ) ) ( not ( = ?auto_9657 ?auto_9669 ) ) ( not ( = ?auto_9658 ?auto_9663 ) ) ( not ( = ?auto_9658 ?auto_9669 ) ) ( not ( = ?auto_9659 ?auto_9663 ) ) ( not ( = ?auto_9659 ?auto_9669 ) ) ( not ( = ?auto_9660 ?auto_9663 ) ) ( not ( = ?auto_9660 ?auto_9669 ) ) ( not ( = ?auto_9661 ?auto_9663 ) ) ( not ( = ?auto_9661 ?auto_9669 ) ) ( not ( = ?auto_9663 ?auto_9673 ) ) ( not ( = ?auto_9663 ?auto_9677 ) ) ( not ( = ?auto_9663 ?auto_9679 ) ) ( not ( = ?auto_9663 ?auto_9680 ) ) ( not ( = ?auto_9663 ?auto_9672 ) ) ( not ( = ?auto_9663 ?auto_9675 ) ) ( not ( = ?auto_9669 ?auto_9673 ) ) ( not ( = ?auto_9669 ?auto_9677 ) ) ( not ( = ?auto_9669 ?auto_9679 ) ) ( not ( = ?auto_9669 ?auto_9680 ) ) ( not ( = ?auto_9669 ?auto_9672 ) ) ( not ( = ?auto_9669 ?auto_9675 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9656 ?auto_9657 ?auto_9658 ?auto_9659 ?auto_9660 ?auto_9661 ?auto_9662 )
      ( MAKE-1CRATE ?auto_9662 ?auto_9663 )
      ( MAKE-7CRATE-VERIFY ?auto_9656 ?auto_9657 ?auto_9658 ?auto_9659 ?auto_9660 ?auto_9661 ?auto_9662 ?auto_9663 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9703 - SURFACE
      ?auto_9704 - SURFACE
      ?auto_9705 - SURFACE
      ?auto_9706 - SURFACE
      ?auto_9707 - SURFACE
      ?auto_9708 - SURFACE
      ?auto_9709 - SURFACE
      ?auto_9710 - SURFACE
      ?auto_9711 - SURFACE
    )
    :vars
    (
      ?auto_9712 - HOIST
      ?auto_9713 - PLACE
      ?auto_9714 - PLACE
      ?auto_9715 - HOIST
      ?auto_9716 - SURFACE
      ?auto_9726 - PLACE
      ?auto_9725 - HOIST
      ?auto_9727 - SURFACE
      ?auto_9720 - PLACE
      ?auto_9721 - HOIST
      ?auto_9723 - SURFACE
      ?auto_9728 - SURFACE
      ?auto_9719 - PLACE
      ?auto_9724 - HOIST
      ?auto_9730 - SURFACE
      ?auto_9729 - PLACE
      ?auto_9732 - HOIST
      ?auto_9718 - SURFACE
      ?auto_9722 - SURFACE
      ?auto_9731 - SURFACE
      ?auto_9717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9712 ?auto_9713 ) ( IS-CRATE ?auto_9711 ) ( not ( = ?auto_9714 ?auto_9713 ) ) ( HOIST-AT ?auto_9715 ?auto_9714 ) ( SURFACE-AT ?auto_9711 ?auto_9714 ) ( ON ?auto_9711 ?auto_9716 ) ( CLEAR ?auto_9711 ) ( not ( = ?auto_9710 ?auto_9711 ) ) ( not ( = ?auto_9710 ?auto_9716 ) ) ( not ( = ?auto_9711 ?auto_9716 ) ) ( not ( = ?auto_9712 ?auto_9715 ) ) ( IS-CRATE ?auto_9710 ) ( not ( = ?auto_9726 ?auto_9713 ) ) ( HOIST-AT ?auto_9725 ?auto_9726 ) ( SURFACE-AT ?auto_9710 ?auto_9726 ) ( ON ?auto_9710 ?auto_9727 ) ( CLEAR ?auto_9710 ) ( not ( = ?auto_9709 ?auto_9710 ) ) ( not ( = ?auto_9709 ?auto_9727 ) ) ( not ( = ?auto_9710 ?auto_9727 ) ) ( not ( = ?auto_9712 ?auto_9725 ) ) ( IS-CRATE ?auto_9709 ) ( not ( = ?auto_9720 ?auto_9713 ) ) ( HOIST-AT ?auto_9721 ?auto_9720 ) ( AVAILABLE ?auto_9721 ) ( SURFACE-AT ?auto_9709 ?auto_9720 ) ( ON ?auto_9709 ?auto_9723 ) ( CLEAR ?auto_9709 ) ( not ( = ?auto_9708 ?auto_9709 ) ) ( not ( = ?auto_9708 ?auto_9723 ) ) ( not ( = ?auto_9709 ?auto_9723 ) ) ( not ( = ?auto_9712 ?auto_9721 ) ) ( IS-CRATE ?auto_9708 ) ( AVAILABLE ?auto_9715 ) ( SURFACE-AT ?auto_9708 ?auto_9714 ) ( ON ?auto_9708 ?auto_9728 ) ( CLEAR ?auto_9708 ) ( not ( = ?auto_9707 ?auto_9708 ) ) ( not ( = ?auto_9707 ?auto_9728 ) ) ( not ( = ?auto_9708 ?auto_9728 ) ) ( IS-CRATE ?auto_9707 ) ( not ( = ?auto_9719 ?auto_9713 ) ) ( HOIST-AT ?auto_9724 ?auto_9719 ) ( SURFACE-AT ?auto_9707 ?auto_9719 ) ( ON ?auto_9707 ?auto_9730 ) ( CLEAR ?auto_9707 ) ( not ( = ?auto_9706 ?auto_9707 ) ) ( not ( = ?auto_9706 ?auto_9730 ) ) ( not ( = ?auto_9707 ?auto_9730 ) ) ( not ( = ?auto_9712 ?auto_9724 ) ) ( IS-CRATE ?auto_9706 ) ( not ( = ?auto_9729 ?auto_9713 ) ) ( HOIST-AT ?auto_9732 ?auto_9729 ) ( AVAILABLE ?auto_9732 ) ( SURFACE-AT ?auto_9706 ?auto_9729 ) ( ON ?auto_9706 ?auto_9718 ) ( CLEAR ?auto_9706 ) ( not ( = ?auto_9705 ?auto_9706 ) ) ( not ( = ?auto_9705 ?auto_9718 ) ) ( not ( = ?auto_9706 ?auto_9718 ) ) ( not ( = ?auto_9712 ?auto_9732 ) ) ( IS-CRATE ?auto_9705 ) ( AVAILABLE ?auto_9725 ) ( SURFACE-AT ?auto_9705 ?auto_9726 ) ( ON ?auto_9705 ?auto_9722 ) ( CLEAR ?auto_9705 ) ( not ( = ?auto_9704 ?auto_9705 ) ) ( not ( = ?auto_9704 ?auto_9722 ) ) ( not ( = ?auto_9705 ?auto_9722 ) ) ( SURFACE-AT ?auto_9703 ?auto_9713 ) ( CLEAR ?auto_9703 ) ( IS-CRATE ?auto_9704 ) ( AVAILABLE ?auto_9712 ) ( AVAILABLE ?auto_9724 ) ( SURFACE-AT ?auto_9704 ?auto_9719 ) ( ON ?auto_9704 ?auto_9731 ) ( CLEAR ?auto_9704 ) ( TRUCK-AT ?auto_9717 ?auto_9713 ) ( not ( = ?auto_9703 ?auto_9704 ) ) ( not ( = ?auto_9703 ?auto_9731 ) ) ( not ( = ?auto_9704 ?auto_9731 ) ) ( not ( = ?auto_9703 ?auto_9705 ) ) ( not ( = ?auto_9703 ?auto_9722 ) ) ( not ( = ?auto_9705 ?auto_9731 ) ) ( not ( = ?auto_9726 ?auto_9719 ) ) ( not ( = ?auto_9725 ?auto_9724 ) ) ( not ( = ?auto_9722 ?auto_9731 ) ) ( not ( = ?auto_9703 ?auto_9706 ) ) ( not ( = ?auto_9703 ?auto_9718 ) ) ( not ( = ?auto_9704 ?auto_9706 ) ) ( not ( = ?auto_9704 ?auto_9718 ) ) ( not ( = ?auto_9706 ?auto_9722 ) ) ( not ( = ?auto_9706 ?auto_9731 ) ) ( not ( = ?auto_9729 ?auto_9726 ) ) ( not ( = ?auto_9729 ?auto_9719 ) ) ( not ( = ?auto_9732 ?auto_9725 ) ) ( not ( = ?auto_9732 ?auto_9724 ) ) ( not ( = ?auto_9718 ?auto_9722 ) ) ( not ( = ?auto_9718 ?auto_9731 ) ) ( not ( = ?auto_9703 ?auto_9707 ) ) ( not ( = ?auto_9703 ?auto_9730 ) ) ( not ( = ?auto_9704 ?auto_9707 ) ) ( not ( = ?auto_9704 ?auto_9730 ) ) ( not ( = ?auto_9705 ?auto_9707 ) ) ( not ( = ?auto_9705 ?auto_9730 ) ) ( not ( = ?auto_9707 ?auto_9718 ) ) ( not ( = ?auto_9707 ?auto_9722 ) ) ( not ( = ?auto_9707 ?auto_9731 ) ) ( not ( = ?auto_9730 ?auto_9718 ) ) ( not ( = ?auto_9730 ?auto_9722 ) ) ( not ( = ?auto_9730 ?auto_9731 ) ) ( not ( = ?auto_9703 ?auto_9708 ) ) ( not ( = ?auto_9703 ?auto_9728 ) ) ( not ( = ?auto_9704 ?auto_9708 ) ) ( not ( = ?auto_9704 ?auto_9728 ) ) ( not ( = ?auto_9705 ?auto_9708 ) ) ( not ( = ?auto_9705 ?auto_9728 ) ) ( not ( = ?auto_9706 ?auto_9708 ) ) ( not ( = ?auto_9706 ?auto_9728 ) ) ( not ( = ?auto_9708 ?auto_9730 ) ) ( not ( = ?auto_9708 ?auto_9718 ) ) ( not ( = ?auto_9708 ?auto_9722 ) ) ( not ( = ?auto_9708 ?auto_9731 ) ) ( not ( = ?auto_9714 ?auto_9719 ) ) ( not ( = ?auto_9714 ?auto_9729 ) ) ( not ( = ?auto_9714 ?auto_9726 ) ) ( not ( = ?auto_9715 ?auto_9724 ) ) ( not ( = ?auto_9715 ?auto_9732 ) ) ( not ( = ?auto_9715 ?auto_9725 ) ) ( not ( = ?auto_9728 ?auto_9730 ) ) ( not ( = ?auto_9728 ?auto_9718 ) ) ( not ( = ?auto_9728 ?auto_9722 ) ) ( not ( = ?auto_9728 ?auto_9731 ) ) ( not ( = ?auto_9703 ?auto_9709 ) ) ( not ( = ?auto_9703 ?auto_9723 ) ) ( not ( = ?auto_9704 ?auto_9709 ) ) ( not ( = ?auto_9704 ?auto_9723 ) ) ( not ( = ?auto_9705 ?auto_9709 ) ) ( not ( = ?auto_9705 ?auto_9723 ) ) ( not ( = ?auto_9706 ?auto_9709 ) ) ( not ( = ?auto_9706 ?auto_9723 ) ) ( not ( = ?auto_9707 ?auto_9709 ) ) ( not ( = ?auto_9707 ?auto_9723 ) ) ( not ( = ?auto_9709 ?auto_9728 ) ) ( not ( = ?auto_9709 ?auto_9730 ) ) ( not ( = ?auto_9709 ?auto_9718 ) ) ( not ( = ?auto_9709 ?auto_9722 ) ) ( not ( = ?auto_9709 ?auto_9731 ) ) ( not ( = ?auto_9720 ?auto_9714 ) ) ( not ( = ?auto_9720 ?auto_9719 ) ) ( not ( = ?auto_9720 ?auto_9729 ) ) ( not ( = ?auto_9720 ?auto_9726 ) ) ( not ( = ?auto_9721 ?auto_9715 ) ) ( not ( = ?auto_9721 ?auto_9724 ) ) ( not ( = ?auto_9721 ?auto_9732 ) ) ( not ( = ?auto_9721 ?auto_9725 ) ) ( not ( = ?auto_9723 ?auto_9728 ) ) ( not ( = ?auto_9723 ?auto_9730 ) ) ( not ( = ?auto_9723 ?auto_9718 ) ) ( not ( = ?auto_9723 ?auto_9722 ) ) ( not ( = ?auto_9723 ?auto_9731 ) ) ( not ( = ?auto_9703 ?auto_9710 ) ) ( not ( = ?auto_9703 ?auto_9727 ) ) ( not ( = ?auto_9704 ?auto_9710 ) ) ( not ( = ?auto_9704 ?auto_9727 ) ) ( not ( = ?auto_9705 ?auto_9710 ) ) ( not ( = ?auto_9705 ?auto_9727 ) ) ( not ( = ?auto_9706 ?auto_9710 ) ) ( not ( = ?auto_9706 ?auto_9727 ) ) ( not ( = ?auto_9707 ?auto_9710 ) ) ( not ( = ?auto_9707 ?auto_9727 ) ) ( not ( = ?auto_9708 ?auto_9710 ) ) ( not ( = ?auto_9708 ?auto_9727 ) ) ( not ( = ?auto_9710 ?auto_9723 ) ) ( not ( = ?auto_9710 ?auto_9728 ) ) ( not ( = ?auto_9710 ?auto_9730 ) ) ( not ( = ?auto_9710 ?auto_9718 ) ) ( not ( = ?auto_9710 ?auto_9722 ) ) ( not ( = ?auto_9710 ?auto_9731 ) ) ( not ( = ?auto_9727 ?auto_9723 ) ) ( not ( = ?auto_9727 ?auto_9728 ) ) ( not ( = ?auto_9727 ?auto_9730 ) ) ( not ( = ?auto_9727 ?auto_9718 ) ) ( not ( = ?auto_9727 ?auto_9722 ) ) ( not ( = ?auto_9727 ?auto_9731 ) ) ( not ( = ?auto_9703 ?auto_9711 ) ) ( not ( = ?auto_9703 ?auto_9716 ) ) ( not ( = ?auto_9704 ?auto_9711 ) ) ( not ( = ?auto_9704 ?auto_9716 ) ) ( not ( = ?auto_9705 ?auto_9711 ) ) ( not ( = ?auto_9705 ?auto_9716 ) ) ( not ( = ?auto_9706 ?auto_9711 ) ) ( not ( = ?auto_9706 ?auto_9716 ) ) ( not ( = ?auto_9707 ?auto_9711 ) ) ( not ( = ?auto_9707 ?auto_9716 ) ) ( not ( = ?auto_9708 ?auto_9711 ) ) ( not ( = ?auto_9708 ?auto_9716 ) ) ( not ( = ?auto_9709 ?auto_9711 ) ) ( not ( = ?auto_9709 ?auto_9716 ) ) ( not ( = ?auto_9711 ?auto_9727 ) ) ( not ( = ?auto_9711 ?auto_9723 ) ) ( not ( = ?auto_9711 ?auto_9728 ) ) ( not ( = ?auto_9711 ?auto_9730 ) ) ( not ( = ?auto_9711 ?auto_9718 ) ) ( not ( = ?auto_9711 ?auto_9722 ) ) ( not ( = ?auto_9711 ?auto_9731 ) ) ( not ( = ?auto_9716 ?auto_9727 ) ) ( not ( = ?auto_9716 ?auto_9723 ) ) ( not ( = ?auto_9716 ?auto_9728 ) ) ( not ( = ?auto_9716 ?auto_9730 ) ) ( not ( = ?auto_9716 ?auto_9718 ) ) ( not ( = ?auto_9716 ?auto_9722 ) ) ( not ( = ?auto_9716 ?auto_9731 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9703 ?auto_9704 ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9708 ?auto_9709 ?auto_9710 )
      ( MAKE-1CRATE ?auto_9710 ?auto_9711 )
      ( MAKE-8CRATE-VERIFY ?auto_9703 ?auto_9704 ?auto_9705 ?auto_9706 ?auto_9707 ?auto_9708 ?auto_9709 ?auto_9710 ?auto_9711 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9753 - SURFACE
      ?auto_9754 - SURFACE
      ?auto_9755 - SURFACE
      ?auto_9756 - SURFACE
      ?auto_9757 - SURFACE
      ?auto_9758 - SURFACE
      ?auto_9759 - SURFACE
      ?auto_9760 - SURFACE
      ?auto_9761 - SURFACE
      ?auto_9762 - SURFACE
    )
    :vars
    (
      ?auto_9766 - HOIST
      ?auto_9768 - PLACE
      ?auto_9767 - PLACE
      ?auto_9763 - HOIST
      ?auto_9765 - SURFACE
      ?auto_9774 - PLACE
      ?auto_9773 - HOIST
      ?auto_9778 - SURFACE
      ?auto_9777 - PLACE
      ?auto_9770 - HOIST
      ?auto_9775 - SURFACE
      ?auto_9772 - PLACE
      ?auto_9771 - HOIST
      ?auto_9779 - SURFACE
      ?auto_9783 - SURFACE
      ?auto_9785 - PLACE
      ?auto_9776 - HOIST
      ?auto_9780 - SURFACE
      ?auto_9782 - PLACE
      ?auto_9784 - HOIST
      ?auto_9781 - SURFACE
      ?auto_9786 - SURFACE
      ?auto_9769 - SURFACE
      ?auto_9764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9766 ?auto_9768 ) ( IS-CRATE ?auto_9762 ) ( not ( = ?auto_9767 ?auto_9768 ) ) ( HOIST-AT ?auto_9763 ?auto_9767 ) ( AVAILABLE ?auto_9763 ) ( SURFACE-AT ?auto_9762 ?auto_9767 ) ( ON ?auto_9762 ?auto_9765 ) ( CLEAR ?auto_9762 ) ( not ( = ?auto_9761 ?auto_9762 ) ) ( not ( = ?auto_9761 ?auto_9765 ) ) ( not ( = ?auto_9762 ?auto_9765 ) ) ( not ( = ?auto_9766 ?auto_9763 ) ) ( IS-CRATE ?auto_9761 ) ( not ( = ?auto_9774 ?auto_9768 ) ) ( HOIST-AT ?auto_9773 ?auto_9774 ) ( SURFACE-AT ?auto_9761 ?auto_9774 ) ( ON ?auto_9761 ?auto_9778 ) ( CLEAR ?auto_9761 ) ( not ( = ?auto_9760 ?auto_9761 ) ) ( not ( = ?auto_9760 ?auto_9778 ) ) ( not ( = ?auto_9761 ?auto_9778 ) ) ( not ( = ?auto_9766 ?auto_9773 ) ) ( IS-CRATE ?auto_9760 ) ( not ( = ?auto_9777 ?auto_9768 ) ) ( HOIST-AT ?auto_9770 ?auto_9777 ) ( SURFACE-AT ?auto_9760 ?auto_9777 ) ( ON ?auto_9760 ?auto_9775 ) ( CLEAR ?auto_9760 ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9759 ?auto_9775 ) ) ( not ( = ?auto_9760 ?auto_9775 ) ) ( not ( = ?auto_9766 ?auto_9770 ) ) ( IS-CRATE ?auto_9759 ) ( not ( = ?auto_9772 ?auto_9768 ) ) ( HOIST-AT ?auto_9771 ?auto_9772 ) ( AVAILABLE ?auto_9771 ) ( SURFACE-AT ?auto_9759 ?auto_9772 ) ( ON ?auto_9759 ?auto_9779 ) ( CLEAR ?auto_9759 ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( not ( = ?auto_9758 ?auto_9779 ) ) ( not ( = ?auto_9759 ?auto_9779 ) ) ( not ( = ?auto_9766 ?auto_9771 ) ) ( IS-CRATE ?auto_9758 ) ( AVAILABLE ?auto_9773 ) ( SURFACE-AT ?auto_9758 ?auto_9774 ) ( ON ?auto_9758 ?auto_9783 ) ( CLEAR ?auto_9758 ) ( not ( = ?auto_9757 ?auto_9758 ) ) ( not ( = ?auto_9757 ?auto_9783 ) ) ( not ( = ?auto_9758 ?auto_9783 ) ) ( IS-CRATE ?auto_9757 ) ( not ( = ?auto_9785 ?auto_9768 ) ) ( HOIST-AT ?auto_9776 ?auto_9785 ) ( SURFACE-AT ?auto_9757 ?auto_9785 ) ( ON ?auto_9757 ?auto_9780 ) ( CLEAR ?auto_9757 ) ( not ( = ?auto_9756 ?auto_9757 ) ) ( not ( = ?auto_9756 ?auto_9780 ) ) ( not ( = ?auto_9757 ?auto_9780 ) ) ( not ( = ?auto_9766 ?auto_9776 ) ) ( IS-CRATE ?auto_9756 ) ( not ( = ?auto_9782 ?auto_9768 ) ) ( HOIST-AT ?auto_9784 ?auto_9782 ) ( AVAILABLE ?auto_9784 ) ( SURFACE-AT ?auto_9756 ?auto_9782 ) ( ON ?auto_9756 ?auto_9781 ) ( CLEAR ?auto_9756 ) ( not ( = ?auto_9755 ?auto_9756 ) ) ( not ( = ?auto_9755 ?auto_9781 ) ) ( not ( = ?auto_9756 ?auto_9781 ) ) ( not ( = ?auto_9766 ?auto_9784 ) ) ( IS-CRATE ?auto_9755 ) ( AVAILABLE ?auto_9770 ) ( SURFACE-AT ?auto_9755 ?auto_9777 ) ( ON ?auto_9755 ?auto_9786 ) ( CLEAR ?auto_9755 ) ( not ( = ?auto_9754 ?auto_9755 ) ) ( not ( = ?auto_9754 ?auto_9786 ) ) ( not ( = ?auto_9755 ?auto_9786 ) ) ( SURFACE-AT ?auto_9753 ?auto_9768 ) ( CLEAR ?auto_9753 ) ( IS-CRATE ?auto_9754 ) ( AVAILABLE ?auto_9766 ) ( AVAILABLE ?auto_9776 ) ( SURFACE-AT ?auto_9754 ?auto_9785 ) ( ON ?auto_9754 ?auto_9769 ) ( CLEAR ?auto_9754 ) ( TRUCK-AT ?auto_9764 ?auto_9768 ) ( not ( = ?auto_9753 ?auto_9754 ) ) ( not ( = ?auto_9753 ?auto_9769 ) ) ( not ( = ?auto_9754 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9755 ) ) ( not ( = ?auto_9753 ?auto_9786 ) ) ( not ( = ?auto_9755 ?auto_9769 ) ) ( not ( = ?auto_9777 ?auto_9785 ) ) ( not ( = ?auto_9770 ?auto_9776 ) ) ( not ( = ?auto_9786 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9756 ) ) ( not ( = ?auto_9753 ?auto_9781 ) ) ( not ( = ?auto_9754 ?auto_9756 ) ) ( not ( = ?auto_9754 ?auto_9781 ) ) ( not ( = ?auto_9756 ?auto_9786 ) ) ( not ( = ?auto_9756 ?auto_9769 ) ) ( not ( = ?auto_9782 ?auto_9777 ) ) ( not ( = ?auto_9782 ?auto_9785 ) ) ( not ( = ?auto_9784 ?auto_9770 ) ) ( not ( = ?auto_9784 ?auto_9776 ) ) ( not ( = ?auto_9781 ?auto_9786 ) ) ( not ( = ?auto_9781 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9757 ) ) ( not ( = ?auto_9753 ?auto_9780 ) ) ( not ( = ?auto_9754 ?auto_9757 ) ) ( not ( = ?auto_9754 ?auto_9780 ) ) ( not ( = ?auto_9755 ?auto_9757 ) ) ( not ( = ?auto_9755 ?auto_9780 ) ) ( not ( = ?auto_9757 ?auto_9781 ) ) ( not ( = ?auto_9757 ?auto_9786 ) ) ( not ( = ?auto_9757 ?auto_9769 ) ) ( not ( = ?auto_9780 ?auto_9781 ) ) ( not ( = ?auto_9780 ?auto_9786 ) ) ( not ( = ?auto_9780 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9758 ) ) ( not ( = ?auto_9753 ?auto_9783 ) ) ( not ( = ?auto_9754 ?auto_9758 ) ) ( not ( = ?auto_9754 ?auto_9783 ) ) ( not ( = ?auto_9755 ?auto_9758 ) ) ( not ( = ?auto_9755 ?auto_9783 ) ) ( not ( = ?auto_9756 ?auto_9758 ) ) ( not ( = ?auto_9756 ?auto_9783 ) ) ( not ( = ?auto_9758 ?auto_9780 ) ) ( not ( = ?auto_9758 ?auto_9781 ) ) ( not ( = ?auto_9758 ?auto_9786 ) ) ( not ( = ?auto_9758 ?auto_9769 ) ) ( not ( = ?auto_9774 ?auto_9785 ) ) ( not ( = ?auto_9774 ?auto_9782 ) ) ( not ( = ?auto_9774 ?auto_9777 ) ) ( not ( = ?auto_9773 ?auto_9776 ) ) ( not ( = ?auto_9773 ?auto_9784 ) ) ( not ( = ?auto_9773 ?auto_9770 ) ) ( not ( = ?auto_9783 ?auto_9780 ) ) ( not ( = ?auto_9783 ?auto_9781 ) ) ( not ( = ?auto_9783 ?auto_9786 ) ) ( not ( = ?auto_9783 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9759 ) ) ( not ( = ?auto_9753 ?auto_9779 ) ) ( not ( = ?auto_9754 ?auto_9759 ) ) ( not ( = ?auto_9754 ?auto_9779 ) ) ( not ( = ?auto_9755 ?auto_9759 ) ) ( not ( = ?auto_9755 ?auto_9779 ) ) ( not ( = ?auto_9756 ?auto_9759 ) ) ( not ( = ?auto_9756 ?auto_9779 ) ) ( not ( = ?auto_9757 ?auto_9759 ) ) ( not ( = ?auto_9757 ?auto_9779 ) ) ( not ( = ?auto_9759 ?auto_9783 ) ) ( not ( = ?auto_9759 ?auto_9780 ) ) ( not ( = ?auto_9759 ?auto_9781 ) ) ( not ( = ?auto_9759 ?auto_9786 ) ) ( not ( = ?auto_9759 ?auto_9769 ) ) ( not ( = ?auto_9772 ?auto_9774 ) ) ( not ( = ?auto_9772 ?auto_9785 ) ) ( not ( = ?auto_9772 ?auto_9782 ) ) ( not ( = ?auto_9772 ?auto_9777 ) ) ( not ( = ?auto_9771 ?auto_9773 ) ) ( not ( = ?auto_9771 ?auto_9776 ) ) ( not ( = ?auto_9771 ?auto_9784 ) ) ( not ( = ?auto_9771 ?auto_9770 ) ) ( not ( = ?auto_9779 ?auto_9783 ) ) ( not ( = ?auto_9779 ?auto_9780 ) ) ( not ( = ?auto_9779 ?auto_9781 ) ) ( not ( = ?auto_9779 ?auto_9786 ) ) ( not ( = ?auto_9779 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9760 ) ) ( not ( = ?auto_9753 ?auto_9775 ) ) ( not ( = ?auto_9754 ?auto_9760 ) ) ( not ( = ?auto_9754 ?auto_9775 ) ) ( not ( = ?auto_9755 ?auto_9760 ) ) ( not ( = ?auto_9755 ?auto_9775 ) ) ( not ( = ?auto_9756 ?auto_9760 ) ) ( not ( = ?auto_9756 ?auto_9775 ) ) ( not ( = ?auto_9757 ?auto_9760 ) ) ( not ( = ?auto_9757 ?auto_9775 ) ) ( not ( = ?auto_9758 ?auto_9760 ) ) ( not ( = ?auto_9758 ?auto_9775 ) ) ( not ( = ?auto_9760 ?auto_9779 ) ) ( not ( = ?auto_9760 ?auto_9783 ) ) ( not ( = ?auto_9760 ?auto_9780 ) ) ( not ( = ?auto_9760 ?auto_9781 ) ) ( not ( = ?auto_9760 ?auto_9786 ) ) ( not ( = ?auto_9760 ?auto_9769 ) ) ( not ( = ?auto_9775 ?auto_9779 ) ) ( not ( = ?auto_9775 ?auto_9783 ) ) ( not ( = ?auto_9775 ?auto_9780 ) ) ( not ( = ?auto_9775 ?auto_9781 ) ) ( not ( = ?auto_9775 ?auto_9786 ) ) ( not ( = ?auto_9775 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9761 ) ) ( not ( = ?auto_9753 ?auto_9778 ) ) ( not ( = ?auto_9754 ?auto_9761 ) ) ( not ( = ?auto_9754 ?auto_9778 ) ) ( not ( = ?auto_9755 ?auto_9761 ) ) ( not ( = ?auto_9755 ?auto_9778 ) ) ( not ( = ?auto_9756 ?auto_9761 ) ) ( not ( = ?auto_9756 ?auto_9778 ) ) ( not ( = ?auto_9757 ?auto_9761 ) ) ( not ( = ?auto_9757 ?auto_9778 ) ) ( not ( = ?auto_9758 ?auto_9761 ) ) ( not ( = ?auto_9758 ?auto_9778 ) ) ( not ( = ?auto_9759 ?auto_9761 ) ) ( not ( = ?auto_9759 ?auto_9778 ) ) ( not ( = ?auto_9761 ?auto_9775 ) ) ( not ( = ?auto_9761 ?auto_9779 ) ) ( not ( = ?auto_9761 ?auto_9783 ) ) ( not ( = ?auto_9761 ?auto_9780 ) ) ( not ( = ?auto_9761 ?auto_9781 ) ) ( not ( = ?auto_9761 ?auto_9786 ) ) ( not ( = ?auto_9761 ?auto_9769 ) ) ( not ( = ?auto_9778 ?auto_9775 ) ) ( not ( = ?auto_9778 ?auto_9779 ) ) ( not ( = ?auto_9778 ?auto_9783 ) ) ( not ( = ?auto_9778 ?auto_9780 ) ) ( not ( = ?auto_9778 ?auto_9781 ) ) ( not ( = ?auto_9778 ?auto_9786 ) ) ( not ( = ?auto_9778 ?auto_9769 ) ) ( not ( = ?auto_9753 ?auto_9762 ) ) ( not ( = ?auto_9753 ?auto_9765 ) ) ( not ( = ?auto_9754 ?auto_9762 ) ) ( not ( = ?auto_9754 ?auto_9765 ) ) ( not ( = ?auto_9755 ?auto_9762 ) ) ( not ( = ?auto_9755 ?auto_9765 ) ) ( not ( = ?auto_9756 ?auto_9762 ) ) ( not ( = ?auto_9756 ?auto_9765 ) ) ( not ( = ?auto_9757 ?auto_9762 ) ) ( not ( = ?auto_9757 ?auto_9765 ) ) ( not ( = ?auto_9758 ?auto_9762 ) ) ( not ( = ?auto_9758 ?auto_9765 ) ) ( not ( = ?auto_9759 ?auto_9762 ) ) ( not ( = ?auto_9759 ?auto_9765 ) ) ( not ( = ?auto_9760 ?auto_9762 ) ) ( not ( = ?auto_9760 ?auto_9765 ) ) ( not ( = ?auto_9762 ?auto_9778 ) ) ( not ( = ?auto_9762 ?auto_9775 ) ) ( not ( = ?auto_9762 ?auto_9779 ) ) ( not ( = ?auto_9762 ?auto_9783 ) ) ( not ( = ?auto_9762 ?auto_9780 ) ) ( not ( = ?auto_9762 ?auto_9781 ) ) ( not ( = ?auto_9762 ?auto_9786 ) ) ( not ( = ?auto_9762 ?auto_9769 ) ) ( not ( = ?auto_9767 ?auto_9774 ) ) ( not ( = ?auto_9767 ?auto_9777 ) ) ( not ( = ?auto_9767 ?auto_9772 ) ) ( not ( = ?auto_9767 ?auto_9785 ) ) ( not ( = ?auto_9767 ?auto_9782 ) ) ( not ( = ?auto_9763 ?auto_9773 ) ) ( not ( = ?auto_9763 ?auto_9770 ) ) ( not ( = ?auto_9763 ?auto_9771 ) ) ( not ( = ?auto_9763 ?auto_9776 ) ) ( not ( = ?auto_9763 ?auto_9784 ) ) ( not ( = ?auto_9765 ?auto_9778 ) ) ( not ( = ?auto_9765 ?auto_9775 ) ) ( not ( = ?auto_9765 ?auto_9779 ) ) ( not ( = ?auto_9765 ?auto_9783 ) ) ( not ( = ?auto_9765 ?auto_9780 ) ) ( not ( = ?auto_9765 ?auto_9781 ) ) ( not ( = ?auto_9765 ?auto_9786 ) ) ( not ( = ?auto_9765 ?auto_9769 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9753 ?auto_9754 ?auto_9755 ?auto_9756 ?auto_9757 ?auto_9758 ?auto_9759 ?auto_9760 ?auto_9761 )
      ( MAKE-1CRATE ?auto_9761 ?auto_9762 )
      ( MAKE-9CRATE-VERIFY ?auto_9753 ?auto_9754 ?auto_9755 ?auto_9756 ?auto_9757 ?auto_9758 ?auto_9759 ?auto_9760 ?auto_9761 ?auto_9762 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9808 - SURFACE
      ?auto_9809 - SURFACE
      ?auto_9810 - SURFACE
      ?auto_9811 - SURFACE
      ?auto_9812 - SURFACE
      ?auto_9813 - SURFACE
      ?auto_9814 - SURFACE
      ?auto_9815 - SURFACE
      ?auto_9816 - SURFACE
      ?auto_9817 - SURFACE
      ?auto_9818 - SURFACE
    )
    :vars
    (
      ?auto_9821 - HOIST
      ?auto_9820 - PLACE
      ?auto_9824 - PLACE
      ?auto_9822 - HOIST
      ?auto_9823 - SURFACE
      ?auto_9835 - PLACE
      ?auto_9842 - HOIST
      ?auto_9826 - SURFACE
      ?auto_9841 - PLACE
      ?auto_9830 - HOIST
      ?auto_9832 - SURFACE
      ?auto_9839 - PLACE
      ?auto_9844 - HOIST
      ?auto_9836 - SURFACE
      ?auto_9829 - PLACE
      ?auto_9840 - HOIST
      ?auto_9845 - SURFACE
      ?auto_9825 - SURFACE
      ?auto_9828 - PLACE
      ?auto_9827 - HOIST
      ?auto_9833 - SURFACE
      ?auto_9831 - PLACE
      ?auto_9837 - HOIST
      ?auto_9834 - SURFACE
      ?auto_9838 - SURFACE
      ?auto_9843 - SURFACE
      ?auto_9819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9821 ?auto_9820 ) ( IS-CRATE ?auto_9818 ) ( not ( = ?auto_9824 ?auto_9820 ) ) ( HOIST-AT ?auto_9822 ?auto_9824 ) ( AVAILABLE ?auto_9822 ) ( SURFACE-AT ?auto_9818 ?auto_9824 ) ( ON ?auto_9818 ?auto_9823 ) ( CLEAR ?auto_9818 ) ( not ( = ?auto_9817 ?auto_9818 ) ) ( not ( = ?auto_9817 ?auto_9823 ) ) ( not ( = ?auto_9818 ?auto_9823 ) ) ( not ( = ?auto_9821 ?auto_9822 ) ) ( IS-CRATE ?auto_9817 ) ( not ( = ?auto_9835 ?auto_9820 ) ) ( HOIST-AT ?auto_9842 ?auto_9835 ) ( AVAILABLE ?auto_9842 ) ( SURFACE-AT ?auto_9817 ?auto_9835 ) ( ON ?auto_9817 ?auto_9826 ) ( CLEAR ?auto_9817 ) ( not ( = ?auto_9816 ?auto_9817 ) ) ( not ( = ?auto_9816 ?auto_9826 ) ) ( not ( = ?auto_9817 ?auto_9826 ) ) ( not ( = ?auto_9821 ?auto_9842 ) ) ( IS-CRATE ?auto_9816 ) ( not ( = ?auto_9841 ?auto_9820 ) ) ( HOIST-AT ?auto_9830 ?auto_9841 ) ( SURFACE-AT ?auto_9816 ?auto_9841 ) ( ON ?auto_9816 ?auto_9832 ) ( CLEAR ?auto_9816 ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( not ( = ?auto_9815 ?auto_9832 ) ) ( not ( = ?auto_9816 ?auto_9832 ) ) ( not ( = ?auto_9821 ?auto_9830 ) ) ( IS-CRATE ?auto_9815 ) ( not ( = ?auto_9839 ?auto_9820 ) ) ( HOIST-AT ?auto_9844 ?auto_9839 ) ( SURFACE-AT ?auto_9815 ?auto_9839 ) ( ON ?auto_9815 ?auto_9836 ) ( CLEAR ?auto_9815 ) ( not ( = ?auto_9814 ?auto_9815 ) ) ( not ( = ?auto_9814 ?auto_9836 ) ) ( not ( = ?auto_9815 ?auto_9836 ) ) ( not ( = ?auto_9821 ?auto_9844 ) ) ( IS-CRATE ?auto_9814 ) ( not ( = ?auto_9829 ?auto_9820 ) ) ( HOIST-AT ?auto_9840 ?auto_9829 ) ( AVAILABLE ?auto_9840 ) ( SURFACE-AT ?auto_9814 ?auto_9829 ) ( ON ?auto_9814 ?auto_9845 ) ( CLEAR ?auto_9814 ) ( not ( = ?auto_9813 ?auto_9814 ) ) ( not ( = ?auto_9813 ?auto_9845 ) ) ( not ( = ?auto_9814 ?auto_9845 ) ) ( not ( = ?auto_9821 ?auto_9840 ) ) ( IS-CRATE ?auto_9813 ) ( AVAILABLE ?auto_9830 ) ( SURFACE-AT ?auto_9813 ?auto_9841 ) ( ON ?auto_9813 ?auto_9825 ) ( CLEAR ?auto_9813 ) ( not ( = ?auto_9812 ?auto_9813 ) ) ( not ( = ?auto_9812 ?auto_9825 ) ) ( not ( = ?auto_9813 ?auto_9825 ) ) ( IS-CRATE ?auto_9812 ) ( not ( = ?auto_9828 ?auto_9820 ) ) ( HOIST-AT ?auto_9827 ?auto_9828 ) ( SURFACE-AT ?auto_9812 ?auto_9828 ) ( ON ?auto_9812 ?auto_9833 ) ( CLEAR ?auto_9812 ) ( not ( = ?auto_9811 ?auto_9812 ) ) ( not ( = ?auto_9811 ?auto_9833 ) ) ( not ( = ?auto_9812 ?auto_9833 ) ) ( not ( = ?auto_9821 ?auto_9827 ) ) ( IS-CRATE ?auto_9811 ) ( not ( = ?auto_9831 ?auto_9820 ) ) ( HOIST-AT ?auto_9837 ?auto_9831 ) ( AVAILABLE ?auto_9837 ) ( SURFACE-AT ?auto_9811 ?auto_9831 ) ( ON ?auto_9811 ?auto_9834 ) ( CLEAR ?auto_9811 ) ( not ( = ?auto_9810 ?auto_9811 ) ) ( not ( = ?auto_9810 ?auto_9834 ) ) ( not ( = ?auto_9811 ?auto_9834 ) ) ( not ( = ?auto_9821 ?auto_9837 ) ) ( IS-CRATE ?auto_9810 ) ( AVAILABLE ?auto_9844 ) ( SURFACE-AT ?auto_9810 ?auto_9839 ) ( ON ?auto_9810 ?auto_9838 ) ( CLEAR ?auto_9810 ) ( not ( = ?auto_9809 ?auto_9810 ) ) ( not ( = ?auto_9809 ?auto_9838 ) ) ( not ( = ?auto_9810 ?auto_9838 ) ) ( SURFACE-AT ?auto_9808 ?auto_9820 ) ( CLEAR ?auto_9808 ) ( IS-CRATE ?auto_9809 ) ( AVAILABLE ?auto_9821 ) ( AVAILABLE ?auto_9827 ) ( SURFACE-AT ?auto_9809 ?auto_9828 ) ( ON ?auto_9809 ?auto_9843 ) ( CLEAR ?auto_9809 ) ( TRUCK-AT ?auto_9819 ?auto_9820 ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( not ( = ?auto_9808 ?auto_9843 ) ) ( not ( = ?auto_9809 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9810 ) ) ( not ( = ?auto_9808 ?auto_9838 ) ) ( not ( = ?auto_9810 ?auto_9843 ) ) ( not ( = ?auto_9839 ?auto_9828 ) ) ( not ( = ?auto_9844 ?auto_9827 ) ) ( not ( = ?auto_9838 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9811 ) ) ( not ( = ?auto_9808 ?auto_9834 ) ) ( not ( = ?auto_9809 ?auto_9811 ) ) ( not ( = ?auto_9809 ?auto_9834 ) ) ( not ( = ?auto_9811 ?auto_9838 ) ) ( not ( = ?auto_9811 ?auto_9843 ) ) ( not ( = ?auto_9831 ?auto_9839 ) ) ( not ( = ?auto_9831 ?auto_9828 ) ) ( not ( = ?auto_9837 ?auto_9844 ) ) ( not ( = ?auto_9837 ?auto_9827 ) ) ( not ( = ?auto_9834 ?auto_9838 ) ) ( not ( = ?auto_9834 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9812 ) ) ( not ( = ?auto_9808 ?auto_9833 ) ) ( not ( = ?auto_9809 ?auto_9812 ) ) ( not ( = ?auto_9809 ?auto_9833 ) ) ( not ( = ?auto_9810 ?auto_9812 ) ) ( not ( = ?auto_9810 ?auto_9833 ) ) ( not ( = ?auto_9812 ?auto_9834 ) ) ( not ( = ?auto_9812 ?auto_9838 ) ) ( not ( = ?auto_9812 ?auto_9843 ) ) ( not ( = ?auto_9833 ?auto_9834 ) ) ( not ( = ?auto_9833 ?auto_9838 ) ) ( not ( = ?auto_9833 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9813 ) ) ( not ( = ?auto_9808 ?auto_9825 ) ) ( not ( = ?auto_9809 ?auto_9813 ) ) ( not ( = ?auto_9809 ?auto_9825 ) ) ( not ( = ?auto_9810 ?auto_9813 ) ) ( not ( = ?auto_9810 ?auto_9825 ) ) ( not ( = ?auto_9811 ?auto_9813 ) ) ( not ( = ?auto_9811 ?auto_9825 ) ) ( not ( = ?auto_9813 ?auto_9833 ) ) ( not ( = ?auto_9813 ?auto_9834 ) ) ( not ( = ?auto_9813 ?auto_9838 ) ) ( not ( = ?auto_9813 ?auto_9843 ) ) ( not ( = ?auto_9841 ?auto_9828 ) ) ( not ( = ?auto_9841 ?auto_9831 ) ) ( not ( = ?auto_9841 ?auto_9839 ) ) ( not ( = ?auto_9830 ?auto_9827 ) ) ( not ( = ?auto_9830 ?auto_9837 ) ) ( not ( = ?auto_9830 ?auto_9844 ) ) ( not ( = ?auto_9825 ?auto_9833 ) ) ( not ( = ?auto_9825 ?auto_9834 ) ) ( not ( = ?auto_9825 ?auto_9838 ) ) ( not ( = ?auto_9825 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9814 ) ) ( not ( = ?auto_9808 ?auto_9845 ) ) ( not ( = ?auto_9809 ?auto_9814 ) ) ( not ( = ?auto_9809 ?auto_9845 ) ) ( not ( = ?auto_9810 ?auto_9814 ) ) ( not ( = ?auto_9810 ?auto_9845 ) ) ( not ( = ?auto_9811 ?auto_9814 ) ) ( not ( = ?auto_9811 ?auto_9845 ) ) ( not ( = ?auto_9812 ?auto_9814 ) ) ( not ( = ?auto_9812 ?auto_9845 ) ) ( not ( = ?auto_9814 ?auto_9825 ) ) ( not ( = ?auto_9814 ?auto_9833 ) ) ( not ( = ?auto_9814 ?auto_9834 ) ) ( not ( = ?auto_9814 ?auto_9838 ) ) ( not ( = ?auto_9814 ?auto_9843 ) ) ( not ( = ?auto_9829 ?auto_9841 ) ) ( not ( = ?auto_9829 ?auto_9828 ) ) ( not ( = ?auto_9829 ?auto_9831 ) ) ( not ( = ?auto_9829 ?auto_9839 ) ) ( not ( = ?auto_9840 ?auto_9830 ) ) ( not ( = ?auto_9840 ?auto_9827 ) ) ( not ( = ?auto_9840 ?auto_9837 ) ) ( not ( = ?auto_9840 ?auto_9844 ) ) ( not ( = ?auto_9845 ?auto_9825 ) ) ( not ( = ?auto_9845 ?auto_9833 ) ) ( not ( = ?auto_9845 ?auto_9834 ) ) ( not ( = ?auto_9845 ?auto_9838 ) ) ( not ( = ?auto_9845 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9815 ) ) ( not ( = ?auto_9808 ?auto_9836 ) ) ( not ( = ?auto_9809 ?auto_9815 ) ) ( not ( = ?auto_9809 ?auto_9836 ) ) ( not ( = ?auto_9810 ?auto_9815 ) ) ( not ( = ?auto_9810 ?auto_9836 ) ) ( not ( = ?auto_9811 ?auto_9815 ) ) ( not ( = ?auto_9811 ?auto_9836 ) ) ( not ( = ?auto_9812 ?auto_9815 ) ) ( not ( = ?auto_9812 ?auto_9836 ) ) ( not ( = ?auto_9813 ?auto_9815 ) ) ( not ( = ?auto_9813 ?auto_9836 ) ) ( not ( = ?auto_9815 ?auto_9845 ) ) ( not ( = ?auto_9815 ?auto_9825 ) ) ( not ( = ?auto_9815 ?auto_9833 ) ) ( not ( = ?auto_9815 ?auto_9834 ) ) ( not ( = ?auto_9815 ?auto_9838 ) ) ( not ( = ?auto_9815 ?auto_9843 ) ) ( not ( = ?auto_9836 ?auto_9845 ) ) ( not ( = ?auto_9836 ?auto_9825 ) ) ( not ( = ?auto_9836 ?auto_9833 ) ) ( not ( = ?auto_9836 ?auto_9834 ) ) ( not ( = ?auto_9836 ?auto_9838 ) ) ( not ( = ?auto_9836 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9816 ) ) ( not ( = ?auto_9808 ?auto_9832 ) ) ( not ( = ?auto_9809 ?auto_9816 ) ) ( not ( = ?auto_9809 ?auto_9832 ) ) ( not ( = ?auto_9810 ?auto_9816 ) ) ( not ( = ?auto_9810 ?auto_9832 ) ) ( not ( = ?auto_9811 ?auto_9816 ) ) ( not ( = ?auto_9811 ?auto_9832 ) ) ( not ( = ?auto_9812 ?auto_9816 ) ) ( not ( = ?auto_9812 ?auto_9832 ) ) ( not ( = ?auto_9813 ?auto_9816 ) ) ( not ( = ?auto_9813 ?auto_9832 ) ) ( not ( = ?auto_9814 ?auto_9816 ) ) ( not ( = ?auto_9814 ?auto_9832 ) ) ( not ( = ?auto_9816 ?auto_9836 ) ) ( not ( = ?auto_9816 ?auto_9845 ) ) ( not ( = ?auto_9816 ?auto_9825 ) ) ( not ( = ?auto_9816 ?auto_9833 ) ) ( not ( = ?auto_9816 ?auto_9834 ) ) ( not ( = ?auto_9816 ?auto_9838 ) ) ( not ( = ?auto_9816 ?auto_9843 ) ) ( not ( = ?auto_9832 ?auto_9836 ) ) ( not ( = ?auto_9832 ?auto_9845 ) ) ( not ( = ?auto_9832 ?auto_9825 ) ) ( not ( = ?auto_9832 ?auto_9833 ) ) ( not ( = ?auto_9832 ?auto_9834 ) ) ( not ( = ?auto_9832 ?auto_9838 ) ) ( not ( = ?auto_9832 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9817 ) ) ( not ( = ?auto_9808 ?auto_9826 ) ) ( not ( = ?auto_9809 ?auto_9817 ) ) ( not ( = ?auto_9809 ?auto_9826 ) ) ( not ( = ?auto_9810 ?auto_9817 ) ) ( not ( = ?auto_9810 ?auto_9826 ) ) ( not ( = ?auto_9811 ?auto_9817 ) ) ( not ( = ?auto_9811 ?auto_9826 ) ) ( not ( = ?auto_9812 ?auto_9817 ) ) ( not ( = ?auto_9812 ?auto_9826 ) ) ( not ( = ?auto_9813 ?auto_9817 ) ) ( not ( = ?auto_9813 ?auto_9826 ) ) ( not ( = ?auto_9814 ?auto_9817 ) ) ( not ( = ?auto_9814 ?auto_9826 ) ) ( not ( = ?auto_9815 ?auto_9817 ) ) ( not ( = ?auto_9815 ?auto_9826 ) ) ( not ( = ?auto_9817 ?auto_9832 ) ) ( not ( = ?auto_9817 ?auto_9836 ) ) ( not ( = ?auto_9817 ?auto_9845 ) ) ( not ( = ?auto_9817 ?auto_9825 ) ) ( not ( = ?auto_9817 ?auto_9833 ) ) ( not ( = ?auto_9817 ?auto_9834 ) ) ( not ( = ?auto_9817 ?auto_9838 ) ) ( not ( = ?auto_9817 ?auto_9843 ) ) ( not ( = ?auto_9835 ?auto_9841 ) ) ( not ( = ?auto_9835 ?auto_9839 ) ) ( not ( = ?auto_9835 ?auto_9829 ) ) ( not ( = ?auto_9835 ?auto_9828 ) ) ( not ( = ?auto_9835 ?auto_9831 ) ) ( not ( = ?auto_9842 ?auto_9830 ) ) ( not ( = ?auto_9842 ?auto_9844 ) ) ( not ( = ?auto_9842 ?auto_9840 ) ) ( not ( = ?auto_9842 ?auto_9827 ) ) ( not ( = ?auto_9842 ?auto_9837 ) ) ( not ( = ?auto_9826 ?auto_9832 ) ) ( not ( = ?auto_9826 ?auto_9836 ) ) ( not ( = ?auto_9826 ?auto_9845 ) ) ( not ( = ?auto_9826 ?auto_9825 ) ) ( not ( = ?auto_9826 ?auto_9833 ) ) ( not ( = ?auto_9826 ?auto_9834 ) ) ( not ( = ?auto_9826 ?auto_9838 ) ) ( not ( = ?auto_9826 ?auto_9843 ) ) ( not ( = ?auto_9808 ?auto_9818 ) ) ( not ( = ?auto_9808 ?auto_9823 ) ) ( not ( = ?auto_9809 ?auto_9818 ) ) ( not ( = ?auto_9809 ?auto_9823 ) ) ( not ( = ?auto_9810 ?auto_9818 ) ) ( not ( = ?auto_9810 ?auto_9823 ) ) ( not ( = ?auto_9811 ?auto_9818 ) ) ( not ( = ?auto_9811 ?auto_9823 ) ) ( not ( = ?auto_9812 ?auto_9818 ) ) ( not ( = ?auto_9812 ?auto_9823 ) ) ( not ( = ?auto_9813 ?auto_9818 ) ) ( not ( = ?auto_9813 ?auto_9823 ) ) ( not ( = ?auto_9814 ?auto_9818 ) ) ( not ( = ?auto_9814 ?auto_9823 ) ) ( not ( = ?auto_9815 ?auto_9818 ) ) ( not ( = ?auto_9815 ?auto_9823 ) ) ( not ( = ?auto_9816 ?auto_9818 ) ) ( not ( = ?auto_9816 ?auto_9823 ) ) ( not ( = ?auto_9818 ?auto_9826 ) ) ( not ( = ?auto_9818 ?auto_9832 ) ) ( not ( = ?auto_9818 ?auto_9836 ) ) ( not ( = ?auto_9818 ?auto_9845 ) ) ( not ( = ?auto_9818 ?auto_9825 ) ) ( not ( = ?auto_9818 ?auto_9833 ) ) ( not ( = ?auto_9818 ?auto_9834 ) ) ( not ( = ?auto_9818 ?auto_9838 ) ) ( not ( = ?auto_9818 ?auto_9843 ) ) ( not ( = ?auto_9824 ?auto_9835 ) ) ( not ( = ?auto_9824 ?auto_9841 ) ) ( not ( = ?auto_9824 ?auto_9839 ) ) ( not ( = ?auto_9824 ?auto_9829 ) ) ( not ( = ?auto_9824 ?auto_9828 ) ) ( not ( = ?auto_9824 ?auto_9831 ) ) ( not ( = ?auto_9822 ?auto_9842 ) ) ( not ( = ?auto_9822 ?auto_9830 ) ) ( not ( = ?auto_9822 ?auto_9844 ) ) ( not ( = ?auto_9822 ?auto_9840 ) ) ( not ( = ?auto_9822 ?auto_9827 ) ) ( not ( = ?auto_9822 ?auto_9837 ) ) ( not ( = ?auto_9823 ?auto_9826 ) ) ( not ( = ?auto_9823 ?auto_9832 ) ) ( not ( = ?auto_9823 ?auto_9836 ) ) ( not ( = ?auto_9823 ?auto_9845 ) ) ( not ( = ?auto_9823 ?auto_9825 ) ) ( not ( = ?auto_9823 ?auto_9833 ) ) ( not ( = ?auto_9823 ?auto_9834 ) ) ( not ( = ?auto_9823 ?auto_9838 ) ) ( not ( = ?auto_9823 ?auto_9843 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9808 ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9812 ?auto_9813 ?auto_9814 ?auto_9815 ?auto_9816 ?auto_9817 )
      ( MAKE-1CRATE ?auto_9817 ?auto_9818 )
      ( MAKE-10CRATE-VERIFY ?auto_9808 ?auto_9809 ?auto_9810 ?auto_9811 ?auto_9812 ?auto_9813 ?auto_9814 ?auto_9815 ?auto_9816 ?auto_9817 ?auto_9818 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9868 - SURFACE
      ?auto_9869 - SURFACE
      ?auto_9870 - SURFACE
      ?auto_9871 - SURFACE
      ?auto_9872 - SURFACE
      ?auto_9873 - SURFACE
      ?auto_9874 - SURFACE
      ?auto_9875 - SURFACE
      ?auto_9876 - SURFACE
      ?auto_9877 - SURFACE
      ?auto_9878 - SURFACE
      ?auto_9879 - SURFACE
    )
    :vars
    (
      ?auto_9883 - HOIST
      ?auto_9884 - PLACE
      ?auto_9885 - PLACE
      ?auto_9882 - HOIST
      ?auto_9881 - SURFACE
      ?auto_9895 - PLACE
      ?auto_9896 - HOIST
      ?auto_9904 - SURFACE
      ?auto_9903 - SURFACE
      ?auto_9899 - PLACE
      ?auto_9889 - HOIST
      ?auto_9888 - SURFACE
      ?auto_9906 - PLACE
      ?auto_9898 - HOIST
      ?auto_9886 - SURFACE
      ?auto_9893 - PLACE
      ?auto_9901 - HOIST
      ?auto_9887 - SURFACE
      ?auto_9890 - SURFACE
      ?auto_9900 - PLACE
      ?auto_9892 - HOIST
      ?auto_9894 - SURFACE
      ?auto_9891 - PLACE
      ?auto_9907 - HOIST
      ?auto_9905 - SURFACE
      ?auto_9902 - SURFACE
      ?auto_9897 - SURFACE
      ?auto_9880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9883 ?auto_9884 ) ( IS-CRATE ?auto_9879 ) ( not ( = ?auto_9885 ?auto_9884 ) ) ( HOIST-AT ?auto_9882 ?auto_9885 ) ( SURFACE-AT ?auto_9879 ?auto_9885 ) ( ON ?auto_9879 ?auto_9881 ) ( CLEAR ?auto_9879 ) ( not ( = ?auto_9878 ?auto_9879 ) ) ( not ( = ?auto_9878 ?auto_9881 ) ) ( not ( = ?auto_9879 ?auto_9881 ) ) ( not ( = ?auto_9883 ?auto_9882 ) ) ( IS-CRATE ?auto_9878 ) ( not ( = ?auto_9895 ?auto_9884 ) ) ( HOIST-AT ?auto_9896 ?auto_9895 ) ( AVAILABLE ?auto_9896 ) ( SURFACE-AT ?auto_9878 ?auto_9895 ) ( ON ?auto_9878 ?auto_9904 ) ( CLEAR ?auto_9878 ) ( not ( = ?auto_9877 ?auto_9878 ) ) ( not ( = ?auto_9877 ?auto_9904 ) ) ( not ( = ?auto_9878 ?auto_9904 ) ) ( not ( = ?auto_9883 ?auto_9896 ) ) ( IS-CRATE ?auto_9877 ) ( AVAILABLE ?auto_9882 ) ( SURFACE-AT ?auto_9877 ?auto_9885 ) ( ON ?auto_9877 ?auto_9903 ) ( CLEAR ?auto_9877 ) ( not ( = ?auto_9876 ?auto_9877 ) ) ( not ( = ?auto_9876 ?auto_9903 ) ) ( not ( = ?auto_9877 ?auto_9903 ) ) ( IS-CRATE ?auto_9876 ) ( not ( = ?auto_9899 ?auto_9884 ) ) ( HOIST-AT ?auto_9889 ?auto_9899 ) ( SURFACE-AT ?auto_9876 ?auto_9899 ) ( ON ?auto_9876 ?auto_9888 ) ( CLEAR ?auto_9876 ) ( not ( = ?auto_9875 ?auto_9876 ) ) ( not ( = ?auto_9875 ?auto_9888 ) ) ( not ( = ?auto_9876 ?auto_9888 ) ) ( not ( = ?auto_9883 ?auto_9889 ) ) ( IS-CRATE ?auto_9875 ) ( not ( = ?auto_9906 ?auto_9884 ) ) ( HOIST-AT ?auto_9898 ?auto_9906 ) ( SURFACE-AT ?auto_9875 ?auto_9906 ) ( ON ?auto_9875 ?auto_9886 ) ( CLEAR ?auto_9875 ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( not ( = ?auto_9874 ?auto_9886 ) ) ( not ( = ?auto_9875 ?auto_9886 ) ) ( not ( = ?auto_9883 ?auto_9898 ) ) ( IS-CRATE ?auto_9874 ) ( not ( = ?auto_9893 ?auto_9884 ) ) ( HOIST-AT ?auto_9901 ?auto_9893 ) ( AVAILABLE ?auto_9901 ) ( SURFACE-AT ?auto_9874 ?auto_9893 ) ( ON ?auto_9874 ?auto_9887 ) ( CLEAR ?auto_9874 ) ( not ( = ?auto_9873 ?auto_9874 ) ) ( not ( = ?auto_9873 ?auto_9887 ) ) ( not ( = ?auto_9874 ?auto_9887 ) ) ( not ( = ?auto_9883 ?auto_9901 ) ) ( IS-CRATE ?auto_9873 ) ( AVAILABLE ?auto_9889 ) ( SURFACE-AT ?auto_9873 ?auto_9899 ) ( ON ?auto_9873 ?auto_9890 ) ( CLEAR ?auto_9873 ) ( not ( = ?auto_9872 ?auto_9873 ) ) ( not ( = ?auto_9872 ?auto_9890 ) ) ( not ( = ?auto_9873 ?auto_9890 ) ) ( IS-CRATE ?auto_9872 ) ( not ( = ?auto_9900 ?auto_9884 ) ) ( HOIST-AT ?auto_9892 ?auto_9900 ) ( SURFACE-AT ?auto_9872 ?auto_9900 ) ( ON ?auto_9872 ?auto_9894 ) ( CLEAR ?auto_9872 ) ( not ( = ?auto_9871 ?auto_9872 ) ) ( not ( = ?auto_9871 ?auto_9894 ) ) ( not ( = ?auto_9872 ?auto_9894 ) ) ( not ( = ?auto_9883 ?auto_9892 ) ) ( IS-CRATE ?auto_9871 ) ( not ( = ?auto_9891 ?auto_9884 ) ) ( HOIST-AT ?auto_9907 ?auto_9891 ) ( AVAILABLE ?auto_9907 ) ( SURFACE-AT ?auto_9871 ?auto_9891 ) ( ON ?auto_9871 ?auto_9905 ) ( CLEAR ?auto_9871 ) ( not ( = ?auto_9870 ?auto_9871 ) ) ( not ( = ?auto_9870 ?auto_9905 ) ) ( not ( = ?auto_9871 ?auto_9905 ) ) ( not ( = ?auto_9883 ?auto_9907 ) ) ( IS-CRATE ?auto_9870 ) ( AVAILABLE ?auto_9898 ) ( SURFACE-AT ?auto_9870 ?auto_9906 ) ( ON ?auto_9870 ?auto_9902 ) ( CLEAR ?auto_9870 ) ( not ( = ?auto_9869 ?auto_9870 ) ) ( not ( = ?auto_9869 ?auto_9902 ) ) ( not ( = ?auto_9870 ?auto_9902 ) ) ( SURFACE-AT ?auto_9868 ?auto_9884 ) ( CLEAR ?auto_9868 ) ( IS-CRATE ?auto_9869 ) ( AVAILABLE ?auto_9883 ) ( AVAILABLE ?auto_9892 ) ( SURFACE-AT ?auto_9869 ?auto_9900 ) ( ON ?auto_9869 ?auto_9897 ) ( CLEAR ?auto_9869 ) ( TRUCK-AT ?auto_9880 ?auto_9884 ) ( not ( = ?auto_9868 ?auto_9869 ) ) ( not ( = ?auto_9868 ?auto_9897 ) ) ( not ( = ?auto_9869 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9870 ) ) ( not ( = ?auto_9868 ?auto_9902 ) ) ( not ( = ?auto_9870 ?auto_9897 ) ) ( not ( = ?auto_9906 ?auto_9900 ) ) ( not ( = ?auto_9898 ?auto_9892 ) ) ( not ( = ?auto_9902 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9871 ) ) ( not ( = ?auto_9868 ?auto_9905 ) ) ( not ( = ?auto_9869 ?auto_9871 ) ) ( not ( = ?auto_9869 ?auto_9905 ) ) ( not ( = ?auto_9871 ?auto_9902 ) ) ( not ( = ?auto_9871 ?auto_9897 ) ) ( not ( = ?auto_9891 ?auto_9906 ) ) ( not ( = ?auto_9891 ?auto_9900 ) ) ( not ( = ?auto_9907 ?auto_9898 ) ) ( not ( = ?auto_9907 ?auto_9892 ) ) ( not ( = ?auto_9905 ?auto_9902 ) ) ( not ( = ?auto_9905 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9872 ) ) ( not ( = ?auto_9868 ?auto_9894 ) ) ( not ( = ?auto_9869 ?auto_9872 ) ) ( not ( = ?auto_9869 ?auto_9894 ) ) ( not ( = ?auto_9870 ?auto_9872 ) ) ( not ( = ?auto_9870 ?auto_9894 ) ) ( not ( = ?auto_9872 ?auto_9905 ) ) ( not ( = ?auto_9872 ?auto_9902 ) ) ( not ( = ?auto_9872 ?auto_9897 ) ) ( not ( = ?auto_9894 ?auto_9905 ) ) ( not ( = ?auto_9894 ?auto_9902 ) ) ( not ( = ?auto_9894 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9873 ) ) ( not ( = ?auto_9868 ?auto_9890 ) ) ( not ( = ?auto_9869 ?auto_9873 ) ) ( not ( = ?auto_9869 ?auto_9890 ) ) ( not ( = ?auto_9870 ?auto_9873 ) ) ( not ( = ?auto_9870 ?auto_9890 ) ) ( not ( = ?auto_9871 ?auto_9873 ) ) ( not ( = ?auto_9871 ?auto_9890 ) ) ( not ( = ?auto_9873 ?auto_9894 ) ) ( not ( = ?auto_9873 ?auto_9905 ) ) ( not ( = ?auto_9873 ?auto_9902 ) ) ( not ( = ?auto_9873 ?auto_9897 ) ) ( not ( = ?auto_9899 ?auto_9900 ) ) ( not ( = ?auto_9899 ?auto_9891 ) ) ( not ( = ?auto_9899 ?auto_9906 ) ) ( not ( = ?auto_9889 ?auto_9892 ) ) ( not ( = ?auto_9889 ?auto_9907 ) ) ( not ( = ?auto_9889 ?auto_9898 ) ) ( not ( = ?auto_9890 ?auto_9894 ) ) ( not ( = ?auto_9890 ?auto_9905 ) ) ( not ( = ?auto_9890 ?auto_9902 ) ) ( not ( = ?auto_9890 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9874 ) ) ( not ( = ?auto_9868 ?auto_9887 ) ) ( not ( = ?auto_9869 ?auto_9874 ) ) ( not ( = ?auto_9869 ?auto_9887 ) ) ( not ( = ?auto_9870 ?auto_9874 ) ) ( not ( = ?auto_9870 ?auto_9887 ) ) ( not ( = ?auto_9871 ?auto_9874 ) ) ( not ( = ?auto_9871 ?auto_9887 ) ) ( not ( = ?auto_9872 ?auto_9874 ) ) ( not ( = ?auto_9872 ?auto_9887 ) ) ( not ( = ?auto_9874 ?auto_9890 ) ) ( not ( = ?auto_9874 ?auto_9894 ) ) ( not ( = ?auto_9874 ?auto_9905 ) ) ( not ( = ?auto_9874 ?auto_9902 ) ) ( not ( = ?auto_9874 ?auto_9897 ) ) ( not ( = ?auto_9893 ?auto_9899 ) ) ( not ( = ?auto_9893 ?auto_9900 ) ) ( not ( = ?auto_9893 ?auto_9891 ) ) ( not ( = ?auto_9893 ?auto_9906 ) ) ( not ( = ?auto_9901 ?auto_9889 ) ) ( not ( = ?auto_9901 ?auto_9892 ) ) ( not ( = ?auto_9901 ?auto_9907 ) ) ( not ( = ?auto_9901 ?auto_9898 ) ) ( not ( = ?auto_9887 ?auto_9890 ) ) ( not ( = ?auto_9887 ?auto_9894 ) ) ( not ( = ?auto_9887 ?auto_9905 ) ) ( not ( = ?auto_9887 ?auto_9902 ) ) ( not ( = ?auto_9887 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9875 ) ) ( not ( = ?auto_9868 ?auto_9886 ) ) ( not ( = ?auto_9869 ?auto_9875 ) ) ( not ( = ?auto_9869 ?auto_9886 ) ) ( not ( = ?auto_9870 ?auto_9875 ) ) ( not ( = ?auto_9870 ?auto_9886 ) ) ( not ( = ?auto_9871 ?auto_9875 ) ) ( not ( = ?auto_9871 ?auto_9886 ) ) ( not ( = ?auto_9872 ?auto_9875 ) ) ( not ( = ?auto_9872 ?auto_9886 ) ) ( not ( = ?auto_9873 ?auto_9875 ) ) ( not ( = ?auto_9873 ?auto_9886 ) ) ( not ( = ?auto_9875 ?auto_9887 ) ) ( not ( = ?auto_9875 ?auto_9890 ) ) ( not ( = ?auto_9875 ?auto_9894 ) ) ( not ( = ?auto_9875 ?auto_9905 ) ) ( not ( = ?auto_9875 ?auto_9902 ) ) ( not ( = ?auto_9875 ?auto_9897 ) ) ( not ( = ?auto_9886 ?auto_9887 ) ) ( not ( = ?auto_9886 ?auto_9890 ) ) ( not ( = ?auto_9886 ?auto_9894 ) ) ( not ( = ?auto_9886 ?auto_9905 ) ) ( not ( = ?auto_9886 ?auto_9902 ) ) ( not ( = ?auto_9886 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9876 ) ) ( not ( = ?auto_9868 ?auto_9888 ) ) ( not ( = ?auto_9869 ?auto_9876 ) ) ( not ( = ?auto_9869 ?auto_9888 ) ) ( not ( = ?auto_9870 ?auto_9876 ) ) ( not ( = ?auto_9870 ?auto_9888 ) ) ( not ( = ?auto_9871 ?auto_9876 ) ) ( not ( = ?auto_9871 ?auto_9888 ) ) ( not ( = ?auto_9872 ?auto_9876 ) ) ( not ( = ?auto_9872 ?auto_9888 ) ) ( not ( = ?auto_9873 ?auto_9876 ) ) ( not ( = ?auto_9873 ?auto_9888 ) ) ( not ( = ?auto_9874 ?auto_9876 ) ) ( not ( = ?auto_9874 ?auto_9888 ) ) ( not ( = ?auto_9876 ?auto_9886 ) ) ( not ( = ?auto_9876 ?auto_9887 ) ) ( not ( = ?auto_9876 ?auto_9890 ) ) ( not ( = ?auto_9876 ?auto_9894 ) ) ( not ( = ?auto_9876 ?auto_9905 ) ) ( not ( = ?auto_9876 ?auto_9902 ) ) ( not ( = ?auto_9876 ?auto_9897 ) ) ( not ( = ?auto_9888 ?auto_9886 ) ) ( not ( = ?auto_9888 ?auto_9887 ) ) ( not ( = ?auto_9888 ?auto_9890 ) ) ( not ( = ?auto_9888 ?auto_9894 ) ) ( not ( = ?auto_9888 ?auto_9905 ) ) ( not ( = ?auto_9888 ?auto_9902 ) ) ( not ( = ?auto_9888 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9877 ) ) ( not ( = ?auto_9868 ?auto_9903 ) ) ( not ( = ?auto_9869 ?auto_9877 ) ) ( not ( = ?auto_9869 ?auto_9903 ) ) ( not ( = ?auto_9870 ?auto_9877 ) ) ( not ( = ?auto_9870 ?auto_9903 ) ) ( not ( = ?auto_9871 ?auto_9877 ) ) ( not ( = ?auto_9871 ?auto_9903 ) ) ( not ( = ?auto_9872 ?auto_9877 ) ) ( not ( = ?auto_9872 ?auto_9903 ) ) ( not ( = ?auto_9873 ?auto_9877 ) ) ( not ( = ?auto_9873 ?auto_9903 ) ) ( not ( = ?auto_9874 ?auto_9877 ) ) ( not ( = ?auto_9874 ?auto_9903 ) ) ( not ( = ?auto_9875 ?auto_9877 ) ) ( not ( = ?auto_9875 ?auto_9903 ) ) ( not ( = ?auto_9877 ?auto_9888 ) ) ( not ( = ?auto_9877 ?auto_9886 ) ) ( not ( = ?auto_9877 ?auto_9887 ) ) ( not ( = ?auto_9877 ?auto_9890 ) ) ( not ( = ?auto_9877 ?auto_9894 ) ) ( not ( = ?auto_9877 ?auto_9905 ) ) ( not ( = ?auto_9877 ?auto_9902 ) ) ( not ( = ?auto_9877 ?auto_9897 ) ) ( not ( = ?auto_9885 ?auto_9899 ) ) ( not ( = ?auto_9885 ?auto_9906 ) ) ( not ( = ?auto_9885 ?auto_9893 ) ) ( not ( = ?auto_9885 ?auto_9900 ) ) ( not ( = ?auto_9885 ?auto_9891 ) ) ( not ( = ?auto_9882 ?auto_9889 ) ) ( not ( = ?auto_9882 ?auto_9898 ) ) ( not ( = ?auto_9882 ?auto_9901 ) ) ( not ( = ?auto_9882 ?auto_9892 ) ) ( not ( = ?auto_9882 ?auto_9907 ) ) ( not ( = ?auto_9903 ?auto_9888 ) ) ( not ( = ?auto_9903 ?auto_9886 ) ) ( not ( = ?auto_9903 ?auto_9887 ) ) ( not ( = ?auto_9903 ?auto_9890 ) ) ( not ( = ?auto_9903 ?auto_9894 ) ) ( not ( = ?auto_9903 ?auto_9905 ) ) ( not ( = ?auto_9903 ?auto_9902 ) ) ( not ( = ?auto_9903 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9878 ) ) ( not ( = ?auto_9868 ?auto_9904 ) ) ( not ( = ?auto_9869 ?auto_9878 ) ) ( not ( = ?auto_9869 ?auto_9904 ) ) ( not ( = ?auto_9870 ?auto_9878 ) ) ( not ( = ?auto_9870 ?auto_9904 ) ) ( not ( = ?auto_9871 ?auto_9878 ) ) ( not ( = ?auto_9871 ?auto_9904 ) ) ( not ( = ?auto_9872 ?auto_9878 ) ) ( not ( = ?auto_9872 ?auto_9904 ) ) ( not ( = ?auto_9873 ?auto_9878 ) ) ( not ( = ?auto_9873 ?auto_9904 ) ) ( not ( = ?auto_9874 ?auto_9878 ) ) ( not ( = ?auto_9874 ?auto_9904 ) ) ( not ( = ?auto_9875 ?auto_9878 ) ) ( not ( = ?auto_9875 ?auto_9904 ) ) ( not ( = ?auto_9876 ?auto_9878 ) ) ( not ( = ?auto_9876 ?auto_9904 ) ) ( not ( = ?auto_9878 ?auto_9903 ) ) ( not ( = ?auto_9878 ?auto_9888 ) ) ( not ( = ?auto_9878 ?auto_9886 ) ) ( not ( = ?auto_9878 ?auto_9887 ) ) ( not ( = ?auto_9878 ?auto_9890 ) ) ( not ( = ?auto_9878 ?auto_9894 ) ) ( not ( = ?auto_9878 ?auto_9905 ) ) ( not ( = ?auto_9878 ?auto_9902 ) ) ( not ( = ?auto_9878 ?auto_9897 ) ) ( not ( = ?auto_9895 ?auto_9885 ) ) ( not ( = ?auto_9895 ?auto_9899 ) ) ( not ( = ?auto_9895 ?auto_9906 ) ) ( not ( = ?auto_9895 ?auto_9893 ) ) ( not ( = ?auto_9895 ?auto_9900 ) ) ( not ( = ?auto_9895 ?auto_9891 ) ) ( not ( = ?auto_9896 ?auto_9882 ) ) ( not ( = ?auto_9896 ?auto_9889 ) ) ( not ( = ?auto_9896 ?auto_9898 ) ) ( not ( = ?auto_9896 ?auto_9901 ) ) ( not ( = ?auto_9896 ?auto_9892 ) ) ( not ( = ?auto_9896 ?auto_9907 ) ) ( not ( = ?auto_9904 ?auto_9903 ) ) ( not ( = ?auto_9904 ?auto_9888 ) ) ( not ( = ?auto_9904 ?auto_9886 ) ) ( not ( = ?auto_9904 ?auto_9887 ) ) ( not ( = ?auto_9904 ?auto_9890 ) ) ( not ( = ?auto_9904 ?auto_9894 ) ) ( not ( = ?auto_9904 ?auto_9905 ) ) ( not ( = ?auto_9904 ?auto_9902 ) ) ( not ( = ?auto_9904 ?auto_9897 ) ) ( not ( = ?auto_9868 ?auto_9879 ) ) ( not ( = ?auto_9868 ?auto_9881 ) ) ( not ( = ?auto_9869 ?auto_9879 ) ) ( not ( = ?auto_9869 ?auto_9881 ) ) ( not ( = ?auto_9870 ?auto_9879 ) ) ( not ( = ?auto_9870 ?auto_9881 ) ) ( not ( = ?auto_9871 ?auto_9879 ) ) ( not ( = ?auto_9871 ?auto_9881 ) ) ( not ( = ?auto_9872 ?auto_9879 ) ) ( not ( = ?auto_9872 ?auto_9881 ) ) ( not ( = ?auto_9873 ?auto_9879 ) ) ( not ( = ?auto_9873 ?auto_9881 ) ) ( not ( = ?auto_9874 ?auto_9879 ) ) ( not ( = ?auto_9874 ?auto_9881 ) ) ( not ( = ?auto_9875 ?auto_9879 ) ) ( not ( = ?auto_9875 ?auto_9881 ) ) ( not ( = ?auto_9876 ?auto_9879 ) ) ( not ( = ?auto_9876 ?auto_9881 ) ) ( not ( = ?auto_9877 ?auto_9879 ) ) ( not ( = ?auto_9877 ?auto_9881 ) ) ( not ( = ?auto_9879 ?auto_9904 ) ) ( not ( = ?auto_9879 ?auto_9903 ) ) ( not ( = ?auto_9879 ?auto_9888 ) ) ( not ( = ?auto_9879 ?auto_9886 ) ) ( not ( = ?auto_9879 ?auto_9887 ) ) ( not ( = ?auto_9879 ?auto_9890 ) ) ( not ( = ?auto_9879 ?auto_9894 ) ) ( not ( = ?auto_9879 ?auto_9905 ) ) ( not ( = ?auto_9879 ?auto_9902 ) ) ( not ( = ?auto_9879 ?auto_9897 ) ) ( not ( = ?auto_9881 ?auto_9904 ) ) ( not ( = ?auto_9881 ?auto_9903 ) ) ( not ( = ?auto_9881 ?auto_9888 ) ) ( not ( = ?auto_9881 ?auto_9886 ) ) ( not ( = ?auto_9881 ?auto_9887 ) ) ( not ( = ?auto_9881 ?auto_9890 ) ) ( not ( = ?auto_9881 ?auto_9894 ) ) ( not ( = ?auto_9881 ?auto_9905 ) ) ( not ( = ?auto_9881 ?auto_9902 ) ) ( not ( = ?auto_9881 ?auto_9897 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9868 ?auto_9869 ?auto_9870 ?auto_9871 ?auto_9872 ?auto_9873 ?auto_9874 ?auto_9875 ?auto_9876 ?auto_9877 ?auto_9878 )
      ( MAKE-1CRATE ?auto_9878 ?auto_9879 )
      ( MAKE-11CRATE-VERIFY ?auto_9868 ?auto_9869 ?auto_9870 ?auto_9871 ?auto_9872 ?auto_9873 ?auto_9874 ?auto_9875 ?auto_9876 ?auto_9877 ?auto_9878 ?auto_9879 ) )
  )

)

