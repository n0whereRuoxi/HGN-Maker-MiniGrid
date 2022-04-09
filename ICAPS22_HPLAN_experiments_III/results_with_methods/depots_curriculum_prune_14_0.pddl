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
      ?auto_16410 - HOIST
      ?auto_16411 - PLACE
      ?auto_16406 - PLACE
      ?auto_16407 - HOIST
      ?auto_16408 - SURFACE
      ?auto_16414 - PLACE
      ?auto_16412 - HOIST
      ?auto_16413 - SURFACE
      ?auto_16409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16410 ?auto_16411 ) ( IS-CRATE ?auto_16405 ) ( not ( = ?auto_16406 ?auto_16411 ) ) ( HOIST-AT ?auto_16407 ?auto_16406 ) ( AVAILABLE ?auto_16407 ) ( SURFACE-AT ?auto_16405 ?auto_16406 ) ( ON ?auto_16405 ?auto_16408 ) ( CLEAR ?auto_16405 ) ( not ( = ?auto_16404 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16408 ) ) ( not ( = ?auto_16405 ?auto_16408 ) ) ( not ( = ?auto_16410 ?auto_16407 ) ) ( SURFACE-AT ?auto_16403 ?auto_16411 ) ( CLEAR ?auto_16403 ) ( IS-CRATE ?auto_16404 ) ( AVAILABLE ?auto_16410 ) ( not ( = ?auto_16414 ?auto_16411 ) ) ( HOIST-AT ?auto_16412 ?auto_16414 ) ( AVAILABLE ?auto_16412 ) ( SURFACE-AT ?auto_16404 ?auto_16414 ) ( ON ?auto_16404 ?auto_16413 ) ( CLEAR ?auto_16404 ) ( TRUCK-AT ?auto_16409 ?auto_16411 ) ( not ( = ?auto_16403 ?auto_16404 ) ) ( not ( = ?auto_16403 ?auto_16413 ) ) ( not ( = ?auto_16404 ?auto_16413 ) ) ( not ( = ?auto_16410 ?auto_16412 ) ) ( not ( = ?auto_16403 ?auto_16405 ) ) ( not ( = ?auto_16403 ?auto_16408 ) ) ( not ( = ?auto_16405 ?auto_16413 ) ) ( not ( = ?auto_16406 ?auto_16414 ) ) ( not ( = ?auto_16407 ?auto_16412 ) ) ( not ( = ?auto_16408 ?auto_16413 ) ) )
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
      ?auto_16436 - PLACE
      ?auto_16437 - HOIST
      ?auto_16438 - SURFACE
      ?auto_16440 - PLACE
      ?auto_16442 - HOIST
      ?auto_16443 - SURFACE
      ?auto_16439 - PLACE
      ?auto_16444 - HOIST
      ?auto_16441 - SURFACE
      ?auto_16434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16435 ?auto_16433 ) ( IS-CRATE ?auto_16432 ) ( not ( = ?auto_16436 ?auto_16433 ) ) ( HOIST-AT ?auto_16437 ?auto_16436 ) ( AVAILABLE ?auto_16437 ) ( SURFACE-AT ?auto_16432 ?auto_16436 ) ( ON ?auto_16432 ?auto_16438 ) ( CLEAR ?auto_16432 ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( not ( = ?auto_16431 ?auto_16438 ) ) ( not ( = ?auto_16432 ?auto_16438 ) ) ( not ( = ?auto_16435 ?auto_16437 ) ) ( IS-CRATE ?auto_16431 ) ( not ( = ?auto_16440 ?auto_16433 ) ) ( HOIST-AT ?auto_16442 ?auto_16440 ) ( AVAILABLE ?auto_16442 ) ( SURFACE-AT ?auto_16431 ?auto_16440 ) ( ON ?auto_16431 ?auto_16443 ) ( CLEAR ?auto_16431 ) ( not ( = ?auto_16430 ?auto_16431 ) ) ( not ( = ?auto_16430 ?auto_16443 ) ) ( not ( = ?auto_16431 ?auto_16443 ) ) ( not ( = ?auto_16435 ?auto_16442 ) ) ( SURFACE-AT ?auto_16429 ?auto_16433 ) ( CLEAR ?auto_16429 ) ( IS-CRATE ?auto_16430 ) ( AVAILABLE ?auto_16435 ) ( not ( = ?auto_16439 ?auto_16433 ) ) ( HOIST-AT ?auto_16444 ?auto_16439 ) ( AVAILABLE ?auto_16444 ) ( SURFACE-AT ?auto_16430 ?auto_16439 ) ( ON ?auto_16430 ?auto_16441 ) ( CLEAR ?auto_16430 ) ( TRUCK-AT ?auto_16434 ?auto_16433 ) ( not ( = ?auto_16429 ?auto_16430 ) ) ( not ( = ?auto_16429 ?auto_16441 ) ) ( not ( = ?auto_16430 ?auto_16441 ) ) ( not ( = ?auto_16435 ?auto_16444 ) ) ( not ( = ?auto_16429 ?auto_16431 ) ) ( not ( = ?auto_16429 ?auto_16443 ) ) ( not ( = ?auto_16431 ?auto_16441 ) ) ( not ( = ?auto_16440 ?auto_16439 ) ) ( not ( = ?auto_16442 ?auto_16444 ) ) ( not ( = ?auto_16443 ?auto_16441 ) ) ( not ( = ?auto_16429 ?auto_16432 ) ) ( not ( = ?auto_16429 ?auto_16438 ) ) ( not ( = ?auto_16430 ?auto_16432 ) ) ( not ( = ?auto_16430 ?auto_16438 ) ) ( not ( = ?auto_16432 ?auto_16443 ) ) ( not ( = ?auto_16432 ?auto_16441 ) ) ( not ( = ?auto_16436 ?auto_16440 ) ) ( not ( = ?auto_16436 ?auto_16439 ) ) ( not ( = ?auto_16437 ?auto_16442 ) ) ( not ( = ?auto_16437 ?auto_16444 ) ) ( not ( = ?auto_16438 ?auto_16443 ) ) ( not ( = ?auto_16438 ?auto_16441 ) ) )
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
      ?auto_16465 - HOIST
      ?auto_16469 - PLACE
      ?auto_16468 - PLACE
      ?auto_16466 - HOIST
      ?auto_16470 - SURFACE
      ?auto_16479 - PLACE
      ?auto_16478 - HOIST
      ?auto_16477 - SURFACE
      ?auto_16476 - PLACE
      ?auto_16474 - HOIST
      ?auto_16471 - SURFACE
      ?auto_16475 - PLACE
      ?auto_16473 - HOIST
      ?auto_16472 - SURFACE
      ?auto_16467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16465 ?auto_16469 ) ( IS-CRATE ?auto_16464 ) ( not ( = ?auto_16468 ?auto_16469 ) ) ( HOIST-AT ?auto_16466 ?auto_16468 ) ( AVAILABLE ?auto_16466 ) ( SURFACE-AT ?auto_16464 ?auto_16468 ) ( ON ?auto_16464 ?auto_16470 ) ( CLEAR ?auto_16464 ) ( not ( = ?auto_16463 ?auto_16464 ) ) ( not ( = ?auto_16463 ?auto_16470 ) ) ( not ( = ?auto_16464 ?auto_16470 ) ) ( not ( = ?auto_16465 ?auto_16466 ) ) ( IS-CRATE ?auto_16463 ) ( not ( = ?auto_16479 ?auto_16469 ) ) ( HOIST-AT ?auto_16478 ?auto_16479 ) ( AVAILABLE ?auto_16478 ) ( SURFACE-AT ?auto_16463 ?auto_16479 ) ( ON ?auto_16463 ?auto_16477 ) ( CLEAR ?auto_16463 ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( not ( = ?auto_16462 ?auto_16477 ) ) ( not ( = ?auto_16463 ?auto_16477 ) ) ( not ( = ?auto_16465 ?auto_16478 ) ) ( IS-CRATE ?auto_16462 ) ( not ( = ?auto_16476 ?auto_16469 ) ) ( HOIST-AT ?auto_16474 ?auto_16476 ) ( AVAILABLE ?auto_16474 ) ( SURFACE-AT ?auto_16462 ?auto_16476 ) ( ON ?auto_16462 ?auto_16471 ) ( CLEAR ?auto_16462 ) ( not ( = ?auto_16461 ?auto_16462 ) ) ( not ( = ?auto_16461 ?auto_16471 ) ) ( not ( = ?auto_16462 ?auto_16471 ) ) ( not ( = ?auto_16465 ?auto_16474 ) ) ( SURFACE-AT ?auto_16460 ?auto_16469 ) ( CLEAR ?auto_16460 ) ( IS-CRATE ?auto_16461 ) ( AVAILABLE ?auto_16465 ) ( not ( = ?auto_16475 ?auto_16469 ) ) ( HOIST-AT ?auto_16473 ?auto_16475 ) ( AVAILABLE ?auto_16473 ) ( SURFACE-AT ?auto_16461 ?auto_16475 ) ( ON ?auto_16461 ?auto_16472 ) ( CLEAR ?auto_16461 ) ( TRUCK-AT ?auto_16467 ?auto_16469 ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16472 ) ) ( not ( = ?auto_16461 ?auto_16472 ) ) ( not ( = ?auto_16465 ?auto_16473 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16471 ) ) ( not ( = ?auto_16462 ?auto_16472 ) ) ( not ( = ?auto_16476 ?auto_16475 ) ) ( not ( = ?auto_16474 ?auto_16473 ) ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( not ( = ?auto_16460 ?auto_16463 ) ) ( not ( = ?auto_16460 ?auto_16477 ) ) ( not ( = ?auto_16461 ?auto_16463 ) ) ( not ( = ?auto_16461 ?auto_16477 ) ) ( not ( = ?auto_16463 ?auto_16471 ) ) ( not ( = ?auto_16463 ?auto_16472 ) ) ( not ( = ?auto_16479 ?auto_16476 ) ) ( not ( = ?auto_16479 ?auto_16475 ) ) ( not ( = ?auto_16478 ?auto_16474 ) ) ( not ( = ?auto_16478 ?auto_16473 ) ) ( not ( = ?auto_16477 ?auto_16471 ) ) ( not ( = ?auto_16477 ?auto_16472 ) ) ( not ( = ?auto_16460 ?auto_16464 ) ) ( not ( = ?auto_16460 ?auto_16470 ) ) ( not ( = ?auto_16461 ?auto_16464 ) ) ( not ( = ?auto_16461 ?auto_16470 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( not ( = ?auto_16462 ?auto_16470 ) ) ( not ( = ?auto_16464 ?auto_16477 ) ) ( not ( = ?auto_16464 ?auto_16471 ) ) ( not ( = ?auto_16464 ?auto_16472 ) ) ( not ( = ?auto_16468 ?auto_16479 ) ) ( not ( = ?auto_16468 ?auto_16476 ) ) ( not ( = ?auto_16468 ?auto_16475 ) ) ( not ( = ?auto_16466 ?auto_16478 ) ) ( not ( = ?auto_16466 ?auto_16474 ) ) ( not ( = ?auto_16466 ?auto_16473 ) ) ( not ( = ?auto_16470 ?auto_16477 ) ) ( not ( = ?auto_16470 ?auto_16471 ) ) ( not ( = ?auto_16470 ?auto_16472 ) ) )
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
      ?auto_16505 - HOIST
      ?auto_16507 - PLACE
      ?auto_16502 - PLACE
      ?auto_16503 - HOIST
      ?auto_16504 - SURFACE
      ?auto_16514 - PLACE
      ?auto_16515 - HOIST
      ?auto_16508 - SURFACE
      ?auto_16509 - PLACE
      ?auto_16513 - HOIST
      ?auto_16512 - SURFACE
      ?auto_16516 - PLACE
      ?auto_16511 - HOIST
      ?auto_16518 - SURFACE
      ?auto_16517 - PLACE
      ?auto_16519 - HOIST
      ?auto_16510 - SURFACE
      ?auto_16506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16505 ?auto_16507 ) ( IS-CRATE ?auto_16501 ) ( not ( = ?auto_16502 ?auto_16507 ) ) ( HOIST-AT ?auto_16503 ?auto_16502 ) ( AVAILABLE ?auto_16503 ) ( SURFACE-AT ?auto_16501 ?auto_16502 ) ( ON ?auto_16501 ?auto_16504 ) ( CLEAR ?auto_16501 ) ( not ( = ?auto_16500 ?auto_16501 ) ) ( not ( = ?auto_16500 ?auto_16504 ) ) ( not ( = ?auto_16501 ?auto_16504 ) ) ( not ( = ?auto_16505 ?auto_16503 ) ) ( IS-CRATE ?auto_16500 ) ( not ( = ?auto_16514 ?auto_16507 ) ) ( HOIST-AT ?auto_16515 ?auto_16514 ) ( AVAILABLE ?auto_16515 ) ( SURFACE-AT ?auto_16500 ?auto_16514 ) ( ON ?auto_16500 ?auto_16508 ) ( CLEAR ?auto_16500 ) ( not ( = ?auto_16499 ?auto_16500 ) ) ( not ( = ?auto_16499 ?auto_16508 ) ) ( not ( = ?auto_16500 ?auto_16508 ) ) ( not ( = ?auto_16505 ?auto_16515 ) ) ( IS-CRATE ?auto_16499 ) ( not ( = ?auto_16509 ?auto_16507 ) ) ( HOIST-AT ?auto_16513 ?auto_16509 ) ( AVAILABLE ?auto_16513 ) ( SURFACE-AT ?auto_16499 ?auto_16509 ) ( ON ?auto_16499 ?auto_16512 ) ( CLEAR ?auto_16499 ) ( not ( = ?auto_16498 ?auto_16499 ) ) ( not ( = ?auto_16498 ?auto_16512 ) ) ( not ( = ?auto_16499 ?auto_16512 ) ) ( not ( = ?auto_16505 ?auto_16513 ) ) ( IS-CRATE ?auto_16498 ) ( not ( = ?auto_16516 ?auto_16507 ) ) ( HOIST-AT ?auto_16511 ?auto_16516 ) ( AVAILABLE ?auto_16511 ) ( SURFACE-AT ?auto_16498 ?auto_16516 ) ( ON ?auto_16498 ?auto_16518 ) ( CLEAR ?auto_16498 ) ( not ( = ?auto_16497 ?auto_16498 ) ) ( not ( = ?auto_16497 ?auto_16518 ) ) ( not ( = ?auto_16498 ?auto_16518 ) ) ( not ( = ?auto_16505 ?auto_16511 ) ) ( SURFACE-AT ?auto_16496 ?auto_16507 ) ( CLEAR ?auto_16496 ) ( IS-CRATE ?auto_16497 ) ( AVAILABLE ?auto_16505 ) ( not ( = ?auto_16517 ?auto_16507 ) ) ( HOIST-AT ?auto_16519 ?auto_16517 ) ( AVAILABLE ?auto_16519 ) ( SURFACE-AT ?auto_16497 ?auto_16517 ) ( ON ?auto_16497 ?auto_16510 ) ( CLEAR ?auto_16497 ) ( TRUCK-AT ?auto_16506 ?auto_16507 ) ( not ( = ?auto_16496 ?auto_16497 ) ) ( not ( = ?auto_16496 ?auto_16510 ) ) ( not ( = ?auto_16497 ?auto_16510 ) ) ( not ( = ?auto_16505 ?auto_16519 ) ) ( not ( = ?auto_16496 ?auto_16498 ) ) ( not ( = ?auto_16496 ?auto_16518 ) ) ( not ( = ?auto_16498 ?auto_16510 ) ) ( not ( = ?auto_16516 ?auto_16517 ) ) ( not ( = ?auto_16511 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16510 ) ) ( not ( = ?auto_16496 ?auto_16499 ) ) ( not ( = ?auto_16496 ?auto_16512 ) ) ( not ( = ?auto_16497 ?auto_16499 ) ) ( not ( = ?auto_16497 ?auto_16512 ) ) ( not ( = ?auto_16499 ?auto_16518 ) ) ( not ( = ?auto_16499 ?auto_16510 ) ) ( not ( = ?auto_16509 ?auto_16516 ) ) ( not ( = ?auto_16509 ?auto_16517 ) ) ( not ( = ?auto_16513 ?auto_16511 ) ) ( not ( = ?auto_16513 ?auto_16519 ) ) ( not ( = ?auto_16512 ?auto_16518 ) ) ( not ( = ?auto_16512 ?auto_16510 ) ) ( not ( = ?auto_16496 ?auto_16500 ) ) ( not ( = ?auto_16496 ?auto_16508 ) ) ( not ( = ?auto_16497 ?auto_16500 ) ) ( not ( = ?auto_16497 ?auto_16508 ) ) ( not ( = ?auto_16498 ?auto_16500 ) ) ( not ( = ?auto_16498 ?auto_16508 ) ) ( not ( = ?auto_16500 ?auto_16512 ) ) ( not ( = ?auto_16500 ?auto_16518 ) ) ( not ( = ?auto_16500 ?auto_16510 ) ) ( not ( = ?auto_16514 ?auto_16509 ) ) ( not ( = ?auto_16514 ?auto_16516 ) ) ( not ( = ?auto_16514 ?auto_16517 ) ) ( not ( = ?auto_16515 ?auto_16513 ) ) ( not ( = ?auto_16515 ?auto_16511 ) ) ( not ( = ?auto_16515 ?auto_16519 ) ) ( not ( = ?auto_16508 ?auto_16512 ) ) ( not ( = ?auto_16508 ?auto_16518 ) ) ( not ( = ?auto_16508 ?auto_16510 ) ) ( not ( = ?auto_16496 ?auto_16501 ) ) ( not ( = ?auto_16496 ?auto_16504 ) ) ( not ( = ?auto_16497 ?auto_16501 ) ) ( not ( = ?auto_16497 ?auto_16504 ) ) ( not ( = ?auto_16498 ?auto_16501 ) ) ( not ( = ?auto_16498 ?auto_16504 ) ) ( not ( = ?auto_16499 ?auto_16501 ) ) ( not ( = ?auto_16499 ?auto_16504 ) ) ( not ( = ?auto_16501 ?auto_16508 ) ) ( not ( = ?auto_16501 ?auto_16512 ) ) ( not ( = ?auto_16501 ?auto_16518 ) ) ( not ( = ?auto_16501 ?auto_16510 ) ) ( not ( = ?auto_16502 ?auto_16514 ) ) ( not ( = ?auto_16502 ?auto_16509 ) ) ( not ( = ?auto_16502 ?auto_16516 ) ) ( not ( = ?auto_16502 ?auto_16517 ) ) ( not ( = ?auto_16503 ?auto_16515 ) ) ( not ( = ?auto_16503 ?auto_16513 ) ) ( not ( = ?auto_16503 ?auto_16511 ) ) ( not ( = ?auto_16503 ?auto_16519 ) ) ( not ( = ?auto_16504 ?auto_16508 ) ) ( not ( = ?auto_16504 ?auto_16512 ) ) ( not ( = ?auto_16504 ?auto_16518 ) ) ( not ( = ?auto_16504 ?auto_16510 ) ) )
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
      ?auto_16544 - HOIST
      ?auto_16549 - PLACE
      ?auto_16548 - PLACE
      ?auto_16546 - HOIST
      ?auto_16547 - SURFACE
      ?auto_16560 - PLACE
      ?auto_16550 - HOIST
      ?auto_16559 - SURFACE
      ?auto_16558 - PLACE
      ?auto_16552 - HOIST
      ?auto_16557 - SURFACE
      ?auto_16562 - PLACE
      ?auto_16555 - HOIST
      ?auto_16554 - SURFACE
      ?auto_16563 - PLACE
      ?auto_16556 - HOIST
      ?auto_16553 - SURFACE
      ?auto_16551 - PLACE
      ?auto_16564 - HOIST
      ?auto_16561 - SURFACE
      ?auto_16545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16544 ?auto_16549 ) ( IS-CRATE ?auto_16543 ) ( not ( = ?auto_16548 ?auto_16549 ) ) ( HOIST-AT ?auto_16546 ?auto_16548 ) ( AVAILABLE ?auto_16546 ) ( SURFACE-AT ?auto_16543 ?auto_16548 ) ( ON ?auto_16543 ?auto_16547 ) ( CLEAR ?auto_16543 ) ( not ( = ?auto_16542 ?auto_16543 ) ) ( not ( = ?auto_16542 ?auto_16547 ) ) ( not ( = ?auto_16543 ?auto_16547 ) ) ( not ( = ?auto_16544 ?auto_16546 ) ) ( IS-CRATE ?auto_16542 ) ( not ( = ?auto_16560 ?auto_16549 ) ) ( HOIST-AT ?auto_16550 ?auto_16560 ) ( AVAILABLE ?auto_16550 ) ( SURFACE-AT ?auto_16542 ?auto_16560 ) ( ON ?auto_16542 ?auto_16559 ) ( CLEAR ?auto_16542 ) ( not ( = ?auto_16541 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16559 ) ) ( not ( = ?auto_16542 ?auto_16559 ) ) ( not ( = ?auto_16544 ?auto_16550 ) ) ( IS-CRATE ?auto_16541 ) ( not ( = ?auto_16558 ?auto_16549 ) ) ( HOIST-AT ?auto_16552 ?auto_16558 ) ( AVAILABLE ?auto_16552 ) ( SURFACE-AT ?auto_16541 ?auto_16558 ) ( ON ?auto_16541 ?auto_16557 ) ( CLEAR ?auto_16541 ) ( not ( = ?auto_16540 ?auto_16541 ) ) ( not ( = ?auto_16540 ?auto_16557 ) ) ( not ( = ?auto_16541 ?auto_16557 ) ) ( not ( = ?auto_16544 ?auto_16552 ) ) ( IS-CRATE ?auto_16540 ) ( not ( = ?auto_16562 ?auto_16549 ) ) ( HOIST-AT ?auto_16555 ?auto_16562 ) ( AVAILABLE ?auto_16555 ) ( SURFACE-AT ?auto_16540 ?auto_16562 ) ( ON ?auto_16540 ?auto_16554 ) ( CLEAR ?auto_16540 ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( not ( = ?auto_16539 ?auto_16554 ) ) ( not ( = ?auto_16540 ?auto_16554 ) ) ( not ( = ?auto_16544 ?auto_16555 ) ) ( IS-CRATE ?auto_16539 ) ( not ( = ?auto_16563 ?auto_16549 ) ) ( HOIST-AT ?auto_16556 ?auto_16563 ) ( AVAILABLE ?auto_16556 ) ( SURFACE-AT ?auto_16539 ?auto_16563 ) ( ON ?auto_16539 ?auto_16553 ) ( CLEAR ?auto_16539 ) ( not ( = ?auto_16538 ?auto_16539 ) ) ( not ( = ?auto_16538 ?auto_16553 ) ) ( not ( = ?auto_16539 ?auto_16553 ) ) ( not ( = ?auto_16544 ?auto_16556 ) ) ( SURFACE-AT ?auto_16537 ?auto_16549 ) ( CLEAR ?auto_16537 ) ( IS-CRATE ?auto_16538 ) ( AVAILABLE ?auto_16544 ) ( not ( = ?auto_16551 ?auto_16549 ) ) ( HOIST-AT ?auto_16564 ?auto_16551 ) ( AVAILABLE ?auto_16564 ) ( SURFACE-AT ?auto_16538 ?auto_16551 ) ( ON ?auto_16538 ?auto_16561 ) ( CLEAR ?auto_16538 ) ( TRUCK-AT ?auto_16545 ?auto_16549 ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( not ( = ?auto_16537 ?auto_16561 ) ) ( not ( = ?auto_16538 ?auto_16561 ) ) ( not ( = ?auto_16544 ?auto_16564 ) ) ( not ( = ?auto_16537 ?auto_16539 ) ) ( not ( = ?auto_16537 ?auto_16553 ) ) ( not ( = ?auto_16539 ?auto_16561 ) ) ( not ( = ?auto_16563 ?auto_16551 ) ) ( not ( = ?auto_16556 ?auto_16564 ) ) ( not ( = ?auto_16553 ?auto_16561 ) ) ( not ( = ?auto_16537 ?auto_16540 ) ) ( not ( = ?auto_16537 ?auto_16554 ) ) ( not ( = ?auto_16538 ?auto_16540 ) ) ( not ( = ?auto_16538 ?auto_16554 ) ) ( not ( = ?auto_16540 ?auto_16553 ) ) ( not ( = ?auto_16540 ?auto_16561 ) ) ( not ( = ?auto_16562 ?auto_16563 ) ) ( not ( = ?auto_16562 ?auto_16551 ) ) ( not ( = ?auto_16555 ?auto_16556 ) ) ( not ( = ?auto_16555 ?auto_16564 ) ) ( not ( = ?auto_16554 ?auto_16553 ) ) ( not ( = ?auto_16554 ?auto_16561 ) ) ( not ( = ?auto_16537 ?auto_16541 ) ) ( not ( = ?auto_16537 ?auto_16557 ) ) ( not ( = ?auto_16538 ?auto_16541 ) ) ( not ( = ?auto_16538 ?auto_16557 ) ) ( not ( = ?auto_16539 ?auto_16541 ) ) ( not ( = ?auto_16539 ?auto_16557 ) ) ( not ( = ?auto_16541 ?auto_16554 ) ) ( not ( = ?auto_16541 ?auto_16553 ) ) ( not ( = ?auto_16541 ?auto_16561 ) ) ( not ( = ?auto_16558 ?auto_16562 ) ) ( not ( = ?auto_16558 ?auto_16563 ) ) ( not ( = ?auto_16558 ?auto_16551 ) ) ( not ( = ?auto_16552 ?auto_16555 ) ) ( not ( = ?auto_16552 ?auto_16556 ) ) ( not ( = ?auto_16552 ?auto_16564 ) ) ( not ( = ?auto_16557 ?auto_16554 ) ) ( not ( = ?auto_16557 ?auto_16553 ) ) ( not ( = ?auto_16557 ?auto_16561 ) ) ( not ( = ?auto_16537 ?auto_16542 ) ) ( not ( = ?auto_16537 ?auto_16559 ) ) ( not ( = ?auto_16538 ?auto_16542 ) ) ( not ( = ?auto_16538 ?auto_16559 ) ) ( not ( = ?auto_16539 ?auto_16542 ) ) ( not ( = ?auto_16539 ?auto_16559 ) ) ( not ( = ?auto_16540 ?auto_16542 ) ) ( not ( = ?auto_16540 ?auto_16559 ) ) ( not ( = ?auto_16542 ?auto_16557 ) ) ( not ( = ?auto_16542 ?auto_16554 ) ) ( not ( = ?auto_16542 ?auto_16553 ) ) ( not ( = ?auto_16542 ?auto_16561 ) ) ( not ( = ?auto_16560 ?auto_16558 ) ) ( not ( = ?auto_16560 ?auto_16562 ) ) ( not ( = ?auto_16560 ?auto_16563 ) ) ( not ( = ?auto_16560 ?auto_16551 ) ) ( not ( = ?auto_16550 ?auto_16552 ) ) ( not ( = ?auto_16550 ?auto_16555 ) ) ( not ( = ?auto_16550 ?auto_16556 ) ) ( not ( = ?auto_16550 ?auto_16564 ) ) ( not ( = ?auto_16559 ?auto_16557 ) ) ( not ( = ?auto_16559 ?auto_16554 ) ) ( not ( = ?auto_16559 ?auto_16553 ) ) ( not ( = ?auto_16559 ?auto_16561 ) ) ( not ( = ?auto_16537 ?auto_16543 ) ) ( not ( = ?auto_16537 ?auto_16547 ) ) ( not ( = ?auto_16538 ?auto_16543 ) ) ( not ( = ?auto_16538 ?auto_16547 ) ) ( not ( = ?auto_16539 ?auto_16543 ) ) ( not ( = ?auto_16539 ?auto_16547 ) ) ( not ( = ?auto_16540 ?auto_16543 ) ) ( not ( = ?auto_16540 ?auto_16547 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( not ( = ?auto_16541 ?auto_16547 ) ) ( not ( = ?auto_16543 ?auto_16559 ) ) ( not ( = ?auto_16543 ?auto_16557 ) ) ( not ( = ?auto_16543 ?auto_16554 ) ) ( not ( = ?auto_16543 ?auto_16553 ) ) ( not ( = ?auto_16543 ?auto_16561 ) ) ( not ( = ?auto_16548 ?auto_16560 ) ) ( not ( = ?auto_16548 ?auto_16558 ) ) ( not ( = ?auto_16548 ?auto_16562 ) ) ( not ( = ?auto_16548 ?auto_16563 ) ) ( not ( = ?auto_16548 ?auto_16551 ) ) ( not ( = ?auto_16546 ?auto_16550 ) ) ( not ( = ?auto_16546 ?auto_16552 ) ) ( not ( = ?auto_16546 ?auto_16555 ) ) ( not ( = ?auto_16546 ?auto_16556 ) ) ( not ( = ?auto_16546 ?auto_16564 ) ) ( not ( = ?auto_16547 ?auto_16559 ) ) ( not ( = ?auto_16547 ?auto_16557 ) ) ( not ( = ?auto_16547 ?auto_16554 ) ) ( not ( = ?auto_16547 ?auto_16553 ) ) ( not ( = ?auto_16547 ?auto_16561 ) ) )
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
      ?auto_16591 - HOIST
      ?auto_16594 - PLACE
      ?auto_16595 - PLACE
      ?auto_16593 - HOIST
      ?auto_16592 - SURFACE
      ?auto_16607 - PLACE
      ?auto_16606 - HOIST
      ?auto_16611 - SURFACE
      ?auto_16614 - PLACE
      ?auto_16609 - HOIST
      ?auto_16602 - SURFACE
      ?auto_16599 - PLACE
      ?auto_16603 - HOIST
      ?auto_16612 - SURFACE
      ?auto_16605 - PLACE
      ?auto_16613 - HOIST
      ?auto_16600 - SURFACE
      ?auto_16608 - PLACE
      ?auto_16597 - HOIST
      ?auto_16610 - SURFACE
      ?auto_16601 - PLACE
      ?auto_16604 - HOIST
      ?auto_16598 - SURFACE
      ?auto_16596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16591 ?auto_16594 ) ( IS-CRATE ?auto_16590 ) ( not ( = ?auto_16595 ?auto_16594 ) ) ( HOIST-AT ?auto_16593 ?auto_16595 ) ( AVAILABLE ?auto_16593 ) ( SURFACE-AT ?auto_16590 ?auto_16595 ) ( ON ?auto_16590 ?auto_16592 ) ( CLEAR ?auto_16590 ) ( not ( = ?auto_16589 ?auto_16590 ) ) ( not ( = ?auto_16589 ?auto_16592 ) ) ( not ( = ?auto_16590 ?auto_16592 ) ) ( not ( = ?auto_16591 ?auto_16593 ) ) ( IS-CRATE ?auto_16589 ) ( not ( = ?auto_16607 ?auto_16594 ) ) ( HOIST-AT ?auto_16606 ?auto_16607 ) ( AVAILABLE ?auto_16606 ) ( SURFACE-AT ?auto_16589 ?auto_16607 ) ( ON ?auto_16589 ?auto_16611 ) ( CLEAR ?auto_16589 ) ( not ( = ?auto_16588 ?auto_16589 ) ) ( not ( = ?auto_16588 ?auto_16611 ) ) ( not ( = ?auto_16589 ?auto_16611 ) ) ( not ( = ?auto_16591 ?auto_16606 ) ) ( IS-CRATE ?auto_16588 ) ( not ( = ?auto_16614 ?auto_16594 ) ) ( HOIST-AT ?auto_16609 ?auto_16614 ) ( AVAILABLE ?auto_16609 ) ( SURFACE-AT ?auto_16588 ?auto_16614 ) ( ON ?auto_16588 ?auto_16602 ) ( CLEAR ?auto_16588 ) ( not ( = ?auto_16587 ?auto_16588 ) ) ( not ( = ?auto_16587 ?auto_16602 ) ) ( not ( = ?auto_16588 ?auto_16602 ) ) ( not ( = ?auto_16591 ?auto_16609 ) ) ( IS-CRATE ?auto_16587 ) ( not ( = ?auto_16599 ?auto_16594 ) ) ( HOIST-AT ?auto_16603 ?auto_16599 ) ( AVAILABLE ?auto_16603 ) ( SURFACE-AT ?auto_16587 ?auto_16599 ) ( ON ?auto_16587 ?auto_16612 ) ( CLEAR ?auto_16587 ) ( not ( = ?auto_16586 ?auto_16587 ) ) ( not ( = ?auto_16586 ?auto_16612 ) ) ( not ( = ?auto_16587 ?auto_16612 ) ) ( not ( = ?auto_16591 ?auto_16603 ) ) ( IS-CRATE ?auto_16586 ) ( not ( = ?auto_16605 ?auto_16594 ) ) ( HOIST-AT ?auto_16613 ?auto_16605 ) ( AVAILABLE ?auto_16613 ) ( SURFACE-AT ?auto_16586 ?auto_16605 ) ( ON ?auto_16586 ?auto_16600 ) ( CLEAR ?auto_16586 ) ( not ( = ?auto_16585 ?auto_16586 ) ) ( not ( = ?auto_16585 ?auto_16600 ) ) ( not ( = ?auto_16586 ?auto_16600 ) ) ( not ( = ?auto_16591 ?auto_16613 ) ) ( IS-CRATE ?auto_16585 ) ( not ( = ?auto_16608 ?auto_16594 ) ) ( HOIST-AT ?auto_16597 ?auto_16608 ) ( AVAILABLE ?auto_16597 ) ( SURFACE-AT ?auto_16585 ?auto_16608 ) ( ON ?auto_16585 ?auto_16610 ) ( CLEAR ?auto_16585 ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16610 ) ) ( not ( = ?auto_16585 ?auto_16610 ) ) ( not ( = ?auto_16591 ?auto_16597 ) ) ( SURFACE-AT ?auto_16583 ?auto_16594 ) ( CLEAR ?auto_16583 ) ( IS-CRATE ?auto_16584 ) ( AVAILABLE ?auto_16591 ) ( not ( = ?auto_16601 ?auto_16594 ) ) ( HOIST-AT ?auto_16604 ?auto_16601 ) ( AVAILABLE ?auto_16604 ) ( SURFACE-AT ?auto_16584 ?auto_16601 ) ( ON ?auto_16584 ?auto_16598 ) ( CLEAR ?auto_16584 ) ( TRUCK-AT ?auto_16596 ?auto_16594 ) ( not ( = ?auto_16583 ?auto_16584 ) ) ( not ( = ?auto_16583 ?auto_16598 ) ) ( not ( = ?auto_16584 ?auto_16598 ) ) ( not ( = ?auto_16591 ?auto_16604 ) ) ( not ( = ?auto_16583 ?auto_16585 ) ) ( not ( = ?auto_16583 ?auto_16610 ) ) ( not ( = ?auto_16585 ?auto_16598 ) ) ( not ( = ?auto_16608 ?auto_16601 ) ) ( not ( = ?auto_16597 ?auto_16604 ) ) ( not ( = ?auto_16610 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( not ( = ?auto_16583 ?auto_16600 ) ) ( not ( = ?auto_16584 ?auto_16586 ) ) ( not ( = ?auto_16584 ?auto_16600 ) ) ( not ( = ?auto_16586 ?auto_16610 ) ) ( not ( = ?auto_16586 ?auto_16598 ) ) ( not ( = ?auto_16605 ?auto_16608 ) ) ( not ( = ?auto_16605 ?auto_16601 ) ) ( not ( = ?auto_16613 ?auto_16597 ) ) ( not ( = ?auto_16613 ?auto_16604 ) ) ( not ( = ?auto_16600 ?auto_16610 ) ) ( not ( = ?auto_16600 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16587 ) ) ( not ( = ?auto_16583 ?auto_16612 ) ) ( not ( = ?auto_16584 ?auto_16587 ) ) ( not ( = ?auto_16584 ?auto_16612 ) ) ( not ( = ?auto_16585 ?auto_16587 ) ) ( not ( = ?auto_16585 ?auto_16612 ) ) ( not ( = ?auto_16587 ?auto_16600 ) ) ( not ( = ?auto_16587 ?auto_16610 ) ) ( not ( = ?auto_16587 ?auto_16598 ) ) ( not ( = ?auto_16599 ?auto_16605 ) ) ( not ( = ?auto_16599 ?auto_16608 ) ) ( not ( = ?auto_16599 ?auto_16601 ) ) ( not ( = ?auto_16603 ?auto_16613 ) ) ( not ( = ?auto_16603 ?auto_16597 ) ) ( not ( = ?auto_16603 ?auto_16604 ) ) ( not ( = ?auto_16612 ?auto_16600 ) ) ( not ( = ?auto_16612 ?auto_16610 ) ) ( not ( = ?auto_16612 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16588 ) ) ( not ( = ?auto_16583 ?auto_16602 ) ) ( not ( = ?auto_16584 ?auto_16588 ) ) ( not ( = ?auto_16584 ?auto_16602 ) ) ( not ( = ?auto_16585 ?auto_16588 ) ) ( not ( = ?auto_16585 ?auto_16602 ) ) ( not ( = ?auto_16586 ?auto_16588 ) ) ( not ( = ?auto_16586 ?auto_16602 ) ) ( not ( = ?auto_16588 ?auto_16612 ) ) ( not ( = ?auto_16588 ?auto_16600 ) ) ( not ( = ?auto_16588 ?auto_16610 ) ) ( not ( = ?auto_16588 ?auto_16598 ) ) ( not ( = ?auto_16614 ?auto_16599 ) ) ( not ( = ?auto_16614 ?auto_16605 ) ) ( not ( = ?auto_16614 ?auto_16608 ) ) ( not ( = ?auto_16614 ?auto_16601 ) ) ( not ( = ?auto_16609 ?auto_16603 ) ) ( not ( = ?auto_16609 ?auto_16613 ) ) ( not ( = ?auto_16609 ?auto_16597 ) ) ( not ( = ?auto_16609 ?auto_16604 ) ) ( not ( = ?auto_16602 ?auto_16612 ) ) ( not ( = ?auto_16602 ?auto_16600 ) ) ( not ( = ?auto_16602 ?auto_16610 ) ) ( not ( = ?auto_16602 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16589 ) ) ( not ( = ?auto_16583 ?auto_16611 ) ) ( not ( = ?auto_16584 ?auto_16589 ) ) ( not ( = ?auto_16584 ?auto_16611 ) ) ( not ( = ?auto_16585 ?auto_16589 ) ) ( not ( = ?auto_16585 ?auto_16611 ) ) ( not ( = ?auto_16586 ?auto_16589 ) ) ( not ( = ?auto_16586 ?auto_16611 ) ) ( not ( = ?auto_16587 ?auto_16589 ) ) ( not ( = ?auto_16587 ?auto_16611 ) ) ( not ( = ?auto_16589 ?auto_16602 ) ) ( not ( = ?auto_16589 ?auto_16612 ) ) ( not ( = ?auto_16589 ?auto_16600 ) ) ( not ( = ?auto_16589 ?auto_16610 ) ) ( not ( = ?auto_16589 ?auto_16598 ) ) ( not ( = ?auto_16607 ?auto_16614 ) ) ( not ( = ?auto_16607 ?auto_16599 ) ) ( not ( = ?auto_16607 ?auto_16605 ) ) ( not ( = ?auto_16607 ?auto_16608 ) ) ( not ( = ?auto_16607 ?auto_16601 ) ) ( not ( = ?auto_16606 ?auto_16609 ) ) ( not ( = ?auto_16606 ?auto_16603 ) ) ( not ( = ?auto_16606 ?auto_16613 ) ) ( not ( = ?auto_16606 ?auto_16597 ) ) ( not ( = ?auto_16606 ?auto_16604 ) ) ( not ( = ?auto_16611 ?auto_16602 ) ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( not ( = ?auto_16611 ?auto_16600 ) ) ( not ( = ?auto_16611 ?auto_16610 ) ) ( not ( = ?auto_16611 ?auto_16598 ) ) ( not ( = ?auto_16583 ?auto_16590 ) ) ( not ( = ?auto_16583 ?auto_16592 ) ) ( not ( = ?auto_16584 ?auto_16590 ) ) ( not ( = ?auto_16584 ?auto_16592 ) ) ( not ( = ?auto_16585 ?auto_16590 ) ) ( not ( = ?auto_16585 ?auto_16592 ) ) ( not ( = ?auto_16586 ?auto_16590 ) ) ( not ( = ?auto_16586 ?auto_16592 ) ) ( not ( = ?auto_16587 ?auto_16590 ) ) ( not ( = ?auto_16587 ?auto_16592 ) ) ( not ( = ?auto_16588 ?auto_16590 ) ) ( not ( = ?auto_16588 ?auto_16592 ) ) ( not ( = ?auto_16590 ?auto_16611 ) ) ( not ( = ?auto_16590 ?auto_16602 ) ) ( not ( = ?auto_16590 ?auto_16612 ) ) ( not ( = ?auto_16590 ?auto_16600 ) ) ( not ( = ?auto_16590 ?auto_16610 ) ) ( not ( = ?auto_16590 ?auto_16598 ) ) ( not ( = ?auto_16595 ?auto_16607 ) ) ( not ( = ?auto_16595 ?auto_16614 ) ) ( not ( = ?auto_16595 ?auto_16599 ) ) ( not ( = ?auto_16595 ?auto_16605 ) ) ( not ( = ?auto_16595 ?auto_16608 ) ) ( not ( = ?auto_16595 ?auto_16601 ) ) ( not ( = ?auto_16593 ?auto_16606 ) ) ( not ( = ?auto_16593 ?auto_16609 ) ) ( not ( = ?auto_16593 ?auto_16603 ) ) ( not ( = ?auto_16593 ?auto_16613 ) ) ( not ( = ?auto_16593 ?auto_16597 ) ) ( not ( = ?auto_16593 ?auto_16604 ) ) ( not ( = ?auto_16592 ?auto_16611 ) ) ( not ( = ?auto_16592 ?auto_16602 ) ) ( not ( = ?auto_16592 ?auto_16612 ) ) ( not ( = ?auto_16592 ?auto_16600 ) ) ( not ( = ?auto_16592 ?auto_16610 ) ) ( not ( = ?auto_16592 ?auto_16598 ) ) )
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
      ?auto_16643 - HOIST
      ?auto_16645 - PLACE
      ?auto_16647 - PLACE
      ?auto_16648 - HOIST
      ?auto_16646 - SURFACE
      ?auto_16667 - PLACE
      ?auto_16653 - HOIST
      ?auto_16655 - SURFACE
      ?auto_16651 - PLACE
      ?auto_16666 - HOIST
      ?auto_16664 - SURFACE
      ?auto_16654 - PLACE
      ?auto_16669 - HOIST
      ?auto_16663 - SURFACE
      ?auto_16649 - PLACE
      ?auto_16661 - HOIST
      ?auto_16657 - SURFACE
      ?auto_16650 - PLACE
      ?auto_16662 - HOIST
      ?auto_16668 - SURFACE
      ?auto_16665 - PLACE
      ?auto_16659 - HOIST
      ?auto_16658 - SURFACE
      ?auto_16652 - PLACE
      ?auto_16660 - HOIST
      ?auto_16656 - SURFACE
      ?auto_16644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16643 ?auto_16645 ) ( IS-CRATE ?auto_16642 ) ( not ( = ?auto_16647 ?auto_16645 ) ) ( HOIST-AT ?auto_16648 ?auto_16647 ) ( AVAILABLE ?auto_16648 ) ( SURFACE-AT ?auto_16642 ?auto_16647 ) ( ON ?auto_16642 ?auto_16646 ) ( CLEAR ?auto_16642 ) ( not ( = ?auto_16641 ?auto_16642 ) ) ( not ( = ?auto_16641 ?auto_16646 ) ) ( not ( = ?auto_16642 ?auto_16646 ) ) ( not ( = ?auto_16643 ?auto_16648 ) ) ( IS-CRATE ?auto_16641 ) ( not ( = ?auto_16667 ?auto_16645 ) ) ( HOIST-AT ?auto_16653 ?auto_16667 ) ( AVAILABLE ?auto_16653 ) ( SURFACE-AT ?auto_16641 ?auto_16667 ) ( ON ?auto_16641 ?auto_16655 ) ( CLEAR ?auto_16641 ) ( not ( = ?auto_16640 ?auto_16641 ) ) ( not ( = ?auto_16640 ?auto_16655 ) ) ( not ( = ?auto_16641 ?auto_16655 ) ) ( not ( = ?auto_16643 ?auto_16653 ) ) ( IS-CRATE ?auto_16640 ) ( not ( = ?auto_16651 ?auto_16645 ) ) ( HOIST-AT ?auto_16666 ?auto_16651 ) ( AVAILABLE ?auto_16666 ) ( SURFACE-AT ?auto_16640 ?auto_16651 ) ( ON ?auto_16640 ?auto_16664 ) ( CLEAR ?auto_16640 ) ( not ( = ?auto_16639 ?auto_16640 ) ) ( not ( = ?auto_16639 ?auto_16664 ) ) ( not ( = ?auto_16640 ?auto_16664 ) ) ( not ( = ?auto_16643 ?auto_16666 ) ) ( IS-CRATE ?auto_16639 ) ( not ( = ?auto_16654 ?auto_16645 ) ) ( HOIST-AT ?auto_16669 ?auto_16654 ) ( AVAILABLE ?auto_16669 ) ( SURFACE-AT ?auto_16639 ?auto_16654 ) ( ON ?auto_16639 ?auto_16663 ) ( CLEAR ?auto_16639 ) ( not ( = ?auto_16638 ?auto_16639 ) ) ( not ( = ?auto_16638 ?auto_16663 ) ) ( not ( = ?auto_16639 ?auto_16663 ) ) ( not ( = ?auto_16643 ?auto_16669 ) ) ( IS-CRATE ?auto_16638 ) ( not ( = ?auto_16649 ?auto_16645 ) ) ( HOIST-AT ?auto_16661 ?auto_16649 ) ( AVAILABLE ?auto_16661 ) ( SURFACE-AT ?auto_16638 ?auto_16649 ) ( ON ?auto_16638 ?auto_16657 ) ( CLEAR ?auto_16638 ) ( not ( = ?auto_16637 ?auto_16638 ) ) ( not ( = ?auto_16637 ?auto_16657 ) ) ( not ( = ?auto_16638 ?auto_16657 ) ) ( not ( = ?auto_16643 ?auto_16661 ) ) ( IS-CRATE ?auto_16637 ) ( not ( = ?auto_16650 ?auto_16645 ) ) ( HOIST-AT ?auto_16662 ?auto_16650 ) ( AVAILABLE ?auto_16662 ) ( SURFACE-AT ?auto_16637 ?auto_16650 ) ( ON ?auto_16637 ?auto_16668 ) ( CLEAR ?auto_16637 ) ( not ( = ?auto_16636 ?auto_16637 ) ) ( not ( = ?auto_16636 ?auto_16668 ) ) ( not ( = ?auto_16637 ?auto_16668 ) ) ( not ( = ?auto_16643 ?auto_16662 ) ) ( IS-CRATE ?auto_16636 ) ( not ( = ?auto_16665 ?auto_16645 ) ) ( HOIST-AT ?auto_16659 ?auto_16665 ) ( AVAILABLE ?auto_16659 ) ( SURFACE-AT ?auto_16636 ?auto_16665 ) ( ON ?auto_16636 ?auto_16658 ) ( CLEAR ?auto_16636 ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( not ( = ?auto_16635 ?auto_16658 ) ) ( not ( = ?auto_16636 ?auto_16658 ) ) ( not ( = ?auto_16643 ?auto_16659 ) ) ( SURFACE-AT ?auto_16634 ?auto_16645 ) ( CLEAR ?auto_16634 ) ( IS-CRATE ?auto_16635 ) ( AVAILABLE ?auto_16643 ) ( not ( = ?auto_16652 ?auto_16645 ) ) ( HOIST-AT ?auto_16660 ?auto_16652 ) ( AVAILABLE ?auto_16660 ) ( SURFACE-AT ?auto_16635 ?auto_16652 ) ( ON ?auto_16635 ?auto_16656 ) ( CLEAR ?auto_16635 ) ( TRUCK-AT ?auto_16644 ?auto_16645 ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( not ( = ?auto_16634 ?auto_16656 ) ) ( not ( = ?auto_16635 ?auto_16656 ) ) ( not ( = ?auto_16643 ?auto_16660 ) ) ( not ( = ?auto_16634 ?auto_16636 ) ) ( not ( = ?auto_16634 ?auto_16658 ) ) ( not ( = ?auto_16636 ?auto_16656 ) ) ( not ( = ?auto_16665 ?auto_16652 ) ) ( not ( = ?auto_16659 ?auto_16660 ) ) ( not ( = ?auto_16658 ?auto_16656 ) ) ( not ( = ?auto_16634 ?auto_16637 ) ) ( not ( = ?auto_16634 ?auto_16668 ) ) ( not ( = ?auto_16635 ?auto_16637 ) ) ( not ( = ?auto_16635 ?auto_16668 ) ) ( not ( = ?auto_16637 ?auto_16658 ) ) ( not ( = ?auto_16637 ?auto_16656 ) ) ( not ( = ?auto_16650 ?auto_16665 ) ) ( not ( = ?auto_16650 ?auto_16652 ) ) ( not ( = ?auto_16662 ?auto_16659 ) ) ( not ( = ?auto_16662 ?auto_16660 ) ) ( not ( = ?auto_16668 ?auto_16658 ) ) ( not ( = ?auto_16668 ?auto_16656 ) ) ( not ( = ?auto_16634 ?auto_16638 ) ) ( not ( = ?auto_16634 ?auto_16657 ) ) ( not ( = ?auto_16635 ?auto_16638 ) ) ( not ( = ?auto_16635 ?auto_16657 ) ) ( not ( = ?auto_16636 ?auto_16638 ) ) ( not ( = ?auto_16636 ?auto_16657 ) ) ( not ( = ?auto_16638 ?auto_16668 ) ) ( not ( = ?auto_16638 ?auto_16658 ) ) ( not ( = ?auto_16638 ?auto_16656 ) ) ( not ( = ?auto_16649 ?auto_16650 ) ) ( not ( = ?auto_16649 ?auto_16665 ) ) ( not ( = ?auto_16649 ?auto_16652 ) ) ( not ( = ?auto_16661 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16659 ) ) ( not ( = ?auto_16661 ?auto_16660 ) ) ( not ( = ?auto_16657 ?auto_16668 ) ) ( not ( = ?auto_16657 ?auto_16658 ) ) ( not ( = ?auto_16657 ?auto_16656 ) ) ( not ( = ?auto_16634 ?auto_16639 ) ) ( not ( = ?auto_16634 ?auto_16663 ) ) ( not ( = ?auto_16635 ?auto_16639 ) ) ( not ( = ?auto_16635 ?auto_16663 ) ) ( not ( = ?auto_16636 ?auto_16639 ) ) ( not ( = ?auto_16636 ?auto_16663 ) ) ( not ( = ?auto_16637 ?auto_16639 ) ) ( not ( = ?auto_16637 ?auto_16663 ) ) ( not ( = ?auto_16639 ?auto_16657 ) ) ( not ( = ?auto_16639 ?auto_16668 ) ) ( not ( = ?auto_16639 ?auto_16658 ) ) ( not ( = ?auto_16639 ?auto_16656 ) ) ( not ( = ?auto_16654 ?auto_16649 ) ) ( not ( = ?auto_16654 ?auto_16650 ) ) ( not ( = ?auto_16654 ?auto_16665 ) ) ( not ( = ?auto_16654 ?auto_16652 ) ) ( not ( = ?auto_16669 ?auto_16661 ) ) ( not ( = ?auto_16669 ?auto_16662 ) ) ( not ( = ?auto_16669 ?auto_16659 ) ) ( not ( = ?auto_16669 ?auto_16660 ) ) ( not ( = ?auto_16663 ?auto_16657 ) ) ( not ( = ?auto_16663 ?auto_16668 ) ) ( not ( = ?auto_16663 ?auto_16658 ) ) ( not ( = ?auto_16663 ?auto_16656 ) ) ( not ( = ?auto_16634 ?auto_16640 ) ) ( not ( = ?auto_16634 ?auto_16664 ) ) ( not ( = ?auto_16635 ?auto_16640 ) ) ( not ( = ?auto_16635 ?auto_16664 ) ) ( not ( = ?auto_16636 ?auto_16640 ) ) ( not ( = ?auto_16636 ?auto_16664 ) ) ( not ( = ?auto_16637 ?auto_16640 ) ) ( not ( = ?auto_16637 ?auto_16664 ) ) ( not ( = ?auto_16638 ?auto_16640 ) ) ( not ( = ?auto_16638 ?auto_16664 ) ) ( not ( = ?auto_16640 ?auto_16663 ) ) ( not ( = ?auto_16640 ?auto_16657 ) ) ( not ( = ?auto_16640 ?auto_16668 ) ) ( not ( = ?auto_16640 ?auto_16658 ) ) ( not ( = ?auto_16640 ?auto_16656 ) ) ( not ( = ?auto_16651 ?auto_16654 ) ) ( not ( = ?auto_16651 ?auto_16649 ) ) ( not ( = ?auto_16651 ?auto_16650 ) ) ( not ( = ?auto_16651 ?auto_16665 ) ) ( not ( = ?auto_16651 ?auto_16652 ) ) ( not ( = ?auto_16666 ?auto_16669 ) ) ( not ( = ?auto_16666 ?auto_16661 ) ) ( not ( = ?auto_16666 ?auto_16662 ) ) ( not ( = ?auto_16666 ?auto_16659 ) ) ( not ( = ?auto_16666 ?auto_16660 ) ) ( not ( = ?auto_16664 ?auto_16663 ) ) ( not ( = ?auto_16664 ?auto_16657 ) ) ( not ( = ?auto_16664 ?auto_16668 ) ) ( not ( = ?auto_16664 ?auto_16658 ) ) ( not ( = ?auto_16664 ?auto_16656 ) ) ( not ( = ?auto_16634 ?auto_16641 ) ) ( not ( = ?auto_16634 ?auto_16655 ) ) ( not ( = ?auto_16635 ?auto_16641 ) ) ( not ( = ?auto_16635 ?auto_16655 ) ) ( not ( = ?auto_16636 ?auto_16641 ) ) ( not ( = ?auto_16636 ?auto_16655 ) ) ( not ( = ?auto_16637 ?auto_16641 ) ) ( not ( = ?auto_16637 ?auto_16655 ) ) ( not ( = ?auto_16638 ?auto_16641 ) ) ( not ( = ?auto_16638 ?auto_16655 ) ) ( not ( = ?auto_16639 ?auto_16641 ) ) ( not ( = ?auto_16639 ?auto_16655 ) ) ( not ( = ?auto_16641 ?auto_16664 ) ) ( not ( = ?auto_16641 ?auto_16663 ) ) ( not ( = ?auto_16641 ?auto_16657 ) ) ( not ( = ?auto_16641 ?auto_16668 ) ) ( not ( = ?auto_16641 ?auto_16658 ) ) ( not ( = ?auto_16641 ?auto_16656 ) ) ( not ( = ?auto_16667 ?auto_16651 ) ) ( not ( = ?auto_16667 ?auto_16654 ) ) ( not ( = ?auto_16667 ?auto_16649 ) ) ( not ( = ?auto_16667 ?auto_16650 ) ) ( not ( = ?auto_16667 ?auto_16665 ) ) ( not ( = ?auto_16667 ?auto_16652 ) ) ( not ( = ?auto_16653 ?auto_16666 ) ) ( not ( = ?auto_16653 ?auto_16669 ) ) ( not ( = ?auto_16653 ?auto_16661 ) ) ( not ( = ?auto_16653 ?auto_16662 ) ) ( not ( = ?auto_16653 ?auto_16659 ) ) ( not ( = ?auto_16653 ?auto_16660 ) ) ( not ( = ?auto_16655 ?auto_16664 ) ) ( not ( = ?auto_16655 ?auto_16663 ) ) ( not ( = ?auto_16655 ?auto_16657 ) ) ( not ( = ?auto_16655 ?auto_16668 ) ) ( not ( = ?auto_16655 ?auto_16658 ) ) ( not ( = ?auto_16655 ?auto_16656 ) ) ( not ( = ?auto_16634 ?auto_16642 ) ) ( not ( = ?auto_16634 ?auto_16646 ) ) ( not ( = ?auto_16635 ?auto_16642 ) ) ( not ( = ?auto_16635 ?auto_16646 ) ) ( not ( = ?auto_16636 ?auto_16642 ) ) ( not ( = ?auto_16636 ?auto_16646 ) ) ( not ( = ?auto_16637 ?auto_16642 ) ) ( not ( = ?auto_16637 ?auto_16646 ) ) ( not ( = ?auto_16638 ?auto_16642 ) ) ( not ( = ?auto_16638 ?auto_16646 ) ) ( not ( = ?auto_16639 ?auto_16642 ) ) ( not ( = ?auto_16639 ?auto_16646 ) ) ( not ( = ?auto_16640 ?auto_16642 ) ) ( not ( = ?auto_16640 ?auto_16646 ) ) ( not ( = ?auto_16642 ?auto_16655 ) ) ( not ( = ?auto_16642 ?auto_16664 ) ) ( not ( = ?auto_16642 ?auto_16663 ) ) ( not ( = ?auto_16642 ?auto_16657 ) ) ( not ( = ?auto_16642 ?auto_16668 ) ) ( not ( = ?auto_16642 ?auto_16658 ) ) ( not ( = ?auto_16642 ?auto_16656 ) ) ( not ( = ?auto_16647 ?auto_16667 ) ) ( not ( = ?auto_16647 ?auto_16651 ) ) ( not ( = ?auto_16647 ?auto_16654 ) ) ( not ( = ?auto_16647 ?auto_16649 ) ) ( not ( = ?auto_16647 ?auto_16650 ) ) ( not ( = ?auto_16647 ?auto_16665 ) ) ( not ( = ?auto_16647 ?auto_16652 ) ) ( not ( = ?auto_16648 ?auto_16653 ) ) ( not ( = ?auto_16648 ?auto_16666 ) ) ( not ( = ?auto_16648 ?auto_16669 ) ) ( not ( = ?auto_16648 ?auto_16661 ) ) ( not ( = ?auto_16648 ?auto_16662 ) ) ( not ( = ?auto_16648 ?auto_16659 ) ) ( not ( = ?auto_16648 ?auto_16660 ) ) ( not ( = ?auto_16646 ?auto_16655 ) ) ( not ( = ?auto_16646 ?auto_16664 ) ) ( not ( = ?auto_16646 ?auto_16663 ) ) ( not ( = ?auto_16646 ?auto_16657 ) ) ( not ( = ?auto_16646 ?auto_16668 ) ) ( not ( = ?auto_16646 ?auto_16658 ) ) ( not ( = ?auto_16646 ?auto_16656 ) ) )
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
      ?auto_16705 - HOIST
      ?auto_16704 - PLACE
      ?auto_16703 - PLACE
      ?auto_16702 - HOIST
      ?auto_16701 - SURFACE
      ?auto_16706 - PLACE
      ?auto_16707 - HOIST
      ?auto_16708 - SURFACE
      ?auto_16717 - PLACE
      ?auto_16716 - HOIST
      ?auto_16725 - SURFACE
      ?auto_16721 - PLACE
      ?auto_16724 - HOIST
      ?auto_16727 - SURFACE
      ?auto_16714 - PLACE
      ?auto_16718 - HOIST
      ?auto_16710 - SURFACE
      ?auto_16711 - PLACE
      ?auto_16723 - HOIST
      ?auto_16715 - SURFACE
      ?auto_16729 - PLACE
      ?auto_16713 - HOIST
      ?auto_16726 - SURFACE
      ?auto_16709 - PLACE
      ?auto_16719 - HOIST
      ?auto_16712 - SURFACE
      ?auto_16722 - PLACE
      ?auto_16728 - HOIST
      ?auto_16720 - SURFACE
      ?auto_16700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16705 ?auto_16704 ) ( IS-CRATE ?auto_16699 ) ( not ( = ?auto_16703 ?auto_16704 ) ) ( HOIST-AT ?auto_16702 ?auto_16703 ) ( AVAILABLE ?auto_16702 ) ( SURFACE-AT ?auto_16699 ?auto_16703 ) ( ON ?auto_16699 ?auto_16701 ) ( CLEAR ?auto_16699 ) ( not ( = ?auto_16698 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16701 ) ) ( not ( = ?auto_16699 ?auto_16701 ) ) ( not ( = ?auto_16705 ?auto_16702 ) ) ( IS-CRATE ?auto_16698 ) ( not ( = ?auto_16706 ?auto_16704 ) ) ( HOIST-AT ?auto_16707 ?auto_16706 ) ( AVAILABLE ?auto_16707 ) ( SURFACE-AT ?auto_16698 ?auto_16706 ) ( ON ?auto_16698 ?auto_16708 ) ( CLEAR ?auto_16698 ) ( not ( = ?auto_16697 ?auto_16698 ) ) ( not ( = ?auto_16697 ?auto_16708 ) ) ( not ( = ?auto_16698 ?auto_16708 ) ) ( not ( = ?auto_16705 ?auto_16707 ) ) ( IS-CRATE ?auto_16697 ) ( not ( = ?auto_16717 ?auto_16704 ) ) ( HOIST-AT ?auto_16716 ?auto_16717 ) ( AVAILABLE ?auto_16716 ) ( SURFACE-AT ?auto_16697 ?auto_16717 ) ( ON ?auto_16697 ?auto_16725 ) ( CLEAR ?auto_16697 ) ( not ( = ?auto_16696 ?auto_16697 ) ) ( not ( = ?auto_16696 ?auto_16725 ) ) ( not ( = ?auto_16697 ?auto_16725 ) ) ( not ( = ?auto_16705 ?auto_16716 ) ) ( IS-CRATE ?auto_16696 ) ( not ( = ?auto_16721 ?auto_16704 ) ) ( HOIST-AT ?auto_16724 ?auto_16721 ) ( AVAILABLE ?auto_16724 ) ( SURFACE-AT ?auto_16696 ?auto_16721 ) ( ON ?auto_16696 ?auto_16727 ) ( CLEAR ?auto_16696 ) ( not ( = ?auto_16695 ?auto_16696 ) ) ( not ( = ?auto_16695 ?auto_16727 ) ) ( not ( = ?auto_16696 ?auto_16727 ) ) ( not ( = ?auto_16705 ?auto_16724 ) ) ( IS-CRATE ?auto_16695 ) ( not ( = ?auto_16714 ?auto_16704 ) ) ( HOIST-AT ?auto_16718 ?auto_16714 ) ( AVAILABLE ?auto_16718 ) ( SURFACE-AT ?auto_16695 ?auto_16714 ) ( ON ?auto_16695 ?auto_16710 ) ( CLEAR ?auto_16695 ) ( not ( = ?auto_16694 ?auto_16695 ) ) ( not ( = ?auto_16694 ?auto_16710 ) ) ( not ( = ?auto_16695 ?auto_16710 ) ) ( not ( = ?auto_16705 ?auto_16718 ) ) ( IS-CRATE ?auto_16694 ) ( not ( = ?auto_16711 ?auto_16704 ) ) ( HOIST-AT ?auto_16723 ?auto_16711 ) ( AVAILABLE ?auto_16723 ) ( SURFACE-AT ?auto_16694 ?auto_16711 ) ( ON ?auto_16694 ?auto_16715 ) ( CLEAR ?auto_16694 ) ( not ( = ?auto_16693 ?auto_16694 ) ) ( not ( = ?auto_16693 ?auto_16715 ) ) ( not ( = ?auto_16694 ?auto_16715 ) ) ( not ( = ?auto_16705 ?auto_16723 ) ) ( IS-CRATE ?auto_16693 ) ( not ( = ?auto_16729 ?auto_16704 ) ) ( HOIST-AT ?auto_16713 ?auto_16729 ) ( AVAILABLE ?auto_16713 ) ( SURFACE-AT ?auto_16693 ?auto_16729 ) ( ON ?auto_16693 ?auto_16726 ) ( CLEAR ?auto_16693 ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( not ( = ?auto_16692 ?auto_16726 ) ) ( not ( = ?auto_16693 ?auto_16726 ) ) ( not ( = ?auto_16705 ?auto_16713 ) ) ( IS-CRATE ?auto_16692 ) ( not ( = ?auto_16709 ?auto_16704 ) ) ( HOIST-AT ?auto_16719 ?auto_16709 ) ( AVAILABLE ?auto_16719 ) ( SURFACE-AT ?auto_16692 ?auto_16709 ) ( ON ?auto_16692 ?auto_16712 ) ( CLEAR ?auto_16692 ) ( not ( = ?auto_16691 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16712 ) ) ( not ( = ?auto_16692 ?auto_16712 ) ) ( not ( = ?auto_16705 ?auto_16719 ) ) ( SURFACE-AT ?auto_16690 ?auto_16704 ) ( CLEAR ?auto_16690 ) ( IS-CRATE ?auto_16691 ) ( AVAILABLE ?auto_16705 ) ( not ( = ?auto_16722 ?auto_16704 ) ) ( HOIST-AT ?auto_16728 ?auto_16722 ) ( AVAILABLE ?auto_16728 ) ( SURFACE-AT ?auto_16691 ?auto_16722 ) ( ON ?auto_16691 ?auto_16720 ) ( CLEAR ?auto_16691 ) ( TRUCK-AT ?auto_16700 ?auto_16704 ) ( not ( = ?auto_16690 ?auto_16691 ) ) ( not ( = ?auto_16690 ?auto_16720 ) ) ( not ( = ?auto_16691 ?auto_16720 ) ) ( not ( = ?auto_16705 ?auto_16728 ) ) ( not ( = ?auto_16690 ?auto_16692 ) ) ( not ( = ?auto_16690 ?auto_16712 ) ) ( not ( = ?auto_16692 ?auto_16720 ) ) ( not ( = ?auto_16709 ?auto_16722 ) ) ( not ( = ?auto_16719 ?auto_16728 ) ) ( not ( = ?auto_16712 ?auto_16720 ) ) ( not ( = ?auto_16690 ?auto_16693 ) ) ( not ( = ?auto_16690 ?auto_16726 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16691 ?auto_16726 ) ) ( not ( = ?auto_16693 ?auto_16712 ) ) ( not ( = ?auto_16693 ?auto_16720 ) ) ( not ( = ?auto_16729 ?auto_16709 ) ) ( not ( = ?auto_16729 ?auto_16722 ) ) ( not ( = ?auto_16713 ?auto_16719 ) ) ( not ( = ?auto_16713 ?auto_16728 ) ) ( not ( = ?auto_16726 ?auto_16712 ) ) ( not ( = ?auto_16726 ?auto_16720 ) ) ( not ( = ?auto_16690 ?auto_16694 ) ) ( not ( = ?auto_16690 ?auto_16715 ) ) ( not ( = ?auto_16691 ?auto_16694 ) ) ( not ( = ?auto_16691 ?auto_16715 ) ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16715 ) ) ( not ( = ?auto_16694 ?auto_16726 ) ) ( not ( = ?auto_16694 ?auto_16712 ) ) ( not ( = ?auto_16694 ?auto_16720 ) ) ( not ( = ?auto_16711 ?auto_16729 ) ) ( not ( = ?auto_16711 ?auto_16709 ) ) ( not ( = ?auto_16711 ?auto_16722 ) ) ( not ( = ?auto_16723 ?auto_16713 ) ) ( not ( = ?auto_16723 ?auto_16719 ) ) ( not ( = ?auto_16723 ?auto_16728 ) ) ( not ( = ?auto_16715 ?auto_16726 ) ) ( not ( = ?auto_16715 ?auto_16712 ) ) ( not ( = ?auto_16715 ?auto_16720 ) ) ( not ( = ?auto_16690 ?auto_16695 ) ) ( not ( = ?auto_16690 ?auto_16710 ) ) ( not ( = ?auto_16691 ?auto_16695 ) ) ( not ( = ?auto_16691 ?auto_16710 ) ) ( not ( = ?auto_16692 ?auto_16695 ) ) ( not ( = ?auto_16692 ?auto_16710 ) ) ( not ( = ?auto_16693 ?auto_16695 ) ) ( not ( = ?auto_16693 ?auto_16710 ) ) ( not ( = ?auto_16695 ?auto_16715 ) ) ( not ( = ?auto_16695 ?auto_16726 ) ) ( not ( = ?auto_16695 ?auto_16712 ) ) ( not ( = ?auto_16695 ?auto_16720 ) ) ( not ( = ?auto_16714 ?auto_16711 ) ) ( not ( = ?auto_16714 ?auto_16729 ) ) ( not ( = ?auto_16714 ?auto_16709 ) ) ( not ( = ?auto_16714 ?auto_16722 ) ) ( not ( = ?auto_16718 ?auto_16723 ) ) ( not ( = ?auto_16718 ?auto_16713 ) ) ( not ( = ?auto_16718 ?auto_16719 ) ) ( not ( = ?auto_16718 ?auto_16728 ) ) ( not ( = ?auto_16710 ?auto_16715 ) ) ( not ( = ?auto_16710 ?auto_16726 ) ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16710 ?auto_16720 ) ) ( not ( = ?auto_16690 ?auto_16696 ) ) ( not ( = ?auto_16690 ?auto_16727 ) ) ( not ( = ?auto_16691 ?auto_16696 ) ) ( not ( = ?auto_16691 ?auto_16727 ) ) ( not ( = ?auto_16692 ?auto_16696 ) ) ( not ( = ?auto_16692 ?auto_16727 ) ) ( not ( = ?auto_16693 ?auto_16696 ) ) ( not ( = ?auto_16693 ?auto_16727 ) ) ( not ( = ?auto_16694 ?auto_16696 ) ) ( not ( = ?auto_16694 ?auto_16727 ) ) ( not ( = ?auto_16696 ?auto_16710 ) ) ( not ( = ?auto_16696 ?auto_16715 ) ) ( not ( = ?auto_16696 ?auto_16726 ) ) ( not ( = ?auto_16696 ?auto_16712 ) ) ( not ( = ?auto_16696 ?auto_16720 ) ) ( not ( = ?auto_16721 ?auto_16714 ) ) ( not ( = ?auto_16721 ?auto_16711 ) ) ( not ( = ?auto_16721 ?auto_16729 ) ) ( not ( = ?auto_16721 ?auto_16709 ) ) ( not ( = ?auto_16721 ?auto_16722 ) ) ( not ( = ?auto_16724 ?auto_16718 ) ) ( not ( = ?auto_16724 ?auto_16723 ) ) ( not ( = ?auto_16724 ?auto_16713 ) ) ( not ( = ?auto_16724 ?auto_16719 ) ) ( not ( = ?auto_16724 ?auto_16728 ) ) ( not ( = ?auto_16727 ?auto_16710 ) ) ( not ( = ?auto_16727 ?auto_16715 ) ) ( not ( = ?auto_16727 ?auto_16726 ) ) ( not ( = ?auto_16727 ?auto_16712 ) ) ( not ( = ?auto_16727 ?auto_16720 ) ) ( not ( = ?auto_16690 ?auto_16697 ) ) ( not ( = ?auto_16690 ?auto_16725 ) ) ( not ( = ?auto_16691 ?auto_16697 ) ) ( not ( = ?auto_16691 ?auto_16725 ) ) ( not ( = ?auto_16692 ?auto_16697 ) ) ( not ( = ?auto_16692 ?auto_16725 ) ) ( not ( = ?auto_16693 ?auto_16697 ) ) ( not ( = ?auto_16693 ?auto_16725 ) ) ( not ( = ?auto_16694 ?auto_16697 ) ) ( not ( = ?auto_16694 ?auto_16725 ) ) ( not ( = ?auto_16695 ?auto_16697 ) ) ( not ( = ?auto_16695 ?auto_16725 ) ) ( not ( = ?auto_16697 ?auto_16727 ) ) ( not ( = ?auto_16697 ?auto_16710 ) ) ( not ( = ?auto_16697 ?auto_16715 ) ) ( not ( = ?auto_16697 ?auto_16726 ) ) ( not ( = ?auto_16697 ?auto_16712 ) ) ( not ( = ?auto_16697 ?auto_16720 ) ) ( not ( = ?auto_16717 ?auto_16721 ) ) ( not ( = ?auto_16717 ?auto_16714 ) ) ( not ( = ?auto_16717 ?auto_16711 ) ) ( not ( = ?auto_16717 ?auto_16729 ) ) ( not ( = ?auto_16717 ?auto_16709 ) ) ( not ( = ?auto_16717 ?auto_16722 ) ) ( not ( = ?auto_16716 ?auto_16724 ) ) ( not ( = ?auto_16716 ?auto_16718 ) ) ( not ( = ?auto_16716 ?auto_16723 ) ) ( not ( = ?auto_16716 ?auto_16713 ) ) ( not ( = ?auto_16716 ?auto_16719 ) ) ( not ( = ?auto_16716 ?auto_16728 ) ) ( not ( = ?auto_16725 ?auto_16727 ) ) ( not ( = ?auto_16725 ?auto_16710 ) ) ( not ( = ?auto_16725 ?auto_16715 ) ) ( not ( = ?auto_16725 ?auto_16726 ) ) ( not ( = ?auto_16725 ?auto_16712 ) ) ( not ( = ?auto_16725 ?auto_16720 ) ) ( not ( = ?auto_16690 ?auto_16698 ) ) ( not ( = ?auto_16690 ?auto_16708 ) ) ( not ( = ?auto_16691 ?auto_16698 ) ) ( not ( = ?auto_16691 ?auto_16708 ) ) ( not ( = ?auto_16692 ?auto_16698 ) ) ( not ( = ?auto_16692 ?auto_16708 ) ) ( not ( = ?auto_16693 ?auto_16698 ) ) ( not ( = ?auto_16693 ?auto_16708 ) ) ( not ( = ?auto_16694 ?auto_16698 ) ) ( not ( = ?auto_16694 ?auto_16708 ) ) ( not ( = ?auto_16695 ?auto_16698 ) ) ( not ( = ?auto_16695 ?auto_16708 ) ) ( not ( = ?auto_16696 ?auto_16698 ) ) ( not ( = ?auto_16696 ?auto_16708 ) ) ( not ( = ?auto_16698 ?auto_16725 ) ) ( not ( = ?auto_16698 ?auto_16727 ) ) ( not ( = ?auto_16698 ?auto_16710 ) ) ( not ( = ?auto_16698 ?auto_16715 ) ) ( not ( = ?auto_16698 ?auto_16726 ) ) ( not ( = ?auto_16698 ?auto_16712 ) ) ( not ( = ?auto_16698 ?auto_16720 ) ) ( not ( = ?auto_16706 ?auto_16717 ) ) ( not ( = ?auto_16706 ?auto_16721 ) ) ( not ( = ?auto_16706 ?auto_16714 ) ) ( not ( = ?auto_16706 ?auto_16711 ) ) ( not ( = ?auto_16706 ?auto_16729 ) ) ( not ( = ?auto_16706 ?auto_16709 ) ) ( not ( = ?auto_16706 ?auto_16722 ) ) ( not ( = ?auto_16707 ?auto_16716 ) ) ( not ( = ?auto_16707 ?auto_16724 ) ) ( not ( = ?auto_16707 ?auto_16718 ) ) ( not ( = ?auto_16707 ?auto_16723 ) ) ( not ( = ?auto_16707 ?auto_16713 ) ) ( not ( = ?auto_16707 ?auto_16719 ) ) ( not ( = ?auto_16707 ?auto_16728 ) ) ( not ( = ?auto_16708 ?auto_16725 ) ) ( not ( = ?auto_16708 ?auto_16727 ) ) ( not ( = ?auto_16708 ?auto_16710 ) ) ( not ( = ?auto_16708 ?auto_16715 ) ) ( not ( = ?auto_16708 ?auto_16726 ) ) ( not ( = ?auto_16708 ?auto_16712 ) ) ( not ( = ?auto_16708 ?auto_16720 ) ) ( not ( = ?auto_16690 ?auto_16699 ) ) ( not ( = ?auto_16690 ?auto_16701 ) ) ( not ( = ?auto_16691 ?auto_16699 ) ) ( not ( = ?auto_16691 ?auto_16701 ) ) ( not ( = ?auto_16692 ?auto_16699 ) ) ( not ( = ?auto_16692 ?auto_16701 ) ) ( not ( = ?auto_16693 ?auto_16699 ) ) ( not ( = ?auto_16693 ?auto_16701 ) ) ( not ( = ?auto_16694 ?auto_16699 ) ) ( not ( = ?auto_16694 ?auto_16701 ) ) ( not ( = ?auto_16695 ?auto_16699 ) ) ( not ( = ?auto_16695 ?auto_16701 ) ) ( not ( = ?auto_16696 ?auto_16699 ) ) ( not ( = ?auto_16696 ?auto_16701 ) ) ( not ( = ?auto_16697 ?auto_16699 ) ) ( not ( = ?auto_16697 ?auto_16701 ) ) ( not ( = ?auto_16699 ?auto_16708 ) ) ( not ( = ?auto_16699 ?auto_16725 ) ) ( not ( = ?auto_16699 ?auto_16727 ) ) ( not ( = ?auto_16699 ?auto_16710 ) ) ( not ( = ?auto_16699 ?auto_16715 ) ) ( not ( = ?auto_16699 ?auto_16726 ) ) ( not ( = ?auto_16699 ?auto_16712 ) ) ( not ( = ?auto_16699 ?auto_16720 ) ) ( not ( = ?auto_16703 ?auto_16706 ) ) ( not ( = ?auto_16703 ?auto_16717 ) ) ( not ( = ?auto_16703 ?auto_16721 ) ) ( not ( = ?auto_16703 ?auto_16714 ) ) ( not ( = ?auto_16703 ?auto_16711 ) ) ( not ( = ?auto_16703 ?auto_16729 ) ) ( not ( = ?auto_16703 ?auto_16709 ) ) ( not ( = ?auto_16703 ?auto_16722 ) ) ( not ( = ?auto_16702 ?auto_16707 ) ) ( not ( = ?auto_16702 ?auto_16716 ) ) ( not ( = ?auto_16702 ?auto_16724 ) ) ( not ( = ?auto_16702 ?auto_16718 ) ) ( not ( = ?auto_16702 ?auto_16723 ) ) ( not ( = ?auto_16702 ?auto_16713 ) ) ( not ( = ?auto_16702 ?auto_16719 ) ) ( not ( = ?auto_16702 ?auto_16728 ) ) ( not ( = ?auto_16701 ?auto_16708 ) ) ( not ( = ?auto_16701 ?auto_16725 ) ) ( not ( = ?auto_16701 ?auto_16727 ) ) ( not ( = ?auto_16701 ?auto_16710 ) ) ( not ( = ?auto_16701 ?auto_16715 ) ) ( not ( = ?auto_16701 ?auto_16726 ) ) ( not ( = ?auto_16701 ?auto_16712 ) ) ( not ( = ?auto_16701 ?auto_16720 ) ) )
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
      ?auto_16765 - HOIST
      ?auto_16763 - PLACE
      ?auto_16767 - PLACE
      ?auto_16762 - HOIST
      ?auto_16764 - SURFACE
      ?auto_16774 - SURFACE
      ?auto_16786 - PLACE
      ?auto_16787 - HOIST
      ?auto_16770 - SURFACE
      ?auto_16775 - PLACE
      ?auto_16784 - HOIST
      ?auto_16782 - SURFACE
      ?auto_16768 - PLACE
      ?auto_16781 - HOIST
      ?auto_16780 - SURFACE
      ?auto_16783 - PLACE
      ?auto_16777 - HOIST
      ?auto_16773 - SURFACE
      ?auto_16792 - PLACE
      ?auto_16788 - HOIST
      ?auto_16779 - SURFACE
      ?auto_16790 - PLACE
      ?auto_16789 - HOIST
      ?auto_16769 - SURFACE
      ?auto_16785 - PLACE
      ?auto_16791 - HOIST
      ?auto_16776 - SURFACE
      ?auto_16771 - PLACE
      ?auto_16772 - HOIST
      ?auto_16778 - SURFACE
      ?auto_16766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16765 ?auto_16763 ) ( IS-CRATE ?auto_16761 ) ( not ( = ?auto_16767 ?auto_16763 ) ) ( HOIST-AT ?auto_16762 ?auto_16767 ) ( SURFACE-AT ?auto_16761 ?auto_16767 ) ( ON ?auto_16761 ?auto_16764 ) ( CLEAR ?auto_16761 ) ( not ( = ?auto_16760 ?auto_16761 ) ) ( not ( = ?auto_16760 ?auto_16764 ) ) ( not ( = ?auto_16761 ?auto_16764 ) ) ( not ( = ?auto_16765 ?auto_16762 ) ) ( IS-CRATE ?auto_16760 ) ( AVAILABLE ?auto_16762 ) ( SURFACE-AT ?auto_16760 ?auto_16767 ) ( ON ?auto_16760 ?auto_16774 ) ( CLEAR ?auto_16760 ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16759 ?auto_16774 ) ) ( not ( = ?auto_16760 ?auto_16774 ) ) ( IS-CRATE ?auto_16759 ) ( not ( = ?auto_16786 ?auto_16763 ) ) ( HOIST-AT ?auto_16787 ?auto_16786 ) ( AVAILABLE ?auto_16787 ) ( SURFACE-AT ?auto_16759 ?auto_16786 ) ( ON ?auto_16759 ?auto_16770 ) ( CLEAR ?auto_16759 ) ( not ( = ?auto_16758 ?auto_16759 ) ) ( not ( = ?auto_16758 ?auto_16770 ) ) ( not ( = ?auto_16759 ?auto_16770 ) ) ( not ( = ?auto_16765 ?auto_16787 ) ) ( IS-CRATE ?auto_16758 ) ( not ( = ?auto_16775 ?auto_16763 ) ) ( HOIST-AT ?auto_16784 ?auto_16775 ) ( AVAILABLE ?auto_16784 ) ( SURFACE-AT ?auto_16758 ?auto_16775 ) ( ON ?auto_16758 ?auto_16782 ) ( CLEAR ?auto_16758 ) ( not ( = ?auto_16757 ?auto_16758 ) ) ( not ( = ?auto_16757 ?auto_16782 ) ) ( not ( = ?auto_16758 ?auto_16782 ) ) ( not ( = ?auto_16765 ?auto_16784 ) ) ( IS-CRATE ?auto_16757 ) ( not ( = ?auto_16768 ?auto_16763 ) ) ( HOIST-AT ?auto_16781 ?auto_16768 ) ( AVAILABLE ?auto_16781 ) ( SURFACE-AT ?auto_16757 ?auto_16768 ) ( ON ?auto_16757 ?auto_16780 ) ( CLEAR ?auto_16757 ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16780 ) ) ( not ( = ?auto_16757 ?auto_16780 ) ) ( not ( = ?auto_16765 ?auto_16781 ) ) ( IS-CRATE ?auto_16756 ) ( not ( = ?auto_16783 ?auto_16763 ) ) ( HOIST-AT ?auto_16777 ?auto_16783 ) ( AVAILABLE ?auto_16777 ) ( SURFACE-AT ?auto_16756 ?auto_16783 ) ( ON ?auto_16756 ?auto_16773 ) ( CLEAR ?auto_16756 ) ( not ( = ?auto_16755 ?auto_16756 ) ) ( not ( = ?auto_16755 ?auto_16773 ) ) ( not ( = ?auto_16756 ?auto_16773 ) ) ( not ( = ?auto_16765 ?auto_16777 ) ) ( IS-CRATE ?auto_16755 ) ( not ( = ?auto_16792 ?auto_16763 ) ) ( HOIST-AT ?auto_16788 ?auto_16792 ) ( AVAILABLE ?auto_16788 ) ( SURFACE-AT ?auto_16755 ?auto_16792 ) ( ON ?auto_16755 ?auto_16779 ) ( CLEAR ?auto_16755 ) ( not ( = ?auto_16754 ?auto_16755 ) ) ( not ( = ?auto_16754 ?auto_16779 ) ) ( not ( = ?auto_16755 ?auto_16779 ) ) ( not ( = ?auto_16765 ?auto_16788 ) ) ( IS-CRATE ?auto_16754 ) ( not ( = ?auto_16790 ?auto_16763 ) ) ( HOIST-AT ?auto_16789 ?auto_16790 ) ( AVAILABLE ?auto_16789 ) ( SURFACE-AT ?auto_16754 ?auto_16790 ) ( ON ?auto_16754 ?auto_16769 ) ( CLEAR ?auto_16754 ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16753 ?auto_16769 ) ) ( not ( = ?auto_16754 ?auto_16769 ) ) ( not ( = ?auto_16765 ?auto_16789 ) ) ( IS-CRATE ?auto_16753 ) ( not ( = ?auto_16785 ?auto_16763 ) ) ( HOIST-AT ?auto_16791 ?auto_16785 ) ( AVAILABLE ?auto_16791 ) ( SURFACE-AT ?auto_16753 ?auto_16785 ) ( ON ?auto_16753 ?auto_16776 ) ( CLEAR ?auto_16753 ) ( not ( = ?auto_16752 ?auto_16753 ) ) ( not ( = ?auto_16752 ?auto_16776 ) ) ( not ( = ?auto_16753 ?auto_16776 ) ) ( not ( = ?auto_16765 ?auto_16791 ) ) ( SURFACE-AT ?auto_16751 ?auto_16763 ) ( CLEAR ?auto_16751 ) ( IS-CRATE ?auto_16752 ) ( AVAILABLE ?auto_16765 ) ( not ( = ?auto_16771 ?auto_16763 ) ) ( HOIST-AT ?auto_16772 ?auto_16771 ) ( AVAILABLE ?auto_16772 ) ( SURFACE-AT ?auto_16752 ?auto_16771 ) ( ON ?auto_16752 ?auto_16778 ) ( CLEAR ?auto_16752 ) ( TRUCK-AT ?auto_16766 ?auto_16763 ) ( not ( = ?auto_16751 ?auto_16752 ) ) ( not ( = ?auto_16751 ?auto_16778 ) ) ( not ( = ?auto_16752 ?auto_16778 ) ) ( not ( = ?auto_16765 ?auto_16772 ) ) ( not ( = ?auto_16751 ?auto_16753 ) ) ( not ( = ?auto_16751 ?auto_16776 ) ) ( not ( = ?auto_16753 ?auto_16778 ) ) ( not ( = ?auto_16785 ?auto_16771 ) ) ( not ( = ?auto_16791 ?auto_16772 ) ) ( not ( = ?auto_16776 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16754 ) ) ( not ( = ?auto_16751 ?auto_16769 ) ) ( not ( = ?auto_16752 ?auto_16754 ) ) ( not ( = ?auto_16752 ?auto_16769 ) ) ( not ( = ?auto_16754 ?auto_16776 ) ) ( not ( = ?auto_16754 ?auto_16778 ) ) ( not ( = ?auto_16790 ?auto_16785 ) ) ( not ( = ?auto_16790 ?auto_16771 ) ) ( not ( = ?auto_16789 ?auto_16791 ) ) ( not ( = ?auto_16789 ?auto_16772 ) ) ( not ( = ?auto_16769 ?auto_16776 ) ) ( not ( = ?auto_16769 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16755 ) ) ( not ( = ?auto_16751 ?auto_16779 ) ) ( not ( = ?auto_16752 ?auto_16755 ) ) ( not ( = ?auto_16752 ?auto_16779 ) ) ( not ( = ?auto_16753 ?auto_16755 ) ) ( not ( = ?auto_16753 ?auto_16779 ) ) ( not ( = ?auto_16755 ?auto_16769 ) ) ( not ( = ?auto_16755 ?auto_16776 ) ) ( not ( = ?auto_16755 ?auto_16778 ) ) ( not ( = ?auto_16792 ?auto_16790 ) ) ( not ( = ?auto_16792 ?auto_16785 ) ) ( not ( = ?auto_16792 ?auto_16771 ) ) ( not ( = ?auto_16788 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16791 ) ) ( not ( = ?auto_16788 ?auto_16772 ) ) ( not ( = ?auto_16779 ?auto_16769 ) ) ( not ( = ?auto_16779 ?auto_16776 ) ) ( not ( = ?auto_16779 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16756 ) ) ( not ( = ?auto_16751 ?auto_16773 ) ) ( not ( = ?auto_16752 ?auto_16756 ) ) ( not ( = ?auto_16752 ?auto_16773 ) ) ( not ( = ?auto_16753 ?auto_16756 ) ) ( not ( = ?auto_16753 ?auto_16773 ) ) ( not ( = ?auto_16754 ?auto_16756 ) ) ( not ( = ?auto_16754 ?auto_16773 ) ) ( not ( = ?auto_16756 ?auto_16779 ) ) ( not ( = ?auto_16756 ?auto_16769 ) ) ( not ( = ?auto_16756 ?auto_16776 ) ) ( not ( = ?auto_16756 ?auto_16778 ) ) ( not ( = ?auto_16783 ?auto_16792 ) ) ( not ( = ?auto_16783 ?auto_16790 ) ) ( not ( = ?auto_16783 ?auto_16785 ) ) ( not ( = ?auto_16783 ?auto_16771 ) ) ( not ( = ?auto_16777 ?auto_16788 ) ) ( not ( = ?auto_16777 ?auto_16789 ) ) ( not ( = ?auto_16777 ?auto_16791 ) ) ( not ( = ?auto_16777 ?auto_16772 ) ) ( not ( = ?auto_16773 ?auto_16779 ) ) ( not ( = ?auto_16773 ?auto_16769 ) ) ( not ( = ?auto_16773 ?auto_16776 ) ) ( not ( = ?auto_16773 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16757 ) ) ( not ( = ?auto_16751 ?auto_16780 ) ) ( not ( = ?auto_16752 ?auto_16757 ) ) ( not ( = ?auto_16752 ?auto_16780 ) ) ( not ( = ?auto_16753 ?auto_16757 ) ) ( not ( = ?auto_16753 ?auto_16780 ) ) ( not ( = ?auto_16754 ?auto_16757 ) ) ( not ( = ?auto_16754 ?auto_16780 ) ) ( not ( = ?auto_16755 ?auto_16757 ) ) ( not ( = ?auto_16755 ?auto_16780 ) ) ( not ( = ?auto_16757 ?auto_16773 ) ) ( not ( = ?auto_16757 ?auto_16779 ) ) ( not ( = ?auto_16757 ?auto_16769 ) ) ( not ( = ?auto_16757 ?auto_16776 ) ) ( not ( = ?auto_16757 ?auto_16778 ) ) ( not ( = ?auto_16768 ?auto_16783 ) ) ( not ( = ?auto_16768 ?auto_16792 ) ) ( not ( = ?auto_16768 ?auto_16790 ) ) ( not ( = ?auto_16768 ?auto_16785 ) ) ( not ( = ?auto_16768 ?auto_16771 ) ) ( not ( = ?auto_16781 ?auto_16777 ) ) ( not ( = ?auto_16781 ?auto_16788 ) ) ( not ( = ?auto_16781 ?auto_16789 ) ) ( not ( = ?auto_16781 ?auto_16791 ) ) ( not ( = ?auto_16781 ?auto_16772 ) ) ( not ( = ?auto_16780 ?auto_16773 ) ) ( not ( = ?auto_16780 ?auto_16779 ) ) ( not ( = ?auto_16780 ?auto_16769 ) ) ( not ( = ?auto_16780 ?auto_16776 ) ) ( not ( = ?auto_16780 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16758 ) ) ( not ( = ?auto_16751 ?auto_16782 ) ) ( not ( = ?auto_16752 ?auto_16758 ) ) ( not ( = ?auto_16752 ?auto_16782 ) ) ( not ( = ?auto_16753 ?auto_16758 ) ) ( not ( = ?auto_16753 ?auto_16782 ) ) ( not ( = ?auto_16754 ?auto_16758 ) ) ( not ( = ?auto_16754 ?auto_16782 ) ) ( not ( = ?auto_16755 ?auto_16758 ) ) ( not ( = ?auto_16755 ?auto_16782 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16782 ) ) ( not ( = ?auto_16758 ?auto_16780 ) ) ( not ( = ?auto_16758 ?auto_16773 ) ) ( not ( = ?auto_16758 ?auto_16779 ) ) ( not ( = ?auto_16758 ?auto_16769 ) ) ( not ( = ?auto_16758 ?auto_16776 ) ) ( not ( = ?auto_16758 ?auto_16778 ) ) ( not ( = ?auto_16775 ?auto_16768 ) ) ( not ( = ?auto_16775 ?auto_16783 ) ) ( not ( = ?auto_16775 ?auto_16792 ) ) ( not ( = ?auto_16775 ?auto_16790 ) ) ( not ( = ?auto_16775 ?auto_16785 ) ) ( not ( = ?auto_16775 ?auto_16771 ) ) ( not ( = ?auto_16784 ?auto_16781 ) ) ( not ( = ?auto_16784 ?auto_16777 ) ) ( not ( = ?auto_16784 ?auto_16788 ) ) ( not ( = ?auto_16784 ?auto_16789 ) ) ( not ( = ?auto_16784 ?auto_16791 ) ) ( not ( = ?auto_16784 ?auto_16772 ) ) ( not ( = ?auto_16782 ?auto_16780 ) ) ( not ( = ?auto_16782 ?auto_16773 ) ) ( not ( = ?auto_16782 ?auto_16779 ) ) ( not ( = ?auto_16782 ?auto_16769 ) ) ( not ( = ?auto_16782 ?auto_16776 ) ) ( not ( = ?auto_16782 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16759 ) ) ( not ( = ?auto_16751 ?auto_16770 ) ) ( not ( = ?auto_16752 ?auto_16759 ) ) ( not ( = ?auto_16752 ?auto_16770 ) ) ( not ( = ?auto_16753 ?auto_16759 ) ) ( not ( = ?auto_16753 ?auto_16770 ) ) ( not ( = ?auto_16754 ?auto_16759 ) ) ( not ( = ?auto_16754 ?auto_16770 ) ) ( not ( = ?auto_16755 ?auto_16759 ) ) ( not ( = ?auto_16755 ?auto_16770 ) ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( not ( = ?auto_16756 ?auto_16770 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16770 ) ) ( not ( = ?auto_16759 ?auto_16782 ) ) ( not ( = ?auto_16759 ?auto_16780 ) ) ( not ( = ?auto_16759 ?auto_16773 ) ) ( not ( = ?auto_16759 ?auto_16779 ) ) ( not ( = ?auto_16759 ?auto_16769 ) ) ( not ( = ?auto_16759 ?auto_16776 ) ) ( not ( = ?auto_16759 ?auto_16778 ) ) ( not ( = ?auto_16786 ?auto_16775 ) ) ( not ( = ?auto_16786 ?auto_16768 ) ) ( not ( = ?auto_16786 ?auto_16783 ) ) ( not ( = ?auto_16786 ?auto_16792 ) ) ( not ( = ?auto_16786 ?auto_16790 ) ) ( not ( = ?auto_16786 ?auto_16785 ) ) ( not ( = ?auto_16786 ?auto_16771 ) ) ( not ( = ?auto_16787 ?auto_16784 ) ) ( not ( = ?auto_16787 ?auto_16781 ) ) ( not ( = ?auto_16787 ?auto_16777 ) ) ( not ( = ?auto_16787 ?auto_16788 ) ) ( not ( = ?auto_16787 ?auto_16789 ) ) ( not ( = ?auto_16787 ?auto_16791 ) ) ( not ( = ?auto_16787 ?auto_16772 ) ) ( not ( = ?auto_16770 ?auto_16782 ) ) ( not ( = ?auto_16770 ?auto_16780 ) ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16770 ?auto_16779 ) ) ( not ( = ?auto_16770 ?auto_16769 ) ) ( not ( = ?auto_16770 ?auto_16776 ) ) ( not ( = ?auto_16770 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16760 ) ) ( not ( = ?auto_16751 ?auto_16774 ) ) ( not ( = ?auto_16752 ?auto_16760 ) ) ( not ( = ?auto_16752 ?auto_16774 ) ) ( not ( = ?auto_16753 ?auto_16760 ) ) ( not ( = ?auto_16753 ?auto_16774 ) ) ( not ( = ?auto_16754 ?auto_16760 ) ) ( not ( = ?auto_16754 ?auto_16774 ) ) ( not ( = ?auto_16755 ?auto_16760 ) ) ( not ( = ?auto_16755 ?auto_16774 ) ) ( not ( = ?auto_16756 ?auto_16760 ) ) ( not ( = ?auto_16756 ?auto_16774 ) ) ( not ( = ?auto_16757 ?auto_16760 ) ) ( not ( = ?auto_16757 ?auto_16774 ) ) ( not ( = ?auto_16758 ?auto_16760 ) ) ( not ( = ?auto_16758 ?auto_16774 ) ) ( not ( = ?auto_16760 ?auto_16770 ) ) ( not ( = ?auto_16760 ?auto_16782 ) ) ( not ( = ?auto_16760 ?auto_16780 ) ) ( not ( = ?auto_16760 ?auto_16773 ) ) ( not ( = ?auto_16760 ?auto_16779 ) ) ( not ( = ?auto_16760 ?auto_16769 ) ) ( not ( = ?auto_16760 ?auto_16776 ) ) ( not ( = ?auto_16760 ?auto_16778 ) ) ( not ( = ?auto_16767 ?auto_16786 ) ) ( not ( = ?auto_16767 ?auto_16775 ) ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( not ( = ?auto_16767 ?auto_16783 ) ) ( not ( = ?auto_16767 ?auto_16792 ) ) ( not ( = ?auto_16767 ?auto_16790 ) ) ( not ( = ?auto_16767 ?auto_16785 ) ) ( not ( = ?auto_16767 ?auto_16771 ) ) ( not ( = ?auto_16762 ?auto_16787 ) ) ( not ( = ?auto_16762 ?auto_16784 ) ) ( not ( = ?auto_16762 ?auto_16781 ) ) ( not ( = ?auto_16762 ?auto_16777 ) ) ( not ( = ?auto_16762 ?auto_16788 ) ) ( not ( = ?auto_16762 ?auto_16789 ) ) ( not ( = ?auto_16762 ?auto_16791 ) ) ( not ( = ?auto_16762 ?auto_16772 ) ) ( not ( = ?auto_16774 ?auto_16770 ) ) ( not ( = ?auto_16774 ?auto_16782 ) ) ( not ( = ?auto_16774 ?auto_16780 ) ) ( not ( = ?auto_16774 ?auto_16773 ) ) ( not ( = ?auto_16774 ?auto_16779 ) ) ( not ( = ?auto_16774 ?auto_16769 ) ) ( not ( = ?auto_16774 ?auto_16776 ) ) ( not ( = ?auto_16774 ?auto_16778 ) ) ( not ( = ?auto_16751 ?auto_16761 ) ) ( not ( = ?auto_16751 ?auto_16764 ) ) ( not ( = ?auto_16752 ?auto_16761 ) ) ( not ( = ?auto_16752 ?auto_16764 ) ) ( not ( = ?auto_16753 ?auto_16761 ) ) ( not ( = ?auto_16753 ?auto_16764 ) ) ( not ( = ?auto_16754 ?auto_16761 ) ) ( not ( = ?auto_16754 ?auto_16764 ) ) ( not ( = ?auto_16755 ?auto_16761 ) ) ( not ( = ?auto_16755 ?auto_16764 ) ) ( not ( = ?auto_16756 ?auto_16761 ) ) ( not ( = ?auto_16756 ?auto_16764 ) ) ( not ( = ?auto_16757 ?auto_16761 ) ) ( not ( = ?auto_16757 ?auto_16764 ) ) ( not ( = ?auto_16758 ?auto_16761 ) ) ( not ( = ?auto_16758 ?auto_16764 ) ) ( not ( = ?auto_16759 ?auto_16761 ) ) ( not ( = ?auto_16759 ?auto_16764 ) ) ( not ( = ?auto_16761 ?auto_16774 ) ) ( not ( = ?auto_16761 ?auto_16770 ) ) ( not ( = ?auto_16761 ?auto_16782 ) ) ( not ( = ?auto_16761 ?auto_16780 ) ) ( not ( = ?auto_16761 ?auto_16773 ) ) ( not ( = ?auto_16761 ?auto_16779 ) ) ( not ( = ?auto_16761 ?auto_16769 ) ) ( not ( = ?auto_16761 ?auto_16776 ) ) ( not ( = ?auto_16761 ?auto_16778 ) ) ( not ( = ?auto_16764 ?auto_16774 ) ) ( not ( = ?auto_16764 ?auto_16770 ) ) ( not ( = ?auto_16764 ?auto_16782 ) ) ( not ( = ?auto_16764 ?auto_16780 ) ) ( not ( = ?auto_16764 ?auto_16773 ) ) ( not ( = ?auto_16764 ?auto_16779 ) ) ( not ( = ?auto_16764 ?auto_16769 ) ) ( not ( = ?auto_16764 ?auto_16776 ) ) ( not ( = ?auto_16764 ?auto_16778 ) ) )
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
      ?auto_16830 - HOIST
      ?auto_16827 - PLACE
      ?auto_16829 - PLACE
      ?auto_16828 - HOIST
      ?auto_16832 - SURFACE
      ?auto_16849 - PLACE
      ?auto_16850 - HOIST
      ?auto_16846 - SURFACE
      ?auto_16837 - SURFACE
      ?auto_16836 - PLACE
      ?auto_16855 - HOIST
      ?auto_16847 - SURFACE
      ?auto_16845 - PLACE
      ?auto_16860 - HOIST
      ?auto_16857 - SURFACE
      ?auto_16852 - PLACE
      ?auto_16841 - HOIST
      ?auto_16839 - SURFACE
      ?auto_16844 - PLACE
      ?auto_16838 - HOIST
      ?auto_16854 - SURFACE
      ?auto_16859 - PLACE
      ?auto_16851 - HOIST
      ?auto_16842 - SURFACE
      ?auto_16848 - PLACE
      ?auto_16835 - HOIST
      ?auto_16840 - SURFACE
      ?auto_16834 - PLACE
      ?auto_16853 - HOIST
      ?auto_16856 - SURFACE
      ?auto_16843 - PLACE
      ?auto_16858 - HOIST
      ?auto_16833 - SURFACE
      ?auto_16831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16830 ?auto_16827 ) ( IS-CRATE ?auto_16826 ) ( not ( = ?auto_16829 ?auto_16827 ) ) ( HOIST-AT ?auto_16828 ?auto_16829 ) ( AVAILABLE ?auto_16828 ) ( SURFACE-AT ?auto_16826 ?auto_16829 ) ( ON ?auto_16826 ?auto_16832 ) ( CLEAR ?auto_16826 ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16825 ?auto_16832 ) ) ( not ( = ?auto_16826 ?auto_16832 ) ) ( not ( = ?auto_16830 ?auto_16828 ) ) ( IS-CRATE ?auto_16825 ) ( not ( = ?auto_16849 ?auto_16827 ) ) ( HOIST-AT ?auto_16850 ?auto_16849 ) ( SURFACE-AT ?auto_16825 ?auto_16849 ) ( ON ?auto_16825 ?auto_16846 ) ( CLEAR ?auto_16825 ) ( not ( = ?auto_16824 ?auto_16825 ) ) ( not ( = ?auto_16824 ?auto_16846 ) ) ( not ( = ?auto_16825 ?auto_16846 ) ) ( not ( = ?auto_16830 ?auto_16850 ) ) ( IS-CRATE ?auto_16824 ) ( AVAILABLE ?auto_16850 ) ( SURFACE-AT ?auto_16824 ?auto_16849 ) ( ON ?auto_16824 ?auto_16837 ) ( CLEAR ?auto_16824 ) ( not ( = ?auto_16823 ?auto_16824 ) ) ( not ( = ?auto_16823 ?auto_16837 ) ) ( not ( = ?auto_16824 ?auto_16837 ) ) ( IS-CRATE ?auto_16823 ) ( not ( = ?auto_16836 ?auto_16827 ) ) ( HOIST-AT ?auto_16855 ?auto_16836 ) ( AVAILABLE ?auto_16855 ) ( SURFACE-AT ?auto_16823 ?auto_16836 ) ( ON ?auto_16823 ?auto_16847 ) ( CLEAR ?auto_16823 ) ( not ( = ?auto_16822 ?auto_16823 ) ) ( not ( = ?auto_16822 ?auto_16847 ) ) ( not ( = ?auto_16823 ?auto_16847 ) ) ( not ( = ?auto_16830 ?auto_16855 ) ) ( IS-CRATE ?auto_16822 ) ( not ( = ?auto_16845 ?auto_16827 ) ) ( HOIST-AT ?auto_16860 ?auto_16845 ) ( AVAILABLE ?auto_16860 ) ( SURFACE-AT ?auto_16822 ?auto_16845 ) ( ON ?auto_16822 ?auto_16857 ) ( CLEAR ?auto_16822 ) ( not ( = ?auto_16821 ?auto_16822 ) ) ( not ( = ?auto_16821 ?auto_16857 ) ) ( not ( = ?auto_16822 ?auto_16857 ) ) ( not ( = ?auto_16830 ?auto_16860 ) ) ( IS-CRATE ?auto_16821 ) ( not ( = ?auto_16852 ?auto_16827 ) ) ( HOIST-AT ?auto_16841 ?auto_16852 ) ( AVAILABLE ?auto_16841 ) ( SURFACE-AT ?auto_16821 ?auto_16852 ) ( ON ?auto_16821 ?auto_16839 ) ( CLEAR ?auto_16821 ) ( not ( = ?auto_16820 ?auto_16821 ) ) ( not ( = ?auto_16820 ?auto_16839 ) ) ( not ( = ?auto_16821 ?auto_16839 ) ) ( not ( = ?auto_16830 ?auto_16841 ) ) ( IS-CRATE ?auto_16820 ) ( not ( = ?auto_16844 ?auto_16827 ) ) ( HOIST-AT ?auto_16838 ?auto_16844 ) ( AVAILABLE ?auto_16838 ) ( SURFACE-AT ?auto_16820 ?auto_16844 ) ( ON ?auto_16820 ?auto_16854 ) ( CLEAR ?auto_16820 ) ( not ( = ?auto_16819 ?auto_16820 ) ) ( not ( = ?auto_16819 ?auto_16854 ) ) ( not ( = ?auto_16820 ?auto_16854 ) ) ( not ( = ?auto_16830 ?auto_16838 ) ) ( IS-CRATE ?auto_16819 ) ( not ( = ?auto_16859 ?auto_16827 ) ) ( HOIST-AT ?auto_16851 ?auto_16859 ) ( AVAILABLE ?auto_16851 ) ( SURFACE-AT ?auto_16819 ?auto_16859 ) ( ON ?auto_16819 ?auto_16842 ) ( CLEAR ?auto_16819 ) ( not ( = ?auto_16818 ?auto_16819 ) ) ( not ( = ?auto_16818 ?auto_16842 ) ) ( not ( = ?auto_16819 ?auto_16842 ) ) ( not ( = ?auto_16830 ?auto_16851 ) ) ( IS-CRATE ?auto_16818 ) ( not ( = ?auto_16848 ?auto_16827 ) ) ( HOIST-AT ?auto_16835 ?auto_16848 ) ( AVAILABLE ?auto_16835 ) ( SURFACE-AT ?auto_16818 ?auto_16848 ) ( ON ?auto_16818 ?auto_16840 ) ( CLEAR ?auto_16818 ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16840 ) ) ( not ( = ?auto_16818 ?auto_16840 ) ) ( not ( = ?auto_16830 ?auto_16835 ) ) ( IS-CRATE ?auto_16817 ) ( not ( = ?auto_16834 ?auto_16827 ) ) ( HOIST-AT ?auto_16853 ?auto_16834 ) ( AVAILABLE ?auto_16853 ) ( SURFACE-AT ?auto_16817 ?auto_16834 ) ( ON ?auto_16817 ?auto_16856 ) ( CLEAR ?auto_16817 ) ( not ( = ?auto_16816 ?auto_16817 ) ) ( not ( = ?auto_16816 ?auto_16856 ) ) ( not ( = ?auto_16817 ?auto_16856 ) ) ( not ( = ?auto_16830 ?auto_16853 ) ) ( SURFACE-AT ?auto_16815 ?auto_16827 ) ( CLEAR ?auto_16815 ) ( IS-CRATE ?auto_16816 ) ( AVAILABLE ?auto_16830 ) ( not ( = ?auto_16843 ?auto_16827 ) ) ( HOIST-AT ?auto_16858 ?auto_16843 ) ( AVAILABLE ?auto_16858 ) ( SURFACE-AT ?auto_16816 ?auto_16843 ) ( ON ?auto_16816 ?auto_16833 ) ( CLEAR ?auto_16816 ) ( TRUCK-AT ?auto_16831 ?auto_16827 ) ( not ( = ?auto_16815 ?auto_16816 ) ) ( not ( = ?auto_16815 ?auto_16833 ) ) ( not ( = ?auto_16816 ?auto_16833 ) ) ( not ( = ?auto_16830 ?auto_16858 ) ) ( not ( = ?auto_16815 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16856 ) ) ( not ( = ?auto_16817 ?auto_16833 ) ) ( not ( = ?auto_16834 ?auto_16843 ) ) ( not ( = ?auto_16853 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( not ( = ?auto_16815 ?auto_16840 ) ) ( not ( = ?auto_16816 ?auto_16818 ) ) ( not ( = ?auto_16816 ?auto_16840 ) ) ( not ( = ?auto_16818 ?auto_16856 ) ) ( not ( = ?auto_16818 ?auto_16833 ) ) ( not ( = ?auto_16848 ?auto_16834 ) ) ( not ( = ?auto_16848 ?auto_16843 ) ) ( not ( = ?auto_16835 ?auto_16853 ) ) ( not ( = ?auto_16835 ?auto_16858 ) ) ( not ( = ?auto_16840 ?auto_16856 ) ) ( not ( = ?auto_16840 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16819 ) ) ( not ( = ?auto_16815 ?auto_16842 ) ) ( not ( = ?auto_16816 ?auto_16819 ) ) ( not ( = ?auto_16816 ?auto_16842 ) ) ( not ( = ?auto_16817 ?auto_16819 ) ) ( not ( = ?auto_16817 ?auto_16842 ) ) ( not ( = ?auto_16819 ?auto_16840 ) ) ( not ( = ?auto_16819 ?auto_16856 ) ) ( not ( = ?auto_16819 ?auto_16833 ) ) ( not ( = ?auto_16859 ?auto_16848 ) ) ( not ( = ?auto_16859 ?auto_16834 ) ) ( not ( = ?auto_16859 ?auto_16843 ) ) ( not ( = ?auto_16851 ?auto_16835 ) ) ( not ( = ?auto_16851 ?auto_16853 ) ) ( not ( = ?auto_16851 ?auto_16858 ) ) ( not ( = ?auto_16842 ?auto_16840 ) ) ( not ( = ?auto_16842 ?auto_16856 ) ) ( not ( = ?auto_16842 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16820 ) ) ( not ( = ?auto_16815 ?auto_16854 ) ) ( not ( = ?auto_16816 ?auto_16820 ) ) ( not ( = ?auto_16816 ?auto_16854 ) ) ( not ( = ?auto_16817 ?auto_16820 ) ) ( not ( = ?auto_16817 ?auto_16854 ) ) ( not ( = ?auto_16818 ?auto_16820 ) ) ( not ( = ?auto_16818 ?auto_16854 ) ) ( not ( = ?auto_16820 ?auto_16842 ) ) ( not ( = ?auto_16820 ?auto_16840 ) ) ( not ( = ?auto_16820 ?auto_16856 ) ) ( not ( = ?auto_16820 ?auto_16833 ) ) ( not ( = ?auto_16844 ?auto_16859 ) ) ( not ( = ?auto_16844 ?auto_16848 ) ) ( not ( = ?auto_16844 ?auto_16834 ) ) ( not ( = ?auto_16844 ?auto_16843 ) ) ( not ( = ?auto_16838 ?auto_16851 ) ) ( not ( = ?auto_16838 ?auto_16835 ) ) ( not ( = ?auto_16838 ?auto_16853 ) ) ( not ( = ?auto_16838 ?auto_16858 ) ) ( not ( = ?auto_16854 ?auto_16842 ) ) ( not ( = ?auto_16854 ?auto_16840 ) ) ( not ( = ?auto_16854 ?auto_16856 ) ) ( not ( = ?auto_16854 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16821 ) ) ( not ( = ?auto_16815 ?auto_16839 ) ) ( not ( = ?auto_16816 ?auto_16821 ) ) ( not ( = ?auto_16816 ?auto_16839 ) ) ( not ( = ?auto_16817 ?auto_16821 ) ) ( not ( = ?auto_16817 ?auto_16839 ) ) ( not ( = ?auto_16818 ?auto_16821 ) ) ( not ( = ?auto_16818 ?auto_16839 ) ) ( not ( = ?auto_16819 ?auto_16821 ) ) ( not ( = ?auto_16819 ?auto_16839 ) ) ( not ( = ?auto_16821 ?auto_16854 ) ) ( not ( = ?auto_16821 ?auto_16842 ) ) ( not ( = ?auto_16821 ?auto_16840 ) ) ( not ( = ?auto_16821 ?auto_16856 ) ) ( not ( = ?auto_16821 ?auto_16833 ) ) ( not ( = ?auto_16852 ?auto_16844 ) ) ( not ( = ?auto_16852 ?auto_16859 ) ) ( not ( = ?auto_16852 ?auto_16848 ) ) ( not ( = ?auto_16852 ?auto_16834 ) ) ( not ( = ?auto_16852 ?auto_16843 ) ) ( not ( = ?auto_16841 ?auto_16838 ) ) ( not ( = ?auto_16841 ?auto_16851 ) ) ( not ( = ?auto_16841 ?auto_16835 ) ) ( not ( = ?auto_16841 ?auto_16853 ) ) ( not ( = ?auto_16841 ?auto_16858 ) ) ( not ( = ?auto_16839 ?auto_16854 ) ) ( not ( = ?auto_16839 ?auto_16842 ) ) ( not ( = ?auto_16839 ?auto_16840 ) ) ( not ( = ?auto_16839 ?auto_16856 ) ) ( not ( = ?auto_16839 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16822 ) ) ( not ( = ?auto_16815 ?auto_16857 ) ) ( not ( = ?auto_16816 ?auto_16822 ) ) ( not ( = ?auto_16816 ?auto_16857 ) ) ( not ( = ?auto_16817 ?auto_16822 ) ) ( not ( = ?auto_16817 ?auto_16857 ) ) ( not ( = ?auto_16818 ?auto_16822 ) ) ( not ( = ?auto_16818 ?auto_16857 ) ) ( not ( = ?auto_16819 ?auto_16822 ) ) ( not ( = ?auto_16819 ?auto_16857 ) ) ( not ( = ?auto_16820 ?auto_16822 ) ) ( not ( = ?auto_16820 ?auto_16857 ) ) ( not ( = ?auto_16822 ?auto_16839 ) ) ( not ( = ?auto_16822 ?auto_16854 ) ) ( not ( = ?auto_16822 ?auto_16842 ) ) ( not ( = ?auto_16822 ?auto_16840 ) ) ( not ( = ?auto_16822 ?auto_16856 ) ) ( not ( = ?auto_16822 ?auto_16833 ) ) ( not ( = ?auto_16845 ?auto_16852 ) ) ( not ( = ?auto_16845 ?auto_16844 ) ) ( not ( = ?auto_16845 ?auto_16859 ) ) ( not ( = ?auto_16845 ?auto_16848 ) ) ( not ( = ?auto_16845 ?auto_16834 ) ) ( not ( = ?auto_16845 ?auto_16843 ) ) ( not ( = ?auto_16860 ?auto_16841 ) ) ( not ( = ?auto_16860 ?auto_16838 ) ) ( not ( = ?auto_16860 ?auto_16851 ) ) ( not ( = ?auto_16860 ?auto_16835 ) ) ( not ( = ?auto_16860 ?auto_16853 ) ) ( not ( = ?auto_16860 ?auto_16858 ) ) ( not ( = ?auto_16857 ?auto_16839 ) ) ( not ( = ?auto_16857 ?auto_16854 ) ) ( not ( = ?auto_16857 ?auto_16842 ) ) ( not ( = ?auto_16857 ?auto_16840 ) ) ( not ( = ?auto_16857 ?auto_16856 ) ) ( not ( = ?auto_16857 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16823 ) ) ( not ( = ?auto_16815 ?auto_16847 ) ) ( not ( = ?auto_16816 ?auto_16823 ) ) ( not ( = ?auto_16816 ?auto_16847 ) ) ( not ( = ?auto_16817 ?auto_16823 ) ) ( not ( = ?auto_16817 ?auto_16847 ) ) ( not ( = ?auto_16818 ?auto_16823 ) ) ( not ( = ?auto_16818 ?auto_16847 ) ) ( not ( = ?auto_16819 ?auto_16823 ) ) ( not ( = ?auto_16819 ?auto_16847 ) ) ( not ( = ?auto_16820 ?auto_16823 ) ) ( not ( = ?auto_16820 ?auto_16847 ) ) ( not ( = ?auto_16821 ?auto_16823 ) ) ( not ( = ?auto_16821 ?auto_16847 ) ) ( not ( = ?auto_16823 ?auto_16857 ) ) ( not ( = ?auto_16823 ?auto_16839 ) ) ( not ( = ?auto_16823 ?auto_16854 ) ) ( not ( = ?auto_16823 ?auto_16842 ) ) ( not ( = ?auto_16823 ?auto_16840 ) ) ( not ( = ?auto_16823 ?auto_16856 ) ) ( not ( = ?auto_16823 ?auto_16833 ) ) ( not ( = ?auto_16836 ?auto_16845 ) ) ( not ( = ?auto_16836 ?auto_16852 ) ) ( not ( = ?auto_16836 ?auto_16844 ) ) ( not ( = ?auto_16836 ?auto_16859 ) ) ( not ( = ?auto_16836 ?auto_16848 ) ) ( not ( = ?auto_16836 ?auto_16834 ) ) ( not ( = ?auto_16836 ?auto_16843 ) ) ( not ( = ?auto_16855 ?auto_16860 ) ) ( not ( = ?auto_16855 ?auto_16841 ) ) ( not ( = ?auto_16855 ?auto_16838 ) ) ( not ( = ?auto_16855 ?auto_16851 ) ) ( not ( = ?auto_16855 ?auto_16835 ) ) ( not ( = ?auto_16855 ?auto_16853 ) ) ( not ( = ?auto_16855 ?auto_16858 ) ) ( not ( = ?auto_16847 ?auto_16857 ) ) ( not ( = ?auto_16847 ?auto_16839 ) ) ( not ( = ?auto_16847 ?auto_16854 ) ) ( not ( = ?auto_16847 ?auto_16842 ) ) ( not ( = ?auto_16847 ?auto_16840 ) ) ( not ( = ?auto_16847 ?auto_16856 ) ) ( not ( = ?auto_16847 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16824 ) ) ( not ( = ?auto_16815 ?auto_16837 ) ) ( not ( = ?auto_16816 ?auto_16824 ) ) ( not ( = ?auto_16816 ?auto_16837 ) ) ( not ( = ?auto_16817 ?auto_16824 ) ) ( not ( = ?auto_16817 ?auto_16837 ) ) ( not ( = ?auto_16818 ?auto_16824 ) ) ( not ( = ?auto_16818 ?auto_16837 ) ) ( not ( = ?auto_16819 ?auto_16824 ) ) ( not ( = ?auto_16819 ?auto_16837 ) ) ( not ( = ?auto_16820 ?auto_16824 ) ) ( not ( = ?auto_16820 ?auto_16837 ) ) ( not ( = ?auto_16821 ?auto_16824 ) ) ( not ( = ?auto_16821 ?auto_16837 ) ) ( not ( = ?auto_16822 ?auto_16824 ) ) ( not ( = ?auto_16822 ?auto_16837 ) ) ( not ( = ?auto_16824 ?auto_16847 ) ) ( not ( = ?auto_16824 ?auto_16857 ) ) ( not ( = ?auto_16824 ?auto_16839 ) ) ( not ( = ?auto_16824 ?auto_16854 ) ) ( not ( = ?auto_16824 ?auto_16842 ) ) ( not ( = ?auto_16824 ?auto_16840 ) ) ( not ( = ?auto_16824 ?auto_16856 ) ) ( not ( = ?auto_16824 ?auto_16833 ) ) ( not ( = ?auto_16849 ?auto_16836 ) ) ( not ( = ?auto_16849 ?auto_16845 ) ) ( not ( = ?auto_16849 ?auto_16852 ) ) ( not ( = ?auto_16849 ?auto_16844 ) ) ( not ( = ?auto_16849 ?auto_16859 ) ) ( not ( = ?auto_16849 ?auto_16848 ) ) ( not ( = ?auto_16849 ?auto_16834 ) ) ( not ( = ?auto_16849 ?auto_16843 ) ) ( not ( = ?auto_16850 ?auto_16855 ) ) ( not ( = ?auto_16850 ?auto_16860 ) ) ( not ( = ?auto_16850 ?auto_16841 ) ) ( not ( = ?auto_16850 ?auto_16838 ) ) ( not ( = ?auto_16850 ?auto_16851 ) ) ( not ( = ?auto_16850 ?auto_16835 ) ) ( not ( = ?auto_16850 ?auto_16853 ) ) ( not ( = ?auto_16850 ?auto_16858 ) ) ( not ( = ?auto_16837 ?auto_16847 ) ) ( not ( = ?auto_16837 ?auto_16857 ) ) ( not ( = ?auto_16837 ?auto_16839 ) ) ( not ( = ?auto_16837 ?auto_16854 ) ) ( not ( = ?auto_16837 ?auto_16842 ) ) ( not ( = ?auto_16837 ?auto_16840 ) ) ( not ( = ?auto_16837 ?auto_16856 ) ) ( not ( = ?auto_16837 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16825 ) ) ( not ( = ?auto_16815 ?auto_16846 ) ) ( not ( = ?auto_16816 ?auto_16825 ) ) ( not ( = ?auto_16816 ?auto_16846 ) ) ( not ( = ?auto_16817 ?auto_16825 ) ) ( not ( = ?auto_16817 ?auto_16846 ) ) ( not ( = ?auto_16818 ?auto_16825 ) ) ( not ( = ?auto_16818 ?auto_16846 ) ) ( not ( = ?auto_16819 ?auto_16825 ) ) ( not ( = ?auto_16819 ?auto_16846 ) ) ( not ( = ?auto_16820 ?auto_16825 ) ) ( not ( = ?auto_16820 ?auto_16846 ) ) ( not ( = ?auto_16821 ?auto_16825 ) ) ( not ( = ?auto_16821 ?auto_16846 ) ) ( not ( = ?auto_16822 ?auto_16825 ) ) ( not ( = ?auto_16822 ?auto_16846 ) ) ( not ( = ?auto_16823 ?auto_16825 ) ) ( not ( = ?auto_16823 ?auto_16846 ) ) ( not ( = ?auto_16825 ?auto_16837 ) ) ( not ( = ?auto_16825 ?auto_16847 ) ) ( not ( = ?auto_16825 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16839 ) ) ( not ( = ?auto_16825 ?auto_16854 ) ) ( not ( = ?auto_16825 ?auto_16842 ) ) ( not ( = ?auto_16825 ?auto_16840 ) ) ( not ( = ?auto_16825 ?auto_16856 ) ) ( not ( = ?auto_16825 ?auto_16833 ) ) ( not ( = ?auto_16846 ?auto_16837 ) ) ( not ( = ?auto_16846 ?auto_16847 ) ) ( not ( = ?auto_16846 ?auto_16857 ) ) ( not ( = ?auto_16846 ?auto_16839 ) ) ( not ( = ?auto_16846 ?auto_16854 ) ) ( not ( = ?auto_16846 ?auto_16842 ) ) ( not ( = ?auto_16846 ?auto_16840 ) ) ( not ( = ?auto_16846 ?auto_16856 ) ) ( not ( = ?auto_16846 ?auto_16833 ) ) ( not ( = ?auto_16815 ?auto_16826 ) ) ( not ( = ?auto_16815 ?auto_16832 ) ) ( not ( = ?auto_16816 ?auto_16826 ) ) ( not ( = ?auto_16816 ?auto_16832 ) ) ( not ( = ?auto_16817 ?auto_16826 ) ) ( not ( = ?auto_16817 ?auto_16832 ) ) ( not ( = ?auto_16818 ?auto_16826 ) ) ( not ( = ?auto_16818 ?auto_16832 ) ) ( not ( = ?auto_16819 ?auto_16826 ) ) ( not ( = ?auto_16819 ?auto_16832 ) ) ( not ( = ?auto_16820 ?auto_16826 ) ) ( not ( = ?auto_16820 ?auto_16832 ) ) ( not ( = ?auto_16821 ?auto_16826 ) ) ( not ( = ?auto_16821 ?auto_16832 ) ) ( not ( = ?auto_16822 ?auto_16826 ) ) ( not ( = ?auto_16822 ?auto_16832 ) ) ( not ( = ?auto_16823 ?auto_16826 ) ) ( not ( = ?auto_16823 ?auto_16832 ) ) ( not ( = ?auto_16824 ?auto_16826 ) ) ( not ( = ?auto_16824 ?auto_16832 ) ) ( not ( = ?auto_16826 ?auto_16846 ) ) ( not ( = ?auto_16826 ?auto_16837 ) ) ( not ( = ?auto_16826 ?auto_16847 ) ) ( not ( = ?auto_16826 ?auto_16857 ) ) ( not ( = ?auto_16826 ?auto_16839 ) ) ( not ( = ?auto_16826 ?auto_16854 ) ) ( not ( = ?auto_16826 ?auto_16842 ) ) ( not ( = ?auto_16826 ?auto_16840 ) ) ( not ( = ?auto_16826 ?auto_16856 ) ) ( not ( = ?auto_16826 ?auto_16833 ) ) ( not ( = ?auto_16829 ?auto_16849 ) ) ( not ( = ?auto_16829 ?auto_16836 ) ) ( not ( = ?auto_16829 ?auto_16845 ) ) ( not ( = ?auto_16829 ?auto_16852 ) ) ( not ( = ?auto_16829 ?auto_16844 ) ) ( not ( = ?auto_16829 ?auto_16859 ) ) ( not ( = ?auto_16829 ?auto_16848 ) ) ( not ( = ?auto_16829 ?auto_16834 ) ) ( not ( = ?auto_16829 ?auto_16843 ) ) ( not ( = ?auto_16828 ?auto_16850 ) ) ( not ( = ?auto_16828 ?auto_16855 ) ) ( not ( = ?auto_16828 ?auto_16860 ) ) ( not ( = ?auto_16828 ?auto_16841 ) ) ( not ( = ?auto_16828 ?auto_16838 ) ) ( not ( = ?auto_16828 ?auto_16851 ) ) ( not ( = ?auto_16828 ?auto_16835 ) ) ( not ( = ?auto_16828 ?auto_16853 ) ) ( not ( = ?auto_16828 ?auto_16858 ) ) ( not ( = ?auto_16832 ?auto_16846 ) ) ( not ( = ?auto_16832 ?auto_16837 ) ) ( not ( = ?auto_16832 ?auto_16847 ) ) ( not ( = ?auto_16832 ?auto_16857 ) ) ( not ( = ?auto_16832 ?auto_16839 ) ) ( not ( = ?auto_16832 ?auto_16854 ) ) ( not ( = ?auto_16832 ?auto_16842 ) ) ( not ( = ?auto_16832 ?auto_16840 ) ) ( not ( = ?auto_16832 ?auto_16856 ) ) ( not ( = ?auto_16832 ?auto_16833 ) ) )
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
      ?auto_16899 - HOIST
      ?auto_16900 - PLACE
      ?auto_16897 - PLACE
      ?auto_16901 - HOIST
      ?auto_16902 - SURFACE
      ?auto_16906 - SURFACE
      ?auto_16909 - PLACE
      ?auto_16905 - HOIST
      ?auto_16912 - SURFACE
      ?auto_16920 - SURFACE
      ?auto_16931 - PLACE
      ?auto_16925 - HOIST
      ?auto_16904 - SURFACE
      ?auto_16917 - PLACE
      ?auto_16927 - HOIST
      ?auto_16918 - SURFACE
      ?auto_16923 - PLACE
      ?auto_16919 - HOIST
      ?auto_16924 - SURFACE
      ?auto_16913 - PLACE
      ?auto_16907 - HOIST
      ?auto_16903 - SURFACE
      ?auto_16928 - PLACE
      ?auto_16921 - HOIST
      ?auto_16929 - SURFACE
      ?auto_16914 - PLACE
      ?auto_16915 - HOIST
      ?auto_16922 - SURFACE
      ?auto_16910 - PLACE
      ?auto_16926 - HOIST
      ?auto_16911 - SURFACE
      ?auto_16930 - PLACE
      ?auto_16916 - HOIST
      ?auto_16908 - SURFACE
      ?auto_16898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16899 ?auto_16900 ) ( IS-CRATE ?auto_16896 ) ( not ( = ?auto_16897 ?auto_16900 ) ) ( HOIST-AT ?auto_16901 ?auto_16897 ) ( SURFACE-AT ?auto_16896 ?auto_16897 ) ( ON ?auto_16896 ?auto_16902 ) ( CLEAR ?auto_16896 ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16902 ) ) ( not ( = ?auto_16896 ?auto_16902 ) ) ( not ( = ?auto_16899 ?auto_16901 ) ) ( IS-CRATE ?auto_16895 ) ( AVAILABLE ?auto_16901 ) ( SURFACE-AT ?auto_16895 ?auto_16897 ) ( ON ?auto_16895 ?auto_16906 ) ( CLEAR ?auto_16895 ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16906 ) ) ( not ( = ?auto_16895 ?auto_16906 ) ) ( IS-CRATE ?auto_16894 ) ( not ( = ?auto_16909 ?auto_16900 ) ) ( HOIST-AT ?auto_16905 ?auto_16909 ) ( SURFACE-AT ?auto_16894 ?auto_16909 ) ( ON ?auto_16894 ?auto_16912 ) ( CLEAR ?auto_16894 ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16912 ) ) ( not ( = ?auto_16894 ?auto_16912 ) ) ( not ( = ?auto_16899 ?auto_16905 ) ) ( IS-CRATE ?auto_16893 ) ( AVAILABLE ?auto_16905 ) ( SURFACE-AT ?auto_16893 ?auto_16909 ) ( ON ?auto_16893 ?auto_16920 ) ( CLEAR ?auto_16893 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16920 ) ) ( not ( = ?auto_16893 ?auto_16920 ) ) ( IS-CRATE ?auto_16892 ) ( not ( = ?auto_16931 ?auto_16900 ) ) ( HOIST-AT ?auto_16925 ?auto_16931 ) ( AVAILABLE ?auto_16925 ) ( SURFACE-AT ?auto_16892 ?auto_16931 ) ( ON ?auto_16892 ?auto_16904 ) ( CLEAR ?auto_16892 ) ( not ( = ?auto_16891 ?auto_16892 ) ) ( not ( = ?auto_16891 ?auto_16904 ) ) ( not ( = ?auto_16892 ?auto_16904 ) ) ( not ( = ?auto_16899 ?auto_16925 ) ) ( IS-CRATE ?auto_16891 ) ( not ( = ?auto_16917 ?auto_16900 ) ) ( HOIST-AT ?auto_16927 ?auto_16917 ) ( AVAILABLE ?auto_16927 ) ( SURFACE-AT ?auto_16891 ?auto_16917 ) ( ON ?auto_16891 ?auto_16918 ) ( CLEAR ?auto_16891 ) ( not ( = ?auto_16890 ?auto_16891 ) ) ( not ( = ?auto_16890 ?auto_16918 ) ) ( not ( = ?auto_16891 ?auto_16918 ) ) ( not ( = ?auto_16899 ?auto_16927 ) ) ( IS-CRATE ?auto_16890 ) ( not ( = ?auto_16923 ?auto_16900 ) ) ( HOIST-AT ?auto_16919 ?auto_16923 ) ( AVAILABLE ?auto_16919 ) ( SURFACE-AT ?auto_16890 ?auto_16923 ) ( ON ?auto_16890 ?auto_16924 ) ( CLEAR ?auto_16890 ) ( not ( = ?auto_16889 ?auto_16890 ) ) ( not ( = ?auto_16889 ?auto_16924 ) ) ( not ( = ?auto_16890 ?auto_16924 ) ) ( not ( = ?auto_16899 ?auto_16919 ) ) ( IS-CRATE ?auto_16889 ) ( not ( = ?auto_16913 ?auto_16900 ) ) ( HOIST-AT ?auto_16907 ?auto_16913 ) ( AVAILABLE ?auto_16907 ) ( SURFACE-AT ?auto_16889 ?auto_16913 ) ( ON ?auto_16889 ?auto_16903 ) ( CLEAR ?auto_16889 ) ( not ( = ?auto_16888 ?auto_16889 ) ) ( not ( = ?auto_16888 ?auto_16903 ) ) ( not ( = ?auto_16889 ?auto_16903 ) ) ( not ( = ?auto_16899 ?auto_16907 ) ) ( IS-CRATE ?auto_16888 ) ( not ( = ?auto_16928 ?auto_16900 ) ) ( HOIST-AT ?auto_16921 ?auto_16928 ) ( AVAILABLE ?auto_16921 ) ( SURFACE-AT ?auto_16888 ?auto_16928 ) ( ON ?auto_16888 ?auto_16929 ) ( CLEAR ?auto_16888 ) ( not ( = ?auto_16887 ?auto_16888 ) ) ( not ( = ?auto_16887 ?auto_16929 ) ) ( not ( = ?auto_16888 ?auto_16929 ) ) ( not ( = ?auto_16899 ?auto_16921 ) ) ( IS-CRATE ?auto_16887 ) ( not ( = ?auto_16914 ?auto_16900 ) ) ( HOIST-AT ?auto_16915 ?auto_16914 ) ( AVAILABLE ?auto_16915 ) ( SURFACE-AT ?auto_16887 ?auto_16914 ) ( ON ?auto_16887 ?auto_16922 ) ( CLEAR ?auto_16887 ) ( not ( = ?auto_16886 ?auto_16887 ) ) ( not ( = ?auto_16886 ?auto_16922 ) ) ( not ( = ?auto_16887 ?auto_16922 ) ) ( not ( = ?auto_16899 ?auto_16915 ) ) ( IS-CRATE ?auto_16886 ) ( not ( = ?auto_16910 ?auto_16900 ) ) ( HOIST-AT ?auto_16926 ?auto_16910 ) ( AVAILABLE ?auto_16926 ) ( SURFACE-AT ?auto_16886 ?auto_16910 ) ( ON ?auto_16886 ?auto_16911 ) ( CLEAR ?auto_16886 ) ( not ( = ?auto_16885 ?auto_16886 ) ) ( not ( = ?auto_16885 ?auto_16911 ) ) ( not ( = ?auto_16886 ?auto_16911 ) ) ( not ( = ?auto_16899 ?auto_16926 ) ) ( SURFACE-AT ?auto_16884 ?auto_16900 ) ( CLEAR ?auto_16884 ) ( IS-CRATE ?auto_16885 ) ( AVAILABLE ?auto_16899 ) ( not ( = ?auto_16930 ?auto_16900 ) ) ( HOIST-AT ?auto_16916 ?auto_16930 ) ( AVAILABLE ?auto_16916 ) ( SURFACE-AT ?auto_16885 ?auto_16930 ) ( ON ?auto_16885 ?auto_16908 ) ( CLEAR ?auto_16885 ) ( TRUCK-AT ?auto_16898 ?auto_16900 ) ( not ( = ?auto_16884 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16908 ) ) ( not ( = ?auto_16885 ?auto_16908 ) ) ( not ( = ?auto_16899 ?auto_16916 ) ) ( not ( = ?auto_16884 ?auto_16886 ) ) ( not ( = ?auto_16884 ?auto_16911 ) ) ( not ( = ?auto_16886 ?auto_16908 ) ) ( not ( = ?auto_16910 ?auto_16930 ) ) ( not ( = ?auto_16926 ?auto_16916 ) ) ( not ( = ?auto_16911 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16887 ) ) ( not ( = ?auto_16884 ?auto_16922 ) ) ( not ( = ?auto_16885 ?auto_16887 ) ) ( not ( = ?auto_16885 ?auto_16922 ) ) ( not ( = ?auto_16887 ?auto_16911 ) ) ( not ( = ?auto_16887 ?auto_16908 ) ) ( not ( = ?auto_16914 ?auto_16910 ) ) ( not ( = ?auto_16914 ?auto_16930 ) ) ( not ( = ?auto_16915 ?auto_16926 ) ) ( not ( = ?auto_16915 ?auto_16916 ) ) ( not ( = ?auto_16922 ?auto_16911 ) ) ( not ( = ?auto_16922 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16888 ) ) ( not ( = ?auto_16884 ?auto_16929 ) ) ( not ( = ?auto_16885 ?auto_16888 ) ) ( not ( = ?auto_16885 ?auto_16929 ) ) ( not ( = ?auto_16886 ?auto_16888 ) ) ( not ( = ?auto_16886 ?auto_16929 ) ) ( not ( = ?auto_16888 ?auto_16922 ) ) ( not ( = ?auto_16888 ?auto_16911 ) ) ( not ( = ?auto_16888 ?auto_16908 ) ) ( not ( = ?auto_16928 ?auto_16914 ) ) ( not ( = ?auto_16928 ?auto_16910 ) ) ( not ( = ?auto_16928 ?auto_16930 ) ) ( not ( = ?auto_16921 ?auto_16915 ) ) ( not ( = ?auto_16921 ?auto_16926 ) ) ( not ( = ?auto_16921 ?auto_16916 ) ) ( not ( = ?auto_16929 ?auto_16922 ) ) ( not ( = ?auto_16929 ?auto_16911 ) ) ( not ( = ?auto_16929 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16889 ) ) ( not ( = ?auto_16884 ?auto_16903 ) ) ( not ( = ?auto_16885 ?auto_16889 ) ) ( not ( = ?auto_16885 ?auto_16903 ) ) ( not ( = ?auto_16886 ?auto_16889 ) ) ( not ( = ?auto_16886 ?auto_16903 ) ) ( not ( = ?auto_16887 ?auto_16889 ) ) ( not ( = ?auto_16887 ?auto_16903 ) ) ( not ( = ?auto_16889 ?auto_16929 ) ) ( not ( = ?auto_16889 ?auto_16922 ) ) ( not ( = ?auto_16889 ?auto_16911 ) ) ( not ( = ?auto_16889 ?auto_16908 ) ) ( not ( = ?auto_16913 ?auto_16928 ) ) ( not ( = ?auto_16913 ?auto_16914 ) ) ( not ( = ?auto_16913 ?auto_16910 ) ) ( not ( = ?auto_16913 ?auto_16930 ) ) ( not ( = ?auto_16907 ?auto_16921 ) ) ( not ( = ?auto_16907 ?auto_16915 ) ) ( not ( = ?auto_16907 ?auto_16926 ) ) ( not ( = ?auto_16907 ?auto_16916 ) ) ( not ( = ?auto_16903 ?auto_16929 ) ) ( not ( = ?auto_16903 ?auto_16922 ) ) ( not ( = ?auto_16903 ?auto_16911 ) ) ( not ( = ?auto_16903 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16890 ) ) ( not ( = ?auto_16884 ?auto_16924 ) ) ( not ( = ?auto_16885 ?auto_16890 ) ) ( not ( = ?auto_16885 ?auto_16924 ) ) ( not ( = ?auto_16886 ?auto_16890 ) ) ( not ( = ?auto_16886 ?auto_16924 ) ) ( not ( = ?auto_16887 ?auto_16890 ) ) ( not ( = ?auto_16887 ?auto_16924 ) ) ( not ( = ?auto_16888 ?auto_16890 ) ) ( not ( = ?auto_16888 ?auto_16924 ) ) ( not ( = ?auto_16890 ?auto_16903 ) ) ( not ( = ?auto_16890 ?auto_16929 ) ) ( not ( = ?auto_16890 ?auto_16922 ) ) ( not ( = ?auto_16890 ?auto_16911 ) ) ( not ( = ?auto_16890 ?auto_16908 ) ) ( not ( = ?auto_16923 ?auto_16913 ) ) ( not ( = ?auto_16923 ?auto_16928 ) ) ( not ( = ?auto_16923 ?auto_16914 ) ) ( not ( = ?auto_16923 ?auto_16910 ) ) ( not ( = ?auto_16923 ?auto_16930 ) ) ( not ( = ?auto_16919 ?auto_16907 ) ) ( not ( = ?auto_16919 ?auto_16921 ) ) ( not ( = ?auto_16919 ?auto_16915 ) ) ( not ( = ?auto_16919 ?auto_16926 ) ) ( not ( = ?auto_16919 ?auto_16916 ) ) ( not ( = ?auto_16924 ?auto_16903 ) ) ( not ( = ?auto_16924 ?auto_16929 ) ) ( not ( = ?auto_16924 ?auto_16922 ) ) ( not ( = ?auto_16924 ?auto_16911 ) ) ( not ( = ?auto_16924 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16891 ) ) ( not ( = ?auto_16884 ?auto_16918 ) ) ( not ( = ?auto_16885 ?auto_16891 ) ) ( not ( = ?auto_16885 ?auto_16918 ) ) ( not ( = ?auto_16886 ?auto_16891 ) ) ( not ( = ?auto_16886 ?auto_16918 ) ) ( not ( = ?auto_16887 ?auto_16891 ) ) ( not ( = ?auto_16887 ?auto_16918 ) ) ( not ( = ?auto_16888 ?auto_16891 ) ) ( not ( = ?auto_16888 ?auto_16918 ) ) ( not ( = ?auto_16889 ?auto_16891 ) ) ( not ( = ?auto_16889 ?auto_16918 ) ) ( not ( = ?auto_16891 ?auto_16924 ) ) ( not ( = ?auto_16891 ?auto_16903 ) ) ( not ( = ?auto_16891 ?auto_16929 ) ) ( not ( = ?auto_16891 ?auto_16922 ) ) ( not ( = ?auto_16891 ?auto_16911 ) ) ( not ( = ?auto_16891 ?auto_16908 ) ) ( not ( = ?auto_16917 ?auto_16923 ) ) ( not ( = ?auto_16917 ?auto_16913 ) ) ( not ( = ?auto_16917 ?auto_16928 ) ) ( not ( = ?auto_16917 ?auto_16914 ) ) ( not ( = ?auto_16917 ?auto_16910 ) ) ( not ( = ?auto_16917 ?auto_16930 ) ) ( not ( = ?auto_16927 ?auto_16919 ) ) ( not ( = ?auto_16927 ?auto_16907 ) ) ( not ( = ?auto_16927 ?auto_16921 ) ) ( not ( = ?auto_16927 ?auto_16915 ) ) ( not ( = ?auto_16927 ?auto_16926 ) ) ( not ( = ?auto_16927 ?auto_16916 ) ) ( not ( = ?auto_16918 ?auto_16924 ) ) ( not ( = ?auto_16918 ?auto_16903 ) ) ( not ( = ?auto_16918 ?auto_16929 ) ) ( not ( = ?auto_16918 ?auto_16922 ) ) ( not ( = ?auto_16918 ?auto_16911 ) ) ( not ( = ?auto_16918 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16892 ) ) ( not ( = ?auto_16884 ?auto_16904 ) ) ( not ( = ?auto_16885 ?auto_16892 ) ) ( not ( = ?auto_16885 ?auto_16904 ) ) ( not ( = ?auto_16886 ?auto_16892 ) ) ( not ( = ?auto_16886 ?auto_16904 ) ) ( not ( = ?auto_16887 ?auto_16892 ) ) ( not ( = ?auto_16887 ?auto_16904 ) ) ( not ( = ?auto_16888 ?auto_16892 ) ) ( not ( = ?auto_16888 ?auto_16904 ) ) ( not ( = ?auto_16889 ?auto_16892 ) ) ( not ( = ?auto_16889 ?auto_16904 ) ) ( not ( = ?auto_16890 ?auto_16892 ) ) ( not ( = ?auto_16890 ?auto_16904 ) ) ( not ( = ?auto_16892 ?auto_16918 ) ) ( not ( = ?auto_16892 ?auto_16924 ) ) ( not ( = ?auto_16892 ?auto_16903 ) ) ( not ( = ?auto_16892 ?auto_16929 ) ) ( not ( = ?auto_16892 ?auto_16922 ) ) ( not ( = ?auto_16892 ?auto_16911 ) ) ( not ( = ?auto_16892 ?auto_16908 ) ) ( not ( = ?auto_16931 ?auto_16917 ) ) ( not ( = ?auto_16931 ?auto_16923 ) ) ( not ( = ?auto_16931 ?auto_16913 ) ) ( not ( = ?auto_16931 ?auto_16928 ) ) ( not ( = ?auto_16931 ?auto_16914 ) ) ( not ( = ?auto_16931 ?auto_16910 ) ) ( not ( = ?auto_16931 ?auto_16930 ) ) ( not ( = ?auto_16925 ?auto_16927 ) ) ( not ( = ?auto_16925 ?auto_16919 ) ) ( not ( = ?auto_16925 ?auto_16907 ) ) ( not ( = ?auto_16925 ?auto_16921 ) ) ( not ( = ?auto_16925 ?auto_16915 ) ) ( not ( = ?auto_16925 ?auto_16926 ) ) ( not ( = ?auto_16925 ?auto_16916 ) ) ( not ( = ?auto_16904 ?auto_16918 ) ) ( not ( = ?auto_16904 ?auto_16924 ) ) ( not ( = ?auto_16904 ?auto_16903 ) ) ( not ( = ?auto_16904 ?auto_16929 ) ) ( not ( = ?auto_16904 ?auto_16922 ) ) ( not ( = ?auto_16904 ?auto_16911 ) ) ( not ( = ?auto_16904 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16893 ) ) ( not ( = ?auto_16884 ?auto_16920 ) ) ( not ( = ?auto_16885 ?auto_16893 ) ) ( not ( = ?auto_16885 ?auto_16920 ) ) ( not ( = ?auto_16886 ?auto_16893 ) ) ( not ( = ?auto_16886 ?auto_16920 ) ) ( not ( = ?auto_16887 ?auto_16893 ) ) ( not ( = ?auto_16887 ?auto_16920 ) ) ( not ( = ?auto_16888 ?auto_16893 ) ) ( not ( = ?auto_16888 ?auto_16920 ) ) ( not ( = ?auto_16889 ?auto_16893 ) ) ( not ( = ?auto_16889 ?auto_16920 ) ) ( not ( = ?auto_16890 ?auto_16893 ) ) ( not ( = ?auto_16890 ?auto_16920 ) ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16920 ) ) ( not ( = ?auto_16893 ?auto_16904 ) ) ( not ( = ?auto_16893 ?auto_16918 ) ) ( not ( = ?auto_16893 ?auto_16924 ) ) ( not ( = ?auto_16893 ?auto_16903 ) ) ( not ( = ?auto_16893 ?auto_16929 ) ) ( not ( = ?auto_16893 ?auto_16922 ) ) ( not ( = ?auto_16893 ?auto_16911 ) ) ( not ( = ?auto_16893 ?auto_16908 ) ) ( not ( = ?auto_16909 ?auto_16931 ) ) ( not ( = ?auto_16909 ?auto_16917 ) ) ( not ( = ?auto_16909 ?auto_16923 ) ) ( not ( = ?auto_16909 ?auto_16913 ) ) ( not ( = ?auto_16909 ?auto_16928 ) ) ( not ( = ?auto_16909 ?auto_16914 ) ) ( not ( = ?auto_16909 ?auto_16910 ) ) ( not ( = ?auto_16909 ?auto_16930 ) ) ( not ( = ?auto_16905 ?auto_16925 ) ) ( not ( = ?auto_16905 ?auto_16927 ) ) ( not ( = ?auto_16905 ?auto_16919 ) ) ( not ( = ?auto_16905 ?auto_16907 ) ) ( not ( = ?auto_16905 ?auto_16921 ) ) ( not ( = ?auto_16905 ?auto_16915 ) ) ( not ( = ?auto_16905 ?auto_16926 ) ) ( not ( = ?auto_16905 ?auto_16916 ) ) ( not ( = ?auto_16920 ?auto_16904 ) ) ( not ( = ?auto_16920 ?auto_16918 ) ) ( not ( = ?auto_16920 ?auto_16924 ) ) ( not ( = ?auto_16920 ?auto_16903 ) ) ( not ( = ?auto_16920 ?auto_16929 ) ) ( not ( = ?auto_16920 ?auto_16922 ) ) ( not ( = ?auto_16920 ?auto_16911 ) ) ( not ( = ?auto_16920 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16894 ) ) ( not ( = ?auto_16884 ?auto_16912 ) ) ( not ( = ?auto_16885 ?auto_16894 ) ) ( not ( = ?auto_16885 ?auto_16912 ) ) ( not ( = ?auto_16886 ?auto_16894 ) ) ( not ( = ?auto_16886 ?auto_16912 ) ) ( not ( = ?auto_16887 ?auto_16894 ) ) ( not ( = ?auto_16887 ?auto_16912 ) ) ( not ( = ?auto_16888 ?auto_16894 ) ) ( not ( = ?auto_16888 ?auto_16912 ) ) ( not ( = ?auto_16889 ?auto_16894 ) ) ( not ( = ?auto_16889 ?auto_16912 ) ) ( not ( = ?auto_16890 ?auto_16894 ) ) ( not ( = ?auto_16890 ?auto_16912 ) ) ( not ( = ?auto_16891 ?auto_16894 ) ) ( not ( = ?auto_16891 ?auto_16912 ) ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16912 ) ) ( not ( = ?auto_16894 ?auto_16920 ) ) ( not ( = ?auto_16894 ?auto_16904 ) ) ( not ( = ?auto_16894 ?auto_16918 ) ) ( not ( = ?auto_16894 ?auto_16924 ) ) ( not ( = ?auto_16894 ?auto_16903 ) ) ( not ( = ?auto_16894 ?auto_16929 ) ) ( not ( = ?auto_16894 ?auto_16922 ) ) ( not ( = ?auto_16894 ?auto_16911 ) ) ( not ( = ?auto_16894 ?auto_16908 ) ) ( not ( = ?auto_16912 ?auto_16920 ) ) ( not ( = ?auto_16912 ?auto_16904 ) ) ( not ( = ?auto_16912 ?auto_16918 ) ) ( not ( = ?auto_16912 ?auto_16924 ) ) ( not ( = ?auto_16912 ?auto_16903 ) ) ( not ( = ?auto_16912 ?auto_16929 ) ) ( not ( = ?auto_16912 ?auto_16922 ) ) ( not ( = ?auto_16912 ?auto_16911 ) ) ( not ( = ?auto_16912 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16895 ) ) ( not ( = ?auto_16884 ?auto_16906 ) ) ( not ( = ?auto_16885 ?auto_16895 ) ) ( not ( = ?auto_16885 ?auto_16906 ) ) ( not ( = ?auto_16886 ?auto_16895 ) ) ( not ( = ?auto_16886 ?auto_16906 ) ) ( not ( = ?auto_16887 ?auto_16895 ) ) ( not ( = ?auto_16887 ?auto_16906 ) ) ( not ( = ?auto_16888 ?auto_16895 ) ) ( not ( = ?auto_16888 ?auto_16906 ) ) ( not ( = ?auto_16889 ?auto_16895 ) ) ( not ( = ?auto_16889 ?auto_16906 ) ) ( not ( = ?auto_16890 ?auto_16895 ) ) ( not ( = ?auto_16890 ?auto_16906 ) ) ( not ( = ?auto_16891 ?auto_16895 ) ) ( not ( = ?auto_16891 ?auto_16906 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16892 ?auto_16906 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16906 ) ) ( not ( = ?auto_16895 ?auto_16912 ) ) ( not ( = ?auto_16895 ?auto_16920 ) ) ( not ( = ?auto_16895 ?auto_16904 ) ) ( not ( = ?auto_16895 ?auto_16918 ) ) ( not ( = ?auto_16895 ?auto_16924 ) ) ( not ( = ?auto_16895 ?auto_16903 ) ) ( not ( = ?auto_16895 ?auto_16929 ) ) ( not ( = ?auto_16895 ?auto_16922 ) ) ( not ( = ?auto_16895 ?auto_16911 ) ) ( not ( = ?auto_16895 ?auto_16908 ) ) ( not ( = ?auto_16897 ?auto_16909 ) ) ( not ( = ?auto_16897 ?auto_16931 ) ) ( not ( = ?auto_16897 ?auto_16917 ) ) ( not ( = ?auto_16897 ?auto_16923 ) ) ( not ( = ?auto_16897 ?auto_16913 ) ) ( not ( = ?auto_16897 ?auto_16928 ) ) ( not ( = ?auto_16897 ?auto_16914 ) ) ( not ( = ?auto_16897 ?auto_16910 ) ) ( not ( = ?auto_16897 ?auto_16930 ) ) ( not ( = ?auto_16901 ?auto_16905 ) ) ( not ( = ?auto_16901 ?auto_16925 ) ) ( not ( = ?auto_16901 ?auto_16927 ) ) ( not ( = ?auto_16901 ?auto_16919 ) ) ( not ( = ?auto_16901 ?auto_16907 ) ) ( not ( = ?auto_16901 ?auto_16921 ) ) ( not ( = ?auto_16901 ?auto_16915 ) ) ( not ( = ?auto_16901 ?auto_16926 ) ) ( not ( = ?auto_16901 ?auto_16916 ) ) ( not ( = ?auto_16906 ?auto_16912 ) ) ( not ( = ?auto_16906 ?auto_16920 ) ) ( not ( = ?auto_16906 ?auto_16904 ) ) ( not ( = ?auto_16906 ?auto_16918 ) ) ( not ( = ?auto_16906 ?auto_16924 ) ) ( not ( = ?auto_16906 ?auto_16903 ) ) ( not ( = ?auto_16906 ?auto_16929 ) ) ( not ( = ?auto_16906 ?auto_16922 ) ) ( not ( = ?auto_16906 ?auto_16911 ) ) ( not ( = ?auto_16906 ?auto_16908 ) ) ( not ( = ?auto_16884 ?auto_16896 ) ) ( not ( = ?auto_16884 ?auto_16902 ) ) ( not ( = ?auto_16885 ?auto_16896 ) ) ( not ( = ?auto_16885 ?auto_16902 ) ) ( not ( = ?auto_16886 ?auto_16896 ) ) ( not ( = ?auto_16886 ?auto_16902 ) ) ( not ( = ?auto_16887 ?auto_16896 ) ) ( not ( = ?auto_16887 ?auto_16902 ) ) ( not ( = ?auto_16888 ?auto_16896 ) ) ( not ( = ?auto_16888 ?auto_16902 ) ) ( not ( = ?auto_16889 ?auto_16896 ) ) ( not ( = ?auto_16889 ?auto_16902 ) ) ( not ( = ?auto_16890 ?auto_16896 ) ) ( not ( = ?auto_16890 ?auto_16902 ) ) ( not ( = ?auto_16891 ?auto_16896 ) ) ( not ( = ?auto_16891 ?auto_16902 ) ) ( not ( = ?auto_16892 ?auto_16896 ) ) ( not ( = ?auto_16892 ?auto_16902 ) ) ( not ( = ?auto_16893 ?auto_16896 ) ) ( not ( = ?auto_16893 ?auto_16902 ) ) ( not ( = ?auto_16894 ?auto_16896 ) ) ( not ( = ?auto_16894 ?auto_16902 ) ) ( not ( = ?auto_16896 ?auto_16906 ) ) ( not ( = ?auto_16896 ?auto_16912 ) ) ( not ( = ?auto_16896 ?auto_16920 ) ) ( not ( = ?auto_16896 ?auto_16904 ) ) ( not ( = ?auto_16896 ?auto_16918 ) ) ( not ( = ?auto_16896 ?auto_16924 ) ) ( not ( = ?auto_16896 ?auto_16903 ) ) ( not ( = ?auto_16896 ?auto_16929 ) ) ( not ( = ?auto_16896 ?auto_16922 ) ) ( not ( = ?auto_16896 ?auto_16911 ) ) ( not ( = ?auto_16896 ?auto_16908 ) ) ( not ( = ?auto_16902 ?auto_16906 ) ) ( not ( = ?auto_16902 ?auto_16912 ) ) ( not ( = ?auto_16902 ?auto_16920 ) ) ( not ( = ?auto_16902 ?auto_16904 ) ) ( not ( = ?auto_16902 ?auto_16918 ) ) ( not ( = ?auto_16902 ?auto_16924 ) ) ( not ( = ?auto_16902 ?auto_16903 ) ) ( not ( = ?auto_16902 ?auto_16929 ) ) ( not ( = ?auto_16902 ?auto_16922 ) ) ( not ( = ?auto_16902 ?auto_16911 ) ) ( not ( = ?auto_16902 ?auto_16908 ) ) )
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
      ?auto_16975 - PLACE
      ?auto_16970 - PLACE
      ?auto_16971 - HOIST
      ?auto_16973 - SURFACE
      ?auto_16992 - PLACE
      ?auto_16982 - HOIST
      ?auto_16997 - SURFACE
      ?auto_17002 - SURFACE
      ?auto_16994 - PLACE
      ?auto_17000 - HOIST
      ?auto_17001 - SURFACE
      ?auto_16984 - SURFACE
      ?auto_16986 - PLACE
      ?auto_16989 - HOIST
      ?auto_16987 - SURFACE
      ?auto_17007 - PLACE
      ?auto_16998 - HOIST
      ?auto_17006 - SURFACE
      ?auto_16978 - PLACE
      ?auto_16995 - HOIST
      ?auto_16985 - SURFACE
      ?auto_16996 - PLACE
      ?auto_17005 - HOIST
      ?auto_16983 - SURFACE
      ?auto_16981 - PLACE
      ?auto_16979 - HOIST
      ?auto_16988 - SURFACE
      ?auto_16991 - PLACE
      ?auto_16976 - HOIST
      ?auto_16993 - SURFACE
      ?auto_16977 - PLACE
      ?auto_17004 - HOIST
      ?auto_16990 - SURFACE
      ?auto_17003 - PLACE
      ?auto_16980 - HOIST
      ?auto_16999 - SURFACE
      ?auto_16972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16974 ?auto_16975 ) ( IS-CRATE ?auto_16969 ) ( not ( = ?auto_16970 ?auto_16975 ) ) ( HOIST-AT ?auto_16971 ?auto_16970 ) ( AVAILABLE ?auto_16971 ) ( SURFACE-AT ?auto_16969 ?auto_16970 ) ( ON ?auto_16969 ?auto_16973 ) ( CLEAR ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16969 ) ) ( not ( = ?auto_16968 ?auto_16973 ) ) ( not ( = ?auto_16969 ?auto_16973 ) ) ( not ( = ?auto_16974 ?auto_16971 ) ) ( IS-CRATE ?auto_16968 ) ( not ( = ?auto_16992 ?auto_16975 ) ) ( HOIST-AT ?auto_16982 ?auto_16992 ) ( SURFACE-AT ?auto_16968 ?auto_16992 ) ( ON ?auto_16968 ?auto_16997 ) ( CLEAR ?auto_16968 ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16997 ) ) ( not ( = ?auto_16968 ?auto_16997 ) ) ( not ( = ?auto_16974 ?auto_16982 ) ) ( IS-CRATE ?auto_16967 ) ( AVAILABLE ?auto_16982 ) ( SURFACE-AT ?auto_16967 ?auto_16992 ) ( ON ?auto_16967 ?auto_17002 ) ( CLEAR ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16967 ) ) ( not ( = ?auto_16966 ?auto_17002 ) ) ( not ( = ?auto_16967 ?auto_17002 ) ) ( IS-CRATE ?auto_16966 ) ( not ( = ?auto_16994 ?auto_16975 ) ) ( HOIST-AT ?auto_17000 ?auto_16994 ) ( SURFACE-AT ?auto_16966 ?auto_16994 ) ( ON ?auto_16966 ?auto_17001 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16965 ?auto_16966 ) ) ( not ( = ?auto_16965 ?auto_17001 ) ) ( not ( = ?auto_16966 ?auto_17001 ) ) ( not ( = ?auto_16974 ?auto_17000 ) ) ( IS-CRATE ?auto_16965 ) ( AVAILABLE ?auto_17000 ) ( SURFACE-AT ?auto_16965 ?auto_16994 ) ( ON ?auto_16965 ?auto_16984 ) ( CLEAR ?auto_16965 ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16984 ) ) ( not ( = ?auto_16965 ?auto_16984 ) ) ( IS-CRATE ?auto_16964 ) ( not ( = ?auto_16986 ?auto_16975 ) ) ( HOIST-AT ?auto_16989 ?auto_16986 ) ( AVAILABLE ?auto_16989 ) ( SURFACE-AT ?auto_16964 ?auto_16986 ) ( ON ?auto_16964 ?auto_16987 ) ( CLEAR ?auto_16964 ) ( not ( = ?auto_16963 ?auto_16964 ) ) ( not ( = ?auto_16963 ?auto_16987 ) ) ( not ( = ?auto_16964 ?auto_16987 ) ) ( not ( = ?auto_16974 ?auto_16989 ) ) ( IS-CRATE ?auto_16963 ) ( not ( = ?auto_17007 ?auto_16975 ) ) ( HOIST-AT ?auto_16998 ?auto_17007 ) ( AVAILABLE ?auto_16998 ) ( SURFACE-AT ?auto_16963 ?auto_17007 ) ( ON ?auto_16963 ?auto_17006 ) ( CLEAR ?auto_16963 ) ( not ( = ?auto_16962 ?auto_16963 ) ) ( not ( = ?auto_16962 ?auto_17006 ) ) ( not ( = ?auto_16963 ?auto_17006 ) ) ( not ( = ?auto_16974 ?auto_16998 ) ) ( IS-CRATE ?auto_16962 ) ( not ( = ?auto_16978 ?auto_16975 ) ) ( HOIST-AT ?auto_16995 ?auto_16978 ) ( AVAILABLE ?auto_16995 ) ( SURFACE-AT ?auto_16962 ?auto_16978 ) ( ON ?auto_16962 ?auto_16985 ) ( CLEAR ?auto_16962 ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( not ( = ?auto_16961 ?auto_16985 ) ) ( not ( = ?auto_16962 ?auto_16985 ) ) ( not ( = ?auto_16974 ?auto_16995 ) ) ( IS-CRATE ?auto_16961 ) ( not ( = ?auto_16996 ?auto_16975 ) ) ( HOIST-AT ?auto_17005 ?auto_16996 ) ( AVAILABLE ?auto_17005 ) ( SURFACE-AT ?auto_16961 ?auto_16996 ) ( ON ?auto_16961 ?auto_16983 ) ( CLEAR ?auto_16961 ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16983 ) ) ( not ( = ?auto_16961 ?auto_16983 ) ) ( not ( = ?auto_16974 ?auto_17005 ) ) ( IS-CRATE ?auto_16960 ) ( not ( = ?auto_16981 ?auto_16975 ) ) ( HOIST-AT ?auto_16979 ?auto_16981 ) ( AVAILABLE ?auto_16979 ) ( SURFACE-AT ?auto_16960 ?auto_16981 ) ( ON ?auto_16960 ?auto_16988 ) ( CLEAR ?auto_16960 ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_16988 ) ) ( not ( = ?auto_16960 ?auto_16988 ) ) ( not ( = ?auto_16974 ?auto_16979 ) ) ( IS-CRATE ?auto_16959 ) ( not ( = ?auto_16991 ?auto_16975 ) ) ( HOIST-AT ?auto_16976 ?auto_16991 ) ( AVAILABLE ?auto_16976 ) ( SURFACE-AT ?auto_16959 ?auto_16991 ) ( ON ?auto_16959 ?auto_16993 ) ( CLEAR ?auto_16959 ) ( not ( = ?auto_16958 ?auto_16959 ) ) ( not ( = ?auto_16958 ?auto_16993 ) ) ( not ( = ?auto_16959 ?auto_16993 ) ) ( not ( = ?auto_16974 ?auto_16976 ) ) ( IS-CRATE ?auto_16958 ) ( not ( = ?auto_16977 ?auto_16975 ) ) ( HOIST-AT ?auto_17004 ?auto_16977 ) ( AVAILABLE ?auto_17004 ) ( SURFACE-AT ?auto_16958 ?auto_16977 ) ( ON ?auto_16958 ?auto_16990 ) ( CLEAR ?auto_16958 ) ( not ( = ?auto_16957 ?auto_16958 ) ) ( not ( = ?auto_16957 ?auto_16990 ) ) ( not ( = ?auto_16958 ?auto_16990 ) ) ( not ( = ?auto_16974 ?auto_17004 ) ) ( SURFACE-AT ?auto_16956 ?auto_16975 ) ( CLEAR ?auto_16956 ) ( IS-CRATE ?auto_16957 ) ( AVAILABLE ?auto_16974 ) ( not ( = ?auto_17003 ?auto_16975 ) ) ( HOIST-AT ?auto_16980 ?auto_17003 ) ( AVAILABLE ?auto_16980 ) ( SURFACE-AT ?auto_16957 ?auto_17003 ) ( ON ?auto_16957 ?auto_16999 ) ( CLEAR ?auto_16957 ) ( TRUCK-AT ?auto_16972 ?auto_16975 ) ( not ( = ?auto_16956 ?auto_16957 ) ) ( not ( = ?auto_16956 ?auto_16999 ) ) ( not ( = ?auto_16957 ?auto_16999 ) ) ( not ( = ?auto_16974 ?auto_16980 ) ) ( not ( = ?auto_16956 ?auto_16958 ) ) ( not ( = ?auto_16956 ?auto_16990 ) ) ( not ( = ?auto_16958 ?auto_16999 ) ) ( not ( = ?auto_16977 ?auto_17003 ) ) ( not ( = ?auto_17004 ?auto_16980 ) ) ( not ( = ?auto_16990 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16993 ) ) ( not ( = ?auto_16957 ?auto_16959 ) ) ( not ( = ?auto_16957 ?auto_16993 ) ) ( not ( = ?auto_16959 ?auto_16990 ) ) ( not ( = ?auto_16959 ?auto_16999 ) ) ( not ( = ?auto_16991 ?auto_16977 ) ) ( not ( = ?auto_16991 ?auto_17003 ) ) ( not ( = ?auto_16976 ?auto_17004 ) ) ( not ( = ?auto_16976 ?auto_16980 ) ) ( not ( = ?auto_16993 ?auto_16990 ) ) ( not ( = ?auto_16993 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16960 ) ) ( not ( = ?auto_16956 ?auto_16988 ) ) ( not ( = ?auto_16957 ?auto_16960 ) ) ( not ( = ?auto_16957 ?auto_16988 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( not ( = ?auto_16958 ?auto_16988 ) ) ( not ( = ?auto_16960 ?auto_16993 ) ) ( not ( = ?auto_16960 ?auto_16990 ) ) ( not ( = ?auto_16960 ?auto_16999 ) ) ( not ( = ?auto_16981 ?auto_16991 ) ) ( not ( = ?auto_16981 ?auto_16977 ) ) ( not ( = ?auto_16981 ?auto_17003 ) ) ( not ( = ?auto_16979 ?auto_16976 ) ) ( not ( = ?auto_16979 ?auto_17004 ) ) ( not ( = ?auto_16979 ?auto_16980 ) ) ( not ( = ?auto_16988 ?auto_16993 ) ) ( not ( = ?auto_16988 ?auto_16990 ) ) ( not ( = ?auto_16988 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16961 ) ) ( not ( = ?auto_16956 ?auto_16983 ) ) ( not ( = ?auto_16957 ?auto_16961 ) ) ( not ( = ?auto_16957 ?auto_16983 ) ) ( not ( = ?auto_16958 ?auto_16961 ) ) ( not ( = ?auto_16958 ?auto_16983 ) ) ( not ( = ?auto_16959 ?auto_16961 ) ) ( not ( = ?auto_16959 ?auto_16983 ) ) ( not ( = ?auto_16961 ?auto_16988 ) ) ( not ( = ?auto_16961 ?auto_16993 ) ) ( not ( = ?auto_16961 ?auto_16990 ) ) ( not ( = ?auto_16961 ?auto_16999 ) ) ( not ( = ?auto_16996 ?auto_16981 ) ) ( not ( = ?auto_16996 ?auto_16991 ) ) ( not ( = ?auto_16996 ?auto_16977 ) ) ( not ( = ?auto_16996 ?auto_17003 ) ) ( not ( = ?auto_17005 ?auto_16979 ) ) ( not ( = ?auto_17005 ?auto_16976 ) ) ( not ( = ?auto_17005 ?auto_17004 ) ) ( not ( = ?auto_17005 ?auto_16980 ) ) ( not ( = ?auto_16983 ?auto_16988 ) ) ( not ( = ?auto_16983 ?auto_16993 ) ) ( not ( = ?auto_16983 ?auto_16990 ) ) ( not ( = ?auto_16983 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16962 ) ) ( not ( = ?auto_16956 ?auto_16985 ) ) ( not ( = ?auto_16957 ?auto_16962 ) ) ( not ( = ?auto_16957 ?auto_16985 ) ) ( not ( = ?auto_16958 ?auto_16962 ) ) ( not ( = ?auto_16958 ?auto_16985 ) ) ( not ( = ?auto_16959 ?auto_16962 ) ) ( not ( = ?auto_16959 ?auto_16985 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_16985 ) ) ( not ( = ?auto_16962 ?auto_16983 ) ) ( not ( = ?auto_16962 ?auto_16988 ) ) ( not ( = ?auto_16962 ?auto_16993 ) ) ( not ( = ?auto_16962 ?auto_16990 ) ) ( not ( = ?auto_16962 ?auto_16999 ) ) ( not ( = ?auto_16978 ?auto_16996 ) ) ( not ( = ?auto_16978 ?auto_16981 ) ) ( not ( = ?auto_16978 ?auto_16991 ) ) ( not ( = ?auto_16978 ?auto_16977 ) ) ( not ( = ?auto_16978 ?auto_17003 ) ) ( not ( = ?auto_16995 ?auto_17005 ) ) ( not ( = ?auto_16995 ?auto_16979 ) ) ( not ( = ?auto_16995 ?auto_16976 ) ) ( not ( = ?auto_16995 ?auto_17004 ) ) ( not ( = ?auto_16995 ?auto_16980 ) ) ( not ( = ?auto_16985 ?auto_16983 ) ) ( not ( = ?auto_16985 ?auto_16988 ) ) ( not ( = ?auto_16985 ?auto_16993 ) ) ( not ( = ?auto_16985 ?auto_16990 ) ) ( not ( = ?auto_16985 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16963 ) ) ( not ( = ?auto_16956 ?auto_17006 ) ) ( not ( = ?auto_16957 ?auto_16963 ) ) ( not ( = ?auto_16957 ?auto_17006 ) ) ( not ( = ?auto_16958 ?auto_16963 ) ) ( not ( = ?auto_16958 ?auto_17006 ) ) ( not ( = ?auto_16959 ?auto_16963 ) ) ( not ( = ?auto_16959 ?auto_17006 ) ) ( not ( = ?auto_16960 ?auto_16963 ) ) ( not ( = ?auto_16960 ?auto_17006 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_17006 ) ) ( not ( = ?auto_16963 ?auto_16985 ) ) ( not ( = ?auto_16963 ?auto_16983 ) ) ( not ( = ?auto_16963 ?auto_16988 ) ) ( not ( = ?auto_16963 ?auto_16993 ) ) ( not ( = ?auto_16963 ?auto_16990 ) ) ( not ( = ?auto_16963 ?auto_16999 ) ) ( not ( = ?auto_17007 ?auto_16978 ) ) ( not ( = ?auto_17007 ?auto_16996 ) ) ( not ( = ?auto_17007 ?auto_16981 ) ) ( not ( = ?auto_17007 ?auto_16991 ) ) ( not ( = ?auto_17007 ?auto_16977 ) ) ( not ( = ?auto_17007 ?auto_17003 ) ) ( not ( = ?auto_16998 ?auto_16995 ) ) ( not ( = ?auto_16998 ?auto_17005 ) ) ( not ( = ?auto_16998 ?auto_16979 ) ) ( not ( = ?auto_16998 ?auto_16976 ) ) ( not ( = ?auto_16998 ?auto_17004 ) ) ( not ( = ?auto_16998 ?auto_16980 ) ) ( not ( = ?auto_17006 ?auto_16985 ) ) ( not ( = ?auto_17006 ?auto_16983 ) ) ( not ( = ?auto_17006 ?auto_16988 ) ) ( not ( = ?auto_17006 ?auto_16993 ) ) ( not ( = ?auto_17006 ?auto_16990 ) ) ( not ( = ?auto_17006 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16964 ) ) ( not ( = ?auto_16956 ?auto_16987 ) ) ( not ( = ?auto_16957 ?auto_16964 ) ) ( not ( = ?auto_16957 ?auto_16987 ) ) ( not ( = ?auto_16958 ?auto_16964 ) ) ( not ( = ?auto_16958 ?auto_16987 ) ) ( not ( = ?auto_16959 ?auto_16964 ) ) ( not ( = ?auto_16959 ?auto_16987 ) ) ( not ( = ?auto_16960 ?auto_16964 ) ) ( not ( = ?auto_16960 ?auto_16987 ) ) ( not ( = ?auto_16961 ?auto_16964 ) ) ( not ( = ?auto_16961 ?auto_16987 ) ) ( not ( = ?auto_16962 ?auto_16964 ) ) ( not ( = ?auto_16962 ?auto_16987 ) ) ( not ( = ?auto_16964 ?auto_17006 ) ) ( not ( = ?auto_16964 ?auto_16985 ) ) ( not ( = ?auto_16964 ?auto_16983 ) ) ( not ( = ?auto_16964 ?auto_16988 ) ) ( not ( = ?auto_16964 ?auto_16993 ) ) ( not ( = ?auto_16964 ?auto_16990 ) ) ( not ( = ?auto_16964 ?auto_16999 ) ) ( not ( = ?auto_16986 ?auto_17007 ) ) ( not ( = ?auto_16986 ?auto_16978 ) ) ( not ( = ?auto_16986 ?auto_16996 ) ) ( not ( = ?auto_16986 ?auto_16981 ) ) ( not ( = ?auto_16986 ?auto_16991 ) ) ( not ( = ?auto_16986 ?auto_16977 ) ) ( not ( = ?auto_16986 ?auto_17003 ) ) ( not ( = ?auto_16989 ?auto_16998 ) ) ( not ( = ?auto_16989 ?auto_16995 ) ) ( not ( = ?auto_16989 ?auto_17005 ) ) ( not ( = ?auto_16989 ?auto_16979 ) ) ( not ( = ?auto_16989 ?auto_16976 ) ) ( not ( = ?auto_16989 ?auto_17004 ) ) ( not ( = ?auto_16989 ?auto_16980 ) ) ( not ( = ?auto_16987 ?auto_17006 ) ) ( not ( = ?auto_16987 ?auto_16985 ) ) ( not ( = ?auto_16987 ?auto_16983 ) ) ( not ( = ?auto_16987 ?auto_16988 ) ) ( not ( = ?auto_16987 ?auto_16993 ) ) ( not ( = ?auto_16987 ?auto_16990 ) ) ( not ( = ?auto_16987 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16965 ) ) ( not ( = ?auto_16956 ?auto_16984 ) ) ( not ( = ?auto_16957 ?auto_16965 ) ) ( not ( = ?auto_16957 ?auto_16984 ) ) ( not ( = ?auto_16958 ?auto_16965 ) ) ( not ( = ?auto_16958 ?auto_16984 ) ) ( not ( = ?auto_16959 ?auto_16965 ) ) ( not ( = ?auto_16959 ?auto_16984 ) ) ( not ( = ?auto_16960 ?auto_16965 ) ) ( not ( = ?auto_16960 ?auto_16984 ) ) ( not ( = ?auto_16961 ?auto_16965 ) ) ( not ( = ?auto_16961 ?auto_16984 ) ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16984 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16984 ) ) ( not ( = ?auto_16965 ?auto_16987 ) ) ( not ( = ?auto_16965 ?auto_17006 ) ) ( not ( = ?auto_16965 ?auto_16985 ) ) ( not ( = ?auto_16965 ?auto_16983 ) ) ( not ( = ?auto_16965 ?auto_16988 ) ) ( not ( = ?auto_16965 ?auto_16993 ) ) ( not ( = ?auto_16965 ?auto_16990 ) ) ( not ( = ?auto_16965 ?auto_16999 ) ) ( not ( = ?auto_16994 ?auto_16986 ) ) ( not ( = ?auto_16994 ?auto_17007 ) ) ( not ( = ?auto_16994 ?auto_16978 ) ) ( not ( = ?auto_16994 ?auto_16996 ) ) ( not ( = ?auto_16994 ?auto_16981 ) ) ( not ( = ?auto_16994 ?auto_16991 ) ) ( not ( = ?auto_16994 ?auto_16977 ) ) ( not ( = ?auto_16994 ?auto_17003 ) ) ( not ( = ?auto_17000 ?auto_16989 ) ) ( not ( = ?auto_17000 ?auto_16998 ) ) ( not ( = ?auto_17000 ?auto_16995 ) ) ( not ( = ?auto_17000 ?auto_17005 ) ) ( not ( = ?auto_17000 ?auto_16979 ) ) ( not ( = ?auto_17000 ?auto_16976 ) ) ( not ( = ?auto_17000 ?auto_17004 ) ) ( not ( = ?auto_17000 ?auto_16980 ) ) ( not ( = ?auto_16984 ?auto_16987 ) ) ( not ( = ?auto_16984 ?auto_17006 ) ) ( not ( = ?auto_16984 ?auto_16985 ) ) ( not ( = ?auto_16984 ?auto_16983 ) ) ( not ( = ?auto_16984 ?auto_16988 ) ) ( not ( = ?auto_16984 ?auto_16993 ) ) ( not ( = ?auto_16984 ?auto_16990 ) ) ( not ( = ?auto_16984 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16966 ) ) ( not ( = ?auto_16956 ?auto_17001 ) ) ( not ( = ?auto_16957 ?auto_16966 ) ) ( not ( = ?auto_16957 ?auto_17001 ) ) ( not ( = ?auto_16958 ?auto_16966 ) ) ( not ( = ?auto_16958 ?auto_17001 ) ) ( not ( = ?auto_16959 ?auto_16966 ) ) ( not ( = ?auto_16959 ?auto_17001 ) ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( not ( = ?auto_16960 ?auto_17001 ) ) ( not ( = ?auto_16961 ?auto_16966 ) ) ( not ( = ?auto_16961 ?auto_17001 ) ) ( not ( = ?auto_16962 ?auto_16966 ) ) ( not ( = ?auto_16962 ?auto_17001 ) ) ( not ( = ?auto_16963 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_17001 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16964 ?auto_17001 ) ) ( not ( = ?auto_16966 ?auto_16984 ) ) ( not ( = ?auto_16966 ?auto_16987 ) ) ( not ( = ?auto_16966 ?auto_17006 ) ) ( not ( = ?auto_16966 ?auto_16985 ) ) ( not ( = ?auto_16966 ?auto_16983 ) ) ( not ( = ?auto_16966 ?auto_16988 ) ) ( not ( = ?auto_16966 ?auto_16993 ) ) ( not ( = ?auto_16966 ?auto_16990 ) ) ( not ( = ?auto_16966 ?auto_16999 ) ) ( not ( = ?auto_17001 ?auto_16984 ) ) ( not ( = ?auto_17001 ?auto_16987 ) ) ( not ( = ?auto_17001 ?auto_17006 ) ) ( not ( = ?auto_17001 ?auto_16985 ) ) ( not ( = ?auto_17001 ?auto_16983 ) ) ( not ( = ?auto_17001 ?auto_16988 ) ) ( not ( = ?auto_17001 ?auto_16993 ) ) ( not ( = ?auto_17001 ?auto_16990 ) ) ( not ( = ?auto_17001 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16967 ) ) ( not ( = ?auto_16956 ?auto_17002 ) ) ( not ( = ?auto_16957 ?auto_16967 ) ) ( not ( = ?auto_16957 ?auto_17002 ) ) ( not ( = ?auto_16958 ?auto_16967 ) ) ( not ( = ?auto_16958 ?auto_17002 ) ) ( not ( = ?auto_16959 ?auto_16967 ) ) ( not ( = ?auto_16959 ?auto_17002 ) ) ( not ( = ?auto_16960 ?auto_16967 ) ) ( not ( = ?auto_16960 ?auto_17002 ) ) ( not ( = ?auto_16961 ?auto_16967 ) ) ( not ( = ?auto_16961 ?auto_17002 ) ) ( not ( = ?auto_16962 ?auto_16967 ) ) ( not ( = ?auto_16962 ?auto_17002 ) ) ( not ( = ?auto_16963 ?auto_16967 ) ) ( not ( = ?auto_16963 ?auto_17002 ) ) ( not ( = ?auto_16964 ?auto_16967 ) ) ( not ( = ?auto_16964 ?auto_17002 ) ) ( not ( = ?auto_16965 ?auto_16967 ) ) ( not ( = ?auto_16965 ?auto_17002 ) ) ( not ( = ?auto_16967 ?auto_17001 ) ) ( not ( = ?auto_16967 ?auto_16984 ) ) ( not ( = ?auto_16967 ?auto_16987 ) ) ( not ( = ?auto_16967 ?auto_17006 ) ) ( not ( = ?auto_16967 ?auto_16985 ) ) ( not ( = ?auto_16967 ?auto_16983 ) ) ( not ( = ?auto_16967 ?auto_16988 ) ) ( not ( = ?auto_16967 ?auto_16993 ) ) ( not ( = ?auto_16967 ?auto_16990 ) ) ( not ( = ?auto_16967 ?auto_16999 ) ) ( not ( = ?auto_16992 ?auto_16994 ) ) ( not ( = ?auto_16992 ?auto_16986 ) ) ( not ( = ?auto_16992 ?auto_17007 ) ) ( not ( = ?auto_16992 ?auto_16978 ) ) ( not ( = ?auto_16992 ?auto_16996 ) ) ( not ( = ?auto_16992 ?auto_16981 ) ) ( not ( = ?auto_16992 ?auto_16991 ) ) ( not ( = ?auto_16992 ?auto_16977 ) ) ( not ( = ?auto_16992 ?auto_17003 ) ) ( not ( = ?auto_16982 ?auto_17000 ) ) ( not ( = ?auto_16982 ?auto_16989 ) ) ( not ( = ?auto_16982 ?auto_16998 ) ) ( not ( = ?auto_16982 ?auto_16995 ) ) ( not ( = ?auto_16982 ?auto_17005 ) ) ( not ( = ?auto_16982 ?auto_16979 ) ) ( not ( = ?auto_16982 ?auto_16976 ) ) ( not ( = ?auto_16982 ?auto_17004 ) ) ( not ( = ?auto_16982 ?auto_16980 ) ) ( not ( = ?auto_17002 ?auto_17001 ) ) ( not ( = ?auto_17002 ?auto_16984 ) ) ( not ( = ?auto_17002 ?auto_16987 ) ) ( not ( = ?auto_17002 ?auto_17006 ) ) ( not ( = ?auto_17002 ?auto_16985 ) ) ( not ( = ?auto_17002 ?auto_16983 ) ) ( not ( = ?auto_17002 ?auto_16988 ) ) ( not ( = ?auto_17002 ?auto_16993 ) ) ( not ( = ?auto_17002 ?auto_16990 ) ) ( not ( = ?auto_17002 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16968 ) ) ( not ( = ?auto_16956 ?auto_16997 ) ) ( not ( = ?auto_16957 ?auto_16968 ) ) ( not ( = ?auto_16957 ?auto_16997 ) ) ( not ( = ?auto_16958 ?auto_16968 ) ) ( not ( = ?auto_16958 ?auto_16997 ) ) ( not ( = ?auto_16959 ?auto_16968 ) ) ( not ( = ?auto_16959 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16968 ) ) ( not ( = ?auto_16960 ?auto_16997 ) ) ( not ( = ?auto_16961 ?auto_16968 ) ) ( not ( = ?auto_16961 ?auto_16997 ) ) ( not ( = ?auto_16962 ?auto_16968 ) ) ( not ( = ?auto_16962 ?auto_16997 ) ) ( not ( = ?auto_16963 ?auto_16968 ) ) ( not ( = ?auto_16963 ?auto_16997 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( not ( = ?auto_16964 ?auto_16997 ) ) ( not ( = ?auto_16965 ?auto_16968 ) ) ( not ( = ?auto_16965 ?auto_16997 ) ) ( not ( = ?auto_16966 ?auto_16968 ) ) ( not ( = ?auto_16966 ?auto_16997 ) ) ( not ( = ?auto_16968 ?auto_17002 ) ) ( not ( = ?auto_16968 ?auto_17001 ) ) ( not ( = ?auto_16968 ?auto_16984 ) ) ( not ( = ?auto_16968 ?auto_16987 ) ) ( not ( = ?auto_16968 ?auto_17006 ) ) ( not ( = ?auto_16968 ?auto_16985 ) ) ( not ( = ?auto_16968 ?auto_16983 ) ) ( not ( = ?auto_16968 ?auto_16988 ) ) ( not ( = ?auto_16968 ?auto_16993 ) ) ( not ( = ?auto_16968 ?auto_16990 ) ) ( not ( = ?auto_16968 ?auto_16999 ) ) ( not ( = ?auto_16997 ?auto_17002 ) ) ( not ( = ?auto_16997 ?auto_17001 ) ) ( not ( = ?auto_16997 ?auto_16984 ) ) ( not ( = ?auto_16997 ?auto_16987 ) ) ( not ( = ?auto_16997 ?auto_17006 ) ) ( not ( = ?auto_16997 ?auto_16985 ) ) ( not ( = ?auto_16997 ?auto_16983 ) ) ( not ( = ?auto_16997 ?auto_16988 ) ) ( not ( = ?auto_16997 ?auto_16993 ) ) ( not ( = ?auto_16997 ?auto_16990 ) ) ( not ( = ?auto_16997 ?auto_16999 ) ) ( not ( = ?auto_16956 ?auto_16969 ) ) ( not ( = ?auto_16956 ?auto_16973 ) ) ( not ( = ?auto_16957 ?auto_16969 ) ) ( not ( = ?auto_16957 ?auto_16973 ) ) ( not ( = ?auto_16958 ?auto_16969 ) ) ( not ( = ?auto_16958 ?auto_16973 ) ) ( not ( = ?auto_16959 ?auto_16969 ) ) ( not ( = ?auto_16959 ?auto_16973 ) ) ( not ( = ?auto_16960 ?auto_16969 ) ) ( not ( = ?auto_16960 ?auto_16973 ) ) ( not ( = ?auto_16961 ?auto_16969 ) ) ( not ( = ?auto_16961 ?auto_16973 ) ) ( not ( = ?auto_16962 ?auto_16969 ) ) ( not ( = ?auto_16962 ?auto_16973 ) ) ( not ( = ?auto_16963 ?auto_16969 ) ) ( not ( = ?auto_16963 ?auto_16973 ) ) ( not ( = ?auto_16964 ?auto_16969 ) ) ( not ( = ?auto_16964 ?auto_16973 ) ) ( not ( = ?auto_16965 ?auto_16969 ) ) ( not ( = ?auto_16965 ?auto_16973 ) ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( not ( = ?auto_16966 ?auto_16973 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16973 ) ) ( not ( = ?auto_16969 ?auto_16997 ) ) ( not ( = ?auto_16969 ?auto_17002 ) ) ( not ( = ?auto_16969 ?auto_17001 ) ) ( not ( = ?auto_16969 ?auto_16984 ) ) ( not ( = ?auto_16969 ?auto_16987 ) ) ( not ( = ?auto_16969 ?auto_17006 ) ) ( not ( = ?auto_16969 ?auto_16985 ) ) ( not ( = ?auto_16969 ?auto_16983 ) ) ( not ( = ?auto_16969 ?auto_16988 ) ) ( not ( = ?auto_16969 ?auto_16993 ) ) ( not ( = ?auto_16969 ?auto_16990 ) ) ( not ( = ?auto_16969 ?auto_16999 ) ) ( not ( = ?auto_16970 ?auto_16992 ) ) ( not ( = ?auto_16970 ?auto_16994 ) ) ( not ( = ?auto_16970 ?auto_16986 ) ) ( not ( = ?auto_16970 ?auto_17007 ) ) ( not ( = ?auto_16970 ?auto_16978 ) ) ( not ( = ?auto_16970 ?auto_16996 ) ) ( not ( = ?auto_16970 ?auto_16981 ) ) ( not ( = ?auto_16970 ?auto_16991 ) ) ( not ( = ?auto_16970 ?auto_16977 ) ) ( not ( = ?auto_16970 ?auto_17003 ) ) ( not ( = ?auto_16971 ?auto_16982 ) ) ( not ( = ?auto_16971 ?auto_17000 ) ) ( not ( = ?auto_16971 ?auto_16989 ) ) ( not ( = ?auto_16971 ?auto_16998 ) ) ( not ( = ?auto_16971 ?auto_16995 ) ) ( not ( = ?auto_16971 ?auto_17005 ) ) ( not ( = ?auto_16971 ?auto_16979 ) ) ( not ( = ?auto_16971 ?auto_16976 ) ) ( not ( = ?auto_16971 ?auto_17004 ) ) ( not ( = ?auto_16971 ?auto_16980 ) ) ( not ( = ?auto_16973 ?auto_16997 ) ) ( not ( = ?auto_16973 ?auto_17002 ) ) ( not ( = ?auto_16973 ?auto_17001 ) ) ( not ( = ?auto_16973 ?auto_16984 ) ) ( not ( = ?auto_16973 ?auto_16987 ) ) ( not ( = ?auto_16973 ?auto_17006 ) ) ( not ( = ?auto_16973 ?auto_16985 ) ) ( not ( = ?auto_16973 ?auto_16983 ) ) ( not ( = ?auto_16973 ?auto_16988 ) ) ( not ( = ?auto_16973 ?auto_16993 ) ) ( not ( = ?auto_16973 ?auto_16990 ) ) ( not ( = ?auto_16973 ?auto_16999 ) ) )
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
      ?auto_17051 - PLACE
      ?auto_17048 - PLACE
      ?auto_17050 - HOIST
      ?auto_17049 - SURFACE
      ?auto_17055 - PLACE
      ?auto_17054 - HOIST
      ?auto_17061 - SURFACE
      ?auto_17067 - PLACE
      ?auto_17064 - HOIST
      ?auto_17073 - SURFACE
      ?auto_17076 - SURFACE
      ?auto_17059 - PLACE
      ?auto_17086 - HOIST
      ?auto_17071 - SURFACE
      ?auto_17085 - SURFACE
      ?auto_17069 - PLACE
      ?auto_17072 - HOIST
      ?auto_17068 - SURFACE
      ?auto_17084 - PLACE
      ?auto_17083 - HOIST
      ?auto_17066 - SURFACE
      ?auto_17062 - PLACE
      ?auto_17079 - HOIST
      ?auto_17081 - SURFACE
      ?auto_17058 - PLACE
      ?auto_17070 - HOIST
      ?auto_17056 - SURFACE
      ?auto_17060 - PLACE
      ?auto_17082 - HOIST
      ?auto_17074 - SURFACE
      ?auto_17075 - PLACE
      ?auto_17063 - HOIST
      ?auto_17078 - SURFACE
      ?auto_17077 - PLACE
      ?auto_17065 - HOIST
      ?auto_17057 - SURFACE
      ?auto_17080 - SURFACE
      ?auto_17052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17053 ?auto_17051 ) ( IS-CRATE ?auto_17047 ) ( not ( = ?auto_17048 ?auto_17051 ) ) ( HOIST-AT ?auto_17050 ?auto_17048 ) ( SURFACE-AT ?auto_17047 ?auto_17048 ) ( ON ?auto_17047 ?auto_17049 ) ( CLEAR ?auto_17047 ) ( not ( = ?auto_17046 ?auto_17047 ) ) ( not ( = ?auto_17046 ?auto_17049 ) ) ( not ( = ?auto_17047 ?auto_17049 ) ) ( not ( = ?auto_17053 ?auto_17050 ) ) ( IS-CRATE ?auto_17046 ) ( not ( = ?auto_17055 ?auto_17051 ) ) ( HOIST-AT ?auto_17054 ?auto_17055 ) ( AVAILABLE ?auto_17054 ) ( SURFACE-AT ?auto_17046 ?auto_17055 ) ( ON ?auto_17046 ?auto_17061 ) ( CLEAR ?auto_17046 ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17045 ?auto_17061 ) ) ( not ( = ?auto_17046 ?auto_17061 ) ) ( not ( = ?auto_17053 ?auto_17054 ) ) ( IS-CRATE ?auto_17045 ) ( not ( = ?auto_17067 ?auto_17051 ) ) ( HOIST-AT ?auto_17064 ?auto_17067 ) ( SURFACE-AT ?auto_17045 ?auto_17067 ) ( ON ?auto_17045 ?auto_17073 ) ( CLEAR ?auto_17045 ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17073 ) ) ( not ( = ?auto_17045 ?auto_17073 ) ) ( not ( = ?auto_17053 ?auto_17064 ) ) ( IS-CRATE ?auto_17044 ) ( AVAILABLE ?auto_17064 ) ( SURFACE-AT ?auto_17044 ?auto_17067 ) ( ON ?auto_17044 ?auto_17076 ) ( CLEAR ?auto_17044 ) ( not ( = ?auto_17043 ?auto_17044 ) ) ( not ( = ?auto_17043 ?auto_17076 ) ) ( not ( = ?auto_17044 ?auto_17076 ) ) ( IS-CRATE ?auto_17043 ) ( not ( = ?auto_17059 ?auto_17051 ) ) ( HOIST-AT ?auto_17086 ?auto_17059 ) ( SURFACE-AT ?auto_17043 ?auto_17059 ) ( ON ?auto_17043 ?auto_17071 ) ( CLEAR ?auto_17043 ) ( not ( = ?auto_17042 ?auto_17043 ) ) ( not ( = ?auto_17042 ?auto_17071 ) ) ( not ( = ?auto_17043 ?auto_17071 ) ) ( not ( = ?auto_17053 ?auto_17086 ) ) ( IS-CRATE ?auto_17042 ) ( AVAILABLE ?auto_17086 ) ( SURFACE-AT ?auto_17042 ?auto_17059 ) ( ON ?auto_17042 ?auto_17085 ) ( CLEAR ?auto_17042 ) ( not ( = ?auto_17041 ?auto_17042 ) ) ( not ( = ?auto_17041 ?auto_17085 ) ) ( not ( = ?auto_17042 ?auto_17085 ) ) ( IS-CRATE ?auto_17041 ) ( not ( = ?auto_17069 ?auto_17051 ) ) ( HOIST-AT ?auto_17072 ?auto_17069 ) ( AVAILABLE ?auto_17072 ) ( SURFACE-AT ?auto_17041 ?auto_17069 ) ( ON ?auto_17041 ?auto_17068 ) ( CLEAR ?auto_17041 ) ( not ( = ?auto_17040 ?auto_17041 ) ) ( not ( = ?auto_17040 ?auto_17068 ) ) ( not ( = ?auto_17041 ?auto_17068 ) ) ( not ( = ?auto_17053 ?auto_17072 ) ) ( IS-CRATE ?auto_17040 ) ( not ( = ?auto_17084 ?auto_17051 ) ) ( HOIST-AT ?auto_17083 ?auto_17084 ) ( AVAILABLE ?auto_17083 ) ( SURFACE-AT ?auto_17040 ?auto_17084 ) ( ON ?auto_17040 ?auto_17066 ) ( CLEAR ?auto_17040 ) ( not ( = ?auto_17039 ?auto_17040 ) ) ( not ( = ?auto_17039 ?auto_17066 ) ) ( not ( = ?auto_17040 ?auto_17066 ) ) ( not ( = ?auto_17053 ?auto_17083 ) ) ( IS-CRATE ?auto_17039 ) ( not ( = ?auto_17062 ?auto_17051 ) ) ( HOIST-AT ?auto_17079 ?auto_17062 ) ( AVAILABLE ?auto_17079 ) ( SURFACE-AT ?auto_17039 ?auto_17062 ) ( ON ?auto_17039 ?auto_17081 ) ( CLEAR ?auto_17039 ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17081 ) ) ( not ( = ?auto_17039 ?auto_17081 ) ) ( not ( = ?auto_17053 ?auto_17079 ) ) ( IS-CRATE ?auto_17038 ) ( not ( = ?auto_17058 ?auto_17051 ) ) ( HOIST-AT ?auto_17070 ?auto_17058 ) ( AVAILABLE ?auto_17070 ) ( SURFACE-AT ?auto_17038 ?auto_17058 ) ( ON ?auto_17038 ?auto_17056 ) ( CLEAR ?auto_17038 ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17037 ?auto_17056 ) ) ( not ( = ?auto_17038 ?auto_17056 ) ) ( not ( = ?auto_17053 ?auto_17070 ) ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17060 ?auto_17051 ) ) ( HOIST-AT ?auto_17082 ?auto_17060 ) ( AVAILABLE ?auto_17082 ) ( SURFACE-AT ?auto_17037 ?auto_17060 ) ( ON ?auto_17037 ?auto_17074 ) ( CLEAR ?auto_17037 ) ( not ( = ?auto_17036 ?auto_17037 ) ) ( not ( = ?auto_17036 ?auto_17074 ) ) ( not ( = ?auto_17037 ?auto_17074 ) ) ( not ( = ?auto_17053 ?auto_17082 ) ) ( IS-CRATE ?auto_17036 ) ( not ( = ?auto_17075 ?auto_17051 ) ) ( HOIST-AT ?auto_17063 ?auto_17075 ) ( AVAILABLE ?auto_17063 ) ( SURFACE-AT ?auto_17036 ?auto_17075 ) ( ON ?auto_17036 ?auto_17078 ) ( CLEAR ?auto_17036 ) ( not ( = ?auto_17035 ?auto_17036 ) ) ( not ( = ?auto_17035 ?auto_17078 ) ) ( not ( = ?auto_17036 ?auto_17078 ) ) ( not ( = ?auto_17053 ?auto_17063 ) ) ( IS-CRATE ?auto_17035 ) ( not ( = ?auto_17077 ?auto_17051 ) ) ( HOIST-AT ?auto_17065 ?auto_17077 ) ( AVAILABLE ?auto_17065 ) ( SURFACE-AT ?auto_17035 ?auto_17077 ) ( ON ?auto_17035 ?auto_17057 ) ( CLEAR ?auto_17035 ) ( not ( = ?auto_17034 ?auto_17035 ) ) ( not ( = ?auto_17034 ?auto_17057 ) ) ( not ( = ?auto_17035 ?auto_17057 ) ) ( not ( = ?auto_17053 ?auto_17065 ) ) ( SURFACE-AT ?auto_17033 ?auto_17051 ) ( CLEAR ?auto_17033 ) ( IS-CRATE ?auto_17034 ) ( AVAILABLE ?auto_17053 ) ( AVAILABLE ?auto_17050 ) ( SURFACE-AT ?auto_17034 ?auto_17048 ) ( ON ?auto_17034 ?auto_17080 ) ( CLEAR ?auto_17034 ) ( TRUCK-AT ?auto_17052 ?auto_17051 ) ( not ( = ?auto_17033 ?auto_17034 ) ) ( not ( = ?auto_17033 ?auto_17080 ) ) ( not ( = ?auto_17034 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17035 ) ) ( not ( = ?auto_17033 ?auto_17057 ) ) ( not ( = ?auto_17035 ?auto_17080 ) ) ( not ( = ?auto_17077 ?auto_17048 ) ) ( not ( = ?auto_17065 ?auto_17050 ) ) ( not ( = ?auto_17057 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17036 ) ) ( not ( = ?auto_17033 ?auto_17078 ) ) ( not ( = ?auto_17034 ?auto_17036 ) ) ( not ( = ?auto_17034 ?auto_17078 ) ) ( not ( = ?auto_17036 ?auto_17057 ) ) ( not ( = ?auto_17036 ?auto_17080 ) ) ( not ( = ?auto_17075 ?auto_17077 ) ) ( not ( = ?auto_17075 ?auto_17048 ) ) ( not ( = ?auto_17063 ?auto_17065 ) ) ( not ( = ?auto_17063 ?auto_17050 ) ) ( not ( = ?auto_17078 ?auto_17057 ) ) ( not ( = ?auto_17078 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17037 ) ) ( not ( = ?auto_17033 ?auto_17074 ) ) ( not ( = ?auto_17034 ?auto_17037 ) ) ( not ( = ?auto_17034 ?auto_17074 ) ) ( not ( = ?auto_17035 ?auto_17037 ) ) ( not ( = ?auto_17035 ?auto_17074 ) ) ( not ( = ?auto_17037 ?auto_17078 ) ) ( not ( = ?auto_17037 ?auto_17057 ) ) ( not ( = ?auto_17037 ?auto_17080 ) ) ( not ( = ?auto_17060 ?auto_17075 ) ) ( not ( = ?auto_17060 ?auto_17077 ) ) ( not ( = ?auto_17060 ?auto_17048 ) ) ( not ( = ?auto_17082 ?auto_17063 ) ) ( not ( = ?auto_17082 ?auto_17065 ) ) ( not ( = ?auto_17082 ?auto_17050 ) ) ( not ( = ?auto_17074 ?auto_17078 ) ) ( not ( = ?auto_17074 ?auto_17057 ) ) ( not ( = ?auto_17074 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17038 ) ) ( not ( = ?auto_17033 ?auto_17056 ) ) ( not ( = ?auto_17034 ?auto_17038 ) ) ( not ( = ?auto_17034 ?auto_17056 ) ) ( not ( = ?auto_17035 ?auto_17038 ) ) ( not ( = ?auto_17035 ?auto_17056 ) ) ( not ( = ?auto_17036 ?auto_17038 ) ) ( not ( = ?auto_17036 ?auto_17056 ) ) ( not ( = ?auto_17038 ?auto_17074 ) ) ( not ( = ?auto_17038 ?auto_17078 ) ) ( not ( = ?auto_17038 ?auto_17057 ) ) ( not ( = ?auto_17038 ?auto_17080 ) ) ( not ( = ?auto_17058 ?auto_17060 ) ) ( not ( = ?auto_17058 ?auto_17075 ) ) ( not ( = ?auto_17058 ?auto_17077 ) ) ( not ( = ?auto_17058 ?auto_17048 ) ) ( not ( = ?auto_17070 ?auto_17082 ) ) ( not ( = ?auto_17070 ?auto_17063 ) ) ( not ( = ?auto_17070 ?auto_17065 ) ) ( not ( = ?auto_17070 ?auto_17050 ) ) ( not ( = ?auto_17056 ?auto_17074 ) ) ( not ( = ?auto_17056 ?auto_17078 ) ) ( not ( = ?auto_17056 ?auto_17057 ) ) ( not ( = ?auto_17056 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17039 ) ) ( not ( = ?auto_17033 ?auto_17081 ) ) ( not ( = ?auto_17034 ?auto_17039 ) ) ( not ( = ?auto_17034 ?auto_17081 ) ) ( not ( = ?auto_17035 ?auto_17039 ) ) ( not ( = ?auto_17035 ?auto_17081 ) ) ( not ( = ?auto_17036 ?auto_17039 ) ) ( not ( = ?auto_17036 ?auto_17081 ) ) ( not ( = ?auto_17037 ?auto_17039 ) ) ( not ( = ?auto_17037 ?auto_17081 ) ) ( not ( = ?auto_17039 ?auto_17056 ) ) ( not ( = ?auto_17039 ?auto_17074 ) ) ( not ( = ?auto_17039 ?auto_17078 ) ) ( not ( = ?auto_17039 ?auto_17057 ) ) ( not ( = ?auto_17039 ?auto_17080 ) ) ( not ( = ?auto_17062 ?auto_17058 ) ) ( not ( = ?auto_17062 ?auto_17060 ) ) ( not ( = ?auto_17062 ?auto_17075 ) ) ( not ( = ?auto_17062 ?auto_17077 ) ) ( not ( = ?auto_17062 ?auto_17048 ) ) ( not ( = ?auto_17079 ?auto_17070 ) ) ( not ( = ?auto_17079 ?auto_17082 ) ) ( not ( = ?auto_17079 ?auto_17063 ) ) ( not ( = ?auto_17079 ?auto_17065 ) ) ( not ( = ?auto_17079 ?auto_17050 ) ) ( not ( = ?auto_17081 ?auto_17056 ) ) ( not ( = ?auto_17081 ?auto_17074 ) ) ( not ( = ?auto_17081 ?auto_17078 ) ) ( not ( = ?auto_17081 ?auto_17057 ) ) ( not ( = ?auto_17081 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17040 ) ) ( not ( = ?auto_17033 ?auto_17066 ) ) ( not ( = ?auto_17034 ?auto_17040 ) ) ( not ( = ?auto_17034 ?auto_17066 ) ) ( not ( = ?auto_17035 ?auto_17040 ) ) ( not ( = ?auto_17035 ?auto_17066 ) ) ( not ( = ?auto_17036 ?auto_17040 ) ) ( not ( = ?auto_17036 ?auto_17066 ) ) ( not ( = ?auto_17037 ?auto_17040 ) ) ( not ( = ?auto_17037 ?auto_17066 ) ) ( not ( = ?auto_17038 ?auto_17040 ) ) ( not ( = ?auto_17038 ?auto_17066 ) ) ( not ( = ?auto_17040 ?auto_17081 ) ) ( not ( = ?auto_17040 ?auto_17056 ) ) ( not ( = ?auto_17040 ?auto_17074 ) ) ( not ( = ?auto_17040 ?auto_17078 ) ) ( not ( = ?auto_17040 ?auto_17057 ) ) ( not ( = ?auto_17040 ?auto_17080 ) ) ( not ( = ?auto_17084 ?auto_17062 ) ) ( not ( = ?auto_17084 ?auto_17058 ) ) ( not ( = ?auto_17084 ?auto_17060 ) ) ( not ( = ?auto_17084 ?auto_17075 ) ) ( not ( = ?auto_17084 ?auto_17077 ) ) ( not ( = ?auto_17084 ?auto_17048 ) ) ( not ( = ?auto_17083 ?auto_17079 ) ) ( not ( = ?auto_17083 ?auto_17070 ) ) ( not ( = ?auto_17083 ?auto_17082 ) ) ( not ( = ?auto_17083 ?auto_17063 ) ) ( not ( = ?auto_17083 ?auto_17065 ) ) ( not ( = ?auto_17083 ?auto_17050 ) ) ( not ( = ?auto_17066 ?auto_17081 ) ) ( not ( = ?auto_17066 ?auto_17056 ) ) ( not ( = ?auto_17066 ?auto_17074 ) ) ( not ( = ?auto_17066 ?auto_17078 ) ) ( not ( = ?auto_17066 ?auto_17057 ) ) ( not ( = ?auto_17066 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17041 ) ) ( not ( = ?auto_17033 ?auto_17068 ) ) ( not ( = ?auto_17034 ?auto_17041 ) ) ( not ( = ?auto_17034 ?auto_17068 ) ) ( not ( = ?auto_17035 ?auto_17041 ) ) ( not ( = ?auto_17035 ?auto_17068 ) ) ( not ( = ?auto_17036 ?auto_17041 ) ) ( not ( = ?auto_17036 ?auto_17068 ) ) ( not ( = ?auto_17037 ?auto_17041 ) ) ( not ( = ?auto_17037 ?auto_17068 ) ) ( not ( = ?auto_17038 ?auto_17041 ) ) ( not ( = ?auto_17038 ?auto_17068 ) ) ( not ( = ?auto_17039 ?auto_17041 ) ) ( not ( = ?auto_17039 ?auto_17068 ) ) ( not ( = ?auto_17041 ?auto_17066 ) ) ( not ( = ?auto_17041 ?auto_17081 ) ) ( not ( = ?auto_17041 ?auto_17056 ) ) ( not ( = ?auto_17041 ?auto_17074 ) ) ( not ( = ?auto_17041 ?auto_17078 ) ) ( not ( = ?auto_17041 ?auto_17057 ) ) ( not ( = ?auto_17041 ?auto_17080 ) ) ( not ( = ?auto_17069 ?auto_17084 ) ) ( not ( = ?auto_17069 ?auto_17062 ) ) ( not ( = ?auto_17069 ?auto_17058 ) ) ( not ( = ?auto_17069 ?auto_17060 ) ) ( not ( = ?auto_17069 ?auto_17075 ) ) ( not ( = ?auto_17069 ?auto_17077 ) ) ( not ( = ?auto_17069 ?auto_17048 ) ) ( not ( = ?auto_17072 ?auto_17083 ) ) ( not ( = ?auto_17072 ?auto_17079 ) ) ( not ( = ?auto_17072 ?auto_17070 ) ) ( not ( = ?auto_17072 ?auto_17082 ) ) ( not ( = ?auto_17072 ?auto_17063 ) ) ( not ( = ?auto_17072 ?auto_17065 ) ) ( not ( = ?auto_17072 ?auto_17050 ) ) ( not ( = ?auto_17068 ?auto_17066 ) ) ( not ( = ?auto_17068 ?auto_17081 ) ) ( not ( = ?auto_17068 ?auto_17056 ) ) ( not ( = ?auto_17068 ?auto_17074 ) ) ( not ( = ?auto_17068 ?auto_17078 ) ) ( not ( = ?auto_17068 ?auto_17057 ) ) ( not ( = ?auto_17068 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17042 ) ) ( not ( = ?auto_17033 ?auto_17085 ) ) ( not ( = ?auto_17034 ?auto_17042 ) ) ( not ( = ?auto_17034 ?auto_17085 ) ) ( not ( = ?auto_17035 ?auto_17042 ) ) ( not ( = ?auto_17035 ?auto_17085 ) ) ( not ( = ?auto_17036 ?auto_17042 ) ) ( not ( = ?auto_17036 ?auto_17085 ) ) ( not ( = ?auto_17037 ?auto_17042 ) ) ( not ( = ?auto_17037 ?auto_17085 ) ) ( not ( = ?auto_17038 ?auto_17042 ) ) ( not ( = ?auto_17038 ?auto_17085 ) ) ( not ( = ?auto_17039 ?auto_17042 ) ) ( not ( = ?auto_17039 ?auto_17085 ) ) ( not ( = ?auto_17040 ?auto_17042 ) ) ( not ( = ?auto_17040 ?auto_17085 ) ) ( not ( = ?auto_17042 ?auto_17068 ) ) ( not ( = ?auto_17042 ?auto_17066 ) ) ( not ( = ?auto_17042 ?auto_17081 ) ) ( not ( = ?auto_17042 ?auto_17056 ) ) ( not ( = ?auto_17042 ?auto_17074 ) ) ( not ( = ?auto_17042 ?auto_17078 ) ) ( not ( = ?auto_17042 ?auto_17057 ) ) ( not ( = ?auto_17042 ?auto_17080 ) ) ( not ( = ?auto_17059 ?auto_17069 ) ) ( not ( = ?auto_17059 ?auto_17084 ) ) ( not ( = ?auto_17059 ?auto_17062 ) ) ( not ( = ?auto_17059 ?auto_17058 ) ) ( not ( = ?auto_17059 ?auto_17060 ) ) ( not ( = ?auto_17059 ?auto_17075 ) ) ( not ( = ?auto_17059 ?auto_17077 ) ) ( not ( = ?auto_17059 ?auto_17048 ) ) ( not ( = ?auto_17086 ?auto_17072 ) ) ( not ( = ?auto_17086 ?auto_17083 ) ) ( not ( = ?auto_17086 ?auto_17079 ) ) ( not ( = ?auto_17086 ?auto_17070 ) ) ( not ( = ?auto_17086 ?auto_17082 ) ) ( not ( = ?auto_17086 ?auto_17063 ) ) ( not ( = ?auto_17086 ?auto_17065 ) ) ( not ( = ?auto_17086 ?auto_17050 ) ) ( not ( = ?auto_17085 ?auto_17068 ) ) ( not ( = ?auto_17085 ?auto_17066 ) ) ( not ( = ?auto_17085 ?auto_17081 ) ) ( not ( = ?auto_17085 ?auto_17056 ) ) ( not ( = ?auto_17085 ?auto_17074 ) ) ( not ( = ?auto_17085 ?auto_17078 ) ) ( not ( = ?auto_17085 ?auto_17057 ) ) ( not ( = ?auto_17085 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17043 ) ) ( not ( = ?auto_17033 ?auto_17071 ) ) ( not ( = ?auto_17034 ?auto_17043 ) ) ( not ( = ?auto_17034 ?auto_17071 ) ) ( not ( = ?auto_17035 ?auto_17043 ) ) ( not ( = ?auto_17035 ?auto_17071 ) ) ( not ( = ?auto_17036 ?auto_17043 ) ) ( not ( = ?auto_17036 ?auto_17071 ) ) ( not ( = ?auto_17037 ?auto_17043 ) ) ( not ( = ?auto_17037 ?auto_17071 ) ) ( not ( = ?auto_17038 ?auto_17043 ) ) ( not ( = ?auto_17038 ?auto_17071 ) ) ( not ( = ?auto_17039 ?auto_17043 ) ) ( not ( = ?auto_17039 ?auto_17071 ) ) ( not ( = ?auto_17040 ?auto_17043 ) ) ( not ( = ?auto_17040 ?auto_17071 ) ) ( not ( = ?auto_17041 ?auto_17043 ) ) ( not ( = ?auto_17041 ?auto_17071 ) ) ( not ( = ?auto_17043 ?auto_17085 ) ) ( not ( = ?auto_17043 ?auto_17068 ) ) ( not ( = ?auto_17043 ?auto_17066 ) ) ( not ( = ?auto_17043 ?auto_17081 ) ) ( not ( = ?auto_17043 ?auto_17056 ) ) ( not ( = ?auto_17043 ?auto_17074 ) ) ( not ( = ?auto_17043 ?auto_17078 ) ) ( not ( = ?auto_17043 ?auto_17057 ) ) ( not ( = ?auto_17043 ?auto_17080 ) ) ( not ( = ?auto_17071 ?auto_17085 ) ) ( not ( = ?auto_17071 ?auto_17068 ) ) ( not ( = ?auto_17071 ?auto_17066 ) ) ( not ( = ?auto_17071 ?auto_17081 ) ) ( not ( = ?auto_17071 ?auto_17056 ) ) ( not ( = ?auto_17071 ?auto_17074 ) ) ( not ( = ?auto_17071 ?auto_17078 ) ) ( not ( = ?auto_17071 ?auto_17057 ) ) ( not ( = ?auto_17071 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17044 ) ) ( not ( = ?auto_17033 ?auto_17076 ) ) ( not ( = ?auto_17034 ?auto_17044 ) ) ( not ( = ?auto_17034 ?auto_17076 ) ) ( not ( = ?auto_17035 ?auto_17044 ) ) ( not ( = ?auto_17035 ?auto_17076 ) ) ( not ( = ?auto_17036 ?auto_17044 ) ) ( not ( = ?auto_17036 ?auto_17076 ) ) ( not ( = ?auto_17037 ?auto_17044 ) ) ( not ( = ?auto_17037 ?auto_17076 ) ) ( not ( = ?auto_17038 ?auto_17044 ) ) ( not ( = ?auto_17038 ?auto_17076 ) ) ( not ( = ?auto_17039 ?auto_17044 ) ) ( not ( = ?auto_17039 ?auto_17076 ) ) ( not ( = ?auto_17040 ?auto_17044 ) ) ( not ( = ?auto_17040 ?auto_17076 ) ) ( not ( = ?auto_17041 ?auto_17044 ) ) ( not ( = ?auto_17041 ?auto_17076 ) ) ( not ( = ?auto_17042 ?auto_17044 ) ) ( not ( = ?auto_17042 ?auto_17076 ) ) ( not ( = ?auto_17044 ?auto_17071 ) ) ( not ( = ?auto_17044 ?auto_17085 ) ) ( not ( = ?auto_17044 ?auto_17068 ) ) ( not ( = ?auto_17044 ?auto_17066 ) ) ( not ( = ?auto_17044 ?auto_17081 ) ) ( not ( = ?auto_17044 ?auto_17056 ) ) ( not ( = ?auto_17044 ?auto_17074 ) ) ( not ( = ?auto_17044 ?auto_17078 ) ) ( not ( = ?auto_17044 ?auto_17057 ) ) ( not ( = ?auto_17044 ?auto_17080 ) ) ( not ( = ?auto_17067 ?auto_17059 ) ) ( not ( = ?auto_17067 ?auto_17069 ) ) ( not ( = ?auto_17067 ?auto_17084 ) ) ( not ( = ?auto_17067 ?auto_17062 ) ) ( not ( = ?auto_17067 ?auto_17058 ) ) ( not ( = ?auto_17067 ?auto_17060 ) ) ( not ( = ?auto_17067 ?auto_17075 ) ) ( not ( = ?auto_17067 ?auto_17077 ) ) ( not ( = ?auto_17067 ?auto_17048 ) ) ( not ( = ?auto_17064 ?auto_17086 ) ) ( not ( = ?auto_17064 ?auto_17072 ) ) ( not ( = ?auto_17064 ?auto_17083 ) ) ( not ( = ?auto_17064 ?auto_17079 ) ) ( not ( = ?auto_17064 ?auto_17070 ) ) ( not ( = ?auto_17064 ?auto_17082 ) ) ( not ( = ?auto_17064 ?auto_17063 ) ) ( not ( = ?auto_17064 ?auto_17065 ) ) ( not ( = ?auto_17064 ?auto_17050 ) ) ( not ( = ?auto_17076 ?auto_17071 ) ) ( not ( = ?auto_17076 ?auto_17085 ) ) ( not ( = ?auto_17076 ?auto_17068 ) ) ( not ( = ?auto_17076 ?auto_17066 ) ) ( not ( = ?auto_17076 ?auto_17081 ) ) ( not ( = ?auto_17076 ?auto_17056 ) ) ( not ( = ?auto_17076 ?auto_17074 ) ) ( not ( = ?auto_17076 ?auto_17078 ) ) ( not ( = ?auto_17076 ?auto_17057 ) ) ( not ( = ?auto_17076 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17045 ) ) ( not ( = ?auto_17033 ?auto_17073 ) ) ( not ( = ?auto_17034 ?auto_17045 ) ) ( not ( = ?auto_17034 ?auto_17073 ) ) ( not ( = ?auto_17035 ?auto_17045 ) ) ( not ( = ?auto_17035 ?auto_17073 ) ) ( not ( = ?auto_17036 ?auto_17045 ) ) ( not ( = ?auto_17036 ?auto_17073 ) ) ( not ( = ?auto_17037 ?auto_17045 ) ) ( not ( = ?auto_17037 ?auto_17073 ) ) ( not ( = ?auto_17038 ?auto_17045 ) ) ( not ( = ?auto_17038 ?auto_17073 ) ) ( not ( = ?auto_17039 ?auto_17045 ) ) ( not ( = ?auto_17039 ?auto_17073 ) ) ( not ( = ?auto_17040 ?auto_17045 ) ) ( not ( = ?auto_17040 ?auto_17073 ) ) ( not ( = ?auto_17041 ?auto_17045 ) ) ( not ( = ?auto_17041 ?auto_17073 ) ) ( not ( = ?auto_17042 ?auto_17045 ) ) ( not ( = ?auto_17042 ?auto_17073 ) ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( not ( = ?auto_17043 ?auto_17073 ) ) ( not ( = ?auto_17045 ?auto_17076 ) ) ( not ( = ?auto_17045 ?auto_17071 ) ) ( not ( = ?auto_17045 ?auto_17085 ) ) ( not ( = ?auto_17045 ?auto_17068 ) ) ( not ( = ?auto_17045 ?auto_17066 ) ) ( not ( = ?auto_17045 ?auto_17081 ) ) ( not ( = ?auto_17045 ?auto_17056 ) ) ( not ( = ?auto_17045 ?auto_17074 ) ) ( not ( = ?auto_17045 ?auto_17078 ) ) ( not ( = ?auto_17045 ?auto_17057 ) ) ( not ( = ?auto_17045 ?auto_17080 ) ) ( not ( = ?auto_17073 ?auto_17076 ) ) ( not ( = ?auto_17073 ?auto_17071 ) ) ( not ( = ?auto_17073 ?auto_17085 ) ) ( not ( = ?auto_17073 ?auto_17068 ) ) ( not ( = ?auto_17073 ?auto_17066 ) ) ( not ( = ?auto_17073 ?auto_17081 ) ) ( not ( = ?auto_17073 ?auto_17056 ) ) ( not ( = ?auto_17073 ?auto_17074 ) ) ( not ( = ?auto_17073 ?auto_17078 ) ) ( not ( = ?auto_17073 ?auto_17057 ) ) ( not ( = ?auto_17073 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17046 ) ) ( not ( = ?auto_17033 ?auto_17061 ) ) ( not ( = ?auto_17034 ?auto_17046 ) ) ( not ( = ?auto_17034 ?auto_17061 ) ) ( not ( = ?auto_17035 ?auto_17046 ) ) ( not ( = ?auto_17035 ?auto_17061 ) ) ( not ( = ?auto_17036 ?auto_17046 ) ) ( not ( = ?auto_17036 ?auto_17061 ) ) ( not ( = ?auto_17037 ?auto_17046 ) ) ( not ( = ?auto_17037 ?auto_17061 ) ) ( not ( = ?auto_17038 ?auto_17046 ) ) ( not ( = ?auto_17038 ?auto_17061 ) ) ( not ( = ?auto_17039 ?auto_17046 ) ) ( not ( = ?auto_17039 ?auto_17061 ) ) ( not ( = ?auto_17040 ?auto_17046 ) ) ( not ( = ?auto_17040 ?auto_17061 ) ) ( not ( = ?auto_17041 ?auto_17046 ) ) ( not ( = ?auto_17041 ?auto_17061 ) ) ( not ( = ?auto_17042 ?auto_17046 ) ) ( not ( = ?auto_17042 ?auto_17061 ) ) ( not ( = ?auto_17043 ?auto_17046 ) ) ( not ( = ?auto_17043 ?auto_17061 ) ) ( not ( = ?auto_17044 ?auto_17046 ) ) ( not ( = ?auto_17044 ?auto_17061 ) ) ( not ( = ?auto_17046 ?auto_17073 ) ) ( not ( = ?auto_17046 ?auto_17076 ) ) ( not ( = ?auto_17046 ?auto_17071 ) ) ( not ( = ?auto_17046 ?auto_17085 ) ) ( not ( = ?auto_17046 ?auto_17068 ) ) ( not ( = ?auto_17046 ?auto_17066 ) ) ( not ( = ?auto_17046 ?auto_17081 ) ) ( not ( = ?auto_17046 ?auto_17056 ) ) ( not ( = ?auto_17046 ?auto_17074 ) ) ( not ( = ?auto_17046 ?auto_17078 ) ) ( not ( = ?auto_17046 ?auto_17057 ) ) ( not ( = ?auto_17046 ?auto_17080 ) ) ( not ( = ?auto_17055 ?auto_17067 ) ) ( not ( = ?auto_17055 ?auto_17059 ) ) ( not ( = ?auto_17055 ?auto_17069 ) ) ( not ( = ?auto_17055 ?auto_17084 ) ) ( not ( = ?auto_17055 ?auto_17062 ) ) ( not ( = ?auto_17055 ?auto_17058 ) ) ( not ( = ?auto_17055 ?auto_17060 ) ) ( not ( = ?auto_17055 ?auto_17075 ) ) ( not ( = ?auto_17055 ?auto_17077 ) ) ( not ( = ?auto_17055 ?auto_17048 ) ) ( not ( = ?auto_17054 ?auto_17064 ) ) ( not ( = ?auto_17054 ?auto_17086 ) ) ( not ( = ?auto_17054 ?auto_17072 ) ) ( not ( = ?auto_17054 ?auto_17083 ) ) ( not ( = ?auto_17054 ?auto_17079 ) ) ( not ( = ?auto_17054 ?auto_17070 ) ) ( not ( = ?auto_17054 ?auto_17082 ) ) ( not ( = ?auto_17054 ?auto_17063 ) ) ( not ( = ?auto_17054 ?auto_17065 ) ) ( not ( = ?auto_17054 ?auto_17050 ) ) ( not ( = ?auto_17061 ?auto_17073 ) ) ( not ( = ?auto_17061 ?auto_17076 ) ) ( not ( = ?auto_17061 ?auto_17071 ) ) ( not ( = ?auto_17061 ?auto_17085 ) ) ( not ( = ?auto_17061 ?auto_17068 ) ) ( not ( = ?auto_17061 ?auto_17066 ) ) ( not ( = ?auto_17061 ?auto_17081 ) ) ( not ( = ?auto_17061 ?auto_17056 ) ) ( not ( = ?auto_17061 ?auto_17074 ) ) ( not ( = ?auto_17061 ?auto_17078 ) ) ( not ( = ?auto_17061 ?auto_17057 ) ) ( not ( = ?auto_17061 ?auto_17080 ) ) ( not ( = ?auto_17033 ?auto_17047 ) ) ( not ( = ?auto_17033 ?auto_17049 ) ) ( not ( = ?auto_17034 ?auto_17047 ) ) ( not ( = ?auto_17034 ?auto_17049 ) ) ( not ( = ?auto_17035 ?auto_17047 ) ) ( not ( = ?auto_17035 ?auto_17049 ) ) ( not ( = ?auto_17036 ?auto_17047 ) ) ( not ( = ?auto_17036 ?auto_17049 ) ) ( not ( = ?auto_17037 ?auto_17047 ) ) ( not ( = ?auto_17037 ?auto_17049 ) ) ( not ( = ?auto_17038 ?auto_17047 ) ) ( not ( = ?auto_17038 ?auto_17049 ) ) ( not ( = ?auto_17039 ?auto_17047 ) ) ( not ( = ?auto_17039 ?auto_17049 ) ) ( not ( = ?auto_17040 ?auto_17047 ) ) ( not ( = ?auto_17040 ?auto_17049 ) ) ( not ( = ?auto_17041 ?auto_17047 ) ) ( not ( = ?auto_17041 ?auto_17049 ) ) ( not ( = ?auto_17042 ?auto_17047 ) ) ( not ( = ?auto_17042 ?auto_17049 ) ) ( not ( = ?auto_17043 ?auto_17047 ) ) ( not ( = ?auto_17043 ?auto_17049 ) ) ( not ( = ?auto_17044 ?auto_17047 ) ) ( not ( = ?auto_17044 ?auto_17049 ) ) ( not ( = ?auto_17045 ?auto_17047 ) ) ( not ( = ?auto_17045 ?auto_17049 ) ) ( not ( = ?auto_17047 ?auto_17061 ) ) ( not ( = ?auto_17047 ?auto_17073 ) ) ( not ( = ?auto_17047 ?auto_17076 ) ) ( not ( = ?auto_17047 ?auto_17071 ) ) ( not ( = ?auto_17047 ?auto_17085 ) ) ( not ( = ?auto_17047 ?auto_17068 ) ) ( not ( = ?auto_17047 ?auto_17066 ) ) ( not ( = ?auto_17047 ?auto_17081 ) ) ( not ( = ?auto_17047 ?auto_17056 ) ) ( not ( = ?auto_17047 ?auto_17074 ) ) ( not ( = ?auto_17047 ?auto_17078 ) ) ( not ( = ?auto_17047 ?auto_17057 ) ) ( not ( = ?auto_17047 ?auto_17080 ) ) ( not ( = ?auto_17049 ?auto_17061 ) ) ( not ( = ?auto_17049 ?auto_17073 ) ) ( not ( = ?auto_17049 ?auto_17076 ) ) ( not ( = ?auto_17049 ?auto_17071 ) ) ( not ( = ?auto_17049 ?auto_17085 ) ) ( not ( = ?auto_17049 ?auto_17068 ) ) ( not ( = ?auto_17049 ?auto_17066 ) ) ( not ( = ?auto_17049 ?auto_17081 ) ) ( not ( = ?auto_17049 ?auto_17056 ) ) ( not ( = ?auto_17049 ?auto_17074 ) ) ( not ( = ?auto_17049 ?auto_17078 ) ) ( not ( = ?auto_17049 ?auto_17057 ) ) ( not ( = ?auto_17049 ?auto_17080 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17033 ?auto_17034 ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17040 ?auto_17041 ?auto_17042 ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 )
      ( MAKE-1CRATE ?auto_17046 ?auto_17047 )
      ( MAKE-14CRATE-VERIFY ?auto_17033 ?auto_17034 ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17040 ?auto_17041 ?auto_17042 ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 ?auto_17047 ) )
  )

)

