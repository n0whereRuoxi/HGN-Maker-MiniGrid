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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4493 - SURFACE
      ?auto_4494 - SURFACE
    )
    :vars
    (
      ?auto_4495 - HOIST
      ?auto_4496 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4495 ?auto_4496 ) ( SURFACE-AT ?auto_4493 ?auto_4496 ) ( CLEAR ?auto_4493 ) ( LIFTING ?auto_4495 ?auto_4494 ) ( IS-CRATE ?auto_4494 ) ( not ( = ?auto_4493 ?auto_4494 ) ) )
    :subtasks
    ( ( !DROP ?auto_4495 ?auto_4494 ?auto_4493 ?auto_4496 )
      ( MAKE-1CRATE-VERIFY ?auto_4493 ?auto_4494 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4497 - SURFACE
      ?auto_4498 - SURFACE
    )
    :vars
    (
      ?auto_4499 - HOIST
      ?auto_4500 - PLACE
      ?auto_4501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4499 ?auto_4500 ) ( SURFACE-AT ?auto_4497 ?auto_4500 ) ( CLEAR ?auto_4497 ) ( IS-CRATE ?auto_4498 ) ( not ( = ?auto_4497 ?auto_4498 ) ) ( TRUCK-AT ?auto_4501 ?auto_4500 ) ( AVAILABLE ?auto_4499 ) ( IN ?auto_4498 ?auto_4501 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4499 ?auto_4498 ?auto_4501 ?auto_4500 )
      ( MAKE-1CRATE ?auto_4497 ?auto_4498 )
      ( MAKE-1CRATE-VERIFY ?auto_4497 ?auto_4498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4502 - SURFACE
      ?auto_4503 - SURFACE
    )
    :vars
    (
      ?auto_4505 - HOIST
      ?auto_4506 - PLACE
      ?auto_4504 - TRUCK
      ?auto_4507 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4505 ?auto_4506 ) ( SURFACE-AT ?auto_4502 ?auto_4506 ) ( CLEAR ?auto_4502 ) ( IS-CRATE ?auto_4503 ) ( not ( = ?auto_4502 ?auto_4503 ) ) ( AVAILABLE ?auto_4505 ) ( IN ?auto_4503 ?auto_4504 ) ( TRUCK-AT ?auto_4504 ?auto_4507 ) ( not ( = ?auto_4507 ?auto_4506 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4504 ?auto_4507 ?auto_4506 )
      ( MAKE-1CRATE ?auto_4502 ?auto_4503 )
      ( MAKE-1CRATE-VERIFY ?auto_4502 ?auto_4503 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4508 - SURFACE
      ?auto_4509 - SURFACE
    )
    :vars
    (
      ?auto_4511 - HOIST
      ?auto_4510 - PLACE
      ?auto_4513 - TRUCK
      ?auto_4512 - PLACE
      ?auto_4514 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4511 ?auto_4510 ) ( SURFACE-AT ?auto_4508 ?auto_4510 ) ( CLEAR ?auto_4508 ) ( IS-CRATE ?auto_4509 ) ( not ( = ?auto_4508 ?auto_4509 ) ) ( AVAILABLE ?auto_4511 ) ( TRUCK-AT ?auto_4513 ?auto_4512 ) ( not ( = ?auto_4512 ?auto_4510 ) ) ( HOIST-AT ?auto_4514 ?auto_4512 ) ( LIFTING ?auto_4514 ?auto_4509 ) ( not ( = ?auto_4511 ?auto_4514 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4514 ?auto_4509 ?auto_4513 ?auto_4512 )
      ( MAKE-1CRATE ?auto_4508 ?auto_4509 )
      ( MAKE-1CRATE-VERIFY ?auto_4508 ?auto_4509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4515 - SURFACE
      ?auto_4516 - SURFACE
    )
    :vars
    (
      ?auto_4517 - HOIST
      ?auto_4518 - PLACE
      ?auto_4520 - TRUCK
      ?auto_4521 - PLACE
      ?auto_4519 - HOIST
      ?auto_4522 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4517 ?auto_4518 ) ( SURFACE-AT ?auto_4515 ?auto_4518 ) ( CLEAR ?auto_4515 ) ( IS-CRATE ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4516 ) ) ( AVAILABLE ?auto_4517 ) ( TRUCK-AT ?auto_4520 ?auto_4521 ) ( not ( = ?auto_4521 ?auto_4518 ) ) ( HOIST-AT ?auto_4519 ?auto_4521 ) ( not ( = ?auto_4517 ?auto_4519 ) ) ( AVAILABLE ?auto_4519 ) ( SURFACE-AT ?auto_4516 ?auto_4521 ) ( ON ?auto_4516 ?auto_4522 ) ( CLEAR ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4522 ) ) ( not ( = ?auto_4516 ?auto_4522 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4519 ?auto_4516 ?auto_4522 ?auto_4521 )
      ( MAKE-1CRATE ?auto_4515 ?auto_4516 )
      ( MAKE-1CRATE-VERIFY ?auto_4515 ?auto_4516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4523 - SURFACE
      ?auto_4524 - SURFACE
    )
    :vars
    (
      ?auto_4526 - HOIST
      ?auto_4527 - PLACE
      ?auto_4525 - PLACE
      ?auto_4529 - HOIST
      ?auto_4528 - SURFACE
      ?auto_4530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4526 ?auto_4527 ) ( SURFACE-AT ?auto_4523 ?auto_4527 ) ( CLEAR ?auto_4523 ) ( IS-CRATE ?auto_4524 ) ( not ( = ?auto_4523 ?auto_4524 ) ) ( AVAILABLE ?auto_4526 ) ( not ( = ?auto_4525 ?auto_4527 ) ) ( HOIST-AT ?auto_4529 ?auto_4525 ) ( not ( = ?auto_4526 ?auto_4529 ) ) ( AVAILABLE ?auto_4529 ) ( SURFACE-AT ?auto_4524 ?auto_4525 ) ( ON ?auto_4524 ?auto_4528 ) ( CLEAR ?auto_4524 ) ( not ( = ?auto_4523 ?auto_4528 ) ) ( not ( = ?auto_4524 ?auto_4528 ) ) ( TRUCK-AT ?auto_4530 ?auto_4527 ) )
    :subtasks
    ( ( !DRIVE ?auto_4530 ?auto_4527 ?auto_4525 )
      ( MAKE-1CRATE ?auto_4523 ?auto_4524 )
      ( MAKE-1CRATE-VERIFY ?auto_4523 ?auto_4524 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4536 - SURFACE
      ?auto_4537 - SURFACE
    )
    :vars
    (
      ?auto_4538 - HOIST
      ?auto_4539 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4538 ?auto_4539 ) ( SURFACE-AT ?auto_4536 ?auto_4539 ) ( CLEAR ?auto_4536 ) ( LIFTING ?auto_4538 ?auto_4537 ) ( IS-CRATE ?auto_4537 ) ( not ( = ?auto_4536 ?auto_4537 ) ) )
    :subtasks
    ( ( !DROP ?auto_4538 ?auto_4537 ?auto_4536 ?auto_4539 )
      ( MAKE-1CRATE-VERIFY ?auto_4536 ?auto_4537 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4540 - SURFACE
      ?auto_4541 - SURFACE
      ?auto_4542 - SURFACE
    )
    :vars
    (
      ?auto_4543 - HOIST
      ?auto_4544 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4543 ?auto_4544 ) ( SURFACE-AT ?auto_4541 ?auto_4544 ) ( CLEAR ?auto_4541 ) ( LIFTING ?auto_4543 ?auto_4542 ) ( IS-CRATE ?auto_4542 ) ( not ( = ?auto_4541 ?auto_4542 ) ) ( ON ?auto_4541 ?auto_4540 ) ( not ( = ?auto_4540 ?auto_4541 ) ) ( not ( = ?auto_4540 ?auto_4542 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4541 ?auto_4542 )
      ( MAKE-2CRATE-VERIFY ?auto_4540 ?auto_4541 ?auto_4542 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4545 - SURFACE
      ?auto_4546 - SURFACE
    )
    :vars
    (
      ?auto_4547 - HOIST
      ?auto_4548 - PLACE
      ?auto_4549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4547 ?auto_4548 ) ( SURFACE-AT ?auto_4545 ?auto_4548 ) ( CLEAR ?auto_4545 ) ( IS-CRATE ?auto_4546 ) ( not ( = ?auto_4545 ?auto_4546 ) ) ( TRUCK-AT ?auto_4549 ?auto_4548 ) ( AVAILABLE ?auto_4547 ) ( IN ?auto_4546 ?auto_4549 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4547 ?auto_4546 ?auto_4549 ?auto_4548 )
      ( MAKE-1CRATE ?auto_4545 ?auto_4546 )
      ( MAKE-1CRATE-VERIFY ?auto_4545 ?auto_4546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4550 - SURFACE
      ?auto_4551 - SURFACE
      ?auto_4552 - SURFACE
    )
    :vars
    (
      ?auto_4553 - HOIST
      ?auto_4555 - PLACE
      ?auto_4554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4553 ?auto_4555 ) ( SURFACE-AT ?auto_4551 ?auto_4555 ) ( CLEAR ?auto_4551 ) ( IS-CRATE ?auto_4552 ) ( not ( = ?auto_4551 ?auto_4552 ) ) ( TRUCK-AT ?auto_4554 ?auto_4555 ) ( AVAILABLE ?auto_4553 ) ( IN ?auto_4552 ?auto_4554 ) ( ON ?auto_4551 ?auto_4550 ) ( not ( = ?auto_4550 ?auto_4551 ) ) ( not ( = ?auto_4550 ?auto_4552 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4551 ?auto_4552 )
      ( MAKE-2CRATE-VERIFY ?auto_4550 ?auto_4551 ?auto_4552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4556 - SURFACE
      ?auto_4557 - SURFACE
    )
    :vars
    (
      ?auto_4558 - HOIST
      ?auto_4559 - PLACE
      ?auto_4560 - TRUCK
      ?auto_4561 - SURFACE
      ?auto_4562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4558 ?auto_4559 ) ( SURFACE-AT ?auto_4556 ?auto_4559 ) ( CLEAR ?auto_4556 ) ( IS-CRATE ?auto_4557 ) ( not ( = ?auto_4556 ?auto_4557 ) ) ( AVAILABLE ?auto_4558 ) ( IN ?auto_4557 ?auto_4560 ) ( ON ?auto_4556 ?auto_4561 ) ( not ( = ?auto_4561 ?auto_4556 ) ) ( not ( = ?auto_4561 ?auto_4557 ) ) ( TRUCK-AT ?auto_4560 ?auto_4562 ) ( not ( = ?auto_4562 ?auto_4559 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4560 ?auto_4562 ?auto_4559 )
      ( MAKE-2CRATE ?auto_4561 ?auto_4556 ?auto_4557 )
      ( MAKE-1CRATE-VERIFY ?auto_4556 ?auto_4557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4563 - SURFACE
      ?auto_4564 - SURFACE
      ?auto_4565 - SURFACE
    )
    :vars
    (
      ?auto_4569 - HOIST
      ?auto_4566 - PLACE
      ?auto_4567 - TRUCK
      ?auto_4568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4569 ?auto_4566 ) ( SURFACE-AT ?auto_4564 ?auto_4566 ) ( CLEAR ?auto_4564 ) ( IS-CRATE ?auto_4565 ) ( not ( = ?auto_4564 ?auto_4565 ) ) ( AVAILABLE ?auto_4569 ) ( IN ?auto_4565 ?auto_4567 ) ( ON ?auto_4564 ?auto_4563 ) ( not ( = ?auto_4563 ?auto_4564 ) ) ( not ( = ?auto_4563 ?auto_4565 ) ) ( TRUCK-AT ?auto_4567 ?auto_4568 ) ( not ( = ?auto_4568 ?auto_4566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4564 ?auto_4565 )
      ( MAKE-2CRATE-VERIFY ?auto_4563 ?auto_4564 ?auto_4565 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4570 - SURFACE
      ?auto_4571 - SURFACE
    )
    :vars
    (
      ?auto_4575 - HOIST
      ?auto_4572 - PLACE
      ?auto_4574 - SURFACE
      ?auto_4573 - TRUCK
      ?auto_4576 - PLACE
      ?auto_4577 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4575 ?auto_4572 ) ( SURFACE-AT ?auto_4570 ?auto_4572 ) ( CLEAR ?auto_4570 ) ( IS-CRATE ?auto_4571 ) ( not ( = ?auto_4570 ?auto_4571 ) ) ( AVAILABLE ?auto_4575 ) ( ON ?auto_4570 ?auto_4574 ) ( not ( = ?auto_4574 ?auto_4570 ) ) ( not ( = ?auto_4574 ?auto_4571 ) ) ( TRUCK-AT ?auto_4573 ?auto_4576 ) ( not ( = ?auto_4576 ?auto_4572 ) ) ( HOIST-AT ?auto_4577 ?auto_4576 ) ( LIFTING ?auto_4577 ?auto_4571 ) ( not ( = ?auto_4575 ?auto_4577 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4577 ?auto_4571 ?auto_4573 ?auto_4576 )
      ( MAKE-2CRATE ?auto_4574 ?auto_4570 ?auto_4571 )
      ( MAKE-1CRATE-VERIFY ?auto_4570 ?auto_4571 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4578 - SURFACE
      ?auto_4579 - SURFACE
      ?auto_4580 - SURFACE
    )
    :vars
    (
      ?auto_4584 - HOIST
      ?auto_4582 - PLACE
      ?auto_4585 - TRUCK
      ?auto_4581 - PLACE
      ?auto_4583 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4584 ?auto_4582 ) ( SURFACE-AT ?auto_4579 ?auto_4582 ) ( CLEAR ?auto_4579 ) ( IS-CRATE ?auto_4580 ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( AVAILABLE ?auto_4584 ) ( ON ?auto_4579 ?auto_4578 ) ( not ( = ?auto_4578 ?auto_4579 ) ) ( not ( = ?auto_4578 ?auto_4580 ) ) ( TRUCK-AT ?auto_4585 ?auto_4581 ) ( not ( = ?auto_4581 ?auto_4582 ) ) ( HOIST-AT ?auto_4583 ?auto_4581 ) ( LIFTING ?auto_4583 ?auto_4580 ) ( not ( = ?auto_4584 ?auto_4583 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4579 ?auto_4580 )
      ( MAKE-2CRATE-VERIFY ?auto_4578 ?auto_4579 ?auto_4580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4586 - SURFACE
      ?auto_4587 - SURFACE
    )
    :vars
    (
      ?auto_4589 - HOIST
      ?auto_4592 - PLACE
      ?auto_4590 - SURFACE
      ?auto_4588 - TRUCK
      ?auto_4593 - PLACE
      ?auto_4591 - HOIST
      ?auto_4594 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4589 ?auto_4592 ) ( SURFACE-AT ?auto_4586 ?auto_4592 ) ( CLEAR ?auto_4586 ) ( IS-CRATE ?auto_4587 ) ( not ( = ?auto_4586 ?auto_4587 ) ) ( AVAILABLE ?auto_4589 ) ( ON ?auto_4586 ?auto_4590 ) ( not ( = ?auto_4590 ?auto_4586 ) ) ( not ( = ?auto_4590 ?auto_4587 ) ) ( TRUCK-AT ?auto_4588 ?auto_4593 ) ( not ( = ?auto_4593 ?auto_4592 ) ) ( HOIST-AT ?auto_4591 ?auto_4593 ) ( not ( = ?auto_4589 ?auto_4591 ) ) ( AVAILABLE ?auto_4591 ) ( SURFACE-AT ?auto_4587 ?auto_4593 ) ( ON ?auto_4587 ?auto_4594 ) ( CLEAR ?auto_4587 ) ( not ( = ?auto_4586 ?auto_4594 ) ) ( not ( = ?auto_4587 ?auto_4594 ) ) ( not ( = ?auto_4590 ?auto_4594 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4591 ?auto_4587 ?auto_4594 ?auto_4593 )
      ( MAKE-2CRATE ?auto_4590 ?auto_4586 ?auto_4587 )
      ( MAKE-1CRATE-VERIFY ?auto_4586 ?auto_4587 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4595 - SURFACE
      ?auto_4596 - SURFACE
      ?auto_4597 - SURFACE
    )
    :vars
    (
      ?auto_4602 - HOIST
      ?auto_4599 - PLACE
      ?auto_4598 - TRUCK
      ?auto_4600 - PLACE
      ?auto_4601 - HOIST
      ?auto_4603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4602 ?auto_4599 ) ( SURFACE-AT ?auto_4596 ?auto_4599 ) ( CLEAR ?auto_4596 ) ( IS-CRATE ?auto_4597 ) ( not ( = ?auto_4596 ?auto_4597 ) ) ( AVAILABLE ?auto_4602 ) ( ON ?auto_4596 ?auto_4595 ) ( not ( = ?auto_4595 ?auto_4596 ) ) ( not ( = ?auto_4595 ?auto_4597 ) ) ( TRUCK-AT ?auto_4598 ?auto_4600 ) ( not ( = ?auto_4600 ?auto_4599 ) ) ( HOIST-AT ?auto_4601 ?auto_4600 ) ( not ( = ?auto_4602 ?auto_4601 ) ) ( AVAILABLE ?auto_4601 ) ( SURFACE-AT ?auto_4597 ?auto_4600 ) ( ON ?auto_4597 ?auto_4603 ) ( CLEAR ?auto_4597 ) ( not ( = ?auto_4596 ?auto_4603 ) ) ( not ( = ?auto_4597 ?auto_4603 ) ) ( not ( = ?auto_4595 ?auto_4603 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4596 ?auto_4597 )
      ( MAKE-2CRATE-VERIFY ?auto_4595 ?auto_4596 ?auto_4597 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4604 - SURFACE
      ?auto_4605 - SURFACE
    )
    :vars
    (
      ?auto_4606 - HOIST
      ?auto_4607 - PLACE
      ?auto_4608 - SURFACE
      ?auto_4609 - PLACE
      ?auto_4611 - HOIST
      ?auto_4610 - SURFACE
      ?auto_4612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4606 ?auto_4607 ) ( SURFACE-AT ?auto_4604 ?auto_4607 ) ( CLEAR ?auto_4604 ) ( IS-CRATE ?auto_4605 ) ( not ( = ?auto_4604 ?auto_4605 ) ) ( AVAILABLE ?auto_4606 ) ( ON ?auto_4604 ?auto_4608 ) ( not ( = ?auto_4608 ?auto_4604 ) ) ( not ( = ?auto_4608 ?auto_4605 ) ) ( not ( = ?auto_4609 ?auto_4607 ) ) ( HOIST-AT ?auto_4611 ?auto_4609 ) ( not ( = ?auto_4606 ?auto_4611 ) ) ( AVAILABLE ?auto_4611 ) ( SURFACE-AT ?auto_4605 ?auto_4609 ) ( ON ?auto_4605 ?auto_4610 ) ( CLEAR ?auto_4605 ) ( not ( = ?auto_4604 ?auto_4610 ) ) ( not ( = ?auto_4605 ?auto_4610 ) ) ( not ( = ?auto_4608 ?auto_4610 ) ) ( TRUCK-AT ?auto_4612 ?auto_4607 ) )
    :subtasks
    ( ( !DRIVE ?auto_4612 ?auto_4607 ?auto_4609 )
      ( MAKE-2CRATE ?auto_4608 ?auto_4604 ?auto_4605 )
      ( MAKE-1CRATE-VERIFY ?auto_4604 ?auto_4605 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4613 - SURFACE
      ?auto_4614 - SURFACE
      ?auto_4615 - SURFACE
    )
    :vars
    (
      ?auto_4616 - HOIST
      ?auto_4620 - PLACE
      ?auto_4619 - PLACE
      ?auto_4621 - HOIST
      ?auto_4618 - SURFACE
      ?auto_4617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4616 ?auto_4620 ) ( SURFACE-AT ?auto_4614 ?auto_4620 ) ( CLEAR ?auto_4614 ) ( IS-CRATE ?auto_4615 ) ( not ( = ?auto_4614 ?auto_4615 ) ) ( AVAILABLE ?auto_4616 ) ( ON ?auto_4614 ?auto_4613 ) ( not ( = ?auto_4613 ?auto_4614 ) ) ( not ( = ?auto_4613 ?auto_4615 ) ) ( not ( = ?auto_4619 ?auto_4620 ) ) ( HOIST-AT ?auto_4621 ?auto_4619 ) ( not ( = ?auto_4616 ?auto_4621 ) ) ( AVAILABLE ?auto_4621 ) ( SURFACE-AT ?auto_4615 ?auto_4619 ) ( ON ?auto_4615 ?auto_4618 ) ( CLEAR ?auto_4615 ) ( not ( = ?auto_4614 ?auto_4618 ) ) ( not ( = ?auto_4615 ?auto_4618 ) ) ( not ( = ?auto_4613 ?auto_4618 ) ) ( TRUCK-AT ?auto_4617 ?auto_4620 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4614 ?auto_4615 )
      ( MAKE-2CRATE-VERIFY ?auto_4613 ?auto_4614 ?auto_4615 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4622 - SURFACE
      ?auto_4623 - SURFACE
    )
    :vars
    (
      ?auto_4629 - HOIST
      ?auto_4628 - PLACE
      ?auto_4625 - SURFACE
      ?auto_4630 - PLACE
      ?auto_4627 - HOIST
      ?auto_4626 - SURFACE
      ?auto_4624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4629 ?auto_4628 ) ( IS-CRATE ?auto_4623 ) ( not ( = ?auto_4622 ?auto_4623 ) ) ( not ( = ?auto_4625 ?auto_4622 ) ) ( not ( = ?auto_4625 ?auto_4623 ) ) ( not ( = ?auto_4630 ?auto_4628 ) ) ( HOIST-AT ?auto_4627 ?auto_4630 ) ( not ( = ?auto_4629 ?auto_4627 ) ) ( AVAILABLE ?auto_4627 ) ( SURFACE-AT ?auto_4623 ?auto_4630 ) ( ON ?auto_4623 ?auto_4626 ) ( CLEAR ?auto_4623 ) ( not ( = ?auto_4622 ?auto_4626 ) ) ( not ( = ?auto_4623 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( TRUCK-AT ?auto_4624 ?auto_4628 ) ( SURFACE-AT ?auto_4625 ?auto_4628 ) ( CLEAR ?auto_4625 ) ( LIFTING ?auto_4629 ?auto_4622 ) ( IS-CRATE ?auto_4622 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4625 ?auto_4622 )
      ( MAKE-2CRATE ?auto_4625 ?auto_4622 ?auto_4623 )
      ( MAKE-1CRATE-VERIFY ?auto_4622 ?auto_4623 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4631 - SURFACE
      ?auto_4632 - SURFACE
      ?auto_4633 - SURFACE
    )
    :vars
    (
      ?auto_4639 - HOIST
      ?auto_4637 - PLACE
      ?auto_4635 - PLACE
      ?auto_4638 - HOIST
      ?auto_4636 - SURFACE
      ?auto_4634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4639 ?auto_4637 ) ( IS-CRATE ?auto_4633 ) ( not ( = ?auto_4632 ?auto_4633 ) ) ( not ( = ?auto_4631 ?auto_4632 ) ) ( not ( = ?auto_4631 ?auto_4633 ) ) ( not ( = ?auto_4635 ?auto_4637 ) ) ( HOIST-AT ?auto_4638 ?auto_4635 ) ( not ( = ?auto_4639 ?auto_4638 ) ) ( AVAILABLE ?auto_4638 ) ( SURFACE-AT ?auto_4633 ?auto_4635 ) ( ON ?auto_4633 ?auto_4636 ) ( CLEAR ?auto_4633 ) ( not ( = ?auto_4632 ?auto_4636 ) ) ( not ( = ?auto_4633 ?auto_4636 ) ) ( not ( = ?auto_4631 ?auto_4636 ) ) ( TRUCK-AT ?auto_4634 ?auto_4637 ) ( SURFACE-AT ?auto_4631 ?auto_4637 ) ( CLEAR ?auto_4631 ) ( LIFTING ?auto_4639 ?auto_4632 ) ( IS-CRATE ?auto_4632 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4632 ?auto_4633 )
      ( MAKE-2CRATE-VERIFY ?auto_4631 ?auto_4632 ?auto_4633 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4640 - SURFACE
      ?auto_4641 - SURFACE
    )
    :vars
    (
      ?auto_4643 - HOIST
      ?auto_4646 - PLACE
      ?auto_4642 - SURFACE
      ?auto_4644 - PLACE
      ?auto_4648 - HOIST
      ?auto_4645 - SURFACE
      ?auto_4647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4643 ?auto_4646 ) ( IS-CRATE ?auto_4641 ) ( not ( = ?auto_4640 ?auto_4641 ) ) ( not ( = ?auto_4642 ?auto_4640 ) ) ( not ( = ?auto_4642 ?auto_4641 ) ) ( not ( = ?auto_4644 ?auto_4646 ) ) ( HOIST-AT ?auto_4648 ?auto_4644 ) ( not ( = ?auto_4643 ?auto_4648 ) ) ( AVAILABLE ?auto_4648 ) ( SURFACE-AT ?auto_4641 ?auto_4644 ) ( ON ?auto_4641 ?auto_4645 ) ( CLEAR ?auto_4641 ) ( not ( = ?auto_4640 ?auto_4645 ) ) ( not ( = ?auto_4641 ?auto_4645 ) ) ( not ( = ?auto_4642 ?auto_4645 ) ) ( TRUCK-AT ?auto_4647 ?auto_4646 ) ( SURFACE-AT ?auto_4642 ?auto_4646 ) ( CLEAR ?auto_4642 ) ( IS-CRATE ?auto_4640 ) ( AVAILABLE ?auto_4643 ) ( IN ?auto_4640 ?auto_4647 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4643 ?auto_4640 ?auto_4647 ?auto_4646 )
      ( MAKE-2CRATE ?auto_4642 ?auto_4640 ?auto_4641 )
      ( MAKE-1CRATE-VERIFY ?auto_4640 ?auto_4641 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4649 - SURFACE
      ?auto_4650 - SURFACE
      ?auto_4651 - SURFACE
    )
    :vars
    (
      ?auto_4655 - HOIST
      ?auto_4653 - PLACE
      ?auto_4652 - PLACE
      ?auto_4654 - HOIST
      ?auto_4657 - SURFACE
      ?auto_4656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4655 ?auto_4653 ) ( IS-CRATE ?auto_4651 ) ( not ( = ?auto_4650 ?auto_4651 ) ) ( not ( = ?auto_4649 ?auto_4650 ) ) ( not ( = ?auto_4649 ?auto_4651 ) ) ( not ( = ?auto_4652 ?auto_4653 ) ) ( HOIST-AT ?auto_4654 ?auto_4652 ) ( not ( = ?auto_4655 ?auto_4654 ) ) ( AVAILABLE ?auto_4654 ) ( SURFACE-AT ?auto_4651 ?auto_4652 ) ( ON ?auto_4651 ?auto_4657 ) ( CLEAR ?auto_4651 ) ( not ( = ?auto_4650 ?auto_4657 ) ) ( not ( = ?auto_4651 ?auto_4657 ) ) ( not ( = ?auto_4649 ?auto_4657 ) ) ( TRUCK-AT ?auto_4656 ?auto_4653 ) ( SURFACE-AT ?auto_4649 ?auto_4653 ) ( CLEAR ?auto_4649 ) ( IS-CRATE ?auto_4650 ) ( AVAILABLE ?auto_4655 ) ( IN ?auto_4650 ?auto_4656 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4650 ?auto_4651 )
      ( MAKE-2CRATE-VERIFY ?auto_4649 ?auto_4650 ?auto_4651 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4658 - SURFACE
      ?auto_4659 - SURFACE
    )
    :vars
    (
      ?auto_4662 - HOIST
      ?auto_4660 - PLACE
      ?auto_4661 - SURFACE
      ?auto_4666 - PLACE
      ?auto_4663 - HOIST
      ?auto_4664 - SURFACE
      ?auto_4665 - TRUCK
      ?auto_4667 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4662 ?auto_4660 ) ( IS-CRATE ?auto_4659 ) ( not ( = ?auto_4658 ?auto_4659 ) ) ( not ( = ?auto_4661 ?auto_4658 ) ) ( not ( = ?auto_4661 ?auto_4659 ) ) ( not ( = ?auto_4666 ?auto_4660 ) ) ( HOIST-AT ?auto_4663 ?auto_4666 ) ( not ( = ?auto_4662 ?auto_4663 ) ) ( AVAILABLE ?auto_4663 ) ( SURFACE-AT ?auto_4659 ?auto_4666 ) ( ON ?auto_4659 ?auto_4664 ) ( CLEAR ?auto_4659 ) ( not ( = ?auto_4658 ?auto_4664 ) ) ( not ( = ?auto_4659 ?auto_4664 ) ) ( not ( = ?auto_4661 ?auto_4664 ) ) ( SURFACE-AT ?auto_4661 ?auto_4660 ) ( CLEAR ?auto_4661 ) ( IS-CRATE ?auto_4658 ) ( AVAILABLE ?auto_4662 ) ( IN ?auto_4658 ?auto_4665 ) ( TRUCK-AT ?auto_4665 ?auto_4667 ) ( not ( = ?auto_4667 ?auto_4660 ) ) ( not ( = ?auto_4666 ?auto_4667 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4665 ?auto_4667 ?auto_4660 )
      ( MAKE-2CRATE ?auto_4661 ?auto_4658 ?auto_4659 )
      ( MAKE-1CRATE-VERIFY ?auto_4658 ?auto_4659 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4668 - SURFACE
      ?auto_4669 - SURFACE
      ?auto_4670 - SURFACE
    )
    :vars
    (
      ?auto_4675 - HOIST
      ?auto_4672 - PLACE
      ?auto_4676 - PLACE
      ?auto_4674 - HOIST
      ?auto_4671 - SURFACE
      ?auto_4677 - TRUCK
      ?auto_4673 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4675 ?auto_4672 ) ( IS-CRATE ?auto_4670 ) ( not ( = ?auto_4669 ?auto_4670 ) ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( not ( = ?auto_4668 ?auto_4670 ) ) ( not ( = ?auto_4676 ?auto_4672 ) ) ( HOIST-AT ?auto_4674 ?auto_4676 ) ( not ( = ?auto_4675 ?auto_4674 ) ) ( AVAILABLE ?auto_4674 ) ( SURFACE-AT ?auto_4670 ?auto_4676 ) ( ON ?auto_4670 ?auto_4671 ) ( CLEAR ?auto_4670 ) ( not ( = ?auto_4669 ?auto_4671 ) ) ( not ( = ?auto_4670 ?auto_4671 ) ) ( not ( = ?auto_4668 ?auto_4671 ) ) ( SURFACE-AT ?auto_4668 ?auto_4672 ) ( CLEAR ?auto_4668 ) ( IS-CRATE ?auto_4669 ) ( AVAILABLE ?auto_4675 ) ( IN ?auto_4669 ?auto_4677 ) ( TRUCK-AT ?auto_4677 ?auto_4673 ) ( not ( = ?auto_4673 ?auto_4672 ) ) ( not ( = ?auto_4676 ?auto_4673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4669 ?auto_4670 )
      ( MAKE-2CRATE-VERIFY ?auto_4668 ?auto_4669 ?auto_4670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4678 - SURFACE
      ?auto_4679 - SURFACE
    )
    :vars
    (
      ?auto_4682 - HOIST
      ?auto_4680 - PLACE
      ?auto_4686 - SURFACE
      ?auto_4681 - PLACE
      ?auto_4683 - HOIST
      ?auto_4684 - SURFACE
      ?auto_4687 - TRUCK
      ?auto_4685 - PLACE
      ?auto_4688 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4682 ?auto_4680 ) ( IS-CRATE ?auto_4679 ) ( not ( = ?auto_4678 ?auto_4679 ) ) ( not ( = ?auto_4686 ?auto_4678 ) ) ( not ( = ?auto_4686 ?auto_4679 ) ) ( not ( = ?auto_4681 ?auto_4680 ) ) ( HOIST-AT ?auto_4683 ?auto_4681 ) ( not ( = ?auto_4682 ?auto_4683 ) ) ( AVAILABLE ?auto_4683 ) ( SURFACE-AT ?auto_4679 ?auto_4681 ) ( ON ?auto_4679 ?auto_4684 ) ( CLEAR ?auto_4679 ) ( not ( = ?auto_4678 ?auto_4684 ) ) ( not ( = ?auto_4679 ?auto_4684 ) ) ( not ( = ?auto_4686 ?auto_4684 ) ) ( SURFACE-AT ?auto_4686 ?auto_4680 ) ( CLEAR ?auto_4686 ) ( IS-CRATE ?auto_4678 ) ( AVAILABLE ?auto_4682 ) ( TRUCK-AT ?auto_4687 ?auto_4685 ) ( not ( = ?auto_4685 ?auto_4680 ) ) ( not ( = ?auto_4681 ?auto_4685 ) ) ( HOIST-AT ?auto_4688 ?auto_4685 ) ( LIFTING ?auto_4688 ?auto_4678 ) ( not ( = ?auto_4682 ?auto_4688 ) ) ( not ( = ?auto_4683 ?auto_4688 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4688 ?auto_4678 ?auto_4687 ?auto_4685 )
      ( MAKE-2CRATE ?auto_4686 ?auto_4678 ?auto_4679 )
      ( MAKE-1CRATE-VERIFY ?auto_4678 ?auto_4679 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4689 - SURFACE
      ?auto_4690 - SURFACE
      ?auto_4691 - SURFACE
    )
    :vars
    (
      ?auto_4693 - HOIST
      ?auto_4698 - PLACE
      ?auto_4692 - PLACE
      ?auto_4695 - HOIST
      ?auto_4696 - SURFACE
      ?auto_4694 - TRUCK
      ?auto_4699 - PLACE
      ?auto_4697 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4693 ?auto_4698 ) ( IS-CRATE ?auto_4691 ) ( not ( = ?auto_4690 ?auto_4691 ) ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( not ( = ?auto_4689 ?auto_4691 ) ) ( not ( = ?auto_4692 ?auto_4698 ) ) ( HOIST-AT ?auto_4695 ?auto_4692 ) ( not ( = ?auto_4693 ?auto_4695 ) ) ( AVAILABLE ?auto_4695 ) ( SURFACE-AT ?auto_4691 ?auto_4692 ) ( ON ?auto_4691 ?auto_4696 ) ( CLEAR ?auto_4691 ) ( not ( = ?auto_4690 ?auto_4696 ) ) ( not ( = ?auto_4691 ?auto_4696 ) ) ( not ( = ?auto_4689 ?auto_4696 ) ) ( SURFACE-AT ?auto_4689 ?auto_4698 ) ( CLEAR ?auto_4689 ) ( IS-CRATE ?auto_4690 ) ( AVAILABLE ?auto_4693 ) ( TRUCK-AT ?auto_4694 ?auto_4699 ) ( not ( = ?auto_4699 ?auto_4698 ) ) ( not ( = ?auto_4692 ?auto_4699 ) ) ( HOIST-AT ?auto_4697 ?auto_4699 ) ( LIFTING ?auto_4697 ?auto_4690 ) ( not ( = ?auto_4693 ?auto_4697 ) ) ( not ( = ?auto_4695 ?auto_4697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4690 ?auto_4691 )
      ( MAKE-2CRATE-VERIFY ?auto_4689 ?auto_4690 ?auto_4691 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4700 - SURFACE
      ?auto_4701 - SURFACE
    )
    :vars
    (
      ?auto_4709 - HOIST
      ?auto_4708 - PLACE
      ?auto_4710 - SURFACE
      ?auto_4705 - PLACE
      ?auto_4707 - HOIST
      ?auto_4702 - SURFACE
      ?auto_4703 - TRUCK
      ?auto_4706 - PLACE
      ?auto_4704 - HOIST
      ?auto_4711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4709 ?auto_4708 ) ( IS-CRATE ?auto_4701 ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4710 ?auto_4700 ) ) ( not ( = ?auto_4710 ?auto_4701 ) ) ( not ( = ?auto_4705 ?auto_4708 ) ) ( HOIST-AT ?auto_4707 ?auto_4705 ) ( not ( = ?auto_4709 ?auto_4707 ) ) ( AVAILABLE ?auto_4707 ) ( SURFACE-AT ?auto_4701 ?auto_4705 ) ( ON ?auto_4701 ?auto_4702 ) ( CLEAR ?auto_4701 ) ( not ( = ?auto_4700 ?auto_4702 ) ) ( not ( = ?auto_4701 ?auto_4702 ) ) ( not ( = ?auto_4710 ?auto_4702 ) ) ( SURFACE-AT ?auto_4710 ?auto_4708 ) ( CLEAR ?auto_4710 ) ( IS-CRATE ?auto_4700 ) ( AVAILABLE ?auto_4709 ) ( TRUCK-AT ?auto_4703 ?auto_4706 ) ( not ( = ?auto_4706 ?auto_4708 ) ) ( not ( = ?auto_4705 ?auto_4706 ) ) ( HOIST-AT ?auto_4704 ?auto_4706 ) ( not ( = ?auto_4709 ?auto_4704 ) ) ( not ( = ?auto_4707 ?auto_4704 ) ) ( AVAILABLE ?auto_4704 ) ( SURFACE-AT ?auto_4700 ?auto_4706 ) ( ON ?auto_4700 ?auto_4711 ) ( CLEAR ?auto_4700 ) ( not ( = ?auto_4700 ?auto_4711 ) ) ( not ( = ?auto_4701 ?auto_4711 ) ) ( not ( = ?auto_4710 ?auto_4711 ) ) ( not ( = ?auto_4702 ?auto_4711 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4704 ?auto_4700 ?auto_4711 ?auto_4706 )
      ( MAKE-2CRATE ?auto_4710 ?auto_4700 ?auto_4701 )
      ( MAKE-1CRATE-VERIFY ?auto_4700 ?auto_4701 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4712 - SURFACE
      ?auto_4713 - SURFACE
      ?auto_4714 - SURFACE
    )
    :vars
    (
      ?auto_4723 - HOIST
      ?auto_4720 - PLACE
      ?auto_4715 - PLACE
      ?auto_4718 - HOIST
      ?auto_4721 - SURFACE
      ?auto_4716 - TRUCK
      ?auto_4717 - PLACE
      ?auto_4719 - HOIST
      ?auto_4722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4723 ?auto_4720 ) ( IS-CRATE ?auto_4714 ) ( not ( = ?auto_4713 ?auto_4714 ) ) ( not ( = ?auto_4712 ?auto_4713 ) ) ( not ( = ?auto_4712 ?auto_4714 ) ) ( not ( = ?auto_4715 ?auto_4720 ) ) ( HOIST-AT ?auto_4718 ?auto_4715 ) ( not ( = ?auto_4723 ?auto_4718 ) ) ( AVAILABLE ?auto_4718 ) ( SURFACE-AT ?auto_4714 ?auto_4715 ) ( ON ?auto_4714 ?auto_4721 ) ( CLEAR ?auto_4714 ) ( not ( = ?auto_4713 ?auto_4721 ) ) ( not ( = ?auto_4714 ?auto_4721 ) ) ( not ( = ?auto_4712 ?auto_4721 ) ) ( SURFACE-AT ?auto_4712 ?auto_4720 ) ( CLEAR ?auto_4712 ) ( IS-CRATE ?auto_4713 ) ( AVAILABLE ?auto_4723 ) ( TRUCK-AT ?auto_4716 ?auto_4717 ) ( not ( = ?auto_4717 ?auto_4720 ) ) ( not ( = ?auto_4715 ?auto_4717 ) ) ( HOIST-AT ?auto_4719 ?auto_4717 ) ( not ( = ?auto_4723 ?auto_4719 ) ) ( not ( = ?auto_4718 ?auto_4719 ) ) ( AVAILABLE ?auto_4719 ) ( SURFACE-AT ?auto_4713 ?auto_4717 ) ( ON ?auto_4713 ?auto_4722 ) ( CLEAR ?auto_4713 ) ( not ( = ?auto_4713 ?auto_4722 ) ) ( not ( = ?auto_4714 ?auto_4722 ) ) ( not ( = ?auto_4712 ?auto_4722 ) ) ( not ( = ?auto_4721 ?auto_4722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4713 ?auto_4714 )
      ( MAKE-2CRATE-VERIFY ?auto_4712 ?auto_4713 ?auto_4714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4724 - SURFACE
      ?auto_4725 - SURFACE
    )
    :vars
    (
      ?auto_4726 - HOIST
      ?auto_4727 - PLACE
      ?auto_4735 - SURFACE
      ?auto_4734 - PLACE
      ?auto_4728 - HOIST
      ?auto_4732 - SURFACE
      ?auto_4731 - PLACE
      ?auto_4733 - HOIST
      ?auto_4730 - SURFACE
      ?auto_4729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4726 ?auto_4727 ) ( IS-CRATE ?auto_4725 ) ( not ( = ?auto_4724 ?auto_4725 ) ) ( not ( = ?auto_4735 ?auto_4724 ) ) ( not ( = ?auto_4735 ?auto_4725 ) ) ( not ( = ?auto_4734 ?auto_4727 ) ) ( HOIST-AT ?auto_4728 ?auto_4734 ) ( not ( = ?auto_4726 ?auto_4728 ) ) ( AVAILABLE ?auto_4728 ) ( SURFACE-AT ?auto_4725 ?auto_4734 ) ( ON ?auto_4725 ?auto_4732 ) ( CLEAR ?auto_4725 ) ( not ( = ?auto_4724 ?auto_4732 ) ) ( not ( = ?auto_4725 ?auto_4732 ) ) ( not ( = ?auto_4735 ?auto_4732 ) ) ( SURFACE-AT ?auto_4735 ?auto_4727 ) ( CLEAR ?auto_4735 ) ( IS-CRATE ?auto_4724 ) ( AVAILABLE ?auto_4726 ) ( not ( = ?auto_4731 ?auto_4727 ) ) ( not ( = ?auto_4734 ?auto_4731 ) ) ( HOIST-AT ?auto_4733 ?auto_4731 ) ( not ( = ?auto_4726 ?auto_4733 ) ) ( not ( = ?auto_4728 ?auto_4733 ) ) ( AVAILABLE ?auto_4733 ) ( SURFACE-AT ?auto_4724 ?auto_4731 ) ( ON ?auto_4724 ?auto_4730 ) ( CLEAR ?auto_4724 ) ( not ( = ?auto_4724 ?auto_4730 ) ) ( not ( = ?auto_4725 ?auto_4730 ) ) ( not ( = ?auto_4735 ?auto_4730 ) ) ( not ( = ?auto_4732 ?auto_4730 ) ) ( TRUCK-AT ?auto_4729 ?auto_4727 ) )
    :subtasks
    ( ( !DRIVE ?auto_4729 ?auto_4727 ?auto_4731 )
      ( MAKE-2CRATE ?auto_4735 ?auto_4724 ?auto_4725 )
      ( MAKE-1CRATE-VERIFY ?auto_4724 ?auto_4725 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4736 - SURFACE
      ?auto_4737 - SURFACE
      ?auto_4738 - SURFACE
    )
    :vars
    (
      ?auto_4740 - HOIST
      ?auto_4744 - PLACE
      ?auto_4747 - PLACE
      ?auto_4743 - HOIST
      ?auto_4741 - SURFACE
      ?auto_4739 - PLACE
      ?auto_4746 - HOIST
      ?auto_4742 - SURFACE
      ?auto_4745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4740 ?auto_4744 ) ( IS-CRATE ?auto_4738 ) ( not ( = ?auto_4737 ?auto_4738 ) ) ( not ( = ?auto_4736 ?auto_4737 ) ) ( not ( = ?auto_4736 ?auto_4738 ) ) ( not ( = ?auto_4747 ?auto_4744 ) ) ( HOIST-AT ?auto_4743 ?auto_4747 ) ( not ( = ?auto_4740 ?auto_4743 ) ) ( AVAILABLE ?auto_4743 ) ( SURFACE-AT ?auto_4738 ?auto_4747 ) ( ON ?auto_4738 ?auto_4741 ) ( CLEAR ?auto_4738 ) ( not ( = ?auto_4737 ?auto_4741 ) ) ( not ( = ?auto_4738 ?auto_4741 ) ) ( not ( = ?auto_4736 ?auto_4741 ) ) ( SURFACE-AT ?auto_4736 ?auto_4744 ) ( CLEAR ?auto_4736 ) ( IS-CRATE ?auto_4737 ) ( AVAILABLE ?auto_4740 ) ( not ( = ?auto_4739 ?auto_4744 ) ) ( not ( = ?auto_4747 ?auto_4739 ) ) ( HOIST-AT ?auto_4746 ?auto_4739 ) ( not ( = ?auto_4740 ?auto_4746 ) ) ( not ( = ?auto_4743 ?auto_4746 ) ) ( AVAILABLE ?auto_4746 ) ( SURFACE-AT ?auto_4737 ?auto_4739 ) ( ON ?auto_4737 ?auto_4742 ) ( CLEAR ?auto_4737 ) ( not ( = ?auto_4737 ?auto_4742 ) ) ( not ( = ?auto_4738 ?auto_4742 ) ) ( not ( = ?auto_4736 ?auto_4742 ) ) ( not ( = ?auto_4741 ?auto_4742 ) ) ( TRUCK-AT ?auto_4745 ?auto_4744 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4737 ?auto_4738 )
      ( MAKE-2CRATE-VERIFY ?auto_4736 ?auto_4737 ?auto_4738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4757 - SURFACE
      ?auto_4758 - SURFACE
    )
    :vars
    (
      ?auto_4759 - HOIST
      ?auto_4760 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4759 ?auto_4760 ) ( SURFACE-AT ?auto_4757 ?auto_4760 ) ( CLEAR ?auto_4757 ) ( LIFTING ?auto_4759 ?auto_4758 ) ( IS-CRATE ?auto_4758 ) ( not ( = ?auto_4757 ?auto_4758 ) ) )
    :subtasks
    ( ( !DROP ?auto_4759 ?auto_4758 ?auto_4757 ?auto_4760 )
      ( MAKE-1CRATE-VERIFY ?auto_4757 ?auto_4758 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4761 - SURFACE
      ?auto_4762 - SURFACE
      ?auto_4763 - SURFACE
    )
    :vars
    (
      ?auto_4764 - HOIST
      ?auto_4765 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4764 ?auto_4765 ) ( SURFACE-AT ?auto_4762 ?auto_4765 ) ( CLEAR ?auto_4762 ) ( LIFTING ?auto_4764 ?auto_4763 ) ( IS-CRATE ?auto_4763 ) ( not ( = ?auto_4762 ?auto_4763 ) ) ( ON ?auto_4762 ?auto_4761 ) ( not ( = ?auto_4761 ?auto_4762 ) ) ( not ( = ?auto_4761 ?auto_4763 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4762 ?auto_4763 )
      ( MAKE-2CRATE-VERIFY ?auto_4761 ?auto_4762 ?auto_4763 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4766 - SURFACE
      ?auto_4767 - SURFACE
      ?auto_4768 - SURFACE
      ?auto_4769 - SURFACE
    )
    :vars
    (
      ?auto_4770 - HOIST
      ?auto_4771 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4770 ?auto_4771 ) ( SURFACE-AT ?auto_4768 ?auto_4771 ) ( CLEAR ?auto_4768 ) ( LIFTING ?auto_4770 ?auto_4769 ) ( IS-CRATE ?auto_4769 ) ( not ( = ?auto_4768 ?auto_4769 ) ) ( ON ?auto_4767 ?auto_4766 ) ( ON ?auto_4768 ?auto_4767 ) ( not ( = ?auto_4766 ?auto_4767 ) ) ( not ( = ?auto_4766 ?auto_4768 ) ) ( not ( = ?auto_4766 ?auto_4769 ) ) ( not ( = ?auto_4767 ?auto_4768 ) ) ( not ( = ?auto_4767 ?auto_4769 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4768 ?auto_4769 )
      ( MAKE-3CRATE-VERIFY ?auto_4766 ?auto_4767 ?auto_4768 ?auto_4769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4772 - SURFACE
      ?auto_4773 - SURFACE
    )
    :vars
    (
      ?auto_4774 - HOIST
      ?auto_4775 - PLACE
      ?auto_4776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4774 ?auto_4775 ) ( SURFACE-AT ?auto_4772 ?auto_4775 ) ( CLEAR ?auto_4772 ) ( IS-CRATE ?auto_4773 ) ( not ( = ?auto_4772 ?auto_4773 ) ) ( TRUCK-AT ?auto_4776 ?auto_4775 ) ( AVAILABLE ?auto_4774 ) ( IN ?auto_4773 ?auto_4776 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4774 ?auto_4773 ?auto_4776 ?auto_4775 )
      ( MAKE-1CRATE ?auto_4772 ?auto_4773 )
      ( MAKE-1CRATE-VERIFY ?auto_4772 ?auto_4773 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4777 - SURFACE
      ?auto_4778 - SURFACE
      ?auto_4779 - SURFACE
    )
    :vars
    (
      ?auto_4781 - HOIST
      ?auto_4780 - PLACE
      ?auto_4782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4781 ?auto_4780 ) ( SURFACE-AT ?auto_4778 ?auto_4780 ) ( CLEAR ?auto_4778 ) ( IS-CRATE ?auto_4779 ) ( not ( = ?auto_4778 ?auto_4779 ) ) ( TRUCK-AT ?auto_4782 ?auto_4780 ) ( AVAILABLE ?auto_4781 ) ( IN ?auto_4779 ?auto_4782 ) ( ON ?auto_4778 ?auto_4777 ) ( not ( = ?auto_4777 ?auto_4778 ) ) ( not ( = ?auto_4777 ?auto_4779 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4778 ?auto_4779 )
      ( MAKE-2CRATE-VERIFY ?auto_4777 ?auto_4778 ?auto_4779 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4783 - SURFACE
      ?auto_4784 - SURFACE
      ?auto_4785 - SURFACE
      ?auto_4786 - SURFACE
    )
    :vars
    (
      ?auto_4789 - HOIST
      ?auto_4788 - PLACE
      ?auto_4787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4789 ?auto_4788 ) ( SURFACE-AT ?auto_4785 ?auto_4788 ) ( CLEAR ?auto_4785 ) ( IS-CRATE ?auto_4786 ) ( not ( = ?auto_4785 ?auto_4786 ) ) ( TRUCK-AT ?auto_4787 ?auto_4788 ) ( AVAILABLE ?auto_4789 ) ( IN ?auto_4786 ?auto_4787 ) ( ON ?auto_4785 ?auto_4784 ) ( not ( = ?auto_4784 ?auto_4785 ) ) ( not ( = ?auto_4784 ?auto_4786 ) ) ( ON ?auto_4784 ?auto_4783 ) ( not ( = ?auto_4783 ?auto_4784 ) ) ( not ( = ?auto_4783 ?auto_4785 ) ) ( not ( = ?auto_4783 ?auto_4786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4784 ?auto_4785 ?auto_4786 )
      ( MAKE-3CRATE-VERIFY ?auto_4783 ?auto_4784 ?auto_4785 ?auto_4786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4790 - SURFACE
      ?auto_4791 - SURFACE
    )
    :vars
    (
      ?auto_4795 - HOIST
      ?auto_4794 - PLACE
      ?auto_4792 - TRUCK
      ?auto_4793 - SURFACE
      ?auto_4796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4795 ?auto_4794 ) ( SURFACE-AT ?auto_4790 ?auto_4794 ) ( CLEAR ?auto_4790 ) ( IS-CRATE ?auto_4791 ) ( not ( = ?auto_4790 ?auto_4791 ) ) ( AVAILABLE ?auto_4795 ) ( IN ?auto_4791 ?auto_4792 ) ( ON ?auto_4790 ?auto_4793 ) ( not ( = ?auto_4793 ?auto_4790 ) ) ( not ( = ?auto_4793 ?auto_4791 ) ) ( TRUCK-AT ?auto_4792 ?auto_4796 ) ( not ( = ?auto_4796 ?auto_4794 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4792 ?auto_4796 ?auto_4794 )
      ( MAKE-2CRATE ?auto_4793 ?auto_4790 ?auto_4791 )
      ( MAKE-1CRATE-VERIFY ?auto_4790 ?auto_4791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4797 - SURFACE
      ?auto_4798 - SURFACE
      ?auto_4799 - SURFACE
    )
    :vars
    (
      ?auto_4800 - HOIST
      ?auto_4803 - PLACE
      ?auto_4801 - TRUCK
      ?auto_4802 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4800 ?auto_4803 ) ( SURFACE-AT ?auto_4798 ?auto_4803 ) ( CLEAR ?auto_4798 ) ( IS-CRATE ?auto_4799 ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( AVAILABLE ?auto_4800 ) ( IN ?auto_4799 ?auto_4801 ) ( ON ?auto_4798 ?auto_4797 ) ( not ( = ?auto_4797 ?auto_4798 ) ) ( not ( = ?auto_4797 ?auto_4799 ) ) ( TRUCK-AT ?auto_4801 ?auto_4802 ) ( not ( = ?auto_4802 ?auto_4803 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4798 ?auto_4799 )
      ( MAKE-2CRATE-VERIFY ?auto_4797 ?auto_4798 ?auto_4799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4804 - SURFACE
      ?auto_4805 - SURFACE
      ?auto_4806 - SURFACE
      ?auto_4807 - SURFACE
    )
    :vars
    (
      ?auto_4809 - HOIST
      ?auto_4808 - PLACE
      ?auto_4811 - TRUCK
      ?auto_4810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4809 ?auto_4808 ) ( SURFACE-AT ?auto_4806 ?auto_4808 ) ( CLEAR ?auto_4806 ) ( IS-CRATE ?auto_4807 ) ( not ( = ?auto_4806 ?auto_4807 ) ) ( AVAILABLE ?auto_4809 ) ( IN ?auto_4807 ?auto_4811 ) ( ON ?auto_4806 ?auto_4805 ) ( not ( = ?auto_4805 ?auto_4806 ) ) ( not ( = ?auto_4805 ?auto_4807 ) ) ( TRUCK-AT ?auto_4811 ?auto_4810 ) ( not ( = ?auto_4810 ?auto_4808 ) ) ( ON ?auto_4805 ?auto_4804 ) ( not ( = ?auto_4804 ?auto_4805 ) ) ( not ( = ?auto_4804 ?auto_4806 ) ) ( not ( = ?auto_4804 ?auto_4807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4805 ?auto_4806 ?auto_4807 )
      ( MAKE-3CRATE-VERIFY ?auto_4804 ?auto_4805 ?auto_4806 ?auto_4807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4812 - SURFACE
      ?auto_4813 - SURFACE
    )
    :vars
    (
      ?auto_4815 - HOIST
      ?auto_4814 - PLACE
      ?auto_4818 - SURFACE
      ?auto_4817 - TRUCK
      ?auto_4816 - PLACE
      ?auto_4819 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4815 ?auto_4814 ) ( SURFACE-AT ?auto_4812 ?auto_4814 ) ( CLEAR ?auto_4812 ) ( IS-CRATE ?auto_4813 ) ( not ( = ?auto_4812 ?auto_4813 ) ) ( AVAILABLE ?auto_4815 ) ( ON ?auto_4812 ?auto_4818 ) ( not ( = ?auto_4818 ?auto_4812 ) ) ( not ( = ?auto_4818 ?auto_4813 ) ) ( TRUCK-AT ?auto_4817 ?auto_4816 ) ( not ( = ?auto_4816 ?auto_4814 ) ) ( HOIST-AT ?auto_4819 ?auto_4816 ) ( LIFTING ?auto_4819 ?auto_4813 ) ( not ( = ?auto_4815 ?auto_4819 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4819 ?auto_4813 ?auto_4817 ?auto_4816 )
      ( MAKE-2CRATE ?auto_4818 ?auto_4812 ?auto_4813 )
      ( MAKE-1CRATE-VERIFY ?auto_4812 ?auto_4813 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4820 - SURFACE
      ?auto_4821 - SURFACE
      ?auto_4822 - SURFACE
    )
    :vars
    (
      ?auto_4825 - HOIST
      ?auto_4824 - PLACE
      ?auto_4823 - TRUCK
      ?auto_4826 - PLACE
      ?auto_4827 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4825 ?auto_4824 ) ( SURFACE-AT ?auto_4821 ?auto_4824 ) ( CLEAR ?auto_4821 ) ( IS-CRATE ?auto_4822 ) ( not ( = ?auto_4821 ?auto_4822 ) ) ( AVAILABLE ?auto_4825 ) ( ON ?auto_4821 ?auto_4820 ) ( not ( = ?auto_4820 ?auto_4821 ) ) ( not ( = ?auto_4820 ?auto_4822 ) ) ( TRUCK-AT ?auto_4823 ?auto_4826 ) ( not ( = ?auto_4826 ?auto_4824 ) ) ( HOIST-AT ?auto_4827 ?auto_4826 ) ( LIFTING ?auto_4827 ?auto_4822 ) ( not ( = ?auto_4825 ?auto_4827 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4821 ?auto_4822 )
      ( MAKE-2CRATE-VERIFY ?auto_4820 ?auto_4821 ?auto_4822 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4828 - SURFACE
      ?auto_4829 - SURFACE
      ?auto_4830 - SURFACE
      ?auto_4831 - SURFACE
    )
    :vars
    (
      ?auto_4836 - HOIST
      ?auto_4835 - PLACE
      ?auto_4834 - TRUCK
      ?auto_4832 - PLACE
      ?auto_4833 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4836 ?auto_4835 ) ( SURFACE-AT ?auto_4830 ?auto_4835 ) ( CLEAR ?auto_4830 ) ( IS-CRATE ?auto_4831 ) ( not ( = ?auto_4830 ?auto_4831 ) ) ( AVAILABLE ?auto_4836 ) ( ON ?auto_4830 ?auto_4829 ) ( not ( = ?auto_4829 ?auto_4830 ) ) ( not ( = ?auto_4829 ?auto_4831 ) ) ( TRUCK-AT ?auto_4834 ?auto_4832 ) ( not ( = ?auto_4832 ?auto_4835 ) ) ( HOIST-AT ?auto_4833 ?auto_4832 ) ( LIFTING ?auto_4833 ?auto_4831 ) ( not ( = ?auto_4836 ?auto_4833 ) ) ( ON ?auto_4829 ?auto_4828 ) ( not ( = ?auto_4828 ?auto_4829 ) ) ( not ( = ?auto_4828 ?auto_4830 ) ) ( not ( = ?auto_4828 ?auto_4831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4829 ?auto_4830 ?auto_4831 )
      ( MAKE-3CRATE-VERIFY ?auto_4828 ?auto_4829 ?auto_4830 ?auto_4831 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4837 - SURFACE
      ?auto_4838 - SURFACE
    )
    :vars
    (
      ?auto_4844 - HOIST
      ?auto_4843 - PLACE
      ?auto_4840 - SURFACE
      ?auto_4842 - TRUCK
      ?auto_4839 - PLACE
      ?auto_4841 - HOIST
      ?auto_4845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4844 ?auto_4843 ) ( SURFACE-AT ?auto_4837 ?auto_4843 ) ( CLEAR ?auto_4837 ) ( IS-CRATE ?auto_4838 ) ( not ( = ?auto_4837 ?auto_4838 ) ) ( AVAILABLE ?auto_4844 ) ( ON ?auto_4837 ?auto_4840 ) ( not ( = ?auto_4840 ?auto_4837 ) ) ( not ( = ?auto_4840 ?auto_4838 ) ) ( TRUCK-AT ?auto_4842 ?auto_4839 ) ( not ( = ?auto_4839 ?auto_4843 ) ) ( HOIST-AT ?auto_4841 ?auto_4839 ) ( not ( = ?auto_4844 ?auto_4841 ) ) ( AVAILABLE ?auto_4841 ) ( SURFACE-AT ?auto_4838 ?auto_4839 ) ( ON ?auto_4838 ?auto_4845 ) ( CLEAR ?auto_4838 ) ( not ( = ?auto_4837 ?auto_4845 ) ) ( not ( = ?auto_4838 ?auto_4845 ) ) ( not ( = ?auto_4840 ?auto_4845 ) ) )
    :subtasks
    ( ( !LIFT ?auto_4841 ?auto_4838 ?auto_4845 ?auto_4839 )
      ( MAKE-2CRATE ?auto_4840 ?auto_4837 ?auto_4838 )
      ( MAKE-1CRATE-VERIFY ?auto_4837 ?auto_4838 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4846 - SURFACE
      ?auto_4847 - SURFACE
      ?auto_4848 - SURFACE
    )
    :vars
    (
      ?auto_4853 - HOIST
      ?auto_4852 - PLACE
      ?auto_4854 - TRUCK
      ?auto_4850 - PLACE
      ?auto_4849 - HOIST
      ?auto_4851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4853 ?auto_4852 ) ( SURFACE-AT ?auto_4847 ?auto_4852 ) ( CLEAR ?auto_4847 ) ( IS-CRATE ?auto_4848 ) ( not ( = ?auto_4847 ?auto_4848 ) ) ( AVAILABLE ?auto_4853 ) ( ON ?auto_4847 ?auto_4846 ) ( not ( = ?auto_4846 ?auto_4847 ) ) ( not ( = ?auto_4846 ?auto_4848 ) ) ( TRUCK-AT ?auto_4854 ?auto_4850 ) ( not ( = ?auto_4850 ?auto_4852 ) ) ( HOIST-AT ?auto_4849 ?auto_4850 ) ( not ( = ?auto_4853 ?auto_4849 ) ) ( AVAILABLE ?auto_4849 ) ( SURFACE-AT ?auto_4848 ?auto_4850 ) ( ON ?auto_4848 ?auto_4851 ) ( CLEAR ?auto_4848 ) ( not ( = ?auto_4847 ?auto_4851 ) ) ( not ( = ?auto_4848 ?auto_4851 ) ) ( not ( = ?auto_4846 ?auto_4851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4847 ?auto_4848 )
      ( MAKE-2CRATE-VERIFY ?auto_4846 ?auto_4847 ?auto_4848 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4855 - SURFACE
      ?auto_4856 - SURFACE
      ?auto_4857 - SURFACE
      ?auto_4858 - SURFACE
    )
    :vars
    (
      ?auto_4859 - HOIST
      ?auto_4860 - PLACE
      ?auto_4863 - TRUCK
      ?auto_4862 - PLACE
      ?auto_4864 - HOIST
      ?auto_4861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4859 ?auto_4860 ) ( SURFACE-AT ?auto_4857 ?auto_4860 ) ( CLEAR ?auto_4857 ) ( IS-CRATE ?auto_4858 ) ( not ( = ?auto_4857 ?auto_4858 ) ) ( AVAILABLE ?auto_4859 ) ( ON ?auto_4857 ?auto_4856 ) ( not ( = ?auto_4856 ?auto_4857 ) ) ( not ( = ?auto_4856 ?auto_4858 ) ) ( TRUCK-AT ?auto_4863 ?auto_4862 ) ( not ( = ?auto_4862 ?auto_4860 ) ) ( HOIST-AT ?auto_4864 ?auto_4862 ) ( not ( = ?auto_4859 ?auto_4864 ) ) ( AVAILABLE ?auto_4864 ) ( SURFACE-AT ?auto_4858 ?auto_4862 ) ( ON ?auto_4858 ?auto_4861 ) ( CLEAR ?auto_4858 ) ( not ( = ?auto_4857 ?auto_4861 ) ) ( not ( = ?auto_4858 ?auto_4861 ) ) ( not ( = ?auto_4856 ?auto_4861 ) ) ( ON ?auto_4856 ?auto_4855 ) ( not ( = ?auto_4855 ?auto_4856 ) ) ( not ( = ?auto_4855 ?auto_4857 ) ) ( not ( = ?auto_4855 ?auto_4858 ) ) ( not ( = ?auto_4855 ?auto_4861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4856 ?auto_4857 ?auto_4858 )
      ( MAKE-3CRATE-VERIFY ?auto_4855 ?auto_4856 ?auto_4857 ?auto_4858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4865 - SURFACE
      ?auto_4866 - SURFACE
    )
    :vars
    (
      ?auto_4867 - HOIST
      ?auto_4868 - PLACE
      ?auto_4870 - SURFACE
      ?auto_4871 - PLACE
      ?auto_4873 - HOIST
      ?auto_4869 - SURFACE
      ?auto_4872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4867 ?auto_4868 ) ( SURFACE-AT ?auto_4865 ?auto_4868 ) ( CLEAR ?auto_4865 ) ( IS-CRATE ?auto_4866 ) ( not ( = ?auto_4865 ?auto_4866 ) ) ( AVAILABLE ?auto_4867 ) ( ON ?auto_4865 ?auto_4870 ) ( not ( = ?auto_4870 ?auto_4865 ) ) ( not ( = ?auto_4870 ?auto_4866 ) ) ( not ( = ?auto_4871 ?auto_4868 ) ) ( HOIST-AT ?auto_4873 ?auto_4871 ) ( not ( = ?auto_4867 ?auto_4873 ) ) ( AVAILABLE ?auto_4873 ) ( SURFACE-AT ?auto_4866 ?auto_4871 ) ( ON ?auto_4866 ?auto_4869 ) ( CLEAR ?auto_4866 ) ( not ( = ?auto_4865 ?auto_4869 ) ) ( not ( = ?auto_4866 ?auto_4869 ) ) ( not ( = ?auto_4870 ?auto_4869 ) ) ( TRUCK-AT ?auto_4872 ?auto_4868 ) )
    :subtasks
    ( ( !DRIVE ?auto_4872 ?auto_4868 ?auto_4871 )
      ( MAKE-2CRATE ?auto_4870 ?auto_4865 ?auto_4866 )
      ( MAKE-1CRATE-VERIFY ?auto_4865 ?auto_4866 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4874 - SURFACE
      ?auto_4875 - SURFACE
      ?auto_4876 - SURFACE
    )
    :vars
    (
      ?auto_4880 - HOIST
      ?auto_4881 - PLACE
      ?auto_4882 - PLACE
      ?auto_4877 - HOIST
      ?auto_4879 - SURFACE
      ?auto_4878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4880 ?auto_4881 ) ( SURFACE-AT ?auto_4875 ?auto_4881 ) ( CLEAR ?auto_4875 ) ( IS-CRATE ?auto_4876 ) ( not ( = ?auto_4875 ?auto_4876 ) ) ( AVAILABLE ?auto_4880 ) ( ON ?auto_4875 ?auto_4874 ) ( not ( = ?auto_4874 ?auto_4875 ) ) ( not ( = ?auto_4874 ?auto_4876 ) ) ( not ( = ?auto_4882 ?auto_4881 ) ) ( HOIST-AT ?auto_4877 ?auto_4882 ) ( not ( = ?auto_4880 ?auto_4877 ) ) ( AVAILABLE ?auto_4877 ) ( SURFACE-AT ?auto_4876 ?auto_4882 ) ( ON ?auto_4876 ?auto_4879 ) ( CLEAR ?auto_4876 ) ( not ( = ?auto_4875 ?auto_4879 ) ) ( not ( = ?auto_4876 ?auto_4879 ) ) ( not ( = ?auto_4874 ?auto_4879 ) ) ( TRUCK-AT ?auto_4878 ?auto_4881 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4875 ?auto_4876 )
      ( MAKE-2CRATE-VERIFY ?auto_4874 ?auto_4875 ?auto_4876 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4883 - SURFACE
      ?auto_4884 - SURFACE
      ?auto_4885 - SURFACE
      ?auto_4886 - SURFACE
    )
    :vars
    (
      ?auto_4892 - HOIST
      ?auto_4888 - PLACE
      ?auto_4887 - PLACE
      ?auto_4890 - HOIST
      ?auto_4889 - SURFACE
      ?auto_4891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4892 ?auto_4888 ) ( SURFACE-AT ?auto_4885 ?auto_4888 ) ( CLEAR ?auto_4885 ) ( IS-CRATE ?auto_4886 ) ( not ( = ?auto_4885 ?auto_4886 ) ) ( AVAILABLE ?auto_4892 ) ( ON ?auto_4885 ?auto_4884 ) ( not ( = ?auto_4884 ?auto_4885 ) ) ( not ( = ?auto_4884 ?auto_4886 ) ) ( not ( = ?auto_4887 ?auto_4888 ) ) ( HOIST-AT ?auto_4890 ?auto_4887 ) ( not ( = ?auto_4892 ?auto_4890 ) ) ( AVAILABLE ?auto_4890 ) ( SURFACE-AT ?auto_4886 ?auto_4887 ) ( ON ?auto_4886 ?auto_4889 ) ( CLEAR ?auto_4886 ) ( not ( = ?auto_4885 ?auto_4889 ) ) ( not ( = ?auto_4886 ?auto_4889 ) ) ( not ( = ?auto_4884 ?auto_4889 ) ) ( TRUCK-AT ?auto_4891 ?auto_4888 ) ( ON ?auto_4884 ?auto_4883 ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( not ( = ?auto_4883 ?auto_4885 ) ) ( not ( = ?auto_4883 ?auto_4886 ) ) ( not ( = ?auto_4883 ?auto_4889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4884 ?auto_4885 ?auto_4886 )
      ( MAKE-3CRATE-VERIFY ?auto_4883 ?auto_4884 ?auto_4885 ?auto_4886 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4893 - SURFACE
      ?auto_4894 - SURFACE
    )
    :vars
    (
      ?auto_4901 - HOIST
      ?auto_4896 - PLACE
      ?auto_4900 - SURFACE
      ?auto_4895 - PLACE
      ?auto_4898 - HOIST
      ?auto_4897 - SURFACE
      ?auto_4899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4901 ?auto_4896 ) ( IS-CRATE ?auto_4894 ) ( not ( = ?auto_4893 ?auto_4894 ) ) ( not ( = ?auto_4900 ?auto_4893 ) ) ( not ( = ?auto_4900 ?auto_4894 ) ) ( not ( = ?auto_4895 ?auto_4896 ) ) ( HOIST-AT ?auto_4898 ?auto_4895 ) ( not ( = ?auto_4901 ?auto_4898 ) ) ( AVAILABLE ?auto_4898 ) ( SURFACE-AT ?auto_4894 ?auto_4895 ) ( ON ?auto_4894 ?auto_4897 ) ( CLEAR ?auto_4894 ) ( not ( = ?auto_4893 ?auto_4897 ) ) ( not ( = ?auto_4894 ?auto_4897 ) ) ( not ( = ?auto_4900 ?auto_4897 ) ) ( TRUCK-AT ?auto_4899 ?auto_4896 ) ( SURFACE-AT ?auto_4900 ?auto_4896 ) ( CLEAR ?auto_4900 ) ( LIFTING ?auto_4901 ?auto_4893 ) ( IS-CRATE ?auto_4893 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4900 ?auto_4893 )
      ( MAKE-2CRATE ?auto_4900 ?auto_4893 ?auto_4894 )
      ( MAKE-1CRATE-VERIFY ?auto_4893 ?auto_4894 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4902 - SURFACE
      ?auto_4903 - SURFACE
      ?auto_4904 - SURFACE
    )
    :vars
    (
      ?auto_4908 - HOIST
      ?auto_4910 - PLACE
      ?auto_4905 - PLACE
      ?auto_4906 - HOIST
      ?auto_4907 - SURFACE
      ?auto_4909 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4908 ?auto_4910 ) ( IS-CRATE ?auto_4904 ) ( not ( = ?auto_4903 ?auto_4904 ) ) ( not ( = ?auto_4902 ?auto_4903 ) ) ( not ( = ?auto_4902 ?auto_4904 ) ) ( not ( = ?auto_4905 ?auto_4910 ) ) ( HOIST-AT ?auto_4906 ?auto_4905 ) ( not ( = ?auto_4908 ?auto_4906 ) ) ( AVAILABLE ?auto_4906 ) ( SURFACE-AT ?auto_4904 ?auto_4905 ) ( ON ?auto_4904 ?auto_4907 ) ( CLEAR ?auto_4904 ) ( not ( = ?auto_4903 ?auto_4907 ) ) ( not ( = ?auto_4904 ?auto_4907 ) ) ( not ( = ?auto_4902 ?auto_4907 ) ) ( TRUCK-AT ?auto_4909 ?auto_4910 ) ( SURFACE-AT ?auto_4902 ?auto_4910 ) ( CLEAR ?auto_4902 ) ( LIFTING ?auto_4908 ?auto_4903 ) ( IS-CRATE ?auto_4903 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4903 ?auto_4904 )
      ( MAKE-2CRATE-VERIFY ?auto_4902 ?auto_4903 ?auto_4904 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4911 - SURFACE
      ?auto_4912 - SURFACE
      ?auto_4913 - SURFACE
      ?auto_4914 - SURFACE
    )
    :vars
    (
      ?auto_4920 - HOIST
      ?auto_4918 - PLACE
      ?auto_4917 - PLACE
      ?auto_4919 - HOIST
      ?auto_4916 - SURFACE
      ?auto_4915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4920 ?auto_4918 ) ( IS-CRATE ?auto_4914 ) ( not ( = ?auto_4913 ?auto_4914 ) ) ( not ( = ?auto_4912 ?auto_4913 ) ) ( not ( = ?auto_4912 ?auto_4914 ) ) ( not ( = ?auto_4917 ?auto_4918 ) ) ( HOIST-AT ?auto_4919 ?auto_4917 ) ( not ( = ?auto_4920 ?auto_4919 ) ) ( AVAILABLE ?auto_4919 ) ( SURFACE-AT ?auto_4914 ?auto_4917 ) ( ON ?auto_4914 ?auto_4916 ) ( CLEAR ?auto_4914 ) ( not ( = ?auto_4913 ?auto_4916 ) ) ( not ( = ?auto_4914 ?auto_4916 ) ) ( not ( = ?auto_4912 ?auto_4916 ) ) ( TRUCK-AT ?auto_4915 ?auto_4918 ) ( SURFACE-AT ?auto_4912 ?auto_4918 ) ( CLEAR ?auto_4912 ) ( LIFTING ?auto_4920 ?auto_4913 ) ( IS-CRATE ?auto_4913 ) ( ON ?auto_4912 ?auto_4911 ) ( not ( = ?auto_4911 ?auto_4912 ) ) ( not ( = ?auto_4911 ?auto_4913 ) ) ( not ( = ?auto_4911 ?auto_4914 ) ) ( not ( = ?auto_4911 ?auto_4916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4912 ?auto_4913 ?auto_4914 )
      ( MAKE-3CRATE-VERIFY ?auto_4911 ?auto_4912 ?auto_4913 ?auto_4914 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4921 - SURFACE
      ?auto_4922 - SURFACE
    )
    :vars
    (
      ?auto_4929 - HOIST
      ?auto_4927 - PLACE
      ?auto_4923 - SURFACE
      ?auto_4926 - PLACE
      ?auto_4928 - HOIST
      ?auto_4925 - SURFACE
      ?auto_4924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4929 ?auto_4927 ) ( IS-CRATE ?auto_4922 ) ( not ( = ?auto_4921 ?auto_4922 ) ) ( not ( = ?auto_4923 ?auto_4921 ) ) ( not ( = ?auto_4923 ?auto_4922 ) ) ( not ( = ?auto_4926 ?auto_4927 ) ) ( HOIST-AT ?auto_4928 ?auto_4926 ) ( not ( = ?auto_4929 ?auto_4928 ) ) ( AVAILABLE ?auto_4928 ) ( SURFACE-AT ?auto_4922 ?auto_4926 ) ( ON ?auto_4922 ?auto_4925 ) ( CLEAR ?auto_4922 ) ( not ( = ?auto_4921 ?auto_4925 ) ) ( not ( = ?auto_4922 ?auto_4925 ) ) ( not ( = ?auto_4923 ?auto_4925 ) ) ( TRUCK-AT ?auto_4924 ?auto_4927 ) ( SURFACE-AT ?auto_4923 ?auto_4927 ) ( CLEAR ?auto_4923 ) ( IS-CRATE ?auto_4921 ) ( AVAILABLE ?auto_4929 ) ( IN ?auto_4921 ?auto_4924 ) )
    :subtasks
    ( ( !UNLOAD ?auto_4929 ?auto_4921 ?auto_4924 ?auto_4927 )
      ( MAKE-2CRATE ?auto_4923 ?auto_4921 ?auto_4922 )
      ( MAKE-1CRATE-VERIFY ?auto_4921 ?auto_4922 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4930 - SURFACE
      ?auto_4931 - SURFACE
      ?auto_4932 - SURFACE
    )
    :vars
    (
      ?auto_4938 - HOIST
      ?auto_4933 - PLACE
      ?auto_4937 - PLACE
      ?auto_4934 - HOIST
      ?auto_4936 - SURFACE
      ?auto_4935 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4938 ?auto_4933 ) ( IS-CRATE ?auto_4932 ) ( not ( = ?auto_4931 ?auto_4932 ) ) ( not ( = ?auto_4930 ?auto_4931 ) ) ( not ( = ?auto_4930 ?auto_4932 ) ) ( not ( = ?auto_4937 ?auto_4933 ) ) ( HOIST-AT ?auto_4934 ?auto_4937 ) ( not ( = ?auto_4938 ?auto_4934 ) ) ( AVAILABLE ?auto_4934 ) ( SURFACE-AT ?auto_4932 ?auto_4937 ) ( ON ?auto_4932 ?auto_4936 ) ( CLEAR ?auto_4932 ) ( not ( = ?auto_4931 ?auto_4936 ) ) ( not ( = ?auto_4932 ?auto_4936 ) ) ( not ( = ?auto_4930 ?auto_4936 ) ) ( TRUCK-AT ?auto_4935 ?auto_4933 ) ( SURFACE-AT ?auto_4930 ?auto_4933 ) ( CLEAR ?auto_4930 ) ( IS-CRATE ?auto_4931 ) ( AVAILABLE ?auto_4938 ) ( IN ?auto_4931 ?auto_4935 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4931 ?auto_4932 )
      ( MAKE-2CRATE-VERIFY ?auto_4930 ?auto_4931 ?auto_4932 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4939 - SURFACE
      ?auto_4940 - SURFACE
      ?auto_4941 - SURFACE
      ?auto_4942 - SURFACE
    )
    :vars
    (
      ?auto_4943 - HOIST
      ?auto_4946 - PLACE
      ?auto_4945 - PLACE
      ?auto_4947 - HOIST
      ?auto_4944 - SURFACE
      ?auto_4948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4943 ?auto_4946 ) ( IS-CRATE ?auto_4942 ) ( not ( = ?auto_4941 ?auto_4942 ) ) ( not ( = ?auto_4940 ?auto_4941 ) ) ( not ( = ?auto_4940 ?auto_4942 ) ) ( not ( = ?auto_4945 ?auto_4946 ) ) ( HOIST-AT ?auto_4947 ?auto_4945 ) ( not ( = ?auto_4943 ?auto_4947 ) ) ( AVAILABLE ?auto_4947 ) ( SURFACE-AT ?auto_4942 ?auto_4945 ) ( ON ?auto_4942 ?auto_4944 ) ( CLEAR ?auto_4942 ) ( not ( = ?auto_4941 ?auto_4944 ) ) ( not ( = ?auto_4942 ?auto_4944 ) ) ( not ( = ?auto_4940 ?auto_4944 ) ) ( TRUCK-AT ?auto_4948 ?auto_4946 ) ( SURFACE-AT ?auto_4940 ?auto_4946 ) ( CLEAR ?auto_4940 ) ( IS-CRATE ?auto_4941 ) ( AVAILABLE ?auto_4943 ) ( IN ?auto_4941 ?auto_4948 ) ( ON ?auto_4940 ?auto_4939 ) ( not ( = ?auto_4939 ?auto_4940 ) ) ( not ( = ?auto_4939 ?auto_4941 ) ) ( not ( = ?auto_4939 ?auto_4942 ) ) ( not ( = ?auto_4939 ?auto_4944 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4940 ?auto_4941 ?auto_4942 )
      ( MAKE-3CRATE-VERIFY ?auto_4939 ?auto_4940 ?auto_4941 ?auto_4942 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4949 - SURFACE
      ?auto_4950 - SURFACE
    )
    :vars
    (
      ?auto_4952 - HOIST
      ?auto_4955 - PLACE
      ?auto_4951 - SURFACE
      ?auto_4954 - PLACE
      ?auto_4956 - HOIST
      ?auto_4953 - SURFACE
      ?auto_4957 - TRUCK
      ?auto_4958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4952 ?auto_4955 ) ( IS-CRATE ?auto_4950 ) ( not ( = ?auto_4949 ?auto_4950 ) ) ( not ( = ?auto_4951 ?auto_4949 ) ) ( not ( = ?auto_4951 ?auto_4950 ) ) ( not ( = ?auto_4954 ?auto_4955 ) ) ( HOIST-AT ?auto_4956 ?auto_4954 ) ( not ( = ?auto_4952 ?auto_4956 ) ) ( AVAILABLE ?auto_4956 ) ( SURFACE-AT ?auto_4950 ?auto_4954 ) ( ON ?auto_4950 ?auto_4953 ) ( CLEAR ?auto_4950 ) ( not ( = ?auto_4949 ?auto_4953 ) ) ( not ( = ?auto_4950 ?auto_4953 ) ) ( not ( = ?auto_4951 ?auto_4953 ) ) ( SURFACE-AT ?auto_4951 ?auto_4955 ) ( CLEAR ?auto_4951 ) ( IS-CRATE ?auto_4949 ) ( AVAILABLE ?auto_4952 ) ( IN ?auto_4949 ?auto_4957 ) ( TRUCK-AT ?auto_4957 ?auto_4958 ) ( not ( = ?auto_4958 ?auto_4955 ) ) ( not ( = ?auto_4954 ?auto_4958 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4957 ?auto_4958 ?auto_4955 )
      ( MAKE-2CRATE ?auto_4951 ?auto_4949 ?auto_4950 )
      ( MAKE-1CRATE-VERIFY ?auto_4949 ?auto_4950 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4959 - SURFACE
      ?auto_4960 - SURFACE
      ?auto_4961 - SURFACE
    )
    :vars
    (
      ?auto_4962 - HOIST
      ?auto_4966 - PLACE
      ?auto_4967 - PLACE
      ?auto_4963 - HOIST
      ?auto_4968 - SURFACE
      ?auto_4964 - TRUCK
      ?auto_4965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4962 ?auto_4966 ) ( IS-CRATE ?auto_4961 ) ( not ( = ?auto_4960 ?auto_4961 ) ) ( not ( = ?auto_4959 ?auto_4960 ) ) ( not ( = ?auto_4959 ?auto_4961 ) ) ( not ( = ?auto_4967 ?auto_4966 ) ) ( HOIST-AT ?auto_4963 ?auto_4967 ) ( not ( = ?auto_4962 ?auto_4963 ) ) ( AVAILABLE ?auto_4963 ) ( SURFACE-AT ?auto_4961 ?auto_4967 ) ( ON ?auto_4961 ?auto_4968 ) ( CLEAR ?auto_4961 ) ( not ( = ?auto_4960 ?auto_4968 ) ) ( not ( = ?auto_4961 ?auto_4968 ) ) ( not ( = ?auto_4959 ?auto_4968 ) ) ( SURFACE-AT ?auto_4959 ?auto_4966 ) ( CLEAR ?auto_4959 ) ( IS-CRATE ?auto_4960 ) ( AVAILABLE ?auto_4962 ) ( IN ?auto_4960 ?auto_4964 ) ( TRUCK-AT ?auto_4964 ?auto_4965 ) ( not ( = ?auto_4965 ?auto_4966 ) ) ( not ( = ?auto_4967 ?auto_4965 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4960 ?auto_4961 )
      ( MAKE-2CRATE-VERIFY ?auto_4959 ?auto_4960 ?auto_4961 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4969 - SURFACE
      ?auto_4970 - SURFACE
      ?auto_4971 - SURFACE
      ?auto_4972 - SURFACE
    )
    :vars
    (
      ?auto_4979 - HOIST
      ?auto_4975 - PLACE
      ?auto_4978 - PLACE
      ?auto_4973 - HOIST
      ?auto_4974 - SURFACE
      ?auto_4977 - TRUCK
      ?auto_4976 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_4979 ?auto_4975 ) ( IS-CRATE ?auto_4972 ) ( not ( = ?auto_4971 ?auto_4972 ) ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( not ( = ?auto_4970 ?auto_4972 ) ) ( not ( = ?auto_4978 ?auto_4975 ) ) ( HOIST-AT ?auto_4973 ?auto_4978 ) ( not ( = ?auto_4979 ?auto_4973 ) ) ( AVAILABLE ?auto_4973 ) ( SURFACE-AT ?auto_4972 ?auto_4978 ) ( ON ?auto_4972 ?auto_4974 ) ( CLEAR ?auto_4972 ) ( not ( = ?auto_4971 ?auto_4974 ) ) ( not ( = ?auto_4972 ?auto_4974 ) ) ( not ( = ?auto_4970 ?auto_4974 ) ) ( SURFACE-AT ?auto_4970 ?auto_4975 ) ( CLEAR ?auto_4970 ) ( IS-CRATE ?auto_4971 ) ( AVAILABLE ?auto_4979 ) ( IN ?auto_4971 ?auto_4977 ) ( TRUCK-AT ?auto_4977 ?auto_4976 ) ( not ( = ?auto_4976 ?auto_4975 ) ) ( not ( = ?auto_4978 ?auto_4976 ) ) ( ON ?auto_4970 ?auto_4969 ) ( not ( = ?auto_4969 ?auto_4970 ) ) ( not ( = ?auto_4969 ?auto_4971 ) ) ( not ( = ?auto_4969 ?auto_4972 ) ) ( not ( = ?auto_4969 ?auto_4974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4970 ?auto_4971 ?auto_4972 )
      ( MAKE-3CRATE-VERIFY ?auto_4969 ?auto_4970 ?auto_4971 ?auto_4972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4980 - SURFACE
      ?auto_4981 - SURFACE
    )
    :vars
    (
      ?auto_4989 - HOIST
      ?auto_4985 - PLACE
      ?auto_4982 - SURFACE
      ?auto_4988 - PLACE
      ?auto_4983 - HOIST
      ?auto_4984 - SURFACE
      ?auto_4987 - TRUCK
      ?auto_4986 - PLACE
      ?auto_4990 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4989 ?auto_4985 ) ( IS-CRATE ?auto_4981 ) ( not ( = ?auto_4980 ?auto_4981 ) ) ( not ( = ?auto_4982 ?auto_4980 ) ) ( not ( = ?auto_4982 ?auto_4981 ) ) ( not ( = ?auto_4988 ?auto_4985 ) ) ( HOIST-AT ?auto_4983 ?auto_4988 ) ( not ( = ?auto_4989 ?auto_4983 ) ) ( AVAILABLE ?auto_4983 ) ( SURFACE-AT ?auto_4981 ?auto_4988 ) ( ON ?auto_4981 ?auto_4984 ) ( CLEAR ?auto_4981 ) ( not ( = ?auto_4980 ?auto_4984 ) ) ( not ( = ?auto_4981 ?auto_4984 ) ) ( not ( = ?auto_4982 ?auto_4984 ) ) ( SURFACE-AT ?auto_4982 ?auto_4985 ) ( CLEAR ?auto_4982 ) ( IS-CRATE ?auto_4980 ) ( AVAILABLE ?auto_4989 ) ( TRUCK-AT ?auto_4987 ?auto_4986 ) ( not ( = ?auto_4986 ?auto_4985 ) ) ( not ( = ?auto_4988 ?auto_4986 ) ) ( HOIST-AT ?auto_4990 ?auto_4986 ) ( LIFTING ?auto_4990 ?auto_4980 ) ( not ( = ?auto_4989 ?auto_4990 ) ) ( not ( = ?auto_4983 ?auto_4990 ) ) )
    :subtasks
    ( ( !LOAD ?auto_4990 ?auto_4980 ?auto_4987 ?auto_4986 )
      ( MAKE-2CRATE ?auto_4982 ?auto_4980 ?auto_4981 )
      ( MAKE-1CRATE-VERIFY ?auto_4980 ?auto_4981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4991 - SURFACE
      ?auto_4992 - SURFACE
      ?auto_4993 - SURFACE
    )
    :vars
    (
      ?auto_4997 - HOIST
      ?auto_4994 - PLACE
      ?auto_4995 - PLACE
      ?auto_4998 - HOIST
      ?auto_4999 - SURFACE
      ?auto_5001 - TRUCK
      ?auto_4996 - PLACE
      ?auto_5000 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_4997 ?auto_4994 ) ( IS-CRATE ?auto_4993 ) ( not ( = ?auto_4992 ?auto_4993 ) ) ( not ( = ?auto_4991 ?auto_4992 ) ) ( not ( = ?auto_4991 ?auto_4993 ) ) ( not ( = ?auto_4995 ?auto_4994 ) ) ( HOIST-AT ?auto_4998 ?auto_4995 ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( AVAILABLE ?auto_4998 ) ( SURFACE-AT ?auto_4993 ?auto_4995 ) ( ON ?auto_4993 ?auto_4999 ) ( CLEAR ?auto_4993 ) ( not ( = ?auto_4992 ?auto_4999 ) ) ( not ( = ?auto_4993 ?auto_4999 ) ) ( not ( = ?auto_4991 ?auto_4999 ) ) ( SURFACE-AT ?auto_4991 ?auto_4994 ) ( CLEAR ?auto_4991 ) ( IS-CRATE ?auto_4992 ) ( AVAILABLE ?auto_4997 ) ( TRUCK-AT ?auto_5001 ?auto_4996 ) ( not ( = ?auto_4996 ?auto_4994 ) ) ( not ( = ?auto_4995 ?auto_4996 ) ) ( HOIST-AT ?auto_5000 ?auto_4996 ) ( LIFTING ?auto_5000 ?auto_4992 ) ( not ( = ?auto_4997 ?auto_5000 ) ) ( not ( = ?auto_4998 ?auto_5000 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4992 ?auto_4993 )
      ( MAKE-2CRATE-VERIFY ?auto_4991 ?auto_4992 ?auto_4993 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5002 - SURFACE
      ?auto_5003 - SURFACE
      ?auto_5004 - SURFACE
      ?auto_5005 - SURFACE
    )
    :vars
    (
      ?auto_5012 - HOIST
      ?auto_5007 - PLACE
      ?auto_5006 - PLACE
      ?auto_5010 - HOIST
      ?auto_5011 - SURFACE
      ?auto_5008 - TRUCK
      ?auto_5013 - PLACE
      ?auto_5009 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_5012 ?auto_5007 ) ( IS-CRATE ?auto_5005 ) ( not ( = ?auto_5004 ?auto_5005 ) ) ( not ( = ?auto_5003 ?auto_5004 ) ) ( not ( = ?auto_5003 ?auto_5005 ) ) ( not ( = ?auto_5006 ?auto_5007 ) ) ( HOIST-AT ?auto_5010 ?auto_5006 ) ( not ( = ?auto_5012 ?auto_5010 ) ) ( AVAILABLE ?auto_5010 ) ( SURFACE-AT ?auto_5005 ?auto_5006 ) ( ON ?auto_5005 ?auto_5011 ) ( CLEAR ?auto_5005 ) ( not ( = ?auto_5004 ?auto_5011 ) ) ( not ( = ?auto_5005 ?auto_5011 ) ) ( not ( = ?auto_5003 ?auto_5011 ) ) ( SURFACE-AT ?auto_5003 ?auto_5007 ) ( CLEAR ?auto_5003 ) ( IS-CRATE ?auto_5004 ) ( AVAILABLE ?auto_5012 ) ( TRUCK-AT ?auto_5008 ?auto_5013 ) ( not ( = ?auto_5013 ?auto_5007 ) ) ( not ( = ?auto_5006 ?auto_5013 ) ) ( HOIST-AT ?auto_5009 ?auto_5013 ) ( LIFTING ?auto_5009 ?auto_5004 ) ( not ( = ?auto_5012 ?auto_5009 ) ) ( not ( = ?auto_5010 ?auto_5009 ) ) ( ON ?auto_5003 ?auto_5002 ) ( not ( = ?auto_5002 ?auto_5003 ) ) ( not ( = ?auto_5002 ?auto_5004 ) ) ( not ( = ?auto_5002 ?auto_5005 ) ) ( not ( = ?auto_5002 ?auto_5011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5003 ?auto_5004 ?auto_5005 )
      ( MAKE-3CRATE-VERIFY ?auto_5002 ?auto_5003 ?auto_5004 ?auto_5005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5014 - SURFACE
      ?auto_5015 - SURFACE
    )
    :vars
    (
      ?auto_5023 - HOIST
      ?auto_5017 - PLACE
      ?auto_5022 - SURFACE
      ?auto_5016 - PLACE
      ?auto_5020 - HOIST
      ?auto_5021 - SURFACE
      ?auto_5018 - TRUCK
      ?auto_5024 - PLACE
      ?auto_5019 - HOIST
      ?auto_5025 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5023 ?auto_5017 ) ( IS-CRATE ?auto_5015 ) ( not ( = ?auto_5014 ?auto_5015 ) ) ( not ( = ?auto_5022 ?auto_5014 ) ) ( not ( = ?auto_5022 ?auto_5015 ) ) ( not ( = ?auto_5016 ?auto_5017 ) ) ( HOIST-AT ?auto_5020 ?auto_5016 ) ( not ( = ?auto_5023 ?auto_5020 ) ) ( AVAILABLE ?auto_5020 ) ( SURFACE-AT ?auto_5015 ?auto_5016 ) ( ON ?auto_5015 ?auto_5021 ) ( CLEAR ?auto_5015 ) ( not ( = ?auto_5014 ?auto_5021 ) ) ( not ( = ?auto_5015 ?auto_5021 ) ) ( not ( = ?auto_5022 ?auto_5021 ) ) ( SURFACE-AT ?auto_5022 ?auto_5017 ) ( CLEAR ?auto_5022 ) ( IS-CRATE ?auto_5014 ) ( AVAILABLE ?auto_5023 ) ( TRUCK-AT ?auto_5018 ?auto_5024 ) ( not ( = ?auto_5024 ?auto_5017 ) ) ( not ( = ?auto_5016 ?auto_5024 ) ) ( HOIST-AT ?auto_5019 ?auto_5024 ) ( not ( = ?auto_5023 ?auto_5019 ) ) ( not ( = ?auto_5020 ?auto_5019 ) ) ( AVAILABLE ?auto_5019 ) ( SURFACE-AT ?auto_5014 ?auto_5024 ) ( ON ?auto_5014 ?auto_5025 ) ( CLEAR ?auto_5014 ) ( not ( = ?auto_5014 ?auto_5025 ) ) ( not ( = ?auto_5015 ?auto_5025 ) ) ( not ( = ?auto_5022 ?auto_5025 ) ) ( not ( = ?auto_5021 ?auto_5025 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5019 ?auto_5014 ?auto_5025 ?auto_5024 )
      ( MAKE-2CRATE ?auto_5022 ?auto_5014 ?auto_5015 )
      ( MAKE-1CRATE-VERIFY ?auto_5014 ?auto_5015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5026 - SURFACE
      ?auto_5027 - SURFACE
      ?auto_5028 - SURFACE
    )
    :vars
    (
      ?auto_5034 - HOIST
      ?auto_5035 - PLACE
      ?auto_5033 - PLACE
      ?auto_5036 - HOIST
      ?auto_5032 - SURFACE
      ?auto_5031 - TRUCK
      ?auto_5029 - PLACE
      ?auto_5037 - HOIST
      ?auto_5030 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5034 ?auto_5035 ) ( IS-CRATE ?auto_5028 ) ( not ( = ?auto_5027 ?auto_5028 ) ) ( not ( = ?auto_5026 ?auto_5027 ) ) ( not ( = ?auto_5026 ?auto_5028 ) ) ( not ( = ?auto_5033 ?auto_5035 ) ) ( HOIST-AT ?auto_5036 ?auto_5033 ) ( not ( = ?auto_5034 ?auto_5036 ) ) ( AVAILABLE ?auto_5036 ) ( SURFACE-AT ?auto_5028 ?auto_5033 ) ( ON ?auto_5028 ?auto_5032 ) ( CLEAR ?auto_5028 ) ( not ( = ?auto_5027 ?auto_5032 ) ) ( not ( = ?auto_5028 ?auto_5032 ) ) ( not ( = ?auto_5026 ?auto_5032 ) ) ( SURFACE-AT ?auto_5026 ?auto_5035 ) ( CLEAR ?auto_5026 ) ( IS-CRATE ?auto_5027 ) ( AVAILABLE ?auto_5034 ) ( TRUCK-AT ?auto_5031 ?auto_5029 ) ( not ( = ?auto_5029 ?auto_5035 ) ) ( not ( = ?auto_5033 ?auto_5029 ) ) ( HOIST-AT ?auto_5037 ?auto_5029 ) ( not ( = ?auto_5034 ?auto_5037 ) ) ( not ( = ?auto_5036 ?auto_5037 ) ) ( AVAILABLE ?auto_5037 ) ( SURFACE-AT ?auto_5027 ?auto_5029 ) ( ON ?auto_5027 ?auto_5030 ) ( CLEAR ?auto_5027 ) ( not ( = ?auto_5027 ?auto_5030 ) ) ( not ( = ?auto_5028 ?auto_5030 ) ) ( not ( = ?auto_5026 ?auto_5030 ) ) ( not ( = ?auto_5032 ?auto_5030 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5027 ?auto_5028 )
      ( MAKE-2CRATE-VERIFY ?auto_5026 ?auto_5027 ?auto_5028 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5038 - SURFACE
      ?auto_5039 - SURFACE
      ?auto_5040 - SURFACE
      ?auto_5041 - SURFACE
    )
    :vars
    (
      ?auto_5042 - HOIST
      ?auto_5046 - PLACE
      ?auto_5047 - PLACE
      ?auto_5045 - HOIST
      ?auto_5044 - SURFACE
      ?auto_5043 - TRUCK
      ?auto_5050 - PLACE
      ?auto_5048 - HOIST
      ?auto_5049 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5042 ?auto_5046 ) ( IS-CRATE ?auto_5041 ) ( not ( = ?auto_5040 ?auto_5041 ) ) ( not ( = ?auto_5039 ?auto_5040 ) ) ( not ( = ?auto_5039 ?auto_5041 ) ) ( not ( = ?auto_5047 ?auto_5046 ) ) ( HOIST-AT ?auto_5045 ?auto_5047 ) ( not ( = ?auto_5042 ?auto_5045 ) ) ( AVAILABLE ?auto_5045 ) ( SURFACE-AT ?auto_5041 ?auto_5047 ) ( ON ?auto_5041 ?auto_5044 ) ( CLEAR ?auto_5041 ) ( not ( = ?auto_5040 ?auto_5044 ) ) ( not ( = ?auto_5041 ?auto_5044 ) ) ( not ( = ?auto_5039 ?auto_5044 ) ) ( SURFACE-AT ?auto_5039 ?auto_5046 ) ( CLEAR ?auto_5039 ) ( IS-CRATE ?auto_5040 ) ( AVAILABLE ?auto_5042 ) ( TRUCK-AT ?auto_5043 ?auto_5050 ) ( not ( = ?auto_5050 ?auto_5046 ) ) ( not ( = ?auto_5047 ?auto_5050 ) ) ( HOIST-AT ?auto_5048 ?auto_5050 ) ( not ( = ?auto_5042 ?auto_5048 ) ) ( not ( = ?auto_5045 ?auto_5048 ) ) ( AVAILABLE ?auto_5048 ) ( SURFACE-AT ?auto_5040 ?auto_5050 ) ( ON ?auto_5040 ?auto_5049 ) ( CLEAR ?auto_5040 ) ( not ( = ?auto_5040 ?auto_5049 ) ) ( not ( = ?auto_5041 ?auto_5049 ) ) ( not ( = ?auto_5039 ?auto_5049 ) ) ( not ( = ?auto_5044 ?auto_5049 ) ) ( ON ?auto_5039 ?auto_5038 ) ( not ( = ?auto_5038 ?auto_5039 ) ) ( not ( = ?auto_5038 ?auto_5040 ) ) ( not ( = ?auto_5038 ?auto_5041 ) ) ( not ( = ?auto_5038 ?auto_5044 ) ) ( not ( = ?auto_5038 ?auto_5049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5039 ?auto_5040 ?auto_5041 )
      ( MAKE-3CRATE-VERIFY ?auto_5038 ?auto_5039 ?auto_5040 ?auto_5041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5051 - SURFACE
      ?auto_5052 - SURFACE
    )
    :vars
    (
      ?auto_5053 - HOIST
      ?auto_5057 - PLACE
      ?auto_5062 - SURFACE
      ?auto_5058 - PLACE
      ?auto_5056 - HOIST
      ?auto_5055 - SURFACE
      ?auto_5061 - PLACE
      ?auto_5059 - HOIST
      ?auto_5060 - SURFACE
      ?auto_5054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5053 ?auto_5057 ) ( IS-CRATE ?auto_5052 ) ( not ( = ?auto_5051 ?auto_5052 ) ) ( not ( = ?auto_5062 ?auto_5051 ) ) ( not ( = ?auto_5062 ?auto_5052 ) ) ( not ( = ?auto_5058 ?auto_5057 ) ) ( HOIST-AT ?auto_5056 ?auto_5058 ) ( not ( = ?auto_5053 ?auto_5056 ) ) ( AVAILABLE ?auto_5056 ) ( SURFACE-AT ?auto_5052 ?auto_5058 ) ( ON ?auto_5052 ?auto_5055 ) ( CLEAR ?auto_5052 ) ( not ( = ?auto_5051 ?auto_5055 ) ) ( not ( = ?auto_5052 ?auto_5055 ) ) ( not ( = ?auto_5062 ?auto_5055 ) ) ( SURFACE-AT ?auto_5062 ?auto_5057 ) ( CLEAR ?auto_5062 ) ( IS-CRATE ?auto_5051 ) ( AVAILABLE ?auto_5053 ) ( not ( = ?auto_5061 ?auto_5057 ) ) ( not ( = ?auto_5058 ?auto_5061 ) ) ( HOIST-AT ?auto_5059 ?auto_5061 ) ( not ( = ?auto_5053 ?auto_5059 ) ) ( not ( = ?auto_5056 ?auto_5059 ) ) ( AVAILABLE ?auto_5059 ) ( SURFACE-AT ?auto_5051 ?auto_5061 ) ( ON ?auto_5051 ?auto_5060 ) ( CLEAR ?auto_5051 ) ( not ( = ?auto_5051 ?auto_5060 ) ) ( not ( = ?auto_5052 ?auto_5060 ) ) ( not ( = ?auto_5062 ?auto_5060 ) ) ( not ( = ?auto_5055 ?auto_5060 ) ) ( TRUCK-AT ?auto_5054 ?auto_5057 ) )
    :subtasks
    ( ( !DRIVE ?auto_5054 ?auto_5057 ?auto_5061 )
      ( MAKE-2CRATE ?auto_5062 ?auto_5051 ?auto_5052 )
      ( MAKE-1CRATE-VERIFY ?auto_5051 ?auto_5052 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5063 - SURFACE
      ?auto_5064 - SURFACE
      ?auto_5065 - SURFACE
    )
    :vars
    (
      ?auto_5073 - HOIST
      ?auto_5072 - PLACE
      ?auto_5066 - PLACE
      ?auto_5068 - HOIST
      ?auto_5074 - SURFACE
      ?auto_5069 - PLACE
      ?auto_5071 - HOIST
      ?auto_5070 - SURFACE
      ?auto_5067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5073 ?auto_5072 ) ( IS-CRATE ?auto_5065 ) ( not ( = ?auto_5064 ?auto_5065 ) ) ( not ( = ?auto_5063 ?auto_5064 ) ) ( not ( = ?auto_5063 ?auto_5065 ) ) ( not ( = ?auto_5066 ?auto_5072 ) ) ( HOIST-AT ?auto_5068 ?auto_5066 ) ( not ( = ?auto_5073 ?auto_5068 ) ) ( AVAILABLE ?auto_5068 ) ( SURFACE-AT ?auto_5065 ?auto_5066 ) ( ON ?auto_5065 ?auto_5074 ) ( CLEAR ?auto_5065 ) ( not ( = ?auto_5064 ?auto_5074 ) ) ( not ( = ?auto_5065 ?auto_5074 ) ) ( not ( = ?auto_5063 ?auto_5074 ) ) ( SURFACE-AT ?auto_5063 ?auto_5072 ) ( CLEAR ?auto_5063 ) ( IS-CRATE ?auto_5064 ) ( AVAILABLE ?auto_5073 ) ( not ( = ?auto_5069 ?auto_5072 ) ) ( not ( = ?auto_5066 ?auto_5069 ) ) ( HOIST-AT ?auto_5071 ?auto_5069 ) ( not ( = ?auto_5073 ?auto_5071 ) ) ( not ( = ?auto_5068 ?auto_5071 ) ) ( AVAILABLE ?auto_5071 ) ( SURFACE-AT ?auto_5064 ?auto_5069 ) ( ON ?auto_5064 ?auto_5070 ) ( CLEAR ?auto_5064 ) ( not ( = ?auto_5064 ?auto_5070 ) ) ( not ( = ?auto_5065 ?auto_5070 ) ) ( not ( = ?auto_5063 ?auto_5070 ) ) ( not ( = ?auto_5074 ?auto_5070 ) ) ( TRUCK-AT ?auto_5067 ?auto_5072 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5064 ?auto_5065 )
      ( MAKE-2CRATE-VERIFY ?auto_5063 ?auto_5064 ?auto_5065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5075 - SURFACE
      ?auto_5076 - SURFACE
      ?auto_5077 - SURFACE
      ?auto_5078 - SURFACE
    )
    :vars
    (
      ?auto_5086 - HOIST
      ?auto_5087 - PLACE
      ?auto_5083 - PLACE
      ?auto_5085 - HOIST
      ?auto_5079 - SURFACE
      ?auto_5081 - PLACE
      ?auto_5080 - HOIST
      ?auto_5082 - SURFACE
      ?auto_5084 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5086 ?auto_5087 ) ( IS-CRATE ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5078 ) ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5078 ) ) ( not ( = ?auto_5083 ?auto_5087 ) ) ( HOIST-AT ?auto_5085 ?auto_5083 ) ( not ( = ?auto_5086 ?auto_5085 ) ) ( AVAILABLE ?auto_5085 ) ( SURFACE-AT ?auto_5078 ?auto_5083 ) ( ON ?auto_5078 ?auto_5079 ) ( CLEAR ?auto_5078 ) ( not ( = ?auto_5077 ?auto_5079 ) ) ( not ( = ?auto_5078 ?auto_5079 ) ) ( not ( = ?auto_5076 ?auto_5079 ) ) ( SURFACE-AT ?auto_5076 ?auto_5087 ) ( CLEAR ?auto_5076 ) ( IS-CRATE ?auto_5077 ) ( AVAILABLE ?auto_5086 ) ( not ( = ?auto_5081 ?auto_5087 ) ) ( not ( = ?auto_5083 ?auto_5081 ) ) ( HOIST-AT ?auto_5080 ?auto_5081 ) ( not ( = ?auto_5086 ?auto_5080 ) ) ( not ( = ?auto_5085 ?auto_5080 ) ) ( AVAILABLE ?auto_5080 ) ( SURFACE-AT ?auto_5077 ?auto_5081 ) ( ON ?auto_5077 ?auto_5082 ) ( CLEAR ?auto_5077 ) ( not ( = ?auto_5077 ?auto_5082 ) ) ( not ( = ?auto_5078 ?auto_5082 ) ) ( not ( = ?auto_5076 ?auto_5082 ) ) ( not ( = ?auto_5079 ?auto_5082 ) ) ( TRUCK-AT ?auto_5084 ?auto_5087 ) ( ON ?auto_5076 ?auto_5075 ) ( not ( = ?auto_5075 ?auto_5076 ) ) ( not ( = ?auto_5075 ?auto_5077 ) ) ( not ( = ?auto_5075 ?auto_5078 ) ) ( not ( = ?auto_5075 ?auto_5079 ) ) ( not ( = ?auto_5075 ?auto_5082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5076 ?auto_5077 ?auto_5078 )
      ( MAKE-3CRATE-VERIFY ?auto_5075 ?auto_5076 ?auto_5077 ?auto_5078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5088 - SURFACE
      ?auto_5089 - SURFACE
    )
    :vars
    (
      ?auto_5098 - HOIST
      ?auto_5099 - PLACE
      ?auto_5095 - SURFACE
      ?auto_5094 - PLACE
      ?auto_5097 - HOIST
      ?auto_5090 - SURFACE
      ?auto_5092 - PLACE
      ?auto_5091 - HOIST
      ?auto_5093 - SURFACE
      ?auto_5096 - TRUCK
      ?auto_5100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5098 ?auto_5099 ) ( IS-CRATE ?auto_5089 ) ( not ( = ?auto_5088 ?auto_5089 ) ) ( not ( = ?auto_5095 ?auto_5088 ) ) ( not ( = ?auto_5095 ?auto_5089 ) ) ( not ( = ?auto_5094 ?auto_5099 ) ) ( HOIST-AT ?auto_5097 ?auto_5094 ) ( not ( = ?auto_5098 ?auto_5097 ) ) ( AVAILABLE ?auto_5097 ) ( SURFACE-AT ?auto_5089 ?auto_5094 ) ( ON ?auto_5089 ?auto_5090 ) ( CLEAR ?auto_5089 ) ( not ( = ?auto_5088 ?auto_5090 ) ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( not ( = ?auto_5095 ?auto_5090 ) ) ( IS-CRATE ?auto_5088 ) ( not ( = ?auto_5092 ?auto_5099 ) ) ( not ( = ?auto_5094 ?auto_5092 ) ) ( HOIST-AT ?auto_5091 ?auto_5092 ) ( not ( = ?auto_5098 ?auto_5091 ) ) ( not ( = ?auto_5097 ?auto_5091 ) ) ( AVAILABLE ?auto_5091 ) ( SURFACE-AT ?auto_5088 ?auto_5092 ) ( ON ?auto_5088 ?auto_5093 ) ( CLEAR ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5093 ) ) ( not ( = ?auto_5089 ?auto_5093 ) ) ( not ( = ?auto_5095 ?auto_5093 ) ) ( not ( = ?auto_5090 ?auto_5093 ) ) ( TRUCK-AT ?auto_5096 ?auto_5099 ) ( SURFACE-AT ?auto_5100 ?auto_5099 ) ( CLEAR ?auto_5100 ) ( LIFTING ?auto_5098 ?auto_5095 ) ( IS-CRATE ?auto_5095 ) ( not ( = ?auto_5100 ?auto_5095 ) ) ( not ( = ?auto_5088 ?auto_5100 ) ) ( not ( = ?auto_5089 ?auto_5100 ) ) ( not ( = ?auto_5090 ?auto_5100 ) ) ( not ( = ?auto_5093 ?auto_5100 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5100 ?auto_5095 )
      ( MAKE-2CRATE ?auto_5095 ?auto_5088 ?auto_5089 )
      ( MAKE-1CRATE-VERIFY ?auto_5088 ?auto_5089 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5101 - SURFACE
      ?auto_5102 - SURFACE
      ?auto_5103 - SURFACE
    )
    :vars
    (
      ?auto_5106 - HOIST
      ?auto_5111 - PLACE
      ?auto_5107 - PLACE
      ?auto_5105 - HOIST
      ?auto_5112 - SURFACE
      ?auto_5113 - PLACE
      ?auto_5110 - HOIST
      ?auto_5108 - SURFACE
      ?auto_5109 - TRUCK
      ?auto_5104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5106 ?auto_5111 ) ( IS-CRATE ?auto_5103 ) ( not ( = ?auto_5102 ?auto_5103 ) ) ( not ( = ?auto_5101 ?auto_5102 ) ) ( not ( = ?auto_5101 ?auto_5103 ) ) ( not ( = ?auto_5107 ?auto_5111 ) ) ( HOIST-AT ?auto_5105 ?auto_5107 ) ( not ( = ?auto_5106 ?auto_5105 ) ) ( AVAILABLE ?auto_5105 ) ( SURFACE-AT ?auto_5103 ?auto_5107 ) ( ON ?auto_5103 ?auto_5112 ) ( CLEAR ?auto_5103 ) ( not ( = ?auto_5102 ?auto_5112 ) ) ( not ( = ?auto_5103 ?auto_5112 ) ) ( not ( = ?auto_5101 ?auto_5112 ) ) ( IS-CRATE ?auto_5102 ) ( not ( = ?auto_5113 ?auto_5111 ) ) ( not ( = ?auto_5107 ?auto_5113 ) ) ( HOIST-AT ?auto_5110 ?auto_5113 ) ( not ( = ?auto_5106 ?auto_5110 ) ) ( not ( = ?auto_5105 ?auto_5110 ) ) ( AVAILABLE ?auto_5110 ) ( SURFACE-AT ?auto_5102 ?auto_5113 ) ( ON ?auto_5102 ?auto_5108 ) ( CLEAR ?auto_5102 ) ( not ( = ?auto_5102 ?auto_5108 ) ) ( not ( = ?auto_5103 ?auto_5108 ) ) ( not ( = ?auto_5101 ?auto_5108 ) ) ( not ( = ?auto_5112 ?auto_5108 ) ) ( TRUCK-AT ?auto_5109 ?auto_5111 ) ( SURFACE-AT ?auto_5104 ?auto_5111 ) ( CLEAR ?auto_5104 ) ( LIFTING ?auto_5106 ?auto_5101 ) ( IS-CRATE ?auto_5101 ) ( not ( = ?auto_5104 ?auto_5101 ) ) ( not ( = ?auto_5102 ?auto_5104 ) ) ( not ( = ?auto_5103 ?auto_5104 ) ) ( not ( = ?auto_5112 ?auto_5104 ) ) ( not ( = ?auto_5108 ?auto_5104 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5102 ?auto_5103 )
      ( MAKE-2CRATE-VERIFY ?auto_5101 ?auto_5102 ?auto_5103 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5114 - SURFACE
      ?auto_5115 - SURFACE
      ?auto_5116 - SURFACE
      ?auto_5117 - SURFACE
    )
    :vars
    (
      ?auto_5120 - HOIST
      ?auto_5123 - PLACE
      ?auto_5119 - PLACE
      ?auto_5126 - HOIST
      ?auto_5118 - SURFACE
      ?auto_5122 - PLACE
      ?auto_5121 - HOIST
      ?auto_5125 - SURFACE
      ?auto_5124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5120 ?auto_5123 ) ( IS-CRATE ?auto_5117 ) ( not ( = ?auto_5116 ?auto_5117 ) ) ( not ( = ?auto_5115 ?auto_5116 ) ) ( not ( = ?auto_5115 ?auto_5117 ) ) ( not ( = ?auto_5119 ?auto_5123 ) ) ( HOIST-AT ?auto_5126 ?auto_5119 ) ( not ( = ?auto_5120 ?auto_5126 ) ) ( AVAILABLE ?auto_5126 ) ( SURFACE-AT ?auto_5117 ?auto_5119 ) ( ON ?auto_5117 ?auto_5118 ) ( CLEAR ?auto_5117 ) ( not ( = ?auto_5116 ?auto_5118 ) ) ( not ( = ?auto_5117 ?auto_5118 ) ) ( not ( = ?auto_5115 ?auto_5118 ) ) ( IS-CRATE ?auto_5116 ) ( not ( = ?auto_5122 ?auto_5123 ) ) ( not ( = ?auto_5119 ?auto_5122 ) ) ( HOIST-AT ?auto_5121 ?auto_5122 ) ( not ( = ?auto_5120 ?auto_5121 ) ) ( not ( = ?auto_5126 ?auto_5121 ) ) ( AVAILABLE ?auto_5121 ) ( SURFACE-AT ?auto_5116 ?auto_5122 ) ( ON ?auto_5116 ?auto_5125 ) ( CLEAR ?auto_5116 ) ( not ( = ?auto_5116 ?auto_5125 ) ) ( not ( = ?auto_5117 ?auto_5125 ) ) ( not ( = ?auto_5115 ?auto_5125 ) ) ( not ( = ?auto_5118 ?auto_5125 ) ) ( TRUCK-AT ?auto_5124 ?auto_5123 ) ( SURFACE-AT ?auto_5114 ?auto_5123 ) ( CLEAR ?auto_5114 ) ( LIFTING ?auto_5120 ?auto_5115 ) ( IS-CRATE ?auto_5115 ) ( not ( = ?auto_5114 ?auto_5115 ) ) ( not ( = ?auto_5116 ?auto_5114 ) ) ( not ( = ?auto_5117 ?auto_5114 ) ) ( not ( = ?auto_5118 ?auto_5114 ) ) ( not ( = ?auto_5125 ?auto_5114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5115 ?auto_5116 ?auto_5117 )
      ( MAKE-3CRATE-VERIFY ?auto_5114 ?auto_5115 ?auto_5116 ?auto_5117 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5127 - SURFACE
      ?auto_5128 - SURFACE
    )
    :vars
    (
      ?auto_5133 - HOIST
      ?auto_5136 - PLACE
      ?auto_5130 - SURFACE
      ?auto_5132 - PLACE
      ?auto_5139 - HOIST
      ?auto_5129 - SURFACE
      ?auto_5135 - PLACE
      ?auto_5134 - HOIST
      ?auto_5138 - SURFACE
      ?auto_5137 - TRUCK
      ?auto_5131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5133 ?auto_5136 ) ( IS-CRATE ?auto_5128 ) ( not ( = ?auto_5127 ?auto_5128 ) ) ( not ( = ?auto_5130 ?auto_5127 ) ) ( not ( = ?auto_5130 ?auto_5128 ) ) ( not ( = ?auto_5132 ?auto_5136 ) ) ( HOIST-AT ?auto_5139 ?auto_5132 ) ( not ( = ?auto_5133 ?auto_5139 ) ) ( AVAILABLE ?auto_5139 ) ( SURFACE-AT ?auto_5128 ?auto_5132 ) ( ON ?auto_5128 ?auto_5129 ) ( CLEAR ?auto_5128 ) ( not ( = ?auto_5127 ?auto_5129 ) ) ( not ( = ?auto_5128 ?auto_5129 ) ) ( not ( = ?auto_5130 ?auto_5129 ) ) ( IS-CRATE ?auto_5127 ) ( not ( = ?auto_5135 ?auto_5136 ) ) ( not ( = ?auto_5132 ?auto_5135 ) ) ( HOIST-AT ?auto_5134 ?auto_5135 ) ( not ( = ?auto_5133 ?auto_5134 ) ) ( not ( = ?auto_5139 ?auto_5134 ) ) ( AVAILABLE ?auto_5134 ) ( SURFACE-AT ?auto_5127 ?auto_5135 ) ( ON ?auto_5127 ?auto_5138 ) ( CLEAR ?auto_5127 ) ( not ( = ?auto_5127 ?auto_5138 ) ) ( not ( = ?auto_5128 ?auto_5138 ) ) ( not ( = ?auto_5130 ?auto_5138 ) ) ( not ( = ?auto_5129 ?auto_5138 ) ) ( TRUCK-AT ?auto_5137 ?auto_5136 ) ( SURFACE-AT ?auto_5131 ?auto_5136 ) ( CLEAR ?auto_5131 ) ( IS-CRATE ?auto_5130 ) ( not ( = ?auto_5131 ?auto_5130 ) ) ( not ( = ?auto_5127 ?auto_5131 ) ) ( not ( = ?auto_5128 ?auto_5131 ) ) ( not ( = ?auto_5129 ?auto_5131 ) ) ( not ( = ?auto_5138 ?auto_5131 ) ) ( AVAILABLE ?auto_5133 ) ( IN ?auto_5130 ?auto_5137 ) )
    :subtasks
    ( ( !UNLOAD ?auto_5133 ?auto_5130 ?auto_5137 ?auto_5136 )
      ( MAKE-2CRATE ?auto_5130 ?auto_5127 ?auto_5128 )
      ( MAKE-1CRATE-VERIFY ?auto_5127 ?auto_5128 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5140 - SURFACE
      ?auto_5141 - SURFACE
      ?auto_5142 - SURFACE
    )
    :vars
    (
      ?auto_5150 - HOIST
      ?auto_5145 - PLACE
      ?auto_5146 - PLACE
      ?auto_5152 - HOIST
      ?auto_5144 - SURFACE
      ?auto_5149 - PLACE
      ?auto_5143 - HOIST
      ?auto_5151 - SURFACE
      ?auto_5147 - TRUCK
      ?auto_5148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5150 ?auto_5145 ) ( IS-CRATE ?auto_5142 ) ( not ( = ?auto_5141 ?auto_5142 ) ) ( not ( = ?auto_5140 ?auto_5141 ) ) ( not ( = ?auto_5140 ?auto_5142 ) ) ( not ( = ?auto_5146 ?auto_5145 ) ) ( HOIST-AT ?auto_5152 ?auto_5146 ) ( not ( = ?auto_5150 ?auto_5152 ) ) ( AVAILABLE ?auto_5152 ) ( SURFACE-AT ?auto_5142 ?auto_5146 ) ( ON ?auto_5142 ?auto_5144 ) ( CLEAR ?auto_5142 ) ( not ( = ?auto_5141 ?auto_5144 ) ) ( not ( = ?auto_5142 ?auto_5144 ) ) ( not ( = ?auto_5140 ?auto_5144 ) ) ( IS-CRATE ?auto_5141 ) ( not ( = ?auto_5149 ?auto_5145 ) ) ( not ( = ?auto_5146 ?auto_5149 ) ) ( HOIST-AT ?auto_5143 ?auto_5149 ) ( not ( = ?auto_5150 ?auto_5143 ) ) ( not ( = ?auto_5152 ?auto_5143 ) ) ( AVAILABLE ?auto_5143 ) ( SURFACE-AT ?auto_5141 ?auto_5149 ) ( ON ?auto_5141 ?auto_5151 ) ( CLEAR ?auto_5141 ) ( not ( = ?auto_5141 ?auto_5151 ) ) ( not ( = ?auto_5142 ?auto_5151 ) ) ( not ( = ?auto_5140 ?auto_5151 ) ) ( not ( = ?auto_5144 ?auto_5151 ) ) ( TRUCK-AT ?auto_5147 ?auto_5145 ) ( SURFACE-AT ?auto_5148 ?auto_5145 ) ( CLEAR ?auto_5148 ) ( IS-CRATE ?auto_5140 ) ( not ( = ?auto_5148 ?auto_5140 ) ) ( not ( = ?auto_5141 ?auto_5148 ) ) ( not ( = ?auto_5142 ?auto_5148 ) ) ( not ( = ?auto_5144 ?auto_5148 ) ) ( not ( = ?auto_5151 ?auto_5148 ) ) ( AVAILABLE ?auto_5150 ) ( IN ?auto_5140 ?auto_5147 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5141 ?auto_5142 )
      ( MAKE-2CRATE-VERIFY ?auto_5140 ?auto_5141 ?auto_5142 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5153 - SURFACE
      ?auto_5154 - SURFACE
      ?auto_5155 - SURFACE
      ?auto_5156 - SURFACE
    )
    :vars
    (
      ?auto_5165 - HOIST
      ?auto_5162 - PLACE
      ?auto_5164 - PLACE
      ?auto_5160 - HOIST
      ?auto_5159 - SURFACE
      ?auto_5158 - PLACE
      ?auto_5157 - HOIST
      ?auto_5163 - SURFACE
      ?auto_5161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5165 ?auto_5162 ) ( IS-CRATE ?auto_5156 ) ( not ( = ?auto_5155 ?auto_5156 ) ) ( not ( = ?auto_5154 ?auto_5155 ) ) ( not ( = ?auto_5154 ?auto_5156 ) ) ( not ( = ?auto_5164 ?auto_5162 ) ) ( HOIST-AT ?auto_5160 ?auto_5164 ) ( not ( = ?auto_5165 ?auto_5160 ) ) ( AVAILABLE ?auto_5160 ) ( SURFACE-AT ?auto_5156 ?auto_5164 ) ( ON ?auto_5156 ?auto_5159 ) ( CLEAR ?auto_5156 ) ( not ( = ?auto_5155 ?auto_5159 ) ) ( not ( = ?auto_5156 ?auto_5159 ) ) ( not ( = ?auto_5154 ?auto_5159 ) ) ( IS-CRATE ?auto_5155 ) ( not ( = ?auto_5158 ?auto_5162 ) ) ( not ( = ?auto_5164 ?auto_5158 ) ) ( HOIST-AT ?auto_5157 ?auto_5158 ) ( not ( = ?auto_5165 ?auto_5157 ) ) ( not ( = ?auto_5160 ?auto_5157 ) ) ( AVAILABLE ?auto_5157 ) ( SURFACE-AT ?auto_5155 ?auto_5158 ) ( ON ?auto_5155 ?auto_5163 ) ( CLEAR ?auto_5155 ) ( not ( = ?auto_5155 ?auto_5163 ) ) ( not ( = ?auto_5156 ?auto_5163 ) ) ( not ( = ?auto_5154 ?auto_5163 ) ) ( not ( = ?auto_5159 ?auto_5163 ) ) ( TRUCK-AT ?auto_5161 ?auto_5162 ) ( SURFACE-AT ?auto_5153 ?auto_5162 ) ( CLEAR ?auto_5153 ) ( IS-CRATE ?auto_5154 ) ( not ( = ?auto_5153 ?auto_5154 ) ) ( not ( = ?auto_5155 ?auto_5153 ) ) ( not ( = ?auto_5156 ?auto_5153 ) ) ( not ( = ?auto_5159 ?auto_5153 ) ) ( not ( = ?auto_5163 ?auto_5153 ) ) ( AVAILABLE ?auto_5165 ) ( IN ?auto_5154 ?auto_5161 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5154 ?auto_5155 ?auto_5156 )
      ( MAKE-3CRATE-VERIFY ?auto_5153 ?auto_5154 ?auto_5155 ?auto_5156 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5166 - SURFACE
      ?auto_5167 - SURFACE
    )
    :vars
    (
      ?auto_5178 - HOIST
      ?auto_5175 - PLACE
      ?auto_5172 - SURFACE
      ?auto_5177 - PLACE
      ?auto_5173 - HOIST
      ?auto_5171 - SURFACE
      ?auto_5169 - PLACE
      ?auto_5168 - HOIST
      ?auto_5176 - SURFACE
      ?auto_5170 - SURFACE
      ?auto_5174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5178 ?auto_5175 ) ( IS-CRATE ?auto_5167 ) ( not ( = ?auto_5166 ?auto_5167 ) ) ( not ( = ?auto_5172 ?auto_5166 ) ) ( not ( = ?auto_5172 ?auto_5167 ) ) ( not ( = ?auto_5177 ?auto_5175 ) ) ( HOIST-AT ?auto_5173 ?auto_5177 ) ( not ( = ?auto_5178 ?auto_5173 ) ) ( AVAILABLE ?auto_5173 ) ( SURFACE-AT ?auto_5167 ?auto_5177 ) ( ON ?auto_5167 ?auto_5171 ) ( CLEAR ?auto_5167 ) ( not ( = ?auto_5166 ?auto_5171 ) ) ( not ( = ?auto_5167 ?auto_5171 ) ) ( not ( = ?auto_5172 ?auto_5171 ) ) ( IS-CRATE ?auto_5166 ) ( not ( = ?auto_5169 ?auto_5175 ) ) ( not ( = ?auto_5177 ?auto_5169 ) ) ( HOIST-AT ?auto_5168 ?auto_5169 ) ( not ( = ?auto_5178 ?auto_5168 ) ) ( not ( = ?auto_5173 ?auto_5168 ) ) ( AVAILABLE ?auto_5168 ) ( SURFACE-AT ?auto_5166 ?auto_5169 ) ( ON ?auto_5166 ?auto_5176 ) ( CLEAR ?auto_5166 ) ( not ( = ?auto_5166 ?auto_5176 ) ) ( not ( = ?auto_5167 ?auto_5176 ) ) ( not ( = ?auto_5172 ?auto_5176 ) ) ( not ( = ?auto_5171 ?auto_5176 ) ) ( SURFACE-AT ?auto_5170 ?auto_5175 ) ( CLEAR ?auto_5170 ) ( IS-CRATE ?auto_5172 ) ( not ( = ?auto_5170 ?auto_5172 ) ) ( not ( = ?auto_5166 ?auto_5170 ) ) ( not ( = ?auto_5167 ?auto_5170 ) ) ( not ( = ?auto_5171 ?auto_5170 ) ) ( not ( = ?auto_5176 ?auto_5170 ) ) ( AVAILABLE ?auto_5178 ) ( IN ?auto_5172 ?auto_5174 ) ( TRUCK-AT ?auto_5174 ?auto_5177 ) )
    :subtasks
    ( ( !DRIVE ?auto_5174 ?auto_5177 ?auto_5175 )
      ( MAKE-2CRATE ?auto_5172 ?auto_5166 ?auto_5167 )
      ( MAKE-1CRATE-VERIFY ?auto_5166 ?auto_5167 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5179 - SURFACE
      ?auto_5180 - SURFACE
      ?auto_5181 - SURFACE
    )
    :vars
    (
      ?auto_5188 - HOIST
      ?auto_5187 - PLACE
      ?auto_5191 - PLACE
      ?auto_5189 - HOIST
      ?auto_5186 - SURFACE
      ?auto_5184 - PLACE
      ?auto_5190 - HOIST
      ?auto_5185 - SURFACE
      ?auto_5182 - SURFACE
      ?auto_5183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5188 ?auto_5187 ) ( IS-CRATE ?auto_5181 ) ( not ( = ?auto_5180 ?auto_5181 ) ) ( not ( = ?auto_5179 ?auto_5180 ) ) ( not ( = ?auto_5179 ?auto_5181 ) ) ( not ( = ?auto_5191 ?auto_5187 ) ) ( HOIST-AT ?auto_5189 ?auto_5191 ) ( not ( = ?auto_5188 ?auto_5189 ) ) ( AVAILABLE ?auto_5189 ) ( SURFACE-AT ?auto_5181 ?auto_5191 ) ( ON ?auto_5181 ?auto_5186 ) ( CLEAR ?auto_5181 ) ( not ( = ?auto_5180 ?auto_5186 ) ) ( not ( = ?auto_5181 ?auto_5186 ) ) ( not ( = ?auto_5179 ?auto_5186 ) ) ( IS-CRATE ?auto_5180 ) ( not ( = ?auto_5184 ?auto_5187 ) ) ( not ( = ?auto_5191 ?auto_5184 ) ) ( HOIST-AT ?auto_5190 ?auto_5184 ) ( not ( = ?auto_5188 ?auto_5190 ) ) ( not ( = ?auto_5189 ?auto_5190 ) ) ( AVAILABLE ?auto_5190 ) ( SURFACE-AT ?auto_5180 ?auto_5184 ) ( ON ?auto_5180 ?auto_5185 ) ( CLEAR ?auto_5180 ) ( not ( = ?auto_5180 ?auto_5185 ) ) ( not ( = ?auto_5181 ?auto_5185 ) ) ( not ( = ?auto_5179 ?auto_5185 ) ) ( not ( = ?auto_5186 ?auto_5185 ) ) ( SURFACE-AT ?auto_5182 ?auto_5187 ) ( CLEAR ?auto_5182 ) ( IS-CRATE ?auto_5179 ) ( not ( = ?auto_5182 ?auto_5179 ) ) ( not ( = ?auto_5180 ?auto_5182 ) ) ( not ( = ?auto_5181 ?auto_5182 ) ) ( not ( = ?auto_5186 ?auto_5182 ) ) ( not ( = ?auto_5185 ?auto_5182 ) ) ( AVAILABLE ?auto_5188 ) ( IN ?auto_5179 ?auto_5183 ) ( TRUCK-AT ?auto_5183 ?auto_5191 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5180 ?auto_5181 )
      ( MAKE-2CRATE-VERIFY ?auto_5179 ?auto_5180 ?auto_5181 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5192 - SURFACE
      ?auto_5193 - SURFACE
      ?auto_5194 - SURFACE
      ?auto_5195 - SURFACE
    )
    :vars
    (
      ?auto_5204 - HOIST
      ?auto_5200 - PLACE
      ?auto_5201 - PLACE
      ?auto_5197 - HOIST
      ?auto_5202 - SURFACE
      ?auto_5203 - PLACE
      ?auto_5196 - HOIST
      ?auto_5199 - SURFACE
      ?auto_5198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5204 ?auto_5200 ) ( IS-CRATE ?auto_5195 ) ( not ( = ?auto_5194 ?auto_5195 ) ) ( not ( = ?auto_5193 ?auto_5194 ) ) ( not ( = ?auto_5193 ?auto_5195 ) ) ( not ( = ?auto_5201 ?auto_5200 ) ) ( HOIST-AT ?auto_5197 ?auto_5201 ) ( not ( = ?auto_5204 ?auto_5197 ) ) ( AVAILABLE ?auto_5197 ) ( SURFACE-AT ?auto_5195 ?auto_5201 ) ( ON ?auto_5195 ?auto_5202 ) ( CLEAR ?auto_5195 ) ( not ( = ?auto_5194 ?auto_5202 ) ) ( not ( = ?auto_5195 ?auto_5202 ) ) ( not ( = ?auto_5193 ?auto_5202 ) ) ( IS-CRATE ?auto_5194 ) ( not ( = ?auto_5203 ?auto_5200 ) ) ( not ( = ?auto_5201 ?auto_5203 ) ) ( HOIST-AT ?auto_5196 ?auto_5203 ) ( not ( = ?auto_5204 ?auto_5196 ) ) ( not ( = ?auto_5197 ?auto_5196 ) ) ( AVAILABLE ?auto_5196 ) ( SURFACE-AT ?auto_5194 ?auto_5203 ) ( ON ?auto_5194 ?auto_5199 ) ( CLEAR ?auto_5194 ) ( not ( = ?auto_5194 ?auto_5199 ) ) ( not ( = ?auto_5195 ?auto_5199 ) ) ( not ( = ?auto_5193 ?auto_5199 ) ) ( not ( = ?auto_5202 ?auto_5199 ) ) ( SURFACE-AT ?auto_5192 ?auto_5200 ) ( CLEAR ?auto_5192 ) ( IS-CRATE ?auto_5193 ) ( not ( = ?auto_5192 ?auto_5193 ) ) ( not ( = ?auto_5194 ?auto_5192 ) ) ( not ( = ?auto_5195 ?auto_5192 ) ) ( not ( = ?auto_5202 ?auto_5192 ) ) ( not ( = ?auto_5199 ?auto_5192 ) ) ( AVAILABLE ?auto_5204 ) ( IN ?auto_5193 ?auto_5198 ) ( TRUCK-AT ?auto_5198 ?auto_5201 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5193 ?auto_5194 ?auto_5195 )
      ( MAKE-3CRATE-VERIFY ?auto_5192 ?auto_5193 ?auto_5194 ?auto_5195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5205 - SURFACE
      ?auto_5206 - SURFACE
    )
    :vars
    (
      ?auto_5216 - HOIST
      ?auto_5211 - PLACE
      ?auto_5217 - SURFACE
      ?auto_5212 - PLACE
      ?auto_5208 - HOIST
      ?auto_5213 - SURFACE
      ?auto_5214 - PLACE
      ?auto_5207 - HOIST
      ?auto_5210 - SURFACE
      ?auto_5215 - SURFACE
      ?auto_5209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5216 ?auto_5211 ) ( IS-CRATE ?auto_5206 ) ( not ( = ?auto_5205 ?auto_5206 ) ) ( not ( = ?auto_5217 ?auto_5205 ) ) ( not ( = ?auto_5217 ?auto_5206 ) ) ( not ( = ?auto_5212 ?auto_5211 ) ) ( HOIST-AT ?auto_5208 ?auto_5212 ) ( not ( = ?auto_5216 ?auto_5208 ) ) ( SURFACE-AT ?auto_5206 ?auto_5212 ) ( ON ?auto_5206 ?auto_5213 ) ( CLEAR ?auto_5206 ) ( not ( = ?auto_5205 ?auto_5213 ) ) ( not ( = ?auto_5206 ?auto_5213 ) ) ( not ( = ?auto_5217 ?auto_5213 ) ) ( IS-CRATE ?auto_5205 ) ( not ( = ?auto_5214 ?auto_5211 ) ) ( not ( = ?auto_5212 ?auto_5214 ) ) ( HOIST-AT ?auto_5207 ?auto_5214 ) ( not ( = ?auto_5216 ?auto_5207 ) ) ( not ( = ?auto_5208 ?auto_5207 ) ) ( AVAILABLE ?auto_5207 ) ( SURFACE-AT ?auto_5205 ?auto_5214 ) ( ON ?auto_5205 ?auto_5210 ) ( CLEAR ?auto_5205 ) ( not ( = ?auto_5205 ?auto_5210 ) ) ( not ( = ?auto_5206 ?auto_5210 ) ) ( not ( = ?auto_5217 ?auto_5210 ) ) ( not ( = ?auto_5213 ?auto_5210 ) ) ( SURFACE-AT ?auto_5215 ?auto_5211 ) ( CLEAR ?auto_5215 ) ( IS-CRATE ?auto_5217 ) ( not ( = ?auto_5215 ?auto_5217 ) ) ( not ( = ?auto_5205 ?auto_5215 ) ) ( not ( = ?auto_5206 ?auto_5215 ) ) ( not ( = ?auto_5213 ?auto_5215 ) ) ( not ( = ?auto_5210 ?auto_5215 ) ) ( AVAILABLE ?auto_5216 ) ( TRUCK-AT ?auto_5209 ?auto_5212 ) ( LIFTING ?auto_5208 ?auto_5217 ) )
    :subtasks
    ( ( !LOAD ?auto_5208 ?auto_5217 ?auto_5209 ?auto_5212 )
      ( MAKE-2CRATE ?auto_5217 ?auto_5205 ?auto_5206 )
      ( MAKE-1CRATE-VERIFY ?auto_5205 ?auto_5206 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5218 - SURFACE
      ?auto_5219 - SURFACE
      ?auto_5220 - SURFACE
    )
    :vars
    (
      ?auto_5228 - HOIST
      ?auto_5229 - PLACE
      ?auto_5221 - PLACE
      ?auto_5224 - HOIST
      ?auto_5226 - SURFACE
      ?auto_5225 - PLACE
      ?auto_5230 - HOIST
      ?auto_5227 - SURFACE
      ?auto_5223 - SURFACE
      ?auto_5222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5228 ?auto_5229 ) ( IS-CRATE ?auto_5220 ) ( not ( = ?auto_5219 ?auto_5220 ) ) ( not ( = ?auto_5218 ?auto_5219 ) ) ( not ( = ?auto_5218 ?auto_5220 ) ) ( not ( = ?auto_5221 ?auto_5229 ) ) ( HOIST-AT ?auto_5224 ?auto_5221 ) ( not ( = ?auto_5228 ?auto_5224 ) ) ( SURFACE-AT ?auto_5220 ?auto_5221 ) ( ON ?auto_5220 ?auto_5226 ) ( CLEAR ?auto_5220 ) ( not ( = ?auto_5219 ?auto_5226 ) ) ( not ( = ?auto_5220 ?auto_5226 ) ) ( not ( = ?auto_5218 ?auto_5226 ) ) ( IS-CRATE ?auto_5219 ) ( not ( = ?auto_5225 ?auto_5229 ) ) ( not ( = ?auto_5221 ?auto_5225 ) ) ( HOIST-AT ?auto_5230 ?auto_5225 ) ( not ( = ?auto_5228 ?auto_5230 ) ) ( not ( = ?auto_5224 ?auto_5230 ) ) ( AVAILABLE ?auto_5230 ) ( SURFACE-AT ?auto_5219 ?auto_5225 ) ( ON ?auto_5219 ?auto_5227 ) ( CLEAR ?auto_5219 ) ( not ( = ?auto_5219 ?auto_5227 ) ) ( not ( = ?auto_5220 ?auto_5227 ) ) ( not ( = ?auto_5218 ?auto_5227 ) ) ( not ( = ?auto_5226 ?auto_5227 ) ) ( SURFACE-AT ?auto_5223 ?auto_5229 ) ( CLEAR ?auto_5223 ) ( IS-CRATE ?auto_5218 ) ( not ( = ?auto_5223 ?auto_5218 ) ) ( not ( = ?auto_5219 ?auto_5223 ) ) ( not ( = ?auto_5220 ?auto_5223 ) ) ( not ( = ?auto_5226 ?auto_5223 ) ) ( not ( = ?auto_5227 ?auto_5223 ) ) ( AVAILABLE ?auto_5228 ) ( TRUCK-AT ?auto_5222 ?auto_5221 ) ( LIFTING ?auto_5224 ?auto_5218 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5219 ?auto_5220 )
      ( MAKE-2CRATE-VERIFY ?auto_5218 ?auto_5219 ?auto_5220 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5231 - SURFACE
      ?auto_5232 - SURFACE
      ?auto_5233 - SURFACE
      ?auto_5234 - SURFACE
    )
    :vars
    (
      ?auto_5242 - HOIST
      ?auto_5238 - PLACE
      ?auto_5237 - PLACE
      ?auto_5236 - HOIST
      ?auto_5239 - SURFACE
      ?auto_5240 - PLACE
      ?auto_5241 - HOIST
      ?auto_5235 - SURFACE
      ?auto_5243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5242 ?auto_5238 ) ( IS-CRATE ?auto_5234 ) ( not ( = ?auto_5233 ?auto_5234 ) ) ( not ( = ?auto_5232 ?auto_5233 ) ) ( not ( = ?auto_5232 ?auto_5234 ) ) ( not ( = ?auto_5237 ?auto_5238 ) ) ( HOIST-AT ?auto_5236 ?auto_5237 ) ( not ( = ?auto_5242 ?auto_5236 ) ) ( SURFACE-AT ?auto_5234 ?auto_5237 ) ( ON ?auto_5234 ?auto_5239 ) ( CLEAR ?auto_5234 ) ( not ( = ?auto_5233 ?auto_5239 ) ) ( not ( = ?auto_5234 ?auto_5239 ) ) ( not ( = ?auto_5232 ?auto_5239 ) ) ( IS-CRATE ?auto_5233 ) ( not ( = ?auto_5240 ?auto_5238 ) ) ( not ( = ?auto_5237 ?auto_5240 ) ) ( HOIST-AT ?auto_5241 ?auto_5240 ) ( not ( = ?auto_5242 ?auto_5241 ) ) ( not ( = ?auto_5236 ?auto_5241 ) ) ( AVAILABLE ?auto_5241 ) ( SURFACE-AT ?auto_5233 ?auto_5240 ) ( ON ?auto_5233 ?auto_5235 ) ( CLEAR ?auto_5233 ) ( not ( = ?auto_5233 ?auto_5235 ) ) ( not ( = ?auto_5234 ?auto_5235 ) ) ( not ( = ?auto_5232 ?auto_5235 ) ) ( not ( = ?auto_5239 ?auto_5235 ) ) ( SURFACE-AT ?auto_5231 ?auto_5238 ) ( CLEAR ?auto_5231 ) ( IS-CRATE ?auto_5232 ) ( not ( = ?auto_5231 ?auto_5232 ) ) ( not ( = ?auto_5233 ?auto_5231 ) ) ( not ( = ?auto_5234 ?auto_5231 ) ) ( not ( = ?auto_5239 ?auto_5231 ) ) ( not ( = ?auto_5235 ?auto_5231 ) ) ( AVAILABLE ?auto_5242 ) ( TRUCK-AT ?auto_5243 ?auto_5237 ) ( LIFTING ?auto_5236 ?auto_5232 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5232 ?auto_5233 ?auto_5234 )
      ( MAKE-3CRATE-VERIFY ?auto_5231 ?auto_5232 ?auto_5233 ?auto_5234 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5244 - SURFACE
      ?auto_5245 - SURFACE
    )
    :vars
    (
      ?auto_5254 - HOIST
      ?auto_5249 - PLACE
      ?auto_5256 - SURFACE
      ?auto_5248 - PLACE
      ?auto_5247 - HOIST
      ?auto_5250 - SURFACE
      ?auto_5251 - PLACE
      ?auto_5253 - HOIST
      ?auto_5246 - SURFACE
      ?auto_5252 - SURFACE
      ?auto_5255 - TRUCK
      ?auto_5257 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5254 ?auto_5249 ) ( IS-CRATE ?auto_5245 ) ( not ( = ?auto_5244 ?auto_5245 ) ) ( not ( = ?auto_5256 ?auto_5244 ) ) ( not ( = ?auto_5256 ?auto_5245 ) ) ( not ( = ?auto_5248 ?auto_5249 ) ) ( HOIST-AT ?auto_5247 ?auto_5248 ) ( not ( = ?auto_5254 ?auto_5247 ) ) ( SURFACE-AT ?auto_5245 ?auto_5248 ) ( ON ?auto_5245 ?auto_5250 ) ( CLEAR ?auto_5245 ) ( not ( = ?auto_5244 ?auto_5250 ) ) ( not ( = ?auto_5245 ?auto_5250 ) ) ( not ( = ?auto_5256 ?auto_5250 ) ) ( IS-CRATE ?auto_5244 ) ( not ( = ?auto_5251 ?auto_5249 ) ) ( not ( = ?auto_5248 ?auto_5251 ) ) ( HOIST-AT ?auto_5253 ?auto_5251 ) ( not ( = ?auto_5254 ?auto_5253 ) ) ( not ( = ?auto_5247 ?auto_5253 ) ) ( AVAILABLE ?auto_5253 ) ( SURFACE-AT ?auto_5244 ?auto_5251 ) ( ON ?auto_5244 ?auto_5246 ) ( CLEAR ?auto_5244 ) ( not ( = ?auto_5244 ?auto_5246 ) ) ( not ( = ?auto_5245 ?auto_5246 ) ) ( not ( = ?auto_5256 ?auto_5246 ) ) ( not ( = ?auto_5250 ?auto_5246 ) ) ( SURFACE-AT ?auto_5252 ?auto_5249 ) ( CLEAR ?auto_5252 ) ( IS-CRATE ?auto_5256 ) ( not ( = ?auto_5252 ?auto_5256 ) ) ( not ( = ?auto_5244 ?auto_5252 ) ) ( not ( = ?auto_5245 ?auto_5252 ) ) ( not ( = ?auto_5250 ?auto_5252 ) ) ( not ( = ?auto_5246 ?auto_5252 ) ) ( AVAILABLE ?auto_5254 ) ( TRUCK-AT ?auto_5255 ?auto_5248 ) ( AVAILABLE ?auto_5247 ) ( SURFACE-AT ?auto_5256 ?auto_5248 ) ( ON ?auto_5256 ?auto_5257 ) ( CLEAR ?auto_5256 ) ( not ( = ?auto_5244 ?auto_5257 ) ) ( not ( = ?auto_5245 ?auto_5257 ) ) ( not ( = ?auto_5256 ?auto_5257 ) ) ( not ( = ?auto_5250 ?auto_5257 ) ) ( not ( = ?auto_5246 ?auto_5257 ) ) ( not ( = ?auto_5252 ?auto_5257 ) ) )
    :subtasks
    ( ( !LIFT ?auto_5247 ?auto_5256 ?auto_5257 ?auto_5248 )
      ( MAKE-2CRATE ?auto_5256 ?auto_5244 ?auto_5245 )
      ( MAKE-1CRATE-VERIFY ?auto_5244 ?auto_5245 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5258 - SURFACE
      ?auto_5259 - SURFACE
      ?auto_5260 - SURFACE
    )
    :vars
    (
      ?auto_5271 - HOIST
      ?auto_5263 - PLACE
      ?auto_5264 - PLACE
      ?auto_5270 - HOIST
      ?auto_5266 - SURFACE
      ?auto_5261 - PLACE
      ?auto_5267 - HOIST
      ?auto_5265 - SURFACE
      ?auto_5268 - SURFACE
      ?auto_5262 - TRUCK
      ?auto_5269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5271 ?auto_5263 ) ( IS-CRATE ?auto_5260 ) ( not ( = ?auto_5259 ?auto_5260 ) ) ( not ( = ?auto_5258 ?auto_5259 ) ) ( not ( = ?auto_5258 ?auto_5260 ) ) ( not ( = ?auto_5264 ?auto_5263 ) ) ( HOIST-AT ?auto_5270 ?auto_5264 ) ( not ( = ?auto_5271 ?auto_5270 ) ) ( SURFACE-AT ?auto_5260 ?auto_5264 ) ( ON ?auto_5260 ?auto_5266 ) ( CLEAR ?auto_5260 ) ( not ( = ?auto_5259 ?auto_5266 ) ) ( not ( = ?auto_5260 ?auto_5266 ) ) ( not ( = ?auto_5258 ?auto_5266 ) ) ( IS-CRATE ?auto_5259 ) ( not ( = ?auto_5261 ?auto_5263 ) ) ( not ( = ?auto_5264 ?auto_5261 ) ) ( HOIST-AT ?auto_5267 ?auto_5261 ) ( not ( = ?auto_5271 ?auto_5267 ) ) ( not ( = ?auto_5270 ?auto_5267 ) ) ( AVAILABLE ?auto_5267 ) ( SURFACE-AT ?auto_5259 ?auto_5261 ) ( ON ?auto_5259 ?auto_5265 ) ( CLEAR ?auto_5259 ) ( not ( = ?auto_5259 ?auto_5265 ) ) ( not ( = ?auto_5260 ?auto_5265 ) ) ( not ( = ?auto_5258 ?auto_5265 ) ) ( not ( = ?auto_5266 ?auto_5265 ) ) ( SURFACE-AT ?auto_5268 ?auto_5263 ) ( CLEAR ?auto_5268 ) ( IS-CRATE ?auto_5258 ) ( not ( = ?auto_5268 ?auto_5258 ) ) ( not ( = ?auto_5259 ?auto_5268 ) ) ( not ( = ?auto_5260 ?auto_5268 ) ) ( not ( = ?auto_5266 ?auto_5268 ) ) ( not ( = ?auto_5265 ?auto_5268 ) ) ( AVAILABLE ?auto_5271 ) ( TRUCK-AT ?auto_5262 ?auto_5264 ) ( AVAILABLE ?auto_5270 ) ( SURFACE-AT ?auto_5258 ?auto_5264 ) ( ON ?auto_5258 ?auto_5269 ) ( CLEAR ?auto_5258 ) ( not ( = ?auto_5259 ?auto_5269 ) ) ( not ( = ?auto_5260 ?auto_5269 ) ) ( not ( = ?auto_5258 ?auto_5269 ) ) ( not ( = ?auto_5266 ?auto_5269 ) ) ( not ( = ?auto_5265 ?auto_5269 ) ) ( not ( = ?auto_5268 ?auto_5269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5259 ?auto_5260 )
      ( MAKE-2CRATE-VERIFY ?auto_5258 ?auto_5259 ?auto_5260 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5272 - SURFACE
      ?auto_5273 - SURFACE
      ?auto_5274 - SURFACE
      ?auto_5275 - SURFACE
    )
    :vars
    (
      ?auto_5276 - HOIST
      ?auto_5282 - PLACE
      ?auto_5283 - PLACE
      ?auto_5279 - HOIST
      ?auto_5284 - SURFACE
      ?auto_5278 - PLACE
      ?auto_5285 - HOIST
      ?auto_5280 - SURFACE
      ?auto_5281 - TRUCK
      ?auto_5277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_5276 ?auto_5282 ) ( IS-CRATE ?auto_5275 ) ( not ( = ?auto_5274 ?auto_5275 ) ) ( not ( = ?auto_5273 ?auto_5274 ) ) ( not ( = ?auto_5273 ?auto_5275 ) ) ( not ( = ?auto_5283 ?auto_5282 ) ) ( HOIST-AT ?auto_5279 ?auto_5283 ) ( not ( = ?auto_5276 ?auto_5279 ) ) ( SURFACE-AT ?auto_5275 ?auto_5283 ) ( ON ?auto_5275 ?auto_5284 ) ( CLEAR ?auto_5275 ) ( not ( = ?auto_5274 ?auto_5284 ) ) ( not ( = ?auto_5275 ?auto_5284 ) ) ( not ( = ?auto_5273 ?auto_5284 ) ) ( IS-CRATE ?auto_5274 ) ( not ( = ?auto_5278 ?auto_5282 ) ) ( not ( = ?auto_5283 ?auto_5278 ) ) ( HOIST-AT ?auto_5285 ?auto_5278 ) ( not ( = ?auto_5276 ?auto_5285 ) ) ( not ( = ?auto_5279 ?auto_5285 ) ) ( AVAILABLE ?auto_5285 ) ( SURFACE-AT ?auto_5274 ?auto_5278 ) ( ON ?auto_5274 ?auto_5280 ) ( CLEAR ?auto_5274 ) ( not ( = ?auto_5274 ?auto_5280 ) ) ( not ( = ?auto_5275 ?auto_5280 ) ) ( not ( = ?auto_5273 ?auto_5280 ) ) ( not ( = ?auto_5284 ?auto_5280 ) ) ( SURFACE-AT ?auto_5272 ?auto_5282 ) ( CLEAR ?auto_5272 ) ( IS-CRATE ?auto_5273 ) ( not ( = ?auto_5272 ?auto_5273 ) ) ( not ( = ?auto_5274 ?auto_5272 ) ) ( not ( = ?auto_5275 ?auto_5272 ) ) ( not ( = ?auto_5284 ?auto_5272 ) ) ( not ( = ?auto_5280 ?auto_5272 ) ) ( AVAILABLE ?auto_5276 ) ( TRUCK-AT ?auto_5281 ?auto_5283 ) ( AVAILABLE ?auto_5279 ) ( SURFACE-AT ?auto_5273 ?auto_5283 ) ( ON ?auto_5273 ?auto_5277 ) ( CLEAR ?auto_5273 ) ( not ( = ?auto_5274 ?auto_5277 ) ) ( not ( = ?auto_5275 ?auto_5277 ) ) ( not ( = ?auto_5273 ?auto_5277 ) ) ( not ( = ?auto_5284 ?auto_5277 ) ) ( not ( = ?auto_5280 ?auto_5277 ) ) ( not ( = ?auto_5272 ?auto_5277 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5273 ?auto_5274 ?auto_5275 )
      ( MAKE-3CRATE-VERIFY ?auto_5272 ?auto_5273 ?auto_5274 ?auto_5275 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_5286 - SURFACE
      ?auto_5287 - SURFACE
    )
    :vars
    (
      ?auto_5288 - HOIST
      ?auto_5295 - PLACE
      ?auto_5299 - SURFACE
      ?auto_5296 - PLACE
      ?auto_5292 - HOIST
      ?auto_5297 - SURFACE
      ?auto_5290 - PLACE
      ?auto_5298 - HOIST
      ?auto_5293 - SURFACE
      ?auto_5291 - SURFACE
      ?auto_5289 - SURFACE
      ?auto_5294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5288 ?auto_5295 ) ( IS-CRATE ?auto_5287 ) ( not ( = ?auto_5286 ?auto_5287 ) ) ( not ( = ?auto_5299 ?auto_5286 ) ) ( not ( = ?auto_5299 ?auto_5287 ) ) ( not ( = ?auto_5296 ?auto_5295 ) ) ( HOIST-AT ?auto_5292 ?auto_5296 ) ( not ( = ?auto_5288 ?auto_5292 ) ) ( SURFACE-AT ?auto_5287 ?auto_5296 ) ( ON ?auto_5287 ?auto_5297 ) ( CLEAR ?auto_5287 ) ( not ( = ?auto_5286 ?auto_5297 ) ) ( not ( = ?auto_5287 ?auto_5297 ) ) ( not ( = ?auto_5299 ?auto_5297 ) ) ( IS-CRATE ?auto_5286 ) ( not ( = ?auto_5290 ?auto_5295 ) ) ( not ( = ?auto_5296 ?auto_5290 ) ) ( HOIST-AT ?auto_5298 ?auto_5290 ) ( not ( = ?auto_5288 ?auto_5298 ) ) ( not ( = ?auto_5292 ?auto_5298 ) ) ( AVAILABLE ?auto_5298 ) ( SURFACE-AT ?auto_5286 ?auto_5290 ) ( ON ?auto_5286 ?auto_5293 ) ( CLEAR ?auto_5286 ) ( not ( = ?auto_5286 ?auto_5293 ) ) ( not ( = ?auto_5287 ?auto_5293 ) ) ( not ( = ?auto_5299 ?auto_5293 ) ) ( not ( = ?auto_5297 ?auto_5293 ) ) ( SURFACE-AT ?auto_5291 ?auto_5295 ) ( CLEAR ?auto_5291 ) ( IS-CRATE ?auto_5299 ) ( not ( = ?auto_5291 ?auto_5299 ) ) ( not ( = ?auto_5286 ?auto_5291 ) ) ( not ( = ?auto_5287 ?auto_5291 ) ) ( not ( = ?auto_5297 ?auto_5291 ) ) ( not ( = ?auto_5293 ?auto_5291 ) ) ( AVAILABLE ?auto_5288 ) ( AVAILABLE ?auto_5292 ) ( SURFACE-AT ?auto_5299 ?auto_5296 ) ( ON ?auto_5299 ?auto_5289 ) ( CLEAR ?auto_5299 ) ( not ( = ?auto_5286 ?auto_5289 ) ) ( not ( = ?auto_5287 ?auto_5289 ) ) ( not ( = ?auto_5299 ?auto_5289 ) ) ( not ( = ?auto_5297 ?auto_5289 ) ) ( not ( = ?auto_5293 ?auto_5289 ) ) ( not ( = ?auto_5291 ?auto_5289 ) ) ( TRUCK-AT ?auto_5294 ?auto_5295 ) )
    :subtasks
    ( ( !DRIVE ?auto_5294 ?auto_5295 ?auto_5296 )
      ( MAKE-2CRATE ?auto_5299 ?auto_5286 ?auto_5287 )
      ( MAKE-1CRATE-VERIFY ?auto_5286 ?auto_5287 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_5300 - SURFACE
      ?auto_5301 - SURFACE
      ?auto_5302 - SURFACE
    )
    :vars
    (
      ?auto_5313 - HOIST
      ?auto_5310 - PLACE
      ?auto_5303 - PLACE
      ?auto_5305 - HOIST
      ?auto_5308 - SURFACE
      ?auto_5311 - PLACE
      ?auto_5312 - HOIST
      ?auto_5307 - SURFACE
      ?auto_5309 - SURFACE
      ?auto_5306 - SURFACE
      ?auto_5304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5313 ?auto_5310 ) ( IS-CRATE ?auto_5302 ) ( not ( = ?auto_5301 ?auto_5302 ) ) ( not ( = ?auto_5300 ?auto_5301 ) ) ( not ( = ?auto_5300 ?auto_5302 ) ) ( not ( = ?auto_5303 ?auto_5310 ) ) ( HOIST-AT ?auto_5305 ?auto_5303 ) ( not ( = ?auto_5313 ?auto_5305 ) ) ( SURFACE-AT ?auto_5302 ?auto_5303 ) ( ON ?auto_5302 ?auto_5308 ) ( CLEAR ?auto_5302 ) ( not ( = ?auto_5301 ?auto_5308 ) ) ( not ( = ?auto_5302 ?auto_5308 ) ) ( not ( = ?auto_5300 ?auto_5308 ) ) ( IS-CRATE ?auto_5301 ) ( not ( = ?auto_5311 ?auto_5310 ) ) ( not ( = ?auto_5303 ?auto_5311 ) ) ( HOIST-AT ?auto_5312 ?auto_5311 ) ( not ( = ?auto_5313 ?auto_5312 ) ) ( not ( = ?auto_5305 ?auto_5312 ) ) ( AVAILABLE ?auto_5312 ) ( SURFACE-AT ?auto_5301 ?auto_5311 ) ( ON ?auto_5301 ?auto_5307 ) ( CLEAR ?auto_5301 ) ( not ( = ?auto_5301 ?auto_5307 ) ) ( not ( = ?auto_5302 ?auto_5307 ) ) ( not ( = ?auto_5300 ?auto_5307 ) ) ( not ( = ?auto_5308 ?auto_5307 ) ) ( SURFACE-AT ?auto_5309 ?auto_5310 ) ( CLEAR ?auto_5309 ) ( IS-CRATE ?auto_5300 ) ( not ( = ?auto_5309 ?auto_5300 ) ) ( not ( = ?auto_5301 ?auto_5309 ) ) ( not ( = ?auto_5302 ?auto_5309 ) ) ( not ( = ?auto_5308 ?auto_5309 ) ) ( not ( = ?auto_5307 ?auto_5309 ) ) ( AVAILABLE ?auto_5313 ) ( AVAILABLE ?auto_5305 ) ( SURFACE-AT ?auto_5300 ?auto_5303 ) ( ON ?auto_5300 ?auto_5306 ) ( CLEAR ?auto_5300 ) ( not ( = ?auto_5301 ?auto_5306 ) ) ( not ( = ?auto_5302 ?auto_5306 ) ) ( not ( = ?auto_5300 ?auto_5306 ) ) ( not ( = ?auto_5308 ?auto_5306 ) ) ( not ( = ?auto_5307 ?auto_5306 ) ) ( not ( = ?auto_5309 ?auto_5306 ) ) ( TRUCK-AT ?auto_5304 ?auto_5310 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_5301 ?auto_5302 )
      ( MAKE-2CRATE-VERIFY ?auto_5300 ?auto_5301 ?auto_5302 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_5314 - SURFACE
      ?auto_5315 - SURFACE
      ?auto_5316 - SURFACE
      ?auto_5317 - SURFACE
    )
    :vars
    (
      ?auto_5323 - HOIST
      ?auto_5319 - PLACE
      ?auto_5327 - PLACE
      ?auto_5320 - HOIST
      ?auto_5318 - SURFACE
      ?auto_5325 - PLACE
      ?auto_5321 - HOIST
      ?auto_5324 - SURFACE
      ?auto_5322 - SURFACE
      ?auto_5326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_5323 ?auto_5319 ) ( IS-CRATE ?auto_5317 ) ( not ( = ?auto_5316 ?auto_5317 ) ) ( not ( = ?auto_5315 ?auto_5316 ) ) ( not ( = ?auto_5315 ?auto_5317 ) ) ( not ( = ?auto_5327 ?auto_5319 ) ) ( HOIST-AT ?auto_5320 ?auto_5327 ) ( not ( = ?auto_5323 ?auto_5320 ) ) ( SURFACE-AT ?auto_5317 ?auto_5327 ) ( ON ?auto_5317 ?auto_5318 ) ( CLEAR ?auto_5317 ) ( not ( = ?auto_5316 ?auto_5318 ) ) ( not ( = ?auto_5317 ?auto_5318 ) ) ( not ( = ?auto_5315 ?auto_5318 ) ) ( IS-CRATE ?auto_5316 ) ( not ( = ?auto_5325 ?auto_5319 ) ) ( not ( = ?auto_5327 ?auto_5325 ) ) ( HOIST-AT ?auto_5321 ?auto_5325 ) ( not ( = ?auto_5323 ?auto_5321 ) ) ( not ( = ?auto_5320 ?auto_5321 ) ) ( AVAILABLE ?auto_5321 ) ( SURFACE-AT ?auto_5316 ?auto_5325 ) ( ON ?auto_5316 ?auto_5324 ) ( CLEAR ?auto_5316 ) ( not ( = ?auto_5316 ?auto_5324 ) ) ( not ( = ?auto_5317 ?auto_5324 ) ) ( not ( = ?auto_5315 ?auto_5324 ) ) ( not ( = ?auto_5318 ?auto_5324 ) ) ( SURFACE-AT ?auto_5314 ?auto_5319 ) ( CLEAR ?auto_5314 ) ( IS-CRATE ?auto_5315 ) ( not ( = ?auto_5314 ?auto_5315 ) ) ( not ( = ?auto_5316 ?auto_5314 ) ) ( not ( = ?auto_5317 ?auto_5314 ) ) ( not ( = ?auto_5318 ?auto_5314 ) ) ( not ( = ?auto_5324 ?auto_5314 ) ) ( AVAILABLE ?auto_5323 ) ( AVAILABLE ?auto_5320 ) ( SURFACE-AT ?auto_5315 ?auto_5327 ) ( ON ?auto_5315 ?auto_5322 ) ( CLEAR ?auto_5315 ) ( not ( = ?auto_5316 ?auto_5322 ) ) ( not ( = ?auto_5317 ?auto_5322 ) ) ( not ( = ?auto_5315 ?auto_5322 ) ) ( not ( = ?auto_5318 ?auto_5322 ) ) ( not ( = ?auto_5324 ?auto_5322 ) ) ( not ( = ?auto_5314 ?auto_5322 ) ) ( TRUCK-AT ?auto_5326 ?auto_5319 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_5315 ?auto_5316 ?auto_5317 )
      ( MAKE-3CRATE-VERIFY ?auto_5314 ?auto_5315 ?auto_5316 ?auto_5317 ) )
  )

)

