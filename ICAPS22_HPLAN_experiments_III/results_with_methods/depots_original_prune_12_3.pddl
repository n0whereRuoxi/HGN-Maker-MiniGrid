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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744364 - SURFACE
      ?auto_744365 - SURFACE
    )
    :vars
    (
      ?auto_744366 - HOIST
      ?auto_744367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744366 ?auto_744367 ) ( SURFACE-AT ?auto_744364 ?auto_744367 ) ( CLEAR ?auto_744364 ) ( LIFTING ?auto_744366 ?auto_744365 ) ( IS-CRATE ?auto_744365 ) ( not ( = ?auto_744364 ?auto_744365 ) ) )
    :subtasks
    ( ( !DROP ?auto_744366 ?auto_744365 ?auto_744364 ?auto_744367 )
      ( MAKE-1CRATE-VERIFY ?auto_744364 ?auto_744365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744368 - SURFACE
      ?auto_744369 - SURFACE
    )
    :vars
    (
      ?auto_744370 - HOIST
      ?auto_744371 - PLACE
      ?auto_744372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744370 ?auto_744371 ) ( SURFACE-AT ?auto_744368 ?auto_744371 ) ( CLEAR ?auto_744368 ) ( IS-CRATE ?auto_744369 ) ( not ( = ?auto_744368 ?auto_744369 ) ) ( TRUCK-AT ?auto_744372 ?auto_744371 ) ( AVAILABLE ?auto_744370 ) ( IN ?auto_744369 ?auto_744372 ) )
    :subtasks
    ( ( !UNLOAD ?auto_744370 ?auto_744369 ?auto_744372 ?auto_744371 )
      ( MAKE-1CRATE ?auto_744368 ?auto_744369 )
      ( MAKE-1CRATE-VERIFY ?auto_744368 ?auto_744369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744373 - SURFACE
      ?auto_744374 - SURFACE
    )
    :vars
    (
      ?auto_744376 - HOIST
      ?auto_744375 - PLACE
      ?auto_744377 - TRUCK
      ?auto_744378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744376 ?auto_744375 ) ( SURFACE-AT ?auto_744373 ?auto_744375 ) ( CLEAR ?auto_744373 ) ( IS-CRATE ?auto_744374 ) ( not ( = ?auto_744373 ?auto_744374 ) ) ( AVAILABLE ?auto_744376 ) ( IN ?auto_744374 ?auto_744377 ) ( TRUCK-AT ?auto_744377 ?auto_744378 ) ( not ( = ?auto_744378 ?auto_744375 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_744377 ?auto_744378 ?auto_744375 )
      ( MAKE-1CRATE ?auto_744373 ?auto_744374 )
      ( MAKE-1CRATE-VERIFY ?auto_744373 ?auto_744374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744379 - SURFACE
      ?auto_744380 - SURFACE
    )
    :vars
    (
      ?auto_744382 - HOIST
      ?auto_744383 - PLACE
      ?auto_744384 - TRUCK
      ?auto_744381 - PLACE
      ?auto_744385 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744382 ?auto_744383 ) ( SURFACE-AT ?auto_744379 ?auto_744383 ) ( CLEAR ?auto_744379 ) ( IS-CRATE ?auto_744380 ) ( not ( = ?auto_744379 ?auto_744380 ) ) ( AVAILABLE ?auto_744382 ) ( TRUCK-AT ?auto_744384 ?auto_744381 ) ( not ( = ?auto_744381 ?auto_744383 ) ) ( HOIST-AT ?auto_744385 ?auto_744381 ) ( LIFTING ?auto_744385 ?auto_744380 ) ( not ( = ?auto_744382 ?auto_744385 ) ) )
    :subtasks
    ( ( !LOAD ?auto_744385 ?auto_744380 ?auto_744384 ?auto_744381 )
      ( MAKE-1CRATE ?auto_744379 ?auto_744380 )
      ( MAKE-1CRATE-VERIFY ?auto_744379 ?auto_744380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744386 - SURFACE
      ?auto_744387 - SURFACE
    )
    :vars
    (
      ?auto_744388 - HOIST
      ?auto_744392 - PLACE
      ?auto_744390 - TRUCK
      ?auto_744389 - PLACE
      ?auto_744391 - HOIST
      ?auto_744393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744388 ?auto_744392 ) ( SURFACE-AT ?auto_744386 ?auto_744392 ) ( CLEAR ?auto_744386 ) ( IS-CRATE ?auto_744387 ) ( not ( = ?auto_744386 ?auto_744387 ) ) ( AVAILABLE ?auto_744388 ) ( TRUCK-AT ?auto_744390 ?auto_744389 ) ( not ( = ?auto_744389 ?auto_744392 ) ) ( HOIST-AT ?auto_744391 ?auto_744389 ) ( not ( = ?auto_744388 ?auto_744391 ) ) ( AVAILABLE ?auto_744391 ) ( SURFACE-AT ?auto_744387 ?auto_744389 ) ( ON ?auto_744387 ?auto_744393 ) ( CLEAR ?auto_744387 ) ( not ( = ?auto_744386 ?auto_744393 ) ) ( not ( = ?auto_744387 ?auto_744393 ) ) )
    :subtasks
    ( ( !LIFT ?auto_744391 ?auto_744387 ?auto_744393 ?auto_744389 )
      ( MAKE-1CRATE ?auto_744386 ?auto_744387 )
      ( MAKE-1CRATE-VERIFY ?auto_744386 ?auto_744387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744394 - SURFACE
      ?auto_744395 - SURFACE
    )
    :vars
    (
      ?auto_744399 - HOIST
      ?auto_744398 - PLACE
      ?auto_744397 - PLACE
      ?auto_744396 - HOIST
      ?auto_744401 - SURFACE
      ?auto_744400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744399 ?auto_744398 ) ( SURFACE-AT ?auto_744394 ?auto_744398 ) ( CLEAR ?auto_744394 ) ( IS-CRATE ?auto_744395 ) ( not ( = ?auto_744394 ?auto_744395 ) ) ( AVAILABLE ?auto_744399 ) ( not ( = ?auto_744397 ?auto_744398 ) ) ( HOIST-AT ?auto_744396 ?auto_744397 ) ( not ( = ?auto_744399 ?auto_744396 ) ) ( AVAILABLE ?auto_744396 ) ( SURFACE-AT ?auto_744395 ?auto_744397 ) ( ON ?auto_744395 ?auto_744401 ) ( CLEAR ?auto_744395 ) ( not ( = ?auto_744394 ?auto_744401 ) ) ( not ( = ?auto_744395 ?auto_744401 ) ) ( TRUCK-AT ?auto_744400 ?auto_744398 ) )
    :subtasks
    ( ( !DRIVE ?auto_744400 ?auto_744398 ?auto_744397 )
      ( MAKE-1CRATE ?auto_744394 ?auto_744395 )
      ( MAKE-1CRATE-VERIFY ?auto_744394 ?auto_744395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744411 - SURFACE
      ?auto_744412 - SURFACE
      ?auto_744413 - SURFACE
    )
    :vars
    (
      ?auto_744414 - HOIST
      ?auto_744415 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744414 ?auto_744415 ) ( SURFACE-AT ?auto_744412 ?auto_744415 ) ( CLEAR ?auto_744412 ) ( LIFTING ?auto_744414 ?auto_744413 ) ( IS-CRATE ?auto_744413 ) ( not ( = ?auto_744412 ?auto_744413 ) ) ( ON ?auto_744412 ?auto_744411 ) ( not ( = ?auto_744411 ?auto_744412 ) ) ( not ( = ?auto_744411 ?auto_744413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744412 ?auto_744413 )
      ( MAKE-2CRATE-VERIFY ?auto_744411 ?auto_744412 ?auto_744413 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744421 - SURFACE
      ?auto_744422 - SURFACE
      ?auto_744423 - SURFACE
    )
    :vars
    (
      ?auto_744424 - HOIST
      ?auto_744425 - PLACE
      ?auto_744426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744424 ?auto_744425 ) ( SURFACE-AT ?auto_744422 ?auto_744425 ) ( CLEAR ?auto_744422 ) ( IS-CRATE ?auto_744423 ) ( not ( = ?auto_744422 ?auto_744423 ) ) ( TRUCK-AT ?auto_744426 ?auto_744425 ) ( AVAILABLE ?auto_744424 ) ( IN ?auto_744423 ?auto_744426 ) ( ON ?auto_744422 ?auto_744421 ) ( not ( = ?auto_744421 ?auto_744422 ) ) ( not ( = ?auto_744421 ?auto_744423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744422 ?auto_744423 )
      ( MAKE-2CRATE-VERIFY ?auto_744421 ?auto_744422 ?auto_744423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744427 - SURFACE
      ?auto_744428 - SURFACE
    )
    :vars
    (
      ?auto_744429 - HOIST
      ?auto_744430 - PLACE
      ?auto_744431 - TRUCK
      ?auto_744432 - SURFACE
      ?auto_744433 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744429 ?auto_744430 ) ( SURFACE-AT ?auto_744427 ?auto_744430 ) ( CLEAR ?auto_744427 ) ( IS-CRATE ?auto_744428 ) ( not ( = ?auto_744427 ?auto_744428 ) ) ( AVAILABLE ?auto_744429 ) ( IN ?auto_744428 ?auto_744431 ) ( ON ?auto_744427 ?auto_744432 ) ( not ( = ?auto_744432 ?auto_744427 ) ) ( not ( = ?auto_744432 ?auto_744428 ) ) ( TRUCK-AT ?auto_744431 ?auto_744433 ) ( not ( = ?auto_744433 ?auto_744430 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_744431 ?auto_744433 ?auto_744430 )
      ( MAKE-2CRATE ?auto_744432 ?auto_744427 ?auto_744428 )
      ( MAKE-1CRATE-VERIFY ?auto_744427 ?auto_744428 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744434 - SURFACE
      ?auto_744435 - SURFACE
      ?auto_744436 - SURFACE
    )
    :vars
    (
      ?auto_744437 - HOIST
      ?auto_744440 - PLACE
      ?auto_744438 - TRUCK
      ?auto_744439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744437 ?auto_744440 ) ( SURFACE-AT ?auto_744435 ?auto_744440 ) ( CLEAR ?auto_744435 ) ( IS-CRATE ?auto_744436 ) ( not ( = ?auto_744435 ?auto_744436 ) ) ( AVAILABLE ?auto_744437 ) ( IN ?auto_744436 ?auto_744438 ) ( ON ?auto_744435 ?auto_744434 ) ( not ( = ?auto_744434 ?auto_744435 ) ) ( not ( = ?auto_744434 ?auto_744436 ) ) ( TRUCK-AT ?auto_744438 ?auto_744439 ) ( not ( = ?auto_744439 ?auto_744440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744435 ?auto_744436 )
      ( MAKE-2CRATE-VERIFY ?auto_744434 ?auto_744435 ?auto_744436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744441 - SURFACE
      ?auto_744442 - SURFACE
    )
    :vars
    (
      ?auto_744443 - HOIST
      ?auto_744447 - PLACE
      ?auto_744444 - SURFACE
      ?auto_744446 - TRUCK
      ?auto_744445 - PLACE
      ?auto_744448 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744443 ?auto_744447 ) ( SURFACE-AT ?auto_744441 ?auto_744447 ) ( CLEAR ?auto_744441 ) ( IS-CRATE ?auto_744442 ) ( not ( = ?auto_744441 ?auto_744442 ) ) ( AVAILABLE ?auto_744443 ) ( ON ?auto_744441 ?auto_744444 ) ( not ( = ?auto_744444 ?auto_744441 ) ) ( not ( = ?auto_744444 ?auto_744442 ) ) ( TRUCK-AT ?auto_744446 ?auto_744445 ) ( not ( = ?auto_744445 ?auto_744447 ) ) ( HOIST-AT ?auto_744448 ?auto_744445 ) ( LIFTING ?auto_744448 ?auto_744442 ) ( not ( = ?auto_744443 ?auto_744448 ) ) )
    :subtasks
    ( ( !LOAD ?auto_744448 ?auto_744442 ?auto_744446 ?auto_744445 )
      ( MAKE-2CRATE ?auto_744444 ?auto_744441 ?auto_744442 )
      ( MAKE-1CRATE-VERIFY ?auto_744441 ?auto_744442 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744449 - SURFACE
      ?auto_744450 - SURFACE
      ?auto_744451 - SURFACE
    )
    :vars
    (
      ?auto_744453 - HOIST
      ?auto_744456 - PLACE
      ?auto_744454 - TRUCK
      ?auto_744452 - PLACE
      ?auto_744455 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744453 ?auto_744456 ) ( SURFACE-AT ?auto_744450 ?auto_744456 ) ( CLEAR ?auto_744450 ) ( IS-CRATE ?auto_744451 ) ( not ( = ?auto_744450 ?auto_744451 ) ) ( AVAILABLE ?auto_744453 ) ( ON ?auto_744450 ?auto_744449 ) ( not ( = ?auto_744449 ?auto_744450 ) ) ( not ( = ?auto_744449 ?auto_744451 ) ) ( TRUCK-AT ?auto_744454 ?auto_744452 ) ( not ( = ?auto_744452 ?auto_744456 ) ) ( HOIST-AT ?auto_744455 ?auto_744452 ) ( LIFTING ?auto_744455 ?auto_744451 ) ( not ( = ?auto_744453 ?auto_744455 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744450 ?auto_744451 )
      ( MAKE-2CRATE-VERIFY ?auto_744449 ?auto_744450 ?auto_744451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744457 - SURFACE
      ?auto_744458 - SURFACE
    )
    :vars
    (
      ?auto_744462 - HOIST
      ?auto_744464 - PLACE
      ?auto_744460 - SURFACE
      ?auto_744461 - TRUCK
      ?auto_744463 - PLACE
      ?auto_744459 - HOIST
      ?auto_744465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744462 ?auto_744464 ) ( SURFACE-AT ?auto_744457 ?auto_744464 ) ( CLEAR ?auto_744457 ) ( IS-CRATE ?auto_744458 ) ( not ( = ?auto_744457 ?auto_744458 ) ) ( AVAILABLE ?auto_744462 ) ( ON ?auto_744457 ?auto_744460 ) ( not ( = ?auto_744460 ?auto_744457 ) ) ( not ( = ?auto_744460 ?auto_744458 ) ) ( TRUCK-AT ?auto_744461 ?auto_744463 ) ( not ( = ?auto_744463 ?auto_744464 ) ) ( HOIST-AT ?auto_744459 ?auto_744463 ) ( not ( = ?auto_744462 ?auto_744459 ) ) ( AVAILABLE ?auto_744459 ) ( SURFACE-AT ?auto_744458 ?auto_744463 ) ( ON ?auto_744458 ?auto_744465 ) ( CLEAR ?auto_744458 ) ( not ( = ?auto_744457 ?auto_744465 ) ) ( not ( = ?auto_744458 ?auto_744465 ) ) ( not ( = ?auto_744460 ?auto_744465 ) ) )
    :subtasks
    ( ( !LIFT ?auto_744459 ?auto_744458 ?auto_744465 ?auto_744463 )
      ( MAKE-2CRATE ?auto_744460 ?auto_744457 ?auto_744458 )
      ( MAKE-1CRATE-VERIFY ?auto_744457 ?auto_744458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744466 - SURFACE
      ?auto_744467 - SURFACE
      ?auto_744468 - SURFACE
    )
    :vars
    (
      ?auto_744470 - HOIST
      ?auto_744474 - PLACE
      ?auto_744473 - TRUCK
      ?auto_744471 - PLACE
      ?auto_744472 - HOIST
      ?auto_744469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744470 ?auto_744474 ) ( SURFACE-AT ?auto_744467 ?auto_744474 ) ( CLEAR ?auto_744467 ) ( IS-CRATE ?auto_744468 ) ( not ( = ?auto_744467 ?auto_744468 ) ) ( AVAILABLE ?auto_744470 ) ( ON ?auto_744467 ?auto_744466 ) ( not ( = ?auto_744466 ?auto_744467 ) ) ( not ( = ?auto_744466 ?auto_744468 ) ) ( TRUCK-AT ?auto_744473 ?auto_744471 ) ( not ( = ?auto_744471 ?auto_744474 ) ) ( HOIST-AT ?auto_744472 ?auto_744471 ) ( not ( = ?auto_744470 ?auto_744472 ) ) ( AVAILABLE ?auto_744472 ) ( SURFACE-AT ?auto_744468 ?auto_744471 ) ( ON ?auto_744468 ?auto_744469 ) ( CLEAR ?auto_744468 ) ( not ( = ?auto_744467 ?auto_744469 ) ) ( not ( = ?auto_744468 ?auto_744469 ) ) ( not ( = ?auto_744466 ?auto_744469 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744467 ?auto_744468 )
      ( MAKE-2CRATE-VERIFY ?auto_744466 ?auto_744467 ?auto_744468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744475 - SURFACE
      ?auto_744476 - SURFACE
    )
    :vars
    (
      ?auto_744479 - HOIST
      ?auto_744481 - PLACE
      ?auto_744477 - SURFACE
      ?auto_744483 - PLACE
      ?auto_744480 - HOIST
      ?auto_744478 - SURFACE
      ?auto_744482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744479 ?auto_744481 ) ( SURFACE-AT ?auto_744475 ?auto_744481 ) ( CLEAR ?auto_744475 ) ( IS-CRATE ?auto_744476 ) ( not ( = ?auto_744475 ?auto_744476 ) ) ( AVAILABLE ?auto_744479 ) ( ON ?auto_744475 ?auto_744477 ) ( not ( = ?auto_744477 ?auto_744475 ) ) ( not ( = ?auto_744477 ?auto_744476 ) ) ( not ( = ?auto_744483 ?auto_744481 ) ) ( HOIST-AT ?auto_744480 ?auto_744483 ) ( not ( = ?auto_744479 ?auto_744480 ) ) ( AVAILABLE ?auto_744480 ) ( SURFACE-AT ?auto_744476 ?auto_744483 ) ( ON ?auto_744476 ?auto_744478 ) ( CLEAR ?auto_744476 ) ( not ( = ?auto_744475 ?auto_744478 ) ) ( not ( = ?auto_744476 ?auto_744478 ) ) ( not ( = ?auto_744477 ?auto_744478 ) ) ( TRUCK-AT ?auto_744482 ?auto_744481 ) )
    :subtasks
    ( ( !DRIVE ?auto_744482 ?auto_744481 ?auto_744483 )
      ( MAKE-2CRATE ?auto_744477 ?auto_744475 ?auto_744476 )
      ( MAKE-1CRATE-VERIFY ?auto_744475 ?auto_744476 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744484 - SURFACE
      ?auto_744485 - SURFACE
      ?auto_744486 - SURFACE
    )
    :vars
    (
      ?auto_744488 - HOIST
      ?auto_744491 - PLACE
      ?auto_744492 - PLACE
      ?auto_744489 - HOIST
      ?auto_744490 - SURFACE
      ?auto_744487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744488 ?auto_744491 ) ( SURFACE-AT ?auto_744485 ?auto_744491 ) ( CLEAR ?auto_744485 ) ( IS-CRATE ?auto_744486 ) ( not ( = ?auto_744485 ?auto_744486 ) ) ( AVAILABLE ?auto_744488 ) ( ON ?auto_744485 ?auto_744484 ) ( not ( = ?auto_744484 ?auto_744485 ) ) ( not ( = ?auto_744484 ?auto_744486 ) ) ( not ( = ?auto_744492 ?auto_744491 ) ) ( HOIST-AT ?auto_744489 ?auto_744492 ) ( not ( = ?auto_744488 ?auto_744489 ) ) ( AVAILABLE ?auto_744489 ) ( SURFACE-AT ?auto_744486 ?auto_744492 ) ( ON ?auto_744486 ?auto_744490 ) ( CLEAR ?auto_744486 ) ( not ( = ?auto_744485 ?auto_744490 ) ) ( not ( = ?auto_744486 ?auto_744490 ) ) ( not ( = ?auto_744484 ?auto_744490 ) ) ( TRUCK-AT ?auto_744487 ?auto_744491 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744485 ?auto_744486 )
      ( MAKE-2CRATE-VERIFY ?auto_744484 ?auto_744485 ?auto_744486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744493 - SURFACE
      ?auto_744494 - SURFACE
    )
    :vars
    (
      ?auto_744500 - HOIST
      ?auto_744498 - PLACE
      ?auto_744499 - SURFACE
      ?auto_744501 - PLACE
      ?auto_744497 - HOIST
      ?auto_744496 - SURFACE
      ?auto_744495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744500 ?auto_744498 ) ( IS-CRATE ?auto_744494 ) ( not ( = ?auto_744493 ?auto_744494 ) ) ( not ( = ?auto_744499 ?auto_744493 ) ) ( not ( = ?auto_744499 ?auto_744494 ) ) ( not ( = ?auto_744501 ?auto_744498 ) ) ( HOIST-AT ?auto_744497 ?auto_744501 ) ( not ( = ?auto_744500 ?auto_744497 ) ) ( AVAILABLE ?auto_744497 ) ( SURFACE-AT ?auto_744494 ?auto_744501 ) ( ON ?auto_744494 ?auto_744496 ) ( CLEAR ?auto_744494 ) ( not ( = ?auto_744493 ?auto_744496 ) ) ( not ( = ?auto_744494 ?auto_744496 ) ) ( not ( = ?auto_744499 ?auto_744496 ) ) ( TRUCK-AT ?auto_744495 ?auto_744498 ) ( SURFACE-AT ?auto_744499 ?auto_744498 ) ( CLEAR ?auto_744499 ) ( LIFTING ?auto_744500 ?auto_744493 ) ( IS-CRATE ?auto_744493 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744499 ?auto_744493 )
      ( MAKE-2CRATE ?auto_744499 ?auto_744493 ?auto_744494 )
      ( MAKE-1CRATE-VERIFY ?auto_744493 ?auto_744494 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744502 - SURFACE
      ?auto_744503 - SURFACE
      ?auto_744504 - SURFACE
    )
    :vars
    (
      ?auto_744506 - HOIST
      ?auto_744510 - PLACE
      ?auto_744507 - PLACE
      ?auto_744505 - HOIST
      ?auto_744508 - SURFACE
      ?auto_744509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744506 ?auto_744510 ) ( IS-CRATE ?auto_744504 ) ( not ( = ?auto_744503 ?auto_744504 ) ) ( not ( = ?auto_744502 ?auto_744503 ) ) ( not ( = ?auto_744502 ?auto_744504 ) ) ( not ( = ?auto_744507 ?auto_744510 ) ) ( HOIST-AT ?auto_744505 ?auto_744507 ) ( not ( = ?auto_744506 ?auto_744505 ) ) ( AVAILABLE ?auto_744505 ) ( SURFACE-AT ?auto_744504 ?auto_744507 ) ( ON ?auto_744504 ?auto_744508 ) ( CLEAR ?auto_744504 ) ( not ( = ?auto_744503 ?auto_744508 ) ) ( not ( = ?auto_744504 ?auto_744508 ) ) ( not ( = ?auto_744502 ?auto_744508 ) ) ( TRUCK-AT ?auto_744509 ?auto_744510 ) ( SURFACE-AT ?auto_744502 ?auto_744510 ) ( CLEAR ?auto_744502 ) ( LIFTING ?auto_744506 ?auto_744503 ) ( IS-CRATE ?auto_744503 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744503 ?auto_744504 )
      ( MAKE-2CRATE-VERIFY ?auto_744502 ?auto_744503 ?auto_744504 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744511 - SURFACE
      ?auto_744512 - SURFACE
    )
    :vars
    (
      ?auto_744513 - HOIST
      ?auto_744519 - PLACE
      ?auto_744514 - SURFACE
      ?auto_744517 - PLACE
      ?auto_744516 - HOIST
      ?auto_744515 - SURFACE
      ?auto_744518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744513 ?auto_744519 ) ( IS-CRATE ?auto_744512 ) ( not ( = ?auto_744511 ?auto_744512 ) ) ( not ( = ?auto_744514 ?auto_744511 ) ) ( not ( = ?auto_744514 ?auto_744512 ) ) ( not ( = ?auto_744517 ?auto_744519 ) ) ( HOIST-AT ?auto_744516 ?auto_744517 ) ( not ( = ?auto_744513 ?auto_744516 ) ) ( AVAILABLE ?auto_744516 ) ( SURFACE-AT ?auto_744512 ?auto_744517 ) ( ON ?auto_744512 ?auto_744515 ) ( CLEAR ?auto_744512 ) ( not ( = ?auto_744511 ?auto_744515 ) ) ( not ( = ?auto_744512 ?auto_744515 ) ) ( not ( = ?auto_744514 ?auto_744515 ) ) ( TRUCK-AT ?auto_744518 ?auto_744519 ) ( SURFACE-AT ?auto_744514 ?auto_744519 ) ( CLEAR ?auto_744514 ) ( IS-CRATE ?auto_744511 ) ( AVAILABLE ?auto_744513 ) ( IN ?auto_744511 ?auto_744518 ) )
    :subtasks
    ( ( !UNLOAD ?auto_744513 ?auto_744511 ?auto_744518 ?auto_744519 )
      ( MAKE-2CRATE ?auto_744514 ?auto_744511 ?auto_744512 )
      ( MAKE-1CRATE-VERIFY ?auto_744511 ?auto_744512 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_744520 - SURFACE
      ?auto_744521 - SURFACE
      ?auto_744522 - SURFACE
    )
    :vars
    (
      ?auto_744528 - HOIST
      ?auto_744525 - PLACE
      ?auto_744526 - PLACE
      ?auto_744527 - HOIST
      ?auto_744524 - SURFACE
      ?auto_744523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744528 ?auto_744525 ) ( IS-CRATE ?auto_744522 ) ( not ( = ?auto_744521 ?auto_744522 ) ) ( not ( = ?auto_744520 ?auto_744521 ) ) ( not ( = ?auto_744520 ?auto_744522 ) ) ( not ( = ?auto_744526 ?auto_744525 ) ) ( HOIST-AT ?auto_744527 ?auto_744526 ) ( not ( = ?auto_744528 ?auto_744527 ) ) ( AVAILABLE ?auto_744527 ) ( SURFACE-AT ?auto_744522 ?auto_744526 ) ( ON ?auto_744522 ?auto_744524 ) ( CLEAR ?auto_744522 ) ( not ( = ?auto_744521 ?auto_744524 ) ) ( not ( = ?auto_744522 ?auto_744524 ) ) ( not ( = ?auto_744520 ?auto_744524 ) ) ( TRUCK-AT ?auto_744523 ?auto_744525 ) ( SURFACE-AT ?auto_744520 ?auto_744525 ) ( CLEAR ?auto_744520 ) ( IS-CRATE ?auto_744521 ) ( AVAILABLE ?auto_744528 ) ( IN ?auto_744521 ?auto_744523 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744521 ?auto_744522 )
      ( MAKE-2CRATE-VERIFY ?auto_744520 ?auto_744521 ?auto_744522 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_744565 - SURFACE
      ?auto_744566 - SURFACE
    )
    :vars
    (
      ?auto_744569 - HOIST
      ?auto_744571 - PLACE
      ?auto_744572 - SURFACE
      ?auto_744573 - PLACE
      ?auto_744570 - HOIST
      ?auto_744567 - SURFACE
      ?auto_744568 - TRUCK
      ?auto_744574 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744569 ?auto_744571 ) ( SURFACE-AT ?auto_744565 ?auto_744571 ) ( CLEAR ?auto_744565 ) ( IS-CRATE ?auto_744566 ) ( not ( = ?auto_744565 ?auto_744566 ) ) ( AVAILABLE ?auto_744569 ) ( ON ?auto_744565 ?auto_744572 ) ( not ( = ?auto_744572 ?auto_744565 ) ) ( not ( = ?auto_744572 ?auto_744566 ) ) ( not ( = ?auto_744573 ?auto_744571 ) ) ( HOIST-AT ?auto_744570 ?auto_744573 ) ( not ( = ?auto_744569 ?auto_744570 ) ) ( AVAILABLE ?auto_744570 ) ( SURFACE-AT ?auto_744566 ?auto_744573 ) ( ON ?auto_744566 ?auto_744567 ) ( CLEAR ?auto_744566 ) ( not ( = ?auto_744565 ?auto_744567 ) ) ( not ( = ?auto_744566 ?auto_744567 ) ) ( not ( = ?auto_744572 ?auto_744567 ) ) ( TRUCK-AT ?auto_744568 ?auto_744574 ) ( not ( = ?auto_744574 ?auto_744571 ) ) ( not ( = ?auto_744573 ?auto_744574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_744568 ?auto_744574 ?auto_744571 )
      ( MAKE-1CRATE ?auto_744565 ?auto_744566 )
      ( MAKE-1CRATE-VERIFY ?auto_744565 ?auto_744566 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744604 - SURFACE
      ?auto_744605 - SURFACE
      ?auto_744606 - SURFACE
      ?auto_744607 - SURFACE
    )
    :vars
    (
      ?auto_744608 - HOIST
      ?auto_744609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744608 ?auto_744609 ) ( SURFACE-AT ?auto_744606 ?auto_744609 ) ( CLEAR ?auto_744606 ) ( LIFTING ?auto_744608 ?auto_744607 ) ( IS-CRATE ?auto_744607 ) ( not ( = ?auto_744606 ?auto_744607 ) ) ( ON ?auto_744605 ?auto_744604 ) ( ON ?auto_744606 ?auto_744605 ) ( not ( = ?auto_744604 ?auto_744605 ) ) ( not ( = ?auto_744604 ?auto_744606 ) ) ( not ( = ?auto_744604 ?auto_744607 ) ) ( not ( = ?auto_744605 ?auto_744606 ) ) ( not ( = ?auto_744605 ?auto_744607 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_744606 ?auto_744607 )
      ( MAKE-3CRATE-VERIFY ?auto_744604 ?auto_744605 ?auto_744606 ?auto_744607 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744621 - SURFACE
      ?auto_744622 - SURFACE
      ?auto_744623 - SURFACE
      ?auto_744624 - SURFACE
    )
    :vars
    (
      ?auto_744626 - HOIST
      ?auto_744627 - PLACE
      ?auto_744625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744626 ?auto_744627 ) ( SURFACE-AT ?auto_744623 ?auto_744627 ) ( CLEAR ?auto_744623 ) ( IS-CRATE ?auto_744624 ) ( not ( = ?auto_744623 ?auto_744624 ) ) ( TRUCK-AT ?auto_744625 ?auto_744627 ) ( AVAILABLE ?auto_744626 ) ( IN ?auto_744624 ?auto_744625 ) ( ON ?auto_744623 ?auto_744622 ) ( not ( = ?auto_744622 ?auto_744623 ) ) ( not ( = ?auto_744622 ?auto_744624 ) ) ( ON ?auto_744622 ?auto_744621 ) ( not ( = ?auto_744621 ?auto_744622 ) ) ( not ( = ?auto_744621 ?auto_744623 ) ) ( not ( = ?auto_744621 ?auto_744624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744622 ?auto_744623 ?auto_744624 )
      ( MAKE-3CRATE-VERIFY ?auto_744621 ?auto_744622 ?auto_744623 ?auto_744624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744642 - SURFACE
      ?auto_744643 - SURFACE
      ?auto_744644 - SURFACE
      ?auto_744645 - SURFACE
    )
    :vars
    (
      ?auto_744647 - HOIST
      ?auto_744648 - PLACE
      ?auto_744649 - TRUCK
      ?auto_744646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744647 ?auto_744648 ) ( SURFACE-AT ?auto_744644 ?auto_744648 ) ( CLEAR ?auto_744644 ) ( IS-CRATE ?auto_744645 ) ( not ( = ?auto_744644 ?auto_744645 ) ) ( AVAILABLE ?auto_744647 ) ( IN ?auto_744645 ?auto_744649 ) ( ON ?auto_744644 ?auto_744643 ) ( not ( = ?auto_744643 ?auto_744644 ) ) ( not ( = ?auto_744643 ?auto_744645 ) ) ( TRUCK-AT ?auto_744649 ?auto_744646 ) ( not ( = ?auto_744646 ?auto_744648 ) ) ( ON ?auto_744643 ?auto_744642 ) ( not ( = ?auto_744642 ?auto_744643 ) ) ( not ( = ?auto_744642 ?auto_744644 ) ) ( not ( = ?auto_744642 ?auto_744645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744643 ?auto_744644 ?auto_744645 )
      ( MAKE-3CRATE-VERIFY ?auto_744642 ?auto_744643 ?auto_744644 ?auto_744645 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744666 - SURFACE
      ?auto_744667 - SURFACE
      ?auto_744668 - SURFACE
      ?auto_744669 - SURFACE
    )
    :vars
    (
      ?auto_744672 - HOIST
      ?auto_744673 - PLACE
      ?auto_744671 - TRUCK
      ?auto_744670 - PLACE
      ?auto_744674 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_744672 ?auto_744673 ) ( SURFACE-AT ?auto_744668 ?auto_744673 ) ( CLEAR ?auto_744668 ) ( IS-CRATE ?auto_744669 ) ( not ( = ?auto_744668 ?auto_744669 ) ) ( AVAILABLE ?auto_744672 ) ( ON ?auto_744668 ?auto_744667 ) ( not ( = ?auto_744667 ?auto_744668 ) ) ( not ( = ?auto_744667 ?auto_744669 ) ) ( TRUCK-AT ?auto_744671 ?auto_744670 ) ( not ( = ?auto_744670 ?auto_744673 ) ) ( HOIST-AT ?auto_744674 ?auto_744670 ) ( LIFTING ?auto_744674 ?auto_744669 ) ( not ( = ?auto_744672 ?auto_744674 ) ) ( ON ?auto_744667 ?auto_744666 ) ( not ( = ?auto_744666 ?auto_744667 ) ) ( not ( = ?auto_744666 ?auto_744668 ) ) ( not ( = ?auto_744666 ?auto_744669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744667 ?auto_744668 ?auto_744669 )
      ( MAKE-3CRATE-VERIFY ?auto_744666 ?auto_744667 ?auto_744668 ?auto_744669 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744693 - SURFACE
      ?auto_744694 - SURFACE
      ?auto_744695 - SURFACE
      ?auto_744696 - SURFACE
    )
    :vars
    (
      ?auto_744701 - HOIST
      ?auto_744699 - PLACE
      ?auto_744700 - TRUCK
      ?auto_744697 - PLACE
      ?auto_744702 - HOIST
      ?auto_744698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_744701 ?auto_744699 ) ( SURFACE-AT ?auto_744695 ?auto_744699 ) ( CLEAR ?auto_744695 ) ( IS-CRATE ?auto_744696 ) ( not ( = ?auto_744695 ?auto_744696 ) ) ( AVAILABLE ?auto_744701 ) ( ON ?auto_744695 ?auto_744694 ) ( not ( = ?auto_744694 ?auto_744695 ) ) ( not ( = ?auto_744694 ?auto_744696 ) ) ( TRUCK-AT ?auto_744700 ?auto_744697 ) ( not ( = ?auto_744697 ?auto_744699 ) ) ( HOIST-AT ?auto_744702 ?auto_744697 ) ( not ( = ?auto_744701 ?auto_744702 ) ) ( AVAILABLE ?auto_744702 ) ( SURFACE-AT ?auto_744696 ?auto_744697 ) ( ON ?auto_744696 ?auto_744698 ) ( CLEAR ?auto_744696 ) ( not ( = ?auto_744695 ?auto_744698 ) ) ( not ( = ?auto_744696 ?auto_744698 ) ) ( not ( = ?auto_744694 ?auto_744698 ) ) ( ON ?auto_744694 ?auto_744693 ) ( not ( = ?auto_744693 ?auto_744694 ) ) ( not ( = ?auto_744693 ?auto_744695 ) ) ( not ( = ?auto_744693 ?auto_744696 ) ) ( not ( = ?auto_744693 ?auto_744698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744694 ?auto_744695 ?auto_744696 )
      ( MAKE-3CRATE-VERIFY ?auto_744693 ?auto_744694 ?auto_744695 ?auto_744696 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744721 - SURFACE
      ?auto_744722 - SURFACE
      ?auto_744723 - SURFACE
      ?auto_744724 - SURFACE
    )
    :vars
    (
      ?auto_744726 - HOIST
      ?auto_744730 - PLACE
      ?auto_744728 - PLACE
      ?auto_744727 - HOIST
      ?auto_744729 - SURFACE
      ?auto_744725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744726 ?auto_744730 ) ( SURFACE-AT ?auto_744723 ?auto_744730 ) ( CLEAR ?auto_744723 ) ( IS-CRATE ?auto_744724 ) ( not ( = ?auto_744723 ?auto_744724 ) ) ( AVAILABLE ?auto_744726 ) ( ON ?auto_744723 ?auto_744722 ) ( not ( = ?auto_744722 ?auto_744723 ) ) ( not ( = ?auto_744722 ?auto_744724 ) ) ( not ( = ?auto_744728 ?auto_744730 ) ) ( HOIST-AT ?auto_744727 ?auto_744728 ) ( not ( = ?auto_744726 ?auto_744727 ) ) ( AVAILABLE ?auto_744727 ) ( SURFACE-AT ?auto_744724 ?auto_744728 ) ( ON ?auto_744724 ?auto_744729 ) ( CLEAR ?auto_744724 ) ( not ( = ?auto_744723 ?auto_744729 ) ) ( not ( = ?auto_744724 ?auto_744729 ) ) ( not ( = ?auto_744722 ?auto_744729 ) ) ( TRUCK-AT ?auto_744725 ?auto_744730 ) ( ON ?auto_744722 ?auto_744721 ) ( not ( = ?auto_744721 ?auto_744722 ) ) ( not ( = ?auto_744721 ?auto_744723 ) ) ( not ( = ?auto_744721 ?auto_744724 ) ) ( not ( = ?auto_744721 ?auto_744729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744722 ?auto_744723 ?auto_744724 )
      ( MAKE-3CRATE-VERIFY ?auto_744721 ?auto_744722 ?auto_744723 ?auto_744724 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744749 - SURFACE
      ?auto_744750 - SURFACE
      ?auto_744751 - SURFACE
      ?auto_744752 - SURFACE
    )
    :vars
    (
      ?auto_744756 - HOIST
      ?auto_744758 - PLACE
      ?auto_744753 - PLACE
      ?auto_744754 - HOIST
      ?auto_744755 - SURFACE
      ?auto_744757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744756 ?auto_744758 ) ( IS-CRATE ?auto_744752 ) ( not ( = ?auto_744751 ?auto_744752 ) ) ( not ( = ?auto_744750 ?auto_744751 ) ) ( not ( = ?auto_744750 ?auto_744752 ) ) ( not ( = ?auto_744753 ?auto_744758 ) ) ( HOIST-AT ?auto_744754 ?auto_744753 ) ( not ( = ?auto_744756 ?auto_744754 ) ) ( AVAILABLE ?auto_744754 ) ( SURFACE-AT ?auto_744752 ?auto_744753 ) ( ON ?auto_744752 ?auto_744755 ) ( CLEAR ?auto_744752 ) ( not ( = ?auto_744751 ?auto_744755 ) ) ( not ( = ?auto_744752 ?auto_744755 ) ) ( not ( = ?auto_744750 ?auto_744755 ) ) ( TRUCK-AT ?auto_744757 ?auto_744758 ) ( SURFACE-AT ?auto_744750 ?auto_744758 ) ( CLEAR ?auto_744750 ) ( LIFTING ?auto_744756 ?auto_744751 ) ( IS-CRATE ?auto_744751 ) ( ON ?auto_744750 ?auto_744749 ) ( not ( = ?auto_744749 ?auto_744750 ) ) ( not ( = ?auto_744749 ?auto_744751 ) ) ( not ( = ?auto_744749 ?auto_744752 ) ) ( not ( = ?auto_744749 ?auto_744755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744750 ?auto_744751 ?auto_744752 )
      ( MAKE-3CRATE-VERIFY ?auto_744749 ?auto_744750 ?auto_744751 ?auto_744752 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_744777 - SURFACE
      ?auto_744778 - SURFACE
      ?auto_744779 - SURFACE
      ?auto_744780 - SURFACE
    )
    :vars
    (
      ?auto_744781 - HOIST
      ?auto_744784 - PLACE
      ?auto_744786 - PLACE
      ?auto_744782 - HOIST
      ?auto_744783 - SURFACE
      ?auto_744785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744781 ?auto_744784 ) ( IS-CRATE ?auto_744780 ) ( not ( = ?auto_744779 ?auto_744780 ) ) ( not ( = ?auto_744778 ?auto_744779 ) ) ( not ( = ?auto_744778 ?auto_744780 ) ) ( not ( = ?auto_744786 ?auto_744784 ) ) ( HOIST-AT ?auto_744782 ?auto_744786 ) ( not ( = ?auto_744781 ?auto_744782 ) ) ( AVAILABLE ?auto_744782 ) ( SURFACE-AT ?auto_744780 ?auto_744786 ) ( ON ?auto_744780 ?auto_744783 ) ( CLEAR ?auto_744780 ) ( not ( = ?auto_744779 ?auto_744783 ) ) ( not ( = ?auto_744780 ?auto_744783 ) ) ( not ( = ?auto_744778 ?auto_744783 ) ) ( TRUCK-AT ?auto_744785 ?auto_744784 ) ( SURFACE-AT ?auto_744778 ?auto_744784 ) ( CLEAR ?auto_744778 ) ( IS-CRATE ?auto_744779 ) ( AVAILABLE ?auto_744781 ) ( IN ?auto_744779 ?auto_744785 ) ( ON ?auto_744778 ?auto_744777 ) ( not ( = ?auto_744777 ?auto_744778 ) ) ( not ( = ?auto_744777 ?auto_744779 ) ) ( not ( = ?auto_744777 ?auto_744780 ) ) ( not ( = ?auto_744777 ?auto_744783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_744778 ?auto_744779 ?auto_744780 )
      ( MAKE-3CRATE-VERIFY ?auto_744777 ?auto_744778 ?auto_744779 ?auto_744780 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745068 - SURFACE
      ?auto_745069 - SURFACE
      ?auto_745070 - SURFACE
      ?auto_745071 - SURFACE
      ?auto_745072 - SURFACE
    )
    :vars
    (
      ?auto_745073 - HOIST
      ?auto_745074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745073 ?auto_745074 ) ( SURFACE-AT ?auto_745071 ?auto_745074 ) ( CLEAR ?auto_745071 ) ( LIFTING ?auto_745073 ?auto_745072 ) ( IS-CRATE ?auto_745072 ) ( not ( = ?auto_745071 ?auto_745072 ) ) ( ON ?auto_745069 ?auto_745068 ) ( ON ?auto_745070 ?auto_745069 ) ( ON ?auto_745071 ?auto_745070 ) ( not ( = ?auto_745068 ?auto_745069 ) ) ( not ( = ?auto_745068 ?auto_745070 ) ) ( not ( = ?auto_745068 ?auto_745071 ) ) ( not ( = ?auto_745068 ?auto_745072 ) ) ( not ( = ?auto_745069 ?auto_745070 ) ) ( not ( = ?auto_745069 ?auto_745071 ) ) ( not ( = ?auto_745069 ?auto_745072 ) ) ( not ( = ?auto_745070 ?auto_745071 ) ) ( not ( = ?auto_745070 ?auto_745072 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_745071 ?auto_745072 )
      ( MAKE-4CRATE-VERIFY ?auto_745068 ?auto_745069 ?auto_745070 ?auto_745071 ?auto_745072 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745093 - SURFACE
      ?auto_745094 - SURFACE
      ?auto_745095 - SURFACE
      ?auto_745096 - SURFACE
      ?auto_745097 - SURFACE
    )
    :vars
    (
      ?auto_745099 - HOIST
      ?auto_745100 - PLACE
      ?auto_745098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745099 ?auto_745100 ) ( SURFACE-AT ?auto_745096 ?auto_745100 ) ( CLEAR ?auto_745096 ) ( IS-CRATE ?auto_745097 ) ( not ( = ?auto_745096 ?auto_745097 ) ) ( TRUCK-AT ?auto_745098 ?auto_745100 ) ( AVAILABLE ?auto_745099 ) ( IN ?auto_745097 ?auto_745098 ) ( ON ?auto_745096 ?auto_745095 ) ( not ( = ?auto_745095 ?auto_745096 ) ) ( not ( = ?auto_745095 ?auto_745097 ) ) ( ON ?auto_745094 ?auto_745093 ) ( ON ?auto_745095 ?auto_745094 ) ( not ( = ?auto_745093 ?auto_745094 ) ) ( not ( = ?auto_745093 ?auto_745095 ) ) ( not ( = ?auto_745093 ?auto_745096 ) ) ( not ( = ?auto_745093 ?auto_745097 ) ) ( not ( = ?auto_745094 ?auto_745095 ) ) ( not ( = ?auto_745094 ?auto_745096 ) ) ( not ( = ?auto_745094 ?auto_745097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745095 ?auto_745096 ?auto_745097 )
      ( MAKE-4CRATE-VERIFY ?auto_745093 ?auto_745094 ?auto_745095 ?auto_745096 ?auto_745097 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745123 - SURFACE
      ?auto_745124 - SURFACE
      ?auto_745125 - SURFACE
      ?auto_745126 - SURFACE
      ?auto_745127 - SURFACE
    )
    :vars
    (
      ?auto_745128 - HOIST
      ?auto_745131 - PLACE
      ?auto_745129 - TRUCK
      ?auto_745130 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745128 ?auto_745131 ) ( SURFACE-AT ?auto_745126 ?auto_745131 ) ( CLEAR ?auto_745126 ) ( IS-CRATE ?auto_745127 ) ( not ( = ?auto_745126 ?auto_745127 ) ) ( AVAILABLE ?auto_745128 ) ( IN ?auto_745127 ?auto_745129 ) ( ON ?auto_745126 ?auto_745125 ) ( not ( = ?auto_745125 ?auto_745126 ) ) ( not ( = ?auto_745125 ?auto_745127 ) ) ( TRUCK-AT ?auto_745129 ?auto_745130 ) ( not ( = ?auto_745130 ?auto_745131 ) ) ( ON ?auto_745124 ?auto_745123 ) ( ON ?auto_745125 ?auto_745124 ) ( not ( = ?auto_745123 ?auto_745124 ) ) ( not ( = ?auto_745123 ?auto_745125 ) ) ( not ( = ?auto_745123 ?auto_745126 ) ) ( not ( = ?auto_745123 ?auto_745127 ) ) ( not ( = ?auto_745124 ?auto_745125 ) ) ( not ( = ?auto_745124 ?auto_745126 ) ) ( not ( = ?auto_745124 ?auto_745127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745125 ?auto_745126 ?auto_745127 )
      ( MAKE-4CRATE-VERIFY ?auto_745123 ?auto_745124 ?auto_745125 ?auto_745126 ?auto_745127 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745157 - SURFACE
      ?auto_745158 - SURFACE
      ?auto_745159 - SURFACE
      ?auto_745160 - SURFACE
      ?auto_745161 - SURFACE
    )
    :vars
    (
      ?auto_745166 - HOIST
      ?auto_745164 - PLACE
      ?auto_745163 - TRUCK
      ?auto_745162 - PLACE
      ?auto_745165 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_745166 ?auto_745164 ) ( SURFACE-AT ?auto_745160 ?auto_745164 ) ( CLEAR ?auto_745160 ) ( IS-CRATE ?auto_745161 ) ( not ( = ?auto_745160 ?auto_745161 ) ) ( AVAILABLE ?auto_745166 ) ( ON ?auto_745160 ?auto_745159 ) ( not ( = ?auto_745159 ?auto_745160 ) ) ( not ( = ?auto_745159 ?auto_745161 ) ) ( TRUCK-AT ?auto_745163 ?auto_745162 ) ( not ( = ?auto_745162 ?auto_745164 ) ) ( HOIST-AT ?auto_745165 ?auto_745162 ) ( LIFTING ?auto_745165 ?auto_745161 ) ( not ( = ?auto_745166 ?auto_745165 ) ) ( ON ?auto_745158 ?auto_745157 ) ( ON ?auto_745159 ?auto_745158 ) ( not ( = ?auto_745157 ?auto_745158 ) ) ( not ( = ?auto_745157 ?auto_745159 ) ) ( not ( = ?auto_745157 ?auto_745160 ) ) ( not ( = ?auto_745157 ?auto_745161 ) ) ( not ( = ?auto_745158 ?auto_745159 ) ) ( not ( = ?auto_745158 ?auto_745160 ) ) ( not ( = ?auto_745158 ?auto_745161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745159 ?auto_745160 ?auto_745161 )
      ( MAKE-4CRATE-VERIFY ?auto_745157 ?auto_745158 ?auto_745159 ?auto_745160 ?auto_745161 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745195 - SURFACE
      ?auto_745196 - SURFACE
      ?auto_745197 - SURFACE
      ?auto_745198 - SURFACE
      ?auto_745199 - SURFACE
    )
    :vars
    (
      ?auto_745202 - HOIST
      ?auto_745203 - PLACE
      ?auto_745200 - TRUCK
      ?auto_745201 - PLACE
      ?auto_745205 - HOIST
      ?auto_745204 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745202 ?auto_745203 ) ( SURFACE-AT ?auto_745198 ?auto_745203 ) ( CLEAR ?auto_745198 ) ( IS-CRATE ?auto_745199 ) ( not ( = ?auto_745198 ?auto_745199 ) ) ( AVAILABLE ?auto_745202 ) ( ON ?auto_745198 ?auto_745197 ) ( not ( = ?auto_745197 ?auto_745198 ) ) ( not ( = ?auto_745197 ?auto_745199 ) ) ( TRUCK-AT ?auto_745200 ?auto_745201 ) ( not ( = ?auto_745201 ?auto_745203 ) ) ( HOIST-AT ?auto_745205 ?auto_745201 ) ( not ( = ?auto_745202 ?auto_745205 ) ) ( AVAILABLE ?auto_745205 ) ( SURFACE-AT ?auto_745199 ?auto_745201 ) ( ON ?auto_745199 ?auto_745204 ) ( CLEAR ?auto_745199 ) ( not ( = ?auto_745198 ?auto_745204 ) ) ( not ( = ?auto_745199 ?auto_745204 ) ) ( not ( = ?auto_745197 ?auto_745204 ) ) ( ON ?auto_745196 ?auto_745195 ) ( ON ?auto_745197 ?auto_745196 ) ( not ( = ?auto_745195 ?auto_745196 ) ) ( not ( = ?auto_745195 ?auto_745197 ) ) ( not ( = ?auto_745195 ?auto_745198 ) ) ( not ( = ?auto_745195 ?auto_745199 ) ) ( not ( = ?auto_745195 ?auto_745204 ) ) ( not ( = ?auto_745196 ?auto_745197 ) ) ( not ( = ?auto_745196 ?auto_745198 ) ) ( not ( = ?auto_745196 ?auto_745199 ) ) ( not ( = ?auto_745196 ?auto_745204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745197 ?auto_745198 ?auto_745199 )
      ( MAKE-4CRATE-VERIFY ?auto_745195 ?auto_745196 ?auto_745197 ?auto_745198 ?auto_745199 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745234 - SURFACE
      ?auto_745235 - SURFACE
      ?auto_745236 - SURFACE
      ?auto_745237 - SURFACE
      ?auto_745238 - SURFACE
    )
    :vars
    (
      ?auto_745244 - HOIST
      ?auto_745239 - PLACE
      ?auto_745241 - PLACE
      ?auto_745240 - HOIST
      ?auto_745243 - SURFACE
      ?auto_745242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745244 ?auto_745239 ) ( SURFACE-AT ?auto_745237 ?auto_745239 ) ( CLEAR ?auto_745237 ) ( IS-CRATE ?auto_745238 ) ( not ( = ?auto_745237 ?auto_745238 ) ) ( AVAILABLE ?auto_745244 ) ( ON ?auto_745237 ?auto_745236 ) ( not ( = ?auto_745236 ?auto_745237 ) ) ( not ( = ?auto_745236 ?auto_745238 ) ) ( not ( = ?auto_745241 ?auto_745239 ) ) ( HOIST-AT ?auto_745240 ?auto_745241 ) ( not ( = ?auto_745244 ?auto_745240 ) ) ( AVAILABLE ?auto_745240 ) ( SURFACE-AT ?auto_745238 ?auto_745241 ) ( ON ?auto_745238 ?auto_745243 ) ( CLEAR ?auto_745238 ) ( not ( = ?auto_745237 ?auto_745243 ) ) ( not ( = ?auto_745238 ?auto_745243 ) ) ( not ( = ?auto_745236 ?auto_745243 ) ) ( TRUCK-AT ?auto_745242 ?auto_745239 ) ( ON ?auto_745235 ?auto_745234 ) ( ON ?auto_745236 ?auto_745235 ) ( not ( = ?auto_745234 ?auto_745235 ) ) ( not ( = ?auto_745234 ?auto_745236 ) ) ( not ( = ?auto_745234 ?auto_745237 ) ) ( not ( = ?auto_745234 ?auto_745238 ) ) ( not ( = ?auto_745234 ?auto_745243 ) ) ( not ( = ?auto_745235 ?auto_745236 ) ) ( not ( = ?auto_745235 ?auto_745237 ) ) ( not ( = ?auto_745235 ?auto_745238 ) ) ( not ( = ?auto_745235 ?auto_745243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745236 ?auto_745237 ?auto_745238 )
      ( MAKE-4CRATE-VERIFY ?auto_745234 ?auto_745235 ?auto_745236 ?auto_745237 ?auto_745238 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745273 - SURFACE
      ?auto_745274 - SURFACE
      ?auto_745275 - SURFACE
      ?auto_745276 - SURFACE
      ?auto_745277 - SURFACE
    )
    :vars
    (
      ?auto_745282 - HOIST
      ?auto_745279 - PLACE
      ?auto_745278 - PLACE
      ?auto_745280 - HOIST
      ?auto_745281 - SURFACE
      ?auto_745283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745282 ?auto_745279 ) ( IS-CRATE ?auto_745277 ) ( not ( = ?auto_745276 ?auto_745277 ) ) ( not ( = ?auto_745275 ?auto_745276 ) ) ( not ( = ?auto_745275 ?auto_745277 ) ) ( not ( = ?auto_745278 ?auto_745279 ) ) ( HOIST-AT ?auto_745280 ?auto_745278 ) ( not ( = ?auto_745282 ?auto_745280 ) ) ( AVAILABLE ?auto_745280 ) ( SURFACE-AT ?auto_745277 ?auto_745278 ) ( ON ?auto_745277 ?auto_745281 ) ( CLEAR ?auto_745277 ) ( not ( = ?auto_745276 ?auto_745281 ) ) ( not ( = ?auto_745277 ?auto_745281 ) ) ( not ( = ?auto_745275 ?auto_745281 ) ) ( TRUCK-AT ?auto_745283 ?auto_745279 ) ( SURFACE-AT ?auto_745275 ?auto_745279 ) ( CLEAR ?auto_745275 ) ( LIFTING ?auto_745282 ?auto_745276 ) ( IS-CRATE ?auto_745276 ) ( ON ?auto_745274 ?auto_745273 ) ( ON ?auto_745275 ?auto_745274 ) ( not ( = ?auto_745273 ?auto_745274 ) ) ( not ( = ?auto_745273 ?auto_745275 ) ) ( not ( = ?auto_745273 ?auto_745276 ) ) ( not ( = ?auto_745273 ?auto_745277 ) ) ( not ( = ?auto_745273 ?auto_745281 ) ) ( not ( = ?auto_745274 ?auto_745275 ) ) ( not ( = ?auto_745274 ?auto_745276 ) ) ( not ( = ?auto_745274 ?auto_745277 ) ) ( not ( = ?auto_745274 ?auto_745281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745275 ?auto_745276 ?auto_745277 )
      ( MAKE-4CRATE-VERIFY ?auto_745273 ?auto_745274 ?auto_745275 ?auto_745276 ?auto_745277 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_745312 - SURFACE
      ?auto_745313 - SURFACE
      ?auto_745314 - SURFACE
      ?auto_745315 - SURFACE
      ?auto_745316 - SURFACE
    )
    :vars
    (
      ?auto_745319 - HOIST
      ?auto_745321 - PLACE
      ?auto_745322 - PLACE
      ?auto_745318 - HOIST
      ?auto_745320 - SURFACE
      ?auto_745317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745319 ?auto_745321 ) ( IS-CRATE ?auto_745316 ) ( not ( = ?auto_745315 ?auto_745316 ) ) ( not ( = ?auto_745314 ?auto_745315 ) ) ( not ( = ?auto_745314 ?auto_745316 ) ) ( not ( = ?auto_745322 ?auto_745321 ) ) ( HOIST-AT ?auto_745318 ?auto_745322 ) ( not ( = ?auto_745319 ?auto_745318 ) ) ( AVAILABLE ?auto_745318 ) ( SURFACE-AT ?auto_745316 ?auto_745322 ) ( ON ?auto_745316 ?auto_745320 ) ( CLEAR ?auto_745316 ) ( not ( = ?auto_745315 ?auto_745320 ) ) ( not ( = ?auto_745316 ?auto_745320 ) ) ( not ( = ?auto_745314 ?auto_745320 ) ) ( TRUCK-AT ?auto_745317 ?auto_745321 ) ( SURFACE-AT ?auto_745314 ?auto_745321 ) ( CLEAR ?auto_745314 ) ( IS-CRATE ?auto_745315 ) ( AVAILABLE ?auto_745319 ) ( IN ?auto_745315 ?auto_745317 ) ( ON ?auto_745313 ?auto_745312 ) ( ON ?auto_745314 ?auto_745313 ) ( not ( = ?auto_745312 ?auto_745313 ) ) ( not ( = ?auto_745312 ?auto_745314 ) ) ( not ( = ?auto_745312 ?auto_745315 ) ) ( not ( = ?auto_745312 ?auto_745316 ) ) ( not ( = ?auto_745312 ?auto_745320 ) ) ( not ( = ?auto_745313 ?auto_745314 ) ) ( not ( = ?auto_745313 ?auto_745315 ) ) ( not ( = ?auto_745313 ?auto_745316 ) ) ( not ( = ?auto_745313 ?auto_745320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_745314 ?auto_745315 ?auto_745316 )
      ( MAKE-4CRATE-VERIFY ?auto_745312 ?auto_745313 ?auto_745314 ?auto_745315 ?auto_745316 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_745972 - SURFACE
      ?auto_745973 - SURFACE
      ?auto_745974 - SURFACE
      ?auto_745975 - SURFACE
      ?auto_745976 - SURFACE
      ?auto_745977 - SURFACE
    )
    :vars
    (
      ?auto_745978 - HOIST
      ?auto_745979 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_745978 ?auto_745979 ) ( SURFACE-AT ?auto_745976 ?auto_745979 ) ( CLEAR ?auto_745976 ) ( LIFTING ?auto_745978 ?auto_745977 ) ( IS-CRATE ?auto_745977 ) ( not ( = ?auto_745976 ?auto_745977 ) ) ( ON ?auto_745973 ?auto_745972 ) ( ON ?auto_745974 ?auto_745973 ) ( ON ?auto_745975 ?auto_745974 ) ( ON ?auto_745976 ?auto_745975 ) ( not ( = ?auto_745972 ?auto_745973 ) ) ( not ( = ?auto_745972 ?auto_745974 ) ) ( not ( = ?auto_745972 ?auto_745975 ) ) ( not ( = ?auto_745972 ?auto_745976 ) ) ( not ( = ?auto_745972 ?auto_745977 ) ) ( not ( = ?auto_745973 ?auto_745974 ) ) ( not ( = ?auto_745973 ?auto_745975 ) ) ( not ( = ?auto_745973 ?auto_745976 ) ) ( not ( = ?auto_745973 ?auto_745977 ) ) ( not ( = ?auto_745974 ?auto_745975 ) ) ( not ( = ?auto_745974 ?auto_745976 ) ) ( not ( = ?auto_745974 ?auto_745977 ) ) ( not ( = ?auto_745975 ?auto_745976 ) ) ( not ( = ?auto_745975 ?auto_745977 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_745976 ?auto_745977 )
      ( MAKE-5CRATE-VERIFY ?auto_745972 ?auto_745973 ?auto_745974 ?auto_745975 ?auto_745976 ?auto_745977 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746006 - SURFACE
      ?auto_746007 - SURFACE
      ?auto_746008 - SURFACE
      ?auto_746009 - SURFACE
      ?auto_746010 - SURFACE
      ?auto_746011 - SURFACE
    )
    :vars
    (
      ?auto_746014 - HOIST
      ?auto_746013 - PLACE
      ?auto_746012 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_746014 ?auto_746013 ) ( SURFACE-AT ?auto_746010 ?auto_746013 ) ( CLEAR ?auto_746010 ) ( IS-CRATE ?auto_746011 ) ( not ( = ?auto_746010 ?auto_746011 ) ) ( TRUCK-AT ?auto_746012 ?auto_746013 ) ( AVAILABLE ?auto_746014 ) ( IN ?auto_746011 ?auto_746012 ) ( ON ?auto_746010 ?auto_746009 ) ( not ( = ?auto_746009 ?auto_746010 ) ) ( not ( = ?auto_746009 ?auto_746011 ) ) ( ON ?auto_746007 ?auto_746006 ) ( ON ?auto_746008 ?auto_746007 ) ( ON ?auto_746009 ?auto_746008 ) ( not ( = ?auto_746006 ?auto_746007 ) ) ( not ( = ?auto_746006 ?auto_746008 ) ) ( not ( = ?auto_746006 ?auto_746009 ) ) ( not ( = ?auto_746006 ?auto_746010 ) ) ( not ( = ?auto_746006 ?auto_746011 ) ) ( not ( = ?auto_746007 ?auto_746008 ) ) ( not ( = ?auto_746007 ?auto_746009 ) ) ( not ( = ?auto_746007 ?auto_746010 ) ) ( not ( = ?auto_746007 ?auto_746011 ) ) ( not ( = ?auto_746008 ?auto_746009 ) ) ( not ( = ?auto_746008 ?auto_746010 ) ) ( not ( = ?auto_746008 ?auto_746011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746009 ?auto_746010 ?auto_746011 )
      ( MAKE-5CRATE-VERIFY ?auto_746006 ?auto_746007 ?auto_746008 ?auto_746009 ?auto_746010 ?auto_746011 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746046 - SURFACE
      ?auto_746047 - SURFACE
      ?auto_746048 - SURFACE
      ?auto_746049 - SURFACE
      ?auto_746050 - SURFACE
      ?auto_746051 - SURFACE
    )
    :vars
    (
      ?auto_746054 - HOIST
      ?auto_746055 - PLACE
      ?auto_746053 - TRUCK
      ?auto_746052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_746054 ?auto_746055 ) ( SURFACE-AT ?auto_746050 ?auto_746055 ) ( CLEAR ?auto_746050 ) ( IS-CRATE ?auto_746051 ) ( not ( = ?auto_746050 ?auto_746051 ) ) ( AVAILABLE ?auto_746054 ) ( IN ?auto_746051 ?auto_746053 ) ( ON ?auto_746050 ?auto_746049 ) ( not ( = ?auto_746049 ?auto_746050 ) ) ( not ( = ?auto_746049 ?auto_746051 ) ) ( TRUCK-AT ?auto_746053 ?auto_746052 ) ( not ( = ?auto_746052 ?auto_746055 ) ) ( ON ?auto_746047 ?auto_746046 ) ( ON ?auto_746048 ?auto_746047 ) ( ON ?auto_746049 ?auto_746048 ) ( not ( = ?auto_746046 ?auto_746047 ) ) ( not ( = ?auto_746046 ?auto_746048 ) ) ( not ( = ?auto_746046 ?auto_746049 ) ) ( not ( = ?auto_746046 ?auto_746050 ) ) ( not ( = ?auto_746046 ?auto_746051 ) ) ( not ( = ?auto_746047 ?auto_746048 ) ) ( not ( = ?auto_746047 ?auto_746049 ) ) ( not ( = ?auto_746047 ?auto_746050 ) ) ( not ( = ?auto_746047 ?auto_746051 ) ) ( not ( = ?auto_746048 ?auto_746049 ) ) ( not ( = ?auto_746048 ?auto_746050 ) ) ( not ( = ?auto_746048 ?auto_746051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746049 ?auto_746050 ?auto_746051 )
      ( MAKE-5CRATE-VERIFY ?auto_746046 ?auto_746047 ?auto_746048 ?auto_746049 ?auto_746050 ?auto_746051 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746091 - SURFACE
      ?auto_746092 - SURFACE
      ?auto_746093 - SURFACE
      ?auto_746094 - SURFACE
      ?auto_746095 - SURFACE
      ?auto_746096 - SURFACE
    )
    :vars
    (
      ?auto_746097 - HOIST
      ?auto_746101 - PLACE
      ?auto_746100 - TRUCK
      ?auto_746099 - PLACE
      ?auto_746098 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_746097 ?auto_746101 ) ( SURFACE-AT ?auto_746095 ?auto_746101 ) ( CLEAR ?auto_746095 ) ( IS-CRATE ?auto_746096 ) ( not ( = ?auto_746095 ?auto_746096 ) ) ( AVAILABLE ?auto_746097 ) ( ON ?auto_746095 ?auto_746094 ) ( not ( = ?auto_746094 ?auto_746095 ) ) ( not ( = ?auto_746094 ?auto_746096 ) ) ( TRUCK-AT ?auto_746100 ?auto_746099 ) ( not ( = ?auto_746099 ?auto_746101 ) ) ( HOIST-AT ?auto_746098 ?auto_746099 ) ( LIFTING ?auto_746098 ?auto_746096 ) ( not ( = ?auto_746097 ?auto_746098 ) ) ( ON ?auto_746092 ?auto_746091 ) ( ON ?auto_746093 ?auto_746092 ) ( ON ?auto_746094 ?auto_746093 ) ( not ( = ?auto_746091 ?auto_746092 ) ) ( not ( = ?auto_746091 ?auto_746093 ) ) ( not ( = ?auto_746091 ?auto_746094 ) ) ( not ( = ?auto_746091 ?auto_746095 ) ) ( not ( = ?auto_746091 ?auto_746096 ) ) ( not ( = ?auto_746092 ?auto_746093 ) ) ( not ( = ?auto_746092 ?auto_746094 ) ) ( not ( = ?auto_746092 ?auto_746095 ) ) ( not ( = ?auto_746092 ?auto_746096 ) ) ( not ( = ?auto_746093 ?auto_746094 ) ) ( not ( = ?auto_746093 ?auto_746095 ) ) ( not ( = ?auto_746093 ?auto_746096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746094 ?auto_746095 ?auto_746096 )
      ( MAKE-5CRATE-VERIFY ?auto_746091 ?auto_746092 ?auto_746093 ?auto_746094 ?auto_746095 ?auto_746096 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746141 - SURFACE
      ?auto_746142 - SURFACE
      ?auto_746143 - SURFACE
      ?auto_746144 - SURFACE
      ?auto_746145 - SURFACE
      ?auto_746146 - SURFACE
    )
    :vars
    (
      ?auto_746152 - HOIST
      ?auto_746147 - PLACE
      ?auto_746148 - TRUCK
      ?auto_746150 - PLACE
      ?auto_746149 - HOIST
      ?auto_746151 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_746152 ?auto_746147 ) ( SURFACE-AT ?auto_746145 ?auto_746147 ) ( CLEAR ?auto_746145 ) ( IS-CRATE ?auto_746146 ) ( not ( = ?auto_746145 ?auto_746146 ) ) ( AVAILABLE ?auto_746152 ) ( ON ?auto_746145 ?auto_746144 ) ( not ( = ?auto_746144 ?auto_746145 ) ) ( not ( = ?auto_746144 ?auto_746146 ) ) ( TRUCK-AT ?auto_746148 ?auto_746150 ) ( not ( = ?auto_746150 ?auto_746147 ) ) ( HOIST-AT ?auto_746149 ?auto_746150 ) ( not ( = ?auto_746152 ?auto_746149 ) ) ( AVAILABLE ?auto_746149 ) ( SURFACE-AT ?auto_746146 ?auto_746150 ) ( ON ?auto_746146 ?auto_746151 ) ( CLEAR ?auto_746146 ) ( not ( = ?auto_746145 ?auto_746151 ) ) ( not ( = ?auto_746146 ?auto_746151 ) ) ( not ( = ?auto_746144 ?auto_746151 ) ) ( ON ?auto_746142 ?auto_746141 ) ( ON ?auto_746143 ?auto_746142 ) ( ON ?auto_746144 ?auto_746143 ) ( not ( = ?auto_746141 ?auto_746142 ) ) ( not ( = ?auto_746141 ?auto_746143 ) ) ( not ( = ?auto_746141 ?auto_746144 ) ) ( not ( = ?auto_746141 ?auto_746145 ) ) ( not ( = ?auto_746141 ?auto_746146 ) ) ( not ( = ?auto_746141 ?auto_746151 ) ) ( not ( = ?auto_746142 ?auto_746143 ) ) ( not ( = ?auto_746142 ?auto_746144 ) ) ( not ( = ?auto_746142 ?auto_746145 ) ) ( not ( = ?auto_746142 ?auto_746146 ) ) ( not ( = ?auto_746142 ?auto_746151 ) ) ( not ( = ?auto_746143 ?auto_746144 ) ) ( not ( = ?auto_746143 ?auto_746145 ) ) ( not ( = ?auto_746143 ?auto_746146 ) ) ( not ( = ?auto_746143 ?auto_746151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746144 ?auto_746145 ?auto_746146 )
      ( MAKE-5CRATE-VERIFY ?auto_746141 ?auto_746142 ?auto_746143 ?auto_746144 ?auto_746145 ?auto_746146 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746192 - SURFACE
      ?auto_746193 - SURFACE
      ?auto_746194 - SURFACE
      ?auto_746195 - SURFACE
      ?auto_746196 - SURFACE
      ?auto_746197 - SURFACE
    )
    :vars
    (
      ?auto_746199 - HOIST
      ?auto_746202 - PLACE
      ?auto_746200 - PLACE
      ?auto_746198 - HOIST
      ?auto_746203 - SURFACE
      ?auto_746201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_746199 ?auto_746202 ) ( SURFACE-AT ?auto_746196 ?auto_746202 ) ( CLEAR ?auto_746196 ) ( IS-CRATE ?auto_746197 ) ( not ( = ?auto_746196 ?auto_746197 ) ) ( AVAILABLE ?auto_746199 ) ( ON ?auto_746196 ?auto_746195 ) ( not ( = ?auto_746195 ?auto_746196 ) ) ( not ( = ?auto_746195 ?auto_746197 ) ) ( not ( = ?auto_746200 ?auto_746202 ) ) ( HOIST-AT ?auto_746198 ?auto_746200 ) ( not ( = ?auto_746199 ?auto_746198 ) ) ( AVAILABLE ?auto_746198 ) ( SURFACE-AT ?auto_746197 ?auto_746200 ) ( ON ?auto_746197 ?auto_746203 ) ( CLEAR ?auto_746197 ) ( not ( = ?auto_746196 ?auto_746203 ) ) ( not ( = ?auto_746197 ?auto_746203 ) ) ( not ( = ?auto_746195 ?auto_746203 ) ) ( TRUCK-AT ?auto_746201 ?auto_746202 ) ( ON ?auto_746193 ?auto_746192 ) ( ON ?auto_746194 ?auto_746193 ) ( ON ?auto_746195 ?auto_746194 ) ( not ( = ?auto_746192 ?auto_746193 ) ) ( not ( = ?auto_746192 ?auto_746194 ) ) ( not ( = ?auto_746192 ?auto_746195 ) ) ( not ( = ?auto_746192 ?auto_746196 ) ) ( not ( = ?auto_746192 ?auto_746197 ) ) ( not ( = ?auto_746192 ?auto_746203 ) ) ( not ( = ?auto_746193 ?auto_746194 ) ) ( not ( = ?auto_746193 ?auto_746195 ) ) ( not ( = ?auto_746193 ?auto_746196 ) ) ( not ( = ?auto_746193 ?auto_746197 ) ) ( not ( = ?auto_746193 ?auto_746203 ) ) ( not ( = ?auto_746194 ?auto_746195 ) ) ( not ( = ?auto_746194 ?auto_746196 ) ) ( not ( = ?auto_746194 ?auto_746197 ) ) ( not ( = ?auto_746194 ?auto_746203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746195 ?auto_746196 ?auto_746197 )
      ( MAKE-5CRATE-VERIFY ?auto_746192 ?auto_746193 ?auto_746194 ?auto_746195 ?auto_746196 ?auto_746197 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746243 - SURFACE
      ?auto_746244 - SURFACE
      ?auto_746245 - SURFACE
      ?auto_746246 - SURFACE
      ?auto_746247 - SURFACE
      ?auto_746248 - SURFACE
    )
    :vars
    (
      ?auto_746254 - HOIST
      ?auto_746250 - PLACE
      ?auto_746251 - PLACE
      ?auto_746252 - HOIST
      ?auto_746249 - SURFACE
      ?auto_746253 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_746254 ?auto_746250 ) ( IS-CRATE ?auto_746248 ) ( not ( = ?auto_746247 ?auto_746248 ) ) ( not ( = ?auto_746246 ?auto_746247 ) ) ( not ( = ?auto_746246 ?auto_746248 ) ) ( not ( = ?auto_746251 ?auto_746250 ) ) ( HOIST-AT ?auto_746252 ?auto_746251 ) ( not ( = ?auto_746254 ?auto_746252 ) ) ( AVAILABLE ?auto_746252 ) ( SURFACE-AT ?auto_746248 ?auto_746251 ) ( ON ?auto_746248 ?auto_746249 ) ( CLEAR ?auto_746248 ) ( not ( = ?auto_746247 ?auto_746249 ) ) ( not ( = ?auto_746248 ?auto_746249 ) ) ( not ( = ?auto_746246 ?auto_746249 ) ) ( TRUCK-AT ?auto_746253 ?auto_746250 ) ( SURFACE-AT ?auto_746246 ?auto_746250 ) ( CLEAR ?auto_746246 ) ( LIFTING ?auto_746254 ?auto_746247 ) ( IS-CRATE ?auto_746247 ) ( ON ?auto_746244 ?auto_746243 ) ( ON ?auto_746245 ?auto_746244 ) ( ON ?auto_746246 ?auto_746245 ) ( not ( = ?auto_746243 ?auto_746244 ) ) ( not ( = ?auto_746243 ?auto_746245 ) ) ( not ( = ?auto_746243 ?auto_746246 ) ) ( not ( = ?auto_746243 ?auto_746247 ) ) ( not ( = ?auto_746243 ?auto_746248 ) ) ( not ( = ?auto_746243 ?auto_746249 ) ) ( not ( = ?auto_746244 ?auto_746245 ) ) ( not ( = ?auto_746244 ?auto_746246 ) ) ( not ( = ?auto_746244 ?auto_746247 ) ) ( not ( = ?auto_746244 ?auto_746248 ) ) ( not ( = ?auto_746244 ?auto_746249 ) ) ( not ( = ?auto_746245 ?auto_746246 ) ) ( not ( = ?auto_746245 ?auto_746247 ) ) ( not ( = ?auto_746245 ?auto_746248 ) ) ( not ( = ?auto_746245 ?auto_746249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746246 ?auto_746247 ?auto_746248 )
      ( MAKE-5CRATE-VERIFY ?auto_746243 ?auto_746244 ?auto_746245 ?auto_746246 ?auto_746247 ?auto_746248 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_746294 - SURFACE
      ?auto_746295 - SURFACE
      ?auto_746296 - SURFACE
      ?auto_746297 - SURFACE
      ?auto_746298 - SURFACE
      ?auto_746299 - SURFACE
    )
    :vars
    (
      ?auto_746305 - HOIST
      ?auto_746300 - PLACE
      ?auto_746304 - PLACE
      ?auto_746303 - HOIST
      ?auto_746301 - SURFACE
      ?auto_746302 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_746305 ?auto_746300 ) ( IS-CRATE ?auto_746299 ) ( not ( = ?auto_746298 ?auto_746299 ) ) ( not ( = ?auto_746297 ?auto_746298 ) ) ( not ( = ?auto_746297 ?auto_746299 ) ) ( not ( = ?auto_746304 ?auto_746300 ) ) ( HOIST-AT ?auto_746303 ?auto_746304 ) ( not ( = ?auto_746305 ?auto_746303 ) ) ( AVAILABLE ?auto_746303 ) ( SURFACE-AT ?auto_746299 ?auto_746304 ) ( ON ?auto_746299 ?auto_746301 ) ( CLEAR ?auto_746299 ) ( not ( = ?auto_746298 ?auto_746301 ) ) ( not ( = ?auto_746299 ?auto_746301 ) ) ( not ( = ?auto_746297 ?auto_746301 ) ) ( TRUCK-AT ?auto_746302 ?auto_746300 ) ( SURFACE-AT ?auto_746297 ?auto_746300 ) ( CLEAR ?auto_746297 ) ( IS-CRATE ?auto_746298 ) ( AVAILABLE ?auto_746305 ) ( IN ?auto_746298 ?auto_746302 ) ( ON ?auto_746295 ?auto_746294 ) ( ON ?auto_746296 ?auto_746295 ) ( ON ?auto_746297 ?auto_746296 ) ( not ( = ?auto_746294 ?auto_746295 ) ) ( not ( = ?auto_746294 ?auto_746296 ) ) ( not ( = ?auto_746294 ?auto_746297 ) ) ( not ( = ?auto_746294 ?auto_746298 ) ) ( not ( = ?auto_746294 ?auto_746299 ) ) ( not ( = ?auto_746294 ?auto_746301 ) ) ( not ( = ?auto_746295 ?auto_746296 ) ) ( not ( = ?auto_746295 ?auto_746297 ) ) ( not ( = ?auto_746295 ?auto_746298 ) ) ( not ( = ?auto_746295 ?auto_746299 ) ) ( not ( = ?auto_746295 ?auto_746301 ) ) ( not ( = ?auto_746296 ?auto_746297 ) ) ( not ( = ?auto_746296 ?auto_746298 ) ) ( not ( = ?auto_746296 ?auto_746299 ) ) ( not ( = ?auto_746296 ?auto_746301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_746297 ?auto_746298 ?auto_746299 )
      ( MAKE-5CRATE-VERIFY ?auto_746294 ?auto_746295 ?auto_746296 ?auto_746297 ?auto_746298 ?auto_746299 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747503 - SURFACE
      ?auto_747504 - SURFACE
      ?auto_747505 - SURFACE
      ?auto_747506 - SURFACE
      ?auto_747507 - SURFACE
      ?auto_747508 - SURFACE
      ?auto_747509 - SURFACE
    )
    :vars
    (
      ?auto_747511 - HOIST
      ?auto_747510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747511 ?auto_747510 ) ( SURFACE-AT ?auto_747508 ?auto_747510 ) ( CLEAR ?auto_747508 ) ( LIFTING ?auto_747511 ?auto_747509 ) ( IS-CRATE ?auto_747509 ) ( not ( = ?auto_747508 ?auto_747509 ) ) ( ON ?auto_747504 ?auto_747503 ) ( ON ?auto_747505 ?auto_747504 ) ( ON ?auto_747506 ?auto_747505 ) ( ON ?auto_747507 ?auto_747506 ) ( ON ?auto_747508 ?auto_747507 ) ( not ( = ?auto_747503 ?auto_747504 ) ) ( not ( = ?auto_747503 ?auto_747505 ) ) ( not ( = ?auto_747503 ?auto_747506 ) ) ( not ( = ?auto_747503 ?auto_747507 ) ) ( not ( = ?auto_747503 ?auto_747508 ) ) ( not ( = ?auto_747503 ?auto_747509 ) ) ( not ( = ?auto_747504 ?auto_747505 ) ) ( not ( = ?auto_747504 ?auto_747506 ) ) ( not ( = ?auto_747504 ?auto_747507 ) ) ( not ( = ?auto_747504 ?auto_747508 ) ) ( not ( = ?auto_747504 ?auto_747509 ) ) ( not ( = ?auto_747505 ?auto_747506 ) ) ( not ( = ?auto_747505 ?auto_747507 ) ) ( not ( = ?auto_747505 ?auto_747508 ) ) ( not ( = ?auto_747505 ?auto_747509 ) ) ( not ( = ?auto_747506 ?auto_747507 ) ) ( not ( = ?auto_747506 ?auto_747508 ) ) ( not ( = ?auto_747506 ?auto_747509 ) ) ( not ( = ?auto_747507 ?auto_747508 ) ) ( not ( = ?auto_747507 ?auto_747509 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_747508 ?auto_747509 )
      ( MAKE-6CRATE-VERIFY ?auto_747503 ?auto_747504 ?auto_747505 ?auto_747506 ?auto_747507 ?auto_747508 ?auto_747509 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747547 - SURFACE
      ?auto_747548 - SURFACE
      ?auto_747549 - SURFACE
      ?auto_747550 - SURFACE
      ?auto_747551 - SURFACE
      ?auto_747552 - SURFACE
      ?auto_747553 - SURFACE
    )
    :vars
    (
      ?auto_747556 - HOIST
      ?auto_747555 - PLACE
      ?auto_747554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747556 ?auto_747555 ) ( SURFACE-AT ?auto_747552 ?auto_747555 ) ( CLEAR ?auto_747552 ) ( IS-CRATE ?auto_747553 ) ( not ( = ?auto_747552 ?auto_747553 ) ) ( TRUCK-AT ?auto_747554 ?auto_747555 ) ( AVAILABLE ?auto_747556 ) ( IN ?auto_747553 ?auto_747554 ) ( ON ?auto_747552 ?auto_747551 ) ( not ( = ?auto_747551 ?auto_747552 ) ) ( not ( = ?auto_747551 ?auto_747553 ) ) ( ON ?auto_747548 ?auto_747547 ) ( ON ?auto_747549 ?auto_747548 ) ( ON ?auto_747550 ?auto_747549 ) ( ON ?auto_747551 ?auto_747550 ) ( not ( = ?auto_747547 ?auto_747548 ) ) ( not ( = ?auto_747547 ?auto_747549 ) ) ( not ( = ?auto_747547 ?auto_747550 ) ) ( not ( = ?auto_747547 ?auto_747551 ) ) ( not ( = ?auto_747547 ?auto_747552 ) ) ( not ( = ?auto_747547 ?auto_747553 ) ) ( not ( = ?auto_747548 ?auto_747549 ) ) ( not ( = ?auto_747548 ?auto_747550 ) ) ( not ( = ?auto_747548 ?auto_747551 ) ) ( not ( = ?auto_747548 ?auto_747552 ) ) ( not ( = ?auto_747548 ?auto_747553 ) ) ( not ( = ?auto_747549 ?auto_747550 ) ) ( not ( = ?auto_747549 ?auto_747551 ) ) ( not ( = ?auto_747549 ?auto_747552 ) ) ( not ( = ?auto_747549 ?auto_747553 ) ) ( not ( = ?auto_747550 ?auto_747551 ) ) ( not ( = ?auto_747550 ?auto_747552 ) ) ( not ( = ?auto_747550 ?auto_747553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747551 ?auto_747552 ?auto_747553 )
      ( MAKE-6CRATE-VERIFY ?auto_747547 ?auto_747548 ?auto_747549 ?auto_747550 ?auto_747551 ?auto_747552 ?auto_747553 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747598 - SURFACE
      ?auto_747599 - SURFACE
      ?auto_747600 - SURFACE
      ?auto_747601 - SURFACE
      ?auto_747602 - SURFACE
      ?auto_747603 - SURFACE
      ?auto_747604 - SURFACE
    )
    :vars
    (
      ?auto_747608 - HOIST
      ?auto_747606 - PLACE
      ?auto_747607 - TRUCK
      ?auto_747605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747608 ?auto_747606 ) ( SURFACE-AT ?auto_747603 ?auto_747606 ) ( CLEAR ?auto_747603 ) ( IS-CRATE ?auto_747604 ) ( not ( = ?auto_747603 ?auto_747604 ) ) ( AVAILABLE ?auto_747608 ) ( IN ?auto_747604 ?auto_747607 ) ( ON ?auto_747603 ?auto_747602 ) ( not ( = ?auto_747602 ?auto_747603 ) ) ( not ( = ?auto_747602 ?auto_747604 ) ) ( TRUCK-AT ?auto_747607 ?auto_747605 ) ( not ( = ?auto_747605 ?auto_747606 ) ) ( ON ?auto_747599 ?auto_747598 ) ( ON ?auto_747600 ?auto_747599 ) ( ON ?auto_747601 ?auto_747600 ) ( ON ?auto_747602 ?auto_747601 ) ( not ( = ?auto_747598 ?auto_747599 ) ) ( not ( = ?auto_747598 ?auto_747600 ) ) ( not ( = ?auto_747598 ?auto_747601 ) ) ( not ( = ?auto_747598 ?auto_747602 ) ) ( not ( = ?auto_747598 ?auto_747603 ) ) ( not ( = ?auto_747598 ?auto_747604 ) ) ( not ( = ?auto_747599 ?auto_747600 ) ) ( not ( = ?auto_747599 ?auto_747601 ) ) ( not ( = ?auto_747599 ?auto_747602 ) ) ( not ( = ?auto_747599 ?auto_747603 ) ) ( not ( = ?auto_747599 ?auto_747604 ) ) ( not ( = ?auto_747600 ?auto_747601 ) ) ( not ( = ?auto_747600 ?auto_747602 ) ) ( not ( = ?auto_747600 ?auto_747603 ) ) ( not ( = ?auto_747600 ?auto_747604 ) ) ( not ( = ?auto_747601 ?auto_747602 ) ) ( not ( = ?auto_747601 ?auto_747603 ) ) ( not ( = ?auto_747601 ?auto_747604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747602 ?auto_747603 ?auto_747604 )
      ( MAKE-6CRATE-VERIFY ?auto_747598 ?auto_747599 ?auto_747600 ?auto_747601 ?auto_747602 ?auto_747603 ?auto_747604 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747655 - SURFACE
      ?auto_747656 - SURFACE
      ?auto_747657 - SURFACE
      ?auto_747658 - SURFACE
      ?auto_747659 - SURFACE
      ?auto_747660 - SURFACE
      ?auto_747661 - SURFACE
    )
    :vars
    (
      ?auto_747662 - HOIST
      ?auto_747665 - PLACE
      ?auto_747666 - TRUCK
      ?auto_747664 - PLACE
      ?auto_747663 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_747662 ?auto_747665 ) ( SURFACE-AT ?auto_747660 ?auto_747665 ) ( CLEAR ?auto_747660 ) ( IS-CRATE ?auto_747661 ) ( not ( = ?auto_747660 ?auto_747661 ) ) ( AVAILABLE ?auto_747662 ) ( ON ?auto_747660 ?auto_747659 ) ( not ( = ?auto_747659 ?auto_747660 ) ) ( not ( = ?auto_747659 ?auto_747661 ) ) ( TRUCK-AT ?auto_747666 ?auto_747664 ) ( not ( = ?auto_747664 ?auto_747665 ) ) ( HOIST-AT ?auto_747663 ?auto_747664 ) ( LIFTING ?auto_747663 ?auto_747661 ) ( not ( = ?auto_747662 ?auto_747663 ) ) ( ON ?auto_747656 ?auto_747655 ) ( ON ?auto_747657 ?auto_747656 ) ( ON ?auto_747658 ?auto_747657 ) ( ON ?auto_747659 ?auto_747658 ) ( not ( = ?auto_747655 ?auto_747656 ) ) ( not ( = ?auto_747655 ?auto_747657 ) ) ( not ( = ?auto_747655 ?auto_747658 ) ) ( not ( = ?auto_747655 ?auto_747659 ) ) ( not ( = ?auto_747655 ?auto_747660 ) ) ( not ( = ?auto_747655 ?auto_747661 ) ) ( not ( = ?auto_747656 ?auto_747657 ) ) ( not ( = ?auto_747656 ?auto_747658 ) ) ( not ( = ?auto_747656 ?auto_747659 ) ) ( not ( = ?auto_747656 ?auto_747660 ) ) ( not ( = ?auto_747656 ?auto_747661 ) ) ( not ( = ?auto_747657 ?auto_747658 ) ) ( not ( = ?auto_747657 ?auto_747659 ) ) ( not ( = ?auto_747657 ?auto_747660 ) ) ( not ( = ?auto_747657 ?auto_747661 ) ) ( not ( = ?auto_747658 ?auto_747659 ) ) ( not ( = ?auto_747658 ?auto_747660 ) ) ( not ( = ?auto_747658 ?auto_747661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747659 ?auto_747660 ?auto_747661 )
      ( MAKE-6CRATE-VERIFY ?auto_747655 ?auto_747656 ?auto_747657 ?auto_747658 ?auto_747659 ?auto_747660 ?auto_747661 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747718 - SURFACE
      ?auto_747719 - SURFACE
      ?auto_747720 - SURFACE
      ?auto_747721 - SURFACE
      ?auto_747722 - SURFACE
      ?auto_747723 - SURFACE
      ?auto_747724 - SURFACE
    )
    :vars
    (
      ?auto_747727 - HOIST
      ?auto_747725 - PLACE
      ?auto_747729 - TRUCK
      ?auto_747728 - PLACE
      ?auto_747726 - HOIST
      ?auto_747730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747727 ?auto_747725 ) ( SURFACE-AT ?auto_747723 ?auto_747725 ) ( CLEAR ?auto_747723 ) ( IS-CRATE ?auto_747724 ) ( not ( = ?auto_747723 ?auto_747724 ) ) ( AVAILABLE ?auto_747727 ) ( ON ?auto_747723 ?auto_747722 ) ( not ( = ?auto_747722 ?auto_747723 ) ) ( not ( = ?auto_747722 ?auto_747724 ) ) ( TRUCK-AT ?auto_747729 ?auto_747728 ) ( not ( = ?auto_747728 ?auto_747725 ) ) ( HOIST-AT ?auto_747726 ?auto_747728 ) ( not ( = ?auto_747727 ?auto_747726 ) ) ( AVAILABLE ?auto_747726 ) ( SURFACE-AT ?auto_747724 ?auto_747728 ) ( ON ?auto_747724 ?auto_747730 ) ( CLEAR ?auto_747724 ) ( not ( = ?auto_747723 ?auto_747730 ) ) ( not ( = ?auto_747724 ?auto_747730 ) ) ( not ( = ?auto_747722 ?auto_747730 ) ) ( ON ?auto_747719 ?auto_747718 ) ( ON ?auto_747720 ?auto_747719 ) ( ON ?auto_747721 ?auto_747720 ) ( ON ?auto_747722 ?auto_747721 ) ( not ( = ?auto_747718 ?auto_747719 ) ) ( not ( = ?auto_747718 ?auto_747720 ) ) ( not ( = ?auto_747718 ?auto_747721 ) ) ( not ( = ?auto_747718 ?auto_747722 ) ) ( not ( = ?auto_747718 ?auto_747723 ) ) ( not ( = ?auto_747718 ?auto_747724 ) ) ( not ( = ?auto_747718 ?auto_747730 ) ) ( not ( = ?auto_747719 ?auto_747720 ) ) ( not ( = ?auto_747719 ?auto_747721 ) ) ( not ( = ?auto_747719 ?auto_747722 ) ) ( not ( = ?auto_747719 ?auto_747723 ) ) ( not ( = ?auto_747719 ?auto_747724 ) ) ( not ( = ?auto_747719 ?auto_747730 ) ) ( not ( = ?auto_747720 ?auto_747721 ) ) ( not ( = ?auto_747720 ?auto_747722 ) ) ( not ( = ?auto_747720 ?auto_747723 ) ) ( not ( = ?auto_747720 ?auto_747724 ) ) ( not ( = ?auto_747720 ?auto_747730 ) ) ( not ( = ?auto_747721 ?auto_747722 ) ) ( not ( = ?auto_747721 ?auto_747723 ) ) ( not ( = ?auto_747721 ?auto_747724 ) ) ( not ( = ?auto_747721 ?auto_747730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747722 ?auto_747723 ?auto_747724 )
      ( MAKE-6CRATE-VERIFY ?auto_747718 ?auto_747719 ?auto_747720 ?auto_747721 ?auto_747722 ?auto_747723 ?auto_747724 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747782 - SURFACE
      ?auto_747783 - SURFACE
      ?auto_747784 - SURFACE
      ?auto_747785 - SURFACE
      ?auto_747786 - SURFACE
      ?auto_747787 - SURFACE
      ?auto_747788 - SURFACE
    )
    :vars
    (
      ?auto_747792 - HOIST
      ?auto_747794 - PLACE
      ?auto_747789 - PLACE
      ?auto_747791 - HOIST
      ?auto_747793 - SURFACE
      ?auto_747790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747792 ?auto_747794 ) ( SURFACE-AT ?auto_747787 ?auto_747794 ) ( CLEAR ?auto_747787 ) ( IS-CRATE ?auto_747788 ) ( not ( = ?auto_747787 ?auto_747788 ) ) ( AVAILABLE ?auto_747792 ) ( ON ?auto_747787 ?auto_747786 ) ( not ( = ?auto_747786 ?auto_747787 ) ) ( not ( = ?auto_747786 ?auto_747788 ) ) ( not ( = ?auto_747789 ?auto_747794 ) ) ( HOIST-AT ?auto_747791 ?auto_747789 ) ( not ( = ?auto_747792 ?auto_747791 ) ) ( AVAILABLE ?auto_747791 ) ( SURFACE-AT ?auto_747788 ?auto_747789 ) ( ON ?auto_747788 ?auto_747793 ) ( CLEAR ?auto_747788 ) ( not ( = ?auto_747787 ?auto_747793 ) ) ( not ( = ?auto_747788 ?auto_747793 ) ) ( not ( = ?auto_747786 ?auto_747793 ) ) ( TRUCK-AT ?auto_747790 ?auto_747794 ) ( ON ?auto_747783 ?auto_747782 ) ( ON ?auto_747784 ?auto_747783 ) ( ON ?auto_747785 ?auto_747784 ) ( ON ?auto_747786 ?auto_747785 ) ( not ( = ?auto_747782 ?auto_747783 ) ) ( not ( = ?auto_747782 ?auto_747784 ) ) ( not ( = ?auto_747782 ?auto_747785 ) ) ( not ( = ?auto_747782 ?auto_747786 ) ) ( not ( = ?auto_747782 ?auto_747787 ) ) ( not ( = ?auto_747782 ?auto_747788 ) ) ( not ( = ?auto_747782 ?auto_747793 ) ) ( not ( = ?auto_747783 ?auto_747784 ) ) ( not ( = ?auto_747783 ?auto_747785 ) ) ( not ( = ?auto_747783 ?auto_747786 ) ) ( not ( = ?auto_747783 ?auto_747787 ) ) ( not ( = ?auto_747783 ?auto_747788 ) ) ( not ( = ?auto_747783 ?auto_747793 ) ) ( not ( = ?auto_747784 ?auto_747785 ) ) ( not ( = ?auto_747784 ?auto_747786 ) ) ( not ( = ?auto_747784 ?auto_747787 ) ) ( not ( = ?auto_747784 ?auto_747788 ) ) ( not ( = ?auto_747784 ?auto_747793 ) ) ( not ( = ?auto_747785 ?auto_747786 ) ) ( not ( = ?auto_747785 ?auto_747787 ) ) ( not ( = ?auto_747785 ?auto_747788 ) ) ( not ( = ?auto_747785 ?auto_747793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747786 ?auto_747787 ?auto_747788 )
      ( MAKE-6CRATE-VERIFY ?auto_747782 ?auto_747783 ?auto_747784 ?auto_747785 ?auto_747786 ?auto_747787 ?auto_747788 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747846 - SURFACE
      ?auto_747847 - SURFACE
      ?auto_747848 - SURFACE
      ?auto_747849 - SURFACE
      ?auto_747850 - SURFACE
      ?auto_747851 - SURFACE
      ?auto_747852 - SURFACE
    )
    :vars
    (
      ?auto_747858 - HOIST
      ?auto_747855 - PLACE
      ?auto_747854 - PLACE
      ?auto_747856 - HOIST
      ?auto_747853 - SURFACE
      ?auto_747857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747858 ?auto_747855 ) ( IS-CRATE ?auto_747852 ) ( not ( = ?auto_747851 ?auto_747852 ) ) ( not ( = ?auto_747850 ?auto_747851 ) ) ( not ( = ?auto_747850 ?auto_747852 ) ) ( not ( = ?auto_747854 ?auto_747855 ) ) ( HOIST-AT ?auto_747856 ?auto_747854 ) ( not ( = ?auto_747858 ?auto_747856 ) ) ( AVAILABLE ?auto_747856 ) ( SURFACE-AT ?auto_747852 ?auto_747854 ) ( ON ?auto_747852 ?auto_747853 ) ( CLEAR ?auto_747852 ) ( not ( = ?auto_747851 ?auto_747853 ) ) ( not ( = ?auto_747852 ?auto_747853 ) ) ( not ( = ?auto_747850 ?auto_747853 ) ) ( TRUCK-AT ?auto_747857 ?auto_747855 ) ( SURFACE-AT ?auto_747850 ?auto_747855 ) ( CLEAR ?auto_747850 ) ( LIFTING ?auto_747858 ?auto_747851 ) ( IS-CRATE ?auto_747851 ) ( ON ?auto_747847 ?auto_747846 ) ( ON ?auto_747848 ?auto_747847 ) ( ON ?auto_747849 ?auto_747848 ) ( ON ?auto_747850 ?auto_747849 ) ( not ( = ?auto_747846 ?auto_747847 ) ) ( not ( = ?auto_747846 ?auto_747848 ) ) ( not ( = ?auto_747846 ?auto_747849 ) ) ( not ( = ?auto_747846 ?auto_747850 ) ) ( not ( = ?auto_747846 ?auto_747851 ) ) ( not ( = ?auto_747846 ?auto_747852 ) ) ( not ( = ?auto_747846 ?auto_747853 ) ) ( not ( = ?auto_747847 ?auto_747848 ) ) ( not ( = ?auto_747847 ?auto_747849 ) ) ( not ( = ?auto_747847 ?auto_747850 ) ) ( not ( = ?auto_747847 ?auto_747851 ) ) ( not ( = ?auto_747847 ?auto_747852 ) ) ( not ( = ?auto_747847 ?auto_747853 ) ) ( not ( = ?auto_747848 ?auto_747849 ) ) ( not ( = ?auto_747848 ?auto_747850 ) ) ( not ( = ?auto_747848 ?auto_747851 ) ) ( not ( = ?auto_747848 ?auto_747852 ) ) ( not ( = ?auto_747848 ?auto_747853 ) ) ( not ( = ?auto_747849 ?auto_747850 ) ) ( not ( = ?auto_747849 ?auto_747851 ) ) ( not ( = ?auto_747849 ?auto_747852 ) ) ( not ( = ?auto_747849 ?auto_747853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747850 ?auto_747851 ?auto_747852 )
      ( MAKE-6CRATE-VERIFY ?auto_747846 ?auto_747847 ?auto_747848 ?auto_747849 ?auto_747850 ?auto_747851 ?auto_747852 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_747910 - SURFACE
      ?auto_747911 - SURFACE
      ?auto_747912 - SURFACE
      ?auto_747913 - SURFACE
      ?auto_747914 - SURFACE
      ?auto_747915 - SURFACE
      ?auto_747916 - SURFACE
    )
    :vars
    (
      ?auto_747921 - HOIST
      ?auto_747917 - PLACE
      ?auto_747920 - PLACE
      ?auto_747922 - HOIST
      ?auto_747919 - SURFACE
      ?auto_747918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_747921 ?auto_747917 ) ( IS-CRATE ?auto_747916 ) ( not ( = ?auto_747915 ?auto_747916 ) ) ( not ( = ?auto_747914 ?auto_747915 ) ) ( not ( = ?auto_747914 ?auto_747916 ) ) ( not ( = ?auto_747920 ?auto_747917 ) ) ( HOIST-AT ?auto_747922 ?auto_747920 ) ( not ( = ?auto_747921 ?auto_747922 ) ) ( AVAILABLE ?auto_747922 ) ( SURFACE-AT ?auto_747916 ?auto_747920 ) ( ON ?auto_747916 ?auto_747919 ) ( CLEAR ?auto_747916 ) ( not ( = ?auto_747915 ?auto_747919 ) ) ( not ( = ?auto_747916 ?auto_747919 ) ) ( not ( = ?auto_747914 ?auto_747919 ) ) ( TRUCK-AT ?auto_747918 ?auto_747917 ) ( SURFACE-AT ?auto_747914 ?auto_747917 ) ( CLEAR ?auto_747914 ) ( IS-CRATE ?auto_747915 ) ( AVAILABLE ?auto_747921 ) ( IN ?auto_747915 ?auto_747918 ) ( ON ?auto_747911 ?auto_747910 ) ( ON ?auto_747912 ?auto_747911 ) ( ON ?auto_747913 ?auto_747912 ) ( ON ?auto_747914 ?auto_747913 ) ( not ( = ?auto_747910 ?auto_747911 ) ) ( not ( = ?auto_747910 ?auto_747912 ) ) ( not ( = ?auto_747910 ?auto_747913 ) ) ( not ( = ?auto_747910 ?auto_747914 ) ) ( not ( = ?auto_747910 ?auto_747915 ) ) ( not ( = ?auto_747910 ?auto_747916 ) ) ( not ( = ?auto_747910 ?auto_747919 ) ) ( not ( = ?auto_747911 ?auto_747912 ) ) ( not ( = ?auto_747911 ?auto_747913 ) ) ( not ( = ?auto_747911 ?auto_747914 ) ) ( not ( = ?auto_747911 ?auto_747915 ) ) ( not ( = ?auto_747911 ?auto_747916 ) ) ( not ( = ?auto_747911 ?auto_747919 ) ) ( not ( = ?auto_747912 ?auto_747913 ) ) ( not ( = ?auto_747912 ?auto_747914 ) ) ( not ( = ?auto_747912 ?auto_747915 ) ) ( not ( = ?auto_747912 ?auto_747916 ) ) ( not ( = ?auto_747912 ?auto_747919 ) ) ( not ( = ?auto_747913 ?auto_747914 ) ) ( not ( = ?auto_747913 ?auto_747915 ) ) ( not ( = ?auto_747913 ?auto_747916 ) ) ( not ( = ?auto_747913 ?auto_747919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_747914 ?auto_747915 ?auto_747916 )
      ( MAKE-6CRATE-VERIFY ?auto_747910 ?auto_747911 ?auto_747912 ?auto_747913 ?auto_747914 ?auto_747915 ?auto_747916 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749866 - SURFACE
      ?auto_749867 - SURFACE
      ?auto_749868 - SURFACE
      ?auto_749869 - SURFACE
      ?auto_749870 - SURFACE
      ?auto_749871 - SURFACE
      ?auto_749872 - SURFACE
      ?auto_749873 - SURFACE
    )
    :vars
    (
      ?auto_749875 - HOIST
      ?auto_749874 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749875 ?auto_749874 ) ( SURFACE-AT ?auto_749872 ?auto_749874 ) ( CLEAR ?auto_749872 ) ( LIFTING ?auto_749875 ?auto_749873 ) ( IS-CRATE ?auto_749873 ) ( not ( = ?auto_749872 ?auto_749873 ) ) ( ON ?auto_749867 ?auto_749866 ) ( ON ?auto_749868 ?auto_749867 ) ( ON ?auto_749869 ?auto_749868 ) ( ON ?auto_749870 ?auto_749869 ) ( ON ?auto_749871 ?auto_749870 ) ( ON ?auto_749872 ?auto_749871 ) ( not ( = ?auto_749866 ?auto_749867 ) ) ( not ( = ?auto_749866 ?auto_749868 ) ) ( not ( = ?auto_749866 ?auto_749869 ) ) ( not ( = ?auto_749866 ?auto_749870 ) ) ( not ( = ?auto_749866 ?auto_749871 ) ) ( not ( = ?auto_749866 ?auto_749872 ) ) ( not ( = ?auto_749866 ?auto_749873 ) ) ( not ( = ?auto_749867 ?auto_749868 ) ) ( not ( = ?auto_749867 ?auto_749869 ) ) ( not ( = ?auto_749867 ?auto_749870 ) ) ( not ( = ?auto_749867 ?auto_749871 ) ) ( not ( = ?auto_749867 ?auto_749872 ) ) ( not ( = ?auto_749867 ?auto_749873 ) ) ( not ( = ?auto_749868 ?auto_749869 ) ) ( not ( = ?auto_749868 ?auto_749870 ) ) ( not ( = ?auto_749868 ?auto_749871 ) ) ( not ( = ?auto_749868 ?auto_749872 ) ) ( not ( = ?auto_749868 ?auto_749873 ) ) ( not ( = ?auto_749869 ?auto_749870 ) ) ( not ( = ?auto_749869 ?auto_749871 ) ) ( not ( = ?auto_749869 ?auto_749872 ) ) ( not ( = ?auto_749869 ?auto_749873 ) ) ( not ( = ?auto_749870 ?auto_749871 ) ) ( not ( = ?auto_749870 ?auto_749872 ) ) ( not ( = ?auto_749870 ?auto_749873 ) ) ( not ( = ?auto_749871 ?auto_749872 ) ) ( not ( = ?auto_749871 ?auto_749873 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_749872 ?auto_749873 )
      ( MAKE-7CRATE-VERIFY ?auto_749866 ?auto_749867 ?auto_749868 ?auto_749869 ?auto_749870 ?auto_749871 ?auto_749872 ?auto_749873 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749921 - SURFACE
      ?auto_749922 - SURFACE
      ?auto_749923 - SURFACE
      ?auto_749924 - SURFACE
      ?auto_749925 - SURFACE
      ?auto_749926 - SURFACE
      ?auto_749927 - SURFACE
      ?auto_749928 - SURFACE
    )
    :vars
    (
      ?auto_749930 - HOIST
      ?auto_749931 - PLACE
      ?auto_749929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_749930 ?auto_749931 ) ( SURFACE-AT ?auto_749927 ?auto_749931 ) ( CLEAR ?auto_749927 ) ( IS-CRATE ?auto_749928 ) ( not ( = ?auto_749927 ?auto_749928 ) ) ( TRUCK-AT ?auto_749929 ?auto_749931 ) ( AVAILABLE ?auto_749930 ) ( IN ?auto_749928 ?auto_749929 ) ( ON ?auto_749927 ?auto_749926 ) ( not ( = ?auto_749926 ?auto_749927 ) ) ( not ( = ?auto_749926 ?auto_749928 ) ) ( ON ?auto_749922 ?auto_749921 ) ( ON ?auto_749923 ?auto_749922 ) ( ON ?auto_749924 ?auto_749923 ) ( ON ?auto_749925 ?auto_749924 ) ( ON ?auto_749926 ?auto_749925 ) ( not ( = ?auto_749921 ?auto_749922 ) ) ( not ( = ?auto_749921 ?auto_749923 ) ) ( not ( = ?auto_749921 ?auto_749924 ) ) ( not ( = ?auto_749921 ?auto_749925 ) ) ( not ( = ?auto_749921 ?auto_749926 ) ) ( not ( = ?auto_749921 ?auto_749927 ) ) ( not ( = ?auto_749921 ?auto_749928 ) ) ( not ( = ?auto_749922 ?auto_749923 ) ) ( not ( = ?auto_749922 ?auto_749924 ) ) ( not ( = ?auto_749922 ?auto_749925 ) ) ( not ( = ?auto_749922 ?auto_749926 ) ) ( not ( = ?auto_749922 ?auto_749927 ) ) ( not ( = ?auto_749922 ?auto_749928 ) ) ( not ( = ?auto_749923 ?auto_749924 ) ) ( not ( = ?auto_749923 ?auto_749925 ) ) ( not ( = ?auto_749923 ?auto_749926 ) ) ( not ( = ?auto_749923 ?auto_749927 ) ) ( not ( = ?auto_749923 ?auto_749928 ) ) ( not ( = ?auto_749924 ?auto_749925 ) ) ( not ( = ?auto_749924 ?auto_749926 ) ) ( not ( = ?auto_749924 ?auto_749927 ) ) ( not ( = ?auto_749924 ?auto_749928 ) ) ( not ( = ?auto_749925 ?auto_749926 ) ) ( not ( = ?auto_749925 ?auto_749927 ) ) ( not ( = ?auto_749925 ?auto_749928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749926 ?auto_749927 ?auto_749928 )
      ( MAKE-7CRATE-VERIFY ?auto_749921 ?auto_749922 ?auto_749923 ?auto_749924 ?auto_749925 ?auto_749926 ?auto_749927 ?auto_749928 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_749984 - SURFACE
      ?auto_749985 - SURFACE
      ?auto_749986 - SURFACE
      ?auto_749987 - SURFACE
      ?auto_749988 - SURFACE
      ?auto_749989 - SURFACE
      ?auto_749990 - SURFACE
      ?auto_749991 - SURFACE
    )
    :vars
    (
      ?auto_749994 - HOIST
      ?auto_749992 - PLACE
      ?auto_749995 - TRUCK
      ?auto_749993 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749994 ?auto_749992 ) ( SURFACE-AT ?auto_749990 ?auto_749992 ) ( CLEAR ?auto_749990 ) ( IS-CRATE ?auto_749991 ) ( not ( = ?auto_749990 ?auto_749991 ) ) ( AVAILABLE ?auto_749994 ) ( IN ?auto_749991 ?auto_749995 ) ( ON ?auto_749990 ?auto_749989 ) ( not ( = ?auto_749989 ?auto_749990 ) ) ( not ( = ?auto_749989 ?auto_749991 ) ) ( TRUCK-AT ?auto_749995 ?auto_749993 ) ( not ( = ?auto_749993 ?auto_749992 ) ) ( ON ?auto_749985 ?auto_749984 ) ( ON ?auto_749986 ?auto_749985 ) ( ON ?auto_749987 ?auto_749986 ) ( ON ?auto_749988 ?auto_749987 ) ( ON ?auto_749989 ?auto_749988 ) ( not ( = ?auto_749984 ?auto_749985 ) ) ( not ( = ?auto_749984 ?auto_749986 ) ) ( not ( = ?auto_749984 ?auto_749987 ) ) ( not ( = ?auto_749984 ?auto_749988 ) ) ( not ( = ?auto_749984 ?auto_749989 ) ) ( not ( = ?auto_749984 ?auto_749990 ) ) ( not ( = ?auto_749984 ?auto_749991 ) ) ( not ( = ?auto_749985 ?auto_749986 ) ) ( not ( = ?auto_749985 ?auto_749987 ) ) ( not ( = ?auto_749985 ?auto_749988 ) ) ( not ( = ?auto_749985 ?auto_749989 ) ) ( not ( = ?auto_749985 ?auto_749990 ) ) ( not ( = ?auto_749985 ?auto_749991 ) ) ( not ( = ?auto_749986 ?auto_749987 ) ) ( not ( = ?auto_749986 ?auto_749988 ) ) ( not ( = ?auto_749986 ?auto_749989 ) ) ( not ( = ?auto_749986 ?auto_749990 ) ) ( not ( = ?auto_749986 ?auto_749991 ) ) ( not ( = ?auto_749987 ?auto_749988 ) ) ( not ( = ?auto_749987 ?auto_749989 ) ) ( not ( = ?auto_749987 ?auto_749990 ) ) ( not ( = ?auto_749987 ?auto_749991 ) ) ( not ( = ?auto_749988 ?auto_749989 ) ) ( not ( = ?auto_749988 ?auto_749990 ) ) ( not ( = ?auto_749988 ?auto_749991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_749989 ?auto_749990 ?auto_749991 )
      ( MAKE-7CRATE-VERIFY ?auto_749984 ?auto_749985 ?auto_749986 ?auto_749987 ?auto_749988 ?auto_749989 ?auto_749990 ?auto_749991 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750054 - SURFACE
      ?auto_750055 - SURFACE
      ?auto_750056 - SURFACE
      ?auto_750057 - SURFACE
      ?auto_750058 - SURFACE
      ?auto_750059 - SURFACE
      ?auto_750060 - SURFACE
      ?auto_750061 - SURFACE
    )
    :vars
    (
      ?auto_750062 - HOIST
      ?auto_750064 - PLACE
      ?auto_750065 - TRUCK
      ?auto_750063 - PLACE
      ?auto_750066 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_750062 ?auto_750064 ) ( SURFACE-AT ?auto_750060 ?auto_750064 ) ( CLEAR ?auto_750060 ) ( IS-CRATE ?auto_750061 ) ( not ( = ?auto_750060 ?auto_750061 ) ) ( AVAILABLE ?auto_750062 ) ( ON ?auto_750060 ?auto_750059 ) ( not ( = ?auto_750059 ?auto_750060 ) ) ( not ( = ?auto_750059 ?auto_750061 ) ) ( TRUCK-AT ?auto_750065 ?auto_750063 ) ( not ( = ?auto_750063 ?auto_750064 ) ) ( HOIST-AT ?auto_750066 ?auto_750063 ) ( LIFTING ?auto_750066 ?auto_750061 ) ( not ( = ?auto_750062 ?auto_750066 ) ) ( ON ?auto_750055 ?auto_750054 ) ( ON ?auto_750056 ?auto_750055 ) ( ON ?auto_750057 ?auto_750056 ) ( ON ?auto_750058 ?auto_750057 ) ( ON ?auto_750059 ?auto_750058 ) ( not ( = ?auto_750054 ?auto_750055 ) ) ( not ( = ?auto_750054 ?auto_750056 ) ) ( not ( = ?auto_750054 ?auto_750057 ) ) ( not ( = ?auto_750054 ?auto_750058 ) ) ( not ( = ?auto_750054 ?auto_750059 ) ) ( not ( = ?auto_750054 ?auto_750060 ) ) ( not ( = ?auto_750054 ?auto_750061 ) ) ( not ( = ?auto_750055 ?auto_750056 ) ) ( not ( = ?auto_750055 ?auto_750057 ) ) ( not ( = ?auto_750055 ?auto_750058 ) ) ( not ( = ?auto_750055 ?auto_750059 ) ) ( not ( = ?auto_750055 ?auto_750060 ) ) ( not ( = ?auto_750055 ?auto_750061 ) ) ( not ( = ?auto_750056 ?auto_750057 ) ) ( not ( = ?auto_750056 ?auto_750058 ) ) ( not ( = ?auto_750056 ?auto_750059 ) ) ( not ( = ?auto_750056 ?auto_750060 ) ) ( not ( = ?auto_750056 ?auto_750061 ) ) ( not ( = ?auto_750057 ?auto_750058 ) ) ( not ( = ?auto_750057 ?auto_750059 ) ) ( not ( = ?auto_750057 ?auto_750060 ) ) ( not ( = ?auto_750057 ?auto_750061 ) ) ( not ( = ?auto_750058 ?auto_750059 ) ) ( not ( = ?auto_750058 ?auto_750060 ) ) ( not ( = ?auto_750058 ?auto_750061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750059 ?auto_750060 ?auto_750061 )
      ( MAKE-7CRATE-VERIFY ?auto_750054 ?auto_750055 ?auto_750056 ?auto_750057 ?auto_750058 ?auto_750059 ?auto_750060 ?auto_750061 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750131 - SURFACE
      ?auto_750132 - SURFACE
      ?auto_750133 - SURFACE
      ?auto_750134 - SURFACE
      ?auto_750135 - SURFACE
      ?auto_750136 - SURFACE
      ?auto_750137 - SURFACE
      ?auto_750138 - SURFACE
    )
    :vars
    (
      ?auto_750141 - HOIST
      ?auto_750143 - PLACE
      ?auto_750139 - TRUCK
      ?auto_750144 - PLACE
      ?auto_750142 - HOIST
      ?auto_750140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_750141 ?auto_750143 ) ( SURFACE-AT ?auto_750137 ?auto_750143 ) ( CLEAR ?auto_750137 ) ( IS-CRATE ?auto_750138 ) ( not ( = ?auto_750137 ?auto_750138 ) ) ( AVAILABLE ?auto_750141 ) ( ON ?auto_750137 ?auto_750136 ) ( not ( = ?auto_750136 ?auto_750137 ) ) ( not ( = ?auto_750136 ?auto_750138 ) ) ( TRUCK-AT ?auto_750139 ?auto_750144 ) ( not ( = ?auto_750144 ?auto_750143 ) ) ( HOIST-AT ?auto_750142 ?auto_750144 ) ( not ( = ?auto_750141 ?auto_750142 ) ) ( AVAILABLE ?auto_750142 ) ( SURFACE-AT ?auto_750138 ?auto_750144 ) ( ON ?auto_750138 ?auto_750140 ) ( CLEAR ?auto_750138 ) ( not ( = ?auto_750137 ?auto_750140 ) ) ( not ( = ?auto_750138 ?auto_750140 ) ) ( not ( = ?auto_750136 ?auto_750140 ) ) ( ON ?auto_750132 ?auto_750131 ) ( ON ?auto_750133 ?auto_750132 ) ( ON ?auto_750134 ?auto_750133 ) ( ON ?auto_750135 ?auto_750134 ) ( ON ?auto_750136 ?auto_750135 ) ( not ( = ?auto_750131 ?auto_750132 ) ) ( not ( = ?auto_750131 ?auto_750133 ) ) ( not ( = ?auto_750131 ?auto_750134 ) ) ( not ( = ?auto_750131 ?auto_750135 ) ) ( not ( = ?auto_750131 ?auto_750136 ) ) ( not ( = ?auto_750131 ?auto_750137 ) ) ( not ( = ?auto_750131 ?auto_750138 ) ) ( not ( = ?auto_750131 ?auto_750140 ) ) ( not ( = ?auto_750132 ?auto_750133 ) ) ( not ( = ?auto_750132 ?auto_750134 ) ) ( not ( = ?auto_750132 ?auto_750135 ) ) ( not ( = ?auto_750132 ?auto_750136 ) ) ( not ( = ?auto_750132 ?auto_750137 ) ) ( not ( = ?auto_750132 ?auto_750138 ) ) ( not ( = ?auto_750132 ?auto_750140 ) ) ( not ( = ?auto_750133 ?auto_750134 ) ) ( not ( = ?auto_750133 ?auto_750135 ) ) ( not ( = ?auto_750133 ?auto_750136 ) ) ( not ( = ?auto_750133 ?auto_750137 ) ) ( not ( = ?auto_750133 ?auto_750138 ) ) ( not ( = ?auto_750133 ?auto_750140 ) ) ( not ( = ?auto_750134 ?auto_750135 ) ) ( not ( = ?auto_750134 ?auto_750136 ) ) ( not ( = ?auto_750134 ?auto_750137 ) ) ( not ( = ?auto_750134 ?auto_750138 ) ) ( not ( = ?auto_750134 ?auto_750140 ) ) ( not ( = ?auto_750135 ?auto_750136 ) ) ( not ( = ?auto_750135 ?auto_750137 ) ) ( not ( = ?auto_750135 ?auto_750138 ) ) ( not ( = ?auto_750135 ?auto_750140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750136 ?auto_750137 ?auto_750138 )
      ( MAKE-7CRATE-VERIFY ?auto_750131 ?auto_750132 ?auto_750133 ?auto_750134 ?auto_750135 ?auto_750136 ?auto_750137 ?auto_750138 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750209 - SURFACE
      ?auto_750210 - SURFACE
      ?auto_750211 - SURFACE
      ?auto_750212 - SURFACE
      ?auto_750213 - SURFACE
      ?auto_750214 - SURFACE
      ?auto_750215 - SURFACE
      ?auto_750216 - SURFACE
    )
    :vars
    (
      ?auto_750220 - HOIST
      ?auto_750218 - PLACE
      ?auto_750219 - PLACE
      ?auto_750221 - HOIST
      ?auto_750217 - SURFACE
      ?auto_750222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_750220 ?auto_750218 ) ( SURFACE-AT ?auto_750215 ?auto_750218 ) ( CLEAR ?auto_750215 ) ( IS-CRATE ?auto_750216 ) ( not ( = ?auto_750215 ?auto_750216 ) ) ( AVAILABLE ?auto_750220 ) ( ON ?auto_750215 ?auto_750214 ) ( not ( = ?auto_750214 ?auto_750215 ) ) ( not ( = ?auto_750214 ?auto_750216 ) ) ( not ( = ?auto_750219 ?auto_750218 ) ) ( HOIST-AT ?auto_750221 ?auto_750219 ) ( not ( = ?auto_750220 ?auto_750221 ) ) ( AVAILABLE ?auto_750221 ) ( SURFACE-AT ?auto_750216 ?auto_750219 ) ( ON ?auto_750216 ?auto_750217 ) ( CLEAR ?auto_750216 ) ( not ( = ?auto_750215 ?auto_750217 ) ) ( not ( = ?auto_750216 ?auto_750217 ) ) ( not ( = ?auto_750214 ?auto_750217 ) ) ( TRUCK-AT ?auto_750222 ?auto_750218 ) ( ON ?auto_750210 ?auto_750209 ) ( ON ?auto_750211 ?auto_750210 ) ( ON ?auto_750212 ?auto_750211 ) ( ON ?auto_750213 ?auto_750212 ) ( ON ?auto_750214 ?auto_750213 ) ( not ( = ?auto_750209 ?auto_750210 ) ) ( not ( = ?auto_750209 ?auto_750211 ) ) ( not ( = ?auto_750209 ?auto_750212 ) ) ( not ( = ?auto_750209 ?auto_750213 ) ) ( not ( = ?auto_750209 ?auto_750214 ) ) ( not ( = ?auto_750209 ?auto_750215 ) ) ( not ( = ?auto_750209 ?auto_750216 ) ) ( not ( = ?auto_750209 ?auto_750217 ) ) ( not ( = ?auto_750210 ?auto_750211 ) ) ( not ( = ?auto_750210 ?auto_750212 ) ) ( not ( = ?auto_750210 ?auto_750213 ) ) ( not ( = ?auto_750210 ?auto_750214 ) ) ( not ( = ?auto_750210 ?auto_750215 ) ) ( not ( = ?auto_750210 ?auto_750216 ) ) ( not ( = ?auto_750210 ?auto_750217 ) ) ( not ( = ?auto_750211 ?auto_750212 ) ) ( not ( = ?auto_750211 ?auto_750213 ) ) ( not ( = ?auto_750211 ?auto_750214 ) ) ( not ( = ?auto_750211 ?auto_750215 ) ) ( not ( = ?auto_750211 ?auto_750216 ) ) ( not ( = ?auto_750211 ?auto_750217 ) ) ( not ( = ?auto_750212 ?auto_750213 ) ) ( not ( = ?auto_750212 ?auto_750214 ) ) ( not ( = ?auto_750212 ?auto_750215 ) ) ( not ( = ?auto_750212 ?auto_750216 ) ) ( not ( = ?auto_750212 ?auto_750217 ) ) ( not ( = ?auto_750213 ?auto_750214 ) ) ( not ( = ?auto_750213 ?auto_750215 ) ) ( not ( = ?auto_750213 ?auto_750216 ) ) ( not ( = ?auto_750213 ?auto_750217 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750214 ?auto_750215 ?auto_750216 )
      ( MAKE-7CRATE-VERIFY ?auto_750209 ?auto_750210 ?auto_750211 ?auto_750212 ?auto_750213 ?auto_750214 ?auto_750215 ?auto_750216 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750287 - SURFACE
      ?auto_750288 - SURFACE
      ?auto_750289 - SURFACE
      ?auto_750290 - SURFACE
      ?auto_750291 - SURFACE
      ?auto_750292 - SURFACE
      ?auto_750293 - SURFACE
      ?auto_750294 - SURFACE
    )
    :vars
    (
      ?auto_750296 - HOIST
      ?auto_750298 - PLACE
      ?auto_750299 - PLACE
      ?auto_750297 - HOIST
      ?auto_750300 - SURFACE
      ?auto_750295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_750296 ?auto_750298 ) ( IS-CRATE ?auto_750294 ) ( not ( = ?auto_750293 ?auto_750294 ) ) ( not ( = ?auto_750292 ?auto_750293 ) ) ( not ( = ?auto_750292 ?auto_750294 ) ) ( not ( = ?auto_750299 ?auto_750298 ) ) ( HOIST-AT ?auto_750297 ?auto_750299 ) ( not ( = ?auto_750296 ?auto_750297 ) ) ( AVAILABLE ?auto_750297 ) ( SURFACE-AT ?auto_750294 ?auto_750299 ) ( ON ?auto_750294 ?auto_750300 ) ( CLEAR ?auto_750294 ) ( not ( = ?auto_750293 ?auto_750300 ) ) ( not ( = ?auto_750294 ?auto_750300 ) ) ( not ( = ?auto_750292 ?auto_750300 ) ) ( TRUCK-AT ?auto_750295 ?auto_750298 ) ( SURFACE-AT ?auto_750292 ?auto_750298 ) ( CLEAR ?auto_750292 ) ( LIFTING ?auto_750296 ?auto_750293 ) ( IS-CRATE ?auto_750293 ) ( ON ?auto_750288 ?auto_750287 ) ( ON ?auto_750289 ?auto_750288 ) ( ON ?auto_750290 ?auto_750289 ) ( ON ?auto_750291 ?auto_750290 ) ( ON ?auto_750292 ?auto_750291 ) ( not ( = ?auto_750287 ?auto_750288 ) ) ( not ( = ?auto_750287 ?auto_750289 ) ) ( not ( = ?auto_750287 ?auto_750290 ) ) ( not ( = ?auto_750287 ?auto_750291 ) ) ( not ( = ?auto_750287 ?auto_750292 ) ) ( not ( = ?auto_750287 ?auto_750293 ) ) ( not ( = ?auto_750287 ?auto_750294 ) ) ( not ( = ?auto_750287 ?auto_750300 ) ) ( not ( = ?auto_750288 ?auto_750289 ) ) ( not ( = ?auto_750288 ?auto_750290 ) ) ( not ( = ?auto_750288 ?auto_750291 ) ) ( not ( = ?auto_750288 ?auto_750292 ) ) ( not ( = ?auto_750288 ?auto_750293 ) ) ( not ( = ?auto_750288 ?auto_750294 ) ) ( not ( = ?auto_750288 ?auto_750300 ) ) ( not ( = ?auto_750289 ?auto_750290 ) ) ( not ( = ?auto_750289 ?auto_750291 ) ) ( not ( = ?auto_750289 ?auto_750292 ) ) ( not ( = ?auto_750289 ?auto_750293 ) ) ( not ( = ?auto_750289 ?auto_750294 ) ) ( not ( = ?auto_750289 ?auto_750300 ) ) ( not ( = ?auto_750290 ?auto_750291 ) ) ( not ( = ?auto_750290 ?auto_750292 ) ) ( not ( = ?auto_750290 ?auto_750293 ) ) ( not ( = ?auto_750290 ?auto_750294 ) ) ( not ( = ?auto_750290 ?auto_750300 ) ) ( not ( = ?auto_750291 ?auto_750292 ) ) ( not ( = ?auto_750291 ?auto_750293 ) ) ( not ( = ?auto_750291 ?auto_750294 ) ) ( not ( = ?auto_750291 ?auto_750300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750292 ?auto_750293 ?auto_750294 )
      ( MAKE-7CRATE-VERIFY ?auto_750287 ?auto_750288 ?auto_750289 ?auto_750290 ?auto_750291 ?auto_750292 ?auto_750293 ?auto_750294 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_750365 - SURFACE
      ?auto_750366 - SURFACE
      ?auto_750367 - SURFACE
      ?auto_750368 - SURFACE
      ?auto_750369 - SURFACE
      ?auto_750370 - SURFACE
      ?auto_750371 - SURFACE
      ?auto_750372 - SURFACE
    )
    :vars
    (
      ?auto_750374 - HOIST
      ?auto_750373 - PLACE
      ?auto_750376 - PLACE
      ?auto_750378 - HOIST
      ?auto_750375 - SURFACE
      ?auto_750377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_750374 ?auto_750373 ) ( IS-CRATE ?auto_750372 ) ( not ( = ?auto_750371 ?auto_750372 ) ) ( not ( = ?auto_750370 ?auto_750371 ) ) ( not ( = ?auto_750370 ?auto_750372 ) ) ( not ( = ?auto_750376 ?auto_750373 ) ) ( HOIST-AT ?auto_750378 ?auto_750376 ) ( not ( = ?auto_750374 ?auto_750378 ) ) ( AVAILABLE ?auto_750378 ) ( SURFACE-AT ?auto_750372 ?auto_750376 ) ( ON ?auto_750372 ?auto_750375 ) ( CLEAR ?auto_750372 ) ( not ( = ?auto_750371 ?auto_750375 ) ) ( not ( = ?auto_750372 ?auto_750375 ) ) ( not ( = ?auto_750370 ?auto_750375 ) ) ( TRUCK-AT ?auto_750377 ?auto_750373 ) ( SURFACE-AT ?auto_750370 ?auto_750373 ) ( CLEAR ?auto_750370 ) ( IS-CRATE ?auto_750371 ) ( AVAILABLE ?auto_750374 ) ( IN ?auto_750371 ?auto_750377 ) ( ON ?auto_750366 ?auto_750365 ) ( ON ?auto_750367 ?auto_750366 ) ( ON ?auto_750368 ?auto_750367 ) ( ON ?auto_750369 ?auto_750368 ) ( ON ?auto_750370 ?auto_750369 ) ( not ( = ?auto_750365 ?auto_750366 ) ) ( not ( = ?auto_750365 ?auto_750367 ) ) ( not ( = ?auto_750365 ?auto_750368 ) ) ( not ( = ?auto_750365 ?auto_750369 ) ) ( not ( = ?auto_750365 ?auto_750370 ) ) ( not ( = ?auto_750365 ?auto_750371 ) ) ( not ( = ?auto_750365 ?auto_750372 ) ) ( not ( = ?auto_750365 ?auto_750375 ) ) ( not ( = ?auto_750366 ?auto_750367 ) ) ( not ( = ?auto_750366 ?auto_750368 ) ) ( not ( = ?auto_750366 ?auto_750369 ) ) ( not ( = ?auto_750366 ?auto_750370 ) ) ( not ( = ?auto_750366 ?auto_750371 ) ) ( not ( = ?auto_750366 ?auto_750372 ) ) ( not ( = ?auto_750366 ?auto_750375 ) ) ( not ( = ?auto_750367 ?auto_750368 ) ) ( not ( = ?auto_750367 ?auto_750369 ) ) ( not ( = ?auto_750367 ?auto_750370 ) ) ( not ( = ?auto_750367 ?auto_750371 ) ) ( not ( = ?auto_750367 ?auto_750372 ) ) ( not ( = ?auto_750367 ?auto_750375 ) ) ( not ( = ?auto_750368 ?auto_750369 ) ) ( not ( = ?auto_750368 ?auto_750370 ) ) ( not ( = ?auto_750368 ?auto_750371 ) ) ( not ( = ?auto_750368 ?auto_750372 ) ) ( not ( = ?auto_750368 ?auto_750375 ) ) ( not ( = ?auto_750369 ?auto_750370 ) ) ( not ( = ?auto_750369 ?auto_750371 ) ) ( not ( = ?auto_750369 ?auto_750372 ) ) ( not ( = ?auto_750369 ?auto_750375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_750370 ?auto_750371 ?auto_750372 )
      ( MAKE-7CRATE-VERIFY ?auto_750365 ?auto_750366 ?auto_750367 ?auto_750368 ?auto_750369 ?auto_750370 ?auto_750371 ?auto_750372 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753284 - SURFACE
      ?auto_753285 - SURFACE
      ?auto_753286 - SURFACE
      ?auto_753287 - SURFACE
      ?auto_753288 - SURFACE
      ?auto_753289 - SURFACE
      ?auto_753290 - SURFACE
      ?auto_753291 - SURFACE
      ?auto_753292 - SURFACE
    )
    :vars
    (
      ?auto_753294 - HOIST
      ?auto_753293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_753294 ?auto_753293 ) ( SURFACE-AT ?auto_753291 ?auto_753293 ) ( CLEAR ?auto_753291 ) ( LIFTING ?auto_753294 ?auto_753292 ) ( IS-CRATE ?auto_753292 ) ( not ( = ?auto_753291 ?auto_753292 ) ) ( ON ?auto_753285 ?auto_753284 ) ( ON ?auto_753286 ?auto_753285 ) ( ON ?auto_753287 ?auto_753286 ) ( ON ?auto_753288 ?auto_753287 ) ( ON ?auto_753289 ?auto_753288 ) ( ON ?auto_753290 ?auto_753289 ) ( ON ?auto_753291 ?auto_753290 ) ( not ( = ?auto_753284 ?auto_753285 ) ) ( not ( = ?auto_753284 ?auto_753286 ) ) ( not ( = ?auto_753284 ?auto_753287 ) ) ( not ( = ?auto_753284 ?auto_753288 ) ) ( not ( = ?auto_753284 ?auto_753289 ) ) ( not ( = ?auto_753284 ?auto_753290 ) ) ( not ( = ?auto_753284 ?auto_753291 ) ) ( not ( = ?auto_753284 ?auto_753292 ) ) ( not ( = ?auto_753285 ?auto_753286 ) ) ( not ( = ?auto_753285 ?auto_753287 ) ) ( not ( = ?auto_753285 ?auto_753288 ) ) ( not ( = ?auto_753285 ?auto_753289 ) ) ( not ( = ?auto_753285 ?auto_753290 ) ) ( not ( = ?auto_753285 ?auto_753291 ) ) ( not ( = ?auto_753285 ?auto_753292 ) ) ( not ( = ?auto_753286 ?auto_753287 ) ) ( not ( = ?auto_753286 ?auto_753288 ) ) ( not ( = ?auto_753286 ?auto_753289 ) ) ( not ( = ?auto_753286 ?auto_753290 ) ) ( not ( = ?auto_753286 ?auto_753291 ) ) ( not ( = ?auto_753286 ?auto_753292 ) ) ( not ( = ?auto_753287 ?auto_753288 ) ) ( not ( = ?auto_753287 ?auto_753289 ) ) ( not ( = ?auto_753287 ?auto_753290 ) ) ( not ( = ?auto_753287 ?auto_753291 ) ) ( not ( = ?auto_753287 ?auto_753292 ) ) ( not ( = ?auto_753288 ?auto_753289 ) ) ( not ( = ?auto_753288 ?auto_753290 ) ) ( not ( = ?auto_753288 ?auto_753291 ) ) ( not ( = ?auto_753288 ?auto_753292 ) ) ( not ( = ?auto_753289 ?auto_753290 ) ) ( not ( = ?auto_753289 ?auto_753291 ) ) ( not ( = ?auto_753289 ?auto_753292 ) ) ( not ( = ?auto_753290 ?auto_753291 ) ) ( not ( = ?auto_753290 ?auto_753292 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_753291 ?auto_753292 )
      ( MAKE-8CRATE-VERIFY ?auto_753284 ?auto_753285 ?auto_753286 ?auto_753287 ?auto_753288 ?auto_753289 ?auto_753290 ?auto_753291 ?auto_753292 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753351 - SURFACE
      ?auto_753352 - SURFACE
      ?auto_753353 - SURFACE
      ?auto_753354 - SURFACE
      ?auto_753355 - SURFACE
      ?auto_753356 - SURFACE
      ?auto_753357 - SURFACE
      ?auto_753358 - SURFACE
      ?auto_753359 - SURFACE
    )
    :vars
    (
      ?auto_753360 - HOIST
      ?auto_753361 - PLACE
      ?auto_753362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753360 ?auto_753361 ) ( SURFACE-AT ?auto_753358 ?auto_753361 ) ( CLEAR ?auto_753358 ) ( IS-CRATE ?auto_753359 ) ( not ( = ?auto_753358 ?auto_753359 ) ) ( TRUCK-AT ?auto_753362 ?auto_753361 ) ( AVAILABLE ?auto_753360 ) ( IN ?auto_753359 ?auto_753362 ) ( ON ?auto_753358 ?auto_753357 ) ( not ( = ?auto_753357 ?auto_753358 ) ) ( not ( = ?auto_753357 ?auto_753359 ) ) ( ON ?auto_753352 ?auto_753351 ) ( ON ?auto_753353 ?auto_753352 ) ( ON ?auto_753354 ?auto_753353 ) ( ON ?auto_753355 ?auto_753354 ) ( ON ?auto_753356 ?auto_753355 ) ( ON ?auto_753357 ?auto_753356 ) ( not ( = ?auto_753351 ?auto_753352 ) ) ( not ( = ?auto_753351 ?auto_753353 ) ) ( not ( = ?auto_753351 ?auto_753354 ) ) ( not ( = ?auto_753351 ?auto_753355 ) ) ( not ( = ?auto_753351 ?auto_753356 ) ) ( not ( = ?auto_753351 ?auto_753357 ) ) ( not ( = ?auto_753351 ?auto_753358 ) ) ( not ( = ?auto_753351 ?auto_753359 ) ) ( not ( = ?auto_753352 ?auto_753353 ) ) ( not ( = ?auto_753352 ?auto_753354 ) ) ( not ( = ?auto_753352 ?auto_753355 ) ) ( not ( = ?auto_753352 ?auto_753356 ) ) ( not ( = ?auto_753352 ?auto_753357 ) ) ( not ( = ?auto_753352 ?auto_753358 ) ) ( not ( = ?auto_753352 ?auto_753359 ) ) ( not ( = ?auto_753353 ?auto_753354 ) ) ( not ( = ?auto_753353 ?auto_753355 ) ) ( not ( = ?auto_753353 ?auto_753356 ) ) ( not ( = ?auto_753353 ?auto_753357 ) ) ( not ( = ?auto_753353 ?auto_753358 ) ) ( not ( = ?auto_753353 ?auto_753359 ) ) ( not ( = ?auto_753354 ?auto_753355 ) ) ( not ( = ?auto_753354 ?auto_753356 ) ) ( not ( = ?auto_753354 ?auto_753357 ) ) ( not ( = ?auto_753354 ?auto_753358 ) ) ( not ( = ?auto_753354 ?auto_753359 ) ) ( not ( = ?auto_753355 ?auto_753356 ) ) ( not ( = ?auto_753355 ?auto_753357 ) ) ( not ( = ?auto_753355 ?auto_753358 ) ) ( not ( = ?auto_753355 ?auto_753359 ) ) ( not ( = ?auto_753356 ?auto_753357 ) ) ( not ( = ?auto_753356 ?auto_753358 ) ) ( not ( = ?auto_753356 ?auto_753359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753357 ?auto_753358 ?auto_753359 )
      ( MAKE-8CRATE-VERIFY ?auto_753351 ?auto_753352 ?auto_753353 ?auto_753354 ?auto_753355 ?auto_753356 ?auto_753357 ?auto_753358 ?auto_753359 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753427 - SURFACE
      ?auto_753428 - SURFACE
      ?auto_753429 - SURFACE
      ?auto_753430 - SURFACE
      ?auto_753431 - SURFACE
      ?auto_753432 - SURFACE
      ?auto_753433 - SURFACE
      ?auto_753434 - SURFACE
      ?auto_753435 - SURFACE
    )
    :vars
    (
      ?auto_753438 - HOIST
      ?auto_753437 - PLACE
      ?auto_753436 - TRUCK
      ?auto_753439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_753438 ?auto_753437 ) ( SURFACE-AT ?auto_753434 ?auto_753437 ) ( CLEAR ?auto_753434 ) ( IS-CRATE ?auto_753435 ) ( not ( = ?auto_753434 ?auto_753435 ) ) ( AVAILABLE ?auto_753438 ) ( IN ?auto_753435 ?auto_753436 ) ( ON ?auto_753434 ?auto_753433 ) ( not ( = ?auto_753433 ?auto_753434 ) ) ( not ( = ?auto_753433 ?auto_753435 ) ) ( TRUCK-AT ?auto_753436 ?auto_753439 ) ( not ( = ?auto_753439 ?auto_753437 ) ) ( ON ?auto_753428 ?auto_753427 ) ( ON ?auto_753429 ?auto_753428 ) ( ON ?auto_753430 ?auto_753429 ) ( ON ?auto_753431 ?auto_753430 ) ( ON ?auto_753432 ?auto_753431 ) ( ON ?auto_753433 ?auto_753432 ) ( not ( = ?auto_753427 ?auto_753428 ) ) ( not ( = ?auto_753427 ?auto_753429 ) ) ( not ( = ?auto_753427 ?auto_753430 ) ) ( not ( = ?auto_753427 ?auto_753431 ) ) ( not ( = ?auto_753427 ?auto_753432 ) ) ( not ( = ?auto_753427 ?auto_753433 ) ) ( not ( = ?auto_753427 ?auto_753434 ) ) ( not ( = ?auto_753427 ?auto_753435 ) ) ( not ( = ?auto_753428 ?auto_753429 ) ) ( not ( = ?auto_753428 ?auto_753430 ) ) ( not ( = ?auto_753428 ?auto_753431 ) ) ( not ( = ?auto_753428 ?auto_753432 ) ) ( not ( = ?auto_753428 ?auto_753433 ) ) ( not ( = ?auto_753428 ?auto_753434 ) ) ( not ( = ?auto_753428 ?auto_753435 ) ) ( not ( = ?auto_753429 ?auto_753430 ) ) ( not ( = ?auto_753429 ?auto_753431 ) ) ( not ( = ?auto_753429 ?auto_753432 ) ) ( not ( = ?auto_753429 ?auto_753433 ) ) ( not ( = ?auto_753429 ?auto_753434 ) ) ( not ( = ?auto_753429 ?auto_753435 ) ) ( not ( = ?auto_753430 ?auto_753431 ) ) ( not ( = ?auto_753430 ?auto_753432 ) ) ( not ( = ?auto_753430 ?auto_753433 ) ) ( not ( = ?auto_753430 ?auto_753434 ) ) ( not ( = ?auto_753430 ?auto_753435 ) ) ( not ( = ?auto_753431 ?auto_753432 ) ) ( not ( = ?auto_753431 ?auto_753433 ) ) ( not ( = ?auto_753431 ?auto_753434 ) ) ( not ( = ?auto_753431 ?auto_753435 ) ) ( not ( = ?auto_753432 ?auto_753433 ) ) ( not ( = ?auto_753432 ?auto_753434 ) ) ( not ( = ?auto_753432 ?auto_753435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753433 ?auto_753434 ?auto_753435 )
      ( MAKE-8CRATE-VERIFY ?auto_753427 ?auto_753428 ?auto_753429 ?auto_753430 ?auto_753431 ?auto_753432 ?auto_753433 ?auto_753434 ?auto_753435 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753511 - SURFACE
      ?auto_753512 - SURFACE
      ?auto_753513 - SURFACE
      ?auto_753514 - SURFACE
      ?auto_753515 - SURFACE
      ?auto_753516 - SURFACE
      ?auto_753517 - SURFACE
      ?auto_753518 - SURFACE
      ?auto_753519 - SURFACE
    )
    :vars
    (
      ?auto_753520 - HOIST
      ?auto_753521 - PLACE
      ?auto_753523 - TRUCK
      ?auto_753524 - PLACE
      ?auto_753522 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_753520 ?auto_753521 ) ( SURFACE-AT ?auto_753518 ?auto_753521 ) ( CLEAR ?auto_753518 ) ( IS-CRATE ?auto_753519 ) ( not ( = ?auto_753518 ?auto_753519 ) ) ( AVAILABLE ?auto_753520 ) ( ON ?auto_753518 ?auto_753517 ) ( not ( = ?auto_753517 ?auto_753518 ) ) ( not ( = ?auto_753517 ?auto_753519 ) ) ( TRUCK-AT ?auto_753523 ?auto_753524 ) ( not ( = ?auto_753524 ?auto_753521 ) ) ( HOIST-AT ?auto_753522 ?auto_753524 ) ( LIFTING ?auto_753522 ?auto_753519 ) ( not ( = ?auto_753520 ?auto_753522 ) ) ( ON ?auto_753512 ?auto_753511 ) ( ON ?auto_753513 ?auto_753512 ) ( ON ?auto_753514 ?auto_753513 ) ( ON ?auto_753515 ?auto_753514 ) ( ON ?auto_753516 ?auto_753515 ) ( ON ?auto_753517 ?auto_753516 ) ( not ( = ?auto_753511 ?auto_753512 ) ) ( not ( = ?auto_753511 ?auto_753513 ) ) ( not ( = ?auto_753511 ?auto_753514 ) ) ( not ( = ?auto_753511 ?auto_753515 ) ) ( not ( = ?auto_753511 ?auto_753516 ) ) ( not ( = ?auto_753511 ?auto_753517 ) ) ( not ( = ?auto_753511 ?auto_753518 ) ) ( not ( = ?auto_753511 ?auto_753519 ) ) ( not ( = ?auto_753512 ?auto_753513 ) ) ( not ( = ?auto_753512 ?auto_753514 ) ) ( not ( = ?auto_753512 ?auto_753515 ) ) ( not ( = ?auto_753512 ?auto_753516 ) ) ( not ( = ?auto_753512 ?auto_753517 ) ) ( not ( = ?auto_753512 ?auto_753518 ) ) ( not ( = ?auto_753512 ?auto_753519 ) ) ( not ( = ?auto_753513 ?auto_753514 ) ) ( not ( = ?auto_753513 ?auto_753515 ) ) ( not ( = ?auto_753513 ?auto_753516 ) ) ( not ( = ?auto_753513 ?auto_753517 ) ) ( not ( = ?auto_753513 ?auto_753518 ) ) ( not ( = ?auto_753513 ?auto_753519 ) ) ( not ( = ?auto_753514 ?auto_753515 ) ) ( not ( = ?auto_753514 ?auto_753516 ) ) ( not ( = ?auto_753514 ?auto_753517 ) ) ( not ( = ?auto_753514 ?auto_753518 ) ) ( not ( = ?auto_753514 ?auto_753519 ) ) ( not ( = ?auto_753515 ?auto_753516 ) ) ( not ( = ?auto_753515 ?auto_753517 ) ) ( not ( = ?auto_753515 ?auto_753518 ) ) ( not ( = ?auto_753515 ?auto_753519 ) ) ( not ( = ?auto_753516 ?auto_753517 ) ) ( not ( = ?auto_753516 ?auto_753518 ) ) ( not ( = ?auto_753516 ?auto_753519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753517 ?auto_753518 ?auto_753519 )
      ( MAKE-8CRATE-VERIFY ?auto_753511 ?auto_753512 ?auto_753513 ?auto_753514 ?auto_753515 ?auto_753516 ?auto_753517 ?auto_753518 ?auto_753519 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753603 - SURFACE
      ?auto_753604 - SURFACE
      ?auto_753605 - SURFACE
      ?auto_753606 - SURFACE
      ?auto_753607 - SURFACE
      ?auto_753608 - SURFACE
      ?auto_753609 - SURFACE
      ?auto_753610 - SURFACE
      ?auto_753611 - SURFACE
    )
    :vars
    (
      ?auto_753615 - HOIST
      ?auto_753613 - PLACE
      ?auto_753612 - TRUCK
      ?auto_753616 - PLACE
      ?auto_753617 - HOIST
      ?auto_753614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_753615 ?auto_753613 ) ( SURFACE-AT ?auto_753610 ?auto_753613 ) ( CLEAR ?auto_753610 ) ( IS-CRATE ?auto_753611 ) ( not ( = ?auto_753610 ?auto_753611 ) ) ( AVAILABLE ?auto_753615 ) ( ON ?auto_753610 ?auto_753609 ) ( not ( = ?auto_753609 ?auto_753610 ) ) ( not ( = ?auto_753609 ?auto_753611 ) ) ( TRUCK-AT ?auto_753612 ?auto_753616 ) ( not ( = ?auto_753616 ?auto_753613 ) ) ( HOIST-AT ?auto_753617 ?auto_753616 ) ( not ( = ?auto_753615 ?auto_753617 ) ) ( AVAILABLE ?auto_753617 ) ( SURFACE-AT ?auto_753611 ?auto_753616 ) ( ON ?auto_753611 ?auto_753614 ) ( CLEAR ?auto_753611 ) ( not ( = ?auto_753610 ?auto_753614 ) ) ( not ( = ?auto_753611 ?auto_753614 ) ) ( not ( = ?auto_753609 ?auto_753614 ) ) ( ON ?auto_753604 ?auto_753603 ) ( ON ?auto_753605 ?auto_753604 ) ( ON ?auto_753606 ?auto_753605 ) ( ON ?auto_753607 ?auto_753606 ) ( ON ?auto_753608 ?auto_753607 ) ( ON ?auto_753609 ?auto_753608 ) ( not ( = ?auto_753603 ?auto_753604 ) ) ( not ( = ?auto_753603 ?auto_753605 ) ) ( not ( = ?auto_753603 ?auto_753606 ) ) ( not ( = ?auto_753603 ?auto_753607 ) ) ( not ( = ?auto_753603 ?auto_753608 ) ) ( not ( = ?auto_753603 ?auto_753609 ) ) ( not ( = ?auto_753603 ?auto_753610 ) ) ( not ( = ?auto_753603 ?auto_753611 ) ) ( not ( = ?auto_753603 ?auto_753614 ) ) ( not ( = ?auto_753604 ?auto_753605 ) ) ( not ( = ?auto_753604 ?auto_753606 ) ) ( not ( = ?auto_753604 ?auto_753607 ) ) ( not ( = ?auto_753604 ?auto_753608 ) ) ( not ( = ?auto_753604 ?auto_753609 ) ) ( not ( = ?auto_753604 ?auto_753610 ) ) ( not ( = ?auto_753604 ?auto_753611 ) ) ( not ( = ?auto_753604 ?auto_753614 ) ) ( not ( = ?auto_753605 ?auto_753606 ) ) ( not ( = ?auto_753605 ?auto_753607 ) ) ( not ( = ?auto_753605 ?auto_753608 ) ) ( not ( = ?auto_753605 ?auto_753609 ) ) ( not ( = ?auto_753605 ?auto_753610 ) ) ( not ( = ?auto_753605 ?auto_753611 ) ) ( not ( = ?auto_753605 ?auto_753614 ) ) ( not ( = ?auto_753606 ?auto_753607 ) ) ( not ( = ?auto_753606 ?auto_753608 ) ) ( not ( = ?auto_753606 ?auto_753609 ) ) ( not ( = ?auto_753606 ?auto_753610 ) ) ( not ( = ?auto_753606 ?auto_753611 ) ) ( not ( = ?auto_753606 ?auto_753614 ) ) ( not ( = ?auto_753607 ?auto_753608 ) ) ( not ( = ?auto_753607 ?auto_753609 ) ) ( not ( = ?auto_753607 ?auto_753610 ) ) ( not ( = ?auto_753607 ?auto_753611 ) ) ( not ( = ?auto_753607 ?auto_753614 ) ) ( not ( = ?auto_753608 ?auto_753609 ) ) ( not ( = ?auto_753608 ?auto_753610 ) ) ( not ( = ?auto_753608 ?auto_753611 ) ) ( not ( = ?auto_753608 ?auto_753614 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753609 ?auto_753610 ?auto_753611 )
      ( MAKE-8CRATE-VERIFY ?auto_753603 ?auto_753604 ?auto_753605 ?auto_753606 ?auto_753607 ?auto_753608 ?auto_753609 ?auto_753610 ?auto_753611 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753696 - SURFACE
      ?auto_753697 - SURFACE
      ?auto_753698 - SURFACE
      ?auto_753699 - SURFACE
      ?auto_753700 - SURFACE
      ?auto_753701 - SURFACE
      ?auto_753702 - SURFACE
      ?auto_753703 - SURFACE
      ?auto_753704 - SURFACE
    )
    :vars
    (
      ?auto_753707 - HOIST
      ?auto_753709 - PLACE
      ?auto_753706 - PLACE
      ?auto_753710 - HOIST
      ?auto_753708 - SURFACE
      ?auto_753705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753707 ?auto_753709 ) ( SURFACE-AT ?auto_753703 ?auto_753709 ) ( CLEAR ?auto_753703 ) ( IS-CRATE ?auto_753704 ) ( not ( = ?auto_753703 ?auto_753704 ) ) ( AVAILABLE ?auto_753707 ) ( ON ?auto_753703 ?auto_753702 ) ( not ( = ?auto_753702 ?auto_753703 ) ) ( not ( = ?auto_753702 ?auto_753704 ) ) ( not ( = ?auto_753706 ?auto_753709 ) ) ( HOIST-AT ?auto_753710 ?auto_753706 ) ( not ( = ?auto_753707 ?auto_753710 ) ) ( AVAILABLE ?auto_753710 ) ( SURFACE-AT ?auto_753704 ?auto_753706 ) ( ON ?auto_753704 ?auto_753708 ) ( CLEAR ?auto_753704 ) ( not ( = ?auto_753703 ?auto_753708 ) ) ( not ( = ?auto_753704 ?auto_753708 ) ) ( not ( = ?auto_753702 ?auto_753708 ) ) ( TRUCK-AT ?auto_753705 ?auto_753709 ) ( ON ?auto_753697 ?auto_753696 ) ( ON ?auto_753698 ?auto_753697 ) ( ON ?auto_753699 ?auto_753698 ) ( ON ?auto_753700 ?auto_753699 ) ( ON ?auto_753701 ?auto_753700 ) ( ON ?auto_753702 ?auto_753701 ) ( not ( = ?auto_753696 ?auto_753697 ) ) ( not ( = ?auto_753696 ?auto_753698 ) ) ( not ( = ?auto_753696 ?auto_753699 ) ) ( not ( = ?auto_753696 ?auto_753700 ) ) ( not ( = ?auto_753696 ?auto_753701 ) ) ( not ( = ?auto_753696 ?auto_753702 ) ) ( not ( = ?auto_753696 ?auto_753703 ) ) ( not ( = ?auto_753696 ?auto_753704 ) ) ( not ( = ?auto_753696 ?auto_753708 ) ) ( not ( = ?auto_753697 ?auto_753698 ) ) ( not ( = ?auto_753697 ?auto_753699 ) ) ( not ( = ?auto_753697 ?auto_753700 ) ) ( not ( = ?auto_753697 ?auto_753701 ) ) ( not ( = ?auto_753697 ?auto_753702 ) ) ( not ( = ?auto_753697 ?auto_753703 ) ) ( not ( = ?auto_753697 ?auto_753704 ) ) ( not ( = ?auto_753697 ?auto_753708 ) ) ( not ( = ?auto_753698 ?auto_753699 ) ) ( not ( = ?auto_753698 ?auto_753700 ) ) ( not ( = ?auto_753698 ?auto_753701 ) ) ( not ( = ?auto_753698 ?auto_753702 ) ) ( not ( = ?auto_753698 ?auto_753703 ) ) ( not ( = ?auto_753698 ?auto_753704 ) ) ( not ( = ?auto_753698 ?auto_753708 ) ) ( not ( = ?auto_753699 ?auto_753700 ) ) ( not ( = ?auto_753699 ?auto_753701 ) ) ( not ( = ?auto_753699 ?auto_753702 ) ) ( not ( = ?auto_753699 ?auto_753703 ) ) ( not ( = ?auto_753699 ?auto_753704 ) ) ( not ( = ?auto_753699 ?auto_753708 ) ) ( not ( = ?auto_753700 ?auto_753701 ) ) ( not ( = ?auto_753700 ?auto_753702 ) ) ( not ( = ?auto_753700 ?auto_753703 ) ) ( not ( = ?auto_753700 ?auto_753704 ) ) ( not ( = ?auto_753700 ?auto_753708 ) ) ( not ( = ?auto_753701 ?auto_753702 ) ) ( not ( = ?auto_753701 ?auto_753703 ) ) ( not ( = ?auto_753701 ?auto_753704 ) ) ( not ( = ?auto_753701 ?auto_753708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753702 ?auto_753703 ?auto_753704 )
      ( MAKE-8CRATE-VERIFY ?auto_753696 ?auto_753697 ?auto_753698 ?auto_753699 ?auto_753700 ?auto_753701 ?auto_753702 ?auto_753703 ?auto_753704 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753789 - SURFACE
      ?auto_753790 - SURFACE
      ?auto_753791 - SURFACE
      ?auto_753792 - SURFACE
      ?auto_753793 - SURFACE
      ?auto_753794 - SURFACE
      ?auto_753795 - SURFACE
      ?auto_753796 - SURFACE
      ?auto_753797 - SURFACE
    )
    :vars
    (
      ?auto_753803 - HOIST
      ?auto_753800 - PLACE
      ?auto_753801 - PLACE
      ?auto_753802 - HOIST
      ?auto_753798 - SURFACE
      ?auto_753799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753803 ?auto_753800 ) ( IS-CRATE ?auto_753797 ) ( not ( = ?auto_753796 ?auto_753797 ) ) ( not ( = ?auto_753795 ?auto_753796 ) ) ( not ( = ?auto_753795 ?auto_753797 ) ) ( not ( = ?auto_753801 ?auto_753800 ) ) ( HOIST-AT ?auto_753802 ?auto_753801 ) ( not ( = ?auto_753803 ?auto_753802 ) ) ( AVAILABLE ?auto_753802 ) ( SURFACE-AT ?auto_753797 ?auto_753801 ) ( ON ?auto_753797 ?auto_753798 ) ( CLEAR ?auto_753797 ) ( not ( = ?auto_753796 ?auto_753798 ) ) ( not ( = ?auto_753797 ?auto_753798 ) ) ( not ( = ?auto_753795 ?auto_753798 ) ) ( TRUCK-AT ?auto_753799 ?auto_753800 ) ( SURFACE-AT ?auto_753795 ?auto_753800 ) ( CLEAR ?auto_753795 ) ( LIFTING ?auto_753803 ?auto_753796 ) ( IS-CRATE ?auto_753796 ) ( ON ?auto_753790 ?auto_753789 ) ( ON ?auto_753791 ?auto_753790 ) ( ON ?auto_753792 ?auto_753791 ) ( ON ?auto_753793 ?auto_753792 ) ( ON ?auto_753794 ?auto_753793 ) ( ON ?auto_753795 ?auto_753794 ) ( not ( = ?auto_753789 ?auto_753790 ) ) ( not ( = ?auto_753789 ?auto_753791 ) ) ( not ( = ?auto_753789 ?auto_753792 ) ) ( not ( = ?auto_753789 ?auto_753793 ) ) ( not ( = ?auto_753789 ?auto_753794 ) ) ( not ( = ?auto_753789 ?auto_753795 ) ) ( not ( = ?auto_753789 ?auto_753796 ) ) ( not ( = ?auto_753789 ?auto_753797 ) ) ( not ( = ?auto_753789 ?auto_753798 ) ) ( not ( = ?auto_753790 ?auto_753791 ) ) ( not ( = ?auto_753790 ?auto_753792 ) ) ( not ( = ?auto_753790 ?auto_753793 ) ) ( not ( = ?auto_753790 ?auto_753794 ) ) ( not ( = ?auto_753790 ?auto_753795 ) ) ( not ( = ?auto_753790 ?auto_753796 ) ) ( not ( = ?auto_753790 ?auto_753797 ) ) ( not ( = ?auto_753790 ?auto_753798 ) ) ( not ( = ?auto_753791 ?auto_753792 ) ) ( not ( = ?auto_753791 ?auto_753793 ) ) ( not ( = ?auto_753791 ?auto_753794 ) ) ( not ( = ?auto_753791 ?auto_753795 ) ) ( not ( = ?auto_753791 ?auto_753796 ) ) ( not ( = ?auto_753791 ?auto_753797 ) ) ( not ( = ?auto_753791 ?auto_753798 ) ) ( not ( = ?auto_753792 ?auto_753793 ) ) ( not ( = ?auto_753792 ?auto_753794 ) ) ( not ( = ?auto_753792 ?auto_753795 ) ) ( not ( = ?auto_753792 ?auto_753796 ) ) ( not ( = ?auto_753792 ?auto_753797 ) ) ( not ( = ?auto_753792 ?auto_753798 ) ) ( not ( = ?auto_753793 ?auto_753794 ) ) ( not ( = ?auto_753793 ?auto_753795 ) ) ( not ( = ?auto_753793 ?auto_753796 ) ) ( not ( = ?auto_753793 ?auto_753797 ) ) ( not ( = ?auto_753793 ?auto_753798 ) ) ( not ( = ?auto_753794 ?auto_753795 ) ) ( not ( = ?auto_753794 ?auto_753796 ) ) ( not ( = ?auto_753794 ?auto_753797 ) ) ( not ( = ?auto_753794 ?auto_753798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753795 ?auto_753796 ?auto_753797 )
      ( MAKE-8CRATE-VERIFY ?auto_753789 ?auto_753790 ?auto_753791 ?auto_753792 ?auto_753793 ?auto_753794 ?auto_753795 ?auto_753796 ?auto_753797 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_753882 - SURFACE
      ?auto_753883 - SURFACE
      ?auto_753884 - SURFACE
      ?auto_753885 - SURFACE
      ?auto_753886 - SURFACE
      ?auto_753887 - SURFACE
      ?auto_753888 - SURFACE
      ?auto_753889 - SURFACE
      ?auto_753890 - SURFACE
    )
    :vars
    (
      ?auto_753893 - HOIST
      ?auto_753895 - PLACE
      ?auto_753892 - PLACE
      ?auto_753896 - HOIST
      ?auto_753894 - SURFACE
      ?auto_753891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_753893 ?auto_753895 ) ( IS-CRATE ?auto_753890 ) ( not ( = ?auto_753889 ?auto_753890 ) ) ( not ( = ?auto_753888 ?auto_753889 ) ) ( not ( = ?auto_753888 ?auto_753890 ) ) ( not ( = ?auto_753892 ?auto_753895 ) ) ( HOIST-AT ?auto_753896 ?auto_753892 ) ( not ( = ?auto_753893 ?auto_753896 ) ) ( AVAILABLE ?auto_753896 ) ( SURFACE-AT ?auto_753890 ?auto_753892 ) ( ON ?auto_753890 ?auto_753894 ) ( CLEAR ?auto_753890 ) ( not ( = ?auto_753889 ?auto_753894 ) ) ( not ( = ?auto_753890 ?auto_753894 ) ) ( not ( = ?auto_753888 ?auto_753894 ) ) ( TRUCK-AT ?auto_753891 ?auto_753895 ) ( SURFACE-AT ?auto_753888 ?auto_753895 ) ( CLEAR ?auto_753888 ) ( IS-CRATE ?auto_753889 ) ( AVAILABLE ?auto_753893 ) ( IN ?auto_753889 ?auto_753891 ) ( ON ?auto_753883 ?auto_753882 ) ( ON ?auto_753884 ?auto_753883 ) ( ON ?auto_753885 ?auto_753884 ) ( ON ?auto_753886 ?auto_753885 ) ( ON ?auto_753887 ?auto_753886 ) ( ON ?auto_753888 ?auto_753887 ) ( not ( = ?auto_753882 ?auto_753883 ) ) ( not ( = ?auto_753882 ?auto_753884 ) ) ( not ( = ?auto_753882 ?auto_753885 ) ) ( not ( = ?auto_753882 ?auto_753886 ) ) ( not ( = ?auto_753882 ?auto_753887 ) ) ( not ( = ?auto_753882 ?auto_753888 ) ) ( not ( = ?auto_753882 ?auto_753889 ) ) ( not ( = ?auto_753882 ?auto_753890 ) ) ( not ( = ?auto_753882 ?auto_753894 ) ) ( not ( = ?auto_753883 ?auto_753884 ) ) ( not ( = ?auto_753883 ?auto_753885 ) ) ( not ( = ?auto_753883 ?auto_753886 ) ) ( not ( = ?auto_753883 ?auto_753887 ) ) ( not ( = ?auto_753883 ?auto_753888 ) ) ( not ( = ?auto_753883 ?auto_753889 ) ) ( not ( = ?auto_753883 ?auto_753890 ) ) ( not ( = ?auto_753883 ?auto_753894 ) ) ( not ( = ?auto_753884 ?auto_753885 ) ) ( not ( = ?auto_753884 ?auto_753886 ) ) ( not ( = ?auto_753884 ?auto_753887 ) ) ( not ( = ?auto_753884 ?auto_753888 ) ) ( not ( = ?auto_753884 ?auto_753889 ) ) ( not ( = ?auto_753884 ?auto_753890 ) ) ( not ( = ?auto_753884 ?auto_753894 ) ) ( not ( = ?auto_753885 ?auto_753886 ) ) ( not ( = ?auto_753885 ?auto_753887 ) ) ( not ( = ?auto_753885 ?auto_753888 ) ) ( not ( = ?auto_753885 ?auto_753889 ) ) ( not ( = ?auto_753885 ?auto_753890 ) ) ( not ( = ?auto_753885 ?auto_753894 ) ) ( not ( = ?auto_753886 ?auto_753887 ) ) ( not ( = ?auto_753886 ?auto_753888 ) ) ( not ( = ?auto_753886 ?auto_753889 ) ) ( not ( = ?auto_753886 ?auto_753890 ) ) ( not ( = ?auto_753886 ?auto_753894 ) ) ( not ( = ?auto_753887 ?auto_753888 ) ) ( not ( = ?auto_753887 ?auto_753889 ) ) ( not ( = ?auto_753887 ?auto_753890 ) ) ( not ( = ?auto_753887 ?auto_753894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_753888 ?auto_753889 ?auto_753890 )
      ( MAKE-8CRATE-VERIFY ?auto_753882 ?auto_753883 ?auto_753884 ?auto_753885 ?auto_753886 ?auto_753887 ?auto_753888 ?auto_753889 ?auto_753890 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_756977 - SURFACE
      ?auto_756978 - SURFACE
    )
    :vars
    (
      ?auto_756981 - HOIST
      ?auto_756980 - PLACE
      ?auto_756983 - SURFACE
      ?auto_756982 - TRUCK
      ?auto_756979 - PLACE
      ?auto_756984 - HOIST
      ?auto_756985 - SURFACE
      ?auto_756986 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_756981 ?auto_756980 ) ( SURFACE-AT ?auto_756977 ?auto_756980 ) ( CLEAR ?auto_756977 ) ( IS-CRATE ?auto_756978 ) ( not ( = ?auto_756977 ?auto_756978 ) ) ( AVAILABLE ?auto_756981 ) ( ON ?auto_756977 ?auto_756983 ) ( not ( = ?auto_756983 ?auto_756977 ) ) ( not ( = ?auto_756983 ?auto_756978 ) ) ( TRUCK-AT ?auto_756982 ?auto_756979 ) ( not ( = ?auto_756979 ?auto_756980 ) ) ( HOIST-AT ?auto_756984 ?auto_756979 ) ( not ( = ?auto_756981 ?auto_756984 ) ) ( SURFACE-AT ?auto_756978 ?auto_756979 ) ( ON ?auto_756978 ?auto_756985 ) ( CLEAR ?auto_756978 ) ( not ( = ?auto_756977 ?auto_756985 ) ) ( not ( = ?auto_756978 ?auto_756985 ) ) ( not ( = ?auto_756983 ?auto_756985 ) ) ( LIFTING ?auto_756984 ?auto_756986 ) ( IS-CRATE ?auto_756986 ) ( not ( = ?auto_756977 ?auto_756986 ) ) ( not ( = ?auto_756978 ?auto_756986 ) ) ( not ( = ?auto_756983 ?auto_756986 ) ) ( not ( = ?auto_756985 ?auto_756986 ) ) )
    :subtasks
    ( ( !LOAD ?auto_756984 ?auto_756986 ?auto_756982 ?auto_756979 )
      ( MAKE-1CRATE ?auto_756977 ?auto_756978 )
      ( MAKE-1CRATE-VERIFY ?auto_756977 ?auto_756978 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_757989 - SURFACE
      ?auto_757990 - SURFACE
      ?auto_757991 - SURFACE
      ?auto_757992 - SURFACE
      ?auto_757993 - SURFACE
      ?auto_757994 - SURFACE
      ?auto_757995 - SURFACE
      ?auto_757996 - SURFACE
      ?auto_757997 - SURFACE
      ?auto_757998 - SURFACE
    )
    :vars
    (
      ?auto_758000 - HOIST
      ?auto_757999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758000 ?auto_757999 ) ( SURFACE-AT ?auto_757997 ?auto_757999 ) ( CLEAR ?auto_757997 ) ( LIFTING ?auto_758000 ?auto_757998 ) ( IS-CRATE ?auto_757998 ) ( not ( = ?auto_757997 ?auto_757998 ) ) ( ON ?auto_757990 ?auto_757989 ) ( ON ?auto_757991 ?auto_757990 ) ( ON ?auto_757992 ?auto_757991 ) ( ON ?auto_757993 ?auto_757992 ) ( ON ?auto_757994 ?auto_757993 ) ( ON ?auto_757995 ?auto_757994 ) ( ON ?auto_757996 ?auto_757995 ) ( ON ?auto_757997 ?auto_757996 ) ( not ( = ?auto_757989 ?auto_757990 ) ) ( not ( = ?auto_757989 ?auto_757991 ) ) ( not ( = ?auto_757989 ?auto_757992 ) ) ( not ( = ?auto_757989 ?auto_757993 ) ) ( not ( = ?auto_757989 ?auto_757994 ) ) ( not ( = ?auto_757989 ?auto_757995 ) ) ( not ( = ?auto_757989 ?auto_757996 ) ) ( not ( = ?auto_757989 ?auto_757997 ) ) ( not ( = ?auto_757989 ?auto_757998 ) ) ( not ( = ?auto_757990 ?auto_757991 ) ) ( not ( = ?auto_757990 ?auto_757992 ) ) ( not ( = ?auto_757990 ?auto_757993 ) ) ( not ( = ?auto_757990 ?auto_757994 ) ) ( not ( = ?auto_757990 ?auto_757995 ) ) ( not ( = ?auto_757990 ?auto_757996 ) ) ( not ( = ?auto_757990 ?auto_757997 ) ) ( not ( = ?auto_757990 ?auto_757998 ) ) ( not ( = ?auto_757991 ?auto_757992 ) ) ( not ( = ?auto_757991 ?auto_757993 ) ) ( not ( = ?auto_757991 ?auto_757994 ) ) ( not ( = ?auto_757991 ?auto_757995 ) ) ( not ( = ?auto_757991 ?auto_757996 ) ) ( not ( = ?auto_757991 ?auto_757997 ) ) ( not ( = ?auto_757991 ?auto_757998 ) ) ( not ( = ?auto_757992 ?auto_757993 ) ) ( not ( = ?auto_757992 ?auto_757994 ) ) ( not ( = ?auto_757992 ?auto_757995 ) ) ( not ( = ?auto_757992 ?auto_757996 ) ) ( not ( = ?auto_757992 ?auto_757997 ) ) ( not ( = ?auto_757992 ?auto_757998 ) ) ( not ( = ?auto_757993 ?auto_757994 ) ) ( not ( = ?auto_757993 ?auto_757995 ) ) ( not ( = ?auto_757993 ?auto_757996 ) ) ( not ( = ?auto_757993 ?auto_757997 ) ) ( not ( = ?auto_757993 ?auto_757998 ) ) ( not ( = ?auto_757994 ?auto_757995 ) ) ( not ( = ?auto_757994 ?auto_757996 ) ) ( not ( = ?auto_757994 ?auto_757997 ) ) ( not ( = ?auto_757994 ?auto_757998 ) ) ( not ( = ?auto_757995 ?auto_757996 ) ) ( not ( = ?auto_757995 ?auto_757997 ) ) ( not ( = ?auto_757995 ?auto_757998 ) ) ( not ( = ?auto_757996 ?auto_757997 ) ) ( not ( = ?auto_757996 ?auto_757998 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_757997 ?auto_757998 )
      ( MAKE-9CRATE-VERIFY ?auto_757989 ?auto_757990 ?auto_757991 ?auto_757992 ?auto_757993 ?auto_757994 ?auto_757995 ?auto_757996 ?auto_757997 ?auto_757998 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758069 - SURFACE
      ?auto_758070 - SURFACE
      ?auto_758071 - SURFACE
      ?auto_758072 - SURFACE
      ?auto_758073 - SURFACE
      ?auto_758074 - SURFACE
      ?auto_758075 - SURFACE
      ?auto_758076 - SURFACE
      ?auto_758077 - SURFACE
      ?auto_758078 - SURFACE
    )
    :vars
    (
      ?auto_758080 - HOIST
      ?auto_758081 - PLACE
      ?auto_758079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758080 ?auto_758081 ) ( SURFACE-AT ?auto_758077 ?auto_758081 ) ( CLEAR ?auto_758077 ) ( IS-CRATE ?auto_758078 ) ( not ( = ?auto_758077 ?auto_758078 ) ) ( TRUCK-AT ?auto_758079 ?auto_758081 ) ( AVAILABLE ?auto_758080 ) ( IN ?auto_758078 ?auto_758079 ) ( ON ?auto_758077 ?auto_758076 ) ( not ( = ?auto_758076 ?auto_758077 ) ) ( not ( = ?auto_758076 ?auto_758078 ) ) ( ON ?auto_758070 ?auto_758069 ) ( ON ?auto_758071 ?auto_758070 ) ( ON ?auto_758072 ?auto_758071 ) ( ON ?auto_758073 ?auto_758072 ) ( ON ?auto_758074 ?auto_758073 ) ( ON ?auto_758075 ?auto_758074 ) ( ON ?auto_758076 ?auto_758075 ) ( not ( = ?auto_758069 ?auto_758070 ) ) ( not ( = ?auto_758069 ?auto_758071 ) ) ( not ( = ?auto_758069 ?auto_758072 ) ) ( not ( = ?auto_758069 ?auto_758073 ) ) ( not ( = ?auto_758069 ?auto_758074 ) ) ( not ( = ?auto_758069 ?auto_758075 ) ) ( not ( = ?auto_758069 ?auto_758076 ) ) ( not ( = ?auto_758069 ?auto_758077 ) ) ( not ( = ?auto_758069 ?auto_758078 ) ) ( not ( = ?auto_758070 ?auto_758071 ) ) ( not ( = ?auto_758070 ?auto_758072 ) ) ( not ( = ?auto_758070 ?auto_758073 ) ) ( not ( = ?auto_758070 ?auto_758074 ) ) ( not ( = ?auto_758070 ?auto_758075 ) ) ( not ( = ?auto_758070 ?auto_758076 ) ) ( not ( = ?auto_758070 ?auto_758077 ) ) ( not ( = ?auto_758070 ?auto_758078 ) ) ( not ( = ?auto_758071 ?auto_758072 ) ) ( not ( = ?auto_758071 ?auto_758073 ) ) ( not ( = ?auto_758071 ?auto_758074 ) ) ( not ( = ?auto_758071 ?auto_758075 ) ) ( not ( = ?auto_758071 ?auto_758076 ) ) ( not ( = ?auto_758071 ?auto_758077 ) ) ( not ( = ?auto_758071 ?auto_758078 ) ) ( not ( = ?auto_758072 ?auto_758073 ) ) ( not ( = ?auto_758072 ?auto_758074 ) ) ( not ( = ?auto_758072 ?auto_758075 ) ) ( not ( = ?auto_758072 ?auto_758076 ) ) ( not ( = ?auto_758072 ?auto_758077 ) ) ( not ( = ?auto_758072 ?auto_758078 ) ) ( not ( = ?auto_758073 ?auto_758074 ) ) ( not ( = ?auto_758073 ?auto_758075 ) ) ( not ( = ?auto_758073 ?auto_758076 ) ) ( not ( = ?auto_758073 ?auto_758077 ) ) ( not ( = ?auto_758073 ?auto_758078 ) ) ( not ( = ?auto_758074 ?auto_758075 ) ) ( not ( = ?auto_758074 ?auto_758076 ) ) ( not ( = ?auto_758074 ?auto_758077 ) ) ( not ( = ?auto_758074 ?auto_758078 ) ) ( not ( = ?auto_758075 ?auto_758076 ) ) ( not ( = ?auto_758075 ?auto_758077 ) ) ( not ( = ?auto_758075 ?auto_758078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758076 ?auto_758077 ?auto_758078 )
      ( MAKE-9CRATE-VERIFY ?auto_758069 ?auto_758070 ?auto_758071 ?auto_758072 ?auto_758073 ?auto_758074 ?auto_758075 ?auto_758076 ?auto_758077 ?auto_758078 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758159 - SURFACE
      ?auto_758160 - SURFACE
      ?auto_758161 - SURFACE
      ?auto_758162 - SURFACE
      ?auto_758163 - SURFACE
      ?auto_758164 - SURFACE
      ?auto_758165 - SURFACE
      ?auto_758166 - SURFACE
      ?auto_758167 - SURFACE
      ?auto_758168 - SURFACE
    )
    :vars
    (
      ?auto_758170 - HOIST
      ?auto_758169 - PLACE
      ?auto_758171 - TRUCK
      ?auto_758172 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758170 ?auto_758169 ) ( SURFACE-AT ?auto_758167 ?auto_758169 ) ( CLEAR ?auto_758167 ) ( IS-CRATE ?auto_758168 ) ( not ( = ?auto_758167 ?auto_758168 ) ) ( AVAILABLE ?auto_758170 ) ( IN ?auto_758168 ?auto_758171 ) ( ON ?auto_758167 ?auto_758166 ) ( not ( = ?auto_758166 ?auto_758167 ) ) ( not ( = ?auto_758166 ?auto_758168 ) ) ( TRUCK-AT ?auto_758171 ?auto_758172 ) ( not ( = ?auto_758172 ?auto_758169 ) ) ( ON ?auto_758160 ?auto_758159 ) ( ON ?auto_758161 ?auto_758160 ) ( ON ?auto_758162 ?auto_758161 ) ( ON ?auto_758163 ?auto_758162 ) ( ON ?auto_758164 ?auto_758163 ) ( ON ?auto_758165 ?auto_758164 ) ( ON ?auto_758166 ?auto_758165 ) ( not ( = ?auto_758159 ?auto_758160 ) ) ( not ( = ?auto_758159 ?auto_758161 ) ) ( not ( = ?auto_758159 ?auto_758162 ) ) ( not ( = ?auto_758159 ?auto_758163 ) ) ( not ( = ?auto_758159 ?auto_758164 ) ) ( not ( = ?auto_758159 ?auto_758165 ) ) ( not ( = ?auto_758159 ?auto_758166 ) ) ( not ( = ?auto_758159 ?auto_758167 ) ) ( not ( = ?auto_758159 ?auto_758168 ) ) ( not ( = ?auto_758160 ?auto_758161 ) ) ( not ( = ?auto_758160 ?auto_758162 ) ) ( not ( = ?auto_758160 ?auto_758163 ) ) ( not ( = ?auto_758160 ?auto_758164 ) ) ( not ( = ?auto_758160 ?auto_758165 ) ) ( not ( = ?auto_758160 ?auto_758166 ) ) ( not ( = ?auto_758160 ?auto_758167 ) ) ( not ( = ?auto_758160 ?auto_758168 ) ) ( not ( = ?auto_758161 ?auto_758162 ) ) ( not ( = ?auto_758161 ?auto_758163 ) ) ( not ( = ?auto_758161 ?auto_758164 ) ) ( not ( = ?auto_758161 ?auto_758165 ) ) ( not ( = ?auto_758161 ?auto_758166 ) ) ( not ( = ?auto_758161 ?auto_758167 ) ) ( not ( = ?auto_758161 ?auto_758168 ) ) ( not ( = ?auto_758162 ?auto_758163 ) ) ( not ( = ?auto_758162 ?auto_758164 ) ) ( not ( = ?auto_758162 ?auto_758165 ) ) ( not ( = ?auto_758162 ?auto_758166 ) ) ( not ( = ?auto_758162 ?auto_758167 ) ) ( not ( = ?auto_758162 ?auto_758168 ) ) ( not ( = ?auto_758163 ?auto_758164 ) ) ( not ( = ?auto_758163 ?auto_758165 ) ) ( not ( = ?auto_758163 ?auto_758166 ) ) ( not ( = ?auto_758163 ?auto_758167 ) ) ( not ( = ?auto_758163 ?auto_758168 ) ) ( not ( = ?auto_758164 ?auto_758165 ) ) ( not ( = ?auto_758164 ?auto_758166 ) ) ( not ( = ?auto_758164 ?auto_758167 ) ) ( not ( = ?auto_758164 ?auto_758168 ) ) ( not ( = ?auto_758165 ?auto_758166 ) ) ( not ( = ?auto_758165 ?auto_758167 ) ) ( not ( = ?auto_758165 ?auto_758168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758166 ?auto_758167 ?auto_758168 )
      ( MAKE-9CRATE-VERIFY ?auto_758159 ?auto_758160 ?auto_758161 ?auto_758162 ?auto_758163 ?auto_758164 ?auto_758165 ?auto_758166 ?auto_758167 ?auto_758168 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758258 - SURFACE
      ?auto_758259 - SURFACE
      ?auto_758260 - SURFACE
      ?auto_758261 - SURFACE
      ?auto_758262 - SURFACE
      ?auto_758263 - SURFACE
      ?auto_758264 - SURFACE
      ?auto_758265 - SURFACE
      ?auto_758266 - SURFACE
      ?auto_758267 - SURFACE
    )
    :vars
    (
      ?auto_758270 - HOIST
      ?auto_758271 - PLACE
      ?auto_758269 - TRUCK
      ?auto_758268 - PLACE
      ?auto_758272 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_758270 ?auto_758271 ) ( SURFACE-AT ?auto_758266 ?auto_758271 ) ( CLEAR ?auto_758266 ) ( IS-CRATE ?auto_758267 ) ( not ( = ?auto_758266 ?auto_758267 ) ) ( AVAILABLE ?auto_758270 ) ( ON ?auto_758266 ?auto_758265 ) ( not ( = ?auto_758265 ?auto_758266 ) ) ( not ( = ?auto_758265 ?auto_758267 ) ) ( TRUCK-AT ?auto_758269 ?auto_758268 ) ( not ( = ?auto_758268 ?auto_758271 ) ) ( HOIST-AT ?auto_758272 ?auto_758268 ) ( LIFTING ?auto_758272 ?auto_758267 ) ( not ( = ?auto_758270 ?auto_758272 ) ) ( ON ?auto_758259 ?auto_758258 ) ( ON ?auto_758260 ?auto_758259 ) ( ON ?auto_758261 ?auto_758260 ) ( ON ?auto_758262 ?auto_758261 ) ( ON ?auto_758263 ?auto_758262 ) ( ON ?auto_758264 ?auto_758263 ) ( ON ?auto_758265 ?auto_758264 ) ( not ( = ?auto_758258 ?auto_758259 ) ) ( not ( = ?auto_758258 ?auto_758260 ) ) ( not ( = ?auto_758258 ?auto_758261 ) ) ( not ( = ?auto_758258 ?auto_758262 ) ) ( not ( = ?auto_758258 ?auto_758263 ) ) ( not ( = ?auto_758258 ?auto_758264 ) ) ( not ( = ?auto_758258 ?auto_758265 ) ) ( not ( = ?auto_758258 ?auto_758266 ) ) ( not ( = ?auto_758258 ?auto_758267 ) ) ( not ( = ?auto_758259 ?auto_758260 ) ) ( not ( = ?auto_758259 ?auto_758261 ) ) ( not ( = ?auto_758259 ?auto_758262 ) ) ( not ( = ?auto_758259 ?auto_758263 ) ) ( not ( = ?auto_758259 ?auto_758264 ) ) ( not ( = ?auto_758259 ?auto_758265 ) ) ( not ( = ?auto_758259 ?auto_758266 ) ) ( not ( = ?auto_758259 ?auto_758267 ) ) ( not ( = ?auto_758260 ?auto_758261 ) ) ( not ( = ?auto_758260 ?auto_758262 ) ) ( not ( = ?auto_758260 ?auto_758263 ) ) ( not ( = ?auto_758260 ?auto_758264 ) ) ( not ( = ?auto_758260 ?auto_758265 ) ) ( not ( = ?auto_758260 ?auto_758266 ) ) ( not ( = ?auto_758260 ?auto_758267 ) ) ( not ( = ?auto_758261 ?auto_758262 ) ) ( not ( = ?auto_758261 ?auto_758263 ) ) ( not ( = ?auto_758261 ?auto_758264 ) ) ( not ( = ?auto_758261 ?auto_758265 ) ) ( not ( = ?auto_758261 ?auto_758266 ) ) ( not ( = ?auto_758261 ?auto_758267 ) ) ( not ( = ?auto_758262 ?auto_758263 ) ) ( not ( = ?auto_758262 ?auto_758264 ) ) ( not ( = ?auto_758262 ?auto_758265 ) ) ( not ( = ?auto_758262 ?auto_758266 ) ) ( not ( = ?auto_758262 ?auto_758267 ) ) ( not ( = ?auto_758263 ?auto_758264 ) ) ( not ( = ?auto_758263 ?auto_758265 ) ) ( not ( = ?auto_758263 ?auto_758266 ) ) ( not ( = ?auto_758263 ?auto_758267 ) ) ( not ( = ?auto_758264 ?auto_758265 ) ) ( not ( = ?auto_758264 ?auto_758266 ) ) ( not ( = ?auto_758264 ?auto_758267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758265 ?auto_758266 ?auto_758267 )
      ( MAKE-9CRATE-VERIFY ?auto_758258 ?auto_758259 ?auto_758260 ?auto_758261 ?auto_758262 ?auto_758263 ?auto_758264 ?auto_758265 ?auto_758266 ?auto_758267 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758366 - SURFACE
      ?auto_758367 - SURFACE
      ?auto_758368 - SURFACE
      ?auto_758369 - SURFACE
      ?auto_758370 - SURFACE
      ?auto_758371 - SURFACE
      ?auto_758372 - SURFACE
      ?auto_758373 - SURFACE
      ?auto_758374 - SURFACE
      ?auto_758375 - SURFACE
    )
    :vars
    (
      ?auto_758379 - HOIST
      ?auto_758378 - PLACE
      ?auto_758380 - TRUCK
      ?auto_758376 - PLACE
      ?auto_758377 - HOIST
      ?auto_758381 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758379 ?auto_758378 ) ( SURFACE-AT ?auto_758374 ?auto_758378 ) ( CLEAR ?auto_758374 ) ( IS-CRATE ?auto_758375 ) ( not ( = ?auto_758374 ?auto_758375 ) ) ( AVAILABLE ?auto_758379 ) ( ON ?auto_758374 ?auto_758373 ) ( not ( = ?auto_758373 ?auto_758374 ) ) ( not ( = ?auto_758373 ?auto_758375 ) ) ( TRUCK-AT ?auto_758380 ?auto_758376 ) ( not ( = ?auto_758376 ?auto_758378 ) ) ( HOIST-AT ?auto_758377 ?auto_758376 ) ( not ( = ?auto_758379 ?auto_758377 ) ) ( AVAILABLE ?auto_758377 ) ( SURFACE-AT ?auto_758375 ?auto_758376 ) ( ON ?auto_758375 ?auto_758381 ) ( CLEAR ?auto_758375 ) ( not ( = ?auto_758374 ?auto_758381 ) ) ( not ( = ?auto_758375 ?auto_758381 ) ) ( not ( = ?auto_758373 ?auto_758381 ) ) ( ON ?auto_758367 ?auto_758366 ) ( ON ?auto_758368 ?auto_758367 ) ( ON ?auto_758369 ?auto_758368 ) ( ON ?auto_758370 ?auto_758369 ) ( ON ?auto_758371 ?auto_758370 ) ( ON ?auto_758372 ?auto_758371 ) ( ON ?auto_758373 ?auto_758372 ) ( not ( = ?auto_758366 ?auto_758367 ) ) ( not ( = ?auto_758366 ?auto_758368 ) ) ( not ( = ?auto_758366 ?auto_758369 ) ) ( not ( = ?auto_758366 ?auto_758370 ) ) ( not ( = ?auto_758366 ?auto_758371 ) ) ( not ( = ?auto_758366 ?auto_758372 ) ) ( not ( = ?auto_758366 ?auto_758373 ) ) ( not ( = ?auto_758366 ?auto_758374 ) ) ( not ( = ?auto_758366 ?auto_758375 ) ) ( not ( = ?auto_758366 ?auto_758381 ) ) ( not ( = ?auto_758367 ?auto_758368 ) ) ( not ( = ?auto_758367 ?auto_758369 ) ) ( not ( = ?auto_758367 ?auto_758370 ) ) ( not ( = ?auto_758367 ?auto_758371 ) ) ( not ( = ?auto_758367 ?auto_758372 ) ) ( not ( = ?auto_758367 ?auto_758373 ) ) ( not ( = ?auto_758367 ?auto_758374 ) ) ( not ( = ?auto_758367 ?auto_758375 ) ) ( not ( = ?auto_758367 ?auto_758381 ) ) ( not ( = ?auto_758368 ?auto_758369 ) ) ( not ( = ?auto_758368 ?auto_758370 ) ) ( not ( = ?auto_758368 ?auto_758371 ) ) ( not ( = ?auto_758368 ?auto_758372 ) ) ( not ( = ?auto_758368 ?auto_758373 ) ) ( not ( = ?auto_758368 ?auto_758374 ) ) ( not ( = ?auto_758368 ?auto_758375 ) ) ( not ( = ?auto_758368 ?auto_758381 ) ) ( not ( = ?auto_758369 ?auto_758370 ) ) ( not ( = ?auto_758369 ?auto_758371 ) ) ( not ( = ?auto_758369 ?auto_758372 ) ) ( not ( = ?auto_758369 ?auto_758373 ) ) ( not ( = ?auto_758369 ?auto_758374 ) ) ( not ( = ?auto_758369 ?auto_758375 ) ) ( not ( = ?auto_758369 ?auto_758381 ) ) ( not ( = ?auto_758370 ?auto_758371 ) ) ( not ( = ?auto_758370 ?auto_758372 ) ) ( not ( = ?auto_758370 ?auto_758373 ) ) ( not ( = ?auto_758370 ?auto_758374 ) ) ( not ( = ?auto_758370 ?auto_758375 ) ) ( not ( = ?auto_758370 ?auto_758381 ) ) ( not ( = ?auto_758371 ?auto_758372 ) ) ( not ( = ?auto_758371 ?auto_758373 ) ) ( not ( = ?auto_758371 ?auto_758374 ) ) ( not ( = ?auto_758371 ?auto_758375 ) ) ( not ( = ?auto_758371 ?auto_758381 ) ) ( not ( = ?auto_758372 ?auto_758373 ) ) ( not ( = ?auto_758372 ?auto_758374 ) ) ( not ( = ?auto_758372 ?auto_758375 ) ) ( not ( = ?auto_758372 ?auto_758381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758373 ?auto_758374 ?auto_758375 )
      ( MAKE-9CRATE-VERIFY ?auto_758366 ?auto_758367 ?auto_758368 ?auto_758369 ?auto_758370 ?auto_758371 ?auto_758372 ?auto_758373 ?auto_758374 ?auto_758375 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758475 - SURFACE
      ?auto_758476 - SURFACE
      ?auto_758477 - SURFACE
      ?auto_758478 - SURFACE
      ?auto_758479 - SURFACE
      ?auto_758480 - SURFACE
      ?auto_758481 - SURFACE
      ?auto_758482 - SURFACE
      ?auto_758483 - SURFACE
      ?auto_758484 - SURFACE
    )
    :vars
    (
      ?auto_758487 - HOIST
      ?auto_758489 - PLACE
      ?auto_758488 - PLACE
      ?auto_758490 - HOIST
      ?auto_758485 - SURFACE
      ?auto_758486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758487 ?auto_758489 ) ( SURFACE-AT ?auto_758483 ?auto_758489 ) ( CLEAR ?auto_758483 ) ( IS-CRATE ?auto_758484 ) ( not ( = ?auto_758483 ?auto_758484 ) ) ( AVAILABLE ?auto_758487 ) ( ON ?auto_758483 ?auto_758482 ) ( not ( = ?auto_758482 ?auto_758483 ) ) ( not ( = ?auto_758482 ?auto_758484 ) ) ( not ( = ?auto_758488 ?auto_758489 ) ) ( HOIST-AT ?auto_758490 ?auto_758488 ) ( not ( = ?auto_758487 ?auto_758490 ) ) ( AVAILABLE ?auto_758490 ) ( SURFACE-AT ?auto_758484 ?auto_758488 ) ( ON ?auto_758484 ?auto_758485 ) ( CLEAR ?auto_758484 ) ( not ( = ?auto_758483 ?auto_758485 ) ) ( not ( = ?auto_758484 ?auto_758485 ) ) ( not ( = ?auto_758482 ?auto_758485 ) ) ( TRUCK-AT ?auto_758486 ?auto_758489 ) ( ON ?auto_758476 ?auto_758475 ) ( ON ?auto_758477 ?auto_758476 ) ( ON ?auto_758478 ?auto_758477 ) ( ON ?auto_758479 ?auto_758478 ) ( ON ?auto_758480 ?auto_758479 ) ( ON ?auto_758481 ?auto_758480 ) ( ON ?auto_758482 ?auto_758481 ) ( not ( = ?auto_758475 ?auto_758476 ) ) ( not ( = ?auto_758475 ?auto_758477 ) ) ( not ( = ?auto_758475 ?auto_758478 ) ) ( not ( = ?auto_758475 ?auto_758479 ) ) ( not ( = ?auto_758475 ?auto_758480 ) ) ( not ( = ?auto_758475 ?auto_758481 ) ) ( not ( = ?auto_758475 ?auto_758482 ) ) ( not ( = ?auto_758475 ?auto_758483 ) ) ( not ( = ?auto_758475 ?auto_758484 ) ) ( not ( = ?auto_758475 ?auto_758485 ) ) ( not ( = ?auto_758476 ?auto_758477 ) ) ( not ( = ?auto_758476 ?auto_758478 ) ) ( not ( = ?auto_758476 ?auto_758479 ) ) ( not ( = ?auto_758476 ?auto_758480 ) ) ( not ( = ?auto_758476 ?auto_758481 ) ) ( not ( = ?auto_758476 ?auto_758482 ) ) ( not ( = ?auto_758476 ?auto_758483 ) ) ( not ( = ?auto_758476 ?auto_758484 ) ) ( not ( = ?auto_758476 ?auto_758485 ) ) ( not ( = ?auto_758477 ?auto_758478 ) ) ( not ( = ?auto_758477 ?auto_758479 ) ) ( not ( = ?auto_758477 ?auto_758480 ) ) ( not ( = ?auto_758477 ?auto_758481 ) ) ( not ( = ?auto_758477 ?auto_758482 ) ) ( not ( = ?auto_758477 ?auto_758483 ) ) ( not ( = ?auto_758477 ?auto_758484 ) ) ( not ( = ?auto_758477 ?auto_758485 ) ) ( not ( = ?auto_758478 ?auto_758479 ) ) ( not ( = ?auto_758478 ?auto_758480 ) ) ( not ( = ?auto_758478 ?auto_758481 ) ) ( not ( = ?auto_758478 ?auto_758482 ) ) ( not ( = ?auto_758478 ?auto_758483 ) ) ( not ( = ?auto_758478 ?auto_758484 ) ) ( not ( = ?auto_758478 ?auto_758485 ) ) ( not ( = ?auto_758479 ?auto_758480 ) ) ( not ( = ?auto_758479 ?auto_758481 ) ) ( not ( = ?auto_758479 ?auto_758482 ) ) ( not ( = ?auto_758479 ?auto_758483 ) ) ( not ( = ?auto_758479 ?auto_758484 ) ) ( not ( = ?auto_758479 ?auto_758485 ) ) ( not ( = ?auto_758480 ?auto_758481 ) ) ( not ( = ?auto_758480 ?auto_758482 ) ) ( not ( = ?auto_758480 ?auto_758483 ) ) ( not ( = ?auto_758480 ?auto_758484 ) ) ( not ( = ?auto_758480 ?auto_758485 ) ) ( not ( = ?auto_758481 ?auto_758482 ) ) ( not ( = ?auto_758481 ?auto_758483 ) ) ( not ( = ?auto_758481 ?auto_758484 ) ) ( not ( = ?auto_758481 ?auto_758485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758482 ?auto_758483 ?auto_758484 )
      ( MAKE-9CRATE-VERIFY ?auto_758475 ?auto_758476 ?auto_758477 ?auto_758478 ?auto_758479 ?auto_758480 ?auto_758481 ?auto_758482 ?auto_758483 ?auto_758484 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758584 - SURFACE
      ?auto_758585 - SURFACE
      ?auto_758586 - SURFACE
      ?auto_758587 - SURFACE
      ?auto_758588 - SURFACE
      ?auto_758589 - SURFACE
      ?auto_758590 - SURFACE
      ?auto_758591 - SURFACE
      ?auto_758592 - SURFACE
      ?auto_758593 - SURFACE
    )
    :vars
    (
      ?auto_758596 - HOIST
      ?auto_758598 - PLACE
      ?auto_758595 - PLACE
      ?auto_758599 - HOIST
      ?auto_758597 - SURFACE
      ?auto_758594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758596 ?auto_758598 ) ( IS-CRATE ?auto_758593 ) ( not ( = ?auto_758592 ?auto_758593 ) ) ( not ( = ?auto_758591 ?auto_758592 ) ) ( not ( = ?auto_758591 ?auto_758593 ) ) ( not ( = ?auto_758595 ?auto_758598 ) ) ( HOIST-AT ?auto_758599 ?auto_758595 ) ( not ( = ?auto_758596 ?auto_758599 ) ) ( AVAILABLE ?auto_758599 ) ( SURFACE-AT ?auto_758593 ?auto_758595 ) ( ON ?auto_758593 ?auto_758597 ) ( CLEAR ?auto_758593 ) ( not ( = ?auto_758592 ?auto_758597 ) ) ( not ( = ?auto_758593 ?auto_758597 ) ) ( not ( = ?auto_758591 ?auto_758597 ) ) ( TRUCK-AT ?auto_758594 ?auto_758598 ) ( SURFACE-AT ?auto_758591 ?auto_758598 ) ( CLEAR ?auto_758591 ) ( LIFTING ?auto_758596 ?auto_758592 ) ( IS-CRATE ?auto_758592 ) ( ON ?auto_758585 ?auto_758584 ) ( ON ?auto_758586 ?auto_758585 ) ( ON ?auto_758587 ?auto_758586 ) ( ON ?auto_758588 ?auto_758587 ) ( ON ?auto_758589 ?auto_758588 ) ( ON ?auto_758590 ?auto_758589 ) ( ON ?auto_758591 ?auto_758590 ) ( not ( = ?auto_758584 ?auto_758585 ) ) ( not ( = ?auto_758584 ?auto_758586 ) ) ( not ( = ?auto_758584 ?auto_758587 ) ) ( not ( = ?auto_758584 ?auto_758588 ) ) ( not ( = ?auto_758584 ?auto_758589 ) ) ( not ( = ?auto_758584 ?auto_758590 ) ) ( not ( = ?auto_758584 ?auto_758591 ) ) ( not ( = ?auto_758584 ?auto_758592 ) ) ( not ( = ?auto_758584 ?auto_758593 ) ) ( not ( = ?auto_758584 ?auto_758597 ) ) ( not ( = ?auto_758585 ?auto_758586 ) ) ( not ( = ?auto_758585 ?auto_758587 ) ) ( not ( = ?auto_758585 ?auto_758588 ) ) ( not ( = ?auto_758585 ?auto_758589 ) ) ( not ( = ?auto_758585 ?auto_758590 ) ) ( not ( = ?auto_758585 ?auto_758591 ) ) ( not ( = ?auto_758585 ?auto_758592 ) ) ( not ( = ?auto_758585 ?auto_758593 ) ) ( not ( = ?auto_758585 ?auto_758597 ) ) ( not ( = ?auto_758586 ?auto_758587 ) ) ( not ( = ?auto_758586 ?auto_758588 ) ) ( not ( = ?auto_758586 ?auto_758589 ) ) ( not ( = ?auto_758586 ?auto_758590 ) ) ( not ( = ?auto_758586 ?auto_758591 ) ) ( not ( = ?auto_758586 ?auto_758592 ) ) ( not ( = ?auto_758586 ?auto_758593 ) ) ( not ( = ?auto_758586 ?auto_758597 ) ) ( not ( = ?auto_758587 ?auto_758588 ) ) ( not ( = ?auto_758587 ?auto_758589 ) ) ( not ( = ?auto_758587 ?auto_758590 ) ) ( not ( = ?auto_758587 ?auto_758591 ) ) ( not ( = ?auto_758587 ?auto_758592 ) ) ( not ( = ?auto_758587 ?auto_758593 ) ) ( not ( = ?auto_758587 ?auto_758597 ) ) ( not ( = ?auto_758588 ?auto_758589 ) ) ( not ( = ?auto_758588 ?auto_758590 ) ) ( not ( = ?auto_758588 ?auto_758591 ) ) ( not ( = ?auto_758588 ?auto_758592 ) ) ( not ( = ?auto_758588 ?auto_758593 ) ) ( not ( = ?auto_758588 ?auto_758597 ) ) ( not ( = ?auto_758589 ?auto_758590 ) ) ( not ( = ?auto_758589 ?auto_758591 ) ) ( not ( = ?auto_758589 ?auto_758592 ) ) ( not ( = ?auto_758589 ?auto_758593 ) ) ( not ( = ?auto_758589 ?auto_758597 ) ) ( not ( = ?auto_758590 ?auto_758591 ) ) ( not ( = ?auto_758590 ?auto_758592 ) ) ( not ( = ?auto_758590 ?auto_758593 ) ) ( not ( = ?auto_758590 ?auto_758597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758591 ?auto_758592 ?auto_758593 )
      ( MAKE-9CRATE-VERIFY ?auto_758584 ?auto_758585 ?auto_758586 ?auto_758587 ?auto_758588 ?auto_758589 ?auto_758590 ?auto_758591 ?auto_758592 ?auto_758593 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_758693 - SURFACE
      ?auto_758694 - SURFACE
      ?auto_758695 - SURFACE
      ?auto_758696 - SURFACE
      ?auto_758697 - SURFACE
      ?auto_758698 - SURFACE
      ?auto_758699 - SURFACE
      ?auto_758700 - SURFACE
      ?auto_758701 - SURFACE
      ?auto_758702 - SURFACE
    )
    :vars
    (
      ?auto_758706 - HOIST
      ?auto_758707 - PLACE
      ?auto_758704 - PLACE
      ?auto_758708 - HOIST
      ?auto_758705 - SURFACE
      ?auto_758703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_758706 ?auto_758707 ) ( IS-CRATE ?auto_758702 ) ( not ( = ?auto_758701 ?auto_758702 ) ) ( not ( = ?auto_758700 ?auto_758701 ) ) ( not ( = ?auto_758700 ?auto_758702 ) ) ( not ( = ?auto_758704 ?auto_758707 ) ) ( HOIST-AT ?auto_758708 ?auto_758704 ) ( not ( = ?auto_758706 ?auto_758708 ) ) ( AVAILABLE ?auto_758708 ) ( SURFACE-AT ?auto_758702 ?auto_758704 ) ( ON ?auto_758702 ?auto_758705 ) ( CLEAR ?auto_758702 ) ( not ( = ?auto_758701 ?auto_758705 ) ) ( not ( = ?auto_758702 ?auto_758705 ) ) ( not ( = ?auto_758700 ?auto_758705 ) ) ( TRUCK-AT ?auto_758703 ?auto_758707 ) ( SURFACE-AT ?auto_758700 ?auto_758707 ) ( CLEAR ?auto_758700 ) ( IS-CRATE ?auto_758701 ) ( AVAILABLE ?auto_758706 ) ( IN ?auto_758701 ?auto_758703 ) ( ON ?auto_758694 ?auto_758693 ) ( ON ?auto_758695 ?auto_758694 ) ( ON ?auto_758696 ?auto_758695 ) ( ON ?auto_758697 ?auto_758696 ) ( ON ?auto_758698 ?auto_758697 ) ( ON ?auto_758699 ?auto_758698 ) ( ON ?auto_758700 ?auto_758699 ) ( not ( = ?auto_758693 ?auto_758694 ) ) ( not ( = ?auto_758693 ?auto_758695 ) ) ( not ( = ?auto_758693 ?auto_758696 ) ) ( not ( = ?auto_758693 ?auto_758697 ) ) ( not ( = ?auto_758693 ?auto_758698 ) ) ( not ( = ?auto_758693 ?auto_758699 ) ) ( not ( = ?auto_758693 ?auto_758700 ) ) ( not ( = ?auto_758693 ?auto_758701 ) ) ( not ( = ?auto_758693 ?auto_758702 ) ) ( not ( = ?auto_758693 ?auto_758705 ) ) ( not ( = ?auto_758694 ?auto_758695 ) ) ( not ( = ?auto_758694 ?auto_758696 ) ) ( not ( = ?auto_758694 ?auto_758697 ) ) ( not ( = ?auto_758694 ?auto_758698 ) ) ( not ( = ?auto_758694 ?auto_758699 ) ) ( not ( = ?auto_758694 ?auto_758700 ) ) ( not ( = ?auto_758694 ?auto_758701 ) ) ( not ( = ?auto_758694 ?auto_758702 ) ) ( not ( = ?auto_758694 ?auto_758705 ) ) ( not ( = ?auto_758695 ?auto_758696 ) ) ( not ( = ?auto_758695 ?auto_758697 ) ) ( not ( = ?auto_758695 ?auto_758698 ) ) ( not ( = ?auto_758695 ?auto_758699 ) ) ( not ( = ?auto_758695 ?auto_758700 ) ) ( not ( = ?auto_758695 ?auto_758701 ) ) ( not ( = ?auto_758695 ?auto_758702 ) ) ( not ( = ?auto_758695 ?auto_758705 ) ) ( not ( = ?auto_758696 ?auto_758697 ) ) ( not ( = ?auto_758696 ?auto_758698 ) ) ( not ( = ?auto_758696 ?auto_758699 ) ) ( not ( = ?auto_758696 ?auto_758700 ) ) ( not ( = ?auto_758696 ?auto_758701 ) ) ( not ( = ?auto_758696 ?auto_758702 ) ) ( not ( = ?auto_758696 ?auto_758705 ) ) ( not ( = ?auto_758697 ?auto_758698 ) ) ( not ( = ?auto_758697 ?auto_758699 ) ) ( not ( = ?auto_758697 ?auto_758700 ) ) ( not ( = ?auto_758697 ?auto_758701 ) ) ( not ( = ?auto_758697 ?auto_758702 ) ) ( not ( = ?auto_758697 ?auto_758705 ) ) ( not ( = ?auto_758698 ?auto_758699 ) ) ( not ( = ?auto_758698 ?auto_758700 ) ) ( not ( = ?auto_758698 ?auto_758701 ) ) ( not ( = ?auto_758698 ?auto_758702 ) ) ( not ( = ?auto_758698 ?auto_758705 ) ) ( not ( = ?auto_758699 ?auto_758700 ) ) ( not ( = ?auto_758699 ?auto_758701 ) ) ( not ( = ?auto_758699 ?auto_758702 ) ) ( not ( = ?auto_758699 ?auto_758705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_758700 ?auto_758701 ?auto_758702 )
      ( MAKE-9CRATE-VERIFY ?auto_758693 ?auto_758694 ?auto_758695 ?auto_758696 ?auto_758697 ?auto_758698 ?auto_758699 ?auto_758700 ?auto_758701 ?auto_758702 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_763051 - SURFACE
      ?auto_763052 - SURFACE
    )
    :vars
    (
      ?auto_763054 - HOIST
      ?auto_763059 - PLACE
      ?auto_763058 - SURFACE
      ?auto_763057 - PLACE
      ?auto_763055 - HOIST
      ?auto_763053 - SURFACE
      ?auto_763056 - TRUCK
      ?auto_763060 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_763054 ?auto_763059 ) ( SURFACE-AT ?auto_763051 ?auto_763059 ) ( CLEAR ?auto_763051 ) ( IS-CRATE ?auto_763052 ) ( not ( = ?auto_763051 ?auto_763052 ) ) ( ON ?auto_763051 ?auto_763058 ) ( not ( = ?auto_763058 ?auto_763051 ) ) ( not ( = ?auto_763058 ?auto_763052 ) ) ( not ( = ?auto_763057 ?auto_763059 ) ) ( HOIST-AT ?auto_763055 ?auto_763057 ) ( not ( = ?auto_763054 ?auto_763055 ) ) ( AVAILABLE ?auto_763055 ) ( SURFACE-AT ?auto_763052 ?auto_763057 ) ( ON ?auto_763052 ?auto_763053 ) ( CLEAR ?auto_763052 ) ( not ( = ?auto_763051 ?auto_763053 ) ) ( not ( = ?auto_763052 ?auto_763053 ) ) ( not ( = ?auto_763058 ?auto_763053 ) ) ( TRUCK-AT ?auto_763056 ?auto_763059 ) ( LIFTING ?auto_763054 ?auto_763060 ) ( IS-CRATE ?auto_763060 ) ( not ( = ?auto_763051 ?auto_763060 ) ) ( not ( = ?auto_763052 ?auto_763060 ) ) ( not ( = ?auto_763058 ?auto_763060 ) ) ( not ( = ?auto_763053 ?auto_763060 ) ) )
    :subtasks
    ( ( !LOAD ?auto_763054 ?auto_763060 ?auto_763056 ?auto_763059 )
      ( MAKE-1CRATE ?auto_763051 ?auto_763052 )
      ( MAKE-1CRATE-VERIFY ?auto_763051 ?auto_763052 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764247 - SURFACE
      ?auto_764248 - SURFACE
      ?auto_764249 - SURFACE
      ?auto_764250 - SURFACE
      ?auto_764251 - SURFACE
      ?auto_764252 - SURFACE
      ?auto_764253 - SURFACE
      ?auto_764254 - SURFACE
      ?auto_764255 - SURFACE
      ?auto_764256 - SURFACE
      ?auto_764257 - SURFACE
    )
    :vars
    (
      ?auto_764259 - HOIST
      ?auto_764258 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_764259 ?auto_764258 ) ( SURFACE-AT ?auto_764256 ?auto_764258 ) ( CLEAR ?auto_764256 ) ( LIFTING ?auto_764259 ?auto_764257 ) ( IS-CRATE ?auto_764257 ) ( not ( = ?auto_764256 ?auto_764257 ) ) ( ON ?auto_764248 ?auto_764247 ) ( ON ?auto_764249 ?auto_764248 ) ( ON ?auto_764250 ?auto_764249 ) ( ON ?auto_764251 ?auto_764250 ) ( ON ?auto_764252 ?auto_764251 ) ( ON ?auto_764253 ?auto_764252 ) ( ON ?auto_764254 ?auto_764253 ) ( ON ?auto_764255 ?auto_764254 ) ( ON ?auto_764256 ?auto_764255 ) ( not ( = ?auto_764247 ?auto_764248 ) ) ( not ( = ?auto_764247 ?auto_764249 ) ) ( not ( = ?auto_764247 ?auto_764250 ) ) ( not ( = ?auto_764247 ?auto_764251 ) ) ( not ( = ?auto_764247 ?auto_764252 ) ) ( not ( = ?auto_764247 ?auto_764253 ) ) ( not ( = ?auto_764247 ?auto_764254 ) ) ( not ( = ?auto_764247 ?auto_764255 ) ) ( not ( = ?auto_764247 ?auto_764256 ) ) ( not ( = ?auto_764247 ?auto_764257 ) ) ( not ( = ?auto_764248 ?auto_764249 ) ) ( not ( = ?auto_764248 ?auto_764250 ) ) ( not ( = ?auto_764248 ?auto_764251 ) ) ( not ( = ?auto_764248 ?auto_764252 ) ) ( not ( = ?auto_764248 ?auto_764253 ) ) ( not ( = ?auto_764248 ?auto_764254 ) ) ( not ( = ?auto_764248 ?auto_764255 ) ) ( not ( = ?auto_764248 ?auto_764256 ) ) ( not ( = ?auto_764248 ?auto_764257 ) ) ( not ( = ?auto_764249 ?auto_764250 ) ) ( not ( = ?auto_764249 ?auto_764251 ) ) ( not ( = ?auto_764249 ?auto_764252 ) ) ( not ( = ?auto_764249 ?auto_764253 ) ) ( not ( = ?auto_764249 ?auto_764254 ) ) ( not ( = ?auto_764249 ?auto_764255 ) ) ( not ( = ?auto_764249 ?auto_764256 ) ) ( not ( = ?auto_764249 ?auto_764257 ) ) ( not ( = ?auto_764250 ?auto_764251 ) ) ( not ( = ?auto_764250 ?auto_764252 ) ) ( not ( = ?auto_764250 ?auto_764253 ) ) ( not ( = ?auto_764250 ?auto_764254 ) ) ( not ( = ?auto_764250 ?auto_764255 ) ) ( not ( = ?auto_764250 ?auto_764256 ) ) ( not ( = ?auto_764250 ?auto_764257 ) ) ( not ( = ?auto_764251 ?auto_764252 ) ) ( not ( = ?auto_764251 ?auto_764253 ) ) ( not ( = ?auto_764251 ?auto_764254 ) ) ( not ( = ?auto_764251 ?auto_764255 ) ) ( not ( = ?auto_764251 ?auto_764256 ) ) ( not ( = ?auto_764251 ?auto_764257 ) ) ( not ( = ?auto_764252 ?auto_764253 ) ) ( not ( = ?auto_764252 ?auto_764254 ) ) ( not ( = ?auto_764252 ?auto_764255 ) ) ( not ( = ?auto_764252 ?auto_764256 ) ) ( not ( = ?auto_764252 ?auto_764257 ) ) ( not ( = ?auto_764253 ?auto_764254 ) ) ( not ( = ?auto_764253 ?auto_764255 ) ) ( not ( = ?auto_764253 ?auto_764256 ) ) ( not ( = ?auto_764253 ?auto_764257 ) ) ( not ( = ?auto_764254 ?auto_764255 ) ) ( not ( = ?auto_764254 ?auto_764256 ) ) ( not ( = ?auto_764254 ?auto_764257 ) ) ( not ( = ?auto_764255 ?auto_764256 ) ) ( not ( = ?auto_764255 ?auto_764257 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_764256 ?auto_764257 )
      ( MAKE-10CRATE-VERIFY ?auto_764247 ?auto_764248 ?auto_764249 ?auto_764250 ?auto_764251 ?auto_764252 ?auto_764253 ?auto_764254 ?auto_764255 ?auto_764256 ?auto_764257 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764341 - SURFACE
      ?auto_764342 - SURFACE
      ?auto_764343 - SURFACE
      ?auto_764344 - SURFACE
      ?auto_764345 - SURFACE
      ?auto_764346 - SURFACE
      ?auto_764347 - SURFACE
      ?auto_764348 - SURFACE
      ?auto_764349 - SURFACE
      ?auto_764350 - SURFACE
      ?auto_764351 - SURFACE
    )
    :vars
    (
      ?auto_764353 - HOIST
      ?auto_764354 - PLACE
      ?auto_764352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764353 ?auto_764354 ) ( SURFACE-AT ?auto_764350 ?auto_764354 ) ( CLEAR ?auto_764350 ) ( IS-CRATE ?auto_764351 ) ( not ( = ?auto_764350 ?auto_764351 ) ) ( TRUCK-AT ?auto_764352 ?auto_764354 ) ( AVAILABLE ?auto_764353 ) ( IN ?auto_764351 ?auto_764352 ) ( ON ?auto_764350 ?auto_764349 ) ( not ( = ?auto_764349 ?auto_764350 ) ) ( not ( = ?auto_764349 ?auto_764351 ) ) ( ON ?auto_764342 ?auto_764341 ) ( ON ?auto_764343 ?auto_764342 ) ( ON ?auto_764344 ?auto_764343 ) ( ON ?auto_764345 ?auto_764344 ) ( ON ?auto_764346 ?auto_764345 ) ( ON ?auto_764347 ?auto_764346 ) ( ON ?auto_764348 ?auto_764347 ) ( ON ?auto_764349 ?auto_764348 ) ( not ( = ?auto_764341 ?auto_764342 ) ) ( not ( = ?auto_764341 ?auto_764343 ) ) ( not ( = ?auto_764341 ?auto_764344 ) ) ( not ( = ?auto_764341 ?auto_764345 ) ) ( not ( = ?auto_764341 ?auto_764346 ) ) ( not ( = ?auto_764341 ?auto_764347 ) ) ( not ( = ?auto_764341 ?auto_764348 ) ) ( not ( = ?auto_764341 ?auto_764349 ) ) ( not ( = ?auto_764341 ?auto_764350 ) ) ( not ( = ?auto_764341 ?auto_764351 ) ) ( not ( = ?auto_764342 ?auto_764343 ) ) ( not ( = ?auto_764342 ?auto_764344 ) ) ( not ( = ?auto_764342 ?auto_764345 ) ) ( not ( = ?auto_764342 ?auto_764346 ) ) ( not ( = ?auto_764342 ?auto_764347 ) ) ( not ( = ?auto_764342 ?auto_764348 ) ) ( not ( = ?auto_764342 ?auto_764349 ) ) ( not ( = ?auto_764342 ?auto_764350 ) ) ( not ( = ?auto_764342 ?auto_764351 ) ) ( not ( = ?auto_764343 ?auto_764344 ) ) ( not ( = ?auto_764343 ?auto_764345 ) ) ( not ( = ?auto_764343 ?auto_764346 ) ) ( not ( = ?auto_764343 ?auto_764347 ) ) ( not ( = ?auto_764343 ?auto_764348 ) ) ( not ( = ?auto_764343 ?auto_764349 ) ) ( not ( = ?auto_764343 ?auto_764350 ) ) ( not ( = ?auto_764343 ?auto_764351 ) ) ( not ( = ?auto_764344 ?auto_764345 ) ) ( not ( = ?auto_764344 ?auto_764346 ) ) ( not ( = ?auto_764344 ?auto_764347 ) ) ( not ( = ?auto_764344 ?auto_764348 ) ) ( not ( = ?auto_764344 ?auto_764349 ) ) ( not ( = ?auto_764344 ?auto_764350 ) ) ( not ( = ?auto_764344 ?auto_764351 ) ) ( not ( = ?auto_764345 ?auto_764346 ) ) ( not ( = ?auto_764345 ?auto_764347 ) ) ( not ( = ?auto_764345 ?auto_764348 ) ) ( not ( = ?auto_764345 ?auto_764349 ) ) ( not ( = ?auto_764345 ?auto_764350 ) ) ( not ( = ?auto_764345 ?auto_764351 ) ) ( not ( = ?auto_764346 ?auto_764347 ) ) ( not ( = ?auto_764346 ?auto_764348 ) ) ( not ( = ?auto_764346 ?auto_764349 ) ) ( not ( = ?auto_764346 ?auto_764350 ) ) ( not ( = ?auto_764346 ?auto_764351 ) ) ( not ( = ?auto_764347 ?auto_764348 ) ) ( not ( = ?auto_764347 ?auto_764349 ) ) ( not ( = ?auto_764347 ?auto_764350 ) ) ( not ( = ?auto_764347 ?auto_764351 ) ) ( not ( = ?auto_764348 ?auto_764349 ) ) ( not ( = ?auto_764348 ?auto_764350 ) ) ( not ( = ?auto_764348 ?auto_764351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764349 ?auto_764350 ?auto_764351 )
      ( MAKE-10CRATE-VERIFY ?auto_764341 ?auto_764342 ?auto_764343 ?auto_764344 ?auto_764345 ?auto_764346 ?auto_764347 ?auto_764348 ?auto_764349 ?auto_764350 ?auto_764351 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764446 - SURFACE
      ?auto_764447 - SURFACE
      ?auto_764448 - SURFACE
      ?auto_764449 - SURFACE
      ?auto_764450 - SURFACE
      ?auto_764451 - SURFACE
      ?auto_764452 - SURFACE
      ?auto_764453 - SURFACE
      ?auto_764454 - SURFACE
      ?auto_764455 - SURFACE
      ?auto_764456 - SURFACE
    )
    :vars
    (
      ?auto_764458 - HOIST
      ?auto_764460 - PLACE
      ?auto_764457 - TRUCK
      ?auto_764459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_764458 ?auto_764460 ) ( SURFACE-AT ?auto_764455 ?auto_764460 ) ( CLEAR ?auto_764455 ) ( IS-CRATE ?auto_764456 ) ( not ( = ?auto_764455 ?auto_764456 ) ) ( AVAILABLE ?auto_764458 ) ( IN ?auto_764456 ?auto_764457 ) ( ON ?auto_764455 ?auto_764454 ) ( not ( = ?auto_764454 ?auto_764455 ) ) ( not ( = ?auto_764454 ?auto_764456 ) ) ( TRUCK-AT ?auto_764457 ?auto_764459 ) ( not ( = ?auto_764459 ?auto_764460 ) ) ( ON ?auto_764447 ?auto_764446 ) ( ON ?auto_764448 ?auto_764447 ) ( ON ?auto_764449 ?auto_764448 ) ( ON ?auto_764450 ?auto_764449 ) ( ON ?auto_764451 ?auto_764450 ) ( ON ?auto_764452 ?auto_764451 ) ( ON ?auto_764453 ?auto_764452 ) ( ON ?auto_764454 ?auto_764453 ) ( not ( = ?auto_764446 ?auto_764447 ) ) ( not ( = ?auto_764446 ?auto_764448 ) ) ( not ( = ?auto_764446 ?auto_764449 ) ) ( not ( = ?auto_764446 ?auto_764450 ) ) ( not ( = ?auto_764446 ?auto_764451 ) ) ( not ( = ?auto_764446 ?auto_764452 ) ) ( not ( = ?auto_764446 ?auto_764453 ) ) ( not ( = ?auto_764446 ?auto_764454 ) ) ( not ( = ?auto_764446 ?auto_764455 ) ) ( not ( = ?auto_764446 ?auto_764456 ) ) ( not ( = ?auto_764447 ?auto_764448 ) ) ( not ( = ?auto_764447 ?auto_764449 ) ) ( not ( = ?auto_764447 ?auto_764450 ) ) ( not ( = ?auto_764447 ?auto_764451 ) ) ( not ( = ?auto_764447 ?auto_764452 ) ) ( not ( = ?auto_764447 ?auto_764453 ) ) ( not ( = ?auto_764447 ?auto_764454 ) ) ( not ( = ?auto_764447 ?auto_764455 ) ) ( not ( = ?auto_764447 ?auto_764456 ) ) ( not ( = ?auto_764448 ?auto_764449 ) ) ( not ( = ?auto_764448 ?auto_764450 ) ) ( not ( = ?auto_764448 ?auto_764451 ) ) ( not ( = ?auto_764448 ?auto_764452 ) ) ( not ( = ?auto_764448 ?auto_764453 ) ) ( not ( = ?auto_764448 ?auto_764454 ) ) ( not ( = ?auto_764448 ?auto_764455 ) ) ( not ( = ?auto_764448 ?auto_764456 ) ) ( not ( = ?auto_764449 ?auto_764450 ) ) ( not ( = ?auto_764449 ?auto_764451 ) ) ( not ( = ?auto_764449 ?auto_764452 ) ) ( not ( = ?auto_764449 ?auto_764453 ) ) ( not ( = ?auto_764449 ?auto_764454 ) ) ( not ( = ?auto_764449 ?auto_764455 ) ) ( not ( = ?auto_764449 ?auto_764456 ) ) ( not ( = ?auto_764450 ?auto_764451 ) ) ( not ( = ?auto_764450 ?auto_764452 ) ) ( not ( = ?auto_764450 ?auto_764453 ) ) ( not ( = ?auto_764450 ?auto_764454 ) ) ( not ( = ?auto_764450 ?auto_764455 ) ) ( not ( = ?auto_764450 ?auto_764456 ) ) ( not ( = ?auto_764451 ?auto_764452 ) ) ( not ( = ?auto_764451 ?auto_764453 ) ) ( not ( = ?auto_764451 ?auto_764454 ) ) ( not ( = ?auto_764451 ?auto_764455 ) ) ( not ( = ?auto_764451 ?auto_764456 ) ) ( not ( = ?auto_764452 ?auto_764453 ) ) ( not ( = ?auto_764452 ?auto_764454 ) ) ( not ( = ?auto_764452 ?auto_764455 ) ) ( not ( = ?auto_764452 ?auto_764456 ) ) ( not ( = ?auto_764453 ?auto_764454 ) ) ( not ( = ?auto_764453 ?auto_764455 ) ) ( not ( = ?auto_764453 ?auto_764456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764454 ?auto_764455 ?auto_764456 )
      ( MAKE-10CRATE-VERIFY ?auto_764446 ?auto_764447 ?auto_764448 ?auto_764449 ?auto_764450 ?auto_764451 ?auto_764452 ?auto_764453 ?auto_764454 ?auto_764455 ?auto_764456 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764561 - SURFACE
      ?auto_764562 - SURFACE
      ?auto_764563 - SURFACE
      ?auto_764564 - SURFACE
      ?auto_764565 - SURFACE
      ?auto_764566 - SURFACE
      ?auto_764567 - SURFACE
      ?auto_764568 - SURFACE
      ?auto_764569 - SURFACE
      ?auto_764570 - SURFACE
      ?auto_764571 - SURFACE
    )
    :vars
    (
      ?auto_764573 - HOIST
      ?auto_764575 - PLACE
      ?auto_764572 - TRUCK
      ?auto_764576 - PLACE
      ?auto_764574 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_764573 ?auto_764575 ) ( SURFACE-AT ?auto_764570 ?auto_764575 ) ( CLEAR ?auto_764570 ) ( IS-CRATE ?auto_764571 ) ( not ( = ?auto_764570 ?auto_764571 ) ) ( AVAILABLE ?auto_764573 ) ( ON ?auto_764570 ?auto_764569 ) ( not ( = ?auto_764569 ?auto_764570 ) ) ( not ( = ?auto_764569 ?auto_764571 ) ) ( TRUCK-AT ?auto_764572 ?auto_764576 ) ( not ( = ?auto_764576 ?auto_764575 ) ) ( HOIST-AT ?auto_764574 ?auto_764576 ) ( LIFTING ?auto_764574 ?auto_764571 ) ( not ( = ?auto_764573 ?auto_764574 ) ) ( ON ?auto_764562 ?auto_764561 ) ( ON ?auto_764563 ?auto_764562 ) ( ON ?auto_764564 ?auto_764563 ) ( ON ?auto_764565 ?auto_764564 ) ( ON ?auto_764566 ?auto_764565 ) ( ON ?auto_764567 ?auto_764566 ) ( ON ?auto_764568 ?auto_764567 ) ( ON ?auto_764569 ?auto_764568 ) ( not ( = ?auto_764561 ?auto_764562 ) ) ( not ( = ?auto_764561 ?auto_764563 ) ) ( not ( = ?auto_764561 ?auto_764564 ) ) ( not ( = ?auto_764561 ?auto_764565 ) ) ( not ( = ?auto_764561 ?auto_764566 ) ) ( not ( = ?auto_764561 ?auto_764567 ) ) ( not ( = ?auto_764561 ?auto_764568 ) ) ( not ( = ?auto_764561 ?auto_764569 ) ) ( not ( = ?auto_764561 ?auto_764570 ) ) ( not ( = ?auto_764561 ?auto_764571 ) ) ( not ( = ?auto_764562 ?auto_764563 ) ) ( not ( = ?auto_764562 ?auto_764564 ) ) ( not ( = ?auto_764562 ?auto_764565 ) ) ( not ( = ?auto_764562 ?auto_764566 ) ) ( not ( = ?auto_764562 ?auto_764567 ) ) ( not ( = ?auto_764562 ?auto_764568 ) ) ( not ( = ?auto_764562 ?auto_764569 ) ) ( not ( = ?auto_764562 ?auto_764570 ) ) ( not ( = ?auto_764562 ?auto_764571 ) ) ( not ( = ?auto_764563 ?auto_764564 ) ) ( not ( = ?auto_764563 ?auto_764565 ) ) ( not ( = ?auto_764563 ?auto_764566 ) ) ( not ( = ?auto_764563 ?auto_764567 ) ) ( not ( = ?auto_764563 ?auto_764568 ) ) ( not ( = ?auto_764563 ?auto_764569 ) ) ( not ( = ?auto_764563 ?auto_764570 ) ) ( not ( = ?auto_764563 ?auto_764571 ) ) ( not ( = ?auto_764564 ?auto_764565 ) ) ( not ( = ?auto_764564 ?auto_764566 ) ) ( not ( = ?auto_764564 ?auto_764567 ) ) ( not ( = ?auto_764564 ?auto_764568 ) ) ( not ( = ?auto_764564 ?auto_764569 ) ) ( not ( = ?auto_764564 ?auto_764570 ) ) ( not ( = ?auto_764564 ?auto_764571 ) ) ( not ( = ?auto_764565 ?auto_764566 ) ) ( not ( = ?auto_764565 ?auto_764567 ) ) ( not ( = ?auto_764565 ?auto_764568 ) ) ( not ( = ?auto_764565 ?auto_764569 ) ) ( not ( = ?auto_764565 ?auto_764570 ) ) ( not ( = ?auto_764565 ?auto_764571 ) ) ( not ( = ?auto_764566 ?auto_764567 ) ) ( not ( = ?auto_764566 ?auto_764568 ) ) ( not ( = ?auto_764566 ?auto_764569 ) ) ( not ( = ?auto_764566 ?auto_764570 ) ) ( not ( = ?auto_764566 ?auto_764571 ) ) ( not ( = ?auto_764567 ?auto_764568 ) ) ( not ( = ?auto_764567 ?auto_764569 ) ) ( not ( = ?auto_764567 ?auto_764570 ) ) ( not ( = ?auto_764567 ?auto_764571 ) ) ( not ( = ?auto_764568 ?auto_764569 ) ) ( not ( = ?auto_764568 ?auto_764570 ) ) ( not ( = ?auto_764568 ?auto_764571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764569 ?auto_764570 ?auto_764571 )
      ( MAKE-10CRATE-VERIFY ?auto_764561 ?auto_764562 ?auto_764563 ?auto_764564 ?auto_764565 ?auto_764566 ?auto_764567 ?auto_764568 ?auto_764569 ?auto_764570 ?auto_764571 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764686 - SURFACE
      ?auto_764687 - SURFACE
      ?auto_764688 - SURFACE
      ?auto_764689 - SURFACE
      ?auto_764690 - SURFACE
      ?auto_764691 - SURFACE
      ?auto_764692 - SURFACE
      ?auto_764693 - SURFACE
      ?auto_764694 - SURFACE
      ?auto_764695 - SURFACE
      ?auto_764696 - SURFACE
    )
    :vars
    (
      ?auto_764699 - HOIST
      ?auto_764698 - PLACE
      ?auto_764702 - TRUCK
      ?auto_764697 - PLACE
      ?auto_764701 - HOIST
      ?auto_764700 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_764699 ?auto_764698 ) ( SURFACE-AT ?auto_764695 ?auto_764698 ) ( CLEAR ?auto_764695 ) ( IS-CRATE ?auto_764696 ) ( not ( = ?auto_764695 ?auto_764696 ) ) ( AVAILABLE ?auto_764699 ) ( ON ?auto_764695 ?auto_764694 ) ( not ( = ?auto_764694 ?auto_764695 ) ) ( not ( = ?auto_764694 ?auto_764696 ) ) ( TRUCK-AT ?auto_764702 ?auto_764697 ) ( not ( = ?auto_764697 ?auto_764698 ) ) ( HOIST-AT ?auto_764701 ?auto_764697 ) ( not ( = ?auto_764699 ?auto_764701 ) ) ( AVAILABLE ?auto_764701 ) ( SURFACE-AT ?auto_764696 ?auto_764697 ) ( ON ?auto_764696 ?auto_764700 ) ( CLEAR ?auto_764696 ) ( not ( = ?auto_764695 ?auto_764700 ) ) ( not ( = ?auto_764696 ?auto_764700 ) ) ( not ( = ?auto_764694 ?auto_764700 ) ) ( ON ?auto_764687 ?auto_764686 ) ( ON ?auto_764688 ?auto_764687 ) ( ON ?auto_764689 ?auto_764688 ) ( ON ?auto_764690 ?auto_764689 ) ( ON ?auto_764691 ?auto_764690 ) ( ON ?auto_764692 ?auto_764691 ) ( ON ?auto_764693 ?auto_764692 ) ( ON ?auto_764694 ?auto_764693 ) ( not ( = ?auto_764686 ?auto_764687 ) ) ( not ( = ?auto_764686 ?auto_764688 ) ) ( not ( = ?auto_764686 ?auto_764689 ) ) ( not ( = ?auto_764686 ?auto_764690 ) ) ( not ( = ?auto_764686 ?auto_764691 ) ) ( not ( = ?auto_764686 ?auto_764692 ) ) ( not ( = ?auto_764686 ?auto_764693 ) ) ( not ( = ?auto_764686 ?auto_764694 ) ) ( not ( = ?auto_764686 ?auto_764695 ) ) ( not ( = ?auto_764686 ?auto_764696 ) ) ( not ( = ?auto_764686 ?auto_764700 ) ) ( not ( = ?auto_764687 ?auto_764688 ) ) ( not ( = ?auto_764687 ?auto_764689 ) ) ( not ( = ?auto_764687 ?auto_764690 ) ) ( not ( = ?auto_764687 ?auto_764691 ) ) ( not ( = ?auto_764687 ?auto_764692 ) ) ( not ( = ?auto_764687 ?auto_764693 ) ) ( not ( = ?auto_764687 ?auto_764694 ) ) ( not ( = ?auto_764687 ?auto_764695 ) ) ( not ( = ?auto_764687 ?auto_764696 ) ) ( not ( = ?auto_764687 ?auto_764700 ) ) ( not ( = ?auto_764688 ?auto_764689 ) ) ( not ( = ?auto_764688 ?auto_764690 ) ) ( not ( = ?auto_764688 ?auto_764691 ) ) ( not ( = ?auto_764688 ?auto_764692 ) ) ( not ( = ?auto_764688 ?auto_764693 ) ) ( not ( = ?auto_764688 ?auto_764694 ) ) ( not ( = ?auto_764688 ?auto_764695 ) ) ( not ( = ?auto_764688 ?auto_764696 ) ) ( not ( = ?auto_764688 ?auto_764700 ) ) ( not ( = ?auto_764689 ?auto_764690 ) ) ( not ( = ?auto_764689 ?auto_764691 ) ) ( not ( = ?auto_764689 ?auto_764692 ) ) ( not ( = ?auto_764689 ?auto_764693 ) ) ( not ( = ?auto_764689 ?auto_764694 ) ) ( not ( = ?auto_764689 ?auto_764695 ) ) ( not ( = ?auto_764689 ?auto_764696 ) ) ( not ( = ?auto_764689 ?auto_764700 ) ) ( not ( = ?auto_764690 ?auto_764691 ) ) ( not ( = ?auto_764690 ?auto_764692 ) ) ( not ( = ?auto_764690 ?auto_764693 ) ) ( not ( = ?auto_764690 ?auto_764694 ) ) ( not ( = ?auto_764690 ?auto_764695 ) ) ( not ( = ?auto_764690 ?auto_764696 ) ) ( not ( = ?auto_764690 ?auto_764700 ) ) ( not ( = ?auto_764691 ?auto_764692 ) ) ( not ( = ?auto_764691 ?auto_764693 ) ) ( not ( = ?auto_764691 ?auto_764694 ) ) ( not ( = ?auto_764691 ?auto_764695 ) ) ( not ( = ?auto_764691 ?auto_764696 ) ) ( not ( = ?auto_764691 ?auto_764700 ) ) ( not ( = ?auto_764692 ?auto_764693 ) ) ( not ( = ?auto_764692 ?auto_764694 ) ) ( not ( = ?auto_764692 ?auto_764695 ) ) ( not ( = ?auto_764692 ?auto_764696 ) ) ( not ( = ?auto_764692 ?auto_764700 ) ) ( not ( = ?auto_764693 ?auto_764694 ) ) ( not ( = ?auto_764693 ?auto_764695 ) ) ( not ( = ?auto_764693 ?auto_764696 ) ) ( not ( = ?auto_764693 ?auto_764700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764694 ?auto_764695 ?auto_764696 )
      ( MAKE-10CRATE-VERIFY ?auto_764686 ?auto_764687 ?auto_764688 ?auto_764689 ?auto_764690 ?auto_764691 ?auto_764692 ?auto_764693 ?auto_764694 ?auto_764695 ?auto_764696 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764812 - SURFACE
      ?auto_764813 - SURFACE
      ?auto_764814 - SURFACE
      ?auto_764815 - SURFACE
      ?auto_764816 - SURFACE
      ?auto_764817 - SURFACE
      ?auto_764818 - SURFACE
      ?auto_764819 - SURFACE
      ?auto_764820 - SURFACE
      ?auto_764821 - SURFACE
      ?auto_764822 - SURFACE
    )
    :vars
    (
      ?auto_764824 - HOIST
      ?auto_764827 - PLACE
      ?auto_764825 - PLACE
      ?auto_764828 - HOIST
      ?auto_764826 - SURFACE
      ?auto_764823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764824 ?auto_764827 ) ( SURFACE-AT ?auto_764821 ?auto_764827 ) ( CLEAR ?auto_764821 ) ( IS-CRATE ?auto_764822 ) ( not ( = ?auto_764821 ?auto_764822 ) ) ( AVAILABLE ?auto_764824 ) ( ON ?auto_764821 ?auto_764820 ) ( not ( = ?auto_764820 ?auto_764821 ) ) ( not ( = ?auto_764820 ?auto_764822 ) ) ( not ( = ?auto_764825 ?auto_764827 ) ) ( HOIST-AT ?auto_764828 ?auto_764825 ) ( not ( = ?auto_764824 ?auto_764828 ) ) ( AVAILABLE ?auto_764828 ) ( SURFACE-AT ?auto_764822 ?auto_764825 ) ( ON ?auto_764822 ?auto_764826 ) ( CLEAR ?auto_764822 ) ( not ( = ?auto_764821 ?auto_764826 ) ) ( not ( = ?auto_764822 ?auto_764826 ) ) ( not ( = ?auto_764820 ?auto_764826 ) ) ( TRUCK-AT ?auto_764823 ?auto_764827 ) ( ON ?auto_764813 ?auto_764812 ) ( ON ?auto_764814 ?auto_764813 ) ( ON ?auto_764815 ?auto_764814 ) ( ON ?auto_764816 ?auto_764815 ) ( ON ?auto_764817 ?auto_764816 ) ( ON ?auto_764818 ?auto_764817 ) ( ON ?auto_764819 ?auto_764818 ) ( ON ?auto_764820 ?auto_764819 ) ( not ( = ?auto_764812 ?auto_764813 ) ) ( not ( = ?auto_764812 ?auto_764814 ) ) ( not ( = ?auto_764812 ?auto_764815 ) ) ( not ( = ?auto_764812 ?auto_764816 ) ) ( not ( = ?auto_764812 ?auto_764817 ) ) ( not ( = ?auto_764812 ?auto_764818 ) ) ( not ( = ?auto_764812 ?auto_764819 ) ) ( not ( = ?auto_764812 ?auto_764820 ) ) ( not ( = ?auto_764812 ?auto_764821 ) ) ( not ( = ?auto_764812 ?auto_764822 ) ) ( not ( = ?auto_764812 ?auto_764826 ) ) ( not ( = ?auto_764813 ?auto_764814 ) ) ( not ( = ?auto_764813 ?auto_764815 ) ) ( not ( = ?auto_764813 ?auto_764816 ) ) ( not ( = ?auto_764813 ?auto_764817 ) ) ( not ( = ?auto_764813 ?auto_764818 ) ) ( not ( = ?auto_764813 ?auto_764819 ) ) ( not ( = ?auto_764813 ?auto_764820 ) ) ( not ( = ?auto_764813 ?auto_764821 ) ) ( not ( = ?auto_764813 ?auto_764822 ) ) ( not ( = ?auto_764813 ?auto_764826 ) ) ( not ( = ?auto_764814 ?auto_764815 ) ) ( not ( = ?auto_764814 ?auto_764816 ) ) ( not ( = ?auto_764814 ?auto_764817 ) ) ( not ( = ?auto_764814 ?auto_764818 ) ) ( not ( = ?auto_764814 ?auto_764819 ) ) ( not ( = ?auto_764814 ?auto_764820 ) ) ( not ( = ?auto_764814 ?auto_764821 ) ) ( not ( = ?auto_764814 ?auto_764822 ) ) ( not ( = ?auto_764814 ?auto_764826 ) ) ( not ( = ?auto_764815 ?auto_764816 ) ) ( not ( = ?auto_764815 ?auto_764817 ) ) ( not ( = ?auto_764815 ?auto_764818 ) ) ( not ( = ?auto_764815 ?auto_764819 ) ) ( not ( = ?auto_764815 ?auto_764820 ) ) ( not ( = ?auto_764815 ?auto_764821 ) ) ( not ( = ?auto_764815 ?auto_764822 ) ) ( not ( = ?auto_764815 ?auto_764826 ) ) ( not ( = ?auto_764816 ?auto_764817 ) ) ( not ( = ?auto_764816 ?auto_764818 ) ) ( not ( = ?auto_764816 ?auto_764819 ) ) ( not ( = ?auto_764816 ?auto_764820 ) ) ( not ( = ?auto_764816 ?auto_764821 ) ) ( not ( = ?auto_764816 ?auto_764822 ) ) ( not ( = ?auto_764816 ?auto_764826 ) ) ( not ( = ?auto_764817 ?auto_764818 ) ) ( not ( = ?auto_764817 ?auto_764819 ) ) ( not ( = ?auto_764817 ?auto_764820 ) ) ( not ( = ?auto_764817 ?auto_764821 ) ) ( not ( = ?auto_764817 ?auto_764822 ) ) ( not ( = ?auto_764817 ?auto_764826 ) ) ( not ( = ?auto_764818 ?auto_764819 ) ) ( not ( = ?auto_764818 ?auto_764820 ) ) ( not ( = ?auto_764818 ?auto_764821 ) ) ( not ( = ?auto_764818 ?auto_764822 ) ) ( not ( = ?auto_764818 ?auto_764826 ) ) ( not ( = ?auto_764819 ?auto_764820 ) ) ( not ( = ?auto_764819 ?auto_764821 ) ) ( not ( = ?auto_764819 ?auto_764822 ) ) ( not ( = ?auto_764819 ?auto_764826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764820 ?auto_764821 ?auto_764822 )
      ( MAKE-10CRATE-VERIFY ?auto_764812 ?auto_764813 ?auto_764814 ?auto_764815 ?auto_764816 ?auto_764817 ?auto_764818 ?auto_764819 ?auto_764820 ?auto_764821 ?auto_764822 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_764938 - SURFACE
      ?auto_764939 - SURFACE
      ?auto_764940 - SURFACE
      ?auto_764941 - SURFACE
      ?auto_764942 - SURFACE
      ?auto_764943 - SURFACE
      ?auto_764944 - SURFACE
      ?auto_764945 - SURFACE
      ?auto_764946 - SURFACE
      ?auto_764947 - SURFACE
      ?auto_764948 - SURFACE
    )
    :vars
    (
      ?auto_764950 - HOIST
      ?auto_764954 - PLACE
      ?auto_764953 - PLACE
      ?auto_764952 - HOIST
      ?auto_764949 - SURFACE
      ?auto_764951 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_764950 ?auto_764954 ) ( IS-CRATE ?auto_764948 ) ( not ( = ?auto_764947 ?auto_764948 ) ) ( not ( = ?auto_764946 ?auto_764947 ) ) ( not ( = ?auto_764946 ?auto_764948 ) ) ( not ( = ?auto_764953 ?auto_764954 ) ) ( HOIST-AT ?auto_764952 ?auto_764953 ) ( not ( = ?auto_764950 ?auto_764952 ) ) ( AVAILABLE ?auto_764952 ) ( SURFACE-AT ?auto_764948 ?auto_764953 ) ( ON ?auto_764948 ?auto_764949 ) ( CLEAR ?auto_764948 ) ( not ( = ?auto_764947 ?auto_764949 ) ) ( not ( = ?auto_764948 ?auto_764949 ) ) ( not ( = ?auto_764946 ?auto_764949 ) ) ( TRUCK-AT ?auto_764951 ?auto_764954 ) ( SURFACE-AT ?auto_764946 ?auto_764954 ) ( CLEAR ?auto_764946 ) ( LIFTING ?auto_764950 ?auto_764947 ) ( IS-CRATE ?auto_764947 ) ( ON ?auto_764939 ?auto_764938 ) ( ON ?auto_764940 ?auto_764939 ) ( ON ?auto_764941 ?auto_764940 ) ( ON ?auto_764942 ?auto_764941 ) ( ON ?auto_764943 ?auto_764942 ) ( ON ?auto_764944 ?auto_764943 ) ( ON ?auto_764945 ?auto_764944 ) ( ON ?auto_764946 ?auto_764945 ) ( not ( = ?auto_764938 ?auto_764939 ) ) ( not ( = ?auto_764938 ?auto_764940 ) ) ( not ( = ?auto_764938 ?auto_764941 ) ) ( not ( = ?auto_764938 ?auto_764942 ) ) ( not ( = ?auto_764938 ?auto_764943 ) ) ( not ( = ?auto_764938 ?auto_764944 ) ) ( not ( = ?auto_764938 ?auto_764945 ) ) ( not ( = ?auto_764938 ?auto_764946 ) ) ( not ( = ?auto_764938 ?auto_764947 ) ) ( not ( = ?auto_764938 ?auto_764948 ) ) ( not ( = ?auto_764938 ?auto_764949 ) ) ( not ( = ?auto_764939 ?auto_764940 ) ) ( not ( = ?auto_764939 ?auto_764941 ) ) ( not ( = ?auto_764939 ?auto_764942 ) ) ( not ( = ?auto_764939 ?auto_764943 ) ) ( not ( = ?auto_764939 ?auto_764944 ) ) ( not ( = ?auto_764939 ?auto_764945 ) ) ( not ( = ?auto_764939 ?auto_764946 ) ) ( not ( = ?auto_764939 ?auto_764947 ) ) ( not ( = ?auto_764939 ?auto_764948 ) ) ( not ( = ?auto_764939 ?auto_764949 ) ) ( not ( = ?auto_764940 ?auto_764941 ) ) ( not ( = ?auto_764940 ?auto_764942 ) ) ( not ( = ?auto_764940 ?auto_764943 ) ) ( not ( = ?auto_764940 ?auto_764944 ) ) ( not ( = ?auto_764940 ?auto_764945 ) ) ( not ( = ?auto_764940 ?auto_764946 ) ) ( not ( = ?auto_764940 ?auto_764947 ) ) ( not ( = ?auto_764940 ?auto_764948 ) ) ( not ( = ?auto_764940 ?auto_764949 ) ) ( not ( = ?auto_764941 ?auto_764942 ) ) ( not ( = ?auto_764941 ?auto_764943 ) ) ( not ( = ?auto_764941 ?auto_764944 ) ) ( not ( = ?auto_764941 ?auto_764945 ) ) ( not ( = ?auto_764941 ?auto_764946 ) ) ( not ( = ?auto_764941 ?auto_764947 ) ) ( not ( = ?auto_764941 ?auto_764948 ) ) ( not ( = ?auto_764941 ?auto_764949 ) ) ( not ( = ?auto_764942 ?auto_764943 ) ) ( not ( = ?auto_764942 ?auto_764944 ) ) ( not ( = ?auto_764942 ?auto_764945 ) ) ( not ( = ?auto_764942 ?auto_764946 ) ) ( not ( = ?auto_764942 ?auto_764947 ) ) ( not ( = ?auto_764942 ?auto_764948 ) ) ( not ( = ?auto_764942 ?auto_764949 ) ) ( not ( = ?auto_764943 ?auto_764944 ) ) ( not ( = ?auto_764943 ?auto_764945 ) ) ( not ( = ?auto_764943 ?auto_764946 ) ) ( not ( = ?auto_764943 ?auto_764947 ) ) ( not ( = ?auto_764943 ?auto_764948 ) ) ( not ( = ?auto_764943 ?auto_764949 ) ) ( not ( = ?auto_764944 ?auto_764945 ) ) ( not ( = ?auto_764944 ?auto_764946 ) ) ( not ( = ?auto_764944 ?auto_764947 ) ) ( not ( = ?auto_764944 ?auto_764948 ) ) ( not ( = ?auto_764944 ?auto_764949 ) ) ( not ( = ?auto_764945 ?auto_764946 ) ) ( not ( = ?auto_764945 ?auto_764947 ) ) ( not ( = ?auto_764945 ?auto_764948 ) ) ( not ( = ?auto_764945 ?auto_764949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_764946 ?auto_764947 ?auto_764948 )
      ( MAKE-10CRATE-VERIFY ?auto_764938 ?auto_764939 ?auto_764940 ?auto_764941 ?auto_764942 ?auto_764943 ?auto_764944 ?auto_764945 ?auto_764946 ?auto_764947 ?auto_764948 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_765064 - SURFACE
      ?auto_765065 - SURFACE
      ?auto_765066 - SURFACE
      ?auto_765067 - SURFACE
      ?auto_765068 - SURFACE
      ?auto_765069 - SURFACE
      ?auto_765070 - SURFACE
      ?auto_765071 - SURFACE
      ?auto_765072 - SURFACE
      ?auto_765073 - SURFACE
      ?auto_765074 - SURFACE
    )
    :vars
    (
      ?auto_765080 - HOIST
      ?auto_765079 - PLACE
      ?auto_765078 - PLACE
      ?auto_765076 - HOIST
      ?auto_765077 - SURFACE
      ?auto_765075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_765080 ?auto_765079 ) ( IS-CRATE ?auto_765074 ) ( not ( = ?auto_765073 ?auto_765074 ) ) ( not ( = ?auto_765072 ?auto_765073 ) ) ( not ( = ?auto_765072 ?auto_765074 ) ) ( not ( = ?auto_765078 ?auto_765079 ) ) ( HOIST-AT ?auto_765076 ?auto_765078 ) ( not ( = ?auto_765080 ?auto_765076 ) ) ( AVAILABLE ?auto_765076 ) ( SURFACE-AT ?auto_765074 ?auto_765078 ) ( ON ?auto_765074 ?auto_765077 ) ( CLEAR ?auto_765074 ) ( not ( = ?auto_765073 ?auto_765077 ) ) ( not ( = ?auto_765074 ?auto_765077 ) ) ( not ( = ?auto_765072 ?auto_765077 ) ) ( TRUCK-AT ?auto_765075 ?auto_765079 ) ( SURFACE-AT ?auto_765072 ?auto_765079 ) ( CLEAR ?auto_765072 ) ( IS-CRATE ?auto_765073 ) ( AVAILABLE ?auto_765080 ) ( IN ?auto_765073 ?auto_765075 ) ( ON ?auto_765065 ?auto_765064 ) ( ON ?auto_765066 ?auto_765065 ) ( ON ?auto_765067 ?auto_765066 ) ( ON ?auto_765068 ?auto_765067 ) ( ON ?auto_765069 ?auto_765068 ) ( ON ?auto_765070 ?auto_765069 ) ( ON ?auto_765071 ?auto_765070 ) ( ON ?auto_765072 ?auto_765071 ) ( not ( = ?auto_765064 ?auto_765065 ) ) ( not ( = ?auto_765064 ?auto_765066 ) ) ( not ( = ?auto_765064 ?auto_765067 ) ) ( not ( = ?auto_765064 ?auto_765068 ) ) ( not ( = ?auto_765064 ?auto_765069 ) ) ( not ( = ?auto_765064 ?auto_765070 ) ) ( not ( = ?auto_765064 ?auto_765071 ) ) ( not ( = ?auto_765064 ?auto_765072 ) ) ( not ( = ?auto_765064 ?auto_765073 ) ) ( not ( = ?auto_765064 ?auto_765074 ) ) ( not ( = ?auto_765064 ?auto_765077 ) ) ( not ( = ?auto_765065 ?auto_765066 ) ) ( not ( = ?auto_765065 ?auto_765067 ) ) ( not ( = ?auto_765065 ?auto_765068 ) ) ( not ( = ?auto_765065 ?auto_765069 ) ) ( not ( = ?auto_765065 ?auto_765070 ) ) ( not ( = ?auto_765065 ?auto_765071 ) ) ( not ( = ?auto_765065 ?auto_765072 ) ) ( not ( = ?auto_765065 ?auto_765073 ) ) ( not ( = ?auto_765065 ?auto_765074 ) ) ( not ( = ?auto_765065 ?auto_765077 ) ) ( not ( = ?auto_765066 ?auto_765067 ) ) ( not ( = ?auto_765066 ?auto_765068 ) ) ( not ( = ?auto_765066 ?auto_765069 ) ) ( not ( = ?auto_765066 ?auto_765070 ) ) ( not ( = ?auto_765066 ?auto_765071 ) ) ( not ( = ?auto_765066 ?auto_765072 ) ) ( not ( = ?auto_765066 ?auto_765073 ) ) ( not ( = ?auto_765066 ?auto_765074 ) ) ( not ( = ?auto_765066 ?auto_765077 ) ) ( not ( = ?auto_765067 ?auto_765068 ) ) ( not ( = ?auto_765067 ?auto_765069 ) ) ( not ( = ?auto_765067 ?auto_765070 ) ) ( not ( = ?auto_765067 ?auto_765071 ) ) ( not ( = ?auto_765067 ?auto_765072 ) ) ( not ( = ?auto_765067 ?auto_765073 ) ) ( not ( = ?auto_765067 ?auto_765074 ) ) ( not ( = ?auto_765067 ?auto_765077 ) ) ( not ( = ?auto_765068 ?auto_765069 ) ) ( not ( = ?auto_765068 ?auto_765070 ) ) ( not ( = ?auto_765068 ?auto_765071 ) ) ( not ( = ?auto_765068 ?auto_765072 ) ) ( not ( = ?auto_765068 ?auto_765073 ) ) ( not ( = ?auto_765068 ?auto_765074 ) ) ( not ( = ?auto_765068 ?auto_765077 ) ) ( not ( = ?auto_765069 ?auto_765070 ) ) ( not ( = ?auto_765069 ?auto_765071 ) ) ( not ( = ?auto_765069 ?auto_765072 ) ) ( not ( = ?auto_765069 ?auto_765073 ) ) ( not ( = ?auto_765069 ?auto_765074 ) ) ( not ( = ?auto_765069 ?auto_765077 ) ) ( not ( = ?auto_765070 ?auto_765071 ) ) ( not ( = ?auto_765070 ?auto_765072 ) ) ( not ( = ?auto_765070 ?auto_765073 ) ) ( not ( = ?auto_765070 ?auto_765074 ) ) ( not ( = ?auto_765070 ?auto_765077 ) ) ( not ( = ?auto_765071 ?auto_765072 ) ) ( not ( = ?auto_765071 ?auto_765073 ) ) ( not ( = ?auto_765071 ?auto_765074 ) ) ( not ( = ?auto_765071 ?auto_765077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_765072 ?auto_765073 ?auto_765074 )
      ( MAKE-10CRATE-VERIFY ?auto_765064 ?auto_765065 ?auto_765066 ?auto_765067 ?auto_765068 ?auto_765069 ?auto_765070 ?auto_765071 ?auto_765072 ?auto_765073 ?auto_765074 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772332 - SURFACE
      ?auto_772333 - SURFACE
      ?auto_772334 - SURFACE
      ?auto_772335 - SURFACE
      ?auto_772336 - SURFACE
      ?auto_772337 - SURFACE
      ?auto_772338 - SURFACE
      ?auto_772339 - SURFACE
      ?auto_772340 - SURFACE
      ?auto_772341 - SURFACE
      ?auto_772342 - SURFACE
      ?auto_772343 - SURFACE
    )
    :vars
    (
      ?auto_772345 - HOIST
      ?auto_772344 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772345 ?auto_772344 ) ( SURFACE-AT ?auto_772342 ?auto_772344 ) ( CLEAR ?auto_772342 ) ( LIFTING ?auto_772345 ?auto_772343 ) ( IS-CRATE ?auto_772343 ) ( not ( = ?auto_772342 ?auto_772343 ) ) ( ON ?auto_772333 ?auto_772332 ) ( ON ?auto_772334 ?auto_772333 ) ( ON ?auto_772335 ?auto_772334 ) ( ON ?auto_772336 ?auto_772335 ) ( ON ?auto_772337 ?auto_772336 ) ( ON ?auto_772338 ?auto_772337 ) ( ON ?auto_772339 ?auto_772338 ) ( ON ?auto_772340 ?auto_772339 ) ( ON ?auto_772341 ?auto_772340 ) ( ON ?auto_772342 ?auto_772341 ) ( not ( = ?auto_772332 ?auto_772333 ) ) ( not ( = ?auto_772332 ?auto_772334 ) ) ( not ( = ?auto_772332 ?auto_772335 ) ) ( not ( = ?auto_772332 ?auto_772336 ) ) ( not ( = ?auto_772332 ?auto_772337 ) ) ( not ( = ?auto_772332 ?auto_772338 ) ) ( not ( = ?auto_772332 ?auto_772339 ) ) ( not ( = ?auto_772332 ?auto_772340 ) ) ( not ( = ?auto_772332 ?auto_772341 ) ) ( not ( = ?auto_772332 ?auto_772342 ) ) ( not ( = ?auto_772332 ?auto_772343 ) ) ( not ( = ?auto_772333 ?auto_772334 ) ) ( not ( = ?auto_772333 ?auto_772335 ) ) ( not ( = ?auto_772333 ?auto_772336 ) ) ( not ( = ?auto_772333 ?auto_772337 ) ) ( not ( = ?auto_772333 ?auto_772338 ) ) ( not ( = ?auto_772333 ?auto_772339 ) ) ( not ( = ?auto_772333 ?auto_772340 ) ) ( not ( = ?auto_772333 ?auto_772341 ) ) ( not ( = ?auto_772333 ?auto_772342 ) ) ( not ( = ?auto_772333 ?auto_772343 ) ) ( not ( = ?auto_772334 ?auto_772335 ) ) ( not ( = ?auto_772334 ?auto_772336 ) ) ( not ( = ?auto_772334 ?auto_772337 ) ) ( not ( = ?auto_772334 ?auto_772338 ) ) ( not ( = ?auto_772334 ?auto_772339 ) ) ( not ( = ?auto_772334 ?auto_772340 ) ) ( not ( = ?auto_772334 ?auto_772341 ) ) ( not ( = ?auto_772334 ?auto_772342 ) ) ( not ( = ?auto_772334 ?auto_772343 ) ) ( not ( = ?auto_772335 ?auto_772336 ) ) ( not ( = ?auto_772335 ?auto_772337 ) ) ( not ( = ?auto_772335 ?auto_772338 ) ) ( not ( = ?auto_772335 ?auto_772339 ) ) ( not ( = ?auto_772335 ?auto_772340 ) ) ( not ( = ?auto_772335 ?auto_772341 ) ) ( not ( = ?auto_772335 ?auto_772342 ) ) ( not ( = ?auto_772335 ?auto_772343 ) ) ( not ( = ?auto_772336 ?auto_772337 ) ) ( not ( = ?auto_772336 ?auto_772338 ) ) ( not ( = ?auto_772336 ?auto_772339 ) ) ( not ( = ?auto_772336 ?auto_772340 ) ) ( not ( = ?auto_772336 ?auto_772341 ) ) ( not ( = ?auto_772336 ?auto_772342 ) ) ( not ( = ?auto_772336 ?auto_772343 ) ) ( not ( = ?auto_772337 ?auto_772338 ) ) ( not ( = ?auto_772337 ?auto_772339 ) ) ( not ( = ?auto_772337 ?auto_772340 ) ) ( not ( = ?auto_772337 ?auto_772341 ) ) ( not ( = ?auto_772337 ?auto_772342 ) ) ( not ( = ?auto_772337 ?auto_772343 ) ) ( not ( = ?auto_772338 ?auto_772339 ) ) ( not ( = ?auto_772338 ?auto_772340 ) ) ( not ( = ?auto_772338 ?auto_772341 ) ) ( not ( = ?auto_772338 ?auto_772342 ) ) ( not ( = ?auto_772338 ?auto_772343 ) ) ( not ( = ?auto_772339 ?auto_772340 ) ) ( not ( = ?auto_772339 ?auto_772341 ) ) ( not ( = ?auto_772339 ?auto_772342 ) ) ( not ( = ?auto_772339 ?auto_772343 ) ) ( not ( = ?auto_772340 ?auto_772341 ) ) ( not ( = ?auto_772340 ?auto_772342 ) ) ( not ( = ?auto_772340 ?auto_772343 ) ) ( not ( = ?auto_772341 ?auto_772342 ) ) ( not ( = ?auto_772341 ?auto_772343 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_772342 ?auto_772343 )
      ( MAKE-11CRATE-VERIFY ?auto_772332 ?auto_772333 ?auto_772334 ?auto_772335 ?auto_772336 ?auto_772337 ?auto_772338 ?auto_772339 ?auto_772340 ?auto_772341 ?auto_772342 ?auto_772343 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772441 - SURFACE
      ?auto_772442 - SURFACE
      ?auto_772443 - SURFACE
      ?auto_772444 - SURFACE
      ?auto_772445 - SURFACE
      ?auto_772446 - SURFACE
      ?auto_772447 - SURFACE
      ?auto_772448 - SURFACE
      ?auto_772449 - SURFACE
      ?auto_772450 - SURFACE
      ?auto_772451 - SURFACE
      ?auto_772452 - SURFACE
    )
    :vars
    (
      ?auto_772453 - HOIST
      ?auto_772455 - PLACE
      ?auto_772454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_772453 ?auto_772455 ) ( SURFACE-AT ?auto_772451 ?auto_772455 ) ( CLEAR ?auto_772451 ) ( IS-CRATE ?auto_772452 ) ( not ( = ?auto_772451 ?auto_772452 ) ) ( TRUCK-AT ?auto_772454 ?auto_772455 ) ( AVAILABLE ?auto_772453 ) ( IN ?auto_772452 ?auto_772454 ) ( ON ?auto_772451 ?auto_772450 ) ( not ( = ?auto_772450 ?auto_772451 ) ) ( not ( = ?auto_772450 ?auto_772452 ) ) ( ON ?auto_772442 ?auto_772441 ) ( ON ?auto_772443 ?auto_772442 ) ( ON ?auto_772444 ?auto_772443 ) ( ON ?auto_772445 ?auto_772444 ) ( ON ?auto_772446 ?auto_772445 ) ( ON ?auto_772447 ?auto_772446 ) ( ON ?auto_772448 ?auto_772447 ) ( ON ?auto_772449 ?auto_772448 ) ( ON ?auto_772450 ?auto_772449 ) ( not ( = ?auto_772441 ?auto_772442 ) ) ( not ( = ?auto_772441 ?auto_772443 ) ) ( not ( = ?auto_772441 ?auto_772444 ) ) ( not ( = ?auto_772441 ?auto_772445 ) ) ( not ( = ?auto_772441 ?auto_772446 ) ) ( not ( = ?auto_772441 ?auto_772447 ) ) ( not ( = ?auto_772441 ?auto_772448 ) ) ( not ( = ?auto_772441 ?auto_772449 ) ) ( not ( = ?auto_772441 ?auto_772450 ) ) ( not ( = ?auto_772441 ?auto_772451 ) ) ( not ( = ?auto_772441 ?auto_772452 ) ) ( not ( = ?auto_772442 ?auto_772443 ) ) ( not ( = ?auto_772442 ?auto_772444 ) ) ( not ( = ?auto_772442 ?auto_772445 ) ) ( not ( = ?auto_772442 ?auto_772446 ) ) ( not ( = ?auto_772442 ?auto_772447 ) ) ( not ( = ?auto_772442 ?auto_772448 ) ) ( not ( = ?auto_772442 ?auto_772449 ) ) ( not ( = ?auto_772442 ?auto_772450 ) ) ( not ( = ?auto_772442 ?auto_772451 ) ) ( not ( = ?auto_772442 ?auto_772452 ) ) ( not ( = ?auto_772443 ?auto_772444 ) ) ( not ( = ?auto_772443 ?auto_772445 ) ) ( not ( = ?auto_772443 ?auto_772446 ) ) ( not ( = ?auto_772443 ?auto_772447 ) ) ( not ( = ?auto_772443 ?auto_772448 ) ) ( not ( = ?auto_772443 ?auto_772449 ) ) ( not ( = ?auto_772443 ?auto_772450 ) ) ( not ( = ?auto_772443 ?auto_772451 ) ) ( not ( = ?auto_772443 ?auto_772452 ) ) ( not ( = ?auto_772444 ?auto_772445 ) ) ( not ( = ?auto_772444 ?auto_772446 ) ) ( not ( = ?auto_772444 ?auto_772447 ) ) ( not ( = ?auto_772444 ?auto_772448 ) ) ( not ( = ?auto_772444 ?auto_772449 ) ) ( not ( = ?auto_772444 ?auto_772450 ) ) ( not ( = ?auto_772444 ?auto_772451 ) ) ( not ( = ?auto_772444 ?auto_772452 ) ) ( not ( = ?auto_772445 ?auto_772446 ) ) ( not ( = ?auto_772445 ?auto_772447 ) ) ( not ( = ?auto_772445 ?auto_772448 ) ) ( not ( = ?auto_772445 ?auto_772449 ) ) ( not ( = ?auto_772445 ?auto_772450 ) ) ( not ( = ?auto_772445 ?auto_772451 ) ) ( not ( = ?auto_772445 ?auto_772452 ) ) ( not ( = ?auto_772446 ?auto_772447 ) ) ( not ( = ?auto_772446 ?auto_772448 ) ) ( not ( = ?auto_772446 ?auto_772449 ) ) ( not ( = ?auto_772446 ?auto_772450 ) ) ( not ( = ?auto_772446 ?auto_772451 ) ) ( not ( = ?auto_772446 ?auto_772452 ) ) ( not ( = ?auto_772447 ?auto_772448 ) ) ( not ( = ?auto_772447 ?auto_772449 ) ) ( not ( = ?auto_772447 ?auto_772450 ) ) ( not ( = ?auto_772447 ?auto_772451 ) ) ( not ( = ?auto_772447 ?auto_772452 ) ) ( not ( = ?auto_772448 ?auto_772449 ) ) ( not ( = ?auto_772448 ?auto_772450 ) ) ( not ( = ?auto_772448 ?auto_772451 ) ) ( not ( = ?auto_772448 ?auto_772452 ) ) ( not ( = ?auto_772449 ?auto_772450 ) ) ( not ( = ?auto_772449 ?auto_772451 ) ) ( not ( = ?auto_772449 ?auto_772452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772450 ?auto_772451 ?auto_772452 )
      ( MAKE-11CRATE-VERIFY ?auto_772441 ?auto_772442 ?auto_772443 ?auto_772444 ?auto_772445 ?auto_772446 ?auto_772447 ?auto_772448 ?auto_772449 ?auto_772450 ?auto_772451 ?auto_772452 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772562 - SURFACE
      ?auto_772563 - SURFACE
      ?auto_772564 - SURFACE
      ?auto_772565 - SURFACE
      ?auto_772566 - SURFACE
      ?auto_772567 - SURFACE
      ?auto_772568 - SURFACE
      ?auto_772569 - SURFACE
      ?auto_772570 - SURFACE
      ?auto_772571 - SURFACE
      ?auto_772572 - SURFACE
      ?auto_772573 - SURFACE
    )
    :vars
    (
      ?auto_772574 - HOIST
      ?auto_772577 - PLACE
      ?auto_772575 - TRUCK
      ?auto_772576 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772574 ?auto_772577 ) ( SURFACE-AT ?auto_772572 ?auto_772577 ) ( CLEAR ?auto_772572 ) ( IS-CRATE ?auto_772573 ) ( not ( = ?auto_772572 ?auto_772573 ) ) ( AVAILABLE ?auto_772574 ) ( IN ?auto_772573 ?auto_772575 ) ( ON ?auto_772572 ?auto_772571 ) ( not ( = ?auto_772571 ?auto_772572 ) ) ( not ( = ?auto_772571 ?auto_772573 ) ) ( TRUCK-AT ?auto_772575 ?auto_772576 ) ( not ( = ?auto_772576 ?auto_772577 ) ) ( ON ?auto_772563 ?auto_772562 ) ( ON ?auto_772564 ?auto_772563 ) ( ON ?auto_772565 ?auto_772564 ) ( ON ?auto_772566 ?auto_772565 ) ( ON ?auto_772567 ?auto_772566 ) ( ON ?auto_772568 ?auto_772567 ) ( ON ?auto_772569 ?auto_772568 ) ( ON ?auto_772570 ?auto_772569 ) ( ON ?auto_772571 ?auto_772570 ) ( not ( = ?auto_772562 ?auto_772563 ) ) ( not ( = ?auto_772562 ?auto_772564 ) ) ( not ( = ?auto_772562 ?auto_772565 ) ) ( not ( = ?auto_772562 ?auto_772566 ) ) ( not ( = ?auto_772562 ?auto_772567 ) ) ( not ( = ?auto_772562 ?auto_772568 ) ) ( not ( = ?auto_772562 ?auto_772569 ) ) ( not ( = ?auto_772562 ?auto_772570 ) ) ( not ( = ?auto_772562 ?auto_772571 ) ) ( not ( = ?auto_772562 ?auto_772572 ) ) ( not ( = ?auto_772562 ?auto_772573 ) ) ( not ( = ?auto_772563 ?auto_772564 ) ) ( not ( = ?auto_772563 ?auto_772565 ) ) ( not ( = ?auto_772563 ?auto_772566 ) ) ( not ( = ?auto_772563 ?auto_772567 ) ) ( not ( = ?auto_772563 ?auto_772568 ) ) ( not ( = ?auto_772563 ?auto_772569 ) ) ( not ( = ?auto_772563 ?auto_772570 ) ) ( not ( = ?auto_772563 ?auto_772571 ) ) ( not ( = ?auto_772563 ?auto_772572 ) ) ( not ( = ?auto_772563 ?auto_772573 ) ) ( not ( = ?auto_772564 ?auto_772565 ) ) ( not ( = ?auto_772564 ?auto_772566 ) ) ( not ( = ?auto_772564 ?auto_772567 ) ) ( not ( = ?auto_772564 ?auto_772568 ) ) ( not ( = ?auto_772564 ?auto_772569 ) ) ( not ( = ?auto_772564 ?auto_772570 ) ) ( not ( = ?auto_772564 ?auto_772571 ) ) ( not ( = ?auto_772564 ?auto_772572 ) ) ( not ( = ?auto_772564 ?auto_772573 ) ) ( not ( = ?auto_772565 ?auto_772566 ) ) ( not ( = ?auto_772565 ?auto_772567 ) ) ( not ( = ?auto_772565 ?auto_772568 ) ) ( not ( = ?auto_772565 ?auto_772569 ) ) ( not ( = ?auto_772565 ?auto_772570 ) ) ( not ( = ?auto_772565 ?auto_772571 ) ) ( not ( = ?auto_772565 ?auto_772572 ) ) ( not ( = ?auto_772565 ?auto_772573 ) ) ( not ( = ?auto_772566 ?auto_772567 ) ) ( not ( = ?auto_772566 ?auto_772568 ) ) ( not ( = ?auto_772566 ?auto_772569 ) ) ( not ( = ?auto_772566 ?auto_772570 ) ) ( not ( = ?auto_772566 ?auto_772571 ) ) ( not ( = ?auto_772566 ?auto_772572 ) ) ( not ( = ?auto_772566 ?auto_772573 ) ) ( not ( = ?auto_772567 ?auto_772568 ) ) ( not ( = ?auto_772567 ?auto_772569 ) ) ( not ( = ?auto_772567 ?auto_772570 ) ) ( not ( = ?auto_772567 ?auto_772571 ) ) ( not ( = ?auto_772567 ?auto_772572 ) ) ( not ( = ?auto_772567 ?auto_772573 ) ) ( not ( = ?auto_772568 ?auto_772569 ) ) ( not ( = ?auto_772568 ?auto_772570 ) ) ( not ( = ?auto_772568 ?auto_772571 ) ) ( not ( = ?auto_772568 ?auto_772572 ) ) ( not ( = ?auto_772568 ?auto_772573 ) ) ( not ( = ?auto_772569 ?auto_772570 ) ) ( not ( = ?auto_772569 ?auto_772571 ) ) ( not ( = ?auto_772569 ?auto_772572 ) ) ( not ( = ?auto_772569 ?auto_772573 ) ) ( not ( = ?auto_772570 ?auto_772571 ) ) ( not ( = ?auto_772570 ?auto_772572 ) ) ( not ( = ?auto_772570 ?auto_772573 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772571 ?auto_772572 ?auto_772573 )
      ( MAKE-11CRATE-VERIFY ?auto_772562 ?auto_772563 ?auto_772564 ?auto_772565 ?auto_772566 ?auto_772567 ?auto_772568 ?auto_772569 ?auto_772570 ?auto_772571 ?auto_772572 ?auto_772573 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772694 - SURFACE
      ?auto_772695 - SURFACE
      ?auto_772696 - SURFACE
      ?auto_772697 - SURFACE
      ?auto_772698 - SURFACE
      ?auto_772699 - SURFACE
      ?auto_772700 - SURFACE
      ?auto_772701 - SURFACE
      ?auto_772702 - SURFACE
      ?auto_772703 - SURFACE
      ?auto_772704 - SURFACE
      ?auto_772705 - SURFACE
    )
    :vars
    (
      ?auto_772709 - HOIST
      ?auto_772707 - PLACE
      ?auto_772708 - TRUCK
      ?auto_772706 - PLACE
      ?auto_772710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_772709 ?auto_772707 ) ( SURFACE-AT ?auto_772704 ?auto_772707 ) ( CLEAR ?auto_772704 ) ( IS-CRATE ?auto_772705 ) ( not ( = ?auto_772704 ?auto_772705 ) ) ( AVAILABLE ?auto_772709 ) ( ON ?auto_772704 ?auto_772703 ) ( not ( = ?auto_772703 ?auto_772704 ) ) ( not ( = ?auto_772703 ?auto_772705 ) ) ( TRUCK-AT ?auto_772708 ?auto_772706 ) ( not ( = ?auto_772706 ?auto_772707 ) ) ( HOIST-AT ?auto_772710 ?auto_772706 ) ( LIFTING ?auto_772710 ?auto_772705 ) ( not ( = ?auto_772709 ?auto_772710 ) ) ( ON ?auto_772695 ?auto_772694 ) ( ON ?auto_772696 ?auto_772695 ) ( ON ?auto_772697 ?auto_772696 ) ( ON ?auto_772698 ?auto_772697 ) ( ON ?auto_772699 ?auto_772698 ) ( ON ?auto_772700 ?auto_772699 ) ( ON ?auto_772701 ?auto_772700 ) ( ON ?auto_772702 ?auto_772701 ) ( ON ?auto_772703 ?auto_772702 ) ( not ( = ?auto_772694 ?auto_772695 ) ) ( not ( = ?auto_772694 ?auto_772696 ) ) ( not ( = ?auto_772694 ?auto_772697 ) ) ( not ( = ?auto_772694 ?auto_772698 ) ) ( not ( = ?auto_772694 ?auto_772699 ) ) ( not ( = ?auto_772694 ?auto_772700 ) ) ( not ( = ?auto_772694 ?auto_772701 ) ) ( not ( = ?auto_772694 ?auto_772702 ) ) ( not ( = ?auto_772694 ?auto_772703 ) ) ( not ( = ?auto_772694 ?auto_772704 ) ) ( not ( = ?auto_772694 ?auto_772705 ) ) ( not ( = ?auto_772695 ?auto_772696 ) ) ( not ( = ?auto_772695 ?auto_772697 ) ) ( not ( = ?auto_772695 ?auto_772698 ) ) ( not ( = ?auto_772695 ?auto_772699 ) ) ( not ( = ?auto_772695 ?auto_772700 ) ) ( not ( = ?auto_772695 ?auto_772701 ) ) ( not ( = ?auto_772695 ?auto_772702 ) ) ( not ( = ?auto_772695 ?auto_772703 ) ) ( not ( = ?auto_772695 ?auto_772704 ) ) ( not ( = ?auto_772695 ?auto_772705 ) ) ( not ( = ?auto_772696 ?auto_772697 ) ) ( not ( = ?auto_772696 ?auto_772698 ) ) ( not ( = ?auto_772696 ?auto_772699 ) ) ( not ( = ?auto_772696 ?auto_772700 ) ) ( not ( = ?auto_772696 ?auto_772701 ) ) ( not ( = ?auto_772696 ?auto_772702 ) ) ( not ( = ?auto_772696 ?auto_772703 ) ) ( not ( = ?auto_772696 ?auto_772704 ) ) ( not ( = ?auto_772696 ?auto_772705 ) ) ( not ( = ?auto_772697 ?auto_772698 ) ) ( not ( = ?auto_772697 ?auto_772699 ) ) ( not ( = ?auto_772697 ?auto_772700 ) ) ( not ( = ?auto_772697 ?auto_772701 ) ) ( not ( = ?auto_772697 ?auto_772702 ) ) ( not ( = ?auto_772697 ?auto_772703 ) ) ( not ( = ?auto_772697 ?auto_772704 ) ) ( not ( = ?auto_772697 ?auto_772705 ) ) ( not ( = ?auto_772698 ?auto_772699 ) ) ( not ( = ?auto_772698 ?auto_772700 ) ) ( not ( = ?auto_772698 ?auto_772701 ) ) ( not ( = ?auto_772698 ?auto_772702 ) ) ( not ( = ?auto_772698 ?auto_772703 ) ) ( not ( = ?auto_772698 ?auto_772704 ) ) ( not ( = ?auto_772698 ?auto_772705 ) ) ( not ( = ?auto_772699 ?auto_772700 ) ) ( not ( = ?auto_772699 ?auto_772701 ) ) ( not ( = ?auto_772699 ?auto_772702 ) ) ( not ( = ?auto_772699 ?auto_772703 ) ) ( not ( = ?auto_772699 ?auto_772704 ) ) ( not ( = ?auto_772699 ?auto_772705 ) ) ( not ( = ?auto_772700 ?auto_772701 ) ) ( not ( = ?auto_772700 ?auto_772702 ) ) ( not ( = ?auto_772700 ?auto_772703 ) ) ( not ( = ?auto_772700 ?auto_772704 ) ) ( not ( = ?auto_772700 ?auto_772705 ) ) ( not ( = ?auto_772701 ?auto_772702 ) ) ( not ( = ?auto_772701 ?auto_772703 ) ) ( not ( = ?auto_772701 ?auto_772704 ) ) ( not ( = ?auto_772701 ?auto_772705 ) ) ( not ( = ?auto_772702 ?auto_772703 ) ) ( not ( = ?auto_772702 ?auto_772704 ) ) ( not ( = ?auto_772702 ?auto_772705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772703 ?auto_772704 ?auto_772705 )
      ( MAKE-11CRATE-VERIFY ?auto_772694 ?auto_772695 ?auto_772696 ?auto_772697 ?auto_772698 ?auto_772699 ?auto_772700 ?auto_772701 ?auto_772702 ?auto_772703 ?auto_772704 ?auto_772705 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772837 - SURFACE
      ?auto_772838 - SURFACE
      ?auto_772839 - SURFACE
      ?auto_772840 - SURFACE
      ?auto_772841 - SURFACE
      ?auto_772842 - SURFACE
      ?auto_772843 - SURFACE
      ?auto_772844 - SURFACE
      ?auto_772845 - SURFACE
      ?auto_772846 - SURFACE
      ?auto_772847 - SURFACE
      ?auto_772848 - SURFACE
    )
    :vars
    (
      ?auto_772849 - HOIST
      ?auto_772850 - PLACE
      ?auto_772854 - TRUCK
      ?auto_772853 - PLACE
      ?auto_772852 - HOIST
      ?auto_772851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772849 ?auto_772850 ) ( SURFACE-AT ?auto_772847 ?auto_772850 ) ( CLEAR ?auto_772847 ) ( IS-CRATE ?auto_772848 ) ( not ( = ?auto_772847 ?auto_772848 ) ) ( AVAILABLE ?auto_772849 ) ( ON ?auto_772847 ?auto_772846 ) ( not ( = ?auto_772846 ?auto_772847 ) ) ( not ( = ?auto_772846 ?auto_772848 ) ) ( TRUCK-AT ?auto_772854 ?auto_772853 ) ( not ( = ?auto_772853 ?auto_772850 ) ) ( HOIST-AT ?auto_772852 ?auto_772853 ) ( not ( = ?auto_772849 ?auto_772852 ) ) ( AVAILABLE ?auto_772852 ) ( SURFACE-AT ?auto_772848 ?auto_772853 ) ( ON ?auto_772848 ?auto_772851 ) ( CLEAR ?auto_772848 ) ( not ( = ?auto_772847 ?auto_772851 ) ) ( not ( = ?auto_772848 ?auto_772851 ) ) ( not ( = ?auto_772846 ?auto_772851 ) ) ( ON ?auto_772838 ?auto_772837 ) ( ON ?auto_772839 ?auto_772838 ) ( ON ?auto_772840 ?auto_772839 ) ( ON ?auto_772841 ?auto_772840 ) ( ON ?auto_772842 ?auto_772841 ) ( ON ?auto_772843 ?auto_772842 ) ( ON ?auto_772844 ?auto_772843 ) ( ON ?auto_772845 ?auto_772844 ) ( ON ?auto_772846 ?auto_772845 ) ( not ( = ?auto_772837 ?auto_772838 ) ) ( not ( = ?auto_772837 ?auto_772839 ) ) ( not ( = ?auto_772837 ?auto_772840 ) ) ( not ( = ?auto_772837 ?auto_772841 ) ) ( not ( = ?auto_772837 ?auto_772842 ) ) ( not ( = ?auto_772837 ?auto_772843 ) ) ( not ( = ?auto_772837 ?auto_772844 ) ) ( not ( = ?auto_772837 ?auto_772845 ) ) ( not ( = ?auto_772837 ?auto_772846 ) ) ( not ( = ?auto_772837 ?auto_772847 ) ) ( not ( = ?auto_772837 ?auto_772848 ) ) ( not ( = ?auto_772837 ?auto_772851 ) ) ( not ( = ?auto_772838 ?auto_772839 ) ) ( not ( = ?auto_772838 ?auto_772840 ) ) ( not ( = ?auto_772838 ?auto_772841 ) ) ( not ( = ?auto_772838 ?auto_772842 ) ) ( not ( = ?auto_772838 ?auto_772843 ) ) ( not ( = ?auto_772838 ?auto_772844 ) ) ( not ( = ?auto_772838 ?auto_772845 ) ) ( not ( = ?auto_772838 ?auto_772846 ) ) ( not ( = ?auto_772838 ?auto_772847 ) ) ( not ( = ?auto_772838 ?auto_772848 ) ) ( not ( = ?auto_772838 ?auto_772851 ) ) ( not ( = ?auto_772839 ?auto_772840 ) ) ( not ( = ?auto_772839 ?auto_772841 ) ) ( not ( = ?auto_772839 ?auto_772842 ) ) ( not ( = ?auto_772839 ?auto_772843 ) ) ( not ( = ?auto_772839 ?auto_772844 ) ) ( not ( = ?auto_772839 ?auto_772845 ) ) ( not ( = ?auto_772839 ?auto_772846 ) ) ( not ( = ?auto_772839 ?auto_772847 ) ) ( not ( = ?auto_772839 ?auto_772848 ) ) ( not ( = ?auto_772839 ?auto_772851 ) ) ( not ( = ?auto_772840 ?auto_772841 ) ) ( not ( = ?auto_772840 ?auto_772842 ) ) ( not ( = ?auto_772840 ?auto_772843 ) ) ( not ( = ?auto_772840 ?auto_772844 ) ) ( not ( = ?auto_772840 ?auto_772845 ) ) ( not ( = ?auto_772840 ?auto_772846 ) ) ( not ( = ?auto_772840 ?auto_772847 ) ) ( not ( = ?auto_772840 ?auto_772848 ) ) ( not ( = ?auto_772840 ?auto_772851 ) ) ( not ( = ?auto_772841 ?auto_772842 ) ) ( not ( = ?auto_772841 ?auto_772843 ) ) ( not ( = ?auto_772841 ?auto_772844 ) ) ( not ( = ?auto_772841 ?auto_772845 ) ) ( not ( = ?auto_772841 ?auto_772846 ) ) ( not ( = ?auto_772841 ?auto_772847 ) ) ( not ( = ?auto_772841 ?auto_772848 ) ) ( not ( = ?auto_772841 ?auto_772851 ) ) ( not ( = ?auto_772842 ?auto_772843 ) ) ( not ( = ?auto_772842 ?auto_772844 ) ) ( not ( = ?auto_772842 ?auto_772845 ) ) ( not ( = ?auto_772842 ?auto_772846 ) ) ( not ( = ?auto_772842 ?auto_772847 ) ) ( not ( = ?auto_772842 ?auto_772848 ) ) ( not ( = ?auto_772842 ?auto_772851 ) ) ( not ( = ?auto_772843 ?auto_772844 ) ) ( not ( = ?auto_772843 ?auto_772845 ) ) ( not ( = ?auto_772843 ?auto_772846 ) ) ( not ( = ?auto_772843 ?auto_772847 ) ) ( not ( = ?auto_772843 ?auto_772848 ) ) ( not ( = ?auto_772843 ?auto_772851 ) ) ( not ( = ?auto_772844 ?auto_772845 ) ) ( not ( = ?auto_772844 ?auto_772846 ) ) ( not ( = ?auto_772844 ?auto_772847 ) ) ( not ( = ?auto_772844 ?auto_772848 ) ) ( not ( = ?auto_772844 ?auto_772851 ) ) ( not ( = ?auto_772845 ?auto_772846 ) ) ( not ( = ?auto_772845 ?auto_772847 ) ) ( not ( = ?auto_772845 ?auto_772848 ) ) ( not ( = ?auto_772845 ?auto_772851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772846 ?auto_772847 ?auto_772848 )
      ( MAKE-11CRATE-VERIFY ?auto_772837 ?auto_772838 ?auto_772839 ?auto_772840 ?auto_772841 ?auto_772842 ?auto_772843 ?auto_772844 ?auto_772845 ?auto_772846 ?auto_772847 ?auto_772848 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_772981 - SURFACE
      ?auto_772982 - SURFACE
      ?auto_772983 - SURFACE
      ?auto_772984 - SURFACE
      ?auto_772985 - SURFACE
      ?auto_772986 - SURFACE
      ?auto_772987 - SURFACE
      ?auto_772988 - SURFACE
      ?auto_772989 - SURFACE
      ?auto_772990 - SURFACE
      ?auto_772991 - SURFACE
      ?auto_772992 - SURFACE
    )
    :vars
    (
      ?auto_772993 - HOIST
      ?auto_772995 - PLACE
      ?auto_772996 - PLACE
      ?auto_772994 - HOIST
      ?auto_772998 - SURFACE
      ?auto_772997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_772993 ?auto_772995 ) ( SURFACE-AT ?auto_772991 ?auto_772995 ) ( CLEAR ?auto_772991 ) ( IS-CRATE ?auto_772992 ) ( not ( = ?auto_772991 ?auto_772992 ) ) ( AVAILABLE ?auto_772993 ) ( ON ?auto_772991 ?auto_772990 ) ( not ( = ?auto_772990 ?auto_772991 ) ) ( not ( = ?auto_772990 ?auto_772992 ) ) ( not ( = ?auto_772996 ?auto_772995 ) ) ( HOIST-AT ?auto_772994 ?auto_772996 ) ( not ( = ?auto_772993 ?auto_772994 ) ) ( AVAILABLE ?auto_772994 ) ( SURFACE-AT ?auto_772992 ?auto_772996 ) ( ON ?auto_772992 ?auto_772998 ) ( CLEAR ?auto_772992 ) ( not ( = ?auto_772991 ?auto_772998 ) ) ( not ( = ?auto_772992 ?auto_772998 ) ) ( not ( = ?auto_772990 ?auto_772998 ) ) ( TRUCK-AT ?auto_772997 ?auto_772995 ) ( ON ?auto_772982 ?auto_772981 ) ( ON ?auto_772983 ?auto_772982 ) ( ON ?auto_772984 ?auto_772983 ) ( ON ?auto_772985 ?auto_772984 ) ( ON ?auto_772986 ?auto_772985 ) ( ON ?auto_772987 ?auto_772986 ) ( ON ?auto_772988 ?auto_772987 ) ( ON ?auto_772989 ?auto_772988 ) ( ON ?auto_772990 ?auto_772989 ) ( not ( = ?auto_772981 ?auto_772982 ) ) ( not ( = ?auto_772981 ?auto_772983 ) ) ( not ( = ?auto_772981 ?auto_772984 ) ) ( not ( = ?auto_772981 ?auto_772985 ) ) ( not ( = ?auto_772981 ?auto_772986 ) ) ( not ( = ?auto_772981 ?auto_772987 ) ) ( not ( = ?auto_772981 ?auto_772988 ) ) ( not ( = ?auto_772981 ?auto_772989 ) ) ( not ( = ?auto_772981 ?auto_772990 ) ) ( not ( = ?auto_772981 ?auto_772991 ) ) ( not ( = ?auto_772981 ?auto_772992 ) ) ( not ( = ?auto_772981 ?auto_772998 ) ) ( not ( = ?auto_772982 ?auto_772983 ) ) ( not ( = ?auto_772982 ?auto_772984 ) ) ( not ( = ?auto_772982 ?auto_772985 ) ) ( not ( = ?auto_772982 ?auto_772986 ) ) ( not ( = ?auto_772982 ?auto_772987 ) ) ( not ( = ?auto_772982 ?auto_772988 ) ) ( not ( = ?auto_772982 ?auto_772989 ) ) ( not ( = ?auto_772982 ?auto_772990 ) ) ( not ( = ?auto_772982 ?auto_772991 ) ) ( not ( = ?auto_772982 ?auto_772992 ) ) ( not ( = ?auto_772982 ?auto_772998 ) ) ( not ( = ?auto_772983 ?auto_772984 ) ) ( not ( = ?auto_772983 ?auto_772985 ) ) ( not ( = ?auto_772983 ?auto_772986 ) ) ( not ( = ?auto_772983 ?auto_772987 ) ) ( not ( = ?auto_772983 ?auto_772988 ) ) ( not ( = ?auto_772983 ?auto_772989 ) ) ( not ( = ?auto_772983 ?auto_772990 ) ) ( not ( = ?auto_772983 ?auto_772991 ) ) ( not ( = ?auto_772983 ?auto_772992 ) ) ( not ( = ?auto_772983 ?auto_772998 ) ) ( not ( = ?auto_772984 ?auto_772985 ) ) ( not ( = ?auto_772984 ?auto_772986 ) ) ( not ( = ?auto_772984 ?auto_772987 ) ) ( not ( = ?auto_772984 ?auto_772988 ) ) ( not ( = ?auto_772984 ?auto_772989 ) ) ( not ( = ?auto_772984 ?auto_772990 ) ) ( not ( = ?auto_772984 ?auto_772991 ) ) ( not ( = ?auto_772984 ?auto_772992 ) ) ( not ( = ?auto_772984 ?auto_772998 ) ) ( not ( = ?auto_772985 ?auto_772986 ) ) ( not ( = ?auto_772985 ?auto_772987 ) ) ( not ( = ?auto_772985 ?auto_772988 ) ) ( not ( = ?auto_772985 ?auto_772989 ) ) ( not ( = ?auto_772985 ?auto_772990 ) ) ( not ( = ?auto_772985 ?auto_772991 ) ) ( not ( = ?auto_772985 ?auto_772992 ) ) ( not ( = ?auto_772985 ?auto_772998 ) ) ( not ( = ?auto_772986 ?auto_772987 ) ) ( not ( = ?auto_772986 ?auto_772988 ) ) ( not ( = ?auto_772986 ?auto_772989 ) ) ( not ( = ?auto_772986 ?auto_772990 ) ) ( not ( = ?auto_772986 ?auto_772991 ) ) ( not ( = ?auto_772986 ?auto_772992 ) ) ( not ( = ?auto_772986 ?auto_772998 ) ) ( not ( = ?auto_772987 ?auto_772988 ) ) ( not ( = ?auto_772987 ?auto_772989 ) ) ( not ( = ?auto_772987 ?auto_772990 ) ) ( not ( = ?auto_772987 ?auto_772991 ) ) ( not ( = ?auto_772987 ?auto_772992 ) ) ( not ( = ?auto_772987 ?auto_772998 ) ) ( not ( = ?auto_772988 ?auto_772989 ) ) ( not ( = ?auto_772988 ?auto_772990 ) ) ( not ( = ?auto_772988 ?auto_772991 ) ) ( not ( = ?auto_772988 ?auto_772992 ) ) ( not ( = ?auto_772988 ?auto_772998 ) ) ( not ( = ?auto_772989 ?auto_772990 ) ) ( not ( = ?auto_772989 ?auto_772991 ) ) ( not ( = ?auto_772989 ?auto_772992 ) ) ( not ( = ?auto_772989 ?auto_772998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_772990 ?auto_772991 ?auto_772992 )
      ( MAKE-11CRATE-VERIFY ?auto_772981 ?auto_772982 ?auto_772983 ?auto_772984 ?auto_772985 ?auto_772986 ?auto_772987 ?auto_772988 ?auto_772989 ?auto_772990 ?auto_772991 ?auto_772992 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_773125 - SURFACE
      ?auto_773126 - SURFACE
      ?auto_773127 - SURFACE
      ?auto_773128 - SURFACE
      ?auto_773129 - SURFACE
      ?auto_773130 - SURFACE
      ?auto_773131 - SURFACE
      ?auto_773132 - SURFACE
      ?auto_773133 - SURFACE
      ?auto_773134 - SURFACE
      ?auto_773135 - SURFACE
      ?auto_773136 - SURFACE
    )
    :vars
    (
      ?auto_773138 - HOIST
      ?auto_773139 - PLACE
      ?auto_773142 - PLACE
      ?auto_773137 - HOIST
      ?auto_773140 - SURFACE
      ?auto_773141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_773138 ?auto_773139 ) ( IS-CRATE ?auto_773136 ) ( not ( = ?auto_773135 ?auto_773136 ) ) ( not ( = ?auto_773134 ?auto_773135 ) ) ( not ( = ?auto_773134 ?auto_773136 ) ) ( not ( = ?auto_773142 ?auto_773139 ) ) ( HOIST-AT ?auto_773137 ?auto_773142 ) ( not ( = ?auto_773138 ?auto_773137 ) ) ( AVAILABLE ?auto_773137 ) ( SURFACE-AT ?auto_773136 ?auto_773142 ) ( ON ?auto_773136 ?auto_773140 ) ( CLEAR ?auto_773136 ) ( not ( = ?auto_773135 ?auto_773140 ) ) ( not ( = ?auto_773136 ?auto_773140 ) ) ( not ( = ?auto_773134 ?auto_773140 ) ) ( TRUCK-AT ?auto_773141 ?auto_773139 ) ( SURFACE-AT ?auto_773134 ?auto_773139 ) ( CLEAR ?auto_773134 ) ( LIFTING ?auto_773138 ?auto_773135 ) ( IS-CRATE ?auto_773135 ) ( ON ?auto_773126 ?auto_773125 ) ( ON ?auto_773127 ?auto_773126 ) ( ON ?auto_773128 ?auto_773127 ) ( ON ?auto_773129 ?auto_773128 ) ( ON ?auto_773130 ?auto_773129 ) ( ON ?auto_773131 ?auto_773130 ) ( ON ?auto_773132 ?auto_773131 ) ( ON ?auto_773133 ?auto_773132 ) ( ON ?auto_773134 ?auto_773133 ) ( not ( = ?auto_773125 ?auto_773126 ) ) ( not ( = ?auto_773125 ?auto_773127 ) ) ( not ( = ?auto_773125 ?auto_773128 ) ) ( not ( = ?auto_773125 ?auto_773129 ) ) ( not ( = ?auto_773125 ?auto_773130 ) ) ( not ( = ?auto_773125 ?auto_773131 ) ) ( not ( = ?auto_773125 ?auto_773132 ) ) ( not ( = ?auto_773125 ?auto_773133 ) ) ( not ( = ?auto_773125 ?auto_773134 ) ) ( not ( = ?auto_773125 ?auto_773135 ) ) ( not ( = ?auto_773125 ?auto_773136 ) ) ( not ( = ?auto_773125 ?auto_773140 ) ) ( not ( = ?auto_773126 ?auto_773127 ) ) ( not ( = ?auto_773126 ?auto_773128 ) ) ( not ( = ?auto_773126 ?auto_773129 ) ) ( not ( = ?auto_773126 ?auto_773130 ) ) ( not ( = ?auto_773126 ?auto_773131 ) ) ( not ( = ?auto_773126 ?auto_773132 ) ) ( not ( = ?auto_773126 ?auto_773133 ) ) ( not ( = ?auto_773126 ?auto_773134 ) ) ( not ( = ?auto_773126 ?auto_773135 ) ) ( not ( = ?auto_773126 ?auto_773136 ) ) ( not ( = ?auto_773126 ?auto_773140 ) ) ( not ( = ?auto_773127 ?auto_773128 ) ) ( not ( = ?auto_773127 ?auto_773129 ) ) ( not ( = ?auto_773127 ?auto_773130 ) ) ( not ( = ?auto_773127 ?auto_773131 ) ) ( not ( = ?auto_773127 ?auto_773132 ) ) ( not ( = ?auto_773127 ?auto_773133 ) ) ( not ( = ?auto_773127 ?auto_773134 ) ) ( not ( = ?auto_773127 ?auto_773135 ) ) ( not ( = ?auto_773127 ?auto_773136 ) ) ( not ( = ?auto_773127 ?auto_773140 ) ) ( not ( = ?auto_773128 ?auto_773129 ) ) ( not ( = ?auto_773128 ?auto_773130 ) ) ( not ( = ?auto_773128 ?auto_773131 ) ) ( not ( = ?auto_773128 ?auto_773132 ) ) ( not ( = ?auto_773128 ?auto_773133 ) ) ( not ( = ?auto_773128 ?auto_773134 ) ) ( not ( = ?auto_773128 ?auto_773135 ) ) ( not ( = ?auto_773128 ?auto_773136 ) ) ( not ( = ?auto_773128 ?auto_773140 ) ) ( not ( = ?auto_773129 ?auto_773130 ) ) ( not ( = ?auto_773129 ?auto_773131 ) ) ( not ( = ?auto_773129 ?auto_773132 ) ) ( not ( = ?auto_773129 ?auto_773133 ) ) ( not ( = ?auto_773129 ?auto_773134 ) ) ( not ( = ?auto_773129 ?auto_773135 ) ) ( not ( = ?auto_773129 ?auto_773136 ) ) ( not ( = ?auto_773129 ?auto_773140 ) ) ( not ( = ?auto_773130 ?auto_773131 ) ) ( not ( = ?auto_773130 ?auto_773132 ) ) ( not ( = ?auto_773130 ?auto_773133 ) ) ( not ( = ?auto_773130 ?auto_773134 ) ) ( not ( = ?auto_773130 ?auto_773135 ) ) ( not ( = ?auto_773130 ?auto_773136 ) ) ( not ( = ?auto_773130 ?auto_773140 ) ) ( not ( = ?auto_773131 ?auto_773132 ) ) ( not ( = ?auto_773131 ?auto_773133 ) ) ( not ( = ?auto_773131 ?auto_773134 ) ) ( not ( = ?auto_773131 ?auto_773135 ) ) ( not ( = ?auto_773131 ?auto_773136 ) ) ( not ( = ?auto_773131 ?auto_773140 ) ) ( not ( = ?auto_773132 ?auto_773133 ) ) ( not ( = ?auto_773132 ?auto_773134 ) ) ( not ( = ?auto_773132 ?auto_773135 ) ) ( not ( = ?auto_773132 ?auto_773136 ) ) ( not ( = ?auto_773132 ?auto_773140 ) ) ( not ( = ?auto_773133 ?auto_773134 ) ) ( not ( = ?auto_773133 ?auto_773135 ) ) ( not ( = ?auto_773133 ?auto_773136 ) ) ( not ( = ?auto_773133 ?auto_773140 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_773134 ?auto_773135 ?auto_773136 )
      ( MAKE-11CRATE-VERIFY ?auto_773125 ?auto_773126 ?auto_773127 ?auto_773128 ?auto_773129 ?auto_773130 ?auto_773131 ?auto_773132 ?auto_773133 ?auto_773134 ?auto_773135 ?auto_773136 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_773269 - SURFACE
      ?auto_773270 - SURFACE
      ?auto_773271 - SURFACE
      ?auto_773272 - SURFACE
      ?auto_773273 - SURFACE
      ?auto_773274 - SURFACE
      ?auto_773275 - SURFACE
      ?auto_773276 - SURFACE
      ?auto_773277 - SURFACE
      ?auto_773278 - SURFACE
      ?auto_773279 - SURFACE
      ?auto_773280 - SURFACE
    )
    :vars
    (
      ?auto_773283 - HOIST
      ?auto_773285 - PLACE
      ?auto_773286 - PLACE
      ?auto_773282 - HOIST
      ?auto_773281 - SURFACE
      ?auto_773284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_773283 ?auto_773285 ) ( IS-CRATE ?auto_773280 ) ( not ( = ?auto_773279 ?auto_773280 ) ) ( not ( = ?auto_773278 ?auto_773279 ) ) ( not ( = ?auto_773278 ?auto_773280 ) ) ( not ( = ?auto_773286 ?auto_773285 ) ) ( HOIST-AT ?auto_773282 ?auto_773286 ) ( not ( = ?auto_773283 ?auto_773282 ) ) ( AVAILABLE ?auto_773282 ) ( SURFACE-AT ?auto_773280 ?auto_773286 ) ( ON ?auto_773280 ?auto_773281 ) ( CLEAR ?auto_773280 ) ( not ( = ?auto_773279 ?auto_773281 ) ) ( not ( = ?auto_773280 ?auto_773281 ) ) ( not ( = ?auto_773278 ?auto_773281 ) ) ( TRUCK-AT ?auto_773284 ?auto_773285 ) ( SURFACE-AT ?auto_773278 ?auto_773285 ) ( CLEAR ?auto_773278 ) ( IS-CRATE ?auto_773279 ) ( AVAILABLE ?auto_773283 ) ( IN ?auto_773279 ?auto_773284 ) ( ON ?auto_773270 ?auto_773269 ) ( ON ?auto_773271 ?auto_773270 ) ( ON ?auto_773272 ?auto_773271 ) ( ON ?auto_773273 ?auto_773272 ) ( ON ?auto_773274 ?auto_773273 ) ( ON ?auto_773275 ?auto_773274 ) ( ON ?auto_773276 ?auto_773275 ) ( ON ?auto_773277 ?auto_773276 ) ( ON ?auto_773278 ?auto_773277 ) ( not ( = ?auto_773269 ?auto_773270 ) ) ( not ( = ?auto_773269 ?auto_773271 ) ) ( not ( = ?auto_773269 ?auto_773272 ) ) ( not ( = ?auto_773269 ?auto_773273 ) ) ( not ( = ?auto_773269 ?auto_773274 ) ) ( not ( = ?auto_773269 ?auto_773275 ) ) ( not ( = ?auto_773269 ?auto_773276 ) ) ( not ( = ?auto_773269 ?auto_773277 ) ) ( not ( = ?auto_773269 ?auto_773278 ) ) ( not ( = ?auto_773269 ?auto_773279 ) ) ( not ( = ?auto_773269 ?auto_773280 ) ) ( not ( = ?auto_773269 ?auto_773281 ) ) ( not ( = ?auto_773270 ?auto_773271 ) ) ( not ( = ?auto_773270 ?auto_773272 ) ) ( not ( = ?auto_773270 ?auto_773273 ) ) ( not ( = ?auto_773270 ?auto_773274 ) ) ( not ( = ?auto_773270 ?auto_773275 ) ) ( not ( = ?auto_773270 ?auto_773276 ) ) ( not ( = ?auto_773270 ?auto_773277 ) ) ( not ( = ?auto_773270 ?auto_773278 ) ) ( not ( = ?auto_773270 ?auto_773279 ) ) ( not ( = ?auto_773270 ?auto_773280 ) ) ( not ( = ?auto_773270 ?auto_773281 ) ) ( not ( = ?auto_773271 ?auto_773272 ) ) ( not ( = ?auto_773271 ?auto_773273 ) ) ( not ( = ?auto_773271 ?auto_773274 ) ) ( not ( = ?auto_773271 ?auto_773275 ) ) ( not ( = ?auto_773271 ?auto_773276 ) ) ( not ( = ?auto_773271 ?auto_773277 ) ) ( not ( = ?auto_773271 ?auto_773278 ) ) ( not ( = ?auto_773271 ?auto_773279 ) ) ( not ( = ?auto_773271 ?auto_773280 ) ) ( not ( = ?auto_773271 ?auto_773281 ) ) ( not ( = ?auto_773272 ?auto_773273 ) ) ( not ( = ?auto_773272 ?auto_773274 ) ) ( not ( = ?auto_773272 ?auto_773275 ) ) ( not ( = ?auto_773272 ?auto_773276 ) ) ( not ( = ?auto_773272 ?auto_773277 ) ) ( not ( = ?auto_773272 ?auto_773278 ) ) ( not ( = ?auto_773272 ?auto_773279 ) ) ( not ( = ?auto_773272 ?auto_773280 ) ) ( not ( = ?auto_773272 ?auto_773281 ) ) ( not ( = ?auto_773273 ?auto_773274 ) ) ( not ( = ?auto_773273 ?auto_773275 ) ) ( not ( = ?auto_773273 ?auto_773276 ) ) ( not ( = ?auto_773273 ?auto_773277 ) ) ( not ( = ?auto_773273 ?auto_773278 ) ) ( not ( = ?auto_773273 ?auto_773279 ) ) ( not ( = ?auto_773273 ?auto_773280 ) ) ( not ( = ?auto_773273 ?auto_773281 ) ) ( not ( = ?auto_773274 ?auto_773275 ) ) ( not ( = ?auto_773274 ?auto_773276 ) ) ( not ( = ?auto_773274 ?auto_773277 ) ) ( not ( = ?auto_773274 ?auto_773278 ) ) ( not ( = ?auto_773274 ?auto_773279 ) ) ( not ( = ?auto_773274 ?auto_773280 ) ) ( not ( = ?auto_773274 ?auto_773281 ) ) ( not ( = ?auto_773275 ?auto_773276 ) ) ( not ( = ?auto_773275 ?auto_773277 ) ) ( not ( = ?auto_773275 ?auto_773278 ) ) ( not ( = ?auto_773275 ?auto_773279 ) ) ( not ( = ?auto_773275 ?auto_773280 ) ) ( not ( = ?auto_773275 ?auto_773281 ) ) ( not ( = ?auto_773276 ?auto_773277 ) ) ( not ( = ?auto_773276 ?auto_773278 ) ) ( not ( = ?auto_773276 ?auto_773279 ) ) ( not ( = ?auto_773276 ?auto_773280 ) ) ( not ( = ?auto_773276 ?auto_773281 ) ) ( not ( = ?auto_773277 ?auto_773278 ) ) ( not ( = ?auto_773277 ?auto_773279 ) ) ( not ( = ?auto_773277 ?auto_773280 ) ) ( not ( = ?auto_773277 ?auto_773281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_773278 ?auto_773279 ?auto_773280 )
      ( MAKE-11CRATE-VERIFY ?auto_773269 ?auto_773270 ?auto_773271 ?auto_773272 ?auto_773273 ?auto_773274 ?auto_773275 ?auto_773276 ?auto_773277 ?auto_773278 ?auto_773279 ?auto_773280 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782517 - SURFACE
      ?auto_782518 - SURFACE
      ?auto_782519 - SURFACE
      ?auto_782520 - SURFACE
      ?auto_782521 - SURFACE
      ?auto_782522 - SURFACE
      ?auto_782523 - SURFACE
      ?auto_782524 - SURFACE
      ?auto_782525 - SURFACE
      ?auto_782526 - SURFACE
      ?auto_782527 - SURFACE
      ?auto_782528 - SURFACE
      ?auto_782529 - SURFACE
    )
    :vars
    (
      ?auto_782531 - HOIST
      ?auto_782530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_782531 ?auto_782530 ) ( SURFACE-AT ?auto_782528 ?auto_782530 ) ( CLEAR ?auto_782528 ) ( LIFTING ?auto_782531 ?auto_782529 ) ( IS-CRATE ?auto_782529 ) ( not ( = ?auto_782528 ?auto_782529 ) ) ( ON ?auto_782518 ?auto_782517 ) ( ON ?auto_782519 ?auto_782518 ) ( ON ?auto_782520 ?auto_782519 ) ( ON ?auto_782521 ?auto_782520 ) ( ON ?auto_782522 ?auto_782521 ) ( ON ?auto_782523 ?auto_782522 ) ( ON ?auto_782524 ?auto_782523 ) ( ON ?auto_782525 ?auto_782524 ) ( ON ?auto_782526 ?auto_782525 ) ( ON ?auto_782527 ?auto_782526 ) ( ON ?auto_782528 ?auto_782527 ) ( not ( = ?auto_782517 ?auto_782518 ) ) ( not ( = ?auto_782517 ?auto_782519 ) ) ( not ( = ?auto_782517 ?auto_782520 ) ) ( not ( = ?auto_782517 ?auto_782521 ) ) ( not ( = ?auto_782517 ?auto_782522 ) ) ( not ( = ?auto_782517 ?auto_782523 ) ) ( not ( = ?auto_782517 ?auto_782524 ) ) ( not ( = ?auto_782517 ?auto_782525 ) ) ( not ( = ?auto_782517 ?auto_782526 ) ) ( not ( = ?auto_782517 ?auto_782527 ) ) ( not ( = ?auto_782517 ?auto_782528 ) ) ( not ( = ?auto_782517 ?auto_782529 ) ) ( not ( = ?auto_782518 ?auto_782519 ) ) ( not ( = ?auto_782518 ?auto_782520 ) ) ( not ( = ?auto_782518 ?auto_782521 ) ) ( not ( = ?auto_782518 ?auto_782522 ) ) ( not ( = ?auto_782518 ?auto_782523 ) ) ( not ( = ?auto_782518 ?auto_782524 ) ) ( not ( = ?auto_782518 ?auto_782525 ) ) ( not ( = ?auto_782518 ?auto_782526 ) ) ( not ( = ?auto_782518 ?auto_782527 ) ) ( not ( = ?auto_782518 ?auto_782528 ) ) ( not ( = ?auto_782518 ?auto_782529 ) ) ( not ( = ?auto_782519 ?auto_782520 ) ) ( not ( = ?auto_782519 ?auto_782521 ) ) ( not ( = ?auto_782519 ?auto_782522 ) ) ( not ( = ?auto_782519 ?auto_782523 ) ) ( not ( = ?auto_782519 ?auto_782524 ) ) ( not ( = ?auto_782519 ?auto_782525 ) ) ( not ( = ?auto_782519 ?auto_782526 ) ) ( not ( = ?auto_782519 ?auto_782527 ) ) ( not ( = ?auto_782519 ?auto_782528 ) ) ( not ( = ?auto_782519 ?auto_782529 ) ) ( not ( = ?auto_782520 ?auto_782521 ) ) ( not ( = ?auto_782520 ?auto_782522 ) ) ( not ( = ?auto_782520 ?auto_782523 ) ) ( not ( = ?auto_782520 ?auto_782524 ) ) ( not ( = ?auto_782520 ?auto_782525 ) ) ( not ( = ?auto_782520 ?auto_782526 ) ) ( not ( = ?auto_782520 ?auto_782527 ) ) ( not ( = ?auto_782520 ?auto_782528 ) ) ( not ( = ?auto_782520 ?auto_782529 ) ) ( not ( = ?auto_782521 ?auto_782522 ) ) ( not ( = ?auto_782521 ?auto_782523 ) ) ( not ( = ?auto_782521 ?auto_782524 ) ) ( not ( = ?auto_782521 ?auto_782525 ) ) ( not ( = ?auto_782521 ?auto_782526 ) ) ( not ( = ?auto_782521 ?auto_782527 ) ) ( not ( = ?auto_782521 ?auto_782528 ) ) ( not ( = ?auto_782521 ?auto_782529 ) ) ( not ( = ?auto_782522 ?auto_782523 ) ) ( not ( = ?auto_782522 ?auto_782524 ) ) ( not ( = ?auto_782522 ?auto_782525 ) ) ( not ( = ?auto_782522 ?auto_782526 ) ) ( not ( = ?auto_782522 ?auto_782527 ) ) ( not ( = ?auto_782522 ?auto_782528 ) ) ( not ( = ?auto_782522 ?auto_782529 ) ) ( not ( = ?auto_782523 ?auto_782524 ) ) ( not ( = ?auto_782523 ?auto_782525 ) ) ( not ( = ?auto_782523 ?auto_782526 ) ) ( not ( = ?auto_782523 ?auto_782527 ) ) ( not ( = ?auto_782523 ?auto_782528 ) ) ( not ( = ?auto_782523 ?auto_782529 ) ) ( not ( = ?auto_782524 ?auto_782525 ) ) ( not ( = ?auto_782524 ?auto_782526 ) ) ( not ( = ?auto_782524 ?auto_782527 ) ) ( not ( = ?auto_782524 ?auto_782528 ) ) ( not ( = ?auto_782524 ?auto_782529 ) ) ( not ( = ?auto_782525 ?auto_782526 ) ) ( not ( = ?auto_782525 ?auto_782527 ) ) ( not ( = ?auto_782525 ?auto_782528 ) ) ( not ( = ?auto_782525 ?auto_782529 ) ) ( not ( = ?auto_782526 ?auto_782527 ) ) ( not ( = ?auto_782526 ?auto_782528 ) ) ( not ( = ?auto_782526 ?auto_782529 ) ) ( not ( = ?auto_782527 ?auto_782528 ) ) ( not ( = ?auto_782527 ?auto_782529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_782528 ?auto_782529 )
      ( MAKE-12CRATE-VERIFY ?auto_782517 ?auto_782518 ?auto_782519 ?auto_782520 ?auto_782521 ?auto_782522 ?auto_782523 ?auto_782524 ?auto_782525 ?auto_782526 ?auto_782527 ?auto_782528 ?auto_782529 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782642 - SURFACE
      ?auto_782643 - SURFACE
      ?auto_782644 - SURFACE
      ?auto_782645 - SURFACE
      ?auto_782646 - SURFACE
      ?auto_782647 - SURFACE
      ?auto_782648 - SURFACE
      ?auto_782649 - SURFACE
      ?auto_782650 - SURFACE
      ?auto_782651 - SURFACE
      ?auto_782652 - SURFACE
      ?auto_782653 - SURFACE
      ?auto_782654 - SURFACE
    )
    :vars
    (
      ?auto_782655 - HOIST
      ?auto_782656 - PLACE
      ?auto_782657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_782655 ?auto_782656 ) ( SURFACE-AT ?auto_782653 ?auto_782656 ) ( CLEAR ?auto_782653 ) ( IS-CRATE ?auto_782654 ) ( not ( = ?auto_782653 ?auto_782654 ) ) ( TRUCK-AT ?auto_782657 ?auto_782656 ) ( AVAILABLE ?auto_782655 ) ( IN ?auto_782654 ?auto_782657 ) ( ON ?auto_782653 ?auto_782652 ) ( not ( = ?auto_782652 ?auto_782653 ) ) ( not ( = ?auto_782652 ?auto_782654 ) ) ( ON ?auto_782643 ?auto_782642 ) ( ON ?auto_782644 ?auto_782643 ) ( ON ?auto_782645 ?auto_782644 ) ( ON ?auto_782646 ?auto_782645 ) ( ON ?auto_782647 ?auto_782646 ) ( ON ?auto_782648 ?auto_782647 ) ( ON ?auto_782649 ?auto_782648 ) ( ON ?auto_782650 ?auto_782649 ) ( ON ?auto_782651 ?auto_782650 ) ( ON ?auto_782652 ?auto_782651 ) ( not ( = ?auto_782642 ?auto_782643 ) ) ( not ( = ?auto_782642 ?auto_782644 ) ) ( not ( = ?auto_782642 ?auto_782645 ) ) ( not ( = ?auto_782642 ?auto_782646 ) ) ( not ( = ?auto_782642 ?auto_782647 ) ) ( not ( = ?auto_782642 ?auto_782648 ) ) ( not ( = ?auto_782642 ?auto_782649 ) ) ( not ( = ?auto_782642 ?auto_782650 ) ) ( not ( = ?auto_782642 ?auto_782651 ) ) ( not ( = ?auto_782642 ?auto_782652 ) ) ( not ( = ?auto_782642 ?auto_782653 ) ) ( not ( = ?auto_782642 ?auto_782654 ) ) ( not ( = ?auto_782643 ?auto_782644 ) ) ( not ( = ?auto_782643 ?auto_782645 ) ) ( not ( = ?auto_782643 ?auto_782646 ) ) ( not ( = ?auto_782643 ?auto_782647 ) ) ( not ( = ?auto_782643 ?auto_782648 ) ) ( not ( = ?auto_782643 ?auto_782649 ) ) ( not ( = ?auto_782643 ?auto_782650 ) ) ( not ( = ?auto_782643 ?auto_782651 ) ) ( not ( = ?auto_782643 ?auto_782652 ) ) ( not ( = ?auto_782643 ?auto_782653 ) ) ( not ( = ?auto_782643 ?auto_782654 ) ) ( not ( = ?auto_782644 ?auto_782645 ) ) ( not ( = ?auto_782644 ?auto_782646 ) ) ( not ( = ?auto_782644 ?auto_782647 ) ) ( not ( = ?auto_782644 ?auto_782648 ) ) ( not ( = ?auto_782644 ?auto_782649 ) ) ( not ( = ?auto_782644 ?auto_782650 ) ) ( not ( = ?auto_782644 ?auto_782651 ) ) ( not ( = ?auto_782644 ?auto_782652 ) ) ( not ( = ?auto_782644 ?auto_782653 ) ) ( not ( = ?auto_782644 ?auto_782654 ) ) ( not ( = ?auto_782645 ?auto_782646 ) ) ( not ( = ?auto_782645 ?auto_782647 ) ) ( not ( = ?auto_782645 ?auto_782648 ) ) ( not ( = ?auto_782645 ?auto_782649 ) ) ( not ( = ?auto_782645 ?auto_782650 ) ) ( not ( = ?auto_782645 ?auto_782651 ) ) ( not ( = ?auto_782645 ?auto_782652 ) ) ( not ( = ?auto_782645 ?auto_782653 ) ) ( not ( = ?auto_782645 ?auto_782654 ) ) ( not ( = ?auto_782646 ?auto_782647 ) ) ( not ( = ?auto_782646 ?auto_782648 ) ) ( not ( = ?auto_782646 ?auto_782649 ) ) ( not ( = ?auto_782646 ?auto_782650 ) ) ( not ( = ?auto_782646 ?auto_782651 ) ) ( not ( = ?auto_782646 ?auto_782652 ) ) ( not ( = ?auto_782646 ?auto_782653 ) ) ( not ( = ?auto_782646 ?auto_782654 ) ) ( not ( = ?auto_782647 ?auto_782648 ) ) ( not ( = ?auto_782647 ?auto_782649 ) ) ( not ( = ?auto_782647 ?auto_782650 ) ) ( not ( = ?auto_782647 ?auto_782651 ) ) ( not ( = ?auto_782647 ?auto_782652 ) ) ( not ( = ?auto_782647 ?auto_782653 ) ) ( not ( = ?auto_782647 ?auto_782654 ) ) ( not ( = ?auto_782648 ?auto_782649 ) ) ( not ( = ?auto_782648 ?auto_782650 ) ) ( not ( = ?auto_782648 ?auto_782651 ) ) ( not ( = ?auto_782648 ?auto_782652 ) ) ( not ( = ?auto_782648 ?auto_782653 ) ) ( not ( = ?auto_782648 ?auto_782654 ) ) ( not ( = ?auto_782649 ?auto_782650 ) ) ( not ( = ?auto_782649 ?auto_782651 ) ) ( not ( = ?auto_782649 ?auto_782652 ) ) ( not ( = ?auto_782649 ?auto_782653 ) ) ( not ( = ?auto_782649 ?auto_782654 ) ) ( not ( = ?auto_782650 ?auto_782651 ) ) ( not ( = ?auto_782650 ?auto_782652 ) ) ( not ( = ?auto_782650 ?auto_782653 ) ) ( not ( = ?auto_782650 ?auto_782654 ) ) ( not ( = ?auto_782651 ?auto_782652 ) ) ( not ( = ?auto_782651 ?auto_782653 ) ) ( not ( = ?auto_782651 ?auto_782654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782652 ?auto_782653 ?auto_782654 )
      ( MAKE-12CRATE-VERIFY ?auto_782642 ?auto_782643 ?auto_782644 ?auto_782645 ?auto_782646 ?auto_782647 ?auto_782648 ?auto_782649 ?auto_782650 ?auto_782651 ?auto_782652 ?auto_782653 ?auto_782654 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782780 - SURFACE
      ?auto_782781 - SURFACE
      ?auto_782782 - SURFACE
      ?auto_782783 - SURFACE
      ?auto_782784 - SURFACE
      ?auto_782785 - SURFACE
      ?auto_782786 - SURFACE
      ?auto_782787 - SURFACE
      ?auto_782788 - SURFACE
      ?auto_782789 - SURFACE
      ?auto_782790 - SURFACE
      ?auto_782791 - SURFACE
      ?auto_782792 - SURFACE
    )
    :vars
    (
      ?auto_782795 - HOIST
      ?auto_782793 - PLACE
      ?auto_782796 - TRUCK
      ?auto_782794 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_782795 ?auto_782793 ) ( SURFACE-AT ?auto_782791 ?auto_782793 ) ( CLEAR ?auto_782791 ) ( IS-CRATE ?auto_782792 ) ( not ( = ?auto_782791 ?auto_782792 ) ) ( AVAILABLE ?auto_782795 ) ( IN ?auto_782792 ?auto_782796 ) ( ON ?auto_782791 ?auto_782790 ) ( not ( = ?auto_782790 ?auto_782791 ) ) ( not ( = ?auto_782790 ?auto_782792 ) ) ( TRUCK-AT ?auto_782796 ?auto_782794 ) ( not ( = ?auto_782794 ?auto_782793 ) ) ( ON ?auto_782781 ?auto_782780 ) ( ON ?auto_782782 ?auto_782781 ) ( ON ?auto_782783 ?auto_782782 ) ( ON ?auto_782784 ?auto_782783 ) ( ON ?auto_782785 ?auto_782784 ) ( ON ?auto_782786 ?auto_782785 ) ( ON ?auto_782787 ?auto_782786 ) ( ON ?auto_782788 ?auto_782787 ) ( ON ?auto_782789 ?auto_782788 ) ( ON ?auto_782790 ?auto_782789 ) ( not ( = ?auto_782780 ?auto_782781 ) ) ( not ( = ?auto_782780 ?auto_782782 ) ) ( not ( = ?auto_782780 ?auto_782783 ) ) ( not ( = ?auto_782780 ?auto_782784 ) ) ( not ( = ?auto_782780 ?auto_782785 ) ) ( not ( = ?auto_782780 ?auto_782786 ) ) ( not ( = ?auto_782780 ?auto_782787 ) ) ( not ( = ?auto_782780 ?auto_782788 ) ) ( not ( = ?auto_782780 ?auto_782789 ) ) ( not ( = ?auto_782780 ?auto_782790 ) ) ( not ( = ?auto_782780 ?auto_782791 ) ) ( not ( = ?auto_782780 ?auto_782792 ) ) ( not ( = ?auto_782781 ?auto_782782 ) ) ( not ( = ?auto_782781 ?auto_782783 ) ) ( not ( = ?auto_782781 ?auto_782784 ) ) ( not ( = ?auto_782781 ?auto_782785 ) ) ( not ( = ?auto_782781 ?auto_782786 ) ) ( not ( = ?auto_782781 ?auto_782787 ) ) ( not ( = ?auto_782781 ?auto_782788 ) ) ( not ( = ?auto_782781 ?auto_782789 ) ) ( not ( = ?auto_782781 ?auto_782790 ) ) ( not ( = ?auto_782781 ?auto_782791 ) ) ( not ( = ?auto_782781 ?auto_782792 ) ) ( not ( = ?auto_782782 ?auto_782783 ) ) ( not ( = ?auto_782782 ?auto_782784 ) ) ( not ( = ?auto_782782 ?auto_782785 ) ) ( not ( = ?auto_782782 ?auto_782786 ) ) ( not ( = ?auto_782782 ?auto_782787 ) ) ( not ( = ?auto_782782 ?auto_782788 ) ) ( not ( = ?auto_782782 ?auto_782789 ) ) ( not ( = ?auto_782782 ?auto_782790 ) ) ( not ( = ?auto_782782 ?auto_782791 ) ) ( not ( = ?auto_782782 ?auto_782792 ) ) ( not ( = ?auto_782783 ?auto_782784 ) ) ( not ( = ?auto_782783 ?auto_782785 ) ) ( not ( = ?auto_782783 ?auto_782786 ) ) ( not ( = ?auto_782783 ?auto_782787 ) ) ( not ( = ?auto_782783 ?auto_782788 ) ) ( not ( = ?auto_782783 ?auto_782789 ) ) ( not ( = ?auto_782783 ?auto_782790 ) ) ( not ( = ?auto_782783 ?auto_782791 ) ) ( not ( = ?auto_782783 ?auto_782792 ) ) ( not ( = ?auto_782784 ?auto_782785 ) ) ( not ( = ?auto_782784 ?auto_782786 ) ) ( not ( = ?auto_782784 ?auto_782787 ) ) ( not ( = ?auto_782784 ?auto_782788 ) ) ( not ( = ?auto_782784 ?auto_782789 ) ) ( not ( = ?auto_782784 ?auto_782790 ) ) ( not ( = ?auto_782784 ?auto_782791 ) ) ( not ( = ?auto_782784 ?auto_782792 ) ) ( not ( = ?auto_782785 ?auto_782786 ) ) ( not ( = ?auto_782785 ?auto_782787 ) ) ( not ( = ?auto_782785 ?auto_782788 ) ) ( not ( = ?auto_782785 ?auto_782789 ) ) ( not ( = ?auto_782785 ?auto_782790 ) ) ( not ( = ?auto_782785 ?auto_782791 ) ) ( not ( = ?auto_782785 ?auto_782792 ) ) ( not ( = ?auto_782786 ?auto_782787 ) ) ( not ( = ?auto_782786 ?auto_782788 ) ) ( not ( = ?auto_782786 ?auto_782789 ) ) ( not ( = ?auto_782786 ?auto_782790 ) ) ( not ( = ?auto_782786 ?auto_782791 ) ) ( not ( = ?auto_782786 ?auto_782792 ) ) ( not ( = ?auto_782787 ?auto_782788 ) ) ( not ( = ?auto_782787 ?auto_782789 ) ) ( not ( = ?auto_782787 ?auto_782790 ) ) ( not ( = ?auto_782787 ?auto_782791 ) ) ( not ( = ?auto_782787 ?auto_782792 ) ) ( not ( = ?auto_782788 ?auto_782789 ) ) ( not ( = ?auto_782788 ?auto_782790 ) ) ( not ( = ?auto_782788 ?auto_782791 ) ) ( not ( = ?auto_782788 ?auto_782792 ) ) ( not ( = ?auto_782789 ?auto_782790 ) ) ( not ( = ?auto_782789 ?auto_782791 ) ) ( not ( = ?auto_782789 ?auto_782792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782790 ?auto_782791 ?auto_782792 )
      ( MAKE-12CRATE-VERIFY ?auto_782780 ?auto_782781 ?auto_782782 ?auto_782783 ?auto_782784 ?auto_782785 ?auto_782786 ?auto_782787 ?auto_782788 ?auto_782789 ?auto_782790 ?auto_782791 ?auto_782792 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_782930 - SURFACE
      ?auto_782931 - SURFACE
      ?auto_782932 - SURFACE
      ?auto_782933 - SURFACE
      ?auto_782934 - SURFACE
      ?auto_782935 - SURFACE
      ?auto_782936 - SURFACE
      ?auto_782937 - SURFACE
      ?auto_782938 - SURFACE
      ?auto_782939 - SURFACE
      ?auto_782940 - SURFACE
      ?auto_782941 - SURFACE
      ?auto_782942 - SURFACE
    )
    :vars
    (
      ?auto_782947 - HOIST
      ?auto_782946 - PLACE
      ?auto_782943 - TRUCK
      ?auto_782945 - PLACE
      ?auto_782944 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_782947 ?auto_782946 ) ( SURFACE-AT ?auto_782941 ?auto_782946 ) ( CLEAR ?auto_782941 ) ( IS-CRATE ?auto_782942 ) ( not ( = ?auto_782941 ?auto_782942 ) ) ( AVAILABLE ?auto_782947 ) ( ON ?auto_782941 ?auto_782940 ) ( not ( = ?auto_782940 ?auto_782941 ) ) ( not ( = ?auto_782940 ?auto_782942 ) ) ( TRUCK-AT ?auto_782943 ?auto_782945 ) ( not ( = ?auto_782945 ?auto_782946 ) ) ( HOIST-AT ?auto_782944 ?auto_782945 ) ( LIFTING ?auto_782944 ?auto_782942 ) ( not ( = ?auto_782947 ?auto_782944 ) ) ( ON ?auto_782931 ?auto_782930 ) ( ON ?auto_782932 ?auto_782931 ) ( ON ?auto_782933 ?auto_782932 ) ( ON ?auto_782934 ?auto_782933 ) ( ON ?auto_782935 ?auto_782934 ) ( ON ?auto_782936 ?auto_782935 ) ( ON ?auto_782937 ?auto_782936 ) ( ON ?auto_782938 ?auto_782937 ) ( ON ?auto_782939 ?auto_782938 ) ( ON ?auto_782940 ?auto_782939 ) ( not ( = ?auto_782930 ?auto_782931 ) ) ( not ( = ?auto_782930 ?auto_782932 ) ) ( not ( = ?auto_782930 ?auto_782933 ) ) ( not ( = ?auto_782930 ?auto_782934 ) ) ( not ( = ?auto_782930 ?auto_782935 ) ) ( not ( = ?auto_782930 ?auto_782936 ) ) ( not ( = ?auto_782930 ?auto_782937 ) ) ( not ( = ?auto_782930 ?auto_782938 ) ) ( not ( = ?auto_782930 ?auto_782939 ) ) ( not ( = ?auto_782930 ?auto_782940 ) ) ( not ( = ?auto_782930 ?auto_782941 ) ) ( not ( = ?auto_782930 ?auto_782942 ) ) ( not ( = ?auto_782931 ?auto_782932 ) ) ( not ( = ?auto_782931 ?auto_782933 ) ) ( not ( = ?auto_782931 ?auto_782934 ) ) ( not ( = ?auto_782931 ?auto_782935 ) ) ( not ( = ?auto_782931 ?auto_782936 ) ) ( not ( = ?auto_782931 ?auto_782937 ) ) ( not ( = ?auto_782931 ?auto_782938 ) ) ( not ( = ?auto_782931 ?auto_782939 ) ) ( not ( = ?auto_782931 ?auto_782940 ) ) ( not ( = ?auto_782931 ?auto_782941 ) ) ( not ( = ?auto_782931 ?auto_782942 ) ) ( not ( = ?auto_782932 ?auto_782933 ) ) ( not ( = ?auto_782932 ?auto_782934 ) ) ( not ( = ?auto_782932 ?auto_782935 ) ) ( not ( = ?auto_782932 ?auto_782936 ) ) ( not ( = ?auto_782932 ?auto_782937 ) ) ( not ( = ?auto_782932 ?auto_782938 ) ) ( not ( = ?auto_782932 ?auto_782939 ) ) ( not ( = ?auto_782932 ?auto_782940 ) ) ( not ( = ?auto_782932 ?auto_782941 ) ) ( not ( = ?auto_782932 ?auto_782942 ) ) ( not ( = ?auto_782933 ?auto_782934 ) ) ( not ( = ?auto_782933 ?auto_782935 ) ) ( not ( = ?auto_782933 ?auto_782936 ) ) ( not ( = ?auto_782933 ?auto_782937 ) ) ( not ( = ?auto_782933 ?auto_782938 ) ) ( not ( = ?auto_782933 ?auto_782939 ) ) ( not ( = ?auto_782933 ?auto_782940 ) ) ( not ( = ?auto_782933 ?auto_782941 ) ) ( not ( = ?auto_782933 ?auto_782942 ) ) ( not ( = ?auto_782934 ?auto_782935 ) ) ( not ( = ?auto_782934 ?auto_782936 ) ) ( not ( = ?auto_782934 ?auto_782937 ) ) ( not ( = ?auto_782934 ?auto_782938 ) ) ( not ( = ?auto_782934 ?auto_782939 ) ) ( not ( = ?auto_782934 ?auto_782940 ) ) ( not ( = ?auto_782934 ?auto_782941 ) ) ( not ( = ?auto_782934 ?auto_782942 ) ) ( not ( = ?auto_782935 ?auto_782936 ) ) ( not ( = ?auto_782935 ?auto_782937 ) ) ( not ( = ?auto_782935 ?auto_782938 ) ) ( not ( = ?auto_782935 ?auto_782939 ) ) ( not ( = ?auto_782935 ?auto_782940 ) ) ( not ( = ?auto_782935 ?auto_782941 ) ) ( not ( = ?auto_782935 ?auto_782942 ) ) ( not ( = ?auto_782936 ?auto_782937 ) ) ( not ( = ?auto_782936 ?auto_782938 ) ) ( not ( = ?auto_782936 ?auto_782939 ) ) ( not ( = ?auto_782936 ?auto_782940 ) ) ( not ( = ?auto_782936 ?auto_782941 ) ) ( not ( = ?auto_782936 ?auto_782942 ) ) ( not ( = ?auto_782937 ?auto_782938 ) ) ( not ( = ?auto_782937 ?auto_782939 ) ) ( not ( = ?auto_782937 ?auto_782940 ) ) ( not ( = ?auto_782937 ?auto_782941 ) ) ( not ( = ?auto_782937 ?auto_782942 ) ) ( not ( = ?auto_782938 ?auto_782939 ) ) ( not ( = ?auto_782938 ?auto_782940 ) ) ( not ( = ?auto_782938 ?auto_782941 ) ) ( not ( = ?auto_782938 ?auto_782942 ) ) ( not ( = ?auto_782939 ?auto_782940 ) ) ( not ( = ?auto_782939 ?auto_782941 ) ) ( not ( = ?auto_782939 ?auto_782942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_782940 ?auto_782941 ?auto_782942 )
      ( MAKE-12CRATE-VERIFY ?auto_782930 ?auto_782931 ?auto_782932 ?auto_782933 ?auto_782934 ?auto_782935 ?auto_782936 ?auto_782937 ?auto_782938 ?auto_782939 ?auto_782940 ?auto_782941 ?auto_782942 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783092 - SURFACE
      ?auto_783093 - SURFACE
      ?auto_783094 - SURFACE
      ?auto_783095 - SURFACE
      ?auto_783096 - SURFACE
      ?auto_783097 - SURFACE
      ?auto_783098 - SURFACE
      ?auto_783099 - SURFACE
      ?auto_783100 - SURFACE
      ?auto_783101 - SURFACE
      ?auto_783102 - SURFACE
      ?auto_783103 - SURFACE
      ?auto_783104 - SURFACE
    )
    :vars
    (
      ?auto_783107 - HOIST
      ?auto_783108 - PLACE
      ?auto_783106 - TRUCK
      ?auto_783110 - PLACE
      ?auto_783105 - HOIST
      ?auto_783109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_783107 ?auto_783108 ) ( SURFACE-AT ?auto_783103 ?auto_783108 ) ( CLEAR ?auto_783103 ) ( IS-CRATE ?auto_783104 ) ( not ( = ?auto_783103 ?auto_783104 ) ) ( AVAILABLE ?auto_783107 ) ( ON ?auto_783103 ?auto_783102 ) ( not ( = ?auto_783102 ?auto_783103 ) ) ( not ( = ?auto_783102 ?auto_783104 ) ) ( TRUCK-AT ?auto_783106 ?auto_783110 ) ( not ( = ?auto_783110 ?auto_783108 ) ) ( HOIST-AT ?auto_783105 ?auto_783110 ) ( not ( = ?auto_783107 ?auto_783105 ) ) ( AVAILABLE ?auto_783105 ) ( SURFACE-AT ?auto_783104 ?auto_783110 ) ( ON ?auto_783104 ?auto_783109 ) ( CLEAR ?auto_783104 ) ( not ( = ?auto_783103 ?auto_783109 ) ) ( not ( = ?auto_783104 ?auto_783109 ) ) ( not ( = ?auto_783102 ?auto_783109 ) ) ( ON ?auto_783093 ?auto_783092 ) ( ON ?auto_783094 ?auto_783093 ) ( ON ?auto_783095 ?auto_783094 ) ( ON ?auto_783096 ?auto_783095 ) ( ON ?auto_783097 ?auto_783096 ) ( ON ?auto_783098 ?auto_783097 ) ( ON ?auto_783099 ?auto_783098 ) ( ON ?auto_783100 ?auto_783099 ) ( ON ?auto_783101 ?auto_783100 ) ( ON ?auto_783102 ?auto_783101 ) ( not ( = ?auto_783092 ?auto_783093 ) ) ( not ( = ?auto_783092 ?auto_783094 ) ) ( not ( = ?auto_783092 ?auto_783095 ) ) ( not ( = ?auto_783092 ?auto_783096 ) ) ( not ( = ?auto_783092 ?auto_783097 ) ) ( not ( = ?auto_783092 ?auto_783098 ) ) ( not ( = ?auto_783092 ?auto_783099 ) ) ( not ( = ?auto_783092 ?auto_783100 ) ) ( not ( = ?auto_783092 ?auto_783101 ) ) ( not ( = ?auto_783092 ?auto_783102 ) ) ( not ( = ?auto_783092 ?auto_783103 ) ) ( not ( = ?auto_783092 ?auto_783104 ) ) ( not ( = ?auto_783092 ?auto_783109 ) ) ( not ( = ?auto_783093 ?auto_783094 ) ) ( not ( = ?auto_783093 ?auto_783095 ) ) ( not ( = ?auto_783093 ?auto_783096 ) ) ( not ( = ?auto_783093 ?auto_783097 ) ) ( not ( = ?auto_783093 ?auto_783098 ) ) ( not ( = ?auto_783093 ?auto_783099 ) ) ( not ( = ?auto_783093 ?auto_783100 ) ) ( not ( = ?auto_783093 ?auto_783101 ) ) ( not ( = ?auto_783093 ?auto_783102 ) ) ( not ( = ?auto_783093 ?auto_783103 ) ) ( not ( = ?auto_783093 ?auto_783104 ) ) ( not ( = ?auto_783093 ?auto_783109 ) ) ( not ( = ?auto_783094 ?auto_783095 ) ) ( not ( = ?auto_783094 ?auto_783096 ) ) ( not ( = ?auto_783094 ?auto_783097 ) ) ( not ( = ?auto_783094 ?auto_783098 ) ) ( not ( = ?auto_783094 ?auto_783099 ) ) ( not ( = ?auto_783094 ?auto_783100 ) ) ( not ( = ?auto_783094 ?auto_783101 ) ) ( not ( = ?auto_783094 ?auto_783102 ) ) ( not ( = ?auto_783094 ?auto_783103 ) ) ( not ( = ?auto_783094 ?auto_783104 ) ) ( not ( = ?auto_783094 ?auto_783109 ) ) ( not ( = ?auto_783095 ?auto_783096 ) ) ( not ( = ?auto_783095 ?auto_783097 ) ) ( not ( = ?auto_783095 ?auto_783098 ) ) ( not ( = ?auto_783095 ?auto_783099 ) ) ( not ( = ?auto_783095 ?auto_783100 ) ) ( not ( = ?auto_783095 ?auto_783101 ) ) ( not ( = ?auto_783095 ?auto_783102 ) ) ( not ( = ?auto_783095 ?auto_783103 ) ) ( not ( = ?auto_783095 ?auto_783104 ) ) ( not ( = ?auto_783095 ?auto_783109 ) ) ( not ( = ?auto_783096 ?auto_783097 ) ) ( not ( = ?auto_783096 ?auto_783098 ) ) ( not ( = ?auto_783096 ?auto_783099 ) ) ( not ( = ?auto_783096 ?auto_783100 ) ) ( not ( = ?auto_783096 ?auto_783101 ) ) ( not ( = ?auto_783096 ?auto_783102 ) ) ( not ( = ?auto_783096 ?auto_783103 ) ) ( not ( = ?auto_783096 ?auto_783104 ) ) ( not ( = ?auto_783096 ?auto_783109 ) ) ( not ( = ?auto_783097 ?auto_783098 ) ) ( not ( = ?auto_783097 ?auto_783099 ) ) ( not ( = ?auto_783097 ?auto_783100 ) ) ( not ( = ?auto_783097 ?auto_783101 ) ) ( not ( = ?auto_783097 ?auto_783102 ) ) ( not ( = ?auto_783097 ?auto_783103 ) ) ( not ( = ?auto_783097 ?auto_783104 ) ) ( not ( = ?auto_783097 ?auto_783109 ) ) ( not ( = ?auto_783098 ?auto_783099 ) ) ( not ( = ?auto_783098 ?auto_783100 ) ) ( not ( = ?auto_783098 ?auto_783101 ) ) ( not ( = ?auto_783098 ?auto_783102 ) ) ( not ( = ?auto_783098 ?auto_783103 ) ) ( not ( = ?auto_783098 ?auto_783104 ) ) ( not ( = ?auto_783098 ?auto_783109 ) ) ( not ( = ?auto_783099 ?auto_783100 ) ) ( not ( = ?auto_783099 ?auto_783101 ) ) ( not ( = ?auto_783099 ?auto_783102 ) ) ( not ( = ?auto_783099 ?auto_783103 ) ) ( not ( = ?auto_783099 ?auto_783104 ) ) ( not ( = ?auto_783099 ?auto_783109 ) ) ( not ( = ?auto_783100 ?auto_783101 ) ) ( not ( = ?auto_783100 ?auto_783102 ) ) ( not ( = ?auto_783100 ?auto_783103 ) ) ( not ( = ?auto_783100 ?auto_783104 ) ) ( not ( = ?auto_783100 ?auto_783109 ) ) ( not ( = ?auto_783101 ?auto_783102 ) ) ( not ( = ?auto_783101 ?auto_783103 ) ) ( not ( = ?auto_783101 ?auto_783104 ) ) ( not ( = ?auto_783101 ?auto_783109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783102 ?auto_783103 ?auto_783104 )
      ( MAKE-12CRATE-VERIFY ?auto_783092 ?auto_783093 ?auto_783094 ?auto_783095 ?auto_783096 ?auto_783097 ?auto_783098 ?auto_783099 ?auto_783100 ?auto_783101 ?auto_783102 ?auto_783103 ?auto_783104 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783255 - SURFACE
      ?auto_783256 - SURFACE
      ?auto_783257 - SURFACE
      ?auto_783258 - SURFACE
      ?auto_783259 - SURFACE
      ?auto_783260 - SURFACE
      ?auto_783261 - SURFACE
      ?auto_783262 - SURFACE
      ?auto_783263 - SURFACE
      ?auto_783264 - SURFACE
      ?auto_783265 - SURFACE
      ?auto_783266 - SURFACE
      ?auto_783267 - SURFACE
    )
    :vars
    (
      ?auto_783270 - HOIST
      ?auto_783269 - PLACE
      ?auto_783271 - PLACE
      ?auto_783268 - HOIST
      ?auto_783272 - SURFACE
      ?auto_783273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_783270 ?auto_783269 ) ( SURFACE-AT ?auto_783266 ?auto_783269 ) ( CLEAR ?auto_783266 ) ( IS-CRATE ?auto_783267 ) ( not ( = ?auto_783266 ?auto_783267 ) ) ( AVAILABLE ?auto_783270 ) ( ON ?auto_783266 ?auto_783265 ) ( not ( = ?auto_783265 ?auto_783266 ) ) ( not ( = ?auto_783265 ?auto_783267 ) ) ( not ( = ?auto_783271 ?auto_783269 ) ) ( HOIST-AT ?auto_783268 ?auto_783271 ) ( not ( = ?auto_783270 ?auto_783268 ) ) ( AVAILABLE ?auto_783268 ) ( SURFACE-AT ?auto_783267 ?auto_783271 ) ( ON ?auto_783267 ?auto_783272 ) ( CLEAR ?auto_783267 ) ( not ( = ?auto_783266 ?auto_783272 ) ) ( not ( = ?auto_783267 ?auto_783272 ) ) ( not ( = ?auto_783265 ?auto_783272 ) ) ( TRUCK-AT ?auto_783273 ?auto_783269 ) ( ON ?auto_783256 ?auto_783255 ) ( ON ?auto_783257 ?auto_783256 ) ( ON ?auto_783258 ?auto_783257 ) ( ON ?auto_783259 ?auto_783258 ) ( ON ?auto_783260 ?auto_783259 ) ( ON ?auto_783261 ?auto_783260 ) ( ON ?auto_783262 ?auto_783261 ) ( ON ?auto_783263 ?auto_783262 ) ( ON ?auto_783264 ?auto_783263 ) ( ON ?auto_783265 ?auto_783264 ) ( not ( = ?auto_783255 ?auto_783256 ) ) ( not ( = ?auto_783255 ?auto_783257 ) ) ( not ( = ?auto_783255 ?auto_783258 ) ) ( not ( = ?auto_783255 ?auto_783259 ) ) ( not ( = ?auto_783255 ?auto_783260 ) ) ( not ( = ?auto_783255 ?auto_783261 ) ) ( not ( = ?auto_783255 ?auto_783262 ) ) ( not ( = ?auto_783255 ?auto_783263 ) ) ( not ( = ?auto_783255 ?auto_783264 ) ) ( not ( = ?auto_783255 ?auto_783265 ) ) ( not ( = ?auto_783255 ?auto_783266 ) ) ( not ( = ?auto_783255 ?auto_783267 ) ) ( not ( = ?auto_783255 ?auto_783272 ) ) ( not ( = ?auto_783256 ?auto_783257 ) ) ( not ( = ?auto_783256 ?auto_783258 ) ) ( not ( = ?auto_783256 ?auto_783259 ) ) ( not ( = ?auto_783256 ?auto_783260 ) ) ( not ( = ?auto_783256 ?auto_783261 ) ) ( not ( = ?auto_783256 ?auto_783262 ) ) ( not ( = ?auto_783256 ?auto_783263 ) ) ( not ( = ?auto_783256 ?auto_783264 ) ) ( not ( = ?auto_783256 ?auto_783265 ) ) ( not ( = ?auto_783256 ?auto_783266 ) ) ( not ( = ?auto_783256 ?auto_783267 ) ) ( not ( = ?auto_783256 ?auto_783272 ) ) ( not ( = ?auto_783257 ?auto_783258 ) ) ( not ( = ?auto_783257 ?auto_783259 ) ) ( not ( = ?auto_783257 ?auto_783260 ) ) ( not ( = ?auto_783257 ?auto_783261 ) ) ( not ( = ?auto_783257 ?auto_783262 ) ) ( not ( = ?auto_783257 ?auto_783263 ) ) ( not ( = ?auto_783257 ?auto_783264 ) ) ( not ( = ?auto_783257 ?auto_783265 ) ) ( not ( = ?auto_783257 ?auto_783266 ) ) ( not ( = ?auto_783257 ?auto_783267 ) ) ( not ( = ?auto_783257 ?auto_783272 ) ) ( not ( = ?auto_783258 ?auto_783259 ) ) ( not ( = ?auto_783258 ?auto_783260 ) ) ( not ( = ?auto_783258 ?auto_783261 ) ) ( not ( = ?auto_783258 ?auto_783262 ) ) ( not ( = ?auto_783258 ?auto_783263 ) ) ( not ( = ?auto_783258 ?auto_783264 ) ) ( not ( = ?auto_783258 ?auto_783265 ) ) ( not ( = ?auto_783258 ?auto_783266 ) ) ( not ( = ?auto_783258 ?auto_783267 ) ) ( not ( = ?auto_783258 ?auto_783272 ) ) ( not ( = ?auto_783259 ?auto_783260 ) ) ( not ( = ?auto_783259 ?auto_783261 ) ) ( not ( = ?auto_783259 ?auto_783262 ) ) ( not ( = ?auto_783259 ?auto_783263 ) ) ( not ( = ?auto_783259 ?auto_783264 ) ) ( not ( = ?auto_783259 ?auto_783265 ) ) ( not ( = ?auto_783259 ?auto_783266 ) ) ( not ( = ?auto_783259 ?auto_783267 ) ) ( not ( = ?auto_783259 ?auto_783272 ) ) ( not ( = ?auto_783260 ?auto_783261 ) ) ( not ( = ?auto_783260 ?auto_783262 ) ) ( not ( = ?auto_783260 ?auto_783263 ) ) ( not ( = ?auto_783260 ?auto_783264 ) ) ( not ( = ?auto_783260 ?auto_783265 ) ) ( not ( = ?auto_783260 ?auto_783266 ) ) ( not ( = ?auto_783260 ?auto_783267 ) ) ( not ( = ?auto_783260 ?auto_783272 ) ) ( not ( = ?auto_783261 ?auto_783262 ) ) ( not ( = ?auto_783261 ?auto_783263 ) ) ( not ( = ?auto_783261 ?auto_783264 ) ) ( not ( = ?auto_783261 ?auto_783265 ) ) ( not ( = ?auto_783261 ?auto_783266 ) ) ( not ( = ?auto_783261 ?auto_783267 ) ) ( not ( = ?auto_783261 ?auto_783272 ) ) ( not ( = ?auto_783262 ?auto_783263 ) ) ( not ( = ?auto_783262 ?auto_783264 ) ) ( not ( = ?auto_783262 ?auto_783265 ) ) ( not ( = ?auto_783262 ?auto_783266 ) ) ( not ( = ?auto_783262 ?auto_783267 ) ) ( not ( = ?auto_783262 ?auto_783272 ) ) ( not ( = ?auto_783263 ?auto_783264 ) ) ( not ( = ?auto_783263 ?auto_783265 ) ) ( not ( = ?auto_783263 ?auto_783266 ) ) ( not ( = ?auto_783263 ?auto_783267 ) ) ( not ( = ?auto_783263 ?auto_783272 ) ) ( not ( = ?auto_783264 ?auto_783265 ) ) ( not ( = ?auto_783264 ?auto_783266 ) ) ( not ( = ?auto_783264 ?auto_783267 ) ) ( not ( = ?auto_783264 ?auto_783272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783265 ?auto_783266 ?auto_783267 )
      ( MAKE-12CRATE-VERIFY ?auto_783255 ?auto_783256 ?auto_783257 ?auto_783258 ?auto_783259 ?auto_783260 ?auto_783261 ?auto_783262 ?auto_783263 ?auto_783264 ?auto_783265 ?auto_783266 ?auto_783267 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783418 - SURFACE
      ?auto_783419 - SURFACE
      ?auto_783420 - SURFACE
      ?auto_783421 - SURFACE
      ?auto_783422 - SURFACE
      ?auto_783423 - SURFACE
      ?auto_783424 - SURFACE
      ?auto_783425 - SURFACE
      ?auto_783426 - SURFACE
      ?auto_783427 - SURFACE
      ?auto_783428 - SURFACE
      ?auto_783429 - SURFACE
      ?auto_783430 - SURFACE
    )
    :vars
    (
      ?auto_783431 - HOIST
      ?auto_783433 - PLACE
      ?auto_783435 - PLACE
      ?auto_783436 - HOIST
      ?auto_783432 - SURFACE
      ?auto_783434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_783431 ?auto_783433 ) ( IS-CRATE ?auto_783430 ) ( not ( = ?auto_783429 ?auto_783430 ) ) ( not ( = ?auto_783428 ?auto_783429 ) ) ( not ( = ?auto_783428 ?auto_783430 ) ) ( not ( = ?auto_783435 ?auto_783433 ) ) ( HOIST-AT ?auto_783436 ?auto_783435 ) ( not ( = ?auto_783431 ?auto_783436 ) ) ( AVAILABLE ?auto_783436 ) ( SURFACE-AT ?auto_783430 ?auto_783435 ) ( ON ?auto_783430 ?auto_783432 ) ( CLEAR ?auto_783430 ) ( not ( = ?auto_783429 ?auto_783432 ) ) ( not ( = ?auto_783430 ?auto_783432 ) ) ( not ( = ?auto_783428 ?auto_783432 ) ) ( TRUCK-AT ?auto_783434 ?auto_783433 ) ( SURFACE-AT ?auto_783428 ?auto_783433 ) ( CLEAR ?auto_783428 ) ( LIFTING ?auto_783431 ?auto_783429 ) ( IS-CRATE ?auto_783429 ) ( ON ?auto_783419 ?auto_783418 ) ( ON ?auto_783420 ?auto_783419 ) ( ON ?auto_783421 ?auto_783420 ) ( ON ?auto_783422 ?auto_783421 ) ( ON ?auto_783423 ?auto_783422 ) ( ON ?auto_783424 ?auto_783423 ) ( ON ?auto_783425 ?auto_783424 ) ( ON ?auto_783426 ?auto_783425 ) ( ON ?auto_783427 ?auto_783426 ) ( ON ?auto_783428 ?auto_783427 ) ( not ( = ?auto_783418 ?auto_783419 ) ) ( not ( = ?auto_783418 ?auto_783420 ) ) ( not ( = ?auto_783418 ?auto_783421 ) ) ( not ( = ?auto_783418 ?auto_783422 ) ) ( not ( = ?auto_783418 ?auto_783423 ) ) ( not ( = ?auto_783418 ?auto_783424 ) ) ( not ( = ?auto_783418 ?auto_783425 ) ) ( not ( = ?auto_783418 ?auto_783426 ) ) ( not ( = ?auto_783418 ?auto_783427 ) ) ( not ( = ?auto_783418 ?auto_783428 ) ) ( not ( = ?auto_783418 ?auto_783429 ) ) ( not ( = ?auto_783418 ?auto_783430 ) ) ( not ( = ?auto_783418 ?auto_783432 ) ) ( not ( = ?auto_783419 ?auto_783420 ) ) ( not ( = ?auto_783419 ?auto_783421 ) ) ( not ( = ?auto_783419 ?auto_783422 ) ) ( not ( = ?auto_783419 ?auto_783423 ) ) ( not ( = ?auto_783419 ?auto_783424 ) ) ( not ( = ?auto_783419 ?auto_783425 ) ) ( not ( = ?auto_783419 ?auto_783426 ) ) ( not ( = ?auto_783419 ?auto_783427 ) ) ( not ( = ?auto_783419 ?auto_783428 ) ) ( not ( = ?auto_783419 ?auto_783429 ) ) ( not ( = ?auto_783419 ?auto_783430 ) ) ( not ( = ?auto_783419 ?auto_783432 ) ) ( not ( = ?auto_783420 ?auto_783421 ) ) ( not ( = ?auto_783420 ?auto_783422 ) ) ( not ( = ?auto_783420 ?auto_783423 ) ) ( not ( = ?auto_783420 ?auto_783424 ) ) ( not ( = ?auto_783420 ?auto_783425 ) ) ( not ( = ?auto_783420 ?auto_783426 ) ) ( not ( = ?auto_783420 ?auto_783427 ) ) ( not ( = ?auto_783420 ?auto_783428 ) ) ( not ( = ?auto_783420 ?auto_783429 ) ) ( not ( = ?auto_783420 ?auto_783430 ) ) ( not ( = ?auto_783420 ?auto_783432 ) ) ( not ( = ?auto_783421 ?auto_783422 ) ) ( not ( = ?auto_783421 ?auto_783423 ) ) ( not ( = ?auto_783421 ?auto_783424 ) ) ( not ( = ?auto_783421 ?auto_783425 ) ) ( not ( = ?auto_783421 ?auto_783426 ) ) ( not ( = ?auto_783421 ?auto_783427 ) ) ( not ( = ?auto_783421 ?auto_783428 ) ) ( not ( = ?auto_783421 ?auto_783429 ) ) ( not ( = ?auto_783421 ?auto_783430 ) ) ( not ( = ?auto_783421 ?auto_783432 ) ) ( not ( = ?auto_783422 ?auto_783423 ) ) ( not ( = ?auto_783422 ?auto_783424 ) ) ( not ( = ?auto_783422 ?auto_783425 ) ) ( not ( = ?auto_783422 ?auto_783426 ) ) ( not ( = ?auto_783422 ?auto_783427 ) ) ( not ( = ?auto_783422 ?auto_783428 ) ) ( not ( = ?auto_783422 ?auto_783429 ) ) ( not ( = ?auto_783422 ?auto_783430 ) ) ( not ( = ?auto_783422 ?auto_783432 ) ) ( not ( = ?auto_783423 ?auto_783424 ) ) ( not ( = ?auto_783423 ?auto_783425 ) ) ( not ( = ?auto_783423 ?auto_783426 ) ) ( not ( = ?auto_783423 ?auto_783427 ) ) ( not ( = ?auto_783423 ?auto_783428 ) ) ( not ( = ?auto_783423 ?auto_783429 ) ) ( not ( = ?auto_783423 ?auto_783430 ) ) ( not ( = ?auto_783423 ?auto_783432 ) ) ( not ( = ?auto_783424 ?auto_783425 ) ) ( not ( = ?auto_783424 ?auto_783426 ) ) ( not ( = ?auto_783424 ?auto_783427 ) ) ( not ( = ?auto_783424 ?auto_783428 ) ) ( not ( = ?auto_783424 ?auto_783429 ) ) ( not ( = ?auto_783424 ?auto_783430 ) ) ( not ( = ?auto_783424 ?auto_783432 ) ) ( not ( = ?auto_783425 ?auto_783426 ) ) ( not ( = ?auto_783425 ?auto_783427 ) ) ( not ( = ?auto_783425 ?auto_783428 ) ) ( not ( = ?auto_783425 ?auto_783429 ) ) ( not ( = ?auto_783425 ?auto_783430 ) ) ( not ( = ?auto_783425 ?auto_783432 ) ) ( not ( = ?auto_783426 ?auto_783427 ) ) ( not ( = ?auto_783426 ?auto_783428 ) ) ( not ( = ?auto_783426 ?auto_783429 ) ) ( not ( = ?auto_783426 ?auto_783430 ) ) ( not ( = ?auto_783426 ?auto_783432 ) ) ( not ( = ?auto_783427 ?auto_783428 ) ) ( not ( = ?auto_783427 ?auto_783429 ) ) ( not ( = ?auto_783427 ?auto_783430 ) ) ( not ( = ?auto_783427 ?auto_783432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783428 ?auto_783429 ?auto_783430 )
      ( MAKE-12CRATE-VERIFY ?auto_783418 ?auto_783419 ?auto_783420 ?auto_783421 ?auto_783422 ?auto_783423 ?auto_783424 ?auto_783425 ?auto_783426 ?auto_783427 ?auto_783428 ?auto_783429 ?auto_783430 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_783581 - SURFACE
      ?auto_783582 - SURFACE
      ?auto_783583 - SURFACE
      ?auto_783584 - SURFACE
      ?auto_783585 - SURFACE
      ?auto_783586 - SURFACE
      ?auto_783587 - SURFACE
      ?auto_783588 - SURFACE
      ?auto_783589 - SURFACE
      ?auto_783590 - SURFACE
      ?auto_783591 - SURFACE
      ?auto_783592 - SURFACE
      ?auto_783593 - SURFACE
    )
    :vars
    (
      ?auto_783594 - HOIST
      ?auto_783596 - PLACE
      ?auto_783599 - PLACE
      ?auto_783598 - HOIST
      ?auto_783595 - SURFACE
      ?auto_783597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_783594 ?auto_783596 ) ( IS-CRATE ?auto_783593 ) ( not ( = ?auto_783592 ?auto_783593 ) ) ( not ( = ?auto_783591 ?auto_783592 ) ) ( not ( = ?auto_783591 ?auto_783593 ) ) ( not ( = ?auto_783599 ?auto_783596 ) ) ( HOIST-AT ?auto_783598 ?auto_783599 ) ( not ( = ?auto_783594 ?auto_783598 ) ) ( AVAILABLE ?auto_783598 ) ( SURFACE-AT ?auto_783593 ?auto_783599 ) ( ON ?auto_783593 ?auto_783595 ) ( CLEAR ?auto_783593 ) ( not ( = ?auto_783592 ?auto_783595 ) ) ( not ( = ?auto_783593 ?auto_783595 ) ) ( not ( = ?auto_783591 ?auto_783595 ) ) ( TRUCK-AT ?auto_783597 ?auto_783596 ) ( SURFACE-AT ?auto_783591 ?auto_783596 ) ( CLEAR ?auto_783591 ) ( IS-CRATE ?auto_783592 ) ( AVAILABLE ?auto_783594 ) ( IN ?auto_783592 ?auto_783597 ) ( ON ?auto_783582 ?auto_783581 ) ( ON ?auto_783583 ?auto_783582 ) ( ON ?auto_783584 ?auto_783583 ) ( ON ?auto_783585 ?auto_783584 ) ( ON ?auto_783586 ?auto_783585 ) ( ON ?auto_783587 ?auto_783586 ) ( ON ?auto_783588 ?auto_783587 ) ( ON ?auto_783589 ?auto_783588 ) ( ON ?auto_783590 ?auto_783589 ) ( ON ?auto_783591 ?auto_783590 ) ( not ( = ?auto_783581 ?auto_783582 ) ) ( not ( = ?auto_783581 ?auto_783583 ) ) ( not ( = ?auto_783581 ?auto_783584 ) ) ( not ( = ?auto_783581 ?auto_783585 ) ) ( not ( = ?auto_783581 ?auto_783586 ) ) ( not ( = ?auto_783581 ?auto_783587 ) ) ( not ( = ?auto_783581 ?auto_783588 ) ) ( not ( = ?auto_783581 ?auto_783589 ) ) ( not ( = ?auto_783581 ?auto_783590 ) ) ( not ( = ?auto_783581 ?auto_783591 ) ) ( not ( = ?auto_783581 ?auto_783592 ) ) ( not ( = ?auto_783581 ?auto_783593 ) ) ( not ( = ?auto_783581 ?auto_783595 ) ) ( not ( = ?auto_783582 ?auto_783583 ) ) ( not ( = ?auto_783582 ?auto_783584 ) ) ( not ( = ?auto_783582 ?auto_783585 ) ) ( not ( = ?auto_783582 ?auto_783586 ) ) ( not ( = ?auto_783582 ?auto_783587 ) ) ( not ( = ?auto_783582 ?auto_783588 ) ) ( not ( = ?auto_783582 ?auto_783589 ) ) ( not ( = ?auto_783582 ?auto_783590 ) ) ( not ( = ?auto_783582 ?auto_783591 ) ) ( not ( = ?auto_783582 ?auto_783592 ) ) ( not ( = ?auto_783582 ?auto_783593 ) ) ( not ( = ?auto_783582 ?auto_783595 ) ) ( not ( = ?auto_783583 ?auto_783584 ) ) ( not ( = ?auto_783583 ?auto_783585 ) ) ( not ( = ?auto_783583 ?auto_783586 ) ) ( not ( = ?auto_783583 ?auto_783587 ) ) ( not ( = ?auto_783583 ?auto_783588 ) ) ( not ( = ?auto_783583 ?auto_783589 ) ) ( not ( = ?auto_783583 ?auto_783590 ) ) ( not ( = ?auto_783583 ?auto_783591 ) ) ( not ( = ?auto_783583 ?auto_783592 ) ) ( not ( = ?auto_783583 ?auto_783593 ) ) ( not ( = ?auto_783583 ?auto_783595 ) ) ( not ( = ?auto_783584 ?auto_783585 ) ) ( not ( = ?auto_783584 ?auto_783586 ) ) ( not ( = ?auto_783584 ?auto_783587 ) ) ( not ( = ?auto_783584 ?auto_783588 ) ) ( not ( = ?auto_783584 ?auto_783589 ) ) ( not ( = ?auto_783584 ?auto_783590 ) ) ( not ( = ?auto_783584 ?auto_783591 ) ) ( not ( = ?auto_783584 ?auto_783592 ) ) ( not ( = ?auto_783584 ?auto_783593 ) ) ( not ( = ?auto_783584 ?auto_783595 ) ) ( not ( = ?auto_783585 ?auto_783586 ) ) ( not ( = ?auto_783585 ?auto_783587 ) ) ( not ( = ?auto_783585 ?auto_783588 ) ) ( not ( = ?auto_783585 ?auto_783589 ) ) ( not ( = ?auto_783585 ?auto_783590 ) ) ( not ( = ?auto_783585 ?auto_783591 ) ) ( not ( = ?auto_783585 ?auto_783592 ) ) ( not ( = ?auto_783585 ?auto_783593 ) ) ( not ( = ?auto_783585 ?auto_783595 ) ) ( not ( = ?auto_783586 ?auto_783587 ) ) ( not ( = ?auto_783586 ?auto_783588 ) ) ( not ( = ?auto_783586 ?auto_783589 ) ) ( not ( = ?auto_783586 ?auto_783590 ) ) ( not ( = ?auto_783586 ?auto_783591 ) ) ( not ( = ?auto_783586 ?auto_783592 ) ) ( not ( = ?auto_783586 ?auto_783593 ) ) ( not ( = ?auto_783586 ?auto_783595 ) ) ( not ( = ?auto_783587 ?auto_783588 ) ) ( not ( = ?auto_783587 ?auto_783589 ) ) ( not ( = ?auto_783587 ?auto_783590 ) ) ( not ( = ?auto_783587 ?auto_783591 ) ) ( not ( = ?auto_783587 ?auto_783592 ) ) ( not ( = ?auto_783587 ?auto_783593 ) ) ( not ( = ?auto_783587 ?auto_783595 ) ) ( not ( = ?auto_783588 ?auto_783589 ) ) ( not ( = ?auto_783588 ?auto_783590 ) ) ( not ( = ?auto_783588 ?auto_783591 ) ) ( not ( = ?auto_783588 ?auto_783592 ) ) ( not ( = ?auto_783588 ?auto_783593 ) ) ( not ( = ?auto_783588 ?auto_783595 ) ) ( not ( = ?auto_783589 ?auto_783590 ) ) ( not ( = ?auto_783589 ?auto_783591 ) ) ( not ( = ?auto_783589 ?auto_783592 ) ) ( not ( = ?auto_783589 ?auto_783593 ) ) ( not ( = ?auto_783589 ?auto_783595 ) ) ( not ( = ?auto_783590 ?auto_783591 ) ) ( not ( = ?auto_783590 ?auto_783592 ) ) ( not ( = ?auto_783590 ?auto_783593 ) ) ( not ( = ?auto_783590 ?auto_783595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_783591 ?auto_783592 ?auto_783593 )
      ( MAKE-12CRATE-VERIFY ?auto_783581 ?auto_783582 ?auto_783583 ?auto_783584 ?auto_783585 ?auto_783586 ?auto_783587 ?auto_783588 ?auto_783589 ?auto_783590 ?auto_783591 ?auto_783592 ?auto_783593 ) )
  )

)

