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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16392 - SURFACE
      ?auto_16393 - SURFACE
    )
    :vars
    (
      ?auto_16394 - HOIST
      ?auto_16395 - PLACE
      ?auto_16397 - PLACE
      ?auto_16398 - HOIST
      ?auto_16399 - SURFACE
      ?auto_16396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16394 ?auto_16395 ) ( SURFACE-AT ?auto_16392 ?auto_16395 ) ( CLEAR ?auto_16392 ) ( IS-CRATE ?auto_16393 ) ( AVAILABLE ?auto_16394 ) ( not ( = ?auto_16397 ?auto_16395 ) ) ( HOIST-AT ?auto_16398 ?auto_16397 ) ( AVAILABLE ?auto_16398 ) ( SURFACE-AT ?auto_16393 ?auto_16397 ) ( ON ?auto_16393 ?auto_16399 ) ( CLEAR ?auto_16393 ) ( TRUCK-AT ?auto_16396 ?auto_16395 ) ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16399 ) ) ( not ( = ?auto_16393 ?auto_16399 ) ) ( not ( = ?auto_16394 ?auto_16398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16396 ?auto_16395 ?auto_16397 )
      ( !LIFT ?auto_16398 ?auto_16393 ?auto_16399 ?auto_16397 )
      ( !LOAD ?auto_16398 ?auto_16393 ?auto_16396 ?auto_16397 )
      ( !DRIVE ?auto_16396 ?auto_16397 ?auto_16395 )
      ( !UNLOAD ?auto_16394 ?auto_16393 ?auto_16396 ?auto_16395 )
      ( !DROP ?auto_16394 ?auto_16393 ?auto_16392 ?auto_16395 )
      ( MAKE-1CRATE-VERIFY ?auto_16392 ?auto_16393 ) )
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
      ?auto_16407 - PLACE
      ?auto_16409 - PLACE
      ?auto_16408 - HOIST
      ?auto_16406 - SURFACE
      ?auto_16414 - PLACE
      ?auto_16412 - HOIST
      ?auto_16413 - SURFACE
      ?auto_16411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16410 ?auto_16407 ) ( IS-CRATE ?auto_16405 ) ( not ( = ?auto_16409 ?auto_16407 ) ) ( HOIST-AT ?auto_16408 ?auto_16409 ) ( AVAILABLE ?auto_16408 ) ( SURFACE-AT ?auto_16405 ?auto_16409 ) ( ON ?auto_16405 ?auto_16406 ) ( CLEAR ?auto_16405 ) ( not ( = ?auto_16404 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16406 ) ) ( not ( = ?auto_16405 ?auto_16406 ) ) ( not ( = ?auto_16410 ?auto_16408 ) ) ( SURFACE-AT ?auto_16403 ?auto_16407 ) ( CLEAR ?auto_16403 ) ( IS-CRATE ?auto_16404 ) ( AVAILABLE ?auto_16410 ) ( not ( = ?auto_16414 ?auto_16407 ) ) ( HOIST-AT ?auto_16412 ?auto_16414 ) ( AVAILABLE ?auto_16412 ) ( SURFACE-AT ?auto_16404 ?auto_16414 ) ( ON ?auto_16404 ?auto_16413 ) ( CLEAR ?auto_16404 ) ( TRUCK-AT ?auto_16411 ?auto_16407 ) ( not ( = ?auto_16403 ?auto_16404 ) ) ( not ( = ?auto_16403 ?auto_16413 ) ) ( not ( = ?auto_16404 ?auto_16413 ) ) ( not ( = ?auto_16410 ?auto_16412 ) ) ( not ( = ?auto_16403 ?auto_16405 ) ) ( not ( = ?auto_16403 ?auto_16406 ) ) ( not ( = ?auto_16405 ?auto_16413 ) ) ( not ( = ?auto_16409 ?auto_16414 ) ) ( not ( = ?auto_16408 ?auto_16412 ) ) ( not ( = ?auto_16406 ?auto_16413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16403 ?auto_16404 )
      ( MAKE-1CRATE ?auto_16404 ?auto_16405 )
      ( MAKE-2CRATE-VERIFY ?auto_16403 ?auto_16404 ?auto_16405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16417 - SURFACE
      ?auto_16418 - SURFACE
    )
    :vars
    (
      ?auto_16419 - HOIST
      ?auto_16420 - PLACE
      ?auto_16422 - PLACE
      ?auto_16423 - HOIST
      ?auto_16424 - SURFACE
      ?auto_16421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16419 ?auto_16420 ) ( SURFACE-AT ?auto_16417 ?auto_16420 ) ( CLEAR ?auto_16417 ) ( IS-CRATE ?auto_16418 ) ( AVAILABLE ?auto_16419 ) ( not ( = ?auto_16422 ?auto_16420 ) ) ( HOIST-AT ?auto_16423 ?auto_16422 ) ( AVAILABLE ?auto_16423 ) ( SURFACE-AT ?auto_16418 ?auto_16422 ) ( ON ?auto_16418 ?auto_16424 ) ( CLEAR ?auto_16418 ) ( TRUCK-AT ?auto_16421 ?auto_16420 ) ( not ( = ?auto_16417 ?auto_16418 ) ) ( not ( = ?auto_16417 ?auto_16424 ) ) ( not ( = ?auto_16418 ?auto_16424 ) ) ( not ( = ?auto_16419 ?auto_16423 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16421 ?auto_16420 ?auto_16422 )
      ( !LIFT ?auto_16423 ?auto_16418 ?auto_16424 ?auto_16422 )
      ( !LOAD ?auto_16423 ?auto_16418 ?auto_16421 ?auto_16422 )
      ( !DRIVE ?auto_16421 ?auto_16422 ?auto_16420 )
      ( !UNLOAD ?auto_16419 ?auto_16418 ?auto_16421 ?auto_16420 )
      ( !DROP ?auto_16419 ?auto_16418 ?auto_16417 ?auto_16420 )
      ( MAKE-1CRATE-VERIFY ?auto_16417 ?auto_16418 ) )
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
      ?auto_16438 - HOIST
      ?auto_16435 - PLACE
      ?auto_16437 - PLACE
      ?auto_16436 - HOIST
      ?auto_16434 - SURFACE
      ?auto_16442 - PLACE
      ?auto_16444 - HOIST
      ?auto_16443 - SURFACE
      ?auto_16441 - PLACE
      ?auto_16439 - HOIST
      ?auto_16440 - SURFACE
      ?auto_16433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16438 ?auto_16435 ) ( IS-CRATE ?auto_16432 ) ( not ( = ?auto_16437 ?auto_16435 ) ) ( HOIST-AT ?auto_16436 ?auto_16437 ) ( AVAILABLE ?auto_16436 ) ( SURFACE-AT ?auto_16432 ?auto_16437 ) ( ON ?auto_16432 ?auto_16434 ) ( CLEAR ?auto_16432 ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( not ( = ?auto_16431 ?auto_16434 ) ) ( not ( = ?auto_16432 ?auto_16434 ) ) ( not ( = ?auto_16438 ?auto_16436 ) ) ( IS-CRATE ?auto_16431 ) ( not ( = ?auto_16442 ?auto_16435 ) ) ( HOIST-AT ?auto_16444 ?auto_16442 ) ( AVAILABLE ?auto_16444 ) ( SURFACE-AT ?auto_16431 ?auto_16442 ) ( ON ?auto_16431 ?auto_16443 ) ( CLEAR ?auto_16431 ) ( not ( = ?auto_16430 ?auto_16431 ) ) ( not ( = ?auto_16430 ?auto_16443 ) ) ( not ( = ?auto_16431 ?auto_16443 ) ) ( not ( = ?auto_16438 ?auto_16444 ) ) ( SURFACE-AT ?auto_16429 ?auto_16435 ) ( CLEAR ?auto_16429 ) ( IS-CRATE ?auto_16430 ) ( AVAILABLE ?auto_16438 ) ( not ( = ?auto_16441 ?auto_16435 ) ) ( HOIST-AT ?auto_16439 ?auto_16441 ) ( AVAILABLE ?auto_16439 ) ( SURFACE-AT ?auto_16430 ?auto_16441 ) ( ON ?auto_16430 ?auto_16440 ) ( CLEAR ?auto_16430 ) ( TRUCK-AT ?auto_16433 ?auto_16435 ) ( not ( = ?auto_16429 ?auto_16430 ) ) ( not ( = ?auto_16429 ?auto_16440 ) ) ( not ( = ?auto_16430 ?auto_16440 ) ) ( not ( = ?auto_16438 ?auto_16439 ) ) ( not ( = ?auto_16429 ?auto_16431 ) ) ( not ( = ?auto_16429 ?auto_16443 ) ) ( not ( = ?auto_16431 ?auto_16440 ) ) ( not ( = ?auto_16442 ?auto_16441 ) ) ( not ( = ?auto_16444 ?auto_16439 ) ) ( not ( = ?auto_16443 ?auto_16440 ) ) ( not ( = ?auto_16429 ?auto_16432 ) ) ( not ( = ?auto_16429 ?auto_16434 ) ) ( not ( = ?auto_16430 ?auto_16432 ) ) ( not ( = ?auto_16430 ?auto_16434 ) ) ( not ( = ?auto_16432 ?auto_16443 ) ) ( not ( = ?auto_16432 ?auto_16440 ) ) ( not ( = ?auto_16437 ?auto_16442 ) ) ( not ( = ?auto_16437 ?auto_16441 ) ) ( not ( = ?auto_16436 ?auto_16444 ) ) ( not ( = ?auto_16436 ?auto_16439 ) ) ( not ( = ?auto_16434 ?auto_16443 ) ) ( not ( = ?auto_16434 ?auto_16440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16429 ?auto_16430 ?auto_16431 )
      ( MAKE-1CRATE ?auto_16431 ?auto_16432 )
      ( MAKE-3CRATE-VERIFY ?auto_16429 ?auto_16430 ?auto_16431 ?auto_16432 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16447 - SURFACE
      ?auto_16448 - SURFACE
    )
    :vars
    (
      ?auto_16449 - HOIST
      ?auto_16450 - PLACE
      ?auto_16452 - PLACE
      ?auto_16453 - HOIST
      ?auto_16454 - SURFACE
      ?auto_16451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16449 ?auto_16450 ) ( SURFACE-AT ?auto_16447 ?auto_16450 ) ( CLEAR ?auto_16447 ) ( IS-CRATE ?auto_16448 ) ( AVAILABLE ?auto_16449 ) ( not ( = ?auto_16452 ?auto_16450 ) ) ( HOIST-AT ?auto_16453 ?auto_16452 ) ( AVAILABLE ?auto_16453 ) ( SURFACE-AT ?auto_16448 ?auto_16452 ) ( ON ?auto_16448 ?auto_16454 ) ( CLEAR ?auto_16448 ) ( TRUCK-AT ?auto_16451 ?auto_16450 ) ( not ( = ?auto_16447 ?auto_16448 ) ) ( not ( = ?auto_16447 ?auto_16454 ) ) ( not ( = ?auto_16448 ?auto_16454 ) ) ( not ( = ?auto_16449 ?auto_16453 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16451 ?auto_16450 ?auto_16452 )
      ( !LIFT ?auto_16453 ?auto_16448 ?auto_16454 ?auto_16452 )
      ( !LOAD ?auto_16453 ?auto_16448 ?auto_16451 ?auto_16452 )
      ( !DRIVE ?auto_16451 ?auto_16452 ?auto_16450 )
      ( !UNLOAD ?auto_16449 ?auto_16448 ?auto_16451 ?auto_16450 )
      ( !DROP ?auto_16449 ?auto_16448 ?auto_16447 ?auto_16450 )
      ( MAKE-1CRATE-VERIFY ?auto_16447 ?auto_16448 ) )
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
      ?auto_16466 - PLACE
      ?auto_16465 - HOIST
      ?auto_16468 - SURFACE
      ?auto_16473 - PLACE
      ?auto_16472 - HOIST
      ?auto_16475 - SURFACE
      ?auto_16471 - PLACE
      ?auto_16474 - HOIST
      ?auto_16477 - SURFACE
      ?auto_16476 - PLACE
      ?auto_16479 - HOIST
      ?auto_16478 - SURFACE
      ?auto_16470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16469 ?auto_16467 ) ( IS-CRATE ?auto_16464 ) ( not ( = ?auto_16466 ?auto_16467 ) ) ( HOIST-AT ?auto_16465 ?auto_16466 ) ( AVAILABLE ?auto_16465 ) ( SURFACE-AT ?auto_16464 ?auto_16466 ) ( ON ?auto_16464 ?auto_16468 ) ( CLEAR ?auto_16464 ) ( not ( = ?auto_16463 ?auto_16464 ) ) ( not ( = ?auto_16463 ?auto_16468 ) ) ( not ( = ?auto_16464 ?auto_16468 ) ) ( not ( = ?auto_16469 ?auto_16465 ) ) ( IS-CRATE ?auto_16463 ) ( not ( = ?auto_16473 ?auto_16467 ) ) ( HOIST-AT ?auto_16472 ?auto_16473 ) ( AVAILABLE ?auto_16472 ) ( SURFACE-AT ?auto_16463 ?auto_16473 ) ( ON ?auto_16463 ?auto_16475 ) ( CLEAR ?auto_16463 ) ( not ( = ?auto_16462 ?auto_16463 ) ) ( not ( = ?auto_16462 ?auto_16475 ) ) ( not ( = ?auto_16463 ?auto_16475 ) ) ( not ( = ?auto_16469 ?auto_16472 ) ) ( IS-CRATE ?auto_16462 ) ( not ( = ?auto_16471 ?auto_16467 ) ) ( HOIST-AT ?auto_16474 ?auto_16471 ) ( AVAILABLE ?auto_16474 ) ( SURFACE-AT ?auto_16462 ?auto_16471 ) ( ON ?auto_16462 ?auto_16477 ) ( CLEAR ?auto_16462 ) ( not ( = ?auto_16461 ?auto_16462 ) ) ( not ( = ?auto_16461 ?auto_16477 ) ) ( not ( = ?auto_16462 ?auto_16477 ) ) ( not ( = ?auto_16469 ?auto_16474 ) ) ( SURFACE-AT ?auto_16460 ?auto_16467 ) ( CLEAR ?auto_16460 ) ( IS-CRATE ?auto_16461 ) ( AVAILABLE ?auto_16469 ) ( not ( = ?auto_16476 ?auto_16467 ) ) ( HOIST-AT ?auto_16479 ?auto_16476 ) ( AVAILABLE ?auto_16479 ) ( SURFACE-AT ?auto_16461 ?auto_16476 ) ( ON ?auto_16461 ?auto_16478 ) ( CLEAR ?auto_16461 ) ( TRUCK-AT ?auto_16470 ?auto_16467 ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16478 ) ) ( not ( = ?auto_16461 ?auto_16478 ) ) ( not ( = ?auto_16469 ?auto_16479 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16477 ) ) ( not ( = ?auto_16462 ?auto_16478 ) ) ( not ( = ?auto_16471 ?auto_16476 ) ) ( not ( = ?auto_16474 ?auto_16479 ) ) ( not ( = ?auto_16477 ?auto_16478 ) ) ( not ( = ?auto_16460 ?auto_16463 ) ) ( not ( = ?auto_16460 ?auto_16475 ) ) ( not ( = ?auto_16461 ?auto_16463 ) ) ( not ( = ?auto_16461 ?auto_16475 ) ) ( not ( = ?auto_16463 ?auto_16477 ) ) ( not ( = ?auto_16463 ?auto_16478 ) ) ( not ( = ?auto_16473 ?auto_16471 ) ) ( not ( = ?auto_16473 ?auto_16476 ) ) ( not ( = ?auto_16472 ?auto_16474 ) ) ( not ( = ?auto_16472 ?auto_16479 ) ) ( not ( = ?auto_16475 ?auto_16477 ) ) ( not ( = ?auto_16475 ?auto_16478 ) ) ( not ( = ?auto_16460 ?auto_16464 ) ) ( not ( = ?auto_16460 ?auto_16468 ) ) ( not ( = ?auto_16461 ?auto_16464 ) ) ( not ( = ?auto_16461 ?auto_16468 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( not ( = ?auto_16462 ?auto_16468 ) ) ( not ( = ?auto_16464 ?auto_16475 ) ) ( not ( = ?auto_16464 ?auto_16477 ) ) ( not ( = ?auto_16464 ?auto_16478 ) ) ( not ( = ?auto_16466 ?auto_16473 ) ) ( not ( = ?auto_16466 ?auto_16471 ) ) ( not ( = ?auto_16466 ?auto_16476 ) ) ( not ( = ?auto_16465 ?auto_16472 ) ) ( not ( = ?auto_16465 ?auto_16474 ) ) ( not ( = ?auto_16465 ?auto_16479 ) ) ( not ( = ?auto_16468 ?auto_16475 ) ) ( not ( = ?auto_16468 ?auto_16477 ) ) ( not ( = ?auto_16468 ?auto_16478 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 )
      ( MAKE-1CRATE ?auto_16463 ?auto_16464 )
      ( MAKE-4CRATE-VERIFY ?auto_16460 ?auto_16461 ?auto_16462 ?auto_16463 ?auto_16464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16482 - SURFACE
      ?auto_16483 - SURFACE
    )
    :vars
    (
      ?auto_16484 - HOIST
      ?auto_16485 - PLACE
      ?auto_16487 - PLACE
      ?auto_16488 - HOIST
      ?auto_16489 - SURFACE
      ?auto_16486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16484 ?auto_16485 ) ( SURFACE-AT ?auto_16482 ?auto_16485 ) ( CLEAR ?auto_16482 ) ( IS-CRATE ?auto_16483 ) ( AVAILABLE ?auto_16484 ) ( not ( = ?auto_16487 ?auto_16485 ) ) ( HOIST-AT ?auto_16488 ?auto_16487 ) ( AVAILABLE ?auto_16488 ) ( SURFACE-AT ?auto_16483 ?auto_16487 ) ( ON ?auto_16483 ?auto_16489 ) ( CLEAR ?auto_16483 ) ( TRUCK-AT ?auto_16486 ?auto_16485 ) ( not ( = ?auto_16482 ?auto_16483 ) ) ( not ( = ?auto_16482 ?auto_16489 ) ) ( not ( = ?auto_16483 ?auto_16489 ) ) ( not ( = ?auto_16484 ?auto_16488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16486 ?auto_16485 ?auto_16487 )
      ( !LIFT ?auto_16488 ?auto_16483 ?auto_16489 ?auto_16487 )
      ( !LOAD ?auto_16488 ?auto_16483 ?auto_16486 ?auto_16487 )
      ( !DRIVE ?auto_16486 ?auto_16487 ?auto_16485 )
      ( !UNLOAD ?auto_16484 ?auto_16483 ?auto_16486 ?auto_16485 )
      ( !DROP ?auto_16484 ?auto_16483 ?auto_16482 ?auto_16485 )
      ( MAKE-1CRATE-VERIFY ?auto_16482 ?auto_16483 ) )
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
      ?auto_16504 - HOIST
      ?auto_16507 - PLACE
      ?auto_16505 - PLACE
      ?auto_16503 - HOIST
      ?auto_16502 - SURFACE
      ?auto_16518 - PLACE
      ?auto_16514 - HOIST
      ?auto_16511 - SURFACE
      ?auto_16509 - PLACE
      ?auto_16510 - HOIST
      ?auto_16516 - SURFACE
      ?auto_16513 - PLACE
      ?auto_16512 - HOIST
      ?auto_16515 - SURFACE
      ?auto_16517 - PLACE
      ?auto_16508 - HOIST
      ?auto_16519 - SURFACE
      ?auto_16506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16504 ?auto_16507 ) ( IS-CRATE ?auto_16501 ) ( not ( = ?auto_16505 ?auto_16507 ) ) ( HOIST-AT ?auto_16503 ?auto_16505 ) ( AVAILABLE ?auto_16503 ) ( SURFACE-AT ?auto_16501 ?auto_16505 ) ( ON ?auto_16501 ?auto_16502 ) ( CLEAR ?auto_16501 ) ( not ( = ?auto_16500 ?auto_16501 ) ) ( not ( = ?auto_16500 ?auto_16502 ) ) ( not ( = ?auto_16501 ?auto_16502 ) ) ( not ( = ?auto_16504 ?auto_16503 ) ) ( IS-CRATE ?auto_16500 ) ( not ( = ?auto_16518 ?auto_16507 ) ) ( HOIST-AT ?auto_16514 ?auto_16518 ) ( AVAILABLE ?auto_16514 ) ( SURFACE-AT ?auto_16500 ?auto_16518 ) ( ON ?auto_16500 ?auto_16511 ) ( CLEAR ?auto_16500 ) ( not ( = ?auto_16499 ?auto_16500 ) ) ( not ( = ?auto_16499 ?auto_16511 ) ) ( not ( = ?auto_16500 ?auto_16511 ) ) ( not ( = ?auto_16504 ?auto_16514 ) ) ( IS-CRATE ?auto_16499 ) ( not ( = ?auto_16509 ?auto_16507 ) ) ( HOIST-AT ?auto_16510 ?auto_16509 ) ( AVAILABLE ?auto_16510 ) ( SURFACE-AT ?auto_16499 ?auto_16509 ) ( ON ?auto_16499 ?auto_16516 ) ( CLEAR ?auto_16499 ) ( not ( = ?auto_16498 ?auto_16499 ) ) ( not ( = ?auto_16498 ?auto_16516 ) ) ( not ( = ?auto_16499 ?auto_16516 ) ) ( not ( = ?auto_16504 ?auto_16510 ) ) ( IS-CRATE ?auto_16498 ) ( not ( = ?auto_16513 ?auto_16507 ) ) ( HOIST-AT ?auto_16512 ?auto_16513 ) ( AVAILABLE ?auto_16512 ) ( SURFACE-AT ?auto_16498 ?auto_16513 ) ( ON ?auto_16498 ?auto_16515 ) ( CLEAR ?auto_16498 ) ( not ( = ?auto_16497 ?auto_16498 ) ) ( not ( = ?auto_16497 ?auto_16515 ) ) ( not ( = ?auto_16498 ?auto_16515 ) ) ( not ( = ?auto_16504 ?auto_16512 ) ) ( SURFACE-AT ?auto_16496 ?auto_16507 ) ( CLEAR ?auto_16496 ) ( IS-CRATE ?auto_16497 ) ( AVAILABLE ?auto_16504 ) ( not ( = ?auto_16517 ?auto_16507 ) ) ( HOIST-AT ?auto_16508 ?auto_16517 ) ( AVAILABLE ?auto_16508 ) ( SURFACE-AT ?auto_16497 ?auto_16517 ) ( ON ?auto_16497 ?auto_16519 ) ( CLEAR ?auto_16497 ) ( TRUCK-AT ?auto_16506 ?auto_16507 ) ( not ( = ?auto_16496 ?auto_16497 ) ) ( not ( = ?auto_16496 ?auto_16519 ) ) ( not ( = ?auto_16497 ?auto_16519 ) ) ( not ( = ?auto_16504 ?auto_16508 ) ) ( not ( = ?auto_16496 ?auto_16498 ) ) ( not ( = ?auto_16496 ?auto_16515 ) ) ( not ( = ?auto_16498 ?auto_16519 ) ) ( not ( = ?auto_16513 ?auto_16517 ) ) ( not ( = ?auto_16512 ?auto_16508 ) ) ( not ( = ?auto_16515 ?auto_16519 ) ) ( not ( = ?auto_16496 ?auto_16499 ) ) ( not ( = ?auto_16496 ?auto_16516 ) ) ( not ( = ?auto_16497 ?auto_16499 ) ) ( not ( = ?auto_16497 ?auto_16516 ) ) ( not ( = ?auto_16499 ?auto_16515 ) ) ( not ( = ?auto_16499 ?auto_16519 ) ) ( not ( = ?auto_16509 ?auto_16513 ) ) ( not ( = ?auto_16509 ?auto_16517 ) ) ( not ( = ?auto_16510 ?auto_16512 ) ) ( not ( = ?auto_16510 ?auto_16508 ) ) ( not ( = ?auto_16516 ?auto_16515 ) ) ( not ( = ?auto_16516 ?auto_16519 ) ) ( not ( = ?auto_16496 ?auto_16500 ) ) ( not ( = ?auto_16496 ?auto_16511 ) ) ( not ( = ?auto_16497 ?auto_16500 ) ) ( not ( = ?auto_16497 ?auto_16511 ) ) ( not ( = ?auto_16498 ?auto_16500 ) ) ( not ( = ?auto_16498 ?auto_16511 ) ) ( not ( = ?auto_16500 ?auto_16516 ) ) ( not ( = ?auto_16500 ?auto_16515 ) ) ( not ( = ?auto_16500 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16509 ) ) ( not ( = ?auto_16518 ?auto_16513 ) ) ( not ( = ?auto_16518 ?auto_16517 ) ) ( not ( = ?auto_16514 ?auto_16510 ) ) ( not ( = ?auto_16514 ?auto_16512 ) ) ( not ( = ?auto_16514 ?auto_16508 ) ) ( not ( = ?auto_16511 ?auto_16516 ) ) ( not ( = ?auto_16511 ?auto_16515 ) ) ( not ( = ?auto_16511 ?auto_16519 ) ) ( not ( = ?auto_16496 ?auto_16501 ) ) ( not ( = ?auto_16496 ?auto_16502 ) ) ( not ( = ?auto_16497 ?auto_16501 ) ) ( not ( = ?auto_16497 ?auto_16502 ) ) ( not ( = ?auto_16498 ?auto_16501 ) ) ( not ( = ?auto_16498 ?auto_16502 ) ) ( not ( = ?auto_16499 ?auto_16501 ) ) ( not ( = ?auto_16499 ?auto_16502 ) ) ( not ( = ?auto_16501 ?auto_16511 ) ) ( not ( = ?auto_16501 ?auto_16516 ) ) ( not ( = ?auto_16501 ?auto_16515 ) ) ( not ( = ?auto_16501 ?auto_16519 ) ) ( not ( = ?auto_16505 ?auto_16518 ) ) ( not ( = ?auto_16505 ?auto_16509 ) ) ( not ( = ?auto_16505 ?auto_16513 ) ) ( not ( = ?auto_16505 ?auto_16517 ) ) ( not ( = ?auto_16503 ?auto_16514 ) ) ( not ( = ?auto_16503 ?auto_16510 ) ) ( not ( = ?auto_16503 ?auto_16512 ) ) ( not ( = ?auto_16503 ?auto_16508 ) ) ( not ( = ?auto_16502 ?auto_16511 ) ) ( not ( = ?auto_16502 ?auto_16516 ) ) ( not ( = ?auto_16502 ?auto_16515 ) ) ( not ( = ?auto_16502 ?auto_16519 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_16496 ?auto_16497 ?auto_16498 ?auto_16499 ?auto_16500 )
      ( MAKE-1CRATE ?auto_16500 ?auto_16501 )
      ( MAKE-5CRATE-VERIFY ?auto_16496 ?auto_16497 ?auto_16498 ?auto_16499 ?auto_16500 ?auto_16501 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16522 - SURFACE
      ?auto_16523 - SURFACE
    )
    :vars
    (
      ?auto_16524 - HOIST
      ?auto_16525 - PLACE
      ?auto_16527 - PLACE
      ?auto_16528 - HOIST
      ?auto_16529 - SURFACE
      ?auto_16526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16524 ?auto_16525 ) ( SURFACE-AT ?auto_16522 ?auto_16525 ) ( CLEAR ?auto_16522 ) ( IS-CRATE ?auto_16523 ) ( AVAILABLE ?auto_16524 ) ( not ( = ?auto_16527 ?auto_16525 ) ) ( HOIST-AT ?auto_16528 ?auto_16527 ) ( AVAILABLE ?auto_16528 ) ( SURFACE-AT ?auto_16523 ?auto_16527 ) ( ON ?auto_16523 ?auto_16529 ) ( CLEAR ?auto_16523 ) ( TRUCK-AT ?auto_16526 ?auto_16525 ) ( not ( = ?auto_16522 ?auto_16523 ) ) ( not ( = ?auto_16522 ?auto_16529 ) ) ( not ( = ?auto_16523 ?auto_16529 ) ) ( not ( = ?auto_16524 ?auto_16528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16526 ?auto_16525 ?auto_16527 )
      ( !LIFT ?auto_16528 ?auto_16523 ?auto_16529 ?auto_16527 )
      ( !LOAD ?auto_16528 ?auto_16523 ?auto_16526 ?auto_16527 )
      ( !DRIVE ?auto_16526 ?auto_16527 ?auto_16525 )
      ( !UNLOAD ?auto_16524 ?auto_16523 ?auto_16526 ?auto_16525 )
      ( !DROP ?auto_16524 ?auto_16523 ?auto_16522 ?auto_16525 )
      ( MAKE-1CRATE-VERIFY ?auto_16522 ?auto_16523 ) )
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
      ?auto_16549 - HOIST
      ?auto_16547 - PLACE
      ?auto_16546 - PLACE
      ?auto_16544 - HOIST
      ?auto_16545 - SURFACE
      ?auto_16564 - PLACE
      ?auto_16551 - HOIST
      ?auto_16563 - SURFACE
      ?auto_16559 - PLACE
      ?auto_16553 - HOIST
      ?auto_16562 - SURFACE
      ?auto_16557 - PLACE
      ?auto_16556 - HOIST
      ?auto_16561 - SURFACE
      ?auto_16560 - PLACE
      ?auto_16555 - HOIST
      ?auto_16554 - SURFACE
      ?auto_16558 - PLACE
      ?auto_16550 - HOIST
      ?auto_16552 - SURFACE
      ?auto_16548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16549 ?auto_16547 ) ( IS-CRATE ?auto_16543 ) ( not ( = ?auto_16546 ?auto_16547 ) ) ( HOIST-AT ?auto_16544 ?auto_16546 ) ( AVAILABLE ?auto_16544 ) ( SURFACE-AT ?auto_16543 ?auto_16546 ) ( ON ?auto_16543 ?auto_16545 ) ( CLEAR ?auto_16543 ) ( not ( = ?auto_16542 ?auto_16543 ) ) ( not ( = ?auto_16542 ?auto_16545 ) ) ( not ( = ?auto_16543 ?auto_16545 ) ) ( not ( = ?auto_16549 ?auto_16544 ) ) ( IS-CRATE ?auto_16542 ) ( not ( = ?auto_16564 ?auto_16547 ) ) ( HOIST-AT ?auto_16551 ?auto_16564 ) ( AVAILABLE ?auto_16551 ) ( SURFACE-AT ?auto_16542 ?auto_16564 ) ( ON ?auto_16542 ?auto_16563 ) ( CLEAR ?auto_16542 ) ( not ( = ?auto_16541 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16563 ) ) ( not ( = ?auto_16542 ?auto_16563 ) ) ( not ( = ?auto_16549 ?auto_16551 ) ) ( IS-CRATE ?auto_16541 ) ( not ( = ?auto_16559 ?auto_16547 ) ) ( HOIST-AT ?auto_16553 ?auto_16559 ) ( AVAILABLE ?auto_16553 ) ( SURFACE-AT ?auto_16541 ?auto_16559 ) ( ON ?auto_16541 ?auto_16562 ) ( CLEAR ?auto_16541 ) ( not ( = ?auto_16540 ?auto_16541 ) ) ( not ( = ?auto_16540 ?auto_16562 ) ) ( not ( = ?auto_16541 ?auto_16562 ) ) ( not ( = ?auto_16549 ?auto_16553 ) ) ( IS-CRATE ?auto_16540 ) ( not ( = ?auto_16557 ?auto_16547 ) ) ( HOIST-AT ?auto_16556 ?auto_16557 ) ( AVAILABLE ?auto_16556 ) ( SURFACE-AT ?auto_16540 ?auto_16557 ) ( ON ?auto_16540 ?auto_16561 ) ( CLEAR ?auto_16540 ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( not ( = ?auto_16539 ?auto_16561 ) ) ( not ( = ?auto_16540 ?auto_16561 ) ) ( not ( = ?auto_16549 ?auto_16556 ) ) ( IS-CRATE ?auto_16539 ) ( not ( = ?auto_16560 ?auto_16547 ) ) ( HOIST-AT ?auto_16555 ?auto_16560 ) ( AVAILABLE ?auto_16555 ) ( SURFACE-AT ?auto_16539 ?auto_16560 ) ( ON ?auto_16539 ?auto_16554 ) ( CLEAR ?auto_16539 ) ( not ( = ?auto_16538 ?auto_16539 ) ) ( not ( = ?auto_16538 ?auto_16554 ) ) ( not ( = ?auto_16539 ?auto_16554 ) ) ( not ( = ?auto_16549 ?auto_16555 ) ) ( SURFACE-AT ?auto_16537 ?auto_16547 ) ( CLEAR ?auto_16537 ) ( IS-CRATE ?auto_16538 ) ( AVAILABLE ?auto_16549 ) ( not ( = ?auto_16558 ?auto_16547 ) ) ( HOIST-AT ?auto_16550 ?auto_16558 ) ( AVAILABLE ?auto_16550 ) ( SURFACE-AT ?auto_16538 ?auto_16558 ) ( ON ?auto_16538 ?auto_16552 ) ( CLEAR ?auto_16538 ) ( TRUCK-AT ?auto_16548 ?auto_16547 ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( not ( = ?auto_16537 ?auto_16552 ) ) ( not ( = ?auto_16538 ?auto_16552 ) ) ( not ( = ?auto_16549 ?auto_16550 ) ) ( not ( = ?auto_16537 ?auto_16539 ) ) ( not ( = ?auto_16537 ?auto_16554 ) ) ( not ( = ?auto_16539 ?auto_16552 ) ) ( not ( = ?auto_16560 ?auto_16558 ) ) ( not ( = ?auto_16555 ?auto_16550 ) ) ( not ( = ?auto_16554 ?auto_16552 ) ) ( not ( = ?auto_16537 ?auto_16540 ) ) ( not ( = ?auto_16537 ?auto_16561 ) ) ( not ( = ?auto_16538 ?auto_16540 ) ) ( not ( = ?auto_16538 ?auto_16561 ) ) ( not ( = ?auto_16540 ?auto_16554 ) ) ( not ( = ?auto_16540 ?auto_16552 ) ) ( not ( = ?auto_16557 ?auto_16560 ) ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( not ( = ?auto_16556 ?auto_16555 ) ) ( not ( = ?auto_16556 ?auto_16550 ) ) ( not ( = ?auto_16561 ?auto_16554 ) ) ( not ( = ?auto_16561 ?auto_16552 ) ) ( not ( = ?auto_16537 ?auto_16541 ) ) ( not ( = ?auto_16537 ?auto_16562 ) ) ( not ( = ?auto_16538 ?auto_16541 ) ) ( not ( = ?auto_16538 ?auto_16562 ) ) ( not ( = ?auto_16539 ?auto_16541 ) ) ( not ( = ?auto_16539 ?auto_16562 ) ) ( not ( = ?auto_16541 ?auto_16561 ) ) ( not ( = ?auto_16541 ?auto_16554 ) ) ( not ( = ?auto_16541 ?auto_16552 ) ) ( not ( = ?auto_16559 ?auto_16557 ) ) ( not ( = ?auto_16559 ?auto_16560 ) ) ( not ( = ?auto_16559 ?auto_16558 ) ) ( not ( = ?auto_16553 ?auto_16556 ) ) ( not ( = ?auto_16553 ?auto_16555 ) ) ( not ( = ?auto_16553 ?auto_16550 ) ) ( not ( = ?auto_16562 ?auto_16561 ) ) ( not ( = ?auto_16562 ?auto_16554 ) ) ( not ( = ?auto_16562 ?auto_16552 ) ) ( not ( = ?auto_16537 ?auto_16542 ) ) ( not ( = ?auto_16537 ?auto_16563 ) ) ( not ( = ?auto_16538 ?auto_16542 ) ) ( not ( = ?auto_16538 ?auto_16563 ) ) ( not ( = ?auto_16539 ?auto_16542 ) ) ( not ( = ?auto_16539 ?auto_16563 ) ) ( not ( = ?auto_16540 ?auto_16542 ) ) ( not ( = ?auto_16540 ?auto_16563 ) ) ( not ( = ?auto_16542 ?auto_16562 ) ) ( not ( = ?auto_16542 ?auto_16561 ) ) ( not ( = ?auto_16542 ?auto_16554 ) ) ( not ( = ?auto_16542 ?auto_16552 ) ) ( not ( = ?auto_16564 ?auto_16559 ) ) ( not ( = ?auto_16564 ?auto_16557 ) ) ( not ( = ?auto_16564 ?auto_16560 ) ) ( not ( = ?auto_16564 ?auto_16558 ) ) ( not ( = ?auto_16551 ?auto_16553 ) ) ( not ( = ?auto_16551 ?auto_16556 ) ) ( not ( = ?auto_16551 ?auto_16555 ) ) ( not ( = ?auto_16551 ?auto_16550 ) ) ( not ( = ?auto_16563 ?auto_16562 ) ) ( not ( = ?auto_16563 ?auto_16561 ) ) ( not ( = ?auto_16563 ?auto_16554 ) ) ( not ( = ?auto_16563 ?auto_16552 ) ) ( not ( = ?auto_16537 ?auto_16543 ) ) ( not ( = ?auto_16537 ?auto_16545 ) ) ( not ( = ?auto_16538 ?auto_16543 ) ) ( not ( = ?auto_16538 ?auto_16545 ) ) ( not ( = ?auto_16539 ?auto_16543 ) ) ( not ( = ?auto_16539 ?auto_16545 ) ) ( not ( = ?auto_16540 ?auto_16543 ) ) ( not ( = ?auto_16540 ?auto_16545 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( not ( = ?auto_16541 ?auto_16545 ) ) ( not ( = ?auto_16543 ?auto_16563 ) ) ( not ( = ?auto_16543 ?auto_16562 ) ) ( not ( = ?auto_16543 ?auto_16561 ) ) ( not ( = ?auto_16543 ?auto_16554 ) ) ( not ( = ?auto_16543 ?auto_16552 ) ) ( not ( = ?auto_16546 ?auto_16564 ) ) ( not ( = ?auto_16546 ?auto_16559 ) ) ( not ( = ?auto_16546 ?auto_16557 ) ) ( not ( = ?auto_16546 ?auto_16560 ) ) ( not ( = ?auto_16546 ?auto_16558 ) ) ( not ( = ?auto_16544 ?auto_16551 ) ) ( not ( = ?auto_16544 ?auto_16553 ) ) ( not ( = ?auto_16544 ?auto_16556 ) ) ( not ( = ?auto_16544 ?auto_16555 ) ) ( not ( = ?auto_16544 ?auto_16550 ) ) ( not ( = ?auto_16545 ?auto_16563 ) ) ( not ( = ?auto_16545 ?auto_16562 ) ) ( not ( = ?auto_16545 ?auto_16561 ) ) ( not ( = ?auto_16545 ?auto_16554 ) ) ( not ( = ?auto_16545 ?auto_16552 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_16537 ?auto_16538 ?auto_16539 ?auto_16540 ?auto_16541 ?auto_16542 )
      ( MAKE-1CRATE ?auto_16542 ?auto_16543 )
      ( MAKE-6CRATE-VERIFY ?auto_16537 ?auto_16538 ?auto_16539 ?auto_16540 ?auto_16541 ?auto_16542 ?auto_16543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16567 - SURFACE
      ?auto_16568 - SURFACE
    )
    :vars
    (
      ?auto_16569 - HOIST
      ?auto_16570 - PLACE
      ?auto_16572 - PLACE
      ?auto_16573 - HOIST
      ?auto_16574 - SURFACE
      ?auto_16571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16569 ?auto_16570 ) ( SURFACE-AT ?auto_16567 ?auto_16570 ) ( CLEAR ?auto_16567 ) ( IS-CRATE ?auto_16568 ) ( AVAILABLE ?auto_16569 ) ( not ( = ?auto_16572 ?auto_16570 ) ) ( HOIST-AT ?auto_16573 ?auto_16572 ) ( AVAILABLE ?auto_16573 ) ( SURFACE-AT ?auto_16568 ?auto_16572 ) ( ON ?auto_16568 ?auto_16574 ) ( CLEAR ?auto_16568 ) ( TRUCK-AT ?auto_16571 ?auto_16570 ) ( not ( = ?auto_16567 ?auto_16568 ) ) ( not ( = ?auto_16567 ?auto_16574 ) ) ( not ( = ?auto_16568 ?auto_16574 ) ) ( not ( = ?auto_16569 ?auto_16573 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16571 ?auto_16570 ?auto_16572 )
      ( !LIFT ?auto_16573 ?auto_16568 ?auto_16574 ?auto_16572 )
      ( !LOAD ?auto_16573 ?auto_16568 ?auto_16571 ?auto_16572 )
      ( !DRIVE ?auto_16571 ?auto_16572 ?auto_16570 )
      ( !UNLOAD ?auto_16569 ?auto_16568 ?auto_16571 ?auto_16570 )
      ( !DROP ?auto_16569 ?auto_16568 ?auto_16567 ?auto_16570 )
      ( MAKE-1CRATE-VERIFY ?auto_16567 ?auto_16568 ) )
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
      ?auto_16590 - SURFACE
      ?auto_16589 - SURFACE
    )
    :vars
    (
      ?auto_16591 - HOIST
      ?auto_16592 - PLACE
      ?auto_16596 - PLACE
      ?auto_16593 - HOIST
      ?auto_16594 - SURFACE
      ?auto_16604 - PLACE
      ?auto_16612 - HOIST
      ?auto_16613 - SURFACE
      ?auto_16614 - PLACE
      ?auto_16608 - HOIST
      ?auto_16600 - SURFACE
      ?auto_16597 - PLACE
      ?auto_16605 - HOIST
      ?auto_16599 - SURFACE
      ?auto_16601 - PLACE
      ?auto_16610 - HOIST
      ?auto_16598 - SURFACE
      ?auto_16607 - PLACE
      ?auto_16611 - HOIST
      ?auto_16602 - SURFACE
      ?auto_16606 - PLACE
      ?auto_16603 - HOIST
      ?auto_16609 - SURFACE
      ?auto_16595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16591 ?auto_16592 ) ( IS-CRATE ?auto_16589 ) ( not ( = ?auto_16596 ?auto_16592 ) ) ( HOIST-AT ?auto_16593 ?auto_16596 ) ( AVAILABLE ?auto_16593 ) ( SURFACE-AT ?auto_16589 ?auto_16596 ) ( ON ?auto_16589 ?auto_16594 ) ( CLEAR ?auto_16589 ) ( not ( = ?auto_16590 ?auto_16589 ) ) ( not ( = ?auto_16590 ?auto_16594 ) ) ( not ( = ?auto_16589 ?auto_16594 ) ) ( not ( = ?auto_16591 ?auto_16593 ) ) ( IS-CRATE ?auto_16590 ) ( not ( = ?auto_16604 ?auto_16592 ) ) ( HOIST-AT ?auto_16612 ?auto_16604 ) ( AVAILABLE ?auto_16612 ) ( SURFACE-AT ?auto_16590 ?auto_16604 ) ( ON ?auto_16590 ?auto_16613 ) ( CLEAR ?auto_16590 ) ( not ( = ?auto_16588 ?auto_16590 ) ) ( not ( = ?auto_16588 ?auto_16613 ) ) ( not ( = ?auto_16590 ?auto_16613 ) ) ( not ( = ?auto_16591 ?auto_16612 ) ) ( IS-CRATE ?auto_16588 ) ( not ( = ?auto_16614 ?auto_16592 ) ) ( HOIST-AT ?auto_16608 ?auto_16614 ) ( AVAILABLE ?auto_16608 ) ( SURFACE-AT ?auto_16588 ?auto_16614 ) ( ON ?auto_16588 ?auto_16600 ) ( CLEAR ?auto_16588 ) ( not ( = ?auto_16587 ?auto_16588 ) ) ( not ( = ?auto_16587 ?auto_16600 ) ) ( not ( = ?auto_16588 ?auto_16600 ) ) ( not ( = ?auto_16591 ?auto_16608 ) ) ( IS-CRATE ?auto_16587 ) ( not ( = ?auto_16597 ?auto_16592 ) ) ( HOIST-AT ?auto_16605 ?auto_16597 ) ( AVAILABLE ?auto_16605 ) ( SURFACE-AT ?auto_16587 ?auto_16597 ) ( ON ?auto_16587 ?auto_16599 ) ( CLEAR ?auto_16587 ) ( not ( = ?auto_16586 ?auto_16587 ) ) ( not ( = ?auto_16586 ?auto_16599 ) ) ( not ( = ?auto_16587 ?auto_16599 ) ) ( not ( = ?auto_16591 ?auto_16605 ) ) ( IS-CRATE ?auto_16586 ) ( not ( = ?auto_16601 ?auto_16592 ) ) ( HOIST-AT ?auto_16610 ?auto_16601 ) ( AVAILABLE ?auto_16610 ) ( SURFACE-AT ?auto_16586 ?auto_16601 ) ( ON ?auto_16586 ?auto_16598 ) ( CLEAR ?auto_16586 ) ( not ( = ?auto_16585 ?auto_16586 ) ) ( not ( = ?auto_16585 ?auto_16598 ) ) ( not ( = ?auto_16586 ?auto_16598 ) ) ( not ( = ?auto_16591 ?auto_16610 ) ) ( IS-CRATE ?auto_16585 ) ( not ( = ?auto_16607 ?auto_16592 ) ) ( HOIST-AT ?auto_16611 ?auto_16607 ) ( AVAILABLE ?auto_16611 ) ( SURFACE-AT ?auto_16585 ?auto_16607 ) ( ON ?auto_16585 ?auto_16602 ) ( CLEAR ?auto_16585 ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16602 ) ) ( not ( = ?auto_16585 ?auto_16602 ) ) ( not ( = ?auto_16591 ?auto_16611 ) ) ( SURFACE-AT ?auto_16583 ?auto_16592 ) ( CLEAR ?auto_16583 ) ( IS-CRATE ?auto_16584 ) ( AVAILABLE ?auto_16591 ) ( not ( = ?auto_16606 ?auto_16592 ) ) ( HOIST-AT ?auto_16603 ?auto_16606 ) ( AVAILABLE ?auto_16603 ) ( SURFACE-AT ?auto_16584 ?auto_16606 ) ( ON ?auto_16584 ?auto_16609 ) ( CLEAR ?auto_16584 ) ( TRUCK-AT ?auto_16595 ?auto_16592 ) ( not ( = ?auto_16583 ?auto_16584 ) ) ( not ( = ?auto_16583 ?auto_16609 ) ) ( not ( = ?auto_16584 ?auto_16609 ) ) ( not ( = ?auto_16591 ?auto_16603 ) ) ( not ( = ?auto_16583 ?auto_16585 ) ) ( not ( = ?auto_16583 ?auto_16602 ) ) ( not ( = ?auto_16585 ?auto_16609 ) ) ( not ( = ?auto_16607 ?auto_16606 ) ) ( not ( = ?auto_16611 ?auto_16603 ) ) ( not ( = ?auto_16602 ?auto_16609 ) ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( not ( = ?auto_16583 ?auto_16598 ) ) ( not ( = ?auto_16584 ?auto_16586 ) ) ( not ( = ?auto_16584 ?auto_16598 ) ) ( not ( = ?auto_16586 ?auto_16602 ) ) ( not ( = ?auto_16586 ?auto_16609 ) ) ( not ( = ?auto_16601 ?auto_16607 ) ) ( not ( = ?auto_16601 ?auto_16606 ) ) ( not ( = ?auto_16610 ?auto_16611 ) ) ( not ( = ?auto_16610 ?auto_16603 ) ) ( not ( = ?auto_16598 ?auto_16602 ) ) ( not ( = ?auto_16598 ?auto_16609 ) ) ( not ( = ?auto_16583 ?auto_16587 ) ) ( not ( = ?auto_16583 ?auto_16599 ) ) ( not ( = ?auto_16584 ?auto_16587 ) ) ( not ( = ?auto_16584 ?auto_16599 ) ) ( not ( = ?auto_16585 ?auto_16587 ) ) ( not ( = ?auto_16585 ?auto_16599 ) ) ( not ( = ?auto_16587 ?auto_16598 ) ) ( not ( = ?auto_16587 ?auto_16602 ) ) ( not ( = ?auto_16587 ?auto_16609 ) ) ( not ( = ?auto_16597 ?auto_16601 ) ) ( not ( = ?auto_16597 ?auto_16607 ) ) ( not ( = ?auto_16597 ?auto_16606 ) ) ( not ( = ?auto_16605 ?auto_16610 ) ) ( not ( = ?auto_16605 ?auto_16611 ) ) ( not ( = ?auto_16605 ?auto_16603 ) ) ( not ( = ?auto_16599 ?auto_16598 ) ) ( not ( = ?auto_16599 ?auto_16602 ) ) ( not ( = ?auto_16599 ?auto_16609 ) ) ( not ( = ?auto_16583 ?auto_16588 ) ) ( not ( = ?auto_16583 ?auto_16600 ) ) ( not ( = ?auto_16584 ?auto_16588 ) ) ( not ( = ?auto_16584 ?auto_16600 ) ) ( not ( = ?auto_16585 ?auto_16588 ) ) ( not ( = ?auto_16585 ?auto_16600 ) ) ( not ( = ?auto_16586 ?auto_16588 ) ) ( not ( = ?auto_16586 ?auto_16600 ) ) ( not ( = ?auto_16588 ?auto_16599 ) ) ( not ( = ?auto_16588 ?auto_16598 ) ) ( not ( = ?auto_16588 ?auto_16602 ) ) ( not ( = ?auto_16588 ?auto_16609 ) ) ( not ( = ?auto_16614 ?auto_16597 ) ) ( not ( = ?auto_16614 ?auto_16601 ) ) ( not ( = ?auto_16614 ?auto_16607 ) ) ( not ( = ?auto_16614 ?auto_16606 ) ) ( not ( = ?auto_16608 ?auto_16605 ) ) ( not ( = ?auto_16608 ?auto_16610 ) ) ( not ( = ?auto_16608 ?auto_16611 ) ) ( not ( = ?auto_16608 ?auto_16603 ) ) ( not ( = ?auto_16600 ?auto_16599 ) ) ( not ( = ?auto_16600 ?auto_16598 ) ) ( not ( = ?auto_16600 ?auto_16602 ) ) ( not ( = ?auto_16600 ?auto_16609 ) ) ( not ( = ?auto_16583 ?auto_16590 ) ) ( not ( = ?auto_16583 ?auto_16613 ) ) ( not ( = ?auto_16584 ?auto_16590 ) ) ( not ( = ?auto_16584 ?auto_16613 ) ) ( not ( = ?auto_16585 ?auto_16590 ) ) ( not ( = ?auto_16585 ?auto_16613 ) ) ( not ( = ?auto_16586 ?auto_16590 ) ) ( not ( = ?auto_16586 ?auto_16613 ) ) ( not ( = ?auto_16587 ?auto_16590 ) ) ( not ( = ?auto_16587 ?auto_16613 ) ) ( not ( = ?auto_16590 ?auto_16600 ) ) ( not ( = ?auto_16590 ?auto_16599 ) ) ( not ( = ?auto_16590 ?auto_16598 ) ) ( not ( = ?auto_16590 ?auto_16602 ) ) ( not ( = ?auto_16590 ?auto_16609 ) ) ( not ( = ?auto_16604 ?auto_16614 ) ) ( not ( = ?auto_16604 ?auto_16597 ) ) ( not ( = ?auto_16604 ?auto_16601 ) ) ( not ( = ?auto_16604 ?auto_16607 ) ) ( not ( = ?auto_16604 ?auto_16606 ) ) ( not ( = ?auto_16612 ?auto_16608 ) ) ( not ( = ?auto_16612 ?auto_16605 ) ) ( not ( = ?auto_16612 ?auto_16610 ) ) ( not ( = ?auto_16612 ?auto_16611 ) ) ( not ( = ?auto_16612 ?auto_16603 ) ) ( not ( = ?auto_16613 ?auto_16600 ) ) ( not ( = ?auto_16613 ?auto_16599 ) ) ( not ( = ?auto_16613 ?auto_16598 ) ) ( not ( = ?auto_16613 ?auto_16602 ) ) ( not ( = ?auto_16613 ?auto_16609 ) ) ( not ( = ?auto_16583 ?auto_16589 ) ) ( not ( = ?auto_16583 ?auto_16594 ) ) ( not ( = ?auto_16584 ?auto_16589 ) ) ( not ( = ?auto_16584 ?auto_16594 ) ) ( not ( = ?auto_16585 ?auto_16589 ) ) ( not ( = ?auto_16585 ?auto_16594 ) ) ( not ( = ?auto_16586 ?auto_16589 ) ) ( not ( = ?auto_16586 ?auto_16594 ) ) ( not ( = ?auto_16587 ?auto_16589 ) ) ( not ( = ?auto_16587 ?auto_16594 ) ) ( not ( = ?auto_16588 ?auto_16589 ) ) ( not ( = ?auto_16588 ?auto_16594 ) ) ( not ( = ?auto_16589 ?auto_16613 ) ) ( not ( = ?auto_16589 ?auto_16600 ) ) ( not ( = ?auto_16589 ?auto_16599 ) ) ( not ( = ?auto_16589 ?auto_16598 ) ) ( not ( = ?auto_16589 ?auto_16602 ) ) ( not ( = ?auto_16589 ?auto_16609 ) ) ( not ( = ?auto_16596 ?auto_16604 ) ) ( not ( = ?auto_16596 ?auto_16614 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16601 ) ) ( not ( = ?auto_16596 ?auto_16607 ) ) ( not ( = ?auto_16596 ?auto_16606 ) ) ( not ( = ?auto_16593 ?auto_16612 ) ) ( not ( = ?auto_16593 ?auto_16608 ) ) ( not ( = ?auto_16593 ?auto_16605 ) ) ( not ( = ?auto_16593 ?auto_16610 ) ) ( not ( = ?auto_16593 ?auto_16611 ) ) ( not ( = ?auto_16593 ?auto_16603 ) ) ( not ( = ?auto_16594 ?auto_16613 ) ) ( not ( = ?auto_16594 ?auto_16600 ) ) ( not ( = ?auto_16594 ?auto_16599 ) ) ( not ( = ?auto_16594 ?auto_16598 ) ) ( not ( = ?auto_16594 ?auto_16602 ) ) ( not ( = ?auto_16594 ?auto_16609 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16583 ?auto_16584 ?auto_16585 ?auto_16586 ?auto_16587 ?auto_16588 ?auto_16590 )
      ( MAKE-1CRATE ?auto_16590 ?auto_16589 )
      ( MAKE-7CRATE-VERIFY ?auto_16583 ?auto_16584 ?auto_16585 ?auto_16586 ?auto_16587 ?auto_16588 ?auto_16590 ?auto_16589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16617 - SURFACE
      ?auto_16618 - SURFACE
    )
    :vars
    (
      ?auto_16619 - HOIST
      ?auto_16620 - PLACE
      ?auto_16622 - PLACE
      ?auto_16623 - HOIST
      ?auto_16624 - SURFACE
      ?auto_16621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16619 ?auto_16620 ) ( SURFACE-AT ?auto_16617 ?auto_16620 ) ( CLEAR ?auto_16617 ) ( IS-CRATE ?auto_16618 ) ( AVAILABLE ?auto_16619 ) ( not ( = ?auto_16622 ?auto_16620 ) ) ( HOIST-AT ?auto_16623 ?auto_16622 ) ( AVAILABLE ?auto_16623 ) ( SURFACE-AT ?auto_16618 ?auto_16622 ) ( ON ?auto_16618 ?auto_16624 ) ( CLEAR ?auto_16618 ) ( TRUCK-AT ?auto_16621 ?auto_16620 ) ( not ( = ?auto_16617 ?auto_16618 ) ) ( not ( = ?auto_16617 ?auto_16624 ) ) ( not ( = ?auto_16618 ?auto_16624 ) ) ( not ( = ?auto_16619 ?auto_16623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16621 ?auto_16620 ?auto_16622 )
      ( !LIFT ?auto_16623 ?auto_16618 ?auto_16624 ?auto_16622 )
      ( !LOAD ?auto_16623 ?auto_16618 ?auto_16621 ?auto_16622 )
      ( !DRIVE ?auto_16621 ?auto_16622 ?auto_16620 )
      ( !UNLOAD ?auto_16619 ?auto_16618 ?auto_16621 ?auto_16620 )
      ( !DROP ?auto_16619 ?auto_16618 ?auto_16617 ?auto_16620 )
      ( MAKE-1CRATE-VERIFY ?auto_16617 ?auto_16618 ) )
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
      ?auto_16642 - SURFACE
      ?auto_16641 - SURFACE
      ?auto_16640 - SURFACE
    )
    :vars
    (
      ?auto_16647 - HOIST
      ?auto_16646 - PLACE
      ?auto_16643 - PLACE
      ?auto_16644 - HOIST
      ?auto_16645 - SURFACE
      ?auto_16661 - PLACE
      ?auto_16660 - HOIST
      ?auto_16651 - SURFACE
      ?auto_16656 - PLACE
      ?auto_16668 - HOIST
      ?auto_16666 - SURFACE
      ?auto_16665 - PLACE
      ?auto_16653 - HOIST
      ?auto_16662 - SURFACE
      ?auto_16667 - PLACE
      ?auto_16669 - HOIST
      ?auto_16663 - SURFACE
      ?auto_16659 - PLACE
      ?auto_16655 - HOIST
      ?auto_16652 - SURFACE
      ?auto_16649 - PLACE
      ?auto_16664 - HOIST
      ?auto_16658 - SURFACE
      ?auto_16650 - PLACE
      ?auto_16657 - HOIST
      ?auto_16654 - SURFACE
      ?auto_16648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16647 ?auto_16646 ) ( IS-CRATE ?auto_16640 ) ( not ( = ?auto_16643 ?auto_16646 ) ) ( HOIST-AT ?auto_16644 ?auto_16643 ) ( AVAILABLE ?auto_16644 ) ( SURFACE-AT ?auto_16640 ?auto_16643 ) ( ON ?auto_16640 ?auto_16645 ) ( CLEAR ?auto_16640 ) ( not ( = ?auto_16641 ?auto_16640 ) ) ( not ( = ?auto_16641 ?auto_16645 ) ) ( not ( = ?auto_16640 ?auto_16645 ) ) ( not ( = ?auto_16647 ?auto_16644 ) ) ( IS-CRATE ?auto_16641 ) ( not ( = ?auto_16661 ?auto_16646 ) ) ( HOIST-AT ?auto_16660 ?auto_16661 ) ( AVAILABLE ?auto_16660 ) ( SURFACE-AT ?auto_16641 ?auto_16661 ) ( ON ?auto_16641 ?auto_16651 ) ( CLEAR ?auto_16641 ) ( not ( = ?auto_16642 ?auto_16641 ) ) ( not ( = ?auto_16642 ?auto_16651 ) ) ( not ( = ?auto_16641 ?auto_16651 ) ) ( not ( = ?auto_16647 ?auto_16660 ) ) ( IS-CRATE ?auto_16642 ) ( not ( = ?auto_16656 ?auto_16646 ) ) ( HOIST-AT ?auto_16668 ?auto_16656 ) ( AVAILABLE ?auto_16668 ) ( SURFACE-AT ?auto_16642 ?auto_16656 ) ( ON ?auto_16642 ?auto_16666 ) ( CLEAR ?auto_16642 ) ( not ( = ?auto_16639 ?auto_16642 ) ) ( not ( = ?auto_16639 ?auto_16666 ) ) ( not ( = ?auto_16642 ?auto_16666 ) ) ( not ( = ?auto_16647 ?auto_16668 ) ) ( IS-CRATE ?auto_16639 ) ( not ( = ?auto_16665 ?auto_16646 ) ) ( HOIST-AT ?auto_16653 ?auto_16665 ) ( AVAILABLE ?auto_16653 ) ( SURFACE-AT ?auto_16639 ?auto_16665 ) ( ON ?auto_16639 ?auto_16662 ) ( CLEAR ?auto_16639 ) ( not ( = ?auto_16638 ?auto_16639 ) ) ( not ( = ?auto_16638 ?auto_16662 ) ) ( not ( = ?auto_16639 ?auto_16662 ) ) ( not ( = ?auto_16647 ?auto_16653 ) ) ( IS-CRATE ?auto_16638 ) ( not ( = ?auto_16667 ?auto_16646 ) ) ( HOIST-AT ?auto_16669 ?auto_16667 ) ( AVAILABLE ?auto_16669 ) ( SURFACE-AT ?auto_16638 ?auto_16667 ) ( ON ?auto_16638 ?auto_16663 ) ( CLEAR ?auto_16638 ) ( not ( = ?auto_16637 ?auto_16638 ) ) ( not ( = ?auto_16637 ?auto_16663 ) ) ( not ( = ?auto_16638 ?auto_16663 ) ) ( not ( = ?auto_16647 ?auto_16669 ) ) ( IS-CRATE ?auto_16637 ) ( not ( = ?auto_16659 ?auto_16646 ) ) ( HOIST-AT ?auto_16655 ?auto_16659 ) ( AVAILABLE ?auto_16655 ) ( SURFACE-AT ?auto_16637 ?auto_16659 ) ( ON ?auto_16637 ?auto_16652 ) ( CLEAR ?auto_16637 ) ( not ( = ?auto_16636 ?auto_16637 ) ) ( not ( = ?auto_16636 ?auto_16652 ) ) ( not ( = ?auto_16637 ?auto_16652 ) ) ( not ( = ?auto_16647 ?auto_16655 ) ) ( IS-CRATE ?auto_16636 ) ( not ( = ?auto_16649 ?auto_16646 ) ) ( HOIST-AT ?auto_16664 ?auto_16649 ) ( AVAILABLE ?auto_16664 ) ( SURFACE-AT ?auto_16636 ?auto_16649 ) ( ON ?auto_16636 ?auto_16658 ) ( CLEAR ?auto_16636 ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( not ( = ?auto_16635 ?auto_16658 ) ) ( not ( = ?auto_16636 ?auto_16658 ) ) ( not ( = ?auto_16647 ?auto_16664 ) ) ( SURFACE-AT ?auto_16634 ?auto_16646 ) ( CLEAR ?auto_16634 ) ( IS-CRATE ?auto_16635 ) ( AVAILABLE ?auto_16647 ) ( not ( = ?auto_16650 ?auto_16646 ) ) ( HOIST-AT ?auto_16657 ?auto_16650 ) ( AVAILABLE ?auto_16657 ) ( SURFACE-AT ?auto_16635 ?auto_16650 ) ( ON ?auto_16635 ?auto_16654 ) ( CLEAR ?auto_16635 ) ( TRUCK-AT ?auto_16648 ?auto_16646 ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( not ( = ?auto_16634 ?auto_16654 ) ) ( not ( = ?auto_16635 ?auto_16654 ) ) ( not ( = ?auto_16647 ?auto_16657 ) ) ( not ( = ?auto_16634 ?auto_16636 ) ) ( not ( = ?auto_16634 ?auto_16658 ) ) ( not ( = ?auto_16636 ?auto_16654 ) ) ( not ( = ?auto_16649 ?auto_16650 ) ) ( not ( = ?auto_16664 ?auto_16657 ) ) ( not ( = ?auto_16658 ?auto_16654 ) ) ( not ( = ?auto_16634 ?auto_16637 ) ) ( not ( = ?auto_16634 ?auto_16652 ) ) ( not ( = ?auto_16635 ?auto_16637 ) ) ( not ( = ?auto_16635 ?auto_16652 ) ) ( not ( = ?auto_16637 ?auto_16658 ) ) ( not ( = ?auto_16637 ?auto_16654 ) ) ( not ( = ?auto_16659 ?auto_16649 ) ) ( not ( = ?auto_16659 ?auto_16650 ) ) ( not ( = ?auto_16655 ?auto_16664 ) ) ( not ( = ?auto_16655 ?auto_16657 ) ) ( not ( = ?auto_16652 ?auto_16658 ) ) ( not ( = ?auto_16652 ?auto_16654 ) ) ( not ( = ?auto_16634 ?auto_16638 ) ) ( not ( = ?auto_16634 ?auto_16663 ) ) ( not ( = ?auto_16635 ?auto_16638 ) ) ( not ( = ?auto_16635 ?auto_16663 ) ) ( not ( = ?auto_16636 ?auto_16638 ) ) ( not ( = ?auto_16636 ?auto_16663 ) ) ( not ( = ?auto_16638 ?auto_16652 ) ) ( not ( = ?auto_16638 ?auto_16658 ) ) ( not ( = ?auto_16638 ?auto_16654 ) ) ( not ( = ?auto_16667 ?auto_16659 ) ) ( not ( = ?auto_16667 ?auto_16649 ) ) ( not ( = ?auto_16667 ?auto_16650 ) ) ( not ( = ?auto_16669 ?auto_16655 ) ) ( not ( = ?auto_16669 ?auto_16664 ) ) ( not ( = ?auto_16669 ?auto_16657 ) ) ( not ( = ?auto_16663 ?auto_16652 ) ) ( not ( = ?auto_16663 ?auto_16658 ) ) ( not ( = ?auto_16663 ?auto_16654 ) ) ( not ( = ?auto_16634 ?auto_16639 ) ) ( not ( = ?auto_16634 ?auto_16662 ) ) ( not ( = ?auto_16635 ?auto_16639 ) ) ( not ( = ?auto_16635 ?auto_16662 ) ) ( not ( = ?auto_16636 ?auto_16639 ) ) ( not ( = ?auto_16636 ?auto_16662 ) ) ( not ( = ?auto_16637 ?auto_16639 ) ) ( not ( = ?auto_16637 ?auto_16662 ) ) ( not ( = ?auto_16639 ?auto_16663 ) ) ( not ( = ?auto_16639 ?auto_16652 ) ) ( not ( = ?auto_16639 ?auto_16658 ) ) ( not ( = ?auto_16639 ?auto_16654 ) ) ( not ( = ?auto_16665 ?auto_16667 ) ) ( not ( = ?auto_16665 ?auto_16659 ) ) ( not ( = ?auto_16665 ?auto_16649 ) ) ( not ( = ?auto_16665 ?auto_16650 ) ) ( not ( = ?auto_16653 ?auto_16669 ) ) ( not ( = ?auto_16653 ?auto_16655 ) ) ( not ( = ?auto_16653 ?auto_16664 ) ) ( not ( = ?auto_16653 ?auto_16657 ) ) ( not ( = ?auto_16662 ?auto_16663 ) ) ( not ( = ?auto_16662 ?auto_16652 ) ) ( not ( = ?auto_16662 ?auto_16658 ) ) ( not ( = ?auto_16662 ?auto_16654 ) ) ( not ( = ?auto_16634 ?auto_16642 ) ) ( not ( = ?auto_16634 ?auto_16666 ) ) ( not ( = ?auto_16635 ?auto_16642 ) ) ( not ( = ?auto_16635 ?auto_16666 ) ) ( not ( = ?auto_16636 ?auto_16642 ) ) ( not ( = ?auto_16636 ?auto_16666 ) ) ( not ( = ?auto_16637 ?auto_16642 ) ) ( not ( = ?auto_16637 ?auto_16666 ) ) ( not ( = ?auto_16638 ?auto_16642 ) ) ( not ( = ?auto_16638 ?auto_16666 ) ) ( not ( = ?auto_16642 ?auto_16662 ) ) ( not ( = ?auto_16642 ?auto_16663 ) ) ( not ( = ?auto_16642 ?auto_16652 ) ) ( not ( = ?auto_16642 ?auto_16658 ) ) ( not ( = ?auto_16642 ?auto_16654 ) ) ( not ( = ?auto_16656 ?auto_16665 ) ) ( not ( = ?auto_16656 ?auto_16667 ) ) ( not ( = ?auto_16656 ?auto_16659 ) ) ( not ( = ?auto_16656 ?auto_16649 ) ) ( not ( = ?auto_16656 ?auto_16650 ) ) ( not ( = ?auto_16668 ?auto_16653 ) ) ( not ( = ?auto_16668 ?auto_16669 ) ) ( not ( = ?auto_16668 ?auto_16655 ) ) ( not ( = ?auto_16668 ?auto_16664 ) ) ( not ( = ?auto_16668 ?auto_16657 ) ) ( not ( = ?auto_16666 ?auto_16662 ) ) ( not ( = ?auto_16666 ?auto_16663 ) ) ( not ( = ?auto_16666 ?auto_16652 ) ) ( not ( = ?auto_16666 ?auto_16658 ) ) ( not ( = ?auto_16666 ?auto_16654 ) ) ( not ( = ?auto_16634 ?auto_16641 ) ) ( not ( = ?auto_16634 ?auto_16651 ) ) ( not ( = ?auto_16635 ?auto_16641 ) ) ( not ( = ?auto_16635 ?auto_16651 ) ) ( not ( = ?auto_16636 ?auto_16641 ) ) ( not ( = ?auto_16636 ?auto_16651 ) ) ( not ( = ?auto_16637 ?auto_16641 ) ) ( not ( = ?auto_16637 ?auto_16651 ) ) ( not ( = ?auto_16638 ?auto_16641 ) ) ( not ( = ?auto_16638 ?auto_16651 ) ) ( not ( = ?auto_16639 ?auto_16641 ) ) ( not ( = ?auto_16639 ?auto_16651 ) ) ( not ( = ?auto_16641 ?auto_16666 ) ) ( not ( = ?auto_16641 ?auto_16662 ) ) ( not ( = ?auto_16641 ?auto_16663 ) ) ( not ( = ?auto_16641 ?auto_16652 ) ) ( not ( = ?auto_16641 ?auto_16658 ) ) ( not ( = ?auto_16641 ?auto_16654 ) ) ( not ( = ?auto_16661 ?auto_16656 ) ) ( not ( = ?auto_16661 ?auto_16665 ) ) ( not ( = ?auto_16661 ?auto_16667 ) ) ( not ( = ?auto_16661 ?auto_16659 ) ) ( not ( = ?auto_16661 ?auto_16649 ) ) ( not ( = ?auto_16661 ?auto_16650 ) ) ( not ( = ?auto_16660 ?auto_16668 ) ) ( not ( = ?auto_16660 ?auto_16653 ) ) ( not ( = ?auto_16660 ?auto_16669 ) ) ( not ( = ?auto_16660 ?auto_16655 ) ) ( not ( = ?auto_16660 ?auto_16664 ) ) ( not ( = ?auto_16660 ?auto_16657 ) ) ( not ( = ?auto_16651 ?auto_16666 ) ) ( not ( = ?auto_16651 ?auto_16662 ) ) ( not ( = ?auto_16651 ?auto_16663 ) ) ( not ( = ?auto_16651 ?auto_16652 ) ) ( not ( = ?auto_16651 ?auto_16658 ) ) ( not ( = ?auto_16651 ?auto_16654 ) ) ( not ( = ?auto_16634 ?auto_16640 ) ) ( not ( = ?auto_16634 ?auto_16645 ) ) ( not ( = ?auto_16635 ?auto_16640 ) ) ( not ( = ?auto_16635 ?auto_16645 ) ) ( not ( = ?auto_16636 ?auto_16640 ) ) ( not ( = ?auto_16636 ?auto_16645 ) ) ( not ( = ?auto_16637 ?auto_16640 ) ) ( not ( = ?auto_16637 ?auto_16645 ) ) ( not ( = ?auto_16638 ?auto_16640 ) ) ( not ( = ?auto_16638 ?auto_16645 ) ) ( not ( = ?auto_16639 ?auto_16640 ) ) ( not ( = ?auto_16639 ?auto_16645 ) ) ( not ( = ?auto_16642 ?auto_16640 ) ) ( not ( = ?auto_16642 ?auto_16645 ) ) ( not ( = ?auto_16640 ?auto_16651 ) ) ( not ( = ?auto_16640 ?auto_16666 ) ) ( not ( = ?auto_16640 ?auto_16662 ) ) ( not ( = ?auto_16640 ?auto_16663 ) ) ( not ( = ?auto_16640 ?auto_16652 ) ) ( not ( = ?auto_16640 ?auto_16658 ) ) ( not ( = ?auto_16640 ?auto_16654 ) ) ( not ( = ?auto_16643 ?auto_16661 ) ) ( not ( = ?auto_16643 ?auto_16656 ) ) ( not ( = ?auto_16643 ?auto_16665 ) ) ( not ( = ?auto_16643 ?auto_16667 ) ) ( not ( = ?auto_16643 ?auto_16659 ) ) ( not ( = ?auto_16643 ?auto_16649 ) ) ( not ( = ?auto_16643 ?auto_16650 ) ) ( not ( = ?auto_16644 ?auto_16660 ) ) ( not ( = ?auto_16644 ?auto_16668 ) ) ( not ( = ?auto_16644 ?auto_16653 ) ) ( not ( = ?auto_16644 ?auto_16669 ) ) ( not ( = ?auto_16644 ?auto_16655 ) ) ( not ( = ?auto_16644 ?auto_16664 ) ) ( not ( = ?auto_16644 ?auto_16657 ) ) ( not ( = ?auto_16645 ?auto_16651 ) ) ( not ( = ?auto_16645 ?auto_16666 ) ) ( not ( = ?auto_16645 ?auto_16662 ) ) ( not ( = ?auto_16645 ?auto_16663 ) ) ( not ( = ?auto_16645 ?auto_16652 ) ) ( not ( = ?auto_16645 ?auto_16658 ) ) ( not ( = ?auto_16645 ?auto_16654 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16634 ?auto_16635 ?auto_16636 ?auto_16637 ?auto_16638 ?auto_16639 ?auto_16642 ?auto_16641 )
      ( MAKE-1CRATE ?auto_16641 ?auto_16640 )
      ( MAKE-8CRATE-VERIFY ?auto_16634 ?auto_16635 ?auto_16636 ?auto_16637 ?auto_16638 ?auto_16639 ?auto_16642 ?auto_16641 ?auto_16640 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16672 - SURFACE
      ?auto_16673 - SURFACE
    )
    :vars
    (
      ?auto_16674 - HOIST
      ?auto_16675 - PLACE
      ?auto_16677 - PLACE
      ?auto_16678 - HOIST
      ?auto_16679 - SURFACE
      ?auto_16676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16674 ?auto_16675 ) ( SURFACE-AT ?auto_16672 ?auto_16675 ) ( CLEAR ?auto_16672 ) ( IS-CRATE ?auto_16673 ) ( AVAILABLE ?auto_16674 ) ( not ( = ?auto_16677 ?auto_16675 ) ) ( HOIST-AT ?auto_16678 ?auto_16677 ) ( AVAILABLE ?auto_16678 ) ( SURFACE-AT ?auto_16673 ?auto_16677 ) ( ON ?auto_16673 ?auto_16679 ) ( CLEAR ?auto_16673 ) ( TRUCK-AT ?auto_16676 ?auto_16675 ) ( not ( = ?auto_16672 ?auto_16673 ) ) ( not ( = ?auto_16672 ?auto_16679 ) ) ( not ( = ?auto_16673 ?auto_16679 ) ) ( not ( = ?auto_16674 ?auto_16678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16676 ?auto_16675 ?auto_16677 )
      ( !LIFT ?auto_16678 ?auto_16673 ?auto_16679 ?auto_16677 )
      ( !LOAD ?auto_16678 ?auto_16673 ?auto_16676 ?auto_16677 )
      ( !DRIVE ?auto_16676 ?auto_16677 ?auto_16675 )
      ( !UNLOAD ?auto_16674 ?auto_16673 ?auto_16676 ?auto_16675 )
      ( !DROP ?auto_16674 ?auto_16673 ?auto_16672 ?auto_16675 )
      ( MAKE-1CRATE-VERIFY ?auto_16672 ?auto_16673 ) )
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
      ?auto_16698 - SURFACE
      ?auto_16697 - SURFACE
      ?auto_16696 - SURFACE
      ?auto_16699 - SURFACE
    )
    :vars
    (
      ?auto_16701 - HOIST
      ?auto_16705 - PLACE
      ?auto_16700 - PLACE
      ?auto_16702 - HOIST
      ?auto_16703 - SURFACE
      ?auto_16721 - PLACE
      ?auto_16723 - HOIST
      ?auto_16722 - SURFACE
      ?auto_16715 - PLACE
      ?auto_16714 - HOIST
      ?auto_16724 - SURFACE
      ?auto_16717 - PLACE
      ?auto_16709 - HOIST
      ?auto_16728 - SURFACE
      ?auto_16706 - PLACE
      ?auto_16720 - HOIST
      ?auto_16716 - SURFACE
      ?auto_16707 - PLACE
      ?auto_16708 - HOIST
      ?auto_16725 - SURFACE
      ?auto_16712 - PLACE
      ?auto_16718 - HOIST
      ?auto_16727 - SURFACE
      ?auto_16729 - PLACE
      ?auto_16710 - HOIST
      ?auto_16713 - SURFACE
      ?auto_16726 - PLACE
      ?auto_16711 - HOIST
      ?auto_16719 - SURFACE
      ?auto_16704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16701 ?auto_16705 ) ( IS-CRATE ?auto_16699 ) ( not ( = ?auto_16700 ?auto_16705 ) ) ( HOIST-AT ?auto_16702 ?auto_16700 ) ( AVAILABLE ?auto_16702 ) ( SURFACE-AT ?auto_16699 ?auto_16700 ) ( ON ?auto_16699 ?auto_16703 ) ( CLEAR ?auto_16699 ) ( not ( = ?auto_16696 ?auto_16699 ) ) ( not ( = ?auto_16696 ?auto_16703 ) ) ( not ( = ?auto_16699 ?auto_16703 ) ) ( not ( = ?auto_16701 ?auto_16702 ) ) ( IS-CRATE ?auto_16696 ) ( not ( = ?auto_16721 ?auto_16705 ) ) ( HOIST-AT ?auto_16723 ?auto_16721 ) ( AVAILABLE ?auto_16723 ) ( SURFACE-AT ?auto_16696 ?auto_16721 ) ( ON ?auto_16696 ?auto_16722 ) ( CLEAR ?auto_16696 ) ( not ( = ?auto_16697 ?auto_16696 ) ) ( not ( = ?auto_16697 ?auto_16722 ) ) ( not ( = ?auto_16696 ?auto_16722 ) ) ( not ( = ?auto_16701 ?auto_16723 ) ) ( IS-CRATE ?auto_16697 ) ( not ( = ?auto_16715 ?auto_16705 ) ) ( HOIST-AT ?auto_16714 ?auto_16715 ) ( AVAILABLE ?auto_16714 ) ( SURFACE-AT ?auto_16697 ?auto_16715 ) ( ON ?auto_16697 ?auto_16724 ) ( CLEAR ?auto_16697 ) ( not ( = ?auto_16698 ?auto_16697 ) ) ( not ( = ?auto_16698 ?auto_16724 ) ) ( not ( = ?auto_16697 ?auto_16724 ) ) ( not ( = ?auto_16701 ?auto_16714 ) ) ( IS-CRATE ?auto_16698 ) ( not ( = ?auto_16717 ?auto_16705 ) ) ( HOIST-AT ?auto_16709 ?auto_16717 ) ( AVAILABLE ?auto_16709 ) ( SURFACE-AT ?auto_16698 ?auto_16717 ) ( ON ?auto_16698 ?auto_16728 ) ( CLEAR ?auto_16698 ) ( not ( = ?auto_16695 ?auto_16698 ) ) ( not ( = ?auto_16695 ?auto_16728 ) ) ( not ( = ?auto_16698 ?auto_16728 ) ) ( not ( = ?auto_16701 ?auto_16709 ) ) ( IS-CRATE ?auto_16695 ) ( not ( = ?auto_16706 ?auto_16705 ) ) ( HOIST-AT ?auto_16720 ?auto_16706 ) ( AVAILABLE ?auto_16720 ) ( SURFACE-AT ?auto_16695 ?auto_16706 ) ( ON ?auto_16695 ?auto_16716 ) ( CLEAR ?auto_16695 ) ( not ( = ?auto_16694 ?auto_16695 ) ) ( not ( = ?auto_16694 ?auto_16716 ) ) ( not ( = ?auto_16695 ?auto_16716 ) ) ( not ( = ?auto_16701 ?auto_16720 ) ) ( IS-CRATE ?auto_16694 ) ( not ( = ?auto_16707 ?auto_16705 ) ) ( HOIST-AT ?auto_16708 ?auto_16707 ) ( AVAILABLE ?auto_16708 ) ( SURFACE-AT ?auto_16694 ?auto_16707 ) ( ON ?auto_16694 ?auto_16725 ) ( CLEAR ?auto_16694 ) ( not ( = ?auto_16693 ?auto_16694 ) ) ( not ( = ?auto_16693 ?auto_16725 ) ) ( not ( = ?auto_16694 ?auto_16725 ) ) ( not ( = ?auto_16701 ?auto_16708 ) ) ( IS-CRATE ?auto_16693 ) ( not ( = ?auto_16712 ?auto_16705 ) ) ( HOIST-AT ?auto_16718 ?auto_16712 ) ( AVAILABLE ?auto_16718 ) ( SURFACE-AT ?auto_16693 ?auto_16712 ) ( ON ?auto_16693 ?auto_16727 ) ( CLEAR ?auto_16693 ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( not ( = ?auto_16692 ?auto_16727 ) ) ( not ( = ?auto_16693 ?auto_16727 ) ) ( not ( = ?auto_16701 ?auto_16718 ) ) ( IS-CRATE ?auto_16692 ) ( not ( = ?auto_16729 ?auto_16705 ) ) ( HOIST-AT ?auto_16710 ?auto_16729 ) ( AVAILABLE ?auto_16710 ) ( SURFACE-AT ?auto_16692 ?auto_16729 ) ( ON ?auto_16692 ?auto_16713 ) ( CLEAR ?auto_16692 ) ( not ( = ?auto_16691 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16713 ) ) ( not ( = ?auto_16692 ?auto_16713 ) ) ( not ( = ?auto_16701 ?auto_16710 ) ) ( SURFACE-AT ?auto_16690 ?auto_16705 ) ( CLEAR ?auto_16690 ) ( IS-CRATE ?auto_16691 ) ( AVAILABLE ?auto_16701 ) ( not ( = ?auto_16726 ?auto_16705 ) ) ( HOIST-AT ?auto_16711 ?auto_16726 ) ( AVAILABLE ?auto_16711 ) ( SURFACE-AT ?auto_16691 ?auto_16726 ) ( ON ?auto_16691 ?auto_16719 ) ( CLEAR ?auto_16691 ) ( TRUCK-AT ?auto_16704 ?auto_16705 ) ( not ( = ?auto_16690 ?auto_16691 ) ) ( not ( = ?auto_16690 ?auto_16719 ) ) ( not ( = ?auto_16691 ?auto_16719 ) ) ( not ( = ?auto_16701 ?auto_16711 ) ) ( not ( = ?auto_16690 ?auto_16692 ) ) ( not ( = ?auto_16690 ?auto_16713 ) ) ( not ( = ?auto_16692 ?auto_16719 ) ) ( not ( = ?auto_16729 ?auto_16726 ) ) ( not ( = ?auto_16710 ?auto_16711 ) ) ( not ( = ?auto_16713 ?auto_16719 ) ) ( not ( = ?auto_16690 ?auto_16693 ) ) ( not ( = ?auto_16690 ?auto_16727 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16691 ?auto_16727 ) ) ( not ( = ?auto_16693 ?auto_16713 ) ) ( not ( = ?auto_16693 ?auto_16719 ) ) ( not ( = ?auto_16712 ?auto_16729 ) ) ( not ( = ?auto_16712 ?auto_16726 ) ) ( not ( = ?auto_16718 ?auto_16710 ) ) ( not ( = ?auto_16718 ?auto_16711 ) ) ( not ( = ?auto_16727 ?auto_16713 ) ) ( not ( = ?auto_16727 ?auto_16719 ) ) ( not ( = ?auto_16690 ?auto_16694 ) ) ( not ( = ?auto_16690 ?auto_16725 ) ) ( not ( = ?auto_16691 ?auto_16694 ) ) ( not ( = ?auto_16691 ?auto_16725 ) ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16725 ) ) ( not ( = ?auto_16694 ?auto_16727 ) ) ( not ( = ?auto_16694 ?auto_16713 ) ) ( not ( = ?auto_16694 ?auto_16719 ) ) ( not ( = ?auto_16707 ?auto_16712 ) ) ( not ( = ?auto_16707 ?auto_16729 ) ) ( not ( = ?auto_16707 ?auto_16726 ) ) ( not ( = ?auto_16708 ?auto_16718 ) ) ( not ( = ?auto_16708 ?auto_16710 ) ) ( not ( = ?auto_16708 ?auto_16711 ) ) ( not ( = ?auto_16725 ?auto_16727 ) ) ( not ( = ?auto_16725 ?auto_16713 ) ) ( not ( = ?auto_16725 ?auto_16719 ) ) ( not ( = ?auto_16690 ?auto_16695 ) ) ( not ( = ?auto_16690 ?auto_16716 ) ) ( not ( = ?auto_16691 ?auto_16695 ) ) ( not ( = ?auto_16691 ?auto_16716 ) ) ( not ( = ?auto_16692 ?auto_16695 ) ) ( not ( = ?auto_16692 ?auto_16716 ) ) ( not ( = ?auto_16693 ?auto_16695 ) ) ( not ( = ?auto_16693 ?auto_16716 ) ) ( not ( = ?auto_16695 ?auto_16725 ) ) ( not ( = ?auto_16695 ?auto_16727 ) ) ( not ( = ?auto_16695 ?auto_16713 ) ) ( not ( = ?auto_16695 ?auto_16719 ) ) ( not ( = ?auto_16706 ?auto_16707 ) ) ( not ( = ?auto_16706 ?auto_16712 ) ) ( not ( = ?auto_16706 ?auto_16729 ) ) ( not ( = ?auto_16706 ?auto_16726 ) ) ( not ( = ?auto_16720 ?auto_16708 ) ) ( not ( = ?auto_16720 ?auto_16718 ) ) ( not ( = ?auto_16720 ?auto_16710 ) ) ( not ( = ?auto_16720 ?auto_16711 ) ) ( not ( = ?auto_16716 ?auto_16725 ) ) ( not ( = ?auto_16716 ?auto_16727 ) ) ( not ( = ?auto_16716 ?auto_16713 ) ) ( not ( = ?auto_16716 ?auto_16719 ) ) ( not ( = ?auto_16690 ?auto_16698 ) ) ( not ( = ?auto_16690 ?auto_16728 ) ) ( not ( = ?auto_16691 ?auto_16698 ) ) ( not ( = ?auto_16691 ?auto_16728 ) ) ( not ( = ?auto_16692 ?auto_16698 ) ) ( not ( = ?auto_16692 ?auto_16728 ) ) ( not ( = ?auto_16693 ?auto_16698 ) ) ( not ( = ?auto_16693 ?auto_16728 ) ) ( not ( = ?auto_16694 ?auto_16698 ) ) ( not ( = ?auto_16694 ?auto_16728 ) ) ( not ( = ?auto_16698 ?auto_16716 ) ) ( not ( = ?auto_16698 ?auto_16725 ) ) ( not ( = ?auto_16698 ?auto_16727 ) ) ( not ( = ?auto_16698 ?auto_16713 ) ) ( not ( = ?auto_16698 ?auto_16719 ) ) ( not ( = ?auto_16717 ?auto_16706 ) ) ( not ( = ?auto_16717 ?auto_16707 ) ) ( not ( = ?auto_16717 ?auto_16712 ) ) ( not ( = ?auto_16717 ?auto_16729 ) ) ( not ( = ?auto_16717 ?auto_16726 ) ) ( not ( = ?auto_16709 ?auto_16720 ) ) ( not ( = ?auto_16709 ?auto_16708 ) ) ( not ( = ?auto_16709 ?auto_16718 ) ) ( not ( = ?auto_16709 ?auto_16710 ) ) ( not ( = ?auto_16709 ?auto_16711 ) ) ( not ( = ?auto_16728 ?auto_16716 ) ) ( not ( = ?auto_16728 ?auto_16725 ) ) ( not ( = ?auto_16728 ?auto_16727 ) ) ( not ( = ?auto_16728 ?auto_16713 ) ) ( not ( = ?auto_16728 ?auto_16719 ) ) ( not ( = ?auto_16690 ?auto_16697 ) ) ( not ( = ?auto_16690 ?auto_16724 ) ) ( not ( = ?auto_16691 ?auto_16697 ) ) ( not ( = ?auto_16691 ?auto_16724 ) ) ( not ( = ?auto_16692 ?auto_16697 ) ) ( not ( = ?auto_16692 ?auto_16724 ) ) ( not ( = ?auto_16693 ?auto_16697 ) ) ( not ( = ?auto_16693 ?auto_16724 ) ) ( not ( = ?auto_16694 ?auto_16697 ) ) ( not ( = ?auto_16694 ?auto_16724 ) ) ( not ( = ?auto_16695 ?auto_16697 ) ) ( not ( = ?auto_16695 ?auto_16724 ) ) ( not ( = ?auto_16697 ?auto_16728 ) ) ( not ( = ?auto_16697 ?auto_16716 ) ) ( not ( = ?auto_16697 ?auto_16725 ) ) ( not ( = ?auto_16697 ?auto_16727 ) ) ( not ( = ?auto_16697 ?auto_16713 ) ) ( not ( = ?auto_16697 ?auto_16719 ) ) ( not ( = ?auto_16715 ?auto_16717 ) ) ( not ( = ?auto_16715 ?auto_16706 ) ) ( not ( = ?auto_16715 ?auto_16707 ) ) ( not ( = ?auto_16715 ?auto_16712 ) ) ( not ( = ?auto_16715 ?auto_16729 ) ) ( not ( = ?auto_16715 ?auto_16726 ) ) ( not ( = ?auto_16714 ?auto_16709 ) ) ( not ( = ?auto_16714 ?auto_16720 ) ) ( not ( = ?auto_16714 ?auto_16708 ) ) ( not ( = ?auto_16714 ?auto_16718 ) ) ( not ( = ?auto_16714 ?auto_16710 ) ) ( not ( = ?auto_16714 ?auto_16711 ) ) ( not ( = ?auto_16724 ?auto_16728 ) ) ( not ( = ?auto_16724 ?auto_16716 ) ) ( not ( = ?auto_16724 ?auto_16725 ) ) ( not ( = ?auto_16724 ?auto_16727 ) ) ( not ( = ?auto_16724 ?auto_16713 ) ) ( not ( = ?auto_16724 ?auto_16719 ) ) ( not ( = ?auto_16690 ?auto_16696 ) ) ( not ( = ?auto_16690 ?auto_16722 ) ) ( not ( = ?auto_16691 ?auto_16696 ) ) ( not ( = ?auto_16691 ?auto_16722 ) ) ( not ( = ?auto_16692 ?auto_16696 ) ) ( not ( = ?auto_16692 ?auto_16722 ) ) ( not ( = ?auto_16693 ?auto_16696 ) ) ( not ( = ?auto_16693 ?auto_16722 ) ) ( not ( = ?auto_16694 ?auto_16696 ) ) ( not ( = ?auto_16694 ?auto_16722 ) ) ( not ( = ?auto_16695 ?auto_16696 ) ) ( not ( = ?auto_16695 ?auto_16722 ) ) ( not ( = ?auto_16698 ?auto_16696 ) ) ( not ( = ?auto_16698 ?auto_16722 ) ) ( not ( = ?auto_16696 ?auto_16724 ) ) ( not ( = ?auto_16696 ?auto_16728 ) ) ( not ( = ?auto_16696 ?auto_16716 ) ) ( not ( = ?auto_16696 ?auto_16725 ) ) ( not ( = ?auto_16696 ?auto_16727 ) ) ( not ( = ?auto_16696 ?auto_16713 ) ) ( not ( = ?auto_16696 ?auto_16719 ) ) ( not ( = ?auto_16721 ?auto_16715 ) ) ( not ( = ?auto_16721 ?auto_16717 ) ) ( not ( = ?auto_16721 ?auto_16706 ) ) ( not ( = ?auto_16721 ?auto_16707 ) ) ( not ( = ?auto_16721 ?auto_16712 ) ) ( not ( = ?auto_16721 ?auto_16729 ) ) ( not ( = ?auto_16721 ?auto_16726 ) ) ( not ( = ?auto_16723 ?auto_16714 ) ) ( not ( = ?auto_16723 ?auto_16709 ) ) ( not ( = ?auto_16723 ?auto_16720 ) ) ( not ( = ?auto_16723 ?auto_16708 ) ) ( not ( = ?auto_16723 ?auto_16718 ) ) ( not ( = ?auto_16723 ?auto_16710 ) ) ( not ( = ?auto_16723 ?auto_16711 ) ) ( not ( = ?auto_16722 ?auto_16724 ) ) ( not ( = ?auto_16722 ?auto_16728 ) ) ( not ( = ?auto_16722 ?auto_16716 ) ) ( not ( = ?auto_16722 ?auto_16725 ) ) ( not ( = ?auto_16722 ?auto_16727 ) ) ( not ( = ?auto_16722 ?auto_16713 ) ) ( not ( = ?auto_16722 ?auto_16719 ) ) ( not ( = ?auto_16690 ?auto_16699 ) ) ( not ( = ?auto_16690 ?auto_16703 ) ) ( not ( = ?auto_16691 ?auto_16699 ) ) ( not ( = ?auto_16691 ?auto_16703 ) ) ( not ( = ?auto_16692 ?auto_16699 ) ) ( not ( = ?auto_16692 ?auto_16703 ) ) ( not ( = ?auto_16693 ?auto_16699 ) ) ( not ( = ?auto_16693 ?auto_16703 ) ) ( not ( = ?auto_16694 ?auto_16699 ) ) ( not ( = ?auto_16694 ?auto_16703 ) ) ( not ( = ?auto_16695 ?auto_16699 ) ) ( not ( = ?auto_16695 ?auto_16703 ) ) ( not ( = ?auto_16698 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16703 ) ) ( not ( = ?auto_16697 ?auto_16699 ) ) ( not ( = ?auto_16697 ?auto_16703 ) ) ( not ( = ?auto_16699 ?auto_16722 ) ) ( not ( = ?auto_16699 ?auto_16724 ) ) ( not ( = ?auto_16699 ?auto_16728 ) ) ( not ( = ?auto_16699 ?auto_16716 ) ) ( not ( = ?auto_16699 ?auto_16725 ) ) ( not ( = ?auto_16699 ?auto_16727 ) ) ( not ( = ?auto_16699 ?auto_16713 ) ) ( not ( = ?auto_16699 ?auto_16719 ) ) ( not ( = ?auto_16700 ?auto_16721 ) ) ( not ( = ?auto_16700 ?auto_16715 ) ) ( not ( = ?auto_16700 ?auto_16717 ) ) ( not ( = ?auto_16700 ?auto_16706 ) ) ( not ( = ?auto_16700 ?auto_16707 ) ) ( not ( = ?auto_16700 ?auto_16712 ) ) ( not ( = ?auto_16700 ?auto_16729 ) ) ( not ( = ?auto_16700 ?auto_16726 ) ) ( not ( = ?auto_16702 ?auto_16723 ) ) ( not ( = ?auto_16702 ?auto_16714 ) ) ( not ( = ?auto_16702 ?auto_16709 ) ) ( not ( = ?auto_16702 ?auto_16720 ) ) ( not ( = ?auto_16702 ?auto_16708 ) ) ( not ( = ?auto_16702 ?auto_16718 ) ) ( not ( = ?auto_16702 ?auto_16710 ) ) ( not ( = ?auto_16702 ?auto_16711 ) ) ( not ( = ?auto_16703 ?auto_16722 ) ) ( not ( = ?auto_16703 ?auto_16724 ) ) ( not ( = ?auto_16703 ?auto_16728 ) ) ( not ( = ?auto_16703 ?auto_16716 ) ) ( not ( = ?auto_16703 ?auto_16725 ) ) ( not ( = ?auto_16703 ?auto_16727 ) ) ( not ( = ?auto_16703 ?auto_16713 ) ) ( not ( = ?auto_16703 ?auto_16719 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16690 ?auto_16691 ?auto_16692 ?auto_16693 ?auto_16694 ?auto_16695 ?auto_16698 ?auto_16697 ?auto_16696 )
      ( MAKE-1CRATE ?auto_16696 ?auto_16699 )
      ( MAKE-9CRATE-VERIFY ?auto_16690 ?auto_16691 ?auto_16692 ?auto_16693 ?auto_16694 ?auto_16695 ?auto_16698 ?auto_16697 ?auto_16696 ?auto_16699 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16732 - SURFACE
      ?auto_16733 - SURFACE
    )
    :vars
    (
      ?auto_16734 - HOIST
      ?auto_16735 - PLACE
      ?auto_16737 - PLACE
      ?auto_16738 - HOIST
      ?auto_16739 - SURFACE
      ?auto_16736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16734 ?auto_16735 ) ( SURFACE-AT ?auto_16732 ?auto_16735 ) ( CLEAR ?auto_16732 ) ( IS-CRATE ?auto_16733 ) ( AVAILABLE ?auto_16734 ) ( not ( = ?auto_16737 ?auto_16735 ) ) ( HOIST-AT ?auto_16738 ?auto_16737 ) ( AVAILABLE ?auto_16738 ) ( SURFACE-AT ?auto_16733 ?auto_16737 ) ( ON ?auto_16733 ?auto_16739 ) ( CLEAR ?auto_16733 ) ( TRUCK-AT ?auto_16736 ?auto_16735 ) ( not ( = ?auto_16732 ?auto_16733 ) ) ( not ( = ?auto_16732 ?auto_16739 ) ) ( not ( = ?auto_16733 ?auto_16739 ) ) ( not ( = ?auto_16734 ?auto_16738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16736 ?auto_16735 ?auto_16737 )
      ( !LIFT ?auto_16738 ?auto_16733 ?auto_16739 ?auto_16737 )
      ( !LOAD ?auto_16738 ?auto_16733 ?auto_16736 ?auto_16737 )
      ( !DRIVE ?auto_16736 ?auto_16737 ?auto_16735 )
      ( !UNLOAD ?auto_16734 ?auto_16733 ?auto_16736 ?auto_16735 )
      ( !DROP ?auto_16734 ?auto_16733 ?auto_16732 ?auto_16735 )
      ( MAKE-1CRATE-VERIFY ?auto_16732 ?auto_16733 ) )
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
      ?auto_16759 - SURFACE
      ?auto_16758 - SURFACE
      ?auto_16757 - SURFACE
      ?auto_16760 - SURFACE
      ?auto_16761 - SURFACE
    )
    :vars
    (
      ?auto_16762 - HOIST
      ?auto_16765 - PLACE
      ?auto_16767 - PLACE
      ?auto_16764 - HOIST
      ?auto_16763 - SURFACE
      ?auto_16792 - SURFACE
      ?auto_16786 - PLACE
      ?auto_16788 - HOIST
      ?auto_16777 - SURFACE
      ?auto_16785 - PLACE
      ?auto_16782 - HOIST
      ?auto_16775 - SURFACE
      ?auto_16774 - PLACE
      ?auto_16789 - HOIST
      ?auto_16787 - SURFACE
      ?auto_16773 - PLACE
      ?auto_16791 - HOIST
      ?auto_16778 - SURFACE
      ?auto_16770 - PLACE
      ?auto_16779 - HOIST
      ?auto_16776 - SURFACE
      ?auto_16769 - PLACE
      ?auto_16783 - HOIST
      ?auto_16781 - SURFACE
      ?auto_16790 - PLACE
      ?auto_16772 - HOIST
      ?auto_16768 - SURFACE
      ?auto_16780 - PLACE
      ?auto_16771 - HOIST
      ?auto_16784 - SURFACE
      ?auto_16766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16762 ?auto_16765 ) ( IS-CRATE ?auto_16761 ) ( not ( = ?auto_16767 ?auto_16765 ) ) ( HOIST-AT ?auto_16764 ?auto_16767 ) ( SURFACE-AT ?auto_16761 ?auto_16767 ) ( ON ?auto_16761 ?auto_16763 ) ( CLEAR ?auto_16761 ) ( not ( = ?auto_16760 ?auto_16761 ) ) ( not ( = ?auto_16760 ?auto_16763 ) ) ( not ( = ?auto_16761 ?auto_16763 ) ) ( not ( = ?auto_16762 ?auto_16764 ) ) ( IS-CRATE ?auto_16760 ) ( AVAILABLE ?auto_16764 ) ( SURFACE-AT ?auto_16760 ?auto_16767 ) ( ON ?auto_16760 ?auto_16792 ) ( CLEAR ?auto_16760 ) ( not ( = ?auto_16757 ?auto_16760 ) ) ( not ( = ?auto_16757 ?auto_16792 ) ) ( not ( = ?auto_16760 ?auto_16792 ) ) ( IS-CRATE ?auto_16757 ) ( not ( = ?auto_16786 ?auto_16765 ) ) ( HOIST-AT ?auto_16788 ?auto_16786 ) ( AVAILABLE ?auto_16788 ) ( SURFACE-AT ?auto_16757 ?auto_16786 ) ( ON ?auto_16757 ?auto_16777 ) ( CLEAR ?auto_16757 ) ( not ( = ?auto_16758 ?auto_16757 ) ) ( not ( = ?auto_16758 ?auto_16777 ) ) ( not ( = ?auto_16757 ?auto_16777 ) ) ( not ( = ?auto_16762 ?auto_16788 ) ) ( IS-CRATE ?auto_16758 ) ( not ( = ?auto_16785 ?auto_16765 ) ) ( HOIST-AT ?auto_16782 ?auto_16785 ) ( AVAILABLE ?auto_16782 ) ( SURFACE-AT ?auto_16758 ?auto_16785 ) ( ON ?auto_16758 ?auto_16775 ) ( CLEAR ?auto_16758 ) ( not ( = ?auto_16759 ?auto_16758 ) ) ( not ( = ?auto_16759 ?auto_16775 ) ) ( not ( = ?auto_16758 ?auto_16775 ) ) ( not ( = ?auto_16762 ?auto_16782 ) ) ( IS-CRATE ?auto_16759 ) ( not ( = ?auto_16774 ?auto_16765 ) ) ( HOIST-AT ?auto_16789 ?auto_16774 ) ( AVAILABLE ?auto_16789 ) ( SURFACE-AT ?auto_16759 ?auto_16774 ) ( ON ?auto_16759 ?auto_16787 ) ( CLEAR ?auto_16759 ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( not ( = ?auto_16756 ?auto_16787 ) ) ( not ( = ?auto_16759 ?auto_16787 ) ) ( not ( = ?auto_16762 ?auto_16789 ) ) ( IS-CRATE ?auto_16756 ) ( not ( = ?auto_16773 ?auto_16765 ) ) ( HOIST-AT ?auto_16791 ?auto_16773 ) ( AVAILABLE ?auto_16791 ) ( SURFACE-AT ?auto_16756 ?auto_16773 ) ( ON ?auto_16756 ?auto_16778 ) ( CLEAR ?auto_16756 ) ( not ( = ?auto_16755 ?auto_16756 ) ) ( not ( = ?auto_16755 ?auto_16778 ) ) ( not ( = ?auto_16756 ?auto_16778 ) ) ( not ( = ?auto_16762 ?auto_16791 ) ) ( IS-CRATE ?auto_16755 ) ( not ( = ?auto_16770 ?auto_16765 ) ) ( HOIST-AT ?auto_16779 ?auto_16770 ) ( AVAILABLE ?auto_16779 ) ( SURFACE-AT ?auto_16755 ?auto_16770 ) ( ON ?auto_16755 ?auto_16776 ) ( CLEAR ?auto_16755 ) ( not ( = ?auto_16754 ?auto_16755 ) ) ( not ( = ?auto_16754 ?auto_16776 ) ) ( not ( = ?auto_16755 ?auto_16776 ) ) ( not ( = ?auto_16762 ?auto_16779 ) ) ( IS-CRATE ?auto_16754 ) ( not ( = ?auto_16769 ?auto_16765 ) ) ( HOIST-AT ?auto_16783 ?auto_16769 ) ( AVAILABLE ?auto_16783 ) ( SURFACE-AT ?auto_16754 ?auto_16769 ) ( ON ?auto_16754 ?auto_16781 ) ( CLEAR ?auto_16754 ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16753 ?auto_16781 ) ) ( not ( = ?auto_16754 ?auto_16781 ) ) ( not ( = ?auto_16762 ?auto_16783 ) ) ( IS-CRATE ?auto_16753 ) ( not ( = ?auto_16790 ?auto_16765 ) ) ( HOIST-AT ?auto_16772 ?auto_16790 ) ( AVAILABLE ?auto_16772 ) ( SURFACE-AT ?auto_16753 ?auto_16790 ) ( ON ?auto_16753 ?auto_16768 ) ( CLEAR ?auto_16753 ) ( not ( = ?auto_16752 ?auto_16753 ) ) ( not ( = ?auto_16752 ?auto_16768 ) ) ( not ( = ?auto_16753 ?auto_16768 ) ) ( not ( = ?auto_16762 ?auto_16772 ) ) ( SURFACE-AT ?auto_16751 ?auto_16765 ) ( CLEAR ?auto_16751 ) ( IS-CRATE ?auto_16752 ) ( AVAILABLE ?auto_16762 ) ( not ( = ?auto_16780 ?auto_16765 ) ) ( HOIST-AT ?auto_16771 ?auto_16780 ) ( AVAILABLE ?auto_16771 ) ( SURFACE-AT ?auto_16752 ?auto_16780 ) ( ON ?auto_16752 ?auto_16784 ) ( CLEAR ?auto_16752 ) ( TRUCK-AT ?auto_16766 ?auto_16765 ) ( not ( = ?auto_16751 ?auto_16752 ) ) ( not ( = ?auto_16751 ?auto_16784 ) ) ( not ( = ?auto_16752 ?auto_16784 ) ) ( not ( = ?auto_16762 ?auto_16771 ) ) ( not ( = ?auto_16751 ?auto_16753 ) ) ( not ( = ?auto_16751 ?auto_16768 ) ) ( not ( = ?auto_16753 ?auto_16784 ) ) ( not ( = ?auto_16790 ?auto_16780 ) ) ( not ( = ?auto_16772 ?auto_16771 ) ) ( not ( = ?auto_16768 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16754 ) ) ( not ( = ?auto_16751 ?auto_16781 ) ) ( not ( = ?auto_16752 ?auto_16754 ) ) ( not ( = ?auto_16752 ?auto_16781 ) ) ( not ( = ?auto_16754 ?auto_16768 ) ) ( not ( = ?auto_16754 ?auto_16784 ) ) ( not ( = ?auto_16769 ?auto_16790 ) ) ( not ( = ?auto_16769 ?auto_16780 ) ) ( not ( = ?auto_16783 ?auto_16772 ) ) ( not ( = ?auto_16783 ?auto_16771 ) ) ( not ( = ?auto_16781 ?auto_16768 ) ) ( not ( = ?auto_16781 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16755 ) ) ( not ( = ?auto_16751 ?auto_16776 ) ) ( not ( = ?auto_16752 ?auto_16755 ) ) ( not ( = ?auto_16752 ?auto_16776 ) ) ( not ( = ?auto_16753 ?auto_16755 ) ) ( not ( = ?auto_16753 ?auto_16776 ) ) ( not ( = ?auto_16755 ?auto_16781 ) ) ( not ( = ?auto_16755 ?auto_16768 ) ) ( not ( = ?auto_16755 ?auto_16784 ) ) ( not ( = ?auto_16770 ?auto_16769 ) ) ( not ( = ?auto_16770 ?auto_16790 ) ) ( not ( = ?auto_16770 ?auto_16780 ) ) ( not ( = ?auto_16779 ?auto_16783 ) ) ( not ( = ?auto_16779 ?auto_16772 ) ) ( not ( = ?auto_16779 ?auto_16771 ) ) ( not ( = ?auto_16776 ?auto_16781 ) ) ( not ( = ?auto_16776 ?auto_16768 ) ) ( not ( = ?auto_16776 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16756 ) ) ( not ( = ?auto_16751 ?auto_16778 ) ) ( not ( = ?auto_16752 ?auto_16756 ) ) ( not ( = ?auto_16752 ?auto_16778 ) ) ( not ( = ?auto_16753 ?auto_16756 ) ) ( not ( = ?auto_16753 ?auto_16778 ) ) ( not ( = ?auto_16754 ?auto_16756 ) ) ( not ( = ?auto_16754 ?auto_16778 ) ) ( not ( = ?auto_16756 ?auto_16776 ) ) ( not ( = ?auto_16756 ?auto_16781 ) ) ( not ( = ?auto_16756 ?auto_16768 ) ) ( not ( = ?auto_16756 ?auto_16784 ) ) ( not ( = ?auto_16773 ?auto_16770 ) ) ( not ( = ?auto_16773 ?auto_16769 ) ) ( not ( = ?auto_16773 ?auto_16790 ) ) ( not ( = ?auto_16773 ?auto_16780 ) ) ( not ( = ?auto_16791 ?auto_16779 ) ) ( not ( = ?auto_16791 ?auto_16783 ) ) ( not ( = ?auto_16791 ?auto_16772 ) ) ( not ( = ?auto_16791 ?auto_16771 ) ) ( not ( = ?auto_16778 ?auto_16776 ) ) ( not ( = ?auto_16778 ?auto_16781 ) ) ( not ( = ?auto_16778 ?auto_16768 ) ) ( not ( = ?auto_16778 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16759 ) ) ( not ( = ?auto_16751 ?auto_16787 ) ) ( not ( = ?auto_16752 ?auto_16759 ) ) ( not ( = ?auto_16752 ?auto_16787 ) ) ( not ( = ?auto_16753 ?auto_16759 ) ) ( not ( = ?auto_16753 ?auto_16787 ) ) ( not ( = ?auto_16754 ?auto_16759 ) ) ( not ( = ?auto_16754 ?auto_16787 ) ) ( not ( = ?auto_16755 ?auto_16759 ) ) ( not ( = ?auto_16755 ?auto_16787 ) ) ( not ( = ?auto_16759 ?auto_16778 ) ) ( not ( = ?auto_16759 ?auto_16776 ) ) ( not ( = ?auto_16759 ?auto_16781 ) ) ( not ( = ?auto_16759 ?auto_16768 ) ) ( not ( = ?auto_16759 ?auto_16784 ) ) ( not ( = ?auto_16774 ?auto_16773 ) ) ( not ( = ?auto_16774 ?auto_16770 ) ) ( not ( = ?auto_16774 ?auto_16769 ) ) ( not ( = ?auto_16774 ?auto_16790 ) ) ( not ( = ?auto_16774 ?auto_16780 ) ) ( not ( = ?auto_16789 ?auto_16791 ) ) ( not ( = ?auto_16789 ?auto_16779 ) ) ( not ( = ?auto_16789 ?auto_16783 ) ) ( not ( = ?auto_16789 ?auto_16772 ) ) ( not ( = ?auto_16789 ?auto_16771 ) ) ( not ( = ?auto_16787 ?auto_16778 ) ) ( not ( = ?auto_16787 ?auto_16776 ) ) ( not ( = ?auto_16787 ?auto_16781 ) ) ( not ( = ?auto_16787 ?auto_16768 ) ) ( not ( = ?auto_16787 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16758 ) ) ( not ( = ?auto_16751 ?auto_16775 ) ) ( not ( = ?auto_16752 ?auto_16758 ) ) ( not ( = ?auto_16752 ?auto_16775 ) ) ( not ( = ?auto_16753 ?auto_16758 ) ) ( not ( = ?auto_16753 ?auto_16775 ) ) ( not ( = ?auto_16754 ?auto_16758 ) ) ( not ( = ?auto_16754 ?auto_16775 ) ) ( not ( = ?auto_16755 ?auto_16758 ) ) ( not ( = ?auto_16755 ?auto_16775 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16775 ) ) ( not ( = ?auto_16758 ?auto_16787 ) ) ( not ( = ?auto_16758 ?auto_16778 ) ) ( not ( = ?auto_16758 ?auto_16776 ) ) ( not ( = ?auto_16758 ?auto_16781 ) ) ( not ( = ?auto_16758 ?auto_16768 ) ) ( not ( = ?auto_16758 ?auto_16784 ) ) ( not ( = ?auto_16785 ?auto_16774 ) ) ( not ( = ?auto_16785 ?auto_16773 ) ) ( not ( = ?auto_16785 ?auto_16770 ) ) ( not ( = ?auto_16785 ?auto_16769 ) ) ( not ( = ?auto_16785 ?auto_16790 ) ) ( not ( = ?auto_16785 ?auto_16780 ) ) ( not ( = ?auto_16782 ?auto_16789 ) ) ( not ( = ?auto_16782 ?auto_16791 ) ) ( not ( = ?auto_16782 ?auto_16779 ) ) ( not ( = ?auto_16782 ?auto_16783 ) ) ( not ( = ?auto_16782 ?auto_16772 ) ) ( not ( = ?auto_16782 ?auto_16771 ) ) ( not ( = ?auto_16775 ?auto_16787 ) ) ( not ( = ?auto_16775 ?auto_16778 ) ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16781 ) ) ( not ( = ?auto_16775 ?auto_16768 ) ) ( not ( = ?auto_16775 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16757 ) ) ( not ( = ?auto_16751 ?auto_16777 ) ) ( not ( = ?auto_16752 ?auto_16757 ) ) ( not ( = ?auto_16752 ?auto_16777 ) ) ( not ( = ?auto_16753 ?auto_16757 ) ) ( not ( = ?auto_16753 ?auto_16777 ) ) ( not ( = ?auto_16754 ?auto_16757 ) ) ( not ( = ?auto_16754 ?auto_16777 ) ) ( not ( = ?auto_16755 ?auto_16757 ) ) ( not ( = ?auto_16755 ?auto_16777 ) ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16777 ) ) ( not ( = ?auto_16759 ?auto_16757 ) ) ( not ( = ?auto_16759 ?auto_16777 ) ) ( not ( = ?auto_16757 ?auto_16775 ) ) ( not ( = ?auto_16757 ?auto_16787 ) ) ( not ( = ?auto_16757 ?auto_16778 ) ) ( not ( = ?auto_16757 ?auto_16776 ) ) ( not ( = ?auto_16757 ?auto_16781 ) ) ( not ( = ?auto_16757 ?auto_16768 ) ) ( not ( = ?auto_16757 ?auto_16784 ) ) ( not ( = ?auto_16786 ?auto_16785 ) ) ( not ( = ?auto_16786 ?auto_16774 ) ) ( not ( = ?auto_16786 ?auto_16773 ) ) ( not ( = ?auto_16786 ?auto_16770 ) ) ( not ( = ?auto_16786 ?auto_16769 ) ) ( not ( = ?auto_16786 ?auto_16790 ) ) ( not ( = ?auto_16786 ?auto_16780 ) ) ( not ( = ?auto_16788 ?auto_16782 ) ) ( not ( = ?auto_16788 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16791 ) ) ( not ( = ?auto_16788 ?auto_16779 ) ) ( not ( = ?auto_16788 ?auto_16783 ) ) ( not ( = ?auto_16788 ?auto_16772 ) ) ( not ( = ?auto_16788 ?auto_16771 ) ) ( not ( = ?auto_16777 ?auto_16775 ) ) ( not ( = ?auto_16777 ?auto_16787 ) ) ( not ( = ?auto_16777 ?auto_16778 ) ) ( not ( = ?auto_16777 ?auto_16776 ) ) ( not ( = ?auto_16777 ?auto_16781 ) ) ( not ( = ?auto_16777 ?auto_16768 ) ) ( not ( = ?auto_16777 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16760 ) ) ( not ( = ?auto_16751 ?auto_16792 ) ) ( not ( = ?auto_16752 ?auto_16760 ) ) ( not ( = ?auto_16752 ?auto_16792 ) ) ( not ( = ?auto_16753 ?auto_16760 ) ) ( not ( = ?auto_16753 ?auto_16792 ) ) ( not ( = ?auto_16754 ?auto_16760 ) ) ( not ( = ?auto_16754 ?auto_16792 ) ) ( not ( = ?auto_16755 ?auto_16760 ) ) ( not ( = ?auto_16755 ?auto_16792 ) ) ( not ( = ?auto_16756 ?auto_16760 ) ) ( not ( = ?auto_16756 ?auto_16792 ) ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16759 ?auto_16792 ) ) ( not ( = ?auto_16758 ?auto_16760 ) ) ( not ( = ?auto_16758 ?auto_16792 ) ) ( not ( = ?auto_16760 ?auto_16777 ) ) ( not ( = ?auto_16760 ?auto_16775 ) ) ( not ( = ?auto_16760 ?auto_16787 ) ) ( not ( = ?auto_16760 ?auto_16778 ) ) ( not ( = ?auto_16760 ?auto_16776 ) ) ( not ( = ?auto_16760 ?auto_16781 ) ) ( not ( = ?auto_16760 ?auto_16768 ) ) ( not ( = ?auto_16760 ?auto_16784 ) ) ( not ( = ?auto_16767 ?auto_16786 ) ) ( not ( = ?auto_16767 ?auto_16785 ) ) ( not ( = ?auto_16767 ?auto_16774 ) ) ( not ( = ?auto_16767 ?auto_16773 ) ) ( not ( = ?auto_16767 ?auto_16770 ) ) ( not ( = ?auto_16767 ?auto_16769 ) ) ( not ( = ?auto_16767 ?auto_16790 ) ) ( not ( = ?auto_16767 ?auto_16780 ) ) ( not ( = ?auto_16764 ?auto_16788 ) ) ( not ( = ?auto_16764 ?auto_16782 ) ) ( not ( = ?auto_16764 ?auto_16789 ) ) ( not ( = ?auto_16764 ?auto_16791 ) ) ( not ( = ?auto_16764 ?auto_16779 ) ) ( not ( = ?auto_16764 ?auto_16783 ) ) ( not ( = ?auto_16764 ?auto_16772 ) ) ( not ( = ?auto_16764 ?auto_16771 ) ) ( not ( = ?auto_16792 ?auto_16777 ) ) ( not ( = ?auto_16792 ?auto_16775 ) ) ( not ( = ?auto_16792 ?auto_16787 ) ) ( not ( = ?auto_16792 ?auto_16778 ) ) ( not ( = ?auto_16792 ?auto_16776 ) ) ( not ( = ?auto_16792 ?auto_16781 ) ) ( not ( = ?auto_16792 ?auto_16768 ) ) ( not ( = ?auto_16792 ?auto_16784 ) ) ( not ( = ?auto_16751 ?auto_16761 ) ) ( not ( = ?auto_16751 ?auto_16763 ) ) ( not ( = ?auto_16752 ?auto_16761 ) ) ( not ( = ?auto_16752 ?auto_16763 ) ) ( not ( = ?auto_16753 ?auto_16761 ) ) ( not ( = ?auto_16753 ?auto_16763 ) ) ( not ( = ?auto_16754 ?auto_16761 ) ) ( not ( = ?auto_16754 ?auto_16763 ) ) ( not ( = ?auto_16755 ?auto_16761 ) ) ( not ( = ?auto_16755 ?auto_16763 ) ) ( not ( = ?auto_16756 ?auto_16761 ) ) ( not ( = ?auto_16756 ?auto_16763 ) ) ( not ( = ?auto_16759 ?auto_16761 ) ) ( not ( = ?auto_16759 ?auto_16763 ) ) ( not ( = ?auto_16758 ?auto_16761 ) ) ( not ( = ?auto_16758 ?auto_16763 ) ) ( not ( = ?auto_16757 ?auto_16761 ) ) ( not ( = ?auto_16757 ?auto_16763 ) ) ( not ( = ?auto_16761 ?auto_16792 ) ) ( not ( = ?auto_16761 ?auto_16777 ) ) ( not ( = ?auto_16761 ?auto_16775 ) ) ( not ( = ?auto_16761 ?auto_16787 ) ) ( not ( = ?auto_16761 ?auto_16778 ) ) ( not ( = ?auto_16761 ?auto_16776 ) ) ( not ( = ?auto_16761 ?auto_16781 ) ) ( not ( = ?auto_16761 ?auto_16768 ) ) ( not ( = ?auto_16761 ?auto_16784 ) ) ( not ( = ?auto_16763 ?auto_16792 ) ) ( not ( = ?auto_16763 ?auto_16777 ) ) ( not ( = ?auto_16763 ?auto_16775 ) ) ( not ( = ?auto_16763 ?auto_16787 ) ) ( not ( = ?auto_16763 ?auto_16778 ) ) ( not ( = ?auto_16763 ?auto_16776 ) ) ( not ( = ?auto_16763 ?auto_16781 ) ) ( not ( = ?auto_16763 ?auto_16768 ) ) ( not ( = ?auto_16763 ?auto_16784 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16751 ?auto_16752 ?auto_16753 ?auto_16754 ?auto_16755 ?auto_16756 ?auto_16759 ?auto_16758 ?auto_16757 ?auto_16760 )
      ( MAKE-1CRATE ?auto_16760 ?auto_16761 )
      ( MAKE-10CRATE-VERIFY ?auto_16751 ?auto_16752 ?auto_16753 ?auto_16754 ?auto_16755 ?auto_16756 ?auto_16759 ?auto_16758 ?auto_16757 ?auto_16760 ?auto_16761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16795 - SURFACE
      ?auto_16796 - SURFACE
    )
    :vars
    (
      ?auto_16797 - HOIST
      ?auto_16798 - PLACE
      ?auto_16800 - PLACE
      ?auto_16801 - HOIST
      ?auto_16802 - SURFACE
      ?auto_16799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16797 ?auto_16798 ) ( SURFACE-AT ?auto_16795 ?auto_16798 ) ( CLEAR ?auto_16795 ) ( IS-CRATE ?auto_16796 ) ( AVAILABLE ?auto_16797 ) ( not ( = ?auto_16800 ?auto_16798 ) ) ( HOIST-AT ?auto_16801 ?auto_16800 ) ( AVAILABLE ?auto_16801 ) ( SURFACE-AT ?auto_16796 ?auto_16800 ) ( ON ?auto_16796 ?auto_16802 ) ( CLEAR ?auto_16796 ) ( TRUCK-AT ?auto_16799 ?auto_16798 ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( not ( = ?auto_16795 ?auto_16802 ) ) ( not ( = ?auto_16796 ?auto_16802 ) ) ( not ( = ?auto_16797 ?auto_16801 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16799 ?auto_16798 ?auto_16800 )
      ( !LIFT ?auto_16801 ?auto_16796 ?auto_16802 ?auto_16800 )
      ( !LOAD ?auto_16801 ?auto_16796 ?auto_16799 ?auto_16800 )
      ( !DRIVE ?auto_16799 ?auto_16800 ?auto_16798 )
      ( !UNLOAD ?auto_16797 ?auto_16796 ?auto_16799 ?auto_16798 )
      ( !DROP ?auto_16797 ?auto_16796 ?auto_16795 ?auto_16798 )
      ( MAKE-1CRATE-VERIFY ?auto_16795 ?auto_16796 ) )
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
      ?auto_16823 - SURFACE
      ?auto_16822 - SURFACE
      ?auto_16821 - SURFACE
      ?auto_16824 - SURFACE
      ?auto_16826 - SURFACE
      ?auto_16825 - SURFACE
    )
    :vars
    (
      ?auto_16831 - HOIST
      ?auto_16827 - PLACE
      ?auto_16828 - PLACE
      ?auto_16832 - HOIST
      ?auto_16829 - SURFACE
      ?auto_16845 - PLACE
      ?auto_16839 - HOIST
      ?auto_16843 - SURFACE
      ?auto_16857 - SURFACE
      ?auto_16849 - PLACE
      ?auto_16842 - HOIST
      ?auto_16860 - SURFACE
      ?auto_16835 - PLACE
      ?auto_16844 - HOIST
      ?auto_16840 - SURFACE
      ?auto_16854 - PLACE
      ?auto_16834 - HOIST
      ?auto_16833 - SURFACE
      ?auto_16847 - PLACE
      ?auto_16838 - HOIST
      ?auto_16859 - SURFACE
      ?auto_16852 - PLACE
      ?auto_16837 - HOIST
      ?auto_16846 - SURFACE
      ?auto_16853 - PLACE
      ?auto_16856 - HOIST
      ?auto_16855 - SURFACE
      ?auto_16841 - PLACE
      ?auto_16836 - HOIST
      ?auto_16848 - SURFACE
      ?auto_16858 - PLACE
      ?auto_16850 - HOIST
      ?auto_16851 - SURFACE
      ?auto_16830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16831 ?auto_16827 ) ( IS-CRATE ?auto_16825 ) ( not ( = ?auto_16828 ?auto_16827 ) ) ( HOIST-AT ?auto_16832 ?auto_16828 ) ( AVAILABLE ?auto_16832 ) ( SURFACE-AT ?auto_16825 ?auto_16828 ) ( ON ?auto_16825 ?auto_16829 ) ( CLEAR ?auto_16825 ) ( not ( = ?auto_16826 ?auto_16825 ) ) ( not ( = ?auto_16826 ?auto_16829 ) ) ( not ( = ?auto_16825 ?auto_16829 ) ) ( not ( = ?auto_16831 ?auto_16832 ) ) ( IS-CRATE ?auto_16826 ) ( not ( = ?auto_16845 ?auto_16827 ) ) ( HOIST-AT ?auto_16839 ?auto_16845 ) ( SURFACE-AT ?auto_16826 ?auto_16845 ) ( ON ?auto_16826 ?auto_16843 ) ( CLEAR ?auto_16826 ) ( not ( = ?auto_16824 ?auto_16826 ) ) ( not ( = ?auto_16824 ?auto_16843 ) ) ( not ( = ?auto_16826 ?auto_16843 ) ) ( not ( = ?auto_16831 ?auto_16839 ) ) ( IS-CRATE ?auto_16824 ) ( AVAILABLE ?auto_16839 ) ( SURFACE-AT ?auto_16824 ?auto_16845 ) ( ON ?auto_16824 ?auto_16857 ) ( CLEAR ?auto_16824 ) ( not ( = ?auto_16821 ?auto_16824 ) ) ( not ( = ?auto_16821 ?auto_16857 ) ) ( not ( = ?auto_16824 ?auto_16857 ) ) ( IS-CRATE ?auto_16821 ) ( not ( = ?auto_16849 ?auto_16827 ) ) ( HOIST-AT ?auto_16842 ?auto_16849 ) ( AVAILABLE ?auto_16842 ) ( SURFACE-AT ?auto_16821 ?auto_16849 ) ( ON ?auto_16821 ?auto_16860 ) ( CLEAR ?auto_16821 ) ( not ( = ?auto_16822 ?auto_16821 ) ) ( not ( = ?auto_16822 ?auto_16860 ) ) ( not ( = ?auto_16821 ?auto_16860 ) ) ( not ( = ?auto_16831 ?auto_16842 ) ) ( IS-CRATE ?auto_16822 ) ( not ( = ?auto_16835 ?auto_16827 ) ) ( HOIST-AT ?auto_16844 ?auto_16835 ) ( AVAILABLE ?auto_16844 ) ( SURFACE-AT ?auto_16822 ?auto_16835 ) ( ON ?auto_16822 ?auto_16840 ) ( CLEAR ?auto_16822 ) ( not ( = ?auto_16823 ?auto_16822 ) ) ( not ( = ?auto_16823 ?auto_16840 ) ) ( not ( = ?auto_16822 ?auto_16840 ) ) ( not ( = ?auto_16831 ?auto_16844 ) ) ( IS-CRATE ?auto_16823 ) ( not ( = ?auto_16854 ?auto_16827 ) ) ( HOIST-AT ?auto_16834 ?auto_16854 ) ( AVAILABLE ?auto_16834 ) ( SURFACE-AT ?auto_16823 ?auto_16854 ) ( ON ?auto_16823 ?auto_16833 ) ( CLEAR ?auto_16823 ) ( not ( = ?auto_16820 ?auto_16823 ) ) ( not ( = ?auto_16820 ?auto_16833 ) ) ( not ( = ?auto_16823 ?auto_16833 ) ) ( not ( = ?auto_16831 ?auto_16834 ) ) ( IS-CRATE ?auto_16820 ) ( not ( = ?auto_16847 ?auto_16827 ) ) ( HOIST-AT ?auto_16838 ?auto_16847 ) ( AVAILABLE ?auto_16838 ) ( SURFACE-AT ?auto_16820 ?auto_16847 ) ( ON ?auto_16820 ?auto_16859 ) ( CLEAR ?auto_16820 ) ( not ( = ?auto_16819 ?auto_16820 ) ) ( not ( = ?auto_16819 ?auto_16859 ) ) ( not ( = ?auto_16820 ?auto_16859 ) ) ( not ( = ?auto_16831 ?auto_16838 ) ) ( IS-CRATE ?auto_16819 ) ( not ( = ?auto_16852 ?auto_16827 ) ) ( HOIST-AT ?auto_16837 ?auto_16852 ) ( AVAILABLE ?auto_16837 ) ( SURFACE-AT ?auto_16819 ?auto_16852 ) ( ON ?auto_16819 ?auto_16846 ) ( CLEAR ?auto_16819 ) ( not ( = ?auto_16818 ?auto_16819 ) ) ( not ( = ?auto_16818 ?auto_16846 ) ) ( not ( = ?auto_16819 ?auto_16846 ) ) ( not ( = ?auto_16831 ?auto_16837 ) ) ( IS-CRATE ?auto_16818 ) ( not ( = ?auto_16853 ?auto_16827 ) ) ( HOIST-AT ?auto_16856 ?auto_16853 ) ( AVAILABLE ?auto_16856 ) ( SURFACE-AT ?auto_16818 ?auto_16853 ) ( ON ?auto_16818 ?auto_16855 ) ( CLEAR ?auto_16818 ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16855 ) ) ( not ( = ?auto_16818 ?auto_16855 ) ) ( not ( = ?auto_16831 ?auto_16856 ) ) ( IS-CRATE ?auto_16817 ) ( not ( = ?auto_16841 ?auto_16827 ) ) ( HOIST-AT ?auto_16836 ?auto_16841 ) ( AVAILABLE ?auto_16836 ) ( SURFACE-AT ?auto_16817 ?auto_16841 ) ( ON ?auto_16817 ?auto_16848 ) ( CLEAR ?auto_16817 ) ( not ( = ?auto_16816 ?auto_16817 ) ) ( not ( = ?auto_16816 ?auto_16848 ) ) ( not ( = ?auto_16817 ?auto_16848 ) ) ( not ( = ?auto_16831 ?auto_16836 ) ) ( SURFACE-AT ?auto_16815 ?auto_16827 ) ( CLEAR ?auto_16815 ) ( IS-CRATE ?auto_16816 ) ( AVAILABLE ?auto_16831 ) ( not ( = ?auto_16858 ?auto_16827 ) ) ( HOIST-AT ?auto_16850 ?auto_16858 ) ( AVAILABLE ?auto_16850 ) ( SURFACE-AT ?auto_16816 ?auto_16858 ) ( ON ?auto_16816 ?auto_16851 ) ( CLEAR ?auto_16816 ) ( TRUCK-AT ?auto_16830 ?auto_16827 ) ( not ( = ?auto_16815 ?auto_16816 ) ) ( not ( = ?auto_16815 ?auto_16851 ) ) ( not ( = ?auto_16816 ?auto_16851 ) ) ( not ( = ?auto_16831 ?auto_16850 ) ) ( not ( = ?auto_16815 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16848 ) ) ( not ( = ?auto_16817 ?auto_16851 ) ) ( not ( = ?auto_16841 ?auto_16858 ) ) ( not ( = ?auto_16836 ?auto_16850 ) ) ( not ( = ?auto_16848 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( not ( = ?auto_16815 ?auto_16855 ) ) ( not ( = ?auto_16816 ?auto_16818 ) ) ( not ( = ?auto_16816 ?auto_16855 ) ) ( not ( = ?auto_16818 ?auto_16848 ) ) ( not ( = ?auto_16818 ?auto_16851 ) ) ( not ( = ?auto_16853 ?auto_16841 ) ) ( not ( = ?auto_16853 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16836 ) ) ( not ( = ?auto_16856 ?auto_16850 ) ) ( not ( = ?auto_16855 ?auto_16848 ) ) ( not ( = ?auto_16855 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16819 ) ) ( not ( = ?auto_16815 ?auto_16846 ) ) ( not ( = ?auto_16816 ?auto_16819 ) ) ( not ( = ?auto_16816 ?auto_16846 ) ) ( not ( = ?auto_16817 ?auto_16819 ) ) ( not ( = ?auto_16817 ?auto_16846 ) ) ( not ( = ?auto_16819 ?auto_16855 ) ) ( not ( = ?auto_16819 ?auto_16848 ) ) ( not ( = ?auto_16819 ?auto_16851 ) ) ( not ( = ?auto_16852 ?auto_16853 ) ) ( not ( = ?auto_16852 ?auto_16841 ) ) ( not ( = ?auto_16852 ?auto_16858 ) ) ( not ( = ?auto_16837 ?auto_16856 ) ) ( not ( = ?auto_16837 ?auto_16836 ) ) ( not ( = ?auto_16837 ?auto_16850 ) ) ( not ( = ?auto_16846 ?auto_16855 ) ) ( not ( = ?auto_16846 ?auto_16848 ) ) ( not ( = ?auto_16846 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16820 ) ) ( not ( = ?auto_16815 ?auto_16859 ) ) ( not ( = ?auto_16816 ?auto_16820 ) ) ( not ( = ?auto_16816 ?auto_16859 ) ) ( not ( = ?auto_16817 ?auto_16820 ) ) ( not ( = ?auto_16817 ?auto_16859 ) ) ( not ( = ?auto_16818 ?auto_16820 ) ) ( not ( = ?auto_16818 ?auto_16859 ) ) ( not ( = ?auto_16820 ?auto_16846 ) ) ( not ( = ?auto_16820 ?auto_16855 ) ) ( not ( = ?auto_16820 ?auto_16848 ) ) ( not ( = ?auto_16820 ?auto_16851 ) ) ( not ( = ?auto_16847 ?auto_16852 ) ) ( not ( = ?auto_16847 ?auto_16853 ) ) ( not ( = ?auto_16847 ?auto_16841 ) ) ( not ( = ?auto_16847 ?auto_16858 ) ) ( not ( = ?auto_16838 ?auto_16837 ) ) ( not ( = ?auto_16838 ?auto_16856 ) ) ( not ( = ?auto_16838 ?auto_16836 ) ) ( not ( = ?auto_16838 ?auto_16850 ) ) ( not ( = ?auto_16859 ?auto_16846 ) ) ( not ( = ?auto_16859 ?auto_16855 ) ) ( not ( = ?auto_16859 ?auto_16848 ) ) ( not ( = ?auto_16859 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16823 ) ) ( not ( = ?auto_16815 ?auto_16833 ) ) ( not ( = ?auto_16816 ?auto_16823 ) ) ( not ( = ?auto_16816 ?auto_16833 ) ) ( not ( = ?auto_16817 ?auto_16823 ) ) ( not ( = ?auto_16817 ?auto_16833 ) ) ( not ( = ?auto_16818 ?auto_16823 ) ) ( not ( = ?auto_16818 ?auto_16833 ) ) ( not ( = ?auto_16819 ?auto_16823 ) ) ( not ( = ?auto_16819 ?auto_16833 ) ) ( not ( = ?auto_16823 ?auto_16859 ) ) ( not ( = ?auto_16823 ?auto_16846 ) ) ( not ( = ?auto_16823 ?auto_16855 ) ) ( not ( = ?auto_16823 ?auto_16848 ) ) ( not ( = ?auto_16823 ?auto_16851 ) ) ( not ( = ?auto_16854 ?auto_16847 ) ) ( not ( = ?auto_16854 ?auto_16852 ) ) ( not ( = ?auto_16854 ?auto_16853 ) ) ( not ( = ?auto_16854 ?auto_16841 ) ) ( not ( = ?auto_16854 ?auto_16858 ) ) ( not ( = ?auto_16834 ?auto_16838 ) ) ( not ( = ?auto_16834 ?auto_16837 ) ) ( not ( = ?auto_16834 ?auto_16856 ) ) ( not ( = ?auto_16834 ?auto_16836 ) ) ( not ( = ?auto_16834 ?auto_16850 ) ) ( not ( = ?auto_16833 ?auto_16859 ) ) ( not ( = ?auto_16833 ?auto_16846 ) ) ( not ( = ?auto_16833 ?auto_16855 ) ) ( not ( = ?auto_16833 ?auto_16848 ) ) ( not ( = ?auto_16833 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16822 ) ) ( not ( = ?auto_16815 ?auto_16840 ) ) ( not ( = ?auto_16816 ?auto_16822 ) ) ( not ( = ?auto_16816 ?auto_16840 ) ) ( not ( = ?auto_16817 ?auto_16822 ) ) ( not ( = ?auto_16817 ?auto_16840 ) ) ( not ( = ?auto_16818 ?auto_16822 ) ) ( not ( = ?auto_16818 ?auto_16840 ) ) ( not ( = ?auto_16819 ?auto_16822 ) ) ( not ( = ?auto_16819 ?auto_16840 ) ) ( not ( = ?auto_16820 ?auto_16822 ) ) ( not ( = ?auto_16820 ?auto_16840 ) ) ( not ( = ?auto_16822 ?auto_16833 ) ) ( not ( = ?auto_16822 ?auto_16859 ) ) ( not ( = ?auto_16822 ?auto_16846 ) ) ( not ( = ?auto_16822 ?auto_16855 ) ) ( not ( = ?auto_16822 ?auto_16848 ) ) ( not ( = ?auto_16822 ?auto_16851 ) ) ( not ( = ?auto_16835 ?auto_16854 ) ) ( not ( = ?auto_16835 ?auto_16847 ) ) ( not ( = ?auto_16835 ?auto_16852 ) ) ( not ( = ?auto_16835 ?auto_16853 ) ) ( not ( = ?auto_16835 ?auto_16841 ) ) ( not ( = ?auto_16835 ?auto_16858 ) ) ( not ( = ?auto_16844 ?auto_16834 ) ) ( not ( = ?auto_16844 ?auto_16838 ) ) ( not ( = ?auto_16844 ?auto_16837 ) ) ( not ( = ?auto_16844 ?auto_16856 ) ) ( not ( = ?auto_16844 ?auto_16836 ) ) ( not ( = ?auto_16844 ?auto_16850 ) ) ( not ( = ?auto_16840 ?auto_16833 ) ) ( not ( = ?auto_16840 ?auto_16859 ) ) ( not ( = ?auto_16840 ?auto_16846 ) ) ( not ( = ?auto_16840 ?auto_16855 ) ) ( not ( = ?auto_16840 ?auto_16848 ) ) ( not ( = ?auto_16840 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16821 ) ) ( not ( = ?auto_16815 ?auto_16860 ) ) ( not ( = ?auto_16816 ?auto_16821 ) ) ( not ( = ?auto_16816 ?auto_16860 ) ) ( not ( = ?auto_16817 ?auto_16821 ) ) ( not ( = ?auto_16817 ?auto_16860 ) ) ( not ( = ?auto_16818 ?auto_16821 ) ) ( not ( = ?auto_16818 ?auto_16860 ) ) ( not ( = ?auto_16819 ?auto_16821 ) ) ( not ( = ?auto_16819 ?auto_16860 ) ) ( not ( = ?auto_16820 ?auto_16821 ) ) ( not ( = ?auto_16820 ?auto_16860 ) ) ( not ( = ?auto_16823 ?auto_16821 ) ) ( not ( = ?auto_16823 ?auto_16860 ) ) ( not ( = ?auto_16821 ?auto_16840 ) ) ( not ( = ?auto_16821 ?auto_16833 ) ) ( not ( = ?auto_16821 ?auto_16859 ) ) ( not ( = ?auto_16821 ?auto_16846 ) ) ( not ( = ?auto_16821 ?auto_16855 ) ) ( not ( = ?auto_16821 ?auto_16848 ) ) ( not ( = ?auto_16821 ?auto_16851 ) ) ( not ( = ?auto_16849 ?auto_16835 ) ) ( not ( = ?auto_16849 ?auto_16854 ) ) ( not ( = ?auto_16849 ?auto_16847 ) ) ( not ( = ?auto_16849 ?auto_16852 ) ) ( not ( = ?auto_16849 ?auto_16853 ) ) ( not ( = ?auto_16849 ?auto_16841 ) ) ( not ( = ?auto_16849 ?auto_16858 ) ) ( not ( = ?auto_16842 ?auto_16844 ) ) ( not ( = ?auto_16842 ?auto_16834 ) ) ( not ( = ?auto_16842 ?auto_16838 ) ) ( not ( = ?auto_16842 ?auto_16837 ) ) ( not ( = ?auto_16842 ?auto_16856 ) ) ( not ( = ?auto_16842 ?auto_16836 ) ) ( not ( = ?auto_16842 ?auto_16850 ) ) ( not ( = ?auto_16860 ?auto_16840 ) ) ( not ( = ?auto_16860 ?auto_16833 ) ) ( not ( = ?auto_16860 ?auto_16859 ) ) ( not ( = ?auto_16860 ?auto_16846 ) ) ( not ( = ?auto_16860 ?auto_16855 ) ) ( not ( = ?auto_16860 ?auto_16848 ) ) ( not ( = ?auto_16860 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16824 ) ) ( not ( = ?auto_16815 ?auto_16857 ) ) ( not ( = ?auto_16816 ?auto_16824 ) ) ( not ( = ?auto_16816 ?auto_16857 ) ) ( not ( = ?auto_16817 ?auto_16824 ) ) ( not ( = ?auto_16817 ?auto_16857 ) ) ( not ( = ?auto_16818 ?auto_16824 ) ) ( not ( = ?auto_16818 ?auto_16857 ) ) ( not ( = ?auto_16819 ?auto_16824 ) ) ( not ( = ?auto_16819 ?auto_16857 ) ) ( not ( = ?auto_16820 ?auto_16824 ) ) ( not ( = ?auto_16820 ?auto_16857 ) ) ( not ( = ?auto_16823 ?auto_16824 ) ) ( not ( = ?auto_16823 ?auto_16857 ) ) ( not ( = ?auto_16822 ?auto_16824 ) ) ( not ( = ?auto_16822 ?auto_16857 ) ) ( not ( = ?auto_16824 ?auto_16860 ) ) ( not ( = ?auto_16824 ?auto_16840 ) ) ( not ( = ?auto_16824 ?auto_16833 ) ) ( not ( = ?auto_16824 ?auto_16859 ) ) ( not ( = ?auto_16824 ?auto_16846 ) ) ( not ( = ?auto_16824 ?auto_16855 ) ) ( not ( = ?auto_16824 ?auto_16848 ) ) ( not ( = ?auto_16824 ?auto_16851 ) ) ( not ( = ?auto_16845 ?auto_16849 ) ) ( not ( = ?auto_16845 ?auto_16835 ) ) ( not ( = ?auto_16845 ?auto_16854 ) ) ( not ( = ?auto_16845 ?auto_16847 ) ) ( not ( = ?auto_16845 ?auto_16852 ) ) ( not ( = ?auto_16845 ?auto_16853 ) ) ( not ( = ?auto_16845 ?auto_16841 ) ) ( not ( = ?auto_16845 ?auto_16858 ) ) ( not ( = ?auto_16839 ?auto_16842 ) ) ( not ( = ?auto_16839 ?auto_16844 ) ) ( not ( = ?auto_16839 ?auto_16834 ) ) ( not ( = ?auto_16839 ?auto_16838 ) ) ( not ( = ?auto_16839 ?auto_16837 ) ) ( not ( = ?auto_16839 ?auto_16856 ) ) ( not ( = ?auto_16839 ?auto_16836 ) ) ( not ( = ?auto_16839 ?auto_16850 ) ) ( not ( = ?auto_16857 ?auto_16860 ) ) ( not ( = ?auto_16857 ?auto_16840 ) ) ( not ( = ?auto_16857 ?auto_16833 ) ) ( not ( = ?auto_16857 ?auto_16859 ) ) ( not ( = ?auto_16857 ?auto_16846 ) ) ( not ( = ?auto_16857 ?auto_16855 ) ) ( not ( = ?auto_16857 ?auto_16848 ) ) ( not ( = ?auto_16857 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16826 ) ) ( not ( = ?auto_16815 ?auto_16843 ) ) ( not ( = ?auto_16816 ?auto_16826 ) ) ( not ( = ?auto_16816 ?auto_16843 ) ) ( not ( = ?auto_16817 ?auto_16826 ) ) ( not ( = ?auto_16817 ?auto_16843 ) ) ( not ( = ?auto_16818 ?auto_16826 ) ) ( not ( = ?auto_16818 ?auto_16843 ) ) ( not ( = ?auto_16819 ?auto_16826 ) ) ( not ( = ?auto_16819 ?auto_16843 ) ) ( not ( = ?auto_16820 ?auto_16826 ) ) ( not ( = ?auto_16820 ?auto_16843 ) ) ( not ( = ?auto_16823 ?auto_16826 ) ) ( not ( = ?auto_16823 ?auto_16843 ) ) ( not ( = ?auto_16822 ?auto_16826 ) ) ( not ( = ?auto_16822 ?auto_16843 ) ) ( not ( = ?auto_16821 ?auto_16826 ) ) ( not ( = ?auto_16821 ?auto_16843 ) ) ( not ( = ?auto_16826 ?auto_16857 ) ) ( not ( = ?auto_16826 ?auto_16860 ) ) ( not ( = ?auto_16826 ?auto_16840 ) ) ( not ( = ?auto_16826 ?auto_16833 ) ) ( not ( = ?auto_16826 ?auto_16859 ) ) ( not ( = ?auto_16826 ?auto_16846 ) ) ( not ( = ?auto_16826 ?auto_16855 ) ) ( not ( = ?auto_16826 ?auto_16848 ) ) ( not ( = ?auto_16826 ?auto_16851 ) ) ( not ( = ?auto_16843 ?auto_16857 ) ) ( not ( = ?auto_16843 ?auto_16860 ) ) ( not ( = ?auto_16843 ?auto_16840 ) ) ( not ( = ?auto_16843 ?auto_16833 ) ) ( not ( = ?auto_16843 ?auto_16859 ) ) ( not ( = ?auto_16843 ?auto_16846 ) ) ( not ( = ?auto_16843 ?auto_16855 ) ) ( not ( = ?auto_16843 ?auto_16848 ) ) ( not ( = ?auto_16843 ?auto_16851 ) ) ( not ( = ?auto_16815 ?auto_16825 ) ) ( not ( = ?auto_16815 ?auto_16829 ) ) ( not ( = ?auto_16816 ?auto_16825 ) ) ( not ( = ?auto_16816 ?auto_16829 ) ) ( not ( = ?auto_16817 ?auto_16825 ) ) ( not ( = ?auto_16817 ?auto_16829 ) ) ( not ( = ?auto_16818 ?auto_16825 ) ) ( not ( = ?auto_16818 ?auto_16829 ) ) ( not ( = ?auto_16819 ?auto_16825 ) ) ( not ( = ?auto_16819 ?auto_16829 ) ) ( not ( = ?auto_16820 ?auto_16825 ) ) ( not ( = ?auto_16820 ?auto_16829 ) ) ( not ( = ?auto_16823 ?auto_16825 ) ) ( not ( = ?auto_16823 ?auto_16829 ) ) ( not ( = ?auto_16822 ?auto_16825 ) ) ( not ( = ?auto_16822 ?auto_16829 ) ) ( not ( = ?auto_16821 ?auto_16825 ) ) ( not ( = ?auto_16821 ?auto_16829 ) ) ( not ( = ?auto_16824 ?auto_16825 ) ) ( not ( = ?auto_16824 ?auto_16829 ) ) ( not ( = ?auto_16825 ?auto_16843 ) ) ( not ( = ?auto_16825 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16860 ) ) ( not ( = ?auto_16825 ?auto_16840 ) ) ( not ( = ?auto_16825 ?auto_16833 ) ) ( not ( = ?auto_16825 ?auto_16859 ) ) ( not ( = ?auto_16825 ?auto_16846 ) ) ( not ( = ?auto_16825 ?auto_16855 ) ) ( not ( = ?auto_16825 ?auto_16848 ) ) ( not ( = ?auto_16825 ?auto_16851 ) ) ( not ( = ?auto_16828 ?auto_16845 ) ) ( not ( = ?auto_16828 ?auto_16849 ) ) ( not ( = ?auto_16828 ?auto_16835 ) ) ( not ( = ?auto_16828 ?auto_16854 ) ) ( not ( = ?auto_16828 ?auto_16847 ) ) ( not ( = ?auto_16828 ?auto_16852 ) ) ( not ( = ?auto_16828 ?auto_16853 ) ) ( not ( = ?auto_16828 ?auto_16841 ) ) ( not ( = ?auto_16828 ?auto_16858 ) ) ( not ( = ?auto_16832 ?auto_16839 ) ) ( not ( = ?auto_16832 ?auto_16842 ) ) ( not ( = ?auto_16832 ?auto_16844 ) ) ( not ( = ?auto_16832 ?auto_16834 ) ) ( not ( = ?auto_16832 ?auto_16838 ) ) ( not ( = ?auto_16832 ?auto_16837 ) ) ( not ( = ?auto_16832 ?auto_16856 ) ) ( not ( = ?auto_16832 ?auto_16836 ) ) ( not ( = ?auto_16832 ?auto_16850 ) ) ( not ( = ?auto_16829 ?auto_16843 ) ) ( not ( = ?auto_16829 ?auto_16857 ) ) ( not ( = ?auto_16829 ?auto_16860 ) ) ( not ( = ?auto_16829 ?auto_16840 ) ) ( not ( = ?auto_16829 ?auto_16833 ) ) ( not ( = ?auto_16829 ?auto_16859 ) ) ( not ( = ?auto_16829 ?auto_16846 ) ) ( not ( = ?auto_16829 ?auto_16855 ) ) ( not ( = ?auto_16829 ?auto_16848 ) ) ( not ( = ?auto_16829 ?auto_16851 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 ?auto_16819 ?auto_16820 ?auto_16823 ?auto_16822 ?auto_16821 ?auto_16824 ?auto_16826 )
      ( MAKE-1CRATE ?auto_16826 ?auto_16825 )
      ( MAKE-11CRATE-VERIFY ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 ?auto_16819 ?auto_16820 ?auto_16823 ?auto_16822 ?auto_16821 ?auto_16824 ?auto_16826 ?auto_16825 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16863 - SURFACE
      ?auto_16864 - SURFACE
    )
    :vars
    (
      ?auto_16865 - HOIST
      ?auto_16866 - PLACE
      ?auto_16868 - PLACE
      ?auto_16869 - HOIST
      ?auto_16870 - SURFACE
      ?auto_16867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16865 ?auto_16866 ) ( SURFACE-AT ?auto_16863 ?auto_16866 ) ( CLEAR ?auto_16863 ) ( IS-CRATE ?auto_16864 ) ( AVAILABLE ?auto_16865 ) ( not ( = ?auto_16868 ?auto_16866 ) ) ( HOIST-AT ?auto_16869 ?auto_16868 ) ( AVAILABLE ?auto_16869 ) ( SURFACE-AT ?auto_16864 ?auto_16868 ) ( ON ?auto_16864 ?auto_16870 ) ( CLEAR ?auto_16864 ) ( TRUCK-AT ?auto_16867 ?auto_16866 ) ( not ( = ?auto_16863 ?auto_16864 ) ) ( not ( = ?auto_16863 ?auto_16870 ) ) ( not ( = ?auto_16864 ?auto_16870 ) ) ( not ( = ?auto_16865 ?auto_16869 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16867 ?auto_16866 ?auto_16868 )
      ( !LIFT ?auto_16869 ?auto_16864 ?auto_16870 ?auto_16868 )
      ( !LOAD ?auto_16869 ?auto_16864 ?auto_16867 ?auto_16868 )
      ( !DRIVE ?auto_16867 ?auto_16868 ?auto_16866 )
      ( !UNLOAD ?auto_16865 ?auto_16864 ?auto_16867 ?auto_16866 )
      ( !DROP ?auto_16865 ?auto_16864 ?auto_16863 ?auto_16866 )
      ( MAKE-1CRATE-VERIFY ?auto_16863 ?auto_16864 ) )
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
      ?auto_16892 - SURFACE
      ?auto_16891 - SURFACE
      ?auto_16890 - SURFACE
      ?auto_16893 - SURFACE
      ?auto_16895 - SURFACE
      ?auto_16894 - SURFACE
      ?auto_16896 - SURFACE
    )
    :vars
    (
      ?auto_16901 - HOIST
      ?auto_16900 - PLACE
      ?auto_16899 - PLACE
      ?auto_16902 - HOIST
      ?auto_16897 - SURFACE
      ?auto_16926 - SURFACE
      ?auto_16919 - PLACE
      ?auto_16915 - HOIST
      ?auto_16930 - SURFACE
      ?auto_16913 - SURFACE
      ?auto_16914 - PLACE
      ?auto_16929 - HOIST
      ?auto_16910 - SURFACE
      ?auto_16912 - PLACE
      ?auto_16921 - HOIST
      ?auto_16918 - SURFACE
      ?auto_16920 - PLACE
      ?auto_16922 - HOIST
      ?auto_16908 - SURFACE
      ?auto_16905 - PLACE
      ?auto_16927 - HOIST
      ?auto_16928 - SURFACE
      ?auto_16904 - PLACE
      ?auto_16924 - HOIST
      ?auto_16923 - SURFACE
      ?auto_16931 - PLACE
      ?auto_16911 - HOIST
      ?auto_16909 - SURFACE
      ?auto_16925 - PLACE
      ?auto_16907 - HOIST
      ?auto_16903 - SURFACE
      ?auto_16917 - PLACE
      ?auto_16916 - HOIST
      ?auto_16906 - SURFACE
      ?auto_16898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16901 ?auto_16900 ) ( IS-CRATE ?auto_16896 ) ( not ( = ?auto_16899 ?auto_16900 ) ) ( HOIST-AT ?auto_16902 ?auto_16899 ) ( SURFACE-AT ?auto_16896 ?auto_16899 ) ( ON ?auto_16896 ?auto_16897 ) ( CLEAR ?auto_16896 ) ( not ( = ?auto_16894 ?auto_16896 ) ) ( not ( = ?auto_16894 ?auto_16897 ) ) ( not ( = ?auto_16896 ?auto_16897 ) ) ( not ( = ?auto_16901 ?auto_16902 ) ) ( IS-CRATE ?auto_16894 ) ( AVAILABLE ?auto_16902 ) ( SURFACE-AT ?auto_16894 ?auto_16899 ) ( ON ?auto_16894 ?auto_16926 ) ( CLEAR ?auto_16894 ) ( not ( = ?auto_16895 ?auto_16894 ) ) ( not ( = ?auto_16895 ?auto_16926 ) ) ( not ( = ?auto_16894 ?auto_16926 ) ) ( IS-CRATE ?auto_16895 ) ( not ( = ?auto_16919 ?auto_16900 ) ) ( HOIST-AT ?auto_16915 ?auto_16919 ) ( SURFACE-AT ?auto_16895 ?auto_16919 ) ( ON ?auto_16895 ?auto_16930 ) ( CLEAR ?auto_16895 ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16930 ) ) ( not ( = ?auto_16895 ?auto_16930 ) ) ( not ( = ?auto_16901 ?auto_16915 ) ) ( IS-CRATE ?auto_16893 ) ( AVAILABLE ?auto_16915 ) ( SURFACE-AT ?auto_16893 ?auto_16919 ) ( ON ?auto_16893 ?auto_16913 ) ( CLEAR ?auto_16893 ) ( not ( = ?auto_16890 ?auto_16893 ) ) ( not ( = ?auto_16890 ?auto_16913 ) ) ( not ( = ?auto_16893 ?auto_16913 ) ) ( IS-CRATE ?auto_16890 ) ( not ( = ?auto_16914 ?auto_16900 ) ) ( HOIST-AT ?auto_16929 ?auto_16914 ) ( AVAILABLE ?auto_16929 ) ( SURFACE-AT ?auto_16890 ?auto_16914 ) ( ON ?auto_16890 ?auto_16910 ) ( CLEAR ?auto_16890 ) ( not ( = ?auto_16891 ?auto_16890 ) ) ( not ( = ?auto_16891 ?auto_16910 ) ) ( not ( = ?auto_16890 ?auto_16910 ) ) ( not ( = ?auto_16901 ?auto_16929 ) ) ( IS-CRATE ?auto_16891 ) ( not ( = ?auto_16912 ?auto_16900 ) ) ( HOIST-AT ?auto_16921 ?auto_16912 ) ( AVAILABLE ?auto_16921 ) ( SURFACE-AT ?auto_16891 ?auto_16912 ) ( ON ?auto_16891 ?auto_16918 ) ( CLEAR ?auto_16891 ) ( not ( = ?auto_16892 ?auto_16891 ) ) ( not ( = ?auto_16892 ?auto_16918 ) ) ( not ( = ?auto_16891 ?auto_16918 ) ) ( not ( = ?auto_16901 ?auto_16921 ) ) ( IS-CRATE ?auto_16892 ) ( not ( = ?auto_16920 ?auto_16900 ) ) ( HOIST-AT ?auto_16922 ?auto_16920 ) ( AVAILABLE ?auto_16922 ) ( SURFACE-AT ?auto_16892 ?auto_16920 ) ( ON ?auto_16892 ?auto_16908 ) ( CLEAR ?auto_16892 ) ( not ( = ?auto_16889 ?auto_16892 ) ) ( not ( = ?auto_16889 ?auto_16908 ) ) ( not ( = ?auto_16892 ?auto_16908 ) ) ( not ( = ?auto_16901 ?auto_16922 ) ) ( IS-CRATE ?auto_16889 ) ( not ( = ?auto_16905 ?auto_16900 ) ) ( HOIST-AT ?auto_16927 ?auto_16905 ) ( AVAILABLE ?auto_16927 ) ( SURFACE-AT ?auto_16889 ?auto_16905 ) ( ON ?auto_16889 ?auto_16928 ) ( CLEAR ?auto_16889 ) ( not ( = ?auto_16888 ?auto_16889 ) ) ( not ( = ?auto_16888 ?auto_16928 ) ) ( not ( = ?auto_16889 ?auto_16928 ) ) ( not ( = ?auto_16901 ?auto_16927 ) ) ( IS-CRATE ?auto_16888 ) ( not ( = ?auto_16904 ?auto_16900 ) ) ( HOIST-AT ?auto_16924 ?auto_16904 ) ( AVAILABLE ?auto_16924 ) ( SURFACE-AT ?auto_16888 ?auto_16904 ) ( ON ?auto_16888 ?auto_16923 ) ( CLEAR ?auto_16888 ) ( not ( = ?auto_16887 ?auto_16888 ) ) ( not ( = ?auto_16887 ?auto_16923 ) ) ( not ( = ?auto_16888 ?auto_16923 ) ) ( not ( = ?auto_16901 ?auto_16924 ) ) ( IS-CRATE ?auto_16887 ) ( not ( = ?auto_16931 ?auto_16900 ) ) ( HOIST-AT ?auto_16911 ?auto_16931 ) ( AVAILABLE ?auto_16911 ) ( SURFACE-AT ?auto_16887 ?auto_16931 ) ( ON ?auto_16887 ?auto_16909 ) ( CLEAR ?auto_16887 ) ( not ( = ?auto_16886 ?auto_16887 ) ) ( not ( = ?auto_16886 ?auto_16909 ) ) ( not ( = ?auto_16887 ?auto_16909 ) ) ( not ( = ?auto_16901 ?auto_16911 ) ) ( IS-CRATE ?auto_16886 ) ( not ( = ?auto_16925 ?auto_16900 ) ) ( HOIST-AT ?auto_16907 ?auto_16925 ) ( AVAILABLE ?auto_16907 ) ( SURFACE-AT ?auto_16886 ?auto_16925 ) ( ON ?auto_16886 ?auto_16903 ) ( CLEAR ?auto_16886 ) ( not ( = ?auto_16885 ?auto_16886 ) ) ( not ( = ?auto_16885 ?auto_16903 ) ) ( not ( = ?auto_16886 ?auto_16903 ) ) ( not ( = ?auto_16901 ?auto_16907 ) ) ( SURFACE-AT ?auto_16884 ?auto_16900 ) ( CLEAR ?auto_16884 ) ( IS-CRATE ?auto_16885 ) ( AVAILABLE ?auto_16901 ) ( not ( = ?auto_16917 ?auto_16900 ) ) ( HOIST-AT ?auto_16916 ?auto_16917 ) ( AVAILABLE ?auto_16916 ) ( SURFACE-AT ?auto_16885 ?auto_16917 ) ( ON ?auto_16885 ?auto_16906 ) ( CLEAR ?auto_16885 ) ( TRUCK-AT ?auto_16898 ?auto_16900 ) ( not ( = ?auto_16884 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16906 ) ) ( not ( = ?auto_16885 ?auto_16906 ) ) ( not ( = ?auto_16901 ?auto_16916 ) ) ( not ( = ?auto_16884 ?auto_16886 ) ) ( not ( = ?auto_16884 ?auto_16903 ) ) ( not ( = ?auto_16886 ?auto_16906 ) ) ( not ( = ?auto_16925 ?auto_16917 ) ) ( not ( = ?auto_16907 ?auto_16916 ) ) ( not ( = ?auto_16903 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16887 ) ) ( not ( = ?auto_16884 ?auto_16909 ) ) ( not ( = ?auto_16885 ?auto_16887 ) ) ( not ( = ?auto_16885 ?auto_16909 ) ) ( not ( = ?auto_16887 ?auto_16903 ) ) ( not ( = ?auto_16887 ?auto_16906 ) ) ( not ( = ?auto_16931 ?auto_16925 ) ) ( not ( = ?auto_16931 ?auto_16917 ) ) ( not ( = ?auto_16911 ?auto_16907 ) ) ( not ( = ?auto_16911 ?auto_16916 ) ) ( not ( = ?auto_16909 ?auto_16903 ) ) ( not ( = ?auto_16909 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16888 ) ) ( not ( = ?auto_16884 ?auto_16923 ) ) ( not ( = ?auto_16885 ?auto_16888 ) ) ( not ( = ?auto_16885 ?auto_16923 ) ) ( not ( = ?auto_16886 ?auto_16888 ) ) ( not ( = ?auto_16886 ?auto_16923 ) ) ( not ( = ?auto_16888 ?auto_16909 ) ) ( not ( = ?auto_16888 ?auto_16903 ) ) ( not ( = ?auto_16888 ?auto_16906 ) ) ( not ( = ?auto_16904 ?auto_16931 ) ) ( not ( = ?auto_16904 ?auto_16925 ) ) ( not ( = ?auto_16904 ?auto_16917 ) ) ( not ( = ?auto_16924 ?auto_16911 ) ) ( not ( = ?auto_16924 ?auto_16907 ) ) ( not ( = ?auto_16924 ?auto_16916 ) ) ( not ( = ?auto_16923 ?auto_16909 ) ) ( not ( = ?auto_16923 ?auto_16903 ) ) ( not ( = ?auto_16923 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16889 ) ) ( not ( = ?auto_16884 ?auto_16928 ) ) ( not ( = ?auto_16885 ?auto_16889 ) ) ( not ( = ?auto_16885 ?auto_16928 ) ) ( not ( = ?auto_16886 ?auto_16889 ) ) ( not ( = ?auto_16886 ?auto_16928 ) ) ( not ( = ?auto_16887 ?auto_16889 ) ) ( not ( = ?auto_16887 ?auto_16928 ) ) ( not ( = ?auto_16889 ?auto_16923 ) ) ( not ( = ?auto_16889 ?auto_16909 ) ) ( not ( = ?auto_16889 ?auto_16903 ) ) ( not ( = ?auto_16889 ?auto_16906 ) ) ( not ( = ?auto_16905 ?auto_16904 ) ) ( not ( = ?auto_16905 ?auto_16931 ) ) ( not ( = ?auto_16905 ?auto_16925 ) ) ( not ( = ?auto_16905 ?auto_16917 ) ) ( not ( = ?auto_16927 ?auto_16924 ) ) ( not ( = ?auto_16927 ?auto_16911 ) ) ( not ( = ?auto_16927 ?auto_16907 ) ) ( not ( = ?auto_16927 ?auto_16916 ) ) ( not ( = ?auto_16928 ?auto_16923 ) ) ( not ( = ?auto_16928 ?auto_16909 ) ) ( not ( = ?auto_16928 ?auto_16903 ) ) ( not ( = ?auto_16928 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16892 ) ) ( not ( = ?auto_16884 ?auto_16908 ) ) ( not ( = ?auto_16885 ?auto_16892 ) ) ( not ( = ?auto_16885 ?auto_16908 ) ) ( not ( = ?auto_16886 ?auto_16892 ) ) ( not ( = ?auto_16886 ?auto_16908 ) ) ( not ( = ?auto_16887 ?auto_16892 ) ) ( not ( = ?auto_16887 ?auto_16908 ) ) ( not ( = ?auto_16888 ?auto_16892 ) ) ( not ( = ?auto_16888 ?auto_16908 ) ) ( not ( = ?auto_16892 ?auto_16928 ) ) ( not ( = ?auto_16892 ?auto_16923 ) ) ( not ( = ?auto_16892 ?auto_16909 ) ) ( not ( = ?auto_16892 ?auto_16903 ) ) ( not ( = ?auto_16892 ?auto_16906 ) ) ( not ( = ?auto_16920 ?auto_16905 ) ) ( not ( = ?auto_16920 ?auto_16904 ) ) ( not ( = ?auto_16920 ?auto_16931 ) ) ( not ( = ?auto_16920 ?auto_16925 ) ) ( not ( = ?auto_16920 ?auto_16917 ) ) ( not ( = ?auto_16922 ?auto_16927 ) ) ( not ( = ?auto_16922 ?auto_16924 ) ) ( not ( = ?auto_16922 ?auto_16911 ) ) ( not ( = ?auto_16922 ?auto_16907 ) ) ( not ( = ?auto_16922 ?auto_16916 ) ) ( not ( = ?auto_16908 ?auto_16928 ) ) ( not ( = ?auto_16908 ?auto_16923 ) ) ( not ( = ?auto_16908 ?auto_16909 ) ) ( not ( = ?auto_16908 ?auto_16903 ) ) ( not ( = ?auto_16908 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16891 ) ) ( not ( = ?auto_16884 ?auto_16918 ) ) ( not ( = ?auto_16885 ?auto_16891 ) ) ( not ( = ?auto_16885 ?auto_16918 ) ) ( not ( = ?auto_16886 ?auto_16891 ) ) ( not ( = ?auto_16886 ?auto_16918 ) ) ( not ( = ?auto_16887 ?auto_16891 ) ) ( not ( = ?auto_16887 ?auto_16918 ) ) ( not ( = ?auto_16888 ?auto_16891 ) ) ( not ( = ?auto_16888 ?auto_16918 ) ) ( not ( = ?auto_16889 ?auto_16891 ) ) ( not ( = ?auto_16889 ?auto_16918 ) ) ( not ( = ?auto_16891 ?auto_16908 ) ) ( not ( = ?auto_16891 ?auto_16928 ) ) ( not ( = ?auto_16891 ?auto_16923 ) ) ( not ( = ?auto_16891 ?auto_16909 ) ) ( not ( = ?auto_16891 ?auto_16903 ) ) ( not ( = ?auto_16891 ?auto_16906 ) ) ( not ( = ?auto_16912 ?auto_16920 ) ) ( not ( = ?auto_16912 ?auto_16905 ) ) ( not ( = ?auto_16912 ?auto_16904 ) ) ( not ( = ?auto_16912 ?auto_16931 ) ) ( not ( = ?auto_16912 ?auto_16925 ) ) ( not ( = ?auto_16912 ?auto_16917 ) ) ( not ( = ?auto_16921 ?auto_16922 ) ) ( not ( = ?auto_16921 ?auto_16927 ) ) ( not ( = ?auto_16921 ?auto_16924 ) ) ( not ( = ?auto_16921 ?auto_16911 ) ) ( not ( = ?auto_16921 ?auto_16907 ) ) ( not ( = ?auto_16921 ?auto_16916 ) ) ( not ( = ?auto_16918 ?auto_16908 ) ) ( not ( = ?auto_16918 ?auto_16928 ) ) ( not ( = ?auto_16918 ?auto_16923 ) ) ( not ( = ?auto_16918 ?auto_16909 ) ) ( not ( = ?auto_16918 ?auto_16903 ) ) ( not ( = ?auto_16918 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16890 ) ) ( not ( = ?auto_16884 ?auto_16910 ) ) ( not ( = ?auto_16885 ?auto_16890 ) ) ( not ( = ?auto_16885 ?auto_16910 ) ) ( not ( = ?auto_16886 ?auto_16890 ) ) ( not ( = ?auto_16886 ?auto_16910 ) ) ( not ( = ?auto_16887 ?auto_16890 ) ) ( not ( = ?auto_16887 ?auto_16910 ) ) ( not ( = ?auto_16888 ?auto_16890 ) ) ( not ( = ?auto_16888 ?auto_16910 ) ) ( not ( = ?auto_16889 ?auto_16890 ) ) ( not ( = ?auto_16889 ?auto_16910 ) ) ( not ( = ?auto_16892 ?auto_16890 ) ) ( not ( = ?auto_16892 ?auto_16910 ) ) ( not ( = ?auto_16890 ?auto_16918 ) ) ( not ( = ?auto_16890 ?auto_16908 ) ) ( not ( = ?auto_16890 ?auto_16928 ) ) ( not ( = ?auto_16890 ?auto_16923 ) ) ( not ( = ?auto_16890 ?auto_16909 ) ) ( not ( = ?auto_16890 ?auto_16903 ) ) ( not ( = ?auto_16890 ?auto_16906 ) ) ( not ( = ?auto_16914 ?auto_16912 ) ) ( not ( = ?auto_16914 ?auto_16920 ) ) ( not ( = ?auto_16914 ?auto_16905 ) ) ( not ( = ?auto_16914 ?auto_16904 ) ) ( not ( = ?auto_16914 ?auto_16931 ) ) ( not ( = ?auto_16914 ?auto_16925 ) ) ( not ( = ?auto_16914 ?auto_16917 ) ) ( not ( = ?auto_16929 ?auto_16921 ) ) ( not ( = ?auto_16929 ?auto_16922 ) ) ( not ( = ?auto_16929 ?auto_16927 ) ) ( not ( = ?auto_16929 ?auto_16924 ) ) ( not ( = ?auto_16929 ?auto_16911 ) ) ( not ( = ?auto_16929 ?auto_16907 ) ) ( not ( = ?auto_16929 ?auto_16916 ) ) ( not ( = ?auto_16910 ?auto_16918 ) ) ( not ( = ?auto_16910 ?auto_16908 ) ) ( not ( = ?auto_16910 ?auto_16928 ) ) ( not ( = ?auto_16910 ?auto_16923 ) ) ( not ( = ?auto_16910 ?auto_16909 ) ) ( not ( = ?auto_16910 ?auto_16903 ) ) ( not ( = ?auto_16910 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16893 ) ) ( not ( = ?auto_16884 ?auto_16913 ) ) ( not ( = ?auto_16885 ?auto_16893 ) ) ( not ( = ?auto_16885 ?auto_16913 ) ) ( not ( = ?auto_16886 ?auto_16893 ) ) ( not ( = ?auto_16886 ?auto_16913 ) ) ( not ( = ?auto_16887 ?auto_16893 ) ) ( not ( = ?auto_16887 ?auto_16913 ) ) ( not ( = ?auto_16888 ?auto_16893 ) ) ( not ( = ?auto_16888 ?auto_16913 ) ) ( not ( = ?auto_16889 ?auto_16893 ) ) ( not ( = ?auto_16889 ?auto_16913 ) ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16913 ) ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16913 ) ) ( not ( = ?auto_16893 ?auto_16910 ) ) ( not ( = ?auto_16893 ?auto_16918 ) ) ( not ( = ?auto_16893 ?auto_16908 ) ) ( not ( = ?auto_16893 ?auto_16928 ) ) ( not ( = ?auto_16893 ?auto_16923 ) ) ( not ( = ?auto_16893 ?auto_16909 ) ) ( not ( = ?auto_16893 ?auto_16903 ) ) ( not ( = ?auto_16893 ?auto_16906 ) ) ( not ( = ?auto_16919 ?auto_16914 ) ) ( not ( = ?auto_16919 ?auto_16912 ) ) ( not ( = ?auto_16919 ?auto_16920 ) ) ( not ( = ?auto_16919 ?auto_16905 ) ) ( not ( = ?auto_16919 ?auto_16904 ) ) ( not ( = ?auto_16919 ?auto_16931 ) ) ( not ( = ?auto_16919 ?auto_16925 ) ) ( not ( = ?auto_16919 ?auto_16917 ) ) ( not ( = ?auto_16915 ?auto_16929 ) ) ( not ( = ?auto_16915 ?auto_16921 ) ) ( not ( = ?auto_16915 ?auto_16922 ) ) ( not ( = ?auto_16915 ?auto_16927 ) ) ( not ( = ?auto_16915 ?auto_16924 ) ) ( not ( = ?auto_16915 ?auto_16911 ) ) ( not ( = ?auto_16915 ?auto_16907 ) ) ( not ( = ?auto_16915 ?auto_16916 ) ) ( not ( = ?auto_16913 ?auto_16910 ) ) ( not ( = ?auto_16913 ?auto_16918 ) ) ( not ( = ?auto_16913 ?auto_16908 ) ) ( not ( = ?auto_16913 ?auto_16928 ) ) ( not ( = ?auto_16913 ?auto_16923 ) ) ( not ( = ?auto_16913 ?auto_16909 ) ) ( not ( = ?auto_16913 ?auto_16903 ) ) ( not ( = ?auto_16913 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16895 ) ) ( not ( = ?auto_16884 ?auto_16930 ) ) ( not ( = ?auto_16885 ?auto_16895 ) ) ( not ( = ?auto_16885 ?auto_16930 ) ) ( not ( = ?auto_16886 ?auto_16895 ) ) ( not ( = ?auto_16886 ?auto_16930 ) ) ( not ( = ?auto_16887 ?auto_16895 ) ) ( not ( = ?auto_16887 ?auto_16930 ) ) ( not ( = ?auto_16888 ?auto_16895 ) ) ( not ( = ?auto_16888 ?auto_16930 ) ) ( not ( = ?auto_16889 ?auto_16895 ) ) ( not ( = ?auto_16889 ?auto_16930 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16892 ?auto_16930 ) ) ( not ( = ?auto_16891 ?auto_16895 ) ) ( not ( = ?auto_16891 ?auto_16930 ) ) ( not ( = ?auto_16890 ?auto_16895 ) ) ( not ( = ?auto_16890 ?auto_16930 ) ) ( not ( = ?auto_16895 ?auto_16913 ) ) ( not ( = ?auto_16895 ?auto_16910 ) ) ( not ( = ?auto_16895 ?auto_16918 ) ) ( not ( = ?auto_16895 ?auto_16908 ) ) ( not ( = ?auto_16895 ?auto_16928 ) ) ( not ( = ?auto_16895 ?auto_16923 ) ) ( not ( = ?auto_16895 ?auto_16909 ) ) ( not ( = ?auto_16895 ?auto_16903 ) ) ( not ( = ?auto_16895 ?auto_16906 ) ) ( not ( = ?auto_16930 ?auto_16913 ) ) ( not ( = ?auto_16930 ?auto_16910 ) ) ( not ( = ?auto_16930 ?auto_16918 ) ) ( not ( = ?auto_16930 ?auto_16908 ) ) ( not ( = ?auto_16930 ?auto_16928 ) ) ( not ( = ?auto_16930 ?auto_16923 ) ) ( not ( = ?auto_16930 ?auto_16909 ) ) ( not ( = ?auto_16930 ?auto_16903 ) ) ( not ( = ?auto_16930 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16894 ) ) ( not ( = ?auto_16884 ?auto_16926 ) ) ( not ( = ?auto_16885 ?auto_16894 ) ) ( not ( = ?auto_16885 ?auto_16926 ) ) ( not ( = ?auto_16886 ?auto_16894 ) ) ( not ( = ?auto_16886 ?auto_16926 ) ) ( not ( = ?auto_16887 ?auto_16894 ) ) ( not ( = ?auto_16887 ?auto_16926 ) ) ( not ( = ?auto_16888 ?auto_16894 ) ) ( not ( = ?auto_16888 ?auto_16926 ) ) ( not ( = ?auto_16889 ?auto_16894 ) ) ( not ( = ?auto_16889 ?auto_16926 ) ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16926 ) ) ( not ( = ?auto_16891 ?auto_16894 ) ) ( not ( = ?auto_16891 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16894 ) ) ( not ( = ?auto_16890 ?auto_16926 ) ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16926 ) ) ( not ( = ?auto_16894 ?auto_16930 ) ) ( not ( = ?auto_16894 ?auto_16913 ) ) ( not ( = ?auto_16894 ?auto_16910 ) ) ( not ( = ?auto_16894 ?auto_16918 ) ) ( not ( = ?auto_16894 ?auto_16908 ) ) ( not ( = ?auto_16894 ?auto_16928 ) ) ( not ( = ?auto_16894 ?auto_16923 ) ) ( not ( = ?auto_16894 ?auto_16909 ) ) ( not ( = ?auto_16894 ?auto_16903 ) ) ( not ( = ?auto_16894 ?auto_16906 ) ) ( not ( = ?auto_16899 ?auto_16919 ) ) ( not ( = ?auto_16899 ?auto_16914 ) ) ( not ( = ?auto_16899 ?auto_16912 ) ) ( not ( = ?auto_16899 ?auto_16920 ) ) ( not ( = ?auto_16899 ?auto_16905 ) ) ( not ( = ?auto_16899 ?auto_16904 ) ) ( not ( = ?auto_16899 ?auto_16931 ) ) ( not ( = ?auto_16899 ?auto_16925 ) ) ( not ( = ?auto_16899 ?auto_16917 ) ) ( not ( = ?auto_16902 ?auto_16915 ) ) ( not ( = ?auto_16902 ?auto_16929 ) ) ( not ( = ?auto_16902 ?auto_16921 ) ) ( not ( = ?auto_16902 ?auto_16922 ) ) ( not ( = ?auto_16902 ?auto_16927 ) ) ( not ( = ?auto_16902 ?auto_16924 ) ) ( not ( = ?auto_16902 ?auto_16911 ) ) ( not ( = ?auto_16902 ?auto_16907 ) ) ( not ( = ?auto_16902 ?auto_16916 ) ) ( not ( = ?auto_16926 ?auto_16930 ) ) ( not ( = ?auto_16926 ?auto_16913 ) ) ( not ( = ?auto_16926 ?auto_16910 ) ) ( not ( = ?auto_16926 ?auto_16918 ) ) ( not ( = ?auto_16926 ?auto_16908 ) ) ( not ( = ?auto_16926 ?auto_16928 ) ) ( not ( = ?auto_16926 ?auto_16923 ) ) ( not ( = ?auto_16926 ?auto_16909 ) ) ( not ( = ?auto_16926 ?auto_16903 ) ) ( not ( = ?auto_16926 ?auto_16906 ) ) ( not ( = ?auto_16884 ?auto_16896 ) ) ( not ( = ?auto_16884 ?auto_16897 ) ) ( not ( = ?auto_16885 ?auto_16896 ) ) ( not ( = ?auto_16885 ?auto_16897 ) ) ( not ( = ?auto_16886 ?auto_16896 ) ) ( not ( = ?auto_16886 ?auto_16897 ) ) ( not ( = ?auto_16887 ?auto_16896 ) ) ( not ( = ?auto_16887 ?auto_16897 ) ) ( not ( = ?auto_16888 ?auto_16896 ) ) ( not ( = ?auto_16888 ?auto_16897 ) ) ( not ( = ?auto_16889 ?auto_16896 ) ) ( not ( = ?auto_16889 ?auto_16897 ) ) ( not ( = ?auto_16892 ?auto_16896 ) ) ( not ( = ?auto_16892 ?auto_16897 ) ) ( not ( = ?auto_16891 ?auto_16896 ) ) ( not ( = ?auto_16891 ?auto_16897 ) ) ( not ( = ?auto_16890 ?auto_16896 ) ) ( not ( = ?auto_16890 ?auto_16897 ) ) ( not ( = ?auto_16893 ?auto_16896 ) ) ( not ( = ?auto_16893 ?auto_16897 ) ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16897 ) ) ( not ( = ?auto_16896 ?auto_16926 ) ) ( not ( = ?auto_16896 ?auto_16930 ) ) ( not ( = ?auto_16896 ?auto_16913 ) ) ( not ( = ?auto_16896 ?auto_16910 ) ) ( not ( = ?auto_16896 ?auto_16918 ) ) ( not ( = ?auto_16896 ?auto_16908 ) ) ( not ( = ?auto_16896 ?auto_16928 ) ) ( not ( = ?auto_16896 ?auto_16923 ) ) ( not ( = ?auto_16896 ?auto_16909 ) ) ( not ( = ?auto_16896 ?auto_16903 ) ) ( not ( = ?auto_16896 ?auto_16906 ) ) ( not ( = ?auto_16897 ?auto_16926 ) ) ( not ( = ?auto_16897 ?auto_16930 ) ) ( not ( = ?auto_16897 ?auto_16913 ) ) ( not ( = ?auto_16897 ?auto_16910 ) ) ( not ( = ?auto_16897 ?auto_16918 ) ) ( not ( = ?auto_16897 ?auto_16908 ) ) ( not ( = ?auto_16897 ?auto_16928 ) ) ( not ( = ?auto_16897 ?auto_16923 ) ) ( not ( = ?auto_16897 ?auto_16909 ) ) ( not ( = ?auto_16897 ?auto_16903 ) ) ( not ( = ?auto_16897 ?auto_16906 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16884 ?auto_16885 ?auto_16886 ?auto_16887 ?auto_16888 ?auto_16889 ?auto_16892 ?auto_16891 ?auto_16890 ?auto_16893 ?auto_16895 ?auto_16894 )
      ( MAKE-1CRATE ?auto_16894 ?auto_16896 )
      ( MAKE-12CRATE-VERIFY ?auto_16884 ?auto_16885 ?auto_16886 ?auto_16887 ?auto_16888 ?auto_16889 ?auto_16892 ?auto_16891 ?auto_16890 ?auto_16893 ?auto_16895 ?auto_16894 ?auto_16896 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16934 - SURFACE
      ?auto_16935 - SURFACE
    )
    :vars
    (
      ?auto_16936 - HOIST
      ?auto_16937 - PLACE
      ?auto_16939 - PLACE
      ?auto_16940 - HOIST
      ?auto_16941 - SURFACE
      ?auto_16938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16936 ?auto_16937 ) ( SURFACE-AT ?auto_16934 ?auto_16937 ) ( CLEAR ?auto_16934 ) ( IS-CRATE ?auto_16935 ) ( AVAILABLE ?auto_16936 ) ( not ( = ?auto_16939 ?auto_16937 ) ) ( HOIST-AT ?auto_16940 ?auto_16939 ) ( AVAILABLE ?auto_16940 ) ( SURFACE-AT ?auto_16935 ?auto_16939 ) ( ON ?auto_16935 ?auto_16941 ) ( CLEAR ?auto_16935 ) ( TRUCK-AT ?auto_16938 ?auto_16937 ) ( not ( = ?auto_16934 ?auto_16935 ) ) ( not ( = ?auto_16934 ?auto_16941 ) ) ( not ( = ?auto_16935 ?auto_16941 ) ) ( not ( = ?auto_16936 ?auto_16940 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16938 ?auto_16937 ?auto_16939 )
      ( !LIFT ?auto_16940 ?auto_16935 ?auto_16941 ?auto_16939 )
      ( !LOAD ?auto_16940 ?auto_16935 ?auto_16938 ?auto_16939 )
      ( !DRIVE ?auto_16938 ?auto_16939 ?auto_16937 )
      ( !UNLOAD ?auto_16936 ?auto_16935 ?auto_16938 ?auto_16937 )
      ( !DROP ?auto_16936 ?auto_16935 ?auto_16934 ?auto_16937 )
      ( MAKE-1CRATE-VERIFY ?auto_16934 ?auto_16935 ) )
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
      ?auto_16964 - SURFACE
      ?auto_16963 - SURFACE
      ?auto_16962 - SURFACE
      ?auto_16965 - SURFACE
      ?auto_16967 - SURFACE
      ?auto_16966 - SURFACE
      ?auto_16968 - SURFACE
      ?auto_16969 - SURFACE
    )
    :vars
    (
      ?auto_16974 - HOIST
      ?auto_16970 - PLACE
      ?auto_16973 - PLACE
      ?auto_16975 - HOIST
      ?auto_16971 - SURFACE
      ?auto_16990 - PLACE
      ?auto_17004 - HOIST
      ?auto_16987 - SURFACE
      ?auto_17005 - SURFACE
      ?auto_17006 - PLACE
      ?auto_16991 - HOIST
      ?auto_16999 - SURFACE
      ?auto_16992 - SURFACE
      ?auto_16994 - PLACE
      ?auto_16978 - HOIST
      ?auto_17007 - SURFACE
      ?auto_16988 - PLACE
      ?auto_16985 - HOIST
      ?auto_16995 - SURFACE
      ?auto_16981 - PLACE
      ?auto_16979 - HOIST
      ?auto_17002 - SURFACE
      ?auto_17001 - PLACE
      ?auto_17003 - HOIST
      ?auto_16980 - SURFACE
      ?auto_16996 - PLACE
      ?auto_16989 - HOIST
      ?auto_16993 - SURFACE
      ?auto_16976 - PLACE
      ?auto_16997 - HOIST
      ?auto_16998 - SURFACE
      ?auto_16982 - PLACE
      ?auto_16977 - HOIST
      ?auto_16984 - SURFACE
      ?auto_16983 - PLACE
      ?auto_16986 - HOIST
      ?auto_17000 - SURFACE
      ?auto_16972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16974 ?auto_16970 ) ( IS-CRATE ?auto_16969 ) ( not ( = ?auto_16973 ?auto_16970 ) ) ( HOIST-AT ?auto_16975 ?auto_16973 ) ( AVAILABLE ?auto_16975 ) ( SURFACE-AT ?auto_16969 ?auto_16973 ) ( ON ?auto_16969 ?auto_16971 ) ( CLEAR ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16969 ) ) ( not ( = ?auto_16968 ?auto_16971 ) ) ( not ( = ?auto_16969 ?auto_16971 ) ) ( not ( = ?auto_16974 ?auto_16975 ) ) ( IS-CRATE ?auto_16968 ) ( not ( = ?auto_16990 ?auto_16970 ) ) ( HOIST-AT ?auto_17004 ?auto_16990 ) ( SURFACE-AT ?auto_16968 ?auto_16990 ) ( ON ?auto_16968 ?auto_16987 ) ( CLEAR ?auto_16968 ) ( not ( = ?auto_16966 ?auto_16968 ) ) ( not ( = ?auto_16966 ?auto_16987 ) ) ( not ( = ?auto_16968 ?auto_16987 ) ) ( not ( = ?auto_16974 ?auto_17004 ) ) ( IS-CRATE ?auto_16966 ) ( AVAILABLE ?auto_17004 ) ( SURFACE-AT ?auto_16966 ?auto_16990 ) ( ON ?auto_16966 ?auto_17005 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16967 ?auto_16966 ) ) ( not ( = ?auto_16967 ?auto_17005 ) ) ( not ( = ?auto_16966 ?auto_17005 ) ) ( IS-CRATE ?auto_16967 ) ( not ( = ?auto_17006 ?auto_16970 ) ) ( HOIST-AT ?auto_16991 ?auto_17006 ) ( SURFACE-AT ?auto_16967 ?auto_17006 ) ( ON ?auto_16967 ?auto_16999 ) ( CLEAR ?auto_16967 ) ( not ( = ?auto_16965 ?auto_16967 ) ) ( not ( = ?auto_16965 ?auto_16999 ) ) ( not ( = ?auto_16967 ?auto_16999 ) ) ( not ( = ?auto_16974 ?auto_16991 ) ) ( IS-CRATE ?auto_16965 ) ( AVAILABLE ?auto_16991 ) ( SURFACE-AT ?auto_16965 ?auto_17006 ) ( ON ?auto_16965 ?auto_16992 ) ( CLEAR ?auto_16965 ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16992 ) ) ( not ( = ?auto_16965 ?auto_16992 ) ) ( IS-CRATE ?auto_16962 ) ( not ( = ?auto_16994 ?auto_16970 ) ) ( HOIST-AT ?auto_16978 ?auto_16994 ) ( AVAILABLE ?auto_16978 ) ( SURFACE-AT ?auto_16962 ?auto_16994 ) ( ON ?auto_16962 ?auto_17007 ) ( CLEAR ?auto_16962 ) ( not ( = ?auto_16963 ?auto_16962 ) ) ( not ( = ?auto_16963 ?auto_17007 ) ) ( not ( = ?auto_16962 ?auto_17007 ) ) ( not ( = ?auto_16974 ?auto_16978 ) ) ( IS-CRATE ?auto_16963 ) ( not ( = ?auto_16988 ?auto_16970 ) ) ( HOIST-AT ?auto_16985 ?auto_16988 ) ( AVAILABLE ?auto_16985 ) ( SURFACE-AT ?auto_16963 ?auto_16988 ) ( ON ?auto_16963 ?auto_16995 ) ( CLEAR ?auto_16963 ) ( not ( = ?auto_16964 ?auto_16963 ) ) ( not ( = ?auto_16964 ?auto_16995 ) ) ( not ( = ?auto_16963 ?auto_16995 ) ) ( not ( = ?auto_16974 ?auto_16985 ) ) ( IS-CRATE ?auto_16964 ) ( not ( = ?auto_16981 ?auto_16970 ) ) ( HOIST-AT ?auto_16979 ?auto_16981 ) ( AVAILABLE ?auto_16979 ) ( SURFACE-AT ?auto_16964 ?auto_16981 ) ( ON ?auto_16964 ?auto_17002 ) ( CLEAR ?auto_16964 ) ( not ( = ?auto_16961 ?auto_16964 ) ) ( not ( = ?auto_16961 ?auto_17002 ) ) ( not ( = ?auto_16964 ?auto_17002 ) ) ( not ( = ?auto_16974 ?auto_16979 ) ) ( IS-CRATE ?auto_16961 ) ( not ( = ?auto_17001 ?auto_16970 ) ) ( HOIST-AT ?auto_17003 ?auto_17001 ) ( AVAILABLE ?auto_17003 ) ( SURFACE-AT ?auto_16961 ?auto_17001 ) ( ON ?auto_16961 ?auto_16980 ) ( CLEAR ?auto_16961 ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16980 ) ) ( not ( = ?auto_16961 ?auto_16980 ) ) ( not ( = ?auto_16974 ?auto_17003 ) ) ( IS-CRATE ?auto_16960 ) ( not ( = ?auto_16996 ?auto_16970 ) ) ( HOIST-AT ?auto_16989 ?auto_16996 ) ( AVAILABLE ?auto_16989 ) ( SURFACE-AT ?auto_16960 ?auto_16996 ) ( ON ?auto_16960 ?auto_16993 ) ( CLEAR ?auto_16960 ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_16993 ) ) ( not ( = ?auto_16960 ?auto_16993 ) ) ( not ( = ?auto_16974 ?auto_16989 ) ) ( IS-CRATE ?auto_16959 ) ( not ( = ?auto_16976 ?auto_16970 ) ) ( HOIST-AT ?auto_16997 ?auto_16976 ) ( AVAILABLE ?auto_16997 ) ( SURFACE-AT ?auto_16959 ?auto_16976 ) ( ON ?auto_16959 ?auto_16998 ) ( CLEAR ?auto_16959 ) ( not ( = ?auto_16958 ?auto_16959 ) ) ( not ( = ?auto_16958 ?auto_16998 ) ) ( not ( = ?auto_16959 ?auto_16998 ) ) ( not ( = ?auto_16974 ?auto_16997 ) ) ( IS-CRATE ?auto_16958 ) ( not ( = ?auto_16982 ?auto_16970 ) ) ( HOIST-AT ?auto_16977 ?auto_16982 ) ( AVAILABLE ?auto_16977 ) ( SURFACE-AT ?auto_16958 ?auto_16982 ) ( ON ?auto_16958 ?auto_16984 ) ( CLEAR ?auto_16958 ) ( not ( = ?auto_16957 ?auto_16958 ) ) ( not ( = ?auto_16957 ?auto_16984 ) ) ( not ( = ?auto_16958 ?auto_16984 ) ) ( not ( = ?auto_16974 ?auto_16977 ) ) ( SURFACE-AT ?auto_16956 ?auto_16970 ) ( CLEAR ?auto_16956 ) ( IS-CRATE ?auto_16957 ) ( AVAILABLE ?auto_16974 ) ( not ( = ?auto_16983 ?auto_16970 ) ) ( HOIST-AT ?auto_16986 ?auto_16983 ) ( AVAILABLE ?auto_16986 ) ( SURFACE-AT ?auto_16957 ?auto_16983 ) ( ON ?auto_16957 ?auto_17000 ) ( CLEAR ?auto_16957 ) ( TRUCK-AT ?auto_16972 ?auto_16970 ) ( not ( = ?auto_16956 ?auto_16957 ) ) ( not ( = ?auto_16956 ?auto_17000 ) ) ( not ( = ?auto_16957 ?auto_17000 ) ) ( not ( = ?auto_16974 ?auto_16986 ) ) ( not ( = ?auto_16956 ?auto_16958 ) ) ( not ( = ?auto_16956 ?auto_16984 ) ) ( not ( = ?auto_16958 ?auto_17000 ) ) ( not ( = ?auto_16982 ?auto_16983 ) ) ( not ( = ?auto_16977 ?auto_16986 ) ) ( not ( = ?auto_16984 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16998 ) ) ( not ( = ?auto_16957 ?auto_16959 ) ) ( not ( = ?auto_16957 ?auto_16998 ) ) ( not ( = ?auto_16959 ?auto_16984 ) ) ( not ( = ?auto_16959 ?auto_17000 ) ) ( not ( = ?auto_16976 ?auto_16982 ) ) ( not ( = ?auto_16976 ?auto_16983 ) ) ( not ( = ?auto_16997 ?auto_16977 ) ) ( not ( = ?auto_16997 ?auto_16986 ) ) ( not ( = ?auto_16998 ?auto_16984 ) ) ( not ( = ?auto_16998 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16960 ) ) ( not ( = ?auto_16956 ?auto_16993 ) ) ( not ( = ?auto_16957 ?auto_16960 ) ) ( not ( = ?auto_16957 ?auto_16993 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( not ( = ?auto_16958 ?auto_16993 ) ) ( not ( = ?auto_16960 ?auto_16998 ) ) ( not ( = ?auto_16960 ?auto_16984 ) ) ( not ( = ?auto_16960 ?auto_17000 ) ) ( not ( = ?auto_16996 ?auto_16976 ) ) ( not ( = ?auto_16996 ?auto_16982 ) ) ( not ( = ?auto_16996 ?auto_16983 ) ) ( not ( = ?auto_16989 ?auto_16997 ) ) ( not ( = ?auto_16989 ?auto_16977 ) ) ( not ( = ?auto_16989 ?auto_16986 ) ) ( not ( = ?auto_16993 ?auto_16998 ) ) ( not ( = ?auto_16993 ?auto_16984 ) ) ( not ( = ?auto_16993 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16961 ) ) ( not ( = ?auto_16956 ?auto_16980 ) ) ( not ( = ?auto_16957 ?auto_16961 ) ) ( not ( = ?auto_16957 ?auto_16980 ) ) ( not ( = ?auto_16958 ?auto_16961 ) ) ( not ( = ?auto_16958 ?auto_16980 ) ) ( not ( = ?auto_16959 ?auto_16961 ) ) ( not ( = ?auto_16959 ?auto_16980 ) ) ( not ( = ?auto_16961 ?auto_16993 ) ) ( not ( = ?auto_16961 ?auto_16998 ) ) ( not ( = ?auto_16961 ?auto_16984 ) ) ( not ( = ?auto_16961 ?auto_17000 ) ) ( not ( = ?auto_17001 ?auto_16996 ) ) ( not ( = ?auto_17001 ?auto_16976 ) ) ( not ( = ?auto_17001 ?auto_16982 ) ) ( not ( = ?auto_17001 ?auto_16983 ) ) ( not ( = ?auto_17003 ?auto_16989 ) ) ( not ( = ?auto_17003 ?auto_16997 ) ) ( not ( = ?auto_17003 ?auto_16977 ) ) ( not ( = ?auto_17003 ?auto_16986 ) ) ( not ( = ?auto_16980 ?auto_16993 ) ) ( not ( = ?auto_16980 ?auto_16998 ) ) ( not ( = ?auto_16980 ?auto_16984 ) ) ( not ( = ?auto_16980 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16964 ) ) ( not ( = ?auto_16956 ?auto_17002 ) ) ( not ( = ?auto_16957 ?auto_16964 ) ) ( not ( = ?auto_16957 ?auto_17002 ) ) ( not ( = ?auto_16958 ?auto_16964 ) ) ( not ( = ?auto_16958 ?auto_17002 ) ) ( not ( = ?auto_16959 ?auto_16964 ) ) ( not ( = ?auto_16959 ?auto_17002 ) ) ( not ( = ?auto_16960 ?auto_16964 ) ) ( not ( = ?auto_16960 ?auto_17002 ) ) ( not ( = ?auto_16964 ?auto_16980 ) ) ( not ( = ?auto_16964 ?auto_16993 ) ) ( not ( = ?auto_16964 ?auto_16998 ) ) ( not ( = ?auto_16964 ?auto_16984 ) ) ( not ( = ?auto_16964 ?auto_17000 ) ) ( not ( = ?auto_16981 ?auto_17001 ) ) ( not ( = ?auto_16981 ?auto_16996 ) ) ( not ( = ?auto_16981 ?auto_16976 ) ) ( not ( = ?auto_16981 ?auto_16982 ) ) ( not ( = ?auto_16981 ?auto_16983 ) ) ( not ( = ?auto_16979 ?auto_17003 ) ) ( not ( = ?auto_16979 ?auto_16989 ) ) ( not ( = ?auto_16979 ?auto_16997 ) ) ( not ( = ?auto_16979 ?auto_16977 ) ) ( not ( = ?auto_16979 ?auto_16986 ) ) ( not ( = ?auto_17002 ?auto_16980 ) ) ( not ( = ?auto_17002 ?auto_16993 ) ) ( not ( = ?auto_17002 ?auto_16998 ) ) ( not ( = ?auto_17002 ?auto_16984 ) ) ( not ( = ?auto_17002 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16963 ) ) ( not ( = ?auto_16956 ?auto_16995 ) ) ( not ( = ?auto_16957 ?auto_16963 ) ) ( not ( = ?auto_16957 ?auto_16995 ) ) ( not ( = ?auto_16958 ?auto_16963 ) ) ( not ( = ?auto_16958 ?auto_16995 ) ) ( not ( = ?auto_16959 ?auto_16963 ) ) ( not ( = ?auto_16959 ?auto_16995 ) ) ( not ( = ?auto_16960 ?auto_16963 ) ) ( not ( = ?auto_16960 ?auto_16995 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_16995 ) ) ( not ( = ?auto_16963 ?auto_17002 ) ) ( not ( = ?auto_16963 ?auto_16980 ) ) ( not ( = ?auto_16963 ?auto_16993 ) ) ( not ( = ?auto_16963 ?auto_16998 ) ) ( not ( = ?auto_16963 ?auto_16984 ) ) ( not ( = ?auto_16963 ?auto_17000 ) ) ( not ( = ?auto_16988 ?auto_16981 ) ) ( not ( = ?auto_16988 ?auto_17001 ) ) ( not ( = ?auto_16988 ?auto_16996 ) ) ( not ( = ?auto_16988 ?auto_16976 ) ) ( not ( = ?auto_16988 ?auto_16982 ) ) ( not ( = ?auto_16988 ?auto_16983 ) ) ( not ( = ?auto_16985 ?auto_16979 ) ) ( not ( = ?auto_16985 ?auto_17003 ) ) ( not ( = ?auto_16985 ?auto_16989 ) ) ( not ( = ?auto_16985 ?auto_16997 ) ) ( not ( = ?auto_16985 ?auto_16977 ) ) ( not ( = ?auto_16985 ?auto_16986 ) ) ( not ( = ?auto_16995 ?auto_17002 ) ) ( not ( = ?auto_16995 ?auto_16980 ) ) ( not ( = ?auto_16995 ?auto_16993 ) ) ( not ( = ?auto_16995 ?auto_16998 ) ) ( not ( = ?auto_16995 ?auto_16984 ) ) ( not ( = ?auto_16995 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16962 ) ) ( not ( = ?auto_16956 ?auto_17007 ) ) ( not ( = ?auto_16957 ?auto_16962 ) ) ( not ( = ?auto_16957 ?auto_17007 ) ) ( not ( = ?auto_16958 ?auto_16962 ) ) ( not ( = ?auto_16958 ?auto_17007 ) ) ( not ( = ?auto_16959 ?auto_16962 ) ) ( not ( = ?auto_16959 ?auto_17007 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_17007 ) ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( not ( = ?auto_16961 ?auto_17007 ) ) ( not ( = ?auto_16964 ?auto_16962 ) ) ( not ( = ?auto_16964 ?auto_17007 ) ) ( not ( = ?auto_16962 ?auto_16995 ) ) ( not ( = ?auto_16962 ?auto_17002 ) ) ( not ( = ?auto_16962 ?auto_16980 ) ) ( not ( = ?auto_16962 ?auto_16993 ) ) ( not ( = ?auto_16962 ?auto_16998 ) ) ( not ( = ?auto_16962 ?auto_16984 ) ) ( not ( = ?auto_16962 ?auto_17000 ) ) ( not ( = ?auto_16994 ?auto_16988 ) ) ( not ( = ?auto_16994 ?auto_16981 ) ) ( not ( = ?auto_16994 ?auto_17001 ) ) ( not ( = ?auto_16994 ?auto_16996 ) ) ( not ( = ?auto_16994 ?auto_16976 ) ) ( not ( = ?auto_16994 ?auto_16982 ) ) ( not ( = ?auto_16994 ?auto_16983 ) ) ( not ( = ?auto_16978 ?auto_16985 ) ) ( not ( = ?auto_16978 ?auto_16979 ) ) ( not ( = ?auto_16978 ?auto_17003 ) ) ( not ( = ?auto_16978 ?auto_16989 ) ) ( not ( = ?auto_16978 ?auto_16997 ) ) ( not ( = ?auto_16978 ?auto_16977 ) ) ( not ( = ?auto_16978 ?auto_16986 ) ) ( not ( = ?auto_17007 ?auto_16995 ) ) ( not ( = ?auto_17007 ?auto_17002 ) ) ( not ( = ?auto_17007 ?auto_16980 ) ) ( not ( = ?auto_17007 ?auto_16993 ) ) ( not ( = ?auto_17007 ?auto_16998 ) ) ( not ( = ?auto_17007 ?auto_16984 ) ) ( not ( = ?auto_17007 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16965 ) ) ( not ( = ?auto_16956 ?auto_16992 ) ) ( not ( = ?auto_16957 ?auto_16965 ) ) ( not ( = ?auto_16957 ?auto_16992 ) ) ( not ( = ?auto_16958 ?auto_16965 ) ) ( not ( = ?auto_16958 ?auto_16992 ) ) ( not ( = ?auto_16959 ?auto_16965 ) ) ( not ( = ?auto_16959 ?auto_16992 ) ) ( not ( = ?auto_16960 ?auto_16965 ) ) ( not ( = ?auto_16960 ?auto_16992 ) ) ( not ( = ?auto_16961 ?auto_16965 ) ) ( not ( = ?auto_16961 ?auto_16992 ) ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16992 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16992 ) ) ( not ( = ?auto_16965 ?auto_17007 ) ) ( not ( = ?auto_16965 ?auto_16995 ) ) ( not ( = ?auto_16965 ?auto_17002 ) ) ( not ( = ?auto_16965 ?auto_16980 ) ) ( not ( = ?auto_16965 ?auto_16993 ) ) ( not ( = ?auto_16965 ?auto_16998 ) ) ( not ( = ?auto_16965 ?auto_16984 ) ) ( not ( = ?auto_16965 ?auto_17000 ) ) ( not ( = ?auto_17006 ?auto_16994 ) ) ( not ( = ?auto_17006 ?auto_16988 ) ) ( not ( = ?auto_17006 ?auto_16981 ) ) ( not ( = ?auto_17006 ?auto_17001 ) ) ( not ( = ?auto_17006 ?auto_16996 ) ) ( not ( = ?auto_17006 ?auto_16976 ) ) ( not ( = ?auto_17006 ?auto_16982 ) ) ( not ( = ?auto_17006 ?auto_16983 ) ) ( not ( = ?auto_16991 ?auto_16978 ) ) ( not ( = ?auto_16991 ?auto_16985 ) ) ( not ( = ?auto_16991 ?auto_16979 ) ) ( not ( = ?auto_16991 ?auto_17003 ) ) ( not ( = ?auto_16991 ?auto_16989 ) ) ( not ( = ?auto_16991 ?auto_16997 ) ) ( not ( = ?auto_16991 ?auto_16977 ) ) ( not ( = ?auto_16991 ?auto_16986 ) ) ( not ( = ?auto_16992 ?auto_17007 ) ) ( not ( = ?auto_16992 ?auto_16995 ) ) ( not ( = ?auto_16992 ?auto_17002 ) ) ( not ( = ?auto_16992 ?auto_16980 ) ) ( not ( = ?auto_16992 ?auto_16993 ) ) ( not ( = ?auto_16992 ?auto_16998 ) ) ( not ( = ?auto_16992 ?auto_16984 ) ) ( not ( = ?auto_16992 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16967 ) ) ( not ( = ?auto_16956 ?auto_16999 ) ) ( not ( = ?auto_16957 ?auto_16967 ) ) ( not ( = ?auto_16957 ?auto_16999 ) ) ( not ( = ?auto_16958 ?auto_16967 ) ) ( not ( = ?auto_16958 ?auto_16999 ) ) ( not ( = ?auto_16959 ?auto_16967 ) ) ( not ( = ?auto_16959 ?auto_16999 ) ) ( not ( = ?auto_16960 ?auto_16967 ) ) ( not ( = ?auto_16960 ?auto_16999 ) ) ( not ( = ?auto_16961 ?auto_16967 ) ) ( not ( = ?auto_16961 ?auto_16999 ) ) ( not ( = ?auto_16964 ?auto_16967 ) ) ( not ( = ?auto_16964 ?auto_16999 ) ) ( not ( = ?auto_16963 ?auto_16967 ) ) ( not ( = ?auto_16963 ?auto_16999 ) ) ( not ( = ?auto_16962 ?auto_16967 ) ) ( not ( = ?auto_16962 ?auto_16999 ) ) ( not ( = ?auto_16967 ?auto_16992 ) ) ( not ( = ?auto_16967 ?auto_17007 ) ) ( not ( = ?auto_16967 ?auto_16995 ) ) ( not ( = ?auto_16967 ?auto_17002 ) ) ( not ( = ?auto_16967 ?auto_16980 ) ) ( not ( = ?auto_16967 ?auto_16993 ) ) ( not ( = ?auto_16967 ?auto_16998 ) ) ( not ( = ?auto_16967 ?auto_16984 ) ) ( not ( = ?auto_16967 ?auto_17000 ) ) ( not ( = ?auto_16999 ?auto_16992 ) ) ( not ( = ?auto_16999 ?auto_17007 ) ) ( not ( = ?auto_16999 ?auto_16995 ) ) ( not ( = ?auto_16999 ?auto_17002 ) ) ( not ( = ?auto_16999 ?auto_16980 ) ) ( not ( = ?auto_16999 ?auto_16993 ) ) ( not ( = ?auto_16999 ?auto_16998 ) ) ( not ( = ?auto_16999 ?auto_16984 ) ) ( not ( = ?auto_16999 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16966 ) ) ( not ( = ?auto_16956 ?auto_17005 ) ) ( not ( = ?auto_16957 ?auto_16966 ) ) ( not ( = ?auto_16957 ?auto_17005 ) ) ( not ( = ?auto_16958 ?auto_16966 ) ) ( not ( = ?auto_16958 ?auto_17005 ) ) ( not ( = ?auto_16959 ?auto_16966 ) ) ( not ( = ?auto_16959 ?auto_17005 ) ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( not ( = ?auto_16960 ?auto_17005 ) ) ( not ( = ?auto_16961 ?auto_16966 ) ) ( not ( = ?auto_16961 ?auto_17005 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16964 ?auto_17005 ) ) ( not ( = ?auto_16963 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_17005 ) ) ( not ( = ?auto_16962 ?auto_16966 ) ) ( not ( = ?auto_16962 ?auto_17005 ) ) ( not ( = ?auto_16965 ?auto_16966 ) ) ( not ( = ?auto_16965 ?auto_17005 ) ) ( not ( = ?auto_16966 ?auto_16999 ) ) ( not ( = ?auto_16966 ?auto_16992 ) ) ( not ( = ?auto_16966 ?auto_17007 ) ) ( not ( = ?auto_16966 ?auto_16995 ) ) ( not ( = ?auto_16966 ?auto_17002 ) ) ( not ( = ?auto_16966 ?auto_16980 ) ) ( not ( = ?auto_16966 ?auto_16993 ) ) ( not ( = ?auto_16966 ?auto_16998 ) ) ( not ( = ?auto_16966 ?auto_16984 ) ) ( not ( = ?auto_16966 ?auto_17000 ) ) ( not ( = ?auto_16990 ?auto_17006 ) ) ( not ( = ?auto_16990 ?auto_16994 ) ) ( not ( = ?auto_16990 ?auto_16988 ) ) ( not ( = ?auto_16990 ?auto_16981 ) ) ( not ( = ?auto_16990 ?auto_17001 ) ) ( not ( = ?auto_16990 ?auto_16996 ) ) ( not ( = ?auto_16990 ?auto_16976 ) ) ( not ( = ?auto_16990 ?auto_16982 ) ) ( not ( = ?auto_16990 ?auto_16983 ) ) ( not ( = ?auto_17004 ?auto_16991 ) ) ( not ( = ?auto_17004 ?auto_16978 ) ) ( not ( = ?auto_17004 ?auto_16985 ) ) ( not ( = ?auto_17004 ?auto_16979 ) ) ( not ( = ?auto_17004 ?auto_17003 ) ) ( not ( = ?auto_17004 ?auto_16989 ) ) ( not ( = ?auto_17004 ?auto_16997 ) ) ( not ( = ?auto_17004 ?auto_16977 ) ) ( not ( = ?auto_17004 ?auto_16986 ) ) ( not ( = ?auto_17005 ?auto_16999 ) ) ( not ( = ?auto_17005 ?auto_16992 ) ) ( not ( = ?auto_17005 ?auto_17007 ) ) ( not ( = ?auto_17005 ?auto_16995 ) ) ( not ( = ?auto_17005 ?auto_17002 ) ) ( not ( = ?auto_17005 ?auto_16980 ) ) ( not ( = ?auto_17005 ?auto_16993 ) ) ( not ( = ?auto_17005 ?auto_16998 ) ) ( not ( = ?auto_17005 ?auto_16984 ) ) ( not ( = ?auto_17005 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16968 ) ) ( not ( = ?auto_16956 ?auto_16987 ) ) ( not ( = ?auto_16957 ?auto_16968 ) ) ( not ( = ?auto_16957 ?auto_16987 ) ) ( not ( = ?auto_16958 ?auto_16968 ) ) ( not ( = ?auto_16958 ?auto_16987 ) ) ( not ( = ?auto_16959 ?auto_16968 ) ) ( not ( = ?auto_16959 ?auto_16987 ) ) ( not ( = ?auto_16960 ?auto_16968 ) ) ( not ( = ?auto_16960 ?auto_16987 ) ) ( not ( = ?auto_16961 ?auto_16968 ) ) ( not ( = ?auto_16961 ?auto_16987 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( not ( = ?auto_16964 ?auto_16987 ) ) ( not ( = ?auto_16963 ?auto_16968 ) ) ( not ( = ?auto_16963 ?auto_16987 ) ) ( not ( = ?auto_16962 ?auto_16968 ) ) ( not ( = ?auto_16962 ?auto_16987 ) ) ( not ( = ?auto_16965 ?auto_16968 ) ) ( not ( = ?auto_16965 ?auto_16987 ) ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16987 ) ) ( not ( = ?auto_16968 ?auto_17005 ) ) ( not ( = ?auto_16968 ?auto_16999 ) ) ( not ( = ?auto_16968 ?auto_16992 ) ) ( not ( = ?auto_16968 ?auto_17007 ) ) ( not ( = ?auto_16968 ?auto_16995 ) ) ( not ( = ?auto_16968 ?auto_17002 ) ) ( not ( = ?auto_16968 ?auto_16980 ) ) ( not ( = ?auto_16968 ?auto_16993 ) ) ( not ( = ?auto_16968 ?auto_16998 ) ) ( not ( = ?auto_16968 ?auto_16984 ) ) ( not ( = ?auto_16968 ?auto_17000 ) ) ( not ( = ?auto_16987 ?auto_17005 ) ) ( not ( = ?auto_16987 ?auto_16999 ) ) ( not ( = ?auto_16987 ?auto_16992 ) ) ( not ( = ?auto_16987 ?auto_17007 ) ) ( not ( = ?auto_16987 ?auto_16995 ) ) ( not ( = ?auto_16987 ?auto_17002 ) ) ( not ( = ?auto_16987 ?auto_16980 ) ) ( not ( = ?auto_16987 ?auto_16993 ) ) ( not ( = ?auto_16987 ?auto_16998 ) ) ( not ( = ?auto_16987 ?auto_16984 ) ) ( not ( = ?auto_16987 ?auto_17000 ) ) ( not ( = ?auto_16956 ?auto_16969 ) ) ( not ( = ?auto_16956 ?auto_16971 ) ) ( not ( = ?auto_16957 ?auto_16969 ) ) ( not ( = ?auto_16957 ?auto_16971 ) ) ( not ( = ?auto_16958 ?auto_16969 ) ) ( not ( = ?auto_16958 ?auto_16971 ) ) ( not ( = ?auto_16959 ?auto_16969 ) ) ( not ( = ?auto_16959 ?auto_16971 ) ) ( not ( = ?auto_16960 ?auto_16969 ) ) ( not ( = ?auto_16960 ?auto_16971 ) ) ( not ( = ?auto_16961 ?auto_16969 ) ) ( not ( = ?auto_16961 ?auto_16971 ) ) ( not ( = ?auto_16964 ?auto_16969 ) ) ( not ( = ?auto_16964 ?auto_16971 ) ) ( not ( = ?auto_16963 ?auto_16969 ) ) ( not ( = ?auto_16963 ?auto_16971 ) ) ( not ( = ?auto_16962 ?auto_16969 ) ) ( not ( = ?auto_16962 ?auto_16971 ) ) ( not ( = ?auto_16965 ?auto_16969 ) ) ( not ( = ?auto_16965 ?auto_16971 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16971 ) ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( not ( = ?auto_16966 ?auto_16971 ) ) ( not ( = ?auto_16969 ?auto_16987 ) ) ( not ( = ?auto_16969 ?auto_17005 ) ) ( not ( = ?auto_16969 ?auto_16999 ) ) ( not ( = ?auto_16969 ?auto_16992 ) ) ( not ( = ?auto_16969 ?auto_17007 ) ) ( not ( = ?auto_16969 ?auto_16995 ) ) ( not ( = ?auto_16969 ?auto_17002 ) ) ( not ( = ?auto_16969 ?auto_16980 ) ) ( not ( = ?auto_16969 ?auto_16993 ) ) ( not ( = ?auto_16969 ?auto_16998 ) ) ( not ( = ?auto_16969 ?auto_16984 ) ) ( not ( = ?auto_16969 ?auto_17000 ) ) ( not ( = ?auto_16973 ?auto_16990 ) ) ( not ( = ?auto_16973 ?auto_17006 ) ) ( not ( = ?auto_16973 ?auto_16994 ) ) ( not ( = ?auto_16973 ?auto_16988 ) ) ( not ( = ?auto_16973 ?auto_16981 ) ) ( not ( = ?auto_16973 ?auto_17001 ) ) ( not ( = ?auto_16973 ?auto_16996 ) ) ( not ( = ?auto_16973 ?auto_16976 ) ) ( not ( = ?auto_16973 ?auto_16982 ) ) ( not ( = ?auto_16973 ?auto_16983 ) ) ( not ( = ?auto_16975 ?auto_17004 ) ) ( not ( = ?auto_16975 ?auto_16991 ) ) ( not ( = ?auto_16975 ?auto_16978 ) ) ( not ( = ?auto_16975 ?auto_16985 ) ) ( not ( = ?auto_16975 ?auto_16979 ) ) ( not ( = ?auto_16975 ?auto_17003 ) ) ( not ( = ?auto_16975 ?auto_16989 ) ) ( not ( = ?auto_16975 ?auto_16997 ) ) ( not ( = ?auto_16975 ?auto_16977 ) ) ( not ( = ?auto_16975 ?auto_16986 ) ) ( not ( = ?auto_16971 ?auto_16987 ) ) ( not ( = ?auto_16971 ?auto_17005 ) ) ( not ( = ?auto_16971 ?auto_16999 ) ) ( not ( = ?auto_16971 ?auto_16992 ) ) ( not ( = ?auto_16971 ?auto_17007 ) ) ( not ( = ?auto_16971 ?auto_16995 ) ) ( not ( = ?auto_16971 ?auto_17002 ) ) ( not ( = ?auto_16971 ?auto_16980 ) ) ( not ( = ?auto_16971 ?auto_16993 ) ) ( not ( = ?auto_16971 ?auto_16998 ) ) ( not ( = ?auto_16971 ?auto_16984 ) ) ( not ( = ?auto_16971 ?auto_17000 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16956 ?auto_16957 ?auto_16958 ?auto_16959 ?auto_16960 ?auto_16961 ?auto_16964 ?auto_16963 ?auto_16962 ?auto_16965 ?auto_16967 ?auto_16966 ?auto_16968 )
      ( MAKE-1CRATE ?auto_16968 ?auto_16969 )
      ( MAKE-13CRATE-VERIFY ?auto_16956 ?auto_16957 ?auto_16958 ?auto_16959 ?auto_16960 ?auto_16961 ?auto_16964 ?auto_16963 ?auto_16962 ?auto_16965 ?auto_16967 ?auto_16966 ?auto_16968 ?auto_16969 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17010 - SURFACE
      ?auto_17011 - SURFACE
    )
    :vars
    (
      ?auto_17012 - HOIST
      ?auto_17013 - PLACE
      ?auto_17015 - PLACE
      ?auto_17016 - HOIST
      ?auto_17017 - SURFACE
      ?auto_17014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17012 ?auto_17013 ) ( SURFACE-AT ?auto_17010 ?auto_17013 ) ( CLEAR ?auto_17010 ) ( IS-CRATE ?auto_17011 ) ( AVAILABLE ?auto_17012 ) ( not ( = ?auto_17015 ?auto_17013 ) ) ( HOIST-AT ?auto_17016 ?auto_17015 ) ( AVAILABLE ?auto_17016 ) ( SURFACE-AT ?auto_17011 ?auto_17015 ) ( ON ?auto_17011 ?auto_17017 ) ( CLEAR ?auto_17011 ) ( TRUCK-AT ?auto_17014 ?auto_17013 ) ( not ( = ?auto_17010 ?auto_17011 ) ) ( not ( = ?auto_17010 ?auto_17017 ) ) ( not ( = ?auto_17011 ?auto_17017 ) ) ( not ( = ?auto_17012 ?auto_17016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17014 ?auto_17013 ?auto_17015 )
      ( !LIFT ?auto_17016 ?auto_17011 ?auto_17017 ?auto_17015 )
      ( !LOAD ?auto_17016 ?auto_17011 ?auto_17014 ?auto_17015 )
      ( !DRIVE ?auto_17014 ?auto_17015 ?auto_17013 )
      ( !UNLOAD ?auto_17012 ?auto_17011 ?auto_17014 ?auto_17013 )
      ( !DROP ?auto_17012 ?auto_17011 ?auto_17010 ?auto_17013 )
      ( MAKE-1CRATE-VERIFY ?auto_17010 ?auto_17011 ) )
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
      ?auto_17041 - SURFACE
      ?auto_17040 - SURFACE
      ?auto_17039 - SURFACE
      ?auto_17042 - SURFACE
      ?auto_17044 - SURFACE
      ?auto_17043 - SURFACE
      ?auto_17045 - SURFACE
      ?auto_17047 - SURFACE
      ?auto_17046 - SURFACE
    )
    :vars
    (
      ?auto_17052 - HOIST
      ?auto_17050 - PLACE
      ?auto_17051 - PLACE
      ?auto_17048 - HOIST
      ?auto_17053 - SURFACE
      ?auto_17057 - PLACE
      ?auto_17055 - HOIST
      ?auto_17074 - SURFACE
      ?auto_17064 - PLACE
      ?auto_17070 - HOIST
      ?auto_17056 - SURFACE
      ?auto_17077 - SURFACE
      ?auto_17068 - PLACE
      ?auto_17063 - HOIST
      ?auto_17082 - SURFACE
      ?auto_17061 - SURFACE
      ?auto_17078 - PLACE
      ?auto_17073 - HOIST
      ?auto_17072 - SURFACE
      ?auto_17062 - PLACE
      ?auto_17081 - HOIST
      ?auto_17071 - SURFACE
      ?auto_17079 - PLACE
      ?auto_17065 - HOIST
      ?auto_17069 - SURFACE
      ?auto_17084 - PLACE
      ?auto_17058 - HOIST
      ?auto_17066 - SURFACE
      ?auto_17076 - PLACE
      ?auto_17085 - HOIST
      ?auto_17083 - SURFACE
      ?auto_17054 - PLACE
      ?auto_17060 - HOIST
      ?auto_17080 - SURFACE
      ?auto_17059 - PLACE
      ?auto_17067 - HOIST
      ?auto_17086 - SURFACE
      ?auto_17075 - SURFACE
      ?auto_17049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17052 ?auto_17050 ) ( IS-CRATE ?auto_17046 ) ( not ( = ?auto_17051 ?auto_17050 ) ) ( HOIST-AT ?auto_17048 ?auto_17051 ) ( SURFACE-AT ?auto_17046 ?auto_17051 ) ( ON ?auto_17046 ?auto_17053 ) ( CLEAR ?auto_17046 ) ( not ( = ?auto_17047 ?auto_17046 ) ) ( not ( = ?auto_17047 ?auto_17053 ) ) ( not ( = ?auto_17046 ?auto_17053 ) ) ( not ( = ?auto_17052 ?auto_17048 ) ) ( IS-CRATE ?auto_17047 ) ( not ( = ?auto_17057 ?auto_17050 ) ) ( HOIST-AT ?auto_17055 ?auto_17057 ) ( AVAILABLE ?auto_17055 ) ( SURFACE-AT ?auto_17047 ?auto_17057 ) ( ON ?auto_17047 ?auto_17074 ) ( CLEAR ?auto_17047 ) ( not ( = ?auto_17045 ?auto_17047 ) ) ( not ( = ?auto_17045 ?auto_17074 ) ) ( not ( = ?auto_17047 ?auto_17074 ) ) ( not ( = ?auto_17052 ?auto_17055 ) ) ( IS-CRATE ?auto_17045 ) ( not ( = ?auto_17064 ?auto_17050 ) ) ( HOIST-AT ?auto_17070 ?auto_17064 ) ( SURFACE-AT ?auto_17045 ?auto_17064 ) ( ON ?auto_17045 ?auto_17056 ) ( CLEAR ?auto_17045 ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( not ( = ?auto_17043 ?auto_17056 ) ) ( not ( = ?auto_17045 ?auto_17056 ) ) ( not ( = ?auto_17052 ?auto_17070 ) ) ( IS-CRATE ?auto_17043 ) ( AVAILABLE ?auto_17070 ) ( SURFACE-AT ?auto_17043 ?auto_17064 ) ( ON ?auto_17043 ?auto_17077 ) ( CLEAR ?auto_17043 ) ( not ( = ?auto_17044 ?auto_17043 ) ) ( not ( = ?auto_17044 ?auto_17077 ) ) ( not ( = ?auto_17043 ?auto_17077 ) ) ( IS-CRATE ?auto_17044 ) ( not ( = ?auto_17068 ?auto_17050 ) ) ( HOIST-AT ?auto_17063 ?auto_17068 ) ( SURFACE-AT ?auto_17044 ?auto_17068 ) ( ON ?auto_17044 ?auto_17082 ) ( CLEAR ?auto_17044 ) ( not ( = ?auto_17042 ?auto_17044 ) ) ( not ( = ?auto_17042 ?auto_17082 ) ) ( not ( = ?auto_17044 ?auto_17082 ) ) ( not ( = ?auto_17052 ?auto_17063 ) ) ( IS-CRATE ?auto_17042 ) ( AVAILABLE ?auto_17063 ) ( SURFACE-AT ?auto_17042 ?auto_17068 ) ( ON ?auto_17042 ?auto_17061 ) ( CLEAR ?auto_17042 ) ( not ( = ?auto_17039 ?auto_17042 ) ) ( not ( = ?auto_17039 ?auto_17061 ) ) ( not ( = ?auto_17042 ?auto_17061 ) ) ( IS-CRATE ?auto_17039 ) ( not ( = ?auto_17078 ?auto_17050 ) ) ( HOIST-AT ?auto_17073 ?auto_17078 ) ( AVAILABLE ?auto_17073 ) ( SURFACE-AT ?auto_17039 ?auto_17078 ) ( ON ?auto_17039 ?auto_17072 ) ( CLEAR ?auto_17039 ) ( not ( = ?auto_17040 ?auto_17039 ) ) ( not ( = ?auto_17040 ?auto_17072 ) ) ( not ( = ?auto_17039 ?auto_17072 ) ) ( not ( = ?auto_17052 ?auto_17073 ) ) ( IS-CRATE ?auto_17040 ) ( not ( = ?auto_17062 ?auto_17050 ) ) ( HOIST-AT ?auto_17081 ?auto_17062 ) ( AVAILABLE ?auto_17081 ) ( SURFACE-AT ?auto_17040 ?auto_17062 ) ( ON ?auto_17040 ?auto_17071 ) ( CLEAR ?auto_17040 ) ( not ( = ?auto_17041 ?auto_17040 ) ) ( not ( = ?auto_17041 ?auto_17071 ) ) ( not ( = ?auto_17040 ?auto_17071 ) ) ( not ( = ?auto_17052 ?auto_17081 ) ) ( IS-CRATE ?auto_17041 ) ( not ( = ?auto_17079 ?auto_17050 ) ) ( HOIST-AT ?auto_17065 ?auto_17079 ) ( AVAILABLE ?auto_17065 ) ( SURFACE-AT ?auto_17041 ?auto_17079 ) ( ON ?auto_17041 ?auto_17069 ) ( CLEAR ?auto_17041 ) ( not ( = ?auto_17038 ?auto_17041 ) ) ( not ( = ?auto_17038 ?auto_17069 ) ) ( not ( = ?auto_17041 ?auto_17069 ) ) ( not ( = ?auto_17052 ?auto_17065 ) ) ( IS-CRATE ?auto_17038 ) ( not ( = ?auto_17084 ?auto_17050 ) ) ( HOIST-AT ?auto_17058 ?auto_17084 ) ( AVAILABLE ?auto_17058 ) ( SURFACE-AT ?auto_17038 ?auto_17084 ) ( ON ?auto_17038 ?auto_17066 ) ( CLEAR ?auto_17038 ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17037 ?auto_17066 ) ) ( not ( = ?auto_17038 ?auto_17066 ) ) ( not ( = ?auto_17052 ?auto_17058 ) ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17076 ?auto_17050 ) ) ( HOIST-AT ?auto_17085 ?auto_17076 ) ( AVAILABLE ?auto_17085 ) ( SURFACE-AT ?auto_17037 ?auto_17076 ) ( ON ?auto_17037 ?auto_17083 ) ( CLEAR ?auto_17037 ) ( not ( = ?auto_17036 ?auto_17037 ) ) ( not ( = ?auto_17036 ?auto_17083 ) ) ( not ( = ?auto_17037 ?auto_17083 ) ) ( not ( = ?auto_17052 ?auto_17085 ) ) ( IS-CRATE ?auto_17036 ) ( not ( = ?auto_17054 ?auto_17050 ) ) ( HOIST-AT ?auto_17060 ?auto_17054 ) ( AVAILABLE ?auto_17060 ) ( SURFACE-AT ?auto_17036 ?auto_17054 ) ( ON ?auto_17036 ?auto_17080 ) ( CLEAR ?auto_17036 ) ( not ( = ?auto_17035 ?auto_17036 ) ) ( not ( = ?auto_17035 ?auto_17080 ) ) ( not ( = ?auto_17036 ?auto_17080 ) ) ( not ( = ?auto_17052 ?auto_17060 ) ) ( IS-CRATE ?auto_17035 ) ( not ( = ?auto_17059 ?auto_17050 ) ) ( HOIST-AT ?auto_17067 ?auto_17059 ) ( AVAILABLE ?auto_17067 ) ( SURFACE-AT ?auto_17035 ?auto_17059 ) ( ON ?auto_17035 ?auto_17086 ) ( CLEAR ?auto_17035 ) ( not ( = ?auto_17034 ?auto_17035 ) ) ( not ( = ?auto_17034 ?auto_17086 ) ) ( not ( = ?auto_17035 ?auto_17086 ) ) ( not ( = ?auto_17052 ?auto_17067 ) ) ( SURFACE-AT ?auto_17033 ?auto_17050 ) ( CLEAR ?auto_17033 ) ( IS-CRATE ?auto_17034 ) ( AVAILABLE ?auto_17052 ) ( AVAILABLE ?auto_17048 ) ( SURFACE-AT ?auto_17034 ?auto_17051 ) ( ON ?auto_17034 ?auto_17075 ) ( CLEAR ?auto_17034 ) ( TRUCK-AT ?auto_17049 ?auto_17050 ) ( not ( = ?auto_17033 ?auto_17034 ) ) ( not ( = ?auto_17033 ?auto_17075 ) ) ( not ( = ?auto_17034 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17035 ) ) ( not ( = ?auto_17033 ?auto_17086 ) ) ( not ( = ?auto_17035 ?auto_17075 ) ) ( not ( = ?auto_17059 ?auto_17051 ) ) ( not ( = ?auto_17067 ?auto_17048 ) ) ( not ( = ?auto_17086 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17036 ) ) ( not ( = ?auto_17033 ?auto_17080 ) ) ( not ( = ?auto_17034 ?auto_17036 ) ) ( not ( = ?auto_17034 ?auto_17080 ) ) ( not ( = ?auto_17036 ?auto_17086 ) ) ( not ( = ?auto_17036 ?auto_17075 ) ) ( not ( = ?auto_17054 ?auto_17059 ) ) ( not ( = ?auto_17054 ?auto_17051 ) ) ( not ( = ?auto_17060 ?auto_17067 ) ) ( not ( = ?auto_17060 ?auto_17048 ) ) ( not ( = ?auto_17080 ?auto_17086 ) ) ( not ( = ?auto_17080 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17037 ) ) ( not ( = ?auto_17033 ?auto_17083 ) ) ( not ( = ?auto_17034 ?auto_17037 ) ) ( not ( = ?auto_17034 ?auto_17083 ) ) ( not ( = ?auto_17035 ?auto_17037 ) ) ( not ( = ?auto_17035 ?auto_17083 ) ) ( not ( = ?auto_17037 ?auto_17080 ) ) ( not ( = ?auto_17037 ?auto_17086 ) ) ( not ( = ?auto_17037 ?auto_17075 ) ) ( not ( = ?auto_17076 ?auto_17054 ) ) ( not ( = ?auto_17076 ?auto_17059 ) ) ( not ( = ?auto_17076 ?auto_17051 ) ) ( not ( = ?auto_17085 ?auto_17060 ) ) ( not ( = ?auto_17085 ?auto_17067 ) ) ( not ( = ?auto_17085 ?auto_17048 ) ) ( not ( = ?auto_17083 ?auto_17080 ) ) ( not ( = ?auto_17083 ?auto_17086 ) ) ( not ( = ?auto_17083 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17038 ) ) ( not ( = ?auto_17033 ?auto_17066 ) ) ( not ( = ?auto_17034 ?auto_17038 ) ) ( not ( = ?auto_17034 ?auto_17066 ) ) ( not ( = ?auto_17035 ?auto_17038 ) ) ( not ( = ?auto_17035 ?auto_17066 ) ) ( not ( = ?auto_17036 ?auto_17038 ) ) ( not ( = ?auto_17036 ?auto_17066 ) ) ( not ( = ?auto_17038 ?auto_17083 ) ) ( not ( = ?auto_17038 ?auto_17080 ) ) ( not ( = ?auto_17038 ?auto_17086 ) ) ( not ( = ?auto_17038 ?auto_17075 ) ) ( not ( = ?auto_17084 ?auto_17076 ) ) ( not ( = ?auto_17084 ?auto_17054 ) ) ( not ( = ?auto_17084 ?auto_17059 ) ) ( not ( = ?auto_17084 ?auto_17051 ) ) ( not ( = ?auto_17058 ?auto_17085 ) ) ( not ( = ?auto_17058 ?auto_17060 ) ) ( not ( = ?auto_17058 ?auto_17067 ) ) ( not ( = ?auto_17058 ?auto_17048 ) ) ( not ( = ?auto_17066 ?auto_17083 ) ) ( not ( = ?auto_17066 ?auto_17080 ) ) ( not ( = ?auto_17066 ?auto_17086 ) ) ( not ( = ?auto_17066 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17041 ) ) ( not ( = ?auto_17033 ?auto_17069 ) ) ( not ( = ?auto_17034 ?auto_17041 ) ) ( not ( = ?auto_17034 ?auto_17069 ) ) ( not ( = ?auto_17035 ?auto_17041 ) ) ( not ( = ?auto_17035 ?auto_17069 ) ) ( not ( = ?auto_17036 ?auto_17041 ) ) ( not ( = ?auto_17036 ?auto_17069 ) ) ( not ( = ?auto_17037 ?auto_17041 ) ) ( not ( = ?auto_17037 ?auto_17069 ) ) ( not ( = ?auto_17041 ?auto_17066 ) ) ( not ( = ?auto_17041 ?auto_17083 ) ) ( not ( = ?auto_17041 ?auto_17080 ) ) ( not ( = ?auto_17041 ?auto_17086 ) ) ( not ( = ?auto_17041 ?auto_17075 ) ) ( not ( = ?auto_17079 ?auto_17084 ) ) ( not ( = ?auto_17079 ?auto_17076 ) ) ( not ( = ?auto_17079 ?auto_17054 ) ) ( not ( = ?auto_17079 ?auto_17059 ) ) ( not ( = ?auto_17079 ?auto_17051 ) ) ( not ( = ?auto_17065 ?auto_17058 ) ) ( not ( = ?auto_17065 ?auto_17085 ) ) ( not ( = ?auto_17065 ?auto_17060 ) ) ( not ( = ?auto_17065 ?auto_17067 ) ) ( not ( = ?auto_17065 ?auto_17048 ) ) ( not ( = ?auto_17069 ?auto_17066 ) ) ( not ( = ?auto_17069 ?auto_17083 ) ) ( not ( = ?auto_17069 ?auto_17080 ) ) ( not ( = ?auto_17069 ?auto_17086 ) ) ( not ( = ?auto_17069 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17040 ) ) ( not ( = ?auto_17033 ?auto_17071 ) ) ( not ( = ?auto_17034 ?auto_17040 ) ) ( not ( = ?auto_17034 ?auto_17071 ) ) ( not ( = ?auto_17035 ?auto_17040 ) ) ( not ( = ?auto_17035 ?auto_17071 ) ) ( not ( = ?auto_17036 ?auto_17040 ) ) ( not ( = ?auto_17036 ?auto_17071 ) ) ( not ( = ?auto_17037 ?auto_17040 ) ) ( not ( = ?auto_17037 ?auto_17071 ) ) ( not ( = ?auto_17038 ?auto_17040 ) ) ( not ( = ?auto_17038 ?auto_17071 ) ) ( not ( = ?auto_17040 ?auto_17069 ) ) ( not ( = ?auto_17040 ?auto_17066 ) ) ( not ( = ?auto_17040 ?auto_17083 ) ) ( not ( = ?auto_17040 ?auto_17080 ) ) ( not ( = ?auto_17040 ?auto_17086 ) ) ( not ( = ?auto_17040 ?auto_17075 ) ) ( not ( = ?auto_17062 ?auto_17079 ) ) ( not ( = ?auto_17062 ?auto_17084 ) ) ( not ( = ?auto_17062 ?auto_17076 ) ) ( not ( = ?auto_17062 ?auto_17054 ) ) ( not ( = ?auto_17062 ?auto_17059 ) ) ( not ( = ?auto_17062 ?auto_17051 ) ) ( not ( = ?auto_17081 ?auto_17065 ) ) ( not ( = ?auto_17081 ?auto_17058 ) ) ( not ( = ?auto_17081 ?auto_17085 ) ) ( not ( = ?auto_17081 ?auto_17060 ) ) ( not ( = ?auto_17081 ?auto_17067 ) ) ( not ( = ?auto_17081 ?auto_17048 ) ) ( not ( = ?auto_17071 ?auto_17069 ) ) ( not ( = ?auto_17071 ?auto_17066 ) ) ( not ( = ?auto_17071 ?auto_17083 ) ) ( not ( = ?auto_17071 ?auto_17080 ) ) ( not ( = ?auto_17071 ?auto_17086 ) ) ( not ( = ?auto_17071 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17039 ) ) ( not ( = ?auto_17033 ?auto_17072 ) ) ( not ( = ?auto_17034 ?auto_17039 ) ) ( not ( = ?auto_17034 ?auto_17072 ) ) ( not ( = ?auto_17035 ?auto_17039 ) ) ( not ( = ?auto_17035 ?auto_17072 ) ) ( not ( = ?auto_17036 ?auto_17039 ) ) ( not ( = ?auto_17036 ?auto_17072 ) ) ( not ( = ?auto_17037 ?auto_17039 ) ) ( not ( = ?auto_17037 ?auto_17072 ) ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17072 ) ) ( not ( = ?auto_17041 ?auto_17039 ) ) ( not ( = ?auto_17041 ?auto_17072 ) ) ( not ( = ?auto_17039 ?auto_17071 ) ) ( not ( = ?auto_17039 ?auto_17069 ) ) ( not ( = ?auto_17039 ?auto_17066 ) ) ( not ( = ?auto_17039 ?auto_17083 ) ) ( not ( = ?auto_17039 ?auto_17080 ) ) ( not ( = ?auto_17039 ?auto_17086 ) ) ( not ( = ?auto_17039 ?auto_17075 ) ) ( not ( = ?auto_17078 ?auto_17062 ) ) ( not ( = ?auto_17078 ?auto_17079 ) ) ( not ( = ?auto_17078 ?auto_17084 ) ) ( not ( = ?auto_17078 ?auto_17076 ) ) ( not ( = ?auto_17078 ?auto_17054 ) ) ( not ( = ?auto_17078 ?auto_17059 ) ) ( not ( = ?auto_17078 ?auto_17051 ) ) ( not ( = ?auto_17073 ?auto_17081 ) ) ( not ( = ?auto_17073 ?auto_17065 ) ) ( not ( = ?auto_17073 ?auto_17058 ) ) ( not ( = ?auto_17073 ?auto_17085 ) ) ( not ( = ?auto_17073 ?auto_17060 ) ) ( not ( = ?auto_17073 ?auto_17067 ) ) ( not ( = ?auto_17073 ?auto_17048 ) ) ( not ( = ?auto_17072 ?auto_17071 ) ) ( not ( = ?auto_17072 ?auto_17069 ) ) ( not ( = ?auto_17072 ?auto_17066 ) ) ( not ( = ?auto_17072 ?auto_17083 ) ) ( not ( = ?auto_17072 ?auto_17080 ) ) ( not ( = ?auto_17072 ?auto_17086 ) ) ( not ( = ?auto_17072 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17042 ) ) ( not ( = ?auto_17033 ?auto_17061 ) ) ( not ( = ?auto_17034 ?auto_17042 ) ) ( not ( = ?auto_17034 ?auto_17061 ) ) ( not ( = ?auto_17035 ?auto_17042 ) ) ( not ( = ?auto_17035 ?auto_17061 ) ) ( not ( = ?auto_17036 ?auto_17042 ) ) ( not ( = ?auto_17036 ?auto_17061 ) ) ( not ( = ?auto_17037 ?auto_17042 ) ) ( not ( = ?auto_17037 ?auto_17061 ) ) ( not ( = ?auto_17038 ?auto_17042 ) ) ( not ( = ?auto_17038 ?auto_17061 ) ) ( not ( = ?auto_17041 ?auto_17042 ) ) ( not ( = ?auto_17041 ?auto_17061 ) ) ( not ( = ?auto_17040 ?auto_17042 ) ) ( not ( = ?auto_17040 ?auto_17061 ) ) ( not ( = ?auto_17042 ?auto_17072 ) ) ( not ( = ?auto_17042 ?auto_17071 ) ) ( not ( = ?auto_17042 ?auto_17069 ) ) ( not ( = ?auto_17042 ?auto_17066 ) ) ( not ( = ?auto_17042 ?auto_17083 ) ) ( not ( = ?auto_17042 ?auto_17080 ) ) ( not ( = ?auto_17042 ?auto_17086 ) ) ( not ( = ?auto_17042 ?auto_17075 ) ) ( not ( = ?auto_17068 ?auto_17078 ) ) ( not ( = ?auto_17068 ?auto_17062 ) ) ( not ( = ?auto_17068 ?auto_17079 ) ) ( not ( = ?auto_17068 ?auto_17084 ) ) ( not ( = ?auto_17068 ?auto_17076 ) ) ( not ( = ?auto_17068 ?auto_17054 ) ) ( not ( = ?auto_17068 ?auto_17059 ) ) ( not ( = ?auto_17068 ?auto_17051 ) ) ( not ( = ?auto_17063 ?auto_17073 ) ) ( not ( = ?auto_17063 ?auto_17081 ) ) ( not ( = ?auto_17063 ?auto_17065 ) ) ( not ( = ?auto_17063 ?auto_17058 ) ) ( not ( = ?auto_17063 ?auto_17085 ) ) ( not ( = ?auto_17063 ?auto_17060 ) ) ( not ( = ?auto_17063 ?auto_17067 ) ) ( not ( = ?auto_17063 ?auto_17048 ) ) ( not ( = ?auto_17061 ?auto_17072 ) ) ( not ( = ?auto_17061 ?auto_17071 ) ) ( not ( = ?auto_17061 ?auto_17069 ) ) ( not ( = ?auto_17061 ?auto_17066 ) ) ( not ( = ?auto_17061 ?auto_17083 ) ) ( not ( = ?auto_17061 ?auto_17080 ) ) ( not ( = ?auto_17061 ?auto_17086 ) ) ( not ( = ?auto_17061 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17044 ) ) ( not ( = ?auto_17033 ?auto_17082 ) ) ( not ( = ?auto_17034 ?auto_17044 ) ) ( not ( = ?auto_17034 ?auto_17082 ) ) ( not ( = ?auto_17035 ?auto_17044 ) ) ( not ( = ?auto_17035 ?auto_17082 ) ) ( not ( = ?auto_17036 ?auto_17044 ) ) ( not ( = ?auto_17036 ?auto_17082 ) ) ( not ( = ?auto_17037 ?auto_17044 ) ) ( not ( = ?auto_17037 ?auto_17082 ) ) ( not ( = ?auto_17038 ?auto_17044 ) ) ( not ( = ?auto_17038 ?auto_17082 ) ) ( not ( = ?auto_17041 ?auto_17044 ) ) ( not ( = ?auto_17041 ?auto_17082 ) ) ( not ( = ?auto_17040 ?auto_17044 ) ) ( not ( = ?auto_17040 ?auto_17082 ) ) ( not ( = ?auto_17039 ?auto_17044 ) ) ( not ( = ?auto_17039 ?auto_17082 ) ) ( not ( = ?auto_17044 ?auto_17061 ) ) ( not ( = ?auto_17044 ?auto_17072 ) ) ( not ( = ?auto_17044 ?auto_17071 ) ) ( not ( = ?auto_17044 ?auto_17069 ) ) ( not ( = ?auto_17044 ?auto_17066 ) ) ( not ( = ?auto_17044 ?auto_17083 ) ) ( not ( = ?auto_17044 ?auto_17080 ) ) ( not ( = ?auto_17044 ?auto_17086 ) ) ( not ( = ?auto_17044 ?auto_17075 ) ) ( not ( = ?auto_17082 ?auto_17061 ) ) ( not ( = ?auto_17082 ?auto_17072 ) ) ( not ( = ?auto_17082 ?auto_17071 ) ) ( not ( = ?auto_17082 ?auto_17069 ) ) ( not ( = ?auto_17082 ?auto_17066 ) ) ( not ( = ?auto_17082 ?auto_17083 ) ) ( not ( = ?auto_17082 ?auto_17080 ) ) ( not ( = ?auto_17082 ?auto_17086 ) ) ( not ( = ?auto_17082 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17043 ) ) ( not ( = ?auto_17033 ?auto_17077 ) ) ( not ( = ?auto_17034 ?auto_17043 ) ) ( not ( = ?auto_17034 ?auto_17077 ) ) ( not ( = ?auto_17035 ?auto_17043 ) ) ( not ( = ?auto_17035 ?auto_17077 ) ) ( not ( = ?auto_17036 ?auto_17043 ) ) ( not ( = ?auto_17036 ?auto_17077 ) ) ( not ( = ?auto_17037 ?auto_17043 ) ) ( not ( = ?auto_17037 ?auto_17077 ) ) ( not ( = ?auto_17038 ?auto_17043 ) ) ( not ( = ?auto_17038 ?auto_17077 ) ) ( not ( = ?auto_17041 ?auto_17043 ) ) ( not ( = ?auto_17041 ?auto_17077 ) ) ( not ( = ?auto_17040 ?auto_17043 ) ) ( not ( = ?auto_17040 ?auto_17077 ) ) ( not ( = ?auto_17039 ?auto_17043 ) ) ( not ( = ?auto_17039 ?auto_17077 ) ) ( not ( = ?auto_17042 ?auto_17043 ) ) ( not ( = ?auto_17042 ?auto_17077 ) ) ( not ( = ?auto_17043 ?auto_17082 ) ) ( not ( = ?auto_17043 ?auto_17061 ) ) ( not ( = ?auto_17043 ?auto_17072 ) ) ( not ( = ?auto_17043 ?auto_17071 ) ) ( not ( = ?auto_17043 ?auto_17069 ) ) ( not ( = ?auto_17043 ?auto_17066 ) ) ( not ( = ?auto_17043 ?auto_17083 ) ) ( not ( = ?auto_17043 ?auto_17080 ) ) ( not ( = ?auto_17043 ?auto_17086 ) ) ( not ( = ?auto_17043 ?auto_17075 ) ) ( not ( = ?auto_17064 ?auto_17068 ) ) ( not ( = ?auto_17064 ?auto_17078 ) ) ( not ( = ?auto_17064 ?auto_17062 ) ) ( not ( = ?auto_17064 ?auto_17079 ) ) ( not ( = ?auto_17064 ?auto_17084 ) ) ( not ( = ?auto_17064 ?auto_17076 ) ) ( not ( = ?auto_17064 ?auto_17054 ) ) ( not ( = ?auto_17064 ?auto_17059 ) ) ( not ( = ?auto_17064 ?auto_17051 ) ) ( not ( = ?auto_17070 ?auto_17063 ) ) ( not ( = ?auto_17070 ?auto_17073 ) ) ( not ( = ?auto_17070 ?auto_17081 ) ) ( not ( = ?auto_17070 ?auto_17065 ) ) ( not ( = ?auto_17070 ?auto_17058 ) ) ( not ( = ?auto_17070 ?auto_17085 ) ) ( not ( = ?auto_17070 ?auto_17060 ) ) ( not ( = ?auto_17070 ?auto_17067 ) ) ( not ( = ?auto_17070 ?auto_17048 ) ) ( not ( = ?auto_17077 ?auto_17082 ) ) ( not ( = ?auto_17077 ?auto_17061 ) ) ( not ( = ?auto_17077 ?auto_17072 ) ) ( not ( = ?auto_17077 ?auto_17071 ) ) ( not ( = ?auto_17077 ?auto_17069 ) ) ( not ( = ?auto_17077 ?auto_17066 ) ) ( not ( = ?auto_17077 ?auto_17083 ) ) ( not ( = ?auto_17077 ?auto_17080 ) ) ( not ( = ?auto_17077 ?auto_17086 ) ) ( not ( = ?auto_17077 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17045 ) ) ( not ( = ?auto_17033 ?auto_17056 ) ) ( not ( = ?auto_17034 ?auto_17045 ) ) ( not ( = ?auto_17034 ?auto_17056 ) ) ( not ( = ?auto_17035 ?auto_17045 ) ) ( not ( = ?auto_17035 ?auto_17056 ) ) ( not ( = ?auto_17036 ?auto_17045 ) ) ( not ( = ?auto_17036 ?auto_17056 ) ) ( not ( = ?auto_17037 ?auto_17045 ) ) ( not ( = ?auto_17037 ?auto_17056 ) ) ( not ( = ?auto_17038 ?auto_17045 ) ) ( not ( = ?auto_17038 ?auto_17056 ) ) ( not ( = ?auto_17041 ?auto_17045 ) ) ( not ( = ?auto_17041 ?auto_17056 ) ) ( not ( = ?auto_17040 ?auto_17045 ) ) ( not ( = ?auto_17040 ?auto_17056 ) ) ( not ( = ?auto_17039 ?auto_17045 ) ) ( not ( = ?auto_17039 ?auto_17056 ) ) ( not ( = ?auto_17042 ?auto_17045 ) ) ( not ( = ?auto_17042 ?auto_17056 ) ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17056 ) ) ( not ( = ?auto_17045 ?auto_17077 ) ) ( not ( = ?auto_17045 ?auto_17082 ) ) ( not ( = ?auto_17045 ?auto_17061 ) ) ( not ( = ?auto_17045 ?auto_17072 ) ) ( not ( = ?auto_17045 ?auto_17071 ) ) ( not ( = ?auto_17045 ?auto_17069 ) ) ( not ( = ?auto_17045 ?auto_17066 ) ) ( not ( = ?auto_17045 ?auto_17083 ) ) ( not ( = ?auto_17045 ?auto_17080 ) ) ( not ( = ?auto_17045 ?auto_17086 ) ) ( not ( = ?auto_17045 ?auto_17075 ) ) ( not ( = ?auto_17056 ?auto_17077 ) ) ( not ( = ?auto_17056 ?auto_17082 ) ) ( not ( = ?auto_17056 ?auto_17061 ) ) ( not ( = ?auto_17056 ?auto_17072 ) ) ( not ( = ?auto_17056 ?auto_17071 ) ) ( not ( = ?auto_17056 ?auto_17069 ) ) ( not ( = ?auto_17056 ?auto_17066 ) ) ( not ( = ?auto_17056 ?auto_17083 ) ) ( not ( = ?auto_17056 ?auto_17080 ) ) ( not ( = ?auto_17056 ?auto_17086 ) ) ( not ( = ?auto_17056 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17047 ) ) ( not ( = ?auto_17033 ?auto_17074 ) ) ( not ( = ?auto_17034 ?auto_17047 ) ) ( not ( = ?auto_17034 ?auto_17074 ) ) ( not ( = ?auto_17035 ?auto_17047 ) ) ( not ( = ?auto_17035 ?auto_17074 ) ) ( not ( = ?auto_17036 ?auto_17047 ) ) ( not ( = ?auto_17036 ?auto_17074 ) ) ( not ( = ?auto_17037 ?auto_17047 ) ) ( not ( = ?auto_17037 ?auto_17074 ) ) ( not ( = ?auto_17038 ?auto_17047 ) ) ( not ( = ?auto_17038 ?auto_17074 ) ) ( not ( = ?auto_17041 ?auto_17047 ) ) ( not ( = ?auto_17041 ?auto_17074 ) ) ( not ( = ?auto_17040 ?auto_17047 ) ) ( not ( = ?auto_17040 ?auto_17074 ) ) ( not ( = ?auto_17039 ?auto_17047 ) ) ( not ( = ?auto_17039 ?auto_17074 ) ) ( not ( = ?auto_17042 ?auto_17047 ) ) ( not ( = ?auto_17042 ?auto_17074 ) ) ( not ( = ?auto_17044 ?auto_17047 ) ) ( not ( = ?auto_17044 ?auto_17074 ) ) ( not ( = ?auto_17043 ?auto_17047 ) ) ( not ( = ?auto_17043 ?auto_17074 ) ) ( not ( = ?auto_17047 ?auto_17056 ) ) ( not ( = ?auto_17047 ?auto_17077 ) ) ( not ( = ?auto_17047 ?auto_17082 ) ) ( not ( = ?auto_17047 ?auto_17061 ) ) ( not ( = ?auto_17047 ?auto_17072 ) ) ( not ( = ?auto_17047 ?auto_17071 ) ) ( not ( = ?auto_17047 ?auto_17069 ) ) ( not ( = ?auto_17047 ?auto_17066 ) ) ( not ( = ?auto_17047 ?auto_17083 ) ) ( not ( = ?auto_17047 ?auto_17080 ) ) ( not ( = ?auto_17047 ?auto_17086 ) ) ( not ( = ?auto_17047 ?auto_17075 ) ) ( not ( = ?auto_17057 ?auto_17064 ) ) ( not ( = ?auto_17057 ?auto_17068 ) ) ( not ( = ?auto_17057 ?auto_17078 ) ) ( not ( = ?auto_17057 ?auto_17062 ) ) ( not ( = ?auto_17057 ?auto_17079 ) ) ( not ( = ?auto_17057 ?auto_17084 ) ) ( not ( = ?auto_17057 ?auto_17076 ) ) ( not ( = ?auto_17057 ?auto_17054 ) ) ( not ( = ?auto_17057 ?auto_17059 ) ) ( not ( = ?auto_17057 ?auto_17051 ) ) ( not ( = ?auto_17055 ?auto_17070 ) ) ( not ( = ?auto_17055 ?auto_17063 ) ) ( not ( = ?auto_17055 ?auto_17073 ) ) ( not ( = ?auto_17055 ?auto_17081 ) ) ( not ( = ?auto_17055 ?auto_17065 ) ) ( not ( = ?auto_17055 ?auto_17058 ) ) ( not ( = ?auto_17055 ?auto_17085 ) ) ( not ( = ?auto_17055 ?auto_17060 ) ) ( not ( = ?auto_17055 ?auto_17067 ) ) ( not ( = ?auto_17055 ?auto_17048 ) ) ( not ( = ?auto_17074 ?auto_17056 ) ) ( not ( = ?auto_17074 ?auto_17077 ) ) ( not ( = ?auto_17074 ?auto_17082 ) ) ( not ( = ?auto_17074 ?auto_17061 ) ) ( not ( = ?auto_17074 ?auto_17072 ) ) ( not ( = ?auto_17074 ?auto_17071 ) ) ( not ( = ?auto_17074 ?auto_17069 ) ) ( not ( = ?auto_17074 ?auto_17066 ) ) ( not ( = ?auto_17074 ?auto_17083 ) ) ( not ( = ?auto_17074 ?auto_17080 ) ) ( not ( = ?auto_17074 ?auto_17086 ) ) ( not ( = ?auto_17074 ?auto_17075 ) ) ( not ( = ?auto_17033 ?auto_17046 ) ) ( not ( = ?auto_17033 ?auto_17053 ) ) ( not ( = ?auto_17034 ?auto_17046 ) ) ( not ( = ?auto_17034 ?auto_17053 ) ) ( not ( = ?auto_17035 ?auto_17046 ) ) ( not ( = ?auto_17035 ?auto_17053 ) ) ( not ( = ?auto_17036 ?auto_17046 ) ) ( not ( = ?auto_17036 ?auto_17053 ) ) ( not ( = ?auto_17037 ?auto_17046 ) ) ( not ( = ?auto_17037 ?auto_17053 ) ) ( not ( = ?auto_17038 ?auto_17046 ) ) ( not ( = ?auto_17038 ?auto_17053 ) ) ( not ( = ?auto_17041 ?auto_17046 ) ) ( not ( = ?auto_17041 ?auto_17053 ) ) ( not ( = ?auto_17040 ?auto_17046 ) ) ( not ( = ?auto_17040 ?auto_17053 ) ) ( not ( = ?auto_17039 ?auto_17046 ) ) ( not ( = ?auto_17039 ?auto_17053 ) ) ( not ( = ?auto_17042 ?auto_17046 ) ) ( not ( = ?auto_17042 ?auto_17053 ) ) ( not ( = ?auto_17044 ?auto_17046 ) ) ( not ( = ?auto_17044 ?auto_17053 ) ) ( not ( = ?auto_17043 ?auto_17046 ) ) ( not ( = ?auto_17043 ?auto_17053 ) ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17045 ?auto_17053 ) ) ( not ( = ?auto_17046 ?auto_17074 ) ) ( not ( = ?auto_17046 ?auto_17056 ) ) ( not ( = ?auto_17046 ?auto_17077 ) ) ( not ( = ?auto_17046 ?auto_17082 ) ) ( not ( = ?auto_17046 ?auto_17061 ) ) ( not ( = ?auto_17046 ?auto_17072 ) ) ( not ( = ?auto_17046 ?auto_17071 ) ) ( not ( = ?auto_17046 ?auto_17069 ) ) ( not ( = ?auto_17046 ?auto_17066 ) ) ( not ( = ?auto_17046 ?auto_17083 ) ) ( not ( = ?auto_17046 ?auto_17080 ) ) ( not ( = ?auto_17046 ?auto_17086 ) ) ( not ( = ?auto_17046 ?auto_17075 ) ) ( not ( = ?auto_17053 ?auto_17074 ) ) ( not ( = ?auto_17053 ?auto_17056 ) ) ( not ( = ?auto_17053 ?auto_17077 ) ) ( not ( = ?auto_17053 ?auto_17082 ) ) ( not ( = ?auto_17053 ?auto_17061 ) ) ( not ( = ?auto_17053 ?auto_17072 ) ) ( not ( = ?auto_17053 ?auto_17071 ) ) ( not ( = ?auto_17053 ?auto_17069 ) ) ( not ( = ?auto_17053 ?auto_17066 ) ) ( not ( = ?auto_17053 ?auto_17083 ) ) ( not ( = ?auto_17053 ?auto_17080 ) ) ( not ( = ?auto_17053 ?auto_17086 ) ) ( not ( = ?auto_17053 ?auto_17075 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17033 ?auto_17034 ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17041 ?auto_17040 ?auto_17039 ?auto_17042 ?auto_17044 ?auto_17043 ?auto_17045 ?auto_17047 )
      ( MAKE-1CRATE ?auto_17047 ?auto_17046 )
      ( MAKE-14CRATE-VERIFY ?auto_17033 ?auto_17034 ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17041 ?auto_17040 ?auto_17039 ?auto_17042 ?auto_17044 ?auto_17043 ?auto_17045 ?auto_17047 ?auto_17046 ) )
  )

)

