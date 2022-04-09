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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4476 - SURFACE
      ?auto_4477 - SURFACE
    )
    :vars
    (
      ?auto_4478 - HOIST
      ?auto_4479 - PLACE
      ?auto_4481 - PLACE
      ?auto_4482 - HOIST
      ?auto_4483 - SURFACE
      ?auto_4480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4478 ?auto_4479 ) ( SURFACE-AT ?auto_4476 ?auto_4479 ) ( CLEAR ?auto_4476 ) ( IS-CRATE ?auto_4477 ) ( AVAILABLE ?auto_4478 ) ( not ( = ?auto_4481 ?auto_4479 ) ) ( HOIST-AT ?auto_4482 ?auto_4481 ) ( AVAILABLE ?auto_4482 ) ( SURFACE-AT ?auto_4477 ?auto_4481 ) ( ON ?auto_4477 ?auto_4483 ) ( CLEAR ?auto_4477 ) ( TRUCK-AT ?auto_4480 ?auto_4479 ) ( not ( = ?auto_4476 ?auto_4477 ) ) ( not ( = ?auto_4476 ?auto_4483 ) ) ( not ( = ?auto_4477 ?auto_4483 ) ) ( not ( = ?auto_4478 ?auto_4482 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4480 ?auto_4479 ?auto_4481 )
      ( !LIFT ?auto_4482 ?auto_4477 ?auto_4483 ?auto_4481 )
      ( !LOAD ?auto_4482 ?auto_4477 ?auto_4480 ?auto_4481 )
      ( !DRIVE ?auto_4480 ?auto_4481 ?auto_4479 )
      ( !UNLOAD ?auto_4478 ?auto_4477 ?auto_4480 ?auto_4479 )
      ( !DROP ?auto_4478 ?auto_4477 ?auto_4476 ?auto_4479 )
      ( MAKE-1CRATE-VERIFY ?auto_4476 ?auto_4477 ) )
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
      ?auto_4490 - HOIST
      ?auto_4493 - PLACE
      ?auto_4494 - PLACE
      ?auto_4495 - HOIST
      ?auto_4492 - SURFACE
      ?auto_4497 - PLACE
      ?auto_4496 - HOIST
      ?auto_4498 - SURFACE
      ?auto_4491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4490 ?auto_4493 ) ( IS-CRATE ?auto_4489 ) ( not ( = ?auto_4494 ?auto_4493 ) ) ( HOIST-AT ?auto_4495 ?auto_4494 ) ( AVAILABLE ?auto_4495 ) ( SURFACE-AT ?auto_4489 ?auto_4494 ) ( ON ?auto_4489 ?auto_4492 ) ( CLEAR ?auto_4489 ) ( not ( = ?auto_4488 ?auto_4489 ) ) ( not ( = ?auto_4488 ?auto_4492 ) ) ( not ( = ?auto_4489 ?auto_4492 ) ) ( not ( = ?auto_4490 ?auto_4495 ) ) ( SURFACE-AT ?auto_4487 ?auto_4493 ) ( CLEAR ?auto_4487 ) ( IS-CRATE ?auto_4488 ) ( AVAILABLE ?auto_4490 ) ( not ( = ?auto_4497 ?auto_4493 ) ) ( HOIST-AT ?auto_4496 ?auto_4497 ) ( AVAILABLE ?auto_4496 ) ( SURFACE-AT ?auto_4488 ?auto_4497 ) ( ON ?auto_4488 ?auto_4498 ) ( CLEAR ?auto_4488 ) ( TRUCK-AT ?auto_4491 ?auto_4493 ) ( not ( = ?auto_4487 ?auto_4488 ) ) ( not ( = ?auto_4487 ?auto_4498 ) ) ( not ( = ?auto_4488 ?auto_4498 ) ) ( not ( = ?auto_4490 ?auto_4496 ) ) ( not ( = ?auto_4487 ?auto_4489 ) ) ( not ( = ?auto_4487 ?auto_4492 ) ) ( not ( = ?auto_4489 ?auto_4498 ) ) ( not ( = ?auto_4494 ?auto_4497 ) ) ( not ( = ?auto_4495 ?auto_4496 ) ) ( not ( = ?auto_4492 ?auto_4498 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4487 ?auto_4488 )
      ( MAKE-1CRATE ?auto_4488 ?auto_4489 )
      ( MAKE-2CRATE-VERIFY ?auto_4487 ?auto_4488 ?auto_4489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4501 - SURFACE
      ?auto_4502 - SURFACE
    )
    :vars
    (
      ?auto_4503 - HOIST
      ?auto_4504 - PLACE
      ?auto_4506 - PLACE
      ?auto_4507 - HOIST
      ?auto_4508 - SURFACE
      ?auto_4505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4503 ?auto_4504 ) ( SURFACE-AT ?auto_4501 ?auto_4504 ) ( CLEAR ?auto_4501 ) ( IS-CRATE ?auto_4502 ) ( AVAILABLE ?auto_4503 ) ( not ( = ?auto_4506 ?auto_4504 ) ) ( HOIST-AT ?auto_4507 ?auto_4506 ) ( AVAILABLE ?auto_4507 ) ( SURFACE-AT ?auto_4502 ?auto_4506 ) ( ON ?auto_4502 ?auto_4508 ) ( CLEAR ?auto_4502 ) ( TRUCK-AT ?auto_4505 ?auto_4504 ) ( not ( = ?auto_4501 ?auto_4502 ) ) ( not ( = ?auto_4501 ?auto_4508 ) ) ( not ( = ?auto_4502 ?auto_4508 ) ) ( not ( = ?auto_4503 ?auto_4507 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4505 ?auto_4504 ?auto_4506 )
      ( !LIFT ?auto_4507 ?auto_4502 ?auto_4508 ?auto_4506 )
      ( !LOAD ?auto_4507 ?auto_4502 ?auto_4505 ?auto_4506 )
      ( !DRIVE ?auto_4505 ?auto_4506 ?auto_4504 )
      ( !UNLOAD ?auto_4503 ?auto_4502 ?auto_4505 ?auto_4504 )
      ( !DROP ?auto_4503 ?auto_4502 ?auto_4501 ?auto_4504 )
      ( MAKE-1CRATE-VERIFY ?auto_4501 ?auto_4502 ) )
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
      ?auto_4518 - HOIST
      ?auto_4519 - PLACE
      ?auto_4521 - PLACE
      ?auto_4520 - HOIST
      ?auto_4522 - SURFACE
      ?auto_4523 - PLACE
      ?auto_4527 - HOIST
      ?auto_4524 - SURFACE
      ?auto_4528 - PLACE
      ?auto_4525 - HOIST
      ?auto_4526 - SURFACE
      ?auto_4517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4518 ?auto_4519 ) ( IS-CRATE ?auto_4516 ) ( not ( = ?auto_4521 ?auto_4519 ) ) ( HOIST-AT ?auto_4520 ?auto_4521 ) ( AVAILABLE ?auto_4520 ) ( SURFACE-AT ?auto_4516 ?auto_4521 ) ( ON ?auto_4516 ?auto_4522 ) ( CLEAR ?auto_4516 ) ( not ( = ?auto_4515 ?auto_4516 ) ) ( not ( = ?auto_4515 ?auto_4522 ) ) ( not ( = ?auto_4516 ?auto_4522 ) ) ( not ( = ?auto_4518 ?auto_4520 ) ) ( IS-CRATE ?auto_4515 ) ( not ( = ?auto_4523 ?auto_4519 ) ) ( HOIST-AT ?auto_4527 ?auto_4523 ) ( AVAILABLE ?auto_4527 ) ( SURFACE-AT ?auto_4515 ?auto_4523 ) ( ON ?auto_4515 ?auto_4524 ) ( CLEAR ?auto_4515 ) ( not ( = ?auto_4514 ?auto_4515 ) ) ( not ( = ?auto_4514 ?auto_4524 ) ) ( not ( = ?auto_4515 ?auto_4524 ) ) ( not ( = ?auto_4518 ?auto_4527 ) ) ( SURFACE-AT ?auto_4513 ?auto_4519 ) ( CLEAR ?auto_4513 ) ( IS-CRATE ?auto_4514 ) ( AVAILABLE ?auto_4518 ) ( not ( = ?auto_4528 ?auto_4519 ) ) ( HOIST-AT ?auto_4525 ?auto_4528 ) ( AVAILABLE ?auto_4525 ) ( SURFACE-AT ?auto_4514 ?auto_4528 ) ( ON ?auto_4514 ?auto_4526 ) ( CLEAR ?auto_4514 ) ( TRUCK-AT ?auto_4517 ?auto_4519 ) ( not ( = ?auto_4513 ?auto_4514 ) ) ( not ( = ?auto_4513 ?auto_4526 ) ) ( not ( = ?auto_4514 ?auto_4526 ) ) ( not ( = ?auto_4518 ?auto_4525 ) ) ( not ( = ?auto_4513 ?auto_4515 ) ) ( not ( = ?auto_4513 ?auto_4524 ) ) ( not ( = ?auto_4515 ?auto_4526 ) ) ( not ( = ?auto_4523 ?auto_4528 ) ) ( not ( = ?auto_4527 ?auto_4525 ) ) ( not ( = ?auto_4524 ?auto_4526 ) ) ( not ( = ?auto_4513 ?auto_4516 ) ) ( not ( = ?auto_4513 ?auto_4522 ) ) ( not ( = ?auto_4514 ?auto_4516 ) ) ( not ( = ?auto_4514 ?auto_4522 ) ) ( not ( = ?auto_4516 ?auto_4524 ) ) ( not ( = ?auto_4516 ?auto_4526 ) ) ( not ( = ?auto_4521 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4528 ) ) ( not ( = ?auto_4520 ?auto_4527 ) ) ( not ( = ?auto_4520 ?auto_4525 ) ) ( not ( = ?auto_4522 ?auto_4524 ) ) ( not ( = ?auto_4522 ?auto_4526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4513 ?auto_4514 ?auto_4515 )
      ( MAKE-1CRATE ?auto_4515 ?auto_4516 )
      ( MAKE-3CRATE-VERIFY ?auto_4513 ?auto_4514 ?auto_4515 ?auto_4516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4531 - SURFACE
      ?auto_4532 - SURFACE
    )
    :vars
    (
      ?auto_4533 - HOIST
      ?auto_4534 - PLACE
      ?auto_4536 - PLACE
      ?auto_4537 - HOIST
      ?auto_4538 - SURFACE
      ?auto_4535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4533 ?auto_4534 ) ( SURFACE-AT ?auto_4531 ?auto_4534 ) ( CLEAR ?auto_4531 ) ( IS-CRATE ?auto_4532 ) ( AVAILABLE ?auto_4533 ) ( not ( = ?auto_4536 ?auto_4534 ) ) ( HOIST-AT ?auto_4537 ?auto_4536 ) ( AVAILABLE ?auto_4537 ) ( SURFACE-AT ?auto_4532 ?auto_4536 ) ( ON ?auto_4532 ?auto_4538 ) ( CLEAR ?auto_4532 ) ( TRUCK-AT ?auto_4535 ?auto_4534 ) ( not ( = ?auto_4531 ?auto_4532 ) ) ( not ( = ?auto_4531 ?auto_4538 ) ) ( not ( = ?auto_4532 ?auto_4538 ) ) ( not ( = ?auto_4533 ?auto_4537 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4535 ?auto_4534 ?auto_4536 )
      ( !LIFT ?auto_4537 ?auto_4532 ?auto_4538 ?auto_4536 )
      ( !LOAD ?auto_4537 ?auto_4532 ?auto_4535 ?auto_4536 )
      ( !DRIVE ?auto_4535 ?auto_4536 ?auto_4534 )
      ( !UNLOAD ?auto_4533 ?auto_4532 ?auto_4535 ?auto_4534 )
      ( !DROP ?auto_4533 ?auto_4532 ?auto_4531 ?auto_4534 )
      ( MAKE-1CRATE-VERIFY ?auto_4531 ?auto_4532 ) )
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
      ?auto_4552 - HOIST
      ?auto_4553 - PLACE
      ?auto_4551 - PLACE
      ?auto_4550 - HOIST
      ?auto_4554 - SURFACE
      ?auto_4563 - PLACE
      ?auto_4560 - HOIST
      ?auto_4555 - SURFACE
      ?auto_4562 - PLACE
      ?auto_4559 - HOIST
      ?auto_4556 - SURFACE
      ?auto_4557 - PLACE
      ?auto_4558 - HOIST
      ?auto_4561 - SURFACE
      ?auto_4549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4552 ?auto_4553 ) ( IS-CRATE ?auto_4548 ) ( not ( = ?auto_4551 ?auto_4553 ) ) ( HOIST-AT ?auto_4550 ?auto_4551 ) ( AVAILABLE ?auto_4550 ) ( SURFACE-AT ?auto_4548 ?auto_4551 ) ( ON ?auto_4548 ?auto_4554 ) ( CLEAR ?auto_4548 ) ( not ( = ?auto_4547 ?auto_4548 ) ) ( not ( = ?auto_4547 ?auto_4554 ) ) ( not ( = ?auto_4548 ?auto_4554 ) ) ( not ( = ?auto_4552 ?auto_4550 ) ) ( IS-CRATE ?auto_4547 ) ( not ( = ?auto_4563 ?auto_4553 ) ) ( HOIST-AT ?auto_4560 ?auto_4563 ) ( AVAILABLE ?auto_4560 ) ( SURFACE-AT ?auto_4547 ?auto_4563 ) ( ON ?auto_4547 ?auto_4555 ) ( CLEAR ?auto_4547 ) ( not ( = ?auto_4546 ?auto_4547 ) ) ( not ( = ?auto_4546 ?auto_4555 ) ) ( not ( = ?auto_4547 ?auto_4555 ) ) ( not ( = ?auto_4552 ?auto_4560 ) ) ( IS-CRATE ?auto_4546 ) ( not ( = ?auto_4562 ?auto_4553 ) ) ( HOIST-AT ?auto_4559 ?auto_4562 ) ( AVAILABLE ?auto_4559 ) ( SURFACE-AT ?auto_4546 ?auto_4562 ) ( ON ?auto_4546 ?auto_4556 ) ( CLEAR ?auto_4546 ) ( not ( = ?auto_4545 ?auto_4546 ) ) ( not ( = ?auto_4545 ?auto_4556 ) ) ( not ( = ?auto_4546 ?auto_4556 ) ) ( not ( = ?auto_4552 ?auto_4559 ) ) ( SURFACE-AT ?auto_4544 ?auto_4553 ) ( CLEAR ?auto_4544 ) ( IS-CRATE ?auto_4545 ) ( AVAILABLE ?auto_4552 ) ( not ( = ?auto_4557 ?auto_4553 ) ) ( HOIST-AT ?auto_4558 ?auto_4557 ) ( AVAILABLE ?auto_4558 ) ( SURFACE-AT ?auto_4545 ?auto_4557 ) ( ON ?auto_4545 ?auto_4561 ) ( CLEAR ?auto_4545 ) ( TRUCK-AT ?auto_4549 ?auto_4553 ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4561 ) ) ( not ( = ?auto_4545 ?auto_4561 ) ) ( not ( = ?auto_4552 ?auto_4558 ) ) ( not ( = ?auto_4544 ?auto_4546 ) ) ( not ( = ?auto_4544 ?auto_4556 ) ) ( not ( = ?auto_4546 ?auto_4561 ) ) ( not ( = ?auto_4562 ?auto_4557 ) ) ( not ( = ?auto_4559 ?auto_4558 ) ) ( not ( = ?auto_4556 ?auto_4561 ) ) ( not ( = ?auto_4544 ?auto_4547 ) ) ( not ( = ?auto_4544 ?auto_4555 ) ) ( not ( = ?auto_4545 ?auto_4547 ) ) ( not ( = ?auto_4545 ?auto_4555 ) ) ( not ( = ?auto_4547 ?auto_4556 ) ) ( not ( = ?auto_4547 ?auto_4561 ) ) ( not ( = ?auto_4563 ?auto_4562 ) ) ( not ( = ?auto_4563 ?auto_4557 ) ) ( not ( = ?auto_4560 ?auto_4559 ) ) ( not ( = ?auto_4560 ?auto_4558 ) ) ( not ( = ?auto_4555 ?auto_4556 ) ) ( not ( = ?auto_4555 ?auto_4561 ) ) ( not ( = ?auto_4544 ?auto_4548 ) ) ( not ( = ?auto_4544 ?auto_4554 ) ) ( not ( = ?auto_4545 ?auto_4548 ) ) ( not ( = ?auto_4545 ?auto_4554 ) ) ( not ( = ?auto_4546 ?auto_4548 ) ) ( not ( = ?auto_4546 ?auto_4554 ) ) ( not ( = ?auto_4548 ?auto_4555 ) ) ( not ( = ?auto_4548 ?auto_4556 ) ) ( not ( = ?auto_4548 ?auto_4561 ) ) ( not ( = ?auto_4551 ?auto_4563 ) ) ( not ( = ?auto_4551 ?auto_4562 ) ) ( not ( = ?auto_4551 ?auto_4557 ) ) ( not ( = ?auto_4550 ?auto_4560 ) ) ( not ( = ?auto_4550 ?auto_4559 ) ) ( not ( = ?auto_4550 ?auto_4558 ) ) ( not ( = ?auto_4554 ?auto_4555 ) ) ( not ( = ?auto_4554 ?auto_4556 ) ) ( not ( = ?auto_4554 ?auto_4561 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4544 ?auto_4545 ?auto_4546 ?auto_4547 )
      ( MAKE-1CRATE ?auto_4547 ?auto_4548 )
      ( MAKE-4CRATE-VERIFY ?auto_4544 ?auto_4545 ?auto_4546 ?auto_4547 ?auto_4548 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4566 - SURFACE
      ?auto_4567 - SURFACE
    )
    :vars
    (
      ?auto_4568 - HOIST
      ?auto_4569 - PLACE
      ?auto_4571 - PLACE
      ?auto_4572 - HOIST
      ?auto_4573 - SURFACE
      ?auto_4570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4568 ?auto_4569 ) ( SURFACE-AT ?auto_4566 ?auto_4569 ) ( CLEAR ?auto_4566 ) ( IS-CRATE ?auto_4567 ) ( AVAILABLE ?auto_4568 ) ( not ( = ?auto_4571 ?auto_4569 ) ) ( HOIST-AT ?auto_4572 ?auto_4571 ) ( AVAILABLE ?auto_4572 ) ( SURFACE-AT ?auto_4567 ?auto_4571 ) ( ON ?auto_4567 ?auto_4573 ) ( CLEAR ?auto_4567 ) ( TRUCK-AT ?auto_4570 ?auto_4569 ) ( not ( = ?auto_4566 ?auto_4567 ) ) ( not ( = ?auto_4566 ?auto_4573 ) ) ( not ( = ?auto_4567 ?auto_4573 ) ) ( not ( = ?auto_4568 ?auto_4572 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4570 ?auto_4569 ?auto_4571 )
      ( !LIFT ?auto_4572 ?auto_4567 ?auto_4573 ?auto_4571 )
      ( !LOAD ?auto_4572 ?auto_4567 ?auto_4570 ?auto_4571 )
      ( !DRIVE ?auto_4570 ?auto_4571 ?auto_4569 )
      ( !UNLOAD ?auto_4568 ?auto_4567 ?auto_4570 ?auto_4569 )
      ( !DROP ?auto_4568 ?auto_4567 ?auto_4566 ?auto_4569 )
      ( MAKE-1CRATE-VERIFY ?auto_4566 ?auto_4567 ) )
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
      ?auto_4586 - HOIST
      ?auto_4588 - PLACE
      ?auto_4590 - PLACE
      ?auto_4589 - HOIST
      ?auto_4587 - SURFACE
      ?auto_4601 - PLACE
      ?auto_4600 - HOIST
      ?auto_4595 - SURFACE
      ?auto_4603 - PLACE
      ?auto_4593 - HOIST
      ?auto_4598 - SURFACE
      ?auto_4597 - PLACE
      ?auto_4602 - HOIST
      ?auto_4594 - SURFACE
      ?auto_4599 - PLACE
      ?auto_4592 - HOIST
      ?auto_4596 - SURFACE
      ?auto_4591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4586 ?auto_4588 ) ( IS-CRATE ?auto_4585 ) ( not ( = ?auto_4590 ?auto_4588 ) ) ( HOIST-AT ?auto_4589 ?auto_4590 ) ( AVAILABLE ?auto_4589 ) ( SURFACE-AT ?auto_4585 ?auto_4590 ) ( ON ?auto_4585 ?auto_4587 ) ( CLEAR ?auto_4585 ) ( not ( = ?auto_4584 ?auto_4585 ) ) ( not ( = ?auto_4584 ?auto_4587 ) ) ( not ( = ?auto_4585 ?auto_4587 ) ) ( not ( = ?auto_4586 ?auto_4589 ) ) ( IS-CRATE ?auto_4584 ) ( not ( = ?auto_4601 ?auto_4588 ) ) ( HOIST-AT ?auto_4600 ?auto_4601 ) ( AVAILABLE ?auto_4600 ) ( SURFACE-AT ?auto_4584 ?auto_4601 ) ( ON ?auto_4584 ?auto_4595 ) ( CLEAR ?auto_4584 ) ( not ( = ?auto_4583 ?auto_4584 ) ) ( not ( = ?auto_4583 ?auto_4595 ) ) ( not ( = ?auto_4584 ?auto_4595 ) ) ( not ( = ?auto_4586 ?auto_4600 ) ) ( IS-CRATE ?auto_4583 ) ( not ( = ?auto_4603 ?auto_4588 ) ) ( HOIST-AT ?auto_4593 ?auto_4603 ) ( AVAILABLE ?auto_4593 ) ( SURFACE-AT ?auto_4583 ?auto_4603 ) ( ON ?auto_4583 ?auto_4598 ) ( CLEAR ?auto_4583 ) ( not ( = ?auto_4582 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4598 ) ) ( not ( = ?auto_4583 ?auto_4598 ) ) ( not ( = ?auto_4586 ?auto_4593 ) ) ( IS-CRATE ?auto_4582 ) ( not ( = ?auto_4597 ?auto_4588 ) ) ( HOIST-AT ?auto_4602 ?auto_4597 ) ( AVAILABLE ?auto_4602 ) ( SURFACE-AT ?auto_4582 ?auto_4597 ) ( ON ?auto_4582 ?auto_4594 ) ( CLEAR ?auto_4582 ) ( not ( = ?auto_4581 ?auto_4582 ) ) ( not ( = ?auto_4581 ?auto_4594 ) ) ( not ( = ?auto_4582 ?auto_4594 ) ) ( not ( = ?auto_4586 ?auto_4602 ) ) ( SURFACE-AT ?auto_4580 ?auto_4588 ) ( CLEAR ?auto_4580 ) ( IS-CRATE ?auto_4581 ) ( AVAILABLE ?auto_4586 ) ( not ( = ?auto_4599 ?auto_4588 ) ) ( HOIST-AT ?auto_4592 ?auto_4599 ) ( AVAILABLE ?auto_4592 ) ( SURFACE-AT ?auto_4581 ?auto_4599 ) ( ON ?auto_4581 ?auto_4596 ) ( CLEAR ?auto_4581 ) ( TRUCK-AT ?auto_4591 ?auto_4588 ) ( not ( = ?auto_4580 ?auto_4581 ) ) ( not ( = ?auto_4580 ?auto_4596 ) ) ( not ( = ?auto_4581 ?auto_4596 ) ) ( not ( = ?auto_4586 ?auto_4592 ) ) ( not ( = ?auto_4580 ?auto_4582 ) ) ( not ( = ?auto_4580 ?auto_4594 ) ) ( not ( = ?auto_4582 ?auto_4596 ) ) ( not ( = ?auto_4597 ?auto_4599 ) ) ( not ( = ?auto_4602 ?auto_4592 ) ) ( not ( = ?auto_4594 ?auto_4596 ) ) ( not ( = ?auto_4580 ?auto_4583 ) ) ( not ( = ?auto_4580 ?auto_4598 ) ) ( not ( = ?auto_4581 ?auto_4583 ) ) ( not ( = ?auto_4581 ?auto_4598 ) ) ( not ( = ?auto_4583 ?auto_4594 ) ) ( not ( = ?auto_4583 ?auto_4596 ) ) ( not ( = ?auto_4603 ?auto_4597 ) ) ( not ( = ?auto_4603 ?auto_4599 ) ) ( not ( = ?auto_4593 ?auto_4602 ) ) ( not ( = ?auto_4593 ?auto_4592 ) ) ( not ( = ?auto_4598 ?auto_4594 ) ) ( not ( = ?auto_4598 ?auto_4596 ) ) ( not ( = ?auto_4580 ?auto_4584 ) ) ( not ( = ?auto_4580 ?auto_4595 ) ) ( not ( = ?auto_4581 ?auto_4584 ) ) ( not ( = ?auto_4581 ?auto_4595 ) ) ( not ( = ?auto_4582 ?auto_4584 ) ) ( not ( = ?auto_4582 ?auto_4595 ) ) ( not ( = ?auto_4584 ?auto_4598 ) ) ( not ( = ?auto_4584 ?auto_4594 ) ) ( not ( = ?auto_4584 ?auto_4596 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( not ( = ?auto_4601 ?auto_4597 ) ) ( not ( = ?auto_4601 ?auto_4599 ) ) ( not ( = ?auto_4600 ?auto_4593 ) ) ( not ( = ?auto_4600 ?auto_4602 ) ) ( not ( = ?auto_4600 ?auto_4592 ) ) ( not ( = ?auto_4595 ?auto_4598 ) ) ( not ( = ?auto_4595 ?auto_4594 ) ) ( not ( = ?auto_4595 ?auto_4596 ) ) ( not ( = ?auto_4580 ?auto_4585 ) ) ( not ( = ?auto_4580 ?auto_4587 ) ) ( not ( = ?auto_4581 ?auto_4585 ) ) ( not ( = ?auto_4581 ?auto_4587 ) ) ( not ( = ?auto_4582 ?auto_4585 ) ) ( not ( = ?auto_4582 ?auto_4587 ) ) ( not ( = ?auto_4583 ?auto_4585 ) ) ( not ( = ?auto_4583 ?auto_4587 ) ) ( not ( = ?auto_4585 ?auto_4595 ) ) ( not ( = ?auto_4585 ?auto_4598 ) ) ( not ( = ?auto_4585 ?auto_4594 ) ) ( not ( = ?auto_4585 ?auto_4596 ) ) ( not ( = ?auto_4590 ?auto_4601 ) ) ( not ( = ?auto_4590 ?auto_4603 ) ) ( not ( = ?auto_4590 ?auto_4597 ) ) ( not ( = ?auto_4590 ?auto_4599 ) ) ( not ( = ?auto_4589 ?auto_4600 ) ) ( not ( = ?auto_4589 ?auto_4593 ) ) ( not ( = ?auto_4589 ?auto_4602 ) ) ( not ( = ?auto_4589 ?auto_4592 ) ) ( not ( = ?auto_4587 ?auto_4595 ) ) ( not ( = ?auto_4587 ?auto_4598 ) ) ( not ( = ?auto_4587 ?auto_4594 ) ) ( not ( = ?auto_4587 ?auto_4596 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4580 ?auto_4581 ?auto_4582 ?auto_4583 ?auto_4584 )
      ( MAKE-1CRATE ?auto_4584 ?auto_4585 )
      ( MAKE-5CRATE-VERIFY ?auto_4580 ?auto_4581 ?auto_4582 ?auto_4583 ?auto_4584 ?auto_4585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4606 - SURFACE
      ?auto_4607 - SURFACE
    )
    :vars
    (
      ?auto_4608 - HOIST
      ?auto_4609 - PLACE
      ?auto_4611 - PLACE
      ?auto_4612 - HOIST
      ?auto_4613 - SURFACE
      ?auto_4610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4608 ?auto_4609 ) ( SURFACE-AT ?auto_4606 ?auto_4609 ) ( CLEAR ?auto_4606 ) ( IS-CRATE ?auto_4607 ) ( AVAILABLE ?auto_4608 ) ( not ( = ?auto_4611 ?auto_4609 ) ) ( HOIST-AT ?auto_4612 ?auto_4611 ) ( AVAILABLE ?auto_4612 ) ( SURFACE-AT ?auto_4607 ?auto_4611 ) ( ON ?auto_4607 ?auto_4613 ) ( CLEAR ?auto_4607 ) ( TRUCK-AT ?auto_4610 ?auto_4609 ) ( not ( = ?auto_4606 ?auto_4607 ) ) ( not ( = ?auto_4606 ?auto_4613 ) ) ( not ( = ?auto_4607 ?auto_4613 ) ) ( not ( = ?auto_4608 ?auto_4612 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4610 ?auto_4609 ?auto_4611 )
      ( !LIFT ?auto_4612 ?auto_4607 ?auto_4613 ?auto_4611 )
      ( !LOAD ?auto_4612 ?auto_4607 ?auto_4610 ?auto_4611 )
      ( !DRIVE ?auto_4610 ?auto_4611 ?auto_4609 )
      ( !UNLOAD ?auto_4608 ?auto_4607 ?auto_4610 ?auto_4609 )
      ( !DROP ?auto_4608 ?auto_4607 ?auto_4606 ?auto_4609 )
      ( MAKE-1CRATE-VERIFY ?auto_4606 ?auto_4607 ) )
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
      ?auto_4628 - HOIST
      ?auto_4630 - PLACE
      ?auto_4633 - PLACE
      ?auto_4631 - HOIST
      ?auto_4632 - SURFACE
      ?auto_4638 - PLACE
      ?auto_4637 - HOIST
      ?auto_4642 - SURFACE
      ?auto_4641 - PLACE
      ?auto_4634 - HOIST
      ?auto_4643 - SURFACE
      ?auto_4635 - PLACE
      ?auto_4640 - HOIST
      ?auto_4645 - SURFACE
      ?auto_4646 - PLACE
      ?auto_4636 - HOIST
      ?auto_4648 - SURFACE
      ?auto_4647 - PLACE
      ?auto_4639 - HOIST
      ?auto_4644 - SURFACE
      ?auto_4629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4628 ?auto_4630 ) ( IS-CRATE ?auto_4627 ) ( not ( = ?auto_4633 ?auto_4630 ) ) ( HOIST-AT ?auto_4631 ?auto_4633 ) ( AVAILABLE ?auto_4631 ) ( SURFACE-AT ?auto_4627 ?auto_4633 ) ( ON ?auto_4627 ?auto_4632 ) ( CLEAR ?auto_4627 ) ( not ( = ?auto_4626 ?auto_4627 ) ) ( not ( = ?auto_4626 ?auto_4632 ) ) ( not ( = ?auto_4627 ?auto_4632 ) ) ( not ( = ?auto_4628 ?auto_4631 ) ) ( IS-CRATE ?auto_4626 ) ( not ( = ?auto_4638 ?auto_4630 ) ) ( HOIST-AT ?auto_4637 ?auto_4638 ) ( AVAILABLE ?auto_4637 ) ( SURFACE-AT ?auto_4626 ?auto_4638 ) ( ON ?auto_4626 ?auto_4642 ) ( CLEAR ?auto_4626 ) ( not ( = ?auto_4625 ?auto_4626 ) ) ( not ( = ?auto_4625 ?auto_4642 ) ) ( not ( = ?auto_4626 ?auto_4642 ) ) ( not ( = ?auto_4628 ?auto_4637 ) ) ( IS-CRATE ?auto_4625 ) ( not ( = ?auto_4641 ?auto_4630 ) ) ( HOIST-AT ?auto_4634 ?auto_4641 ) ( AVAILABLE ?auto_4634 ) ( SURFACE-AT ?auto_4625 ?auto_4641 ) ( ON ?auto_4625 ?auto_4643 ) ( CLEAR ?auto_4625 ) ( not ( = ?auto_4624 ?auto_4625 ) ) ( not ( = ?auto_4624 ?auto_4643 ) ) ( not ( = ?auto_4625 ?auto_4643 ) ) ( not ( = ?auto_4628 ?auto_4634 ) ) ( IS-CRATE ?auto_4624 ) ( not ( = ?auto_4635 ?auto_4630 ) ) ( HOIST-AT ?auto_4640 ?auto_4635 ) ( AVAILABLE ?auto_4640 ) ( SURFACE-AT ?auto_4624 ?auto_4635 ) ( ON ?auto_4624 ?auto_4645 ) ( CLEAR ?auto_4624 ) ( not ( = ?auto_4623 ?auto_4624 ) ) ( not ( = ?auto_4623 ?auto_4645 ) ) ( not ( = ?auto_4624 ?auto_4645 ) ) ( not ( = ?auto_4628 ?auto_4640 ) ) ( IS-CRATE ?auto_4623 ) ( not ( = ?auto_4646 ?auto_4630 ) ) ( HOIST-AT ?auto_4636 ?auto_4646 ) ( AVAILABLE ?auto_4636 ) ( SURFACE-AT ?auto_4623 ?auto_4646 ) ( ON ?auto_4623 ?auto_4648 ) ( CLEAR ?auto_4623 ) ( not ( = ?auto_4622 ?auto_4623 ) ) ( not ( = ?auto_4622 ?auto_4648 ) ) ( not ( = ?auto_4623 ?auto_4648 ) ) ( not ( = ?auto_4628 ?auto_4636 ) ) ( SURFACE-AT ?auto_4621 ?auto_4630 ) ( CLEAR ?auto_4621 ) ( IS-CRATE ?auto_4622 ) ( AVAILABLE ?auto_4628 ) ( not ( = ?auto_4647 ?auto_4630 ) ) ( HOIST-AT ?auto_4639 ?auto_4647 ) ( AVAILABLE ?auto_4639 ) ( SURFACE-AT ?auto_4622 ?auto_4647 ) ( ON ?auto_4622 ?auto_4644 ) ( CLEAR ?auto_4622 ) ( TRUCK-AT ?auto_4629 ?auto_4630 ) ( not ( = ?auto_4621 ?auto_4622 ) ) ( not ( = ?auto_4621 ?auto_4644 ) ) ( not ( = ?auto_4622 ?auto_4644 ) ) ( not ( = ?auto_4628 ?auto_4639 ) ) ( not ( = ?auto_4621 ?auto_4623 ) ) ( not ( = ?auto_4621 ?auto_4648 ) ) ( not ( = ?auto_4623 ?auto_4644 ) ) ( not ( = ?auto_4646 ?auto_4647 ) ) ( not ( = ?auto_4636 ?auto_4639 ) ) ( not ( = ?auto_4648 ?auto_4644 ) ) ( not ( = ?auto_4621 ?auto_4624 ) ) ( not ( = ?auto_4621 ?auto_4645 ) ) ( not ( = ?auto_4622 ?auto_4624 ) ) ( not ( = ?auto_4622 ?auto_4645 ) ) ( not ( = ?auto_4624 ?auto_4648 ) ) ( not ( = ?auto_4624 ?auto_4644 ) ) ( not ( = ?auto_4635 ?auto_4646 ) ) ( not ( = ?auto_4635 ?auto_4647 ) ) ( not ( = ?auto_4640 ?auto_4636 ) ) ( not ( = ?auto_4640 ?auto_4639 ) ) ( not ( = ?auto_4645 ?auto_4648 ) ) ( not ( = ?auto_4645 ?auto_4644 ) ) ( not ( = ?auto_4621 ?auto_4625 ) ) ( not ( = ?auto_4621 ?auto_4643 ) ) ( not ( = ?auto_4622 ?auto_4625 ) ) ( not ( = ?auto_4622 ?auto_4643 ) ) ( not ( = ?auto_4623 ?auto_4625 ) ) ( not ( = ?auto_4623 ?auto_4643 ) ) ( not ( = ?auto_4625 ?auto_4645 ) ) ( not ( = ?auto_4625 ?auto_4648 ) ) ( not ( = ?auto_4625 ?auto_4644 ) ) ( not ( = ?auto_4641 ?auto_4635 ) ) ( not ( = ?auto_4641 ?auto_4646 ) ) ( not ( = ?auto_4641 ?auto_4647 ) ) ( not ( = ?auto_4634 ?auto_4640 ) ) ( not ( = ?auto_4634 ?auto_4636 ) ) ( not ( = ?auto_4634 ?auto_4639 ) ) ( not ( = ?auto_4643 ?auto_4645 ) ) ( not ( = ?auto_4643 ?auto_4648 ) ) ( not ( = ?auto_4643 ?auto_4644 ) ) ( not ( = ?auto_4621 ?auto_4626 ) ) ( not ( = ?auto_4621 ?auto_4642 ) ) ( not ( = ?auto_4622 ?auto_4626 ) ) ( not ( = ?auto_4622 ?auto_4642 ) ) ( not ( = ?auto_4623 ?auto_4626 ) ) ( not ( = ?auto_4623 ?auto_4642 ) ) ( not ( = ?auto_4624 ?auto_4626 ) ) ( not ( = ?auto_4624 ?auto_4642 ) ) ( not ( = ?auto_4626 ?auto_4643 ) ) ( not ( = ?auto_4626 ?auto_4645 ) ) ( not ( = ?auto_4626 ?auto_4648 ) ) ( not ( = ?auto_4626 ?auto_4644 ) ) ( not ( = ?auto_4638 ?auto_4641 ) ) ( not ( = ?auto_4638 ?auto_4635 ) ) ( not ( = ?auto_4638 ?auto_4646 ) ) ( not ( = ?auto_4638 ?auto_4647 ) ) ( not ( = ?auto_4637 ?auto_4634 ) ) ( not ( = ?auto_4637 ?auto_4640 ) ) ( not ( = ?auto_4637 ?auto_4636 ) ) ( not ( = ?auto_4637 ?auto_4639 ) ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4645 ) ) ( not ( = ?auto_4642 ?auto_4648 ) ) ( not ( = ?auto_4642 ?auto_4644 ) ) ( not ( = ?auto_4621 ?auto_4627 ) ) ( not ( = ?auto_4621 ?auto_4632 ) ) ( not ( = ?auto_4622 ?auto_4627 ) ) ( not ( = ?auto_4622 ?auto_4632 ) ) ( not ( = ?auto_4623 ?auto_4627 ) ) ( not ( = ?auto_4623 ?auto_4632 ) ) ( not ( = ?auto_4624 ?auto_4627 ) ) ( not ( = ?auto_4624 ?auto_4632 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4632 ) ) ( not ( = ?auto_4627 ?auto_4642 ) ) ( not ( = ?auto_4627 ?auto_4643 ) ) ( not ( = ?auto_4627 ?auto_4645 ) ) ( not ( = ?auto_4627 ?auto_4648 ) ) ( not ( = ?auto_4627 ?auto_4644 ) ) ( not ( = ?auto_4633 ?auto_4638 ) ) ( not ( = ?auto_4633 ?auto_4641 ) ) ( not ( = ?auto_4633 ?auto_4635 ) ) ( not ( = ?auto_4633 ?auto_4646 ) ) ( not ( = ?auto_4633 ?auto_4647 ) ) ( not ( = ?auto_4631 ?auto_4637 ) ) ( not ( = ?auto_4631 ?auto_4634 ) ) ( not ( = ?auto_4631 ?auto_4640 ) ) ( not ( = ?auto_4631 ?auto_4636 ) ) ( not ( = ?auto_4631 ?auto_4639 ) ) ( not ( = ?auto_4632 ?auto_4642 ) ) ( not ( = ?auto_4632 ?auto_4643 ) ) ( not ( = ?auto_4632 ?auto_4645 ) ) ( not ( = ?auto_4632 ?auto_4648 ) ) ( not ( = ?auto_4632 ?auto_4644 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4621 ?auto_4622 ?auto_4623 ?auto_4624 ?auto_4625 ?auto_4626 )
      ( MAKE-1CRATE ?auto_4626 ?auto_4627 )
      ( MAKE-6CRATE-VERIFY ?auto_4621 ?auto_4622 ?auto_4623 ?auto_4624 ?auto_4625 ?auto_4626 ?auto_4627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4651 - SURFACE
      ?auto_4652 - SURFACE
    )
    :vars
    (
      ?auto_4653 - HOIST
      ?auto_4654 - PLACE
      ?auto_4656 - PLACE
      ?auto_4657 - HOIST
      ?auto_4658 - SURFACE
      ?auto_4655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4653 ?auto_4654 ) ( SURFACE-AT ?auto_4651 ?auto_4654 ) ( CLEAR ?auto_4651 ) ( IS-CRATE ?auto_4652 ) ( AVAILABLE ?auto_4653 ) ( not ( = ?auto_4656 ?auto_4654 ) ) ( HOIST-AT ?auto_4657 ?auto_4656 ) ( AVAILABLE ?auto_4657 ) ( SURFACE-AT ?auto_4652 ?auto_4656 ) ( ON ?auto_4652 ?auto_4658 ) ( CLEAR ?auto_4652 ) ( TRUCK-AT ?auto_4655 ?auto_4654 ) ( not ( = ?auto_4651 ?auto_4652 ) ) ( not ( = ?auto_4651 ?auto_4658 ) ) ( not ( = ?auto_4652 ?auto_4658 ) ) ( not ( = ?auto_4653 ?auto_4657 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4655 ?auto_4654 ?auto_4656 )
      ( !LIFT ?auto_4657 ?auto_4652 ?auto_4658 ?auto_4656 )
      ( !LOAD ?auto_4657 ?auto_4652 ?auto_4655 ?auto_4656 )
      ( !DRIVE ?auto_4655 ?auto_4656 ?auto_4654 )
      ( !UNLOAD ?auto_4653 ?auto_4652 ?auto_4655 ?auto_4654 )
      ( !DROP ?auto_4653 ?auto_4652 ?auto_4651 ?auto_4654 )
      ( MAKE-1CRATE-VERIFY ?auto_4651 ?auto_4652 ) )
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
      ?auto_4674 - SURFACE
      ?auto_4673 - SURFACE
    )
    :vars
    (
      ?auto_4677 - HOIST
      ?auto_4676 - PLACE
      ?auto_4678 - PLACE
      ?auto_4679 - HOIST
      ?auto_4680 - SURFACE
      ?auto_4685 - PLACE
      ?auto_4683 - HOIST
      ?auto_4686 - SURFACE
      ?auto_4695 - PLACE
      ?auto_4684 - HOIST
      ?auto_4687 - SURFACE
      ?auto_4689 - SURFACE
      ?auto_4696 - PLACE
      ?auto_4693 - HOIST
      ?auto_4690 - SURFACE
      ?auto_4691 - PLACE
      ?auto_4681 - HOIST
      ?auto_4682 - SURFACE
      ?auto_4692 - PLACE
      ?auto_4694 - HOIST
      ?auto_4688 - SURFACE
      ?auto_4675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4677 ?auto_4676 ) ( IS-CRATE ?auto_4673 ) ( not ( = ?auto_4678 ?auto_4676 ) ) ( HOIST-AT ?auto_4679 ?auto_4678 ) ( SURFACE-AT ?auto_4673 ?auto_4678 ) ( ON ?auto_4673 ?auto_4680 ) ( CLEAR ?auto_4673 ) ( not ( = ?auto_4674 ?auto_4673 ) ) ( not ( = ?auto_4674 ?auto_4680 ) ) ( not ( = ?auto_4673 ?auto_4680 ) ) ( not ( = ?auto_4677 ?auto_4679 ) ) ( IS-CRATE ?auto_4674 ) ( not ( = ?auto_4685 ?auto_4676 ) ) ( HOIST-AT ?auto_4683 ?auto_4685 ) ( AVAILABLE ?auto_4683 ) ( SURFACE-AT ?auto_4674 ?auto_4685 ) ( ON ?auto_4674 ?auto_4686 ) ( CLEAR ?auto_4674 ) ( not ( = ?auto_4672 ?auto_4674 ) ) ( not ( = ?auto_4672 ?auto_4686 ) ) ( not ( = ?auto_4674 ?auto_4686 ) ) ( not ( = ?auto_4677 ?auto_4683 ) ) ( IS-CRATE ?auto_4672 ) ( not ( = ?auto_4695 ?auto_4676 ) ) ( HOIST-AT ?auto_4684 ?auto_4695 ) ( AVAILABLE ?auto_4684 ) ( SURFACE-AT ?auto_4672 ?auto_4695 ) ( ON ?auto_4672 ?auto_4687 ) ( CLEAR ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4687 ) ) ( not ( = ?auto_4672 ?auto_4687 ) ) ( not ( = ?auto_4677 ?auto_4684 ) ) ( IS-CRATE ?auto_4671 ) ( AVAILABLE ?auto_4679 ) ( SURFACE-AT ?auto_4671 ?auto_4678 ) ( ON ?auto_4671 ?auto_4689 ) ( CLEAR ?auto_4671 ) ( not ( = ?auto_4670 ?auto_4671 ) ) ( not ( = ?auto_4670 ?auto_4689 ) ) ( not ( = ?auto_4671 ?auto_4689 ) ) ( IS-CRATE ?auto_4670 ) ( not ( = ?auto_4696 ?auto_4676 ) ) ( HOIST-AT ?auto_4693 ?auto_4696 ) ( AVAILABLE ?auto_4693 ) ( SURFACE-AT ?auto_4670 ?auto_4696 ) ( ON ?auto_4670 ?auto_4690 ) ( CLEAR ?auto_4670 ) ( not ( = ?auto_4669 ?auto_4670 ) ) ( not ( = ?auto_4669 ?auto_4690 ) ) ( not ( = ?auto_4670 ?auto_4690 ) ) ( not ( = ?auto_4677 ?auto_4693 ) ) ( IS-CRATE ?auto_4669 ) ( not ( = ?auto_4691 ?auto_4676 ) ) ( HOIST-AT ?auto_4681 ?auto_4691 ) ( AVAILABLE ?auto_4681 ) ( SURFACE-AT ?auto_4669 ?auto_4691 ) ( ON ?auto_4669 ?auto_4682 ) ( CLEAR ?auto_4669 ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( not ( = ?auto_4668 ?auto_4682 ) ) ( not ( = ?auto_4669 ?auto_4682 ) ) ( not ( = ?auto_4677 ?auto_4681 ) ) ( SURFACE-AT ?auto_4667 ?auto_4676 ) ( CLEAR ?auto_4667 ) ( IS-CRATE ?auto_4668 ) ( AVAILABLE ?auto_4677 ) ( not ( = ?auto_4692 ?auto_4676 ) ) ( HOIST-AT ?auto_4694 ?auto_4692 ) ( AVAILABLE ?auto_4694 ) ( SURFACE-AT ?auto_4668 ?auto_4692 ) ( ON ?auto_4668 ?auto_4688 ) ( CLEAR ?auto_4668 ) ( TRUCK-AT ?auto_4675 ?auto_4676 ) ( not ( = ?auto_4667 ?auto_4668 ) ) ( not ( = ?auto_4667 ?auto_4688 ) ) ( not ( = ?auto_4668 ?auto_4688 ) ) ( not ( = ?auto_4677 ?auto_4694 ) ) ( not ( = ?auto_4667 ?auto_4669 ) ) ( not ( = ?auto_4667 ?auto_4682 ) ) ( not ( = ?auto_4669 ?auto_4688 ) ) ( not ( = ?auto_4691 ?auto_4692 ) ) ( not ( = ?auto_4681 ?auto_4694 ) ) ( not ( = ?auto_4682 ?auto_4688 ) ) ( not ( = ?auto_4667 ?auto_4670 ) ) ( not ( = ?auto_4667 ?auto_4690 ) ) ( not ( = ?auto_4668 ?auto_4670 ) ) ( not ( = ?auto_4668 ?auto_4690 ) ) ( not ( = ?auto_4670 ?auto_4682 ) ) ( not ( = ?auto_4670 ?auto_4688 ) ) ( not ( = ?auto_4696 ?auto_4691 ) ) ( not ( = ?auto_4696 ?auto_4692 ) ) ( not ( = ?auto_4693 ?auto_4681 ) ) ( not ( = ?auto_4693 ?auto_4694 ) ) ( not ( = ?auto_4690 ?auto_4682 ) ) ( not ( = ?auto_4690 ?auto_4688 ) ) ( not ( = ?auto_4667 ?auto_4671 ) ) ( not ( = ?auto_4667 ?auto_4689 ) ) ( not ( = ?auto_4668 ?auto_4671 ) ) ( not ( = ?auto_4668 ?auto_4689 ) ) ( not ( = ?auto_4669 ?auto_4671 ) ) ( not ( = ?auto_4669 ?auto_4689 ) ) ( not ( = ?auto_4671 ?auto_4690 ) ) ( not ( = ?auto_4671 ?auto_4682 ) ) ( not ( = ?auto_4671 ?auto_4688 ) ) ( not ( = ?auto_4678 ?auto_4696 ) ) ( not ( = ?auto_4678 ?auto_4691 ) ) ( not ( = ?auto_4678 ?auto_4692 ) ) ( not ( = ?auto_4679 ?auto_4693 ) ) ( not ( = ?auto_4679 ?auto_4681 ) ) ( not ( = ?auto_4679 ?auto_4694 ) ) ( not ( = ?auto_4689 ?auto_4690 ) ) ( not ( = ?auto_4689 ?auto_4682 ) ) ( not ( = ?auto_4689 ?auto_4688 ) ) ( not ( = ?auto_4667 ?auto_4672 ) ) ( not ( = ?auto_4667 ?auto_4687 ) ) ( not ( = ?auto_4668 ?auto_4672 ) ) ( not ( = ?auto_4668 ?auto_4687 ) ) ( not ( = ?auto_4669 ?auto_4672 ) ) ( not ( = ?auto_4669 ?auto_4687 ) ) ( not ( = ?auto_4670 ?auto_4672 ) ) ( not ( = ?auto_4670 ?auto_4687 ) ) ( not ( = ?auto_4672 ?auto_4689 ) ) ( not ( = ?auto_4672 ?auto_4690 ) ) ( not ( = ?auto_4672 ?auto_4682 ) ) ( not ( = ?auto_4672 ?auto_4688 ) ) ( not ( = ?auto_4695 ?auto_4678 ) ) ( not ( = ?auto_4695 ?auto_4696 ) ) ( not ( = ?auto_4695 ?auto_4691 ) ) ( not ( = ?auto_4695 ?auto_4692 ) ) ( not ( = ?auto_4684 ?auto_4679 ) ) ( not ( = ?auto_4684 ?auto_4693 ) ) ( not ( = ?auto_4684 ?auto_4681 ) ) ( not ( = ?auto_4684 ?auto_4694 ) ) ( not ( = ?auto_4687 ?auto_4689 ) ) ( not ( = ?auto_4687 ?auto_4690 ) ) ( not ( = ?auto_4687 ?auto_4682 ) ) ( not ( = ?auto_4687 ?auto_4688 ) ) ( not ( = ?auto_4667 ?auto_4674 ) ) ( not ( = ?auto_4667 ?auto_4686 ) ) ( not ( = ?auto_4668 ?auto_4674 ) ) ( not ( = ?auto_4668 ?auto_4686 ) ) ( not ( = ?auto_4669 ?auto_4674 ) ) ( not ( = ?auto_4669 ?auto_4686 ) ) ( not ( = ?auto_4670 ?auto_4674 ) ) ( not ( = ?auto_4670 ?auto_4686 ) ) ( not ( = ?auto_4671 ?auto_4674 ) ) ( not ( = ?auto_4671 ?auto_4686 ) ) ( not ( = ?auto_4674 ?auto_4687 ) ) ( not ( = ?auto_4674 ?auto_4689 ) ) ( not ( = ?auto_4674 ?auto_4690 ) ) ( not ( = ?auto_4674 ?auto_4682 ) ) ( not ( = ?auto_4674 ?auto_4688 ) ) ( not ( = ?auto_4685 ?auto_4695 ) ) ( not ( = ?auto_4685 ?auto_4678 ) ) ( not ( = ?auto_4685 ?auto_4696 ) ) ( not ( = ?auto_4685 ?auto_4691 ) ) ( not ( = ?auto_4685 ?auto_4692 ) ) ( not ( = ?auto_4683 ?auto_4684 ) ) ( not ( = ?auto_4683 ?auto_4679 ) ) ( not ( = ?auto_4683 ?auto_4693 ) ) ( not ( = ?auto_4683 ?auto_4681 ) ) ( not ( = ?auto_4683 ?auto_4694 ) ) ( not ( = ?auto_4686 ?auto_4687 ) ) ( not ( = ?auto_4686 ?auto_4689 ) ) ( not ( = ?auto_4686 ?auto_4690 ) ) ( not ( = ?auto_4686 ?auto_4682 ) ) ( not ( = ?auto_4686 ?auto_4688 ) ) ( not ( = ?auto_4667 ?auto_4673 ) ) ( not ( = ?auto_4667 ?auto_4680 ) ) ( not ( = ?auto_4668 ?auto_4673 ) ) ( not ( = ?auto_4668 ?auto_4680 ) ) ( not ( = ?auto_4669 ?auto_4673 ) ) ( not ( = ?auto_4669 ?auto_4680 ) ) ( not ( = ?auto_4670 ?auto_4673 ) ) ( not ( = ?auto_4670 ?auto_4680 ) ) ( not ( = ?auto_4671 ?auto_4673 ) ) ( not ( = ?auto_4671 ?auto_4680 ) ) ( not ( = ?auto_4672 ?auto_4673 ) ) ( not ( = ?auto_4672 ?auto_4680 ) ) ( not ( = ?auto_4673 ?auto_4686 ) ) ( not ( = ?auto_4673 ?auto_4687 ) ) ( not ( = ?auto_4673 ?auto_4689 ) ) ( not ( = ?auto_4673 ?auto_4690 ) ) ( not ( = ?auto_4673 ?auto_4682 ) ) ( not ( = ?auto_4673 ?auto_4688 ) ) ( not ( = ?auto_4680 ?auto_4686 ) ) ( not ( = ?auto_4680 ?auto_4687 ) ) ( not ( = ?auto_4680 ?auto_4689 ) ) ( not ( = ?auto_4680 ?auto_4690 ) ) ( not ( = ?auto_4680 ?auto_4682 ) ) ( not ( = ?auto_4680 ?auto_4688 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4667 ?auto_4668 ?auto_4669 ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4674 )
      ( MAKE-1CRATE ?auto_4674 ?auto_4673 )
      ( MAKE-7CRATE-VERIFY ?auto_4667 ?auto_4668 ?auto_4669 ?auto_4670 ?auto_4671 ?auto_4672 ?auto_4674 ?auto_4673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4699 - SURFACE
      ?auto_4700 - SURFACE
    )
    :vars
    (
      ?auto_4701 - HOIST
      ?auto_4702 - PLACE
      ?auto_4704 - PLACE
      ?auto_4705 - HOIST
      ?auto_4706 - SURFACE
      ?auto_4703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4701 ?auto_4702 ) ( SURFACE-AT ?auto_4699 ?auto_4702 ) ( CLEAR ?auto_4699 ) ( IS-CRATE ?auto_4700 ) ( AVAILABLE ?auto_4701 ) ( not ( = ?auto_4704 ?auto_4702 ) ) ( HOIST-AT ?auto_4705 ?auto_4704 ) ( AVAILABLE ?auto_4705 ) ( SURFACE-AT ?auto_4700 ?auto_4704 ) ( ON ?auto_4700 ?auto_4706 ) ( CLEAR ?auto_4700 ) ( TRUCK-AT ?auto_4703 ?auto_4702 ) ( not ( = ?auto_4699 ?auto_4700 ) ) ( not ( = ?auto_4699 ?auto_4706 ) ) ( not ( = ?auto_4700 ?auto_4706 ) ) ( not ( = ?auto_4701 ?auto_4705 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4703 ?auto_4702 ?auto_4704 )
      ( !LIFT ?auto_4705 ?auto_4700 ?auto_4706 ?auto_4704 )
      ( !LOAD ?auto_4705 ?auto_4700 ?auto_4703 ?auto_4704 )
      ( !DRIVE ?auto_4703 ?auto_4704 ?auto_4702 )
      ( !UNLOAD ?auto_4701 ?auto_4700 ?auto_4703 ?auto_4702 )
      ( !DROP ?auto_4701 ?auto_4700 ?auto_4699 ?auto_4702 )
      ( MAKE-1CRATE-VERIFY ?auto_4699 ?auto_4700 ) )
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
      ?auto_4724 - SURFACE
      ?auto_4723 - SURFACE
      ?auto_4722 - SURFACE
    )
    :vars
    (
      ?auto_4730 - HOIST
      ?auto_4729 - PLACE
      ?auto_4725 - PLACE
      ?auto_4727 - HOIST
      ?auto_4728 - SURFACE
      ?auto_4731 - PLACE
      ?auto_4746 - HOIST
      ?auto_4747 - SURFACE
      ?auto_4745 - PLACE
      ?auto_4734 - HOIST
      ?auto_4744 - SURFACE
      ?auto_4735 - PLACE
      ?auto_4732 - HOIST
      ?auto_4743 - SURFACE
      ?auto_4737 - SURFACE
      ?auto_4739 - SURFACE
      ?auto_4738 - PLACE
      ?auto_4736 - HOIST
      ?auto_4733 - SURFACE
      ?auto_4740 - PLACE
      ?auto_4741 - HOIST
      ?auto_4742 - SURFACE
      ?auto_4726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4730 ?auto_4729 ) ( IS-CRATE ?auto_4722 ) ( not ( = ?auto_4725 ?auto_4729 ) ) ( HOIST-AT ?auto_4727 ?auto_4725 ) ( SURFACE-AT ?auto_4722 ?auto_4725 ) ( ON ?auto_4722 ?auto_4728 ) ( CLEAR ?auto_4722 ) ( not ( = ?auto_4723 ?auto_4722 ) ) ( not ( = ?auto_4723 ?auto_4728 ) ) ( not ( = ?auto_4722 ?auto_4728 ) ) ( not ( = ?auto_4730 ?auto_4727 ) ) ( IS-CRATE ?auto_4723 ) ( not ( = ?auto_4731 ?auto_4729 ) ) ( HOIST-AT ?auto_4746 ?auto_4731 ) ( SURFACE-AT ?auto_4723 ?auto_4731 ) ( ON ?auto_4723 ?auto_4747 ) ( CLEAR ?auto_4723 ) ( not ( = ?auto_4724 ?auto_4723 ) ) ( not ( = ?auto_4724 ?auto_4747 ) ) ( not ( = ?auto_4723 ?auto_4747 ) ) ( not ( = ?auto_4730 ?auto_4746 ) ) ( IS-CRATE ?auto_4724 ) ( not ( = ?auto_4745 ?auto_4729 ) ) ( HOIST-AT ?auto_4734 ?auto_4745 ) ( AVAILABLE ?auto_4734 ) ( SURFACE-AT ?auto_4724 ?auto_4745 ) ( ON ?auto_4724 ?auto_4744 ) ( CLEAR ?auto_4724 ) ( not ( = ?auto_4721 ?auto_4724 ) ) ( not ( = ?auto_4721 ?auto_4744 ) ) ( not ( = ?auto_4724 ?auto_4744 ) ) ( not ( = ?auto_4730 ?auto_4734 ) ) ( IS-CRATE ?auto_4721 ) ( not ( = ?auto_4735 ?auto_4729 ) ) ( HOIST-AT ?auto_4732 ?auto_4735 ) ( AVAILABLE ?auto_4732 ) ( SURFACE-AT ?auto_4721 ?auto_4735 ) ( ON ?auto_4721 ?auto_4743 ) ( CLEAR ?auto_4721 ) ( not ( = ?auto_4720 ?auto_4721 ) ) ( not ( = ?auto_4720 ?auto_4743 ) ) ( not ( = ?auto_4721 ?auto_4743 ) ) ( not ( = ?auto_4730 ?auto_4732 ) ) ( IS-CRATE ?auto_4720 ) ( AVAILABLE ?auto_4746 ) ( SURFACE-AT ?auto_4720 ?auto_4731 ) ( ON ?auto_4720 ?auto_4737 ) ( CLEAR ?auto_4720 ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( not ( = ?auto_4719 ?auto_4737 ) ) ( not ( = ?auto_4720 ?auto_4737 ) ) ( IS-CRATE ?auto_4719 ) ( AVAILABLE ?auto_4727 ) ( SURFACE-AT ?auto_4719 ?auto_4725 ) ( ON ?auto_4719 ?auto_4739 ) ( CLEAR ?auto_4719 ) ( not ( = ?auto_4718 ?auto_4719 ) ) ( not ( = ?auto_4718 ?auto_4739 ) ) ( not ( = ?auto_4719 ?auto_4739 ) ) ( IS-CRATE ?auto_4718 ) ( not ( = ?auto_4738 ?auto_4729 ) ) ( HOIST-AT ?auto_4736 ?auto_4738 ) ( AVAILABLE ?auto_4736 ) ( SURFACE-AT ?auto_4718 ?auto_4738 ) ( ON ?auto_4718 ?auto_4733 ) ( CLEAR ?auto_4718 ) ( not ( = ?auto_4717 ?auto_4718 ) ) ( not ( = ?auto_4717 ?auto_4733 ) ) ( not ( = ?auto_4718 ?auto_4733 ) ) ( not ( = ?auto_4730 ?auto_4736 ) ) ( SURFACE-AT ?auto_4716 ?auto_4729 ) ( CLEAR ?auto_4716 ) ( IS-CRATE ?auto_4717 ) ( AVAILABLE ?auto_4730 ) ( not ( = ?auto_4740 ?auto_4729 ) ) ( HOIST-AT ?auto_4741 ?auto_4740 ) ( AVAILABLE ?auto_4741 ) ( SURFACE-AT ?auto_4717 ?auto_4740 ) ( ON ?auto_4717 ?auto_4742 ) ( CLEAR ?auto_4717 ) ( TRUCK-AT ?auto_4726 ?auto_4729 ) ( not ( = ?auto_4716 ?auto_4717 ) ) ( not ( = ?auto_4716 ?auto_4742 ) ) ( not ( = ?auto_4717 ?auto_4742 ) ) ( not ( = ?auto_4730 ?auto_4741 ) ) ( not ( = ?auto_4716 ?auto_4718 ) ) ( not ( = ?auto_4716 ?auto_4733 ) ) ( not ( = ?auto_4718 ?auto_4742 ) ) ( not ( = ?auto_4738 ?auto_4740 ) ) ( not ( = ?auto_4736 ?auto_4741 ) ) ( not ( = ?auto_4733 ?auto_4742 ) ) ( not ( = ?auto_4716 ?auto_4719 ) ) ( not ( = ?auto_4716 ?auto_4739 ) ) ( not ( = ?auto_4717 ?auto_4719 ) ) ( not ( = ?auto_4717 ?auto_4739 ) ) ( not ( = ?auto_4719 ?auto_4733 ) ) ( not ( = ?auto_4719 ?auto_4742 ) ) ( not ( = ?auto_4725 ?auto_4738 ) ) ( not ( = ?auto_4725 ?auto_4740 ) ) ( not ( = ?auto_4727 ?auto_4736 ) ) ( not ( = ?auto_4727 ?auto_4741 ) ) ( not ( = ?auto_4739 ?auto_4733 ) ) ( not ( = ?auto_4739 ?auto_4742 ) ) ( not ( = ?auto_4716 ?auto_4720 ) ) ( not ( = ?auto_4716 ?auto_4737 ) ) ( not ( = ?auto_4717 ?auto_4720 ) ) ( not ( = ?auto_4717 ?auto_4737 ) ) ( not ( = ?auto_4718 ?auto_4720 ) ) ( not ( = ?auto_4718 ?auto_4737 ) ) ( not ( = ?auto_4720 ?auto_4739 ) ) ( not ( = ?auto_4720 ?auto_4733 ) ) ( not ( = ?auto_4720 ?auto_4742 ) ) ( not ( = ?auto_4731 ?auto_4725 ) ) ( not ( = ?auto_4731 ?auto_4738 ) ) ( not ( = ?auto_4731 ?auto_4740 ) ) ( not ( = ?auto_4746 ?auto_4727 ) ) ( not ( = ?auto_4746 ?auto_4736 ) ) ( not ( = ?auto_4746 ?auto_4741 ) ) ( not ( = ?auto_4737 ?auto_4739 ) ) ( not ( = ?auto_4737 ?auto_4733 ) ) ( not ( = ?auto_4737 ?auto_4742 ) ) ( not ( = ?auto_4716 ?auto_4721 ) ) ( not ( = ?auto_4716 ?auto_4743 ) ) ( not ( = ?auto_4717 ?auto_4721 ) ) ( not ( = ?auto_4717 ?auto_4743 ) ) ( not ( = ?auto_4718 ?auto_4721 ) ) ( not ( = ?auto_4718 ?auto_4743 ) ) ( not ( = ?auto_4719 ?auto_4721 ) ) ( not ( = ?auto_4719 ?auto_4743 ) ) ( not ( = ?auto_4721 ?auto_4737 ) ) ( not ( = ?auto_4721 ?auto_4739 ) ) ( not ( = ?auto_4721 ?auto_4733 ) ) ( not ( = ?auto_4721 ?auto_4742 ) ) ( not ( = ?auto_4735 ?auto_4731 ) ) ( not ( = ?auto_4735 ?auto_4725 ) ) ( not ( = ?auto_4735 ?auto_4738 ) ) ( not ( = ?auto_4735 ?auto_4740 ) ) ( not ( = ?auto_4732 ?auto_4746 ) ) ( not ( = ?auto_4732 ?auto_4727 ) ) ( not ( = ?auto_4732 ?auto_4736 ) ) ( not ( = ?auto_4732 ?auto_4741 ) ) ( not ( = ?auto_4743 ?auto_4737 ) ) ( not ( = ?auto_4743 ?auto_4739 ) ) ( not ( = ?auto_4743 ?auto_4733 ) ) ( not ( = ?auto_4743 ?auto_4742 ) ) ( not ( = ?auto_4716 ?auto_4724 ) ) ( not ( = ?auto_4716 ?auto_4744 ) ) ( not ( = ?auto_4717 ?auto_4724 ) ) ( not ( = ?auto_4717 ?auto_4744 ) ) ( not ( = ?auto_4718 ?auto_4724 ) ) ( not ( = ?auto_4718 ?auto_4744 ) ) ( not ( = ?auto_4719 ?auto_4724 ) ) ( not ( = ?auto_4719 ?auto_4744 ) ) ( not ( = ?auto_4720 ?auto_4724 ) ) ( not ( = ?auto_4720 ?auto_4744 ) ) ( not ( = ?auto_4724 ?auto_4743 ) ) ( not ( = ?auto_4724 ?auto_4737 ) ) ( not ( = ?auto_4724 ?auto_4739 ) ) ( not ( = ?auto_4724 ?auto_4733 ) ) ( not ( = ?auto_4724 ?auto_4742 ) ) ( not ( = ?auto_4745 ?auto_4735 ) ) ( not ( = ?auto_4745 ?auto_4731 ) ) ( not ( = ?auto_4745 ?auto_4725 ) ) ( not ( = ?auto_4745 ?auto_4738 ) ) ( not ( = ?auto_4745 ?auto_4740 ) ) ( not ( = ?auto_4734 ?auto_4732 ) ) ( not ( = ?auto_4734 ?auto_4746 ) ) ( not ( = ?auto_4734 ?auto_4727 ) ) ( not ( = ?auto_4734 ?auto_4736 ) ) ( not ( = ?auto_4734 ?auto_4741 ) ) ( not ( = ?auto_4744 ?auto_4743 ) ) ( not ( = ?auto_4744 ?auto_4737 ) ) ( not ( = ?auto_4744 ?auto_4739 ) ) ( not ( = ?auto_4744 ?auto_4733 ) ) ( not ( = ?auto_4744 ?auto_4742 ) ) ( not ( = ?auto_4716 ?auto_4723 ) ) ( not ( = ?auto_4716 ?auto_4747 ) ) ( not ( = ?auto_4717 ?auto_4723 ) ) ( not ( = ?auto_4717 ?auto_4747 ) ) ( not ( = ?auto_4718 ?auto_4723 ) ) ( not ( = ?auto_4718 ?auto_4747 ) ) ( not ( = ?auto_4719 ?auto_4723 ) ) ( not ( = ?auto_4719 ?auto_4747 ) ) ( not ( = ?auto_4720 ?auto_4723 ) ) ( not ( = ?auto_4720 ?auto_4747 ) ) ( not ( = ?auto_4721 ?auto_4723 ) ) ( not ( = ?auto_4721 ?auto_4747 ) ) ( not ( = ?auto_4723 ?auto_4744 ) ) ( not ( = ?auto_4723 ?auto_4743 ) ) ( not ( = ?auto_4723 ?auto_4737 ) ) ( not ( = ?auto_4723 ?auto_4739 ) ) ( not ( = ?auto_4723 ?auto_4733 ) ) ( not ( = ?auto_4723 ?auto_4742 ) ) ( not ( = ?auto_4747 ?auto_4744 ) ) ( not ( = ?auto_4747 ?auto_4743 ) ) ( not ( = ?auto_4747 ?auto_4737 ) ) ( not ( = ?auto_4747 ?auto_4739 ) ) ( not ( = ?auto_4747 ?auto_4733 ) ) ( not ( = ?auto_4747 ?auto_4742 ) ) ( not ( = ?auto_4716 ?auto_4722 ) ) ( not ( = ?auto_4716 ?auto_4728 ) ) ( not ( = ?auto_4717 ?auto_4722 ) ) ( not ( = ?auto_4717 ?auto_4728 ) ) ( not ( = ?auto_4718 ?auto_4722 ) ) ( not ( = ?auto_4718 ?auto_4728 ) ) ( not ( = ?auto_4719 ?auto_4722 ) ) ( not ( = ?auto_4719 ?auto_4728 ) ) ( not ( = ?auto_4720 ?auto_4722 ) ) ( not ( = ?auto_4720 ?auto_4728 ) ) ( not ( = ?auto_4721 ?auto_4722 ) ) ( not ( = ?auto_4721 ?auto_4728 ) ) ( not ( = ?auto_4724 ?auto_4722 ) ) ( not ( = ?auto_4724 ?auto_4728 ) ) ( not ( = ?auto_4722 ?auto_4747 ) ) ( not ( = ?auto_4722 ?auto_4744 ) ) ( not ( = ?auto_4722 ?auto_4743 ) ) ( not ( = ?auto_4722 ?auto_4737 ) ) ( not ( = ?auto_4722 ?auto_4739 ) ) ( not ( = ?auto_4722 ?auto_4733 ) ) ( not ( = ?auto_4722 ?auto_4742 ) ) ( not ( = ?auto_4728 ?auto_4747 ) ) ( not ( = ?auto_4728 ?auto_4744 ) ) ( not ( = ?auto_4728 ?auto_4743 ) ) ( not ( = ?auto_4728 ?auto_4737 ) ) ( not ( = ?auto_4728 ?auto_4739 ) ) ( not ( = ?auto_4728 ?auto_4733 ) ) ( not ( = ?auto_4728 ?auto_4742 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4716 ?auto_4717 ?auto_4718 ?auto_4719 ?auto_4720 ?auto_4721 ?auto_4724 ?auto_4723 )
      ( MAKE-1CRATE ?auto_4723 ?auto_4722 )
      ( MAKE-8CRATE-VERIFY ?auto_4716 ?auto_4717 ?auto_4718 ?auto_4719 ?auto_4720 ?auto_4721 ?auto_4724 ?auto_4723 ?auto_4722 ) )
  )

)

