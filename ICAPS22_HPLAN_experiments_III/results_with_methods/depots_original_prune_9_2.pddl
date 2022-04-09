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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205353 - SURFACE
      ?auto_205354 - SURFACE
    )
    :vars
    (
      ?auto_205355 - HOIST
      ?auto_205356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205355 ?auto_205356 ) ( SURFACE-AT ?auto_205353 ?auto_205356 ) ( CLEAR ?auto_205353 ) ( LIFTING ?auto_205355 ?auto_205354 ) ( IS-CRATE ?auto_205354 ) ( not ( = ?auto_205353 ?auto_205354 ) ) )
    :subtasks
    ( ( !DROP ?auto_205355 ?auto_205354 ?auto_205353 ?auto_205356 )
      ( MAKE-1CRATE-VERIFY ?auto_205353 ?auto_205354 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205357 - SURFACE
      ?auto_205358 - SURFACE
    )
    :vars
    (
      ?auto_205359 - HOIST
      ?auto_205360 - PLACE
      ?auto_205361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205359 ?auto_205360 ) ( SURFACE-AT ?auto_205357 ?auto_205360 ) ( CLEAR ?auto_205357 ) ( IS-CRATE ?auto_205358 ) ( not ( = ?auto_205357 ?auto_205358 ) ) ( TRUCK-AT ?auto_205361 ?auto_205360 ) ( AVAILABLE ?auto_205359 ) ( IN ?auto_205358 ?auto_205361 ) )
    :subtasks
    ( ( !UNLOAD ?auto_205359 ?auto_205358 ?auto_205361 ?auto_205360 )
      ( MAKE-1CRATE ?auto_205357 ?auto_205358 )
      ( MAKE-1CRATE-VERIFY ?auto_205357 ?auto_205358 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205362 - SURFACE
      ?auto_205363 - SURFACE
    )
    :vars
    (
      ?auto_205366 - HOIST
      ?auto_205365 - PLACE
      ?auto_205364 - TRUCK
      ?auto_205367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205366 ?auto_205365 ) ( SURFACE-AT ?auto_205362 ?auto_205365 ) ( CLEAR ?auto_205362 ) ( IS-CRATE ?auto_205363 ) ( not ( = ?auto_205362 ?auto_205363 ) ) ( AVAILABLE ?auto_205366 ) ( IN ?auto_205363 ?auto_205364 ) ( TRUCK-AT ?auto_205364 ?auto_205367 ) ( not ( = ?auto_205367 ?auto_205365 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205364 ?auto_205367 ?auto_205365 )
      ( MAKE-1CRATE ?auto_205362 ?auto_205363 )
      ( MAKE-1CRATE-VERIFY ?auto_205362 ?auto_205363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205368 - SURFACE
      ?auto_205369 - SURFACE
    )
    :vars
    (
      ?auto_205371 - HOIST
      ?auto_205373 - PLACE
      ?auto_205372 - TRUCK
      ?auto_205370 - PLACE
      ?auto_205374 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205371 ?auto_205373 ) ( SURFACE-AT ?auto_205368 ?auto_205373 ) ( CLEAR ?auto_205368 ) ( IS-CRATE ?auto_205369 ) ( not ( = ?auto_205368 ?auto_205369 ) ) ( AVAILABLE ?auto_205371 ) ( TRUCK-AT ?auto_205372 ?auto_205370 ) ( not ( = ?auto_205370 ?auto_205373 ) ) ( HOIST-AT ?auto_205374 ?auto_205370 ) ( LIFTING ?auto_205374 ?auto_205369 ) ( not ( = ?auto_205371 ?auto_205374 ) ) )
    :subtasks
    ( ( !LOAD ?auto_205374 ?auto_205369 ?auto_205372 ?auto_205370 )
      ( MAKE-1CRATE ?auto_205368 ?auto_205369 )
      ( MAKE-1CRATE-VERIFY ?auto_205368 ?auto_205369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205375 - SURFACE
      ?auto_205376 - SURFACE
    )
    :vars
    (
      ?auto_205380 - HOIST
      ?auto_205378 - PLACE
      ?auto_205377 - TRUCK
      ?auto_205381 - PLACE
      ?auto_205379 - HOIST
      ?auto_205382 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205380 ?auto_205378 ) ( SURFACE-AT ?auto_205375 ?auto_205378 ) ( CLEAR ?auto_205375 ) ( IS-CRATE ?auto_205376 ) ( not ( = ?auto_205375 ?auto_205376 ) ) ( AVAILABLE ?auto_205380 ) ( TRUCK-AT ?auto_205377 ?auto_205381 ) ( not ( = ?auto_205381 ?auto_205378 ) ) ( HOIST-AT ?auto_205379 ?auto_205381 ) ( not ( = ?auto_205380 ?auto_205379 ) ) ( AVAILABLE ?auto_205379 ) ( SURFACE-AT ?auto_205376 ?auto_205381 ) ( ON ?auto_205376 ?auto_205382 ) ( CLEAR ?auto_205376 ) ( not ( = ?auto_205375 ?auto_205382 ) ) ( not ( = ?auto_205376 ?auto_205382 ) ) )
    :subtasks
    ( ( !LIFT ?auto_205379 ?auto_205376 ?auto_205382 ?auto_205381 )
      ( MAKE-1CRATE ?auto_205375 ?auto_205376 )
      ( MAKE-1CRATE-VERIFY ?auto_205375 ?auto_205376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205383 - SURFACE
      ?auto_205384 - SURFACE
    )
    :vars
    (
      ?auto_205388 - HOIST
      ?auto_205385 - PLACE
      ?auto_205387 - PLACE
      ?auto_205389 - HOIST
      ?auto_205386 - SURFACE
      ?auto_205390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205388 ?auto_205385 ) ( SURFACE-AT ?auto_205383 ?auto_205385 ) ( CLEAR ?auto_205383 ) ( IS-CRATE ?auto_205384 ) ( not ( = ?auto_205383 ?auto_205384 ) ) ( AVAILABLE ?auto_205388 ) ( not ( = ?auto_205387 ?auto_205385 ) ) ( HOIST-AT ?auto_205389 ?auto_205387 ) ( not ( = ?auto_205388 ?auto_205389 ) ) ( AVAILABLE ?auto_205389 ) ( SURFACE-AT ?auto_205384 ?auto_205387 ) ( ON ?auto_205384 ?auto_205386 ) ( CLEAR ?auto_205384 ) ( not ( = ?auto_205383 ?auto_205386 ) ) ( not ( = ?auto_205384 ?auto_205386 ) ) ( TRUCK-AT ?auto_205390 ?auto_205385 ) )
    :subtasks
    ( ( !DRIVE ?auto_205390 ?auto_205385 ?auto_205387 )
      ( MAKE-1CRATE ?auto_205383 ?auto_205384 )
      ( MAKE-1CRATE-VERIFY ?auto_205383 ?auto_205384 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205400 - SURFACE
      ?auto_205401 - SURFACE
      ?auto_205402 - SURFACE
    )
    :vars
    (
      ?auto_205403 - HOIST
      ?auto_205404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205403 ?auto_205404 ) ( SURFACE-AT ?auto_205401 ?auto_205404 ) ( CLEAR ?auto_205401 ) ( LIFTING ?auto_205403 ?auto_205402 ) ( IS-CRATE ?auto_205402 ) ( not ( = ?auto_205401 ?auto_205402 ) ) ( ON ?auto_205401 ?auto_205400 ) ( not ( = ?auto_205400 ?auto_205401 ) ) ( not ( = ?auto_205400 ?auto_205402 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205401 ?auto_205402 )
      ( MAKE-2CRATE-VERIFY ?auto_205400 ?auto_205401 ?auto_205402 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205410 - SURFACE
      ?auto_205411 - SURFACE
      ?auto_205412 - SURFACE
    )
    :vars
    (
      ?auto_205415 - HOIST
      ?auto_205413 - PLACE
      ?auto_205414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205415 ?auto_205413 ) ( SURFACE-AT ?auto_205411 ?auto_205413 ) ( CLEAR ?auto_205411 ) ( IS-CRATE ?auto_205412 ) ( not ( = ?auto_205411 ?auto_205412 ) ) ( TRUCK-AT ?auto_205414 ?auto_205413 ) ( AVAILABLE ?auto_205415 ) ( IN ?auto_205412 ?auto_205414 ) ( ON ?auto_205411 ?auto_205410 ) ( not ( = ?auto_205410 ?auto_205411 ) ) ( not ( = ?auto_205410 ?auto_205412 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205411 ?auto_205412 )
      ( MAKE-2CRATE-VERIFY ?auto_205410 ?auto_205411 ?auto_205412 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205416 - SURFACE
      ?auto_205417 - SURFACE
    )
    :vars
    (
      ?auto_205418 - HOIST
      ?auto_205419 - PLACE
      ?auto_205421 - TRUCK
      ?auto_205420 - SURFACE
      ?auto_205422 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205418 ?auto_205419 ) ( SURFACE-AT ?auto_205416 ?auto_205419 ) ( CLEAR ?auto_205416 ) ( IS-CRATE ?auto_205417 ) ( not ( = ?auto_205416 ?auto_205417 ) ) ( AVAILABLE ?auto_205418 ) ( IN ?auto_205417 ?auto_205421 ) ( ON ?auto_205416 ?auto_205420 ) ( not ( = ?auto_205420 ?auto_205416 ) ) ( not ( = ?auto_205420 ?auto_205417 ) ) ( TRUCK-AT ?auto_205421 ?auto_205422 ) ( not ( = ?auto_205422 ?auto_205419 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205421 ?auto_205422 ?auto_205419 )
      ( MAKE-2CRATE ?auto_205420 ?auto_205416 ?auto_205417 )
      ( MAKE-1CRATE-VERIFY ?auto_205416 ?auto_205417 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205423 - SURFACE
      ?auto_205424 - SURFACE
      ?auto_205425 - SURFACE
    )
    :vars
    (
      ?auto_205427 - HOIST
      ?auto_205429 - PLACE
      ?auto_205426 - TRUCK
      ?auto_205428 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205427 ?auto_205429 ) ( SURFACE-AT ?auto_205424 ?auto_205429 ) ( CLEAR ?auto_205424 ) ( IS-CRATE ?auto_205425 ) ( not ( = ?auto_205424 ?auto_205425 ) ) ( AVAILABLE ?auto_205427 ) ( IN ?auto_205425 ?auto_205426 ) ( ON ?auto_205424 ?auto_205423 ) ( not ( = ?auto_205423 ?auto_205424 ) ) ( not ( = ?auto_205423 ?auto_205425 ) ) ( TRUCK-AT ?auto_205426 ?auto_205428 ) ( not ( = ?auto_205428 ?auto_205429 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205424 ?auto_205425 )
      ( MAKE-2CRATE-VERIFY ?auto_205423 ?auto_205424 ?auto_205425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205430 - SURFACE
      ?auto_205431 - SURFACE
    )
    :vars
    (
      ?auto_205434 - HOIST
      ?auto_205432 - PLACE
      ?auto_205435 - SURFACE
      ?auto_205433 - TRUCK
      ?auto_205436 - PLACE
      ?auto_205437 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205434 ?auto_205432 ) ( SURFACE-AT ?auto_205430 ?auto_205432 ) ( CLEAR ?auto_205430 ) ( IS-CRATE ?auto_205431 ) ( not ( = ?auto_205430 ?auto_205431 ) ) ( AVAILABLE ?auto_205434 ) ( ON ?auto_205430 ?auto_205435 ) ( not ( = ?auto_205435 ?auto_205430 ) ) ( not ( = ?auto_205435 ?auto_205431 ) ) ( TRUCK-AT ?auto_205433 ?auto_205436 ) ( not ( = ?auto_205436 ?auto_205432 ) ) ( HOIST-AT ?auto_205437 ?auto_205436 ) ( LIFTING ?auto_205437 ?auto_205431 ) ( not ( = ?auto_205434 ?auto_205437 ) ) )
    :subtasks
    ( ( !LOAD ?auto_205437 ?auto_205431 ?auto_205433 ?auto_205436 )
      ( MAKE-2CRATE ?auto_205435 ?auto_205430 ?auto_205431 )
      ( MAKE-1CRATE-VERIFY ?auto_205430 ?auto_205431 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205438 - SURFACE
      ?auto_205439 - SURFACE
      ?auto_205440 - SURFACE
    )
    :vars
    (
      ?auto_205444 - HOIST
      ?auto_205442 - PLACE
      ?auto_205443 - TRUCK
      ?auto_205445 - PLACE
      ?auto_205441 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205444 ?auto_205442 ) ( SURFACE-AT ?auto_205439 ?auto_205442 ) ( CLEAR ?auto_205439 ) ( IS-CRATE ?auto_205440 ) ( not ( = ?auto_205439 ?auto_205440 ) ) ( AVAILABLE ?auto_205444 ) ( ON ?auto_205439 ?auto_205438 ) ( not ( = ?auto_205438 ?auto_205439 ) ) ( not ( = ?auto_205438 ?auto_205440 ) ) ( TRUCK-AT ?auto_205443 ?auto_205445 ) ( not ( = ?auto_205445 ?auto_205442 ) ) ( HOIST-AT ?auto_205441 ?auto_205445 ) ( LIFTING ?auto_205441 ?auto_205440 ) ( not ( = ?auto_205444 ?auto_205441 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205439 ?auto_205440 )
      ( MAKE-2CRATE-VERIFY ?auto_205438 ?auto_205439 ?auto_205440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205446 - SURFACE
      ?auto_205447 - SURFACE
    )
    :vars
    (
      ?auto_205450 - HOIST
      ?auto_205448 - PLACE
      ?auto_205453 - SURFACE
      ?auto_205451 - TRUCK
      ?auto_205449 - PLACE
      ?auto_205452 - HOIST
      ?auto_205454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205450 ?auto_205448 ) ( SURFACE-AT ?auto_205446 ?auto_205448 ) ( CLEAR ?auto_205446 ) ( IS-CRATE ?auto_205447 ) ( not ( = ?auto_205446 ?auto_205447 ) ) ( AVAILABLE ?auto_205450 ) ( ON ?auto_205446 ?auto_205453 ) ( not ( = ?auto_205453 ?auto_205446 ) ) ( not ( = ?auto_205453 ?auto_205447 ) ) ( TRUCK-AT ?auto_205451 ?auto_205449 ) ( not ( = ?auto_205449 ?auto_205448 ) ) ( HOIST-AT ?auto_205452 ?auto_205449 ) ( not ( = ?auto_205450 ?auto_205452 ) ) ( AVAILABLE ?auto_205452 ) ( SURFACE-AT ?auto_205447 ?auto_205449 ) ( ON ?auto_205447 ?auto_205454 ) ( CLEAR ?auto_205447 ) ( not ( = ?auto_205446 ?auto_205454 ) ) ( not ( = ?auto_205447 ?auto_205454 ) ) ( not ( = ?auto_205453 ?auto_205454 ) ) )
    :subtasks
    ( ( !LIFT ?auto_205452 ?auto_205447 ?auto_205454 ?auto_205449 )
      ( MAKE-2CRATE ?auto_205453 ?auto_205446 ?auto_205447 )
      ( MAKE-1CRATE-VERIFY ?auto_205446 ?auto_205447 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205455 - SURFACE
      ?auto_205456 - SURFACE
      ?auto_205457 - SURFACE
    )
    :vars
    (
      ?auto_205461 - HOIST
      ?auto_205463 - PLACE
      ?auto_205462 - TRUCK
      ?auto_205458 - PLACE
      ?auto_205460 - HOIST
      ?auto_205459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205461 ?auto_205463 ) ( SURFACE-AT ?auto_205456 ?auto_205463 ) ( CLEAR ?auto_205456 ) ( IS-CRATE ?auto_205457 ) ( not ( = ?auto_205456 ?auto_205457 ) ) ( AVAILABLE ?auto_205461 ) ( ON ?auto_205456 ?auto_205455 ) ( not ( = ?auto_205455 ?auto_205456 ) ) ( not ( = ?auto_205455 ?auto_205457 ) ) ( TRUCK-AT ?auto_205462 ?auto_205458 ) ( not ( = ?auto_205458 ?auto_205463 ) ) ( HOIST-AT ?auto_205460 ?auto_205458 ) ( not ( = ?auto_205461 ?auto_205460 ) ) ( AVAILABLE ?auto_205460 ) ( SURFACE-AT ?auto_205457 ?auto_205458 ) ( ON ?auto_205457 ?auto_205459 ) ( CLEAR ?auto_205457 ) ( not ( = ?auto_205456 ?auto_205459 ) ) ( not ( = ?auto_205457 ?auto_205459 ) ) ( not ( = ?auto_205455 ?auto_205459 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205456 ?auto_205457 )
      ( MAKE-2CRATE-VERIFY ?auto_205455 ?auto_205456 ?auto_205457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205464 - SURFACE
      ?auto_205465 - SURFACE
    )
    :vars
    (
      ?auto_205471 - HOIST
      ?auto_205469 - PLACE
      ?auto_205468 - SURFACE
      ?auto_205467 - PLACE
      ?auto_205466 - HOIST
      ?auto_205470 - SURFACE
      ?auto_205472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205471 ?auto_205469 ) ( SURFACE-AT ?auto_205464 ?auto_205469 ) ( CLEAR ?auto_205464 ) ( IS-CRATE ?auto_205465 ) ( not ( = ?auto_205464 ?auto_205465 ) ) ( AVAILABLE ?auto_205471 ) ( ON ?auto_205464 ?auto_205468 ) ( not ( = ?auto_205468 ?auto_205464 ) ) ( not ( = ?auto_205468 ?auto_205465 ) ) ( not ( = ?auto_205467 ?auto_205469 ) ) ( HOIST-AT ?auto_205466 ?auto_205467 ) ( not ( = ?auto_205471 ?auto_205466 ) ) ( AVAILABLE ?auto_205466 ) ( SURFACE-AT ?auto_205465 ?auto_205467 ) ( ON ?auto_205465 ?auto_205470 ) ( CLEAR ?auto_205465 ) ( not ( = ?auto_205464 ?auto_205470 ) ) ( not ( = ?auto_205465 ?auto_205470 ) ) ( not ( = ?auto_205468 ?auto_205470 ) ) ( TRUCK-AT ?auto_205472 ?auto_205469 ) )
    :subtasks
    ( ( !DRIVE ?auto_205472 ?auto_205469 ?auto_205467 )
      ( MAKE-2CRATE ?auto_205468 ?auto_205464 ?auto_205465 )
      ( MAKE-1CRATE-VERIFY ?auto_205464 ?auto_205465 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205473 - SURFACE
      ?auto_205474 - SURFACE
      ?auto_205475 - SURFACE
    )
    :vars
    (
      ?auto_205478 - HOIST
      ?auto_205479 - PLACE
      ?auto_205481 - PLACE
      ?auto_205480 - HOIST
      ?auto_205476 - SURFACE
      ?auto_205477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205478 ?auto_205479 ) ( SURFACE-AT ?auto_205474 ?auto_205479 ) ( CLEAR ?auto_205474 ) ( IS-CRATE ?auto_205475 ) ( not ( = ?auto_205474 ?auto_205475 ) ) ( AVAILABLE ?auto_205478 ) ( ON ?auto_205474 ?auto_205473 ) ( not ( = ?auto_205473 ?auto_205474 ) ) ( not ( = ?auto_205473 ?auto_205475 ) ) ( not ( = ?auto_205481 ?auto_205479 ) ) ( HOIST-AT ?auto_205480 ?auto_205481 ) ( not ( = ?auto_205478 ?auto_205480 ) ) ( AVAILABLE ?auto_205480 ) ( SURFACE-AT ?auto_205475 ?auto_205481 ) ( ON ?auto_205475 ?auto_205476 ) ( CLEAR ?auto_205475 ) ( not ( = ?auto_205474 ?auto_205476 ) ) ( not ( = ?auto_205475 ?auto_205476 ) ) ( not ( = ?auto_205473 ?auto_205476 ) ) ( TRUCK-AT ?auto_205477 ?auto_205479 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205474 ?auto_205475 )
      ( MAKE-2CRATE-VERIFY ?auto_205473 ?auto_205474 ?auto_205475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205482 - SURFACE
      ?auto_205483 - SURFACE
    )
    :vars
    (
      ?auto_205486 - HOIST
      ?auto_205487 - PLACE
      ?auto_205490 - SURFACE
      ?auto_205488 - PLACE
      ?auto_205484 - HOIST
      ?auto_205485 - SURFACE
      ?auto_205489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205486 ?auto_205487 ) ( IS-CRATE ?auto_205483 ) ( not ( = ?auto_205482 ?auto_205483 ) ) ( not ( = ?auto_205490 ?auto_205482 ) ) ( not ( = ?auto_205490 ?auto_205483 ) ) ( not ( = ?auto_205488 ?auto_205487 ) ) ( HOIST-AT ?auto_205484 ?auto_205488 ) ( not ( = ?auto_205486 ?auto_205484 ) ) ( AVAILABLE ?auto_205484 ) ( SURFACE-AT ?auto_205483 ?auto_205488 ) ( ON ?auto_205483 ?auto_205485 ) ( CLEAR ?auto_205483 ) ( not ( = ?auto_205482 ?auto_205485 ) ) ( not ( = ?auto_205483 ?auto_205485 ) ) ( not ( = ?auto_205490 ?auto_205485 ) ) ( TRUCK-AT ?auto_205489 ?auto_205487 ) ( SURFACE-AT ?auto_205490 ?auto_205487 ) ( CLEAR ?auto_205490 ) ( LIFTING ?auto_205486 ?auto_205482 ) ( IS-CRATE ?auto_205482 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205490 ?auto_205482 )
      ( MAKE-2CRATE ?auto_205490 ?auto_205482 ?auto_205483 )
      ( MAKE-1CRATE-VERIFY ?auto_205482 ?auto_205483 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205491 - SURFACE
      ?auto_205492 - SURFACE
      ?auto_205493 - SURFACE
    )
    :vars
    (
      ?auto_205494 - HOIST
      ?auto_205499 - PLACE
      ?auto_205498 - PLACE
      ?auto_205497 - HOIST
      ?auto_205495 - SURFACE
      ?auto_205496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205494 ?auto_205499 ) ( IS-CRATE ?auto_205493 ) ( not ( = ?auto_205492 ?auto_205493 ) ) ( not ( = ?auto_205491 ?auto_205492 ) ) ( not ( = ?auto_205491 ?auto_205493 ) ) ( not ( = ?auto_205498 ?auto_205499 ) ) ( HOIST-AT ?auto_205497 ?auto_205498 ) ( not ( = ?auto_205494 ?auto_205497 ) ) ( AVAILABLE ?auto_205497 ) ( SURFACE-AT ?auto_205493 ?auto_205498 ) ( ON ?auto_205493 ?auto_205495 ) ( CLEAR ?auto_205493 ) ( not ( = ?auto_205492 ?auto_205495 ) ) ( not ( = ?auto_205493 ?auto_205495 ) ) ( not ( = ?auto_205491 ?auto_205495 ) ) ( TRUCK-AT ?auto_205496 ?auto_205499 ) ( SURFACE-AT ?auto_205491 ?auto_205499 ) ( CLEAR ?auto_205491 ) ( LIFTING ?auto_205494 ?auto_205492 ) ( IS-CRATE ?auto_205492 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205492 ?auto_205493 )
      ( MAKE-2CRATE-VERIFY ?auto_205491 ?auto_205492 ?auto_205493 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205500 - SURFACE
      ?auto_205501 - SURFACE
    )
    :vars
    (
      ?auto_205506 - HOIST
      ?auto_205507 - PLACE
      ?auto_205503 - SURFACE
      ?auto_205505 - PLACE
      ?auto_205508 - HOIST
      ?auto_205502 - SURFACE
      ?auto_205504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205506 ?auto_205507 ) ( IS-CRATE ?auto_205501 ) ( not ( = ?auto_205500 ?auto_205501 ) ) ( not ( = ?auto_205503 ?auto_205500 ) ) ( not ( = ?auto_205503 ?auto_205501 ) ) ( not ( = ?auto_205505 ?auto_205507 ) ) ( HOIST-AT ?auto_205508 ?auto_205505 ) ( not ( = ?auto_205506 ?auto_205508 ) ) ( AVAILABLE ?auto_205508 ) ( SURFACE-AT ?auto_205501 ?auto_205505 ) ( ON ?auto_205501 ?auto_205502 ) ( CLEAR ?auto_205501 ) ( not ( = ?auto_205500 ?auto_205502 ) ) ( not ( = ?auto_205501 ?auto_205502 ) ) ( not ( = ?auto_205503 ?auto_205502 ) ) ( TRUCK-AT ?auto_205504 ?auto_205507 ) ( SURFACE-AT ?auto_205503 ?auto_205507 ) ( CLEAR ?auto_205503 ) ( IS-CRATE ?auto_205500 ) ( AVAILABLE ?auto_205506 ) ( IN ?auto_205500 ?auto_205504 ) )
    :subtasks
    ( ( !UNLOAD ?auto_205506 ?auto_205500 ?auto_205504 ?auto_205507 )
      ( MAKE-2CRATE ?auto_205503 ?auto_205500 ?auto_205501 )
      ( MAKE-1CRATE-VERIFY ?auto_205500 ?auto_205501 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_205509 - SURFACE
      ?auto_205510 - SURFACE
      ?auto_205511 - SURFACE
    )
    :vars
    (
      ?auto_205514 - HOIST
      ?auto_205515 - PLACE
      ?auto_205517 - PLACE
      ?auto_205516 - HOIST
      ?auto_205513 - SURFACE
      ?auto_205512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205514 ?auto_205515 ) ( IS-CRATE ?auto_205511 ) ( not ( = ?auto_205510 ?auto_205511 ) ) ( not ( = ?auto_205509 ?auto_205510 ) ) ( not ( = ?auto_205509 ?auto_205511 ) ) ( not ( = ?auto_205517 ?auto_205515 ) ) ( HOIST-AT ?auto_205516 ?auto_205517 ) ( not ( = ?auto_205514 ?auto_205516 ) ) ( AVAILABLE ?auto_205516 ) ( SURFACE-AT ?auto_205511 ?auto_205517 ) ( ON ?auto_205511 ?auto_205513 ) ( CLEAR ?auto_205511 ) ( not ( = ?auto_205510 ?auto_205513 ) ) ( not ( = ?auto_205511 ?auto_205513 ) ) ( not ( = ?auto_205509 ?auto_205513 ) ) ( TRUCK-AT ?auto_205512 ?auto_205515 ) ( SURFACE-AT ?auto_205509 ?auto_205515 ) ( CLEAR ?auto_205509 ) ( IS-CRATE ?auto_205510 ) ( AVAILABLE ?auto_205514 ) ( IN ?auto_205510 ?auto_205512 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205510 ?auto_205511 )
      ( MAKE-2CRATE-VERIFY ?auto_205509 ?auto_205510 ?auto_205511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_205554 - SURFACE
      ?auto_205555 - SURFACE
    )
    :vars
    (
      ?auto_205560 - HOIST
      ?auto_205556 - PLACE
      ?auto_205559 - SURFACE
      ?auto_205561 - PLACE
      ?auto_205562 - HOIST
      ?auto_205558 - SURFACE
      ?auto_205557 - TRUCK
      ?auto_205563 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205560 ?auto_205556 ) ( SURFACE-AT ?auto_205554 ?auto_205556 ) ( CLEAR ?auto_205554 ) ( IS-CRATE ?auto_205555 ) ( not ( = ?auto_205554 ?auto_205555 ) ) ( AVAILABLE ?auto_205560 ) ( ON ?auto_205554 ?auto_205559 ) ( not ( = ?auto_205559 ?auto_205554 ) ) ( not ( = ?auto_205559 ?auto_205555 ) ) ( not ( = ?auto_205561 ?auto_205556 ) ) ( HOIST-AT ?auto_205562 ?auto_205561 ) ( not ( = ?auto_205560 ?auto_205562 ) ) ( AVAILABLE ?auto_205562 ) ( SURFACE-AT ?auto_205555 ?auto_205561 ) ( ON ?auto_205555 ?auto_205558 ) ( CLEAR ?auto_205555 ) ( not ( = ?auto_205554 ?auto_205558 ) ) ( not ( = ?auto_205555 ?auto_205558 ) ) ( not ( = ?auto_205559 ?auto_205558 ) ) ( TRUCK-AT ?auto_205557 ?auto_205563 ) ( not ( = ?auto_205563 ?auto_205556 ) ) ( not ( = ?auto_205561 ?auto_205563 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_205557 ?auto_205563 ?auto_205556 )
      ( MAKE-1CRATE ?auto_205554 ?auto_205555 )
      ( MAKE-1CRATE-VERIFY ?auto_205554 ?auto_205555 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205593 - SURFACE
      ?auto_205594 - SURFACE
      ?auto_205595 - SURFACE
      ?auto_205596 - SURFACE
    )
    :vars
    (
      ?auto_205598 - HOIST
      ?auto_205597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205598 ?auto_205597 ) ( SURFACE-AT ?auto_205595 ?auto_205597 ) ( CLEAR ?auto_205595 ) ( LIFTING ?auto_205598 ?auto_205596 ) ( IS-CRATE ?auto_205596 ) ( not ( = ?auto_205595 ?auto_205596 ) ) ( ON ?auto_205594 ?auto_205593 ) ( ON ?auto_205595 ?auto_205594 ) ( not ( = ?auto_205593 ?auto_205594 ) ) ( not ( = ?auto_205593 ?auto_205595 ) ) ( not ( = ?auto_205593 ?auto_205596 ) ) ( not ( = ?auto_205594 ?auto_205595 ) ) ( not ( = ?auto_205594 ?auto_205596 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_205595 ?auto_205596 )
      ( MAKE-3CRATE-VERIFY ?auto_205593 ?auto_205594 ?auto_205595 ?auto_205596 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205610 - SURFACE
      ?auto_205611 - SURFACE
      ?auto_205612 - SURFACE
      ?auto_205613 - SURFACE
    )
    :vars
    (
      ?auto_205615 - HOIST
      ?auto_205616 - PLACE
      ?auto_205614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205615 ?auto_205616 ) ( SURFACE-AT ?auto_205612 ?auto_205616 ) ( CLEAR ?auto_205612 ) ( IS-CRATE ?auto_205613 ) ( not ( = ?auto_205612 ?auto_205613 ) ) ( TRUCK-AT ?auto_205614 ?auto_205616 ) ( AVAILABLE ?auto_205615 ) ( IN ?auto_205613 ?auto_205614 ) ( ON ?auto_205612 ?auto_205611 ) ( not ( = ?auto_205611 ?auto_205612 ) ) ( not ( = ?auto_205611 ?auto_205613 ) ) ( ON ?auto_205611 ?auto_205610 ) ( not ( = ?auto_205610 ?auto_205611 ) ) ( not ( = ?auto_205610 ?auto_205612 ) ) ( not ( = ?auto_205610 ?auto_205613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205611 ?auto_205612 ?auto_205613 )
      ( MAKE-3CRATE-VERIFY ?auto_205610 ?auto_205611 ?auto_205612 ?auto_205613 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205631 - SURFACE
      ?auto_205632 - SURFACE
      ?auto_205633 - SURFACE
      ?auto_205634 - SURFACE
    )
    :vars
    (
      ?auto_205636 - HOIST
      ?auto_205635 - PLACE
      ?auto_205637 - TRUCK
      ?auto_205638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205636 ?auto_205635 ) ( SURFACE-AT ?auto_205633 ?auto_205635 ) ( CLEAR ?auto_205633 ) ( IS-CRATE ?auto_205634 ) ( not ( = ?auto_205633 ?auto_205634 ) ) ( AVAILABLE ?auto_205636 ) ( IN ?auto_205634 ?auto_205637 ) ( ON ?auto_205633 ?auto_205632 ) ( not ( = ?auto_205632 ?auto_205633 ) ) ( not ( = ?auto_205632 ?auto_205634 ) ) ( TRUCK-AT ?auto_205637 ?auto_205638 ) ( not ( = ?auto_205638 ?auto_205635 ) ) ( ON ?auto_205632 ?auto_205631 ) ( not ( = ?auto_205631 ?auto_205632 ) ) ( not ( = ?auto_205631 ?auto_205633 ) ) ( not ( = ?auto_205631 ?auto_205634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205632 ?auto_205633 ?auto_205634 )
      ( MAKE-3CRATE-VERIFY ?auto_205631 ?auto_205632 ?auto_205633 ?auto_205634 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205655 - SURFACE
      ?auto_205656 - SURFACE
      ?auto_205657 - SURFACE
      ?auto_205658 - SURFACE
    )
    :vars
    (
      ?auto_205660 - HOIST
      ?auto_205663 - PLACE
      ?auto_205662 - TRUCK
      ?auto_205661 - PLACE
      ?auto_205659 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_205660 ?auto_205663 ) ( SURFACE-AT ?auto_205657 ?auto_205663 ) ( CLEAR ?auto_205657 ) ( IS-CRATE ?auto_205658 ) ( not ( = ?auto_205657 ?auto_205658 ) ) ( AVAILABLE ?auto_205660 ) ( ON ?auto_205657 ?auto_205656 ) ( not ( = ?auto_205656 ?auto_205657 ) ) ( not ( = ?auto_205656 ?auto_205658 ) ) ( TRUCK-AT ?auto_205662 ?auto_205661 ) ( not ( = ?auto_205661 ?auto_205663 ) ) ( HOIST-AT ?auto_205659 ?auto_205661 ) ( LIFTING ?auto_205659 ?auto_205658 ) ( not ( = ?auto_205660 ?auto_205659 ) ) ( ON ?auto_205656 ?auto_205655 ) ( not ( = ?auto_205655 ?auto_205656 ) ) ( not ( = ?auto_205655 ?auto_205657 ) ) ( not ( = ?auto_205655 ?auto_205658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205656 ?auto_205657 ?auto_205658 )
      ( MAKE-3CRATE-VERIFY ?auto_205655 ?auto_205656 ?auto_205657 ?auto_205658 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205682 - SURFACE
      ?auto_205683 - SURFACE
      ?auto_205684 - SURFACE
      ?auto_205685 - SURFACE
    )
    :vars
    (
      ?auto_205686 - HOIST
      ?auto_205690 - PLACE
      ?auto_205689 - TRUCK
      ?auto_205687 - PLACE
      ?auto_205691 - HOIST
      ?auto_205688 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_205686 ?auto_205690 ) ( SURFACE-AT ?auto_205684 ?auto_205690 ) ( CLEAR ?auto_205684 ) ( IS-CRATE ?auto_205685 ) ( not ( = ?auto_205684 ?auto_205685 ) ) ( AVAILABLE ?auto_205686 ) ( ON ?auto_205684 ?auto_205683 ) ( not ( = ?auto_205683 ?auto_205684 ) ) ( not ( = ?auto_205683 ?auto_205685 ) ) ( TRUCK-AT ?auto_205689 ?auto_205687 ) ( not ( = ?auto_205687 ?auto_205690 ) ) ( HOIST-AT ?auto_205691 ?auto_205687 ) ( not ( = ?auto_205686 ?auto_205691 ) ) ( AVAILABLE ?auto_205691 ) ( SURFACE-AT ?auto_205685 ?auto_205687 ) ( ON ?auto_205685 ?auto_205688 ) ( CLEAR ?auto_205685 ) ( not ( = ?auto_205684 ?auto_205688 ) ) ( not ( = ?auto_205685 ?auto_205688 ) ) ( not ( = ?auto_205683 ?auto_205688 ) ) ( ON ?auto_205683 ?auto_205682 ) ( not ( = ?auto_205682 ?auto_205683 ) ) ( not ( = ?auto_205682 ?auto_205684 ) ) ( not ( = ?auto_205682 ?auto_205685 ) ) ( not ( = ?auto_205682 ?auto_205688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205683 ?auto_205684 ?auto_205685 )
      ( MAKE-3CRATE-VERIFY ?auto_205682 ?auto_205683 ?auto_205684 ?auto_205685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205710 - SURFACE
      ?auto_205711 - SURFACE
      ?auto_205712 - SURFACE
      ?auto_205713 - SURFACE
    )
    :vars
    (
      ?auto_205716 - HOIST
      ?auto_205717 - PLACE
      ?auto_205715 - PLACE
      ?auto_205718 - HOIST
      ?auto_205714 - SURFACE
      ?auto_205719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205716 ?auto_205717 ) ( SURFACE-AT ?auto_205712 ?auto_205717 ) ( CLEAR ?auto_205712 ) ( IS-CRATE ?auto_205713 ) ( not ( = ?auto_205712 ?auto_205713 ) ) ( AVAILABLE ?auto_205716 ) ( ON ?auto_205712 ?auto_205711 ) ( not ( = ?auto_205711 ?auto_205712 ) ) ( not ( = ?auto_205711 ?auto_205713 ) ) ( not ( = ?auto_205715 ?auto_205717 ) ) ( HOIST-AT ?auto_205718 ?auto_205715 ) ( not ( = ?auto_205716 ?auto_205718 ) ) ( AVAILABLE ?auto_205718 ) ( SURFACE-AT ?auto_205713 ?auto_205715 ) ( ON ?auto_205713 ?auto_205714 ) ( CLEAR ?auto_205713 ) ( not ( = ?auto_205712 ?auto_205714 ) ) ( not ( = ?auto_205713 ?auto_205714 ) ) ( not ( = ?auto_205711 ?auto_205714 ) ) ( TRUCK-AT ?auto_205719 ?auto_205717 ) ( ON ?auto_205711 ?auto_205710 ) ( not ( = ?auto_205710 ?auto_205711 ) ) ( not ( = ?auto_205710 ?auto_205712 ) ) ( not ( = ?auto_205710 ?auto_205713 ) ) ( not ( = ?auto_205710 ?auto_205714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205711 ?auto_205712 ?auto_205713 )
      ( MAKE-3CRATE-VERIFY ?auto_205710 ?auto_205711 ?auto_205712 ?auto_205713 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205738 - SURFACE
      ?auto_205739 - SURFACE
      ?auto_205740 - SURFACE
      ?auto_205741 - SURFACE
    )
    :vars
    (
      ?auto_205747 - HOIST
      ?auto_205745 - PLACE
      ?auto_205746 - PLACE
      ?auto_205744 - HOIST
      ?auto_205742 - SURFACE
      ?auto_205743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205747 ?auto_205745 ) ( IS-CRATE ?auto_205741 ) ( not ( = ?auto_205740 ?auto_205741 ) ) ( not ( = ?auto_205739 ?auto_205740 ) ) ( not ( = ?auto_205739 ?auto_205741 ) ) ( not ( = ?auto_205746 ?auto_205745 ) ) ( HOIST-AT ?auto_205744 ?auto_205746 ) ( not ( = ?auto_205747 ?auto_205744 ) ) ( AVAILABLE ?auto_205744 ) ( SURFACE-AT ?auto_205741 ?auto_205746 ) ( ON ?auto_205741 ?auto_205742 ) ( CLEAR ?auto_205741 ) ( not ( = ?auto_205740 ?auto_205742 ) ) ( not ( = ?auto_205741 ?auto_205742 ) ) ( not ( = ?auto_205739 ?auto_205742 ) ) ( TRUCK-AT ?auto_205743 ?auto_205745 ) ( SURFACE-AT ?auto_205739 ?auto_205745 ) ( CLEAR ?auto_205739 ) ( LIFTING ?auto_205747 ?auto_205740 ) ( IS-CRATE ?auto_205740 ) ( ON ?auto_205739 ?auto_205738 ) ( not ( = ?auto_205738 ?auto_205739 ) ) ( not ( = ?auto_205738 ?auto_205740 ) ) ( not ( = ?auto_205738 ?auto_205741 ) ) ( not ( = ?auto_205738 ?auto_205742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205739 ?auto_205740 ?auto_205741 )
      ( MAKE-3CRATE-VERIFY ?auto_205738 ?auto_205739 ?auto_205740 ?auto_205741 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_205766 - SURFACE
      ?auto_205767 - SURFACE
      ?auto_205768 - SURFACE
      ?auto_205769 - SURFACE
    )
    :vars
    (
      ?auto_205772 - HOIST
      ?auto_205774 - PLACE
      ?auto_205771 - PLACE
      ?auto_205775 - HOIST
      ?auto_205770 - SURFACE
      ?auto_205773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_205772 ?auto_205774 ) ( IS-CRATE ?auto_205769 ) ( not ( = ?auto_205768 ?auto_205769 ) ) ( not ( = ?auto_205767 ?auto_205768 ) ) ( not ( = ?auto_205767 ?auto_205769 ) ) ( not ( = ?auto_205771 ?auto_205774 ) ) ( HOIST-AT ?auto_205775 ?auto_205771 ) ( not ( = ?auto_205772 ?auto_205775 ) ) ( AVAILABLE ?auto_205775 ) ( SURFACE-AT ?auto_205769 ?auto_205771 ) ( ON ?auto_205769 ?auto_205770 ) ( CLEAR ?auto_205769 ) ( not ( = ?auto_205768 ?auto_205770 ) ) ( not ( = ?auto_205769 ?auto_205770 ) ) ( not ( = ?auto_205767 ?auto_205770 ) ) ( TRUCK-AT ?auto_205773 ?auto_205774 ) ( SURFACE-AT ?auto_205767 ?auto_205774 ) ( CLEAR ?auto_205767 ) ( IS-CRATE ?auto_205768 ) ( AVAILABLE ?auto_205772 ) ( IN ?auto_205768 ?auto_205773 ) ( ON ?auto_205767 ?auto_205766 ) ( not ( = ?auto_205766 ?auto_205767 ) ) ( not ( = ?auto_205766 ?auto_205768 ) ) ( not ( = ?auto_205766 ?auto_205769 ) ) ( not ( = ?auto_205766 ?auto_205770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_205767 ?auto_205768 ?auto_205769 )
      ( MAKE-3CRATE-VERIFY ?auto_205766 ?auto_205767 ?auto_205768 ?auto_205769 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206057 - SURFACE
      ?auto_206058 - SURFACE
      ?auto_206059 - SURFACE
      ?auto_206061 - SURFACE
      ?auto_206060 - SURFACE
    )
    :vars
    (
      ?auto_206062 - HOIST
      ?auto_206063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206062 ?auto_206063 ) ( SURFACE-AT ?auto_206061 ?auto_206063 ) ( CLEAR ?auto_206061 ) ( LIFTING ?auto_206062 ?auto_206060 ) ( IS-CRATE ?auto_206060 ) ( not ( = ?auto_206061 ?auto_206060 ) ) ( ON ?auto_206058 ?auto_206057 ) ( ON ?auto_206059 ?auto_206058 ) ( ON ?auto_206061 ?auto_206059 ) ( not ( = ?auto_206057 ?auto_206058 ) ) ( not ( = ?auto_206057 ?auto_206059 ) ) ( not ( = ?auto_206057 ?auto_206061 ) ) ( not ( = ?auto_206057 ?auto_206060 ) ) ( not ( = ?auto_206058 ?auto_206059 ) ) ( not ( = ?auto_206058 ?auto_206061 ) ) ( not ( = ?auto_206058 ?auto_206060 ) ) ( not ( = ?auto_206059 ?auto_206061 ) ) ( not ( = ?auto_206059 ?auto_206060 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_206061 ?auto_206060 )
      ( MAKE-4CRATE-VERIFY ?auto_206057 ?auto_206058 ?auto_206059 ?auto_206061 ?auto_206060 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206082 - SURFACE
      ?auto_206083 - SURFACE
      ?auto_206084 - SURFACE
      ?auto_206086 - SURFACE
      ?auto_206085 - SURFACE
    )
    :vars
    (
      ?auto_206088 - HOIST
      ?auto_206087 - PLACE
      ?auto_206089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206088 ?auto_206087 ) ( SURFACE-AT ?auto_206086 ?auto_206087 ) ( CLEAR ?auto_206086 ) ( IS-CRATE ?auto_206085 ) ( not ( = ?auto_206086 ?auto_206085 ) ) ( TRUCK-AT ?auto_206089 ?auto_206087 ) ( AVAILABLE ?auto_206088 ) ( IN ?auto_206085 ?auto_206089 ) ( ON ?auto_206086 ?auto_206084 ) ( not ( = ?auto_206084 ?auto_206086 ) ) ( not ( = ?auto_206084 ?auto_206085 ) ) ( ON ?auto_206083 ?auto_206082 ) ( ON ?auto_206084 ?auto_206083 ) ( not ( = ?auto_206082 ?auto_206083 ) ) ( not ( = ?auto_206082 ?auto_206084 ) ) ( not ( = ?auto_206082 ?auto_206086 ) ) ( not ( = ?auto_206082 ?auto_206085 ) ) ( not ( = ?auto_206083 ?auto_206084 ) ) ( not ( = ?auto_206083 ?auto_206086 ) ) ( not ( = ?auto_206083 ?auto_206085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206084 ?auto_206086 ?auto_206085 )
      ( MAKE-4CRATE-VERIFY ?auto_206082 ?auto_206083 ?auto_206084 ?auto_206086 ?auto_206085 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206112 - SURFACE
      ?auto_206113 - SURFACE
      ?auto_206114 - SURFACE
      ?auto_206116 - SURFACE
      ?auto_206115 - SURFACE
    )
    :vars
    (
      ?auto_206117 - HOIST
      ?auto_206118 - PLACE
      ?auto_206119 - TRUCK
      ?auto_206120 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206117 ?auto_206118 ) ( SURFACE-AT ?auto_206116 ?auto_206118 ) ( CLEAR ?auto_206116 ) ( IS-CRATE ?auto_206115 ) ( not ( = ?auto_206116 ?auto_206115 ) ) ( AVAILABLE ?auto_206117 ) ( IN ?auto_206115 ?auto_206119 ) ( ON ?auto_206116 ?auto_206114 ) ( not ( = ?auto_206114 ?auto_206116 ) ) ( not ( = ?auto_206114 ?auto_206115 ) ) ( TRUCK-AT ?auto_206119 ?auto_206120 ) ( not ( = ?auto_206120 ?auto_206118 ) ) ( ON ?auto_206113 ?auto_206112 ) ( ON ?auto_206114 ?auto_206113 ) ( not ( = ?auto_206112 ?auto_206113 ) ) ( not ( = ?auto_206112 ?auto_206114 ) ) ( not ( = ?auto_206112 ?auto_206116 ) ) ( not ( = ?auto_206112 ?auto_206115 ) ) ( not ( = ?auto_206113 ?auto_206114 ) ) ( not ( = ?auto_206113 ?auto_206116 ) ) ( not ( = ?auto_206113 ?auto_206115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206114 ?auto_206116 ?auto_206115 )
      ( MAKE-4CRATE-VERIFY ?auto_206112 ?auto_206113 ?auto_206114 ?auto_206116 ?auto_206115 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206146 - SURFACE
      ?auto_206147 - SURFACE
      ?auto_206148 - SURFACE
      ?auto_206150 - SURFACE
      ?auto_206149 - SURFACE
    )
    :vars
    (
      ?auto_206154 - HOIST
      ?auto_206151 - PLACE
      ?auto_206153 - TRUCK
      ?auto_206155 - PLACE
      ?auto_206152 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_206154 ?auto_206151 ) ( SURFACE-AT ?auto_206150 ?auto_206151 ) ( CLEAR ?auto_206150 ) ( IS-CRATE ?auto_206149 ) ( not ( = ?auto_206150 ?auto_206149 ) ) ( AVAILABLE ?auto_206154 ) ( ON ?auto_206150 ?auto_206148 ) ( not ( = ?auto_206148 ?auto_206150 ) ) ( not ( = ?auto_206148 ?auto_206149 ) ) ( TRUCK-AT ?auto_206153 ?auto_206155 ) ( not ( = ?auto_206155 ?auto_206151 ) ) ( HOIST-AT ?auto_206152 ?auto_206155 ) ( LIFTING ?auto_206152 ?auto_206149 ) ( not ( = ?auto_206154 ?auto_206152 ) ) ( ON ?auto_206147 ?auto_206146 ) ( ON ?auto_206148 ?auto_206147 ) ( not ( = ?auto_206146 ?auto_206147 ) ) ( not ( = ?auto_206146 ?auto_206148 ) ) ( not ( = ?auto_206146 ?auto_206150 ) ) ( not ( = ?auto_206146 ?auto_206149 ) ) ( not ( = ?auto_206147 ?auto_206148 ) ) ( not ( = ?auto_206147 ?auto_206150 ) ) ( not ( = ?auto_206147 ?auto_206149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206148 ?auto_206150 ?auto_206149 )
      ( MAKE-4CRATE-VERIFY ?auto_206146 ?auto_206147 ?auto_206148 ?auto_206150 ?auto_206149 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206184 - SURFACE
      ?auto_206185 - SURFACE
      ?auto_206186 - SURFACE
      ?auto_206188 - SURFACE
      ?auto_206187 - SURFACE
    )
    :vars
    (
      ?auto_206192 - HOIST
      ?auto_206194 - PLACE
      ?auto_206193 - TRUCK
      ?auto_206190 - PLACE
      ?auto_206189 - HOIST
      ?auto_206191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206192 ?auto_206194 ) ( SURFACE-AT ?auto_206188 ?auto_206194 ) ( CLEAR ?auto_206188 ) ( IS-CRATE ?auto_206187 ) ( not ( = ?auto_206188 ?auto_206187 ) ) ( AVAILABLE ?auto_206192 ) ( ON ?auto_206188 ?auto_206186 ) ( not ( = ?auto_206186 ?auto_206188 ) ) ( not ( = ?auto_206186 ?auto_206187 ) ) ( TRUCK-AT ?auto_206193 ?auto_206190 ) ( not ( = ?auto_206190 ?auto_206194 ) ) ( HOIST-AT ?auto_206189 ?auto_206190 ) ( not ( = ?auto_206192 ?auto_206189 ) ) ( AVAILABLE ?auto_206189 ) ( SURFACE-AT ?auto_206187 ?auto_206190 ) ( ON ?auto_206187 ?auto_206191 ) ( CLEAR ?auto_206187 ) ( not ( = ?auto_206188 ?auto_206191 ) ) ( not ( = ?auto_206187 ?auto_206191 ) ) ( not ( = ?auto_206186 ?auto_206191 ) ) ( ON ?auto_206185 ?auto_206184 ) ( ON ?auto_206186 ?auto_206185 ) ( not ( = ?auto_206184 ?auto_206185 ) ) ( not ( = ?auto_206184 ?auto_206186 ) ) ( not ( = ?auto_206184 ?auto_206188 ) ) ( not ( = ?auto_206184 ?auto_206187 ) ) ( not ( = ?auto_206184 ?auto_206191 ) ) ( not ( = ?auto_206185 ?auto_206186 ) ) ( not ( = ?auto_206185 ?auto_206188 ) ) ( not ( = ?auto_206185 ?auto_206187 ) ) ( not ( = ?auto_206185 ?auto_206191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206186 ?auto_206188 ?auto_206187 )
      ( MAKE-4CRATE-VERIFY ?auto_206184 ?auto_206185 ?auto_206186 ?auto_206188 ?auto_206187 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206223 - SURFACE
      ?auto_206224 - SURFACE
      ?auto_206225 - SURFACE
      ?auto_206227 - SURFACE
      ?auto_206226 - SURFACE
    )
    :vars
    (
      ?auto_206230 - HOIST
      ?auto_206232 - PLACE
      ?auto_206228 - PLACE
      ?auto_206229 - HOIST
      ?auto_206233 - SURFACE
      ?auto_206231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206230 ?auto_206232 ) ( SURFACE-AT ?auto_206227 ?auto_206232 ) ( CLEAR ?auto_206227 ) ( IS-CRATE ?auto_206226 ) ( not ( = ?auto_206227 ?auto_206226 ) ) ( AVAILABLE ?auto_206230 ) ( ON ?auto_206227 ?auto_206225 ) ( not ( = ?auto_206225 ?auto_206227 ) ) ( not ( = ?auto_206225 ?auto_206226 ) ) ( not ( = ?auto_206228 ?auto_206232 ) ) ( HOIST-AT ?auto_206229 ?auto_206228 ) ( not ( = ?auto_206230 ?auto_206229 ) ) ( AVAILABLE ?auto_206229 ) ( SURFACE-AT ?auto_206226 ?auto_206228 ) ( ON ?auto_206226 ?auto_206233 ) ( CLEAR ?auto_206226 ) ( not ( = ?auto_206227 ?auto_206233 ) ) ( not ( = ?auto_206226 ?auto_206233 ) ) ( not ( = ?auto_206225 ?auto_206233 ) ) ( TRUCK-AT ?auto_206231 ?auto_206232 ) ( ON ?auto_206224 ?auto_206223 ) ( ON ?auto_206225 ?auto_206224 ) ( not ( = ?auto_206223 ?auto_206224 ) ) ( not ( = ?auto_206223 ?auto_206225 ) ) ( not ( = ?auto_206223 ?auto_206227 ) ) ( not ( = ?auto_206223 ?auto_206226 ) ) ( not ( = ?auto_206223 ?auto_206233 ) ) ( not ( = ?auto_206224 ?auto_206225 ) ) ( not ( = ?auto_206224 ?auto_206227 ) ) ( not ( = ?auto_206224 ?auto_206226 ) ) ( not ( = ?auto_206224 ?auto_206233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206225 ?auto_206227 ?auto_206226 )
      ( MAKE-4CRATE-VERIFY ?auto_206223 ?auto_206224 ?auto_206225 ?auto_206227 ?auto_206226 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206262 - SURFACE
      ?auto_206263 - SURFACE
      ?auto_206264 - SURFACE
      ?auto_206266 - SURFACE
      ?auto_206265 - SURFACE
    )
    :vars
    (
      ?auto_206269 - HOIST
      ?auto_206272 - PLACE
      ?auto_206270 - PLACE
      ?auto_206267 - HOIST
      ?auto_206268 - SURFACE
      ?auto_206271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206269 ?auto_206272 ) ( IS-CRATE ?auto_206265 ) ( not ( = ?auto_206266 ?auto_206265 ) ) ( not ( = ?auto_206264 ?auto_206266 ) ) ( not ( = ?auto_206264 ?auto_206265 ) ) ( not ( = ?auto_206270 ?auto_206272 ) ) ( HOIST-AT ?auto_206267 ?auto_206270 ) ( not ( = ?auto_206269 ?auto_206267 ) ) ( AVAILABLE ?auto_206267 ) ( SURFACE-AT ?auto_206265 ?auto_206270 ) ( ON ?auto_206265 ?auto_206268 ) ( CLEAR ?auto_206265 ) ( not ( = ?auto_206266 ?auto_206268 ) ) ( not ( = ?auto_206265 ?auto_206268 ) ) ( not ( = ?auto_206264 ?auto_206268 ) ) ( TRUCK-AT ?auto_206271 ?auto_206272 ) ( SURFACE-AT ?auto_206264 ?auto_206272 ) ( CLEAR ?auto_206264 ) ( LIFTING ?auto_206269 ?auto_206266 ) ( IS-CRATE ?auto_206266 ) ( ON ?auto_206263 ?auto_206262 ) ( ON ?auto_206264 ?auto_206263 ) ( not ( = ?auto_206262 ?auto_206263 ) ) ( not ( = ?auto_206262 ?auto_206264 ) ) ( not ( = ?auto_206262 ?auto_206266 ) ) ( not ( = ?auto_206262 ?auto_206265 ) ) ( not ( = ?auto_206262 ?auto_206268 ) ) ( not ( = ?auto_206263 ?auto_206264 ) ) ( not ( = ?auto_206263 ?auto_206266 ) ) ( not ( = ?auto_206263 ?auto_206265 ) ) ( not ( = ?auto_206263 ?auto_206268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206264 ?auto_206266 ?auto_206265 )
      ( MAKE-4CRATE-VERIFY ?auto_206262 ?auto_206263 ?auto_206264 ?auto_206266 ?auto_206265 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_206301 - SURFACE
      ?auto_206302 - SURFACE
      ?auto_206303 - SURFACE
      ?auto_206305 - SURFACE
      ?auto_206304 - SURFACE
    )
    :vars
    (
      ?auto_206307 - HOIST
      ?auto_206311 - PLACE
      ?auto_206310 - PLACE
      ?auto_206309 - HOIST
      ?auto_206306 - SURFACE
      ?auto_206308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_206307 ?auto_206311 ) ( IS-CRATE ?auto_206304 ) ( not ( = ?auto_206305 ?auto_206304 ) ) ( not ( = ?auto_206303 ?auto_206305 ) ) ( not ( = ?auto_206303 ?auto_206304 ) ) ( not ( = ?auto_206310 ?auto_206311 ) ) ( HOIST-AT ?auto_206309 ?auto_206310 ) ( not ( = ?auto_206307 ?auto_206309 ) ) ( AVAILABLE ?auto_206309 ) ( SURFACE-AT ?auto_206304 ?auto_206310 ) ( ON ?auto_206304 ?auto_206306 ) ( CLEAR ?auto_206304 ) ( not ( = ?auto_206305 ?auto_206306 ) ) ( not ( = ?auto_206304 ?auto_206306 ) ) ( not ( = ?auto_206303 ?auto_206306 ) ) ( TRUCK-AT ?auto_206308 ?auto_206311 ) ( SURFACE-AT ?auto_206303 ?auto_206311 ) ( CLEAR ?auto_206303 ) ( IS-CRATE ?auto_206305 ) ( AVAILABLE ?auto_206307 ) ( IN ?auto_206305 ?auto_206308 ) ( ON ?auto_206302 ?auto_206301 ) ( ON ?auto_206303 ?auto_206302 ) ( not ( = ?auto_206301 ?auto_206302 ) ) ( not ( = ?auto_206301 ?auto_206303 ) ) ( not ( = ?auto_206301 ?auto_206305 ) ) ( not ( = ?auto_206301 ?auto_206304 ) ) ( not ( = ?auto_206301 ?auto_206306 ) ) ( not ( = ?auto_206302 ?auto_206303 ) ) ( not ( = ?auto_206302 ?auto_206305 ) ) ( not ( = ?auto_206302 ?auto_206304 ) ) ( not ( = ?auto_206302 ?auto_206306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206303 ?auto_206305 ?auto_206304 )
      ( MAKE-4CRATE-VERIFY ?auto_206301 ?auto_206302 ?auto_206303 ?auto_206305 ?auto_206304 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_206961 - SURFACE
      ?auto_206962 - SURFACE
      ?auto_206963 - SURFACE
      ?auto_206965 - SURFACE
      ?auto_206964 - SURFACE
      ?auto_206966 - SURFACE
    )
    :vars
    (
      ?auto_206967 - HOIST
      ?auto_206968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_206967 ?auto_206968 ) ( SURFACE-AT ?auto_206964 ?auto_206968 ) ( CLEAR ?auto_206964 ) ( LIFTING ?auto_206967 ?auto_206966 ) ( IS-CRATE ?auto_206966 ) ( not ( = ?auto_206964 ?auto_206966 ) ) ( ON ?auto_206962 ?auto_206961 ) ( ON ?auto_206963 ?auto_206962 ) ( ON ?auto_206965 ?auto_206963 ) ( ON ?auto_206964 ?auto_206965 ) ( not ( = ?auto_206961 ?auto_206962 ) ) ( not ( = ?auto_206961 ?auto_206963 ) ) ( not ( = ?auto_206961 ?auto_206965 ) ) ( not ( = ?auto_206961 ?auto_206964 ) ) ( not ( = ?auto_206961 ?auto_206966 ) ) ( not ( = ?auto_206962 ?auto_206963 ) ) ( not ( = ?auto_206962 ?auto_206965 ) ) ( not ( = ?auto_206962 ?auto_206964 ) ) ( not ( = ?auto_206962 ?auto_206966 ) ) ( not ( = ?auto_206963 ?auto_206965 ) ) ( not ( = ?auto_206963 ?auto_206964 ) ) ( not ( = ?auto_206963 ?auto_206966 ) ) ( not ( = ?auto_206965 ?auto_206964 ) ) ( not ( = ?auto_206965 ?auto_206966 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_206964 ?auto_206966 )
      ( MAKE-5CRATE-VERIFY ?auto_206961 ?auto_206962 ?auto_206963 ?auto_206965 ?auto_206964 ?auto_206966 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_206995 - SURFACE
      ?auto_206996 - SURFACE
      ?auto_206997 - SURFACE
      ?auto_206999 - SURFACE
      ?auto_206998 - SURFACE
      ?auto_207000 - SURFACE
    )
    :vars
    (
      ?auto_207002 - HOIST
      ?auto_207001 - PLACE
      ?auto_207003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207002 ?auto_207001 ) ( SURFACE-AT ?auto_206998 ?auto_207001 ) ( CLEAR ?auto_206998 ) ( IS-CRATE ?auto_207000 ) ( not ( = ?auto_206998 ?auto_207000 ) ) ( TRUCK-AT ?auto_207003 ?auto_207001 ) ( AVAILABLE ?auto_207002 ) ( IN ?auto_207000 ?auto_207003 ) ( ON ?auto_206998 ?auto_206999 ) ( not ( = ?auto_206999 ?auto_206998 ) ) ( not ( = ?auto_206999 ?auto_207000 ) ) ( ON ?auto_206996 ?auto_206995 ) ( ON ?auto_206997 ?auto_206996 ) ( ON ?auto_206999 ?auto_206997 ) ( not ( = ?auto_206995 ?auto_206996 ) ) ( not ( = ?auto_206995 ?auto_206997 ) ) ( not ( = ?auto_206995 ?auto_206999 ) ) ( not ( = ?auto_206995 ?auto_206998 ) ) ( not ( = ?auto_206995 ?auto_207000 ) ) ( not ( = ?auto_206996 ?auto_206997 ) ) ( not ( = ?auto_206996 ?auto_206999 ) ) ( not ( = ?auto_206996 ?auto_206998 ) ) ( not ( = ?auto_206996 ?auto_207000 ) ) ( not ( = ?auto_206997 ?auto_206999 ) ) ( not ( = ?auto_206997 ?auto_206998 ) ) ( not ( = ?auto_206997 ?auto_207000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_206999 ?auto_206998 ?auto_207000 )
      ( MAKE-5CRATE-VERIFY ?auto_206995 ?auto_206996 ?auto_206997 ?auto_206999 ?auto_206998 ?auto_207000 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207035 - SURFACE
      ?auto_207036 - SURFACE
      ?auto_207037 - SURFACE
      ?auto_207039 - SURFACE
      ?auto_207038 - SURFACE
      ?auto_207040 - SURFACE
    )
    :vars
    (
      ?auto_207041 - HOIST
      ?auto_207044 - PLACE
      ?auto_207043 - TRUCK
      ?auto_207042 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207041 ?auto_207044 ) ( SURFACE-AT ?auto_207038 ?auto_207044 ) ( CLEAR ?auto_207038 ) ( IS-CRATE ?auto_207040 ) ( not ( = ?auto_207038 ?auto_207040 ) ) ( AVAILABLE ?auto_207041 ) ( IN ?auto_207040 ?auto_207043 ) ( ON ?auto_207038 ?auto_207039 ) ( not ( = ?auto_207039 ?auto_207038 ) ) ( not ( = ?auto_207039 ?auto_207040 ) ) ( TRUCK-AT ?auto_207043 ?auto_207042 ) ( not ( = ?auto_207042 ?auto_207044 ) ) ( ON ?auto_207036 ?auto_207035 ) ( ON ?auto_207037 ?auto_207036 ) ( ON ?auto_207039 ?auto_207037 ) ( not ( = ?auto_207035 ?auto_207036 ) ) ( not ( = ?auto_207035 ?auto_207037 ) ) ( not ( = ?auto_207035 ?auto_207039 ) ) ( not ( = ?auto_207035 ?auto_207038 ) ) ( not ( = ?auto_207035 ?auto_207040 ) ) ( not ( = ?auto_207036 ?auto_207037 ) ) ( not ( = ?auto_207036 ?auto_207039 ) ) ( not ( = ?auto_207036 ?auto_207038 ) ) ( not ( = ?auto_207036 ?auto_207040 ) ) ( not ( = ?auto_207037 ?auto_207039 ) ) ( not ( = ?auto_207037 ?auto_207038 ) ) ( not ( = ?auto_207037 ?auto_207040 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207039 ?auto_207038 ?auto_207040 )
      ( MAKE-5CRATE-VERIFY ?auto_207035 ?auto_207036 ?auto_207037 ?auto_207039 ?auto_207038 ?auto_207040 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207080 - SURFACE
      ?auto_207081 - SURFACE
      ?auto_207082 - SURFACE
      ?auto_207084 - SURFACE
      ?auto_207083 - SURFACE
      ?auto_207085 - SURFACE
    )
    :vars
    (
      ?auto_207090 - HOIST
      ?auto_207089 - PLACE
      ?auto_207088 - TRUCK
      ?auto_207087 - PLACE
      ?auto_207086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_207090 ?auto_207089 ) ( SURFACE-AT ?auto_207083 ?auto_207089 ) ( CLEAR ?auto_207083 ) ( IS-CRATE ?auto_207085 ) ( not ( = ?auto_207083 ?auto_207085 ) ) ( AVAILABLE ?auto_207090 ) ( ON ?auto_207083 ?auto_207084 ) ( not ( = ?auto_207084 ?auto_207083 ) ) ( not ( = ?auto_207084 ?auto_207085 ) ) ( TRUCK-AT ?auto_207088 ?auto_207087 ) ( not ( = ?auto_207087 ?auto_207089 ) ) ( HOIST-AT ?auto_207086 ?auto_207087 ) ( LIFTING ?auto_207086 ?auto_207085 ) ( not ( = ?auto_207090 ?auto_207086 ) ) ( ON ?auto_207081 ?auto_207080 ) ( ON ?auto_207082 ?auto_207081 ) ( ON ?auto_207084 ?auto_207082 ) ( not ( = ?auto_207080 ?auto_207081 ) ) ( not ( = ?auto_207080 ?auto_207082 ) ) ( not ( = ?auto_207080 ?auto_207084 ) ) ( not ( = ?auto_207080 ?auto_207083 ) ) ( not ( = ?auto_207080 ?auto_207085 ) ) ( not ( = ?auto_207081 ?auto_207082 ) ) ( not ( = ?auto_207081 ?auto_207084 ) ) ( not ( = ?auto_207081 ?auto_207083 ) ) ( not ( = ?auto_207081 ?auto_207085 ) ) ( not ( = ?auto_207082 ?auto_207084 ) ) ( not ( = ?auto_207082 ?auto_207083 ) ) ( not ( = ?auto_207082 ?auto_207085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207084 ?auto_207083 ?auto_207085 )
      ( MAKE-5CRATE-VERIFY ?auto_207080 ?auto_207081 ?auto_207082 ?auto_207084 ?auto_207083 ?auto_207085 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207130 - SURFACE
      ?auto_207131 - SURFACE
      ?auto_207132 - SURFACE
      ?auto_207134 - SURFACE
      ?auto_207133 - SURFACE
      ?auto_207135 - SURFACE
    )
    :vars
    (
      ?auto_207136 - HOIST
      ?auto_207141 - PLACE
      ?auto_207140 - TRUCK
      ?auto_207137 - PLACE
      ?auto_207139 - HOIST
      ?auto_207138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207136 ?auto_207141 ) ( SURFACE-AT ?auto_207133 ?auto_207141 ) ( CLEAR ?auto_207133 ) ( IS-CRATE ?auto_207135 ) ( not ( = ?auto_207133 ?auto_207135 ) ) ( AVAILABLE ?auto_207136 ) ( ON ?auto_207133 ?auto_207134 ) ( not ( = ?auto_207134 ?auto_207133 ) ) ( not ( = ?auto_207134 ?auto_207135 ) ) ( TRUCK-AT ?auto_207140 ?auto_207137 ) ( not ( = ?auto_207137 ?auto_207141 ) ) ( HOIST-AT ?auto_207139 ?auto_207137 ) ( not ( = ?auto_207136 ?auto_207139 ) ) ( AVAILABLE ?auto_207139 ) ( SURFACE-AT ?auto_207135 ?auto_207137 ) ( ON ?auto_207135 ?auto_207138 ) ( CLEAR ?auto_207135 ) ( not ( = ?auto_207133 ?auto_207138 ) ) ( not ( = ?auto_207135 ?auto_207138 ) ) ( not ( = ?auto_207134 ?auto_207138 ) ) ( ON ?auto_207131 ?auto_207130 ) ( ON ?auto_207132 ?auto_207131 ) ( ON ?auto_207134 ?auto_207132 ) ( not ( = ?auto_207130 ?auto_207131 ) ) ( not ( = ?auto_207130 ?auto_207132 ) ) ( not ( = ?auto_207130 ?auto_207134 ) ) ( not ( = ?auto_207130 ?auto_207133 ) ) ( not ( = ?auto_207130 ?auto_207135 ) ) ( not ( = ?auto_207130 ?auto_207138 ) ) ( not ( = ?auto_207131 ?auto_207132 ) ) ( not ( = ?auto_207131 ?auto_207134 ) ) ( not ( = ?auto_207131 ?auto_207133 ) ) ( not ( = ?auto_207131 ?auto_207135 ) ) ( not ( = ?auto_207131 ?auto_207138 ) ) ( not ( = ?auto_207132 ?auto_207134 ) ) ( not ( = ?auto_207132 ?auto_207133 ) ) ( not ( = ?auto_207132 ?auto_207135 ) ) ( not ( = ?auto_207132 ?auto_207138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207134 ?auto_207133 ?auto_207135 )
      ( MAKE-5CRATE-VERIFY ?auto_207130 ?auto_207131 ?auto_207132 ?auto_207134 ?auto_207133 ?auto_207135 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207181 - SURFACE
      ?auto_207182 - SURFACE
      ?auto_207183 - SURFACE
      ?auto_207185 - SURFACE
      ?auto_207184 - SURFACE
      ?auto_207186 - SURFACE
    )
    :vars
    (
      ?auto_207187 - HOIST
      ?auto_207192 - PLACE
      ?auto_207189 - PLACE
      ?auto_207191 - HOIST
      ?auto_207190 - SURFACE
      ?auto_207188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207187 ?auto_207192 ) ( SURFACE-AT ?auto_207184 ?auto_207192 ) ( CLEAR ?auto_207184 ) ( IS-CRATE ?auto_207186 ) ( not ( = ?auto_207184 ?auto_207186 ) ) ( AVAILABLE ?auto_207187 ) ( ON ?auto_207184 ?auto_207185 ) ( not ( = ?auto_207185 ?auto_207184 ) ) ( not ( = ?auto_207185 ?auto_207186 ) ) ( not ( = ?auto_207189 ?auto_207192 ) ) ( HOIST-AT ?auto_207191 ?auto_207189 ) ( not ( = ?auto_207187 ?auto_207191 ) ) ( AVAILABLE ?auto_207191 ) ( SURFACE-AT ?auto_207186 ?auto_207189 ) ( ON ?auto_207186 ?auto_207190 ) ( CLEAR ?auto_207186 ) ( not ( = ?auto_207184 ?auto_207190 ) ) ( not ( = ?auto_207186 ?auto_207190 ) ) ( not ( = ?auto_207185 ?auto_207190 ) ) ( TRUCK-AT ?auto_207188 ?auto_207192 ) ( ON ?auto_207182 ?auto_207181 ) ( ON ?auto_207183 ?auto_207182 ) ( ON ?auto_207185 ?auto_207183 ) ( not ( = ?auto_207181 ?auto_207182 ) ) ( not ( = ?auto_207181 ?auto_207183 ) ) ( not ( = ?auto_207181 ?auto_207185 ) ) ( not ( = ?auto_207181 ?auto_207184 ) ) ( not ( = ?auto_207181 ?auto_207186 ) ) ( not ( = ?auto_207181 ?auto_207190 ) ) ( not ( = ?auto_207182 ?auto_207183 ) ) ( not ( = ?auto_207182 ?auto_207185 ) ) ( not ( = ?auto_207182 ?auto_207184 ) ) ( not ( = ?auto_207182 ?auto_207186 ) ) ( not ( = ?auto_207182 ?auto_207190 ) ) ( not ( = ?auto_207183 ?auto_207185 ) ) ( not ( = ?auto_207183 ?auto_207184 ) ) ( not ( = ?auto_207183 ?auto_207186 ) ) ( not ( = ?auto_207183 ?auto_207190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207185 ?auto_207184 ?auto_207186 )
      ( MAKE-5CRATE-VERIFY ?auto_207181 ?auto_207182 ?auto_207183 ?auto_207185 ?auto_207184 ?auto_207186 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207232 - SURFACE
      ?auto_207233 - SURFACE
      ?auto_207234 - SURFACE
      ?auto_207236 - SURFACE
      ?auto_207235 - SURFACE
      ?auto_207237 - SURFACE
    )
    :vars
    (
      ?auto_207242 - HOIST
      ?auto_207239 - PLACE
      ?auto_207243 - PLACE
      ?auto_207241 - HOIST
      ?auto_207240 - SURFACE
      ?auto_207238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207242 ?auto_207239 ) ( IS-CRATE ?auto_207237 ) ( not ( = ?auto_207235 ?auto_207237 ) ) ( not ( = ?auto_207236 ?auto_207235 ) ) ( not ( = ?auto_207236 ?auto_207237 ) ) ( not ( = ?auto_207243 ?auto_207239 ) ) ( HOIST-AT ?auto_207241 ?auto_207243 ) ( not ( = ?auto_207242 ?auto_207241 ) ) ( AVAILABLE ?auto_207241 ) ( SURFACE-AT ?auto_207237 ?auto_207243 ) ( ON ?auto_207237 ?auto_207240 ) ( CLEAR ?auto_207237 ) ( not ( = ?auto_207235 ?auto_207240 ) ) ( not ( = ?auto_207237 ?auto_207240 ) ) ( not ( = ?auto_207236 ?auto_207240 ) ) ( TRUCK-AT ?auto_207238 ?auto_207239 ) ( SURFACE-AT ?auto_207236 ?auto_207239 ) ( CLEAR ?auto_207236 ) ( LIFTING ?auto_207242 ?auto_207235 ) ( IS-CRATE ?auto_207235 ) ( ON ?auto_207233 ?auto_207232 ) ( ON ?auto_207234 ?auto_207233 ) ( ON ?auto_207236 ?auto_207234 ) ( not ( = ?auto_207232 ?auto_207233 ) ) ( not ( = ?auto_207232 ?auto_207234 ) ) ( not ( = ?auto_207232 ?auto_207236 ) ) ( not ( = ?auto_207232 ?auto_207235 ) ) ( not ( = ?auto_207232 ?auto_207237 ) ) ( not ( = ?auto_207232 ?auto_207240 ) ) ( not ( = ?auto_207233 ?auto_207234 ) ) ( not ( = ?auto_207233 ?auto_207236 ) ) ( not ( = ?auto_207233 ?auto_207235 ) ) ( not ( = ?auto_207233 ?auto_207237 ) ) ( not ( = ?auto_207233 ?auto_207240 ) ) ( not ( = ?auto_207234 ?auto_207236 ) ) ( not ( = ?auto_207234 ?auto_207235 ) ) ( not ( = ?auto_207234 ?auto_207237 ) ) ( not ( = ?auto_207234 ?auto_207240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207236 ?auto_207235 ?auto_207237 )
      ( MAKE-5CRATE-VERIFY ?auto_207232 ?auto_207233 ?auto_207234 ?auto_207236 ?auto_207235 ?auto_207237 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207283 - SURFACE
      ?auto_207284 - SURFACE
      ?auto_207285 - SURFACE
      ?auto_207287 - SURFACE
      ?auto_207286 - SURFACE
      ?auto_207288 - SURFACE
    )
    :vars
    (
      ?auto_207294 - HOIST
      ?auto_207293 - PLACE
      ?auto_207290 - PLACE
      ?auto_207289 - HOIST
      ?auto_207291 - SURFACE
      ?auto_207292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207294 ?auto_207293 ) ( IS-CRATE ?auto_207288 ) ( not ( = ?auto_207286 ?auto_207288 ) ) ( not ( = ?auto_207287 ?auto_207286 ) ) ( not ( = ?auto_207287 ?auto_207288 ) ) ( not ( = ?auto_207290 ?auto_207293 ) ) ( HOIST-AT ?auto_207289 ?auto_207290 ) ( not ( = ?auto_207294 ?auto_207289 ) ) ( AVAILABLE ?auto_207289 ) ( SURFACE-AT ?auto_207288 ?auto_207290 ) ( ON ?auto_207288 ?auto_207291 ) ( CLEAR ?auto_207288 ) ( not ( = ?auto_207286 ?auto_207291 ) ) ( not ( = ?auto_207288 ?auto_207291 ) ) ( not ( = ?auto_207287 ?auto_207291 ) ) ( TRUCK-AT ?auto_207292 ?auto_207293 ) ( SURFACE-AT ?auto_207287 ?auto_207293 ) ( CLEAR ?auto_207287 ) ( IS-CRATE ?auto_207286 ) ( AVAILABLE ?auto_207294 ) ( IN ?auto_207286 ?auto_207292 ) ( ON ?auto_207284 ?auto_207283 ) ( ON ?auto_207285 ?auto_207284 ) ( ON ?auto_207287 ?auto_207285 ) ( not ( = ?auto_207283 ?auto_207284 ) ) ( not ( = ?auto_207283 ?auto_207285 ) ) ( not ( = ?auto_207283 ?auto_207287 ) ) ( not ( = ?auto_207283 ?auto_207286 ) ) ( not ( = ?auto_207283 ?auto_207288 ) ) ( not ( = ?auto_207283 ?auto_207291 ) ) ( not ( = ?auto_207284 ?auto_207285 ) ) ( not ( = ?auto_207284 ?auto_207287 ) ) ( not ( = ?auto_207284 ?auto_207286 ) ) ( not ( = ?auto_207284 ?auto_207288 ) ) ( not ( = ?auto_207284 ?auto_207291 ) ) ( not ( = ?auto_207285 ?auto_207287 ) ) ( not ( = ?auto_207285 ?auto_207286 ) ) ( not ( = ?auto_207285 ?auto_207288 ) ) ( not ( = ?auto_207285 ?auto_207291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207287 ?auto_207286 ?auto_207288 )
      ( MAKE-5CRATE-VERIFY ?auto_207283 ?auto_207284 ?auto_207285 ?auto_207287 ?auto_207286 ?auto_207288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_207295 - SURFACE
      ?auto_207296 - SURFACE
    )
    :vars
    (
      ?auto_207303 - HOIST
      ?auto_207301 - PLACE
      ?auto_207302 - SURFACE
      ?auto_207298 - PLACE
      ?auto_207297 - HOIST
      ?auto_207299 - SURFACE
      ?auto_207300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207303 ?auto_207301 ) ( IS-CRATE ?auto_207296 ) ( not ( = ?auto_207295 ?auto_207296 ) ) ( not ( = ?auto_207302 ?auto_207295 ) ) ( not ( = ?auto_207302 ?auto_207296 ) ) ( not ( = ?auto_207298 ?auto_207301 ) ) ( HOIST-AT ?auto_207297 ?auto_207298 ) ( not ( = ?auto_207303 ?auto_207297 ) ) ( AVAILABLE ?auto_207297 ) ( SURFACE-AT ?auto_207296 ?auto_207298 ) ( ON ?auto_207296 ?auto_207299 ) ( CLEAR ?auto_207296 ) ( not ( = ?auto_207295 ?auto_207299 ) ) ( not ( = ?auto_207296 ?auto_207299 ) ) ( not ( = ?auto_207302 ?auto_207299 ) ) ( SURFACE-AT ?auto_207302 ?auto_207301 ) ( CLEAR ?auto_207302 ) ( IS-CRATE ?auto_207295 ) ( AVAILABLE ?auto_207303 ) ( IN ?auto_207295 ?auto_207300 ) ( TRUCK-AT ?auto_207300 ?auto_207298 ) )
    :subtasks
    ( ( !DRIVE ?auto_207300 ?auto_207298 ?auto_207301 )
      ( MAKE-2CRATE ?auto_207302 ?auto_207295 ?auto_207296 )
      ( MAKE-1CRATE-VERIFY ?auto_207295 ?auto_207296 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_207304 - SURFACE
      ?auto_207305 - SURFACE
      ?auto_207306 - SURFACE
    )
    :vars
    (
      ?auto_207308 - HOIST
      ?auto_207307 - PLACE
      ?auto_207309 - PLACE
      ?auto_207312 - HOIST
      ?auto_207311 - SURFACE
      ?auto_207310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207308 ?auto_207307 ) ( IS-CRATE ?auto_207306 ) ( not ( = ?auto_207305 ?auto_207306 ) ) ( not ( = ?auto_207304 ?auto_207305 ) ) ( not ( = ?auto_207304 ?auto_207306 ) ) ( not ( = ?auto_207309 ?auto_207307 ) ) ( HOIST-AT ?auto_207312 ?auto_207309 ) ( not ( = ?auto_207308 ?auto_207312 ) ) ( AVAILABLE ?auto_207312 ) ( SURFACE-AT ?auto_207306 ?auto_207309 ) ( ON ?auto_207306 ?auto_207311 ) ( CLEAR ?auto_207306 ) ( not ( = ?auto_207305 ?auto_207311 ) ) ( not ( = ?auto_207306 ?auto_207311 ) ) ( not ( = ?auto_207304 ?auto_207311 ) ) ( SURFACE-AT ?auto_207304 ?auto_207307 ) ( CLEAR ?auto_207304 ) ( IS-CRATE ?auto_207305 ) ( AVAILABLE ?auto_207308 ) ( IN ?auto_207305 ?auto_207310 ) ( TRUCK-AT ?auto_207310 ?auto_207309 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207305 ?auto_207306 )
      ( MAKE-2CRATE-VERIFY ?auto_207304 ?auto_207305 ?auto_207306 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_207313 - SURFACE
      ?auto_207314 - SURFACE
      ?auto_207315 - SURFACE
      ?auto_207316 - SURFACE
    )
    :vars
    (
      ?auto_207318 - HOIST
      ?auto_207322 - PLACE
      ?auto_207319 - PLACE
      ?auto_207320 - HOIST
      ?auto_207321 - SURFACE
      ?auto_207317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207318 ?auto_207322 ) ( IS-CRATE ?auto_207316 ) ( not ( = ?auto_207315 ?auto_207316 ) ) ( not ( = ?auto_207314 ?auto_207315 ) ) ( not ( = ?auto_207314 ?auto_207316 ) ) ( not ( = ?auto_207319 ?auto_207322 ) ) ( HOIST-AT ?auto_207320 ?auto_207319 ) ( not ( = ?auto_207318 ?auto_207320 ) ) ( AVAILABLE ?auto_207320 ) ( SURFACE-AT ?auto_207316 ?auto_207319 ) ( ON ?auto_207316 ?auto_207321 ) ( CLEAR ?auto_207316 ) ( not ( = ?auto_207315 ?auto_207321 ) ) ( not ( = ?auto_207316 ?auto_207321 ) ) ( not ( = ?auto_207314 ?auto_207321 ) ) ( SURFACE-AT ?auto_207314 ?auto_207322 ) ( CLEAR ?auto_207314 ) ( IS-CRATE ?auto_207315 ) ( AVAILABLE ?auto_207318 ) ( IN ?auto_207315 ?auto_207317 ) ( TRUCK-AT ?auto_207317 ?auto_207319 ) ( ON ?auto_207314 ?auto_207313 ) ( not ( = ?auto_207313 ?auto_207314 ) ) ( not ( = ?auto_207313 ?auto_207315 ) ) ( not ( = ?auto_207313 ?auto_207316 ) ) ( not ( = ?auto_207313 ?auto_207321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207314 ?auto_207315 ?auto_207316 )
      ( MAKE-3CRATE-VERIFY ?auto_207313 ?auto_207314 ?auto_207315 ?auto_207316 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_207323 - SURFACE
      ?auto_207324 - SURFACE
      ?auto_207325 - SURFACE
      ?auto_207327 - SURFACE
      ?auto_207326 - SURFACE
    )
    :vars
    (
      ?auto_207329 - HOIST
      ?auto_207333 - PLACE
      ?auto_207330 - PLACE
      ?auto_207331 - HOIST
      ?auto_207332 - SURFACE
      ?auto_207328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207329 ?auto_207333 ) ( IS-CRATE ?auto_207326 ) ( not ( = ?auto_207327 ?auto_207326 ) ) ( not ( = ?auto_207325 ?auto_207327 ) ) ( not ( = ?auto_207325 ?auto_207326 ) ) ( not ( = ?auto_207330 ?auto_207333 ) ) ( HOIST-AT ?auto_207331 ?auto_207330 ) ( not ( = ?auto_207329 ?auto_207331 ) ) ( AVAILABLE ?auto_207331 ) ( SURFACE-AT ?auto_207326 ?auto_207330 ) ( ON ?auto_207326 ?auto_207332 ) ( CLEAR ?auto_207326 ) ( not ( = ?auto_207327 ?auto_207332 ) ) ( not ( = ?auto_207326 ?auto_207332 ) ) ( not ( = ?auto_207325 ?auto_207332 ) ) ( SURFACE-AT ?auto_207325 ?auto_207333 ) ( CLEAR ?auto_207325 ) ( IS-CRATE ?auto_207327 ) ( AVAILABLE ?auto_207329 ) ( IN ?auto_207327 ?auto_207328 ) ( TRUCK-AT ?auto_207328 ?auto_207330 ) ( ON ?auto_207324 ?auto_207323 ) ( ON ?auto_207325 ?auto_207324 ) ( not ( = ?auto_207323 ?auto_207324 ) ) ( not ( = ?auto_207323 ?auto_207325 ) ) ( not ( = ?auto_207323 ?auto_207327 ) ) ( not ( = ?auto_207323 ?auto_207326 ) ) ( not ( = ?auto_207323 ?auto_207332 ) ) ( not ( = ?auto_207324 ?auto_207325 ) ) ( not ( = ?auto_207324 ?auto_207327 ) ) ( not ( = ?auto_207324 ?auto_207326 ) ) ( not ( = ?auto_207324 ?auto_207332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207325 ?auto_207327 ?auto_207326 )
      ( MAKE-4CRATE-VERIFY ?auto_207323 ?auto_207324 ?auto_207325 ?auto_207327 ?auto_207326 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207334 - SURFACE
      ?auto_207335 - SURFACE
      ?auto_207336 - SURFACE
      ?auto_207338 - SURFACE
      ?auto_207337 - SURFACE
      ?auto_207339 - SURFACE
    )
    :vars
    (
      ?auto_207341 - HOIST
      ?auto_207345 - PLACE
      ?auto_207342 - PLACE
      ?auto_207343 - HOIST
      ?auto_207344 - SURFACE
      ?auto_207340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207341 ?auto_207345 ) ( IS-CRATE ?auto_207339 ) ( not ( = ?auto_207337 ?auto_207339 ) ) ( not ( = ?auto_207338 ?auto_207337 ) ) ( not ( = ?auto_207338 ?auto_207339 ) ) ( not ( = ?auto_207342 ?auto_207345 ) ) ( HOIST-AT ?auto_207343 ?auto_207342 ) ( not ( = ?auto_207341 ?auto_207343 ) ) ( AVAILABLE ?auto_207343 ) ( SURFACE-AT ?auto_207339 ?auto_207342 ) ( ON ?auto_207339 ?auto_207344 ) ( CLEAR ?auto_207339 ) ( not ( = ?auto_207337 ?auto_207344 ) ) ( not ( = ?auto_207339 ?auto_207344 ) ) ( not ( = ?auto_207338 ?auto_207344 ) ) ( SURFACE-AT ?auto_207338 ?auto_207345 ) ( CLEAR ?auto_207338 ) ( IS-CRATE ?auto_207337 ) ( AVAILABLE ?auto_207341 ) ( IN ?auto_207337 ?auto_207340 ) ( TRUCK-AT ?auto_207340 ?auto_207342 ) ( ON ?auto_207335 ?auto_207334 ) ( ON ?auto_207336 ?auto_207335 ) ( ON ?auto_207338 ?auto_207336 ) ( not ( = ?auto_207334 ?auto_207335 ) ) ( not ( = ?auto_207334 ?auto_207336 ) ) ( not ( = ?auto_207334 ?auto_207338 ) ) ( not ( = ?auto_207334 ?auto_207337 ) ) ( not ( = ?auto_207334 ?auto_207339 ) ) ( not ( = ?auto_207334 ?auto_207344 ) ) ( not ( = ?auto_207335 ?auto_207336 ) ) ( not ( = ?auto_207335 ?auto_207338 ) ) ( not ( = ?auto_207335 ?auto_207337 ) ) ( not ( = ?auto_207335 ?auto_207339 ) ) ( not ( = ?auto_207335 ?auto_207344 ) ) ( not ( = ?auto_207336 ?auto_207338 ) ) ( not ( = ?auto_207336 ?auto_207337 ) ) ( not ( = ?auto_207336 ?auto_207339 ) ) ( not ( = ?auto_207336 ?auto_207344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207338 ?auto_207337 ?auto_207339 )
      ( MAKE-5CRATE-VERIFY ?auto_207334 ?auto_207335 ?auto_207336 ?auto_207338 ?auto_207337 ?auto_207339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_207346 - SURFACE
      ?auto_207347 - SURFACE
    )
    :vars
    (
      ?auto_207350 - HOIST
      ?auto_207354 - PLACE
      ?auto_207348 - SURFACE
      ?auto_207351 - PLACE
      ?auto_207352 - HOIST
      ?auto_207353 - SURFACE
      ?auto_207349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207350 ?auto_207354 ) ( IS-CRATE ?auto_207347 ) ( not ( = ?auto_207346 ?auto_207347 ) ) ( not ( = ?auto_207348 ?auto_207346 ) ) ( not ( = ?auto_207348 ?auto_207347 ) ) ( not ( = ?auto_207351 ?auto_207354 ) ) ( HOIST-AT ?auto_207352 ?auto_207351 ) ( not ( = ?auto_207350 ?auto_207352 ) ) ( SURFACE-AT ?auto_207347 ?auto_207351 ) ( ON ?auto_207347 ?auto_207353 ) ( CLEAR ?auto_207347 ) ( not ( = ?auto_207346 ?auto_207353 ) ) ( not ( = ?auto_207347 ?auto_207353 ) ) ( not ( = ?auto_207348 ?auto_207353 ) ) ( SURFACE-AT ?auto_207348 ?auto_207354 ) ( CLEAR ?auto_207348 ) ( IS-CRATE ?auto_207346 ) ( AVAILABLE ?auto_207350 ) ( TRUCK-AT ?auto_207349 ?auto_207351 ) ( LIFTING ?auto_207352 ?auto_207346 ) )
    :subtasks
    ( ( !LOAD ?auto_207352 ?auto_207346 ?auto_207349 ?auto_207351 )
      ( MAKE-2CRATE ?auto_207348 ?auto_207346 ?auto_207347 )
      ( MAKE-1CRATE-VERIFY ?auto_207346 ?auto_207347 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_207355 - SURFACE
      ?auto_207356 - SURFACE
      ?auto_207357 - SURFACE
    )
    :vars
    (
      ?auto_207360 - HOIST
      ?auto_207362 - PLACE
      ?auto_207363 - PLACE
      ?auto_207361 - HOIST
      ?auto_207359 - SURFACE
      ?auto_207358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207360 ?auto_207362 ) ( IS-CRATE ?auto_207357 ) ( not ( = ?auto_207356 ?auto_207357 ) ) ( not ( = ?auto_207355 ?auto_207356 ) ) ( not ( = ?auto_207355 ?auto_207357 ) ) ( not ( = ?auto_207363 ?auto_207362 ) ) ( HOIST-AT ?auto_207361 ?auto_207363 ) ( not ( = ?auto_207360 ?auto_207361 ) ) ( SURFACE-AT ?auto_207357 ?auto_207363 ) ( ON ?auto_207357 ?auto_207359 ) ( CLEAR ?auto_207357 ) ( not ( = ?auto_207356 ?auto_207359 ) ) ( not ( = ?auto_207357 ?auto_207359 ) ) ( not ( = ?auto_207355 ?auto_207359 ) ) ( SURFACE-AT ?auto_207355 ?auto_207362 ) ( CLEAR ?auto_207355 ) ( IS-CRATE ?auto_207356 ) ( AVAILABLE ?auto_207360 ) ( TRUCK-AT ?auto_207358 ?auto_207363 ) ( LIFTING ?auto_207361 ?auto_207356 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207356 ?auto_207357 )
      ( MAKE-2CRATE-VERIFY ?auto_207355 ?auto_207356 ?auto_207357 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_207364 - SURFACE
      ?auto_207365 - SURFACE
      ?auto_207366 - SURFACE
      ?auto_207367 - SURFACE
    )
    :vars
    (
      ?auto_207370 - HOIST
      ?auto_207373 - PLACE
      ?auto_207369 - PLACE
      ?auto_207372 - HOIST
      ?auto_207371 - SURFACE
      ?auto_207368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207370 ?auto_207373 ) ( IS-CRATE ?auto_207367 ) ( not ( = ?auto_207366 ?auto_207367 ) ) ( not ( = ?auto_207365 ?auto_207366 ) ) ( not ( = ?auto_207365 ?auto_207367 ) ) ( not ( = ?auto_207369 ?auto_207373 ) ) ( HOIST-AT ?auto_207372 ?auto_207369 ) ( not ( = ?auto_207370 ?auto_207372 ) ) ( SURFACE-AT ?auto_207367 ?auto_207369 ) ( ON ?auto_207367 ?auto_207371 ) ( CLEAR ?auto_207367 ) ( not ( = ?auto_207366 ?auto_207371 ) ) ( not ( = ?auto_207367 ?auto_207371 ) ) ( not ( = ?auto_207365 ?auto_207371 ) ) ( SURFACE-AT ?auto_207365 ?auto_207373 ) ( CLEAR ?auto_207365 ) ( IS-CRATE ?auto_207366 ) ( AVAILABLE ?auto_207370 ) ( TRUCK-AT ?auto_207368 ?auto_207369 ) ( LIFTING ?auto_207372 ?auto_207366 ) ( ON ?auto_207365 ?auto_207364 ) ( not ( = ?auto_207364 ?auto_207365 ) ) ( not ( = ?auto_207364 ?auto_207366 ) ) ( not ( = ?auto_207364 ?auto_207367 ) ) ( not ( = ?auto_207364 ?auto_207371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207365 ?auto_207366 ?auto_207367 )
      ( MAKE-3CRATE-VERIFY ?auto_207364 ?auto_207365 ?auto_207366 ?auto_207367 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_207374 - SURFACE
      ?auto_207375 - SURFACE
      ?auto_207376 - SURFACE
      ?auto_207378 - SURFACE
      ?auto_207377 - SURFACE
    )
    :vars
    (
      ?auto_207381 - HOIST
      ?auto_207384 - PLACE
      ?auto_207380 - PLACE
      ?auto_207383 - HOIST
      ?auto_207382 - SURFACE
      ?auto_207379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207381 ?auto_207384 ) ( IS-CRATE ?auto_207377 ) ( not ( = ?auto_207378 ?auto_207377 ) ) ( not ( = ?auto_207376 ?auto_207378 ) ) ( not ( = ?auto_207376 ?auto_207377 ) ) ( not ( = ?auto_207380 ?auto_207384 ) ) ( HOIST-AT ?auto_207383 ?auto_207380 ) ( not ( = ?auto_207381 ?auto_207383 ) ) ( SURFACE-AT ?auto_207377 ?auto_207380 ) ( ON ?auto_207377 ?auto_207382 ) ( CLEAR ?auto_207377 ) ( not ( = ?auto_207378 ?auto_207382 ) ) ( not ( = ?auto_207377 ?auto_207382 ) ) ( not ( = ?auto_207376 ?auto_207382 ) ) ( SURFACE-AT ?auto_207376 ?auto_207384 ) ( CLEAR ?auto_207376 ) ( IS-CRATE ?auto_207378 ) ( AVAILABLE ?auto_207381 ) ( TRUCK-AT ?auto_207379 ?auto_207380 ) ( LIFTING ?auto_207383 ?auto_207378 ) ( ON ?auto_207375 ?auto_207374 ) ( ON ?auto_207376 ?auto_207375 ) ( not ( = ?auto_207374 ?auto_207375 ) ) ( not ( = ?auto_207374 ?auto_207376 ) ) ( not ( = ?auto_207374 ?auto_207378 ) ) ( not ( = ?auto_207374 ?auto_207377 ) ) ( not ( = ?auto_207374 ?auto_207382 ) ) ( not ( = ?auto_207375 ?auto_207376 ) ) ( not ( = ?auto_207375 ?auto_207378 ) ) ( not ( = ?auto_207375 ?auto_207377 ) ) ( not ( = ?auto_207375 ?auto_207382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207376 ?auto_207378 ?auto_207377 )
      ( MAKE-4CRATE-VERIFY ?auto_207374 ?auto_207375 ?auto_207376 ?auto_207378 ?auto_207377 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207385 - SURFACE
      ?auto_207386 - SURFACE
      ?auto_207387 - SURFACE
      ?auto_207389 - SURFACE
      ?auto_207388 - SURFACE
      ?auto_207390 - SURFACE
    )
    :vars
    (
      ?auto_207393 - HOIST
      ?auto_207396 - PLACE
      ?auto_207392 - PLACE
      ?auto_207395 - HOIST
      ?auto_207394 - SURFACE
      ?auto_207391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207393 ?auto_207396 ) ( IS-CRATE ?auto_207390 ) ( not ( = ?auto_207388 ?auto_207390 ) ) ( not ( = ?auto_207389 ?auto_207388 ) ) ( not ( = ?auto_207389 ?auto_207390 ) ) ( not ( = ?auto_207392 ?auto_207396 ) ) ( HOIST-AT ?auto_207395 ?auto_207392 ) ( not ( = ?auto_207393 ?auto_207395 ) ) ( SURFACE-AT ?auto_207390 ?auto_207392 ) ( ON ?auto_207390 ?auto_207394 ) ( CLEAR ?auto_207390 ) ( not ( = ?auto_207388 ?auto_207394 ) ) ( not ( = ?auto_207390 ?auto_207394 ) ) ( not ( = ?auto_207389 ?auto_207394 ) ) ( SURFACE-AT ?auto_207389 ?auto_207396 ) ( CLEAR ?auto_207389 ) ( IS-CRATE ?auto_207388 ) ( AVAILABLE ?auto_207393 ) ( TRUCK-AT ?auto_207391 ?auto_207392 ) ( LIFTING ?auto_207395 ?auto_207388 ) ( ON ?auto_207386 ?auto_207385 ) ( ON ?auto_207387 ?auto_207386 ) ( ON ?auto_207389 ?auto_207387 ) ( not ( = ?auto_207385 ?auto_207386 ) ) ( not ( = ?auto_207385 ?auto_207387 ) ) ( not ( = ?auto_207385 ?auto_207389 ) ) ( not ( = ?auto_207385 ?auto_207388 ) ) ( not ( = ?auto_207385 ?auto_207390 ) ) ( not ( = ?auto_207385 ?auto_207394 ) ) ( not ( = ?auto_207386 ?auto_207387 ) ) ( not ( = ?auto_207386 ?auto_207389 ) ) ( not ( = ?auto_207386 ?auto_207388 ) ) ( not ( = ?auto_207386 ?auto_207390 ) ) ( not ( = ?auto_207386 ?auto_207394 ) ) ( not ( = ?auto_207387 ?auto_207389 ) ) ( not ( = ?auto_207387 ?auto_207388 ) ) ( not ( = ?auto_207387 ?auto_207390 ) ) ( not ( = ?auto_207387 ?auto_207394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207389 ?auto_207388 ?auto_207390 )
      ( MAKE-5CRATE-VERIFY ?auto_207385 ?auto_207386 ?auto_207387 ?auto_207389 ?auto_207388 ?auto_207390 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_207397 - SURFACE
      ?auto_207398 - SURFACE
    )
    :vars
    (
      ?auto_207402 - HOIST
      ?auto_207405 - PLACE
      ?auto_207401 - SURFACE
      ?auto_207400 - PLACE
      ?auto_207404 - HOIST
      ?auto_207403 - SURFACE
      ?auto_207399 - TRUCK
      ?auto_207406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207402 ?auto_207405 ) ( IS-CRATE ?auto_207398 ) ( not ( = ?auto_207397 ?auto_207398 ) ) ( not ( = ?auto_207401 ?auto_207397 ) ) ( not ( = ?auto_207401 ?auto_207398 ) ) ( not ( = ?auto_207400 ?auto_207405 ) ) ( HOIST-AT ?auto_207404 ?auto_207400 ) ( not ( = ?auto_207402 ?auto_207404 ) ) ( SURFACE-AT ?auto_207398 ?auto_207400 ) ( ON ?auto_207398 ?auto_207403 ) ( CLEAR ?auto_207398 ) ( not ( = ?auto_207397 ?auto_207403 ) ) ( not ( = ?auto_207398 ?auto_207403 ) ) ( not ( = ?auto_207401 ?auto_207403 ) ) ( SURFACE-AT ?auto_207401 ?auto_207405 ) ( CLEAR ?auto_207401 ) ( IS-CRATE ?auto_207397 ) ( AVAILABLE ?auto_207402 ) ( TRUCK-AT ?auto_207399 ?auto_207400 ) ( AVAILABLE ?auto_207404 ) ( SURFACE-AT ?auto_207397 ?auto_207400 ) ( ON ?auto_207397 ?auto_207406 ) ( CLEAR ?auto_207397 ) ( not ( = ?auto_207397 ?auto_207406 ) ) ( not ( = ?auto_207398 ?auto_207406 ) ) ( not ( = ?auto_207401 ?auto_207406 ) ) ( not ( = ?auto_207403 ?auto_207406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_207404 ?auto_207397 ?auto_207406 ?auto_207400 )
      ( MAKE-2CRATE ?auto_207401 ?auto_207397 ?auto_207398 )
      ( MAKE-1CRATE-VERIFY ?auto_207397 ?auto_207398 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_207407 - SURFACE
      ?auto_207408 - SURFACE
      ?auto_207409 - SURFACE
    )
    :vars
    (
      ?auto_207411 - HOIST
      ?auto_207414 - PLACE
      ?auto_207412 - PLACE
      ?auto_207416 - HOIST
      ?auto_207415 - SURFACE
      ?auto_207410 - TRUCK
      ?auto_207413 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207411 ?auto_207414 ) ( IS-CRATE ?auto_207409 ) ( not ( = ?auto_207408 ?auto_207409 ) ) ( not ( = ?auto_207407 ?auto_207408 ) ) ( not ( = ?auto_207407 ?auto_207409 ) ) ( not ( = ?auto_207412 ?auto_207414 ) ) ( HOIST-AT ?auto_207416 ?auto_207412 ) ( not ( = ?auto_207411 ?auto_207416 ) ) ( SURFACE-AT ?auto_207409 ?auto_207412 ) ( ON ?auto_207409 ?auto_207415 ) ( CLEAR ?auto_207409 ) ( not ( = ?auto_207408 ?auto_207415 ) ) ( not ( = ?auto_207409 ?auto_207415 ) ) ( not ( = ?auto_207407 ?auto_207415 ) ) ( SURFACE-AT ?auto_207407 ?auto_207414 ) ( CLEAR ?auto_207407 ) ( IS-CRATE ?auto_207408 ) ( AVAILABLE ?auto_207411 ) ( TRUCK-AT ?auto_207410 ?auto_207412 ) ( AVAILABLE ?auto_207416 ) ( SURFACE-AT ?auto_207408 ?auto_207412 ) ( ON ?auto_207408 ?auto_207413 ) ( CLEAR ?auto_207408 ) ( not ( = ?auto_207408 ?auto_207413 ) ) ( not ( = ?auto_207409 ?auto_207413 ) ) ( not ( = ?auto_207407 ?auto_207413 ) ) ( not ( = ?auto_207415 ?auto_207413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207408 ?auto_207409 )
      ( MAKE-2CRATE-VERIFY ?auto_207407 ?auto_207408 ?auto_207409 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_207417 - SURFACE
      ?auto_207418 - SURFACE
      ?auto_207419 - SURFACE
      ?auto_207420 - SURFACE
    )
    :vars
    (
      ?auto_207424 - HOIST
      ?auto_207425 - PLACE
      ?auto_207427 - PLACE
      ?auto_207423 - HOIST
      ?auto_207422 - SURFACE
      ?auto_207421 - TRUCK
      ?auto_207426 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207424 ?auto_207425 ) ( IS-CRATE ?auto_207420 ) ( not ( = ?auto_207419 ?auto_207420 ) ) ( not ( = ?auto_207418 ?auto_207419 ) ) ( not ( = ?auto_207418 ?auto_207420 ) ) ( not ( = ?auto_207427 ?auto_207425 ) ) ( HOIST-AT ?auto_207423 ?auto_207427 ) ( not ( = ?auto_207424 ?auto_207423 ) ) ( SURFACE-AT ?auto_207420 ?auto_207427 ) ( ON ?auto_207420 ?auto_207422 ) ( CLEAR ?auto_207420 ) ( not ( = ?auto_207419 ?auto_207422 ) ) ( not ( = ?auto_207420 ?auto_207422 ) ) ( not ( = ?auto_207418 ?auto_207422 ) ) ( SURFACE-AT ?auto_207418 ?auto_207425 ) ( CLEAR ?auto_207418 ) ( IS-CRATE ?auto_207419 ) ( AVAILABLE ?auto_207424 ) ( TRUCK-AT ?auto_207421 ?auto_207427 ) ( AVAILABLE ?auto_207423 ) ( SURFACE-AT ?auto_207419 ?auto_207427 ) ( ON ?auto_207419 ?auto_207426 ) ( CLEAR ?auto_207419 ) ( not ( = ?auto_207419 ?auto_207426 ) ) ( not ( = ?auto_207420 ?auto_207426 ) ) ( not ( = ?auto_207418 ?auto_207426 ) ) ( not ( = ?auto_207422 ?auto_207426 ) ) ( ON ?auto_207418 ?auto_207417 ) ( not ( = ?auto_207417 ?auto_207418 ) ) ( not ( = ?auto_207417 ?auto_207419 ) ) ( not ( = ?auto_207417 ?auto_207420 ) ) ( not ( = ?auto_207417 ?auto_207422 ) ) ( not ( = ?auto_207417 ?auto_207426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207418 ?auto_207419 ?auto_207420 )
      ( MAKE-3CRATE-VERIFY ?auto_207417 ?auto_207418 ?auto_207419 ?auto_207420 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_207428 - SURFACE
      ?auto_207429 - SURFACE
      ?auto_207430 - SURFACE
      ?auto_207432 - SURFACE
      ?auto_207431 - SURFACE
    )
    :vars
    (
      ?auto_207436 - HOIST
      ?auto_207437 - PLACE
      ?auto_207439 - PLACE
      ?auto_207435 - HOIST
      ?auto_207434 - SURFACE
      ?auto_207433 - TRUCK
      ?auto_207438 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207436 ?auto_207437 ) ( IS-CRATE ?auto_207431 ) ( not ( = ?auto_207432 ?auto_207431 ) ) ( not ( = ?auto_207430 ?auto_207432 ) ) ( not ( = ?auto_207430 ?auto_207431 ) ) ( not ( = ?auto_207439 ?auto_207437 ) ) ( HOIST-AT ?auto_207435 ?auto_207439 ) ( not ( = ?auto_207436 ?auto_207435 ) ) ( SURFACE-AT ?auto_207431 ?auto_207439 ) ( ON ?auto_207431 ?auto_207434 ) ( CLEAR ?auto_207431 ) ( not ( = ?auto_207432 ?auto_207434 ) ) ( not ( = ?auto_207431 ?auto_207434 ) ) ( not ( = ?auto_207430 ?auto_207434 ) ) ( SURFACE-AT ?auto_207430 ?auto_207437 ) ( CLEAR ?auto_207430 ) ( IS-CRATE ?auto_207432 ) ( AVAILABLE ?auto_207436 ) ( TRUCK-AT ?auto_207433 ?auto_207439 ) ( AVAILABLE ?auto_207435 ) ( SURFACE-AT ?auto_207432 ?auto_207439 ) ( ON ?auto_207432 ?auto_207438 ) ( CLEAR ?auto_207432 ) ( not ( = ?auto_207432 ?auto_207438 ) ) ( not ( = ?auto_207431 ?auto_207438 ) ) ( not ( = ?auto_207430 ?auto_207438 ) ) ( not ( = ?auto_207434 ?auto_207438 ) ) ( ON ?auto_207429 ?auto_207428 ) ( ON ?auto_207430 ?auto_207429 ) ( not ( = ?auto_207428 ?auto_207429 ) ) ( not ( = ?auto_207428 ?auto_207430 ) ) ( not ( = ?auto_207428 ?auto_207432 ) ) ( not ( = ?auto_207428 ?auto_207431 ) ) ( not ( = ?auto_207428 ?auto_207434 ) ) ( not ( = ?auto_207428 ?auto_207438 ) ) ( not ( = ?auto_207429 ?auto_207430 ) ) ( not ( = ?auto_207429 ?auto_207432 ) ) ( not ( = ?auto_207429 ?auto_207431 ) ) ( not ( = ?auto_207429 ?auto_207434 ) ) ( not ( = ?auto_207429 ?auto_207438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207430 ?auto_207432 ?auto_207431 )
      ( MAKE-4CRATE-VERIFY ?auto_207428 ?auto_207429 ?auto_207430 ?auto_207432 ?auto_207431 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207440 - SURFACE
      ?auto_207441 - SURFACE
      ?auto_207442 - SURFACE
      ?auto_207444 - SURFACE
      ?auto_207443 - SURFACE
      ?auto_207445 - SURFACE
    )
    :vars
    (
      ?auto_207449 - HOIST
      ?auto_207450 - PLACE
      ?auto_207452 - PLACE
      ?auto_207448 - HOIST
      ?auto_207447 - SURFACE
      ?auto_207446 - TRUCK
      ?auto_207451 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207449 ?auto_207450 ) ( IS-CRATE ?auto_207445 ) ( not ( = ?auto_207443 ?auto_207445 ) ) ( not ( = ?auto_207444 ?auto_207443 ) ) ( not ( = ?auto_207444 ?auto_207445 ) ) ( not ( = ?auto_207452 ?auto_207450 ) ) ( HOIST-AT ?auto_207448 ?auto_207452 ) ( not ( = ?auto_207449 ?auto_207448 ) ) ( SURFACE-AT ?auto_207445 ?auto_207452 ) ( ON ?auto_207445 ?auto_207447 ) ( CLEAR ?auto_207445 ) ( not ( = ?auto_207443 ?auto_207447 ) ) ( not ( = ?auto_207445 ?auto_207447 ) ) ( not ( = ?auto_207444 ?auto_207447 ) ) ( SURFACE-AT ?auto_207444 ?auto_207450 ) ( CLEAR ?auto_207444 ) ( IS-CRATE ?auto_207443 ) ( AVAILABLE ?auto_207449 ) ( TRUCK-AT ?auto_207446 ?auto_207452 ) ( AVAILABLE ?auto_207448 ) ( SURFACE-AT ?auto_207443 ?auto_207452 ) ( ON ?auto_207443 ?auto_207451 ) ( CLEAR ?auto_207443 ) ( not ( = ?auto_207443 ?auto_207451 ) ) ( not ( = ?auto_207445 ?auto_207451 ) ) ( not ( = ?auto_207444 ?auto_207451 ) ) ( not ( = ?auto_207447 ?auto_207451 ) ) ( ON ?auto_207441 ?auto_207440 ) ( ON ?auto_207442 ?auto_207441 ) ( ON ?auto_207444 ?auto_207442 ) ( not ( = ?auto_207440 ?auto_207441 ) ) ( not ( = ?auto_207440 ?auto_207442 ) ) ( not ( = ?auto_207440 ?auto_207444 ) ) ( not ( = ?auto_207440 ?auto_207443 ) ) ( not ( = ?auto_207440 ?auto_207445 ) ) ( not ( = ?auto_207440 ?auto_207447 ) ) ( not ( = ?auto_207440 ?auto_207451 ) ) ( not ( = ?auto_207441 ?auto_207442 ) ) ( not ( = ?auto_207441 ?auto_207444 ) ) ( not ( = ?auto_207441 ?auto_207443 ) ) ( not ( = ?auto_207441 ?auto_207445 ) ) ( not ( = ?auto_207441 ?auto_207447 ) ) ( not ( = ?auto_207441 ?auto_207451 ) ) ( not ( = ?auto_207442 ?auto_207444 ) ) ( not ( = ?auto_207442 ?auto_207443 ) ) ( not ( = ?auto_207442 ?auto_207445 ) ) ( not ( = ?auto_207442 ?auto_207447 ) ) ( not ( = ?auto_207442 ?auto_207451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207444 ?auto_207443 ?auto_207445 )
      ( MAKE-5CRATE-VERIFY ?auto_207440 ?auto_207441 ?auto_207442 ?auto_207444 ?auto_207443 ?auto_207445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_207453 - SURFACE
      ?auto_207454 - SURFACE
    )
    :vars
    (
      ?auto_207458 - HOIST
      ?auto_207459 - PLACE
      ?auto_207460 - SURFACE
      ?auto_207462 - PLACE
      ?auto_207457 - HOIST
      ?auto_207456 - SURFACE
      ?auto_207461 - SURFACE
      ?auto_207455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207458 ?auto_207459 ) ( IS-CRATE ?auto_207454 ) ( not ( = ?auto_207453 ?auto_207454 ) ) ( not ( = ?auto_207460 ?auto_207453 ) ) ( not ( = ?auto_207460 ?auto_207454 ) ) ( not ( = ?auto_207462 ?auto_207459 ) ) ( HOIST-AT ?auto_207457 ?auto_207462 ) ( not ( = ?auto_207458 ?auto_207457 ) ) ( SURFACE-AT ?auto_207454 ?auto_207462 ) ( ON ?auto_207454 ?auto_207456 ) ( CLEAR ?auto_207454 ) ( not ( = ?auto_207453 ?auto_207456 ) ) ( not ( = ?auto_207454 ?auto_207456 ) ) ( not ( = ?auto_207460 ?auto_207456 ) ) ( SURFACE-AT ?auto_207460 ?auto_207459 ) ( CLEAR ?auto_207460 ) ( IS-CRATE ?auto_207453 ) ( AVAILABLE ?auto_207458 ) ( AVAILABLE ?auto_207457 ) ( SURFACE-AT ?auto_207453 ?auto_207462 ) ( ON ?auto_207453 ?auto_207461 ) ( CLEAR ?auto_207453 ) ( not ( = ?auto_207453 ?auto_207461 ) ) ( not ( = ?auto_207454 ?auto_207461 ) ) ( not ( = ?auto_207460 ?auto_207461 ) ) ( not ( = ?auto_207456 ?auto_207461 ) ) ( TRUCK-AT ?auto_207455 ?auto_207459 ) )
    :subtasks
    ( ( !DRIVE ?auto_207455 ?auto_207459 ?auto_207462 )
      ( MAKE-2CRATE ?auto_207460 ?auto_207453 ?auto_207454 )
      ( MAKE-1CRATE-VERIFY ?auto_207453 ?auto_207454 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_207463 - SURFACE
      ?auto_207464 - SURFACE
      ?auto_207465 - SURFACE
    )
    :vars
    (
      ?auto_207472 - HOIST
      ?auto_207471 - PLACE
      ?auto_207468 - PLACE
      ?auto_207469 - HOIST
      ?auto_207466 - SURFACE
      ?auto_207470 - SURFACE
      ?auto_207467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207472 ?auto_207471 ) ( IS-CRATE ?auto_207465 ) ( not ( = ?auto_207464 ?auto_207465 ) ) ( not ( = ?auto_207463 ?auto_207464 ) ) ( not ( = ?auto_207463 ?auto_207465 ) ) ( not ( = ?auto_207468 ?auto_207471 ) ) ( HOIST-AT ?auto_207469 ?auto_207468 ) ( not ( = ?auto_207472 ?auto_207469 ) ) ( SURFACE-AT ?auto_207465 ?auto_207468 ) ( ON ?auto_207465 ?auto_207466 ) ( CLEAR ?auto_207465 ) ( not ( = ?auto_207464 ?auto_207466 ) ) ( not ( = ?auto_207465 ?auto_207466 ) ) ( not ( = ?auto_207463 ?auto_207466 ) ) ( SURFACE-AT ?auto_207463 ?auto_207471 ) ( CLEAR ?auto_207463 ) ( IS-CRATE ?auto_207464 ) ( AVAILABLE ?auto_207472 ) ( AVAILABLE ?auto_207469 ) ( SURFACE-AT ?auto_207464 ?auto_207468 ) ( ON ?auto_207464 ?auto_207470 ) ( CLEAR ?auto_207464 ) ( not ( = ?auto_207464 ?auto_207470 ) ) ( not ( = ?auto_207465 ?auto_207470 ) ) ( not ( = ?auto_207463 ?auto_207470 ) ) ( not ( = ?auto_207466 ?auto_207470 ) ) ( TRUCK-AT ?auto_207467 ?auto_207471 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207464 ?auto_207465 )
      ( MAKE-2CRATE-VERIFY ?auto_207463 ?auto_207464 ?auto_207465 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_207473 - SURFACE
      ?auto_207474 - SURFACE
      ?auto_207475 - SURFACE
      ?auto_207476 - SURFACE
    )
    :vars
    (
      ?auto_207479 - HOIST
      ?auto_207480 - PLACE
      ?auto_207477 - PLACE
      ?auto_207483 - HOIST
      ?auto_207482 - SURFACE
      ?auto_207481 - SURFACE
      ?auto_207478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207479 ?auto_207480 ) ( IS-CRATE ?auto_207476 ) ( not ( = ?auto_207475 ?auto_207476 ) ) ( not ( = ?auto_207474 ?auto_207475 ) ) ( not ( = ?auto_207474 ?auto_207476 ) ) ( not ( = ?auto_207477 ?auto_207480 ) ) ( HOIST-AT ?auto_207483 ?auto_207477 ) ( not ( = ?auto_207479 ?auto_207483 ) ) ( SURFACE-AT ?auto_207476 ?auto_207477 ) ( ON ?auto_207476 ?auto_207482 ) ( CLEAR ?auto_207476 ) ( not ( = ?auto_207475 ?auto_207482 ) ) ( not ( = ?auto_207476 ?auto_207482 ) ) ( not ( = ?auto_207474 ?auto_207482 ) ) ( SURFACE-AT ?auto_207474 ?auto_207480 ) ( CLEAR ?auto_207474 ) ( IS-CRATE ?auto_207475 ) ( AVAILABLE ?auto_207479 ) ( AVAILABLE ?auto_207483 ) ( SURFACE-AT ?auto_207475 ?auto_207477 ) ( ON ?auto_207475 ?auto_207481 ) ( CLEAR ?auto_207475 ) ( not ( = ?auto_207475 ?auto_207481 ) ) ( not ( = ?auto_207476 ?auto_207481 ) ) ( not ( = ?auto_207474 ?auto_207481 ) ) ( not ( = ?auto_207482 ?auto_207481 ) ) ( TRUCK-AT ?auto_207478 ?auto_207480 ) ( ON ?auto_207474 ?auto_207473 ) ( not ( = ?auto_207473 ?auto_207474 ) ) ( not ( = ?auto_207473 ?auto_207475 ) ) ( not ( = ?auto_207473 ?auto_207476 ) ) ( not ( = ?auto_207473 ?auto_207482 ) ) ( not ( = ?auto_207473 ?auto_207481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207474 ?auto_207475 ?auto_207476 )
      ( MAKE-3CRATE-VERIFY ?auto_207473 ?auto_207474 ?auto_207475 ?auto_207476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_207484 - SURFACE
      ?auto_207485 - SURFACE
      ?auto_207486 - SURFACE
      ?auto_207488 - SURFACE
      ?auto_207487 - SURFACE
    )
    :vars
    (
      ?auto_207491 - HOIST
      ?auto_207492 - PLACE
      ?auto_207489 - PLACE
      ?auto_207495 - HOIST
      ?auto_207494 - SURFACE
      ?auto_207493 - SURFACE
      ?auto_207490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207491 ?auto_207492 ) ( IS-CRATE ?auto_207487 ) ( not ( = ?auto_207488 ?auto_207487 ) ) ( not ( = ?auto_207486 ?auto_207488 ) ) ( not ( = ?auto_207486 ?auto_207487 ) ) ( not ( = ?auto_207489 ?auto_207492 ) ) ( HOIST-AT ?auto_207495 ?auto_207489 ) ( not ( = ?auto_207491 ?auto_207495 ) ) ( SURFACE-AT ?auto_207487 ?auto_207489 ) ( ON ?auto_207487 ?auto_207494 ) ( CLEAR ?auto_207487 ) ( not ( = ?auto_207488 ?auto_207494 ) ) ( not ( = ?auto_207487 ?auto_207494 ) ) ( not ( = ?auto_207486 ?auto_207494 ) ) ( SURFACE-AT ?auto_207486 ?auto_207492 ) ( CLEAR ?auto_207486 ) ( IS-CRATE ?auto_207488 ) ( AVAILABLE ?auto_207491 ) ( AVAILABLE ?auto_207495 ) ( SURFACE-AT ?auto_207488 ?auto_207489 ) ( ON ?auto_207488 ?auto_207493 ) ( CLEAR ?auto_207488 ) ( not ( = ?auto_207488 ?auto_207493 ) ) ( not ( = ?auto_207487 ?auto_207493 ) ) ( not ( = ?auto_207486 ?auto_207493 ) ) ( not ( = ?auto_207494 ?auto_207493 ) ) ( TRUCK-AT ?auto_207490 ?auto_207492 ) ( ON ?auto_207485 ?auto_207484 ) ( ON ?auto_207486 ?auto_207485 ) ( not ( = ?auto_207484 ?auto_207485 ) ) ( not ( = ?auto_207484 ?auto_207486 ) ) ( not ( = ?auto_207484 ?auto_207488 ) ) ( not ( = ?auto_207484 ?auto_207487 ) ) ( not ( = ?auto_207484 ?auto_207494 ) ) ( not ( = ?auto_207484 ?auto_207493 ) ) ( not ( = ?auto_207485 ?auto_207486 ) ) ( not ( = ?auto_207485 ?auto_207488 ) ) ( not ( = ?auto_207485 ?auto_207487 ) ) ( not ( = ?auto_207485 ?auto_207494 ) ) ( not ( = ?auto_207485 ?auto_207493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207486 ?auto_207488 ?auto_207487 )
      ( MAKE-4CRATE-VERIFY ?auto_207484 ?auto_207485 ?auto_207486 ?auto_207488 ?auto_207487 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207496 - SURFACE
      ?auto_207497 - SURFACE
      ?auto_207498 - SURFACE
      ?auto_207500 - SURFACE
      ?auto_207499 - SURFACE
      ?auto_207501 - SURFACE
    )
    :vars
    (
      ?auto_207504 - HOIST
      ?auto_207505 - PLACE
      ?auto_207502 - PLACE
      ?auto_207508 - HOIST
      ?auto_207507 - SURFACE
      ?auto_207506 - SURFACE
      ?auto_207503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207504 ?auto_207505 ) ( IS-CRATE ?auto_207501 ) ( not ( = ?auto_207499 ?auto_207501 ) ) ( not ( = ?auto_207500 ?auto_207499 ) ) ( not ( = ?auto_207500 ?auto_207501 ) ) ( not ( = ?auto_207502 ?auto_207505 ) ) ( HOIST-AT ?auto_207508 ?auto_207502 ) ( not ( = ?auto_207504 ?auto_207508 ) ) ( SURFACE-AT ?auto_207501 ?auto_207502 ) ( ON ?auto_207501 ?auto_207507 ) ( CLEAR ?auto_207501 ) ( not ( = ?auto_207499 ?auto_207507 ) ) ( not ( = ?auto_207501 ?auto_207507 ) ) ( not ( = ?auto_207500 ?auto_207507 ) ) ( SURFACE-AT ?auto_207500 ?auto_207505 ) ( CLEAR ?auto_207500 ) ( IS-CRATE ?auto_207499 ) ( AVAILABLE ?auto_207504 ) ( AVAILABLE ?auto_207508 ) ( SURFACE-AT ?auto_207499 ?auto_207502 ) ( ON ?auto_207499 ?auto_207506 ) ( CLEAR ?auto_207499 ) ( not ( = ?auto_207499 ?auto_207506 ) ) ( not ( = ?auto_207501 ?auto_207506 ) ) ( not ( = ?auto_207500 ?auto_207506 ) ) ( not ( = ?auto_207507 ?auto_207506 ) ) ( TRUCK-AT ?auto_207503 ?auto_207505 ) ( ON ?auto_207497 ?auto_207496 ) ( ON ?auto_207498 ?auto_207497 ) ( ON ?auto_207500 ?auto_207498 ) ( not ( = ?auto_207496 ?auto_207497 ) ) ( not ( = ?auto_207496 ?auto_207498 ) ) ( not ( = ?auto_207496 ?auto_207500 ) ) ( not ( = ?auto_207496 ?auto_207499 ) ) ( not ( = ?auto_207496 ?auto_207501 ) ) ( not ( = ?auto_207496 ?auto_207507 ) ) ( not ( = ?auto_207496 ?auto_207506 ) ) ( not ( = ?auto_207497 ?auto_207498 ) ) ( not ( = ?auto_207497 ?auto_207500 ) ) ( not ( = ?auto_207497 ?auto_207499 ) ) ( not ( = ?auto_207497 ?auto_207501 ) ) ( not ( = ?auto_207497 ?auto_207507 ) ) ( not ( = ?auto_207497 ?auto_207506 ) ) ( not ( = ?auto_207498 ?auto_207500 ) ) ( not ( = ?auto_207498 ?auto_207499 ) ) ( not ( = ?auto_207498 ?auto_207501 ) ) ( not ( = ?auto_207498 ?auto_207507 ) ) ( not ( = ?auto_207498 ?auto_207506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207500 ?auto_207499 ?auto_207501 )
      ( MAKE-5CRATE-VERIFY ?auto_207496 ?auto_207497 ?auto_207498 ?auto_207500 ?auto_207499 ?auto_207501 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_207509 - SURFACE
      ?auto_207510 - SURFACE
    )
    :vars
    (
      ?auto_207513 - HOIST
      ?auto_207514 - PLACE
      ?auto_207515 - SURFACE
      ?auto_207511 - PLACE
      ?auto_207518 - HOIST
      ?auto_207517 - SURFACE
      ?auto_207516 - SURFACE
      ?auto_207512 - TRUCK
      ?auto_207519 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207513 ?auto_207514 ) ( IS-CRATE ?auto_207510 ) ( not ( = ?auto_207509 ?auto_207510 ) ) ( not ( = ?auto_207515 ?auto_207509 ) ) ( not ( = ?auto_207515 ?auto_207510 ) ) ( not ( = ?auto_207511 ?auto_207514 ) ) ( HOIST-AT ?auto_207518 ?auto_207511 ) ( not ( = ?auto_207513 ?auto_207518 ) ) ( SURFACE-AT ?auto_207510 ?auto_207511 ) ( ON ?auto_207510 ?auto_207517 ) ( CLEAR ?auto_207510 ) ( not ( = ?auto_207509 ?auto_207517 ) ) ( not ( = ?auto_207510 ?auto_207517 ) ) ( not ( = ?auto_207515 ?auto_207517 ) ) ( IS-CRATE ?auto_207509 ) ( AVAILABLE ?auto_207518 ) ( SURFACE-AT ?auto_207509 ?auto_207511 ) ( ON ?auto_207509 ?auto_207516 ) ( CLEAR ?auto_207509 ) ( not ( = ?auto_207509 ?auto_207516 ) ) ( not ( = ?auto_207510 ?auto_207516 ) ) ( not ( = ?auto_207515 ?auto_207516 ) ) ( not ( = ?auto_207517 ?auto_207516 ) ) ( TRUCK-AT ?auto_207512 ?auto_207514 ) ( SURFACE-AT ?auto_207519 ?auto_207514 ) ( CLEAR ?auto_207519 ) ( LIFTING ?auto_207513 ?auto_207515 ) ( IS-CRATE ?auto_207515 ) ( not ( = ?auto_207519 ?auto_207515 ) ) ( not ( = ?auto_207509 ?auto_207519 ) ) ( not ( = ?auto_207510 ?auto_207519 ) ) ( not ( = ?auto_207517 ?auto_207519 ) ) ( not ( = ?auto_207516 ?auto_207519 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207519 ?auto_207515 )
      ( MAKE-2CRATE ?auto_207515 ?auto_207509 ?auto_207510 )
      ( MAKE-1CRATE-VERIFY ?auto_207509 ?auto_207510 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_207520 - SURFACE
      ?auto_207521 - SURFACE
      ?auto_207522 - SURFACE
    )
    :vars
    (
      ?auto_207525 - HOIST
      ?auto_207523 - PLACE
      ?auto_207524 - PLACE
      ?auto_207527 - HOIST
      ?auto_207529 - SURFACE
      ?auto_207526 - SURFACE
      ?auto_207530 - TRUCK
      ?auto_207528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_207525 ?auto_207523 ) ( IS-CRATE ?auto_207522 ) ( not ( = ?auto_207521 ?auto_207522 ) ) ( not ( = ?auto_207520 ?auto_207521 ) ) ( not ( = ?auto_207520 ?auto_207522 ) ) ( not ( = ?auto_207524 ?auto_207523 ) ) ( HOIST-AT ?auto_207527 ?auto_207524 ) ( not ( = ?auto_207525 ?auto_207527 ) ) ( SURFACE-AT ?auto_207522 ?auto_207524 ) ( ON ?auto_207522 ?auto_207529 ) ( CLEAR ?auto_207522 ) ( not ( = ?auto_207521 ?auto_207529 ) ) ( not ( = ?auto_207522 ?auto_207529 ) ) ( not ( = ?auto_207520 ?auto_207529 ) ) ( IS-CRATE ?auto_207521 ) ( AVAILABLE ?auto_207527 ) ( SURFACE-AT ?auto_207521 ?auto_207524 ) ( ON ?auto_207521 ?auto_207526 ) ( CLEAR ?auto_207521 ) ( not ( = ?auto_207521 ?auto_207526 ) ) ( not ( = ?auto_207522 ?auto_207526 ) ) ( not ( = ?auto_207520 ?auto_207526 ) ) ( not ( = ?auto_207529 ?auto_207526 ) ) ( TRUCK-AT ?auto_207530 ?auto_207523 ) ( SURFACE-AT ?auto_207528 ?auto_207523 ) ( CLEAR ?auto_207528 ) ( LIFTING ?auto_207525 ?auto_207520 ) ( IS-CRATE ?auto_207520 ) ( not ( = ?auto_207528 ?auto_207520 ) ) ( not ( = ?auto_207521 ?auto_207528 ) ) ( not ( = ?auto_207522 ?auto_207528 ) ) ( not ( = ?auto_207529 ?auto_207528 ) ) ( not ( = ?auto_207526 ?auto_207528 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_207521 ?auto_207522 )
      ( MAKE-2CRATE-VERIFY ?auto_207520 ?auto_207521 ?auto_207522 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_207531 - SURFACE
      ?auto_207532 - SURFACE
      ?auto_207533 - SURFACE
      ?auto_207534 - SURFACE
    )
    :vars
    (
      ?auto_207537 - HOIST
      ?auto_207540 - PLACE
      ?auto_207539 - PLACE
      ?auto_207538 - HOIST
      ?auto_207535 - SURFACE
      ?auto_207536 - SURFACE
      ?auto_207541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207537 ?auto_207540 ) ( IS-CRATE ?auto_207534 ) ( not ( = ?auto_207533 ?auto_207534 ) ) ( not ( = ?auto_207532 ?auto_207533 ) ) ( not ( = ?auto_207532 ?auto_207534 ) ) ( not ( = ?auto_207539 ?auto_207540 ) ) ( HOIST-AT ?auto_207538 ?auto_207539 ) ( not ( = ?auto_207537 ?auto_207538 ) ) ( SURFACE-AT ?auto_207534 ?auto_207539 ) ( ON ?auto_207534 ?auto_207535 ) ( CLEAR ?auto_207534 ) ( not ( = ?auto_207533 ?auto_207535 ) ) ( not ( = ?auto_207534 ?auto_207535 ) ) ( not ( = ?auto_207532 ?auto_207535 ) ) ( IS-CRATE ?auto_207533 ) ( AVAILABLE ?auto_207538 ) ( SURFACE-AT ?auto_207533 ?auto_207539 ) ( ON ?auto_207533 ?auto_207536 ) ( CLEAR ?auto_207533 ) ( not ( = ?auto_207533 ?auto_207536 ) ) ( not ( = ?auto_207534 ?auto_207536 ) ) ( not ( = ?auto_207532 ?auto_207536 ) ) ( not ( = ?auto_207535 ?auto_207536 ) ) ( TRUCK-AT ?auto_207541 ?auto_207540 ) ( SURFACE-AT ?auto_207531 ?auto_207540 ) ( CLEAR ?auto_207531 ) ( LIFTING ?auto_207537 ?auto_207532 ) ( IS-CRATE ?auto_207532 ) ( not ( = ?auto_207531 ?auto_207532 ) ) ( not ( = ?auto_207533 ?auto_207531 ) ) ( not ( = ?auto_207534 ?auto_207531 ) ) ( not ( = ?auto_207535 ?auto_207531 ) ) ( not ( = ?auto_207536 ?auto_207531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207532 ?auto_207533 ?auto_207534 )
      ( MAKE-3CRATE-VERIFY ?auto_207531 ?auto_207532 ?auto_207533 ?auto_207534 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_207542 - SURFACE
      ?auto_207543 - SURFACE
      ?auto_207544 - SURFACE
      ?auto_207546 - SURFACE
      ?auto_207545 - SURFACE
    )
    :vars
    (
      ?auto_207549 - HOIST
      ?auto_207552 - PLACE
      ?auto_207551 - PLACE
      ?auto_207550 - HOIST
      ?auto_207547 - SURFACE
      ?auto_207548 - SURFACE
      ?auto_207553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207549 ?auto_207552 ) ( IS-CRATE ?auto_207545 ) ( not ( = ?auto_207546 ?auto_207545 ) ) ( not ( = ?auto_207544 ?auto_207546 ) ) ( not ( = ?auto_207544 ?auto_207545 ) ) ( not ( = ?auto_207551 ?auto_207552 ) ) ( HOIST-AT ?auto_207550 ?auto_207551 ) ( not ( = ?auto_207549 ?auto_207550 ) ) ( SURFACE-AT ?auto_207545 ?auto_207551 ) ( ON ?auto_207545 ?auto_207547 ) ( CLEAR ?auto_207545 ) ( not ( = ?auto_207546 ?auto_207547 ) ) ( not ( = ?auto_207545 ?auto_207547 ) ) ( not ( = ?auto_207544 ?auto_207547 ) ) ( IS-CRATE ?auto_207546 ) ( AVAILABLE ?auto_207550 ) ( SURFACE-AT ?auto_207546 ?auto_207551 ) ( ON ?auto_207546 ?auto_207548 ) ( CLEAR ?auto_207546 ) ( not ( = ?auto_207546 ?auto_207548 ) ) ( not ( = ?auto_207545 ?auto_207548 ) ) ( not ( = ?auto_207544 ?auto_207548 ) ) ( not ( = ?auto_207547 ?auto_207548 ) ) ( TRUCK-AT ?auto_207553 ?auto_207552 ) ( SURFACE-AT ?auto_207543 ?auto_207552 ) ( CLEAR ?auto_207543 ) ( LIFTING ?auto_207549 ?auto_207544 ) ( IS-CRATE ?auto_207544 ) ( not ( = ?auto_207543 ?auto_207544 ) ) ( not ( = ?auto_207546 ?auto_207543 ) ) ( not ( = ?auto_207545 ?auto_207543 ) ) ( not ( = ?auto_207547 ?auto_207543 ) ) ( not ( = ?auto_207548 ?auto_207543 ) ) ( ON ?auto_207543 ?auto_207542 ) ( not ( = ?auto_207542 ?auto_207543 ) ) ( not ( = ?auto_207542 ?auto_207544 ) ) ( not ( = ?auto_207542 ?auto_207546 ) ) ( not ( = ?auto_207542 ?auto_207545 ) ) ( not ( = ?auto_207542 ?auto_207547 ) ) ( not ( = ?auto_207542 ?auto_207548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207544 ?auto_207546 ?auto_207545 )
      ( MAKE-4CRATE-VERIFY ?auto_207542 ?auto_207543 ?auto_207544 ?auto_207546 ?auto_207545 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_207554 - SURFACE
      ?auto_207555 - SURFACE
      ?auto_207556 - SURFACE
      ?auto_207558 - SURFACE
      ?auto_207557 - SURFACE
      ?auto_207559 - SURFACE
    )
    :vars
    (
      ?auto_207562 - HOIST
      ?auto_207565 - PLACE
      ?auto_207564 - PLACE
      ?auto_207563 - HOIST
      ?auto_207560 - SURFACE
      ?auto_207561 - SURFACE
      ?auto_207566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_207562 ?auto_207565 ) ( IS-CRATE ?auto_207559 ) ( not ( = ?auto_207557 ?auto_207559 ) ) ( not ( = ?auto_207558 ?auto_207557 ) ) ( not ( = ?auto_207558 ?auto_207559 ) ) ( not ( = ?auto_207564 ?auto_207565 ) ) ( HOIST-AT ?auto_207563 ?auto_207564 ) ( not ( = ?auto_207562 ?auto_207563 ) ) ( SURFACE-AT ?auto_207559 ?auto_207564 ) ( ON ?auto_207559 ?auto_207560 ) ( CLEAR ?auto_207559 ) ( not ( = ?auto_207557 ?auto_207560 ) ) ( not ( = ?auto_207559 ?auto_207560 ) ) ( not ( = ?auto_207558 ?auto_207560 ) ) ( IS-CRATE ?auto_207557 ) ( AVAILABLE ?auto_207563 ) ( SURFACE-AT ?auto_207557 ?auto_207564 ) ( ON ?auto_207557 ?auto_207561 ) ( CLEAR ?auto_207557 ) ( not ( = ?auto_207557 ?auto_207561 ) ) ( not ( = ?auto_207559 ?auto_207561 ) ) ( not ( = ?auto_207558 ?auto_207561 ) ) ( not ( = ?auto_207560 ?auto_207561 ) ) ( TRUCK-AT ?auto_207566 ?auto_207565 ) ( SURFACE-AT ?auto_207556 ?auto_207565 ) ( CLEAR ?auto_207556 ) ( LIFTING ?auto_207562 ?auto_207558 ) ( IS-CRATE ?auto_207558 ) ( not ( = ?auto_207556 ?auto_207558 ) ) ( not ( = ?auto_207557 ?auto_207556 ) ) ( not ( = ?auto_207559 ?auto_207556 ) ) ( not ( = ?auto_207560 ?auto_207556 ) ) ( not ( = ?auto_207561 ?auto_207556 ) ) ( ON ?auto_207555 ?auto_207554 ) ( ON ?auto_207556 ?auto_207555 ) ( not ( = ?auto_207554 ?auto_207555 ) ) ( not ( = ?auto_207554 ?auto_207556 ) ) ( not ( = ?auto_207554 ?auto_207558 ) ) ( not ( = ?auto_207554 ?auto_207557 ) ) ( not ( = ?auto_207554 ?auto_207559 ) ) ( not ( = ?auto_207554 ?auto_207560 ) ) ( not ( = ?auto_207554 ?auto_207561 ) ) ( not ( = ?auto_207555 ?auto_207556 ) ) ( not ( = ?auto_207555 ?auto_207558 ) ) ( not ( = ?auto_207555 ?auto_207557 ) ) ( not ( = ?auto_207555 ?auto_207559 ) ) ( not ( = ?auto_207555 ?auto_207560 ) ) ( not ( = ?auto_207555 ?auto_207561 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_207558 ?auto_207557 ?auto_207559 )
      ( MAKE-5CRATE-VERIFY ?auto_207554 ?auto_207555 ?auto_207556 ?auto_207558 ?auto_207557 ?auto_207559 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208475 - SURFACE
      ?auto_208476 - SURFACE
      ?auto_208477 - SURFACE
      ?auto_208479 - SURFACE
      ?auto_208478 - SURFACE
      ?auto_208480 - SURFACE
      ?auto_208481 - SURFACE
    )
    :vars
    (
      ?auto_208483 - HOIST
      ?auto_208482 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208483 ?auto_208482 ) ( SURFACE-AT ?auto_208480 ?auto_208482 ) ( CLEAR ?auto_208480 ) ( LIFTING ?auto_208483 ?auto_208481 ) ( IS-CRATE ?auto_208481 ) ( not ( = ?auto_208480 ?auto_208481 ) ) ( ON ?auto_208476 ?auto_208475 ) ( ON ?auto_208477 ?auto_208476 ) ( ON ?auto_208479 ?auto_208477 ) ( ON ?auto_208478 ?auto_208479 ) ( ON ?auto_208480 ?auto_208478 ) ( not ( = ?auto_208475 ?auto_208476 ) ) ( not ( = ?auto_208475 ?auto_208477 ) ) ( not ( = ?auto_208475 ?auto_208479 ) ) ( not ( = ?auto_208475 ?auto_208478 ) ) ( not ( = ?auto_208475 ?auto_208480 ) ) ( not ( = ?auto_208475 ?auto_208481 ) ) ( not ( = ?auto_208476 ?auto_208477 ) ) ( not ( = ?auto_208476 ?auto_208479 ) ) ( not ( = ?auto_208476 ?auto_208478 ) ) ( not ( = ?auto_208476 ?auto_208480 ) ) ( not ( = ?auto_208476 ?auto_208481 ) ) ( not ( = ?auto_208477 ?auto_208479 ) ) ( not ( = ?auto_208477 ?auto_208478 ) ) ( not ( = ?auto_208477 ?auto_208480 ) ) ( not ( = ?auto_208477 ?auto_208481 ) ) ( not ( = ?auto_208479 ?auto_208478 ) ) ( not ( = ?auto_208479 ?auto_208480 ) ) ( not ( = ?auto_208479 ?auto_208481 ) ) ( not ( = ?auto_208478 ?auto_208480 ) ) ( not ( = ?auto_208478 ?auto_208481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_208480 ?auto_208481 )
      ( MAKE-6CRATE-VERIFY ?auto_208475 ?auto_208476 ?auto_208477 ?auto_208479 ?auto_208478 ?auto_208480 ?auto_208481 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208519 - SURFACE
      ?auto_208520 - SURFACE
      ?auto_208521 - SURFACE
      ?auto_208523 - SURFACE
      ?auto_208522 - SURFACE
      ?auto_208524 - SURFACE
      ?auto_208525 - SURFACE
    )
    :vars
    (
      ?auto_208527 - HOIST
      ?auto_208526 - PLACE
      ?auto_208528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_208527 ?auto_208526 ) ( SURFACE-AT ?auto_208524 ?auto_208526 ) ( CLEAR ?auto_208524 ) ( IS-CRATE ?auto_208525 ) ( not ( = ?auto_208524 ?auto_208525 ) ) ( TRUCK-AT ?auto_208528 ?auto_208526 ) ( AVAILABLE ?auto_208527 ) ( IN ?auto_208525 ?auto_208528 ) ( ON ?auto_208524 ?auto_208522 ) ( not ( = ?auto_208522 ?auto_208524 ) ) ( not ( = ?auto_208522 ?auto_208525 ) ) ( ON ?auto_208520 ?auto_208519 ) ( ON ?auto_208521 ?auto_208520 ) ( ON ?auto_208523 ?auto_208521 ) ( ON ?auto_208522 ?auto_208523 ) ( not ( = ?auto_208519 ?auto_208520 ) ) ( not ( = ?auto_208519 ?auto_208521 ) ) ( not ( = ?auto_208519 ?auto_208523 ) ) ( not ( = ?auto_208519 ?auto_208522 ) ) ( not ( = ?auto_208519 ?auto_208524 ) ) ( not ( = ?auto_208519 ?auto_208525 ) ) ( not ( = ?auto_208520 ?auto_208521 ) ) ( not ( = ?auto_208520 ?auto_208523 ) ) ( not ( = ?auto_208520 ?auto_208522 ) ) ( not ( = ?auto_208520 ?auto_208524 ) ) ( not ( = ?auto_208520 ?auto_208525 ) ) ( not ( = ?auto_208521 ?auto_208523 ) ) ( not ( = ?auto_208521 ?auto_208522 ) ) ( not ( = ?auto_208521 ?auto_208524 ) ) ( not ( = ?auto_208521 ?auto_208525 ) ) ( not ( = ?auto_208523 ?auto_208522 ) ) ( not ( = ?auto_208523 ?auto_208524 ) ) ( not ( = ?auto_208523 ?auto_208525 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208522 ?auto_208524 ?auto_208525 )
      ( MAKE-6CRATE-VERIFY ?auto_208519 ?auto_208520 ?auto_208521 ?auto_208523 ?auto_208522 ?auto_208524 ?auto_208525 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208570 - SURFACE
      ?auto_208571 - SURFACE
      ?auto_208572 - SURFACE
      ?auto_208574 - SURFACE
      ?auto_208573 - SURFACE
      ?auto_208575 - SURFACE
      ?auto_208576 - SURFACE
    )
    :vars
    (
      ?auto_208579 - HOIST
      ?auto_208580 - PLACE
      ?auto_208578 - TRUCK
      ?auto_208577 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208579 ?auto_208580 ) ( SURFACE-AT ?auto_208575 ?auto_208580 ) ( CLEAR ?auto_208575 ) ( IS-CRATE ?auto_208576 ) ( not ( = ?auto_208575 ?auto_208576 ) ) ( AVAILABLE ?auto_208579 ) ( IN ?auto_208576 ?auto_208578 ) ( ON ?auto_208575 ?auto_208573 ) ( not ( = ?auto_208573 ?auto_208575 ) ) ( not ( = ?auto_208573 ?auto_208576 ) ) ( TRUCK-AT ?auto_208578 ?auto_208577 ) ( not ( = ?auto_208577 ?auto_208580 ) ) ( ON ?auto_208571 ?auto_208570 ) ( ON ?auto_208572 ?auto_208571 ) ( ON ?auto_208574 ?auto_208572 ) ( ON ?auto_208573 ?auto_208574 ) ( not ( = ?auto_208570 ?auto_208571 ) ) ( not ( = ?auto_208570 ?auto_208572 ) ) ( not ( = ?auto_208570 ?auto_208574 ) ) ( not ( = ?auto_208570 ?auto_208573 ) ) ( not ( = ?auto_208570 ?auto_208575 ) ) ( not ( = ?auto_208570 ?auto_208576 ) ) ( not ( = ?auto_208571 ?auto_208572 ) ) ( not ( = ?auto_208571 ?auto_208574 ) ) ( not ( = ?auto_208571 ?auto_208573 ) ) ( not ( = ?auto_208571 ?auto_208575 ) ) ( not ( = ?auto_208571 ?auto_208576 ) ) ( not ( = ?auto_208572 ?auto_208574 ) ) ( not ( = ?auto_208572 ?auto_208573 ) ) ( not ( = ?auto_208572 ?auto_208575 ) ) ( not ( = ?auto_208572 ?auto_208576 ) ) ( not ( = ?auto_208574 ?auto_208573 ) ) ( not ( = ?auto_208574 ?auto_208575 ) ) ( not ( = ?auto_208574 ?auto_208576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208573 ?auto_208575 ?auto_208576 )
      ( MAKE-6CRATE-VERIFY ?auto_208570 ?auto_208571 ?auto_208572 ?auto_208574 ?auto_208573 ?auto_208575 ?auto_208576 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208627 - SURFACE
      ?auto_208628 - SURFACE
      ?auto_208629 - SURFACE
      ?auto_208631 - SURFACE
      ?auto_208630 - SURFACE
      ?auto_208632 - SURFACE
      ?auto_208633 - SURFACE
    )
    :vars
    (
      ?auto_208637 - HOIST
      ?auto_208635 - PLACE
      ?auto_208638 - TRUCK
      ?auto_208634 - PLACE
      ?auto_208636 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_208637 ?auto_208635 ) ( SURFACE-AT ?auto_208632 ?auto_208635 ) ( CLEAR ?auto_208632 ) ( IS-CRATE ?auto_208633 ) ( not ( = ?auto_208632 ?auto_208633 ) ) ( AVAILABLE ?auto_208637 ) ( ON ?auto_208632 ?auto_208630 ) ( not ( = ?auto_208630 ?auto_208632 ) ) ( not ( = ?auto_208630 ?auto_208633 ) ) ( TRUCK-AT ?auto_208638 ?auto_208634 ) ( not ( = ?auto_208634 ?auto_208635 ) ) ( HOIST-AT ?auto_208636 ?auto_208634 ) ( LIFTING ?auto_208636 ?auto_208633 ) ( not ( = ?auto_208637 ?auto_208636 ) ) ( ON ?auto_208628 ?auto_208627 ) ( ON ?auto_208629 ?auto_208628 ) ( ON ?auto_208631 ?auto_208629 ) ( ON ?auto_208630 ?auto_208631 ) ( not ( = ?auto_208627 ?auto_208628 ) ) ( not ( = ?auto_208627 ?auto_208629 ) ) ( not ( = ?auto_208627 ?auto_208631 ) ) ( not ( = ?auto_208627 ?auto_208630 ) ) ( not ( = ?auto_208627 ?auto_208632 ) ) ( not ( = ?auto_208627 ?auto_208633 ) ) ( not ( = ?auto_208628 ?auto_208629 ) ) ( not ( = ?auto_208628 ?auto_208631 ) ) ( not ( = ?auto_208628 ?auto_208630 ) ) ( not ( = ?auto_208628 ?auto_208632 ) ) ( not ( = ?auto_208628 ?auto_208633 ) ) ( not ( = ?auto_208629 ?auto_208631 ) ) ( not ( = ?auto_208629 ?auto_208630 ) ) ( not ( = ?auto_208629 ?auto_208632 ) ) ( not ( = ?auto_208629 ?auto_208633 ) ) ( not ( = ?auto_208631 ?auto_208630 ) ) ( not ( = ?auto_208631 ?auto_208632 ) ) ( not ( = ?auto_208631 ?auto_208633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208630 ?auto_208632 ?auto_208633 )
      ( MAKE-6CRATE-VERIFY ?auto_208627 ?auto_208628 ?auto_208629 ?auto_208631 ?auto_208630 ?auto_208632 ?auto_208633 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208690 - SURFACE
      ?auto_208691 - SURFACE
      ?auto_208692 - SURFACE
      ?auto_208694 - SURFACE
      ?auto_208693 - SURFACE
      ?auto_208695 - SURFACE
      ?auto_208696 - SURFACE
    )
    :vars
    (
      ?auto_208699 - HOIST
      ?auto_208697 - PLACE
      ?auto_208698 - TRUCK
      ?auto_208701 - PLACE
      ?auto_208702 - HOIST
      ?auto_208700 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_208699 ?auto_208697 ) ( SURFACE-AT ?auto_208695 ?auto_208697 ) ( CLEAR ?auto_208695 ) ( IS-CRATE ?auto_208696 ) ( not ( = ?auto_208695 ?auto_208696 ) ) ( AVAILABLE ?auto_208699 ) ( ON ?auto_208695 ?auto_208693 ) ( not ( = ?auto_208693 ?auto_208695 ) ) ( not ( = ?auto_208693 ?auto_208696 ) ) ( TRUCK-AT ?auto_208698 ?auto_208701 ) ( not ( = ?auto_208701 ?auto_208697 ) ) ( HOIST-AT ?auto_208702 ?auto_208701 ) ( not ( = ?auto_208699 ?auto_208702 ) ) ( AVAILABLE ?auto_208702 ) ( SURFACE-AT ?auto_208696 ?auto_208701 ) ( ON ?auto_208696 ?auto_208700 ) ( CLEAR ?auto_208696 ) ( not ( = ?auto_208695 ?auto_208700 ) ) ( not ( = ?auto_208696 ?auto_208700 ) ) ( not ( = ?auto_208693 ?auto_208700 ) ) ( ON ?auto_208691 ?auto_208690 ) ( ON ?auto_208692 ?auto_208691 ) ( ON ?auto_208694 ?auto_208692 ) ( ON ?auto_208693 ?auto_208694 ) ( not ( = ?auto_208690 ?auto_208691 ) ) ( not ( = ?auto_208690 ?auto_208692 ) ) ( not ( = ?auto_208690 ?auto_208694 ) ) ( not ( = ?auto_208690 ?auto_208693 ) ) ( not ( = ?auto_208690 ?auto_208695 ) ) ( not ( = ?auto_208690 ?auto_208696 ) ) ( not ( = ?auto_208690 ?auto_208700 ) ) ( not ( = ?auto_208691 ?auto_208692 ) ) ( not ( = ?auto_208691 ?auto_208694 ) ) ( not ( = ?auto_208691 ?auto_208693 ) ) ( not ( = ?auto_208691 ?auto_208695 ) ) ( not ( = ?auto_208691 ?auto_208696 ) ) ( not ( = ?auto_208691 ?auto_208700 ) ) ( not ( = ?auto_208692 ?auto_208694 ) ) ( not ( = ?auto_208692 ?auto_208693 ) ) ( not ( = ?auto_208692 ?auto_208695 ) ) ( not ( = ?auto_208692 ?auto_208696 ) ) ( not ( = ?auto_208692 ?auto_208700 ) ) ( not ( = ?auto_208694 ?auto_208693 ) ) ( not ( = ?auto_208694 ?auto_208695 ) ) ( not ( = ?auto_208694 ?auto_208696 ) ) ( not ( = ?auto_208694 ?auto_208700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208693 ?auto_208695 ?auto_208696 )
      ( MAKE-6CRATE-VERIFY ?auto_208690 ?auto_208691 ?auto_208692 ?auto_208694 ?auto_208693 ?auto_208695 ?auto_208696 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208754 - SURFACE
      ?auto_208755 - SURFACE
      ?auto_208756 - SURFACE
      ?auto_208758 - SURFACE
      ?auto_208757 - SURFACE
      ?auto_208759 - SURFACE
      ?auto_208760 - SURFACE
    )
    :vars
    (
      ?auto_208762 - HOIST
      ?auto_208763 - PLACE
      ?auto_208765 - PLACE
      ?auto_208766 - HOIST
      ?auto_208761 - SURFACE
      ?auto_208764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_208762 ?auto_208763 ) ( SURFACE-AT ?auto_208759 ?auto_208763 ) ( CLEAR ?auto_208759 ) ( IS-CRATE ?auto_208760 ) ( not ( = ?auto_208759 ?auto_208760 ) ) ( AVAILABLE ?auto_208762 ) ( ON ?auto_208759 ?auto_208757 ) ( not ( = ?auto_208757 ?auto_208759 ) ) ( not ( = ?auto_208757 ?auto_208760 ) ) ( not ( = ?auto_208765 ?auto_208763 ) ) ( HOIST-AT ?auto_208766 ?auto_208765 ) ( not ( = ?auto_208762 ?auto_208766 ) ) ( AVAILABLE ?auto_208766 ) ( SURFACE-AT ?auto_208760 ?auto_208765 ) ( ON ?auto_208760 ?auto_208761 ) ( CLEAR ?auto_208760 ) ( not ( = ?auto_208759 ?auto_208761 ) ) ( not ( = ?auto_208760 ?auto_208761 ) ) ( not ( = ?auto_208757 ?auto_208761 ) ) ( TRUCK-AT ?auto_208764 ?auto_208763 ) ( ON ?auto_208755 ?auto_208754 ) ( ON ?auto_208756 ?auto_208755 ) ( ON ?auto_208758 ?auto_208756 ) ( ON ?auto_208757 ?auto_208758 ) ( not ( = ?auto_208754 ?auto_208755 ) ) ( not ( = ?auto_208754 ?auto_208756 ) ) ( not ( = ?auto_208754 ?auto_208758 ) ) ( not ( = ?auto_208754 ?auto_208757 ) ) ( not ( = ?auto_208754 ?auto_208759 ) ) ( not ( = ?auto_208754 ?auto_208760 ) ) ( not ( = ?auto_208754 ?auto_208761 ) ) ( not ( = ?auto_208755 ?auto_208756 ) ) ( not ( = ?auto_208755 ?auto_208758 ) ) ( not ( = ?auto_208755 ?auto_208757 ) ) ( not ( = ?auto_208755 ?auto_208759 ) ) ( not ( = ?auto_208755 ?auto_208760 ) ) ( not ( = ?auto_208755 ?auto_208761 ) ) ( not ( = ?auto_208756 ?auto_208758 ) ) ( not ( = ?auto_208756 ?auto_208757 ) ) ( not ( = ?auto_208756 ?auto_208759 ) ) ( not ( = ?auto_208756 ?auto_208760 ) ) ( not ( = ?auto_208756 ?auto_208761 ) ) ( not ( = ?auto_208758 ?auto_208757 ) ) ( not ( = ?auto_208758 ?auto_208759 ) ) ( not ( = ?auto_208758 ?auto_208760 ) ) ( not ( = ?auto_208758 ?auto_208761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208757 ?auto_208759 ?auto_208760 )
      ( MAKE-6CRATE-VERIFY ?auto_208754 ?auto_208755 ?auto_208756 ?auto_208758 ?auto_208757 ?auto_208759 ?auto_208760 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208818 - SURFACE
      ?auto_208819 - SURFACE
      ?auto_208820 - SURFACE
      ?auto_208822 - SURFACE
      ?auto_208821 - SURFACE
      ?auto_208823 - SURFACE
      ?auto_208824 - SURFACE
    )
    :vars
    (
      ?auto_208825 - HOIST
      ?auto_208827 - PLACE
      ?auto_208830 - PLACE
      ?auto_208828 - HOIST
      ?auto_208829 - SURFACE
      ?auto_208826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_208825 ?auto_208827 ) ( IS-CRATE ?auto_208824 ) ( not ( = ?auto_208823 ?auto_208824 ) ) ( not ( = ?auto_208821 ?auto_208823 ) ) ( not ( = ?auto_208821 ?auto_208824 ) ) ( not ( = ?auto_208830 ?auto_208827 ) ) ( HOIST-AT ?auto_208828 ?auto_208830 ) ( not ( = ?auto_208825 ?auto_208828 ) ) ( AVAILABLE ?auto_208828 ) ( SURFACE-AT ?auto_208824 ?auto_208830 ) ( ON ?auto_208824 ?auto_208829 ) ( CLEAR ?auto_208824 ) ( not ( = ?auto_208823 ?auto_208829 ) ) ( not ( = ?auto_208824 ?auto_208829 ) ) ( not ( = ?auto_208821 ?auto_208829 ) ) ( TRUCK-AT ?auto_208826 ?auto_208827 ) ( SURFACE-AT ?auto_208821 ?auto_208827 ) ( CLEAR ?auto_208821 ) ( LIFTING ?auto_208825 ?auto_208823 ) ( IS-CRATE ?auto_208823 ) ( ON ?auto_208819 ?auto_208818 ) ( ON ?auto_208820 ?auto_208819 ) ( ON ?auto_208822 ?auto_208820 ) ( ON ?auto_208821 ?auto_208822 ) ( not ( = ?auto_208818 ?auto_208819 ) ) ( not ( = ?auto_208818 ?auto_208820 ) ) ( not ( = ?auto_208818 ?auto_208822 ) ) ( not ( = ?auto_208818 ?auto_208821 ) ) ( not ( = ?auto_208818 ?auto_208823 ) ) ( not ( = ?auto_208818 ?auto_208824 ) ) ( not ( = ?auto_208818 ?auto_208829 ) ) ( not ( = ?auto_208819 ?auto_208820 ) ) ( not ( = ?auto_208819 ?auto_208822 ) ) ( not ( = ?auto_208819 ?auto_208821 ) ) ( not ( = ?auto_208819 ?auto_208823 ) ) ( not ( = ?auto_208819 ?auto_208824 ) ) ( not ( = ?auto_208819 ?auto_208829 ) ) ( not ( = ?auto_208820 ?auto_208822 ) ) ( not ( = ?auto_208820 ?auto_208821 ) ) ( not ( = ?auto_208820 ?auto_208823 ) ) ( not ( = ?auto_208820 ?auto_208824 ) ) ( not ( = ?auto_208820 ?auto_208829 ) ) ( not ( = ?auto_208822 ?auto_208821 ) ) ( not ( = ?auto_208822 ?auto_208823 ) ) ( not ( = ?auto_208822 ?auto_208824 ) ) ( not ( = ?auto_208822 ?auto_208829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208821 ?auto_208823 ?auto_208824 )
      ( MAKE-6CRATE-VERIFY ?auto_208818 ?auto_208819 ?auto_208820 ?auto_208822 ?auto_208821 ?auto_208823 ?auto_208824 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_208882 - SURFACE
      ?auto_208883 - SURFACE
      ?auto_208884 - SURFACE
      ?auto_208886 - SURFACE
      ?auto_208885 - SURFACE
      ?auto_208887 - SURFACE
      ?auto_208888 - SURFACE
    )
    :vars
    (
      ?auto_208892 - HOIST
      ?auto_208889 - PLACE
      ?auto_208894 - PLACE
      ?auto_208890 - HOIST
      ?auto_208891 - SURFACE
      ?auto_208893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_208892 ?auto_208889 ) ( IS-CRATE ?auto_208888 ) ( not ( = ?auto_208887 ?auto_208888 ) ) ( not ( = ?auto_208885 ?auto_208887 ) ) ( not ( = ?auto_208885 ?auto_208888 ) ) ( not ( = ?auto_208894 ?auto_208889 ) ) ( HOIST-AT ?auto_208890 ?auto_208894 ) ( not ( = ?auto_208892 ?auto_208890 ) ) ( AVAILABLE ?auto_208890 ) ( SURFACE-AT ?auto_208888 ?auto_208894 ) ( ON ?auto_208888 ?auto_208891 ) ( CLEAR ?auto_208888 ) ( not ( = ?auto_208887 ?auto_208891 ) ) ( not ( = ?auto_208888 ?auto_208891 ) ) ( not ( = ?auto_208885 ?auto_208891 ) ) ( TRUCK-AT ?auto_208893 ?auto_208889 ) ( SURFACE-AT ?auto_208885 ?auto_208889 ) ( CLEAR ?auto_208885 ) ( IS-CRATE ?auto_208887 ) ( AVAILABLE ?auto_208892 ) ( IN ?auto_208887 ?auto_208893 ) ( ON ?auto_208883 ?auto_208882 ) ( ON ?auto_208884 ?auto_208883 ) ( ON ?auto_208886 ?auto_208884 ) ( ON ?auto_208885 ?auto_208886 ) ( not ( = ?auto_208882 ?auto_208883 ) ) ( not ( = ?auto_208882 ?auto_208884 ) ) ( not ( = ?auto_208882 ?auto_208886 ) ) ( not ( = ?auto_208882 ?auto_208885 ) ) ( not ( = ?auto_208882 ?auto_208887 ) ) ( not ( = ?auto_208882 ?auto_208888 ) ) ( not ( = ?auto_208882 ?auto_208891 ) ) ( not ( = ?auto_208883 ?auto_208884 ) ) ( not ( = ?auto_208883 ?auto_208886 ) ) ( not ( = ?auto_208883 ?auto_208885 ) ) ( not ( = ?auto_208883 ?auto_208887 ) ) ( not ( = ?auto_208883 ?auto_208888 ) ) ( not ( = ?auto_208883 ?auto_208891 ) ) ( not ( = ?auto_208884 ?auto_208886 ) ) ( not ( = ?auto_208884 ?auto_208885 ) ) ( not ( = ?auto_208884 ?auto_208887 ) ) ( not ( = ?auto_208884 ?auto_208888 ) ) ( not ( = ?auto_208884 ?auto_208891 ) ) ( not ( = ?auto_208886 ?auto_208885 ) ) ( not ( = ?auto_208886 ?auto_208887 ) ) ( not ( = ?auto_208886 ?auto_208888 ) ) ( not ( = ?auto_208886 ?auto_208891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_208885 ?auto_208887 ?auto_208888 )
      ( MAKE-6CRATE-VERIFY ?auto_208882 ?auto_208883 ?auto_208884 ?auto_208886 ?auto_208885 ?auto_208887 ?auto_208888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_209352 - SURFACE
      ?auto_209353 - SURFACE
    )
    :vars
    (
      ?auto_209358 - HOIST
      ?auto_209360 - PLACE
      ?auto_209357 - SURFACE
      ?auto_209355 - PLACE
      ?auto_209359 - HOIST
      ?auto_209356 - SURFACE
      ?auto_209354 - TRUCK
      ?auto_209361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_209358 ?auto_209360 ) ( SURFACE-AT ?auto_209352 ?auto_209360 ) ( CLEAR ?auto_209352 ) ( IS-CRATE ?auto_209353 ) ( not ( = ?auto_209352 ?auto_209353 ) ) ( ON ?auto_209352 ?auto_209357 ) ( not ( = ?auto_209357 ?auto_209352 ) ) ( not ( = ?auto_209357 ?auto_209353 ) ) ( not ( = ?auto_209355 ?auto_209360 ) ) ( HOIST-AT ?auto_209359 ?auto_209355 ) ( not ( = ?auto_209358 ?auto_209359 ) ) ( AVAILABLE ?auto_209359 ) ( SURFACE-AT ?auto_209353 ?auto_209355 ) ( ON ?auto_209353 ?auto_209356 ) ( CLEAR ?auto_209353 ) ( not ( = ?auto_209352 ?auto_209356 ) ) ( not ( = ?auto_209353 ?auto_209356 ) ) ( not ( = ?auto_209357 ?auto_209356 ) ) ( TRUCK-AT ?auto_209354 ?auto_209360 ) ( LIFTING ?auto_209358 ?auto_209361 ) ( IS-CRATE ?auto_209361 ) ( not ( = ?auto_209352 ?auto_209361 ) ) ( not ( = ?auto_209353 ?auto_209361 ) ) ( not ( = ?auto_209357 ?auto_209361 ) ) ( not ( = ?auto_209356 ?auto_209361 ) ) )
    :subtasks
    ( ( !LOAD ?auto_209358 ?auto_209361 ?auto_209354 ?auto_209360 )
      ( MAKE-1CRATE ?auto_209352 ?auto_209353 )
      ( MAKE-1CRATE-VERIFY ?auto_209352 ?auto_209353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_210551 - SURFACE
      ?auto_210552 - SURFACE
    )
    :vars
    (
      ?auto_210559 - HOIST
      ?auto_210557 - PLACE
      ?auto_210554 - SURFACE
      ?auto_210558 - TRUCK
      ?auto_210556 - PLACE
      ?auto_210553 - HOIST
      ?auto_210555 - SURFACE
      ?auto_210560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_210559 ?auto_210557 ) ( SURFACE-AT ?auto_210551 ?auto_210557 ) ( CLEAR ?auto_210551 ) ( IS-CRATE ?auto_210552 ) ( not ( = ?auto_210551 ?auto_210552 ) ) ( AVAILABLE ?auto_210559 ) ( ON ?auto_210551 ?auto_210554 ) ( not ( = ?auto_210554 ?auto_210551 ) ) ( not ( = ?auto_210554 ?auto_210552 ) ) ( TRUCK-AT ?auto_210558 ?auto_210556 ) ( not ( = ?auto_210556 ?auto_210557 ) ) ( HOIST-AT ?auto_210553 ?auto_210556 ) ( not ( = ?auto_210559 ?auto_210553 ) ) ( SURFACE-AT ?auto_210552 ?auto_210556 ) ( ON ?auto_210552 ?auto_210555 ) ( CLEAR ?auto_210552 ) ( not ( = ?auto_210551 ?auto_210555 ) ) ( not ( = ?auto_210552 ?auto_210555 ) ) ( not ( = ?auto_210554 ?auto_210555 ) ) ( LIFTING ?auto_210553 ?auto_210560 ) ( IS-CRATE ?auto_210560 ) ( not ( = ?auto_210551 ?auto_210560 ) ) ( not ( = ?auto_210552 ?auto_210560 ) ) ( not ( = ?auto_210554 ?auto_210560 ) ) ( not ( = ?auto_210555 ?auto_210560 ) ) )
    :subtasks
    ( ( !LOAD ?auto_210553 ?auto_210560 ?auto_210558 ?auto_210556 )
      ( MAKE-1CRATE ?auto_210551 ?auto_210552 )
      ( MAKE-1CRATE-VERIFY ?auto_210551 ?auto_210552 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_210827 - SURFACE
      ?auto_210828 - SURFACE
      ?auto_210829 - SURFACE
      ?auto_210831 - SURFACE
      ?auto_210830 - SURFACE
      ?auto_210832 - SURFACE
      ?auto_210833 - SURFACE
      ?auto_210834 - SURFACE
    )
    :vars
    (
      ?auto_210836 - HOIST
      ?auto_210835 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_210836 ?auto_210835 ) ( SURFACE-AT ?auto_210833 ?auto_210835 ) ( CLEAR ?auto_210833 ) ( LIFTING ?auto_210836 ?auto_210834 ) ( IS-CRATE ?auto_210834 ) ( not ( = ?auto_210833 ?auto_210834 ) ) ( ON ?auto_210828 ?auto_210827 ) ( ON ?auto_210829 ?auto_210828 ) ( ON ?auto_210831 ?auto_210829 ) ( ON ?auto_210830 ?auto_210831 ) ( ON ?auto_210832 ?auto_210830 ) ( ON ?auto_210833 ?auto_210832 ) ( not ( = ?auto_210827 ?auto_210828 ) ) ( not ( = ?auto_210827 ?auto_210829 ) ) ( not ( = ?auto_210827 ?auto_210831 ) ) ( not ( = ?auto_210827 ?auto_210830 ) ) ( not ( = ?auto_210827 ?auto_210832 ) ) ( not ( = ?auto_210827 ?auto_210833 ) ) ( not ( = ?auto_210827 ?auto_210834 ) ) ( not ( = ?auto_210828 ?auto_210829 ) ) ( not ( = ?auto_210828 ?auto_210831 ) ) ( not ( = ?auto_210828 ?auto_210830 ) ) ( not ( = ?auto_210828 ?auto_210832 ) ) ( not ( = ?auto_210828 ?auto_210833 ) ) ( not ( = ?auto_210828 ?auto_210834 ) ) ( not ( = ?auto_210829 ?auto_210831 ) ) ( not ( = ?auto_210829 ?auto_210830 ) ) ( not ( = ?auto_210829 ?auto_210832 ) ) ( not ( = ?auto_210829 ?auto_210833 ) ) ( not ( = ?auto_210829 ?auto_210834 ) ) ( not ( = ?auto_210831 ?auto_210830 ) ) ( not ( = ?auto_210831 ?auto_210832 ) ) ( not ( = ?auto_210831 ?auto_210833 ) ) ( not ( = ?auto_210831 ?auto_210834 ) ) ( not ( = ?auto_210830 ?auto_210832 ) ) ( not ( = ?auto_210830 ?auto_210833 ) ) ( not ( = ?auto_210830 ?auto_210834 ) ) ( not ( = ?auto_210832 ?auto_210833 ) ) ( not ( = ?auto_210832 ?auto_210834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_210833 ?auto_210834 )
      ( MAKE-7CRATE-VERIFY ?auto_210827 ?auto_210828 ?auto_210829 ?auto_210831 ?auto_210830 ?auto_210832 ?auto_210833 ?auto_210834 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_210882 - SURFACE
      ?auto_210883 - SURFACE
      ?auto_210884 - SURFACE
      ?auto_210886 - SURFACE
      ?auto_210885 - SURFACE
      ?auto_210887 - SURFACE
      ?auto_210888 - SURFACE
      ?auto_210889 - SURFACE
    )
    :vars
    (
      ?auto_210892 - HOIST
      ?auto_210890 - PLACE
      ?auto_210891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_210892 ?auto_210890 ) ( SURFACE-AT ?auto_210888 ?auto_210890 ) ( CLEAR ?auto_210888 ) ( IS-CRATE ?auto_210889 ) ( not ( = ?auto_210888 ?auto_210889 ) ) ( TRUCK-AT ?auto_210891 ?auto_210890 ) ( AVAILABLE ?auto_210892 ) ( IN ?auto_210889 ?auto_210891 ) ( ON ?auto_210888 ?auto_210887 ) ( not ( = ?auto_210887 ?auto_210888 ) ) ( not ( = ?auto_210887 ?auto_210889 ) ) ( ON ?auto_210883 ?auto_210882 ) ( ON ?auto_210884 ?auto_210883 ) ( ON ?auto_210886 ?auto_210884 ) ( ON ?auto_210885 ?auto_210886 ) ( ON ?auto_210887 ?auto_210885 ) ( not ( = ?auto_210882 ?auto_210883 ) ) ( not ( = ?auto_210882 ?auto_210884 ) ) ( not ( = ?auto_210882 ?auto_210886 ) ) ( not ( = ?auto_210882 ?auto_210885 ) ) ( not ( = ?auto_210882 ?auto_210887 ) ) ( not ( = ?auto_210882 ?auto_210888 ) ) ( not ( = ?auto_210882 ?auto_210889 ) ) ( not ( = ?auto_210883 ?auto_210884 ) ) ( not ( = ?auto_210883 ?auto_210886 ) ) ( not ( = ?auto_210883 ?auto_210885 ) ) ( not ( = ?auto_210883 ?auto_210887 ) ) ( not ( = ?auto_210883 ?auto_210888 ) ) ( not ( = ?auto_210883 ?auto_210889 ) ) ( not ( = ?auto_210884 ?auto_210886 ) ) ( not ( = ?auto_210884 ?auto_210885 ) ) ( not ( = ?auto_210884 ?auto_210887 ) ) ( not ( = ?auto_210884 ?auto_210888 ) ) ( not ( = ?auto_210884 ?auto_210889 ) ) ( not ( = ?auto_210886 ?auto_210885 ) ) ( not ( = ?auto_210886 ?auto_210887 ) ) ( not ( = ?auto_210886 ?auto_210888 ) ) ( not ( = ?auto_210886 ?auto_210889 ) ) ( not ( = ?auto_210885 ?auto_210887 ) ) ( not ( = ?auto_210885 ?auto_210888 ) ) ( not ( = ?auto_210885 ?auto_210889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_210887 ?auto_210888 ?auto_210889 )
      ( MAKE-7CRATE-VERIFY ?auto_210882 ?auto_210883 ?auto_210884 ?auto_210886 ?auto_210885 ?auto_210887 ?auto_210888 ?auto_210889 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_210945 - SURFACE
      ?auto_210946 - SURFACE
      ?auto_210947 - SURFACE
      ?auto_210949 - SURFACE
      ?auto_210948 - SURFACE
      ?auto_210950 - SURFACE
      ?auto_210951 - SURFACE
      ?auto_210952 - SURFACE
    )
    :vars
    (
      ?auto_210954 - HOIST
      ?auto_210953 - PLACE
      ?auto_210955 - TRUCK
      ?auto_210956 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_210954 ?auto_210953 ) ( SURFACE-AT ?auto_210951 ?auto_210953 ) ( CLEAR ?auto_210951 ) ( IS-CRATE ?auto_210952 ) ( not ( = ?auto_210951 ?auto_210952 ) ) ( AVAILABLE ?auto_210954 ) ( IN ?auto_210952 ?auto_210955 ) ( ON ?auto_210951 ?auto_210950 ) ( not ( = ?auto_210950 ?auto_210951 ) ) ( not ( = ?auto_210950 ?auto_210952 ) ) ( TRUCK-AT ?auto_210955 ?auto_210956 ) ( not ( = ?auto_210956 ?auto_210953 ) ) ( ON ?auto_210946 ?auto_210945 ) ( ON ?auto_210947 ?auto_210946 ) ( ON ?auto_210949 ?auto_210947 ) ( ON ?auto_210948 ?auto_210949 ) ( ON ?auto_210950 ?auto_210948 ) ( not ( = ?auto_210945 ?auto_210946 ) ) ( not ( = ?auto_210945 ?auto_210947 ) ) ( not ( = ?auto_210945 ?auto_210949 ) ) ( not ( = ?auto_210945 ?auto_210948 ) ) ( not ( = ?auto_210945 ?auto_210950 ) ) ( not ( = ?auto_210945 ?auto_210951 ) ) ( not ( = ?auto_210945 ?auto_210952 ) ) ( not ( = ?auto_210946 ?auto_210947 ) ) ( not ( = ?auto_210946 ?auto_210949 ) ) ( not ( = ?auto_210946 ?auto_210948 ) ) ( not ( = ?auto_210946 ?auto_210950 ) ) ( not ( = ?auto_210946 ?auto_210951 ) ) ( not ( = ?auto_210946 ?auto_210952 ) ) ( not ( = ?auto_210947 ?auto_210949 ) ) ( not ( = ?auto_210947 ?auto_210948 ) ) ( not ( = ?auto_210947 ?auto_210950 ) ) ( not ( = ?auto_210947 ?auto_210951 ) ) ( not ( = ?auto_210947 ?auto_210952 ) ) ( not ( = ?auto_210949 ?auto_210948 ) ) ( not ( = ?auto_210949 ?auto_210950 ) ) ( not ( = ?auto_210949 ?auto_210951 ) ) ( not ( = ?auto_210949 ?auto_210952 ) ) ( not ( = ?auto_210948 ?auto_210950 ) ) ( not ( = ?auto_210948 ?auto_210951 ) ) ( not ( = ?auto_210948 ?auto_210952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_210950 ?auto_210951 ?auto_210952 )
      ( MAKE-7CRATE-VERIFY ?auto_210945 ?auto_210946 ?auto_210947 ?auto_210949 ?auto_210948 ?auto_210950 ?auto_210951 ?auto_210952 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211015 - SURFACE
      ?auto_211016 - SURFACE
      ?auto_211017 - SURFACE
      ?auto_211019 - SURFACE
      ?auto_211018 - SURFACE
      ?auto_211020 - SURFACE
      ?auto_211021 - SURFACE
      ?auto_211022 - SURFACE
    )
    :vars
    (
      ?auto_211026 - HOIST
      ?auto_211024 - PLACE
      ?auto_211027 - TRUCK
      ?auto_211023 - PLACE
      ?auto_211025 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_211026 ?auto_211024 ) ( SURFACE-AT ?auto_211021 ?auto_211024 ) ( CLEAR ?auto_211021 ) ( IS-CRATE ?auto_211022 ) ( not ( = ?auto_211021 ?auto_211022 ) ) ( AVAILABLE ?auto_211026 ) ( ON ?auto_211021 ?auto_211020 ) ( not ( = ?auto_211020 ?auto_211021 ) ) ( not ( = ?auto_211020 ?auto_211022 ) ) ( TRUCK-AT ?auto_211027 ?auto_211023 ) ( not ( = ?auto_211023 ?auto_211024 ) ) ( HOIST-AT ?auto_211025 ?auto_211023 ) ( LIFTING ?auto_211025 ?auto_211022 ) ( not ( = ?auto_211026 ?auto_211025 ) ) ( ON ?auto_211016 ?auto_211015 ) ( ON ?auto_211017 ?auto_211016 ) ( ON ?auto_211019 ?auto_211017 ) ( ON ?auto_211018 ?auto_211019 ) ( ON ?auto_211020 ?auto_211018 ) ( not ( = ?auto_211015 ?auto_211016 ) ) ( not ( = ?auto_211015 ?auto_211017 ) ) ( not ( = ?auto_211015 ?auto_211019 ) ) ( not ( = ?auto_211015 ?auto_211018 ) ) ( not ( = ?auto_211015 ?auto_211020 ) ) ( not ( = ?auto_211015 ?auto_211021 ) ) ( not ( = ?auto_211015 ?auto_211022 ) ) ( not ( = ?auto_211016 ?auto_211017 ) ) ( not ( = ?auto_211016 ?auto_211019 ) ) ( not ( = ?auto_211016 ?auto_211018 ) ) ( not ( = ?auto_211016 ?auto_211020 ) ) ( not ( = ?auto_211016 ?auto_211021 ) ) ( not ( = ?auto_211016 ?auto_211022 ) ) ( not ( = ?auto_211017 ?auto_211019 ) ) ( not ( = ?auto_211017 ?auto_211018 ) ) ( not ( = ?auto_211017 ?auto_211020 ) ) ( not ( = ?auto_211017 ?auto_211021 ) ) ( not ( = ?auto_211017 ?auto_211022 ) ) ( not ( = ?auto_211019 ?auto_211018 ) ) ( not ( = ?auto_211019 ?auto_211020 ) ) ( not ( = ?auto_211019 ?auto_211021 ) ) ( not ( = ?auto_211019 ?auto_211022 ) ) ( not ( = ?auto_211018 ?auto_211020 ) ) ( not ( = ?auto_211018 ?auto_211021 ) ) ( not ( = ?auto_211018 ?auto_211022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211020 ?auto_211021 ?auto_211022 )
      ( MAKE-7CRATE-VERIFY ?auto_211015 ?auto_211016 ?auto_211017 ?auto_211019 ?auto_211018 ?auto_211020 ?auto_211021 ?auto_211022 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211092 - SURFACE
      ?auto_211093 - SURFACE
      ?auto_211094 - SURFACE
      ?auto_211096 - SURFACE
      ?auto_211095 - SURFACE
      ?auto_211097 - SURFACE
      ?auto_211098 - SURFACE
      ?auto_211099 - SURFACE
    )
    :vars
    (
      ?auto_211100 - HOIST
      ?auto_211104 - PLACE
      ?auto_211105 - TRUCK
      ?auto_211102 - PLACE
      ?auto_211103 - HOIST
      ?auto_211101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_211100 ?auto_211104 ) ( SURFACE-AT ?auto_211098 ?auto_211104 ) ( CLEAR ?auto_211098 ) ( IS-CRATE ?auto_211099 ) ( not ( = ?auto_211098 ?auto_211099 ) ) ( AVAILABLE ?auto_211100 ) ( ON ?auto_211098 ?auto_211097 ) ( not ( = ?auto_211097 ?auto_211098 ) ) ( not ( = ?auto_211097 ?auto_211099 ) ) ( TRUCK-AT ?auto_211105 ?auto_211102 ) ( not ( = ?auto_211102 ?auto_211104 ) ) ( HOIST-AT ?auto_211103 ?auto_211102 ) ( not ( = ?auto_211100 ?auto_211103 ) ) ( AVAILABLE ?auto_211103 ) ( SURFACE-AT ?auto_211099 ?auto_211102 ) ( ON ?auto_211099 ?auto_211101 ) ( CLEAR ?auto_211099 ) ( not ( = ?auto_211098 ?auto_211101 ) ) ( not ( = ?auto_211099 ?auto_211101 ) ) ( not ( = ?auto_211097 ?auto_211101 ) ) ( ON ?auto_211093 ?auto_211092 ) ( ON ?auto_211094 ?auto_211093 ) ( ON ?auto_211096 ?auto_211094 ) ( ON ?auto_211095 ?auto_211096 ) ( ON ?auto_211097 ?auto_211095 ) ( not ( = ?auto_211092 ?auto_211093 ) ) ( not ( = ?auto_211092 ?auto_211094 ) ) ( not ( = ?auto_211092 ?auto_211096 ) ) ( not ( = ?auto_211092 ?auto_211095 ) ) ( not ( = ?auto_211092 ?auto_211097 ) ) ( not ( = ?auto_211092 ?auto_211098 ) ) ( not ( = ?auto_211092 ?auto_211099 ) ) ( not ( = ?auto_211092 ?auto_211101 ) ) ( not ( = ?auto_211093 ?auto_211094 ) ) ( not ( = ?auto_211093 ?auto_211096 ) ) ( not ( = ?auto_211093 ?auto_211095 ) ) ( not ( = ?auto_211093 ?auto_211097 ) ) ( not ( = ?auto_211093 ?auto_211098 ) ) ( not ( = ?auto_211093 ?auto_211099 ) ) ( not ( = ?auto_211093 ?auto_211101 ) ) ( not ( = ?auto_211094 ?auto_211096 ) ) ( not ( = ?auto_211094 ?auto_211095 ) ) ( not ( = ?auto_211094 ?auto_211097 ) ) ( not ( = ?auto_211094 ?auto_211098 ) ) ( not ( = ?auto_211094 ?auto_211099 ) ) ( not ( = ?auto_211094 ?auto_211101 ) ) ( not ( = ?auto_211096 ?auto_211095 ) ) ( not ( = ?auto_211096 ?auto_211097 ) ) ( not ( = ?auto_211096 ?auto_211098 ) ) ( not ( = ?auto_211096 ?auto_211099 ) ) ( not ( = ?auto_211096 ?auto_211101 ) ) ( not ( = ?auto_211095 ?auto_211097 ) ) ( not ( = ?auto_211095 ?auto_211098 ) ) ( not ( = ?auto_211095 ?auto_211099 ) ) ( not ( = ?auto_211095 ?auto_211101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211097 ?auto_211098 ?auto_211099 )
      ( MAKE-7CRATE-VERIFY ?auto_211092 ?auto_211093 ?auto_211094 ?auto_211096 ?auto_211095 ?auto_211097 ?auto_211098 ?auto_211099 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211170 - SURFACE
      ?auto_211171 - SURFACE
      ?auto_211172 - SURFACE
      ?auto_211174 - SURFACE
      ?auto_211173 - SURFACE
      ?auto_211175 - SURFACE
      ?auto_211176 - SURFACE
      ?auto_211177 - SURFACE
    )
    :vars
    (
      ?auto_211182 - HOIST
      ?auto_211180 - PLACE
      ?auto_211179 - PLACE
      ?auto_211183 - HOIST
      ?auto_211181 - SURFACE
      ?auto_211178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211182 ?auto_211180 ) ( SURFACE-AT ?auto_211176 ?auto_211180 ) ( CLEAR ?auto_211176 ) ( IS-CRATE ?auto_211177 ) ( not ( = ?auto_211176 ?auto_211177 ) ) ( AVAILABLE ?auto_211182 ) ( ON ?auto_211176 ?auto_211175 ) ( not ( = ?auto_211175 ?auto_211176 ) ) ( not ( = ?auto_211175 ?auto_211177 ) ) ( not ( = ?auto_211179 ?auto_211180 ) ) ( HOIST-AT ?auto_211183 ?auto_211179 ) ( not ( = ?auto_211182 ?auto_211183 ) ) ( AVAILABLE ?auto_211183 ) ( SURFACE-AT ?auto_211177 ?auto_211179 ) ( ON ?auto_211177 ?auto_211181 ) ( CLEAR ?auto_211177 ) ( not ( = ?auto_211176 ?auto_211181 ) ) ( not ( = ?auto_211177 ?auto_211181 ) ) ( not ( = ?auto_211175 ?auto_211181 ) ) ( TRUCK-AT ?auto_211178 ?auto_211180 ) ( ON ?auto_211171 ?auto_211170 ) ( ON ?auto_211172 ?auto_211171 ) ( ON ?auto_211174 ?auto_211172 ) ( ON ?auto_211173 ?auto_211174 ) ( ON ?auto_211175 ?auto_211173 ) ( not ( = ?auto_211170 ?auto_211171 ) ) ( not ( = ?auto_211170 ?auto_211172 ) ) ( not ( = ?auto_211170 ?auto_211174 ) ) ( not ( = ?auto_211170 ?auto_211173 ) ) ( not ( = ?auto_211170 ?auto_211175 ) ) ( not ( = ?auto_211170 ?auto_211176 ) ) ( not ( = ?auto_211170 ?auto_211177 ) ) ( not ( = ?auto_211170 ?auto_211181 ) ) ( not ( = ?auto_211171 ?auto_211172 ) ) ( not ( = ?auto_211171 ?auto_211174 ) ) ( not ( = ?auto_211171 ?auto_211173 ) ) ( not ( = ?auto_211171 ?auto_211175 ) ) ( not ( = ?auto_211171 ?auto_211176 ) ) ( not ( = ?auto_211171 ?auto_211177 ) ) ( not ( = ?auto_211171 ?auto_211181 ) ) ( not ( = ?auto_211172 ?auto_211174 ) ) ( not ( = ?auto_211172 ?auto_211173 ) ) ( not ( = ?auto_211172 ?auto_211175 ) ) ( not ( = ?auto_211172 ?auto_211176 ) ) ( not ( = ?auto_211172 ?auto_211177 ) ) ( not ( = ?auto_211172 ?auto_211181 ) ) ( not ( = ?auto_211174 ?auto_211173 ) ) ( not ( = ?auto_211174 ?auto_211175 ) ) ( not ( = ?auto_211174 ?auto_211176 ) ) ( not ( = ?auto_211174 ?auto_211177 ) ) ( not ( = ?auto_211174 ?auto_211181 ) ) ( not ( = ?auto_211173 ?auto_211175 ) ) ( not ( = ?auto_211173 ?auto_211176 ) ) ( not ( = ?auto_211173 ?auto_211177 ) ) ( not ( = ?auto_211173 ?auto_211181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211175 ?auto_211176 ?auto_211177 )
      ( MAKE-7CRATE-VERIFY ?auto_211170 ?auto_211171 ?auto_211172 ?auto_211174 ?auto_211173 ?auto_211175 ?auto_211176 ?auto_211177 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211248 - SURFACE
      ?auto_211249 - SURFACE
      ?auto_211250 - SURFACE
      ?auto_211252 - SURFACE
      ?auto_211251 - SURFACE
      ?auto_211253 - SURFACE
      ?auto_211254 - SURFACE
      ?auto_211255 - SURFACE
    )
    :vars
    (
      ?auto_211257 - HOIST
      ?auto_211260 - PLACE
      ?auto_211258 - PLACE
      ?auto_211259 - HOIST
      ?auto_211261 - SURFACE
      ?auto_211256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211257 ?auto_211260 ) ( IS-CRATE ?auto_211255 ) ( not ( = ?auto_211254 ?auto_211255 ) ) ( not ( = ?auto_211253 ?auto_211254 ) ) ( not ( = ?auto_211253 ?auto_211255 ) ) ( not ( = ?auto_211258 ?auto_211260 ) ) ( HOIST-AT ?auto_211259 ?auto_211258 ) ( not ( = ?auto_211257 ?auto_211259 ) ) ( AVAILABLE ?auto_211259 ) ( SURFACE-AT ?auto_211255 ?auto_211258 ) ( ON ?auto_211255 ?auto_211261 ) ( CLEAR ?auto_211255 ) ( not ( = ?auto_211254 ?auto_211261 ) ) ( not ( = ?auto_211255 ?auto_211261 ) ) ( not ( = ?auto_211253 ?auto_211261 ) ) ( TRUCK-AT ?auto_211256 ?auto_211260 ) ( SURFACE-AT ?auto_211253 ?auto_211260 ) ( CLEAR ?auto_211253 ) ( LIFTING ?auto_211257 ?auto_211254 ) ( IS-CRATE ?auto_211254 ) ( ON ?auto_211249 ?auto_211248 ) ( ON ?auto_211250 ?auto_211249 ) ( ON ?auto_211252 ?auto_211250 ) ( ON ?auto_211251 ?auto_211252 ) ( ON ?auto_211253 ?auto_211251 ) ( not ( = ?auto_211248 ?auto_211249 ) ) ( not ( = ?auto_211248 ?auto_211250 ) ) ( not ( = ?auto_211248 ?auto_211252 ) ) ( not ( = ?auto_211248 ?auto_211251 ) ) ( not ( = ?auto_211248 ?auto_211253 ) ) ( not ( = ?auto_211248 ?auto_211254 ) ) ( not ( = ?auto_211248 ?auto_211255 ) ) ( not ( = ?auto_211248 ?auto_211261 ) ) ( not ( = ?auto_211249 ?auto_211250 ) ) ( not ( = ?auto_211249 ?auto_211252 ) ) ( not ( = ?auto_211249 ?auto_211251 ) ) ( not ( = ?auto_211249 ?auto_211253 ) ) ( not ( = ?auto_211249 ?auto_211254 ) ) ( not ( = ?auto_211249 ?auto_211255 ) ) ( not ( = ?auto_211249 ?auto_211261 ) ) ( not ( = ?auto_211250 ?auto_211252 ) ) ( not ( = ?auto_211250 ?auto_211251 ) ) ( not ( = ?auto_211250 ?auto_211253 ) ) ( not ( = ?auto_211250 ?auto_211254 ) ) ( not ( = ?auto_211250 ?auto_211255 ) ) ( not ( = ?auto_211250 ?auto_211261 ) ) ( not ( = ?auto_211252 ?auto_211251 ) ) ( not ( = ?auto_211252 ?auto_211253 ) ) ( not ( = ?auto_211252 ?auto_211254 ) ) ( not ( = ?auto_211252 ?auto_211255 ) ) ( not ( = ?auto_211252 ?auto_211261 ) ) ( not ( = ?auto_211251 ?auto_211253 ) ) ( not ( = ?auto_211251 ?auto_211254 ) ) ( not ( = ?auto_211251 ?auto_211255 ) ) ( not ( = ?auto_211251 ?auto_211261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211253 ?auto_211254 ?auto_211255 )
      ( MAKE-7CRATE-VERIFY ?auto_211248 ?auto_211249 ?auto_211250 ?auto_211252 ?auto_211251 ?auto_211253 ?auto_211254 ?auto_211255 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_211326 - SURFACE
      ?auto_211327 - SURFACE
      ?auto_211328 - SURFACE
      ?auto_211330 - SURFACE
      ?auto_211329 - SURFACE
      ?auto_211331 - SURFACE
      ?auto_211332 - SURFACE
      ?auto_211333 - SURFACE
    )
    :vars
    (
      ?auto_211337 - HOIST
      ?auto_211335 - PLACE
      ?auto_211339 - PLACE
      ?auto_211336 - HOIST
      ?auto_211338 - SURFACE
      ?auto_211334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_211337 ?auto_211335 ) ( IS-CRATE ?auto_211333 ) ( not ( = ?auto_211332 ?auto_211333 ) ) ( not ( = ?auto_211331 ?auto_211332 ) ) ( not ( = ?auto_211331 ?auto_211333 ) ) ( not ( = ?auto_211339 ?auto_211335 ) ) ( HOIST-AT ?auto_211336 ?auto_211339 ) ( not ( = ?auto_211337 ?auto_211336 ) ) ( AVAILABLE ?auto_211336 ) ( SURFACE-AT ?auto_211333 ?auto_211339 ) ( ON ?auto_211333 ?auto_211338 ) ( CLEAR ?auto_211333 ) ( not ( = ?auto_211332 ?auto_211338 ) ) ( not ( = ?auto_211333 ?auto_211338 ) ) ( not ( = ?auto_211331 ?auto_211338 ) ) ( TRUCK-AT ?auto_211334 ?auto_211335 ) ( SURFACE-AT ?auto_211331 ?auto_211335 ) ( CLEAR ?auto_211331 ) ( IS-CRATE ?auto_211332 ) ( AVAILABLE ?auto_211337 ) ( IN ?auto_211332 ?auto_211334 ) ( ON ?auto_211327 ?auto_211326 ) ( ON ?auto_211328 ?auto_211327 ) ( ON ?auto_211330 ?auto_211328 ) ( ON ?auto_211329 ?auto_211330 ) ( ON ?auto_211331 ?auto_211329 ) ( not ( = ?auto_211326 ?auto_211327 ) ) ( not ( = ?auto_211326 ?auto_211328 ) ) ( not ( = ?auto_211326 ?auto_211330 ) ) ( not ( = ?auto_211326 ?auto_211329 ) ) ( not ( = ?auto_211326 ?auto_211331 ) ) ( not ( = ?auto_211326 ?auto_211332 ) ) ( not ( = ?auto_211326 ?auto_211333 ) ) ( not ( = ?auto_211326 ?auto_211338 ) ) ( not ( = ?auto_211327 ?auto_211328 ) ) ( not ( = ?auto_211327 ?auto_211330 ) ) ( not ( = ?auto_211327 ?auto_211329 ) ) ( not ( = ?auto_211327 ?auto_211331 ) ) ( not ( = ?auto_211327 ?auto_211332 ) ) ( not ( = ?auto_211327 ?auto_211333 ) ) ( not ( = ?auto_211327 ?auto_211338 ) ) ( not ( = ?auto_211328 ?auto_211330 ) ) ( not ( = ?auto_211328 ?auto_211329 ) ) ( not ( = ?auto_211328 ?auto_211331 ) ) ( not ( = ?auto_211328 ?auto_211332 ) ) ( not ( = ?auto_211328 ?auto_211333 ) ) ( not ( = ?auto_211328 ?auto_211338 ) ) ( not ( = ?auto_211330 ?auto_211329 ) ) ( not ( = ?auto_211330 ?auto_211331 ) ) ( not ( = ?auto_211330 ?auto_211332 ) ) ( not ( = ?auto_211330 ?auto_211333 ) ) ( not ( = ?auto_211330 ?auto_211338 ) ) ( not ( = ?auto_211329 ?auto_211331 ) ) ( not ( = ?auto_211329 ?auto_211332 ) ) ( not ( = ?auto_211329 ?auto_211333 ) ) ( not ( = ?auto_211329 ?auto_211338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_211331 ?auto_211332 ?auto_211333 )
      ( MAKE-7CRATE-VERIFY ?auto_211326 ?auto_211327 ?auto_211328 ?auto_211330 ?auto_211329 ?auto_211331 ?auto_211332 ?auto_211333 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214231 - SURFACE
      ?auto_214232 - SURFACE
      ?auto_214233 - SURFACE
      ?auto_214235 - SURFACE
      ?auto_214234 - SURFACE
      ?auto_214236 - SURFACE
      ?auto_214237 - SURFACE
      ?auto_214238 - SURFACE
      ?auto_214239 - SURFACE
    )
    :vars
    (
      ?auto_214241 - HOIST
      ?auto_214240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214241 ?auto_214240 ) ( SURFACE-AT ?auto_214238 ?auto_214240 ) ( CLEAR ?auto_214238 ) ( LIFTING ?auto_214241 ?auto_214239 ) ( IS-CRATE ?auto_214239 ) ( not ( = ?auto_214238 ?auto_214239 ) ) ( ON ?auto_214232 ?auto_214231 ) ( ON ?auto_214233 ?auto_214232 ) ( ON ?auto_214235 ?auto_214233 ) ( ON ?auto_214234 ?auto_214235 ) ( ON ?auto_214236 ?auto_214234 ) ( ON ?auto_214237 ?auto_214236 ) ( ON ?auto_214238 ?auto_214237 ) ( not ( = ?auto_214231 ?auto_214232 ) ) ( not ( = ?auto_214231 ?auto_214233 ) ) ( not ( = ?auto_214231 ?auto_214235 ) ) ( not ( = ?auto_214231 ?auto_214234 ) ) ( not ( = ?auto_214231 ?auto_214236 ) ) ( not ( = ?auto_214231 ?auto_214237 ) ) ( not ( = ?auto_214231 ?auto_214238 ) ) ( not ( = ?auto_214231 ?auto_214239 ) ) ( not ( = ?auto_214232 ?auto_214233 ) ) ( not ( = ?auto_214232 ?auto_214235 ) ) ( not ( = ?auto_214232 ?auto_214234 ) ) ( not ( = ?auto_214232 ?auto_214236 ) ) ( not ( = ?auto_214232 ?auto_214237 ) ) ( not ( = ?auto_214232 ?auto_214238 ) ) ( not ( = ?auto_214232 ?auto_214239 ) ) ( not ( = ?auto_214233 ?auto_214235 ) ) ( not ( = ?auto_214233 ?auto_214234 ) ) ( not ( = ?auto_214233 ?auto_214236 ) ) ( not ( = ?auto_214233 ?auto_214237 ) ) ( not ( = ?auto_214233 ?auto_214238 ) ) ( not ( = ?auto_214233 ?auto_214239 ) ) ( not ( = ?auto_214235 ?auto_214234 ) ) ( not ( = ?auto_214235 ?auto_214236 ) ) ( not ( = ?auto_214235 ?auto_214237 ) ) ( not ( = ?auto_214235 ?auto_214238 ) ) ( not ( = ?auto_214235 ?auto_214239 ) ) ( not ( = ?auto_214234 ?auto_214236 ) ) ( not ( = ?auto_214234 ?auto_214237 ) ) ( not ( = ?auto_214234 ?auto_214238 ) ) ( not ( = ?auto_214234 ?auto_214239 ) ) ( not ( = ?auto_214236 ?auto_214237 ) ) ( not ( = ?auto_214236 ?auto_214238 ) ) ( not ( = ?auto_214236 ?auto_214239 ) ) ( not ( = ?auto_214237 ?auto_214238 ) ) ( not ( = ?auto_214237 ?auto_214239 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_214238 ?auto_214239 )
      ( MAKE-8CRATE-VERIFY ?auto_214231 ?auto_214232 ?auto_214233 ?auto_214235 ?auto_214234 ?auto_214236 ?auto_214237 ?auto_214238 ?auto_214239 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214298 - SURFACE
      ?auto_214299 - SURFACE
      ?auto_214300 - SURFACE
      ?auto_214302 - SURFACE
      ?auto_214301 - SURFACE
      ?auto_214303 - SURFACE
      ?auto_214304 - SURFACE
      ?auto_214305 - SURFACE
      ?auto_214306 - SURFACE
    )
    :vars
    (
      ?auto_214307 - HOIST
      ?auto_214308 - PLACE
      ?auto_214309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214307 ?auto_214308 ) ( SURFACE-AT ?auto_214305 ?auto_214308 ) ( CLEAR ?auto_214305 ) ( IS-CRATE ?auto_214306 ) ( not ( = ?auto_214305 ?auto_214306 ) ) ( TRUCK-AT ?auto_214309 ?auto_214308 ) ( AVAILABLE ?auto_214307 ) ( IN ?auto_214306 ?auto_214309 ) ( ON ?auto_214305 ?auto_214304 ) ( not ( = ?auto_214304 ?auto_214305 ) ) ( not ( = ?auto_214304 ?auto_214306 ) ) ( ON ?auto_214299 ?auto_214298 ) ( ON ?auto_214300 ?auto_214299 ) ( ON ?auto_214302 ?auto_214300 ) ( ON ?auto_214301 ?auto_214302 ) ( ON ?auto_214303 ?auto_214301 ) ( ON ?auto_214304 ?auto_214303 ) ( not ( = ?auto_214298 ?auto_214299 ) ) ( not ( = ?auto_214298 ?auto_214300 ) ) ( not ( = ?auto_214298 ?auto_214302 ) ) ( not ( = ?auto_214298 ?auto_214301 ) ) ( not ( = ?auto_214298 ?auto_214303 ) ) ( not ( = ?auto_214298 ?auto_214304 ) ) ( not ( = ?auto_214298 ?auto_214305 ) ) ( not ( = ?auto_214298 ?auto_214306 ) ) ( not ( = ?auto_214299 ?auto_214300 ) ) ( not ( = ?auto_214299 ?auto_214302 ) ) ( not ( = ?auto_214299 ?auto_214301 ) ) ( not ( = ?auto_214299 ?auto_214303 ) ) ( not ( = ?auto_214299 ?auto_214304 ) ) ( not ( = ?auto_214299 ?auto_214305 ) ) ( not ( = ?auto_214299 ?auto_214306 ) ) ( not ( = ?auto_214300 ?auto_214302 ) ) ( not ( = ?auto_214300 ?auto_214301 ) ) ( not ( = ?auto_214300 ?auto_214303 ) ) ( not ( = ?auto_214300 ?auto_214304 ) ) ( not ( = ?auto_214300 ?auto_214305 ) ) ( not ( = ?auto_214300 ?auto_214306 ) ) ( not ( = ?auto_214302 ?auto_214301 ) ) ( not ( = ?auto_214302 ?auto_214303 ) ) ( not ( = ?auto_214302 ?auto_214304 ) ) ( not ( = ?auto_214302 ?auto_214305 ) ) ( not ( = ?auto_214302 ?auto_214306 ) ) ( not ( = ?auto_214301 ?auto_214303 ) ) ( not ( = ?auto_214301 ?auto_214304 ) ) ( not ( = ?auto_214301 ?auto_214305 ) ) ( not ( = ?auto_214301 ?auto_214306 ) ) ( not ( = ?auto_214303 ?auto_214304 ) ) ( not ( = ?auto_214303 ?auto_214305 ) ) ( not ( = ?auto_214303 ?auto_214306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214304 ?auto_214305 ?auto_214306 )
      ( MAKE-8CRATE-VERIFY ?auto_214298 ?auto_214299 ?auto_214300 ?auto_214302 ?auto_214301 ?auto_214303 ?auto_214304 ?auto_214305 ?auto_214306 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214374 - SURFACE
      ?auto_214375 - SURFACE
      ?auto_214376 - SURFACE
      ?auto_214378 - SURFACE
      ?auto_214377 - SURFACE
      ?auto_214379 - SURFACE
      ?auto_214380 - SURFACE
      ?auto_214381 - SURFACE
      ?auto_214382 - SURFACE
    )
    :vars
    (
      ?auto_214386 - HOIST
      ?auto_214384 - PLACE
      ?auto_214383 - TRUCK
      ?auto_214385 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214386 ?auto_214384 ) ( SURFACE-AT ?auto_214381 ?auto_214384 ) ( CLEAR ?auto_214381 ) ( IS-CRATE ?auto_214382 ) ( not ( = ?auto_214381 ?auto_214382 ) ) ( AVAILABLE ?auto_214386 ) ( IN ?auto_214382 ?auto_214383 ) ( ON ?auto_214381 ?auto_214380 ) ( not ( = ?auto_214380 ?auto_214381 ) ) ( not ( = ?auto_214380 ?auto_214382 ) ) ( TRUCK-AT ?auto_214383 ?auto_214385 ) ( not ( = ?auto_214385 ?auto_214384 ) ) ( ON ?auto_214375 ?auto_214374 ) ( ON ?auto_214376 ?auto_214375 ) ( ON ?auto_214378 ?auto_214376 ) ( ON ?auto_214377 ?auto_214378 ) ( ON ?auto_214379 ?auto_214377 ) ( ON ?auto_214380 ?auto_214379 ) ( not ( = ?auto_214374 ?auto_214375 ) ) ( not ( = ?auto_214374 ?auto_214376 ) ) ( not ( = ?auto_214374 ?auto_214378 ) ) ( not ( = ?auto_214374 ?auto_214377 ) ) ( not ( = ?auto_214374 ?auto_214379 ) ) ( not ( = ?auto_214374 ?auto_214380 ) ) ( not ( = ?auto_214374 ?auto_214381 ) ) ( not ( = ?auto_214374 ?auto_214382 ) ) ( not ( = ?auto_214375 ?auto_214376 ) ) ( not ( = ?auto_214375 ?auto_214378 ) ) ( not ( = ?auto_214375 ?auto_214377 ) ) ( not ( = ?auto_214375 ?auto_214379 ) ) ( not ( = ?auto_214375 ?auto_214380 ) ) ( not ( = ?auto_214375 ?auto_214381 ) ) ( not ( = ?auto_214375 ?auto_214382 ) ) ( not ( = ?auto_214376 ?auto_214378 ) ) ( not ( = ?auto_214376 ?auto_214377 ) ) ( not ( = ?auto_214376 ?auto_214379 ) ) ( not ( = ?auto_214376 ?auto_214380 ) ) ( not ( = ?auto_214376 ?auto_214381 ) ) ( not ( = ?auto_214376 ?auto_214382 ) ) ( not ( = ?auto_214378 ?auto_214377 ) ) ( not ( = ?auto_214378 ?auto_214379 ) ) ( not ( = ?auto_214378 ?auto_214380 ) ) ( not ( = ?auto_214378 ?auto_214381 ) ) ( not ( = ?auto_214378 ?auto_214382 ) ) ( not ( = ?auto_214377 ?auto_214379 ) ) ( not ( = ?auto_214377 ?auto_214380 ) ) ( not ( = ?auto_214377 ?auto_214381 ) ) ( not ( = ?auto_214377 ?auto_214382 ) ) ( not ( = ?auto_214379 ?auto_214380 ) ) ( not ( = ?auto_214379 ?auto_214381 ) ) ( not ( = ?auto_214379 ?auto_214382 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214380 ?auto_214381 ?auto_214382 )
      ( MAKE-8CRATE-VERIFY ?auto_214374 ?auto_214375 ?auto_214376 ?auto_214378 ?auto_214377 ?auto_214379 ?auto_214380 ?auto_214381 ?auto_214382 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214458 - SURFACE
      ?auto_214459 - SURFACE
      ?auto_214460 - SURFACE
      ?auto_214462 - SURFACE
      ?auto_214461 - SURFACE
      ?auto_214463 - SURFACE
      ?auto_214464 - SURFACE
      ?auto_214465 - SURFACE
      ?auto_214466 - SURFACE
    )
    :vars
    (
      ?auto_214467 - HOIST
      ?auto_214471 - PLACE
      ?auto_214470 - TRUCK
      ?auto_214468 - PLACE
      ?auto_214469 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_214467 ?auto_214471 ) ( SURFACE-AT ?auto_214465 ?auto_214471 ) ( CLEAR ?auto_214465 ) ( IS-CRATE ?auto_214466 ) ( not ( = ?auto_214465 ?auto_214466 ) ) ( AVAILABLE ?auto_214467 ) ( ON ?auto_214465 ?auto_214464 ) ( not ( = ?auto_214464 ?auto_214465 ) ) ( not ( = ?auto_214464 ?auto_214466 ) ) ( TRUCK-AT ?auto_214470 ?auto_214468 ) ( not ( = ?auto_214468 ?auto_214471 ) ) ( HOIST-AT ?auto_214469 ?auto_214468 ) ( LIFTING ?auto_214469 ?auto_214466 ) ( not ( = ?auto_214467 ?auto_214469 ) ) ( ON ?auto_214459 ?auto_214458 ) ( ON ?auto_214460 ?auto_214459 ) ( ON ?auto_214462 ?auto_214460 ) ( ON ?auto_214461 ?auto_214462 ) ( ON ?auto_214463 ?auto_214461 ) ( ON ?auto_214464 ?auto_214463 ) ( not ( = ?auto_214458 ?auto_214459 ) ) ( not ( = ?auto_214458 ?auto_214460 ) ) ( not ( = ?auto_214458 ?auto_214462 ) ) ( not ( = ?auto_214458 ?auto_214461 ) ) ( not ( = ?auto_214458 ?auto_214463 ) ) ( not ( = ?auto_214458 ?auto_214464 ) ) ( not ( = ?auto_214458 ?auto_214465 ) ) ( not ( = ?auto_214458 ?auto_214466 ) ) ( not ( = ?auto_214459 ?auto_214460 ) ) ( not ( = ?auto_214459 ?auto_214462 ) ) ( not ( = ?auto_214459 ?auto_214461 ) ) ( not ( = ?auto_214459 ?auto_214463 ) ) ( not ( = ?auto_214459 ?auto_214464 ) ) ( not ( = ?auto_214459 ?auto_214465 ) ) ( not ( = ?auto_214459 ?auto_214466 ) ) ( not ( = ?auto_214460 ?auto_214462 ) ) ( not ( = ?auto_214460 ?auto_214461 ) ) ( not ( = ?auto_214460 ?auto_214463 ) ) ( not ( = ?auto_214460 ?auto_214464 ) ) ( not ( = ?auto_214460 ?auto_214465 ) ) ( not ( = ?auto_214460 ?auto_214466 ) ) ( not ( = ?auto_214462 ?auto_214461 ) ) ( not ( = ?auto_214462 ?auto_214463 ) ) ( not ( = ?auto_214462 ?auto_214464 ) ) ( not ( = ?auto_214462 ?auto_214465 ) ) ( not ( = ?auto_214462 ?auto_214466 ) ) ( not ( = ?auto_214461 ?auto_214463 ) ) ( not ( = ?auto_214461 ?auto_214464 ) ) ( not ( = ?auto_214461 ?auto_214465 ) ) ( not ( = ?auto_214461 ?auto_214466 ) ) ( not ( = ?auto_214463 ?auto_214464 ) ) ( not ( = ?auto_214463 ?auto_214465 ) ) ( not ( = ?auto_214463 ?auto_214466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214464 ?auto_214465 ?auto_214466 )
      ( MAKE-8CRATE-VERIFY ?auto_214458 ?auto_214459 ?auto_214460 ?auto_214462 ?auto_214461 ?auto_214463 ?auto_214464 ?auto_214465 ?auto_214466 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214550 - SURFACE
      ?auto_214551 - SURFACE
      ?auto_214552 - SURFACE
      ?auto_214554 - SURFACE
      ?auto_214553 - SURFACE
      ?auto_214555 - SURFACE
      ?auto_214556 - SURFACE
      ?auto_214557 - SURFACE
      ?auto_214558 - SURFACE
    )
    :vars
    (
      ?auto_214561 - HOIST
      ?auto_214563 - PLACE
      ?auto_214564 - TRUCK
      ?auto_214560 - PLACE
      ?auto_214562 - HOIST
      ?auto_214559 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_214561 ?auto_214563 ) ( SURFACE-AT ?auto_214557 ?auto_214563 ) ( CLEAR ?auto_214557 ) ( IS-CRATE ?auto_214558 ) ( not ( = ?auto_214557 ?auto_214558 ) ) ( AVAILABLE ?auto_214561 ) ( ON ?auto_214557 ?auto_214556 ) ( not ( = ?auto_214556 ?auto_214557 ) ) ( not ( = ?auto_214556 ?auto_214558 ) ) ( TRUCK-AT ?auto_214564 ?auto_214560 ) ( not ( = ?auto_214560 ?auto_214563 ) ) ( HOIST-AT ?auto_214562 ?auto_214560 ) ( not ( = ?auto_214561 ?auto_214562 ) ) ( AVAILABLE ?auto_214562 ) ( SURFACE-AT ?auto_214558 ?auto_214560 ) ( ON ?auto_214558 ?auto_214559 ) ( CLEAR ?auto_214558 ) ( not ( = ?auto_214557 ?auto_214559 ) ) ( not ( = ?auto_214558 ?auto_214559 ) ) ( not ( = ?auto_214556 ?auto_214559 ) ) ( ON ?auto_214551 ?auto_214550 ) ( ON ?auto_214552 ?auto_214551 ) ( ON ?auto_214554 ?auto_214552 ) ( ON ?auto_214553 ?auto_214554 ) ( ON ?auto_214555 ?auto_214553 ) ( ON ?auto_214556 ?auto_214555 ) ( not ( = ?auto_214550 ?auto_214551 ) ) ( not ( = ?auto_214550 ?auto_214552 ) ) ( not ( = ?auto_214550 ?auto_214554 ) ) ( not ( = ?auto_214550 ?auto_214553 ) ) ( not ( = ?auto_214550 ?auto_214555 ) ) ( not ( = ?auto_214550 ?auto_214556 ) ) ( not ( = ?auto_214550 ?auto_214557 ) ) ( not ( = ?auto_214550 ?auto_214558 ) ) ( not ( = ?auto_214550 ?auto_214559 ) ) ( not ( = ?auto_214551 ?auto_214552 ) ) ( not ( = ?auto_214551 ?auto_214554 ) ) ( not ( = ?auto_214551 ?auto_214553 ) ) ( not ( = ?auto_214551 ?auto_214555 ) ) ( not ( = ?auto_214551 ?auto_214556 ) ) ( not ( = ?auto_214551 ?auto_214557 ) ) ( not ( = ?auto_214551 ?auto_214558 ) ) ( not ( = ?auto_214551 ?auto_214559 ) ) ( not ( = ?auto_214552 ?auto_214554 ) ) ( not ( = ?auto_214552 ?auto_214553 ) ) ( not ( = ?auto_214552 ?auto_214555 ) ) ( not ( = ?auto_214552 ?auto_214556 ) ) ( not ( = ?auto_214552 ?auto_214557 ) ) ( not ( = ?auto_214552 ?auto_214558 ) ) ( not ( = ?auto_214552 ?auto_214559 ) ) ( not ( = ?auto_214554 ?auto_214553 ) ) ( not ( = ?auto_214554 ?auto_214555 ) ) ( not ( = ?auto_214554 ?auto_214556 ) ) ( not ( = ?auto_214554 ?auto_214557 ) ) ( not ( = ?auto_214554 ?auto_214558 ) ) ( not ( = ?auto_214554 ?auto_214559 ) ) ( not ( = ?auto_214553 ?auto_214555 ) ) ( not ( = ?auto_214553 ?auto_214556 ) ) ( not ( = ?auto_214553 ?auto_214557 ) ) ( not ( = ?auto_214553 ?auto_214558 ) ) ( not ( = ?auto_214553 ?auto_214559 ) ) ( not ( = ?auto_214555 ?auto_214556 ) ) ( not ( = ?auto_214555 ?auto_214557 ) ) ( not ( = ?auto_214555 ?auto_214558 ) ) ( not ( = ?auto_214555 ?auto_214559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214556 ?auto_214557 ?auto_214558 )
      ( MAKE-8CRATE-VERIFY ?auto_214550 ?auto_214551 ?auto_214552 ?auto_214554 ?auto_214553 ?auto_214555 ?auto_214556 ?auto_214557 ?auto_214558 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214643 - SURFACE
      ?auto_214644 - SURFACE
      ?auto_214645 - SURFACE
      ?auto_214647 - SURFACE
      ?auto_214646 - SURFACE
      ?auto_214648 - SURFACE
      ?auto_214649 - SURFACE
      ?auto_214650 - SURFACE
      ?auto_214651 - SURFACE
    )
    :vars
    (
      ?auto_214652 - HOIST
      ?auto_214655 - PLACE
      ?auto_214654 - PLACE
      ?auto_214656 - HOIST
      ?auto_214657 - SURFACE
      ?auto_214653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214652 ?auto_214655 ) ( SURFACE-AT ?auto_214650 ?auto_214655 ) ( CLEAR ?auto_214650 ) ( IS-CRATE ?auto_214651 ) ( not ( = ?auto_214650 ?auto_214651 ) ) ( AVAILABLE ?auto_214652 ) ( ON ?auto_214650 ?auto_214649 ) ( not ( = ?auto_214649 ?auto_214650 ) ) ( not ( = ?auto_214649 ?auto_214651 ) ) ( not ( = ?auto_214654 ?auto_214655 ) ) ( HOIST-AT ?auto_214656 ?auto_214654 ) ( not ( = ?auto_214652 ?auto_214656 ) ) ( AVAILABLE ?auto_214656 ) ( SURFACE-AT ?auto_214651 ?auto_214654 ) ( ON ?auto_214651 ?auto_214657 ) ( CLEAR ?auto_214651 ) ( not ( = ?auto_214650 ?auto_214657 ) ) ( not ( = ?auto_214651 ?auto_214657 ) ) ( not ( = ?auto_214649 ?auto_214657 ) ) ( TRUCK-AT ?auto_214653 ?auto_214655 ) ( ON ?auto_214644 ?auto_214643 ) ( ON ?auto_214645 ?auto_214644 ) ( ON ?auto_214647 ?auto_214645 ) ( ON ?auto_214646 ?auto_214647 ) ( ON ?auto_214648 ?auto_214646 ) ( ON ?auto_214649 ?auto_214648 ) ( not ( = ?auto_214643 ?auto_214644 ) ) ( not ( = ?auto_214643 ?auto_214645 ) ) ( not ( = ?auto_214643 ?auto_214647 ) ) ( not ( = ?auto_214643 ?auto_214646 ) ) ( not ( = ?auto_214643 ?auto_214648 ) ) ( not ( = ?auto_214643 ?auto_214649 ) ) ( not ( = ?auto_214643 ?auto_214650 ) ) ( not ( = ?auto_214643 ?auto_214651 ) ) ( not ( = ?auto_214643 ?auto_214657 ) ) ( not ( = ?auto_214644 ?auto_214645 ) ) ( not ( = ?auto_214644 ?auto_214647 ) ) ( not ( = ?auto_214644 ?auto_214646 ) ) ( not ( = ?auto_214644 ?auto_214648 ) ) ( not ( = ?auto_214644 ?auto_214649 ) ) ( not ( = ?auto_214644 ?auto_214650 ) ) ( not ( = ?auto_214644 ?auto_214651 ) ) ( not ( = ?auto_214644 ?auto_214657 ) ) ( not ( = ?auto_214645 ?auto_214647 ) ) ( not ( = ?auto_214645 ?auto_214646 ) ) ( not ( = ?auto_214645 ?auto_214648 ) ) ( not ( = ?auto_214645 ?auto_214649 ) ) ( not ( = ?auto_214645 ?auto_214650 ) ) ( not ( = ?auto_214645 ?auto_214651 ) ) ( not ( = ?auto_214645 ?auto_214657 ) ) ( not ( = ?auto_214647 ?auto_214646 ) ) ( not ( = ?auto_214647 ?auto_214648 ) ) ( not ( = ?auto_214647 ?auto_214649 ) ) ( not ( = ?auto_214647 ?auto_214650 ) ) ( not ( = ?auto_214647 ?auto_214651 ) ) ( not ( = ?auto_214647 ?auto_214657 ) ) ( not ( = ?auto_214646 ?auto_214648 ) ) ( not ( = ?auto_214646 ?auto_214649 ) ) ( not ( = ?auto_214646 ?auto_214650 ) ) ( not ( = ?auto_214646 ?auto_214651 ) ) ( not ( = ?auto_214646 ?auto_214657 ) ) ( not ( = ?auto_214648 ?auto_214649 ) ) ( not ( = ?auto_214648 ?auto_214650 ) ) ( not ( = ?auto_214648 ?auto_214651 ) ) ( not ( = ?auto_214648 ?auto_214657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214649 ?auto_214650 ?auto_214651 )
      ( MAKE-8CRATE-VERIFY ?auto_214643 ?auto_214644 ?auto_214645 ?auto_214647 ?auto_214646 ?auto_214648 ?auto_214649 ?auto_214650 ?auto_214651 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214736 - SURFACE
      ?auto_214737 - SURFACE
      ?auto_214738 - SURFACE
      ?auto_214740 - SURFACE
      ?auto_214739 - SURFACE
      ?auto_214741 - SURFACE
      ?auto_214742 - SURFACE
      ?auto_214743 - SURFACE
      ?auto_214744 - SURFACE
    )
    :vars
    (
      ?auto_214748 - HOIST
      ?auto_214747 - PLACE
      ?auto_214749 - PLACE
      ?auto_214746 - HOIST
      ?auto_214750 - SURFACE
      ?auto_214745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214748 ?auto_214747 ) ( IS-CRATE ?auto_214744 ) ( not ( = ?auto_214743 ?auto_214744 ) ) ( not ( = ?auto_214742 ?auto_214743 ) ) ( not ( = ?auto_214742 ?auto_214744 ) ) ( not ( = ?auto_214749 ?auto_214747 ) ) ( HOIST-AT ?auto_214746 ?auto_214749 ) ( not ( = ?auto_214748 ?auto_214746 ) ) ( AVAILABLE ?auto_214746 ) ( SURFACE-AT ?auto_214744 ?auto_214749 ) ( ON ?auto_214744 ?auto_214750 ) ( CLEAR ?auto_214744 ) ( not ( = ?auto_214743 ?auto_214750 ) ) ( not ( = ?auto_214744 ?auto_214750 ) ) ( not ( = ?auto_214742 ?auto_214750 ) ) ( TRUCK-AT ?auto_214745 ?auto_214747 ) ( SURFACE-AT ?auto_214742 ?auto_214747 ) ( CLEAR ?auto_214742 ) ( LIFTING ?auto_214748 ?auto_214743 ) ( IS-CRATE ?auto_214743 ) ( ON ?auto_214737 ?auto_214736 ) ( ON ?auto_214738 ?auto_214737 ) ( ON ?auto_214740 ?auto_214738 ) ( ON ?auto_214739 ?auto_214740 ) ( ON ?auto_214741 ?auto_214739 ) ( ON ?auto_214742 ?auto_214741 ) ( not ( = ?auto_214736 ?auto_214737 ) ) ( not ( = ?auto_214736 ?auto_214738 ) ) ( not ( = ?auto_214736 ?auto_214740 ) ) ( not ( = ?auto_214736 ?auto_214739 ) ) ( not ( = ?auto_214736 ?auto_214741 ) ) ( not ( = ?auto_214736 ?auto_214742 ) ) ( not ( = ?auto_214736 ?auto_214743 ) ) ( not ( = ?auto_214736 ?auto_214744 ) ) ( not ( = ?auto_214736 ?auto_214750 ) ) ( not ( = ?auto_214737 ?auto_214738 ) ) ( not ( = ?auto_214737 ?auto_214740 ) ) ( not ( = ?auto_214737 ?auto_214739 ) ) ( not ( = ?auto_214737 ?auto_214741 ) ) ( not ( = ?auto_214737 ?auto_214742 ) ) ( not ( = ?auto_214737 ?auto_214743 ) ) ( not ( = ?auto_214737 ?auto_214744 ) ) ( not ( = ?auto_214737 ?auto_214750 ) ) ( not ( = ?auto_214738 ?auto_214740 ) ) ( not ( = ?auto_214738 ?auto_214739 ) ) ( not ( = ?auto_214738 ?auto_214741 ) ) ( not ( = ?auto_214738 ?auto_214742 ) ) ( not ( = ?auto_214738 ?auto_214743 ) ) ( not ( = ?auto_214738 ?auto_214744 ) ) ( not ( = ?auto_214738 ?auto_214750 ) ) ( not ( = ?auto_214740 ?auto_214739 ) ) ( not ( = ?auto_214740 ?auto_214741 ) ) ( not ( = ?auto_214740 ?auto_214742 ) ) ( not ( = ?auto_214740 ?auto_214743 ) ) ( not ( = ?auto_214740 ?auto_214744 ) ) ( not ( = ?auto_214740 ?auto_214750 ) ) ( not ( = ?auto_214739 ?auto_214741 ) ) ( not ( = ?auto_214739 ?auto_214742 ) ) ( not ( = ?auto_214739 ?auto_214743 ) ) ( not ( = ?auto_214739 ?auto_214744 ) ) ( not ( = ?auto_214739 ?auto_214750 ) ) ( not ( = ?auto_214741 ?auto_214742 ) ) ( not ( = ?auto_214741 ?auto_214743 ) ) ( not ( = ?auto_214741 ?auto_214744 ) ) ( not ( = ?auto_214741 ?auto_214750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214742 ?auto_214743 ?auto_214744 )
      ( MAKE-8CRATE-VERIFY ?auto_214736 ?auto_214737 ?auto_214738 ?auto_214740 ?auto_214739 ?auto_214741 ?auto_214742 ?auto_214743 ?auto_214744 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_214829 - SURFACE
      ?auto_214830 - SURFACE
      ?auto_214831 - SURFACE
      ?auto_214833 - SURFACE
      ?auto_214832 - SURFACE
      ?auto_214834 - SURFACE
      ?auto_214835 - SURFACE
      ?auto_214836 - SURFACE
      ?auto_214837 - SURFACE
    )
    :vars
    (
      ?auto_214840 - HOIST
      ?auto_214841 - PLACE
      ?auto_214843 - PLACE
      ?auto_214838 - HOIST
      ?auto_214842 - SURFACE
      ?auto_214839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_214840 ?auto_214841 ) ( IS-CRATE ?auto_214837 ) ( not ( = ?auto_214836 ?auto_214837 ) ) ( not ( = ?auto_214835 ?auto_214836 ) ) ( not ( = ?auto_214835 ?auto_214837 ) ) ( not ( = ?auto_214843 ?auto_214841 ) ) ( HOIST-AT ?auto_214838 ?auto_214843 ) ( not ( = ?auto_214840 ?auto_214838 ) ) ( AVAILABLE ?auto_214838 ) ( SURFACE-AT ?auto_214837 ?auto_214843 ) ( ON ?auto_214837 ?auto_214842 ) ( CLEAR ?auto_214837 ) ( not ( = ?auto_214836 ?auto_214842 ) ) ( not ( = ?auto_214837 ?auto_214842 ) ) ( not ( = ?auto_214835 ?auto_214842 ) ) ( TRUCK-AT ?auto_214839 ?auto_214841 ) ( SURFACE-AT ?auto_214835 ?auto_214841 ) ( CLEAR ?auto_214835 ) ( IS-CRATE ?auto_214836 ) ( AVAILABLE ?auto_214840 ) ( IN ?auto_214836 ?auto_214839 ) ( ON ?auto_214830 ?auto_214829 ) ( ON ?auto_214831 ?auto_214830 ) ( ON ?auto_214833 ?auto_214831 ) ( ON ?auto_214832 ?auto_214833 ) ( ON ?auto_214834 ?auto_214832 ) ( ON ?auto_214835 ?auto_214834 ) ( not ( = ?auto_214829 ?auto_214830 ) ) ( not ( = ?auto_214829 ?auto_214831 ) ) ( not ( = ?auto_214829 ?auto_214833 ) ) ( not ( = ?auto_214829 ?auto_214832 ) ) ( not ( = ?auto_214829 ?auto_214834 ) ) ( not ( = ?auto_214829 ?auto_214835 ) ) ( not ( = ?auto_214829 ?auto_214836 ) ) ( not ( = ?auto_214829 ?auto_214837 ) ) ( not ( = ?auto_214829 ?auto_214842 ) ) ( not ( = ?auto_214830 ?auto_214831 ) ) ( not ( = ?auto_214830 ?auto_214833 ) ) ( not ( = ?auto_214830 ?auto_214832 ) ) ( not ( = ?auto_214830 ?auto_214834 ) ) ( not ( = ?auto_214830 ?auto_214835 ) ) ( not ( = ?auto_214830 ?auto_214836 ) ) ( not ( = ?auto_214830 ?auto_214837 ) ) ( not ( = ?auto_214830 ?auto_214842 ) ) ( not ( = ?auto_214831 ?auto_214833 ) ) ( not ( = ?auto_214831 ?auto_214832 ) ) ( not ( = ?auto_214831 ?auto_214834 ) ) ( not ( = ?auto_214831 ?auto_214835 ) ) ( not ( = ?auto_214831 ?auto_214836 ) ) ( not ( = ?auto_214831 ?auto_214837 ) ) ( not ( = ?auto_214831 ?auto_214842 ) ) ( not ( = ?auto_214833 ?auto_214832 ) ) ( not ( = ?auto_214833 ?auto_214834 ) ) ( not ( = ?auto_214833 ?auto_214835 ) ) ( not ( = ?auto_214833 ?auto_214836 ) ) ( not ( = ?auto_214833 ?auto_214837 ) ) ( not ( = ?auto_214833 ?auto_214842 ) ) ( not ( = ?auto_214832 ?auto_214834 ) ) ( not ( = ?auto_214832 ?auto_214835 ) ) ( not ( = ?auto_214832 ?auto_214836 ) ) ( not ( = ?auto_214832 ?auto_214837 ) ) ( not ( = ?auto_214832 ?auto_214842 ) ) ( not ( = ?auto_214834 ?auto_214835 ) ) ( not ( = ?auto_214834 ?auto_214836 ) ) ( not ( = ?auto_214834 ?auto_214837 ) ) ( not ( = ?auto_214834 ?auto_214842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_214835 ?auto_214836 ?auto_214837 )
      ( MAKE-8CRATE-VERIFY ?auto_214829 ?auto_214830 ?auto_214831 ?auto_214833 ?auto_214832 ?auto_214834 ?auto_214835 ?auto_214836 ?auto_214837 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_218945 - SURFACE
      ?auto_218946 - SURFACE
      ?auto_218947 - SURFACE
      ?auto_218949 - SURFACE
      ?auto_218948 - SURFACE
      ?auto_218950 - SURFACE
      ?auto_218951 - SURFACE
      ?auto_218952 - SURFACE
      ?auto_218953 - SURFACE
      ?auto_218954 - SURFACE
    )
    :vars
    (
      ?auto_218956 - HOIST
      ?auto_218955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_218956 ?auto_218955 ) ( SURFACE-AT ?auto_218953 ?auto_218955 ) ( CLEAR ?auto_218953 ) ( LIFTING ?auto_218956 ?auto_218954 ) ( IS-CRATE ?auto_218954 ) ( not ( = ?auto_218953 ?auto_218954 ) ) ( ON ?auto_218946 ?auto_218945 ) ( ON ?auto_218947 ?auto_218946 ) ( ON ?auto_218949 ?auto_218947 ) ( ON ?auto_218948 ?auto_218949 ) ( ON ?auto_218950 ?auto_218948 ) ( ON ?auto_218951 ?auto_218950 ) ( ON ?auto_218952 ?auto_218951 ) ( ON ?auto_218953 ?auto_218952 ) ( not ( = ?auto_218945 ?auto_218946 ) ) ( not ( = ?auto_218945 ?auto_218947 ) ) ( not ( = ?auto_218945 ?auto_218949 ) ) ( not ( = ?auto_218945 ?auto_218948 ) ) ( not ( = ?auto_218945 ?auto_218950 ) ) ( not ( = ?auto_218945 ?auto_218951 ) ) ( not ( = ?auto_218945 ?auto_218952 ) ) ( not ( = ?auto_218945 ?auto_218953 ) ) ( not ( = ?auto_218945 ?auto_218954 ) ) ( not ( = ?auto_218946 ?auto_218947 ) ) ( not ( = ?auto_218946 ?auto_218949 ) ) ( not ( = ?auto_218946 ?auto_218948 ) ) ( not ( = ?auto_218946 ?auto_218950 ) ) ( not ( = ?auto_218946 ?auto_218951 ) ) ( not ( = ?auto_218946 ?auto_218952 ) ) ( not ( = ?auto_218946 ?auto_218953 ) ) ( not ( = ?auto_218946 ?auto_218954 ) ) ( not ( = ?auto_218947 ?auto_218949 ) ) ( not ( = ?auto_218947 ?auto_218948 ) ) ( not ( = ?auto_218947 ?auto_218950 ) ) ( not ( = ?auto_218947 ?auto_218951 ) ) ( not ( = ?auto_218947 ?auto_218952 ) ) ( not ( = ?auto_218947 ?auto_218953 ) ) ( not ( = ?auto_218947 ?auto_218954 ) ) ( not ( = ?auto_218949 ?auto_218948 ) ) ( not ( = ?auto_218949 ?auto_218950 ) ) ( not ( = ?auto_218949 ?auto_218951 ) ) ( not ( = ?auto_218949 ?auto_218952 ) ) ( not ( = ?auto_218949 ?auto_218953 ) ) ( not ( = ?auto_218949 ?auto_218954 ) ) ( not ( = ?auto_218948 ?auto_218950 ) ) ( not ( = ?auto_218948 ?auto_218951 ) ) ( not ( = ?auto_218948 ?auto_218952 ) ) ( not ( = ?auto_218948 ?auto_218953 ) ) ( not ( = ?auto_218948 ?auto_218954 ) ) ( not ( = ?auto_218950 ?auto_218951 ) ) ( not ( = ?auto_218950 ?auto_218952 ) ) ( not ( = ?auto_218950 ?auto_218953 ) ) ( not ( = ?auto_218950 ?auto_218954 ) ) ( not ( = ?auto_218951 ?auto_218952 ) ) ( not ( = ?auto_218951 ?auto_218953 ) ) ( not ( = ?auto_218951 ?auto_218954 ) ) ( not ( = ?auto_218952 ?auto_218953 ) ) ( not ( = ?auto_218952 ?auto_218954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_218953 ?auto_218954 )
      ( MAKE-9CRATE-VERIFY ?auto_218945 ?auto_218946 ?auto_218947 ?auto_218949 ?auto_218948 ?auto_218950 ?auto_218951 ?auto_218952 ?auto_218953 ?auto_218954 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219025 - SURFACE
      ?auto_219026 - SURFACE
      ?auto_219027 - SURFACE
      ?auto_219029 - SURFACE
      ?auto_219028 - SURFACE
      ?auto_219030 - SURFACE
      ?auto_219031 - SURFACE
      ?auto_219032 - SURFACE
      ?auto_219033 - SURFACE
      ?auto_219034 - SURFACE
    )
    :vars
    (
      ?auto_219036 - HOIST
      ?auto_219037 - PLACE
      ?auto_219035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219036 ?auto_219037 ) ( SURFACE-AT ?auto_219033 ?auto_219037 ) ( CLEAR ?auto_219033 ) ( IS-CRATE ?auto_219034 ) ( not ( = ?auto_219033 ?auto_219034 ) ) ( TRUCK-AT ?auto_219035 ?auto_219037 ) ( AVAILABLE ?auto_219036 ) ( IN ?auto_219034 ?auto_219035 ) ( ON ?auto_219033 ?auto_219032 ) ( not ( = ?auto_219032 ?auto_219033 ) ) ( not ( = ?auto_219032 ?auto_219034 ) ) ( ON ?auto_219026 ?auto_219025 ) ( ON ?auto_219027 ?auto_219026 ) ( ON ?auto_219029 ?auto_219027 ) ( ON ?auto_219028 ?auto_219029 ) ( ON ?auto_219030 ?auto_219028 ) ( ON ?auto_219031 ?auto_219030 ) ( ON ?auto_219032 ?auto_219031 ) ( not ( = ?auto_219025 ?auto_219026 ) ) ( not ( = ?auto_219025 ?auto_219027 ) ) ( not ( = ?auto_219025 ?auto_219029 ) ) ( not ( = ?auto_219025 ?auto_219028 ) ) ( not ( = ?auto_219025 ?auto_219030 ) ) ( not ( = ?auto_219025 ?auto_219031 ) ) ( not ( = ?auto_219025 ?auto_219032 ) ) ( not ( = ?auto_219025 ?auto_219033 ) ) ( not ( = ?auto_219025 ?auto_219034 ) ) ( not ( = ?auto_219026 ?auto_219027 ) ) ( not ( = ?auto_219026 ?auto_219029 ) ) ( not ( = ?auto_219026 ?auto_219028 ) ) ( not ( = ?auto_219026 ?auto_219030 ) ) ( not ( = ?auto_219026 ?auto_219031 ) ) ( not ( = ?auto_219026 ?auto_219032 ) ) ( not ( = ?auto_219026 ?auto_219033 ) ) ( not ( = ?auto_219026 ?auto_219034 ) ) ( not ( = ?auto_219027 ?auto_219029 ) ) ( not ( = ?auto_219027 ?auto_219028 ) ) ( not ( = ?auto_219027 ?auto_219030 ) ) ( not ( = ?auto_219027 ?auto_219031 ) ) ( not ( = ?auto_219027 ?auto_219032 ) ) ( not ( = ?auto_219027 ?auto_219033 ) ) ( not ( = ?auto_219027 ?auto_219034 ) ) ( not ( = ?auto_219029 ?auto_219028 ) ) ( not ( = ?auto_219029 ?auto_219030 ) ) ( not ( = ?auto_219029 ?auto_219031 ) ) ( not ( = ?auto_219029 ?auto_219032 ) ) ( not ( = ?auto_219029 ?auto_219033 ) ) ( not ( = ?auto_219029 ?auto_219034 ) ) ( not ( = ?auto_219028 ?auto_219030 ) ) ( not ( = ?auto_219028 ?auto_219031 ) ) ( not ( = ?auto_219028 ?auto_219032 ) ) ( not ( = ?auto_219028 ?auto_219033 ) ) ( not ( = ?auto_219028 ?auto_219034 ) ) ( not ( = ?auto_219030 ?auto_219031 ) ) ( not ( = ?auto_219030 ?auto_219032 ) ) ( not ( = ?auto_219030 ?auto_219033 ) ) ( not ( = ?auto_219030 ?auto_219034 ) ) ( not ( = ?auto_219031 ?auto_219032 ) ) ( not ( = ?auto_219031 ?auto_219033 ) ) ( not ( = ?auto_219031 ?auto_219034 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219032 ?auto_219033 ?auto_219034 )
      ( MAKE-9CRATE-VERIFY ?auto_219025 ?auto_219026 ?auto_219027 ?auto_219029 ?auto_219028 ?auto_219030 ?auto_219031 ?auto_219032 ?auto_219033 ?auto_219034 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219115 - SURFACE
      ?auto_219116 - SURFACE
      ?auto_219117 - SURFACE
      ?auto_219119 - SURFACE
      ?auto_219118 - SURFACE
      ?auto_219120 - SURFACE
      ?auto_219121 - SURFACE
      ?auto_219122 - SURFACE
      ?auto_219123 - SURFACE
      ?auto_219124 - SURFACE
    )
    :vars
    (
      ?auto_219127 - HOIST
      ?auto_219128 - PLACE
      ?auto_219125 - TRUCK
      ?auto_219126 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219127 ?auto_219128 ) ( SURFACE-AT ?auto_219123 ?auto_219128 ) ( CLEAR ?auto_219123 ) ( IS-CRATE ?auto_219124 ) ( not ( = ?auto_219123 ?auto_219124 ) ) ( AVAILABLE ?auto_219127 ) ( IN ?auto_219124 ?auto_219125 ) ( ON ?auto_219123 ?auto_219122 ) ( not ( = ?auto_219122 ?auto_219123 ) ) ( not ( = ?auto_219122 ?auto_219124 ) ) ( TRUCK-AT ?auto_219125 ?auto_219126 ) ( not ( = ?auto_219126 ?auto_219128 ) ) ( ON ?auto_219116 ?auto_219115 ) ( ON ?auto_219117 ?auto_219116 ) ( ON ?auto_219119 ?auto_219117 ) ( ON ?auto_219118 ?auto_219119 ) ( ON ?auto_219120 ?auto_219118 ) ( ON ?auto_219121 ?auto_219120 ) ( ON ?auto_219122 ?auto_219121 ) ( not ( = ?auto_219115 ?auto_219116 ) ) ( not ( = ?auto_219115 ?auto_219117 ) ) ( not ( = ?auto_219115 ?auto_219119 ) ) ( not ( = ?auto_219115 ?auto_219118 ) ) ( not ( = ?auto_219115 ?auto_219120 ) ) ( not ( = ?auto_219115 ?auto_219121 ) ) ( not ( = ?auto_219115 ?auto_219122 ) ) ( not ( = ?auto_219115 ?auto_219123 ) ) ( not ( = ?auto_219115 ?auto_219124 ) ) ( not ( = ?auto_219116 ?auto_219117 ) ) ( not ( = ?auto_219116 ?auto_219119 ) ) ( not ( = ?auto_219116 ?auto_219118 ) ) ( not ( = ?auto_219116 ?auto_219120 ) ) ( not ( = ?auto_219116 ?auto_219121 ) ) ( not ( = ?auto_219116 ?auto_219122 ) ) ( not ( = ?auto_219116 ?auto_219123 ) ) ( not ( = ?auto_219116 ?auto_219124 ) ) ( not ( = ?auto_219117 ?auto_219119 ) ) ( not ( = ?auto_219117 ?auto_219118 ) ) ( not ( = ?auto_219117 ?auto_219120 ) ) ( not ( = ?auto_219117 ?auto_219121 ) ) ( not ( = ?auto_219117 ?auto_219122 ) ) ( not ( = ?auto_219117 ?auto_219123 ) ) ( not ( = ?auto_219117 ?auto_219124 ) ) ( not ( = ?auto_219119 ?auto_219118 ) ) ( not ( = ?auto_219119 ?auto_219120 ) ) ( not ( = ?auto_219119 ?auto_219121 ) ) ( not ( = ?auto_219119 ?auto_219122 ) ) ( not ( = ?auto_219119 ?auto_219123 ) ) ( not ( = ?auto_219119 ?auto_219124 ) ) ( not ( = ?auto_219118 ?auto_219120 ) ) ( not ( = ?auto_219118 ?auto_219121 ) ) ( not ( = ?auto_219118 ?auto_219122 ) ) ( not ( = ?auto_219118 ?auto_219123 ) ) ( not ( = ?auto_219118 ?auto_219124 ) ) ( not ( = ?auto_219120 ?auto_219121 ) ) ( not ( = ?auto_219120 ?auto_219122 ) ) ( not ( = ?auto_219120 ?auto_219123 ) ) ( not ( = ?auto_219120 ?auto_219124 ) ) ( not ( = ?auto_219121 ?auto_219122 ) ) ( not ( = ?auto_219121 ?auto_219123 ) ) ( not ( = ?auto_219121 ?auto_219124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219122 ?auto_219123 ?auto_219124 )
      ( MAKE-9CRATE-VERIFY ?auto_219115 ?auto_219116 ?auto_219117 ?auto_219119 ?auto_219118 ?auto_219120 ?auto_219121 ?auto_219122 ?auto_219123 ?auto_219124 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219214 - SURFACE
      ?auto_219215 - SURFACE
      ?auto_219216 - SURFACE
      ?auto_219218 - SURFACE
      ?auto_219217 - SURFACE
      ?auto_219219 - SURFACE
      ?auto_219220 - SURFACE
      ?auto_219221 - SURFACE
      ?auto_219222 - SURFACE
      ?auto_219223 - SURFACE
    )
    :vars
    (
      ?auto_219226 - HOIST
      ?auto_219225 - PLACE
      ?auto_219224 - TRUCK
      ?auto_219228 - PLACE
      ?auto_219227 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_219226 ?auto_219225 ) ( SURFACE-AT ?auto_219222 ?auto_219225 ) ( CLEAR ?auto_219222 ) ( IS-CRATE ?auto_219223 ) ( not ( = ?auto_219222 ?auto_219223 ) ) ( AVAILABLE ?auto_219226 ) ( ON ?auto_219222 ?auto_219221 ) ( not ( = ?auto_219221 ?auto_219222 ) ) ( not ( = ?auto_219221 ?auto_219223 ) ) ( TRUCK-AT ?auto_219224 ?auto_219228 ) ( not ( = ?auto_219228 ?auto_219225 ) ) ( HOIST-AT ?auto_219227 ?auto_219228 ) ( LIFTING ?auto_219227 ?auto_219223 ) ( not ( = ?auto_219226 ?auto_219227 ) ) ( ON ?auto_219215 ?auto_219214 ) ( ON ?auto_219216 ?auto_219215 ) ( ON ?auto_219218 ?auto_219216 ) ( ON ?auto_219217 ?auto_219218 ) ( ON ?auto_219219 ?auto_219217 ) ( ON ?auto_219220 ?auto_219219 ) ( ON ?auto_219221 ?auto_219220 ) ( not ( = ?auto_219214 ?auto_219215 ) ) ( not ( = ?auto_219214 ?auto_219216 ) ) ( not ( = ?auto_219214 ?auto_219218 ) ) ( not ( = ?auto_219214 ?auto_219217 ) ) ( not ( = ?auto_219214 ?auto_219219 ) ) ( not ( = ?auto_219214 ?auto_219220 ) ) ( not ( = ?auto_219214 ?auto_219221 ) ) ( not ( = ?auto_219214 ?auto_219222 ) ) ( not ( = ?auto_219214 ?auto_219223 ) ) ( not ( = ?auto_219215 ?auto_219216 ) ) ( not ( = ?auto_219215 ?auto_219218 ) ) ( not ( = ?auto_219215 ?auto_219217 ) ) ( not ( = ?auto_219215 ?auto_219219 ) ) ( not ( = ?auto_219215 ?auto_219220 ) ) ( not ( = ?auto_219215 ?auto_219221 ) ) ( not ( = ?auto_219215 ?auto_219222 ) ) ( not ( = ?auto_219215 ?auto_219223 ) ) ( not ( = ?auto_219216 ?auto_219218 ) ) ( not ( = ?auto_219216 ?auto_219217 ) ) ( not ( = ?auto_219216 ?auto_219219 ) ) ( not ( = ?auto_219216 ?auto_219220 ) ) ( not ( = ?auto_219216 ?auto_219221 ) ) ( not ( = ?auto_219216 ?auto_219222 ) ) ( not ( = ?auto_219216 ?auto_219223 ) ) ( not ( = ?auto_219218 ?auto_219217 ) ) ( not ( = ?auto_219218 ?auto_219219 ) ) ( not ( = ?auto_219218 ?auto_219220 ) ) ( not ( = ?auto_219218 ?auto_219221 ) ) ( not ( = ?auto_219218 ?auto_219222 ) ) ( not ( = ?auto_219218 ?auto_219223 ) ) ( not ( = ?auto_219217 ?auto_219219 ) ) ( not ( = ?auto_219217 ?auto_219220 ) ) ( not ( = ?auto_219217 ?auto_219221 ) ) ( not ( = ?auto_219217 ?auto_219222 ) ) ( not ( = ?auto_219217 ?auto_219223 ) ) ( not ( = ?auto_219219 ?auto_219220 ) ) ( not ( = ?auto_219219 ?auto_219221 ) ) ( not ( = ?auto_219219 ?auto_219222 ) ) ( not ( = ?auto_219219 ?auto_219223 ) ) ( not ( = ?auto_219220 ?auto_219221 ) ) ( not ( = ?auto_219220 ?auto_219222 ) ) ( not ( = ?auto_219220 ?auto_219223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219221 ?auto_219222 ?auto_219223 )
      ( MAKE-9CRATE-VERIFY ?auto_219214 ?auto_219215 ?auto_219216 ?auto_219218 ?auto_219217 ?auto_219219 ?auto_219220 ?auto_219221 ?auto_219222 ?auto_219223 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219322 - SURFACE
      ?auto_219323 - SURFACE
      ?auto_219324 - SURFACE
      ?auto_219326 - SURFACE
      ?auto_219325 - SURFACE
      ?auto_219327 - SURFACE
      ?auto_219328 - SURFACE
      ?auto_219329 - SURFACE
      ?auto_219330 - SURFACE
      ?auto_219331 - SURFACE
    )
    :vars
    (
      ?auto_219333 - HOIST
      ?auto_219332 - PLACE
      ?auto_219335 - TRUCK
      ?auto_219337 - PLACE
      ?auto_219334 - HOIST
      ?auto_219336 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_219333 ?auto_219332 ) ( SURFACE-AT ?auto_219330 ?auto_219332 ) ( CLEAR ?auto_219330 ) ( IS-CRATE ?auto_219331 ) ( not ( = ?auto_219330 ?auto_219331 ) ) ( AVAILABLE ?auto_219333 ) ( ON ?auto_219330 ?auto_219329 ) ( not ( = ?auto_219329 ?auto_219330 ) ) ( not ( = ?auto_219329 ?auto_219331 ) ) ( TRUCK-AT ?auto_219335 ?auto_219337 ) ( not ( = ?auto_219337 ?auto_219332 ) ) ( HOIST-AT ?auto_219334 ?auto_219337 ) ( not ( = ?auto_219333 ?auto_219334 ) ) ( AVAILABLE ?auto_219334 ) ( SURFACE-AT ?auto_219331 ?auto_219337 ) ( ON ?auto_219331 ?auto_219336 ) ( CLEAR ?auto_219331 ) ( not ( = ?auto_219330 ?auto_219336 ) ) ( not ( = ?auto_219331 ?auto_219336 ) ) ( not ( = ?auto_219329 ?auto_219336 ) ) ( ON ?auto_219323 ?auto_219322 ) ( ON ?auto_219324 ?auto_219323 ) ( ON ?auto_219326 ?auto_219324 ) ( ON ?auto_219325 ?auto_219326 ) ( ON ?auto_219327 ?auto_219325 ) ( ON ?auto_219328 ?auto_219327 ) ( ON ?auto_219329 ?auto_219328 ) ( not ( = ?auto_219322 ?auto_219323 ) ) ( not ( = ?auto_219322 ?auto_219324 ) ) ( not ( = ?auto_219322 ?auto_219326 ) ) ( not ( = ?auto_219322 ?auto_219325 ) ) ( not ( = ?auto_219322 ?auto_219327 ) ) ( not ( = ?auto_219322 ?auto_219328 ) ) ( not ( = ?auto_219322 ?auto_219329 ) ) ( not ( = ?auto_219322 ?auto_219330 ) ) ( not ( = ?auto_219322 ?auto_219331 ) ) ( not ( = ?auto_219322 ?auto_219336 ) ) ( not ( = ?auto_219323 ?auto_219324 ) ) ( not ( = ?auto_219323 ?auto_219326 ) ) ( not ( = ?auto_219323 ?auto_219325 ) ) ( not ( = ?auto_219323 ?auto_219327 ) ) ( not ( = ?auto_219323 ?auto_219328 ) ) ( not ( = ?auto_219323 ?auto_219329 ) ) ( not ( = ?auto_219323 ?auto_219330 ) ) ( not ( = ?auto_219323 ?auto_219331 ) ) ( not ( = ?auto_219323 ?auto_219336 ) ) ( not ( = ?auto_219324 ?auto_219326 ) ) ( not ( = ?auto_219324 ?auto_219325 ) ) ( not ( = ?auto_219324 ?auto_219327 ) ) ( not ( = ?auto_219324 ?auto_219328 ) ) ( not ( = ?auto_219324 ?auto_219329 ) ) ( not ( = ?auto_219324 ?auto_219330 ) ) ( not ( = ?auto_219324 ?auto_219331 ) ) ( not ( = ?auto_219324 ?auto_219336 ) ) ( not ( = ?auto_219326 ?auto_219325 ) ) ( not ( = ?auto_219326 ?auto_219327 ) ) ( not ( = ?auto_219326 ?auto_219328 ) ) ( not ( = ?auto_219326 ?auto_219329 ) ) ( not ( = ?auto_219326 ?auto_219330 ) ) ( not ( = ?auto_219326 ?auto_219331 ) ) ( not ( = ?auto_219326 ?auto_219336 ) ) ( not ( = ?auto_219325 ?auto_219327 ) ) ( not ( = ?auto_219325 ?auto_219328 ) ) ( not ( = ?auto_219325 ?auto_219329 ) ) ( not ( = ?auto_219325 ?auto_219330 ) ) ( not ( = ?auto_219325 ?auto_219331 ) ) ( not ( = ?auto_219325 ?auto_219336 ) ) ( not ( = ?auto_219327 ?auto_219328 ) ) ( not ( = ?auto_219327 ?auto_219329 ) ) ( not ( = ?auto_219327 ?auto_219330 ) ) ( not ( = ?auto_219327 ?auto_219331 ) ) ( not ( = ?auto_219327 ?auto_219336 ) ) ( not ( = ?auto_219328 ?auto_219329 ) ) ( not ( = ?auto_219328 ?auto_219330 ) ) ( not ( = ?auto_219328 ?auto_219331 ) ) ( not ( = ?auto_219328 ?auto_219336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219329 ?auto_219330 ?auto_219331 )
      ( MAKE-9CRATE-VERIFY ?auto_219322 ?auto_219323 ?auto_219324 ?auto_219326 ?auto_219325 ?auto_219327 ?auto_219328 ?auto_219329 ?auto_219330 ?auto_219331 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219431 - SURFACE
      ?auto_219432 - SURFACE
      ?auto_219433 - SURFACE
      ?auto_219435 - SURFACE
      ?auto_219434 - SURFACE
      ?auto_219436 - SURFACE
      ?auto_219437 - SURFACE
      ?auto_219438 - SURFACE
      ?auto_219439 - SURFACE
      ?auto_219440 - SURFACE
    )
    :vars
    (
      ?auto_219446 - HOIST
      ?auto_219442 - PLACE
      ?auto_219441 - PLACE
      ?auto_219444 - HOIST
      ?auto_219445 - SURFACE
      ?auto_219443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219446 ?auto_219442 ) ( SURFACE-AT ?auto_219439 ?auto_219442 ) ( CLEAR ?auto_219439 ) ( IS-CRATE ?auto_219440 ) ( not ( = ?auto_219439 ?auto_219440 ) ) ( AVAILABLE ?auto_219446 ) ( ON ?auto_219439 ?auto_219438 ) ( not ( = ?auto_219438 ?auto_219439 ) ) ( not ( = ?auto_219438 ?auto_219440 ) ) ( not ( = ?auto_219441 ?auto_219442 ) ) ( HOIST-AT ?auto_219444 ?auto_219441 ) ( not ( = ?auto_219446 ?auto_219444 ) ) ( AVAILABLE ?auto_219444 ) ( SURFACE-AT ?auto_219440 ?auto_219441 ) ( ON ?auto_219440 ?auto_219445 ) ( CLEAR ?auto_219440 ) ( not ( = ?auto_219439 ?auto_219445 ) ) ( not ( = ?auto_219440 ?auto_219445 ) ) ( not ( = ?auto_219438 ?auto_219445 ) ) ( TRUCK-AT ?auto_219443 ?auto_219442 ) ( ON ?auto_219432 ?auto_219431 ) ( ON ?auto_219433 ?auto_219432 ) ( ON ?auto_219435 ?auto_219433 ) ( ON ?auto_219434 ?auto_219435 ) ( ON ?auto_219436 ?auto_219434 ) ( ON ?auto_219437 ?auto_219436 ) ( ON ?auto_219438 ?auto_219437 ) ( not ( = ?auto_219431 ?auto_219432 ) ) ( not ( = ?auto_219431 ?auto_219433 ) ) ( not ( = ?auto_219431 ?auto_219435 ) ) ( not ( = ?auto_219431 ?auto_219434 ) ) ( not ( = ?auto_219431 ?auto_219436 ) ) ( not ( = ?auto_219431 ?auto_219437 ) ) ( not ( = ?auto_219431 ?auto_219438 ) ) ( not ( = ?auto_219431 ?auto_219439 ) ) ( not ( = ?auto_219431 ?auto_219440 ) ) ( not ( = ?auto_219431 ?auto_219445 ) ) ( not ( = ?auto_219432 ?auto_219433 ) ) ( not ( = ?auto_219432 ?auto_219435 ) ) ( not ( = ?auto_219432 ?auto_219434 ) ) ( not ( = ?auto_219432 ?auto_219436 ) ) ( not ( = ?auto_219432 ?auto_219437 ) ) ( not ( = ?auto_219432 ?auto_219438 ) ) ( not ( = ?auto_219432 ?auto_219439 ) ) ( not ( = ?auto_219432 ?auto_219440 ) ) ( not ( = ?auto_219432 ?auto_219445 ) ) ( not ( = ?auto_219433 ?auto_219435 ) ) ( not ( = ?auto_219433 ?auto_219434 ) ) ( not ( = ?auto_219433 ?auto_219436 ) ) ( not ( = ?auto_219433 ?auto_219437 ) ) ( not ( = ?auto_219433 ?auto_219438 ) ) ( not ( = ?auto_219433 ?auto_219439 ) ) ( not ( = ?auto_219433 ?auto_219440 ) ) ( not ( = ?auto_219433 ?auto_219445 ) ) ( not ( = ?auto_219435 ?auto_219434 ) ) ( not ( = ?auto_219435 ?auto_219436 ) ) ( not ( = ?auto_219435 ?auto_219437 ) ) ( not ( = ?auto_219435 ?auto_219438 ) ) ( not ( = ?auto_219435 ?auto_219439 ) ) ( not ( = ?auto_219435 ?auto_219440 ) ) ( not ( = ?auto_219435 ?auto_219445 ) ) ( not ( = ?auto_219434 ?auto_219436 ) ) ( not ( = ?auto_219434 ?auto_219437 ) ) ( not ( = ?auto_219434 ?auto_219438 ) ) ( not ( = ?auto_219434 ?auto_219439 ) ) ( not ( = ?auto_219434 ?auto_219440 ) ) ( not ( = ?auto_219434 ?auto_219445 ) ) ( not ( = ?auto_219436 ?auto_219437 ) ) ( not ( = ?auto_219436 ?auto_219438 ) ) ( not ( = ?auto_219436 ?auto_219439 ) ) ( not ( = ?auto_219436 ?auto_219440 ) ) ( not ( = ?auto_219436 ?auto_219445 ) ) ( not ( = ?auto_219437 ?auto_219438 ) ) ( not ( = ?auto_219437 ?auto_219439 ) ) ( not ( = ?auto_219437 ?auto_219440 ) ) ( not ( = ?auto_219437 ?auto_219445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219438 ?auto_219439 ?auto_219440 )
      ( MAKE-9CRATE-VERIFY ?auto_219431 ?auto_219432 ?auto_219433 ?auto_219435 ?auto_219434 ?auto_219436 ?auto_219437 ?auto_219438 ?auto_219439 ?auto_219440 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219540 - SURFACE
      ?auto_219541 - SURFACE
      ?auto_219542 - SURFACE
      ?auto_219544 - SURFACE
      ?auto_219543 - SURFACE
      ?auto_219545 - SURFACE
      ?auto_219546 - SURFACE
      ?auto_219547 - SURFACE
      ?auto_219548 - SURFACE
      ?auto_219549 - SURFACE
    )
    :vars
    (
      ?auto_219550 - HOIST
      ?auto_219551 - PLACE
      ?auto_219552 - PLACE
      ?auto_219555 - HOIST
      ?auto_219554 - SURFACE
      ?auto_219553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219550 ?auto_219551 ) ( IS-CRATE ?auto_219549 ) ( not ( = ?auto_219548 ?auto_219549 ) ) ( not ( = ?auto_219547 ?auto_219548 ) ) ( not ( = ?auto_219547 ?auto_219549 ) ) ( not ( = ?auto_219552 ?auto_219551 ) ) ( HOIST-AT ?auto_219555 ?auto_219552 ) ( not ( = ?auto_219550 ?auto_219555 ) ) ( AVAILABLE ?auto_219555 ) ( SURFACE-AT ?auto_219549 ?auto_219552 ) ( ON ?auto_219549 ?auto_219554 ) ( CLEAR ?auto_219549 ) ( not ( = ?auto_219548 ?auto_219554 ) ) ( not ( = ?auto_219549 ?auto_219554 ) ) ( not ( = ?auto_219547 ?auto_219554 ) ) ( TRUCK-AT ?auto_219553 ?auto_219551 ) ( SURFACE-AT ?auto_219547 ?auto_219551 ) ( CLEAR ?auto_219547 ) ( LIFTING ?auto_219550 ?auto_219548 ) ( IS-CRATE ?auto_219548 ) ( ON ?auto_219541 ?auto_219540 ) ( ON ?auto_219542 ?auto_219541 ) ( ON ?auto_219544 ?auto_219542 ) ( ON ?auto_219543 ?auto_219544 ) ( ON ?auto_219545 ?auto_219543 ) ( ON ?auto_219546 ?auto_219545 ) ( ON ?auto_219547 ?auto_219546 ) ( not ( = ?auto_219540 ?auto_219541 ) ) ( not ( = ?auto_219540 ?auto_219542 ) ) ( not ( = ?auto_219540 ?auto_219544 ) ) ( not ( = ?auto_219540 ?auto_219543 ) ) ( not ( = ?auto_219540 ?auto_219545 ) ) ( not ( = ?auto_219540 ?auto_219546 ) ) ( not ( = ?auto_219540 ?auto_219547 ) ) ( not ( = ?auto_219540 ?auto_219548 ) ) ( not ( = ?auto_219540 ?auto_219549 ) ) ( not ( = ?auto_219540 ?auto_219554 ) ) ( not ( = ?auto_219541 ?auto_219542 ) ) ( not ( = ?auto_219541 ?auto_219544 ) ) ( not ( = ?auto_219541 ?auto_219543 ) ) ( not ( = ?auto_219541 ?auto_219545 ) ) ( not ( = ?auto_219541 ?auto_219546 ) ) ( not ( = ?auto_219541 ?auto_219547 ) ) ( not ( = ?auto_219541 ?auto_219548 ) ) ( not ( = ?auto_219541 ?auto_219549 ) ) ( not ( = ?auto_219541 ?auto_219554 ) ) ( not ( = ?auto_219542 ?auto_219544 ) ) ( not ( = ?auto_219542 ?auto_219543 ) ) ( not ( = ?auto_219542 ?auto_219545 ) ) ( not ( = ?auto_219542 ?auto_219546 ) ) ( not ( = ?auto_219542 ?auto_219547 ) ) ( not ( = ?auto_219542 ?auto_219548 ) ) ( not ( = ?auto_219542 ?auto_219549 ) ) ( not ( = ?auto_219542 ?auto_219554 ) ) ( not ( = ?auto_219544 ?auto_219543 ) ) ( not ( = ?auto_219544 ?auto_219545 ) ) ( not ( = ?auto_219544 ?auto_219546 ) ) ( not ( = ?auto_219544 ?auto_219547 ) ) ( not ( = ?auto_219544 ?auto_219548 ) ) ( not ( = ?auto_219544 ?auto_219549 ) ) ( not ( = ?auto_219544 ?auto_219554 ) ) ( not ( = ?auto_219543 ?auto_219545 ) ) ( not ( = ?auto_219543 ?auto_219546 ) ) ( not ( = ?auto_219543 ?auto_219547 ) ) ( not ( = ?auto_219543 ?auto_219548 ) ) ( not ( = ?auto_219543 ?auto_219549 ) ) ( not ( = ?auto_219543 ?auto_219554 ) ) ( not ( = ?auto_219545 ?auto_219546 ) ) ( not ( = ?auto_219545 ?auto_219547 ) ) ( not ( = ?auto_219545 ?auto_219548 ) ) ( not ( = ?auto_219545 ?auto_219549 ) ) ( not ( = ?auto_219545 ?auto_219554 ) ) ( not ( = ?auto_219546 ?auto_219547 ) ) ( not ( = ?auto_219546 ?auto_219548 ) ) ( not ( = ?auto_219546 ?auto_219549 ) ) ( not ( = ?auto_219546 ?auto_219554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219547 ?auto_219548 ?auto_219549 )
      ( MAKE-9CRATE-VERIFY ?auto_219540 ?auto_219541 ?auto_219542 ?auto_219544 ?auto_219543 ?auto_219545 ?auto_219546 ?auto_219547 ?auto_219548 ?auto_219549 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_219649 - SURFACE
      ?auto_219650 - SURFACE
      ?auto_219651 - SURFACE
      ?auto_219653 - SURFACE
      ?auto_219652 - SURFACE
      ?auto_219654 - SURFACE
      ?auto_219655 - SURFACE
      ?auto_219656 - SURFACE
      ?auto_219657 - SURFACE
      ?auto_219658 - SURFACE
    )
    :vars
    (
      ?auto_219661 - HOIST
      ?auto_219663 - PLACE
      ?auto_219664 - PLACE
      ?auto_219659 - HOIST
      ?auto_219662 - SURFACE
      ?auto_219660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_219661 ?auto_219663 ) ( IS-CRATE ?auto_219658 ) ( not ( = ?auto_219657 ?auto_219658 ) ) ( not ( = ?auto_219656 ?auto_219657 ) ) ( not ( = ?auto_219656 ?auto_219658 ) ) ( not ( = ?auto_219664 ?auto_219663 ) ) ( HOIST-AT ?auto_219659 ?auto_219664 ) ( not ( = ?auto_219661 ?auto_219659 ) ) ( AVAILABLE ?auto_219659 ) ( SURFACE-AT ?auto_219658 ?auto_219664 ) ( ON ?auto_219658 ?auto_219662 ) ( CLEAR ?auto_219658 ) ( not ( = ?auto_219657 ?auto_219662 ) ) ( not ( = ?auto_219658 ?auto_219662 ) ) ( not ( = ?auto_219656 ?auto_219662 ) ) ( TRUCK-AT ?auto_219660 ?auto_219663 ) ( SURFACE-AT ?auto_219656 ?auto_219663 ) ( CLEAR ?auto_219656 ) ( IS-CRATE ?auto_219657 ) ( AVAILABLE ?auto_219661 ) ( IN ?auto_219657 ?auto_219660 ) ( ON ?auto_219650 ?auto_219649 ) ( ON ?auto_219651 ?auto_219650 ) ( ON ?auto_219653 ?auto_219651 ) ( ON ?auto_219652 ?auto_219653 ) ( ON ?auto_219654 ?auto_219652 ) ( ON ?auto_219655 ?auto_219654 ) ( ON ?auto_219656 ?auto_219655 ) ( not ( = ?auto_219649 ?auto_219650 ) ) ( not ( = ?auto_219649 ?auto_219651 ) ) ( not ( = ?auto_219649 ?auto_219653 ) ) ( not ( = ?auto_219649 ?auto_219652 ) ) ( not ( = ?auto_219649 ?auto_219654 ) ) ( not ( = ?auto_219649 ?auto_219655 ) ) ( not ( = ?auto_219649 ?auto_219656 ) ) ( not ( = ?auto_219649 ?auto_219657 ) ) ( not ( = ?auto_219649 ?auto_219658 ) ) ( not ( = ?auto_219649 ?auto_219662 ) ) ( not ( = ?auto_219650 ?auto_219651 ) ) ( not ( = ?auto_219650 ?auto_219653 ) ) ( not ( = ?auto_219650 ?auto_219652 ) ) ( not ( = ?auto_219650 ?auto_219654 ) ) ( not ( = ?auto_219650 ?auto_219655 ) ) ( not ( = ?auto_219650 ?auto_219656 ) ) ( not ( = ?auto_219650 ?auto_219657 ) ) ( not ( = ?auto_219650 ?auto_219658 ) ) ( not ( = ?auto_219650 ?auto_219662 ) ) ( not ( = ?auto_219651 ?auto_219653 ) ) ( not ( = ?auto_219651 ?auto_219652 ) ) ( not ( = ?auto_219651 ?auto_219654 ) ) ( not ( = ?auto_219651 ?auto_219655 ) ) ( not ( = ?auto_219651 ?auto_219656 ) ) ( not ( = ?auto_219651 ?auto_219657 ) ) ( not ( = ?auto_219651 ?auto_219658 ) ) ( not ( = ?auto_219651 ?auto_219662 ) ) ( not ( = ?auto_219653 ?auto_219652 ) ) ( not ( = ?auto_219653 ?auto_219654 ) ) ( not ( = ?auto_219653 ?auto_219655 ) ) ( not ( = ?auto_219653 ?auto_219656 ) ) ( not ( = ?auto_219653 ?auto_219657 ) ) ( not ( = ?auto_219653 ?auto_219658 ) ) ( not ( = ?auto_219653 ?auto_219662 ) ) ( not ( = ?auto_219652 ?auto_219654 ) ) ( not ( = ?auto_219652 ?auto_219655 ) ) ( not ( = ?auto_219652 ?auto_219656 ) ) ( not ( = ?auto_219652 ?auto_219657 ) ) ( not ( = ?auto_219652 ?auto_219658 ) ) ( not ( = ?auto_219652 ?auto_219662 ) ) ( not ( = ?auto_219654 ?auto_219655 ) ) ( not ( = ?auto_219654 ?auto_219656 ) ) ( not ( = ?auto_219654 ?auto_219657 ) ) ( not ( = ?auto_219654 ?auto_219658 ) ) ( not ( = ?auto_219654 ?auto_219662 ) ) ( not ( = ?auto_219655 ?auto_219656 ) ) ( not ( = ?auto_219655 ?auto_219657 ) ) ( not ( = ?auto_219655 ?auto_219658 ) ) ( not ( = ?auto_219655 ?auto_219662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_219656 ?auto_219657 ?auto_219658 )
      ( MAKE-9CRATE-VERIFY ?auto_219649 ?auto_219650 ?auto_219651 ?auto_219653 ?auto_219652 ?auto_219654 ?auto_219655 ?auto_219656 ?auto_219657 ?auto_219658 ) )
  )

)

