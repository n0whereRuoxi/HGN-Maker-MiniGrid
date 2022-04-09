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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16382 - SURFACE
      ?auto_16383 - SURFACE
    )
    :vars
    (
      ?auto_16384 - HOIST
      ?auto_16385 - PLACE
      ?auto_16387 - PLACE
      ?auto_16388 - HOIST
      ?auto_16389 - SURFACE
      ?auto_16386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16384 ?auto_16385 ) ( SURFACE-AT ?auto_16382 ?auto_16385 ) ( CLEAR ?auto_16382 ) ( IS-CRATE ?auto_16383 ) ( AVAILABLE ?auto_16384 ) ( not ( = ?auto_16387 ?auto_16385 ) ) ( HOIST-AT ?auto_16388 ?auto_16387 ) ( AVAILABLE ?auto_16388 ) ( SURFACE-AT ?auto_16383 ?auto_16387 ) ( ON ?auto_16383 ?auto_16389 ) ( CLEAR ?auto_16383 ) ( TRUCK-AT ?auto_16386 ?auto_16385 ) ( not ( = ?auto_16382 ?auto_16383 ) ) ( not ( = ?auto_16382 ?auto_16389 ) ) ( not ( = ?auto_16383 ?auto_16389 ) ) ( not ( = ?auto_16384 ?auto_16388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16386 ?auto_16385 ?auto_16387 )
      ( !LIFT ?auto_16388 ?auto_16383 ?auto_16389 ?auto_16387 )
      ( !LOAD ?auto_16388 ?auto_16383 ?auto_16386 ?auto_16387 )
      ( !DRIVE ?auto_16386 ?auto_16387 ?auto_16385 )
      ( !UNLOAD ?auto_16384 ?auto_16383 ?auto_16386 ?auto_16385 )
      ( !DROP ?auto_16384 ?auto_16383 ?auto_16382 ?auto_16385 )
      ( MAKE-1CRATE-VERIFY ?auto_16382 ?auto_16383 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16403 - SURFACE
      ?auto_16404 - SURFACE
      ?auto_16405 - SURFACE
    )
    :vars
    (
      ?auto_16411 - HOIST
      ?auto_16410 - PLACE
      ?auto_16406 - PLACE
      ?auto_16407 - HOIST
      ?auto_16408 - SURFACE
      ?auto_16413 - PLACE
      ?auto_16412 - HOIST
      ?auto_16414 - SURFACE
      ?auto_16409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16411 ?auto_16410 ) ( IS-CRATE ?auto_16405 ) ( not ( = ?auto_16406 ?auto_16410 ) ) ( HOIST-AT ?auto_16407 ?auto_16406 ) ( AVAILABLE ?auto_16407 ) ( SURFACE-AT ?auto_16405 ?auto_16406 ) ( ON ?auto_16405 ?auto_16408 ) ( CLEAR ?auto_16405 ) ( not ( = ?auto_16404 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16408 ) ) ( not ( = ?auto_16405 ?auto_16408 ) ) ( not ( = ?auto_16411 ?auto_16407 ) ) ( SURFACE-AT ?auto_16403 ?auto_16410 ) ( CLEAR ?auto_16403 ) ( IS-CRATE ?auto_16404 ) ( AVAILABLE ?auto_16411 ) ( not ( = ?auto_16413 ?auto_16410 ) ) ( HOIST-AT ?auto_16412 ?auto_16413 ) ( AVAILABLE ?auto_16412 ) ( SURFACE-AT ?auto_16404 ?auto_16413 ) ( ON ?auto_16404 ?auto_16414 ) ( CLEAR ?auto_16404 ) ( TRUCK-AT ?auto_16409 ?auto_16410 ) ( not ( = ?auto_16403 ?auto_16404 ) ) ( not ( = ?auto_16403 ?auto_16414 ) ) ( not ( = ?auto_16404 ?auto_16414 ) ) ( not ( = ?auto_16411 ?auto_16412 ) ) ( not ( = ?auto_16403 ?auto_16405 ) ) ( not ( = ?auto_16403 ?auto_16408 ) ) ( not ( = ?auto_16405 ?auto_16414 ) ) ( not ( = ?auto_16406 ?auto_16413 ) ) ( not ( = ?auto_16407 ?auto_16412 ) ) ( not ( = ?auto_16408 ?auto_16414 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16403 ?auto_16404 )
      ( MAKE-1CRATE ?auto_16404 ?auto_16405 )
      ( MAKE-2CRATE-VERIFY ?auto_16403 ?auto_16404 ?auto_16405 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16429 - SURFACE
      ?auto_16430 - SURFACE
      ?auto_16431 - SURFACE
      ?auto_16432 - SURFACE
    )
    :vars
    (
      ?auto_16435 - HOIST
      ?auto_16433 - PLACE
      ?auto_16437 - PLACE
      ?auto_16438 - HOIST
      ?auto_16436 - SURFACE
      ?auto_16443 - PLACE
      ?auto_16441 - HOIST
      ?auto_16440 - SURFACE
      ?auto_16444 - PLACE
      ?auto_16442 - HOIST
      ?auto_16439 - SURFACE
      ?auto_16434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16435 ?auto_16433 ) ( IS-CRATE ?auto_16432 ) ( not ( = ?auto_16437 ?auto_16433 ) ) ( HOIST-AT ?auto_16438 ?auto_16437 ) ( AVAILABLE ?auto_16438 ) ( SURFACE-AT ?auto_16432 ?auto_16437 ) ( ON ?auto_16432 ?auto_16436 ) ( CLEAR ?auto_16432 ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( not ( = ?auto_16431 ?auto_16436 ) ) ( not ( = ?auto_16432 ?auto_16436 ) ) ( not ( = ?auto_16435 ?auto_16438 ) ) ( IS-CRATE ?auto_16431 ) ( not ( = ?auto_16443 ?auto_16433 ) ) ( HOIST-AT ?auto_16441 ?auto_16443 ) ( AVAILABLE ?auto_16441 ) ( SURFACE-AT ?auto_16431 ?auto_16443 ) ( ON ?auto_16431 ?auto_16440 ) ( CLEAR ?auto_16431 ) ( not ( = ?auto_16430 ?auto_16431 ) ) ( not ( = ?auto_16430 ?auto_16440 ) ) ( not ( = ?auto_16431 ?auto_16440 ) ) ( not ( = ?auto_16435 ?auto_16441 ) ) ( SURFACE-AT ?auto_16429 ?auto_16433 ) ( CLEAR ?auto_16429 ) ( IS-CRATE ?auto_16430 ) ( AVAILABLE ?auto_16435 ) ( not ( = ?auto_16444 ?auto_16433 ) ) ( HOIST-AT ?auto_16442 ?auto_16444 ) ( AVAILABLE ?auto_16442 ) ( SURFACE-AT ?auto_16430 ?auto_16444 ) ( ON ?auto_16430 ?auto_16439 ) ( CLEAR ?auto_16430 ) ( TRUCK-AT ?auto_16434 ?auto_16433 ) ( not ( = ?auto_16429 ?auto_16430 ) ) ( not ( = ?auto_16429 ?auto_16439 ) ) ( not ( = ?auto_16430 ?auto_16439 ) ) ( not ( = ?auto_16435 ?auto_16442 ) ) ( not ( = ?auto_16429 ?auto_16431 ) ) ( not ( = ?auto_16429 ?auto_16440 ) ) ( not ( = ?auto_16431 ?auto_16439 ) ) ( not ( = ?auto_16443 ?auto_16444 ) ) ( not ( = ?auto_16441 ?auto_16442 ) ) ( not ( = ?auto_16440 ?auto_16439 ) ) ( not ( = ?auto_16429 ?auto_16432 ) ) ( not ( = ?auto_16429 ?auto_16436 ) ) ( not ( = ?auto_16430 ?auto_16432 ) ) ( not ( = ?auto_16430 ?auto_16436 ) ) ( not ( = ?auto_16432 ?auto_16440 ) ) ( not ( = ?auto_16432 ?auto_16439 ) ) ( not ( = ?auto_16437 ?auto_16443 ) ) ( not ( = ?auto_16437 ?auto_16444 ) ) ( not ( = ?auto_16438 ?auto_16441 ) ) ( not ( = ?auto_16438 ?auto_16442 ) ) ( not ( = ?auto_16436 ?auto_16440 ) ) ( not ( = ?auto_16436 ?auto_16439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16429 ?auto_16430 ?auto_16431 )
      ( MAKE-1CRATE ?auto_16431 ?auto_16432 )
      ( MAKE-3CRATE-VERIFY ?auto_16429 ?auto_16430 ?auto_16431 ?auto_16432 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16460 - SURFACE
      ?auto_16461 - SURFACE
      ?auto_16462 - SURFACE
      ?auto_16463 - SURFACE
      ?auto_16464 - SURFACE
    )
    :vars
    (
      ?auto_16469 - HOIST
      ?auto_16467 - PLACE
      ?auto_16468 - PLACE
      ?auto_16470 - HOIST
      ?auto_16466 - SURFACE
      ?auto_16475 - PLACE
      ?auto_16479 - HOIST
      ?auto_16474 - SURFACE
      ?auto_16477 - PLACE
      ?auto_16472 - HOIST
      ?auto_16471 - SURFACE
      ?auto_16473 - PLACE
      ?auto_16478 - HOIST
      ?auto_16476 - SURFACE
      ?auto_16465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16469 ?auto_16467 ) ( IS-CRATE ?auto_16464 ) ( not ( = ?auto_16468 ?auto_16467 ) ) ( HOIST-AT ?auto_16470 ?auto_16468 ) ( AVAILABLE ?auto_16470 ) ( SURFACE-AT ?auto_16464 ?auto_16468 ) ( ON ?auto_16464 ?auto_16466 ) ( CLEAR ?auto_16464 ) ( not ( = ?auto_16463 ?auto_16464 ) ) ( not ( = ?auto_16463 ?auto_16466 ) ) ( not ( = ?auto_16464 ?auto_16466 ) ) ( not ( = ?auto_16469 ?auto_16470 ) ) ( IS-CRATE ?auto_16463 ) ( not ( = ?auto_16475 ?auto_16467 ) ) ( HOIST-AT ?auto_16479 ?auto_16475 ) ( AVAILABLE ?auto_16479 ) ( SURFACE-AT ?auto_16463 ?auto_16475 ) ( ON ?auto_16463 ?auto_16474 ) ( CLEAR ?auto_16463 ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( not ( = ?auto_16462 ?auto_16474 ) ) ( not ( = ?auto_16463 ?auto_16474 ) ) ( not ( = ?auto_16469 ?auto_16479 ) ) ( IS-CRATE ?auto_16462 ) ( not ( = ?auto_16477 ?auto_16467 ) ) ( HOIST-AT ?auto_16472 ?auto_16477 ) ( AVAILABLE ?auto_16472 ) ( SURFACE-AT ?auto_16462 ?auto_16477 ) ( ON ?auto_16462 ?auto_16471 ) ( CLEAR ?auto_16462 ) ( not ( = ?auto_16461 ?auto_16462 ) ) ( not ( = ?auto_16461 ?auto_16471 ) ) ( not ( = ?auto_16462 ?auto_16471 ) ) ( not ( = ?auto_16469 ?auto_16472 ) ) ( SURFACE-AT ?auto_16460 ?auto_16467 ) ( CLEAR ?auto_16460 ) ( IS-CRATE ?auto_16461 ) ( AVAILABLE ?auto_16469 ) ( not ( = ?auto_16473 ?auto_16467 ) ) ( HOIST-AT ?auto_16478 ?auto_16473 ) ( AVAILABLE ?auto_16478 ) ( SURFACE-AT ?auto_16461 ?auto_16473 ) ( ON ?auto_16461 ?auto_16476 ) ( CLEAR ?auto_16461 ) ( TRUCK-AT ?auto_16465 ?auto_16467 ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16476 ) ) ( not ( = ?auto_16461 ?auto_16476 ) ) ( not ( = ?auto_16469 ?auto_16478 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16471 ) ) ( not ( = ?auto_16462 ?auto_16476 ) ) ( not ( = ?auto_16477 ?auto_16473 ) ) ( not ( = ?auto_16472 ?auto_16478 ) ) ( not ( = ?auto_16471 ?auto_16476 ) ) ( not ( = ?auto_16460 ?auto_16463 ) ) ( not ( = ?auto_16460 ?auto_16474 ) ) ( not ( = ?auto_16461 ?auto_16463 ) ) ( not ( = ?auto_16461 ?auto_16474 ) ) ( not ( = ?auto_16463 ?auto_16471 ) ) ( not ( = ?auto_16463 ?auto_16476 ) ) ( not ( = ?auto_16475 ?auto_16477 ) ) ( not ( = ?auto_16475 ?auto_16473 ) ) ( not ( = ?auto_16479 ?auto_16472 ) ) ( not ( = ?auto_16479 ?auto_16478 ) ) ( not ( = ?auto_16474 ?auto_16471 ) ) ( not ( = ?auto_16474 ?auto_16476 ) ) ( not ( = ?auto_16460 ?auto_16464 ) ) ( not ( = ?auto_16460 ?auto_16466 ) ) ( not ( = ?auto_16461 ?auto_16464 ) ) ( not ( = ?auto_16461 ?auto_16466 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( not ( = ?auto_16462 ?auto_16466 ) ) ( not ( = ?auto_16464 ?auto_16474 ) ) ( not ( = ?auto_16464 ?auto_16471 ) ) ( not ( = ?auto_16464 ?auto_16476 ) ) ( not ( = ?auto_16468 ?auto_16475 ) ) ( not ( = ?auto_16468 ?auto_16477 ) ) ( not ( = ?auto_16468 ?auto_16473 ) ) ( not ( = ?auto_16470 ?auto_16479 ) ) ( not ( = ?auto_16470 ?auto_16472 ) ) ( not ( = ?auto_16470 ?auto_16478 ) ) ( not ( = ?auto_16466 ?auto_16474 ) ) ( not ( = ?auto_16466 ?auto_16471 ) ) ( not ( = ?auto_16466 ?auto_16476 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 )
      ( MAKE-1CRATE ?auto_16463 ?auto_16464 )
      ( MAKE-4CRATE-VERIFY ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 ?auto_16464 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_16496 - SURFACE
      ?auto_16497 - SURFACE
      ?auto_16498 - SURFACE
      ?auto_16499 - SURFACE
      ?auto_16500 - SURFACE
      ?auto_16501 - SURFACE
    )
    :vars
    (
      ?auto_16507 - HOIST
      ?auto_16506 - PLACE
      ?auto_16504 - PLACE
      ?auto_16502 - HOIST
      ?auto_16503 - SURFACE
      ?auto_16508 - PLACE
      ?auto_16509 - HOIST
      ?auto_16510 - SURFACE
      ?auto_16511 - PLACE
      ?auto_16516 - HOIST
      ?auto_16517 - SURFACE
      ?auto_16513 - PLACE
      ?auto_16515 - HOIST
      ?auto_16518 - SURFACE
      ?auto_16519 - PLACE
      ?auto_16514 - HOIST
      ?auto_16512 - SURFACE
      ?auto_16505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16507 ?auto_16506 ) ( IS-CRATE ?auto_16501 ) ( not ( = ?auto_16504 ?auto_16506 ) ) ( HOIST-AT ?auto_16502 ?auto_16504 ) ( AVAILABLE ?auto_16502 ) ( SURFACE-AT ?auto_16501 ?auto_16504 ) ( ON ?auto_16501 ?auto_16503 ) ( CLEAR ?auto_16501 ) ( not ( = ?auto_16500 ?auto_16501 ) ) ( not ( = ?auto_16500 ?auto_16503 ) ) ( not ( = ?auto_16501 ?auto_16503 ) ) ( not ( = ?auto_16507 ?auto_16502 ) ) ( IS-CRATE ?auto_16500 ) ( not ( = ?auto_16508 ?auto_16506 ) ) ( HOIST-AT ?auto_16509 ?auto_16508 ) ( AVAILABLE ?auto_16509 ) ( SURFACE-AT ?auto_16500 ?auto_16508 ) ( ON ?auto_16500 ?auto_16510 ) ( CLEAR ?auto_16500 ) ( not ( = ?auto_16499 ?auto_16500 ) ) ( not ( = ?auto_16499 ?auto_16510 ) ) ( not ( = ?auto_16500 ?auto_16510 ) ) ( not ( = ?auto_16507 ?auto_16509 ) ) ( IS-CRATE ?auto_16499 ) ( not ( = ?auto_16511 ?auto_16506 ) ) ( HOIST-AT ?auto_16516 ?auto_16511 ) ( AVAILABLE ?auto_16516 ) ( SURFACE-AT ?auto_16499 ?auto_16511 ) ( ON ?auto_16499 ?auto_16517 ) ( CLEAR ?auto_16499 ) ( not ( = ?auto_16498 ?auto_16499 ) ) ( not ( = ?auto_16498 ?auto_16517 ) ) ( not ( = ?auto_16499 ?auto_16517 ) ) ( not ( = ?auto_16507 ?auto_16516 ) ) ( IS-CRATE ?auto_16498 ) ( not ( = ?auto_16513 ?auto_16506 ) ) ( HOIST-AT ?auto_16515 ?auto_16513 ) ( AVAILABLE ?auto_16515 ) ( SURFACE-AT ?auto_16498 ?auto_16513 ) ( ON ?auto_16498 ?auto_16518 ) ( CLEAR ?auto_16498 ) ( not ( = ?auto_16497 ?auto_16498 ) ) ( not ( = ?auto_16497 ?auto_16518 ) ) ( not ( = ?auto_16498 ?auto_16518 ) ) ( not ( = ?auto_16507 ?auto_16515 ) ) ( SURFACE-AT ?auto_16496 ?auto_16506 ) ( CLEAR ?auto_16496 ) ( IS-CRATE ?auto_16497 ) ( AVAILABLE ?auto_16507 ) ( not ( = ?auto_16519 ?auto_16506 ) ) ( HOIST-AT ?auto_16514 ?auto_16519 ) ( AVAILABLE ?auto_16514 ) ( SURFACE-AT ?auto_16497 ?auto_16519 ) ( ON ?auto_16497 ?auto_16512 ) ( CLEAR ?auto_16497 ) ( TRUCK-AT ?auto_16505 ?auto_16506 ) ( not ( = ?auto_16496 ?auto_16497 ) ) ( not ( = ?auto_16496 ?auto_16512 ) ) ( not ( = ?auto_16497 ?auto_16512 ) ) ( not ( = ?auto_16507 ?auto_16514 ) ) ( not ( = ?auto_16496 ?auto_16498 ) ) ( not ( = ?auto_16496 ?auto_16518 ) ) ( not ( = ?auto_16498 ?auto_16512 ) ) ( not ( = ?auto_16513 ?auto_16519 ) ) ( not ( = ?auto_16515 ?auto_16514 ) ) ( not ( = ?auto_16518 ?auto_16512 ) ) ( not ( = ?auto_16496 ?auto_16499 ) ) ( not ( = ?auto_16496 ?auto_16517 ) ) ( not ( = ?auto_16497 ?auto_16499 ) ) ( not ( = ?auto_16497 ?auto_16517 ) ) ( not ( = ?auto_16499 ?auto_16518 ) ) ( not ( = ?auto_16499 ?auto_16512 ) ) ( not ( = ?auto_16511 ?auto_16513 ) ) ( not ( = ?auto_16511 ?auto_16519 ) ) ( not ( = ?auto_16516 ?auto_16515 ) ) ( not ( = ?auto_16516 ?auto_16514 ) ) ( not ( = ?auto_16517 ?auto_16518 ) ) ( not ( = ?auto_16517 ?auto_16512 ) ) ( not ( = ?auto_16496 ?auto_16500 ) ) ( not ( = ?auto_16496 ?auto_16510 ) ) ( not ( = ?auto_16497 ?auto_16500 ) ) ( not ( = ?auto_16497 ?auto_16510 ) ) ( not ( = ?auto_16498 ?auto_16500 ) ) ( not ( = ?auto_16498 ?auto_16510 ) ) ( not ( = ?auto_16500 ?auto_16517 ) ) ( not ( = ?auto_16500 ?auto_16518 ) ) ( not ( = ?auto_16500 ?auto_16512 ) ) ( not ( = ?auto_16508 ?auto_16511 ) ) ( not ( = ?auto_16508 ?auto_16513 ) ) ( not ( = ?auto_16508 ?auto_16519 ) ) ( not ( = ?auto_16509 ?auto_16516 ) ) ( not ( = ?auto_16509 ?auto_16515 ) ) ( not ( = ?auto_16509 ?auto_16514 ) ) ( not ( = ?auto_16510 ?auto_16517 ) ) ( not ( = ?auto_16510 ?auto_16518 ) ) ( not ( = ?auto_16510 ?auto_16512 ) ) ( not ( = ?auto_16496 ?auto_16501 ) ) ( not ( = ?auto_16496 ?auto_16503 ) ) ( not ( = ?auto_16497 ?auto_16501 ) ) ( not ( = ?auto_16497 ?auto_16503 ) ) ( not ( = ?auto_16498 ?auto_16501 ) ) ( not ( = ?auto_16498 ?auto_16503 ) ) ( not ( = ?auto_16499 ?auto_16501 ) ) ( not ( = ?auto_16499 ?auto_16503 ) ) ( not ( = ?auto_16501 ?auto_16510 ) ) ( not ( = ?auto_16501 ?auto_16517 ) ) ( not ( = ?auto_16501 ?auto_16518 ) ) ( not ( = ?auto_16501 ?auto_16512 ) ) ( not ( = ?auto_16504 ?auto_16508 ) ) ( not ( = ?auto_16504 ?auto_16511 ) ) ( not ( = ?auto_16504 ?auto_16513 ) ) ( not ( = ?auto_16504 ?auto_16519 ) ) ( not ( = ?auto_16502 ?auto_16509 ) ) ( not ( = ?auto_16502 ?auto_16516 ) ) ( not ( = ?auto_16502 ?auto_16515 ) ) ( not ( = ?auto_16502 ?auto_16514 ) ) ( not ( = ?auto_16503 ?auto_16510 ) ) ( not ( = ?auto_16503 ?auto_16517 ) ) ( not ( = ?auto_16503 ?auto_16518 ) ) ( not ( = ?auto_16503 ?auto_16512 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_16496 ?auto_16497 ?auto_16498 ?auto_16499 ?auto_16500 )
      ( MAKE-1CRATE ?auto_16500 ?auto_16501 )
      ( MAKE-5CRATE-VERIFY ?auto_16496 ?auto_16497 ?auto_16498 ?auto_16499 ?auto_16500 ?auto_16501 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_16537 - SURFACE
      ?auto_16538 - SURFACE
      ?auto_16539 - SURFACE
      ?auto_16540 - SURFACE
      ?auto_16541 - SURFACE
      ?auto_16542 - SURFACE
      ?auto_16543 - SURFACE
    )
    :vars
    (
      ?auto_16547 - HOIST
      ?auto_16548 - PLACE
      ?auto_16546 - PLACE
      ?auto_16545 - HOIST
      ?auto_16549 - SURFACE
      ?auto_16553 - PLACE
      ?auto_16551 - HOIST
      ?auto_16564 - SURFACE
      ?auto_16552 - PLACE
      ?auto_16555 - HOIST
      ?auto_16554 - SURFACE
      ?auto_16557 - PLACE
      ?auto_16562 - HOIST
      ?auto_16556 - SURFACE
      ?auto_16560 - PLACE
      ?auto_16561 - HOIST
      ?auto_16563 - SURFACE
      ?auto_16550 - PLACE
      ?auto_16559 - HOIST
      ?auto_16558 - SURFACE
      ?auto_16544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16547 ?auto_16548 ) ( IS-CRATE ?auto_16543 ) ( not ( = ?auto_16546 ?auto_16548 ) ) ( HOIST-AT ?auto_16545 ?auto_16546 ) ( AVAILABLE ?auto_16545 ) ( SURFACE-AT ?auto_16543 ?auto_16546 ) ( ON ?auto_16543 ?auto_16549 ) ( CLEAR ?auto_16543 ) ( not ( = ?auto_16542 ?auto_16543 ) ) ( not ( = ?auto_16542 ?auto_16549 ) ) ( not ( = ?auto_16543 ?auto_16549 ) ) ( not ( = ?auto_16547 ?auto_16545 ) ) ( IS-CRATE ?auto_16542 ) ( not ( = ?auto_16553 ?auto_16548 ) ) ( HOIST-AT ?auto_16551 ?auto_16553 ) ( AVAILABLE ?auto_16551 ) ( SURFACE-AT ?auto_16542 ?auto_16553 ) ( ON ?auto_16542 ?auto_16564 ) ( CLEAR ?auto_16542 ) ( not ( = ?auto_16541 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16564 ) ) ( not ( = ?auto_16542 ?auto_16564 ) ) ( not ( = ?auto_16547 ?auto_16551 ) ) ( IS-CRATE ?auto_16541 ) ( not ( = ?auto_16552 ?auto_16548 ) ) ( HOIST-AT ?auto_16555 ?auto_16552 ) ( AVAILABLE ?auto_16555 ) ( SURFACE-AT ?auto_16541 ?auto_16552 ) ( ON ?auto_16541 ?auto_16554 ) ( CLEAR ?auto_16541 ) ( not ( = ?auto_16540 ?auto_16541 ) ) ( not ( = ?auto_16540 ?auto_16554 ) ) ( not ( = ?auto_16541 ?auto_16554 ) ) ( not ( = ?auto_16547 ?auto_16555 ) ) ( IS-CRATE ?auto_16540 ) ( not ( = ?auto_16557 ?auto_16548 ) ) ( HOIST-AT ?auto_16562 ?auto_16557 ) ( AVAILABLE ?auto_16562 ) ( SURFACE-AT ?auto_16540 ?auto_16557 ) ( ON ?auto_16540 ?auto_16556 ) ( CLEAR ?auto_16540 ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( not ( = ?auto_16539 ?auto_16556 ) ) ( not ( = ?auto_16540 ?auto_16556 ) ) ( not ( = ?auto_16547 ?auto_16562 ) ) ( IS-CRATE ?auto_16539 ) ( not ( = ?auto_16560 ?auto_16548 ) ) ( HOIST-AT ?auto_16561 ?auto_16560 ) ( AVAILABLE ?auto_16561 ) ( SURFACE-AT ?auto_16539 ?auto_16560 ) ( ON ?auto_16539 ?auto_16563 ) ( CLEAR ?auto_16539 ) ( not ( = ?auto_16538 ?auto_16539 ) ) ( not ( = ?auto_16538 ?auto_16563 ) ) ( not ( = ?auto_16539 ?auto_16563 ) ) ( not ( = ?auto_16547 ?auto_16561 ) ) ( SURFACE-AT ?auto_16537 ?auto_16548 ) ( CLEAR ?auto_16537 ) ( IS-CRATE ?auto_16538 ) ( AVAILABLE ?auto_16547 ) ( not ( = ?auto_16550 ?auto_16548 ) ) ( HOIST-AT ?auto_16559 ?auto_16550 ) ( AVAILABLE ?auto_16559 ) ( SURFACE-AT ?auto_16538 ?auto_16550 ) ( ON ?auto_16538 ?auto_16558 ) ( CLEAR ?auto_16538 ) ( TRUCK-AT ?auto_16544 ?auto_16548 ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( not ( = ?auto_16537 ?auto_16558 ) ) ( not ( = ?auto_16538 ?auto_16558 ) ) ( not ( = ?auto_16547 ?auto_16559 ) ) ( not ( = ?auto_16537 ?auto_16539 ) ) ( not ( = ?auto_16537 ?auto_16563 ) ) ( not ( = ?auto_16539 ?auto_16558 ) ) ( not ( = ?auto_16560 ?auto_16550 ) ) ( not ( = ?auto_16561 ?auto_16559 ) ) ( not ( = ?auto_16563 ?auto_16558 ) ) ( not ( = ?auto_16537 ?auto_16540 ) ) ( not ( = ?auto_16537 ?auto_16556 ) ) ( not ( = ?auto_16538 ?auto_16540 ) ) ( not ( = ?auto_16538 ?auto_16556 ) ) ( not ( = ?auto_16540 ?auto_16563 ) ) ( not ( = ?auto_16540 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16560 ) ) ( not ( = ?auto_16557 ?auto_16550 ) ) ( not ( = ?auto_16562 ?auto_16561 ) ) ( not ( = ?auto_16562 ?auto_16559 ) ) ( not ( = ?auto_16556 ?auto_16563 ) ) ( not ( = ?auto_16556 ?auto_16558 ) ) ( not ( = ?auto_16537 ?auto_16541 ) ) ( not ( = ?auto_16537 ?auto_16554 ) ) ( not ( = ?auto_16538 ?auto_16541 ) ) ( not ( = ?auto_16538 ?auto_16554 ) ) ( not ( = ?auto_16539 ?auto_16541 ) ) ( not ( = ?auto_16539 ?auto_16554 ) ) ( not ( = ?auto_16541 ?auto_16556 ) ) ( not ( = ?auto_16541 ?auto_16563 ) ) ( not ( = ?auto_16541 ?auto_16558 ) ) ( not ( = ?auto_16552 ?auto_16557 ) ) ( not ( = ?auto_16552 ?auto_16560 ) ) ( not ( = ?auto_16552 ?auto_16550 ) ) ( not ( = ?auto_16555 ?auto_16562 ) ) ( not ( = ?auto_16555 ?auto_16561 ) ) ( not ( = ?auto_16555 ?auto_16559 ) ) ( not ( = ?auto_16554 ?auto_16556 ) ) ( not ( = ?auto_16554 ?auto_16563 ) ) ( not ( = ?auto_16554 ?auto_16558 ) ) ( not ( = ?auto_16537 ?auto_16542 ) ) ( not ( = ?auto_16537 ?auto_16564 ) ) ( not ( = ?auto_16538 ?auto_16542 ) ) ( not ( = ?auto_16538 ?auto_16564 ) ) ( not ( = ?auto_16539 ?auto_16542 ) ) ( not ( = ?auto_16539 ?auto_16564 ) ) ( not ( = ?auto_16540 ?auto_16542 ) ) ( not ( = ?auto_16540 ?auto_16564 ) ) ( not ( = ?auto_16542 ?auto_16554 ) ) ( not ( = ?auto_16542 ?auto_16556 ) ) ( not ( = ?auto_16542 ?auto_16563 ) ) ( not ( = ?auto_16542 ?auto_16558 ) ) ( not ( = ?auto_16553 ?auto_16552 ) ) ( not ( = ?auto_16553 ?auto_16557 ) ) ( not ( = ?auto_16553 ?auto_16560 ) ) ( not ( = ?auto_16553 ?auto_16550 ) ) ( not ( = ?auto_16551 ?auto_16555 ) ) ( not ( = ?auto_16551 ?auto_16562 ) ) ( not ( = ?auto_16551 ?auto_16561 ) ) ( not ( = ?auto_16551 ?auto_16559 ) ) ( not ( = ?auto_16564 ?auto_16554 ) ) ( not ( = ?auto_16564 ?auto_16556 ) ) ( not ( = ?auto_16564 ?auto_16563 ) ) ( not ( = ?auto_16564 ?auto_16558 ) ) ( not ( = ?auto_16537 ?auto_16543 ) ) ( not ( = ?auto_16537 ?auto_16549 ) ) ( not ( = ?auto_16538 ?auto_16543 ) ) ( not ( = ?auto_16538 ?auto_16549 ) ) ( not ( = ?auto_16539 ?auto_16543 ) ) ( not ( = ?auto_16539 ?auto_16549 ) ) ( not ( = ?auto_16540 ?auto_16543 ) ) ( not ( = ?auto_16540 ?auto_16549 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( not ( = ?auto_16541 ?auto_16549 ) ) ( not ( = ?auto_16543 ?auto_16564 ) ) ( not ( = ?auto_16543 ?auto_16554 ) ) ( not ( = ?auto_16543 ?auto_16556 ) ) ( not ( = ?auto_16543 ?auto_16563 ) ) ( not ( = ?auto_16543 ?auto_16558 ) ) ( not ( = ?auto_16546 ?auto_16553 ) ) ( not ( = ?auto_16546 ?auto_16552 ) ) ( not ( = ?auto_16546 ?auto_16557 ) ) ( not ( = ?auto_16546 ?auto_16560 ) ) ( not ( = ?auto_16546 ?auto_16550 ) ) ( not ( = ?auto_16545 ?auto_16551 ) ) ( not ( = ?auto_16545 ?auto_16555 ) ) ( not ( = ?auto_16545 ?auto_16562 ) ) ( not ( = ?auto_16545 ?auto_16561 ) ) ( not ( = ?auto_16545 ?auto_16559 ) ) ( not ( = ?auto_16549 ?auto_16564 ) ) ( not ( = ?auto_16549 ?auto_16554 ) ) ( not ( = ?auto_16549 ?auto_16556 ) ) ( not ( = ?auto_16549 ?auto_16563 ) ) ( not ( = ?auto_16549 ?auto_16558 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_16537 ?auto_16538 ?auto_16539 ?auto_16540 ?auto_16541 ?auto_16542 )
      ( MAKE-1CRATE ?auto_16542 ?auto_16543 )
      ( MAKE-6CRATE-VERIFY ?auto_16537 ?auto_16538 ?auto_16539 ?auto_16540 ?auto_16541 ?auto_16542 ?auto_16543 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16583 - SURFACE
      ?auto_16584 - SURFACE
      ?auto_16585 - SURFACE
      ?auto_16586 - SURFACE
      ?auto_16587 - SURFACE
      ?auto_16588 - SURFACE
      ?auto_16589 - SURFACE
      ?auto_16590 - SURFACE
    )
    :vars
    (
      ?auto_16595 - HOIST
      ?auto_16596 - PLACE
      ?auto_16591 - PLACE
      ?auto_16592 - HOIST
      ?auto_16594 - SURFACE
      ?auto_16600 - PLACE
      ?auto_16604 - HOIST
      ?auto_16599 - SURFACE
      ?auto_16609 - PLACE
      ?auto_16597 - HOIST
      ?auto_16608 - SURFACE
      ?auto_16607 - PLACE
      ?auto_16605 - HOIST
      ?auto_16601 - SURFACE
      ?auto_16603 - PLACE
      ?auto_16613 - HOIST
      ?auto_16610 - SURFACE
      ?auto_16614 - PLACE
      ?auto_16611 - HOIST
      ?auto_16612 - SURFACE
      ?auto_16602 - PLACE
      ?auto_16606 - HOIST
      ?auto_16598 - SURFACE
      ?auto_16593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16595 ?auto_16596 ) ( IS-CRATE ?auto_16590 ) ( not ( = ?auto_16591 ?auto_16596 ) ) ( HOIST-AT ?auto_16592 ?auto_16591 ) ( AVAILABLE ?auto_16592 ) ( SURFACE-AT ?auto_16590 ?auto_16591 ) ( ON ?auto_16590 ?auto_16594 ) ( CLEAR ?auto_16590 ) ( not ( = ?auto_16589 ?auto_16590 ) ) ( not ( = ?auto_16589 ?auto_16594 ) ) ( not ( = ?auto_16590 ?auto_16594 ) ) ( not ( = ?auto_16595 ?auto_16592 ) ) ( IS-CRATE ?auto_16589 ) ( not ( = ?auto_16600 ?auto_16596 ) ) ( HOIST-AT ?auto_16604 ?auto_16600 ) ( AVAILABLE ?auto_16604 ) ( SURFACE-AT ?auto_16589 ?auto_16600 ) ( ON ?auto_16589 ?auto_16599 ) ( CLEAR ?auto_16589 ) ( not ( = ?auto_16588 ?auto_16589 ) ) ( not ( = ?auto_16588 ?auto_16599 ) ) ( not ( = ?auto_16589 ?auto_16599 ) ) ( not ( = ?auto_16595 ?auto_16604 ) ) ( IS-CRATE ?auto_16588 ) ( not ( = ?auto_16609 ?auto_16596 ) ) ( HOIST-AT ?auto_16597 ?auto_16609 ) ( AVAILABLE ?auto_16597 ) ( SURFACE-AT ?auto_16588 ?auto_16609 ) ( ON ?auto_16588 ?auto_16608 ) ( CLEAR ?auto_16588 ) ( not ( = ?auto_16587 ?auto_16588 ) ) ( not ( = ?auto_16587 ?auto_16608 ) ) ( not ( = ?auto_16588 ?auto_16608 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( IS-CRATE ?auto_16587 ) ( not ( = ?auto_16607 ?auto_16596 ) ) ( HOIST-AT ?auto_16605 ?auto_16607 ) ( AVAILABLE ?auto_16605 ) ( SURFACE-AT ?auto_16587 ?auto_16607 ) ( ON ?auto_16587 ?auto_16601 ) ( CLEAR ?auto_16587 ) ( not ( = ?auto_16586 ?auto_16587 ) ) ( not ( = ?auto_16586 ?auto_16601 ) ) ( not ( = ?auto_16587 ?auto_16601 ) ) ( not ( = ?auto_16595 ?auto_16605 ) ) ( IS-CRATE ?auto_16586 ) ( not ( = ?auto_16603 ?auto_16596 ) ) ( HOIST-AT ?auto_16613 ?auto_16603 ) ( AVAILABLE ?auto_16613 ) ( SURFACE-AT ?auto_16586 ?auto_16603 ) ( ON ?auto_16586 ?auto_16610 ) ( CLEAR ?auto_16586 ) ( not ( = ?auto_16585 ?auto_16586 ) ) ( not ( = ?auto_16585 ?auto_16610 ) ) ( not ( = ?auto_16586 ?auto_16610 ) ) ( not ( = ?auto_16595 ?auto_16613 ) ) ( IS-CRATE ?auto_16585 ) ( not ( = ?auto_16614 ?auto_16596 ) ) ( HOIST-AT ?auto_16611 ?auto_16614 ) ( AVAILABLE ?auto_16611 ) ( SURFACE-AT ?auto_16585 ?auto_16614 ) ( ON ?auto_16585 ?auto_16612 ) ( CLEAR ?auto_16585 ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16612 ) ) ( not ( = ?auto_16585 ?auto_16612 ) ) ( not ( = ?auto_16595 ?auto_16611 ) ) ( SURFACE-AT ?auto_16583 ?auto_16596 ) ( CLEAR ?auto_16583 ) ( IS-CRATE ?auto_16584 ) ( AVAILABLE ?auto_16595 ) ( not ( = ?auto_16602 ?auto_16596 ) ) ( HOIST-AT ?auto_16606 ?auto_16602 ) ( AVAILABLE ?auto_16606 ) ( SURFACE-AT ?auto_16584 ?auto_16602 ) ( ON ?auto_16584 ?auto_16598 ) ( CLEAR ?auto_16584 ) ( TRUCK-AT ?auto_16593 ?auto_16596 ) ( not ( = ?auto_16583 ?auto_16584 ) ) ( not ( = ?auto_16583 ?auto_16598 ) ) ( not ( = ?auto_16584 ?auto_16598 ) ) ( not ( = ?auto_16595 ?auto_16606 ) ) ( not ( = ?auto_16583 ?auto_16585 ) ) ( not ( = ?auto_16583 ?auto_16612 ) ) ( not ( = ?auto_16585 ?auto_16598 ) ) ( not ( = ?auto_16614 ?auto_16602 ) ) ( not ( = ?auto_16611 ?auto_16606 ) ) ( not ( = ?auto_16612 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( not ( = ?auto_16583 ?auto_16610 ) ) ( not ( = ?auto_16584 ?auto_16586 ) ) ( not ( = ?auto_16584 ?auto_16610 ) ) ( not ( = ?auto_16586 ?auto_16612 ) ) ( not ( = ?auto_16586 ?auto_16598 ) ) ( not ( = ?auto_16603 ?auto_16614 ) ) ( not ( = ?auto_16603 ?auto_16602 ) ) ( not ( = ?auto_16613 ?auto_16611 ) ) ( not ( = ?auto_16613 ?auto_16606 ) ) ( not ( = ?auto_16610 ?auto_16612 ) ) ( not ( = ?auto_16610 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16587 ) ) ( not ( = ?auto_16583 ?auto_16601 ) ) ( not ( = ?auto_16584 ?auto_16587 ) ) ( not ( = ?auto_16584 ?auto_16601 ) ) ( not ( = ?auto_16585 ?auto_16587 ) ) ( not ( = ?auto_16585 ?auto_16601 ) ) ( not ( = ?auto_16587 ?auto_16610 ) ) ( not ( = ?auto_16587 ?auto_16612 ) ) ( not ( = ?auto_16587 ?auto_16598 ) ) ( not ( = ?auto_16607 ?auto_16603 ) ) ( not ( = ?auto_16607 ?auto_16614 ) ) ( not ( = ?auto_16607 ?auto_16602 ) ) ( not ( = ?auto_16605 ?auto_16613 ) ) ( not ( = ?auto_16605 ?auto_16611 ) ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( not ( = ?auto_16601 ?auto_16610 ) ) ( not ( = ?auto_16601 ?auto_16612 ) ) ( not ( = ?auto_16601 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16588 ) ) ( not ( = ?auto_16583 ?auto_16608 ) ) ( not ( = ?auto_16584 ?auto_16588 ) ) ( not ( = ?auto_16584 ?auto_16608 ) ) ( not ( = ?auto_16585 ?auto_16588 ) ) ( not ( = ?auto_16585 ?auto_16608 ) ) ( not ( = ?auto_16586 ?auto_16588 ) ) ( not ( = ?auto_16586 ?auto_16608 ) ) ( not ( = ?auto_16588 ?auto_16601 ) ) ( not ( = ?auto_16588 ?auto_16610 ) ) ( not ( = ?auto_16588 ?auto_16612 ) ) ( not ( = ?auto_16588 ?auto_16598 ) ) ( not ( = ?auto_16609 ?auto_16607 ) ) ( not ( = ?auto_16609 ?auto_16603 ) ) ( not ( = ?auto_16609 ?auto_16614 ) ) ( not ( = ?auto_16609 ?auto_16602 ) ) ( not ( = ?auto_16597 ?auto_16605 ) ) ( not ( = ?auto_16597 ?auto_16613 ) ) ( not ( = ?auto_16597 ?auto_16611 ) ) ( not ( = ?auto_16597 ?auto_16606 ) ) ( not ( = ?auto_16608 ?auto_16601 ) ) ( not ( = ?auto_16608 ?auto_16610 ) ) ( not ( = ?auto_16608 ?auto_16612 ) ) ( not ( = ?auto_16608 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16589 ) ) ( not ( = ?auto_16583 ?auto_16599 ) ) ( not ( = ?auto_16584 ?auto_16589 ) ) ( not ( = ?auto_16584 ?auto_16599 ) ) ( not ( = ?auto_16585 ?auto_16589 ) ) ( not ( = ?auto_16585 ?auto_16599 ) ) ( not ( = ?auto_16586 ?auto_16589 ) ) ( not ( = ?auto_16586 ?auto_16599 ) ) ( not ( = ?auto_16587 ?auto_16589 ) ) ( not ( = ?auto_16587 ?auto_16599 ) ) ( not ( = ?auto_16589 ?auto_16608 ) ) ( not ( = ?auto_16589 ?auto_16601 ) ) ( not ( = ?auto_16589 ?auto_16610 ) ) ( not ( = ?auto_16589 ?auto_16612 ) ) ( not ( = ?auto_16589 ?auto_16598 ) ) ( not ( = ?auto_16600 ?auto_16609 ) ) ( not ( = ?auto_16600 ?auto_16607 ) ) ( not ( = ?auto_16600 ?auto_16603 ) ) ( not ( = ?auto_16600 ?auto_16614 ) ) ( not ( = ?auto_16600 ?auto_16602 ) ) ( not ( = ?auto_16604 ?auto_16597 ) ) ( not ( = ?auto_16604 ?auto_16605 ) ) ( not ( = ?auto_16604 ?auto_16613 ) ) ( not ( = ?auto_16604 ?auto_16611 ) ) ( not ( = ?auto_16604 ?auto_16606 ) ) ( not ( = ?auto_16599 ?auto_16608 ) ) ( not ( = ?auto_16599 ?auto_16601 ) ) ( not ( = ?auto_16599 ?auto_16610 ) ) ( not ( = ?auto_16599 ?auto_16612 ) ) ( not ( = ?auto_16599 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16590 ) ) ( not ( = ?auto_16583 ?auto_16594 ) ) ( not ( = ?auto_16584 ?auto_16590 ) ) ( not ( = ?auto_16584 ?auto_16594 ) ) ( not ( = ?auto_16585 ?auto_16590 ) ) ( not ( = ?auto_16585 ?auto_16594 ) ) ( not ( = ?auto_16586 ?auto_16590 ) ) ( not ( = ?auto_16586 ?auto_16594 ) ) ( not ( = ?auto_16587 ?auto_16590 ) ) ( not ( = ?auto_16587 ?auto_16594 ) ) ( not ( = ?auto_16588 ?auto_16590 ) ) ( not ( = ?auto_16588 ?auto_16594 ) ) ( not ( = ?auto_16590 ?auto_16599 ) ) ( not ( = ?auto_16590 ?auto_16608 ) ) ( not ( = ?auto_16590 ?auto_16601 ) ) ( not ( = ?auto_16590 ?auto_16610 ) ) ( not ( = ?auto_16590 ?auto_16612 ) ) ( not ( = ?auto_16590 ?auto_16598 ) ) ( not ( = ?auto_16591 ?auto_16600 ) ) ( not ( = ?auto_16591 ?auto_16609 ) ) ( not ( = ?auto_16591 ?auto_16607 ) ) ( not ( = ?auto_16591 ?auto_16603 ) ) ( not ( = ?auto_16591 ?auto_16614 ) ) ( not ( = ?auto_16591 ?auto_16602 ) ) ( not ( = ?auto_16592 ?auto_16604 ) ) ( not ( = ?auto_16592 ?auto_16597 ) ) ( not ( = ?auto_16592 ?auto_16605 ) ) ( not ( = ?auto_16592 ?auto_16613 ) ) ( not ( = ?auto_16592 ?auto_16611 ) ) ( not ( = ?auto_16592 ?auto_16606 ) ) ( not ( = ?auto_16594 ?auto_16599 ) ) ( not ( = ?auto_16594 ?auto_16608 ) ) ( not ( = ?auto_16594 ?auto_16601 ) ) ( not ( = ?auto_16594 ?auto_16610 ) ) ( not ( = ?auto_16594 ?auto_16612 ) ) ( not ( = ?auto_16594 ?auto_16598 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16583 ?auto_16584 ?auto_16585 ?auto_16586 ?auto_16587 ?auto_16588 ?auto_16589 )
      ( MAKE-1CRATE ?auto_16589 ?auto_16590 )
      ( MAKE-7CRATE-VERIFY ?auto_16583 ?auto_16584 ?auto_16585 ?auto_16586 ?auto_16587 ?auto_16588 ?auto_16589 ?auto_16590 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16634 - SURFACE
      ?auto_16635 - SURFACE
      ?auto_16636 - SURFACE
      ?auto_16637 - SURFACE
      ?auto_16638 - SURFACE
      ?auto_16639 - SURFACE
      ?auto_16640 - SURFACE
      ?auto_16641 - SURFACE
      ?auto_16642 - SURFACE
    )
    :vars
    (
      ?auto_16648 - HOIST
      ?auto_16647 - PLACE
      ?auto_16644 - PLACE
      ?auto_16645 - HOIST
      ?auto_16643 - SURFACE
      ?auto_16658 - PLACE
      ?auto_16652 - HOIST
      ?auto_16656 - SURFACE
      ?auto_16668 - PLACE
      ?auto_16654 - HOIST
      ?auto_16662 - SURFACE
      ?auto_16661 - PLACE
      ?auto_16664 - HOIST
      ?auto_16651 - SURFACE
      ?auto_16649 - PLACE
      ?auto_16650 - HOIST
      ?auto_16667 - SURFACE
      ?auto_16665 - PLACE
      ?auto_16669 - HOIST
      ?auto_16666 - SURFACE
      ?auto_16657 - PLACE
      ?auto_16653 - HOIST
      ?auto_16655 - SURFACE
      ?auto_16659 - PLACE
      ?auto_16660 - HOIST
      ?auto_16663 - SURFACE
      ?auto_16646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16648 ?auto_16647 ) ( IS-CRATE ?auto_16642 ) ( not ( = ?auto_16644 ?auto_16647 ) ) ( HOIST-AT ?auto_16645 ?auto_16644 ) ( AVAILABLE ?auto_16645 ) ( SURFACE-AT ?auto_16642 ?auto_16644 ) ( ON ?auto_16642 ?auto_16643 ) ( CLEAR ?auto_16642 ) ( not ( = ?auto_16641 ?auto_16642 ) ) ( not ( = ?auto_16641 ?auto_16643 ) ) ( not ( = ?auto_16642 ?auto_16643 ) ) ( not ( = ?auto_16648 ?auto_16645 ) ) ( IS-CRATE ?auto_16641 ) ( not ( = ?auto_16658 ?auto_16647 ) ) ( HOIST-AT ?auto_16652 ?auto_16658 ) ( AVAILABLE ?auto_16652 ) ( SURFACE-AT ?auto_16641 ?auto_16658 ) ( ON ?auto_16641 ?auto_16656 ) ( CLEAR ?auto_16641 ) ( not ( = ?auto_16640 ?auto_16641 ) ) ( not ( = ?auto_16640 ?auto_16656 ) ) ( not ( = ?auto_16641 ?auto_16656 ) ) ( not ( = ?auto_16648 ?auto_16652 ) ) ( IS-CRATE ?auto_16640 ) ( not ( = ?auto_16668 ?auto_16647 ) ) ( HOIST-AT ?auto_16654 ?auto_16668 ) ( AVAILABLE ?auto_16654 ) ( SURFACE-AT ?auto_16640 ?auto_16668 ) ( ON ?auto_16640 ?auto_16662 ) ( CLEAR ?auto_16640 ) ( not ( = ?auto_16639 ?auto_16640 ) ) ( not ( = ?auto_16639 ?auto_16662 ) ) ( not ( = ?auto_16640 ?auto_16662 ) ) ( not ( = ?auto_16648 ?auto_16654 ) ) ( IS-CRATE ?auto_16639 ) ( not ( = ?auto_16661 ?auto_16647 ) ) ( HOIST-AT ?auto_16664 ?auto_16661 ) ( AVAILABLE ?auto_16664 ) ( SURFACE-AT ?auto_16639 ?auto_16661 ) ( ON ?auto_16639 ?auto_16651 ) ( CLEAR ?auto_16639 ) ( not ( = ?auto_16638 ?auto_16639 ) ) ( not ( = ?auto_16638 ?auto_16651 ) ) ( not ( = ?auto_16639 ?auto_16651 ) ) ( not ( = ?auto_16648 ?auto_16664 ) ) ( IS-CRATE ?auto_16638 ) ( not ( = ?auto_16649 ?auto_16647 ) ) ( HOIST-AT ?auto_16650 ?auto_16649 ) ( AVAILABLE ?auto_16650 ) ( SURFACE-AT ?auto_16638 ?auto_16649 ) ( ON ?auto_16638 ?auto_16667 ) ( CLEAR ?auto_16638 ) ( not ( = ?auto_16637 ?auto_16638 ) ) ( not ( = ?auto_16637 ?auto_16667 ) ) ( not ( = ?auto_16638 ?auto_16667 ) ) ( not ( = ?auto_16648 ?auto_16650 ) ) ( IS-CRATE ?auto_16637 ) ( not ( = ?auto_16665 ?auto_16647 ) ) ( HOIST-AT ?auto_16669 ?auto_16665 ) ( AVAILABLE ?auto_16669 ) ( SURFACE-AT ?auto_16637 ?auto_16665 ) ( ON ?auto_16637 ?auto_16666 ) ( CLEAR ?auto_16637 ) ( not ( = ?auto_16636 ?auto_16637 ) ) ( not ( = ?auto_16636 ?auto_16666 ) ) ( not ( = ?auto_16637 ?auto_16666 ) ) ( not ( = ?auto_16648 ?auto_16669 ) ) ( IS-CRATE ?auto_16636 ) ( not ( = ?auto_16657 ?auto_16647 ) ) ( HOIST-AT ?auto_16653 ?auto_16657 ) ( AVAILABLE ?auto_16653 ) ( SURFACE-AT ?auto_16636 ?auto_16657 ) ( ON ?auto_16636 ?auto_16655 ) ( CLEAR ?auto_16636 ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( not ( = ?auto_16635 ?auto_16655 ) ) ( not ( = ?auto_16636 ?auto_16655 ) ) ( not ( = ?auto_16648 ?auto_16653 ) ) ( SURFACE-AT ?auto_16634 ?auto_16647 ) ( CLEAR ?auto_16634 ) ( IS-CRATE ?auto_16635 ) ( AVAILABLE ?auto_16648 ) ( not ( = ?auto_16659 ?auto_16647 ) ) ( HOIST-AT ?auto_16660 ?auto_16659 ) ( AVAILABLE ?auto_16660 ) ( SURFACE-AT ?auto_16635 ?auto_16659 ) ( ON ?auto_16635 ?auto_16663 ) ( CLEAR ?auto_16635 ) ( TRUCK-AT ?auto_16646 ?auto_16647 ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( not ( = ?auto_16634 ?auto_16663 ) ) ( not ( = ?auto_16635 ?auto_16663 ) ) ( not ( = ?auto_16648 ?auto_16660 ) ) ( not ( = ?auto_16634 ?auto_16636 ) ) ( not ( = ?auto_16634 ?auto_16655 ) ) ( not ( = ?auto_16636 ?auto_16663 ) ) ( not ( = ?auto_16657 ?auto_16659 ) ) ( not ( = ?auto_16653 ?auto_16660 ) ) ( not ( = ?auto_16655 ?auto_16663 ) ) ( not ( = ?auto_16634 ?auto_16637 ) ) ( not ( = ?auto_16634 ?auto_16666 ) ) ( not ( = ?auto_16635 ?auto_16637 ) ) ( not ( = ?auto_16635 ?auto_16666 ) ) ( not ( = ?auto_16637 ?auto_16655 ) ) ( not ( = ?auto_16637 ?auto_16663 ) ) ( not ( = ?auto_16665 ?auto_16657 ) ) ( not ( = ?auto_16665 ?auto_16659 ) ) ( not ( = ?auto_16669 ?auto_16653 ) ) ( not ( = ?auto_16669 ?auto_16660 ) ) ( not ( = ?auto_16666 ?auto_16655 ) ) ( not ( = ?auto_16666 ?auto_16663 ) ) ( not ( = ?auto_16634 ?auto_16638 ) ) ( not ( = ?auto_16634 ?auto_16667 ) ) ( not ( = ?auto_16635 ?auto_16638 ) ) ( not ( = ?auto_16635 ?auto_16667 ) ) ( not ( = ?auto_16636 ?auto_16638 ) ) ( not ( = ?auto_16636 ?auto_16667 ) ) ( not ( = ?auto_16638 ?auto_16666 ) ) ( not ( = ?auto_16638 ?auto_16655 ) ) ( not ( = ?auto_16638 ?auto_16663 ) ) ( not ( = ?auto_16649 ?auto_16665 ) ) ( not ( = ?auto_16649 ?auto_16657 ) ) ( not ( = ?auto_16649 ?auto_16659 ) ) ( not ( = ?auto_16650 ?auto_16669 ) ) ( not ( = ?auto_16650 ?auto_16653 ) ) ( not ( = ?auto_16650 ?auto_16660 ) ) ( not ( = ?auto_16667 ?auto_16666 ) ) ( not ( = ?auto_16667 ?auto_16655 ) ) ( not ( = ?auto_16667 ?auto_16663 ) ) ( not ( = ?auto_16634 ?auto_16639 ) ) ( not ( = ?auto_16634 ?auto_16651 ) ) ( not ( = ?auto_16635 ?auto_16639 ) ) ( not ( = ?auto_16635 ?auto_16651 ) ) ( not ( = ?auto_16636 ?auto_16639 ) ) ( not ( = ?auto_16636 ?auto_16651 ) ) ( not ( = ?auto_16637 ?auto_16639 ) ) ( not ( = ?auto_16637 ?auto_16651 ) ) ( not ( = ?auto_16639 ?auto_16667 ) ) ( not ( = ?auto_16639 ?auto_16666 ) ) ( not ( = ?auto_16639 ?auto_16655 ) ) ( not ( = ?auto_16639 ?auto_16663 ) ) ( not ( = ?auto_16661 ?auto_16649 ) ) ( not ( = ?auto_16661 ?auto_16665 ) ) ( not ( = ?auto_16661 ?auto_16657 ) ) ( not ( = ?auto_16661 ?auto_16659 ) ) ( not ( = ?auto_16664 ?auto_16650 ) ) ( not ( = ?auto_16664 ?auto_16669 ) ) ( not ( = ?auto_16664 ?auto_16653 ) ) ( not ( = ?auto_16664 ?auto_16660 ) ) ( not ( = ?auto_16651 ?auto_16667 ) ) ( not ( = ?auto_16651 ?auto_16666 ) ) ( not ( = ?auto_16651 ?auto_16655 ) ) ( not ( = ?auto_16651 ?auto_16663 ) ) ( not ( = ?auto_16634 ?auto_16640 ) ) ( not ( = ?auto_16634 ?auto_16662 ) ) ( not ( = ?auto_16635 ?auto_16640 ) ) ( not ( = ?auto_16635 ?auto_16662 ) ) ( not ( = ?auto_16636 ?auto_16640 ) ) ( not ( = ?auto_16636 ?auto_16662 ) ) ( not ( = ?auto_16637 ?auto_16640 ) ) ( not ( = ?auto_16637 ?auto_16662 ) ) ( not ( = ?auto_16638 ?auto_16640 ) ) ( not ( = ?auto_16638 ?auto_16662 ) ) ( not ( = ?auto_16640 ?auto_16651 ) ) ( not ( = ?auto_16640 ?auto_16667 ) ) ( not ( = ?auto_16640 ?auto_16666 ) ) ( not ( = ?auto_16640 ?auto_16655 ) ) ( not ( = ?auto_16640 ?auto_16663 ) ) ( not ( = ?auto_16668 ?auto_16661 ) ) ( not ( = ?auto_16668 ?auto_16649 ) ) ( not ( = ?auto_16668 ?auto_16665 ) ) ( not ( = ?auto_16668 ?auto_16657 ) ) ( not ( = ?auto_16668 ?auto_16659 ) ) ( not ( = ?auto_16654 ?auto_16664 ) ) ( not ( = ?auto_16654 ?auto_16650 ) ) ( not ( = ?auto_16654 ?auto_16669 ) ) ( not ( = ?auto_16654 ?auto_16653 ) ) ( not ( = ?auto_16654 ?auto_16660 ) ) ( not ( = ?auto_16662 ?auto_16651 ) ) ( not ( = ?auto_16662 ?auto_16667 ) ) ( not ( = ?auto_16662 ?auto_16666 ) ) ( not ( = ?auto_16662 ?auto_16655 ) ) ( not ( = ?auto_16662 ?auto_16663 ) ) ( not ( = ?auto_16634 ?auto_16641 ) ) ( not ( = ?auto_16634 ?auto_16656 ) ) ( not ( = ?auto_16635 ?auto_16641 ) ) ( not ( = ?auto_16635 ?auto_16656 ) ) ( not ( = ?auto_16636 ?auto_16641 ) ) ( not ( = ?auto_16636 ?auto_16656 ) ) ( not ( = ?auto_16637 ?auto_16641 ) ) ( not ( = ?auto_16637 ?auto_16656 ) ) ( not ( = ?auto_16638 ?auto_16641 ) ) ( not ( = ?auto_16638 ?auto_16656 ) ) ( not ( = ?auto_16639 ?auto_16641 ) ) ( not ( = ?auto_16639 ?auto_16656 ) ) ( not ( = ?auto_16641 ?auto_16662 ) ) ( not ( = ?auto_16641 ?auto_16651 ) ) ( not ( = ?auto_16641 ?auto_16667 ) ) ( not ( = ?auto_16641 ?auto_16666 ) ) ( not ( = ?auto_16641 ?auto_16655 ) ) ( not ( = ?auto_16641 ?auto_16663 ) ) ( not ( = ?auto_16658 ?auto_16668 ) ) ( not ( = ?auto_16658 ?auto_16661 ) ) ( not ( = ?auto_16658 ?auto_16649 ) ) ( not ( = ?auto_16658 ?auto_16665 ) ) ( not ( = ?auto_16658 ?auto_16657 ) ) ( not ( = ?auto_16658 ?auto_16659 ) ) ( not ( = ?auto_16652 ?auto_16654 ) ) ( not ( = ?auto_16652 ?auto_16664 ) ) ( not ( = ?auto_16652 ?auto_16650 ) ) ( not ( = ?auto_16652 ?auto_16669 ) ) ( not ( = ?auto_16652 ?auto_16653 ) ) ( not ( = ?auto_16652 ?auto_16660 ) ) ( not ( = ?auto_16656 ?auto_16662 ) ) ( not ( = ?auto_16656 ?auto_16651 ) ) ( not ( = ?auto_16656 ?auto_16667 ) ) ( not ( = ?auto_16656 ?auto_16666 ) ) ( not ( = ?auto_16656 ?auto_16655 ) ) ( not ( = ?auto_16656 ?auto_16663 ) ) ( not ( = ?auto_16634 ?auto_16642 ) ) ( not ( = ?auto_16634 ?auto_16643 ) ) ( not ( = ?auto_16635 ?auto_16642 ) ) ( not ( = ?auto_16635 ?auto_16643 ) ) ( not ( = ?auto_16636 ?auto_16642 ) ) ( not ( = ?auto_16636 ?auto_16643 ) ) ( not ( = ?auto_16637 ?auto_16642 ) ) ( not ( = ?auto_16637 ?auto_16643 ) ) ( not ( = ?auto_16638 ?auto_16642 ) ) ( not ( = ?auto_16638 ?auto_16643 ) ) ( not ( = ?auto_16639 ?auto_16642 ) ) ( not ( = ?auto_16639 ?auto_16643 ) ) ( not ( = ?auto_16640 ?auto_16642 ) ) ( not ( = ?auto_16640 ?auto_16643 ) ) ( not ( = ?auto_16642 ?auto_16656 ) ) ( not ( = ?auto_16642 ?auto_16662 ) ) ( not ( = ?auto_16642 ?auto_16651 ) ) ( not ( = ?auto_16642 ?auto_16667 ) ) ( not ( = ?auto_16642 ?auto_16666 ) ) ( not ( = ?auto_16642 ?auto_16655 ) ) ( not ( = ?auto_16642 ?auto_16663 ) ) ( not ( = ?auto_16644 ?auto_16658 ) ) ( not ( = ?auto_16644 ?auto_16668 ) ) ( not ( = ?auto_16644 ?auto_16661 ) ) ( not ( = ?auto_16644 ?auto_16649 ) ) ( not ( = ?auto_16644 ?auto_16665 ) ) ( not ( = ?auto_16644 ?auto_16657 ) ) ( not ( = ?auto_16644 ?auto_16659 ) ) ( not ( = ?auto_16645 ?auto_16652 ) ) ( not ( = ?auto_16645 ?auto_16654 ) ) ( not ( = ?auto_16645 ?auto_16664 ) ) ( not ( = ?auto_16645 ?auto_16650 ) ) ( not ( = ?auto_16645 ?auto_16669 ) ) ( not ( = ?auto_16645 ?auto_16653 ) ) ( not ( = ?auto_16645 ?auto_16660 ) ) ( not ( = ?auto_16643 ?auto_16656 ) ) ( not ( = ?auto_16643 ?auto_16662 ) ) ( not ( = ?auto_16643 ?auto_16651 ) ) ( not ( = ?auto_16643 ?auto_16667 ) ) ( not ( = ?auto_16643 ?auto_16666 ) ) ( not ( = ?auto_16643 ?auto_16655 ) ) ( not ( = ?auto_16643 ?auto_16663 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16634 ?auto_16635 ?auto_16636 ?auto_16637 ?auto_16638 ?auto_16639 ?auto_16640 ?auto_16641 )
      ( MAKE-1CRATE ?auto_16641 ?auto_16642 )
      ( MAKE-8CRATE-VERIFY ?auto_16634 ?auto_16635 ?auto_16636 ?auto_16637 ?auto_16638 ?auto_16639 ?auto_16640 ?auto_16641 ?auto_16642 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16690 - SURFACE
      ?auto_16691 - SURFACE
      ?auto_16692 - SURFACE
      ?auto_16693 - SURFACE
      ?auto_16694 - SURFACE
      ?auto_16695 - SURFACE
      ?auto_16696 - SURFACE
      ?auto_16697 - SURFACE
      ?auto_16698 - SURFACE
      ?auto_16699 - SURFACE
    )
    :vars
    (
      ?auto_16700 - HOIST
      ?auto_16702 - PLACE
      ?auto_16701 - PLACE
      ?auto_16705 - HOIST
      ?auto_16703 - SURFACE
      ?auto_16720 - PLACE
      ?auto_16725 - HOIST
      ?auto_16724 - SURFACE
      ?auto_16711 - PLACE
      ?auto_16723 - HOIST
      ?auto_16714 - SURFACE
      ?auto_16718 - PLACE
      ?auto_16710 - HOIST
      ?auto_16706 - SURFACE
      ?auto_16716 - PLACE
      ?auto_16709 - HOIST
      ?auto_16722 - SURFACE
      ?auto_16717 - PLACE
      ?auto_16719 - HOIST
      ?auto_16728 - SURFACE
      ?auto_16721 - PLACE
      ?auto_16726 - HOIST
      ?auto_16729 - SURFACE
      ?auto_16713 - PLACE
      ?auto_16712 - HOIST
      ?auto_16727 - SURFACE
      ?auto_16708 - PLACE
      ?auto_16715 - HOIST
      ?auto_16707 - SURFACE
      ?auto_16704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16700 ?auto_16702 ) ( IS-CRATE ?auto_16699 ) ( not ( = ?auto_16701 ?auto_16702 ) ) ( HOIST-AT ?auto_16705 ?auto_16701 ) ( AVAILABLE ?auto_16705 ) ( SURFACE-AT ?auto_16699 ?auto_16701 ) ( ON ?auto_16699 ?auto_16703 ) ( CLEAR ?auto_16699 ) ( not ( = ?auto_16698 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16703 ) ) ( not ( = ?auto_16699 ?auto_16703 ) ) ( not ( = ?auto_16700 ?auto_16705 ) ) ( IS-CRATE ?auto_16698 ) ( not ( = ?auto_16720 ?auto_16702 ) ) ( HOIST-AT ?auto_16725 ?auto_16720 ) ( AVAILABLE ?auto_16725 ) ( SURFACE-AT ?auto_16698 ?auto_16720 ) ( ON ?auto_16698 ?auto_16724 ) ( CLEAR ?auto_16698 ) ( not ( = ?auto_16697 ?auto_16698 ) ) ( not ( = ?auto_16697 ?auto_16724 ) ) ( not ( = ?auto_16698 ?auto_16724 ) ) ( not ( = ?auto_16700 ?auto_16725 ) ) ( IS-CRATE ?auto_16697 ) ( not ( = ?auto_16711 ?auto_16702 ) ) ( HOIST-AT ?auto_16723 ?auto_16711 ) ( AVAILABLE ?auto_16723 ) ( SURFACE-AT ?auto_16697 ?auto_16711 ) ( ON ?auto_16697 ?auto_16714 ) ( CLEAR ?auto_16697 ) ( not ( = ?auto_16696 ?auto_16697 ) ) ( not ( = ?auto_16696 ?auto_16714 ) ) ( not ( = ?auto_16697 ?auto_16714 ) ) ( not ( = ?auto_16700 ?auto_16723 ) ) ( IS-CRATE ?auto_16696 ) ( not ( = ?auto_16718 ?auto_16702 ) ) ( HOIST-AT ?auto_16710 ?auto_16718 ) ( AVAILABLE ?auto_16710 ) ( SURFACE-AT ?auto_16696 ?auto_16718 ) ( ON ?auto_16696 ?auto_16706 ) ( CLEAR ?auto_16696 ) ( not ( = ?auto_16695 ?auto_16696 ) ) ( not ( = ?auto_16695 ?auto_16706 ) ) ( not ( = ?auto_16696 ?auto_16706 ) ) ( not ( = ?auto_16700 ?auto_16710 ) ) ( IS-CRATE ?auto_16695 ) ( not ( = ?auto_16716 ?auto_16702 ) ) ( HOIST-AT ?auto_16709 ?auto_16716 ) ( AVAILABLE ?auto_16709 ) ( SURFACE-AT ?auto_16695 ?auto_16716 ) ( ON ?auto_16695 ?auto_16722 ) ( CLEAR ?auto_16695 ) ( not ( = ?auto_16694 ?auto_16695 ) ) ( not ( = ?auto_16694 ?auto_16722 ) ) ( not ( = ?auto_16695 ?auto_16722 ) ) ( not ( = ?auto_16700 ?auto_16709 ) ) ( IS-CRATE ?auto_16694 ) ( not ( = ?auto_16717 ?auto_16702 ) ) ( HOIST-AT ?auto_16719 ?auto_16717 ) ( AVAILABLE ?auto_16719 ) ( SURFACE-AT ?auto_16694 ?auto_16717 ) ( ON ?auto_16694 ?auto_16728 ) ( CLEAR ?auto_16694 ) ( not ( = ?auto_16693 ?auto_16694 ) ) ( not ( = ?auto_16693 ?auto_16728 ) ) ( not ( = ?auto_16694 ?auto_16728 ) ) ( not ( = ?auto_16700 ?auto_16719 ) ) ( IS-CRATE ?auto_16693 ) ( not ( = ?auto_16721 ?auto_16702 ) ) ( HOIST-AT ?auto_16726 ?auto_16721 ) ( AVAILABLE ?auto_16726 ) ( SURFACE-AT ?auto_16693 ?auto_16721 ) ( ON ?auto_16693 ?auto_16729 ) ( CLEAR ?auto_16693 ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( not ( = ?auto_16692 ?auto_16729 ) ) ( not ( = ?auto_16693 ?auto_16729 ) ) ( not ( = ?auto_16700 ?auto_16726 ) ) ( IS-CRATE ?auto_16692 ) ( not ( = ?auto_16713 ?auto_16702 ) ) ( HOIST-AT ?auto_16712 ?auto_16713 ) ( AVAILABLE ?auto_16712 ) ( SURFACE-AT ?auto_16692 ?auto_16713 ) ( ON ?auto_16692 ?auto_16727 ) ( CLEAR ?auto_16692 ) ( not ( = ?auto_16691 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16727 ) ) ( not ( = ?auto_16692 ?auto_16727 ) ) ( not ( = ?auto_16700 ?auto_16712 ) ) ( SURFACE-AT ?auto_16690 ?auto_16702 ) ( CLEAR ?auto_16690 ) ( IS-CRATE ?auto_16691 ) ( AVAILABLE ?auto_16700 ) ( not ( = ?auto_16708 ?auto_16702 ) ) ( HOIST-AT ?auto_16715 ?auto_16708 ) ( AVAILABLE ?auto_16715 ) ( SURFACE-AT ?auto_16691 ?auto_16708 ) ( ON ?auto_16691 ?auto_16707 ) ( CLEAR ?auto_16691 ) ( TRUCK-AT ?auto_16704 ?auto_16702 ) ( not ( = ?auto_16690 ?auto_16691 ) ) ( not ( = ?auto_16690 ?auto_16707 ) ) ( not ( = ?auto_16691 ?auto_16707 ) ) ( not ( = ?auto_16700 ?auto_16715 ) ) ( not ( = ?auto_16690 ?auto_16692 ) ) ( not ( = ?auto_16690 ?auto_16727 ) ) ( not ( = ?auto_16692 ?auto_16707 ) ) ( not ( = ?auto_16713 ?auto_16708 ) ) ( not ( = ?auto_16712 ?auto_16715 ) ) ( not ( = ?auto_16727 ?auto_16707 ) ) ( not ( = ?auto_16690 ?auto_16693 ) ) ( not ( = ?auto_16690 ?auto_16729 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16691 ?auto_16729 ) ) ( not ( = ?auto_16693 ?auto_16727 ) ) ( not ( = ?auto_16693 ?auto_16707 ) ) ( not ( = ?auto_16721 ?auto_16713 ) ) ( not ( = ?auto_16721 ?auto_16708 ) ) ( not ( = ?auto_16726 ?auto_16712 ) ) ( not ( = ?auto_16726 ?auto_16715 ) ) ( not ( = ?auto_16729 ?auto_16727 ) ) ( not ( = ?auto_16729 ?auto_16707 ) ) ( not ( = ?auto_16690 ?auto_16694 ) ) ( not ( = ?auto_16690 ?auto_16728 ) ) ( not ( = ?auto_16691 ?auto_16694 ) ) ( not ( = ?auto_16691 ?auto_16728 ) ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16728 ) ) ( not ( = ?auto_16694 ?auto_16729 ) ) ( not ( = ?auto_16694 ?auto_16727 ) ) ( not ( = ?auto_16694 ?auto_16707 ) ) ( not ( = ?auto_16717 ?auto_16721 ) ) ( not ( = ?auto_16717 ?auto_16713 ) ) ( not ( = ?auto_16717 ?auto_16708 ) ) ( not ( = ?auto_16719 ?auto_16726 ) ) ( not ( = ?auto_16719 ?auto_16712 ) ) ( not ( = ?auto_16719 ?auto_16715 ) ) ( not ( = ?auto_16728 ?auto_16729 ) ) ( not ( = ?auto_16728 ?auto_16727 ) ) ( not ( = ?auto_16728 ?auto_16707 ) ) ( not ( = ?auto_16690 ?auto_16695 ) ) ( not ( = ?auto_16690 ?auto_16722 ) ) ( not ( = ?auto_16691 ?auto_16695 ) ) ( not ( = ?auto_16691 ?auto_16722 ) ) ( not ( = ?auto_16692 ?auto_16695 ) ) ( not ( = ?auto_16692 ?auto_16722 ) ) ( not ( = ?auto_16693 ?auto_16695 ) ) ( not ( = ?auto_16693 ?auto_16722 ) ) ( not ( = ?auto_16695 ?auto_16728 ) ) ( not ( = ?auto_16695 ?auto_16729 ) ) ( not ( = ?auto_16695 ?auto_16727 ) ) ( not ( = ?auto_16695 ?auto_16707 ) ) ( not ( = ?auto_16716 ?auto_16717 ) ) ( not ( = ?auto_16716 ?auto_16721 ) ) ( not ( = ?auto_16716 ?auto_16713 ) ) ( not ( = ?auto_16716 ?auto_16708 ) ) ( not ( = ?auto_16709 ?auto_16719 ) ) ( not ( = ?auto_16709 ?auto_16726 ) ) ( not ( = ?auto_16709 ?auto_16712 ) ) ( not ( = ?auto_16709 ?auto_16715 ) ) ( not ( = ?auto_16722 ?auto_16728 ) ) ( not ( = ?auto_16722 ?auto_16729 ) ) ( not ( = ?auto_16722 ?auto_16727 ) ) ( not ( = ?auto_16722 ?auto_16707 ) ) ( not ( = ?auto_16690 ?auto_16696 ) ) ( not ( = ?auto_16690 ?auto_16706 ) ) ( not ( = ?auto_16691 ?auto_16696 ) ) ( not ( = ?auto_16691 ?auto_16706 ) ) ( not ( = ?auto_16692 ?auto_16696 ) ) ( not ( = ?auto_16692 ?auto_16706 ) ) ( not ( = ?auto_16693 ?auto_16696 ) ) ( not ( = ?auto_16693 ?auto_16706 ) ) ( not ( = ?auto_16694 ?auto_16696 ) ) ( not ( = ?auto_16694 ?auto_16706 ) ) ( not ( = ?auto_16696 ?auto_16722 ) ) ( not ( = ?auto_16696 ?auto_16728 ) ) ( not ( = ?auto_16696 ?auto_16729 ) ) ( not ( = ?auto_16696 ?auto_16727 ) ) ( not ( = ?auto_16696 ?auto_16707 ) ) ( not ( = ?auto_16718 ?auto_16716 ) ) ( not ( = ?auto_16718 ?auto_16717 ) ) ( not ( = ?auto_16718 ?auto_16721 ) ) ( not ( = ?auto_16718 ?auto_16713 ) ) ( not ( = ?auto_16718 ?auto_16708 ) ) ( not ( = ?auto_16710 ?auto_16709 ) ) ( not ( = ?auto_16710 ?auto_16719 ) ) ( not ( = ?auto_16710 ?auto_16726 ) ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16710 ?auto_16715 ) ) ( not ( = ?auto_16706 ?auto_16722 ) ) ( not ( = ?auto_16706 ?auto_16728 ) ) ( not ( = ?auto_16706 ?auto_16729 ) ) ( not ( = ?auto_16706 ?auto_16727 ) ) ( not ( = ?auto_16706 ?auto_16707 ) ) ( not ( = ?auto_16690 ?auto_16697 ) ) ( not ( = ?auto_16690 ?auto_16714 ) ) ( not ( = ?auto_16691 ?auto_16697 ) ) ( not ( = ?auto_16691 ?auto_16714 ) ) ( not ( = ?auto_16692 ?auto_16697 ) ) ( not ( = ?auto_16692 ?auto_16714 ) ) ( not ( = ?auto_16693 ?auto_16697 ) ) ( not ( = ?auto_16693 ?auto_16714 ) ) ( not ( = ?auto_16694 ?auto_16697 ) ) ( not ( = ?auto_16694 ?auto_16714 ) ) ( not ( = ?auto_16695 ?auto_16697 ) ) ( not ( = ?auto_16695 ?auto_16714 ) ) ( not ( = ?auto_16697 ?auto_16706 ) ) ( not ( = ?auto_16697 ?auto_16722 ) ) ( not ( = ?auto_16697 ?auto_16728 ) ) ( not ( = ?auto_16697 ?auto_16729 ) ) ( not ( = ?auto_16697 ?auto_16727 ) ) ( not ( = ?auto_16697 ?auto_16707 ) ) ( not ( = ?auto_16711 ?auto_16718 ) ) ( not ( = ?auto_16711 ?auto_16716 ) ) ( not ( = ?auto_16711 ?auto_16717 ) ) ( not ( = ?auto_16711 ?auto_16721 ) ) ( not ( = ?auto_16711 ?auto_16713 ) ) ( not ( = ?auto_16711 ?auto_16708 ) ) ( not ( = ?auto_16723 ?auto_16710 ) ) ( not ( = ?auto_16723 ?auto_16709 ) ) ( not ( = ?auto_16723 ?auto_16719 ) ) ( not ( = ?auto_16723 ?auto_16726 ) ) ( not ( = ?auto_16723 ?auto_16712 ) ) ( not ( = ?auto_16723 ?auto_16715 ) ) ( not ( = ?auto_16714 ?auto_16706 ) ) ( not ( = ?auto_16714 ?auto_16722 ) ) ( not ( = ?auto_16714 ?auto_16728 ) ) ( not ( = ?auto_16714 ?auto_16729 ) ) ( not ( = ?auto_16714 ?auto_16727 ) ) ( not ( = ?auto_16714 ?auto_16707 ) ) ( not ( = ?auto_16690 ?auto_16698 ) ) ( not ( = ?auto_16690 ?auto_16724 ) ) ( not ( = ?auto_16691 ?auto_16698 ) ) ( not ( = ?auto_16691 ?auto_16724 ) ) ( not ( = ?auto_16692 ?auto_16698 ) ) ( not ( = ?auto_16692 ?auto_16724 ) ) ( not ( = ?auto_16693 ?auto_16698 ) ) ( not ( = ?auto_16693 ?auto_16724 ) ) ( not ( = ?auto_16694 ?auto_16698 ) ) ( not ( = ?auto_16694 ?auto_16724 ) ) ( not ( = ?auto_16695 ?auto_16698 ) ) ( not ( = ?auto_16695 ?auto_16724 ) ) ( not ( = ?auto_16696 ?auto_16698 ) ) ( not ( = ?auto_16696 ?auto_16724 ) ) ( not ( = ?auto_16698 ?auto_16714 ) ) ( not ( = ?auto_16698 ?auto_16706 ) ) ( not ( = ?auto_16698 ?auto_16722 ) ) ( not ( = ?auto_16698 ?auto_16728 ) ) ( not ( = ?auto_16698 ?auto_16729 ) ) ( not ( = ?auto_16698 ?auto_16727 ) ) ( not ( = ?auto_16698 ?auto_16707 ) ) ( not ( = ?auto_16720 ?auto_16711 ) ) ( not ( = ?auto_16720 ?auto_16718 ) ) ( not ( = ?auto_16720 ?auto_16716 ) ) ( not ( = ?auto_16720 ?auto_16717 ) ) ( not ( = ?auto_16720 ?auto_16721 ) ) ( not ( = ?auto_16720 ?auto_16713 ) ) ( not ( = ?auto_16720 ?auto_16708 ) ) ( not ( = ?auto_16725 ?auto_16723 ) ) ( not ( = ?auto_16725 ?auto_16710 ) ) ( not ( = ?auto_16725 ?auto_16709 ) ) ( not ( = ?auto_16725 ?auto_16719 ) ) ( not ( = ?auto_16725 ?auto_16726 ) ) ( not ( = ?auto_16725 ?auto_16712 ) ) ( not ( = ?auto_16725 ?auto_16715 ) ) ( not ( = ?auto_16724 ?auto_16714 ) ) ( not ( = ?auto_16724 ?auto_16706 ) ) ( not ( = ?auto_16724 ?auto_16722 ) ) ( not ( = ?auto_16724 ?auto_16728 ) ) ( not ( = ?auto_16724 ?auto_16729 ) ) ( not ( = ?auto_16724 ?auto_16727 ) ) ( not ( = ?auto_16724 ?auto_16707 ) ) ( not ( = ?auto_16690 ?auto_16699 ) ) ( not ( = ?auto_16690 ?auto_16703 ) ) ( not ( = ?auto_16691 ?auto_16699 ) ) ( not ( = ?auto_16691 ?auto_16703 ) ) ( not ( = ?auto_16692 ?auto_16699 ) ) ( not ( = ?auto_16692 ?auto_16703 ) ) ( not ( = ?auto_16693 ?auto_16699 ) ) ( not ( = ?auto_16693 ?auto_16703 ) ) ( not ( = ?auto_16694 ?auto_16699 ) ) ( not ( = ?auto_16694 ?auto_16703 ) ) ( not ( = ?auto_16695 ?auto_16699 ) ) ( not ( = ?auto_16695 ?auto_16703 ) ) ( not ( = ?auto_16696 ?auto_16699 ) ) ( not ( = ?auto_16696 ?auto_16703 ) ) ( not ( = ?auto_16697 ?auto_16699 ) ) ( not ( = ?auto_16697 ?auto_16703 ) ) ( not ( = ?auto_16699 ?auto_16724 ) ) ( not ( = ?auto_16699 ?auto_16714 ) ) ( not ( = ?auto_16699 ?auto_16706 ) ) ( not ( = ?auto_16699 ?auto_16722 ) ) ( not ( = ?auto_16699 ?auto_16728 ) ) ( not ( = ?auto_16699 ?auto_16729 ) ) ( not ( = ?auto_16699 ?auto_16727 ) ) ( not ( = ?auto_16699 ?auto_16707 ) ) ( not ( = ?auto_16701 ?auto_16720 ) ) ( not ( = ?auto_16701 ?auto_16711 ) ) ( not ( = ?auto_16701 ?auto_16718 ) ) ( not ( = ?auto_16701 ?auto_16716 ) ) ( not ( = ?auto_16701 ?auto_16717 ) ) ( not ( = ?auto_16701 ?auto_16721 ) ) ( not ( = ?auto_16701 ?auto_16713 ) ) ( not ( = ?auto_16701 ?auto_16708 ) ) ( not ( = ?auto_16705 ?auto_16725 ) ) ( not ( = ?auto_16705 ?auto_16723 ) ) ( not ( = ?auto_16705 ?auto_16710 ) ) ( not ( = ?auto_16705 ?auto_16709 ) ) ( not ( = ?auto_16705 ?auto_16719 ) ) ( not ( = ?auto_16705 ?auto_16726 ) ) ( not ( = ?auto_16705 ?auto_16712 ) ) ( not ( = ?auto_16705 ?auto_16715 ) ) ( not ( = ?auto_16703 ?auto_16724 ) ) ( not ( = ?auto_16703 ?auto_16714 ) ) ( not ( = ?auto_16703 ?auto_16706 ) ) ( not ( = ?auto_16703 ?auto_16722 ) ) ( not ( = ?auto_16703 ?auto_16728 ) ) ( not ( = ?auto_16703 ?auto_16729 ) ) ( not ( = ?auto_16703 ?auto_16727 ) ) ( not ( = ?auto_16703 ?auto_16707 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16690 ?auto_16691 ?auto_16692 ?auto_16693 ?auto_16694 ?auto_16695 ?auto_16696 ?auto_16697 ?auto_16698 )
      ( MAKE-1CRATE ?auto_16698 ?auto_16699 )
      ( MAKE-9CRATE-VERIFY ?auto_16690 ?auto_16691 ?auto_16692 ?auto_16693 ?auto_16694 ?auto_16695 ?auto_16696 ?auto_16697 ?auto_16698 ?auto_16699 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16751 - SURFACE
      ?auto_16752 - SURFACE
      ?auto_16753 - SURFACE
      ?auto_16754 - SURFACE
      ?auto_16755 - SURFACE
      ?auto_16756 - SURFACE
      ?auto_16757 - SURFACE
      ?auto_16758 - SURFACE
      ?auto_16759 - SURFACE
      ?auto_16760 - SURFACE
      ?auto_16761 - SURFACE
    )
    :vars
    (
      ?auto_16764 - HOIST
      ?auto_16767 - PLACE
      ?auto_16763 - PLACE
      ?auto_16765 - HOIST
      ?auto_16762 - SURFACE
      ?auto_16790 - SURFACE
      ?auto_16768 - PLACE
      ?auto_16780 - HOIST
      ?auto_16776 - SURFACE
      ?auto_16777 - PLACE
      ?auto_16775 - HOIST
      ?auto_16773 - SURFACE
      ?auto_16770 - PLACE
      ?auto_16787 - HOIST
      ?auto_16769 - SURFACE
      ?auto_16778 - PLACE
      ?auto_16785 - HOIST
      ?auto_16791 - SURFACE
      ?auto_16786 - PLACE
      ?auto_16784 - HOIST
      ?auto_16788 - SURFACE
      ?auto_16772 - PLACE
      ?auto_16779 - HOIST
      ?auto_16781 - SURFACE
      ?auto_16783 - PLACE
      ?auto_16771 - HOIST
      ?auto_16774 - SURFACE
      ?auto_16782 - PLACE
      ?auto_16789 - HOIST
      ?auto_16792 - SURFACE
      ?auto_16766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16764 ?auto_16767 ) ( IS-CRATE ?auto_16761 ) ( not ( = ?auto_16763 ?auto_16767 ) ) ( HOIST-AT ?auto_16765 ?auto_16763 ) ( SURFACE-AT ?auto_16761 ?auto_16763 ) ( ON ?auto_16761 ?auto_16762 ) ( CLEAR ?auto_16761 ) ( not ( = ?auto_16760 ?auto_16761 ) ) ( not ( = ?auto_16760 ?auto_16762 ) ) ( not ( = ?auto_16761 ?auto_16762 ) ) ( not ( = ?auto_16764 ?auto_16765 ) ) ( IS-CRATE ?auto_16760 ) ( AVAILABLE ?auto_16765 ) ( SURFACE-AT ?auto_16760 ?auto_16763 ) ( ON ?auto_16760 ?auto_16790 ) ( CLEAR ?auto_16760 ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16759 ?auto_16790 ) ) ( not ( = ?auto_16760 ?auto_16790 ) ) ( IS-CRATE ?auto_16759 ) ( not ( = ?auto_16768 ?auto_16767 ) ) ( HOIST-AT ?auto_16780 ?auto_16768 ) ( AVAILABLE ?auto_16780 ) ( SURFACE-AT ?auto_16759 ?auto_16768 ) ( ON ?auto_16759 ?auto_16776 ) ( CLEAR ?auto_16759 ) ( not ( = ?auto_16758 ?auto_16759 ) ) ( not ( = ?auto_16758 ?auto_16776 ) ) ( not ( = ?auto_16759 ?auto_16776 ) ) ( not ( = ?auto_16764 ?auto_16780 ) ) ( IS-CRATE ?auto_16758 ) ( not ( = ?auto_16777 ?auto_16767 ) ) ( HOIST-AT ?auto_16775 ?auto_16777 ) ( AVAILABLE ?auto_16775 ) ( SURFACE-AT ?auto_16758 ?auto_16777 ) ( ON ?auto_16758 ?auto_16773 ) ( CLEAR ?auto_16758 ) ( not ( = ?auto_16757 ?auto_16758 ) ) ( not ( = ?auto_16757 ?auto_16773 ) ) ( not ( = ?auto_16758 ?auto_16773 ) ) ( not ( = ?auto_16764 ?auto_16775 ) ) ( IS-CRATE ?auto_16757 ) ( not ( = ?auto_16770 ?auto_16767 ) ) ( HOIST-AT ?auto_16787 ?auto_16770 ) ( AVAILABLE ?auto_16787 ) ( SURFACE-AT ?auto_16757 ?auto_16770 ) ( ON ?auto_16757 ?auto_16769 ) ( CLEAR ?auto_16757 ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16769 ) ) ( not ( = ?auto_16757 ?auto_16769 ) ) ( not ( = ?auto_16764 ?auto_16787 ) ) ( IS-CRATE ?auto_16756 ) ( not ( = ?auto_16778 ?auto_16767 ) ) ( HOIST-AT ?auto_16785 ?auto_16778 ) ( AVAILABLE ?auto_16785 ) ( SURFACE-AT ?auto_16756 ?auto_16778 ) ( ON ?auto_16756 ?auto_16791 ) ( CLEAR ?auto_16756 ) ( not ( = ?auto_16755 ?auto_16756 ) ) ( not ( = ?auto_16755 ?auto_16791 ) ) ( not ( = ?auto_16756 ?auto_16791 ) ) ( not ( = ?auto_16764 ?auto_16785 ) ) ( IS-CRATE ?auto_16755 ) ( not ( = ?auto_16786 ?auto_16767 ) ) ( HOIST-AT ?auto_16784 ?auto_16786 ) ( AVAILABLE ?auto_16784 ) ( SURFACE-AT ?auto_16755 ?auto_16786 ) ( ON ?auto_16755 ?auto_16788 ) ( CLEAR ?auto_16755 ) ( not ( = ?auto_16754 ?auto_16755 ) ) ( not ( = ?auto_16754 ?auto_16788 ) ) ( not ( = ?auto_16755 ?auto_16788 ) ) ( not ( = ?auto_16764 ?auto_16784 ) ) ( IS-CRATE ?auto_16754 ) ( not ( = ?auto_16772 ?auto_16767 ) ) ( HOIST-AT ?auto_16779 ?auto_16772 ) ( AVAILABLE ?auto_16779 ) ( SURFACE-AT ?auto_16754 ?auto_16772 ) ( ON ?auto_16754 ?auto_16781 ) ( CLEAR ?auto_16754 ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16753 ?auto_16781 ) ) ( not ( = ?auto_16754 ?auto_16781 ) ) ( not ( = ?auto_16764 ?auto_16779 ) ) ( IS-CRATE ?auto_16753 ) ( not ( = ?auto_16783 ?auto_16767 ) ) ( HOIST-AT ?auto_16771 ?auto_16783 ) ( AVAILABLE ?auto_16771 ) ( SURFACE-AT ?auto_16753 ?auto_16783 ) ( ON ?auto_16753 ?auto_16774 ) ( CLEAR ?auto_16753 ) ( not ( = ?auto_16752 ?auto_16753 ) ) ( not ( = ?auto_16752 ?auto_16774 ) ) ( not ( = ?auto_16753 ?auto_16774 ) ) ( not ( = ?auto_16764 ?auto_16771 ) ) ( SURFACE-AT ?auto_16751 ?auto_16767 ) ( CLEAR ?auto_16751 ) ( IS-CRATE ?auto_16752 ) ( AVAILABLE ?auto_16764 ) ( not ( = ?auto_16782 ?auto_16767 ) ) ( HOIST-AT ?auto_16789 ?auto_16782 ) ( AVAILABLE ?auto_16789 ) ( SURFACE-AT ?auto_16752 ?auto_16782 ) ( ON ?auto_16752 ?auto_16792 ) ( CLEAR ?auto_16752 ) ( TRUCK-AT ?auto_16766 ?auto_16767 ) ( not ( = ?auto_16751 ?auto_16752 ) ) ( not ( = ?auto_16751 ?auto_16792 ) ) ( not ( = ?auto_16752 ?auto_16792 ) ) ( not ( = ?auto_16764 ?auto_16789 ) ) ( not ( = ?auto_16751 ?auto_16753 ) ) ( not ( = ?auto_16751 ?auto_16774 ) ) ( not ( = ?auto_16753 ?auto_16792 ) ) ( not ( = ?auto_16783 ?auto_16782 ) ) ( not ( = ?auto_16771 ?auto_16789 ) ) ( not ( = ?auto_16774 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16754 ) ) ( not ( = ?auto_16751 ?auto_16781 ) ) ( not ( = ?auto_16752 ?auto_16754 ) ) ( not ( = ?auto_16752 ?auto_16781 ) ) ( not ( = ?auto_16754 ?auto_16774 ) ) ( not ( = ?auto_16754 ?auto_16792 ) ) ( not ( = ?auto_16772 ?auto_16783 ) ) ( not ( = ?auto_16772 ?auto_16782 ) ) ( not ( = ?auto_16779 ?auto_16771 ) ) ( not ( = ?auto_16779 ?auto_16789 ) ) ( not ( = ?auto_16781 ?auto_16774 ) ) ( not ( = ?auto_16781 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16755 ) ) ( not ( = ?auto_16751 ?auto_16788 ) ) ( not ( = ?auto_16752 ?auto_16755 ) ) ( not ( = ?auto_16752 ?auto_16788 ) ) ( not ( = ?auto_16753 ?auto_16755 ) ) ( not ( = ?auto_16753 ?auto_16788 ) ) ( not ( = ?auto_16755 ?auto_16781 ) ) ( not ( = ?auto_16755 ?auto_16774 ) ) ( not ( = ?auto_16755 ?auto_16792 ) ) ( not ( = ?auto_16786 ?auto_16772 ) ) ( not ( = ?auto_16786 ?auto_16783 ) ) ( not ( = ?auto_16786 ?auto_16782 ) ) ( not ( = ?auto_16784 ?auto_16779 ) ) ( not ( = ?auto_16784 ?auto_16771 ) ) ( not ( = ?auto_16784 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16781 ) ) ( not ( = ?auto_16788 ?auto_16774 ) ) ( not ( = ?auto_16788 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16756 ) ) ( not ( = ?auto_16751 ?auto_16791 ) ) ( not ( = ?auto_16752 ?auto_16756 ) ) ( not ( = ?auto_16752 ?auto_16791 ) ) ( not ( = ?auto_16753 ?auto_16756 ) ) ( not ( = ?auto_16753 ?auto_16791 ) ) ( not ( = ?auto_16754 ?auto_16756 ) ) ( not ( = ?auto_16754 ?auto_16791 ) ) ( not ( = ?auto_16756 ?auto_16788 ) ) ( not ( = ?auto_16756 ?auto_16781 ) ) ( not ( = ?auto_16756 ?auto_16774 ) ) ( not ( = ?auto_16756 ?auto_16792 ) ) ( not ( = ?auto_16778 ?auto_16786 ) ) ( not ( = ?auto_16778 ?auto_16772 ) ) ( not ( = ?auto_16778 ?auto_16783 ) ) ( not ( = ?auto_16778 ?auto_16782 ) ) ( not ( = ?auto_16785 ?auto_16784 ) ) ( not ( = ?auto_16785 ?auto_16779 ) ) ( not ( = ?auto_16785 ?auto_16771 ) ) ( not ( = ?auto_16785 ?auto_16789 ) ) ( not ( = ?auto_16791 ?auto_16788 ) ) ( not ( = ?auto_16791 ?auto_16781 ) ) ( not ( = ?auto_16791 ?auto_16774 ) ) ( not ( = ?auto_16791 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16757 ) ) ( not ( = ?auto_16751 ?auto_16769 ) ) ( not ( = ?auto_16752 ?auto_16757 ) ) ( not ( = ?auto_16752 ?auto_16769 ) ) ( not ( = ?auto_16753 ?auto_16757 ) ) ( not ( = ?auto_16753 ?auto_16769 ) ) ( not ( = ?auto_16754 ?auto_16757 ) ) ( not ( = ?auto_16754 ?auto_16769 ) ) ( not ( = ?auto_16755 ?auto_16757 ) ) ( not ( = ?auto_16755 ?auto_16769 ) ) ( not ( = ?auto_16757 ?auto_16791 ) ) ( not ( = ?auto_16757 ?auto_16788 ) ) ( not ( = ?auto_16757 ?auto_16781 ) ) ( not ( = ?auto_16757 ?auto_16774 ) ) ( not ( = ?auto_16757 ?auto_16792 ) ) ( not ( = ?auto_16770 ?auto_16778 ) ) ( not ( = ?auto_16770 ?auto_16786 ) ) ( not ( = ?auto_16770 ?auto_16772 ) ) ( not ( = ?auto_16770 ?auto_16783 ) ) ( not ( = ?auto_16770 ?auto_16782 ) ) ( not ( = ?auto_16787 ?auto_16785 ) ) ( not ( = ?auto_16787 ?auto_16784 ) ) ( not ( = ?auto_16787 ?auto_16779 ) ) ( not ( = ?auto_16787 ?auto_16771 ) ) ( not ( = ?auto_16787 ?auto_16789 ) ) ( not ( = ?auto_16769 ?auto_16791 ) ) ( not ( = ?auto_16769 ?auto_16788 ) ) ( not ( = ?auto_16769 ?auto_16781 ) ) ( not ( = ?auto_16769 ?auto_16774 ) ) ( not ( = ?auto_16769 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16758 ) ) ( not ( = ?auto_16751 ?auto_16773 ) ) ( not ( = ?auto_16752 ?auto_16758 ) ) ( not ( = ?auto_16752 ?auto_16773 ) ) ( not ( = ?auto_16753 ?auto_16758 ) ) ( not ( = ?auto_16753 ?auto_16773 ) ) ( not ( = ?auto_16754 ?auto_16758 ) ) ( not ( = ?auto_16754 ?auto_16773 ) ) ( not ( = ?auto_16755 ?auto_16758 ) ) ( not ( = ?auto_16755 ?auto_16773 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16773 ) ) ( not ( = ?auto_16758 ?auto_16769 ) ) ( not ( = ?auto_16758 ?auto_16791 ) ) ( not ( = ?auto_16758 ?auto_16788 ) ) ( not ( = ?auto_16758 ?auto_16781 ) ) ( not ( = ?auto_16758 ?auto_16774 ) ) ( not ( = ?auto_16758 ?auto_16792 ) ) ( not ( = ?auto_16777 ?auto_16770 ) ) ( not ( = ?auto_16777 ?auto_16778 ) ) ( not ( = ?auto_16777 ?auto_16786 ) ) ( not ( = ?auto_16777 ?auto_16772 ) ) ( not ( = ?auto_16777 ?auto_16783 ) ) ( not ( = ?auto_16777 ?auto_16782 ) ) ( not ( = ?auto_16775 ?auto_16787 ) ) ( not ( = ?auto_16775 ?auto_16785 ) ) ( not ( = ?auto_16775 ?auto_16784 ) ) ( not ( = ?auto_16775 ?auto_16779 ) ) ( not ( = ?auto_16775 ?auto_16771 ) ) ( not ( = ?auto_16775 ?auto_16789 ) ) ( not ( = ?auto_16773 ?auto_16769 ) ) ( not ( = ?auto_16773 ?auto_16791 ) ) ( not ( = ?auto_16773 ?auto_16788 ) ) ( not ( = ?auto_16773 ?auto_16781 ) ) ( not ( = ?auto_16773 ?auto_16774 ) ) ( not ( = ?auto_16773 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16759 ) ) ( not ( = ?auto_16751 ?auto_16776 ) ) ( not ( = ?auto_16752 ?auto_16759 ) ) ( not ( = ?auto_16752 ?auto_16776 ) ) ( not ( = ?auto_16753 ?auto_16759 ) ) ( not ( = ?auto_16753 ?auto_16776 ) ) ( not ( = ?auto_16754 ?auto_16759 ) ) ( not ( = ?auto_16754 ?auto_16776 ) ) ( not ( = ?auto_16755 ?auto_16759 ) ) ( not ( = ?auto_16755 ?auto_16776 ) ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( not ( = ?auto_16756 ?auto_16776 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16776 ) ) ( not ( = ?auto_16759 ?auto_16773 ) ) ( not ( = ?auto_16759 ?auto_16769 ) ) ( not ( = ?auto_16759 ?auto_16791 ) ) ( not ( = ?auto_16759 ?auto_16788 ) ) ( not ( = ?auto_16759 ?auto_16781 ) ) ( not ( = ?auto_16759 ?auto_16774 ) ) ( not ( = ?auto_16759 ?auto_16792 ) ) ( not ( = ?auto_16768 ?auto_16777 ) ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16768 ?auto_16778 ) ) ( not ( = ?auto_16768 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16772 ) ) ( not ( = ?auto_16768 ?auto_16783 ) ) ( not ( = ?auto_16768 ?auto_16782 ) ) ( not ( = ?auto_16780 ?auto_16775 ) ) ( not ( = ?auto_16780 ?auto_16787 ) ) ( not ( = ?auto_16780 ?auto_16785 ) ) ( not ( = ?auto_16780 ?auto_16784 ) ) ( not ( = ?auto_16780 ?auto_16779 ) ) ( not ( = ?auto_16780 ?auto_16771 ) ) ( not ( = ?auto_16780 ?auto_16789 ) ) ( not ( = ?auto_16776 ?auto_16773 ) ) ( not ( = ?auto_16776 ?auto_16769 ) ) ( not ( = ?auto_16776 ?auto_16791 ) ) ( not ( = ?auto_16776 ?auto_16788 ) ) ( not ( = ?auto_16776 ?auto_16781 ) ) ( not ( = ?auto_16776 ?auto_16774 ) ) ( not ( = ?auto_16776 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16760 ) ) ( not ( = ?auto_16751 ?auto_16790 ) ) ( not ( = ?auto_16752 ?auto_16760 ) ) ( not ( = ?auto_16752 ?auto_16790 ) ) ( not ( = ?auto_16753 ?auto_16760 ) ) ( not ( = ?auto_16753 ?auto_16790 ) ) ( not ( = ?auto_16754 ?auto_16760 ) ) ( not ( = ?auto_16754 ?auto_16790 ) ) ( not ( = ?auto_16755 ?auto_16760 ) ) ( not ( = ?auto_16755 ?auto_16790 ) ) ( not ( = ?auto_16756 ?auto_16760 ) ) ( not ( = ?auto_16756 ?auto_16790 ) ) ( not ( = ?auto_16757 ?auto_16760 ) ) ( not ( = ?auto_16757 ?auto_16790 ) ) ( not ( = ?auto_16758 ?auto_16760 ) ) ( not ( = ?auto_16758 ?auto_16790 ) ) ( not ( = ?auto_16760 ?auto_16776 ) ) ( not ( = ?auto_16760 ?auto_16773 ) ) ( not ( = ?auto_16760 ?auto_16769 ) ) ( not ( = ?auto_16760 ?auto_16791 ) ) ( not ( = ?auto_16760 ?auto_16788 ) ) ( not ( = ?auto_16760 ?auto_16781 ) ) ( not ( = ?auto_16760 ?auto_16774 ) ) ( not ( = ?auto_16760 ?auto_16792 ) ) ( not ( = ?auto_16763 ?auto_16768 ) ) ( not ( = ?auto_16763 ?auto_16777 ) ) ( not ( = ?auto_16763 ?auto_16770 ) ) ( not ( = ?auto_16763 ?auto_16778 ) ) ( not ( = ?auto_16763 ?auto_16786 ) ) ( not ( = ?auto_16763 ?auto_16772 ) ) ( not ( = ?auto_16763 ?auto_16783 ) ) ( not ( = ?auto_16763 ?auto_16782 ) ) ( not ( = ?auto_16765 ?auto_16780 ) ) ( not ( = ?auto_16765 ?auto_16775 ) ) ( not ( = ?auto_16765 ?auto_16787 ) ) ( not ( = ?auto_16765 ?auto_16785 ) ) ( not ( = ?auto_16765 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16779 ) ) ( not ( = ?auto_16765 ?auto_16771 ) ) ( not ( = ?auto_16765 ?auto_16789 ) ) ( not ( = ?auto_16790 ?auto_16776 ) ) ( not ( = ?auto_16790 ?auto_16773 ) ) ( not ( = ?auto_16790 ?auto_16769 ) ) ( not ( = ?auto_16790 ?auto_16791 ) ) ( not ( = ?auto_16790 ?auto_16788 ) ) ( not ( = ?auto_16790 ?auto_16781 ) ) ( not ( = ?auto_16790 ?auto_16774 ) ) ( not ( = ?auto_16790 ?auto_16792 ) ) ( not ( = ?auto_16751 ?auto_16761 ) ) ( not ( = ?auto_16751 ?auto_16762 ) ) ( not ( = ?auto_16752 ?auto_16761 ) ) ( not ( = ?auto_16752 ?auto_16762 ) ) ( not ( = ?auto_16753 ?auto_16761 ) ) ( not ( = ?auto_16753 ?auto_16762 ) ) ( not ( = ?auto_16754 ?auto_16761 ) ) ( not ( = ?auto_16754 ?auto_16762 ) ) ( not ( = ?auto_16755 ?auto_16761 ) ) ( not ( = ?auto_16755 ?auto_16762 ) ) ( not ( = ?auto_16756 ?auto_16761 ) ) ( not ( = ?auto_16756 ?auto_16762 ) ) ( not ( = ?auto_16757 ?auto_16761 ) ) ( not ( = ?auto_16757 ?auto_16762 ) ) ( not ( = ?auto_16758 ?auto_16761 ) ) ( not ( = ?auto_16758 ?auto_16762 ) ) ( not ( = ?auto_16759 ?auto_16761 ) ) ( not ( = ?auto_16759 ?auto_16762 ) ) ( not ( = ?auto_16761 ?auto_16790 ) ) ( not ( = ?auto_16761 ?auto_16776 ) ) ( not ( = ?auto_16761 ?auto_16773 ) ) ( not ( = ?auto_16761 ?auto_16769 ) ) ( not ( = ?auto_16761 ?auto_16791 ) ) ( not ( = ?auto_16761 ?auto_16788 ) ) ( not ( = ?auto_16761 ?auto_16781 ) ) ( not ( = ?auto_16761 ?auto_16774 ) ) ( not ( = ?auto_16761 ?auto_16792 ) ) ( not ( = ?auto_16762 ?auto_16790 ) ) ( not ( = ?auto_16762 ?auto_16776 ) ) ( not ( = ?auto_16762 ?auto_16773 ) ) ( not ( = ?auto_16762 ?auto_16769 ) ) ( not ( = ?auto_16762 ?auto_16791 ) ) ( not ( = ?auto_16762 ?auto_16788 ) ) ( not ( = ?auto_16762 ?auto_16781 ) ) ( not ( = ?auto_16762 ?auto_16774 ) ) ( not ( = ?auto_16762 ?auto_16792 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16751 ?auto_16752 ?auto_16753 ?auto_16754 ?auto_16755 ?auto_16756 ?auto_16757 ?auto_16758 ?auto_16759 ?auto_16760 )
      ( MAKE-1CRATE ?auto_16760 ?auto_16761 )
      ( MAKE-10CRATE-VERIFY ?auto_16751 ?auto_16752 ?auto_16753 ?auto_16754 ?auto_16755 ?auto_16756 ?auto_16757 ?auto_16758 ?auto_16759 ?auto_16760 ?auto_16761 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16815 - SURFACE
      ?auto_16816 - SURFACE
      ?auto_16817 - SURFACE
      ?auto_16818 - SURFACE
      ?auto_16819 - SURFACE
      ?auto_16820 - SURFACE
      ?auto_16821 - SURFACE
      ?auto_16822 - SURFACE
      ?auto_16823 - SURFACE
      ?auto_16824 - SURFACE
      ?auto_16825 - SURFACE
      ?auto_16826 - SURFACE
    )
    :vars
    (
      ?auto_16829 - HOIST
      ?auto_16830 - PLACE
      ?auto_16832 - PLACE
      ?auto_16831 - HOIST
      ?auto_16827 - SURFACE
      ?auto_16848 - PLACE
      ?auto_16842 - HOIST
      ?auto_16847 - SURFACE
      ?auto_16855 - SURFACE
      ?auto_16839 - PLACE
      ?auto_16837 - HOIST
      ?auto_16856 - SURFACE
      ?auto_16838 - PLACE
      ?auto_16851 - HOIST
      ?auto_16844 - SURFACE
      ?auto_16852 - PLACE
      ?auto_16845 - HOIST
      ?auto_16833 - SURFACE
      ?auto_16859 - PLACE
      ?auto_16846 - HOIST
      ?auto_16857 - SURFACE
      ?auto_16840 - PLACE
      ?auto_16850 - HOIST
      ?auto_16843 - SURFACE
      ?auto_16860 - PLACE
      ?auto_16836 - HOIST
      ?auto_16853 - SURFACE
      ?auto_16835 - PLACE
      ?auto_16849 - HOIST
      ?auto_16834 - SURFACE
      ?auto_16858 - PLACE
      ?auto_16841 - HOIST
      ?auto_16854 - SURFACE
      ?auto_16828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16829 ?auto_16830 ) ( IS-CRATE ?auto_16826 ) ( not ( = ?auto_16832 ?auto_16830 ) ) ( HOIST-AT ?auto_16831 ?auto_16832 ) ( AVAILABLE ?auto_16831 ) ( SURFACE-AT ?auto_16826 ?auto_16832 ) ( ON ?auto_16826 ?auto_16827 ) ( CLEAR ?auto_16826 ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16825 ?auto_16827 ) ) ( not ( = ?auto_16826 ?auto_16827 ) ) ( not ( = ?auto_16829 ?auto_16831 ) ) ( IS-CRATE ?auto_16825 ) ( not ( = ?auto_16848 ?auto_16830 ) ) ( HOIST-AT ?auto_16842 ?auto_16848 ) ( SURFACE-AT ?auto_16825 ?auto_16848 ) ( ON ?auto_16825 ?auto_16847 ) ( CLEAR ?auto_16825 ) ( not ( = ?auto_16824 ?auto_16825 ) ) ( not ( = ?auto_16824 ?auto_16847 ) ) ( not ( = ?auto_16825 ?auto_16847 ) ) ( not ( = ?auto_16829 ?auto_16842 ) ) ( IS-CRATE ?auto_16824 ) ( AVAILABLE ?auto_16842 ) ( SURFACE-AT ?auto_16824 ?auto_16848 ) ( ON ?auto_16824 ?auto_16855 ) ( CLEAR ?auto_16824 ) ( not ( = ?auto_16823 ?auto_16824 ) ) ( not ( = ?auto_16823 ?auto_16855 ) ) ( not ( = ?auto_16824 ?auto_16855 ) ) ( IS-CRATE ?auto_16823 ) ( not ( = ?auto_16839 ?auto_16830 ) ) ( HOIST-AT ?auto_16837 ?auto_16839 ) ( AVAILABLE ?auto_16837 ) ( SURFACE-AT ?auto_16823 ?auto_16839 ) ( ON ?auto_16823 ?auto_16856 ) ( CLEAR ?auto_16823 ) ( not ( = ?auto_16822 ?auto_16823 ) ) ( not ( = ?auto_16822 ?auto_16856 ) ) ( not ( = ?auto_16823 ?auto_16856 ) ) ( not ( = ?auto_16829 ?auto_16837 ) ) ( IS-CRATE ?auto_16822 ) ( not ( = ?auto_16838 ?auto_16830 ) ) ( HOIST-AT ?auto_16851 ?auto_16838 ) ( AVAILABLE ?auto_16851 ) ( SURFACE-AT ?auto_16822 ?auto_16838 ) ( ON ?auto_16822 ?auto_16844 ) ( CLEAR ?auto_16822 ) ( not ( = ?auto_16821 ?auto_16822 ) ) ( not ( = ?auto_16821 ?auto_16844 ) ) ( not ( = ?auto_16822 ?auto_16844 ) ) ( not ( = ?auto_16829 ?auto_16851 ) ) ( IS-CRATE ?auto_16821 ) ( not ( = ?auto_16852 ?auto_16830 ) ) ( HOIST-AT ?auto_16845 ?auto_16852 ) ( AVAILABLE ?auto_16845 ) ( SURFACE-AT ?auto_16821 ?auto_16852 ) ( ON ?auto_16821 ?auto_16833 ) ( CLEAR ?auto_16821 ) ( not ( = ?auto_16820 ?auto_16821 ) ) ( not ( = ?auto_16820 ?auto_16833 ) ) ( not ( = ?auto_16821 ?auto_16833 ) ) ( not ( = ?auto_16829 ?auto_16845 ) ) ( IS-CRATE ?auto_16820 ) ( not ( = ?auto_16859 ?auto_16830 ) ) ( HOIST-AT ?auto_16846 ?auto_16859 ) ( AVAILABLE ?auto_16846 ) ( SURFACE-AT ?auto_16820 ?auto_16859 ) ( ON ?auto_16820 ?auto_16857 ) ( CLEAR ?auto_16820 ) ( not ( = ?auto_16819 ?auto_16820 ) ) ( not ( = ?auto_16819 ?auto_16857 ) ) ( not ( = ?auto_16820 ?auto_16857 ) ) ( not ( = ?auto_16829 ?auto_16846 ) ) ( IS-CRATE ?auto_16819 ) ( not ( = ?auto_16840 ?auto_16830 ) ) ( HOIST-AT ?auto_16850 ?auto_16840 ) ( AVAILABLE ?auto_16850 ) ( SURFACE-AT ?auto_16819 ?auto_16840 ) ( ON ?auto_16819 ?auto_16843 ) ( CLEAR ?auto_16819 ) ( not ( = ?auto_16818 ?auto_16819 ) ) ( not ( = ?auto_16818 ?auto_16843 ) ) ( not ( = ?auto_16819 ?auto_16843 ) ) ( not ( = ?auto_16829 ?auto_16850 ) ) ( IS-CRATE ?auto_16818 ) ( not ( = ?auto_16860 ?auto_16830 ) ) ( HOIST-AT ?auto_16836 ?auto_16860 ) ( AVAILABLE ?auto_16836 ) ( SURFACE-AT ?auto_16818 ?auto_16860 ) ( ON ?auto_16818 ?auto_16853 ) ( CLEAR ?auto_16818 ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16853 ) ) ( not ( = ?auto_16818 ?auto_16853 ) ) ( not ( = ?auto_16829 ?auto_16836 ) ) ( IS-CRATE ?auto_16817 ) ( not ( = ?auto_16835 ?auto_16830 ) ) ( HOIST-AT ?auto_16849 ?auto_16835 ) ( AVAILABLE ?auto_16849 ) ( SURFACE-AT ?auto_16817 ?auto_16835 ) ( ON ?auto_16817 ?auto_16834 ) ( CLEAR ?auto_16817 ) ( not ( = ?auto_16816 ?auto_16817 ) ) ( not ( = ?auto_16816 ?auto_16834 ) ) ( not ( = ?auto_16817 ?auto_16834 ) ) ( not ( = ?auto_16829 ?auto_16849 ) ) ( SURFACE-AT ?auto_16815 ?auto_16830 ) ( CLEAR ?auto_16815 ) ( IS-CRATE ?auto_16816 ) ( AVAILABLE ?auto_16829 ) ( not ( = ?auto_16858 ?auto_16830 ) ) ( HOIST-AT ?auto_16841 ?auto_16858 ) ( AVAILABLE ?auto_16841 ) ( SURFACE-AT ?auto_16816 ?auto_16858 ) ( ON ?auto_16816 ?auto_16854 ) ( CLEAR ?auto_16816 ) ( TRUCK-AT ?auto_16828 ?auto_16830 ) ( not ( = ?auto_16815 ?auto_16816 ) ) ( not ( = ?auto_16815 ?auto_16854 ) ) ( not ( = ?auto_16816 ?auto_16854 ) ) ( not ( = ?auto_16829 ?auto_16841 ) ) ( not ( = ?auto_16815 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16834 ) ) ( not ( = ?auto_16817 ?auto_16854 ) ) ( not ( = ?auto_16835 ?auto_16858 ) ) ( not ( = ?auto_16849 ?auto_16841 ) ) ( not ( = ?auto_16834 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( not ( = ?auto_16815 ?auto_16853 ) ) ( not ( = ?auto_16816 ?auto_16818 ) ) ( not ( = ?auto_16816 ?auto_16853 ) ) ( not ( = ?auto_16818 ?auto_16834 ) ) ( not ( = ?auto_16818 ?auto_16854 ) ) ( not ( = ?auto_16860 ?auto_16835 ) ) ( not ( = ?auto_16860 ?auto_16858 ) ) ( not ( = ?auto_16836 ?auto_16849 ) ) ( not ( = ?auto_16836 ?auto_16841 ) ) ( not ( = ?auto_16853 ?auto_16834 ) ) ( not ( = ?auto_16853 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16819 ) ) ( not ( = ?auto_16815 ?auto_16843 ) ) ( not ( = ?auto_16816 ?auto_16819 ) ) ( not ( = ?auto_16816 ?auto_16843 ) ) ( not ( = ?auto_16817 ?auto_16819 ) ) ( not ( = ?auto_16817 ?auto_16843 ) ) ( not ( = ?auto_16819 ?auto_16853 ) ) ( not ( = ?auto_16819 ?auto_16834 ) ) ( not ( = ?auto_16819 ?auto_16854 ) ) ( not ( = ?auto_16840 ?auto_16860 ) ) ( not ( = ?auto_16840 ?auto_16835 ) ) ( not ( = ?auto_16840 ?auto_16858 ) ) ( not ( = ?auto_16850 ?auto_16836 ) ) ( not ( = ?auto_16850 ?auto_16849 ) ) ( not ( = ?auto_16850 ?auto_16841 ) ) ( not ( = ?auto_16843 ?auto_16853 ) ) ( not ( = ?auto_16843 ?auto_16834 ) ) ( not ( = ?auto_16843 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16820 ) ) ( not ( = ?auto_16815 ?auto_16857 ) ) ( not ( = ?auto_16816 ?auto_16820 ) ) ( not ( = ?auto_16816 ?auto_16857 ) ) ( not ( = ?auto_16817 ?auto_16820 ) ) ( not ( = ?auto_16817 ?auto_16857 ) ) ( not ( = ?auto_16818 ?auto_16820 ) ) ( not ( = ?auto_16818 ?auto_16857 ) ) ( not ( = ?auto_16820 ?auto_16843 ) ) ( not ( = ?auto_16820 ?auto_16853 ) ) ( not ( = ?auto_16820 ?auto_16834 ) ) ( not ( = ?auto_16820 ?auto_16854 ) ) ( not ( = ?auto_16859 ?auto_16840 ) ) ( not ( = ?auto_16859 ?auto_16860 ) ) ( not ( = ?auto_16859 ?auto_16835 ) ) ( not ( = ?auto_16859 ?auto_16858 ) ) ( not ( = ?auto_16846 ?auto_16850 ) ) ( not ( = ?auto_16846 ?auto_16836 ) ) ( not ( = ?auto_16846 ?auto_16849 ) ) ( not ( = ?auto_16846 ?auto_16841 ) ) ( not ( = ?auto_16857 ?auto_16843 ) ) ( not ( = ?auto_16857 ?auto_16853 ) ) ( not ( = ?auto_16857 ?auto_16834 ) ) ( not ( = ?auto_16857 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16821 ) ) ( not ( = ?auto_16815 ?auto_16833 ) ) ( not ( = ?auto_16816 ?auto_16821 ) ) ( not ( = ?auto_16816 ?auto_16833 ) ) ( not ( = ?auto_16817 ?auto_16821 ) ) ( not ( = ?auto_16817 ?auto_16833 ) ) ( not ( = ?auto_16818 ?auto_16821 ) ) ( not ( = ?auto_16818 ?auto_16833 ) ) ( not ( = ?auto_16819 ?auto_16821 ) ) ( not ( = ?auto_16819 ?auto_16833 ) ) ( not ( = ?auto_16821 ?auto_16857 ) ) ( not ( = ?auto_16821 ?auto_16843 ) ) ( not ( = ?auto_16821 ?auto_16853 ) ) ( not ( = ?auto_16821 ?auto_16834 ) ) ( not ( = ?auto_16821 ?auto_16854 ) ) ( not ( = ?auto_16852 ?auto_16859 ) ) ( not ( = ?auto_16852 ?auto_16840 ) ) ( not ( = ?auto_16852 ?auto_16860 ) ) ( not ( = ?auto_16852 ?auto_16835 ) ) ( not ( = ?auto_16852 ?auto_16858 ) ) ( not ( = ?auto_16845 ?auto_16846 ) ) ( not ( = ?auto_16845 ?auto_16850 ) ) ( not ( = ?auto_16845 ?auto_16836 ) ) ( not ( = ?auto_16845 ?auto_16849 ) ) ( not ( = ?auto_16845 ?auto_16841 ) ) ( not ( = ?auto_16833 ?auto_16857 ) ) ( not ( = ?auto_16833 ?auto_16843 ) ) ( not ( = ?auto_16833 ?auto_16853 ) ) ( not ( = ?auto_16833 ?auto_16834 ) ) ( not ( = ?auto_16833 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16822 ) ) ( not ( = ?auto_16815 ?auto_16844 ) ) ( not ( = ?auto_16816 ?auto_16822 ) ) ( not ( = ?auto_16816 ?auto_16844 ) ) ( not ( = ?auto_16817 ?auto_16822 ) ) ( not ( = ?auto_16817 ?auto_16844 ) ) ( not ( = ?auto_16818 ?auto_16822 ) ) ( not ( = ?auto_16818 ?auto_16844 ) ) ( not ( = ?auto_16819 ?auto_16822 ) ) ( not ( = ?auto_16819 ?auto_16844 ) ) ( not ( = ?auto_16820 ?auto_16822 ) ) ( not ( = ?auto_16820 ?auto_16844 ) ) ( not ( = ?auto_16822 ?auto_16833 ) ) ( not ( = ?auto_16822 ?auto_16857 ) ) ( not ( = ?auto_16822 ?auto_16843 ) ) ( not ( = ?auto_16822 ?auto_16853 ) ) ( not ( = ?auto_16822 ?auto_16834 ) ) ( not ( = ?auto_16822 ?auto_16854 ) ) ( not ( = ?auto_16838 ?auto_16852 ) ) ( not ( = ?auto_16838 ?auto_16859 ) ) ( not ( = ?auto_16838 ?auto_16840 ) ) ( not ( = ?auto_16838 ?auto_16860 ) ) ( not ( = ?auto_16838 ?auto_16835 ) ) ( not ( = ?auto_16838 ?auto_16858 ) ) ( not ( = ?auto_16851 ?auto_16845 ) ) ( not ( = ?auto_16851 ?auto_16846 ) ) ( not ( = ?auto_16851 ?auto_16850 ) ) ( not ( = ?auto_16851 ?auto_16836 ) ) ( not ( = ?auto_16851 ?auto_16849 ) ) ( not ( = ?auto_16851 ?auto_16841 ) ) ( not ( = ?auto_16844 ?auto_16833 ) ) ( not ( = ?auto_16844 ?auto_16857 ) ) ( not ( = ?auto_16844 ?auto_16843 ) ) ( not ( = ?auto_16844 ?auto_16853 ) ) ( not ( = ?auto_16844 ?auto_16834 ) ) ( not ( = ?auto_16844 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16823 ) ) ( not ( = ?auto_16815 ?auto_16856 ) ) ( not ( = ?auto_16816 ?auto_16823 ) ) ( not ( = ?auto_16816 ?auto_16856 ) ) ( not ( = ?auto_16817 ?auto_16823 ) ) ( not ( = ?auto_16817 ?auto_16856 ) ) ( not ( = ?auto_16818 ?auto_16823 ) ) ( not ( = ?auto_16818 ?auto_16856 ) ) ( not ( = ?auto_16819 ?auto_16823 ) ) ( not ( = ?auto_16819 ?auto_16856 ) ) ( not ( = ?auto_16820 ?auto_16823 ) ) ( not ( = ?auto_16820 ?auto_16856 ) ) ( not ( = ?auto_16821 ?auto_16823 ) ) ( not ( = ?auto_16821 ?auto_16856 ) ) ( not ( = ?auto_16823 ?auto_16844 ) ) ( not ( = ?auto_16823 ?auto_16833 ) ) ( not ( = ?auto_16823 ?auto_16857 ) ) ( not ( = ?auto_16823 ?auto_16843 ) ) ( not ( = ?auto_16823 ?auto_16853 ) ) ( not ( = ?auto_16823 ?auto_16834 ) ) ( not ( = ?auto_16823 ?auto_16854 ) ) ( not ( = ?auto_16839 ?auto_16838 ) ) ( not ( = ?auto_16839 ?auto_16852 ) ) ( not ( = ?auto_16839 ?auto_16859 ) ) ( not ( = ?auto_16839 ?auto_16840 ) ) ( not ( = ?auto_16839 ?auto_16860 ) ) ( not ( = ?auto_16839 ?auto_16835 ) ) ( not ( = ?auto_16839 ?auto_16858 ) ) ( not ( = ?auto_16837 ?auto_16851 ) ) ( not ( = ?auto_16837 ?auto_16845 ) ) ( not ( = ?auto_16837 ?auto_16846 ) ) ( not ( = ?auto_16837 ?auto_16850 ) ) ( not ( = ?auto_16837 ?auto_16836 ) ) ( not ( = ?auto_16837 ?auto_16849 ) ) ( not ( = ?auto_16837 ?auto_16841 ) ) ( not ( = ?auto_16856 ?auto_16844 ) ) ( not ( = ?auto_16856 ?auto_16833 ) ) ( not ( = ?auto_16856 ?auto_16857 ) ) ( not ( = ?auto_16856 ?auto_16843 ) ) ( not ( = ?auto_16856 ?auto_16853 ) ) ( not ( = ?auto_16856 ?auto_16834 ) ) ( not ( = ?auto_16856 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16824 ) ) ( not ( = ?auto_16815 ?auto_16855 ) ) ( not ( = ?auto_16816 ?auto_16824 ) ) ( not ( = ?auto_16816 ?auto_16855 ) ) ( not ( = ?auto_16817 ?auto_16824 ) ) ( not ( = ?auto_16817 ?auto_16855 ) ) ( not ( = ?auto_16818 ?auto_16824 ) ) ( not ( = ?auto_16818 ?auto_16855 ) ) ( not ( = ?auto_16819 ?auto_16824 ) ) ( not ( = ?auto_16819 ?auto_16855 ) ) ( not ( = ?auto_16820 ?auto_16824 ) ) ( not ( = ?auto_16820 ?auto_16855 ) ) ( not ( = ?auto_16821 ?auto_16824 ) ) ( not ( = ?auto_16821 ?auto_16855 ) ) ( not ( = ?auto_16822 ?auto_16824 ) ) ( not ( = ?auto_16822 ?auto_16855 ) ) ( not ( = ?auto_16824 ?auto_16856 ) ) ( not ( = ?auto_16824 ?auto_16844 ) ) ( not ( = ?auto_16824 ?auto_16833 ) ) ( not ( = ?auto_16824 ?auto_16857 ) ) ( not ( = ?auto_16824 ?auto_16843 ) ) ( not ( = ?auto_16824 ?auto_16853 ) ) ( not ( = ?auto_16824 ?auto_16834 ) ) ( not ( = ?auto_16824 ?auto_16854 ) ) ( not ( = ?auto_16848 ?auto_16839 ) ) ( not ( = ?auto_16848 ?auto_16838 ) ) ( not ( = ?auto_16848 ?auto_16852 ) ) ( not ( = ?auto_16848 ?auto_16859 ) ) ( not ( = ?auto_16848 ?auto_16840 ) ) ( not ( = ?auto_16848 ?auto_16860 ) ) ( not ( = ?auto_16848 ?auto_16835 ) ) ( not ( = ?auto_16848 ?auto_16858 ) ) ( not ( = ?auto_16842 ?auto_16837 ) ) ( not ( = ?auto_16842 ?auto_16851 ) ) ( not ( = ?auto_16842 ?auto_16845 ) ) ( not ( = ?auto_16842 ?auto_16846 ) ) ( not ( = ?auto_16842 ?auto_16850 ) ) ( not ( = ?auto_16842 ?auto_16836 ) ) ( not ( = ?auto_16842 ?auto_16849 ) ) ( not ( = ?auto_16842 ?auto_16841 ) ) ( not ( = ?auto_16855 ?auto_16856 ) ) ( not ( = ?auto_16855 ?auto_16844 ) ) ( not ( = ?auto_16855 ?auto_16833 ) ) ( not ( = ?auto_16855 ?auto_16857 ) ) ( not ( = ?auto_16855 ?auto_16843 ) ) ( not ( = ?auto_16855 ?auto_16853 ) ) ( not ( = ?auto_16855 ?auto_16834 ) ) ( not ( = ?auto_16855 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16825 ) ) ( not ( = ?auto_16815 ?auto_16847 ) ) ( not ( = ?auto_16816 ?auto_16825 ) ) ( not ( = ?auto_16816 ?auto_16847 ) ) ( not ( = ?auto_16817 ?auto_16825 ) ) ( not ( = ?auto_16817 ?auto_16847 ) ) ( not ( = ?auto_16818 ?auto_16825 ) ) ( not ( = ?auto_16818 ?auto_16847 ) ) ( not ( = ?auto_16819 ?auto_16825 ) ) ( not ( = ?auto_16819 ?auto_16847 ) ) ( not ( = ?auto_16820 ?auto_16825 ) ) ( not ( = ?auto_16820 ?auto_16847 ) ) ( not ( = ?auto_16821 ?auto_16825 ) ) ( not ( = ?auto_16821 ?auto_16847 ) ) ( not ( = ?auto_16822 ?auto_16825 ) ) ( not ( = ?auto_16822 ?auto_16847 ) ) ( not ( = ?auto_16823 ?auto_16825 ) ) ( not ( = ?auto_16823 ?auto_16847 ) ) ( not ( = ?auto_16825 ?auto_16855 ) ) ( not ( = ?auto_16825 ?auto_16856 ) ) ( not ( = ?auto_16825 ?auto_16844 ) ) ( not ( = ?auto_16825 ?auto_16833 ) ) ( not ( = ?auto_16825 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16843 ) ) ( not ( = ?auto_16825 ?auto_16853 ) ) ( not ( = ?auto_16825 ?auto_16834 ) ) ( not ( = ?auto_16825 ?auto_16854 ) ) ( not ( = ?auto_16847 ?auto_16855 ) ) ( not ( = ?auto_16847 ?auto_16856 ) ) ( not ( = ?auto_16847 ?auto_16844 ) ) ( not ( = ?auto_16847 ?auto_16833 ) ) ( not ( = ?auto_16847 ?auto_16857 ) ) ( not ( = ?auto_16847 ?auto_16843 ) ) ( not ( = ?auto_16847 ?auto_16853 ) ) ( not ( = ?auto_16847 ?auto_16834 ) ) ( not ( = ?auto_16847 ?auto_16854 ) ) ( not ( = ?auto_16815 ?auto_16826 ) ) ( not ( = ?auto_16815 ?auto_16827 ) ) ( not ( = ?auto_16816 ?auto_16826 ) ) ( not ( = ?auto_16816 ?auto_16827 ) ) ( not ( = ?auto_16817 ?auto_16826 ) ) ( not ( = ?auto_16817 ?auto_16827 ) ) ( not ( = ?auto_16818 ?auto_16826 ) ) ( not ( = ?auto_16818 ?auto_16827 ) ) ( not ( = ?auto_16819 ?auto_16826 ) ) ( not ( = ?auto_16819 ?auto_16827 ) ) ( not ( = ?auto_16820 ?auto_16826 ) ) ( not ( = ?auto_16820 ?auto_16827 ) ) ( not ( = ?auto_16821 ?auto_16826 ) ) ( not ( = ?auto_16821 ?auto_16827 ) ) ( not ( = ?auto_16822 ?auto_16826 ) ) ( not ( = ?auto_16822 ?auto_16827 ) ) ( not ( = ?auto_16823 ?auto_16826 ) ) ( not ( = ?auto_16823 ?auto_16827 ) ) ( not ( = ?auto_16824 ?auto_16826 ) ) ( not ( = ?auto_16824 ?auto_16827 ) ) ( not ( = ?auto_16826 ?auto_16847 ) ) ( not ( = ?auto_16826 ?auto_16855 ) ) ( not ( = ?auto_16826 ?auto_16856 ) ) ( not ( = ?auto_16826 ?auto_16844 ) ) ( not ( = ?auto_16826 ?auto_16833 ) ) ( not ( = ?auto_16826 ?auto_16857 ) ) ( not ( = ?auto_16826 ?auto_16843 ) ) ( not ( = ?auto_16826 ?auto_16853 ) ) ( not ( = ?auto_16826 ?auto_16834 ) ) ( not ( = ?auto_16826 ?auto_16854 ) ) ( not ( = ?auto_16832 ?auto_16848 ) ) ( not ( = ?auto_16832 ?auto_16839 ) ) ( not ( = ?auto_16832 ?auto_16838 ) ) ( not ( = ?auto_16832 ?auto_16852 ) ) ( not ( = ?auto_16832 ?auto_16859 ) ) ( not ( = ?auto_16832 ?auto_16840 ) ) ( not ( = ?auto_16832 ?auto_16860 ) ) ( not ( = ?auto_16832 ?auto_16835 ) ) ( not ( = ?auto_16832 ?auto_16858 ) ) ( not ( = ?auto_16831 ?auto_16842 ) ) ( not ( = ?auto_16831 ?auto_16837 ) ) ( not ( = ?auto_16831 ?auto_16851 ) ) ( not ( = ?auto_16831 ?auto_16845 ) ) ( not ( = ?auto_16831 ?auto_16846 ) ) ( not ( = ?auto_16831 ?auto_16850 ) ) ( not ( = ?auto_16831 ?auto_16836 ) ) ( not ( = ?auto_16831 ?auto_16849 ) ) ( not ( = ?auto_16831 ?auto_16841 ) ) ( not ( = ?auto_16827 ?auto_16847 ) ) ( not ( = ?auto_16827 ?auto_16855 ) ) ( not ( = ?auto_16827 ?auto_16856 ) ) ( not ( = ?auto_16827 ?auto_16844 ) ) ( not ( = ?auto_16827 ?auto_16833 ) ) ( not ( = ?auto_16827 ?auto_16857 ) ) ( not ( = ?auto_16827 ?auto_16843 ) ) ( not ( = ?auto_16827 ?auto_16853 ) ) ( not ( = ?auto_16827 ?auto_16834 ) ) ( not ( = ?auto_16827 ?auto_16854 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 ?auto_16819 ?auto_16820 ?auto_16821 ?auto_16822 ?auto_16823 ?auto_16824 ?auto_16825 )
      ( MAKE-1CRATE ?auto_16825 ?auto_16826 )
      ( MAKE-11CRATE-VERIFY ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 ?auto_16819 ?auto_16820 ?auto_16821 ?auto_16822 ?auto_16823 ?auto_16824 ?auto_16825 ?auto_16826 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_16884 - SURFACE
      ?auto_16885 - SURFACE
      ?auto_16886 - SURFACE
      ?auto_16887 - SURFACE
      ?auto_16888 - SURFACE
      ?auto_16889 - SURFACE
      ?auto_16890 - SURFACE
      ?auto_16891 - SURFACE
      ?auto_16892 - SURFACE
      ?auto_16893 - SURFACE
      ?auto_16894 - SURFACE
      ?auto_16895 - SURFACE
      ?auto_16896 - SURFACE
    )
    :vars
    (
      ?auto_16897 - HOIST
      ?auto_16899 - PLACE
      ?auto_16898 - PLACE
      ?auto_16901 - HOIST
      ?auto_16900 - SURFACE
      ?auto_16923 - SURFACE
      ?auto_16927 - PLACE
      ?auto_16903 - HOIST
      ?auto_16920 - SURFACE
      ?auto_16911 - SURFACE
      ?auto_16907 - PLACE
      ?auto_16908 - HOIST
      ?auto_16912 - SURFACE
      ?auto_16921 - PLACE
      ?auto_16914 - HOIST
      ?auto_16930 - SURFACE
      ?auto_16929 - PLACE
      ?auto_16918 - HOIST
      ?auto_16928 - SURFACE
      ?auto_16925 - PLACE
      ?auto_16909 - HOIST
      ?auto_16919 - SURFACE
      ?auto_16910 - PLACE
      ?auto_16915 - HOIST
      ?auto_16904 - SURFACE
      ?auto_16931 - PLACE
      ?auto_16905 - HOIST
      ?auto_16924 - SURFACE
      ?auto_16916 - PLACE
      ?auto_16913 - HOIST
      ?auto_16926 - SURFACE
      ?auto_16917 - PLACE
      ?auto_16922 - HOIST
      ?auto_16906 - SURFACE
      ?auto_16902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16897 ?auto_16899 ) ( IS-CRATE ?auto_16896 ) ( not ( = ?auto_16898 ?auto_16899 ) ) ( HOIST-AT ?auto_16901 ?auto_16898 ) ( SURFACE-AT ?auto_16896 ?auto_16898 ) ( ON ?auto_16896 ?auto_16900 ) ( CLEAR ?auto_16896 ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16900 ) ) ( not ( = ?auto_16896 ?auto_16900 ) ) ( not ( = ?auto_16897 ?auto_16901 ) ) ( IS-CRATE ?auto_16895 ) ( AVAILABLE ?auto_16901 ) ( SURFACE-AT ?auto_16895 ?auto_16898 ) ( ON ?auto_16895 ?auto_16923 ) ( CLEAR ?auto_16895 ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16923 ) ) ( not ( = ?auto_16895 ?auto_16923 ) ) ( IS-CRATE ?auto_16894 ) ( not ( = ?auto_16927 ?auto_16899 ) ) ( HOIST-AT ?auto_16903 ?auto_16927 ) ( SURFACE-AT ?auto_16894 ?auto_16927 ) ( ON ?auto_16894 ?auto_16920 ) ( CLEAR ?auto_16894 ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16920 ) ) ( not ( = ?auto_16894 ?auto_16920 ) ) ( not ( = ?auto_16897 ?auto_16903 ) ) ( IS-CRATE ?auto_16893 ) ( AVAILABLE ?auto_16903 ) ( SURFACE-AT ?auto_16893 ?auto_16927 ) ( ON ?auto_16893 ?auto_16911 ) ( CLEAR ?auto_16893 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16911 ) ) ( not ( = ?auto_16893 ?auto_16911 ) ) ( IS-CRATE ?auto_16892 ) ( not ( = ?auto_16907 ?auto_16899 ) ) ( HOIST-AT ?auto_16908 ?auto_16907 ) ( AVAILABLE ?auto_16908 ) ( SURFACE-AT ?auto_16892 ?auto_16907 ) ( ON ?auto_16892 ?auto_16912 ) ( CLEAR ?auto_16892 ) ( not ( = ?auto_16891 ?auto_16892 ) ) ( not ( = ?auto_16891 ?auto_16912 ) ) ( not ( = ?auto_16892 ?auto_16912 ) ) ( not ( = ?auto_16897 ?auto_16908 ) ) ( IS-CRATE ?auto_16891 ) ( not ( = ?auto_16921 ?auto_16899 ) ) ( HOIST-AT ?auto_16914 ?auto_16921 ) ( AVAILABLE ?auto_16914 ) ( SURFACE-AT ?auto_16891 ?auto_16921 ) ( ON ?auto_16891 ?auto_16930 ) ( CLEAR ?auto_16891 ) ( not ( = ?auto_16890 ?auto_16891 ) ) ( not ( = ?auto_16890 ?auto_16930 ) ) ( not ( = ?auto_16891 ?auto_16930 ) ) ( not ( = ?auto_16897 ?auto_16914 ) ) ( IS-CRATE ?auto_16890 ) ( not ( = ?auto_16929 ?auto_16899 ) ) ( HOIST-AT ?auto_16918 ?auto_16929 ) ( AVAILABLE ?auto_16918 ) ( SURFACE-AT ?auto_16890 ?auto_16929 ) ( ON ?auto_16890 ?auto_16928 ) ( CLEAR ?auto_16890 ) ( not ( = ?auto_16889 ?auto_16890 ) ) ( not ( = ?auto_16889 ?auto_16928 ) ) ( not ( = ?auto_16890 ?auto_16928 ) ) ( not ( = ?auto_16897 ?auto_16918 ) ) ( IS-CRATE ?auto_16889 ) ( not ( = ?auto_16925 ?auto_16899 ) ) ( HOIST-AT ?auto_16909 ?auto_16925 ) ( AVAILABLE ?auto_16909 ) ( SURFACE-AT ?auto_16889 ?auto_16925 ) ( ON ?auto_16889 ?auto_16919 ) ( CLEAR ?auto_16889 ) ( not ( = ?auto_16888 ?auto_16889 ) ) ( not ( = ?auto_16888 ?auto_16919 ) ) ( not ( = ?auto_16889 ?auto_16919 ) ) ( not ( = ?auto_16897 ?auto_16909 ) ) ( IS-CRATE ?auto_16888 ) ( not ( = ?auto_16910 ?auto_16899 ) ) ( HOIST-AT ?auto_16915 ?auto_16910 ) ( AVAILABLE ?auto_16915 ) ( SURFACE-AT ?auto_16888 ?auto_16910 ) ( ON ?auto_16888 ?auto_16904 ) ( CLEAR ?auto_16888 ) ( not ( = ?auto_16887 ?auto_16888 ) ) ( not ( = ?auto_16887 ?auto_16904 ) ) ( not ( = ?auto_16888 ?auto_16904 ) ) ( not ( = ?auto_16897 ?auto_16915 ) ) ( IS-CRATE ?auto_16887 ) ( not ( = ?auto_16931 ?auto_16899 ) ) ( HOIST-AT ?auto_16905 ?auto_16931 ) ( AVAILABLE ?auto_16905 ) ( SURFACE-AT ?auto_16887 ?auto_16931 ) ( ON ?auto_16887 ?auto_16924 ) ( CLEAR ?auto_16887 ) ( not ( = ?auto_16886 ?auto_16887 ) ) ( not ( = ?auto_16886 ?auto_16924 ) ) ( not ( = ?auto_16887 ?auto_16924 ) ) ( not ( = ?auto_16897 ?auto_16905 ) ) ( IS-CRATE ?auto_16886 ) ( not ( = ?auto_16916 ?auto_16899 ) ) ( HOIST-AT ?auto_16913 ?auto_16916 ) ( AVAILABLE ?auto_16913 ) ( SURFACE-AT ?auto_16886 ?auto_16916 ) ( ON ?auto_16886 ?auto_16926 ) ( CLEAR ?auto_16886 ) ( not ( = ?auto_16885 ?auto_16886 ) ) ( not ( = ?auto_16885 ?auto_16926 ) ) ( not ( = ?auto_16886 ?auto_16926 ) ) ( not ( = ?auto_16897 ?auto_16913 ) ) ( SURFACE-AT ?auto_16884 ?auto_16899 ) ( CLEAR ?auto_16884 ) ( IS-CRATE ?auto_16885 ) ( AVAILABLE ?auto_16897 ) ( not ( = ?auto_16917 ?auto_16899 ) ) ( HOIST-AT ?auto_16922 ?auto_16917 ) ( AVAILABLE ?auto_16922 ) ( SURFACE-AT ?auto_16885 ?auto_16917 ) ( ON ?auto_16885 ?auto_16906 ) ( CLEAR ?auto_16885 ) ( TRUCK-AT ?auto_16902 ?auto_16899 ) ( not ( = ?auto_16884 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16906 ) ) ( not ( = ?auto_16885 ?auto_16906 ) ) ( not ( = ?auto_16897 ?auto_16922 ) ) ( not ( = ?auto_16884 ?auto_16886 ) ) ( not ( = ?auto_16884 ?auto_16926 ) ) ( not ( = ?auto_16886 ?auto_16906 ) ) ( not ( = ?auto_16916 ?auto_16917 ) ) ( not ( = ?auto_16913 ?auto_16922 ) ) ( not ( = ?auto_16926 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16887 ) ) ( not ( = ?auto_16884 ?auto_16924 ) ) ( not ( = ?auto_16885 ?auto_16887 ) ) ( not ( = ?auto_16885 ?auto_16924 ) ) ( not ( = ?auto_16887 ?auto_16926 ) ) ( not ( = ?auto_16887 ?auto_16906 ) ) ( not ( = ?auto_16931 ?auto_16916 ) ) ( not ( = ?auto_16931 ?auto_16917 ) ) ( not ( = ?auto_16905 ?auto_16913 ) ) ( not ( = ?auto_16905 ?auto_16922 ) ) ( not ( = ?auto_16924 ?auto_16926 ) ) ( not ( = ?auto_16924 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16888 ) ) ( not ( = ?auto_16884 ?auto_16904 ) ) ( not ( = ?auto_16885 ?auto_16888 ) ) ( not ( = ?auto_16885 ?auto_16904 ) ) ( not ( = ?auto_16886 ?auto_16888 ) ) ( not ( = ?auto_16886 ?auto_16904 ) ) ( not ( = ?auto_16888 ?auto_16924 ) ) ( not ( = ?auto_16888 ?auto_16926 ) ) ( not ( = ?auto_16888 ?auto_16906 ) ) ( not ( = ?auto_16910 ?auto_16931 ) ) ( not ( = ?auto_16910 ?auto_16916 ) ) ( not ( = ?auto_16910 ?auto_16917 ) ) ( not ( = ?auto_16915 ?auto_16905 ) ) ( not ( = ?auto_16915 ?auto_16913 ) ) ( not ( = ?auto_16915 ?auto_16922 ) ) ( not ( = ?auto_16904 ?auto_16924 ) ) ( not ( = ?auto_16904 ?auto_16926 ) ) ( not ( = ?auto_16904 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16889 ) ) ( not ( = ?auto_16884 ?auto_16919 ) ) ( not ( = ?auto_16885 ?auto_16889 ) ) ( not ( = ?auto_16885 ?auto_16919 ) ) ( not ( = ?auto_16886 ?auto_16889 ) ) ( not ( = ?auto_16886 ?auto_16919 ) ) ( not ( = ?auto_16887 ?auto_16889 ) ) ( not ( = ?auto_16887 ?auto_16919 ) ) ( not ( = ?auto_16889 ?auto_16904 ) ) ( not ( = ?auto_16889 ?auto_16924 ) ) ( not ( = ?auto_16889 ?auto_16926 ) ) ( not ( = ?auto_16889 ?auto_16906 ) ) ( not ( = ?auto_16925 ?auto_16910 ) ) ( not ( = ?auto_16925 ?auto_16931 ) ) ( not ( = ?auto_16925 ?auto_16916 ) ) ( not ( = ?auto_16925 ?auto_16917 ) ) ( not ( = ?auto_16909 ?auto_16915 ) ) ( not ( = ?auto_16909 ?auto_16905 ) ) ( not ( = ?auto_16909 ?auto_16913 ) ) ( not ( = ?auto_16909 ?auto_16922 ) ) ( not ( = ?auto_16919 ?auto_16904 ) ) ( not ( = ?auto_16919 ?auto_16924 ) ) ( not ( = ?auto_16919 ?auto_16926 ) ) ( not ( = ?auto_16919 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16890 ) ) ( not ( = ?auto_16884 ?auto_16928 ) ) ( not ( = ?auto_16885 ?auto_16890 ) ) ( not ( = ?auto_16885 ?auto_16928 ) ) ( not ( = ?auto_16886 ?auto_16890 ) ) ( not ( = ?auto_16886 ?auto_16928 ) ) ( not ( = ?auto_16887 ?auto_16890 ) ) ( not ( = ?auto_16887 ?auto_16928 ) ) ( not ( = ?auto_16888 ?auto_16890 ) ) ( not ( = ?auto_16888 ?auto_16928 ) ) ( not ( = ?auto_16890 ?auto_16919 ) ) ( not ( = ?auto_16890 ?auto_16904 ) ) ( not ( = ?auto_16890 ?auto_16924 ) ) ( not ( = ?auto_16890 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16906 ) ) ( not ( = ?auto_16929 ?auto_16925 ) ) ( not ( = ?auto_16929 ?auto_16910 ) ) ( not ( = ?auto_16929 ?auto_16931 ) ) ( not ( = ?auto_16929 ?auto_16916 ) ) ( not ( = ?auto_16929 ?auto_16917 ) ) ( not ( = ?auto_16918 ?auto_16909 ) ) ( not ( = ?auto_16918 ?auto_16915 ) ) ( not ( = ?auto_16918 ?auto_16905 ) ) ( not ( = ?auto_16918 ?auto_16913 ) ) ( not ( = ?auto_16918 ?auto_16922 ) ) ( not ( = ?auto_16928 ?auto_16919 ) ) ( not ( = ?auto_16928 ?auto_16904 ) ) ( not ( = ?auto_16928 ?auto_16924 ) ) ( not ( = ?auto_16928 ?auto_16926 ) ) ( not ( = ?auto_16928 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16891 ) ) ( not ( = ?auto_16884 ?auto_16930 ) ) ( not ( = ?auto_16885 ?auto_16891 ) ) ( not ( = ?auto_16885 ?auto_16930 ) ) ( not ( = ?auto_16886 ?auto_16891 ) ) ( not ( = ?auto_16886 ?auto_16930 ) ) ( not ( = ?auto_16887 ?auto_16891 ) ) ( not ( = ?auto_16887 ?auto_16930 ) ) ( not ( = ?auto_16888 ?auto_16891 ) ) ( not ( = ?auto_16888 ?auto_16930 ) ) ( not ( = ?auto_16889 ?auto_16891 ) ) ( not ( = ?auto_16889 ?auto_16930 ) ) ( not ( = ?auto_16891 ?auto_16928 ) ) ( not ( = ?auto_16891 ?auto_16919 ) ) ( not ( = ?auto_16891 ?auto_16904 ) ) ( not ( = ?auto_16891 ?auto_16924 ) ) ( not ( = ?auto_16891 ?auto_16926 ) ) ( not ( = ?auto_16891 ?auto_16906 ) ) ( not ( = ?auto_16921 ?auto_16929 ) ) ( not ( = ?auto_16921 ?auto_16925 ) ) ( not ( = ?auto_16921 ?auto_16910 ) ) ( not ( = ?auto_16921 ?auto_16931 ) ) ( not ( = ?auto_16921 ?auto_16916 ) ) ( not ( = ?auto_16921 ?auto_16917 ) ) ( not ( = ?auto_16914 ?auto_16918 ) ) ( not ( = ?auto_16914 ?auto_16909 ) ) ( not ( = ?auto_16914 ?auto_16915 ) ) ( not ( = ?auto_16914 ?auto_16905 ) ) ( not ( = ?auto_16914 ?auto_16913 ) ) ( not ( = ?auto_16914 ?auto_16922 ) ) ( not ( = ?auto_16930 ?auto_16928 ) ) ( not ( = ?auto_16930 ?auto_16919 ) ) ( not ( = ?auto_16930 ?auto_16904 ) ) ( not ( = ?auto_16930 ?auto_16924 ) ) ( not ( = ?auto_16930 ?auto_16926 ) ) ( not ( = ?auto_16930 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16892 ) ) ( not ( = ?auto_16884 ?auto_16912 ) ) ( not ( = ?auto_16885 ?auto_16892 ) ) ( not ( = ?auto_16885 ?auto_16912 ) ) ( not ( = ?auto_16886 ?auto_16892 ) ) ( not ( = ?auto_16886 ?auto_16912 ) ) ( not ( = ?auto_16887 ?auto_16892 ) ) ( not ( = ?auto_16887 ?auto_16912 ) ) ( not ( = ?auto_16888 ?auto_16892 ) ) ( not ( = ?auto_16888 ?auto_16912 ) ) ( not ( = ?auto_16889 ?auto_16892 ) ) ( not ( = ?auto_16889 ?auto_16912 ) ) ( not ( = ?auto_16890 ?auto_16892 ) ) ( not ( = ?auto_16890 ?auto_16912 ) ) ( not ( = ?auto_16892 ?auto_16930 ) ) ( not ( = ?auto_16892 ?auto_16928 ) ) ( not ( = ?auto_16892 ?auto_16919 ) ) ( not ( = ?auto_16892 ?auto_16904 ) ) ( not ( = ?auto_16892 ?auto_16924 ) ) ( not ( = ?auto_16892 ?auto_16926 ) ) ( not ( = ?auto_16892 ?auto_16906 ) ) ( not ( = ?auto_16907 ?auto_16921 ) ) ( not ( = ?auto_16907 ?auto_16929 ) ) ( not ( = ?auto_16907 ?auto_16925 ) ) ( not ( = ?auto_16907 ?auto_16910 ) ) ( not ( = ?auto_16907 ?auto_16931 ) ) ( not ( = ?auto_16907 ?auto_16916 ) ) ( not ( = ?auto_16907 ?auto_16917 ) ) ( not ( = ?auto_16908 ?auto_16914 ) ) ( not ( = ?auto_16908 ?auto_16918 ) ) ( not ( = ?auto_16908 ?auto_16909 ) ) ( not ( = ?auto_16908 ?auto_16915 ) ) ( not ( = ?auto_16908 ?auto_16905 ) ) ( not ( = ?auto_16908 ?auto_16913 ) ) ( not ( = ?auto_16908 ?auto_16922 ) ) ( not ( = ?auto_16912 ?auto_16930 ) ) ( not ( = ?auto_16912 ?auto_16928 ) ) ( not ( = ?auto_16912 ?auto_16919 ) ) ( not ( = ?auto_16912 ?auto_16904 ) ) ( not ( = ?auto_16912 ?auto_16924 ) ) ( not ( = ?auto_16912 ?auto_16926 ) ) ( not ( = ?auto_16912 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16893 ) ) ( not ( = ?auto_16884 ?auto_16911 ) ) ( not ( = ?auto_16885 ?auto_16893 ) ) ( not ( = ?auto_16885 ?auto_16911 ) ) ( not ( = ?auto_16886 ?auto_16893 ) ) ( not ( = ?auto_16886 ?auto_16911 ) ) ( not ( = ?auto_16887 ?auto_16893 ) ) ( not ( = ?auto_16887 ?auto_16911 ) ) ( not ( = ?auto_16888 ?auto_16893 ) ) ( not ( = ?auto_16888 ?auto_16911 ) ) ( not ( = ?auto_16889 ?auto_16893 ) ) ( not ( = ?auto_16889 ?auto_16911 ) ) ( not ( = ?auto_16890 ?auto_16893 ) ) ( not ( = ?auto_16890 ?auto_16911 ) ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16911 ) ) ( not ( = ?auto_16893 ?auto_16912 ) ) ( not ( = ?auto_16893 ?auto_16930 ) ) ( not ( = ?auto_16893 ?auto_16928 ) ) ( not ( = ?auto_16893 ?auto_16919 ) ) ( not ( = ?auto_16893 ?auto_16904 ) ) ( not ( = ?auto_16893 ?auto_16924 ) ) ( not ( = ?auto_16893 ?auto_16926 ) ) ( not ( = ?auto_16893 ?auto_16906 ) ) ( not ( = ?auto_16927 ?auto_16907 ) ) ( not ( = ?auto_16927 ?auto_16921 ) ) ( not ( = ?auto_16927 ?auto_16929 ) ) ( not ( = ?auto_16927 ?auto_16925 ) ) ( not ( = ?auto_16927 ?auto_16910 ) ) ( not ( = ?auto_16927 ?auto_16931 ) ) ( not ( = ?auto_16927 ?auto_16916 ) ) ( not ( = ?auto_16927 ?auto_16917 ) ) ( not ( = ?auto_16903 ?auto_16908 ) ) ( not ( = ?auto_16903 ?auto_16914 ) ) ( not ( = ?auto_16903 ?auto_16918 ) ) ( not ( = ?auto_16903 ?auto_16909 ) ) ( not ( = ?auto_16903 ?auto_16915 ) ) ( not ( = ?auto_16903 ?auto_16905 ) ) ( not ( = ?auto_16903 ?auto_16913 ) ) ( not ( = ?auto_16903 ?auto_16922 ) ) ( not ( = ?auto_16911 ?auto_16912 ) ) ( not ( = ?auto_16911 ?auto_16930 ) ) ( not ( = ?auto_16911 ?auto_16928 ) ) ( not ( = ?auto_16911 ?auto_16919 ) ) ( not ( = ?auto_16911 ?auto_16904 ) ) ( not ( = ?auto_16911 ?auto_16924 ) ) ( not ( = ?auto_16911 ?auto_16926 ) ) ( not ( = ?auto_16911 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16894 ) ) ( not ( = ?auto_16884 ?auto_16920 ) ) ( not ( = ?auto_16885 ?auto_16894 ) ) ( not ( = ?auto_16885 ?auto_16920 ) ) ( not ( = ?auto_16886 ?auto_16894 ) ) ( not ( = ?auto_16886 ?auto_16920 ) ) ( not ( = ?auto_16887 ?auto_16894 ) ) ( not ( = ?auto_16887 ?auto_16920 ) ) ( not ( = ?auto_16888 ?auto_16894 ) ) ( not ( = ?auto_16888 ?auto_16920 ) ) ( not ( = ?auto_16889 ?auto_16894 ) ) ( not ( = ?auto_16889 ?auto_16920 ) ) ( not ( = ?auto_16890 ?auto_16894 ) ) ( not ( = ?auto_16890 ?auto_16920 ) ) ( not ( = ?auto_16891 ?auto_16894 ) ) ( not ( = ?auto_16891 ?auto_16920 ) ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16920 ) ) ( not ( = ?auto_16894 ?auto_16911 ) ) ( not ( = ?auto_16894 ?auto_16912 ) ) ( not ( = ?auto_16894 ?auto_16930 ) ) ( not ( = ?auto_16894 ?auto_16928 ) ) ( not ( = ?auto_16894 ?auto_16919 ) ) ( not ( = ?auto_16894 ?auto_16904 ) ) ( not ( = ?auto_16894 ?auto_16924 ) ) ( not ( = ?auto_16894 ?auto_16926 ) ) ( not ( = ?auto_16894 ?auto_16906 ) ) ( not ( = ?auto_16920 ?auto_16911 ) ) ( not ( = ?auto_16920 ?auto_16912 ) ) ( not ( = ?auto_16920 ?auto_16930 ) ) ( not ( = ?auto_16920 ?auto_16928 ) ) ( not ( = ?auto_16920 ?auto_16919 ) ) ( not ( = ?auto_16920 ?auto_16904 ) ) ( not ( = ?auto_16920 ?auto_16924 ) ) ( not ( = ?auto_16920 ?auto_16926 ) ) ( not ( = ?auto_16920 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16895 ) ) ( not ( = ?auto_16884 ?auto_16923 ) ) ( not ( = ?auto_16885 ?auto_16895 ) ) ( not ( = ?auto_16885 ?auto_16923 ) ) ( not ( = ?auto_16886 ?auto_16895 ) ) ( not ( = ?auto_16886 ?auto_16923 ) ) ( not ( = ?auto_16887 ?auto_16895 ) ) ( not ( = ?auto_16887 ?auto_16923 ) ) ( not ( = ?auto_16888 ?auto_16895 ) ) ( not ( = ?auto_16888 ?auto_16923 ) ) ( not ( = ?auto_16889 ?auto_16895 ) ) ( not ( = ?auto_16889 ?auto_16923 ) ) ( not ( = ?auto_16890 ?auto_16895 ) ) ( not ( = ?auto_16890 ?auto_16923 ) ) ( not ( = ?auto_16891 ?auto_16895 ) ) ( not ( = ?auto_16891 ?auto_16923 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16892 ?auto_16923 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16923 ) ) ( not ( = ?auto_16895 ?auto_16920 ) ) ( not ( = ?auto_16895 ?auto_16911 ) ) ( not ( = ?auto_16895 ?auto_16912 ) ) ( not ( = ?auto_16895 ?auto_16930 ) ) ( not ( = ?auto_16895 ?auto_16928 ) ) ( not ( = ?auto_16895 ?auto_16919 ) ) ( not ( = ?auto_16895 ?auto_16904 ) ) ( not ( = ?auto_16895 ?auto_16924 ) ) ( not ( = ?auto_16895 ?auto_16926 ) ) ( not ( = ?auto_16895 ?auto_16906 ) ) ( not ( = ?auto_16898 ?auto_16927 ) ) ( not ( = ?auto_16898 ?auto_16907 ) ) ( not ( = ?auto_16898 ?auto_16921 ) ) ( not ( = ?auto_16898 ?auto_16929 ) ) ( not ( = ?auto_16898 ?auto_16925 ) ) ( not ( = ?auto_16898 ?auto_16910 ) ) ( not ( = ?auto_16898 ?auto_16931 ) ) ( not ( = ?auto_16898 ?auto_16916 ) ) ( not ( = ?auto_16898 ?auto_16917 ) ) ( not ( = ?auto_16901 ?auto_16903 ) ) ( not ( = ?auto_16901 ?auto_16908 ) ) ( not ( = ?auto_16901 ?auto_16914 ) ) ( not ( = ?auto_16901 ?auto_16918 ) ) ( not ( = ?auto_16901 ?auto_16909 ) ) ( not ( = ?auto_16901 ?auto_16915 ) ) ( not ( = ?auto_16901 ?auto_16905 ) ) ( not ( = ?auto_16901 ?auto_16913 ) ) ( not ( = ?auto_16901 ?auto_16922 ) ) ( not ( = ?auto_16923 ?auto_16920 ) ) ( not ( = ?auto_16923 ?auto_16911 ) ) ( not ( = ?auto_16923 ?auto_16912 ) ) ( not ( = ?auto_16923 ?auto_16930 ) ) ( not ( = ?auto_16923 ?auto_16928 ) ) ( not ( = ?auto_16923 ?auto_16919 ) ) ( not ( = ?auto_16923 ?auto_16904 ) ) ( not ( = ?auto_16923 ?auto_16924 ) ) ( not ( = ?auto_16923 ?auto_16926 ) ) ( not ( = ?auto_16923 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16896 ) ) ( not ( = ?auto_16884 ?auto_16900 ) ) ( not ( = ?auto_16885 ?auto_16896 ) ) ( not ( = ?auto_16885 ?auto_16900 ) ) ( not ( = ?auto_16886 ?auto_16896 ) ) ( not ( = ?auto_16886 ?auto_16900 ) ) ( not ( = ?auto_16887 ?auto_16896 ) ) ( not ( = ?auto_16887 ?auto_16900 ) ) ( not ( = ?auto_16888 ?auto_16896 ) ) ( not ( = ?auto_16888 ?auto_16900 ) ) ( not ( = ?auto_16889 ?auto_16896 ) ) ( not ( = ?auto_16889 ?auto_16900 ) ) ( not ( = ?auto_16890 ?auto_16896 ) ) ( not ( = ?auto_16890 ?auto_16900 ) ) ( not ( = ?auto_16891 ?auto_16896 ) ) ( not ( = ?auto_16891 ?auto_16900 ) ) ( not ( = ?auto_16892 ?auto_16896 ) ) ( not ( = ?auto_16892 ?auto_16900 ) ) ( not ( = ?auto_16893 ?auto_16896 ) ) ( not ( = ?auto_16893 ?auto_16900 ) ) ( not ( = ?auto_16894 ?auto_16896 ) ) ( not ( = ?auto_16894 ?auto_16900 ) ) ( not ( = ?auto_16896 ?auto_16923 ) ) ( not ( = ?auto_16896 ?auto_16920 ) ) ( not ( = ?auto_16896 ?auto_16911 ) ) ( not ( = ?auto_16896 ?auto_16912 ) ) ( not ( = ?auto_16896 ?auto_16930 ) ) ( not ( = ?auto_16896 ?auto_16928 ) ) ( not ( = ?auto_16896 ?auto_16919 ) ) ( not ( = ?auto_16896 ?auto_16904 ) ) ( not ( = ?auto_16896 ?auto_16924 ) ) ( not ( = ?auto_16896 ?auto_16926 ) ) ( not ( = ?auto_16896 ?auto_16906 ) ) ( not ( = ?auto_16900 ?auto_16923 ) ) ( not ( = ?auto_16900 ?auto_16920 ) ) ( not ( = ?auto_16900 ?auto_16911 ) ) ( not ( = ?auto_16900 ?auto_16912 ) ) ( not ( = ?auto_16900 ?auto_16930 ) ) ( not ( = ?auto_16900 ?auto_16928 ) ) ( not ( = ?auto_16900 ?auto_16919 ) ) ( not ( = ?auto_16900 ?auto_16904 ) ) ( not ( = ?auto_16900 ?auto_16924 ) ) ( not ( = ?auto_16900 ?auto_16926 ) ) ( not ( = ?auto_16900 ?auto_16906 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16884 ?auto_16885 ?auto_16886 ?auto_16887 ?auto_16888 ?auto_16889 ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16895 )
      ( MAKE-1CRATE ?auto_16895 ?auto_16896 )
      ( MAKE-12CRATE-VERIFY ?auto_16884 ?auto_16885 ?auto_16886 ?auto_16887 ?auto_16888 ?auto_16889 ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16895 ?auto_16896 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_16956 - SURFACE
      ?auto_16957 - SURFACE
      ?auto_16958 - SURFACE
      ?auto_16959 - SURFACE
      ?auto_16960 - SURFACE
      ?auto_16961 - SURFACE
      ?auto_16962 - SURFACE
      ?auto_16963 - SURFACE
      ?auto_16964 - SURFACE
      ?auto_16965 - SURFACE
      ?auto_16966 - SURFACE
      ?auto_16967 - SURFACE
      ?auto_16968 - SURFACE
      ?auto_16969 - SURFACE
    )
    :vars
    (
      ?auto_16974 - HOIST
      ?auto_16970 - PLACE
      ?auto_16971 - PLACE
      ?auto_16975 - HOIST
      ?auto_16973 - SURFACE
      ?auto_17001 - PLACE
      ?auto_16996 - HOIST
      ?auto_16984 - SURFACE
      ?auto_16992 - SURFACE
      ?auto_16988 - PLACE
      ?auto_16994 - HOIST
      ?auto_16979 - SURFACE
      ?auto_16982 - SURFACE
      ?auto_16983 - PLACE
      ?auto_16989 - HOIST
      ?auto_16991 - SURFACE
      ?auto_16995 - PLACE
      ?auto_17006 - HOIST
      ?auto_17004 - SURFACE
      ?auto_17000 - PLACE
      ?auto_16987 - HOIST
      ?auto_16981 - SURFACE
      ?auto_16999 - PLACE
      ?auto_16980 - HOIST
      ?auto_16993 - SURFACE
      ?auto_16976 - PLACE
      ?auto_16978 - HOIST
      ?auto_17007 - SURFACE
      ?auto_16977 - PLACE
      ?auto_16990 - HOIST
      ?auto_16985 - SURFACE
      ?auto_16997 - PLACE
      ?auto_17005 - HOIST
      ?auto_17002 - SURFACE
      ?auto_16998 - PLACE
      ?auto_16986 - HOIST
      ?auto_17003 - SURFACE
      ?auto_16972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16974 ?auto_16970 ) ( IS-CRATE ?auto_16969 ) ( not ( = ?auto_16971 ?auto_16970 ) ) ( HOIST-AT ?auto_16975 ?auto_16971 ) ( AVAILABLE ?auto_16975 ) ( SURFACE-AT ?auto_16969 ?auto_16971 ) ( ON ?auto_16969 ?auto_16973 ) ( CLEAR ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16969 ) ) ( not ( = ?auto_16968 ?auto_16973 ) ) ( not ( = ?auto_16969 ?auto_16973 ) ) ( not ( = ?auto_16974 ?auto_16975 ) ) ( IS-CRATE ?auto_16968 ) ( not ( = ?auto_17001 ?auto_16970 ) ) ( HOIST-AT ?auto_16996 ?auto_17001 ) ( SURFACE-AT ?auto_16968 ?auto_17001 ) ( ON ?auto_16968 ?auto_16984 ) ( CLEAR ?auto_16968 ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16984 ) ) ( not ( = ?auto_16968 ?auto_16984 ) ) ( not ( = ?auto_16974 ?auto_16996 ) ) ( IS-CRATE ?auto_16967 ) ( AVAILABLE ?auto_16996 ) ( SURFACE-AT ?auto_16967 ?auto_17001 ) ( ON ?auto_16967 ?auto_16992 ) ( CLEAR ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16967 ) ) ( not ( = ?auto_16966 ?auto_16992 ) ) ( not ( = ?auto_16967 ?auto_16992 ) ) ( IS-CRATE ?auto_16966 ) ( not ( = ?auto_16988 ?auto_16970 ) ) ( HOIST-AT ?auto_16994 ?auto_16988 ) ( SURFACE-AT ?auto_16966 ?auto_16988 ) ( ON ?auto_16966 ?auto_16979 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16965 ?auto_16966 ) ) ( not ( = ?auto_16965 ?auto_16979 ) ) ( not ( = ?auto_16966 ?auto_16979 ) ) ( not ( = ?auto_16974 ?auto_16994 ) ) ( IS-CRATE ?auto_16965 ) ( AVAILABLE ?auto_16994 ) ( SURFACE-AT ?auto_16965 ?auto_16988 ) ( ON ?auto_16965 ?auto_16982 ) ( CLEAR ?auto_16965 ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16982 ) ) ( not ( = ?auto_16965 ?auto_16982 ) ) ( IS-CRATE ?auto_16964 ) ( not ( = ?auto_16983 ?auto_16970 ) ) ( HOIST-AT ?auto_16989 ?auto_16983 ) ( AVAILABLE ?auto_16989 ) ( SURFACE-AT ?auto_16964 ?auto_16983 ) ( ON ?auto_16964 ?auto_16991 ) ( CLEAR ?auto_16964 ) ( not ( = ?auto_16963 ?auto_16964 ) ) ( not ( = ?auto_16963 ?auto_16991 ) ) ( not ( = ?auto_16964 ?auto_16991 ) ) ( not ( = ?auto_16974 ?auto_16989 ) ) ( IS-CRATE ?auto_16963 ) ( not ( = ?auto_16995 ?auto_16970 ) ) ( HOIST-AT ?auto_17006 ?auto_16995 ) ( AVAILABLE ?auto_17006 ) ( SURFACE-AT ?auto_16963 ?auto_16995 ) ( ON ?auto_16963 ?auto_17004 ) ( CLEAR ?auto_16963 ) ( not ( = ?auto_16962 ?auto_16963 ) ) ( not ( = ?auto_16962 ?auto_17004 ) ) ( not ( = ?auto_16963 ?auto_17004 ) ) ( not ( = ?auto_16974 ?auto_17006 ) ) ( IS-CRATE ?auto_16962 ) ( not ( = ?auto_17000 ?auto_16970 ) ) ( HOIST-AT ?auto_16987 ?auto_17000 ) ( AVAILABLE ?auto_16987 ) ( SURFACE-AT ?auto_16962 ?auto_17000 ) ( ON ?auto_16962 ?auto_16981 ) ( CLEAR ?auto_16962 ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( not ( = ?auto_16961 ?auto_16981 ) ) ( not ( = ?auto_16962 ?auto_16981 ) ) ( not ( = ?auto_16974 ?auto_16987 ) ) ( IS-CRATE ?auto_16961 ) ( not ( = ?auto_16999 ?auto_16970 ) ) ( HOIST-AT ?auto_16980 ?auto_16999 ) ( AVAILABLE ?auto_16980 ) ( SURFACE-AT ?auto_16961 ?auto_16999 ) ( ON ?auto_16961 ?auto_16993 ) ( CLEAR ?auto_16961 ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16993 ) ) ( not ( = ?auto_16961 ?auto_16993 ) ) ( not ( = ?auto_16974 ?auto_16980 ) ) ( IS-CRATE ?auto_16960 ) ( not ( = ?auto_16976 ?auto_16970 ) ) ( HOIST-AT ?auto_16978 ?auto_16976 ) ( AVAILABLE ?auto_16978 ) ( SURFACE-AT ?auto_16960 ?auto_16976 ) ( ON ?auto_16960 ?auto_17007 ) ( CLEAR ?auto_16960 ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_17007 ) ) ( not ( = ?auto_16960 ?auto_17007 ) ) ( not ( = ?auto_16974 ?auto_16978 ) ) ( IS-CRATE ?auto_16959 ) ( not ( = ?auto_16977 ?auto_16970 ) ) ( HOIST-AT ?auto_16990 ?auto_16977 ) ( AVAILABLE ?auto_16990 ) ( SURFACE-AT ?auto_16959 ?auto_16977 ) ( ON ?auto_16959 ?auto_16985 ) ( CLEAR ?auto_16959 ) ( not ( = ?auto_16958 ?auto_16959 ) ) ( not ( = ?auto_16958 ?auto_16985 ) ) ( not ( = ?auto_16959 ?auto_16985 ) ) ( not ( = ?auto_16974 ?auto_16990 ) ) ( IS-CRATE ?auto_16958 ) ( not ( = ?auto_16997 ?auto_16970 ) ) ( HOIST-AT ?auto_17005 ?auto_16997 ) ( AVAILABLE ?auto_17005 ) ( SURFACE-AT ?auto_16958 ?auto_16997 ) ( ON ?auto_16958 ?auto_17002 ) ( CLEAR ?auto_16958 ) ( not ( = ?auto_16957 ?auto_16958 ) ) ( not ( = ?auto_16957 ?auto_17002 ) ) ( not ( = ?auto_16958 ?auto_17002 ) ) ( not ( = ?auto_16974 ?auto_17005 ) ) ( SURFACE-AT ?auto_16956 ?auto_16970 ) ( CLEAR ?auto_16956 ) ( IS-CRATE ?auto_16957 ) ( AVAILABLE ?auto_16974 ) ( not ( = ?auto_16998 ?auto_16970 ) ) ( HOIST-AT ?auto_16986 ?auto_16998 ) ( AVAILABLE ?auto_16986 ) ( SURFACE-AT ?auto_16957 ?auto_16998 ) ( ON ?auto_16957 ?auto_17003 ) ( CLEAR ?auto_16957 ) ( TRUCK-AT ?auto_16972 ?auto_16970 ) ( not ( = ?auto_16956 ?auto_16957 ) ) ( not ( = ?auto_16956 ?auto_17003 ) ) ( not ( = ?auto_16957 ?auto_17003 ) ) ( not ( = ?auto_16974 ?auto_16986 ) ) ( not ( = ?auto_16956 ?auto_16958 ) ) ( not ( = ?auto_16956 ?auto_17002 ) ) ( not ( = ?auto_16958 ?auto_17003 ) ) ( not ( = ?auto_16997 ?auto_16998 ) ) ( not ( = ?auto_17005 ?auto_16986 ) ) ( not ( = ?auto_17002 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16985 ) ) ( not ( = ?auto_16957 ?auto_16959 ) ) ( not ( = ?auto_16957 ?auto_16985 ) ) ( not ( = ?auto_16959 ?auto_17002 ) ) ( not ( = ?auto_16959 ?auto_17003 ) ) ( not ( = ?auto_16977 ?auto_16997 ) ) ( not ( = ?auto_16977 ?auto_16998 ) ) ( not ( = ?auto_16990 ?auto_17005 ) ) ( not ( = ?auto_16990 ?auto_16986 ) ) ( not ( = ?auto_16985 ?auto_17002 ) ) ( not ( = ?auto_16985 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16960 ) ) ( not ( = ?auto_16956 ?auto_17007 ) ) ( not ( = ?auto_16957 ?auto_16960 ) ) ( not ( = ?auto_16957 ?auto_17007 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( not ( = ?auto_16958 ?auto_17007 ) ) ( not ( = ?auto_16960 ?auto_16985 ) ) ( not ( = ?auto_16960 ?auto_17002 ) ) ( not ( = ?auto_16960 ?auto_17003 ) ) ( not ( = ?auto_16976 ?auto_16977 ) ) ( not ( = ?auto_16976 ?auto_16997 ) ) ( not ( = ?auto_16976 ?auto_16998 ) ) ( not ( = ?auto_16978 ?auto_16990 ) ) ( not ( = ?auto_16978 ?auto_17005 ) ) ( not ( = ?auto_16978 ?auto_16986 ) ) ( not ( = ?auto_17007 ?auto_16985 ) ) ( not ( = ?auto_17007 ?auto_17002 ) ) ( not ( = ?auto_17007 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16961 ) ) ( not ( = ?auto_16956 ?auto_16993 ) ) ( not ( = ?auto_16957 ?auto_16961 ) ) ( not ( = ?auto_16957 ?auto_16993 ) ) ( not ( = ?auto_16958 ?auto_16961 ) ) ( not ( = ?auto_16958 ?auto_16993 ) ) ( not ( = ?auto_16959 ?auto_16961 ) ) ( not ( = ?auto_16959 ?auto_16993 ) ) ( not ( = ?auto_16961 ?auto_17007 ) ) ( not ( = ?auto_16961 ?auto_16985 ) ) ( not ( = ?auto_16961 ?auto_17002 ) ) ( not ( = ?auto_16961 ?auto_17003 ) ) ( not ( = ?auto_16999 ?auto_16976 ) ) ( not ( = ?auto_16999 ?auto_16977 ) ) ( not ( = ?auto_16999 ?auto_16997 ) ) ( not ( = ?auto_16999 ?auto_16998 ) ) ( not ( = ?auto_16980 ?auto_16978 ) ) ( not ( = ?auto_16980 ?auto_16990 ) ) ( not ( = ?auto_16980 ?auto_17005 ) ) ( not ( = ?auto_16980 ?auto_16986 ) ) ( not ( = ?auto_16993 ?auto_17007 ) ) ( not ( = ?auto_16993 ?auto_16985 ) ) ( not ( = ?auto_16993 ?auto_17002 ) ) ( not ( = ?auto_16993 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16962 ) ) ( not ( = ?auto_16956 ?auto_16981 ) ) ( not ( = ?auto_16957 ?auto_16962 ) ) ( not ( = ?auto_16957 ?auto_16981 ) ) ( not ( = ?auto_16958 ?auto_16962 ) ) ( not ( = ?auto_16958 ?auto_16981 ) ) ( not ( = ?auto_16959 ?auto_16962 ) ) ( not ( = ?auto_16959 ?auto_16981 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_16981 ) ) ( not ( = ?auto_16962 ?auto_16993 ) ) ( not ( = ?auto_16962 ?auto_17007 ) ) ( not ( = ?auto_16962 ?auto_16985 ) ) ( not ( = ?auto_16962 ?auto_17002 ) ) ( not ( = ?auto_16962 ?auto_17003 ) ) ( not ( = ?auto_17000 ?auto_16999 ) ) ( not ( = ?auto_17000 ?auto_16976 ) ) ( not ( = ?auto_17000 ?auto_16977 ) ) ( not ( = ?auto_17000 ?auto_16997 ) ) ( not ( = ?auto_17000 ?auto_16998 ) ) ( not ( = ?auto_16987 ?auto_16980 ) ) ( not ( = ?auto_16987 ?auto_16978 ) ) ( not ( = ?auto_16987 ?auto_16990 ) ) ( not ( = ?auto_16987 ?auto_17005 ) ) ( not ( = ?auto_16987 ?auto_16986 ) ) ( not ( = ?auto_16981 ?auto_16993 ) ) ( not ( = ?auto_16981 ?auto_17007 ) ) ( not ( = ?auto_16981 ?auto_16985 ) ) ( not ( = ?auto_16981 ?auto_17002 ) ) ( not ( = ?auto_16981 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16963 ) ) ( not ( = ?auto_16956 ?auto_17004 ) ) ( not ( = ?auto_16957 ?auto_16963 ) ) ( not ( = ?auto_16957 ?auto_17004 ) ) ( not ( = ?auto_16958 ?auto_16963 ) ) ( not ( = ?auto_16958 ?auto_17004 ) ) ( not ( = ?auto_16959 ?auto_16963 ) ) ( not ( = ?auto_16959 ?auto_17004 ) ) ( not ( = ?auto_16960 ?auto_16963 ) ) ( not ( = ?auto_16960 ?auto_17004 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_17004 ) ) ( not ( = ?auto_16963 ?auto_16981 ) ) ( not ( = ?auto_16963 ?auto_16993 ) ) ( not ( = ?auto_16963 ?auto_17007 ) ) ( not ( = ?auto_16963 ?auto_16985 ) ) ( not ( = ?auto_16963 ?auto_17002 ) ) ( not ( = ?auto_16963 ?auto_17003 ) ) ( not ( = ?auto_16995 ?auto_17000 ) ) ( not ( = ?auto_16995 ?auto_16999 ) ) ( not ( = ?auto_16995 ?auto_16976 ) ) ( not ( = ?auto_16995 ?auto_16977 ) ) ( not ( = ?auto_16995 ?auto_16997 ) ) ( not ( = ?auto_16995 ?auto_16998 ) ) ( not ( = ?auto_17006 ?auto_16987 ) ) ( not ( = ?auto_17006 ?auto_16980 ) ) ( not ( = ?auto_17006 ?auto_16978 ) ) ( not ( = ?auto_17006 ?auto_16990 ) ) ( not ( = ?auto_17006 ?auto_17005 ) ) ( not ( = ?auto_17006 ?auto_16986 ) ) ( not ( = ?auto_17004 ?auto_16981 ) ) ( not ( = ?auto_17004 ?auto_16993 ) ) ( not ( = ?auto_17004 ?auto_17007 ) ) ( not ( = ?auto_17004 ?auto_16985 ) ) ( not ( = ?auto_17004 ?auto_17002 ) ) ( not ( = ?auto_17004 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16964 ) ) ( not ( = ?auto_16956 ?auto_16991 ) ) ( not ( = ?auto_16957 ?auto_16964 ) ) ( not ( = ?auto_16957 ?auto_16991 ) ) ( not ( = ?auto_16958 ?auto_16964 ) ) ( not ( = ?auto_16958 ?auto_16991 ) ) ( not ( = ?auto_16959 ?auto_16964 ) ) ( not ( = ?auto_16959 ?auto_16991 ) ) ( not ( = ?auto_16960 ?auto_16964 ) ) ( not ( = ?auto_16960 ?auto_16991 ) ) ( not ( = ?auto_16961 ?auto_16964 ) ) ( not ( = ?auto_16961 ?auto_16991 ) ) ( not ( = ?auto_16962 ?auto_16964 ) ) ( not ( = ?auto_16962 ?auto_16991 ) ) ( not ( = ?auto_16964 ?auto_17004 ) ) ( not ( = ?auto_16964 ?auto_16981 ) ) ( not ( = ?auto_16964 ?auto_16993 ) ) ( not ( = ?auto_16964 ?auto_17007 ) ) ( not ( = ?auto_16964 ?auto_16985 ) ) ( not ( = ?auto_16964 ?auto_17002 ) ) ( not ( = ?auto_16964 ?auto_17003 ) ) ( not ( = ?auto_16983 ?auto_16995 ) ) ( not ( = ?auto_16983 ?auto_17000 ) ) ( not ( = ?auto_16983 ?auto_16999 ) ) ( not ( = ?auto_16983 ?auto_16976 ) ) ( not ( = ?auto_16983 ?auto_16977 ) ) ( not ( = ?auto_16983 ?auto_16997 ) ) ( not ( = ?auto_16983 ?auto_16998 ) ) ( not ( = ?auto_16989 ?auto_17006 ) ) ( not ( = ?auto_16989 ?auto_16987 ) ) ( not ( = ?auto_16989 ?auto_16980 ) ) ( not ( = ?auto_16989 ?auto_16978 ) ) ( not ( = ?auto_16989 ?auto_16990 ) ) ( not ( = ?auto_16989 ?auto_17005 ) ) ( not ( = ?auto_16989 ?auto_16986 ) ) ( not ( = ?auto_16991 ?auto_17004 ) ) ( not ( = ?auto_16991 ?auto_16981 ) ) ( not ( = ?auto_16991 ?auto_16993 ) ) ( not ( = ?auto_16991 ?auto_17007 ) ) ( not ( = ?auto_16991 ?auto_16985 ) ) ( not ( = ?auto_16991 ?auto_17002 ) ) ( not ( = ?auto_16991 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16965 ) ) ( not ( = ?auto_16956 ?auto_16982 ) ) ( not ( = ?auto_16957 ?auto_16965 ) ) ( not ( = ?auto_16957 ?auto_16982 ) ) ( not ( = ?auto_16958 ?auto_16965 ) ) ( not ( = ?auto_16958 ?auto_16982 ) ) ( not ( = ?auto_16959 ?auto_16965 ) ) ( not ( = ?auto_16959 ?auto_16982 ) ) ( not ( = ?auto_16960 ?auto_16965 ) ) ( not ( = ?auto_16960 ?auto_16982 ) ) ( not ( = ?auto_16961 ?auto_16965 ) ) ( not ( = ?auto_16961 ?auto_16982 ) ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16982 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16982 ) ) ( not ( = ?auto_16965 ?auto_16991 ) ) ( not ( = ?auto_16965 ?auto_17004 ) ) ( not ( = ?auto_16965 ?auto_16981 ) ) ( not ( = ?auto_16965 ?auto_16993 ) ) ( not ( = ?auto_16965 ?auto_17007 ) ) ( not ( = ?auto_16965 ?auto_16985 ) ) ( not ( = ?auto_16965 ?auto_17002 ) ) ( not ( = ?auto_16965 ?auto_17003 ) ) ( not ( = ?auto_16988 ?auto_16983 ) ) ( not ( = ?auto_16988 ?auto_16995 ) ) ( not ( = ?auto_16988 ?auto_17000 ) ) ( not ( = ?auto_16988 ?auto_16999 ) ) ( not ( = ?auto_16988 ?auto_16976 ) ) ( not ( = ?auto_16988 ?auto_16977 ) ) ( not ( = ?auto_16988 ?auto_16997 ) ) ( not ( = ?auto_16988 ?auto_16998 ) ) ( not ( = ?auto_16994 ?auto_16989 ) ) ( not ( = ?auto_16994 ?auto_17006 ) ) ( not ( = ?auto_16994 ?auto_16987 ) ) ( not ( = ?auto_16994 ?auto_16980 ) ) ( not ( = ?auto_16994 ?auto_16978 ) ) ( not ( = ?auto_16994 ?auto_16990 ) ) ( not ( = ?auto_16994 ?auto_17005 ) ) ( not ( = ?auto_16994 ?auto_16986 ) ) ( not ( = ?auto_16982 ?auto_16991 ) ) ( not ( = ?auto_16982 ?auto_17004 ) ) ( not ( = ?auto_16982 ?auto_16981 ) ) ( not ( = ?auto_16982 ?auto_16993 ) ) ( not ( = ?auto_16982 ?auto_17007 ) ) ( not ( = ?auto_16982 ?auto_16985 ) ) ( not ( = ?auto_16982 ?auto_17002 ) ) ( not ( = ?auto_16982 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16966 ) ) ( not ( = ?auto_16956 ?auto_16979 ) ) ( not ( = ?auto_16957 ?auto_16966 ) ) ( not ( = ?auto_16957 ?auto_16979 ) ) ( not ( = ?auto_16958 ?auto_16966 ) ) ( not ( = ?auto_16958 ?auto_16979 ) ) ( not ( = ?auto_16959 ?auto_16966 ) ) ( not ( = ?auto_16959 ?auto_16979 ) ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( not ( = ?auto_16960 ?auto_16979 ) ) ( not ( = ?auto_16961 ?auto_16966 ) ) ( not ( = ?auto_16961 ?auto_16979 ) ) ( not ( = ?auto_16962 ?auto_16966 ) ) ( not ( = ?auto_16962 ?auto_16979 ) ) ( not ( = ?auto_16963 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_16979 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16964 ?auto_16979 ) ) ( not ( = ?auto_16966 ?auto_16982 ) ) ( not ( = ?auto_16966 ?auto_16991 ) ) ( not ( = ?auto_16966 ?auto_17004 ) ) ( not ( = ?auto_16966 ?auto_16981 ) ) ( not ( = ?auto_16966 ?auto_16993 ) ) ( not ( = ?auto_16966 ?auto_17007 ) ) ( not ( = ?auto_16966 ?auto_16985 ) ) ( not ( = ?auto_16966 ?auto_17002 ) ) ( not ( = ?auto_16966 ?auto_17003 ) ) ( not ( = ?auto_16979 ?auto_16982 ) ) ( not ( = ?auto_16979 ?auto_16991 ) ) ( not ( = ?auto_16979 ?auto_17004 ) ) ( not ( = ?auto_16979 ?auto_16981 ) ) ( not ( = ?auto_16979 ?auto_16993 ) ) ( not ( = ?auto_16979 ?auto_17007 ) ) ( not ( = ?auto_16979 ?auto_16985 ) ) ( not ( = ?auto_16979 ?auto_17002 ) ) ( not ( = ?auto_16979 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16967 ) ) ( not ( = ?auto_16956 ?auto_16992 ) ) ( not ( = ?auto_16957 ?auto_16967 ) ) ( not ( = ?auto_16957 ?auto_16992 ) ) ( not ( = ?auto_16958 ?auto_16967 ) ) ( not ( = ?auto_16958 ?auto_16992 ) ) ( not ( = ?auto_16959 ?auto_16967 ) ) ( not ( = ?auto_16959 ?auto_16992 ) ) ( not ( = ?auto_16960 ?auto_16967 ) ) ( not ( = ?auto_16960 ?auto_16992 ) ) ( not ( = ?auto_16961 ?auto_16967 ) ) ( not ( = ?auto_16961 ?auto_16992 ) ) ( not ( = ?auto_16962 ?auto_16967 ) ) ( not ( = ?auto_16962 ?auto_16992 ) ) ( not ( = ?auto_16963 ?auto_16967 ) ) ( not ( = ?auto_16963 ?auto_16992 ) ) ( not ( = ?auto_16964 ?auto_16967 ) ) ( not ( = ?auto_16964 ?auto_16992 ) ) ( not ( = ?auto_16965 ?auto_16967 ) ) ( not ( = ?auto_16965 ?auto_16992 ) ) ( not ( = ?auto_16967 ?auto_16979 ) ) ( not ( = ?auto_16967 ?auto_16982 ) ) ( not ( = ?auto_16967 ?auto_16991 ) ) ( not ( = ?auto_16967 ?auto_17004 ) ) ( not ( = ?auto_16967 ?auto_16981 ) ) ( not ( = ?auto_16967 ?auto_16993 ) ) ( not ( = ?auto_16967 ?auto_17007 ) ) ( not ( = ?auto_16967 ?auto_16985 ) ) ( not ( = ?auto_16967 ?auto_17002 ) ) ( not ( = ?auto_16967 ?auto_17003 ) ) ( not ( = ?auto_17001 ?auto_16988 ) ) ( not ( = ?auto_17001 ?auto_16983 ) ) ( not ( = ?auto_17001 ?auto_16995 ) ) ( not ( = ?auto_17001 ?auto_17000 ) ) ( not ( = ?auto_17001 ?auto_16999 ) ) ( not ( = ?auto_17001 ?auto_16976 ) ) ( not ( = ?auto_17001 ?auto_16977 ) ) ( not ( = ?auto_17001 ?auto_16997 ) ) ( not ( = ?auto_17001 ?auto_16998 ) ) ( not ( = ?auto_16996 ?auto_16994 ) ) ( not ( = ?auto_16996 ?auto_16989 ) ) ( not ( = ?auto_16996 ?auto_17006 ) ) ( not ( = ?auto_16996 ?auto_16987 ) ) ( not ( = ?auto_16996 ?auto_16980 ) ) ( not ( = ?auto_16996 ?auto_16978 ) ) ( not ( = ?auto_16996 ?auto_16990 ) ) ( not ( = ?auto_16996 ?auto_17005 ) ) ( not ( = ?auto_16996 ?auto_16986 ) ) ( not ( = ?auto_16992 ?auto_16979 ) ) ( not ( = ?auto_16992 ?auto_16982 ) ) ( not ( = ?auto_16992 ?auto_16991 ) ) ( not ( = ?auto_16992 ?auto_17004 ) ) ( not ( = ?auto_16992 ?auto_16981 ) ) ( not ( = ?auto_16992 ?auto_16993 ) ) ( not ( = ?auto_16992 ?auto_17007 ) ) ( not ( = ?auto_16992 ?auto_16985 ) ) ( not ( = ?auto_16992 ?auto_17002 ) ) ( not ( = ?auto_16992 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16968 ) ) ( not ( = ?auto_16956 ?auto_16984 ) ) ( not ( = ?auto_16957 ?auto_16968 ) ) ( not ( = ?auto_16957 ?auto_16984 ) ) ( not ( = ?auto_16958 ?auto_16968 ) ) ( not ( = ?auto_16958 ?auto_16984 ) ) ( not ( = ?auto_16959 ?auto_16968 ) ) ( not ( = ?auto_16959 ?auto_16984 ) ) ( not ( = ?auto_16960 ?auto_16968 ) ) ( not ( = ?auto_16960 ?auto_16984 ) ) ( not ( = ?auto_16961 ?auto_16968 ) ) ( not ( = ?auto_16961 ?auto_16984 ) ) ( not ( = ?auto_16962 ?auto_16968 ) ) ( not ( = ?auto_16962 ?auto_16984 ) ) ( not ( = ?auto_16963 ?auto_16968 ) ) ( not ( = ?auto_16963 ?auto_16984 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( not ( = ?auto_16964 ?auto_16984 ) ) ( not ( = ?auto_16965 ?auto_16968 ) ) ( not ( = ?auto_16965 ?auto_16984 ) ) ( not ( = ?auto_16966 ?auto_16968 ) ) ( not ( = ?auto_16966 ?auto_16984 ) ) ( not ( = ?auto_16968 ?auto_16992 ) ) ( not ( = ?auto_16968 ?auto_16979 ) ) ( not ( = ?auto_16968 ?auto_16982 ) ) ( not ( = ?auto_16968 ?auto_16991 ) ) ( not ( = ?auto_16968 ?auto_17004 ) ) ( not ( = ?auto_16968 ?auto_16981 ) ) ( not ( = ?auto_16968 ?auto_16993 ) ) ( not ( = ?auto_16968 ?auto_17007 ) ) ( not ( = ?auto_16968 ?auto_16985 ) ) ( not ( = ?auto_16968 ?auto_17002 ) ) ( not ( = ?auto_16968 ?auto_17003 ) ) ( not ( = ?auto_16984 ?auto_16992 ) ) ( not ( = ?auto_16984 ?auto_16979 ) ) ( not ( = ?auto_16984 ?auto_16982 ) ) ( not ( = ?auto_16984 ?auto_16991 ) ) ( not ( = ?auto_16984 ?auto_17004 ) ) ( not ( = ?auto_16984 ?auto_16981 ) ) ( not ( = ?auto_16984 ?auto_16993 ) ) ( not ( = ?auto_16984 ?auto_17007 ) ) ( not ( = ?auto_16984 ?auto_16985 ) ) ( not ( = ?auto_16984 ?auto_17002 ) ) ( not ( = ?auto_16984 ?auto_17003 ) ) ( not ( = ?auto_16956 ?auto_16969 ) ) ( not ( = ?auto_16956 ?auto_16973 ) ) ( not ( = ?auto_16957 ?auto_16969 ) ) ( not ( = ?auto_16957 ?auto_16973 ) ) ( not ( = ?auto_16958 ?auto_16969 ) ) ( not ( = ?auto_16958 ?auto_16973 ) ) ( not ( = ?auto_16959 ?auto_16969 ) ) ( not ( = ?auto_16959 ?auto_16973 ) ) ( not ( = ?auto_16960 ?auto_16969 ) ) ( not ( = ?auto_16960 ?auto_16973 ) ) ( not ( = ?auto_16961 ?auto_16969 ) ) ( not ( = ?auto_16961 ?auto_16973 ) ) ( not ( = ?auto_16962 ?auto_16969 ) ) ( not ( = ?auto_16962 ?auto_16973 ) ) ( not ( = ?auto_16963 ?auto_16969 ) ) ( not ( = ?auto_16963 ?auto_16973 ) ) ( not ( = ?auto_16964 ?auto_16969 ) ) ( not ( = ?auto_16964 ?auto_16973 ) ) ( not ( = ?auto_16965 ?auto_16969 ) ) ( not ( = ?auto_16965 ?auto_16973 ) ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( not ( = ?auto_16966 ?auto_16973 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16973 ) ) ( not ( = ?auto_16969 ?auto_16984 ) ) ( not ( = ?auto_16969 ?auto_16992 ) ) ( not ( = ?auto_16969 ?auto_16979 ) ) ( not ( = ?auto_16969 ?auto_16982 ) ) ( not ( = ?auto_16969 ?auto_16991 ) ) ( not ( = ?auto_16969 ?auto_17004 ) ) ( not ( = ?auto_16969 ?auto_16981 ) ) ( not ( = ?auto_16969 ?auto_16993 ) ) ( not ( = ?auto_16969 ?auto_17007 ) ) ( not ( = ?auto_16969 ?auto_16985 ) ) ( not ( = ?auto_16969 ?auto_17002 ) ) ( not ( = ?auto_16969 ?auto_17003 ) ) ( not ( = ?auto_16971 ?auto_17001 ) ) ( not ( = ?auto_16971 ?auto_16988 ) ) ( not ( = ?auto_16971 ?auto_16983 ) ) ( not ( = ?auto_16971 ?auto_16995 ) ) ( not ( = ?auto_16971 ?auto_17000 ) ) ( not ( = ?auto_16971 ?auto_16999 ) ) ( not ( = ?auto_16971 ?auto_16976 ) ) ( not ( = ?auto_16971 ?auto_16977 ) ) ( not ( = ?auto_16971 ?auto_16997 ) ) ( not ( = ?auto_16971 ?auto_16998 ) ) ( not ( = ?auto_16975 ?auto_16996 ) ) ( not ( = ?auto_16975 ?auto_16994 ) ) ( not ( = ?auto_16975 ?auto_16989 ) ) ( not ( = ?auto_16975 ?auto_17006 ) ) ( not ( = ?auto_16975 ?auto_16987 ) ) ( not ( = ?auto_16975 ?auto_16980 ) ) ( not ( = ?auto_16975 ?auto_16978 ) ) ( not ( = ?auto_16975 ?auto_16990 ) ) ( not ( = ?auto_16975 ?auto_17005 ) ) ( not ( = ?auto_16975 ?auto_16986 ) ) ( not ( = ?auto_16973 ?auto_16984 ) ) ( not ( = ?auto_16973 ?auto_16992 ) ) ( not ( = ?auto_16973 ?auto_16979 ) ) ( not ( = ?auto_16973 ?auto_16982 ) ) ( not ( = ?auto_16973 ?auto_16991 ) ) ( not ( = ?auto_16973 ?auto_17004 ) ) ( not ( = ?auto_16973 ?auto_16981 ) ) ( not ( = ?auto_16973 ?auto_16993 ) ) ( not ( = ?auto_16973 ?auto_17007 ) ) ( not ( = ?auto_16973 ?auto_16985 ) ) ( not ( = ?auto_16973 ?auto_17002 ) ) ( not ( = ?auto_16973 ?auto_17003 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16956 ?auto_16957 ?auto_16958 ?auto_16959 ?auto_16960 ?auto_16961 ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16965 ?auto_16966 ?auto_16967 ?auto_16968 )
      ( MAKE-1CRATE ?auto_16968 ?auto_16969 )
      ( MAKE-13CRATE-VERIFY ?auto_16956 ?auto_16957 ?auto_16958 ?auto_16959 ?auto_16960 ?auto_16961 ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16965 ?auto_16966 ?auto_16967 ?auto_16968 ?auto_16969 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17033 - SURFACE
      ?auto_17034 - SURFACE
      ?auto_17035 - SURFACE
      ?auto_17036 - SURFACE
      ?auto_17037 - SURFACE
      ?auto_17038 - SURFACE
      ?auto_17039 - SURFACE
      ?auto_17040 - SURFACE
      ?auto_17041 - SURFACE
      ?auto_17042 - SURFACE
      ?auto_17043 - SURFACE
      ?auto_17044 - SURFACE
      ?auto_17045 - SURFACE
      ?auto_17046 - SURFACE
      ?auto_17047 - SURFACE
    )
    :vars
    (
      ?auto_17053 - HOIST
      ?auto_17049 - PLACE
      ?auto_17048 - PLACE
      ?auto_17050 - HOIST
      ?auto_17052 - SURFACE
      ?auto_17071 - PLACE
      ?auto_17085 - HOIST
      ?auto_17055 - SURFACE
      ?auto_17070 - PLACE
      ?auto_17086 - HOIST
      ?auto_17060 - SURFACE
      ?auto_17072 - SURFACE
      ?auto_17077 - PLACE
      ?auto_17061 - HOIST
      ?auto_17083 - SURFACE
      ?auto_17062 - SURFACE
      ?auto_17073 - PLACE
      ?auto_17084 - HOIST
      ?auto_17079 - SURFACE
      ?auto_17064 - PLACE
      ?auto_17068 - HOIST
      ?auto_17067 - SURFACE
      ?auto_17074 - PLACE
      ?auto_17069 - HOIST
      ?auto_17056 - SURFACE
      ?auto_17065 - PLACE
      ?auto_17082 - HOIST
      ?auto_17063 - SURFACE
      ?auto_17058 - PLACE
      ?auto_17059 - HOIST
      ?auto_17078 - SURFACE
      ?auto_17081 - PLACE
      ?auto_17057 - HOIST
      ?auto_17066 - SURFACE
      ?auto_17076 - PLACE
      ?auto_17075 - HOIST
      ?auto_17080 - SURFACE
      ?auto_17054 - SURFACE
      ?auto_17051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17053 ?auto_17049 ) ( IS-CRATE ?auto_17047 ) ( not ( = ?auto_17048 ?auto_17049 ) ) ( HOIST-AT ?auto_17050 ?auto_17048 ) ( SURFACE-AT ?auto_17047 ?auto_17048 ) ( ON ?auto_17047 ?auto_17052 ) ( CLEAR ?auto_17047 ) ( not ( = ?auto_17046 ?auto_17047 ) ) ( not ( = ?auto_17046 ?auto_17052 ) ) ( not ( = ?auto_17047 ?auto_17052 ) ) ( not ( = ?auto_17053 ?auto_17050 ) ) ( IS-CRATE ?auto_17046 ) ( not ( = ?auto_17071 ?auto_17049 ) ) ( HOIST-AT ?auto_17085 ?auto_17071 ) ( AVAILABLE ?auto_17085 ) ( SURFACE-AT ?auto_17046 ?auto_17071 ) ( ON ?auto_17046 ?auto_17055 ) ( CLEAR ?auto_17046 ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17045 ?auto_17055 ) ) ( not ( = ?auto_17046 ?auto_17055 ) ) ( not ( = ?auto_17053 ?auto_17085 ) ) ( IS-CRATE ?auto_17045 ) ( not ( = ?auto_17070 ?auto_17049 ) ) ( HOIST-AT ?auto_17086 ?auto_17070 ) ( SURFACE-AT ?auto_17045 ?auto_17070 ) ( ON ?auto_17045 ?auto_17060 ) ( CLEAR ?auto_17045 ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17060 ) ) ( not ( = ?auto_17045 ?auto_17060 ) ) ( not ( = ?auto_17053 ?auto_17086 ) ) ( IS-CRATE ?auto_17044 ) ( AVAILABLE ?auto_17086 ) ( SURFACE-AT ?auto_17044 ?auto_17070 ) ( ON ?auto_17044 ?auto_17072 ) ( CLEAR ?auto_17044 ) ( not ( = ?auto_17043 ?auto_17044 ) ) ( not ( = ?auto_17043 ?auto_17072 ) ) ( not ( = ?auto_17044 ?auto_17072 ) ) ( IS-CRATE ?auto_17043 ) ( not ( = ?auto_17077 ?auto_17049 ) ) ( HOIST-AT ?auto_17061 ?auto_17077 ) ( SURFACE-AT ?auto_17043 ?auto_17077 ) ( ON ?auto_17043 ?auto_17083 ) ( CLEAR ?auto_17043 ) ( not ( = ?auto_17042 ?auto_17043 ) ) ( not ( = ?auto_17042 ?auto_17083 ) ) ( not ( = ?auto_17043 ?auto_17083 ) ) ( not ( = ?auto_17053 ?auto_17061 ) ) ( IS-CRATE ?auto_17042 ) ( AVAILABLE ?auto_17061 ) ( SURFACE-AT ?auto_17042 ?auto_17077 ) ( ON ?auto_17042 ?auto_17062 ) ( CLEAR ?auto_17042 ) ( not ( = ?auto_17041 ?auto_17042 ) ) ( not ( = ?auto_17041 ?auto_17062 ) ) ( not ( = ?auto_17042 ?auto_17062 ) ) ( IS-CRATE ?auto_17041 ) ( not ( = ?auto_17073 ?auto_17049 ) ) ( HOIST-AT ?auto_17084 ?auto_17073 ) ( AVAILABLE ?auto_17084 ) ( SURFACE-AT ?auto_17041 ?auto_17073 ) ( ON ?auto_17041 ?auto_17079 ) ( CLEAR ?auto_17041 ) ( not ( = ?auto_17040 ?auto_17041 ) ) ( not ( = ?auto_17040 ?auto_17079 ) ) ( not ( = ?auto_17041 ?auto_17079 ) ) ( not ( = ?auto_17053 ?auto_17084 ) ) ( IS-CRATE ?auto_17040 ) ( not ( = ?auto_17064 ?auto_17049 ) ) ( HOIST-AT ?auto_17068 ?auto_17064 ) ( AVAILABLE ?auto_17068 ) ( SURFACE-AT ?auto_17040 ?auto_17064 ) ( ON ?auto_17040 ?auto_17067 ) ( CLEAR ?auto_17040 ) ( not ( = ?auto_17039 ?auto_17040 ) ) ( not ( = ?auto_17039 ?auto_17067 ) ) ( not ( = ?auto_17040 ?auto_17067 ) ) ( not ( = ?auto_17053 ?auto_17068 ) ) ( IS-CRATE ?auto_17039 ) ( not ( = ?auto_17074 ?auto_17049 ) ) ( HOIST-AT ?auto_17069 ?auto_17074 ) ( AVAILABLE ?auto_17069 ) ( SURFACE-AT ?auto_17039 ?auto_17074 ) ( ON ?auto_17039 ?auto_17056 ) ( CLEAR ?auto_17039 ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17056 ) ) ( not ( = ?auto_17039 ?auto_17056 ) ) ( not ( = ?auto_17053 ?auto_17069 ) ) ( IS-CRATE ?auto_17038 ) ( not ( = ?auto_17065 ?auto_17049 ) ) ( HOIST-AT ?auto_17082 ?auto_17065 ) ( AVAILABLE ?auto_17082 ) ( SURFACE-AT ?auto_17038 ?auto_17065 ) ( ON ?auto_17038 ?auto_17063 ) ( CLEAR ?auto_17038 ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17037 ?auto_17063 ) ) ( not ( = ?auto_17038 ?auto_17063 ) ) ( not ( = ?auto_17053 ?auto_17082 ) ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17058 ?auto_17049 ) ) ( HOIST-AT ?auto_17059 ?auto_17058 ) ( AVAILABLE ?auto_17059 ) ( SURFACE-AT ?auto_17037 ?auto_17058 ) ( ON ?auto_17037 ?auto_17078 ) ( CLEAR ?auto_17037 ) ( not ( = ?auto_17036 ?auto_17037 ) ) ( not ( = ?auto_17036 ?auto_17078 ) ) ( not ( = ?auto_17037 ?auto_17078 ) ) ( not ( = ?auto_17053 ?auto_17059 ) ) ( IS-CRATE ?auto_17036 ) ( not ( = ?auto_17081 ?auto_17049 ) ) ( HOIST-AT ?auto_17057 ?auto_17081 ) ( AVAILABLE ?auto_17057 ) ( SURFACE-AT ?auto_17036 ?auto_17081 ) ( ON ?auto_17036 ?auto_17066 ) ( CLEAR ?auto_17036 ) ( not ( = ?auto_17035 ?auto_17036 ) ) ( not ( = ?auto_17035 ?auto_17066 ) ) ( not ( = ?auto_17036 ?auto_17066 ) ) ( not ( = ?auto_17053 ?auto_17057 ) ) ( IS-CRATE ?auto_17035 ) ( not ( = ?auto_17076 ?auto_17049 ) ) ( HOIST-AT ?auto_17075 ?auto_17076 ) ( AVAILABLE ?auto_17075 ) ( SURFACE-AT ?auto_17035 ?auto_17076 ) ( ON ?auto_17035 ?auto_17080 ) ( CLEAR ?auto_17035 ) ( not ( = ?auto_17034 ?auto_17035 ) ) ( not ( = ?auto_17034 ?auto_17080 ) ) ( not ( = ?auto_17035 ?auto_17080 ) ) ( not ( = ?auto_17053 ?auto_17075 ) ) ( SURFACE-AT ?auto_17033 ?auto_17049 ) ( CLEAR ?auto_17033 ) ( IS-CRATE ?auto_17034 ) ( AVAILABLE ?auto_17053 ) ( AVAILABLE ?auto_17050 ) ( SURFACE-AT ?auto_17034 ?auto_17048 ) ( ON ?auto_17034 ?auto_17054 ) ( CLEAR ?auto_17034 ) ( TRUCK-AT ?auto_17051 ?auto_17049 ) ( not ( = ?auto_17033 ?auto_17034 ) ) ( not ( = ?auto_17033 ?auto_17054 ) ) ( not ( = ?auto_17034 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17035 ) ) ( not ( = ?auto_17033 ?auto_17080 ) ) ( not ( = ?auto_17035 ?auto_17054 ) ) ( not ( = ?auto_17076 ?auto_17048 ) ) ( not ( = ?auto_17075 ?auto_17050 ) ) ( not ( = ?auto_17080 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17036 ) ) ( not ( = ?auto_17033 ?auto_17066 ) ) ( not ( = ?auto_17034 ?auto_17036 ) ) ( not ( = ?auto_17034 ?auto_17066 ) ) ( not ( = ?auto_17036 ?auto_17080 ) ) ( not ( = ?auto_17036 ?auto_17054 ) ) ( not ( = ?auto_17081 ?auto_17076 ) ) ( not ( = ?auto_17081 ?auto_17048 ) ) ( not ( = ?auto_17057 ?auto_17075 ) ) ( not ( = ?auto_17057 ?auto_17050 ) ) ( not ( = ?auto_17066 ?auto_17080 ) ) ( not ( = ?auto_17066 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17037 ) ) ( not ( = ?auto_17033 ?auto_17078 ) ) ( not ( = ?auto_17034 ?auto_17037 ) ) ( not ( = ?auto_17034 ?auto_17078 ) ) ( not ( = ?auto_17035 ?auto_17037 ) ) ( not ( = ?auto_17035 ?auto_17078 ) ) ( not ( = ?auto_17037 ?auto_17066 ) ) ( not ( = ?auto_17037 ?auto_17080 ) ) ( not ( = ?auto_17037 ?auto_17054 ) ) ( not ( = ?auto_17058 ?auto_17081 ) ) ( not ( = ?auto_17058 ?auto_17076 ) ) ( not ( = ?auto_17058 ?auto_17048 ) ) ( not ( = ?auto_17059 ?auto_17057 ) ) ( not ( = ?auto_17059 ?auto_17075 ) ) ( not ( = ?auto_17059 ?auto_17050 ) ) ( not ( = ?auto_17078 ?auto_17066 ) ) ( not ( = ?auto_17078 ?auto_17080 ) ) ( not ( = ?auto_17078 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17038 ) ) ( not ( = ?auto_17033 ?auto_17063 ) ) ( not ( = ?auto_17034 ?auto_17038 ) ) ( not ( = ?auto_17034 ?auto_17063 ) ) ( not ( = ?auto_17035 ?auto_17038 ) ) ( not ( = ?auto_17035 ?auto_17063 ) ) ( not ( = ?auto_17036 ?auto_17038 ) ) ( not ( = ?auto_17036 ?auto_17063 ) ) ( not ( = ?auto_17038 ?auto_17078 ) ) ( not ( = ?auto_17038 ?auto_17066 ) ) ( not ( = ?auto_17038 ?auto_17080 ) ) ( not ( = ?auto_17038 ?auto_17054 ) ) ( not ( = ?auto_17065 ?auto_17058 ) ) ( not ( = ?auto_17065 ?auto_17081 ) ) ( not ( = ?auto_17065 ?auto_17076 ) ) ( not ( = ?auto_17065 ?auto_17048 ) ) ( not ( = ?auto_17082 ?auto_17059 ) ) ( not ( = ?auto_17082 ?auto_17057 ) ) ( not ( = ?auto_17082 ?auto_17075 ) ) ( not ( = ?auto_17082 ?auto_17050 ) ) ( not ( = ?auto_17063 ?auto_17078 ) ) ( not ( = ?auto_17063 ?auto_17066 ) ) ( not ( = ?auto_17063 ?auto_17080 ) ) ( not ( = ?auto_17063 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17039 ) ) ( not ( = ?auto_17033 ?auto_17056 ) ) ( not ( = ?auto_17034 ?auto_17039 ) ) ( not ( = ?auto_17034 ?auto_17056 ) ) ( not ( = ?auto_17035 ?auto_17039 ) ) ( not ( = ?auto_17035 ?auto_17056 ) ) ( not ( = ?auto_17036 ?auto_17039 ) ) ( not ( = ?auto_17036 ?auto_17056 ) ) ( not ( = ?auto_17037 ?auto_17039 ) ) ( not ( = ?auto_17037 ?auto_17056 ) ) ( not ( = ?auto_17039 ?auto_17063 ) ) ( not ( = ?auto_17039 ?auto_17078 ) ) ( not ( = ?auto_17039 ?auto_17066 ) ) ( not ( = ?auto_17039 ?auto_17080 ) ) ( not ( = ?auto_17039 ?auto_17054 ) ) ( not ( = ?auto_17074 ?auto_17065 ) ) ( not ( = ?auto_17074 ?auto_17058 ) ) ( not ( = ?auto_17074 ?auto_17081 ) ) ( not ( = ?auto_17074 ?auto_17076 ) ) ( not ( = ?auto_17074 ?auto_17048 ) ) ( not ( = ?auto_17069 ?auto_17082 ) ) ( not ( = ?auto_17069 ?auto_17059 ) ) ( not ( = ?auto_17069 ?auto_17057 ) ) ( not ( = ?auto_17069 ?auto_17075 ) ) ( not ( = ?auto_17069 ?auto_17050 ) ) ( not ( = ?auto_17056 ?auto_17063 ) ) ( not ( = ?auto_17056 ?auto_17078 ) ) ( not ( = ?auto_17056 ?auto_17066 ) ) ( not ( = ?auto_17056 ?auto_17080 ) ) ( not ( = ?auto_17056 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17040 ) ) ( not ( = ?auto_17033 ?auto_17067 ) ) ( not ( = ?auto_17034 ?auto_17040 ) ) ( not ( = ?auto_17034 ?auto_17067 ) ) ( not ( = ?auto_17035 ?auto_17040 ) ) ( not ( = ?auto_17035 ?auto_17067 ) ) ( not ( = ?auto_17036 ?auto_17040 ) ) ( not ( = ?auto_17036 ?auto_17067 ) ) ( not ( = ?auto_17037 ?auto_17040 ) ) ( not ( = ?auto_17037 ?auto_17067 ) ) ( not ( = ?auto_17038 ?auto_17040 ) ) ( not ( = ?auto_17038 ?auto_17067 ) ) ( not ( = ?auto_17040 ?auto_17056 ) ) ( not ( = ?auto_17040 ?auto_17063 ) ) ( not ( = ?auto_17040 ?auto_17078 ) ) ( not ( = ?auto_17040 ?auto_17066 ) ) ( not ( = ?auto_17040 ?auto_17080 ) ) ( not ( = ?auto_17040 ?auto_17054 ) ) ( not ( = ?auto_17064 ?auto_17074 ) ) ( not ( = ?auto_17064 ?auto_17065 ) ) ( not ( = ?auto_17064 ?auto_17058 ) ) ( not ( = ?auto_17064 ?auto_17081 ) ) ( not ( = ?auto_17064 ?auto_17076 ) ) ( not ( = ?auto_17064 ?auto_17048 ) ) ( not ( = ?auto_17068 ?auto_17069 ) ) ( not ( = ?auto_17068 ?auto_17082 ) ) ( not ( = ?auto_17068 ?auto_17059 ) ) ( not ( = ?auto_17068 ?auto_17057 ) ) ( not ( = ?auto_17068 ?auto_17075 ) ) ( not ( = ?auto_17068 ?auto_17050 ) ) ( not ( = ?auto_17067 ?auto_17056 ) ) ( not ( = ?auto_17067 ?auto_17063 ) ) ( not ( = ?auto_17067 ?auto_17078 ) ) ( not ( = ?auto_17067 ?auto_17066 ) ) ( not ( = ?auto_17067 ?auto_17080 ) ) ( not ( = ?auto_17067 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17041 ) ) ( not ( = ?auto_17033 ?auto_17079 ) ) ( not ( = ?auto_17034 ?auto_17041 ) ) ( not ( = ?auto_17034 ?auto_17079 ) ) ( not ( = ?auto_17035 ?auto_17041 ) ) ( not ( = ?auto_17035 ?auto_17079 ) ) ( not ( = ?auto_17036 ?auto_17041 ) ) ( not ( = ?auto_17036 ?auto_17079 ) ) ( not ( = ?auto_17037 ?auto_17041 ) ) ( not ( = ?auto_17037 ?auto_17079 ) ) ( not ( = ?auto_17038 ?auto_17041 ) ) ( not ( = ?auto_17038 ?auto_17079 ) ) ( not ( = ?auto_17039 ?auto_17041 ) ) ( not ( = ?auto_17039 ?auto_17079 ) ) ( not ( = ?auto_17041 ?auto_17067 ) ) ( not ( = ?auto_17041 ?auto_17056 ) ) ( not ( = ?auto_17041 ?auto_17063 ) ) ( not ( = ?auto_17041 ?auto_17078 ) ) ( not ( = ?auto_17041 ?auto_17066 ) ) ( not ( = ?auto_17041 ?auto_17080 ) ) ( not ( = ?auto_17041 ?auto_17054 ) ) ( not ( = ?auto_17073 ?auto_17064 ) ) ( not ( = ?auto_17073 ?auto_17074 ) ) ( not ( = ?auto_17073 ?auto_17065 ) ) ( not ( = ?auto_17073 ?auto_17058 ) ) ( not ( = ?auto_17073 ?auto_17081 ) ) ( not ( = ?auto_17073 ?auto_17076 ) ) ( not ( = ?auto_17073 ?auto_17048 ) ) ( not ( = ?auto_17084 ?auto_17068 ) ) ( not ( = ?auto_17084 ?auto_17069 ) ) ( not ( = ?auto_17084 ?auto_17082 ) ) ( not ( = ?auto_17084 ?auto_17059 ) ) ( not ( = ?auto_17084 ?auto_17057 ) ) ( not ( = ?auto_17084 ?auto_17075 ) ) ( not ( = ?auto_17084 ?auto_17050 ) ) ( not ( = ?auto_17079 ?auto_17067 ) ) ( not ( = ?auto_17079 ?auto_17056 ) ) ( not ( = ?auto_17079 ?auto_17063 ) ) ( not ( = ?auto_17079 ?auto_17078 ) ) ( not ( = ?auto_17079 ?auto_17066 ) ) ( not ( = ?auto_17079 ?auto_17080 ) ) ( not ( = ?auto_17079 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17042 ) ) ( not ( = ?auto_17033 ?auto_17062 ) ) ( not ( = ?auto_17034 ?auto_17042 ) ) ( not ( = ?auto_17034 ?auto_17062 ) ) ( not ( = ?auto_17035 ?auto_17042 ) ) ( not ( = ?auto_17035 ?auto_17062 ) ) ( not ( = ?auto_17036 ?auto_17042 ) ) ( not ( = ?auto_17036 ?auto_17062 ) ) ( not ( = ?auto_17037 ?auto_17042 ) ) ( not ( = ?auto_17037 ?auto_17062 ) ) ( not ( = ?auto_17038 ?auto_17042 ) ) ( not ( = ?auto_17038 ?auto_17062 ) ) ( not ( = ?auto_17039 ?auto_17042 ) ) ( not ( = ?auto_17039 ?auto_17062 ) ) ( not ( = ?auto_17040 ?auto_17042 ) ) ( not ( = ?auto_17040 ?auto_17062 ) ) ( not ( = ?auto_17042 ?auto_17079 ) ) ( not ( = ?auto_17042 ?auto_17067 ) ) ( not ( = ?auto_17042 ?auto_17056 ) ) ( not ( = ?auto_17042 ?auto_17063 ) ) ( not ( = ?auto_17042 ?auto_17078 ) ) ( not ( = ?auto_17042 ?auto_17066 ) ) ( not ( = ?auto_17042 ?auto_17080 ) ) ( not ( = ?auto_17042 ?auto_17054 ) ) ( not ( = ?auto_17077 ?auto_17073 ) ) ( not ( = ?auto_17077 ?auto_17064 ) ) ( not ( = ?auto_17077 ?auto_17074 ) ) ( not ( = ?auto_17077 ?auto_17065 ) ) ( not ( = ?auto_17077 ?auto_17058 ) ) ( not ( = ?auto_17077 ?auto_17081 ) ) ( not ( = ?auto_17077 ?auto_17076 ) ) ( not ( = ?auto_17077 ?auto_17048 ) ) ( not ( = ?auto_17061 ?auto_17084 ) ) ( not ( = ?auto_17061 ?auto_17068 ) ) ( not ( = ?auto_17061 ?auto_17069 ) ) ( not ( = ?auto_17061 ?auto_17082 ) ) ( not ( = ?auto_17061 ?auto_17059 ) ) ( not ( = ?auto_17061 ?auto_17057 ) ) ( not ( = ?auto_17061 ?auto_17075 ) ) ( not ( = ?auto_17061 ?auto_17050 ) ) ( not ( = ?auto_17062 ?auto_17079 ) ) ( not ( = ?auto_17062 ?auto_17067 ) ) ( not ( = ?auto_17062 ?auto_17056 ) ) ( not ( = ?auto_17062 ?auto_17063 ) ) ( not ( = ?auto_17062 ?auto_17078 ) ) ( not ( = ?auto_17062 ?auto_17066 ) ) ( not ( = ?auto_17062 ?auto_17080 ) ) ( not ( = ?auto_17062 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17043 ) ) ( not ( = ?auto_17033 ?auto_17083 ) ) ( not ( = ?auto_17034 ?auto_17043 ) ) ( not ( = ?auto_17034 ?auto_17083 ) ) ( not ( = ?auto_17035 ?auto_17043 ) ) ( not ( = ?auto_17035 ?auto_17083 ) ) ( not ( = ?auto_17036 ?auto_17043 ) ) ( not ( = ?auto_17036 ?auto_17083 ) ) ( not ( = ?auto_17037 ?auto_17043 ) ) ( not ( = ?auto_17037 ?auto_17083 ) ) ( not ( = ?auto_17038 ?auto_17043 ) ) ( not ( = ?auto_17038 ?auto_17083 ) ) ( not ( = ?auto_17039 ?auto_17043 ) ) ( not ( = ?auto_17039 ?auto_17083 ) ) ( not ( = ?auto_17040 ?auto_17043 ) ) ( not ( = ?auto_17040 ?auto_17083 ) ) ( not ( = ?auto_17041 ?auto_17043 ) ) ( not ( = ?auto_17041 ?auto_17083 ) ) ( not ( = ?auto_17043 ?auto_17062 ) ) ( not ( = ?auto_17043 ?auto_17079 ) ) ( not ( = ?auto_17043 ?auto_17067 ) ) ( not ( = ?auto_17043 ?auto_17056 ) ) ( not ( = ?auto_17043 ?auto_17063 ) ) ( not ( = ?auto_17043 ?auto_17078 ) ) ( not ( = ?auto_17043 ?auto_17066 ) ) ( not ( = ?auto_17043 ?auto_17080 ) ) ( not ( = ?auto_17043 ?auto_17054 ) ) ( not ( = ?auto_17083 ?auto_17062 ) ) ( not ( = ?auto_17083 ?auto_17079 ) ) ( not ( = ?auto_17083 ?auto_17067 ) ) ( not ( = ?auto_17083 ?auto_17056 ) ) ( not ( = ?auto_17083 ?auto_17063 ) ) ( not ( = ?auto_17083 ?auto_17078 ) ) ( not ( = ?auto_17083 ?auto_17066 ) ) ( not ( = ?auto_17083 ?auto_17080 ) ) ( not ( = ?auto_17083 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17044 ) ) ( not ( = ?auto_17033 ?auto_17072 ) ) ( not ( = ?auto_17034 ?auto_17044 ) ) ( not ( = ?auto_17034 ?auto_17072 ) ) ( not ( = ?auto_17035 ?auto_17044 ) ) ( not ( = ?auto_17035 ?auto_17072 ) ) ( not ( = ?auto_17036 ?auto_17044 ) ) ( not ( = ?auto_17036 ?auto_17072 ) ) ( not ( = ?auto_17037 ?auto_17044 ) ) ( not ( = ?auto_17037 ?auto_17072 ) ) ( not ( = ?auto_17038 ?auto_17044 ) ) ( not ( = ?auto_17038 ?auto_17072 ) ) ( not ( = ?auto_17039 ?auto_17044 ) ) ( not ( = ?auto_17039 ?auto_17072 ) ) ( not ( = ?auto_17040 ?auto_17044 ) ) ( not ( = ?auto_17040 ?auto_17072 ) ) ( not ( = ?auto_17041 ?auto_17044 ) ) ( not ( = ?auto_17041 ?auto_17072 ) ) ( not ( = ?auto_17042 ?auto_17044 ) ) ( not ( = ?auto_17042 ?auto_17072 ) ) ( not ( = ?auto_17044 ?auto_17083 ) ) ( not ( = ?auto_17044 ?auto_17062 ) ) ( not ( = ?auto_17044 ?auto_17079 ) ) ( not ( = ?auto_17044 ?auto_17067 ) ) ( not ( = ?auto_17044 ?auto_17056 ) ) ( not ( = ?auto_17044 ?auto_17063 ) ) ( not ( = ?auto_17044 ?auto_17078 ) ) ( not ( = ?auto_17044 ?auto_17066 ) ) ( not ( = ?auto_17044 ?auto_17080 ) ) ( not ( = ?auto_17044 ?auto_17054 ) ) ( not ( = ?auto_17070 ?auto_17077 ) ) ( not ( = ?auto_17070 ?auto_17073 ) ) ( not ( = ?auto_17070 ?auto_17064 ) ) ( not ( = ?auto_17070 ?auto_17074 ) ) ( not ( = ?auto_17070 ?auto_17065 ) ) ( not ( = ?auto_17070 ?auto_17058 ) ) ( not ( = ?auto_17070 ?auto_17081 ) ) ( not ( = ?auto_17070 ?auto_17076 ) ) ( not ( = ?auto_17070 ?auto_17048 ) ) ( not ( = ?auto_17086 ?auto_17061 ) ) ( not ( = ?auto_17086 ?auto_17084 ) ) ( not ( = ?auto_17086 ?auto_17068 ) ) ( not ( = ?auto_17086 ?auto_17069 ) ) ( not ( = ?auto_17086 ?auto_17082 ) ) ( not ( = ?auto_17086 ?auto_17059 ) ) ( not ( = ?auto_17086 ?auto_17057 ) ) ( not ( = ?auto_17086 ?auto_17075 ) ) ( not ( = ?auto_17086 ?auto_17050 ) ) ( not ( = ?auto_17072 ?auto_17083 ) ) ( not ( = ?auto_17072 ?auto_17062 ) ) ( not ( = ?auto_17072 ?auto_17079 ) ) ( not ( = ?auto_17072 ?auto_17067 ) ) ( not ( = ?auto_17072 ?auto_17056 ) ) ( not ( = ?auto_17072 ?auto_17063 ) ) ( not ( = ?auto_17072 ?auto_17078 ) ) ( not ( = ?auto_17072 ?auto_17066 ) ) ( not ( = ?auto_17072 ?auto_17080 ) ) ( not ( = ?auto_17072 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17045 ) ) ( not ( = ?auto_17033 ?auto_17060 ) ) ( not ( = ?auto_17034 ?auto_17045 ) ) ( not ( = ?auto_17034 ?auto_17060 ) ) ( not ( = ?auto_17035 ?auto_17045 ) ) ( not ( = ?auto_17035 ?auto_17060 ) ) ( not ( = ?auto_17036 ?auto_17045 ) ) ( not ( = ?auto_17036 ?auto_17060 ) ) ( not ( = ?auto_17037 ?auto_17045 ) ) ( not ( = ?auto_17037 ?auto_17060 ) ) ( not ( = ?auto_17038 ?auto_17045 ) ) ( not ( = ?auto_17038 ?auto_17060 ) ) ( not ( = ?auto_17039 ?auto_17045 ) ) ( not ( = ?auto_17039 ?auto_17060 ) ) ( not ( = ?auto_17040 ?auto_17045 ) ) ( not ( = ?auto_17040 ?auto_17060 ) ) ( not ( = ?auto_17041 ?auto_17045 ) ) ( not ( = ?auto_17041 ?auto_17060 ) ) ( not ( = ?auto_17042 ?auto_17045 ) ) ( not ( = ?auto_17042 ?auto_17060 ) ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( not ( = ?auto_17043 ?auto_17060 ) ) ( not ( = ?auto_17045 ?auto_17072 ) ) ( not ( = ?auto_17045 ?auto_17083 ) ) ( not ( = ?auto_17045 ?auto_17062 ) ) ( not ( = ?auto_17045 ?auto_17079 ) ) ( not ( = ?auto_17045 ?auto_17067 ) ) ( not ( = ?auto_17045 ?auto_17056 ) ) ( not ( = ?auto_17045 ?auto_17063 ) ) ( not ( = ?auto_17045 ?auto_17078 ) ) ( not ( = ?auto_17045 ?auto_17066 ) ) ( not ( = ?auto_17045 ?auto_17080 ) ) ( not ( = ?auto_17045 ?auto_17054 ) ) ( not ( = ?auto_17060 ?auto_17072 ) ) ( not ( = ?auto_17060 ?auto_17083 ) ) ( not ( = ?auto_17060 ?auto_17062 ) ) ( not ( = ?auto_17060 ?auto_17079 ) ) ( not ( = ?auto_17060 ?auto_17067 ) ) ( not ( = ?auto_17060 ?auto_17056 ) ) ( not ( = ?auto_17060 ?auto_17063 ) ) ( not ( = ?auto_17060 ?auto_17078 ) ) ( not ( = ?auto_17060 ?auto_17066 ) ) ( not ( = ?auto_17060 ?auto_17080 ) ) ( not ( = ?auto_17060 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17046 ) ) ( not ( = ?auto_17033 ?auto_17055 ) ) ( not ( = ?auto_17034 ?auto_17046 ) ) ( not ( = ?auto_17034 ?auto_17055 ) ) ( not ( = ?auto_17035 ?auto_17046 ) ) ( not ( = ?auto_17035 ?auto_17055 ) ) ( not ( = ?auto_17036 ?auto_17046 ) ) ( not ( = ?auto_17036 ?auto_17055 ) ) ( not ( = ?auto_17037 ?auto_17046 ) ) ( not ( = ?auto_17037 ?auto_17055 ) ) ( not ( = ?auto_17038 ?auto_17046 ) ) ( not ( = ?auto_17038 ?auto_17055 ) ) ( not ( = ?auto_17039 ?auto_17046 ) ) ( not ( = ?auto_17039 ?auto_17055 ) ) ( not ( = ?auto_17040 ?auto_17046 ) ) ( not ( = ?auto_17040 ?auto_17055 ) ) ( not ( = ?auto_17041 ?auto_17046 ) ) ( not ( = ?auto_17041 ?auto_17055 ) ) ( not ( = ?auto_17042 ?auto_17046 ) ) ( not ( = ?auto_17042 ?auto_17055 ) ) ( not ( = ?auto_17043 ?auto_17046 ) ) ( not ( = ?auto_17043 ?auto_17055 ) ) ( not ( = ?auto_17044 ?auto_17046 ) ) ( not ( = ?auto_17044 ?auto_17055 ) ) ( not ( = ?auto_17046 ?auto_17060 ) ) ( not ( = ?auto_17046 ?auto_17072 ) ) ( not ( = ?auto_17046 ?auto_17083 ) ) ( not ( = ?auto_17046 ?auto_17062 ) ) ( not ( = ?auto_17046 ?auto_17079 ) ) ( not ( = ?auto_17046 ?auto_17067 ) ) ( not ( = ?auto_17046 ?auto_17056 ) ) ( not ( = ?auto_17046 ?auto_17063 ) ) ( not ( = ?auto_17046 ?auto_17078 ) ) ( not ( = ?auto_17046 ?auto_17066 ) ) ( not ( = ?auto_17046 ?auto_17080 ) ) ( not ( = ?auto_17046 ?auto_17054 ) ) ( not ( = ?auto_17071 ?auto_17070 ) ) ( not ( = ?auto_17071 ?auto_17077 ) ) ( not ( = ?auto_17071 ?auto_17073 ) ) ( not ( = ?auto_17071 ?auto_17064 ) ) ( not ( = ?auto_17071 ?auto_17074 ) ) ( not ( = ?auto_17071 ?auto_17065 ) ) ( not ( = ?auto_17071 ?auto_17058 ) ) ( not ( = ?auto_17071 ?auto_17081 ) ) ( not ( = ?auto_17071 ?auto_17076 ) ) ( not ( = ?auto_17071 ?auto_17048 ) ) ( not ( = ?auto_17085 ?auto_17086 ) ) ( not ( = ?auto_17085 ?auto_17061 ) ) ( not ( = ?auto_17085 ?auto_17084 ) ) ( not ( = ?auto_17085 ?auto_17068 ) ) ( not ( = ?auto_17085 ?auto_17069 ) ) ( not ( = ?auto_17085 ?auto_17082 ) ) ( not ( = ?auto_17085 ?auto_17059 ) ) ( not ( = ?auto_17085 ?auto_17057 ) ) ( not ( = ?auto_17085 ?auto_17075 ) ) ( not ( = ?auto_17085 ?auto_17050 ) ) ( not ( = ?auto_17055 ?auto_17060 ) ) ( not ( = ?auto_17055 ?auto_17072 ) ) ( not ( = ?auto_17055 ?auto_17083 ) ) ( not ( = ?auto_17055 ?auto_17062 ) ) ( not ( = ?auto_17055 ?auto_17079 ) ) ( not ( = ?auto_17055 ?auto_17067 ) ) ( not ( = ?auto_17055 ?auto_17056 ) ) ( not ( = ?auto_17055 ?auto_17063 ) ) ( not ( = ?auto_17055 ?auto_17078 ) ) ( not ( = ?auto_17055 ?auto_17066 ) ) ( not ( = ?auto_17055 ?auto_17080 ) ) ( not ( = ?auto_17055 ?auto_17054 ) ) ( not ( = ?auto_17033 ?auto_17047 ) ) ( not ( = ?auto_17033 ?auto_17052 ) ) ( not ( = ?auto_17034 ?auto_17047 ) ) ( not ( = ?auto_17034 ?auto_17052 ) ) ( not ( = ?auto_17035 ?auto_17047 ) ) ( not ( = ?auto_17035 ?auto_17052 ) ) ( not ( = ?auto_17036 ?auto_17047 ) ) ( not ( = ?auto_17036 ?auto_17052 ) ) ( not ( = ?auto_17037 ?auto_17047 ) ) ( not ( = ?auto_17037 ?auto_17052 ) ) ( not ( = ?auto_17038 ?auto_17047 ) ) ( not ( = ?auto_17038 ?auto_17052 ) ) ( not ( = ?auto_17039 ?auto_17047 ) ) ( not ( = ?auto_17039 ?auto_17052 ) ) ( not ( = ?auto_17040 ?auto_17047 ) ) ( not ( = ?auto_17040 ?auto_17052 ) ) ( not ( = ?auto_17041 ?auto_17047 ) ) ( not ( = ?auto_17041 ?auto_17052 ) ) ( not ( = ?auto_17042 ?auto_17047 ) ) ( not ( = ?auto_17042 ?auto_17052 ) ) ( not ( = ?auto_17043 ?auto_17047 ) ) ( not ( = ?auto_17043 ?auto_17052 ) ) ( not ( = ?auto_17044 ?auto_17047 ) ) ( not ( = ?auto_17044 ?auto_17052 ) ) ( not ( = ?auto_17045 ?auto_17047 ) ) ( not ( = ?auto_17045 ?auto_17052 ) ) ( not ( = ?auto_17047 ?auto_17055 ) ) ( not ( = ?auto_17047 ?auto_17060 ) ) ( not ( = ?auto_17047 ?auto_17072 ) ) ( not ( = ?auto_17047 ?auto_17083 ) ) ( not ( = ?auto_17047 ?auto_17062 ) ) ( not ( = ?auto_17047 ?auto_17079 ) ) ( not ( = ?auto_17047 ?auto_17067 ) ) ( not ( = ?auto_17047 ?auto_17056 ) ) ( not ( = ?auto_17047 ?auto_17063 ) ) ( not ( = ?auto_17047 ?auto_17078 ) ) ( not ( = ?auto_17047 ?auto_17066 ) ) ( not ( = ?auto_17047 ?auto_17080 ) ) ( not ( = ?auto_17047 ?auto_17054 ) ) ( not ( = ?auto_17052 ?auto_17055 ) ) ( not ( = ?auto_17052 ?auto_17060 ) ) ( not ( = ?auto_17052 ?auto_17072 ) ) ( not ( = ?auto_17052 ?auto_17083 ) ) ( not ( = ?auto_17052 ?auto_17062 ) ) ( not ( = ?auto_17052 ?auto_17079 ) ) ( not ( = ?auto_17052 ?auto_17067 ) ) ( not ( = ?auto_17052 ?auto_17056 ) ) ( not ( = ?auto_17052 ?auto_17063 ) ) ( not ( = ?auto_17052 ?auto_17078 ) ) ( not ( = ?auto_17052 ?auto_17066 ) ) ( not ( = ?auto_17052 ?auto_17080 ) ) ( not ( = ?auto_17052 ?auto_17054 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17033 ?auto_17034 ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17040 ?auto_17041 ?auto_17042 ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 )
      ( MAKE-1CRATE ?auto_17046 ?auto_17047 )
      ( MAKE-14CRATE-VERIFY ?auto_17033 ?auto_17034 ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17040 ?auto_17041 ?auto_17042 ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 ?auto_17047 ) )
  )

)

