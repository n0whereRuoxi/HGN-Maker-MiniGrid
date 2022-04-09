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
      ?auto_9365 - SURFACE
      ?auto_9366 - SURFACE
    )
    :vars
    (
      ?auto_9367 - HOIST
      ?auto_9368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9367 ?auto_9368 ) ( SURFACE-AT ?auto_9365 ?auto_9368 ) ( CLEAR ?auto_9365 ) ( LIFTING ?auto_9367 ?auto_9366 ) ( IS-CRATE ?auto_9366 ) ( not ( = ?auto_9365 ?auto_9366 ) ) )
    :subtasks
    ( ( !DROP ?auto_9367 ?auto_9366 ?auto_9365 ?auto_9368 )
      ( MAKE-1CRATE-VERIFY ?auto_9365 ?auto_9366 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9369 - SURFACE
      ?auto_9370 - SURFACE
    )
    :vars
    (
      ?auto_9372 - HOIST
      ?auto_9371 - PLACE
      ?auto_9373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9372 ?auto_9371 ) ( SURFACE-AT ?auto_9369 ?auto_9371 ) ( CLEAR ?auto_9369 ) ( IS-CRATE ?auto_9370 ) ( not ( = ?auto_9369 ?auto_9370 ) ) ( TRUCK-AT ?auto_9373 ?auto_9371 ) ( AVAILABLE ?auto_9372 ) ( IN ?auto_9370 ?auto_9373 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9372 ?auto_9370 ?auto_9373 ?auto_9371 )
      ( MAKE-1CRATE ?auto_9369 ?auto_9370 )
      ( MAKE-1CRATE-VERIFY ?auto_9369 ?auto_9370 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9374 - SURFACE
      ?auto_9375 - SURFACE
    )
    :vars
    (
      ?auto_9378 - HOIST
      ?auto_9377 - PLACE
      ?auto_9376 - TRUCK
      ?auto_9379 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9378 ?auto_9377 ) ( SURFACE-AT ?auto_9374 ?auto_9377 ) ( CLEAR ?auto_9374 ) ( IS-CRATE ?auto_9375 ) ( not ( = ?auto_9374 ?auto_9375 ) ) ( AVAILABLE ?auto_9378 ) ( IN ?auto_9375 ?auto_9376 ) ( TRUCK-AT ?auto_9376 ?auto_9379 ) ( not ( = ?auto_9379 ?auto_9377 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9376 ?auto_9379 ?auto_9377 )
      ( MAKE-1CRATE ?auto_9374 ?auto_9375 )
      ( MAKE-1CRATE-VERIFY ?auto_9374 ?auto_9375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9380 - SURFACE
      ?auto_9381 - SURFACE
    )
    :vars
    (
      ?auto_9384 - HOIST
      ?auto_9382 - PLACE
      ?auto_9385 - TRUCK
      ?auto_9383 - PLACE
      ?auto_9386 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9384 ?auto_9382 ) ( SURFACE-AT ?auto_9380 ?auto_9382 ) ( CLEAR ?auto_9380 ) ( IS-CRATE ?auto_9381 ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( AVAILABLE ?auto_9384 ) ( TRUCK-AT ?auto_9385 ?auto_9383 ) ( not ( = ?auto_9383 ?auto_9382 ) ) ( HOIST-AT ?auto_9386 ?auto_9383 ) ( LIFTING ?auto_9386 ?auto_9381 ) ( not ( = ?auto_9384 ?auto_9386 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9386 ?auto_9381 ?auto_9385 ?auto_9383 )
      ( MAKE-1CRATE ?auto_9380 ?auto_9381 )
      ( MAKE-1CRATE-VERIFY ?auto_9380 ?auto_9381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9387 - SURFACE
      ?auto_9388 - SURFACE
    )
    :vars
    (
      ?auto_9393 - HOIST
      ?auto_9391 - PLACE
      ?auto_9389 - TRUCK
      ?auto_9390 - PLACE
      ?auto_9392 - HOIST
      ?auto_9394 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9393 ?auto_9391 ) ( SURFACE-AT ?auto_9387 ?auto_9391 ) ( CLEAR ?auto_9387 ) ( IS-CRATE ?auto_9388 ) ( not ( = ?auto_9387 ?auto_9388 ) ) ( AVAILABLE ?auto_9393 ) ( TRUCK-AT ?auto_9389 ?auto_9390 ) ( not ( = ?auto_9390 ?auto_9391 ) ) ( HOIST-AT ?auto_9392 ?auto_9390 ) ( not ( = ?auto_9393 ?auto_9392 ) ) ( AVAILABLE ?auto_9392 ) ( SURFACE-AT ?auto_9388 ?auto_9390 ) ( ON ?auto_9388 ?auto_9394 ) ( CLEAR ?auto_9388 ) ( not ( = ?auto_9387 ?auto_9394 ) ) ( not ( = ?auto_9388 ?auto_9394 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9392 ?auto_9388 ?auto_9394 ?auto_9390 )
      ( MAKE-1CRATE ?auto_9387 ?auto_9388 )
      ( MAKE-1CRATE-VERIFY ?auto_9387 ?auto_9388 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9395 - SURFACE
      ?auto_9396 - SURFACE
    )
    :vars
    (
      ?auto_9398 - HOIST
      ?auto_9399 - PLACE
      ?auto_9397 - PLACE
      ?auto_9400 - HOIST
      ?auto_9402 - SURFACE
      ?auto_9401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9398 ?auto_9399 ) ( SURFACE-AT ?auto_9395 ?auto_9399 ) ( CLEAR ?auto_9395 ) ( IS-CRATE ?auto_9396 ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( AVAILABLE ?auto_9398 ) ( not ( = ?auto_9397 ?auto_9399 ) ) ( HOIST-AT ?auto_9400 ?auto_9397 ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( AVAILABLE ?auto_9400 ) ( SURFACE-AT ?auto_9396 ?auto_9397 ) ( ON ?auto_9396 ?auto_9402 ) ( CLEAR ?auto_9396 ) ( not ( = ?auto_9395 ?auto_9402 ) ) ( not ( = ?auto_9396 ?auto_9402 ) ) ( TRUCK-AT ?auto_9401 ?auto_9399 ) )
    :subtasks
    ( ( !DRIVE ?auto_9401 ?auto_9399 ?auto_9397 )
      ( MAKE-1CRATE ?auto_9395 ?auto_9396 )
      ( MAKE-1CRATE-VERIFY ?auto_9395 ?auto_9396 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9412 - SURFACE
      ?auto_9413 - SURFACE
      ?auto_9414 - SURFACE
    )
    :vars
    (
      ?auto_9415 - HOIST
      ?auto_9416 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9415 ?auto_9416 ) ( SURFACE-AT ?auto_9413 ?auto_9416 ) ( CLEAR ?auto_9413 ) ( LIFTING ?auto_9415 ?auto_9414 ) ( IS-CRATE ?auto_9414 ) ( not ( = ?auto_9413 ?auto_9414 ) ) ( ON ?auto_9413 ?auto_9412 ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9414 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9413 ?auto_9414 )
      ( MAKE-2CRATE-VERIFY ?auto_9412 ?auto_9413 ?auto_9414 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9422 - SURFACE
      ?auto_9423 - SURFACE
      ?auto_9424 - SURFACE
    )
    :vars
    (
      ?auto_9425 - HOIST
      ?auto_9427 - PLACE
      ?auto_9426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9425 ?auto_9427 ) ( SURFACE-AT ?auto_9423 ?auto_9427 ) ( CLEAR ?auto_9423 ) ( IS-CRATE ?auto_9424 ) ( not ( = ?auto_9423 ?auto_9424 ) ) ( TRUCK-AT ?auto_9426 ?auto_9427 ) ( AVAILABLE ?auto_9425 ) ( IN ?auto_9424 ?auto_9426 ) ( ON ?auto_9423 ?auto_9422 ) ( not ( = ?auto_9422 ?auto_9423 ) ) ( not ( = ?auto_9422 ?auto_9424 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9423 ?auto_9424 )
      ( MAKE-2CRATE-VERIFY ?auto_9422 ?auto_9423 ?auto_9424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9428 - SURFACE
      ?auto_9429 - SURFACE
    )
    :vars
    (
      ?auto_9430 - HOIST
      ?auto_9433 - PLACE
      ?auto_9431 - TRUCK
      ?auto_9432 - SURFACE
      ?auto_9434 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9430 ?auto_9433 ) ( SURFACE-AT ?auto_9428 ?auto_9433 ) ( CLEAR ?auto_9428 ) ( IS-CRATE ?auto_9429 ) ( not ( = ?auto_9428 ?auto_9429 ) ) ( AVAILABLE ?auto_9430 ) ( IN ?auto_9429 ?auto_9431 ) ( ON ?auto_9428 ?auto_9432 ) ( not ( = ?auto_9432 ?auto_9428 ) ) ( not ( = ?auto_9432 ?auto_9429 ) ) ( TRUCK-AT ?auto_9431 ?auto_9434 ) ( not ( = ?auto_9434 ?auto_9433 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9431 ?auto_9434 ?auto_9433 )
      ( MAKE-2CRATE ?auto_9432 ?auto_9428 ?auto_9429 )
      ( MAKE-1CRATE-VERIFY ?auto_9428 ?auto_9429 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9435 - SURFACE
      ?auto_9436 - SURFACE
      ?auto_9437 - SURFACE
    )
    :vars
    (
      ?auto_9438 - HOIST
      ?auto_9441 - PLACE
      ?auto_9439 - TRUCK
      ?auto_9440 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9438 ?auto_9441 ) ( SURFACE-AT ?auto_9436 ?auto_9441 ) ( CLEAR ?auto_9436 ) ( IS-CRATE ?auto_9437 ) ( not ( = ?auto_9436 ?auto_9437 ) ) ( AVAILABLE ?auto_9438 ) ( IN ?auto_9437 ?auto_9439 ) ( ON ?auto_9436 ?auto_9435 ) ( not ( = ?auto_9435 ?auto_9436 ) ) ( not ( = ?auto_9435 ?auto_9437 ) ) ( TRUCK-AT ?auto_9439 ?auto_9440 ) ( not ( = ?auto_9440 ?auto_9441 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9436 ?auto_9437 )
      ( MAKE-2CRATE-VERIFY ?auto_9435 ?auto_9436 ?auto_9437 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9442 - SURFACE
      ?auto_9443 - SURFACE
    )
    :vars
    (
      ?auto_9446 - HOIST
      ?auto_9448 - PLACE
      ?auto_9444 - SURFACE
      ?auto_9445 - TRUCK
      ?auto_9447 - PLACE
      ?auto_9449 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9446 ?auto_9448 ) ( SURFACE-AT ?auto_9442 ?auto_9448 ) ( CLEAR ?auto_9442 ) ( IS-CRATE ?auto_9443 ) ( not ( = ?auto_9442 ?auto_9443 ) ) ( AVAILABLE ?auto_9446 ) ( ON ?auto_9442 ?auto_9444 ) ( not ( = ?auto_9444 ?auto_9442 ) ) ( not ( = ?auto_9444 ?auto_9443 ) ) ( TRUCK-AT ?auto_9445 ?auto_9447 ) ( not ( = ?auto_9447 ?auto_9448 ) ) ( HOIST-AT ?auto_9449 ?auto_9447 ) ( LIFTING ?auto_9449 ?auto_9443 ) ( not ( = ?auto_9446 ?auto_9449 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9449 ?auto_9443 ?auto_9445 ?auto_9447 )
      ( MAKE-2CRATE ?auto_9444 ?auto_9442 ?auto_9443 )
      ( MAKE-1CRATE-VERIFY ?auto_9442 ?auto_9443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9450 - SURFACE
      ?auto_9451 - SURFACE
      ?auto_9452 - SURFACE
    )
    :vars
    (
      ?auto_9455 - HOIST
      ?auto_9454 - PLACE
      ?auto_9456 - TRUCK
      ?auto_9457 - PLACE
      ?auto_9453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9455 ?auto_9454 ) ( SURFACE-AT ?auto_9451 ?auto_9454 ) ( CLEAR ?auto_9451 ) ( IS-CRATE ?auto_9452 ) ( not ( = ?auto_9451 ?auto_9452 ) ) ( AVAILABLE ?auto_9455 ) ( ON ?auto_9451 ?auto_9450 ) ( not ( = ?auto_9450 ?auto_9451 ) ) ( not ( = ?auto_9450 ?auto_9452 ) ) ( TRUCK-AT ?auto_9456 ?auto_9457 ) ( not ( = ?auto_9457 ?auto_9454 ) ) ( HOIST-AT ?auto_9453 ?auto_9457 ) ( LIFTING ?auto_9453 ?auto_9452 ) ( not ( = ?auto_9455 ?auto_9453 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9451 ?auto_9452 )
      ( MAKE-2CRATE-VERIFY ?auto_9450 ?auto_9451 ?auto_9452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9458 - SURFACE
      ?auto_9459 - SURFACE
    )
    :vars
    (
      ?auto_9464 - HOIST
      ?auto_9460 - PLACE
      ?auto_9463 - SURFACE
      ?auto_9465 - TRUCK
      ?auto_9461 - PLACE
      ?auto_9462 - HOIST
      ?auto_9466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9464 ?auto_9460 ) ( SURFACE-AT ?auto_9458 ?auto_9460 ) ( CLEAR ?auto_9458 ) ( IS-CRATE ?auto_9459 ) ( not ( = ?auto_9458 ?auto_9459 ) ) ( AVAILABLE ?auto_9464 ) ( ON ?auto_9458 ?auto_9463 ) ( not ( = ?auto_9463 ?auto_9458 ) ) ( not ( = ?auto_9463 ?auto_9459 ) ) ( TRUCK-AT ?auto_9465 ?auto_9461 ) ( not ( = ?auto_9461 ?auto_9460 ) ) ( HOIST-AT ?auto_9462 ?auto_9461 ) ( not ( = ?auto_9464 ?auto_9462 ) ) ( AVAILABLE ?auto_9462 ) ( SURFACE-AT ?auto_9459 ?auto_9461 ) ( ON ?auto_9459 ?auto_9466 ) ( CLEAR ?auto_9459 ) ( not ( = ?auto_9458 ?auto_9466 ) ) ( not ( = ?auto_9459 ?auto_9466 ) ) ( not ( = ?auto_9463 ?auto_9466 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9462 ?auto_9459 ?auto_9466 ?auto_9461 )
      ( MAKE-2CRATE ?auto_9463 ?auto_9458 ?auto_9459 )
      ( MAKE-1CRATE-VERIFY ?auto_9458 ?auto_9459 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9467 - SURFACE
      ?auto_9468 - SURFACE
      ?auto_9469 - SURFACE
    )
    :vars
    (
      ?auto_9470 - HOIST
      ?auto_9471 - PLACE
      ?auto_9475 - TRUCK
      ?auto_9474 - PLACE
      ?auto_9473 - HOIST
      ?auto_9472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9470 ?auto_9471 ) ( SURFACE-AT ?auto_9468 ?auto_9471 ) ( CLEAR ?auto_9468 ) ( IS-CRATE ?auto_9469 ) ( not ( = ?auto_9468 ?auto_9469 ) ) ( AVAILABLE ?auto_9470 ) ( ON ?auto_9468 ?auto_9467 ) ( not ( = ?auto_9467 ?auto_9468 ) ) ( not ( = ?auto_9467 ?auto_9469 ) ) ( TRUCK-AT ?auto_9475 ?auto_9474 ) ( not ( = ?auto_9474 ?auto_9471 ) ) ( HOIST-AT ?auto_9473 ?auto_9474 ) ( not ( = ?auto_9470 ?auto_9473 ) ) ( AVAILABLE ?auto_9473 ) ( SURFACE-AT ?auto_9469 ?auto_9474 ) ( ON ?auto_9469 ?auto_9472 ) ( CLEAR ?auto_9469 ) ( not ( = ?auto_9468 ?auto_9472 ) ) ( not ( = ?auto_9469 ?auto_9472 ) ) ( not ( = ?auto_9467 ?auto_9472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9468 ?auto_9469 )
      ( MAKE-2CRATE-VERIFY ?auto_9467 ?auto_9468 ?auto_9469 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9476 - SURFACE
      ?auto_9477 - SURFACE
    )
    :vars
    (
      ?auto_9483 - HOIST
      ?auto_9484 - PLACE
      ?auto_9478 - SURFACE
      ?auto_9480 - PLACE
      ?auto_9482 - HOIST
      ?auto_9479 - SURFACE
      ?auto_9481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9483 ?auto_9484 ) ( SURFACE-AT ?auto_9476 ?auto_9484 ) ( CLEAR ?auto_9476 ) ( IS-CRATE ?auto_9477 ) ( not ( = ?auto_9476 ?auto_9477 ) ) ( AVAILABLE ?auto_9483 ) ( ON ?auto_9476 ?auto_9478 ) ( not ( = ?auto_9478 ?auto_9476 ) ) ( not ( = ?auto_9478 ?auto_9477 ) ) ( not ( = ?auto_9480 ?auto_9484 ) ) ( HOIST-AT ?auto_9482 ?auto_9480 ) ( not ( = ?auto_9483 ?auto_9482 ) ) ( AVAILABLE ?auto_9482 ) ( SURFACE-AT ?auto_9477 ?auto_9480 ) ( ON ?auto_9477 ?auto_9479 ) ( CLEAR ?auto_9477 ) ( not ( = ?auto_9476 ?auto_9479 ) ) ( not ( = ?auto_9477 ?auto_9479 ) ) ( not ( = ?auto_9478 ?auto_9479 ) ) ( TRUCK-AT ?auto_9481 ?auto_9484 ) )
    :subtasks
    ( ( !DRIVE ?auto_9481 ?auto_9484 ?auto_9480 )
      ( MAKE-2CRATE ?auto_9478 ?auto_9476 ?auto_9477 )
      ( MAKE-1CRATE-VERIFY ?auto_9476 ?auto_9477 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9485 - SURFACE
      ?auto_9486 - SURFACE
      ?auto_9487 - SURFACE
    )
    :vars
    (
      ?auto_9493 - HOIST
      ?auto_9491 - PLACE
      ?auto_9490 - PLACE
      ?auto_9489 - HOIST
      ?auto_9492 - SURFACE
      ?auto_9488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9493 ?auto_9491 ) ( SURFACE-AT ?auto_9486 ?auto_9491 ) ( CLEAR ?auto_9486 ) ( IS-CRATE ?auto_9487 ) ( not ( = ?auto_9486 ?auto_9487 ) ) ( AVAILABLE ?auto_9493 ) ( ON ?auto_9486 ?auto_9485 ) ( not ( = ?auto_9485 ?auto_9486 ) ) ( not ( = ?auto_9485 ?auto_9487 ) ) ( not ( = ?auto_9490 ?auto_9491 ) ) ( HOIST-AT ?auto_9489 ?auto_9490 ) ( not ( = ?auto_9493 ?auto_9489 ) ) ( AVAILABLE ?auto_9489 ) ( SURFACE-AT ?auto_9487 ?auto_9490 ) ( ON ?auto_9487 ?auto_9492 ) ( CLEAR ?auto_9487 ) ( not ( = ?auto_9486 ?auto_9492 ) ) ( not ( = ?auto_9487 ?auto_9492 ) ) ( not ( = ?auto_9485 ?auto_9492 ) ) ( TRUCK-AT ?auto_9488 ?auto_9491 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9486 ?auto_9487 )
      ( MAKE-2CRATE-VERIFY ?auto_9485 ?auto_9486 ?auto_9487 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9494 - SURFACE
      ?auto_9495 - SURFACE
    )
    :vars
    (
      ?auto_9500 - HOIST
      ?auto_9502 - PLACE
      ?auto_9496 - SURFACE
      ?auto_9501 - PLACE
      ?auto_9497 - HOIST
      ?auto_9499 - SURFACE
      ?auto_9498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9500 ?auto_9502 ) ( IS-CRATE ?auto_9495 ) ( not ( = ?auto_9494 ?auto_9495 ) ) ( not ( = ?auto_9496 ?auto_9494 ) ) ( not ( = ?auto_9496 ?auto_9495 ) ) ( not ( = ?auto_9501 ?auto_9502 ) ) ( HOIST-AT ?auto_9497 ?auto_9501 ) ( not ( = ?auto_9500 ?auto_9497 ) ) ( AVAILABLE ?auto_9497 ) ( SURFACE-AT ?auto_9495 ?auto_9501 ) ( ON ?auto_9495 ?auto_9499 ) ( CLEAR ?auto_9495 ) ( not ( = ?auto_9494 ?auto_9499 ) ) ( not ( = ?auto_9495 ?auto_9499 ) ) ( not ( = ?auto_9496 ?auto_9499 ) ) ( TRUCK-AT ?auto_9498 ?auto_9502 ) ( SURFACE-AT ?auto_9496 ?auto_9502 ) ( CLEAR ?auto_9496 ) ( LIFTING ?auto_9500 ?auto_9494 ) ( IS-CRATE ?auto_9494 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9496 ?auto_9494 )
      ( MAKE-2CRATE ?auto_9496 ?auto_9494 ?auto_9495 )
      ( MAKE-1CRATE-VERIFY ?auto_9494 ?auto_9495 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9503 - SURFACE
      ?auto_9504 - SURFACE
      ?auto_9505 - SURFACE
    )
    :vars
    (
      ?auto_9509 - HOIST
      ?auto_9510 - PLACE
      ?auto_9507 - PLACE
      ?auto_9511 - HOIST
      ?auto_9508 - SURFACE
      ?auto_9506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9509 ?auto_9510 ) ( IS-CRATE ?auto_9505 ) ( not ( = ?auto_9504 ?auto_9505 ) ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( not ( = ?auto_9507 ?auto_9510 ) ) ( HOIST-AT ?auto_9511 ?auto_9507 ) ( not ( = ?auto_9509 ?auto_9511 ) ) ( AVAILABLE ?auto_9511 ) ( SURFACE-AT ?auto_9505 ?auto_9507 ) ( ON ?auto_9505 ?auto_9508 ) ( CLEAR ?auto_9505 ) ( not ( = ?auto_9504 ?auto_9508 ) ) ( not ( = ?auto_9505 ?auto_9508 ) ) ( not ( = ?auto_9503 ?auto_9508 ) ) ( TRUCK-AT ?auto_9506 ?auto_9510 ) ( SURFACE-AT ?auto_9503 ?auto_9510 ) ( CLEAR ?auto_9503 ) ( LIFTING ?auto_9509 ?auto_9504 ) ( IS-CRATE ?auto_9504 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9504 ?auto_9505 )
      ( MAKE-2CRATE-VERIFY ?auto_9503 ?auto_9504 ?auto_9505 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9512 - SURFACE
      ?auto_9513 - SURFACE
    )
    :vars
    (
      ?auto_9517 - HOIST
      ?auto_9519 - PLACE
      ?auto_9514 - SURFACE
      ?auto_9518 - PLACE
      ?auto_9516 - HOIST
      ?auto_9520 - SURFACE
      ?auto_9515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9517 ?auto_9519 ) ( IS-CRATE ?auto_9513 ) ( not ( = ?auto_9512 ?auto_9513 ) ) ( not ( = ?auto_9514 ?auto_9512 ) ) ( not ( = ?auto_9514 ?auto_9513 ) ) ( not ( = ?auto_9518 ?auto_9519 ) ) ( HOIST-AT ?auto_9516 ?auto_9518 ) ( not ( = ?auto_9517 ?auto_9516 ) ) ( AVAILABLE ?auto_9516 ) ( SURFACE-AT ?auto_9513 ?auto_9518 ) ( ON ?auto_9513 ?auto_9520 ) ( CLEAR ?auto_9513 ) ( not ( = ?auto_9512 ?auto_9520 ) ) ( not ( = ?auto_9513 ?auto_9520 ) ) ( not ( = ?auto_9514 ?auto_9520 ) ) ( TRUCK-AT ?auto_9515 ?auto_9519 ) ( SURFACE-AT ?auto_9514 ?auto_9519 ) ( CLEAR ?auto_9514 ) ( IS-CRATE ?auto_9512 ) ( AVAILABLE ?auto_9517 ) ( IN ?auto_9512 ?auto_9515 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9517 ?auto_9512 ?auto_9515 ?auto_9519 )
      ( MAKE-2CRATE ?auto_9514 ?auto_9512 ?auto_9513 )
      ( MAKE-1CRATE-VERIFY ?auto_9512 ?auto_9513 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9521 - SURFACE
      ?auto_9522 - SURFACE
      ?auto_9523 - SURFACE
    )
    :vars
    (
      ?auto_9526 - HOIST
      ?auto_9527 - PLACE
      ?auto_9525 - PLACE
      ?auto_9528 - HOIST
      ?auto_9529 - SURFACE
      ?auto_9524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9526 ?auto_9527 ) ( IS-CRATE ?auto_9523 ) ( not ( = ?auto_9522 ?auto_9523 ) ) ( not ( = ?auto_9521 ?auto_9522 ) ) ( not ( = ?auto_9521 ?auto_9523 ) ) ( not ( = ?auto_9525 ?auto_9527 ) ) ( HOIST-AT ?auto_9528 ?auto_9525 ) ( not ( = ?auto_9526 ?auto_9528 ) ) ( AVAILABLE ?auto_9528 ) ( SURFACE-AT ?auto_9523 ?auto_9525 ) ( ON ?auto_9523 ?auto_9529 ) ( CLEAR ?auto_9523 ) ( not ( = ?auto_9522 ?auto_9529 ) ) ( not ( = ?auto_9523 ?auto_9529 ) ) ( not ( = ?auto_9521 ?auto_9529 ) ) ( TRUCK-AT ?auto_9524 ?auto_9527 ) ( SURFACE-AT ?auto_9521 ?auto_9527 ) ( CLEAR ?auto_9521 ) ( IS-CRATE ?auto_9522 ) ( AVAILABLE ?auto_9526 ) ( IN ?auto_9522 ?auto_9524 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9522 ?auto_9523 )
      ( MAKE-2CRATE-VERIFY ?auto_9521 ?auto_9522 ?auto_9523 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9566 - SURFACE
      ?auto_9567 - SURFACE
    )
    :vars
    (
      ?auto_9568 - HOIST
      ?auto_9569 - PLACE
      ?auto_9572 - SURFACE
      ?auto_9574 - PLACE
      ?auto_9571 - HOIST
      ?auto_9570 - SURFACE
      ?auto_9573 - TRUCK
      ?auto_9575 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9568 ?auto_9569 ) ( SURFACE-AT ?auto_9566 ?auto_9569 ) ( CLEAR ?auto_9566 ) ( IS-CRATE ?auto_9567 ) ( not ( = ?auto_9566 ?auto_9567 ) ) ( AVAILABLE ?auto_9568 ) ( ON ?auto_9566 ?auto_9572 ) ( not ( = ?auto_9572 ?auto_9566 ) ) ( not ( = ?auto_9572 ?auto_9567 ) ) ( not ( = ?auto_9574 ?auto_9569 ) ) ( HOIST-AT ?auto_9571 ?auto_9574 ) ( not ( = ?auto_9568 ?auto_9571 ) ) ( AVAILABLE ?auto_9571 ) ( SURFACE-AT ?auto_9567 ?auto_9574 ) ( ON ?auto_9567 ?auto_9570 ) ( CLEAR ?auto_9567 ) ( not ( = ?auto_9566 ?auto_9570 ) ) ( not ( = ?auto_9567 ?auto_9570 ) ) ( not ( = ?auto_9572 ?auto_9570 ) ) ( TRUCK-AT ?auto_9573 ?auto_9575 ) ( not ( = ?auto_9575 ?auto_9569 ) ) ( not ( = ?auto_9574 ?auto_9575 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9573 ?auto_9575 ?auto_9569 )
      ( MAKE-1CRATE ?auto_9566 ?auto_9567 )
      ( MAKE-1CRATE-VERIFY ?auto_9566 ?auto_9567 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9605 - SURFACE
      ?auto_9606 - SURFACE
      ?auto_9607 - SURFACE
      ?auto_9608 - SURFACE
    )
    :vars
    (
      ?auto_9609 - HOIST
      ?auto_9610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9609 ?auto_9610 ) ( SURFACE-AT ?auto_9607 ?auto_9610 ) ( CLEAR ?auto_9607 ) ( LIFTING ?auto_9609 ?auto_9608 ) ( IS-CRATE ?auto_9608 ) ( not ( = ?auto_9607 ?auto_9608 ) ) ( ON ?auto_9606 ?auto_9605 ) ( ON ?auto_9607 ?auto_9606 ) ( not ( = ?auto_9605 ?auto_9606 ) ) ( not ( = ?auto_9605 ?auto_9607 ) ) ( not ( = ?auto_9605 ?auto_9608 ) ) ( not ( = ?auto_9606 ?auto_9607 ) ) ( not ( = ?auto_9606 ?auto_9608 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9607 ?auto_9608 )
      ( MAKE-3CRATE-VERIFY ?auto_9605 ?auto_9606 ?auto_9607 ?auto_9608 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9622 - SURFACE
      ?auto_9623 - SURFACE
      ?auto_9624 - SURFACE
      ?auto_9625 - SURFACE
    )
    :vars
    (
      ?auto_9627 - HOIST
      ?auto_9626 - PLACE
      ?auto_9628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9627 ?auto_9626 ) ( SURFACE-AT ?auto_9624 ?auto_9626 ) ( CLEAR ?auto_9624 ) ( IS-CRATE ?auto_9625 ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( TRUCK-AT ?auto_9628 ?auto_9626 ) ( AVAILABLE ?auto_9627 ) ( IN ?auto_9625 ?auto_9628 ) ( ON ?auto_9624 ?auto_9623 ) ( not ( = ?auto_9623 ?auto_9624 ) ) ( not ( = ?auto_9623 ?auto_9625 ) ) ( ON ?auto_9623 ?auto_9622 ) ( not ( = ?auto_9622 ?auto_9623 ) ) ( not ( = ?auto_9622 ?auto_9624 ) ) ( not ( = ?auto_9622 ?auto_9625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9623 ?auto_9624 ?auto_9625 )
      ( MAKE-3CRATE-VERIFY ?auto_9622 ?auto_9623 ?auto_9624 ?auto_9625 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9643 - SURFACE
      ?auto_9644 - SURFACE
      ?auto_9645 - SURFACE
      ?auto_9646 - SURFACE
    )
    :vars
    (
      ?auto_9650 - HOIST
      ?auto_9648 - PLACE
      ?auto_9649 - TRUCK
      ?auto_9647 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9650 ?auto_9648 ) ( SURFACE-AT ?auto_9645 ?auto_9648 ) ( CLEAR ?auto_9645 ) ( IS-CRATE ?auto_9646 ) ( not ( = ?auto_9645 ?auto_9646 ) ) ( AVAILABLE ?auto_9650 ) ( IN ?auto_9646 ?auto_9649 ) ( ON ?auto_9645 ?auto_9644 ) ( not ( = ?auto_9644 ?auto_9645 ) ) ( not ( = ?auto_9644 ?auto_9646 ) ) ( TRUCK-AT ?auto_9649 ?auto_9647 ) ( not ( = ?auto_9647 ?auto_9648 ) ) ( ON ?auto_9644 ?auto_9643 ) ( not ( = ?auto_9643 ?auto_9644 ) ) ( not ( = ?auto_9643 ?auto_9645 ) ) ( not ( = ?auto_9643 ?auto_9646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9644 ?auto_9645 ?auto_9646 )
      ( MAKE-3CRATE-VERIFY ?auto_9643 ?auto_9644 ?auto_9645 ?auto_9646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9667 - SURFACE
      ?auto_9668 - SURFACE
      ?auto_9669 - SURFACE
      ?auto_9670 - SURFACE
    )
    :vars
    (
      ?auto_9673 - HOIST
      ?auto_9675 - PLACE
      ?auto_9671 - TRUCK
      ?auto_9674 - PLACE
      ?auto_9672 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9673 ?auto_9675 ) ( SURFACE-AT ?auto_9669 ?auto_9675 ) ( CLEAR ?auto_9669 ) ( IS-CRATE ?auto_9670 ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( AVAILABLE ?auto_9673 ) ( ON ?auto_9669 ?auto_9668 ) ( not ( = ?auto_9668 ?auto_9669 ) ) ( not ( = ?auto_9668 ?auto_9670 ) ) ( TRUCK-AT ?auto_9671 ?auto_9674 ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( HOIST-AT ?auto_9672 ?auto_9674 ) ( LIFTING ?auto_9672 ?auto_9670 ) ( not ( = ?auto_9673 ?auto_9672 ) ) ( ON ?auto_9668 ?auto_9667 ) ( not ( = ?auto_9667 ?auto_9668 ) ) ( not ( = ?auto_9667 ?auto_9669 ) ) ( not ( = ?auto_9667 ?auto_9670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9668 ?auto_9669 ?auto_9670 )
      ( MAKE-3CRATE-VERIFY ?auto_9667 ?auto_9668 ?auto_9669 ?auto_9670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9694 - SURFACE
      ?auto_9695 - SURFACE
      ?auto_9696 - SURFACE
      ?auto_9697 - SURFACE
    )
    :vars
    (
      ?auto_9703 - HOIST
      ?auto_9698 - PLACE
      ?auto_9701 - TRUCK
      ?auto_9699 - PLACE
      ?auto_9700 - HOIST
      ?auto_9702 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9703 ?auto_9698 ) ( SURFACE-AT ?auto_9696 ?auto_9698 ) ( CLEAR ?auto_9696 ) ( IS-CRATE ?auto_9697 ) ( not ( = ?auto_9696 ?auto_9697 ) ) ( AVAILABLE ?auto_9703 ) ( ON ?auto_9696 ?auto_9695 ) ( not ( = ?auto_9695 ?auto_9696 ) ) ( not ( = ?auto_9695 ?auto_9697 ) ) ( TRUCK-AT ?auto_9701 ?auto_9699 ) ( not ( = ?auto_9699 ?auto_9698 ) ) ( HOIST-AT ?auto_9700 ?auto_9699 ) ( not ( = ?auto_9703 ?auto_9700 ) ) ( AVAILABLE ?auto_9700 ) ( SURFACE-AT ?auto_9697 ?auto_9699 ) ( ON ?auto_9697 ?auto_9702 ) ( CLEAR ?auto_9697 ) ( not ( = ?auto_9696 ?auto_9702 ) ) ( not ( = ?auto_9697 ?auto_9702 ) ) ( not ( = ?auto_9695 ?auto_9702 ) ) ( ON ?auto_9695 ?auto_9694 ) ( not ( = ?auto_9694 ?auto_9695 ) ) ( not ( = ?auto_9694 ?auto_9696 ) ) ( not ( = ?auto_9694 ?auto_9697 ) ) ( not ( = ?auto_9694 ?auto_9702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9695 ?auto_9696 ?auto_9697 )
      ( MAKE-3CRATE-VERIFY ?auto_9694 ?auto_9695 ?auto_9696 ?auto_9697 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9722 - SURFACE
      ?auto_9723 - SURFACE
      ?auto_9724 - SURFACE
      ?auto_9725 - SURFACE
    )
    :vars
    (
      ?auto_9731 - HOIST
      ?auto_9728 - PLACE
      ?auto_9730 - PLACE
      ?auto_9729 - HOIST
      ?auto_9727 - SURFACE
      ?auto_9726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9731 ?auto_9728 ) ( SURFACE-AT ?auto_9724 ?auto_9728 ) ( CLEAR ?auto_9724 ) ( IS-CRATE ?auto_9725 ) ( not ( = ?auto_9724 ?auto_9725 ) ) ( AVAILABLE ?auto_9731 ) ( ON ?auto_9724 ?auto_9723 ) ( not ( = ?auto_9723 ?auto_9724 ) ) ( not ( = ?auto_9723 ?auto_9725 ) ) ( not ( = ?auto_9730 ?auto_9728 ) ) ( HOIST-AT ?auto_9729 ?auto_9730 ) ( not ( = ?auto_9731 ?auto_9729 ) ) ( AVAILABLE ?auto_9729 ) ( SURFACE-AT ?auto_9725 ?auto_9730 ) ( ON ?auto_9725 ?auto_9727 ) ( CLEAR ?auto_9725 ) ( not ( = ?auto_9724 ?auto_9727 ) ) ( not ( = ?auto_9725 ?auto_9727 ) ) ( not ( = ?auto_9723 ?auto_9727 ) ) ( TRUCK-AT ?auto_9726 ?auto_9728 ) ( ON ?auto_9723 ?auto_9722 ) ( not ( = ?auto_9722 ?auto_9723 ) ) ( not ( = ?auto_9722 ?auto_9724 ) ) ( not ( = ?auto_9722 ?auto_9725 ) ) ( not ( = ?auto_9722 ?auto_9727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9723 ?auto_9724 ?auto_9725 )
      ( MAKE-3CRATE-VERIFY ?auto_9722 ?auto_9723 ?auto_9724 ?auto_9725 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9750 - SURFACE
      ?auto_9751 - SURFACE
      ?auto_9752 - SURFACE
      ?auto_9753 - SURFACE
    )
    :vars
    (
      ?auto_9756 - HOIST
      ?auto_9759 - PLACE
      ?auto_9758 - PLACE
      ?auto_9754 - HOIST
      ?auto_9755 - SURFACE
      ?auto_9757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9756 ?auto_9759 ) ( IS-CRATE ?auto_9753 ) ( not ( = ?auto_9752 ?auto_9753 ) ) ( not ( = ?auto_9751 ?auto_9752 ) ) ( not ( = ?auto_9751 ?auto_9753 ) ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( HOIST-AT ?auto_9754 ?auto_9758 ) ( not ( = ?auto_9756 ?auto_9754 ) ) ( AVAILABLE ?auto_9754 ) ( SURFACE-AT ?auto_9753 ?auto_9758 ) ( ON ?auto_9753 ?auto_9755 ) ( CLEAR ?auto_9753 ) ( not ( = ?auto_9752 ?auto_9755 ) ) ( not ( = ?auto_9753 ?auto_9755 ) ) ( not ( = ?auto_9751 ?auto_9755 ) ) ( TRUCK-AT ?auto_9757 ?auto_9759 ) ( SURFACE-AT ?auto_9751 ?auto_9759 ) ( CLEAR ?auto_9751 ) ( LIFTING ?auto_9756 ?auto_9752 ) ( IS-CRATE ?auto_9752 ) ( ON ?auto_9751 ?auto_9750 ) ( not ( = ?auto_9750 ?auto_9751 ) ) ( not ( = ?auto_9750 ?auto_9752 ) ) ( not ( = ?auto_9750 ?auto_9753 ) ) ( not ( = ?auto_9750 ?auto_9755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9751 ?auto_9752 ?auto_9753 )
      ( MAKE-3CRATE-VERIFY ?auto_9750 ?auto_9751 ?auto_9752 ?auto_9753 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9778 - SURFACE
      ?auto_9779 - SURFACE
      ?auto_9780 - SURFACE
      ?auto_9781 - SURFACE
    )
    :vars
    (
      ?auto_9782 - HOIST
      ?auto_9783 - PLACE
      ?auto_9786 - PLACE
      ?auto_9785 - HOIST
      ?auto_9784 - SURFACE
      ?auto_9787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9782 ?auto_9783 ) ( IS-CRATE ?auto_9781 ) ( not ( = ?auto_9780 ?auto_9781 ) ) ( not ( = ?auto_9779 ?auto_9780 ) ) ( not ( = ?auto_9779 ?auto_9781 ) ) ( not ( = ?auto_9786 ?auto_9783 ) ) ( HOIST-AT ?auto_9785 ?auto_9786 ) ( not ( = ?auto_9782 ?auto_9785 ) ) ( AVAILABLE ?auto_9785 ) ( SURFACE-AT ?auto_9781 ?auto_9786 ) ( ON ?auto_9781 ?auto_9784 ) ( CLEAR ?auto_9781 ) ( not ( = ?auto_9780 ?auto_9784 ) ) ( not ( = ?auto_9781 ?auto_9784 ) ) ( not ( = ?auto_9779 ?auto_9784 ) ) ( TRUCK-AT ?auto_9787 ?auto_9783 ) ( SURFACE-AT ?auto_9779 ?auto_9783 ) ( CLEAR ?auto_9779 ) ( IS-CRATE ?auto_9780 ) ( AVAILABLE ?auto_9782 ) ( IN ?auto_9780 ?auto_9787 ) ( ON ?auto_9779 ?auto_9778 ) ( not ( = ?auto_9778 ?auto_9779 ) ) ( not ( = ?auto_9778 ?auto_9780 ) ) ( not ( = ?auto_9778 ?auto_9781 ) ) ( not ( = ?auto_9778 ?auto_9784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9779 ?auto_9780 ?auto_9781 )
      ( MAKE-3CRATE-VERIFY ?auto_9778 ?auto_9779 ?auto_9780 ?auto_9781 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10069 - SURFACE
      ?auto_10070 - SURFACE
      ?auto_10071 - SURFACE
      ?auto_10072 - SURFACE
      ?auto_10073 - SURFACE
    )
    :vars
    (
      ?auto_10075 - HOIST
      ?auto_10074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10075 ?auto_10074 ) ( SURFACE-AT ?auto_10072 ?auto_10074 ) ( CLEAR ?auto_10072 ) ( LIFTING ?auto_10075 ?auto_10073 ) ( IS-CRATE ?auto_10073 ) ( not ( = ?auto_10072 ?auto_10073 ) ) ( ON ?auto_10070 ?auto_10069 ) ( ON ?auto_10071 ?auto_10070 ) ( ON ?auto_10072 ?auto_10071 ) ( not ( = ?auto_10069 ?auto_10070 ) ) ( not ( = ?auto_10069 ?auto_10071 ) ) ( not ( = ?auto_10069 ?auto_10072 ) ) ( not ( = ?auto_10069 ?auto_10073 ) ) ( not ( = ?auto_10070 ?auto_10071 ) ) ( not ( = ?auto_10070 ?auto_10072 ) ) ( not ( = ?auto_10070 ?auto_10073 ) ) ( not ( = ?auto_10071 ?auto_10072 ) ) ( not ( = ?auto_10071 ?auto_10073 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10072 ?auto_10073 )
      ( MAKE-4CRATE-VERIFY ?auto_10069 ?auto_10070 ?auto_10071 ?auto_10072 ?auto_10073 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10094 - SURFACE
      ?auto_10095 - SURFACE
      ?auto_10096 - SURFACE
      ?auto_10097 - SURFACE
      ?auto_10098 - SURFACE
    )
    :vars
    (
      ?auto_10099 - HOIST
      ?auto_10100 - PLACE
      ?auto_10101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10099 ?auto_10100 ) ( SURFACE-AT ?auto_10097 ?auto_10100 ) ( CLEAR ?auto_10097 ) ( IS-CRATE ?auto_10098 ) ( not ( = ?auto_10097 ?auto_10098 ) ) ( TRUCK-AT ?auto_10101 ?auto_10100 ) ( AVAILABLE ?auto_10099 ) ( IN ?auto_10098 ?auto_10101 ) ( ON ?auto_10097 ?auto_10096 ) ( not ( = ?auto_10096 ?auto_10097 ) ) ( not ( = ?auto_10096 ?auto_10098 ) ) ( ON ?auto_10095 ?auto_10094 ) ( ON ?auto_10096 ?auto_10095 ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10096 ) ) ( not ( = ?auto_10094 ?auto_10097 ) ) ( not ( = ?auto_10094 ?auto_10098 ) ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( not ( = ?auto_10095 ?auto_10097 ) ) ( not ( = ?auto_10095 ?auto_10098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10096 ?auto_10097 ?auto_10098 )
      ( MAKE-4CRATE-VERIFY ?auto_10094 ?auto_10095 ?auto_10096 ?auto_10097 ?auto_10098 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10124 - SURFACE
      ?auto_10125 - SURFACE
      ?auto_10126 - SURFACE
      ?auto_10127 - SURFACE
      ?auto_10128 - SURFACE
    )
    :vars
    (
      ?auto_10130 - HOIST
      ?auto_10132 - PLACE
      ?auto_10131 - TRUCK
      ?auto_10129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10130 ?auto_10132 ) ( SURFACE-AT ?auto_10127 ?auto_10132 ) ( CLEAR ?auto_10127 ) ( IS-CRATE ?auto_10128 ) ( not ( = ?auto_10127 ?auto_10128 ) ) ( AVAILABLE ?auto_10130 ) ( IN ?auto_10128 ?auto_10131 ) ( ON ?auto_10127 ?auto_10126 ) ( not ( = ?auto_10126 ?auto_10127 ) ) ( not ( = ?auto_10126 ?auto_10128 ) ) ( TRUCK-AT ?auto_10131 ?auto_10129 ) ( not ( = ?auto_10129 ?auto_10132 ) ) ( ON ?auto_10125 ?auto_10124 ) ( ON ?auto_10126 ?auto_10125 ) ( not ( = ?auto_10124 ?auto_10125 ) ) ( not ( = ?auto_10124 ?auto_10126 ) ) ( not ( = ?auto_10124 ?auto_10127 ) ) ( not ( = ?auto_10124 ?auto_10128 ) ) ( not ( = ?auto_10125 ?auto_10126 ) ) ( not ( = ?auto_10125 ?auto_10127 ) ) ( not ( = ?auto_10125 ?auto_10128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10126 ?auto_10127 ?auto_10128 )
      ( MAKE-4CRATE-VERIFY ?auto_10124 ?auto_10125 ?auto_10126 ?auto_10127 ?auto_10128 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10158 - SURFACE
      ?auto_10159 - SURFACE
      ?auto_10160 - SURFACE
      ?auto_10161 - SURFACE
      ?auto_10162 - SURFACE
    )
    :vars
    (
      ?auto_10167 - HOIST
      ?auto_10163 - PLACE
      ?auto_10164 - TRUCK
      ?auto_10165 - PLACE
      ?auto_10166 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10167 ?auto_10163 ) ( SURFACE-AT ?auto_10161 ?auto_10163 ) ( CLEAR ?auto_10161 ) ( IS-CRATE ?auto_10162 ) ( not ( = ?auto_10161 ?auto_10162 ) ) ( AVAILABLE ?auto_10167 ) ( ON ?auto_10161 ?auto_10160 ) ( not ( = ?auto_10160 ?auto_10161 ) ) ( not ( = ?auto_10160 ?auto_10162 ) ) ( TRUCK-AT ?auto_10164 ?auto_10165 ) ( not ( = ?auto_10165 ?auto_10163 ) ) ( HOIST-AT ?auto_10166 ?auto_10165 ) ( LIFTING ?auto_10166 ?auto_10162 ) ( not ( = ?auto_10167 ?auto_10166 ) ) ( ON ?auto_10159 ?auto_10158 ) ( ON ?auto_10160 ?auto_10159 ) ( not ( = ?auto_10158 ?auto_10159 ) ) ( not ( = ?auto_10158 ?auto_10160 ) ) ( not ( = ?auto_10158 ?auto_10161 ) ) ( not ( = ?auto_10158 ?auto_10162 ) ) ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10161 ) ) ( not ( = ?auto_10159 ?auto_10162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10160 ?auto_10161 ?auto_10162 )
      ( MAKE-4CRATE-VERIFY ?auto_10158 ?auto_10159 ?auto_10160 ?auto_10161 ?auto_10162 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10196 - SURFACE
      ?auto_10197 - SURFACE
      ?auto_10198 - SURFACE
      ?auto_10199 - SURFACE
      ?auto_10200 - SURFACE
    )
    :vars
    (
      ?auto_10204 - HOIST
      ?auto_10203 - PLACE
      ?auto_10202 - TRUCK
      ?auto_10206 - PLACE
      ?auto_10205 - HOIST
      ?auto_10201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10204 ?auto_10203 ) ( SURFACE-AT ?auto_10199 ?auto_10203 ) ( CLEAR ?auto_10199 ) ( IS-CRATE ?auto_10200 ) ( not ( = ?auto_10199 ?auto_10200 ) ) ( AVAILABLE ?auto_10204 ) ( ON ?auto_10199 ?auto_10198 ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10198 ?auto_10200 ) ) ( TRUCK-AT ?auto_10202 ?auto_10206 ) ( not ( = ?auto_10206 ?auto_10203 ) ) ( HOIST-AT ?auto_10205 ?auto_10206 ) ( not ( = ?auto_10204 ?auto_10205 ) ) ( AVAILABLE ?auto_10205 ) ( SURFACE-AT ?auto_10200 ?auto_10206 ) ( ON ?auto_10200 ?auto_10201 ) ( CLEAR ?auto_10200 ) ( not ( = ?auto_10199 ?auto_10201 ) ) ( not ( = ?auto_10200 ?auto_10201 ) ) ( not ( = ?auto_10198 ?auto_10201 ) ) ( ON ?auto_10197 ?auto_10196 ) ( ON ?auto_10198 ?auto_10197 ) ( not ( = ?auto_10196 ?auto_10197 ) ) ( not ( = ?auto_10196 ?auto_10198 ) ) ( not ( = ?auto_10196 ?auto_10199 ) ) ( not ( = ?auto_10196 ?auto_10200 ) ) ( not ( = ?auto_10196 ?auto_10201 ) ) ( not ( = ?auto_10197 ?auto_10198 ) ) ( not ( = ?auto_10197 ?auto_10199 ) ) ( not ( = ?auto_10197 ?auto_10200 ) ) ( not ( = ?auto_10197 ?auto_10201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10198 ?auto_10199 ?auto_10200 )
      ( MAKE-4CRATE-VERIFY ?auto_10196 ?auto_10197 ?auto_10198 ?auto_10199 ?auto_10200 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10235 - SURFACE
      ?auto_10236 - SURFACE
      ?auto_10237 - SURFACE
      ?auto_10238 - SURFACE
      ?auto_10239 - SURFACE
    )
    :vars
    (
      ?auto_10240 - HOIST
      ?auto_10243 - PLACE
      ?auto_10241 - PLACE
      ?auto_10242 - HOIST
      ?auto_10244 - SURFACE
      ?auto_10245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10240 ?auto_10243 ) ( SURFACE-AT ?auto_10238 ?auto_10243 ) ( CLEAR ?auto_10238 ) ( IS-CRATE ?auto_10239 ) ( not ( = ?auto_10238 ?auto_10239 ) ) ( AVAILABLE ?auto_10240 ) ( ON ?auto_10238 ?auto_10237 ) ( not ( = ?auto_10237 ?auto_10238 ) ) ( not ( = ?auto_10237 ?auto_10239 ) ) ( not ( = ?auto_10241 ?auto_10243 ) ) ( HOIST-AT ?auto_10242 ?auto_10241 ) ( not ( = ?auto_10240 ?auto_10242 ) ) ( AVAILABLE ?auto_10242 ) ( SURFACE-AT ?auto_10239 ?auto_10241 ) ( ON ?auto_10239 ?auto_10244 ) ( CLEAR ?auto_10239 ) ( not ( = ?auto_10238 ?auto_10244 ) ) ( not ( = ?auto_10239 ?auto_10244 ) ) ( not ( = ?auto_10237 ?auto_10244 ) ) ( TRUCK-AT ?auto_10245 ?auto_10243 ) ( ON ?auto_10236 ?auto_10235 ) ( ON ?auto_10237 ?auto_10236 ) ( not ( = ?auto_10235 ?auto_10236 ) ) ( not ( = ?auto_10235 ?auto_10237 ) ) ( not ( = ?auto_10235 ?auto_10238 ) ) ( not ( = ?auto_10235 ?auto_10239 ) ) ( not ( = ?auto_10235 ?auto_10244 ) ) ( not ( = ?auto_10236 ?auto_10237 ) ) ( not ( = ?auto_10236 ?auto_10238 ) ) ( not ( = ?auto_10236 ?auto_10239 ) ) ( not ( = ?auto_10236 ?auto_10244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10237 ?auto_10238 ?auto_10239 )
      ( MAKE-4CRATE-VERIFY ?auto_10235 ?auto_10236 ?auto_10237 ?auto_10238 ?auto_10239 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10274 - SURFACE
      ?auto_10275 - SURFACE
      ?auto_10276 - SURFACE
      ?auto_10277 - SURFACE
      ?auto_10278 - SURFACE
    )
    :vars
    (
      ?auto_10281 - HOIST
      ?auto_10283 - PLACE
      ?auto_10282 - PLACE
      ?auto_10280 - HOIST
      ?auto_10279 - SURFACE
      ?auto_10284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10281 ?auto_10283 ) ( IS-CRATE ?auto_10278 ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10278 ) ) ( not ( = ?auto_10282 ?auto_10283 ) ) ( HOIST-AT ?auto_10280 ?auto_10282 ) ( not ( = ?auto_10281 ?auto_10280 ) ) ( AVAILABLE ?auto_10280 ) ( SURFACE-AT ?auto_10278 ?auto_10282 ) ( ON ?auto_10278 ?auto_10279 ) ( CLEAR ?auto_10278 ) ( not ( = ?auto_10277 ?auto_10279 ) ) ( not ( = ?auto_10278 ?auto_10279 ) ) ( not ( = ?auto_10276 ?auto_10279 ) ) ( TRUCK-AT ?auto_10284 ?auto_10283 ) ( SURFACE-AT ?auto_10276 ?auto_10283 ) ( CLEAR ?auto_10276 ) ( LIFTING ?auto_10281 ?auto_10277 ) ( IS-CRATE ?auto_10277 ) ( ON ?auto_10275 ?auto_10274 ) ( ON ?auto_10276 ?auto_10275 ) ( not ( = ?auto_10274 ?auto_10275 ) ) ( not ( = ?auto_10274 ?auto_10276 ) ) ( not ( = ?auto_10274 ?auto_10277 ) ) ( not ( = ?auto_10274 ?auto_10278 ) ) ( not ( = ?auto_10274 ?auto_10279 ) ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( not ( = ?auto_10275 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10278 ) ) ( not ( = ?auto_10275 ?auto_10279 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10276 ?auto_10277 ?auto_10278 )
      ( MAKE-4CRATE-VERIFY ?auto_10274 ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10278 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10313 - SURFACE
      ?auto_10314 - SURFACE
      ?auto_10315 - SURFACE
      ?auto_10316 - SURFACE
      ?auto_10317 - SURFACE
    )
    :vars
    (
      ?auto_10323 - HOIST
      ?auto_10320 - PLACE
      ?auto_10319 - PLACE
      ?auto_10321 - HOIST
      ?auto_10318 - SURFACE
      ?auto_10322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10323 ?auto_10320 ) ( IS-CRATE ?auto_10317 ) ( not ( = ?auto_10316 ?auto_10317 ) ) ( not ( = ?auto_10315 ?auto_10316 ) ) ( not ( = ?auto_10315 ?auto_10317 ) ) ( not ( = ?auto_10319 ?auto_10320 ) ) ( HOIST-AT ?auto_10321 ?auto_10319 ) ( not ( = ?auto_10323 ?auto_10321 ) ) ( AVAILABLE ?auto_10321 ) ( SURFACE-AT ?auto_10317 ?auto_10319 ) ( ON ?auto_10317 ?auto_10318 ) ( CLEAR ?auto_10317 ) ( not ( = ?auto_10316 ?auto_10318 ) ) ( not ( = ?auto_10317 ?auto_10318 ) ) ( not ( = ?auto_10315 ?auto_10318 ) ) ( TRUCK-AT ?auto_10322 ?auto_10320 ) ( SURFACE-AT ?auto_10315 ?auto_10320 ) ( CLEAR ?auto_10315 ) ( IS-CRATE ?auto_10316 ) ( AVAILABLE ?auto_10323 ) ( IN ?auto_10316 ?auto_10322 ) ( ON ?auto_10314 ?auto_10313 ) ( ON ?auto_10315 ?auto_10314 ) ( not ( = ?auto_10313 ?auto_10314 ) ) ( not ( = ?auto_10313 ?auto_10315 ) ) ( not ( = ?auto_10313 ?auto_10316 ) ) ( not ( = ?auto_10313 ?auto_10317 ) ) ( not ( = ?auto_10313 ?auto_10318 ) ) ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10314 ?auto_10316 ) ) ( not ( = ?auto_10314 ?auto_10317 ) ) ( not ( = ?auto_10314 ?auto_10318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10315 ?auto_10316 ?auto_10317 )
      ( MAKE-4CRATE-VERIFY ?auto_10313 ?auto_10314 ?auto_10315 ?auto_10316 ?auto_10317 ) )
  )

)

