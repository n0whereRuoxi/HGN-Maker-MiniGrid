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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10409 - SURFACE
      ?auto_10410 - SURFACE
    )
    :vars
    (
      ?auto_10411 - HOIST
      ?auto_10412 - PLACE
      ?auto_10414 - PLACE
      ?auto_10415 - HOIST
      ?auto_10416 - SURFACE
      ?auto_10413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10411 ?auto_10412 ) ( SURFACE-AT ?auto_10409 ?auto_10412 ) ( CLEAR ?auto_10409 ) ( IS-CRATE ?auto_10410 ) ( AVAILABLE ?auto_10411 ) ( not ( = ?auto_10414 ?auto_10412 ) ) ( HOIST-AT ?auto_10415 ?auto_10414 ) ( AVAILABLE ?auto_10415 ) ( SURFACE-AT ?auto_10410 ?auto_10414 ) ( ON ?auto_10410 ?auto_10416 ) ( CLEAR ?auto_10410 ) ( TRUCK-AT ?auto_10413 ?auto_10412 ) ( not ( = ?auto_10409 ?auto_10410 ) ) ( not ( = ?auto_10409 ?auto_10416 ) ) ( not ( = ?auto_10410 ?auto_10416 ) ) ( not ( = ?auto_10411 ?auto_10415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10413 ?auto_10412 ?auto_10414 )
      ( !LIFT ?auto_10415 ?auto_10410 ?auto_10416 ?auto_10414 )
      ( !LOAD ?auto_10415 ?auto_10410 ?auto_10413 ?auto_10414 )
      ( !DRIVE ?auto_10413 ?auto_10414 ?auto_10412 )
      ( !UNLOAD ?auto_10411 ?auto_10410 ?auto_10413 ?auto_10412 )
      ( !DROP ?auto_10411 ?auto_10410 ?auto_10409 ?auto_10412 )
      ( MAKE-1CRATE-VERIFY ?auto_10409 ?auto_10410 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10430 - SURFACE
      ?auto_10431 - SURFACE
      ?auto_10432 - SURFACE
    )
    :vars
    (
      ?auto_10436 - HOIST
      ?auto_10435 - PLACE
      ?auto_10433 - PLACE
      ?auto_10438 - HOIST
      ?auto_10434 - SURFACE
      ?auto_10441 - PLACE
      ?auto_10439 - HOIST
      ?auto_10440 - SURFACE
      ?auto_10437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10436 ?auto_10435 ) ( IS-CRATE ?auto_10432 ) ( not ( = ?auto_10433 ?auto_10435 ) ) ( HOIST-AT ?auto_10438 ?auto_10433 ) ( AVAILABLE ?auto_10438 ) ( SURFACE-AT ?auto_10432 ?auto_10433 ) ( ON ?auto_10432 ?auto_10434 ) ( CLEAR ?auto_10432 ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( not ( = ?auto_10431 ?auto_10434 ) ) ( not ( = ?auto_10432 ?auto_10434 ) ) ( not ( = ?auto_10436 ?auto_10438 ) ) ( SURFACE-AT ?auto_10430 ?auto_10435 ) ( CLEAR ?auto_10430 ) ( IS-CRATE ?auto_10431 ) ( AVAILABLE ?auto_10436 ) ( not ( = ?auto_10441 ?auto_10435 ) ) ( HOIST-AT ?auto_10439 ?auto_10441 ) ( AVAILABLE ?auto_10439 ) ( SURFACE-AT ?auto_10431 ?auto_10441 ) ( ON ?auto_10431 ?auto_10440 ) ( CLEAR ?auto_10431 ) ( TRUCK-AT ?auto_10437 ?auto_10435 ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10440 ) ) ( not ( = ?auto_10431 ?auto_10440 ) ) ( not ( = ?auto_10436 ?auto_10439 ) ) ( not ( = ?auto_10430 ?auto_10432 ) ) ( not ( = ?auto_10430 ?auto_10434 ) ) ( not ( = ?auto_10432 ?auto_10440 ) ) ( not ( = ?auto_10433 ?auto_10441 ) ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( not ( = ?auto_10434 ?auto_10440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10430 ?auto_10431 )
      ( MAKE-1CRATE ?auto_10431 ?auto_10432 )
      ( MAKE-2CRATE-VERIFY ?auto_10430 ?auto_10431 ?auto_10432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10456 - SURFACE
      ?auto_10457 - SURFACE
      ?auto_10458 - SURFACE
      ?auto_10459 - SURFACE
    )
    :vars
    (
      ?auto_10465 - HOIST
      ?auto_10462 - PLACE
      ?auto_10461 - PLACE
      ?auto_10460 - HOIST
      ?auto_10463 - SURFACE
      ?auto_10471 - PLACE
      ?auto_10466 - HOIST
      ?auto_10469 - SURFACE
      ?auto_10467 - PLACE
      ?auto_10468 - HOIST
      ?auto_10470 - SURFACE
      ?auto_10464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10465 ?auto_10462 ) ( IS-CRATE ?auto_10459 ) ( not ( = ?auto_10461 ?auto_10462 ) ) ( HOIST-AT ?auto_10460 ?auto_10461 ) ( AVAILABLE ?auto_10460 ) ( SURFACE-AT ?auto_10459 ?auto_10461 ) ( ON ?auto_10459 ?auto_10463 ) ( CLEAR ?auto_10459 ) ( not ( = ?auto_10458 ?auto_10459 ) ) ( not ( = ?auto_10458 ?auto_10463 ) ) ( not ( = ?auto_10459 ?auto_10463 ) ) ( not ( = ?auto_10465 ?auto_10460 ) ) ( IS-CRATE ?auto_10458 ) ( not ( = ?auto_10471 ?auto_10462 ) ) ( HOIST-AT ?auto_10466 ?auto_10471 ) ( AVAILABLE ?auto_10466 ) ( SURFACE-AT ?auto_10458 ?auto_10471 ) ( ON ?auto_10458 ?auto_10469 ) ( CLEAR ?auto_10458 ) ( not ( = ?auto_10457 ?auto_10458 ) ) ( not ( = ?auto_10457 ?auto_10469 ) ) ( not ( = ?auto_10458 ?auto_10469 ) ) ( not ( = ?auto_10465 ?auto_10466 ) ) ( SURFACE-AT ?auto_10456 ?auto_10462 ) ( CLEAR ?auto_10456 ) ( IS-CRATE ?auto_10457 ) ( AVAILABLE ?auto_10465 ) ( not ( = ?auto_10467 ?auto_10462 ) ) ( HOIST-AT ?auto_10468 ?auto_10467 ) ( AVAILABLE ?auto_10468 ) ( SURFACE-AT ?auto_10457 ?auto_10467 ) ( ON ?auto_10457 ?auto_10470 ) ( CLEAR ?auto_10457 ) ( TRUCK-AT ?auto_10464 ?auto_10462 ) ( not ( = ?auto_10456 ?auto_10457 ) ) ( not ( = ?auto_10456 ?auto_10470 ) ) ( not ( = ?auto_10457 ?auto_10470 ) ) ( not ( = ?auto_10465 ?auto_10468 ) ) ( not ( = ?auto_10456 ?auto_10458 ) ) ( not ( = ?auto_10456 ?auto_10469 ) ) ( not ( = ?auto_10458 ?auto_10470 ) ) ( not ( = ?auto_10471 ?auto_10467 ) ) ( not ( = ?auto_10466 ?auto_10468 ) ) ( not ( = ?auto_10469 ?auto_10470 ) ) ( not ( = ?auto_10456 ?auto_10459 ) ) ( not ( = ?auto_10456 ?auto_10463 ) ) ( not ( = ?auto_10457 ?auto_10459 ) ) ( not ( = ?auto_10457 ?auto_10463 ) ) ( not ( = ?auto_10459 ?auto_10469 ) ) ( not ( = ?auto_10459 ?auto_10470 ) ) ( not ( = ?auto_10461 ?auto_10471 ) ) ( not ( = ?auto_10461 ?auto_10467 ) ) ( not ( = ?auto_10460 ?auto_10466 ) ) ( not ( = ?auto_10460 ?auto_10468 ) ) ( not ( = ?auto_10463 ?auto_10469 ) ) ( not ( = ?auto_10463 ?auto_10470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10456 ?auto_10457 ?auto_10458 )
      ( MAKE-1CRATE ?auto_10458 ?auto_10459 )
      ( MAKE-3CRATE-VERIFY ?auto_10456 ?auto_10457 ?auto_10458 ?auto_10459 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10487 - SURFACE
      ?auto_10488 - SURFACE
      ?auto_10489 - SURFACE
      ?auto_10490 - SURFACE
      ?auto_10491 - SURFACE
    )
    :vars
    (
      ?auto_10493 - HOIST
      ?auto_10496 - PLACE
      ?auto_10492 - PLACE
      ?auto_10494 - HOIST
      ?auto_10497 - SURFACE
      ?auto_10505 - PLACE
      ?auto_10501 - HOIST
      ?auto_10504 - SURFACE
      ?auto_10502 - PLACE
      ?auto_10499 - HOIST
      ?auto_10503 - SURFACE
      ?auto_10506 - PLACE
      ?auto_10498 - HOIST
      ?auto_10500 - SURFACE
      ?auto_10495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10493 ?auto_10496 ) ( IS-CRATE ?auto_10491 ) ( not ( = ?auto_10492 ?auto_10496 ) ) ( HOIST-AT ?auto_10494 ?auto_10492 ) ( AVAILABLE ?auto_10494 ) ( SURFACE-AT ?auto_10491 ?auto_10492 ) ( ON ?auto_10491 ?auto_10497 ) ( CLEAR ?auto_10491 ) ( not ( = ?auto_10490 ?auto_10491 ) ) ( not ( = ?auto_10490 ?auto_10497 ) ) ( not ( = ?auto_10491 ?auto_10497 ) ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( IS-CRATE ?auto_10490 ) ( not ( = ?auto_10505 ?auto_10496 ) ) ( HOIST-AT ?auto_10501 ?auto_10505 ) ( AVAILABLE ?auto_10501 ) ( SURFACE-AT ?auto_10490 ?auto_10505 ) ( ON ?auto_10490 ?auto_10504 ) ( CLEAR ?auto_10490 ) ( not ( = ?auto_10489 ?auto_10490 ) ) ( not ( = ?auto_10489 ?auto_10504 ) ) ( not ( = ?auto_10490 ?auto_10504 ) ) ( not ( = ?auto_10493 ?auto_10501 ) ) ( IS-CRATE ?auto_10489 ) ( not ( = ?auto_10502 ?auto_10496 ) ) ( HOIST-AT ?auto_10499 ?auto_10502 ) ( AVAILABLE ?auto_10499 ) ( SURFACE-AT ?auto_10489 ?auto_10502 ) ( ON ?auto_10489 ?auto_10503 ) ( CLEAR ?auto_10489 ) ( not ( = ?auto_10488 ?auto_10489 ) ) ( not ( = ?auto_10488 ?auto_10503 ) ) ( not ( = ?auto_10489 ?auto_10503 ) ) ( not ( = ?auto_10493 ?auto_10499 ) ) ( SURFACE-AT ?auto_10487 ?auto_10496 ) ( CLEAR ?auto_10487 ) ( IS-CRATE ?auto_10488 ) ( AVAILABLE ?auto_10493 ) ( not ( = ?auto_10506 ?auto_10496 ) ) ( HOIST-AT ?auto_10498 ?auto_10506 ) ( AVAILABLE ?auto_10498 ) ( SURFACE-AT ?auto_10488 ?auto_10506 ) ( ON ?auto_10488 ?auto_10500 ) ( CLEAR ?auto_10488 ) ( TRUCK-AT ?auto_10495 ?auto_10496 ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( not ( = ?auto_10487 ?auto_10500 ) ) ( not ( = ?auto_10488 ?auto_10500 ) ) ( not ( = ?auto_10493 ?auto_10498 ) ) ( not ( = ?auto_10487 ?auto_10489 ) ) ( not ( = ?auto_10487 ?auto_10503 ) ) ( not ( = ?auto_10489 ?auto_10500 ) ) ( not ( = ?auto_10502 ?auto_10506 ) ) ( not ( = ?auto_10499 ?auto_10498 ) ) ( not ( = ?auto_10503 ?auto_10500 ) ) ( not ( = ?auto_10487 ?auto_10490 ) ) ( not ( = ?auto_10487 ?auto_10504 ) ) ( not ( = ?auto_10488 ?auto_10490 ) ) ( not ( = ?auto_10488 ?auto_10504 ) ) ( not ( = ?auto_10490 ?auto_10503 ) ) ( not ( = ?auto_10490 ?auto_10500 ) ) ( not ( = ?auto_10505 ?auto_10502 ) ) ( not ( = ?auto_10505 ?auto_10506 ) ) ( not ( = ?auto_10501 ?auto_10499 ) ) ( not ( = ?auto_10501 ?auto_10498 ) ) ( not ( = ?auto_10504 ?auto_10503 ) ) ( not ( = ?auto_10504 ?auto_10500 ) ) ( not ( = ?auto_10487 ?auto_10491 ) ) ( not ( = ?auto_10487 ?auto_10497 ) ) ( not ( = ?auto_10488 ?auto_10491 ) ) ( not ( = ?auto_10488 ?auto_10497 ) ) ( not ( = ?auto_10489 ?auto_10491 ) ) ( not ( = ?auto_10489 ?auto_10497 ) ) ( not ( = ?auto_10491 ?auto_10504 ) ) ( not ( = ?auto_10491 ?auto_10503 ) ) ( not ( = ?auto_10491 ?auto_10500 ) ) ( not ( = ?auto_10492 ?auto_10505 ) ) ( not ( = ?auto_10492 ?auto_10502 ) ) ( not ( = ?auto_10492 ?auto_10506 ) ) ( not ( = ?auto_10494 ?auto_10501 ) ) ( not ( = ?auto_10494 ?auto_10499 ) ) ( not ( = ?auto_10494 ?auto_10498 ) ) ( not ( = ?auto_10497 ?auto_10504 ) ) ( not ( = ?auto_10497 ?auto_10503 ) ) ( not ( = ?auto_10497 ?auto_10500 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10487 ?auto_10488 ?auto_10489 ?auto_10490 )
      ( MAKE-1CRATE ?auto_10490 ?auto_10491 )
      ( MAKE-4CRATE-VERIFY ?auto_10487 ?auto_10488 ?auto_10489 ?auto_10490 ?auto_10491 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10523 - SURFACE
      ?auto_10524 - SURFACE
      ?auto_10525 - SURFACE
      ?auto_10526 - SURFACE
      ?auto_10527 - SURFACE
      ?auto_10528 - SURFACE
    )
    :vars
    (
      ?auto_10530 - HOIST
      ?auto_10532 - PLACE
      ?auto_10531 - PLACE
      ?auto_10533 - HOIST
      ?auto_10534 - SURFACE
      ?auto_10541 - PLACE
      ?auto_10536 - HOIST
      ?auto_10543 - SURFACE
      ?auto_10542 - PLACE
      ?auto_10539 - HOIST
      ?auto_10535 - SURFACE
      ?auto_10540 - PLACE
      ?auto_10538 - HOIST
      ?auto_10544 - SURFACE
      ?auto_10537 - SURFACE
      ?auto_10529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10530 ?auto_10532 ) ( IS-CRATE ?auto_10528 ) ( not ( = ?auto_10531 ?auto_10532 ) ) ( HOIST-AT ?auto_10533 ?auto_10531 ) ( SURFACE-AT ?auto_10528 ?auto_10531 ) ( ON ?auto_10528 ?auto_10534 ) ( CLEAR ?auto_10528 ) ( not ( = ?auto_10527 ?auto_10528 ) ) ( not ( = ?auto_10527 ?auto_10534 ) ) ( not ( = ?auto_10528 ?auto_10534 ) ) ( not ( = ?auto_10530 ?auto_10533 ) ) ( IS-CRATE ?auto_10527 ) ( not ( = ?auto_10541 ?auto_10532 ) ) ( HOIST-AT ?auto_10536 ?auto_10541 ) ( AVAILABLE ?auto_10536 ) ( SURFACE-AT ?auto_10527 ?auto_10541 ) ( ON ?auto_10527 ?auto_10543 ) ( CLEAR ?auto_10527 ) ( not ( = ?auto_10526 ?auto_10527 ) ) ( not ( = ?auto_10526 ?auto_10543 ) ) ( not ( = ?auto_10527 ?auto_10543 ) ) ( not ( = ?auto_10530 ?auto_10536 ) ) ( IS-CRATE ?auto_10526 ) ( not ( = ?auto_10542 ?auto_10532 ) ) ( HOIST-AT ?auto_10539 ?auto_10542 ) ( AVAILABLE ?auto_10539 ) ( SURFACE-AT ?auto_10526 ?auto_10542 ) ( ON ?auto_10526 ?auto_10535 ) ( CLEAR ?auto_10526 ) ( not ( = ?auto_10525 ?auto_10526 ) ) ( not ( = ?auto_10525 ?auto_10535 ) ) ( not ( = ?auto_10526 ?auto_10535 ) ) ( not ( = ?auto_10530 ?auto_10539 ) ) ( IS-CRATE ?auto_10525 ) ( not ( = ?auto_10540 ?auto_10532 ) ) ( HOIST-AT ?auto_10538 ?auto_10540 ) ( AVAILABLE ?auto_10538 ) ( SURFACE-AT ?auto_10525 ?auto_10540 ) ( ON ?auto_10525 ?auto_10544 ) ( CLEAR ?auto_10525 ) ( not ( = ?auto_10524 ?auto_10525 ) ) ( not ( = ?auto_10524 ?auto_10544 ) ) ( not ( = ?auto_10525 ?auto_10544 ) ) ( not ( = ?auto_10530 ?auto_10538 ) ) ( SURFACE-AT ?auto_10523 ?auto_10532 ) ( CLEAR ?auto_10523 ) ( IS-CRATE ?auto_10524 ) ( AVAILABLE ?auto_10530 ) ( AVAILABLE ?auto_10533 ) ( SURFACE-AT ?auto_10524 ?auto_10531 ) ( ON ?auto_10524 ?auto_10537 ) ( CLEAR ?auto_10524 ) ( TRUCK-AT ?auto_10529 ?auto_10532 ) ( not ( = ?auto_10523 ?auto_10524 ) ) ( not ( = ?auto_10523 ?auto_10537 ) ) ( not ( = ?auto_10524 ?auto_10537 ) ) ( not ( = ?auto_10523 ?auto_10525 ) ) ( not ( = ?auto_10523 ?auto_10544 ) ) ( not ( = ?auto_10525 ?auto_10537 ) ) ( not ( = ?auto_10540 ?auto_10531 ) ) ( not ( = ?auto_10538 ?auto_10533 ) ) ( not ( = ?auto_10544 ?auto_10537 ) ) ( not ( = ?auto_10523 ?auto_10526 ) ) ( not ( = ?auto_10523 ?auto_10535 ) ) ( not ( = ?auto_10524 ?auto_10526 ) ) ( not ( = ?auto_10524 ?auto_10535 ) ) ( not ( = ?auto_10526 ?auto_10544 ) ) ( not ( = ?auto_10526 ?auto_10537 ) ) ( not ( = ?auto_10542 ?auto_10540 ) ) ( not ( = ?auto_10542 ?auto_10531 ) ) ( not ( = ?auto_10539 ?auto_10538 ) ) ( not ( = ?auto_10539 ?auto_10533 ) ) ( not ( = ?auto_10535 ?auto_10544 ) ) ( not ( = ?auto_10535 ?auto_10537 ) ) ( not ( = ?auto_10523 ?auto_10527 ) ) ( not ( = ?auto_10523 ?auto_10543 ) ) ( not ( = ?auto_10524 ?auto_10527 ) ) ( not ( = ?auto_10524 ?auto_10543 ) ) ( not ( = ?auto_10525 ?auto_10527 ) ) ( not ( = ?auto_10525 ?auto_10543 ) ) ( not ( = ?auto_10527 ?auto_10535 ) ) ( not ( = ?auto_10527 ?auto_10544 ) ) ( not ( = ?auto_10527 ?auto_10537 ) ) ( not ( = ?auto_10541 ?auto_10542 ) ) ( not ( = ?auto_10541 ?auto_10540 ) ) ( not ( = ?auto_10541 ?auto_10531 ) ) ( not ( = ?auto_10536 ?auto_10539 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10536 ?auto_10533 ) ) ( not ( = ?auto_10543 ?auto_10535 ) ) ( not ( = ?auto_10543 ?auto_10544 ) ) ( not ( = ?auto_10543 ?auto_10537 ) ) ( not ( = ?auto_10523 ?auto_10528 ) ) ( not ( = ?auto_10523 ?auto_10534 ) ) ( not ( = ?auto_10524 ?auto_10528 ) ) ( not ( = ?auto_10524 ?auto_10534 ) ) ( not ( = ?auto_10525 ?auto_10528 ) ) ( not ( = ?auto_10525 ?auto_10534 ) ) ( not ( = ?auto_10526 ?auto_10528 ) ) ( not ( = ?auto_10526 ?auto_10534 ) ) ( not ( = ?auto_10528 ?auto_10543 ) ) ( not ( = ?auto_10528 ?auto_10535 ) ) ( not ( = ?auto_10528 ?auto_10544 ) ) ( not ( = ?auto_10528 ?auto_10537 ) ) ( not ( = ?auto_10534 ?auto_10543 ) ) ( not ( = ?auto_10534 ?auto_10535 ) ) ( not ( = ?auto_10534 ?auto_10544 ) ) ( not ( = ?auto_10534 ?auto_10537 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10523 ?auto_10524 ?auto_10525 ?auto_10526 ?auto_10527 )
      ( MAKE-1CRATE ?auto_10527 ?auto_10528 )
      ( MAKE-5CRATE-VERIFY ?auto_10523 ?auto_10524 ?auto_10525 ?auto_10526 ?auto_10527 ?auto_10528 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10562 - SURFACE
      ?auto_10563 - SURFACE
      ?auto_10564 - SURFACE
      ?auto_10565 - SURFACE
      ?auto_10566 - SURFACE
      ?auto_10567 - SURFACE
      ?auto_10568 - SURFACE
    )
    :vars
    (
      ?auto_10574 - HOIST
      ?auto_10573 - PLACE
      ?auto_10569 - PLACE
      ?auto_10571 - HOIST
      ?auto_10570 - SURFACE
      ?auto_10577 - PLACE
      ?auto_10576 - HOIST
      ?auto_10587 - SURFACE
      ?auto_10579 - PLACE
      ?auto_10583 - HOIST
      ?auto_10582 - SURFACE
      ?auto_10575 - PLACE
      ?auto_10578 - HOIST
      ?auto_10584 - SURFACE
      ?auto_10586 - PLACE
      ?auto_10585 - HOIST
      ?auto_10580 - SURFACE
      ?auto_10581 - SURFACE
      ?auto_10572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10574 ?auto_10573 ) ( IS-CRATE ?auto_10568 ) ( not ( = ?auto_10569 ?auto_10573 ) ) ( HOIST-AT ?auto_10571 ?auto_10569 ) ( AVAILABLE ?auto_10571 ) ( SURFACE-AT ?auto_10568 ?auto_10569 ) ( ON ?auto_10568 ?auto_10570 ) ( CLEAR ?auto_10568 ) ( not ( = ?auto_10567 ?auto_10568 ) ) ( not ( = ?auto_10567 ?auto_10570 ) ) ( not ( = ?auto_10568 ?auto_10570 ) ) ( not ( = ?auto_10574 ?auto_10571 ) ) ( IS-CRATE ?auto_10567 ) ( not ( = ?auto_10577 ?auto_10573 ) ) ( HOIST-AT ?auto_10576 ?auto_10577 ) ( SURFACE-AT ?auto_10567 ?auto_10577 ) ( ON ?auto_10567 ?auto_10587 ) ( CLEAR ?auto_10567 ) ( not ( = ?auto_10566 ?auto_10567 ) ) ( not ( = ?auto_10566 ?auto_10587 ) ) ( not ( = ?auto_10567 ?auto_10587 ) ) ( not ( = ?auto_10574 ?auto_10576 ) ) ( IS-CRATE ?auto_10566 ) ( not ( = ?auto_10579 ?auto_10573 ) ) ( HOIST-AT ?auto_10583 ?auto_10579 ) ( AVAILABLE ?auto_10583 ) ( SURFACE-AT ?auto_10566 ?auto_10579 ) ( ON ?auto_10566 ?auto_10582 ) ( CLEAR ?auto_10566 ) ( not ( = ?auto_10565 ?auto_10566 ) ) ( not ( = ?auto_10565 ?auto_10582 ) ) ( not ( = ?auto_10566 ?auto_10582 ) ) ( not ( = ?auto_10574 ?auto_10583 ) ) ( IS-CRATE ?auto_10565 ) ( not ( = ?auto_10575 ?auto_10573 ) ) ( HOIST-AT ?auto_10578 ?auto_10575 ) ( AVAILABLE ?auto_10578 ) ( SURFACE-AT ?auto_10565 ?auto_10575 ) ( ON ?auto_10565 ?auto_10584 ) ( CLEAR ?auto_10565 ) ( not ( = ?auto_10564 ?auto_10565 ) ) ( not ( = ?auto_10564 ?auto_10584 ) ) ( not ( = ?auto_10565 ?auto_10584 ) ) ( not ( = ?auto_10574 ?auto_10578 ) ) ( IS-CRATE ?auto_10564 ) ( not ( = ?auto_10586 ?auto_10573 ) ) ( HOIST-AT ?auto_10585 ?auto_10586 ) ( AVAILABLE ?auto_10585 ) ( SURFACE-AT ?auto_10564 ?auto_10586 ) ( ON ?auto_10564 ?auto_10580 ) ( CLEAR ?auto_10564 ) ( not ( = ?auto_10563 ?auto_10564 ) ) ( not ( = ?auto_10563 ?auto_10580 ) ) ( not ( = ?auto_10564 ?auto_10580 ) ) ( not ( = ?auto_10574 ?auto_10585 ) ) ( SURFACE-AT ?auto_10562 ?auto_10573 ) ( CLEAR ?auto_10562 ) ( IS-CRATE ?auto_10563 ) ( AVAILABLE ?auto_10574 ) ( AVAILABLE ?auto_10576 ) ( SURFACE-AT ?auto_10563 ?auto_10577 ) ( ON ?auto_10563 ?auto_10581 ) ( CLEAR ?auto_10563 ) ( TRUCK-AT ?auto_10572 ?auto_10573 ) ( not ( = ?auto_10562 ?auto_10563 ) ) ( not ( = ?auto_10562 ?auto_10581 ) ) ( not ( = ?auto_10563 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10564 ) ) ( not ( = ?auto_10562 ?auto_10580 ) ) ( not ( = ?auto_10564 ?auto_10581 ) ) ( not ( = ?auto_10586 ?auto_10577 ) ) ( not ( = ?auto_10585 ?auto_10576 ) ) ( not ( = ?auto_10580 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10565 ) ) ( not ( = ?auto_10562 ?auto_10584 ) ) ( not ( = ?auto_10563 ?auto_10565 ) ) ( not ( = ?auto_10563 ?auto_10584 ) ) ( not ( = ?auto_10565 ?auto_10580 ) ) ( not ( = ?auto_10565 ?auto_10581 ) ) ( not ( = ?auto_10575 ?auto_10586 ) ) ( not ( = ?auto_10575 ?auto_10577 ) ) ( not ( = ?auto_10578 ?auto_10585 ) ) ( not ( = ?auto_10578 ?auto_10576 ) ) ( not ( = ?auto_10584 ?auto_10580 ) ) ( not ( = ?auto_10584 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10566 ) ) ( not ( = ?auto_10562 ?auto_10582 ) ) ( not ( = ?auto_10563 ?auto_10566 ) ) ( not ( = ?auto_10563 ?auto_10582 ) ) ( not ( = ?auto_10564 ?auto_10566 ) ) ( not ( = ?auto_10564 ?auto_10582 ) ) ( not ( = ?auto_10566 ?auto_10584 ) ) ( not ( = ?auto_10566 ?auto_10580 ) ) ( not ( = ?auto_10566 ?auto_10581 ) ) ( not ( = ?auto_10579 ?auto_10575 ) ) ( not ( = ?auto_10579 ?auto_10586 ) ) ( not ( = ?auto_10579 ?auto_10577 ) ) ( not ( = ?auto_10583 ?auto_10578 ) ) ( not ( = ?auto_10583 ?auto_10585 ) ) ( not ( = ?auto_10583 ?auto_10576 ) ) ( not ( = ?auto_10582 ?auto_10584 ) ) ( not ( = ?auto_10582 ?auto_10580 ) ) ( not ( = ?auto_10582 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10567 ) ) ( not ( = ?auto_10562 ?auto_10587 ) ) ( not ( = ?auto_10563 ?auto_10567 ) ) ( not ( = ?auto_10563 ?auto_10587 ) ) ( not ( = ?auto_10564 ?auto_10567 ) ) ( not ( = ?auto_10564 ?auto_10587 ) ) ( not ( = ?auto_10565 ?auto_10567 ) ) ( not ( = ?auto_10565 ?auto_10587 ) ) ( not ( = ?auto_10567 ?auto_10582 ) ) ( not ( = ?auto_10567 ?auto_10584 ) ) ( not ( = ?auto_10567 ?auto_10580 ) ) ( not ( = ?auto_10567 ?auto_10581 ) ) ( not ( = ?auto_10587 ?auto_10582 ) ) ( not ( = ?auto_10587 ?auto_10584 ) ) ( not ( = ?auto_10587 ?auto_10580 ) ) ( not ( = ?auto_10587 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10568 ) ) ( not ( = ?auto_10562 ?auto_10570 ) ) ( not ( = ?auto_10563 ?auto_10568 ) ) ( not ( = ?auto_10563 ?auto_10570 ) ) ( not ( = ?auto_10564 ?auto_10568 ) ) ( not ( = ?auto_10564 ?auto_10570 ) ) ( not ( = ?auto_10565 ?auto_10568 ) ) ( not ( = ?auto_10565 ?auto_10570 ) ) ( not ( = ?auto_10566 ?auto_10568 ) ) ( not ( = ?auto_10566 ?auto_10570 ) ) ( not ( = ?auto_10568 ?auto_10587 ) ) ( not ( = ?auto_10568 ?auto_10582 ) ) ( not ( = ?auto_10568 ?auto_10584 ) ) ( not ( = ?auto_10568 ?auto_10580 ) ) ( not ( = ?auto_10568 ?auto_10581 ) ) ( not ( = ?auto_10569 ?auto_10577 ) ) ( not ( = ?auto_10569 ?auto_10579 ) ) ( not ( = ?auto_10569 ?auto_10575 ) ) ( not ( = ?auto_10569 ?auto_10586 ) ) ( not ( = ?auto_10571 ?auto_10576 ) ) ( not ( = ?auto_10571 ?auto_10583 ) ) ( not ( = ?auto_10571 ?auto_10578 ) ) ( not ( = ?auto_10571 ?auto_10585 ) ) ( not ( = ?auto_10570 ?auto_10587 ) ) ( not ( = ?auto_10570 ?auto_10582 ) ) ( not ( = ?auto_10570 ?auto_10584 ) ) ( not ( = ?auto_10570 ?auto_10580 ) ) ( not ( = ?auto_10570 ?auto_10581 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10562 ?auto_10563 ?auto_10564 ?auto_10565 ?auto_10566 ?auto_10567 )
      ( MAKE-1CRATE ?auto_10567 ?auto_10568 )
      ( MAKE-6CRATE-VERIFY ?auto_10562 ?auto_10563 ?auto_10564 ?auto_10565 ?auto_10566 ?auto_10567 ?auto_10568 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10606 - SURFACE
      ?auto_10607 - SURFACE
      ?auto_10608 - SURFACE
      ?auto_10609 - SURFACE
      ?auto_10610 - SURFACE
      ?auto_10611 - SURFACE
      ?auto_10612 - SURFACE
      ?auto_10613 - SURFACE
    )
    :vars
    (
      ?auto_10619 - HOIST
      ?auto_10618 - PLACE
      ?auto_10616 - PLACE
      ?auto_10614 - HOIST
      ?auto_10615 - SURFACE
      ?auto_10623 - PLACE
      ?auto_10622 - HOIST
      ?auto_10634 - SURFACE
      ?auto_10630 - PLACE
      ?auto_10628 - HOIST
      ?auto_10621 - SURFACE
      ?auto_10625 - PLACE
      ?auto_10626 - HOIST
      ?auto_10624 - SURFACE
      ?auto_10620 - PLACE
      ?auto_10631 - HOIST
      ?auto_10629 - SURFACE
      ?auto_10633 - PLACE
      ?auto_10627 - HOIST
      ?auto_10635 - SURFACE
      ?auto_10632 - SURFACE
      ?auto_10617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10619 ?auto_10618 ) ( IS-CRATE ?auto_10613 ) ( not ( = ?auto_10616 ?auto_10618 ) ) ( HOIST-AT ?auto_10614 ?auto_10616 ) ( AVAILABLE ?auto_10614 ) ( SURFACE-AT ?auto_10613 ?auto_10616 ) ( ON ?auto_10613 ?auto_10615 ) ( CLEAR ?auto_10613 ) ( not ( = ?auto_10612 ?auto_10613 ) ) ( not ( = ?auto_10612 ?auto_10615 ) ) ( not ( = ?auto_10613 ?auto_10615 ) ) ( not ( = ?auto_10619 ?auto_10614 ) ) ( IS-CRATE ?auto_10612 ) ( not ( = ?auto_10623 ?auto_10618 ) ) ( HOIST-AT ?auto_10622 ?auto_10623 ) ( AVAILABLE ?auto_10622 ) ( SURFACE-AT ?auto_10612 ?auto_10623 ) ( ON ?auto_10612 ?auto_10634 ) ( CLEAR ?auto_10612 ) ( not ( = ?auto_10611 ?auto_10612 ) ) ( not ( = ?auto_10611 ?auto_10634 ) ) ( not ( = ?auto_10612 ?auto_10634 ) ) ( not ( = ?auto_10619 ?auto_10622 ) ) ( IS-CRATE ?auto_10611 ) ( not ( = ?auto_10630 ?auto_10618 ) ) ( HOIST-AT ?auto_10628 ?auto_10630 ) ( SURFACE-AT ?auto_10611 ?auto_10630 ) ( ON ?auto_10611 ?auto_10621 ) ( CLEAR ?auto_10611 ) ( not ( = ?auto_10610 ?auto_10611 ) ) ( not ( = ?auto_10610 ?auto_10621 ) ) ( not ( = ?auto_10611 ?auto_10621 ) ) ( not ( = ?auto_10619 ?auto_10628 ) ) ( IS-CRATE ?auto_10610 ) ( not ( = ?auto_10625 ?auto_10618 ) ) ( HOIST-AT ?auto_10626 ?auto_10625 ) ( AVAILABLE ?auto_10626 ) ( SURFACE-AT ?auto_10610 ?auto_10625 ) ( ON ?auto_10610 ?auto_10624 ) ( CLEAR ?auto_10610 ) ( not ( = ?auto_10609 ?auto_10610 ) ) ( not ( = ?auto_10609 ?auto_10624 ) ) ( not ( = ?auto_10610 ?auto_10624 ) ) ( not ( = ?auto_10619 ?auto_10626 ) ) ( IS-CRATE ?auto_10609 ) ( not ( = ?auto_10620 ?auto_10618 ) ) ( HOIST-AT ?auto_10631 ?auto_10620 ) ( AVAILABLE ?auto_10631 ) ( SURFACE-AT ?auto_10609 ?auto_10620 ) ( ON ?auto_10609 ?auto_10629 ) ( CLEAR ?auto_10609 ) ( not ( = ?auto_10608 ?auto_10609 ) ) ( not ( = ?auto_10608 ?auto_10629 ) ) ( not ( = ?auto_10609 ?auto_10629 ) ) ( not ( = ?auto_10619 ?auto_10631 ) ) ( IS-CRATE ?auto_10608 ) ( not ( = ?auto_10633 ?auto_10618 ) ) ( HOIST-AT ?auto_10627 ?auto_10633 ) ( AVAILABLE ?auto_10627 ) ( SURFACE-AT ?auto_10608 ?auto_10633 ) ( ON ?auto_10608 ?auto_10635 ) ( CLEAR ?auto_10608 ) ( not ( = ?auto_10607 ?auto_10608 ) ) ( not ( = ?auto_10607 ?auto_10635 ) ) ( not ( = ?auto_10608 ?auto_10635 ) ) ( not ( = ?auto_10619 ?auto_10627 ) ) ( SURFACE-AT ?auto_10606 ?auto_10618 ) ( CLEAR ?auto_10606 ) ( IS-CRATE ?auto_10607 ) ( AVAILABLE ?auto_10619 ) ( AVAILABLE ?auto_10628 ) ( SURFACE-AT ?auto_10607 ?auto_10630 ) ( ON ?auto_10607 ?auto_10632 ) ( CLEAR ?auto_10607 ) ( TRUCK-AT ?auto_10617 ?auto_10618 ) ( not ( = ?auto_10606 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10632 ) ) ( not ( = ?auto_10607 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10608 ) ) ( not ( = ?auto_10606 ?auto_10635 ) ) ( not ( = ?auto_10608 ?auto_10632 ) ) ( not ( = ?auto_10633 ?auto_10630 ) ) ( not ( = ?auto_10627 ?auto_10628 ) ) ( not ( = ?auto_10635 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10609 ) ) ( not ( = ?auto_10606 ?auto_10629 ) ) ( not ( = ?auto_10607 ?auto_10609 ) ) ( not ( = ?auto_10607 ?auto_10629 ) ) ( not ( = ?auto_10609 ?auto_10635 ) ) ( not ( = ?auto_10609 ?auto_10632 ) ) ( not ( = ?auto_10620 ?auto_10633 ) ) ( not ( = ?auto_10620 ?auto_10630 ) ) ( not ( = ?auto_10631 ?auto_10627 ) ) ( not ( = ?auto_10631 ?auto_10628 ) ) ( not ( = ?auto_10629 ?auto_10635 ) ) ( not ( = ?auto_10629 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10610 ) ) ( not ( = ?auto_10606 ?auto_10624 ) ) ( not ( = ?auto_10607 ?auto_10610 ) ) ( not ( = ?auto_10607 ?auto_10624 ) ) ( not ( = ?auto_10608 ?auto_10610 ) ) ( not ( = ?auto_10608 ?auto_10624 ) ) ( not ( = ?auto_10610 ?auto_10629 ) ) ( not ( = ?auto_10610 ?auto_10635 ) ) ( not ( = ?auto_10610 ?auto_10632 ) ) ( not ( = ?auto_10625 ?auto_10620 ) ) ( not ( = ?auto_10625 ?auto_10633 ) ) ( not ( = ?auto_10625 ?auto_10630 ) ) ( not ( = ?auto_10626 ?auto_10631 ) ) ( not ( = ?auto_10626 ?auto_10627 ) ) ( not ( = ?auto_10626 ?auto_10628 ) ) ( not ( = ?auto_10624 ?auto_10629 ) ) ( not ( = ?auto_10624 ?auto_10635 ) ) ( not ( = ?auto_10624 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10611 ) ) ( not ( = ?auto_10606 ?auto_10621 ) ) ( not ( = ?auto_10607 ?auto_10611 ) ) ( not ( = ?auto_10607 ?auto_10621 ) ) ( not ( = ?auto_10608 ?auto_10611 ) ) ( not ( = ?auto_10608 ?auto_10621 ) ) ( not ( = ?auto_10609 ?auto_10611 ) ) ( not ( = ?auto_10609 ?auto_10621 ) ) ( not ( = ?auto_10611 ?auto_10624 ) ) ( not ( = ?auto_10611 ?auto_10629 ) ) ( not ( = ?auto_10611 ?auto_10635 ) ) ( not ( = ?auto_10611 ?auto_10632 ) ) ( not ( = ?auto_10621 ?auto_10624 ) ) ( not ( = ?auto_10621 ?auto_10629 ) ) ( not ( = ?auto_10621 ?auto_10635 ) ) ( not ( = ?auto_10621 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10612 ) ) ( not ( = ?auto_10606 ?auto_10634 ) ) ( not ( = ?auto_10607 ?auto_10612 ) ) ( not ( = ?auto_10607 ?auto_10634 ) ) ( not ( = ?auto_10608 ?auto_10612 ) ) ( not ( = ?auto_10608 ?auto_10634 ) ) ( not ( = ?auto_10609 ?auto_10612 ) ) ( not ( = ?auto_10609 ?auto_10634 ) ) ( not ( = ?auto_10610 ?auto_10612 ) ) ( not ( = ?auto_10610 ?auto_10634 ) ) ( not ( = ?auto_10612 ?auto_10621 ) ) ( not ( = ?auto_10612 ?auto_10624 ) ) ( not ( = ?auto_10612 ?auto_10629 ) ) ( not ( = ?auto_10612 ?auto_10635 ) ) ( not ( = ?auto_10612 ?auto_10632 ) ) ( not ( = ?auto_10623 ?auto_10630 ) ) ( not ( = ?auto_10623 ?auto_10625 ) ) ( not ( = ?auto_10623 ?auto_10620 ) ) ( not ( = ?auto_10623 ?auto_10633 ) ) ( not ( = ?auto_10622 ?auto_10628 ) ) ( not ( = ?auto_10622 ?auto_10626 ) ) ( not ( = ?auto_10622 ?auto_10631 ) ) ( not ( = ?auto_10622 ?auto_10627 ) ) ( not ( = ?auto_10634 ?auto_10621 ) ) ( not ( = ?auto_10634 ?auto_10624 ) ) ( not ( = ?auto_10634 ?auto_10629 ) ) ( not ( = ?auto_10634 ?auto_10635 ) ) ( not ( = ?auto_10634 ?auto_10632 ) ) ( not ( = ?auto_10606 ?auto_10613 ) ) ( not ( = ?auto_10606 ?auto_10615 ) ) ( not ( = ?auto_10607 ?auto_10613 ) ) ( not ( = ?auto_10607 ?auto_10615 ) ) ( not ( = ?auto_10608 ?auto_10613 ) ) ( not ( = ?auto_10608 ?auto_10615 ) ) ( not ( = ?auto_10609 ?auto_10613 ) ) ( not ( = ?auto_10609 ?auto_10615 ) ) ( not ( = ?auto_10610 ?auto_10613 ) ) ( not ( = ?auto_10610 ?auto_10615 ) ) ( not ( = ?auto_10611 ?auto_10613 ) ) ( not ( = ?auto_10611 ?auto_10615 ) ) ( not ( = ?auto_10613 ?auto_10634 ) ) ( not ( = ?auto_10613 ?auto_10621 ) ) ( not ( = ?auto_10613 ?auto_10624 ) ) ( not ( = ?auto_10613 ?auto_10629 ) ) ( not ( = ?auto_10613 ?auto_10635 ) ) ( not ( = ?auto_10613 ?auto_10632 ) ) ( not ( = ?auto_10616 ?auto_10623 ) ) ( not ( = ?auto_10616 ?auto_10630 ) ) ( not ( = ?auto_10616 ?auto_10625 ) ) ( not ( = ?auto_10616 ?auto_10620 ) ) ( not ( = ?auto_10616 ?auto_10633 ) ) ( not ( = ?auto_10614 ?auto_10622 ) ) ( not ( = ?auto_10614 ?auto_10628 ) ) ( not ( = ?auto_10614 ?auto_10626 ) ) ( not ( = ?auto_10614 ?auto_10631 ) ) ( not ( = ?auto_10614 ?auto_10627 ) ) ( not ( = ?auto_10615 ?auto_10634 ) ) ( not ( = ?auto_10615 ?auto_10621 ) ) ( not ( = ?auto_10615 ?auto_10624 ) ) ( not ( = ?auto_10615 ?auto_10629 ) ) ( not ( = ?auto_10615 ?auto_10635 ) ) ( not ( = ?auto_10615 ?auto_10632 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10606 ?auto_10607 ?auto_10608 ?auto_10609 ?auto_10610 ?auto_10611 ?auto_10612 )
      ( MAKE-1CRATE ?auto_10612 ?auto_10613 )
      ( MAKE-7CRATE-VERIFY ?auto_10606 ?auto_10607 ?auto_10608 ?auto_10609 ?auto_10610 ?auto_10611 ?auto_10612 ?auto_10613 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10655 - SURFACE
      ?auto_10656 - SURFACE
      ?auto_10657 - SURFACE
      ?auto_10658 - SURFACE
      ?auto_10659 - SURFACE
      ?auto_10660 - SURFACE
      ?auto_10661 - SURFACE
      ?auto_10662 - SURFACE
      ?auto_10663 - SURFACE
    )
    :vars
    (
      ?auto_10668 - HOIST
      ?auto_10666 - PLACE
      ?auto_10669 - PLACE
      ?auto_10665 - HOIST
      ?auto_10667 - SURFACE
      ?auto_10683 - PLACE
      ?auto_10679 - HOIST
      ?auto_10671 - SURFACE
      ?auto_10685 - PLACE
      ?auto_10681 - HOIST
      ?auto_10674 - SURFACE
      ?auto_10680 - PLACE
      ?auto_10688 - HOIST
      ?auto_10675 - SURFACE
      ?auto_10682 - PLACE
      ?auto_10670 - HOIST
      ?auto_10686 - SURFACE
      ?auto_10672 - PLACE
      ?auto_10678 - HOIST
      ?auto_10687 - SURFACE
      ?auto_10684 - PLACE
      ?auto_10676 - HOIST
      ?auto_10677 - SURFACE
      ?auto_10673 - SURFACE
      ?auto_10664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10668 ?auto_10666 ) ( IS-CRATE ?auto_10663 ) ( not ( = ?auto_10669 ?auto_10666 ) ) ( HOIST-AT ?auto_10665 ?auto_10669 ) ( AVAILABLE ?auto_10665 ) ( SURFACE-AT ?auto_10663 ?auto_10669 ) ( ON ?auto_10663 ?auto_10667 ) ( CLEAR ?auto_10663 ) ( not ( = ?auto_10662 ?auto_10663 ) ) ( not ( = ?auto_10662 ?auto_10667 ) ) ( not ( = ?auto_10663 ?auto_10667 ) ) ( not ( = ?auto_10668 ?auto_10665 ) ) ( IS-CRATE ?auto_10662 ) ( not ( = ?auto_10683 ?auto_10666 ) ) ( HOIST-AT ?auto_10679 ?auto_10683 ) ( AVAILABLE ?auto_10679 ) ( SURFACE-AT ?auto_10662 ?auto_10683 ) ( ON ?auto_10662 ?auto_10671 ) ( CLEAR ?auto_10662 ) ( not ( = ?auto_10661 ?auto_10662 ) ) ( not ( = ?auto_10661 ?auto_10671 ) ) ( not ( = ?auto_10662 ?auto_10671 ) ) ( not ( = ?auto_10668 ?auto_10679 ) ) ( IS-CRATE ?auto_10661 ) ( not ( = ?auto_10685 ?auto_10666 ) ) ( HOIST-AT ?auto_10681 ?auto_10685 ) ( AVAILABLE ?auto_10681 ) ( SURFACE-AT ?auto_10661 ?auto_10685 ) ( ON ?auto_10661 ?auto_10674 ) ( CLEAR ?auto_10661 ) ( not ( = ?auto_10660 ?auto_10661 ) ) ( not ( = ?auto_10660 ?auto_10674 ) ) ( not ( = ?auto_10661 ?auto_10674 ) ) ( not ( = ?auto_10668 ?auto_10681 ) ) ( IS-CRATE ?auto_10660 ) ( not ( = ?auto_10680 ?auto_10666 ) ) ( HOIST-AT ?auto_10688 ?auto_10680 ) ( SURFACE-AT ?auto_10660 ?auto_10680 ) ( ON ?auto_10660 ?auto_10675 ) ( CLEAR ?auto_10660 ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( not ( = ?auto_10659 ?auto_10675 ) ) ( not ( = ?auto_10660 ?auto_10675 ) ) ( not ( = ?auto_10668 ?auto_10688 ) ) ( IS-CRATE ?auto_10659 ) ( not ( = ?auto_10682 ?auto_10666 ) ) ( HOIST-AT ?auto_10670 ?auto_10682 ) ( AVAILABLE ?auto_10670 ) ( SURFACE-AT ?auto_10659 ?auto_10682 ) ( ON ?auto_10659 ?auto_10686 ) ( CLEAR ?auto_10659 ) ( not ( = ?auto_10658 ?auto_10659 ) ) ( not ( = ?auto_10658 ?auto_10686 ) ) ( not ( = ?auto_10659 ?auto_10686 ) ) ( not ( = ?auto_10668 ?auto_10670 ) ) ( IS-CRATE ?auto_10658 ) ( not ( = ?auto_10672 ?auto_10666 ) ) ( HOIST-AT ?auto_10678 ?auto_10672 ) ( AVAILABLE ?auto_10678 ) ( SURFACE-AT ?auto_10658 ?auto_10672 ) ( ON ?auto_10658 ?auto_10687 ) ( CLEAR ?auto_10658 ) ( not ( = ?auto_10657 ?auto_10658 ) ) ( not ( = ?auto_10657 ?auto_10687 ) ) ( not ( = ?auto_10658 ?auto_10687 ) ) ( not ( = ?auto_10668 ?auto_10678 ) ) ( IS-CRATE ?auto_10657 ) ( not ( = ?auto_10684 ?auto_10666 ) ) ( HOIST-AT ?auto_10676 ?auto_10684 ) ( AVAILABLE ?auto_10676 ) ( SURFACE-AT ?auto_10657 ?auto_10684 ) ( ON ?auto_10657 ?auto_10677 ) ( CLEAR ?auto_10657 ) ( not ( = ?auto_10656 ?auto_10657 ) ) ( not ( = ?auto_10656 ?auto_10677 ) ) ( not ( = ?auto_10657 ?auto_10677 ) ) ( not ( = ?auto_10668 ?auto_10676 ) ) ( SURFACE-AT ?auto_10655 ?auto_10666 ) ( CLEAR ?auto_10655 ) ( IS-CRATE ?auto_10656 ) ( AVAILABLE ?auto_10668 ) ( AVAILABLE ?auto_10688 ) ( SURFACE-AT ?auto_10656 ?auto_10680 ) ( ON ?auto_10656 ?auto_10673 ) ( CLEAR ?auto_10656 ) ( TRUCK-AT ?auto_10664 ?auto_10666 ) ( not ( = ?auto_10655 ?auto_10656 ) ) ( not ( = ?auto_10655 ?auto_10673 ) ) ( not ( = ?auto_10656 ?auto_10673 ) ) ( not ( = ?auto_10655 ?auto_10657 ) ) ( not ( = ?auto_10655 ?auto_10677 ) ) ( not ( = ?auto_10657 ?auto_10673 ) ) ( not ( = ?auto_10684 ?auto_10680 ) ) ( not ( = ?auto_10676 ?auto_10688 ) ) ( not ( = ?auto_10677 ?auto_10673 ) ) ( not ( = ?auto_10655 ?auto_10658 ) ) ( not ( = ?auto_10655 ?auto_10687 ) ) ( not ( = ?auto_10656 ?auto_10658 ) ) ( not ( = ?auto_10656 ?auto_10687 ) ) ( not ( = ?auto_10658 ?auto_10677 ) ) ( not ( = ?auto_10658 ?auto_10673 ) ) ( not ( = ?auto_10672 ?auto_10684 ) ) ( not ( = ?auto_10672 ?auto_10680 ) ) ( not ( = ?auto_10678 ?auto_10676 ) ) ( not ( = ?auto_10678 ?auto_10688 ) ) ( not ( = ?auto_10687 ?auto_10677 ) ) ( not ( = ?auto_10687 ?auto_10673 ) ) ( not ( = ?auto_10655 ?auto_10659 ) ) ( not ( = ?auto_10655 ?auto_10686 ) ) ( not ( = ?auto_10656 ?auto_10659 ) ) ( not ( = ?auto_10656 ?auto_10686 ) ) ( not ( = ?auto_10657 ?auto_10659 ) ) ( not ( = ?auto_10657 ?auto_10686 ) ) ( not ( = ?auto_10659 ?auto_10687 ) ) ( not ( = ?auto_10659 ?auto_10677 ) ) ( not ( = ?auto_10659 ?auto_10673 ) ) ( not ( = ?auto_10682 ?auto_10672 ) ) ( not ( = ?auto_10682 ?auto_10684 ) ) ( not ( = ?auto_10682 ?auto_10680 ) ) ( not ( = ?auto_10670 ?auto_10678 ) ) ( not ( = ?auto_10670 ?auto_10676 ) ) ( not ( = ?auto_10670 ?auto_10688 ) ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10686 ?auto_10677 ) ) ( not ( = ?auto_10686 ?auto_10673 ) ) ( not ( = ?auto_10655 ?auto_10660 ) ) ( not ( = ?auto_10655 ?auto_10675 ) ) ( not ( = ?auto_10656 ?auto_10660 ) ) ( not ( = ?auto_10656 ?auto_10675 ) ) ( not ( = ?auto_10657 ?auto_10660 ) ) ( not ( = ?auto_10657 ?auto_10675 ) ) ( not ( = ?auto_10658 ?auto_10660 ) ) ( not ( = ?auto_10658 ?auto_10675 ) ) ( not ( = ?auto_10660 ?auto_10686 ) ) ( not ( = ?auto_10660 ?auto_10687 ) ) ( not ( = ?auto_10660 ?auto_10677 ) ) ( not ( = ?auto_10660 ?auto_10673 ) ) ( not ( = ?auto_10675 ?auto_10686 ) ) ( not ( = ?auto_10675 ?auto_10687 ) ) ( not ( = ?auto_10675 ?auto_10677 ) ) ( not ( = ?auto_10675 ?auto_10673 ) ) ( not ( = ?auto_10655 ?auto_10661 ) ) ( not ( = ?auto_10655 ?auto_10674 ) ) ( not ( = ?auto_10656 ?auto_10661 ) ) ( not ( = ?auto_10656 ?auto_10674 ) ) ( not ( = ?auto_10657 ?auto_10661 ) ) ( not ( = ?auto_10657 ?auto_10674 ) ) ( not ( = ?auto_10658 ?auto_10661 ) ) ( not ( = ?auto_10658 ?auto_10674 ) ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( not ( = ?auto_10659 ?auto_10674 ) ) ( not ( = ?auto_10661 ?auto_10675 ) ) ( not ( = ?auto_10661 ?auto_10686 ) ) ( not ( = ?auto_10661 ?auto_10687 ) ) ( not ( = ?auto_10661 ?auto_10677 ) ) ( not ( = ?auto_10661 ?auto_10673 ) ) ( not ( = ?auto_10685 ?auto_10680 ) ) ( not ( = ?auto_10685 ?auto_10682 ) ) ( not ( = ?auto_10685 ?auto_10672 ) ) ( not ( = ?auto_10685 ?auto_10684 ) ) ( not ( = ?auto_10681 ?auto_10688 ) ) ( not ( = ?auto_10681 ?auto_10670 ) ) ( not ( = ?auto_10681 ?auto_10678 ) ) ( not ( = ?auto_10681 ?auto_10676 ) ) ( not ( = ?auto_10674 ?auto_10675 ) ) ( not ( = ?auto_10674 ?auto_10686 ) ) ( not ( = ?auto_10674 ?auto_10687 ) ) ( not ( = ?auto_10674 ?auto_10677 ) ) ( not ( = ?auto_10674 ?auto_10673 ) ) ( not ( = ?auto_10655 ?auto_10662 ) ) ( not ( = ?auto_10655 ?auto_10671 ) ) ( not ( = ?auto_10656 ?auto_10662 ) ) ( not ( = ?auto_10656 ?auto_10671 ) ) ( not ( = ?auto_10657 ?auto_10662 ) ) ( not ( = ?auto_10657 ?auto_10671 ) ) ( not ( = ?auto_10658 ?auto_10662 ) ) ( not ( = ?auto_10658 ?auto_10671 ) ) ( not ( = ?auto_10659 ?auto_10662 ) ) ( not ( = ?auto_10659 ?auto_10671 ) ) ( not ( = ?auto_10660 ?auto_10662 ) ) ( not ( = ?auto_10660 ?auto_10671 ) ) ( not ( = ?auto_10662 ?auto_10674 ) ) ( not ( = ?auto_10662 ?auto_10675 ) ) ( not ( = ?auto_10662 ?auto_10686 ) ) ( not ( = ?auto_10662 ?auto_10687 ) ) ( not ( = ?auto_10662 ?auto_10677 ) ) ( not ( = ?auto_10662 ?auto_10673 ) ) ( not ( = ?auto_10683 ?auto_10685 ) ) ( not ( = ?auto_10683 ?auto_10680 ) ) ( not ( = ?auto_10683 ?auto_10682 ) ) ( not ( = ?auto_10683 ?auto_10672 ) ) ( not ( = ?auto_10683 ?auto_10684 ) ) ( not ( = ?auto_10679 ?auto_10681 ) ) ( not ( = ?auto_10679 ?auto_10688 ) ) ( not ( = ?auto_10679 ?auto_10670 ) ) ( not ( = ?auto_10679 ?auto_10678 ) ) ( not ( = ?auto_10679 ?auto_10676 ) ) ( not ( = ?auto_10671 ?auto_10674 ) ) ( not ( = ?auto_10671 ?auto_10675 ) ) ( not ( = ?auto_10671 ?auto_10686 ) ) ( not ( = ?auto_10671 ?auto_10687 ) ) ( not ( = ?auto_10671 ?auto_10677 ) ) ( not ( = ?auto_10671 ?auto_10673 ) ) ( not ( = ?auto_10655 ?auto_10663 ) ) ( not ( = ?auto_10655 ?auto_10667 ) ) ( not ( = ?auto_10656 ?auto_10663 ) ) ( not ( = ?auto_10656 ?auto_10667 ) ) ( not ( = ?auto_10657 ?auto_10663 ) ) ( not ( = ?auto_10657 ?auto_10667 ) ) ( not ( = ?auto_10658 ?auto_10663 ) ) ( not ( = ?auto_10658 ?auto_10667 ) ) ( not ( = ?auto_10659 ?auto_10663 ) ) ( not ( = ?auto_10659 ?auto_10667 ) ) ( not ( = ?auto_10660 ?auto_10663 ) ) ( not ( = ?auto_10660 ?auto_10667 ) ) ( not ( = ?auto_10661 ?auto_10663 ) ) ( not ( = ?auto_10661 ?auto_10667 ) ) ( not ( = ?auto_10663 ?auto_10671 ) ) ( not ( = ?auto_10663 ?auto_10674 ) ) ( not ( = ?auto_10663 ?auto_10675 ) ) ( not ( = ?auto_10663 ?auto_10686 ) ) ( not ( = ?auto_10663 ?auto_10687 ) ) ( not ( = ?auto_10663 ?auto_10677 ) ) ( not ( = ?auto_10663 ?auto_10673 ) ) ( not ( = ?auto_10669 ?auto_10683 ) ) ( not ( = ?auto_10669 ?auto_10685 ) ) ( not ( = ?auto_10669 ?auto_10680 ) ) ( not ( = ?auto_10669 ?auto_10682 ) ) ( not ( = ?auto_10669 ?auto_10672 ) ) ( not ( = ?auto_10669 ?auto_10684 ) ) ( not ( = ?auto_10665 ?auto_10679 ) ) ( not ( = ?auto_10665 ?auto_10681 ) ) ( not ( = ?auto_10665 ?auto_10688 ) ) ( not ( = ?auto_10665 ?auto_10670 ) ) ( not ( = ?auto_10665 ?auto_10678 ) ) ( not ( = ?auto_10665 ?auto_10676 ) ) ( not ( = ?auto_10667 ?auto_10671 ) ) ( not ( = ?auto_10667 ?auto_10674 ) ) ( not ( = ?auto_10667 ?auto_10675 ) ) ( not ( = ?auto_10667 ?auto_10686 ) ) ( not ( = ?auto_10667 ?auto_10687 ) ) ( not ( = ?auto_10667 ?auto_10677 ) ) ( not ( = ?auto_10667 ?auto_10673 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10655 ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10661 ?auto_10662 )
      ( MAKE-1CRATE ?auto_10662 ?auto_10663 )
      ( MAKE-8CRATE-VERIFY ?auto_10655 ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10661 ?auto_10662 ?auto_10663 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10709 - SURFACE
      ?auto_10710 - SURFACE
      ?auto_10711 - SURFACE
      ?auto_10712 - SURFACE
      ?auto_10713 - SURFACE
      ?auto_10714 - SURFACE
      ?auto_10715 - SURFACE
      ?auto_10716 - SURFACE
      ?auto_10717 - SURFACE
      ?auto_10718 - SURFACE
    )
    :vars
    (
      ?auto_10719 - HOIST
      ?auto_10721 - PLACE
      ?auto_10720 - PLACE
      ?auto_10722 - HOIST
      ?auto_10724 - SURFACE
      ?auto_10746 - PLACE
      ?auto_10728 - HOIST
      ?auto_10744 - SURFACE
      ?auto_10743 - PLACE
      ?auto_10735 - HOIST
      ?auto_10736 - SURFACE
      ?auto_10745 - PLACE
      ?auto_10727 - HOIST
      ?auto_10725 - SURFACE
      ?auto_10737 - PLACE
      ?auto_10734 - HOIST
      ?auto_10742 - SURFACE
      ?auto_10733 - PLACE
      ?auto_10729 - HOIST
      ?auto_10731 - SURFACE
      ?auto_10739 - PLACE
      ?auto_10741 - HOIST
      ?auto_10732 - SURFACE
      ?auto_10730 - PLACE
      ?auto_10726 - HOIST
      ?auto_10740 - SURFACE
      ?auto_10738 - SURFACE
      ?auto_10723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10719 ?auto_10721 ) ( IS-CRATE ?auto_10718 ) ( not ( = ?auto_10720 ?auto_10721 ) ) ( HOIST-AT ?auto_10722 ?auto_10720 ) ( AVAILABLE ?auto_10722 ) ( SURFACE-AT ?auto_10718 ?auto_10720 ) ( ON ?auto_10718 ?auto_10724 ) ( CLEAR ?auto_10718 ) ( not ( = ?auto_10717 ?auto_10718 ) ) ( not ( = ?auto_10717 ?auto_10724 ) ) ( not ( = ?auto_10718 ?auto_10724 ) ) ( not ( = ?auto_10719 ?auto_10722 ) ) ( IS-CRATE ?auto_10717 ) ( not ( = ?auto_10746 ?auto_10721 ) ) ( HOIST-AT ?auto_10728 ?auto_10746 ) ( AVAILABLE ?auto_10728 ) ( SURFACE-AT ?auto_10717 ?auto_10746 ) ( ON ?auto_10717 ?auto_10744 ) ( CLEAR ?auto_10717 ) ( not ( = ?auto_10716 ?auto_10717 ) ) ( not ( = ?auto_10716 ?auto_10744 ) ) ( not ( = ?auto_10717 ?auto_10744 ) ) ( not ( = ?auto_10719 ?auto_10728 ) ) ( IS-CRATE ?auto_10716 ) ( not ( = ?auto_10743 ?auto_10721 ) ) ( HOIST-AT ?auto_10735 ?auto_10743 ) ( AVAILABLE ?auto_10735 ) ( SURFACE-AT ?auto_10716 ?auto_10743 ) ( ON ?auto_10716 ?auto_10736 ) ( CLEAR ?auto_10716 ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10736 ) ) ( not ( = ?auto_10716 ?auto_10736 ) ) ( not ( = ?auto_10719 ?auto_10735 ) ) ( IS-CRATE ?auto_10715 ) ( not ( = ?auto_10745 ?auto_10721 ) ) ( HOIST-AT ?auto_10727 ?auto_10745 ) ( AVAILABLE ?auto_10727 ) ( SURFACE-AT ?auto_10715 ?auto_10745 ) ( ON ?auto_10715 ?auto_10725 ) ( CLEAR ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10715 ) ) ( not ( = ?auto_10714 ?auto_10725 ) ) ( not ( = ?auto_10715 ?auto_10725 ) ) ( not ( = ?auto_10719 ?auto_10727 ) ) ( IS-CRATE ?auto_10714 ) ( not ( = ?auto_10737 ?auto_10721 ) ) ( HOIST-AT ?auto_10734 ?auto_10737 ) ( SURFACE-AT ?auto_10714 ?auto_10737 ) ( ON ?auto_10714 ?auto_10742 ) ( CLEAR ?auto_10714 ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10742 ) ) ( not ( = ?auto_10714 ?auto_10742 ) ) ( not ( = ?auto_10719 ?auto_10734 ) ) ( IS-CRATE ?auto_10713 ) ( not ( = ?auto_10733 ?auto_10721 ) ) ( HOIST-AT ?auto_10729 ?auto_10733 ) ( AVAILABLE ?auto_10729 ) ( SURFACE-AT ?auto_10713 ?auto_10733 ) ( ON ?auto_10713 ?auto_10731 ) ( CLEAR ?auto_10713 ) ( not ( = ?auto_10712 ?auto_10713 ) ) ( not ( = ?auto_10712 ?auto_10731 ) ) ( not ( = ?auto_10713 ?auto_10731 ) ) ( not ( = ?auto_10719 ?auto_10729 ) ) ( IS-CRATE ?auto_10712 ) ( not ( = ?auto_10739 ?auto_10721 ) ) ( HOIST-AT ?auto_10741 ?auto_10739 ) ( AVAILABLE ?auto_10741 ) ( SURFACE-AT ?auto_10712 ?auto_10739 ) ( ON ?auto_10712 ?auto_10732 ) ( CLEAR ?auto_10712 ) ( not ( = ?auto_10711 ?auto_10712 ) ) ( not ( = ?auto_10711 ?auto_10732 ) ) ( not ( = ?auto_10712 ?auto_10732 ) ) ( not ( = ?auto_10719 ?auto_10741 ) ) ( IS-CRATE ?auto_10711 ) ( not ( = ?auto_10730 ?auto_10721 ) ) ( HOIST-AT ?auto_10726 ?auto_10730 ) ( AVAILABLE ?auto_10726 ) ( SURFACE-AT ?auto_10711 ?auto_10730 ) ( ON ?auto_10711 ?auto_10740 ) ( CLEAR ?auto_10711 ) ( not ( = ?auto_10710 ?auto_10711 ) ) ( not ( = ?auto_10710 ?auto_10740 ) ) ( not ( = ?auto_10711 ?auto_10740 ) ) ( not ( = ?auto_10719 ?auto_10726 ) ) ( SURFACE-AT ?auto_10709 ?auto_10721 ) ( CLEAR ?auto_10709 ) ( IS-CRATE ?auto_10710 ) ( AVAILABLE ?auto_10719 ) ( AVAILABLE ?auto_10734 ) ( SURFACE-AT ?auto_10710 ?auto_10737 ) ( ON ?auto_10710 ?auto_10738 ) ( CLEAR ?auto_10710 ) ( TRUCK-AT ?auto_10723 ?auto_10721 ) ( not ( = ?auto_10709 ?auto_10710 ) ) ( not ( = ?auto_10709 ?auto_10738 ) ) ( not ( = ?auto_10710 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10711 ) ) ( not ( = ?auto_10709 ?auto_10740 ) ) ( not ( = ?auto_10711 ?auto_10738 ) ) ( not ( = ?auto_10730 ?auto_10737 ) ) ( not ( = ?auto_10726 ?auto_10734 ) ) ( not ( = ?auto_10740 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10712 ) ) ( not ( = ?auto_10709 ?auto_10732 ) ) ( not ( = ?auto_10710 ?auto_10712 ) ) ( not ( = ?auto_10710 ?auto_10732 ) ) ( not ( = ?auto_10712 ?auto_10740 ) ) ( not ( = ?auto_10712 ?auto_10738 ) ) ( not ( = ?auto_10739 ?auto_10730 ) ) ( not ( = ?auto_10739 ?auto_10737 ) ) ( not ( = ?auto_10741 ?auto_10726 ) ) ( not ( = ?auto_10741 ?auto_10734 ) ) ( not ( = ?auto_10732 ?auto_10740 ) ) ( not ( = ?auto_10732 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10713 ) ) ( not ( = ?auto_10709 ?auto_10731 ) ) ( not ( = ?auto_10710 ?auto_10713 ) ) ( not ( = ?auto_10710 ?auto_10731 ) ) ( not ( = ?auto_10711 ?auto_10713 ) ) ( not ( = ?auto_10711 ?auto_10731 ) ) ( not ( = ?auto_10713 ?auto_10732 ) ) ( not ( = ?auto_10713 ?auto_10740 ) ) ( not ( = ?auto_10713 ?auto_10738 ) ) ( not ( = ?auto_10733 ?auto_10739 ) ) ( not ( = ?auto_10733 ?auto_10730 ) ) ( not ( = ?auto_10733 ?auto_10737 ) ) ( not ( = ?auto_10729 ?auto_10741 ) ) ( not ( = ?auto_10729 ?auto_10726 ) ) ( not ( = ?auto_10729 ?auto_10734 ) ) ( not ( = ?auto_10731 ?auto_10732 ) ) ( not ( = ?auto_10731 ?auto_10740 ) ) ( not ( = ?auto_10731 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10714 ) ) ( not ( = ?auto_10709 ?auto_10742 ) ) ( not ( = ?auto_10710 ?auto_10714 ) ) ( not ( = ?auto_10710 ?auto_10742 ) ) ( not ( = ?auto_10711 ?auto_10714 ) ) ( not ( = ?auto_10711 ?auto_10742 ) ) ( not ( = ?auto_10712 ?auto_10714 ) ) ( not ( = ?auto_10712 ?auto_10742 ) ) ( not ( = ?auto_10714 ?auto_10731 ) ) ( not ( = ?auto_10714 ?auto_10732 ) ) ( not ( = ?auto_10714 ?auto_10740 ) ) ( not ( = ?auto_10714 ?auto_10738 ) ) ( not ( = ?auto_10742 ?auto_10731 ) ) ( not ( = ?auto_10742 ?auto_10732 ) ) ( not ( = ?auto_10742 ?auto_10740 ) ) ( not ( = ?auto_10742 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10715 ) ) ( not ( = ?auto_10709 ?auto_10725 ) ) ( not ( = ?auto_10710 ?auto_10715 ) ) ( not ( = ?auto_10710 ?auto_10725 ) ) ( not ( = ?auto_10711 ?auto_10715 ) ) ( not ( = ?auto_10711 ?auto_10725 ) ) ( not ( = ?auto_10712 ?auto_10715 ) ) ( not ( = ?auto_10712 ?auto_10725 ) ) ( not ( = ?auto_10713 ?auto_10715 ) ) ( not ( = ?auto_10713 ?auto_10725 ) ) ( not ( = ?auto_10715 ?auto_10742 ) ) ( not ( = ?auto_10715 ?auto_10731 ) ) ( not ( = ?auto_10715 ?auto_10732 ) ) ( not ( = ?auto_10715 ?auto_10740 ) ) ( not ( = ?auto_10715 ?auto_10738 ) ) ( not ( = ?auto_10745 ?auto_10737 ) ) ( not ( = ?auto_10745 ?auto_10733 ) ) ( not ( = ?auto_10745 ?auto_10739 ) ) ( not ( = ?auto_10745 ?auto_10730 ) ) ( not ( = ?auto_10727 ?auto_10734 ) ) ( not ( = ?auto_10727 ?auto_10729 ) ) ( not ( = ?auto_10727 ?auto_10741 ) ) ( not ( = ?auto_10727 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10742 ) ) ( not ( = ?auto_10725 ?auto_10731 ) ) ( not ( = ?auto_10725 ?auto_10732 ) ) ( not ( = ?auto_10725 ?auto_10740 ) ) ( not ( = ?auto_10725 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10716 ) ) ( not ( = ?auto_10709 ?auto_10736 ) ) ( not ( = ?auto_10710 ?auto_10716 ) ) ( not ( = ?auto_10710 ?auto_10736 ) ) ( not ( = ?auto_10711 ?auto_10716 ) ) ( not ( = ?auto_10711 ?auto_10736 ) ) ( not ( = ?auto_10712 ?auto_10716 ) ) ( not ( = ?auto_10712 ?auto_10736 ) ) ( not ( = ?auto_10713 ?auto_10716 ) ) ( not ( = ?auto_10713 ?auto_10736 ) ) ( not ( = ?auto_10714 ?auto_10716 ) ) ( not ( = ?auto_10714 ?auto_10736 ) ) ( not ( = ?auto_10716 ?auto_10725 ) ) ( not ( = ?auto_10716 ?auto_10742 ) ) ( not ( = ?auto_10716 ?auto_10731 ) ) ( not ( = ?auto_10716 ?auto_10732 ) ) ( not ( = ?auto_10716 ?auto_10740 ) ) ( not ( = ?auto_10716 ?auto_10738 ) ) ( not ( = ?auto_10743 ?auto_10745 ) ) ( not ( = ?auto_10743 ?auto_10737 ) ) ( not ( = ?auto_10743 ?auto_10733 ) ) ( not ( = ?auto_10743 ?auto_10739 ) ) ( not ( = ?auto_10743 ?auto_10730 ) ) ( not ( = ?auto_10735 ?auto_10727 ) ) ( not ( = ?auto_10735 ?auto_10734 ) ) ( not ( = ?auto_10735 ?auto_10729 ) ) ( not ( = ?auto_10735 ?auto_10741 ) ) ( not ( = ?auto_10735 ?auto_10726 ) ) ( not ( = ?auto_10736 ?auto_10725 ) ) ( not ( = ?auto_10736 ?auto_10742 ) ) ( not ( = ?auto_10736 ?auto_10731 ) ) ( not ( = ?auto_10736 ?auto_10732 ) ) ( not ( = ?auto_10736 ?auto_10740 ) ) ( not ( = ?auto_10736 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10717 ) ) ( not ( = ?auto_10709 ?auto_10744 ) ) ( not ( = ?auto_10710 ?auto_10717 ) ) ( not ( = ?auto_10710 ?auto_10744 ) ) ( not ( = ?auto_10711 ?auto_10717 ) ) ( not ( = ?auto_10711 ?auto_10744 ) ) ( not ( = ?auto_10712 ?auto_10717 ) ) ( not ( = ?auto_10712 ?auto_10744 ) ) ( not ( = ?auto_10713 ?auto_10717 ) ) ( not ( = ?auto_10713 ?auto_10744 ) ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10744 ) ) ( not ( = ?auto_10715 ?auto_10717 ) ) ( not ( = ?auto_10715 ?auto_10744 ) ) ( not ( = ?auto_10717 ?auto_10736 ) ) ( not ( = ?auto_10717 ?auto_10725 ) ) ( not ( = ?auto_10717 ?auto_10742 ) ) ( not ( = ?auto_10717 ?auto_10731 ) ) ( not ( = ?auto_10717 ?auto_10732 ) ) ( not ( = ?auto_10717 ?auto_10740 ) ) ( not ( = ?auto_10717 ?auto_10738 ) ) ( not ( = ?auto_10746 ?auto_10743 ) ) ( not ( = ?auto_10746 ?auto_10745 ) ) ( not ( = ?auto_10746 ?auto_10737 ) ) ( not ( = ?auto_10746 ?auto_10733 ) ) ( not ( = ?auto_10746 ?auto_10739 ) ) ( not ( = ?auto_10746 ?auto_10730 ) ) ( not ( = ?auto_10728 ?auto_10735 ) ) ( not ( = ?auto_10728 ?auto_10727 ) ) ( not ( = ?auto_10728 ?auto_10734 ) ) ( not ( = ?auto_10728 ?auto_10729 ) ) ( not ( = ?auto_10728 ?auto_10741 ) ) ( not ( = ?auto_10728 ?auto_10726 ) ) ( not ( = ?auto_10744 ?auto_10736 ) ) ( not ( = ?auto_10744 ?auto_10725 ) ) ( not ( = ?auto_10744 ?auto_10742 ) ) ( not ( = ?auto_10744 ?auto_10731 ) ) ( not ( = ?auto_10744 ?auto_10732 ) ) ( not ( = ?auto_10744 ?auto_10740 ) ) ( not ( = ?auto_10744 ?auto_10738 ) ) ( not ( = ?auto_10709 ?auto_10718 ) ) ( not ( = ?auto_10709 ?auto_10724 ) ) ( not ( = ?auto_10710 ?auto_10718 ) ) ( not ( = ?auto_10710 ?auto_10724 ) ) ( not ( = ?auto_10711 ?auto_10718 ) ) ( not ( = ?auto_10711 ?auto_10724 ) ) ( not ( = ?auto_10712 ?auto_10718 ) ) ( not ( = ?auto_10712 ?auto_10724 ) ) ( not ( = ?auto_10713 ?auto_10718 ) ) ( not ( = ?auto_10713 ?auto_10724 ) ) ( not ( = ?auto_10714 ?auto_10718 ) ) ( not ( = ?auto_10714 ?auto_10724 ) ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( not ( = ?auto_10715 ?auto_10724 ) ) ( not ( = ?auto_10716 ?auto_10718 ) ) ( not ( = ?auto_10716 ?auto_10724 ) ) ( not ( = ?auto_10718 ?auto_10744 ) ) ( not ( = ?auto_10718 ?auto_10736 ) ) ( not ( = ?auto_10718 ?auto_10725 ) ) ( not ( = ?auto_10718 ?auto_10742 ) ) ( not ( = ?auto_10718 ?auto_10731 ) ) ( not ( = ?auto_10718 ?auto_10732 ) ) ( not ( = ?auto_10718 ?auto_10740 ) ) ( not ( = ?auto_10718 ?auto_10738 ) ) ( not ( = ?auto_10720 ?auto_10746 ) ) ( not ( = ?auto_10720 ?auto_10743 ) ) ( not ( = ?auto_10720 ?auto_10745 ) ) ( not ( = ?auto_10720 ?auto_10737 ) ) ( not ( = ?auto_10720 ?auto_10733 ) ) ( not ( = ?auto_10720 ?auto_10739 ) ) ( not ( = ?auto_10720 ?auto_10730 ) ) ( not ( = ?auto_10722 ?auto_10728 ) ) ( not ( = ?auto_10722 ?auto_10735 ) ) ( not ( = ?auto_10722 ?auto_10727 ) ) ( not ( = ?auto_10722 ?auto_10734 ) ) ( not ( = ?auto_10722 ?auto_10729 ) ) ( not ( = ?auto_10722 ?auto_10741 ) ) ( not ( = ?auto_10722 ?auto_10726 ) ) ( not ( = ?auto_10724 ?auto_10744 ) ) ( not ( = ?auto_10724 ?auto_10736 ) ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10742 ) ) ( not ( = ?auto_10724 ?auto_10731 ) ) ( not ( = ?auto_10724 ?auto_10732 ) ) ( not ( = ?auto_10724 ?auto_10740 ) ) ( not ( = ?auto_10724 ?auto_10738 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10709 ?auto_10710 ?auto_10711 ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10716 ?auto_10717 )
      ( MAKE-1CRATE ?auto_10717 ?auto_10718 )
      ( MAKE-9CRATE-VERIFY ?auto_10709 ?auto_10710 ?auto_10711 ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10716 ?auto_10717 ?auto_10718 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10768 - SURFACE
      ?auto_10769 - SURFACE
      ?auto_10770 - SURFACE
      ?auto_10771 - SURFACE
      ?auto_10772 - SURFACE
      ?auto_10773 - SURFACE
      ?auto_10774 - SURFACE
      ?auto_10775 - SURFACE
      ?auto_10776 - SURFACE
      ?auto_10777 - SURFACE
      ?auto_10778 - SURFACE
    )
    :vars
    (
      ?auto_10784 - HOIST
      ?auto_10783 - PLACE
      ?auto_10782 - PLACE
      ?auto_10781 - HOIST
      ?auto_10780 - SURFACE
      ?auto_10791 - PLACE
      ?auto_10807 - HOIST
      ?auto_10798 - SURFACE
      ?auto_10805 - PLACE
      ?auto_10795 - HOIST
      ?auto_10794 - SURFACE
      ?auto_10803 - PLACE
      ?auto_10801 - HOIST
      ?auto_10792 - SURFACE
      ?auto_10804 - PLACE
      ?auto_10802 - HOIST
      ?auto_10796 - SURFACE
      ?auto_10800 - SURFACE
      ?auto_10799 - PLACE
      ?auto_10790 - HOIST
      ?auto_10789 - SURFACE
      ?auto_10793 - PLACE
      ?auto_10785 - HOIST
      ?auto_10787 - SURFACE
      ?auto_10806 - PLACE
      ?auto_10797 - HOIST
      ?auto_10788 - SURFACE
      ?auto_10786 - SURFACE
      ?auto_10779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10784 ?auto_10783 ) ( IS-CRATE ?auto_10778 ) ( not ( = ?auto_10782 ?auto_10783 ) ) ( HOIST-AT ?auto_10781 ?auto_10782 ) ( SURFACE-AT ?auto_10778 ?auto_10782 ) ( ON ?auto_10778 ?auto_10780 ) ( CLEAR ?auto_10778 ) ( not ( = ?auto_10777 ?auto_10778 ) ) ( not ( = ?auto_10777 ?auto_10780 ) ) ( not ( = ?auto_10778 ?auto_10780 ) ) ( not ( = ?auto_10784 ?auto_10781 ) ) ( IS-CRATE ?auto_10777 ) ( not ( = ?auto_10791 ?auto_10783 ) ) ( HOIST-AT ?auto_10807 ?auto_10791 ) ( AVAILABLE ?auto_10807 ) ( SURFACE-AT ?auto_10777 ?auto_10791 ) ( ON ?auto_10777 ?auto_10798 ) ( CLEAR ?auto_10777 ) ( not ( = ?auto_10776 ?auto_10777 ) ) ( not ( = ?auto_10776 ?auto_10798 ) ) ( not ( = ?auto_10777 ?auto_10798 ) ) ( not ( = ?auto_10784 ?auto_10807 ) ) ( IS-CRATE ?auto_10776 ) ( not ( = ?auto_10805 ?auto_10783 ) ) ( HOIST-AT ?auto_10795 ?auto_10805 ) ( AVAILABLE ?auto_10795 ) ( SURFACE-AT ?auto_10776 ?auto_10805 ) ( ON ?auto_10776 ?auto_10794 ) ( CLEAR ?auto_10776 ) ( not ( = ?auto_10775 ?auto_10776 ) ) ( not ( = ?auto_10775 ?auto_10794 ) ) ( not ( = ?auto_10776 ?auto_10794 ) ) ( not ( = ?auto_10784 ?auto_10795 ) ) ( IS-CRATE ?auto_10775 ) ( not ( = ?auto_10803 ?auto_10783 ) ) ( HOIST-AT ?auto_10801 ?auto_10803 ) ( AVAILABLE ?auto_10801 ) ( SURFACE-AT ?auto_10775 ?auto_10803 ) ( ON ?auto_10775 ?auto_10792 ) ( CLEAR ?auto_10775 ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( not ( = ?auto_10774 ?auto_10792 ) ) ( not ( = ?auto_10775 ?auto_10792 ) ) ( not ( = ?auto_10784 ?auto_10801 ) ) ( IS-CRATE ?auto_10774 ) ( not ( = ?auto_10804 ?auto_10783 ) ) ( HOIST-AT ?auto_10802 ?auto_10804 ) ( AVAILABLE ?auto_10802 ) ( SURFACE-AT ?auto_10774 ?auto_10804 ) ( ON ?auto_10774 ?auto_10796 ) ( CLEAR ?auto_10774 ) ( not ( = ?auto_10773 ?auto_10774 ) ) ( not ( = ?auto_10773 ?auto_10796 ) ) ( not ( = ?auto_10774 ?auto_10796 ) ) ( not ( = ?auto_10784 ?auto_10802 ) ) ( IS-CRATE ?auto_10773 ) ( SURFACE-AT ?auto_10773 ?auto_10782 ) ( ON ?auto_10773 ?auto_10800 ) ( CLEAR ?auto_10773 ) ( not ( = ?auto_10772 ?auto_10773 ) ) ( not ( = ?auto_10772 ?auto_10800 ) ) ( not ( = ?auto_10773 ?auto_10800 ) ) ( IS-CRATE ?auto_10772 ) ( not ( = ?auto_10799 ?auto_10783 ) ) ( HOIST-AT ?auto_10790 ?auto_10799 ) ( AVAILABLE ?auto_10790 ) ( SURFACE-AT ?auto_10772 ?auto_10799 ) ( ON ?auto_10772 ?auto_10789 ) ( CLEAR ?auto_10772 ) ( not ( = ?auto_10771 ?auto_10772 ) ) ( not ( = ?auto_10771 ?auto_10789 ) ) ( not ( = ?auto_10772 ?auto_10789 ) ) ( not ( = ?auto_10784 ?auto_10790 ) ) ( IS-CRATE ?auto_10771 ) ( not ( = ?auto_10793 ?auto_10783 ) ) ( HOIST-AT ?auto_10785 ?auto_10793 ) ( AVAILABLE ?auto_10785 ) ( SURFACE-AT ?auto_10771 ?auto_10793 ) ( ON ?auto_10771 ?auto_10787 ) ( CLEAR ?auto_10771 ) ( not ( = ?auto_10770 ?auto_10771 ) ) ( not ( = ?auto_10770 ?auto_10787 ) ) ( not ( = ?auto_10771 ?auto_10787 ) ) ( not ( = ?auto_10784 ?auto_10785 ) ) ( IS-CRATE ?auto_10770 ) ( not ( = ?auto_10806 ?auto_10783 ) ) ( HOIST-AT ?auto_10797 ?auto_10806 ) ( AVAILABLE ?auto_10797 ) ( SURFACE-AT ?auto_10770 ?auto_10806 ) ( ON ?auto_10770 ?auto_10788 ) ( CLEAR ?auto_10770 ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( not ( = ?auto_10769 ?auto_10788 ) ) ( not ( = ?auto_10770 ?auto_10788 ) ) ( not ( = ?auto_10784 ?auto_10797 ) ) ( SURFACE-AT ?auto_10768 ?auto_10783 ) ( CLEAR ?auto_10768 ) ( IS-CRATE ?auto_10769 ) ( AVAILABLE ?auto_10784 ) ( AVAILABLE ?auto_10781 ) ( SURFACE-AT ?auto_10769 ?auto_10782 ) ( ON ?auto_10769 ?auto_10786 ) ( CLEAR ?auto_10769 ) ( TRUCK-AT ?auto_10779 ?auto_10783 ) ( not ( = ?auto_10768 ?auto_10769 ) ) ( not ( = ?auto_10768 ?auto_10786 ) ) ( not ( = ?auto_10769 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10770 ) ) ( not ( = ?auto_10768 ?auto_10788 ) ) ( not ( = ?auto_10770 ?auto_10786 ) ) ( not ( = ?auto_10806 ?auto_10782 ) ) ( not ( = ?auto_10797 ?auto_10781 ) ) ( not ( = ?auto_10788 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10771 ) ) ( not ( = ?auto_10768 ?auto_10787 ) ) ( not ( = ?auto_10769 ?auto_10771 ) ) ( not ( = ?auto_10769 ?auto_10787 ) ) ( not ( = ?auto_10771 ?auto_10788 ) ) ( not ( = ?auto_10771 ?auto_10786 ) ) ( not ( = ?auto_10793 ?auto_10806 ) ) ( not ( = ?auto_10793 ?auto_10782 ) ) ( not ( = ?auto_10785 ?auto_10797 ) ) ( not ( = ?auto_10785 ?auto_10781 ) ) ( not ( = ?auto_10787 ?auto_10788 ) ) ( not ( = ?auto_10787 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10772 ) ) ( not ( = ?auto_10768 ?auto_10789 ) ) ( not ( = ?auto_10769 ?auto_10772 ) ) ( not ( = ?auto_10769 ?auto_10789 ) ) ( not ( = ?auto_10770 ?auto_10772 ) ) ( not ( = ?auto_10770 ?auto_10789 ) ) ( not ( = ?auto_10772 ?auto_10787 ) ) ( not ( = ?auto_10772 ?auto_10788 ) ) ( not ( = ?auto_10772 ?auto_10786 ) ) ( not ( = ?auto_10799 ?auto_10793 ) ) ( not ( = ?auto_10799 ?auto_10806 ) ) ( not ( = ?auto_10799 ?auto_10782 ) ) ( not ( = ?auto_10790 ?auto_10785 ) ) ( not ( = ?auto_10790 ?auto_10797 ) ) ( not ( = ?auto_10790 ?auto_10781 ) ) ( not ( = ?auto_10789 ?auto_10787 ) ) ( not ( = ?auto_10789 ?auto_10788 ) ) ( not ( = ?auto_10789 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10773 ) ) ( not ( = ?auto_10768 ?auto_10800 ) ) ( not ( = ?auto_10769 ?auto_10773 ) ) ( not ( = ?auto_10769 ?auto_10800 ) ) ( not ( = ?auto_10770 ?auto_10773 ) ) ( not ( = ?auto_10770 ?auto_10800 ) ) ( not ( = ?auto_10771 ?auto_10773 ) ) ( not ( = ?auto_10771 ?auto_10800 ) ) ( not ( = ?auto_10773 ?auto_10789 ) ) ( not ( = ?auto_10773 ?auto_10787 ) ) ( not ( = ?auto_10773 ?auto_10788 ) ) ( not ( = ?auto_10773 ?auto_10786 ) ) ( not ( = ?auto_10800 ?auto_10789 ) ) ( not ( = ?auto_10800 ?auto_10787 ) ) ( not ( = ?auto_10800 ?auto_10788 ) ) ( not ( = ?auto_10800 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10774 ) ) ( not ( = ?auto_10768 ?auto_10796 ) ) ( not ( = ?auto_10769 ?auto_10774 ) ) ( not ( = ?auto_10769 ?auto_10796 ) ) ( not ( = ?auto_10770 ?auto_10774 ) ) ( not ( = ?auto_10770 ?auto_10796 ) ) ( not ( = ?auto_10771 ?auto_10774 ) ) ( not ( = ?auto_10771 ?auto_10796 ) ) ( not ( = ?auto_10772 ?auto_10774 ) ) ( not ( = ?auto_10772 ?auto_10796 ) ) ( not ( = ?auto_10774 ?auto_10800 ) ) ( not ( = ?auto_10774 ?auto_10789 ) ) ( not ( = ?auto_10774 ?auto_10787 ) ) ( not ( = ?auto_10774 ?auto_10788 ) ) ( not ( = ?auto_10774 ?auto_10786 ) ) ( not ( = ?auto_10804 ?auto_10782 ) ) ( not ( = ?auto_10804 ?auto_10799 ) ) ( not ( = ?auto_10804 ?auto_10793 ) ) ( not ( = ?auto_10804 ?auto_10806 ) ) ( not ( = ?auto_10802 ?auto_10781 ) ) ( not ( = ?auto_10802 ?auto_10790 ) ) ( not ( = ?auto_10802 ?auto_10785 ) ) ( not ( = ?auto_10802 ?auto_10797 ) ) ( not ( = ?auto_10796 ?auto_10800 ) ) ( not ( = ?auto_10796 ?auto_10789 ) ) ( not ( = ?auto_10796 ?auto_10787 ) ) ( not ( = ?auto_10796 ?auto_10788 ) ) ( not ( = ?auto_10796 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10775 ) ) ( not ( = ?auto_10768 ?auto_10792 ) ) ( not ( = ?auto_10769 ?auto_10775 ) ) ( not ( = ?auto_10769 ?auto_10792 ) ) ( not ( = ?auto_10770 ?auto_10775 ) ) ( not ( = ?auto_10770 ?auto_10792 ) ) ( not ( = ?auto_10771 ?auto_10775 ) ) ( not ( = ?auto_10771 ?auto_10792 ) ) ( not ( = ?auto_10772 ?auto_10775 ) ) ( not ( = ?auto_10772 ?auto_10792 ) ) ( not ( = ?auto_10773 ?auto_10775 ) ) ( not ( = ?auto_10773 ?auto_10792 ) ) ( not ( = ?auto_10775 ?auto_10796 ) ) ( not ( = ?auto_10775 ?auto_10800 ) ) ( not ( = ?auto_10775 ?auto_10789 ) ) ( not ( = ?auto_10775 ?auto_10787 ) ) ( not ( = ?auto_10775 ?auto_10788 ) ) ( not ( = ?auto_10775 ?auto_10786 ) ) ( not ( = ?auto_10803 ?auto_10804 ) ) ( not ( = ?auto_10803 ?auto_10782 ) ) ( not ( = ?auto_10803 ?auto_10799 ) ) ( not ( = ?auto_10803 ?auto_10793 ) ) ( not ( = ?auto_10803 ?auto_10806 ) ) ( not ( = ?auto_10801 ?auto_10802 ) ) ( not ( = ?auto_10801 ?auto_10781 ) ) ( not ( = ?auto_10801 ?auto_10790 ) ) ( not ( = ?auto_10801 ?auto_10785 ) ) ( not ( = ?auto_10801 ?auto_10797 ) ) ( not ( = ?auto_10792 ?auto_10796 ) ) ( not ( = ?auto_10792 ?auto_10800 ) ) ( not ( = ?auto_10792 ?auto_10789 ) ) ( not ( = ?auto_10792 ?auto_10787 ) ) ( not ( = ?auto_10792 ?auto_10788 ) ) ( not ( = ?auto_10792 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10776 ) ) ( not ( = ?auto_10768 ?auto_10794 ) ) ( not ( = ?auto_10769 ?auto_10776 ) ) ( not ( = ?auto_10769 ?auto_10794 ) ) ( not ( = ?auto_10770 ?auto_10776 ) ) ( not ( = ?auto_10770 ?auto_10794 ) ) ( not ( = ?auto_10771 ?auto_10776 ) ) ( not ( = ?auto_10771 ?auto_10794 ) ) ( not ( = ?auto_10772 ?auto_10776 ) ) ( not ( = ?auto_10772 ?auto_10794 ) ) ( not ( = ?auto_10773 ?auto_10776 ) ) ( not ( = ?auto_10773 ?auto_10794 ) ) ( not ( = ?auto_10774 ?auto_10776 ) ) ( not ( = ?auto_10774 ?auto_10794 ) ) ( not ( = ?auto_10776 ?auto_10792 ) ) ( not ( = ?auto_10776 ?auto_10796 ) ) ( not ( = ?auto_10776 ?auto_10800 ) ) ( not ( = ?auto_10776 ?auto_10789 ) ) ( not ( = ?auto_10776 ?auto_10787 ) ) ( not ( = ?auto_10776 ?auto_10788 ) ) ( not ( = ?auto_10776 ?auto_10786 ) ) ( not ( = ?auto_10805 ?auto_10803 ) ) ( not ( = ?auto_10805 ?auto_10804 ) ) ( not ( = ?auto_10805 ?auto_10782 ) ) ( not ( = ?auto_10805 ?auto_10799 ) ) ( not ( = ?auto_10805 ?auto_10793 ) ) ( not ( = ?auto_10805 ?auto_10806 ) ) ( not ( = ?auto_10795 ?auto_10801 ) ) ( not ( = ?auto_10795 ?auto_10802 ) ) ( not ( = ?auto_10795 ?auto_10781 ) ) ( not ( = ?auto_10795 ?auto_10790 ) ) ( not ( = ?auto_10795 ?auto_10785 ) ) ( not ( = ?auto_10795 ?auto_10797 ) ) ( not ( = ?auto_10794 ?auto_10792 ) ) ( not ( = ?auto_10794 ?auto_10796 ) ) ( not ( = ?auto_10794 ?auto_10800 ) ) ( not ( = ?auto_10794 ?auto_10789 ) ) ( not ( = ?auto_10794 ?auto_10787 ) ) ( not ( = ?auto_10794 ?auto_10788 ) ) ( not ( = ?auto_10794 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10777 ) ) ( not ( = ?auto_10768 ?auto_10798 ) ) ( not ( = ?auto_10769 ?auto_10777 ) ) ( not ( = ?auto_10769 ?auto_10798 ) ) ( not ( = ?auto_10770 ?auto_10777 ) ) ( not ( = ?auto_10770 ?auto_10798 ) ) ( not ( = ?auto_10771 ?auto_10777 ) ) ( not ( = ?auto_10771 ?auto_10798 ) ) ( not ( = ?auto_10772 ?auto_10777 ) ) ( not ( = ?auto_10772 ?auto_10798 ) ) ( not ( = ?auto_10773 ?auto_10777 ) ) ( not ( = ?auto_10773 ?auto_10798 ) ) ( not ( = ?auto_10774 ?auto_10777 ) ) ( not ( = ?auto_10774 ?auto_10798 ) ) ( not ( = ?auto_10775 ?auto_10777 ) ) ( not ( = ?auto_10775 ?auto_10798 ) ) ( not ( = ?auto_10777 ?auto_10794 ) ) ( not ( = ?auto_10777 ?auto_10792 ) ) ( not ( = ?auto_10777 ?auto_10796 ) ) ( not ( = ?auto_10777 ?auto_10800 ) ) ( not ( = ?auto_10777 ?auto_10789 ) ) ( not ( = ?auto_10777 ?auto_10787 ) ) ( not ( = ?auto_10777 ?auto_10788 ) ) ( not ( = ?auto_10777 ?auto_10786 ) ) ( not ( = ?auto_10791 ?auto_10805 ) ) ( not ( = ?auto_10791 ?auto_10803 ) ) ( not ( = ?auto_10791 ?auto_10804 ) ) ( not ( = ?auto_10791 ?auto_10782 ) ) ( not ( = ?auto_10791 ?auto_10799 ) ) ( not ( = ?auto_10791 ?auto_10793 ) ) ( not ( = ?auto_10791 ?auto_10806 ) ) ( not ( = ?auto_10807 ?auto_10795 ) ) ( not ( = ?auto_10807 ?auto_10801 ) ) ( not ( = ?auto_10807 ?auto_10802 ) ) ( not ( = ?auto_10807 ?auto_10781 ) ) ( not ( = ?auto_10807 ?auto_10790 ) ) ( not ( = ?auto_10807 ?auto_10785 ) ) ( not ( = ?auto_10807 ?auto_10797 ) ) ( not ( = ?auto_10798 ?auto_10794 ) ) ( not ( = ?auto_10798 ?auto_10792 ) ) ( not ( = ?auto_10798 ?auto_10796 ) ) ( not ( = ?auto_10798 ?auto_10800 ) ) ( not ( = ?auto_10798 ?auto_10789 ) ) ( not ( = ?auto_10798 ?auto_10787 ) ) ( not ( = ?auto_10798 ?auto_10788 ) ) ( not ( = ?auto_10798 ?auto_10786 ) ) ( not ( = ?auto_10768 ?auto_10778 ) ) ( not ( = ?auto_10768 ?auto_10780 ) ) ( not ( = ?auto_10769 ?auto_10778 ) ) ( not ( = ?auto_10769 ?auto_10780 ) ) ( not ( = ?auto_10770 ?auto_10778 ) ) ( not ( = ?auto_10770 ?auto_10780 ) ) ( not ( = ?auto_10771 ?auto_10778 ) ) ( not ( = ?auto_10771 ?auto_10780 ) ) ( not ( = ?auto_10772 ?auto_10778 ) ) ( not ( = ?auto_10772 ?auto_10780 ) ) ( not ( = ?auto_10773 ?auto_10778 ) ) ( not ( = ?auto_10773 ?auto_10780 ) ) ( not ( = ?auto_10774 ?auto_10778 ) ) ( not ( = ?auto_10774 ?auto_10780 ) ) ( not ( = ?auto_10775 ?auto_10778 ) ) ( not ( = ?auto_10775 ?auto_10780 ) ) ( not ( = ?auto_10776 ?auto_10778 ) ) ( not ( = ?auto_10776 ?auto_10780 ) ) ( not ( = ?auto_10778 ?auto_10798 ) ) ( not ( = ?auto_10778 ?auto_10794 ) ) ( not ( = ?auto_10778 ?auto_10792 ) ) ( not ( = ?auto_10778 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10800 ) ) ( not ( = ?auto_10778 ?auto_10789 ) ) ( not ( = ?auto_10778 ?auto_10787 ) ) ( not ( = ?auto_10778 ?auto_10788 ) ) ( not ( = ?auto_10778 ?auto_10786 ) ) ( not ( = ?auto_10780 ?auto_10798 ) ) ( not ( = ?auto_10780 ?auto_10794 ) ) ( not ( = ?auto_10780 ?auto_10792 ) ) ( not ( = ?auto_10780 ?auto_10796 ) ) ( not ( = ?auto_10780 ?auto_10800 ) ) ( not ( = ?auto_10780 ?auto_10789 ) ) ( not ( = ?auto_10780 ?auto_10787 ) ) ( not ( = ?auto_10780 ?auto_10788 ) ) ( not ( = ?auto_10780 ?auto_10786 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10768 ?auto_10769 ?auto_10770 ?auto_10771 ?auto_10772 ?auto_10773 ?auto_10774 ?auto_10775 ?auto_10776 ?auto_10777 )
      ( MAKE-1CRATE ?auto_10777 ?auto_10778 )
      ( MAKE-10CRATE-VERIFY ?auto_10768 ?auto_10769 ?auto_10770 ?auto_10771 ?auto_10772 ?auto_10773 ?auto_10774 ?auto_10775 ?auto_10776 ?auto_10777 ?auto_10778 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10830 - SURFACE
      ?auto_10831 - SURFACE
      ?auto_10832 - SURFACE
      ?auto_10833 - SURFACE
      ?auto_10834 - SURFACE
      ?auto_10835 - SURFACE
      ?auto_10836 - SURFACE
      ?auto_10837 - SURFACE
      ?auto_10838 - SURFACE
      ?auto_10839 - SURFACE
      ?auto_10840 - SURFACE
      ?auto_10841 - SURFACE
    )
    :vars
    (
      ?auto_10846 - HOIST
      ?auto_10844 - PLACE
      ?auto_10847 - PLACE
      ?auto_10842 - HOIST
      ?auto_10843 - SURFACE
      ?auto_10857 - PLACE
      ?auto_10856 - HOIST
      ?auto_10855 - SURFACE
      ?auto_10866 - PLACE
      ?auto_10858 - HOIST
      ?auto_10865 - SURFACE
      ?auto_10863 - PLACE
      ?auto_10861 - HOIST
      ?auto_10869 - SURFACE
      ?auto_10871 - PLACE
      ?auto_10872 - HOIST
      ?auto_10852 - SURFACE
      ?auto_10850 - PLACE
      ?auto_10864 - HOIST
      ?auto_10853 - SURFACE
      ?auto_10867 - SURFACE
      ?auto_10848 - PLACE
      ?auto_10862 - HOIST
      ?auto_10870 - SURFACE
      ?auto_10860 - PLACE
      ?auto_10851 - HOIST
      ?auto_10854 - SURFACE
      ?auto_10859 - PLACE
      ?auto_10849 - HOIST
      ?auto_10873 - SURFACE
      ?auto_10868 - SURFACE
      ?auto_10845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10846 ?auto_10844 ) ( IS-CRATE ?auto_10841 ) ( not ( = ?auto_10847 ?auto_10844 ) ) ( HOIST-AT ?auto_10842 ?auto_10847 ) ( AVAILABLE ?auto_10842 ) ( SURFACE-AT ?auto_10841 ?auto_10847 ) ( ON ?auto_10841 ?auto_10843 ) ( CLEAR ?auto_10841 ) ( not ( = ?auto_10840 ?auto_10841 ) ) ( not ( = ?auto_10840 ?auto_10843 ) ) ( not ( = ?auto_10841 ?auto_10843 ) ) ( not ( = ?auto_10846 ?auto_10842 ) ) ( IS-CRATE ?auto_10840 ) ( not ( = ?auto_10857 ?auto_10844 ) ) ( HOIST-AT ?auto_10856 ?auto_10857 ) ( SURFACE-AT ?auto_10840 ?auto_10857 ) ( ON ?auto_10840 ?auto_10855 ) ( CLEAR ?auto_10840 ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( not ( = ?auto_10839 ?auto_10855 ) ) ( not ( = ?auto_10840 ?auto_10855 ) ) ( not ( = ?auto_10846 ?auto_10856 ) ) ( IS-CRATE ?auto_10839 ) ( not ( = ?auto_10866 ?auto_10844 ) ) ( HOIST-AT ?auto_10858 ?auto_10866 ) ( AVAILABLE ?auto_10858 ) ( SURFACE-AT ?auto_10839 ?auto_10866 ) ( ON ?auto_10839 ?auto_10865 ) ( CLEAR ?auto_10839 ) ( not ( = ?auto_10838 ?auto_10839 ) ) ( not ( = ?auto_10838 ?auto_10865 ) ) ( not ( = ?auto_10839 ?auto_10865 ) ) ( not ( = ?auto_10846 ?auto_10858 ) ) ( IS-CRATE ?auto_10838 ) ( not ( = ?auto_10863 ?auto_10844 ) ) ( HOIST-AT ?auto_10861 ?auto_10863 ) ( AVAILABLE ?auto_10861 ) ( SURFACE-AT ?auto_10838 ?auto_10863 ) ( ON ?auto_10838 ?auto_10869 ) ( CLEAR ?auto_10838 ) ( not ( = ?auto_10837 ?auto_10838 ) ) ( not ( = ?auto_10837 ?auto_10869 ) ) ( not ( = ?auto_10838 ?auto_10869 ) ) ( not ( = ?auto_10846 ?auto_10861 ) ) ( IS-CRATE ?auto_10837 ) ( not ( = ?auto_10871 ?auto_10844 ) ) ( HOIST-AT ?auto_10872 ?auto_10871 ) ( AVAILABLE ?auto_10872 ) ( SURFACE-AT ?auto_10837 ?auto_10871 ) ( ON ?auto_10837 ?auto_10852 ) ( CLEAR ?auto_10837 ) ( not ( = ?auto_10836 ?auto_10837 ) ) ( not ( = ?auto_10836 ?auto_10852 ) ) ( not ( = ?auto_10837 ?auto_10852 ) ) ( not ( = ?auto_10846 ?auto_10872 ) ) ( IS-CRATE ?auto_10836 ) ( not ( = ?auto_10850 ?auto_10844 ) ) ( HOIST-AT ?auto_10864 ?auto_10850 ) ( AVAILABLE ?auto_10864 ) ( SURFACE-AT ?auto_10836 ?auto_10850 ) ( ON ?auto_10836 ?auto_10853 ) ( CLEAR ?auto_10836 ) ( not ( = ?auto_10835 ?auto_10836 ) ) ( not ( = ?auto_10835 ?auto_10853 ) ) ( not ( = ?auto_10836 ?auto_10853 ) ) ( not ( = ?auto_10846 ?auto_10864 ) ) ( IS-CRATE ?auto_10835 ) ( SURFACE-AT ?auto_10835 ?auto_10857 ) ( ON ?auto_10835 ?auto_10867 ) ( CLEAR ?auto_10835 ) ( not ( = ?auto_10834 ?auto_10835 ) ) ( not ( = ?auto_10834 ?auto_10867 ) ) ( not ( = ?auto_10835 ?auto_10867 ) ) ( IS-CRATE ?auto_10834 ) ( not ( = ?auto_10848 ?auto_10844 ) ) ( HOIST-AT ?auto_10862 ?auto_10848 ) ( AVAILABLE ?auto_10862 ) ( SURFACE-AT ?auto_10834 ?auto_10848 ) ( ON ?auto_10834 ?auto_10870 ) ( CLEAR ?auto_10834 ) ( not ( = ?auto_10833 ?auto_10834 ) ) ( not ( = ?auto_10833 ?auto_10870 ) ) ( not ( = ?auto_10834 ?auto_10870 ) ) ( not ( = ?auto_10846 ?auto_10862 ) ) ( IS-CRATE ?auto_10833 ) ( not ( = ?auto_10860 ?auto_10844 ) ) ( HOIST-AT ?auto_10851 ?auto_10860 ) ( AVAILABLE ?auto_10851 ) ( SURFACE-AT ?auto_10833 ?auto_10860 ) ( ON ?auto_10833 ?auto_10854 ) ( CLEAR ?auto_10833 ) ( not ( = ?auto_10832 ?auto_10833 ) ) ( not ( = ?auto_10832 ?auto_10854 ) ) ( not ( = ?auto_10833 ?auto_10854 ) ) ( not ( = ?auto_10846 ?auto_10851 ) ) ( IS-CRATE ?auto_10832 ) ( not ( = ?auto_10859 ?auto_10844 ) ) ( HOIST-AT ?auto_10849 ?auto_10859 ) ( AVAILABLE ?auto_10849 ) ( SURFACE-AT ?auto_10832 ?auto_10859 ) ( ON ?auto_10832 ?auto_10873 ) ( CLEAR ?auto_10832 ) ( not ( = ?auto_10831 ?auto_10832 ) ) ( not ( = ?auto_10831 ?auto_10873 ) ) ( not ( = ?auto_10832 ?auto_10873 ) ) ( not ( = ?auto_10846 ?auto_10849 ) ) ( SURFACE-AT ?auto_10830 ?auto_10844 ) ( CLEAR ?auto_10830 ) ( IS-CRATE ?auto_10831 ) ( AVAILABLE ?auto_10846 ) ( AVAILABLE ?auto_10856 ) ( SURFACE-AT ?auto_10831 ?auto_10857 ) ( ON ?auto_10831 ?auto_10868 ) ( CLEAR ?auto_10831 ) ( TRUCK-AT ?auto_10845 ?auto_10844 ) ( not ( = ?auto_10830 ?auto_10831 ) ) ( not ( = ?auto_10830 ?auto_10868 ) ) ( not ( = ?auto_10831 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10832 ) ) ( not ( = ?auto_10830 ?auto_10873 ) ) ( not ( = ?auto_10832 ?auto_10868 ) ) ( not ( = ?auto_10859 ?auto_10857 ) ) ( not ( = ?auto_10849 ?auto_10856 ) ) ( not ( = ?auto_10873 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10833 ) ) ( not ( = ?auto_10830 ?auto_10854 ) ) ( not ( = ?auto_10831 ?auto_10833 ) ) ( not ( = ?auto_10831 ?auto_10854 ) ) ( not ( = ?auto_10833 ?auto_10873 ) ) ( not ( = ?auto_10833 ?auto_10868 ) ) ( not ( = ?auto_10860 ?auto_10859 ) ) ( not ( = ?auto_10860 ?auto_10857 ) ) ( not ( = ?auto_10851 ?auto_10849 ) ) ( not ( = ?auto_10851 ?auto_10856 ) ) ( not ( = ?auto_10854 ?auto_10873 ) ) ( not ( = ?auto_10854 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10834 ) ) ( not ( = ?auto_10830 ?auto_10870 ) ) ( not ( = ?auto_10831 ?auto_10834 ) ) ( not ( = ?auto_10831 ?auto_10870 ) ) ( not ( = ?auto_10832 ?auto_10834 ) ) ( not ( = ?auto_10832 ?auto_10870 ) ) ( not ( = ?auto_10834 ?auto_10854 ) ) ( not ( = ?auto_10834 ?auto_10873 ) ) ( not ( = ?auto_10834 ?auto_10868 ) ) ( not ( = ?auto_10848 ?auto_10860 ) ) ( not ( = ?auto_10848 ?auto_10859 ) ) ( not ( = ?auto_10848 ?auto_10857 ) ) ( not ( = ?auto_10862 ?auto_10851 ) ) ( not ( = ?auto_10862 ?auto_10849 ) ) ( not ( = ?auto_10862 ?auto_10856 ) ) ( not ( = ?auto_10870 ?auto_10854 ) ) ( not ( = ?auto_10870 ?auto_10873 ) ) ( not ( = ?auto_10870 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10835 ) ) ( not ( = ?auto_10830 ?auto_10867 ) ) ( not ( = ?auto_10831 ?auto_10835 ) ) ( not ( = ?auto_10831 ?auto_10867 ) ) ( not ( = ?auto_10832 ?auto_10835 ) ) ( not ( = ?auto_10832 ?auto_10867 ) ) ( not ( = ?auto_10833 ?auto_10835 ) ) ( not ( = ?auto_10833 ?auto_10867 ) ) ( not ( = ?auto_10835 ?auto_10870 ) ) ( not ( = ?auto_10835 ?auto_10854 ) ) ( not ( = ?auto_10835 ?auto_10873 ) ) ( not ( = ?auto_10835 ?auto_10868 ) ) ( not ( = ?auto_10867 ?auto_10870 ) ) ( not ( = ?auto_10867 ?auto_10854 ) ) ( not ( = ?auto_10867 ?auto_10873 ) ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10836 ) ) ( not ( = ?auto_10830 ?auto_10853 ) ) ( not ( = ?auto_10831 ?auto_10836 ) ) ( not ( = ?auto_10831 ?auto_10853 ) ) ( not ( = ?auto_10832 ?auto_10836 ) ) ( not ( = ?auto_10832 ?auto_10853 ) ) ( not ( = ?auto_10833 ?auto_10836 ) ) ( not ( = ?auto_10833 ?auto_10853 ) ) ( not ( = ?auto_10834 ?auto_10836 ) ) ( not ( = ?auto_10834 ?auto_10853 ) ) ( not ( = ?auto_10836 ?auto_10867 ) ) ( not ( = ?auto_10836 ?auto_10870 ) ) ( not ( = ?auto_10836 ?auto_10854 ) ) ( not ( = ?auto_10836 ?auto_10873 ) ) ( not ( = ?auto_10836 ?auto_10868 ) ) ( not ( = ?auto_10850 ?auto_10857 ) ) ( not ( = ?auto_10850 ?auto_10848 ) ) ( not ( = ?auto_10850 ?auto_10860 ) ) ( not ( = ?auto_10850 ?auto_10859 ) ) ( not ( = ?auto_10864 ?auto_10856 ) ) ( not ( = ?auto_10864 ?auto_10862 ) ) ( not ( = ?auto_10864 ?auto_10851 ) ) ( not ( = ?auto_10864 ?auto_10849 ) ) ( not ( = ?auto_10853 ?auto_10867 ) ) ( not ( = ?auto_10853 ?auto_10870 ) ) ( not ( = ?auto_10853 ?auto_10854 ) ) ( not ( = ?auto_10853 ?auto_10873 ) ) ( not ( = ?auto_10853 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10837 ) ) ( not ( = ?auto_10830 ?auto_10852 ) ) ( not ( = ?auto_10831 ?auto_10837 ) ) ( not ( = ?auto_10831 ?auto_10852 ) ) ( not ( = ?auto_10832 ?auto_10837 ) ) ( not ( = ?auto_10832 ?auto_10852 ) ) ( not ( = ?auto_10833 ?auto_10837 ) ) ( not ( = ?auto_10833 ?auto_10852 ) ) ( not ( = ?auto_10834 ?auto_10837 ) ) ( not ( = ?auto_10834 ?auto_10852 ) ) ( not ( = ?auto_10835 ?auto_10837 ) ) ( not ( = ?auto_10835 ?auto_10852 ) ) ( not ( = ?auto_10837 ?auto_10853 ) ) ( not ( = ?auto_10837 ?auto_10867 ) ) ( not ( = ?auto_10837 ?auto_10870 ) ) ( not ( = ?auto_10837 ?auto_10854 ) ) ( not ( = ?auto_10837 ?auto_10873 ) ) ( not ( = ?auto_10837 ?auto_10868 ) ) ( not ( = ?auto_10871 ?auto_10850 ) ) ( not ( = ?auto_10871 ?auto_10857 ) ) ( not ( = ?auto_10871 ?auto_10848 ) ) ( not ( = ?auto_10871 ?auto_10860 ) ) ( not ( = ?auto_10871 ?auto_10859 ) ) ( not ( = ?auto_10872 ?auto_10864 ) ) ( not ( = ?auto_10872 ?auto_10856 ) ) ( not ( = ?auto_10872 ?auto_10862 ) ) ( not ( = ?auto_10872 ?auto_10851 ) ) ( not ( = ?auto_10872 ?auto_10849 ) ) ( not ( = ?auto_10852 ?auto_10853 ) ) ( not ( = ?auto_10852 ?auto_10867 ) ) ( not ( = ?auto_10852 ?auto_10870 ) ) ( not ( = ?auto_10852 ?auto_10854 ) ) ( not ( = ?auto_10852 ?auto_10873 ) ) ( not ( = ?auto_10852 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10838 ) ) ( not ( = ?auto_10830 ?auto_10869 ) ) ( not ( = ?auto_10831 ?auto_10838 ) ) ( not ( = ?auto_10831 ?auto_10869 ) ) ( not ( = ?auto_10832 ?auto_10838 ) ) ( not ( = ?auto_10832 ?auto_10869 ) ) ( not ( = ?auto_10833 ?auto_10838 ) ) ( not ( = ?auto_10833 ?auto_10869 ) ) ( not ( = ?auto_10834 ?auto_10838 ) ) ( not ( = ?auto_10834 ?auto_10869 ) ) ( not ( = ?auto_10835 ?auto_10838 ) ) ( not ( = ?auto_10835 ?auto_10869 ) ) ( not ( = ?auto_10836 ?auto_10838 ) ) ( not ( = ?auto_10836 ?auto_10869 ) ) ( not ( = ?auto_10838 ?auto_10852 ) ) ( not ( = ?auto_10838 ?auto_10853 ) ) ( not ( = ?auto_10838 ?auto_10867 ) ) ( not ( = ?auto_10838 ?auto_10870 ) ) ( not ( = ?auto_10838 ?auto_10854 ) ) ( not ( = ?auto_10838 ?auto_10873 ) ) ( not ( = ?auto_10838 ?auto_10868 ) ) ( not ( = ?auto_10863 ?auto_10871 ) ) ( not ( = ?auto_10863 ?auto_10850 ) ) ( not ( = ?auto_10863 ?auto_10857 ) ) ( not ( = ?auto_10863 ?auto_10848 ) ) ( not ( = ?auto_10863 ?auto_10860 ) ) ( not ( = ?auto_10863 ?auto_10859 ) ) ( not ( = ?auto_10861 ?auto_10872 ) ) ( not ( = ?auto_10861 ?auto_10864 ) ) ( not ( = ?auto_10861 ?auto_10856 ) ) ( not ( = ?auto_10861 ?auto_10862 ) ) ( not ( = ?auto_10861 ?auto_10851 ) ) ( not ( = ?auto_10861 ?auto_10849 ) ) ( not ( = ?auto_10869 ?auto_10852 ) ) ( not ( = ?auto_10869 ?auto_10853 ) ) ( not ( = ?auto_10869 ?auto_10867 ) ) ( not ( = ?auto_10869 ?auto_10870 ) ) ( not ( = ?auto_10869 ?auto_10854 ) ) ( not ( = ?auto_10869 ?auto_10873 ) ) ( not ( = ?auto_10869 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10839 ) ) ( not ( = ?auto_10830 ?auto_10865 ) ) ( not ( = ?auto_10831 ?auto_10839 ) ) ( not ( = ?auto_10831 ?auto_10865 ) ) ( not ( = ?auto_10832 ?auto_10839 ) ) ( not ( = ?auto_10832 ?auto_10865 ) ) ( not ( = ?auto_10833 ?auto_10839 ) ) ( not ( = ?auto_10833 ?auto_10865 ) ) ( not ( = ?auto_10834 ?auto_10839 ) ) ( not ( = ?auto_10834 ?auto_10865 ) ) ( not ( = ?auto_10835 ?auto_10839 ) ) ( not ( = ?auto_10835 ?auto_10865 ) ) ( not ( = ?auto_10836 ?auto_10839 ) ) ( not ( = ?auto_10836 ?auto_10865 ) ) ( not ( = ?auto_10837 ?auto_10839 ) ) ( not ( = ?auto_10837 ?auto_10865 ) ) ( not ( = ?auto_10839 ?auto_10869 ) ) ( not ( = ?auto_10839 ?auto_10852 ) ) ( not ( = ?auto_10839 ?auto_10853 ) ) ( not ( = ?auto_10839 ?auto_10867 ) ) ( not ( = ?auto_10839 ?auto_10870 ) ) ( not ( = ?auto_10839 ?auto_10854 ) ) ( not ( = ?auto_10839 ?auto_10873 ) ) ( not ( = ?auto_10839 ?auto_10868 ) ) ( not ( = ?auto_10866 ?auto_10863 ) ) ( not ( = ?auto_10866 ?auto_10871 ) ) ( not ( = ?auto_10866 ?auto_10850 ) ) ( not ( = ?auto_10866 ?auto_10857 ) ) ( not ( = ?auto_10866 ?auto_10848 ) ) ( not ( = ?auto_10866 ?auto_10860 ) ) ( not ( = ?auto_10866 ?auto_10859 ) ) ( not ( = ?auto_10858 ?auto_10861 ) ) ( not ( = ?auto_10858 ?auto_10872 ) ) ( not ( = ?auto_10858 ?auto_10864 ) ) ( not ( = ?auto_10858 ?auto_10856 ) ) ( not ( = ?auto_10858 ?auto_10862 ) ) ( not ( = ?auto_10858 ?auto_10851 ) ) ( not ( = ?auto_10858 ?auto_10849 ) ) ( not ( = ?auto_10865 ?auto_10869 ) ) ( not ( = ?auto_10865 ?auto_10852 ) ) ( not ( = ?auto_10865 ?auto_10853 ) ) ( not ( = ?auto_10865 ?auto_10867 ) ) ( not ( = ?auto_10865 ?auto_10870 ) ) ( not ( = ?auto_10865 ?auto_10854 ) ) ( not ( = ?auto_10865 ?auto_10873 ) ) ( not ( = ?auto_10865 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10840 ) ) ( not ( = ?auto_10830 ?auto_10855 ) ) ( not ( = ?auto_10831 ?auto_10840 ) ) ( not ( = ?auto_10831 ?auto_10855 ) ) ( not ( = ?auto_10832 ?auto_10840 ) ) ( not ( = ?auto_10832 ?auto_10855 ) ) ( not ( = ?auto_10833 ?auto_10840 ) ) ( not ( = ?auto_10833 ?auto_10855 ) ) ( not ( = ?auto_10834 ?auto_10840 ) ) ( not ( = ?auto_10834 ?auto_10855 ) ) ( not ( = ?auto_10835 ?auto_10840 ) ) ( not ( = ?auto_10835 ?auto_10855 ) ) ( not ( = ?auto_10836 ?auto_10840 ) ) ( not ( = ?auto_10836 ?auto_10855 ) ) ( not ( = ?auto_10837 ?auto_10840 ) ) ( not ( = ?auto_10837 ?auto_10855 ) ) ( not ( = ?auto_10838 ?auto_10840 ) ) ( not ( = ?auto_10838 ?auto_10855 ) ) ( not ( = ?auto_10840 ?auto_10865 ) ) ( not ( = ?auto_10840 ?auto_10869 ) ) ( not ( = ?auto_10840 ?auto_10852 ) ) ( not ( = ?auto_10840 ?auto_10853 ) ) ( not ( = ?auto_10840 ?auto_10867 ) ) ( not ( = ?auto_10840 ?auto_10870 ) ) ( not ( = ?auto_10840 ?auto_10854 ) ) ( not ( = ?auto_10840 ?auto_10873 ) ) ( not ( = ?auto_10840 ?auto_10868 ) ) ( not ( = ?auto_10855 ?auto_10865 ) ) ( not ( = ?auto_10855 ?auto_10869 ) ) ( not ( = ?auto_10855 ?auto_10852 ) ) ( not ( = ?auto_10855 ?auto_10853 ) ) ( not ( = ?auto_10855 ?auto_10867 ) ) ( not ( = ?auto_10855 ?auto_10870 ) ) ( not ( = ?auto_10855 ?auto_10854 ) ) ( not ( = ?auto_10855 ?auto_10873 ) ) ( not ( = ?auto_10855 ?auto_10868 ) ) ( not ( = ?auto_10830 ?auto_10841 ) ) ( not ( = ?auto_10830 ?auto_10843 ) ) ( not ( = ?auto_10831 ?auto_10841 ) ) ( not ( = ?auto_10831 ?auto_10843 ) ) ( not ( = ?auto_10832 ?auto_10841 ) ) ( not ( = ?auto_10832 ?auto_10843 ) ) ( not ( = ?auto_10833 ?auto_10841 ) ) ( not ( = ?auto_10833 ?auto_10843 ) ) ( not ( = ?auto_10834 ?auto_10841 ) ) ( not ( = ?auto_10834 ?auto_10843 ) ) ( not ( = ?auto_10835 ?auto_10841 ) ) ( not ( = ?auto_10835 ?auto_10843 ) ) ( not ( = ?auto_10836 ?auto_10841 ) ) ( not ( = ?auto_10836 ?auto_10843 ) ) ( not ( = ?auto_10837 ?auto_10841 ) ) ( not ( = ?auto_10837 ?auto_10843 ) ) ( not ( = ?auto_10838 ?auto_10841 ) ) ( not ( = ?auto_10838 ?auto_10843 ) ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10839 ?auto_10843 ) ) ( not ( = ?auto_10841 ?auto_10855 ) ) ( not ( = ?auto_10841 ?auto_10865 ) ) ( not ( = ?auto_10841 ?auto_10869 ) ) ( not ( = ?auto_10841 ?auto_10852 ) ) ( not ( = ?auto_10841 ?auto_10853 ) ) ( not ( = ?auto_10841 ?auto_10867 ) ) ( not ( = ?auto_10841 ?auto_10870 ) ) ( not ( = ?auto_10841 ?auto_10854 ) ) ( not ( = ?auto_10841 ?auto_10873 ) ) ( not ( = ?auto_10841 ?auto_10868 ) ) ( not ( = ?auto_10847 ?auto_10857 ) ) ( not ( = ?auto_10847 ?auto_10866 ) ) ( not ( = ?auto_10847 ?auto_10863 ) ) ( not ( = ?auto_10847 ?auto_10871 ) ) ( not ( = ?auto_10847 ?auto_10850 ) ) ( not ( = ?auto_10847 ?auto_10848 ) ) ( not ( = ?auto_10847 ?auto_10860 ) ) ( not ( = ?auto_10847 ?auto_10859 ) ) ( not ( = ?auto_10842 ?auto_10856 ) ) ( not ( = ?auto_10842 ?auto_10858 ) ) ( not ( = ?auto_10842 ?auto_10861 ) ) ( not ( = ?auto_10842 ?auto_10872 ) ) ( not ( = ?auto_10842 ?auto_10864 ) ) ( not ( = ?auto_10842 ?auto_10862 ) ) ( not ( = ?auto_10842 ?auto_10851 ) ) ( not ( = ?auto_10842 ?auto_10849 ) ) ( not ( = ?auto_10843 ?auto_10855 ) ) ( not ( = ?auto_10843 ?auto_10865 ) ) ( not ( = ?auto_10843 ?auto_10869 ) ) ( not ( = ?auto_10843 ?auto_10852 ) ) ( not ( = ?auto_10843 ?auto_10853 ) ) ( not ( = ?auto_10843 ?auto_10867 ) ) ( not ( = ?auto_10843 ?auto_10870 ) ) ( not ( = ?auto_10843 ?auto_10854 ) ) ( not ( = ?auto_10843 ?auto_10873 ) ) ( not ( = ?auto_10843 ?auto_10868 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10830 ?auto_10831 ?auto_10832 ?auto_10833 ?auto_10834 ?auto_10835 ?auto_10836 ?auto_10837 ?auto_10838 ?auto_10839 ?auto_10840 )
      ( MAKE-1CRATE ?auto_10840 ?auto_10841 )
      ( MAKE-11CRATE-VERIFY ?auto_10830 ?auto_10831 ?auto_10832 ?auto_10833 ?auto_10834 ?auto_10835 ?auto_10836 ?auto_10837 ?auto_10838 ?auto_10839 ?auto_10840 ?auto_10841 ) )
  )

)

