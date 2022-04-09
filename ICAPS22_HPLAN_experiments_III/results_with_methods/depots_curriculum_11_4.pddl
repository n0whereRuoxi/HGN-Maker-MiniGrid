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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10419 - SURFACE
      ?auto_10420 - SURFACE
    )
    :vars
    (
      ?auto_10421 - HOIST
      ?auto_10422 - PLACE
      ?auto_10424 - PLACE
      ?auto_10425 - HOIST
      ?auto_10426 - SURFACE
      ?auto_10423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10421 ?auto_10422 ) ( SURFACE-AT ?auto_10419 ?auto_10422 ) ( CLEAR ?auto_10419 ) ( IS-CRATE ?auto_10420 ) ( AVAILABLE ?auto_10421 ) ( not ( = ?auto_10424 ?auto_10422 ) ) ( HOIST-AT ?auto_10425 ?auto_10424 ) ( AVAILABLE ?auto_10425 ) ( SURFACE-AT ?auto_10420 ?auto_10424 ) ( ON ?auto_10420 ?auto_10426 ) ( CLEAR ?auto_10420 ) ( TRUCK-AT ?auto_10423 ?auto_10422 ) ( not ( = ?auto_10419 ?auto_10420 ) ) ( not ( = ?auto_10419 ?auto_10426 ) ) ( not ( = ?auto_10420 ?auto_10426 ) ) ( not ( = ?auto_10421 ?auto_10425 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10423 ?auto_10422 ?auto_10424 )
      ( !LIFT ?auto_10425 ?auto_10420 ?auto_10426 ?auto_10424 )
      ( !LOAD ?auto_10425 ?auto_10420 ?auto_10423 ?auto_10424 )
      ( !DRIVE ?auto_10423 ?auto_10424 ?auto_10422 )
      ( !UNLOAD ?auto_10421 ?auto_10420 ?auto_10423 ?auto_10422 )
      ( !DROP ?auto_10421 ?auto_10420 ?auto_10419 ?auto_10422 )
      ( MAKE-1CRATE-VERIFY ?auto_10419 ?auto_10420 ) )
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
      ?auto_10435 - HOIST
      ?auto_10437 - PLACE
      ?auto_10436 - PLACE
      ?auto_10433 - HOIST
      ?auto_10438 - SURFACE
      ?auto_10441 - PLACE
      ?auto_10440 - HOIST
      ?auto_10439 - SURFACE
      ?auto_10434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10435 ?auto_10437 ) ( IS-CRATE ?auto_10432 ) ( not ( = ?auto_10436 ?auto_10437 ) ) ( HOIST-AT ?auto_10433 ?auto_10436 ) ( AVAILABLE ?auto_10433 ) ( SURFACE-AT ?auto_10432 ?auto_10436 ) ( ON ?auto_10432 ?auto_10438 ) ( CLEAR ?auto_10432 ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( not ( = ?auto_10431 ?auto_10438 ) ) ( not ( = ?auto_10432 ?auto_10438 ) ) ( not ( = ?auto_10435 ?auto_10433 ) ) ( SURFACE-AT ?auto_10430 ?auto_10437 ) ( CLEAR ?auto_10430 ) ( IS-CRATE ?auto_10431 ) ( AVAILABLE ?auto_10435 ) ( not ( = ?auto_10441 ?auto_10437 ) ) ( HOIST-AT ?auto_10440 ?auto_10441 ) ( AVAILABLE ?auto_10440 ) ( SURFACE-AT ?auto_10431 ?auto_10441 ) ( ON ?auto_10431 ?auto_10439 ) ( CLEAR ?auto_10431 ) ( TRUCK-AT ?auto_10434 ?auto_10437 ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10439 ) ) ( not ( = ?auto_10431 ?auto_10439 ) ) ( not ( = ?auto_10435 ?auto_10440 ) ) ( not ( = ?auto_10430 ?auto_10432 ) ) ( not ( = ?auto_10430 ?auto_10438 ) ) ( not ( = ?auto_10432 ?auto_10439 ) ) ( not ( = ?auto_10436 ?auto_10441 ) ) ( not ( = ?auto_10433 ?auto_10440 ) ) ( not ( = ?auto_10438 ?auto_10439 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10430 ?auto_10431 )
      ( MAKE-1CRATE ?auto_10431 ?auto_10432 )
      ( MAKE-2CRATE-VERIFY ?auto_10430 ?auto_10431 ?auto_10432 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10444 - SURFACE
      ?auto_10445 - SURFACE
    )
    :vars
    (
      ?auto_10446 - HOIST
      ?auto_10447 - PLACE
      ?auto_10449 - PLACE
      ?auto_10450 - HOIST
      ?auto_10451 - SURFACE
      ?auto_10448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10446 ?auto_10447 ) ( SURFACE-AT ?auto_10444 ?auto_10447 ) ( CLEAR ?auto_10444 ) ( IS-CRATE ?auto_10445 ) ( AVAILABLE ?auto_10446 ) ( not ( = ?auto_10449 ?auto_10447 ) ) ( HOIST-AT ?auto_10450 ?auto_10449 ) ( AVAILABLE ?auto_10450 ) ( SURFACE-AT ?auto_10445 ?auto_10449 ) ( ON ?auto_10445 ?auto_10451 ) ( CLEAR ?auto_10445 ) ( TRUCK-AT ?auto_10448 ?auto_10447 ) ( not ( = ?auto_10444 ?auto_10445 ) ) ( not ( = ?auto_10444 ?auto_10451 ) ) ( not ( = ?auto_10445 ?auto_10451 ) ) ( not ( = ?auto_10446 ?auto_10450 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10448 ?auto_10447 ?auto_10449 )
      ( !LIFT ?auto_10450 ?auto_10445 ?auto_10451 ?auto_10449 )
      ( !LOAD ?auto_10450 ?auto_10445 ?auto_10448 ?auto_10449 )
      ( !DRIVE ?auto_10448 ?auto_10449 ?auto_10447 )
      ( !UNLOAD ?auto_10446 ?auto_10445 ?auto_10448 ?auto_10447 )
      ( !DROP ?auto_10446 ?auto_10445 ?auto_10444 ?auto_10447 )
      ( MAKE-1CRATE-VERIFY ?auto_10444 ?auto_10445 ) )
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
      ?auto_10464 - HOIST
      ?auto_10461 - PLACE
      ?auto_10463 - PLACE
      ?auto_10460 - HOIST
      ?auto_10462 - SURFACE
      ?auto_10470 - PLACE
      ?auto_10467 - HOIST
      ?auto_10469 - SURFACE
      ?auto_10466 - PLACE
      ?auto_10471 - HOIST
      ?auto_10468 - SURFACE
      ?auto_10465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10464 ?auto_10461 ) ( IS-CRATE ?auto_10459 ) ( not ( = ?auto_10463 ?auto_10461 ) ) ( HOIST-AT ?auto_10460 ?auto_10463 ) ( AVAILABLE ?auto_10460 ) ( SURFACE-AT ?auto_10459 ?auto_10463 ) ( ON ?auto_10459 ?auto_10462 ) ( CLEAR ?auto_10459 ) ( not ( = ?auto_10458 ?auto_10459 ) ) ( not ( = ?auto_10458 ?auto_10462 ) ) ( not ( = ?auto_10459 ?auto_10462 ) ) ( not ( = ?auto_10464 ?auto_10460 ) ) ( IS-CRATE ?auto_10458 ) ( not ( = ?auto_10470 ?auto_10461 ) ) ( HOIST-AT ?auto_10467 ?auto_10470 ) ( AVAILABLE ?auto_10467 ) ( SURFACE-AT ?auto_10458 ?auto_10470 ) ( ON ?auto_10458 ?auto_10469 ) ( CLEAR ?auto_10458 ) ( not ( = ?auto_10457 ?auto_10458 ) ) ( not ( = ?auto_10457 ?auto_10469 ) ) ( not ( = ?auto_10458 ?auto_10469 ) ) ( not ( = ?auto_10464 ?auto_10467 ) ) ( SURFACE-AT ?auto_10456 ?auto_10461 ) ( CLEAR ?auto_10456 ) ( IS-CRATE ?auto_10457 ) ( AVAILABLE ?auto_10464 ) ( not ( = ?auto_10466 ?auto_10461 ) ) ( HOIST-AT ?auto_10471 ?auto_10466 ) ( AVAILABLE ?auto_10471 ) ( SURFACE-AT ?auto_10457 ?auto_10466 ) ( ON ?auto_10457 ?auto_10468 ) ( CLEAR ?auto_10457 ) ( TRUCK-AT ?auto_10465 ?auto_10461 ) ( not ( = ?auto_10456 ?auto_10457 ) ) ( not ( = ?auto_10456 ?auto_10468 ) ) ( not ( = ?auto_10457 ?auto_10468 ) ) ( not ( = ?auto_10464 ?auto_10471 ) ) ( not ( = ?auto_10456 ?auto_10458 ) ) ( not ( = ?auto_10456 ?auto_10469 ) ) ( not ( = ?auto_10458 ?auto_10468 ) ) ( not ( = ?auto_10470 ?auto_10466 ) ) ( not ( = ?auto_10467 ?auto_10471 ) ) ( not ( = ?auto_10469 ?auto_10468 ) ) ( not ( = ?auto_10456 ?auto_10459 ) ) ( not ( = ?auto_10456 ?auto_10462 ) ) ( not ( = ?auto_10457 ?auto_10459 ) ) ( not ( = ?auto_10457 ?auto_10462 ) ) ( not ( = ?auto_10459 ?auto_10469 ) ) ( not ( = ?auto_10459 ?auto_10468 ) ) ( not ( = ?auto_10463 ?auto_10470 ) ) ( not ( = ?auto_10463 ?auto_10466 ) ) ( not ( = ?auto_10460 ?auto_10467 ) ) ( not ( = ?auto_10460 ?auto_10471 ) ) ( not ( = ?auto_10462 ?auto_10469 ) ) ( not ( = ?auto_10462 ?auto_10468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10456 ?auto_10457 ?auto_10458 )
      ( MAKE-1CRATE ?auto_10458 ?auto_10459 )
      ( MAKE-3CRATE-VERIFY ?auto_10456 ?auto_10457 ?auto_10458 ?auto_10459 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10474 - SURFACE
      ?auto_10475 - SURFACE
    )
    :vars
    (
      ?auto_10476 - HOIST
      ?auto_10477 - PLACE
      ?auto_10479 - PLACE
      ?auto_10480 - HOIST
      ?auto_10481 - SURFACE
      ?auto_10478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10476 ?auto_10477 ) ( SURFACE-AT ?auto_10474 ?auto_10477 ) ( CLEAR ?auto_10474 ) ( IS-CRATE ?auto_10475 ) ( AVAILABLE ?auto_10476 ) ( not ( = ?auto_10479 ?auto_10477 ) ) ( HOIST-AT ?auto_10480 ?auto_10479 ) ( AVAILABLE ?auto_10480 ) ( SURFACE-AT ?auto_10475 ?auto_10479 ) ( ON ?auto_10475 ?auto_10481 ) ( CLEAR ?auto_10475 ) ( TRUCK-AT ?auto_10478 ?auto_10477 ) ( not ( = ?auto_10474 ?auto_10475 ) ) ( not ( = ?auto_10474 ?auto_10481 ) ) ( not ( = ?auto_10475 ?auto_10481 ) ) ( not ( = ?auto_10476 ?auto_10480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10478 ?auto_10477 ?auto_10479 )
      ( !LIFT ?auto_10480 ?auto_10475 ?auto_10481 ?auto_10479 )
      ( !LOAD ?auto_10480 ?auto_10475 ?auto_10478 ?auto_10479 )
      ( !DRIVE ?auto_10478 ?auto_10479 ?auto_10477 )
      ( !UNLOAD ?auto_10476 ?auto_10475 ?auto_10478 ?auto_10477 )
      ( !DROP ?auto_10476 ?auto_10475 ?auto_10474 ?auto_10477 )
      ( MAKE-1CRATE-VERIFY ?auto_10474 ?auto_10475 ) )
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
      ?auto_10494 - HOIST
      ?auto_10495 - PLACE
      ?auto_10493 - PLACE
      ?auto_10497 - HOIST
      ?auto_10492 - SURFACE
      ?auto_10501 - PLACE
      ?auto_10502 - HOIST
      ?auto_10504 - SURFACE
      ?auto_10499 - PLACE
      ?auto_10506 - HOIST
      ?auto_10503 - SURFACE
      ?auto_10500 - PLACE
      ?auto_10498 - HOIST
      ?auto_10505 - SURFACE
      ?auto_10496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10494 ?auto_10495 ) ( IS-CRATE ?auto_10491 ) ( not ( = ?auto_10493 ?auto_10495 ) ) ( HOIST-AT ?auto_10497 ?auto_10493 ) ( AVAILABLE ?auto_10497 ) ( SURFACE-AT ?auto_10491 ?auto_10493 ) ( ON ?auto_10491 ?auto_10492 ) ( CLEAR ?auto_10491 ) ( not ( = ?auto_10490 ?auto_10491 ) ) ( not ( = ?auto_10490 ?auto_10492 ) ) ( not ( = ?auto_10491 ?auto_10492 ) ) ( not ( = ?auto_10494 ?auto_10497 ) ) ( IS-CRATE ?auto_10490 ) ( not ( = ?auto_10501 ?auto_10495 ) ) ( HOIST-AT ?auto_10502 ?auto_10501 ) ( AVAILABLE ?auto_10502 ) ( SURFACE-AT ?auto_10490 ?auto_10501 ) ( ON ?auto_10490 ?auto_10504 ) ( CLEAR ?auto_10490 ) ( not ( = ?auto_10489 ?auto_10490 ) ) ( not ( = ?auto_10489 ?auto_10504 ) ) ( not ( = ?auto_10490 ?auto_10504 ) ) ( not ( = ?auto_10494 ?auto_10502 ) ) ( IS-CRATE ?auto_10489 ) ( not ( = ?auto_10499 ?auto_10495 ) ) ( HOIST-AT ?auto_10506 ?auto_10499 ) ( AVAILABLE ?auto_10506 ) ( SURFACE-AT ?auto_10489 ?auto_10499 ) ( ON ?auto_10489 ?auto_10503 ) ( CLEAR ?auto_10489 ) ( not ( = ?auto_10488 ?auto_10489 ) ) ( not ( = ?auto_10488 ?auto_10503 ) ) ( not ( = ?auto_10489 ?auto_10503 ) ) ( not ( = ?auto_10494 ?auto_10506 ) ) ( SURFACE-AT ?auto_10487 ?auto_10495 ) ( CLEAR ?auto_10487 ) ( IS-CRATE ?auto_10488 ) ( AVAILABLE ?auto_10494 ) ( not ( = ?auto_10500 ?auto_10495 ) ) ( HOIST-AT ?auto_10498 ?auto_10500 ) ( AVAILABLE ?auto_10498 ) ( SURFACE-AT ?auto_10488 ?auto_10500 ) ( ON ?auto_10488 ?auto_10505 ) ( CLEAR ?auto_10488 ) ( TRUCK-AT ?auto_10496 ?auto_10495 ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( not ( = ?auto_10487 ?auto_10505 ) ) ( not ( = ?auto_10488 ?auto_10505 ) ) ( not ( = ?auto_10494 ?auto_10498 ) ) ( not ( = ?auto_10487 ?auto_10489 ) ) ( not ( = ?auto_10487 ?auto_10503 ) ) ( not ( = ?auto_10489 ?auto_10505 ) ) ( not ( = ?auto_10499 ?auto_10500 ) ) ( not ( = ?auto_10506 ?auto_10498 ) ) ( not ( = ?auto_10503 ?auto_10505 ) ) ( not ( = ?auto_10487 ?auto_10490 ) ) ( not ( = ?auto_10487 ?auto_10504 ) ) ( not ( = ?auto_10488 ?auto_10490 ) ) ( not ( = ?auto_10488 ?auto_10504 ) ) ( not ( = ?auto_10490 ?auto_10503 ) ) ( not ( = ?auto_10490 ?auto_10505 ) ) ( not ( = ?auto_10501 ?auto_10499 ) ) ( not ( = ?auto_10501 ?auto_10500 ) ) ( not ( = ?auto_10502 ?auto_10506 ) ) ( not ( = ?auto_10502 ?auto_10498 ) ) ( not ( = ?auto_10504 ?auto_10503 ) ) ( not ( = ?auto_10504 ?auto_10505 ) ) ( not ( = ?auto_10487 ?auto_10491 ) ) ( not ( = ?auto_10487 ?auto_10492 ) ) ( not ( = ?auto_10488 ?auto_10491 ) ) ( not ( = ?auto_10488 ?auto_10492 ) ) ( not ( = ?auto_10489 ?auto_10491 ) ) ( not ( = ?auto_10489 ?auto_10492 ) ) ( not ( = ?auto_10491 ?auto_10504 ) ) ( not ( = ?auto_10491 ?auto_10503 ) ) ( not ( = ?auto_10491 ?auto_10505 ) ) ( not ( = ?auto_10493 ?auto_10501 ) ) ( not ( = ?auto_10493 ?auto_10499 ) ) ( not ( = ?auto_10493 ?auto_10500 ) ) ( not ( = ?auto_10497 ?auto_10502 ) ) ( not ( = ?auto_10497 ?auto_10506 ) ) ( not ( = ?auto_10497 ?auto_10498 ) ) ( not ( = ?auto_10492 ?auto_10504 ) ) ( not ( = ?auto_10492 ?auto_10503 ) ) ( not ( = ?auto_10492 ?auto_10505 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10487 ?auto_10488 ?auto_10489 ?auto_10490 )
      ( MAKE-1CRATE ?auto_10490 ?auto_10491 )
      ( MAKE-4CRATE-VERIFY ?auto_10487 ?auto_10488 ?auto_10489 ?auto_10490 ?auto_10491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10509 - SURFACE
      ?auto_10510 - SURFACE
    )
    :vars
    (
      ?auto_10511 - HOIST
      ?auto_10512 - PLACE
      ?auto_10514 - PLACE
      ?auto_10515 - HOIST
      ?auto_10516 - SURFACE
      ?auto_10513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10511 ?auto_10512 ) ( SURFACE-AT ?auto_10509 ?auto_10512 ) ( CLEAR ?auto_10509 ) ( IS-CRATE ?auto_10510 ) ( AVAILABLE ?auto_10511 ) ( not ( = ?auto_10514 ?auto_10512 ) ) ( HOIST-AT ?auto_10515 ?auto_10514 ) ( AVAILABLE ?auto_10515 ) ( SURFACE-AT ?auto_10510 ?auto_10514 ) ( ON ?auto_10510 ?auto_10516 ) ( CLEAR ?auto_10510 ) ( TRUCK-AT ?auto_10513 ?auto_10512 ) ( not ( = ?auto_10509 ?auto_10510 ) ) ( not ( = ?auto_10509 ?auto_10516 ) ) ( not ( = ?auto_10510 ?auto_10516 ) ) ( not ( = ?auto_10511 ?auto_10515 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10513 ?auto_10512 ?auto_10514 )
      ( !LIFT ?auto_10515 ?auto_10510 ?auto_10516 ?auto_10514 )
      ( !LOAD ?auto_10515 ?auto_10510 ?auto_10513 ?auto_10514 )
      ( !DRIVE ?auto_10513 ?auto_10514 ?auto_10512 )
      ( !UNLOAD ?auto_10511 ?auto_10510 ?auto_10513 ?auto_10512 )
      ( !DROP ?auto_10511 ?auto_10510 ?auto_10509 ?auto_10512 )
      ( MAKE-1CRATE-VERIFY ?auto_10509 ?auto_10510 ) )
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
      ?auto_10531 - HOIST
      ?auto_10533 - PLACE
      ?auto_10530 - PLACE
      ?auto_10529 - HOIST
      ?auto_10534 - SURFACE
      ?auto_10542 - PLACE
      ?auto_10541 - HOIST
      ?auto_10536 - SURFACE
      ?auto_10540 - PLACE
      ?auto_10537 - HOIST
      ?auto_10543 - SURFACE
      ?auto_10539 - PLACE
      ?auto_10544 - HOIST
      ?auto_10538 - SURFACE
      ?auto_10535 - SURFACE
      ?auto_10532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10531 ?auto_10533 ) ( IS-CRATE ?auto_10528 ) ( not ( = ?auto_10530 ?auto_10533 ) ) ( HOIST-AT ?auto_10529 ?auto_10530 ) ( SURFACE-AT ?auto_10528 ?auto_10530 ) ( ON ?auto_10528 ?auto_10534 ) ( CLEAR ?auto_10528 ) ( not ( = ?auto_10527 ?auto_10528 ) ) ( not ( = ?auto_10527 ?auto_10534 ) ) ( not ( = ?auto_10528 ?auto_10534 ) ) ( not ( = ?auto_10531 ?auto_10529 ) ) ( IS-CRATE ?auto_10527 ) ( not ( = ?auto_10542 ?auto_10533 ) ) ( HOIST-AT ?auto_10541 ?auto_10542 ) ( AVAILABLE ?auto_10541 ) ( SURFACE-AT ?auto_10527 ?auto_10542 ) ( ON ?auto_10527 ?auto_10536 ) ( CLEAR ?auto_10527 ) ( not ( = ?auto_10526 ?auto_10527 ) ) ( not ( = ?auto_10526 ?auto_10536 ) ) ( not ( = ?auto_10527 ?auto_10536 ) ) ( not ( = ?auto_10531 ?auto_10541 ) ) ( IS-CRATE ?auto_10526 ) ( not ( = ?auto_10540 ?auto_10533 ) ) ( HOIST-AT ?auto_10537 ?auto_10540 ) ( AVAILABLE ?auto_10537 ) ( SURFACE-AT ?auto_10526 ?auto_10540 ) ( ON ?auto_10526 ?auto_10543 ) ( CLEAR ?auto_10526 ) ( not ( = ?auto_10525 ?auto_10526 ) ) ( not ( = ?auto_10525 ?auto_10543 ) ) ( not ( = ?auto_10526 ?auto_10543 ) ) ( not ( = ?auto_10531 ?auto_10537 ) ) ( IS-CRATE ?auto_10525 ) ( not ( = ?auto_10539 ?auto_10533 ) ) ( HOIST-AT ?auto_10544 ?auto_10539 ) ( AVAILABLE ?auto_10544 ) ( SURFACE-AT ?auto_10525 ?auto_10539 ) ( ON ?auto_10525 ?auto_10538 ) ( CLEAR ?auto_10525 ) ( not ( = ?auto_10524 ?auto_10525 ) ) ( not ( = ?auto_10524 ?auto_10538 ) ) ( not ( = ?auto_10525 ?auto_10538 ) ) ( not ( = ?auto_10531 ?auto_10544 ) ) ( SURFACE-AT ?auto_10523 ?auto_10533 ) ( CLEAR ?auto_10523 ) ( IS-CRATE ?auto_10524 ) ( AVAILABLE ?auto_10531 ) ( AVAILABLE ?auto_10529 ) ( SURFACE-AT ?auto_10524 ?auto_10530 ) ( ON ?auto_10524 ?auto_10535 ) ( CLEAR ?auto_10524 ) ( TRUCK-AT ?auto_10532 ?auto_10533 ) ( not ( = ?auto_10523 ?auto_10524 ) ) ( not ( = ?auto_10523 ?auto_10535 ) ) ( not ( = ?auto_10524 ?auto_10535 ) ) ( not ( = ?auto_10523 ?auto_10525 ) ) ( not ( = ?auto_10523 ?auto_10538 ) ) ( not ( = ?auto_10525 ?auto_10535 ) ) ( not ( = ?auto_10539 ?auto_10530 ) ) ( not ( = ?auto_10544 ?auto_10529 ) ) ( not ( = ?auto_10538 ?auto_10535 ) ) ( not ( = ?auto_10523 ?auto_10526 ) ) ( not ( = ?auto_10523 ?auto_10543 ) ) ( not ( = ?auto_10524 ?auto_10526 ) ) ( not ( = ?auto_10524 ?auto_10543 ) ) ( not ( = ?auto_10526 ?auto_10538 ) ) ( not ( = ?auto_10526 ?auto_10535 ) ) ( not ( = ?auto_10540 ?auto_10539 ) ) ( not ( = ?auto_10540 ?auto_10530 ) ) ( not ( = ?auto_10537 ?auto_10544 ) ) ( not ( = ?auto_10537 ?auto_10529 ) ) ( not ( = ?auto_10543 ?auto_10538 ) ) ( not ( = ?auto_10543 ?auto_10535 ) ) ( not ( = ?auto_10523 ?auto_10527 ) ) ( not ( = ?auto_10523 ?auto_10536 ) ) ( not ( = ?auto_10524 ?auto_10527 ) ) ( not ( = ?auto_10524 ?auto_10536 ) ) ( not ( = ?auto_10525 ?auto_10527 ) ) ( not ( = ?auto_10525 ?auto_10536 ) ) ( not ( = ?auto_10527 ?auto_10543 ) ) ( not ( = ?auto_10527 ?auto_10538 ) ) ( not ( = ?auto_10527 ?auto_10535 ) ) ( not ( = ?auto_10542 ?auto_10540 ) ) ( not ( = ?auto_10542 ?auto_10539 ) ) ( not ( = ?auto_10542 ?auto_10530 ) ) ( not ( = ?auto_10541 ?auto_10537 ) ) ( not ( = ?auto_10541 ?auto_10544 ) ) ( not ( = ?auto_10541 ?auto_10529 ) ) ( not ( = ?auto_10536 ?auto_10543 ) ) ( not ( = ?auto_10536 ?auto_10538 ) ) ( not ( = ?auto_10536 ?auto_10535 ) ) ( not ( = ?auto_10523 ?auto_10528 ) ) ( not ( = ?auto_10523 ?auto_10534 ) ) ( not ( = ?auto_10524 ?auto_10528 ) ) ( not ( = ?auto_10524 ?auto_10534 ) ) ( not ( = ?auto_10525 ?auto_10528 ) ) ( not ( = ?auto_10525 ?auto_10534 ) ) ( not ( = ?auto_10526 ?auto_10528 ) ) ( not ( = ?auto_10526 ?auto_10534 ) ) ( not ( = ?auto_10528 ?auto_10536 ) ) ( not ( = ?auto_10528 ?auto_10543 ) ) ( not ( = ?auto_10528 ?auto_10538 ) ) ( not ( = ?auto_10528 ?auto_10535 ) ) ( not ( = ?auto_10534 ?auto_10536 ) ) ( not ( = ?auto_10534 ?auto_10543 ) ) ( not ( = ?auto_10534 ?auto_10538 ) ) ( not ( = ?auto_10534 ?auto_10535 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10523 ?auto_10524 ?auto_10525 ?auto_10526 ?auto_10527 )
      ( MAKE-1CRATE ?auto_10527 ?auto_10528 )
      ( MAKE-5CRATE-VERIFY ?auto_10523 ?auto_10524 ?auto_10525 ?auto_10526 ?auto_10527 ?auto_10528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10547 - SURFACE
      ?auto_10548 - SURFACE
    )
    :vars
    (
      ?auto_10549 - HOIST
      ?auto_10550 - PLACE
      ?auto_10552 - PLACE
      ?auto_10553 - HOIST
      ?auto_10554 - SURFACE
      ?auto_10551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10549 ?auto_10550 ) ( SURFACE-AT ?auto_10547 ?auto_10550 ) ( CLEAR ?auto_10547 ) ( IS-CRATE ?auto_10548 ) ( AVAILABLE ?auto_10549 ) ( not ( = ?auto_10552 ?auto_10550 ) ) ( HOIST-AT ?auto_10553 ?auto_10552 ) ( AVAILABLE ?auto_10553 ) ( SURFACE-AT ?auto_10548 ?auto_10552 ) ( ON ?auto_10548 ?auto_10554 ) ( CLEAR ?auto_10548 ) ( TRUCK-AT ?auto_10551 ?auto_10550 ) ( not ( = ?auto_10547 ?auto_10548 ) ) ( not ( = ?auto_10547 ?auto_10554 ) ) ( not ( = ?auto_10548 ?auto_10554 ) ) ( not ( = ?auto_10549 ?auto_10553 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10551 ?auto_10550 ?auto_10552 )
      ( !LIFT ?auto_10553 ?auto_10548 ?auto_10554 ?auto_10552 )
      ( !LOAD ?auto_10553 ?auto_10548 ?auto_10551 ?auto_10552 )
      ( !DRIVE ?auto_10551 ?auto_10552 ?auto_10550 )
      ( !UNLOAD ?auto_10549 ?auto_10548 ?auto_10551 ?auto_10550 )
      ( !DROP ?auto_10549 ?auto_10548 ?auto_10547 ?auto_10550 )
      ( MAKE-1CRATE-VERIFY ?auto_10547 ?auto_10548 ) )
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
      ?auto_10570 - HOIST
      ?auto_10571 - PLACE
      ?auto_10572 - PLACE
      ?auto_10574 - HOIST
      ?auto_10573 - SURFACE
      ?auto_10583 - PLACE
      ?auto_10586 - HOIST
      ?auto_10587 - SURFACE
      ?auto_10576 - PLACE
      ?auto_10580 - HOIST
      ?auto_10578 - SURFACE
      ?auto_10584 - PLACE
      ?auto_10582 - HOIST
      ?auto_10575 - SURFACE
      ?auto_10585 - PLACE
      ?auto_10579 - HOIST
      ?auto_10577 - SURFACE
      ?auto_10581 - SURFACE
      ?auto_10569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10570 ?auto_10571 ) ( IS-CRATE ?auto_10568 ) ( not ( = ?auto_10572 ?auto_10571 ) ) ( HOIST-AT ?auto_10574 ?auto_10572 ) ( AVAILABLE ?auto_10574 ) ( SURFACE-AT ?auto_10568 ?auto_10572 ) ( ON ?auto_10568 ?auto_10573 ) ( CLEAR ?auto_10568 ) ( not ( = ?auto_10567 ?auto_10568 ) ) ( not ( = ?auto_10567 ?auto_10573 ) ) ( not ( = ?auto_10568 ?auto_10573 ) ) ( not ( = ?auto_10570 ?auto_10574 ) ) ( IS-CRATE ?auto_10567 ) ( not ( = ?auto_10583 ?auto_10571 ) ) ( HOIST-AT ?auto_10586 ?auto_10583 ) ( SURFACE-AT ?auto_10567 ?auto_10583 ) ( ON ?auto_10567 ?auto_10587 ) ( CLEAR ?auto_10567 ) ( not ( = ?auto_10566 ?auto_10567 ) ) ( not ( = ?auto_10566 ?auto_10587 ) ) ( not ( = ?auto_10567 ?auto_10587 ) ) ( not ( = ?auto_10570 ?auto_10586 ) ) ( IS-CRATE ?auto_10566 ) ( not ( = ?auto_10576 ?auto_10571 ) ) ( HOIST-AT ?auto_10580 ?auto_10576 ) ( AVAILABLE ?auto_10580 ) ( SURFACE-AT ?auto_10566 ?auto_10576 ) ( ON ?auto_10566 ?auto_10578 ) ( CLEAR ?auto_10566 ) ( not ( = ?auto_10565 ?auto_10566 ) ) ( not ( = ?auto_10565 ?auto_10578 ) ) ( not ( = ?auto_10566 ?auto_10578 ) ) ( not ( = ?auto_10570 ?auto_10580 ) ) ( IS-CRATE ?auto_10565 ) ( not ( = ?auto_10584 ?auto_10571 ) ) ( HOIST-AT ?auto_10582 ?auto_10584 ) ( AVAILABLE ?auto_10582 ) ( SURFACE-AT ?auto_10565 ?auto_10584 ) ( ON ?auto_10565 ?auto_10575 ) ( CLEAR ?auto_10565 ) ( not ( = ?auto_10564 ?auto_10565 ) ) ( not ( = ?auto_10564 ?auto_10575 ) ) ( not ( = ?auto_10565 ?auto_10575 ) ) ( not ( = ?auto_10570 ?auto_10582 ) ) ( IS-CRATE ?auto_10564 ) ( not ( = ?auto_10585 ?auto_10571 ) ) ( HOIST-AT ?auto_10579 ?auto_10585 ) ( AVAILABLE ?auto_10579 ) ( SURFACE-AT ?auto_10564 ?auto_10585 ) ( ON ?auto_10564 ?auto_10577 ) ( CLEAR ?auto_10564 ) ( not ( = ?auto_10563 ?auto_10564 ) ) ( not ( = ?auto_10563 ?auto_10577 ) ) ( not ( = ?auto_10564 ?auto_10577 ) ) ( not ( = ?auto_10570 ?auto_10579 ) ) ( SURFACE-AT ?auto_10562 ?auto_10571 ) ( CLEAR ?auto_10562 ) ( IS-CRATE ?auto_10563 ) ( AVAILABLE ?auto_10570 ) ( AVAILABLE ?auto_10586 ) ( SURFACE-AT ?auto_10563 ?auto_10583 ) ( ON ?auto_10563 ?auto_10581 ) ( CLEAR ?auto_10563 ) ( TRUCK-AT ?auto_10569 ?auto_10571 ) ( not ( = ?auto_10562 ?auto_10563 ) ) ( not ( = ?auto_10562 ?auto_10581 ) ) ( not ( = ?auto_10563 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10564 ) ) ( not ( = ?auto_10562 ?auto_10577 ) ) ( not ( = ?auto_10564 ?auto_10581 ) ) ( not ( = ?auto_10585 ?auto_10583 ) ) ( not ( = ?auto_10579 ?auto_10586 ) ) ( not ( = ?auto_10577 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10565 ) ) ( not ( = ?auto_10562 ?auto_10575 ) ) ( not ( = ?auto_10563 ?auto_10565 ) ) ( not ( = ?auto_10563 ?auto_10575 ) ) ( not ( = ?auto_10565 ?auto_10577 ) ) ( not ( = ?auto_10565 ?auto_10581 ) ) ( not ( = ?auto_10584 ?auto_10585 ) ) ( not ( = ?auto_10584 ?auto_10583 ) ) ( not ( = ?auto_10582 ?auto_10579 ) ) ( not ( = ?auto_10582 ?auto_10586 ) ) ( not ( = ?auto_10575 ?auto_10577 ) ) ( not ( = ?auto_10575 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10566 ) ) ( not ( = ?auto_10562 ?auto_10578 ) ) ( not ( = ?auto_10563 ?auto_10566 ) ) ( not ( = ?auto_10563 ?auto_10578 ) ) ( not ( = ?auto_10564 ?auto_10566 ) ) ( not ( = ?auto_10564 ?auto_10578 ) ) ( not ( = ?auto_10566 ?auto_10575 ) ) ( not ( = ?auto_10566 ?auto_10577 ) ) ( not ( = ?auto_10566 ?auto_10581 ) ) ( not ( = ?auto_10576 ?auto_10584 ) ) ( not ( = ?auto_10576 ?auto_10585 ) ) ( not ( = ?auto_10576 ?auto_10583 ) ) ( not ( = ?auto_10580 ?auto_10582 ) ) ( not ( = ?auto_10580 ?auto_10579 ) ) ( not ( = ?auto_10580 ?auto_10586 ) ) ( not ( = ?auto_10578 ?auto_10575 ) ) ( not ( = ?auto_10578 ?auto_10577 ) ) ( not ( = ?auto_10578 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10567 ) ) ( not ( = ?auto_10562 ?auto_10587 ) ) ( not ( = ?auto_10563 ?auto_10567 ) ) ( not ( = ?auto_10563 ?auto_10587 ) ) ( not ( = ?auto_10564 ?auto_10567 ) ) ( not ( = ?auto_10564 ?auto_10587 ) ) ( not ( = ?auto_10565 ?auto_10567 ) ) ( not ( = ?auto_10565 ?auto_10587 ) ) ( not ( = ?auto_10567 ?auto_10578 ) ) ( not ( = ?auto_10567 ?auto_10575 ) ) ( not ( = ?auto_10567 ?auto_10577 ) ) ( not ( = ?auto_10567 ?auto_10581 ) ) ( not ( = ?auto_10587 ?auto_10578 ) ) ( not ( = ?auto_10587 ?auto_10575 ) ) ( not ( = ?auto_10587 ?auto_10577 ) ) ( not ( = ?auto_10587 ?auto_10581 ) ) ( not ( = ?auto_10562 ?auto_10568 ) ) ( not ( = ?auto_10562 ?auto_10573 ) ) ( not ( = ?auto_10563 ?auto_10568 ) ) ( not ( = ?auto_10563 ?auto_10573 ) ) ( not ( = ?auto_10564 ?auto_10568 ) ) ( not ( = ?auto_10564 ?auto_10573 ) ) ( not ( = ?auto_10565 ?auto_10568 ) ) ( not ( = ?auto_10565 ?auto_10573 ) ) ( not ( = ?auto_10566 ?auto_10568 ) ) ( not ( = ?auto_10566 ?auto_10573 ) ) ( not ( = ?auto_10568 ?auto_10587 ) ) ( not ( = ?auto_10568 ?auto_10578 ) ) ( not ( = ?auto_10568 ?auto_10575 ) ) ( not ( = ?auto_10568 ?auto_10577 ) ) ( not ( = ?auto_10568 ?auto_10581 ) ) ( not ( = ?auto_10572 ?auto_10583 ) ) ( not ( = ?auto_10572 ?auto_10576 ) ) ( not ( = ?auto_10572 ?auto_10584 ) ) ( not ( = ?auto_10572 ?auto_10585 ) ) ( not ( = ?auto_10574 ?auto_10586 ) ) ( not ( = ?auto_10574 ?auto_10580 ) ) ( not ( = ?auto_10574 ?auto_10582 ) ) ( not ( = ?auto_10574 ?auto_10579 ) ) ( not ( = ?auto_10573 ?auto_10587 ) ) ( not ( = ?auto_10573 ?auto_10578 ) ) ( not ( = ?auto_10573 ?auto_10575 ) ) ( not ( = ?auto_10573 ?auto_10577 ) ) ( not ( = ?auto_10573 ?auto_10581 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10562 ?auto_10563 ?auto_10564 ?auto_10565 ?auto_10566 ?auto_10567 )
      ( MAKE-1CRATE ?auto_10567 ?auto_10568 )
      ( MAKE-6CRATE-VERIFY ?auto_10562 ?auto_10563 ?auto_10564 ?auto_10565 ?auto_10566 ?auto_10567 ?auto_10568 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10590 - SURFACE
      ?auto_10591 - SURFACE
    )
    :vars
    (
      ?auto_10592 - HOIST
      ?auto_10593 - PLACE
      ?auto_10595 - PLACE
      ?auto_10596 - HOIST
      ?auto_10597 - SURFACE
      ?auto_10594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10592 ?auto_10593 ) ( SURFACE-AT ?auto_10590 ?auto_10593 ) ( CLEAR ?auto_10590 ) ( IS-CRATE ?auto_10591 ) ( AVAILABLE ?auto_10592 ) ( not ( = ?auto_10595 ?auto_10593 ) ) ( HOIST-AT ?auto_10596 ?auto_10595 ) ( AVAILABLE ?auto_10596 ) ( SURFACE-AT ?auto_10591 ?auto_10595 ) ( ON ?auto_10591 ?auto_10597 ) ( CLEAR ?auto_10591 ) ( TRUCK-AT ?auto_10594 ?auto_10593 ) ( not ( = ?auto_10590 ?auto_10591 ) ) ( not ( = ?auto_10590 ?auto_10597 ) ) ( not ( = ?auto_10591 ?auto_10597 ) ) ( not ( = ?auto_10592 ?auto_10596 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10594 ?auto_10593 ?auto_10595 )
      ( !LIFT ?auto_10596 ?auto_10591 ?auto_10597 ?auto_10595 )
      ( !LOAD ?auto_10596 ?auto_10591 ?auto_10594 ?auto_10595 )
      ( !DRIVE ?auto_10594 ?auto_10595 ?auto_10593 )
      ( !UNLOAD ?auto_10592 ?auto_10591 ?auto_10594 ?auto_10593 )
      ( !DROP ?auto_10592 ?auto_10591 ?auto_10590 ?auto_10593 )
      ( MAKE-1CRATE-VERIFY ?auto_10590 ?auto_10591 ) )
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
      ?auto_10615 - HOIST
      ?auto_10617 - PLACE
      ?auto_10616 - PLACE
      ?auto_10618 - HOIST
      ?auto_10614 - SURFACE
      ?auto_10623 - PLACE
      ?auto_10635 - HOIST
      ?auto_10622 - SURFACE
      ?auto_10624 - PLACE
      ?auto_10627 - HOIST
      ?auto_10628 - SURFACE
      ?auto_10621 - PLACE
      ?auto_10631 - HOIST
      ?auto_10633 - SURFACE
      ?auto_10626 - PLACE
      ?auto_10629 - HOIST
      ?auto_10634 - SURFACE
      ?auto_10625 - PLACE
      ?auto_10632 - HOIST
      ?auto_10620 - SURFACE
      ?auto_10630 - SURFACE
      ?auto_10619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10615 ?auto_10617 ) ( IS-CRATE ?auto_10613 ) ( not ( = ?auto_10616 ?auto_10617 ) ) ( HOIST-AT ?auto_10618 ?auto_10616 ) ( AVAILABLE ?auto_10618 ) ( SURFACE-AT ?auto_10613 ?auto_10616 ) ( ON ?auto_10613 ?auto_10614 ) ( CLEAR ?auto_10613 ) ( not ( = ?auto_10612 ?auto_10613 ) ) ( not ( = ?auto_10612 ?auto_10614 ) ) ( not ( = ?auto_10613 ?auto_10614 ) ) ( not ( = ?auto_10615 ?auto_10618 ) ) ( IS-CRATE ?auto_10612 ) ( not ( = ?auto_10623 ?auto_10617 ) ) ( HOIST-AT ?auto_10635 ?auto_10623 ) ( AVAILABLE ?auto_10635 ) ( SURFACE-AT ?auto_10612 ?auto_10623 ) ( ON ?auto_10612 ?auto_10622 ) ( CLEAR ?auto_10612 ) ( not ( = ?auto_10611 ?auto_10612 ) ) ( not ( = ?auto_10611 ?auto_10622 ) ) ( not ( = ?auto_10612 ?auto_10622 ) ) ( not ( = ?auto_10615 ?auto_10635 ) ) ( IS-CRATE ?auto_10611 ) ( not ( = ?auto_10624 ?auto_10617 ) ) ( HOIST-AT ?auto_10627 ?auto_10624 ) ( SURFACE-AT ?auto_10611 ?auto_10624 ) ( ON ?auto_10611 ?auto_10628 ) ( CLEAR ?auto_10611 ) ( not ( = ?auto_10610 ?auto_10611 ) ) ( not ( = ?auto_10610 ?auto_10628 ) ) ( not ( = ?auto_10611 ?auto_10628 ) ) ( not ( = ?auto_10615 ?auto_10627 ) ) ( IS-CRATE ?auto_10610 ) ( not ( = ?auto_10621 ?auto_10617 ) ) ( HOIST-AT ?auto_10631 ?auto_10621 ) ( AVAILABLE ?auto_10631 ) ( SURFACE-AT ?auto_10610 ?auto_10621 ) ( ON ?auto_10610 ?auto_10633 ) ( CLEAR ?auto_10610 ) ( not ( = ?auto_10609 ?auto_10610 ) ) ( not ( = ?auto_10609 ?auto_10633 ) ) ( not ( = ?auto_10610 ?auto_10633 ) ) ( not ( = ?auto_10615 ?auto_10631 ) ) ( IS-CRATE ?auto_10609 ) ( not ( = ?auto_10626 ?auto_10617 ) ) ( HOIST-AT ?auto_10629 ?auto_10626 ) ( AVAILABLE ?auto_10629 ) ( SURFACE-AT ?auto_10609 ?auto_10626 ) ( ON ?auto_10609 ?auto_10634 ) ( CLEAR ?auto_10609 ) ( not ( = ?auto_10608 ?auto_10609 ) ) ( not ( = ?auto_10608 ?auto_10634 ) ) ( not ( = ?auto_10609 ?auto_10634 ) ) ( not ( = ?auto_10615 ?auto_10629 ) ) ( IS-CRATE ?auto_10608 ) ( not ( = ?auto_10625 ?auto_10617 ) ) ( HOIST-AT ?auto_10632 ?auto_10625 ) ( AVAILABLE ?auto_10632 ) ( SURFACE-AT ?auto_10608 ?auto_10625 ) ( ON ?auto_10608 ?auto_10620 ) ( CLEAR ?auto_10608 ) ( not ( = ?auto_10607 ?auto_10608 ) ) ( not ( = ?auto_10607 ?auto_10620 ) ) ( not ( = ?auto_10608 ?auto_10620 ) ) ( not ( = ?auto_10615 ?auto_10632 ) ) ( SURFACE-AT ?auto_10606 ?auto_10617 ) ( CLEAR ?auto_10606 ) ( IS-CRATE ?auto_10607 ) ( AVAILABLE ?auto_10615 ) ( AVAILABLE ?auto_10627 ) ( SURFACE-AT ?auto_10607 ?auto_10624 ) ( ON ?auto_10607 ?auto_10630 ) ( CLEAR ?auto_10607 ) ( TRUCK-AT ?auto_10619 ?auto_10617 ) ( not ( = ?auto_10606 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10630 ) ) ( not ( = ?auto_10607 ?auto_10630 ) ) ( not ( = ?auto_10606 ?auto_10608 ) ) ( not ( = ?auto_10606 ?auto_10620 ) ) ( not ( = ?auto_10608 ?auto_10630 ) ) ( not ( = ?auto_10625 ?auto_10624 ) ) ( not ( = ?auto_10632 ?auto_10627 ) ) ( not ( = ?auto_10620 ?auto_10630 ) ) ( not ( = ?auto_10606 ?auto_10609 ) ) ( not ( = ?auto_10606 ?auto_10634 ) ) ( not ( = ?auto_10607 ?auto_10609 ) ) ( not ( = ?auto_10607 ?auto_10634 ) ) ( not ( = ?auto_10609 ?auto_10620 ) ) ( not ( = ?auto_10609 ?auto_10630 ) ) ( not ( = ?auto_10626 ?auto_10625 ) ) ( not ( = ?auto_10626 ?auto_10624 ) ) ( not ( = ?auto_10629 ?auto_10632 ) ) ( not ( = ?auto_10629 ?auto_10627 ) ) ( not ( = ?auto_10634 ?auto_10620 ) ) ( not ( = ?auto_10634 ?auto_10630 ) ) ( not ( = ?auto_10606 ?auto_10610 ) ) ( not ( = ?auto_10606 ?auto_10633 ) ) ( not ( = ?auto_10607 ?auto_10610 ) ) ( not ( = ?auto_10607 ?auto_10633 ) ) ( not ( = ?auto_10608 ?auto_10610 ) ) ( not ( = ?auto_10608 ?auto_10633 ) ) ( not ( = ?auto_10610 ?auto_10634 ) ) ( not ( = ?auto_10610 ?auto_10620 ) ) ( not ( = ?auto_10610 ?auto_10630 ) ) ( not ( = ?auto_10621 ?auto_10626 ) ) ( not ( = ?auto_10621 ?auto_10625 ) ) ( not ( = ?auto_10621 ?auto_10624 ) ) ( not ( = ?auto_10631 ?auto_10629 ) ) ( not ( = ?auto_10631 ?auto_10632 ) ) ( not ( = ?auto_10631 ?auto_10627 ) ) ( not ( = ?auto_10633 ?auto_10634 ) ) ( not ( = ?auto_10633 ?auto_10620 ) ) ( not ( = ?auto_10633 ?auto_10630 ) ) ( not ( = ?auto_10606 ?auto_10611 ) ) ( not ( = ?auto_10606 ?auto_10628 ) ) ( not ( = ?auto_10607 ?auto_10611 ) ) ( not ( = ?auto_10607 ?auto_10628 ) ) ( not ( = ?auto_10608 ?auto_10611 ) ) ( not ( = ?auto_10608 ?auto_10628 ) ) ( not ( = ?auto_10609 ?auto_10611 ) ) ( not ( = ?auto_10609 ?auto_10628 ) ) ( not ( = ?auto_10611 ?auto_10633 ) ) ( not ( = ?auto_10611 ?auto_10634 ) ) ( not ( = ?auto_10611 ?auto_10620 ) ) ( not ( = ?auto_10611 ?auto_10630 ) ) ( not ( = ?auto_10628 ?auto_10633 ) ) ( not ( = ?auto_10628 ?auto_10634 ) ) ( not ( = ?auto_10628 ?auto_10620 ) ) ( not ( = ?auto_10628 ?auto_10630 ) ) ( not ( = ?auto_10606 ?auto_10612 ) ) ( not ( = ?auto_10606 ?auto_10622 ) ) ( not ( = ?auto_10607 ?auto_10612 ) ) ( not ( = ?auto_10607 ?auto_10622 ) ) ( not ( = ?auto_10608 ?auto_10612 ) ) ( not ( = ?auto_10608 ?auto_10622 ) ) ( not ( = ?auto_10609 ?auto_10612 ) ) ( not ( = ?auto_10609 ?auto_10622 ) ) ( not ( = ?auto_10610 ?auto_10612 ) ) ( not ( = ?auto_10610 ?auto_10622 ) ) ( not ( = ?auto_10612 ?auto_10628 ) ) ( not ( = ?auto_10612 ?auto_10633 ) ) ( not ( = ?auto_10612 ?auto_10634 ) ) ( not ( = ?auto_10612 ?auto_10620 ) ) ( not ( = ?auto_10612 ?auto_10630 ) ) ( not ( = ?auto_10623 ?auto_10624 ) ) ( not ( = ?auto_10623 ?auto_10621 ) ) ( not ( = ?auto_10623 ?auto_10626 ) ) ( not ( = ?auto_10623 ?auto_10625 ) ) ( not ( = ?auto_10635 ?auto_10627 ) ) ( not ( = ?auto_10635 ?auto_10631 ) ) ( not ( = ?auto_10635 ?auto_10629 ) ) ( not ( = ?auto_10635 ?auto_10632 ) ) ( not ( = ?auto_10622 ?auto_10628 ) ) ( not ( = ?auto_10622 ?auto_10633 ) ) ( not ( = ?auto_10622 ?auto_10634 ) ) ( not ( = ?auto_10622 ?auto_10620 ) ) ( not ( = ?auto_10622 ?auto_10630 ) ) ( not ( = ?auto_10606 ?auto_10613 ) ) ( not ( = ?auto_10606 ?auto_10614 ) ) ( not ( = ?auto_10607 ?auto_10613 ) ) ( not ( = ?auto_10607 ?auto_10614 ) ) ( not ( = ?auto_10608 ?auto_10613 ) ) ( not ( = ?auto_10608 ?auto_10614 ) ) ( not ( = ?auto_10609 ?auto_10613 ) ) ( not ( = ?auto_10609 ?auto_10614 ) ) ( not ( = ?auto_10610 ?auto_10613 ) ) ( not ( = ?auto_10610 ?auto_10614 ) ) ( not ( = ?auto_10611 ?auto_10613 ) ) ( not ( = ?auto_10611 ?auto_10614 ) ) ( not ( = ?auto_10613 ?auto_10622 ) ) ( not ( = ?auto_10613 ?auto_10628 ) ) ( not ( = ?auto_10613 ?auto_10633 ) ) ( not ( = ?auto_10613 ?auto_10634 ) ) ( not ( = ?auto_10613 ?auto_10620 ) ) ( not ( = ?auto_10613 ?auto_10630 ) ) ( not ( = ?auto_10616 ?auto_10623 ) ) ( not ( = ?auto_10616 ?auto_10624 ) ) ( not ( = ?auto_10616 ?auto_10621 ) ) ( not ( = ?auto_10616 ?auto_10626 ) ) ( not ( = ?auto_10616 ?auto_10625 ) ) ( not ( = ?auto_10618 ?auto_10635 ) ) ( not ( = ?auto_10618 ?auto_10627 ) ) ( not ( = ?auto_10618 ?auto_10631 ) ) ( not ( = ?auto_10618 ?auto_10629 ) ) ( not ( = ?auto_10618 ?auto_10632 ) ) ( not ( = ?auto_10614 ?auto_10622 ) ) ( not ( = ?auto_10614 ?auto_10628 ) ) ( not ( = ?auto_10614 ?auto_10633 ) ) ( not ( = ?auto_10614 ?auto_10634 ) ) ( not ( = ?auto_10614 ?auto_10620 ) ) ( not ( = ?auto_10614 ?auto_10630 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10606 ?auto_10607 ?auto_10608 ?auto_10609 ?auto_10610 ?auto_10611 ?auto_10612 )
      ( MAKE-1CRATE ?auto_10612 ?auto_10613 )
      ( MAKE-7CRATE-VERIFY ?auto_10606 ?auto_10607 ?auto_10608 ?auto_10609 ?auto_10610 ?auto_10611 ?auto_10612 ?auto_10613 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10638 - SURFACE
      ?auto_10639 - SURFACE
    )
    :vars
    (
      ?auto_10640 - HOIST
      ?auto_10641 - PLACE
      ?auto_10643 - PLACE
      ?auto_10644 - HOIST
      ?auto_10645 - SURFACE
      ?auto_10642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10640 ?auto_10641 ) ( SURFACE-AT ?auto_10638 ?auto_10641 ) ( CLEAR ?auto_10638 ) ( IS-CRATE ?auto_10639 ) ( AVAILABLE ?auto_10640 ) ( not ( = ?auto_10643 ?auto_10641 ) ) ( HOIST-AT ?auto_10644 ?auto_10643 ) ( AVAILABLE ?auto_10644 ) ( SURFACE-AT ?auto_10639 ?auto_10643 ) ( ON ?auto_10639 ?auto_10645 ) ( CLEAR ?auto_10639 ) ( TRUCK-AT ?auto_10642 ?auto_10641 ) ( not ( = ?auto_10638 ?auto_10639 ) ) ( not ( = ?auto_10638 ?auto_10645 ) ) ( not ( = ?auto_10639 ?auto_10645 ) ) ( not ( = ?auto_10640 ?auto_10644 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10642 ?auto_10641 ?auto_10643 )
      ( !LIFT ?auto_10644 ?auto_10639 ?auto_10645 ?auto_10643 )
      ( !LOAD ?auto_10644 ?auto_10639 ?auto_10642 ?auto_10643 )
      ( !DRIVE ?auto_10642 ?auto_10643 ?auto_10641 )
      ( !UNLOAD ?auto_10640 ?auto_10639 ?auto_10642 ?auto_10641 )
      ( !DROP ?auto_10640 ?auto_10639 ?auto_10638 ?auto_10641 )
      ( MAKE-1CRATE-VERIFY ?auto_10638 ?auto_10639 ) )
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
      ?auto_10663 - SURFACE
      ?auto_10662 - SURFACE
    )
    :vars
    (
      ?auto_10667 - HOIST
      ?auto_10666 - PLACE
      ?auto_10669 - PLACE
      ?auto_10664 - HOIST
      ?auto_10665 - SURFACE
      ?auto_10688 - PLACE
      ?auto_10687 - HOIST
      ?auto_10670 - SURFACE
      ?auto_10675 - PLACE
      ?auto_10673 - HOIST
      ?auto_10671 - SURFACE
      ?auto_10686 - PLACE
      ?auto_10683 - HOIST
      ?auto_10677 - SURFACE
      ?auto_10676 - PLACE
      ?auto_10680 - HOIST
      ?auto_10682 - SURFACE
      ?auto_10684 - PLACE
      ?auto_10679 - HOIST
      ?auto_10674 - SURFACE
      ?auto_10685 - PLACE
      ?auto_10681 - HOIST
      ?auto_10672 - SURFACE
      ?auto_10678 - SURFACE
      ?auto_10668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10667 ?auto_10666 ) ( IS-CRATE ?auto_10662 ) ( not ( = ?auto_10669 ?auto_10666 ) ) ( HOIST-AT ?auto_10664 ?auto_10669 ) ( AVAILABLE ?auto_10664 ) ( SURFACE-AT ?auto_10662 ?auto_10669 ) ( ON ?auto_10662 ?auto_10665 ) ( CLEAR ?auto_10662 ) ( not ( = ?auto_10663 ?auto_10662 ) ) ( not ( = ?auto_10663 ?auto_10665 ) ) ( not ( = ?auto_10662 ?auto_10665 ) ) ( not ( = ?auto_10667 ?auto_10664 ) ) ( IS-CRATE ?auto_10663 ) ( not ( = ?auto_10688 ?auto_10666 ) ) ( HOIST-AT ?auto_10687 ?auto_10688 ) ( AVAILABLE ?auto_10687 ) ( SURFACE-AT ?auto_10663 ?auto_10688 ) ( ON ?auto_10663 ?auto_10670 ) ( CLEAR ?auto_10663 ) ( not ( = ?auto_10661 ?auto_10663 ) ) ( not ( = ?auto_10661 ?auto_10670 ) ) ( not ( = ?auto_10663 ?auto_10670 ) ) ( not ( = ?auto_10667 ?auto_10687 ) ) ( IS-CRATE ?auto_10661 ) ( not ( = ?auto_10675 ?auto_10666 ) ) ( HOIST-AT ?auto_10673 ?auto_10675 ) ( AVAILABLE ?auto_10673 ) ( SURFACE-AT ?auto_10661 ?auto_10675 ) ( ON ?auto_10661 ?auto_10671 ) ( CLEAR ?auto_10661 ) ( not ( = ?auto_10660 ?auto_10661 ) ) ( not ( = ?auto_10660 ?auto_10671 ) ) ( not ( = ?auto_10661 ?auto_10671 ) ) ( not ( = ?auto_10667 ?auto_10673 ) ) ( IS-CRATE ?auto_10660 ) ( not ( = ?auto_10686 ?auto_10666 ) ) ( HOIST-AT ?auto_10683 ?auto_10686 ) ( SURFACE-AT ?auto_10660 ?auto_10686 ) ( ON ?auto_10660 ?auto_10677 ) ( CLEAR ?auto_10660 ) ( not ( = ?auto_10659 ?auto_10660 ) ) ( not ( = ?auto_10659 ?auto_10677 ) ) ( not ( = ?auto_10660 ?auto_10677 ) ) ( not ( = ?auto_10667 ?auto_10683 ) ) ( IS-CRATE ?auto_10659 ) ( not ( = ?auto_10676 ?auto_10666 ) ) ( HOIST-AT ?auto_10680 ?auto_10676 ) ( AVAILABLE ?auto_10680 ) ( SURFACE-AT ?auto_10659 ?auto_10676 ) ( ON ?auto_10659 ?auto_10682 ) ( CLEAR ?auto_10659 ) ( not ( = ?auto_10658 ?auto_10659 ) ) ( not ( = ?auto_10658 ?auto_10682 ) ) ( not ( = ?auto_10659 ?auto_10682 ) ) ( not ( = ?auto_10667 ?auto_10680 ) ) ( IS-CRATE ?auto_10658 ) ( not ( = ?auto_10684 ?auto_10666 ) ) ( HOIST-AT ?auto_10679 ?auto_10684 ) ( AVAILABLE ?auto_10679 ) ( SURFACE-AT ?auto_10658 ?auto_10684 ) ( ON ?auto_10658 ?auto_10674 ) ( CLEAR ?auto_10658 ) ( not ( = ?auto_10657 ?auto_10658 ) ) ( not ( = ?auto_10657 ?auto_10674 ) ) ( not ( = ?auto_10658 ?auto_10674 ) ) ( not ( = ?auto_10667 ?auto_10679 ) ) ( IS-CRATE ?auto_10657 ) ( not ( = ?auto_10685 ?auto_10666 ) ) ( HOIST-AT ?auto_10681 ?auto_10685 ) ( AVAILABLE ?auto_10681 ) ( SURFACE-AT ?auto_10657 ?auto_10685 ) ( ON ?auto_10657 ?auto_10672 ) ( CLEAR ?auto_10657 ) ( not ( = ?auto_10656 ?auto_10657 ) ) ( not ( = ?auto_10656 ?auto_10672 ) ) ( not ( = ?auto_10657 ?auto_10672 ) ) ( not ( = ?auto_10667 ?auto_10681 ) ) ( SURFACE-AT ?auto_10655 ?auto_10666 ) ( CLEAR ?auto_10655 ) ( IS-CRATE ?auto_10656 ) ( AVAILABLE ?auto_10667 ) ( AVAILABLE ?auto_10683 ) ( SURFACE-AT ?auto_10656 ?auto_10686 ) ( ON ?auto_10656 ?auto_10678 ) ( CLEAR ?auto_10656 ) ( TRUCK-AT ?auto_10668 ?auto_10666 ) ( not ( = ?auto_10655 ?auto_10656 ) ) ( not ( = ?auto_10655 ?auto_10678 ) ) ( not ( = ?auto_10656 ?auto_10678 ) ) ( not ( = ?auto_10655 ?auto_10657 ) ) ( not ( = ?auto_10655 ?auto_10672 ) ) ( not ( = ?auto_10657 ?auto_10678 ) ) ( not ( = ?auto_10685 ?auto_10686 ) ) ( not ( = ?auto_10681 ?auto_10683 ) ) ( not ( = ?auto_10672 ?auto_10678 ) ) ( not ( = ?auto_10655 ?auto_10658 ) ) ( not ( = ?auto_10655 ?auto_10674 ) ) ( not ( = ?auto_10656 ?auto_10658 ) ) ( not ( = ?auto_10656 ?auto_10674 ) ) ( not ( = ?auto_10658 ?auto_10672 ) ) ( not ( = ?auto_10658 ?auto_10678 ) ) ( not ( = ?auto_10684 ?auto_10685 ) ) ( not ( = ?auto_10684 ?auto_10686 ) ) ( not ( = ?auto_10679 ?auto_10681 ) ) ( not ( = ?auto_10679 ?auto_10683 ) ) ( not ( = ?auto_10674 ?auto_10672 ) ) ( not ( = ?auto_10674 ?auto_10678 ) ) ( not ( = ?auto_10655 ?auto_10659 ) ) ( not ( = ?auto_10655 ?auto_10682 ) ) ( not ( = ?auto_10656 ?auto_10659 ) ) ( not ( = ?auto_10656 ?auto_10682 ) ) ( not ( = ?auto_10657 ?auto_10659 ) ) ( not ( = ?auto_10657 ?auto_10682 ) ) ( not ( = ?auto_10659 ?auto_10674 ) ) ( not ( = ?auto_10659 ?auto_10672 ) ) ( not ( = ?auto_10659 ?auto_10678 ) ) ( not ( = ?auto_10676 ?auto_10684 ) ) ( not ( = ?auto_10676 ?auto_10685 ) ) ( not ( = ?auto_10676 ?auto_10686 ) ) ( not ( = ?auto_10680 ?auto_10679 ) ) ( not ( = ?auto_10680 ?auto_10681 ) ) ( not ( = ?auto_10680 ?auto_10683 ) ) ( not ( = ?auto_10682 ?auto_10674 ) ) ( not ( = ?auto_10682 ?auto_10672 ) ) ( not ( = ?auto_10682 ?auto_10678 ) ) ( not ( = ?auto_10655 ?auto_10660 ) ) ( not ( = ?auto_10655 ?auto_10677 ) ) ( not ( = ?auto_10656 ?auto_10660 ) ) ( not ( = ?auto_10656 ?auto_10677 ) ) ( not ( = ?auto_10657 ?auto_10660 ) ) ( not ( = ?auto_10657 ?auto_10677 ) ) ( not ( = ?auto_10658 ?auto_10660 ) ) ( not ( = ?auto_10658 ?auto_10677 ) ) ( not ( = ?auto_10660 ?auto_10682 ) ) ( not ( = ?auto_10660 ?auto_10674 ) ) ( not ( = ?auto_10660 ?auto_10672 ) ) ( not ( = ?auto_10660 ?auto_10678 ) ) ( not ( = ?auto_10677 ?auto_10682 ) ) ( not ( = ?auto_10677 ?auto_10674 ) ) ( not ( = ?auto_10677 ?auto_10672 ) ) ( not ( = ?auto_10677 ?auto_10678 ) ) ( not ( = ?auto_10655 ?auto_10661 ) ) ( not ( = ?auto_10655 ?auto_10671 ) ) ( not ( = ?auto_10656 ?auto_10661 ) ) ( not ( = ?auto_10656 ?auto_10671 ) ) ( not ( = ?auto_10657 ?auto_10661 ) ) ( not ( = ?auto_10657 ?auto_10671 ) ) ( not ( = ?auto_10658 ?auto_10661 ) ) ( not ( = ?auto_10658 ?auto_10671 ) ) ( not ( = ?auto_10659 ?auto_10661 ) ) ( not ( = ?auto_10659 ?auto_10671 ) ) ( not ( = ?auto_10661 ?auto_10677 ) ) ( not ( = ?auto_10661 ?auto_10682 ) ) ( not ( = ?auto_10661 ?auto_10674 ) ) ( not ( = ?auto_10661 ?auto_10672 ) ) ( not ( = ?auto_10661 ?auto_10678 ) ) ( not ( = ?auto_10675 ?auto_10686 ) ) ( not ( = ?auto_10675 ?auto_10676 ) ) ( not ( = ?auto_10675 ?auto_10684 ) ) ( not ( = ?auto_10675 ?auto_10685 ) ) ( not ( = ?auto_10673 ?auto_10683 ) ) ( not ( = ?auto_10673 ?auto_10680 ) ) ( not ( = ?auto_10673 ?auto_10679 ) ) ( not ( = ?auto_10673 ?auto_10681 ) ) ( not ( = ?auto_10671 ?auto_10677 ) ) ( not ( = ?auto_10671 ?auto_10682 ) ) ( not ( = ?auto_10671 ?auto_10674 ) ) ( not ( = ?auto_10671 ?auto_10672 ) ) ( not ( = ?auto_10671 ?auto_10678 ) ) ( not ( = ?auto_10655 ?auto_10663 ) ) ( not ( = ?auto_10655 ?auto_10670 ) ) ( not ( = ?auto_10656 ?auto_10663 ) ) ( not ( = ?auto_10656 ?auto_10670 ) ) ( not ( = ?auto_10657 ?auto_10663 ) ) ( not ( = ?auto_10657 ?auto_10670 ) ) ( not ( = ?auto_10658 ?auto_10663 ) ) ( not ( = ?auto_10658 ?auto_10670 ) ) ( not ( = ?auto_10659 ?auto_10663 ) ) ( not ( = ?auto_10659 ?auto_10670 ) ) ( not ( = ?auto_10660 ?auto_10663 ) ) ( not ( = ?auto_10660 ?auto_10670 ) ) ( not ( = ?auto_10663 ?auto_10671 ) ) ( not ( = ?auto_10663 ?auto_10677 ) ) ( not ( = ?auto_10663 ?auto_10682 ) ) ( not ( = ?auto_10663 ?auto_10674 ) ) ( not ( = ?auto_10663 ?auto_10672 ) ) ( not ( = ?auto_10663 ?auto_10678 ) ) ( not ( = ?auto_10688 ?auto_10675 ) ) ( not ( = ?auto_10688 ?auto_10686 ) ) ( not ( = ?auto_10688 ?auto_10676 ) ) ( not ( = ?auto_10688 ?auto_10684 ) ) ( not ( = ?auto_10688 ?auto_10685 ) ) ( not ( = ?auto_10687 ?auto_10673 ) ) ( not ( = ?auto_10687 ?auto_10683 ) ) ( not ( = ?auto_10687 ?auto_10680 ) ) ( not ( = ?auto_10687 ?auto_10679 ) ) ( not ( = ?auto_10687 ?auto_10681 ) ) ( not ( = ?auto_10670 ?auto_10671 ) ) ( not ( = ?auto_10670 ?auto_10677 ) ) ( not ( = ?auto_10670 ?auto_10682 ) ) ( not ( = ?auto_10670 ?auto_10674 ) ) ( not ( = ?auto_10670 ?auto_10672 ) ) ( not ( = ?auto_10670 ?auto_10678 ) ) ( not ( = ?auto_10655 ?auto_10662 ) ) ( not ( = ?auto_10655 ?auto_10665 ) ) ( not ( = ?auto_10656 ?auto_10662 ) ) ( not ( = ?auto_10656 ?auto_10665 ) ) ( not ( = ?auto_10657 ?auto_10662 ) ) ( not ( = ?auto_10657 ?auto_10665 ) ) ( not ( = ?auto_10658 ?auto_10662 ) ) ( not ( = ?auto_10658 ?auto_10665 ) ) ( not ( = ?auto_10659 ?auto_10662 ) ) ( not ( = ?auto_10659 ?auto_10665 ) ) ( not ( = ?auto_10660 ?auto_10662 ) ) ( not ( = ?auto_10660 ?auto_10665 ) ) ( not ( = ?auto_10661 ?auto_10662 ) ) ( not ( = ?auto_10661 ?auto_10665 ) ) ( not ( = ?auto_10662 ?auto_10670 ) ) ( not ( = ?auto_10662 ?auto_10671 ) ) ( not ( = ?auto_10662 ?auto_10677 ) ) ( not ( = ?auto_10662 ?auto_10682 ) ) ( not ( = ?auto_10662 ?auto_10674 ) ) ( not ( = ?auto_10662 ?auto_10672 ) ) ( not ( = ?auto_10662 ?auto_10678 ) ) ( not ( = ?auto_10669 ?auto_10688 ) ) ( not ( = ?auto_10669 ?auto_10675 ) ) ( not ( = ?auto_10669 ?auto_10686 ) ) ( not ( = ?auto_10669 ?auto_10676 ) ) ( not ( = ?auto_10669 ?auto_10684 ) ) ( not ( = ?auto_10669 ?auto_10685 ) ) ( not ( = ?auto_10664 ?auto_10687 ) ) ( not ( = ?auto_10664 ?auto_10673 ) ) ( not ( = ?auto_10664 ?auto_10683 ) ) ( not ( = ?auto_10664 ?auto_10680 ) ) ( not ( = ?auto_10664 ?auto_10679 ) ) ( not ( = ?auto_10664 ?auto_10681 ) ) ( not ( = ?auto_10665 ?auto_10670 ) ) ( not ( = ?auto_10665 ?auto_10671 ) ) ( not ( = ?auto_10665 ?auto_10677 ) ) ( not ( = ?auto_10665 ?auto_10682 ) ) ( not ( = ?auto_10665 ?auto_10674 ) ) ( not ( = ?auto_10665 ?auto_10672 ) ) ( not ( = ?auto_10665 ?auto_10678 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10655 ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10661 ?auto_10663 )
      ( MAKE-1CRATE ?auto_10663 ?auto_10662 )
      ( MAKE-8CRATE-VERIFY ?auto_10655 ?auto_10656 ?auto_10657 ?auto_10658 ?auto_10659 ?auto_10660 ?auto_10661 ?auto_10663 ?auto_10662 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10691 - SURFACE
      ?auto_10692 - SURFACE
    )
    :vars
    (
      ?auto_10693 - HOIST
      ?auto_10694 - PLACE
      ?auto_10696 - PLACE
      ?auto_10697 - HOIST
      ?auto_10698 - SURFACE
      ?auto_10695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10693 ?auto_10694 ) ( SURFACE-AT ?auto_10691 ?auto_10694 ) ( CLEAR ?auto_10691 ) ( IS-CRATE ?auto_10692 ) ( AVAILABLE ?auto_10693 ) ( not ( = ?auto_10696 ?auto_10694 ) ) ( HOIST-AT ?auto_10697 ?auto_10696 ) ( AVAILABLE ?auto_10697 ) ( SURFACE-AT ?auto_10692 ?auto_10696 ) ( ON ?auto_10692 ?auto_10698 ) ( CLEAR ?auto_10692 ) ( TRUCK-AT ?auto_10695 ?auto_10694 ) ( not ( = ?auto_10691 ?auto_10692 ) ) ( not ( = ?auto_10691 ?auto_10698 ) ) ( not ( = ?auto_10692 ?auto_10698 ) ) ( not ( = ?auto_10693 ?auto_10697 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10695 ?auto_10694 ?auto_10696 )
      ( !LIFT ?auto_10697 ?auto_10692 ?auto_10698 ?auto_10696 )
      ( !LOAD ?auto_10697 ?auto_10692 ?auto_10695 ?auto_10696 )
      ( !DRIVE ?auto_10695 ?auto_10696 ?auto_10694 )
      ( !UNLOAD ?auto_10693 ?auto_10692 ?auto_10695 ?auto_10694 )
      ( !DROP ?auto_10693 ?auto_10692 ?auto_10691 ?auto_10694 )
      ( MAKE-1CRATE-VERIFY ?auto_10691 ?auto_10692 ) )
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
      ?auto_10718 - SURFACE
      ?auto_10717 - SURFACE
      ?auto_10716 - SURFACE
    )
    :vars
    (
      ?auto_10723 - HOIST
      ?auto_10719 - PLACE
      ?auto_10722 - PLACE
      ?auto_10724 - HOIST
      ?auto_10720 - SURFACE
      ?auto_10742 - PLACE
      ?auto_10741 - HOIST
      ?auto_10746 - SURFACE
      ?auto_10728 - PLACE
      ?auto_10725 - HOIST
      ?auto_10726 - SURFACE
      ?auto_10738 - PLACE
      ?auto_10740 - HOIST
      ?auto_10745 - SURFACE
      ?auto_10727 - PLACE
      ?auto_10735 - HOIST
      ?auto_10736 - SURFACE
      ?auto_10737 - PLACE
      ?auto_10731 - HOIST
      ?auto_10734 - SURFACE
      ?auto_10744 - PLACE
      ?auto_10732 - HOIST
      ?auto_10739 - SURFACE
      ?auto_10729 - PLACE
      ?auto_10733 - HOIST
      ?auto_10743 - SURFACE
      ?auto_10730 - SURFACE
      ?auto_10721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10723 ?auto_10719 ) ( IS-CRATE ?auto_10716 ) ( not ( = ?auto_10722 ?auto_10719 ) ) ( HOIST-AT ?auto_10724 ?auto_10722 ) ( AVAILABLE ?auto_10724 ) ( SURFACE-AT ?auto_10716 ?auto_10722 ) ( ON ?auto_10716 ?auto_10720 ) ( CLEAR ?auto_10716 ) ( not ( = ?auto_10717 ?auto_10716 ) ) ( not ( = ?auto_10717 ?auto_10720 ) ) ( not ( = ?auto_10716 ?auto_10720 ) ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( IS-CRATE ?auto_10717 ) ( not ( = ?auto_10742 ?auto_10719 ) ) ( HOIST-AT ?auto_10741 ?auto_10742 ) ( AVAILABLE ?auto_10741 ) ( SURFACE-AT ?auto_10717 ?auto_10742 ) ( ON ?auto_10717 ?auto_10746 ) ( CLEAR ?auto_10717 ) ( not ( = ?auto_10718 ?auto_10717 ) ) ( not ( = ?auto_10718 ?auto_10746 ) ) ( not ( = ?auto_10717 ?auto_10746 ) ) ( not ( = ?auto_10723 ?auto_10741 ) ) ( IS-CRATE ?auto_10718 ) ( not ( = ?auto_10728 ?auto_10719 ) ) ( HOIST-AT ?auto_10725 ?auto_10728 ) ( AVAILABLE ?auto_10725 ) ( SURFACE-AT ?auto_10718 ?auto_10728 ) ( ON ?auto_10718 ?auto_10726 ) ( CLEAR ?auto_10718 ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( not ( = ?auto_10715 ?auto_10726 ) ) ( not ( = ?auto_10718 ?auto_10726 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( IS-CRATE ?auto_10715 ) ( not ( = ?auto_10738 ?auto_10719 ) ) ( HOIST-AT ?auto_10740 ?auto_10738 ) ( AVAILABLE ?auto_10740 ) ( SURFACE-AT ?auto_10715 ?auto_10738 ) ( ON ?auto_10715 ?auto_10745 ) ( CLEAR ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10715 ) ) ( not ( = ?auto_10714 ?auto_10745 ) ) ( not ( = ?auto_10715 ?auto_10745 ) ) ( not ( = ?auto_10723 ?auto_10740 ) ) ( IS-CRATE ?auto_10714 ) ( not ( = ?auto_10727 ?auto_10719 ) ) ( HOIST-AT ?auto_10735 ?auto_10727 ) ( SURFACE-AT ?auto_10714 ?auto_10727 ) ( ON ?auto_10714 ?auto_10736 ) ( CLEAR ?auto_10714 ) ( not ( = ?auto_10713 ?auto_10714 ) ) ( not ( = ?auto_10713 ?auto_10736 ) ) ( not ( = ?auto_10714 ?auto_10736 ) ) ( not ( = ?auto_10723 ?auto_10735 ) ) ( IS-CRATE ?auto_10713 ) ( not ( = ?auto_10737 ?auto_10719 ) ) ( HOIST-AT ?auto_10731 ?auto_10737 ) ( AVAILABLE ?auto_10731 ) ( SURFACE-AT ?auto_10713 ?auto_10737 ) ( ON ?auto_10713 ?auto_10734 ) ( CLEAR ?auto_10713 ) ( not ( = ?auto_10712 ?auto_10713 ) ) ( not ( = ?auto_10712 ?auto_10734 ) ) ( not ( = ?auto_10713 ?auto_10734 ) ) ( not ( = ?auto_10723 ?auto_10731 ) ) ( IS-CRATE ?auto_10712 ) ( not ( = ?auto_10744 ?auto_10719 ) ) ( HOIST-AT ?auto_10732 ?auto_10744 ) ( AVAILABLE ?auto_10732 ) ( SURFACE-AT ?auto_10712 ?auto_10744 ) ( ON ?auto_10712 ?auto_10739 ) ( CLEAR ?auto_10712 ) ( not ( = ?auto_10711 ?auto_10712 ) ) ( not ( = ?auto_10711 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10739 ) ) ( not ( = ?auto_10723 ?auto_10732 ) ) ( IS-CRATE ?auto_10711 ) ( not ( = ?auto_10729 ?auto_10719 ) ) ( HOIST-AT ?auto_10733 ?auto_10729 ) ( AVAILABLE ?auto_10733 ) ( SURFACE-AT ?auto_10711 ?auto_10729 ) ( ON ?auto_10711 ?auto_10743 ) ( CLEAR ?auto_10711 ) ( not ( = ?auto_10710 ?auto_10711 ) ) ( not ( = ?auto_10710 ?auto_10743 ) ) ( not ( = ?auto_10711 ?auto_10743 ) ) ( not ( = ?auto_10723 ?auto_10733 ) ) ( SURFACE-AT ?auto_10709 ?auto_10719 ) ( CLEAR ?auto_10709 ) ( IS-CRATE ?auto_10710 ) ( AVAILABLE ?auto_10723 ) ( AVAILABLE ?auto_10735 ) ( SURFACE-AT ?auto_10710 ?auto_10727 ) ( ON ?auto_10710 ?auto_10730 ) ( CLEAR ?auto_10710 ) ( TRUCK-AT ?auto_10721 ?auto_10719 ) ( not ( = ?auto_10709 ?auto_10710 ) ) ( not ( = ?auto_10709 ?auto_10730 ) ) ( not ( = ?auto_10710 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10711 ) ) ( not ( = ?auto_10709 ?auto_10743 ) ) ( not ( = ?auto_10711 ?auto_10730 ) ) ( not ( = ?auto_10729 ?auto_10727 ) ) ( not ( = ?auto_10733 ?auto_10735 ) ) ( not ( = ?auto_10743 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10712 ) ) ( not ( = ?auto_10709 ?auto_10739 ) ) ( not ( = ?auto_10710 ?auto_10712 ) ) ( not ( = ?auto_10710 ?auto_10739 ) ) ( not ( = ?auto_10712 ?auto_10743 ) ) ( not ( = ?auto_10712 ?auto_10730 ) ) ( not ( = ?auto_10744 ?auto_10729 ) ) ( not ( = ?auto_10744 ?auto_10727 ) ) ( not ( = ?auto_10732 ?auto_10733 ) ) ( not ( = ?auto_10732 ?auto_10735 ) ) ( not ( = ?auto_10739 ?auto_10743 ) ) ( not ( = ?auto_10739 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10713 ) ) ( not ( = ?auto_10709 ?auto_10734 ) ) ( not ( = ?auto_10710 ?auto_10713 ) ) ( not ( = ?auto_10710 ?auto_10734 ) ) ( not ( = ?auto_10711 ?auto_10713 ) ) ( not ( = ?auto_10711 ?auto_10734 ) ) ( not ( = ?auto_10713 ?auto_10739 ) ) ( not ( = ?auto_10713 ?auto_10743 ) ) ( not ( = ?auto_10713 ?auto_10730 ) ) ( not ( = ?auto_10737 ?auto_10744 ) ) ( not ( = ?auto_10737 ?auto_10729 ) ) ( not ( = ?auto_10737 ?auto_10727 ) ) ( not ( = ?auto_10731 ?auto_10732 ) ) ( not ( = ?auto_10731 ?auto_10733 ) ) ( not ( = ?auto_10731 ?auto_10735 ) ) ( not ( = ?auto_10734 ?auto_10739 ) ) ( not ( = ?auto_10734 ?auto_10743 ) ) ( not ( = ?auto_10734 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10714 ) ) ( not ( = ?auto_10709 ?auto_10736 ) ) ( not ( = ?auto_10710 ?auto_10714 ) ) ( not ( = ?auto_10710 ?auto_10736 ) ) ( not ( = ?auto_10711 ?auto_10714 ) ) ( not ( = ?auto_10711 ?auto_10736 ) ) ( not ( = ?auto_10712 ?auto_10714 ) ) ( not ( = ?auto_10712 ?auto_10736 ) ) ( not ( = ?auto_10714 ?auto_10734 ) ) ( not ( = ?auto_10714 ?auto_10739 ) ) ( not ( = ?auto_10714 ?auto_10743 ) ) ( not ( = ?auto_10714 ?auto_10730 ) ) ( not ( = ?auto_10736 ?auto_10734 ) ) ( not ( = ?auto_10736 ?auto_10739 ) ) ( not ( = ?auto_10736 ?auto_10743 ) ) ( not ( = ?auto_10736 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10715 ) ) ( not ( = ?auto_10709 ?auto_10745 ) ) ( not ( = ?auto_10710 ?auto_10715 ) ) ( not ( = ?auto_10710 ?auto_10745 ) ) ( not ( = ?auto_10711 ?auto_10715 ) ) ( not ( = ?auto_10711 ?auto_10745 ) ) ( not ( = ?auto_10712 ?auto_10715 ) ) ( not ( = ?auto_10712 ?auto_10745 ) ) ( not ( = ?auto_10713 ?auto_10715 ) ) ( not ( = ?auto_10713 ?auto_10745 ) ) ( not ( = ?auto_10715 ?auto_10736 ) ) ( not ( = ?auto_10715 ?auto_10734 ) ) ( not ( = ?auto_10715 ?auto_10739 ) ) ( not ( = ?auto_10715 ?auto_10743 ) ) ( not ( = ?auto_10715 ?auto_10730 ) ) ( not ( = ?auto_10738 ?auto_10727 ) ) ( not ( = ?auto_10738 ?auto_10737 ) ) ( not ( = ?auto_10738 ?auto_10744 ) ) ( not ( = ?auto_10738 ?auto_10729 ) ) ( not ( = ?auto_10740 ?auto_10735 ) ) ( not ( = ?auto_10740 ?auto_10731 ) ) ( not ( = ?auto_10740 ?auto_10732 ) ) ( not ( = ?auto_10740 ?auto_10733 ) ) ( not ( = ?auto_10745 ?auto_10736 ) ) ( not ( = ?auto_10745 ?auto_10734 ) ) ( not ( = ?auto_10745 ?auto_10739 ) ) ( not ( = ?auto_10745 ?auto_10743 ) ) ( not ( = ?auto_10745 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10718 ) ) ( not ( = ?auto_10709 ?auto_10726 ) ) ( not ( = ?auto_10710 ?auto_10718 ) ) ( not ( = ?auto_10710 ?auto_10726 ) ) ( not ( = ?auto_10711 ?auto_10718 ) ) ( not ( = ?auto_10711 ?auto_10726 ) ) ( not ( = ?auto_10712 ?auto_10718 ) ) ( not ( = ?auto_10712 ?auto_10726 ) ) ( not ( = ?auto_10713 ?auto_10718 ) ) ( not ( = ?auto_10713 ?auto_10726 ) ) ( not ( = ?auto_10714 ?auto_10718 ) ) ( not ( = ?auto_10714 ?auto_10726 ) ) ( not ( = ?auto_10718 ?auto_10745 ) ) ( not ( = ?auto_10718 ?auto_10736 ) ) ( not ( = ?auto_10718 ?auto_10734 ) ) ( not ( = ?auto_10718 ?auto_10739 ) ) ( not ( = ?auto_10718 ?auto_10743 ) ) ( not ( = ?auto_10718 ?auto_10730 ) ) ( not ( = ?auto_10728 ?auto_10738 ) ) ( not ( = ?auto_10728 ?auto_10727 ) ) ( not ( = ?auto_10728 ?auto_10737 ) ) ( not ( = ?auto_10728 ?auto_10744 ) ) ( not ( = ?auto_10728 ?auto_10729 ) ) ( not ( = ?auto_10725 ?auto_10740 ) ) ( not ( = ?auto_10725 ?auto_10735 ) ) ( not ( = ?auto_10725 ?auto_10731 ) ) ( not ( = ?auto_10725 ?auto_10732 ) ) ( not ( = ?auto_10725 ?auto_10733 ) ) ( not ( = ?auto_10726 ?auto_10745 ) ) ( not ( = ?auto_10726 ?auto_10736 ) ) ( not ( = ?auto_10726 ?auto_10734 ) ) ( not ( = ?auto_10726 ?auto_10739 ) ) ( not ( = ?auto_10726 ?auto_10743 ) ) ( not ( = ?auto_10726 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10717 ) ) ( not ( = ?auto_10709 ?auto_10746 ) ) ( not ( = ?auto_10710 ?auto_10717 ) ) ( not ( = ?auto_10710 ?auto_10746 ) ) ( not ( = ?auto_10711 ?auto_10717 ) ) ( not ( = ?auto_10711 ?auto_10746 ) ) ( not ( = ?auto_10712 ?auto_10717 ) ) ( not ( = ?auto_10712 ?auto_10746 ) ) ( not ( = ?auto_10713 ?auto_10717 ) ) ( not ( = ?auto_10713 ?auto_10746 ) ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10746 ) ) ( not ( = ?auto_10715 ?auto_10717 ) ) ( not ( = ?auto_10715 ?auto_10746 ) ) ( not ( = ?auto_10717 ?auto_10726 ) ) ( not ( = ?auto_10717 ?auto_10745 ) ) ( not ( = ?auto_10717 ?auto_10736 ) ) ( not ( = ?auto_10717 ?auto_10734 ) ) ( not ( = ?auto_10717 ?auto_10739 ) ) ( not ( = ?auto_10717 ?auto_10743 ) ) ( not ( = ?auto_10717 ?auto_10730 ) ) ( not ( = ?auto_10742 ?auto_10728 ) ) ( not ( = ?auto_10742 ?auto_10738 ) ) ( not ( = ?auto_10742 ?auto_10727 ) ) ( not ( = ?auto_10742 ?auto_10737 ) ) ( not ( = ?auto_10742 ?auto_10744 ) ) ( not ( = ?auto_10742 ?auto_10729 ) ) ( not ( = ?auto_10741 ?auto_10725 ) ) ( not ( = ?auto_10741 ?auto_10740 ) ) ( not ( = ?auto_10741 ?auto_10735 ) ) ( not ( = ?auto_10741 ?auto_10731 ) ) ( not ( = ?auto_10741 ?auto_10732 ) ) ( not ( = ?auto_10741 ?auto_10733 ) ) ( not ( = ?auto_10746 ?auto_10726 ) ) ( not ( = ?auto_10746 ?auto_10745 ) ) ( not ( = ?auto_10746 ?auto_10736 ) ) ( not ( = ?auto_10746 ?auto_10734 ) ) ( not ( = ?auto_10746 ?auto_10739 ) ) ( not ( = ?auto_10746 ?auto_10743 ) ) ( not ( = ?auto_10746 ?auto_10730 ) ) ( not ( = ?auto_10709 ?auto_10716 ) ) ( not ( = ?auto_10709 ?auto_10720 ) ) ( not ( = ?auto_10710 ?auto_10716 ) ) ( not ( = ?auto_10710 ?auto_10720 ) ) ( not ( = ?auto_10711 ?auto_10716 ) ) ( not ( = ?auto_10711 ?auto_10720 ) ) ( not ( = ?auto_10712 ?auto_10716 ) ) ( not ( = ?auto_10712 ?auto_10720 ) ) ( not ( = ?auto_10713 ?auto_10716 ) ) ( not ( = ?auto_10713 ?auto_10720 ) ) ( not ( = ?auto_10714 ?auto_10716 ) ) ( not ( = ?auto_10714 ?auto_10720 ) ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( not ( = ?auto_10715 ?auto_10720 ) ) ( not ( = ?auto_10718 ?auto_10716 ) ) ( not ( = ?auto_10718 ?auto_10720 ) ) ( not ( = ?auto_10716 ?auto_10746 ) ) ( not ( = ?auto_10716 ?auto_10726 ) ) ( not ( = ?auto_10716 ?auto_10745 ) ) ( not ( = ?auto_10716 ?auto_10736 ) ) ( not ( = ?auto_10716 ?auto_10734 ) ) ( not ( = ?auto_10716 ?auto_10739 ) ) ( not ( = ?auto_10716 ?auto_10743 ) ) ( not ( = ?auto_10716 ?auto_10730 ) ) ( not ( = ?auto_10722 ?auto_10742 ) ) ( not ( = ?auto_10722 ?auto_10728 ) ) ( not ( = ?auto_10722 ?auto_10738 ) ) ( not ( = ?auto_10722 ?auto_10727 ) ) ( not ( = ?auto_10722 ?auto_10737 ) ) ( not ( = ?auto_10722 ?auto_10744 ) ) ( not ( = ?auto_10722 ?auto_10729 ) ) ( not ( = ?auto_10724 ?auto_10741 ) ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10724 ?auto_10740 ) ) ( not ( = ?auto_10724 ?auto_10735 ) ) ( not ( = ?auto_10724 ?auto_10731 ) ) ( not ( = ?auto_10724 ?auto_10732 ) ) ( not ( = ?auto_10724 ?auto_10733 ) ) ( not ( = ?auto_10720 ?auto_10746 ) ) ( not ( = ?auto_10720 ?auto_10726 ) ) ( not ( = ?auto_10720 ?auto_10745 ) ) ( not ( = ?auto_10720 ?auto_10736 ) ) ( not ( = ?auto_10720 ?auto_10734 ) ) ( not ( = ?auto_10720 ?auto_10739 ) ) ( not ( = ?auto_10720 ?auto_10743 ) ) ( not ( = ?auto_10720 ?auto_10730 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_10709 ?auto_10710 ?auto_10711 ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10718 ?auto_10717 )
      ( MAKE-1CRATE ?auto_10717 ?auto_10716 )
      ( MAKE-9CRATE-VERIFY ?auto_10709 ?auto_10710 ?auto_10711 ?auto_10712 ?auto_10713 ?auto_10714 ?auto_10715 ?auto_10718 ?auto_10717 ?auto_10716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10749 - SURFACE
      ?auto_10750 - SURFACE
    )
    :vars
    (
      ?auto_10751 - HOIST
      ?auto_10752 - PLACE
      ?auto_10754 - PLACE
      ?auto_10755 - HOIST
      ?auto_10756 - SURFACE
      ?auto_10753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10751 ?auto_10752 ) ( SURFACE-AT ?auto_10749 ?auto_10752 ) ( CLEAR ?auto_10749 ) ( IS-CRATE ?auto_10750 ) ( AVAILABLE ?auto_10751 ) ( not ( = ?auto_10754 ?auto_10752 ) ) ( HOIST-AT ?auto_10755 ?auto_10754 ) ( AVAILABLE ?auto_10755 ) ( SURFACE-AT ?auto_10750 ?auto_10754 ) ( ON ?auto_10750 ?auto_10756 ) ( CLEAR ?auto_10750 ) ( TRUCK-AT ?auto_10753 ?auto_10752 ) ( not ( = ?auto_10749 ?auto_10750 ) ) ( not ( = ?auto_10749 ?auto_10756 ) ) ( not ( = ?auto_10750 ?auto_10756 ) ) ( not ( = ?auto_10751 ?auto_10755 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10753 ?auto_10752 ?auto_10754 )
      ( !LIFT ?auto_10755 ?auto_10750 ?auto_10756 ?auto_10754 )
      ( !LOAD ?auto_10755 ?auto_10750 ?auto_10753 ?auto_10754 )
      ( !DRIVE ?auto_10753 ?auto_10754 ?auto_10752 )
      ( !UNLOAD ?auto_10751 ?auto_10750 ?auto_10753 ?auto_10752 )
      ( !DROP ?auto_10751 ?auto_10750 ?auto_10749 ?auto_10752 )
      ( MAKE-1CRATE-VERIFY ?auto_10749 ?auto_10750 ) )
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
      ?auto_10777 - SURFACE
      ?auto_10776 - SURFACE
      ?auto_10775 - SURFACE
      ?auto_10778 - SURFACE
    )
    :vars
    (
      ?auto_10784 - HOIST
      ?auto_10779 - PLACE
      ?auto_10782 - PLACE
      ?auto_10781 - HOIST
      ?auto_10783 - SURFACE
      ?auto_10788 - PLACE
      ?auto_10807 - HOIST
      ?auto_10786 - SURFACE
      ?auto_10798 - PLACE
      ?auto_10797 - HOIST
      ?auto_10802 - SURFACE
      ?auto_10785 - PLACE
      ?auto_10789 - HOIST
      ?auto_10790 - SURFACE
      ?auto_10801 - PLACE
      ?auto_10800 - HOIST
      ?auto_10795 - SURFACE
      ?auto_10799 - SURFACE
      ?auto_10804 - PLACE
      ?auto_10792 - HOIST
      ?auto_10805 - SURFACE
      ?auto_10796 - PLACE
      ?auto_10791 - HOIST
      ?auto_10787 - SURFACE
      ?auto_10794 - PLACE
      ?auto_10803 - HOIST
      ?auto_10806 - SURFACE
      ?auto_10793 - SURFACE
      ?auto_10780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10784 ?auto_10779 ) ( IS-CRATE ?auto_10778 ) ( not ( = ?auto_10782 ?auto_10779 ) ) ( HOIST-AT ?auto_10781 ?auto_10782 ) ( SURFACE-AT ?auto_10778 ?auto_10782 ) ( ON ?auto_10778 ?auto_10783 ) ( CLEAR ?auto_10778 ) ( not ( = ?auto_10775 ?auto_10778 ) ) ( not ( = ?auto_10775 ?auto_10783 ) ) ( not ( = ?auto_10778 ?auto_10783 ) ) ( not ( = ?auto_10784 ?auto_10781 ) ) ( IS-CRATE ?auto_10775 ) ( not ( = ?auto_10788 ?auto_10779 ) ) ( HOIST-AT ?auto_10807 ?auto_10788 ) ( AVAILABLE ?auto_10807 ) ( SURFACE-AT ?auto_10775 ?auto_10788 ) ( ON ?auto_10775 ?auto_10786 ) ( CLEAR ?auto_10775 ) ( not ( = ?auto_10776 ?auto_10775 ) ) ( not ( = ?auto_10776 ?auto_10786 ) ) ( not ( = ?auto_10775 ?auto_10786 ) ) ( not ( = ?auto_10784 ?auto_10807 ) ) ( IS-CRATE ?auto_10776 ) ( not ( = ?auto_10798 ?auto_10779 ) ) ( HOIST-AT ?auto_10797 ?auto_10798 ) ( AVAILABLE ?auto_10797 ) ( SURFACE-AT ?auto_10776 ?auto_10798 ) ( ON ?auto_10776 ?auto_10802 ) ( CLEAR ?auto_10776 ) ( not ( = ?auto_10777 ?auto_10776 ) ) ( not ( = ?auto_10777 ?auto_10802 ) ) ( not ( = ?auto_10776 ?auto_10802 ) ) ( not ( = ?auto_10784 ?auto_10797 ) ) ( IS-CRATE ?auto_10777 ) ( not ( = ?auto_10785 ?auto_10779 ) ) ( HOIST-AT ?auto_10789 ?auto_10785 ) ( AVAILABLE ?auto_10789 ) ( SURFACE-AT ?auto_10777 ?auto_10785 ) ( ON ?auto_10777 ?auto_10790 ) ( CLEAR ?auto_10777 ) ( not ( = ?auto_10774 ?auto_10777 ) ) ( not ( = ?auto_10774 ?auto_10790 ) ) ( not ( = ?auto_10777 ?auto_10790 ) ) ( not ( = ?auto_10784 ?auto_10789 ) ) ( IS-CRATE ?auto_10774 ) ( not ( = ?auto_10801 ?auto_10779 ) ) ( HOIST-AT ?auto_10800 ?auto_10801 ) ( AVAILABLE ?auto_10800 ) ( SURFACE-AT ?auto_10774 ?auto_10801 ) ( ON ?auto_10774 ?auto_10795 ) ( CLEAR ?auto_10774 ) ( not ( = ?auto_10773 ?auto_10774 ) ) ( not ( = ?auto_10773 ?auto_10795 ) ) ( not ( = ?auto_10774 ?auto_10795 ) ) ( not ( = ?auto_10784 ?auto_10800 ) ) ( IS-CRATE ?auto_10773 ) ( SURFACE-AT ?auto_10773 ?auto_10782 ) ( ON ?auto_10773 ?auto_10799 ) ( CLEAR ?auto_10773 ) ( not ( = ?auto_10772 ?auto_10773 ) ) ( not ( = ?auto_10772 ?auto_10799 ) ) ( not ( = ?auto_10773 ?auto_10799 ) ) ( IS-CRATE ?auto_10772 ) ( not ( = ?auto_10804 ?auto_10779 ) ) ( HOIST-AT ?auto_10792 ?auto_10804 ) ( AVAILABLE ?auto_10792 ) ( SURFACE-AT ?auto_10772 ?auto_10804 ) ( ON ?auto_10772 ?auto_10805 ) ( CLEAR ?auto_10772 ) ( not ( = ?auto_10771 ?auto_10772 ) ) ( not ( = ?auto_10771 ?auto_10805 ) ) ( not ( = ?auto_10772 ?auto_10805 ) ) ( not ( = ?auto_10784 ?auto_10792 ) ) ( IS-CRATE ?auto_10771 ) ( not ( = ?auto_10796 ?auto_10779 ) ) ( HOIST-AT ?auto_10791 ?auto_10796 ) ( AVAILABLE ?auto_10791 ) ( SURFACE-AT ?auto_10771 ?auto_10796 ) ( ON ?auto_10771 ?auto_10787 ) ( CLEAR ?auto_10771 ) ( not ( = ?auto_10770 ?auto_10771 ) ) ( not ( = ?auto_10770 ?auto_10787 ) ) ( not ( = ?auto_10771 ?auto_10787 ) ) ( not ( = ?auto_10784 ?auto_10791 ) ) ( IS-CRATE ?auto_10770 ) ( not ( = ?auto_10794 ?auto_10779 ) ) ( HOIST-AT ?auto_10803 ?auto_10794 ) ( AVAILABLE ?auto_10803 ) ( SURFACE-AT ?auto_10770 ?auto_10794 ) ( ON ?auto_10770 ?auto_10806 ) ( CLEAR ?auto_10770 ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( not ( = ?auto_10769 ?auto_10806 ) ) ( not ( = ?auto_10770 ?auto_10806 ) ) ( not ( = ?auto_10784 ?auto_10803 ) ) ( SURFACE-AT ?auto_10768 ?auto_10779 ) ( CLEAR ?auto_10768 ) ( IS-CRATE ?auto_10769 ) ( AVAILABLE ?auto_10784 ) ( AVAILABLE ?auto_10781 ) ( SURFACE-AT ?auto_10769 ?auto_10782 ) ( ON ?auto_10769 ?auto_10793 ) ( CLEAR ?auto_10769 ) ( TRUCK-AT ?auto_10780 ?auto_10779 ) ( not ( = ?auto_10768 ?auto_10769 ) ) ( not ( = ?auto_10768 ?auto_10793 ) ) ( not ( = ?auto_10769 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10770 ) ) ( not ( = ?auto_10768 ?auto_10806 ) ) ( not ( = ?auto_10770 ?auto_10793 ) ) ( not ( = ?auto_10794 ?auto_10782 ) ) ( not ( = ?auto_10803 ?auto_10781 ) ) ( not ( = ?auto_10806 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10771 ) ) ( not ( = ?auto_10768 ?auto_10787 ) ) ( not ( = ?auto_10769 ?auto_10771 ) ) ( not ( = ?auto_10769 ?auto_10787 ) ) ( not ( = ?auto_10771 ?auto_10806 ) ) ( not ( = ?auto_10771 ?auto_10793 ) ) ( not ( = ?auto_10796 ?auto_10794 ) ) ( not ( = ?auto_10796 ?auto_10782 ) ) ( not ( = ?auto_10791 ?auto_10803 ) ) ( not ( = ?auto_10791 ?auto_10781 ) ) ( not ( = ?auto_10787 ?auto_10806 ) ) ( not ( = ?auto_10787 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10772 ) ) ( not ( = ?auto_10768 ?auto_10805 ) ) ( not ( = ?auto_10769 ?auto_10772 ) ) ( not ( = ?auto_10769 ?auto_10805 ) ) ( not ( = ?auto_10770 ?auto_10772 ) ) ( not ( = ?auto_10770 ?auto_10805 ) ) ( not ( = ?auto_10772 ?auto_10787 ) ) ( not ( = ?auto_10772 ?auto_10806 ) ) ( not ( = ?auto_10772 ?auto_10793 ) ) ( not ( = ?auto_10804 ?auto_10796 ) ) ( not ( = ?auto_10804 ?auto_10794 ) ) ( not ( = ?auto_10804 ?auto_10782 ) ) ( not ( = ?auto_10792 ?auto_10791 ) ) ( not ( = ?auto_10792 ?auto_10803 ) ) ( not ( = ?auto_10792 ?auto_10781 ) ) ( not ( = ?auto_10805 ?auto_10787 ) ) ( not ( = ?auto_10805 ?auto_10806 ) ) ( not ( = ?auto_10805 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10773 ) ) ( not ( = ?auto_10768 ?auto_10799 ) ) ( not ( = ?auto_10769 ?auto_10773 ) ) ( not ( = ?auto_10769 ?auto_10799 ) ) ( not ( = ?auto_10770 ?auto_10773 ) ) ( not ( = ?auto_10770 ?auto_10799 ) ) ( not ( = ?auto_10771 ?auto_10773 ) ) ( not ( = ?auto_10771 ?auto_10799 ) ) ( not ( = ?auto_10773 ?auto_10805 ) ) ( not ( = ?auto_10773 ?auto_10787 ) ) ( not ( = ?auto_10773 ?auto_10806 ) ) ( not ( = ?auto_10773 ?auto_10793 ) ) ( not ( = ?auto_10799 ?auto_10805 ) ) ( not ( = ?auto_10799 ?auto_10787 ) ) ( not ( = ?auto_10799 ?auto_10806 ) ) ( not ( = ?auto_10799 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10774 ) ) ( not ( = ?auto_10768 ?auto_10795 ) ) ( not ( = ?auto_10769 ?auto_10774 ) ) ( not ( = ?auto_10769 ?auto_10795 ) ) ( not ( = ?auto_10770 ?auto_10774 ) ) ( not ( = ?auto_10770 ?auto_10795 ) ) ( not ( = ?auto_10771 ?auto_10774 ) ) ( not ( = ?auto_10771 ?auto_10795 ) ) ( not ( = ?auto_10772 ?auto_10774 ) ) ( not ( = ?auto_10772 ?auto_10795 ) ) ( not ( = ?auto_10774 ?auto_10799 ) ) ( not ( = ?auto_10774 ?auto_10805 ) ) ( not ( = ?auto_10774 ?auto_10787 ) ) ( not ( = ?auto_10774 ?auto_10806 ) ) ( not ( = ?auto_10774 ?auto_10793 ) ) ( not ( = ?auto_10801 ?auto_10782 ) ) ( not ( = ?auto_10801 ?auto_10804 ) ) ( not ( = ?auto_10801 ?auto_10796 ) ) ( not ( = ?auto_10801 ?auto_10794 ) ) ( not ( = ?auto_10800 ?auto_10781 ) ) ( not ( = ?auto_10800 ?auto_10792 ) ) ( not ( = ?auto_10800 ?auto_10791 ) ) ( not ( = ?auto_10800 ?auto_10803 ) ) ( not ( = ?auto_10795 ?auto_10799 ) ) ( not ( = ?auto_10795 ?auto_10805 ) ) ( not ( = ?auto_10795 ?auto_10787 ) ) ( not ( = ?auto_10795 ?auto_10806 ) ) ( not ( = ?auto_10795 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10777 ) ) ( not ( = ?auto_10768 ?auto_10790 ) ) ( not ( = ?auto_10769 ?auto_10777 ) ) ( not ( = ?auto_10769 ?auto_10790 ) ) ( not ( = ?auto_10770 ?auto_10777 ) ) ( not ( = ?auto_10770 ?auto_10790 ) ) ( not ( = ?auto_10771 ?auto_10777 ) ) ( not ( = ?auto_10771 ?auto_10790 ) ) ( not ( = ?auto_10772 ?auto_10777 ) ) ( not ( = ?auto_10772 ?auto_10790 ) ) ( not ( = ?auto_10773 ?auto_10777 ) ) ( not ( = ?auto_10773 ?auto_10790 ) ) ( not ( = ?auto_10777 ?auto_10795 ) ) ( not ( = ?auto_10777 ?auto_10799 ) ) ( not ( = ?auto_10777 ?auto_10805 ) ) ( not ( = ?auto_10777 ?auto_10787 ) ) ( not ( = ?auto_10777 ?auto_10806 ) ) ( not ( = ?auto_10777 ?auto_10793 ) ) ( not ( = ?auto_10785 ?auto_10801 ) ) ( not ( = ?auto_10785 ?auto_10782 ) ) ( not ( = ?auto_10785 ?auto_10804 ) ) ( not ( = ?auto_10785 ?auto_10796 ) ) ( not ( = ?auto_10785 ?auto_10794 ) ) ( not ( = ?auto_10789 ?auto_10800 ) ) ( not ( = ?auto_10789 ?auto_10781 ) ) ( not ( = ?auto_10789 ?auto_10792 ) ) ( not ( = ?auto_10789 ?auto_10791 ) ) ( not ( = ?auto_10789 ?auto_10803 ) ) ( not ( = ?auto_10790 ?auto_10795 ) ) ( not ( = ?auto_10790 ?auto_10799 ) ) ( not ( = ?auto_10790 ?auto_10805 ) ) ( not ( = ?auto_10790 ?auto_10787 ) ) ( not ( = ?auto_10790 ?auto_10806 ) ) ( not ( = ?auto_10790 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10776 ) ) ( not ( = ?auto_10768 ?auto_10802 ) ) ( not ( = ?auto_10769 ?auto_10776 ) ) ( not ( = ?auto_10769 ?auto_10802 ) ) ( not ( = ?auto_10770 ?auto_10776 ) ) ( not ( = ?auto_10770 ?auto_10802 ) ) ( not ( = ?auto_10771 ?auto_10776 ) ) ( not ( = ?auto_10771 ?auto_10802 ) ) ( not ( = ?auto_10772 ?auto_10776 ) ) ( not ( = ?auto_10772 ?auto_10802 ) ) ( not ( = ?auto_10773 ?auto_10776 ) ) ( not ( = ?auto_10773 ?auto_10802 ) ) ( not ( = ?auto_10774 ?auto_10776 ) ) ( not ( = ?auto_10774 ?auto_10802 ) ) ( not ( = ?auto_10776 ?auto_10790 ) ) ( not ( = ?auto_10776 ?auto_10795 ) ) ( not ( = ?auto_10776 ?auto_10799 ) ) ( not ( = ?auto_10776 ?auto_10805 ) ) ( not ( = ?auto_10776 ?auto_10787 ) ) ( not ( = ?auto_10776 ?auto_10806 ) ) ( not ( = ?auto_10776 ?auto_10793 ) ) ( not ( = ?auto_10798 ?auto_10785 ) ) ( not ( = ?auto_10798 ?auto_10801 ) ) ( not ( = ?auto_10798 ?auto_10782 ) ) ( not ( = ?auto_10798 ?auto_10804 ) ) ( not ( = ?auto_10798 ?auto_10796 ) ) ( not ( = ?auto_10798 ?auto_10794 ) ) ( not ( = ?auto_10797 ?auto_10789 ) ) ( not ( = ?auto_10797 ?auto_10800 ) ) ( not ( = ?auto_10797 ?auto_10781 ) ) ( not ( = ?auto_10797 ?auto_10792 ) ) ( not ( = ?auto_10797 ?auto_10791 ) ) ( not ( = ?auto_10797 ?auto_10803 ) ) ( not ( = ?auto_10802 ?auto_10790 ) ) ( not ( = ?auto_10802 ?auto_10795 ) ) ( not ( = ?auto_10802 ?auto_10799 ) ) ( not ( = ?auto_10802 ?auto_10805 ) ) ( not ( = ?auto_10802 ?auto_10787 ) ) ( not ( = ?auto_10802 ?auto_10806 ) ) ( not ( = ?auto_10802 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10775 ) ) ( not ( = ?auto_10768 ?auto_10786 ) ) ( not ( = ?auto_10769 ?auto_10775 ) ) ( not ( = ?auto_10769 ?auto_10786 ) ) ( not ( = ?auto_10770 ?auto_10775 ) ) ( not ( = ?auto_10770 ?auto_10786 ) ) ( not ( = ?auto_10771 ?auto_10775 ) ) ( not ( = ?auto_10771 ?auto_10786 ) ) ( not ( = ?auto_10772 ?auto_10775 ) ) ( not ( = ?auto_10772 ?auto_10786 ) ) ( not ( = ?auto_10773 ?auto_10775 ) ) ( not ( = ?auto_10773 ?auto_10786 ) ) ( not ( = ?auto_10774 ?auto_10775 ) ) ( not ( = ?auto_10774 ?auto_10786 ) ) ( not ( = ?auto_10777 ?auto_10775 ) ) ( not ( = ?auto_10777 ?auto_10786 ) ) ( not ( = ?auto_10775 ?auto_10802 ) ) ( not ( = ?auto_10775 ?auto_10790 ) ) ( not ( = ?auto_10775 ?auto_10795 ) ) ( not ( = ?auto_10775 ?auto_10799 ) ) ( not ( = ?auto_10775 ?auto_10805 ) ) ( not ( = ?auto_10775 ?auto_10787 ) ) ( not ( = ?auto_10775 ?auto_10806 ) ) ( not ( = ?auto_10775 ?auto_10793 ) ) ( not ( = ?auto_10788 ?auto_10798 ) ) ( not ( = ?auto_10788 ?auto_10785 ) ) ( not ( = ?auto_10788 ?auto_10801 ) ) ( not ( = ?auto_10788 ?auto_10782 ) ) ( not ( = ?auto_10788 ?auto_10804 ) ) ( not ( = ?auto_10788 ?auto_10796 ) ) ( not ( = ?auto_10788 ?auto_10794 ) ) ( not ( = ?auto_10807 ?auto_10797 ) ) ( not ( = ?auto_10807 ?auto_10789 ) ) ( not ( = ?auto_10807 ?auto_10800 ) ) ( not ( = ?auto_10807 ?auto_10781 ) ) ( not ( = ?auto_10807 ?auto_10792 ) ) ( not ( = ?auto_10807 ?auto_10791 ) ) ( not ( = ?auto_10807 ?auto_10803 ) ) ( not ( = ?auto_10786 ?auto_10802 ) ) ( not ( = ?auto_10786 ?auto_10790 ) ) ( not ( = ?auto_10786 ?auto_10795 ) ) ( not ( = ?auto_10786 ?auto_10799 ) ) ( not ( = ?auto_10786 ?auto_10805 ) ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10786 ?auto_10806 ) ) ( not ( = ?auto_10786 ?auto_10793 ) ) ( not ( = ?auto_10768 ?auto_10778 ) ) ( not ( = ?auto_10768 ?auto_10783 ) ) ( not ( = ?auto_10769 ?auto_10778 ) ) ( not ( = ?auto_10769 ?auto_10783 ) ) ( not ( = ?auto_10770 ?auto_10778 ) ) ( not ( = ?auto_10770 ?auto_10783 ) ) ( not ( = ?auto_10771 ?auto_10778 ) ) ( not ( = ?auto_10771 ?auto_10783 ) ) ( not ( = ?auto_10772 ?auto_10778 ) ) ( not ( = ?auto_10772 ?auto_10783 ) ) ( not ( = ?auto_10773 ?auto_10778 ) ) ( not ( = ?auto_10773 ?auto_10783 ) ) ( not ( = ?auto_10774 ?auto_10778 ) ) ( not ( = ?auto_10774 ?auto_10783 ) ) ( not ( = ?auto_10777 ?auto_10778 ) ) ( not ( = ?auto_10777 ?auto_10783 ) ) ( not ( = ?auto_10776 ?auto_10778 ) ) ( not ( = ?auto_10776 ?auto_10783 ) ) ( not ( = ?auto_10778 ?auto_10786 ) ) ( not ( = ?auto_10778 ?auto_10802 ) ) ( not ( = ?auto_10778 ?auto_10790 ) ) ( not ( = ?auto_10778 ?auto_10795 ) ) ( not ( = ?auto_10778 ?auto_10799 ) ) ( not ( = ?auto_10778 ?auto_10805 ) ) ( not ( = ?auto_10778 ?auto_10787 ) ) ( not ( = ?auto_10778 ?auto_10806 ) ) ( not ( = ?auto_10778 ?auto_10793 ) ) ( not ( = ?auto_10783 ?auto_10786 ) ) ( not ( = ?auto_10783 ?auto_10802 ) ) ( not ( = ?auto_10783 ?auto_10790 ) ) ( not ( = ?auto_10783 ?auto_10795 ) ) ( not ( = ?auto_10783 ?auto_10799 ) ) ( not ( = ?auto_10783 ?auto_10805 ) ) ( not ( = ?auto_10783 ?auto_10787 ) ) ( not ( = ?auto_10783 ?auto_10806 ) ) ( not ( = ?auto_10783 ?auto_10793 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_10768 ?auto_10769 ?auto_10770 ?auto_10771 ?auto_10772 ?auto_10773 ?auto_10774 ?auto_10777 ?auto_10776 ?auto_10775 )
      ( MAKE-1CRATE ?auto_10775 ?auto_10778 )
      ( MAKE-10CRATE-VERIFY ?auto_10768 ?auto_10769 ?auto_10770 ?auto_10771 ?auto_10772 ?auto_10773 ?auto_10774 ?auto_10777 ?auto_10776 ?auto_10775 ?auto_10778 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10810 - SURFACE
      ?auto_10811 - SURFACE
    )
    :vars
    (
      ?auto_10812 - HOIST
      ?auto_10813 - PLACE
      ?auto_10815 - PLACE
      ?auto_10816 - HOIST
      ?auto_10817 - SURFACE
      ?auto_10814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10812 ?auto_10813 ) ( SURFACE-AT ?auto_10810 ?auto_10813 ) ( CLEAR ?auto_10810 ) ( IS-CRATE ?auto_10811 ) ( AVAILABLE ?auto_10812 ) ( not ( = ?auto_10815 ?auto_10813 ) ) ( HOIST-AT ?auto_10816 ?auto_10815 ) ( AVAILABLE ?auto_10816 ) ( SURFACE-AT ?auto_10811 ?auto_10815 ) ( ON ?auto_10811 ?auto_10817 ) ( CLEAR ?auto_10811 ) ( TRUCK-AT ?auto_10814 ?auto_10813 ) ( not ( = ?auto_10810 ?auto_10811 ) ) ( not ( = ?auto_10810 ?auto_10817 ) ) ( not ( = ?auto_10811 ?auto_10817 ) ) ( not ( = ?auto_10812 ?auto_10816 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10814 ?auto_10813 ?auto_10815 )
      ( !LIFT ?auto_10816 ?auto_10811 ?auto_10817 ?auto_10815 )
      ( !LOAD ?auto_10816 ?auto_10811 ?auto_10814 ?auto_10815 )
      ( !DRIVE ?auto_10814 ?auto_10815 ?auto_10813 )
      ( !UNLOAD ?auto_10812 ?auto_10811 ?auto_10814 ?auto_10813 )
      ( !DROP ?auto_10812 ?auto_10811 ?auto_10810 ?auto_10813 )
      ( MAKE-1CRATE-VERIFY ?auto_10810 ?auto_10811 ) )
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
      ?auto_10839 - SURFACE
      ?auto_10838 - SURFACE
      ?auto_10837 - SURFACE
      ?auto_10840 - SURFACE
      ?auto_10841 - SURFACE
    )
    :vars
    (
      ?auto_10843 - HOIST
      ?auto_10844 - PLACE
      ?auto_10845 - PLACE
      ?auto_10842 - HOIST
      ?auto_10846 - SURFACE
      ?auto_10857 - PLACE
      ?auto_10870 - HOIST
      ?auto_10873 - SURFACE
      ?auto_10859 - PLACE
      ?auto_10866 - HOIST
      ?auto_10849 - SURFACE
      ?auto_10852 - PLACE
      ?auto_10855 - HOIST
      ?auto_10863 - SURFACE
      ?auto_10848 - PLACE
      ?auto_10864 - HOIST
      ?auto_10850 - SURFACE
      ?auto_10860 - PLACE
      ?auto_10854 - HOIST
      ?auto_10856 - SURFACE
      ?auto_10871 - SURFACE
      ?auto_10868 - PLACE
      ?auto_10867 - HOIST
      ?auto_10865 - SURFACE
      ?auto_10862 - PLACE
      ?auto_10853 - HOIST
      ?auto_10861 - SURFACE
      ?auto_10872 - PLACE
      ?auto_10858 - HOIST
      ?auto_10869 - SURFACE
      ?auto_10851 - SURFACE
      ?auto_10847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10843 ?auto_10844 ) ( IS-CRATE ?auto_10841 ) ( not ( = ?auto_10845 ?auto_10844 ) ) ( HOIST-AT ?auto_10842 ?auto_10845 ) ( AVAILABLE ?auto_10842 ) ( SURFACE-AT ?auto_10841 ?auto_10845 ) ( ON ?auto_10841 ?auto_10846 ) ( CLEAR ?auto_10841 ) ( not ( = ?auto_10840 ?auto_10841 ) ) ( not ( = ?auto_10840 ?auto_10846 ) ) ( not ( = ?auto_10841 ?auto_10846 ) ) ( not ( = ?auto_10843 ?auto_10842 ) ) ( IS-CRATE ?auto_10840 ) ( not ( = ?auto_10857 ?auto_10844 ) ) ( HOIST-AT ?auto_10870 ?auto_10857 ) ( SURFACE-AT ?auto_10840 ?auto_10857 ) ( ON ?auto_10840 ?auto_10873 ) ( CLEAR ?auto_10840 ) ( not ( = ?auto_10837 ?auto_10840 ) ) ( not ( = ?auto_10837 ?auto_10873 ) ) ( not ( = ?auto_10840 ?auto_10873 ) ) ( not ( = ?auto_10843 ?auto_10870 ) ) ( IS-CRATE ?auto_10837 ) ( not ( = ?auto_10859 ?auto_10844 ) ) ( HOIST-AT ?auto_10866 ?auto_10859 ) ( AVAILABLE ?auto_10866 ) ( SURFACE-AT ?auto_10837 ?auto_10859 ) ( ON ?auto_10837 ?auto_10849 ) ( CLEAR ?auto_10837 ) ( not ( = ?auto_10838 ?auto_10837 ) ) ( not ( = ?auto_10838 ?auto_10849 ) ) ( not ( = ?auto_10837 ?auto_10849 ) ) ( not ( = ?auto_10843 ?auto_10866 ) ) ( IS-CRATE ?auto_10838 ) ( not ( = ?auto_10852 ?auto_10844 ) ) ( HOIST-AT ?auto_10855 ?auto_10852 ) ( AVAILABLE ?auto_10855 ) ( SURFACE-AT ?auto_10838 ?auto_10852 ) ( ON ?auto_10838 ?auto_10863 ) ( CLEAR ?auto_10838 ) ( not ( = ?auto_10839 ?auto_10838 ) ) ( not ( = ?auto_10839 ?auto_10863 ) ) ( not ( = ?auto_10838 ?auto_10863 ) ) ( not ( = ?auto_10843 ?auto_10855 ) ) ( IS-CRATE ?auto_10839 ) ( not ( = ?auto_10848 ?auto_10844 ) ) ( HOIST-AT ?auto_10864 ?auto_10848 ) ( AVAILABLE ?auto_10864 ) ( SURFACE-AT ?auto_10839 ?auto_10848 ) ( ON ?auto_10839 ?auto_10850 ) ( CLEAR ?auto_10839 ) ( not ( = ?auto_10836 ?auto_10839 ) ) ( not ( = ?auto_10836 ?auto_10850 ) ) ( not ( = ?auto_10839 ?auto_10850 ) ) ( not ( = ?auto_10843 ?auto_10864 ) ) ( IS-CRATE ?auto_10836 ) ( not ( = ?auto_10860 ?auto_10844 ) ) ( HOIST-AT ?auto_10854 ?auto_10860 ) ( AVAILABLE ?auto_10854 ) ( SURFACE-AT ?auto_10836 ?auto_10860 ) ( ON ?auto_10836 ?auto_10856 ) ( CLEAR ?auto_10836 ) ( not ( = ?auto_10835 ?auto_10836 ) ) ( not ( = ?auto_10835 ?auto_10856 ) ) ( not ( = ?auto_10836 ?auto_10856 ) ) ( not ( = ?auto_10843 ?auto_10854 ) ) ( IS-CRATE ?auto_10835 ) ( SURFACE-AT ?auto_10835 ?auto_10857 ) ( ON ?auto_10835 ?auto_10871 ) ( CLEAR ?auto_10835 ) ( not ( = ?auto_10834 ?auto_10835 ) ) ( not ( = ?auto_10834 ?auto_10871 ) ) ( not ( = ?auto_10835 ?auto_10871 ) ) ( IS-CRATE ?auto_10834 ) ( not ( = ?auto_10868 ?auto_10844 ) ) ( HOIST-AT ?auto_10867 ?auto_10868 ) ( AVAILABLE ?auto_10867 ) ( SURFACE-AT ?auto_10834 ?auto_10868 ) ( ON ?auto_10834 ?auto_10865 ) ( CLEAR ?auto_10834 ) ( not ( = ?auto_10833 ?auto_10834 ) ) ( not ( = ?auto_10833 ?auto_10865 ) ) ( not ( = ?auto_10834 ?auto_10865 ) ) ( not ( = ?auto_10843 ?auto_10867 ) ) ( IS-CRATE ?auto_10833 ) ( not ( = ?auto_10862 ?auto_10844 ) ) ( HOIST-AT ?auto_10853 ?auto_10862 ) ( AVAILABLE ?auto_10853 ) ( SURFACE-AT ?auto_10833 ?auto_10862 ) ( ON ?auto_10833 ?auto_10861 ) ( CLEAR ?auto_10833 ) ( not ( = ?auto_10832 ?auto_10833 ) ) ( not ( = ?auto_10832 ?auto_10861 ) ) ( not ( = ?auto_10833 ?auto_10861 ) ) ( not ( = ?auto_10843 ?auto_10853 ) ) ( IS-CRATE ?auto_10832 ) ( not ( = ?auto_10872 ?auto_10844 ) ) ( HOIST-AT ?auto_10858 ?auto_10872 ) ( AVAILABLE ?auto_10858 ) ( SURFACE-AT ?auto_10832 ?auto_10872 ) ( ON ?auto_10832 ?auto_10869 ) ( CLEAR ?auto_10832 ) ( not ( = ?auto_10831 ?auto_10832 ) ) ( not ( = ?auto_10831 ?auto_10869 ) ) ( not ( = ?auto_10832 ?auto_10869 ) ) ( not ( = ?auto_10843 ?auto_10858 ) ) ( SURFACE-AT ?auto_10830 ?auto_10844 ) ( CLEAR ?auto_10830 ) ( IS-CRATE ?auto_10831 ) ( AVAILABLE ?auto_10843 ) ( AVAILABLE ?auto_10870 ) ( SURFACE-AT ?auto_10831 ?auto_10857 ) ( ON ?auto_10831 ?auto_10851 ) ( CLEAR ?auto_10831 ) ( TRUCK-AT ?auto_10847 ?auto_10844 ) ( not ( = ?auto_10830 ?auto_10831 ) ) ( not ( = ?auto_10830 ?auto_10851 ) ) ( not ( = ?auto_10831 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10832 ) ) ( not ( = ?auto_10830 ?auto_10869 ) ) ( not ( = ?auto_10832 ?auto_10851 ) ) ( not ( = ?auto_10872 ?auto_10857 ) ) ( not ( = ?auto_10858 ?auto_10870 ) ) ( not ( = ?auto_10869 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10833 ) ) ( not ( = ?auto_10830 ?auto_10861 ) ) ( not ( = ?auto_10831 ?auto_10833 ) ) ( not ( = ?auto_10831 ?auto_10861 ) ) ( not ( = ?auto_10833 ?auto_10869 ) ) ( not ( = ?auto_10833 ?auto_10851 ) ) ( not ( = ?auto_10862 ?auto_10872 ) ) ( not ( = ?auto_10862 ?auto_10857 ) ) ( not ( = ?auto_10853 ?auto_10858 ) ) ( not ( = ?auto_10853 ?auto_10870 ) ) ( not ( = ?auto_10861 ?auto_10869 ) ) ( not ( = ?auto_10861 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10834 ) ) ( not ( = ?auto_10830 ?auto_10865 ) ) ( not ( = ?auto_10831 ?auto_10834 ) ) ( not ( = ?auto_10831 ?auto_10865 ) ) ( not ( = ?auto_10832 ?auto_10834 ) ) ( not ( = ?auto_10832 ?auto_10865 ) ) ( not ( = ?auto_10834 ?auto_10861 ) ) ( not ( = ?auto_10834 ?auto_10869 ) ) ( not ( = ?auto_10834 ?auto_10851 ) ) ( not ( = ?auto_10868 ?auto_10862 ) ) ( not ( = ?auto_10868 ?auto_10872 ) ) ( not ( = ?auto_10868 ?auto_10857 ) ) ( not ( = ?auto_10867 ?auto_10853 ) ) ( not ( = ?auto_10867 ?auto_10858 ) ) ( not ( = ?auto_10867 ?auto_10870 ) ) ( not ( = ?auto_10865 ?auto_10861 ) ) ( not ( = ?auto_10865 ?auto_10869 ) ) ( not ( = ?auto_10865 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10835 ) ) ( not ( = ?auto_10830 ?auto_10871 ) ) ( not ( = ?auto_10831 ?auto_10835 ) ) ( not ( = ?auto_10831 ?auto_10871 ) ) ( not ( = ?auto_10832 ?auto_10835 ) ) ( not ( = ?auto_10832 ?auto_10871 ) ) ( not ( = ?auto_10833 ?auto_10835 ) ) ( not ( = ?auto_10833 ?auto_10871 ) ) ( not ( = ?auto_10835 ?auto_10865 ) ) ( not ( = ?auto_10835 ?auto_10861 ) ) ( not ( = ?auto_10835 ?auto_10869 ) ) ( not ( = ?auto_10835 ?auto_10851 ) ) ( not ( = ?auto_10871 ?auto_10865 ) ) ( not ( = ?auto_10871 ?auto_10861 ) ) ( not ( = ?auto_10871 ?auto_10869 ) ) ( not ( = ?auto_10871 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10836 ) ) ( not ( = ?auto_10830 ?auto_10856 ) ) ( not ( = ?auto_10831 ?auto_10836 ) ) ( not ( = ?auto_10831 ?auto_10856 ) ) ( not ( = ?auto_10832 ?auto_10836 ) ) ( not ( = ?auto_10832 ?auto_10856 ) ) ( not ( = ?auto_10833 ?auto_10836 ) ) ( not ( = ?auto_10833 ?auto_10856 ) ) ( not ( = ?auto_10834 ?auto_10836 ) ) ( not ( = ?auto_10834 ?auto_10856 ) ) ( not ( = ?auto_10836 ?auto_10871 ) ) ( not ( = ?auto_10836 ?auto_10865 ) ) ( not ( = ?auto_10836 ?auto_10861 ) ) ( not ( = ?auto_10836 ?auto_10869 ) ) ( not ( = ?auto_10836 ?auto_10851 ) ) ( not ( = ?auto_10860 ?auto_10857 ) ) ( not ( = ?auto_10860 ?auto_10868 ) ) ( not ( = ?auto_10860 ?auto_10862 ) ) ( not ( = ?auto_10860 ?auto_10872 ) ) ( not ( = ?auto_10854 ?auto_10870 ) ) ( not ( = ?auto_10854 ?auto_10867 ) ) ( not ( = ?auto_10854 ?auto_10853 ) ) ( not ( = ?auto_10854 ?auto_10858 ) ) ( not ( = ?auto_10856 ?auto_10871 ) ) ( not ( = ?auto_10856 ?auto_10865 ) ) ( not ( = ?auto_10856 ?auto_10861 ) ) ( not ( = ?auto_10856 ?auto_10869 ) ) ( not ( = ?auto_10856 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10839 ) ) ( not ( = ?auto_10830 ?auto_10850 ) ) ( not ( = ?auto_10831 ?auto_10839 ) ) ( not ( = ?auto_10831 ?auto_10850 ) ) ( not ( = ?auto_10832 ?auto_10839 ) ) ( not ( = ?auto_10832 ?auto_10850 ) ) ( not ( = ?auto_10833 ?auto_10839 ) ) ( not ( = ?auto_10833 ?auto_10850 ) ) ( not ( = ?auto_10834 ?auto_10839 ) ) ( not ( = ?auto_10834 ?auto_10850 ) ) ( not ( = ?auto_10835 ?auto_10839 ) ) ( not ( = ?auto_10835 ?auto_10850 ) ) ( not ( = ?auto_10839 ?auto_10856 ) ) ( not ( = ?auto_10839 ?auto_10871 ) ) ( not ( = ?auto_10839 ?auto_10865 ) ) ( not ( = ?auto_10839 ?auto_10861 ) ) ( not ( = ?auto_10839 ?auto_10869 ) ) ( not ( = ?auto_10839 ?auto_10851 ) ) ( not ( = ?auto_10848 ?auto_10860 ) ) ( not ( = ?auto_10848 ?auto_10857 ) ) ( not ( = ?auto_10848 ?auto_10868 ) ) ( not ( = ?auto_10848 ?auto_10862 ) ) ( not ( = ?auto_10848 ?auto_10872 ) ) ( not ( = ?auto_10864 ?auto_10854 ) ) ( not ( = ?auto_10864 ?auto_10870 ) ) ( not ( = ?auto_10864 ?auto_10867 ) ) ( not ( = ?auto_10864 ?auto_10853 ) ) ( not ( = ?auto_10864 ?auto_10858 ) ) ( not ( = ?auto_10850 ?auto_10856 ) ) ( not ( = ?auto_10850 ?auto_10871 ) ) ( not ( = ?auto_10850 ?auto_10865 ) ) ( not ( = ?auto_10850 ?auto_10861 ) ) ( not ( = ?auto_10850 ?auto_10869 ) ) ( not ( = ?auto_10850 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10838 ) ) ( not ( = ?auto_10830 ?auto_10863 ) ) ( not ( = ?auto_10831 ?auto_10838 ) ) ( not ( = ?auto_10831 ?auto_10863 ) ) ( not ( = ?auto_10832 ?auto_10838 ) ) ( not ( = ?auto_10832 ?auto_10863 ) ) ( not ( = ?auto_10833 ?auto_10838 ) ) ( not ( = ?auto_10833 ?auto_10863 ) ) ( not ( = ?auto_10834 ?auto_10838 ) ) ( not ( = ?auto_10834 ?auto_10863 ) ) ( not ( = ?auto_10835 ?auto_10838 ) ) ( not ( = ?auto_10835 ?auto_10863 ) ) ( not ( = ?auto_10836 ?auto_10838 ) ) ( not ( = ?auto_10836 ?auto_10863 ) ) ( not ( = ?auto_10838 ?auto_10850 ) ) ( not ( = ?auto_10838 ?auto_10856 ) ) ( not ( = ?auto_10838 ?auto_10871 ) ) ( not ( = ?auto_10838 ?auto_10865 ) ) ( not ( = ?auto_10838 ?auto_10861 ) ) ( not ( = ?auto_10838 ?auto_10869 ) ) ( not ( = ?auto_10838 ?auto_10851 ) ) ( not ( = ?auto_10852 ?auto_10848 ) ) ( not ( = ?auto_10852 ?auto_10860 ) ) ( not ( = ?auto_10852 ?auto_10857 ) ) ( not ( = ?auto_10852 ?auto_10868 ) ) ( not ( = ?auto_10852 ?auto_10862 ) ) ( not ( = ?auto_10852 ?auto_10872 ) ) ( not ( = ?auto_10855 ?auto_10864 ) ) ( not ( = ?auto_10855 ?auto_10854 ) ) ( not ( = ?auto_10855 ?auto_10870 ) ) ( not ( = ?auto_10855 ?auto_10867 ) ) ( not ( = ?auto_10855 ?auto_10853 ) ) ( not ( = ?auto_10855 ?auto_10858 ) ) ( not ( = ?auto_10863 ?auto_10850 ) ) ( not ( = ?auto_10863 ?auto_10856 ) ) ( not ( = ?auto_10863 ?auto_10871 ) ) ( not ( = ?auto_10863 ?auto_10865 ) ) ( not ( = ?auto_10863 ?auto_10861 ) ) ( not ( = ?auto_10863 ?auto_10869 ) ) ( not ( = ?auto_10863 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10837 ) ) ( not ( = ?auto_10830 ?auto_10849 ) ) ( not ( = ?auto_10831 ?auto_10837 ) ) ( not ( = ?auto_10831 ?auto_10849 ) ) ( not ( = ?auto_10832 ?auto_10837 ) ) ( not ( = ?auto_10832 ?auto_10849 ) ) ( not ( = ?auto_10833 ?auto_10837 ) ) ( not ( = ?auto_10833 ?auto_10849 ) ) ( not ( = ?auto_10834 ?auto_10837 ) ) ( not ( = ?auto_10834 ?auto_10849 ) ) ( not ( = ?auto_10835 ?auto_10837 ) ) ( not ( = ?auto_10835 ?auto_10849 ) ) ( not ( = ?auto_10836 ?auto_10837 ) ) ( not ( = ?auto_10836 ?auto_10849 ) ) ( not ( = ?auto_10839 ?auto_10837 ) ) ( not ( = ?auto_10839 ?auto_10849 ) ) ( not ( = ?auto_10837 ?auto_10863 ) ) ( not ( = ?auto_10837 ?auto_10850 ) ) ( not ( = ?auto_10837 ?auto_10856 ) ) ( not ( = ?auto_10837 ?auto_10871 ) ) ( not ( = ?auto_10837 ?auto_10865 ) ) ( not ( = ?auto_10837 ?auto_10861 ) ) ( not ( = ?auto_10837 ?auto_10869 ) ) ( not ( = ?auto_10837 ?auto_10851 ) ) ( not ( = ?auto_10859 ?auto_10852 ) ) ( not ( = ?auto_10859 ?auto_10848 ) ) ( not ( = ?auto_10859 ?auto_10860 ) ) ( not ( = ?auto_10859 ?auto_10857 ) ) ( not ( = ?auto_10859 ?auto_10868 ) ) ( not ( = ?auto_10859 ?auto_10862 ) ) ( not ( = ?auto_10859 ?auto_10872 ) ) ( not ( = ?auto_10866 ?auto_10855 ) ) ( not ( = ?auto_10866 ?auto_10864 ) ) ( not ( = ?auto_10866 ?auto_10854 ) ) ( not ( = ?auto_10866 ?auto_10870 ) ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10866 ?auto_10853 ) ) ( not ( = ?auto_10866 ?auto_10858 ) ) ( not ( = ?auto_10849 ?auto_10863 ) ) ( not ( = ?auto_10849 ?auto_10850 ) ) ( not ( = ?auto_10849 ?auto_10856 ) ) ( not ( = ?auto_10849 ?auto_10871 ) ) ( not ( = ?auto_10849 ?auto_10865 ) ) ( not ( = ?auto_10849 ?auto_10861 ) ) ( not ( = ?auto_10849 ?auto_10869 ) ) ( not ( = ?auto_10849 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10840 ) ) ( not ( = ?auto_10830 ?auto_10873 ) ) ( not ( = ?auto_10831 ?auto_10840 ) ) ( not ( = ?auto_10831 ?auto_10873 ) ) ( not ( = ?auto_10832 ?auto_10840 ) ) ( not ( = ?auto_10832 ?auto_10873 ) ) ( not ( = ?auto_10833 ?auto_10840 ) ) ( not ( = ?auto_10833 ?auto_10873 ) ) ( not ( = ?auto_10834 ?auto_10840 ) ) ( not ( = ?auto_10834 ?auto_10873 ) ) ( not ( = ?auto_10835 ?auto_10840 ) ) ( not ( = ?auto_10835 ?auto_10873 ) ) ( not ( = ?auto_10836 ?auto_10840 ) ) ( not ( = ?auto_10836 ?auto_10873 ) ) ( not ( = ?auto_10839 ?auto_10840 ) ) ( not ( = ?auto_10839 ?auto_10873 ) ) ( not ( = ?auto_10838 ?auto_10840 ) ) ( not ( = ?auto_10838 ?auto_10873 ) ) ( not ( = ?auto_10840 ?auto_10849 ) ) ( not ( = ?auto_10840 ?auto_10863 ) ) ( not ( = ?auto_10840 ?auto_10850 ) ) ( not ( = ?auto_10840 ?auto_10856 ) ) ( not ( = ?auto_10840 ?auto_10871 ) ) ( not ( = ?auto_10840 ?auto_10865 ) ) ( not ( = ?auto_10840 ?auto_10861 ) ) ( not ( = ?auto_10840 ?auto_10869 ) ) ( not ( = ?auto_10840 ?auto_10851 ) ) ( not ( = ?auto_10873 ?auto_10849 ) ) ( not ( = ?auto_10873 ?auto_10863 ) ) ( not ( = ?auto_10873 ?auto_10850 ) ) ( not ( = ?auto_10873 ?auto_10856 ) ) ( not ( = ?auto_10873 ?auto_10871 ) ) ( not ( = ?auto_10873 ?auto_10865 ) ) ( not ( = ?auto_10873 ?auto_10861 ) ) ( not ( = ?auto_10873 ?auto_10869 ) ) ( not ( = ?auto_10873 ?auto_10851 ) ) ( not ( = ?auto_10830 ?auto_10841 ) ) ( not ( = ?auto_10830 ?auto_10846 ) ) ( not ( = ?auto_10831 ?auto_10841 ) ) ( not ( = ?auto_10831 ?auto_10846 ) ) ( not ( = ?auto_10832 ?auto_10841 ) ) ( not ( = ?auto_10832 ?auto_10846 ) ) ( not ( = ?auto_10833 ?auto_10841 ) ) ( not ( = ?auto_10833 ?auto_10846 ) ) ( not ( = ?auto_10834 ?auto_10841 ) ) ( not ( = ?auto_10834 ?auto_10846 ) ) ( not ( = ?auto_10835 ?auto_10841 ) ) ( not ( = ?auto_10835 ?auto_10846 ) ) ( not ( = ?auto_10836 ?auto_10841 ) ) ( not ( = ?auto_10836 ?auto_10846 ) ) ( not ( = ?auto_10839 ?auto_10841 ) ) ( not ( = ?auto_10839 ?auto_10846 ) ) ( not ( = ?auto_10838 ?auto_10841 ) ) ( not ( = ?auto_10838 ?auto_10846 ) ) ( not ( = ?auto_10837 ?auto_10841 ) ) ( not ( = ?auto_10837 ?auto_10846 ) ) ( not ( = ?auto_10841 ?auto_10873 ) ) ( not ( = ?auto_10841 ?auto_10849 ) ) ( not ( = ?auto_10841 ?auto_10863 ) ) ( not ( = ?auto_10841 ?auto_10850 ) ) ( not ( = ?auto_10841 ?auto_10856 ) ) ( not ( = ?auto_10841 ?auto_10871 ) ) ( not ( = ?auto_10841 ?auto_10865 ) ) ( not ( = ?auto_10841 ?auto_10861 ) ) ( not ( = ?auto_10841 ?auto_10869 ) ) ( not ( = ?auto_10841 ?auto_10851 ) ) ( not ( = ?auto_10845 ?auto_10857 ) ) ( not ( = ?auto_10845 ?auto_10859 ) ) ( not ( = ?auto_10845 ?auto_10852 ) ) ( not ( = ?auto_10845 ?auto_10848 ) ) ( not ( = ?auto_10845 ?auto_10860 ) ) ( not ( = ?auto_10845 ?auto_10868 ) ) ( not ( = ?auto_10845 ?auto_10862 ) ) ( not ( = ?auto_10845 ?auto_10872 ) ) ( not ( = ?auto_10842 ?auto_10870 ) ) ( not ( = ?auto_10842 ?auto_10866 ) ) ( not ( = ?auto_10842 ?auto_10855 ) ) ( not ( = ?auto_10842 ?auto_10864 ) ) ( not ( = ?auto_10842 ?auto_10854 ) ) ( not ( = ?auto_10842 ?auto_10867 ) ) ( not ( = ?auto_10842 ?auto_10853 ) ) ( not ( = ?auto_10842 ?auto_10858 ) ) ( not ( = ?auto_10846 ?auto_10873 ) ) ( not ( = ?auto_10846 ?auto_10849 ) ) ( not ( = ?auto_10846 ?auto_10863 ) ) ( not ( = ?auto_10846 ?auto_10850 ) ) ( not ( = ?auto_10846 ?auto_10856 ) ) ( not ( = ?auto_10846 ?auto_10871 ) ) ( not ( = ?auto_10846 ?auto_10865 ) ) ( not ( = ?auto_10846 ?auto_10861 ) ) ( not ( = ?auto_10846 ?auto_10869 ) ) ( not ( = ?auto_10846 ?auto_10851 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_10830 ?auto_10831 ?auto_10832 ?auto_10833 ?auto_10834 ?auto_10835 ?auto_10836 ?auto_10839 ?auto_10838 ?auto_10837 ?auto_10840 )
      ( MAKE-1CRATE ?auto_10840 ?auto_10841 )
      ( MAKE-11CRATE-VERIFY ?auto_10830 ?auto_10831 ?auto_10832 ?auto_10833 ?auto_10834 ?auto_10835 ?auto_10836 ?auto_10839 ?auto_10838 ?auto_10837 ?auto_10840 ?auto_10841 ) )
  )

)

