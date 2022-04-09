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
      ?auto_10405 - HOIST
      ?auto_10410 - PLACE
      ?auto_10408 - PLACE
      ?auto_10406 - HOIST
      ?auto_10407 - SURFACE
      ?auto_10412 - PLACE
      ?auto_10413 - HOIST
      ?auto_10411 - SURFACE
      ?auto_10409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10405 ?auto_10410 ) ( IS-CRATE ?auto_10404 ) ( not ( = ?auto_10408 ?auto_10410 ) ) ( HOIST-AT ?auto_10406 ?auto_10408 ) ( AVAILABLE ?auto_10406 ) ( SURFACE-AT ?auto_10404 ?auto_10408 ) ( ON ?auto_10404 ?auto_10407 ) ( CLEAR ?auto_10404 ) ( not ( = ?auto_10403 ?auto_10404 ) ) ( not ( = ?auto_10403 ?auto_10407 ) ) ( not ( = ?auto_10404 ?auto_10407 ) ) ( not ( = ?auto_10405 ?auto_10406 ) ) ( SURFACE-AT ?auto_10402 ?auto_10410 ) ( CLEAR ?auto_10402 ) ( IS-CRATE ?auto_10403 ) ( AVAILABLE ?auto_10405 ) ( not ( = ?auto_10412 ?auto_10410 ) ) ( HOIST-AT ?auto_10413 ?auto_10412 ) ( AVAILABLE ?auto_10413 ) ( SURFACE-AT ?auto_10403 ?auto_10412 ) ( ON ?auto_10403 ?auto_10411 ) ( CLEAR ?auto_10403 ) ( TRUCK-AT ?auto_10409 ?auto_10410 ) ( not ( = ?auto_10402 ?auto_10403 ) ) ( not ( = ?auto_10402 ?auto_10411 ) ) ( not ( = ?auto_10403 ?auto_10411 ) ) ( not ( = ?auto_10405 ?auto_10413 ) ) ( not ( = ?auto_10402 ?auto_10404 ) ) ( not ( = ?auto_10402 ?auto_10407 ) ) ( not ( = ?auto_10404 ?auto_10411 ) ) ( not ( = ?auto_10408 ?auto_10412 ) ) ( not ( = ?auto_10406 ?auto_10413 ) ) ( not ( = ?auto_10407 ?auto_10411 ) ) )
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
      ?auto_10432 - HOIST
      ?auto_10433 - PLACE
      ?auto_10437 - PLACE
      ?auto_10434 - HOIST
      ?auto_10435 - SURFACE
      ?auto_10438 - PLACE
      ?auto_10442 - HOIST
      ?auto_10443 - SURFACE
      ?auto_10440 - PLACE
      ?auto_10439 - HOIST
      ?auto_10441 - SURFACE
      ?auto_10436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10432 ?auto_10433 ) ( IS-CRATE ?auto_10431 ) ( not ( = ?auto_10437 ?auto_10433 ) ) ( HOIST-AT ?auto_10434 ?auto_10437 ) ( AVAILABLE ?auto_10434 ) ( SURFACE-AT ?auto_10431 ?auto_10437 ) ( ON ?auto_10431 ?auto_10435 ) ( CLEAR ?auto_10431 ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10435 ) ) ( not ( = ?auto_10431 ?auto_10435 ) ) ( not ( = ?auto_10432 ?auto_10434 ) ) ( IS-CRATE ?auto_10430 ) ( not ( = ?auto_10438 ?auto_10433 ) ) ( HOIST-AT ?auto_10442 ?auto_10438 ) ( AVAILABLE ?auto_10442 ) ( SURFACE-AT ?auto_10430 ?auto_10438 ) ( ON ?auto_10430 ?auto_10443 ) ( CLEAR ?auto_10430 ) ( not ( = ?auto_10429 ?auto_10430 ) ) ( not ( = ?auto_10429 ?auto_10443 ) ) ( not ( = ?auto_10430 ?auto_10443 ) ) ( not ( = ?auto_10432 ?auto_10442 ) ) ( SURFACE-AT ?auto_10428 ?auto_10433 ) ( CLEAR ?auto_10428 ) ( IS-CRATE ?auto_10429 ) ( AVAILABLE ?auto_10432 ) ( not ( = ?auto_10440 ?auto_10433 ) ) ( HOIST-AT ?auto_10439 ?auto_10440 ) ( AVAILABLE ?auto_10439 ) ( SURFACE-AT ?auto_10429 ?auto_10440 ) ( ON ?auto_10429 ?auto_10441 ) ( CLEAR ?auto_10429 ) ( TRUCK-AT ?auto_10436 ?auto_10433 ) ( not ( = ?auto_10428 ?auto_10429 ) ) ( not ( = ?auto_10428 ?auto_10441 ) ) ( not ( = ?auto_10429 ?auto_10441 ) ) ( not ( = ?auto_10432 ?auto_10439 ) ) ( not ( = ?auto_10428 ?auto_10430 ) ) ( not ( = ?auto_10428 ?auto_10443 ) ) ( not ( = ?auto_10430 ?auto_10441 ) ) ( not ( = ?auto_10438 ?auto_10440 ) ) ( not ( = ?auto_10442 ?auto_10439 ) ) ( not ( = ?auto_10443 ?auto_10441 ) ) ( not ( = ?auto_10428 ?auto_10431 ) ) ( not ( = ?auto_10428 ?auto_10435 ) ) ( not ( = ?auto_10429 ?auto_10431 ) ) ( not ( = ?auto_10429 ?auto_10435 ) ) ( not ( = ?auto_10431 ?auto_10443 ) ) ( not ( = ?auto_10431 ?auto_10441 ) ) ( not ( = ?auto_10437 ?auto_10438 ) ) ( not ( = ?auto_10437 ?auto_10440 ) ) ( not ( = ?auto_10434 ?auto_10442 ) ) ( not ( = ?auto_10434 ?auto_10439 ) ) ( not ( = ?auto_10435 ?auto_10443 ) ) ( not ( = ?auto_10435 ?auto_10441 ) ) )
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
      ?auto_10464 - HOIST
      ?auto_10468 - PLACE
      ?auto_10466 - PLACE
      ?auto_10467 - HOIST
      ?auto_10469 - SURFACE
      ?auto_10471 - PLACE
      ?auto_10473 - HOIST
      ?auto_10476 - SURFACE
      ?auto_10472 - PLACE
      ?auto_10470 - HOIST
      ?auto_10474 - SURFACE
      ?auto_10475 - SURFACE
      ?auto_10465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10464 ?auto_10468 ) ( IS-CRATE ?auto_10463 ) ( not ( = ?auto_10466 ?auto_10468 ) ) ( HOIST-AT ?auto_10467 ?auto_10466 ) ( SURFACE-AT ?auto_10463 ?auto_10466 ) ( ON ?auto_10463 ?auto_10469 ) ( CLEAR ?auto_10463 ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( not ( = ?auto_10462 ?auto_10469 ) ) ( not ( = ?auto_10463 ?auto_10469 ) ) ( not ( = ?auto_10464 ?auto_10467 ) ) ( IS-CRATE ?auto_10462 ) ( not ( = ?auto_10471 ?auto_10468 ) ) ( HOIST-AT ?auto_10473 ?auto_10471 ) ( AVAILABLE ?auto_10473 ) ( SURFACE-AT ?auto_10462 ?auto_10471 ) ( ON ?auto_10462 ?auto_10476 ) ( CLEAR ?auto_10462 ) ( not ( = ?auto_10461 ?auto_10462 ) ) ( not ( = ?auto_10461 ?auto_10476 ) ) ( not ( = ?auto_10462 ?auto_10476 ) ) ( not ( = ?auto_10464 ?auto_10473 ) ) ( IS-CRATE ?auto_10461 ) ( not ( = ?auto_10472 ?auto_10468 ) ) ( HOIST-AT ?auto_10470 ?auto_10472 ) ( AVAILABLE ?auto_10470 ) ( SURFACE-AT ?auto_10461 ?auto_10472 ) ( ON ?auto_10461 ?auto_10474 ) ( CLEAR ?auto_10461 ) ( not ( = ?auto_10460 ?auto_10461 ) ) ( not ( = ?auto_10460 ?auto_10474 ) ) ( not ( = ?auto_10461 ?auto_10474 ) ) ( not ( = ?auto_10464 ?auto_10470 ) ) ( SURFACE-AT ?auto_10459 ?auto_10468 ) ( CLEAR ?auto_10459 ) ( IS-CRATE ?auto_10460 ) ( AVAILABLE ?auto_10464 ) ( AVAILABLE ?auto_10467 ) ( SURFACE-AT ?auto_10460 ?auto_10466 ) ( ON ?auto_10460 ?auto_10475 ) ( CLEAR ?auto_10460 ) ( TRUCK-AT ?auto_10465 ?auto_10468 ) ( not ( = ?auto_10459 ?auto_10460 ) ) ( not ( = ?auto_10459 ?auto_10475 ) ) ( not ( = ?auto_10460 ?auto_10475 ) ) ( not ( = ?auto_10459 ?auto_10461 ) ) ( not ( = ?auto_10459 ?auto_10474 ) ) ( not ( = ?auto_10461 ?auto_10475 ) ) ( not ( = ?auto_10472 ?auto_10466 ) ) ( not ( = ?auto_10470 ?auto_10467 ) ) ( not ( = ?auto_10474 ?auto_10475 ) ) ( not ( = ?auto_10459 ?auto_10462 ) ) ( not ( = ?auto_10459 ?auto_10476 ) ) ( not ( = ?auto_10460 ?auto_10462 ) ) ( not ( = ?auto_10460 ?auto_10476 ) ) ( not ( = ?auto_10462 ?auto_10474 ) ) ( not ( = ?auto_10462 ?auto_10475 ) ) ( not ( = ?auto_10471 ?auto_10472 ) ) ( not ( = ?auto_10471 ?auto_10466 ) ) ( not ( = ?auto_10473 ?auto_10470 ) ) ( not ( = ?auto_10473 ?auto_10467 ) ) ( not ( = ?auto_10476 ?auto_10474 ) ) ( not ( = ?auto_10476 ?auto_10475 ) ) ( not ( = ?auto_10459 ?auto_10463 ) ) ( not ( = ?auto_10459 ?auto_10469 ) ) ( not ( = ?auto_10460 ?auto_10463 ) ) ( not ( = ?auto_10460 ?auto_10469 ) ) ( not ( = ?auto_10461 ?auto_10463 ) ) ( not ( = ?auto_10461 ?auto_10469 ) ) ( not ( = ?auto_10463 ?auto_10476 ) ) ( not ( = ?auto_10463 ?auto_10474 ) ) ( not ( = ?auto_10463 ?auto_10475 ) ) ( not ( = ?auto_10469 ?auto_10476 ) ) ( not ( = ?auto_10469 ?auto_10474 ) ) ( not ( = ?auto_10469 ?auto_10475 ) ) )
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
      ?auto_10499 - HOIST
      ?auto_10502 - PLACE
      ?auto_10504 - PLACE
      ?auto_10501 - HOIST
      ?auto_10503 - SURFACE
      ?auto_10507 - PLACE
      ?auto_10506 - HOIST
      ?auto_10513 - SURFACE
      ?auto_10511 - PLACE
      ?auto_10512 - HOIST
      ?auto_10508 - SURFACE
      ?auto_10505 - PLACE
      ?auto_10510 - HOIST
      ?auto_10509 - SURFACE
      ?auto_10514 - SURFACE
      ?auto_10500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10499 ?auto_10502 ) ( IS-CRATE ?auto_10498 ) ( not ( = ?auto_10504 ?auto_10502 ) ) ( HOIST-AT ?auto_10501 ?auto_10504 ) ( AVAILABLE ?auto_10501 ) ( SURFACE-AT ?auto_10498 ?auto_10504 ) ( ON ?auto_10498 ?auto_10503 ) ( CLEAR ?auto_10498 ) ( not ( = ?auto_10497 ?auto_10498 ) ) ( not ( = ?auto_10497 ?auto_10503 ) ) ( not ( = ?auto_10498 ?auto_10503 ) ) ( not ( = ?auto_10499 ?auto_10501 ) ) ( IS-CRATE ?auto_10497 ) ( not ( = ?auto_10507 ?auto_10502 ) ) ( HOIST-AT ?auto_10506 ?auto_10507 ) ( SURFACE-AT ?auto_10497 ?auto_10507 ) ( ON ?auto_10497 ?auto_10513 ) ( CLEAR ?auto_10497 ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10513 ) ) ( not ( = ?auto_10497 ?auto_10513 ) ) ( not ( = ?auto_10499 ?auto_10506 ) ) ( IS-CRATE ?auto_10496 ) ( not ( = ?auto_10511 ?auto_10502 ) ) ( HOIST-AT ?auto_10512 ?auto_10511 ) ( AVAILABLE ?auto_10512 ) ( SURFACE-AT ?auto_10496 ?auto_10511 ) ( ON ?auto_10496 ?auto_10508 ) ( CLEAR ?auto_10496 ) ( not ( = ?auto_10495 ?auto_10496 ) ) ( not ( = ?auto_10495 ?auto_10508 ) ) ( not ( = ?auto_10496 ?auto_10508 ) ) ( not ( = ?auto_10499 ?auto_10512 ) ) ( IS-CRATE ?auto_10495 ) ( not ( = ?auto_10505 ?auto_10502 ) ) ( HOIST-AT ?auto_10510 ?auto_10505 ) ( AVAILABLE ?auto_10510 ) ( SURFACE-AT ?auto_10495 ?auto_10505 ) ( ON ?auto_10495 ?auto_10509 ) ( CLEAR ?auto_10495 ) ( not ( = ?auto_10494 ?auto_10495 ) ) ( not ( = ?auto_10494 ?auto_10509 ) ) ( not ( = ?auto_10495 ?auto_10509 ) ) ( not ( = ?auto_10499 ?auto_10510 ) ) ( SURFACE-AT ?auto_10493 ?auto_10502 ) ( CLEAR ?auto_10493 ) ( IS-CRATE ?auto_10494 ) ( AVAILABLE ?auto_10499 ) ( AVAILABLE ?auto_10506 ) ( SURFACE-AT ?auto_10494 ?auto_10507 ) ( ON ?auto_10494 ?auto_10514 ) ( CLEAR ?auto_10494 ) ( TRUCK-AT ?auto_10500 ?auto_10502 ) ( not ( = ?auto_10493 ?auto_10494 ) ) ( not ( = ?auto_10493 ?auto_10514 ) ) ( not ( = ?auto_10494 ?auto_10514 ) ) ( not ( = ?auto_10493 ?auto_10495 ) ) ( not ( = ?auto_10493 ?auto_10509 ) ) ( not ( = ?auto_10495 ?auto_10514 ) ) ( not ( = ?auto_10505 ?auto_10507 ) ) ( not ( = ?auto_10510 ?auto_10506 ) ) ( not ( = ?auto_10509 ?auto_10514 ) ) ( not ( = ?auto_10493 ?auto_10496 ) ) ( not ( = ?auto_10493 ?auto_10508 ) ) ( not ( = ?auto_10494 ?auto_10496 ) ) ( not ( = ?auto_10494 ?auto_10508 ) ) ( not ( = ?auto_10496 ?auto_10509 ) ) ( not ( = ?auto_10496 ?auto_10514 ) ) ( not ( = ?auto_10511 ?auto_10505 ) ) ( not ( = ?auto_10511 ?auto_10507 ) ) ( not ( = ?auto_10512 ?auto_10510 ) ) ( not ( = ?auto_10512 ?auto_10506 ) ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( not ( = ?auto_10508 ?auto_10514 ) ) ( not ( = ?auto_10493 ?auto_10497 ) ) ( not ( = ?auto_10493 ?auto_10513 ) ) ( not ( = ?auto_10494 ?auto_10497 ) ) ( not ( = ?auto_10494 ?auto_10513 ) ) ( not ( = ?auto_10495 ?auto_10497 ) ) ( not ( = ?auto_10495 ?auto_10513 ) ) ( not ( = ?auto_10497 ?auto_10508 ) ) ( not ( = ?auto_10497 ?auto_10509 ) ) ( not ( = ?auto_10497 ?auto_10514 ) ) ( not ( = ?auto_10513 ?auto_10508 ) ) ( not ( = ?auto_10513 ?auto_10509 ) ) ( not ( = ?auto_10513 ?auto_10514 ) ) ( not ( = ?auto_10493 ?auto_10498 ) ) ( not ( = ?auto_10493 ?auto_10503 ) ) ( not ( = ?auto_10494 ?auto_10498 ) ) ( not ( = ?auto_10494 ?auto_10503 ) ) ( not ( = ?auto_10495 ?auto_10498 ) ) ( not ( = ?auto_10495 ?auto_10503 ) ) ( not ( = ?auto_10496 ?auto_10498 ) ) ( not ( = ?auto_10496 ?auto_10503 ) ) ( not ( = ?auto_10498 ?auto_10513 ) ) ( not ( = ?auto_10498 ?auto_10508 ) ) ( not ( = ?auto_10498 ?auto_10509 ) ) ( not ( = ?auto_10498 ?auto_10514 ) ) ( not ( = ?auto_10504 ?auto_10507 ) ) ( not ( = ?auto_10504 ?auto_10511 ) ) ( not ( = ?auto_10504 ?auto_10505 ) ) ( not ( = ?auto_10501 ?auto_10506 ) ) ( not ( = ?auto_10501 ?auto_10512 ) ) ( not ( = ?auto_10501 ?auto_10510 ) ) ( not ( = ?auto_10503 ?auto_10513 ) ) ( not ( = ?auto_10503 ?auto_10508 ) ) ( not ( = ?auto_10503 ?auto_10509 ) ) ( not ( = ?auto_10503 ?auto_10514 ) ) )
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
      ?auto_10539 - HOIST
      ?auto_10543 - PLACE
      ?auto_10541 - PLACE
      ?auto_10542 - HOIST
      ?auto_10540 - SURFACE
      ?auto_10547 - PLACE
      ?auto_10550 - HOIST
      ?auto_10551 - SURFACE
      ?auto_10555 - PLACE
      ?auto_10553 - HOIST
      ?auto_10546 - SURFACE
      ?auto_10548 - PLACE
      ?auto_10545 - HOIST
      ?auto_10554 - SURFACE
      ?auto_10549 - SURFACE
      ?auto_10552 - SURFACE
      ?auto_10544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10539 ?auto_10543 ) ( IS-CRATE ?auto_10538 ) ( not ( = ?auto_10541 ?auto_10543 ) ) ( HOIST-AT ?auto_10542 ?auto_10541 ) ( SURFACE-AT ?auto_10538 ?auto_10541 ) ( ON ?auto_10538 ?auto_10540 ) ( CLEAR ?auto_10538 ) ( not ( = ?auto_10537 ?auto_10538 ) ) ( not ( = ?auto_10537 ?auto_10540 ) ) ( not ( = ?auto_10538 ?auto_10540 ) ) ( not ( = ?auto_10539 ?auto_10542 ) ) ( IS-CRATE ?auto_10537 ) ( not ( = ?auto_10547 ?auto_10543 ) ) ( HOIST-AT ?auto_10550 ?auto_10547 ) ( AVAILABLE ?auto_10550 ) ( SURFACE-AT ?auto_10537 ?auto_10547 ) ( ON ?auto_10537 ?auto_10551 ) ( CLEAR ?auto_10537 ) ( not ( = ?auto_10536 ?auto_10537 ) ) ( not ( = ?auto_10536 ?auto_10551 ) ) ( not ( = ?auto_10537 ?auto_10551 ) ) ( not ( = ?auto_10539 ?auto_10550 ) ) ( IS-CRATE ?auto_10536 ) ( not ( = ?auto_10555 ?auto_10543 ) ) ( HOIST-AT ?auto_10553 ?auto_10555 ) ( SURFACE-AT ?auto_10536 ?auto_10555 ) ( ON ?auto_10536 ?auto_10546 ) ( CLEAR ?auto_10536 ) ( not ( = ?auto_10535 ?auto_10536 ) ) ( not ( = ?auto_10535 ?auto_10546 ) ) ( not ( = ?auto_10536 ?auto_10546 ) ) ( not ( = ?auto_10539 ?auto_10553 ) ) ( IS-CRATE ?auto_10535 ) ( not ( = ?auto_10548 ?auto_10543 ) ) ( HOIST-AT ?auto_10545 ?auto_10548 ) ( AVAILABLE ?auto_10545 ) ( SURFACE-AT ?auto_10535 ?auto_10548 ) ( ON ?auto_10535 ?auto_10554 ) ( CLEAR ?auto_10535 ) ( not ( = ?auto_10534 ?auto_10535 ) ) ( not ( = ?auto_10534 ?auto_10554 ) ) ( not ( = ?auto_10535 ?auto_10554 ) ) ( not ( = ?auto_10539 ?auto_10545 ) ) ( IS-CRATE ?auto_10534 ) ( AVAILABLE ?auto_10542 ) ( SURFACE-AT ?auto_10534 ?auto_10541 ) ( ON ?auto_10534 ?auto_10549 ) ( CLEAR ?auto_10534 ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( not ( = ?auto_10533 ?auto_10549 ) ) ( not ( = ?auto_10534 ?auto_10549 ) ) ( SURFACE-AT ?auto_10532 ?auto_10543 ) ( CLEAR ?auto_10532 ) ( IS-CRATE ?auto_10533 ) ( AVAILABLE ?auto_10539 ) ( AVAILABLE ?auto_10553 ) ( SURFACE-AT ?auto_10533 ?auto_10555 ) ( ON ?auto_10533 ?auto_10552 ) ( CLEAR ?auto_10533 ) ( TRUCK-AT ?auto_10544 ?auto_10543 ) ( not ( = ?auto_10532 ?auto_10533 ) ) ( not ( = ?auto_10532 ?auto_10552 ) ) ( not ( = ?auto_10533 ?auto_10552 ) ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( not ( = ?auto_10532 ?auto_10549 ) ) ( not ( = ?auto_10534 ?auto_10552 ) ) ( not ( = ?auto_10541 ?auto_10555 ) ) ( not ( = ?auto_10542 ?auto_10553 ) ) ( not ( = ?auto_10549 ?auto_10552 ) ) ( not ( = ?auto_10532 ?auto_10535 ) ) ( not ( = ?auto_10532 ?auto_10554 ) ) ( not ( = ?auto_10533 ?auto_10535 ) ) ( not ( = ?auto_10533 ?auto_10554 ) ) ( not ( = ?auto_10535 ?auto_10549 ) ) ( not ( = ?auto_10535 ?auto_10552 ) ) ( not ( = ?auto_10548 ?auto_10541 ) ) ( not ( = ?auto_10548 ?auto_10555 ) ) ( not ( = ?auto_10545 ?auto_10542 ) ) ( not ( = ?auto_10545 ?auto_10553 ) ) ( not ( = ?auto_10554 ?auto_10549 ) ) ( not ( = ?auto_10554 ?auto_10552 ) ) ( not ( = ?auto_10532 ?auto_10536 ) ) ( not ( = ?auto_10532 ?auto_10546 ) ) ( not ( = ?auto_10533 ?auto_10536 ) ) ( not ( = ?auto_10533 ?auto_10546 ) ) ( not ( = ?auto_10534 ?auto_10536 ) ) ( not ( = ?auto_10534 ?auto_10546 ) ) ( not ( = ?auto_10536 ?auto_10554 ) ) ( not ( = ?auto_10536 ?auto_10549 ) ) ( not ( = ?auto_10536 ?auto_10552 ) ) ( not ( = ?auto_10546 ?auto_10554 ) ) ( not ( = ?auto_10546 ?auto_10549 ) ) ( not ( = ?auto_10546 ?auto_10552 ) ) ( not ( = ?auto_10532 ?auto_10537 ) ) ( not ( = ?auto_10532 ?auto_10551 ) ) ( not ( = ?auto_10533 ?auto_10537 ) ) ( not ( = ?auto_10533 ?auto_10551 ) ) ( not ( = ?auto_10534 ?auto_10537 ) ) ( not ( = ?auto_10534 ?auto_10551 ) ) ( not ( = ?auto_10535 ?auto_10537 ) ) ( not ( = ?auto_10535 ?auto_10551 ) ) ( not ( = ?auto_10537 ?auto_10546 ) ) ( not ( = ?auto_10537 ?auto_10554 ) ) ( not ( = ?auto_10537 ?auto_10549 ) ) ( not ( = ?auto_10537 ?auto_10552 ) ) ( not ( = ?auto_10547 ?auto_10555 ) ) ( not ( = ?auto_10547 ?auto_10548 ) ) ( not ( = ?auto_10547 ?auto_10541 ) ) ( not ( = ?auto_10550 ?auto_10553 ) ) ( not ( = ?auto_10550 ?auto_10545 ) ) ( not ( = ?auto_10550 ?auto_10542 ) ) ( not ( = ?auto_10551 ?auto_10546 ) ) ( not ( = ?auto_10551 ?auto_10554 ) ) ( not ( = ?auto_10551 ?auto_10549 ) ) ( not ( = ?auto_10551 ?auto_10552 ) ) ( not ( = ?auto_10532 ?auto_10538 ) ) ( not ( = ?auto_10532 ?auto_10540 ) ) ( not ( = ?auto_10533 ?auto_10538 ) ) ( not ( = ?auto_10533 ?auto_10540 ) ) ( not ( = ?auto_10534 ?auto_10538 ) ) ( not ( = ?auto_10534 ?auto_10540 ) ) ( not ( = ?auto_10535 ?auto_10538 ) ) ( not ( = ?auto_10535 ?auto_10540 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10536 ?auto_10540 ) ) ( not ( = ?auto_10538 ?auto_10551 ) ) ( not ( = ?auto_10538 ?auto_10546 ) ) ( not ( = ?auto_10538 ?auto_10554 ) ) ( not ( = ?auto_10538 ?auto_10549 ) ) ( not ( = ?auto_10538 ?auto_10552 ) ) ( not ( = ?auto_10540 ?auto_10551 ) ) ( not ( = ?auto_10540 ?auto_10546 ) ) ( not ( = ?auto_10540 ?auto_10554 ) ) ( not ( = ?auto_10540 ?auto_10549 ) ) ( not ( = ?auto_10540 ?auto_10552 ) ) )
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
      ?auto_10587 - HOIST
      ?auto_10583 - PLACE
      ?auto_10582 - PLACE
      ?auto_10586 - HOIST
      ?auto_10585 - SURFACE
      ?auto_10592 - PLACE
      ?auto_10588 - HOIST
      ?auto_10599 - SURFACE
      ?auto_10596 - PLACE
      ?auto_10597 - HOIST
      ?auto_10591 - SURFACE
      ?auto_10593 - SURFACE
      ?auto_10589 - PLACE
      ?auto_10594 - HOIST
      ?auto_10595 - SURFACE
      ?auto_10590 - SURFACE
      ?auto_10598 - SURFACE
      ?auto_10584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10587 ?auto_10583 ) ( IS-CRATE ?auto_10581 ) ( not ( = ?auto_10582 ?auto_10583 ) ) ( HOIST-AT ?auto_10586 ?auto_10582 ) ( SURFACE-AT ?auto_10581 ?auto_10582 ) ( ON ?auto_10581 ?auto_10585 ) ( CLEAR ?auto_10581 ) ( not ( = ?auto_10580 ?auto_10581 ) ) ( not ( = ?auto_10580 ?auto_10585 ) ) ( not ( = ?auto_10581 ?auto_10585 ) ) ( not ( = ?auto_10587 ?auto_10586 ) ) ( IS-CRATE ?auto_10580 ) ( not ( = ?auto_10592 ?auto_10583 ) ) ( HOIST-AT ?auto_10588 ?auto_10592 ) ( SURFACE-AT ?auto_10580 ?auto_10592 ) ( ON ?auto_10580 ?auto_10599 ) ( CLEAR ?auto_10580 ) ( not ( = ?auto_10579 ?auto_10580 ) ) ( not ( = ?auto_10579 ?auto_10599 ) ) ( not ( = ?auto_10580 ?auto_10599 ) ) ( not ( = ?auto_10587 ?auto_10588 ) ) ( IS-CRATE ?auto_10579 ) ( not ( = ?auto_10596 ?auto_10583 ) ) ( HOIST-AT ?auto_10597 ?auto_10596 ) ( AVAILABLE ?auto_10597 ) ( SURFACE-AT ?auto_10579 ?auto_10596 ) ( ON ?auto_10579 ?auto_10591 ) ( CLEAR ?auto_10579 ) ( not ( = ?auto_10578 ?auto_10579 ) ) ( not ( = ?auto_10578 ?auto_10591 ) ) ( not ( = ?auto_10579 ?auto_10591 ) ) ( not ( = ?auto_10587 ?auto_10597 ) ) ( IS-CRATE ?auto_10578 ) ( SURFACE-AT ?auto_10578 ?auto_10582 ) ( ON ?auto_10578 ?auto_10593 ) ( CLEAR ?auto_10578 ) ( not ( = ?auto_10577 ?auto_10578 ) ) ( not ( = ?auto_10577 ?auto_10593 ) ) ( not ( = ?auto_10578 ?auto_10593 ) ) ( IS-CRATE ?auto_10577 ) ( not ( = ?auto_10589 ?auto_10583 ) ) ( HOIST-AT ?auto_10594 ?auto_10589 ) ( AVAILABLE ?auto_10594 ) ( SURFACE-AT ?auto_10577 ?auto_10589 ) ( ON ?auto_10577 ?auto_10595 ) ( CLEAR ?auto_10577 ) ( not ( = ?auto_10576 ?auto_10577 ) ) ( not ( = ?auto_10576 ?auto_10595 ) ) ( not ( = ?auto_10577 ?auto_10595 ) ) ( not ( = ?auto_10587 ?auto_10594 ) ) ( IS-CRATE ?auto_10576 ) ( AVAILABLE ?auto_10588 ) ( SURFACE-AT ?auto_10576 ?auto_10592 ) ( ON ?auto_10576 ?auto_10590 ) ( CLEAR ?auto_10576 ) ( not ( = ?auto_10575 ?auto_10576 ) ) ( not ( = ?auto_10575 ?auto_10590 ) ) ( not ( = ?auto_10576 ?auto_10590 ) ) ( SURFACE-AT ?auto_10574 ?auto_10583 ) ( CLEAR ?auto_10574 ) ( IS-CRATE ?auto_10575 ) ( AVAILABLE ?auto_10587 ) ( AVAILABLE ?auto_10586 ) ( SURFACE-AT ?auto_10575 ?auto_10582 ) ( ON ?auto_10575 ?auto_10598 ) ( CLEAR ?auto_10575 ) ( TRUCK-AT ?auto_10584 ?auto_10583 ) ( not ( = ?auto_10574 ?auto_10575 ) ) ( not ( = ?auto_10574 ?auto_10598 ) ) ( not ( = ?auto_10575 ?auto_10598 ) ) ( not ( = ?auto_10574 ?auto_10576 ) ) ( not ( = ?auto_10574 ?auto_10590 ) ) ( not ( = ?auto_10576 ?auto_10598 ) ) ( not ( = ?auto_10592 ?auto_10582 ) ) ( not ( = ?auto_10588 ?auto_10586 ) ) ( not ( = ?auto_10590 ?auto_10598 ) ) ( not ( = ?auto_10574 ?auto_10577 ) ) ( not ( = ?auto_10574 ?auto_10595 ) ) ( not ( = ?auto_10575 ?auto_10577 ) ) ( not ( = ?auto_10575 ?auto_10595 ) ) ( not ( = ?auto_10577 ?auto_10590 ) ) ( not ( = ?auto_10577 ?auto_10598 ) ) ( not ( = ?auto_10589 ?auto_10592 ) ) ( not ( = ?auto_10589 ?auto_10582 ) ) ( not ( = ?auto_10594 ?auto_10588 ) ) ( not ( = ?auto_10594 ?auto_10586 ) ) ( not ( = ?auto_10595 ?auto_10590 ) ) ( not ( = ?auto_10595 ?auto_10598 ) ) ( not ( = ?auto_10574 ?auto_10578 ) ) ( not ( = ?auto_10574 ?auto_10593 ) ) ( not ( = ?auto_10575 ?auto_10578 ) ) ( not ( = ?auto_10575 ?auto_10593 ) ) ( not ( = ?auto_10576 ?auto_10578 ) ) ( not ( = ?auto_10576 ?auto_10593 ) ) ( not ( = ?auto_10578 ?auto_10595 ) ) ( not ( = ?auto_10578 ?auto_10590 ) ) ( not ( = ?auto_10578 ?auto_10598 ) ) ( not ( = ?auto_10593 ?auto_10595 ) ) ( not ( = ?auto_10593 ?auto_10590 ) ) ( not ( = ?auto_10593 ?auto_10598 ) ) ( not ( = ?auto_10574 ?auto_10579 ) ) ( not ( = ?auto_10574 ?auto_10591 ) ) ( not ( = ?auto_10575 ?auto_10579 ) ) ( not ( = ?auto_10575 ?auto_10591 ) ) ( not ( = ?auto_10576 ?auto_10579 ) ) ( not ( = ?auto_10576 ?auto_10591 ) ) ( not ( = ?auto_10577 ?auto_10579 ) ) ( not ( = ?auto_10577 ?auto_10591 ) ) ( not ( = ?auto_10579 ?auto_10593 ) ) ( not ( = ?auto_10579 ?auto_10595 ) ) ( not ( = ?auto_10579 ?auto_10590 ) ) ( not ( = ?auto_10579 ?auto_10598 ) ) ( not ( = ?auto_10596 ?auto_10582 ) ) ( not ( = ?auto_10596 ?auto_10589 ) ) ( not ( = ?auto_10596 ?auto_10592 ) ) ( not ( = ?auto_10597 ?auto_10586 ) ) ( not ( = ?auto_10597 ?auto_10594 ) ) ( not ( = ?auto_10597 ?auto_10588 ) ) ( not ( = ?auto_10591 ?auto_10593 ) ) ( not ( = ?auto_10591 ?auto_10595 ) ) ( not ( = ?auto_10591 ?auto_10590 ) ) ( not ( = ?auto_10591 ?auto_10598 ) ) ( not ( = ?auto_10574 ?auto_10580 ) ) ( not ( = ?auto_10574 ?auto_10599 ) ) ( not ( = ?auto_10575 ?auto_10580 ) ) ( not ( = ?auto_10575 ?auto_10599 ) ) ( not ( = ?auto_10576 ?auto_10580 ) ) ( not ( = ?auto_10576 ?auto_10599 ) ) ( not ( = ?auto_10577 ?auto_10580 ) ) ( not ( = ?auto_10577 ?auto_10599 ) ) ( not ( = ?auto_10578 ?auto_10580 ) ) ( not ( = ?auto_10578 ?auto_10599 ) ) ( not ( = ?auto_10580 ?auto_10591 ) ) ( not ( = ?auto_10580 ?auto_10593 ) ) ( not ( = ?auto_10580 ?auto_10595 ) ) ( not ( = ?auto_10580 ?auto_10590 ) ) ( not ( = ?auto_10580 ?auto_10598 ) ) ( not ( = ?auto_10599 ?auto_10591 ) ) ( not ( = ?auto_10599 ?auto_10593 ) ) ( not ( = ?auto_10599 ?auto_10595 ) ) ( not ( = ?auto_10599 ?auto_10590 ) ) ( not ( = ?auto_10599 ?auto_10598 ) ) ( not ( = ?auto_10574 ?auto_10581 ) ) ( not ( = ?auto_10574 ?auto_10585 ) ) ( not ( = ?auto_10575 ?auto_10581 ) ) ( not ( = ?auto_10575 ?auto_10585 ) ) ( not ( = ?auto_10576 ?auto_10581 ) ) ( not ( = ?auto_10576 ?auto_10585 ) ) ( not ( = ?auto_10577 ?auto_10581 ) ) ( not ( = ?auto_10577 ?auto_10585 ) ) ( not ( = ?auto_10578 ?auto_10581 ) ) ( not ( = ?auto_10578 ?auto_10585 ) ) ( not ( = ?auto_10579 ?auto_10581 ) ) ( not ( = ?auto_10579 ?auto_10585 ) ) ( not ( = ?auto_10581 ?auto_10599 ) ) ( not ( = ?auto_10581 ?auto_10591 ) ) ( not ( = ?auto_10581 ?auto_10593 ) ) ( not ( = ?auto_10581 ?auto_10595 ) ) ( not ( = ?auto_10581 ?auto_10590 ) ) ( not ( = ?auto_10581 ?auto_10598 ) ) ( not ( = ?auto_10585 ?auto_10599 ) ) ( not ( = ?auto_10585 ?auto_10591 ) ) ( not ( = ?auto_10585 ?auto_10593 ) ) ( not ( = ?auto_10585 ?auto_10595 ) ) ( not ( = ?auto_10585 ?auto_10590 ) ) ( not ( = ?auto_10585 ?auto_10598 ) ) )
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
      ?auto_10637 - PLACE
      ?auto_10636 - HOIST
      ?auto_10647 - SURFACE
      ?auto_10641 - PLACE
      ?auto_10643 - HOIST
      ?auto_10646 - SURFACE
      ?auto_10642 - PLACE
      ?auto_10645 - HOIST
      ?auto_10635 - SURFACE
      ?auto_10640 - SURFACE
      ?auto_10638 - PLACE
      ?auto_10639 - HOIST
      ?auto_10634 - SURFACE
      ?auto_10644 - SURFACE
      ?auto_10648 - SURFACE
      ?auto_10630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10631 ?auto_10633 ) ( IS-CRATE ?auto_10627 ) ( not ( = ?auto_10628 ?auto_10633 ) ) ( HOIST-AT ?auto_10629 ?auto_10628 ) ( AVAILABLE ?auto_10629 ) ( SURFACE-AT ?auto_10627 ?auto_10628 ) ( ON ?auto_10627 ?auto_10632 ) ( CLEAR ?auto_10627 ) ( not ( = ?auto_10626 ?auto_10627 ) ) ( not ( = ?auto_10626 ?auto_10632 ) ) ( not ( = ?auto_10627 ?auto_10632 ) ) ( not ( = ?auto_10631 ?auto_10629 ) ) ( IS-CRATE ?auto_10626 ) ( not ( = ?auto_10637 ?auto_10633 ) ) ( HOIST-AT ?auto_10636 ?auto_10637 ) ( SURFACE-AT ?auto_10626 ?auto_10637 ) ( ON ?auto_10626 ?auto_10647 ) ( CLEAR ?auto_10626 ) ( not ( = ?auto_10625 ?auto_10626 ) ) ( not ( = ?auto_10625 ?auto_10647 ) ) ( not ( = ?auto_10626 ?auto_10647 ) ) ( not ( = ?auto_10631 ?auto_10636 ) ) ( IS-CRATE ?auto_10625 ) ( not ( = ?auto_10641 ?auto_10633 ) ) ( HOIST-AT ?auto_10643 ?auto_10641 ) ( SURFACE-AT ?auto_10625 ?auto_10641 ) ( ON ?auto_10625 ?auto_10646 ) ( CLEAR ?auto_10625 ) ( not ( = ?auto_10624 ?auto_10625 ) ) ( not ( = ?auto_10624 ?auto_10646 ) ) ( not ( = ?auto_10625 ?auto_10646 ) ) ( not ( = ?auto_10631 ?auto_10643 ) ) ( IS-CRATE ?auto_10624 ) ( not ( = ?auto_10642 ?auto_10633 ) ) ( HOIST-AT ?auto_10645 ?auto_10642 ) ( AVAILABLE ?auto_10645 ) ( SURFACE-AT ?auto_10624 ?auto_10642 ) ( ON ?auto_10624 ?auto_10635 ) ( CLEAR ?auto_10624 ) ( not ( = ?auto_10623 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10635 ) ) ( not ( = ?auto_10624 ?auto_10635 ) ) ( not ( = ?auto_10631 ?auto_10645 ) ) ( IS-CRATE ?auto_10623 ) ( SURFACE-AT ?auto_10623 ?auto_10637 ) ( ON ?auto_10623 ?auto_10640 ) ( CLEAR ?auto_10623 ) ( not ( = ?auto_10622 ?auto_10623 ) ) ( not ( = ?auto_10622 ?auto_10640 ) ) ( not ( = ?auto_10623 ?auto_10640 ) ) ( IS-CRATE ?auto_10622 ) ( not ( = ?auto_10638 ?auto_10633 ) ) ( HOIST-AT ?auto_10639 ?auto_10638 ) ( AVAILABLE ?auto_10639 ) ( SURFACE-AT ?auto_10622 ?auto_10638 ) ( ON ?auto_10622 ?auto_10634 ) ( CLEAR ?auto_10622 ) ( not ( = ?auto_10621 ?auto_10622 ) ) ( not ( = ?auto_10621 ?auto_10634 ) ) ( not ( = ?auto_10622 ?auto_10634 ) ) ( not ( = ?auto_10631 ?auto_10639 ) ) ( IS-CRATE ?auto_10621 ) ( AVAILABLE ?auto_10643 ) ( SURFACE-AT ?auto_10621 ?auto_10641 ) ( ON ?auto_10621 ?auto_10644 ) ( CLEAR ?auto_10621 ) ( not ( = ?auto_10620 ?auto_10621 ) ) ( not ( = ?auto_10620 ?auto_10644 ) ) ( not ( = ?auto_10621 ?auto_10644 ) ) ( SURFACE-AT ?auto_10619 ?auto_10633 ) ( CLEAR ?auto_10619 ) ( IS-CRATE ?auto_10620 ) ( AVAILABLE ?auto_10631 ) ( AVAILABLE ?auto_10636 ) ( SURFACE-AT ?auto_10620 ?auto_10637 ) ( ON ?auto_10620 ?auto_10648 ) ( CLEAR ?auto_10620 ) ( TRUCK-AT ?auto_10630 ?auto_10633 ) ( not ( = ?auto_10619 ?auto_10620 ) ) ( not ( = ?auto_10619 ?auto_10648 ) ) ( not ( = ?auto_10620 ?auto_10648 ) ) ( not ( = ?auto_10619 ?auto_10621 ) ) ( not ( = ?auto_10619 ?auto_10644 ) ) ( not ( = ?auto_10621 ?auto_10648 ) ) ( not ( = ?auto_10641 ?auto_10637 ) ) ( not ( = ?auto_10643 ?auto_10636 ) ) ( not ( = ?auto_10644 ?auto_10648 ) ) ( not ( = ?auto_10619 ?auto_10622 ) ) ( not ( = ?auto_10619 ?auto_10634 ) ) ( not ( = ?auto_10620 ?auto_10622 ) ) ( not ( = ?auto_10620 ?auto_10634 ) ) ( not ( = ?auto_10622 ?auto_10644 ) ) ( not ( = ?auto_10622 ?auto_10648 ) ) ( not ( = ?auto_10638 ?auto_10641 ) ) ( not ( = ?auto_10638 ?auto_10637 ) ) ( not ( = ?auto_10639 ?auto_10643 ) ) ( not ( = ?auto_10639 ?auto_10636 ) ) ( not ( = ?auto_10634 ?auto_10644 ) ) ( not ( = ?auto_10634 ?auto_10648 ) ) ( not ( = ?auto_10619 ?auto_10623 ) ) ( not ( = ?auto_10619 ?auto_10640 ) ) ( not ( = ?auto_10620 ?auto_10623 ) ) ( not ( = ?auto_10620 ?auto_10640 ) ) ( not ( = ?auto_10621 ?auto_10623 ) ) ( not ( = ?auto_10621 ?auto_10640 ) ) ( not ( = ?auto_10623 ?auto_10634 ) ) ( not ( = ?auto_10623 ?auto_10644 ) ) ( not ( = ?auto_10623 ?auto_10648 ) ) ( not ( = ?auto_10640 ?auto_10634 ) ) ( not ( = ?auto_10640 ?auto_10644 ) ) ( not ( = ?auto_10640 ?auto_10648 ) ) ( not ( = ?auto_10619 ?auto_10624 ) ) ( not ( = ?auto_10619 ?auto_10635 ) ) ( not ( = ?auto_10620 ?auto_10624 ) ) ( not ( = ?auto_10620 ?auto_10635 ) ) ( not ( = ?auto_10621 ?auto_10624 ) ) ( not ( = ?auto_10621 ?auto_10635 ) ) ( not ( = ?auto_10622 ?auto_10624 ) ) ( not ( = ?auto_10622 ?auto_10635 ) ) ( not ( = ?auto_10624 ?auto_10640 ) ) ( not ( = ?auto_10624 ?auto_10634 ) ) ( not ( = ?auto_10624 ?auto_10644 ) ) ( not ( = ?auto_10624 ?auto_10648 ) ) ( not ( = ?auto_10642 ?auto_10637 ) ) ( not ( = ?auto_10642 ?auto_10638 ) ) ( not ( = ?auto_10642 ?auto_10641 ) ) ( not ( = ?auto_10645 ?auto_10636 ) ) ( not ( = ?auto_10645 ?auto_10639 ) ) ( not ( = ?auto_10645 ?auto_10643 ) ) ( not ( = ?auto_10635 ?auto_10640 ) ) ( not ( = ?auto_10635 ?auto_10634 ) ) ( not ( = ?auto_10635 ?auto_10644 ) ) ( not ( = ?auto_10635 ?auto_10648 ) ) ( not ( = ?auto_10619 ?auto_10625 ) ) ( not ( = ?auto_10619 ?auto_10646 ) ) ( not ( = ?auto_10620 ?auto_10625 ) ) ( not ( = ?auto_10620 ?auto_10646 ) ) ( not ( = ?auto_10621 ?auto_10625 ) ) ( not ( = ?auto_10621 ?auto_10646 ) ) ( not ( = ?auto_10622 ?auto_10625 ) ) ( not ( = ?auto_10622 ?auto_10646 ) ) ( not ( = ?auto_10623 ?auto_10625 ) ) ( not ( = ?auto_10623 ?auto_10646 ) ) ( not ( = ?auto_10625 ?auto_10635 ) ) ( not ( = ?auto_10625 ?auto_10640 ) ) ( not ( = ?auto_10625 ?auto_10634 ) ) ( not ( = ?auto_10625 ?auto_10644 ) ) ( not ( = ?auto_10625 ?auto_10648 ) ) ( not ( = ?auto_10646 ?auto_10635 ) ) ( not ( = ?auto_10646 ?auto_10640 ) ) ( not ( = ?auto_10646 ?auto_10634 ) ) ( not ( = ?auto_10646 ?auto_10644 ) ) ( not ( = ?auto_10646 ?auto_10648 ) ) ( not ( = ?auto_10619 ?auto_10626 ) ) ( not ( = ?auto_10619 ?auto_10647 ) ) ( not ( = ?auto_10620 ?auto_10626 ) ) ( not ( = ?auto_10620 ?auto_10647 ) ) ( not ( = ?auto_10621 ?auto_10626 ) ) ( not ( = ?auto_10621 ?auto_10647 ) ) ( not ( = ?auto_10622 ?auto_10626 ) ) ( not ( = ?auto_10622 ?auto_10647 ) ) ( not ( = ?auto_10623 ?auto_10626 ) ) ( not ( = ?auto_10623 ?auto_10647 ) ) ( not ( = ?auto_10624 ?auto_10626 ) ) ( not ( = ?auto_10624 ?auto_10647 ) ) ( not ( = ?auto_10626 ?auto_10646 ) ) ( not ( = ?auto_10626 ?auto_10635 ) ) ( not ( = ?auto_10626 ?auto_10640 ) ) ( not ( = ?auto_10626 ?auto_10634 ) ) ( not ( = ?auto_10626 ?auto_10644 ) ) ( not ( = ?auto_10626 ?auto_10648 ) ) ( not ( = ?auto_10647 ?auto_10646 ) ) ( not ( = ?auto_10647 ?auto_10635 ) ) ( not ( = ?auto_10647 ?auto_10640 ) ) ( not ( = ?auto_10647 ?auto_10634 ) ) ( not ( = ?auto_10647 ?auto_10644 ) ) ( not ( = ?auto_10647 ?auto_10648 ) ) ( not ( = ?auto_10619 ?auto_10627 ) ) ( not ( = ?auto_10619 ?auto_10632 ) ) ( not ( = ?auto_10620 ?auto_10627 ) ) ( not ( = ?auto_10620 ?auto_10632 ) ) ( not ( = ?auto_10621 ?auto_10627 ) ) ( not ( = ?auto_10621 ?auto_10632 ) ) ( not ( = ?auto_10622 ?auto_10627 ) ) ( not ( = ?auto_10622 ?auto_10632 ) ) ( not ( = ?auto_10623 ?auto_10627 ) ) ( not ( = ?auto_10623 ?auto_10632 ) ) ( not ( = ?auto_10624 ?auto_10627 ) ) ( not ( = ?auto_10624 ?auto_10632 ) ) ( not ( = ?auto_10625 ?auto_10627 ) ) ( not ( = ?auto_10625 ?auto_10632 ) ) ( not ( = ?auto_10627 ?auto_10647 ) ) ( not ( = ?auto_10627 ?auto_10646 ) ) ( not ( = ?auto_10627 ?auto_10635 ) ) ( not ( = ?auto_10627 ?auto_10640 ) ) ( not ( = ?auto_10627 ?auto_10634 ) ) ( not ( = ?auto_10627 ?auto_10644 ) ) ( not ( = ?auto_10627 ?auto_10648 ) ) ( not ( = ?auto_10628 ?auto_10637 ) ) ( not ( = ?auto_10628 ?auto_10641 ) ) ( not ( = ?auto_10628 ?auto_10642 ) ) ( not ( = ?auto_10628 ?auto_10638 ) ) ( not ( = ?auto_10629 ?auto_10636 ) ) ( not ( = ?auto_10629 ?auto_10643 ) ) ( not ( = ?auto_10629 ?auto_10645 ) ) ( not ( = ?auto_10629 ?auto_10639 ) ) ( not ( = ?auto_10632 ?auto_10647 ) ) ( not ( = ?auto_10632 ?auto_10646 ) ) ( not ( = ?auto_10632 ?auto_10635 ) ) ( not ( = ?auto_10632 ?auto_10640 ) ) ( not ( = ?auto_10632 ?auto_10634 ) ) ( not ( = ?auto_10632 ?auto_10644 ) ) ( not ( = ?auto_10632 ?auto_10648 ) ) )
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
      ?auto_10683 - HOIST
      ?auto_10682 - PLACE
      ?auto_10680 - PLACE
      ?auto_10684 - HOIST
      ?auto_10681 - SURFACE
      ?auto_10699 - PLACE
      ?auto_10690 - HOIST
      ?auto_10700 - SURFACE
      ?auto_10698 - PLACE
      ?auto_10697 - HOIST
      ?auto_10693 - SURFACE
      ?auto_10696 - PLACE
      ?auto_10688 - HOIST
      ?auto_10695 - SURFACE
      ?auto_10685 - SURFACE
      ?auto_10691 - SURFACE
      ?auto_10687 - PLACE
      ?auto_10692 - HOIST
      ?auto_10686 - SURFACE
      ?auto_10694 - SURFACE
      ?auto_10689 - SURFACE
      ?auto_10679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10683 ?auto_10682 ) ( IS-CRATE ?auto_10678 ) ( not ( = ?auto_10680 ?auto_10682 ) ) ( HOIST-AT ?auto_10684 ?auto_10680 ) ( SURFACE-AT ?auto_10678 ?auto_10680 ) ( ON ?auto_10678 ?auto_10681 ) ( CLEAR ?auto_10678 ) ( not ( = ?auto_10677 ?auto_10678 ) ) ( not ( = ?auto_10677 ?auto_10681 ) ) ( not ( = ?auto_10678 ?auto_10681 ) ) ( not ( = ?auto_10683 ?auto_10684 ) ) ( IS-CRATE ?auto_10677 ) ( not ( = ?auto_10699 ?auto_10682 ) ) ( HOIST-AT ?auto_10690 ?auto_10699 ) ( AVAILABLE ?auto_10690 ) ( SURFACE-AT ?auto_10677 ?auto_10699 ) ( ON ?auto_10677 ?auto_10700 ) ( CLEAR ?auto_10677 ) ( not ( = ?auto_10676 ?auto_10677 ) ) ( not ( = ?auto_10676 ?auto_10700 ) ) ( not ( = ?auto_10677 ?auto_10700 ) ) ( not ( = ?auto_10683 ?auto_10690 ) ) ( IS-CRATE ?auto_10676 ) ( not ( = ?auto_10698 ?auto_10682 ) ) ( HOIST-AT ?auto_10697 ?auto_10698 ) ( SURFACE-AT ?auto_10676 ?auto_10698 ) ( ON ?auto_10676 ?auto_10693 ) ( CLEAR ?auto_10676 ) ( not ( = ?auto_10675 ?auto_10676 ) ) ( not ( = ?auto_10675 ?auto_10693 ) ) ( not ( = ?auto_10676 ?auto_10693 ) ) ( not ( = ?auto_10683 ?auto_10697 ) ) ( IS-CRATE ?auto_10675 ) ( not ( = ?auto_10696 ?auto_10682 ) ) ( HOIST-AT ?auto_10688 ?auto_10696 ) ( SURFACE-AT ?auto_10675 ?auto_10696 ) ( ON ?auto_10675 ?auto_10695 ) ( CLEAR ?auto_10675 ) ( not ( = ?auto_10674 ?auto_10675 ) ) ( not ( = ?auto_10674 ?auto_10695 ) ) ( not ( = ?auto_10675 ?auto_10695 ) ) ( not ( = ?auto_10683 ?auto_10688 ) ) ( IS-CRATE ?auto_10674 ) ( AVAILABLE ?auto_10684 ) ( SURFACE-AT ?auto_10674 ?auto_10680 ) ( ON ?auto_10674 ?auto_10685 ) ( CLEAR ?auto_10674 ) ( not ( = ?auto_10673 ?auto_10674 ) ) ( not ( = ?auto_10673 ?auto_10685 ) ) ( not ( = ?auto_10674 ?auto_10685 ) ) ( IS-CRATE ?auto_10673 ) ( SURFACE-AT ?auto_10673 ?auto_10698 ) ( ON ?auto_10673 ?auto_10691 ) ( CLEAR ?auto_10673 ) ( not ( = ?auto_10672 ?auto_10673 ) ) ( not ( = ?auto_10672 ?auto_10691 ) ) ( not ( = ?auto_10673 ?auto_10691 ) ) ( IS-CRATE ?auto_10672 ) ( not ( = ?auto_10687 ?auto_10682 ) ) ( HOIST-AT ?auto_10692 ?auto_10687 ) ( AVAILABLE ?auto_10692 ) ( SURFACE-AT ?auto_10672 ?auto_10687 ) ( ON ?auto_10672 ?auto_10686 ) ( CLEAR ?auto_10672 ) ( not ( = ?auto_10671 ?auto_10672 ) ) ( not ( = ?auto_10671 ?auto_10686 ) ) ( not ( = ?auto_10672 ?auto_10686 ) ) ( not ( = ?auto_10683 ?auto_10692 ) ) ( IS-CRATE ?auto_10671 ) ( AVAILABLE ?auto_10688 ) ( SURFACE-AT ?auto_10671 ?auto_10696 ) ( ON ?auto_10671 ?auto_10694 ) ( CLEAR ?auto_10671 ) ( not ( = ?auto_10670 ?auto_10671 ) ) ( not ( = ?auto_10670 ?auto_10694 ) ) ( not ( = ?auto_10671 ?auto_10694 ) ) ( SURFACE-AT ?auto_10669 ?auto_10682 ) ( CLEAR ?auto_10669 ) ( IS-CRATE ?auto_10670 ) ( AVAILABLE ?auto_10683 ) ( AVAILABLE ?auto_10697 ) ( SURFACE-AT ?auto_10670 ?auto_10698 ) ( ON ?auto_10670 ?auto_10689 ) ( CLEAR ?auto_10670 ) ( TRUCK-AT ?auto_10679 ?auto_10682 ) ( not ( = ?auto_10669 ?auto_10670 ) ) ( not ( = ?auto_10669 ?auto_10689 ) ) ( not ( = ?auto_10670 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10671 ) ) ( not ( = ?auto_10669 ?auto_10694 ) ) ( not ( = ?auto_10671 ?auto_10689 ) ) ( not ( = ?auto_10696 ?auto_10698 ) ) ( not ( = ?auto_10688 ?auto_10697 ) ) ( not ( = ?auto_10694 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10672 ) ) ( not ( = ?auto_10669 ?auto_10686 ) ) ( not ( = ?auto_10670 ?auto_10672 ) ) ( not ( = ?auto_10670 ?auto_10686 ) ) ( not ( = ?auto_10672 ?auto_10694 ) ) ( not ( = ?auto_10672 ?auto_10689 ) ) ( not ( = ?auto_10687 ?auto_10696 ) ) ( not ( = ?auto_10687 ?auto_10698 ) ) ( not ( = ?auto_10692 ?auto_10688 ) ) ( not ( = ?auto_10692 ?auto_10697 ) ) ( not ( = ?auto_10686 ?auto_10694 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10673 ) ) ( not ( = ?auto_10669 ?auto_10691 ) ) ( not ( = ?auto_10670 ?auto_10673 ) ) ( not ( = ?auto_10670 ?auto_10691 ) ) ( not ( = ?auto_10671 ?auto_10673 ) ) ( not ( = ?auto_10671 ?auto_10691 ) ) ( not ( = ?auto_10673 ?auto_10686 ) ) ( not ( = ?auto_10673 ?auto_10694 ) ) ( not ( = ?auto_10673 ?auto_10689 ) ) ( not ( = ?auto_10691 ?auto_10686 ) ) ( not ( = ?auto_10691 ?auto_10694 ) ) ( not ( = ?auto_10691 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10674 ) ) ( not ( = ?auto_10669 ?auto_10685 ) ) ( not ( = ?auto_10670 ?auto_10674 ) ) ( not ( = ?auto_10670 ?auto_10685 ) ) ( not ( = ?auto_10671 ?auto_10674 ) ) ( not ( = ?auto_10671 ?auto_10685 ) ) ( not ( = ?auto_10672 ?auto_10674 ) ) ( not ( = ?auto_10672 ?auto_10685 ) ) ( not ( = ?auto_10674 ?auto_10691 ) ) ( not ( = ?auto_10674 ?auto_10686 ) ) ( not ( = ?auto_10674 ?auto_10694 ) ) ( not ( = ?auto_10674 ?auto_10689 ) ) ( not ( = ?auto_10680 ?auto_10698 ) ) ( not ( = ?auto_10680 ?auto_10687 ) ) ( not ( = ?auto_10680 ?auto_10696 ) ) ( not ( = ?auto_10684 ?auto_10697 ) ) ( not ( = ?auto_10684 ?auto_10692 ) ) ( not ( = ?auto_10684 ?auto_10688 ) ) ( not ( = ?auto_10685 ?auto_10691 ) ) ( not ( = ?auto_10685 ?auto_10686 ) ) ( not ( = ?auto_10685 ?auto_10694 ) ) ( not ( = ?auto_10685 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10675 ) ) ( not ( = ?auto_10669 ?auto_10695 ) ) ( not ( = ?auto_10670 ?auto_10675 ) ) ( not ( = ?auto_10670 ?auto_10695 ) ) ( not ( = ?auto_10671 ?auto_10675 ) ) ( not ( = ?auto_10671 ?auto_10695 ) ) ( not ( = ?auto_10672 ?auto_10675 ) ) ( not ( = ?auto_10672 ?auto_10695 ) ) ( not ( = ?auto_10673 ?auto_10675 ) ) ( not ( = ?auto_10673 ?auto_10695 ) ) ( not ( = ?auto_10675 ?auto_10685 ) ) ( not ( = ?auto_10675 ?auto_10691 ) ) ( not ( = ?auto_10675 ?auto_10686 ) ) ( not ( = ?auto_10675 ?auto_10694 ) ) ( not ( = ?auto_10675 ?auto_10689 ) ) ( not ( = ?auto_10695 ?auto_10685 ) ) ( not ( = ?auto_10695 ?auto_10691 ) ) ( not ( = ?auto_10695 ?auto_10686 ) ) ( not ( = ?auto_10695 ?auto_10694 ) ) ( not ( = ?auto_10695 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10676 ) ) ( not ( = ?auto_10669 ?auto_10693 ) ) ( not ( = ?auto_10670 ?auto_10676 ) ) ( not ( = ?auto_10670 ?auto_10693 ) ) ( not ( = ?auto_10671 ?auto_10676 ) ) ( not ( = ?auto_10671 ?auto_10693 ) ) ( not ( = ?auto_10672 ?auto_10676 ) ) ( not ( = ?auto_10672 ?auto_10693 ) ) ( not ( = ?auto_10673 ?auto_10676 ) ) ( not ( = ?auto_10673 ?auto_10693 ) ) ( not ( = ?auto_10674 ?auto_10676 ) ) ( not ( = ?auto_10674 ?auto_10693 ) ) ( not ( = ?auto_10676 ?auto_10695 ) ) ( not ( = ?auto_10676 ?auto_10685 ) ) ( not ( = ?auto_10676 ?auto_10691 ) ) ( not ( = ?auto_10676 ?auto_10686 ) ) ( not ( = ?auto_10676 ?auto_10694 ) ) ( not ( = ?auto_10676 ?auto_10689 ) ) ( not ( = ?auto_10693 ?auto_10695 ) ) ( not ( = ?auto_10693 ?auto_10685 ) ) ( not ( = ?auto_10693 ?auto_10691 ) ) ( not ( = ?auto_10693 ?auto_10686 ) ) ( not ( = ?auto_10693 ?auto_10694 ) ) ( not ( = ?auto_10693 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10677 ) ) ( not ( = ?auto_10669 ?auto_10700 ) ) ( not ( = ?auto_10670 ?auto_10677 ) ) ( not ( = ?auto_10670 ?auto_10700 ) ) ( not ( = ?auto_10671 ?auto_10677 ) ) ( not ( = ?auto_10671 ?auto_10700 ) ) ( not ( = ?auto_10672 ?auto_10677 ) ) ( not ( = ?auto_10672 ?auto_10700 ) ) ( not ( = ?auto_10673 ?auto_10677 ) ) ( not ( = ?auto_10673 ?auto_10700 ) ) ( not ( = ?auto_10674 ?auto_10677 ) ) ( not ( = ?auto_10674 ?auto_10700 ) ) ( not ( = ?auto_10675 ?auto_10677 ) ) ( not ( = ?auto_10675 ?auto_10700 ) ) ( not ( = ?auto_10677 ?auto_10693 ) ) ( not ( = ?auto_10677 ?auto_10695 ) ) ( not ( = ?auto_10677 ?auto_10685 ) ) ( not ( = ?auto_10677 ?auto_10691 ) ) ( not ( = ?auto_10677 ?auto_10686 ) ) ( not ( = ?auto_10677 ?auto_10694 ) ) ( not ( = ?auto_10677 ?auto_10689 ) ) ( not ( = ?auto_10699 ?auto_10698 ) ) ( not ( = ?auto_10699 ?auto_10696 ) ) ( not ( = ?auto_10699 ?auto_10680 ) ) ( not ( = ?auto_10699 ?auto_10687 ) ) ( not ( = ?auto_10690 ?auto_10697 ) ) ( not ( = ?auto_10690 ?auto_10688 ) ) ( not ( = ?auto_10690 ?auto_10684 ) ) ( not ( = ?auto_10690 ?auto_10692 ) ) ( not ( = ?auto_10700 ?auto_10693 ) ) ( not ( = ?auto_10700 ?auto_10695 ) ) ( not ( = ?auto_10700 ?auto_10685 ) ) ( not ( = ?auto_10700 ?auto_10691 ) ) ( not ( = ?auto_10700 ?auto_10686 ) ) ( not ( = ?auto_10700 ?auto_10694 ) ) ( not ( = ?auto_10700 ?auto_10689 ) ) ( not ( = ?auto_10669 ?auto_10678 ) ) ( not ( = ?auto_10669 ?auto_10681 ) ) ( not ( = ?auto_10670 ?auto_10678 ) ) ( not ( = ?auto_10670 ?auto_10681 ) ) ( not ( = ?auto_10671 ?auto_10678 ) ) ( not ( = ?auto_10671 ?auto_10681 ) ) ( not ( = ?auto_10672 ?auto_10678 ) ) ( not ( = ?auto_10672 ?auto_10681 ) ) ( not ( = ?auto_10673 ?auto_10678 ) ) ( not ( = ?auto_10673 ?auto_10681 ) ) ( not ( = ?auto_10674 ?auto_10678 ) ) ( not ( = ?auto_10674 ?auto_10681 ) ) ( not ( = ?auto_10675 ?auto_10678 ) ) ( not ( = ?auto_10675 ?auto_10681 ) ) ( not ( = ?auto_10676 ?auto_10678 ) ) ( not ( = ?auto_10676 ?auto_10681 ) ) ( not ( = ?auto_10678 ?auto_10700 ) ) ( not ( = ?auto_10678 ?auto_10693 ) ) ( not ( = ?auto_10678 ?auto_10695 ) ) ( not ( = ?auto_10678 ?auto_10685 ) ) ( not ( = ?auto_10678 ?auto_10691 ) ) ( not ( = ?auto_10678 ?auto_10686 ) ) ( not ( = ?auto_10678 ?auto_10694 ) ) ( not ( = ?auto_10678 ?auto_10689 ) ) ( not ( = ?auto_10681 ?auto_10700 ) ) ( not ( = ?auto_10681 ?auto_10693 ) ) ( not ( = ?auto_10681 ?auto_10695 ) ) ( not ( = ?auto_10681 ?auto_10685 ) ) ( not ( = ?auto_10681 ?auto_10691 ) ) ( not ( = ?auto_10681 ?auto_10686 ) ) ( not ( = ?auto_10681 ?auto_10694 ) ) ( not ( = ?auto_10681 ?auto_10689 ) ) )
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
      ?auto_10738 - HOIST
      ?auto_10736 - PLACE
      ?auto_10733 - PLACE
      ?auto_10735 - HOIST
      ?auto_10734 - SURFACE
      ?auto_10743 - SURFACE
      ?auto_10751 - PLACE
      ?auto_10741 - HOIST
      ?auto_10755 - SURFACE
      ?auto_10744 - PLACE
      ?auto_10753 - HOIST
      ?auto_10746 - SURFACE
      ?auto_10749 - PLACE
      ?auto_10742 - HOIST
      ?auto_10754 - SURFACE
      ?auto_10739 - SURFACE
      ?auto_10747 - SURFACE
      ?auto_10748 - PLACE
      ?auto_10750 - HOIST
      ?auto_10740 - SURFACE
      ?auto_10745 - SURFACE
      ?auto_10752 - SURFACE
      ?auto_10737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10738 ?auto_10736 ) ( IS-CRATE ?auto_10732 ) ( not ( = ?auto_10733 ?auto_10736 ) ) ( HOIST-AT ?auto_10735 ?auto_10733 ) ( SURFACE-AT ?auto_10732 ?auto_10733 ) ( ON ?auto_10732 ?auto_10734 ) ( CLEAR ?auto_10732 ) ( not ( = ?auto_10731 ?auto_10732 ) ) ( not ( = ?auto_10731 ?auto_10734 ) ) ( not ( = ?auto_10732 ?auto_10734 ) ) ( not ( = ?auto_10738 ?auto_10735 ) ) ( IS-CRATE ?auto_10731 ) ( SURFACE-AT ?auto_10731 ?auto_10733 ) ( ON ?auto_10731 ?auto_10743 ) ( CLEAR ?auto_10731 ) ( not ( = ?auto_10730 ?auto_10731 ) ) ( not ( = ?auto_10730 ?auto_10743 ) ) ( not ( = ?auto_10731 ?auto_10743 ) ) ( IS-CRATE ?auto_10730 ) ( not ( = ?auto_10751 ?auto_10736 ) ) ( HOIST-AT ?auto_10741 ?auto_10751 ) ( AVAILABLE ?auto_10741 ) ( SURFACE-AT ?auto_10730 ?auto_10751 ) ( ON ?auto_10730 ?auto_10755 ) ( CLEAR ?auto_10730 ) ( not ( = ?auto_10729 ?auto_10730 ) ) ( not ( = ?auto_10729 ?auto_10755 ) ) ( not ( = ?auto_10730 ?auto_10755 ) ) ( not ( = ?auto_10738 ?auto_10741 ) ) ( IS-CRATE ?auto_10729 ) ( not ( = ?auto_10744 ?auto_10736 ) ) ( HOIST-AT ?auto_10753 ?auto_10744 ) ( SURFACE-AT ?auto_10729 ?auto_10744 ) ( ON ?auto_10729 ?auto_10746 ) ( CLEAR ?auto_10729 ) ( not ( = ?auto_10728 ?auto_10729 ) ) ( not ( = ?auto_10728 ?auto_10746 ) ) ( not ( = ?auto_10729 ?auto_10746 ) ) ( not ( = ?auto_10738 ?auto_10753 ) ) ( IS-CRATE ?auto_10728 ) ( not ( = ?auto_10749 ?auto_10736 ) ) ( HOIST-AT ?auto_10742 ?auto_10749 ) ( SURFACE-AT ?auto_10728 ?auto_10749 ) ( ON ?auto_10728 ?auto_10754 ) ( CLEAR ?auto_10728 ) ( not ( = ?auto_10727 ?auto_10728 ) ) ( not ( = ?auto_10727 ?auto_10754 ) ) ( not ( = ?auto_10728 ?auto_10754 ) ) ( not ( = ?auto_10738 ?auto_10742 ) ) ( IS-CRATE ?auto_10727 ) ( AVAILABLE ?auto_10735 ) ( SURFACE-AT ?auto_10727 ?auto_10733 ) ( ON ?auto_10727 ?auto_10739 ) ( CLEAR ?auto_10727 ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( not ( = ?auto_10726 ?auto_10739 ) ) ( not ( = ?auto_10727 ?auto_10739 ) ) ( IS-CRATE ?auto_10726 ) ( SURFACE-AT ?auto_10726 ?auto_10744 ) ( ON ?auto_10726 ?auto_10747 ) ( CLEAR ?auto_10726 ) ( not ( = ?auto_10725 ?auto_10726 ) ) ( not ( = ?auto_10725 ?auto_10747 ) ) ( not ( = ?auto_10726 ?auto_10747 ) ) ( IS-CRATE ?auto_10725 ) ( not ( = ?auto_10748 ?auto_10736 ) ) ( HOIST-AT ?auto_10750 ?auto_10748 ) ( AVAILABLE ?auto_10750 ) ( SURFACE-AT ?auto_10725 ?auto_10748 ) ( ON ?auto_10725 ?auto_10740 ) ( CLEAR ?auto_10725 ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10740 ) ) ( not ( = ?auto_10725 ?auto_10740 ) ) ( not ( = ?auto_10738 ?auto_10750 ) ) ( IS-CRATE ?auto_10724 ) ( AVAILABLE ?auto_10742 ) ( SURFACE-AT ?auto_10724 ?auto_10749 ) ( ON ?auto_10724 ?auto_10745 ) ( CLEAR ?auto_10724 ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10745 ) ) ( not ( = ?auto_10724 ?auto_10745 ) ) ( SURFACE-AT ?auto_10722 ?auto_10736 ) ( CLEAR ?auto_10722 ) ( IS-CRATE ?auto_10723 ) ( AVAILABLE ?auto_10738 ) ( AVAILABLE ?auto_10753 ) ( SURFACE-AT ?auto_10723 ?auto_10744 ) ( ON ?auto_10723 ?auto_10752 ) ( CLEAR ?auto_10723 ) ( TRUCK-AT ?auto_10737 ?auto_10736 ) ( not ( = ?auto_10722 ?auto_10723 ) ) ( not ( = ?auto_10722 ?auto_10752 ) ) ( not ( = ?auto_10723 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10724 ) ) ( not ( = ?auto_10722 ?auto_10745 ) ) ( not ( = ?auto_10724 ?auto_10752 ) ) ( not ( = ?auto_10749 ?auto_10744 ) ) ( not ( = ?auto_10742 ?auto_10753 ) ) ( not ( = ?auto_10745 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10725 ) ) ( not ( = ?auto_10722 ?auto_10740 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( not ( = ?auto_10723 ?auto_10740 ) ) ( not ( = ?auto_10725 ?auto_10745 ) ) ( not ( = ?auto_10725 ?auto_10752 ) ) ( not ( = ?auto_10748 ?auto_10749 ) ) ( not ( = ?auto_10748 ?auto_10744 ) ) ( not ( = ?auto_10750 ?auto_10742 ) ) ( not ( = ?auto_10750 ?auto_10753 ) ) ( not ( = ?auto_10740 ?auto_10745 ) ) ( not ( = ?auto_10740 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10726 ) ) ( not ( = ?auto_10722 ?auto_10747 ) ) ( not ( = ?auto_10723 ?auto_10726 ) ) ( not ( = ?auto_10723 ?auto_10747 ) ) ( not ( = ?auto_10724 ?auto_10726 ) ) ( not ( = ?auto_10724 ?auto_10747 ) ) ( not ( = ?auto_10726 ?auto_10740 ) ) ( not ( = ?auto_10726 ?auto_10745 ) ) ( not ( = ?auto_10726 ?auto_10752 ) ) ( not ( = ?auto_10747 ?auto_10740 ) ) ( not ( = ?auto_10747 ?auto_10745 ) ) ( not ( = ?auto_10747 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10727 ) ) ( not ( = ?auto_10722 ?auto_10739 ) ) ( not ( = ?auto_10723 ?auto_10727 ) ) ( not ( = ?auto_10723 ?auto_10739 ) ) ( not ( = ?auto_10724 ?auto_10727 ) ) ( not ( = ?auto_10724 ?auto_10739 ) ) ( not ( = ?auto_10725 ?auto_10727 ) ) ( not ( = ?auto_10725 ?auto_10739 ) ) ( not ( = ?auto_10727 ?auto_10747 ) ) ( not ( = ?auto_10727 ?auto_10740 ) ) ( not ( = ?auto_10727 ?auto_10745 ) ) ( not ( = ?auto_10727 ?auto_10752 ) ) ( not ( = ?auto_10733 ?auto_10744 ) ) ( not ( = ?auto_10733 ?auto_10748 ) ) ( not ( = ?auto_10733 ?auto_10749 ) ) ( not ( = ?auto_10735 ?auto_10753 ) ) ( not ( = ?auto_10735 ?auto_10750 ) ) ( not ( = ?auto_10735 ?auto_10742 ) ) ( not ( = ?auto_10739 ?auto_10747 ) ) ( not ( = ?auto_10739 ?auto_10740 ) ) ( not ( = ?auto_10739 ?auto_10745 ) ) ( not ( = ?auto_10739 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10728 ) ) ( not ( = ?auto_10722 ?auto_10754 ) ) ( not ( = ?auto_10723 ?auto_10728 ) ) ( not ( = ?auto_10723 ?auto_10754 ) ) ( not ( = ?auto_10724 ?auto_10728 ) ) ( not ( = ?auto_10724 ?auto_10754 ) ) ( not ( = ?auto_10725 ?auto_10728 ) ) ( not ( = ?auto_10725 ?auto_10754 ) ) ( not ( = ?auto_10726 ?auto_10728 ) ) ( not ( = ?auto_10726 ?auto_10754 ) ) ( not ( = ?auto_10728 ?auto_10739 ) ) ( not ( = ?auto_10728 ?auto_10747 ) ) ( not ( = ?auto_10728 ?auto_10740 ) ) ( not ( = ?auto_10728 ?auto_10745 ) ) ( not ( = ?auto_10728 ?auto_10752 ) ) ( not ( = ?auto_10754 ?auto_10739 ) ) ( not ( = ?auto_10754 ?auto_10747 ) ) ( not ( = ?auto_10754 ?auto_10740 ) ) ( not ( = ?auto_10754 ?auto_10745 ) ) ( not ( = ?auto_10754 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10729 ) ) ( not ( = ?auto_10722 ?auto_10746 ) ) ( not ( = ?auto_10723 ?auto_10729 ) ) ( not ( = ?auto_10723 ?auto_10746 ) ) ( not ( = ?auto_10724 ?auto_10729 ) ) ( not ( = ?auto_10724 ?auto_10746 ) ) ( not ( = ?auto_10725 ?auto_10729 ) ) ( not ( = ?auto_10725 ?auto_10746 ) ) ( not ( = ?auto_10726 ?auto_10729 ) ) ( not ( = ?auto_10726 ?auto_10746 ) ) ( not ( = ?auto_10727 ?auto_10729 ) ) ( not ( = ?auto_10727 ?auto_10746 ) ) ( not ( = ?auto_10729 ?auto_10754 ) ) ( not ( = ?auto_10729 ?auto_10739 ) ) ( not ( = ?auto_10729 ?auto_10747 ) ) ( not ( = ?auto_10729 ?auto_10740 ) ) ( not ( = ?auto_10729 ?auto_10745 ) ) ( not ( = ?auto_10729 ?auto_10752 ) ) ( not ( = ?auto_10746 ?auto_10754 ) ) ( not ( = ?auto_10746 ?auto_10739 ) ) ( not ( = ?auto_10746 ?auto_10747 ) ) ( not ( = ?auto_10746 ?auto_10740 ) ) ( not ( = ?auto_10746 ?auto_10745 ) ) ( not ( = ?auto_10746 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10730 ) ) ( not ( = ?auto_10722 ?auto_10755 ) ) ( not ( = ?auto_10723 ?auto_10730 ) ) ( not ( = ?auto_10723 ?auto_10755 ) ) ( not ( = ?auto_10724 ?auto_10730 ) ) ( not ( = ?auto_10724 ?auto_10755 ) ) ( not ( = ?auto_10725 ?auto_10730 ) ) ( not ( = ?auto_10725 ?auto_10755 ) ) ( not ( = ?auto_10726 ?auto_10730 ) ) ( not ( = ?auto_10726 ?auto_10755 ) ) ( not ( = ?auto_10727 ?auto_10730 ) ) ( not ( = ?auto_10727 ?auto_10755 ) ) ( not ( = ?auto_10728 ?auto_10730 ) ) ( not ( = ?auto_10728 ?auto_10755 ) ) ( not ( = ?auto_10730 ?auto_10746 ) ) ( not ( = ?auto_10730 ?auto_10754 ) ) ( not ( = ?auto_10730 ?auto_10739 ) ) ( not ( = ?auto_10730 ?auto_10747 ) ) ( not ( = ?auto_10730 ?auto_10740 ) ) ( not ( = ?auto_10730 ?auto_10745 ) ) ( not ( = ?auto_10730 ?auto_10752 ) ) ( not ( = ?auto_10751 ?auto_10744 ) ) ( not ( = ?auto_10751 ?auto_10749 ) ) ( not ( = ?auto_10751 ?auto_10733 ) ) ( not ( = ?auto_10751 ?auto_10748 ) ) ( not ( = ?auto_10741 ?auto_10753 ) ) ( not ( = ?auto_10741 ?auto_10742 ) ) ( not ( = ?auto_10741 ?auto_10735 ) ) ( not ( = ?auto_10741 ?auto_10750 ) ) ( not ( = ?auto_10755 ?auto_10746 ) ) ( not ( = ?auto_10755 ?auto_10754 ) ) ( not ( = ?auto_10755 ?auto_10739 ) ) ( not ( = ?auto_10755 ?auto_10747 ) ) ( not ( = ?auto_10755 ?auto_10740 ) ) ( not ( = ?auto_10755 ?auto_10745 ) ) ( not ( = ?auto_10755 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10731 ) ) ( not ( = ?auto_10722 ?auto_10743 ) ) ( not ( = ?auto_10723 ?auto_10731 ) ) ( not ( = ?auto_10723 ?auto_10743 ) ) ( not ( = ?auto_10724 ?auto_10731 ) ) ( not ( = ?auto_10724 ?auto_10743 ) ) ( not ( = ?auto_10725 ?auto_10731 ) ) ( not ( = ?auto_10725 ?auto_10743 ) ) ( not ( = ?auto_10726 ?auto_10731 ) ) ( not ( = ?auto_10726 ?auto_10743 ) ) ( not ( = ?auto_10727 ?auto_10731 ) ) ( not ( = ?auto_10727 ?auto_10743 ) ) ( not ( = ?auto_10728 ?auto_10731 ) ) ( not ( = ?auto_10728 ?auto_10743 ) ) ( not ( = ?auto_10729 ?auto_10731 ) ) ( not ( = ?auto_10729 ?auto_10743 ) ) ( not ( = ?auto_10731 ?auto_10755 ) ) ( not ( = ?auto_10731 ?auto_10746 ) ) ( not ( = ?auto_10731 ?auto_10754 ) ) ( not ( = ?auto_10731 ?auto_10739 ) ) ( not ( = ?auto_10731 ?auto_10747 ) ) ( not ( = ?auto_10731 ?auto_10740 ) ) ( not ( = ?auto_10731 ?auto_10745 ) ) ( not ( = ?auto_10731 ?auto_10752 ) ) ( not ( = ?auto_10743 ?auto_10755 ) ) ( not ( = ?auto_10743 ?auto_10746 ) ) ( not ( = ?auto_10743 ?auto_10754 ) ) ( not ( = ?auto_10743 ?auto_10739 ) ) ( not ( = ?auto_10743 ?auto_10747 ) ) ( not ( = ?auto_10743 ?auto_10740 ) ) ( not ( = ?auto_10743 ?auto_10745 ) ) ( not ( = ?auto_10743 ?auto_10752 ) ) ( not ( = ?auto_10722 ?auto_10732 ) ) ( not ( = ?auto_10722 ?auto_10734 ) ) ( not ( = ?auto_10723 ?auto_10732 ) ) ( not ( = ?auto_10723 ?auto_10734 ) ) ( not ( = ?auto_10724 ?auto_10732 ) ) ( not ( = ?auto_10724 ?auto_10734 ) ) ( not ( = ?auto_10725 ?auto_10732 ) ) ( not ( = ?auto_10725 ?auto_10734 ) ) ( not ( = ?auto_10726 ?auto_10732 ) ) ( not ( = ?auto_10726 ?auto_10734 ) ) ( not ( = ?auto_10727 ?auto_10732 ) ) ( not ( = ?auto_10727 ?auto_10734 ) ) ( not ( = ?auto_10728 ?auto_10732 ) ) ( not ( = ?auto_10728 ?auto_10734 ) ) ( not ( = ?auto_10729 ?auto_10732 ) ) ( not ( = ?auto_10729 ?auto_10734 ) ) ( not ( = ?auto_10730 ?auto_10732 ) ) ( not ( = ?auto_10730 ?auto_10734 ) ) ( not ( = ?auto_10732 ?auto_10743 ) ) ( not ( = ?auto_10732 ?auto_10755 ) ) ( not ( = ?auto_10732 ?auto_10746 ) ) ( not ( = ?auto_10732 ?auto_10754 ) ) ( not ( = ?auto_10732 ?auto_10739 ) ) ( not ( = ?auto_10732 ?auto_10747 ) ) ( not ( = ?auto_10732 ?auto_10740 ) ) ( not ( = ?auto_10732 ?auto_10745 ) ) ( not ( = ?auto_10732 ?auto_10752 ) ) ( not ( = ?auto_10734 ?auto_10743 ) ) ( not ( = ?auto_10734 ?auto_10755 ) ) ( not ( = ?auto_10734 ?auto_10746 ) ) ( not ( = ?auto_10734 ?auto_10754 ) ) ( not ( = ?auto_10734 ?auto_10739 ) ) ( not ( = ?auto_10734 ?auto_10747 ) ) ( not ( = ?auto_10734 ?auto_10740 ) ) ( not ( = ?auto_10734 ?auto_10745 ) ) ( not ( = ?auto_10734 ?auto_10752 ) ) )
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
      ?auto_10792 - HOIST
      ?auto_10791 - PLACE
      ?auto_10793 - PLACE
      ?auto_10794 - HOIST
      ?auto_10795 - SURFACE
      ?auto_10814 - PLACE
      ?auto_10810 - HOIST
      ?auto_10813 - SURFACE
      ?auto_10798 - SURFACE
      ?auto_10815 - PLACE
      ?auto_10800 - HOIST
      ?auto_10801 - SURFACE
      ?auto_10796 - PLACE
      ?auto_10811 - HOIST
      ?auto_10799 - SURFACE
      ?auto_10808 - PLACE
      ?auto_10806 - HOIST
      ?auto_10809 - SURFACE
      ?auto_10803 - SURFACE
      ?auto_10804 - SURFACE
      ?auto_10812 - PLACE
      ?auto_10805 - HOIST
      ?auto_10807 - SURFACE
      ?auto_10802 - SURFACE
      ?auto_10797 - SURFACE
      ?auto_10790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10792 ?auto_10791 ) ( IS-CRATE ?auto_10789 ) ( not ( = ?auto_10793 ?auto_10791 ) ) ( HOIST-AT ?auto_10794 ?auto_10793 ) ( AVAILABLE ?auto_10794 ) ( SURFACE-AT ?auto_10789 ?auto_10793 ) ( ON ?auto_10789 ?auto_10795 ) ( CLEAR ?auto_10789 ) ( not ( = ?auto_10788 ?auto_10789 ) ) ( not ( = ?auto_10788 ?auto_10795 ) ) ( not ( = ?auto_10789 ?auto_10795 ) ) ( not ( = ?auto_10792 ?auto_10794 ) ) ( IS-CRATE ?auto_10788 ) ( not ( = ?auto_10814 ?auto_10791 ) ) ( HOIST-AT ?auto_10810 ?auto_10814 ) ( SURFACE-AT ?auto_10788 ?auto_10814 ) ( ON ?auto_10788 ?auto_10813 ) ( CLEAR ?auto_10788 ) ( not ( = ?auto_10787 ?auto_10788 ) ) ( not ( = ?auto_10787 ?auto_10813 ) ) ( not ( = ?auto_10788 ?auto_10813 ) ) ( not ( = ?auto_10792 ?auto_10810 ) ) ( IS-CRATE ?auto_10787 ) ( SURFACE-AT ?auto_10787 ?auto_10814 ) ( ON ?auto_10787 ?auto_10798 ) ( CLEAR ?auto_10787 ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10786 ?auto_10798 ) ) ( not ( = ?auto_10787 ?auto_10798 ) ) ( IS-CRATE ?auto_10786 ) ( not ( = ?auto_10815 ?auto_10791 ) ) ( HOIST-AT ?auto_10800 ?auto_10815 ) ( AVAILABLE ?auto_10800 ) ( SURFACE-AT ?auto_10786 ?auto_10815 ) ( ON ?auto_10786 ?auto_10801 ) ( CLEAR ?auto_10786 ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10801 ) ) ( not ( = ?auto_10786 ?auto_10801 ) ) ( not ( = ?auto_10792 ?auto_10800 ) ) ( IS-CRATE ?auto_10785 ) ( not ( = ?auto_10796 ?auto_10791 ) ) ( HOIST-AT ?auto_10811 ?auto_10796 ) ( SURFACE-AT ?auto_10785 ?auto_10796 ) ( ON ?auto_10785 ?auto_10799 ) ( CLEAR ?auto_10785 ) ( not ( = ?auto_10784 ?auto_10785 ) ) ( not ( = ?auto_10784 ?auto_10799 ) ) ( not ( = ?auto_10785 ?auto_10799 ) ) ( not ( = ?auto_10792 ?auto_10811 ) ) ( IS-CRATE ?auto_10784 ) ( not ( = ?auto_10808 ?auto_10791 ) ) ( HOIST-AT ?auto_10806 ?auto_10808 ) ( SURFACE-AT ?auto_10784 ?auto_10808 ) ( ON ?auto_10784 ?auto_10809 ) ( CLEAR ?auto_10784 ) ( not ( = ?auto_10783 ?auto_10784 ) ) ( not ( = ?auto_10783 ?auto_10809 ) ) ( not ( = ?auto_10784 ?auto_10809 ) ) ( not ( = ?auto_10792 ?auto_10806 ) ) ( IS-CRATE ?auto_10783 ) ( AVAILABLE ?auto_10810 ) ( SURFACE-AT ?auto_10783 ?auto_10814 ) ( ON ?auto_10783 ?auto_10803 ) ( CLEAR ?auto_10783 ) ( not ( = ?auto_10782 ?auto_10783 ) ) ( not ( = ?auto_10782 ?auto_10803 ) ) ( not ( = ?auto_10783 ?auto_10803 ) ) ( IS-CRATE ?auto_10782 ) ( SURFACE-AT ?auto_10782 ?auto_10796 ) ( ON ?auto_10782 ?auto_10804 ) ( CLEAR ?auto_10782 ) ( not ( = ?auto_10781 ?auto_10782 ) ) ( not ( = ?auto_10781 ?auto_10804 ) ) ( not ( = ?auto_10782 ?auto_10804 ) ) ( IS-CRATE ?auto_10781 ) ( not ( = ?auto_10812 ?auto_10791 ) ) ( HOIST-AT ?auto_10805 ?auto_10812 ) ( AVAILABLE ?auto_10805 ) ( SURFACE-AT ?auto_10781 ?auto_10812 ) ( ON ?auto_10781 ?auto_10807 ) ( CLEAR ?auto_10781 ) ( not ( = ?auto_10780 ?auto_10781 ) ) ( not ( = ?auto_10780 ?auto_10807 ) ) ( not ( = ?auto_10781 ?auto_10807 ) ) ( not ( = ?auto_10792 ?auto_10805 ) ) ( IS-CRATE ?auto_10780 ) ( AVAILABLE ?auto_10806 ) ( SURFACE-AT ?auto_10780 ?auto_10808 ) ( ON ?auto_10780 ?auto_10802 ) ( CLEAR ?auto_10780 ) ( not ( = ?auto_10779 ?auto_10780 ) ) ( not ( = ?auto_10779 ?auto_10802 ) ) ( not ( = ?auto_10780 ?auto_10802 ) ) ( SURFACE-AT ?auto_10778 ?auto_10791 ) ( CLEAR ?auto_10778 ) ( IS-CRATE ?auto_10779 ) ( AVAILABLE ?auto_10792 ) ( AVAILABLE ?auto_10811 ) ( SURFACE-AT ?auto_10779 ?auto_10796 ) ( ON ?auto_10779 ?auto_10797 ) ( CLEAR ?auto_10779 ) ( TRUCK-AT ?auto_10790 ?auto_10791 ) ( not ( = ?auto_10778 ?auto_10779 ) ) ( not ( = ?auto_10778 ?auto_10797 ) ) ( not ( = ?auto_10779 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10780 ) ) ( not ( = ?auto_10778 ?auto_10802 ) ) ( not ( = ?auto_10780 ?auto_10797 ) ) ( not ( = ?auto_10808 ?auto_10796 ) ) ( not ( = ?auto_10806 ?auto_10811 ) ) ( not ( = ?auto_10802 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10781 ) ) ( not ( = ?auto_10778 ?auto_10807 ) ) ( not ( = ?auto_10779 ?auto_10781 ) ) ( not ( = ?auto_10779 ?auto_10807 ) ) ( not ( = ?auto_10781 ?auto_10802 ) ) ( not ( = ?auto_10781 ?auto_10797 ) ) ( not ( = ?auto_10812 ?auto_10808 ) ) ( not ( = ?auto_10812 ?auto_10796 ) ) ( not ( = ?auto_10805 ?auto_10806 ) ) ( not ( = ?auto_10805 ?auto_10811 ) ) ( not ( = ?auto_10807 ?auto_10802 ) ) ( not ( = ?auto_10807 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10782 ) ) ( not ( = ?auto_10778 ?auto_10804 ) ) ( not ( = ?auto_10779 ?auto_10782 ) ) ( not ( = ?auto_10779 ?auto_10804 ) ) ( not ( = ?auto_10780 ?auto_10782 ) ) ( not ( = ?auto_10780 ?auto_10804 ) ) ( not ( = ?auto_10782 ?auto_10807 ) ) ( not ( = ?auto_10782 ?auto_10802 ) ) ( not ( = ?auto_10782 ?auto_10797 ) ) ( not ( = ?auto_10804 ?auto_10807 ) ) ( not ( = ?auto_10804 ?auto_10802 ) ) ( not ( = ?auto_10804 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10783 ) ) ( not ( = ?auto_10778 ?auto_10803 ) ) ( not ( = ?auto_10779 ?auto_10783 ) ) ( not ( = ?auto_10779 ?auto_10803 ) ) ( not ( = ?auto_10780 ?auto_10783 ) ) ( not ( = ?auto_10780 ?auto_10803 ) ) ( not ( = ?auto_10781 ?auto_10783 ) ) ( not ( = ?auto_10781 ?auto_10803 ) ) ( not ( = ?auto_10783 ?auto_10804 ) ) ( not ( = ?auto_10783 ?auto_10807 ) ) ( not ( = ?auto_10783 ?auto_10802 ) ) ( not ( = ?auto_10783 ?auto_10797 ) ) ( not ( = ?auto_10814 ?auto_10796 ) ) ( not ( = ?auto_10814 ?auto_10812 ) ) ( not ( = ?auto_10814 ?auto_10808 ) ) ( not ( = ?auto_10810 ?auto_10811 ) ) ( not ( = ?auto_10810 ?auto_10805 ) ) ( not ( = ?auto_10810 ?auto_10806 ) ) ( not ( = ?auto_10803 ?auto_10804 ) ) ( not ( = ?auto_10803 ?auto_10807 ) ) ( not ( = ?auto_10803 ?auto_10802 ) ) ( not ( = ?auto_10803 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10784 ) ) ( not ( = ?auto_10778 ?auto_10809 ) ) ( not ( = ?auto_10779 ?auto_10784 ) ) ( not ( = ?auto_10779 ?auto_10809 ) ) ( not ( = ?auto_10780 ?auto_10784 ) ) ( not ( = ?auto_10780 ?auto_10809 ) ) ( not ( = ?auto_10781 ?auto_10784 ) ) ( not ( = ?auto_10781 ?auto_10809 ) ) ( not ( = ?auto_10782 ?auto_10784 ) ) ( not ( = ?auto_10782 ?auto_10809 ) ) ( not ( = ?auto_10784 ?auto_10803 ) ) ( not ( = ?auto_10784 ?auto_10804 ) ) ( not ( = ?auto_10784 ?auto_10807 ) ) ( not ( = ?auto_10784 ?auto_10802 ) ) ( not ( = ?auto_10784 ?auto_10797 ) ) ( not ( = ?auto_10809 ?auto_10803 ) ) ( not ( = ?auto_10809 ?auto_10804 ) ) ( not ( = ?auto_10809 ?auto_10807 ) ) ( not ( = ?auto_10809 ?auto_10802 ) ) ( not ( = ?auto_10809 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10785 ) ) ( not ( = ?auto_10778 ?auto_10799 ) ) ( not ( = ?auto_10779 ?auto_10785 ) ) ( not ( = ?auto_10779 ?auto_10799 ) ) ( not ( = ?auto_10780 ?auto_10785 ) ) ( not ( = ?auto_10780 ?auto_10799 ) ) ( not ( = ?auto_10781 ?auto_10785 ) ) ( not ( = ?auto_10781 ?auto_10799 ) ) ( not ( = ?auto_10782 ?auto_10785 ) ) ( not ( = ?auto_10782 ?auto_10799 ) ) ( not ( = ?auto_10783 ?auto_10785 ) ) ( not ( = ?auto_10783 ?auto_10799 ) ) ( not ( = ?auto_10785 ?auto_10809 ) ) ( not ( = ?auto_10785 ?auto_10803 ) ) ( not ( = ?auto_10785 ?auto_10804 ) ) ( not ( = ?auto_10785 ?auto_10807 ) ) ( not ( = ?auto_10785 ?auto_10802 ) ) ( not ( = ?auto_10785 ?auto_10797 ) ) ( not ( = ?auto_10799 ?auto_10809 ) ) ( not ( = ?auto_10799 ?auto_10803 ) ) ( not ( = ?auto_10799 ?auto_10804 ) ) ( not ( = ?auto_10799 ?auto_10807 ) ) ( not ( = ?auto_10799 ?auto_10802 ) ) ( not ( = ?auto_10799 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10786 ) ) ( not ( = ?auto_10778 ?auto_10801 ) ) ( not ( = ?auto_10779 ?auto_10786 ) ) ( not ( = ?auto_10779 ?auto_10801 ) ) ( not ( = ?auto_10780 ?auto_10786 ) ) ( not ( = ?auto_10780 ?auto_10801 ) ) ( not ( = ?auto_10781 ?auto_10786 ) ) ( not ( = ?auto_10781 ?auto_10801 ) ) ( not ( = ?auto_10782 ?auto_10786 ) ) ( not ( = ?auto_10782 ?auto_10801 ) ) ( not ( = ?auto_10783 ?auto_10786 ) ) ( not ( = ?auto_10783 ?auto_10801 ) ) ( not ( = ?auto_10784 ?auto_10786 ) ) ( not ( = ?auto_10784 ?auto_10801 ) ) ( not ( = ?auto_10786 ?auto_10799 ) ) ( not ( = ?auto_10786 ?auto_10809 ) ) ( not ( = ?auto_10786 ?auto_10803 ) ) ( not ( = ?auto_10786 ?auto_10804 ) ) ( not ( = ?auto_10786 ?auto_10807 ) ) ( not ( = ?auto_10786 ?auto_10802 ) ) ( not ( = ?auto_10786 ?auto_10797 ) ) ( not ( = ?auto_10815 ?auto_10796 ) ) ( not ( = ?auto_10815 ?auto_10808 ) ) ( not ( = ?auto_10815 ?auto_10814 ) ) ( not ( = ?auto_10815 ?auto_10812 ) ) ( not ( = ?auto_10800 ?auto_10811 ) ) ( not ( = ?auto_10800 ?auto_10806 ) ) ( not ( = ?auto_10800 ?auto_10810 ) ) ( not ( = ?auto_10800 ?auto_10805 ) ) ( not ( = ?auto_10801 ?auto_10799 ) ) ( not ( = ?auto_10801 ?auto_10809 ) ) ( not ( = ?auto_10801 ?auto_10803 ) ) ( not ( = ?auto_10801 ?auto_10804 ) ) ( not ( = ?auto_10801 ?auto_10807 ) ) ( not ( = ?auto_10801 ?auto_10802 ) ) ( not ( = ?auto_10801 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10787 ) ) ( not ( = ?auto_10778 ?auto_10798 ) ) ( not ( = ?auto_10779 ?auto_10787 ) ) ( not ( = ?auto_10779 ?auto_10798 ) ) ( not ( = ?auto_10780 ?auto_10787 ) ) ( not ( = ?auto_10780 ?auto_10798 ) ) ( not ( = ?auto_10781 ?auto_10787 ) ) ( not ( = ?auto_10781 ?auto_10798 ) ) ( not ( = ?auto_10782 ?auto_10787 ) ) ( not ( = ?auto_10782 ?auto_10798 ) ) ( not ( = ?auto_10783 ?auto_10787 ) ) ( not ( = ?auto_10783 ?auto_10798 ) ) ( not ( = ?auto_10784 ?auto_10787 ) ) ( not ( = ?auto_10784 ?auto_10798 ) ) ( not ( = ?auto_10785 ?auto_10787 ) ) ( not ( = ?auto_10785 ?auto_10798 ) ) ( not ( = ?auto_10787 ?auto_10801 ) ) ( not ( = ?auto_10787 ?auto_10799 ) ) ( not ( = ?auto_10787 ?auto_10809 ) ) ( not ( = ?auto_10787 ?auto_10803 ) ) ( not ( = ?auto_10787 ?auto_10804 ) ) ( not ( = ?auto_10787 ?auto_10807 ) ) ( not ( = ?auto_10787 ?auto_10802 ) ) ( not ( = ?auto_10787 ?auto_10797 ) ) ( not ( = ?auto_10798 ?auto_10801 ) ) ( not ( = ?auto_10798 ?auto_10799 ) ) ( not ( = ?auto_10798 ?auto_10809 ) ) ( not ( = ?auto_10798 ?auto_10803 ) ) ( not ( = ?auto_10798 ?auto_10804 ) ) ( not ( = ?auto_10798 ?auto_10807 ) ) ( not ( = ?auto_10798 ?auto_10802 ) ) ( not ( = ?auto_10798 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10788 ) ) ( not ( = ?auto_10778 ?auto_10813 ) ) ( not ( = ?auto_10779 ?auto_10788 ) ) ( not ( = ?auto_10779 ?auto_10813 ) ) ( not ( = ?auto_10780 ?auto_10788 ) ) ( not ( = ?auto_10780 ?auto_10813 ) ) ( not ( = ?auto_10781 ?auto_10788 ) ) ( not ( = ?auto_10781 ?auto_10813 ) ) ( not ( = ?auto_10782 ?auto_10788 ) ) ( not ( = ?auto_10782 ?auto_10813 ) ) ( not ( = ?auto_10783 ?auto_10788 ) ) ( not ( = ?auto_10783 ?auto_10813 ) ) ( not ( = ?auto_10784 ?auto_10788 ) ) ( not ( = ?auto_10784 ?auto_10813 ) ) ( not ( = ?auto_10785 ?auto_10788 ) ) ( not ( = ?auto_10785 ?auto_10813 ) ) ( not ( = ?auto_10786 ?auto_10788 ) ) ( not ( = ?auto_10786 ?auto_10813 ) ) ( not ( = ?auto_10788 ?auto_10798 ) ) ( not ( = ?auto_10788 ?auto_10801 ) ) ( not ( = ?auto_10788 ?auto_10799 ) ) ( not ( = ?auto_10788 ?auto_10809 ) ) ( not ( = ?auto_10788 ?auto_10803 ) ) ( not ( = ?auto_10788 ?auto_10804 ) ) ( not ( = ?auto_10788 ?auto_10807 ) ) ( not ( = ?auto_10788 ?auto_10802 ) ) ( not ( = ?auto_10788 ?auto_10797 ) ) ( not ( = ?auto_10813 ?auto_10798 ) ) ( not ( = ?auto_10813 ?auto_10801 ) ) ( not ( = ?auto_10813 ?auto_10799 ) ) ( not ( = ?auto_10813 ?auto_10809 ) ) ( not ( = ?auto_10813 ?auto_10803 ) ) ( not ( = ?auto_10813 ?auto_10804 ) ) ( not ( = ?auto_10813 ?auto_10807 ) ) ( not ( = ?auto_10813 ?auto_10802 ) ) ( not ( = ?auto_10813 ?auto_10797 ) ) ( not ( = ?auto_10778 ?auto_10789 ) ) ( not ( = ?auto_10778 ?auto_10795 ) ) ( not ( = ?auto_10779 ?auto_10789 ) ) ( not ( = ?auto_10779 ?auto_10795 ) ) ( not ( = ?auto_10780 ?auto_10789 ) ) ( not ( = ?auto_10780 ?auto_10795 ) ) ( not ( = ?auto_10781 ?auto_10789 ) ) ( not ( = ?auto_10781 ?auto_10795 ) ) ( not ( = ?auto_10782 ?auto_10789 ) ) ( not ( = ?auto_10782 ?auto_10795 ) ) ( not ( = ?auto_10783 ?auto_10789 ) ) ( not ( = ?auto_10783 ?auto_10795 ) ) ( not ( = ?auto_10784 ?auto_10789 ) ) ( not ( = ?auto_10784 ?auto_10795 ) ) ( not ( = ?auto_10785 ?auto_10789 ) ) ( not ( = ?auto_10785 ?auto_10795 ) ) ( not ( = ?auto_10786 ?auto_10789 ) ) ( not ( = ?auto_10786 ?auto_10795 ) ) ( not ( = ?auto_10787 ?auto_10789 ) ) ( not ( = ?auto_10787 ?auto_10795 ) ) ( not ( = ?auto_10789 ?auto_10813 ) ) ( not ( = ?auto_10789 ?auto_10798 ) ) ( not ( = ?auto_10789 ?auto_10801 ) ) ( not ( = ?auto_10789 ?auto_10799 ) ) ( not ( = ?auto_10789 ?auto_10809 ) ) ( not ( = ?auto_10789 ?auto_10803 ) ) ( not ( = ?auto_10789 ?auto_10804 ) ) ( not ( = ?auto_10789 ?auto_10807 ) ) ( not ( = ?auto_10789 ?auto_10802 ) ) ( not ( = ?auto_10789 ?auto_10797 ) ) ( not ( = ?auto_10793 ?auto_10814 ) ) ( not ( = ?auto_10793 ?auto_10815 ) ) ( not ( = ?auto_10793 ?auto_10796 ) ) ( not ( = ?auto_10793 ?auto_10808 ) ) ( not ( = ?auto_10793 ?auto_10812 ) ) ( not ( = ?auto_10794 ?auto_10810 ) ) ( not ( = ?auto_10794 ?auto_10800 ) ) ( not ( = ?auto_10794 ?auto_10811 ) ) ( not ( = ?auto_10794 ?auto_10806 ) ) ( not ( = ?auto_10794 ?auto_10805 ) ) ( not ( = ?auto_10795 ?auto_10813 ) ) ( not ( = ?auto_10795 ?auto_10798 ) ) ( not ( = ?auto_10795 ?auto_10801 ) ) ( not ( = ?auto_10795 ?auto_10799 ) ) ( not ( = ?auto_10795 ?auto_10809 ) ) ( not ( = ?auto_10795 ?auto_10803 ) ) ( not ( = ?auto_10795 ?auto_10804 ) ) ( not ( = ?auto_10795 ?auto_10807 ) ) ( not ( = ?auto_10795 ?auto_10802 ) ) ( not ( = ?auto_10795 ?auto_10797 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10778 ?auto_10779 ?auto_10780 ?auto_10781 ?auto_10782 ?auto_10783 ?auto_10784 ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10788 )
      ( MAKE-1CRATE ?auto_10788 ?auto_10789 )
      ( MAKE-11CRATE-VERIFY ?auto_10778 ?auto_10779 ?auto_10780 ?auto_10781 ?auto_10782 ?auto_10783 ?auto_10784 ?auto_10785 ?auto_10786 ?auto_10787 ?auto_10788 ?auto_10789 ) )
  )

)

