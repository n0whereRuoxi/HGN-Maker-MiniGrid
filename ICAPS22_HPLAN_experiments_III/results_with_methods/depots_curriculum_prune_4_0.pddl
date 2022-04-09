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
      ?auto_510 - PLACE
      ?auto_506 - HOIST
      ?auto_509 - SURFACE
      ?auto_514 - PLACE
      ?auto_512 - HOIST
      ?auto_513 - SURFACE
      ?auto_508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507 ?auto_511 ) ( IS-CRATE ?auto_505 ) ( not ( = ?auto_510 ?auto_511 ) ) ( HOIST-AT ?auto_506 ?auto_510 ) ( AVAILABLE ?auto_506 ) ( SURFACE-AT ?auto_505 ?auto_510 ) ( ON ?auto_505 ?auto_509 ) ( CLEAR ?auto_505 ) ( not ( = ?auto_504 ?auto_505 ) ) ( not ( = ?auto_504 ?auto_509 ) ) ( not ( = ?auto_505 ?auto_509 ) ) ( not ( = ?auto_507 ?auto_506 ) ) ( SURFACE-AT ?auto_503 ?auto_511 ) ( CLEAR ?auto_503 ) ( IS-CRATE ?auto_504 ) ( AVAILABLE ?auto_507 ) ( not ( = ?auto_514 ?auto_511 ) ) ( HOIST-AT ?auto_512 ?auto_514 ) ( AVAILABLE ?auto_512 ) ( SURFACE-AT ?auto_504 ?auto_514 ) ( ON ?auto_504 ?auto_513 ) ( CLEAR ?auto_504 ) ( TRUCK-AT ?auto_508 ?auto_511 ) ( not ( = ?auto_503 ?auto_504 ) ) ( not ( = ?auto_503 ?auto_513 ) ) ( not ( = ?auto_504 ?auto_513 ) ) ( not ( = ?auto_507 ?auto_512 ) ) ( not ( = ?auto_503 ?auto_505 ) ) ( not ( = ?auto_503 ?auto_509 ) ) ( not ( = ?auto_505 ?auto_513 ) ) ( not ( = ?auto_510 ?auto_514 ) ) ( not ( = ?auto_506 ?auto_512 ) ) ( not ( = ?auto_509 ?auto_513 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_503 ?auto_504 )
      ( MAKE-1CRATE ?auto_504 ?auto_505 )
      ( MAKE-2CRATE-VERIFY ?auto_503 ?auto_504 ?auto_505 ) )
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
      ?auto_538 - HOIST
      ?auto_537 - PLACE
      ?auto_533 - PLACE
      ?auto_535 - HOIST
      ?auto_534 - SURFACE
      ?auto_542 - PLACE
      ?auto_539 - HOIST
      ?auto_541 - SURFACE
      ?auto_544 - PLACE
      ?auto_540 - HOIST
      ?auto_543 - SURFACE
      ?auto_536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_538 ?auto_537 ) ( IS-CRATE ?auto_532 ) ( not ( = ?auto_533 ?auto_537 ) ) ( HOIST-AT ?auto_535 ?auto_533 ) ( AVAILABLE ?auto_535 ) ( SURFACE-AT ?auto_532 ?auto_533 ) ( ON ?auto_532 ?auto_534 ) ( CLEAR ?auto_532 ) ( not ( = ?auto_531 ?auto_532 ) ) ( not ( = ?auto_531 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_534 ) ) ( not ( = ?auto_538 ?auto_535 ) ) ( IS-CRATE ?auto_531 ) ( not ( = ?auto_542 ?auto_537 ) ) ( HOIST-AT ?auto_539 ?auto_542 ) ( AVAILABLE ?auto_539 ) ( SURFACE-AT ?auto_531 ?auto_542 ) ( ON ?auto_531 ?auto_541 ) ( CLEAR ?auto_531 ) ( not ( = ?auto_530 ?auto_531 ) ) ( not ( = ?auto_530 ?auto_541 ) ) ( not ( = ?auto_531 ?auto_541 ) ) ( not ( = ?auto_538 ?auto_539 ) ) ( SURFACE-AT ?auto_529 ?auto_537 ) ( CLEAR ?auto_529 ) ( IS-CRATE ?auto_530 ) ( AVAILABLE ?auto_538 ) ( not ( = ?auto_544 ?auto_537 ) ) ( HOIST-AT ?auto_540 ?auto_544 ) ( AVAILABLE ?auto_540 ) ( SURFACE-AT ?auto_530 ?auto_544 ) ( ON ?auto_530 ?auto_543 ) ( CLEAR ?auto_530 ) ( TRUCK-AT ?auto_536 ?auto_537 ) ( not ( = ?auto_529 ?auto_530 ) ) ( not ( = ?auto_529 ?auto_543 ) ) ( not ( = ?auto_530 ?auto_543 ) ) ( not ( = ?auto_538 ?auto_540 ) ) ( not ( = ?auto_529 ?auto_531 ) ) ( not ( = ?auto_529 ?auto_541 ) ) ( not ( = ?auto_531 ?auto_543 ) ) ( not ( = ?auto_542 ?auto_544 ) ) ( not ( = ?auto_539 ?auto_540 ) ) ( not ( = ?auto_541 ?auto_543 ) ) ( not ( = ?auto_529 ?auto_532 ) ) ( not ( = ?auto_529 ?auto_534 ) ) ( not ( = ?auto_530 ?auto_532 ) ) ( not ( = ?auto_530 ?auto_534 ) ) ( not ( = ?auto_532 ?auto_541 ) ) ( not ( = ?auto_532 ?auto_543 ) ) ( not ( = ?auto_533 ?auto_542 ) ) ( not ( = ?auto_533 ?auto_544 ) ) ( not ( = ?auto_535 ?auto_539 ) ) ( not ( = ?auto_535 ?auto_540 ) ) ( not ( = ?auto_534 ?auto_541 ) ) ( not ( = ?auto_534 ?auto_543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_529 ?auto_530 ?auto_531 )
      ( MAKE-1CRATE ?auto_531 ?auto_532 )
      ( MAKE-3CRATE-VERIFY ?auto_529 ?auto_530 ?auto_531 ?auto_532 ) )
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
      ?auto_567 - HOIST
      ?auto_569 - PLACE
      ?auto_565 - PLACE
      ?auto_566 - HOIST
      ?auto_568 - SURFACE
      ?auto_571 - SURFACE
      ?auto_575 - PLACE
      ?auto_576 - HOIST
      ?auto_573 - SURFACE
      ?auto_572 - PLACE
      ?auto_577 - HOIST
      ?auto_574 - SURFACE
      ?auto_570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_567 ?auto_569 ) ( IS-CRATE ?auto_564 ) ( not ( = ?auto_565 ?auto_569 ) ) ( HOIST-AT ?auto_566 ?auto_565 ) ( SURFACE-AT ?auto_564 ?auto_565 ) ( ON ?auto_564 ?auto_568 ) ( CLEAR ?auto_564 ) ( not ( = ?auto_563 ?auto_564 ) ) ( not ( = ?auto_563 ?auto_568 ) ) ( not ( = ?auto_564 ?auto_568 ) ) ( not ( = ?auto_567 ?auto_566 ) ) ( IS-CRATE ?auto_563 ) ( AVAILABLE ?auto_566 ) ( SURFACE-AT ?auto_563 ?auto_565 ) ( ON ?auto_563 ?auto_571 ) ( CLEAR ?auto_563 ) ( not ( = ?auto_562 ?auto_563 ) ) ( not ( = ?auto_562 ?auto_571 ) ) ( not ( = ?auto_563 ?auto_571 ) ) ( IS-CRATE ?auto_562 ) ( not ( = ?auto_575 ?auto_569 ) ) ( HOIST-AT ?auto_576 ?auto_575 ) ( AVAILABLE ?auto_576 ) ( SURFACE-AT ?auto_562 ?auto_575 ) ( ON ?auto_562 ?auto_573 ) ( CLEAR ?auto_562 ) ( not ( = ?auto_561 ?auto_562 ) ) ( not ( = ?auto_561 ?auto_573 ) ) ( not ( = ?auto_562 ?auto_573 ) ) ( not ( = ?auto_567 ?auto_576 ) ) ( SURFACE-AT ?auto_560 ?auto_569 ) ( CLEAR ?auto_560 ) ( IS-CRATE ?auto_561 ) ( AVAILABLE ?auto_567 ) ( not ( = ?auto_572 ?auto_569 ) ) ( HOIST-AT ?auto_577 ?auto_572 ) ( AVAILABLE ?auto_577 ) ( SURFACE-AT ?auto_561 ?auto_572 ) ( ON ?auto_561 ?auto_574 ) ( CLEAR ?auto_561 ) ( TRUCK-AT ?auto_570 ?auto_569 ) ( not ( = ?auto_560 ?auto_561 ) ) ( not ( = ?auto_560 ?auto_574 ) ) ( not ( = ?auto_561 ?auto_574 ) ) ( not ( = ?auto_567 ?auto_577 ) ) ( not ( = ?auto_560 ?auto_562 ) ) ( not ( = ?auto_560 ?auto_573 ) ) ( not ( = ?auto_562 ?auto_574 ) ) ( not ( = ?auto_575 ?auto_572 ) ) ( not ( = ?auto_576 ?auto_577 ) ) ( not ( = ?auto_573 ?auto_574 ) ) ( not ( = ?auto_560 ?auto_563 ) ) ( not ( = ?auto_560 ?auto_571 ) ) ( not ( = ?auto_561 ?auto_563 ) ) ( not ( = ?auto_561 ?auto_571 ) ) ( not ( = ?auto_563 ?auto_573 ) ) ( not ( = ?auto_563 ?auto_574 ) ) ( not ( = ?auto_565 ?auto_575 ) ) ( not ( = ?auto_565 ?auto_572 ) ) ( not ( = ?auto_566 ?auto_576 ) ) ( not ( = ?auto_566 ?auto_577 ) ) ( not ( = ?auto_571 ?auto_573 ) ) ( not ( = ?auto_571 ?auto_574 ) ) ( not ( = ?auto_560 ?auto_564 ) ) ( not ( = ?auto_560 ?auto_568 ) ) ( not ( = ?auto_561 ?auto_564 ) ) ( not ( = ?auto_561 ?auto_568 ) ) ( not ( = ?auto_562 ?auto_564 ) ) ( not ( = ?auto_562 ?auto_568 ) ) ( not ( = ?auto_564 ?auto_571 ) ) ( not ( = ?auto_564 ?auto_573 ) ) ( not ( = ?auto_564 ?auto_574 ) ) ( not ( = ?auto_568 ?auto_571 ) ) ( not ( = ?auto_568 ?auto_573 ) ) ( not ( = ?auto_568 ?auto_574 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_560 ?auto_561 ?auto_562 ?auto_563 )
      ( MAKE-1CRATE ?auto_563 ?auto_564 )
      ( MAKE-4CRATE-VERIFY ?auto_560 ?auto_561 ?auto_562 ?auto_563 ?auto_564 ) )
  )

)

