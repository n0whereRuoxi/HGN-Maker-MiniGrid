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
      ?auto_81349 - SURFACE
      ?auto_81350 - SURFACE
    )
    :vars
    (
      ?auto_81351 - HOIST
      ?auto_81352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81351 ?auto_81352 ) ( SURFACE-AT ?auto_81349 ?auto_81352 ) ( CLEAR ?auto_81349 ) ( LIFTING ?auto_81351 ?auto_81350 ) ( IS-CRATE ?auto_81350 ) ( not ( = ?auto_81349 ?auto_81350 ) ) )
    :subtasks
    ( ( !DROP ?auto_81351 ?auto_81350 ?auto_81349 ?auto_81352 )
      ( MAKE-1CRATE-VERIFY ?auto_81349 ?auto_81350 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81353 - SURFACE
      ?auto_81354 - SURFACE
    )
    :vars
    (
      ?auto_81355 - HOIST
      ?auto_81356 - PLACE
      ?auto_81357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81355 ?auto_81356 ) ( SURFACE-AT ?auto_81353 ?auto_81356 ) ( CLEAR ?auto_81353 ) ( IS-CRATE ?auto_81354 ) ( not ( = ?auto_81353 ?auto_81354 ) ) ( TRUCK-AT ?auto_81357 ?auto_81356 ) ( AVAILABLE ?auto_81355 ) ( IN ?auto_81354 ?auto_81357 ) )
    :subtasks
    ( ( !UNLOAD ?auto_81355 ?auto_81354 ?auto_81357 ?auto_81356 )
      ( MAKE-1CRATE ?auto_81353 ?auto_81354 )
      ( MAKE-1CRATE-VERIFY ?auto_81353 ?auto_81354 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81358 - SURFACE
      ?auto_81359 - SURFACE
    )
    :vars
    (
      ?auto_81360 - HOIST
      ?auto_81362 - PLACE
      ?auto_81361 - TRUCK
      ?auto_81363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81360 ?auto_81362 ) ( SURFACE-AT ?auto_81358 ?auto_81362 ) ( CLEAR ?auto_81358 ) ( IS-CRATE ?auto_81359 ) ( not ( = ?auto_81358 ?auto_81359 ) ) ( AVAILABLE ?auto_81360 ) ( IN ?auto_81359 ?auto_81361 ) ( TRUCK-AT ?auto_81361 ?auto_81363 ) ( not ( = ?auto_81363 ?auto_81362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81361 ?auto_81363 ?auto_81362 )
      ( MAKE-1CRATE ?auto_81358 ?auto_81359 )
      ( MAKE-1CRATE-VERIFY ?auto_81358 ?auto_81359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81364 - SURFACE
      ?auto_81365 - SURFACE
    )
    :vars
    (
      ?auto_81366 - HOIST
      ?auto_81369 - PLACE
      ?auto_81367 - TRUCK
      ?auto_81368 - PLACE
      ?auto_81370 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81366 ?auto_81369 ) ( SURFACE-AT ?auto_81364 ?auto_81369 ) ( CLEAR ?auto_81364 ) ( IS-CRATE ?auto_81365 ) ( not ( = ?auto_81364 ?auto_81365 ) ) ( AVAILABLE ?auto_81366 ) ( TRUCK-AT ?auto_81367 ?auto_81368 ) ( not ( = ?auto_81368 ?auto_81369 ) ) ( HOIST-AT ?auto_81370 ?auto_81368 ) ( LIFTING ?auto_81370 ?auto_81365 ) ( not ( = ?auto_81366 ?auto_81370 ) ) )
    :subtasks
    ( ( !LOAD ?auto_81370 ?auto_81365 ?auto_81367 ?auto_81368 )
      ( MAKE-1CRATE ?auto_81364 ?auto_81365 )
      ( MAKE-1CRATE-VERIFY ?auto_81364 ?auto_81365 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81371 - SURFACE
      ?auto_81372 - SURFACE
    )
    :vars
    (
      ?auto_81377 - HOIST
      ?auto_81375 - PLACE
      ?auto_81374 - TRUCK
      ?auto_81373 - PLACE
      ?auto_81376 - HOIST
      ?auto_81378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81377 ?auto_81375 ) ( SURFACE-AT ?auto_81371 ?auto_81375 ) ( CLEAR ?auto_81371 ) ( IS-CRATE ?auto_81372 ) ( not ( = ?auto_81371 ?auto_81372 ) ) ( AVAILABLE ?auto_81377 ) ( TRUCK-AT ?auto_81374 ?auto_81373 ) ( not ( = ?auto_81373 ?auto_81375 ) ) ( HOIST-AT ?auto_81376 ?auto_81373 ) ( not ( = ?auto_81377 ?auto_81376 ) ) ( AVAILABLE ?auto_81376 ) ( SURFACE-AT ?auto_81372 ?auto_81373 ) ( ON ?auto_81372 ?auto_81378 ) ( CLEAR ?auto_81372 ) ( not ( = ?auto_81371 ?auto_81378 ) ) ( not ( = ?auto_81372 ?auto_81378 ) ) )
    :subtasks
    ( ( !LIFT ?auto_81376 ?auto_81372 ?auto_81378 ?auto_81373 )
      ( MAKE-1CRATE ?auto_81371 ?auto_81372 )
      ( MAKE-1CRATE-VERIFY ?auto_81371 ?auto_81372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81379 - SURFACE
      ?auto_81380 - SURFACE
    )
    :vars
    (
      ?auto_81385 - HOIST
      ?auto_81383 - PLACE
      ?auto_81381 - PLACE
      ?auto_81386 - HOIST
      ?auto_81382 - SURFACE
      ?auto_81384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81385 ?auto_81383 ) ( SURFACE-AT ?auto_81379 ?auto_81383 ) ( CLEAR ?auto_81379 ) ( IS-CRATE ?auto_81380 ) ( not ( = ?auto_81379 ?auto_81380 ) ) ( AVAILABLE ?auto_81385 ) ( not ( = ?auto_81381 ?auto_81383 ) ) ( HOIST-AT ?auto_81386 ?auto_81381 ) ( not ( = ?auto_81385 ?auto_81386 ) ) ( AVAILABLE ?auto_81386 ) ( SURFACE-AT ?auto_81380 ?auto_81381 ) ( ON ?auto_81380 ?auto_81382 ) ( CLEAR ?auto_81380 ) ( not ( = ?auto_81379 ?auto_81382 ) ) ( not ( = ?auto_81380 ?auto_81382 ) ) ( TRUCK-AT ?auto_81384 ?auto_81383 ) )
    :subtasks
    ( ( !DRIVE ?auto_81384 ?auto_81383 ?auto_81381 )
      ( MAKE-1CRATE ?auto_81379 ?auto_81380 )
      ( MAKE-1CRATE-VERIFY ?auto_81379 ?auto_81380 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81396 - SURFACE
      ?auto_81397 - SURFACE
      ?auto_81398 - SURFACE
    )
    :vars
    (
      ?auto_81399 - HOIST
      ?auto_81400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81399 ?auto_81400 ) ( SURFACE-AT ?auto_81397 ?auto_81400 ) ( CLEAR ?auto_81397 ) ( LIFTING ?auto_81399 ?auto_81398 ) ( IS-CRATE ?auto_81398 ) ( not ( = ?auto_81397 ?auto_81398 ) ) ( ON ?auto_81397 ?auto_81396 ) ( not ( = ?auto_81396 ?auto_81397 ) ) ( not ( = ?auto_81396 ?auto_81398 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81397 ?auto_81398 )
      ( MAKE-2CRATE-VERIFY ?auto_81396 ?auto_81397 ?auto_81398 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81406 - SURFACE
      ?auto_81407 - SURFACE
      ?auto_81408 - SURFACE
    )
    :vars
    (
      ?auto_81410 - HOIST
      ?auto_81411 - PLACE
      ?auto_81409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81410 ?auto_81411 ) ( SURFACE-AT ?auto_81407 ?auto_81411 ) ( CLEAR ?auto_81407 ) ( IS-CRATE ?auto_81408 ) ( not ( = ?auto_81407 ?auto_81408 ) ) ( TRUCK-AT ?auto_81409 ?auto_81411 ) ( AVAILABLE ?auto_81410 ) ( IN ?auto_81408 ?auto_81409 ) ( ON ?auto_81407 ?auto_81406 ) ( not ( = ?auto_81406 ?auto_81407 ) ) ( not ( = ?auto_81406 ?auto_81408 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81407 ?auto_81408 )
      ( MAKE-2CRATE-VERIFY ?auto_81406 ?auto_81407 ?auto_81408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81412 - SURFACE
      ?auto_81413 - SURFACE
    )
    :vars
    (
      ?auto_81417 - HOIST
      ?auto_81414 - PLACE
      ?auto_81415 - TRUCK
      ?auto_81416 - SURFACE
      ?auto_81418 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81417 ?auto_81414 ) ( SURFACE-AT ?auto_81412 ?auto_81414 ) ( CLEAR ?auto_81412 ) ( IS-CRATE ?auto_81413 ) ( not ( = ?auto_81412 ?auto_81413 ) ) ( AVAILABLE ?auto_81417 ) ( IN ?auto_81413 ?auto_81415 ) ( ON ?auto_81412 ?auto_81416 ) ( not ( = ?auto_81416 ?auto_81412 ) ) ( not ( = ?auto_81416 ?auto_81413 ) ) ( TRUCK-AT ?auto_81415 ?auto_81418 ) ( not ( = ?auto_81418 ?auto_81414 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81415 ?auto_81418 ?auto_81414 )
      ( MAKE-2CRATE ?auto_81416 ?auto_81412 ?auto_81413 )
      ( MAKE-1CRATE-VERIFY ?auto_81412 ?auto_81413 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81419 - SURFACE
      ?auto_81420 - SURFACE
      ?auto_81421 - SURFACE
    )
    :vars
    (
      ?auto_81425 - HOIST
      ?auto_81422 - PLACE
      ?auto_81423 - TRUCK
      ?auto_81424 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81425 ?auto_81422 ) ( SURFACE-AT ?auto_81420 ?auto_81422 ) ( CLEAR ?auto_81420 ) ( IS-CRATE ?auto_81421 ) ( not ( = ?auto_81420 ?auto_81421 ) ) ( AVAILABLE ?auto_81425 ) ( IN ?auto_81421 ?auto_81423 ) ( ON ?auto_81420 ?auto_81419 ) ( not ( = ?auto_81419 ?auto_81420 ) ) ( not ( = ?auto_81419 ?auto_81421 ) ) ( TRUCK-AT ?auto_81423 ?auto_81424 ) ( not ( = ?auto_81424 ?auto_81422 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81420 ?auto_81421 )
      ( MAKE-2CRATE-VERIFY ?auto_81419 ?auto_81420 ?auto_81421 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81426 - SURFACE
      ?auto_81427 - SURFACE
    )
    :vars
    (
      ?auto_81428 - HOIST
      ?auto_81432 - PLACE
      ?auto_81430 - SURFACE
      ?auto_81429 - TRUCK
      ?auto_81431 - PLACE
      ?auto_81433 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81428 ?auto_81432 ) ( SURFACE-AT ?auto_81426 ?auto_81432 ) ( CLEAR ?auto_81426 ) ( IS-CRATE ?auto_81427 ) ( not ( = ?auto_81426 ?auto_81427 ) ) ( AVAILABLE ?auto_81428 ) ( ON ?auto_81426 ?auto_81430 ) ( not ( = ?auto_81430 ?auto_81426 ) ) ( not ( = ?auto_81430 ?auto_81427 ) ) ( TRUCK-AT ?auto_81429 ?auto_81431 ) ( not ( = ?auto_81431 ?auto_81432 ) ) ( HOIST-AT ?auto_81433 ?auto_81431 ) ( LIFTING ?auto_81433 ?auto_81427 ) ( not ( = ?auto_81428 ?auto_81433 ) ) )
    :subtasks
    ( ( !LOAD ?auto_81433 ?auto_81427 ?auto_81429 ?auto_81431 )
      ( MAKE-2CRATE ?auto_81430 ?auto_81426 ?auto_81427 )
      ( MAKE-1CRATE-VERIFY ?auto_81426 ?auto_81427 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81434 - SURFACE
      ?auto_81435 - SURFACE
      ?auto_81436 - SURFACE
    )
    :vars
    (
      ?auto_81437 - HOIST
      ?auto_81438 - PLACE
      ?auto_81441 - TRUCK
      ?auto_81439 - PLACE
      ?auto_81440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81437 ?auto_81438 ) ( SURFACE-AT ?auto_81435 ?auto_81438 ) ( CLEAR ?auto_81435 ) ( IS-CRATE ?auto_81436 ) ( not ( = ?auto_81435 ?auto_81436 ) ) ( AVAILABLE ?auto_81437 ) ( ON ?auto_81435 ?auto_81434 ) ( not ( = ?auto_81434 ?auto_81435 ) ) ( not ( = ?auto_81434 ?auto_81436 ) ) ( TRUCK-AT ?auto_81441 ?auto_81439 ) ( not ( = ?auto_81439 ?auto_81438 ) ) ( HOIST-AT ?auto_81440 ?auto_81439 ) ( LIFTING ?auto_81440 ?auto_81436 ) ( not ( = ?auto_81437 ?auto_81440 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81435 ?auto_81436 )
      ( MAKE-2CRATE-VERIFY ?auto_81434 ?auto_81435 ?auto_81436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81442 - SURFACE
      ?auto_81443 - SURFACE
    )
    :vars
    (
      ?auto_81445 - HOIST
      ?auto_81448 - PLACE
      ?auto_81447 - SURFACE
      ?auto_81449 - TRUCK
      ?auto_81446 - PLACE
      ?auto_81444 - HOIST
      ?auto_81450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81445 ?auto_81448 ) ( SURFACE-AT ?auto_81442 ?auto_81448 ) ( CLEAR ?auto_81442 ) ( IS-CRATE ?auto_81443 ) ( not ( = ?auto_81442 ?auto_81443 ) ) ( AVAILABLE ?auto_81445 ) ( ON ?auto_81442 ?auto_81447 ) ( not ( = ?auto_81447 ?auto_81442 ) ) ( not ( = ?auto_81447 ?auto_81443 ) ) ( TRUCK-AT ?auto_81449 ?auto_81446 ) ( not ( = ?auto_81446 ?auto_81448 ) ) ( HOIST-AT ?auto_81444 ?auto_81446 ) ( not ( = ?auto_81445 ?auto_81444 ) ) ( AVAILABLE ?auto_81444 ) ( SURFACE-AT ?auto_81443 ?auto_81446 ) ( ON ?auto_81443 ?auto_81450 ) ( CLEAR ?auto_81443 ) ( not ( = ?auto_81442 ?auto_81450 ) ) ( not ( = ?auto_81443 ?auto_81450 ) ) ( not ( = ?auto_81447 ?auto_81450 ) ) )
    :subtasks
    ( ( !LIFT ?auto_81444 ?auto_81443 ?auto_81450 ?auto_81446 )
      ( MAKE-2CRATE ?auto_81447 ?auto_81442 ?auto_81443 )
      ( MAKE-1CRATE-VERIFY ?auto_81442 ?auto_81443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81451 - SURFACE
      ?auto_81452 - SURFACE
      ?auto_81453 - SURFACE
    )
    :vars
    (
      ?auto_81457 - HOIST
      ?auto_81454 - PLACE
      ?auto_81455 - TRUCK
      ?auto_81456 - PLACE
      ?auto_81458 - HOIST
      ?auto_81459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81457 ?auto_81454 ) ( SURFACE-AT ?auto_81452 ?auto_81454 ) ( CLEAR ?auto_81452 ) ( IS-CRATE ?auto_81453 ) ( not ( = ?auto_81452 ?auto_81453 ) ) ( AVAILABLE ?auto_81457 ) ( ON ?auto_81452 ?auto_81451 ) ( not ( = ?auto_81451 ?auto_81452 ) ) ( not ( = ?auto_81451 ?auto_81453 ) ) ( TRUCK-AT ?auto_81455 ?auto_81456 ) ( not ( = ?auto_81456 ?auto_81454 ) ) ( HOIST-AT ?auto_81458 ?auto_81456 ) ( not ( = ?auto_81457 ?auto_81458 ) ) ( AVAILABLE ?auto_81458 ) ( SURFACE-AT ?auto_81453 ?auto_81456 ) ( ON ?auto_81453 ?auto_81459 ) ( CLEAR ?auto_81453 ) ( not ( = ?auto_81452 ?auto_81459 ) ) ( not ( = ?auto_81453 ?auto_81459 ) ) ( not ( = ?auto_81451 ?auto_81459 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81452 ?auto_81453 )
      ( MAKE-2CRATE-VERIFY ?auto_81451 ?auto_81452 ?auto_81453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81460 - SURFACE
      ?auto_81461 - SURFACE
    )
    :vars
    (
      ?auto_81466 - HOIST
      ?auto_81465 - PLACE
      ?auto_81464 - SURFACE
      ?auto_81468 - PLACE
      ?auto_81463 - HOIST
      ?auto_81467 - SURFACE
      ?auto_81462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81466 ?auto_81465 ) ( SURFACE-AT ?auto_81460 ?auto_81465 ) ( CLEAR ?auto_81460 ) ( IS-CRATE ?auto_81461 ) ( not ( = ?auto_81460 ?auto_81461 ) ) ( AVAILABLE ?auto_81466 ) ( ON ?auto_81460 ?auto_81464 ) ( not ( = ?auto_81464 ?auto_81460 ) ) ( not ( = ?auto_81464 ?auto_81461 ) ) ( not ( = ?auto_81468 ?auto_81465 ) ) ( HOIST-AT ?auto_81463 ?auto_81468 ) ( not ( = ?auto_81466 ?auto_81463 ) ) ( AVAILABLE ?auto_81463 ) ( SURFACE-AT ?auto_81461 ?auto_81468 ) ( ON ?auto_81461 ?auto_81467 ) ( CLEAR ?auto_81461 ) ( not ( = ?auto_81460 ?auto_81467 ) ) ( not ( = ?auto_81461 ?auto_81467 ) ) ( not ( = ?auto_81464 ?auto_81467 ) ) ( TRUCK-AT ?auto_81462 ?auto_81465 ) )
    :subtasks
    ( ( !DRIVE ?auto_81462 ?auto_81465 ?auto_81468 )
      ( MAKE-2CRATE ?auto_81464 ?auto_81460 ?auto_81461 )
      ( MAKE-1CRATE-VERIFY ?auto_81460 ?auto_81461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81469 - SURFACE
      ?auto_81470 - SURFACE
      ?auto_81471 - SURFACE
    )
    :vars
    (
      ?auto_81476 - HOIST
      ?auto_81477 - PLACE
      ?auto_81472 - PLACE
      ?auto_81474 - HOIST
      ?auto_81473 - SURFACE
      ?auto_81475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81476 ?auto_81477 ) ( SURFACE-AT ?auto_81470 ?auto_81477 ) ( CLEAR ?auto_81470 ) ( IS-CRATE ?auto_81471 ) ( not ( = ?auto_81470 ?auto_81471 ) ) ( AVAILABLE ?auto_81476 ) ( ON ?auto_81470 ?auto_81469 ) ( not ( = ?auto_81469 ?auto_81470 ) ) ( not ( = ?auto_81469 ?auto_81471 ) ) ( not ( = ?auto_81472 ?auto_81477 ) ) ( HOIST-AT ?auto_81474 ?auto_81472 ) ( not ( = ?auto_81476 ?auto_81474 ) ) ( AVAILABLE ?auto_81474 ) ( SURFACE-AT ?auto_81471 ?auto_81472 ) ( ON ?auto_81471 ?auto_81473 ) ( CLEAR ?auto_81471 ) ( not ( = ?auto_81470 ?auto_81473 ) ) ( not ( = ?auto_81471 ?auto_81473 ) ) ( not ( = ?auto_81469 ?auto_81473 ) ) ( TRUCK-AT ?auto_81475 ?auto_81477 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81470 ?auto_81471 )
      ( MAKE-2CRATE-VERIFY ?auto_81469 ?auto_81470 ?auto_81471 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81478 - SURFACE
      ?auto_81479 - SURFACE
    )
    :vars
    (
      ?auto_81482 - HOIST
      ?auto_81480 - PLACE
      ?auto_81483 - SURFACE
      ?auto_81486 - PLACE
      ?auto_81481 - HOIST
      ?auto_81484 - SURFACE
      ?auto_81485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81482 ?auto_81480 ) ( IS-CRATE ?auto_81479 ) ( not ( = ?auto_81478 ?auto_81479 ) ) ( not ( = ?auto_81483 ?auto_81478 ) ) ( not ( = ?auto_81483 ?auto_81479 ) ) ( not ( = ?auto_81486 ?auto_81480 ) ) ( HOIST-AT ?auto_81481 ?auto_81486 ) ( not ( = ?auto_81482 ?auto_81481 ) ) ( AVAILABLE ?auto_81481 ) ( SURFACE-AT ?auto_81479 ?auto_81486 ) ( ON ?auto_81479 ?auto_81484 ) ( CLEAR ?auto_81479 ) ( not ( = ?auto_81478 ?auto_81484 ) ) ( not ( = ?auto_81479 ?auto_81484 ) ) ( not ( = ?auto_81483 ?auto_81484 ) ) ( TRUCK-AT ?auto_81485 ?auto_81480 ) ( SURFACE-AT ?auto_81483 ?auto_81480 ) ( CLEAR ?auto_81483 ) ( LIFTING ?auto_81482 ?auto_81478 ) ( IS-CRATE ?auto_81478 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81483 ?auto_81478 )
      ( MAKE-2CRATE ?auto_81483 ?auto_81478 ?auto_81479 )
      ( MAKE-1CRATE-VERIFY ?auto_81478 ?auto_81479 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81487 - SURFACE
      ?auto_81488 - SURFACE
      ?auto_81489 - SURFACE
    )
    :vars
    (
      ?auto_81491 - HOIST
      ?auto_81493 - PLACE
      ?auto_81490 - PLACE
      ?auto_81492 - HOIST
      ?auto_81495 - SURFACE
      ?auto_81494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81491 ?auto_81493 ) ( IS-CRATE ?auto_81489 ) ( not ( = ?auto_81488 ?auto_81489 ) ) ( not ( = ?auto_81487 ?auto_81488 ) ) ( not ( = ?auto_81487 ?auto_81489 ) ) ( not ( = ?auto_81490 ?auto_81493 ) ) ( HOIST-AT ?auto_81492 ?auto_81490 ) ( not ( = ?auto_81491 ?auto_81492 ) ) ( AVAILABLE ?auto_81492 ) ( SURFACE-AT ?auto_81489 ?auto_81490 ) ( ON ?auto_81489 ?auto_81495 ) ( CLEAR ?auto_81489 ) ( not ( = ?auto_81488 ?auto_81495 ) ) ( not ( = ?auto_81489 ?auto_81495 ) ) ( not ( = ?auto_81487 ?auto_81495 ) ) ( TRUCK-AT ?auto_81494 ?auto_81493 ) ( SURFACE-AT ?auto_81487 ?auto_81493 ) ( CLEAR ?auto_81487 ) ( LIFTING ?auto_81491 ?auto_81488 ) ( IS-CRATE ?auto_81488 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81488 ?auto_81489 )
      ( MAKE-2CRATE-VERIFY ?auto_81487 ?auto_81488 ?auto_81489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81496 - SURFACE
      ?auto_81497 - SURFACE
    )
    :vars
    (
      ?auto_81498 - HOIST
      ?auto_81503 - PLACE
      ?auto_81500 - SURFACE
      ?auto_81502 - PLACE
      ?auto_81499 - HOIST
      ?auto_81501 - SURFACE
      ?auto_81504 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81498 ?auto_81503 ) ( IS-CRATE ?auto_81497 ) ( not ( = ?auto_81496 ?auto_81497 ) ) ( not ( = ?auto_81500 ?auto_81496 ) ) ( not ( = ?auto_81500 ?auto_81497 ) ) ( not ( = ?auto_81502 ?auto_81503 ) ) ( HOIST-AT ?auto_81499 ?auto_81502 ) ( not ( = ?auto_81498 ?auto_81499 ) ) ( AVAILABLE ?auto_81499 ) ( SURFACE-AT ?auto_81497 ?auto_81502 ) ( ON ?auto_81497 ?auto_81501 ) ( CLEAR ?auto_81497 ) ( not ( = ?auto_81496 ?auto_81501 ) ) ( not ( = ?auto_81497 ?auto_81501 ) ) ( not ( = ?auto_81500 ?auto_81501 ) ) ( TRUCK-AT ?auto_81504 ?auto_81503 ) ( SURFACE-AT ?auto_81500 ?auto_81503 ) ( CLEAR ?auto_81500 ) ( IS-CRATE ?auto_81496 ) ( AVAILABLE ?auto_81498 ) ( IN ?auto_81496 ?auto_81504 ) )
    :subtasks
    ( ( !UNLOAD ?auto_81498 ?auto_81496 ?auto_81504 ?auto_81503 )
      ( MAKE-2CRATE ?auto_81500 ?auto_81496 ?auto_81497 )
      ( MAKE-1CRATE-VERIFY ?auto_81496 ?auto_81497 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_81505 - SURFACE
      ?auto_81506 - SURFACE
      ?auto_81507 - SURFACE
    )
    :vars
    (
      ?auto_81509 - HOIST
      ?auto_81511 - PLACE
      ?auto_81510 - PLACE
      ?auto_81508 - HOIST
      ?auto_81513 - SURFACE
      ?auto_81512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81509 ?auto_81511 ) ( IS-CRATE ?auto_81507 ) ( not ( = ?auto_81506 ?auto_81507 ) ) ( not ( = ?auto_81505 ?auto_81506 ) ) ( not ( = ?auto_81505 ?auto_81507 ) ) ( not ( = ?auto_81510 ?auto_81511 ) ) ( HOIST-AT ?auto_81508 ?auto_81510 ) ( not ( = ?auto_81509 ?auto_81508 ) ) ( AVAILABLE ?auto_81508 ) ( SURFACE-AT ?auto_81507 ?auto_81510 ) ( ON ?auto_81507 ?auto_81513 ) ( CLEAR ?auto_81507 ) ( not ( = ?auto_81506 ?auto_81513 ) ) ( not ( = ?auto_81507 ?auto_81513 ) ) ( not ( = ?auto_81505 ?auto_81513 ) ) ( TRUCK-AT ?auto_81512 ?auto_81511 ) ( SURFACE-AT ?auto_81505 ?auto_81511 ) ( CLEAR ?auto_81505 ) ( IS-CRATE ?auto_81506 ) ( AVAILABLE ?auto_81509 ) ( IN ?auto_81506 ?auto_81512 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81506 ?auto_81507 )
      ( MAKE-2CRATE-VERIFY ?auto_81505 ?auto_81506 ?auto_81507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81550 - SURFACE
      ?auto_81551 - SURFACE
    )
    :vars
    (
      ?auto_81552 - HOIST
      ?auto_81553 - PLACE
      ?auto_81555 - SURFACE
      ?auto_81557 - PLACE
      ?auto_81556 - HOIST
      ?auto_81558 - SURFACE
      ?auto_81554 - TRUCK
      ?auto_81559 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81552 ?auto_81553 ) ( SURFACE-AT ?auto_81550 ?auto_81553 ) ( CLEAR ?auto_81550 ) ( IS-CRATE ?auto_81551 ) ( not ( = ?auto_81550 ?auto_81551 ) ) ( AVAILABLE ?auto_81552 ) ( ON ?auto_81550 ?auto_81555 ) ( not ( = ?auto_81555 ?auto_81550 ) ) ( not ( = ?auto_81555 ?auto_81551 ) ) ( not ( = ?auto_81557 ?auto_81553 ) ) ( HOIST-AT ?auto_81556 ?auto_81557 ) ( not ( = ?auto_81552 ?auto_81556 ) ) ( AVAILABLE ?auto_81556 ) ( SURFACE-AT ?auto_81551 ?auto_81557 ) ( ON ?auto_81551 ?auto_81558 ) ( CLEAR ?auto_81551 ) ( not ( = ?auto_81550 ?auto_81558 ) ) ( not ( = ?auto_81551 ?auto_81558 ) ) ( not ( = ?auto_81555 ?auto_81558 ) ) ( TRUCK-AT ?auto_81554 ?auto_81559 ) ( not ( = ?auto_81559 ?auto_81553 ) ) ( not ( = ?auto_81557 ?auto_81559 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_81554 ?auto_81559 ?auto_81553 )
      ( MAKE-1CRATE ?auto_81550 ?auto_81551 )
      ( MAKE-1CRATE-VERIFY ?auto_81550 ?auto_81551 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81589 - SURFACE
      ?auto_81590 - SURFACE
      ?auto_81591 - SURFACE
      ?auto_81592 - SURFACE
    )
    :vars
    (
      ?auto_81593 - HOIST
      ?auto_81594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81593 ?auto_81594 ) ( SURFACE-AT ?auto_81591 ?auto_81594 ) ( CLEAR ?auto_81591 ) ( LIFTING ?auto_81593 ?auto_81592 ) ( IS-CRATE ?auto_81592 ) ( not ( = ?auto_81591 ?auto_81592 ) ) ( ON ?auto_81590 ?auto_81589 ) ( ON ?auto_81591 ?auto_81590 ) ( not ( = ?auto_81589 ?auto_81590 ) ) ( not ( = ?auto_81589 ?auto_81591 ) ) ( not ( = ?auto_81589 ?auto_81592 ) ) ( not ( = ?auto_81590 ?auto_81591 ) ) ( not ( = ?auto_81590 ?auto_81592 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_81591 ?auto_81592 )
      ( MAKE-3CRATE-VERIFY ?auto_81589 ?auto_81590 ?auto_81591 ?auto_81592 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81606 - SURFACE
      ?auto_81607 - SURFACE
      ?auto_81608 - SURFACE
      ?auto_81609 - SURFACE
    )
    :vars
    (
      ?auto_81612 - HOIST
      ?auto_81611 - PLACE
      ?auto_81610 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81612 ?auto_81611 ) ( SURFACE-AT ?auto_81608 ?auto_81611 ) ( CLEAR ?auto_81608 ) ( IS-CRATE ?auto_81609 ) ( not ( = ?auto_81608 ?auto_81609 ) ) ( TRUCK-AT ?auto_81610 ?auto_81611 ) ( AVAILABLE ?auto_81612 ) ( IN ?auto_81609 ?auto_81610 ) ( ON ?auto_81608 ?auto_81607 ) ( not ( = ?auto_81607 ?auto_81608 ) ) ( not ( = ?auto_81607 ?auto_81609 ) ) ( ON ?auto_81607 ?auto_81606 ) ( not ( = ?auto_81606 ?auto_81607 ) ) ( not ( = ?auto_81606 ?auto_81608 ) ) ( not ( = ?auto_81606 ?auto_81609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81607 ?auto_81608 ?auto_81609 )
      ( MAKE-3CRATE-VERIFY ?auto_81606 ?auto_81607 ?auto_81608 ?auto_81609 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81627 - SURFACE
      ?auto_81628 - SURFACE
      ?auto_81629 - SURFACE
      ?auto_81630 - SURFACE
    )
    :vars
    (
      ?auto_81631 - HOIST
      ?auto_81634 - PLACE
      ?auto_81633 - TRUCK
      ?auto_81632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81631 ?auto_81634 ) ( SURFACE-AT ?auto_81629 ?auto_81634 ) ( CLEAR ?auto_81629 ) ( IS-CRATE ?auto_81630 ) ( not ( = ?auto_81629 ?auto_81630 ) ) ( AVAILABLE ?auto_81631 ) ( IN ?auto_81630 ?auto_81633 ) ( ON ?auto_81629 ?auto_81628 ) ( not ( = ?auto_81628 ?auto_81629 ) ) ( not ( = ?auto_81628 ?auto_81630 ) ) ( TRUCK-AT ?auto_81633 ?auto_81632 ) ( not ( = ?auto_81632 ?auto_81634 ) ) ( ON ?auto_81628 ?auto_81627 ) ( not ( = ?auto_81627 ?auto_81628 ) ) ( not ( = ?auto_81627 ?auto_81629 ) ) ( not ( = ?auto_81627 ?auto_81630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81628 ?auto_81629 ?auto_81630 )
      ( MAKE-3CRATE-VERIFY ?auto_81627 ?auto_81628 ?auto_81629 ?auto_81630 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81651 - SURFACE
      ?auto_81652 - SURFACE
      ?auto_81653 - SURFACE
      ?auto_81654 - SURFACE
    )
    :vars
    (
      ?auto_81657 - HOIST
      ?auto_81658 - PLACE
      ?auto_81659 - TRUCK
      ?auto_81656 - PLACE
      ?auto_81655 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_81657 ?auto_81658 ) ( SURFACE-AT ?auto_81653 ?auto_81658 ) ( CLEAR ?auto_81653 ) ( IS-CRATE ?auto_81654 ) ( not ( = ?auto_81653 ?auto_81654 ) ) ( AVAILABLE ?auto_81657 ) ( ON ?auto_81653 ?auto_81652 ) ( not ( = ?auto_81652 ?auto_81653 ) ) ( not ( = ?auto_81652 ?auto_81654 ) ) ( TRUCK-AT ?auto_81659 ?auto_81656 ) ( not ( = ?auto_81656 ?auto_81658 ) ) ( HOIST-AT ?auto_81655 ?auto_81656 ) ( LIFTING ?auto_81655 ?auto_81654 ) ( not ( = ?auto_81657 ?auto_81655 ) ) ( ON ?auto_81652 ?auto_81651 ) ( not ( = ?auto_81651 ?auto_81652 ) ) ( not ( = ?auto_81651 ?auto_81653 ) ) ( not ( = ?auto_81651 ?auto_81654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81652 ?auto_81653 ?auto_81654 )
      ( MAKE-3CRATE-VERIFY ?auto_81651 ?auto_81652 ?auto_81653 ?auto_81654 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81678 - SURFACE
      ?auto_81679 - SURFACE
      ?auto_81680 - SURFACE
      ?auto_81681 - SURFACE
    )
    :vars
    (
      ?auto_81685 - HOIST
      ?auto_81684 - PLACE
      ?auto_81682 - TRUCK
      ?auto_81686 - PLACE
      ?auto_81687 - HOIST
      ?auto_81683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81685 ?auto_81684 ) ( SURFACE-AT ?auto_81680 ?auto_81684 ) ( CLEAR ?auto_81680 ) ( IS-CRATE ?auto_81681 ) ( not ( = ?auto_81680 ?auto_81681 ) ) ( AVAILABLE ?auto_81685 ) ( ON ?auto_81680 ?auto_81679 ) ( not ( = ?auto_81679 ?auto_81680 ) ) ( not ( = ?auto_81679 ?auto_81681 ) ) ( TRUCK-AT ?auto_81682 ?auto_81686 ) ( not ( = ?auto_81686 ?auto_81684 ) ) ( HOIST-AT ?auto_81687 ?auto_81686 ) ( not ( = ?auto_81685 ?auto_81687 ) ) ( AVAILABLE ?auto_81687 ) ( SURFACE-AT ?auto_81681 ?auto_81686 ) ( ON ?auto_81681 ?auto_81683 ) ( CLEAR ?auto_81681 ) ( not ( = ?auto_81680 ?auto_81683 ) ) ( not ( = ?auto_81681 ?auto_81683 ) ) ( not ( = ?auto_81679 ?auto_81683 ) ) ( ON ?auto_81679 ?auto_81678 ) ( not ( = ?auto_81678 ?auto_81679 ) ) ( not ( = ?auto_81678 ?auto_81680 ) ) ( not ( = ?auto_81678 ?auto_81681 ) ) ( not ( = ?auto_81678 ?auto_81683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81679 ?auto_81680 ?auto_81681 )
      ( MAKE-3CRATE-VERIFY ?auto_81678 ?auto_81679 ?auto_81680 ?auto_81681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81706 - SURFACE
      ?auto_81707 - SURFACE
      ?auto_81708 - SURFACE
      ?auto_81709 - SURFACE
    )
    :vars
    (
      ?auto_81712 - HOIST
      ?auto_81715 - PLACE
      ?auto_81714 - PLACE
      ?auto_81711 - HOIST
      ?auto_81713 - SURFACE
      ?auto_81710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81712 ?auto_81715 ) ( SURFACE-AT ?auto_81708 ?auto_81715 ) ( CLEAR ?auto_81708 ) ( IS-CRATE ?auto_81709 ) ( not ( = ?auto_81708 ?auto_81709 ) ) ( AVAILABLE ?auto_81712 ) ( ON ?auto_81708 ?auto_81707 ) ( not ( = ?auto_81707 ?auto_81708 ) ) ( not ( = ?auto_81707 ?auto_81709 ) ) ( not ( = ?auto_81714 ?auto_81715 ) ) ( HOIST-AT ?auto_81711 ?auto_81714 ) ( not ( = ?auto_81712 ?auto_81711 ) ) ( AVAILABLE ?auto_81711 ) ( SURFACE-AT ?auto_81709 ?auto_81714 ) ( ON ?auto_81709 ?auto_81713 ) ( CLEAR ?auto_81709 ) ( not ( = ?auto_81708 ?auto_81713 ) ) ( not ( = ?auto_81709 ?auto_81713 ) ) ( not ( = ?auto_81707 ?auto_81713 ) ) ( TRUCK-AT ?auto_81710 ?auto_81715 ) ( ON ?auto_81707 ?auto_81706 ) ( not ( = ?auto_81706 ?auto_81707 ) ) ( not ( = ?auto_81706 ?auto_81708 ) ) ( not ( = ?auto_81706 ?auto_81709 ) ) ( not ( = ?auto_81706 ?auto_81713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81707 ?auto_81708 ?auto_81709 )
      ( MAKE-3CRATE-VERIFY ?auto_81706 ?auto_81707 ?auto_81708 ?auto_81709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81734 - SURFACE
      ?auto_81735 - SURFACE
      ?auto_81736 - SURFACE
      ?auto_81737 - SURFACE
    )
    :vars
    (
      ?auto_81741 - HOIST
      ?auto_81742 - PLACE
      ?auto_81738 - PLACE
      ?auto_81740 - HOIST
      ?auto_81739 - SURFACE
      ?auto_81743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81741 ?auto_81742 ) ( IS-CRATE ?auto_81737 ) ( not ( = ?auto_81736 ?auto_81737 ) ) ( not ( = ?auto_81735 ?auto_81736 ) ) ( not ( = ?auto_81735 ?auto_81737 ) ) ( not ( = ?auto_81738 ?auto_81742 ) ) ( HOIST-AT ?auto_81740 ?auto_81738 ) ( not ( = ?auto_81741 ?auto_81740 ) ) ( AVAILABLE ?auto_81740 ) ( SURFACE-AT ?auto_81737 ?auto_81738 ) ( ON ?auto_81737 ?auto_81739 ) ( CLEAR ?auto_81737 ) ( not ( = ?auto_81736 ?auto_81739 ) ) ( not ( = ?auto_81737 ?auto_81739 ) ) ( not ( = ?auto_81735 ?auto_81739 ) ) ( TRUCK-AT ?auto_81743 ?auto_81742 ) ( SURFACE-AT ?auto_81735 ?auto_81742 ) ( CLEAR ?auto_81735 ) ( LIFTING ?auto_81741 ?auto_81736 ) ( IS-CRATE ?auto_81736 ) ( ON ?auto_81735 ?auto_81734 ) ( not ( = ?auto_81734 ?auto_81735 ) ) ( not ( = ?auto_81734 ?auto_81736 ) ) ( not ( = ?auto_81734 ?auto_81737 ) ) ( not ( = ?auto_81734 ?auto_81739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81735 ?auto_81736 ?auto_81737 )
      ( MAKE-3CRATE-VERIFY ?auto_81734 ?auto_81735 ?auto_81736 ?auto_81737 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_81762 - SURFACE
      ?auto_81763 - SURFACE
      ?auto_81764 - SURFACE
      ?auto_81765 - SURFACE
    )
    :vars
    (
      ?auto_81770 - HOIST
      ?auto_81769 - PLACE
      ?auto_81767 - PLACE
      ?auto_81766 - HOIST
      ?auto_81768 - SURFACE
      ?auto_81771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_81770 ?auto_81769 ) ( IS-CRATE ?auto_81765 ) ( not ( = ?auto_81764 ?auto_81765 ) ) ( not ( = ?auto_81763 ?auto_81764 ) ) ( not ( = ?auto_81763 ?auto_81765 ) ) ( not ( = ?auto_81767 ?auto_81769 ) ) ( HOIST-AT ?auto_81766 ?auto_81767 ) ( not ( = ?auto_81770 ?auto_81766 ) ) ( AVAILABLE ?auto_81766 ) ( SURFACE-AT ?auto_81765 ?auto_81767 ) ( ON ?auto_81765 ?auto_81768 ) ( CLEAR ?auto_81765 ) ( not ( = ?auto_81764 ?auto_81768 ) ) ( not ( = ?auto_81765 ?auto_81768 ) ) ( not ( = ?auto_81763 ?auto_81768 ) ) ( TRUCK-AT ?auto_81771 ?auto_81769 ) ( SURFACE-AT ?auto_81763 ?auto_81769 ) ( CLEAR ?auto_81763 ) ( IS-CRATE ?auto_81764 ) ( AVAILABLE ?auto_81770 ) ( IN ?auto_81764 ?auto_81771 ) ( ON ?auto_81763 ?auto_81762 ) ( not ( = ?auto_81762 ?auto_81763 ) ) ( not ( = ?auto_81762 ?auto_81764 ) ) ( not ( = ?auto_81762 ?auto_81765 ) ) ( not ( = ?auto_81762 ?auto_81768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_81763 ?auto_81764 ?auto_81765 )
      ( MAKE-3CRATE-VERIFY ?auto_81762 ?auto_81763 ?auto_81764 ?auto_81765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_81947 - SURFACE
      ?auto_81948 - SURFACE
    )
    :vars
    (
      ?auto_81951 - HOIST
      ?auto_81953 - PLACE
      ?auto_81955 - SURFACE
      ?auto_81952 - TRUCK
      ?auto_81949 - PLACE
      ?auto_81950 - HOIST
      ?auto_81954 - SURFACE
      ?auto_81956 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_81951 ?auto_81953 ) ( SURFACE-AT ?auto_81947 ?auto_81953 ) ( CLEAR ?auto_81947 ) ( IS-CRATE ?auto_81948 ) ( not ( = ?auto_81947 ?auto_81948 ) ) ( AVAILABLE ?auto_81951 ) ( ON ?auto_81947 ?auto_81955 ) ( not ( = ?auto_81955 ?auto_81947 ) ) ( not ( = ?auto_81955 ?auto_81948 ) ) ( TRUCK-AT ?auto_81952 ?auto_81949 ) ( not ( = ?auto_81949 ?auto_81953 ) ) ( HOIST-AT ?auto_81950 ?auto_81949 ) ( not ( = ?auto_81951 ?auto_81950 ) ) ( SURFACE-AT ?auto_81948 ?auto_81949 ) ( ON ?auto_81948 ?auto_81954 ) ( CLEAR ?auto_81948 ) ( not ( = ?auto_81947 ?auto_81954 ) ) ( not ( = ?auto_81948 ?auto_81954 ) ) ( not ( = ?auto_81955 ?auto_81954 ) ) ( LIFTING ?auto_81950 ?auto_81956 ) ( IS-CRATE ?auto_81956 ) ( not ( = ?auto_81947 ?auto_81956 ) ) ( not ( = ?auto_81948 ?auto_81956 ) ) ( not ( = ?auto_81955 ?auto_81956 ) ) ( not ( = ?auto_81954 ?auto_81956 ) ) )
    :subtasks
    ( ( !LOAD ?auto_81950 ?auto_81956 ?auto_81952 ?auto_81949 )
      ( MAKE-1CRATE ?auto_81947 ?auto_81948 )
      ( MAKE-1CRATE-VERIFY ?auto_81947 ?auto_81948 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82055 - SURFACE
      ?auto_82056 - SURFACE
      ?auto_82057 - SURFACE
      ?auto_82058 - SURFACE
      ?auto_82059 - SURFACE
    )
    :vars
    (
      ?auto_82060 - HOIST
      ?auto_82061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82060 ?auto_82061 ) ( SURFACE-AT ?auto_82058 ?auto_82061 ) ( CLEAR ?auto_82058 ) ( LIFTING ?auto_82060 ?auto_82059 ) ( IS-CRATE ?auto_82059 ) ( not ( = ?auto_82058 ?auto_82059 ) ) ( ON ?auto_82056 ?auto_82055 ) ( ON ?auto_82057 ?auto_82056 ) ( ON ?auto_82058 ?auto_82057 ) ( not ( = ?auto_82055 ?auto_82056 ) ) ( not ( = ?auto_82055 ?auto_82057 ) ) ( not ( = ?auto_82055 ?auto_82058 ) ) ( not ( = ?auto_82055 ?auto_82059 ) ) ( not ( = ?auto_82056 ?auto_82057 ) ) ( not ( = ?auto_82056 ?auto_82058 ) ) ( not ( = ?auto_82056 ?auto_82059 ) ) ( not ( = ?auto_82057 ?auto_82058 ) ) ( not ( = ?auto_82057 ?auto_82059 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_82058 ?auto_82059 )
      ( MAKE-4CRATE-VERIFY ?auto_82055 ?auto_82056 ?auto_82057 ?auto_82058 ?auto_82059 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82080 - SURFACE
      ?auto_82081 - SURFACE
      ?auto_82082 - SURFACE
      ?auto_82083 - SURFACE
      ?auto_82084 - SURFACE
    )
    :vars
    (
      ?auto_82085 - HOIST
      ?auto_82086 - PLACE
      ?auto_82087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82085 ?auto_82086 ) ( SURFACE-AT ?auto_82083 ?auto_82086 ) ( CLEAR ?auto_82083 ) ( IS-CRATE ?auto_82084 ) ( not ( = ?auto_82083 ?auto_82084 ) ) ( TRUCK-AT ?auto_82087 ?auto_82086 ) ( AVAILABLE ?auto_82085 ) ( IN ?auto_82084 ?auto_82087 ) ( ON ?auto_82083 ?auto_82082 ) ( not ( = ?auto_82082 ?auto_82083 ) ) ( not ( = ?auto_82082 ?auto_82084 ) ) ( ON ?auto_82081 ?auto_82080 ) ( ON ?auto_82082 ?auto_82081 ) ( not ( = ?auto_82080 ?auto_82081 ) ) ( not ( = ?auto_82080 ?auto_82082 ) ) ( not ( = ?auto_82080 ?auto_82083 ) ) ( not ( = ?auto_82080 ?auto_82084 ) ) ( not ( = ?auto_82081 ?auto_82082 ) ) ( not ( = ?auto_82081 ?auto_82083 ) ) ( not ( = ?auto_82081 ?auto_82084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82082 ?auto_82083 ?auto_82084 )
      ( MAKE-4CRATE-VERIFY ?auto_82080 ?auto_82081 ?auto_82082 ?auto_82083 ?auto_82084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82110 - SURFACE
      ?auto_82111 - SURFACE
      ?auto_82112 - SURFACE
      ?auto_82113 - SURFACE
      ?auto_82114 - SURFACE
    )
    :vars
    (
      ?auto_82117 - HOIST
      ?auto_82118 - PLACE
      ?auto_82116 - TRUCK
      ?auto_82115 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82117 ?auto_82118 ) ( SURFACE-AT ?auto_82113 ?auto_82118 ) ( CLEAR ?auto_82113 ) ( IS-CRATE ?auto_82114 ) ( not ( = ?auto_82113 ?auto_82114 ) ) ( AVAILABLE ?auto_82117 ) ( IN ?auto_82114 ?auto_82116 ) ( ON ?auto_82113 ?auto_82112 ) ( not ( = ?auto_82112 ?auto_82113 ) ) ( not ( = ?auto_82112 ?auto_82114 ) ) ( TRUCK-AT ?auto_82116 ?auto_82115 ) ( not ( = ?auto_82115 ?auto_82118 ) ) ( ON ?auto_82111 ?auto_82110 ) ( ON ?auto_82112 ?auto_82111 ) ( not ( = ?auto_82110 ?auto_82111 ) ) ( not ( = ?auto_82110 ?auto_82112 ) ) ( not ( = ?auto_82110 ?auto_82113 ) ) ( not ( = ?auto_82110 ?auto_82114 ) ) ( not ( = ?auto_82111 ?auto_82112 ) ) ( not ( = ?auto_82111 ?auto_82113 ) ) ( not ( = ?auto_82111 ?auto_82114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82112 ?auto_82113 ?auto_82114 )
      ( MAKE-4CRATE-VERIFY ?auto_82110 ?auto_82111 ?auto_82112 ?auto_82113 ?auto_82114 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82144 - SURFACE
      ?auto_82145 - SURFACE
      ?auto_82146 - SURFACE
      ?auto_82147 - SURFACE
      ?auto_82148 - SURFACE
    )
    :vars
    (
      ?auto_82153 - HOIST
      ?auto_82151 - PLACE
      ?auto_82150 - TRUCK
      ?auto_82152 - PLACE
      ?auto_82149 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_82153 ?auto_82151 ) ( SURFACE-AT ?auto_82147 ?auto_82151 ) ( CLEAR ?auto_82147 ) ( IS-CRATE ?auto_82148 ) ( not ( = ?auto_82147 ?auto_82148 ) ) ( AVAILABLE ?auto_82153 ) ( ON ?auto_82147 ?auto_82146 ) ( not ( = ?auto_82146 ?auto_82147 ) ) ( not ( = ?auto_82146 ?auto_82148 ) ) ( TRUCK-AT ?auto_82150 ?auto_82152 ) ( not ( = ?auto_82152 ?auto_82151 ) ) ( HOIST-AT ?auto_82149 ?auto_82152 ) ( LIFTING ?auto_82149 ?auto_82148 ) ( not ( = ?auto_82153 ?auto_82149 ) ) ( ON ?auto_82145 ?auto_82144 ) ( ON ?auto_82146 ?auto_82145 ) ( not ( = ?auto_82144 ?auto_82145 ) ) ( not ( = ?auto_82144 ?auto_82146 ) ) ( not ( = ?auto_82144 ?auto_82147 ) ) ( not ( = ?auto_82144 ?auto_82148 ) ) ( not ( = ?auto_82145 ?auto_82146 ) ) ( not ( = ?auto_82145 ?auto_82147 ) ) ( not ( = ?auto_82145 ?auto_82148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82146 ?auto_82147 ?auto_82148 )
      ( MAKE-4CRATE-VERIFY ?auto_82144 ?auto_82145 ?auto_82146 ?auto_82147 ?auto_82148 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82182 - SURFACE
      ?auto_82183 - SURFACE
      ?auto_82184 - SURFACE
      ?auto_82185 - SURFACE
      ?auto_82186 - SURFACE
    )
    :vars
    (
      ?auto_82190 - HOIST
      ?auto_82188 - PLACE
      ?auto_82187 - TRUCK
      ?auto_82189 - PLACE
      ?auto_82192 - HOIST
      ?auto_82191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82190 ?auto_82188 ) ( SURFACE-AT ?auto_82185 ?auto_82188 ) ( CLEAR ?auto_82185 ) ( IS-CRATE ?auto_82186 ) ( not ( = ?auto_82185 ?auto_82186 ) ) ( AVAILABLE ?auto_82190 ) ( ON ?auto_82185 ?auto_82184 ) ( not ( = ?auto_82184 ?auto_82185 ) ) ( not ( = ?auto_82184 ?auto_82186 ) ) ( TRUCK-AT ?auto_82187 ?auto_82189 ) ( not ( = ?auto_82189 ?auto_82188 ) ) ( HOIST-AT ?auto_82192 ?auto_82189 ) ( not ( = ?auto_82190 ?auto_82192 ) ) ( AVAILABLE ?auto_82192 ) ( SURFACE-AT ?auto_82186 ?auto_82189 ) ( ON ?auto_82186 ?auto_82191 ) ( CLEAR ?auto_82186 ) ( not ( = ?auto_82185 ?auto_82191 ) ) ( not ( = ?auto_82186 ?auto_82191 ) ) ( not ( = ?auto_82184 ?auto_82191 ) ) ( ON ?auto_82183 ?auto_82182 ) ( ON ?auto_82184 ?auto_82183 ) ( not ( = ?auto_82182 ?auto_82183 ) ) ( not ( = ?auto_82182 ?auto_82184 ) ) ( not ( = ?auto_82182 ?auto_82185 ) ) ( not ( = ?auto_82182 ?auto_82186 ) ) ( not ( = ?auto_82182 ?auto_82191 ) ) ( not ( = ?auto_82183 ?auto_82184 ) ) ( not ( = ?auto_82183 ?auto_82185 ) ) ( not ( = ?auto_82183 ?auto_82186 ) ) ( not ( = ?auto_82183 ?auto_82191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82184 ?auto_82185 ?auto_82186 )
      ( MAKE-4CRATE-VERIFY ?auto_82182 ?auto_82183 ?auto_82184 ?auto_82185 ?auto_82186 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82221 - SURFACE
      ?auto_82222 - SURFACE
      ?auto_82223 - SURFACE
      ?auto_82224 - SURFACE
      ?auto_82225 - SURFACE
    )
    :vars
    (
      ?auto_82231 - HOIST
      ?auto_82230 - PLACE
      ?auto_82228 - PLACE
      ?auto_82226 - HOIST
      ?auto_82229 - SURFACE
      ?auto_82227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82231 ?auto_82230 ) ( SURFACE-AT ?auto_82224 ?auto_82230 ) ( CLEAR ?auto_82224 ) ( IS-CRATE ?auto_82225 ) ( not ( = ?auto_82224 ?auto_82225 ) ) ( AVAILABLE ?auto_82231 ) ( ON ?auto_82224 ?auto_82223 ) ( not ( = ?auto_82223 ?auto_82224 ) ) ( not ( = ?auto_82223 ?auto_82225 ) ) ( not ( = ?auto_82228 ?auto_82230 ) ) ( HOIST-AT ?auto_82226 ?auto_82228 ) ( not ( = ?auto_82231 ?auto_82226 ) ) ( AVAILABLE ?auto_82226 ) ( SURFACE-AT ?auto_82225 ?auto_82228 ) ( ON ?auto_82225 ?auto_82229 ) ( CLEAR ?auto_82225 ) ( not ( = ?auto_82224 ?auto_82229 ) ) ( not ( = ?auto_82225 ?auto_82229 ) ) ( not ( = ?auto_82223 ?auto_82229 ) ) ( TRUCK-AT ?auto_82227 ?auto_82230 ) ( ON ?auto_82222 ?auto_82221 ) ( ON ?auto_82223 ?auto_82222 ) ( not ( = ?auto_82221 ?auto_82222 ) ) ( not ( = ?auto_82221 ?auto_82223 ) ) ( not ( = ?auto_82221 ?auto_82224 ) ) ( not ( = ?auto_82221 ?auto_82225 ) ) ( not ( = ?auto_82221 ?auto_82229 ) ) ( not ( = ?auto_82222 ?auto_82223 ) ) ( not ( = ?auto_82222 ?auto_82224 ) ) ( not ( = ?auto_82222 ?auto_82225 ) ) ( not ( = ?auto_82222 ?auto_82229 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82223 ?auto_82224 ?auto_82225 )
      ( MAKE-4CRATE-VERIFY ?auto_82221 ?auto_82222 ?auto_82223 ?auto_82224 ?auto_82225 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82260 - SURFACE
      ?auto_82261 - SURFACE
      ?auto_82262 - SURFACE
      ?auto_82263 - SURFACE
      ?auto_82264 - SURFACE
    )
    :vars
    (
      ?auto_82267 - HOIST
      ?auto_82266 - PLACE
      ?auto_82268 - PLACE
      ?auto_82269 - HOIST
      ?auto_82265 - SURFACE
      ?auto_82270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82267 ?auto_82266 ) ( IS-CRATE ?auto_82264 ) ( not ( = ?auto_82263 ?auto_82264 ) ) ( not ( = ?auto_82262 ?auto_82263 ) ) ( not ( = ?auto_82262 ?auto_82264 ) ) ( not ( = ?auto_82268 ?auto_82266 ) ) ( HOIST-AT ?auto_82269 ?auto_82268 ) ( not ( = ?auto_82267 ?auto_82269 ) ) ( AVAILABLE ?auto_82269 ) ( SURFACE-AT ?auto_82264 ?auto_82268 ) ( ON ?auto_82264 ?auto_82265 ) ( CLEAR ?auto_82264 ) ( not ( = ?auto_82263 ?auto_82265 ) ) ( not ( = ?auto_82264 ?auto_82265 ) ) ( not ( = ?auto_82262 ?auto_82265 ) ) ( TRUCK-AT ?auto_82270 ?auto_82266 ) ( SURFACE-AT ?auto_82262 ?auto_82266 ) ( CLEAR ?auto_82262 ) ( LIFTING ?auto_82267 ?auto_82263 ) ( IS-CRATE ?auto_82263 ) ( ON ?auto_82261 ?auto_82260 ) ( ON ?auto_82262 ?auto_82261 ) ( not ( = ?auto_82260 ?auto_82261 ) ) ( not ( = ?auto_82260 ?auto_82262 ) ) ( not ( = ?auto_82260 ?auto_82263 ) ) ( not ( = ?auto_82260 ?auto_82264 ) ) ( not ( = ?auto_82260 ?auto_82265 ) ) ( not ( = ?auto_82261 ?auto_82262 ) ) ( not ( = ?auto_82261 ?auto_82263 ) ) ( not ( = ?auto_82261 ?auto_82264 ) ) ( not ( = ?auto_82261 ?auto_82265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82262 ?auto_82263 ?auto_82264 )
      ( MAKE-4CRATE-VERIFY ?auto_82260 ?auto_82261 ?auto_82262 ?auto_82263 ?auto_82264 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_82299 - SURFACE
      ?auto_82300 - SURFACE
      ?auto_82301 - SURFACE
      ?auto_82302 - SURFACE
      ?auto_82303 - SURFACE
    )
    :vars
    (
      ?auto_82305 - HOIST
      ?auto_82306 - PLACE
      ?auto_82307 - PLACE
      ?auto_82304 - HOIST
      ?auto_82308 - SURFACE
      ?auto_82309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82305 ?auto_82306 ) ( IS-CRATE ?auto_82303 ) ( not ( = ?auto_82302 ?auto_82303 ) ) ( not ( = ?auto_82301 ?auto_82302 ) ) ( not ( = ?auto_82301 ?auto_82303 ) ) ( not ( = ?auto_82307 ?auto_82306 ) ) ( HOIST-AT ?auto_82304 ?auto_82307 ) ( not ( = ?auto_82305 ?auto_82304 ) ) ( AVAILABLE ?auto_82304 ) ( SURFACE-AT ?auto_82303 ?auto_82307 ) ( ON ?auto_82303 ?auto_82308 ) ( CLEAR ?auto_82303 ) ( not ( = ?auto_82302 ?auto_82308 ) ) ( not ( = ?auto_82303 ?auto_82308 ) ) ( not ( = ?auto_82301 ?auto_82308 ) ) ( TRUCK-AT ?auto_82309 ?auto_82306 ) ( SURFACE-AT ?auto_82301 ?auto_82306 ) ( CLEAR ?auto_82301 ) ( IS-CRATE ?auto_82302 ) ( AVAILABLE ?auto_82305 ) ( IN ?auto_82302 ?auto_82309 ) ( ON ?auto_82300 ?auto_82299 ) ( ON ?auto_82301 ?auto_82300 ) ( not ( = ?auto_82299 ?auto_82300 ) ) ( not ( = ?auto_82299 ?auto_82301 ) ) ( not ( = ?auto_82299 ?auto_82302 ) ) ( not ( = ?auto_82299 ?auto_82303 ) ) ( not ( = ?auto_82299 ?auto_82308 ) ) ( not ( = ?auto_82300 ?auto_82301 ) ) ( not ( = ?auto_82300 ?auto_82302 ) ) ( not ( = ?auto_82300 ?auto_82303 ) ) ( not ( = ?auto_82300 ?auto_82308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82301 ?auto_82302 ?auto_82303 )
      ( MAKE-4CRATE-VERIFY ?auto_82299 ?auto_82300 ?auto_82301 ?auto_82302 ?auto_82303 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_82799 - SURFACE
      ?auto_82800 - SURFACE
    )
    :vars
    (
      ?auto_82801 - HOIST
      ?auto_82806 - PLACE
      ?auto_82807 - SURFACE
      ?auto_82802 - PLACE
      ?auto_82804 - HOIST
      ?auto_82803 - SURFACE
      ?auto_82805 - TRUCK
      ?auto_82808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82801 ?auto_82806 ) ( SURFACE-AT ?auto_82799 ?auto_82806 ) ( CLEAR ?auto_82799 ) ( IS-CRATE ?auto_82800 ) ( not ( = ?auto_82799 ?auto_82800 ) ) ( ON ?auto_82799 ?auto_82807 ) ( not ( = ?auto_82807 ?auto_82799 ) ) ( not ( = ?auto_82807 ?auto_82800 ) ) ( not ( = ?auto_82802 ?auto_82806 ) ) ( HOIST-AT ?auto_82804 ?auto_82802 ) ( not ( = ?auto_82801 ?auto_82804 ) ) ( AVAILABLE ?auto_82804 ) ( SURFACE-AT ?auto_82800 ?auto_82802 ) ( ON ?auto_82800 ?auto_82803 ) ( CLEAR ?auto_82800 ) ( not ( = ?auto_82799 ?auto_82803 ) ) ( not ( = ?auto_82800 ?auto_82803 ) ) ( not ( = ?auto_82807 ?auto_82803 ) ) ( TRUCK-AT ?auto_82805 ?auto_82806 ) ( LIFTING ?auto_82801 ?auto_82808 ) ( IS-CRATE ?auto_82808 ) ( not ( = ?auto_82799 ?auto_82808 ) ) ( not ( = ?auto_82800 ?auto_82808 ) ) ( not ( = ?auto_82807 ?auto_82808 ) ) ( not ( = ?auto_82803 ?auto_82808 ) ) )
    :subtasks
    ( ( !LOAD ?auto_82801 ?auto_82808 ?auto_82805 ?auto_82806 )
      ( MAKE-1CRATE ?auto_82799 ?auto_82800 )
      ( MAKE-1CRATE-VERIFY ?auto_82799 ?auto_82800 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82958 - SURFACE
      ?auto_82959 - SURFACE
      ?auto_82960 - SURFACE
      ?auto_82961 - SURFACE
      ?auto_82962 - SURFACE
      ?auto_82963 - SURFACE
    )
    :vars
    (
      ?auto_82964 - HOIST
      ?auto_82965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_82964 ?auto_82965 ) ( SURFACE-AT ?auto_82962 ?auto_82965 ) ( CLEAR ?auto_82962 ) ( LIFTING ?auto_82964 ?auto_82963 ) ( IS-CRATE ?auto_82963 ) ( not ( = ?auto_82962 ?auto_82963 ) ) ( ON ?auto_82959 ?auto_82958 ) ( ON ?auto_82960 ?auto_82959 ) ( ON ?auto_82961 ?auto_82960 ) ( ON ?auto_82962 ?auto_82961 ) ( not ( = ?auto_82958 ?auto_82959 ) ) ( not ( = ?auto_82958 ?auto_82960 ) ) ( not ( = ?auto_82958 ?auto_82961 ) ) ( not ( = ?auto_82958 ?auto_82962 ) ) ( not ( = ?auto_82958 ?auto_82963 ) ) ( not ( = ?auto_82959 ?auto_82960 ) ) ( not ( = ?auto_82959 ?auto_82961 ) ) ( not ( = ?auto_82959 ?auto_82962 ) ) ( not ( = ?auto_82959 ?auto_82963 ) ) ( not ( = ?auto_82960 ?auto_82961 ) ) ( not ( = ?auto_82960 ?auto_82962 ) ) ( not ( = ?auto_82960 ?auto_82963 ) ) ( not ( = ?auto_82961 ?auto_82962 ) ) ( not ( = ?auto_82961 ?auto_82963 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_82962 ?auto_82963 )
      ( MAKE-5CRATE-VERIFY ?auto_82958 ?auto_82959 ?auto_82960 ?auto_82961 ?auto_82962 ?auto_82963 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_82992 - SURFACE
      ?auto_82993 - SURFACE
      ?auto_82994 - SURFACE
      ?auto_82995 - SURFACE
      ?auto_82996 - SURFACE
      ?auto_82997 - SURFACE
    )
    :vars
    (
      ?auto_82998 - HOIST
      ?auto_82999 - PLACE
      ?auto_83000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_82998 ?auto_82999 ) ( SURFACE-AT ?auto_82996 ?auto_82999 ) ( CLEAR ?auto_82996 ) ( IS-CRATE ?auto_82997 ) ( not ( = ?auto_82996 ?auto_82997 ) ) ( TRUCK-AT ?auto_83000 ?auto_82999 ) ( AVAILABLE ?auto_82998 ) ( IN ?auto_82997 ?auto_83000 ) ( ON ?auto_82996 ?auto_82995 ) ( not ( = ?auto_82995 ?auto_82996 ) ) ( not ( = ?auto_82995 ?auto_82997 ) ) ( ON ?auto_82993 ?auto_82992 ) ( ON ?auto_82994 ?auto_82993 ) ( ON ?auto_82995 ?auto_82994 ) ( not ( = ?auto_82992 ?auto_82993 ) ) ( not ( = ?auto_82992 ?auto_82994 ) ) ( not ( = ?auto_82992 ?auto_82995 ) ) ( not ( = ?auto_82992 ?auto_82996 ) ) ( not ( = ?auto_82992 ?auto_82997 ) ) ( not ( = ?auto_82993 ?auto_82994 ) ) ( not ( = ?auto_82993 ?auto_82995 ) ) ( not ( = ?auto_82993 ?auto_82996 ) ) ( not ( = ?auto_82993 ?auto_82997 ) ) ( not ( = ?auto_82994 ?auto_82995 ) ) ( not ( = ?auto_82994 ?auto_82996 ) ) ( not ( = ?auto_82994 ?auto_82997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_82995 ?auto_82996 ?auto_82997 )
      ( MAKE-5CRATE-VERIFY ?auto_82992 ?auto_82993 ?auto_82994 ?auto_82995 ?auto_82996 ?auto_82997 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83032 - SURFACE
      ?auto_83033 - SURFACE
      ?auto_83034 - SURFACE
      ?auto_83035 - SURFACE
      ?auto_83036 - SURFACE
      ?auto_83037 - SURFACE
    )
    :vars
    (
      ?auto_83040 - HOIST
      ?auto_83039 - PLACE
      ?auto_83041 - TRUCK
      ?auto_83038 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_83040 ?auto_83039 ) ( SURFACE-AT ?auto_83036 ?auto_83039 ) ( CLEAR ?auto_83036 ) ( IS-CRATE ?auto_83037 ) ( not ( = ?auto_83036 ?auto_83037 ) ) ( AVAILABLE ?auto_83040 ) ( IN ?auto_83037 ?auto_83041 ) ( ON ?auto_83036 ?auto_83035 ) ( not ( = ?auto_83035 ?auto_83036 ) ) ( not ( = ?auto_83035 ?auto_83037 ) ) ( TRUCK-AT ?auto_83041 ?auto_83038 ) ( not ( = ?auto_83038 ?auto_83039 ) ) ( ON ?auto_83033 ?auto_83032 ) ( ON ?auto_83034 ?auto_83033 ) ( ON ?auto_83035 ?auto_83034 ) ( not ( = ?auto_83032 ?auto_83033 ) ) ( not ( = ?auto_83032 ?auto_83034 ) ) ( not ( = ?auto_83032 ?auto_83035 ) ) ( not ( = ?auto_83032 ?auto_83036 ) ) ( not ( = ?auto_83032 ?auto_83037 ) ) ( not ( = ?auto_83033 ?auto_83034 ) ) ( not ( = ?auto_83033 ?auto_83035 ) ) ( not ( = ?auto_83033 ?auto_83036 ) ) ( not ( = ?auto_83033 ?auto_83037 ) ) ( not ( = ?auto_83034 ?auto_83035 ) ) ( not ( = ?auto_83034 ?auto_83036 ) ) ( not ( = ?auto_83034 ?auto_83037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83035 ?auto_83036 ?auto_83037 )
      ( MAKE-5CRATE-VERIFY ?auto_83032 ?auto_83033 ?auto_83034 ?auto_83035 ?auto_83036 ?auto_83037 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83077 - SURFACE
      ?auto_83078 - SURFACE
      ?auto_83079 - SURFACE
      ?auto_83080 - SURFACE
      ?auto_83081 - SURFACE
      ?auto_83082 - SURFACE
    )
    :vars
    (
      ?auto_83085 - HOIST
      ?auto_83086 - PLACE
      ?auto_83083 - TRUCK
      ?auto_83087 - PLACE
      ?auto_83084 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_83085 ?auto_83086 ) ( SURFACE-AT ?auto_83081 ?auto_83086 ) ( CLEAR ?auto_83081 ) ( IS-CRATE ?auto_83082 ) ( not ( = ?auto_83081 ?auto_83082 ) ) ( AVAILABLE ?auto_83085 ) ( ON ?auto_83081 ?auto_83080 ) ( not ( = ?auto_83080 ?auto_83081 ) ) ( not ( = ?auto_83080 ?auto_83082 ) ) ( TRUCK-AT ?auto_83083 ?auto_83087 ) ( not ( = ?auto_83087 ?auto_83086 ) ) ( HOIST-AT ?auto_83084 ?auto_83087 ) ( LIFTING ?auto_83084 ?auto_83082 ) ( not ( = ?auto_83085 ?auto_83084 ) ) ( ON ?auto_83078 ?auto_83077 ) ( ON ?auto_83079 ?auto_83078 ) ( ON ?auto_83080 ?auto_83079 ) ( not ( = ?auto_83077 ?auto_83078 ) ) ( not ( = ?auto_83077 ?auto_83079 ) ) ( not ( = ?auto_83077 ?auto_83080 ) ) ( not ( = ?auto_83077 ?auto_83081 ) ) ( not ( = ?auto_83077 ?auto_83082 ) ) ( not ( = ?auto_83078 ?auto_83079 ) ) ( not ( = ?auto_83078 ?auto_83080 ) ) ( not ( = ?auto_83078 ?auto_83081 ) ) ( not ( = ?auto_83078 ?auto_83082 ) ) ( not ( = ?auto_83079 ?auto_83080 ) ) ( not ( = ?auto_83079 ?auto_83081 ) ) ( not ( = ?auto_83079 ?auto_83082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83080 ?auto_83081 ?auto_83082 )
      ( MAKE-5CRATE-VERIFY ?auto_83077 ?auto_83078 ?auto_83079 ?auto_83080 ?auto_83081 ?auto_83082 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83127 - SURFACE
      ?auto_83128 - SURFACE
      ?auto_83129 - SURFACE
      ?auto_83130 - SURFACE
      ?auto_83131 - SURFACE
      ?auto_83132 - SURFACE
    )
    :vars
    (
      ?auto_83137 - HOIST
      ?auto_83138 - PLACE
      ?auto_83133 - TRUCK
      ?auto_83136 - PLACE
      ?auto_83134 - HOIST
      ?auto_83135 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_83137 ?auto_83138 ) ( SURFACE-AT ?auto_83131 ?auto_83138 ) ( CLEAR ?auto_83131 ) ( IS-CRATE ?auto_83132 ) ( not ( = ?auto_83131 ?auto_83132 ) ) ( AVAILABLE ?auto_83137 ) ( ON ?auto_83131 ?auto_83130 ) ( not ( = ?auto_83130 ?auto_83131 ) ) ( not ( = ?auto_83130 ?auto_83132 ) ) ( TRUCK-AT ?auto_83133 ?auto_83136 ) ( not ( = ?auto_83136 ?auto_83138 ) ) ( HOIST-AT ?auto_83134 ?auto_83136 ) ( not ( = ?auto_83137 ?auto_83134 ) ) ( AVAILABLE ?auto_83134 ) ( SURFACE-AT ?auto_83132 ?auto_83136 ) ( ON ?auto_83132 ?auto_83135 ) ( CLEAR ?auto_83132 ) ( not ( = ?auto_83131 ?auto_83135 ) ) ( not ( = ?auto_83132 ?auto_83135 ) ) ( not ( = ?auto_83130 ?auto_83135 ) ) ( ON ?auto_83128 ?auto_83127 ) ( ON ?auto_83129 ?auto_83128 ) ( ON ?auto_83130 ?auto_83129 ) ( not ( = ?auto_83127 ?auto_83128 ) ) ( not ( = ?auto_83127 ?auto_83129 ) ) ( not ( = ?auto_83127 ?auto_83130 ) ) ( not ( = ?auto_83127 ?auto_83131 ) ) ( not ( = ?auto_83127 ?auto_83132 ) ) ( not ( = ?auto_83127 ?auto_83135 ) ) ( not ( = ?auto_83128 ?auto_83129 ) ) ( not ( = ?auto_83128 ?auto_83130 ) ) ( not ( = ?auto_83128 ?auto_83131 ) ) ( not ( = ?auto_83128 ?auto_83132 ) ) ( not ( = ?auto_83128 ?auto_83135 ) ) ( not ( = ?auto_83129 ?auto_83130 ) ) ( not ( = ?auto_83129 ?auto_83131 ) ) ( not ( = ?auto_83129 ?auto_83132 ) ) ( not ( = ?auto_83129 ?auto_83135 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83130 ?auto_83131 ?auto_83132 )
      ( MAKE-5CRATE-VERIFY ?auto_83127 ?auto_83128 ?auto_83129 ?auto_83130 ?auto_83131 ?auto_83132 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83178 - SURFACE
      ?auto_83179 - SURFACE
      ?auto_83180 - SURFACE
      ?auto_83181 - SURFACE
      ?auto_83182 - SURFACE
      ?auto_83183 - SURFACE
    )
    :vars
    (
      ?auto_83185 - HOIST
      ?auto_83187 - PLACE
      ?auto_83188 - PLACE
      ?auto_83184 - HOIST
      ?auto_83186 - SURFACE
      ?auto_83189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83185 ?auto_83187 ) ( SURFACE-AT ?auto_83182 ?auto_83187 ) ( CLEAR ?auto_83182 ) ( IS-CRATE ?auto_83183 ) ( not ( = ?auto_83182 ?auto_83183 ) ) ( AVAILABLE ?auto_83185 ) ( ON ?auto_83182 ?auto_83181 ) ( not ( = ?auto_83181 ?auto_83182 ) ) ( not ( = ?auto_83181 ?auto_83183 ) ) ( not ( = ?auto_83188 ?auto_83187 ) ) ( HOIST-AT ?auto_83184 ?auto_83188 ) ( not ( = ?auto_83185 ?auto_83184 ) ) ( AVAILABLE ?auto_83184 ) ( SURFACE-AT ?auto_83183 ?auto_83188 ) ( ON ?auto_83183 ?auto_83186 ) ( CLEAR ?auto_83183 ) ( not ( = ?auto_83182 ?auto_83186 ) ) ( not ( = ?auto_83183 ?auto_83186 ) ) ( not ( = ?auto_83181 ?auto_83186 ) ) ( TRUCK-AT ?auto_83189 ?auto_83187 ) ( ON ?auto_83179 ?auto_83178 ) ( ON ?auto_83180 ?auto_83179 ) ( ON ?auto_83181 ?auto_83180 ) ( not ( = ?auto_83178 ?auto_83179 ) ) ( not ( = ?auto_83178 ?auto_83180 ) ) ( not ( = ?auto_83178 ?auto_83181 ) ) ( not ( = ?auto_83178 ?auto_83182 ) ) ( not ( = ?auto_83178 ?auto_83183 ) ) ( not ( = ?auto_83178 ?auto_83186 ) ) ( not ( = ?auto_83179 ?auto_83180 ) ) ( not ( = ?auto_83179 ?auto_83181 ) ) ( not ( = ?auto_83179 ?auto_83182 ) ) ( not ( = ?auto_83179 ?auto_83183 ) ) ( not ( = ?auto_83179 ?auto_83186 ) ) ( not ( = ?auto_83180 ?auto_83181 ) ) ( not ( = ?auto_83180 ?auto_83182 ) ) ( not ( = ?auto_83180 ?auto_83183 ) ) ( not ( = ?auto_83180 ?auto_83186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83181 ?auto_83182 ?auto_83183 )
      ( MAKE-5CRATE-VERIFY ?auto_83178 ?auto_83179 ?auto_83180 ?auto_83181 ?auto_83182 ?auto_83183 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83229 - SURFACE
      ?auto_83230 - SURFACE
      ?auto_83231 - SURFACE
      ?auto_83232 - SURFACE
      ?auto_83233 - SURFACE
      ?auto_83234 - SURFACE
    )
    :vars
    (
      ?auto_83239 - HOIST
      ?auto_83236 - PLACE
      ?auto_83235 - PLACE
      ?auto_83237 - HOIST
      ?auto_83238 - SURFACE
      ?auto_83240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83239 ?auto_83236 ) ( IS-CRATE ?auto_83234 ) ( not ( = ?auto_83233 ?auto_83234 ) ) ( not ( = ?auto_83232 ?auto_83233 ) ) ( not ( = ?auto_83232 ?auto_83234 ) ) ( not ( = ?auto_83235 ?auto_83236 ) ) ( HOIST-AT ?auto_83237 ?auto_83235 ) ( not ( = ?auto_83239 ?auto_83237 ) ) ( AVAILABLE ?auto_83237 ) ( SURFACE-AT ?auto_83234 ?auto_83235 ) ( ON ?auto_83234 ?auto_83238 ) ( CLEAR ?auto_83234 ) ( not ( = ?auto_83233 ?auto_83238 ) ) ( not ( = ?auto_83234 ?auto_83238 ) ) ( not ( = ?auto_83232 ?auto_83238 ) ) ( TRUCK-AT ?auto_83240 ?auto_83236 ) ( SURFACE-AT ?auto_83232 ?auto_83236 ) ( CLEAR ?auto_83232 ) ( LIFTING ?auto_83239 ?auto_83233 ) ( IS-CRATE ?auto_83233 ) ( ON ?auto_83230 ?auto_83229 ) ( ON ?auto_83231 ?auto_83230 ) ( ON ?auto_83232 ?auto_83231 ) ( not ( = ?auto_83229 ?auto_83230 ) ) ( not ( = ?auto_83229 ?auto_83231 ) ) ( not ( = ?auto_83229 ?auto_83232 ) ) ( not ( = ?auto_83229 ?auto_83233 ) ) ( not ( = ?auto_83229 ?auto_83234 ) ) ( not ( = ?auto_83229 ?auto_83238 ) ) ( not ( = ?auto_83230 ?auto_83231 ) ) ( not ( = ?auto_83230 ?auto_83232 ) ) ( not ( = ?auto_83230 ?auto_83233 ) ) ( not ( = ?auto_83230 ?auto_83234 ) ) ( not ( = ?auto_83230 ?auto_83238 ) ) ( not ( = ?auto_83231 ?auto_83232 ) ) ( not ( = ?auto_83231 ?auto_83233 ) ) ( not ( = ?auto_83231 ?auto_83234 ) ) ( not ( = ?auto_83231 ?auto_83238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83232 ?auto_83233 ?auto_83234 )
      ( MAKE-5CRATE-VERIFY ?auto_83229 ?auto_83230 ?auto_83231 ?auto_83232 ?auto_83233 ?auto_83234 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_83280 - SURFACE
      ?auto_83281 - SURFACE
      ?auto_83282 - SURFACE
      ?auto_83283 - SURFACE
      ?auto_83284 - SURFACE
      ?auto_83285 - SURFACE
    )
    :vars
    (
      ?auto_83289 - HOIST
      ?auto_83290 - PLACE
      ?auto_83291 - PLACE
      ?auto_83287 - HOIST
      ?auto_83288 - SURFACE
      ?auto_83286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_83289 ?auto_83290 ) ( IS-CRATE ?auto_83285 ) ( not ( = ?auto_83284 ?auto_83285 ) ) ( not ( = ?auto_83283 ?auto_83284 ) ) ( not ( = ?auto_83283 ?auto_83285 ) ) ( not ( = ?auto_83291 ?auto_83290 ) ) ( HOIST-AT ?auto_83287 ?auto_83291 ) ( not ( = ?auto_83289 ?auto_83287 ) ) ( AVAILABLE ?auto_83287 ) ( SURFACE-AT ?auto_83285 ?auto_83291 ) ( ON ?auto_83285 ?auto_83288 ) ( CLEAR ?auto_83285 ) ( not ( = ?auto_83284 ?auto_83288 ) ) ( not ( = ?auto_83285 ?auto_83288 ) ) ( not ( = ?auto_83283 ?auto_83288 ) ) ( TRUCK-AT ?auto_83286 ?auto_83290 ) ( SURFACE-AT ?auto_83283 ?auto_83290 ) ( CLEAR ?auto_83283 ) ( IS-CRATE ?auto_83284 ) ( AVAILABLE ?auto_83289 ) ( IN ?auto_83284 ?auto_83286 ) ( ON ?auto_83281 ?auto_83280 ) ( ON ?auto_83282 ?auto_83281 ) ( ON ?auto_83283 ?auto_83282 ) ( not ( = ?auto_83280 ?auto_83281 ) ) ( not ( = ?auto_83280 ?auto_83282 ) ) ( not ( = ?auto_83280 ?auto_83283 ) ) ( not ( = ?auto_83280 ?auto_83284 ) ) ( not ( = ?auto_83280 ?auto_83285 ) ) ( not ( = ?auto_83280 ?auto_83288 ) ) ( not ( = ?auto_83281 ?auto_83282 ) ) ( not ( = ?auto_83281 ?auto_83283 ) ) ( not ( = ?auto_83281 ?auto_83284 ) ) ( not ( = ?auto_83281 ?auto_83285 ) ) ( not ( = ?auto_83281 ?auto_83288 ) ) ( not ( = ?auto_83282 ?auto_83283 ) ) ( not ( = ?auto_83282 ?auto_83284 ) ) ( not ( = ?auto_83282 ?auto_83285 ) ) ( not ( = ?auto_83282 ?auto_83288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_83283 ?auto_83284 ?auto_83285 )
      ( MAKE-5CRATE-VERIFY ?auto_83280 ?auto_83281 ?auto_83282 ?auto_83283 ?auto_83284 ?auto_83285 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84486 - SURFACE
      ?auto_84487 - SURFACE
      ?auto_84488 - SURFACE
      ?auto_84489 - SURFACE
      ?auto_84490 - SURFACE
      ?auto_84491 - SURFACE
      ?auto_84492 - SURFACE
    )
    :vars
    (
      ?auto_84494 - HOIST
      ?auto_84493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84494 ?auto_84493 ) ( SURFACE-AT ?auto_84491 ?auto_84493 ) ( CLEAR ?auto_84491 ) ( LIFTING ?auto_84494 ?auto_84492 ) ( IS-CRATE ?auto_84492 ) ( not ( = ?auto_84491 ?auto_84492 ) ) ( ON ?auto_84487 ?auto_84486 ) ( ON ?auto_84488 ?auto_84487 ) ( ON ?auto_84489 ?auto_84488 ) ( ON ?auto_84490 ?auto_84489 ) ( ON ?auto_84491 ?auto_84490 ) ( not ( = ?auto_84486 ?auto_84487 ) ) ( not ( = ?auto_84486 ?auto_84488 ) ) ( not ( = ?auto_84486 ?auto_84489 ) ) ( not ( = ?auto_84486 ?auto_84490 ) ) ( not ( = ?auto_84486 ?auto_84491 ) ) ( not ( = ?auto_84486 ?auto_84492 ) ) ( not ( = ?auto_84487 ?auto_84488 ) ) ( not ( = ?auto_84487 ?auto_84489 ) ) ( not ( = ?auto_84487 ?auto_84490 ) ) ( not ( = ?auto_84487 ?auto_84491 ) ) ( not ( = ?auto_84487 ?auto_84492 ) ) ( not ( = ?auto_84488 ?auto_84489 ) ) ( not ( = ?auto_84488 ?auto_84490 ) ) ( not ( = ?auto_84488 ?auto_84491 ) ) ( not ( = ?auto_84488 ?auto_84492 ) ) ( not ( = ?auto_84489 ?auto_84490 ) ) ( not ( = ?auto_84489 ?auto_84491 ) ) ( not ( = ?auto_84489 ?auto_84492 ) ) ( not ( = ?auto_84490 ?auto_84491 ) ) ( not ( = ?auto_84490 ?auto_84492 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_84491 ?auto_84492 )
      ( MAKE-6CRATE-VERIFY ?auto_84486 ?auto_84487 ?auto_84488 ?auto_84489 ?auto_84490 ?auto_84491 ?auto_84492 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84530 - SURFACE
      ?auto_84531 - SURFACE
      ?auto_84532 - SURFACE
      ?auto_84533 - SURFACE
      ?auto_84534 - SURFACE
      ?auto_84535 - SURFACE
      ?auto_84536 - SURFACE
    )
    :vars
    (
      ?auto_84539 - HOIST
      ?auto_84538 - PLACE
      ?auto_84537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84539 ?auto_84538 ) ( SURFACE-AT ?auto_84535 ?auto_84538 ) ( CLEAR ?auto_84535 ) ( IS-CRATE ?auto_84536 ) ( not ( = ?auto_84535 ?auto_84536 ) ) ( TRUCK-AT ?auto_84537 ?auto_84538 ) ( AVAILABLE ?auto_84539 ) ( IN ?auto_84536 ?auto_84537 ) ( ON ?auto_84535 ?auto_84534 ) ( not ( = ?auto_84534 ?auto_84535 ) ) ( not ( = ?auto_84534 ?auto_84536 ) ) ( ON ?auto_84531 ?auto_84530 ) ( ON ?auto_84532 ?auto_84531 ) ( ON ?auto_84533 ?auto_84532 ) ( ON ?auto_84534 ?auto_84533 ) ( not ( = ?auto_84530 ?auto_84531 ) ) ( not ( = ?auto_84530 ?auto_84532 ) ) ( not ( = ?auto_84530 ?auto_84533 ) ) ( not ( = ?auto_84530 ?auto_84534 ) ) ( not ( = ?auto_84530 ?auto_84535 ) ) ( not ( = ?auto_84530 ?auto_84536 ) ) ( not ( = ?auto_84531 ?auto_84532 ) ) ( not ( = ?auto_84531 ?auto_84533 ) ) ( not ( = ?auto_84531 ?auto_84534 ) ) ( not ( = ?auto_84531 ?auto_84535 ) ) ( not ( = ?auto_84531 ?auto_84536 ) ) ( not ( = ?auto_84532 ?auto_84533 ) ) ( not ( = ?auto_84532 ?auto_84534 ) ) ( not ( = ?auto_84532 ?auto_84535 ) ) ( not ( = ?auto_84532 ?auto_84536 ) ) ( not ( = ?auto_84533 ?auto_84534 ) ) ( not ( = ?auto_84533 ?auto_84535 ) ) ( not ( = ?auto_84533 ?auto_84536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84534 ?auto_84535 ?auto_84536 )
      ( MAKE-6CRATE-VERIFY ?auto_84530 ?auto_84531 ?auto_84532 ?auto_84533 ?auto_84534 ?auto_84535 ?auto_84536 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84581 - SURFACE
      ?auto_84582 - SURFACE
      ?auto_84583 - SURFACE
      ?auto_84584 - SURFACE
      ?auto_84585 - SURFACE
      ?auto_84586 - SURFACE
      ?auto_84587 - SURFACE
    )
    :vars
    (
      ?auto_84591 - HOIST
      ?auto_84588 - PLACE
      ?auto_84589 - TRUCK
      ?auto_84590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84591 ?auto_84588 ) ( SURFACE-AT ?auto_84586 ?auto_84588 ) ( CLEAR ?auto_84586 ) ( IS-CRATE ?auto_84587 ) ( not ( = ?auto_84586 ?auto_84587 ) ) ( AVAILABLE ?auto_84591 ) ( IN ?auto_84587 ?auto_84589 ) ( ON ?auto_84586 ?auto_84585 ) ( not ( = ?auto_84585 ?auto_84586 ) ) ( not ( = ?auto_84585 ?auto_84587 ) ) ( TRUCK-AT ?auto_84589 ?auto_84590 ) ( not ( = ?auto_84590 ?auto_84588 ) ) ( ON ?auto_84582 ?auto_84581 ) ( ON ?auto_84583 ?auto_84582 ) ( ON ?auto_84584 ?auto_84583 ) ( ON ?auto_84585 ?auto_84584 ) ( not ( = ?auto_84581 ?auto_84582 ) ) ( not ( = ?auto_84581 ?auto_84583 ) ) ( not ( = ?auto_84581 ?auto_84584 ) ) ( not ( = ?auto_84581 ?auto_84585 ) ) ( not ( = ?auto_84581 ?auto_84586 ) ) ( not ( = ?auto_84581 ?auto_84587 ) ) ( not ( = ?auto_84582 ?auto_84583 ) ) ( not ( = ?auto_84582 ?auto_84584 ) ) ( not ( = ?auto_84582 ?auto_84585 ) ) ( not ( = ?auto_84582 ?auto_84586 ) ) ( not ( = ?auto_84582 ?auto_84587 ) ) ( not ( = ?auto_84583 ?auto_84584 ) ) ( not ( = ?auto_84583 ?auto_84585 ) ) ( not ( = ?auto_84583 ?auto_84586 ) ) ( not ( = ?auto_84583 ?auto_84587 ) ) ( not ( = ?auto_84584 ?auto_84585 ) ) ( not ( = ?auto_84584 ?auto_84586 ) ) ( not ( = ?auto_84584 ?auto_84587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84585 ?auto_84586 ?auto_84587 )
      ( MAKE-6CRATE-VERIFY ?auto_84581 ?auto_84582 ?auto_84583 ?auto_84584 ?auto_84585 ?auto_84586 ?auto_84587 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84638 - SURFACE
      ?auto_84639 - SURFACE
      ?auto_84640 - SURFACE
      ?auto_84641 - SURFACE
      ?auto_84642 - SURFACE
      ?auto_84643 - SURFACE
      ?auto_84644 - SURFACE
    )
    :vars
    (
      ?auto_84647 - HOIST
      ?auto_84649 - PLACE
      ?auto_84648 - TRUCK
      ?auto_84646 - PLACE
      ?auto_84645 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_84647 ?auto_84649 ) ( SURFACE-AT ?auto_84643 ?auto_84649 ) ( CLEAR ?auto_84643 ) ( IS-CRATE ?auto_84644 ) ( not ( = ?auto_84643 ?auto_84644 ) ) ( AVAILABLE ?auto_84647 ) ( ON ?auto_84643 ?auto_84642 ) ( not ( = ?auto_84642 ?auto_84643 ) ) ( not ( = ?auto_84642 ?auto_84644 ) ) ( TRUCK-AT ?auto_84648 ?auto_84646 ) ( not ( = ?auto_84646 ?auto_84649 ) ) ( HOIST-AT ?auto_84645 ?auto_84646 ) ( LIFTING ?auto_84645 ?auto_84644 ) ( not ( = ?auto_84647 ?auto_84645 ) ) ( ON ?auto_84639 ?auto_84638 ) ( ON ?auto_84640 ?auto_84639 ) ( ON ?auto_84641 ?auto_84640 ) ( ON ?auto_84642 ?auto_84641 ) ( not ( = ?auto_84638 ?auto_84639 ) ) ( not ( = ?auto_84638 ?auto_84640 ) ) ( not ( = ?auto_84638 ?auto_84641 ) ) ( not ( = ?auto_84638 ?auto_84642 ) ) ( not ( = ?auto_84638 ?auto_84643 ) ) ( not ( = ?auto_84638 ?auto_84644 ) ) ( not ( = ?auto_84639 ?auto_84640 ) ) ( not ( = ?auto_84639 ?auto_84641 ) ) ( not ( = ?auto_84639 ?auto_84642 ) ) ( not ( = ?auto_84639 ?auto_84643 ) ) ( not ( = ?auto_84639 ?auto_84644 ) ) ( not ( = ?auto_84640 ?auto_84641 ) ) ( not ( = ?auto_84640 ?auto_84642 ) ) ( not ( = ?auto_84640 ?auto_84643 ) ) ( not ( = ?auto_84640 ?auto_84644 ) ) ( not ( = ?auto_84641 ?auto_84642 ) ) ( not ( = ?auto_84641 ?auto_84643 ) ) ( not ( = ?auto_84641 ?auto_84644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84642 ?auto_84643 ?auto_84644 )
      ( MAKE-6CRATE-VERIFY ?auto_84638 ?auto_84639 ?auto_84640 ?auto_84641 ?auto_84642 ?auto_84643 ?auto_84644 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84701 - SURFACE
      ?auto_84702 - SURFACE
      ?auto_84703 - SURFACE
      ?auto_84704 - SURFACE
      ?auto_84705 - SURFACE
      ?auto_84706 - SURFACE
      ?auto_84707 - SURFACE
    )
    :vars
    (
      ?auto_84712 - HOIST
      ?auto_84711 - PLACE
      ?auto_84708 - TRUCK
      ?auto_84713 - PLACE
      ?auto_84709 - HOIST
      ?auto_84710 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_84712 ?auto_84711 ) ( SURFACE-AT ?auto_84706 ?auto_84711 ) ( CLEAR ?auto_84706 ) ( IS-CRATE ?auto_84707 ) ( not ( = ?auto_84706 ?auto_84707 ) ) ( AVAILABLE ?auto_84712 ) ( ON ?auto_84706 ?auto_84705 ) ( not ( = ?auto_84705 ?auto_84706 ) ) ( not ( = ?auto_84705 ?auto_84707 ) ) ( TRUCK-AT ?auto_84708 ?auto_84713 ) ( not ( = ?auto_84713 ?auto_84711 ) ) ( HOIST-AT ?auto_84709 ?auto_84713 ) ( not ( = ?auto_84712 ?auto_84709 ) ) ( AVAILABLE ?auto_84709 ) ( SURFACE-AT ?auto_84707 ?auto_84713 ) ( ON ?auto_84707 ?auto_84710 ) ( CLEAR ?auto_84707 ) ( not ( = ?auto_84706 ?auto_84710 ) ) ( not ( = ?auto_84707 ?auto_84710 ) ) ( not ( = ?auto_84705 ?auto_84710 ) ) ( ON ?auto_84702 ?auto_84701 ) ( ON ?auto_84703 ?auto_84702 ) ( ON ?auto_84704 ?auto_84703 ) ( ON ?auto_84705 ?auto_84704 ) ( not ( = ?auto_84701 ?auto_84702 ) ) ( not ( = ?auto_84701 ?auto_84703 ) ) ( not ( = ?auto_84701 ?auto_84704 ) ) ( not ( = ?auto_84701 ?auto_84705 ) ) ( not ( = ?auto_84701 ?auto_84706 ) ) ( not ( = ?auto_84701 ?auto_84707 ) ) ( not ( = ?auto_84701 ?auto_84710 ) ) ( not ( = ?auto_84702 ?auto_84703 ) ) ( not ( = ?auto_84702 ?auto_84704 ) ) ( not ( = ?auto_84702 ?auto_84705 ) ) ( not ( = ?auto_84702 ?auto_84706 ) ) ( not ( = ?auto_84702 ?auto_84707 ) ) ( not ( = ?auto_84702 ?auto_84710 ) ) ( not ( = ?auto_84703 ?auto_84704 ) ) ( not ( = ?auto_84703 ?auto_84705 ) ) ( not ( = ?auto_84703 ?auto_84706 ) ) ( not ( = ?auto_84703 ?auto_84707 ) ) ( not ( = ?auto_84703 ?auto_84710 ) ) ( not ( = ?auto_84704 ?auto_84705 ) ) ( not ( = ?auto_84704 ?auto_84706 ) ) ( not ( = ?auto_84704 ?auto_84707 ) ) ( not ( = ?auto_84704 ?auto_84710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84705 ?auto_84706 ?auto_84707 )
      ( MAKE-6CRATE-VERIFY ?auto_84701 ?auto_84702 ?auto_84703 ?auto_84704 ?auto_84705 ?auto_84706 ?auto_84707 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84765 - SURFACE
      ?auto_84766 - SURFACE
      ?auto_84767 - SURFACE
      ?auto_84768 - SURFACE
      ?auto_84769 - SURFACE
      ?auto_84770 - SURFACE
      ?auto_84771 - SURFACE
    )
    :vars
    (
      ?auto_84772 - HOIST
      ?auto_84773 - PLACE
      ?auto_84777 - PLACE
      ?auto_84775 - HOIST
      ?auto_84774 - SURFACE
      ?auto_84776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84772 ?auto_84773 ) ( SURFACE-AT ?auto_84770 ?auto_84773 ) ( CLEAR ?auto_84770 ) ( IS-CRATE ?auto_84771 ) ( not ( = ?auto_84770 ?auto_84771 ) ) ( AVAILABLE ?auto_84772 ) ( ON ?auto_84770 ?auto_84769 ) ( not ( = ?auto_84769 ?auto_84770 ) ) ( not ( = ?auto_84769 ?auto_84771 ) ) ( not ( = ?auto_84777 ?auto_84773 ) ) ( HOIST-AT ?auto_84775 ?auto_84777 ) ( not ( = ?auto_84772 ?auto_84775 ) ) ( AVAILABLE ?auto_84775 ) ( SURFACE-AT ?auto_84771 ?auto_84777 ) ( ON ?auto_84771 ?auto_84774 ) ( CLEAR ?auto_84771 ) ( not ( = ?auto_84770 ?auto_84774 ) ) ( not ( = ?auto_84771 ?auto_84774 ) ) ( not ( = ?auto_84769 ?auto_84774 ) ) ( TRUCK-AT ?auto_84776 ?auto_84773 ) ( ON ?auto_84766 ?auto_84765 ) ( ON ?auto_84767 ?auto_84766 ) ( ON ?auto_84768 ?auto_84767 ) ( ON ?auto_84769 ?auto_84768 ) ( not ( = ?auto_84765 ?auto_84766 ) ) ( not ( = ?auto_84765 ?auto_84767 ) ) ( not ( = ?auto_84765 ?auto_84768 ) ) ( not ( = ?auto_84765 ?auto_84769 ) ) ( not ( = ?auto_84765 ?auto_84770 ) ) ( not ( = ?auto_84765 ?auto_84771 ) ) ( not ( = ?auto_84765 ?auto_84774 ) ) ( not ( = ?auto_84766 ?auto_84767 ) ) ( not ( = ?auto_84766 ?auto_84768 ) ) ( not ( = ?auto_84766 ?auto_84769 ) ) ( not ( = ?auto_84766 ?auto_84770 ) ) ( not ( = ?auto_84766 ?auto_84771 ) ) ( not ( = ?auto_84766 ?auto_84774 ) ) ( not ( = ?auto_84767 ?auto_84768 ) ) ( not ( = ?auto_84767 ?auto_84769 ) ) ( not ( = ?auto_84767 ?auto_84770 ) ) ( not ( = ?auto_84767 ?auto_84771 ) ) ( not ( = ?auto_84767 ?auto_84774 ) ) ( not ( = ?auto_84768 ?auto_84769 ) ) ( not ( = ?auto_84768 ?auto_84770 ) ) ( not ( = ?auto_84768 ?auto_84771 ) ) ( not ( = ?auto_84768 ?auto_84774 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84769 ?auto_84770 ?auto_84771 )
      ( MAKE-6CRATE-VERIFY ?auto_84765 ?auto_84766 ?auto_84767 ?auto_84768 ?auto_84769 ?auto_84770 ?auto_84771 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84829 - SURFACE
      ?auto_84830 - SURFACE
      ?auto_84831 - SURFACE
      ?auto_84832 - SURFACE
      ?auto_84833 - SURFACE
      ?auto_84834 - SURFACE
      ?auto_84835 - SURFACE
    )
    :vars
    (
      ?auto_84840 - HOIST
      ?auto_84836 - PLACE
      ?auto_84838 - PLACE
      ?auto_84841 - HOIST
      ?auto_84837 - SURFACE
      ?auto_84839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84840 ?auto_84836 ) ( IS-CRATE ?auto_84835 ) ( not ( = ?auto_84834 ?auto_84835 ) ) ( not ( = ?auto_84833 ?auto_84834 ) ) ( not ( = ?auto_84833 ?auto_84835 ) ) ( not ( = ?auto_84838 ?auto_84836 ) ) ( HOIST-AT ?auto_84841 ?auto_84838 ) ( not ( = ?auto_84840 ?auto_84841 ) ) ( AVAILABLE ?auto_84841 ) ( SURFACE-AT ?auto_84835 ?auto_84838 ) ( ON ?auto_84835 ?auto_84837 ) ( CLEAR ?auto_84835 ) ( not ( = ?auto_84834 ?auto_84837 ) ) ( not ( = ?auto_84835 ?auto_84837 ) ) ( not ( = ?auto_84833 ?auto_84837 ) ) ( TRUCK-AT ?auto_84839 ?auto_84836 ) ( SURFACE-AT ?auto_84833 ?auto_84836 ) ( CLEAR ?auto_84833 ) ( LIFTING ?auto_84840 ?auto_84834 ) ( IS-CRATE ?auto_84834 ) ( ON ?auto_84830 ?auto_84829 ) ( ON ?auto_84831 ?auto_84830 ) ( ON ?auto_84832 ?auto_84831 ) ( ON ?auto_84833 ?auto_84832 ) ( not ( = ?auto_84829 ?auto_84830 ) ) ( not ( = ?auto_84829 ?auto_84831 ) ) ( not ( = ?auto_84829 ?auto_84832 ) ) ( not ( = ?auto_84829 ?auto_84833 ) ) ( not ( = ?auto_84829 ?auto_84834 ) ) ( not ( = ?auto_84829 ?auto_84835 ) ) ( not ( = ?auto_84829 ?auto_84837 ) ) ( not ( = ?auto_84830 ?auto_84831 ) ) ( not ( = ?auto_84830 ?auto_84832 ) ) ( not ( = ?auto_84830 ?auto_84833 ) ) ( not ( = ?auto_84830 ?auto_84834 ) ) ( not ( = ?auto_84830 ?auto_84835 ) ) ( not ( = ?auto_84830 ?auto_84837 ) ) ( not ( = ?auto_84831 ?auto_84832 ) ) ( not ( = ?auto_84831 ?auto_84833 ) ) ( not ( = ?auto_84831 ?auto_84834 ) ) ( not ( = ?auto_84831 ?auto_84835 ) ) ( not ( = ?auto_84831 ?auto_84837 ) ) ( not ( = ?auto_84832 ?auto_84833 ) ) ( not ( = ?auto_84832 ?auto_84834 ) ) ( not ( = ?auto_84832 ?auto_84835 ) ) ( not ( = ?auto_84832 ?auto_84837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84833 ?auto_84834 ?auto_84835 )
      ( MAKE-6CRATE-VERIFY ?auto_84829 ?auto_84830 ?auto_84831 ?auto_84832 ?auto_84833 ?auto_84834 ?auto_84835 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_84893 - SURFACE
      ?auto_84894 - SURFACE
      ?auto_84895 - SURFACE
      ?auto_84896 - SURFACE
      ?auto_84897 - SURFACE
      ?auto_84898 - SURFACE
      ?auto_84899 - SURFACE
    )
    :vars
    (
      ?auto_84904 - HOIST
      ?auto_84903 - PLACE
      ?auto_84900 - PLACE
      ?auto_84901 - HOIST
      ?auto_84905 - SURFACE
      ?auto_84902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_84904 ?auto_84903 ) ( IS-CRATE ?auto_84899 ) ( not ( = ?auto_84898 ?auto_84899 ) ) ( not ( = ?auto_84897 ?auto_84898 ) ) ( not ( = ?auto_84897 ?auto_84899 ) ) ( not ( = ?auto_84900 ?auto_84903 ) ) ( HOIST-AT ?auto_84901 ?auto_84900 ) ( not ( = ?auto_84904 ?auto_84901 ) ) ( AVAILABLE ?auto_84901 ) ( SURFACE-AT ?auto_84899 ?auto_84900 ) ( ON ?auto_84899 ?auto_84905 ) ( CLEAR ?auto_84899 ) ( not ( = ?auto_84898 ?auto_84905 ) ) ( not ( = ?auto_84899 ?auto_84905 ) ) ( not ( = ?auto_84897 ?auto_84905 ) ) ( TRUCK-AT ?auto_84902 ?auto_84903 ) ( SURFACE-AT ?auto_84897 ?auto_84903 ) ( CLEAR ?auto_84897 ) ( IS-CRATE ?auto_84898 ) ( AVAILABLE ?auto_84904 ) ( IN ?auto_84898 ?auto_84902 ) ( ON ?auto_84894 ?auto_84893 ) ( ON ?auto_84895 ?auto_84894 ) ( ON ?auto_84896 ?auto_84895 ) ( ON ?auto_84897 ?auto_84896 ) ( not ( = ?auto_84893 ?auto_84894 ) ) ( not ( = ?auto_84893 ?auto_84895 ) ) ( not ( = ?auto_84893 ?auto_84896 ) ) ( not ( = ?auto_84893 ?auto_84897 ) ) ( not ( = ?auto_84893 ?auto_84898 ) ) ( not ( = ?auto_84893 ?auto_84899 ) ) ( not ( = ?auto_84893 ?auto_84905 ) ) ( not ( = ?auto_84894 ?auto_84895 ) ) ( not ( = ?auto_84894 ?auto_84896 ) ) ( not ( = ?auto_84894 ?auto_84897 ) ) ( not ( = ?auto_84894 ?auto_84898 ) ) ( not ( = ?auto_84894 ?auto_84899 ) ) ( not ( = ?auto_84894 ?auto_84905 ) ) ( not ( = ?auto_84895 ?auto_84896 ) ) ( not ( = ?auto_84895 ?auto_84897 ) ) ( not ( = ?auto_84895 ?auto_84898 ) ) ( not ( = ?auto_84895 ?auto_84899 ) ) ( not ( = ?auto_84895 ?auto_84905 ) ) ( not ( = ?auto_84896 ?auto_84897 ) ) ( not ( = ?auto_84896 ?auto_84898 ) ) ( not ( = ?auto_84896 ?auto_84899 ) ) ( not ( = ?auto_84896 ?auto_84905 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_84897 ?auto_84898 ?auto_84899 )
      ( MAKE-6CRATE-VERIFY ?auto_84893 ?auto_84894 ?auto_84895 ?auto_84896 ?auto_84897 ?auto_84898 ?auto_84899 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86849 - SURFACE
      ?auto_86850 - SURFACE
      ?auto_86851 - SURFACE
      ?auto_86852 - SURFACE
      ?auto_86853 - SURFACE
      ?auto_86854 - SURFACE
      ?auto_86855 - SURFACE
      ?auto_86856 - SURFACE
    )
    :vars
    (
      ?auto_86858 - HOIST
      ?auto_86857 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_86858 ?auto_86857 ) ( SURFACE-AT ?auto_86855 ?auto_86857 ) ( CLEAR ?auto_86855 ) ( LIFTING ?auto_86858 ?auto_86856 ) ( IS-CRATE ?auto_86856 ) ( not ( = ?auto_86855 ?auto_86856 ) ) ( ON ?auto_86850 ?auto_86849 ) ( ON ?auto_86851 ?auto_86850 ) ( ON ?auto_86852 ?auto_86851 ) ( ON ?auto_86853 ?auto_86852 ) ( ON ?auto_86854 ?auto_86853 ) ( ON ?auto_86855 ?auto_86854 ) ( not ( = ?auto_86849 ?auto_86850 ) ) ( not ( = ?auto_86849 ?auto_86851 ) ) ( not ( = ?auto_86849 ?auto_86852 ) ) ( not ( = ?auto_86849 ?auto_86853 ) ) ( not ( = ?auto_86849 ?auto_86854 ) ) ( not ( = ?auto_86849 ?auto_86855 ) ) ( not ( = ?auto_86849 ?auto_86856 ) ) ( not ( = ?auto_86850 ?auto_86851 ) ) ( not ( = ?auto_86850 ?auto_86852 ) ) ( not ( = ?auto_86850 ?auto_86853 ) ) ( not ( = ?auto_86850 ?auto_86854 ) ) ( not ( = ?auto_86850 ?auto_86855 ) ) ( not ( = ?auto_86850 ?auto_86856 ) ) ( not ( = ?auto_86851 ?auto_86852 ) ) ( not ( = ?auto_86851 ?auto_86853 ) ) ( not ( = ?auto_86851 ?auto_86854 ) ) ( not ( = ?auto_86851 ?auto_86855 ) ) ( not ( = ?auto_86851 ?auto_86856 ) ) ( not ( = ?auto_86852 ?auto_86853 ) ) ( not ( = ?auto_86852 ?auto_86854 ) ) ( not ( = ?auto_86852 ?auto_86855 ) ) ( not ( = ?auto_86852 ?auto_86856 ) ) ( not ( = ?auto_86853 ?auto_86854 ) ) ( not ( = ?auto_86853 ?auto_86855 ) ) ( not ( = ?auto_86853 ?auto_86856 ) ) ( not ( = ?auto_86854 ?auto_86855 ) ) ( not ( = ?auto_86854 ?auto_86856 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_86855 ?auto_86856 )
      ( MAKE-7CRATE-VERIFY ?auto_86849 ?auto_86850 ?auto_86851 ?auto_86852 ?auto_86853 ?auto_86854 ?auto_86855 ?auto_86856 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86904 - SURFACE
      ?auto_86905 - SURFACE
      ?auto_86906 - SURFACE
      ?auto_86907 - SURFACE
      ?auto_86908 - SURFACE
      ?auto_86909 - SURFACE
      ?auto_86910 - SURFACE
      ?auto_86911 - SURFACE
    )
    :vars
    (
      ?auto_86914 - HOIST
      ?auto_86912 - PLACE
      ?auto_86913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_86914 ?auto_86912 ) ( SURFACE-AT ?auto_86910 ?auto_86912 ) ( CLEAR ?auto_86910 ) ( IS-CRATE ?auto_86911 ) ( not ( = ?auto_86910 ?auto_86911 ) ) ( TRUCK-AT ?auto_86913 ?auto_86912 ) ( AVAILABLE ?auto_86914 ) ( IN ?auto_86911 ?auto_86913 ) ( ON ?auto_86910 ?auto_86909 ) ( not ( = ?auto_86909 ?auto_86910 ) ) ( not ( = ?auto_86909 ?auto_86911 ) ) ( ON ?auto_86905 ?auto_86904 ) ( ON ?auto_86906 ?auto_86905 ) ( ON ?auto_86907 ?auto_86906 ) ( ON ?auto_86908 ?auto_86907 ) ( ON ?auto_86909 ?auto_86908 ) ( not ( = ?auto_86904 ?auto_86905 ) ) ( not ( = ?auto_86904 ?auto_86906 ) ) ( not ( = ?auto_86904 ?auto_86907 ) ) ( not ( = ?auto_86904 ?auto_86908 ) ) ( not ( = ?auto_86904 ?auto_86909 ) ) ( not ( = ?auto_86904 ?auto_86910 ) ) ( not ( = ?auto_86904 ?auto_86911 ) ) ( not ( = ?auto_86905 ?auto_86906 ) ) ( not ( = ?auto_86905 ?auto_86907 ) ) ( not ( = ?auto_86905 ?auto_86908 ) ) ( not ( = ?auto_86905 ?auto_86909 ) ) ( not ( = ?auto_86905 ?auto_86910 ) ) ( not ( = ?auto_86905 ?auto_86911 ) ) ( not ( = ?auto_86906 ?auto_86907 ) ) ( not ( = ?auto_86906 ?auto_86908 ) ) ( not ( = ?auto_86906 ?auto_86909 ) ) ( not ( = ?auto_86906 ?auto_86910 ) ) ( not ( = ?auto_86906 ?auto_86911 ) ) ( not ( = ?auto_86907 ?auto_86908 ) ) ( not ( = ?auto_86907 ?auto_86909 ) ) ( not ( = ?auto_86907 ?auto_86910 ) ) ( not ( = ?auto_86907 ?auto_86911 ) ) ( not ( = ?auto_86908 ?auto_86909 ) ) ( not ( = ?auto_86908 ?auto_86910 ) ) ( not ( = ?auto_86908 ?auto_86911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86909 ?auto_86910 ?auto_86911 )
      ( MAKE-7CRATE-VERIFY ?auto_86904 ?auto_86905 ?auto_86906 ?auto_86907 ?auto_86908 ?auto_86909 ?auto_86910 ?auto_86911 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_86967 - SURFACE
      ?auto_86968 - SURFACE
      ?auto_86969 - SURFACE
      ?auto_86970 - SURFACE
      ?auto_86971 - SURFACE
      ?auto_86972 - SURFACE
      ?auto_86973 - SURFACE
      ?auto_86974 - SURFACE
    )
    :vars
    (
      ?auto_86978 - HOIST
      ?auto_86977 - PLACE
      ?auto_86976 - TRUCK
      ?auto_86975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_86978 ?auto_86977 ) ( SURFACE-AT ?auto_86973 ?auto_86977 ) ( CLEAR ?auto_86973 ) ( IS-CRATE ?auto_86974 ) ( not ( = ?auto_86973 ?auto_86974 ) ) ( AVAILABLE ?auto_86978 ) ( IN ?auto_86974 ?auto_86976 ) ( ON ?auto_86973 ?auto_86972 ) ( not ( = ?auto_86972 ?auto_86973 ) ) ( not ( = ?auto_86972 ?auto_86974 ) ) ( TRUCK-AT ?auto_86976 ?auto_86975 ) ( not ( = ?auto_86975 ?auto_86977 ) ) ( ON ?auto_86968 ?auto_86967 ) ( ON ?auto_86969 ?auto_86968 ) ( ON ?auto_86970 ?auto_86969 ) ( ON ?auto_86971 ?auto_86970 ) ( ON ?auto_86972 ?auto_86971 ) ( not ( = ?auto_86967 ?auto_86968 ) ) ( not ( = ?auto_86967 ?auto_86969 ) ) ( not ( = ?auto_86967 ?auto_86970 ) ) ( not ( = ?auto_86967 ?auto_86971 ) ) ( not ( = ?auto_86967 ?auto_86972 ) ) ( not ( = ?auto_86967 ?auto_86973 ) ) ( not ( = ?auto_86967 ?auto_86974 ) ) ( not ( = ?auto_86968 ?auto_86969 ) ) ( not ( = ?auto_86968 ?auto_86970 ) ) ( not ( = ?auto_86968 ?auto_86971 ) ) ( not ( = ?auto_86968 ?auto_86972 ) ) ( not ( = ?auto_86968 ?auto_86973 ) ) ( not ( = ?auto_86968 ?auto_86974 ) ) ( not ( = ?auto_86969 ?auto_86970 ) ) ( not ( = ?auto_86969 ?auto_86971 ) ) ( not ( = ?auto_86969 ?auto_86972 ) ) ( not ( = ?auto_86969 ?auto_86973 ) ) ( not ( = ?auto_86969 ?auto_86974 ) ) ( not ( = ?auto_86970 ?auto_86971 ) ) ( not ( = ?auto_86970 ?auto_86972 ) ) ( not ( = ?auto_86970 ?auto_86973 ) ) ( not ( = ?auto_86970 ?auto_86974 ) ) ( not ( = ?auto_86971 ?auto_86972 ) ) ( not ( = ?auto_86971 ?auto_86973 ) ) ( not ( = ?auto_86971 ?auto_86974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_86972 ?auto_86973 ?auto_86974 )
      ( MAKE-7CRATE-VERIFY ?auto_86967 ?auto_86968 ?auto_86969 ?auto_86970 ?auto_86971 ?auto_86972 ?auto_86973 ?auto_86974 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87037 - SURFACE
      ?auto_87038 - SURFACE
      ?auto_87039 - SURFACE
      ?auto_87040 - SURFACE
      ?auto_87041 - SURFACE
      ?auto_87042 - SURFACE
      ?auto_87043 - SURFACE
      ?auto_87044 - SURFACE
    )
    :vars
    (
      ?auto_87045 - HOIST
      ?auto_87047 - PLACE
      ?auto_87049 - TRUCK
      ?auto_87046 - PLACE
      ?auto_87048 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_87045 ?auto_87047 ) ( SURFACE-AT ?auto_87043 ?auto_87047 ) ( CLEAR ?auto_87043 ) ( IS-CRATE ?auto_87044 ) ( not ( = ?auto_87043 ?auto_87044 ) ) ( AVAILABLE ?auto_87045 ) ( ON ?auto_87043 ?auto_87042 ) ( not ( = ?auto_87042 ?auto_87043 ) ) ( not ( = ?auto_87042 ?auto_87044 ) ) ( TRUCK-AT ?auto_87049 ?auto_87046 ) ( not ( = ?auto_87046 ?auto_87047 ) ) ( HOIST-AT ?auto_87048 ?auto_87046 ) ( LIFTING ?auto_87048 ?auto_87044 ) ( not ( = ?auto_87045 ?auto_87048 ) ) ( ON ?auto_87038 ?auto_87037 ) ( ON ?auto_87039 ?auto_87038 ) ( ON ?auto_87040 ?auto_87039 ) ( ON ?auto_87041 ?auto_87040 ) ( ON ?auto_87042 ?auto_87041 ) ( not ( = ?auto_87037 ?auto_87038 ) ) ( not ( = ?auto_87037 ?auto_87039 ) ) ( not ( = ?auto_87037 ?auto_87040 ) ) ( not ( = ?auto_87037 ?auto_87041 ) ) ( not ( = ?auto_87037 ?auto_87042 ) ) ( not ( = ?auto_87037 ?auto_87043 ) ) ( not ( = ?auto_87037 ?auto_87044 ) ) ( not ( = ?auto_87038 ?auto_87039 ) ) ( not ( = ?auto_87038 ?auto_87040 ) ) ( not ( = ?auto_87038 ?auto_87041 ) ) ( not ( = ?auto_87038 ?auto_87042 ) ) ( not ( = ?auto_87038 ?auto_87043 ) ) ( not ( = ?auto_87038 ?auto_87044 ) ) ( not ( = ?auto_87039 ?auto_87040 ) ) ( not ( = ?auto_87039 ?auto_87041 ) ) ( not ( = ?auto_87039 ?auto_87042 ) ) ( not ( = ?auto_87039 ?auto_87043 ) ) ( not ( = ?auto_87039 ?auto_87044 ) ) ( not ( = ?auto_87040 ?auto_87041 ) ) ( not ( = ?auto_87040 ?auto_87042 ) ) ( not ( = ?auto_87040 ?auto_87043 ) ) ( not ( = ?auto_87040 ?auto_87044 ) ) ( not ( = ?auto_87041 ?auto_87042 ) ) ( not ( = ?auto_87041 ?auto_87043 ) ) ( not ( = ?auto_87041 ?auto_87044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87042 ?auto_87043 ?auto_87044 )
      ( MAKE-7CRATE-VERIFY ?auto_87037 ?auto_87038 ?auto_87039 ?auto_87040 ?auto_87041 ?auto_87042 ?auto_87043 ?auto_87044 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87114 - SURFACE
      ?auto_87115 - SURFACE
      ?auto_87116 - SURFACE
      ?auto_87117 - SURFACE
      ?auto_87118 - SURFACE
      ?auto_87119 - SURFACE
      ?auto_87120 - SURFACE
      ?auto_87121 - SURFACE
    )
    :vars
    (
      ?auto_87122 - HOIST
      ?auto_87127 - PLACE
      ?auto_87125 - TRUCK
      ?auto_87126 - PLACE
      ?auto_87123 - HOIST
      ?auto_87124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_87122 ?auto_87127 ) ( SURFACE-AT ?auto_87120 ?auto_87127 ) ( CLEAR ?auto_87120 ) ( IS-CRATE ?auto_87121 ) ( not ( = ?auto_87120 ?auto_87121 ) ) ( AVAILABLE ?auto_87122 ) ( ON ?auto_87120 ?auto_87119 ) ( not ( = ?auto_87119 ?auto_87120 ) ) ( not ( = ?auto_87119 ?auto_87121 ) ) ( TRUCK-AT ?auto_87125 ?auto_87126 ) ( not ( = ?auto_87126 ?auto_87127 ) ) ( HOIST-AT ?auto_87123 ?auto_87126 ) ( not ( = ?auto_87122 ?auto_87123 ) ) ( AVAILABLE ?auto_87123 ) ( SURFACE-AT ?auto_87121 ?auto_87126 ) ( ON ?auto_87121 ?auto_87124 ) ( CLEAR ?auto_87121 ) ( not ( = ?auto_87120 ?auto_87124 ) ) ( not ( = ?auto_87121 ?auto_87124 ) ) ( not ( = ?auto_87119 ?auto_87124 ) ) ( ON ?auto_87115 ?auto_87114 ) ( ON ?auto_87116 ?auto_87115 ) ( ON ?auto_87117 ?auto_87116 ) ( ON ?auto_87118 ?auto_87117 ) ( ON ?auto_87119 ?auto_87118 ) ( not ( = ?auto_87114 ?auto_87115 ) ) ( not ( = ?auto_87114 ?auto_87116 ) ) ( not ( = ?auto_87114 ?auto_87117 ) ) ( not ( = ?auto_87114 ?auto_87118 ) ) ( not ( = ?auto_87114 ?auto_87119 ) ) ( not ( = ?auto_87114 ?auto_87120 ) ) ( not ( = ?auto_87114 ?auto_87121 ) ) ( not ( = ?auto_87114 ?auto_87124 ) ) ( not ( = ?auto_87115 ?auto_87116 ) ) ( not ( = ?auto_87115 ?auto_87117 ) ) ( not ( = ?auto_87115 ?auto_87118 ) ) ( not ( = ?auto_87115 ?auto_87119 ) ) ( not ( = ?auto_87115 ?auto_87120 ) ) ( not ( = ?auto_87115 ?auto_87121 ) ) ( not ( = ?auto_87115 ?auto_87124 ) ) ( not ( = ?auto_87116 ?auto_87117 ) ) ( not ( = ?auto_87116 ?auto_87118 ) ) ( not ( = ?auto_87116 ?auto_87119 ) ) ( not ( = ?auto_87116 ?auto_87120 ) ) ( not ( = ?auto_87116 ?auto_87121 ) ) ( not ( = ?auto_87116 ?auto_87124 ) ) ( not ( = ?auto_87117 ?auto_87118 ) ) ( not ( = ?auto_87117 ?auto_87119 ) ) ( not ( = ?auto_87117 ?auto_87120 ) ) ( not ( = ?auto_87117 ?auto_87121 ) ) ( not ( = ?auto_87117 ?auto_87124 ) ) ( not ( = ?auto_87118 ?auto_87119 ) ) ( not ( = ?auto_87118 ?auto_87120 ) ) ( not ( = ?auto_87118 ?auto_87121 ) ) ( not ( = ?auto_87118 ?auto_87124 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87119 ?auto_87120 ?auto_87121 )
      ( MAKE-7CRATE-VERIFY ?auto_87114 ?auto_87115 ?auto_87116 ?auto_87117 ?auto_87118 ?auto_87119 ?auto_87120 ?auto_87121 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87192 - SURFACE
      ?auto_87193 - SURFACE
      ?auto_87194 - SURFACE
      ?auto_87195 - SURFACE
      ?auto_87196 - SURFACE
      ?auto_87197 - SURFACE
      ?auto_87198 - SURFACE
      ?auto_87199 - SURFACE
    )
    :vars
    (
      ?auto_87201 - HOIST
      ?auto_87205 - PLACE
      ?auto_87202 - PLACE
      ?auto_87203 - HOIST
      ?auto_87200 - SURFACE
      ?auto_87204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87201 ?auto_87205 ) ( SURFACE-AT ?auto_87198 ?auto_87205 ) ( CLEAR ?auto_87198 ) ( IS-CRATE ?auto_87199 ) ( not ( = ?auto_87198 ?auto_87199 ) ) ( AVAILABLE ?auto_87201 ) ( ON ?auto_87198 ?auto_87197 ) ( not ( = ?auto_87197 ?auto_87198 ) ) ( not ( = ?auto_87197 ?auto_87199 ) ) ( not ( = ?auto_87202 ?auto_87205 ) ) ( HOIST-AT ?auto_87203 ?auto_87202 ) ( not ( = ?auto_87201 ?auto_87203 ) ) ( AVAILABLE ?auto_87203 ) ( SURFACE-AT ?auto_87199 ?auto_87202 ) ( ON ?auto_87199 ?auto_87200 ) ( CLEAR ?auto_87199 ) ( not ( = ?auto_87198 ?auto_87200 ) ) ( not ( = ?auto_87199 ?auto_87200 ) ) ( not ( = ?auto_87197 ?auto_87200 ) ) ( TRUCK-AT ?auto_87204 ?auto_87205 ) ( ON ?auto_87193 ?auto_87192 ) ( ON ?auto_87194 ?auto_87193 ) ( ON ?auto_87195 ?auto_87194 ) ( ON ?auto_87196 ?auto_87195 ) ( ON ?auto_87197 ?auto_87196 ) ( not ( = ?auto_87192 ?auto_87193 ) ) ( not ( = ?auto_87192 ?auto_87194 ) ) ( not ( = ?auto_87192 ?auto_87195 ) ) ( not ( = ?auto_87192 ?auto_87196 ) ) ( not ( = ?auto_87192 ?auto_87197 ) ) ( not ( = ?auto_87192 ?auto_87198 ) ) ( not ( = ?auto_87192 ?auto_87199 ) ) ( not ( = ?auto_87192 ?auto_87200 ) ) ( not ( = ?auto_87193 ?auto_87194 ) ) ( not ( = ?auto_87193 ?auto_87195 ) ) ( not ( = ?auto_87193 ?auto_87196 ) ) ( not ( = ?auto_87193 ?auto_87197 ) ) ( not ( = ?auto_87193 ?auto_87198 ) ) ( not ( = ?auto_87193 ?auto_87199 ) ) ( not ( = ?auto_87193 ?auto_87200 ) ) ( not ( = ?auto_87194 ?auto_87195 ) ) ( not ( = ?auto_87194 ?auto_87196 ) ) ( not ( = ?auto_87194 ?auto_87197 ) ) ( not ( = ?auto_87194 ?auto_87198 ) ) ( not ( = ?auto_87194 ?auto_87199 ) ) ( not ( = ?auto_87194 ?auto_87200 ) ) ( not ( = ?auto_87195 ?auto_87196 ) ) ( not ( = ?auto_87195 ?auto_87197 ) ) ( not ( = ?auto_87195 ?auto_87198 ) ) ( not ( = ?auto_87195 ?auto_87199 ) ) ( not ( = ?auto_87195 ?auto_87200 ) ) ( not ( = ?auto_87196 ?auto_87197 ) ) ( not ( = ?auto_87196 ?auto_87198 ) ) ( not ( = ?auto_87196 ?auto_87199 ) ) ( not ( = ?auto_87196 ?auto_87200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87197 ?auto_87198 ?auto_87199 )
      ( MAKE-7CRATE-VERIFY ?auto_87192 ?auto_87193 ?auto_87194 ?auto_87195 ?auto_87196 ?auto_87197 ?auto_87198 ?auto_87199 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87270 - SURFACE
      ?auto_87271 - SURFACE
      ?auto_87272 - SURFACE
      ?auto_87273 - SURFACE
      ?auto_87274 - SURFACE
      ?auto_87275 - SURFACE
      ?auto_87276 - SURFACE
      ?auto_87277 - SURFACE
    )
    :vars
    (
      ?auto_87283 - HOIST
      ?auto_87282 - PLACE
      ?auto_87281 - PLACE
      ?auto_87279 - HOIST
      ?auto_87278 - SURFACE
      ?auto_87280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87283 ?auto_87282 ) ( IS-CRATE ?auto_87277 ) ( not ( = ?auto_87276 ?auto_87277 ) ) ( not ( = ?auto_87275 ?auto_87276 ) ) ( not ( = ?auto_87275 ?auto_87277 ) ) ( not ( = ?auto_87281 ?auto_87282 ) ) ( HOIST-AT ?auto_87279 ?auto_87281 ) ( not ( = ?auto_87283 ?auto_87279 ) ) ( AVAILABLE ?auto_87279 ) ( SURFACE-AT ?auto_87277 ?auto_87281 ) ( ON ?auto_87277 ?auto_87278 ) ( CLEAR ?auto_87277 ) ( not ( = ?auto_87276 ?auto_87278 ) ) ( not ( = ?auto_87277 ?auto_87278 ) ) ( not ( = ?auto_87275 ?auto_87278 ) ) ( TRUCK-AT ?auto_87280 ?auto_87282 ) ( SURFACE-AT ?auto_87275 ?auto_87282 ) ( CLEAR ?auto_87275 ) ( LIFTING ?auto_87283 ?auto_87276 ) ( IS-CRATE ?auto_87276 ) ( ON ?auto_87271 ?auto_87270 ) ( ON ?auto_87272 ?auto_87271 ) ( ON ?auto_87273 ?auto_87272 ) ( ON ?auto_87274 ?auto_87273 ) ( ON ?auto_87275 ?auto_87274 ) ( not ( = ?auto_87270 ?auto_87271 ) ) ( not ( = ?auto_87270 ?auto_87272 ) ) ( not ( = ?auto_87270 ?auto_87273 ) ) ( not ( = ?auto_87270 ?auto_87274 ) ) ( not ( = ?auto_87270 ?auto_87275 ) ) ( not ( = ?auto_87270 ?auto_87276 ) ) ( not ( = ?auto_87270 ?auto_87277 ) ) ( not ( = ?auto_87270 ?auto_87278 ) ) ( not ( = ?auto_87271 ?auto_87272 ) ) ( not ( = ?auto_87271 ?auto_87273 ) ) ( not ( = ?auto_87271 ?auto_87274 ) ) ( not ( = ?auto_87271 ?auto_87275 ) ) ( not ( = ?auto_87271 ?auto_87276 ) ) ( not ( = ?auto_87271 ?auto_87277 ) ) ( not ( = ?auto_87271 ?auto_87278 ) ) ( not ( = ?auto_87272 ?auto_87273 ) ) ( not ( = ?auto_87272 ?auto_87274 ) ) ( not ( = ?auto_87272 ?auto_87275 ) ) ( not ( = ?auto_87272 ?auto_87276 ) ) ( not ( = ?auto_87272 ?auto_87277 ) ) ( not ( = ?auto_87272 ?auto_87278 ) ) ( not ( = ?auto_87273 ?auto_87274 ) ) ( not ( = ?auto_87273 ?auto_87275 ) ) ( not ( = ?auto_87273 ?auto_87276 ) ) ( not ( = ?auto_87273 ?auto_87277 ) ) ( not ( = ?auto_87273 ?auto_87278 ) ) ( not ( = ?auto_87274 ?auto_87275 ) ) ( not ( = ?auto_87274 ?auto_87276 ) ) ( not ( = ?auto_87274 ?auto_87277 ) ) ( not ( = ?auto_87274 ?auto_87278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87275 ?auto_87276 ?auto_87277 )
      ( MAKE-7CRATE-VERIFY ?auto_87270 ?auto_87271 ?auto_87272 ?auto_87273 ?auto_87274 ?auto_87275 ?auto_87276 ?auto_87277 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_87348 - SURFACE
      ?auto_87349 - SURFACE
      ?auto_87350 - SURFACE
      ?auto_87351 - SURFACE
      ?auto_87352 - SURFACE
      ?auto_87353 - SURFACE
      ?auto_87354 - SURFACE
      ?auto_87355 - SURFACE
    )
    :vars
    (
      ?auto_87356 - HOIST
      ?auto_87359 - PLACE
      ?auto_87357 - PLACE
      ?auto_87358 - HOIST
      ?auto_87360 - SURFACE
      ?auto_87361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_87356 ?auto_87359 ) ( IS-CRATE ?auto_87355 ) ( not ( = ?auto_87354 ?auto_87355 ) ) ( not ( = ?auto_87353 ?auto_87354 ) ) ( not ( = ?auto_87353 ?auto_87355 ) ) ( not ( = ?auto_87357 ?auto_87359 ) ) ( HOIST-AT ?auto_87358 ?auto_87357 ) ( not ( = ?auto_87356 ?auto_87358 ) ) ( AVAILABLE ?auto_87358 ) ( SURFACE-AT ?auto_87355 ?auto_87357 ) ( ON ?auto_87355 ?auto_87360 ) ( CLEAR ?auto_87355 ) ( not ( = ?auto_87354 ?auto_87360 ) ) ( not ( = ?auto_87355 ?auto_87360 ) ) ( not ( = ?auto_87353 ?auto_87360 ) ) ( TRUCK-AT ?auto_87361 ?auto_87359 ) ( SURFACE-AT ?auto_87353 ?auto_87359 ) ( CLEAR ?auto_87353 ) ( IS-CRATE ?auto_87354 ) ( AVAILABLE ?auto_87356 ) ( IN ?auto_87354 ?auto_87361 ) ( ON ?auto_87349 ?auto_87348 ) ( ON ?auto_87350 ?auto_87349 ) ( ON ?auto_87351 ?auto_87350 ) ( ON ?auto_87352 ?auto_87351 ) ( ON ?auto_87353 ?auto_87352 ) ( not ( = ?auto_87348 ?auto_87349 ) ) ( not ( = ?auto_87348 ?auto_87350 ) ) ( not ( = ?auto_87348 ?auto_87351 ) ) ( not ( = ?auto_87348 ?auto_87352 ) ) ( not ( = ?auto_87348 ?auto_87353 ) ) ( not ( = ?auto_87348 ?auto_87354 ) ) ( not ( = ?auto_87348 ?auto_87355 ) ) ( not ( = ?auto_87348 ?auto_87360 ) ) ( not ( = ?auto_87349 ?auto_87350 ) ) ( not ( = ?auto_87349 ?auto_87351 ) ) ( not ( = ?auto_87349 ?auto_87352 ) ) ( not ( = ?auto_87349 ?auto_87353 ) ) ( not ( = ?auto_87349 ?auto_87354 ) ) ( not ( = ?auto_87349 ?auto_87355 ) ) ( not ( = ?auto_87349 ?auto_87360 ) ) ( not ( = ?auto_87350 ?auto_87351 ) ) ( not ( = ?auto_87350 ?auto_87352 ) ) ( not ( = ?auto_87350 ?auto_87353 ) ) ( not ( = ?auto_87350 ?auto_87354 ) ) ( not ( = ?auto_87350 ?auto_87355 ) ) ( not ( = ?auto_87350 ?auto_87360 ) ) ( not ( = ?auto_87351 ?auto_87352 ) ) ( not ( = ?auto_87351 ?auto_87353 ) ) ( not ( = ?auto_87351 ?auto_87354 ) ) ( not ( = ?auto_87351 ?auto_87355 ) ) ( not ( = ?auto_87351 ?auto_87360 ) ) ( not ( = ?auto_87352 ?auto_87353 ) ) ( not ( = ?auto_87352 ?auto_87354 ) ) ( not ( = ?auto_87352 ?auto_87355 ) ) ( not ( = ?auto_87352 ?auto_87360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_87353 ?auto_87354 ?auto_87355 )
      ( MAKE-7CRATE-VERIFY ?auto_87348 ?auto_87349 ?auto_87350 ?auto_87351 ?auto_87352 ?auto_87353 ?auto_87354 ?auto_87355 ) )
  )

)

