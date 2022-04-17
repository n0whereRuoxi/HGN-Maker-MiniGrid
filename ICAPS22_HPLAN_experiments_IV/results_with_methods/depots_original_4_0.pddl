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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?above - SURFACE
      ?below - SURFACE
    )
    :precondition
    ( and ( ON ?above ?below ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_460 - SURFACE
      ?auto_459 - SURFACE
    )
    :vars
    (
      ?auto_461 - HOIST
      ?auto_462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_461 ?auto_462 ) ( SURFACE-AT ?auto_459 ?auto_462 ) ( CLEAR ?auto_459 ) ( LIFTING ?auto_461 ?auto_460 ) ( IS-CRATE ?auto_460 ) ( not ( = ?auto_460 ?auto_459 ) ) )
    :subtasks
    ( ( !DROP ?auto_461 ?auto_460 ?auto_459 ?auto_462 )
      ( MAKE-ON-VERIFY ?auto_460 ?auto_459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_464 - SURFACE
      ?auto_463 - SURFACE
    )
    :vars
    (
      ?auto_466 - HOIST
      ?auto_465 - PLACE
      ?auto_467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_466 ?auto_465 ) ( SURFACE-AT ?auto_463 ?auto_465 ) ( CLEAR ?auto_463 ) ( IS-CRATE ?auto_464 ) ( not ( = ?auto_464 ?auto_463 ) ) ( TRUCK-AT ?auto_467 ?auto_465 ) ( AVAILABLE ?auto_466 ) ( IN ?auto_464 ?auto_467 ) )
    :subtasks
    ( ( !UNLOAD ?auto_466 ?auto_464 ?auto_467 ?auto_465 )
      ( MAKE-ON ?auto_464 ?auto_463 )
      ( MAKE-ON-VERIFY ?auto_464 ?auto_463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_469 - SURFACE
      ?auto_468 - SURFACE
    )
    :vars
    (
      ?auto_470 - HOIST
      ?auto_472 - PLACE
      ?auto_471 - TRUCK
      ?auto_473 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_470 ?auto_472 ) ( SURFACE-AT ?auto_468 ?auto_472 ) ( CLEAR ?auto_468 ) ( IS-CRATE ?auto_469 ) ( not ( = ?auto_469 ?auto_468 ) ) ( TRUCK-AT ?auto_471 ?auto_472 ) ( IN ?auto_469 ?auto_471 ) ( LIFTING ?auto_470 ?auto_473 ) ( IS-CRATE ?auto_473 ) ( not ( = ?auto_469 ?auto_473 ) ) ( not ( = ?auto_468 ?auto_473 ) ) )
    :subtasks
    ( ( !LOAD ?auto_470 ?auto_473 ?auto_471 ?auto_472 )
      ( MAKE-ON ?auto_469 ?auto_468 )
      ( MAKE-ON-VERIFY ?auto_469 ?auto_468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_475 - SURFACE
      ?auto_474 - SURFACE
    )
    :vars
    (
      ?auto_476 - HOIST
      ?auto_477 - PLACE
      ?auto_479 - TRUCK
      ?auto_478 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_476 ?auto_477 ) ( SURFACE-AT ?auto_474 ?auto_477 ) ( IS-CRATE ?auto_475 ) ( not ( = ?auto_475 ?auto_474 ) ) ( TRUCK-AT ?auto_479 ?auto_477 ) ( IN ?auto_475 ?auto_479 ) ( IS-CRATE ?auto_478 ) ( not ( = ?auto_475 ?auto_478 ) ) ( not ( = ?auto_474 ?auto_478 ) ) ( AVAILABLE ?auto_476 ) ( SURFACE-AT ?auto_478 ?auto_477 ) ( ON ?auto_478 ?auto_474 ) ( CLEAR ?auto_478 ) )
    :subtasks
    ( ( !LIFT ?auto_476 ?auto_478 ?auto_474 ?auto_477 )
      ( MAKE-ON ?auto_475 ?auto_474 )
      ( MAKE-ON-VERIFY ?auto_475 ?auto_474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_481 - SURFACE
      ?auto_480 - SURFACE
    )
    :vars
    (
      ?auto_483 - HOIST
      ?auto_482 - PLACE
      ?auto_485 - TRUCK
      ?auto_484 - SURFACE
      ?auto_486 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_483 ?auto_482 ) ( SURFACE-AT ?auto_480 ?auto_482 ) ( IS-CRATE ?auto_481 ) ( not ( = ?auto_481 ?auto_480 ) ) ( TRUCK-AT ?auto_485 ?auto_482 ) ( IN ?auto_481 ?auto_485 ) ( IS-CRATE ?auto_484 ) ( not ( = ?auto_481 ?auto_484 ) ) ( not ( = ?auto_480 ?auto_484 ) ) ( SURFACE-AT ?auto_484 ?auto_482 ) ( ON ?auto_484 ?auto_480 ) ( CLEAR ?auto_484 ) ( LIFTING ?auto_483 ?auto_486 ) ( IS-CRATE ?auto_486 ) ( not ( = ?auto_481 ?auto_486 ) ) ( not ( = ?auto_480 ?auto_486 ) ) ( not ( = ?auto_484 ?auto_486 ) ) )
    :subtasks
    ( ( !LOAD ?auto_483 ?auto_486 ?auto_485 ?auto_482 )
      ( MAKE-ON ?auto_481 ?auto_480 )
      ( MAKE-ON-VERIFY ?auto_481 ?auto_480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_488 - SURFACE
      ?auto_487 - SURFACE
    )
    :vars
    (
      ?auto_491 - HOIST
      ?auto_492 - PLACE
      ?auto_489 - TRUCK
      ?auto_493 - SURFACE
      ?auto_490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_491 ?auto_492 ) ( SURFACE-AT ?auto_487 ?auto_492 ) ( IS-CRATE ?auto_488 ) ( not ( = ?auto_488 ?auto_487 ) ) ( TRUCK-AT ?auto_489 ?auto_492 ) ( IN ?auto_488 ?auto_489 ) ( IS-CRATE ?auto_493 ) ( not ( = ?auto_488 ?auto_493 ) ) ( not ( = ?auto_487 ?auto_493 ) ) ( SURFACE-AT ?auto_493 ?auto_492 ) ( ON ?auto_493 ?auto_487 ) ( IS-CRATE ?auto_490 ) ( not ( = ?auto_488 ?auto_490 ) ) ( not ( = ?auto_487 ?auto_490 ) ) ( not ( = ?auto_493 ?auto_490 ) ) ( AVAILABLE ?auto_491 ) ( SURFACE-AT ?auto_490 ?auto_492 ) ( ON ?auto_490 ?auto_493 ) ( CLEAR ?auto_490 ) )
    :subtasks
    ( ( !LIFT ?auto_491 ?auto_490 ?auto_493 ?auto_492 )
      ( MAKE-ON ?auto_488 ?auto_487 )
      ( MAKE-ON-VERIFY ?auto_488 ?auto_487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_495 - SURFACE
      ?auto_494 - SURFACE
    )
    :vars
    (
      ?auto_497 - HOIST
      ?auto_500 - PLACE
      ?auto_498 - TRUCK
      ?auto_496 - SURFACE
      ?auto_499 - SURFACE
      ?auto_501 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_497 ?auto_500 ) ( SURFACE-AT ?auto_494 ?auto_500 ) ( IS-CRATE ?auto_495 ) ( not ( = ?auto_495 ?auto_494 ) ) ( IN ?auto_495 ?auto_498 ) ( IS-CRATE ?auto_496 ) ( not ( = ?auto_495 ?auto_496 ) ) ( not ( = ?auto_494 ?auto_496 ) ) ( SURFACE-AT ?auto_496 ?auto_500 ) ( ON ?auto_496 ?auto_494 ) ( IS-CRATE ?auto_499 ) ( not ( = ?auto_495 ?auto_499 ) ) ( not ( = ?auto_494 ?auto_499 ) ) ( not ( = ?auto_496 ?auto_499 ) ) ( AVAILABLE ?auto_497 ) ( SURFACE-AT ?auto_499 ?auto_500 ) ( ON ?auto_499 ?auto_496 ) ( CLEAR ?auto_499 ) ( TRUCK-AT ?auto_498 ?auto_501 ) ( not ( = ?auto_501 ?auto_500 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_498 ?auto_501 ?auto_500 )
      ( MAKE-ON ?auto_495 ?auto_494 )
      ( MAKE-ON-VERIFY ?auto_495 ?auto_494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_503 - SURFACE
      ?auto_502 - SURFACE
    )
    :vars
    (
      ?auto_508 - HOIST
      ?auto_506 - PLACE
      ?auto_509 - SURFACE
      ?auto_505 - SURFACE
      ?auto_507 - TRUCK
      ?auto_504 - PLACE
      ?auto_510 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_508 ?auto_506 ) ( SURFACE-AT ?auto_502 ?auto_506 ) ( IS-CRATE ?auto_503 ) ( not ( = ?auto_503 ?auto_502 ) ) ( IS-CRATE ?auto_509 ) ( not ( = ?auto_503 ?auto_509 ) ) ( not ( = ?auto_502 ?auto_509 ) ) ( SURFACE-AT ?auto_509 ?auto_506 ) ( ON ?auto_509 ?auto_502 ) ( IS-CRATE ?auto_505 ) ( not ( = ?auto_503 ?auto_505 ) ) ( not ( = ?auto_502 ?auto_505 ) ) ( not ( = ?auto_509 ?auto_505 ) ) ( AVAILABLE ?auto_508 ) ( SURFACE-AT ?auto_505 ?auto_506 ) ( ON ?auto_505 ?auto_509 ) ( CLEAR ?auto_505 ) ( TRUCK-AT ?auto_507 ?auto_504 ) ( not ( = ?auto_504 ?auto_506 ) ) ( HOIST-AT ?auto_510 ?auto_504 ) ( LIFTING ?auto_510 ?auto_503 ) ( not ( = ?auto_508 ?auto_510 ) ) )
    :subtasks
    ( ( !LOAD ?auto_510 ?auto_503 ?auto_507 ?auto_504 )
      ( MAKE-ON ?auto_503 ?auto_502 )
      ( MAKE-ON-VERIFY ?auto_503 ?auto_502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_512 - SURFACE
      ?auto_511 - SURFACE
    )
    :vars
    (
      ?auto_519 - HOIST
      ?auto_514 - PLACE
      ?auto_516 - SURFACE
      ?auto_513 - SURFACE
      ?auto_515 - TRUCK
      ?auto_517 - PLACE
      ?auto_518 - HOIST
      ?auto_520 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_519 ?auto_514 ) ( SURFACE-AT ?auto_511 ?auto_514 ) ( IS-CRATE ?auto_512 ) ( not ( = ?auto_512 ?auto_511 ) ) ( IS-CRATE ?auto_516 ) ( not ( = ?auto_512 ?auto_516 ) ) ( not ( = ?auto_511 ?auto_516 ) ) ( SURFACE-AT ?auto_516 ?auto_514 ) ( ON ?auto_516 ?auto_511 ) ( IS-CRATE ?auto_513 ) ( not ( = ?auto_512 ?auto_513 ) ) ( not ( = ?auto_511 ?auto_513 ) ) ( not ( = ?auto_516 ?auto_513 ) ) ( AVAILABLE ?auto_519 ) ( SURFACE-AT ?auto_513 ?auto_514 ) ( ON ?auto_513 ?auto_516 ) ( CLEAR ?auto_513 ) ( TRUCK-AT ?auto_515 ?auto_517 ) ( not ( = ?auto_517 ?auto_514 ) ) ( HOIST-AT ?auto_518 ?auto_517 ) ( not ( = ?auto_519 ?auto_518 ) ) ( AVAILABLE ?auto_518 ) ( SURFACE-AT ?auto_512 ?auto_517 ) ( ON ?auto_512 ?auto_520 ) ( CLEAR ?auto_512 ) ( not ( = ?auto_512 ?auto_520 ) ) ( not ( = ?auto_511 ?auto_520 ) ) ( not ( = ?auto_516 ?auto_520 ) ) ( not ( = ?auto_513 ?auto_520 ) ) )
    :subtasks
    ( ( !LIFT ?auto_518 ?auto_512 ?auto_520 ?auto_517 )
      ( MAKE-ON ?auto_512 ?auto_511 )
      ( MAKE-ON-VERIFY ?auto_512 ?auto_511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_524 - SURFACE
      ?auto_523 - SURFACE
    )
    :vars
    (
      ?auto_525 - HOIST
      ?auto_526 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_525 ?auto_526 ) ( SURFACE-AT ?auto_523 ?auto_526 ) ( CLEAR ?auto_523 ) ( LIFTING ?auto_525 ?auto_524 ) ( IS-CRATE ?auto_524 ) ( not ( = ?auto_524 ?auto_523 ) ) )
    :subtasks
    ( ( !DROP ?auto_525 ?auto_524 ?auto_523 ?auto_526 )
      ( MAKE-ON-VERIFY ?auto_524 ?auto_523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_528 - SURFACE
      ?auto_527 - SURFACE
    )
    :vars
    (
      ?auto_529 - HOIST
      ?auto_530 - PLACE
      ?auto_531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_529 ?auto_530 ) ( SURFACE-AT ?auto_527 ?auto_530 ) ( CLEAR ?auto_527 ) ( IS-CRATE ?auto_528 ) ( not ( = ?auto_528 ?auto_527 ) ) ( TRUCK-AT ?auto_531 ?auto_530 ) ( AVAILABLE ?auto_529 ) ( IN ?auto_528 ?auto_531 ) )
    :subtasks
    ( ( !UNLOAD ?auto_529 ?auto_528 ?auto_531 ?auto_530 )
      ( MAKE-ON ?auto_528 ?auto_527 )
      ( MAKE-ON-VERIFY ?auto_528 ?auto_527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_533 - SURFACE
      ?auto_532 - SURFACE
    )
    :vars
    (
      ?auto_534 - HOIST
      ?auto_535 - PLACE
      ?auto_536 - TRUCK
      ?auto_537 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_534 ?auto_535 ) ( SURFACE-AT ?auto_532 ?auto_535 ) ( CLEAR ?auto_532 ) ( IS-CRATE ?auto_533 ) ( not ( = ?auto_533 ?auto_532 ) ) ( AVAILABLE ?auto_534 ) ( IN ?auto_533 ?auto_536 ) ( TRUCK-AT ?auto_536 ?auto_537 ) ( not ( = ?auto_537 ?auto_535 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_536 ?auto_537 ?auto_535 )
      ( MAKE-ON ?auto_533 ?auto_532 )
      ( MAKE-ON-VERIFY ?auto_533 ?auto_532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_563 - SURFACE
      ?auto_562 - SURFACE
    )
    :vars
    (
      ?auto_567 - HOIST
      ?auto_565 - PLACE
      ?auto_564 - TRUCK
      ?auto_566 - PLACE
      ?auto_568 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_567 ?auto_565 ) ( SURFACE-AT ?auto_562 ?auto_565 ) ( CLEAR ?auto_562 ) ( IS-CRATE ?auto_563 ) ( not ( = ?auto_563 ?auto_562 ) ) ( AVAILABLE ?auto_567 ) ( TRUCK-AT ?auto_564 ?auto_566 ) ( not ( = ?auto_566 ?auto_565 ) ) ( HOIST-AT ?auto_568 ?auto_566 ) ( LIFTING ?auto_568 ?auto_563 ) ( not ( = ?auto_567 ?auto_568 ) ) )
    :subtasks
    ( ( !LOAD ?auto_568 ?auto_563 ?auto_564 ?auto_566 )
      ( MAKE-ON ?auto_563 ?auto_562 )
      ( MAKE-ON-VERIFY ?auto_563 ?auto_562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_570 - SURFACE
      ?auto_569 - SURFACE
    )
    :vars
    (
      ?auto_575 - HOIST
      ?auto_574 - PLACE
      ?auto_572 - TRUCK
      ?auto_573 - PLACE
      ?auto_571 - HOIST
      ?auto_576 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575 ?auto_574 ) ( SURFACE-AT ?auto_569 ?auto_574 ) ( CLEAR ?auto_569 ) ( IS-CRATE ?auto_570 ) ( not ( = ?auto_570 ?auto_569 ) ) ( AVAILABLE ?auto_575 ) ( TRUCK-AT ?auto_572 ?auto_573 ) ( not ( = ?auto_573 ?auto_574 ) ) ( HOIST-AT ?auto_571 ?auto_573 ) ( not ( = ?auto_575 ?auto_571 ) ) ( AVAILABLE ?auto_571 ) ( SURFACE-AT ?auto_570 ?auto_573 ) ( ON ?auto_570 ?auto_576 ) ( CLEAR ?auto_570 ) ( not ( = ?auto_570 ?auto_576 ) ) ( not ( = ?auto_569 ?auto_576 ) ) )
    :subtasks
    ( ( !LIFT ?auto_571 ?auto_570 ?auto_576 ?auto_573 )
      ( MAKE-ON ?auto_570 ?auto_569 )
      ( MAKE-ON-VERIFY ?auto_570 ?auto_569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_578 - SURFACE
      ?auto_577 - SURFACE
    )
    :vars
    (
      ?auto_579 - HOIST
      ?auto_584 - PLACE
      ?auto_581 - PLACE
      ?auto_582 - HOIST
      ?auto_583 - SURFACE
      ?auto_580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_579 ?auto_584 ) ( SURFACE-AT ?auto_577 ?auto_584 ) ( CLEAR ?auto_577 ) ( IS-CRATE ?auto_578 ) ( not ( = ?auto_578 ?auto_577 ) ) ( AVAILABLE ?auto_579 ) ( not ( = ?auto_581 ?auto_584 ) ) ( HOIST-AT ?auto_582 ?auto_581 ) ( not ( = ?auto_579 ?auto_582 ) ) ( AVAILABLE ?auto_582 ) ( SURFACE-AT ?auto_578 ?auto_581 ) ( ON ?auto_578 ?auto_583 ) ( CLEAR ?auto_578 ) ( not ( = ?auto_578 ?auto_583 ) ) ( not ( = ?auto_577 ?auto_583 ) ) ( TRUCK-AT ?auto_580 ?auto_584 ) )
    :subtasks
    ( ( !DRIVE ?auto_580 ?auto_584 ?auto_581 )
      ( MAKE-ON ?auto_578 ?auto_577 )
      ( MAKE-ON-VERIFY ?auto_578 ?auto_577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_586 - SURFACE
      ?auto_585 - SURFACE
    )
    :vars
    (
      ?auto_589 - HOIST
      ?auto_588 - PLACE
      ?auto_587 - PLACE
      ?auto_590 - HOIST
      ?auto_591 - SURFACE
      ?auto_592 - TRUCK
      ?auto_593 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_589 ?auto_588 ) ( SURFACE-AT ?auto_585 ?auto_588 ) ( CLEAR ?auto_585 ) ( IS-CRATE ?auto_586 ) ( not ( = ?auto_586 ?auto_585 ) ) ( not ( = ?auto_587 ?auto_588 ) ) ( HOIST-AT ?auto_590 ?auto_587 ) ( not ( = ?auto_589 ?auto_590 ) ) ( AVAILABLE ?auto_590 ) ( SURFACE-AT ?auto_586 ?auto_587 ) ( ON ?auto_586 ?auto_591 ) ( CLEAR ?auto_586 ) ( not ( = ?auto_586 ?auto_591 ) ) ( not ( = ?auto_585 ?auto_591 ) ) ( TRUCK-AT ?auto_592 ?auto_588 ) ( LIFTING ?auto_589 ?auto_593 ) ( IS-CRATE ?auto_593 ) ( not ( = ?auto_586 ?auto_593 ) ) ( not ( = ?auto_585 ?auto_593 ) ) ( not ( = ?auto_591 ?auto_593 ) ) )
    :subtasks
    ( ( !LOAD ?auto_589 ?auto_593 ?auto_592 ?auto_588 )
      ( MAKE-ON ?auto_586 ?auto_585 )
      ( MAKE-ON-VERIFY ?auto_586 ?auto_585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_595 - SURFACE
      ?auto_594 - SURFACE
    )
    :vars
    (
      ?auto_600 - HOIST
      ?auto_601 - PLACE
      ?auto_596 - PLACE
      ?auto_599 - HOIST
      ?auto_597 - SURFACE
      ?auto_602 - TRUCK
      ?auto_598 - SURFACE
      ?auto_603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_600 ?auto_601 ) ( SURFACE-AT ?auto_594 ?auto_601 ) ( CLEAR ?auto_594 ) ( IS-CRATE ?auto_595 ) ( not ( = ?auto_595 ?auto_594 ) ) ( not ( = ?auto_596 ?auto_601 ) ) ( HOIST-AT ?auto_599 ?auto_596 ) ( not ( = ?auto_600 ?auto_599 ) ) ( AVAILABLE ?auto_599 ) ( SURFACE-AT ?auto_595 ?auto_596 ) ( ON ?auto_595 ?auto_597 ) ( CLEAR ?auto_595 ) ( not ( = ?auto_595 ?auto_597 ) ) ( not ( = ?auto_594 ?auto_597 ) ) ( TRUCK-AT ?auto_602 ?auto_601 ) ( IS-CRATE ?auto_598 ) ( not ( = ?auto_595 ?auto_598 ) ) ( not ( = ?auto_594 ?auto_598 ) ) ( not ( = ?auto_597 ?auto_598 ) ) ( AVAILABLE ?auto_600 ) ( SURFACE-AT ?auto_598 ?auto_601 ) ( ON ?auto_598 ?auto_603 ) ( CLEAR ?auto_598 ) ( not ( = ?auto_595 ?auto_603 ) ) ( not ( = ?auto_594 ?auto_603 ) ) ( not ( = ?auto_597 ?auto_603 ) ) ( not ( = ?auto_598 ?auto_603 ) ) )
    :subtasks
    ( ( !LIFT ?auto_600 ?auto_598 ?auto_603 ?auto_601 )
      ( MAKE-ON ?auto_595 ?auto_594 )
      ( MAKE-ON-VERIFY ?auto_595 ?auto_594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_607 - SURFACE
      ?auto_606 - SURFACE
    )
    :vars
    (
      ?auto_608 - HOIST
      ?auto_609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_608 ?auto_609 ) ( SURFACE-AT ?auto_606 ?auto_609 ) ( CLEAR ?auto_606 ) ( LIFTING ?auto_608 ?auto_607 ) ( IS-CRATE ?auto_607 ) ( not ( = ?auto_607 ?auto_606 ) ) )
    :subtasks
    ( ( !DROP ?auto_608 ?auto_607 ?auto_606 ?auto_609 )
      ( MAKE-ON-VERIFY ?auto_607 ?auto_606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_611 - SURFACE
      ?auto_610 - SURFACE
    )
    :vars
    (
      ?auto_613 - HOIST
      ?auto_612 - PLACE
      ?auto_614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_613 ?auto_612 ) ( SURFACE-AT ?auto_610 ?auto_612 ) ( CLEAR ?auto_610 ) ( IS-CRATE ?auto_611 ) ( not ( = ?auto_611 ?auto_610 ) ) ( TRUCK-AT ?auto_614 ?auto_612 ) ( AVAILABLE ?auto_613 ) ( IN ?auto_611 ?auto_614 ) )
    :subtasks
    ( ( !UNLOAD ?auto_613 ?auto_611 ?auto_614 ?auto_612 )
      ( MAKE-ON ?auto_611 ?auto_610 )
      ( MAKE-ON-VERIFY ?auto_611 ?auto_610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_616 - SURFACE
      ?auto_615 - SURFACE
    )
    :vars
    (
      ?auto_618 - HOIST
      ?auto_617 - PLACE
      ?auto_619 - TRUCK
      ?auto_620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_618 ?auto_617 ) ( SURFACE-AT ?auto_615 ?auto_617 ) ( CLEAR ?auto_615 ) ( IS-CRATE ?auto_616 ) ( not ( = ?auto_616 ?auto_615 ) ) ( TRUCK-AT ?auto_619 ?auto_617 ) ( IN ?auto_616 ?auto_619 ) ( LIFTING ?auto_618 ?auto_620 ) ( IS-CRATE ?auto_620 ) ( not ( = ?auto_616 ?auto_620 ) ) ( not ( = ?auto_615 ?auto_620 ) ) )
    :subtasks
    ( ( !LOAD ?auto_618 ?auto_620 ?auto_619 ?auto_617 )
      ( MAKE-ON ?auto_616 ?auto_615 )
      ( MAKE-ON-VERIFY ?auto_616 ?auto_615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_622 - SURFACE
      ?auto_621 - SURFACE
    )
    :vars
    (
      ?auto_624 - HOIST
      ?auto_623 - PLACE
      ?auto_625 - TRUCK
      ?auto_626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_624 ?auto_623 ) ( SURFACE-AT ?auto_621 ?auto_623 ) ( IS-CRATE ?auto_622 ) ( not ( = ?auto_622 ?auto_621 ) ) ( TRUCK-AT ?auto_625 ?auto_623 ) ( IN ?auto_622 ?auto_625 ) ( IS-CRATE ?auto_626 ) ( not ( = ?auto_622 ?auto_626 ) ) ( not ( = ?auto_621 ?auto_626 ) ) ( AVAILABLE ?auto_624 ) ( SURFACE-AT ?auto_626 ?auto_623 ) ( ON ?auto_626 ?auto_621 ) ( CLEAR ?auto_626 ) )
    :subtasks
    ( ( !LIFT ?auto_624 ?auto_626 ?auto_621 ?auto_623 )
      ( MAKE-ON ?auto_622 ?auto_621 )
      ( MAKE-ON-VERIFY ?auto_622 ?auto_621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_628 - SURFACE
      ?auto_627 - SURFACE
    )
    :vars
    (
      ?auto_630 - HOIST
      ?auto_631 - PLACE
      ?auto_632 - TRUCK
      ?auto_629 - SURFACE
      ?auto_633 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_630 ?auto_631 ) ( SURFACE-AT ?auto_627 ?auto_631 ) ( IS-CRATE ?auto_628 ) ( not ( = ?auto_628 ?auto_627 ) ) ( TRUCK-AT ?auto_632 ?auto_631 ) ( IN ?auto_628 ?auto_632 ) ( IS-CRATE ?auto_629 ) ( not ( = ?auto_628 ?auto_629 ) ) ( not ( = ?auto_627 ?auto_629 ) ) ( SURFACE-AT ?auto_629 ?auto_631 ) ( ON ?auto_629 ?auto_627 ) ( CLEAR ?auto_629 ) ( LIFTING ?auto_630 ?auto_633 ) ( IS-CRATE ?auto_633 ) ( not ( = ?auto_628 ?auto_633 ) ) ( not ( = ?auto_627 ?auto_633 ) ) ( not ( = ?auto_629 ?auto_633 ) ) )
    :subtasks
    ( ( !LOAD ?auto_630 ?auto_633 ?auto_632 ?auto_631 )
      ( MAKE-ON ?auto_628 ?auto_627 )
      ( MAKE-ON-VERIFY ?auto_628 ?auto_627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_635 - SURFACE
      ?auto_634 - SURFACE
    )
    :vars
    (
      ?auto_639 - HOIST
      ?auto_636 - PLACE
      ?auto_640 - TRUCK
      ?auto_638 - SURFACE
      ?auto_637 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_639 ?auto_636 ) ( SURFACE-AT ?auto_634 ?auto_636 ) ( IS-CRATE ?auto_635 ) ( not ( = ?auto_635 ?auto_634 ) ) ( TRUCK-AT ?auto_640 ?auto_636 ) ( IN ?auto_635 ?auto_640 ) ( IS-CRATE ?auto_638 ) ( not ( = ?auto_635 ?auto_638 ) ) ( not ( = ?auto_634 ?auto_638 ) ) ( SURFACE-AT ?auto_638 ?auto_636 ) ( ON ?auto_638 ?auto_634 ) ( IS-CRATE ?auto_637 ) ( not ( = ?auto_635 ?auto_637 ) ) ( not ( = ?auto_634 ?auto_637 ) ) ( not ( = ?auto_638 ?auto_637 ) ) ( AVAILABLE ?auto_639 ) ( SURFACE-AT ?auto_637 ?auto_636 ) ( ON ?auto_637 ?auto_638 ) ( CLEAR ?auto_637 ) )
    :subtasks
    ( ( !LIFT ?auto_639 ?auto_637 ?auto_638 ?auto_636 )
      ( MAKE-ON ?auto_635 ?auto_634 )
      ( MAKE-ON-VERIFY ?auto_635 ?auto_634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_642 - SURFACE
      ?auto_641 - SURFACE
    )
    :vars
    (
      ?auto_643 - HOIST
      ?auto_647 - PLACE
      ?auto_644 - TRUCK
      ?auto_645 - SURFACE
      ?auto_646 - SURFACE
      ?auto_648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_643 ?auto_647 ) ( SURFACE-AT ?auto_641 ?auto_647 ) ( IS-CRATE ?auto_642 ) ( not ( = ?auto_642 ?auto_641 ) ) ( IN ?auto_642 ?auto_644 ) ( IS-CRATE ?auto_645 ) ( not ( = ?auto_642 ?auto_645 ) ) ( not ( = ?auto_641 ?auto_645 ) ) ( SURFACE-AT ?auto_645 ?auto_647 ) ( ON ?auto_645 ?auto_641 ) ( IS-CRATE ?auto_646 ) ( not ( = ?auto_642 ?auto_646 ) ) ( not ( = ?auto_641 ?auto_646 ) ) ( not ( = ?auto_645 ?auto_646 ) ) ( AVAILABLE ?auto_643 ) ( SURFACE-AT ?auto_646 ?auto_647 ) ( ON ?auto_646 ?auto_645 ) ( CLEAR ?auto_646 ) ( TRUCK-AT ?auto_644 ?auto_648 ) ( not ( = ?auto_648 ?auto_647 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_644 ?auto_648 ?auto_647 )
      ( MAKE-ON ?auto_642 ?auto_641 )
      ( MAKE-ON-VERIFY ?auto_642 ?auto_641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_666 - SURFACE
      ?auto_665 - SURFACE
    )
    :vars
    (
      ?auto_668 - HOIST
      ?auto_669 - PLACE
      ?auto_667 - TRUCK
      ?auto_671 - SURFACE
      ?auto_670 - SURFACE
      ?auto_672 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_668 ?auto_669 ) ( SURFACE-AT ?auto_665 ?auto_669 ) ( IS-CRATE ?auto_666 ) ( not ( = ?auto_666 ?auto_665 ) ) ( IN ?auto_666 ?auto_667 ) ( IS-CRATE ?auto_671 ) ( not ( = ?auto_666 ?auto_671 ) ) ( not ( = ?auto_665 ?auto_671 ) ) ( SURFACE-AT ?auto_671 ?auto_669 ) ( ON ?auto_671 ?auto_665 ) ( IS-CRATE ?auto_670 ) ( not ( = ?auto_666 ?auto_670 ) ) ( not ( = ?auto_665 ?auto_670 ) ) ( not ( = ?auto_671 ?auto_670 ) ) ( AVAILABLE ?auto_668 ) ( SURFACE-AT ?auto_670 ?auto_669 ) ( ON ?auto_670 ?auto_671 ) ( CLEAR ?auto_670 ) ( not ( = ?auto_672 ?auto_669 ) ) ( TRUCK-AT ?auto_667 ?auto_669 ) )
    :subtasks
    ( ( !DRIVE ?auto_667 ?auto_669 ?auto_672 )
      ( MAKE-ON ?auto_666 ?auto_665 )
      ( MAKE-ON-VERIFY ?auto_666 ?auto_665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_674 - SURFACE
      ?auto_673 - SURFACE
    )
    :vars
    (
      ?auto_678 - HOIST
      ?auto_677 - PLACE
      ?auto_675 - TRUCK
      ?auto_680 - SURFACE
      ?auto_679 - SURFACE
      ?auto_676 - PLACE
      ?auto_682 - SURFACE
      ?auto_681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_678 ?auto_677 ) ( SURFACE-AT ?auto_673 ?auto_677 ) ( IS-CRATE ?auto_674 ) ( not ( = ?auto_674 ?auto_673 ) ) ( IN ?auto_674 ?auto_675 ) ( IS-CRATE ?auto_680 ) ( not ( = ?auto_674 ?auto_680 ) ) ( not ( = ?auto_673 ?auto_680 ) ) ( SURFACE-AT ?auto_680 ?auto_677 ) ( ON ?auto_680 ?auto_673 ) ( IS-CRATE ?auto_679 ) ( not ( = ?auto_674 ?auto_679 ) ) ( not ( = ?auto_673 ?auto_679 ) ) ( not ( = ?auto_680 ?auto_679 ) ) ( SURFACE-AT ?auto_679 ?auto_677 ) ( ON ?auto_679 ?auto_680 ) ( CLEAR ?auto_679 ) ( not ( = ?auto_676 ?auto_677 ) ) ( TRUCK-AT ?auto_675 ?auto_677 ) ( SURFACE-AT ?auto_682 ?auto_677 ) ( CLEAR ?auto_682 ) ( LIFTING ?auto_678 ?auto_681 ) ( IS-CRATE ?auto_681 ) ( not ( = ?auto_674 ?auto_682 ) ) ( not ( = ?auto_674 ?auto_681 ) ) ( not ( = ?auto_673 ?auto_682 ) ) ( not ( = ?auto_673 ?auto_681 ) ) ( not ( = ?auto_680 ?auto_682 ) ) ( not ( = ?auto_680 ?auto_681 ) ) ( not ( = ?auto_679 ?auto_682 ) ) ( not ( = ?auto_679 ?auto_681 ) ) ( not ( = ?auto_682 ?auto_681 ) ) )
    :subtasks
    ( ( !DROP ?auto_678 ?auto_681 ?auto_682 ?auto_677 )
      ( MAKE-ON ?auto_674 ?auto_673 )
      ( MAKE-ON-VERIFY ?auto_674 ?auto_673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_684 - SURFACE
      ?auto_683 - SURFACE
    )
    :vars
    (
      ?auto_688 - HOIST
      ?auto_685 - PLACE
      ?auto_691 - TRUCK
      ?auto_686 - SURFACE
      ?auto_692 - SURFACE
      ?auto_687 - PLACE
      ?auto_689 - SURFACE
      ?auto_690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_688 ?auto_685 ) ( SURFACE-AT ?auto_683 ?auto_685 ) ( IS-CRATE ?auto_684 ) ( not ( = ?auto_684 ?auto_683 ) ) ( IN ?auto_684 ?auto_691 ) ( IS-CRATE ?auto_686 ) ( not ( = ?auto_684 ?auto_686 ) ) ( not ( = ?auto_683 ?auto_686 ) ) ( SURFACE-AT ?auto_686 ?auto_685 ) ( ON ?auto_686 ?auto_683 ) ( IS-CRATE ?auto_692 ) ( not ( = ?auto_684 ?auto_692 ) ) ( not ( = ?auto_683 ?auto_692 ) ) ( not ( = ?auto_686 ?auto_692 ) ) ( SURFACE-AT ?auto_692 ?auto_685 ) ( ON ?auto_692 ?auto_686 ) ( CLEAR ?auto_692 ) ( not ( = ?auto_687 ?auto_685 ) ) ( TRUCK-AT ?auto_691 ?auto_685 ) ( SURFACE-AT ?auto_689 ?auto_685 ) ( CLEAR ?auto_689 ) ( IS-CRATE ?auto_690 ) ( not ( = ?auto_684 ?auto_689 ) ) ( not ( = ?auto_684 ?auto_690 ) ) ( not ( = ?auto_683 ?auto_689 ) ) ( not ( = ?auto_683 ?auto_690 ) ) ( not ( = ?auto_686 ?auto_689 ) ) ( not ( = ?auto_686 ?auto_690 ) ) ( not ( = ?auto_692 ?auto_689 ) ) ( not ( = ?auto_692 ?auto_690 ) ) ( not ( = ?auto_689 ?auto_690 ) ) ( AVAILABLE ?auto_688 ) ( IN ?auto_690 ?auto_691 ) )
    :subtasks
    ( ( !UNLOAD ?auto_688 ?auto_690 ?auto_691 ?auto_685 )
      ( MAKE-ON ?auto_684 ?auto_683 )
      ( MAKE-ON-VERIFY ?auto_684 ?auto_683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_694 - SURFACE
      ?auto_693 - SURFACE
    )
    :vars
    (
      ?auto_696 - HOIST
      ?auto_698 - PLACE
      ?auto_697 - SURFACE
      ?auto_699 - SURFACE
      ?auto_702 - PLACE
      ?auto_701 - TRUCK
      ?auto_700 - SURFACE
      ?auto_695 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_696 ?auto_698 ) ( SURFACE-AT ?auto_693 ?auto_698 ) ( IS-CRATE ?auto_694 ) ( not ( = ?auto_694 ?auto_693 ) ) ( IS-CRATE ?auto_697 ) ( not ( = ?auto_694 ?auto_697 ) ) ( not ( = ?auto_693 ?auto_697 ) ) ( SURFACE-AT ?auto_697 ?auto_698 ) ( ON ?auto_697 ?auto_693 ) ( IS-CRATE ?auto_699 ) ( not ( = ?auto_694 ?auto_699 ) ) ( not ( = ?auto_693 ?auto_699 ) ) ( not ( = ?auto_697 ?auto_699 ) ) ( SURFACE-AT ?auto_699 ?auto_698 ) ( ON ?auto_699 ?auto_697 ) ( CLEAR ?auto_699 ) ( not ( = ?auto_702 ?auto_698 ) ) ( TRUCK-AT ?auto_701 ?auto_698 ) ( SURFACE-AT ?auto_700 ?auto_698 ) ( CLEAR ?auto_700 ) ( IS-CRATE ?auto_695 ) ( not ( = ?auto_694 ?auto_700 ) ) ( not ( = ?auto_694 ?auto_695 ) ) ( not ( = ?auto_693 ?auto_700 ) ) ( not ( = ?auto_693 ?auto_695 ) ) ( not ( = ?auto_697 ?auto_700 ) ) ( not ( = ?auto_697 ?auto_695 ) ) ( not ( = ?auto_699 ?auto_700 ) ) ( not ( = ?auto_699 ?auto_695 ) ) ( not ( = ?auto_700 ?auto_695 ) ) ( IN ?auto_695 ?auto_701 ) ( LIFTING ?auto_696 ?auto_694 ) )
    :subtasks
    ( ( !LOAD ?auto_696 ?auto_694 ?auto_701 ?auto_698 )
      ( MAKE-ON ?auto_694 ?auto_693 )
      ( MAKE-ON-VERIFY ?auto_694 ?auto_693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_704 - SURFACE
      ?auto_703 - SURFACE
    )
    :vars
    (
      ?auto_705 - HOIST
      ?auto_710 - PLACE
      ?auto_708 - SURFACE
      ?auto_706 - SURFACE
      ?auto_712 - PLACE
      ?auto_709 - TRUCK
      ?auto_711 - SURFACE
      ?auto_707 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_705 ?auto_710 ) ( SURFACE-AT ?auto_703 ?auto_710 ) ( IS-CRATE ?auto_704 ) ( not ( = ?auto_704 ?auto_703 ) ) ( IS-CRATE ?auto_708 ) ( not ( = ?auto_704 ?auto_708 ) ) ( not ( = ?auto_703 ?auto_708 ) ) ( SURFACE-AT ?auto_708 ?auto_710 ) ( ON ?auto_708 ?auto_703 ) ( IS-CRATE ?auto_706 ) ( not ( = ?auto_704 ?auto_706 ) ) ( not ( = ?auto_703 ?auto_706 ) ) ( not ( = ?auto_708 ?auto_706 ) ) ( SURFACE-AT ?auto_706 ?auto_710 ) ( ON ?auto_706 ?auto_708 ) ( CLEAR ?auto_706 ) ( not ( = ?auto_712 ?auto_710 ) ) ( TRUCK-AT ?auto_709 ?auto_710 ) ( SURFACE-AT ?auto_711 ?auto_710 ) ( IS-CRATE ?auto_707 ) ( not ( = ?auto_704 ?auto_711 ) ) ( not ( = ?auto_704 ?auto_707 ) ) ( not ( = ?auto_703 ?auto_711 ) ) ( not ( = ?auto_703 ?auto_707 ) ) ( not ( = ?auto_708 ?auto_711 ) ) ( not ( = ?auto_708 ?auto_707 ) ) ( not ( = ?auto_706 ?auto_711 ) ) ( not ( = ?auto_706 ?auto_707 ) ) ( not ( = ?auto_711 ?auto_707 ) ) ( IN ?auto_707 ?auto_709 ) ( AVAILABLE ?auto_705 ) ( SURFACE-AT ?auto_704 ?auto_710 ) ( ON ?auto_704 ?auto_711 ) ( CLEAR ?auto_704 ) )
    :subtasks
    ( ( !LIFT ?auto_705 ?auto_704 ?auto_711 ?auto_710 )
      ( MAKE-ON ?auto_704 ?auto_703 )
      ( MAKE-ON-VERIFY ?auto_704 ?auto_703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_714 - SURFACE
      ?auto_713 - SURFACE
    )
    :vars
    (
      ?auto_718 - HOIST
      ?auto_716 - PLACE
      ?auto_715 - SURFACE
      ?auto_719 - SURFACE
      ?auto_720 - PLACE
      ?auto_717 - TRUCK
      ?auto_722 - SURFACE
      ?auto_721 - SURFACE
      ?auto_723 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_718 ?auto_716 ) ( SURFACE-AT ?auto_713 ?auto_716 ) ( IS-CRATE ?auto_714 ) ( not ( = ?auto_714 ?auto_713 ) ) ( IS-CRATE ?auto_715 ) ( not ( = ?auto_714 ?auto_715 ) ) ( not ( = ?auto_713 ?auto_715 ) ) ( SURFACE-AT ?auto_715 ?auto_716 ) ( ON ?auto_715 ?auto_713 ) ( IS-CRATE ?auto_719 ) ( not ( = ?auto_714 ?auto_719 ) ) ( not ( = ?auto_713 ?auto_719 ) ) ( not ( = ?auto_715 ?auto_719 ) ) ( SURFACE-AT ?auto_719 ?auto_716 ) ( ON ?auto_719 ?auto_715 ) ( CLEAR ?auto_719 ) ( not ( = ?auto_720 ?auto_716 ) ) ( TRUCK-AT ?auto_717 ?auto_716 ) ( SURFACE-AT ?auto_722 ?auto_716 ) ( IS-CRATE ?auto_721 ) ( not ( = ?auto_714 ?auto_722 ) ) ( not ( = ?auto_714 ?auto_721 ) ) ( not ( = ?auto_713 ?auto_722 ) ) ( not ( = ?auto_713 ?auto_721 ) ) ( not ( = ?auto_715 ?auto_722 ) ) ( not ( = ?auto_715 ?auto_721 ) ) ( not ( = ?auto_719 ?auto_722 ) ) ( not ( = ?auto_719 ?auto_721 ) ) ( not ( = ?auto_722 ?auto_721 ) ) ( IN ?auto_721 ?auto_717 ) ( SURFACE-AT ?auto_714 ?auto_716 ) ( ON ?auto_714 ?auto_722 ) ( CLEAR ?auto_714 ) ( LIFTING ?auto_718 ?auto_723 ) ( IS-CRATE ?auto_723 ) ( not ( = ?auto_714 ?auto_723 ) ) ( not ( = ?auto_713 ?auto_723 ) ) ( not ( = ?auto_715 ?auto_723 ) ) ( not ( = ?auto_719 ?auto_723 ) ) ( not ( = ?auto_722 ?auto_723 ) ) ( not ( = ?auto_721 ?auto_723 ) ) )
    :subtasks
    ( ( !LOAD ?auto_718 ?auto_723 ?auto_717 ?auto_716 )
      ( MAKE-ON ?auto_714 ?auto_713 )
      ( MAKE-ON-VERIFY ?auto_714 ?auto_713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_725 - SURFACE
      ?auto_724 - SURFACE
    )
    :vars
    (
      ?auto_730 - HOIST
      ?auto_728 - PLACE
      ?auto_734 - SURFACE
      ?auto_732 - SURFACE
      ?auto_729 - PLACE
      ?auto_731 - TRUCK
      ?auto_727 - SURFACE
      ?auto_726 - SURFACE
      ?auto_733 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_730 ?auto_728 ) ( SURFACE-AT ?auto_724 ?auto_728 ) ( IS-CRATE ?auto_725 ) ( not ( = ?auto_725 ?auto_724 ) ) ( IS-CRATE ?auto_734 ) ( not ( = ?auto_725 ?auto_734 ) ) ( not ( = ?auto_724 ?auto_734 ) ) ( SURFACE-AT ?auto_734 ?auto_728 ) ( ON ?auto_734 ?auto_724 ) ( IS-CRATE ?auto_732 ) ( not ( = ?auto_725 ?auto_732 ) ) ( not ( = ?auto_724 ?auto_732 ) ) ( not ( = ?auto_734 ?auto_732 ) ) ( SURFACE-AT ?auto_732 ?auto_728 ) ( ON ?auto_732 ?auto_734 ) ( CLEAR ?auto_732 ) ( not ( = ?auto_729 ?auto_728 ) ) ( TRUCK-AT ?auto_731 ?auto_728 ) ( SURFACE-AT ?auto_727 ?auto_728 ) ( IS-CRATE ?auto_726 ) ( not ( = ?auto_725 ?auto_727 ) ) ( not ( = ?auto_725 ?auto_726 ) ) ( not ( = ?auto_724 ?auto_727 ) ) ( not ( = ?auto_724 ?auto_726 ) ) ( not ( = ?auto_734 ?auto_727 ) ) ( not ( = ?auto_734 ?auto_726 ) ) ( not ( = ?auto_732 ?auto_727 ) ) ( not ( = ?auto_732 ?auto_726 ) ) ( not ( = ?auto_727 ?auto_726 ) ) ( IN ?auto_726 ?auto_731 ) ( SURFACE-AT ?auto_725 ?auto_728 ) ( ON ?auto_725 ?auto_727 ) ( IS-CRATE ?auto_733 ) ( not ( = ?auto_725 ?auto_733 ) ) ( not ( = ?auto_724 ?auto_733 ) ) ( not ( = ?auto_734 ?auto_733 ) ) ( not ( = ?auto_732 ?auto_733 ) ) ( not ( = ?auto_727 ?auto_733 ) ) ( not ( = ?auto_726 ?auto_733 ) ) ( AVAILABLE ?auto_730 ) ( SURFACE-AT ?auto_733 ?auto_728 ) ( ON ?auto_733 ?auto_725 ) ( CLEAR ?auto_733 ) )
    :subtasks
    ( ( !LIFT ?auto_730 ?auto_733 ?auto_725 ?auto_728 )
      ( MAKE-ON ?auto_725 ?auto_724 )
      ( MAKE-ON-VERIFY ?auto_725 ?auto_724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_736 - SURFACE
      ?auto_735 - SURFACE
    )
    :vars
    (
      ?auto_742 - HOIST
      ?auto_744 - PLACE
      ?auto_738 - SURFACE
      ?auto_740 - SURFACE
      ?auto_743 - PLACE
      ?auto_741 - SURFACE
      ?auto_745 - SURFACE
      ?auto_737 - TRUCK
      ?auto_739 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_742 ?auto_744 ) ( SURFACE-AT ?auto_735 ?auto_744 ) ( IS-CRATE ?auto_736 ) ( not ( = ?auto_736 ?auto_735 ) ) ( IS-CRATE ?auto_738 ) ( not ( = ?auto_736 ?auto_738 ) ) ( not ( = ?auto_735 ?auto_738 ) ) ( SURFACE-AT ?auto_738 ?auto_744 ) ( ON ?auto_738 ?auto_735 ) ( IS-CRATE ?auto_740 ) ( not ( = ?auto_736 ?auto_740 ) ) ( not ( = ?auto_735 ?auto_740 ) ) ( not ( = ?auto_738 ?auto_740 ) ) ( SURFACE-AT ?auto_740 ?auto_744 ) ( ON ?auto_740 ?auto_738 ) ( CLEAR ?auto_740 ) ( not ( = ?auto_743 ?auto_744 ) ) ( SURFACE-AT ?auto_741 ?auto_744 ) ( IS-CRATE ?auto_745 ) ( not ( = ?auto_736 ?auto_741 ) ) ( not ( = ?auto_736 ?auto_745 ) ) ( not ( = ?auto_735 ?auto_741 ) ) ( not ( = ?auto_735 ?auto_745 ) ) ( not ( = ?auto_738 ?auto_741 ) ) ( not ( = ?auto_738 ?auto_745 ) ) ( not ( = ?auto_740 ?auto_741 ) ) ( not ( = ?auto_740 ?auto_745 ) ) ( not ( = ?auto_741 ?auto_745 ) ) ( IN ?auto_745 ?auto_737 ) ( SURFACE-AT ?auto_736 ?auto_744 ) ( ON ?auto_736 ?auto_741 ) ( IS-CRATE ?auto_739 ) ( not ( = ?auto_736 ?auto_739 ) ) ( not ( = ?auto_735 ?auto_739 ) ) ( not ( = ?auto_738 ?auto_739 ) ) ( not ( = ?auto_740 ?auto_739 ) ) ( not ( = ?auto_741 ?auto_739 ) ) ( not ( = ?auto_745 ?auto_739 ) ) ( AVAILABLE ?auto_742 ) ( SURFACE-AT ?auto_739 ?auto_744 ) ( ON ?auto_739 ?auto_736 ) ( CLEAR ?auto_739 ) ( TRUCK-AT ?auto_737 ?auto_743 ) )
    :subtasks
    ( ( !DRIVE ?auto_737 ?auto_743 ?auto_744 )
      ( MAKE-ON ?auto_736 ?auto_735 )
      ( MAKE-ON-VERIFY ?auto_736 ?auto_735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_747 - SURFACE
      ?auto_746 - SURFACE
    )
    :vars
    (
      ?auto_755 - HOIST
      ?auto_751 - PLACE
      ?auto_753 - SURFACE
      ?auto_754 - SURFACE
      ?auto_756 - PLACE
      ?auto_748 - SURFACE
      ?auto_750 - SURFACE
      ?auto_752 - SURFACE
      ?auto_749 - TRUCK
      ?auto_757 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_755 ?auto_751 ) ( SURFACE-AT ?auto_746 ?auto_751 ) ( IS-CRATE ?auto_747 ) ( not ( = ?auto_747 ?auto_746 ) ) ( IS-CRATE ?auto_753 ) ( not ( = ?auto_747 ?auto_753 ) ) ( not ( = ?auto_746 ?auto_753 ) ) ( SURFACE-AT ?auto_753 ?auto_751 ) ( ON ?auto_753 ?auto_746 ) ( IS-CRATE ?auto_754 ) ( not ( = ?auto_747 ?auto_754 ) ) ( not ( = ?auto_746 ?auto_754 ) ) ( not ( = ?auto_753 ?auto_754 ) ) ( SURFACE-AT ?auto_754 ?auto_751 ) ( ON ?auto_754 ?auto_753 ) ( CLEAR ?auto_754 ) ( not ( = ?auto_756 ?auto_751 ) ) ( SURFACE-AT ?auto_748 ?auto_751 ) ( IS-CRATE ?auto_750 ) ( not ( = ?auto_747 ?auto_748 ) ) ( not ( = ?auto_747 ?auto_750 ) ) ( not ( = ?auto_746 ?auto_748 ) ) ( not ( = ?auto_746 ?auto_750 ) ) ( not ( = ?auto_753 ?auto_748 ) ) ( not ( = ?auto_753 ?auto_750 ) ) ( not ( = ?auto_754 ?auto_748 ) ) ( not ( = ?auto_754 ?auto_750 ) ) ( not ( = ?auto_748 ?auto_750 ) ) ( SURFACE-AT ?auto_747 ?auto_751 ) ( ON ?auto_747 ?auto_748 ) ( IS-CRATE ?auto_752 ) ( not ( = ?auto_747 ?auto_752 ) ) ( not ( = ?auto_746 ?auto_752 ) ) ( not ( = ?auto_753 ?auto_752 ) ) ( not ( = ?auto_754 ?auto_752 ) ) ( not ( = ?auto_748 ?auto_752 ) ) ( not ( = ?auto_750 ?auto_752 ) ) ( AVAILABLE ?auto_755 ) ( SURFACE-AT ?auto_752 ?auto_751 ) ( ON ?auto_752 ?auto_747 ) ( CLEAR ?auto_752 ) ( TRUCK-AT ?auto_749 ?auto_756 ) ( HOIST-AT ?auto_757 ?auto_756 ) ( LIFTING ?auto_757 ?auto_750 ) ( not ( = ?auto_755 ?auto_757 ) ) )
    :subtasks
    ( ( !LOAD ?auto_757 ?auto_750 ?auto_749 ?auto_756 )
      ( MAKE-ON ?auto_747 ?auto_746 )
      ( MAKE-ON-VERIFY ?auto_747 ?auto_746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_759 - SURFACE
      ?auto_758 - SURFACE
    )
    :vars
    (
      ?auto_769 - HOIST
      ?auto_765 - PLACE
      ?auto_767 - SURFACE
      ?auto_761 - SURFACE
      ?auto_763 - PLACE
      ?auto_768 - SURFACE
      ?auto_766 - SURFACE
      ?auto_764 - SURFACE
      ?auto_762 - TRUCK
      ?auto_760 - HOIST
      ?auto_770 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_769 ?auto_765 ) ( SURFACE-AT ?auto_758 ?auto_765 ) ( IS-CRATE ?auto_759 ) ( not ( = ?auto_759 ?auto_758 ) ) ( IS-CRATE ?auto_767 ) ( not ( = ?auto_759 ?auto_767 ) ) ( not ( = ?auto_758 ?auto_767 ) ) ( SURFACE-AT ?auto_767 ?auto_765 ) ( ON ?auto_767 ?auto_758 ) ( IS-CRATE ?auto_761 ) ( not ( = ?auto_759 ?auto_761 ) ) ( not ( = ?auto_758 ?auto_761 ) ) ( not ( = ?auto_767 ?auto_761 ) ) ( SURFACE-AT ?auto_761 ?auto_765 ) ( ON ?auto_761 ?auto_767 ) ( CLEAR ?auto_761 ) ( not ( = ?auto_763 ?auto_765 ) ) ( SURFACE-AT ?auto_768 ?auto_765 ) ( IS-CRATE ?auto_766 ) ( not ( = ?auto_759 ?auto_768 ) ) ( not ( = ?auto_759 ?auto_766 ) ) ( not ( = ?auto_758 ?auto_768 ) ) ( not ( = ?auto_758 ?auto_766 ) ) ( not ( = ?auto_767 ?auto_768 ) ) ( not ( = ?auto_767 ?auto_766 ) ) ( not ( = ?auto_761 ?auto_768 ) ) ( not ( = ?auto_761 ?auto_766 ) ) ( not ( = ?auto_768 ?auto_766 ) ) ( SURFACE-AT ?auto_759 ?auto_765 ) ( ON ?auto_759 ?auto_768 ) ( IS-CRATE ?auto_764 ) ( not ( = ?auto_759 ?auto_764 ) ) ( not ( = ?auto_758 ?auto_764 ) ) ( not ( = ?auto_767 ?auto_764 ) ) ( not ( = ?auto_761 ?auto_764 ) ) ( not ( = ?auto_768 ?auto_764 ) ) ( not ( = ?auto_766 ?auto_764 ) ) ( AVAILABLE ?auto_769 ) ( SURFACE-AT ?auto_764 ?auto_765 ) ( ON ?auto_764 ?auto_759 ) ( CLEAR ?auto_764 ) ( TRUCK-AT ?auto_762 ?auto_763 ) ( HOIST-AT ?auto_760 ?auto_763 ) ( not ( = ?auto_769 ?auto_760 ) ) ( AVAILABLE ?auto_760 ) ( SURFACE-AT ?auto_766 ?auto_763 ) ( ON ?auto_766 ?auto_770 ) ( CLEAR ?auto_766 ) ( not ( = ?auto_759 ?auto_770 ) ) ( not ( = ?auto_758 ?auto_770 ) ) ( not ( = ?auto_767 ?auto_770 ) ) ( not ( = ?auto_761 ?auto_770 ) ) ( not ( = ?auto_768 ?auto_770 ) ) ( not ( = ?auto_766 ?auto_770 ) ) ( not ( = ?auto_764 ?auto_770 ) ) )
    :subtasks
    ( ( !LIFT ?auto_760 ?auto_766 ?auto_770 ?auto_763 )
      ( MAKE-ON ?auto_759 ?auto_758 )
      ( MAKE-ON-VERIFY ?auto_759 ?auto_758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_774 - SURFACE
      ?auto_773 - SURFACE
    )
    :vars
    (
      ?auto_775 - HOIST
      ?auto_776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_775 ?auto_776 ) ( SURFACE-AT ?auto_773 ?auto_776 ) ( CLEAR ?auto_773 ) ( LIFTING ?auto_775 ?auto_774 ) ( IS-CRATE ?auto_774 ) ( not ( = ?auto_774 ?auto_773 ) ) )
    :subtasks
    ( ( !DROP ?auto_775 ?auto_774 ?auto_773 ?auto_776 )
      ( MAKE-ON-VERIFY ?auto_774 ?auto_773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_778 - SURFACE
      ?auto_777 - SURFACE
    )
    :vars
    (
      ?auto_779 - HOIST
      ?auto_780 - PLACE
      ?auto_781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_779 ?auto_780 ) ( SURFACE-AT ?auto_777 ?auto_780 ) ( CLEAR ?auto_777 ) ( IS-CRATE ?auto_778 ) ( not ( = ?auto_778 ?auto_777 ) ) ( TRUCK-AT ?auto_781 ?auto_780 ) ( AVAILABLE ?auto_779 ) ( IN ?auto_778 ?auto_781 ) )
    :subtasks
    ( ( !UNLOAD ?auto_779 ?auto_778 ?auto_781 ?auto_780 )
      ( MAKE-ON ?auto_778 ?auto_777 )
      ( MAKE-ON-VERIFY ?auto_778 ?auto_777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_783 - SURFACE
      ?auto_782 - SURFACE
    )
    :vars
    (
      ?auto_784 - HOIST
      ?auto_786 - PLACE
      ?auto_785 - TRUCK
      ?auto_787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_784 ?auto_786 ) ( IS-CRATE ?auto_783 ) ( not ( = ?auto_783 ?auto_782 ) ) ( TRUCK-AT ?auto_785 ?auto_786 ) ( IN ?auto_783 ?auto_785 ) ( SURFACE-AT ?auto_787 ?auto_786 ) ( CLEAR ?auto_787 ) ( LIFTING ?auto_784 ?auto_782 ) ( IS-CRATE ?auto_782 ) ( not ( = ?auto_783 ?auto_787 ) ) ( not ( = ?auto_782 ?auto_787 ) ) )
    :subtasks
    ( ( !DROP ?auto_784 ?auto_782 ?auto_787 ?auto_786 )
      ( MAKE-ON ?auto_783 ?auto_782 )
      ( MAKE-ON-VERIFY ?auto_783 ?auto_782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_789 - SURFACE
      ?auto_788 - SURFACE
    )
    :vars
    (
      ?auto_791 - HOIST
      ?auto_793 - PLACE
      ?auto_792 - TRUCK
      ?auto_790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_791 ?auto_793 ) ( IS-CRATE ?auto_789 ) ( not ( = ?auto_789 ?auto_788 ) ) ( TRUCK-AT ?auto_792 ?auto_793 ) ( IN ?auto_789 ?auto_792 ) ( SURFACE-AT ?auto_790 ?auto_793 ) ( CLEAR ?auto_790 ) ( IS-CRATE ?auto_788 ) ( not ( = ?auto_789 ?auto_790 ) ) ( not ( = ?auto_788 ?auto_790 ) ) ( AVAILABLE ?auto_791 ) ( IN ?auto_788 ?auto_792 ) )
    :subtasks
    ( ( !UNLOAD ?auto_791 ?auto_788 ?auto_792 ?auto_793 )
      ( MAKE-ON ?auto_789 ?auto_788 )
      ( MAKE-ON-VERIFY ?auto_789 ?auto_788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_795 - SURFACE
      ?auto_794 - SURFACE
    )
    :vars
    (
      ?auto_796 - HOIST
      ?auto_798 - PLACE
      ?auto_797 - TRUCK
      ?auto_799 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_796 ?auto_798 ) ( IS-CRATE ?auto_795 ) ( not ( = ?auto_795 ?auto_794 ) ) ( TRUCK-AT ?auto_797 ?auto_798 ) ( SURFACE-AT ?auto_799 ?auto_798 ) ( CLEAR ?auto_799 ) ( IS-CRATE ?auto_794 ) ( not ( = ?auto_795 ?auto_799 ) ) ( not ( = ?auto_794 ?auto_799 ) ) ( IN ?auto_794 ?auto_797 ) ( LIFTING ?auto_796 ?auto_795 ) )
    :subtasks
    ( ( !LOAD ?auto_796 ?auto_795 ?auto_797 ?auto_798 )
      ( MAKE-ON ?auto_795 ?auto_794 )
      ( MAKE-ON-VERIFY ?auto_795 ?auto_794 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_801 - SURFACE
      ?auto_800 - SURFACE
    )
    :vars
    (
      ?auto_805 - HOIST
      ?auto_802 - PLACE
      ?auto_803 - TRUCK
      ?auto_804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_805 ?auto_802 ) ( IS-CRATE ?auto_801 ) ( not ( = ?auto_801 ?auto_800 ) ) ( TRUCK-AT ?auto_803 ?auto_802 ) ( SURFACE-AT ?auto_804 ?auto_802 ) ( IS-CRATE ?auto_800 ) ( not ( = ?auto_801 ?auto_804 ) ) ( not ( = ?auto_800 ?auto_804 ) ) ( IN ?auto_800 ?auto_803 ) ( AVAILABLE ?auto_805 ) ( SURFACE-AT ?auto_801 ?auto_802 ) ( ON ?auto_801 ?auto_804 ) ( CLEAR ?auto_801 ) )
    :subtasks
    ( ( !LIFT ?auto_805 ?auto_801 ?auto_804 ?auto_802 )
      ( MAKE-ON ?auto_801 ?auto_800 )
      ( MAKE-ON-VERIFY ?auto_801 ?auto_800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_807 - SURFACE
      ?auto_806 - SURFACE
    )
    :vars
    (
      ?auto_809 - HOIST
      ?auto_808 - PLACE
      ?auto_811 - TRUCK
      ?auto_810 - SURFACE
      ?auto_812 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_809 ?auto_808 ) ( IS-CRATE ?auto_807 ) ( not ( = ?auto_807 ?auto_806 ) ) ( TRUCK-AT ?auto_811 ?auto_808 ) ( SURFACE-AT ?auto_810 ?auto_808 ) ( IS-CRATE ?auto_806 ) ( not ( = ?auto_807 ?auto_810 ) ) ( not ( = ?auto_806 ?auto_810 ) ) ( IN ?auto_806 ?auto_811 ) ( SURFACE-AT ?auto_807 ?auto_808 ) ( ON ?auto_807 ?auto_810 ) ( CLEAR ?auto_807 ) ( LIFTING ?auto_809 ?auto_812 ) ( IS-CRATE ?auto_812 ) ( not ( = ?auto_807 ?auto_812 ) ) ( not ( = ?auto_806 ?auto_812 ) ) ( not ( = ?auto_810 ?auto_812 ) ) )
    :subtasks
    ( ( !LOAD ?auto_809 ?auto_812 ?auto_811 ?auto_808 )
      ( MAKE-ON ?auto_807 ?auto_806 )
      ( MAKE-ON-VERIFY ?auto_807 ?auto_806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_814 - SURFACE
      ?auto_813 - SURFACE
    )
    :vars
    (
      ?auto_816 - HOIST
      ?auto_815 - PLACE
      ?auto_818 - TRUCK
      ?auto_817 - SURFACE
      ?auto_819 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_816 ?auto_815 ) ( IS-CRATE ?auto_814 ) ( not ( = ?auto_814 ?auto_813 ) ) ( TRUCK-AT ?auto_818 ?auto_815 ) ( SURFACE-AT ?auto_817 ?auto_815 ) ( IS-CRATE ?auto_813 ) ( not ( = ?auto_814 ?auto_817 ) ) ( not ( = ?auto_813 ?auto_817 ) ) ( IN ?auto_813 ?auto_818 ) ( SURFACE-AT ?auto_814 ?auto_815 ) ( ON ?auto_814 ?auto_817 ) ( IS-CRATE ?auto_819 ) ( not ( = ?auto_814 ?auto_819 ) ) ( not ( = ?auto_813 ?auto_819 ) ) ( not ( = ?auto_817 ?auto_819 ) ) ( AVAILABLE ?auto_816 ) ( SURFACE-AT ?auto_819 ?auto_815 ) ( ON ?auto_819 ?auto_814 ) ( CLEAR ?auto_819 ) )
    :subtasks
    ( ( !LIFT ?auto_816 ?auto_819 ?auto_814 ?auto_815 )
      ( MAKE-ON ?auto_814 ?auto_813 )
      ( MAKE-ON-VERIFY ?auto_814 ?auto_813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_821 - SURFACE
      ?auto_820 - SURFACE
    )
    :vars
    (
      ?auto_823 - HOIST
      ?auto_822 - PLACE
      ?auto_825 - SURFACE
      ?auto_826 - TRUCK
      ?auto_824 - SURFACE
      ?auto_827 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_823 ?auto_822 ) ( IS-CRATE ?auto_821 ) ( not ( = ?auto_821 ?auto_820 ) ) ( SURFACE-AT ?auto_825 ?auto_822 ) ( IS-CRATE ?auto_820 ) ( not ( = ?auto_821 ?auto_825 ) ) ( not ( = ?auto_820 ?auto_825 ) ) ( IN ?auto_820 ?auto_826 ) ( SURFACE-AT ?auto_821 ?auto_822 ) ( ON ?auto_821 ?auto_825 ) ( IS-CRATE ?auto_824 ) ( not ( = ?auto_821 ?auto_824 ) ) ( not ( = ?auto_820 ?auto_824 ) ) ( not ( = ?auto_825 ?auto_824 ) ) ( AVAILABLE ?auto_823 ) ( SURFACE-AT ?auto_824 ?auto_822 ) ( ON ?auto_824 ?auto_821 ) ( CLEAR ?auto_824 ) ( TRUCK-AT ?auto_826 ?auto_827 ) ( not ( = ?auto_827 ?auto_822 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_826 ?auto_827 ?auto_822 )
      ( MAKE-ON ?auto_821 ?auto_820 )
      ( MAKE-ON-VERIFY ?auto_821 ?auto_820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_845 - SURFACE
      ?auto_844 - SURFACE
    )
    :vars
    (
      ?auto_847 - HOIST
      ?auto_851 - PLACE
      ?auto_849 - SURFACE
      ?auto_846 - TRUCK
      ?auto_848 - SURFACE
      ?auto_850 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847 ?auto_851 ) ( IS-CRATE ?auto_845 ) ( not ( = ?auto_845 ?auto_844 ) ) ( SURFACE-AT ?auto_849 ?auto_851 ) ( IS-CRATE ?auto_844 ) ( not ( = ?auto_845 ?auto_849 ) ) ( not ( = ?auto_844 ?auto_849 ) ) ( IN ?auto_844 ?auto_846 ) ( SURFACE-AT ?auto_845 ?auto_851 ) ( ON ?auto_845 ?auto_849 ) ( IS-CRATE ?auto_848 ) ( not ( = ?auto_845 ?auto_848 ) ) ( not ( = ?auto_844 ?auto_848 ) ) ( not ( = ?auto_849 ?auto_848 ) ) ( AVAILABLE ?auto_847 ) ( SURFACE-AT ?auto_848 ?auto_851 ) ( ON ?auto_848 ?auto_845 ) ( CLEAR ?auto_848 ) ( not ( = ?auto_850 ?auto_851 ) ) ( TRUCK-AT ?auto_846 ?auto_851 ) )
    :subtasks
    ( ( !DRIVE ?auto_846 ?auto_851 ?auto_850 )
      ( MAKE-ON ?auto_845 ?auto_844 )
      ( MAKE-ON-VERIFY ?auto_845 ?auto_844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_853 - SURFACE
      ?auto_852 - SURFACE
    )
    :vars
    (
      ?auto_854 - HOIST
      ?auto_857 - PLACE
      ?auto_858 - SURFACE
      ?auto_859 - TRUCK
      ?auto_856 - SURFACE
      ?auto_855 - PLACE
      ?auto_861 - SURFACE
      ?auto_860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854 ?auto_857 ) ( IS-CRATE ?auto_853 ) ( not ( = ?auto_853 ?auto_852 ) ) ( SURFACE-AT ?auto_858 ?auto_857 ) ( IS-CRATE ?auto_852 ) ( not ( = ?auto_853 ?auto_858 ) ) ( not ( = ?auto_852 ?auto_858 ) ) ( IN ?auto_852 ?auto_859 ) ( SURFACE-AT ?auto_853 ?auto_857 ) ( ON ?auto_853 ?auto_858 ) ( IS-CRATE ?auto_856 ) ( not ( = ?auto_853 ?auto_856 ) ) ( not ( = ?auto_852 ?auto_856 ) ) ( not ( = ?auto_858 ?auto_856 ) ) ( SURFACE-AT ?auto_856 ?auto_857 ) ( ON ?auto_856 ?auto_853 ) ( CLEAR ?auto_856 ) ( not ( = ?auto_855 ?auto_857 ) ) ( TRUCK-AT ?auto_859 ?auto_857 ) ( SURFACE-AT ?auto_861 ?auto_857 ) ( CLEAR ?auto_861 ) ( LIFTING ?auto_854 ?auto_860 ) ( IS-CRATE ?auto_860 ) ( not ( = ?auto_853 ?auto_861 ) ) ( not ( = ?auto_853 ?auto_860 ) ) ( not ( = ?auto_852 ?auto_861 ) ) ( not ( = ?auto_852 ?auto_860 ) ) ( not ( = ?auto_858 ?auto_861 ) ) ( not ( = ?auto_858 ?auto_860 ) ) ( not ( = ?auto_856 ?auto_861 ) ) ( not ( = ?auto_856 ?auto_860 ) ) ( not ( = ?auto_861 ?auto_860 ) ) )
    :subtasks
    ( ( !DROP ?auto_854 ?auto_860 ?auto_861 ?auto_857 )
      ( MAKE-ON ?auto_853 ?auto_852 )
      ( MAKE-ON-VERIFY ?auto_853 ?auto_852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_863 - SURFACE
      ?auto_862 - SURFACE
    )
    :vars
    (
      ?auto_864 - HOIST
      ?auto_868 - PLACE
      ?auto_866 - SURFACE
      ?auto_869 - TRUCK
      ?auto_865 - SURFACE
      ?auto_867 - PLACE
      ?auto_870 - SURFACE
      ?auto_871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_864 ?auto_868 ) ( IS-CRATE ?auto_863 ) ( not ( = ?auto_863 ?auto_862 ) ) ( SURFACE-AT ?auto_866 ?auto_868 ) ( IS-CRATE ?auto_862 ) ( not ( = ?auto_863 ?auto_866 ) ) ( not ( = ?auto_862 ?auto_866 ) ) ( IN ?auto_862 ?auto_869 ) ( SURFACE-AT ?auto_863 ?auto_868 ) ( ON ?auto_863 ?auto_866 ) ( IS-CRATE ?auto_865 ) ( not ( = ?auto_863 ?auto_865 ) ) ( not ( = ?auto_862 ?auto_865 ) ) ( not ( = ?auto_866 ?auto_865 ) ) ( SURFACE-AT ?auto_865 ?auto_868 ) ( ON ?auto_865 ?auto_863 ) ( CLEAR ?auto_865 ) ( not ( = ?auto_867 ?auto_868 ) ) ( TRUCK-AT ?auto_869 ?auto_868 ) ( SURFACE-AT ?auto_870 ?auto_868 ) ( CLEAR ?auto_870 ) ( IS-CRATE ?auto_871 ) ( not ( = ?auto_863 ?auto_870 ) ) ( not ( = ?auto_863 ?auto_871 ) ) ( not ( = ?auto_862 ?auto_870 ) ) ( not ( = ?auto_862 ?auto_871 ) ) ( not ( = ?auto_866 ?auto_870 ) ) ( not ( = ?auto_866 ?auto_871 ) ) ( not ( = ?auto_865 ?auto_870 ) ) ( not ( = ?auto_865 ?auto_871 ) ) ( not ( = ?auto_870 ?auto_871 ) ) ( AVAILABLE ?auto_864 ) ( IN ?auto_871 ?auto_869 ) )
    :subtasks
    ( ( !UNLOAD ?auto_864 ?auto_871 ?auto_869 ?auto_868 )
      ( MAKE-ON ?auto_863 ?auto_862 )
      ( MAKE-ON-VERIFY ?auto_863 ?auto_862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_873 - SURFACE
      ?auto_872 - SURFACE
    )
    :vars
    (
      ?auto_877 - HOIST
      ?auto_878 - PLACE
      ?auto_880 - SURFACE
      ?auto_879 - SURFACE
      ?auto_874 - PLACE
      ?auto_876 - TRUCK
      ?auto_881 - SURFACE
      ?auto_875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_877 ?auto_878 ) ( IS-CRATE ?auto_873 ) ( not ( = ?auto_873 ?auto_872 ) ) ( SURFACE-AT ?auto_880 ?auto_878 ) ( IS-CRATE ?auto_872 ) ( not ( = ?auto_873 ?auto_880 ) ) ( not ( = ?auto_872 ?auto_880 ) ) ( SURFACE-AT ?auto_873 ?auto_878 ) ( ON ?auto_873 ?auto_880 ) ( IS-CRATE ?auto_879 ) ( not ( = ?auto_873 ?auto_879 ) ) ( not ( = ?auto_872 ?auto_879 ) ) ( not ( = ?auto_880 ?auto_879 ) ) ( SURFACE-AT ?auto_879 ?auto_878 ) ( ON ?auto_879 ?auto_873 ) ( CLEAR ?auto_879 ) ( not ( = ?auto_874 ?auto_878 ) ) ( TRUCK-AT ?auto_876 ?auto_878 ) ( SURFACE-AT ?auto_881 ?auto_878 ) ( CLEAR ?auto_881 ) ( IS-CRATE ?auto_875 ) ( not ( = ?auto_873 ?auto_881 ) ) ( not ( = ?auto_873 ?auto_875 ) ) ( not ( = ?auto_872 ?auto_881 ) ) ( not ( = ?auto_872 ?auto_875 ) ) ( not ( = ?auto_880 ?auto_881 ) ) ( not ( = ?auto_880 ?auto_875 ) ) ( not ( = ?auto_879 ?auto_881 ) ) ( not ( = ?auto_879 ?auto_875 ) ) ( not ( = ?auto_881 ?auto_875 ) ) ( IN ?auto_875 ?auto_876 ) ( LIFTING ?auto_877 ?auto_872 ) )
    :subtasks
    ( ( !LOAD ?auto_877 ?auto_872 ?auto_876 ?auto_878 )
      ( MAKE-ON ?auto_873 ?auto_872 )
      ( MAKE-ON-VERIFY ?auto_873 ?auto_872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_883 - SURFACE
      ?auto_882 - SURFACE
    )
    :vars
    (
      ?auto_885 - HOIST
      ?auto_887 - PLACE
      ?auto_889 - SURFACE
      ?auto_886 - SURFACE
      ?auto_891 - PLACE
      ?auto_888 - TRUCK
      ?auto_890 - SURFACE
      ?auto_884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_885 ?auto_887 ) ( IS-CRATE ?auto_883 ) ( not ( = ?auto_883 ?auto_882 ) ) ( SURFACE-AT ?auto_889 ?auto_887 ) ( IS-CRATE ?auto_882 ) ( not ( = ?auto_883 ?auto_889 ) ) ( not ( = ?auto_882 ?auto_889 ) ) ( SURFACE-AT ?auto_883 ?auto_887 ) ( ON ?auto_883 ?auto_889 ) ( IS-CRATE ?auto_886 ) ( not ( = ?auto_883 ?auto_886 ) ) ( not ( = ?auto_882 ?auto_886 ) ) ( not ( = ?auto_889 ?auto_886 ) ) ( SURFACE-AT ?auto_886 ?auto_887 ) ( ON ?auto_886 ?auto_883 ) ( CLEAR ?auto_886 ) ( not ( = ?auto_891 ?auto_887 ) ) ( TRUCK-AT ?auto_888 ?auto_887 ) ( SURFACE-AT ?auto_890 ?auto_887 ) ( IS-CRATE ?auto_884 ) ( not ( = ?auto_883 ?auto_890 ) ) ( not ( = ?auto_883 ?auto_884 ) ) ( not ( = ?auto_882 ?auto_890 ) ) ( not ( = ?auto_882 ?auto_884 ) ) ( not ( = ?auto_889 ?auto_890 ) ) ( not ( = ?auto_889 ?auto_884 ) ) ( not ( = ?auto_886 ?auto_890 ) ) ( not ( = ?auto_886 ?auto_884 ) ) ( not ( = ?auto_890 ?auto_884 ) ) ( IN ?auto_884 ?auto_888 ) ( AVAILABLE ?auto_885 ) ( SURFACE-AT ?auto_882 ?auto_887 ) ( ON ?auto_882 ?auto_890 ) ( CLEAR ?auto_882 ) )
    :subtasks
    ( ( !LIFT ?auto_885 ?auto_882 ?auto_890 ?auto_887 )
      ( MAKE-ON ?auto_883 ?auto_882 )
      ( MAKE-ON-VERIFY ?auto_883 ?auto_882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_893 - SURFACE
      ?auto_892 - SURFACE
    )
    :vars
    (
      ?auto_901 - HOIST
      ?auto_898 - PLACE
      ?auto_900 - SURFACE
      ?auto_897 - SURFACE
      ?auto_895 - PLACE
      ?auto_899 - TRUCK
      ?auto_894 - SURFACE
      ?auto_896 - SURFACE
      ?auto_902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_901 ?auto_898 ) ( IS-CRATE ?auto_893 ) ( not ( = ?auto_893 ?auto_892 ) ) ( SURFACE-AT ?auto_900 ?auto_898 ) ( IS-CRATE ?auto_892 ) ( not ( = ?auto_893 ?auto_900 ) ) ( not ( = ?auto_892 ?auto_900 ) ) ( SURFACE-AT ?auto_893 ?auto_898 ) ( ON ?auto_893 ?auto_900 ) ( IS-CRATE ?auto_897 ) ( not ( = ?auto_893 ?auto_897 ) ) ( not ( = ?auto_892 ?auto_897 ) ) ( not ( = ?auto_900 ?auto_897 ) ) ( SURFACE-AT ?auto_897 ?auto_898 ) ( ON ?auto_897 ?auto_893 ) ( CLEAR ?auto_897 ) ( not ( = ?auto_895 ?auto_898 ) ) ( TRUCK-AT ?auto_899 ?auto_898 ) ( SURFACE-AT ?auto_894 ?auto_898 ) ( IS-CRATE ?auto_896 ) ( not ( = ?auto_893 ?auto_894 ) ) ( not ( = ?auto_893 ?auto_896 ) ) ( not ( = ?auto_892 ?auto_894 ) ) ( not ( = ?auto_892 ?auto_896 ) ) ( not ( = ?auto_900 ?auto_894 ) ) ( not ( = ?auto_900 ?auto_896 ) ) ( not ( = ?auto_897 ?auto_894 ) ) ( not ( = ?auto_897 ?auto_896 ) ) ( not ( = ?auto_894 ?auto_896 ) ) ( IN ?auto_896 ?auto_899 ) ( SURFACE-AT ?auto_892 ?auto_898 ) ( ON ?auto_892 ?auto_894 ) ( CLEAR ?auto_892 ) ( LIFTING ?auto_901 ?auto_902 ) ( IS-CRATE ?auto_902 ) ( not ( = ?auto_893 ?auto_902 ) ) ( not ( = ?auto_892 ?auto_902 ) ) ( not ( = ?auto_900 ?auto_902 ) ) ( not ( = ?auto_897 ?auto_902 ) ) ( not ( = ?auto_894 ?auto_902 ) ) ( not ( = ?auto_896 ?auto_902 ) ) )
    :subtasks
    ( ( !LOAD ?auto_901 ?auto_902 ?auto_899 ?auto_898 )
      ( MAKE-ON ?auto_893 ?auto_892 )
      ( MAKE-ON-VERIFY ?auto_893 ?auto_892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_904 - SURFACE
      ?auto_903 - SURFACE
    )
    :vars
    (
      ?auto_911 - HOIST
      ?auto_905 - PLACE
      ?auto_913 - SURFACE
      ?auto_909 - SURFACE
      ?auto_907 - PLACE
      ?auto_908 - TRUCK
      ?auto_910 - SURFACE
      ?auto_906 - SURFACE
      ?auto_912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911 ?auto_905 ) ( IS-CRATE ?auto_904 ) ( not ( = ?auto_904 ?auto_903 ) ) ( SURFACE-AT ?auto_913 ?auto_905 ) ( IS-CRATE ?auto_903 ) ( not ( = ?auto_904 ?auto_913 ) ) ( not ( = ?auto_903 ?auto_913 ) ) ( SURFACE-AT ?auto_904 ?auto_905 ) ( ON ?auto_904 ?auto_913 ) ( IS-CRATE ?auto_909 ) ( not ( = ?auto_904 ?auto_909 ) ) ( not ( = ?auto_903 ?auto_909 ) ) ( not ( = ?auto_913 ?auto_909 ) ) ( SURFACE-AT ?auto_909 ?auto_905 ) ( ON ?auto_909 ?auto_904 ) ( CLEAR ?auto_909 ) ( not ( = ?auto_907 ?auto_905 ) ) ( TRUCK-AT ?auto_908 ?auto_905 ) ( SURFACE-AT ?auto_910 ?auto_905 ) ( IS-CRATE ?auto_906 ) ( not ( = ?auto_904 ?auto_910 ) ) ( not ( = ?auto_904 ?auto_906 ) ) ( not ( = ?auto_903 ?auto_910 ) ) ( not ( = ?auto_903 ?auto_906 ) ) ( not ( = ?auto_913 ?auto_910 ) ) ( not ( = ?auto_913 ?auto_906 ) ) ( not ( = ?auto_909 ?auto_910 ) ) ( not ( = ?auto_909 ?auto_906 ) ) ( not ( = ?auto_910 ?auto_906 ) ) ( IN ?auto_906 ?auto_908 ) ( SURFACE-AT ?auto_903 ?auto_905 ) ( ON ?auto_903 ?auto_910 ) ( IS-CRATE ?auto_912 ) ( not ( = ?auto_904 ?auto_912 ) ) ( not ( = ?auto_903 ?auto_912 ) ) ( not ( = ?auto_913 ?auto_912 ) ) ( not ( = ?auto_909 ?auto_912 ) ) ( not ( = ?auto_910 ?auto_912 ) ) ( not ( = ?auto_906 ?auto_912 ) ) ( AVAILABLE ?auto_911 ) ( SURFACE-AT ?auto_912 ?auto_905 ) ( ON ?auto_912 ?auto_903 ) ( CLEAR ?auto_912 ) )
    :subtasks
    ( ( !LIFT ?auto_911 ?auto_912 ?auto_903 ?auto_905 )
      ( MAKE-ON ?auto_904 ?auto_903 )
      ( MAKE-ON-VERIFY ?auto_904 ?auto_903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_915 - SURFACE
      ?auto_914 - SURFACE
    )
    :vars
    (
      ?auto_916 - HOIST
      ?auto_918 - PLACE
      ?auto_924 - SURFACE
      ?auto_917 - SURFACE
      ?auto_923 - PLACE
      ?auto_920 - SURFACE
      ?auto_921 - SURFACE
      ?auto_919 - TRUCK
      ?auto_922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_916 ?auto_918 ) ( IS-CRATE ?auto_915 ) ( not ( = ?auto_915 ?auto_914 ) ) ( SURFACE-AT ?auto_924 ?auto_918 ) ( IS-CRATE ?auto_914 ) ( not ( = ?auto_915 ?auto_924 ) ) ( not ( = ?auto_914 ?auto_924 ) ) ( SURFACE-AT ?auto_915 ?auto_918 ) ( ON ?auto_915 ?auto_924 ) ( IS-CRATE ?auto_917 ) ( not ( = ?auto_915 ?auto_917 ) ) ( not ( = ?auto_914 ?auto_917 ) ) ( not ( = ?auto_924 ?auto_917 ) ) ( SURFACE-AT ?auto_917 ?auto_918 ) ( ON ?auto_917 ?auto_915 ) ( CLEAR ?auto_917 ) ( not ( = ?auto_923 ?auto_918 ) ) ( SURFACE-AT ?auto_920 ?auto_918 ) ( IS-CRATE ?auto_921 ) ( not ( = ?auto_915 ?auto_920 ) ) ( not ( = ?auto_915 ?auto_921 ) ) ( not ( = ?auto_914 ?auto_920 ) ) ( not ( = ?auto_914 ?auto_921 ) ) ( not ( = ?auto_924 ?auto_920 ) ) ( not ( = ?auto_924 ?auto_921 ) ) ( not ( = ?auto_917 ?auto_920 ) ) ( not ( = ?auto_917 ?auto_921 ) ) ( not ( = ?auto_920 ?auto_921 ) ) ( IN ?auto_921 ?auto_919 ) ( SURFACE-AT ?auto_914 ?auto_918 ) ( ON ?auto_914 ?auto_920 ) ( IS-CRATE ?auto_922 ) ( not ( = ?auto_915 ?auto_922 ) ) ( not ( = ?auto_914 ?auto_922 ) ) ( not ( = ?auto_924 ?auto_922 ) ) ( not ( = ?auto_917 ?auto_922 ) ) ( not ( = ?auto_920 ?auto_922 ) ) ( not ( = ?auto_921 ?auto_922 ) ) ( AVAILABLE ?auto_916 ) ( SURFACE-AT ?auto_922 ?auto_918 ) ( ON ?auto_922 ?auto_914 ) ( CLEAR ?auto_922 ) ( TRUCK-AT ?auto_919 ?auto_923 ) )
    :subtasks
    ( ( !DRIVE ?auto_919 ?auto_923 ?auto_918 )
      ( MAKE-ON ?auto_915 ?auto_914 )
      ( MAKE-ON-VERIFY ?auto_915 ?auto_914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_926 - SURFACE
      ?auto_925 - SURFACE
    )
    :vars
    (
      ?auto_935 - HOIST
      ?auto_932 - PLACE
      ?auto_928 - SURFACE
      ?auto_929 - SURFACE
      ?auto_927 - PLACE
      ?auto_931 - SURFACE
      ?auto_934 - SURFACE
      ?auto_933 - SURFACE
      ?auto_930 - TRUCK
      ?auto_936 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_935 ?auto_932 ) ( IS-CRATE ?auto_926 ) ( not ( = ?auto_926 ?auto_925 ) ) ( SURFACE-AT ?auto_928 ?auto_932 ) ( IS-CRATE ?auto_925 ) ( not ( = ?auto_926 ?auto_928 ) ) ( not ( = ?auto_925 ?auto_928 ) ) ( SURFACE-AT ?auto_926 ?auto_932 ) ( ON ?auto_926 ?auto_928 ) ( IS-CRATE ?auto_929 ) ( not ( = ?auto_926 ?auto_929 ) ) ( not ( = ?auto_925 ?auto_929 ) ) ( not ( = ?auto_928 ?auto_929 ) ) ( SURFACE-AT ?auto_929 ?auto_932 ) ( ON ?auto_929 ?auto_926 ) ( CLEAR ?auto_929 ) ( not ( = ?auto_927 ?auto_932 ) ) ( SURFACE-AT ?auto_931 ?auto_932 ) ( IS-CRATE ?auto_934 ) ( not ( = ?auto_926 ?auto_931 ) ) ( not ( = ?auto_926 ?auto_934 ) ) ( not ( = ?auto_925 ?auto_931 ) ) ( not ( = ?auto_925 ?auto_934 ) ) ( not ( = ?auto_928 ?auto_931 ) ) ( not ( = ?auto_928 ?auto_934 ) ) ( not ( = ?auto_929 ?auto_931 ) ) ( not ( = ?auto_929 ?auto_934 ) ) ( not ( = ?auto_931 ?auto_934 ) ) ( SURFACE-AT ?auto_925 ?auto_932 ) ( ON ?auto_925 ?auto_931 ) ( IS-CRATE ?auto_933 ) ( not ( = ?auto_926 ?auto_933 ) ) ( not ( = ?auto_925 ?auto_933 ) ) ( not ( = ?auto_928 ?auto_933 ) ) ( not ( = ?auto_929 ?auto_933 ) ) ( not ( = ?auto_931 ?auto_933 ) ) ( not ( = ?auto_934 ?auto_933 ) ) ( AVAILABLE ?auto_935 ) ( SURFACE-AT ?auto_933 ?auto_932 ) ( ON ?auto_933 ?auto_925 ) ( CLEAR ?auto_933 ) ( TRUCK-AT ?auto_930 ?auto_927 ) ( HOIST-AT ?auto_936 ?auto_927 ) ( LIFTING ?auto_936 ?auto_934 ) ( not ( = ?auto_935 ?auto_936 ) ) )
    :subtasks
    ( ( !LOAD ?auto_936 ?auto_934 ?auto_930 ?auto_927 )
      ( MAKE-ON ?auto_926 ?auto_925 )
      ( MAKE-ON-VERIFY ?auto_926 ?auto_925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_938 - SURFACE
      ?auto_937 - SURFACE
    )
    :vars
    (
      ?auto_939 - HOIST
      ?auto_941 - PLACE
      ?auto_943 - SURFACE
      ?auto_946 - SURFACE
      ?auto_948 - PLACE
      ?auto_940 - SURFACE
      ?auto_945 - SURFACE
      ?auto_944 - SURFACE
      ?auto_942 - TRUCK
      ?auto_947 - HOIST
      ?auto_949 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939 ?auto_941 ) ( IS-CRATE ?auto_938 ) ( not ( = ?auto_938 ?auto_937 ) ) ( SURFACE-AT ?auto_943 ?auto_941 ) ( IS-CRATE ?auto_937 ) ( not ( = ?auto_938 ?auto_943 ) ) ( not ( = ?auto_937 ?auto_943 ) ) ( SURFACE-AT ?auto_938 ?auto_941 ) ( ON ?auto_938 ?auto_943 ) ( IS-CRATE ?auto_946 ) ( not ( = ?auto_938 ?auto_946 ) ) ( not ( = ?auto_937 ?auto_946 ) ) ( not ( = ?auto_943 ?auto_946 ) ) ( SURFACE-AT ?auto_946 ?auto_941 ) ( ON ?auto_946 ?auto_938 ) ( CLEAR ?auto_946 ) ( not ( = ?auto_948 ?auto_941 ) ) ( SURFACE-AT ?auto_940 ?auto_941 ) ( IS-CRATE ?auto_945 ) ( not ( = ?auto_938 ?auto_940 ) ) ( not ( = ?auto_938 ?auto_945 ) ) ( not ( = ?auto_937 ?auto_940 ) ) ( not ( = ?auto_937 ?auto_945 ) ) ( not ( = ?auto_943 ?auto_940 ) ) ( not ( = ?auto_943 ?auto_945 ) ) ( not ( = ?auto_946 ?auto_940 ) ) ( not ( = ?auto_946 ?auto_945 ) ) ( not ( = ?auto_940 ?auto_945 ) ) ( SURFACE-AT ?auto_937 ?auto_941 ) ( ON ?auto_937 ?auto_940 ) ( IS-CRATE ?auto_944 ) ( not ( = ?auto_938 ?auto_944 ) ) ( not ( = ?auto_937 ?auto_944 ) ) ( not ( = ?auto_943 ?auto_944 ) ) ( not ( = ?auto_946 ?auto_944 ) ) ( not ( = ?auto_940 ?auto_944 ) ) ( not ( = ?auto_945 ?auto_944 ) ) ( AVAILABLE ?auto_939 ) ( SURFACE-AT ?auto_944 ?auto_941 ) ( ON ?auto_944 ?auto_937 ) ( CLEAR ?auto_944 ) ( TRUCK-AT ?auto_942 ?auto_948 ) ( HOIST-AT ?auto_947 ?auto_948 ) ( not ( = ?auto_939 ?auto_947 ) ) ( AVAILABLE ?auto_947 ) ( SURFACE-AT ?auto_945 ?auto_948 ) ( ON ?auto_945 ?auto_949 ) ( CLEAR ?auto_945 ) ( not ( = ?auto_938 ?auto_949 ) ) ( not ( = ?auto_937 ?auto_949 ) ) ( not ( = ?auto_943 ?auto_949 ) ) ( not ( = ?auto_946 ?auto_949 ) ) ( not ( = ?auto_940 ?auto_949 ) ) ( not ( = ?auto_945 ?auto_949 ) ) ( not ( = ?auto_944 ?auto_949 ) ) )
    :subtasks
    ( ( !LIFT ?auto_947 ?auto_945 ?auto_949 ?auto_948 )
      ( MAKE-ON ?auto_938 ?auto_937 )
      ( MAKE-ON-VERIFY ?auto_938 ?auto_937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_953 - SURFACE
      ?auto_952 - SURFACE
    )
    :vars
    (
      ?auto_954 - HOIST
      ?auto_955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_954 ?auto_955 ) ( SURFACE-AT ?auto_952 ?auto_955 ) ( CLEAR ?auto_952 ) ( LIFTING ?auto_954 ?auto_953 ) ( IS-CRATE ?auto_953 ) ( not ( = ?auto_953 ?auto_952 ) ) )
    :subtasks
    ( ( !DROP ?auto_954 ?auto_953 ?auto_952 ?auto_955 )
      ( MAKE-ON-VERIFY ?auto_953 ?auto_952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_957 - SURFACE
      ?auto_956 - SURFACE
    )
    :vars
    (
      ?auto_958 - HOIST
      ?auto_959 - PLACE
      ?auto_960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_958 ?auto_959 ) ( SURFACE-AT ?auto_956 ?auto_959 ) ( CLEAR ?auto_956 ) ( IS-CRATE ?auto_957 ) ( not ( = ?auto_957 ?auto_956 ) ) ( TRUCK-AT ?auto_960 ?auto_959 ) ( AVAILABLE ?auto_958 ) ( IN ?auto_957 ?auto_960 ) )
    :subtasks
    ( ( !UNLOAD ?auto_958 ?auto_957 ?auto_960 ?auto_959 )
      ( MAKE-ON ?auto_957 ?auto_956 )
      ( MAKE-ON-VERIFY ?auto_957 ?auto_956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_962 - SURFACE
      ?auto_961 - SURFACE
    )
    :vars
    (
      ?auto_964 - HOIST
      ?auto_963 - PLACE
      ?auto_965 - TRUCK
      ?auto_966 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964 ?auto_963 ) ( IS-CRATE ?auto_962 ) ( not ( = ?auto_962 ?auto_961 ) ) ( TRUCK-AT ?auto_965 ?auto_963 ) ( IN ?auto_962 ?auto_965 ) ( SURFACE-AT ?auto_966 ?auto_963 ) ( CLEAR ?auto_966 ) ( LIFTING ?auto_964 ?auto_961 ) ( IS-CRATE ?auto_961 ) ( not ( = ?auto_962 ?auto_966 ) ) ( not ( = ?auto_961 ?auto_966 ) ) )
    :subtasks
    ( ( !DROP ?auto_964 ?auto_961 ?auto_966 ?auto_963 )
      ( MAKE-ON ?auto_962 ?auto_961 )
      ( MAKE-ON-VERIFY ?auto_962 ?auto_961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_968 - SURFACE
      ?auto_967 - SURFACE
    )
    :vars
    (
      ?auto_971 - HOIST
      ?auto_970 - PLACE
      ?auto_972 - TRUCK
      ?auto_969 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_971 ?auto_970 ) ( IS-CRATE ?auto_968 ) ( not ( = ?auto_968 ?auto_967 ) ) ( TRUCK-AT ?auto_972 ?auto_970 ) ( IN ?auto_968 ?auto_972 ) ( SURFACE-AT ?auto_969 ?auto_970 ) ( CLEAR ?auto_969 ) ( IS-CRATE ?auto_967 ) ( not ( = ?auto_968 ?auto_969 ) ) ( not ( = ?auto_967 ?auto_969 ) ) ( AVAILABLE ?auto_971 ) ( IN ?auto_967 ?auto_972 ) )
    :subtasks
    ( ( !UNLOAD ?auto_971 ?auto_967 ?auto_972 ?auto_970 )
      ( MAKE-ON ?auto_968 ?auto_967 )
      ( MAKE-ON-VERIFY ?auto_968 ?auto_967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_974 - SURFACE
      ?auto_973 - SURFACE
    )
    :vars
    (
      ?auto_976 - HOIST
      ?auto_975 - PLACE
      ?auto_977 - TRUCK
      ?auto_978 - SURFACE
      ?auto_979 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_976 ?auto_975 ) ( IS-CRATE ?auto_974 ) ( not ( = ?auto_974 ?auto_973 ) ) ( TRUCK-AT ?auto_977 ?auto_975 ) ( IN ?auto_974 ?auto_977 ) ( IS-CRATE ?auto_973 ) ( not ( = ?auto_974 ?auto_978 ) ) ( not ( = ?auto_973 ?auto_978 ) ) ( IN ?auto_973 ?auto_977 ) ( SURFACE-AT ?auto_979 ?auto_975 ) ( CLEAR ?auto_979 ) ( LIFTING ?auto_976 ?auto_978 ) ( IS-CRATE ?auto_978 ) ( not ( = ?auto_974 ?auto_979 ) ) ( not ( = ?auto_973 ?auto_979 ) ) ( not ( = ?auto_978 ?auto_979 ) ) )
    :subtasks
    ( ( !DROP ?auto_976 ?auto_978 ?auto_979 ?auto_975 )
      ( MAKE-ON ?auto_974 ?auto_973 )
      ( MAKE-ON-VERIFY ?auto_974 ?auto_973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_981 - SURFACE
      ?auto_980 - SURFACE
    )
    :vars
    (
      ?auto_984 - HOIST
      ?auto_986 - PLACE
      ?auto_983 - TRUCK
      ?auto_985 - SURFACE
      ?auto_982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_984 ?auto_986 ) ( IS-CRATE ?auto_981 ) ( not ( = ?auto_981 ?auto_980 ) ) ( TRUCK-AT ?auto_983 ?auto_986 ) ( IN ?auto_981 ?auto_983 ) ( IS-CRATE ?auto_980 ) ( not ( = ?auto_981 ?auto_985 ) ) ( not ( = ?auto_980 ?auto_985 ) ) ( IN ?auto_980 ?auto_983 ) ( SURFACE-AT ?auto_982 ?auto_986 ) ( CLEAR ?auto_982 ) ( IS-CRATE ?auto_985 ) ( not ( = ?auto_981 ?auto_982 ) ) ( not ( = ?auto_980 ?auto_982 ) ) ( not ( = ?auto_985 ?auto_982 ) ) ( AVAILABLE ?auto_984 ) ( IN ?auto_985 ?auto_983 ) )
    :subtasks
    ( ( !UNLOAD ?auto_984 ?auto_985 ?auto_983 ?auto_986 )
      ( MAKE-ON ?auto_981 ?auto_980 )
      ( MAKE-ON-VERIFY ?auto_981 ?auto_980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_988 - SURFACE
      ?auto_987 - SURFACE
    )
    :vars
    (
      ?auto_993 - HOIST
      ?auto_990 - PLACE
      ?auto_991 - TRUCK
      ?auto_992 - SURFACE
      ?auto_989 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_993 ?auto_990 ) ( IS-CRATE ?auto_988 ) ( not ( = ?auto_988 ?auto_987 ) ) ( TRUCK-AT ?auto_991 ?auto_990 ) ( IN ?auto_988 ?auto_991 ) ( IS-CRATE ?auto_987 ) ( not ( = ?auto_988 ?auto_992 ) ) ( not ( = ?auto_987 ?auto_992 ) ) ( SURFACE-AT ?auto_989 ?auto_990 ) ( CLEAR ?auto_989 ) ( IS-CRATE ?auto_992 ) ( not ( = ?auto_988 ?auto_989 ) ) ( not ( = ?auto_987 ?auto_989 ) ) ( not ( = ?auto_992 ?auto_989 ) ) ( IN ?auto_992 ?auto_991 ) ( LIFTING ?auto_993 ?auto_987 ) )
    :subtasks
    ( ( !LOAD ?auto_993 ?auto_987 ?auto_991 ?auto_990 )
      ( MAKE-ON ?auto_988 ?auto_987 )
      ( MAKE-ON-VERIFY ?auto_988 ?auto_987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_995 - SURFACE
      ?auto_994 - SURFACE
    )
    :vars
    (
      ?auto_996 - HOIST
      ?auto_1000 - PLACE
      ?auto_997 - TRUCK
      ?auto_998 - SURFACE
      ?auto_999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_996 ?auto_1000 ) ( IS-CRATE ?auto_995 ) ( not ( = ?auto_995 ?auto_994 ) ) ( TRUCK-AT ?auto_997 ?auto_1000 ) ( IN ?auto_995 ?auto_997 ) ( IS-CRATE ?auto_994 ) ( not ( = ?auto_995 ?auto_998 ) ) ( not ( = ?auto_994 ?auto_998 ) ) ( SURFACE-AT ?auto_999 ?auto_1000 ) ( IS-CRATE ?auto_998 ) ( not ( = ?auto_995 ?auto_999 ) ) ( not ( = ?auto_994 ?auto_999 ) ) ( not ( = ?auto_998 ?auto_999 ) ) ( IN ?auto_998 ?auto_997 ) ( AVAILABLE ?auto_996 ) ( SURFACE-AT ?auto_994 ?auto_1000 ) ( ON ?auto_994 ?auto_999 ) ( CLEAR ?auto_994 ) )
    :subtasks
    ( ( !LIFT ?auto_996 ?auto_994 ?auto_999 ?auto_1000 )
      ( MAKE-ON ?auto_995 ?auto_994 )
      ( MAKE-ON-VERIFY ?auto_995 ?auto_994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1002 - SURFACE
      ?auto_1001 - SURFACE
    )
    :vars
    (
      ?auto_1004 - HOIST
      ?auto_1003 - PLACE
      ?auto_1005 - TRUCK
      ?auto_1007 - SURFACE
      ?auto_1006 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1004 ?auto_1003 ) ( IS-CRATE ?auto_1002 ) ( not ( = ?auto_1002 ?auto_1001 ) ) ( TRUCK-AT ?auto_1005 ?auto_1003 ) ( IS-CRATE ?auto_1001 ) ( not ( = ?auto_1002 ?auto_1007 ) ) ( not ( = ?auto_1001 ?auto_1007 ) ) ( SURFACE-AT ?auto_1006 ?auto_1003 ) ( IS-CRATE ?auto_1007 ) ( not ( = ?auto_1002 ?auto_1006 ) ) ( not ( = ?auto_1001 ?auto_1006 ) ) ( not ( = ?auto_1007 ?auto_1006 ) ) ( IN ?auto_1007 ?auto_1005 ) ( SURFACE-AT ?auto_1001 ?auto_1003 ) ( ON ?auto_1001 ?auto_1006 ) ( CLEAR ?auto_1001 ) ( LIFTING ?auto_1004 ?auto_1002 ) )
    :subtasks
    ( ( !LOAD ?auto_1004 ?auto_1002 ?auto_1005 ?auto_1003 )
      ( MAKE-ON ?auto_1002 ?auto_1001 )
      ( MAKE-ON-VERIFY ?auto_1002 ?auto_1001 ) )
  )

)

