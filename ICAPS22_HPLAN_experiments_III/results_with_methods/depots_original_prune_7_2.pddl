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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72377 - SURFACE
      ?auto_72378 - SURFACE
    )
    :vars
    (
      ?auto_72379 - HOIST
      ?auto_72380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72379 ?auto_72380 ) ( SURFACE-AT ?auto_72377 ?auto_72380 ) ( CLEAR ?auto_72377 ) ( LIFTING ?auto_72379 ?auto_72378 ) ( IS-CRATE ?auto_72378 ) ( not ( = ?auto_72377 ?auto_72378 ) ) )
    :subtasks
    ( ( !DROP ?auto_72379 ?auto_72378 ?auto_72377 ?auto_72380 )
      ( MAKE-1CRATE-VERIFY ?auto_72377 ?auto_72378 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72381 - SURFACE
      ?auto_72382 - SURFACE
    )
    :vars
    (
      ?auto_72384 - HOIST
      ?auto_72383 - PLACE
      ?auto_72385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72384 ?auto_72383 ) ( SURFACE-AT ?auto_72381 ?auto_72383 ) ( CLEAR ?auto_72381 ) ( IS-CRATE ?auto_72382 ) ( not ( = ?auto_72381 ?auto_72382 ) ) ( TRUCK-AT ?auto_72385 ?auto_72383 ) ( AVAILABLE ?auto_72384 ) ( IN ?auto_72382 ?auto_72385 ) )
    :subtasks
    ( ( !UNLOAD ?auto_72384 ?auto_72382 ?auto_72385 ?auto_72383 )
      ( MAKE-1CRATE ?auto_72381 ?auto_72382 )
      ( MAKE-1CRATE-VERIFY ?auto_72381 ?auto_72382 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72386 - SURFACE
      ?auto_72387 - SURFACE
    )
    :vars
    (
      ?auto_72388 - HOIST
      ?auto_72389 - PLACE
      ?auto_72390 - TRUCK
      ?auto_72391 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72388 ?auto_72389 ) ( SURFACE-AT ?auto_72386 ?auto_72389 ) ( CLEAR ?auto_72386 ) ( IS-CRATE ?auto_72387 ) ( not ( = ?auto_72386 ?auto_72387 ) ) ( AVAILABLE ?auto_72388 ) ( IN ?auto_72387 ?auto_72390 ) ( TRUCK-AT ?auto_72390 ?auto_72391 ) ( not ( = ?auto_72391 ?auto_72389 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72390 ?auto_72391 ?auto_72389 )
      ( MAKE-1CRATE ?auto_72386 ?auto_72387 )
      ( MAKE-1CRATE-VERIFY ?auto_72386 ?auto_72387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72392 - SURFACE
      ?auto_72393 - SURFACE
    )
    :vars
    (
      ?auto_72396 - HOIST
      ?auto_72394 - PLACE
      ?auto_72397 - TRUCK
      ?auto_72395 - PLACE
      ?auto_72398 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72396 ?auto_72394 ) ( SURFACE-AT ?auto_72392 ?auto_72394 ) ( CLEAR ?auto_72392 ) ( IS-CRATE ?auto_72393 ) ( not ( = ?auto_72392 ?auto_72393 ) ) ( AVAILABLE ?auto_72396 ) ( TRUCK-AT ?auto_72397 ?auto_72395 ) ( not ( = ?auto_72395 ?auto_72394 ) ) ( HOIST-AT ?auto_72398 ?auto_72395 ) ( LIFTING ?auto_72398 ?auto_72393 ) ( not ( = ?auto_72396 ?auto_72398 ) ) )
    :subtasks
    ( ( !LOAD ?auto_72398 ?auto_72393 ?auto_72397 ?auto_72395 )
      ( MAKE-1CRATE ?auto_72392 ?auto_72393 )
      ( MAKE-1CRATE-VERIFY ?auto_72392 ?auto_72393 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72399 - SURFACE
      ?auto_72400 - SURFACE
    )
    :vars
    (
      ?auto_72405 - HOIST
      ?auto_72401 - PLACE
      ?auto_72403 - TRUCK
      ?auto_72402 - PLACE
      ?auto_72404 - HOIST
      ?auto_72406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72405 ?auto_72401 ) ( SURFACE-AT ?auto_72399 ?auto_72401 ) ( CLEAR ?auto_72399 ) ( IS-CRATE ?auto_72400 ) ( not ( = ?auto_72399 ?auto_72400 ) ) ( AVAILABLE ?auto_72405 ) ( TRUCK-AT ?auto_72403 ?auto_72402 ) ( not ( = ?auto_72402 ?auto_72401 ) ) ( HOIST-AT ?auto_72404 ?auto_72402 ) ( not ( = ?auto_72405 ?auto_72404 ) ) ( AVAILABLE ?auto_72404 ) ( SURFACE-AT ?auto_72400 ?auto_72402 ) ( ON ?auto_72400 ?auto_72406 ) ( CLEAR ?auto_72400 ) ( not ( = ?auto_72399 ?auto_72406 ) ) ( not ( = ?auto_72400 ?auto_72406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72404 ?auto_72400 ?auto_72406 ?auto_72402 )
      ( MAKE-1CRATE ?auto_72399 ?auto_72400 )
      ( MAKE-1CRATE-VERIFY ?auto_72399 ?auto_72400 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72407 - SURFACE
      ?auto_72408 - SURFACE
    )
    :vars
    (
      ?auto_72413 - HOIST
      ?auto_72411 - PLACE
      ?auto_72410 - PLACE
      ?auto_72409 - HOIST
      ?auto_72412 - SURFACE
      ?auto_72414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72413 ?auto_72411 ) ( SURFACE-AT ?auto_72407 ?auto_72411 ) ( CLEAR ?auto_72407 ) ( IS-CRATE ?auto_72408 ) ( not ( = ?auto_72407 ?auto_72408 ) ) ( AVAILABLE ?auto_72413 ) ( not ( = ?auto_72410 ?auto_72411 ) ) ( HOIST-AT ?auto_72409 ?auto_72410 ) ( not ( = ?auto_72413 ?auto_72409 ) ) ( AVAILABLE ?auto_72409 ) ( SURFACE-AT ?auto_72408 ?auto_72410 ) ( ON ?auto_72408 ?auto_72412 ) ( CLEAR ?auto_72408 ) ( not ( = ?auto_72407 ?auto_72412 ) ) ( not ( = ?auto_72408 ?auto_72412 ) ) ( TRUCK-AT ?auto_72414 ?auto_72411 ) )
    :subtasks
    ( ( !DRIVE ?auto_72414 ?auto_72411 ?auto_72410 )
      ( MAKE-1CRATE ?auto_72407 ?auto_72408 )
      ( MAKE-1CRATE-VERIFY ?auto_72407 ?auto_72408 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72424 - SURFACE
      ?auto_72425 - SURFACE
      ?auto_72426 - SURFACE
    )
    :vars
    (
      ?auto_72427 - HOIST
      ?auto_72428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72427 ?auto_72428 ) ( SURFACE-AT ?auto_72425 ?auto_72428 ) ( CLEAR ?auto_72425 ) ( LIFTING ?auto_72427 ?auto_72426 ) ( IS-CRATE ?auto_72426 ) ( not ( = ?auto_72425 ?auto_72426 ) ) ( ON ?auto_72425 ?auto_72424 ) ( not ( = ?auto_72424 ?auto_72425 ) ) ( not ( = ?auto_72424 ?auto_72426 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72425 ?auto_72426 )
      ( MAKE-2CRATE-VERIFY ?auto_72424 ?auto_72425 ?auto_72426 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72434 - SURFACE
      ?auto_72435 - SURFACE
      ?auto_72436 - SURFACE
    )
    :vars
    (
      ?auto_72439 - HOIST
      ?auto_72438 - PLACE
      ?auto_72437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72439 ?auto_72438 ) ( SURFACE-AT ?auto_72435 ?auto_72438 ) ( CLEAR ?auto_72435 ) ( IS-CRATE ?auto_72436 ) ( not ( = ?auto_72435 ?auto_72436 ) ) ( TRUCK-AT ?auto_72437 ?auto_72438 ) ( AVAILABLE ?auto_72439 ) ( IN ?auto_72436 ?auto_72437 ) ( ON ?auto_72435 ?auto_72434 ) ( not ( = ?auto_72434 ?auto_72435 ) ) ( not ( = ?auto_72434 ?auto_72436 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72435 ?auto_72436 )
      ( MAKE-2CRATE-VERIFY ?auto_72434 ?auto_72435 ?auto_72436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72440 - SURFACE
      ?auto_72441 - SURFACE
    )
    :vars
    (
      ?auto_72442 - HOIST
      ?auto_72443 - PLACE
      ?auto_72445 - TRUCK
      ?auto_72444 - SURFACE
      ?auto_72446 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72442 ?auto_72443 ) ( SURFACE-AT ?auto_72440 ?auto_72443 ) ( CLEAR ?auto_72440 ) ( IS-CRATE ?auto_72441 ) ( not ( = ?auto_72440 ?auto_72441 ) ) ( AVAILABLE ?auto_72442 ) ( IN ?auto_72441 ?auto_72445 ) ( ON ?auto_72440 ?auto_72444 ) ( not ( = ?auto_72444 ?auto_72440 ) ) ( not ( = ?auto_72444 ?auto_72441 ) ) ( TRUCK-AT ?auto_72445 ?auto_72446 ) ( not ( = ?auto_72446 ?auto_72443 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72445 ?auto_72446 ?auto_72443 )
      ( MAKE-2CRATE ?auto_72444 ?auto_72440 ?auto_72441 )
      ( MAKE-1CRATE-VERIFY ?auto_72440 ?auto_72441 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72447 - SURFACE
      ?auto_72448 - SURFACE
      ?auto_72449 - SURFACE
    )
    :vars
    (
      ?auto_72451 - HOIST
      ?auto_72452 - PLACE
      ?auto_72453 - TRUCK
      ?auto_72450 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72451 ?auto_72452 ) ( SURFACE-AT ?auto_72448 ?auto_72452 ) ( CLEAR ?auto_72448 ) ( IS-CRATE ?auto_72449 ) ( not ( = ?auto_72448 ?auto_72449 ) ) ( AVAILABLE ?auto_72451 ) ( IN ?auto_72449 ?auto_72453 ) ( ON ?auto_72448 ?auto_72447 ) ( not ( = ?auto_72447 ?auto_72448 ) ) ( not ( = ?auto_72447 ?auto_72449 ) ) ( TRUCK-AT ?auto_72453 ?auto_72450 ) ( not ( = ?auto_72450 ?auto_72452 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72448 ?auto_72449 )
      ( MAKE-2CRATE-VERIFY ?auto_72447 ?auto_72448 ?auto_72449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72454 - SURFACE
      ?auto_72455 - SURFACE
    )
    :vars
    (
      ?auto_72458 - HOIST
      ?auto_72459 - PLACE
      ?auto_72457 - SURFACE
      ?auto_72460 - TRUCK
      ?auto_72456 - PLACE
      ?auto_72461 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72458 ?auto_72459 ) ( SURFACE-AT ?auto_72454 ?auto_72459 ) ( CLEAR ?auto_72454 ) ( IS-CRATE ?auto_72455 ) ( not ( = ?auto_72454 ?auto_72455 ) ) ( AVAILABLE ?auto_72458 ) ( ON ?auto_72454 ?auto_72457 ) ( not ( = ?auto_72457 ?auto_72454 ) ) ( not ( = ?auto_72457 ?auto_72455 ) ) ( TRUCK-AT ?auto_72460 ?auto_72456 ) ( not ( = ?auto_72456 ?auto_72459 ) ) ( HOIST-AT ?auto_72461 ?auto_72456 ) ( LIFTING ?auto_72461 ?auto_72455 ) ( not ( = ?auto_72458 ?auto_72461 ) ) )
    :subtasks
    ( ( !LOAD ?auto_72461 ?auto_72455 ?auto_72460 ?auto_72456 )
      ( MAKE-2CRATE ?auto_72457 ?auto_72454 ?auto_72455 )
      ( MAKE-1CRATE-VERIFY ?auto_72454 ?auto_72455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72462 - SURFACE
      ?auto_72463 - SURFACE
      ?auto_72464 - SURFACE
    )
    :vars
    (
      ?auto_72467 - HOIST
      ?auto_72465 - PLACE
      ?auto_72468 - TRUCK
      ?auto_72466 - PLACE
      ?auto_72469 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72467 ?auto_72465 ) ( SURFACE-AT ?auto_72463 ?auto_72465 ) ( CLEAR ?auto_72463 ) ( IS-CRATE ?auto_72464 ) ( not ( = ?auto_72463 ?auto_72464 ) ) ( AVAILABLE ?auto_72467 ) ( ON ?auto_72463 ?auto_72462 ) ( not ( = ?auto_72462 ?auto_72463 ) ) ( not ( = ?auto_72462 ?auto_72464 ) ) ( TRUCK-AT ?auto_72468 ?auto_72466 ) ( not ( = ?auto_72466 ?auto_72465 ) ) ( HOIST-AT ?auto_72469 ?auto_72466 ) ( LIFTING ?auto_72469 ?auto_72464 ) ( not ( = ?auto_72467 ?auto_72469 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72463 ?auto_72464 )
      ( MAKE-2CRATE-VERIFY ?auto_72462 ?auto_72463 ?auto_72464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72470 - SURFACE
      ?auto_72471 - SURFACE
    )
    :vars
    (
      ?auto_72474 - HOIST
      ?auto_72476 - PLACE
      ?auto_72475 - SURFACE
      ?auto_72477 - TRUCK
      ?auto_72473 - PLACE
      ?auto_72472 - HOIST
      ?auto_72478 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72474 ?auto_72476 ) ( SURFACE-AT ?auto_72470 ?auto_72476 ) ( CLEAR ?auto_72470 ) ( IS-CRATE ?auto_72471 ) ( not ( = ?auto_72470 ?auto_72471 ) ) ( AVAILABLE ?auto_72474 ) ( ON ?auto_72470 ?auto_72475 ) ( not ( = ?auto_72475 ?auto_72470 ) ) ( not ( = ?auto_72475 ?auto_72471 ) ) ( TRUCK-AT ?auto_72477 ?auto_72473 ) ( not ( = ?auto_72473 ?auto_72476 ) ) ( HOIST-AT ?auto_72472 ?auto_72473 ) ( not ( = ?auto_72474 ?auto_72472 ) ) ( AVAILABLE ?auto_72472 ) ( SURFACE-AT ?auto_72471 ?auto_72473 ) ( ON ?auto_72471 ?auto_72478 ) ( CLEAR ?auto_72471 ) ( not ( = ?auto_72470 ?auto_72478 ) ) ( not ( = ?auto_72471 ?auto_72478 ) ) ( not ( = ?auto_72475 ?auto_72478 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72472 ?auto_72471 ?auto_72478 ?auto_72473 )
      ( MAKE-2CRATE ?auto_72475 ?auto_72470 ?auto_72471 )
      ( MAKE-1CRATE-VERIFY ?auto_72470 ?auto_72471 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72479 - SURFACE
      ?auto_72480 - SURFACE
      ?auto_72481 - SURFACE
    )
    :vars
    (
      ?auto_72486 - HOIST
      ?auto_72485 - PLACE
      ?auto_72487 - TRUCK
      ?auto_72483 - PLACE
      ?auto_72482 - HOIST
      ?auto_72484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72486 ?auto_72485 ) ( SURFACE-AT ?auto_72480 ?auto_72485 ) ( CLEAR ?auto_72480 ) ( IS-CRATE ?auto_72481 ) ( not ( = ?auto_72480 ?auto_72481 ) ) ( AVAILABLE ?auto_72486 ) ( ON ?auto_72480 ?auto_72479 ) ( not ( = ?auto_72479 ?auto_72480 ) ) ( not ( = ?auto_72479 ?auto_72481 ) ) ( TRUCK-AT ?auto_72487 ?auto_72483 ) ( not ( = ?auto_72483 ?auto_72485 ) ) ( HOIST-AT ?auto_72482 ?auto_72483 ) ( not ( = ?auto_72486 ?auto_72482 ) ) ( AVAILABLE ?auto_72482 ) ( SURFACE-AT ?auto_72481 ?auto_72483 ) ( ON ?auto_72481 ?auto_72484 ) ( CLEAR ?auto_72481 ) ( not ( = ?auto_72480 ?auto_72484 ) ) ( not ( = ?auto_72481 ?auto_72484 ) ) ( not ( = ?auto_72479 ?auto_72484 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72480 ?auto_72481 )
      ( MAKE-2CRATE-VERIFY ?auto_72479 ?auto_72480 ?auto_72481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72488 - SURFACE
      ?auto_72489 - SURFACE
    )
    :vars
    (
      ?auto_72494 - HOIST
      ?auto_72491 - PLACE
      ?auto_72490 - SURFACE
      ?auto_72492 - PLACE
      ?auto_72496 - HOIST
      ?auto_72493 - SURFACE
      ?auto_72495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72494 ?auto_72491 ) ( SURFACE-AT ?auto_72488 ?auto_72491 ) ( CLEAR ?auto_72488 ) ( IS-CRATE ?auto_72489 ) ( not ( = ?auto_72488 ?auto_72489 ) ) ( AVAILABLE ?auto_72494 ) ( ON ?auto_72488 ?auto_72490 ) ( not ( = ?auto_72490 ?auto_72488 ) ) ( not ( = ?auto_72490 ?auto_72489 ) ) ( not ( = ?auto_72492 ?auto_72491 ) ) ( HOIST-AT ?auto_72496 ?auto_72492 ) ( not ( = ?auto_72494 ?auto_72496 ) ) ( AVAILABLE ?auto_72496 ) ( SURFACE-AT ?auto_72489 ?auto_72492 ) ( ON ?auto_72489 ?auto_72493 ) ( CLEAR ?auto_72489 ) ( not ( = ?auto_72488 ?auto_72493 ) ) ( not ( = ?auto_72489 ?auto_72493 ) ) ( not ( = ?auto_72490 ?auto_72493 ) ) ( TRUCK-AT ?auto_72495 ?auto_72491 ) )
    :subtasks
    ( ( !DRIVE ?auto_72495 ?auto_72491 ?auto_72492 )
      ( MAKE-2CRATE ?auto_72490 ?auto_72488 ?auto_72489 )
      ( MAKE-1CRATE-VERIFY ?auto_72488 ?auto_72489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72497 - SURFACE
      ?auto_72498 - SURFACE
      ?auto_72499 - SURFACE
    )
    :vars
    (
      ?auto_72503 - HOIST
      ?auto_72500 - PLACE
      ?auto_72505 - PLACE
      ?auto_72504 - HOIST
      ?auto_72502 - SURFACE
      ?auto_72501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72503 ?auto_72500 ) ( SURFACE-AT ?auto_72498 ?auto_72500 ) ( CLEAR ?auto_72498 ) ( IS-CRATE ?auto_72499 ) ( not ( = ?auto_72498 ?auto_72499 ) ) ( AVAILABLE ?auto_72503 ) ( ON ?auto_72498 ?auto_72497 ) ( not ( = ?auto_72497 ?auto_72498 ) ) ( not ( = ?auto_72497 ?auto_72499 ) ) ( not ( = ?auto_72505 ?auto_72500 ) ) ( HOIST-AT ?auto_72504 ?auto_72505 ) ( not ( = ?auto_72503 ?auto_72504 ) ) ( AVAILABLE ?auto_72504 ) ( SURFACE-AT ?auto_72499 ?auto_72505 ) ( ON ?auto_72499 ?auto_72502 ) ( CLEAR ?auto_72499 ) ( not ( = ?auto_72498 ?auto_72502 ) ) ( not ( = ?auto_72499 ?auto_72502 ) ) ( not ( = ?auto_72497 ?auto_72502 ) ) ( TRUCK-AT ?auto_72501 ?auto_72500 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72498 ?auto_72499 )
      ( MAKE-2CRATE-VERIFY ?auto_72497 ?auto_72498 ?auto_72499 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72506 - SURFACE
      ?auto_72507 - SURFACE
    )
    :vars
    (
      ?auto_72511 - HOIST
      ?auto_72512 - PLACE
      ?auto_72510 - SURFACE
      ?auto_72513 - PLACE
      ?auto_72509 - HOIST
      ?auto_72514 - SURFACE
      ?auto_72508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72511 ?auto_72512 ) ( IS-CRATE ?auto_72507 ) ( not ( = ?auto_72506 ?auto_72507 ) ) ( not ( = ?auto_72510 ?auto_72506 ) ) ( not ( = ?auto_72510 ?auto_72507 ) ) ( not ( = ?auto_72513 ?auto_72512 ) ) ( HOIST-AT ?auto_72509 ?auto_72513 ) ( not ( = ?auto_72511 ?auto_72509 ) ) ( AVAILABLE ?auto_72509 ) ( SURFACE-AT ?auto_72507 ?auto_72513 ) ( ON ?auto_72507 ?auto_72514 ) ( CLEAR ?auto_72507 ) ( not ( = ?auto_72506 ?auto_72514 ) ) ( not ( = ?auto_72507 ?auto_72514 ) ) ( not ( = ?auto_72510 ?auto_72514 ) ) ( TRUCK-AT ?auto_72508 ?auto_72512 ) ( SURFACE-AT ?auto_72510 ?auto_72512 ) ( CLEAR ?auto_72510 ) ( LIFTING ?auto_72511 ?auto_72506 ) ( IS-CRATE ?auto_72506 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72510 ?auto_72506 )
      ( MAKE-2CRATE ?auto_72510 ?auto_72506 ?auto_72507 )
      ( MAKE-1CRATE-VERIFY ?auto_72506 ?auto_72507 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72515 - SURFACE
      ?auto_72516 - SURFACE
      ?auto_72517 - SURFACE
    )
    :vars
    (
      ?auto_72521 - HOIST
      ?auto_72522 - PLACE
      ?auto_72520 - PLACE
      ?auto_72518 - HOIST
      ?auto_72523 - SURFACE
      ?auto_72519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72521 ?auto_72522 ) ( IS-CRATE ?auto_72517 ) ( not ( = ?auto_72516 ?auto_72517 ) ) ( not ( = ?auto_72515 ?auto_72516 ) ) ( not ( = ?auto_72515 ?auto_72517 ) ) ( not ( = ?auto_72520 ?auto_72522 ) ) ( HOIST-AT ?auto_72518 ?auto_72520 ) ( not ( = ?auto_72521 ?auto_72518 ) ) ( AVAILABLE ?auto_72518 ) ( SURFACE-AT ?auto_72517 ?auto_72520 ) ( ON ?auto_72517 ?auto_72523 ) ( CLEAR ?auto_72517 ) ( not ( = ?auto_72516 ?auto_72523 ) ) ( not ( = ?auto_72517 ?auto_72523 ) ) ( not ( = ?auto_72515 ?auto_72523 ) ) ( TRUCK-AT ?auto_72519 ?auto_72522 ) ( SURFACE-AT ?auto_72515 ?auto_72522 ) ( CLEAR ?auto_72515 ) ( LIFTING ?auto_72521 ?auto_72516 ) ( IS-CRATE ?auto_72516 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72516 ?auto_72517 )
      ( MAKE-2CRATE-VERIFY ?auto_72515 ?auto_72516 ?auto_72517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72524 - SURFACE
      ?auto_72525 - SURFACE
    )
    :vars
    (
      ?auto_72531 - HOIST
      ?auto_72526 - PLACE
      ?auto_72528 - SURFACE
      ?auto_72527 - PLACE
      ?auto_72529 - HOIST
      ?auto_72530 - SURFACE
      ?auto_72532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72531 ?auto_72526 ) ( IS-CRATE ?auto_72525 ) ( not ( = ?auto_72524 ?auto_72525 ) ) ( not ( = ?auto_72528 ?auto_72524 ) ) ( not ( = ?auto_72528 ?auto_72525 ) ) ( not ( = ?auto_72527 ?auto_72526 ) ) ( HOIST-AT ?auto_72529 ?auto_72527 ) ( not ( = ?auto_72531 ?auto_72529 ) ) ( AVAILABLE ?auto_72529 ) ( SURFACE-AT ?auto_72525 ?auto_72527 ) ( ON ?auto_72525 ?auto_72530 ) ( CLEAR ?auto_72525 ) ( not ( = ?auto_72524 ?auto_72530 ) ) ( not ( = ?auto_72525 ?auto_72530 ) ) ( not ( = ?auto_72528 ?auto_72530 ) ) ( TRUCK-AT ?auto_72532 ?auto_72526 ) ( SURFACE-AT ?auto_72528 ?auto_72526 ) ( CLEAR ?auto_72528 ) ( IS-CRATE ?auto_72524 ) ( AVAILABLE ?auto_72531 ) ( IN ?auto_72524 ?auto_72532 ) )
    :subtasks
    ( ( !UNLOAD ?auto_72531 ?auto_72524 ?auto_72532 ?auto_72526 )
      ( MAKE-2CRATE ?auto_72528 ?auto_72524 ?auto_72525 )
      ( MAKE-1CRATE-VERIFY ?auto_72524 ?auto_72525 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72533 - SURFACE
      ?auto_72534 - SURFACE
      ?auto_72535 - SURFACE
    )
    :vars
    (
      ?auto_72538 - HOIST
      ?auto_72541 - PLACE
      ?auto_72537 - PLACE
      ?auto_72540 - HOIST
      ?auto_72539 - SURFACE
      ?auto_72536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72538 ?auto_72541 ) ( IS-CRATE ?auto_72535 ) ( not ( = ?auto_72534 ?auto_72535 ) ) ( not ( = ?auto_72533 ?auto_72534 ) ) ( not ( = ?auto_72533 ?auto_72535 ) ) ( not ( = ?auto_72537 ?auto_72541 ) ) ( HOIST-AT ?auto_72540 ?auto_72537 ) ( not ( = ?auto_72538 ?auto_72540 ) ) ( AVAILABLE ?auto_72540 ) ( SURFACE-AT ?auto_72535 ?auto_72537 ) ( ON ?auto_72535 ?auto_72539 ) ( CLEAR ?auto_72535 ) ( not ( = ?auto_72534 ?auto_72539 ) ) ( not ( = ?auto_72535 ?auto_72539 ) ) ( not ( = ?auto_72533 ?auto_72539 ) ) ( TRUCK-AT ?auto_72536 ?auto_72541 ) ( SURFACE-AT ?auto_72533 ?auto_72541 ) ( CLEAR ?auto_72533 ) ( IS-CRATE ?auto_72534 ) ( AVAILABLE ?auto_72538 ) ( IN ?auto_72534 ?auto_72536 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72534 ?auto_72535 )
      ( MAKE-2CRATE-VERIFY ?auto_72533 ?auto_72534 ?auto_72535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72578 - SURFACE
      ?auto_72579 - SURFACE
    )
    :vars
    (
      ?auto_72586 - HOIST
      ?auto_72582 - PLACE
      ?auto_72581 - SURFACE
      ?auto_72580 - PLACE
      ?auto_72584 - HOIST
      ?auto_72585 - SURFACE
      ?auto_72583 - TRUCK
      ?auto_72587 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72586 ?auto_72582 ) ( SURFACE-AT ?auto_72578 ?auto_72582 ) ( CLEAR ?auto_72578 ) ( IS-CRATE ?auto_72579 ) ( not ( = ?auto_72578 ?auto_72579 ) ) ( AVAILABLE ?auto_72586 ) ( ON ?auto_72578 ?auto_72581 ) ( not ( = ?auto_72581 ?auto_72578 ) ) ( not ( = ?auto_72581 ?auto_72579 ) ) ( not ( = ?auto_72580 ?auto_72582 ) ) ( HOIST-AT ?auto_72584 ?auto_72580 ) ( not ( = ?auto_72586 ?auto_72584 ) ) ( AVAILABLE ?auto_72584 ) ( SURFACE-AT ?auto_72579 ?auto_72580 ) ( ON ?auto_72579 ?auto_72585 ) ( CLEAR ?auto_72579 ) ( not ( = ?auto_72578 ?auto_72585 ) ) ( not ( = ?auto_72579 ?auto_72585 ) ) ( not ( = ?auto_72581 ?auto_72585 ) ) ( TRUCK-AT ?auto_72583 ?auto_72587 ) ( not ( = ?auto_72587 ?auto_72582 ) ) ( not ( = ?auto_72580 ?auto_72587 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_72583 ?auto_72587 ?auto_72582 )
      ( MAKE-1CRATE ?auto_72578 ?auto_72579 )
      ( MAKE-1CRATE-VERIFY ?auto_72578 ?auto_72579 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72617 - SURFACE
      ?auto_72618 - SURFACE
      ?auto_72619 - SURFACE
      ?auto_72620 - SURFACE
    )
    :vars
    (
      ?auto_72621 - HOIST
      ?auto_72622 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72621 ?auto_72622 ) ( SURFACE-AT ?auto_72619 ?auto_72622 ) ( CLEAR ?auto_72619 ) ( LIFTING ?auto_72621 ?auto_72620 ) ( IS-CRATE ?auto_72620 ) ( not ( = ?auto_72619 ?auto_72620 ) ) ( ON ?auto_72618 ?auto_72617 ) ( ON ?auto_72619 ?auto_72618 ) ( not ( = ?auto_72617 ?auto_72618 ) ) ( not ( = ?auto_72617 ?auto_72619 ) ) ( not ( = ?auto_72617 ?auto_72620 ) ) ( not ( = ?auto_72618 ?auto_72619 ) ) ( not ( = ?auto_72618 ?auto_72620 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72619 ?auto_72620 )
      ( MAKE-3CRATE-VERIFY ?auto_72617 ?auto_72618 ?auto_72619 ?auto_72620 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72634 - SURFACE
      ?auto_72635 - SURFACE
      ?auto_72636 - SURFACE
      ?auto_72637 - SURFACE
    )
    :vars
    (
      ?auto_72638 - HOIST
      ?auto_72639 - PLACE
      ?auto_72640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72638 ?auto_72639 ) ( SURFACE-AT ?auto_72636 ?auto_72639 ) ( CLEAR ?auto_72636 ) ( IS-CRATE ?auto_72637 ) ( not ( = ?auto_72636 ?auto_72637 ) ) ( TRUCK-AT ?auto_72640 ?auto_72639 ) ( AVAILABLE ?auto_72638 ) ( IN ?auto_72637 ?auto_72640 ) ( ON ?auto_72636 ?auto_72635 ) ( not ( = ?auto_72635 ?auto_72636 ) ) ( not ( = ?auto_72635 ?auto_72637 ) ) ( ON ?auto_72635 ?auto_72634 ) ( not ( = ?auto_72634 ?auto_72635 ) ) ( not ( = ?auto_72634 ?auto_72636 ) ) ( not ( = ?auto_72634 ?auto_72637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72635 ?auto_72636 ?auto_72637 )
      ( MAKE-3CRATE-VERIFY ?auto_72634 ?auto_72635 ?auto_72636 ?auto_72637 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72655 - SURFACE
      ?auto_72656 - SURFACE
      ?auto_72657 - SURFACE
      ?auto_72658 - SURFACE
    )
    :vars
    (
      ?auto_72660 - HOIST
      ?auto_72661 - PLACE
      ?auto_72659 - TRUCK
      ?auto_72662 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72660 ?auto_72661 ) ( SURFACE-AT ?auto_72657 ?auto_72661 ) ( CLEAR ?auto_72657 ) ( IS-CRATE ?auto_72658 ) ( not ( = ?auto_72657 ?auto_72658 ) ) ( AVAILABLE ?auto_72660 ) ( IN ?auto_72658 ?auto_72659 ) ( ON ?auto_72657 ?auto_72656 ) ( not ( = ?auto_72656 ?auto_72657 ) ) ( not ( = ?auto_72656 ?auto_72658 ) ) ( TRUCK-AT ?auto_72659 ?auto_72662 ) ( not ( = ?auto_72662 ?auto_72661 ) ) ( ON ?auto_72656 ?auto_72655 ) ( not ( = ?auto_72655 ?auto_72656 ) ) ( not ( = ?auto_72655 ?auto_72657 ) ) ( not ( = ?auto_72655 ?auto_72658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72656 ?auto_72657 ?auto_72658 )
      ( MAKE-3CRATE-VERIFY ?auto_72655 ?auto_72656 ?auto_72657 ?auto_72658 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72679 - SURFACE
      ?auto_72680 - SURFACE
      ?auto_72681 - SURFACE
      ?auto_72682 - SURFACE
    )
    :vars
    (
      ?auto_72684 - HOIST
      ?auto_72686 - PLACE
      ?auto_72687 - TRUCK
      ?auto_72685 - PLACE
      ?auto_72683 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_72684 ?auto_72686 ) ( SURFACE-AT ?auto_72681 ?auto_72686 ) ( CLEAR ?auto_72681 ) ( IS-CRATE ?auto_72682 ) ( not ( = ?auto_72681 ?auto_72682 ) ) ( AVAILABLE ?auto_72684 ) ( ON ?auto_72681 ?auto_72680 ) ( not ( = ?auto_72680 ?auto_72681 ) ) ( not ( = ?auto_72680 ?auto_72682 ) ) ( TRUCK-AT ?auto_72687 ?auto_72685 ) ( not ( = ?auto_72685 ?auto_72686 ) ) ( HOIST-AT ?auto_72683 ?auto_72685 ) ( LIFTING ?auto_72683 ?auto_72682 ) ( not ( = ?auto_72684 ?auto_72683 ) ) ( ON ?auto_72680 ?auto_72679 ) ( not ( = ?auto_72679 ?auto_72680 ) ) ( not ( = ?auto_72679 ?auto_72681 ) ) ( not ( = ?auto_72679 ?auto_72682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72680 ?auto_72681 ?auto_72682 )
      ( MAKE-3CRATE-VERIFY ?auto_72679 ?auto_72680 ?auto_72681 ?auto_72682 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72706 - SURFACE
      ?auto_72707 - SURFACE
      ?auto_72708 - SURFACE
      ?auto_72709 - SURFACE
    )
    :vars
    (
      ?auto_72712 - HOIST
      ?auto_72715 - PLACE
      ?auto_72711 - TRUCK
      ?auto_72713 - PLACE
      ?auto_72714 - HOIST
      ?auto_72710 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72712 ?auto_72715 ) ( SURFACE-AT ?auto_72708 ?auto_72715 ) ( CLEAR ?auto_72708 ) ( IS-CRATE ?auto_72709 ) ( not ( = ?auto_72708 ?auto_72709 ) ) ( AVAILABLE ?auto_72712 ) ( ON ?auto_72708 ?auto_72707 ) ( not ( = ?auto_72707 ?auto_72708 ) ) ( not ( = ?auto_72707 ?auto_72709 ) ) ( TRUCK-AT ?auto_72711 ?auto_72713 ) ( not ( = ?auto_72713 ?auto_72715 ) ) ( HOIST-AT ?auto_72714 ?auto_72713 ) ( not ( = ?auto_72712 ?auto_72714 ) ) ( AVAILABLE ?auto_72714 ) ( SURFACE-AT ?auto_72709 ?auto_72713 ) ( ON ?auto_72709 ?auto_72710 ) ( CLEAR ?auto_72709 ) ( not ( = ?auto_72708 ?auto_72710 ) ) ( not ( = ?auto_72709 ?auto_72710 ) ) ( not ( = ?auto_72707 ?auto_72710 ) ) ( ON ?auto_72707 ?auto_72706 ) ( not ( = ?auto_72706 ?auto_72707 ) ) ( not ( = ?auto_72706 ?auto_72708 ) ) ( not ( = ?auto_72706 ?auto_72709 ) ) ( not ( = ?auto_72706 ?auto_72710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72707 ?auto_72708 ?auto_72709 )
      ( MAKE-3CRATE-VERIFY ?auto_72706 ?auto_72707 ?auto_72708 ?auto_72709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72734 - SURFACE
      ?auto_72735 - SURFACE
      ?auto_72736 - SURFACE
      ?auto_72737 - SURFACE
    )
    :vars
    (
      ?auto_72740 - HOIST
      ?auto_72742 - PLACE
      ?auto_72743 - PLACE
      ?auto_72739 - HOIST
      ?auto_72741 - SURFACE
      ?auto_72738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72740 ?auto_72742 ) ( SURFACE-AT ?auto_72736 ?auto_72742 ) ( CLEAR ?auto_72736 ) ( IS-CRATE ?auto_72737 ) ( not ( = ?auto_72736 ?auto_72737 ) ) ( AVAILABLE ?auto_72740 ) ( ON ?auto_72736 ?auto_72735 ) ( not ( = ?auto_72735 ?auto_72736 ) ) ( not ( = ?auto_72735 ?auto_72737 ) ) ( not ( = ?auto_72743 ?auto_72742 ) ) ( HOIST-AT ?auto_72739 ?auto_72743 ) ( not ( = ?auto_72740 ?auto_72739 ) ) ( AVAILABLE ?auto_72739 ) ( SURFACE-AT ?auto_72737 ?auto_72743 ) ( ON ?auto_72737 ?auto_72741 ) ( CLEAR ?auto_72737 ) ( not ( = ?auto_72736 ?auto_72741 ) ) ( not ( = ?auto_72737 ?auto_72741 ) ) ( not ( = ?auto_72735 ?auto_72741 ) ) ( TRUCK-AT ?auto_72738 ?auto_72742 ) ( ON ?auto_72735 ?auto_72734 ) ( not ( = ?auto_72734 ?auto_72735 ) ) ( not ( = ?auto_72734 ?auto_72736 ) ) ( not ( = ?auto_72734 ?auto_72737 ) ) ( not ( = ?auto_72734 ?auto_72741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72735 ?auto_72736 ?auto_72737 )
      ( MAKE-3CRATE-VERIFY ?auto_72734 ?auto_72735 ?auto_72736 ?auto_72737 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72762 - SURFACE
      ?auto_72763 - SURFACE
      ?auto_72764 - SURFACE
      ?auto_72765 - SURFACE
    )
    :vars
    (
      ?auto_72767 - HOIST
      ?auto_72768 - PLACE
      ?auto_72769 - PLACE
      ?auto_72771 - HOIST
      ?auto_72770 - SURFACE
      ?auto_72766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72767 ?auto_72768 ) ( IS-CRATE ?auto_72765 ) ( not ( = ?auto_72764 ?auto_72765 ) ) ( not ( = ?auto_72763 ?auto_72764 ) ) ( not ( = ?auto_72763 ?auto_72765 ) ) ( not ( = ?auto_72769 ?auto_72768 ) ) ( HOIST-AT ?auto_72771 ?auto_72769 ) ( not ( = ?auto_72767 ?auto_72771 ) ) ( AVAILABLE ?auto_72771 ) ( SURFACE-AT ?auto_72765 ?auto_72769 ) ( ON ?auto_72765 ?auto_72770 ) ( CLEAR ?auto_72765 ) ( not ( = ?auto_72764 ?auto_72770 ) ) ( not ( = ?auto_72765 ?auto_72770 ) ) ( not ( = ?auto_72763 ?auto_72770 ) ) ( TRUCK-AT ?auto_72766 ?auto_72768 ) ( SURFACE-AT ?auto_72763 ?auto_72768 ) ( CLEAR ?auto_72763 ) ( LIFTING ?auto_72767 ?auto_72764 ) ( IS-CRATE ?auto_72764 ) ( ON ?auto_72763 ?auto_72762 ) ( not ( = ?auto_72762 ?auto_72763 ) ) ( not ( = ?auto_72762 ?auto_72764 ) ) ( not ( = ?auto_72762 ?auto_72765 ) ) ( not ( = ?auto_72762 ?auto_72770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72763 ?auto_72764 ?auto_72765 )
      ( MAKE-3CRATE-VERIFY ?auto_72762 ?auto_72763 ?auto_72764 ?auto_72765 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72790 - SURFACE
      ?auto_72791 - SURFACE
      ?auto_72792 - SURFACE
      ?auto_72793 - SURFACE
    )
    :vars
    (
      ?auto_72795 - HOIST
      ?auto_72797 - PLACE
      ?auto_72798 - PLACE
      ?auto_72796 - HOIST
      ?auto_72794 - SURFACE
      ?auto_72799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72795 ?auto_72797 ) ( IS-CRATE ?auto_72793 ) ( not ( = ?auto_72792 ?auto_72793 ) ) ( not ( = ?auto_72791 ?auto_72792 ) ) ( not ( = ?auto_72791 ?auto_72793 ) ) ( not ( = ?auto_72798 ?auto_72797 ) ) ( HOIST-AT ?auto_72796 ?auto_72798 ) ( not ( = ?auto_72795 ?auto_72796 ) ) ( AVAILABLE ?auto_72796 ) ( SURFACE-AT ?auto_72793 ?auto_72798 ) ( ON ?auto_72793 ?auto_72794 ) ( CLEAR ?auto_72793 ) ( not ( = ?auto_72792 ?auto_72794 ) ) ( not ( = ?auto_72793 ?auto_72794 ) ) ( not ( = ?auto_72791 ?auto_72794 ) ) ( TRUCK-AT ?auto_72799 ?auto_72797 ) ( SURFACE-AT ?auto_72791 ?auto_72797 ) ( CLEAR ?auto_72791 ) ( IS-CRATE ?auto_72792 ) ( AVAILABLE ?auto_72795 ) ( IN ?auto_72792 ?auto_72799 ) ( ON ?auto_72791 ?auto_72790 ) ( not ( = ?auto_72790 ?auto_72791 ) ) ( not ( = ?auto_72790 ?auto_72792 ) ) ( not ( = ?auto_72790 ?auto_72793 ) ) ( not ( = ?auto_72790 ?auto_72794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72791 ?auto_72792 ?auto_72793 )
      ( MAKE-3CRATE-VERIFY ?auto_72790 ?auto_72791 ?auto_72792 ?auto_72793 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72800 - SURFACE
      ?auto_72801 - SURFACE
    )
    :vars
    (
      ?auto_72803 - HOIST
      ?auto_72805 - PLACE
      ?auto_72806 - SURFACE
      ?auto_72807 - PLACE
      ?auto_72804 - HOIST
      ?auto_72802 - SURFACE
      ?auto_72808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72803 ?auto_72805 ) ( IS-CRATE ?auto_72801 ) ( not ( = ?auto_72800 ?auto_72801 ) ) ( not ( = ?auto_72806 ?auto_72800 ) ) ( not ( = ?auto_72806 ?auto_72801 ) ) ( not ( = ?auto_72807 ?auto_72805 ) ) ( HOIST-AT ?auto_72804 ?auto_72807 ) ( not ( = ?auto_72803 ?auto_72804 ) ) ( AVAILABLE ?auto_72804 ) ( SURFACE-AT ?auto_72801 ?auto_72807 ) ( ON ?auto_72801 ?auto_72802 ) ( CLEAR ?auto_72801 ) ( not ( = ?auto_72800 ?auto_72802 ) ) ( not ( = ?auto_72801 ?auto_72802 ) ) ( not ( = ?auto_72806 ?auto_72802 ) ) ( SURFACE-AT ?auto_72806 ?auto_72805 ) ( CLEAR ?auto_72806 ) ( IS-CRATE ?auto_72800 ) ( AVAILABLE ?auto_72803 ) ( IN ?auto_72800 ?auto_72808 ) ( TRUCK-AT ?auto_72808 ?auto_72807 ) )
    :subtasks
    ( ( !DRIVE ?auto_72808 ?auto_72807 ?auto_72805 )
      ( MAKE-2CRATE ?auto_72806 ?auto_72800 ?auto_72801 )
      ( MAKE-1CRATE-VERIFY ?auto_72800 ?auto_72801 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72809 - SURFACE
      ?auto_72810 - SURFACE
      ?auto_72811 - SURFACE
    )
    :vars
    (
      ?auto_72815 - HOIST
      ?auto_72812 - PLACE
      ?auto_72813 - PLACE
      ?auto_72817 - HOIST
      ?auto_72814 - SURFACE
      ?auto_72816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72815 ?auto_72812 ) ( IS-CRATE ?auto_72811 ) ( not ( = ?auto_72810 ?auto_72811 ) ) ( not ( = ?auto_72809 ?auto_72810 ) ) ( not ( = ?auto_72809 ?auto_72811 ) ) ( not ( = ?auto_72813 ?auto_72812 ) ) ( HOIST-AT ?auto_72817 ?auto_72813 ) ( not ( = ?auto_72815 ?auto_72817 ) ) ( AVAILABLE ?auto_72817 ) ( SURFACE-AT ?auto_72811 ?auto_72813 ) ( ON ?auto_72811 ?auto_72814 ) ( CLEAR ?auto_72811 ) ( not ( = ?auto_72810 ?auto_72814 ) ) ( not ( = ?auto_72811 ?auto_72814 ) ) ( not ( = ?auto_72809 ?auto_72814 ) ) ( SURFACE-AT ?auto_72809 ?auto_72812 ) ( CLEAR ?auto_72809 ) ( IS-CRATE ?auto_72810 ) ( AVAILABLE ?auto_72815 ) ( IN ?auto_72810 ?auto_72816 ) ( TRUCK-AT ?auto_72816 ?auto_72813 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72810 ?auto_72811 )
      ( MAKE-2CRATE-VERIFY ?auto_72809 ?auto_72810 ?auto_72811 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72818 - SURFACE
      ?auto_72819 - SURFACE
      ?auto_72820 - SURFACE
      ?auto_72821 - SURFACE
    )
    :vars
    (
      ?auto_72823 - HOIST
      ?auto_72827 - PLACE
      ?auto_72822 - PLACE
      ?auto_72826 - HOIST
      ?auto_72825 - SURFACE
      ?auto_72824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72823 ?auto_72827 ) ( IS-CRATE ?auto_72821 ) ( not ( = ?auto_72820 ?auto_72821 ) ) ( not ( = ?auto_72819 ?auto_72820 ) ) ( not ( = ?auto_72819 ?auto_72821 ) ) ( not ( = ?auto_72822 ?auto_72827 ) ) ( HOIST-AT ?auto_72826 ?auto_72822 ) ( not ( = ?auto_72823 ?auto_72826 ) ) ( AVAILABLE ?auto_72826 ) ( SURFACE-AT ?auto_72821 ?auto_72822 ) ( ON ?auto_72821 ?auto_72825 ) ( CLEAR ?auto_72821 ) ( not ( = ?auto_72820 ?auto_72825 ) ) ( not ( = ?auto_72821 ?auto_72825 ) ) ( not ( = ?auto_72819 ?auto_72825 ) ) ( SURFACE-AT ?auto_72819 ?auto_72827 ) ( CLEAR ?auto_72819 ) ( IS-CRATE ?auto_72820 ) ( AVAILABLE ?auto_72823 ) ( IN ?auto_72820 ?auto_72824 ) ( TRUCK-AT ?auto_72824 ?auto_72822 ) ( ON ?auto_72819 ?auto_72818 ) ( not ( = ?auto_72818 ?auto_72819 ) ) ( not ( = ?auto_72818 ?auto_72820 ) ) ( not ( = ?auto_72818 ?auto_72821 ) ) ( not ( = ?auto_72818 ?auto_72825 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72819 ?auto_72820 ?auto_72821 )
      ( MAKE-3CRATE-VERIFY ?auto_72818 ?auto_72819 ?auto_72820 ?auto_72821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72828 - SURFACE
      ?auto_72829 - SURFACE
    )
    :vars
    (
      ?auto_72831 - HOIST
      ?auto_72836 - PLACE
      ?auto_72834 - SURFACE
      ?auto_72830 - PLACE
      ?auto_72835 - HOIST
      ?auto_72833 - SURFACE
      ?auto_72832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72831 ?auto_72836 ) ( IS-CRATE ?auto_72829 ) ( not ( = ?auto_72828 ?auto_72829 ) ) ( not ( = ?auto_72834 ?auto_72828 ) ) ( not ( = ?auto_72834 ?auto_72829 ) ) ( not ( = ?auto_72830 ?auto_72836 ) ) ( HOIST-AT ?auto_72835 ?auto_72830 ) ( not ( = ?auto_72831 ?auto_72835 ) ) ( SURFACE-AT ?auto_72829 ?auto_72830 ) ( ON ?auto_72829 ?auto_72833 ) ( CLEAR ?auto_72829 ) ( not ( = ?auto_72828 ?auto_72833 ) ) ( not ( = ?auto_72829 ?auto_72833 ) ) ( not ( = ?auto_72834 ?auto_72833 ) ) ( SURFACE-AT ?auto_72834 ?auto_72836 ) ( CLEAR ?auto_72834 ) ( IS-CRATE ?auto_72828 ) ( AVAILABLE ?auto_72831 ) ( TRUCK-AT ?auto_72832 ?auto_72830 ) ( LIFTING ?auto_72835 ?auto_72828 ) )
    :subtasks
    ( ( !LOAD ?auto_72835 ?auto_72828 ?auto_72832 ?auto_72830 )
      ( MAKE-2CRATE ?auto_72834 ?auto_72828 ?auto_72829 )
      ( MAKE-1CRATE-VERIFY ?auto_72828 ?auto_72829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72837 - SURFACE
      ?auto_72838 - SURFACE
      ?auto_72839 - SURFACE
    )
    :vars
    (
      ?auto_72845 - HOIST
      ?auto_72844 - PLACE
      ?auto_72843 - PLACE
      ?auto_72841 - HOIST
      ?auto_72842 - SURFACE
      ?auto_72840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72845 ?auto_72844 ) ( IS-CRATE ?auto_72839 ) ( not ( = ?auto_72838 ?auto_72839 ) ) ( not ( = ?auto_72837 ?auto_72838 ) ) ( not ( = ?auto_72837 ?auto_72839 ) ) ( not ( = ?auto_72843 ?auto_72844 ) ) ( HOIST-AT ?auto_72841 ?auto_72843 ) ( not ( = ?auto_72845 ?auto_72841 ) ) ( SURFACE-AT ?auto_72839 ?auto_72843 ) ( ON ?auto_72839 ?auto_72842 ) ( CLEAR ?auto_72839 ) ( not ( = ?auto_72838 ?auto_72842 ) ) ( not ( = ?auto_72839 ?auto_72842 ) ) ( not ( = ?auto_72837 ?auto_72842 ) ) ( SURFACE-AT ?auto_72837 ?auto_72844 ) ( CLEAR ?auto_72837 ) ( IS-CRATE ?auto_72838 ) ( AVAILABLE ?auto_72845 ) ( TRUCK-AT ?auto_72840 ?auto_72843 ) ( LIFTING ?auto_72841 ?auto_72838 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72838 ?auto_72839 )
      ( MAKE-2CRATE-VERIFY ?auto_72837 ?auto_72838 ?auto_72839 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72846 - SURFACE
      ?auto_72847 - SURFACE
      ?auto_72848 - SURFACE
      ?auto_72849 - SURFACE
    )
    :vars
    (
      ?auto_72855 - HOIST
      ?auto_72853 - PLACE
      ?auto_72854 - PLACE
      ?auto_72850 - HOIST
      ?auto_72852 - SURFACE
      ?auto_72851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72855 ?auto_72853 ) ( IS-CRATE ?auto_72849 ) ( not ( = ?auto_72848 ?auto_72849 ) ) ( not ( = ?auto_72847 ?auto_72848 ) ) ( not ( = ?auto_72847 ?auto_72849 ) ) ( not ( = ?auto_72854 ?auto_72853 ) ) ( HOIST-AT ?auto_72850 ?auto_72854 ) ( not ( = ?auto_72855 ?auto_72850 ) ) ( SURFACE-AT ?auto_72849 ?auto_72854 ) ( ON ?auto_72849 ?auto_72852 ) ( CLEAR ?auto_72849 ) ( not ( = ?auto_72848 ?auto_72852 ) ) ( not ( = ?auto_72849 ?auto_72852 ) ) ( not ( = ?auto_72847 ?auto_72852 ) ) ( SURFACE-AT ?auto_72847 ?auto_72853 ) ( CLEAR ?auto_72847 ) ( IS-CRATE ?auto_72848 ) ( AVAILABLE ?auto_72855 ) ( TRUCK-AT ?auto_72851 ?auto_72854 ) ( LIFTING ?auto_72850 ?auto_72848 ) ( ON ?auto_72847 ?auto_72846 ) ( not ( = ?auto_72846 ?auto_72847 ) ) ( not ( = ?auto_72846 ?auto_72848 ) ) ( not ( = ?auto_72846 ?auto_72849 ) ) ( not ( = ?auto_72846 ?auto_72852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72847 ?auto_72848 ?auto_72849 )
      ( MAKE-3CRATE-VERIFY ?auto_72846 ?auto_72847 ?auto_72848 ?auto_72849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72856 - SURFACE
      ?auto_72857 - SURFACE
    )
    :vars
    (
      ?auto_72864 - HOIST
      ?auto_72861 - PLACE
      ?auto_72863 - SURFACE
      ?auto_72862 - PLACE
      ?auto_72858 - HOIST
      ?auto_72860 - SURFACE
      ?auto_72859 - TRUCK
      ?auto_72865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72864 ?auto_72861 ) ( IS-CRATE ?auto_72857 ) ( not ( = ?auto_72856 ?auto_72857 ) ) ( not ( = ?auto_72863 ?auto_72856 ) ) ( not ( = ?auto_72863 ?auto_72857 ) ) ( not ( = ?auto_72862 ?auto_72861 ) ) ( HOIST-AT ?auto_72858 ?auto_72862 ) ( not ( = ?auto_72864 ?auto_72858 ) ) ( SURFACE-AT ?auto_72857 ?auto_72862 ) ( ON ?auto_72857 ?auto_72860 ) ( CLEAR ?auto_72857 ) ( not ( = ?auto_72856 ?auto_72860 ) ) ( not ( = ?auto_72857 ?auto_72860 ) ) ( not ( = ?auto_72863 ?auto_72860 ) ) ( SURFACE-AT ?auto_72863 ?auto_72861 ) ( CLEAR ?auto_72863 ) ( IS-CRATE ?auto_72856 ) ( AVAILABLE ?auto_72864 ) ( TRUCK-AT ?auto_72859 ?auto_72862 ) ( AVAILABLE ?auto_72858 ) ( SURFACE-AT ?auto_72856 ?auto_72862 ) ( ON ?auto_72856 ?auto_72865 ) ( CLEAR ?auto_72856 ) ( not ( = ?auto_72856 ?auto_72865 ) ) ( not ( = ?auto_72857 ?auto_72865 ) ) ( not ( = ?auto_72863 ?auto_72865 ) ) ( not ( = ?auto_72860 ?auto_72865 ) ) )
    :subtasks
    ( ( !LIFT ?auto_72858 ?auto_72856 ?auto_72865 ?auto_72862 )
      ( MAKE-2CRATE ?auto_72863 ?auto_72856 ?auto_72857 )
      ( MAKE-1CRATE-VERIFY ?auto_72856 ?auto_72857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72866 - SURFACE
      ?auto_72867 - SURFACE
      ?auto_72868 - SURFACE
    )
    :vars
    (
      ?auto_72875 - HOIST
      ?auto_72871 - PLACE
      ?auto_72874 - PLACE
      ?auto_72870 - HOIST
      ?auto_72873 - SURFACE
      ?auto_72872 - TRUCK
      ?auto_72869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72875 ?auto_72871 ) ( IS-CRATE ?auto_72868 ) ( not ( = ?auto_72867 ?auto_72868 ) ) ( not ( = ?auto_72866 ?auto_72867 ) ) ( not ( = ?auto_72866 ?auto_72868 ) ) ( not ( = ?auto_72874 ?auto_72871 ) ) ( HOIST-AT ?auto_72870 ?auto_72874 ) ( not ( = ?auto_72875 ?auto_72870 ) ) ( SURFACE-AT ?auto_72868 ?auto_72874 ) ( ON ?auto_72868 ?auto_72873 ) ( CLEAR ?auto_72868 ) ( not ( = ?auto_72867 ?auto_72873 ) ) ( not ( = ?auto_72868 ?auto_72873 ) ) ( not ( = ?auto_72866 ?auto_72873 ) ) ( SURFACE-AT ?auto_72866 ?auto_72871 ) ( CLEAR ?auto_72866 ) ( IS-CRATE ?auto_72867 ) ( AVAILABLE ?auto_72875 ) ( TRUCK-AT ?auto_72872 ?auto_72874 ) ( AVAILABLE ?auto_72870 ) ( SURFACE-AT ?auto_72867 ?auto_72874 ) ( ON ?auto_72867 ?auto_72869 ) ( CLEAR ?auto_72867 ) ( not ( = ?auto_72867 ?auto_72869 ) ) ( not ( = ?auto_72868 ?auto_72869 ) ) ( not ( = ?auto_72866 ?auto_72869 ) ) ( not ( = ?auto_72873 ?auto_72869 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72867 ?auto_72868 )
      ( MAKE-2CRATE-VERIFY ?auto_72866 ?auto_72867 ?auto_72868 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72876 - SURFACE
      ?auto_72877 - SURFACE
      ?auto_72878 - SURFACE
      ?auto_72879 - SURFACE
    )
    :vars
    (
      ?auto_72886 - HOIST
      ?auto_72883 - PLACE
      ?auto_72885 - PLACE
      ?auto_72882 - HOIST
      ?auto_72880 - SURFACE
      ?auto_72884 - TRUCK
      ?auto_72881 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72886 ?auto_72883 ) ( IS-CRATE ?auto_72879 ) ( not ( = ?auto_72878 ?auto_72879 ) ) ( not ( = ?auto_72877 ?auto_72878 ) ) ( not ( = ?auto_72877 ?auto_72879 ) ) ( not ( = ?auto_72885 ?auto_72883 ) ) ( HOIST-AT ?auto_72882 ?auto_72885 ) ( not ( = ?auto_72886 ?auto_72882 ) ) ( SURFACE-AT ?auto_72879 ?auto_72885 ) ( ON ?auto_72879 ?auto_72880 ) ( CLEAR ?auto_72879 ) ( not ( = ?auto_72878 ?auto_72880 ) ) ( not ( = ?auto_72879 ?auto_72880 ) ) ( not ( = ?auto_72877 ?auto_72880 ) ) ( SURFACE-AT ?auto_72877 ?auto_72883 ) ( CLEAR ?auto_72877 ) ( IS-CRATE ?auto_72878 ) ( AVAILABLE ?auto_72886 ) ( TRUCK-AT ?auto_72884 ?auto_72885 ) ( AVAILABLE ?auto_72882 ) ( SURFACE-AT ?auto_72878 ?auto_72885 ) ( ON ?auto_72878 ?auto_72881 ) ( CLEAR ?auto_72878 ) ( not ( = ?auto_72878 ?auto_72881 ) ) ( not ( = ?auto_72879 ?auto_72881 ) ) ( not ( = ?auto_72877 ?auto_72881 ) ) ( not ( = ?auto_72880 ?auto_72881 ) ) ( ON ?auto_72877 ?auto_72876 ) ( not ( = ?auto_72876 ?auto_72877 ) ) ( not ( = ?auto_72876 ?auto_72878 ) ) ( not ( = ?auto_72876 ?auto_72879 ) ) ( not ( = ?auto_72876 ?auto_72880 ) ) ( not ( = ?auto_72876 ?auto_72881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72877 ?auto_72878 ?auto_72879 )
      ( MAKE-3CRATE-VERIFY ?auto_72876 ?auto_72877 ?auto_72878 ?auto_72879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72887 - SURFACE
      ?auto_72888 - SURFACE
    )
    :vars
    (
      ?auto_72896 - HOIST
      ?auto_72893 - PLACE
      ?auto_72892 - SURFACE
      ?auto_72895 - PLACE
      ?auto_72891 - HOIST
      ?auto_72889 - SURFACE
      ?auto_72890 - SURFACE
      ?auto_72894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72896 ?auto_72893 ) ( IS-CRATE ?auto_72888 ) ( not ( = ?auto_72887 ?auto_72888 ) ) ( not ( = ?auto_72892 ?auto_72887 ) ) ( not ( = ?auto_72892 ?auto_72888 ) ) ( not ( = ?auto_72895 ?auto_72893 ) ) ( HOIST-AT ?auto_72891 ?auto_72895 ) ( not ( = ?auto_72896 ?auto_72891 ) ) ( SURFACE-AT ?auto_72888 ?auto_72895 ) ( ON ?auto_72888 ?auto_72889 ) ( CLEAR ?auto_72888 ) ( not ( = ?auto_72887 ?auto_72889 ) ) ( not ( = ?auto_72888 ?auto_72889 ) ) ( not ( = ?auto_72892 ?auto_72889 ) ) ( SURFACE-AT ?auto_72892 ?auto_72893 ) ( CLEAR ?auto_72892 ) ( IS-CRATE ?auto_72887 ) ( AVAILABLE ?auto_72896 ) ( AVAILABLE ?auto_72891 ) ( SURFACE-AT ?auto_72887 ?auto_72895 ) ( ON ?auto_72887 ?auto_72890 ) ( CLEAR ?auto_72887 ) ( not ( = ?auto_72887 ?auto_72890 ) ) ( not ( = ?auto_72888 ?auto_72890 ) ) ( not ( = ?auto_72892 ?auto_72890 ) ) ( not ( = ?auto_72889 ?auto_72890 ) ) ( TRUCK-AT ?auto_72894 ?auto_72893 ) )
    :subtasks
    ( ( !DRIVE ?auto_72894 ?auto_72893 ?auto_72895 )
      ( MAKE-2CRATE ?auto_72892 ?auto_72887 ?auto_72888 )
      ( MAKE-1CRATE-VERIFY ?auto_72887 ?auto_72888 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72897 - SURFACE
      ?auto_72898 - SURFACE
      ?auto_72899 - SURFACE
    )
    :vars
    (
      ?auto_72905 - HOIST
      ?auto_72906 - PLACE
      ?auto_72904 - PLACE
      ?auto_72901 - HOIST
      ?auto_72900 - SURFACE
      ?auto_72902 - SURFACE
      ?auto_72903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72905 ?auto_72906 ) ( IS-CRATE ?auto_72899 ) ( not ( = ?auto_72898 ?auto_72899 ) ) ( not ( = ?auto_72897 ?auto_72898 ) ) ( not ( = ?auto_72897 ?auto_72899 ) ) ( not ( = ?auto_72904 ?auto_72906 ) ) ( HOIST-AT ?auto_72901 ?auto_72904 ) ( not ( = ?auto_72905 ?auto_72901 ) ) ( SURFACE-AT ?auto_72899 ?auto_72904 ) ( ON ?auto_72899 ?auto_72900 ) ( CLEAR ?auto_72899 ) ( not ( = ?auto_72898 ?auto_72900 ) ) ( not ( = ?auto_72899 ?auto_72900 ) ) ( not ( = ?auto_72897 ?auto_72900 ) ) ( SURFACE-AT ?auto_72897 ?auto_72906 ) ( CLEAR ?auto_72897 ) ( IS-CRATE ?auto_72898 ) ( AVAILABLE ?auto_72905 ) ( AVAILABLE ?auto_72901 ) ( SURFACE-AT ?auto_72898 ?auto_72904 ) ( ON ?auto_72898 ?auto_72902 ) ( CLEAR ?auto_72898 ) ( not ( = ?auto_72898 ?auto_72902 ) ) ( not ( = ?auto_72899 ?auto_72902 ) ) ( not ( = ?auto_72897 ?auto_72902 ) ) ( not ( = ?auto_72900 ?auto_72902 ) ) ( TRUCK-AT ?auto_72903 ?auto_72906 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72898 ?auto_72899 )
      ( MAKE-2CRATE-VERIFY ?auto_72897 ?auto_72898 ?auto_72899 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72907 - SURFACE
      ?auto_72908 - SURFACE
      ?auto_72909 - SURFACE
      ?auto_72910 - SURFACE
    )
    :vars
    (
      ?auto_72917 - HOIST
      ?auto_72911 - PLACE
      ?auto_72914 - PLACE
      ?auto_72912 - HOIST
      ?auto_72916 - SURFACE
      ?auto_72915 - SURFACE
      ?auto_72913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72917 ?auto_72911 ) ( IS-CRATE ?auto_72910 ) ( not ( = ?auto_72909 ?auto_72910 ) ) ( not ( = ?auto_72908 ?auto_72909 ) ) ( not ( = ?auto_72908 ?auto_72910 ) ) ( not ( = ?auto_72914 ?auto_72911 ) ) ( HOIST-AT ?auto_72912 ?auto_72914 ) ( not ( = ?auto_72917 ?auto_72912 ) ) ( SURFACE-AT ?auto_72910 ?auto_72914 ) ( ON ?auto_72910 ?auto_72916 ) ( CLEAR ?auto_72910 ) ( not ( = ?auto_72909 ?auto_72916 ) ) ( not ( = ?auto_72910 ?auto_72916 ) ) ( not ( = ?auto_72908 ?auto_72916 ) ) ( SURFACE-AT ?auto_72908 ?auto_72911 ) ( CLEAR ?auto_72908 ) ( IS-CRATE ?auto_72909 ) ( AVAILABLE ?auto_72917 ) ( AVAILABLE ?auto_72912 ) ( SURFACE-AT ?auto_72909 ?auto_72914 ) ( ON ?auto_72909 ?auto_72915 ) ( CLEAR ?auto_72909 ) ( not ( = ?auto_72909 ?auto_72915 ) ) ( not ( = ?auto_72910 ?auto_72915 ) ) ( not ( = ?auto_72908 ?auto_72915 ) ) ( not ( = ?auto_72916 ?auto_72915 ) ) ( TRUCK-AT ?auto_72913 ?auto_72911 ) ( ON ?auto_72908 ?auto_72907 ) ( not ( = ?auto_72907 ?auto_72908 ) ) ( not ( = ?auto_72907 ?auto_72909 ) ) ( not ( = ?auto_72907 ?auto_72910 ) ) ( not ( = ?auto_72907 ?auto_72916 ) ) ( not ( = ?auto_72907 ?auto_72915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72908 ?auto_72909 ?auto_72910 )
      ( MAKE-3CRATE-VERIFY ?auto_72907 ?auto_72908 ?auto_72909 ?auto_72910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_72918 - SURFACE
      ?auto_72919 - SURFACE
    )
    :vars
    (
      ?auto_72927 - HOIST
      ?auto_72920 - PLACE
      ?auto_72923 - SURFACE
      ?auto_72924 - PLACE
      ?auto_72921 - HOIST
      ?auto_72926 - SURFACE
      ?auto_72925 - SURFACE
      ?auto_72922 - TRUCK
      ?auto_72928 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72927 ?auto_72920 ) ( IS-CRATE ?auto_72919 ) ( not ( = ?auto_72918 ?auto_72919 ) ) ( not ( = ?auto_72923 ?auto_72918 ) ) ( not ( = ?auto_72923 ?auto_72919 ) ) ( not ( = ?auto_72924 ?auto_72920 ) ) ( HOIST-AT ?auto_72921 ?auto_72924 ) ( not ( = ?auto_72927 ?auto_72921 ) ) ( SURFACE-AT ?auto_72919 ?auto_72924 ) ( ON ?auto_72919 ?auto_72926 ) ( CLEAR ?auto_72919 ) ( not ( = ?auto_72918 ?auto_72926 ) ) ( not ( = ?auto_72919 ?auto_72926 ) ) ( not ( = ?auto_72923 ?auto_72926 ) ) ( IS-CRATE ?auto_72918 ) ( AVAILABLE ?auto_72921 ) ( SURFACE-AT ?auto_72918 ?auto_72924 ) ( ON ?auto_72918 ?auto_72925 ) ( CLEAR ?auto_72918 ) ( not ( = ?auto_72918 ?auto_72925 ) ) ( not ( = ?auto_72919 ?auto_72925 ) ) ( not ( = ?auto_72923 ?auto_72925 ) ) ( not ( = ?auto_72926 ?auto_72925 ) ) ( TRUCK-AT ?auto_72922 ?auto_72920 ) ( SURFACE-AT ?auto_72928 ?auto_72920 ) ( CLEAR ?auto_72928 ) ( LIFTING ?auto_72927 ?auto_72923 ) ( IS-CRATE ?auto_72923 ) ( not ( = ?auto_72928 ?auto_72923 ) ) ( not ( = ?auto_72918 ?auto_72928 ) ) ( not ( = ?auto_72919 ?auto_72928 ) ) ( not ( = ?auto_72926 ?auto_72928 ) ) ( not ( = ?auto_72925 ?auto_72928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72928 ?auto_72923 )
      ( MAKE-2CRATE ?auto_72923 ?auto_72918 ?auto_72919 )
      ( MAKE-1CRATE-VERIFY ?auto_72918 ?auto_72919 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_72929 - SURFACE
      ?auto_72930 - SURFACE
      ?auto_72931 - SURFACE
    )
    :vars
    (
      ?auto_72935 - HOIST
      ?auto_72939 - PLACE
      ?auto_72934 - PLACE
      ?auto_72936 - HOIST
      ?auto_72933 - SURFACE
      ?auto_72932 - SURFACE
      ?auto_72937 - TRUCK
      ?auto_72938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_72935 ?auto_72939 ) ( IS-CRATE ?auto_72931 ) ( not ( = ?auto_72930 ?auto_72931 ) ) ( not ( = ?auto_72929 ?auto_72930 ) ) ( not ( = ?auto_72929 ?auto_72931 ) ) ( not ( = ?auto_72934 ?auto_72939 ) ) ( HOIST-AT ?auto_72936 ?auto_72934 ) ( not ( = ?auto_72935 ?auto_72936 ) ) ( SURFACE-AT ?auto_72931 ?auto_72934 ) ( ON ?auto_72931 ?auto_72933 ) ( CLEAR ?auto_72931 ) ( not ( = ?auto_72930 ?auto_72933 ) ) ( not ( = ?auto_72931 ?auto_72933 ) ) ( not ( = ?auto_72929 ?auto_72933 ) ) ( IS-CRATE ?auto_72930 ) ( AVAILABLE ?auto_72936 ) ( SURFACE-AT ?auto_72930 ?auto_72934 ) ( ON ?auto_72930 ?auto_72932 ) ( CLEAR ?auto_72930 ) ( not ( = ?auto_72930 ?auto_72932 ) ) ( not ( = ?auto_72931 ?auto_72932 ) ) ( not ( = ?auto_72929 ?auto_72932 ) ) ( not ( = ?auto_72933 ?auto_72932 ) ) ( TRUCK-AT ?auto_72937 ?auto_72939 ) ( SURFACE-AT ?auto_72938 ?auto_72939 ) ( CLEAR ?auto_72938 ) ( LIFTING ?auto_72935 ?auto_72929 ) ( IS-CRATE ?auto_72929 ) ( not ( = ?auto_72938 ?auto_72929 ) ) ( not ( = ?auto_72930 ?auto_72938 ) ) ( not ( = ?auto_72931 ?auto_72938 ) ) ( not ( = ?auto_72933 ?auto_72938 ) ) ( not ( = ?auto_72932 ?auto_72938 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_72930 ?auto_72931 )
      ( MAKE-2CRATE-VERIFY ?auto_72929 ?auto_72930 ?auto_72931 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_72940 - SURFACE
      ?auto_72941 - SURFACE
      ?auto_72942 - SURFACE
      ?auto_72943 - SURFACE
    )
    :vars
    (
      ?auto_72944 - HOIST
      ?auto_72946 - PLACE
      ?auto_72947 - PLACE
      ?auto_72950 - HOIST
      ?auto_72945 - SURFACE
      ?auto_72948 - SURFACE
      ?auto_72949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_72944 ?auto_72946 ) ( IS-CRATE ?auto_72943 ) ( not ( = ?auto_72942 ?auto_72943 ) ) ( not ( = ?auto_72941 ?auto_72942 ) ) ( not ( = ?auto_72941 ?auto_72943 ) ) ( not ( = ?auto_72947 ?auto_72946 ) ) ( HOIST-AT ?auto_72950 ?auto_72947 ) ( not ( = ?auto_72944 ?auto_72950 ) ) ( SURFACE-AT ?auto_72943 ?auto_72947 ) ( ON ?auto_72943 ?auto_72945 ) ( CLEAR ?auto_72943 ) ( not ( = ?auto_72942 ?auto_72945 ) ) ( not ( = ?auto_72943 ?auto_72945 ) ) ( not ( = ?auto_72941 ?auto_72945 ) ) ( IS-CRATE ?auto_72942 ) ( AVAILABLE ?auto_72950 ) ( SURFACE-AT ?auto_72942 ?auto_72947 ) ( ON ?auto_72942 ?auto_72948 ) ( CLEAR ?auto_72942 ) ( not ( = ?auto_72942 ?auto_72948 ) ) ( not ( = ?auto_72943 ?auto_72948 ) ) ( not ( = ?auto_72941 ?auto_72948 ) ) ( not ( = ?auto_72945 ?auto_72948 ) ) ( TRUCK-AT ?auto_72949 ?auto_72946 ) ( SURFACE-AT ?auto_72940 ?auto_72946 ) ( CLEAR ?auto_72940 ) ( LIFTING ?auto_72944 ?auto_72941 ) ( IS-CRATE ?auto_72941 ) ( not ( = ?auto_72940 ?auto_72941 ) ) ( not ( = ?auto_72942 ?auto_72940 ) ) ( not ( = ?auto_72943 ?auto_72940 ) ) ( not ( = ?auto_72945 ?auto_72940 ) ) ( not ( = ?auto_72948 ?auto_72940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_72941 ?auto_72942 ?auto_72943 )
      ( MAKE-3CRATE-VERIFY ?auto_72940 ?auto_72941 ?auto_72942 ?auto_72943 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73086 - SURFACE
      ?auto_73087 - SURFACE
      ?auto_73088 - SURFACE
      ?auto_73090 - SURFACE
      ?auto_73089 - SURFACE
    )
    :vars
    (
      ?auto_73092 - HOIST
      ?auto_73091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73092 ?auto_73091 ) ( SURFACE-AT ?auto_73090 ?auto_73091 ) ( CLEAR ?auto_73090 ) ( LIFTING ?auto_73092 ?auto_73089 ) ( IS-CRATE ?auto_73089 ) ( not ( = ?auto_73090 ?auto_73089 ) ) ( ON ?auto_73087 ?auto_73086 ) ( ON ?auto_73088 ?auto_73087 ) ( ON ?auto_73090 ?auto_73088 ) ( not ( = ?auto_73086 ?auto_73087 ) ) ( not ( = ?auto_73086 ?auto_73088 ) ) ( not ( = ?auto_73086 ?auto_73090 ) ) ( not ( = ?auto_73086 ?auto_73089 ) ) ( not ( = ?auto_73087 ?auto_73088 ) ) ( not ( = ?auto_73087 ?auto_73090 ) ) ( not ( = ?auto_73087 ?auto_73089 ) ) ( not ( = ?auto_73088 ?auto_73090 ) ) ( not ( = ?auto_73088 ?auto_73089 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73090 ?auto_73089 )
      ( MAKE-4CRATE-VERIFY ?auto_73086 ?auto_73087 ?auto_73088 ?auto_73090 ?auto_73089 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73111 - SURFACE
      ?auto_73112 - SURFACE
      ?auto_73113 - SURFACE
      ?auto_73115 - SURFACE
      ?auto_73114 - SURFACE
    )
    :vars
    (
      ?auto_73118 - HOIST
      ?auto_73117 - PLACE
      ?auto_73116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73118 ?auto_73117 ) ( SURFACE-AT ?auto_73115 ?auto_73117 ) ( CLEAR ?auto_73115 ) ( IS-CRATE ?auto_73114 ) ( not ( = ?auto_73115 ?auto_73114 ) ) ( TRUCK-AT ?auto_73116 ?auto_73117 ) ( AVAILABLE ?auto_73118 ) ( IN ?auto_73114 ?auto_73116 ) ( ON ?auto_73115 ?auto_73113 ) ( not ( = ?auto_73113 ?auto_73115 ) ) ( not ( = ?auto_73113 ?auto_73114 ) ) ( ON ?auto_73112 ?auto_73111 ) ( ON ?auto_73113 ?auto_73112 ) ( not ( = ?auto_73111 ?auto_73112 ) ) ( not ( = ?auto_73111 ?auto_73113 ) ) ( not ( = ?auto_73111 ?auto_73115 ) ) ( not ( = ?auto_73111 ?auto_73114 ) ) ( not ( = ?auto_73112 ?auto_73113 ) ) ( not ( = ?auto_73112 ?auto_73115 ) ) ( not ( = ?auto_73112 ?auto_73114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73113 ?auto_73115 ?auto_73114 )
      ( MAKE-4CRATE-VERIFY ?auto_73111 ?auto_73112 ?auto_73113 ?auto_73115 ?auto_73114 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73141 - SURFACE
      ?auto_73142 - SURFACE
      ?auto_73143 - SURFACE
      ?auto_73145 - SURFACE
      ?auto_73144 - SURFACE
    )
    :vars
    (
      ?auto_73146 - HOIST
      ?auto_73148 - PLACE
      ?auto_73149 - TRUCK
      ?auto_73147 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73146 ?auto_73148 ) ( SURFACE-AT ?auto_73145 ?auto_73148 ) ( CLEAR ?auto_73145 ) ( IS-CRATE ?auto_73144 ) ( not ( = ?auto_73145 ?auto_73144 ) ) ( AVAILABLE ?auto_73146 ) ( IN ?auto_73144 ?auto_73149 ) ( ON ?auto_73145 ?auto_73143 ) ( not ( = ?auto_73143 ?auto_73145 ) ) ( not ( = ?auto_73143 ?auto_73144 ) ) ( TRUCK-AT ?auto_73149 ?auto_73147 ) ( not ( = ?auto_73147 ?auto_73148 ) ) ( ON ?auto_73142 ?auto_73141 ) ( ON ?auto_73143 ?auto_73142 ) ( not ( = ?auto_73141 ?auto_73142 ) ) ( not ( = ?auto_73141 ?auto_73143 ) ) ( not ( = ?auto_73141 ?auto_73145 ) ) ( not ( = ?auto_73141 ?auto_73144 ) ) ( not ( = ?auto_73142 ?auto_73143 ) ) ( not ( = ?auto_73142 ?auto_73145 ) ) ( not ( = ?auto_73142 ?auto_73144 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73143 ?auto_73145 ?auto_73144 )
      ( MAKE-4CRATE-VERIFY ?auto_73141 ?auto_73142 ?auto_73143 ?auto_73145 ?auto_73144 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73175 - SURFACE
      ?auto_73176 - SURFACE
      ?auto_73177 - SURFACE
      ?auto_73179 - SURFACE
      ?auto_73178 - SURFACE
    )
    :vars
    (
      ?auto_73183 - HOIST
      ?auto_73182 - PLACE
      ?auto_73184 - TRUCK
      ?auto_73180 - PLACE
      ?auto_73181 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_73183 ?auto_73182 ) ( SURFACE-AT ?auto_73179 ?auto_73182 ) ( CLEAR ?auto_73179 ) ( IS-CRATE ?auto_73178 ) ( not ( = ?auto_73179 ?auto_73178 ) ) ( AVAILABLE ?auto_73183 ) ( ON ?auto_73179 ?auto_73177 ) ( not ( = ?auto_73177 ?auto_73179 ) ) ( not ( = ?auto_73177 ?auto_73178 ) ) ( TRUCK-AT ?auto_73184 ?auto_73180 ) ( not ( = ?auto_73180 ?auto_73182 ) ) ( HOIST-AT ?auto_73181 ?auto_73180 ) ( LIFTING ?auto_73181 ?auto_73178 ) ( not ( = ?auto_73183 ?auto_73181 ) ) ( ON ?auto_73176 ?auto_73175 ) ( ON ?auto_73177 ?auto_73176 ) ( not ( = ?auto_73175 ?auto_73176 ) ) ( not ( = ?auto_73175 ?auto_73177 ) ) ( not ( = ?auto_73175 ?auto_73179 ) ) ( not ( = ?auto_73175 ?auto_73178 ) ) ( not ( = ?auto_73176 ?auto_73177 ) ) ( not ( = ?auto_73176 ?auto_73179 ) ) ( not ( = ?auto_73176 ?auto_73178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73177 ?auto_73179 ?auto_73178 )
      ( MAKE-4CRATE-VERIFY ?auto_73175 ?auto_73176 ?auto_73177 ?auto_73179 ?auto_73178 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73213 - SURFACE
      ?auto_73214 - SURFACE
      ?auto_73215 - SURFACE
      ?auto_73217 - SURFACE
      ?auto_73216 - SURFACE
    )
    :vars
    (
      ?auto_73218 - HOIST
      ?auto_73220 - PLACE
      ?auto_73219 - TRUCK
      ?auto_73223 - PLACE
      ?auto_73222 - HOIST
      ?auto_73221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73218 ?auto_73220 ) ( SURFACE-AT ?auto_73217 ?auto_73220 ) ( CLEAR ?auto_73217 ) ( IS-CRATE ?auto_73216 ) ( not ( = ?auto_73217 ?auto_73216 ) ) ( AVAILABLE ?auto_73218 ) ( ON ?auto_73217 ?auto_73215 ) ( not ( = ?auto_73215 ?auto_73217 ) ) ( not ( = ?auto_73215 ?auto_73216 ) ) ( TRUCK-AT ?auto_73219 ?auto_73223 ) ( not ( = ?auto_73223 ?auto_73220 ) ) ( HOIST-AT ?auto_73222 ?auto_73223 ) ( not ( = ?auto_73218 ?auto_73222 ) ) ( AVAILABLE ?auto_73222 ) ( SURFACE-AT ?auto_73216 ?auto_73223 ) ( ON ?auto_73216 ?auto_73221 ) ( CLEAR ?auto_73216 ) ( not ( = ?auto_73217 ?auto_73221 ) ) ( not ( = ?auto_73216 ?auto_73221 ) ) ( not ( = ?auto_73215 ?auto_73221 ) ) ( ON ?auto_73214 ?auto_73213 ) ( ON ?auto_73215 ?auto_73214 ) ( not ( = ?auto_73213 ?auto_73214 ) ) ( not ( = ?auto_73213 ?auto_73215 ) ) ( not ( = ?auto_73213 ?auto_73217 ) ) ( not ( = ?auto_73213 ?auto_73216 ) ) ( not ( = ?auto_73213 ?auto_73221 ) ) ( not ( = ?auto_73214 ?auto_73215 ) ) ( not ( = ?auto_73214 ?auto_73217 ) ) ( not ( = ?auto_73214 ?auto_73216 ) ) ( not ( = ?auto_73214 ?auto_73221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73215 ?auto_73217 ?auto_73216 )
      ( MAKE-4CRATE-VERIFY ?auto_73213 ?auto_73214 ?auto_73215 ?auto_73217 ?auto_73216 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73252 - SURFACE
      ?auto_73253 - SURFACE
      ?auto_73254 - SURFACE
      ?auto_73256 - SURFACE
      ?auto_73255 - SURFACE
    )
    :vars
    (
      ?auto_73257 - HOIST
      ?auto_73261 - PLACE
      ?auto_73262 - PLACE
      ?auto_73260 - HOIST
      ?auto_73259 - SURFACE
      ?auto_73258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73257 ?auto_73261 ) ( SURFACE-AT ?auto_73256 ?auto_73261 ) ( CLEAR ?auto_73256 ) ( IS-CRATE ?auto_73255 ) ( not ( = ?auto_73256 ?auto_73255 ) ) ( AVAILABLE ?auto_73257 ) ( ON ?auto_73256 ?auto_73254 ) ( not ( = ?auto_73254 ?auto_73256 ) ) ( not ( = ?auto_73254 ?auto_73255 ) ) ( not ( = ?auto_73262 ?auto_73261 ) ) ( HOIST-AT ?auto_73260 ?auto_73262 ) ( not ( = ?auto_73257 ?auto_73260 ) ) ( AVAILABLE ?auto_73260 ) ( SURFACE-AT ?auto_73255 ?auto_73262 ) ( ON ?auto_73255 ?auto_73259 ) ( CLEAR ?auto_73255 ) ( not ( = ?auto_73256 ?auto_73259 ) ) ( not ( = ?auto_73255 ?auto_73259 ) ) ( not ( = ?auto_73254 ?auto_73259 ) ) ( TRUCK-AT ?auto_73258 ?auto_73261 ) ( ON ?auto_73253 ?auto_73252 ) ( ON ?auto_73254 ?auto_73253 ) ( not ( = ?auto_73252 ?auto_73253 ) ) ( not ( = ?auto_73252 ?auto_73254 ) ) ( not ( = ?auto_73252 ?auto_73256 ) ) ( not ( = ?auto_73252 ?auto_73255 ) ) ( not ( = ?auto_73252 ?auto_73259 ) ) ( not ( = ?auto_73253 ?auto_73254 ) ) ( not ( = ?auto_73253 ?auto_73256 ) ) ( not ( = ?auto_73253 ?auto_73255 ) ) ( not ( = ?auto_73253 ?auto_73259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73254 ?auto_73256 ?auto_73255 )
      ( MAKE-4CRATE-VERIFY ?auto_73252 ?auto_73253 ?auto_73254 ?auto_73256 ?auto_73255 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73291 - SURFACE
      ?auto_73292 - SURFACE
      ?auto_73293 - SURFACE
      ?auto_73295 - SURFACE
      ?auto_73294 - SURFACE
    )
    :vars
    (
      ?auto_73298 - HOIST
      ?auto_73300 - PLACE
      ?auto_73301 - PLACE
      ?auto_73297 - HOIST
      ?auto_73296 - SURFACE
      ?auto_73299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73298 ?auto_73300 ) ( IS-CRATE ?auto_73294 ) ( not ( = ?auto_73295 ?auto_73294 ) ) ( not ( = ?auto_73293 ?auto_73295 ) ) ( not ( = ?auto_73293 ?auto_73294 ) ) ( not ( = ?auto_73301 ?auto_73300 ) ) ( HOIST-AT ?auto_73297 ?auto_73301 ) ( not ( = ?auto_73298 ?auto_73297 ) ) ( AVAILABLE ?auto_73297 ) ( SURFACE-AT ?auto_73294 ?auto_73301 ) ( ON ?auto_73294 ?auto_73296 ) ( CLEAR ?auto_73294 ) ( not ( = ?auto_73295 ?auto_73296 ) ) ( not ( = ?auto_73294 ?auto_73296 ) ) ( not ( = ?auto_73293 ?auto_73296 ) ) ( TRUCK-AT ?auto_73299 ?auto_73300 ) ( SURFACE-AT ?auto_73293 ?auto_73300 ) ( CLEAR ?auto_73293 ) ( LIFTING ?auto_73298 ?auto_73295 ) ( IS-CRATE ?auto_73295 ) ( ON ?auto_73292 ?auto_73291 ) ( ON ?auto_73293 ?auto_73292 ) ( not ( = ?auto_73291 ?auto_73292 ) ) ( not ( = ?auto_73291 ?auto_73293 ) ) ( not ( = ?auto_73291 ?auto_73295 ) ) ( not ( = ?auto_73291 ?auto_73294 ) ) ( not ( = ?auto_73291 ?auto_73296 ) ) ( not ( = ?auto_73292 ?auto_73293 ) ) ( not ( = ?auto_73292 ?auto_73295 ) ) ( not ( = ?auto_73292 ?auto_73294 ) ) ( not ( = ?auto_73292 ?auto_73296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73293 ?auto_73295 ?auto_73294 )
      ( MAKE-4CRATE-VERIFY ?auto_73291 ?auto_73292 ?auto_73293 ?auto_73295 ?auto_73294 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_73330 - SURFACE
      ?auto_73331 - SURFACE
      ?auto_73332 - SURFACE
      ?auto_73334 - SURFACE
      ?auto_73333 - SURFACE
    )
    :vars
    (
      ?auto_73340 - HOIST
      ?auto_73336 - PLACE
      ?auto_73337 - PLACE
      ?auto_73335 - HOIST
      ?auto_73338 - SURFACE
      ?auto_73339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_73340 ?auto_73336 ) ( IS-CRATE ?auto_73333 ) ( not ( = ?auto_73334 ?auto_73333 ) ) ( not ( = ?auto_73332 ?auto_73334 ) ) ( not ( = ?auto_73332 ?auto_73333 ) ) ( not ( = ?auto_73337 ?auto_73336 ) ) ( HOIST-AT ?auto_73335 ?auto_73337 ) ( not ( = ?auto_73340 ?auto_73335 ) ) ( AVAILABLE ?auto_73335 ) ( SURFACE-AT ?auto_73333 ?auto_73337 ) ( ON ?auto_73333 ?auto_73338 ) ( CLEAR ?auto_73333 ) ( not ( = ?auto_73334 ?auto_73338 ) ) ( not ( = ?auto_73333 ?auto_73338 ) ) ( not ( = ?auto_73332 ?auto_73338 ) ) ( TRUCK-AT ?auto_73339 ?auto_73336 ) ( SURFACE-AT ?auto_73332 ?auto_73336 ) ( CLEAR ?auto_73332 ) ( IS-CRATE ?auto_73334 ) ( AVAILABLE ?auto_73340 ) ( IN ?auto_73334 ?auto_73339 ) ( ON ?auto_73331 ?auto_73330 ) ( ON ?auto_73332 ?auto_73331 ) ( not ( = ?auto_73330 ?auto_73331 ) ) ( not ( = ?auto_73330 ?auto_73332 ) ) ( not ( = ?auto_73330 ?auto_73334 ) ) ( not ( = ?auto_73330 ?auto_73333 ) ) ( not ( = ?auto_73330 ?auto_73338 ) ) ( not ( = ?auto_73331 ?auto_73332 ) ) ( not ( = ?auto_73331 ?auto_73334 ) ) ( not ( = ?auto_73331 ?auto_73333 ) ) ( not ( = ?auto_73331 ?auto_73338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_73332 ?auto_73334 ?auto_73333 )
      ( MAKE-4CRATE-VERIFY ?auto_73330 ?auto_73331 ?auto_73332 ?auto_73334 ?auto_73333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_73603 - SURFACE
      ?auto_73604 - SURFACE
    )
    :vars
    (
      ?auto_73605 - HOIST
      ?auto_73610 - PLACE
      ?auto_73608 - SURFACE
      ?auto_73607 - PLACE
      ?auto_73611 - HOIST
      ?auto_73609 - SURFACE
      ?auto_73606 - TRUCK
      ?auto_73612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73605 ?auto_73610 ) ( SURFACE-AT ?auto_73603 ?auto_73610 ) ( CLEAR ?auto_73603 ) ( IS-CRATE ?auto_73604 ) ( not ( = ?auto_73603 ?auto_73604 ) ) ( ON ?auto_73603 ?auto_73608 ) ( not ( = ?auto_73608 ?auto_73603 ) ) ( not ( = ?auto_73608 ?auto_73604 ) ) ( not ( = ?auto_73607 ?auto_73610 ) ) ( HOIST-AT ?auto_73611 ?auto_73607 ) ( not ( = ?auto_73605 ?auto_73611 ) ) ( AVAILABLE ?auto_73611 ) ( SURFACE-AT ?auto_73604 ?auto_73607 ) ( ON ?auto_73604 ?auto_73609 ) ( CLEAR ?auto_73604 ) ( not ( = ?auto_73603 ?auto_73609 ) ) ( not ( = ?auto_73604 ?auto_73609 ) ) ( not ( = ?auto_73608 ?auto_73609 ) ) ( TRUCK-AT ?auto_73606 ?auto_73610 ) ( LIFTING ?auto_73605 ?auto_73612 ) ( IS-CRATE ?auto_73612 ) ( not ( = ?auto_73603 ?auto_73612 ) ) ( not ( = ?auto_73604 ?auto_73612 ) ) ( not ( = ?auto_73608 ?auto_73612 ) ) ( not ( = ?auto_73609 ?auto_73612 ) ) )
    :subtasks
    ( ( !LOAD ?auto_73605 ?auto_73612 ?auto_73606 ?auto_73610 )
      ( MAKE-1CRATE ?auto_73603 ?auto_73604 )
      ( MAKE-1CRATE-VERIFY ?auto_73603 ?auto_73604 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_73989 - SURFACE
      ?auto_73990 - SURFACE
      ?auto_73991 - SURFACE
      ?auto_73993 - SURFACE
      ?auto_73992 - SURFACE
      ?auto_73994 - SURFACE
    )
    :vars
    (
      ?auto_73996 - HOIST
      ?auto_73995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_73996 ?auto_73995 ) ( SURFACE-AT ?auto_73992 ?auto_73995 ) ( CLEAR ?auto_73992 ) ( LIFTING ?auto_73996 ?auto_73994 ) ( IS-CRATE ?auto_73994 ) ( not ( = ?auto_73992 ?auto_73994 ) ) ( ON ?auto_73990 ?auto_73989 ) ( ON ?auto_73991 ?auto_73990 ) ( ON ?auto_73993 ?auto_73991 ) ( ON ?auto_73992 ?auto_73993 ) ( not ( = ?auto_73989 ?auto_73990 ) ) ( not ( = ?auto_73989 ?auto_73991 ) ) ( not ( = ?auto_73989 ?auto_73993 ) ) ( not ( = ?auto_73989 ?auto_73992 ) ) ( not ( = ?auto_73989 ?auto_73994 ) ) ( not ( = ?auto_73990 ?auto_73991 ) ) ( not ( = ?auto_73990 ?auto_73993 ) ) ( not ( = ?auto_73990 ?auto_73992 ) ) ( not ( = ?auto_73990 ?auto_73994 ) ) ( not ( = ?auto_73991 ?auto_73993 ) ) ( not ( = ?auto_73991 ?auto_73992 ) ) ( not ( = ?auto_73991 ?auto_73994 ) ) ( not ( = ?auto_73993 ?auto_73992 ) ) ( not ( = ?auto_73993 ?auto_73994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_73992 ?auto_73994 )
      ( MAKE-5CRATE-VERIFY ?auto_73989 ?auto_73990 ?auto_73991 ?auto_73993 ?auto_73992 ?auto_73994 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74023 - SURFACE
      ?auto_74024 - SURFACE
      ?auto_74025 - SURFACE
      ?auto_74027 - SURFACE
      ?auto_74026 - SURFACE
      ?auto_74028 - SURFACE
    )
    :vars
    (
      ?auto_74030 - HOIST
      ?auto_74031 - PLACE
      ?auto_74029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74030 ?auto_74031 ) ( SURFACE-AT ?auto_74026 ?auto_74031 ) ( CLEAR ?auto_74026 ) ( IS-CRATE ?auto_74028 ) ( not ( = ?auto_74026 ?auto_74028 ) ) ( TRUCK-AT ?auto_74029 ?auto_74031 ) ( AVAILABLE ?auto_74030 ) ( IN ?auto_74028 ?auto_74029 ) ( ON ?auto_74026 ?auto_74027 ) ( not ( = ?auto_74027 ?auto_74026 ) ) ( not ( = ?auto_74027 ?auto_74028 ) ) ( ON ?auto_74024 ?auto_74023 ) ( ON ?auto_74025 ?auto_74024 ) ( ON ?auto_74027 ?auto_74025 ) ( not ( = ?auto_74023 ?auto_74024 ) ) ( not ( = ?auto_74023 ?auto_74025 ) ) ( not ( = ?auto_74023 ?auto_74027 ) ) ( not ( = ?auto_74023 ?auto_74026 ) ) ( not ( = ?auto_74023 ?auto_74028 ) ) ( not ( = ?auto_74024 ?auto_74025 ) ) ( not ( = ?auto_74024 ?auto_74027 ) ) ( not ( = ?auto_74024 ?auto_74026 ) ) ( not ( = ?auto_74024 ?auto_74028 ) ) ( not ( = ?auto_74025 ?auto_74027 ) ) ( not ( = ?auto_74025 ?auto_74026 ) ) ( not ( = ?auto_74025 ?auto_74028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74027 ?auto_74026 ?auto_74028 )
      ( MAKE-5CRATE-VERIFY ?auto_74023 ?auto_74024 ?auto_74025 ?auto_74027 ?auto_74026 ?auto_74028 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74063 - SURFACE
      ?auto_74064 - SURFACE
      ?auto_74065 - SURFACE
      ?auto_74067 - SURFACE
      ?auto_74066 - SURFACE
      ?auto_74068 - SURFACE
    )
    :vars
    (
      ?auto_74069 - HOIST
      ?auto_74070 - PLACE
      ?auto_74071 - TRUCK
      ?auto_74072 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74069 ?auto_74070 ) ( SURFACE-AT ?auto_74066 ?auto_74070 ) ( CLEAR ?auto_74066 ) ( IS-CRATE ?auto_74068 ) ( not ( = ?auto_74066 ?auto_74068 ) ) ( AVAILABLE ?auto_74069 ) ( IN ?auto_74068 ?auto_74071 ) ( ON ?auto_74066 ?auto_74067 ) ( not ( = ?auto_74067 ?auto_74066 ) ) ( not ( = ?auto_74067 ?auto_74068 ) ) ( TRUCK-AT ?auto_74071 ?auto_74072 ) ( not ( = ?auto_74072 ?auto_74070 ) ) ( ON ?auto_74064 ?auto_74063 ) ( ON ?auto_74065 ?auto_74064 ) ( ON ?auto_74067 ?auto_74065 ) ( not ( = ?auto_74063 ?auto_74064 ) ) ( not ( = ?auto_74063 ?auto_74065 ) ) ( not ( = ?auto_74063 ?auto_74067 ) ) ( not ( = ?auto_74063 ?auto_74066 ) ) ( not ( = ?auto_74063 ?auto_74068 ) ) ( not ( = ?auto_74064 ?auto_74065 ) ) ( not ( = ?auto_74064 ?auto_74067 ) ) ( not ( = ?auto_74064 ?auto_74066 ) ) ( not ( = ?auto_74064 ?auto_74068 ) ) ( not ( = ?auto_74065 ?auto_74067 ) ) ( not ( = ?auto_74065 ?auto_74066 ) ) ( not ( = ?auto_74065 ?auto_74068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74067 ?auto_74066 ?auto_74068 )
      ( MAKE-5CRATE-VERIFY ?auto_74063 ?auto_74064 ?auto_74065 ?auto_74067 ?auto_74066 ?auto_74068 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74108 - SURFACE
      ?auto_74109 - SURFACE
      ?auto_74110 - SURFACE
      ?auto_74112 - SURFACE
      ?auto_74111 - SURFACE
      ?auto_74113 - SURFACE
    )
    :vars
    (
      ?auto_74114 - HOIST
      ?auto_74115 - PLACE
      ?auto_74118 - TRUCK
      ?auto_74116 - PLACE
      ?auto_74117 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_74114 ?auto_74115 ) ( SURFACE-AT ?auto_74111 ?auto_74115 ) ( CLEAR ?auto_74111 ) ( IS-CRATE ?auto_74113 ) ( not ( = ?auto_74111 ?auto_74113 ) ) ( AVAILABLE ?auto_74114 ) ( ON ?auto_74111 ?auto_74112 ) ( not ( = ?auto_74112 ?auto_74111 ) ) ( not ( = ?auto_74112 ?auto_74113 ) ) ( TRUCK-AT ?auto_74118 ?auto_74116 ) ( not ( = ?auto_74116 ?auto_74115 ) ) ( HOIST-AT ?auto_74117 ?auto_74116 ) ( LIFTING ?auto_74117 ?auto_74113 ) ( not ( = ?auto_74114 ?auto_74117 ) ) ( ON ?auto_74109 ?auto_74108 ) ( ON ?auto_74110 ?auto_74109 ) ( ON ?auto_74112 ?auto_74110 ) ( not ( = ?auto_74108 ?auto_74109 ) ) ( not ( = ?auto_74108 ?auto_74110 ) ) ( not ( = ?auto_74108 ?auto_74112 ) ) ( not ( = ?auto_74108 ?auto_74111 ) ) ( not ( = ?auto_74108 ?auto_74113 ) ) ( not ( = ?auto_74109 ?auto_74110 ) ) ( not ( = ?auto_74109 ?auto_74112 ) ) ( not ( = ?auto_74109 ?auto_74111 ) ) ( not ( = ?auto_74109 ?auto_74113 ) ) ( not ( = ?auto_74110 ?auto_74112 ) ) ( not ( = ?auto_74110 ?auto_74111 ) ) ( not ( = ?auto_74110 ?auto_74113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74112 ?auto_74111 ?auto_74113 )
      ( MAKE-5CRATE-VERIFY ?auto_74108 ?auto_74109 ?auto_74110 ?auto_74112 ?auto_74111 ?auto_74113 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74158 - SURFACE
      ?auto_74159 - SURFACE
      ?auto_74160 - SURFACE
      ?auto_74162 - SURFACE
      ?auto_74161 - SURFACE
      ?auto_74163 - SURFACE
    )
    :vars
    (
      ?auto_74165 - HOIST
      ?auto_74166 - PLACE
      ?auto_74169 - TRUCK
      ?auto_74164 - PLACE
      ?auto_74167 - HOIST
      ?auto_74168 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74165 ?auto_74166 ) ( SURFACE-AT ?auto_74161 ?auto_74166 ) ( CLEAR ?auto_74161 ) ( IS-CRATE ?auto_74163 ) ( not ( = ?auto_74161 ?auto_74163 ) ) ( AVAILABLE ?auto_74165 ) ( ON ?auto_74161 ?auto_74162 ) ( not ( = ?auto_74162 ?auto_74161 ) ) ( not ( = ?auto_74162 ?auto_74163 ) ) ( TRUCK-AT ?auto_74169 ?auto_74164 ) ( not ( = ?auto_74164 ?auto_74166 ) ) ( HOIST-AT ?auto_74167 ?auto_74164 ) ( not ( = ?auto_74165 ?auto_74167 ) ) ( AVAILABLE ?auto_74167 ) ( SURFACE-AT ?auto_74163 ?auto_74164 ) ( ON ?auto_74163 ?auto_74168 ) ( CLEAR ?auto_74163 ) ( not ( = ?auto_74161 ?auto_74168 ) ) ( not ( = ?auto_74163 ?auto_74168 ) ) ( not ( = ?auto_74162 ?auto_74168 ) ) ( ON ?auto_74159 ?auto_74158 ) ( ON ?auto_74160 ?auto_74159 ) ( ON ?auto_74162 ?auto_74160 ) ( not ( = ?auto_74158 ?auto_74159 ) ) ( not ( = ?auto_74158 ?auto_74160 ) ) ( not ( = ?auto_74158 ?auto_74162 ) ) ( not ( = ?auto_74158 ?auto_74161 ) ) ( not ( = ?auto_74158 ?auto_74163 ) ) ( not ( = ?auto_74158 ?auto_74168 ) ) ( not ( = ?auto_74159 ?auto_74160 ) ) ( not ( = ?auto_74159 ?auto_74162 ) ) ( not ( = ?auto_74159 ?auto_74161 ) ) ( not ( = ?auto_74159 ?auto_74163 ) ) ( not ( = ?auto_74159 ?auto_74168 ) ) ( not ( = ?auto_74160 ?auto_74162 ) ) ( not ( = ?auto_74160 ?auto_74161 ) ) ( not ( = ?auto_74160 ?auto_74163 ) ) ( not ( = ?auto_74160 ?auto_74168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74162 ?auto_74161 ?auto_74163 )
      ( MAKE-5CRATE-VERIFY ?auto_74158 ?auto_74159 ?auto_74160 ?auto_74162 ?auto_74161 ?auto_74163 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74209 - SURFACE
      ?auto_74210 - SURFACE
      ?auto_74211 - SURFACE
      ?auto_74213 - SURFACE
      ?auto_74212 - SURFACE
      ?auto_74214 - SURFACE
    )
    :vars
    (
      ?auto_74219 - HOIST
      ?auto_74215 - PLACE
      ?auto_74216 - PLACE
      ?auto_74217 - HOIST
      ?auto_74218 - SURFACE
      ?auto_74220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74219 ?auto_74215 ) ( SURFACE-AT ?auto_74212 ?auto_74215 ) ( CLEAR ?auto_74212 ) ( IS-CRATE ?auto_74214 ) ( not ( = ?auto_74212 ?auto_74214 ) ) ( AVAILABLE ?auto_74219 ) ( ON ?auto_74212 ?auto_74213 ) ( not ( = ?auto_74213 ?auto_74212 ) ) ( not ( = ?auto_74213 ?auto_74214 ) ) ( not ( = ?auto_74216 ?auto_74215 ) ) ( HOIST-AT ?auto_74217 ?auto_74216 ) ( not ( = ?auto_74219 ?auto_74217 ) ) ( AVAILABLE ?auto_74217 ) ( SURFACE-AT ?auto_74214 ?auto_74216 ) ( ON ?auto_74214 ?auto_74218 ) ( CLEAR ?auto_74214 ) ( not ( = ?auto_74212 ?auto_74218 ) ) ( not ( = ?auto_74214 ?auto_74218 ) ) ( not ( = ?auto_74213 ?auto_74218 ) ) ( TRUCK-AT ?auto_74220 ?auto_74215 ) ( ON ?auto_74210 ?auto_74209 ) ( ON ?auto_74211 ?auto_74210 ) ( ON ?auto_74213 ?auto_74211 ) ( not ( = ?auto_74209 ?auto_74210 ) ) ( not ( = ?auto_74209 ?auto_74211 ) ) ( not ( = ?auto_74209 ?auto_74213 ) ) ( not ( = ?auto_74209 ?auto_74212 ) ) ( not ( = ?auto_74209 ?auto_74214 ) ) ( not ( = ?auto_74209 ?auto_74218 ) ) ( not ( = ?auto_74210 ?auto_74211 ) ) ( not ( = ?auto_74210 ?auto_74213 ) ) ( not ( = ?auto_74210 ?auto_74212 ) ) ( not ( = ?auto_74210 ?auto_74214 ) ) ( not ( = ?auto_74210 ?auto_74218 ) ) ( not ( = ?auto_74211 ?auto_74213 ) ) ( not ( = ?auto_74211 ?auto_74212 ) ) ( not ( = ?auto_74211 ?auto_74214 ) ) ( not ( = ?auto_74211 ?auto_74218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74213 ?auto_74212 ?auto_74214 )
      ( MAKE-5CRATE-VERIFY ?auto_74209 ?auto_74210 ?auto_74211 ?auto_74213 ?auto_74212 ?auto_74214 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74260 - SURFACE
      ?auto_74261 - SURFACE
      ?auto_74262 - SURFACE
      ?auto_74264 - SURFACE
      ?auto_74263 - SURFACE
      ?auto_74265 - SURFACE
    )
    :vars
    (
      ?auto_74266 - HOIST
      ?auto_74267 - PLACE
      ?auto_74271 - PLACE
      ?auto_74268 - HOIST
      ?auto_74269 - SURFACE
      ?auto_74270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74266 ?auto_74267 ) ( IS-CRATE ?auto_74265 ) ( not ( = ?auto_74263 ?auto_74265 ) ) ( not ( = ?auto_74264 ?auto_74263 ) ) ( not ( = ?auto_74264 ?auto_74265 ) ) ( not ( = ?auto_74271 ?auto_74267 ) ) ( HOIST-AT ?auto_74268 ?auto_74271 ) ( not ( = ?auto_74266 ?auto_74268 ) ) ( AVAILABLE ?auto_74268 ) ( SURFACE-AT ?auto_74265 ?auto_74271 ) ( ON ?auto_74265 ?auto_74269 ) ( CLEAR ?auto_74265 ) ( not ( = ?auto_74263 ?auto_74269 ) ) ( not ( = ?auto_74265 ?auto_74269 ) ) ( not ( = ?auto_74264 ?auto_74269 ) ) ( TRUCK-AT ?auto_74270 ?auto_74267 ) ( SURFACE-AT ?auto_74264 ?auto_74267 ) ( CLEAR ?auto_74264 ) ( LIFTING ?auto_74266 ?auto_74263 ) ( IS-CRATE ?auto_74263 ) ( ON ?auto_74261 ?auto_74260 ) ( ON ?auto_74262 ?auto_74261 ) ( ON ?auto_74264 ?auto_74262 ) ( not ( = ?auto_74260 ?auto_74261 ) ) ( not ( = ?auto_74260 ?auto_74262 ) ) ( not ( = ?auto_74260 ?auto_74264 ) ) ( not ( = ?auto_74260 ?auto_74263 ) ) ( not ( = ?auto_74260 ?auto_74265 ) ) ( not ( = ?auto_74260 ?auto_74269 ) ) ( not ( = ?auto_74261 ?auto_74262 ) ) ( not ( = ?auto_74261 ?auto_74264 ) ) ( not ( = ?auto_74261 ?auto_74263 ) ) ( not ( = ?auto_74261 ?auto_74265 ) ) ( not ( = ?auto_74261 ?auto_74269 ) ) ( not ( = ?auto_74262 ?auto_74264 ) ) ( not ( = ?auto_74262 ?auto_74263 ) ) ( not ( = ?auto_74262 ?auto_74265 ) ) ( not ( = ?auto_74262 ?auto_74269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74264 ?auto_74263 ?auto_74265 )
      ( MAKE-5CRATE-VERIFY ?auto_74260 ?auto_74261 ?auto_74262 ?auto_74264 ?auto_74263 ?auto_74265 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74311 - SURFACE
      ?auto_74312 - SURFACE
      ?auto_74313 - SURFACE
      ?auto_74315 - SURFACE
      ?auto_74314 - SURFACE
      ?auto_74316 - SURFACE
    )
    :vars
    (
      ?auto_74320 - HOIST
      ?auto_74322 - PLACE
      ?auto_74317 - PLACE
      ?auto_74321 - HOIST
      ?auto_74318 - SURFACE
      ?auto_74319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74320 ?auto_74322 ) ( IS-CRATE ?auto_74316 ) ( not ( = ?auto_74314 ?auto_74316 ) ) ( not ( = ?auto_74315 ?auto_74314 ) ) ( not ( = ?auto_74315 ?auto_74316 ) ) ( not ( = ?auto_74317 ?auto_74322 ) ) ( HOIST-AT ?auto_74321 ?auto_74317 ) ( not ( = ?auto_74320 ?auto_74321 ) ) ( AVAILABLE ?auto_74321 ) ( SURFACE-AT ?auto_74316 ?auto_74317 ) ( ON ?auto_74316 ?auto_74318 ) ( CLEAR ?auto_74316 ) ( not ( = ?auto_74314 ?auto_74318 ) ) ( not ( = ?auto_74316 ?auto_74318 ) ) ( not ( = ?auto_74315 ?auto_74318 ) ) ( TRUCK-AT ?auto_74319 ?auto_74322 ) ( SURFACE-AT ?auto_74315 ?auto_74322 ) ( CLEAR ?auto_74315 ) ( IS-CRATE ?auto_74314 ) ( AVAILABLE ?auto_74320 ) ( IN ?auto_74314 ?auto_74319 ) ( ON ?auto_74312 ?auto_74311 ) ( ON ?auto_74313 ?auto_74312 ) ( ON ?auto_74315 ?auto_74313 ) ( not ( = ?auto_74311 ?auto_74312 ) ) ( not ( = ?auto_74311 ?auto_74313 ) ) ( not ( = ?auto_74311 ?auto_74315 ) ) ( not ( = ?auto_74311 ?auto_74314 ) ) ( not ( = ?auto_74311 ?auto_74316 ) ) ( not ( = ?auto_74311 ?auto_74318 ) ) ( not ( = ?auto_74312 ?auto_74313 ) ) ( not ( = ?auto_74312 ?auto_74315 ) ) ( not ( = ?auto_74312 ?auto_74314 ) ) ( not ( = ?auto_74312 ?auto_74316 ) ) ( not ( = ?auto_74312 ?auto_74318 ) ) ( not ( = ?auto_74313 ?auto_74315 ) ) ( not ( = ?auto_74313 ?auto_74314 ) ) ( not ( = ?auto_74313 ?auto_74316 ) ) ( not ( = ?auto_74313 ?auto_74318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74315 ?auto_74314 ?auto_74316 )
      ( MAKE-5CRATE-VERIFY ?auto_74311 ?auto_74312 ?auto_74313 ?auto_74315 ?auto_74314 ?auto_74316 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_74351 - SURFACE
      ?auto_74352 - SURFACE
      ?auto_74353 - SURFACE
      ?auto_74355 - SURFACE
      ?auto_74354 - SURFACE
    )
    :vars
    (
      ?auto_74357 - HOIST
      ?auto_74359 - PLACE
      ?auto_74356 - PLACE
      ?auto_74361 - HOIST
      ?auto_74358 - SURFACE
      ?auto_74360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74357 ?auto_74359 ) ( IS-CRATE ?auto_74354 ) ( not ( = ?auto_74355 ?auto_74354 ) ) ( not ( = ?auto_74353 ?auto_74355 ) ) ( not ( = ?auto_74353 ?auto_74354 ) ) ( not ( = ?auto_74356 ?auto_74359 ) ) ( HOIST-AT ?auto_74361 ?auto_74356 ) ( not ( = ?auto_74357 ?auto_74361 ) ) ( AVAILABLE ?auto_74361 ) ( SURFACE-AT ?auto_74354 ?auto_74356 ) ( ON ?auto_74354 ?auto_74358 ) ( CLEAR ?auto_74354 ) ( not ( = ?auto_74355 ?auto_74358 ) ) ( not ( = ?auto_74354 ?auto_74358 ) ) ( not ( = ?auto_74353 ?auto_74358 ) ) ( SURFACE-AT ?auto_74353 ?auto_74359 ) ( CLEAR ?auto_74353 ) ( IS-CRATE ?auto_74355 ) ( AVAILABLE ?auto_74357 ) ( IN ?auto_74355 ?auto_74360 ) ( TRUCK-AT ?auto_74360 ?auto_74356 ) ( ON ?auto_74352 ?auto_74351 ) ( ON ?auto_74353 ?auto_74352 ) ( not ( = ?auto_74351 ?auto_74352 ) ) ( not ( = ?auto_74351 ?auto_74353 ) ) ( not ( = ?auto_74351 ?auto_74355 ) ) ( not ( = ?auto_74351 ?auto_74354 ) ) ( not ( = ?auto_74351 ?auto_74358 ) ) ( not ( = ?auto_74352 ?auto_74353 ) ) ( not ( = ?auto_74352 ?auto_74355 ) ) ( not ( = ?auto_74352 ?auto_74354 ) ) ( not ( = ?auto_74352 ?auto_74358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74353 ?auto_74355 ?auto_74354 )
      ( MAKE-4CRATE-VERIFY ?auto_74351 ?auto_74352 ?auto_74353 ?auto_74355 ?auto_74354 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74362 - SURFACE
      ?auto_74363 - SURFACE
      ?auto_74364 - SURFACE
      ?auto_74366 - SURFACE
      ?auto_74365 - SURFACE
      ?auto_74367 - SURFACE
    )
    :vars
    (
      ?auto_74369 - HOIST
      ?auto_74371 - PLACE
      ?auto_74368 - PLACE
      ?auto_74373 - HOIST
      ?auto_74370 - SURFACE
      ?auto_74372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74369 ?auto_74371 ) ( IS-CRATE ?auto_74367 ) ( not ( = ?auto_74365 ?auto_74367 ) ) ( not ( = ?auto_74366 ?auto_74365 ) ) ( not ( = ?auto_74366 ?auto_74367 ) ) ( not ( = ?auto_74368 ?auto_74371 ) ) ( HOIST-AT ?auto_74373 ?auto_74368 ) ( not ( = ?auto_74369 ?auto_74373 ) ) ( AVAILABLE ?auto_74373 ) ( SURFACE-AT ?auto_74367 ?auto_74368 ) ( ON ?auto_74367 ?auto_74370 ) ( CLEAR ?auto_74367 ) ( not ( = ?auto_74365 ?auto_74370 ) ) ( not ( = ?auto_74367 ?auto_74370 ) ) ( not ( = ?auto_74366 ?auto_74370 ) ) ( SURFACE-AT ?auto_74366 ?auto_74371 ) ( CLEAR ?auto_74366 ) ( IS-CRATE ?auto_74365 ) ( AVAILABLE ?auto_74369 ) ( IN ?auto_74365 ?auto_74372 ) ( TRUCK-AT ?auto_74372 ?auto_74368 ) ( ON ?auto_74363 ?auto_74362 ) ( ON ?auto_74364 ?auto_74363 ) ( ON ?auto_74366 ?auto_74364 ) ( not ( = ?auto_74362 ?auto_74363 ) ) ( not ( = ?auto_74362 ?auto_74364 ) ) ( not ( = ?auto_74362 ?auto_74366 ) ) ( not ( = ?auto_74362 ?auto_74365 ) ) ( not ( = ?auto_74362 ?auto_74367 ) ) ( not ( = ?auto_74362 ?auto_74370 ) ) ( not ( = ?auto_74363 ?auto_74364 ) ) ( not ( = ?auto_74363 ?auto_74366 ) ) ( not ( = ?auto_74363 ?auto_74365 ) ) ( not ( = ?auto_74363 ?auto_74367 ) ) ( not ( = ?auto_74363 ?auto_74370 ) ) ( not ( = ?auto_74364 ?auto_74366 ) ) ( not ( = ?auto_74364 ?auto_74365 ) ) ( not ( = ?auto_74364 ?auto_74367 ) ) ( not ( = ?auto_74364 ?auto_74370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74366 ?auto_74365 ?auto_74367 )
      ( MAKE-5CRATE-VERIFY ?auto_74362 ?auto_74363 ?auto_74364 ?auto_74366 ?auto_74365 ?auto_74367 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_74402 - SURFACE
      ?auto_74403 - SURFACE
      ?auto_74404 - SURFACE
      ?auto_74406 - SURFACE
      ?auto_74405 - SURFACE
    )
    :vars
    (
      ?auto_74408 - HOIST
      ?auto_74409 - PLACE
      ?auto_74407 - PLACE
      ?auto_74412 - HOIST
      ?auto_74410 - SURFACE
      ?auto_74411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74408 ?auto_74409 ) ( IS-CRATE ?auto_74405 ) ( not ( = ?auto_74406 ?auto_74405 ) ) ( not ( = ?auto_74404 ?auto_74406 ) ) ( not ( = ?auto_74404 ?auto_74405 ) ) ( not ( = ?auto_74407 ?auto_74409 ) ) ( HOIST-AT ?auto_74412 ?auto_74407 ) ( not ( = ?auto_74408 ?auto_74412 ) ) ( SURFACE-AT ?auto_74405 ?auto_74407 ) ( ON ?auto_74405 ?auto_74410 ) ( CLEAR ?auto_74405 ) ( not ( = ?auto_74406 ?auto_74410 ) ) ( not ( = ?auto_74405 ?auto_74410 ) ) ( not ( = ?auto_74404 ?auto_74410 ) ) ( SURFACE-AT ?auto_74404 ?auto_74409 ) ( CLEAR ?auto_74404 ) ( IS-CRATE ?auto_74406 ) ( AVAILABLE ?auto_74408 ) ( TRUCK-AT ?auto_74411 ?auto_74407 ) ( LIFTING ?auto_74412 ?auto_74406 ) ( ON ?auto_74403 ?auto_74402 ) ( ON ?auto_74404 ?auto_74403 ) ( not ( = ?auto_74402 ?auto_74403 ) ) ( not ( = ?auto_74402 ?auto_74404 ) ) ( not ( = ?auto_74402 ?auto_74406 ) ) ( not ( = ?auto_74402 ?auto_74405 ) ) ( not ( = ?auto_74402 ?auto_74410 ) ) ( not ( = ?auto_74403 ?auto_74404 ) ) ( not ( = ?auto_74403 ?auto_74406 ) ) ( not ( = ?auto_74403 ?auto_74405 ) ) ( not ( = ?auto_74403 ?auto_74410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74404 ?auto_74406 ?auto_74405 )
      ( MAKE-4CRATE-VERIFY ?auto_74402 ?auto_74403 ?auto_74404 ?auto_74406 ?auto_74405 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74413 - SURFACE
      ?auto_74414 - SURFACE
      ?auto_74415 - SURFACE
      ?auto_74417 - SURFACE
      ?auto_74416 - SURFACE
      ?auto_74418 - SURFACE
    )
    :vars
    (
      ?auto_74420 - HOIST
      ?auto_74421 - PLACE
      ?auto_74419 - PLACE
      ?auto_74424 - HOIST
      ?auto_74422 - SURFACE
      ?auto_74423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74420 ?auto_74421 ) ( IS-CRATE ?auto_74418 ) ( not ( = ?auto_74416 ?auto_74418 ) ) ( not ( = ?auto_74417 ?auto_74416 ) ) ( not ( = ?auto_74417 ?auto_74418 ) ) ( not ( = ?auto_74419 ?auto_74421 ) ) ( HOIST-AT ?auto_74424 ?auto_74419 ) ( not ( = ?auto_74420 ?auto_74424 ) ) ( SURFACE-AT ?auto_74418 ?auto_74419 ) ( ON ?auto_74418 ?auto_74422 ) ( CLEAR ?auto_74418 ) ( not ( = ?auto_74416 ?auto_74422 ) ) ( not ( = ?auto_74418 ?auto_74422 ) ) ( not ( = ?auto_74417 ?auto_74422 ) ) ( SURFACE-AT ?auto_74417 ?auto_74421 ) ( CLEAR ?auto_74417 ) ( IS-CRATE ?auto_74416 ) ( AVAILABLE ?auto_74420 ) ( TRUCK-AT ?auto_74423 ?auto_74419 ) ( LIFTING ?auto_74424 ?auto_74416 ) ( ON ?auto_74414 ?auto_74413 ) ( ON ?auto_74415 ?auto_74414 ) ( ON ?auto_74417 ?auto_74415 ) ( not ( = ?auto_74413 ?auto_74414 ) ) ( not ( = ?auto_74413 ?auto_74415 ) ) ( not ( = ?auto_74413 ?auto_74417 ) ) ( not ( = ?auto_74413 ?auto_74416 ) ) ( not ( = ?auto_74413 ?auto_74418 ) ) ( not ( = ?auto_74413 ?auto_74422 ) ) ( not ( = ?auto_74414 ?auto_74415 ) ) ( not ( = ?auto_74414 ?auto_74417 ) ) ( not ( = ?auto_74414 ?auto_74416 ) ) ( not ( = ?auto_74414 ?auto_74418 ) ) ( not ( = ?auto_74414 ?auto_74422 ) ) ( not ( = ?auto_74415 ?auto_74417 ) ) ( not ( = ?auto_74415 ?auto_74416 ) ) ( not ( = ?auto_74415 ?auto_74418 ) ) ( not ( = ?auto_74415 ?auto_74422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74417 ?auto_74416 ?auto_74418 )
      ( MAKE-5CRATE-VERIFY ?auto_74413 ?auto_74414 ?auto_74415 ?auto_74417 ?auto_74416 ?auto_74418 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_74456 - SURFACE
      ?auto_74457 - SURFACE
      ?auto_74458 - SURFACE
      ?auto_74460 - SURFACE
      ?auto_74459 - SURFACE
    )
    :vars
    (
      ?auto_74463 - HOIST
      ?auto_74462 - PLACE
      ?auto_74465 - PLACE
      ?auto_74461 - HOIST
      ?auto_74464 - SURFACE
      ?auto_74466 - TRUCK
      ?auto_74467 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74463 ?auto_74462 ) ( IS-CRATE ?auto_74459 ) ( not ( = ?auto_74460 ?auto_74459 ) ) ( not ( = ?auto_74458 ?auto_74460 ) ) ( not ( = ?auto_74458 ?auto_74459 ) ) ( not ( = ?auto_74465 ?auto_74462 ) ) ( HOIST-AT ?auto_74461 ?auto_74465 ) ( not ( = ?auto_74463 ?auto_74461 ) ) ( SURFACE-AT ?auto_74459 ?auto_74465 ) ( ON ?auto_74459 ?auto_74464 ) ( CLEAR ?auto_74459 ) ( not ( = ?auto_74460 ?auto_74464 ) ) ( not ( = ?auto_74459 ?auto_74464 ) ) ( not ( = ?auto_74458 ?auto_74464 ) ) ( SURFACE-AT ?auto_74458 ?auto_74462 ) ( CLEAR ?auto_74458 ) ( IS-CRATE ?auto_74460 ) ( AVAILABLE ?auto_74463 ) ( TRUCK-AT ?auto_74466 ?auto_74465 ) ( AVAILABLE ?auto_74461 ) ( SURFACE-AT ?auto_74460 ?auto_74465 ) ( ON ?auto_74460 ?auto_74467 ) ( CLEAR ?auto_74460 ) ( not ( = ?auto_74460 ?auto_74467 ) ) ( not ( = ?auto_74459 ?auto_74467 ) ) ( not ( = ?auto_74458 ?auto_74467 ) ) ( not ( = ?auto_74464 ?auto_74467 ) ) ( ON ?auto_74457 ?auto_74456 ) ( ON ?auto_74458 ?auto_74457 ) ( not ( = ?auto_74456 ?auto_74457 ) ) ( not ( = ?auto_74456 ?auto_74458 ) ) ( not ( = ?auto_74456 ?auto_74460 ) ) ( not ( = ?auto_74456 ?auto_74459 ) ) ( not ( = ?auto_74456 ?auto_74464 ) ) ( not ( = ?auto_74456 ?auto_74467 ) ) ( not ( = ?auto_74457 ?auto_74458 ) ) ( not ( = ?auto_74457 ?auto_74460 ) ) ( not ( = ?auto_74457 ?auto_74459 ) ) ( not ( = ?auto_74457 ?auto_74464 ) ) ( not ( = ?auto_74457 ?auto_74467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74458 ?auto_74460 ?auto_74459 )
      ( MAKE-4CRATE-VERIFY ?auto_74456 ?auto_74457 ?auto_74458 ?auto_74460 ?auto_74459 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74468 - SURFACE
      ?auto_74469 - SURFACE
      ?auto_74470 - SURFACE
      ?auto_74472 - SURFACE
      ?auto_74471 - SURFACE
      ?auto_74473 - SURFACE
    )
    :vars
    (
      ?auto_74476 - HOIST
      ?auto_74475 - PLACE
      ?auto_74478 - PLACE
      ?auto_74474 - HOIST
      ?auto_74477 - SURFACE
      ?auto_74479 - TRUCK
      ?auto_74480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_74476 ?auto_74475 ) ( IS-CRATE ?auto_74473 ) ( not ( = ?auto_74471 ?auto_74473 ) ) ( not ( = ?auto_74472 ?auto_74471 ) ) ( not ( = ?auto_74472 ?auto_74473 ) ) ( not ( = ?auto_74478 ?auto_74475 ) ) ( HOIST-AT ?auto_74474 ?auto_74478 ) ( not ( = ?auto_74476 ?auto_74474 ) ) ( SURFACE-AT ?auto_74473 ?auto_74478 ) ( ON ?auto_74473 ?auto_74477 ) ( CLEAR ?auto_74473 ) ( not ( = ?auto_74471 ?auto_74477 ) ) ( not ( = ?auto_74473 ?auto_74477 ) ) ( not ( = ?auto_74472 ?auto_74477 ) ) ( SURFACE-AT ?auto_74472 ?auto_74475 ) ( CLEAR ?auto_74472 ) ( IS-CRATE ?auto_74471 ) ( AVAILABLE ?auto_74476 ) ( TRUCK-AT ?auto_74479 ?auto_74478 ) ( AVAILABLE ?auto_74474 ) ( SURFACE-AT ?auto_74471 ?auto_74478 ) ( ON ?auto_74471 ?auto_74480 ) ( CLEAR ?auto_74471 ) ( not ( = ?auto_74471 ?auto_74480 ) ) ( not ( = ?auto_74473 ?auto_74480 ) ) ( not ( = ?auto_74472 ?auto_74480 ) ) ( not ( = ?auto_74477 ?auto_74480 ) ) ( ON ?auto_74469 ?auto_74468 ) ( ON ?auto_74470 ?auto_74469 ) ( ON ?auto_74472 ?auto_74470 ) ( not ( = ?auto_74468 ?auto_74469 ) ) ( not ( = ?auto_74468 ?auto_74470 ) ) ( not ( = ?auto_74468 ?auto_74472 ) ) ( not ( = ?auto_74468 ?auto_74471 ) ) ( not ( = ?auto_74468 ?auto_74473 ) ) ( not ( = ?auto_74468 ?auto_74477 ) ) ( not ( = ?auto_74468 ?auto_74480 ) ) ( not ( = ?auto_74469 ?auto_74470 ) ) ( not ( = ?auto_74469 ?auto_74472 ) ) ( not ( = ?auto_74469 ?auto_74471 ) ) ( not ( = ?auto_74469 ?auto_74473 ) ) ( not ( = ?auto_74469 ?auto_74477 ) ) ( not ( = ?auto_74469 ?auto_74480 ) ) ( not ( = ?auto_74470 ?auto_74472 ) ) ( not ( = ?auto_74470 ?auto_74471 ) ) ( not ( = ?auto_74470 ?auto_74473 ) ) ( not ( = ?auto_74470 ?auto_74477 ) ) ( not ( = ?auto_74470 ?auto_74480 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74472 ?auto_74471 ?auto_74473 )
      ( MAKE-5CRATE-VERIFY ?auto_74468 ?auto_74469 ?auto_74470 ?auto_74472 ?auto_74471 ?auto_74473 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_74512 - SURFACE
      ?auto_74513 - SURFACE
      ?auto_74514 - SURFACE
      ?auto_74516 - SURFACE
      ?auto_74515 - SURFACE
    )
    :vars
    (
      ?auto_74519 - HOIST
      ?auto_74521 - PLACE
      ?auto_74518 - PLACE
      ?auto_74522 - HOIST
      ?auto_74523 - SURFACE
      ?auto_74520 - SURFACE
      ?auto_74517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74519 ?auto_74521 ) ( IS-CRATE ?auto_74515 ) ( not ( = ?auto_74516 ?auto_74515 ) ) ( not ( = ?auto_74514 ?auto_74516 ) ) ( not ( = ?auto_74514 ?auto_74515 ) ) ( not ( = ?auto_74518 ?auto_74521 ) ) ( HOIST-AT ?auto_74522 ?auto_74518 ) ( not ( = ?auto_74519 ?auto_74522 ) ) ( SURFACE-AT ?auto_74515 ?auto_74518 ) ( ON ?auto_74515 ?auto_74523 ) ( CLEAR ?auto_74515 ) ( not ( = ?auto_74516 ?auto_74523 ) ) ( not ( = ?auto_74515 ?auto_74523 ) ) ( not ( = ?auto_74514 ?auto_74523 ) ) ( SURFACE-AT ?auto_74514 ?auto_74521 ) ( CLEAR ?auto_74514 ) ( IS-CRATE ?auto_74516 ) ( AVAILABLE ?auto_74519 ) ( AVAILABLE ?auto_74522 ) ( SURFACE-AT ?auto_74516 ?auto_74518 ) ( ON ?auto_74516 ?auto_74520 ) ( CLEAR ?auto_74516 ) ( not ( = ?auto_74516 ?auto_74520 ) ) ( not ( = ?auto_74515 ?auto_74520 ) ) ( not ( = ?auto_74514 ?auto_74520 ) ) ( not ( = ?auto_74523 ?auto_74520 ) ) ( TRUCK-AT ?auto_74517 ?auto_74521 ) ( ON ?auto_74513 ?auto_74512 ) ( ON ?auto_74514 ?auto_74513 ) ( not ( = ?auto_74512 ?auto_74513 ) ) ( not ( = ?auto_74512 ?auto_74514 ) ) ( not ( = ?auto_74512 ?auto_74516 ) ) ( not ( = ?auto_74512 ?auto_74515 ) ) ( not ( = ?auto_74512 ?auto_74523 ) ) ( not ( = ?auto_74512 ?auto_74520 ) ) ( not ( = ?auto_74513 ?auto_74514 ) ) ( not ( = ?auto_74513 ?auto_74516 ) ) ( not ( = ?auto_74513 ?auto_74515 ) ) ( not ( = ?auto_74513 ?auto_74523 ) ) ( not ( = ?auto_74513 ?auto_74520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74514 ?auto_74516 ?auto_74515 )
      ( MAKE-4CRATE-VERIFY ?auto_74512 ?auto_74513 ?auto_74514 ?auto_74516 ?auto_74515 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74524 - SURFACE
      ?auto_74525 - SURFACE
      ?auto_74526 - SURFACE
      ?auto_74528 - SURFACE
      ?auto_74527 - SURFACE
      ?auto_74529 - SURFACE
    )
    :vars
    (
      ?auto_74532 - HOIST
      ?auto_74534 - PLACE
      ?auto_74531 - PLACE
      ?auto_74535 - HOIST
      ?auto_74536 - SURFACE
      ?auto_74533 - SURFACE
      ?auto_74530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74532 ?auto_74534 ) ( IS-CRATE ?auto_74529 ) ( not ( = ?auto_74527 ?auto_74529 ) ) ( not ( = ?auto_74528 ?auto_74527 ) ) ( not ( = ?auto_74528 ?auto_74529 ) ) ( not ( = ?auto_74531 ?auto_74534 ) ) ( HOIST-AT ?auto_74535 ?auto_74531 ) ( not ( = ?auto_74532 ?auto_74535 ) ) ( SURFACE-AT ?auto_74529 ?auto_74531 ) ( ON ?auto_74529 ?auto_74536 ) ( CLEAR ?auto_74529 ) ( not ( = ?auto_74527 ?auto_74536 ) ) ( not ( = ?auto_74529 ?auto_74536 ) ) ( not ( = ?auto_74528 ?auto_74536 ) ) ( SURFACE-AT ?auto_74528 ?auto_74534 ) ( CLEAR ?auto_74528 ) ( IS-CRATE ?auto_74527 ) ( AVAILABLE ?auto_74532 ) ( AVAILABLE ?auto_74535 ) ( SURFACE-AT ?auto_74527 ?auto_74531 ) ( ON ?auto_74527 ?auto_74533 ) ( CLEAR ?auto_74527 ) ( not ( = ?auto_74527 ?auto_74533 ) ) ( not ( = ?auto_74529 ?auto_74533 ) ) ( not ( = ?auto_74528 ?auto_74533 ) ) ( not ( = ?auto_74536 ?auto_74533 ) ) ( TRUCK-AT ?auto_74530 ?auto_74534 ) ( ON ?auto_74525 ?auto_74524 ) ( ON ?auto_74526 ?auto_74525 ) ( ON ?auto_74528 ?auto_74526 ) ( not ( = ?auto_74524 ?auto_74525 ) ) ( not ( = ?auto_74524 ?auto_74526 ) ) ( not ( = ?auto_74524 ?auto_74528 ) ) ( not ( = ?auto_74524 ?auto_74527 ) ) ( not ( = ?auto_74524 ?auto_74529 ) ) ( not ( = ?auto_74524 ?auto_74536 ) ) ( not ( = ?auto_74524 ?auto_74533 ) ) ( not ( = ?auto_74525 ?auto_74526 ) ) ( not ( = ?auto_74525 ?auto_74528 ) ) ( not ( = ?auto_74525 ?auto_74527 ) ) ( not ( = ?auto_74525 ?auto_74529 ) ) ( not ( = ?auto_74525 ?auto_74536 ) ) ( not ( = ?auto_74525 ?auto_74533 ) ) ( not ( = ?auto_74526 ?auto_74528 ) ) ( not ( = ?auto_74526 ?auto_74527 ) ) ( not ( = ?auto_74526 ?auto_74529 ) ) ( not ( = ?auto_74526 ?auto_74536 ) ) ( not ( = ?auto_74526 ?auto_74533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74528 ?auto_74527 ?auto_74529 )
      ( MAKE-5CRATE-VERIFY ?auto_74524 ?auto_74525 ?auto_74526 ?auto_74528 ?auto_74527 ?auto_74529 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_74570 - SURFACE
      ?auto_74571 - SURFACE
      ?auto_74572 - SURFACE
      ?auto_74574 - SURFACE
      ?auto_74573 - SURFACE
    )
    :vars
    (
      ?auto_74576 - HOIST
      ?auto_74579 - PLACE
      ?auto_74581 - PLACE
      ?auto_74577 - HOIST
      ?auto_74580 - SURFACE
      ?auto_74575 - SURFACE
      ?auto_74578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74576 ?auto_74579 ) ( IS-CRATE ?auto_74573 ) ( not ( = ?auto_74574 ?auto_74573 ) ) ( not ( = ?auto_74572 ?auto_74574 ) ) ( not ( = ?auto_74572 ?auto_74573 ) ) ( not ( = ?auto_74581 ?auto_74579 ) ) ( HOIST-AT ?auto_74577 ?auto_74581 ) ( not ( = ?auto_74576 ?auto_74577 ) ) ( SURFACE-AT ?auto_74573 ?auto_74581 ) ( ON ?auto_74573 ?auto_74580 ) ( CLEAR ?auto_74573 ) ( not ( = ?auto_74574 ?auto_74580 ) ) ( not ( = ?auto_74573 ?auto_74580 ) ) ( not ( = ?auto_74572 ?auto_74580 ) ) ( IS-CRATE ?auto_74574 ) ( AVAILABLE ?auto_74577 ) ( SURFACE-AT ?auto_74574 ?auto_74581 ) ( ON ?auto_74574 ?auto_74575 ) ( CLEAR ?auto_74574 ) ( not ( = ?auto_74574 ?auto_74575 ) ) ( not ( = ?auto_74573 ?auto_74575 ) ) ( not ( = ?auto_74572 ?auto_74575 ) ) ( not ( = ?auto_74580 ?auto_74575 ) ) ( TRUCK-AT ?auto_74578 ?auto_74579 ) ( SURFACE-AT ?auto_74571 ?auto_74579 ) ( CLEAR ?auto_74571 ) ( LIFTING ?auto_74576 ?auto_74572 ) ( IS-CRATE ?auto_74572 ) ( not ( = ?auto_74571 ?auto_74572 ) ) ( not ( = ?auto_74574 ?auto_74571 ) ) ( not ( = ?auto_74573 ?auto_74571 ) ) ( not ( = ?auto_74580 ?auto_74571 ) ) ( not ( = ?auto_74575 ?auto_74571 ) ) ( ON ?auto_74571 ?auto_74570 ) ( not ( = ?auto_74570 ?auto_74571 ) ) ( not ( = ?auto_74570 ?auto_74572 ) ) ( not ( = ?auto_74570 ?auto_74574 ) ) ( not ( = ?auto_74570 ?auto_74573 ) ) ( not ( = ?auto_74570 ?auto_74580 ) ) ( not ( = ?auto_74570 ?auto_74575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74572 ?auto_74574 ?auto_74573 )
      ( MAKE-4CRATE-VERIFY ?auto_74570 ?auto_74571 ?auto_74572 ?auto_74574 ?auto_74573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_74582 - SURFACE
      ?auto_74583 - SURFACE
      ?auto_74584 - SURFACE
      ?auto_74586 - SURFACE
      ?auto_74585 - SURFACE
      ?auto_74587 - SURFACE
    )
    :vars
    (
      ?auto_74589 - HOIST
      ?auto_74592 - PLACE
      ?auto_74594 - PLACE
      ?auto_74590 - HOIST
      ?auto_74593 - SURFACE
      ?auto_74588 - SURFACE
      ?auto_74591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_74589 ?auto_74592 ) ( IS-CRATE ?auto_74587 ) ( not ( = ?auto_74585 ?auto_74587 ) ) ( not ( = ?auto_74586 ?auto_74585 ) ) ( not ( = ?auto_74586 ?auto_74587 ) ) ( not ( = ?auto_74594 ?auto_74592 ) ) ( HOIST-AT ?auto_74590 ?auto_74594 ) ( not ( = ?auto_74589 ?auto_74590 ) ) ( SURFACE-AT ?auto_74587 ?auto_74594 ) ( ON ?auto_74587 ?auto_74593 ) ( CLEAR ?auto_74587 ) ( not ( = ?auto_74585 ?auto_74593 ) ) ( not ( = ?auto_74587 ?auto_74593 ) ) ( not ( = ?auto_74586 ?auto_74593 ) ) ( IS-CRATE ?auto_74585 ) ( AVAILABLE ?auto_74590 ) ( SURFACE-AT ?auto_74585 ?auto_74594 ) ( ON ?auto_74585 ?auto_74588 ) ( CLEAR ?auto_74585 ) ( not ( = ?auto_74585 ?auto_74588 ) ) ( not ( = ?auto_74587 ?auto_74588 ) ) ( not ( = ?auto_74586 ?auto_74588 ) ) ( not ( = ?auto_74593 ?auto_74588 ) ) ( TRUCK-AT ?auto_74591 ?auto_74592 ) ( SURFACE-AT ?auto_74584 ?auto_74592 ) ( CLEAR ?auto_74584 ) ( LIFTING ?auto_74589 ?auto_74586 ) ( IS-CRATE ?auto_74586 ) ( not ( = ?auto_74584 ?auto_74586 ) ) ( not ( = ?auto_74585 ?auto_74584 ) ) ( not ( = ?auto_74587 ?auto_74584 ) ) ( not ( = ?auto_74593 ?auto_74584 ) ) ( not ( = ?auto_74588 ?auto_74584 ) ) ( ON ?auto_74583 ?auto_74582 ) ( ON ?auto_74584 ?auto_74583 ) ( not ( = ?auto_74582 ?auto_74583 ) ) ( not ( = ?auto_74582 ?auto_74584 ) ) ( not ( = ?auto_74582 ?auto_74586 ) ) ( not ( = ?auto_74582 ?auto_74585 ) ) ( not ( = ?auto_74582 ?auto_74587 ) ) ( not ( = ?auto_74582 ?auto_74593 ) ) ( not ( = ?auto_74582 ?auto_74588 ) ) ( not ( = ?auto_74583 ?auto_74584 ) ) ( not ( = ?auto_74583 ?auto_74586 ) ) ( not ( = ?auto_74583 ?auto_74585 ) ) ( not ( = ?auto_74583 ?auto_74587 ) ) ( not ( = ?auto_74583 ?auto_74593 ) ) ( not ( = ?auto_74583 ?auto_74588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_74586 ?auto_74585 ?auto_74587 )
      ( MAKE-5CRATE-VERIFY ?auto_74582 ?auto_74583 ?auto_74584 ?auto_74586 ?auto_74585 ?auto_74587 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75484 - SURFACE
      ?auto_75485 - SURFACE
      ?auto_75486 - SURFACE
      ?auto_75488 - SURFACE
      ?auto_75487 - SURFACE
      ?auto_75489 - SURFACE
      ?auto_75490 - SURFACE
    )
    :vars
    (
      ?auto_75492 - HOIST
      ?auto_75491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75492 ?auto_75491 ) ( SURFACE-AT ?auto_75489 ?auto_75491 ) ( CLEAR ?auto_75489 ) ( LIFTING ?auto_75492 ?auto_75490 ) ( IS-CRATE ?auto_75490 ) ( not ( = ?auto_75489 ?auto_75490 ) ) ( ON ?auto_75485 ?auto_75484 ) ( ON ?auto_75486 ?auto_75485 ) ( ON ?auto_75488 ?auto_75486 ) ( ON ?auto_75487 ?auto_75488 ) ( ON ?auto_75489 ?auto_75487 ) ( not ( = ?auto_75484 ?auto_75485 ) ) ( not ( = ?auto_75484 ?auto_75486 ) ) ( not ( = ?auto_75484 ?auto_75488 ) ) ( not ( = ?auto_75484 ?auto_75487 ) ) ( not ( = ?auto_75484 ?auto_75489 ) ) ( not ( = ?auto_75484 ?auto_75490 ) ) ( not ( = ?auto_75485 ?auto_75486 ) ) ( not ( = ?auto_75485 ?auto_75488 ) ) ( not ( = ?auto_75485 ?auto_75487 ) ) ( not ( = ?auto_75485 ?auto_75489 ) ) ( not ( = ?auto_75485 ?auto_75490 ) ) ( not ( = ?auto_75486 ?auto_75488 ) ) ( not ( = ?auto_75486 ?auto_75487 ) ) ( not ( = ?auto_75486 ?auto_75489 ) ) ( not ( = ?auto_75486 ?auto_75490 ) ) ( not ( = ?auto_75488 ?auto_75487 ) ) ( not ( = ?auto_75488 ?auto_75489 ) ) ( not ( = ?auto_75488 ?auto_75490 ) ) ( not ( = ?auto_75487 ?auto_75489 ) ) ( not ( = ?auto_75487 ?auto_75490 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_75489 ?auto_75490 )
      ( MAKE-6CRATE-VERIFY ?auto_75484 ?auto_75485 ?auto_75486 ?auto_75488 ?auto_75487 ?auto_75489 ?auto_75490 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75528 - SURFACE
      ?auto_75529 - SURFACE
      ?auto_75530 - SURFACE
      ?auto_75532 - SURFACE
      ?auto_75531 - SURFACE
      ?auto_75533 - SURFACE
      ?auto_75534 - SURFACE
    )
    :vars
    (
      ?auto_75537 - HOIST
      ?auto_75536 - PLACE
      ?auto_75535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75537 ?auto_75536 ) ( SURFACE-AT ?auto_75533 ?auto_75536 ) ( CLEAR ?auto_75533 ) ( IS-CRATE ?auto_75534 ) ( not ( = ?auto_75533 ?auto_75534 ) ) ( TRUCK-AT ?auto_75535 ?auto_75536 ) ( AVAILABLE ?auto_75537 ) ( IN ?auto_75534 ?auto_75535 ) ( ON ?auto_75533 ?auto_75531 ) ( not ( = ?auto_75531 ?auto_75533 ) ) ( not ( = ?auto_75531 ?auto_75534 ) ) ( ON ?auto_75529 ?auto_75528 ) ( ON ?auto_75530 ?auto_75529 ) ( ON ?auto_75532 ?auto_75530 ) ( ON ?auto_75531 ?auto_75532 ) ( not ( = ?auto_75528 ?auto_75529 ) ) ( not ( = ?auto_75528 ?auto_75530 ) ) ( not ( = ?auto_75528 ?auto_75532 ) ) ( not ( = ?auto_75528 ?auto_75531 ) ) ( not ( = ?auto_75528 ?auto_75533 ) ) ( not ( = ?auto_75528 ?auto_75534 ) ) ( not ( = ?auto_75529 ?auto_75530 ) ) ( not ( = ?auto_75529 ?auto_75532 ) ) ( not ( = ?auto_75529 ?auto_75531 ) ) ( not ( = ?auto_75529 ?auto_75533 ) ) ( not ( = ?auto_75529 ?auto_75534 ) ) ( not ( = ?auto_75530 ?auto_75532 ) ) ( not ( = ?auto_75530 ?auto_75531 ) ) ( not ( = ?auto_75530 ?auto_75533 ) ) ( not ( = ?auto_75530 ?auto_75534 ) ) ( not ( = ?auto_75532 ?auto_75531 ) ) ( not ( = ?auto_75532 ?auto_75533 ) ) ( not ( = ?auto_75532 ?auto_75534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75531 ?auto_75533 ?auto_75534 )
      ( MAKE-6CRATE-VERIFY ?auto_75528 ?auto_75529 ?auto_75530 ?auto_75532 ?auto_75531 ?auto_75533 ?auto_75534 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75579 - SURFACE
      ?auto_75580 - SURFACE
      ?auto_75581 - SURFACE
      ?auto_75583 - SURFACE
      ?auto_75582 - SURFACE
      ?auto_75584 - SURFACE
      ?auto_75585 - SURFACE
    )
    :vars
    (
      ?auto_75587 - HOIST
      ?auto_75586 - PLACE
      ?auto_75588 - TRUCK
      ?auto_75589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75587 ?auto_75586 ) ( SURFACE-AT ?auto_75584 ?auto_75586 ) ( CLEAR ?auto_75584 ) ( IS-CRATE ?auto_75585 ) ( not ( = ?auto_75584 ?auto_75585 ) ) ( AVAILABLE ?auto_75587 ) ( IN ?auto_75585 ?auto_75588 ) ( ON ?auto_75584 ?auto_75582 ) ( not ( = ?auto_75582 ?auto_75584 ) ) ( not ( = ?auto_75582 ?auto_75585 ) ) ( TRUCK-AT ?auto_75588 ?auto_75589 ) ( not ( = ?auto_75589 ?auto_75586 ) ) ( ON ?auto_75580 ?auto_75579 ) ( ON ?auto_75581 ?auto_75580 ) ( ON ?auto_75583 ?auto_75581 ) ( ON ?auto_75582 ?auto_75583 ) ( not ( = ?auto_75579 ?auto_75580 ) ) ( not ( = ?auto_75579 ?auto_75581 ) ) ( not ( = ?auto_75579 ?auto_75583 ) ) ( not ( = ?auto_75579 ?auto_75582 ) ) ( not ( = ?auto_75579 ?auto_75584 ) ) ( not ( = ?auto_75579 ?auto_75585 ) ) ( not ( = ?auto_75580 ?auto_75581 ) ) ( not ( = ?auto_75580 ?auto_75583 ) ) ( not ( = ?auto_75580 ?auto_75582 ) ) ( not ( = ?auto_75580 ?auto_75584 ) ) ( not ( = ?auto_75580 ?auto_75585 ) ) ( not ( = ?auto_75581 ?auto_75583 ) ) ( not ( = ?auto_75581 ?auto_75582 ) ) ( not ( = ?auto_75581 ?auto_75584 ) ) ( not ( = ?auto_75581 ?auto_75585 ) ) ( not ( = ?auto_75583 ?auto_75582 ) ) ( not ( = ?auto_75583 ?auto_75584 ) ) ( not ( = ?auto_75583 ?auto_75585 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75582 ?auto_75584 ?auto_75585 )
      ( MAKE-6CRATE-VERIFY ?auto_75579 ?auto_75580 ?auto_75581 ?auto_75583 ?auto_75582 ?auto_75584 ?auto_75585 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75636 - SURFACE
      ?auto_75637 - SURFACE
      ?auto_75638 - SURFACE
      ?auto_75640 - SURFACE
      ?auto_75639 - SURFACE
      ?auto_75641 - SURFACE
      ?auto_75642 - SURFACE
    )
    :vars
    (
      ?auto_75647 - HOIST
      ?auto_75644 - PLACE
      ?auto_75643 - TRUCK
      ?auto_75646 - PLACE
      ?auto_75645 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_75647 ?auto_75644 ) ( SURFACE-AT ?auto_75641 ?auto_75644 ) ( CLEAR ?auto_75641 ) ( IS-CRATE ?auto_75642 ) ( not ( = ?auto_75641 ?auto_75642 ) ) ( AVAILABLE ?auto_75647 ) ( ON ?auto_75641 ?auto_75639 ) ( not ( = ?auto_75639 ?auto_75641 ) ) ( not ( = ?auto_75639 ?auto_75642 ) ) ( TRUCK-AT ?auto_75643 ?auto_75646 ) ( not ( = ?auto_75646 ?auto_75644 ) ) ( HOIST-AT ?auto_75645 ?auto_75646 ) ( LIFTING ?auto_75645 ?auto_75642 ) ( not ( = ?auto_75647 ?auto_75645 ) ) ( ON ?auto_75637 ?auto_75636 ) ( ON ?auto_75638 ?auto_75637 ) ( ON ?auto_75640 ?auto_75638 ) ( ON ?auto_75639 ?auto_75640 ) ( not ( = ?auto_75636 ?auto_75637 ) ) ( not ( = ?auto_75636 ?auto_75638 ) ) ( not ( = ?auto_75636 ?auto_75640 ) ) ( not ( = ?auto_75636 ?auto_75639 ) ) ( not ( = ?auto_75636 ?auto_75641 ) ) ( not ( = ?auto_75636 ?auto_75642 ) ) ( not ( = ?auto_75637 ?auto_75638 ) ) ( not ( = ?auto_75637 ?auto_75640 ) ) ( not ( = ?auto_75637 ?auto_75639 ) ) ( not ( = ?auto_75637 ?auto_75641 ) ) ( not ( = ?auto_75637 ?auto_75642 ) ) ( not ( = ?auto_75638 ?auto_75640 ) ) ( not ( = ?auto_75638 ?auto_75639 ) ) ( not ( = ?auto_75638 ?auto_75641 ) ) ( not ( = ?auto_75638 ?auto_75642 ) ) ( not ( = ?auto_75640 ?auto_75639 ) ) ( not ( = ?auto_75640 ?auto_75641 ) ) ( not ( = ?auto_75640 ?auto_75642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75639 ?auto_75641 ?auto_75642 )
      ( MAKE-6CRATE-VERIFY ?auto_75636 ?auto_75637 ?auto_75638 ?auto_75640 ?auto_75639 ?auto_75641 ?auto_75642 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75699 - SURFACE
      ?auto_75700 - SURFACE
      ?auto_75701 - SURFACE
      ?auto_75703 - SURFACE
      ?auto_75702 - SURFACE
      ?auto_75704 - SURFACE
      ?auto_75705 - SURFACE
    )
    :vars
    (
      ?auto_75709 - HOIST
      ?auto_75708 - PLACE
      ?auto_75707 - TRUCK
      ?auto_75706 - PLACE
      ?auto_75711 - HOIST
      ?auto_75710 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_75709 ?auto_75708 ) ( SURFACE-AT ?auto_75704 ?auto_75708 ) ( CLEAR ?auto_75704 ) ( IS-CRATE ?auto_75705 ) ( not ( = ?auto_75704 ?auto_75705 ) ) ( AVAILABLE ?auto_75709 ) ( ON ?auto_75704 ?auto_75702 ) ( not ( = ?auto_75702 ?auto_75704 ) ) ( not ( = ?auto_75702 ?auto_75705 ) ) ( TRUCK-AT ?auto_75707 ?auto_75706 ) ( not ( = ?auto_75706 ?auto_75708 ) ) ( HOIST-AT ?auto_75711 ?auto_75706 ) ( not ( = ?auto_75709 ?auto_75711 ) ) ( AVAILABLE ?auto_75711 ) ( SURFACE-AT ?auto_75705 ?auto_75706 ) ( ON ?auto_75705 ?auto_75710 ) ( CLEAR ?auto_75705 ) ( not ( = ?auto_75704 ?auto_75710 ) ) ( not ( = ?auto_75705 ?auto_75710 ) ) ( not ( = ?auto_75702 ?auto_75710 ) ) ( ON ?auto_75700 ?auto_75699 ) ( ON ?auto_75701 ?auto_75700 ) ( ON ?auto_75703 ?auto_75701 ) ( ON ?auto_75702 ?auto_75703 ) ( not ( = ?auto_75699 ?auto_75700 ) ) ( not ( = ?auto_75699 ?auto_75701 ) ) ( not ( = ?auto_75699 ?auto_75703 ) ) ( not ( = ?auto_75699 ?auto_75702 ) ) ( not ( = ?auto_75699 ?auto_75704 ) ) ( not ( = ?auto_75699 ?auto_75705 ) ) ( not ( = ?auto_75699 ?auto_75710 ) ) ( not ( = ?auto_75700 ?auto_75701 ) ) ( not ( = ?auto_75700 ?auto_75703 ) ) ( not ( = ?auto_75700 ?auto_75702 ) ) ( not ( = ?auto_75700 ?auto_75704 ) ) ( not ( = ?auto_75700 ?auto_75705 ) ) ( not ( = ?auto_75700 ?auto_75710 ) ) ( not ( = ?auto_75701 ?auto_75703 ) ) ( not ( = ?auto_75701 ?auto_75702 ) ) ( not ( = ?auto_75701 ?auto_75704 ) ) ( not ( = ?auto_75701 ?auto_75705 ) ) ( not ( = ?auto_75701 ?auto_75710 ) ) ( not ( = ?auto_75703 ?auto_75702 ) ) ( not ( = ?auto_75703 ?auto_75704 ) ) ( not ( = ?auto_75703 ?auto_75705 ) ) ( not ( = ?auto_75703 ?auto_75710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75702 ?auto_75704 ?auto_75705 )
      ( MAKE-6CRATE-VERIFY ?auto_75699 ?auto_75700 ?auto_75701 ?auto_75703 ?auto_75702 ?auto_75704 ?auto_75705 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75763 - SURFACE
      ?auto_75764 - SURFACE
      ?auto_75765 - SURFACE
      ?auto_75767 - SURFACE
      ?auto_75766 - SURFACE
      ?auto_75768 - SURFACE
      ?auto_75769 - SURFACE
    )
    :vars
    (
      ?auto_75774 - HOIST
      ?auto_75772 - PLACE
      ?auto_75771 - PLACE
      ?auto_75773 - HOIST
      ?auto_75775 - SURFACE
      ?auto_75770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75774 ?auto_75772 ) ( SURFACE-AT ?auto_75768 ?auto_75772 ) ( CLEAR ?auto_75768 ) ( IS-CRATE ?auto_75769 ) ( not ( = ?auto_75768 ?auto_75769 ) ) ( AVAILABLE ?auto_75774 ) ( ON ?auto_75768 ?auto_75766 ) ( not ( = ?auto_75766 ?auto_75768 ) ) ( not ( = ?auto_75766 ?auto_75769 ) ) ( not ( = ?auto_75771 ?auto_75772 ) ) ( HOIST-AT ?auto_75773 ?auto_75771 ) ( not ( = ?auto_75774 ?auto_75773 ) ) ( AVAILABLE ?auto_75773 ) ( SURFACE-AT ?auto_75769 ?auto_75771 ) ( ON ?auto_75769 ?auto_75775 ) ( CLEAR ?auto_75769 ) ( not ( = ?auto_75768 ?auto_75775 ) ) ( not ( = ?auto_75769 ?auto_75775 ) ) ( not ( = ?auto_75766 ?auto_75775 ) ) ( TRUCK-AT ?auto_75770 ?auto_75772 ) ( ON ?auto_75764 ?auto_75763 ) ( ON ?auto_75765 ?auto_75764 ) ( ON ?auto_75767 ?auto_75765 ) ( ON ?auto_75766 ?auto_75767 ) ( not ( = ?auto_75763 ?auto_75764 ) ) ( not ( = ?auto_75763 ?auto_75765 ) ) ( not ( = ?auto_75763 ?auto_75767 ) ) ( not ( = ?auto_75763 ?auto_75766 ) ) ( not ( = ?auto_75763 ?auto_75768 ) ) ( not ( = ?auto_75763 ?auto_75769 ) ) ( not ( = ?auto_75763 ?auto_75775 ) ) ( not ( = ?auto_75764 ?auto_75765 ) ) ( not ( = ?auto_75764 ?auto_75767 ) ) ( not ( = ?auto_75764 ?auto_75766 ) ) ( not ( = ?auto_75764 ?auto_75768 ) ) ( not ( = ?auto_75764 ?auto_75769 ) ) ( not ( = ?auto_75764 ?auto_75775 ) ) ( not ( = ?auto_75765 ?auto_75767 ) ) ( not ( = ?auto_75765 ?auto_75766 ) ) ( not ( = ?auto_75765 ?auto_75768 ) ) ( not ( = ?auto_75765 ?auto_75769 ) ) ( not ( = ?auto_75765 ?auto_75775 ) ) ( not ( = ?auto_75767 ?auto_75766 ) ) ( not ( = ?auto_75767 ?auto_75768 ) ) ( not ( = ?auto_75767 ?auto_75769 ) ) ( not ( = ?auto_75767 ?auto_75775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75766 ?auto_75768 ?auto_75769 )
      ( MAKE-6CRATE-VERIFY ?auto_75763 ?auto_75764 ?auto_75765 ?auto_75767 ?auto_75766 ?auto_75768 ?auto_75769 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75827 - SURFACE
      ?auto_75828 - SURFACE
      ?auto_75829 - SURFACE
      ?auto_75831 - SURFACE
      ?auto_75830 - SURFACE
      ?auto_75832 - SURFACE
      ?auto_75833 - SURFACE
    )
    :vars
    (
      ?auto_75837 - HOIST
      ?auto_75836 - PLACE
      ?auto_75838 - PLACE
      ?auto_75839 - HOIST
      ?auto_75834 - SURFACE
      ?auto_75835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75837 ?auto_75836 ) ( IS-CRATE ?auto_75833 ) ( not ( = ?auto_75832 ?auto_75833 ) ) ( not ( = ?auto_75830 ?auto_75832 ) ) ( not ( = ?auto_75830 ?auto_75833 ) ) ( not ( = ?auto_75838 ?auto_75836 ) ) ( HOIST-AT ?auto_75839 ?auto_75838 ) ( not ( = ?auto_75837 ?auto_75839 ) ) ( AVAILABLE ?auto_75839 ) ( SURFACE-AT ?auto_75833 ?auto_75838 ) ( ON ?auto_75833 ?auto_75834 ) ( CLEAR ?auto_75833 ) ( not ( = ?auto_75832 ?auto_75834 ) ) ( not ( = ?auto_75833 ?auto_75834 ) ) ( not ( = ?auto_75830 ?auto_75834 ) ) ( TRUCK-AT ?auto_75835 ?auto_75836 ) ( SURFACE-AT ?auto_75830 ?auto_75836 ) ( CLEAR ?auto_75830 ) ( LIFTING ?auto_75837 ?auto_75832 ) ( IS-CRATE ?auto_75832 ) ( ON ?auto_75828 ?auto_75827 ) ( ON ?auto_75829 ?auto_75828 ) ( ON ?auto_75831 ?auto_75829 ) ( ON ?auto_75830 ?auto_75831 ) ( not ( = ?auto_75827 ?auto_75828 ) ) ( not ( = ?auto_75827 ?auto_75829 ) ) ( not ( = ?auto_75827 ?auto_75831 ) ) ( not ( = ?auto_75827 ?auto_75830 ) ) ( not ( = ?auto_75827 ?auto_75832 ) ) ( not ( = ?auto_75827 ?auto_75833 ) ) ( not ( = ?auto_75827 ?auto_75834 ) ) ( not ( = ?auto_75828 ?auto_75829 ) ) ( not ( = ?auto_75828 ?auto_75831 ) ) ( not ( = ?auto_75828 ?auto_75830 ) ) ( not ( = ?auto_75828 ?auto_75832 ) ) ( not ( = ?auto_75828 ?auto_75833 ) ) ( not ( = ?auto_75828 ?auto_75834 ) ) ( not ( = ?auto_75829 ?auto_75831 ) ) ( not ( = ?auto_75829 ?auto_75830 ) ) ( not ( = ?auto_75829 ?auto_75832 ) ) ( not ( = ?auto_75829 ?auto_75833 ) ) ( not ( = ?auto_75829 ?auto_75834 ) ) ( not ( = ?auto_75831 ?auto_75830 ) ) ( not ( = ?auto_75831 ?auto_75832 ) ) ( not ( = ?auto_75831 ?auto_75833 ) ) ( not ( = ?auto_75831 ?auto_75834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75830 ?auto_75832 ?auto_75833 )
      ( MAKE-6CRATE-VERIFY ?auto_75827 ?auto_75828 ?auto_75829 ?auto_75831 ?auto_75830 ?auto_75832 ?auto_75833 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_75891 - SURFACE
      ?auto_75892 - SURFACE
      ?auto_75893 - SURFACE
      ?auto_75895 - SURFACE
      ?auto_75894 - SURFACE
      ?auto_75896 - SURFACE
      ?auto_75897 - SURFACE
    )
    :vars
    (
      ?auto_75902 - HOIST
      ?auto_75900 - PLACE
      ?auto_75899 - PLACE
      ?auto_75901 - HOIST
      ?auto_75898 - SURFACE
      ?auto_75903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_75902 ?auto_75900 ) ( IS-CRATE ?auto_75897 ) ( not ( = ?auto_75896 ?auto_75897 ) ) ( not ( = ?auto_75894 ?auto_75896 ) ) ( not ( = ?auto_75894 ?auto_75897 ) ) ( not ( = ?auto_75899 ?auto_75900 ) ) ( HOIST-AT ?auto_75901 ?auto_75899 ) ( not ( = ?auto_75902 ?auto_75901 ) ) ( AVAILABLE ?auto_75901 ) ( SURFACE-AT ?auto_75897 ?auto_75899 ) ( ON ?auto_75897 ?auto_75898 ) ( CLEAR ?auto_75897 ) ( not ( = ?auto_75896 ?auto_75898 ) ) ( not ( = ?auto_75897 ?auto_75898 ) ) ( not ( = ?auto_75894 ?auto_75898 ) ) ( TRUCK-AT ?auto_75903 ?auto_75900 ) ( SURFACE-AT ?auto_75894 ?auto_75900 ) ( CLEAR ?auto_75894 ) ( IS-CRATE ?auto_75896 ) ( AVAILABLE ?auto_75902 ) ( IN ?auto_75896 ?auto_75903 ) ( ON ?auto_75892 ?auto_75891 ) ( ON ?auto_75893 ?auto_75892 ) ( ON ?auto_75895 ?auto_75893 ) ( ON ?auto_75894 ?auto_75895 ) ( not ( = ?auto_75891 ?auto_75892 ) ) ( not ( = ?auto_75891 ?auto_75893 ) ) ( not ( = ?auto_75891 ?auto_75895 ) ) ( not ( = ?auto_75891 ?auto_75894 ) ) ( not ( = ?auto_75891 ?auto_75896 ) ) ( not ( = ?auto_75891 ?auto_75897 ) ) ( not ( = ?auto_75891 ?auto_75898 ) ) ( not ( = ?auto_75892 ?auto_75893 ) ) ( not ( = ?auto_75892 ?auto_75895 ) ) ( not ( = ?auto_75892 ?auto_75894 ) ) ( not ( = ?auto_75892 ?auto_75896 ) ) ( not ( = ?auto_75892 ?auto_75897 ) ) ( not ( = ?auto_75892 ?auto_75898 ) ) ( not ( = ?auto_75893 ?auto_75895 ) ) ( not ( = ?auto_75893 ?auto_75894 ) ) ( not ( = ?auto_75893 ?auto_75896 ) ) ( not ( = ?auto_75893 ?auto_75897 ) ) ( not ( = ?auto_75893 ?auto_75898 ) ) ( not ( = ?auto_75895 ?auto_75894 ) ) ( not ( = ?auto_75895 ?auto_75896 ) ) ( not ( = ?auto_75895 ?auto_75897 ) ) ( not ( = ?auto_75895 ?auto_75898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_75894 ?auto_75896 ?auto_75897 )
      ( MAKE-6CRATE-VERIFY ?auto_75891 ?auto_75892 ?auto_75893 ?auto_75895 ?auto_75894 ?auto_75896 ?auto_75897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_77560 - SURFACE
      ?auto_77561 - SURFACE
    )
    :vars
    (
      ?auto_77567 - HOIST
      ?auto_77566 - PLACE
      ?auto_77564 - SURFACE
      ?auto_77562 - TRUCK
      ?auto_77565 - PLACE
      ?auto_77563 - HOIST
      ?auto_77568 - SURFACE
      ?auto_77569 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_77567 ?auto_77566 ) ( SURFACE-AT ?auto_77560 ?auto_77566 ) ( CLEAR ?auto_77560 ) ( IS-CRATE ?auto_77561 ) ( not ( = ?auto_77560 ?auto_77561 ) ) ( AVAILABLE ?auto_77567 ) ( ON ?auto_77560 ?auto_77564 ) ( not ( = ?auto_77564 ?auto_77560 ) ) ( not ( = ?auto_77564 ?auto_77561 ) ) ( TRUCK-AT ?auto_77562 ?auto_77565 ) ( not ( = ?auto_77565 ?auto_77566 ) ) ( HOIST-AT ?auto_77563 ?auto_77565 ) ( not ( = ?auto_77567 ?auto_77563 ) ) ( SURFACE-AT ?auto_77561 ?auto_77565 ) ( ON ?auto_77561 ?auto_77568 ) ( CLEAR ?auto_77561 ) ( not ( = ?auto_77560 ?auto_77568 ) ) ( not ( = ?auto_77561 ?auto_77568 ) ) ( not ( = ?auto_77564 ?auto_77568 ) ) ( LIFTING ?auto_77563 ?auto_77569 ) ( IS-CRATE ?auto_77569 ) ( not ( = ?auto_77560 ?auto_77569 ) ) ( not ( = ?auto_77561 ?auto_77569 ) ) ( not ( = ?auto_77564 ?auto_77569 ) ) ( not ( = ?auto_77568 ?auto_77569 ) ) )
    :subtasks
    ( ( !LOAD ?auto_77563 ?auto_77569 ?auto_77562 ?auto_77565 )
      ( MAKE-1CRATE ?auto_77560 ?auto_77561 )
      ( MAKE-1CRATE-VERIFY ?auto_77560 ?auto_77561 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_77836 - SURFACE
      ?auto_77837 - SURFACE
      ?auto_77838 - SURFACE
      ?auto_77840 - SURFACE
      ?auto_77839 - SURFACE
      ?auto_77841 - SURFACE
      ?auto_77842 - SURFACE
      ?auto_77843 - SURFACE
    )
    :vars
    (
      ?auto_77845 - HOIST
      ?auto_77844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_77845 ?auto_77844 ) ( SURFACE-AT ?auto_77842 ?auto_77844 ) ( CLEAR ?auto_77842 ) ( LIFTING ?auto_77845 ?auto_77843 ) ( IS-CRATE ?auto_77843 ) ( not ( = ?auto_77842 ?auto_77843 ) ) ( ON ?auto_77837 ?auto_77836 ) ( ON ?auto_77838 ?auto_77837 ) ( ON ?auto_77840 ?auto_77838 ) ( ON ?auto_77839 ?auto_77840 ) ( ON ?auto_77841 ?auto_77839 ) ( ON ?auto_77842 ?auto_77841 ) ( not ( = ?auto_77836 ?auto_77837 ) ) ( not ( = ?auto_77836 ?auto_77838 ) ) ( not ( = ?auto_77836 ?auto_77840 ) ) ( not ( = ?auto_77836 ?auto_77839 ) ) ( not ( = ?auto_77836 ?auto_77841 ) ) ( not ( = ?auto_77836 ?auto_77842 ) ) ( not ( = ?auto_77836 ?auto_77843 ) ) ( not ( = ?auto_77837 ?auto_77838 ) ) ( not ( = ?auto_77837 ?auto_77840 ) ) ( not ( = ?auto_77837 ?auto_77839 ) ) ( not ( = ?auto_77837 ?auto_77841 ) ) ( not ( = ?auto_77837 ?auto_77842 ) ) ( not ( = ?auto_77837 ?auto_77843 ) ) ( not ( = ?auto_77838 ?auto_77840 ) ) ( not ( = ?auto_77838 ?auto_77839 ) ) ( not ( = ?auto_77838 ?auto_77841 ) ) ( not ( = ?auto_77838 ?auto_77842 ) ) ( not ( = ?auto_77838 ?auto_77843 ) ) ( not ( = ?auto_77840 ?auto_77839 ) ) ( not ( = ?auto_77840 ?auto_77841 ) ) ( not ( = ?auto_77840 ?auto_77842 ) ) ( not ( = ?auto_77840 ?auto_77843 ) ) ( not ( = ?auto_77839 ?auto_77841 ) ) ( not ( = ?auto_77839 ?auto_77842 ) ) ( not ( = ?auto_77839 ?auto_77843 ) ) ( not ( = ?auto_77841 ?auto_77842 ) ) ( not ( = ?auto_77841 ?auto_77843 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_77842 ?auto_77843 )
      ( MAKE-7CRATE-VERIFY ?auto_77836 ?auto_77837 ?auto_77838 ?auto_77840 ?auto_77839 ?auto_77841 ?auto_77842 ?auto_77843 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_77891 - SURFACE
      ?auto_77892 - SURFACE
      ?auto_77893 - SURFACE
      ?auto_77895 - SURFACE
      ?auto_77894 - SURFACE
      ?auto_77896 - SURFACE
      ?auto_77897 - SURFACE
      ?auto_77898 - SURFACE
    )
    :vars
    (
      ?auto_77901 - HOIST
      ?auto_77899 - PLACE
      ?auto_77900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_77901 ?auto_77899 ) ( SURFACE-AT ?auto_77897 ?auto_77899 ) ( CLEAR ?auto_77897 ) ( IS-CRATE ?auto_77898 ) ( not ( = ?auto_77897 ?auto_77898 ) ) ( TRUCK-AT ?auto_77900 ?auto_77899 ) ( AVAILABLE ?auto_77901 ) ( IN ?auto_77898 ?auto_77900 ) ( ON ?auto_77897 ?auto_77896 ) ( not ( = ?auto_77896 ?auto_77897 ) ) ( not ( = ?auto_77896 ?auto_77898 ) ) ( ON ?auto_77892 ?auto_77891 ) ( ON ?auto_77893 ?auto_77892 ) ( ON ?auto_77895 ?auto_77893 ) ( ON ?auto_77894 ?auto_77895 ) ( ON ?auto_77896 ?auto_77894 ) ( not ( = ?auto_77891 ?auto_77892 ) ) ( not ( = ?auto_77891 ?auto_77893 ) ) ( not ( = ?auto_77891 ?auto_77895 ) ) ( not ( = ?auto_77891 ?auto_77894 ) ) ( not ( = ?auto_77891 ?auto_77896 ) ) ( not ( = ?auto_77891 ?auto_77897 ) ) ( not ( = ?auto_77891 ?auto_77898 ) ) ( not ( = ?auto_77892 ?auto_77893 ) ) ( not ( = ?auto_77892 ?auto_77895 ) ) ( not ( = ?auto_77892 ?auto_77894 ) ) ( not ( = ?auto_77892 ?auto_77896 ) ) ( not ( = ?auto_77892 ?auto_77897 ) ) ( not ( = ?auto_77892 ?auto_77898 ) ) ( not ( = ?auto_77893 ?auto_77895 ) ) ( not ( = ?auto_77893 ?auto_77894 ) ) ( not ( = ?auto_77893 ?auto_77896 ) ) ( not ( = ?auto_77893 ?auto_77897 ) ) ( not ( = ?auto_77893 ?auto_77898 ) ) ( not ( = ?auto_77895 ?auto_77894 ) ) ( not ( = ?auto_77895 ?auto_77896 ) ) ( not ( = ?auto_77895 ?auto_77897 ) ) ( not ( = ?auto_77895 ?auto_77898 ) ) ( not ( = ?auto_77894 ?auto_77896 ) ) ( not ( = ?auto_77894 ?auto_77897 ) ) ( not ( = ?auto_77894 ?auto_77898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_77896 ?auto_77897 ?auto_77898 )
      ( MAKE-7CRATE-VERIFY ?auto_77891 ?auto_77892 ?auto_77893 ?auto_77895 ?auto_77894 ?auto_77896 ?auto_77897 ?auto_77898 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_77954 - SURFACE
      ?auto_77955 - SURFACE
      ?auto_77956 - SURFACE
      ?auto_77958 - SURFACE
      ?auto_77957 - SURFACE
      ?auto_77959 - SURFACE
      ?auto_77960 - SURFACE
      ?auto_77961 - SURFACE
    )
    :vars
    (
      ?auto_77963 - HOIST
      ?auto_77965 - PLACE
      ?auto_77964 - TRUCK
      ?auto_77962 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_77963 ?auto_77965 ) ( SURFACE-AT ?auto_77960 ?auto_77965 ) ( CLEAR ?auto_77960 ) ( IS-CRATE ?auto_77961 ) ( not ( = ?auto_77960 ?auto_77961 ) ) ( AVAILABLE ?auto_77963 ) ( IN ?auto_77961 ?auto_77964 ) ( ON ?auto_77960 ?auto_77959 ) ( not ( = ?auto_77959 ?auto_77960 ) ) ( not ( = ?auto_77959 ?auto_77961 ) ) ( TRUCK-AT ?auto_77964 ?auto_77962 ) ( not ( = ?auto_77962 ?auto_77965 ) ) ( ON ?auto_77955 ?auto_77954 ) ( ON ?auto_77956 ?auto_77955 ) ( ON ?auto_77958 ?auto_77956 ) ( ON ?auto_77957 ?auto_77958 ) ( ON ?auto_77959 ?auto_77957 ) ( not ( = ?auto_77954 ?auto_77955 ) ) ( not ( = ?auto_77954 ?auto_77956 ) ) ( not ( = ?auto_77954 ?auto_77958 ) ) ( not ( = ?auto_77954 ?auto_77957 ) ) ( not ( = ?auto_77954 ?auto_77959 ) ) ( not ( = ?auto_77954 ?auto_77960 ) ) ( not ( = ?auto_77954 ?auto_77961 ) ) ( not ( = ?auto_77955 ?auto_77956 ) ) ( not ( = ?auto_77955 ?auto_77958 ) ) ( not ( = ?auto_77955 ?auto_77957 ) ) ( not ( = ?auto_77955 ?auto_77959 ) ) ( not ( = ?auto_77955 ?auto_77960 ) ) ( not ( = ?auto_77955 ?auto_77961 ) ) ( not ( = ?auto_77956 ?auto_77958 ) ) ( not ( = ?auto_77956 ?auto_77957 ) ) ( not ( = ?auto_77956 ?auto_77959 ) ) ( not ( = ?auto_77956 ?auto_77960 ) ) ( not ( = ?auto_77956 ?auto_77961 ) ) ( not ( = ?auto_77958 ?auto_77957 ) ) ( not ( = ?auto_77958 ?auto_77959 ) ) ( not ( = ?auto_77958 ?auto_77960 ) ) ( not ( = ?auto_77958 ?auto_77961 ) ) ( not ( = ?auto_77957 ?auto_77959 ) ) ( not ( = ?auto_77957 ?auto_77960 ) ) ( not ( = ?auto_77957 ?auto_77961 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_77959 ?auto_77960 ?auto_77961 )
      ( MAKE-7CRATE-VERIFY ?auto_77954 ?auto_77955 ?auto_77956 ?auto_77958 ?auto_77957 ?auto_77959 ?auto_77960 ?auto_77961 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78024 - SURFACE
      ?auto_78025 - SURFACE
      ?auto_78026 - SURFACE
      ?auto_78028 - SURFACE
      ?auto_78027 - SURFACE
      ?auto_78029 - SURFACE
      ?auto_78030 - SURFACE
      ?auto_78031 - SURFACE
    )
    :vars
    (
      ?auto_78036 - HOIST
      ?auto_78035 - PLACE
      ?auto_78033 - TRUCK
      ?auto_78034 - PLACE
      ?auto_78032 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_78036 ?auto_78035 ) ( SURFACE-AT ?auto_78030 ?auto_78035 ) ( CLEAR ?auto_78030 ) ( IS-CRATE ?auto_78031 ) ( not ( = ?auto_78030 ?auto_78031 ) ) ( AVAILABLE ?auto_78036 ) ( ON ?auto_78030 ?auto_78029 ) ( not ( = ?auto_78029 ?auto_78030 ) ) ( not ( = ?auto_78029 ?auto_78031 ) ) ( TRUCK-AT ?auto_78033 ?auto_78034 ) ( not ( = ?auto_78034 ?auto_78035 ) ) ( HOIST-AT ?auto_78032 ?auto_78034 ) ( LIFTING ?auto_78032 ?auto_78031 ) ( not ( = ?auto_78036 ?auto_78032 ) ) ( ON ?auto_78025 ?auto_78024 ) ( ON ?auto_78026 ?auto_78025 ) ( ON ?auto_78028 ?auto_78026 ) ( ON ?auto_78027 ?auto_78028 ) ( ON ?auto_78029 ?auto_78027 ) ( not ( = ?auto_78024 ?auto_78025 ) ) ( not ( = ?auto_78024 ?auto_78026 ) ) ( not ( = ?auto_78024 ?auto_78028 ) ) ( not ( = ?auto_78024 ?auto_78027 ) ) ( not ( = ?auto_78024 ?auto_78029 ) ) ( not ( = ?auto_78024 ?auto_78030 ) ) ( not ( = ?auto_78024 ?auto_78031 ) ) ( not ( = ?auto_78025 ?auto_78026 ) ) ( not ( = ?auto_78025 ?auto_78028 ) ) ( not ( = ?auto_78025 ?auto_78027 ) ) ( not ( = ?auto_78025 ?auto_78029 ) ) ( not ( = ?auto_78025 ?auto_78030 ) ) ( not ( = ?auto_78025 ?auto_78031 ) ) ( not ( = ?auto_78026 ?auto_78028 ) ) ( not ( = ?auto_78026 ?auto_78027 ) ) ( not ( = ?auto_78026 ?auto_78029 ) ) ( not ( = ?auto_78026 ?auto_78030 ) ) ( not ( = ?auto_78026 ?auto_78031 ) ) ( not ( = ?auto_78028 ?auto_78027 ) ) ( not ( = ?auto_78028 ?auto_78029 ) ) ( not ( = ?auto_78028 ?auto_78030 ) ) ( not ( = ?auto_78028 ?auto_78031 ) ) ( not ( = ?auto_78027 ?auto_78029 ) ) ( not ( = ?auto_78027 ?auto_78030 ) ) ( not ( = ?auto_78027 ?auto_78031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78029 ?auto_78030 ?auto_78031 )
      ( MAKE-7CRATE-VERIFY ?auto_78024 ?auto_78025 ?auto_78026 ?auto_78028 ?auto_78027 ?auto_78029 ?auto_78030 ?auto_78031 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78101 - SURFACE
      ?auto_78102 - SURFACE
      ?auto_78103 - SURFACE
      ?auto_78105 - SURFACE
      ?auto_78104 - SURFACE
      ?auto_78106 - SURFACE
      ?auto_78107 - SURFACE
      ?auto_78108 - SURFACE
    )
    :vars
    (
      ?auto_78109 - HOIST
      ?auto_78112 - PLACE
      ?auto_78111 - TRUCK
      ?auto_78110 - PLACE
      ?auto_78113 - HOIST
      ?auto_78114 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_78109 ?auto_78112 ) ( SURFACE-AT ?auto_78107 ?auto_78112 ) ( CLEAR ?auto_78107 ) ( IS-CRATE ?auto_78108 ) ( not ( = ?auto_78107 ?auto_78108 ) ) ( AVAILABLE ?auto_78109 ) ( ON ?auto_78107 ?auto_78106 ) ( not ( = ?auto_78106 ?auto_78107 ) ) ( not ( = ?auto_78106 ?auto_78108 ) ) ( TRUCK-AT ?auto_78111 ?auto_78110 ) ( not ( = ?auto_78110 ?auto_78112 ) ) ( HOIST-AT ?auto_78113 ?auto_78110 ) ( not ( = ?auto_78109 ?auto_78113 ) ) ( AVAILABLE ?auto_78113 ) ( SURFACE-AT ?auto_78108 ?auto_78110 ) ( ON ?auto_78108 ?auto_78114 ) ( CLEAR ?auto_78108 ) ( not ( = ?auto_78107 ?auto_78114 ) ) ( not ( = ?auto_78108 ?auto_78114 ) ) ( not ( = ?auto_78106 ?auto_78114 ) ) ( ON ?auto_78102 ?auto_78101 ) ( ON ?auto_78103 ?auto_78102 ) ( ON ?auto_78105 ?auto_78103 ) ( ON ?auto_78104 ?auto_78105 ) ( ON ?auto_78106 ?auto_78104 ) ( not ( = ?auto_78101 ?auto_78102 ) ) ( not ( = ?auto_78101 ?auto_78103 ) ) ( not ( = ?auto_78101 ?auto_78105 ) ) ( not ( = ?auto_78101 ?auto_78104 ) ) ( not ( = ?auto_78101 ?auto_78106 ) ) ( not ( = ?auto_78101 ?auto_78107 ) ) ( not ( = ?auto_78101 ?auto_78108 ) ) ( not ( = ?auto_78101 ?auto_78114 ) ) ( not ( = ?auto_78102 ?auto_78103 ) ) ( not ( = ?auto_78102 ?auto_78105 ) ) ( not ( = ?auto_78102 ?auto_78104 ) ) ( not ( = ?auto_78102 ?auto_78106 ) ) ( not ( = ?auto_78102 ?auto_78107 ) ) ( not ( = ?auto_78102 ?auto_78108 ) ) ( not ( = ?auto_78102 ?auto_78114 ) ) ( not ( = ?auto_78103 ?auto_78105 ) ) ( not ( = ?auto_78103 ?auto_78104 ) ) ( not ( = ?auto_78103 ?auto_78106 ) ) ( not ( = ?auto_78103 ?auto_78107 ) ) ( not ( = ?auto_78103 ?auto_78108 ) ) ( not ( = ?auto_78103 ?auto_78114 ) ) ( not ( = ?auto_78105 ?auto_78104 ) ) ( not ( = ?auto_78105 ?auto_78106 ) ) ( not ( = ?auto_78105 ?auto_78107 ) ) ( not ( = ?auto_78105 ?auto_78108 ) ) ( not ( = ?auto_78105 ?auto_78114 ) ) ( not ( = ?auto_78104 ?auto_78106 ) ) ( not ( = ?auto_78104 ?auto_78107 ) ) ( not ( = ?auto_78104 ?auto_78108 ) ) ( not ( = ?auto_78104 ?auto_78114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78106 ?auto_78107 ?auto_78108 )
      ( MAKE-7CRATE-VERIFY ?auto_78101 ?auto_78102 ?auto_78103 ?auto_78105 ?auto_78104 ?auto_78106 ?auto_78107 ?auto_78108 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78179 - SURFACE
      ?auto_78180 - SURFACE
      ?auto_78181 - SURFACE
      ?auto_78183 - SURFACE
      ?auto_78182 - SURFACE
      ?auto_78184 - SURFACE
      ?auto_78185 - SURFACE
      ?auto_78186 - SURFACE
    )
    :vars
    (
      ?auto_78189 - HOIST
      ?auto_78191 - PLACE
      ?auto_78192 - PLACE
      ?auto_78188 - HOIST
      ?auto_78187 - SURFACE
      ?auto_78190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78189 ?auto_78191 ) ( SURFACE-AT ?auto_78185 ?auto_78191 ) ( CLEAR ?auto_78185 ) ( IS-CRATE ?auto_78186 ) ( not ( = ?auto_78185 ?auto_78186 ) ) ( AVAILABLE ?auto_78189 ) ( ON ?auto_78185 ?auto_78184 ) ( not ( = ?auto_78184 ?auto_78185 ) ) ( not ( = ?auto_78184 ?auto_78186 ) ) ( not ( = ?auto_78192 ?auto_78191 ) ) ( HOIST-AT ?auto_78188 ?auto_78192 ) ( not ( = ?auto_78189 ?auto_78188 ) ) ( AVAILABLE ?auto_78188 ) ( SURFACE-AT ?auto_78186 ?auto_78192 ) ( ON ?auto_78186 ?auto_78187 ) ( CLEAR ?auto_78186 ) ( not ( = ?auto_78185 ?auto_78187 ) ) ( not ( = ?auto_78186 ?auto_78187 ) ) ( not ( = ?auto_78184 ?auto_78187 ) ) ( TRUCK-AT ?auto_78190 ?auto_78191 ) ( ON ?auto_78180 ?auto_78179 ) ( ON ?auto_78181 ?auto_78180 ) ( ON ?auto_78183 ?auto_78181 ) ( ON ?auto_78182 ?auto_78183 ) ( ON ?auto_78184 ?auto_78182 ) ( not ( = ?auto_78179 ?auto_78180 ) ) ( not ( = ?auto_78179 ?auto_78181 ) ) ( not ( = ?auto_78179 ?auto_78183 ) ) ( not ( = ?auto_78179 ?auto_78182 ) ) ( not ( = ?auto_78179 ?auto_78184 ) ) ( not ( = ?auto_78179 ?auto_78185 ) ) ( not ( = ?auto_78179 ?auto_78186 ) ) ( not ( = ?auto_78179 ?auto_78187 ) ) ( not ( = ?auto_78180 ?auto_78181 ) ) ( not ( = ?auto_78180 ?auto_78183 ) ) ( not ( = ?auto_78180 ?auto_78182 ) ) ( not ( = ?auto_78180 ?auto_78184 ) ) ( not ( = ?auto_78180 ?auto_78185 ) ) ( not ( = ?auto_78180 ?auto_78186 ) ) ( not ( = ?auto_78180 ?auto_78187 ) ) ( not ( = ?auto_78181 ?auto_78183 ) ) ( not ( = ?auto_78181 ?auto_78182 ) ) ( not ( = ?auto_78181 ?auto_78184 ) ) ( not ( = ?auto_78181 ?auto_78185 ) ) ( not ( = ?auto_78181 ?auto_78186 ) ) ( not ( = ?auto_78181 ?auto_78187 ) ) ( not ( = ?auto_78183 ?auto_78182 ) ) ( not ( = ?auto_78183 ?auto_78184 ) ) ( not ( = ?auto_78183 ?auto_78185 ) ) ( not ( = ?auto_78183 ?auto_78186 ) ) ( not ( = ?auto_78183 ?auto_78187 ) ) ( not ( = ?auto_78182 ?auto_78184 ) ) ( not ( = ?auto_78182 ?auto_78185 ) ) ( not ( = ?auto_78182 ?auto_78186 ) ) ( not ( = ?auto_78182 ?auto_78187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78184 ?auto_78185 ?auto_78186 )
      ( MAKE-7CRATE-VERIFY ?auto_78179 ?auto_78180 ?auto_78181 ?auto_78183 ?auto_78182 ?auto_78184 ?auto_78185 ?auto_78186 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78257 - SURFACE
      ?auto_78258 - SURFACE
      ?auto_78259 - SURFACE
      ?auto_78261 - SURFACE
      ?auto_78260 - SURFACE
      ?auto_78262 - SURFACE
      ?auto_78263 - SURFACE
      ?auto_78264 - SURFACE
    )
    :vars
    (
      ?auto_78267 - HOIST
      ?auto_78269 - PLACE
      ?auto_78265 - PLACE
      ?auto_78266 - HOIST
      ?auto_78270 - SURFACE
      ?auto_78268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78267 ?auto_78269 ) ( IS-CRATE ?auto_78264 ) ( not ( = ?auto_78263 ?auto_78264 ) ) ( not ( = ?auto_78262 ?auto_78263 ) ) ( not ( = ?auto_78262 ?auto_78264 ) ) ( not ( = ?auto_78265 ?auto_78269 ) ) ( HOIST-AT ?auto_78266 ?auto_78265 ) ( not ( = ?auto_78267 ?auto_78266 ) ) ( AVAILABLE ?auto_78266 ) ( SURFACE-AT ?auto_78264 ?auto_78265 ) ( ON ?auto_78264 ?auto_78270 ) ( CLEAR ?auto_78264 ) ( not ( = ?auto_78263 ?auto_78270 ) ) ( not ( = ?auto_78264 ?auto_78270 ) ) ( not ( = ?auto_78262 ?auto_78270 ) ) ( TRUCK-AT ?auto_78268 ?auto_78269 ) ( SURFACE-AT ?auto_78262 ?auto_78269 ) ( CLEAR ?auto_78262 ) ( LIFTING ?auto_78267 ?auto_78263 ) ( IS-CRATE ?auto_78263 ) ( ON ?auto_78258 ?auto_78257 ) ( ON ?auto_78259 ?auto_78258 ) ( ON ?auto_78261 ?auto_78259 ) ( ON ?auto_78260 ?auto_78261 ) ( ON ?auto_78262 ?auto_78260 ) ( not ( = ?auto_78257 ?auto_78258 ) ) ( not ( = ?auto_78257 ?auto_78259 ) ) ( not ( = ?auto_78257 ?auto_78261 ) ) ( not ( = ?auto_78257 ?auto_78260 ) ) ( not ( = ?auto_78257 ?auto_78262 ) ) ( not ( = ?auto_78257 ?auto_78263 ) ) ( not ( = ?auto_78257 ?auto_78264 ) ) ( not ( = ?auto_78257 ?auto_78270 ) ) ( not ( = ?auto_78258 ?auto_78259 ) ) ( not ( = ?auto_78258 ?auto_78261 ) ) ( not ( = ?auto_78258 ?auto_78260 ) ) ( not ( = ?auto_78258 ?auto_78262 ) ) ( not ( = ?auto_78258 ?auto_78263 ) ) ( not ( = ?auto_78258 ?auto_78264 ) ) ( not ( = ?auto_78258 ?auto_78270 ) ) ( not ( = ?auto_78259 ?auto_78261 ) ) ( not ( = ?auto_78259 ?auto_78260 ) ) ( not ( = ?auto_78259 ?auto_78262 ) ) ( not ( = ?auto_78259 ?auto_78263 ) ) ( not ( = ?auto_78259 ?auto_78264 ) ) ( not ( = ?auto_78259 ?auto_78270 ) ) ( not ( = ?auto_78261 ?auto_78260 ) ) ( not ( = ?auto_78261 ?auto_78262 ) ) ( not ( = ?auto_78261 ?auto_78263 ) ) ( not ( = ?auto_78261 ?auto_78264 ) ) ( not ( = ?auto_78261 ?auto_78270 ) ) ( not ( = ?auto_78260 ?auto_78262 ) ) ( not ( = ?auto_78260 ?auto_78263 ) ) ( not ( = ?auto_78260 ?auto_78264 ) ) ( not ( = ?auto_78260 ?auto_78270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78262 ?auto_78263 ?auto_78264 )
      ( MAKE-7CRATE-VERIFY ?auto_78257 ?auto_78258 ?auto_78259 ?auto_78261 ?auto_78260 ?auto_78262 ?auto_78263 ?auto_78264 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_78335 - SURFACE
      ?auto_78336 - SURFACE
      ?auto_78337 - SURFACE
      ?auto_78339 - SURFACE
      ?auto_78338 - SURFACE
      ?auto_78340 - SURFACE
      ?auto_78341 - SURFACE
      ?auto_78342 - SURFACE
    )
    :vars
    (
      ?auto_78344 - HOIST
      ?auto_78345 - PLACE
      ?auto_78347 - PLACE
      ?auto_78343 - HOIST
      ?auto_78348 - SURFACE
      ?auto_78346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_78344 ?auto_78345 ) ( IS-CRATE ?auto_78342 ) ( not ( = ?auto_78341 ?auto_78342 ) ) ( not ( = ?auto_78340 ?auto_78341 ) ) ( not ( = ?auto_78340 ?auto_78342 ) ) ( not ( = ?auto_78347 ?auto_78345 ) ) ( HOIST-AT ?auto_78343 ?auto_78347 ) ( not ( = ?auto_78344 ?auto_78343 ) ) ( AVAILABLE ?auto_78343 ) ( SURFACE-AT ?auto_78342 ?auto_78347 ) ( ON ?auto_78342 ?auto_78348 ) ( CLEAR ?auto_78342 ) ( not ( = ?auto_78341 ?auto_78348 ) ) ( not ( = ?auto_78342 ?auto_78348 ) ) ( not ( = ?auto_78340 ?auto_78348 ) ) ( TRUCK-AT ?auto_78346 ?auto_78345 ) ( SURFACE-AT ?auto_78340 ?auto_78345 ) ( CLEAR ?auto_78340 ) ( IS-CRATE ?auto_78341 ) ( AVAILABLE ?auto_78344 ) ( IN ?auto_78341 ?auto_78346 ) ( ON ?auto_78336 ?auto_78335 ) ( ON ?auto_78337 ?auto_78336 ) ( ON ?auto_78339 ?auto_78337 ) ( ON ?auto_78338 ?auto_78339 ) ( ON ?auto_78340 ?auto_78338 ) ( not ( = ?auto_78335 ?auto_78336 ) ) ( not ( = ?auto_78335 ?auto_78337 ) ) ( not ( = ?auto_78335 ?auto_78339 ) ) ( not ( = ?auto_78335 ?auto_78338 ) ) ( not ( = ?auto_78335 ?auto_78340 ) ) ( not ( = ?auto_78335 ?auto_78341 ) ) ( not ( = ?auto_78335 ?auto_78342 ) ) ( not ( = ?auto_78335 ?auto_78348 ) ) ( not ( = ?auto_78336 ?auto_78337 ) ) ( not ( = ?auto_78336 ?auto_78339 ) ) ( not ( = ?auto_78336 ?auto_78338 ) ) ( not ( = ?auto_78336 ?auto_78340 ) ) ( not ( = ?auto_78336 ?auto_78341 ) ) ( not ( = ?auto_78336 ?auto_78342 ) ) ( not ( = ?auto_78336 ?auto_78348 ) ) ( not ( = ?auto_78337 ?auto_78339 ) ) ( not ( = ?auto_78337 ?auto_78338 ) ) ( not ( = ?auto_78337 ?auto_78340 ) ) ( not ( = ?auto_78337 ?auto_78341 ) ) ( not ( = ?auto_78337 ?auto_78342 ) ) ( not ( = ?auto_78337 ?auto_78348 ) ) ( not ( = ?auto_78339 ?auto_78338 ) ) ( not ( = ?auto_78339 ?auto_78340 ) ) ( not ( = ?auto_78339 ?auto_78341 ) ) ( not ( = ?auto_78339 ?auto_78342 ) ) ( not ( = ?auto_78339 ?auto_78348 ) ) ( not ( = ?auto_78338 ?auto_78340 ) ) ( not ( = ?auto_78338 ?auto_78341 ) ) ( not ( = ?auto_78338 ?auto_78342 ) ) ( not ( = ?auto_78338 ?auto_78348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_78340 ?auto_78341 ?auto_78342 )
      ( MAKE-7CRATE-VERIFY ?auto_78335 ?auto_78336 ?auto_78337 ?auto_78339 ?auto_78338 ?auto_78340 ?auto_78341 ?auto_78342 ) )
  )

)

