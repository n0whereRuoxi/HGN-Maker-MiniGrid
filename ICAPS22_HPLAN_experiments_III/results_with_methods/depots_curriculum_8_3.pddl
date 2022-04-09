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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4474 - SURFACE
      ?auto_4475 - SURFACE
    )
    :vars
    (
      ?auto_4476 - HOIST
      ?auto_4477 - PLACE
      ?auto_4479 - PLACE
      ?auto_4480 - HOIST
      ?auto_4481 - SURFACE
      ?auto_4478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4476 ?auto_4477 ) ( SURFACE-AT ?auto_4474 ?auto_4477 ) ( CLEAR ?auto_4474 ) ( IS-CRATE ?auto_4475 ) ( AVAILABLE ?auto_4476 ) ( not ( = ?auto_4479 ?auto_4477 ) ) ( HOIST-AT ?auto_4480 ?auto_4479 ) ( AVAILABLE ?auto_4480 ) ( SURFACE-AT ?auto_4475 ?auto_4479 ) ( ON ?auto_4475 ?auto_4481 ) ( CLEAR ?auto_4475 ) ( TRUCK-AT ?auto_4478 ?auto_4477 ) ( not ( = ?auto_4474 ?auto_4475 ) ) ( not ( = ?auto_4474 ?auto_4481 ) ) ( not ( = ?auto_4475 ?auto_4481 ) ) ( not ( = ?auto_4476 ?auto_4480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4478 ?auto_4477 ?auto_4479 )
      ( !LIFT ?auto_4480 ?auto_4475 ?auto_4481 ?auto_4479 )
      ( !LOAD ?auto_4480 ?auto_4475 ?auto_4478 ?auto_4479 )
      ( !DRIVE ?auto_4478 ?auto_4479 ?auto_4477 )
      ( !UNLOAD ?auto_4476 ?auto_4475 ?auto_4478 ?auto_4477 )
      ( !DROP ?auto_4476 ?auto_4475 ?auto_4474 ?auto_4477 )
      ( MAKE-1CRATE-VERIFY ?auto_4474 ?auto_4475 ) )
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
      ?auto_4493 - HOIST
      ?auto_4491 - PLACE
      ?auto_4492 - PLACE
      ?auto_4490 - HOIST
      ?auto_4488 - SURFACE
      ?auto_4494 - PLACE
      ?auto_4495 - HOIST
      ?auto_4496 - SURFACE
      ?auto_4489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4493 ?auto_4491 ) ( IS-CRATE ?auto_4487 ) ( not ( = ?auto_4492 ?auto_4491 ) ) ( HOIST-AT ?auto_4490 ?auto_4492 ) ( AVAILABLE ?auto_4490 ) ( SURFACE-AT ?auto_4487 ?auto_4492 ) ( ON ?auto_4487 ?auto_4488 ) ( CLEAR ?auto_4487 ) ( not ( = ?auto_4486 ?auto_4487 ) ) ( not ( = ?auto_4486 ?auto_4488 ) ) ( not ( = ?auto_4487 ?auto_4488 ) ) ( not ( = ?auto_4493 ?auto_4490 ) ) ( SURFACE-AT ?auto_4485 ?auto_4491 ) ( CLEAR ?auto_4485 ) ( IS-CRATE ?auto_4486 ) ( AVAILABLE ?auto_4493 ) ( not ( = ?auto_4494 ?auto_4491 ) ) ( HOIST-AT ?auto_4495 ?auto_4494 ) ( AVAILABLE ?auto_4495 ) ( SURFACE-AT ?auto_4486 ?auto_4494 ) ( ON ?auto_4486 ?auto_4496 ) ( CLEAR ?auto_4486 ) ( TRUCK-AT ?auto_4489 ?auto_4491 ) ( not ( = ?auto_4485 ?auto_4486 ) ) ( not ( = ?auto_4485 ?auto_4496 ) ) ( not ( = ?auto_4486 ?auto_4496 ) ) ( not ( = ?auto_4493 ?auto_4495 ) ) ( not ( = ?auto_4485 ?auto_4487 ) ) ( not ( = ?auto_4485 ?auto_4488 ) ) ( not ( = ?auto_4487 ?auto_4496 ) ) ( not ( = ?auto_4492 ?auto_4494 ) ) ( not ( = ?auto_4490 ?auto_4495 ) ) ( not ( = ?auto_4488 ?auto_4496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4485 ?auto_4486 )
      ( MAKE-1CRATE ?auto_4486 ?auto_4487 )
      ( MAKE-2CRATE-VERIFY ?auto_4485 ?auto_4486 ?auto_4487 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4499 - SURFACE
      ?auto_4500 - SURFACE
    )
    :vars
    (
      ?auto_4501 - HOIST
      ?auto_4502 - PLACE
      ?auto_4504 - PLACE
      ?auto_4505 - HOIST
      ?auto_4506 - SURFACE
      ?auto_4503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4501 ?auto_4502 ) ( SURFACE-AT ?auto_4499 ?auto_4502 ) ( CLEAR ?auto_4499 ) ( IS-CRATE ?auto_4500 ) ( AVAILABLE ?auto_4501 ) ( not ( = ?auto_4504 ?auto_4502 ) ) ( HOIST-AT ?auto_4505 ?auto_4504 ) ( AVAILABLE ?auto_4505 ) ( SURFACE-AT ?auto_4500 ?auto_4504 ) ( ON ?auto_4500 ?auto_4506 ) ( CLEAR ?auto_4500 ) ( TRUCK-AT ?auto_4503 ?auto_4502 ) ( not ( = ?auto_4499 ?auto_4500 ) ) ( not ( = ?auto_4499 ?auto_4506 ) ) ( not ( = ?auto_4500 ?auto_4506 ) ) ( not ( = ?auto_4501 ?auto_4505 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4503 ?auto_4502 ?auto_4504 )
      ( !LIFT ?auto_4505 ?auto_4500 ?auto_4506 ?auto_4504 )
      ( !LOAD ?auto_4505 ?auto_4500 ?auto_4503 ?auto_4504 )
      ( !DRIVE ?auto_4503 ?auto_4504 ?auto_4502 )
      ( !UNLOAD ?auto_4501 ?auto_4500 ?auto_4503 ?auto_4502 )
      ( !DROP ?auto_4501 ?auto_4500 ?auto_4499 ?auto_4502 )
      ( MAKE-1CRATE-VERIFY ?auto_4499 ?auto_4500 ) )
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
      ?auto_4518 - HOIST
      ?auto_4519 - PLACE
      ?auto_4515 - PLACE
      ?auto_4520 - HOIST
      ?auto_4517 - SURFACE
      ?auto_4521 - PLACE
      ?auto_4524 - HOIST
      ?auto_4522 - SURFACE
      ?auto_4525 - PLACE
      ?auto_4523 - HOIST
      ?auto_4526 - SURFACE
      ?auto_4516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4518 ?auto_4519 ) ( IS-CRATE ?auto_4514 ) ( not ( = ?auto_4515 ?auto_4519 ) ) ( HOIST-AT ?auto_4520 ?auto_4515 ) ( AVAILABLE ?auto_4520 ) ( SURFACE-AT ?auto_4514 ?auto_4515 ) ( ON ?auto_4514 ?auto_4517 ) ( CLEAR ?auto_4514 ) ( not ( = ?auto_4513 ?auto_4514 ) ) ( not ( = ?auto_4513 ?auto_4517 ) ) ( not ( = ?auto_4514 ?auto_4517 ) ) ( not ( = ?auto_4518 ?auto_4520 ) ) ( IS-CRATE ?auto_4513 ) ( not ( = ?auto_4521 ?auto_4519 ) ) ( HOIST-AT ?auto_4524 ?auto_4521 ) ( AVAILABLE ?auto_4524 ) ( SURFACE-AT ?auto_4513 ?auto_4521 ) ( ON ?auto_4513 ?auto_4522 ) ( CLEAR ?auto_4513 ) ( not ( = ?auto_4512 ?auto_4513 ) ) ( not ( = ?auto_4512 ?auto_4522 ) ) ( not ( = ?auto_4513 ?auto_4522 ) ) ( not ( = ?auto_4518 ?auto_4524 ) ) ( SURFACE-AT ?auto_4511 ?auto_4519 ) ( CLEAR ?auto_4511 ) ( IS-CRATE ?auto_4512 ) ( AVAILABLE ?auto_4518 ) ( not ( = ?auto_4525 ?auto_4519 ) ) ( HOIST-AT ?auto_4523 ?auto_4525 ) ( AVAILABLE ?auto_4523 ) ( SURFACE-AT ?auto_4512 ?auto_4525 ) ( ON ?auto_4512 ?auto_4526 ) ( CLEAR ?auto_4512 ) ( TRUCK-AT ?auto_4516 ?auto_4519 ) ( not ( = ?auto_4511 ?auto_4512 ) ) ( not ( = ?auto_4511 ?auto_4526 ) ) ( not ( = ?auto_4512 ?auto_4526 ) ) ( not ( = ?auto_4518 ?auto_4523 ) ) ( not ( = ?auto_4511 ?auto_4513 ) ) ( not ( = ?auto_4511 ?auto_4522 ) ) ( not ( = ?auto_4513 ?auto_4526 ) ) ( not ( = ?auto_4521 ?auto_4525 ) ) ( not ( = ?auto_4524 ?auto_4523 ) ) ( not ( = ?auto_4522 ?auto_4526 ) ) ( not ( = ?auto_4511 ?auto_4514 ) ) ( not ( = ?auto_4511 ?auto_4517 ) ) ( not ( = ?auto_4512 ?auto_4514 ) ) ( not ( = ?auto_4512 ?auto_4517 ) ) ( not ( = ?auto_4514 ?auto_4522 ) ) ( not ( = ?auto_4514 ?auto_4526 ) ) ( not ( = ?auto_4515 ?auto_4521 ) ) ( not ( = ?auto_4515 ?auto_4525 ) ) ( not ( = ?auto_4520 ?auto_4524 ) ) ( not ( = ?auto_4520 ?auto_4523 ) ) ( not ( = ?auto_4517 ?auto_4522 ) ) ( not ( = ?auto_4517 ?auto_4526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4511 ?auto_4512 ?auto_4513 )
      ( MAKE-1CRATE ?auto_4513 ?auto_4514 )
      ( MAKE-3CRATE-VERIFY ?auto_4511 ?auto_4512 ?auto_4513 ?auto_4514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4529 - SURFACE
      ?auto_4530 - SURFACE
    )
    :vars
    (
      ?auto_4531 - HOIST
      ?auto_4532 - PLACE
      ?auto_4534 - PLACE
      ?auto_4535 - HOIST
      ?auto_4536 - SURFACE
      ?auto_4533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4531 ?auto_4532 ) ( SURFACE-AT ?auto_4529 ?auto_4532 ) ( CLEAR ?auto_4529 ) ( IS-CRATE ?auto_4530 ) ( AVAILABLE ?auto_4531 ) ( not ( = ?auto_4534 ?auto_4532 ) ) ( HOIST-AT ?auto_4535 ?auto_4534 ) ( AVAILABLE ?auto_4535 ) ( SURFACE-AT ?auto_4530 ?auto_4534 ) ( ON ?auto_4530 ?auto_4536 ) ( CLEAR ?auto_4530 ) ( TRUCK-AT ?auto_4533 ?auto_4532 ) ( not ( = ?auto_4529 ?auto_4530 ) ) ( not ( = ?auto_4529 ?auto_4536 ) ) ( not ( = ?auto_4530 ?auto_4536 ) ) ( not ( = ?auto_4531 ?auto_4535 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4533 ?auto_4532 ?auto_4534 )
      ( !LIFT ?auto_4535 ?auto_4530 ?auto_4536 ?auto_4534 )
      ( !LOAD ?auto_4535 ?auto_4530 ?auto_4533 ?auto_4534 )
      ( !DRIVE ?auto_4533 ?auto_4534 ?auto_4532 )
      ( !UNLOAD ?auto_4531 ?auto_4530 ?auto_4533 ?auto_4532 )
      ( !DROP ?auto_4531 ?auto_4530 ?auto_4529 ?auto_4532 )
      ( MAKE-1CRATE-VERIFY ?auto_4529 ?auto_4530 ) )
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
      ?auto_4550 - HOIST
      ?auto_4551 - PLACE
      ?auto_4549 - PLACE
      ?auto_4548 - HOIST
      ?auto_4552 - SURFACE
      ?auto_4559 - SURFACE
      ?auto_4555 - PLACE
      ?auto_4558 - HOIST
      ?auto_4554 - SURFACE
      ?auto_4557 - PLACE
      ?auto_4556 - HOIST
      ?auto_4553 - SURFACE
      ?auto_4547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4550 ?auto_4551 ) ( IS-CRATE ?auto_4546 ) ( not ( = ?auto_4549 ?auto_4551 ) ) ( HOIST-AT ?auto_4548 ?auto_4549 ) ( SURFACE-AT ?auto_4546 ?auto_4549 ) ( ON ?auto_4546 ?auto_4552 ) ( CLEAR ?auto_4546 ) ( not ( = ?auto_4545 ?auto_4546 ) ) ( not ( = ?auto_4545 ?auto_4552 ) ) ( not ( = ?auto_4546 ?auto_4552 ) ) ( not ( = ?auto_4550 ?auto_4548 ) ) ( IS-CRATE ?auto_4545 ) ( AVAILABLE ?auto_4548 ) ( SURFACE-AT ?auto_4545 ?auto_4549 ) ( ON ?auto_4545 ?auto_4559 ) ( CLEAR ?auto_4545 ) ( not ( = ?auto_4544 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4559 ) ) ( not ( = ?auto_4545 ?auto_4559 ) ) ( IS-CRATE ?auto_4544 ) ( not ( = ?auto_4555 ?auto_4551 ) ) ( HOIST-AT ?auto_4558 ?auto_4555 ) ( AVAILABLE ?auto_4558 ) ( SURFACE-AT ?auto_4544 ?auto_4555 ) ( ON ?auto_4544 ?auto_4554 ) ( CLEAR ?auto_4544 ) ( not ( = ?auto_4543 ?auto_4544 ) ) ( not ( = ?auto_4543 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4554 ) ) ( not ( = ?auto_4550 ?auto_4558 ) ) ( SURFACE-AT ?auto_4542 ?auto_4551 ) ( CLEAR ?auto_4542 ) ( IS-CRATE ?auto_4543 ) ( AVAILABLE ?auto_4550 ) ( not ( = ?auto_4557 ?auto_4551 ) ) ( HOIST-AT ?auto_4556 ?auto_4557 ) ( AVAILABLE ?auto_4556 ) ( SURFACE-AT ?auto_4543 ?auto_4557 ) ( ON ?auto_4543 ?auto_4553 ) ( CLEAR ?auto_4543 ) ( TRUCK-AT ?auto_4547 ?auto_4551 ) ( not ( = ?auto_4542 ?auto_4543 ) ) ( not ( = ?auto_4542 ?auto_4553 ) ) ( not ( = ?auto_4543 ?auto_4553 ) ) ( not ( = ?auto_4550 ?auto_4556 ) ) ( not ( = ?auto_4542 ?auto_4544 ) ) ( not ( = ?auto_4542 ?auto_4554 ) ) ( not ( = ?auto_4544 ?auto_4553 ) ) ( not ( = ?auto_4555 ?auto_4557 ) ) ( not ( = ?auto_4558 ?auto_4556 ) ) ( not ( = ?auto_4554 ?auto_4553 ) ) ( not ( = ?auto_4542 ?auto_4545 ) ) ( not ( = ?auto_4542 ?auto_4559 ) ) ( not ( = ?auto_4543 ?auto_4545 ) ) ( not ( = ?auto_4543 ?auto_4559 ) ) ( not ( = ?auto_4545 ?auto_4554 ) ) ( not ( = ?auto_4545 ?auto_4553 ) ) ( not ( = ?auto_4549 ?auto_4555 ) ) ( not ( = ?auto_4549 ?auto_4557 ) ) ( not ( = ?auto_4548 ?auto_4558 ) ) ( not ( = ?auto_4548 ?auto_4556 ) ) ( not ( = ?auto_4559 ?auto_4554 ) ) ( not ( = ?auto_4559 ?auto_4553 ) ) ( not ( = ?auto_4542 ?auto_4546 ) ) ( not ( = ?auto_4542 ?auto_4552 ) ) ( not ( = ?auto_4543 ?auto_4546 ) ) ( not ( = ?auto_4543 ?auto_4552 ) ) ( not ( = ?auto_4544 ?auto_4546 ) ) ( not ( = ?auto_4544 ?auto_4552 ) ) ( not ( = ?auto_4546 ?auto_4559 ) ) ( not ( = ?auto_4546 ?auto_4554 ) ) ( not ( = ?auto_4546 ?auto_4553 ) ) ( not ( = ?auto_4552 ?auto_4559 ) ) ( not ( = ?auto_4552 ?auto_4554 ) ) ( not ( = ?auto_4552 ?auto_4553 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4542 ?auto_4543 ?auto_4544 ?auto_4545 )
      ( MAKE-1CRATE ?auto_4545 ?auto_4546 )
      ( MAKE-4CRATE-VERIFY ?auto_4542 ?auto_4543 ?auto_4544 ?auto_4545 ?auto_4546 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4562 - SURFACE
      ?auto_4563 - SURFACE
    )
    :vars
    (
      ?auto_4564 - HOIST
      ?auto_4565 - PLACE
      ?auto_4567 - PLACE
      ?auto_4568 - HOIST
      ?auto_4569 - SURFACE
      ?auto_4566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4564 ?auto_4565 ) ( SURFACE-AT ?auto_4562 ?auto_4565 ) ( CLEAR ?auto_4562 ) ( IS-CRATE ?auto_4563 ) ( AVAILABLE ?auto_4564 ) ( not ( = ?auto_4567 ?auto_4565 ) ) ( HOIST-AT ?auto_4568 ?auto_4567 ) ( AVAILABLE ?auto_4568 ) ( SURFACE-AT ?auto_4563 ?auto_4567 ) ( ON ?auto_4563 ?auto_4569 ) ( CLEAR ?auto_4563 ) ( TRUCK-AT ?auto_4566 ?auto_4565 ) ( not ( = ?auto_4562 ?auto_4563 ) ) ( not ( = ?auto_4562 ?auto_4569 ) ) ( not ( = ?auto_4563 ?auto_4569 ) ) ( not ( = ?auto_4564 ?auto_4568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4566 ?auto_4565 ?auto_4567 )
      ( !LIFT ?auto_4568 ?auto_4563 ?auto_4569 ?auto_4567 )
      ( !LOAD ?auto_4568 ?auto_4563 ?auto_4566 ?auto_4567 )
      ( !DRIVE ?auto_4566 ?auto_4567 ?auto_4565 )
      ( !UNLOAD ?auto_4564 ?auto_4563 ?auto_4566 ?auto_4565 )
      ( !DROP ?auto_4564 ?auto_4563 ?auto_4562 ?auto_4565 )
      ( MAKE-1CRATE-VERIFY ?auto_4562 ?auto_4563 ) )
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
      ?auto_4587 - HOIST
      ?auto_4582 - PLACE
      ?auto_4586 - PLACE
      ?auto_4585 - HOIST
      ?auto_4584 - SURFACE
      ?auto_4589 - PLACE
      ?auto_4590 - HOIST
      ?auto_4593 - SURFACE
      ?auto_4591 - SURFACE
      ?auto_4595 - SURFACE
      ?auto_4592 - PLACE
      ?auto_4594 - HOIST
      ?auto_4588 - SURFACE
      ?auto_4583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4587 ?auto_4582 ) ( IS-CRATE ?auto_4581 ) ( not ( = ?auto_4586 ?auto_4582 ) ) ( HOIST-AT ?auto_4585 ?auto_4586 ) ( SURFACE-AT ?auto_4581 ?auto_4586 ) ( ON ?auto_4581 ?auto_4584 ) ( CLEAR ?auto_4581 ) ( not ( = ?auto_4580 ?auto_4581 ) ) ( not ( = ?auto_4580 ?auto_4584 ) ) ( not ( = ?auto_4581 ?auto_4584 ) ) ( not ( = ?auto_4587 ?auto_4585 ) ) ( IS-CRATE ?auto_4580 ) ( not ( = ?auto_4589 ?auto_4582 ) ) ( HOIST-AT ?auto_4590 ?auto_4589 ) ( SURFACE-AT ?auto_4580 ?auto_4589 ) ( ON ?auto_4580 ?auto_4593 ) ( CLEAR ?auto_4580 ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( not ( = ?auto_4579 ?auto_4593 ) ) ( not ( = ?auto_4580 ?auto_4593 ) ) ( not ( = ?auto_4587 ?auto_4590 ) ) ( IS-CRATE ?auto_4579 ) ( AVAILABLE ?auto_4590 ) ( SURFACE-AT ?auto_4579 ?auto_4589 ) ( ON ?auto_4579 ?auto_4591 ) ( CLEAR ?auto_4579 ) ( not ( = ?auto_4578 ?auto_4579 ) ) ( not ( = ?auto_4578 ?auto_4591 ) ) ( not ( = ?auto_4579 ?auto_4591 ) ) ( IS-CRATE ?auto_4578 ) ( AVAILABLE ?auto_4585 ) ( SURFACE-AT ?auto_4578 ?auto_4586 ) ( ON ?auto_4578 ?auto_4595 ) ( CLEAR ?auto_4578 ) ( not ( = ?auto_4577 ?auto_4578 ) ) ( not ( = ?auto_4577 ?auto_4595 ) ) ( not ( = ?auto_4578 ?auto_4595 ) ) ( SURFACE-AT ?auto_4576 ?auto_4582 ) ( CLEAR ?auto_4576 ) ( IS-CRATE ?auto_4577 ) ( AVAILABLE ?auto_4587 ) ( not ( = ?auto_4592 ?auto_4582 ) ) ( HOIST-AT ?auto_4594 ?auto_4592 ) ( AVAILABLE ?auto_4594 ) ( SURFACE-AT ?auto_4577 ?auto_4592 ) ( ON ?auto_4577 ?auto_4588 ) ( CLEAR ?auto_4577 ) ( TRUCK-AT ?auto_4583 ?auto_4582 ) ( not ( = ?auto_4576 ?auto_4577 ) ) ( not ( = ?auto_4576 ?auto_4588 ) ) ( not ( = ?auto_4577 ?auto_4588 ) ) ( not ( = ?auto_4587 ?auto_4594 ) ) ( not ( = ?auto_4576 ?auto_4578 ) ) ( not ( = ?auto_4576 ?auto_4595 ) ) ( not ( = ?auto_4578 ?auto_4588 ) ) ( not ( = ?auto_4586 ?auto_4592 ) ) ( not ( = ?auto_4585 ?auto_4594 ) ) ( not ( = ?auto_4595 ?auto_4588 ) ) ( not ( = ?auto_4576 ?auto_4579 ) ) ( not ( = ?auto_4576 ?auto_4591 ) ) ( not ( = ?auto_4577 ?auto_4579 ) ) ( not ( = ?auto_4577 ?auto_4591 ) ) ( not ( = ?auto_4579 ?auto_4595 ) ) ( not ( = ?auto_4579 ?auto_4588 ) ) ( not ( = ?auto_4589 ?auto_4586 ) ) ( not ( = ?auto_4589 ?auto_4592 ) ) ( not ( = ?auto_4590 ?auto_4585 ) ) ( not ( = ?auto_4590 ?auto_4594 ) ) ( not ( = ?auto_4591 ?auto_4595 ) ) ( not ( = ?auto_4591 ?auto_4588 ) ) ( not ( = ?auto_4576 ?auto_4580 ) ) ( not ( = ?auto_4576 ?auto_4593 ) ) ( not ( = ?auto_4577 ?auto_4580 ) ) ( not ( = ?auto_4577 ?auto_4593 ) ) ( not ( = ?auto_4578 ?auto_4580 ) ) ( not ( = ?auto_4578 ?auto_4593 ) ) ( not ( = ?auto_4580 ?auto_4591 ) ) ( not ( = ?auto_4580 ?auto_4595 ) ) ( not ( = ?auto_4580 ?auto_4588 ) ) ( not ( = ?auto_4593 ?auto_4591 ) ) ( not ( = ?auto_4593 ?auto_4595 ) ) ( not ( = ?auto_4593 ?auto_4588 ) ) ( not ( = ?auto_4576 ?auto_4581 ) ) ( not ( = ?auto_4576 ?auto_4584 ) ) ( not ( = ?auto_4577 ?auto_4581 ) ) ( not ( = ?auto_4577 ?auto_4584 ) ) ( not ( = ?auto_4578 ?auto_4581 ) ) ( not ( = ?auto_4578 ?auto_4584 ) ) ( not ( = ?auto_4579 ?auto_4581 ) ) ( not ( = ?auto_4579 ?auto_4584 ) ) ( not ( = ?auto_4581 ?auto_4593 ) ) ( not ( = ?auto_4581 ?auto_4591 ) ) ( not ( = ?auto_4581 ?auto_4595 ) ) ( not ( = ?auto_4581 ?auto_4588 ) ) ( not ( = ?auto_4584 ?auto_4593 ) ) ( not ( = ?auto_4584 ?auto_4591 ) ) ( not ( = ?auto_4584 ?auto_4595 ) ) ( not ( = ?auto_4584 ?auto_4588 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4576 ?auto_4577 ?auto_4578 ?auto_4579 ?auto_4580 )
      ( MAKE-1CRATE ?auto_4580 ?auto_4581 )
      ( MAKE-5CRATE-VERIFY ?auto_4576 ?auto_4577 ?auto_4578 ?auto_4579 ?auto_4580 ?auto_4581 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4598 - SURFACE
      ?auto_4599 - SURFACE
    )
    :vars
    (
      ?auto_4600 - HOIST
      ?auto_4601 - PLACE
      ?auto_4603 - PLACE
      ?auto_4604 - HOIST
      ?auto_4605 - SURFACE
      ?auto_4602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4600 ?auto_4601 ) ( SURFACE-AT ?auto_4598 ?auto_4601 ) ( CLEAR ?auto_4598 ) ( IS-CRATE ?auto_4599 ) ( AVAILABLE ?auto_4600 ) ( not ( = ?auto_4603 ?auto_4601 ) ) ( HOIST-AT ?auto_4604 ?auto_4603 ) ( AVAILABLE ?auto_4604 ) ( SURFACE-AT ?auto_4599 ?auto_4603 ) ( ON ?auto_4599 ?auto_4605 ) ( CLEAR ?auto_4599 ) ( TRUCK-AT ?auto_4602 ?auto_4601 ) ( not ( = ?auto_4598 ?auto_4599 ) ) ( not ( = ?auto_4598 ?auto_4605 ) ) ( not ( = ?auto_4599 ?auto_4605 ) ) ( not ( = ?auto_4600 ?auto_4604 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4602 ?auto_4601 ?auto_4603 )
      ( !LIFT ?auto_4604 ?auto_4599 ?auto_4605 ?auto_4603 )
      ( !LOAD ?auto_4604 ?auto_4599 ?auto_4602 ?auto_4603 )
      ( !DRIVE ?auto_4602 ?auto_4603 ?auto_4601 )
      ( !UNLOAD ?auto_4600 ?auto_4599 ?auto_4602 ?auto_4601 )
      ( !DROP ?auto_4600 ?auto_4599 ?auto_4598 ?auto_4601 )
      ( MAKE-1CRATE-VERIFY ?auto_4598 ?auto_4599 ) )
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
      ?auto_4624 - HOIST
      ?auto_4623 - PLACE
      ?auto_4620 - PLACE
      ?auto_4621 - HOIST
      ?auto_4622 - SURFACE
      ?auto_4627 - PLACE
      ?auto_4634 - HOIST
      ?auto_4626 - SURFACE
      ?auto_4632 - PLACE
      ?auto_4633 - HOIST
      ?auto_4630 - SURFACE
      ?auto_4631 - SURFACE
      ?auto_4629 - SURFACE
      ?auto_4628 - SURFACE
      ?auto_4625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4624 ?auto_4623 ) ( IS-CRATE ?auto_4619 ) ( not ( = ?auto_4620 ?auto_4623 ) ) ( HOIST-AT ?auto_4621 ?auto_4620 ) ( SURFACE-AT ?auto_4619 ?auto_4620 ) ( ON ?auto_4619 ?auto_4622 ) ( CLEAR ?auto_4619 ) ( not ( = ?auto_4618 ?auto_4619 ) ) ( not ( = ?auto_4618 ?auto_4622 ) ) ( not ( = ?auto_4619 ?auto_4622 ) ) ( not ( = ?auto_4624 ?auto_4621 ) ) ( IS-CRATE ?auto_4618 ) ( not ( = ?auto_4627 ?auto_4623 ) ) ( HOIST-AT ?auto_4634 ?auto_4627 ) ( SURFACE-AT ?auto_4618 ?auto_4627 ) ( ON ?auto_4618 ?auto_4626 ) ( CLEAR ?auto_4618 ) ( not ( = ?auto_4617 ?auto_4618 ) ) ( not ( = ?auto_4617 ?auto_4626 ) ) ( not ( = ?auto_4618 ?auto_4626 ) ) ( not ( = ?auto_4624 ?auto_4634 ) ) ( IS-CRATE ?auto_4617 ) ( not ( = ?auto_4632 ?auto_4623 ) ) ( HOIST-AT ?auto_4633 ?auto_4632 ) ( SURFACE-AT ?auto_4617 ?auto_4632 ) ( ON ?auto_4617 ?auto_4630 ) ( CLEAR ?auto_4617 ) ( not ( = ?auto_4616 ?auto_4617 ) ) ( not ( = ?auto_4616 ?auto_4630 ) ) ( not ( = ?auto_4617 ?auto_4630 ) ) ( not ( = ?auto_4624 ?auto_4633 ) ) ( IS-CRATE ?auto_4616 ) ( AVAILABLE ?auto_4633 ) ( SURFACE-AT ?auto_4616 ?auto_4632 ) ( ON ?auto_4616 ?auto_4631 ) ( CLEAR ?auto_4616 ) ( not ( = ?auto_4615 ?auto_4616 ) ) ( not ( = ?auto_4615 ?auto_4631 ) ) ( not ( = ?auto_4616 ?auto_4631 ) ) ( IS-CRATE ?auto_4615 ) ( AVAILABLE ?auto_4634 ) ( SURFACE-AT ?auto_4615 ?auto_4627 ) ( ON ?auto_4615 ?auto_4629 ) ( CLEAR ?auto_4615 ) ( not ( = ?auto_4614 ?auto_4615 ) ) ( not ( = ?auto_4614 ?auto_4629 ) ) ( not ( = ?auto_4615 ?auto_4629 ) ) ( SURFACE-AT ?auto_4613 ?auto_4623 ) ( CLEAR ?auto_4613 ) ( IS-CRATE ?auto_4614 ) ( AVAILABLE ?auto_4624 ) ( AVAILABLE ?auto_4621 ) ( SURFACE-AT ?auto_4614 ?auto_4620 ) ( ON ?auto_4614 ?auto_4628 ) ( CLEAR ?auto_4614 ) ( TRUCK-AT ?auto_4625 ?auto_4623 ) ( not ( = ?auto_4613 ?auto_4614 ) ) ( not ( = ?auto_4613 ?auto_4628 ) ) ( not ( = ?auto_4614 ?auto_4628 ) ) ( not ( = ?auto_4613 ?auto_4615 ) ) ( not ( = ?auto_4613 ?auto_4629 ) ) ( not ( = ?auto_4615 ?auto_4628 ) ) ( not ( = ?auto_4627 ?auto_4620 ) ) ( not ( = ?auto_4634 ?auto_4621 ) ) ( not ( = ?auto_4629 ?auto_4628 ) ) ( not ( = ?auto_4613 ?auto_4616 ) ) ( not ( = ?auto_4613 ?auto_4631 ) ) ( not ( = ?auto_4614 ?auto_4616 ) ) ( not ( = ?auto_4614 ?auto_4631 ) ) ( not ( = ?auto_4616 ?auto_4629 ) ) ( not ( = ?auto_4616 ?auto_4628 ) ) ( not ( = ?auto_4632 ?auto_4627 ) ) ( not ( = ?auto_4632 ?auto_4620 ) ) ( not ( = ?auto_4633 ?auto_4634 ) ) ( not ( = ?auto_4633 ?auto_4621 ) ) ( not ( = ?auto_4631 ?auto_4629 ) ) ( not ( = ?auto_4631 ?auto_4628 ) ) ( not ( = ?auto_4613 ?auto_4617 ) ) ( not ( = ?auto_4613 ?auto_4630 ) ) ( not ( = ?auto_4614 ?auto_4617 ) ) ( not ( = ?auto_4614 ?auto_4630 ) ) ( not ( = ?auto_4615 ?auto_4617 ) ) ( not ( = ?auto_4615 ?auto_4630 ) ) ( not ( = ?auto_4617 ?auto_4631 ) ) ( not ( = ?auto_4617 ?auto_4629 ) ) ( not ( = ?auto_4617 ?auto_4628 ) ) ( not ( = ?auto_4630 ?auto_4631 ) ) ( not ( = ?auto_4630 ?auto_4629 ) ) ( not ( = ?auto_4630 ?auto_4628 ) ) ( not ( = ?auto_4613 ?auto_4618 ) ) ( not ( = ?auto_4613 ?auto_4626 ) ) ( not ( = ?auto_4614 ?auto_4618 ) ) ( not ( = ?auto_4614 ?auto_4626 ) ) ( not ( = ?auto_4615 ?auto_4618 ) ) ( not ( = ?auto_4615 ?auto_4626 ) ) ( not ( = ?auto_4616 ?auto_4618 ) ) ( not ( = ?auto_4616 ?auto_4626 ) ) ( not ( = ?auto_4618 ?auto_4630 ) ) ( not ( = ?auto_4618 ?auto_4631 ) ) ( not ( = ?auto_4618 ?auto_4629 ) ) ( not ( = ?auto_4618 ?auto_4628 ) ) ( not ( = ?auto_4626 ?auto_4630 ) ) ( not ( = ?auto_4626 ?auto_4631 ) ) ( not ( = ?auto_4626 ?auto_4629 ) ) ( not ( = ?auto_4626 ?auto_4628 ) ) ( not ( = ?auto_4613 ?auto_4619 ) ) ( not ( = ?auto_4613 ?auto_4622 ) ) ( not ( = ?auto_4614 ?auto_4619 ) ) ( not ( = ?auto_4614 ?auto_4622 ) ) ( not ( = ?auto_4615 ?auto_4619 ) ) ( not ( = ?auto_4615 ?auto_4622 ) ) ( not ( = ?auto_4616 ?auto_4619 ) ) ( not ( = ?auto_4616 ?auto_4622 ) ) ( not ( = ?auto_4617 ?auto_4619 ) ) ( not ( = ?auto_4617 ?auto_4622 ) ) ( not ( = ?auto_4619 ?auto_4626 ) ) ( not ( = ?auto_4619 ?auto_4630 ) ) ( not ( = ?auto_4619 ?auto_4631 ) ) ( not ( = ?auto_4619 ?auto_4629 ) ) ( not ( = ?auto_4619 ?auto_4628 ) ) ( not ( = ?auto_4622 ?auto_4626 ) ) ( not ( = ?auto_4622 ?auto_4630 ) ) ( not ( = ?auto_4622 ?auto_4631 ) ) ( not ( = ?auto_4622 ?auto_4629 ) ) ( not ( = ?auto_4622 ?auto_4628 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4613 ?auto_4614 ?auto_4615 ?auto_4616 ?auto_4617 ?auto_4618 )
      ( MAKE-1CRATE ?auto_4618 ?auto_4619 )
      ( MAKE-6CRATE-VERIFY ?auto_4613 ?auto_4614 ?auto_4615 ?auto_4616 ?auto_4617 ?auto_4618 ?auto_4619 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4637 - SURFACE
      ?auto_4638 - SURFACE
    )
    :vars
    (
      ?auto_4639 - HOIST
      ?auto_4640 - PLACE
      ?auto_4642 - PLACE
      ?auto_4643 - HOIST
      ?auto_4644 - SURFACE
      ?auto_4641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4639 ?auto_4640 ) ( SURFACE-AT ?auto_4637 ?auto_4640 ) ( CLEAR ?auto_4637 ) ( IS-CRATE ?auto_4638 ) ( AVAILABLE ?auto_4639 ) ( not ( = ?auto_4642 ?auto_4640 ) ) ( HOIST-AT ?auto_4643 ?auto_4642 ) ( AVAILABLE ?auto_4643 ) ( SURFACE-AT ?auto_4638 ?auto_4642 ) ( ON ?auto_4638 ?auto_4644 ) ( CLEAR ?auto_4638 ) ( TRUCK-AT ?auto_4641 ?auto_4640 ) ( not ( = ?auto_4637 ?auto_4638 ) ) ( not ( = ?auto_4637 ?auto_4644 ) ) ( not ( = ?auto_4638 ?auto_4644 ) ) ( not ( = ?auto_4639 ?auto_4643 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4641 ?auto_4640 ?auto_4642 )
      ( !LIFT ?auto_4643 ?auto_4638 ?auto_4644 ?auto_4642 )
      ( !LOAD ?auto_4643 ?auto_4638 ?auto_4641 ?auto_4642 )
      ( !DRIVE ?auto_4641 ?auto_4642 ?auto_4640 )
      ( !UNLOAD ?auto_4639 ?auto_4638 ?auto_4641 ?auto_4640 )
      ( !DROP ?auto_4639 ?auto_4638 ?auto_4637 ?auto_4640 )
      ( MAKE-1CRATE-VERIFY ?auto_4637 ?auto_4638 ) )
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
      ?auto_4665 - HOIST
      ?auto_4664 - PLACE
      ?auto_4661 - PLACE
      ?auto_4662 - HOIST
      ?auto_4663 - SURFACE
      ?auto_4674 - PLACE
      ?auto_4670 - HOIST
      ?auto_4671 - SURFACE
      ?auto_4673 - PLACE
      ?auto_4672 - HOIST
      ?auto_4676 - SURFACE
      ?auto_4667 - SURFACE
      ?auto_4668 - SURFACE
      ?auto_4675 - SURFACE
      ?auto_4669 - SURFACE
      ?auto_4666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4665 ?auto_4664 ) ( IS-CRATE ?auto_4660 ) ( not ( = ?auto_4661 ?auto_4664 ) ) ( HOIST-AT ?auto_4662 ?auto_4661 ) ( SURFACE-AT ?auto_4660 ?auto_4661 ) ( ON ?auto_4660 ?auto_4663 ) ( CLEAR ?auto_4660 ) ( not ( = ?auto_4659 ?auto_4660 ) ) ( not ( = ?auto_4659 ?auto_4663 ) ) ( not ( = ?auto_4660 ?auto_4663 ) ) ( not ( = ?auto_4665 ?auto_4662 ) ) ( IS-CRATE ?auto_4659 ) ( not ( = ?auto_4674 ?auto_4664 ) ) ( HOIST-AT ?auto_4670 ?auto_4674 ) ( SURFACE-AT ?auto_4659 ?auto_4674 ) ( ON ?auto_4659 ?auto_4671 ) ( CLEAR ?auto_4659 ) ( not ( = ?auto_4658 ?auto_4659 ) ) ( not ( = ?auto_4658 ?auto_4671 ) ) ( not ( = ?auto_4659 ?auto_4671 ) ) ( not ( = ?auto_4665 ?auto_4670 ) ) ( IS-CRATE ?auto_4658 ) ( not ( = ?auto_4673 ?auto_4664 ) ) ( HOIST-AT ?auto_4672 ?auto_4673 ) ( SURFACE-AT ?auto_4658 ?auto_4673 ) ( ON ?auto_4658 ?auto_4676 ) ( CLEAR ?auto_4658 ) ( not ( = ?auto_4657 ?auto_4658 ) ) ( not ( = ?auto_4657 ?auto_4676 ) ) ( not ( = ?auto_4658 ?auto_4676 ) ) ( not ( = ?auto_4665 ?auto_4672 ) ) ( IS-CRATE ?auto_4657 ) ( SURFACE-AT ?auto_4657 ?auto_4661 ) ( ON ?auto_4657 ?auto_4667 ) ( CLEAR ?auto_4657 ) ( not ( = ?auto_4656 ?auto_4657 ) ) ( not ( = ?auto_4656 ?auto_4667 ) ) ( not ( = ?auto_4657 ?auto_4667 ) ) ( IS-CRATE ?auto_4656 ) ( AVAILABLE ?auto_4662 ) ( SURFACE-AT ?auto_4656 ?auto_4661 ) ( ON ?auto_4656 ?auto_4668 ) ( CLEAR ?auto_4656 ) ( not ( = ?auto_4655 ?auto_4656 ) ) ( not ( = ?auto_4655 ?auto_4668 ) ) ( not ( = ?auto_4656 ?auto_4668 ) ) ( IS-CRATE ?auto_4655 ) ( AVAILABLE ?auto_4672 ) ( SURFACE-AT ?auto_4655 ?auto_4673 ) ( ON ?auto_4655 ?auto_4675 ) ( CLEAR ?auto_4655 ) ( not ( = ?auto_4654 ?auto_4655 ) ) ( not ( = ?auto_4654 ?auto_4675 ) ) ( not ( = ?auto_4655 ?auto_4675 ) ) ( SURFACE-AT ?auto_4653 ?auto_4664 ) ( CLEAR ?auto_4653 ) ( IS-CRATE ?auto_4654 ) ( AVAILABLE ?auto_4665 ) ( AVAILABLE ?auto_4670 ) ( SURFACE-AT ?auto_4654 ?auto_4674 ) ( ON ?auto_4654 ?auto_4669 ) ( CLEAR ?auto_4654 ) ( TRUCK-AT ?auto_4666 ?auto_4664 ) ( not ( = ?auto_4653 ?auto_4654 ) ) ( not ( = ?auto_4653 ?auto_4669 ) ) ( not ( = ?auto_4654 ?auto_4669 ) ) ( not ( = ?auto_4653 ?auto_4655 ) ) ( not ( = ?auto_4653 ?auto_4675 ) ) ( not ( = ?auto_4655 ?auto_4669 ) ) ( not ( = ?auto_4673 ?auto_4674 ) ) ( not ( = ?auto_4672 ?auto_4670 ) ) ( not ( = ?auto_4675 ?auto_4669 ) ) ( not ( = ?auto_4653 ?auto_4656 ) ) ( not ( = ?auto_4653 ?auto_4668 ) ) ( not ( = ?auto_4654 ?auto_4656 ) ) ( not ( = ?auto_4654 ?auto_4668 ) ) ( not ( = ?auto_4656 ?auto_4675 ) ) ( not ( = ?auto_4656 ?auto_4669 ) ) ( not ( = ?auto_4661 ?auto_4673 ) ) ( not ( = ?auto_4661 ?auto_4674 ) ) ( not ( = ?auto_4662 ?auto_4672 ) ) ( not ( = ?auto_4662 ?auto_4670 ) ) ( not ( = ?auto_4668 ?auto_4675 ) ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( not ( = ?auto_4653 ?auto_4657 ) ) ( not ( = ?auto_4653 ?auto_4667 ) ) ( not ( = ?auto_4654 ?auto_4657 ) ) ( not ( = ?auto_4654 ?auto_4667 ) ) ( not ( = ?auto_4655 ?auto_4657 ) ) ( not ( = ?auto_4655 ?auto_4667 ) ) ( not ( = ?auto_4657 ?auto_4668 ) ) ( not ( = ?auto_4657 ?auto_4675 ) ) ( not ( = ?auto_4657 ?auto_4669 ) ) ( not ( = ?auto_4667 ?auto_4668 ) ) ( not ( = ?auto_4667 ?auto_4675 ) ) ( not ( = ?auto_4667 ?auto_4669 ) ) ( not ( = ?auto_4653 ?auto_4658 ) ) ( not ( = ?auto_4653 ?auto_4676 ) ) ( not ( = ?auto_4654 ?auto_4658 ) ) ( not ( = ?auto_4654 ?auto_4676 ) ) ( not ( = ?auto_4655 ?auto_4658 ) ) ( not ( = ?auto_4655 ?auto_4676 ) ) ( not ( = ?auto_4656 ?auto_4658 ) ) ( not ( = ?auto_4656 ?auto_4676 ) ) ( not ( = ?auto_4658 ?auto_4667 ) ) ( not ( = ?auto_4658 ?auto_4668 ) ) ( not ( = ?auto_4658 ?auto_4675 ) ) ( not ( = ?auto_4658 ?auto_4669 ) ) ( not ( = ?auto_4676 ?auto_4667 ) ) ( not ( = ?auto_4676 ?auto_4668 ) ) ( not ( = ?auto_4676 ?auto_4675 ) ) ( not ( = ?auto_4676 ?auto_4669 ) ) ( not ( = ?auto_4653 ?auto_4659 ) ) ( not ( = ?auto_4653 ?auto_4671 ) ) ( not ( = ?auto_4654 ?auto_4659 ) ) ( not ( = ?auto_4654 ?auto_4671 ) ) ( not ( = ?auto_4655 ?auto_4659 ) ) ( not ( = ?auto_4655 ?auto_4671 ) ) ( not ( = ?auto_4656 ?auto_4659 ) ) ( not ( = ?auto_4656 ?auto_4671 ) ) ( not ( = ?auto_4657 ?auto_4659 ) ) ( not ( = ?auto_4657 ?auto_4671 ) ) ( not ( = ?auto_4659 ?auto_4676 ) ) ( not ( = ?auto_4659 ?auto_4667 ) ) ( not ( = ?auto_4659 ?auto_4668 ) ) ( not ( = ?auto_4659 ?auto_4675 ) ) ( not ( = ?auto_4659 ?auto_4669 ) ) ( not ( = ?auto_4671 ?auto_4676 ) ) ( not ( = ?auto_4671 ?auto_4667 ) ) ( not ( = ?auto_4671 ?auto_4668 ) ) ( not ( = ?auto_4671 ?auto_4675 ) ) ( not ( = ?auto_4671 ?auto_4669 ) ) ( not ( = ?auto_4653 ?auto_4660 ) ) ( not ( = ?auto_4653 ?auto_4663 ) ) ( not ( = ?auto_4654 ?auto_4660 ) ) ( not ( = ?auto_4654 ?auto_4663 ) ) ( not ( = ?auto_4655 ?auto_4660 ) ) ( not ( = ?auto_4655 ?auto_4663 ) ) ( not ( = ?auto_4656 ?auto_4660 ) ) ( not ( = ?auto_4656 ?auto_4663 ) ) ( not ( = ?auto_4657 ?auto_4660 ) ) ( not ( = ?auto_4657 ?auto_4663 ) ) ( not ( = ?auto_4658 ?auto_4660 ) ) ( not ( = ?auto_4658 ?auto_4663 ) ) ( not ( = ?auto_4660 ?auto_4671 ) ) ( not ( = ?auto_4660 ?auto_4676 ) ) ( not ( = ?auto_4660 ?auto_4667 ) ) ( not ( = ?auto_4660 ?auto_4668 ) ) ( not ( = ?auto_4660 ?auto_4675 ) ) ( not ( = ?auto_4660 ?auto_4669 ) ) ( not ( = ?auto_4663 ?auto_4671 ) ) ( not ( = ?auto_4663 ?auto_4676 ) ) ( not ( = ?auto_4663 ?auto_4667 ) ) ( not ( = ?auto_4663 ?auto_4668 ) ) ( not ( = ?auto_4663 ?auto_4675 ) ) ( not ( = ?auto_4663 ?auto_4669 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4653 ?auto_4654 ?auto_4655 ?auto_4656 ?auto_4657 ?auto_4658 ?auto_4659 )
      ( MAKE-1CRATE ?auto_4659 ?auto_4660 )
      ( MAKE-7CRATE-VERIFY ?auto_4653 ?auto_4654 ?auto_4655 ?auto_4656 ?auto_4657 ?auto_4658 ?auto_4659 ?auto_4660 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4679 - SURFACE
      ?auto_4680 - SURFACE
    )
    :vars
    (
      ?auto_4681 - HOIST
      ?auto_4682 - PLACE
      ?auto_4684 - PLACE
      ?auto_4685 - HOIST
      ?auto_4686 - SURFACE
      ?auto_4683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4681 ?auto_4682 ) ( SURFACE-AT ?auto_4679 ?auto_4682 ) ( CLEAR ?auto_4679 ) ( IS-CRATE ?auto_4680 ) ( AVAILABLE ?auto_4681 ) ( not ( = ?auto_4684 ?auto_4682 ) ) ( HOIST-AT ?auto_4685 ?auto_4684 ) ( AVAILABLE ?auto_4685 ) ( SURFACE-AT ?auto_4680 ?auto_4684 ) ( ON ?auto_4680 ?auto_4686 ) ( CLEAR ?auto_4680 ) ( TRUCK-AT ?auto_4683 ?auto_4682 ) ( not ( = ?auto_4679 ?auto_4680 ) ) ( not ( = ?auto_4679 ?auto_4686 ) ) ( not ( = ?auto_4680 ?auto_4686 ) ) ( not ( = ?auto_4681 ?auto_4685 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4683 ?auto_4682 ?auto_4684 )
      ( !LIFT ?auto_4685 ?auto_4680 ?auto_4686 ?auto_4684 )
      ( !LOAD ?auto_4685 ?auto_4680 ?auto_4683 ?auto_4684 )
      ( !DRIVE ?auto_4683 ?auto_4684 ?auto_4682 )
      ( !UNLOAD ?auto_4681 ?auto_4680 ?auto_4683 ?auto_4682 )
      ( !DROP ?auto_4681 ?auto_4680 ?auto_4679 ?auto_4682 )
      ( MAKE-1CRATE-VERIFY ?auto_4679 ?auto_4680 ) )
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
      ?auto_4704 - SURFACE
      ?auto_4703 - SURFACE
    )
    :vars
    (
      ?auto_4708 - HOIST
      ?auto_4706 - PLACE
      ?auto_4707 - PLACE
      ?auto_4709 - HOIST
      ?auto_4705 - SURFACE
      ?auto_4723 - PLACE
      ?auto_4719 - HOIST
      ?auto_4720 - SURFACE
      ?auto_4715 - PLACE
      ?auto_4722 - HOIST
      ?auto_4716 - SURFACE
      ?auto_4717 - PLACE
      ?auto_4718 - HOIST
      ?auto_4714 - SURFACE
      ?auto_4712 - SURFACE
      ?auto_4721 - SURFACE
      ?auto_4713 - SURFACE
      ?auto_4711 - SURFACE
      ?auto_4710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4708 ?auto_4706 ) ( IS-CRATE ?auto_4703 ) ( not ( = ?auto_4707 ?auto_4706 ) ) ( HOIST-AT ?auto_4709 ?auto_4707 ) ( AVAILABLE ?auto_4709 ) ( SURFACE-AT ?auto_4703 ?auto_4707 ) ( ON ?auto_4703 ?auto_4705 ) ( CLEAR ?auto_4703 ) ( not ( = ?auto_4704 ?auto_4703 ) ) ( not ( = ?auto_4704 ?auto_4705 ) ) ( not ( = ?auto_4703 ?auto_4705 ) ) ( not ( = ?auto_4708 ?auto_4709 ) ) ( IS-CRATE ?auto_4704 ) ( not ( = ?auto_4723 ?auto_4706 ) ) ( HOIST-AT ?auto_4719 ?auto_4723 ) ( SURFACE-AT ?auto_4704 ?auto_4723 ) ( ON ?auto_4704 ?auto_4720 ) ( CLEAR ?auto_4704 ) ( not ( = ?auto_4702 ?auto_4704 ) ) ( not ( = ?auto_4702 ?auto_4720 ) ) ( not ( = ?auto_4704 ?auto_4720 ) ) ( not ( = ?auto_4708 ?auto_4719 ) ) ( IS-CRATE ?auto_4702 ) ( not ( = ?auto_4715 ?auto_4706 ) ) ( HOIST-AT ?auto_4722 ?auto_4715 ) ( SURFACE-AT ?auto_4702 ?auto_4715 ) ( ON ?auto_4702 ?auto_4716 ) ( CLEAR ?auto_4702 ) ( not ( = ?auto_4701 ?auto_4702 ) ) ( not ( = ?auto_4701 ?auto_4716 ) ) ( not ( = ?auto_4702 ?auto_4716 ) ) ( not ( = ?auto_4708 ?auto_4722 ) ) ( IS-CRATE ?auto_4701 ) ( not ( = ?auto_4717 ?auto_4706 ) ) ( HOIST-AT ?auto_4718 ?auto_4717 ) ( SURFACE-AT ?auto_4701 ?auto_4717 ) ( ON ?auto_4701 ?auto_4714 ) ( CLEAR ?auto_4701 ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4700 ?auto_4714 ) ) ( not ( = ?auto_4701 ?auto_4714 ) ) ( not ( = ?auto_4708 ?auto_4718 ) ) ( IS-CRATE ?auto_4700 ) ( SURFACE-AT ?auto_4700 ?auto_4723 ) ( ON ?auto_4700 ?auto_4712 ) ( CLEAR ?auto_4700 ) ( not ( = ?auto_4699 ?auto_4700 ) ) ( not ( = ?auto_4699 ?auto_4712 ) ) ( not ( = ?auto_4700 ?auto_4712 ) ) ( IS-CRATE ?auto_4699 ) ( AVAILABLE ?auto_4719 ) ( SURFACE-AT ?auto_4699 ?auto_4723 ) ( ON ?auto_4699 ?auto_4721 ) ( CLEAR ?auto_4699 ) ( not ( = ?auto_4698 ?auto_4699 ) ) ( not ( = ?auto_4698 ?auto_4721 ) ) ( not ( = ?auto_4699 ?auto_4721 ) ) ( IS-CRATE ?auto_4698 ) ( AVAILABLE ?auto_4718 ) ( SURFACE-AT ?auto_4698 ?auto_4717 ) ( ON ?auto_4698 ?auto_4713 ) ( CLEAR ?auto_4698 ) ( not ( = ?auto_4697 ?auto_4698 ) ) ( not ( = ?auto_4697 ?auto_4713 ) ) ( not ( = ?auto_4698 ?auto_4713 ) ) ( SURFACE-AT ?auto_4696 ?auto_4706 ) ( CLEAR ?auto_4696 ) ( IS-CRATE ?auto_4697 ) ( AVAILABLE ?auto_4708 ) ( AVAILABLE ?auto_4722 ) ( SURFACE-AT ?auto_4697 ?auto_4715 ) ( ON ?auto_4697 ?auto_4711 ) ( CLEAR ?auto_4697 ) ( TRUCK-AT ?auto_4710 ?auto_4706 ) ( not ( = ?auto_4696 ?auto_4697 ) ) ( not ( = ?auto_4696 ?auto_4711 ) ) ( not ( = ?auto_4697 ?auto_4711 ) ) ( not ( = ?auto_4696 ?auto_4698 ) ) ( not ( = ?auto_4696 ?auto_4713 ) ) ( not ( = ?auto_4698 ?auto_4711 ) ) ( not ( = ?auto_4717 ?auto_4715 ) ) ( not ( = ?auto_4718 ?auto_4722 ) ) ( not ( = ?auto_4713 ?auto_4711 ) ) ( not ( = ?auto_4696 ?auto_4699 ) ) ( not ( = ?auto_4696 ?auto_4721 ) ) ( not ( = ?auto_4697 ?auto_4699 ) ) ( not ( = ?auto_4697 ?auto_4721 ) ) ( not ( = ?auto_4699 ?auto_4713 ) ) ( not ( = ?auto_4699 ?auto_4711 ) ) ( not ( = ?auto_4723 ?auto_4717 ) ) ( not ( = ?auto_4723 ?auto_4715 ) ) ( not ( = ?auto_4719 ?auto_4718 ) ) ( not ( = ?auto_4719 ?auto_4722 ) ) ( not ( = ?auto_4721 ?auto_4713 ) ) ( not ( = ?auto_4721 ?auto_4711 ) ) ( not ( = ?auto_4696 ?auto_4700 ) ) ( not ( = ?auto_4696 ?auto_4712 ) ) ( not ( = ?auto_4697 ?auto_4700 ) ) ( not ( = ?auto_4697 ?auto_4712 ) ) ( not ( = ?auto_4698 ?auto_4700 ) ) ( not ( = ?auto_4698 ?auto_4712 ) ) ( not ( = ?auto_4700 ?auto_4721 ) ) ( not ( = ?auto_4700 ?auto_4713 ) ) ( not ( = ?auto_4700 ?auto_4711 ) ) ( not ( = ?auto_4712 ?auto_4721 ) ) ( not ( = ?auto_4712 ?auto_4713 ) ) ( not ( = ?auto_4712 ?auto_4711 ) ) ( not ( = ?auto_4696 ?auto_4701 ) ) ( not ( = ?auto_4696 ?auto_4714 ) ) ( not ( = ?auto_4697 ?auto_4701 ) ) ( not ( = ?auto_4697 ?auto_4714 ) ) ( not ( = ?auto_4698 ?auto_4701 ) ) ( not ( = ?auto_4698 ?auto_4714 ) ) ( not ( = ?auto_4699 ?auto_4701 ) ) ( not ( = ?auto_4699 ?auto_4714 ) ) ( not ( = ?auto_4701 ?auto_4712 ) ) ( not ( = ?auto_4701 ?auto_4721 ) ) ( not ( = ?auto_4701 ?auto_4713 ) ) ( not ( = ?auto_4701 ?auto_4711 ) ) ( not ( = ?auto_4714 ?auto_4712 ) ) ( not ( = ?auto_4714 ?auto_4721 ) ) ( not ( = ?auto_4714 ?auto_4713 ) ) ( not ( = ?auto_4714 ?auto_4711 ) ) ( not ( = ?auto_4696 ?auto_4702 ) ) ( not ( = ?auto_4696 ?auto_4716 ) ) ( not ( = ?auto_4697 ?auto_4702 ) ) ( not ( = ?auto_4697 ?auto_4716 ) ) ( not ( = ?auto_4698 ?auto_4702 ) ) ( not ( = ?auto_4698 ?auto_4716 ) ) ( not ( = ?auto_4699 ?auto_4702 ) ) ( not ( = ?auto_4699 ?auto_4716 ) ) ( not ( = ?auto_4700 ?auto_4702 ) ) ( not ( = ?auto_4700 ?auto_4716 ) ) ( not ( = ?auto_4702 ?auto_4714 ) ) ( not ( = ?auto_4702 ?auto_4712 ) ) ( not ( = ?auto_4702 ?auto_4721 ) ) ( not ( = ?auto_4702 ?auto_4713 ) ) ( not ( = ?auto_4702 ?auto_4711 ) ) ( not ( = ?auto_4716 ?auto_4714 ) ) ( not ( = ?auto_4716 ?auto_4712 ) ) ( not ( = ?auto_4716 ?auto_4721 ) ) ( not ( = ?auto_4716 ?auto_4713 ) ) ( not ( = ?auto_4716 ?auto_4711 ) ) ( not ( = ?auto_4696 ?auto_4704 ) ) ( not ( = ?auto_4696 ?auto_4720 ) ) ( not ( = ?auto_4697 ?auto_4704 ) ) ( not ( = ?auto_4697 ?auto_4720 ) ) ( not ( = ?auto_4698 ?auto_4704 ) ) ( not ( = ?auto_4698 ?auto_4720 ) ) ( not ( = ?auto_4699 ?auto_4704 ) ) ( not ( = ?auto_4699 ?auto_4720 ) ) ( not ( = ?auto_4700 ?auto_4704 ) ) ( not ( = ?auto_4700 ?auto_4720 ) ) ( not ( = ?auto_4701 ?auto_4704 ) ) ( not ( = ?auto_4701 ?auto_4720 ) ) ( not ( = ?auto_4704 ?auto_4716 ) ) ( not ( = ?auto_4704 ?auto_4714 ) ) ( not ( = ?auto_4704 ?auto_4712 ) ) ( not ( = ?auto_4704 ?auto_4721 ) ) ( not ( = ?auto_4704 ?auto_4713 ) ) ( not ( = ?auto_4704 ?auto_4711 ) ) ( not ( = ?auto_4720 ?auto_4716 ) ) ( not ( = ?auto_4720 ?auto_4714 ) ) ( not ( = ?auto_4720 ?auto_4712 ) ) ( not ( = ?auto_4720 ?auto_4721 ) ) ( not ( = ?auto_4720 ?auto_4713 ) ) ( not ( = ?auto_4720 ?auto_4711 ) ) ( not ( = ?auto_4696 ?auto_4703 ) ) ( not ( = ?auto_4696 ?auto_4705 ) ) ( not ( = ?auto_4697 ?auto_4703 ) ) ( not ( = ?auto_4697 ?auto_4705 ) ) ( not ( = ?auto_4698 ?auto_4703 ) ) ( not ( = ?auto_4698 ?auto_4705 ) ) ( not ( = ?auto_4699 ?auto_4703 ) ) ( not ( = ?auto_4699 ?auto_4705 ) ) ( not ( = ?auto_4700 ?auto_4703 ) ) ( not ( = ?auto_4700 ?auto_4705 ) ) ( not ( = ?auto_4701 ?auto_4703 ) ) ( not ( = ?auto_4701 ?auto_4705 ) ) ( not ( = ?auto_4702 ?auto_4703 ) ) ( not ( = ?auto_4702 ?auto_4705 ) ) ( not ( = ?auto_4703 ?auto_4720 ) ) ( not ( = ?auto_4703 ?auto_4716 ) ) ( not ( = ?auto_4703 ?auto_4714 ) ) ( not ( = ?auto_4703 ?auto_4712 ) ) ( not ( = ?auto_4703 ?auto_4721 ) ) ( not ( = ?auto_4703 ?auto_4713 ) ) ( not ( = ?auto_4703 ?auto_4711 ) ) ( not ( = ?auto_4707 ?auto_4723 ) ) ( not ( = ?auto_4707 ?auto_4715 ) ) ( not ( = ?auto_4707 ?auto_4717 ) ) ( not ( = ?auto_4709 ?auto_4719 ) ) ( not ( = ?auto_4709 ?auto_4722 ) ) ( not ( = ?auto_4709 ?auto_4718 ) ) ( not ( = ?auto_4705 ?auto_4720 ) ) ( not ( = ?auto_4705 ?auto_4716 ) ) ( not ( = ?auto_4705 ?auto_4714 ) ) ( not ( = ?auto_4705 ?auto_4712 ) ) ( not ( = ?auto_4705 ?auto_4721 ) ) ( not ( = ?auto_4705 ?auto_4713 ) ) ( not ( = ?auto_4705 ?auto_4711 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4696 ?auto_4697 ?auto_4698 ?auto_4699 ?auto_4700 ?auto_4701 ?auto_4702 ?auto_4704 )
      ( MAKE-1CRATE ?auto_4704 ?auto_4703 )
      ( MAKE-8CRATE-VERIFY ?auto_4696 ?auto_4697 ?auto_4698 ?auto_4699 ?auto_4700 ?auto_4701 ?auto_4702 ?auto_4704 ?auto_4703 ) )
  )

)

