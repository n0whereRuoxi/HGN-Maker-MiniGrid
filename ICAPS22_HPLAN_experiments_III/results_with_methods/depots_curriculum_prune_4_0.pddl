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
      ?auto_490 - SURFACE
      ?auto_491 - SURFACE
    )
    :vars
    (
      ?auto_492 - HOIST
      ?auto_493 - PLACE
      ?auto_495 - PLACE
      ?auto_496 - HOIST
      ?auto_497 - SURFACE
      ?auto_494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_492 ?auto_493 ) ( SURFACE-AT ?auto_490 ?auto_493 ) ( CLEAR ?auto_490 ) ( IS-CRATE ?auto_491 ) ( AVAILABLE ?auto_492 ) ( not ( = ?auto_495 ?auto_493 ) ) ( HOIST-AT ?auto_496 ?auto_495 ) ( AVAILABLE ?auto_496 ) ( SURFACE-AT ?auto_491 ?auto_495 ) ( ON ?auto_491 ?auto_497 ) ( CLEAR ?auto_491 ) ( TRUCK-AT ?auto_494 ?auto_493 ) ( not ( = ?auto_490 ?auto_491 ) ) ( not ( = ?auto_490 ?auto_497 ) ) ( not ( = ?auto_491 ?auto_497 ) ) ( not ( = ?auto_492 ?auto_496 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_494 ?auto_493 ?auto_495 )
      ( !LIFT ?auto_496 ?auto_491 ?auto_497 ?auto_495 )
      ( !LOAD ?auto_496 ?auto_491 ?auto_494 ?auto_495 )
      ( !DRIVE ?auto_494 ?auto_495 ?auto_493 )
      ( !UNLOAD ?auto_492 ?auto_491 ?auto_494 ?auto_493 )
      ( !DROP ?auto_492 ?auto_491 ?auto_490 ?auto_493 )
      ( MAKE-1CRATE-VERIFY ?auto_490 ?auto_491 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_511 - SURFACE
      ?auto_512 - SURFACE
      ?auto_513 - SURFACE
    )
    :vars
    (
      ?auto_515 - HOIST
      ?auto_516 - PLACE
      ?auto_514 - PLACE
      ?auto_517 - HOIST
      ?auto_519 - SURFACE
      ?auto_522 - PLACE
      ?auto_521 - HOIST
      ?auto_520 - SURFACE
      ?auto_518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_515 ?auto_516 ) ( IS-CRATE ?auto_513 ) ( not ( = ?auto_514 ?auto_516 ) ) ( HOIST-AT ?auto_517 ?auto_514 ) ( AVAILABLE ?auto_517 ) ( SURFACE-AT ?auto_513 ?auto_514 ) ( ON ?auto_513 ?auto_519 ) ( CLEAR ?auto_513 ) ( not ( = ?auto_512 ?auto_513 ) ) ( not ( = ?auto_512 ?auto_519 ) ) ( not ( = ?auto_513 ?auto_519 ) ) ( not ( = ?auto_515 ?auto_517 ) ) ( SURFACE-AT ?auto_511 ?auto_516 ) ( CLEAR ?auto_511 ) ( IS-CRATE ?auto_512 ) ( AVAILABLE ?auto_515 ) ( not ( = ?auto_522 ?auto_516 ) ) ( HOIST-AT ?auto_521 ?auto_522 ) ( AVAILABLE ?auto_521 ) ( SURFACE-AT ?auto_512 ?auto_522 ) ( ON ?auto_512 ?auto_520 ) ( CLEAR ?auto_512 ) ( TRUCK-AT ?auto_518 ?auto_516 ) ( not ( = ?auto_511 ?auto_512 ) ) ( not ( = ?auto_511 ?auto_520 ) ) ( not ( = ?auto_512 ?auto_520 ) ) ( not ( = ?auto_515 ?auto_521 ) ) ( not ( = ?auto_511 ?auto_513 ) ) ( not ( = ?auto_511 ?auto_519 ) ) ( not ( = ?auto_513 ?auto_520 ) ) ( not ( = ?auto_514 ?auto_522 ) ) ( not ( = ?auto_517 ?auto_521 ) ) ( not ( = ?auto_519 ?auto_520 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_511 ?auto_512 )
      ( MAKE-1CRATE ?auto_512 ?auto_513 )
      ( MAKE-2CRATE-VERIFY ?auto_511 ?auto_512 ?auto_513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_537 - SURFACE
      ?auto_538 - SURFACE
      ?auto_539 - SURFACE
      ?auto_540 - SURFACE
    )
    :vars
    (
      ?auto_543 - HOIST
      ?auto_546 - PLACE
      ?auto_544 - PLACE
      ?auto_541 - HOIST
      ?auto_542 - SURFACE
      ?auto_548 - PLACE
      ?auto_552 - HOIST
      ?auto_549 - SURFACE
      ?auto_551 - PLACE
      ?auto_547 - HOIST
      ?auto_550 - SURFACE
      ?auto_545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_543 ?auto_546 ) ( IS-CRATE ?auto_540 ) ( not ( = ?auto_544 ?auto_546 ) ) ( HOIST-AT ?auto_541 ?auto_544 ) ( AVAILABLE ?auto_541 ) ( SURFACE-AT ?auto_540 ?auto_544 ) ( ON ?auto_540 ?auto_542 ) ( CLEAR ?auto_540 ) ( not ( = ?auto_539 ?auto_540 ) ) ( not ( = ?auto_539 ?auto_542 ) ) ( not ( = ?auto_540 ?auto_542 ) ) ( not ( = ?auto_543 ?auto_541 ) ) ( IS-CRATE ?auto_539 ) ( not ( = ?auto_548 ?auto_546 ) ) ( HOIST-AT ?auto_552 ?auto_548 ) ( AVAILABLE ?auto_552 ) ( SURFACE-AT ?auto_539 ?auto_548 ) ( ON ?auto_539 ?auto_549 ) ( CLEAR ?auto_539 ) ( not ( = ?auto_538 ?auto_539 ) ) ( not ( = ?auto_538 ?auto_549 ) ) ( not ( = ?auto_539 ?auto_549 ) ) ( not ( = ?auto_543 ?auto_552 ) ) ( SURFACE-AT ?auto_537 ?auto_546 ) ( CLEAR ?auto_537 ) ( IS-CRATE ?auto_538 ) ( AVAILABLE ?auto_543 ) ( not ( = ?auto_551 ?auto_546 ) ) ( HOIST-AT ?auto_547 ?auto_551 ) ( AVAILABLE ?auto_547 ) ( SURFACE-AT ?auto_538 ?auto_551 ) ( ON ?auto_538 ?auto_550 ) ( CLEAR ?auto_538 ) ( TRUCK-AT ?auto_545 ?auto_546 ) ( not ( = ?auto_537 ?auto_538 ) ) ( not ( = ?auto_537 ?auto_550 ) ) ( not ( = ?auto_538 ?auto_550 ) ) ( not ( = ?auto_543 ?auto_547 ) ) ( not ( = ?auto_537 ?auto_539 ) ) ( not ( = ?auto_537 ?auto_549 ) ) ( not ( = ?auto_539 ?auto_550 ) ) ( not ( = ?auto_548 ?auto_551 ) ) ( not ( = ?auto_552 ?auto_547 ) ) ( not ( = ?auto_549 ?auto_550 ) ) ( not ( = ?auto_537 ?auto_540 ) ) ( not ( = ?auto_537 ?auto_542 ) ) ( not ( = ?auto_538 ?auto_540 ) ) ( not ( = ?auto_538 ?auto_542 ) ) ( not ( = ?auto_540 ?auto_549 ) ) ( not ( = ?auto_540 ?auto_550 ) ) ( not ( = ?auto_544 ?auto_548 ) ) ( not ( = ?auto_544 ?auto_551 ) ) ( not ( = ?auto_541 ?auto_552 ) ) ( not ( = ?auto_541 ?auto_547 ) ) ( not ( = ?auto_542 ?auto_549 ) ) ( not ( = ?auto_542 ?auto_550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537 ?auto_538 ?auto_539 )
      ( MAKE-1CRATE ?auto_539 ?auto_540 )
      ( MAKE-3CRATE-VERIFY ?auto_537 ?auto_538 ?auto_539 ?auto_540 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_568 - SURFACE
      ?auto_569 - SURFACE
      ?auto_570 - SURFACE
      ?auto_571 - SURFACE
      ?auto_572 - SURFACE
    )
    :vars
    (
      ?auto_575 - HOIST
      ?auto_578 - PLACE
      ?auto_577 - PLACE
      ?auto_573 - HOIST
      ?auto_576 - SURFACE
      ?auto_580 - PLACE
      ?auto_579 - HOIST
      ?auto_581 - SURFACE
      ?auto_585 - PLACE
      ?auto_582 - HOIST
      ?auto_583 - SURFACE
      ?auto_584 - SURFACE
      ?auto_574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_575 ?auto_578 ) ( IS-CRATE ?auto_572 ) ( not ( = ?auto_577 ?auto_578 ) ) ( HOIST-AT ?auto_573 ?auto_577 ) ( SURFACE-AT ?auto_572 ?auto_577 ) ( ON ?auto_572 ?auto_576 ) ( CLEAR ?auto_572 ) ( not ( = ?auto_571 ?auto_572 ) ) ( not ( = ?auto_571 ?auto_576 ) ) ( not ( = ?auto_572 ?auto_576 ) ) ( not ( = ?auto_575 ?auto_573 ) ) ( IS-CRATE ?auto_571 ) ( not ( = ?auto_580 ?auto_578 ) ) ( HOIST-AT ?auto_579 ?auto_580 ) ( AVAILABLE ?auto_579 ) ( SURFACE-AT ?auto_571 ?auto_580 ) ( ON ?auto_571 ?auto_581 ) ( CLEAR ?auto_571 ) ( not ( = ?auto_570 ?auto_571 ) ) ( not ( = ?auto_570 ?auto_581 ) ) ( not ( = ?auto_571 ?auto_581 ) ) ( not ( = ?auto_575 ?auto_579 ) ) ( IS-CRATE ?auto_570 ) ( not ( = ?auto_585 ?auto_578 ) ) ( HOIST-AT ?auto_582 ?auto_585 ) ( AVAILABLE ?auto_582 ) ( SURFACE-AT ?auto_570 ?auto_585 ) ( ON ?auto_570 ?auto_583 ) ( CLEAR ?auto_570 ) ( not ( = ?auto_569 ?auto_570 ) ) ( not ( = ?auto_569 ?auto_583 ) ) ( not ( = ?auto_570 ?auto_583 ) ) ( not ( = ?auto_575 ?auto_582 ) ) ( SURFACE-AT ?auto_568 ?auto_578 ) ( CLEAR ?auto_568 ) ( IS-CRATE ?auto_569 ) ( AVAILABLE ?auto_575 ) ( AVAILABLE ?auto_573 ) ( SURFACE-AT ?auto_569 ?auto_577 ) ( ON ?auto_569 ?auto_584 ) ( CLEAR ?auto_569 ) ( TRUCK-AT ?auto_574 ?auto_578 ) ( not ( = ?auto_568 ?auto_569 ) ) ( not ( = ?auto_568 ?auto_584 ) ) ( not ( = ?auto_569 ?auto_584 ) ) ( not ( = ?auto_568 ?auto_570 ) ) ( not ( = ?auto_568 ?auto_583 ) ) ( not ( = ?auto_570 ?auto_584 ) ) ( not ( = ?auto_585 ?auto_577 ) ) ( not ( = ?auto_582 ?auto_573 ) ) ( not ( = ?auto_583 ?auto_584 ) ) ( not ( = ?auto_568 ?auto_571 ) ) ( not ( = ?auto_568 ?auto_581 ) ) ( not ( = ?auto_569 ?auto_571 ) ) ( not ( = ?auto_569 ?auto_581 ) ) ( not ( = ?auto_571 ?auto_583 ) ) ( not ( = ?auto_571 ?auto_584 ) ) ( not ( = ?auto_580 ?auto_585 ) ) ( not ( = ?auto_580 ?auto_577 ) ) ( not ( = ?auto_579 ?auto_582 ) ) ( not ( = ?auto_579 ?auto_573 ) ) ( not ( = ?auto_581 ?auto_583 ) ) ( not ( = ?auto_581 ?auto_584 ) ) ( not ( = ?auto_568 ?auto_572 ) ) ( not ( = ?auto_568 ?auto_576 ) ) ( not ( = ?auto_569 ?auto_572 ) ) ( not ( = ?auto_569 ?auto_576 ) ) ( not ( = ?auto_570 ?auto_572 ) ) ( not ( = ?auto_570 ?auto_576 ) ) ( not ( = ?auto_572 ?auto_581 ) ) ( not ( = ?auto_572 ?auto_583 ) ) ( not ( = ?auto_572 ?auto_584 ) ) ( not ( = ?auto_576 ?auto_581 ) ) ( not ( = ?auto_576 ?auto_583 ) ) ( not ( = ?auto_576 ?auto_584 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_568 ?auto_569 ?auto_570 ?auto_571 )
      ( MAKE-1CRATE ?auto_571 ?auto_572 )
      ( MAKE-4CRATE-VERIFY ?auto_568 ?auto_569 ?auto_570 ?auto_571 ?auto_572 ) )
  )

)

