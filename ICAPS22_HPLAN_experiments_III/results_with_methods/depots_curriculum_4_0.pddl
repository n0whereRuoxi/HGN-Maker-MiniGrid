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
      ?auto_482 - SURFACE
      ?auto_483 - SURFACE
    )
    :vars
    (
      ?auto_484 - HOIST
      ?auto_485 - PLACE
      ?auto_487 - PLACE
      ?auto_488 - HOIST
      ?auto_489 - SURFACE
      ?auto_486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484 ?auto_485 ) ( SURFACE-AT ?auto_482 ?auto_485 ) ( CLEAR ?auto_482 ) ( IS-CRATE ?auto_483 ) ( AVAILABLE ?auto_484 ) ( not ( = ?auto_487 ?auto_485 ) ) ( HOIST-AT ?auto_488 ?auto_487 ) ( AVAILABLE ?auto_488 ) ( SURFACE-AT ?auto_483 ?auto_487 ) ( ON ?auto_483 ?auto_489 ) ( CLEAR ?auto_483 ) ( TRUCK-AT ?auto_486 ?auto_485 ) ( not ( = ?auto_482 ?auto_483 ) ) ( not ( = ?auto_482 ?auto_489 ) ) ( not ( = ?auto_483 ?auto_489 ) ) ( not ( = ?auto_484 ?auto_488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_486 ?auto_485 ?auto_487 )
      ( !LIFT ?auto_488 ?auto_483 ?auto_489 ?auto_487 )
      ( !LOAD ?auto_488 ?auto_483 ?auto_486 ?auto_487 )
      ( !DRIVE ?auto_486 ?auto_487 ?auto_485 )
      ( !UNLOAD ?auto_484 ?auto_483 ?auto_486 ?auto_485 )
      ( !DROP ?auto_484 ?auto_483 ?auto_482 ?auto_485 )
      ( MAKE-1CRATE-VERIFY ?auto_482 ?auto_483 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_492 - SURFACE
      ?auto_493 - SURFACE
    )
    :vars
    (
      ?auto_494 - HOIST
      ?auto_495 - PLACE
      ?auto_497 - PLACE
      ?auto_498 - HOIST
      ?auto_499 - SURFACE
      ?auto_496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_494 ?auto_495 ) ( SURFACE-AT ?auto_492 ?auto_495 ) ( CLEAR ?auto_492 ) ( IS-CRATE ?auto_493 ) ( AVAILABLE ?auto_494 ) ( not ( = ?auto_497 ?auto_495 ) ) ( HOIST-AT ?auto_498 ?auto_497 ) ( AVAILABLE ?auto_498 ) ( SURFACE-AT ?auto_493 ?auto_497 ) ( ON ?auto_493 ?auto_499 ) ( CLEAR ?auto_493 ) ( TRUCK-AT ?auto_496 ?auto_495 ) ( not ( = ?auto_492 ?auto_493 ) ) ( not ( = ?auto_492 ?auto_499 ) ) ( not ( = ?auto_493 ?auto_499 ) ) ( not ( = ?auto_494 ?auto_498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_496 ?auto_495 ?auto_497 )
      ( !LIFT ?auto_498 ?auto_493 ?auto_499 ?auto_497 )
      ( !LOAD ?auto_498 ?auto_493 ?auto_496 ?auto_497 )
      ( !DRIVE ?auto_496 ?auto_497 ?auto_495 )
      ( !UNLOAD ?auto_494 ?auto_493 ?auto_496 ?auto_495 )
      ( !DROP ?auto_494 ?auto_493 ?auto_492 ?auto_495 )
      ( MAKE-1CRATE-VERIFY ?auto_492 ?auto_493 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_503 - SURFACE
      ?auto_504 - SURFACE
      ?auto_505 - SURFACE
    )
    :vars
    (
      ?auto_507 - HOIST
      ?auto_511 - PLACE
      ?auto_506 - PLACE
      ?auto_508 - HOIST
      ?auto_510 - SURFACE
      ?auto_512 - PLACE
      ?auto_513 - HOIST
      ?auto_514 - SURFACE
      ?auto_509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507 ?auto_511 ) ( IS-CRATE ?auto_505 ) ( not ( = ?auto_506 ?auto_511 ) ) ( HOIST-AT ?auto_508 ?auto_506 ) ( AVAILABLE ?auto_508 ) ( SURFACE-AT ?auto_505 ?auto_506 ) ( ON ?auto_505 ?auto_510 ) ( CLEAR ?auto_505 ) ( not ( = ?auto_504 ?auto_505 ) ) ( not ( = ?auto_504 ?auto_510 ) ) ( not ( = ?auto_505 ?auto_510 ) ) ( not ( = ?auto_507 ?auto_508 ) ) ( SURFACE-AT ?auto_503 ?auto_511 ) ( CLEAR ?auto_503 ) ( IS-CRATE ?auto_504 ) ( AVAILABLE ?auto_507 ) ( not ( = ?auto_512 ?auto_511 ) ) ( HOIST-AT ?auto_513 ?auto_512 ) ( AVAILABLE ?auto_513 ) ( SURFACE-AT ?auto_504 ?auto_512 ) ( ON ?auto_504 ?auto_514 ) ( CLEAR ?auto_504 ) ( TRUCK-AT ?auto_509 ?auto_511 ) ( not ( = ?auto_503 ?auto_504 ) ) ( not ( = ?auto_503 ?auto_514 ) ) ( not ( = ?auto_504 ?auto_514 ) ) ( not ( = ?auto_507 ?auto_513 ) ) ( not ( = ?auto_503 ?auto_505 ) ) ( not ( = ?auto_503 ?auto_510 ) ) ( not ( = ?auto_505 ?auto_514 ) ) ( not ( = ?auto_506 ?auto_512 ) ) ( not ( = ?auto_508 ?auto_513 ) ) ( not ( = ?auto_510 ?auto_514 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_503 ?auto_504 )
      ( MAKE-1CRATE ?auto_504 ?auto_505 )
      ( MAKE-2CRATE-VERIFY ?auto_503 ?auto_504 ?auto_505 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517 - SURFACE
      ?auto_518 - SURFACE
    )
    :vars
    (
      ?auto_519 - HOIST
      ?auto_520 - PLACE
      ?auto_522 - PLACE
      ?auto_523 - HOIST
      ?auto_524 - SURFACE
      ?auto_521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_519 ?auto_520 ) ( SURFACE-AT ?auto_517 ?auto_520 ) ( CLEAR ?auto_517 ) ( IS-CRATE ?auto_518 ) ( AVAILABLE ?auto_519 ) ( not ( = ?auto_522 ?auto_520 ) ) ( HOIST-AT ?auto_523 ?auto_522 ) ( AVAILABLE ?auto_523 ) ( SURFACE-AT ?auto_518 ?auto_522 ) ( ON ?auto_518 ?auto_524 ) ( CLEAR ?auto_518 ) ( TRUCK-AT ?auto_521 ?auto_520 ) ( not ( = ?auto_517 ?auto_518 ) ) ( not ( = ?auto_517 ?auto_524 ) ) ( not ( = ?auto_518 ?auto_524 ) ) ( not ( = ?auto_519 ?auto_523 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_521 ?auto_520 ?auto_522 )
      ( !LIFT ?auto_523 ?auto_518 ?auto_524 ?auto_522 )
      ( !LOAD ?auto_523 ?auto_518 ?auto_521 ?auto_522 )
      ( !DRIVE ?auto_521 ?auto_522 ?auto_520 )
      ( !UNLOAD ?auto_519 ?auto_518 ?auto_521 ?auto_520 )
      ( !DROP ?auto_519 ?auto_518 ?auto_517 ?auto_520 )
      ( MAKE-1CRATE-VERIFY ?auto_517 ?auto_518 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_529 - SURFACE
      ?auto_530 - SURFACE
      ?auto_531 - SURFACE
      ?auto_532 - SURFACE
    )
    :vars
    (
      ?auto_535 - HOIST
      ?auto_538 - PLACE
      ?auto_536 - PLACE
      ?auto_533 - HOIST
      ?auto_534 - SURFACE
      ?auto_540 - PLACE
      ?auto_544 - HOIST
      ?auto_539 - SURFACE
      ?auto_543 - PLACE
      ?auto_541 - HOIST
      ?auto_542 - SURFACE
      ?auto_537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_535 ?auto_538 ) ( IS-CRATE ?auto_532 ) ( not ( = ?auto_536 ?auto_538 ) ) ( HOIST-AT ?auto_533 ?auto_536 ) ( AVAILABLE ?auto_533 ) ( SURFACE-AT ?auto_532 ?auto_536 ) ( ON ?auto_532 ?auto_534 ) ( CLEAR ?auto_532 ) ( not ( = ?auto_531 ?auto_532 ) ) ( not ( = ?auto_531 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_534 ) ) ( not ( = ?auto_535 ?auto_533 ) ) ( IS-CRATE ?auto_531 ) ( not ( = ?auto_540 ?auto_538 ) ) ( HOIST-AT ?auto_544 ?auto_540 ) ( AVAILABLE ?auto_544 ) ( SURFACE-AT ?auto_531 ?auto_540 ) ( ON ?auto_531 ?auto_539 ) ( CLEAR ?auto_531 ) ( not ( = ?auto_530 ?auto_531 ) ) ( not ( = ?auto_530 ?auto_539 ) ) ( not ( = ?auto_531 ?auto_539 ) ) ( not ( = ?auto_535 ?auto_544 ) ) ( SURFACE-AT ?auto_529 ?auto_538 ) ( CLEAR ?auto_529 ) ( IS-CRATE ?auto_530 ) ( AVAILABLE ?auto_535 ) ( not ( = ?auto_543 ?auto_538 ) ) ( HOIST-AT ?auto_541 ?auto_543 ) ( AVAILABLE ?auto_541 ) ( SURFACE-AT ?auto_530 ?auto_543 ) ( ON ?auto_530 ?auto_542 ) ( CLEAR ?auto_530 ) ( TRUCK-AT ?auto_537 ?auto_538 ) ( not ( = ?auto_529 ?auto_530 ) ) ( not ( = ?auto_529 ?auto_542 ) ) ( not ( = ?auto_530 ?auto_542 ) ) ( not ( = ?auto_535 ?auto_541 ) ) ( not ( = ?auto_529 ?auto_531 ) ) ( not ( = ?auto_529 ?auto_539 ) ) ( not ( = ?auto_531 ?auto_542 ) ) ( not ( = ?auto_540 ?auto_543 ) ) ( not ( = ?auto_544 ?auto_541 ) ) ( not ( = ?auto_539 ?auto_542 ) ) ( not ( = ?auto_529 ?auto_532 ) ) ( not ( = ?auto_529 ?auto_534 ) ) ( not ( = ?auto_530 ?auto_532 ) ) ( not ( = ?auto_530 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_539 ) ) ( not ( = ?auto_532 ?auto_542 ) ) ( not ( = ?auto_536 ?auto_540 ) ) ( not ( = ?auto_536 ?auto_543 ) ) ( not ( = ?auto_533 ?auto_544 ) ) ( not ( = ?auto_533 ?auto_541 ) ) ( not ( = ?auto_534 ?auto_539 ) ) ( not ( = ?auto_534 ?auto_542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_529 ?auto_530 ?auto_531 )
      ( MAKE-1CRATE ?auto_531 ?auto_532 )
      ( MAKE-3CRATE-VERIFY ?auto_529 ?auto_530 ?auto_531 ?auto_532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_547 - SURFACE
      ?auto_548 - SURFACE
    )
    :vars
    (
      ?auto_549 - HOIST
      ?auto_550 - PLACE
      ?auto_552 - PLACE
      ?auto_553 - HOIST
      ?auto_554 - SURFACE
      ?auto_551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_549 ?auto_550 ) ( SURFACE-AT ?auto_547 ?auto_550 ) ( CLEAR ?auto_547 ) ( IS-CRATE ?auto_548 ) ( AVAILABLE ?auto_549 ) ( not ( = ?auto_552 ?auto_550 ) ) ( HOIST-AT ?auto_553 ?auto_552 ) ( AVAILABLE ?auto_553 ) ( SURFACE-AT ?auto_548 ?auto_552 ) ( ON ?auto_548 ?auto_554 ) ( CLEAR ?auto_548 ) ( TRUCK-AT ?auto_551 ?auto_550 ) ( not ( = ?auto_547 ?auto_548 ) ) ( not ( = ?auto_547 ?auto_554 ) ) ( not ( = ?auto_548 ?auto_554 ) ) ( not ( = ?auto_549 ?auto_553 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_551 ?auto_550 ?auto_552 )
      ( !LIFT ?auto_553 ?auto_548 ?auto_554 ?auto_552 )
      ( !LOAD ?auto_553 ?auto_548 ?auto_551 ?auto_552 )
      ( !DRIVE ?auto_551 ?auto_552 ?auto_550 )
      ( !UNLOAD ?auto_549 ?auto_548 ?auto_551 ?auto_550 )
      ( !DROP ?auto_549 ?auto_548 ?auto_547 ?auto_550 )
      ( MAKE-1CRATE-VERIFY ?auto_547 ?auto_548 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_560 - SURFACE
      ?auto_561 - SURFACE
      ?auto_562 - SURFACE
      ?auto_563 - SURFACE
      ?auto_564 - SURFACE
    )
    :vars
    (
      ?auto_570 - HOIST
      ?auto_567 - PLACE
      ?auto_568 - PLACE
      ?auto_566 - HOIST
      ?auto_565 - SURFACE
      ?auto_575 - SURFACE
      ?auto_577 - PLACE
      ?auto_571 - HOIST
      ?auto_576 - SURFACE
      ?auto_573 - PLACE
      ?auto_572 - HOIST
      ?auto_574 - SURFACE
      ?auto_569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_570 ?auto_567 ) ( IS-CRATE ?auto_564 ) ( not ( = ?auto_568 ?auto_567 ) ) ( HOIST-AT ?auto_566 ?auto_568 ) ( SURFACE-AT ?auto_564 ?auto_568 ) ( ON ?auto_564 ?auto_565 ) ( CLEAR ?auto_564 ) ( not ( = ?auto_563 ?auto_564 ) ) ( not ( = ?auto_563 ?auto_565 ) ) ( not ( = ?auto_564 ?auto_565 ) ) ( not ( = ?auto_570 ?auto_566 ) ) ( IS-CRATE ?auto_563 ) ( AVAILABLE ?auto_566 ) ( SURFACE-AT ?auto_563 ?auto_568 ) ( ON ?auto_563 ?auto_575 ) ( CLEAR ?auto_563 ) ( not ( = ?auto_562 ?auto_563 ) ) ( not ( = ?auto_562 ?auto_575 ) ) ( not ( = ?auto_563 ?auto_575 ) ) ( IS-CRATE ?auto_562 ) ( not ( = ?auto_577 ?auto_567 ) ) ( HOIST-AT ?auto_571 ?auto_577 ) ( AVAILABLE ?auto_571 ) ( SURFACE-AT ?auto_562 ?auto_577 ) ( ON ?auto_562 ?auto_576 ) ( CLEAR ?auto_562 ) ( not ( = ?auto_561 ?auto_562 ) ) ( not ( = ?auto_561 ?auto_576 ) ) ( not ( = ?auto_562 ?auto_576 ) ) ( not ( = ?auto_570 ?auto_571 ) ) ( SURFACE-AT ?auto_560 ?auto_567 ) ( CLEAR ?auto_560 ) ( IS-CRATE ?auto_561 ) ( AVAILABLE ?auto_570 ) ( not ( = ?auto_573 ?auto_567 ) ) ( HOIST-AT ?auto_572 ?auto_573 ) ( AVAILABLE ?auto_572 ) ( SURFACE-AT ?auto_561 ?auto_573 ) ( ON ?auto_561 ?auto_574 ) ( CLEAR ?auto_561 ) ( TRUCK-AT ?auto_569 ?auto_567 ) ( not ( = ?auto_560 ?auto_561 ) ) ( not ( = ?auto_560 ?auto_574 ) ) ( not ( = ?auto_561 ?auto_574 ) ) ( not ( = ?auto_570 ?auto_572 ) ) ( not ( = ?auto_560 ?auto_562 ) ) ( not ( = ?auto_560 ?auto_576 ) ) ( not ( = ?auto_562 ?auto_574 ) ) ( not ( = ?auto_577 ?auto_573 ) ) ( not ( = ?auto_571 ?auto_572 ) ) ( not ( = ?auto_576 ?auto_574 ) ) ( not ( = ?auto_560 ?auto_563 ) ) ( not ( = ?auto_560 ?auto_575 ) ) ( not ( = ?auto_561 ?auto_563 ) ) ( not ( = ?auto_561 ?auto_575 ) ) ( not ( = ?auto_563 ?auto_576 ) ) ( not ( = ?auto_563 ?auto_574 ) ) ( not ( = ?auto_568 ?auto_577 ) ) ( not ( = ?auto_568 ?auto_573 ) ) ( not ( = ?auto_566 ?auto_571 ) ) ( not ( = ?auto_566 ?auto_572 ) ) ( not ( = ?auto_575 ?auto_576 ) ) ( not ( = ?auto_575 ?auto_574 ) ) ( not ( = ?auto_560 ?auto_564 ) ) ( not ( = ?auto_560 ?auto_565 ) ) ( not ( = ?auto_561 ?auto_564 ) ) ( not ( = ?auto_561 ?auto_565 ) ) ( not ( = ?auto_562 ?auto_564 ) ) ( not ( = ?auto_562 ?auto_565 ) ) ( not ( = ?auto_564 ?auto_575 ) ) ( not ( = ?auto_564 ?auto_576 ) ) ( not ( = ?auto_564 ?auto_574 ) ) ( not ( = ?auto_565 ?auto_575 ) ) ( not ( = ?auto_565 ?auto_576 ) ) ( not ( = ?auto_565 ?auto_574 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_560 ?auto_561 ?auto_562 ?auto_563 )
      ( MAKE-1CRATE ?auto_563 ?auto_564 )
      ( MAKE-4CRATE-VERIFY ?auto_560 ?auto_561 ?auto_562 ?auto_563 ?auto_564 ) )
  )

)

