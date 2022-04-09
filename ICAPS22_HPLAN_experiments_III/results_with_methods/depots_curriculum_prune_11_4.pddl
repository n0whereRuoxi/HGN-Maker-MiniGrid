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
      ?auto_10381 - SURFACE
      ?auto_10382 - SURFACE
    )
    :vars
    (
      ?auto_10383 - HOIST
      ?auto_10384 - PLACE
      ?auto_10386 - PLACE
      ?auto_10387 - HOIST
      ?auto_10388 - SURFACE
      ?auto_10385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10383 ?auto_10384 ) ( SURFACE-AT ?auto_10381 ?auto_10384 ) ( CLEAR ?auto_10381 ) ( IS-CRATE ?auto_10382 ) ( AVAILABLE ?auto_10383 ) ( not ( = ?auto_10386 ?auto_10384 ) ) ( HOIST-AT ?auto_10387 ?auto_10386 ) ( AVAILABLE ?auto_10387 ) ( SURFACE-AT ?auto_10382 ?auto_10386 ) ( ON ?auto_10382 ?auto_10388 ) ( CLEAR ?auto_10382 ) ( TRUCK-AT ?auto_10385 ?auto_10384 ) ( not ( = ?auto_10381 ?auto_10382 ) ) ( not ( = ?auto_10381 ?auto_10388 ) ) ( not ( = ?auto_10382 ?auto_10388 ) ) ( not ( = ?auto_10383 ?auto_10387 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10385 ?auto_10384 ?auto_10386 )
      ( !LIFT ?auto_10387 ?auto_10382 ?auto_10388 ?auto_10386 )
      ( !LOAD ?auto_10387 ?auto_10382 ?auto_10385 ?auto_10386 )
      ( !DRIVE ?auto_10385 ?auto_10386 ?auto_10384 )
      ( !UNLOAD ?auto_10383 ?auto_10382 ?auto_10385 ?auto_10384 )
      ( !DROP ?auto_10383 ?auto_10382 ?auto_10381 ?auto_10384 )
      ( MAKE-1CRATE-VERIFY ?auto_10381 ?auto_10382 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10402 - SURFACE
      ?auto_10403 - SURFACE
      ?auto_10404 - SURFACE
    )
    :vars
    (
      ?auto_10409 - HOIST
      ?auto_10407 - PLACE
      ?auto_10406 - PLACE
      ?auto_10408 - HOIST
      ?auto_10405 - SURFACE
      ?auto_10411 - PLACE
      ?auto_10412 - HOIST
      ?auto_10413 - SURFACE
      ?auto_10410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10409 ?auto_10407 ) ( IS-CRATE ?auto_10404 ) ( not ( = ?auto_10406 ?auto_10407 ) ) ( HOIST-AT ?auto_10408 ?auto_10406 ) ( AVAILABLE ?auto_10408 ) ( SURFACE-AT ?auto_10404 ?auto_10406 ) ( ON ?auto_10404 ?auto_10405 ) ( CLEAR ?auto_10404 ) ( not ( = ?auto_10403 ?auto_10404 ) ) ( not ( = ?auto_10403 ?auto_10405 ) ) ( not ( = ?auto_10404 ?auto_10405 ) ) ( not ( = ?auto_10409 ?auto_10408 ) ) ( SURFACE-AT ?auto_10402 ?auto_10407 ) ( CLEAR ?auto_10402 ) ( IS-CRATE ?auto_10403 ) ( AVAILABLE ?auto_10409 ) ( not ( = ?auto_10411 ?auto_10407 ) ) ( HOIST-AT ?auto_10412 ?auto_10411 ) ( AVAILABLE ?auto_10412 ) ( SURFACE-AT ?auto_10403 ?auto_10411 ) ( ON ?auto_10403 ?auto_10413 ) ( CLEAR ?auto_10403 ) ( TRUCK-AT ?auto_10410 ?auto_10407 ) ( not ( = ?auto_10402 ?auto_10403 ) ) ( not ( = ?auto_10402 ?auto_10413 ) ) ( not ( = ?auto_10403 ?auto_10413 ) ) ( not ( = ?auto_10409 ?auto_10412 ) ) ( not ( = ?auto_10402 ?auto_10404 ) ) ( not ( = ?auto_10402 ?auto_10405 ) ) ( not ( = ?auto_10404 ?auto_10413 ) ) ( not ( = ?auto_10406 ?auto_10411 ) ) ( not ( = ?auto_10408 ?auto_10412 ) ) ( not ( = ?auto_10405 ?auto_10413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10402 ?auto_10403 )
      ( MAKE-1CRATE ?auto_10403 ?auto_10404 )
      ( MAKE-2CRATE-VERIFY ?auto_10402 ?auto_10403 ?auto_10404 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10428 - SURFACE
      ?auto_10429 - SURFACE
      ?auto_10430 - SURFACE
      ?auto_10431 - SURFACE
    )
    :vars
    (
      ?auto_10433 - HOIST
      ?auto_10434 - PLACE
      ?auto_10437 - PLACE
      ?auto_10436 - HOIST
      ?auto_10432 - SURFACE
      ?auto_10440 - PLACE
      ?auto_10442 - HOIST
      ?auto_10438 - SURFACE
      ?auto_10443 - PLACE
      ?auto_10441 - HOIST
      ?auto_10439 - SURFACE
      ?auto_10435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10433 ?auto_10434 ) ( IS-CRATE ?auto_10431 ) ( not ( = ?auto_10437 ?auto_10434 ) ) ( HOIST-AT ?auto_10436 ?auto_10437 ) ( AVAILABLE ?auto_10436 ) ( SURFACE-AT ?auto_10431 ?auto_10437 ) ( ON ?auto_10431 ?auto_10432 ) ( CLEAR ?auto_10431 ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10432 ) ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( not ( = ?auto_10433 ?auto_10436 ) ) ( IS-CRATE ?auto_10430 ) ( not ( = ?auto_10440 ?auto_10434 ) ) ( HOIST-AT ?auto_10442 ?auto_10440 ) ( AVAILABLE ?auto_10442 ) ( SURFACE-AT ?auto_10430 ?auto_10440 ) ( ON ?auto_10430 ?auto_10438 ) ( CLEAR ?auto_10430 ) ( not ( = ?auto_10429 ?auto_10430 ) ) ( not ( = ?auto_10429 ?auto_10438 ) ) ( not ( = ?auto_10430 ?auto_10438 ) ) ( not ( = ?auto_10433 ?auto_10442 ) ) ( SURFACE-AT ?auto_10428 ?auto_10434 ) ( CLEAR ?auto_10428 ) ( IS-CRATE ?auto_10429 ) ( AVAILABLE ?auto_10433 ) ( not ( = ?auto_10443 ?auto_10434 ) ) ( HOIST-AT ?auto_10441 ?auto_10443 ) ( AVAILABLE ?auto_10441 ) ( SURFACE-AT ?auto_10429 ?auto_10443 ) ( ON ?auto_10429 ?auto_10439 ) ( CLEAR ?auto_10429 ) ( TRUCK-AT ?auto_10435 ?auto_10434 ) ( not ( = ?auto_10428 ?auto_10429 ) ) ( not ( = ?auto_10428 ?auto_10439 ) ) ( not ( = ?auto_10429 ?auto_10439 ) ) ( not ( = ?auto_10433 ?auto_10441 ) ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10428 ?auto_10438 ) ) ( not ( = ?auto_10430 ?auto_10439 ) ) ( not ( = ?auto_10440 ?auto_10443 ) ) ( not ( = ?auto_10442 ?auto_10441 ) ) ( not ( = ?auto_10438 ?auto_10439 ) ) ( not ( = ?auto_10428 ?auto_10431 ) ) ( not ( = ?auto_10428 ?auto_10432 ) ) ( not ( = ?auto_10429 ?auto_10431 ) ) ( not ( = ?auto_10429 ?auto_10432 ) ) ( not ( = ?auto_10431 ?auto_10438 ) ) ( not ( = ?auto_10431 ?auto_10439 ) ) ( not ( = ?auto_10437 ?auto_10440 ) ) ( not ( = ?auto_10437 ?auto_10443 ) ) ( not ( = ?auto_10436 ?auto_10442 ) ) ( not ( = ?auto_10436 ?auto_10441 ) ) ( not ( = ?auto_10432 ?auto_10438 ) ) ( not ( = ?auto_10432 ?auto_10439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10428 ?auto_10429 ?auto_10430 )
      ( MAKE-1CRATE ?auto_10430 ?auto_10431 )
      ( MAKE-3CRATE-VERIFY ?auto_10428 ?auto_10429 ?auto_10430 ?auto_10431 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10459 - SURFACE
      ?auto_10460 - SURFACE
      ?auto_10461 - SURFACE
      ?auto_10462 - SURFACE
      ?auto_10463 - SURFACE
    )
    :vars
    (
      ?auto_10468 - HOIST
      ?auto_10464 - PLACE
      ?auto_10467 - PLACE
      ?auto_10465 - HOIST
      ?auto_10466 - SURFACE
      ?auto_10472 - PLACE
      ?auto_10474 - HOIST
      ?auto_10475 - SURFACE
      ?auto_10473 - PLACE
      ?auto_10470 - HOIST
      ?auto_10476 - SURFACE
      ?auto_10471 - SURFACE
      ?auto_10469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10468 ?auto_10464 ) ( IS-CRATE ?auto_10463 ) ( not ( = ?auto_10467 ?auto_10464 ) ) ( HOIST-AT ?auto_10465 ?auto_10467 ) ( SURFACE-AT ?auto_10463 ?auto_10467 ) ( ON ?auto_10463 ?auto_10466 ) ( CLEAR ?auto_10463 ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( not ( = ?auto_10462 ?auto_10466 ) ) ( not ( = ?auto_10463 ?auto_10466 ) ) ( not ( = ?auto_10468 ?auto_10465 ) ) ( IS-CRATE ?auto_10462 ) ( not ( = ?auto_10472 ?auto_10464 ) ) ( HOIST-AT ?auto_10474 ?auto_10472 ) ( AVAILABLE ?auto_10474 ) ( SURFACE-AT ?auto_10462 ?auto_10472 ) ( ON ?auto_10462 ?auto_10475 ) ( CLEAR ?auto_10462 ) ( not ( = ?auto_10461 ?auto_10462 ) ) ( not ( = ?auto_10461 ?auto_10475 ) ) ( not ( = ?auto_10462 ?auto_10475 ) ) ( not ( = ?auto_10468 ?auto_10474 ) ) ( IS-CRATE ?auto_10461 ) ( not ( = ?auto_10473 ?auto_10464 ) ) ( HOIST-AT ?auto_10470 ?auto_10473 ) ( AVAILABLE ?auto_10470 ) ( SURFACE-AT ?auto_10461 ?auto_10473 ) ( ON ?auto_10461 ?auto_10476 ) ( CLEAR ?auto_10461 ) ( not ( = ?auto_10460 ?auto_10461 ) ) ( not ( = ?auto_10460 ?auto_10476 ) ) ( not ( = ?auto_10461 ?auto_10476 ) ) ( not ( = ?auto_10468 ?auto_10470 ) ) ( SURFACE-AT ?auto_10459 ?auto_10464 ) ( CLEAR ?auto_10459 ) ( IS-CRATE ?auto_10460 ) ( AVAILABLE ?auto_10468 ) ( AVAILABLE ?auto_10465 ) ( SURFACE-AT ?auto_10460 ?auto_10467 ) ( ON ?auto_10460 ?auto_10471 ) ( CLEAR ?auto_10460 ) ( TRUCK-AT ?auto_10469 ?auto_10464 ) ( not ( = ?auto_10459 ?auto_10460 ) ) ( not ( = ?auto_10459 ?auto_10471 ) ) ( not ( = ?auto_10460 ?auto_10471 ) ) ( not ( = ?auto_10459 ?auto_10461 ) ) ( not ( = ?auto_10459 ?auto_10476 ) ) ( not ( = ?auto_10461 ?auto_10471 ) ) ( not ( = ?auto_10473 ?auto_10467 ) ) ( not ( = ?auto_10470 ?auto_10465 ) ) ( not ( = ?auto_10476 ?auto_10471 ) ) ( not ( = ?auto_10459 ?auto_10462 ) ) ( not ( = ?auto_10459 ?auto_10475 ) ) ( not ( = ?auto_10460 ?auto_10462 ) ) ( not ( = ?auto_10460 ?auto_10475 ) ) ( not ( = ?auto_10462 ?auto_10476 ) ) ( not ( = ?auto_10462 ?auto_10471 ) ) ( not ( = ?auto_10472 ?auto_10473 ) ) ( not ( = ?auto_10472 ?auto_10467 ) ) ( not ( = ?auto_10474 ?auto_10470 ) ) ( not ( = ?auto_10474 ?auto_10465 ) ) ( not ( = ?auto_10475 ?auto_10476 ) ) ( not ( = ?auto_10475 ?auto_10471 ) ) ( not ( = ?auto_10459 ?auto_10463 ) ) ( not ( = ?auto_10459 ?auto_10466 ) ) ( not ( = ?auto_10460 ?auto_10463 ) ) ( not ( = ?auto_10460 ?auto_10466 ) ) ( not ( = ?auto_10461 ?auto_10463 ) ) ( not ( = ?auto_10461 ?auto_10466 ) ) ( not ( = ?auto_10463 ?auto_10475 ) ) ( not ( = ?auto_10463 ?auto_10476 ) ) ( not ( = ?auto_10463 ?auto_10471 ) ) ( not ( = ?auto_10466 ?auto_10475 ) ) ( not ( = ?auto_10466 ?auto_10476 ) ) ( not ( = ?auto_10466 ?auto_10471 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10459 ?auto_10460 ?auto_10461 ?auto_10462 )
      ( MAKE-1CRATE ?auto_10462 ?auto_10463 )
      ( MAKE-4CRATE-VERIFY ?auto_10459 ?auto_10460 ?auto_10461 ?auto_10462 ?auto_10463 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10493 - SURFACE
      ?auto_10494 - SURFACE
      ?auto_10495 - SURFACE
      ?auto_10496 - SURFACE
      ?auto_10497 - SURFACE
      ?auto_10498 - SURFACE
    )
    :vars
    (
      ?auto_10500 - HOIST
      ?auto_10499 - PLACE
      ?auto_10503 - PLACE
      ?auto_10502 - HOIST
      ?auto_10501 - SURFACE
      ?auto_10514 - PLACE
      ?auto_10510 - HOIST
      ?auto_10507 - SURFACE
      ?auto_10511 - PLACE
      ?auto_10508 - HOIST
      ?auto_10509 - SURFACE
      ?auto_10512 - PLACE
      ?auto_10506 - HOIST
      ?auto_10513 - SURFACE
      ?auto_10505 - SURFACE
      ?auto_10504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10500 ?auto_10499 ) ( IS-CRATE ?auto_10498 ) ( not ( = ?auto_10503 ?auto_10499 ) ) ( HOIST-AT ?auto_10502 ?auto_10503 ) ( AVAILABLE ?auto_10502 ) ( SURFACE-AT ?auto_10498 ?auto_10503 ) ( ON ?auto_10498 ?auto_10501 ) ( CLEAR ?auto_10498 ) ( not ( = ?auto_10497 ?auto_10498 ) ) ( not ( = ?auto_10497 ?auto_10501 ) ) ( not ( = ?auto_10498 ?auto_10501 ) ) ( not ( = ?auto_10500 ?auto_10502 ) ) ( IS-CRATE ?auto_10497 ) ( not ( = ?auto_10514 ?auto_10499 ) ) ( HOIST-AT ?auto_10510 ?auto_10514 ) ( SURFACE-AT ?auto_10497 ?auto_10514 ) ( ON ?auto_10497 ?auto_10507 ) ( CLEAR ?auto_10497 ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10507 ) ) ( not ( = ?auto_10497 ?auto_10507 ) ) ( not ( = ?auto_10500 ?auto_10510 ) ) ( IS-CRATE ?auto_10496 ) ( not ( = ?auto_10511 ?auto_10499 ) ) ( HOIST-AT ?auto_10508 ?auto_10511 ) ( AVAILABLE ?auto_10508 ) ( SURFACE-AT ?auto_10496 ?auto_10511 ) ( ON ?auto_10496 ?auto_10509 ) ( CLEAR ?auto_10496 ) ( not ( = ?auto_10495 ?auto_10496 ) ) ( not ( = ?auto_10495 ?auto_10509 ) ) ( not ( = ?auto_10496 ?auto_10509 ) ) ( not ( = ?auto_10500 ?auto_10508 ) ) ( IS-CRATE ?auto_10495 ) ( not ( = ?auto_10512 ?auto_10499 ) ) ( HOIST-AT ?auto_10506 ?auto_10512 ) ( AVAILABLE ?auto_10506 ) ( SURFACE-AT ?auto_10495 ?auto_10512 ) ( ON ?auto_10495 ?auto_10513 ) ( CLEAR ?auto_10495 ) ( not ( = ?auto_10494 ?auto_10495 ) ) ( not ( = ?auto_10494 ?auto_10513 ) ) ( not ( = ?auto_10495 ?auto_10513 ) ) ( not ( = ?auto_10500 ?auto_10506 ) ) ( SURFACE-AT ?auto_10493 ?auto_10499 ) ( CLEAR ?auto_10493 ) ( IS-CRATE ?auto_10494 ) ( AVAILABLE ?auto_10500 ) ( AVAILABLE ?auto_10510 ) ( SURFACE-AT ?auto_10494 ?auto_10514 ) ( ON ?auto_10494 ?auto_10505 ) ( CLEAR ?auto_10494 ) ( TRUCK-AT ?auto_10504 ?auto_10499 ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( not ( = ?auto_10493 ?auto_10505 ) ) ( not ( = ?auto_10494 ?auto_10505 ) ) ( not ( = ?auto_10493 ?auto_10495 ) ) ( not ( = ?auto_10493 ?auto_10513 ) ) ( not ( = ?auto_10495 ?auto_10505 ) ) ( not ( = ?auto_10512 ?auto_10514 ) ) ( not ( = ?auto_10506 ?auto_10510 ) ) ( not ( = ?auto_10513 ?auto_10505 ) ) ( not ( = ?auto_10493 ?auto_10496 ) ) ( not ( = ?auto_10493 ?auto_10509 ) ) ( not ( = ?auto_10494 ?auto_10496 ) ) ( not ( = ?auto_10494 ?auto_10509 ) ) ( not ( = ?auto_10496 ?auto_10513 ) ) ( not ( = ?auto_10496 ?auto_10505 ) ) ( not ( = ?auto_10511 ?auto_10512 ) ) ( not ( = ?auto_10511 ?auto_10514 ) ) ( not ( = ?auto_10508 ?auto_10506 ) ) ( not ( = ?auto_10508 ?auto_10510 ) ) ( not ( = ?auto_10509 ?auto_10513 ) ) ( not ( = ?auto_10509 ?auto_10505 ) ) ( not ( = ?auto_10493 ?auto_10497 ) ) ( not ( = ?auto_10493 ?auto_10507 ) ) ( not ( = ?auto_10494 ?auto_10497 ) ) ( not ( = ?auto_10494 ?auto_10507 ) ) ( not ( = ?auto_10495 ?auto_10497 ) ) ( not ( = ?auto_10495 ?auto_10507 ) ) ( not ( = ?auto_10497 ?auto_10509 ) ) ( not ( = ?auto_10497 ?auto_10513 ) ) ( not ( = ?auto_10497 ?auto_10505 ) ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( not ( = ?auto_10507 ?auto_10513 ) ) ( not ( = ?auto_10507 ?auto_10505 ) ) ( not ( = ?auto_10493 ?auto_10498 ) ) ( not ( = ?auto_10493 ?auto_10501 ) ) ( not ( = ?auto_10494 ?auto_10498 ) ) ( not ( = ?auto_10494 ?auto_10501 ) ) ( not ( = ?auto_10495 ?auto_10498 ) ) ( not ( = ?auto_10495 ?auto_10501 ) ) ( not ( = ?auto_10496 ?auto_10498 ) ) ( not ( = ?auto_10496 ?auto_10501 ) ) ( not ( = ?auto_10498 ?auto_10507 ) ) ( not ( = ?auto_10498 ?auto_10509 ) ) ( not ( = ?auto_10498 ?auto_10513 ) ) ( not ( = ?auto_10498 ?auto_10505 ) ) ( not ( = ?auto_10503 ?auto_10514 ) ) ( not ( = ?auto_10503 ?auto_10511 ) ) ( not ( = ?auto_10503 ?auto_10512 ) ) ( not ( = ?auto_10502 ?auto_10510 ) ) ( not ( = ?auto_10502 ?auto_10508 ) ) ( not ( = ?auto_10502 ?auto_10506 ) ) ( not ( = ?auto_10501 ?auto_10507 ) ) ( not ( = ?auto_10501 ?auto_10509 ) ) ( not ( = ?auto_10501 ?auto_10513 ) ) ( not ( = ?auto_10501 ?auto_10505 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10493 ?auto_10494 ?auto_10495 ?auto_10496 ?auto_10497 )
      ( MAKE-1CRATE ?auto_10497 ?auto_10498 )
      ( MAKE-5CRATE-VERIFY ?auto_10493 ?auto_10494 ?auto_10495 ?auto_10496 ?auto_10497 ?auto_10498 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10532 - SURFACE
      ?auto_10533 - SURFACE
      ?auto_10534 - SURFACE
      ?auto_10535 - SURFACE
      ?auto_10536 - SURFACE
      ?auto_10537 - SURFACE
      ?auto_10538 - SURFACE
    )
    :vars
    (
      ?auto_10542 - HOIST
      ?auto_10543 - PLACE
      ?auto_10544 - PLACE
      ?auto_10539 - HOIST
      ?auto_10541 - SURFACE
      ?auto_10555 - PLACE
      ?auto_10554 - HOIST
      ?auto_10553 - SURFACE
      ?auto_10551 - PLACE
      ?auto_10549 - HOIST
      ?auto_10545 - SURFACE
      ?auto_10552 - PLACE
      ?auto_10547 - HOIST
      ?auto_10546 - SURFACE
      ?auto_10550 - SURFACE
      ?auto_10548 - SURFACE
      ?auto_10540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10542 ?auto_10543 ) ( IS-CRATE ?auto_10538 ) ( not ( = ?auto_10544 ?auto_10543 ) ) ( HOIST-AT ?auto_10539 ?auto_10544 ) ( SURFACE-AT ?auto_10538 ?auto_10544 ) ( ON ?auto_10538 ?auto_10541 ) ( CLEAR ?auto_10538 ) ( not ( = ?auto_10537 ?auto_10538 ) ) ( not ( = ?auto_10537 ?auto_10541 ) ) ( not ( = ?auto_10538 ?auto_10541 ) ) ( not ( = ?auto_10542 ?auto_10539 ) ) ( IS-CRATE ?auto_10537 ) ( not ( = ?auto_10555 ?auto_10543 ) ) ( HOIST-AT ?auto_10554 ?auto_10555 ) ( AVAILABLE ?auto_10554 ) ( SURFACE-AT ?auto_10537 ?auto_10555 ) ( ON ?auto_10537 ?auto_10553 ) ( CLEAR ?auto_10537 ) ( not ( = ?auto_10536 ?auto_10537 ) ) ( not ( = ?auto_10536 ?auto_10553 ) ) ( not ( = ?auto_10537 ?auto_10553 ) ) ( not ( = ?auto_10542 ?auto_10554 ) ) ( IS-CRATE ?auto_10536 ) ( not ( = ?auto_10551 ?auto_10543 ) ) ( HOIST-AT ?auto_10549 ?auto_10551 ) ( SURFACE-AT ?auto_10536 ?auto_10551 ) ( ON ?auto_10536 ?auto_10545 ) ( CLEAR ?auto_10536 ) ( not ( = ?auto_10535 ?auto_10536 ) ) ( not ( = ?auto_10535 ?auto_10545 ) ) ( not ( = ?auto_10536 ?auto_10545 ) ) ( not ( = ?auto_10542 ?auto_10549 ) ) ( IS-CRATE ?auto_10535 ) ( not ( = ?auto_10552 ?auto_10543 ) ) ( HOIST-AT ?auto_10547 ?auto_10552 ) ( AVAILABLE ?auto_10547 ) ( SURFACE-AT ?auto_10535 ?auto_10552 ) ( ON ?auto_10535 ?auto_10546 ) ( CLEAR ?auto_10535 ) ( not ( = ?auto_10534 ?auto_10535 ) ) ( not ( = ?auto_10534 ?auto_10546 ) ) ( not ( = ?auto_10535 ?auto_10546 ) ) ( not ( = ?auto_10542 ?auto_10547 ) ) ( IS-CRATE ?auto_10534 ) ( AVAILABLE ?auto_10539 ) ( SURFACE-AT ?auto_10534 ?auto_10544 ) ( ON ?auto_10534 ?auto_10550 ) ( CLEAR ?auto_10534 ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( not ( = ?auto_10533 ?auto_10550 ) ) ( not ( = ?auto_10534 ?auto_10550 ) ) ( SURFACE-AT ?auto_10532 ?auto_10543 ) ( CLEAR ?auto_10532 ) ( IS-CRATE ?auto_10533 ) ( AVAILABLE ?auto_10542 ) ( AVAILABLE ?auto_10549 ) ( SURFACE-AT ?auto_10533 ?auto_10551 ) ( ON ?auto_10533 ?auto_10548 ) ( CLEAR ?auto_10533 ) ( TRUCK-AT ?auto_10540 ?auto_10543 ) ( not ( = ?auto_10532 ?auto_10533 ) ) ( not ( = ?auto_10532 ?auto_10548 ) ) ( not ( = ?auto_10533 ?auto_10548 ) ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( not ( = ?auto_10532 ?auto_10550 ) ) ( not ( = ?auto_10534 ?auto_10548 ) ) ( not ( = ?auto_10544 ?auto_10551 ) ) ( not ( = ?auto_10539 ?auto_10549 ) ) ( not ( = ?auto_10550 ?auto_10548 ) ) ( not ( = ?auto_10532 ?auto_10535 ) ) ( not ( = ?auto_10532 ?auto_10546 ) ) ( not ( = ?auto_10533 ?auto_10535 ) ) ( not ( = ?auto_10533 ?auto_10546 ) ) ( not ( = ?auto_10535 ?auto_10550 ) ) ( not ( = ?auto_10535 ?auto_10548 ) ) ( not ( = ?auto_10552 ?auto_10544 ) ) ( not ( = ?auto_10552 ?auto_10551 ) ) ( not ( = ?auto_10547 ?auto_10539 ) ) ( not ( = ?auto_10547 ?auto_10549 ) ) ( not ( = ?auto_10546 ?auto_10550 ) ) ( not ( = ?auto_10546 ?auto_10548 ) ) ( not ( = ?auto_10532 ?auto_10536 ) ) ( not ( = ?auto_10532 ?auto_10545 ) ) ( not ( = ?auto_10533 ?auto_10536 ) ) ( not ( = ?auto_10533 ?auto_10545 ) ) ( not ( = ?auto_10534 ?auto_10536 ) ) ( not ( = ?auto_10534 ?auto_10545 ) ) ( not ( = ?auto_10536 ?auto_10546 ) ) ( not ( = ?auto_10536 ?auto_10550 ) ) ( not ( = ?auto_10536 ?auto_10548 ) ) ( not ( = ?auto_10545 ?auto_10546 ) ) ( not ( = ?auto_10545 ?auto_10550 ) ) ( not ( = ?auto_10545 ?auto_10548 ) ) ( not ( = ?auto_10532 ?auto_10537 ) ) ( not ( = ?auto_10532 ?auto_10553 ) ) ( not ( = ?auto_10533 ?auto_10537 ) ) ( not ( = ?auto_10533 ?auto_10553 ) ) ( not ( = ?auto_10534 ?auto_10537 ) ) ( not ( = ?auto_10534 ?auto_10553 ) ) ( not ( = ?auto_10535 ?auto_10537 ) ) ( not ( = ?auto_10535 ?auto_10553 ) ) ( not ( = ?auto_10537 ?auto_10545 ) ) ( not ( = ?auto_10537 ?auto_10546 ) ) ( not ( = ?auto_10537 ?auto_10550 ) ) ( not ( = ?auto_10537 ?auto_10548 ) ) ( not ( = ?auto_10555 ?auto_10551 ) ) ( not ( = ?auto_10555 ?auto_10552 ) ) ( not ( = ?auto_10555 ?auto_10544 ) ) ( not ( = ?auto_10554 ?auto_10549 ) ) ( not ( = ?auto_10554 ?auto_10547 ) ) ( not ( = ?auto_10554 ?auto_10539 ) ) ( not ( = ?auto_10553 ?auto_10545 ) ) ( not ( = ?auto_10553 ?auto_10546 ) ) ( not ( = ?auto_10553 ?auto_10550 ) ) ( not ( = ?auto_10553 ?auto_10548 ) ) ( not ( = ?auto_10532 ?auto_10538 ) ) ( not ( = ?auto_10532 ?auto_10541 ) ) ( not ( = ?auto_10533 ?auto_10538 ) ) ( not ( = ?auto_10533 ?auto_10541 ) ) ( not ( = ?auto_10534 ?auto_10538 ) ) ( not ( = ?auto_10534 ?auto_10541 ) ) ( not ( = ?auto_10535 ?auto_10538 ) ) ( not ( = ?auto_10535 ?auto_10541 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10536 ?auto_10541 ) ) ( not ( = ?auto_10538 ?auto_10553 ) ) ( not ( = ?auto_10538 ?auto_10545 ) ) ( not ( = ?auto_10538 ?auto_10546 ) ) ( not ( = ?auto_10538 ?auto_10550 ) ) ( not ( = ?auto_10538 ?auto_10548 ) ) ( not ( = ?auto_10541 ?auto_10553 ) ) ( not ( = ?auto_10541 ?auto_10545 ) ) ( not ( = ?auto_10541 ?auto_10546 ) ) ( not ( = ?auto_10541 ?auto_10550 ) ) ( not ( = ?auto_10541 ?auto_10548 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10535 ?auto_10536 ?auto_10537 )
      ( MAKE-1CRATE ?auto_10537 ?auto_10538 )
      ( MAKE-6CRATE-VERIFY ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10535 ?auto_10536 ?auto_10537 ?auto_10538 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10574 - SURFACE
      ?auto_10575 - SURFACE
      ?auto_10576 - SURFACE
      ?auto_10577 - SURFACE
      ?auto_10578 - SURFACE
      ?auto_10579 - SURFACE
      ?auto_10580 - SURFACE
      ?auto_10581 - SURFACE
    )
    :vars
    (
      ?auto_10583 - HOIST
      ?auto_10585 - PLACE
      ?auto_10582 - PLACE
      ?auto_10587 - HOIST
      ?auto_10584 - SURFACE
      ?auto_10591 - PLACE
      ?auto_10595 - HOIST
      ?auto_10589 - SURFACE
      ?auto_10598 - PLACE
      ?auto_10588 - HOIST
      ?auto_10597 - SURFACE
      ?auto_10590 - SURFACE
      ?auto_10593 - PLACE
      ?auto_10592 - HOIST
      ?auto_10594 - SURFACE
      ?auto_10599 - SURFACE
      ?auto_10596 - SURFACE
      ?auto_10586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10583 ?auto_10585 ) ( IS-CRATE ?auto_10581 ) ( not ( = ?auto_10582 ?auto_10585 ) ) ( HOIST-AT ?auto_10587 ?auto_10582 ) ( SURFACE-AT ?auto_10581 ?auto_10582 ) ( ON ?auto_10581 ?auto_10584 ) ( CLEAR ?auto_10581 ) ( not ( = ?auto_10580 ?auto_10581 ) ) ( not ( = ?auto_10580 ?auto_10584 ) ) ( not ( = ?auto_10581 ?auto_10584 ) ) ( not ( = ?auto_10583 ?auto_10587 ) ) ( IS-CRATE ?auto_10580 ) ( not ( = ?auto_10591 ?auto_10585 ) ) ( HOIST-AT ?auto_10595 ?auto_10591 ) ( SURFACE-AT ?auto_10580 ?auto_10591 ) ( ON ?auto_10580 ?auto_10589 ) ( CLEAR ?auto_10580 ) ( not ( = ?auto_10579 ?auto_10580 ) ) ( not ( = ?auto_10579 ?auto_10589 ) ) ( not ( = ?auto_10580 ?auto_10589 ) ) ( not ( = ?auto_10583 ?auto_10595 ) ) ( IS-CRATE ?auto_10579 ) ( not ( = ?auto_10598 ?auto_10585 ) ) ( HOIST-AT ?auto_10588 ?auto_10598 ) ( AVAILABLE ?auto_10588 ) ( SURFACE-AT ?auto_10579 ?auto_10598 ) ( ON ?auto_10579 ?auto_10597 ) ( CLEAR ?auto_10579 ) ( not ( = ?auto_10578 ?auto_10579 ) ) ( not ( = ?auto_10578 ?auto_10597 ) ) ( not ( = ?auto_10579 ?auto_10597 ) ) ( not ( = ?auto_10583 ?auto_10588 ) ) ( IS-CRATE ?auto_10578 ) ( SURFACE-AT ?auto_10578 ?auto_10582 ) ( ON ?auto_10578 ?auto_10590 ) ( CLEAR ?auto_10578 ) ( not ( = ?auto_10577 ?auto_10578 ) ) ( not ( = ?auto_10577 ?auto_10590 ) ) ( not ( = ?auto_10578 ?auto_10590 ) ) ( IS-CRATE ?auto_10577 ) ( not ( = ?auto_10593 ?auto_10585 ) ) ( HOIST-AT ?auto_10592 ?auto_10593 ) ( AVAILABLE ?auto_10592 ) ( SURFACE-AT ?auto_10577 ?auto_10593 ) ( ON ?auto_10577 ?auto_10594 ) ( CLEAR ?auto_10577 ) ( not ( = ?auto_10576 ?auto_10577 ) ) ( not ( = ?auto_10576 ?auto_10594 ) ) ( not ( = ?auto_10577 ?auto_10594 ) ) ( not ( = ?auto_10583 ?auto_10592 ) ) ( IS-CRATE ?auto_10576 ) ( AVAILABLE ?auto_10595 ) ( SURFACE-AT ?auto_10576 ?auto_10591 ) ( ON ?auto_10576 ?auto_10599 ) ( CLEAR ?auto_10576 ) ( not ( = ?auto_10575 ?auto_10576 ) ) ( not ( = ?auto_10575 ?auto_10599 ) ) ( not ( = ?auto_10576 ?auto_10599 ) ) ( SURFACE-AT ?auto_10574 ?auto_10585 ) ( CLEAR ?auto_10574 ) ( IS-CRATE ?auto_10575 ) ( AVAILABLE ?auto_10583 ) ( AVAILABLE ?auto_10587 ) ( SURFACE-AT ?auto_10575 ?auto_10582 ) ( ON ?auto_10575 ?auto_10596 ) ( CLEAR ?auto_10575 ) ( TRUCK-AT ?auto_10586 ?auto_10585 ) ( not ( = ?auto_10574 ?auto_10575 ) ) ( not ( = ?auto_10574 ?auto_10596 ) ) ( not ( = ?auto_10575 ?auto_10596 ) ) ( not ( = ?auto_10574 ?auto_10576 ) ) ( not ( = ?auto_10574 ?auto_10599 ) ) ( not ( = ?auto_10576 ?auto_10596 ) ) ( not ( = ?auto_10591 ?auto_10582 ) ) ( not ( = ?auto_10595 ?auto_10587 ) ) ( not ( = ?auto_10599 ?auto_10596 ) ) ( not ( = ?auto_10574 ?auto_10577 ) ) ( not ( = ?auto_10574 ?auto_10594 ) ) ( not ( = ?auto_10575 ?auto_10577 ) ) ( not ( = ?auto_10575 ?auto_10594 ) ) ( not ( = ?auto_10577 ?auto_10599 ) ) ( not ( = ?auto_10577 ?auto_10596 ) ) ( not ( = ?auto_10593 ?auto_10591 ) ) ( not ( = ?auto_10593 ?auto_10582 ) ) ( not ( = ?auto_10592 ?auto_10595 ) ) ( not ( = ?auto_10592 ?auto_10587 ) ) ( not ( = ?auto_10594 ?auto_10599 ) ) ( not ( = ?auto_10594 ?auto_10596 ) ) ( not ( = ?auto_10574 ?auto_10578 ) ) ( not ( = ?auto_10574 ?auto_10590 ) ) ( not ( = ?auto_10575 ?auto_10578 ) ) ( not ( = ?auto_10575 ?auto_10590 ) ) ( not ( = ?auto_10576 ?auto_10578 ) ) ( not ( = ?auto_10576 ?auto_10590 ) ) ( not ( = ?auto_10578 ?auto_10594 ) ) ( not ( = ?auto_10578 ?auto_10599 ) ) ( not ( = ?auto_10578 ?auto_10596 ) ) ( not ( = ?auto_10590 ?auto_10594 ) ) ( not ( = ?auto_10590 ?auto_10599 ) ) ( not ( = ?auto_10590 ?auto_10596 ) ) ( not ( = ?auto_10574 ?auto_10579 ) ) ( not ( = ?auto_10574 ?auto_10597 ) ) ( not ( = ?auto_10575 ?auto_10579 ) ) ( not ( = ?auto_10575 ?auto_10597 ) ) ( not ( = ?auto_10576 ?auto_10579 ) ) ( not ( = ?auto_10576 ?auto_10597 ) ) ( not ( = ?auto_10577 ?auto_10579 ) ) ( not ( = ?auto_10577 ?auto_10597 ) ) ( not ( = ?auto_10579 ?auto_10590 ) ) ( not ( = ?auto_10579 ?auto_10594 ) ) ( not ( = ?auto_10579 ?auto_10599 ) ) ( not ( = ?auto_10579 ?auto_10596 ) ) ( not ( = ?auto_10598 ?auto_10582 ) ) ( not ( = ?auto_10598 ?auto_10593 ) ) ( not ( = ?auto_10598 ?auto_10591 ) ) ( not ( = ?auto_10588 ?auto_10587 ) ) ( not ( = ?auto_10588 ?auto_10592 ) ) ( not ( = ?auto_10588 ?auto_10595 ) ) ( not ( = ?auto_10597 ?auto_10590 ) ) ( not ( = ?auto_10597 ?auto_10594 ) ) ( not ( = ?auto_10597 ?auto_10599 ) ) ( not ( = ?auto_10597 ?auto_10596 ) ) ( not ( = ?auto_10574 ?auto_10580 ) ) ( not ( = ?auto_10574 ?auto_10589 ) ) ( not ( = ?auto_10575 ?auto_10580 ) ) ( not ( = ?auto_10575 ?auto_10589 ) ) ( not ( = ?auto_10576 ?auto_10580 ) ) ( not ( = ?auto_10576 ?auto_10589 ) ) ( not ( = ?auto_10577 ?auto_10580 ) ) ( not ( = ?auto_10577 ?auto_10589 ) ) ( not ( = ?auto_10578 ?auto_10580 ) ) ( not ( = ?auto_10578 ?auto_10589 ) ) ( not ( = ?auto_10580 ?auto_10597 ) ) ( not ( = ?auto_10580 ?auto_10590 ) ) ( not ( = ?auto_10580 ?auto_10594 ) ) ( not ( = ?auto_10580 ?auto_10599 ) ) ( not ( = ?auto_10580 ?auto_10596 ) ) ( not ( = ?auto_10589 ?auto_10597 ) ) ( not ( = ?auto_10589 ?auto_10590 ) ) ( not ( = ?auto_10589 ?auto_10594 ) ) ( not ( = ?auto_10589 ?auto_10599 ) ) ( not ( = ?auto_10589 ?auto_10596 ) ) ( not ( = ?auto_10574 ?auto_10581 ) ) ( not ( = ?auto_10574 ?auto_10584 ) ) ( not ( = ?auto_10575 ?auto_10581 ) ) ( not ( = ?auto_10575 ?auto_10584 ) ) ( not ( = ?auto_10576 ?auto_10581 ) ) ( not ( = ?auto_10576 ?auto_10584 ) ) ( not ( = ?auto_10577 ?auto_10581 ) ) ( not ( = ?auto_10577 ?auto_10584 ) ) ( not ( = ?auto_10578 ?auto_10581 ) ) ( not ( = ?auto_10578 ?auto_10584 ) ) ( not ( = ?auto_10579 ?auto_10581 ) ) ( not ( = ?auto_10579 ?auto_10584 ) ) ( not ( = ?auto_10581 ?auto_10589 ) ) ( not ( = ?auto_10581 ?auto_10597 ) ) ( not ( = ?auto_10581 ?auto_10590 ) ) ( not ( = ?auto_10581 ?auto_10594 ) ) ( not ( = ?auto_10581 ?auto_10599 ) ) ( not ( = ?auto_10581 ?auto_10596 ) ) ( not ( = ?auto_10584 ?auto_10589 ) ) ( not ( = ?auto_10584 ?auto_10597 ) ) ( not ( = ?auto_10584 ?auto_10590 ) ) ( not ( = ?auto_10584 ?auto_10594 ) ) ( not ( = ?auto_10584 ?auto_10599 ) ) ( not ( = ?auto_10584 ?auto_10596 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10574 ?auto_10575 ?auto_10576 ?auto_10577 ?auto_10578 ?auto_10579 ?auto_10580 )
      ( MAKE-1CRATE ?auto_10580 ?auto_10581 )
      ( MAKE-7CRATE-VERIFY ?auto_10574 ?auto_10575 ?auto_10576 ?auto_10577 ?auto_10578 ?auto_10579 ?auto_10580 ?auto_10581 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10619 - SURFACE
      ?auto_10620 - SURFACE
      ?auto_10621 - SURFACE
      ?auto_10622 - SURFACE
      ?auto_10623 - SURFACE
      ?auto_10624 - SURFACE
      ?auto_10625 - SURFACE
      ?auto_10626 - SURFACE
      ?auto_10627 - SURFACE
    )
    :vars
    (
      ?auto_10631 - HOIST
      ?auto_10633 - PLACE
      ?auto_10628 - PLACE
      ?auto_10629 - HOIST
      ?auto_10632 - SURFACE
      ?auto_10641 - PLACE
      ?auto_10637 - HOIST
      ?auto_10636 - SURFACE
      ?auto_10638 - PLACE
      ?auto_10643 - HOIST
      ?auto_10634 - SURFACE
      ?auto_10635 - PLACE
      ?auto_10639 - HOIST
      ?auto_10642 - SURFACE
      ?auto_10640 - SURFACE
      ?auto_10645 - PLACE
      ?auto_10648 - HOIST
      ?auto_10644 - SURFACE
      ?auto_10646 - SURFACE
      ?auto_10647 - SURFACE
      ?auto_10630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10631 ?auto_10633 ) ( IS-CRATE ?auto_10627 ) ( not ( = ?auto_10628 ?auto_10633 ) ) ( HOIST-AT ?auto_10629 ?auto_10628 ) ( AVAILABLE ?auto_10629 ) ( SURFACE-AT ?auto_10627 ?auto_10628 ) ( ON ?auto_10627 ?auto_10632 ) ( CLEAR ?auto_10627 ) ( not ( = ?auto_10626 ?auto_10627 ) ) ( not ( = ?auto_10626 ?auto_10632 ) ) ( not ( = ?auto_10627 ?auto_10632 ) ) ( not ( = ?auto_10631 ?auto_10629 ) ) ( IS-CRATE ?auto_10626 ) ( not ( = ?auto_10641 ?auto_10633 ) ) ( HOIST-AT ?auto_10637 ?auto_10641 ) ( SURFACE-AT ?auto_10626 ?auto_10641 ) ( ON ?auto_10626 ?auto_10636 ) ( CLEAR ?auto_10626 ) ( not ( = ?auto_10625 ?auto_10626 ) ) ( not ( = ?auto_10625 ?auto_10636 ) ) ( not ( = ?auto_10626 ?auto_10636 ) ) ( not ( = ?auto_10631 ?auto_10637 ) ) ( IS-CRATE ?auto_10625 ) ( not ( = ?auto_10638 ?auto_10633 ) ) ( HOIST-AT ?auto_10643 ?auto_10638 ) ( SURFACE-AT ?auto_10625 ?auto_10638 ) ( ON ?auto_10625 ?auto_10634 ) ( CLEAR ?auto_10625 ) ( not ( = ?auto_10624 ?auto_10625 ) ) ( not ( = ?auto_10624 ?auto_10634 ) ) ( not ( = ?auto_10625 ?auto_10634 ) ) ( not ( = ?auto_10631 ?auto_10643 ) ) ( IS-CRATE ?auto_10624 ) ( not ( = ?auto_10635 ?auto_10633 ) ) ( HOIST-AT ?auto_10639 ?auto_10635 ) ( AVAILABLE ?auto_10639 ) ( SURFACE-AT ?auto_10624 ?auto_10635 ) ( ON ?auto_10624 ?auto_10642 ) ( CLEAR ?auto_10624 ) ( not ( = ?auto_10623 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10642 ) ) ( not ( = ?auto_10624 ?auto_10642 ) ) ( not ( = ?auto_10631 ?auto_10639 ) ) ( IS-CRATE ?auto_10623 ) ( SURFACE-AT ?auto_10623 ?auto_10641 ) ( ON ?auto_10623 ?auto_10640 ) ( CLEAR ?auto_10623 ) ( not ( = ?auto_10622 ?auto_10623 ) ) ( not ( = ?auto_10622 ?auto_10640 ) ) ( not ( = ?auto_10623 ?auto_10640 ) ) ( IS-CRATE ?auto_10622 ) ( not ( = ?auto_10645 ?auto_10633 ) ) ( HOIST-AT ?auto_10648 ?auto_10645 ) ( AVAILABLE ?auto_10648 ) ( SURFACE-AT ?auto_10622 ?auto_10645 ) ( ON ?auto_10622 ?auto_10644 ) ( CLEAR ?auto_10622 ) ( not ( = ?auto_10621 ?auto_10622 ) ) ( not ( = ?auto_10621 ?auto_10644 ) ) ( not ( = ?auto_10622 ?auto_10644 ) ) ( not ( = ?auto_10631 ?auto_10648 ) ) ( IS-CRATE ?auto_10621 ) ( AVAILABLE ?auto_10643 ) ( SURFACE-AT ?auto_10621 ?auto_10638 ) ( ON ?auto_10621 ?auto_10646 ) ( CLEAR ?auto_10621 ) ( not ( = ?auto_10620 ?auto_10621 ) ) ( not ( = ?auto_10620 ?auto_10646 ) ) ( not ( = ?auto_10621 ?auto_10646 ) ) ( SURFACE-AT ?auto_10619 ?auto_10633 ) ( CLEAR ?auto_10619 ) ( IS-CRATE ?auto_10620 ) ( AVAILABLE ?auto_10631 ) ( AVAILABLE ?auto_10637 ) ( SURFACE-AT ?auto_10620 ?auto_10641 ) ( ON ?auto_10620 ?auto_10647 ) ( CLEAR ?auto_10620 ) ( TRUCK-AT ?auto_10630 ?auto_10633 ) ( not ( = ?auto_10619 ?auto_10620 ) ) ( not ( = ?auto_10619 ?auto_10647 ) ) ( not ( = ?auto_10620 ?auto_10647 ) ) ( not ( = ?auto_10619 ?auto_10621 ) ) ( not ( = ?auto_10619 ?auto_10646 ) ) ( not ( = ?auto_10621 ?auto_10647 ) ) ( not ( = ?auto_10638 ?auto_10641 ) ) ( not ( = ?auto_10643 ?auto_10637 ) ) ( not ( = ?auto_10646 ?auto_10647 ) ) ( not ( = ?auto_10619 ?auto_10622 ) ) ( not ( = ?auto_10619 ?auto_10644 ) ) ( not ( = ?auto_10620 ?auto_10622 ) ) ( not ( = ?auto_10620 ?auto_10644 ) ) ( not ( = ?auto_10622 ?auto_10646 ) ) ( not ( = ?auto_10622 ?auto_10647 ) ) ( not ( = ?auto_10645 ?auto_10638 ) ) ( not ( = ?auto_10645 ?auto_10641 ) ) ( not ( = ?auto_10648 ?auto_10643 ) ) ( not ( = ?auto_10648 ?auto_10637 ) ) ( not ( = ?auto_10644 ?auto_10646 ) ) ( not ( = ?auto_10644 ?auto_10647 ) ) ( not ( = ?auto_10619 ?auto_10623 ) ) ( not ( = ?auto_10619 ?auto_10640 ) ) ( not ( = ?auto_10620 ?auto_10623 ) ) ( not ( = ?auto_10620 ?auto_10640 ) ) ( not ( = ?auto_10621 ?auto_10623 ) ) ( not ( = ?auto_10621 ?auto_10640 ) ) ( not ( = ?auto_10623 ?auto_10644 ) ) ( not ( = ?auto_10623 ?auto_10646 ) ) ( not ( = ?auto_10623 ?auto_10647 ) ) ( not ( = ?auto_10640 ?auto_10644 ) ) ( not ( = ?auto_10640 ?auto_10646 ) ) ( not ( = ?auto_10640 ?auto_10647 ) ) ( not ( = ?auto_10619 ?auto_10624 ) ) ( not ( = ?auto_10619 ?auto_10642 ) ) ( not ( = ?auto_10620 ?auto_10624 ) ) ( not ( = ?auto_10620 ?auto_10642 ) ) ( not ( = ?auto_10621 ?auto_10624 ) ) ( not ( = ?auto_10621 ?auto_10642 ) ) ( not ( = ?auto_10622 ?auto_10624 ) ) ( not ( = ?auto_10622 ?auto_10642 ) ) ( not ( = ?auto_10624 ?auto_10640 ) ) ( not ( = ?auto_10624 ?auto_10644 ) ) ( not ( = ?auto_10624 ?auto_10646 ) ) ( not ( = ?auto_10624 ?auto_10647 ) ) ( not ( = ?auto_10635 ?auto_10641 ) ) ( not ( = ?auto_10635 ?auto_10645 ) ) ( not ( = ?auto_10635 ?auto_10638 ) ) ( not ( = ?auto_10639 ?auto_10637 ) ) ( not ( = ?auto_10639 ?auto_10648 ) ) ( not ( = ?auto_10639 ?auto_10643 ) ) ( not ( = ?auto_10642 ?auto_10640 ) ) ( not ( = ?auto_10642 ?auto_10644 ) ) ( not ( = ?auto_10642 ?auto_10646 ) ) ( not ( = ?auto_10642 ?auto_10647 ) ) ( not ( = ?auto_10619 ?auto_10625 ) ) ( not ( = ?auto_10619 ?auto_10634 ) ) ( not ( = ?auto_10620 ?auto_10625 ) ) ( not ( = ?auto_10620 ?auto_10634 ) ) ( not ( = ?auto_10621 ?auto_10625 ) ) ( not ( = ?auto_10621 ?auto_10634 ) ) ( not ( = ?auto_10622 ?auto_10625 ) ) ( not ( = ?auto_10622 ?auto_10634 ) ) ( not ( = ?auto_10623 ?auto_10625 ) ) ( not ( = ?auto_10623 ?auto_10634 ) ) ( not ( = ?auto_10625 ?auto_10642 ) ) ( not ( = ?auto_10625 ?auto_10640 ) ) ( not ( = ?auto_10625 ?auto_10644 ) ) ( not ( = ?auto_10625 ?auto_10646 ) ) ( not ( = ?auto_10625 ?auto_10647 ) ) ( not ( = ?auto_10634 ?auto_10642 ) ) ( not ( = ?auto_10634 ?auto_10640 ) ) ( not ( = ?auto_10634 ?auto_10644 ) ) ( not ( = ?auto_10634 ?auto_10646 ) ) ( not ( = ?auto_10634 ?auto_10647 ) ) ( not ( = ?auto_10619 ?auto_10626 ) ) ( not ( = ?auto_10619 ?auto_10636 ) ) ( not ( = ?auto_10620 ?auto_10626 ) ) ( not ( = ?auto_10620 ?auto_10636 ) ) ( not ( = ?auto_10621 ?auto_10626 ) ) ( not ( = ?auto_10621 ?auto_10636 ) ) ( not ( = ?auto_10622 ?auto_10626 ) ) ( not ( = ?auto_10622 ?auto_10636 ) ) ( not ( = ?auto_10623 ?auto_10626 ) ) ( not ( = ?auto_10623 ?auto_10636 ) ) ( not ( = ?auto_10624 ?auto_10626 ) ) ( not ( = ?auto_10624 ?auto_10636 ) ) ( not ( = ?auto_10626 ?auto_10634 ) ) ( not ( = ?auto_10626 ?auto_10642 ) ) ( not ( = ?auto_10626 ?auto_10640 ) ) ( not ( = ?auto_10626 ?auto_10644 ) ) ( not ( = ?auto_10626 ?auto_10646 ) ) ( not ( = ?auto_10626 ?auto_10647 ) ) ( not ( = ?auto_10636 ?auto_10634 ) ) ( not ( = ?auto_10636 ?auto_10642 ) ) ( not ( = ?auto_10636 ?auto_10640 ) ) ( not ( = ?auto_10636 ?auto_10644 ) ) ( not ( = ?auto_10636 ?auto_10646 ) ) ( not ( = ?auto_10636 ?auto_10647 ) ) ( not ( = ?auto_10619 ?auto_10627 ) ) ( not ( = ?auto_10619 ?auto_10632 ) ) ( not ( = ?auto_10620 ?auto_10627 ) ) ( not ( = ?auto_10620 ?auto_10632 ) ) ( not ( = ?auto_10621 ?auto_10627 ) ) ( not ( = ?auto_10621 ?auto_10632 ) ) ( not ( = ?auto_10622 ?auto_10627 ) ) ( not ( = ?auto_10622 ?auto_10632 ) ) ( not ( = ?auto_10623 ?auto_10627 ) ) ( not ( = ?auto_10623 ?auto_10632 ) ) ( not ( = ?auto_10624 ?auto_10627 ) ) ( not ( = ?auto_10624 ?auto_10632 ) ) ( not ( = ?auto_10625 ?auto_10627 ) ) ( not ( = ?auto_10625 ?auto_10632 ) ) ( not ( = ?auto_10627 ?auto_10636 ) ) ( not ( = ?auto_10627 ?auto_10634 ) ) ( not ( = ?auto_10627 ?auto_10642 ) ) ( not ( = ?auto_10627 ?auto_10640 ) ) ( not ( = ?auto_10627 ?auto_10644 ) ) ( not ( = ?auto_10627 ?auto_10646 ) ) ( not ( = ?auto_10627 ?auto_10647 ) ) ( not ( = ?auto_10628 ?auto_10641 ) ) ( not ( = ?auto_10628 ?auto_10638 ) ) ( not ( = ?auto_10628 ?auto_10635 ) ) ( not ( = ?auto_10628 ?auto_10645 ) ) ( not ( = ?auto_10629 ?auto_10637 ) ) ( not ( = ?auto_10629 ?auto_10643 ) ) ( not ( = ?auto_10629 ?auto_10639 ) ) ( not ( = ?auto_10629 ?auto_10648 ) ) ( not ( = ?auto_10632 ?auto_10636 ) ) ( not ( = ?auto_10632 ?auto_10634 ) ) ( not ( = ?auto_10632 ?auto_10642 ) ) ( not ( = ?auto_10632 ?auto_10640 ) ) ( not ( = ?auto_10632 ?auto_10644 ) ) ( not ( = ?auto_10632 ?auto_10646 ) ) ( not ( = ?auto_10632 ?auto_10647 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10619 ?auto_10620 ?auto_10621 ?auto_10622 ?auto_10623 ?auto_10624 ?auto_10625 ?auto_10626 )
      ( MAKE-1CRATE ?auto_10626 ?auto_10627 )
      ( MAKE-8CRATE-VERIFY ?auto_10619 ?auto_10620 ?auto_10621 ?auto_10622 ?auto_10623 ?auto_10624 ?auto_10625 ?auto_10626 ?auto_10627 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_10669 - SURFACE
      ?auto_10670 - SURFACE
      ?auto_10671 - SURFACE
      ?auto_10672 - SURFACE
      ?auto_10673 - SURFACE
      ?auto_10674 - SURFACE
      ?auto_10675 - SURFACE
      ?auto_10676 - SURFACE
      ?auto_10677 - SURFACE
      ?auto_10678 - SURFACE
    )
    :vars
    (
      ?auto_10682 - HOIST
      ?auto_10684 - PLACE
      ?auto_10683 - PLACE
      ?auto_10679 - HOIST
      ?auto_10680 - SURFACE
      ?auto_10694 - PLACE
      ?auto_10695 - HOIST
      ?auto_10693 - SURFACE
      ?auto_10696 - PLACE
      ?auto_10698 - HOIST
      ?auto_10697 - SURFACE
      ?auto_10699 - PLACE
      ?auto_10685 - HOIST
      ?auto_10688 - SURFACE
      ?auto_10686 - SURFACE
      ?auto_10700 - SURFACE
      ?auto_10692 - PLACE
      ?auto_10689 - HOIST
      ?auto_10691 - SURFACE
      ?auto_10690 - SURFACE
      ?auto_10687 - SURFACE
      ?auto_10681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10682 ?auto_10684 ) ( IS-CRATE ?auto_10678 ) ( not ( = ?auto_10683 ?auto_10684 ) ) ( HOIST-AT ?auto_10679 ?auto_10683 ) ( SURFACE-AT ?auto_10678 ?auto_10683 ) ( ON ?auto_10678 ?auto_10680 ) ( CLEAR ?auto_10678 ) ( not ( = ?auto_10677 ?auto_10678 ) ) ( not ( = ?auto_10677 ?auto_10680 ) ) ( not ( = ?auto_10678 ?auto_10680 ) ) ( not ( = ?auto_10682 ?auto_10679 ) ) ( IS-CRATE ?auto_10677 ) ( not ( = ?auto_10694 ?auto_10684 ) ) ( HOIST-AT ?auto_10695 ?auto_10694 ) ( AVAILABLE ?auto_10695 ) ( SURFACE-AT ?auto_10677 ?auto_10694 ) ( ON ?auto_10677 ?auto_10693 ) ( CLEAR ?auto_10677 ) ( not ( = ?auto_10676 ?auto_10677 ) ) ( not ( = ?auto_10676 ?auto_10693 ) ) ( not ( = ?auto_10677 ?auto_10693 ) ) ( not ( = ?auto_10682 ?auto_10695 ) ) ( IS-CRATE ?auto_10676 ) ( not ( = ?auto_10696 ?auto_10684 ) ) ( HOIST-AT ?auto_10698 ?auto_10696 ) ( SURFACE-AT ?auto_10676 ?auto_10696 ) ( ON ?auto_10676 ?auto_10697 ) ( CLEAR ?auto_10676 ) ( not ( = ?auto_10675 ?auto_10676 ) ) ( not ( = ?auto_10675 ?auto_10697 ) ) ( not ( = ?auto_10676 ?auto_10697 ) ) ( not ( = ?auto_10682 ?auto_10698 ) ) ( IS-CRATE ?auto_10675 ) ( not ( = ?auto_10699 ?auto_10684 ) ) ( HOIST-AT ?auto_10685 ?auto_10699 ) ( SURFACE-AT ?auto_10675 ?auto_10699 ) ( ON ?auto_10675 ?auto_10688 ) ( CLEAR ?auto_10675 ) ( not ( = ?auto_10674 ?auto_10675 ) ) ( not ( = ?auto_10674 ?auto_10688 ) ) ( not ( = ?auto_10675 ?auto_10688 ) ) ( not ( = ?auto_10682 ?auto_10685 ) ) ( IS-CRATE ?auto_10674 ) ( AVAILABLE ?auto_10679 ) ( SURFACE-AT ?auto_10674 ?auto_10683 ) ( ON ?auto_10674 ?auto_10686 ) ( CLEAR ?auto_10674 ) ( not ( = ?auto_10673 ?auto_10674 ) ) ( not ( = ?auto_10673 ?auto_10686 ) ) ( not ( = ?auto_10674 ?auto_10686 ) ) ( IS-CRATE ?auto_10673 ) ( SURFACE-AT ?auto_10673 ?auto_10696 ) ( ON ?auto_10673 ?auto_10700 ) ( CLEAR ?auto_10673 ) ( not ( = ?auto_10672 ?auto_10673 ) ) ( not ( = ?auto_10672 ?auto_10700 ) ) ( not ( = ?auto_10673 ?auto_10700 ) ) ( IS-CRATE ?auto_10672 ) ( not ( = ?auto_10692 ?auto_10684 ) ) ( HOIST-AT ?auto_10689 ?auto_10692 ) ( AVAILABLE ?auto_10689 ) ( SURFACE-AT ?auto_10672 ?auto_10692 ) ( ON ?auto_10672 ?auto_10691 ) ( CLEAR ?auto_10672 ) ( not ( = ?auto_10671 ?auto_10672 ) ) ( not ( = ?auto_10671 ?auto_10691 ) ) ( not ( = ?auto_10672 ?auto_10691 ) ) ( not ( = ?auto_10682 ?auto_10689 ) ) ( IS-CRATE ?auto_10671 ) ( AVAILABLE ?auto_10685 ) ( SURFACE-AT ?auto_10671 ?auto_10699 ) ( ON ?auto_10671 ?auto_10690 ) ( CLEAR ?auto_10671 ) ( not ( = ?auto_10670 ?auto_10671 ) ) ( not ( = ?auto_10670 ?auto_10690 ) ) ( not ( = ?auto_10671 ?auto_10690 ) ) ( SURFACE-AT ?auto_10669 ?auto_10684 ) ( CLEAR ?auto_10669 ) ( IS-CRATE ?auto_10670 ) ( AVAILABLE ?auto_10682 ) ( AVAILABLE ?auto_10698 ) ( SURFACE-AT ?auto_10670 ?auto_10696 ) ( ON ?auto_10670 ?auto_10687 ) ( CLEAR ?auto_10670 ) ( TRUCK-AT ?auto_10681 ?auto_10684 ) ( not ( = ?auto_10669 ?auto_10670 ) ) ( not ( = ?auto_10669 ?auto_10687 ) ) ( not ( = ?auto_10670 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10671 ) ) ( not ( = ?auto_10669 ?auto_10690 ) ) ( not ( = ?auto_10671 ?auto_10687 ) ) ( not ( = ?auto_10699 ?auto_10696 ) ) ( not ( = ?auto_10685 ?auto_10698 ) ) ( not ( = ?auto_10690 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10672 ) ) ( not ( = ?auto_10669 ?auto_10691 ) ) ( not ( = ?auto_10670 ?auto_10672 ) ) ( not ( = ?auto_10670 ?auto_10691 ) ) ( not ( = ?auto_10672 ?auto_10690 ) ) ( not ( = ?auto_10672 ?auto_10687 ) ) ( not ( = ?auto_10692 ?auto_10699 ) ) ( not ( = ?auto_10692 ?auto_10696 ) ) ( not ( = ?auto_10689 ?auto_10685 ) ) ( not ( = ?auto_10689 ?auto_10698 ) ) ( not ( = ?auto_10691 ?auto_10690 ) ) ( not ( = ?auto_10691 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10673 ) ) ( not ( = ?auto_10669 ?auto_10700 ) ) ( not ( = ?auto_10670 ?auto_10673 ) ) ( not ( = ?auto_10670 ?auto_10700 ) ) ( not ( = ?auto_10671 ?auto_10673 ) ) ( not ( = ?auto_10671 ?auto_10700 ) ) ( not ( = ?auto_10673 ?auto_10691 ) ) ( not ( = ?auto_10673 ?auto_10690 ) ) ( not ( = ?auto_10673 ?auto_10687 ) ) ( not ( = ?auto_10700 ?auto_10691 ) ) ( not ( = ?auto_10700 ?auto_10690 ) ) ( not ( = ?auto_10700 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10674 ) ) ( not ( = ?auto_10669 ?auto_10686 ) ) ( not ( = ?auto_10670 ?auto_10674 ) ) ( not ( = ?auto_10670 ?auto_10686 ) ) ( not ( = ?auto_10671 ?auto_10674 ) ) ( not ( = ?auto_10671 ?auto_10686 ) ) ( not ( = ?auto_10672 ?auto_10674 ) ) ( not ( = ?auto_10672 ?auto_10686 ) ) ( not ( = ?auto_10674 ?auto_10700 ) ) ( not ( = ?auto_10674 ?auto_10691 ) ) ( not ( = ?auto_10674 ?auto_10690 ) ) ( not ( = ?auto_10674 ?auto_10687 ) ) ( not ( = ?auto_10683 ?auto_10696 ) ) ( not ( = ?auto_10683 ?auto_10692 ) ) ( not ( = ?auto_10683 ?auto_10699 ) ) ( not ( = ?auto_10679 ?auto_10698 ) ) ( not ( = ?auto_10679 ?auto_10689 ) ) ( not ( = ?auto_10679 ?auto_10685 ) ) ( not ( = ?auto_10686 ?auto_10700 ) ) ( not ( = ?auto_10686 ?auto_10691 ) ) ( not ( = ?auto_10686 ?auto_10690 ) ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10675 ) ) ( not ( = ?auto_10669 ?auto_10688 ) ) ( not ( = ?auto_10670 ?auto_10675 ) ) ( not ( = ?auto_10670 ?auto_10688 ) ) ( not ( = ?auto_10671 ?auto_10675 ) ) ( not ( = ?auto_10671 ?auto_10688 ) ) ( not ( = ?auto_10672 ?auto_10675 ) ) ( not ( = ?auto_10672 ?auto_10688 ) ) ( not ( = ?auto_10673 ?auto_10675 ) ) ( not ( = ?auto_10673 ?auto_10688 ) ) ( not ( = ?auto_10675 ?auto_10686 ) ) ( not ( = ?auto_10675 ?auto_10700 ) ) ( not ( = ?auto_10675 ?auto_10691 ) ) ( not ( = ?auto_10675 ?auto_10690 ) ) ( not ( = ?auto_10675 ?auto_10687 ) ) ( not ( = ?auto_10688 ?auto_10686 ) ) ( not ( = ?auto_10688 ?auto_10700 ) ) ( not ( = ?auto_10688 ?auto_10691 ) ) ( not ( = ?auto_10688 ?auto_10690 ) ) ( not ( = ?auto_10688 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10676 ) ) ( not ( = ?auto_10669 ?auto_10697 ) ) ( not ( = ?auto_10670 ?auto_10676 ) ) ( not ( = ?auto_10670 ?auto_10697 ) ) ( not ( = ?auto_10671 ?auto_10676 ) ) ( not ( = ?auto_10671 ?auto_10697 ) ) ( not ( = ?auto_10672 ?auto_10676 ) ) ( not ( = ?auto_10672 ?auto_10697 ) ) ( not ( = ?auto_10673 ?auto_10676 ) ) ( not ( = ?auto_10673 ?auto_10697 ) ) ( not ( = ?auto_10674 ?auto_10676 ) ) ( not ( = ?auto_10674 ?auto_10697 ) ) ( not ( = ?auto_10676 ?auto_10688 ) ) ( not ( = ?auto_10676 ?auto_10686 ) ) ( not ( = ?auto_10676 ?auto_10700 ) ) ( not ( = ?auto_10676 ?auto_10691 ) ) ( not ( = ?auto_10676 ?auto_10690 ) ) ( not ( = ?auto_10676 ?auto_10687 ) ) ( not ( = ?auto_10697 ?auto_10688 ) ) ( not ( = ?auto_10697 ?auto_10686 ) ) ( not ( = ?auto_10697 ?auto_10700 ) ) ( not ( = ?auto_10697 ?auto_10691 ) ) ( not ( = ?auto_10697 ?auto_10690 ) ) ( not ( = ?auto_10697 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10677 ) ) ( not ( = ?auto_10669 ?auto_10693 ) ) ( not ( = ?auto_10670 ?auto_10677 ) ) ( not ( = ?auto_10670 ?auto_10693 ) ) ( not ( = ?auto_10671 ?auto_10677 ) ) ( not ( = ?auto_10671 ?auto_10693 ) ) ( not ( = ?auto_10672 ?auto_10677 ) ) ( not ( = ?auto_10672 ?auto_10693 ) ) ( not ( = ?auto_10673 ?auto_10677 ) ) ( not ( = ?auto_10673 ?auto_10693 ) ) ( not ( = ?auto_10674 ?auto_10677 ) ) ( not ( = ?auto_10674 ?auto_10693 ) ) ( not ( = ?auto_10675 ?auto_10677 ) ) ( not ( = ?auto_10675 ?auto_10693 ) ) ( not ( = ?auto_10677 ?auto_10697 ) ) ( not ( = ?auto_10677 ?auto_10688 ) ) ( not ( = ?auto_10677 ?auto_10686 ) ) ( not ( = ?auto_10677 ?auto_10700 ) ) ( not ( = ?auto_10677 ?auto_10691 ) ) ( not ( = ?auto_10677 ?auto_10690 ) ) ( not ( = ?auto_10677 ?auto_10687 ) ) ( not ( = ?auto_10694 ?auto_10696 ) ) ( not ( = ?auto_10694 ?auto_10699 ) ) ( not ( = ?auto_10694 ?auto_10683 ) ) ( not ( = ?auto_10694 ?auto_10692 ) ) ( not ( = ?auto_10695 ?auto_10698 ) ) ( not ( = ?auto_10695 ?auto_10685 ) ) ( not ( = ?auto_10695 ?auto_10679 ) ) ( not ( = ?auto_10695 ?auto_10689 ) ) ( not ( = ?auto_10693 ?auto_10697 ) ) ( not ( = ?auto_10693 ?auto_10688 ) ) ( not ( = ?auto_10693 ?auto_10686 ) ) ( not ( = ?auto_10693 ?auto_10700 ) ) ( not ( = ?auto_10693 ?auto_10691 ) ) ( not ( = ?auto_10693 ?auto_10690 ) ) ( not ( = ?auto_10693 ?auto_10687 ) ) ( not ( = ?auto_10669 ?auto_10678 ) ) ( not ( = ?auto_10669 ?auto_10680 ) ) ( not ( = ?auto_10670 ?auto_10678 ) ) ( not ( = ?auto_10670 ?auto_10680 ) ) ( not ( = ?auto_10671 ?auto_10678 ) ) ( not ( = ?auto_10671 ?auto_10680 ) ) ( not ( = ?auto_10672 ?auto_10678 ) ) ( not ( = ?auto_10672 ?auto_10680 ) ) ( not ( = ?auto_10673 ?auto_10678 ) ) ( not ( = ?auto_10673 ?auto_10680 ) ) ( not ( = ?auto_10674 ?auto_10678 ) ) ( not ( = ?auto_10674 ?auto_10680 ) ) ( not ( = ?auto_10675 ?auto_10678 ) ) ( not ( = ?auto_10675 ?auto_10680 ) ) ( not ( = ?auto_10676 ?auto_10678 ) ) ( not ( = ?auto_10676 ?auto_10680 ) ) ( not ( = ?auto_10678 ?auto_10693 ) ) ( not ( = ?auto_10678 ?auto_10697 ) ) ( not ( = ?auto_10678 ?auto_10688 ) ) ( not ( = ?auto_10678 ?auto_10686 ) ) ( not ( = ?auto_10678 ?auto_10700 ) ) ( not ( = ?auto_10678 ?auto_10691 ) ) ( not ( = ?auto_10678 ?auto_10690 ) ) ( not ( = ?auto_10678 ?auto_10687 ) ) ( not ( = ?auto_10680 ?auto_10693 ) ) ( not ( = ?auto_10680 ?auto_10697 ) ) ( not ( = ?auto_10680 ?auto_10688 ) ) ( not ( = ?auto_10680 ?auto_10686 ) ) ( not ( = ?auto_10680 ?auto_10700 ) ) ( not ( = ?auto_10680 ?auto_10691 ) ) ( not ( = ?auto_10680 ?auto_10690 ) ) ( not ( = ?auto_10680 ?auto_10687 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10669 ?auto_10670 ?auto_10671 ?auto_10672 ?auto_10673 ?auto_10674 ?auto_10675 ?auto_10676 ?auto_10677 )
      ( MAKE-1CRATE ?auto_10677 ?auto_10678 )
      ( MAKE-9CRATE-VERIFY ?auto_10669 ?auto_10670 ?auto_10671 ?auto_10672 ?auto_10673 ?auto_10674 ?auto_10675 ?auto_10676 ?auto_10677 ?auto_10678 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_10722 - SURFACE
      ?auto_10723 - SURFACE
      ?auto_10724 - SURFACE
      ?auto_10725 - SURFACE
      ?auto_10726 - SURFACE
      ?auto_10727 - SURFACE
      ?auto_10728 - SURFACE
      ?auto_10729 - SURFACE
      ?auto_10730 - SURFACE
      ?auto_10731 - SURFACE
      ?auto_10732 - SURFACE
    )
    :vars
    (
      ?auto_10734 - HOIST
      ?auto_10738 - PLACE
      ?auto_10735 - PLACE
      ?auto_10737 - HOIST
      ?auto_10736 - SURFACE
      ?auto_10746 - SURFACE
      ?auto_10741 - PLACE
      ?auto_10751 - HOIST
      ?auto_10755 - SURFACE
      ?auto_10743 - PLACE
      ?auto_10747 - HOIST
      ?auto_10752 - SURFACE
      ?auto_10753 - PLACE
      ?auto_10748 - HOIST
      ?auto_10744 - SURFACE
      ?auto_10749 - SURFACE
      ?auto_10740 - SURFACE
      ?auto_10742 - PLACE
      ?auto_10739 - HOIST
      ?auto_10745 - SURFACE
      ?auto_10754 - SURFACE
      ?auto_10750 - SURFACE
      ?auto_10733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10734 ?auto_10738 ) ( IS-CRATE ?auto_10732 ) ( not ( = ?auto_10735 ?auto_10738 ) ) ( HOIST-AT ?auto_10737 ?auto_10735 ) ( SURFACE-AT ?auto_10732 ?auto_10735 ) ( ON ?auto_10732 ?auto_10736 ) ( CLEAR ?auto_10732 ) ( not ( = ?auto_10731 ?auto_10732 ) ) ( not ( = ?auto_10731 ?auto_10736 ) ) ( not ( = ?auto_10732 ?auto_10736 ) ) ( not ( = ?auto_10734 ?auto_10737 ) ) ( IS-CRATE ?auto_10731 ) ( SURFACE-AT ?auto_10731 ?auto_10735 ) ( ON ?auto_10731 ?auto_10746 ) ( CLEAR ?auto_10731 ) ( not ( = ?auto_10730 ?auto_10731 ) ) ( not ( = ?auto_10730 ?auto_10746 ) ) ( not ( = ?auto_10731 ?auto_10746 ) ) ( IS-CRATE ?auto_10730 ) ( not ( = ?auto_10741 ?auto_10738 ) ) ( HOIST-AT ?auto_10751 ?auto_10741 ) ( AVAILABLE ?auto_10751 ) ( SURFACE-AT ?auto_10730 ?auto_10741 ) ( ON ?auto_10730 ?auto_10755 ) ( CLEAR ?auto_10730 ) ( not ( = ?auto_10729 ?auto_10730 ) ) ( not ( = ?auto_10729 ?auto_10755 ) ) ( not ( = ?auto_10730 ?auto_10755 ) ) ( not ( = ?auto_10734 ?auto_10751 ) ) ( IS-CRATE ?auto_10729 ) ( not ( = ?auto_10743 ?auto_10738 ) ) ( HOIST-AT ?auto_10747 ?auto_10743 ) ( SURFACE-AT ?auto_10729 ?auto_10743 ) ( ON ?auto_10729 ?auto_10752 ) ( CLEAR ?auto_10729 ) ( not ( = ?auto_10728 ?auto_10729 ) ) ( not ( = ?auto_10728 ?auto_10752 ) ) ( not ( = ?auto_10729 ?auto_10752 ) ) ( not ( = ?auto_10734 ?auto_10747 ) ) ( IS-CRATE ?auto_10728 ) ( not ( = ?auto_10753 ?auto_10738 ) ) ( HOIST-AT ?auto_10748 ?auto_10753 ) ( SURFACE-AT ?auto_10728 ?auto_10753 ) ( ON ?auto_10728 ?auto_10744 ) ( CLEAR ?auto_10728 ) ( not ( = ?auto_10727 ?auto_10728 ) ) ( not ( = ?auto_10727 ?auto_10744 ) ) ( not ( = ?auto_10728 ?auto_10744 ) ) ( not ( = ?auto_10734 ?auto_10748 ) ) ( IS-CRATE ?auto_10727 ) ( AVAILABLE ?auto_10737 ) ( SURFACE-AT ?auto_10727 ?auto_10735 ) ( ON ?auto_10727 ?auto_10749 ) ( CLEAR ?auto_10727 ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( not ( = ?auto_10726 ?auto_10749 ) ) ( not ( = ?auto_10727 ?auto_10749 ) ) ( IS-CRATE ?auto_10726 ) ( SURFACE-AT ?auto_10726 ?auto_10743 ) ( ON ?auto_10726 ?auto_10740 ) ( CLEAR ?auto_10726 ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10740 ) ) ( not ( = ?auto_10726 ?auto_10740 ) ) ( IS-CRATE ?auto_10725 ) ( not ( = ?auto_10742 ?auto_10738 ) ) ( HOIST-AT ?auto_10739 ?auto_10742 ) ( AVAILABLE ?auto_10739 ) ( SURFACE-AT ?auto_10725 ?auto_10742 ) ( ON ?auto_10725 ?auto_10745 ) ( CLEAR ?auto_10725 ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10745 ) ) ( not ( = ?auto_10725 ?auto_10745 ) ) ( not ( = ?auto_10734 ?auto_10739 ) ) ( IS-CRATE ?auto_10724 ) ( AVAILABLE ?auto_10748 ) ( SURFACE-AT ?auto_10724 ?auto_10753 ) ( ON ?auto_10724 ?auto_10754 ) ( CLEAR ?auto_10724 ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10754 ) ) ( not ( = ?auto_10724 ?auto_10754 ) ) ( SURFACE-AT ?auto_10722 ?auto_10738 ) ( CLEAR ?auto_10722 ) ( IS-CRATE ?auto_10723 ) ( AVAILABLE ?auto_10734 ) ( AVAILABLE ?auto_10747 ) ( SURFACE-AT ?auto_10723 ?auto_10743 ) ( ON ?auto_10723 ?auto_10750 ) ( CLEAR ?auto_10723 ) ( TRUCK-AT ?auto_10733 ?auto_10738 ) ( not ( = ?auto_10722 ?auto_10723 ) ) ( not ( = ?auto_10722 ?auto_10750 ) ) ( not ( = ?auto_10723 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10724 ) ) ( not ( = ?auto_10722 ?auto_10754 ) ) ( not ( = ?auto_10724 ?auto_10750 ) ) ( not ( = ?auto_10753 ?auto_10743 ) ) ( not ( = ?auto_10748 ?auto_10747 ) ) ( not ( = ?auto_10754 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10725 ) ) ( not ( = ?auto_10722 ?auto_10745 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( not ( = ?auto_10723 ?auto_10745 ) ) ( not ( = ?auto_10725 ?auto_10754 ) ) ( not ( = ?auto_10725 ?auto_10750 ) ) ( not ( = ?auto_10742 ?auto_10753 ) ) ( not ( = ?auto_10742 ?auto_10743 ) ) ( not ( = ?auto_10739 ?auto_10748 ) ) ( not ( = ?auto_10739 ?auto_10747 ) ) ( not ( = ?auto_10745 ?auto_10754 ) ) ( not ( = ?auto_10745 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10726 ) ) ( not ( = ?auto_10722 ?auto_10740 ) ) ( not ( = ?auto_10723 ?auto_10726 ) ) ( not ( = ?auto_10723 ?auto_10740 ) ) ( not ( = ?auto_10724 ?auto_10726 ) ) ( not ( = ?auto_10724 ?auto_10740 ) ) ( not ( = ?auto_10726 ?auto_10745 ) ) ( not ( = ?auto_10726 ?auto_10754 ) ) ( not ( = ?auto_10726 ?auto_10750 ) ) ( not ( = ?auto_10740 ?auto_10745 ) ) ( not ( = ?auto_10740 ?auto_10754 ) ) ( not ( = ?auto_10740 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10727 ) ) ( not ( = ?auto_10722 ?auto_10749 ) ) ( not ( = ?auto_10723 ?auto_10727 ) ) ( not ( = ?auto_10723 ?auto_10749 ) ) ( not ( = ?auto_10724 ?auto_10727 ) ) ( not ( = ?auto_10724 ?auto_10749 ) ) ( not ( = ?auto_10725 ?auto_10727 ) ) ( not ( = ?auto_10725 ?auto_10749 ) ) ( not ( = ?auto_10727 ?auto_10740 ) ) ( not ( = ?auto_10727 ?auto_10745 ) ) ( not ( = ?auto_10727 ?auto_10754 ) ) ( not ( = ?auto_10727 ?auto_10750 ) ) ( not ( = ?auto_10735 ?auto_10743 ) ) ( not ( = ?auto_10735 ?auto_10742 ) ) ( not ( = ?auto_10735 ?auto_10753 ) ) ( not ( = ?auto_10737 ?auto_10747 ) ) ( not ( = ?auto_10737 ?auto_10739 ) ) ( not ( = ?auto_10737 ?auto_10748 ) ) ( not ( = ?auto_10749 ?auto_10740 ) ) ( not ( = ?auto_10749 ?auto_10745 ) ) ( not ( = ?auto_10749 ?auto_10754 ) ) ( not ( = ?auto_10749 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10728 ) ) ( not ( = ?auto_10722 ?auto_10744 ) ) ( not ( = ?auto_10723 ?auto_10728 ) ) ( not ( = ?auto_10723 ?auto_10744 ) ) ( not ( = ?auto_10724 ?auto_10728 ) ) ( not ( = ?auto_10724 ?auto_10744 ) ) ( not ( = ?auto_10725 ?auto_10728 ) ) ( not ( = ?auto_10725 ?auto_10744 ) ) ( not ( = ?auto_10726 ?auto_10728 ) ) ( not ( = ?auto_10726 ?auto_10744 ) ) ( not ( = ?auto_10728 ?auto_10749 ) ) ( not ( = ?auto_10728 ?auto_10740 ) ) ( not ( = ?auto_10728 ?auto_10745 ) ) ( not ( = ?auto_10728 ?auto_10754 ) ) ( not ( = ?auto_10728 ?auto_10750 ) ) ( not ( = ?auto_10744 ?auto_10749 ) ) ( not ( = ?auto_10744 ?auto_10740 ) ) ( not ( = ?auto_10744 ?auto_10745 ) ) ( not ( = ?auto_10744 ?auto_10754 ) ) ( not ( = ?auto_10744 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10729 ) ) ( not ( = ?auto_10722 ?auto_10752 ) ) ( not ( = ?auto_10723 ?auto_10729 ) ) ( not ( = ?auto_10723 ?auto_10752 ) ) ( not ( = ?auto_10724 ?auto_10729 ) ) ( not ( = ?auto_10724 ?auto_10752 ) ) ( not ( = ?auto_10725 ?auto_10729 ) ) ( not ( = ?auto_10725 ?auto_10752 ) ) ( not ( = ?auto_10726 ?auto_10729 ) ) ( not ( = ?auto_10726 ?auto_10752 ) ) ( not ( = ?auto_10727 ?auto_10729 ) ) ( not ( = ?auto_10727 ?auto_10752 ) ) ( not ( = ?auto_10729 ?auto_10744 ) ) ( not ( = ?auto_10729 ?auto_10749 ) ) ( not ( = ?auto_10729 ?auto_10740 ) ) ( not ( = ?auto_10729 ?auto_10745 ) ) ( not ( = ?auto_10729 ?auto_10754 ) ) ( not ( = ?auto_10729 ?auto_10750 ) ) ( not ( = ?auto_10752 ?auto_10744 ) ) ( not ( = ?auto_10752 ?auto_10749 ) ) ( not ( = ?auto_10752 ?auto_10740 ) ) ( not ( = ?auto_10752 ?auto_10745 ) ) ( not ( = ?auto_10752 ?auto_10754 ) ) ( not ( = ?auto_10752 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10730 ) ) ( not ( = ?auto_10722 ?auto_10755 ) ) ( not ( = ?auto_10723 ?auto_10730 ) ) ( not ( = ?auto_10723 ?auto_10755 ) ) ( not ( = ?auto_10724 ?auto_10730 ) ) ( not ( = ?auto_10724 ?auto_10755 ) ) ( not ( = ?auto_10725 ?auto_10730 ) ) ( not ( = ?auto_10725 ?auto_10755 ) ) ( not ( = ?auto_10726 ?auto_10730 ) ) ( not ( = ?auto_10726 ?auto_10755 ) ) ( not ( = ?auto_10727 ?auto_10730 ) ) ( not ( = ?auto_10727 ?auto_10755 ) ) ( not ( = ?auto_10728 ?auto_10730 ) ) ( not ( = ?auto_10728 ?auto_10755 ) ) ( not ( = ?auto_10730 ?auto_10752 ) ) ( not ( = ?auto_10730 ?auto_10744 ) ) ( not ( = ?auto_10730 ?auto_10749 ) ) ( not ( = ?auto_10730 ?auto_10740 ) ) ( not ( = ?auto_10730 ?auto_10745 ) ) ( not ( = ?auto_10730 ?auto_10754 ) ) ( not ( = ?auto_10730 ?auto_10750 ) ) ( not ( = ?auto_10741 ?auto_10743 ) ) ( not ( = ?auto_10741 ?auto_10753 ) ) ( not ( = ?auto_10741 ?auto_10735 ) ) ( not ( = ?auto_10741 ?auto_10742 ) ) ( not ( = ?auto_10751 ?auto_10747 ) ) ( not ( = ?auto_10751 ?auto_10748 ) ) ( not ( = ?auto_10751 ?auto_10737 ) ) ( not ( = ?auto_10751 ?auto_10739 ) ) ( not ( = ?auto_10755 ?auto_10752 ) ) ( not ( = ?auto_10755 ?auto_10744 ) ) ( not ( = ?auto_10755 ?auto_10749 ) ) ( not ( = ?auto_10755 ?auto_10740 ) ) ( not ( = ?auto_10755 ?auto_10745 ) ) ( not ( = ?auto_10755 ?auto_10754 ) ) ( not ( = ?auto_10755 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10731 ) ) ( not ( = ?auto_10722 ?auto_10746 ) ) ( not ( = ?auto_10723 ?auto_10731 ) ) ( not ( = ?auto_10723 ?auto_10746 ) ) ( not ( = ?auto_10724 ?auto_10731 ) ) ( not ( = ?auto_10724 ?auto_10746 ) ) ( not ( = ?auto_10725 ?auto_10731 ) ) ( not ( = ?auto_10725 ?auto_10746 ) ) ( not ( = ?auto_10726 ?auto_10731 ) ) ( not ( = ?auto_10726 ?auto_10746 ) ) ( not ( = ?auto_10727 ?auto_10731 ) ) ( not ( = ?auto_10727 ?auto_10746 ) ) ( not ( = ?auto_10728 ?auto_10731 ) ) ( not ( = ?auto_10728 ?auto_10746 ) ) ( not ( = ?auto_10729 ?auto_10731 ) ) ( not ( = ?auto_10729 ?auto_10746 ) ) ( not ( = ?auto_10731 ?auto_10755 ) ) ( not ( = ?auto_10731 ?auto_10752 ) ) ( not ( = ?auto_10731 ?auto_10744 ) ) ( not ( = ?auto_10731 ?auto_10749 ) ) ( not ( = ?auto_10731 ?auto_10740 ) ) ( not ( = ?auto_10731 ?auto_10745 ) ) ( not ( = ?auto_10731 ?auto_10754 ) ) ( not ( = ?auto_10731 ?auto_10750 ) ) ( not ( = ?auto_10746 ?auto_10755 ) ) ( not ( = ?auto_10746 ?auto_10752 ) ) ( not ( = ?auto_10746 ?auto_10744 ) ) ( not ( = ?auto_10746 ?auto_10749 ) ) ( not ( = ?auto_10746 ?auto_10740 ) ) ( not ( = ?auto_10746 ?auto_10745 ) ) ( not ( = ?auto_10746 ?auto_10754 ) ) ( not ( = ?auto_10746 ?auto_10750 ) ) ( not ( = ?auto_10722 ?auto_10732 ) ) ( not ( = ?auto_10722 ?auto_10736 ) ) ( not ( = ?auto_10723 ?auto_10732 ) ) ( not ( = ?auto_10723 ?auto_10736 ) ) ( not ( = ?auto_10724 ?auto_10732 ) ) ( not ( = ?auto_10724 ?auto_10736 ) ) ( not ( = ?auto_10725 ?auto_10732 ) ) ( not ( = ?auto_10725 ?auto_10736 ) ) ( not ( = ?auto_10726 ?auto_10732 ) ) ( not ( = ?auto_10726 ?auto_10736 ) ) ( not ( = ?auto_10727 ?auto_10732 ) ) ( not ( = ?auto_10727 ?auto_10736 ) ) ( not ( = ?auto_10728 ?auto_10732 ) ) ( not ( = ?auto_10728 ?auto_10736 ) ) ( not ( = ?auto_10729 ?auto_10732 ) ) ( not ( = ?auto_10729 ?auto_10736 ) ) ( not ( = ?auto_10730 ?auto_10732 ) ) ( not ( = ?auto_10730 ?auto_10736 ) ) ( not ( = ?auto_10732 ?auto_10746 ) ) ( not ( = ?auto_10732 ?auto_10755 ) ) ( not ( = ?auto_10732 ?auto_10752 ) ) ( not ( = ?auto_10732 ?auto_10744 ) ) ( not ( = ?auto_10732 ?auto_10749 ) ) ( not ( = ?auto_10732 ?auto_10740 ) ) ( not ( = ?auto_10732 ?auto_10745 ) ) ( not ( = ?auto_10732 ?auto_10754 ) ) ( not ( = ?auto_10732 ?auto_10750 ) ) ( not ( = ?auto_10736 ?auto_10746 ) ) ( not ( = ?auto_10736 ?auto_10755 ) ) ( not ( = ?auto_10736 ?auto_10752 ) ) ( not ( = ?auto_10736 ?auto_10744 ) ) ( not ( = ?auto_10736 ?auto_10749 ) ) ( not ( = ?auto_10736 ?auto_10740 ) ) ( not ( = ?auto_10736 ?auto_10745 ) ) ( not ( = ?auto_10736 ?auto_10754 ) ) ( not ( = ?auto_10736 ?auto_10750 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10722 ?auto_10723 ?auto_10724 ?auto_10725 ?auto_10726 ?auto_10727 ?auto_10728 ?auto_10729 ?auto_10730 ?auto_10731 )
      ( MAKE-1CRATE ?auto_10731 ?auto_10732 )
      ( MAKE-10CRATE-VERIFY ?auto_10722 ?auto_10723 ?auto_10724 ?auto_10725 ?auto_10726 ?auto_10727 ?auto_10728 ?auto_10729 ?auto_10730 ?auto_10731 ?auto_10732 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_10778 - SURFACE
      ?auto_10779 - SURFACE
      ?auto_10780 - SURFACE
      ?auto_10781 - SURFACE
      ?auto_10782 - SURFACE
      ?auto_10783 - SURFACE
      ?auto_10784 - SURFACE
      ?auto_10785 - SURFACE
      ?auto_10786 - SURFACE
      ?auto_10787 - SURFACE
      ?auto_10788 - SURFACE
      ?auto_10789 - SURFACE
    )
    :vars
    (
      ?auto_10793 - HOIST
      ?auto_10795 - PLACE
      ?auto_10790 - PLACE
      ?auto_10792 - HOIST
      ?auto_10794 - SURFACE
      ?auto_10810 - PLACE
      ?auto_10812 - HOIST
      ?auto_10815 - SURFACE
      ?auto_10804 - SURFACE
      ?auto_10811 - PLACE
      ?auto_10803 - HOIST
      ?auto_10813 - SURFACE
      ?auto_10797 - PLACE
      ?auto_10799 - HOIST
      ?auto_10807 - SURFACE
      ?auto_10809 - PLACE
      ?auto_10814 - HOIST
      ?auto_10808 - SURFACE
      ?auto_10802 - SURFACE
      ?auto_10800 - SURFACE
      ?auto_10806 - PLACE
      ?auto_10798 - HOIST
      ?auto_10805 - SURFACE
      ?auto_10801 - SURFACE
      ?auto_10796 - SURFACE
      ?auto_10791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10793 ?auto_10795 ) ( IS-CRATE ?auto_10789 ) ( not ( = ?auto_10790 ?auto_10795 ) ) ( HOIST-AT ?auto_10792 ?auto_10790 ) ( AVAILABLE ?auto_10792 ) ( SURFACE-AT ?auto_10789 ?auto_10790 ) ( ON ?auto_10789 ?auto_10794 ) ( CLEAR ?auto_10789 ) ( not ( = ?auto_10788 ?auto_10789 ) ) ( not ( = ?auto_10788 ?auto_10794 ) ) ( not ( = ?auto_10789 ?auto_10794 ) ) ( not ( = ?auto_10793 ?auto_10792 ) ) ( IS-CRATE ?auto_10788 ) ( not ( = ?auto_10810 ?auto_10795 ) ) ( HOIST-AT ?auto_10812 ?auto_10810 ) ( SURFACE-AT ?auto_10788 ?auto_10810 ) ( ON ?auto_10788 ?auto_10815 ) ( CLEAR ?auto_10788 ) ( not ( = ?auto_10787 ?auto_10788 ) ) ( not ( = ?auto_10787 ?auto_10815 ) ) ( not ( = ?auto_10788 ?auto_10815 ) ) ( not ( = ?auto_10793 ?auto_10812 ) ) ( IS-CRATE ?auto_10787 ) ( SURFACE-AT ?auto_10787 ?auto_10810 ) ( ON ?auto_10787 ?auto_10804 ) ( CLEAR ?auto_10787 ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10786 ?auto_10804 ) ) ( not ( = ?auto_10787 ?auto_10804 ) ) ( IS-CRATE ?auto_10786 ) ( not ( = ?auto_10811 ?auto_10795 ) ) ( HOIST-AT ?auto_10803 ?auto_10811 ) ( AVAILABLE ?auto_10803 ) ( SURFACE-AT ?auto_10786 ?auto_10811 ) ( ON ?auto_10786 ?auto_10813 ) ( CLEAR ?auto_10786 ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10813 ) ) ( not ( = ?auto_10786 ?auto_10813 ) ) ( not ( = ?auto_10793 ?auto_10803 ) ) ( IS-CRATE ?auto_10785 ) ( not ( = ?auto_10797 ?auto_10795 ) ) ( HOIST-AT ?auto_10799 ?auto_10797 ) ( SURFACE-AT ?auto_10785 ?auto_10797 ) ( ON ?auto_10785 ?auto_10807 ) ( CLEAR ?auto_10785 ) ( not ( = ?auto_10784 ?auto_10785 ) ) ( not ( = ?auto_10784 ?auto_10807 ) ) ( not ( = ?auto_10785 ?auto_10807 ) ) ( not ( = ?auto_10793 ?auto_10799 ) ) ( IS-CRATE ?auto_10784 ) ( not ( = ?auto_10809 ?auto_10795 ) ) ( HOIST-AT ?auto_10814 ?auto_10809 ) ( SURFACE-AT ?auto_10784 ?auto_10809 ) ( ON ?auto_10784 ?auto_10808 ) ( CLEAR ?auto_10784 ) ( not ( = ?auto_10783 ?auto_10784 ) ) ( not ( = ?auto_10783 ?auto_10808 ) ) ( not ( = ?auto_10784 ?auto_10808 ) ) ( not ( = ?auto_10793 ?auto_10814 ) ) ( IS-CRATE ?auto_10783 ) ( AVAILABLE ?auto_10812 ) ( SURFACE-AT ?auto_10783 ?auto_10810 ) ( ON ?auto_10783 ?auto_10802 ) ( CLEAR ?auto_10783 ) ( not ( = ?auto_10782 ?auto_10783 ) ) ( not ( = ?auto_10782 ?auto_10802 ) ) ( not ( = ?auto_10783 ?auto_10802 ) ) ( IS-CRATE ?auto_10782 ) ( SURFACE-AT ?auto_10782 ?auto_10797 ) ( ON ?auto_10782 ?auto_10800 ) ( CLEAR ?auto_10782 ) ( not ( = ?auto_10781 ?auto_10782 ) ) ( not ( = ?auto_10781 ?auto_10800 ) ) ( not ( = ?auto_10782 ?auto_10800 ) ) ( IS-CRATE ?auto_10781 ) ( not ( = ?auto_10806 ?auto_10795 ) ) ( HOIST-AT ?auto_10798 ?auto_10806 ) ( AVAILABLE ?auto_10798 ) ( SURFACE-AT ?auto_10781 ?auto_10806 ) ( ON ?auto_10781 ?auto_10805 ) ( CLEAR ?auto_10781 ) ( not ( = ?auto_10780 ?auto_10781 ) ) ( not ( = ?auto_10780 ?auto_10805 ) ) ( not ( = ?auto_10781 ?auto_10805 ) ) ( not ( = ?auto_10793 ?auto_10798 ) ) ( IS-CRATE ?auto_10780 ) ( AVAILABLE ?auto_10814 ) ( SURFACE-AT ?auto_10780 ?auto_10809 ) ( ON ?auto_10780 ?auto_10801 ) ( CLEAR ?auto_10780 ) ( not ( = ?auto_10779 ?auto_10780 ) ) ( not ( = ?auto_10779 ?auto_10801 ) ) ( not ( = ?auto_10780 ?auto_10801 ) ) ( SURFACE-AT ?auto_10778 ?auto_10795 ) ( CLEAR ?auto_10778 ) ( IS-CRATE ?auto_10779 ) ( AVAILABLE ?auto_10793 ) ( AVAILABLE ?auto_10799 ) ( SURFACE-AT ?auto_10779 ?auto_10797 ) ( ON ?auto_10779 ?auto_10796 ) ( CLEAR ?auto_10779 ) ( TRUCK-AT ?auto_10791 ?auto_10795 ) ( not ( = ?auto_10778 ?auto_10779 ) ) ( not ( = ?auto_10778 ?auto_10796 ) ) ( not ( = ?auto_10779 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10780 ) ) ( not ( = ?auto_10778 ?auto_10801 ) ) ( not ( = ?auto_10780 ?auto_10796 ) ) ( not ( = ?auto_10809 ?auto_10797 ) ) ( not ( = ?auto_10814 ?auto_10799 ) ) ( not ( = ?auto_10801 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10781 ) ) ( not ( = ?auto_10778 ?auto_10805 ) ) ( not ( = ?auto_10779 ?auto_10781 ) ) ( not ( = ?auto_10779 ?auto_10805 ) ) ( not ( = ?auto_10781 ?auto_10801 ) ) ( not ( = ?auto_10781 ?auto_10796 ) ) ( not ( = ?auto_10806 ?auto_10809 ) ) ( not ( = ?auto_10806 ?auto_10797 ) ) ( not ( = ?auto_10798 ?auto_10814 ) ) ( not ( = ?auto_10798 ?auto_10799 ) ) ( not ( = ?auto_10805 ?auto_10801 ) ) ( not ( = ?auto_10805 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10782 ) ) ( not ( = ?auto_10778 ?auto_10800 ) ) ( not ( = ?auto_10779 ?auto_10782 ) ) ( not ( = ?auto_10779 ?auto_10800 ) ) ( not ( = ?auto_10780 ?auto_10782 ) ) ( not ( = ?auto_10780 ?auto_10800 ) ) ( not ( = ?auto_10782 ?auto_10805 ) ) ( not ( = ?auto_10782 ?auto_10801 ) ) ( not ( = ?auto_10782 ?auto_10796 ) ) ( not ( = ?auto_10800 ?auto_10805 ) ) ( not ( = ?auto_10800 ?auto_10801 ) ) ( not ( = ?auto_10800 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10783 ) ) ( not ( = ?auto_10778 ?auto_10802 ) ) ( not ( = ?auto_10779 ?auto_10783 ) ) ( not ( = ?auto_10779 ?auto_10802 ) ) ( not ( = ?auto_10780 ?auto_10783 ) ) ( not ( = ?auto_10780 ?auto_10802 ) ) ( not ( = ?auto_10781 ?auto_10783 ) ) ( not ( = ?auto_10781 ?auto_10802 ) ) ( not ( = ?auto_10783 ?auto_10800 ) ) ( not ( = ?auto_10783 ?auto_10805 ) ) ( not ( = ?auto_10783 ?auto_10801 ) ) ( not ( = ?auto_10783 ?auto_10796 ) ) ( not ( = ?auto_10810 ?auto_10797 ) ) ( not ( = ?auto_10810 ?auto_10806 ) ) ( not ( = ?auto_10810 ?auto_10809 ) ) ( not ( = ?auto_10812 ?auto_10799 ) ) ( not ( = ?auto_10812 ?auto_10798 ) ) ( not ( = ?auto_10812 ?auto_10814 ) ) ( not ( = ?auto_10802 ?auto_10800 ) ) ( not ( = ?auto_10802 ?auto_10805 ) ) ( not ( = ?auto_10802 ?auto_10801 ) ) ( not ( = ?auto_10802 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10784 ) ) ( not ( = ?auto_10778 ?auto_10808 ) ) ( not ( = ?auto_10779 ?auto_10784 ) ) ( not ( = ?auto_10779 ?auto_10808 ) ) ( not ( = ?auto_10780 ?auto_10784 ) ) ( not ( = ?auto_10780 ?auto_10808 ) ) ( not ( = ?auto_10781 ?auto_10784 ) ) ( not ( = ?auto_10781 ?auto_10808 ) ) ( not ( = ?auto_10782 ?auto_10784 ) ) ( not ( = ?auto_10782 ?auto_10808 ) ) ( not ( = ?auto_10784 ?auto_10802 ) ) ( not ( = ?auto_10784 ?auto_10800 ) ) ( not ( = ?auto_10784 ?auto_10805 ) ) ( not ( = ?auto_10784 ?auto_10801 ) ) ( not ( = ?auto_10784 ?auto_10796 ) ) ( not ( = ?auto_10808 ?auto_10802 ) ) ( not ( = ?auto_10808 ?auto_10800 ) ) ( not ( = ?auto_10808 ?auto_10805 ) ) ( not ( = ?auto_10808 ?auto_10801 ) ) ( not ( = ?auto_10808 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10785 ) ) ( not ( = ?auto_10778 ?auto_10807 ) ) ( not ( = ?auto_10779 ?auto_10785 ) ) ( not ( = ?auto_10779 ?auto_10807 ) ) ( not ( = ?auto_10780 ?auto_10785 ) ) ( not ( = ?auto_10780 ?auto_10807 ) ) ( not ( = ?auto_10781 ?auto_10785 ) ) ( not ( = ?auto_10781 ?auto_10807 ) ) ( not ( = ?auto_10782 ?auto_10785 ) ) ( not ( = ?auto_10782 ?auto_10807 ) ) ( not ( = ?auto_10783 ?auto_10785 ) ) ( not ( = ?auto_10783 ?auto_10807 ) ) ( not ( = ?auto_10785 ?auto_10808 ) ) ( not ( = ?auto_10785 ?auto_10802 ) ) ( not ( = ?auto_10785 ?auto_10800 ) ) ( not ( = ?auto_10785 ?auto_10805 ) ) ( not ( = ?auto_10785 ?auto_10801 ) ) ( not ( = ?auto_10785 ?auto_10796 ) ) ( not ( = ?auto_10807 ?auto_10808 ) ) ( not ( = ?auto_10807 ?auto_10802 ) ) ( not ( = ?auto_10807 ?auto_10800 ) ) ( not ( = ?auto_10807 ?auto_10805 ) ) ( not ( = ?auto_10807 ?auto_10801 ) ) ( not ( = ?auto_10807 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10786 ) ) ( not ( = ?auto_10778 ?auto_10813 ) ) ( not ( = ?auto_10779 ?auto_10786 ) ) ( not ( = ?auto_10779 ?auto_10813 ) ) ( not ( = ?auto_10780 ?auto_10786 ) ) ( not ( = ?auto_10780 ?auto_10813 ) ) ( not ( = ?auto_10781 ?auto_10786 ) ) ( not ( = ?auto_10781 ?auto_10813 ) ) ( not ( = ?auto_10782 ?auto_10786 ) ) ( not ( = ?auto_10782 ?auto_10813 ) ) ( not ( = ?auto_10783 ?auto_10786 ) ) ( not ( = ?auto_10783 ?auto_10813 ) ) ( not ( = ?auto_10784 ?auto_10786 ) ) ( not ( = ?auto_10784 ?auto_10813 ) ) ( not ( = ?auto_10786 ?auto_10807 ) ) ( not ( = ?auto_10786 ?auto_10808 ) ) ( not ( = ?auto_10786 ?auto_10802 ) ) ( not ( = ?auto_10786 ?auto_10800 ) ) ( not ( = ?auto_10786 ?auto_10805 ) ) ( not ( = ?auto_10786 ?auto_10801 ) ) ( not ( = ?auto_10786 ?auto_10796 ) ) ( not ( = ?auto_10811 ?auto_10797 ) ) ( not ( = ?auto_10811 ?auto_10809 ) ) ( not ( = ?auto_10811 ?auto_10810 ) ) ( not ( = ?auto_10811 ?auto_10806 ) ) ( not ( = ?auto_10803 ?auto_10799 ) ) ( not ( = ?auto_10803 ?auto_10814 ) ) ( not ( = ?auto_10803 ?auto_10812 ) ) ( not ( = ?auto_10803 ?auto_10798 ) ) ( not ( = ?auto_10813 ?auto_10807 ) ) ( not ( = ?auto_10813 ?auto_10808 ) ) ( not ( = ?auto_10813 ?auto_10802 ) ) ( not ( = ?auto_10813 ?auto_10800 ) ) ( not ( = ?auto_10813 ?auto_10805 ) ) ( not ( = ?auto_10813 ?auto_10801 ) ) ( not ( = ?auto_10813 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10787 ) ) ( not ( = ?auto_10778 ?auto_10804 ) ) ( not ( = ?auto_10779 ?auto_10787 ) ) ( not ( = ?auto_10779 ?auto_10804 ) ) ( not ( = ?auto_10780 ?auto_10787 ) ) ( not ( = ?auto_10780 ?auto_10804 ) ) ( not ( = ?auto_10781 ?auto_10787 ) ) ( not ( = ?auto_10781 ?auto_10804 ) ) ( not ( = ?auto_10782 ?auto_10787 ) ) ( not ( = ?auto_10782 ?auto_10804 ) ) ( not ( = ?auto_10783 ?auto_10787 ) ) ( not ( = ?auto_10783 ?auto_10804 ) ) ( not ( = ?auto_10784 ?auto_10787 ) ) ( not ( = ?auto_10784 ?auto_10804 ) ) ( not ( = ?auto_10785 ?auto_10787 ) ) ( not ( = ?auto_10785 ?auto_10804 ) ) ( not ( = ?auto_10787 ?auto_10813 ) ) ( not ( = ?auto_10787 ?auto_10807 ) ) ( not ( = ?auto_10787 ?auto_10808 ) ) ( not ( = ?auto_10787 ?auto_10802 ) ) ( not ( = ?auto_10787 ?auto_10800 ) ) ( not ( = ?auto_10787 ?auto_10805 ) ) ( not ( = ?auto_10787 ?auto_10801 ) ) ( not ( = ?auto_10787 ?auto_10796 ) ) ( not ( = ?auto_10804 ?auto_10813 ) ) ( not ( = ?auto_10804 ?auto_10807 ) ) ( not ( = ?auto_10804 ?auto_10808 ) ) ( not ( = ?auto_10804 ?auto_10802 ) ) ( not ( = ?auto_10804 ?auto_10800 ) ) ( not ( = ?auto_10804 ?auto_10805 ) ) ( not ( = ?auto_10804 ?auto_10801 ) ) ( not ( = ?auto_10804 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10788 ) ) ( not ( = ?auto_10778 ?auto_10815 ) ) ( not ( = ?auto_10779 ?auto_10788 ) ) ( not ( = ?auto_10779 ?auto_10815 ) ) ( not ( = ?auto_10780 ?auto_10788 ) ) ( not ( = ?auto_10780 ?auto_10815 ) ) ( not ( = ?auto_10781 ?auto_10788 ) ) ( not ( = ?auto_10781 ?auto_10815 ) ) ( not ( = ?auto_10782 ?auto_10788 ) ) ( not ( = ?auto_10782 ?auto_10815 ) ) ( not ( = ?auto_10783 ?auto_10788 ) ) ( not ( = ?auto_10783 ?auto_10815 ) ) ( not ( = ?auto_10784 ?auto_10788 ) ) ( not ( = ?auto_10784 ?auto_10815 ) ) ( not ( = ?auto_10785 ?auto_10788 ) ) ( not ( = ?auto_10785 ?auto_10815 ) ) ( not ( = ?auto_10786 ?auto_10788 ) ) ( not ( = ?auto_10786 ?auto_10815 ) ) ( not ( = ?auto_10788 ?auto_10804 ) ) ( not ( = ?auto_10788 ?auto_10813 ) ) ( not ( = ?auto_10788 ?auto_10807 ) ) ( not ( = ?auto_10788 ?auto_10808 ) ) ( not ( = ?auto_10788 ?auto_10802 ) ) ( not ( = ?auto_10788 ?auto_10800 ) ) ( not ( = ?auto_10788 ?auto_10805 ) ) ( not ( = ?auto_10788 ?auto_10801 ) ) ( not ( = ?auto_10788 ?auto_10796 ) ) ( not ( = ?auto_10815 ?auto_10804 ) ) ( not ( = ?auto_10815 ?auto_10813 ) ) ( not ( = ?auto_10815 ?auto_10807 ) ) ( not ( = ?auto_10815 ?auto_10808 ) ) ( not ( = ?auto_10815 ?auto_10802 ) ) ( not ( = ?auto_10815 ?auto_10800 ) ) ( not ( = ?auto_10815 ?auto_10805 ) ) ( not ( = ?auto_10815 ?auto_10801 ) ) ( not ( = ?auto_10815 ?auto_10796 ) ) ( not ( = ?auto_10778 ?auto_10789 ) ) ( not ( = ?auto_10778 ?auto_10794 ) ) ( not ( = ?auto_10779 ?auto_10789 ) ) ( not ( = ?auto_10779 ?auto_10794 ) ) ( not ( = ?auto_10780 ?auto_10789 ) ) ( not ( = ?auto_10780 ?auto_10794 ) ) ( not ( = ?auto_10781 ?auto_10789 ) ) ( not ( = ?auto_10781 ?auto_10794 ) ) ( not ( = ?auto_10782 ?auto_10789 ) ) ( not ( = ?auto_10782 ?auto_10794 ) ) ( not ( = ?auto_10783 ?auto_10789 ) ) ( not ( = ?auto_10783 ?auto_10794 ) ) ( not ( = ?auto_10784 ?auto_10789 ) ) ( not ( = ?auto_10784 ?auto_10794 ) ) ( not ( = ?auto_10785 ?auto_10789 ) ) ( not ( = ?auto_10785 ?auto_10794 ) ) ( not ( = ?auto_10786 ?auto_10789 ) ) ( not ( = ?auto_10786 ?auto_10794 ) ) ( not ( = ?auto_10787 ?auto_10789 ) ) ( not ( = ?auto_10787 ?auto_10794 ) ) ( not ( = ?auto_10789 ?auto_10815 ) ) ( not ( = ?auto_10789 ?auto_10804 ) ) ( not ( = ?auto_10789 ?auto_10813 ) ) ( not ( = ?auto_10789 ?auto_10807 ) ) ( not ( = ?auto_10789 ?auto_10808 ) ) ( not ( = ?auto_10789 ?auto_10802 ) ) ( not ( = ?auto_10789 ?auto_10800 ) ) ( not ( = ?auto_10789 ?auto_10805 ) ) ( not ( = ?auto_10789 ?auto_10801 ) ) ( not ( = ?auto_10789 ?auto_10796 ) ) ( not ( = ?auto_10790 ?auto_10810 ) ) ( not ( = ?auto_10790 ?auto_10811 ) ) ( not ( = ?auto_10790 ?auto_10797 ) ) ( not ( = ?auto_10790 ?auto_10809 ) ) ( not ( = ?auto_10790 ?auto_10806 ) ) ( not ( = ?auto_10792 ?auto_10812 ) ) ( not ( = ?auto_10792 ?auto_10803 ) ) ( not ( = ?auto_10792 ?auto_10799 ) ) ( not ( = ?auto_10792 ?auto_10814 ) ) ( not ( = ?auto_10792 ?auto_10798 ) ) ( not ( = ?auto_10794 ?auto_10815 ) ) ( not ( = ?auto_10794 ?auto_10804 ) ) ( not ( = ?auto_10794 ?auto_10813 ) ) ( not ( = ?auto_10794 ?auto_10807 ) ) ( not ( = ?auto_10794 ?auto_10808 ) ) ( not ( = ?auto_10794 ?auto_10802 ) ) ( not ( = ?auto_10794 ?auto_10800 ) ) ( not ( = ?auto_10794 ?auto_10805 ) ) ( not ( = ?auto_10794 ?auto_10801 ) ) ( not ( = ?auto_10794 ?auto_10796 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10778 ?auto_10779 ?auto_10780 ?auto_10781 ?auto_10782 ?auto_10783 ?auto_10784 ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10788 )
      ( MAKE-1CRATE ?auto_10788 ?auto_10789 )
      ( MAKE-11CRATE-VERIFY ?auto_10778 ?auto_10779 ?auto_10780 ?auto_10781 ?auto_10782 ?auto_10783 ?auto_10784 ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10788 ?auto_10789 ) )
  )

)

