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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_500 - SURFACE
      ?auto_501 - SURFACE
    )
    :vars
    (
      ?auto_502 - HOIST
      ?auto_503 - PLACE
      ?auto_505 - PLACE
      ?auto_506 - HOIST
      ?auto_507 - SURFACE
      ?auto_504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_502 ?auto_503 ) ( SURFACE-AT ?auto_500 ?auto_503 ) ( CLEAR ?auto_500 ) ( IS-CRATE ?auto_501 ) ( AVAILABLE ?auto_502 ) ( not ( = ?auto_505 ?auto_503 ) ) ( HOIST-AT ?auto_506 ?auto_505 ) ( AVAILABLE ?auto_506 ) ( SURFACE-AT ?auto_501 ?auto_505 ) ( ON ?auto_501 ?auto_507 ) ( CLEAR ?auto_501 ) ( TRUCK-AT ?auto_504 ?auto_503 ) ( not ( = ?auto_500 ?auto_501 ) ) ( not ( = ?auto_500 ?auto_507 ) ) ( not ( = ?auto_501 ?auto_507 ) ) ( not ( = ?auto_502 ?auto_506 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_504 ?auto_503 ?auto_505 )
      ( !LIFT ?auto_506 ?auto_501 ?auto_507 ?auto_505 )
      ( !LOAD ?auto_506 ?auto_501 ?auto_504 ?auto_505 )
      ( !DRIVE ?auto_504 ?auto_505 ?auto_503 )
      ( !UNLOAD ?auto_502 ?auto_501 ?auto_504 ?auto_503 )
      ( !DROP ?auto_502 ?auto_501 ?auto_500 ?auto_503 )
      ( MAKE-1CRATE-VERIFY ?auto_500 ?auto_501 ) )
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
      ?auto_516 - HOIST
      ?auto_519 - PLACE
      ?auto_515 - PLACE
      ?auto_517 - HOIST
      ?auto_518 - SURFACE
      ?auto_520 - PLACE
      ?auto_521 - HOIST
      ?auto_522 - SURFACE
      ?auto_514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_516 ?auto_519 ) ( IS-CRATE ?auto_513 ) ( not ( = ?auto_515 ?auto_519 ) ) ( HOIST-AT ?auto_517 ?auto_515 ) ( AVAILABLE ?auto_517 ) ( SURFACE-AT ?auto_513 ?auto_515 ) ( ON ?auto_513 ?auto_518 ) ( CLEAR ?auto_513 ) ( not ( = ?auto_512 ?auto_513 ) ) ( not ( = ?auto_512 ?auto_518 ) ) ( not ( = ?auto_513 ?auto_518 ) ) ( not ( = ?auto_516 ?auto_517 ) ) ( SURFACE-AT ?auto_511 ?auto_519 ) ( CLEAR ?auto_511 ) ( IS-CRATE ?auto_512 ) ( AVAILABLE ?auto_516 ) ( not ( = ?auto_520 ?auto_519 ) ) ( HOIST-AT ?auto_521 ?auto_520 ) ( AVAILABLE ?auto_521 ) ( SURFACE-AT ?auto_512 ?auto_520 ) ( ON ?auto_512 ?auto_522 ) ( CLEAR ?auto_512 ) ( TRUCK-AT ?auto_514 ?auto_519 ) ( not ( = ?auto_511 ?auto_512 ) ) ( not ( = ?auto_511 ?auto_522 ) ) ( not ( = ?auto_512 ?auto_522 ) ) ( not ( = ?auto_516 ?auto_521 ) ) ( not ( = ?auto_511 ?auto_513 ) ) ( not ( = ?auto_511 ?auto_518 ) ) ( not ( = ?auto_513 ?auto_522 ) ) ( not ( = ?auto_515 ?auto_520 ) ) ( not ( = ?auto_517 ?auto_521 ) ) ( not ( = ?auto_518 ?auto_522 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_511 ?auto_512 )
      ( MAKE-1CRATE ?auto_512 ?auto_513 )
      ( MAKE-2CRATE-VERIFY ?auto_511 ?auto_512 ?auto_513 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_525 - SURFACE
      ?auto_526 - SURFACE
    )
    :vars
    (
      ?auto_527 - HOIST
      ?auto_528 - PLACE
      ?auto_530 - PLACE
      ?auto_531 - HOIST
      ?auto_532 - SURFACE
      ?auto_529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_527 ?auto_528 ) ( SURFACE-AT ?auto_525 ?auto_528 ) ( CLEAR ?auto_525 ) ( IS-CRATE ?auto_526 ) ( AVAILABLE ?auto_527 ) ( not ( = ?auto_530 ?auto_528 ) ) ( HOIST-AT ?auto_531 ?auto_530 ) ( AVAILABLE ?auto_531 ) ( SURFACE-AT ?auto_526 ?auto_530 ) ( ON ?auto_526 ?auto_532 ) ( CLEAR ?auto_526 ) ( TRUCK-AT ?auto_529 ?auto_528 ) ( not ( = ?auto_525 ?auto_526 ) ) ( not ( = ?auto_525 ?auto_532 ) ) ( not ( = ?auto_526 ?auto_532 ) ) ( not ( = ?auto_527 ?auto_531 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_529 ?auto_528 ?auto_530 )
      ( !LIFT ?auto_531 ?auto_526 ?auto_532 ?auto_530 )
      ( !LOAD ?auto_531 ?auto_526 ?auto_529 ?auto_530 )
      ( !DRIVE ?auto_529 ?auto_530 ?auto_528 )
      ( !UNLOAD ?auto_527 ?auto_526 ?auto_529 ?auto_528 )
      ( !DROP ?auto_527 ?auto_526 ?auto_525 ?auto_528 )
      ( MAKE-1CRATE-VERIFY ?auto_525 ?auto_526 ) )
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
      ?auto_545 - PLACE
      ?auto_544 - PLACE
      ?auto_541 - HOIST
      ?auto_542 - SURFACE
      ?auto_552 - PLACE
      ?auto_549 - HOIST
      ?auto_550 - SURFACE
      ?auto_547 - PLACE
      ?auto_551 - HOIST
      ?auto_548 - SURFACE
      ?auto_546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_543 ?auto_545 ) ( IS-CRATE ?auto_540 ) ( not ( = ?auto_544 ?auto_545 ) ) ( HOIST-AT ?auto_541 ?auto_544 ) ( AVAILABLE ?auto_541 ) ( SURFACE-AT ?auto_540 ?auto_544 ) ( ON ?auto_540 ?auto_542 ) ( CLEAR ?auto_540 ) ( not ( = ?auto_539 ?auto_540 ) ) ( not ( = ?auto_539 ?auto_542 ) ) ( not ( = ?auto_540 ?auto_542 ) ) ( not ( = ?auto_543 ?auto_541 ) ) ( IS-CRATE ?auto_539 ) ( not ( = ?auto_552 ?auto_545 ) ) ( HOIST-AT ?auto_549 ?auto_552 ) ( AVAILABLE ?auto_549 ) ( SURFACE-AT ?auto_539 ?auto_552 ) ( ON ?auto_539 ?auto_550 ) ( CLEAR ?auto_539 ) ( not ( = ?auto_538 ?auto_539 ) ) ( not ( = ?auto_538 ?auto_550 ) ) ( not ( = ?auto_539 ?auto_550 ) ) ( not ( = ?auto_543 ?auto_549 ) ) ( SURFACE-AT ?auto_537 ?auto_545 ) ( CLEAR ?auto_537 ) ( IS-CRATE ?auto_538 ) ( AVAILABLE ?auto_543 ) ( not ( = ?auto_547 ?auto_545 ) ) ( HOIST-AT ?auto_551 ?auto_547 ) ( AVAILABLE ?auto_551 ) ( SURFACE-AT ?auto_538 ?auto_547 ) ( ON ?auto_538 ?auto_548 ) ( CLEAR ?auto_538 ) ( TRUCK-AT ?auto_546 ?auto_545 ) ( not ( = ?auto_537 ?auto_538 ) ) ( not ( = ?auto_537 ?auto_548 ) ) ( not ( = ?auto_538 ?auto_548 ) ) ( not ( = ?auto_543 ?auto_551 ) ) ( not ( = ?auto_537 ?auto_539 ) ) ( not ( = ?auto_537 ?auto_550 ) ) ( not ( = ?auto_539 ?auto_548 ) ) ( not ( = ?auto_552 ?auto_547 ) ) ( not ( = ?auto_549 ?auto_551 ) ) ( not ( = ?auto_550 ?auto_548 ) ) ( not ( = ?auto_537 ?auto_540 ) ) ( not ( = ?auto_537 ?auto_542 ) ) ( not ( = ?auto_538 ?auto_540 ) ) ( not ( = ?auto_538 ?auto_542 ) ) ( not ( = ?auto_540 ?auto_550 ) ) ( not ( = ?auto_540 ?auto_548 ) ) ( not ( = ?auto_544 ?auto_552 ) ) ( not ( = ?auto_544 ?auto_547 ) ) ( not ( = ?auto_541 ?auto_549 ) ) ( not ( = ?auto_541 ?auto_551 ) ) ( not ( = ?auto_542 ?auto_550 ) ) ( not ( = ?auto_542 ?auto_548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_537 ?auto_538 ?auto_539 )
      ( MAKE-1CRATE ?auto_539 ?auto_540 )
      ( MAKE-3CRATE-VERIFY ?auto_537 ?auto_538 ?auto_539 ?auto_540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_555 - SURFACE
      ?auto_556 - SURFACE
    )
    :vars
    (
      ?auto_557 - HOIST
      ?auto_558 - PLACE
      ?auto_560 - PLACE
      ?auto_561 - HOIST
      ?auto_562 - SURFACE
      ?auto_559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_557 ?auto_558 ) ( SURFACE-AT ?auto_555 ?auto_558 ) ( CLEAR ?auto_555 ) ( IS-CRATE ?auto_556 ) ( AVAILABLE ?auto_557 ) ( not ( = ?auto_560 ?auto_558 ) ) ( HOIST-AT ?auto_561 ?auto_560 ) ( AVAILABLE ?auto_561 ) ( SURFACE-AT ?auto_556 ?auto_560 ) ( ON ?auto_556 ?auto_562 ) ( CLEAR ?auto_556 ) ( TRUCK-AT ?auto_559 ?auto_558 ) ( not ( = ?auto_555 ?auto_556 ) ) ( not ( = ?auto_555 ?auto_562 ) ) ( not ( = ?auto_556 ?auto_562 ) ) ( not ( = ?auto_557 ?auto_561 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_559 ?auto_558 ?auto_560 )
      ( !LIFT ?auto_561 ?auto_556 ?auto_562 ?auto_560 )
      ( !LOAD ?auto_561 ?auto_556 ?auto_559 ?auto_560 )
      ( !DRIVE ?auto_559 ?auto_560 ?auto_558 )
      ( !UNLOAD ?auto_557 ?auto_556 ?auto_559 ?auto_558 )
      ( !DROP ?auto_557 ?auto_556 ?auto_555 ?auto_558 )
      ( MAKE-1CRATE-VERIFY ?auto_555 ?auto_556 ) )
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
      ?auto_573 - HOIST
      ?auto_576 - PLACE
      ?auto_577 - PLACE
      ?auto_575 - HOIST
      ?auto_574 - SURFACE
      ?auto_579 - PLACE
      ?auto_580 - HOIST
      ?auto_584 - SURFACE
      ?auto_581 - PLACE
      ?auto_582 - HOIST
      ?auto_583 - SURFACE
      ?auto_585 - SURFACE
      ?auto_578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_573 ?auto_576 ) ( IS-CRATE ?auto_572 ) ( not ( = ?auto_577 ?auto_576 ) ) ( HOIST-AT ?auto_575 ?auto_577 ) ( SURFACE-AT ?auto_572 ?auto_577 ) ( ON ?auto_572 ?auto_574 ) ( CLEAR ?auto_572 ) ( not ( = ?auto_571 ?auto_572 ) ) ( not ( = ?auto_571 ?auto_574 ) ) ( not ( = ?auto_572 ?auto_574 ) ) ( not ( = ?auto_573 ?auto_575 ) ) ( IS-CRATE ?auto_571 ) ( not ( = ?auto_579 ?auto_576 ) ) ( HOIST-AT ?auto_580 ?auto_579 ) ( AVAILABLE ?auto_580 ) ( SURFACE-AT ?auto_571 ?auto_579 ) ( ON ?auto_571 ?auto_584 ) ( CLEAR ?auto_571 ) ( not ( = ?auto_570 ?auto_571 ) ) ( not ( = ?auto_570 ?auto_584 ) ) ( not ( = ?auto_571 ?auto_584 ) ) ( not ( = ?auto_573 ?auto_580 ) ) ( IS-CRATE ?auto_570 ) ( not ( = ?auto_581 ?auto_576 ) ) ( HOIST-AT ?auto_582 ?auto_581 ) ( AVAILABLE ?auto_582 ) ( SURFACE-AT ?auto_570 ?auto_581 ) ( ON ?auto_570 ?auto_583 ) ( CLEAR ?auto_570 ) ( not ( = ?auto_569 ?auto_570 ) ) ( not ( = ?auto_569 ?auto_583 ) ) ( not ( = ?auto_570 ?auto_583 ) ) ( not ( = ?auto_573 ?auto_582 ) ) ( SURFACE-AT ?auto_568 ?auto_576 ) ( CLEAR ?auto_568 ) ( IS-CRATE ?auto_569 ) ( AVAILABLE ?auto_573 ) ( AVAILABLE ?auto_575 ) ( SURFACE-AT ?auto_569 ?auto_577 ) ( ON ?auto_569 ?auto_585 ) ( CLEAR ?auto_569 ) ( TRUCK-AT ?auto_578 ?auto_576 ) ( not ( = ?auto_568 ?auto_569 ) ) ( not ( = ?auto_568 ?auto_585 ) ) ( not ( = ?auto_569 ?auto_585 ) ) ( not ( = ?auto_568 ?auto_570 ) ) ( not ( = ?auto_568 ?auto_583 ) ) ( not ( = ?auto_570 ?auto_585 ) ) ( not ( = ?auto_581 ?auto_577 ) ) ( not ( = ?auto_582 ?auto_575 ) ) ( not ( = ?auto_583 ?auto_585 ) ) ( not ( = ?auto_568 ?auto_571 ) ) ( not ( = ?auto_568 ?auto_584 ) ) ( not ( = ?auto_569 ?auto_571 ) ) ( not ( = ?auto_569 ?auto_584 ) ) ( not ( = ?auto_571 ?auto_583 ) ) ( not ( = ?auto_571 ?auto_585 ) ) ( not ( = ?auto_579 ?auto_581 ) ) ( not ( = ?auto_579 ?auto_577 ) ) ( not ( = ?auto_580 ?auto_582 ) ) ( not ( = ?auto_580 ?auto_575 ) ) ( not ( = ?auto_584 ?auto_583 ) ) ( not ( = ?auto_584 ?auto_585 ) ) ( not ( = ?auto_568 ?auto_572 ) ) ( not ( = ?auto_568 ?auto_574 ) ) ( not ( = ?auto_569 ?auto_572 ) ) ( not ( = ?auto_569 ?auto_574 ) ) ( not ( = ?auto_570 ?auto_572 ) ) ( not ( = ?auto_570 ?auto_574 ) ) ( not ( = ?auto_572 ?auto_584 ) ) ( not ( = ?auto_572 ?auto_583 ) ) ( not ( = ?auto_572 ?auto_585 ) ) ( not ( = ?auto_574 ?auto_584 ) ) ( not ( = ?auto_574 ?auto_583 ) ) ( not ( = ?auto_574 ?auto_585 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_568 ?auto_569 ?auto_570 ?auto_571 )
      ( MAKE-1CRATE ?auto_571 ?auto_572 )
      ( MAKE-4CRATE-VERIFY ?auto_568 ?auto_569 ?auto_570 ?auto_571 ?auto_572 ) )
  )

)

