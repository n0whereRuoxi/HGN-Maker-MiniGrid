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
      ?auto_4464 - SURFACE
      ?auto_4465 - SURFACE
    )
    :vars
    (
      ?auto_4466 - HOIST
      ?auto_4467 - PLACE
      ?auto_4469 - PLACE
      ?auto_4470 - HOIST
      ?auto_4471 - SURFACE
      ?auto_4468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4466 ?auto_4467 ) ( SURFACE-AT ?auto_4464 ?auto_4467 ) ( CLEAR ?auto_4464 ) ( IS-CRATE ?auto_4465 ) ( AVAILABLE ?auto_4466 ) ( not ( = ?auto_4469 ?auto_4467 ) ) ( HOIST-AT ?auto_4470 ?auto_4469 ) ( AVAILABLE ?auto_4470 ) ( SURFACE-AT ?auto_4465 ?auto_4469 ) ( ON ?auto_4465 ?auto_4471 ) ( CLEAR ?auto_4465 ) ( TRUCK-AT ?auto_4468 ?auto_4467 ) ( not ( = ?auto_4464 ?auto_4465 ) ) ( not ( = ?auto_4464 ?auto_4471 ) ) ( not ( = ?auto_4465 ?auto_4471 ) ) ( not ( = ?auto_4466 ?auto_4470 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4468 ?auto_4467 ?auto_4469 )
      ( !LIFT ?auto_4470 ?auto_4465 ?auto_4471 ?auto_4469 )
      ( !LOAD ?auto_4470 ?auto_4465 ?auto_4468 ?auto_4469 )
      ( !DRIVE ?auto_4468 ?auto_4469 ?auto_4467 )
      ( !UNLOAD ?auto_4466 ?auto_4465 ?auto_4468 ?auto_4467 )
      ( !DROP ?auto_4466 ?auto_4465 ?auto_4464 ?auto_4467 )
      ( MAKE-1CRATE-VERIFY ?auto_4464 ?auto_4465 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4485 - SURFACE
      ?auto_4486 - SURFACE
      ?auto_4487 - SURFACE
    )
    :vars
    (
      ?auto_4488 - HOIST
      ?auto_4493 - PLACE
      ?auto_4491 - PLACE
      ?auto_4490 - HOIST
      ?auto_4489 - SURFACE
      ?auto_4496 - PLACE
      ?auto_4494 - HOIST
      ?auto_4495 - SURFACE
      ?auto_4492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4488 ?auto_4493 ) ( IS-CRATE ?auto_4487 ) ( not ( = ?auto_4491 ?auto_4493 ) ) ( HOIST-AT ?auto_4490 ?auto_4491 ) ( AVAILABLE ?auto_4490 ) ( SURFACE-AT ?auto_4487 ?auto_4491 ) ( ON ?auto_4487 ?auto_4489 ) ( CLEAR ?auto_4487 ) ( not ( = ?auto_4486 ?auto_4487 ) ) ( not ( = ?auto_4486 ?auto_4489 ) ) ( not ( = ?auto_4487 ?auto_4489 ) ) ( not ( = ?auto_4488 ?auto_4490 ) ) ( SURFACE-AT ?auto_4485 ?auto_4493 ) ( CLEAR ?auto_4485 ) ( IS-CRATE ?auto_4486 ) ( AVAILABLE ?auto_4488 ) ( not ( = ?auto_4496 ?auto_4493 ) ) ( HOIST-AT ?auto_4494 ?auto_4496 ) ( AVAILABLE ?auto_4494 ) ( SURFACE-AT ?auto_4486 ?auto_4496 ) ( ON ?auto_4486 ?auto_4495 ) ( CLEAR ?auto_4486 ) ( TRUCK-AT ?auto_4492 ?auto_4493 ) ( not ( = ?auto_4485 ?auto_4486 ) ) ( not ( = ?auto_4485 ?auto_4495 ) ) ( not ( = ?auto_4486 ?auto_4495 ) ) ( not ( = ?auto_4488 ?auto_4494 ) ) ( not ( = ?auto_4485 ?auto_4487 ) ) ( not ( = ?auto_4485 ?auto_4489 ) ) ( not ( = ?auto_4487 ?auto_4495 ) ) ( not ( = ?auto_4491 ?auto_4496 ) ) ( not ( = ?auto_4490 ?auto_4494 ) ) ( not ( = ?auto_4489 ?auto_4495 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4485 ?auto_4486 )
      ( MAKE-1CRATE ?auto_4486 ?auto_4487 )
      ( MAKE-2CRATE-VERIFY ?auto_4485 ?auto_4486 ?auto_4487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4511 - SURFACE
      ?auto_4512 - SURFACE
      ?auto_4513 - SURFACE
      ?auto_4514 - SURFACE
    )
    :vars
    (
      ?auto_4516 - HOIST
      ?auto_4518 - PLACE
      ?auto_4519 - PLACE
      ?auto_4517 - HOIST
      ?auto_4515 - SURFACE
      ?auto_4521 - PLACE
      ?auto_4525 - HOIST
      ?auto_4526 - SURFACE
      ?auto_4524 - PLACE
      ?auto_4522 - HOIST
      ?auto_4523 - SURFACE
      ?auto_4520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4516 ?auto_4518 ) ( IS-CRATE ?auto_4514 ) ( not ( = ?auto_4519 ?auto_4518 ) ) ( HOIST-AT ?auto_4517 ?auto_4519 ) ( AVAILABLE ?auto_4517 ) ( SURFACE-AT ?auto_4514 ?auto_4519 ) ( ON ?auto_4514 ?auto_4515 ) ( CLEAR ?auto_4514 ) ( not ( = ?auto_4513 ?auto_4514 ) ) ( not ( = ?auto_4513 ?auto_4515 ) ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4516 ?auto_4517 ) ) ( IS-CRATE ?auto_4513 ) ( not ( = ?auto_4521 ?auto_4518 ) ) ( HOIST-AT ?auto_4525 ?auto_4521 ) ( AVAILABLE ?auto_4525 ) ( SURFACE-AT ?auto_4513 ?auto_4521 ) ( ON ?auto_4513 ?auto_4526 ) ( CLEAR ?auto_4513 ) ( not ( = ?auto_4512 ?auto_4513 ) ) ( not ( = ?auto_4512 ?auto_4526 ) ) ( not ( = ?auto_4513 ?auto_4526 ) ) ( not ( = ?auto_4516 ?auto_4525 ) ) ( SURFACE-AT ?auto_4511 ?auto_4518 ) ( CLEAR ?auto_4511 ) ( IS-CRATE ?auto_4512 ) ( AVAILABLE ?auto_4516 ) ( not ( = ?auto_4524 ?auto_4518 ) ) ( HOIST-AT ?auto_4522 ?auto_4524 ) ( AVAILABLE ?auto_4522 ) ( SURFACE-AT ?auto_4512 ?auto_4524 ) ( ON ?auto_4512 ?auto_4523 ) ( CLEAR ?auto_4512 ) ( TRUCK-AT ?auto_4520 ?auto_4518 ) ( not ( = ?auto_4511 ?auto_4512 ) ) ( not ( = ?auto_4511 ?auto_4523 ) ) ( not ( = ?auto_4512 ?auto_4523 ) ) ( not ( = ?auto_4516 ?auto_4522 ) ) ( not ( = ?auto_4511 ?auto_4513 ) ) ( not ( = ?auto_4511 ?auto_4526 ) ) ( not ( = ?auto_4513 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4524 ) ) ( not ( = ?auto_4525 ?auto_4522 ) ) ( not ( = ?auto_4526 ?auto_4523 ) ) ( not ( = ?auto_4511 ?auto_4514 ) ) ( not ( = ?auto_4511 ?auto_4515 ) ) ( not ( = ?auto_4512 ?auto_4514 ) ) ( not ( = ?auto_4512 ?auto_4515 ) ) ( not ( = ?auto_4514 ?auto_4526 ) ) ( not ( = ?auto_4514 ?auto_4523 ) ) ( not ( = ?auto_4519 ?auto_4521 ) ) ( not ( = ?auto_4519 ?auto_4524 ) ) ( not ( = ?auto_4517 ?auto_4525 ) ) ( not ( = ?auto_4517 ?auto_4522 ) ) ( not ( = ?auto_4515 ?auto_4526 ) ) ( not ( = ?auto_4515 ?auto_4523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4511 ?auto_4512 ?auto_4513 )
      ( MAKE-1CRATE ?auto_4513 ?auto_4514 )
      ( MAKE-3CRATE-VERIFY ?auto_4511 ?auto_4512 ?auto_4513 ?auto_4514 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4542 - SURFACE
      ?auto_4543 - SURFACE
      ?auto_4544 - SURFACE
      ?auto_4545 - SURFACE
      ?auto_4546 - SURFACE
    )
    :vars
    (
      ?auto_4549 - HOIST
      ?auto_4548 - PLACE
      ?auto_4552 - PLACE
      ?auto_4551 - HOIST
      ?auto_4550 - SURFACE
      ?auto_4553 - SURFACE
      ?auto_4557 - PLACE
      ?auto_4555 - HOIST
      ?auto_4559 - SURFACE
      ?auto_4556 - PLACE
      ?auto_4558 - HOIST
      ?auto_4554 - SURFACE
      ?auto_4547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4549 ?auto_4548 ) ( IS-CRATE ?auto_4546 ) ( not ( = ?auto_4552 ?auto_4548 ) ) ( HOIST-AT ?auto_4551 ?auto_4552 ) ( SURFACE-AT ?auto_4546 ?auto_4552 ) ( ON ?auto_4546 ?auto_4550 ) ( CLEAR ?auto_4546 ) ( not ( = ?auto_4545 ?auto_4546 ) ) ( not ( = ?auto_4545 ?auto_4550 ) ) ( not ( = ?auto_4546 ?auto_4550 ) ) ( not ( = ?auto_4549 ?auto_4551 ) ) ( IS-CRATE ?auto_4545 ) ( AVAILABLE ?auto_4551 ) ( SURFACE-AT ?auto_4545 ?auto_4552 ) ( ON ?auto_4545 ?auto_4553 ) ( CLEAR ?auto_4545 ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4553 ) ) ( not ( = ?auto_4545 ?auto_4553 ) ) ( IS-CRATE ?auto_4544 ) ( not ( = ?auto_4557 ?auto_4548 ) ) ( HOIST-AT ?auto_4555 ?auto_4557 ) ( AVAILABLE ?auto_4555 ) ( SURFACE-AT ?auto_4544 ?auto_4557 ) ( ON ?auto_4544 ?auto_4559 ) ( CLEAR ?auto_4544 ) ( not ( = ?auto_4543 ?auto_4544 ) ) ( not ( = ?auto_4543 ?auto_4559 ) ) ( not ( = ?auto_4544 ?auto_4559 ) ) ( not ( = ?auto_4549 ?auto_4555 ) ) ( SURFACE-AT ?auto_4542 ?auto_4548 ) ( CLEAR ?auto_4542 ) ( IS-CRATE ?auto_4543 ) ( AVAILABLE ?auto_4549 ) ( not ( = ?auto_4556 ?auto_4548 ) ) ( HOIST-AT ?auto_4558 ?auto_4556 ) ( AVAILABLE ?auto_4558 ) ( SURFACE-AT ?auto_4543 ?auto_4556 ) ( ON ?auto_4543 ?auto_4554 ) ( CLEAR ?auto_4543 ) ( TRUCK-AT ?auto_4547 ?auto_4548 ) ( not ( = ?auto_4542 ?auto_4543 ) ) ( not ( = ?auto_4542 ?auto_4554 ) ) ( not ( = ?auto_4543 ?auto_4554 ) ) ( not ( = ?auto_4549 ?auto_4558 ) ) ( not ( = ?auto_4542 ?auto_4544 ) ) ( not ( = ?auto_4542 ?auto_4559 ) ) ( not ( = ?auto_4544 ?auto_4554 ) ) ( not ( = ?auto_4557 ?auto_4556 ) ) ( not ( = ?auto_4555 ?auto_4558 ) ) ( not ( = ?auto_4559 ?auto_4554 ) ) ( not ( = ?auto_4542 ?auto_4545 ) ) ( not ( = ?auto_4542 ?auto_4553 ) ) ( not ( = ?auto_4543 ?auto_4545 ) ) ( not ( = ?auto_4543 ?auto_4553 ) ) ( not ( = ?auto_4545 ?auto_4559 ) ) ( not ( = ?auto_4545 ?auto_4554 ) ) ( not ( = ?auto_4552 ?auto_4557 ) ) ( not ( = ?auto_4552 ?auto_4556 ) ) ( not ( = ?auto_4551 ?auto_4555 ) ) ( not ( = ?auto_4551 ?auto_4558 ) ) ( not ( = ?auto_4553 ?auto_4559 ) ) ( not ( = ?auto_4553 ?auto_4554 ) ) ( not ( = ?auto_4542 ?auto_4546 ) ) ( not ( = ?auto_4542 ?auto_4550 ) ) ( not ( = ?auto_4543 ?auto_4546 ) ) ( not ( = ?auto_4543 ?auto_4550 ) ) ( not ( = ?auto_4544 ?auto_4546 ) ) ( not ( = ?auto_4544 ?auto_4550 ) ) ( not ( = ?auto_4546 ?auto_4553 ) ) ( not ( = ?auto_4546 ?auto_4559 ) ) ( not ( = ?auto_4546 ?auto_4554 ) ) ( not ( = ?auto_4550 ?auto_4553 ) ) ( not ( = ?auto_4550 ?auto_4559 ) ) ( not ( = ?auto_4550 ?auto_4554 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4542 ?auto_4543 ?auto_4544 ?auto_4545 )
      ( MAKE-1CRATE ?auto_4545 ?auto_4546 )
      ( MAKE-4CRATE-VERIFY ?auto_4542 ?auto_4543 ?auto_4544 ?auto_4545 ?auto_4546 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4576 - SURFACE
      ?auto_4577 - SURFACE
      ?auto_4578 - SURFACE
      ?auto_4579 - SURFACE
      ?auto_4580 - SURFACE
      ?auto_4581 - SURFACE
    )
    :vars
    (
      ?auto_4582 - HOIST
      ?auto_4587 - PLACE
      ?auto_4586 - PLACE
      ?auto_4584 - HOIST
      ?auto_4583 - SURFACE
      ?auto_4593 - PLACE
      ?auto_4592 - HOIST
      ?auto_4589 - SURFACE
      ?auto_4590 - SURFACE
      ?auto_4595 - SURFACE
      ?auto_4588 - PLACE
      ?auto_4594 - HOIST
      ?auto_4591 - SURFACE
      ?auto_4585 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4582 ?auto_4587 ) ( IS-CRATE ?auto_4581 ) ( not ( = ?auto_4586 ?auto_4587 ) ) ( HOIST-AT ?auto_4584 ?auto_4586 ) ( SURFACE-AT ?auto_4581 ?auto_4586 ) ( ON ?auto_4581 ?auto_4583 ) ( CLEAR ?auto_4581 ) ( not ( = ?auto_4580 ?auto_4581 ) ) ( not ( = ?auto_4580 ?auto_4583 ) ) ( not ( = ?auto_4581 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4584 ) ) ( IS-CRATE ?auto_4580 ) ( not ( = ?auto_4593 ?auto_4587 ) ) ( HOIST-AT ?auto_4592 ?auto_4593 ) ( SURFACE-AT ?auto_4580 ?auto_4593 ) ( ON ?auto_4580 ?auto_4589 ) ( CLEAR ?auto_4580 ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( not ( = ?auto_4579 ?auto_4589 ) ) ( not ( = ?auto_4580 ?auto_4589 ) ) ( not ( = ?auto_4582 ?auto_4592 ) ) ( IS-CRATE ?auto_4579 ) ( AVAILABLE ?auto_4592 ) ( SURFACE-AT ?auto_4579 ?auto_4593 ) ( ON ?auto_4579 ?auto_4590 ) ( CLEAR ?auto_4579 ) ( not ( = ?auto_4578 ?auto_4579 ) ) ( not ( = ?auto_4578 ?auto_4590 ) ) ( not ( = ?auto_4579 ?auto_4590 ) ) ( IS-CRATE ?auto_4578 ) ( AVAILABLE ?auto_4584 ) ( SURFACE-AT ?auto_4578 ?auto_4586 ) ( ON ?auto_4578 ?auto_4595 ) ( CLEAR ?auto_4578 ) ( not ( = ?auto_4577 ?auto_4578 ) ) ( not ( = ?auto_4577 ?auto_4595 ) ) ( not ( = ?auto_4578 ?auto_4595 ) ) ( SURFACE-AT ?auto_4576 ?auto_4587 ) ( CLEAR ?auto_4576 ) ( IS-CRATE ?auto_4577 ) ( AVAILABLE ?auto_4582 ) ( not ( = ?auto_4588 ?auto_4587 ) ) ( HOIST-AT ?auto_4594 ?auto_4588 ) ( AVAILABLE ?auto_4594 ) ( SURFACE-AT ?auto_4577 ?auto_4588 ) ( ON ?auto_4577 ?auto_4591 ) ( CLEAR ?auto_4577 ) ( TRUCK-AT ?auto_4585 ?auto_4587 ) ( not ( = ?auto_4576 ?auto_4577 ) ) ( not ( = ?auto_4576 ?auto_4591 ) ) ( not ( = ?auto_4577 ?auto_4591 ) ) ( not ( = ?auto_4582 ?auto_4594 ) ) ( not ( = ?auto_4576 ?auto_4578 ) ) ( not ( = ?auto_4576 ?auto_4595 ) ) ( not ( = ?auto_4578 ?auto_4591 ) ) ( not ( = ?auto_4586 ?auto_4588 ) ) ( not ( = ?auto_4584 ?auto_4594 ) ) ( not ( = ?auto_4595 ?auto_4591 ) ) ( not ( = ?auto_4576 ?auto_4579 ) ) ( not ( = ?auto_4576 ?auto_4590 ) ) ( not ( = ?auto_4577 ?auto_4579 ) ) ( not ( = ?auto_4577 ?auto_4590 ) ) ( not ( = ?auto_4579 ?auto_4595 ) ) ( not ( = ?auto_4579 ?auto_4591 ) ) ( not ( = ?auto_4593 ?auto_4586 ) ) ( not ( = ?auto_4593 ?auto_4588 ) ) ( not ( = ?auto_4592 ?auto_4584 ) ) ( not ( = ?auto_4592 ?auto_4594 ) ) ( not ( = ?auto_4590 ?auto_4595 ) ) ( not ( = ?auto_4590 ?auto_4591 ) ) ( not ( = ?auto_4576 ?auto_4580 ) ) ( not ( = ?auto_4576 ?auto_4589 ) ) ( not ( = ?auto_4577 ?auto_4580 ) ) ( not ( = ?auto_4577 ?auto_4589 ) ) ( not ( = ?auto_4578 ?auto_4580 ) ) ( not ( = ?auto_4578 ?auto_4589 ) ) ( not ( = ?auto_4580 ?auto_4590 ) ) ( not ( = ?auto_4580 ?auto_4595 ) ) ( not ( = ?auto_4580 ?auto_4591 ) ) ( not ( = ?auto_4589 ?auto_4590 ) ) ( not ( = ?auto_4589 ?auto_4595 ) ) ( not ( = ?auto_4589 ?auto_4591 ) ) ( not ( = ?auto_4576 ?auto_4581 ) ) ( not ( = ?auto_4576 ?auto_4583 ) ) ( not ( = ?auto_4577 ?auto_4581 ) ) ( not ( = ?auto_4577 ?auto_4583 ) ) ( not ( = ?auto_4578 ?auto_4581 ) ) ( not ( = ?auto_4578 ?auto_4583 ) ) ( not ( = ?auto_4579 ?auto_4581 ) ) ( not ( = ?auto_4579 ?auto_4583 ) ) ( not ( = ?auto_4581 ?auto_4589 ) ) ( not ( = ?auto_4581 ?auto_4590 ) ) ( not ( = ?auto_4581 ?auto_4595 ) ) ( not ( = ?auto_4581 ?auto_4591 ) ) ( not ( = ?auto_4583 ?auto_4589 ) ) ( not ( = ?auto_4583 ?auto_4590 ) ) ( not ( = ?auto_4583 ?auto_4595 ) ) ( not ( = ?auto_4583 ?auto_4591 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4576 ?auto_4577 ?auto_4578 ?auto_4579 ?auto_4580 )
      ( MAKE-1CRATE ?auto_4580 ?auto_4581 )
      ( MAKE-5CRATE-VERIFY ?auto_4576 ?auto_4577 ?auto_4578 ?auto_4579 ?auto_4580 ?auto_4581 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4613 - SURFACE
      ?auto_4614 - SURFACE
      ?auto_4615 - SURFACE
      ?auto_4616 - SURFACE
      ?auto_4617 - SURFACE
      ?auto_4618 - SURFACE
      ?auto_4619 - SURFACE
    )
    :vars
    (
      ?auto_4620 - HOIST
      ?auto_4621 - PLACE
      ?auto_4623 - PLACE
      ?auto_4624 - HOIST
      ?auto_4625 - SURFACE
      ?auto_4628 - PLACE
      ?auto_4634 - HOIST
      ?auto_4633 - SURFACE
      ?auto_4629 - PLACE
      ?auto_4630 - HOIST
      ?auto_4626 - SURFACE
      ?auto_4627 - SURFACE
      ?auto_4632 - SURFACE
      ?auto_4631 - SURFACE
      ?auto_4622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4620 ?auto_4621 ) ( IS-CRATE ?auto_4619 ) ( not ( = ?auto_4623 ?auto_4621 ) ) ( HOIST-AT ?auto_4624 ?auto_4623 ) ( SURFACE-AT ?auto_4619 ?auto_4623 ) ( ON ?auto_4619 ?auto_4625 ) ( CLEAR ?auto_4619 ) ( not ( = ?auto_4618 ?auto_4619 ) ) ( not ( = ?auto_4618 ?auto_4625 ) ) ( not ( = ?auto_4619 ?auto_4625 ) ) ( not ( = ?auto_4620 ?auto_4624 ) ) ( IS-CRATE ?auto_4618 ) ( not ( = ?auto_4628 ?auto_4621 ) ) ( HOIST-AT ?auto_4634 ?auto_4628 ) ( SURFACE-AT ?auto_4618 ?auto_4628 ) ( ON ?auto_4618 ?auto_4633 ) ( CLEAR ?auto_4618 ) ( not ( = ?auto_4617 ?auto_4618 ) ) ( not ( = ?auto_4617 ?auto_4633 ) ) ( not ( = ?auto_4618 ?auto_4633 ) ) ( not ( = ?auto_4620 ?auto_4634 ) ) ( IS-CRATE ?auto_4617 ) ( not ( = ?auto_4629 ?auto_4621 ) ) ( HOIST-AT ?auto_4630 ?auto_4629 ) ( SURFACE-AT ?auto_4617 ?auto_4629 ) ( ON ?auto_4617 ?auto_4626 ) ( CLEAR ?auto_4617 ) ( not ( = ?auto_4616 ?auto_4617 ) ) ( not ( = ?auto_4616 ?auto_4626 ) ) ( not ( = ?auto_4617 ?auto_4626 ) ) ( not ( = ?auto_4620 ?auto_4630 ) ) ( IS-CRATE ?auto_4616 ) ( AVAILABLE ?auto_4630 ) ( SURFACE-AT ?auto_4616 ?auto_4629 ) ( ON ?auto_4616 ?auto_4627 ) ( CLEAR ?auto_4616 ) ( not ( = ?auto_4615 ?auto_4616 ) ) ( not ( = ?auto_4615 ?auto_4627 ) ) ( not ( = ?auto_4616 ?auto_4627 ) ) ( IS-CRATE ?auto_4615 ) ( AVAILABLE ?auto_4634 ) ( SURFACE-AT ?auto_4615 ?auto_4628 ) ( ON ?auto_4615 ?auto_4632 ) ( CLEAR ?auto_4615 ) ( not ( = ?auto_4614 ?auto_4615 ) ) ( not ( = ?auto_4614 ?auto_4632 ) ) ( not ( = ?auto_4615 ?auto_4632 ) ) ( SURFACE-AT ?auto_4613 ?auto_4621 ) ( CLEAR ?auto_4613 ) ( IS-CRATE ?auto_4614 ) ( AVAILABLE ?auto_4620 ) ( AVAILABLE ?auto_4624 ) ( SURFACE-AT ?auto_4614 ?auto_4623 ) ( ON ?auto_4614 ?auto_4631 ) ( CLEAR ?auto_4614 ) ( TRUCK-AT ?auto_4622 ?auto_4621 ) ( not ( = ?auto_4613 ?auto_4614 ) ) ( not ( = ?auto_4613 ?auto_4631 ) ) ( not ( = ?auto_4614 ?auto_4631 ) ) ( not ( = ?auto_4613 ?auto_4615 ) ) ( not ( = ?auto_4613 ?auto_4632 ) ) ( not ( = ?auto_4615 ?auto_4631 ) ) ( not ( = ?auto_4628 ?auto_4623 ) ) ( not ( = ?auto_4634 ?auto_4624 ) ) ( not ( = ?auto_4632 ?auto_4631 ) ) ( not ( = ?auto_4613 ?auto_4616 ) ) ( not ( = ?auto_4613 ?auto_4627 ) ) ( not ( = ?auto_4614 ?auto_4616 ) ) ( not ( = ?auto_4614 ?auto_4627 ) ) ( not ( = ?auto_4616 ?auto_4632 ) ) ( not ( = ?auto_4616 ?auto_4631 ) ) ( not ( = ?auto_4629 ?auto_4628 ) ) ( not ( = ?auto_4629 ?auto_4623 ) ) ( not ( = ?auto_4630 ?auto_4634 ) ) ( not ( = ?auto_4630 ?auto_4624 ) ) ( not ( = ?auto_4627 ?auto_4632 ) ) ( not ( = ?auto_4627 ?auto_4631 ) ) ( not ( = ?auto_4613 ?auto_4617 ) ) ( not ( = ?auto_4613 ?auto_4626 ) ) ( not ( = ?auto_4614 ?auto_4617 ) ) ( not ( = ?auto_4614 ?auto_4626 ) ) ( not ( = ?auto_4615 ?auto_4617 ) ) ( not ( = ?auto_4615 ?auto_4626 ) ) ( not ( = ?auto_4617 ?auto_4627 ) ) ( not ( = ?auto_4617 ?auto_4632 ) ) ( not ( = ?auto_4617 ?auto_4631 ) ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( not ( = ?auto_4626 ?auto_4632 ) ) ( not ( = ?auto_4626 ?auto_4631 ) ) ( not ( = ?auto_4613 ?auto_4618 ) ) ( not ( = ?auto_4613 ?auto_4633 ) ) ( not ( = ?auto_4614 ?auto_4618 ) ) ( not ( = ?auto_4614 ?auto_4633 ) ) ( not ( = ?auto_4615 ?auto_4618 ) ) ( not ( = ?auto_4615 ?auto_4633 ) ) ( not ( = ?auto_4616 ?auto_4618 ) ) ( not ( = ?auto_4616 ?auto_4633 ) ) ( not ( = ?auto_4618 ?auto_4626 ) ) ( not ( = ?auto_4618 ?auto_4627 ) ) ( not ( = ?auto_4618 ?auto_4632 ) ) ( not ( = ?auto_4618 ?auto_4631 ) ) ( not ( = ?auto_4633 ?auto_4626 ) ) ( not ( = ?auto_4633 ?auto_4627 ) ) ( not ( = ?auto_4633 ?auto_4632 ) ) ( not ( = ?auto_4633 ?auto_4631 ) ) ( not ( = ?auto_4613 ?auto_4619 ) ) ( not ( = ?auto_4613 ?auto_4625 ) ) ( not ( = ?auto_4614 ?auto_4619 ) ) ( not ( = ?auto_4614 ?auto_4625 ) ) ( not ( = ?auto_4615 ?auto_4619 ) ) ( not ( = ?auto_4615 ?auto_4625 ) ) ( not ( = ?auto_4616 ?auto_4619 ) ) ( not ( = ?auto_4616 ?auto_4625 ) ) ( not ( = ?auto_4617 ?auto_4619 ) ) ( not ( = ?auto_4617 ?auto_4625 ) ) ( not ( = ?auto_4619 ?auto_4633 ) ) ( not ( = ?auto_4619 ?auto_4626 ) ) ( not ( = ?auto_4619 ?auto_4627 ) ) ( not ( = ?auto_4619 ?auto_4632 ) ) ( not ( = ?auto_4619 ?auto_4631 ) ) ( not ( = ?auto_4625 ?auto_4633 ) ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4632 ) ) ( not ( = ?auto_4625 ?auto_4631 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4613 ?auto_4614 ?auto_4615 ?auto_4616 ?auto_4617 ?auto_4618 )
      ( MAKE-1CRATE ?auto_4618 ?auto_4619 )
      ( MAKE-6CRATE-VERIFY ?auto_4613 ?auto_4614 ?auto_4615 ?auto_4616 ?auto_4617 ?auto_4618 ?auto_4619 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4653 - SURFACE
      ?auto_4654 - SURFACE
      ?auto_4655 - SURFACE
      ?auto_4656 - SURFACE
      ?auto_4657 - SURFACE
      ?auto_4658 - SURFACE
      ?auto_4659 - SURFACE
      ?auto_4660 - SURFACE
    )
    :vars
    (
      ?auto_4661 - HOIST
      ?auto_4664 - PLACE
      ?auto_4666 - PLACE
      ?auto_4663 - HOIST
      ?auto_4665 - SURFACE
      ?auto_4668 - PLACE
      ?auto_4669 - HOIST
      ?auto_4674 - SURFACE
      ?auto_4675 - PLACE
      ?auto_4673 - HOIST
      ?auto_4676 - SURFACE
      ?auto_4672 - SURFACE
      ?auto_4671 - SURFACE
      ?auto_4670 - SURFACE
      ?auto_4667 - SURFACE
      ?auto_4662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4661 ?auto_4664 ) ( IS-CRATE ?auto_4660 ) ( not ( = ?auto_4666 ?auto_4664 ) ) ( HOIST-AT ?auto_4663 ?auto_4666 ) ( SURFACE-AT ?auto_4660 ?auto_4666 ) ( ON ?auto_4660 ?auto_4665 ) ( CLEAR ?auto_4660 ) ( not ( = ?auto_4659 ?auto_4660 ) ) ( not ( = ?auto_4659 ?auto_4665 ) ) ( not ( = ?auto_4660 ?auto_4665 ) ) ( not ( = ?auto_4661 ?auto_4663 ) ) ( IS-CRATE ?auto_4659 ) ( not ( = ?auto_4668 ?auto_4664 ) ) ( HOIST-AT ?auto_4669 ?auto_4668 ) ( SURFACE-AT ?auto_4659 ?auto_4668 ) ( ON ?auto_4659 ?auto_4674 ) ( CLEAR ?auto_4659 ) ( not ( = ?auto_4658 ?auto_4659 ) ) ( not ( = ?auto_4658 ?auto_4674 ) ) ( not ( = ?auto_4659 ?auto_4674 ) ) ( not ( = ?auto_4661 ?auto_4669 ) ) ( IS-CRATE ?auto_4658 ) ( not ( = ?auto_4675 ?auto_4664 ) ) ( HOIST-AT ?auto_4673 ?auto_4675 ) ( SURFACE-AT ?auto_4658 ?auto_4675 ) ( ON ?auto_4658 ?auto_4676 ) ( CLEAR ?auto_4658 ) ( not ( = ?auto_4657 ?auto_4658 ) ) ( not ( = ?auto_4657 ?auto_4676 ) ) ( not ( = ?auto_4658 ?auto_4676 ) ) ( not ( = ?auto_4661 ?auto_4673 ) ) ( IS-CRATE ?auto_4657 ) ( SURFACE-AT ?auto_4657 ?auto_4666 ) ( ON ?auto_4657 ?auto_4672 ) ( CLEAR ?auto_4657 ) ( not ( = ?auto_4656 ?auto_4657 ) ) ( not ( = ?auto_4656 ?auto_4672 ) ) ( not ( = ?auto_4657 ?auto_4672 ) ) ( IS-CRATE ?auto_4656 ) ( AVAILABLE ?auto_4663 ) ( SURFACE-AT ?auto_4656 ?auto_4666 ) ( ON ?auto_4656 ?auto_4671 ) ( CLEAR ?auto_4656 ) ( not ( = ?auto_4655 ?auto_4656 ) ) ( not ( = ?auto_4655 ?auto_4671 ) ) ( not ( = ?auto_4656 ?auto_4671 ) ) ( IS-CRATE ?auto_4655 ) ( AVAILABLE ?auto_4673 ) ( SURFACE-AT ?auto_4655 ?auto_4675 ) ( ON ?auto_4655 ?auto_4670 ) ( CLEAR ?auto_4655 ) ( not ( = ?auto_4654 ?auto_4655 ) ) ( not ( = ?auto_4654 ?auto_4670 ) ) ( not ( = ?auto_4655 ?auto_4670 ) ) ( SURFACE-AT ?auto_4653 ?auto_4664 ) ( CLEAR ?auto_4653 ) ( IS-CRATE ?auto_4654 ) ( AVAILABLE ?auto_4661 ) ( AVAILABLE ?auto_4669 ) ( SURFACE-AT ?auto_4654 ?auto_4668 ) ( ON ?auto_4654 ?auto_4667 ) ( CLEAR ?auto_4654 ) ( TRUCK-AT ?auto_4662 ?auto_4664 ) ( not ( = ?auto_4653 ?auto_4654 ) ) ( not ( = ?auto_4653 ?auto_4667 ) ) ( not ( = ?auto_4654 ?auto_4667 ) ) ( not ( = ?auto_4653 ?auto_4655 ) ) ( not ( = ?auto_4653 ?auto_4670 ) ) ( not ( = ?auto_4655 ?auto_4667 ) ) ( not ( = ?auto_4675 ?auto_4668 ) ) ( not ( = ?auto_4673 ?auto_4669 ) ) ( not ( = ?auto_4670 ?auto_4667 ) ) ( not ( = ?auto_4653 ?auto_4656 ) ) ( not ( = ?auto_4653 ?auto_4671 ) ) ( not ( = ?auto_4654 ?auto_4656 ) ) ( not ( = ?auto_4654 ?auto_4671 ) ) ( not ( = ?auto_4656 ?auto_4670 ) ) ( not ( = ?auto_4656 ?auto_4667 ) ) ( not ( = ?auto_4666 ?auto_4675 ) ) ( not ( = ?auto_4666 ?auto_4668 ) ) ( not ( = ?auto_4663 ?auto_4673 ) ) ( not ( = ?auto_4663 ?auto_4669 ) ) ( not ( = ?auto_4671 ?auto_4670 ) ) ( not ( = ?auto_4671 ?auto_4667 ) ) ( not ( = ?auto_4653 ?auto_4657 ) ) ( not ( = ?auto_4653 ?auto_4672 ) ) ( not ( = ?auto_4654 ?auto_4657 ) ) ( not ( = ?auto_4654 ?auto_4672 ) ) ( not ( = ?auto_4655 ?auto_4657 ) ) ( not ( = ?auto_4655 ?auto_4672 ) ) ( not ( = ?auto_4657 ?auto_4671 ) ) ( not ( = ?auto_4657 ?auto_4670 ) ) ( not ( = ?auto_4657 ?auto_4667 ) ) ( not ( = ?auto_4672 ?auto_4671 ) ) ( not ( = ?auto_4672 ?auto_4670 ) ) ( not ( = ?auto_4672 ?auto_4667 ) ) ( not ( = ?auto_4653 ?auto_4658 ) ) ( not ( = ?auto_4653 ?auto_4676 ) ) ( not ( = ?auto_4654 ?auto_4658 ) ) ( not ( = ?auto_4654 ?auto_4676 ) ) ( not ( = ?auto_4655 ?auto_4658 ) ) ( not ( = ?auto_4655 ?auto_4676 ) ) ( not ( = ?auto_4656 ?auto_4658 ) ) ( not ( = ?auto_4656 ?auto_4676 ) ) ( not ( = ?auto_4658 ?auto_4672 ) ) ( not ( = ?auto_4658 ?auto_4671 ) ) ( not ( = ?auto_4658 ?auto_4670 ) ) ( not ( = ?auto_4658 ?auto_4667 ) ) ( not ( = ?auto_4676 ?auto_4672 ) ) ( not ( = ?auto_4676 ?auto_4671 ) ) ( not ( = ?auto_4676 ?auto_4670 ) ) ( not ( = ?auto_4676 ?auto_4667 ) ) ( not ( = ?auto_4653 ?auto_4659 ) ) ( not ( = ?auto_4653 ?auto_4674 ) ) ( not ( = ?auto_4654 ?auto_4659 ) ) ( not ( = ?auto_4654 ?auto_4674 ) ) ( not ( = ?auto_4655 ?auto_4659 ) ) ( not ( = ?auto_4655 ?auto_4674 ) ) ( not ( = ?auto_4656 ?auto_4659 ) ) ( not ( = ?auto_4656 ?auto_4674 ) ) ( not ( = ?auto_4657 ?auto_4659 ) ) ( not ( = ?auto_4657 ?auto_4674 ) ) ( not ( = ?auto_4659 ?auto_4676 ) ) ( not ( = ?auto_4659 ?auto_4672 ) ) ( not ( = ?auto_4659 ?auto_4671 ) ) ( not ( = ?auto_4659 ?auto_4670 ) ) ( not ( = ?auto_4659 ?auto_4667 ) ) ( not ( = ?auto_4674 ?auto_4676 ) ) ( not ( = ?auto_4674 ?auto_4672 ) ) ( not ( = ?auto_4674 ?auto_4671 ) ) ( not ( = ?auto_4674 ?auto_4670 ) ) ( not ( = ?auto_4674 ?auto_4667 ) ) ( not ( = ?auto_4653 ?auto_4660 ) ) ( not ( = ?auto_4653 ?auto_4665 ) ) ( not ( = ?auto_4654 ?auto_4660 ) ) ( not ( = ?auto_4654 ?auto_4665 ) ) ( not ( = ?auto_4655 ?auto_4660 ) ) ( not ( = ?auto_4655 ?auto_4665 ) ) ( not ( = ?auto_4656 ?auto_4660 ) ) ( not ( = ?auto_4656 ?auto_4665 ) ) ( not ( = ?auto_4657 ?auto_4660 ) ) ( not ( = ?auto_4657 ?auto_4665 ) ) ( not ( = ?auto_4658 ?auto_4660 ) ) ( not ( = ?auto_4658 ?auto_4665 ) ) ( not ( = ?auto_4660 ?auto_4674 ) ) ( not ( = ?auto_4660 ?auto_4676 ) ) ( not ( = ?auto_4660 ?auto_4672 ) ) ( not ( = ?auto_4660 ?auto_4671 ) ) ( not ( = ?auto_4660 ?auto_4670 ) ) ( not ( = ?auto_4660 ?auto_4667 ) ) ( not ( = ?auto_4665 ?auto_4674 ) ) ( not ( = ?auto_4665 ?auto_4676 ) ) ( not ( = ?auto_4665 ?auto_4672 ) ) ( not ( = ?auto_4665 ?auto_4671 ) ) ( not ( = ?auto_4665 ?auto_4670 ) ) ( not ( = ?auto_4665 ?auto_4667 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4653 ?auto_4654 ?auto_4655 ?auto_4656 ?auto_4657 ?auto_4658 ?auto_4659 )
      ( MAKE-1CRATE ?auto_4659 ?auto_4660 )
      ( MAKE-7CRATE-VERIFY ?auto_4653 ?auto_4654 ?auto_4655 ?auto_4656 ?auto_4657 ?auto_4658 ?auto_4659 ?auto_4660 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4696 - SURFACE
      ?auto_4697 - SURFACE
      ?auto_4698 - SURFACE
      ?auto_4699 - SURFACE
      ?auto_4700 - SURFACE
      ?auto_4701 - SURFACE
      ?auto_4702 - SURFACE
      ?auto_4703 - SURFACE
      ?auto_4704 - SURFACE
    )
    :vars
    (
      ?auto_4708 - HOIST
      ?auto_4707 - PLACE
      ?auto_4705 - PLACE
      ?auto_4710 - HOIST
      ?auto_4709 - SURFACE
      ?auto_4713 - PLACE
      ?auto_4712 - HOIST
      ?auto_4716 - SURFACE
      ?auto_4722 - PLACE
      ?auto_4720 - HOIST
      ?auto_4711 - SURFACE
      ?auto_4721 - PLACE
      ?auto_4717 - HOIST
      ?auto_4715 - SURFACE
      ?auto_4719 - SURFACE
      ?auto_4723 - SURFACE
      ?auto_4718 - SURFACE
      ?auto_4714 - SURFACE
      ?auto_4706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4708 ?auto_4707 ) ( IS-CRATE ?auto_4704 ) ( not ( = ?auto_4705 ?auto_4707 ) ) ( HOIST-AT ?auto_4710 ?auto_4705 ) ( AVAILABLE ?auto_4710 ) ( SURFACE-AT ?auto_4704 ?auto_4705 ) ( ON ?auto_4704 ?auto_4709 ) ( CLEAR ?auto_4704 ) ( not ( = ?auto_4703 ?auto_4704 ) ) ( not ( = ?auto_4703 ?auto_4709 ) ) ( not ( = ?auto_4704 ?auto_4709 ) ) ( not ( = ?auto_4708 ?auto_4710 ) ) ( IS-CRATE ?auto_4703 ) ( not ( = ?auto_4713 ?auto_4707 ) ) ( HOIST-AT ?auto_4712 ?auto_4713 ) ( SURFACE-AT ?auto_4703 ?auto_4713 ) ( ON ?auto_4703 ?auto_4716 ) ( CLEAR ?auto_4703 ) ( not ( = ?auto_4702 ?auto_4703 ) ) ( not ( = ?auto_4702 ?auto_4716 ) ) ( not ( = ?auto_4703 ?auto_4716 ) ) ( not ( = ?auto_4708 ?auto_4712 ) ) ( IS-CRATE ?auto_4702 ) ( not ( = ?auto_4722 ?auto_4707 ) ) ( HOIST-AT ?auto_4720 ?auto_4722 ) ( SURFACE-AT ?auto_4702 ?auto_4722 ) ( ON ?auto_4702 ?auto_4711 ) ( CLEAR ?auto_4702 ) ( not ( = ?auto_4701 ?auto_4702 ) ) ( not ( = ?auto_4701 ?auto_4711 ) ) ( not ( = ?auto_4702 ?auto_4711 ) ) ( not ( = ?auto_4708 ?auto_4720 ) ) ( IS-CRATE ?auto_4701 ) ( not ( = ?auto_4721 ?auto_4707 ) ) ( HOIST-AT ?auto_4717 ?auto_4721 ) ( SURFACE-AT ?auto_4701 ?auto_4721 ) ( ON ?auto_4701 ?auto_4715 ) ( CLEAR ?auto_4701 ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4700 ?auto_4715 ) ) ( not ( = ?auto_4701 ?auto_4715 ) ) ( not ( = ?auto_4708 ?auto_4717 ) ) ( IS-CRATE ?auto_4700 ) ( SURFACE-AT ?auto_4700 ?auto_4713 ) ( ON ?auto_4700 ?auto_4719 ) ( CLEAR ?auto_4700 ) ( not ( = ?auto_4699 ?auto_4700 ) ) ( not ( = ?auto_4699 ?auto_4719 ) ) ( not ( = ?auto_4700 ?auto_4719 ) ) ( IS-CRATE ?auto_4699 ) ( AVAILABLE ?auto_4712 ) ( SURFACE-AT ?auto_4699 ?auto_4713 ) ( ON ?auto_4699 ?auto_4723 ) ( CLEAR ?auto_4699 ) ( not ( = ?auto_4698 ?auto_4699 ) ) ( not ( = ?auto_4698 ?auto_4723 ) ) ( not ( = ?auto_4699 ?auto_4723 ) ) ( IS-CRATE ?auto_4698 ) ( AVAILABLE ?auto_4717 ) ( SURFACE-AT ?auto_4698 ?auto_4721 ) ( ON ?auto_4698 ?auto_4718 ) ( CLEAR ?auto_4698 ) ( not ( = ?auto_4697 ?auto_4698 ) ) ( not ( = ?auto_4697 ?auto_4718 ) ) ( not ( = ?auto_4698 ?auto_4718 ) ) ( SURFACE-AT ?auto_4696 ?auto_4707 ) ( CLEAR ?auto_4696 ) ( IS-CRATE ?auto_4697 ) ( AVAILABLE ?auto_4708 ) ( AVAILABLE ?auto_4720 ) ( SURFACE-AT ?auto_4697 ?auto_4722 ) ( ON ?auto_4697 ?auto_4714 ) ( CLEAR ?auto_4697 ) ( TRUCK-AT ?auto_4706 ?auto_4707 ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( not ( = ?auto_4696 ?auto_4714 ) ) ( not ( = ?auto_4697 ?auto_4714 ) ) ( not ( = ?auto_4696 ?auto_4698 ) ) ( not ( = ?auto_4696 ?auto_4718 ) ) ( not ( = ?auto_4698 ?auto_4714 ) ) ( not ( = ?auto_4721 ?auto_4722 ) ) ( not ( = ?auto_4717 ?auto_4720 ) ) ( not ( = ?auto_4718 ?auto_4714 ) ) ( not ( = ?auto_4696 ?auto_4699 ) ) ( not ( = ?auto_4696 ?auto_4723 ) ) ( not ( = ?auto_4697 ?auto_4699 ) ) ( not ( = ?auto_4697 ?auto_4723 ) ) ( not ( = ?auto_4699 ?auto_4718 ) ) ( not ( = ?auto_4699 ?auto_4714 ) ) ( not ( = ?auto_4713 ?auto_4721 ) ) ( not ( = ?auto_4713 ?auto_4722 ) ) ( not ( = ?auto_4712 ?auto_4717 ) ) ( not ( = ?auto_4712 ?auto_4720 ) ) ( not ( = ?auto_4723 ?auto_4718 ) ) ( not ( = ?auto_4723 ?auto_4714 ) ) ( not ( = ?auto_4696 ?auto_4700 ) ) ( not ( = ?auto_4696 ?auto_4719 ) ) ( not ( = ?auto_4697 ?auto_4700 ) ) ( not ( = ?auto_4697 ?auto_4719 ) ) ( not ( = ?auto_4698 ?auto_4700 ) ) ( not ( = ?auto_4698 ?auto_4719 ) ) ( not ( = ?auto_4700 ?auto_4723 ) ) ( not ( = ?auto_4700 ?auto_4718 ) ) ( not ( = ?auto_4700 ?auto_4714 ) ) ( not ( = ?auto_4719 ?auto_4723 ) ) ( not ( = ?auto_4719 ?auto_4718 ) ) ( not ( = ?auto_4719 ?auto_4714 ) ) ( not ( = ?auto_4696 ?auto_4701 ) ) ( not ( = ?auto_4696 ?auto_4715 ) ) ( not ( = ?auto_4697 ?auto_4701 ) ) ( not ( = ?auto_4697 ?auto_4715 ) ) ( not ( = ?auto_4698 ?auto_4701 ) ) ( not ( = ?auto_4698 ?auto_4715 ) ) ( not ( = ?auto_4699 ?auto_4701 ) ) ( not ( = ?auto_4699 ?auto_4715 ) ) ( not ( = ?auto_4701 ?auto_4719 ) ) ( not ( = ?auto_4701 ?auto_4723 ) ) ( not ( = ?auto_4701 ?auto_4718 ) ) ( not ( = ?auto_4701 ?auto_4714 ) ) ( not ( = ?auto_4715 ?auto_4719 ) ) ( not ( = ?auto_4715 ?auto_4723 ) ) ( not ( = ?auto_4715 ?auto_4718 ) ) ( not ( = ?auto_4715 ?auto_4714 ) ) ( not ( = ?auto_4696 ?auto_4702 ) ) ( not ( = ?auto_4696 ?auto_4711 ) ) ( not ( = ?auto_4697 ?auto_4702 ) ) ( not ( = ?auto_4697 ?auto_4711 ) ) ( not ( = ?auto_4698 ?auto_4702 ) ) ( not ( = ?auto_4698 ?auto_4711 ) ) ( not ( = ?auto_4699 ?auto_4702 ) ) ( not ( = ?auto_4699 ?auto_4711 ) ) ( not ( = ?auto_4700 ?auto_4702 ) ) ( not ( = ?auto_4700 ?auto_4711 ) ) ( not ( = ?auto_4702 ?auto_4715 ) ) ( not ( = ?auto_4702 ?auto_4719 ) ) ( not ( = ?auto_4702 ?auto_4723 ) ) ( not ( = ?auto_4702 ?auto_4718 ) ) ( not ( = ?auto_4702 ?auto_4714 ) ) ( not ( = ?auto_4711 ?auto_4715 ) ) ( not ( = ?auto_4711 ?auto_4719 ) ) ( not ( = ?auto_4711 ?auto_4723 ) ) ( not ( = ?auto_4711 ?auto_4718 ) ) ( not ( = ?auto_4711 ?auto_4714 ) ) ( not ( = ?auto_4696 ?auto_4703 ) ) ( not ( = ?auto_4696 ?auto_4716 ) ) ( not ( = ?auto_4697 ?auto_4703 ) ) ( not ( = ?auto_4697 ?auto_4716 ) ) ( not ( = ?auto_4698 ?auto_4703 ) ) ( not ( = ?auto_4698 ?auto_4716 ) ) ( not ( = ?auto_4699 ?auto_4703 ) ) ( not ( = ?auto_4699 ?auto_4716 ) ) ( not ( = ?auto_4700 ?auto_4703 ) ) ( not ( = ?auto_4700 ?auto_4716 ) ) ( not ( = ?auto_4701 ?auto_4703 ) ) ( not ( = ?auto_4701 ?auto_4716 ) ) ( not ( = ?auto_4703 ?auto_4711 ) ) ( not ( = ?auto_4703 ?auto_4715 ) ) ( not ( = ?auto_4703 ?auto_4719 ) ) ( not ( = ?auto_4703 ?auto_4723 ) ) ( not ( = ?auto_4703 ?auto_4718 ) ) ( not ( = ?auto_4703 ?auto_4714 ) ) ( not ( = ?auto_4716 ?auto_4711 ) ) ( not ( = ?auto_4716 ?auto_4715 ) ) ( not ( = ?auto_4716 ?auto_4719 ) ) ( not ( = ?auto_4716 ?auto_4723 ) ) ( not ( = ?auto_4716 ?auto_4718 ) ) ( not ( = ?auto_4716 ?auto_4714 ) ) ( not ( = ?auto_4696 ?auto_4704 ) ) ( not ( = ?auto_4696 ?auto_4709 ) ) ( not ( = ?auto_4697 ?auto_4704 ) ) ( not ( = ?auto_4697 ?auto_4709 ) ) ( not ( = ?auto_4698 ?auto_4704 ) ) ( not ( = ?auto_4698 ?auto_4709 ) ) ( not ( = ?auto_4699 ?auto_4704 ) ) ( not ( = ?auto_4699 ?auto_4709 ) ) ( not ( = ?auto_4700 ?auto_4704 ) ) ( not ( = ?auto_4700 ?auto_4709 ) ) ( not ( = ?auto_4701 ?auto_4704 ) ) ( not ( = ?auto_4701 ?auto_4709 ) ) ( not ( = ?auto_4702 ?auto_4704 ) ) ( not ( = ?auto_4702 ?auto_4709 ) ) ( not ( = ?auto_4704 ?auto_4716 ) ) ( not ( = ?auto_4704 ?auto_4711 ) ) ( not ( = ?auto_4704 ?auto_4715 ) ) ( not ( = ?auto_4704 ?auto_4719 ) ) ( not ( = ?auto_4704 ?auto_4723 ) ) ( not ( = ?auto_4704 ?auto_4718 ) ) ( not ( = ?auto_4704 ?auto_4714 ) ) ( not ( = ?auto_4705 ?auto_4713 ) ) ( not ( = ?auto_4705 ?auto_4722 ) ) ( not ( = ?auto_4705 ?auto_4721 ) ) ( not ( = ?auto_4710 ?auto_4712 ) ) ( not ( = ?auto_4710 ?auto_4720 ) ) ( not ( = ?auto_4710 ?auto_4717 ) ) ( not ( = ?auto_4709 ?auto_4716 ) ) ( not ( = ?auto_4709 ?auto_4711 ) ) ( not ( = ?auto_4709 ?auto_4715 ) ) ( not ( = ?auto_4709 ?auto_4719 ) ) ( not ( = ?auto_4709 ?auto_4723 ) ) ( not ( = ?auto_4709 ?auto_4718 ) ) ( not ( = ?auto_4709 ?auto_4714 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4696 ?auto_4697 ?auto_4698 ?auto_4699 ?auto_4700 ?auto_4701 ?auto_4702 ?auto_4703 )
      ( MAKE-1CRATE ?auto_4703 ?auto_4704 )
      ( MAKE-8CRATE-VERIFY ?auto_4696 ?auto_4697 ?auto_4698 ?auto_4699 ?auto_4700 ?auto_4701 ?auto_4702 ?auto_4703 ?auto_4704 ) )
  )

)

