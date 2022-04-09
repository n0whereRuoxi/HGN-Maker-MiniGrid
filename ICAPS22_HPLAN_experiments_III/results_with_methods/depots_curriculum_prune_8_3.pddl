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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4466 - SURFACE
      ?auto_4467 - SURFACE
    )
    :vars
    (
      ?auto_4468 - HOIST
      ?auto_4469 - PLACE
      ?auto_4471 - PLACE
      ?auto_4472 - HOIST
      ?auto_4473 - SURFACE
      ?auto_4470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4468 ?auto_4469 ) ( SURFACE-AT ?auto_4466 ?auto_4469 ) ( CLEAR ?auto_4466 ) ( IS-CRATE ?auto_4467 ) ( AVAILABLE ?auto_4468 ) ( not ( = ?auto_4471 ?auto_4469 ) ) ( HOIST-AT ?auto_4472 ?auto_4471 ) ( AVAILABLE ?auto_4472 ) ( SURFACE-AT ?auto_4467 ?auto_4471 ) ( ON ?auto_4467 ?auto_4473 ) ( CLEAR ?auto_4467 ) ( TRUCK-AT ?auto_4470 ?auto_4469 ) ( not ( = ?auto_4466 ?auto_4467 ) ) ( not ( = ?auto_4466 ?auto_4473 ) ) ( not ( = ?auto_4467 ?auto_4473 ) ) ( not ( = ?auto_4468 ?auto_4472 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4470 ?auto_4469 ?auto_4471 )
      ( !LIFT ?auto_4472 ?auto_4467 ?auto_4473 ?auto_4471 )
      ( !LOAD ?auto_4472 ?auto_4467 ?auto_4470 ?auto_4471 )
      ( !DRIVE ?auto_4470 ?auto_4471 ?auto_4469 )
      ( !UNLOAD ?auto_4468 ?auto_4467 ?auto_4470 ?auto_4469 )
      ( !DROP ?auto_4468 ?auto_4467 ?auto_4466 ?auto_4469 )
      ( MAKE-1CRATE-VERIFY ?auto_4466 ?auto_4467 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4487 - SURFACE
      ?auto_4488 - SURFACE
      ?auto_4489 - SURFACE
    )
    :vars
    (
      ?auto_4493 - HOIST
      ?auto_4495 - PLACE
      ?auto_4494 - PLACE
      ?auto_4491 - HOIST
      ?auto_4492 - SURFACE
      ?auto_4496 - PLACE
      ?auto_4497 - HOIST
      ?auto_4498 - SURFACE
      ?auto_4490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4493 ?auto_4495 ) ( IS-CRATE ?auto_4489 ) ( not ( = ?auto_4494 ?auto_4495 ) ) ( HOIST-AT ?auto_4491 ?auto_4494 ) ( AVAILABLE ?auto_4491 ) ( SURFACE-AT ?auto_4489 ?auto_4494 ) ( ON ?auto_4489 ?auto_4492 ) ( CLEAR ?auto_4489 ) ( not ( = ?auto_4488 ?auto_4489 ) ) ( not ( = ?auto_4488 ?auto_4492 ) ) ( not ( = ?auto_4489 ?auto_4492 ) ) ( not ( = ?auto_4493 ?auto_4491 ) ) ( SURFACE-AT ?auto_4487 ?auto_4495 ) ( CLEAR ?auto_4487 ) ( IS-CRATE ?auto_4488 ) ( AVAILABLE ?auto_4493 ) ( not ( = ?auto_4496 ?auto_4495 ) ) ( HOIST-AT ?auto_4497 ?auto_4496 ) ( AVAILABLE ?auto_4497 ) ( SURFACE-AT ?auto_4488 ?auto_4496 ) ( ON ?auto_4488 ?auto_4498 ) ( CLEAR ?auto_4488 ) ( TRUCK-AT ?auto_4490 ?auto_4495 ) ( not ( = ?auto_4487 ?auto_4488 ) ) ( not ( = ?auto_4487 ?auto_4498 ) ) ( not ( = ?auto_4488 ?auto_4498 ) ) ( not ( = ?auto_4493 ?auto_4497 ) ) ( not ( = ?auto_4487 ?auto_4489 ) ) ( not ( = ?auto_4487 ?auto_4492 ) ) ( not ( = ?auto_4489 ?auto_4498 ) ) ( not ( = ?auto_4494 ?auto_4496 ) ) ( not ( = ?auto_4491 ?auto_4497 ) ) ( not ( = ?auto_4492 ?auto_4498 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4487 ?auto_4488 )
      ( MAKE-1CRATE ?auto_4488 ?auto_4489 )
      ( MAKE-2CRATE-VERIFY ?auto_4487 ?auto_4488 ?auto_4489 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4513 - SURFACE
      ?auto_4514 - SURFACE
      ?auto_4515 - SURFACE
      ?auto_4516 - SURFACE
    )
    :vars
    (
      ?auto_4517 - HOIST
      ?auto_4521 - PLACE
      ?auto_4518 - PLACE
      ?auto_4522 - HOIST
      ?auto_4520 - SURFACE
      ?auto_4525 - PLACE
      ?auto_4528 - HOIST
      ?auto_4526 - SURFACE
      ?auto_4527 - PLACE
      ?auto_4523 - HOIST
      ?auto_4524 - SURFACE
      ?auto_4519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4517 ?auto_4521 ) ( IS-CRATE ?auto_4516 ) ( not ( = ?auto_4518 ?auto_4521 ) ) ( HOIST-AT ?auto_4522 ?auto_4518 ) ( AVAILABLE ?auto_4522 ) ( SURFACE-AT ?auto_4516 ?auto_4518 ) ( ON ?auto_4516 ?auto_4520 ) ( CLEAR ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4516 ) ) ( not ( = ?auto_4515 ?auto_4520 ) ) ( not ( = ?auto_4516 ?auto_4520 ) ) ( not ( = ?auto_4517 ?auto_4522 ) ) ( IS-CRATE ?auto_4515 ) ( not ( = ?auto_4525 ?auto_4521 ) ) ( HOIST-AT ?auto_4528 ?auto_4525 ) ( AVAILABLE ?auto_4528 ) ( SURFACE-AT ?auto_4515 ?auto_4525 ) ( ON ?auto_4515 ?auto_4526 ) ( CLEAR ?auto_4515 ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4514 ?auto_4526 ) ) ( not ( = ?auto_4515 ?auto_4526 ) ) ( not ( = ?auto_4517 ?auto_4528 ) ) ( SURFACE-AT ?auto_4513 ?auto_4521 ) ( CLEAR ?auto_4513 ) ( IS-CRATE ?auto_4514 ) ( AVAILABLE ?auto_4517 ) ( not ( = ?auto_4527 ?auto_4521 ) ) ( HOIST-AT ?auto_4523 ?auto_4527 ) ( AVAILABLE ?auto_4523 ) ( SURFACE-AT ?auto_4514 ?auto_4527 ) ( ON ?auto_4514 ?auto_4524 ) ( CLEAR ?auto_4514 ) ( TRUCK-AT ?auto_4519 ?auto_4521 ) ( not ( = ?auto_4513 ?auto_4514 ) ) ( not ( = ?auto_4513 ?auto_4524 ) ) ( not ( = ?auto_4514 ?auto_4524 ) ) ( not ( = ?auto_4517 ?auto_4523 ) ) ( not ( = ?auto_4513 ?auto_4515 ) ) ( not ( = ?auto_4513 ?auto_4526 ) ) ( not ( = ?auto_4515 ?auto_4524 ) ) ( not ( = ?auto_4525 ?auto_4527 ) ) ( not ( = ?auto_4528 ?auto_4523 ) ) ( not ( = ?auto_4526 ?auto_4524 ) ) ( not ( = ?auto_4513 ?auto_4516 ) ) ( not ( = ?auto_4513 ?auto_4520 ) ) ( not ( = ?auto_4514 ?auto_4516 ) ) ( not ( = ?auto_4514 ?auto_4520 ) ) ( not ( = ?auto_4516 ?auto_4526 ) ) ( not ( = ?auto_4516 ?auto_4524 ) ) ( not ( = ?auto_4518 ?auto_4525 ) ) ( not ( = ?auto_4518 ?auto_4527 ) ) ( not ( = ?auto_4522 ?auto_4528 ) ) ( not ( = ?auto_4522 ?auto_4523 ) ) ( not ( = ?auto_4520 ?auto_4526 ) ) ( not ( = ?auto_4520 ?auto_4524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4513 ?auto_4514 ?auto_4515 )
      ( MAKE-1CRATE ?auto_4515 ?auto_4516 )
      ( MAKE-3CRATE-VERIFY ?auto_4513 ?auto_4514 ?auto_4515 ?auto_4516 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4544 - SURFACE
      ?auto_4545 - SURFACE
      ?auto_4546 - SURFACE
      ?auto_4547 - SURFACE
      ?auto_4548 - SURFACE
    )
    :vars
    (
      ?auto_4551 - HOIST
      ?auto_4550 - PLACE
      ?auto_4553 - PLACE
      ?auto_4552 - HOIST
      ?auto_4554 - SURFACE
      ?auto_4555 - PLACE
      ?auto_4557 - HOIST
      ?auto_4563 - SURFACE
      ?auto_4558 - PLACE
      ?auto_4556 - HOIST
      ?auto_4560 - SURFACE
      ?auto_4559 - PLACE
      ?auto_4561 - HOIST
      ?auto_4562 - SURFACE
      ?auto_4549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4551 ?auto_4550 ) ( IS-CRATE ?auto_4548 ) ( not ( = ?auto_4553 ?auto_4550 ) ) ( HOIST-AT ?auto_4552 ?auto_4553 ) ( AVAILABLE ?auto_4552 ) ( SURFACE-AT ?auto_4548 ?auto_4553 ) ( ON ?auto_4548 ?auto_4554 ) ( CLEAR ?auto_4548 ) ( not ( = ?auto_4547 ?auto_4548 ) ) ( not ( = ?auto_4547 ?auto_4554 ) ) ( not ( = ?auto_4548 ?auto_4554 ) ) ( not ( = ?auto_4551 ?auto_4552 ) ) ( IS-CRATE ?auto_4547 ) ( not ( = ?auto_4555 ?auto_4550 ) ) ( HOIST-AT ?auto_4557 ?auto_4555 ) ( AVAILABLE ?auto_4557 ) ( SURFACE-AT ?auto_4547 ?auto_4555 ) ( ON ?auto_4547 ?auto_4563 ) ( CLEAR ?auto_4547 ) ( not ( = ?auto_4546 ?auto_4547 ) ) ( not ( = ?auto_4546 ?auto_4563 ) ) ( not ( = ?auto_4547 ?auto_4563 ) ) ( not ( = ?auto_4551 ?auto_4557 ) ) ( IS-CRATE ?auto_4546 ) ( not ( = ?auto_4558 ?auto_4550 ) ) ( HOIST-AT ?auto_4556 ?auto_4558 ) ( AVAILABLE ?auto_4556 ) ( SURFACE-AT ?auto_4546 ?auto_4558 ) ( ON ?auto_4546 ?auto_4560 ) ( CLEAR ?auto_4546 ) ( not ( = ?auto_4545 ?auto_4546 ) ) ( not ( = ?auto_4545 ?auto_4560 ) ) ( not ( = ?auto_4546 ?auto_4560 ) ) ( not ( = ?auto_4551 ?auto_4556 ) ) ( SURFACE-AT ?auto_4544 ?auto_4550 ) ( CLEAR ?auto_4544 ) ( IS-CRATE ?auto_4545 ) ( AVAILABLE ?auto_4551 ) ( not ( = ?auto_4559 ?auto_4550 ) ) ( HOIST-AT ?auto_4561 ?auto_4559 ) ( AVAILABLE ?auto_4561 ) ( SURFACE-AT ?auto_4545 ?auto_4559 ) ( ON ?auto_4545 ?auto_4562 ) ( CLEAR ?auto_4545 ) ( TRUCK-AT ?auto_4549 ?auto_4550 ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4562 ) ) ( not ( = ?auto_4545 ?auto_4562 ) ) ( not ( = ?auto_4551 ?auto_4561 ) ) ( not ( = ?auto_4544 ?auto_4546 ) ) ( not ( = ?auto_4544 ?auto_4560 ) ) ( not ( = ?auto_4546 ?auto_4562 ) ) ( not ( = ?auto_4558 ?auto_4559 ) ) ( not ( = ?auto_4556 ?auto_4561 ) ) ( not ( = ?auto_4560 ?auto_4562 ) ) ( not ( = ?auto_4544 ?auto_4547 ) ) ( not ( = ?auto_4544 ?auto_4563 ) ) ( not ( = ?auto_4545 ?auto_4547 ) ) ( not ( = ?auto_4545 ?auto_4563 ) ) ( not ( = ?auto_4547 ?auto_4560 ) ) ( not ( = ?auto_4547 ?auto_4562 ) ) ( not ( = ?auto_4555 ?auto_4558 ) ) ( not ( = ?auto_4555 ?auto_4559 ) ) ( not ( = ?auto_4557 ?auto_4556 ) ) ( not ( = ?auto_4557 ?auto_4561 ) ) ( not ( = ?auto_4563 ?auto_4560 ) ) ( not ( = ?auto_4563 ?auto_4562 ) ) ( not ( = ?auto_4544 ?auto_4548 ) ) ( not ( = ?auto_4544 ?auto_4554 ) ) ( not ( = ?auto_4545 ?auto_4548 ) ) ( not ( = ?auto_4545 ?auto_4554 ) ) ( not ( = ?auto_4546 ?auto_4548 ) ) ( not ( = ?auto_4546 ?auto_4554 ) ) ( not ( = ?auto_4548 ?auto_4563 ) ) ( not ( = ?auto_4548 ?auto_4560 ) ) ( not ( = ?auto_4548 ?auto_4562 ) ) ( not ( = ?auto_4553 ?auto_4555 ) ) ( not ( = ?auto_4553 ?auto_4558 ) ) ( not ( = ?auto_4553 ?auto_4559 ) ) ( not ( = ?auto_4552 ?auto_4557 ) ) ( not ( = ?auto_4552 ?auto_4556 ) ) ( not ( = ?auto_4552 ?auto_4561 ) ) ( not ( = ?auto_4554 ?auto_4563 ) ) ( not ( = ?auto_4554 ?auto_4560 ) ) ( not ( = ?auto_4554 ?auto_4562 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4544 ?auto_4545 ?auto_4546 ?auto_4547 )
      ( MAKE-1CRATE ?auto_4547 ?auto_4548 )
      ( MAKE-4CRATE-VERIFY ?auto_4544 ?auto_4545 ?auto_4546 ?auto_4547 ?auto_4548 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4580 - SURFACE
      ?auto_4581 - SURFACE
      ?auto_4582 - SURFACE
      ?auto_4583 - SURFACE
      ?auto_4584 - SURFACE
      ?auto_4585 - SURFACE
    )
    :vars
    (
      ?auto_4588 - HOIST
      ?auto_4590 - PLACE
      ?auto_4589 - PLACE
      ?auto_4586 - HOIST
      ?auto_4587 - SURFACE
      ?auto_4597 - PLACE
      ?auto_4603 - HOIST
      ?auto_4598 - SURFACE
      ?auto_4599 - PLACE
      ?auto_4600 - HOIST
      ?auto_4594 - SURFACE
      ?auto_4596 - PLACE
      ?auto_4595 - HOIST
      ?auto_4601 - SURFACE
      ?auto_4602 - PLACE
      ?auto_4592 - HOIST
      ?auto_4593 - SURFACE
      ?auto_4591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4588 ?auto_4590 ) ( IS-CRATE ?auto_4585 ) ( not ( = ?auto_4589 ?auto_4590 ) ) ( HOIST-AT ?auto_4586 ?auto_4589 ) ( AVAILABLE ?auto_4586 ) ( SURFACE-AT ?auto_4585 ?auto_4589 ) ( ON ?auto_4585 ?auto_4587 ) ( CLEAR ?auto_4585 ) ( not ( = ?auto_4584 ?auto_4585 ) ) ( not ( = ?auto_4584 ?auto_4587 ) ) ( not ( = ?auto_4585 ?auto_4587 ) ) ( not ( = ?auto_4588 ?auto_4586 ) ) ( IS-CRATE ?auto_4584 ) ( not ( = ?auto_4597 ?auto_4590 ) ) ( HOIST-AT ?auto_4603 ?auto_4597 ) ( AVAILABLE ?auto_4603 ) ( SURFACE-AT ?auto_4584 ?auto_4597 ) ( ON ?auto_4584 ?auto_4598 ) ( CLEAR ?auto_4584 ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( not ( = ?auto_4583 ?auto_4598 ) ) ( not ( = ?auto_4584 ?auto_4598 ) ) ( not ( = ?auto_4588 ?auto_4603 ) ) ( IS-CRATE ?auto_4583 ) ( not ( = ?auto_4599 ?auto_4590 ) ) ( HOIST-AT ?auto_4600 ?auto_4599 ) ( AVAILABLE ?auto_4600 ) ( SURFACE-AT ?auto_4583 ?auto_4599 ) ( ON ?auto_4583 ?auto_4594 ) ( CLEAR ?auto_4583 ) ( not ( = ?auto_4582 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4594 ) ) ( not ( = ?auto_4583 ?auto_4594 ) ) ( not ( = ?auto_4588 ?auto_4600 ) ) ( IS-CRATE ?auto_4582 ) ( not ( = ?auto_4596 ?auto_4590 ) ) ( HOIST-AT ?auto_4595 ?auto_4596 ) ( AVAILABLE ?auto_4595 ) ( SURFACE-AT ?auto_4582 ?auto_4596 ) ( ON ?auto_4582 ?auto_4601 ) ( CLEAR ?auto_4582 ) ( not ( = ?auto_4581 ?auto_4582 ) ) ( not ( = ?auto_4581 ?auto_4601 ) ) ( not ( = ?auto_4582 ?auto_4601 ) ) ( not ( = ?auto_4588 ?auto_4595 ) ) ( SURFACE-AT ?auto_4580 ?auto_4590 ) ( CLEAR ?auto_4580 ) ( IS-CRATE ?auto_4581 ) ( AVAILABLE ?auto_4588 ) ( not ( = ?auto_4602 ?auto_4590 ) ) ( HOIST-AT ?auto_4592 ?auto_4602 ) ( AVAILABLE ?auto_4592 ) ( SURFACE-AT ?auto_4581 ?auto_4602 ) ( ON ?auto_4581 ?auto_4593 ) ( CLEAR ?auto_4581 ) ( TRUCK-AT ?auto_4591 ?auto_4590 ) ( not ( = ?auto_4580 ?auto_4581 ) ) ( not ( = ?auto_4580 ?auto_4593 ) ) ( not ( = ?auto_4581 ?auto_4593 ) ) ( not ( = ?auto_4588 ?auto_4592 ) ) ( not ( = ?auto_4580 ?auto_4582 ) ) ( not ( = ?auto_4580 ?auto_4601 ) ) ( not ( = ?auto_4582 ?auto_4593 ) ) ( not ( = ?auto_4596 ?auto_4602 ) ) ( not ( = ?auto_4595 ?auto_4592 ) ) ( not ( = ?auto_4601 ?auto_4593 ) ) ( not ( = ?auto_4580 ?auto_4583 ) ) ( not ( = ?auto_4580 ?auto_4594 ) ) ( not ( = ?auto_4581 ?auto_4583 ) ) ( not ( = ?auto_4581 ?auto_4594 ) ) ( not ( = ?auto_4583 ?auto_4601 ) ) ( not ( = ?auto_4583 ?auto_4593 ) ) ( not ( = ?auto_4599 ?auto_4596 ) ) ( not ( = ?auto_4599 ?auto_4602 ) ) ( not ( = ?auto_4600 ?auto_4595 ) ) ( not ( = ?auto_4600 ?auto_4592 ) ) ( not ( = ?auto_4594 ?auto_4601 ) ) ( not ( = ?auto_4594 ?auto_4593 ) ) ( not ( = ?auto_4580 ?auto_4584 ) ) ( not ( = ?auto_4580 ?auto_4598 ) ) ( not ( = ?auto_4581 ?auto_4584 ) ) ( not ( = ?auto_4581 ?auto_4598 ) ) ( not ( = ?auto_4582 ?auto_4584 ) ) ( not ( = ?auto_4582 ?auto_4598 ) ) ( not ( = ?auto_4584 ?auto_4594 ) ) ( not ( = ?auto_4584 ?auto_4601 ) ) ( not ( = ?auto_4584 ?auto_4593 ) ) ( not ( = ?auto_4597 ?auto_4599 ) ) ( not ( = ?auto_4597 ?auto_4596 ) ) ( not ( = ?auto_4597 ?auto_4602 ) ) ( not ( = ?auto_4603 ?auto_4600 ) ) ( not ( = ?auto_4603 ?auto_4595 ) ) ( not ( = ?auto_4603 ?auto_4592 ) ) ( not ( = ?auto_4598 ?auto_4594 ) ) ( not ( = ?auto_4598 ?auto_4601 ) ) ( not ( = ?auto_4598 ?auto_4593 ) ) ( not ( = ?auto_4580 ?auto_4585 ) ) ( not ( = ?auto_4580 ?auto_4587 ) ) ( not ( = ?auto_4581 ?auto_4585 ) ) ( not ( = ?auto_4581 ?auto_4587 ) ) ( not ( = ?auto_4582 ?auto_4585 ) ) ( not ( = ?auto_4582 ?auto_4587 ) ) ( not ( = ?auto_4583 ?auto_4585 ) ) ( not ( = ?auto_4583 ?auto_4587 ) ) ( not ( = ?auto_4585 ?auto_4598 ) ) ( not ( = ?auto_4585 ?auto_4594 ) ) ( not ( = ?auto_4585 ?auto_4601 ) ) ( not ( = ?auto_4585 ?auto_4593 ) ) ( not ( = ?auto_4589 ?auto_4597 ) ) ( not ( = ?auto_4589 ?auto_4599 ) ) ( not ( = ?auto_4589 ?auto_4596 ) ) ( not ( = ?auto_4589 ?auto_4602 ) ) ( not ( = ?auto_4586 ?auto_4603 ) ) ( not ( = ?auto_4586 ?auto_4600 ) ) ( not ( = ?auto_4586 ?auto_4595 ) ) ( not ( = ?auto_4586 ?auto_4592 ) ) ( not ( = ?auto_4587 ?auto_4598 ) ) ( not ( = ?auto_4587 ?auto_4594 ) ) ( not ( = ?auto_4587 ?auto_4601 ) ) ( not ( = ?auto_4587 ?auto_4593 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4580 ?auto_4581 ?auto_4582 ?auto_4583 ?auto_4584 )
      ( MAKE-1CRATE ?auto_4584 ?auto_4585 )
      ( MAKE-5CRATE-VERIFY ?auto_4580 ?auto_4581 ?auto_4582 ?auto_4583 ?auto_4584 ?auto_4585 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4621 - SURFACE
      ?auto_4622 - SURFACE
      ?auto_4623 - SURFACE
      ?auto_4624 - SURFACE
      ?auto_4625 - SURFACE
      ?auto_4626 - SURFACE
      ?auto_4627 - SURFACE
    )
    :vars
    (
      ?auto_4632 - HOIST
      ?auto_4628 - PLACE
      ?auto_4630 - PLACE
      ?auto_4631 - HOIST
      ?auto_4629 - SURFACE
      ?auto_4635 - PLACE
      ?auto_4647 - HOIST
      ?auto_4634 - SURFACE
      ?auto_4642 - PLACE
      ?auto_4637 - HOIST
      ?auto_4644 - SURFACE
      ?auto_4643 - PLACE
      ?auto_4636 - HOIST
      ?auto_4638 - SURFACE
      ?auto_4641 - PLACE
      ?auto_4640 - HOIST
      ?auto_4645 - SURFACE
      ?auto_4648 - PLACE
      ?auto_4646 - HOIST
      ?auto_4639 - SURFACE
      ?auto_4633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4632 ?auto_4628 ) ( IS-CRATE ?auto_4627 ) ( not ( = ?auto_4630 ?auto_4628 ) ) ( HOIST-AT ?auto_4631 ?auto_4630 ) ( AVAILABLE ?auto_4631 ) ( SURFACE-AT ?auto_4627 ?auto_4630 ) ( ON ?auto_4627 ?auto_4629 ) ( CLEAR ?auto_4627 ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( not ( = ?auto_4626 ?auto_4629 ) ) ( not ( = ?auto_4627 ?auto_4629 ) ) ( not ( = ?auto_4632 ?auto_4631 ) ) ( IS-CRATE ?auto_4626 ) ( not ( = ?auto_4635 ?auto_4628 ) ) ( HOIST-AT ?auto_4647 ?auto_4635 ) ( AVAILABLE ?auto_4647 ) ( SURFACE-AT ?auto_4626 ?auto_4635 ) ( ON ?auto_4626 ?auto_4634 ) ( CLEAR ?auto_4626 ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4634 ) ) ( not ( = ?auto_4626 ?auto_4634 ) ) ( not ( = ?auto_4632 ?auto_4647 ) ) ( IS-CRATE ?auto_4625 ) ( not ( = ?auto_4642 ?auto_4628 ) ) ( HOIST-AT ?auto_4637 ?auto_4642 ) ( AVAILABLE ?auto_4637 ) ( SURFACE-AT ?auto_4625 ?auto_4642 ) ( ON ?auto_4625 ?auto_4644 ) ( CLEAR ?auto_4625 ) ( not ( = ?auto_4624 ?auto_4625 ) ) ( not ( = ?auto_4624 ?auto_4644 ) ) ( not ( = ?auto_4625 ?auto_4644 ) ) ( not ( = ?auto_4632 ?auto_4637 ) ) ( IS-CRATE ?auto_4624 ) ( not ( = ?auto_4643 ?auto_4628 ) ) ( HOIST-AT ?auto_4636 ?auto_4643 ) ( AVAILABLE ?auto_4636 ) ( SURFACE-AT ?auto_4624 ?auto_4643 ) ( ON ?auto_4624 ?auto_4638 ) ( CLEAR ?auto_4624 ) ( not ( = ?auto_4623 ?auto_4624 ) ) ( not ( = ?auto_4623 ?auto_4638 ) ) ( not ( = ?auto_4624 ?auto_4638 ) ) ( not ( = ?auto_4632 ?auto_4636 ) ) ( IS-CRATE ?auto_4623 ) ( not ( = ?auto_4641 ?auto_4628 ) ) ( HOIST-AT ?auto_4640 ?auto_4641 ) ( AVAILABLE ?auto_4640 ) ( SURFACE-AT ?auto_4623 ?auto_4641 ) ( ON ?auto_4623 ?auto_4645 ) ( CLEAR ?auto_4623 ) ( not ( = ?auto_4622 ?auto_4623 ) ) ( not ( = ?auto_4622 ?auto_4645 ) ) ( not ( = ?auto_4623 ?auto_4645 ) ) ( not ( = ?auto_4632 ?auto_4640 ) ) ( SURFACE-AT ?auto_4621 ?auto_4628 ) ( CLEAR ?auto_4621 ) ( IS-CRATE ?auto_4622 ) ( AVAILABLE ?auto_4632 ) ( not ( = ?auto_4648 ?auto_4628 ) ) ( HOIST-AT ?auto_4646 ?auto_4648 ) ( AVAILABLE ?auto_4646 ) ( SURFACE-AT ?auto_4622 ?auto_4648 ) ( ON ?auto_4622 ?auto_4639 ) ( CLEAR ?auto_4622 ) ( TRUCK-AT ?auto_4633 ?auto_4628 ) ( not ( = ?auto_4621 ?auto_4622 ) ) ( not ( = ?auto_4621 ?auto_4639 ) ) ( not ( = ?auto_4622 ?auto_4639 ) ) ( not ( = ?auto_4632 ?auto_4646 ) ) ( not ( = ?auto_4621 ?auto_4623 ) ) ( not ( = ?auto_4621 ?auto_4645 ) ) ( not ( = ?auto_4623 ?auto_4639 ) ) ( not ( = ?auto_4641 ?auto_4648 ) ) ( not ( = ?auto_4640 ?auto_4646 ) ) ( not ( = ?auto_4645 ?auto_4639 ) ) ( not ( = ?auto_4621 ?auto_4624 ) ) ( not ( = ?auto_4621 ?auto_4638 ) ) ( not ( = ?auto_4622 ?auto_4624 ) ) ( not ( = ?auto_4622 ?auto_4638 ) ) ( not ( = ?auto_4624 ?auto_4645 ) ) ( not ( = ?auto_4624 ?auto_4639 ) ) ( not ( = ?auto_4643 ?auto_4641 ) ) ( not ( = ?auto_4643 ?auto_4648 ) ) ( not ( = ?auto_4636 ?auto_4640 ) ) ( not ( = ?auto_4636 ?auto_4646 ) ) ( not ( = ?auto_4638 ?auto_4645 ) ) ( not ( = ?auto_4638 ?auto_4639 ) ) ( not ( = ?auto_4621 ?auto_4625 ) ) ( not ( = ?auto_4621 ?auto_4644 ) ) ( not ( = ?auto_4622 ?auto_4625 ) ) ( not ( = ?auto_4622 ?auto_4644 ) ) ( not ( = ?auto_4623 ?auto_4625 ) ) ( not ( = ?auto_4623 ?auto_4644 ) ) ( not ( = ?auto_4625 ?auto_4638 ) ) ( not ( = ?auto_4625 ?auto_4645 ) ) ( not ( = ?auto_4625 ?auto_4639 ) ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4641 ) ) ( not ( = ?auto_4642 ?auto_4648 ) ) ( not ( = ?auto_4637 ?auto_4636 ) ) ( not ( = ?auto_4637 ?auto_4640 ) ) ( not ( = ?auto_4637 ?auto_4646 ) ) ( not ( = ?auto_4644 ?auto_4638 ) ) ( not ( = ?auto_4644 ?auto_4645 ) ) ( not ( = ?auto_4644 ?auto_4639 ) ) ( not ( = ?auto_4621 ?auto_4626 ) ) ( not ( = ?auto_4621 ?auto_4634 ) ) ( not ( = ?auto_4622 ?auto_4626 ) ) ( not ( = ?auto_4622 ?auto_4634 ) ) ( not ( = ?auto_4623 ?auto_4626 ) ) ( not ( = ?auto_4623 ?auto_4634 ) ) ( not ( = ?auto_4624 ?auto_4626 ) ) ( not ( = ?auto_4624 ?auto_4634 ) ) ( not ( = ?auto_4626 ?auto_4644 ) ) ( not ( = ?auto_4626 ?auto_4638 ) ) ( not ( = ?auto_4626 ?auto_4645 ) ) ( not ( = ?auto_4626 ?auto_4639 ) ) ( not ( = ?auto_4635 ?auto_4642 ) ) ( not ( = ?auto_4635 ?auto_4643 ) ) ( not ( = ?auto_4635 ?auto_4641 ) ) ( not ( = ?auto_4635 ?auto_4648 ) ) ( not ( = ?auto_4647 ?auto_4637 ) ) ( not ( = ?auto_4647 ?auto_4636 ) ) ( not ( = ?auto_4647 ?auto_4640 ) ) ( not ( = ?auto_4647 ?auto_4646 ) ) ( not ( = ?auto_4634 ?auto_4644 ) ) ( not ( = ?auto_4634 ?auto_4638 ) ) ( not ( = ?auto_4634 ?auto_4645 ) ) ( not ( = ?auto_4634 ?auto_4639 ) ) ( not ( = ?auto_4621 ?auto_4627 ) ) ( not ( = ?auto_4621 ?auto_4629 ) ) ( not ( = ?auto_4622 ?auto_4627 ) ) ( not ( = ?auto_4622 ?auto_4629 ) ) ( not ( = ?auto_4623 ?auto_4627 ) ) ( not ( = ?auto_4623 ?auto_4629 ) ) ( not ( = ?auto_4624 ?auto_4627 ) ) ( not ( = ?auto_4624 ?auto_4629 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4629 ) ) ( not ( = ?auto_4627 ?auto_4634 ) ) ( not ( = ?auto_4627 ?auto_4644 ) ) ( not ( = ?auto_4627 ?auto_4638 ) ) ( not ( = ?auto_4627 ?auto_4645 ) ) ( not ( = ?auto_4627 ?auto_4639 ) ) ( not ( = ?auto_4630 ?auto_4635 ) ) ( not ( = ?auto_4630 ?auto_4642 ) ) ( not ( = ?auto_4630 ?auto_4643 ) ) ( not ( = ?auto_4630 ?auto_4641 ) ) ( not ( = ?auto_4630 ?auto_4648 ) ) ( not ( = ?auto_4631 ?auto_4647 ) ) ( not ( = ?auto_4631 ?auto_4637 ) ) ( not ( = ?auto_4631 ?auto_4636 ) ) ( not ( = ?auto_4631 ?auto_4640 ) ) ( not ( = ?auto_4631 ?auto_4646 ) ) ( not ( = ?auto_4629 ?auto_4634 ) ) ( not ( = ?auto_4629 ?auto_4644 ) ) ( not ( = ?auto_4629 ?auto_4638 ) ) ( not ( = ?auto_4629 ?auto_4645 ) ) ( not ( = ?auto_4629 ?auto_4639 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4621 ?auto_4622 ?auto_4623 ?auto_4624 ?auto_4625 ?auto_4626 )
      ( MAKE-1CRATE ?auto_4626 ?auto_4627 )
      ( MAKE-6CRATE-VERIFY ?auto_4621 ?auto_4622 ?auto_4623 ?auto_4624 ?auto_4625 ?auto_4626 ?auto_4627 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4667 - SURFACE
      ?auto_4668 - SURFACE
      ?auto_4669 - SURFACE
      ?auto_4670 - SURFACE
      ?auto_4671 - SURFACE
      ?auto_4672 - SURFACE
      ?auto_4673 - SURFACE
      ?auto_4674 - SURFACE
    )
    :vars
    (
      ?auto_4678 - HOIST
      ?auto_4680 - PLACE
      ?auto_4679 - PLACE
      ?auto_4677 - HOIST
      ?auto_4676 - SURFACE
      ?auto_4687 - PLACE
      ?auto_4689 - HOIST
      ?auto_4690 - SURFACE
      ?auto_4685 - PLACE
      ?auto_4682 - HOIST
      ?auto_4684 - SURFACE
      ?auto_4683 - SURFACE
      ?auto_4681 - PLACE
      ?auto_4693 - HOIST
      ?auto_4686 - SURFACE
      ?auto_4691 - PLACE
      ?auto_4695 - HOIST
      ?auto_4696 - SURFACE
      ?auto_4694 - PLACE
      ?auto_4688 - HOIST
      ?auto_4692 - SURFACE
      ?auto_4675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4678 ?auto_4680 ) ( IS-CRATE ?auto_4674 ) ( not ( = ?auto_4679 ?auto_4680 ) ) ( HOIST-AT ?auto_4677 ?auto_4679 ) ( SURFACE-AT ?auto_4674 ?auto_4679 ) ( ON ?auto_4674 ?auto_4676 ) ( CLEAR ?auto_4674 ) ( not ( = ?auto_4673 ?auto_4674 ) ) ( not ( = ?auto_4673 ?auto_4676 ) ) ( not ( = ?auto_4674 ?auto_4676 ) ) ( not ( = ?auto_4678 ?auto_4677 ) ) ( IS-CRATE ?auto_4673 ) ( not ( = ?auto_4687 ?auto_4680 ) ) ( HOIST-AT ?auto_4689 ?auto_4687 ) ( AVAILABLE ?auto_4689 ) ( SURFACE-AT ?auto_4673 ?auto_4687 ) ( ON ?auto_4673 ?auto_4690 ) ( CLEAR ?auto_4673 ) ( not ( = ?auto_4672 ?auto_4673 ) ) ( not ( = ?auto_4672 ?auto_4690 ) ) ( not ( = ?auto_4673 ?auto_4690 ) ) ( not ( = ?auto_4678 ?auto_4689 ) ) ( IS-CRATE ?auto_4672 ) ( not ( = ?auto_4685 ?auto_4680 ) ) ( HOIST-AT ?auto_4682 ?auto_4685 ) ( AVAILABLE ?auto_4682 ) ( SURFACE-AT ?auto_4672 ?auto_4685 ) ( ON ?auto_4672 ?auto_4684 ) ( CLEAR ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4684 ) ) ( not ( = ?auto_4672 ?auto_4684 ) ) ( not ( = ?auto_4678 ?auto_4682 ) ) ( IS-CRATE ?auto_4671 ) ( AVAILABLE ?auto_4677 ) ( SURFACE-AT ?auto_4671 ?auto_4679 ) ( ON ?auto_4671 ?auto_4683 ) ( CLEAR ?auto_4671 ) ( not ( = ?auto_4670 ?auto_4671 ) ) ( not ( = ?auto_4670 ?auto_4683 ) ) ( not ( = ?auto_4671 ?auto_4683 ) ) ( IS-CRATE ?auto_4670 ) ( not ( = ?auto_4681 ?auto_4680 ) ) ( HOIST-AT ?auto_4693 ?auto_4681 ) ( AVAILABLE ?auto_4693 ) ( SURFACE-AT ?auto_4670 ?auto_4681 ) ( ON ?auto_4670 ?auto_4686 ) ( CLEAR ?auto_4670 ) ( not ( = ?auto_4669 ?auto_4670 ) ) ( not ( = ?auto_4669 ?auto_4686 ) ) ( not ( = ?auto_4670 ?auto_4686 ) ) ( not ( = ?auto_4678 ?auto_4693 ) ) ( IS-CRATE ?auto_4669 ) ( not ( = ?auto_4691 ?auto_4680 ) ) ( HOIST-AT ?auto_4695 ?auto_4691 ) ( AVAILABLE ?auto_4695 ) ( SURFACE-AT ?auto_4669 ?auto_4691 ) ( ON ?auto_4669 ?auto_4696 ) ( CLEAR ?auto_4669 ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( not ( = ?auto_4668 ?auto_4696 ) ) ( not ( = ?auto_4669 ?auto_4696 ) ) ( not ( = ?auto_4678 ?auto_4695 ) ) ( SURFACE-AT ?auto_4667 ?auto_4680 ) ( CLEAR ?auto_4667 ) ( IS-CRATE ?auto_4668 ) ( AVAILABLE ?auto_4678 ) ( not ( = ?auto_4694 ?auto_4680 ) ) ( HOIST-AT ?auto_4688 ?auto_4694 ) ( AVAILABLE ?auto_4688 ) ( SURFACE-AT ?auto_4668 ?auto_4694 ) ( ON ?auto_4668 ?auto_4692 ) ( CLEAR ?auto_4668 ) ( TRUCK-AT ?auto_4675 ?auto_4680 ) ( not ( = ?auto_4667 ?auto_4668 ) ) ( not ( = ?auto_4667 ?auto_4692 ) ) ( not ( = ?auto_4668 ?auto_4692 ) ) ( not ( = ?auto_4678 ?auto_4688 ) ) ( not ( = ?auto_4667 ?auto_4669 ) ) ( not ( = ?auto_4667 ?auto_4696 ) ) ( not ( = ?auto_4669 ?auto_4692 ) ) ( not ( = ?auto_4691 ?auto_4694 ) ) ( not ( = ?auto_4695 ?auto_4688 ) ) ( not ( = ?auto_4696 ?auto_4692 ) ) ( not ( = ?auto_4667 ?auto_4670 ) ) ( not ( = ?auto_4667 ?auto_4686 ) ) ( not ( = ?auto_4668 ?auto_4670 ) ) ( not ( = ?auto_4668 ?auto_4686 ) ) ( not ( = ?auto_4670 ?auto_4696 ) ) ( not ( = ?auto_4670 ?auto_4692 ) ) ( not ( = ?auto_4681 ?auto_4691 ) ) ( not ( = ?auto_4681 ?auto_4694 ) ) ( not ( = ?auto_4693 ?auto_4695 ) ) ( not ( = ?auto_4693 ?auto_4688 ) ) ( not ( = ?auto_4686 ?auto_4696 ) ) ( not ( = ?auto_4686 ?auto_4692 ) ) ( not ( = ?auto_4667 ?auto_4671 ) ) ( not ( = ?auto_4667 ?auto_4683 ) ) ( not ( = ?auto_4668 ?auto_4671 ) ) ( not ( = ?auto_4668 ?auto_4683 ) ) ( not ( = ?auto_4669 ?auto_4671 ) ) ( not ( = ?auto_4669 ?auto_4683 ) ) ( not ( = ?auto_4671 ?auto_4686 ) ) ( not ( = ?auto_4671 ?auto_4696 ) ) ( not ( = ?auto_4671 ?auto_4692 ) ) ( not ( = ?auto_4679 ?auto_4681 ) ) ( not ( = ?auto_4679 ?auto_4691 ) ) ( not ( = ?auto_4679 ?auto_4694 ) ) ( not ( = ?auto_4677 ?auto_4693 ) ) ( not ( = ?auto_4677 ?auto_4695 ) ) ( not ( = ?auto_4677 ?auto_4688 ) ) ( not ( = ?auto_4683 ?auto_4686 ) ) ( not ( = ?auto_4683 ?auto_4696 ) ) ( not ( = ?auto_4683 ?auto_4692 ) ) ( not ( = ?auto_4667 ?auto_4672 ) ) ( not ( = ?auto_4667 ?auto_4684 ) ) ( not ( = ?auto_4668 ?auto_4672 ) ) ( not ( = ?auto_4668 ?auto_4684 ) ) ( not ( = ?auto_4669 ?auto_4672 ) ) ( not ( = ?auto_4669 ?auto_4684 ) ) ( not ( = ?auto_4670 ?auto_4672 ) ) ( not ( = ?auto_4670 ?auto_4684 ) ) ( not ( = ?auto_4672 ?auto_4683 ) ) ( not ( = ?auto_4672 ?auto_4686 ) ) ( not ( = ?auto_4672 ?auto_4696 ) ) ( not ( = ?auto_4672 ?auto_4692 ) ) ( not ( = ?auto_4685 ?auto_4679 ) ) ( not ( = ?auto_4685 ?auto_4681 ) ) ( not ( = ?auto_4685 ?auto_4691 ) ) ( not ( = ?auto_4685 ?auto_4694 ) ) ( not ( = ?auto_4682 ?auto_4677 ) ) ( not ( = ?auto_4682 ?auto_4693 ) ) ( not ( = ?auto_4682 ?auto_4695 ) ) ( not ( = ?auto_4682 ?auto_4688 ) ) ( not ( = ?auto_4684 ?auto_4683 ) ) ( not ( = ?auto_4684 ?auto_4686 ) ) ( not ( = ?auto_4684 ?auto_4696 ) ) ( not ( = ?auto_4684 ?auto_4692 ) ) ( not ( = ?auto_4667 ?auto_4673 ) ) ( not ( = ?auto_4667 ?auto_4690 ) ) ( not ( = ?auto_4668 ?auto_4673 ) ) ( not ( = ?auto_4668 ?auto_4690 ) ) ( not ( = ?auto_4669 ?auto_4673 ) ) ( not ( = ?auto_4669 ?auto_4690 ) ) ( not ( = ?auto_4670 ?auto_4673 ) ) ( not ( = ?auto_4670 ?auto_4690 ) ) ( not ( = ?auto_4671 ?auto_4673 ) ) ( not ( = ?auto_4671 ?auto_4690 ) ) ( not ( = ?auto_4673 ?auto_4684 ) ) ( not ( = ?auto_4673 ?auto_4683 ) ) ( not ( = ?auto_4673 ?auto_4686 ) ) ( not ( = ?auto_4673 ?auto_4696 ) ) ( not ( = ?auto_4673 ?auto_4692 ) ) ( not ( = ?auto_4687 ?auto_4685 ) ) ( not ( = ?auto_4687 ?auto_4679 ) ) ( not ( = ?auto_4687 ?auto_4681 ) ) ( not ( = ?auto_4687 ?auto_4691 ) ) ( not ( = ?auto_4687 ?auto_4694 ) ) ( not ( = ?auto_4689 ?auto_4682 ) ) ( not ( = ?auto_4689 ?auto_4677 ) ) ( not ( = ?auto_4689 ?auto_4693 ) ) ( not ( = ?auto_4689 ?auto_4695 ) ) ( not ( = ?auto_4689 ?auto_4688 ) ) ( not ( = ?auto_4690 ?auto_4684 ) ) ( not ( = ?auto_4690 ?auto_4683 ) ) ( not ( = ?auto_4690 ?auto_4686 ) ) ( not ( = ?auto_4690 ?auto_4696 ) ) ( not ( = ?auto_4690 ?auto_4692 ) ) ( not ( = ?auto_4667 ?auto_4674 ) ) ( not ( = ?auto_4667 ?auto_4676 ) ) ( not ( = ?auto_4668 ?auto_4674 ) ) ( not ( = ?auto_4668 ?auto_4676 ) ) ( not ( = ?auto_4669 ?auto_4674 ) ) ( not ( = ?auto_4669 ?auto_4676 ) ) ( not ( = ?auto_4670 ?auto_4674 ) ) ( not ( = ?auto_4670 ?auto_4676 ) ) ( not ( = ?auto_4671 ?auto_4674 ) ) ( not ( = ?auto_4671 ?auto_4676 ) ) ( not ( = ?auto_4672 ?auto_4674 ) ) ( not ( = ?auto_4672 ?auto_4676 ) ) ( not ( = ?auto_4674 ?auto_4690 ) ) ( not ( = ?auto_4674 ?auto_4684 ) ) ( not ( = ?auto_4674 ?auto_4683 ) ) ( not ( = ?auto_4674 ?auto_4686 ) ) ( not ( = ?auto_4674 ?auto_4696 ) ) ( not ( = ?auto_4674 ?auto_4692 ) ) ( not ( = ?auto_4676 ?auto_4690 ) ) ( not ( = ?auto_4676 ?auto_4684 ) ) ( not ( = ?auto_4676 ?auto_4683 ) ) ( not ( = ?auto_4676 ?auto_4686 ) ) ( not ( = ?auto_4676 ?auto_4696 ) ) ( not ( = ?auto_4676 ?auto_4692 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4667 ?auto_4668 ?auto_4669 ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4673 )
      ( MAKE-1CRATE ?auto_4673 ?auto_4674 )
      ( MAKE-7CRATE-VERIFY ?auto_4667 ?auto_4668 ?auto_4669 ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4673 ?auto_4674 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4716 - SURFACE
      ?auto_4717 - SURFACE
      ?auto_4718 - SURFACE
      ?auto_4719 - SURFACE
      ?auto_4720 - SURFACE
      ?auto_4721 - SURFACE
      ?auto_4722 - SURFACE
      ?auto_4723 - SURFACE
      ?auto_4724 - SURFACE
    )
    :vars
    (
      ?auto_4730 - HOIST
      ?auto_4729 - PLACE
      ?auto_4725 - PLACE
      ?auto_4726 - HOIST
      ?auto_4727 - SURFACE
      ?auto_4741 - PLACE
      ?auto_4739 - HOIST
      ?auto_4746 - SURFACE
      ?auto_4744 - PLACE
      ?auto_4747 - HOIST
      ?auto_4735 - SURFACE
      ?auto_4740 - PLACE
      ?auto_4737 - HOIST
      ?auto_4733 - SURFACE
      ?auto_4738 - SURFACE
      ?auto_4731 - SURFACE
      ?auto_4743 - PLACE
      ?auto_4734 - HOIST
      ?auto_4732 - SURFACE
      ?auto_4745 - PLACE
      ?auto_4742 - HOIST
      ?auto_4736 - SURFACE
      ?auto_4728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4730 ?auto_4729 ) ( IS-CRATE ?auto_4724 ) ( not ( = ?auto_4725 ?auto_4729 ) ) ( HOIST-AT ?auto_4726 ?auto_4725 ) ( SURFACE-AT ?auto_4724 ?auto_4725 ) ( ON ?auto_4724 ?auto_4727 ) ( CLEAR ?auto_4724 ) ( not ( = ?auto_4723 ?auto_4724 ) ) ( not ( = ?auto_4723 ?auto_4727 ) ) ( not ( = ?auto_4724 ?auto_4727 ) ) ( not ( = ?auto_4730 ?auto_4726 ) ) ( IS-CRATE ?auto_4723 ) ( not ( = ?auto_4741 ?auto_4729 ) ) ( HOIST-AT ?auto_4739 ?auto_4741 ) ( SURFACE-AT ?auto_4723 ?auto_4741 ) ( ON ?auto_4723 ?auto_4746 ) ( CLEAR ?auto_4723 ) ( not ( = ?auto_4722 ?auto_4723 ) ) ( not ( = ?auto_4722 ?auto_4746 ) ) ( not ( = ?auto_4723 ?auto_4746 ) ) ( not ( = ?auto_4730 ?auto_4739 ) ) ( IS-CRATE ?auto_4722 ) ( not ( = ?auto_4744 ?auto_4729 ) ) ( HOIST-AT ?auto_4747 ?auto_4744 ) ( AVAILABLE ?auto_4747 ) ( SURFACE-AT ?auto_4722 ?auto_4744 ) ( ON ?auto_4722 ?auto_4735 ) ( CLEAR ?auto_4722 ) ( not ( = ?auto_4721 ?auto_4722 ) ) ( not ( = ?auto_4721 ?auto_4735 ) ) ( not ( = ?auto_4722 ?auto_4735 ) ) ( not ( = ?auto_4730 ?auto_4747 ) ) ( IS-CRATE ?auto_4721 ) ( not ( = ?auto_4740 ?auto_4729 ) ) ( HOIST-AT ?auto_4737 ?auto_4740 ) ( AVAILABLE ?auto_4737 ) ( SURFACE-AT ?auto_4721 ?auto_4740 ) ( ON ?auto_4721 ?auto_4733 ) ( CLEAR ?auto_4721 ) ( not ( = ?auto_4720 ?auto_4721 ) ) ( not ( = ?auto_4720 ?auto_4733 ) ) ( not ( = ?auto_4721 ?auto_4733 ) ) ( not ( = ?auto_4730 ?auto_4737 ) ) ( IS-CRATE ?auto_4720 ) ( AVAILABLE ?auto_4739 ) ( SURFACE-AT ?auto_4720 ?auto_4741 ) ( ON ?auto_4720 ?auto_4738 ) ( CLEAR ?auto_4720 ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( not ( = ?auto_4719 ?auto_4738 ) ) ( not ( = ?auto_4720 ?auto_4738 ) ) ( IS-CRATE ?auto_4719 ) ( AVAILABLE ?auto_4726 ) ( SURFACE-AT ?auto_4719 ?auto_4725 ) ( ON ?auto_4719 ?auto_4731 ) ( CLEAR ?auto_4719 ) ( not ( = ?auto_4718 ?auto_4719 ) ) ( not ( = ?auto_4718 ?auto_4731 ) ) ( not ( = ?auto_4719 ?auto_4731 ) ) ( IS-CRATE ?auto_4718 ) ( not ( = ?auto_4743 ?auto_4729 ) ) ( HOIST-AT ?auto_4734 ?auto_4743 ) ( AVAILABLE ?auto_4734 ) ( SURFACE-AT ?auto_4718 ?auto_4743 ) ( ON ?auto_4718 ?auto_4732 ) ( CLEAR ?auto_4718 ) ( not ( = ?auto_4717 ?auto_4718 ) ) ( not ( = ?auto_4717 ?auto_4732 ) ) ( not ( = ?auto_4718 ?auto_4732 ) ) ( not ( = ?auto_4730 ?auto_4734 ) ) ( SURFACE-AT ?auto_4716 ?auto_4729 ) ( CLEAR ?auto_4716 ) ( IS-CRATE ?auto_4717 ) ( AVAILABLE ?auto_4730 ) ( not ( = ?auto_4745 ?auto_4729 ) ) ( HOIST-AT ?auto_4742 ?auto_4745 ) ( AVAILABLE ?auto_4742 ) ( SURFACE-AT ?auto_4717 ?auto_4745 ) ( ON ?auto_4717 ?auto_4736 ) ( CLEAR ?auto_4717 ) ( TRUCK-AT ?auto_4728 ?auto_4729 ) ( not ( = ?auto_4716 ?auto_4717 ) ) ( not ( = ?auto_4716 ?auto_4736 ) ) ( not ( = ?auto_4717 ?auto_4736 ) ) ( not ( = ?auto_4730 ?auto_4742 ) ) ( not ( = ?auto_4716 ?auto_4718 ) ) ( not ( = ?auto_4716 ?auto_4732 ) ) ( not ( = ?auto_4718 ?auto_4736 ) ) ( not ( = ?auto_4743 ?auto_4745 ) ) ( not ( = ?auto_4734 ?auto_4742 ) ) ( not ( = ?auto_4732 ?auto_4736 ) ) ( not ( = ?auto_4716 ?auto_4719 ) ) ( not ( = ?auto_4716 ?auto_4731 ) ) ( not ( = ?auto_4717 ?auto_4719 ) ) ( not ( = ?auto_4717 ?auto_4731 ) ) ( not ( = ?auto_4719 ?auto_4732 ) ) ( not ( = ?auto_4719 ?auto_4736 ) ) ( not ( = ?auto_4725 ?auto_4743 ) ) ( not ( = ?auto_4725 ?auto_4745 ) ) ( not ( = ?auto_4726 ?auto_4734 ) ) ( not ( = ?auto_4726 ?auto_4742 ) ) ( not ( = ?auto_4731 ?auto_4732 ) ) ( not ( = ?auto_4731 ?auto_4736 ) ) ( not ( = ?auto_4716 ?auto_4720 ) ) ( not ( = ?auto_4716 ?auto_4738 ) ) ( not ( = ?auto_4717 ?auto_4720 ) ) ( not ( = ?auto_4717 ?auto_4738 ) ) ( not ( = ?auto_4718 ?auto_4720 ) ) ( not ( = ?auto_4718 ?auto_4738 ) ) ( not ( = ?auto_4720 ?auto_4731 ) ) ( not ( = ?auto_4720 ?auto_4732 ) ) ( not ( = ?auto_4720 ?auto_4736 ) ) ( not ( = ?auto_4741 ?auto_4725 ) ) ( not ( = ?auto_4741 ?auto_4743 ) ) ( not ( = ?auto_4741 ?auto_4745 ) ) ( not ( = ?auto_4739 ?auto_4726 ) ) ( not ( = ?auto_4739 ?auto_4734 ) ) ( not ( = ?auto_4739 ?auto_4742 ) ) ( not ( = ?auto_4738 ?auto_4731 ) ) ( not ( = ?auto_4738 ?auto_4732 ) ) ( not ( = ?auto_4738 ?auto_4736 ) ) ( not ( = ?auto_4716 ?auto_4721 ) ) ( not ( = ?auto_4716 ?auto_4733 ) ) ( not ( = ?auto_4717 ?auto_4721 ) ) ( not ( = ?auto_4717 ?auto_4733 ) ) ( not ( = ?auto_4718 ?auto_4721 ) ) ( not ( = ?auto_4718 ?auto_4733 ) ) ( not ( = ?auto_4719 ?auto_4721 ) ) ( not ( = ?auto_4719 ?auto_4733 ) ) ( not ( = ?auto_4721 ?auto_4738 ) ) ( not ( = ?auto_4721 ?auto_4731 ) ) ( not ( = ?auto_4721 ?auto_4732 ) ) ( not ( = ?auto_4721 ?auto_4736 ) ) ( not ( = ?auto_4740 ?auto_4741 ) ) ( not ( = ?auto_4740 ?auto_4725 ) ) ( not ( = ?auto_4740 ?auto_4743 ) ) ( not ( = ?auto_4740 ?auto_4745 ) ) ( not ( = ?auto_4737 ?auto_4739 ) ) ( not ( = ?auto_4737 ?auto_4726 ) ) ( not ( = ?auto_4737 ?auto_4734 ) ) ( not ( = ?auto_4737 ?auto_4742 ) ) ( not ( = ?auto_4733 ?auto_4738 ) ) ( not ( = ?auto_4733 ?auto_4731 ) ) ( not ( = ?auto_4733 ?auto_4732 ) ) ( not ( = ?auto_4733 ?auto_4736 ) ) ( not ( = ?auto_4716 ?auto_4722 ) ) ( not ( = ?auto_4716 ?auto_4735 ) ) ( not ( = ?auto_4717 ?auto_4722 ) ) ( not ( = ?auto_4717 ?auto_4735 ) ) ( not ( = ?auto_4718 ?auto_4722 ) ) ( not ( = ?auto_4718 ?auto_4735 ) ) ( not ( = ?auto_4719 ?auto_4722 ) ) ( not ( = ?auto_4719 ?auto_4735 ) ) ( not ( = ?auto_4720 ?auto_4722 ) ) ( not ( = ?auto_4720 ?auto_4735 ) ) ( not ( = ?auto_4722 ?auto_4733 ) ) ( not ( = ?auto_4722 ?auto_4738 ) ) ( not ( = ?auto_4722 ?auto_4731 ) ) ( not ( = ?auto_4722 ?auto_4732 ) ) ( not ( = ?auto_4722 ?auto_4736 ) ) ( not ( = ?auto_4744 ?auto_4740 ) ) ( not ( = ?auto_4744 ?auto_4741 ) ) ( not ( = ?auto_4744 ?auto_4725 ) ) ( not ( = ?auto_4744 ?auto_4743 ) ) ( not ( = ?auto_4744 ?auto_4745 ) ) ( not ( = ?auto_4747 ?auto_4737 ) ) ( not ( = ?auto_4747 ?auto_4739 ) ) ( not ( = ?auto_4747 ?auto_4726 ) ) ( not ( = ?auto_4747 ?auto_4734 ) ) ( not ( = ?auto_4747 ?auto_4742 ) ) ( not ( = ?auto_4735 ?auto_4733 ) ) ( not ( = ?auto_4735 ?auto_4738 ) ) ( not ( = ?auto_4735 ?auto_4731 ) ) ( not ( = ?auto_4735 ?auto_4732 ) ) ( not ( = ?auto_4735 ?auto_4736 ) ) ( not ( = ?auto_4716 ?auto_4723 ) ) ( not ( = ?auto_4716 ?auto_4746 ) ) ( not ( = ?auto_4717 ?auto_4723 ) ) ( not ( = ?auto_4717 ?auto_4746 ) ) ( not ( = ?auto_4718 ?auto_4723 ) ) ( not ( = ?auto_4718 ?auto_4746 ) ) ( not ( = ?auto_4719 ?auto_4723 ) ) ( not ( = ?auto_4719 ?auto_4746 ) ) ( not ( = ?auto_4720 ?auto_4723 ) ) ( not ( = ?auto_4720 ?auto_4746 ) ) ( not ( = ?auto_4721 ?auto_4723 ) ) ( not ( = ?auto_4721 ?auto_4746 ) ) ( not ( = ?auto_4723 ?auto_4735 ) ) ( not ( = ?auto_4723 ?auto_4733 ) ) ( not ( = ?auto_4723 ?auto_4738 ) ) ( not ( = ?auto_4723 ?auto_4731 ) ) ( not ( = ?auto_4723 ?auto_4732 ) ) ( not ( = ?auto_4723 ?auto_4736 ) ) ( not ( = ?auto_4746 ?auto_4735 ) ) ( not ( = ?auto_4746 ?auto_4733 ) ) ( not ( = ?auto_4746 ?auto_4738 ) ) ( not ( = ?auto_4746 ?auto_4731 ) ) ( not ( = ?auto_4746 ?auto_4732 ) ) ( not ( = ?auto_4746 ?auto_4736 ) ) ( not ( = ?auto_4716 ?auto_4724 ) ) ( not ( = ?auto_4716 ?auto_4727 ) ) ( not ( = ?auto_4717 ?auto_4724 ) ) ( not ( = ?auto_4717 ?auto_4727 ) ) ( not ( = ?auto_4718 ?auto_4724 ) ) ( not ( = ?auto_4718 ?auto_4727 ) ) ( not ( = ?auto_4719 ?auto_4724 ) ) ( not ( = ?auto_4719 ?auto_4727 ) ) ( not ( = ?auto_4720 ?auto_4724 ) ) ( not ( = ?auto_4720 ?auto_4727 ) ) ( not ( = ?auto_4721 ?auto_4724 ) ) ( not ( = ?auto_4721 ?auto_4727 ) ) ( not ( = ?auto_4722 ?auto_4724 ) ) ( not ( = ?auto_4722 ?auto_4727 ) ) ( not ( = ?auto_4724 ?auto_4746 ) ) ( not ( = ?auto_4724 ?auto_4735 ) ) ( not ( = ?auto_4724 ?auto_4733 ) ) ( not ( = ?auto_4724 ?auto_4738 ) ) ( not ( = ?auto_4724 ?auto_4731 ) ) ( not ( = ?auto_4724 ?auto_4732 ) ) ( not ( = ?auto_4724 ?auto_4736 ) ) ( not ( = ?auto_4727 ?auto_4746 ) ) ( not ( = ?auto_4727 ?auto_4735 ) ) ( not ( = ?auto_4727 ?auto_4733 ) ) ( not ( = ?auto_4727 ?auto_4738 ) ) ( not ( = ?auto_4727 ?auto_4731 ) ) ( not ( = ?auto_4727 ?auto_4732 ) ) ( not ( = ?auto_4727 ?auto_4736 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4716 ?auto_4717 ?auto_4718 ?auto_4719 ?auto_4720 ?auto_4721 ?auto_4722 ?auto_4723 )
      ( MAKE-1CRATE ?auto_4723 ?auto_4724 )
      ( MAKE-8CRATE-VERIFY ?auto_4716 ?auto_4717 ?auto_4718 ?auto_4719 ?auto_4720 ?auto_4721 ?auto_4722 ?auto_4723 ?auto_4724 ) )
  )

)

