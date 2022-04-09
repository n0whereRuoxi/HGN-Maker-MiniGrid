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
      ?auto_7338 - SURFACE
      ?auto_7339 - SURFACE
    )
    :vars
    (
      ?auto_7340 - HOIST
      ?auto_7341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7340 ?auto_7341 ) ( SURFACE-AT ?auto_7338 ?auto_7341 ) ( CLEAR ?auto_7338 ) ( LIFTING ?auto_7340 ?auto_7339 ) ( IS-CRATE ?auto_7339 ) ( not ( = ?auto_7338 ?auto_7339 ) ) )
    :subtasks
    ( ( !DROP ?auto_7340 ?auto_7339 ?auto_7338 ?auto_7341 )
      ( MAKE-1CRATE-VERIFY ?auto_7338 ?auto_7339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7342 - SURFACE
      ?auto_7343 - SURFACE
    )
    :vars
    (
      ?auto_7344 - HOIST
      ?auto_7345 - PLACE
      ?auto_7346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7344 ?auto_7345 ) ( SURFACE-AT ?auto_7342 ?auto_7345 ) ( CLEAR ?auto_7342 ) ( IS-CRATE ?auto_7343 ) ( not ( = ?auto_7342 ?auto_7343 ) ) ( TRUCK-AT ?auto_7346 ?auto_7345 ) ( AVAILABLE ?auto_7344 ) ( IN ?auto_7343 ?auto_7346 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7344 ?auto_7343 ?auto_7346 ?auto_7345 )
      ( MAKE-1CRATE ?auto_7342 ?auto_7343 )
      ( MAKE-1CRATE-VERIFY ?auto_7342 ?auto_7343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7347 - SURFACE
      ?auto_7348 - SURFACE
    )
    :vars
    (
      ?auto_7351 - HOIST
      ?auto_7349 - PLACE
      ?auto_7350 - TRUCK
      ?auto_7352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7351 ?auto_7349 ) ( SURFACE-AT ?auto_7347 ?auto_7349 ) ( CLEAR ?auto_7347 ) ( IS-CRATE ?auto_7348 ) ( not ( = ?auto_7347 ?auto_7348 ) ) ( AVAILABLE ?auto_7351 ) ( IN ?auto_7348 ?auto_7350 ) ( TRUCK-AT ?auto_7350 ?auto_7352 ) ( not ( = ?auto_7352 ?auto_7349 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7350 ?auto_7352 ?auto_7349 )
      ( MAKE-1CRATE ?auto_7347 ?auto_7348 )
      ( MAKE-1CRATE-VERIFY ?auto_7347 ?auto_7348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7353 - SURFACE
      ?auto_7354 - SURFACE
    )
    :vars
    (
      ?auto_7358 - HOIST
      ?auto_7357 - PLACE
      ?auto_7355 - TRUCK
      ?auto_7356 - PLACE
      ?auto_7359 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7358 ?auto_7357 ) ( SURFACE-AT ?auto_7353 ?auto_7357 ) ( CLEAR ?auto_7353 ) ( IS-CRATE ?auto_7354 ) ( not ( = ?auto_7353 ?auto_7354 ) ) ( AVAILABLE ?auto_7358 ) ( TRUCK-AT ?auto_7355 ?auto_7356 ) ( not ( = ?auto_7356 ?auto_7357 ) ) ( HOIST-AT ?auto_7359 ?auto_7356 ) ( LIFTING ?auto_7359 ?auto_7354 ) ( not ( = ?auto_7358 ?auto_7359 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7359 ?auto_7354 ?auto_7355 ?auto_7356 )
      ( MAKE-1CRATE ?auto_7353 ?auto_7354 )
      ( MAKE-1CRATE-VERIFY ?auto_7353 ?auto_7354 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7360 - SURFACE
      ?auto_7361 - SURFACE
    )
    :vars
    (
      ?auto_7362 - HOIST
      ?auto_7364 - PLACE
      ?auto_7363 - TRUCK
      ?auto_7366 - PLACE
      ?auto_7365 - HOIST
      ?auto_7367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7362 ?auto_7364 ) ( SURFACE-AT ?auto_7360 ?auto_7364 ) ( CLEAR ?auto_7360 ) ( IS-CRATE ?auto_7361 ) ( not ( = ?auto_7360 ?auto_7361 ) ) ( AVAILABLE ?auto_7362 ) ( TRUCK-AT ?auto_7363 ?auto_7366 ) ( not ( = ?auto_7366 ?auto_7364 ) ) ( HOIST-AT ?auto_7365 ?auto_7366 ) ( not ( = ?auto_7362 ?auto_7365 ) ) ( AVAILABLE ?auto_7365 ) ( SURFACE-AT ?auto_7361 ?auto_7366 ) ( ON ?auto_7361 ?auto_7367 ) ( CLEAR ?auto_7361 ) ( not ( = ?auto_7360 ?auto_7367 ) ) ( not ( = ?auto_7361 ?auto_7367 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7365 ?auto_7361 ?auto_7367 ?auto_7366 )
      ( MAKE-1CRATE ?auto_7360 ?auto_7361 )
      ( MAKE-1CRATE-VERIFY ?auto_7360 ?auto_7361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7368 - SURFACE
      ?auto_7369 - SURFACE
    )
    :vars
    (
      ?auto_7373 - HOIST
      ?auto_7374 - PLACE
      ?auto_7370 - PLACE
      ?auto_7372 - HOIST
      ?auto_7371 - SURFACE
      ?auto_7375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7373 ?auto_7374 ) ( SURFACE-AT ?auto_7368 ?auto_7374 ) ( CLEAR ?auto_7368 ) ( IS-CRATE ?auto_7369 ) ( not ( = ?auto_7368 ?auto_7369 ) ) ( AVAILABLE ?auto_7373 ) ( not ( = ?auto_7370 ?auto_7374 ) ) ( HOIST-AT ?auto_7372 ?auto_7370 ) ( not ( = ?auto_7373 ?auto_7372 ) ) ( AVAILABLE ?auto_7372 ) ( SURFACE-AT ?auto_7369 ?auto_7370 ) ( ON ?auto_7369 ?auto_7371 ) ( CLEAR ?auto_7369 ) ( not ( = ?auto_7368 ?auto_7371 ) ) ( not ( = ?auto_7369 ?auto_7371 ) ) ( TRUCK-AT ?auto_7375 ?auto_7374 ) )
    :subtasks
    ( ( !DRIVE ?auto_7375 ?auto_7374 ?auto_7370 )
      ( MAKE-1CRATE ?auto_7368 ?auto_7369 )
      ( MAKE-1CRATE-VERIFY ?auto_7368 ?auto_7369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7381 - SURFACE
      ?auto_7382 - SURFACE
    )
    :vars
    (
      ?auto_7383 - HOIST
      ?auto_7384 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7383 ?auto_7384 ) ( SURFACE-AT ?auto_7381 ?auto_7384 ) ( CLEAR ?auto_7381 ) ( LIFTING ?auto_7383 ?auto_7382 ) ( IS-CRATE ?auto_7382 ) ( not ( = ?auto_7381 ?auto_7382 ) ) )
    :subtasks
    ( ( !DROP ?auto_7383 ?auto_7382 ?auto_7381 ?auto_7384 )
      ( MAKE-1CRATE-VERIFY ?auto_7381 ?auto_7382 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7385 - SURFACE
      ?auto_7386 - SURFACE
      ?auto_7387 - SURFACE
    )
    :vars
    (
      ?auto_7389 - HOIST
      ?auto_7388 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7389 ?auto_7388 ) ( SURFACE-AT ?auto_7386 ?auto_7388 ) ( CLEAR ?auto_7386 ) ( LIFTING ?auto_7389 ?auto_7387 ) ( IS-CRATE ?auto_7387 ) ( not ( = ?auto_7386 ?auto_7387 ) ) ( ON ?auto_7386 ?auto_7385 ) ( not ( = ?auto_7385 ?auto_7386 ) ) ( not ( = ?auto_7385 ?auto_7387 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7386 ?auto_7387 )
      ( MAKE-2CRATE-VERIFY ?auto_7385 ?auto_7386 ?auto_7387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7390 - SURFACE
      ?auto_7391 - SURFACE
    )
    :vars
    (
      ?auto_7393 - HOIST
      ?auto_7392 - PLACE
      ?auto_7394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7393 ?auto_7392 ) ( SURFACE-AT ?auto_7390 ?auto_7392 ) ( CLEAR ?auto_7390 ) ( IS-CRATE ?auto_7391 ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( TRUCK-AT ?auto_7394 ?auto_7392 ) ( AVAILABLE ?auto_7393 ) ( IN ?auto_7391 ?auto_7394 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7393 ?auto_7391 ?auto_7394 ?auto_7392 )
      ( MAKE-1CRATE ?auto_7390 ?auto_7391 )
      ( MAKE-1CRATE-VERIFY ?auto_7390 ?auto_7391 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7395 - SURFACE
      ?auto_7396 - SURFACE
      ?auto_7397 - SURFACE
    )
    :vars
    (
      ?auto_7399 - HOIST
      ?auto_7400 - PLACE
      ?auto_7398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7399 ?auto_7400 ) ( SURFACE-AT ?auto_7396 ?auto_7400 ) ( CLEAR ?auto_7396 ) ( IS-CRATE ?auto_7397 ) ( not ( = ?auto_7396 ?auto_7397 ) ) ( TRUCK-AT ?auto_7398 ?auto_7400 ) ( AVAILABLE ?auto_7399 ) ( IN ?auto_7397 ?auto_7398 ) ( ON ?auto_7396 ?auto_7395 ) ( not ( = ?auto_7395 ?auto_7396 ) ) ( not ( = ?auto_7395 ?auto_7397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7396 ?auto_7397 )
      ( MAKE-2CRATE-VERIFY ?auto_7395 ?auto_7396 ?auto_7397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7401 - SURFACE
      ?auto_7402 - SURFACE
    )
    :vars
    (
      ?auto_7403 - HOIST
      ?auto_7404 - PLACE
      ?auto_7405 - TRUCK
      ?auto_7406 - SURFACE
      ?auto_7407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7403 ?auto_7404 ) ( SURFACE-AT ?auto_7401 ?auto_7404 ) ( CLEAR ?auto_7401 ) ( IS-CRATE ?auto_7402 ) ( not ( = ?auto_7401 ?auto_7402 ) ) ( AVAILABLE ?auto_7403 ) ( IN ?auto_7402 ?auto_7405 ) ( ON ?auto_7401 ?auto_7406 ) ( not ( = ?auto_7406 ?auto_7401 ) ) ( not ( = ?auto_7406 ?auto_7402 ) ) ( TRUCK-AT ?auto_7405 ?auto_7407 ) ( not ( = ?auto_7407 ?auto_7404 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7405 ?auto_7407 ?auto_7404 )
      ( MAKE-2CRATE ?auto_7406 ?auto_7401 ?auto_7402 )
      ( MAKE-1CRATE-VERIFY ?auto_7401 ?auto_7402 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7408 - SURFACE
      ?auto_7409 - SURFACE
      ?auto_7410 - SURFACE
    )
    :vars
    (
      ?auto_7413 - HOIST
      ?auto_7411 - PLACE
      ?auto_7412 - TRUCK
      ?auto_7414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7413 ?auto_7411 ) ( SURFACE-AT ?auto_7409 ?auto_7411 ) ( CLEAR ?auto_7409 ) ( IS-CRATE ?auto_7410 ) ( not ( = ?auto_7409 ?auto_7410 ) ) ( AVAILABLE ?auto_7413 ) ( IN ?auto_7410 ?auto_7412 ) ( ON ?auto_7409 ?auto_7408 ) ( not ( = ?auto_7408 ?auto_7409 ) ) ( not ( = ?auto_7408 ?auto_7410 ) ) ( TRUCK-AT ?auto_7412 ?auto_7414 ) ( not ( = ?auto_7414 ?auto_7411 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7409 ?auto_7410 )
      ( MAKE-2CRATE-VERIFY ?auto_7408 ?auto_7409 ?auto_7410 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7415 - SURFACE
      ?auto_7416 - SURFACE
    )
    :vars
    (
      ?auto_7418 - HOIST
      ?auto_7420 - PLACE
      ?auto_7417 - SURFACE
      ?auto_7421 - TRUCK
      ?auto_7419 - PLACE
      ?auto_7422 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7418 ?auto_7420 ) ( SURFACE-AT ?auto_7415 ?auto_7420 ) ( CLEAR ?auto_7415 ) ( IS-CRATE ?auto_7416 ) ( not ( = ?auto_7415 ?auto_7416 ) ) ( AVAILABLE ?auto_7418 ) ( ON ?auto_7415 ?auto_7417 ) ( not ( = ?auto_7417 ?auto_7415 ) ) ( not ( = ?auto_7417 ?auto_7416 ) ) ( TRUCK-AT ?auto_7421 ?auto_7419 ) ( not ( = ?auto_7419 ?auto_7420 ) ) ( HOIST-AT ?auto_7422 ?auto_7419 ) ( LIFTING ?auto_7422 ?auto_7416 ) ( not ( = ?auto_7418 ?auto_7422 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7422 ?auto_7416 ?auto_7421 ?auto_7419 )
      ( MAKE-2CRATE ?auto_7417 ?auto_7415 ?auto_7416 )
      ( MAKE-1CRATE-VERIFY ?auto_7415 ?auto_7416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7423 - SURFACE
      ?auto_7424 - SURFACE
      ?auto_7425 - SURFACE
    )
    :vars
    (
      ?auto_7426 - HOIST
      ?auto_7430 - PLACE
      ?auto_7429 - TRUCK
      ?auto_7428 - PLACE
      ?auto_7427 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7426 ?auto_7430 ) ( SURFACE-AT ?auto_7424 ?auto_7430 ) ( CLEAR ?auto_7424 ) ( IS-CRATE ?auto_7425 ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( AVAILABLE ?auto_7426 ) ( ON ?auto_7424 ?auto_7423 ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( TRUCK-AT ?auto_7429 ?auto_7428 ) ( not ( = ?auto_7428 ?auto_7430 ) ) ( HOIST-AT ?auto_7427 ?auto_7428 ) ( LIFTING ?auto_7427 ?auto_7425 ) ( not ( = ?auto_7426 ?auto_7427 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7424 ?auto_7425 )
      ( MAKE-2CRATE-VERIFY ?auto_7423 ?auto_7424 ?auto_7425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7431 - SURFACE
      ?auto_7432 - SURFACE
    )
    :vars
    (
      ?auto_7436 - HOIST
      ?auto_7433 - PLACE
      ?auto_7434 - SURFACE
      ?auto_7437 - TRUCK
      ?auto_7438 - PLACE
      ?auto_7435 - HOIST
      ?auto_7439 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7436 ?auto_7433 ) ( SURFACE-AT ?auto_7431 ?auto_7433 ) ( CLEAR ?auto_7431 ) ( IS-CRATE ?auto_7432 ) ( not ( = ?auto_7431 ?auto_7432 ) ) ( AVAILABLE ?auto_7436 ) ( ON ?auto_7431 ?auto_7434 ) ( not ( = ?auto_7434 ?auto_7431 ) ) ( not ( = ?auto_7434 ?auto_7432 ) ) ( TRUCK-AT ?auto_7437 ?auto_7438 ) ( not ( = ?auto_7438 ?auto_7433 ) ) ( HOIST-AT ?auto_7435 ?auto_7438 ) ( not ( = ?auto_7436 ?auto_7435 ) ) ( AVAILABLE ?auto_7435 ) ( SURFACE-AT ?auto_7432 ?auto_7438 ) ( ON ?auto_7432 ?auto_7439 ) ( CLEAR ?auto_7432 ) ( not ( = ?auto_7431 ?auto_7439 ) ) ( not ( = ?auto_7432 ?auto_7439 ) ) ( not ( = ?auto_7434 ?auto_7439 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7435 ?auto_7432 ?auto_7439 ?auto_7438 )
      ( MAKE-2CRATE ?auto_7434 ?auto_7431 ?auto_7432 )
      ( MAKE-1CRATE-VERIFY ?auto_7431 ?auto_7432 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7440 - SURFACE
      ?auto_7441 - SURFACE
      ?auto_7442 - SURFACE
    )
    :vars
    (
      ?auto_7446 - HOIST
      ?auto_7444 - PLACE
      ?auto_7447 - TRUCK
      ?auto_7445 - PLACE
      ?auto_7443 - HOIST
      ?auto_7448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7446 ?auto_7444 ) ( SURFACE-AT ?auto_7441 ?auto_7444 ) ( CLEAR ?auto_7441 ) ( IS-CRATE ?auto_7442 ) ( not ( = ?auto_7441 ?auto_7442 ) ) ( AVAILABLE ?auto_7446 ) ( ON ?auto_7441 ?auto_7440 ) ( not ( = ?auto_7440 ?auto_7441 ) ) ( not ( = ?auto_7440 ?auto_7442 ) ) ( TRUCK-AT ?auto_7447 ?auto_7445 ) ( not ( = ?auto_7445 ?auto_7444 ) ) ( HOIST-AT ?auto_7443 ?auto_7445 ) ( not ( = ?auto_7446 ?auto_7443 ) ) ( AVAILABLE ?auto_7443 ) ( SURFACE-AT ?auto_7442 ?auto_7445 ) ( ON ?auto_7442 ?auto_7448 ) ( CLEAR ?auto_7442 ) ( not ( = ?auto_7441 ?auto_7448 ) ) ( not ( = ?auto_7442 ?auto_7448 ) ) ( not ( = ?auto_7440 ?auto_7448 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7441 ?auto_7442 )
      ( MAKE-2CRATE-VERIFY ?auto_7440 ?auto_7441 ?auto_7442 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7449 - SURFACE
      ?auto_7450 - SURFACE
    )
    :vars
    (
      ?auto_7457 - HOIST
      ?auto_7453 - PLACE
      ?auto_7454 - SURFACE
      ?auto_7451 - PLACE
      ?auto_7455 - HOIST
      ?auto_7452 - SURFACE
      ?auto_7456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7457 ?auto_7453 ) ( SURFACE-AT ?auto_7449 ?auto_7453 ) ( CLEAR ?auto_7449 ) ( IS-CRATE ?auto_7450 ) ( not ( = ?auto_7449 ?auto_7450 ) ) ( AVAILABLE ?auto_7457 ) ( ON ?auto_7449 ?auto_7454 ) ( not ( = ?auto_7454 ?auto_7449 ) ) ( not ( = ?auto_7454 ?auto_7450 ) ) ( not ( = ?auto_7451 ?auto_7453 ) ) ( HOIST-AT ?auto_7455 ?auto_7451 ) ( not ( = ?auto_7457 ?auto_7455 ) ) ( AVAILABLE ?auto_7455 ) ( SURFACE-AT ?auto_7450 ?auto_7451 ) ( ON ?auto_7450 ?auto_7452 ) ( CLEAR ?auto_7450 ) ( not ( = ?auto_7449 ?auto_7452 ) ) ( not ( = ?auto_7450 ?auto_7452 ) ) ( not ( = ?auto_7454 ?auto_7452 ) ) ( TRUCK-AT ?auto_7456 ?auto_7453 ) )
    :subtasks
    ( ( !DRIVE ?auto_7456 ?auto_7453 ?auto_7451 )
      ( MAKE-2CRATE ?auto_7454 ?auto_7449 ?auto_7450 )
      ( MAKE-1CRATE-VERIFY ?auto_7449 ?auto_7450 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7458 - SURFACE
      ?auto_7459 - SURFACE
      ?auto_7460 - SURFACE
    )
    :vars
    (
      ?auto_7462 - HOIST
      ?auto_7464 - PLACE
      ?auto_7466 - PLACE
      ?auto_7465 - HOIST
      ?auto_7463 - SURFACE
      ?auto_7461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7462 ?auto_7464 ) ( SURFACE-AT ?auto_7459 ?auto_7464 ) ( CLEAR ?auto_7459 ) ( IS-CRATE ?auto_7460 ) ( not ( = ?auto_7459 ?auto_7460 ) ) ( AVAILABLE ?auto_7462 ) ( ON ?auto_7459 ?auto_7458 ) ( not ( = ?auto_7458 ?auto_7459 ) ) ( not ( = ?auto_7458 ?auto_7460 ) ) ( not ( = ?auto_7466 ?auto_7464 ) ) ( HOIST-AT ?auto_7465 ?auto_7466 ) ( not ( = ?auto_7462 ?auto_7465 ) ) ( AVAILABLE ?auto_7465 ) ( SURFACE-AT ?auto_7460 ?auto_7466 ) ( ON ?auto_7460 ?auto_7463 ) ( CLEAR ?auto_7460 ) ( not ( = ?auto_7459 ?auto_7463 ) ) ( not ( = ?auto_7460 ?auto_7463 ) ) ( not ( = ?auto_7458 ?auto_7463 ) ) ( TRUCK-AT ?auto_7461 ?auto_7464 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7459 ?auto_7460 )
      ( MAKE-2CRATE-VERIFY ?auto_7458 ?auto_7459 ?auto_7460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7467 - SURFACE
      ?auto_7468 - SURFACE
    )
    :vars
    (
      ?auto_7475 - HOIST
      ?auto_7470 - PLACE
      ?auto_7469 - SURFACE
      ?auto_7472 - PLACE
      ?auto_7471 - HOIST
      ?auto_7474 - SURFACE
      ?auto_7473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7475 ?auto_7470 ) ( IS-CRATE ?auto_7468 ) ( not ( = ?auto_7467 ?auto_7468 ) ) ( not ( = ?auto_7469 ?auto_7467 ) ) ( not ( = ?auto_7469 ?auto_7468 ) ) ( not ( = ?auto_7472 ?auto_7470 ) ) ( HOIST-AT ?auto_7471 ?auto_7472 ) ( not ( = ?auto_7475 ?auto_7471 ) ) ( AVAILABLE ?auto_7471 ) ( SURFACE-AT ?auto_7468 ?auto_7472 ) ( ON ?auto_7468 ?auto_7474 ) ( CLEAR ?auto_7468 ) ( not ( = ?auto_7467 ?auto_7474 ) ) ( not ( = ?auto_7468 ?auto_7474 ) ) ( not ( = ?auto_7469 ?auto_7474 ) ) ( TRUCK-AT ?auto_7473 ?auto_7470 ) ( SURFACE-AT ?auto_7469 ?auto_7470 ) ( CLEAR ?auto_7469 ) ( LIFTING ?auto_7475 ?auto_7467 ) ( IS-CRATE ?auto_7467 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7469 ?auto_7467 )
      ( MAKE-2CRATE ?auto_7469 ?auto_7467 ?auto_7468 )
      ( MAKE-1CRATE-VERIFY ?auto_7467 ?auto_7468 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7476 - SURFACE
      ?auto_7477 - SURFACE
      ?auto_7478 - SURFACE
    )
    :vars
    (
      ?auto_7483 - HOIST
      ?auto_7479 - PLACE
      ?auto_7481 - PLACE
      ?auto_7482 - HOIST
      ?auto_7484 - SURFACE
      ?auto_7480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7483 ?auto_7479 ) ( IS-CRATE ?auto_7478 ) ( not ( = ?auto_7477 ?auto_7478 ) ) ( not ( = ?auto_7476 ?auto_7477 ) ) ( not ( = ?auto_7476 ?auto_7478 ) ) ( not ( = ?auto_7481 ?auto_7479 ) ) ( HOIST-AT ?auto_7482 ?auto_7481 ) ( not ( = ?auto_7483 ?auto_7482 ) ) ( AVAILABLE ?auto_7482 ) ( SURFACE-AT ?auto_7478 ?auto_7481 ) ( ON ?auto_7478 ?auto_7484 ) ( CLEAR ?auto_7478 ) ( not ( = ?auto_7477 ?auto_7484 ) ) ( not ( = ?auto_7478 ?auto_7484 ) ) ( not ( = ?auto_7476 ?auto_7484 ) ) ( TRUCK-AT ?auto_7480 ?auto_7479 ) ( SURFACE-AT ?auto_7476 ?auto_7479 ) ( CLEAR ?auto_7476 ) ( LIFTING ?auto_7483 ?auto_7477 ) ( IS-CRATE ?auto_7477 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7477 ?auto_7478 )
      ( MAKE-2CRATE-VERIFY ?auto_7476 ?auto_7477 ?auto_7478 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7485 - SURFACE
      ?auto_7486 - SURFACE
    )
    :vars
    (
      ?auto_7487 - HOIST
      ?auto_7492 - PLACE
      ?auto_7490 - SURFACE
      ?auto_7493 - PLACE
      ?auto_7489 - HOIST
      ?auto_7488 - SURFACE
      ?auto_7491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7487 ?auto_7492 ) ( IS-CRATE ?auto_7486 ) ( not ( = ?auto_7485 ?auto_7486 ) ) ( not ( = ?auto_7490 ?auto_7485 ) ) ( not ( = ?auto_7490 ?auto_7486 ) ) ( not ( = ?auto_7493 ?auto_7492 ) ) ( HOIST-AT ?auto_7489 ?auto_7493 ) ( not ( = ?auto_7487 ?auto_7489 ) ) ( AVAILABLE ?auto_7489 ) ( SURFACE-AT ?auto_7486 ?auto_7493 ) ( ON ?auto_7486 ?auto_7488 ) ( CLEAR ?auto_7486 ) ( not ( = ?auto_7485 ?auto_7488 ) ) ( not ( = ?auto_7486 ?auto_7488 ) ) ( not ( = ?auto_7490 ?auto_7488 ) ) ( TRUCK-AT ?auto_7491 ?auto_7492 ) ( SURFACE-AT ?auto_7490 ?auto_7492 ) ( CLEAR ?auto_7490 ) ( IS-CRATE ?auto_7485 ) ( AVAILABLE ?auto_7487 ) ( IN ?auto_7485 ?auto_7491 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7487 ?auto_7485 ?auto_7491 ?auto_7492 )
      ( MAKE-2CRATE ?auto_7490 ?auto_7485 ?auto_7486 )
      ( MAKE-1CRATE-VERIFY ?auto_7485 ?auto_7486 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7494 - SURFACE
      ?auto_7495 - SURFACE
      ?auto_7496 - SURFACE
    )
    :vars
    (
      ?auto_7501 - HOIST
      ?auto_7497 - PLACE
      ?auto_7499 - PLACE
      ?auto_7502 - HOIST
      ?auto_7498 - SURFACE
      ?auto_7500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7501 ?auto_7497 ) ( IS-CRATE ?auto_7496 ) ( not ( = ?auto_7495 ?auto_7496 ) ) ( not ( = ?auto_7494 ?auto_7495 ) ) ( not ( = ?auto_7494 ?auto_7496 ) ) ( not ( = ?auto_7499 ?auto_7497 ) ) ( HOIST-AT ?auto_7502 ?auto_7499 ) ( not ( = ?auto_7501 ?auto_7502 ) ) ( AVAILABLE ?auto_7502 ) ( SURFACE-AT ?auto_7496 ?auto_7499 ) ( ON ?auto_7496 ?auto_7498 ) ( CLEAR ?auto_7496 ) ( not ( = ?auto_7495 ?auto_7498 ) ) ( not ( = ?auto_7496 ?auto_7498 ) ) ( not ( = ?auto_7494 ?auto_7498 ) ) ( TRUCK-AT ?auto_7500 ?auto_7497 ) ( SURFACE-AT ?auto_7494 ?auto_7497 ) ( CLEAR ?auto_7494 ) ( IS-CRATE ?auto_7495 ) ( AVAILABLE ?auto_7501 ) ( IN ?auto_7495 ?auto_7500 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7495 ?auto_7496 )
      ( MAKE-2CRATE-VERIFY ?auto_7494 ?auto_7495 ?auto_7496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7503 - SURFACE
      ?auto_7504 - SURFACE
    )
    :vars
    (
      ?auto_7511 - HOIST
      ?auto_7510 - PLACE
      ?auto_7507 - SURFACE
      ?auto_7508 - PLACE
      ?auto_7506 - HOIST
      ?auto_7505 - SURFACE
      ?auto_7509 - TRUCK
      ?auto_7512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7511 ?auto_7510 ) ( IS-CRATE ?auto_7504 ) ( not ( = ?auto_7503 ?auto_7504 ) ) ( not ( = ?auto_7507 ?auto_7503 ) ) ( not ( = ?auto_7507 ?auto_7504 ) ) ( not ( = ?auto_7508 ?auto_7510 ) ) ( HOIST-AT ?auto_7506 ?auto_7508 ) ( not ( = ?auto_7511 ?auto_7506 ) ) ( AVAILABLE ?auto_7506 ) ( SURFACE-AT ?auto_7504 ?auto_7508 ) ( ON ?auto_7504 ?auto_7505 ) ( CLEAR ?auto_7504 ) ( not ( = ?auto_7503 ?auto_7505 ) ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( not ( = ?auto_7507 ?auto_7505 ) ) ( SURFACE-AT ?auto_7507 ?auto_7510 ) ( CLEAR ?auto_7507 ) ( IS-CRATE ?auto_7503 ) ( AVAILABLE ?auto_7511 ) ( IN ?auto_7503 ?auto_7509 ) ( TRUCK-AT ?auto_7509 ?auto_7512 ) ( not ( = ?auto_7512 ?auto_7510 ) ) ( not ( = ?auto_7508 ?auto_7512 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7509 ?auto_7512 ?auto_7510 )
      ( MAKE-2CRATE ?auto_7507 ?auto_7503 ?auto_7504 )
      ( MAKE-1CRATE-VERIFY ?auto_7503 ?auto_7504 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7513 - SURFACE
      ?auto_7514 - SURFACE
      ?auto_7515 - SURFACE
    )
    :vars
    (
      ?auto_7522 - HOIST
      ?auto_7516 - PLACE
      ?auto_7520 - PLACE
      ?auto_7518 - HOIST
      ?auto_7519 - SURFACE
      ?auto_7521 - TRUCK
      ?auto_7517 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7522 ?auto_7516 ) ( IS-CRATE ?auto_7515 ) ( not ( = ?auto_7514 ?auto_7515 ) ) ( not ( = ?auto_7513 ?auto_7514 ) ) ( not ( = ?auto_7513 ?auto_7515 ) ) ( not ( = ?auto_7520 ?auto_7516 ) ) ( HOIST-AT ?auto_7518 ?auto_7520 ) ( not ( = ?auto_7522 ?auto_7518 ) ) ( AVAILABLE ?auto_7518 ) ( SURFACE-AT ?auto_7515 ?auto_7520 ) ( ON ?auto_7515 ?auto_7519 ) ( CLEAR ?auto_7515 ) ( not ( = ?auto_7514 ?auto_7519 ) ) ( not ( = ?auto_7515 ?auto_7519 ) ) ( not ( = ?auto_7513 ?auto_7519 ) ) ( SURFACE-AT ?auto_7513 ?auto_7516 ) ( CLEAR ?auto_7513 ) ( IS-CRATE ?auto_7514 ) ( AVAILABLE ?auto_7522 ) ( IN ?auto_7514 ?auto_7521 ) ( TRUCK-AT ?auto_7521 ?auto_7517 ) ( not ( = ?auto_7517 ?auto_7516 ) ) ( not ( = ?auto_7520 ?auto_7517 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7514 ?auto_7515 )
      ( MAKE-2CRATE-VERIFY ?auto_7513 ?auto_7514 ?auto_7515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7523 - SURFACE
      ?auto_7524 - SURFACE
    )
    :vars
    (
      ?auto_7529 - HOIST
      ?auto_7531 - PLACE
      ?auto_7532 - SURFACE
      ?auto_7525 - PLACE
      ?auto_7527 - HOIST
      ?auto_7530 - SURFACE
      ?auto_7528 - TRUCK
      ?auto_7526 - PLACE
      ?auto_7533 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7529 ?auto_7531 ) ( IS-CRATE ?auto_7524 ) ( not ( = ?auto_7523 ?auto_7524 ) ) ( not ( = ?auto_7532 ?auto_7523 ) ) ( not ( = ?auto_7532 ?auto_7524 ) ) ( not ( = ?auto_7525 ?auto_7531 ) ) ( HOIST-AT ?auto_7527 ?auto_7525 ) ( not ( = ?auto_7529 ?auto_7527 ) ) ( AVAILABLE ?auto_7527 ) ( SURFACE-AT ?auto_7524 ?auto_7525 ) ( ON ?auto_7524 ?auto_7530 ) ( CLEAR ?auto_7524 ) ( not ( = ?auto_7523 ?auto_7530 ) ) ( not ( = ?auto_7524 ?auto_7530 ) ) ( not ( = ?auto_7532 ?auto_7530 ) ) ( SURFACE-AT ?auto_7532 ?auto_7531 ) ( CLEAR ?auto_7532 ) ( IS-CRATE ?auto_7523 ) ( AVAILABLE ?auto_7529 ) ( TRUCK-AT ?auto_7528 ?auto_7526 ) ( not ( = ?auto_7526 ?auto_7531 ) ) ( not ( = ?auto_7525 ?auto_7526 ) ) ( HOIST-AT ?auto_7533 ?auto_7526 ) ( LIFTING ?auto_7533 ?auto_7523 ) ( not ( = ?auto_7529 ?auto_7533 ) ) ( not ( = ?auto_7527 ?auto_7533 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7533 ?auto_7523 ?auto_7528 ?auto_7526 )
      ( MAKE-2CRATE ?auto_7532 ?auto_7523 ?auto_7524 )
      ( MAKE-1CRATE-VERIFY ?auto_7523 ?auto_7524 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7534 - SURFACE
      ?auto_7535 - SURFACE
      ?auto_7536 - SURFACE
    )
    :vars
    (
      ?auto_7543 - HOIST
      ?auto_7541 - PLACE
      ?auto_7539 - PLACE
      ?auto_7544 - HOIST
      ?auto_7537 - SURFACE
      ?auto_7538 - TRUCK
      ?auto_7542 - PLACE
      ?auto_7540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7543 ?auto_7541 ) ( IS-CRATE ?auto_7536 ) ( not ( = ?auto_7535 ?auto_7536 ) ) ( not ( = ?auto_7534 ?auto_7535 ) ) ( not ( = ?auto_7534 ?auto_7536 ) ) ( not ( = ?auto_7539 ?auto_7541 ) ) ( HOIST-AT ?auto_7544 ?auto_7539 ) ( not ( = ?auto_7543 ?auto_7544 ) ) ( AVAILABLE ?auto_7544 ) ( SURFACE-AT ?auto_7536 ?auto_7539 ) ( ON ?auto_7536 ?auto_7537 ) ( CLEAR ?auto_7536 ) ( not ( = ?auto_7535 ?auto_7537 ) ) ( not ( = ?auto_7536 ?auto_7537 ) ) ( not ( = ?auto_7534 ?auto_7537 ) ) ( SURFACE-AT ?auto_7534 ?auto_7541 ) ( CLEAR ?auto_7534 ) ( IS-CRATE ?auto_7535 ) ( AVAILABLE ?auto_7543 ) ( TRUCK-AT ?auto_7538 ?auto_7542 ) ( not ( = ?auto_7542 ?auto_7541 ) ) ( not ( = ?auto_7539 ?auto_7542 ) ) ( HOIST-AT ?auto_7540 ?auto_7542 ) ( LIFTING ?auto_7540 ?auto_7535 ) ( not ( = ?auto_7543 ?auto_7540 ) ) ( not ( = ?auto_7544 ?auto_7540 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7535 ?auto_7536 )
      ( MAKE-2CRATE-VERIFY ?auto_7534 ?auto_7535 ?auto_7536 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7545 - SURFACE
      ?auto_7546 - SURFACE
    )
    :vars
    (
      ?auto_7547 - HOIST
      ?auto_7550 - PLACE
      ?auto_7548 - SURFACE
      ?auto_7555 - PLACE
      ?auto_7549 - HOIST
      ?auto_7554 - SURFACE
      ?auto_7553 - TRUCK
      ?auto_7551 - PLACE
      ?auto_7552 - HOIST
      ?auto_7556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7547 ?auto_7550 ) ( IS-CRATE ?auto_7546 ) ( not ( = ?auto_7545 ?auto_7546 ) ) ( not ( = ?auto_7548 ?auto_7545 ) ) ( not ( = ?auto_7548 ?auto_7546 ) ) ( not ( = ?auto_7555 ?auto_7550 ) ) ( HOIST-AT ?auto_7549 ?auto_7555 ) ( not ( = ?auto_7547 ?auto_7549 ) ) ( AVAILABLE ?auto_7549 ) ( SURFACE-AT ?auto_7546 ?auto_7555 ) ( ON ?auto_7546 ?auto_7554 ) ( CLEAR ?auto_7546 ) ( not ( = ?auto_7545 ?auto_7554 ) ) ( not ( = ?auto_7546 ?auto_7554 ) ) ( not ( = ?auto_7548 ?auto_7554 ) ) ( SURFACE-AT ?auto_7548 ?auto_7550 ) ( CLEAR ?auto_7548 ) ( IS-CRATE ?auto_7545 ) ( AVAILABLE ?auto_7547 ) ( TRUCK-AT ?auto_7553 ?auto_7551 ) ( not ( = ?auto_7551 ?auto_7550 ) ) ( not ( = ?auto_7555 ?auto_7551 ) ) ( HOIST-AT ?auto_7552 ?auto_7551 ) ( not ( = ?auto_7547 ?auto_7552 ) ) ( not ( = ?auto_7549 ?auto_7552 ) ) ( AVAILABLE ?auto_7552 ) ( SURFACE-AT ?auto_7545 ?auto_7551 ) ( ON ?auto_7545 ?auto_7556 ) ( CLEAR ?auto_7545 ) ( not ( = ?auto_7545 ?auto_7556 ) ) ( not ( = ?auto_7546 ?auto_7556 ) ) ( not ( = ?auto_7548 ?auto_7556 ) ) ( not ( = ?auto_7554 ?auto_7556 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7552 ?auto_7545 ?auto_7556 ?auto_7551 )
      ( MAKE-2CRATE ?auto_7548 ?auto_7545 ?auto_7546 )
      ( MAKE-1CRATE-VERIFY ?auto_7545 ?auto_7546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7557 - SURFACE
      ?auto_7558 - SURFACE
      ?auto_7559 - SURFACE
    )
    :vars
    (
      ?auto_7566 - HOIST
      ?auto_7561 - PLACE
      ?auto_7567 - PLACE
      ?auto_7565 - HOIST
      ?auto_7562 - SURFACE
      ?auto_7560 - TRUCK
      ?auto_7563 - PLACE
      ?auto_7568 - HOIST
      ?auto_7564 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7566 ?auto_7561 ) ( IS-CRATE ?auto_7559 ) ( not ( = ?auto_7558 ?auto_7559 ) ) ( not ( = ?auto_7557 ?auto_7558 ) ) ( not ( = ?auto_7557 ?auto_7559 ) ) ( not ( = ?auto_7567 ?auto_7561 ) ) ( HOIST-AT ?auto_7565 ?auto_7567 ) ( not ( = ?auto_7566 ?auto_7565 ) ) ( AVAILABLE ?auto_7565 ) ( SURFACE-AT ?auto_7559 ?auto_7567 ) ( ON ?auto_7559 ?auto_7562 ) ( CLEAR ?auto_7559 ) ( not ( = ?auto_7558 ?auto_7562 ) ) ( not ( = ?auto_7559 ?auto_7562 ) ) ( not ( = ?auto_7557 ?auto_7562 ) ) ( SURFACE-AT ?auto_7557 ?auto_7561 ) ( CLEAR ?auto_7557 ) ( IS-CRATE ?auto_7558 ) ( AVAILABLE ?auto_7566 ) ( TRUCK-AT ?auto_7560 ?auto_7563 ) ( not ( = ?auto_7563 ?auto_7561 ) ) ( not ( = ?auto_7567 ?auto_7563 ) ) ( HOIST-AT ?auto_7568 ?auto_7563 ) ( not ( = ?auto_7566 ?auto_7568 ) ) ( not ( = ?auto_7565 ?auto_7568 ) ) ( AVAILABLE ?auto_7568 ) ( SURFACE-AT ?auto_7558 ?auto_7563 ) ( ON ?auto_7558 ?auto_7564 ) ( CLEAR ?auto_7558 ) ( not ( = ?auto_7558 ?auto_7564 ) ) ( not ( = ?auto_7559 ?auto_7564 ) ) ( not ( = ?auto_7557 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7558 ?auto_7559 )
      ( MAKE-2CRATE-VERIFY ?auto_7557 ?auto_7558 ?auto_7559 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7569 - SURFACE
      ?auto_7570 - SURFACE
    )
    :vars
    (
      ?auto_7575 - HOIST
      ?auto_7576 - PLACE
      ?auto_7574 - SURFACE
      ?auto_7580 - PLACE
      ?auto_7572 - HOIST
      ?auto_7577 - SURFACE
      ?auto_7579 - PLACE
      ?auto_7571 - HOIST
      ?auto_7573 - SURFACE
      ?auto_7578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7575 ?auto_7576 ) ( IS-CRATE ?auto_7570 ) ( not ( = ?auto_7569 ?auto_7570 ) ) ( not ( = ?auto_7574 ?auto_7569 ) ) ( not ( = ?auto_7574 ?auto_7570 ) ) ( not ( = ?auto_7580 ?auto_7576 ) ) ( HOIST-AT ?auto_7572 ?auto_7580 ) ( not ( = ?auto_7575 ?auto_7572 ) ) ( AVAILABLE ?auto_7572 ) ( SURFACE-AT ?auto_7570 ?auto_7580 ) ( ON ?auto_7570 ?auto_7577 ) ( CLEAR ?auto_7570 ) ( not ( = ?auto_7569 ?auto_7577 ) ) ( not ( = ?auto_7570 ?auto_7577 ) ) ( not ( = ?auto_7574 ?auto_7577 ) ) ( SURFACE-AT ?auto_7574 ?auto_7576 ) ( CLEAR ?auto_7574 ) ( IS-CRATE ?auto_7569 ) ( AVAILABLE ?auto_7575 ) ( not ( = ?auto_7579 ?auto_7576 ) ) ( not ( = ?auto_7580 ?auto_7579 ) ) ( HOIST-AT ?auto_7571 ?auto_7579 ) ( not ( = ?auto_7575 ?auto_7571 ) ) ( not ( = ?auto_7572 ?auto_7571 ) ) ( AVAILABLE ?auto_7571 ) ( SURFACE-AT ?auto_7569 ?auto_7579 ) ( ON ?auto_7569 ?auto_7573 ) ( CLEAR ?auto_7569 ) ( not ( = ?auto_7569 ?auto_7573 ) ) ( not ( = ?auto_7570 ?auto_7573 ) ) ( not ( = ?auto_7574 ?auto_7573 ) ) ( not ( = ?auto_7577 ?auto_7573 ) ) ( TRUCK-AT ?auto_7578 ?auto_7576 ) )
    :subtasks
    ( ( !DRIVE ?auto_7578 ?auto_7576 ?auto_7579 )
      ( MAKE-2CRATE ?auto_7574 ?auto_7569 ?auto_7570 )
      ( MAKE-1CRATE-VERIFY ?auto_7569 ?auto_7570 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7581 - SURFACE
      ?auto_7582 - SURFACE
      ?auto_7583 - SURFACE
    )
    :vars
    (
      ?auto_7585 - HOIST
      ?auto_7584 - PLACE
      ?auto_7588 - PLACE
      ?auto_7586 - HOIST
      ?auto_7589 - SURFACE
      ?auto_7590 - PLACE
      ?auto_7591 - HOIST
      ?auto_7592 - SURFACE
      ?auto_7587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7585 ?auto_7584 ) ( IS-CRATE ?auto_7583 ) ( not ( = ?auto_7582 ?auto_7583 ) ) ( not ( = ?auto_7581 ?auto_7582 ) ) ( not ( = ?auto_7581 ?auto_7583 ) ) ( not ( = ?auto_7588 ?auto_7584 ) ) ( HOIST-AT ?auto_7586 ?auto_7588 ) ( not ( = ?auto_7585 ?auto_7586 ) ) ( AVAILABLE ?auto_7586 ) ( SURFACE-AT ?auto_7583 ?auto_7588 ) ( ON ?auto_7583 ?auto_7589 ) ( CLEAR ?auto_7583 ) ( not ( = ?auto_7582 ?auto_7589 ) ) ( not ( = ?auto_7583 ?auto_7589 ) ) ( not ( = ?auto_7581 ?auto_7589 ) ) ( SURFACE-AT ?auto_7581 ?auto_7584 ) ( CLEAR ?auto_7581 ) ( IS-CRATE ?auto_7582 ) ( AVAILABLE ?auto_7585 ) ( not ( = ?auto_7590 ?auto_7584 ) ) ( not ( = ?auto_7588 ?auto_7590 ) ) ( HOIST-AT ?auto_7591 ?auto_7590 ) ( not ( = ?auto_7585 ?auto_7591 ) ) ( not ( = ?auto_7586 ?auto_7591 ) ) ( AVAILABLE ?auto_7591 ) ( SURFACE-AT ?auto_7582 ?auto_7590 ) ( ON ?auto_7582 ?auto_7592 ) ( CLEAR ?auto_7582 ) ( not ( = ?auto_7582 ?auto_7592 ) ) ( not ( = ?auto_7583 ?auto_7592 ) ) ( not ( = ?auto_7581 ?auto_7592 ) ) ( not ( = ?auto_7589 ?auto_7592 ) ) ( TRUCK-AT ?auto_7587 ?auto_7584 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7582 ?auto_7583 )
      ( MAKE-2CRATE-VERIFY ?auto_7581 ?auto_7582 ?auto_7583 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7602 - SURFACE
      ?auto_7603 - SURFACE
    )
    :vars
    (
      ?auto_7604 - HOIST
      ?auto_7605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7604 ?auto_7605 ) ( SURFACE-AT ?auto_7602 ?auto_7605 ) ( CLEAR ?auto_7602 ) ( LIFTING ?auto_7604 ?auto_7603 ) ( IS-CRATE ?auto_7603 ) ( not ( = ?auto_7602 ?auto_7603 ) ) )
    :subtasks
    ( ( !DROP ?auto_7604 ?auto_7603 ?auto_7602 ?auto_7605 )
      ( MAKE-1CRATE-VERIFY ?auto_7602 ?auto_7603 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7606 - SURFACE
      ?auto_7607 - SURFACE
      ?auto_7608 - SURFACE
    )
    :vars
    (
      ?auto_7609 - HOIST
      ?auto_7610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7609 ?auto_7610 ) ( SURFACE-AT ?auto_7607 ?auto_7610 ) ( CLEAR ?auto_7607 ) ( LIFTING ?auto_7609 ?auto_7608 ) ( IS-CRATE ?auto_7608 ) ( not ( = ?auto_7607 ?auto_7608 ) ) ( ON ?auto_7607 ?auto_7606 ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7608 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7607 ?auto_7608 )
      ( MAKE-2CRATE-VERIFY ?auto_7606 ?auto_7607 ?auto_7608 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7611 - SURFACE
      ?auto_7612 - SURFACE
      ?auto_7613 - SURFACE
      ?auto_7614 - SURFACE
    )
    :vars
    (
      ?auto_7615 - HOIST
      ?auto_7616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7615 ?auto_7616 ) ( SURFACE-AT ?auto_7613 ?auto_7616 ) ( CLEAR ?auto_7613 ) ( LIFTING ?auto_7615 ?auto_7614 ) ( IS-CRATE ?auto_7614 ) ( not ( = ?auto_7613 ?auto_7614 ) ) ( ON ?auto_7612 ?auto_7611 ) ( ON ?auto_7613 ?auto_7612 ) ( not ( = ?auto_7611 ?auto_7612 ) ) ( not ( = ?auto_7611 ?auto_7613 ) ) ( not ( = ?auto_7611 ?auto_7614 ) ) ( not ( = ?auto_7612 ?auto_7613 ) ) ( not ( = ?auto_7612 ?auto_7614 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7613 ?auto_7614 )
      ( MAKE-3CRATE-VERIFY ?auto_7611 ?auto_7612 ?auto_7613 ?auto_7614 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7617 - SURFACE
      ?auto_7618 - SURFACE
    )
    :vars
    (
      ?auto_7619 - HOIST
      ?auto_7620 - PLACE
      ?auto_7621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7619 ?auto_7620 ) ( SURFACE-AT ?auto_7617 ?auto_7620 ) ( CLEAR ?auto_7617 ) ( IS-CRATE ?auto_7618 ) ( not ( = ?auto_7617 ?auto_7618 ) ) ( TRUCK-AT ?auto_7621 ?auto_7620 ) ( AVAILABLE ?auto_7619 ) ( IN ?auto_7618 ?auto_7621 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7619 ?auto_7618 ?auto_7621 ?auto_7620 )
      ( MAKE-1CRATE ?auto_7617 ?auto_7618 )
      ( MAKE-1CRATE-VERIFY ?auto_7617 ?auto_7618 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7622 - SURFACE
      ?auto_7623 - SURFACE
      ?auto_7624 - SURFACE
    )
    :vars
    (
      ?auto_7626 - HOIST
      ?auto_7625 - PLACE
      ?auto_7627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7626 ?auto_7625 ) ( SURFACE-AT ?auto_7623 ?auto_7625 ) ( CLEAR ?auto_7623 ) ( IS-CRATE ?auto_7624 ) ( not ( = ?auto_7623 ?auto_7624 ) ) ( TRUCK-AT ?auto_7627 ?auto_7625 ) ( AVAILABLE ?auto_7626 ) ( IN ?auto_7624 ?auto_7627 ) ( ON ?auto_7623 ?auto_7622 ) ( not ( = ?auto_7622 ?auto_7623 ) ) ( not ( = ?auto_7622 ?auto_7624 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7623 ?auto_7624 )
      ( MAKE-2CRATE-VERIFY ?auto_7622 ?auto_7623 ?auto_7624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7628 - SURFACE
      ?auto_7629 - SURFACE
      ?auto_7630 - SURFACE
      ?auto_7631 - SURFACE
    )
    :vars
    (
      ?auto_7634 - HOIST
      ?auto_7633 - PLACE
      ?auto_7632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7634 ?auto_7633 ) ( SURFACE-AT ?auto_7630 ?auto_7633 ) ( CLEAR ?auto_7630 ) ( IS-CRATE ?auto_7631 ) ( not ( = ?auto_7630 ?auto_7631 ) ) ( TRUCK-AT ?auto_7632 ?auto_7633 ) ( AVAILABLE ?auto_7634 ) ( IN ?auto_7631 ?auto_7632 ) ( ON ?auto_7630 ?auto_7629 ) ( not ( = ?auto_7629 ?auto_7630 ) ) ( not ( = ?auto_7629 ?auto_7631 ) ) ( ON ?auto_7629 ?auto_7628 ) ( not ( = ?auto_7628 ?auto_7629 ) ) ( not ( = ?auto_7628 ?auto_7630 ) ) ( not ( = ?auto_7628 ?auto_7631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7629 ?auto_7630 ?auto_7631 )
      ( MAKE-3CRATE-VERIFY ?auto_7628 ?auto_7629 ?auto_7630 ?auto_7631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7635 - SURFACE
      ?auto_7636 - SURFACE
    )
    :vars
    (
      ?auto_7640 - HOIST
      ?auto_7639 - PLACE
      ?auto_7637 - TRUCK
      ?auto_7638 - SURFACE
      ?auto_7641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7640 ?auto_7639 ) ( SURFACE-AT ?auto_7635 ?auto_7639 ) ( CLEAR ?auto_7635 ) ( IS-CRATE ?auto_7636 ) ( not ( = ?auto_7635 ?auto_7636 ) ) ( AVAILABLE ?auto_7640 ) ( IN ?auto_7636 ?auto_7637 ) ( ON ?auto_7635 ?auto_7638 ) ( not ( = ?auto_7638 ?auto_7635 ) ) ( not ( = ?auto_7638 ?auto_7636 ) ) ( TRUCK-AT ?auto_7637 ?auto_7641 ) ( not ( = ?auto_7641 ?auto_7639 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7637 ?auto_7641 ?auto_7639 )
      ( MAKE-2CRATE ?auto_7638 ?auto_7635 ?auto_7636 )
      ( MAKE-1CRATE-VERIFY ?auto_7635 ?auto_7636 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7642 - SURFACE
      ?auto_7643 - SURFACE
      ?auto_7644 - SURFACE
    )
    :vars
    (
      ?auto_7647 - HOIST
      ?auto_7648 - PLACE
      ?auto_7645 - TRUCK
      ?auto_7646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7647 ?auto_7648 ) ( SURFACE-AT ?auto_7643 ?auto_7648 ) ( CLEAR ?auto_7643 ) ( IS-CRATE ?auto_7644 ) ( not ( = ?auto_7643 ?auto_7644 ) ) ( AVAILABLE ?auto_7647 ) ( IN ?auto_7644 ?auto_7645 ) ( ON ?auto_7643 ?auto_7642 ) ( not ( = ?auto_7642 ?auto_7643 ) ) ( not ( = ?auto_7642 ?auto_7644 ) ) ( TRUCK-AT ?auto_7645 ?auto_7646 ) ( not ( = ?auto_7646 ?auto_7648 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7643 ?auto_7644 )
      ( MAKE-2CRATE-VERIFY ?auto_7642 ?auto_7643 ?auto_7644 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7649 - SURFACE
      ?auto_7650 - SURFACE
      ?auto_7651 - SURFACE
      ?auto_7652 - SURFACE
    )
    :vars
    (
      ?auto_7655 - HOIST
      ?auto_7656 - PLACE
      ?auto_7654 - TRUCK
      ?auto_7653 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7655 ?auto_7656 ) ( SURFACE-AT ?auto_7651 ?auto_7656 ) ( CLEAR ?auto_7651 ) ( IS-CRATE ?auto_7652 ) ( not ( = ?auto_7651 ?auto_7652 ) ) ( AVAILABLE ?auto_7655 ) ( IN ?auto_7652 ?auto_7654 ) ( ON ?auto_7651 ?auto_7650 ) ( not ( = ?auto_7650 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7652 ) ) ( TRUCK-AT ?auto_7654 ?auto_7653 ) ( not ( = ?auto_7653 ?auto_7656 ) ) ( ON ?auto_7650 ?auto_7649 ) ( not ( = ?auto_7649 ?auto_7650 ) ) ( not ( = ?auto_7649 ?auto_7651 ) ) ( not ( = ?auto_7649 ?auto_7652 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7650 ?auto_7651 ?auto_7652 )
      ( MAKE-3CRATE-VERIFY ?auto_7649 ?auto_7650 ?auto_7651 ?auto_7652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7657 - SURFACE
      ?auto_7658 - SURFACE
    )
    :vars
    (
      ?auto_7662 - HOIST
      ?auto_7663 - PLACE
      ?auto_7660 - SURFACE
      ?auto_7661 - TRUCK
      ?auto_7659 - PLACE
      ?auto_7664 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7662 ?auto_7663 ) ( SURFACE-AT ?auto_7657 ?auto_7663 ) ( CLEAR ?auto_7657 ) ( IS-CRATE ?auto_7658 ) ( not ( = ?auto_7657 ?auto_7658 ) ) ( AVAILABLE ?auto_7662 ) ( ON ?auto_7657 ?auto_7660 ) ( not ( = ?auto_7660 ?auto_7657 ) ) ( not ( = ?auto_7660 ?auto_7658 ) ) ( TRUCK-AT ?auto_7661 ?auto_7659 ) ( not ( = ?auto_7659 ?auto_7663 ) ) ( HOIST-AT ?auto_7664 ?auto_7659 ) ( LIFTING ?auto_7664 ?auto_7658 ) ( not ( = ?auto_7662 ?auto_7664 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7664 ?auto_7658 ?auto_7661 ?auto_7659 )
      ( MAKE-2CRATE ?auto_7660 ?auto_7657 ?auto_7658 )
      ( MAKE-1CRATE-VERIFY ?auto_7657 ?auto_7658 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7665 - SURFACE
      ?auto_7666 - SURFACE
      ?auto_7667 - SURFACE
    )
    :vars
    (
      ?auto_7672 - HOIST
      ?auto_7670 - PLACE
      ?auto_7669 - TRUCK
      ?auto_7668 - PLACE
      ?auto_7671 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7672 ?auto_7670 ) ( SURFACE-AT ?auto_7666 ?auto_7670 ) ( CLEAR ?auto_7666 ) ( IS-CRATE ?auto_7667 ) ( not ( = ?auto_7666 ?auto_7667 ) ) ( AVAILABLE ?auto_7672 ) ( ON ?auto_7666 ?auto_7665 ) ( not ( = ?auto_7665 ?auto_7666 ) ) ( not ( = ?auto_7665 ?auto_7667 ) ) ( TRUCK-AT ?auto_7669 ?auto_7668 ) ( not ( = ?auto_7668 ?auto_7670 ) ) ( HOIST-AT ?auto_7671 ?auto_7668 ) ( LIFTING ?auto_7671 ?auto_7667 ) ( not ( = ?auto_7672 ?auto_7671 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7666 ?auto_7667 )
      ( MAKE-2CRATE-VERIFY ?auto_7665 ?auto_7666 ?auto_7667 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7673 - SURFACE
      ?auto_7674 - SURFACE
      ?auto_7675 - SURFACE
      ?auto_7676 - SURFACE
    )
    :vars
    (
      ?auto_7678 - HOIST
      ?auto_7679 - PLACE
      ?auto_7680 - TRUCK
      ?auto_7681 - PLACE
      ?auto_7677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7678 ?auto_7679 ) ( SURFACE-AT ?auto_7675 ?auto_7679 ) ( CLEAR ?auto_7675 ) ( IS-CRATE ?auto_7676 ) ( not ( = ?auto_7675 ?auto_7676 ) ) ( AVAILABLE ?auto_7678 ) ( ON ?auto_7675 ?auto_7674 ) ( not ( = ?auto_7674 ?auto_7675 ) ) ( not ( = ?auto_7674 ?auto_7676 ) ) ( TRUCK-AT ?auto_7680 ?auto_7681 ) ( not ( = ?auto_7681 ?auto_7679 ) ) ( HOIST-AT ?auto_7677 ?auto_7681 ) ( LIFTING ?auto_7677 ?auto_7676 ) ( not ( = ?auto_7678 ?auto_7677 ) ) ( ON ?auto_7674 ?auto_7673 ) ( not ( = ?auto_7673 ?auto_7674 ) ) ( not ( = ?auto_7673 ?auto_7675 ) ) ( not ( = ?auto_7673 ?auto_7676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7674 ?auto_7675 ?auto_7676 )
      ( MAKE-3CRATE-VERIFY ?auto_7673 ?auto_7674 ?auto_7675 ?auto_7676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7682 - SURFACE
      ?auto_7683 - SURFACE
    )
    :vars
    (
      ?auto_7685 - HOIST
      ?auto_7686 - PLACE
      ?auto_7688 - SURFACE
      ?auto_7687 - TRUCK
      ?auto_7689 - PLACE
      ?auto_7684 - HOIST
      ?auto_7690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7685 ?auto_7686 ) ( SURFACE-AT ?auto_7682 ?auto_7686 ) ( CLEAR ?auto_7682 ) ( IS-CRATE ?auto_7683 ) ( not ( = ?auto_7682 ?auto_7683 ) ) ( AVAILABLE ?auto_7685 ) ( ON ?auto_7682 ?auto_7688 ) ( not ( = ?auto_7688 ?auto_7682 ) ) ( not ( = ?auto_7688 ?auto_7683 ) ) ( TRUCK-AT ?auto_7687 ?auto_7689 ) ( not ( = ?auto_7689 ?auto_7686 ) ) ( HOIST-AT ?auto_7684 ?auto_7689 ) ( not ( = ?auto_7685 ?auto_7684 ) ) ( AVAILABLE ?auto_7684 ) ( SURFACE-AT ?auto_7683 ?auto_7689 ) ( ON ?auto_7683 ?auto_7690 ) ( CLEAR ?auto_7683 ) ( not ( = ?auto_7682 ?auto_7690 ) ) ( not ( = ?auto_7683 ?auto_7690 ) ) ( not ( = ?auto_7688 ?auto_7690 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7684 ?auto_7683 ?auto_7690 ?auto_7689 )
      ( MAKE-2CRATE ?auto_7688 ?auto_7682 ?auto_7683 )
      ( MAKE-1CRATE-VERIFY ?auto_7682 ?auto_7683 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7691 - SURFACE
      ?auto_7692 - SURFACE
      ?auto_7693 - SURFACE
    )
    :vars
    (
      ?auto_7695 - HOIST
      ?auto_7697 - PLACE
      ?auto_7698 - TRUCK
      ?auto_7694 - PLACE
      ?auto_7699 - HOIST
      ?auto_7696 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7695 ?auto_7697 ) ( SURFACE-AT ?auto_7692 ?auto_7697 ) ( CLEAR ?auto_7692 ) ( IS-CRATE ?auto_7693 ) ( not ( = ?auto_7692 ?auto_7693 ) ) ( AVAILABLE ?auto_7695 ) ( ON ?auto_7692 ?auto_7691 ) ( not ( = ?auto_7691 ?auto_7692 ) ) ( not ( = ?auto_7691 ?auto_7693 ) ) ( TRUCK-AT ?auto_7698 ?auto_7694 ) ( not ( = ?auto_7694 ?auto_7697 ) ) ( HOIST-AT ?auto_7699 ?auto_7694 ) ( not ( = ?auto_7695 ?auto_7699 ) ) ( AVAILABLE ?auto_7699 ) ( SURFACE-AT ?auto_7693 ?auto_7694 ) ( ON ?auto_7693 ?auto_7696 ) ( CLEAR ?auto_7693 ) ( not ( = ?auto_7692 ?auto_7696 ) ) ( not ( = ?auto_7693 ?auto_7696 ) ) ( not ( = ?auto_7691 ?auto_7696 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7692 ?auto_7693 )
      ( MAKE-2CRATE-VERIFY ?auto_7691 ?auto_7692 ?auto_7693 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7700 - SURFACE
      ?auto_7701 - SURFACE
      ?auto_7702 - SURFACE
      ?auto_7703 - SURFACE
    )
    :vars
    (
      ?auto_7706 - HOIST
      ?auto_7705 - PLACE
      ?auto_7707 - TRUCK
      ?auto_7708 - PLACE
      ?auto_7704 - HOIST
      ?auto_7709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7706 ?auto_7705 ) ( SURFACE-AT ?auto_7702 ?auto_7705 ) ( CLEAR ?auto_7702 ) ( IS-CRATE ?auto_7703 ) ( not ( = ?auto_7702 ?auto_7703 ) ) ( AVAILABLE ?auto_7706 ) ( ON ?auto_7702 ?auto_7701 ) ( not ( = ?auto_7701 ?auto_7702 ) ) ( not ( = ?auto_7701 ?auto_7703 ) ) ( TRUCK-AT ?auto_7707 ?auto_7708 ) ( not ( = ?auto_7708 ?auto_7705 ) ) ( HOIST-AT ?auto_7704 ?auto_7708 ) ( not ( = ?auto_7706 ?auto_7704 ) ) ( AVAILABLE ?auto_7704 ) ( SURFACE-AT ?auto_7703 ?auto_7708 ) ( ON ?auto_7703 ?auto_7709 ) ( CLEAR ?auto_7703 ) ( not ( = ?auto_7702 ?auto_7709 ) ) ( not ( = ?auto_7703 ?auto_7709 ) ) ( not ( = ?auto_7701 ?auto_7709 ) ) ( ON ?auto_7701 ?auto_7700 ) ( not ( = ?auto_7700 ?auto_7701 ) ) ( not ( = ?auto_7700 ?auto_7702 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( not ( = ?auto_7700 ?auto_7709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7701 ?auto_7702 ?auto_7703 )
      ( MAKE-3CRATE-VERIFY ?auto_7700 ?auto_7701 ?auto_7702 ?auto_7703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7710 - SURFACE
      ?auto_7711 - SURFACE
    )
    :vars
    (
      ?auto_7714 - HOIST
      ?auto_7713 - PLACE
      ?auto_7716 - SURFACE
      ?auto_7717 - PLACE
      ?auto_7712 - HOIST
      ?auto_7718 - SURFACE
      ?auto_7715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7714 ?auto_7713 ) ( SURFACE-AT ?auto_7710 ?auto_7713 ) ( CLEAR ?auto_7710 ) ( IS-CRATE ?auto_7711 ) ( not ( = ?auto_7710 ?auto_7711 ) ) ( AVAILABLE ?auto_7714 ) ( ON ?auto_7710 ?auto_7716 ) ( not ( = ?auto_7716 ?auto_7710 ) ) ( not ( = ?auto_7716 ?auto_7711 ) ) ( not ( = ?auto_7717 ?auto_7713 ) ) ( HOIST-AT ?auto_7712 ?auto_7717 ) ( not ( = ?auto_7714 ?auto_7712 ) ) ( AVAILABLE ?auto_7712 ) ( SURFACE-AT ?auto_7711 ?auto_7717 ) ( ON ?auto_7711 ?auto_7718 ) ( CLEAR ?auto_7711 ) ( not ( = ?auto_7710 ?auto_7718 ) ) ( not ( = ?auto_7711 ?auto_7718 ) ) ( not ( = ?auto_7716 ?auto_7718 ) ) ( TRUCK-AT ?auto_7715 ?auto_7713 ) )
    :subtasks
    ( ( !DRIVE ?auto_7715 ?auto_7713 ?auto_7717 )
      ( MAKE-2CRATE ?auto_7716 ?auto_7710 ?auto_7711 )
      ( MAKE-1CRATE-VERIFY ?auto_7710 ?auto_7711 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7719 - SURFACE
      ?auto_7720 - SURFACE
      ?auto_7721 - SURFACE
    )
    :vars
    (
      ?auto_7725 - HOIST
      ?auto_7726 - PLACE
      ?auto_7727 - PLACE
      ?auto_7724 - HOIST
      ?auto_7722 - SURFACE
      ?auto_7723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7725 ?auto_7726 ) ( SURFACE-AT ?auto_7720 ?auto_7726 ) ( CLEAR ?auto_7720 ) ( IS-CRATE ?auto_7721 ) ( not ( = ?auto_7720 ?auto_7721 ) ) ( AVAILABLE ?auto_7725 ) ( ON ?auto_7720 ?auto_7719 ) ( not ( = ?auto_7719 ?auto_7720 ) ) ( not ( = ?auto_7719 ?auto_7721 ) ) ( not ( = ?auto_7727 ?auto_7726 ) ) ( HOIST-AT ?auto_7724 ?auto_7727 ) ( not ( = ?auto_7725 ?auto_7724 ) ) ( AVAILABLE ?auto_7724 ) ( SURFACE-AT ?auto_7721 ?auto_7727 ) ( ON ?auto_7721 ?auto_7722 ) ( CLEAR ?auto_7721 ) ( not ( = ?auto_7720 ?auto_7722 ) ) ( not ( = ?auto_7721 ?auto_7722 ) ) ( not ( = ?auto_7719 ?auto_7722 ) ) ( TRUCK-AT ?auto_7723 ?auto_7726 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7720 ?auto_7721 )
      ( MAKE-2CRATE-VERIFY ?auto_7719 ?auto_7720 ?auto_7721 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7728 - SURFACE
      ?auto_7729 - SURFACE
      ?auto_7730 - SURFACE
      ?auto_7731 - SURFACE
    )
    :vars
    (
      ?auto_7732 - HOIST
      ?auto_7737 - PLACE
      ?auto_7733 - PLACE
      ?auto_7735 - HOIST
      ?auto_7734 - SURFACE
      ?auto_7736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7732 ?auto_7737 ) ( SURFACE-AT ?auto_7730 ?auto_7737 ) ( CLEAR ?auto_7730 ) ( IS-CRATE ?auto_7731 ) ( not ( = ?auto_7730 ?auto_7731 ) ) ( AVAILABLE ?auto_7732 ) ( ON ?auto_7730 ?auto_7729 ) ( not ( = ?auto_7729 ?auto_7730 ) ) ( not ( = ?auto_7729 ?auto_7731 ) ) ( not ( = ?auto_7733 ?auto_7737 ) ) ( HOIST-AT ?auto_7735 ?auto_7733 ) ( not ( = ?auto_7732 ?auto_7735 ) ) ( AVAILABLE ?auto_7735 ) ( SURFACE-AT ?auto_7731 ?auto_7733 ) ( ON ?auto_7731 ?auto_7734 ) ( CLEAR ?auto_7731 ) ( not ( = ?auto_7730 ?auto_7734 ) ) ( not ( = ?auto_7731 ?auto_7734 ) ) ( not ( = ?auto_7729 ?auto_7734 ) ) ( TRUCK-AT ?auto_7736 ?auto_7737 ) ( ON ?auto_7729 ?auto_7728 ) ( not ( = ?auto_7728 ?auto_7729 ) ) ( not ( = ?auto_7728 ?auto_7730 ) ) ( not ( = ?auto_7728 ?auto_7731 ) ) ( not ( = ?auto_7728 ?auto_7734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7729 ?auto_7730 ?auto_7731 )
      ( MAKE-3CRATE-VERIFY ?auto_7728 ?auto_7729 ?auto_7730 ?auto_7731 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7738 - SURFACE
      ?auto_7739 - SURFACE
    )
    :vars
    (
      ?auto_7741 - HOIST
      ?auto_7746 - PLACE
      ?auto_7740 - SURFACE
      ?auto_7742 - PLACE
      ?auto_7744 - HOIST
      ?auto_7743 - SURFACE
      ?auto_7745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7741 ?auto_7746 ) ( IS-CRATE ?auto_7739 ) ( not ( = ?auto_7738 ?auto_7739 ) ) ( not ( = ?auto_7740 ?auto_7738 ) ) ( not ( = ?auto_7740 ?auto_7739 ) ) ( not ( = ?auto_7742 ?auto_7746 ) ) ( HOIST-AT ?auto_7744 ?auto_7742 ) ( not ( = ?auto_7741 ?auto_7744 ) ) ( AVAILABLE ?auto_7744 ) ( SURFACE-AT ?auto_7739 ?auto_7742 ) ( ON ?auto_7739 ?auto_7743 ) ( CLEAR ?auto_7739 ) ( not ( = ?auto_7738 ?auto_7743 ) ) ( not ( = ?auto_7739 ?auto_7743 ) ) ( not ( = ?auto_7740 ?auto_7743 ) ) ( TRUCK-AT ?auto_7745 ?auto_7746 ) ( SURFACE-AT ?auto_7740 ?auto_7746 ) ( CLEAR ?auto_7740 ) ( LIFTING ?auto_7741 ?auto_7738 ) ( IS-CRATE ?auto_7738 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7740 ?auto_7738 )
      ( MAKE-2CRATE ?auto_7740 ?auto_7738 ?auto_7739 )
      ( MAKE-1CRATE-VERIFY ?auto_7738 ?auto_7739 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7747 - SURFACE
      ?auto_7748 - SURFACE
      ?auto_7749 - SURFACE
    )
    :vars
    (
      ?auto_7750 - HOIST
      ?auto_7753 - PLACE
      ?auto_7752 - PLACE
      ?auto_7754 - HOIST
      ?auto_7755 - SURFACE
      ?auto_7751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7750 ?auto_7753 ) ( IS-CRATE ?auto_7749 ) ( not ( = ?auto_7748 ?auto_7749 ) ) ( not ( = ?auto_7747 ?auto_7748 ) ) ( not ( = ?auto_7747 ?auto_7749 ) ) ( not ( = ?auto_7752 ?auto_7753 ) ) ( HOIST-AT ?auto_7754 ?auto_7752 ) ( not ( = ?auto_7750 ?auto_7754 ) ) ( AVAILABLE ?auto_7754 ) ( SURFACE-AT ?auto_7749 ?auto_7752 ) ( ON ?auto_7749 ?auto_7755 ) ( CLEAR ?auto_7749 ) ( not ( = ?auto_7748 ?auto_7755 ) ) ( not ( = ?auto_7749 ?auto_7755 ) ) ( not ( = ?auto_7747 ?auto_7755 ) ) ( TRUCK-AT ?auto_7751 ?auto_7753 ) ( SURFACE-AT ?auto_7747 ?auto_7753 ) ( CLEAR ?auto_7747 ) ( LIFTING ?auto_7750 ?auto_7748 ) ( IS-CRATE ?auto_7748 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7748 ?auto_7749 )
      ( MAKE-2CRATE-VERIFY ?auto_7747 ?auto_7748 ?auto_7749 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7756 - SURFACE
      ?auto_7757 - SURFACE
      ?auto_7758 - SURFACE
      ?auto_7759 - SURFACE
    )
    :vars
    (
      ?auto_7760 - HOIST
      ?auto_7763 - PLACE
      ?auto_7764 - PLACE
      ?auto_7765 - HOIST
      ?auto_7762 - SURFACE
      ?auto_7761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7760 ?auto_7763 ) ( IS-CRATE ?auto_7759 ) ( not ( = ?auto_7758 ?auto_7759 ) ) ( not ( = ?auto_7757 ?auto_7758 ) ) ( not ( = ?auto_7757 ?auto_7759 ) ) ( not ( = ?auto_7764 ?auto_7763 ) ) ( HOIST-AT ?auto_7765 ?auto_7764 ) ( not ( = ?auto_7760 ?auto_7765 ) ) ( AVAILABLE ?auto_7765 ) ( SURFACE-AT ?auto_7759 ?auto_7764 ) ( ON ?auto_7759 ?auto_7762 ) ( CLEAR ?auto_7759 ) ( not ( = ?auto_7758 ?auto_7762 ) ) ( not ( = ?auto_7759 ?auto_7762 ) ) ( not ( = ?auto_7757 ?auto_7762 ) ) ( TRUCK-AT ?auto_7761 ?auto_7763 ) ( SURFACE-AT ?auto_7757 ?auto_7763 ) ( CLEAR ?auto_7757 ) ( LIFTING ?auto_7760 ?auto_7758 ) ( IS-CRATE ?auto_7758 ) ( ON ?auto_7757 ?auto_7756 ) ( not ( = ?auto_7756 ?auto_7757 ) ) ( not ( = ?auto_7756 ?auto_7758 ) ) ( not ( = ?auto_7756 ?auto_7759 ) ) ( not ( = ?auto_7756 ?auto_7762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7757 ?auto_7758 ?auto_7759 )
      ( MAKE-3CRATE-VERIFY ?auto_7756 ?auto_7757 ?auto_7758 ?auto_7759 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7766 - SURFACE
      ?auto_7767 - SURFACE
    )
    :vars
    (
      ?auto_7768 - HOIST
      ?auto_7772 - PLACE
      ?auto_7769 - SURFACE
      ?auto_7773 - PLACE
      ?auto_7774 - HOIST
      ?auto_7771 - SURFACE
      ?auto_7770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7768 ?auto_7772 ) ( IS-CRATE ?auto_7767 ) ( not ( = ?auto_7766 ?auto_7767 ) ) ( not ( = ?auto_7769 ?auto_7766 ) ) ( not ( = ?auto_7769 ?auto_7767 ) ) ( not ( = ?auto_7773 ?auto_7772 ) ) ( HOIST-AT ?auto_7774 ?auto_7773 ) ( not ( = ?auto_7768 ?auto_7774 ) ) ( AVAILABLE ?auto_7774 ) ( SURFACE-AT ?auto_7767 ?auto_7773 ) ( ON ?auto_7767 ?auto_7771 ) ( CLEAR ?auto_7767 ) ( not ( = ?auto_7766 ?auto_7771 ) ) ( not ( = ?auto_7767 ?auto_7771 ) ) ( not ( = ?auto_7769 ?auto_7771 ) ) ( TRUCK-AT ?auto_7770 ?auto_7772 ) ( SURFACE-AT ?auto_7769 ?auto_7772 ) ( CLEAR ?auto_7769 ) ( IS-CRATE ?auto_7766 ) ( AVAILABLE ?auto_7768 ) ( IN ?auto_7766 ?auto_7770 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7768 ?auto_7766 ?auto_7770 ?auto_7772 )
      ( MAKE-2CRATE ?auto_7769 ?auto_7766 ?auto_7767 )
      ( MAKE-1CRATE-VERIFY ?auto_7766 ?auto_7767 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7775 - SURFACE
      ?auto_7776 - SURFACE
      ?auto_7777 - SURFACE
    )
    :vars
    (
      ?auto_7782 - HOIST
      ?auto_7780 - PLACE
      ?auto_7779 - PLACE
      ?auto_7783 - HOIST
      ?auto_7778 - SURFACE
      ?auto_7781 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7782 ?auto_7780 ) ( IS-CRATE ?auto_7777 ) ( not ( = ?auto_7776 ?auto_7777 ) ) ( not ( = ?auto_7775 ?auto_7776 ) ) ( not ( = ?auto_7775 ?auto_7777 ) ) ( not ( = ?auto_7779 ?auto_7780 ) ) ( HOIST-AT ?auto_7783 ?auto_7779 ) ( not ( = ?auto_7782 ?auto_7783 ) ) ( AVAILABLE ?auto_7783 ) ( SURFACE-AT ?auto_7777 ?auto_7779 ) ( ON ?auto_7777 ?auto_7778 ) ( CLEAR ?auto_7777 ) ( not ( = ?auto_7776 ?auto_7778 ) ) ( not ( = ?auto_7777 ?auto_7778 ) ) ( not ( = ?auto_7775 ?auto_7778 ) ) ( TRUCK-AT ?auto_7781 ?auto_7780 ) ( SURFACE-AT ?auto_7775 ?auto_7780 ) ( CLEAR ?auto_7775 ) ( IS-CRATE ?auto_7776 ) ( AVAILABLE ?auto_7782 ) ( IN ?auto_7776 ?auto_7781 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7776 ?auto_7777 )
      ( MAKE-2CRATE-VERIFY ?auto_7775 ?auto_7776 ?auto_7777 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7784 - SURFACE
      ?auto_7785 - SURFACE
      ?auto_7786 - SURFACE
      ?auto_7787 - SURFACE
    )
    :vars
    (
      ?auto_7789 - HOIST
      ?auto_7793 - PLACE
      ?auto_7792 - PLACE
      ?auto_7790 - HOIST
      ?auto_7788 - SURFACE
      ?auto_7791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7789 ?auto_7793 ) ( IS-CRATE ?auto_7787 ) ( not ( = ?auto_7786 ?auto_7787 ) ) ( not ( = ?auto_7785 ?auto_7786 ) ) ( not ( = ?auto_7785 ?auto_7787 ) ) ( not ( = ?auto_7792 ?auto_7793 ) ) ( HOIST-AT ?auto_7790 ?auto_7792 ) ( not ( = ?auto_7789 ?auto_7790 ) ) ( AVAILABLE ?auto_7790 ) ( SURFACE-AT ?auto_7787 ?auto_7792 ) ( ON ?auto_7787 ?auto_7788 ) ( CLEAR ?auto_7787 ) ( not ( = ?auto_7786 ?auto_7788 ) ) ( not ( = ?auto_7787 ?auto_7788 ) ) ( not ( = ?auto_7785 ?auto_7788 ) ) ( TRUCK-AT ?auto_7791 ?auto_7793 ) ( SURFACE-AT ?auto_7785 ?auto_7793 ) ( CLEAR ?auto_7785 ) ( IS-CRATE ?auto_7786 ) ( AVAILABLE ?auto_7789 ) ( IN ?auto_7786 ?auto_7791 ) ( ON ?auto_7785 ?auto_7784 ) ( not ( = ?auto_7784 ?auto_7785 ) ) ( not ( = ?auto_7784 ?auto_7786 ) ) ( not ( = ?auto_7784 ?auto_7787 ) ) ( not ( = ?auto_7784 ?auto_7788 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7785 ?auto_7786 ?auto_7787 )
      ( MAKE-3CRATE-VERIFY ?auto_7784 ?auto_7785 ?auto_7786 ?auto_7787 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7794 - SURFACE
      ?auto_7795 - SURFACE
    )
    :vars
    (
      ?auto_7798 - HOIST
      ?auto_7802 - PLACE
      ?auto_7797 - SURFACE
      ?auto_7801 - PLACE
      ?auto_7799 - HOIST
      ?auto_7796 - SURFACE
      ?auto_7800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7798 ?auto_7802 ) ( IS-CRATE ?auto_7795 ) ( not ( = ?auto_7794 ?auto_7795 ) ) ( not ( = ?auto_7797 ?auto_7794 ) ) ( not ( = ?auto_7797 ?auto_7795 ) ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( HOIST-AT ?auto_7799 ?auto_7801 ) ( not ( = ?auto_7798 ?auto_7799 ) ) ( AVAILABLE ?auto_7799 ) ( SURFACE-AT ?auto_7795 ?auto_7801 ) ( ON ?auto_7795 ?auto_7796 ) ( CLEAR ?auto_7795 ) ( not ( = ?auto_7794 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7797 ?auto_7796 ) ) ( SURFACE-AT ?auto_7797 ?auto_7802 ) ( CLEAR ?auto_7797 ) ( IS-CRATE ?auto_7794 ) ( AVAILABLE ?auto_7798 ) ( IN ?auto_7794 ?auto_7800 ) ( TRUCK-AT ?auto_7800 ?auto_7801 ) )
    :subtasks
    ( ( !DRIVE ?auto_7800 ?auto_7801 ?auto_7802 )
      ( MAKE-2CRATE ?auto_7797 ?auto_7794 ?auto_7795 )
      ( MAKE-1CRATE-VERIFY ?auto_7794 ?auto_7795 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7803 - SURFACE
      ?auto_7804 - SURFACE
      ?auto_7805 - SURFACE
    )
    :vars
    (
      ?auto_7809 - HOIST
      ?auto_7808 - PLACE
      ?auto_7806 - PLACE
      ?auto_7807 - HOIST
      ?auto_7811 - SURFACE
      ?auto_7810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7809 ?auto_7808 ) ( IS-CRATE ?auto_7805 ) ( not ( = ?auto_7804 ?auto_7805 ) ) ( not ( = ?auto_7803 ?auto_7804 ) ) ( not ( = ?auto_7803 ?auto_7805 ) ) ( not ( = ?auto_7806 ?auto_7808 ) ) ( HOIST-AT ?auto_7807 ?auto_7806 ) ( not ( = ?auto_7809 ?auto_7807 ) ) ( AVAILABLE ?auto_7807 ) ( SURFACE-AT ?auto_7805 ?auto_7806 ) ( ON ?auto_7805 ?auto_7811 ) ( CLEAR ?auto_7805 ) ( not ( = ?auto_7804 ?auto_7811 ) ) ( not ( = ?auto_7805 ?auto_7811 ) ) ( not ( = ?auto_7803 ?auto_7811 ) ) ( SURFACE-AT ?auto_7803 ?auto_7808 ) ( CLEAR ?auto_7803 ) ( IS-CRATE ?auto_7804 ) ( AVAILABLE ?auto_7809 ) ( IN ?auto_7804 ?auto_7810 ) ( TRUCK-AT ?auto_7810 ?auto_7806 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7804 ?auto_7805 )
      ( MAKE-2CRATE-VERIFY ?auto_7803 ?auto_7804 ?auto_7805 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7812 - SURFACE
      ?auto_7813 - SURFACE
      ?auto_7814 - SURFACE
      ?auto_7815 - SURFACE
    )
    :vars
    (
      ?auto_7821 - HOIST
      ?auto_7819 - PLACE
      ?auto_7820 - PLACE
      ?auto_7817 - HOIST
      ?auto_7818 - SURFACE
      ?auto_7816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7821 ?auto_7819 ) ( IS-CRATE ?auto_7815 ) ( not ( = ?auto_7814 ?auto_7815 ) ) ( not ( = ?auto_7813 ?auto_7814 ) ) ( not ( = ?auto_7813 ?auto_7815 ) ) ( not ( = ?auto_7820 ?auto_7819 ) ) ( HOIST-AT ?auto_7817 ?auto_7820 ) ( not ( = ?auto_7821 ?auto_7817 ) ) ( AVAILABLE ?auto_7817 ) ( SURFACE-AT ?auto_7815 ?auto_7820 ) ( ON ?auto_7815 ?auto_7818 ) ( CLEAR ?auto_7815 ) ( not ( = ?auto_7814 ?auto_7818 ) ) ( not ( = ?auto_7815 ?auto_7818 ) ) ( not ( = ?auto_7813 ?auto_7818 ) ) ( SURFACE-AT ?auto_7813 ?auto_7819 ) ( CLEAR ?auto_7813 ) ( IS-CRATE ?auto_7814 ) ( AVAILABLE ?auto_7821 ) ( IN ?auto_7814 ?auto_7816 ) ( TRUCK-AT ?auto_7816 ?auto_7820 ) ( ON ?auto_7813 ?auto_7812 ) ( not ( = ?auto_7812 ?auto_7813 ) ) ( not ( = ?auto_7812 ?auto_7814 ) ) ( not ( = ?auto_7812 ?auto_7815 ) ) ( not ( = ?auto_7812 ?auto_7818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7813 ?auto_7814 ?auto_7815 )
      ( MAKE-3CRATE-VERIFY ?auto_7812 ?auto_7813 ?auto_7814 ?auto_7815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7822 - SURFACE
      ?auto_7823 - SURFACE
    )
    :vars
    (
      ?auto_7830 - HOIST
      ?auto_7827 - PLACE
      ?auto_7829 - SURFACE
      ?auto_7828 - PLACE
      ?auto_7825 - HOIST
      ?auto_7826 - SURFACE
      ?auto_7824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7830 ?auto_7827 ) ( IS-CRATE ?auto_7823 ) ( not ( = ?auto_7822 ?auto_7823 ) ) ( not ( = ?auto_7829 ?auto_7822 ) ) ( not ( = ?auto_7829 ?auto_7823 ) ) ( not ( = ?auto_7828 ?auto_7827 ) ) ( HOIST-AT ?auto_7825 ?auto_7828 ) ( not ( = ?auto_7830 ?auto_7825 ) ) ( SURFACE-AT ?auto_7823 ?auto_7828 ) ( ON ?auto_7823 ?auto_7826 ) ( CLEAR ?auto_7823 ) ( not ( = ?auto_7822 ?auto_7826 ) ) ( not ( = ?auto_7823 ?auto_7826 ) ) ( not ( = ?auto_7829 ?auto_7826 ) ) ( SURFACE-AT ?auto_7829 ?auto_7827 ) ( CLEAR ?auto_7829 ) ( IS-CRATE ?auto_7822 ) ( AVAILABLE ?auto_7830 ) ( TRUCK-AT ?auto_7824 ?auto_7828 ) ( LIFTING ?auto_7825 ?auto_7822 ) )
    :subtasks
    ( ( !LOAD ?auto_7825 ?auto_7822 ?auto_7824 ?auto_7828 )
      ( MAKE-2CRATE ?auto_7829 ?auto_7822 ?auto_7823 )
      ( MAKE-1CRATE-VERIFY ?auto_7822 ?auto_7823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7831 - SURFACE
      ?auto_7832 - SURFACE
      ?auto_7833 - SURFACE
    )
    :vars
    (
      ?auto_7834 - HOIST
      ?auto_7836 - PLACE
      ?auto_7835 - PLACE
      ?auto_7839 - HOIST
      ?auto_7837 - SURFACE
      ?auto_7838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7834 ?auto_7836 ) ( IS-CRATE ?auto_7833 ) ( not ( = ?auto_7832 ?auto_7833 ) ) ( not ( = ?auto_7831 ?auto_7832 ) ) ( not ( = ?auto_7831 ?auto_7833 ) ) ( not ( = ?auto_7835 ?auto_7836 ) ) ( HOIST-AT ?auto_7839 ?auto_7835 ) ( not ( = ?auto_7834 ?auto_7839 ) ) ( SURFACE-AT ?auto_7833 ?auto_7835 ) ( ON ?auto_7833 ?auto_7837 ) ( CLEAR ?auto_7833 ) ( not ( = ?auto_7832 ?auto_7837 ) ) ( not ( = ?auto_7833 ?auto_7837 ) ) ( not ( = ?auto_7831 ?auto_7837 ) ) ( SURFACE-AT ?auto_7831 ?auto_7836 ) ( CLEAR ?auto_7831 ) ( IS-CRATE ?auto_7832 ) ( AVAILABLE ?auto_7834 ) ( TRUCK-AT ?auto_7838 ?auto_7835 ) ( LIFTING ?auto_7839 ?auto_7832 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7832 ?auto_7833 )
      ( MAKE-2CRATE-VERIFY ?auto_7831 ?auto_7832 ?auto_7833 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7840 - SURFACE
      ?auto_7841 - SURFACE
      ?auto_7842 - SURFACE
      ?auto_7843 - SURFACE
    )
    :vars
    (
      ?auto_7849 - HOIST
      ?auto_7844 - PLACE
      ?auto_7848 - PLACE
      ?auto_7845 - HOIST
      ?auto_7846 - SURFACE
      ?auto_7847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7849 ?auto_7844 ) ( IS-CRATE ?auto_7843 ) ( not ( = ?auto_7842 ?auto_7843 ) ) ( not ( = ?auto_7841 ?auto_7842 ) ) ( not ( = ?auto_7841 ?auto_7843 ) ) ( not ( = ?auto_7848 ?auto_7844 ) ) ( HOIST-AT ?auto_7845 ?auto_7848 ) ( not ( = ?auto_7849 ?auto_7845 ) ) ( SURFACE-AT ?auto_7843 ?auto_7848 ) ( ON ?auto_7843 ?auto_7846 ) ( CLEAR ?auto_7843 ) ( not ( = ?auto_7842 ?auto_7846 ) ) ( not ( = ?auto_7843 ?auto_7846 ) ) ( not ( = ?auto_7841 ?auto_7846 ) ) ( SURFACE-AT ?auto_7841 ?auto_7844 ) ( CLEAR ?auto_7841 ) ( IS-CRATE ?auto_7842 ) ( AVAILABLE ?auto_7849 ) ( TRUCK-AT ?auto_7847 ?auto_7848 ) ( LIFTING ?auto_7845 ?auto_7842 ) ( ON ?auto_7841 ?auto_7840 ) ( not ( = ?auto_7840 ?auto_7841 ) ) ( not ( = ?auto_7840 ?auto_7842 ) ) ( not ( = ?auto_7840 ?auto_7843 ) ) ( not ( = ?auto_7840 ?auto_7846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7841 ?auto_7842 ?auto_7843 )
      ( MAKE-3CRATE-VERIFY ?auto_7840 ?auto_7841 ?auto_7842 ?auto_7843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7850 - SURFACE
      ?auto_7851 - SURFACE
    )
    :vars
    (
      ?auto_7858 - HOIST
      ?auto_7853 - PLACE
      ?auto_7852 - SURFACE
      ?auto_7857 - PLACE
      ?auto_7854 - HOIST
      ?auto_7855 - SURFACE
      ?auto_7856 - TRUCK
      ?auto_7859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7858 ?auto_7853 ) ( IS-CRATE ?auto_7851 ) ( not ( = ?auto_7850 ?auto_7851 ) ) ( not ( = ?auto_7852 ?auto_7850 ) ) ( not ( = ?auto_7852 ?auto_7851 ) ) ( not ( = ?auto_7857 ?auto_7853 ) ) ( HOIST-AT ?auto_7854 ?auto_7857 ) ( not ( = ?auto_7858 ?auto_7854 ) ) ( SURFACE-AT ?auto_7851 ?auto_7857 ) ( ON ?auto_7851 ?auto_7855 ) ( CLEAR ?auto_7851 ) ( not ( = ?auto_7850 ?auto_7855 ) ) ( not ( = ?auto_7851 ?auto_7855 ) ) ( not ( = ?auto_7852 ?auto_7855 ) ) ( SURFACE-AT ?auto_7852 ?auto_7853 ) ( CLEAR ?auto_7852 ) ( IS-CRATE ?auto_7850 ) ( AVAILABLE ?auto_7858 ) ( TRUCK-AT ?auto_7856 ?auto_7857 ) ( AVAILABLE ?auto_7854 ) ( SURFACE-AT ?auto_7850 ?auto_7857 ) ( ON ?auto_7850 ?auto_7859 ) ( CLEAR ?auto_7850 ) ( not ( = ?auto_7850 ?auto_7859 ) ) ( not ( = ?auto_7851 ?auto_7859 ) ) ( not ( = ?auto_7852 ?auto_7859 ) ) ( not ( = ?auto_7855 ?auto_7859 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7854 ?auto_7850 ?auto_7859 ?auto_7857 )
      ( MAKE-2CRATE ?auto_7852 ?auto_7850 ?auto_7851 )
      ( MAKE-1CRATE-VERIFY ?auto_7850 ?auto_7851 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7860 - SURFACE
      ?auto_7861 - SURFACE
      ?auto_7862 - SURFACE
    )
    :vars
    (
      ?auto_7863 - HOIST
      ?auto_7868 - PLACE
      ?auto_7865 - PLACE
      ?auto_7864 - HOIST
      ?auto_7867 - SURFACE
      ?auto_7866 - TRUCK
      ?auto_7869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7863 ?auto_7868 ) ( IS-CRATE ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7861 ) ) ( not ( = ?auto_7860 ?auto_7862 ) ) ( not ( = ?auto_7865 ?auto_7868 ) ) ( HOIST-AT ?auto_7864 ?auto_7865 ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( SURFACE-AT ?auto_7862 ?auto_7865 ) ( ON ?auto_7862 ?auto_7867 ) ( CLEAR ?auto_7862 ) ( not ( = ?auto_7861 ?auto_7867 ) ) ( not ( = ?auto_7862 ?auto_7867 ) ) ( not ( = ?auto_7860 ?auto_7867 ) ) ( SURFACE-AT ?auto_7860 ?auto_7868 ) ( CLEAR ?auto_7860 ) ( IS-CRATE ?auto_7861 ) ( AVAILABLE ?auto_7863 ) ( TRUCK-AT ?auto_7866 ?auto_7865 ) ( AVAILABLE ?auto_7864 ) ( SURFACE-AT ?auto_7861 ?auto_7865 ) ( ON ?auto_7861 ?auto_7869 ) ( CLEAR ?auto_7861 ) ( not ( = ?auto_7861 ?auto_7869 ) ) ( not ( = ?auto_7862 ?auto_7869 ) ) ( not ( = ?auto_7860 ?auto_7869 ) ) ( not ( = ?auto_7867 ?auto_7869 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7861 ?auto_7862 )
      ( MAKE-2CRATE-VERIFY ?auto_7860 ?auto_7861 ?auto_7862 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7870 - SURFACE
      ?auto_7871 - SURFACE
      ?auto_7872 - SURFACE
      ?auto_7873 - SURFACE
    )
    :vars
    (
      ?auto_7876 - HOIST
      ?auto_7880 - PLACE
      ?auto_7874 - PLACE
      ?auto_7878 - HOIST
      ?auto_7877 - SURFACE
      ?auto_7875 - TRUCK
      ?auto_7879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7876 ?auto_7880 ) ( IS-CRATE ?auto_7873 ) ( not ( = ?auto_7872 ?auto_7873 ) ) ( not ( = ?auto_7871 ?auto_7872 ) ) ( not ( = ?auto_7871 ?auto_7873 ) ) ( not ( = ?auto_7874 ?auto_7880 ) ) ( HOIST-AT ?auto_7878 ?auto_7874 ) ( not ( = ?auto_7876 ?auto_7878 ) ) ( SURFACE-AT ?auto_7873 ?auto_7874 ) ( ON ?auto_7873 ?auto_7877 ) ( CLEAR ?auto_7873 ) ( not ( = ?auto_7872 ?auto_7877 ) ) ( not ( = ?auto_7873 ?auto_7877 ) ) ( not ( = ?auto_7871 ?auto_7877 ) ) ( SURFACE-AT ?auto_7871 ?auto_7880 ) ( CLEAR ?auto_7871 ) ( IS-CRATE ?auto_7872 ) ( AVAILABLE ?auto_7876 ) ( TRUCK-AT ?auto_7875 ?auto_7874 ) ( AVAILABLE ?auto_7878 ) ( SURFACE-AT ?auto_7872 ?auto_7874 ) ( ON ?auto_7872 ?auto_7879 ) ( CLEAR ?auto_7872 ) ( not ( = ?auto_7872 ?auto_7879 ) ) ( not ( = ?auto_7873 ?auto_7879 ) ) ( not ( = ?auto_7871 ?auto_7879 ) ) ( not ( = ?auto_7877 ?auto_7879 ) ) ( ON ?auto_7871 ?auto_7870 ) ( not ( = ?auto_7870 ?auto_7871 ) ) ( not ( = ?auto_7870 ?auto_7872 ) ) ( not ( = ?auto_7870 ?auto_7873 ) ) ( not ( = ?auto_7870 ?auto_7877 ) ) ( not ( = ?auto_7870 ?auto_7879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7871 ?auto_7872 ?auto_7873 )
      ( MAKE-3CRATE-VERIFY ?auto_7870 ?auto_7871 ?auto_7872 ?auto_7873 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7881 - SURFACE
      ?auto_7882 - SURFACE
    )
    :vars
    (
      ?auto_7886 - HOIST
      ?auto_7890 - PLACE
      ?auto_7885 - SURFACE
      ?auto_7883 - PLACE
      ?auto_7888 - HOIST
      ?auto_7887 - SURFACE
      ?auto_7889 - SURFACE
      ?auto_7884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7886 ?auto_7890 ) ( IS-CRATE ?auto_7882 ) ( not ( = ?auto_7881 ?auto_7882 ) ) ( not ( = ?auto_7885 ?auto_7881 ) ) ( not ( = ?auto_7885 ?auto_7882 ) ) ( not ( = ?auto_7883 ?auto_7890 ) ) ( HOIST-AT ?auto_7888 ?auto_7883 ) ( not ( = ?auto_7886 ?auto_7888 ) ) ( SURFACE-AT ?auto_7882 ?auto_7883 ) ( ON ?auto_7882 ?auto_7887 ) ( CLEAR ?auto_7882 ) ( not ( = ?auto_7881 ?auto_7887 ) ) ( not ( = ?auto_7882 ?auto_7887 ) ) ( not ( = ?auto_7885 ?auto_7887 ) ) ( SURFACE-AT ?auto_7885 ?auto_7890 ) ( CLEAR ?auto_7885 ) ( IS-CRATE ?auto_7881 ) ( AVAILABLE ?auto_7886 ) ( AVAILABLE ?auto_7888 ) ( SURFACE-AT ?auto_7881 ?auto_7883 ) ( ON ?auto_7881 ?auto_7889 ) ( CLEAR ?auto_7881 ) ( not ( = ?auto_7881 ?auto_7889 ) ) ( not ( = ?auto_7882 ?auto_7889 ) ) ( not ( = ?auto_7885 ?auto_7889 ) ) ( not ( = ?auto_7887 ?auto_7889 ) ) ( TRUCK-AT ?auto_7884 ?auto_7890 ) )
    :subtasks
    ( ( !DRIVE ?auto_7884 ?auto_7890 ?auto_7883 )
      ( MAKE-2CRATE ?auto_7885 ?auto_7881 ?auto_7882 )
      ( MAKE-1CRATE-VERIFY ?auto_7881 ?auto_7882 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7891 - SURFACE
      ?auto_7892 - SURFACE
      ?auto_7893 - SURFACE
    )
    :vars
    (
      ?auto_7898 - HOIST
      ?auto_7894 - PLACE
      ?auto_7899 - PLACE
      ?auto_7897 - HOIST
      ?auto_7900 - SURFACE
      ?auto_7896 - SURFACE
      ?auto_7895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7898 ?auto_7894 ) ( IS-CRATE ?auto_7893 ) ( not ( = ?auto_7892 ?auto_7893 ) ) ( not ( = ?auto_7891 ?auto_7892 ) ) ( not ( = ?auto_7891 ?auto_7893 ) ) ( not ( = ?auto_7899 ?auto_7894 ) ) ( HOIST-AT ?auto_7897 ?auto_7899 ) ( not ( = ?auto_7898 ?auto_7897 ) ) ( SURFACE-AT ?auto_7893 ?auto_7899 ) ( ON ?auto_7893 ?auto_7900 ) ( CLEAR ?auto_7893 ) ( not ( = ?auto_7892 ?auto_7900 ) ) ( not ( = ?auto_7893 ?auto_7900 ) ) ( not ( = ?auto_7891 ?auto_7900 ) ) ( SURFACE-AT ?auto_7891 ?auto_7894 ) ( CLEAR ?auto_7891 ) ( IS-CRATE ?auto_7892 ) ( AVAILABLE ?auto_7898 ) ( AVAILABLE ?auto_7897 ) ( SURFACE-AT ?auto_7892 ?auto_7899 ) ( ON ?auto_7892 ?auto_7896 ) ( CLEAR ?auto_7892 ) ( not ( = ?auto_7892 ?auto_7896 ) ) ( not ( = ?auto_7893 ?auto_7896 ) ) ( not ( = ?auto_7891 ?auto_7896 ) ) ( not ( = ?auto_7900 ?auto_7896 ) ) ( TRUCK-AT ?auto_7895 ?auto_7894 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7892 ?auto_7893 )
      ( MAKE-2CRATE-VERIFY ?auto_7891 ?auto_7892 ?auto_7893 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7901 - SURFACE
      ?auto_7902 - SURFACE
      ?auto_7903 - SURFACE
      ?auto_7904 - SURFACE
    )
    :vars
    (
      ?auto_7905 - HOIST
      ?auto_7910 - PLACE
      ?auto_7909 - PLACE
      ?auto_7908 - HOIST
      ?auto_7907 - SURFACE
      ?auto_7906 - SURFACE
      ?auto_7911 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7905 ?auto_7910 ) ( IS-CRATE ?auto_7904 ) ( not ( = ?auto_7903 ?auto_7904 ) ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( not ( = ?auto_7902 ?auto_7904 ) ) ( not ( = ?auto_7909 ?auto_7910 ) ) ( HOIST-AT ?auto_7908 ?auto_7909 ) ( not ( = ?auto_7905 ?auto_7908 ) ) ( SURFACE-AT ?auto_7904 ?auto_7909 ) ( ON ?auto_7904 ?auto_7907 ) ( CLEAR ?auto_7904 ) ( not ( = ?auto_7903 ?auto_7907 ) ) ( not ( = ?auto_7904 ?auto_7907 ) ) ( not ( = ?auto_7902 ?auto_7907 ) ) ( SURFACE-AT ?auto_7902 ?auto_7910 ) ( CLEAR ?auto_7902 ) ( IS-CRATE ?auto_7903 ) ( AVAILABLE ?auto_7905 ) ( AVAILABLE ?auto_7908 ) ( SURFACE-AT ?auto_7903 ?auto_7909 ) ( ON ?auto_7903 ?auto_7906 ) ( CLEAR ?auto_7903 ) ( not ( = ?auto_7903 ?auto_7906 ) ) ( not ( = ?auto_7904 ?auto_7906 ) ) ( not ( = ?auto_7902 ?auto_7906 ) ) ( not ( = ?auto_7907 ?auto_7906 ) ) ( TRUCK-AT ?auto_7911 ?auto_7910 ) ( ON ?auto_7902 ?auto_7901 ) ( not ( = ?auto_7901 ?auto_7902 ) ) ( not ( = ?auto_7901 ?auto_7903 ) ) ( not ( = ?auto_7901 ?auto_7904 ) ) ( not ( = ?auto_7901 ?auto_7907 ) ) ( not ( = ?auto_7901 ?auto_7906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7902 ?auto_7903 ?auto_7904 )
      ( MAKE-3CRATE-VERIFY ?auto_7901 ?auto_7902 ?auto_7903 ?auto_7904 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7912 - SURFACE
      ?auto_7913 - SURFACE
    )
    :vars
    (
      ?auto_7914 - HOIST
      ?auto_7920 - PLACE
      ?auto_7918 - SURFACE
      ?auto_7919 - PLACE
      ?auto_7917 - HOIST
      ?auto_7916 - SURFACE
      ?auto_7915 - SURFACE
      ?auto_7921 - TRUCK
      ?auto_7922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7914 ?auto_7920 ) ( IS-CRATE ?auto_7913 ) ( not ( = ?auto_7912 ?auto_7913 ) ) ( not ( = ?auto_7918 ?auto_7912 ) ) ( not ( = ?auto_7918 ?auto_7913 ) ) ( not ( = ?auto_7919 ?auto_7920 ) ) ( HOIST-AT ?auto_7917 ?auto_7919 ) ( not ( = ?auto_7914 ?auto_7917 ) ) ( SURFACE-AT ?auto_7913 ?auto_7919 ) ( ON ?auto_7913 ?auto_7916 ) ( CLEAR ?auto_7913 ) ( not ( = ?auto_7912 ?auto_7916 ) ) ( not ( = ?auto_7913 ?auto_7916 ) ) ( not ( = ?auto_7918 ?auto_7916 ) ) ( IS-CRATE ?auto_7912 ) ( AVAILABLE ?auto_7917 ) ( SURFACE-AT ?auto_7912 ?auto_7919 ) ( ON ?auto_7912 ?auto_7915 ) ( CLEAR ?auto_7912 ) ( not ( = ?auto_7912 ?auto_7915 ) ) ( not ( = ?auto_7913 ?auto_7915 ) ) ( not ( = ?auto_7918 ?auto_7915 ) ) ( not ( = ?auto_7916 ?auto_7915 ) ) ( TRUCK-AT ?auto_7921 ?auto_7920 ) ( SURFACE-AT ?auto_7922 ?auto_7920 ) ( CLEAR ?auto_7922 ) ( LIFTING ?auto_7914 ?auto_7918 ) ( IS-CRATE ?auto_7918 ) ( not ( = ?auto_7922 ?auto_7918 ) ) ( not ( = ?auto_7912 ?auto_7922 ) ) ( not ( = ?auto_7913 ?auto_7922 ) ) ( not ( = ?auto_7916 ?auto_7922 ) ) ( not ( = ?auto_7915 ?auto_7922 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7922 ?auto_7918 )
      ( MAKE-2CRATE ?auto_7918 ?auto_7912 ?auto_7913 )
      ( MAKE-1CRATE-VERIFY ?auto_7912 ?auto_7913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7923 - SURFACE
      ?auto_7924 - SURFACE
      ?auto_7925 - SURFACE
    )
    :vars
    (
      ?auto_7927 - HOIST
      ?auto_7926 - PLACE
      ?auto_7929 - PLACE
      ?auto_7932 - HOIST
      ?auto_7928 - SURFACE
      ?auto_7930 - SURFACE
      ?auto_7931 - TRUCK
      ?auto_7933 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7927 ?auto_7926 ) ( IS-CRATE ?auto_7925 ) ( not ( = ?auto_7924 ?auto_7925 ) ) ( not ( = ?auto_7923 ?auto_7924 ) ) ( not ( = ?auto_7923 ?auto_7925 ) ) ( not ( = ?auto_7929 ?auto_7926 ) ) ( HOIST-AT ?auto_7932 ?auto_7929 ) ( not ( = ?auto_7927 ?auto_7932 ) ) ( SURFACE-AT ?auto_7925 ?auto_7929 ) ( ON ?auto_7925 ?auto_7928 ) ( CLEAR ?auto_7925 ) ( not ( = ?auto_7924 ?auto_7928 ) ) ( not ( = ?auto_7925 ?auto_7928 ) ) ( not ( = ?auto_7923 ?auto_7928 ) ) ( IS-CRATE ?auto_7924 ) ( AVAILABLE ?auto_7932 ) ( SURFACE-AT ?auto_7924 ?auto_7929 ) ( ON ?auto_7924 ?auto_7930 ) ( CLEAR ?auto_7924 ) ( not ( = ?auto_7924 ?auto_7930 ) ) ( not ( = ?auto_7925 ?auto_7930 ) ) ( not ( = ?auto_7923 ?auto_7930 ) ) ( not ( = ?auto_7928 ?auto_7930 ) ) ( TRUCK-AT ?auto_7931 ?auto_7926 ) ( SURFACE-AT ?auto_7933 ?auto_7926 ) ( CLEAR ?auto_7933 ) ( LIFTING ?auto_7927 ?auto_7923 ) ( IS-CRATE ?auto_7923 ) ( not ( = ?auto_7933 ?auto_7923 ) ) ( not ( = ?auto_7924 ?auto_7933 ) ) ( not ( = ?auto_7925 ?auto_7933 ) ) ( not ( = ?auto_7928 ?auto_7933 ) ) ( not ( = ?auto_7930 ?auto_7933 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7924 ?auto_7925 )
      ( MAKE-2CRATE-VERIFY ?auto_7923 ?auto_7924 ?auto_7925 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7934 - SURFACE
      ?auto_7935 - SURFACE
      ?auto_7936 - SURFACE
      ?auto_7937 - SURFACE
    )
    :vars
    (
      ?auto_7938 - HOIST
      ?auto_7940 - PLACE
      ?auto_7939 - PLACE
      ?auto_7943 - HOIST
      ?auto_7944 - SURFACE
      ?auto_7942 - SURFACE
      ?auto_7941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7938 ?auto_7940 ) ( IS-CRATE ?auto_7937 ) ( not ( = ?auto_7936 ?auto_7937 ) ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7937 ) ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( HOIST-AT ?auto_7943 ?auto_7939 ) ( not ( = ?auto_7938 ?auto_7943 ) ) ( SURFACE-AT ?auto_7937 ?auto_7939 ) ( ON ?auto_7937 ?auto_7944 ) ( CLEAR ?auto_7937 ) ( not ( = ?auto_7936 ?auto_7944 ) ) ( not ( = ?auto_7937 ?auto_7944 ) ) ( not ( = ?auto_7935 ?auto_7944 ) ) ( IS-CRATE ?auto_7936 ) ( AVAILABLE ?auto_7943 ) ( SURFACE-AT ?auto_7936 ?auto_7939 ) ( ON ?auto_7936 ?auto_7942 ) ( CLEAR ?auto_7936 ) ( not ( = ?auto_7936 ?auto_7942 ) ) ( not ( = ?auto_7937 ?auto_7942 ) ) ( not ( = ?auto_7935 ?auto_7942 ) ) ( not ( = ?auto_7944 ?auto_7942 ) ) ( TRUCK-AT ?auto_7941 ?auto_7940 ) ( SURFACE-AT ?auto_7934 ?auto_7940 ) ( CLEAR ?auto_7934 ) ( LIFTING ?auto_7938 ?auto_7935 ) ( IS-CRATE ?auto_7935 ) ( not ( = ?auto_7934 ?auto_7935 ) ) ( not ( = ?auto_7936 ?auto_7934 ) ) ( not ( = ?auto_7937 ?auto_7934 ) ) ( not ( = ?auto_7944 ?auto_7934 ) ) ( not ( = ?auto_7942 ?auto_7934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7935 ?auto_7936 ?auto_7937 )
      ( MAKE-3CRATE-VERIFY ?auto_7934 ?auto_7935 ?auto_7936 ?auto_7937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7945 - SURFACE
      ?auto_7946 - SURFACE
    )
    :vars
    (
      ?auto_7948 - HOIST
      ?auto_7951 - PLACE
      ?auto_7949 - SURFACE
      ?auto_7950 - PLACE
      ?auto_7954 - HOIST
      ?auto_7955 - SURFACE
      ?auto_7953 - SURFACE
      ?auto_7952 - TRUCK
      ?auto_7947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7948 ?auto_7951 ) ( IS-CRATE ?auto_7946 ) ( not ( = ?auto_7945 ?auto_7946 ) ) ( not ( = ?auto_7949 ?auto_7945 ) ) ( not ( = ?auto_7949 ?auto_7946 ) ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( HOIST-AT ?auto_7954 ?auto_7950 ) ( not ( = ?auto_7948 ?auto_7954 ) ) ( SURFACE-AT ?auto_7946 ?auto_7950 ) ( ON ?auto_7946 ?auto_7955 ) ( CLEAR ?auto_7946 ) ( not ( = ?auto_7945 ?auto_7955 ) ) ( not ( = ?auto_7946 ?auto_7955 ) ) ( not ( = ?auto_7949 ?auto_7955 ) ) ( IS-CRATE ?auto_7945 ) ( AVAILABLE ?auto_7954 ) ( SURFACE-AT ?auto_7945 ?auto_7950 ) ( ON ?auto_7945 ?auto_7953 ) ( CLEAR ?auto_7945 ) ( not ( = ?auto_7945 ?auto_7953 ) ) ( not ( = ?auto_7946 ?auto_7953 ) ) ( not ( = ?auto_7949 ?auto_7953 ) ) ( not ( = ?auto_7955 ?auto_7953 ) ) ( TRUCK-AT ?auto_7952 ?auto_7951 ) ( SURFACE-AT ?auto_7947 ?auto_7951 ) ( CLEAR ?auto_7947 ) ( IS-CRATE ?auto_7949 ) ( not ( = ?auto_7947 ?auto_7949 ) ) ( not ( = ?auto_7945 ?auto_7947 ) ) ( not ( = ?auto_7946 ?auto_7947 ) ) ( not ( = ?auto_7955 ?auto_7947 ) ) ( not ( = ?auto_7953 ?auto_7947 ) ) ( AVAILABLE ?auto_7948 ) ( IN ?auto_7949 ?auto_7952 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7948 ?auto_7949 ?auto_7952 ?auto_7951 )
      ( MAKE-2CRATE ?auto_7949 ?auto_7945 ?auto_7946 )
      ( MAKE-1CRATE-VERIFY ?auto_7945 ?auto_7946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7956 - SURFACE
      ?auto_7957 - SURFACE
      ?auto_7958 - SURFACE
    )
    :vars
    (
      ?auto_7963 - HOIST
      ?auto_7965 - PLACE
      ?auto_7962 - PLACE
      ?auto_7960 - HOIST
      ?auto_7964 - SURFACE
      ?auto_7961 - SURFACE
      ?auto_7966 - TRUCK
      ?auto_7959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7963 ?auto_7965 ) ( IS-CRATE ?auto_7958 ) ( not ( = ?auto_7957 ?auto_7958 ) ) ( not ( = ?auto_7956 ?auto_7957 ) ) ( not ( = ?auto_7956 ?auto_7958 ) ) ( not ( = ?auto_7962 ?auto_7965 ) ) ( HOIST-AT ?auto_7960 ?auto_7962 ) ( not ( = ?auto_7963 ?auto_7960 ) ) ( SURFACE-AT ?auto_7958 ?auto_7962 ) ( ON ?auto_7958 ?auto_7964 ) ( CLEAR ?auto_7958 ) ( not ( = ?auto_7957 ?auto_7964 ) ) ( not ( = ?auto_7958 ?auto_7964 ) ) ( not ( = ?auto_7956 ?auto_7964 ) ) ( IS-CRATE ?auto_7957 ) ( AVAILABLE ?auto_7960 ) ( SURFACE-AT ?auto_7957 ?auto_7962 ) ( ON ?auto_7957 ?auto_7961 ) ( CLEAR ?auto_7957 ) ( not ( = ?auto_7957 ?auto_7961 ) ) ( not ( = ?auto_7958 ?auto_7961 ) ) ( not ( = ?auto_7956 ?auto_7961 ) ) ( not ( = ?auto_7964 ?auto_7961 ) ) ( TRUCK-AT ?auto_7966 ?auto_7965 ) ( SURFACE-AT ?auto_7959 ?auto_7965 ) ( CLEAR ?auto_7959 ) ( IS-CRATE ?auto_7956 ) ( not ( = ?auto_7959 ?auto_7956 ) ) ( not ( = ?auto_7957 ?auto_7959 ) ) ( not ( = ?auto_7958 ?auto_7959 ) ) ( not ( = ?auto_7964 ?auto_7959 ) ) ( not ( = ?auto_7961 ?auto_7959 ) ) ( AVAILABLE ?auto_7963 ) ( IN ?auto_7956 ?auto_7966 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7957 ?auto_7958 )
      ( MAKE-2CRATE-VERIFY ?auto_7956 ?auto_7957 ?auto_7958 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7967 - SURFACE
      ?auto_7968 - SURFACE
      ?auto_7969 - SURFACE
      ?auto_7970 - SURFACE
    )
    :vars
    (
      ?auto_7972 - HOIST
      ?auto_7976 - PLACE
      ?auto_7975 - PLACE
      ?auto_7971 - HOIST
      ?auto_7973 - SURFACE
      ?auto_7974 - SURFACE
      ?auto_7977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7972 ?auto_7976 ) ( IS-CRATE ?auto_7970 ) ( not ( = ?auto_7969 ?auto_7970 ) ) ( not ( = ?auto_7968 ?auto_7969 ) ) ( not ( = ?auto_7968 ?auto_7970 ) ) ( not ( = ?auto_7975 ?auto_7976 ) ) ( HOIST-AT ?auto_7971 ?auto_7975 ) ( not ( = ?auto_7972 ?auto_7971 ) ) ( SURFACE-AT ?auto_7970 ?auto_7975 ) ( ON ?auto_7970 ?auto_7973 ) ( CLEAR ?auto_7970 ) ( not ( = ?auto_7969 ?auto_7973 ) ) ( not ( = ?auto_7970 ?auto_7973 ) ) ( not ( = ?auto_7968 ?auto_7973 ) ) ( IS-CRATE ?auto_7969 ) ( AVAILABLE ?auto_7971 ) ( SURFACE-AT ?auto_7969 ?auto_7975 ) ( ON ?auto_7969 ?auto_7974 ) ( CLEAR ?auto_7969 ) ( not ( = ?auto_7969 ?auto_7974 ) ) ( not ( = ?auto_7970 ?auto_7974 ) ) ( not ( = ?auto_7968 ?auto_7974 ) ) ( not ( = ?auto_7973 ?auto_7974 ) ) ( TRUCK-AT ?auto_7977 ?auto_7976 ) ( SURFACE-AT ?auto_7967 ?auto_7976 ) ( CLEAR ?auto_7967 ) ( IS-CRATE ?auto_7968 ) ( not ( = ?auto_7967 ?auto_7968 ) ) ( not ( = ?auto_7969 ?auto_7967 ) ) ( not ( = ?auto_7970 ?auto_7967 ) ) ( not ( = ?auto_7973 ?auto_7967 ) ) ( not ( = ?auto_7974 ?auto_7967 ) ) ( AVAILABLE ?auto_7972 ) ( IN ?auto_7968 ?auto_7977 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7968 ?auto_7969 ?auto_7970 )
      ( MAKE-3CRATE-VERIFY ?auto_7967 ?auto_7968 ?auto_7969 ?auto_7970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7978 - SURFACE
      ?auto_7979 - SURFACE
    )
    :vars
    (
      ?auto_7981 - HOIST
      ?auto_7986 - PLACE
      ?auto_7982 - SURFACE
      ?auto_7985 - PLACE
      ?auto_7980 - HOIST
      ?auto_7983 - SURFACE
      ?auto_7984 - SURFACE
      ?auto_7987 - SURFACE
      ?auto_7988 - TRUCK
      ?auto_7989 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7981 ?auto_7986 ) ( IS-CRATE ?auto_7979 ) ( not ( = ?auto_7978 ?auto_7979 ) ) ( not ( = ?auto_7982 ?auto_7978 ) ) ( not ( = ?auto_7982 ?auto_7979 ) ) ( not ( = ?auto_7985 ?auto_7986 ) ) ( HOIST-AT ?auto_7980 ?auto_7985 ) ( not ( = ?auto_7981 ?auto_7980 ) ) ( SURFACE-AT ?auto_7979 ?auto_7985 ) ( ON ?auto_7979 ?auto_7983 ) ( CLEAR ?auto_7979 ) ( not ( = ?auto_7978 ?auto_7983 ) ) ( not ( = ?auto_7979 ?auto_7983 ) ) ( not ( = ?auto_7982 ?auto_7983 ) ) ( IS-CRATE ?auto_7978 ) ( AVAILABLE ?auto_7980 ) ( SURFACE-AT ?auto_7978 ?auto_7985 ) ( ON ?auto_7978 ?auto_7984 ) ( CLEAR ?auto_7978 ) ( not ( = ?auto_7978 ?auto_7984 ) ) ( not ( = ?auto_7979 ?auto_7984 ) ) ( not ( = ?auto_7982 ?auto_7984 ) ) ( not ( = ?auto_7983 ?auto_7984 ) ) ( SURFACE-AT ?auto_7987 ?auto_7986 ) ( CLEAR ?auto_7987 ) ( IS-CRATE ?auto_7982 ) ( not ( = ?auto_7987 ?auto_7982 ) ) ( not ( = ?auto_7978 ?auto_7987 ) ) ( not ( = ?auto_7979 ?auto_7987 ) ) ( not ( = ?auto_7983 ?auto_7987 ) ) ( not ( = ?auto_7984 ?auto_7987 ) ) ( AVAILABLE ?auto_7981 ) ( IN ?auto_7982 ?auto_7988 ) ( TRUCK-AT ?auto_7988 ?auto_7989 ) ( not ( = ?auto_7989 ?auto_7986 ) ) ( not ( = ?auto_7985 ?auto_7989 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7988 ?auto_7989 ?auto_7986 )
      ( MAKE-2CRATE ?auto_7982 ?auto_7978 ?auto_7979 )
      ( MAKE-1CRATE-VERIFY ?auto_7978 ?auto_7979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7990 - SURFACE
      ?auto_7991 - SURFACE
      ?auto_7992 - SURFACE
    )
    :vars
    (
      ?auto_8001 - HOIST
      ?auto_7994 - PLACE
      ?auto_7998 - PLACE
      ?auto_7995 - HOIST
      ?auto_7996 - SURFACE
      ?auto_7997 - SURFACE
      ?auto_7999 - SURFACE
      ?auto_7993 - TRUCK
      ?auto_8000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8001 ?auto_7994 ) ( IS-CRATE ?auto_7992 ) ( not ( = ?auto_7991 ?auto_7992 ) ) ( not ( = ?auto_7990 ?auto_7991 ) ) ( not ( = ?auto_7990 ?auto_7992 ) ) ( not ( = ?auto_7998 ?auto_7994 ) ) ( HOIST-AT ?auto_7995 ?auto_7998 ) ( not ( = ?auto_8001 ?auto_7995 ) ) ( SURFACE-AT ?auto_7992 ?auto_7998 ) ( ON ?auto_7992 ?auto_7996 ) ( CLEAR ?auto_7992 ) ( not ( = ?auto_7991 ?auto_7996 ) ) ( not ( = ?auto_7992 ?auto_7996 ) ) ( not ( = ?auto_7990 ?auto_7996 ) ) ( IS-CRATE ?auto_7991 ) ( AVAILABLE ?auto_7995 ) ( SURFACE-AT ?auto_7991 ?auto_7998 ) ( ON ?auto_7991 ?auto_7997 ) ( CLEAR ?auto_7991 ) ( not ( = ?auto_7991 ?auto_7997 ) ) ( not ( = ?auto_7992 ?auto_7997 ) ) ( not ( = ?auto_7990 ?auto_7997 ) ) ( not ( = ?auto_7996 ?auto_7997 ) ) ( SURFACE-AT ?auto_7999 ?auto_7994 ) ( CLEAR ?auto_7999 ) ( IS-CRATE ?auto_7990 ) ( not ( = ?auto_7999 ?auto_7990 ) ) ( not ( = ?auto_7991 ?auto_7999 ) ) ( not ( = ?auto_7992 ?auto_7999 ) ) ( not ( = ?auto_7996 ?auto_7999 ) ) ( not ( = ?auto_7997 ?auto_7999 ) ) ( AVAILABLE ?auto_8001 ) ( IN ?auto_7990 ?auto_7993 ) ( TRUCK-AT ?auto_7993 ?auto_8000 ) ( not ( = ?auto_8000 ?auto_7994 ) ) ( not ( = ?auto_7998 ?auto_8000 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7991 ?auto_7992 )
      ( MAKE-2CRATE-VERIFY ?auto_7990 ?auto_7991 ?auto_7992 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8002 - SURFACE
      ?auto_8003 - SURFACE
      ?auto_8004 - SURFACE
      ?auto_8005 - SURFACE
    )
    :vars
    (
      ?auto_8013 - HOIST
      ?auto_8012 - PLACE
      ?auto_8011 - PLACE
      ?auto_8008 - HOIST
      ?auto_8009 - SURFACE
      ?auto_8006 - SURFACE
      ?auto_8007 - TRUCK
      ?auto_8010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8013 ?auto_8012 ) ( IS-CRATE ?auto_8005 ) ( not ( = ?auto_8004 ?auto_8005 ) ) ( not ( = ?auto_8003 ?auto_8004 ) ) ( not ( = ?auto_8003 ?auto_8005 ) ) ( not ( = ?auto_8011 ?auto_8012 ) ) ( HOIST-AT ?auto_8008 ?auto_8011 ) ( not ( = ?auto_8013 ?auto_8008 ) ) ( SURFACE-AT ?auto_8005 ?auto_8011 ) ( ON ?auto_8005 ?auto_8009 ) ( CLEAR ?auto_8005 ) ( not ( = ?auto_8004 ?auto_8009 ) ) ( not ( = ?auto_8005 ?auto_8009 ) ) ( not ( = ?auto_8003 ?auto_8009 ) ) ( IS-CRATE ?auto_8004 ) ( AVAILABLE ?auto_8008 ) ( SURFACE-AT ?auto_8004 ?auto_8011 ) ( ON ?auto_8004 ?auto_8006 ) ( CLEAR ?auto_8004 ) ( not ( = ?auto_8004 ?auto_8006 ) ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8003 ?auto_8006 ) ) ( not ( = ?auto_8009 ?auto_8006 ) ) ( SURFACE-AT ?auto_8002 ?auto_8012 ) ( CLEAR ?auto_8002 ) ( IS-CRATE ?auto_8003 ) ( not ( = ?auto_8002 ?auto_8003 ) ) ( not ( = ?auto_8004 ?auto_8002 ) ) ( not ( = ?auto_8005 ?auto_8002 ) ) ( not ( = ?auto_8009 ?auto_8002 ) ) ( not ( = ?auto_8006 ?auto_8002 ) ) ( AVAILABLE ?auto_8013 ) ( IN ?auto_8003 ?auto_8007 ) ( TRUCK-AT ?auto_8007 ?auto_8010 ) ( not ( = ?auto_8010 ?auto_8012 ) ) ( not ( = ?auto_8011 ?auto_8010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8003 ?auto_8004 ?auto_8005 )
      ( MAKE-3CRATE-VERIFY ?auto_8002 ?auto_8003 ?auto_8004 ?auto_8005 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8014 - SURFACE
      ?auto_8015 - SURFACE
    )
    :vars
    (
      ?auto_8025 - HOIST
      ?auto_8024 - PLACE
      ?auto_8020 - SURFACE
      ?auto_8023 - PLACE
      ?auto_8018 - HOIST
      ?auto_8019 - SURFACE
      ?auto_8016 - SURFACE
      ?auto_8021 - SURFACE
      ?auto_8017 - TRUCK
      ?auto_8022 - PLACE
      ?auto_8026 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8025 ?auto_8024 ) ( IS-CRATE ?auto_8015 ) ( not ( = ?auto_8014 ?auto_8015 ) ) ( not ( = ?auto_8020 ?auto_8014 ) ) ( not ( = ?auto_8020 ?auto_8015 ) ) ( not ( = ?auto_8023 ?auto_8024 ) ) ( HOIST-AT ?auto_8018 ?auto_8023 ) ( not ( = ?auto_8025 ?auto_8018 ) ) ( SURFACE-AT ?auto_8015 ?auto_8023 ) ( ON ?auto_8015 ?auto_8019 ) ( CLEAR ?auto_8015 ) ( not ( = ?auto_8014 ?auto_8019 ) ) ( not ( = ?auto_8015 ?auto_8019 ) ) ( not ( = ?auto_8020 ?auto_8019 ) ) ( IS-CRATE ?auto_8014 ) ( AVAILABLE ?auto_8018 ) ( SURFACE-AT ?auto_8014 ?auto_8023 ) ( ON ?auto_8014 ?auto_8016 ) ( CLEAR ?auto_8014 ) ( not ( = ?auto_8014 ?auto_8016 ) ) ( not ( = ?auto_8015 ?auto_8016 ) ) ( not ( = ?auto_8020 ?auto_8016 ) ) ( not ( = ?auto_8019 ?auto_8016 ) ) ( SURFACE-AT ?auto_8021 ?auto_8024 ) ( CLEAR ?auto_8021 ) ( IS-CRATE ?auto_8020 ) ( not ( = ?auto_8021 ?auto_8020 ) ) ( not ( = ?auto_8014 ?auto_8021 ) ) ( not ( = ?auto_8015 ?auto_8021 ) ) ( not ( = ?auto_8019 ?auto_8021 ) ) ( not ( = ?auto_8016 ?auto_8021 ) ) ( AVAILABLE ?auto_8025 ) ( TRUCK-AT ?auto_8017 ?auto_8022 ) ( not ( = ?auto_8022 ?auto_8024 ) ) ( not ( = ?auto_8023 ?auto_8022 ) ) ( HOIST-AT ?auto_8026 ?auto_8022 ) ( LIFTING ?auto_8026 ?auto_8020 ) ( not ( = ?auto_8025 ?auto_8026 ) ) ( not ( = ?auto_8018 ?auto_8026 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8026 ?auto_8020 ?auto_8017 ?auto_8022 )
      ( MAKE-2CRATE ?auto_8020 ?auto_8014 ?auto_8015 )
      ( MAKE-1CRATE-VERIFY ?auto_8014 ?auto_8015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8027 - SURFACE
      ?auto_8028 - SURFACE
      ?auto_8029 - SURFACE
    )
    :vars
    (
      ?auto_8037 - HOIST
      ?auto_8036 - PLACE
      ?auto_8031 - PLACE
      ?auto_8030 - HOIST
      ?auto_8032 - SURFACE
      ?auto_8034 - SURFACE
      ?auto_8039 - SURFACE
      ?auto_8038 - TRUCK
      ?auto_8035 - PLACE
      ?auto_8033 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8037 ?auto_8036 ) ( IS-CRATE ?auto_8029 ) ( not ( = ?auto_8028 ?auto_8029 ) ) ( not ( = ?auto_8027 ?auto_8028 ) ) ( not ( = ?auto_8027 ?auto_8029 ) ) ( not ( = ?auto_8031 ?auto_8036 ) ) ( HOIST-AT ?auto_8030 ?auto_8031 ) ( not ( = ?auto_8037 ?auto_8030 ) ) ( SURFACE-AT ?auto_8029 ?auto_8031 ) ( ON ?auto_8029 ?auto_8032 ) ( CLEAR ?auto_8029 ) ( not ( = ?auto_8028 ?auto_8032 ) ) ( not ( = ?auto_8029 ?auto_8032 ) ) ( not ( = ?auto_8027 ?auto_8032 ) ) ( IS-CRATE ?auto_8028 ) ( AVAILABLE ?auto_8030 ) ( SURFACE-AT ?auto_8028 ?auto_8031 ) ( ON ?auto_8028 ?auto_8034 ) ( CLEAR ?auto_8028 ) ( not ( = ?auto_8028 ?auto_8034 ) ) ( not ( = ?auto_8029 ?auto_8034 ) ) ( not ( = ?auto_8027 ?auto_8034 ) ) ( not ( = ?auto_8032 ?auto_8034 ) ) ( SURFACE-AT ?auto_8039 ?auto_8036 ) ( CLEAR ?auto_8039 ) ( IS-CRATE ?auto_8027 ) ( not ( = ?auto_8039 ?auto_8027 ) ) ( not ( = ?auto_8028 ?auto_8039 ) ) ( not ( = ?auto_8029 ?auto_8039 ) ) ( not ( = ?auto_8032 ?auto_8039 ) ) ( not ( = ?auto_8034 ?auto_8039 ) ) ( AVAILABLE ?auto_8037 ) ( TRUCK-AT ?auto_8038 ?auto_8035 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8031 ?auto_8035 ) ) ( HOIST-AT ?auto_8033 ?auto_8035 ) ( LIFTING ?auto_8033 ?auto_8027 ) ( not ( = ?auto_8037 ?auto_8033 ) ) ( not ( = ?auto_8030 ?auto_8033 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8028 ?auto_8029 )
      ( MAKE-2CRATE-VERIFY ?auto_8027 ?auto_8028 ?auto_8029 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8040 - SURFACE
      ?auto_8041 - SURFACE
      ?auto_8042 - SURFACE
      ?auto_8043 - SURFACE
    )
    :vars
    (
      ?auto_8044 - HOIST
      ?auto_8046 - PLACE
      ?auto_8049 - PLACE
      ?auto_8050 - HOIST
      ?auto_8047 - SURFACE
      ?auto_8052 - SURFACE
      ?auto_8048 - TRUCK
      ?auto_8051 - PLACE
      ?auto_8045 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8044 ?auto_8046 ) ( IS-CRATE ?auto_8043 ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8041 ?auto_8042 ) ) ( not ( = ?auto_8041 ?auto_8043 ) ) ( not ( = ?auto_8049 ?auto_8046 ) ) ( HOIST-AT ?auto_8050 ?auto_8049 ) ( not ( = ?auto_8044 ?auto_8050 ) ) ( SURFACE-AT ?auto_8043 ?auto_8049 ) ( ON ?auto_8043 ?auto_8047 ) ( CLEAR ?auto_8043 ) ( not ( = ?auto_8042 ?auto_8047 ) ) ( not ( = ?auto_8043 ?auto_8047 ) ) ( not ( = ?auto_8041 ?auto_8047 ) ) ( IS-CRATE ?auto_8042 ) ( AVAILABLE ?auto_8050 ) ( SURFACE-AT ?auto_8042 ?auto_8049 ) ( ON ?auto_8042 ?auto_8052 ) ( CLEAR ?auto_8042 ) ( not ( = ?auto_8042 ?auto_8052 ) ) ( not ( = ?auto_8043 ?auto_8052 ) ) ( not ( = ?auto_8041 ?auto_8052 ) ) ( not ( = ?auto_8047 ?auto_8052 ) ) ( SURFACE-AT ?auto_8040 ?auto_8046 ) ( CLEAR ?auto_8040 ) ( IS-CRATE ?auto_8041 ) ( not ( = ?auto_8040 ?auto_8041 ) ) ( not ( = ?auto_8042 ?auto_8040 ) ) ( not ( = ?auto_8043 ?auto_8040 ) ) ( not ( = ?auto_8047 ?auto_8040 ) ) ( not ( = ?auto_8052 ?auto_8040 ) ) ( AVAILABLE ?auto_8044 ) ( TRUCK-AT ?auto_8048 ?auto_8051 ) ( not ( = ?auto_8051 ?auto_8046 ) ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( HOIST-AT ?auto_8045 ?auto_8051 ) ( LIFTING ?auto_8045 ?auto_8041 ) ( not ( = ?auto_8044 ?auto_8045 ) ) ( not ( = ?auto_8050 ?auto_8045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8041 ?auto_8042 ?auto_8043 )
      ( MAKE-3CRATE-VERIFY ?auto_8040 ?auto_8041 ?auto_8042 ?auto_8043 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8053 - SURFACE
      ?auto_8054 - SURFACE
    )
    :vars
    (
      ?auto_8056 - HOIST
      ?auto_8059 - PLACE
      ?auto_8055 - SURFACE
      ?auto_8062 - PLACE
      ?auto_8063 - HOIST
      ?auto_8060 - SURFACE
      ?auto_8065 - SURFACE
      ?auto_8057 - SURFACE
      ?auto_8061 - TRUCK
      ?auto_8064 - PLACE
      ?auto_8058 - HOIST
      ?auto_8066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8056 ?auto_8059 ) ( IS-CRATE ?auto_8054 ) ( not ( = ?auto_8053 ?auto_8054 ) ) ( not ( = ?auto_8055 ?auto_8053 ) ) ( not ( = ?auto_8055 ?auto_8054 ) ) ( not ( = ?auto_8062 ?auto_8059 ) ) ( HOIST-AT ?auto_8063 ?auto_8062 ) ( not ( = ?auto_8056 ?auto_8063 ) ) ( SURFACE-AT ?auto_8054 ?auto_8062 ) ( ON ?auto_8054 ?auto_8060 ) ( CLEAR ?auto_8054 ) ( not ( = ?auto_8053 ?auto_8060 ) ) ( not ( = ?auto_8054 ?auto_8060 ) ) ( not ( = ?auto_8055 ?auto_8060 ) ) ( IS-CRATE ?auto_8053 ) ( AVAILABLE ?auto_8063 ) ( SURFACE-AT ?auto_8053 ?auto_8062 ) ( ON ?auto_8053 ?auto_8065 ) ( CLEAR ?auto_8053 ) ( not ( = ?auto_8053 ?auto_8065 ) ) ( not ( = ?auto_8054 ?auto_8065 ) ) ( not ( = ?auto_8055 ?auto_8065 ) ) ( not ( = ?auto_8060 ?auto_8065 ) ) ( SURFACE-AT ?auto_8057 ?auto_8059 ) ( CLEAR ?auto_8057 ) ( IS-CRATE ?auto_8055 ) ( not ( = ?auto_8057 ?auto_8055 ) ) ( not ( = ?auto_8053 ?auto_8057 ) ) ( not ( = ?auto_8054 ?auto_8057 ) ) ( not ( = ?auto_8060 ?auto_8057 ) ) ( not ( = ?auto_8065 ?auto_8057 ) ) ( AVAILABLE ?auto_8056 ) ( TRUCK-AT ?auto_8061 ?auto_8064 ) ( not ( = ?auto_8064 ?auto_8059 ) ) ( not ( = ?auto_8062 ?auto_8064 ) ) ( HOIST-AT ?auto_8058 ?auto_8064 ) ( not ( = ?auto_8056 ?auto_8058 ) ) ( not ( = ?auto_8063 ?auto_8058 ) ) ( AVAILABLE ?auto_8058 ) ( SURFACE-AT ?auto_8055 ?auto_8064 ) ( ON ?auto_8055 ?auto_8066 ) ( CLEAR ?auto_8055 ) ( not ( = ?auto_8053 ?auto_8066 ) ) ( not ( = ?auto_8054 ?auto_8066 ) ) ( not ( = ?auto_8055 ?auto_8066 ) ) ( not ( = ?auto_8060 ?auto_8066 ) ) ( not ( = ?auto_8065 ?auto_8066 ) ) ( not ( = ?auto_8057 ?auto_8066 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8058 ?auto_8055 ?auto_8066 ?auto_8064 )
      ( MAKE-2CRATE ?auto_8055 ?auto_8053 ?auto_8054 )
      ( MAKE-1CRATE-VERIFY ?auto_8053 ?auto_8054 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8067 - SURFACE
      ?auto_8068 - SURFACE
      ?auto_8069 - SURFACE
    )
    :vars
    (
      ?auto_8077 - HOIST
      ?auto_8080 - PLACE
      ?auto_8074 - PLACE
      ?auto_8078 - HOIST
      ?auto_8072 - SURFACE
      ?auto_8070 - SURFACE
      ?auto_8079 - SURFACE
      ?auto_8071 - TRUCK
      ?auto_8076 - PLACE
      ?auto_8073 - HOIST
      ?auto_8075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8077 ?auto_8080 ) ( IS-CRATE ?auto_8069 ) ( not ( = ?auto_8068 ?auto_8069 ) ) ( not ( = ?auto_8067 ?auto_8068 ) ) ( not ( = ?auto_8067 ?auto_8069 ) ) ( not ( = ?auto_8074 ?auto_8080 ) ) ( HOIST-AT ?auto_8078 ?auto_8074 ) ( not ( = ?auto_8077 ?auto_8078 ) ) ( SURFACE-AT ?auto_8069 ?auto_8074 ) ( ON ?auto_8069 ?auto_8072 ) ( CLEAR ?auto_8069 ) ( not ( = ?auto_8068 ?auto_8072 ) ) ( not ( = ?auto_8069 ?auto_8072 ) ) ( not ( = ?auto_8067 ?auto_8072 ) ) ( IS-CRATE ?auto_8068 ) ( AVAILABLE ?auto_8078 ) ( SURFACE-AT ?auto_8068 ?auto_8074 ) ( ON ?auto_8068 ?auto_8070 ) ( CLEAR ?auto_8068 ) ( not ( = ?auto_8068 ?auto_8070 ) ) ( not ( = ?auto_8069 ?auto_8070 ) ) ( not ( = ?auto_8067 ?auto_8070 ) ) ( not ( = ?auto_8072 ?auto_8070 ) ) ( SURFACE-AT ?auto_8079 ?auto_8080 ) ( CLEAR ?auto_8079 ) ( IS-CRATE ?auto_8067 ) ( not ( = ?auto_8079 ?auto_8067 ) ) ( not ( = ?auto_8068 ?auto_8079 ) ) ( not ( = ?auto_8069 ?auto_8079 ) ) ( not ( = ?auto_8072 ?auto_8079 ) ) ( not ( = ?auto_8070 ?auto_8079 ) ) ( AVAILABLE ?auto_8077 ) ( TRUCK-AT ?auto_8071 ?auto_8076 ) ( not ( = ?auto_8076 ?auto_8080 ) ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( HOIST-AT ?auto_8073 ?auto_8076 ) ( not ( = ?auto_8077 ?auto_8073 ) ) ( not ( = ?auto_8078 ?auto_8073 ) ) ( AVAILABLE ?auto_8073 ) ( SURFACE-AT ?auto_8067 ?auto_8076 ) ( ON ?auto_8067 ?auto_8075 ) ( CLEAR ?auto_8067 ) ( not ( = ?auto_8068 ?auto_8075 ) ) ( not ( = ?auto_8069 ?auto_8075 ) ) ( not ( = ?auto_8067 ?auto_8075 ) ) ( not ( = ?auto_8072 ?auto_8075 ) ) ( not ( = ?auto_8070 ?auto_8075 ) ) ( not ( = ?auto_8079 ?auto_8075 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8068 ?auto_8069 )
      ( MAKE-2CRATE-VERIFY ?auto_8067 ?auto_8068 ?auto_8069 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8081 - SURFACE
      ?auto_8082 - SURFACE
      ?auto_8083 - SURFACE
      ?auto_8084 - SURFACE
    )
    :vars
    (
      ?auto_8090 - HOIST
      ?auto_8088 - PLACE
      ?auto_8092 - PLACE
      ?auto_8087 - HOIST
      ?auto_8091 - SURFACE
      ?auto_8093 - SURFACE
      ?auto_8089 - TRUCK
      ?auto_8086 - PLACE
      ?auto_8094 - HOIST
      ?auto_8085 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8090 ?auto_8088 ) ( IS-CRATE ?auto_8084 ) ( not ( = ?auto_8083 ?auto_8084 ) ) ( not ( = ?auto_8082 ?auto_8083 ) ) ( not ( = ?auto_8082 ?auto_8084 ) ) ( not ( = ?auto_8092 ?auto_8088 ) ) ( HOIST-AT ?auto_8087 ?auto_8092 ) ( not ( = ?auto_8090 ?auto_8087 ) ) ( SURFACE-AT ?auto_8084 ?auto_8092 ) ( ON ?auto_8084 ?auto_8091 ) ( CLEAR ?auto_8084 ) ( not ( = ?auto_8083 ?auto_8091 ) ) ( not ( = ?auto_8084 ?auto_8091 ) ) ( not ( = ?auto_8082 ?auto_8091 ) ) ( IS-CRATE ?auto_8083 ) ( AVAILABLE ?auto_8087 ) ( SURFACE-AT ?auto_8083 ?auto_8092 ) ( ON ?auto_8083 ?auto_8093 ) ( CLEAR ?auto_8083 ) ( not ( = ?auto_8083 ?auto_8093 ) ) ( not ( = ?auto_8084 ?auto_8093 ) ) ( not ( = ?auto_8082 ?auto_8093 ) ) ( not ( = ?auto_8091 ?auto_8093 ) ) ( SURFACE-AT ?auto_8081 ?auto_8088 ) ( CLEAR ?auto_8081 ) ( IS-CRATE ?auto_8082 ) ( not ( = ?auto_8081 ?auto_8082 ) ) ( not ( = ?auto_8083 ?auto_8081 ) ) ( not ( = ?auto_8084 ?auto_8081 ) ) ( not ( = ?auto_8091 ?auto_8081 ) ) ( not ( = ?auto_8093 ?auto_8081 ) ) ( AVAILABLE ?auto_8090 ) ( TRUCK-AT ?auto_8089 ?auto_8086 ) ( not ( = ?auto_8086 ?auto_8088 ) ) ( not ( = ?auto_8092 ?auto_8086 ) ) ( HOIST-AT ?auto_8094 ?auto_8086 ) ( not ( = ?auto_8090 ?auto_8094 ) ) ( not ( = ?auto_8087 ?auto_8094 ) ) ( AVAILABLE ?auto_8094 ) ( SURFACE-AT ?auto_8082 ?auto_8086 ) ( ON ?auto_8082 ?auto_8085 ) ( CLEAR ?auto_8082 ) ( not ( = ?auto_8083 ?auto_8085 ) ) ( not ( = ?auto_8084 ?auto_8085 ) ) ( not ( = ?auto_8082 ?auto_8085 ) ) ( not ( = ?auto_8091 ?auto_8085 ) ) ( not ( = ?auto_8093 ?auto_8085 ) ) ( not ( = ?auto_8081 ?auto_8085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8082 ?auto_8083 ?auto_8084 )
      ( MAKE-3CRATE-VERIFY ?auto_8081 ?auto_8082 ?auto_8083 ?auto_8084 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8095 - SURFACE
      ?auto_8096 - SURFACE
    )
    :vars
    (
      ?auto_8103 - HOIST
      ?auto_8101 - PLACE
      ?auto_8098 - SURFACE
      ?auto_8106 - PLACE
      ?auto_8100 - HOIST
      ?auto_8105 - SURFACE
      ?auto_8107 - SURFACE
      ?auto_8104 - SURFACE
      ?auto_8099 - PLACE
      ?auto_8108 - HOIST
      ?auto_8097 - SURFACE
      ?auto_8102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8103 ?auto_8101 ) ( IS-CRATE ?auto_8096 ) ( not ( = ?auto_8095 ?auto_8096 ) ) ( not ( = ?auto_8098 ?auto_8095 ) ) ( not ( = ?auto_8098 ?auto_8096 ) ) ( not ( = ?auto_8106 ?auto_8101 ) ) ( HOIST-AT ?auto_8100 ?auto_8106 ) ( not ( = ?auto_8103 ?auto_8100 ) ) ( SURFACE-AT ?auto_8096 ?auto_8106 ) ( ON ?auto_8096 ?auto_8105 ) ( CLEAR ?auto_8096 ) ( not ( = ?auto_8095 ?auto_8105 ) ) ( not ( = ?auto_8096 ?auto_8105 ) ) ( not ( = ?auto_8098 ?auto_8105 ) ) ( IS-CRATE ?auto_8095 ) ( AVAILABLE ?auto_8100 ) ( SURFACE-AT ?auto_8095 ?auto_8106 ) ( ON ?auto_8095 ?auto_8107 ) ( CLEAR ?auto_8095 ) ( not ( = ?auto_8095 ?auto_8107 ) ) ( not ( = ?auto_8096 ?auto_8107 ) ) ( not ( = ?auto_8098 ?auto_8107 ) ) ( not ( = ?auto_8105 ?auto_8107 ) ) ( SURFACE-AT ?auto_8104 ?auto_8101 ) ( CLEAR ?auto_8104 ) ( IS-CRATE ?auto_8098 ) ( not ( = ?auto_8104 ?auto_8098 ) ) ( not ( = ?auto_8095 ?auto_8104 ) ) ( not ( = ?auto_8096 ?auto_8104 ) ) ( not ( = ?auto_8105 ?auto_8104 ) ) ( not ( = ?auto_8107 ?auto_8104 ) ) ( AVAILABLE ?auto_8103 ) ( not ( = ?auto_8099 ?auto_8101 ) ) ( not ( = ?auto_8106 ?auto_8099 ) ) ( HOIST-AT ?auto_8108 ?auto_8099 ) ( not ( = ?auto_8103 ?auto_8108 ) ) ( not ( = ?auto_8100 ?auto_8108 ) ) ( AVAILABLE ?auto_8108 ) ( SURFACE-AT ?auto_8098 ?auto_8099 ) ( ON ?auto_8098 ?auto_8097 ) ( CLEAR ?auto_8098 ) ( not ( = ?auto_8095 ?auto_8097 ) ) ( not ( = ?auto_8096 ?auto_8097 ) ) ( not ( = ?auto_8098 ?auto_8097 ) ) ( not ( = ?auto_8105 ?auto_8097 ) ) ( not ( = ?auto_8107 ?auto_8097 ) ) ( not ( = ?auto_8104 ?auto_8097 ) ) ( TRUCK-AT ?auto_8102 ?auto_8101 ) )
    :subtasks
    ( ( !DRIVE ?auto_8102 ?auto_8101 ?auto_8099 )
      ( MAKE-2CRATE ?auto_8098 ?auto_8095 ?auto_8096 )
      ( MAKE-1CRATE-VERIFY ?auto_8095 ?auto_8096 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8109 - SURFACE
      ?auto_8110 - SURFACE
      ?auto_8111 - SURFACE
    )
    :vars
    (
      ?auto_8121 - HOIST
      ?auto_8122 - PLACE
      ?auto_8118 - PLACE
      ?auto_8119 - HOIST
      ?auto_8120 - SURFACE
      ?auto_8113 - SURFACE
      ?auto_8116 - SURFACE
      ?auto_8112 - PLACE
      ?auto_8115 - HOIST
      ?auto_8114 - SURFACE
      ?auto_8117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8121 ?auto_8122 ) ( IS-CRATE ?auto_8111 ) ( not ( = ?auto_8110 ?auto_8111 ) ) ( not ( = ?auto_8109 ?auto_8110 ) ) ( not ( = ?auto_8109 ?auto_8111 ) ) ( not ( = ?auto_8118 ?auto_8122 ) ) ( HOIST-AT ?auto_8119 ?auto_8118 ) ( not ( = ?auto_8121 ?auto_8119 ) ) ( SURFACE-AT ?auto_8111 ?auto_8118 ) ( ON ?auto_8111 ?auto_8120 ) ( CLEAR ?auto_8111 ) ( not ( = ?auto_8110 ?auto_8120 ) ) ( not ( = ?auto_8111 ?auto_8120 ) ) ( not ( = ?auto_8109 ?auto_8120 ) ) ( IS-CRATE ?auto_8110 ) ( AVAILABLE ?auto_8119 ) ( SURFACE-AT ?auto_8110 ?auto_8118 ) ( ON ?auto_8110 ?auto_8113 ) ( CLEAR ?auto_8110 ) ( not ( = ?auto_8110 ?auto_8113 ) ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8109 ?auto_8113 ) ) ( not ( = ?auto_8120 ?auto_8113 ) ) ( SURFACE-AT ?auto_8116 ?auto_8122 ) ( CLEAR ?auto_8116 ) ( IS-CRATE ?auto_8109 ) ( not ( = ?auto_8116 ?auto_8109 ) ) ( not ( = ?auto_8110 ?auto_8116 ) ) ( not ( = ?auto_8111 ?auto_8116 ) ) ( not ( = ?auto_8120 ?auto_8116 ) ) ( not ( = ?auto_8113 ?auto_8116 ) ) ( AVAILABLE ?auto_8121 ) ( not ( = ?auto_8112 ?auto_8122 ) ) ( not ( = ?auto_8118 ?auto_8112 ) ) ( HOIST-AT ?auto_8115 ?auto_8112 ) ( not ( = ?auto_8121 ?auto_8115 ) ) ( not ( = ?auto_8119 ?auto_8115 ) ) ( AVAILABLE ?auto_8115 ) ( SURFACE-AT ?auto_8109 ?auto_8112 ) ( ON ?auto_8109 ?auto_8114 ) ( CLEAR ?auto_8109 ) ( not ( = ?auto_8110 ?auto_8114 ) ) ( not ( = ?auto_8111 ?auto_8114 ) ) ( not ( = ?auto_8109 ?auto_8114 ) ) ( not ( = ?auto_8120 ?auto_8114 ) ) ( not ( = ?auto_8113 ?auto_8114 ) ) ( not ( = ?auto_8116 ?auto_8114 ) ) ( TRUCK-AT ?auto_8117 ?auto_8122 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8110 ?auto_8111 )
      ( MAKE-2CRATE-VERIFY ?auto_8109 ?auto_8110 ?auto_8111 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8123 - SURFACE
      ?auto_8124 - SURFACE
      ?auto_8125 - SURFACE
      ?auto_8126 - SURFACE
    )
    :vars
    (
      ?auto_8132 - HOIST
      ?auto_8129 - PLACE
      ?auto_8131 - PLACE
      ?auto_8133 - HOIST
      ?auto_8130 - SURFACE
      ?auto_8135 - SURFACE
      ?auto_8136 - PLACE
      ?auto_8128 - HOIST
      ?auto_8127 - SURFACE
      ?auto_8134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8132 ?auto_8129 ) ( IS-CRATE ?auto_8126 ) ( not ( = ?auto_8125 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8125 ) ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( not ( = ?auto_8131 ?auto_8129 ) ) ( HOIST-AT ?auto_8133 ?auto_8131 ) ( not ( = ?auto_8132 ?auto_8133 ) ) ( SURFACE-AT ?auto_8126 ?auto_8131 ) ( ON ?auto_8126 ?auto_8130 ) ( CLEAR ?auto_8126 ) ( not ( = ?auto_8125 ?auto_8130 ) ) ( not ( = ?auto_8126 ?auto_8130 ) ) ( not ( = ?auto_8124 ?auto_8130 ) ) ( IS-CRATE ?auto_8125 ) ( AVAILABLE ?auto_8133 ) ( SURFACE-AT ?auto_8125 ?auto_8131 ) ( ON ?auto_8125 ?auto_8135 ) ( CLEAR ?auto_8125 ) ( not ( = ?auto_8125 ?auto_8135 ) ) ( not ( = ?auto_8126 ?auto_8135 ) ) ( not ( = ?auto_8124 ?auto_8135 ) ) ( not ( = ?auto_8130 ?auto_8135 ) ) ( SURFACE-AT ?auto_8123 ?auto_8129 ) ( CLEAR ?auto_8123 ) ( IS-CRATE ?auto_8124 ) ( not ( = ?auto_8123 ?auto_8124 ) ) ( not ( = ?auto_8125 ?auto_8123 ) ) ( not ( = ?auto_8126 ?auto_8123 ) ) ( not ( = ?auto_8130 ?auto_8123 ) ) ( not ( = ?auto_8135 ?auto_8123 ) ) ( AVAILABLE ?auto_8132 ) ( not ( = ?auto_8136 ?auto_8129 ) ) ( not ( = ?auto_8131 ?auto_8136 ) ) ( HOIST-AT ?auto_8128 ?auto_8136 ) ( not ( = ?auto_8132 ?auto_8128 ) ) ( not ( = ?auto_8133 ?auto_8128 ) ) ( AVAILABLE ?auto_8128 ) ( SURFACE-AT ?auto_8124 ?auto_8136 ) ( ON ?auto_8124 ?auto_8127 ) ( CLEAR ?auto_8124 ) ( not ( = ?auto_8125 ?auto_8127 ) ) ( not ( = ?auto_8126 ?auto_8127 ) ) ( not ( = ?auto_8124 ?auto_8127 ) ) ( not ( = ?auto_8130 ?auto_8127 ) ) ( not ( = ?auto_8135 ?auto_8127 ) ) ( not ( = ?auto_8123 ?auto_8127 ) ) ( TRUCK-AT ?auto_8134 ?auto_8129 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8124 ?auto_8125 ?auto_8126 )
      ( MAKE-3CRATE-VERIFY ?auto_8123 ?auto_8124 ?auto_8125 ?auto_8126 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8151 - SURFACE
      ?auto_8152 - SURFACE
    )
    :vars
    (
      ?auto_8153 - HOIST
      ?auto_8154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8153 ?auto_8154 ) ( SURFACE-AT ?auto_8151 ?auto_8154 ) ( CLEAR ?auto_8151 ) ( LIFTING ?auto_8153 ?auto_8152 ) ( IS-CRATE ?auto_8152 ) ( not ( = ?auto_8151 ?auto_8152 ) ) )
    :subtasks
    ( ( !DROP ?auto_8153 ?auto_8152 ?auto_8151 ?auto_8154 )
      ( MAKE-1CRATE-VERIFY ?auto_8151 ?auto_8152 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8155 - SURFACE
      ?auto_8156 - SURFACE
      ?auto_8157 - SURFACE
    )
    :vars
    (
      ?auto_8159 - HOIST
      ?auto_8158 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8159 ?auto_8158 ) ( SURFACE-AT ?auto_8156 ?auto_8158 ) ( CLEAR ?auto_8156 ) ( LIFTING ?auto_8159 ?auto_8157 ) ( IS-CRATE ?auto_8157 ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( ON ?auto_8156 ?auto_8155 ) ( not ( = ?auto_8155 ?auto_8156 ) ) ( not ( = ?auto_8155 ?auto_8157 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8156 ?auto_8157 )
      ( MAKE-2CRATE-VERIFY ?auto_8155 ?auto_8156 ?auto_8157 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8160 - SURFACE
      ?auto_8161 - SURFACE
      ?auto_8162 - SURFACE
      ?auto_8163 - SURFACE
    )
    :vars
    (
      ?auto_8165 - HOIST
      ?auto_8164 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8165 ?auto_8164 ) ( SURFACE-AT ?auto_8162 ?auto_8164 ) ( CLEAR ?auto_8162 ) ( LIFTING ?auto_8165 ?auto_8163 ) ( IS-CRATE ?auto_8163 ) ( not ( = ?auto_8162 ?auto_8163 ) ) ( ON ?auto_8161 ?auto_8160 ) ( ON ?auto_8162 ?auto_8161 ) ( not ( = ?auto_8160 ?auto_8161 ) ) ( not ( = ?auto_8160 ?auto_8162 ) ) ( not ( = ?auto_8160 ?auto_8163 ) ) ( not ( = ?auto_8161 ?auto_8162 ) ) ( not ( = ?auto_8161 ?auto_8163 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8162 ?auto_8163 )
      ( MAKE-3CRATE-VERIFY ?auto_8160 ?auto_8161 ?auto_8162 ?auto_8163 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8166 - SURFACE
      ?auto_8167 - SURFACE
      ?auto_8168 - SURFACE
      ?auto_8169 - SURFACE
      ?auto_8170 - SURFACE
    )
    :vars
    (
      ?auto_8172 - HOIST
      ?auto_8171 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8172 ?auto_8171 ) ( SURFACE-AT ?auto_8169 ?auto_8171 ) ( CLEAR ?auto_8169 ) ( LIFTING ?auto_8172 ?auto_8170 ) ( IS-CRATE ?auto_8170 ) ( not ( = ?auto_8169 ?auto_8170 ) ) ( ON ?auto_8167 ?auto_8166 ) ( ON ?auto_8168 ?auto_8167 ) ( ON ?auto_8169 ?auto_8168 ) ( not ( = ?auto_8166 ?auto_8167 ) ) ( not ( = ?auto_8166 ?auto_8168 ) ) ( not ( = ?auto_8166 ?auto_8169 ) ) ( not ( = ?auto_8166 ?auto_8170 ) ) ( not ( = ?auto_8167 ?auto_8168 ) ) ( not ( = ?auto_8167 ?auto_8169 ) ) ( not ( = ?auto_8167 ?auto_8170 ) ) ( not ( = ?auto_8168 ?auto_8169 ) ) ( not ( = ?auto_8168 ?auto_8170 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8169 ?auto_8170 )
      ( MAKE-4CRATE-VERIFY ?auto_8166 ?auto_8167 ?auto_8168 ?auto_8169 ?auto_8170 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8173 - SURFACE
      ?auto_8174 - SURFACE
    )
    :vars
    (
      ?auto_8176 - HOIST
      ?auto_8175 - PLACE
      ?auto_8177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8176 ?auto_8175 ) ( SURFACE-AT ?auto_8173 ?auto_8175 ) ( CLEAR ?auto_8173 ) ( IS-CRATE ?auto_8174 ) ( not ( = ?auto_8173 ?auto_8174 ) ) ( TRUCK-AT ?auto_8177 ?auto_8175 ) ( AVAILABLE ?auto_8176 ) ( IN ?auto_8174 ?auto_8177 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8176 ?auto_8174 ?auto_8177 ?auto_8175 )
      ( MAKE-1CRATE ?auto_8173 ?auto_8174 )
      ( MAKE-1CRATE-VERIFY ?auto_8173 ?auto_8174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8178 - SURFACE
      ?auto_8179 - SURFACE
      ?auto_8180 - SURFACE
    )
    :vars
    (
      ?auto_8181 - HOIST
      ?auto_8182 - PLACE
      ?auto_8183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8181 ?auto_8182 ) ( SURFACE-AT ?auto_8179 ?auto_8182 ) ( CLEAR ?auto_8179 ) ( IS-CRATE ?auto_8180 ) ( not ( = ?auto_8179 ?auto_8180 ) ) ( TRUCK-AT ?auto_8183 ?auto_8182 ) ( AVAILABLE ?auto_8181 ) ( IN ?auto_8180 ?auto_8183 ) ( ON ?auto_8179 ?auto_8178 ) ( not ( = ?auto_8178 ?auto_8179 ) ) ( not ( = ?auto_8178 ?auto_8180 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8179 ?auto_8180 )
      ( MAKE-2CRATE-VERIFY ?auto_8178 ?auto_8179 ?auto_8180 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8184 - SURFACE
      ?auto_8185 - SURFACE
      ?auto_8186 - SURFACE
      ?auto_8187 - SURFACE
    )
    :vars
    (
      ?auto_8189 - HOIST
      ?auto_8188 - PLACE
      ?auto_8190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8189 ?auto_8188 ) ( SURFACE-AT ?auto_8186 ?auto_8188 ) ( CLEAR ?auto_8186 ) ( IS-CRATE ?auto_8187 ) ( not ( = ?auto_8186 ?auto_8187 ) ) ( TRUCK-AT ?auto_8190 ?auto_8188 ) ( AVAILABLE ?auto_8189 ) ( IN ?auto_8187 ?auto_8190 ) ( ON ?auto_8186 ?auto_8185 ) ( not ( = ?auto_8185 ?auto_8186 ) ) ( not ( = ?auto_8185 ?auto_8187 ) ) ( ON ?auto_8185 ?auto_8184 ) ( not ( = ?auto_8184 ?auto_8185 ) ) ( not ( = ?auto_8184 ?auto_8186 ) ) ( not ( = ?auto_8184 ?auto_8187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8185 ?auto_8186 ?auto_8187 )
      ( MAKE-3CRATE-VERIFY ?auto_8184 ?auto_8185 ?auto_8186 ?auto_8187 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8191 - SURFACE
      ?auto_8192 - SURFACE
      ?auto_8193 - SURFACE
      ?auto_8194 - SURFACE
      ?auto_8195 - SURFACE
    )
    :vars
    (
      ?auto_8197 - HOIST
      ?auto_8196 - PLACE
      ?auto_8198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8197 ?auto_8196 ) ( SURFACE-AT ?auto_8194 ?auto_8196 ) ( CLEAR ?auto_8194 ) ( IS-CRATE ?auto_8195 ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( TRUCK-AT ?auto_8198 ?auto_8196 ) ( AVAILABLE ?auto_8197 ) ( IN ?auto_8195 ?auto_8198 ) ( ON ?auto_8194 ?auto_8193 ) ( not ( = ?auto_8193 ?auto_8194 ) ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( ON ?auto_8192 ?auto_8191 ) ( ON ?auto_8193 ?auto_8192 ) ( not ( = ?auto_8191 ?auto_8192 ) ) ( not ( = ?auto_8191 ?auto_8193 ) ) ( not ( = ?auto_8191 ?auto_8194 ) ) ( not ( = ?auto_8191 ?auto_8195 ) ) ( not ( = ?auto_8192 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8194 ) ) ( not ( = ?auto_8192 ?auto_8195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8193 ?auto_8194 ?auto_8195 )
      ( MAKE-4CRATE-VERIFY ?auto_8191 ?auto_8192 ?auto_8193 ?auto_8194 ?auto_8195 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8199 - SURFACE
      ?auto_8200 - SURFACE
    )
    :vars
    (
      ?auto_8203 - HOIST
      ?auto_8202 - PLACE
      ?auto_8204 - TRUCK
      ?auto_8201 - SURFACE
      ?auto_8205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8203 ?auto_8202 ) ( SURFACE-AT ?auto_8199 ?auto_8202 ) ( CLEAR ?auto_8199 ) ( IS-CRATE ?auto_8200 ) ( not ( = ?auto_8199 ?auto_8200 ) ) ( AVAILABLE ?auto_8203 ) ( IN ?auto_8200 ?auto_8204 ) ( ON ?auto_8199 ?auto_8201 ) ( not ( = ?auto_8201 ?auto_8199 ) ) ( not ( = ?auto_8201 ?auto_8200 ) ) ( TRUCK-AT ?auto_8204 ?auto_8205 ) ( not ( = ?auto_8205 ?auto_8202 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8204 ?auto_8205 ?auto_8202 )
      ( MAKE-2CRATE ?auto_8201 ?auto_8199 ?auto_8200 )
      ( MAKE-1CRATE-VERIFY ?auto_8199 ?auto_8200 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8206 - SURFACE
      ?auto_8207 - SURFACE
      ?auto_8208 - SURFACE
    )
    :vars
    (
      ?auto_8209 - HOIST
      ?auto_8211 - PLACE
      ?auto_8212 - TRUCK
      ?auto_8210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8209 ?auto_8211 ) ( SURFACE-AT ?auto_8207 ?auto_8211 ) ( CLEAR ?auto_8207 ) ( IS-CRATE ?auto_8208 ) ( not ( = ?auto_8207 ?auto_8208 ) ) ( AVAILABLE ?auto_8209 ) ( IN ?auto_8208 ?auto_8212 ) ( ON ?auto_8207 ?auto_8206 ) ( not ( = ?auto_8206 ?auto_8207 ) ) ( not ( = ?auto_8206 ?auto_8208 ) ) ( TRUCK-AT ?auto_8212 ?auto_8210 ) ( not ( = ?auto_8210 ?auto_8211 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8207 ?auto_8208 )
      ( MAKE-2CRATE-VERIFY ?auto_8206 ?auto_8207 ?auto_8208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8213 - SURFACE
      ?auto_8214 - SURFACE
      ?auto_8215 - SURFACE
      ?auto_8216 - SURFACE
    )
    :vars
    (
      ?auto_8217 - HOIST
      ?auto_8219 - PLACE
      ?auto_8220 - TRUCK
      ?auto_8218 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8217 ?auto_8219 ) ( SURFACE-AT ?auto_8215 ?auto_8219 ) ( CLEAR ?auto_8215 ) ( IS-CRATE ?auto_8216 ) ( not ( = ?auto_8215 ?auto_8216 ) ) ( AVAILABLE ?auto_8217 ) ( IN ?auto_8216 ?auto_8220 ) ( ON ?auto_8215 ?auto_8214 ) ( not ( = ?auto_8214 ?auto_8215 ) ) ( not ( = ?auto_8214 ?auto_8216 ) ) ( TRUCK-AT ?auto_8220 ?auto_8218 ) ( not ( = ?auto_8218 ?auto_8219 ) ) ( ON ?auto_8214 ?auto_8213 ) ( not ( = ?auto_8213 ?auto_8214 ) ) ( not ( = ?auto_8213 ?auto_8215 ) ) ( not ( = ?auto_8213 ?auto_8216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8214 ?auto_8215 ?auto_8216 )
      ( MAKE-3CRATE-VERIFY ?auto_8213 ?auto_8214 ?auto_8215 ?auto_8216 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8221 - SURFACE
      ?auto_8222 - SURFACE
      ?auto_8223 - SURFACE
      ?auto_8224 - SURFACE
      ?auto_8225 - SURFACE
    )
    :vars
    (
      ?auto_8226 - HOIST
      ?auto_8228 - PLACE
      ?auto_8229 - TRUCK
      ?auto_8227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8226 ?auto_8228 ) ( SURFACE-AT ?auto_8224 ?auto_8228 ) ( CLEAR ?auto_8224 ) ( IS-CRATE ?auto_8225 ) ( not ( = ?auto_8224 ?auto_8225 ) ) ( AVAILABLE ?auto_8226 ) ( IN ?auto_8225 ?auto_8229 ) ( ON ?auto_8224 ?auto_8223 ) ( not ( = ?auto_8223 ?auto_8224 ) ) ( not ( = ?auto_8223 ?auto_8225 ) ) ( TRUCK-AT ?auto_8229 ?auto_8227 ) ( not ( = ?auto_8227 ?auto_8228 ) ) ( ON ?auto_8222 ?auto_8221 ) ( ON ?auto_8223 ?auto_8222 ) ( not ( = ?auto_8221 ?auto_8222 ) ) ( not ( = ?auto_8221 ?auto_8223 ) ) ( not ( = ?auto_8221 ?auto_8224 ) ) ( not ( = ?auto_8221 ?auto_8225 ) ) ( not ( = ?auto_8222 ?auto_8223 ) ) ( not ( = ?auto_8222 ?auto_8224 ) ) ( not ( = ?auto_8222 ?auto_8225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8223 ?auto_8224 ?auto_8225 )
      ( MAKE-4CRATE-VERIFY ?auto_8221 ?auto_8222 ?auto_8223 ?auto_8224 ?auto_8225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8230 - SURFACE
      ?auto_8231 - SURFACE
    )
    :vars
    (
      ?auto_8232 - HOIST
      ?auto_8234 - PLACE
      ?auto_8236 - SURFACE
      ?auto_8235 - TRUCK
      ?auto_8233 - PLACE
      ?auto_8237 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8232 ?auto_8234 ) ( SURFACE-AT ?auto_8230 ?auto_8234 ) ( CLEAR ?auto_8230 ) ( IS-CRATE ?auto_8231 ) ( not ( = ?auto_8230 ?auto_8231 ) ) ( AVAILABLE ?auto_8232 ) ( ON ?auto_8230 ?auto_8236 ) ( not ( = ?auto_8236 ?auto_8230 ) ) ( not ( = ?auto_8236 ?auto_8231 ) ) ( TRUCK-AT ?auto_8235 ?auto_8233 ) ( not ( = ?auto_8233 ?auto_8234 ) ) ( HOIST-AT ?auto_8237 ?auto_8233 ) ( LIFTING ?auto_8237 ?auto_8231 ) ( not ( = ?auto_8232 ?auto_8237 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8237 ?auto_8231 ?auto_8235 ?auto_8233 )
      ( MAKE-2CRATE ?auto_8236 ?auto_8230 ?auto_8231 )
      ( MAKE-1CRATE-VERIFY ?auto_8230 ?auto_8231 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8238 - SURFACE
      ?auto_8239 - SURFACE
      ?auto_8240 - SURFACE
    )
    :vars
    (
      ?auto_8243 - HOIST
      ?auto_8245 - PLACE
      ?auto_8244 - TRUCK
      ?auto_8242 - PLACE
      ?auto_8241 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8243 ?auto_8245 ) ( SURFACE-AT ?auto_8239 ?auto_8245 ) ( CLEAR ?auto_8239 ) ( IS-CRATE ?auto_8240 ) ( not ( = ?auto_8239 ?auto_8240 ) ) ( AVAILABLE ?auto_8243 ) ( ON ?auto_8239 ?auto_8238 ) ( not ( = ?auto_8238 ?auto_8239 ) ) ( not ( = ?auto_8238 ?auto_8240 ) ) ( TRUCK-AT ?auto_8244 ?auto_8242 ) ( not ( = ?auto_8242 ?auto_8245 ) ) ( HOIST-AT ?auto_8241 ?auto_8242 ) ( LIFTING ?auto_8241 ?auto_8240 ) ( not ( = ?auto_8243 ?auto_8241 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8239 ?auto_8240 )
      ( MAKE-2CRATE-VERIFY ?auto_8238 ?auto_8239 ?auto_8240 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8246 - SURFACE
      ?auto_8247 - SURFACE
      ?auto_8248 - SURFACE
      ?auto_8249 - SURFACE
    )
    :vars
    (
      ?auto_8250 - HOIST
      ?auto_8251 - PLACE
      ?auto_8252 - TRUCK
      ?auto_8253 - PLACE
      ?auto_8254 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8250 ?auto_8251 ) ( SURFACE-AT ?auto_8248 ?auto_8251 ) ( CLEAR ?auto_8248 ) ( IS-CRATE ?auto_8249 ) ( not ( = ?auto_8248 ?auto_8249 ) ) ( AVAILABLE ?auto_8250 ) ( ON ?auto_8248 ?auto_8247 ) ( not ( = ?auto_8247 ?auto_8248 ) ) ( not ( = ?auto_8247 ?auto_8249 ) ) ( TRUCK-AT ?auto_8252 ?auto_8253 ) ( not ( = ?auto_8253 ?auto_8251 ) ) ( HOIST-AT ?auto_8254 ?auto_8253 ) ( LIFTING ?auto_8254 ?auto_8249 ) ( not ( = ?auto_8250 ?auto_8254 ) ) ( ON ?auto_8247 ?auto_8246 ) ( not ( = ?auto_8246 ?auto_8247 ) ) ( not ( = ?auto_8246 ?auto_8248 ) ) ( not ( = ?auto_8246 ?auto_8249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8247 ?auto_8248 ?auto_8249 )
      ( MAKE-3CRATE-VERIFY ?auto_8246 ?auto_8247 ?auto_8248 ?auto_8249 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8255 - SURFACE
      ?auto_8256 - SURFACE
      ?auto_8257 - SURFACE
      ?auto_8258 - SURFACE
      ?auto_8259 - SURFACE
    )
    :vars
    (
      ?auto_8260 - HOIST
      ?auto_8261 - PLACE
      ?auto_8262 - TRUCK
      ?auto_8263 - PLACE
      ?auto_8264 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8260 ?auto_8261 ) ( SURFACE-AT ?auto_8258 ?auto_8261 ) ( CLEAR ?auto_8258 ) ( IS-CRATE ?auto_8259 ) ( not ( = ?auto_8258 ?auto_8259 ) ) ( AVAILABLE ?auto_8260 ) ( ON ?auto_8258 ?auto_8257 ) ( not ( = ?auto_8257 ?auto_8258 ) ) ( not ( = ?auto_8257 ?auto_8259 ) ) ( TRUCK-AT ?auto_8262 ?auto_8263 ) ( not ( = ?auto_8263 ?auto_8261 ) ) ( HOIST-AT ?auto_8264 ?auto_8263 ) ( LIFTING ?auto_8264 ?auto_8259 ) ( not ( = ?auto_8260 ?auto_8264 ) ) ( ON ?auto_8256 ?auto_8255 ) ( ON ?auto_8257 ?auto_8256 ) ( not ( = ?auto_8255 ?auto_8256 ) ) ( not ( = ?auto_8255 ?auto_8257 ) ) ( not ( = ?auto_8255 ?auto_8258 ) ) ( not ( = ?auto_8255 ?auto_8259 ) ) ( not ( = ?auto_8256 ?auto_8257 ) ) ( not ( = ?auto_8256 ?auto_8258 ) ) ( not ( = ?auto_8256 ?auto_8259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8257 ?auto_8258 ?auto_8259 )
      ( MAKE-4CRATE-VERIFY ?auto_8255 ?auto_8256 ?auto_8257 ?auto_8258 ?auto_8259 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8265 - SURFACE
      ?auto_8266 - SURFACE
    )
    :vars
    (
      ?auto_8267 - HOIST
      ?auto_8268 - PLACE
      ?auto_8271 - SURFACE
      ?auto_8269 - TRUCK
      ?auto_8270 - PLACE
      ?auto_8272 - HOIST
      ?auto_8273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8267 ?auto_8268 ) ( SURFACE-AT ?auto_8265 ?auto_8268 ) ( CLEAR ?auto_8265 ) ( IS-CRATE ?auto_8266 ) ( not ( = ?auto_8265 ?auto_8266 ) ) ( AVAILABLE ?auto_8267 ) ( ON ?auto_8265 ?auto_8271 ) ( not ( = ?auto_8271 ?auto_8265 ) ) ( not ( = ?auto_8271 ?auto_8266 ) ) ( TRUCK-AT ?auto_8269 ?auto_8270 ) ( not ( = ?auto_8270 ?auto_8268 ) ) ( HOIST-AT ?auto_8272 ?auto_8270 ) ( not ( = ?auto_8267 ?auto_8272 ) ) ( AVAILABLE ?auto_8272 ) ( SURFACE-AT ?auto_8266 ?auto_8270 ) ( ON ?auto_8266 ?auto_8273 ) ( CLEAR ?auto_8266 ) ( not ( = ?auto_8265 ?auto_8273 ) ) ( not ( = ?auto_8266 ?auto_8273 ) ) ( not ( = ?auto_8271 ?auto_8273 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8272 ?auto_8266 ?auto_8273 ?auto_8270 )
      ( MAKE-2CRATE ?auto_8271 ?auto_8265 ?auto_8266 )
      ( MAKE-1CRATE-VERIFY ?auto_8265 ?auto_8266 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8274 - SURFACE
      ?auto_8275 - SURFACE
      ?auto_8276 - SURFACE
    )
    :vars
    (
      ?auto_8282 - HOIST
      ?auto_8281 - PLACE
      ?auto_8278 - TRUCK
      ?auto_8280 - PLACE
      ?auto_8277 - HOIST
      ?auto_8279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8282 ?auto_8281 ) ( SURFACE-AT ?auto_8275 ?auto_8281 ) ( CLEAR ?auto_8275 ) ( IS-CRATE ?auto_8276 ) ( not ( = ?auto_8275 ?auto_8276 ) ) ( AVAILABLE ?auto_8282 ) ( ON ?auto_8275 ?auto_8274 ) ( not ( = ?auto_8274 ?auto_8275 ) ) ( not ( = ?auto_8274 ?auto_8276 ) ) ( TRUCK-AT ?auto_8278 ?auto_8280 ) ( not ( = ?auto_8280 ?auto_8281 ) ) ( HOIST-AT ?auto_8277 ?auto_8280 ) ( not ( = ?auto_8282 ?auto_8277 ) ) ( AVAILABLE ?auto_8277 ) ( SURFACE-AT ?auto_8276 ?auto_8280 ) ( ON ?auto_8276 ?auto_8279 ) ( CLEAR ?auto_8276 ) ( not ( = ?auto_8275 ?auto_8279 ) ) ( not ( = ?auto_8276 ?auto_8279 ) ) ( not ( = ?auto_8274 ?auto_8279 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8275 ?auto_8276 )
      ( MAKE-2CRATE-VERIFY ?auto_8274 ?auto_8275 ?auto_8276 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8283 - SURFACE
      ?auto_8284 - SURFACE
      ?auto_8285 - SURFACE
      ?auto_8286 - SURFACE
    )
    :vars
    (
      ?auto_8290 - HOIST
      ?auto_8287 - PLACE
      ?auto_8288 - TRUCK
      ?auto_8292 - PLACE
      ?auto_8291 - HOIST
      ?auto_8289 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8290 ?auto_8287 ) ( SURFACE-AT ?auto_8285 ?auto_8287 ) ( CLEAR ?auto_8285 ) ( IS-CRATE ?auto_8286 ) ( not ( = ?auto_8285 ?auto_8286 ) ) ( AVAILABLE ?auto_8290 ) ( ON ?auto_8285 ?auto_8284 ) ( not ( = ?auto_8284 ?auto_8285 ) ) ( not ( = ?auto_8284 ?auto_8286 ) ) ( TRUCK-AT ?auto_8288 ?auto_8292 ) ( not ( = ?auto_8292 ?auto_8287 ) ) ( HOIST-AT ?auto_8291 ?auto_8292 ) ( not ( = ?auto_8290 ?auto_8291 ) ) ( AVAILABLE ?auto_8291 ) ( SURFACE-AT ?auto_8286 ?auto_8292 ) ( ON ?auto_8286 ?auto_8289 ) ( CLEAR ?auto_8286 ) ( not ( = ?auto_8285 ?auto_8289 ) ) ( not ( = ?auto_8286 ?auto_8289 ) ) ( not ( = ?auto_8284 ?auto_8289 ) ) ( ON ?auto_8284 ?auto_8283 ) ( not ( = ?auto_8283 ?auto_8284 ) ) ( not ( = ?auto_8283 ?auto_8285 ) ) ( not ( = ?auto_8283 ?auto_8286 ) ) ( not ( = ?auto_8283 ?auto_8289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8284 ?auto_8285 ?auto_8286 )
      ( MAKE-3CRATE-VERIFY ?auto_8283 ?auto_8284 ?auto_8285 ?auto_8286 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8293 - SURFACE
      ?auto_8294 - SURFACE
      ?auto_8295 - SURFACE
      ?auto_8296 - SURFACE
      ?auto_8297 - SURFACE
    )
    :vars
    (
      ?auto_8301 - HOIST
      ?auto_8298 - PLACE
      ?auto_8299 - TRUCK
      ?auto_8303 - PLACE
      ?auto_8302 - HOIST
      ?auto_8300 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8301 ?auto_8298 ) ( SURFACE-AT ?auto_8296 ?auto_8298 ) ( CLEAR ?auto_8296 ) ( IS-CRATE ?auto_8297 ) ( not ( = ?auto_8296 ?auto_8297 ) ) ( AVAILABLE ?auto_8301 ) ( ON ?auto_8296 ?auto_8295 ) ( not ( = ?auto_8295 ?auto_8296 ) ) ( not ( = ?auto_8295 ?auto_8297 ) ) ( TRUCK-AT ?auto_8299 ?auto_8303 ) ( not ( = ?auto_8303 ?auto_8298 ) ) ( HOIST-AT ?auto_8302 ?auto_8303 ) ( not ( = ?auto_8301 ?auto_8302 ) ) ( AVAILABLE ?auto_8302 ) ( SURFACE-AT ?auto_8297 ?auto_8303 ) ( ON ?auto_8297 ?auto_8300 ) ( CLEAR ?auto_8297 ) ( not ( = ?auto_8296 ?auto_8300 ) ) ( not ( = ?auto_8297 ?auto_8300 ) ) ( not ( = ?auto_8295 ?auto_8300 ) ) ( ON ?auto_8294 ?auto_8293 ) ( ON ?auto_8295 ?auto_8294 ) ( not ( = ?auto_8293 ?auto_8294 ) ) ( not ( = ?auto_8293 ?auto_8295 ) ) ( not ( = ?auto_8293 ?auto_8296 ) ) ( not ( = ?auto_8293 ?auto_8297 ) ) ( not ( = ?auto_8293 ?auto_8300 ) ) ( not ( = ?auto_8294 ?auto_8295 ) ) ( not ( = ?auto_8294 ?auto_8296 ) ) ( not ( = ?auto_8294 ?auto_8297 ) ) ( not ( = ?auto_8294 ?auto_8300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8295 ?auto_8296 ?auto_8297 )
      ( MAKE-4CRATE-VERIFY ?auto_8293 ?auto_8294 ?auto_8295 ?auto_8296 ?auto_8297 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8304 - SURFACE
      ?auto_8305 - SURFACE
    )
    :vars
    (
      ?auto_8309 - HOIST
      ?auto_8306 - PLACE
      ?auto_8310 - SURFACE
      ?auto_8312 - PLACE
      ?auto_8311 - HOIST
      ?auto_8308 - SURFACE
      ?auto_8307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8309 ?auto_8306 ) ( SURFACE-AT ?auto_8304 ?auto_8306 ) ( CLEAR ?auto_8304 ) ( IS-CRATE ?auto_8305 ) ( not ( = ?auto_8304 ?auto_8305 ) ) ( AVAILABLE ?auto_8309 ) ( ON ?auto_8304 ?auto_8310 ) ( not ( = ?auto_8310 ?auto_8304 ) ) ( not ( = ?auto_8310 ?auto_8305 ) ) ( not ( = ?auto_8312 ?auto_8306 ) ) ( HOIST-AT ?auto_8311 ?auto_8312 ) ( not ( = ?auto_8309 ?auto_8311 ) ) ( AVAILABLE ?auto_8311 ) ( SURFACE-AT ?auto_8305 ?auto_8312 ) ( ON ?auto_8305 ?auto_8308 ) ( CLEAR ?auto_8305 ) ( not ( = ?auto_8304 ?auto_8308 ) ) ( not ( = ?auto_8305 ?auto_8308 ) ) ( not ( = ?auto_8310 ?auto_8308 ) ) ( TRUCK-AT ?auto_8307 ?auto_8306 ) )
    :subtasks
    ( ( !DRIVE ?auto_8307 ?auto_8306 ?auto_8312 )
      ( MAKE-2CRATE ?auto_8310 ?auto_8304 ?auto_8305 )
      ( MAKE-1CRATE-VERIFY ?auto_8304 ?auto_8305 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8313 - SURFACE
      ?auto_8314 - SURFACE
      ?auto_8315 - SURFACE
    )
    :vars
    (
      ?auto_8321 - HOIST
      ?auto_8318 - PLACE
      ?auto_8320 - PLACE
      ?auto_8317 - HOIST
      ?auto_8316 - SURFACE
      ?auto_8319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8321 ?auto_8318 ) ( SURFACE-AT ?auto_8314 ?auto_8318 ) ( CLEAR ?auto_8314 ) ( IS-CRATE ?auto_8315 ) ( not ( = ?auto_8314 ?auto_8315 ) ) ( AVAILABLE ?auto_8321 ) ( ON ?auto_8314 ?auto_8313 ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8315 ) ) ( not ( = ?auto_8320 ?auto_8318 ) ) ( HOIST-AT ?auto_8317 ?auto_8320 ) ( not ( = ?auto_8321 ?auto_8317 ) ) ( AVAILABLE ?auto_8317 ) ( SURFACE-AT ?auto_8315 ?auto_8320 ) ( ON ?auto_8315 ?auto_8316 ) ( CLEAR ?auto_8315 ) ( not ( = ?auto_8314 ?auto_8316 ) ) ( not ( = ?auto_8315 ?auto_8316 ) ) ( not ( = ?auto_8313 ?auto_8316 ) ) ( TRUCK-AT ?auto_8319 ?auto_8318 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8314 ?auto_8315 )
      ( MAKE-2CRATE-VERIFY ?auto_8313 ?auto_8314 ?auto_8315 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8322 - SURFACE
      ?auto_8323 - SURFACE
      ?auto_8324 - SURFACE
      ?auto_8325 - SURFACE
    )
    :vars
    (
      ?auto_8330 - HOIST
      ?auto_8328 - PLACE
      ?auto_8327 - PLACE
      ?auto_8329 - HOIST
      ?auto_8331 - SURFACE
      ?auto_8326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8330 ?auto_8328 ) ( SURFACE-AT ?auto_8324 ?auto_8328 ) ( CLEAR ?auto_8324 ) ( IS-CRATE ?auto_8325 ) ( not ( = ?auto_8324 ?auto_8325 ) ) ( AVAILABLE ?auto_8330 ) ( ON ?auto_8324 ?auto_8323 ) ( not ( = ?auto_8323 ?auto_8324 ) ) ( not ( = ?auto_8323 ?auto_8325 ) ) ( not ( = ?auto_8327 ?auto_8328 ) ) ( HOIST-AT ?auto_8329 ?auto_8327 ) ( not ( = ?auto_8330 ?auto_8329 ) ) ( AVAILABLE ?auto_8329 ) ( SURFACE-AT ?auto_8325 ?auto_8327 ) ( ON ?auto_8325 ?auto_8331 ) ( CLEAR ?auto_8325 ) ( not ( = ?auto_8324 ?auto_8331 ) ) ( not ( = ?auto_8325 ?auto_8331 ) ) ( not ( = ?auto_8323 ?auto_8331 ) ) ( TRUCK-AT ?auto_8326 ?auto_8328 ) ( ON ?auto_8323 ?auto_8322 ) ( not ( = ?auto_8322 ?auto_8323 ) ) ( not ( = ?auto_8322 ?auto_8324 ) ) ( not ( = ?auto_8322 ?auto_8325 ) ) ( not ( = ?auto_8322 ?auto_8331 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8323 ?auto_8324 ?auto_8325 )
      ( MAKE-3CRATE-VERIFY ?auto_8322 ?auto_8323 ?auto_8324 ?auto_8325 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8332 - SURFACE
      ?auto_8333 - SURFACE
      ?auto_8334 - SURFACE
      ?auto_8335 - SURFACE
      ?auto_8336 - SURFACE
    )
    :vars
    (
      ?auto_8341 - HOIST
      ?auto_8339 - PLACE
      ?auto_8338 - PLACE
      ?auto_8340 - HOIST
      ?auto_8342 - SURFACE
      ?auto_8337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8341 ?auto_8339 ) ( SURFACE-AT ?auto_8335 ?auto_8339 ) ( CLEAR ?auto_8335 ) ( IS-CRATE ?auto_8336 ) ( not ( = ?auto_8335 ?auto_8336 ) ) ( AVAILABLE ?auto_8341 ) ( ON ?auto_8335 ?auto_8334 ) ( not ( = ?auto_8334 ?auto_8335 ) ) ( not ( = ?auto_8334 ?auto_8336 ) ) ( not ( = ?auto_8338 ?auto_8339 ) ) ( HOIST-AT ?auto_8340 ?auto_8338 ) ( not ( = ?auto_8341 ?auto_8340 ) ) ( AVAILABLE ?auto_8340 ) ( SURFACE-AT ?auto_8336 ?auto_8338 ) ( ON ?auto_8336 ?auto_8342 ) ( CLEAR ?auto_8336 ) ( not ( = ?auto_8335 ?auto_8342 ) ) ( not ( = ?auto_8336 ?auto_8342 ) ) ( not ( = ?auto_8334 ?auto_8342 ) ) ( TRUCK-AT ?auto_8337 ?auto_8339 ) ( ON ?auto_8333 ?auto_8332 ) ( ON ?auto_8334 ?auto_8333 ) ( not ( = ?auto_8332 ?auto_8333 ) ) ( not ( = ?auto_8332 ?auto_8334 ) ) ( not ( = ?auto_8332 ?auto_8335 ) ) ( not ( = ?auto_8332 ?auto_8336 ) ) ( not ( = ?auto_8332 ?auto_8342 ) ) ( not ( = ?auto_8333 ?auto_8334 ) ) ( not ( = ?auto_8333 ?auto_8335 ) ) ( not ( = ?auto_8333 ?auto_8336 ) ) ( not ( = ?auto_8333 ?auto_8342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8334 ?auto_8335 ?auto_8336 )
      ( MAKE-4CRATE-VERIFY ?auto_8332 ?auto_8333 ?auto_8334 ?auto_8335 ?auto_8336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8343 - SURFACE
      ?auto_8344 - SURFACE
    )
    :vars
    (
      ?auto_8350 - HOIST
      ?auto_8348 - PLACE
      ?auto_8346 - SURFACE
      ?auto_8347 - PLACE
      ?auto_8349 - HOIST
      ?auto_8351 - SURFACE
      ?auto_8345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8350 ?auto_8348 ) ( IS-CRATE ?auto_8344 ) ( not ( = ?auto_8343 ?auto_8344 ) ) ( not ( = ?auto_8346 ?auto_8343 ) ) ( not ( = ?auto_8346 ?auto_8344 ) ) ( not ( = ?auto_8347 ?auto_8348 ) ) ( HOIST-AT ?auto_8349 ?auto_8347 ) ( not ( = ?auto_8350 ?auto_8349 ) ) ( AVAILABLE ?auto_8349 ) ( SURFACE-AT ?auto_8344 ?auto_8347 ) ( ON ?auto_8344 ?auto_8351 ) ( CLEAR ?auto_8344 ) ( not ( = ?auto_8343 ?auto_8351 ) ) ( not ( = ?auto_8344 ?auto_8351 ) ) ( not ( = ?auto_8346 ?auto_8351 ) ) ( TRUCK-AT ?auto_8345 ?auto_8348 ) ( SURFACE-AT ?auto_8346 ?auto_8348 ) ( CLEAR ?auto_8346 ) ( LIFTING ?auto_8350 ?auto_8343 ) ( IS-CRATE ?auto_8343 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8346 ?auto_8343 )
      ( MAKE-2CRATE ?auto_8346 ?auto_8343 ?auto_8344 )
      ( MAKE-1CRATE-VERIFY ?auto_8343 ?auto_8344 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8352 - SURFACE
      ?auto_8353 - SURFACE
      ?auto_8354 - SURFACE
    )
    :vars
    (
      ?auto_8357 - HOIST
      ?auto_8360 - PLACE
      ?auto_8359 - PLACE
      ?auto_8355 - HOIST
      ?auto_8356 - SURFACE
      ?auto_8358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8357 ?auto_8360 ) ( IS-CRATE ?auto_8354 ) ( not ( = ?auto_8353 ?auto_8354 ) ) ( not ( = ?auto_8352 ?auto_8353 ) ) ( not ( = ?auto_8352 ?auto_8354 ) ) ( not ( = ?auto_8359 ?auto_8360 ) ) ( HOIST-AT ?auto_8355 ?auto_8359 ) ( not ( = ?auto_8357 ?auto_8355 ) ) ( AVAILABLE ?auto_8355 ) ( SURFACE-AT ?auto_8354 ?auto_8359 ) ( ON ?auto_8354 ?auto_8356 ) ( CLEAR ?auto_8354 ) ( not ( = ?auto_8353 ?auto_8356 ) ) ( not ( = ?auto_8354 ?auto_8356 ) ) ( not ( = ?auto_8352 ?auto_8356 ) ) ( TRUCK-AT ?auto_8358 ?auto_8360 ) ( SURFACE-AT ?auto_8352 ?auto_8360 ) ( CLEAR ?auto_8352 ) ( LIFTING ?auto_8357 ?auto_8353 ) ( IS-CRATE ?auto_8353 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8353 ?auto_8354 )
      ( MAKE-2CRATE-VERIFY ?auto_8352 ?auto_8353 ?auto_8354 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8361 - SURFACE
      ?auto_8362 - SURFACE
      ?auto_8363 - SURFACE
      ?auto_8364 - SURFACE
    )
    :vars
    (
      ?auto_8369 - HOIST
      ?auto_8368 - PLACE
      ?auto_8365 - PLACE
      ?auto_8367 - HOIST
      ?auto_8370 - SURFACE
      ?auto_8366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8369 ?auto_8368 ) ( IS-CRATE ?auto_8364 ) ( not ( = ?auto_8363 ?auto_8364 ) ) ( not ( = ?auto_8362 ?auto_8363 ) ) ( not ( = ?auto_8362 ?auto_8364 ) ) ( not ( = ?auto_8365 ?auto_8368 ) ) ( HOIST-AT ?auto_8367 ?auto_8365 ) ( not ( = ?auto_8369 ?auto_8367 ) ) ( AVAILABLE ?auto_8367 ) ( SURFACE-AT ?auto_8364 ?auto_8365 ) ( ON ?auto_8364 ?auto_8370 ) ( CLEAR ?auto_8364 ) ( not ( = ?auto_8363 ?auto_8370 ) ) ( not ( = ?auto_8364 ?auto_8370 ) ) ( not ( = ?auto_8362 ?auto_8370 ) ) ( TRUCK-AT ?auto_8366 ?auto_8368 ) ( SURFACE-AT ?auto_8362 ?auto_8368 ) ( CLEAR ?auto_8362 ) ( LIFTING ?auto_8369 ?auto_8363 ) ( IS-CRATE ?auto_8363 ) ( ON ?auto_8362 ?auto_8361 ) ( not ( = ?auto_8361 ?auto_8362 ) ) ( not ( = ?auto_8361 ?auto_8363 ) ) ( not ( = ?auto_8361 ?auto_8364 ) ) ( not ( = ?auto_8361 ?auto_8370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8362 ?auto_8363 ?auto_8364 )
      ( MAKE-3CRATE-VERIFY ?auto_8361 ?auto_8362 ?auto_8363 ?auto_8364 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8371 - SURFACE
      ?auto_8372 - SURFACE
      ?auto_8373 - SURFACE
      ?auto_8374 - SURFACE
      ?auto_8375 - SURFACE
    )
    :vars
    (
      ?auto_8380 - HOIST
      ?auto_8379 - PLACE
      ?auto_8376 - PLACE
      ?auto_8378 - HOIST
      ?auto_8381 - SURFACE
      ?auto_8377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8380 ?auto_8379 ) ( IS-CRATE ?auto_8375 ) ( not ( = ?auto_8374 ?auto_8375 ) ) ( not ( = ?auto_8373 ?auto_8374 ) ) ( not ( = ?auto_8373 ?auto_8375 ) ) ( not ( = ?auto_8376 ?auto_8379 ) ) ( HOIST-AT ?auto_8378 ?auto_8376 ) ( not ( = ?auto_8380 ?auto_8378 ) ) ( AVAILABLE ?auto_8378 ) ( SURFACE-AT ?auto_8375 ?auto_8376 ) ( ON ?auto_8375 ?auto_8381 ) ( CLEAR ?auto_8375 ) ( not ( = ?auto_8374 ?auto_8381 ) ) ( not ( = ?auto_8375 ?auto_8381 ) ) ( not ( = ?auto_8373 ?auto_8381 ) ) ( TRUCK-AT ?auto_8377 ?auto_8379 ) ( SURFACE-AT ?auto_8373 ?auto_8379 ) ( CLEAR ?auto_8373 ) ( LIFTING ?auto_8380 ?auto_8374 ) ( IS-CRATE ?auto_8374 ) ( ON ?auto_8372 ?auto_8371 ) ( ON ?auto_8373 ?auto_8372 ) ( not ( = ?auto_8371 ?auto_8372 ) ) ( not ( = ?auto_8371 ?auto_8373 ) ) ( not ( = ?auto_8371 ?auto_8374 ) ) ( not ( = ?auto_8371 ?auto_8375 ) ) ( not ( = ?auto_8371 ?auto_8381 ) ) ( not ( = ?auto_8372 ?auto_8373 ) ) ( not ( = ?auto_8372 ?auto_8374 ) ) ( not ( = ?auto_8372 ?auto_8375 ) ) ( not ( = ?auto_8372 ?auto_8381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8373 ?auto_8374 ?auto_8375 )
      ( MAKE-4CRATE-VERIFY ?auto_8371 ?auto_8372 ?auto_8373 ?auto_8374 ?auto_8375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8382 - SURFACE
      ?auto_8383 - SURFACE
    )
    :vars
    (
      ?auto_8389 - HOIST
      ?auto_8387 - PLACE
      ?auto_8388 - SURFACE
      ?auto_8384 - PLACE
      ?auto_8386 - HOIST
      ?auto_8390 - SURFACE
      ?auto_8385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8389 ?auto_8387 ) ( IS-CRATE ?auto_8383 ) ( not ( = ?auto_8382 ?auto_8383 ) ) ( not ( = ?auto_8388 ?auto_8382 ) ) ( not ( = ?auto_8388 ?auto_8383 ) ) ( not ( = ?auto_8384 ?auto_8387 ) ) ( HOIST-AT ?auto_8386 ?auto_8384 ) ( not ( = ?auto_8389 ?auto_8386 ) ) ( AVAILABLE ?auto_8386 ) ( SURFACE-AT ?auto_8383 ?auto_8384 ) ( ON ?auto_8383 ?auto_8390 ) ( CLEAR ?auto_8383 ) ( not ( = ?auto_8382 ?auto_8390 ) ) ( not ( = ?auto_8383 ?auto_8390 ) ) ( not ( = ?auto_8388 ?auto_8390 ) ) ( TRUCK-AT ?auto_8385 ?auto_8387 ) ( SURFACE-AT ?auto_8388 ?auto_8387 ) ( CLEAR ?auto_8388 ) ( IS-CRATE ?auto_8382 ) ( AVAILABLE ?auto_8389 ) ( IN ?auto_8382 ?auto_8385 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8389 ?auto_8382 ?auto_8385 ?auto_8387 )
      ( MAKE-2CRATE ?auto_8388 ?auto_8382 ?auto_8383 )
      ( MAKE-1CRATE-VERIFY ?auto_8382 ?auto_8383 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8391 - SURFACE
      ?auto_8392 - SURFACE
      ?auto_8393 - SURFACE
    )
    :vars
    (
      ?auto_8394 - HOIST
      ?auto_8399 - PLACE
      ?auto_8395 - PLACE
      ?auto_8398 - HOIST
      ?auto_8397 - SURFACE
      ?auto_8396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8394 ?auto_8399 ) ( IS-CRATE ?auto_8393 ) ( not ( = ?auto_8392 ?auto_8393 ) ) ( not ( = ?auto_8391 ?auto_8392 ) ) ( not ( = ?auto_8391 ?auto_8393 ) ) ( not ( = ?auto_8395 ?auto_8399 ) ) ( HOIST-AT ?auto_8398 ?auto_8395 ) ( not ( = ?auto_8394 ?auto_8398 ) ) ( AVAILABLE ?auto_8398 ) ( SURFACE-AT ?auto_8393 ?auto_8395 ) ( ON ?auto_8393 ?auto_8397 ) ( CLEAR ?auto_8393 ) ( not ( = ?auto_8392 ?auto_8397 ) ) ( not ( = ?auto_8393 ?auto_8397 ) ) ( not ( = ?auto_8391 ?auto_8397 ) ) ( TRUCK-AT ?auto_8396 ?auto_8399 ) ( SURFACE-AT ?auto_8391 ?auto_8399 ) ( CLEAR ?auto_8391 ) ( IS-CRATE ?auto_8392 ) ( AVAILABLE ?auto_8394 ) ( IN ?auto_8392 ?auto_8396 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8392 ?auto_8393 )
      ( MAKE-2CRATE-VERIFY ?auto_8391 ?auto_8392 ?auto_8393 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8400 - SURFACE
      ?auto_8401 - SURFACE
      ?auto_8402 - SURFACE
      ?auto_8403 - SURFACE
    )
    :vars
    (
      ?auto_8408 - HOIST
      ?auto_8409 - PLACE
      ?auto_8407 - PLACE
      ?auto_8405 - HOIST
      ?auto_8404 - SURFACE
      ?auto_8406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8408 ?auto_8409 ) ( IS-CRATE ?auto_8403 ) ( not ( = ?auto_8402 ?auto_8403 ) ) ( not ( = ?auto_8401 ?auto_8402 ) ) ( not ( = ?auto_8401 ?auto_8403 ) ) ( not ( = ?auto_8407 ?auto_8409 ) ) ( HOIST-AT ?auto_8405 ?auto_8407 ) ( not ( = ?auto_8408 ?auto_8405 ) ) ( AVAILABLE ?auto_8405 ) ( SURFACE-AT ?auto_8403 ?auto_8407 ) ( ON ?auto_8403 ?auto_8404 ) ( CLEAR ?auto_8403 ) ( not ( = ?auto_8402 ?auto_8404 ) ) ( not ( = ?auto_8403 ?auto_8404 ) ) ( not ( = ?auto_8401 ?auto_8404 ) ) ( TRUCK-AT ?auto_8406 ?auto_8409 ) ( SURFACE-AT ?auto_8401 ?auto_8409 ) ( CLEAR ?auto_8401 ) ( IS-CRATE ?auto_8402 ) ( AVAILABLE ?auto_8408 ) ( IN ?auto_8402 ?auto_8406 ) ( ON ?auto_8401 ?auto_8400 ) ( not ( = ?auto_8400 ?auto_8401 ) ) ( not ( = ?auto_8400 ?auto_8402 ) ) ( not ( = ?auto_8400 ?auto_8403 ) ) ( not ( = ?auto_8400 ?auto_8404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8401 ?auto_8402 ?auto_8403 )
      ( MAKE-3CRATE-VERIFY ?auto_8400 ?auto_8401 ?auto_8402 ?auto_8403 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8410 - SURFACE
      ?auto_8411 - SURFACE
      ?auto_8412 - SURFACE
      ?auto_8413 - SURFACE
      ?auto_8414 - SURFACE
    )
    :vars
    (
      ?auto_8419 - HOIST
      ?auto_8420 - PLACE
      ?auto_8418 - PLACE
      ?auto_8416 - HOIST
      ?auto_8415 - SURFACE
      ?auto_8417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8419 ?auto_8420 ) ( IS-CRATE ?auto_8414 ) ( not ( = ?auto_8413 ?auto_8414 ) ) ( not ( = ?auto_8412 ?auto_8413 ) ) ( not ( = ?auto_8412 ?auto_8414 ) ) ( not ( = ?auto_8418 ?auto_8420 ) ) ( HOIST-AT ?auto_8416 ?auto_8418 ) ( not ( = ?auto_8419 ?auto_8416 ) ) ( AVAILABLE ?auto_8416 ) ( SURFACE-AT ?auto_8414 ?auto_8418 ) ( ON ?auto_8414 ?auto_8415 ) ( CLEAR ?auto_8414 ) ( not ( = ?auto_8413 ?auto_8415 ) ) ( not ( = ?auto_8414 ?auto_8415 ) ) ( not ( = ?auto_8412 ?auto_8415 ) ) ( TRUCK-AT ?auto_8417 ?auto_8420 ) ( SURFACE-AT ?auto_8412 ?auto_8420 ) ( CLEAR ?auto_8412 ) ( IS-CRATE ?auto_8413 ) ( AVAILABLE ?auto_8419 ) ( IN ?auto_8413 ?auto_8417 ) ( ON ?auto_8411 ?auto_8410 ) ( ON ?auto_8412 ?auto_8411 ) ( not ( = ?auto_8410 ?auto_8411 ) ) ( not ( = ?auto_8410 ?auto_8412 ) ) ( not ( = ?auto_8410 ?auto_8413 ) ) ( not ( = ?auto_8410 ?auto_8414 ) ) ( not ( = ?auto_8410 ?auto_8415 ) ) ( not ( = ?auto_8411 ?auto_8412 ) ) ( not ( = ?auto_8411 ?auto_8413 ) ) ( not ( = ?auto_8411 ?auto_8414 ) ) ( not ( = ?auto_8411 ?auto_8415 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8412 ?auto_8413 ?auto_8414 )
      ( MAKE-4CRATE-VERIFY ?auto_8410 ?auto_8411 ?auto_8412 ?auto_8413 ?auto_8414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8421 - SURFACE
      ?auto_8422 - SURFACE
    )
    :vars
    (
      ?auto_8428 - HOIST
      ?auto_8429 - PLACE
      ?auto_8424 - SURFACE
      ?auto_8427 - PLACE
      ?auto_8425 - HOIST
      ?auto_8423 - SURFACE
      ?auto_8426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8428 ?auto_8429 ) ( IS-CRATE ?auto_8422 ) ( not ( = ?auto_8421 ?auto_8422 ) ) ( not ( = ?auto_8424 ?auto_8421 ) ) ( not ( = ?auto_8424 ?auto_8422 ) ) ( not ( = ?auto_8427 ?auto_8429 ) ) ( HOIST-AT ?auto_8425 ?auto_8427 ) ( not ( = ?auto_8428 ?auto_8425 ) ) ( AVAILABLE ?auto_8425 ) ( SURFACE-AT ?auto_8422 ?auto_8427 ) ( ON ?auto_8422 ?auto_8423 ) ( CLEAR ?auto_8422 ) ( not ( = ?auto_8421 ?auto_8423 ) ) ( not ( = ?auto_8422 ?auto_8423 ) ) ( not ( = ?auto_8424 ?auto_8423 ) ) ( SURFACE-AT ?auto_8424 ?auto_8429 ) ( CLEAR ?auto_8424 ) ( IS-CRATE ?auto_8421 ) ( AVAILABLE ?auto_8428 ) ( IN ?auto_8421 ?auto_8426 ) ( TRUCK-AT ?auto_8426 ?auto_8427 ) )
    :subtasks
    ( ( !DRIVE ?auto_8426 ?auto_8427 ?auto_8429 )
      ( MAKE-2CRATE ?auto_8424 ?auto_8421 ?auto_8422 )
      ( MAKE-1CRATE-VERIFY ?auto_8421 ?auto_8422 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8430 - SURFACE
      ?auto_8431 - SURFACE
      ?auto_8432 - SURFACE
    )
    :vars
    (
      ?auto_8434 - HOIST
      ?auto_8438 - PLACE
      ?auto_8436 - PLACE
      ?auto_8435 - HOIST
      ?auto_8437 - SURFACE
      ?auto_8433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8434 ?auto_8438 ) ( IS-CRATE ?auto_8432 ) ( not ( = ?auto_8431 ?auto_8432 ) ) ( not ( = ?auto_8430 ?auto_8431 ) ) ( not ( = ?auto_8430 ?auto_8432 ) ) ( not ( = ?auto_8436 ?auto_8438 ) ) ( HOIST-AT ?auto_8435 ?auto_8436 ) ( not ( = ?auto_8434 ?auto_8435 ) ) ( AVAILABLE ?auto_8435 ) ( SURFACE-AT ?auto_8432 ?auto_8436 ) ( ON ?auto_8432 ?auto_8437 ) ( CLEAR ?auto_8432 ) ( not ( = ?auto_8431 ?auto_8437 ) ) ( not ( = ?auto_8432 ?auto_8437 ) ) ( not ( = ?auto_8430 ?auto_8437 ) ) ( SURFACE-AT ?auto_8430 ?auto_8438 ) ( CLEAR ?auto_8430 ) ( IS-CRATE ?auto_8431 ) ( AVAILABLE ?auto_8434 ) ( IN ?auto_8431 ?auto_8433 ) ( TRUCK-AT ?auto_8433 ?auto_8436 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8431 ?auto_8432 )
      ( MAKE-2CRATE-VERIFY ?auto_8430 ?auto_8431 ?auto_8432 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8439 - SURFACE
      ?auto_8440 - SURFACE
      ?auto_8441 - SURFACE
      ?auto_8442 - SURFACE
    )
    :vars
    (
      ?auto_8447 - HOIST
      ?auto_8448 - PLACE
      ?auto_8443 - PLACE
      ?auto_8445 - HOIST
      ?auto_8446 - SURFACE
      ?auto_8444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8447 ?auto_8448 ) ( IS-CRATE ?auto_8442 ) ( not ( = ?auto_8441 ?auto_8442 ) ) ( not ( = ?auto_8440 ?auto_8441 ) ) ( not ( = ?auto_8440 ?auto_8442 ) ) ( not ( = ?auto_8443 ?auto_8448 ) ) ( HOIST-AT ?auto_8445 ?auto_8443 ) ( not ( = ?auto_8447 ?auto_8445 ) ) ( AVAILABLE ?auto_8445 ) ( SURFACE-AT ?auto_8442 ?auto_8443 ) ( ON ?auto_8442 ?auto_8446 ) ( CLEAR ?auto_8442 ) ( not ( = ?auto_8441 ?auto_8446 ) ) ( not ( = ?auto_8442 ?auto_8446 ) ) ( not ( = ?auto_8440 ?auto_8446 ) ) ( SURFACE-AT ?auto_8440 ?auto_8448 ) ( CLEAR ?auto_8440 ) ( IS-CRATE ?auto_8441 ) ( AVAILABLE ?auto_8447 ) ( IN ?auto_8441 ?auto_8444 ) ( TRUCK-AT ?auto_8444 ?auto_8443 ) ( ON ?auto_8440 ?auto_8439 ) ( not ( = ?auto_8439 ?auto_8440 ) ) ( not ( = ?auto_8439 ?auto_8441 ) ) ( not ( = ?auto_8439 ?auto_8442 ) ) ( not ( = ?auto_8439 ?auto_8446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8440 ?auto_8441 ?auto_8442 )
      ( MAKE-3CRATE-VERIFY ?auto_8439 ?auto_8440 ?auto_8441 ?auto_8442 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8449 - SURFACE
      ?auto_8450 - SURFACE
      ?auto_8451 - SURFACE
      ?auto_8452 - SURFACE
      ?auto_8453 - SURFACE
    )
    :vars
    (
      ?auto_8458 - HOIST
      ?auto_8459 - PLACE
      ?auto_8454 - PLACE
      ?auto_8456 - HOIST
      ?auto_8457 - SURFACE
      ?auto_8455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8458 ?auto_8459 ) ( IS-CRATE ?auto_8453 ) ( not ( = ?auto_8452 ?auto_8453 ) ) ( not ( = ?auto_8451 ?auto_8452 ) ) ( not ( = ?auto_8451 ?auto_8453 ) ) ( not ( = ?auto_8454 ?auto_8459 ) ) ( HOIST-AT ?auto_8456 ?auto_8454 ) ( not ( = ?auto_8458 ?auto_8456 ) ) ( AVAILABLE ?auto_8456 ) ( SURFACE-AT ?auto_8453 ?auto_8454 ) ( ON ?auto_8453 ?auto_8457 ) ( CLEAR ?auto_8453 ) ( not ( = ?auto_8452 ?auto_8457 ) ) ( not ( = ?auto_8453 ?auto_8457 ) ) ( not ( = ?auto_8451 ?auto_8457 ) ) ( SURFACE-AT ?auto_8451 ?auto_8459 ) ( CLEAR ?auto_8451 ) ( IS-CRATE ?auto_8452 ) ( AVAILABLE ?auto_8458 ) ( IN ?auto_8452 ?auto_8455 ) ( TRUCK-AT ?auto_8455 ?auto_8454 ) ( ON ?auto_8450 ?auto_8449 ) ( ON ?auto_8451 ?auto_8450 ) ( not ( = ?auto_8449 ?auto_8450 ) ) ( not ( = ?auto_8449 ?auto_8451 ) ) ( not ( = ?auto_8449 ?auto_8452 ) ) ( not ( = ?auto_8449 ?auto_8453 ) ) ( not ( = ?auto_8449 ?auto_8457 ) ) ( not ( = ?auto_8450 ?auto_8451 ) ) ( not ( = ?auto_8450 ?auto_8452 ) ) ( not ( = ?auto_8450 ?auto_8453 ) ) ( not ( = ?auto_8450 ?auto_8457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8451 ?auto_8452 ?auto_8453 )
      ( MAKE-4CRATE-VERIFY ?auto_8449 ?auto_8450 ?auto_8451 ?auto_8452 ?auto_8453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
    )
    :vars
    (
      ?auto_8467 - HOIST
      ?auto_8468 - PLACE
      ?auto_8464 - SURFACE
      ?auto_8462 - PLACE
      ?auto_8465 - HOIST
      ?auto_8466 - SURFACE
      ?auto_8463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8467 ?auto_8468 ) ( IS-CRATE ?auto_8461 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( not ( = ?auto_8464 ?auto_8460 ) ) ( not ( = ?auto_8464 ?auto_8461 ) ) ( not ( = ?auto_8462 ?auto_8468 ) ) ( HOIST-AT ?auto_8465 ?auto_8462 ) ( not ( = ?auto_8467 ?auto_8465 ) ) ( SURFACE-AT ?auto_8461 ?auto_8462 ) ( ON ?auto_8461 ?auto_8466 ) ( CLEAR ?auto_8461 ) ( not ( = ?auto_8460 ?auto_8466 ) ) ( not ( = ?auto_8461 ?auto_8466 ) ) ( not ( = ?auto_8464 ?auto_8466 ) ) ( SURFACE-AT ?auto_8464 ?auto_8468 ) ( CLEAR ?auto_8464 ) ( IS-CRATE ?auto_8460 ) ( AVAILABLE ?auto_8467 ) ( TRUCK-AT ?auto_8463 ?auto_8462 ) ( LIFTING ?auto_8465 ?auto_8460 ) )
    :subtasks
    ( ( !LOAD ?auto_8465 ?auto_8460 ?auto_8463 ?auto_8462 )
      ( MAKE-2CRATE ?auto_8464 ?auto_8460 ?auto_8461 )
      ( MAKE-1CRATE-VERIFY ?auto_8460 ?auto_8461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8469 - SURFACE
      ?auto_8470 - SURFACE
      ?auto_8471 - SURFACE
    )
    :vars
    (
      ?auto_8475 - HOIST
      ?auto_8472 - PLACE
      ?auto_8473 - PLACE
      ?auto_8474 - HOIST
      ?auto_8476 - SURFACE
      ?auto_8477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8475 ?auto_8472 ) ( IS-CRATE ?auto_8471 ) ( not ( = ?auto_8470 ?auto_8471 ) ) ( not ( = ?auto_8469 ?auto_8470 ) ) ( not ( = ?auto_8469 ?auto_8471 ) ) ( not ( = ?auto_8473 ?auto_8472 ) ) ( HOIST-AT ?auto_8474 ?auto_8473 ) ( not ( = ?auto_8475 ?auto_8474 ) ) ( SURFACE-AT ?auto_8471 ?auto_8473 ) ( ON ?auto_8471 ?auto_8476 ) ( CLEAR ?auto_8471 ) ( not ( = ?auto_8470 ?auto_8476 ) ) ( not ( = ?auto_8471 ?auto_8476 ) ) ( not ( = ?auto_8469 ?auto_8476 ) ) ( SURFACE-AT ?auto_8469 ?auto_8472 ) ( CLEAR ?auto_8469 ) ( IS-CRATE ?auto_8470 ) ( AVAILABLE ?auto_8475 ) ( TRUCK-AT ?auto_8477 ?auto_8473 ) ( LIFTING ?auto_8474 ?auto_8470 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8470 ?auto_8471 )
      ( MAKE-2CRATE-VERIFY ?auto_8469 ?auto_8470 ?auto_8471 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8478 - SURFACE
      ?auto_8479 - SURFACE
      ?auto_8480 - SURFACE
      ?auto_8481 - SURFACE
    )
    :vars
    (
      ?auto_8487 - HOIST
      ?auto_8485 - PLACE
      ?auto_8482 - PLACE
      ?auto_8484 - HOIST
      ?auto_8483 - SURFACE
      ?auto_8486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8487 ?auto_8485 ) ( IS-CRATE ?auto_8481 ) ( not ( = ?auto_8480 ?auto_8481 ) ) ( not ( = ?auto_8479 ?auto_8480 ) ) ( not ( = ?auto_8479 ?auto_8481 ) ) ( not ( = ?auto_8482 ?auto_8485 ) ) ( HOIST-AT ?auto_8484 ?auto_8482 ) ( not ( = ?auto_8487 ?auto_8484 ) ) ( SURFACE-AT ?auto_8481 ?auto_8482 ) ( ON ?auto_8481 ?auto_8483 ) ( CLEAR ?auto_8481 ) ( not ( = ?auto_8480 ?auto_8483 ) ) ( not ( = ?auto_8481 ?auto_8483 ) ) ( not ( = ?auto_8479 ?auto_8483 ) ) ( SURFACE-AT ?auto_8479 ?auto_8485 ) ( CLEAR ?auto_8479 ) ( IS-CRATE ?auto_8480 ) ( AVAILABLE ?auto_8487 ) ( TRUCK-AT ?auto_8486 ?auto_8482 ) ( LIFTING ?auto_8484 ?auto_8480 ) ( ON ?auto_8479 ?auto_8478 ) ( not ( = ?auto_8478 ?auto_8479 ) ) ( not ( = ?auto_8478 ?auto_8480 ) ) ( not ( = ?auto_8478 ?auto_8481 ) ) ( not ( = ?auto_8478 ?auto_8483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8479 ?auto_8480 ?auto_8481 )
      ( MAKE-3CRATE-VERIFY ?auto_8478 ?auto_8479 ?auto_8480 ?auto_8481 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8488 - SURFACE
      ?auto_8489 - SURFACE
      ?auto_8490 - SURFACE
      ?auto_8491 - SURFACE
      ?auto_8492 - SURFACE
    )
    :vars
    (
      ?auto_8498 - HOIST
      ?auto_8496 - PLACE
      ?auto_8493 - PLACE
      ?auto_8495 - HOIST
      ?auto_8494 - SURFACE
      ?auto_8497 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8498 ?auto_8496 ) ( IS-CRATE ?auto_8492 ) ( not ( = ?auto_8491 ?auto_8492 ) ) ( not ( = ?auto_8490 ?auto_8491 ) ) ( not ( = ?auto_8490 ?auto_8492 ) ) ( not ( = ?auto_8493 ?auto_8496 ) ) ( HOIST-AT ?auto_8495 ?auto_8493 ) ( not ( = ?auto_8498 ?auto_8495 ) ) ( SURFACE-AT ?auto_8492 ?auto_8493 ) ( ON ?auto_8492 ?auto_8494 ) ( CLEAR ?auto_8492 ) ( not ( = ?auto_8491 ?auto_8494 ) ) ( not ( = ?auto_8492 ?auto_8494 ) ) ( not ( = ?auto_8490 ?auto_8494 ) ) ( SURFACE-AT ?auto_8490 ?auto_8496 ) ( CLEAR ?auto_8490 ) ( IS-CRATE ?auto_8491 ) ( AVAILABLE ?auto_8498 ) ( TRUCK-AT ?auto_8497 ?auto_8493 ) ( LIFTING ?auto_8495 ?auto_8491 ) ( ON ?auto_8489 ?auto_8488 ) ( ON ?auto_8490 ?auto_8489 ) ( not ( = ?auto_8488 ?auto_8489 ) ) ( not ( = ?auto_8488 ?auto_8490 ) ) ( not ( = ?auto_8488 ?auto_8491 ) ) ( not ( = ?auto_8488 ?auto_8492 ) ) ( not ( = ?auto_8488 ?auto_8494 ) ) ( not ( = ?auto_8489 ?auto_8490 ) ) ( not ( = ?auto_8489 ?auto_8491 ) ) ( not ( = ?auto_8489 ?auto_8492 ) ) ( not ( = ?auto_8489 ?auto_8494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8490 ?auto_8491 ?auto_8492 )
      ( MAKE-4CRATE-VERIFY ?auto_8488 ?auto_8489 ?auto_8490 ?auto_8491 ?auto_8492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8499 - SURFACE
      ?auto_8500 - SURFACE
    )
    :vars
    (
      ?auto_8507 - HOIST
      ?auto_8504 - PLACE
      ?auto_8505 - SURFACE
      ?auto_8501 - PLACE
      ?auto_8503 - HOIST
      ?auto_8502 - SURFACE
      ?auto_8506 - TRUCK
      ?auto_8508 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8507 ?auto_8504 ) ( IS-CRATE ?auto_8500 ) ( not ( = ?auto_8499 ?auto_8500 ) ) ( not ( = ?auto_8505 ?auto_8499 ) ) ( not ( = ?auto_8505 ?auto_8500 ) ) ( not ( = ?auto_8501 ?auto_8504 ) ) ( HOIST-AT ?auto_8503 ?auto_8501 ) ( not ( = ?auto_8507 ?auto_8503 ) ) ( SURFACE-AT ?auto_8500 ?auto_8501 ) ( ON ?auto_8500 ?auto_8502 ) ( CLEAR ?auto_8500 ) ( not ( = ?auto_8499 ?auto_8502 ) ) ( not ( = ?auto_8500 ?auto_8502 ) ) ( not ( = ?auto_8505 ?auto_8502 ) ) ( SURFACE-AT ?auto_8505 ?auto_8504 ) ( CLEAR ?auto_8505 ) ( IS-CRATE ?auto_8499 ) ( AVAILABLE ?auto_8507 ) ( TRUCK-AT ?auto_8506 ?auto_8501 ) ( AVAILABLE ?auto_8503 ) ( SURFACE-AT ?auto_8499 ?auto_8501 ) ( ON ?auto_8499 ?auto_8508 ) ( CLEAR ?auto_8499 ) ( not ( = ?auto_8499 ?auto_8508 ) ) ( not ( = ?auto_8500 ?auto_8508 ) ) ( not ( = ?auto_8505 ?auto_8508 ) ) ( not ( = ?auto_8502 ?auto_8508 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8503 ?auto_8499 ?auto_8508 ?auto_8501 )
      ( MAKE-2CRATE ?auto_8505 ?auto_8499 ?auto_8500 )
      ( MAKE-1CRATE-VERIFY ?auto_8499 ?auto_8500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8509 - SURFACE
      ?auto_8510 - SURFACE
      ?auto_8511 - SURFACE
    )
    :vars
    (
      ?auto_8513 - HOIST
      ?auto_8512 - PLACE
      ?auto_8517 - PLACE
      ?auto_8518 - HOIST
      ?auto_8516 - SURFACE
      ?auto_8514 - TRUCK
      ?auto_8515 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8513 ?auto_8512 ) ( IS-CRATE ?auto_8511 ) ( not ( = ?auto_8510 ?auto_8511 ) ) ( not ( = ?auto_8509 ?auto_8510 ) ) ( not ( = ?auto_8509 ?auto_8511 ) ) ( not ( = ?auto_8517 ?auto_8512 ) ) ( HOIST-AT ?auto_8518 ?auto_8517 ) ( not ( = ?auto_8513 ?auto_8518 ) ) ( SURFACE-AT ?auto_8511 ?auto_8517 ) ( ON ?auto_8511 ?auto_8516 ) ( CLEAR ?auto_8511 ) ( not ( = ?auto_8510 ?auto_8516 ) ) ( not ( = ?auto_8511 ?auto_8516 ) ) ( not ( = ?auto_8509 ?auto_8516 ) ) ( SURFACE-AT ?auto_8509 ?auto_8512 ) ( CLEAR ?auto_8509 ) ( IS-CRATE ?auto_8510 ) ( AVAILABLE ?auto_8513 ) ( TRUCK-AT ?auto_8514 ?auto_8517 ) ( AVAILABLE ?auto_8518 ) ( SURFACE-AT ?auto_8510 ?auto_8517 ) ( ON ?auto_8510 ?auto_8515 ) ( CLEAR ?auto_8510 ) ( not ( = ?auto_8510 ?auto_8515 ) ) ( not ( = ?auto_8511 ?auto_8515 ) ) ( not ( = ?auto_8509 ?auto_8515 ) ) ( not ( = ?auto_8516 ?auto_8515 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8510 ?auto_8511 )
      ( MAKE-2CRATE-VERIFY ?auto_8509 ?auto_8510 ?auto_8511 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8519 - SURFACE
      ?auto_8520 - SURFACE
      ?auto_8521 - SURFACE
      ?auto_8522 - SURFACE
    )
    :vars
    (
      ?auto_8529 - HOIST
      ?auto_8526 - PLACE
      ?auto_8523 - PLACE
      ?auto_8524 - HOIST
      ?auto_8528 - SURFACE
      ?auto_8525 - TRUCK
      ?auto_8527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8529 ?auto_8526 ) ( IS-CRATE ?auto_8522 ) ( not ( = ?auto_8521 ?auto_8522 ) ) ( not ( = ?auto_8520 ?auto_8521 ) ) ( not ( = ?auto_8520 ?auto_8522 ) ) ( not ( = ?auto_8523 ?auto_8526 ) ) ( HOIST-AT ?auto_8524 ?auto_8523 ) ( not ( = ?auto_8529 ?auto_8524 ) ) ( SURFACE-AT ?auto_8522 ?auto_8523 ) ( ON ?auto_8522 ?auto_8528 ) ( CLEAR ?auto_8522 ) ( not ( = ?auto_8521 ?auto_8528 ) ) ( not ( = ?auto_8522 ?auto_8528 ) ) ( not ( = ?auto_8520 ?auto_8528 ) ) ( SURFACE-AT ?auto_8520 ?auto_8526 ) ( CLEAR ?auto_8520 ) ( IS-CRATE ?auto_8521 ) ( AVAILABLE ?auto_8529 ) ( TRUCK-AT ?auto_8525 ?auto_8523 ) ( AVAILABLE ?auto_8524 ) ( SURFACE-AT ?auto_8521 ?auto_8523 ) ( ON ?auto_8521 ?auto_8527 ) ( CLEAR ?auto_8521 ) ( not ( = ?auto_8521 ?auto_8527 ) ) ( not ( = ?auto_8522 ?auto_8527 ) ) ( not ( = ?auto_8520 ?auto_8527 ) ) ( not ( = ?auto_8528 ?auto_8527 ) ) ( ON ?auto_8520 ?auto_8519 ) ( not ( = ?auto_8519 ?auto_8520 ) ) ( not ( = ?auto_8519 ?auto_8521 ) ) ( not ( = ?auto_8519 ?auto_8522 ) ) ( not ( = ?auto_8519 ?auto_8528 ) ) ( not ( = ?auto_8519 ?auto_8527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8520 ?auto_8521 ?auto_8522 )
      ( MAKE-3CRATE-VERIFY ?auto_8519 ?auto_8520 ?auto_8521 ?auto_8522 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8530 - SURFACE
      ?auto_8531 - SURFACE
      ?auto_8532 - SURFACE
      ?auto_8533 - SURFACE
      ?auto_8534 - SURFACE
    )
    :vars
    (
      ?auto_8541 - HOIST
      ?auto_8538 - PLACE
      ?auto_8535 - PLACE
      ?auto_8536 - HOIST
      ?auto_8540 - SURFACE
      ?auto_8537 - TRUCK
      ?auto_8539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8541 ?auto_8538 ) ( IS-CRATE ?auto_8534 ) ( not ( = ?auto_8533 ?auto_8534 ) ) ( not ( = ?auto_8532 ?auto_8533 ) ) ( not ( = ?auto_8532 ?auto_8534 ) ) ( not ( = ?auto_8535 ?auto_8538 ) ) ( HOIST-AT ?auto_8536 ?auto_8535 ) ( not ( = ?auto_8541 ?auto_8536 ) ) ( SURFACE-AT ?auto_8534 ?auto_8535 ) ( ON ?auto_8534 ?auto_8540 ) ( CLEAR ?auto_8534 ) ( not ( = ?auto_8533 ?auto_8540 ) ) ( not ( = ?auto_8534 ?auto_8540 ) ) ( not ( = ?auto_8532 ?auto_8540 ) ) ( SURFACE-AT ?auto_8532 ?auto_8538 ) ( CLEAR ?auto_8532 ) ( IS-CRATE ?auto_8533 ) ( AVAILABLE ?auto_8541 ) ( TRUCK-AT ?auto_8537 ?auto_8535 ) ( AVAILABLE ?auto_8536 ) ( SURFACE-AT ?auto_8533 ?auto_8535 ) ( ON ?auto_8533 ?auto_8539 ) ( CLEAR ?auto_8533 ) ( not ( = ?auto_8533 ?auto_8539 ) ) ( not ( = ?auto_8534 ?auto_8539 ) ) ( not ( = ?auto_8532 ?auto_8539 ) ) ( not ( = ?auto_8540 ?auto_8539 ) ) ( ON ?auto_8531 ?auto_8530 ) ( ON ?auto_8532 ?auto_8531 ) ( not ( = ?auto_8530 ?auto_8531 ) ) ( not ( = ?auto_8530 ?auto_8532 ) ) ( not ( = ?auto_8530 ?auto_8533 ) ) ( not ( = ?auto_8530 ?auto_8534 ) ) ( not ( = ?auto_8530 ?auto_8540 ) ) ( not ( = ?auto_8530 ?auto_8539 ) ) ( not ( = ?auto_8531 ?auto_8532 ) ) ( not ( = ?auto_8531 ?auto_8533 ) ) ( not ( = ?auto_8531 ?auto_8534 ) ) ( not ( = ?auto_8531 ?auto_8540 ) ) ( not ( = ?auto_8531 ?auto_8539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8532 ?auto_8533 ?auto_8534 )
      ( MAKE-4CRATE-VERIFY ?auto_8530 ?auto_8531 ?auto_8532 ?auto_8533 ?auto_8534 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8542 - SURFACE
      ?auto_8543 - SURFACE
    )
    :vars
    (
      ?auto_8551 - HOIST
      ?auto_8547 - PLACE
      ?auto_8550 - SURFACE
      ?auto_8544 - PLACE
      ?auto_8545 - HOIST
      ?auto_8549 - SURFACE
      ?auto_8548 - SURFACE
      ?auto_8546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8551 ?auto_8547 ) ( IS-CRATE ?auto_8543 ) ( not ( = ?auto_8542 ?auto_8543 ) ) ( not ( = ?auto_8550 ?auto_8542 ) ) ( not ( = ?auto_8550 ?auto_8543 ) ) ( not ( = ?auto_8544 ?auto_8547 ) ) ( HOIST-AT ?auto_8545 ?auto_8544 ) ( not ( = ?auto_8551 ?auto_8545 ) ) ( SURFACE-AT ?auto_8543 ?auto_8544 ) ( ON ?auto_8543 ?auto_8549 ) ( CLEAR ?auto_8543 ) ( not ( = ?auto_8542 ?auto_8549 ) ) ( not ( = ?auto_8543 ?auto_8549 ) ) ( not ( = ?auto_8550 ?auto_8549 ) ) ( SURFACE-AT ?auto_8550 ?auto_8547 ) ( CLEAR ?auto_8550 ) ( IS-CRATE ?auto_8542 ) ( AVAILABLE ?auto_8551 ) ( AVAILABLE ?auto_8545 ) ( SURFACE-AT ?auto_8542 ?auto_8544 ) ( ON ?auto_8542 ?auto_8548 ) ( CLEAR ?auto_8542 ) ( not ( = ?auto_8542 ?auto_8548 ) ) ( not ( = ?auto_8543 ?auto_8548 ) ) ( not ( = ?auto_8550 ?auto_8548 ) ) ( not ( = ?auto_8549 ?auto_8548 ) ) ( TRUCK-AT ?auto_8546 ?auto_8547 ) )
    :subtasks
    ( ( !DRIVE ?auto_8546 ?auto_8547 ?auto_8544 )
      ( MAKE-2CRATE ?auto_8550 ?auto_8542 ?auto_8543 )
      ( MAKE-1CRATE-VERIFY ?auto_8542 ?auto_8543 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8552 - SURFACE
      ?auto_8553 - SURFACE
      ?auto_8554 - SURFACE
    )
    :vars
    (
      ?auto_8555 - HOIST
      ?auto_8559 - PLACE
      ?auto_8560 - PLACE
      ?auto_8558 - HOIST
      ?auto_8557 - SURFACE
      ?auto_8556 - SURFACE
      ?auto_8561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8555 ?auto_8559 ) ( IS-CRATE ?auto_8554 ) ( not ( = ?auto_8553 ?auto_8554 ) ) ( not ( = ?auto_8552 ?auto_8553 ) ) ( not ( = ?auto_8552 ?auto_8554 ) ) ( not ( = ?auto_8560 ?auto_8559 ) ) ( HOIST-AT ?auto_8558 ?auto_8560 ) ( not ( = ?auto_8555 ?auto_8558 ) ) ( SURFACE-AT ?auto_8554 ?auto_8560 ) ( ON ?auto_8554 ?auto_8557 ) ( CLEAR ?auto_8554 ) ( not ( = ?auto_8553 ?auto_8557 ) ) ( not ( = ?auto_8554 ?auto_8557 ) ) ( not ( = ?auto_8552 ?auto_8557 ) ) ( SURFACE-AT ?auto_8552 ?auto_8559 ) ( CLEAR ?auto_8552 ) ( IS-CRATE ?auto_8553 ) ( AVAILABLE ?auto_8555 ) ( AVAILABLE ?auto_8558 ) ( SURFACE-AT ?auto_8553 ?auto_8560 ) ( ON ?auto_8553 ?auto_8556 ) ( CLEAR ?auto_8553 ) ( not ( = ?auto_8553 ?auto_8556 ) ) ( not ( = ?auto_8554 ?auto_8556 ) ) ( not ( = ?auto_8552 ?auto_8556 ) ) ( not ( = ?auto_8557 ?auto_8556 ) ) ( TRUCK-AT ?auto_8561 ?auto_8559 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8553 ?auto_8554 )
      ( MAKE-2CRATE-VERIFY ?auto_8552 ?auto_8553 ?auto_8554 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8562 - SURFACE
      ?auto_8563 - SURFACE
      ?auto_8564 - SURFACE
      ?auto_8565 - SURFACE
    )
    :vars
    (
      ?auto_8569 - HOIST
      ?auto_8570 - PLACE
      ?auto_8572 - PLACE
      ?auto_8571 - HOIST
      ?auto_8568 - SURFACE
      ?auto_8567 - SURFACE
      ?auto_8566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8569 ?auto_8570 ) ( IS-CRATE ?auto_8565 ) ( not ( = ?auto_8564 ?auto_8565 ) ) ( not ( = ?auto_8563 ?auto_8564 ) ) ( not ( = ?auto_8563 ?auto_8565 ) ) ( not ( = ?auto_8572 ?auto_8570 ) ) ( HOIST-AT ?auto_8571 ?auto_8572 ) ( not ( = ?auto_8569 ?auto_8571 ) ) ( SURFACE-AT ?auto_8565 ?auto_8572 ) ( ON ?auto_8565 ?auto_8568 ) ( CLEAR ?auto_8565 ) ( not ( = ?auto_8564 ?auto_8568 ) ) ( not ( = ?auto_8565 ?auto_8568 ) ) ( not ( = ?auto_8563 ?auto_8568 ) ) ( SURFACE-AT ?auto_8563 ?auto_8570 ) ( CLEAR ?auto_8563 ) ( IS-CRATE ?auto_8564 ) ( AVAILABLE ?auto_8569 ) ( AVAILABLE ?auto_8571 ) ( SURFACE-AT ?auto_8564 ?auto_8572 ) ( ON ?auto_8564 ?auto_8567 ) ( CLEAR ?auto_8564 ) ( not ( = ?auto_8564 ?auto_8567 ) ) ( not ( = ?auto_8565 ?auto_8567 ) ) ( not ( = ?auto_8563 ?auto_8567 ) ) ( not ( = ?auto_8568 ?auto_8567 ) ) ( TRUCK-AT ?auto_8566 ?auto_8570 ) ( ON ?auto_8563 ?auto_8562 ) ( not ( = ?auto_8562 ?auto_8563 ) ) ( not ( = ?auto_8562 ?auto_8564 ) ) ( not ( = ?auto_8562 ?auto_8565 ) ) ( not ( = ?auto_8562 ?auto_8568 ) ) ( not ( = ?auto_8562 ?auto_8567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8563 ?auto_8564 ?auto_8565 )
      ( MAKE-3CRATE-VERIFY ?auto_8562 ?auto_8563 ?auto_8564 ?auto_8565 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8573 - SURFACE
      ?auto_8574 - SURFACE
      ?auto_8575 - SURFACE
      ?auto_8576 - SURFACE
      ?auto_8577 - SURFACE
    )
    :vars
    (
      ?auto_8581 - HOIST
      ?auto_8582 - PLACE
      ?auto_8584 - PLACE
      ?auto_8583 - HOIST
      ?auto_8580 - SURFACE
      ?auto_8579 - SURFACE
      ?auto_8578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8581 ?auto_8582 ) ( IS-CRATE ?auto_8577 ) ( not ( = ?auto_8576 ?auto_8577 ) ) ( not ( = ?auto_8575 ?auto_8576 ) ) ( not ( = ?auto_8575 ?auto_8577 ) ) ( not ( = ?auto_8584 ?auto_8582 ) ) ( HOIST-AT ?auto_8583 ?auto_8584 ) ( not ( = ?auto_8581 ?auto_8583 ) ) ( SURFACE-AT ?auto_8577 ?auto_8584 ) ( ON ?auto_8577 ?auto_8580 ) ( CLEAR ?auto_8577 ) ( not ( = ?auto_8576 ?auto_8580 ) ) ( not ( = ?auto_8577 ?auto_8580 ) ) ( not ( = ?auto_8575 ?auto_8580 ) ) ( SURFACE-AT ?auto_8575 ?auto_8582 ) ( CLEAR ?auto_8575 ) ( IS-CRATE ?auto_8576 ) ( AVAILABLE ?auto_8581 ) ( AVAILABLE ?auto_8583 ) ( SURFACE-AT ?auto_8576 ?auto_8584 ) ( ON ?auto_8576 ?auto_8579 ) ( CLEAR ?auto_8576 ) ( not ( = ?auto_8576 ?auto_8579 ) ) ( not ( = ?auto_8577 ?auto_8579 ) ) ( not ( = ?auto_8575 ?auto_8579 ) ) ( not ( = ?auto_8580 ?auto_8579 ) ) ( TRUCK-AT ?auto_8578 ?auto_8582 ) ( ON ?auto_8574 ?auto_8573 ) ( ON ?auto_8575 ?auto_8574 ) ( not ( = ?auto_8573 ?auto_8574 ) ) ( not ( = ?auto_8573 ?auto_8575 ) ) ( not ( = ?auto_8573 ?auto_8576 ) ) ( not ( = ?auto_8573 ?auto_8577 ) ) ( not ( = ?auto_8573 ?auto_8580 ) ) ( not ( = ?auto_8573 ?auto_8579 ) ) ( not ( = ?auto_8574 ?auto_8575 ) ) ( not ( = ?auto_8574 ?auto_8576 ) ) ( not ( = ?auto_8574 ?auto_8577 ) ) ( not ( = ?auto_8574 ?auto_8580 ) ) ( not ( = ?auto_8574 ?auto_8579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8575 ?auto_8576 ?auto_8577 )
      ( MAKE-4CRATE-VERIFY ?auto_8573 ?auto_8574 ?auto_8575 ?auto_8576 ?auto_8577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8585 - SURFACE
      ?auto_8586 - SURFACE
    )
    :vars
    (
      ?auto_8590 - HOIST
      ?auto_8591 - PLACE
      ?auto_8594 - SURFACE
      ?auto_8593 - PLACE
      ?auto_8592 - HOIST
      ?auto_8589 - SURFACE
      ?auto_8588 - SURFACE
      ?auto_8587 - TRUCK
      ?auto_8595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8590 ?auto_8591 ) ( IS-CRATE ?auto_8586 ) ( not ( = ?auto_8585 ?auto_8586 ) ) ( not ( = ?auto_8594 ?auto_8585 ) ) ( not ( = ?auto_8594 ?auto_8586 ) ) ( not ( = ?auto_8593 ?auto_8591 ) ) ( HOIST-AT ?auto_8592 ?auto_8593 ) ( not ( = ?auto_8590 ?auto_8592 ) ) ( SURFACE-AT ?auto_8586 ?auto_8593 ) ( ON ?auto_8586 ?auto_8589 ) ( CLEAR ?auto_8586 ) ( not ( = ?auto_8585 ?auto_8589 ) ) ( not ( = ?auto_8586 ?auto_8589 ) ) ( not ( = ?auto_8594 ?auto_8589 ) ) ( IS-CRATE ?auto_8585 ) ( AVAILABLE ?auto_8592 ) ( SURFACE-AT ?auto_8585 ?auto_8593 ) ( ON ?auto_8585 ?auto_8588 ) ( CLEAR ?auto_8585 ) ( not ( = ?auto_8585 ?auto_8588 ) ) ( not ( = ?auto_8586 ?auto_8588 ) ) ( not ( = ?auto_8594 ?auto_8588 ) ) ( not ( = ?auto_8589 ?auto_8588 ) ) ( TRUCK-AT ?auto_8587 ?auto_8591 ) ( SURFACE-AT ?auto_8595 ?auto_8591 ) ( CLEAR ?auto_8595 ) ( LIFTING ?auto_8590 ?auto_8594 ) ( IS-CRATE ?auto_8594 ) ( not ( = ?auto_8595 ?auto_8594 ) ) ( not ( = ?auto_8585 ?auto_8595 ) ) ( not ( = ?auto_8586 ?auto_8595 ) ) ( not ( = ?auto_8589 ?auto_8595 ) ) ( not ( = ?auto_8588 ?auto_8595 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8595 ?auto_8594 )
      ( MAKE-2CRATE ?auto_8594 ?auto_8585 ?auto_8586 )
      ( MAKE-1CRATE-VERIFY ?auto_8585 ?auto_8586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8596 - SURFACE
      ?auto_8597 - SURFACE
      ?auto_8598 - SURFACE
    )
    :vars
    (
      ?auto_8604 - HOIST
      ?auto_8602 - PLACE
      ?auto_8600 - PLACE
      ?auto_8601 - HOIST
      ?auto_8603 - SURFACE
      ?auto_8605 - SURFACE
      ?auto_8599 - TRUCK
      ?auto_8606 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8604 ?auto_8602 ) ( IS-CRATE ?auto_8598 ) ( not ( = ?auto_8597 ?auto_8598 ) ) ( not ( = ?auto_8596 ?auto_8597 ) ) ( not ( = ?auto_8596 ?auto_8598 ) ) ( not ( = ?auto_8600 ?auto_8602 ) ) ( HOIST-AT ?auto_8601 ?auto_8600 ) ( not ( = ?auto_8604 ?auto_8601 ) ) ( SURFACE-AT ?auto_8598 ?auto_8600 ) ( ON ?auto_8598 ?auto_8603 ) ( CLEAR ?auto_8598 ) ( not ( = ?auto_8597 ?auto_8603 ) ) ( not ( = ?auto_8598 ?auto_8603 ) ) ( not ( = ?auto_8596 ?auto_8603 ) ) ( IS-CRATE ?auto_8597 ) ( AVAILABLE ?auto_8601 ) ( SURFACE-AT ?auto_8597 ?auto_8600 ) ( ON ?auto_8597 ?auto_8605 ) ( CLEAR ?auto_8597 ) ( not ( = ?auto_8597 ?auto_8605 ) ) ( not ( = ?auto_8598 ?auto_8605 ) ) ( not ( = ?auto_8596 ?auto_8605 ) ) ( not ( = ?auto_8603 ?auto_8605 ) ) ( TRUCK-AT ?auto_8599 ?auto_8602 ) ( SURFACE-AT ?auto_8606 ?auto_8602 ) ( CLEAR ?auto_8606 ) ( LIFTING ?auto_8604 ?auto_8596 ) ( IS-CRATE ?auto_8596 ) ( not ( = ?auto_8606 ?auto_8596 ) ) ( not ( = ?auto_8597 ?auto_8606 ) ) ( not ( = ?auto_8598 ?auto_8606 ) ) ( not ( = ?auto_8603 ?auto_8606 ) ) ( not ( = ?auto_8605 ?auto_8606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8597 ?auto_8598 )
      ( MAKE-2CRATE-VERIFY ?auto_8596 ?auto_8597 ?auto_8598 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8607 - SURFACE
      ?auto_8608 - SURFACE
      ?auto_8609 - SURFACE
      ?auto_8610 - SURFACE
    )
    :vars
    (
      ?auto_8615 - HOIST
      ?auto_8614 - PLACE
      ?auto_8612 - PLACE
      ?auto_8617 - HOIST
      ?auto_8613 - SURFACE
      ?auto_8611 - SURFACE
      ?auto_8616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8615 ?auto_8614 ) ( IS-CRATE ?auto_8610 ) ( not ( = ?auto_8609 ?auto_8610 ) ) ( not ( = ?auto_8608 ?auto_8609 ) ) ( not ( = ?auto_8608 ?auto_8610 ) ) ( not ( = ?auto_8612 ?auto_8614 ) ) ( HOIST-AT ?auto_8617 ?auto_8612 ) ( not ( = ?auto_8615 ?auto_8617 ) ) ( SURFACE-AT ?auto_8610 ?auto_8612 ) ( ON ?auto_8610 ?auto_8613 ) ( CLEAR ?auto_8610 ) ( not ( = ?auto_8609 ?auto_8613 ) ) ( not ( = ?auto_8610 ?auto_8613 ) ) ( not ( = ?auto_8608 ?auto_8613 ) ) ( IS-CRATE ?auto_8609 ) ( AVAILABLE ?auto_8617 ) ( SURFACE-AT ?auto_8609 ?auto_8612 ) ( ON ?auto_8609 ?auto_8611 ) ( CLEAR ?auto_8609 ) ( not ( = ?auto_8609 ?auto_8611 ) ) ( not ( = ?auto_8610 ?auto_8611 ) ) ( not ( = ?auto_8608 ?auto_8611 ) ) ( not ( = ?auto_8613 ?auto_8611 ) ) ( TRUCK-AT ?auto_8616 ?auto_8614 ) ( SURFACE-AT ?auto_8607 ?auto_8614 ) ( CLEAR ?auto_8607 ) ( LIFTING ?auto_8615 ?auto_8608 ) ( IS-CRATE ?auto_8608 ) ( not ( = ?auto_8607 ?auto_8608 ) ) ( not ( = ?auto_8609 ?auto_8607 ) ) ( not ( = ?auto_8610 ?auto_8607 ) ) ( not ( = ?auto_8613 ?auto_8607 ) ) ( not ( = ?auto_8611 ?auto_8607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8608 ?auto_8609 ?auto_8610 )
      ( MAKE-3CRATE-VERIFY ?auto_8607 ?auto_8608 ?auto_8609 ?auto_8610 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8618 - SURFACE
      ?auto_8619 - SURFACE
      ?auto_8620 - SURFACE
      ?auto_8621 - SURFACE
      ?auto_8622 - SURFACE
    )
    :vars
    (
      ?auto_8627 - HOIST
      ?auto_8626 - PLACE
      ?auto_8624 - PLACE
      ?auto_8629 - HOIST
      ?auto_8625 - SURFACE
      ?auto_8623 - SURFACE
      ?auto_8628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8627 ?auto_8626 ) ( IS-CRATE ?auto_8622 ) ( not ( = ?auto_8621 ?auto_8622 ) ) ( not ( = ?auto_8620 ?auto_8621 ) ) ( not ( = ?auto_8620 ?auto_8622 ) ) ( not ( = ?auto_8624 ?auto_8626 ) ) ( HOIST-AT ?auto_8629 ?auto_8624 ) ( not ( = ?auto_8627 ?auto_8629 ) ) ( SURFACE-AT ?auto_8622 ?auto_8624 ) ( ON ?auto_8622 ?auto_8625 ) ( CLEAR ?auto_8622 ) ( not ( = ?auto_8621 ?auto_8625 ) ) ( not ( = ?auto_8622 ?auto_8625 ) ) ( not ( = ?auto_8620 ?auto_8625 ) ) ( IS-CRATE ?auto_8621 ) ( AVAILABLE ?auto_8629 ) ( SURFACE-AT ?auto_8621 ?auto_8624 ) ( ON ?auto_8621 ?auto_8623 ) ( CLEAR ?auto_8621 ) ( not ( = ?auto_8621 ?auto_8623 ) ) ( not ( = ?auto_8622 ?auto_8623 ) ) ( not ( = ?auto_8620 ?auto_8623 ) ) ( not ( = ?auto_8625 ?auto_8623 ) ) ( TRUCK-AT ?auto_8628 ?auto_8626 ) ( SURFACE-AT ?auto_8619 ?auto_8626 ) ( CLEAR ?auto_8619 ) ( LIFTING ?auto_8627 ?auto_8620 ) ( IS-CRATE ?auto_8620 ) ( not ( = ?auto_8619 ?auto_8620 ) ) ( not ( = ?auto_8621 ?auto_8619 ) ) ( not ( = ?auto_8622 ?auto_8619 ) ) ( not ( = ?auto_8625 ?auto_8619 ) ) ( not ( = ?auto_8623 ?auto_8619 ) ) ( ON ?auto_8619 ?auto_8618 ) ( not ( = ?auto_8618 ?auto_8619 ) ) ( not ( = ?auto_8618 ?auto_8620 ) ) ( not ( = ?auto_8618 ?auto_8621 ) ) ( not ( = ?auto_8618 ?auto_8622 ) ) ( not ( = ?auto_8618 ?auto_8625 ) ) ( not ( = ?auto_8618 ?auto_8623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8620 ?auto_8621 ?auto_8622 )
      ( MAKE-4CRATE-VERIFY ?auto_8618 ?auto_8619 ?auto_8620 ?auto_8621 ?auto_8622 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8630 - SURFACE
      ?auto_8631 - SURFACE
    )
    :vars
    (
      ?auto_8637 - HOIST
      ?auto_8636 - PLACE
      ?auto_8632 - SURFACE
      ?auto_8634 - PLACE
      ?auto_8640 - HOIST
      ?auto_8635 - SURFACE
      ?auto_8633 - SURFACE
      ?auto_8639 - TRUCK
      ?auto_8638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8637 ?auto_8636 ) ( IS-CRATE ?auto_8631 ) ( not ( = ?auto_8630 ?auto_8631 ) ) ( not ( = ?auto_8632 ?auto_8630 ) ) ( not ( = ?auto_8632 ?auto_8631 ) ) ( not ( = ?auto_8634 ?auto_8636 ) ) ( HOIST-AT ?auto_8640 ?auto_8634 ) ( not ( = ?auto_8637 ?auto_8640 ) ) ( SURFACE-AT ?auto_8631 ?auto_8634 ) ( ON ?auto_8631 ?auto_8635 ) ( CLEAR ?auto_8631 ) ( not ( = ?auto_8630 ?auto_8635 ) ) ( not ( = ?auto_8631 ?auto_8635 ) ) ( not ( = ?auto_8632 ?auto_8635 ) ) ( IS-CRATE ?auto_8630 ) ( AVAILABLE ?auto_8640 ) ( SURFACE-AT ?auto_8630 ?auto_8634 ) ( ON ?auto_8630 ?auto_8633 ) ( CLEAR ?auto_8630 ) ( not ( = ?auto_8630 ?auto_8633 ) ) ( not ( = ?auto_8631 ?auto_8633 ) ) ( not ( = ?auto_8632 ?auto_8633 ) ) ( not ( = ?auto_8635 ?auto_8633 ) ) ( TRUCK-AT ?auto_8639 ?auto_8636 ) ( SURFACE-AT ?auto_8638 ?auto_8636 ) ( CLEAR ?auto_8638 ) ( IS-CRATE ?auto_8632 ) ( not ( = ?auto_8638 ?auto_8632 ) ) ( not ( = ?auto_8630 ?auto_8638 ) ) ( not ( = ?auto_8631 ?auto_8638 ) ) ( not ( = ?auto_8635 ?auto_8638 ) ) ( not ( = ?auto_8633 ?auto_8638 ) ) ( AVAILABLE ?auto_8637 ) ( IN ?auto_8632 ?auto_8639 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8637 ?auto_8632 ?auto_8639 ?auto_8636 )
      ( MAKE-2CRATE ?auto_8632 ?auto_8630 ?auto_8631 )
      ( MAKE-1CRATE-VERIFY ?auto_8630 ?auto_8631 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8641 - SURFACE
      ?auto_8642 - SURFACE
      ?auto_8643 - SURFACE
    )
    :vars
    (
      ?auto_8648 - HOIST
      ?auto_8649 - PLACE
      ?auto_8651 - PLACE
      ?auto_8647 - HOIST
      ?auto_8646 - SURFACE
      ?auto_8650 - SURFACE
      ?auto_8644 - TRUCK
      ?auto_8645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8648 ?auto_8649 ) ( IS-CRATE ?auto_8643 ) ( not ( = ?auto_8642 ?auto_8643 ) ) ( not ( = ?auto_8641 ?auto_8642 ) ) ( not ( = ?auto_8641 ?auto_8643 ) ) ( not ( = ?auto_8651 ?auto_8649 ) ) ( HOIST-AT ?auto_8647 ?auto_8651 ) ( not ( = ?auto_8648 ?auto_8647 ) ) ( SURFACE-AT ?auto_8643 ?auto_8651 ) ( ON ?auto_8643 ?auto_8646 ) ( CLEAR ?auto_8643 ) ( not ( = ?auto_8642 ?auto_8646 ) ) ( not ( = ?auto_8643 ?auto_8646 ) ) ( not ( = ?auto_8641 ?auto_8646 ) ) ( IS-CRATE ?auto_8642 ) ( AVAILABLE ?auto_8647 ) ( SURFACE-AT ?auto_8642 ?auto_8651 ) ( ON ?auto_8642 ?auto_8650 ) ( CLEAR ?auto_8642 ) ( not ( = ?auto_8642 ?auto_8650 ) ) ( not ( = ?auto_8643 ?auto_8650 ) ) ( not ( = ?auto_8641 ?auto_8650 ) ) ( not ( = ?auto_8646 ?auto_8650 ) ) ( TRUCK-AT ?auto_8644 ?auto_8649 ) ( SURFACE-AT ?auto_8645 ?auto_8649 ) ( CLEAR ?auto_8645 ) ( IS-CRATE ?auto_8641 ) ( not ( = ?auto_8645 ?auto_8641 ) ) ( not ( = ?auto_8642 ?auto_8645 ) ) ( not ( = ?auto_8643 ?auto_8645 ) ) ( not ( = ?auto_8646 ?auto_8645 ) ) ( not ( = ?auto_8650 ?auto_8645 ) ) ( AVAILABLE ?auto_8648 ) ( IN ?auto_8641 ?auto_8644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8642 ?auto_8643 )
      ( MAKE-2CRATE-VERIFY ?auto_8641 ?auto_8642 ?auto_8643 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8652 - SURFACE
      ?auto_8653 - SURFACE
      ?auto_8654 - SURFACE
      ?auto_8655 - SURFACE
    )
    :vars
    (
      ?auto_8657 - HOIST
      ?auto_8661 - PLACE
      ?auto_8662 - PLACE
      ?auto_8658 - HOIST
      ?auto_8659 - SURFACE
      ?auto_8656 - SURFACE
      ?auto_8660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8657 ?auto_8661 ) ( IS-CRATE ?auto_8655 ) ( not ( = ?auto_8654 ?auto_8655 ) ) ( not ( = ?auto_8653 ?auto_8654 ) ) ( not ( = ?auto_8653 ?auto_8655 ) ) ( not ( = ?auto_8662 ?auto_8661 ) ) ( HOIST-AT ?auto_8658 ?auto_8662 ) ( not ( = ?auto_8657 ?auto_8658 ) ) ( SURFACE-AT ?auto_8655 ?auto_8662 ) ( ON ?auto_8655 ?auto_8659 ) ( CLEAR ?auto_8655 ) ( not ( = ?auto_8654 ?auto_8659 ) ) ( not ( = ?auto_8655 ?auto_8659 ) ) ( not ( = ?auto_8653 ?auto_8659 ) ) ( IS-CRATE ?auto_8654 ) ( AVAILABLE ?auto_8658 ) ( SURFACE-AT ?auto_8654 ?auto_8662 ) ( ON ?auto_8654 ?auto_8656 ) ( CLEAR ?auto_8654 ) ( not ( = ?auto_8654 ?auto_8656 ) ) ( not ( = ?auto_8655 ?auto_8656 ) ) ( not ( = ?auto_8653 ?auto_8656 ) ) ( not ( = ?auto_8659 ?auto_8656 ) ) ( TRUCK-AT ?auto_8660 ?auto_8661 ) ( SURFACE-AT ?auto_8652 ?auto_8661 ) ( CLEAR ?auto_8652 ) ( IS-CRATE ?auto_8653 ) ( not ( = ?auto_8652 ?auto_8653 ) ) ( not ( = ?auto_8654 ?auto_8652 ) ) ( not ( = ?auto_8655 ?auto_8652 ) ) ( not ( = ?auto_8659 ?auto_8652 ) ) ( not ( = ?auto_8656 ?auto_8652 ) ) ( AVAILABLE ?auto_8657 ) ( IN ?auto_8653 ?auto_8660 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8653 ?auto_8654 ?auto_8655 )
      ( MAKE-3CRATE-VERIFY ?auto_8652 ?auto_8653 ?auto_8654 ?auto_8655 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8663 - SURFACE
      ?auto_8664 - SURFACE
      ?auto_8665 - SURFACE
      ?auto_8666 - SURFACE
      ?auto_8667 - SURFACE
    )
    :vars
    (
      ?auto_8669 - HOIST
      ?auto_8673 - PLACE
      ?auto_8674 - PLACE
      ?auto_8670 - HOIST
      ?auto_8671 - SURFACE
      ?auto_8668 - SURFACE
      ?auto_8672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8669 ?auto_8673 ) ( IS-CRATE ?auto_8667 ) ( not ( = ?auto_8666 ?auto_8667 ) ) ( not ( = ?auto_8665 ?auto_8666 ) ) ( not ( = ?auto_8665 ?auto_8667 ) ) ( not ( = ?auto_8674 ?auto_8673 ) ) ( HOIST-AT ?auto_8670 ?auto_8674 ) ( not ( = ?auto_8669 ?auto_8670 ) ) ( SURFACE-AT ?auto_8667 ?auto_8674 ) ( ON ?auto_8667 ?auto_8671 ) ( CLEAR ?auto_8667 ) ( not ( = ?auto_8666 ?auto_8671 ) ) ( not ( = ?auto_8667 ?auto_8671 ) ) ( not ( = ?auto_8665 ?auto_8671 ) ) ( IS-CRATE ?auto_8666 ) ( AVAILABLE ?auto_8670 ) ( SURFACE-AT ?auto_8666 ?auto_8674 ) ( ON ?auto_8666 ?auto_8668 ) ( CLEAR ?auto_8666 ) ( not ( = ?auto_8666 ?auto_8668 ) ) ( not ( = ?auto_8667 ?auto_8668 ) ) ( not ( = ?auto_8665 ?auto_8668 ) ) ( not ( = ?auto_8671 ?auto_8668 ) ) ( TRUCK-AT ?auto_8672 ?auto_8673 ) ( SURFACE-AT ?auto_8664 ?auto_8673 ) ( CLEAR ?auto_8664 ) ( IS-CRATE ?auto_8665 ) ( not ( = ?auto_8664 ?auto_8665 ) ) ( not ( = ?auto_8666 ?auto_8664 ) ) ( not ( = ?auto_8667 ?auto_8664 ) ) ( not ( = ?auto_8671 ?auto_8664 ) ) ( not ( = ?auto_8668 ?auto_8664 ) ) ( AVAILABLE ?auto_8669 ) ( IN ?auto_8665 ?auto_8672 ) ( ON ?auto_8664 ?auto_8663 ) ( not ( = ?auto_8663 ?auto_8664 ) ) ( not ( = ?auto_8663 ?auto_8665 ) ) ( not ( = ?auto_8663 ?auto_8666 ) ) ( not ( = ?auto_8663 ?auto_8667 ) ) ( not ( = ?auto_8663 ?auto_8671 ) ) ( not ( = ?auto_8663 ?auto_8668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8665 ?auto_8666 ?auto_8667 )
      ( MAKE-4CRATE-VERIFY ?auto_8663 ?auto_8664 ?auto_8665 ?auto_8666 ?auto_8667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8675 - SURFACE
      ?auto_8676 - SURFACE
    )
    :vars
    (
      ?auto_8679 - HOIST
      ?auto_8684 - PLACE
      ?auto_8678 - SURFACE
      ?auto_8685 - PLACE
      ?auto_8680 - HOIST
      ?auto_8681 - SURFACE
      ?auto_8677 - SURFACE
      ?auto_8682 - SURFACE
      ?auto_8683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8679 ?auto_8684 ) ( IS-CRATE ?auto_8676 ) ( not ( = ?auto_8675 ?auto_8676 ) ) ( not ( = ?auto_8678 ?auto_8675 ) ) ( not ( = ?auto_8678 ?auto_8676 ) ) ( not ( = ?auto_8685 ?auto_8684 ) ) ( HOIST-AT ?auto_8680 ?auto_8685 ) ( not ( = ?auto_8679 ?auto_8680 ) ) ( SURFACE-AT ?auto_8676 ?auto_8685 ) ( ON ?auto_8676 ?auto_8681 ) ( CLEAR ?auto_8676 ) ( not ( = ?auto_8675 ?auto_8681 ) ) ( not ( = ?auto_8676 ?auto_8681 ) ) ( not ( = ?auto_8678 ?auto_8681 ) ) ( IS-CRATE ?auto_8675 ) ( AVAILABLE ?auto_8680 ) ( SURFACE-AT ?auto_8675 ?auto_8685 ) ( ON ?auto_8675 ?auto_8677 ) ( CLEAR ?auto_8675 ) ( not ( = ?auto_8675 ?auto_8677 ) ) ( not ( = ?auto_8676 ?auto_8677 ) ) ( not ( = ?auto_8678 ?auto_8677 ) ) ( not ( = ?auto_8681 ?auto_8677 ) ) ( SURFACE-AT ?auto_8682 ?auto_8684 ) ( CLEAR ?auto_8682 ) ( IS-CRATE ?auto_8678 ) ( not ( = ?auto_8682 ?auto_8678 ) ) ( not ( = ?auto_8675 ?auto_8682 ) ) ( not ( = ?auto_8676 ?auto_8682 ) ) ( not ( = ?auto_8681 ?auto_8682 ) ) ( not ( = ?auto_8677 ?auto_8682 ) ) ( AVAILABLE ?auto_8679 ) ( IN ?auto_8678 ?auto_8683 ) ( TRUCK-AT ?auto_8683 ?auto_8685 ) )
    :subtasks
    ( ( !DRIVE ?auto_8683 ?auto_8685 ?auto_8684 )
      ( MAKE-2CRATE ?auto_8678 ?auto_8675 ?auto_8676 )
      ( MAKE-1CRATE-VERIFY ?auto_8675 ?auto_8676 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8686 - SURFACE
      ?auto_8687 - SURFACE
      ?auto_8688 - SURFACE
    )
    :vars
    (
      ?auto_8694 - HOIST
      ?auto_8692 - PLACE
      ?auto_8690 - PLACE
      ?auto_8693 - HOIST
      ?auto_8695 - SURFACE
      ?auto_8689 - SURFACE
      ?auto_8696 - SURFACE
      ?auto_8691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8694 ?auto_8692 ) ( IS-CRATE ?auto_8688 ) ( not ( = ?auto_8687 ?auto_8688 ) ) ( not ( = ?auto_8686 ?auto_8687 ) ) ( not ( = ?auto_8686 ?auto_8688 ) ) ( not ( = ?auto_8690 ?auto_8692 ) ) ( HOIST-AT ?auto_8693 ?auto_8690 ) ( not ( = ?auto_8694 ?auto_8693 ) ) ( SURFACE-AT ?auto_8688 ?auto_8690 ) ( ON ?auto_8688 ?auto_8695 ) ( CLEAR ?auto_8688 ) ( not ( = ?auto_8687 ?auto_8695 ) ) ( not ( = ?auto_8688 ?auto_8695 ) ) ( not ( = ?auto_8686 ?auto_8695 ) ) ( IS-CRATE ?auto_8687 ) ( AVAILABLE ?auto_8693 ) ( SURFACE-AT ?auto_8687 ?auto_8690 ) ( ON ?auto_8687 ?auto_8689 ) ( CLEAR ?auto_8687 ) ( not ( = ?auto_8687 ?auto_8689 ) ) ( not ( = ?auto_8688 ?auto_8689 ) ) ( not ( = ?auto_8686 ?auto_8689 ) ) ( not ( = ?auto_8695 ?auto_8689 ) ) ( SURFACE-AT ?auto_8696 ?auto_8692 ) ( CLEAR ?auto_8696 ) ( IS-CRATE ?auto_8686 ) ( not ( = ?auto_8696 ?auto_8686 ) ) ( not ( = ?auto_8687 ?auto_8696 ) ) ( not ( = ?auto_8688 ?auto_8696 ) ) ( not ( = ?auto_8695 ?auto_8696 ) ) ( not ( = ?auto_8689 ?auto_8696 ) ) ( AVAILABLE ?auto_8694 ) ( IN ?auto_8686 ?auto_8691 ) ( TRUCK-AT ?auto_8691 ?auto_8690 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8687 ?auto_8688 )
      ( MAKE-2CRATE-VERIFY ?auto_8686 ?auto_8687 ?auto_8688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8697 - SURFACE
      ?auto_8698 - SURFACE
      ?auto_8699 - SURFACE
      ?auto_8700 - SURFACE
    )
    :vars
    (
      ?auto_8701 - HOIST
      ?auto_8704 - PLACE
      ?auto_8706 - PLACE
      ?auto_8702 - HOIST
      ?auto_8705 - SURFACE
      ?auto_8703 - SURFACE
      ?auto_8707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8701 ?auto_8704 ) ( IS-CRATE ?auto_8700 ) ( not ( = ?auto_8699 ?auto_8700 ) ) ( not ( = ?auto_8698 ?auto_8699 ) ) ( not ( = ?auto_8698 ?auto_8700 ) ) ( not ( = ?auto_8706 ?auto_8704 ) ) ( HOIST-AT ?auto_8702 ?auto_8706 ) ( not ( = ?auto_8701 ?auto_8702 ) ) ( SURFACE-AT ?auto_8700 ?auto_8706 ) ( ON ?auto_8700 ?auto_8705 ) ( CLEAR ?auto_8700 ) ( not ( = ?auto_8699 ?auto_8705 ) ) ( not ( = ?auto_8700 ?auto_8705 ) ) ( not ( = ?auto_8698 ?auto_8705 ) ) ( IS-CRATE ?auto_8699 ) ( AVAILABLE ?auto_8702 ) ( SURFACE-AT ?auto_8699 ?auto_8706 ) ( ON ?auto_8699 ?auto_8703 ) ( CLEAR ?auto_8699 ) ( not ( = ?auto_8699 ?auto_8703 ) ) ( not ( = ?auto_8700 ?auto_8703 ) ) ( not ( = ?auto_8698 ?auto_8703 ) ) ( not ( = ?auto_8705 ?auto_8703 ) ) ( SURFACE-AT ?auto_8697 ?auto_8704 ) ( CLEAR ?auto_8697 ) ( IS-CRATE ?auto_8698 ) ( not ( = ?auto_8697 ?auto_8698 ) ) ( not ( = ?auto_8699 ?auto_8697 ) ) ( not ( = ?auto_8700 ?auto_8697 ) ) ( not ( = ?auto_8705 ?auto_8697 ) ) ( not ( = ?auto_8703 ?auto_8697 ) ) ( AVAILABLE ?auto_8701 ) ( IN ?auto_8698 ?auto_8707 ) ( TRUCK-AT ?auto_8707 ?auto_8706 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8698 ?auto_8699 ?auto_8700 )
      ( MAKE-3CRATE-VERIFY ?auto_8697 ?auto_8698 ?auto_8699 ?auto_8700 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8708 - SURFACE
      ?auto_8709 - SURFACE
      ?auto_8710 - SURFACE
      ?auto_8711 - SURFACE
      ?auto_8712 - SURFACE
    )
    :vars
    (
      ?auto_8713 - HOIST
      ?auto_8716 - PLACE
      ?auto_8718 - PLACE
      ?auto_8714 - HOIST
      ?auto_8717 - SURFACE
      ?auto_8715 - SURFACE
      ?auto_8719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8713 ?auto_8716 ) ( IS-CRATE ?auto_8712 ) ( not ( = ?auto_8711 ?auto_8712 ) ) ( not ( = ?auto_8710 ?auto_8711 ) ) ( not ( = ?auto_8710 ?auto_8712 ) ) ( not ( = ?auto_8718 ?auto_8716 ) ) ( HOIST-AT ?auto_8714 ?auto_8718 ) ( not ( = ?auto_8713 ?auto_8714 ) ) ( SURFACE-AT ?auto_8712 ?auto_8718 ) ( ON ?auto_8712 ?auto_8717 ) ( CLEAR ?auto_8712 ) ( not ( = ?auto_8711 ?auto_8717 ) ) ( not ( = ?auto_8712 ?auto_8717 ) ) ( not ( = ?auto_8710 ?auto_8717 ) ) ( IS-CRATE ?auto_8711 ) ( AVAILABLE ?auto_8714 ) ( SURFACE-AT ?auto_8711 ?auto_8718 ) ( ON ?auto_8711 ?auto_8715 ) ( CLEAR ?auto_8711 ) ( not ( = ?auto_8711 ?auto_8715 ) ) ( not ( = ?auto_8712 ?auto_8715 ) ) ( not ( = ?auto_8710 ?auto_8715 ) ) ( not ( = ?auto_8717 ?auto_8715 ) ) ( SURFACE-AT ?auto_8709 ?auto_8716 ) ( CLEAR ?auto_8709 ) ( IS-CRATE ?auto_8710 ) ( not ( = ?auto_8709 ?auto_8710 ) ) ( not ( = ?auto_8711 ?auto_8709 ) ) ( not ( = ?auto_8712 ?auto_8709 ) ) ( not ( = ?auto_8717 ?auto_8709 ) ) ( not ( = ?auto_8715 ?auto_8709 ) ) ( AVAILABLE ?auto_8713 ) ( IN ?auto_8710 ?auto_8719 ) ( TRUCK-AT ?auto_8719 ?auto_8718 ) ( ON ?auto_8709 ?auto_8708 ) ( not ( = ?auto_8708 ?auto_8709 ) ) ( not ( = ?auto_8708 ?auto_8710 ) ) ( not ( = ?auto_8708 ?auto_8711 ) ) ( not ( = ?auto_8708 ?auto_8712 ) ) ( not ( = ?auto_8708 ?auto_8717 ) ) ( not ( = ?auto_8708 ?auto_8715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8710 ?auto_8711 ?auto_8712 )
      ( MAKE-4CRATE-VERIFY ?auto_8708 ?auto_8709 ?auto_8710 ?auto_8711 ?auto_8712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8720 - SURFACE
      ?auto_8721 - SURFACE
    )
    :vars
    (
      ?auto_8722 - HOIST
      ?auto_8725 - PLACE
      ?auto_8729 - SURFACE
      ?auto_8727 - PLACE
      ?auto_8723 - HOIST
      ?auto_8726 - SURFACE
      ?auto_8724 - SURFACE
      ?auto_8728 - SURFACE
      ?auto_8730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8722 ?auto_8725 ) ( IS-CRATE ?auto_8721 ) ( not ( = ?auto_8720 ?auto_8721 ) ) ( not ( = ?auto_8729 ?auto_8720 ) ) ( not ( = ?auto_8729 ?auto_8721 ) ) ( not ( = ?auto_8727 ?auto_8725 ) ) ( HOIST-AT ?auto_8723 ?auto_8727 ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( SURFACE-AT ?auto_8721 ?auto_8727 ) ( ON ?auto_8721 ?auto_8726 ) ( CLEAR ?auto_8721 ) ( not ( = ?auto_8720 ?auto_8726 ) ) ( not ( = ?auto_8721 ?auto_8726 ) ) ( not ( = ?auto_8729 ?auto_8726 ) ) ( IS-CRATE ?auto_8720 ) ( SURFACE-AT ?auto_8720 ?auto_8727 ) ( ON ?auto_8720 ?auto_8724 ) ( CLEAR ?auto_8720 ) ( not ( = ?auto_8720 ?auto_8724 ) ) ( not ( = ?auto_8721 ?auto_8724 ) ) ( not ( = ?auto_8729 ?auto_8724 ) ) ( not ( = ?auto_8726 ?auto_8724 ) ) ( SURFACE-AT ?auto_8728 ?auto_8725 ) ( CLEAR ?auto_8728 ) ( IS-CRATE ?auto_8729 ) ( not ( = ?auto_8728 ?auto_8729 ) ) ( not ( = ?auto_8720 ?auto_8728 ) ) ( not ( = ?auto_8721 ?auto_8728 ) ) ( not ( = ?auto_8726 ?auto_8728 ) ) ( not ( = ?auto_8724 ?auto_8728 ) ) ( AVAILABLE ?auto_8722 ) ( TRUCK-AT ?auto_8730 ?auto_8727 ) ( LIFTING ?auto_8723 ?auto_8729 ) )
    :subtasks
    ( ( !LOAD ?auto_8723 ?auto_8729 ?auto_8730 ?auto_8727 )
      ( MAKE-2CRATE ?auto_8729 ?auto_8720 ?auto_8721 )
      ( MAKE-1CRATE-VERIFY ?auto_8720 ?auto_8721 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8731 - SURFACE
      ?auto_8732 - SURFACE
      ?auto_8733 - SURFACE
    )
    :vars
    (
      ?auto_8741 - HOIST
      ?auto_8737 - PLACE
      ?auto_8735 - PLACE
      ?auto_8736 - HOIST
      ?auto_8739 - SURFACE
      ?auto_8740 - SURFACE
      ?auto_8738 - SURFACE
      ?auto_8734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8741 ?auto_8737 ) ( IS-CRATE ?auto_8733 ) ( not ( = ?auto_8732 ?auto_8733 ) ) ( not ( = ?auto_8731 ?auto_8732 ) ) ( not ( = ?auto_8731 ?auto_8733 ) ) ( not ( = ?auto_8735 ?auto_8737 ) ) ( HOIST-AT ?auto_8736 ?auto_8735 ) ( not ( = ?auto_8741 ?auto_8736 ) ) ( SURFACE-AT ?auto_8733 ?auto_8735 ) ( ON ?auto_8733 ?auto_8739 ) ( CLEAR ?auto_8733 ) ( not ( = ?auto_8732 ?auto_8739 ) ) ( not ( = ?auto_8733 ?auto_8739 ) ) ( not ( = ?auto_8731 ?auto_8739 ) ) ( IS-CRATE ?auto_8732 ) ( SURFACE-AT ?auto_8732 ?auto_8735 ) ( ON ?auto_8732 ?auto_8740 ) ( CLEAR ?auto_8732 ) ( not ( = ?auto_8732 ?auto_8740 ) ) ( not ( = ?auto_8733 ?auto_8740 ) ) ( not ( = ?auto_8731 ?auto_8740 ) ) ( not ( = ?auto_8739 ?auto_8740 ) ) ( SURFACE-AT ?auto_8738 ?auto_8737 ) ( CLEAR ?auto_8738 ) ( IS-CRATE ?auto_8731 ) ( not ( = ?auto_8738 ?auto_8731 ) ) ( not ( = ?auto_8732 ?auto_8738 ) ) ( not ( = ?auto_8733 ?auto_8738 ) ) ( not ( = ?auto_8739 ?auto_8738 ) ) ( not ( = ?auto_8740 ?auto_8738 ) ) ( AVAILABLE ?auto_8741 ) ( TRUCK-AT ?auto_8734 ?auto_8735 ) ( LIFTING ?auto_8736 ?auto_8731 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8732 ?auto_8733 )
      ( MAKE-2CRATE-VERIFY ?auto_8731 ?auto_8732 ?auto_8733 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8742 - SURFACE
      ?auto_8743 - SURFACE
      ?auto_8744 - SURFACE
      ?auto_8745 - SURFACE
    )
    :vars
    (
      ?auto_8750 - HOIST
      ?auto_8748 - PLACE
      ?auto_8749 - PLACE
      ?auto_8752 - HOIST
      ?auto_8746 - SURFACE
      ?auto_8747 - SURFACE
      ?auto_8751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8750 ?auto_8748 ) ( IS-CRATE ?auto_8745 ) ( not ( = ?auto_8744 ?auto_8745 ) ) ( not ( = ?auto_8743 ?auto_8744 ) ) ( not ( = ?auto_8743 ?auto_8745 ) ) ( not ( = ?auto_8749 ?auto_8748 ) ) ( HOIST-AT ?auto_8752 ?auto_8749 ) ( not ( = ?auto_8750 ?auto_8752 ) ) ( SURFACE-AT ?auto_8745 ?auto_8749 ) ( ON ?auto_8745 ?auto_8746 ) ( CLEAR ?auto_8745 ) ( not ( = ?auto_8744 ?auto_8746 ) ) ( not ( = ?auto_8745 ?auto_8746 ) ) ( not ( = ?auto_8743 ?auto_8746 ) ) ( IS-CRATE ?auto_8744 ) ( SURFACE-AT ?auto_8744 ?auto_8749 ) ( ON ?auto_8744 ?auto_8747 ) ( CLEAR ?auto_8744 ) ( not ( = ?auto_8744 ?auto_8747 ) ) ( not ( = ?auto_8745 ?auto_8747 ) ) ( not ( = ?auto_8743 ?auto_8747 ) ) ( not ( = ?auto_8746 ?auto_8747 ) ) ( SURFACE-AT ?auto_8742 ?auto_8748 ) ( CLEAR ?auto_8742 ) ( IS-CRATE ?auto_8743 ) ( not ( = ?auto_8742 ?auto_8743 ) ) ( not ( = ?auto_8744 ?auto_8742 ) ) ( not ( = ?auto_8745 ?auto_8742 ) ) ( not ( = ?auto_8746 ?auto_8742 ) ) ( not ( = ?auto_8747 ?auto_8742 ) ) ( AVAILABLE ?auto_8750 ) ( TRUCK-AT ?auto_8751 ?auto_8749 ) ( LIFTING ?auto_8752 ?auto_8743 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8743 ?auto_8744 ?auto_8745 )
      ( MAKE-3CRATE-VERIFY ?auto_8742 ?auto_8743 ?auto_8744 ?auto_8745 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8753 - SURFACE
      ?auto_8754 - SURFACE
      ?auto_8755 - SURFACE
      ?auto_8756 - SURFACE
      ?auto_8757 - SURFACE
    )
    :vars
    (
      ?auto_8762 - HOIST
      ?auto_8760 - PLACE
      ?auto_8761 - PLACE
      ?auto_8764 - HOIST
      ?auto_8758 - SURFACE
      ?auto_8759 - SURFACE
      ?auto_8763 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8762 ?auto_8760 ) ( IS-CRATE ?auto_8757 ) ( not ( = ?auto_8756 ?auto_8757 ) ) ( not ( = ?auto_8755 ?auto_8756 ) ) ( not ( = ?auto_8755 ?auto_8757 ) ) ( not ( = ?auto_8761 ?auto_8760 ) ) ( HOIST-AT ?auto_8764 ?auto_8761 ) ( not ( = ?auto_8762 ?auto_8764 ) ) ( SURFACE-AT ?auto_8757 ?auto_8761 ) ( ON ?auto_8757 ?auto_8758 ) ( CLEAR ?auto_8757 ) ( not ( = ?auto_8756 ?auto_8758 ) ) ( not ( = ?auto_8757 ?auto_8758 ) ) ( not ( = ?auto_8755 ?auto_8758 ) ) ( IS-CRATE ?auto_8756 ) ( SURFACE-AT ?auto_8756 ?auto_8761 ) ( ON ?auto_8756 ?auto_8759 ) ( CLEAR ?auto_8756 ) ( not ( = ?auto_8756 ?auto_8759 ) ) ( not ( = ?auto_8757 ?auto_8759 ) ) ( not ( = ?auto_8755 ?auto_8759 ) ) ( not ( = ?auto_8758 ?auto_8759 ) ) ( SURFACE-AT ?auto_8754 ?auto_8760 ) ( CLEAR ?auto_8754 ) ( IS-CRATE ?auto_8755 ) ( not ( = ?auto_8754 ?auto_8755 ) ) ( not ( = ?auto_8756 ?auto_8754 ) ) ( not ( = ?auto_8757 ?auto_8754 ) ) ( not ( = ?auto_8758 ?auto_8754 ) ) ( not ( = ?auto_8759 ?auto_8754 ) ) ( AVAILABLE ?auto_8762 ) ( TRUCK-AT ?auto_8763 ?auto_8761 ) ( LIFTING ?auto_8764 ?auto_8755 ) ( ON ?auto_8754 ?auto_8753 ) ( not ( = ?auto_8753 ?auto_8754 ) ) ( not ( = ?auto_8753 ?auto_8755 ) ) ( not ( = ?auto_8753 ?auto_8756 ) ) ( not ( = ?auto_8753 ?auto_8757 ) ) ( not ( = ?auto_8753 ?auto_8758 ) ) ( not ( = ?auto_8753 ?auto_8759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8755 ?auto_8756 ?auto_8757 )
      ( MAKE-4CRATE-VERIFY ?auto_8753 ?auto_8754 ?auto_8755 ?auto_8756 ?auto_8757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8765 - SURFACE
      ?auto_8766 - SURFACE
    )
    :vars
    (
      ?auto_8771 - HOIST
      ?auto_8769 - PLACE
      ?auto_8775 - SURFACE
      ?auto_8770 - PLACE
      ?auto_8774 - HOIST
      ?auto_8767 - SURFACE
      ?auto_8768 - SURFACE
      ?auto_8772 - SURFACE
      ?auto_8773 - TRUCK
      ?auto_8776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8771 ?auto_8769 ) ( IS-CRATE ?auto_8766 ) ( not ( = ?auto_8765 ?auto_8766 ) ) ( not ( = ?auto_8775 ?auto_8765 ) ) ( not ( = ?auto_8775 ?auto_8766 ) ) ( not ( = ?auto_8770 ?auto_8769 ) ) ( HOIST-AT ?auto_8774 ?auto_8770 ) ( not ( = ?auto_8771 ?auto_8774 ) ) ( SURFACE-AT ?auto_8766 ?auto_8770 ) ( ON ?auto_8766 ?auto_8767 ) ( CLEAR ?auto_8766 ) ( not ( = ?auto_8765 ?auto_8767 ) ) ( not ( = ?auto_8766 ?auto_8767 ) ) ( not ( = ?auto_8775 ?auto_8767 ) ) ( IS-CRATE ?auto_8765 ) ( SURFACE-AT ?auto_8765 ?auto_8770 ) ( ON ?auto_8765 ?auto_8768 ) ( CLEAR ?auto_8765 ) ( not ( = ?auto_8765 ?auto_8768 ) ) ( not ( = ?auto_8766 ?auto_8768 ) ) ( not ( = ?auto_8775 ?auto_8768 ) ) ( not ( = ?auto_8767 ?auto_8768 ) ) ( SURFACE-AT ?auto_8772 ?auto_8769 ) ( CLEAR ?auto_8772 ) ( IS-CRATE ?auto_8775 ) ( not ( = ?auto_8772 ?auto_8775 ) ) ( not ( = ?auto_8765 ?auto_8772 ) ) ( not ( = ?auto_8766 ?auto_8772 ) ) ( not ( = ?auto_8767 ?auto_8772 ) ) ( not ( = ?auto_8768 ?auto_8772 ) ) ( AVAILABLE ?auto_8771 ) ( TRUCK-AT ?auto_8773 ?auto_8770 ) ( AVAILABLE ?auto_8774 ) ( SURFACE-AT ?auto_8775 ?auto_8770 ) ( ON ?auto_8775 ?auto_8776 ) ( CLEAR ?auto_8775 ) ( not ( = ?auto_8765 ?auto_8776 ) ) ( not ( = ?auto_8766 ?auto_8776 ) ) ( not ( = ?auto_8775 ?auto_8776 ) ) ( not ( = ?auto_8767 ?auto_8776 ) ) ( not ( = ?auto_8768 ?auto_8776 ) ) ( not ( = ?auto_8772 ?auto_8776 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8774 ?auto_8775 ?auto_8776 ?auto_8770 )
      ( MAKE-2CRATE ?auto_8775 ?auto_8765 ?auto_8766 )
      ( MAKE-1CRATE-VERIFY ?auto_8765 ?auto_8766 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8777 - SURFACE
      ?auto_8778 - SURFACE
      ?auto_8779 - SURFACE
    )
    :vars
    (
      ?auto_8787 - HOIST
      ?auto_8785 - PLACE
      ?auto_8784 - PLACE
      ?auto_8788 - HOIST
      ?auto_8780 - SURFACE
      ?auto_8786 - SURFACE
      ?auto_8783 - SURFACE
      ?auto_8782 - TRUCK
      ?auto_8781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8787 ?auto_8785 ) ( IS-CRATE ?auto_8779 ) ( not ( = ?auto_8778 ?auto_8779 ) ) ( not ( = ?auto_8777 ?auto_8778 ) ) ( not ( = ?auto_8777 ?auto_8779 ) ) ( not ( = ?auto_8784 ?auto_8785 ) ) ( HOIST-AT ?auto_8788 ?auto_8784 ) ( not ( = ?auto_8787 ?auto_8788 ) ) ( SURFACE-AT ?auto_8779 ?auto_8784 ) ( ON ?auto_8779 ?auto_8780 ) ( CLEAR ?auto_8779 ) ( not ( = ?auto_8778 ?auto_8780 ) ) ( not ( = ?auto_8779 ?auto_8780 ) ) ( not ( = ?auto_8777 ?auto_8780 ) ) ( IS-CRATE ?auto_8778 ) ( SURFACE-AT ?auto_8778 ?auto_8784 ) ( ON ?auto_8778 ?auto_8786 ) ( CLEAR ?auto_8778 ) ( not ( = ?auto_8778 ?auto_8786 ) ) ( not ( = ?auto_8779 ?auto_8786 ) ) ( not ( = ?auto_8777 ?auto_8786 ) ) ( not ( = ?auto_8780 ?auto_8786 ) ) ( SURFACE-AT ?auto_8783 ?auto_8785 ) ( CLEAR ?auto_8783 ) ( IS-CRATE ?auto_8777 ) ( not ( = ?auto_8783 ?auto_8777 ) ) ( not ( = ?auto_8778 ?auto_8783 ) ) ( not ( = ?auto_8779 ?auto_8783 ) ) ( not ( = ?auto_8780 ?auto_8783 ) ) ( not ( = ?auto_8786 ?auto_8783 ) ) ( AVAILABLE ?auto_8787 ) ( TRUCK-AT ?auto_8782 ?auto_8784 ) ( AVAILABLE ?auto_8788 ) ( SURFACE-AT ?auto_8777 ?auto_8784 ) ( ON ?auto_8777 ?auto_8781 ) ( CLEAR ?auto_8777 ) ( not ( = ?auto_8778 ?auto_8781 ) ) ( not ( = ?auto_8779 ?auto_8781 ) ) ( not ( = ?auto_8777 ?auto_8781 ) ) ( not ( = ?auto_8780 ?auto_8781 ) ) ( not ( = ?auto_8786 ?auto_8781 ) ) ( not ( = ?auto_8783 ?auto_8781 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8778 ?auto_8779 )
      ( MAKE-2CRATE-VERIFY ?auto_8777 ?auto_8778 ?auto_8779 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8789 - SURFACE
      ?auto_8790 - SURFACE
      ?auto_8791 - SURFACE
      ?auto_8792 - SURFACE
    )
    :vars
    (
      ?auto_8797 - HOIST
      ?auto_8794 - PLACE
      ?auto_8798 - PLACE
      ?auto_8793 - HOIST
      ?auto_8800 - SURFACE
      ?auto_8799 - SURFACE
      ?auto_8795 - TRUCK
      ?auto_8796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8797 ?auto_8794 ) ( IS-CRATE ?auto_8792 ) ( not ( = ?auto_8791 ?auto_8792 ) ) ( not ( = ?auto_8790 ?auto_8791 ) ) ( not ( = ?auto_8790 ?auto_8792 ) ) ( not ( = ?auto_8798 ?auto_8794 ) ) ( HOIST-AT ?auto_8793 ?auto_8798 ) ( not ( = ?auto_8797 ?auto_8793 ) ) ( SURFACE-AT ?auto_8792 ?auto_8798 ) ( ON ?auto_8792 ?auto_8800 ) ( CLEAR ?auto_8792 ) ( not ( = ?auto_8791 ?auto_8800 ) ) ( not ( = ?auto_8792 ?auto_8800 ) ) ( not ( = ?auto_8790 ?auto_8800 ) ) ( IS-CRATE ?auto_8791 ) ( SURFACE-AT ?auto_8791 ?auto_8798 ) ( ON ?auto_8791 ?auto_8799 ) ( CLEAR ?auto_8791 ) ( not ( = ?auto_8791 ?auto_8799 ) ) ( not ( = ?auto_8792 ?auto_8799 ) ) ( not ( = ?auto_8790 ?auto_8799 ) ) ( not ( = ?auto_8800 ?auto_8799 ) ) ( SURFACE-AT ?auto_8789 ?auto_8794 ) ( CLEAR ?auto_8789 ) ( IS-CRATE ?auto_8790 ) ( not ( = ?auto_8789 ?auto_8790 ) ) ( not ( = ?auto_8791 ?auto_8789 ) ) ( not ( = ?auto_8792 ?auto_8789 ) ) ( not ( = ?auto_8800 ?auto_8789 ) ) ( not ( = ?auto_8799 ?auto_8789 ) ) ( AVAILABLE ?auto_8797 ) ( TRUCK-AT ?auto_8795 ?auto_8798 ) ( AVAILABLE ?auto_8793 ) ( SURFACE-AT ?auto_8790 ?auto_8798 ) ( ON ?auto_8790 ?auto_8796 ) ( CLEAR ?auto_8790 ) ( not ( = ?auto_8791 ?auto_8796 ) ) ( not ( = ?auto_8792 ?auto_8796 ) ) ( not ( = ?auto_8790 ?auto_8796 ) ) ( not ( = ?auto_8800 ?auto_8796 ) ) ( not ( = ?auto_8799 ?auto_8796 ) ) ( not ( = ?auto_8789 ?auto_8796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8790 ?auto_8791 ?auto_8792 )
      ( MAKE-3CRATE-VERIFY ?auto_8789 ?auto_8790 ?auto_8791 ?auto_8792 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8801 - SURFACE
      ?auto_8802 - SURFACE
      ?auto_8803 - SURFACE
      ?auto_8804 - SURFACE
      ?auto_8805 - SURFACE
    )
    :vars
    (
      ?auto_8810 - HOIST
      ?auto_8807 - PLACE
      ?auto_8811 - PLACE
      ?auto_8806 - HOIST
      ?auto_8813 - SURFACE
      ?auto_8812 - SURFACE
      ?auto_8808 - TRUCK
      ?auto_8809 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8810 ?auto_8807 ) ( IS-CRATE ?auto_8805 ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8805 ) ) ( not ( = ?auto_8811 ?auto_8807 ) ) ( HOIST-AT ?auto_8806 ?auto_8811 ) ( not ( = ?auto_8810 ?auto_8806 ) ) ( SURFACE-AT ?auto_8805 ?auto_8811 ) ( ON ?auto_8805 ?auto_8813 ) ( CLEAR ?auto_8805 ) ( not ( = ?auto_8804 ?auto_8813 ) ) ( not ( = ?auto_8805 ?auto_8813 ) ) ( not ( = ?auto_8803 ?auto_8813 ) ) ( IS-CRATE ?auto_8804 ) ( SURFACE-AT ?auto_8804 ?auto_8811 ) ( ON ?auto_8804 ?auto_8812 ) ( CLEAR ?auto_8804 ) ( not ( = ?auto_8804 ?auto_8812 ) ) ( not ( = ?auto_8805 ?auto_8812 ) ) ( not ( = ?auto_8803 ?auto_8812 ) ) ( not ( = ?auto_8813 ?auto_8812 ) ) ( SURFACE-AT ?auto_8802 ?auto_8807 ) ( CLEAR ?auto_8802 ) ( IS-CRATE ?auto_8803 ) ( not ( = ?auto_8802 ?auto_8803 ) ) ( not ( = ?auto_8804 ?auto_8802 ) ) ( not ( = ?auto_8805 ?auto_8802 ) ) ( not ( = ?auto_8813 ?auto_8802 ) ) ( not ( = ?auto_8812 ?auto_8802 ) ) ( AVAILABLE ?auto_8810 ) ( TRUCK-AT ?auto_8808 ?auto_8811 ) ( AVAILABLE ?auto_8806 ) ( SURFACE-AT ?auto_8803 ?auto_8811 ) ( ON ?auto_8803 ?auto_8809 ) ( CLEAR ?auto_8803 ) ( not ( = ?auto_8804 ?auto_8809 ) ) ( not ( = ?auto_8805 ?auto_8809 ) ) ( not ( = ?auto_8803 ?auto_8809 ) ) ( not ( = ?auto_8813 ?auto_8809 ) ) ( not ( = ?auto_8812 ?auto_8809 ) ) ( not ( = ?auto_8802 ?auto_8809 ) ) ( ON ?auto_8802 ?auto_8801 ) ( not ( = ?auto_8801 ?auto_8802 ) ) ( not ( = ?auto_8801 ?auto_8803 ) ) ( not ( = ?auto_8801 ?auto_8804 ) ) ( not ( = ?auto_8801 ?auto_8805 ) ) ( not ( = ?auto_8801 ?auto_8813 ) ) ( not ( = ?auto_8801 ?auto_8812 ) ) ( not ( = ?auto_8801 ?auto_8809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8803 ?auto_8804 ?auto_8805 )
      ( MAKE-4CRATE-VERIFY ?auto_8801 ?auto_8802 ?auto_8803 ?auto_8804 ?auto_8805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8814 - SURFACE
      ?auto_8815 - SURFACE
    )
    :vars
    (
      ?auto_8822 - HOIST
      ?auto_8818 - PLACE
      ?auto_8821 - SURFACE
      ?auto_8823 - PLACE
      ?auto_8817 - HOIST
      ?auto_8825 - SURFACE
      ?auto_8824 - SURFACE
      ?auto_8816 - SURFACE
      ?auto_8820 - SURFACE
      ?auto_8819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8822 ?auto_8818 ) ( IS-CRATE ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8815 ) ) ( not ( = ?auto_8821 ?auto_8814 ) ) ( not ( = ?auto_8821 ?auto_8815 ) ) ( not ( = ?auto_8823 ?auto_8818 ) ) ( HOIST-AT ?auto_8817 ?auto_8823 ) ( not ( = ?auto_8822 ?auto_8817 ) ) ( SURFACE-AT ?auto_8815 ?auto_8823 ) ( ON ?auto_8815 ?auto_8825 ) ( CLEAR ?auto_8815 ) ( not ( = ?auto_8814 ?auto_8825 ) ) ( not ( = ?auto_8815 ?auto_8825 ) ) ( not ( = ?auto_8821 ?auto_8825 ) ) ( IS-CRATE ?auto_8814 ) ( SURFACE-AT ?auto_8814 ?auto_8823 ) ( ON ?auto_8814 ?auto_8824 ) ( CLEAR ?auto_8814 ) ( not ( = ?auto_8814 ?auto_8824 ) ) ( not ( = ?auto_8815 ?auto_8824 ) ) ( not ( = ?auto_8821 ?auto_8824 ) ) ( not ( = ?auto_8825 ?auto_8824 ) ) ( SURFACE-AT ?auto_8816 ?auto_8818 ) ( CLEAR ?auto_8816 ) ( IS-CRATE ?auto_8821 ) ( not ( = ?auto_8816 ?auto_8821 ) ) ( not ( = ?auto_8814 ?auto_8816 ) ) ( not ( = ?auto_8815 ?auto_8816 ) ) ( not ( = ?auto_8825 ?auto_8816 ) ) ( not ( = ?auto_8824 ?auto_8816 ) ) ( AVAILABLE ?auto_8822 ) ( AVAILABLE ?auto_8817 ) ( SURFACE-AT ?auto_8821 ?auto_8823 ) ( ON ?auto_8821 ?auto_8820 ) ( CLEAR ?auto_8821 ) ( not ( = ?auto_8814 ?auto_8820 ) ) ( not ( = ?auto_8815 ?auto_8820 ) ) ( not ( = ?auto_8821 ?auto_8820 ) ) ( not ( = ?auto_8825 ?auto_8820 ) ) ( not ( = ?auto_8824 ?auto_8820 ) ) ( not ( = ?auto_8816 ?auto_8820 ) ) ( TRUCK-AT ?auto_8819 ?auto_8818 ) )
    :subtasks
    ( ( !DRIVE ?auto_8819 ?auto_8818 ?auto_8823 )
      ( MAKE-2CRATE ?auto_8821 ?auto_8814 ?auto_8815 )
      ( MAKE-1CRATE-VERIFY ?auto_8814 ?auto_8815 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8826 - SURFACE
      ?auto_8827 - SURFACE
      ?auto_8828 - SURFACE
    )
    :vars
    (
      ?auto_8835 - HOIST
      ?auto_8837 - PLACE
      ?auto_8832 - PLACE
      ?auto_8834 - HOIST
      ?auto_8830 - SURFACE
      ?auto_8836 - SURFACE
      ?auto_8831 - SURFACE
      ?auto_8833 - SURFACE
      ?auto_8829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8835 ?auto_8837 ) ( IS-CRATE ?auto_8828 ) ( not ( = ?auto_8827 ?auto_8828 ) ) ( not ( = ?auto_8826 ?auto_8827 ) ) ( not ( = ?auto_8826 ?auto_8828 ) ) ( not ( = ?auto_8832 ?auto_8837 ) ) ( HOIST-AT ?auto_8834 ?auto_8832 ) ( not ( = ?auto_8835 ?auto_8834 ) ) ( SURFACE-AT ?auto_8828 ?auto_8832 ) ( ON ?auto_8828 ?auto_8830 ) ( CLEAR ?auto_8828 ) ( not ( = ?auto_8827 ?auto_8830 ) ) ( not ( = ?auto_8828 ?auto_8830 ) ) ( not ( = ?auto_8826 ?auto_8830 ) ) ( IS-CRATE ?auto_8827 ) ( SURFACE-AT ?auto_8827 ?auto_8832 ) ( ON ?auto_8827 ?auto_8836 ) ( CLEAR ?auto_8827 ) ( not ( = ?auto_8827 ?auto_8836 ) ) ( not ( = ?auto_8828 ?auto_8836 ) ) ( not ( = ?auto_8826 ?auto_8836 ) ) ( not ( = ?auto_8830 ?auto_8836 ) ) ( SURFACE-AT ?auto_8831 ?auto_8837 ) ( CLEAR ?auto_8831 ) ( IS-CRATE ?auto_8826 ) ( not ( = ?auto_8831 ?auto_8826 ) ) ( not ( = ?auto_8827 ?auto_8831 ) ) ( not ( = ?auto_8828 ?auto_8831 ) ) ( not ( = ?auto_8830 ?auto_8831 ) ) ( not ( = ?auto_8836 ?auto_8831 ) ) ( AVAILABLE ?auto_8835 ) ( AVAILABLE ?auto_8834 ) ( SURFACE-AT ?auto_8826 ?auto_8832 ) ( ON ?auto_8826 ?auto_8833 ) ( CLEAR ?auto_8826 ) ( not ( = ?auto_8827 ?auto_8833 ) ) ( not ( = ?auto_8828 ?auto_8833 ) ) ( not ( = ?auto_8826 ?auto_8833 ) ) ( not ( = ?auto_8830 ?auto_8833 ) ) ( not ( = ?auto_8836 ?auto_8833 ) ) ( not ( = ?auto_8831 ?auto_8833 ) ) ( TRUCK-AT ?auto_8829 ?auto_8837 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8827 ?auto_8828 )
      ( MAKE-2CRATE-VERIFY ?auto_8826 ?auto_8827 ?auto_8828 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8838 - SURFACE
      ?auto_8839 - SURFACE
      ?auto_8840 - SURFACE
      ?auto_8841 - SURFACE
    )
    :vars
    (
      ?auto_8845 - HOIST
      ?auto_8849 - PLACE
      ?auto_8848 - PLACE
      ?auto_8843 - HOIST
      ?auto_8846 - SURFACE
      ?auto_8844 - SURFACE
      ?auto_8847 - SURFACE
      ?auto_8842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8845 ?auto_8849 ) ( IS-CRATE ?auto_8841 ) ( not ( = ?auto_8840 ?auto_8841 ) ) ( not ( = ?auto_8839 ?auto_8840 ) ) ( not ( = ?auto_8839 ?auto_8841 ) ) ( not ( = ?auto_8848 ?auto_8849 ) ) ( HOIST-AT ?auto_8843 ?auto_8848 ) ( not ( = ?auto_8845 ?auto_8843 ) ) ( SURFACE-AT ?auto_8841 ?auto_8848 ) ( ON ?auto_8841 ?auto_8846 ) ( CLEAR ?auto_8841 ) ( not ( = ?auto_8840 ?auto_8846 ) ) ( not ( = ?auto_8841 ?auto_8846 ) ) ( not ( = ?auto_8839 ?auto_8846 ) ) ( IS-CRATE ?auto_8840 ) ( SURFACE-AT ?auto_8840 ?auto_8848 ) ( ON ?auto_8840 ?auto_8844 ) ( CLEAR ?auto_8840 ) ( not ( = ?auto_8840 ?auto_8844 ) ) ( not ( = ?auto_8841 ?auto_8844 ) ) ( not ( = ?auto_8839 ?auto_8844 ) ) ( not ( = ?auto_8846 ?auto_8844 ) ) ( SURFACE-AT ?auto_8838 ?auto_8849 ) ( CLEAR ?auto_8838 ) ( IS-CRATE ?auto_8839 ) ( not ( = ?auto_8838 ?auto_8839 ) ) ( not ( = ?auto_8840 ?auto_8838 ) ) ( not ( = ?auto_8841 ?auto_8838 ) ) ( not ( = ?auto_8846 ?auto_8838 ) ) ( not ( = ?auto_8844 ?auto_8838 ) ) ( AVAILABLE ?auto_8845 ) ( AVAILABLE ?auto_8843 ) ( SURFACE-AT ?auto_8839 ?auto_8848 ) ( ON ?auto_8839 ?auto_8847 ) ( CLEAR ?auto_8839 ) ( not ( = ?auto_8840 ?auto_8847 ) ) ( not ( = ?auto_8841 ?auto_8847 ) ) ( not ( = ?auto_8839 ?auto_8847 ) ) ( not ( = ?auto_8846 ?auto_8847 ) ) ( not ( = ?auto_8844 ?auto_8847 ) ) ( not ( = ?auto_8838 ?auto_8847 ) ) ( TRUCK-AT ?auto_8842 ?auto_8849 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8839 ?auto_8840 ?auto_8841 )
      ( MAKE-3CRATE-VERIFY ?auto_8838 ?auto_8839 ?auto_8840 ?auto_8841 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8850 - SURFACE
      ?auto_8851 - SURFACE
      ?auto_8852 - SURFACE
      ?auto_8853 - SURFACE
      ?auto_8854 - SURFACE
    )
    :vars
    (
      ?auto_8858 - HOIST
      ?auto_8862 - PLACE
      ?auto_8861 - PLACE
      ?auto_8856 - HOIST
      ?auto_8859 - SURFACE
      ?auto_8857 - SURFACE
      ?auto_8860 - SURFACE
      ?auto_8855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8858 ?auto_8862 ) ( IS-CRATE ?auto_8854 ) ( not ( = ?auto_8853 ?auto_8854 ) ) ( not ( = ?auto_8852 ?auto_8853 ) ) ( not ( = ?auto_8852 ?auto_8854 ) ) ( not ( = ?auto_8861 ?auto_8862 ) ) ( HOIST-AT ?auto_8856 ?auto_8861 ) ( not ( = ?auto_8858 ?auto_8856 ) ) ( SURFACE-AT ?auto_8854 ?auto_8861 ) ( ON ?auto_8854 ?auto_8859 ) ( CLEAR ?auto_8854 ) ( not ( = ?auto_8853 ?auto_8859 ) ) ( not ( = ?auto_8854 ?auto_8859 ) ) ( not ( = ?auto_8852 ?auto_8859 ) ) ( IS-CRATE ?auto_8853 ) ( SURFACE-AT ?auto_8853 ?auto_8861 ) ( ON ?auto_8853 ?auto_8857 ) ( CLEAR ?auto_8853 ) ( not ( = ?auto_8853 ?auto_8857 ) ) ( not ( = ?auto_8854 ?auto_8857 ) ) ( not ( = ?auto_8852 ?auto_8857 ) ) ( not ( = ?auto_8859 ?auto_8857 ) ) ( SURFACE-AT ?auto_8851 ?auto_8862 ) ( CLEAR ?auto_8851 ) ( IS-CRATE ?auto_8852 ) ( not ( = ?auto_8851 ?auto_8852 ) ) ( not ( = ?auto_8853 ?auto_8851 ) ) ( not ( = ?auto_8854 ?auto_8851 ) ) ( not ( = ?auto_8859 ?auto_8851 ) ) ( not ( = ?auto_8857 ?auto_8851 ) ) ( AVAILABLE ?auto_8858 ) ( AVAILABLE ?auto_8856 ) ( SURFACE-AT ?auto_8852 ?auto_8861 ) ( ON ?auto_8852 ?auto_8860 ) ( CLEAR ?auto_8852 ) ( not ( = ?auto_8853 ?auto_8860 ) ) ( not ( = ?auto_8854 ?auto_8860 ) ) ( not ( = ?auto_8852 ?auto_8860 ) ) ( not ( = ?auto_8859 ?auto_8860 ) ) ( not ( = ?auto_8857 ?auto_8860 ) ) ( not ( = ?auto_8851 ?auto_8860 ) ) ( TRUCK-AT ?auto_8855 ?auto_8862 ) ( ON ?auto_8851 ?auto_8850 ) ( not ( = ?auto_8850 ?auto_8851 ) ) ( not ( = ?auto_8850 ?auto_8852 ) ) ( not ( = ?auto_8850 ?auto_8853 ) ) ( not ( = ?auto_8850 ?auto_8854 ) ) ( not ( = ?auto_8850 ?auto_8859 ) ) ( not ( = ?auto_8850 ?auto_8857 ) ) ( not ( = ?auto_8850 ?auto_8860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8852 ?auto_8853 ?auto_8854 )
      ( MAKE-4CRATE-VERIFY ?auto_8850 ?auto_8851 ?auto_8852 ?auto_8853 ?auto_8854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8863 - SURFACE
      ?auto_8864 - SURFACE
    )
    :vars
    (
      ?auto_8870 - HOIST
      ?auto_8874 - PLACE
      ?auto_8868 - SURFACE
      ?auto_8873 - PLACE
      ?auto_8866 - HOIST
      ?auto_8871 - SURFACE
      ?auto_8867 - SURFACE
      ?auto_8869 - SURFACE
      ?auto_8872 - SURFACE
      ?auto_8865 - TRUCK
      ?auto_8875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8870 ?auto_8874 ) ( IS-CRATE ?auto_8864 ) ( not ( = ?auto_8863 ?auto_8864 ) ) ( not ( = ?auto_8868 ?auto_8863 ) ) ( not ( = ?auto_8868 ?auto_8864 ) ) ( not ( = ?auto_8873 ?auto_8874 ) ) ( HOIST-AT ?auto_8866 ?auto_8873 ) ( not ( = ?auto_8870 ?auto_8866 ) ) ( SURFACE-AT ?auto_8864 ?auto_8873 ) ( ON ?auto_8864 ?auto_8871 ) ( CLEAR ?auto_8864 ) ( not ( = ?auto_8863 ?auto_8871 ) ) ( not ( = ?auto_8864 ?auto_8871 ) ) ( not ( = ?auto_8868 ?auto_8871 ) ) ( IS-CRATE ?auto_8863 ) ( SURFACE-AT ?auto_8863 ?auto_8873 ) ( ON ?auto_8863 ?auto_8867 ) ( CLEAR ?auto_8863 ) ( not ( = ?auto_8863 ?auto_8867 ) ) ( not ( = ?auto_8864 ?auto_8867 ) ) ( not ( = ?auto_8868 ?auto_8867 ) ) ( not ( = ?auto_8871 ?auto_8867 ) ) ( IS-CRATE ?auto_8868 ) ( not ( = ?auto_8869 ?auto_8868 ) ) ( not ( = ?auto_8863 ?auto_8869 ) ) ( not ( = ?auto_8864 ?auto_8869 ) ) ( not ( = ?auto_8871 ?auto_8869 ) ) ( not ( = ?auto_8867 ?auto_8869 ) ) ( AVAILABLE ?auto_8866 ) ( SURFACE-AT ?auto_8868 ?auto_8873 ) ( ON ?auto_8868 ?auto_8872 ) ( CLEAR ?auto_8868 ) ( not ( = ?auto_8863 ?auto_8872 ) ) ( not ( = ?auto_8864 ?auto_8872 ) ) ( not ( = ?auto_8868 ?auto_8872 ) ) ( not ( = ?auto_8871 ?auto_8872 ) ) ( not ( = ?auto_8867 ?auto_8872 ) ) ( not ( = ?auto_8869 ?auto_8872 ) ) ( TRUCK-AT ?auto_8865 ?auto_8874 ) ( SURFACE-AT ?auto_8875 ?auto_8874 ) ( CLEAR ?auto_8875 ) ( LIFTING ?auto_8870 ?auto_8869 ) ( IS-CRATE ?auto_8869 ) ( not ( = ?auto_8875 ?auto_8869 ) ) ( not ( = ?auto_8863 ?auto_8875 ) ) ( not ( = ?auto_8864 ?auto_8875 ) ) ( not ( = ?auto_8868 ?auto_8875 ) ) ( not ( = ?auto_8871 ?auto_8875 ) ) ( not ( = ?auto_8867 ?auto_8875 ) ) ( not ( = ?auto_8872 ?auto_8875 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8875 ?auto_8869 )
      ( MAKE-2CRATE ?auto_8868 ?auto_8863 ?auto_8864 )
      ( MAKE-1CRATE-VERIFY ?auto_8863 ?auto_8864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8876 - SURFACE
      ?auto_8877 - SURFACE
      ?auto_8878 - SURFACE
    )
    :vars
    (
      ?auto_8881 - HOIST
      ?auto_8880 - PLACE
      ?auto_8887 - PLACE
      ?auto_8885 - HOIST
      ?auto_8882 - SURFACE
      ?auto_8888 - SURFACE
      ?auto_8879 - SURFACE
      ?auto_8883 - SURFACE
      ?auto_8886 - TRUCK
      ?auto_8884 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8881 ?auto_8880 ) ( IS-CRATE ?auto_8878 ) ( not ( = ?auto_8877 ?auto_8878 ) ) ( not ( = ?auto_8876 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8878 ) ) ( not ( = ?auto_8887 ?auto_8880 ) ) ( HOIST-AT ?auto_8885 ?auto_8887 ) ( not ( = ?auto_8881 ?auto_8885 ) ) ( SURFACE-AT ?auto_8878 ?auto_8887 ) ( ON ?auto_8878 ?auto_8882 ) ( CLEAR ?auto_8878 ) ( not ( = ?auto_8877 ?auto_8882 ) ) ( not ( = ?auto_8878 ?auto_8882 ) ) ( not ( = ?auto_8876 ?auto_8882 ) ) ( IS-CRATE ?auto_8877 ) ( SURFACE-AT ?auto_8877 ?auto_8887 ) ( ON ?auto_8877 ?auto_8888 ) ( CLEAR ?auto_8877 ) ( not ( = ?auto_8877 ?auto_8888 ) ) ( not ( = ?auto_8878 ?auto_8888 ) ) ( not ( = ?auto_8876 ?auto_8888 ) ) ( not ( = ?auto_8882 ?auto_8888 ) ) ( IS-CRATE ?auto_8876 ) ( not ( = ?auto_8879 ?auto_8876 ) ) ( not ( = ?auto_8877 ?auto_8879 ) ) ( not ( = ?auto_8878 ?auto_8879 ) ) ( not ( = ?auto_8882 ?auto_8879 ) ) ( not ( = ?auto_8888 ?auto_8879 ) ) ( AVAILABLE ?auto_8885 ) ( SURFACE-AT ?auto_8876 ?auto_8887 ) ( ON ?auto_8876 ?auto_8883 ) ( CLEAR ?auto_8876 ) ( not ( = ?auto_8877 ?auto_8883 ) ) ( not ( = ?auto_8878 ?auto_8883 ) ) ( not ( = ?auto_8876 ?auto_8883 ) ) ( not ( = ?auto_8882 ?auto_8883 ) ) ( not ( = ?auto_8888 ?auto_8883 ) ) ( not ( = ?auto_8879 ?auto_8883 ) ) ( TRUCK-AT ?auto_8886 ?auto_8880 ) ( SURFACE-AT ?auto_8884 ?auto_8880 ) ( CLEAR ?auto_8884 ) ( LIFTING ?auto_8881 ?auto_8879 ) ( IS-CRATE ?auto_8879 ) ( not ( = ?auto_8884 ?auto_8879 ) ) ( not ( = ?auto_8877 ?auto_8884 ) ) ( not ( = ?auto_8878 ?auto_8884 ) ) ( not ( = ?auto_8876 ?auto_8884 ) ) ( not ( = ?auto_8882 ?auto_8884 ) ) ( not ( = ?auto_8888 ?auto_8884 ) ) ( not ( = ?auto_8883 ?auto_8884 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8877 ?auto_8878 )
      ( MAKE-2CRATE-VERIFY ?auto_8876 ?auto_8877 ?auto_8878 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8889 - SURFACE
      ?auto_8890 - SURFACE
      ?auto_8891 - SURFACE
      ?auto_8892 - SURFACE
    )
    :vars
    (
      ?auto_8895 - HOIST
      ?auto_8897 - PLACE
      ?auto_8899 - PLACE
      ?auto_8896 - HOIST
      ?auto_8901 - SURFACE
      ?auto_8894 - SURFACE
      ?auto_8893 - SURFACE
      ?auto_8898 - TRUCK
      ?auto_8900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8895 ?auto_8897 ) ( IS-CRATE ?auto_8892 ) ( not ( = ?auto_8891 ?auto_8892 ) ) ( not ( = ?auto_8890 ?auto_8891 ) ) ( not ( = ?auto_8890 ?auto_8892 ) ) ( not ( = ?auto_8899 ?auto_8897 ) ) ( HOIST-AT ?auto_8896 ?auto_8899 ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( SURFACE-AT ?auto_8892 ?auto_8899 ) ( ON ?auto_8892 ?auto_8901 ) ( CLEAR ?auto_8892 ) ( not ( = ?auto_8891 ?auto_8901 ) ) ( not ( = ?auto_8892 ?auto_8901 ) ) ( not ( = ?auto_8890 ?auto_8901 ) ) ( IS-CRATE ?auto_8891 ) ( SURFACE-AT ?auto_8891 ?auto_8899 ) ( ON ?auto_8891 ?auto_8894 ) ( CLEAR ?auto_8891 ) ( not ( = ?auto_8891 ?auto_8894 ) ) ( not ( = ?auto_8892 ?auto_8894 ) ) ( not ( = ?auto_8890 ?auto_8894 ) ) ( not ( = ?auto_8901 ?auto_8894 ) ) ( IS-CRATE ?auto_8890 ) ( not ( = ?auto_8889 ?auto_8890 ) ) ( not ( = ?auto_8891 ?auto_8889 ) ) ( not ( = ?auto_8892 ?auto_8889 ) ) ( not ( = ?auto_8901 ?auto_8889 ) ) ( not ( = ?auto_8894 ?auto_8889 ) ) ( AVAILABLE ?auto_8896 ) ( SURFACE-AT ?auto_8890 ?auto_8899 ) ( ON ?auto_8890 ?auto_8893 ) ( CLEAR ?auto_8890 ) ( not ( = ?auto_8891 ?auto_8893 ) ) ( not ( = ?auto_8892 ?auto_8893 ) ) ( not ( = ?auto_8890 ?auto_8893 ) ) ( not ( = ?auto_8901 ?auto_8893 ) ) ( not ( = ?auto_8894 ?auto_8893 ) ) ( not ( = ?auto_8889 ?auto_8893 ) ) ( TRUCK-AT ?auto_8898 ?auto_8897 ) ( SURFACE-AT ?auto_8900 ?auto_8897 ) ( CLEAR ?auto_8900 ) ( LIFTING ?auto_8895 ?auto_8889 ) ( IS-CRATE ?auto_8889 ) ( not ( = ?auto_8900 ?auto_8889 ) ) ( not ( = ?auto_8891 ?auto_8900 ) ) ( not ( = ?auto_8892 ?auto_8900 ) ) ( not ( = ?auto_8890 ?auto_8900 ) ) ( not ( = ?auto_8901 ?auto_8900 ) ) ( not ( = ?auto_8894 ?auto_8900 ) ) ( not ( = ?auto_8893 ?auto_8900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8890 ?auto_8891 ?auto_8892 )
      ( MAKE-3CRATE-VERIFY ?auto_8889 ?auto_8890 ?auto_8891 ?auto_8892 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8902 - SURFACE
      ?auto_8903 - SURFACE
      ?auto_8904 - SURFACE
      ?auto_8905 - SURFACE
      ?auto_8906 - SURFACE
    )
    :vars
    (
      ?auto_8909 - HOIST
      ?auto_8911 - PLACE
      ?auto_8913 - PLACE
      ?auto_8910 - HOIST
      ?auto_8914 - SURFACE
      ?auto_8908 - SURFACE
      ?auto_8907 - SURFACE
      ?auto_8912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8909 ?auto_8911 ) ( IS-CRATE ?auto_8906 ) ( not ( = ?auto_8905 ?auto_8906 ) ) ( not ( = ?auto_8904 ?auto_8905 ) ) ( not ( = ?auto_8904 ?auto_8906 ) ) ( not ( = ?auto_8913 ?auto_8911 ) ) ( HOIST-AT ?auto_8910 ?auto_8913 ) ( not ( = ?auto_8909 ?auto_8910 ) ) ( SURFACE-AT ?auto_8906 ?auto_8913 ) ( ON ?auto_8906 ?auto_8914 ) ( CLEAR ?auto_8906 ) ( not ( = ?auto_8905 ?auto_8914 ) ) ( not ( = ?auto_8906 ?auto_8914 ) ) ( not ( = ?auto_8904 ?auto_8914 ) ) ( IS-CRATE ?auto_8905 ) ( SURFACE-AT ?auto_8905 ?auto_8913 ) ( ON ?auto_8905 ?auto_8908 ) ( CLEAR ?auto_8905 ) ( not ( = ?auto_8905 ?auto_8908 ) ) ( not ( = ?auto_8906 ?auto_8908 ) ) ( not ( = ?auto_8904 ?auto_8908 ) ) ( not ( = ?auto_8914 ?auto_8908 ) ) ( IS-CRATE ?auto_8904 ) ( not ( = ?auto_8903 ?auto_8904 ) ) ( not ( = ?auto_8905 ?auto_8903 ) ) ( not ( = ?auto_8906 ?auto_8903 ) ) ( not ( = ?auto_8914 ?auto_8903 ) ) ( not ( = ?auto_8908 ?auto_8903 ) ) ( AVAILABLE ?auto_8910 ) ( SURFACE-AT ?auto_8904 ?auto_8913 ) ( ON ?auto_8904 ?auto_8907 ) ( CLEAR ?auto_8904 ) ( not ( = ?auto_8905 ?auto_8907 ) ) ( not ( = ?auto_8906 ?auto_8907 ) ) ( not ( = ?auto_8904 ?auto_8907 ) ) ( not ( = ?auto_8914 ?auto_8907 ) ) ( not ( = ?auto_8908 ?auto_8907 ) ) ( not ( = ?auto_8903 ?auto_8907 ) ) ( TRUCK-AT ?auto_8912 ?auto_8911 ) ( SURFACE-AT ?auto_8902 ?auto_8911 ) ( CLEAR ?auto_8902 ) ( LIFTING ?auto_8909 ?auto_8903 ) ( IS-CRATE ?auto_8903 ) ( not ( = ?auto_8902 ?auto_8903 ) ) ( not ( = ?auto_8905 ?auto_8902 ) ) ( not ( = ?auto_8906 ?auto_8902 ) ) ( not ( = ?auto_8904 ?auto_8902 ) ) ( not ( = ?auto_8914 ?auto_8902 ) ) ( not ( = ?auto_8908 ?auto_8902 ) ) ( not ( = ?auto_8907 ?auto_8902 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8904 ?auto_8905 ?auto_8906 )
      ( MAKE-4CRATE-VERIFY ?auto_8902 ?auto_8903 ?auto_8904 ?auto_8905 ?auto_8906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8915 - SURFACE
      ?auto_8916 - SURFACE
    )
    :vars
    (
      ?auto_8919 - HOIST
      ?auto_8921 - PLACE
      ?auto_8927 - SURFACE
      ?auto_8924 - PLACE
      ?auto_8920 - HOIST
      ?auto_8926 - SURFACE
      ?auto_8918 - SURFACE
      ?auto_8922 - SURFACE
      ?auto_8917 - SURFACE
      ?auto_8923 - TRUCK
      ?auto_8925 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8919 ?auto_8921 ) ( IS-CRATE ?auto_8916 ) ( not ( = ?auto_8915 ?auto_8916 ) ) ( not ( = ?auto_8927 ?auto_8915 ) ) ( not ( = ?auto_8927 ?auto_8916 ) ) ( not ( = ?auto_8924 ?auto_8921 ) ) ( HOIST-AT ?auto_8920 ?auto_8924 ) ( not ( = ?auto_8919 ?auto_8920 ) ) ( SURFACE-AT ?auto_8916 ?auto_8924 ) ( ON ?auto_8916 ?auto_8926 ) ( CLEAR ?auto_8916 ) ( not ( = ?auto_8915 ?auto_8926 ) ) ( not ( = ?auto_8916 ?auto_8926 ) ) ( not ( = ?auto_8927 ?auto_8926 ) ) ( IS-CRATE ?auto_8915 ) ( SURFACE-AT ?auto_8915 ?auto_8924 ) ( ON ?auto_8915 ?auto_8918 ) ( CLEAR ?auto_8915 ) ( not ( = ?auto_8915 ?auto_8918 ) ) ( not ( = ?auto_8916 ?auto_8918 ) ) ( not ( = ?auto_8927 ?auto_8918 ) ) ( not ( = ?auto_8926 ?auto_8918 ) ) ( IS-CRATE ?auto_8927 ) ( not ( = ?auto_8922 ?auto_8927 ) ) ( not ( = ?auto_8915 ?auto_8922 ) ) ( not ( = ?auto_8916 ?auto_8922 ) ) ( not ( = ?auto_8926 ?auto_8922 ) ) ( not ( = ?auto_8918 ?auto_8922 ) ) ( AVAILABLE ?auto_8920 ) ( SURFACE-AT ?auto_8927 ?auto_8924 ) ( ON ?auto_8927 ?auto_8917 ) ( CLEAR ?auto_8927 ) ( not ( = ?auto_8915 ?auto_8917 ) ) ( not ( = ?auto_8916 ?auto_8917 ) ) ( not ( = ?auto_8927 ?auto_8917 ) ) ( not ( = ?auto_8926 ?auto_8917 ) ) ( not ( = ?auto_8918 ?auto_8917 ) ) ( not ( = ?auto_8922 ?auto_8917 ) ) ( TRUCK-AT ?auto_8923 ?auto_8921 ) ( SURFACE-AT ?auto_8925 ?auto_8921 ) ( CLEAR ?auto_8925 ) ( IS-CRATE ?auto_8922 ) ( not ( = ?auto_8925 ?auto_8922 ) ) ( not ( = ?auto_8915 ?auto_8925 ) ) ( not ( = ?auto_8916 ?auto_8925 ) ) ( not ( = ?auto_8927 ?auto_8925 ) ) ( not ( = ?auto_8926 ?auto_8925 ) ) ( not ( = ?auto_8918 ?auto_8925 ) ) ( not ( = ?auto_8917 ?auto_8925 ) ) ( AVAILABLE ?auto_8919 ) ( IN ?auto_8922 ?auto_8923 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8919 ?auto_8922 ?auto_8923 ?auto_8921 )
      ( MAKE-2CRATE ?auto_8927 ?auto_8915 ?auto_8916 )
      ( MAKE-1CRATE-VERIFY ?auto_8915 ?auto_8916 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8928 - SURFACE
      ?auto_8929 - SURFACE
      ?auto_8930 - SURFACE
    )
    :vars
    (
      ?auto_8931 - HOIST
      ?auto_8936 - PLACE
      ?auto_8940 - PLACE
      ?auto_8934 - HOIST
      ?auto_8938 - SURFACE
      ?auto_8937 - SURFACE
      ?auto_8932 - SURFACE
      ?auto_8939 - SURFACE
      ?auto_8933 - TRUCK
      ?auto_8935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8931 ?auto_8936 ) ( IS-CRATE ?auto_8930 ) ( not ( = ?auto_8929 ?auto_8930 ) ) ( not ( = ?auto_8928 ?auto_8929 ) ) ( not ( = ?auto_8928 ?auto_8930 ) ) ( not ( = ?auto_8940 ?auto_8936 ) ) ( HOIST-AT ?auto_8934 ?auto_8940 ) ( not ( = ?auto_8931 ?auto_8934 ) ) ( SURFACE-AT ?auto_8930 ?auto_8940 ) ( ON ?auto_8930 ?auto_8938 ) ( CLEAR ?auto_8930 ) ( not ( = ?auto_8929 ?auto_8938 ) ) ( not ( = ?auto_8930 ?auto_8938 ) ) ( not ( = ?auto_8928 ?auto_8938 ) ) ( IS-CRATE ?auto_8929 ) ( SURFACE-AT ?auto_8929 ?auto_8940 ) ( ON ?auto_8929 ?auto_8937 ) ( CLEAR ?auto_8929 ) ( not ( = ?auto_8929 ?auto_8937 ) ) ( not ( = ?auto_8930 ?auto_8937 ) ) ( not ( = ?auto_8928 ?auto_8937 ) ) ( not ( = ?auto_8938 ?auto_8937 ) ) ( IS-CRATE ?auto_8928 ) ( not ( = ?auto_8932 ?auto_8928 ) ) ( not ( = ?auto_8929 ?auto_8932 ) ) ( not ( = ?auto_8930 ?auto_8932 ) ) ( not ( = ?auto_8938 ?auto_8932 ) ) ( not ( = ?auto_8937 ?auto_8932 ) ) ( AVAILABLE ?auto_8934 ) ( SURFACE-AT ?auto_8928 ?auto_8940 ) ( ON ?auto_8928 ?auto_8939 ) ( CLEAR ?auto_8928 ) ( not ( = ?auto_8929 ?auto_8939 ) ) ( not ( = ?auto_8930 ?auto_8939 ) ) ( not ( = ?auto_8928 ?auto_8939 ) ) ( not ( = ?auto_8938 ?auto_8939 ) ) ( not ( = ?auto_8937 ?auto_8939 ) ) ( not ( = ?auto_8932 ?auto_8939 ) ) ( TRUCK-AT ?auto_8933 ?auto_8936 ) ( SURFACE-AT ?auto_8935 ?auto_8936 ) ( CLEAR ?auto_8935 ) ( IS-CRATE ?auto_8932 ) ( not ( = ?auto_8935 ?auto_8932 ) ) ( not ( = ?auto_8929 ?auto_8935 ) ) ( not ( = ?auto_8930 ?auto_8935 ) ) ( not ( = ?auto_8928 ?auto_8935 ) ) ( not ( = ?auto_8938 ?auto_8935 ) ) ( not ( = ?auto_8937 ?auto_8935 ) ) ( not ( = ?auto_8939 ?auto_8935 ) ) ( AVAILABLE ?auto_8931 ) ( IN ?auto_8932 ?auto_8933 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8929 ?auto_8930 )
      ( MAKE-2CRATE-VERIFY ?auto_8928 ?auto_8929 ?auto_8930 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8941 - SURFACE
      ?auto_8942 - SURFACE
      ?auto_8943 - SURFACE
      ?auto_8944 - SURFACE
    )
    :vars
    (
      ?auto_8948 - HOIST
      ?auto_8953 - PLACE
      ?auto_8952 - PLACE
      ?auto_8946 - HOIST
      ?auto_8947 - SURFACE
      ?auto_8949 - SURFACE
      ?auto_8951 - SURFACE
      ?auto_8945 - TRUCK
      ?auto_8950 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8948 ?auto_8953 ) ( IS-CRATE ?auto_8944 ) ( not ( = ?auto_8943 ?auto_8944 ) ) ( not ( = ?auto_8942 ?auto_8943 ) ) ( not ( = ?auto_8942 ?auto_8944 ) ) ( not ( = ?auto_8952 ?auto_8953 ) ) ( HOIST-AT ?auto_8946 ?auto_8952 ) ( not ( = ?auto_8948 ?auto_8946 ) ) ( SURFACE-AT ?auto_8944 ?auto_8952 ) ( ON ?auto_8944 ?auto_8947 ) ( CLEAR ?auto_8944 ) ( not ( = ?auto_8943 ?auto_8947 ) ) ( not ( = ?auto_8944 ?auto_8947 ) ) ( not ( = ?auto_8942 ?auto_8947 ) ) ( IS-CRATE ?auto_8943 ) ( SURFACE-AT ?auto_8943 ?auto_8952 ) ( ON ?auto_8943 ?auto_8949 ) ( CLEAR ?auto_8943 ) ( not ( = ?auto_8943 ?auto_8949 ) ) ( not ( = ?auto_8944 ?auto_8949 ) ) ( not ( = ?auto_8942 ?auto_8949 ) ) ( not ( = ?auto_8947 ?auto_8949 ) ) ( IS-CRATE ?auto_8942 ) ( not ( = ?auto_8941 ?auto_8942 ) ) ( not ( = ?auto_8943 ?auto_8941 ) ) ( not ( = ?auto_8944 ?auto_8941 ) ) ( not ( = ?auto_8947 ?auto_8941 ) ) ( not ( = ?auto_8949 ?auto_8941 ) ) ( AVAILABLE ?auto_8946 ) ( SURFACE-AT ?auto_8942 ?auto_8952 ) ( ON ?auto_8942 ?auto_8951 ) ( CLEAR ?auto_8942 ) ( not ( = ?auto_8943 ?auto_8951 ) ) ( not ( = ?auto_8944 ?auto_8951 ) ) ( not ( = ?auto_8942 ?auto_8951 ) ) ( not ( = ?auto_8947 ?auto_8951 ) ) ( not ( = ?auto_8949 ?auto_8951 ) ) ( not ( = ?auto_8941 ?auto_8951 ) ) ( TRUCK-AT ?auto_8945 ?auto_8953 ) ( SURFACE-AT ?auto_8950 ?auto_8953 ) ( CLEAR ?auto_8950 ) ( IS-CRATE ?auto_8941 ) ( not ( = ?auto_8950 ?auto_8941 ) ) ( not ( = ?auto_8943 ?auto_8950 ) ) ( not ( = ?auto_8944 ?auto_8950 ) ) ( not ( = ?auto_8942 ?auto_8950 ) ) ( not ( = ?auto_8947 ?auto_8950 ) ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( not ( = ?auto_8951 ?auto_8950 ) ) ( AVAILABLE ?auto_8948 ) ( IN ?auto_8941 ?auto_8945 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8942 ?auto_8943 ?auto_8944 )
      ( MAKE-3CRATE-VERIFY ?auto_8941 ?auto_8942 ?auto_8943 ?auto_8944 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8954 - SURFACE
      ?auto_8955 - SURFACE
      ?auto_8956 - SURFACE
      ?auto_8957 - SURFACE
      ?auto_8958 - SURFACE
    )
    :vars
    (
      ?auto_8962 - HOIST
      ?auto_8966 - PLACE
      ?auto_8965 - PLACE
      ?auto_8960 - HOIST
      ?auto_8961 - SURFACE
      ?auto_8963 - SURFACE
      ?auto_8964 - SURFACE
      ?auto_8959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8962 ?auto_8966 ) ( IS-CRATE ?auto_8958 ) ( not ( = ?auto_8957 ?auto_8958 ) ) ( not ( = ?auto_8956 ?auto_8957 ) ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( not ( = ?auto_8965 ?auto_8966 ) ) ( HOIST-AT ?auto_8960 ?auto_8965 ) ( not ( = ?auto_8962 ?auto_8960 ) ) ( SURFACE-AT ?auto_8958 ?auto_8965 ) ( ON ?auto_8958 ?auto_8961 ) ( CLEAR ?auto_8958 ) ( not ( = ?auto_8957 ?auto_8961 ) ) ( not ( = ?auto_8958 ?auto_8961 ) ) ( not ( = ?auto_8956 ?auto_8961 ) ) ( IS-CRATE ?auto_8957 ) ( SURFACE-AT ?auto_8957 ?auto_8965 ) ( ON ?auto_8957 ?auto_8963 ) ( CLEAR ?auto_8957 ) ( not ( = ?auto_8957 ?auto_8963 ) ) ( not ( = ?auto_8958 ?auto_8963 ) ) ( not ( = ?auto_8956 ?auto_8963 ) ) ( not ( = ?auto_8961 ?auto_8963 ) ) ( IS-CRATE ?auto_8956 ) ( not ( = ?auto_8955 ?auto_8956 ) ) ( not ( = ?auto_8957 ?auto_8955 ) ) ( not ( = ?auto_8958 ?auto_8955 ) ) ( not ( = ?auto_8961 ?auto_8955 ) ) ( not ( = ?auto_8963 ?auto_8955 ) ) ( AVAILABLE ?auto_8960 ) ( SURFACE-AT ?auto_8956 ?auto_8965 ) ( ON ?auto_8956 ?auto_8964 ) ( CLEAR ?auto_8956 ) ( not ( = ?auto_8957 ?auto_8964 ) ) ( not ( = ?auto_8958 ?auto_8964 ) ) ( not ( = ?auto_8956 ?auto_8964 ) ) ( not ( = ?auto_8961 ?auto_8964 ) ) ( not ( = ?auto_8963 ?auto_8964 ) ) ( not ( = ?auto_8955 ?auto_8964 ) ) ( TRUCK-AT ?auto_8959 ?auto_8966 ) ( SURFACE-AT ?auto_8954 ?auto_8966 ) ( CLEAR ?auto_8954 ) ( IS-CRATE ?auto_8955 ) ( not ( = ?auto_8954 ?auto_8955 ) ) ( not ( = ?auto_8957 ?auto_8954 ) ) ( not ( = ?auto_8958 ?auto_8954 ) ) ( not ( = ?auto_8956 ?auto_8954 ) ) ( not ( = ?auto_8961 ?auto_8954 ) ) ( not ( = ?auto_8963 ?auto_8954 ) ) ( not ( = ?auto_8964 ?auto_8954 ) ) ( AVAILABLE ?auto_8962 ) ( IN ?auto_8955 ?auto_8959 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8956 ?auto_8957 ?auto_8958 )
      ( MAKE-4CRATE-VERIFY ?auto_8954 ?auto_8955 ?auto_8956 ?auto_8957 ?auto_8958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8967 - SURFACE
      ?auto_8968 - SURFACE
    )
    :vars
    (
      ?auto_8973 - HOIST
      ?auto_8979 - PLACE
      ?auto_8971 - SURFACE
      ?auto_8978 - PLACE
      ?auto_8970 - HOIST
      ?auto_8972 - SURFACE
      ?auto_8975 - SURFACE
      ?auto_8974 - SURFACE
      ?auto_8977 - SURFACE
      ?auto_8976 - SURFACE
      ?auto_8969 - TRUCK
      ?auto_8980 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8973 ?auto_8979 ) ( IS-CRATE ?auto_8968 ) ( not ( = ?auto_8967 ?auto_8968 ) ) ( not ( = ?auto_8971 ?auto_8967 ) ) ( not ( = ?auto_8971 ?auto_8968 ) ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( HOIST-AT ?auto_8970 ?auto_8978 ) ( not ( = ?auto_8973 ?auto_8970 ) ) ( SURFACE-AT ?auto_8968 ?auto_8978 ) ( ON ?auto_8968 ?auto_8972 ) ( CLEAR ?auto_8968 ) ( not ( = ?auto_8967 ?auto_8972 ) ) ( not ( = ?auto_8968 ?auto_8972 ) ) ( not ( = ?auto_8971 ?auto_8972 ) ) ( IS-CRATE ?auto_8967 ) ( SURFACE-AT ?auto_8967 ?auto_8978 ) ( ON ?auto_8967 ?auto_8975 ) ( CLEAR ?auto_8967 ) ( not ( = ?auto_8967 ?auto_8975 ) ) ( not ( = ?auto_8968 ?auto_8975 ) ) ( not ( = ?auto_8971 ?auto_8975 ) ) ( not ( = ?auto_8972 ?auto_8975 ) ) ( IS-CRATE ?auto_8971 ) ( not ( = ?auto_8974 ?auto_8971 ) ) ( not ( = ?auto_8967 ?auto_8974 ) ) ( not ( = ?auto_8968 ?auto_8974 ) ) ( not ( = ?auto_8972 ?auto_8974 ) ) ( not ( = ?auto_8975 ?auto_8974 ) ) ( AVAILABLE ?auto_8970 ) ( SURFACE-AT ?auto_8971 ?auto_8978 ) ( ON ?auto_8971 ?auto_8977 ) ( CLEAR ?auto_8971 ) ( not ( = ?auto_8967 ?auto_8977 ) ) ( not ( = ?auto_8968 ?auto_8977 ) ) ( not ( = ?auto_8971 ?auto_8977 ) ) ( not ( = ?auto_8972 ?auto_8977 ) ) ( not ( = ?auto_8975 ?auto_8977 ) ) ( not ( = ?auto_8974 ?auto_8977 ) ) ( SURFACE-AT ?auto_8976 ?auto_8979 ) ( CLEAR ?auto_8976 ) ( IS-CRATE ?auto_8974 ) ( not ( = ?auto_8976 ?auto_8974 ) ) ( not ( = ?auto_8967 ?auto_8976 ) ) ( not ( = ?auto_8968 ?auto_8976 ) ) ( not ( = ?auto_8971 ?auto_8976 ) ) ( not ( = ?auto_8972 ?auto_8976 ) ) ( not ( = ?auto_8975 ?auto_8976 ) ) ( not ( = ?auto_8977 ?auto_8976 ) ) ( AVAILABLE ?auto_8973 ) ( IN ?auto_8974 ?auto_8969 ) ( TRUCK-AT ?auto_8969 ?auto_8980 ) ( not ( = ?auto_8980 ?auto_8979 ) ) ( not ( = ?auto_8978 ?auto_8980 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8969 ?auto_8980 ?auto_8979 )
      ( MAKE-2CRATE ?auto_8971 ?auto_8967 ?auto_8968 )
      ( MAKE-1CRATE-VERIFY ?auto_8967 ?auto_8968 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8981 - SURFACE
      ?auto_8982 - SURFACE
      ?auto_8983 - SURFACE
    )
    :vars
    (
      ?auto_8988 - HOIST
      ?auto_8993 - PLACE
      ?auto_8985 - PLACE
      ?auto_8984 - HOIST
      ?auto_8989 - SURFACE
      ?auto_8991 - SURFACE
      ?auto_8990 - SURFACE
      ?auto_8987 - SURFACE
      ?auto_8986 - SURFACE
      ?auto_8994 - TRUCK
      ?auto_8992 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8988 ?auto_8993 ) ( IS-CRATE ?auto_8983 ) ( not ( = ?auto_8982 ?auto_8983 ) ) ( not ( = ?auto_8981 ?auto_8982 ) ) ( not ( = ?auto_8981 ?auto_8983 ) ) ( not ( = ?auto_8985 ?auto_8993 ) ) ( HOIST-AT ?auto_8984 ?auto_8985 ) ( not ( = ?auto_8988 ?auto_8984 ) ) ( SURFACE-AT ?auto_8983 ?auto_8985 ) ( ON ?auto_8983 ?auto_8989 ) ( CLEAR ?auto_8983 ) ( not ( = ?auto_8982 ?auto_8989 ) ) ( not ( = ?auto_8983 ?auto_8989 ) ) ( not ( = ?auto_8981 ?auto_8989 ) ) ( IS-CRATE ?auto_8982 ) ( SURFACE-AT ?auto_8982 ?auto_8985 ) ( ON ?auto_8982 ?auto_8991 ) ( CLEAR ?auto_8982 ) ( not ( = ?auto_8982 ?auto_8991 ) ) ( not ( = ?auto_8983 ?auto_8991 ) ) ( not ( = ?auto_8981 ?auto_8991 ) ) ( not ( = ?auto_8989 ?auto_8991 ) ) ( IS-CRATE ?auto_8981 ) ( not ( = ?auto_8990 ?auto_8981 ) ) ( not ( = ?auto_8982 ?auto_8990 ) ) ( not ( = ?auto_8983 ?auto_8990 ) ) ( not ( = ?auto_8989 ?auto_8990 ) ) ( not ( = ?auto_8991 ?auto_8990 ) ) ( AVAILABLE ?auto_8984 ) ( SURFACE-AT ?auto_8981 ?auto_8985 ) ( ON ?auto_8981 ?auto_8987 ) ( CLEAR ?auto_8981 ) ( not ( = ?auto_8982 ?auto_8987 ) ) ( not ( = ?auto_8983 ?auto_8987 ) ) ( not ( = ?auto_8981 ?auto_8987 ) ) ( not ( = ?auto_8989 ?auto_8987 ) ) ( not ( = ?auto_8991 ?auto_8987 ) ) ( not ( = ?auto_8990 ?auto_8987 ) ) ( SURFACE-AT ?auto_8986 ?auto_8993 ) ( CLEAR ?auto_8986 ) ( IS-CRATE ?auto_8990 ) ( not ( = ?auto_8986 ?auto_8990 ) ) ( not ( = ?auto_8982 ?auto_8986 ) ) ( not ( = ?auto_8983 ?auto_8986 ) ) ( not ( = ?auto_8981 ?auto_8986 ) ) ( not ( = ?auto_8989 ?auto_8986 ) ) ( not ( = ?auto_8991 ?auto_8986 ) ) ( not ( = ?auto_8987 ?auto_8986 ) ) ( AVAILABLE ?auto_8988 ) ( IN ?auto_8990 ?auto_8994 ) ( TRUCK-AT ?auto_8994 ?auto_8992 ) ( not ( = ?auto_8992 ?auto_8993 ) ) ( not ( = ?auto_8985 ?auto_8992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8982 ?auto_8983 )
      ( MAKE-2CRATE-VERIFY ?auto_8981 ?auto_8982 ?auto_8983 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8995 - SURFACE
      ?auto_8996 - SURFACE
      ?auto_8997 - SURFACE
      ?auto_8998 - SURFACE
    )
    :vars
    (
      ?auto_9002 - HOIST
      ?auto_9004 - PLACE
      ?auto_8999 - PLACE
      ?auto_9008 - HOIST
      ?auto_9005 - SURFACE
      ?auto_9007 - SURFACE
      ?auto_9003 - SURFACE
      ?auto_9001 - SURFACE
      ?auto_9006 - TRUCK
      ?auto_9000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9002 ?auto_9004 ) ( IS-CRATE ?auto_8998 ) ( not ( = ?auto_8997 ?auto_8998 ) ) ( not ( = ?auto_8996 ?auto_8997 ) ) ( not ( = ?auto_8996 ?auto_8998 ) ) ( not ( = ?auto_8999 ?auto_9004 ) ) ( HOIST-AT ?auto_9008 ?auto_8999 ) ( not ( = ?auto_9002 ?auto_9008 ) ) ( SURFACE-AT ?auto_8998 ?auto_8999 ) ( ON ?auto_8998 ?auto_9005 ) ( CLEAR ?auto_8998 ) ( not ( = ?auto_8997 ?auto_9005 ) ) ( not ( = ?auto_8998 ?auto_9005 ) ) ( not ( = ?auto_8996 ?auto_9005 ) ) ( IS-CRATE ?auto_8997 ) ( SURFACE-AT ?auto_8997 ?auto_8999 ) ( ON ?auto_8997 ?auto_9007 ) ( CLEAR ?auto_8997 ) ( not ( = ?auto_8997 ?auto_9007 ) ) ( not ( = ?auto_8998 ?auto_9007 ) ) ( not ( = ?auto_8996 ?auto_9007 ) ) ( not ( = ?auto_9005 ?auto_9007 ) ) ( IS-CRATE ?auto_8996 ) ( not ( = ?auto_8995 ?auto_8996 ) ) ( not ( = ?auto_8997 ?auto_8995 ) ) ( not ( = ?auto_8998 ?auto_8995 ) ) ( not ( = ?auto_9005 ?auto_8995 ) ) ( not ( = ?auto_9007 ?auto_8995 ) ) ( AVAILABLE ?auto_9008 ) ( SURFACE-AT ?auto_8996 ?auto_8999 ) ( ON ?auto_8996 ?auto_9003 ) ( CLEAR ?auto_8996 ) ( not ( = ?auto_8997 ?auto_9003 ) ) ( not ( = ?auto_8998 ?auto_9003 ) ) ( not ( = ?auto_8996 ?auto_9003 ) ) ( not ( = ?auto_9005 ?auto_9003 ) ) ( not ( = ?auto_9007 ?auto_9003 ) ) ( not ( = ?auto_8995 ?auto_9003 ) ) ( SURFACE-AT ?auto_9001 ?auto_9004 ) ( CLEAR ?auto_9001 ) ( IS-CRATE ?auto_8995 ) ( not ( = ?auto_9001 ?auto_8995 ) ) ( not ( = ?auto_8997 ?auto_9001 ) ) ( not ( = ?auto_8998 ?auto_9001 ) ) ( not ( = ?auto_8996 ?auto_9001 ) ) ( not ( = ?auto_9005 ?auto_9001 ) ) ( not ( = ?auto_9007 ?auto_9001 ) ) ( not ( = ?auto_9003 ?auto_9001 ) ) ( AVAILABLE ?auto_9002 ) ( IN ?auto_8995 ?auto_9006 ) ( TRUCK-AT ?auto_9006 ?auto_9000 ) ( not ( = ?auto_9000 ?auto_9004 ) ) ( not ( = ?auto_8999 ?auto_9000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8996 ?auto_8997 ?auto_8998 )
      ( MAKE-3CRATE-VERIFY ?auto_8995 ?auto_8996 ?auto_8997 ?auto_8998 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9009 - SURFACE
      ?auto_9010 - SURFACE
      ?auto_9011 - SURFACE
      ?auto_9012 - SURFACE
      ?auto_9013 - SURFACE
    )
    :vars
    (
      ?auto_9016 - HOIST
      ?auto_9018 - PLACE
      ?auto_9014 - PLACE
      ?auto_9022 - HOIST
      ?auto_9019 - SURFACE
      ?auto_9021 - SURFACE
      ?auto_9017 - SURFACE
      ?auto_9020 - TRUCK
      ?auto_9015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9016 ?auto_9018 ) ( IS-CRATE ?auto_9013 ) ( not ( = ?auto_9012 ?auto_9013 ) ) ( not ( = ?auto_9011 ?auto_9012 ) ) ( not ( = ?auto_9011 ?auto_9013 ) ) ( not ( = ?auto_9014 ?auto_9018 ) ) ( HOIST-AT ?auto_9022 ?auto_9014 ) ( not ( = ?auto_9016 ?auto_9022 ) ) ( SURFACE-AT ?auto_9013 ?auto_9014 ) ( ON ?auto_9013 ?auto_9019 ) ( CLEAR ?auto_9013 ) ( not ( = ?auto_9012 ?auto_9019 ) ) ( not ( = ?auto_9013 ?auto_9019 ) ) ( not ( = ?auto_9011 ?auto_9019 ) ) ( IS-CRATE ?auto_9012 ) ( SURFACE-AT ?auto_9012 ?auto_9014 ) ( ON ?auto_9012 ?auto_9021 ) ( CLEAR ?auto_9012 ) ( not ( = ?auto_9012 ?auto_9021 ) ) ( not ( = ?auto_9013 ?auto_9021 ) ) ( not ( = ?auto_9011 ?auto_9021 ) ) ( not ( = ?auto_9019 ?auto_9021 ) ) ( IS-CRATE ?auto_9011 ) ( not ( = ?auto_9010 ?auto_9011 ) ) ( not ( = ?auto_9012 ?auto_9010 ) ) ( not ( = ?auto_9013 ?auto_9010 ) ) ( not ( = ?auto_9019 ?auto_9010 ) ) ( not ( = ?auto_9021 ?auto_9010 ) ) ( AVAILABLE ?auto_9022 ) ( SURFACE-AT ?auto_9011 ?auto_9014 ) ( ON ?auto_9011 ?auto_9017 ) ( CLEAR ?auto_9011 ) ( not ( = ?auto_9012 ?auto_9017 ) ) ( not ( = ?auto_9013 ?auto_9017 ) ) ( not ( = ?auto_9011 ?auto_9017 ) ) ( not ( = ?auto_9019 ?auto_9017 ) ) ( not ( = ?auto_9021 ?auto_9017 ) ) ( not ( = ?auto_9010 ?auto_9017 ) ) ( SURFACE-AT ?auto_9009 ?auto_9018 ) ( CLEAR ?auto_9009 ) ( IS-CRATE ?auto_9010 ) ( not ( = ?auto_9009 ?auto_9010 ) ) ( not ( = ?auto_9012 ?auto_9009 ) ) ( not ( = ?auto_9013 ?auto_9009 ) ) ( not ( = ?auto_9011 ?auto_9009 ) ) ( not ( = ?auto_9019 ?auto_9009 ) ) ( not ( = ?auto_9021 ?auto_9009 ) ) ( not ( = ?auto_9017 ?auto_9009 ) ) ( AVAILABLE ?auto_9016 ) ( IN ?auto_9010 ?auto_9020 ) ( TRUCK-AT ?auto_9020 ?auto_9015 ) ( not ( = ?auto_9015 ?auto_9018 ) ) ( not ( = ?auto_9014 ?auto_9015 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9011 ?auto_9012 ?auto_9013 )
      ( MAKE-4CRATE-VERIFY ?auto_9009 ?auto_9010 ?auto_9011 ?auto_9012 ?auto_9013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9023 - SURFACE
      ?auto_9024 - SURFACE
    )
    :vars
    (
      ?auto_9029 - HOIST
      ?auto_9031 - PLACE
      ?auto_9036 - SURFACE
      ?auto_9025 - PLACE
      ?auto_9035 - HOIST
      ?auto_9032 - SURFACE
      ?auto_9034 - SURFACE
      ?auto_9026 - SURFACE
      ?auto_9030 - SURFACE
      ?auto_9028 - SURFACE
      ?auto_9033 - TRUCK
      ?auto_9027 - PLACE
      ?auto_9037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9029 ?auto_9031 ) ( IS-CRATE ?auto_9024 ) ( not ( = ?auto_9023 ?auto_9024 ) ) ( not ( = ?auto_9036 ?auto_9023 ) ) ( not ( = ?auto_9036 ?auto_9024 ) ) ( not ( = ?auto_9025 ?auto_9031 ) ) ( HOIST-AT ?auto_9035 ?auto_9025 ) ( not ( = ?auto_9029 ?auto_9035 ) ) ( SURFACE-AT ?auto_9024 ?auto_9025 ) ( ON ?auto_9024 ?auto_9032 ) ( CLEAR ?auto_9024 ) ( not ( = ?auto_9023 ?auto_9032 ) ) ( not ( = ?auto_9024 ?auto_9032 ) ) ( not ( = ?auto_9036 ?auto_9032 ) ) ( IS-CRATE ?auto_9023 ) ( SURFACE-AT ?auto_9023 ?auto_9025 ) ( ON ?auto_9023 ?auto_9034 ) ( CLEAR ?auto_9023 ) ( not ( = ?auto_9023 ?auto_9034 ) ) ( not ( = ?auto_9024 ?auto_9034 ) ) ( not ( = ?auto_9036 ?auto_9034 ) ) ( not ( = ?auto_9032 ?auto_9034 ) ) ( IS-CRATE ?auto_9036 ) ( not ( = ?auto_9026 ?auto_9036 ) ) ( not ( = ?auto_9023 ?auto_9026 ) ) ( not ( = ?auto_9024 ?auto_9026 ) ) ( not ( = ?auto_9032 ?auto_9026 ) ) ( not ( = ?auto_9034 ?auto_9026 ) ) ( AVAILABLE ?auto_9035 ) ( SURFACE-AT ?auto_9036 ?auto_9025 ) ( ON ?auto_9036 ?auto_9030 ) ( CLEAR ?auto_9036 ) ( not ( = ?auto_9023 ?auto_9030 ) ) ( not ( = ?auto_9024 ?auto_9030 ) ) ( not ( = ?auto_9036 ?auto_9030 ) ) ( not ( = ?auto_9032 ?auto_9030 ) ) ( not ( = ?auto_9034 ?auto_9030 ) ) ( not ( = ?auto_9026 ?auto_9030 ) ) ( SURFACE-AT ?auto_9028 ?auto_9031 ) ( CLEAR ?auto_9028 ) ( IS-CRATE ?auto_9026 ) ( not ( = ?auto_9028 ?auto_9026 ) ) ( not ( = ?auto_9023 ?auto_9028 ) ) ( not ( = ?auto_9024 ?auto_9028 ) ) ( not ( = ?auto_9036 ?auto_9028 ) ) ( not ( = ?auto_9032 ?auto_9028 ) ) ( not ( = ?auto_9034 ?auto_9028 ) ) ( not ( = ?auto_9030 ?auto_9028 ) ) ( AVAILABLE ?auto_9029 ) ( TRUCK-AT ?auto_9033 ?auto_9027 ) ( not ( = ?auto_9027 ?auto_9031 ) ) ( not ( = ?auto_9025 ?auto_9027 ) ) ( HOIST-AT ?auto_9037 ?auto_9027 ) ( LIFTING ?auto_9037 ?auto_9026 ) ( not ( = ?auto_9029 ?auto_9037 ) ) ( not ( = ?auto_9035 ?auto_9037 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9037 ?auto_9026 ?auto_9033 ?auto_9027 )
      ( MAKE-2CRATE ?auto_9036 ?auto_9023 ?auto_9024 )
      ( MAKE-1CRATE-VERIFY ?auto_9023 ?auto_9024 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9038 - SURFACE
      ?auto_9039 - SURFACE
      ?auto_9040 - SURFACE
    )
    :vars
    (
      ?auto_9042 - HOIST
      ?auto_9050 - PLACE
      ?auto_9046 - PLACE
      ?auto_9044 - HOIST
      ?auto_9045 - SURFACE
      ?auto_9041 - SURFACE
      ?auto_9052 - SURFACE
      ?auto_9049 - SURFACE
      ?auto_9048 - SURFACE
      ?auto_9047 - TRUCK
      ?auto_9043 - PLACE
      ?auto_9051 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9042 ?auto_9050 ) ( IS-CRATE ?auto_9040 ) ( not ( = ?auto_9039 ?auto_9040 ) ) ( not ( = ?auto_9038 ?auto_9039 ) ) ( not ( = ?auto_9038 ?auto_9040 ) ) ( not ( = ?auto_9046 ?auto_9050 ) ) ( HOIST-AT ?auto_9044 ?auto_9046 ) ( not ( = ?auto_9042 ?auto_9044 ) ) ( SURFACE-AT ?auto_9040 ?auto_9046 ) ( ON ?auto_9040 ?auto_9045 ) ( CLEAR ?auto_9040 ) ( not ( = ?auto_9039 ?auto_9045 ) ) ( not ( = ?auto_9040 ?auto_9045 ) ) ( not ( = ?auto_9038 ?auto_9045 ) ) ( IS-CRATE ?auto_9039 ) ( SURFACE-AT ?auto_9039 ?auto_9046 ) ( ON ?auto_9039 ?auto_9041 ) ( CLEAR ?auto_9039 ) ( not ( = ?auto_9039 ?auto_9041 ) ) ( not ( = ?auto_9040 ?auto_9041 ) ) ( not ( = ?auto_9038 ?auto_9041 ) ) ( not ( = ?auto_9045 ?auto_9041 ) ) ( IS-CRATE ?auto_9038 ) ( not ( = ?auto_9052 ?auto_9038 ) ) ( not ( = ?auto_9039 ?auto_9052 ) ) ( not ( = ?auto_9040 ?auto_9052 ) ) ( not ( = ?auto_9045 ?auto_9052 ) ) ( not ( = ?auto_9041 ?auto_9052 ) ) ( AVAILABLE ?auto_9044 ) ( SURFACE-AT ?auto_9038 ?auto_9046 ) ( ON ?auto_9038 ?auto_9049 ) ( CLEAR ?auto_9038 ) ( not ( = ?auto_9039 ?auto_9049 ) ) ( not ( = ?auto_9040 ?auto_9049 ) ) ( not ( = ?auto_9038 ?auto_9049 ) ) ( not ( = ?auto_9045 ?auto_9049 ) ) ( not ( = ?auto_9041 ?auto_9049 ) ) ( not ( = ?auto_9052 ?auto_9049 ) ) ( SURFACE-AT ?auto_9048 ?auto_9050 ) ( CLEAR ?auto_9048 ) ( IS-CRATE ?auto_9052 ) ( not ( = ?auto_9048 ?auto_9052 ) ) ( not ( = ?auto_9039 ?auto_9048 ) ) ( not ( = ?auto_9040 ?auto_9048 ) ) ( not ( = ?auto_9038 ?auto_9048 ) ) ( not ( = ?auto_9045 ?auto_9048 ) ) ( not ( = ?auto_9041 ?auto_9048 ) ) ( not ( = ?auto_9049 ?auto_9048 ) ) ( AVAILABLE ?auto_9042 ) ( TRUCK-AT ?auto_9047 ?auto_9043 ) ( not ( = ?auto_9043 ?auto_9050 ) ) ( not ( = ?auto_9046 ?auto_9043 ) ) ( HOIST-AT ?auto_9051 ?auto_9043 ) ( LIFTING ?auto_9051 ?auto_9052 ) ( not ( = ?auto_9042 ?auto_9051 ) ) ( not ( = ?auto_9044 ?auto_9051 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9039 ?auto_9040 )
      ( MAKE-2CRATE-VERIFY ?auto_9038 ?auto_9039 ?auto_9040 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9053 - SURFACE
      ?auto_9054 - SURFACE
      ?auto_9055 - SURFACE
      ?auto_9056 - SURFACE
    )
    :vars
    (
      ?auto_9063 - HOIST
      ?auto_9060 - PLACE
      ?auto_9061 - PLACE
      ?auto_9057 - HOIST
      ?auto_9059 - SURFACE
      ?auto_9065 - SURFACE
      ?auto_9058 - SURFACE
      ?auto_9067 - SURFACE
      ?auto_9062 - TRUCK
      ?auto_9066 - PLACE
      ?auto_9064 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9063 ?auto_9060 ) ( IS-CRATE ?auto_9056 ) ( not ( = ?auto_9055 ?auto_9056 ) ) ( not ( = ?auto_9054 ?auto_9055 ) ) ( not ( = ?auto_9054 ?auto_9056 ) ) ( not ( = ?auto_9061 ?auto_9060 ) ) ( HOIST-AT ?auto_9057 ?auto_9061 ) ( not ( = ?auto_9063 ?auto_9057 ) ) ( SURFACE-AT ?auto_9056 ?auto_9061 ) ( ON ?auto_9056 ?auto_9059 ) ( CLEAR ?auto_9056 ) ( not ( = ?auto_9055 ?auto_9059 ) ) ( not ( = ?auto_9056 ?auto_9059 ) ) ( not ( = ?auto_9054 ?auto_9059 ) ) ( IS-CRATE ?auto_9055 ) ( SURFACE-AT ?auto_9055 ?auto_9061 ) ( ON ?auto_9055 ?auto_9065 ) ( CLEAR ?auto_9055 ) ( not ( = ?auto_9055 ?auto_9065 ) ) ( not ( = ?auto_9056 ?auto_9065 ) ) ( not ( = ?auto_9054 ?auto_9065 ) ) ( not ( = ?auto_9059 ?auto_9065 ) ) ( IS-CRATE ?auto_9054 ) ( not ( = ?auto_9053 ?auto_9054 ) ) ( not ( = ?auto_9055 ?auto_9053 ) ) ( not ( = ?auto_9056 ?auto_9053 ) ) ( not ( = ?auto_9059 ?auto_9053 ) ) ( not ( = ?auto_9065 ?auto_9053 ) ) ( AVAILABLE ?auto_9057 ) ( SURFACE-AT ?auto_9054 ?auto_9061 ) ( ON ?auto_9054 ?auto_9058 ) ( CLEAR ?auto_9054 ) ( not ( = ?auto_9055 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9058 ) ) ( not ( = ?auto_9054 ?auto_9058 ) ) ( not ( = ?auto_9059 ?auto_9058 ) ) ( not ( = ?auto_9065 ?auto_9058 ) ) ( not ( = ?auto_9053 ?auto_9058 ) ) ( SURFACE-AT ?auto_9067 ?auto_9060 ) ( CLEAR ?auto_9067 ) ( IS-CRATE ?auto_9053 ) ( not ( = ?auto_9067 ?auto_9053 ) ) ( not ( = ?auto_9055 ?auto_9067 ) ) ( not ( = ?auto_9056 ?auto_9067 ) ) ( not ( = ?auto_9054 ?auto_9067 ) ) ( not ( = ?auto_9059 ?auto_9067 ) ) ( not ( = ?auto_9065 ?auto_9067 ) ) ( not ( = ?auto_9058 ?auto_9067 ) ) ( AVAILABLE ?auto_9063 ) ( TRUCK-AT ?auto_9062 ?auto_9066 ) ( not ( = ?auto_9066 ?auto_9060 ) ) ( not ( = ?auto_9061 ?auto_9066 ) ) ( HOIST-AT ?auto_9064 ?auto_9066 ) ( LIFTING ?auto_9064 ?auto_9053 ) ( not ( = ?auto_9063 ?auto_9064 ) ) ( not ( = ?auto_9057 ?auto_9064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9054 ?auto_9055 ?auto_9056 )
      ( MAKE-3CRATE-VERIFY ?auto_9053 ?auto_9054 ?auto_9055 ?auto_9056 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9068 - SURFACE
      ?auto_9069 - SURFACE
      ?auto_9070 - SURFACE
      ?auto_9071 - SURFACE
      ?auto_9072 - SURFACE
    )
    :vars
    (
      ?auto_9079 - HOIST
      ?auto_9076 - PLACE
      ?auto_9077 - PLACE
      ?auto_9073 - HOIST
      ?auto_9075 - SURFACE
      ?auto_9081 - SURFACE
      ?auto_9074 - SURFACE
      ?auto_9078 - TRUCK
      ?auto_9082 - PLACE
      ?auto_9080 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9079 ?auto_9076 ) ( IS-CRATE ?auto_9072 ) ( not ( = ?auto_9071 ?auto_9072 ) ) ( not ( = ?auto_9070 ?auto_9071 ) ) ( not ( = ?auto_9070 ?auto_9072 ) ) ( not ( = ?auto_9077 ?auto_9076 ) ) ( HOIST-AT ?auto_9073 ?auto_9077 ) ( not ( = ?auto_9079 ?auto_9073 ) ) ( SURFACE-AT ?auto_9072 ?auto_9077 ) ( ON ?auto_9072 ?auto_9075 ) ( CLEAR ?auto_9072 ) ( not ( = ?auto_9071 ?auto_9075 ) ) ( not ( = ?auto_9072 ?auto_9075 ) ) ( not ( = ?auto_9070 ?auto_9075 ) ) ( IS-CRATE ?auto_9071 ) ( SURFACE-AT ?auto_9071 ?auto_9077 ) ( ON ?auto_9071 ?auto_9081 ) ( CLEAR ?auto_9071 ) ( not ( = ?auto_9071 ?auto_9081 ) ) ( not ( = ?auto_9072 ?auto_9081 ) ) ( not ( = ?auto_9070 ?auto_9081 ) ) ( not ( = ?auto_9075 ?auto_9081 ) ) ( IS-CRATE ?auto_9070 ) ( not ( = ?auto_9069 ?auto_9070 ) ) ( not ( = ?auto_9071 ?auto_9069 ) ) ( not ( = ?auto_9072 ?auto_9069 ) ) ( not ( = ?auto_9075 ?auto_9069 ) ) ( not ( = ?auto_9081 ?auto_9069 ) ) ( AVAILABLE ?auto_9073 ) ( SURFACE-AT ?auto_9070 ?auto_9077 ) ( ON ?auto_9070 ?auto_9074 ) ( CLEAR ?auto_9070 ) ( not ( = ?auto_9071 ?auto_9074 ) ) ( not ( = ?auto_9072 ?auto_9074 ) ) ( not ( = ?auto_9070 ?auto_9074 ) ) ( not ( = ?auto_9075 ?auto_9074 ) ) ( not ( = ?auto_9081 ?auto_9074 ) ) ( not ( = ?auto_9069 ?auto_9074 ) ) ( SURFACE-AT ?auto_9068 ?auto_9076 ) ( CLEAR ?auto_9068 ) ( IS-CRATE ?auto_9069 ) ( not ( = ?auto_9068 ?auto_9069 ) ) ( not ( = ?auto_9071 ?auto_9068 ) ) ( not ( = ?auto_9072 ?auto_9068 ) ) ( not ( = ?auto_9070 ?auto_9068 ) ) ( not ( = ?auto_9075 ?auto_9068 ) ) ( not ( = ?auto_9081 ?auto_9068 ) ) ( not ( = ?auto_9074 ?auto_9068 ) ) ( AVAILABLE ?auto_9079 ) ( TRUCK-AT ?auto_9078 ?auto_9082 ) ( not ( = ?auto_9082 ?auto_9076 ) ) ( not ( = ?auto_9077 ?auto_9082 ) ) ( HOIST-AT ?auto_9080 ?auto_9082 ) ( LIFTING ?auto_9080 ?auto_9069 ) ( not ( = ?auto_9079 ?auto_9080 ) ) ( not ( = ?auto_9073 ?auto_9080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9070 ?auto_9071 ?auto_9072 )
      ( MAKE-4CRATE-VERIFY ?auto_9068 ?auto_9069 ?auto_9070 ?auto_9071 ?auto_9072 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9083 - SURFACE
      ?auto_9084 - SURFACE
    )
    :vars
    (
      ?auto_9091 - HOIST
      ?auto_9088 - PLACE
      ?auto_9093 - SURFACE
      ?auto_9089 - PLACE
      ?auto_9085 - HOIST
      ?auto_9087 - SURFACE
      ?auto_9094 - SURFACE
      ?auto_9097 - SURFACE
      ?auto_9086 - SURFACE
      ?auto_9096 - SURFACE
      ?auto_9090 - TRUCK
      ?auto_9095 - PLACE
      ?auto_9092 - HOIST
      ?auto_9098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9091 ?auto_9088 ) ( IS-CRATE ?auto_9084 ) ( not ( = ?auto_9083 ?auto_9084 ) ) ( not ( = ?auto_9093 ?auto_9083 ) ) ( not ( = ?auto_9093 ?auto_9084 ) ) ( not ( = ?auto_9089 ?auto_9088 ) ) ( HOIST-AT ?auto_9085 ?auto_9089 ) ( not ( = ?auto_9091 ?auto_9085 ) ) ( SURFACE-AT ?auto_9084 ?auto_9089 ) ( ON ?auto_9084 ?auto_9087 ) ( CLEAR ?auto_9084 ) ( not ( = ?auto_9083 ?auto_9087 ) ) ( not ( = ?auto_9084 ?auto_9087 ) ) ( not ( = ?auto_9093 ?auto_9087 ) ) ( IS-CRATE ?auto_9083 ) ( SURFACE-AT ?auto_9083 ?auto_9089 ) ( ON ?auto_9083 ?auto_9094 ) ( CLEAR ?auto_9083 ) ( not ( = ?auto_9083 ?auto_9094 ) ) ( not ( = ?auto_9084 ?auto_9094 ) ) ( not ( = ?auto_9093 ?auto_9094 ) ) ( not ( = ?auto_9087 ?auto_9094 ) ) ( IS-CRATE ?auto_9093 ) ( not ( = ?auto_9097 ?auto_9093 ) ) ( not ( = ?auto_9083 ?auto_9097 ) ) ( not ( = ?auto_9084 ?auto_9097 ) ) ( not ( = ?auto_9087 ?auto_9097 ) ) ( not ( = ?auto_9094 ?auto_9097 ) ) ( AVAILABLE ?auto_9085 ) ( SURFACE-AT ?auto_9093 ?auto_9089 ) ( ON ?auto_9093 ?auto_9086 ) ( CLEAR ?auto_9093 ) ( not ( = ?auto_9083 ?auto_9086 ) ) ( not ( = ?auto_9084 ?auto_9086 ) ) ( not ( = ?auto_9093 ?auto_9086 ) ) ( not ( = ?auto_9087 ?auto_9086 ) ) ( not ( = ?auto_9094 ?auto_9086 ) ) ( not ( = ?auto_9097 ?auto_9086 ) ) ( SURFACE-AT ?auto_9096 ?auto_9088 ) ( CLEAR ?auto_9096 ) ( IS-CRATE ?auto_9097 ) ( not ( = ?auto_9096 ?auto_9097 ) ) ( not ( = ?auto_9083 ?auto_9096 ) ) ( not ( = ?auto_9084 ?auto_9096 ) ) ( not ( = ?auto_9093 ?auto_9096 ) ) ( not ( = ?auto_9087 ?auto_9096 ) ) ( not ( = ?auto_9094 ?auto_9096 ) ) ( not ( = ?auto_9086 ?auto_9096 ) ) ( AVAILABLE ?auto_9091 ) ( TRUCK-AT ?auto_9090 ?auto_9095 ) ( not ( = ?auto_9095 ?auto_9088 ) ) ( not ( = ?auto_9089 ?auto_9095 ) ) ( HOIST-AT ?auto_9092 ?auto_9095 ) ( not ( = ?auto_9091 ?auto_9092 ) ) ( not ( = ?auto_9085 ?auto_9092 ) ) ( AVAILABLE ?auto_9092 ) ( SURFACE-AT ?auto_9097 ?auto_9095 ) ( ON ?auto_9097 ?auto_9098 ) ( CLEAR ?auto_9097 ) ( not ( = ?auto_9083 ?auto_9098 ) ) ( not ( = ?auto_9084 ?auto_9098 ) ) ( not ( = ?auto_9093 ?auto_9098 ) ) ( not ( = ?auto_9087 ?auto_9098 ) ) ( not ( = ?auto_9094 ?auto_9098 ) ) ( not ( = ?auto_9097 ?auto_9098 ) ) ( not ( = ?auto_9086 ?auto_9098 ) ) ( not ( = ?auto_9096 ?auto_9098 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9092 ?auto_9097 ?auto_9098 ?auto_9095 )
      ( MAKE-2CRATE ?auto_9093 ?auto_9083 ?auto_9084 )
      ( MAKE-1CRATE-VERIFY ?auto_9083 ?auto_9084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9099 - SURFACE
      ?auto_9100 - SURFACE
      ?auto_9101 - SURFACE
    )
    :vars
    (
      ?auto_9109 - HOIST
      ?auto_9105 - PLACE
      ?auto_9111 - PLACE
      ?auto_9107 - HOIST
      ?auto_9108 - SURFACE
      ?auto_9112 - SURFACE
      ?auto_9110 - SURFACE
      ?auto_9102 - SURFACE
      ?auto_9113 - SURFACE
      ?auto_9104 - TRUCK
      ?auto_9106 - PLACE
      ?auto_9114 - HOIST
      ?auto_9103 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9109 ?auto_9105 ) ( IS-CRATE ?auto_9101 ) ( not ( = ?auto_9100 ?auto_9101 ) ) ( not ( = ?auto_9099 ?auto_9100 ) ) ( not ( = ?auto_9099 ?auto_9101 ) ) ( not ( = ?auto_9111 ?auto_9105 ) ) ( HOIST-AT ?auto_9107 ?auto_9111 ) ( not ( = ?auto_9109 ?auto_9107 ) ) ( SURFACE-AT ?auto_9101 ?auto_9111 ) ( ON ?auto_9101 ?auto_9108 ) ( CLEAR ?auto_9101 ) ( not ( = ?auto_9100 ?auto_9108 ) ) ( not ( = ?auto_9101 ?auto_9108 ) ) ( not ( = ?auto_9099 ?auto_9108 ) ) ( IS-CRATE ?auto_9100 ) ( SURFACE-AT ?auto_9100 ?auto_9111 ) ( ON ?auto_9100 ?auto_9112 ) ( CLEAR ?auto_9100 ) ( not ( = ?auto_9100 ?auto_9112 ) ) ( not ( = ?auto_9101 ?auto_9112 ) ) ( not ( = ?auto_9099 ?auto_9112 ) ) ( not ( = ?auto_9108 ?auto_9112 ) ) ( IS-CRATE ?auto_9099 ) ( not ( = ?auto_9110 ?auto_9099 ) ) ( not ( = ?auto_9100 ?auto_9110 ) ) ( not ( = ?auto_9101 ?auto_9110 ) ) ( not ( = ?auto_9108 ?auto_9110 ) ) ( not ( = ?auto_9112 ?auto_9110 ) ) ( AVAILABLE ?auto_9107 ) ( SURFACE-AT ?auto_9099 ?auto_9111 ) ( ON ?auto_9099 ?auto_9102 ) ( CLEAR ?auto_9099 ) ( not ( = ?auto_9100 ?auto_9102 ) ) ( not ( = ?auto_9101 ?auto_9102 ) ) ( not ( = ?auto_9099 ?auto_9102 ) ) ( not ( = ?auto_9108 ?auto_9102 ) ) ( not ( = ?auto_9112 ?auto_9102 ) ) ( not ( = ?auto_9110 ?auto_9102 ) ) ( SURFACE-AT ?auto_9113 ?auto_9105 ) ( CLEAR ?auto_9113 ) ( IS-CRATE ?auto_9110 ) ( not ( = ?auto_9113 ?auto_9110 ) ) ( not ( = ?auto_9100 ?auto_9113 ) ) ( not ( = ?auto_9101 ?auto_9113 ) ) ( not ( = ?auto_9099 ?auto_9113 ) ) ( not ( = ?auto_9108 ?auto_9113 ) ) ( not ( = ?auto_9112 ?auto_9113 ) ) ( not ( = ?auto_9102 ?auto_9113 ) ) ( AVAILABLE ?auto_9109 ) ( TRUCK-AT ?auto_9104 ?auto_9106 ) ( not ( = ?auto_9106 ?auto_9105 ) ) ( not ( = ?auto_9111 ?auto_9106 ) ) ( HOIST-AT ?auto_9114 ?auto_9106 ) ( not ( = ?auto_9109 ?auto_9114 ) ) ( not ( = ?auto_9107 ?auto_9114 ) ) ( AVAILABLE ?auto_9114 ) ( SURFACE-AT ?auto_9110 ?auto_9106 ) ( ON ?auto_9110 ?auto_9103 ) ( CLEAR ?auto_9110 ) ( not ( = ?auto_9100 ?auto_9103 ) ) ( not ( = ?auto_9101 ?auto_9103 ) ) ( not ( = ?auto_9099 ?auto_9103 ) ) ( not ( = ?auto_9108 ?auto_9103 ) ) ( not ( = ?auto_9112 ?auto_9103 ) ) ( not ( = ?auto_9110 ?auto_9103 ) ) ( not ( = ?auto_9102 ?auto_9103 ) ) ( not ( = ?auto_9113 ?auto_9103 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9100 ?auto_9101 )
      ( MAKE-2CRATE-VERIFY ?auto_9099 ?auto_9100 ?auto_9101 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9115 - SURFACE
      ?auto_9116 - SURFACE
      ?auto_9117 - SURFACE
      ?auto_9118 - SURFACE
    )
    :vars
    (
      ?auto_9126 - HOIST
      ?auto_9124 - PLACE
      ?auto_9125 - PLACE
      ?auto_9119 - HOIST
      ?auto_9127 - SURFACE
      ?auto_9122 - SURFACE
      ?auto_9130 - SURFACE
      ?auto_9129 - SURFACE
      ?auto_9123 - TRUCK
      ?auto_9120 - PLACE
      ?auto_9121 - HOIST
      ?auto_9128 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9126 ?auto_9124 ) ( IS-CRATE ?auto_9118 ) ( not ( = ?auto_9117 ?auto_9118 ) ) ( not ( = ?auto_9116 ?auto_9117 ) ) ( not ( = ?auto_9116 ?auto_9118 ) ) ( not ( = ?auto_9125 ?auto_9124 ) ) ( HOIST-AT ?auto_9119 ?auto_9125 ) ( not ( = ?auto_9126 ?auto_9119 ) ) ( SURFACE-AT ?auto_9118 ?auto_9125 ) ( ON ?auto_9118 ?auto_9127 ) ( CLEAR ?auto_9118 ) ( not ( = ?auto_9117 ?auto_9127 ) ) ( not ( = ?auto_9118 ?auto_9127 ) ) ( not ( = ?auto_9116 ?auto_9127 ) ) ( IS-CRATE ?auto_9117 ) ( SURFACE-AT ?auto_9117 ?auto_9125 ) ( ON ?auto_9117 ?auto_9122 ) ( CLEAR ?auto_9117 ) ( not ( = ?auto_9117 ?auto_9122 ) ) ( not ( = ?auto_9118 ?auto_9122 ) ) ( not ( = ?auto_9116 ?auto_9122 ) ) ( not ( = ?auto_9127 ?auto_9122 ) ) ( IS-CRATE ?auto_9116 ) ( not ( = ?auto_9115 ?auto_9116 ) ) ( not ( = ?auto_9117 ?auto_9115 ) ) ( not ( = ?auto_9118 ?auto_9115 ) ) ( not ( = ?auto_9127 ?auto_9115 ) ) ( not ( = ?auto_9122 ?auto_9115 ) ) ( AVAILABLE ?auto_9119 ) ( SURFACE-AT ?auto_9116 ?auto_9125 ) ( ON ?auto_9116 ?auto_9130 ) ( CLEAR ?auto_9116 ) ( not ( = ?auto_9117 ?auto_9130 ) ) ( not ( = ?auto_9118 ?auto_9130 ) ) ( not ( = ?auto_9116 ?auto_9130 ) ) ( not ( = ?auto_9127 ?auto_9130 ) ) ( not ( = ?auto_9122 ?auto_9130 ) ) ( not ( = ?auto_9115 ?auto_9130 ) ) ( SURFACE-AT ?auto_9129 ?auto_9124 ) ( CLEAR ?auto_9129 ) ( IS-CRATE ?auto_9115 ) ( not ( = ?auto_9129 ?auto_9115 ) ) ( not ( = ?auto_9117 ?auto_9129 ) ) ( not ( = ?auto_9118 ?auto_9129 ) ) ( not ( = ?auto_9116 ?auto_9129 ) ) ( not ( = ?auto_9127 ?auto_9129 ) ) ( not ( = ?auto_9122 ?auto_9129 ) ) ( not ( = ?auto_9130 ?auto_9129 ) ) ( AVAILABLE ?auto_9126 ) ( TRUCK-AT ?auto_9123 ?auto_9120 ) ( not ( = ?auto_9120 ?auto_9124 ) ) ( not ( = ?auto_9125 ?auto_9120 ) ) ( HOIST-AT ?auto_9121 ?auto_9120 ) ( not ( = ?auto_9126 ?auto_9121 ) ) ( not ( = ?auto_9119 ?auto_9121 ) ) ( AVAILABLE ?auto_9121 ) ( SURFACE-AT ?auto_9115 ?auto_9120 ) ( ON ?auto_9115 ?auto_9128 ) ( CLEAR ?auto_9115 ) ( not ( = ?auto_9117 ?auto_9128 ) ) ( not ( = ?auto_9118 ?auto_9128 ) ) ( not ( = ?auto_9116 ?auto_9128 ) ) ( not ( = ?auto_9127 ?auto_9128 ) ) ( not ( = ?auto_9122 ?auto_9128 ) ) ( not ( = ?auto_9115 ?auto_9128 ) ) ( not ( = ?auto_9130 ?auto_9128 ) ) ( not ( = ?auto_9129 ?auto_9128 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9116 ?auto_9117 ?auto_9118 )
      ( MAKE-3CRATE-VERIFY ?auto_9115 ?auto_9116 ?auto_9117 ?auto_9118 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9131 - SURFACE
      ?auto_9132 - SURFACE
      ?auto_9133 - SURFACE
      ?auto_9134 - SURFACE
      ?auto_9135 - SURFACE
    )
    :vars
    (
      ?auto_9143 - HOIST
      ?auto_9141 - PLACE
      ?auto_9142 - PLACE
      ?auto_9136 - HOIST
      ?auto_9144 - SURFACE
      ?auto_9139 - SURFACE
      ?auto_9146 - SURFACE
      ?auto_9140 - TRUCK
      ?auto_9137 - PLACE
      ?auto_9138 - HOIST
      ?auto_9145 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9143 ?auto_9141 ) ( IS-CRATE ?auto_9135 ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( not ( = ?auto_9133 ?auto_9135 ) ) ( not ( = ?auto_9142 ?auto_9141 ) ) ( HOIST-AT ?auto_9136 ?auto_9142 ) ( not ( = ?auto_9143 ?auto_9136 ) ) ( SURFACE-AT ?auto_9135 ?auto_9142 ) ( ON ?auto_9135 ?auto_9144 ) ( CLEAR ?auto_9135 ) ( not ( = ?auto_9134 ?auto_9144 ) ) ( not ( = ?auto_9135 ?auto_9144 ) ) ( not ( = ?auto_9133 ?auto_9144 ) ) ( IS-CRATE ?auto_9134 ) ( SURFACE-AT ?auto_9134 ?auto_9142 ) ( ON ?auto_9134 ?auto_9139 ) ( CLEAR ?auto_9134 ) ( not ( = ?auto_9134 ?auto_9139 ) ) ( not ( = ?auto_9135 ?auto_9139 ) ) ( not ( = ?auto_9133 ?auto_9139 ) ) ( not ( = ?auto_9144 ?auto_9139 ) ) ( IS-CRATE ?auto_9133 ) ( not ( = ?auto_9132 ?auto_9133 ) ) ( not ( = ?auto_9134 ?auto_9132 ) ) ( not ( = ?auto_9135 ?auto_9132 ) ) ( not ( = ?auto_9144 ?auto_9132 ) ) ( not ( = ?auto_9139 ?auto_9132 ) ) ( AVAILABLE ?auto_9136 ) ( SURFACE-AT ?auto_9133 ?auto_9142 ) ( ON ?auto_9133 ?auto_9146 ) ( CLEAR ?auto_9133 ) ( not ( = ?auto_9134 ?auto_9146 ) ) ( not ( = ?auto_9135 ?auto_9146 ) ) ( not ( = ?auto_9133 ?auto_9146 ) ) ( not ( = ?auto_9144 ?auto_9146 ) ) ( not ( = ?auto_9139 ?auto_9146 ) ) ( not ( = ?auto_9132 ?auto_9146 ) ) ( SURFACE-AT ?auto_9131 ?auto_9141 ) ( CLEAR ?auto_9131 ) ( IS-CRATE ?auto_9132 ) ( not ( = ?auto_9131 ?auto_9132 ) ) ( not ( = ?auto_9134 ?auto_9131 ) ) ( not ( = ?auto_9135 ?auto_9131 ) ) ( not ( = ?auto_9133 ?auto_9131 ) ) ( not ( = ?auto_9144 ?auto_9131 ) ) ( not ( = ?auto_9139 ?auto_9131 ) ) ( not ( = ?auto_9146 ?auto_9131 ) ) ( AVAILABLE ?auto_9143 ) ( TRUCK-AT ?auto_9140 ?auto_9137 ) ( not ( = ?auto_9137 ?auto_9141 ) ) ( not ( = ?auto_9142 ?auto_9137 ) ) ( HOIST-AT ?auto_9138 ?auto_9137 ) ( not ( = ?auto_9143 ?auto_9138 ) ) ( not ( = ?auto_9136 ?auto_9138 ) ) ( AVAILABLE ?auto_9138 ) ( SURFACE-AT ?auto_9132 ?auto_9137 ) ( ON ?auto_9132 ?auto_9145 ) ( CLEAR ?auto_9132 ) ( not ( = ?auto_9134 ?auto_9145 ) ) ( not ( = ?auto_9135 ?auto_9145 ) ) ( not ( = ?auto_9133 ?auto_9145 ) ) ( not ( = ?auto_9144 ?auto_9145 ) ) ( not ( = ?auto_9139 ?auto_9145 ) ) ( not ( = ?auto_9132 ?auto_9145 ) ) ( not ( = ?auto_9146 ?auto_9145 ) ) ( not ( = ?auto_9131 ?auto_9145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9133 ?auto_9134 ?auto_9135 )
      ( MAKE-4CRATE-VERIFY ?auto_9131 ?auto_9132 ?auto_9133 ?auto_9134 ?auto_9135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9147 - SURFACE
      ?auto_9148 - SURFACE
    )
    :vars
    (
      ?auto_9157 - HOIST
      ?auto_9155 - PLACE
      ?auto_9162 - SURFACE
      ?auto_9156 - PLACE
      ?auto_9149 - HOIST
      ?auto_9158 - SURFACE
      ?auto_9152 - SURFACE
      ?auto_9154 - SURFACE
      ?auto_9161 - SURFACE
      ?auto_9160 - SURFACE
      ?auto_9150 - PLACE
      ?auto_9151 - HOIST
      ?auto_9159 - SURFACE
      ?auto_9153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9157 ?auto_9155 ) ( IS-CRATE ?auto_9148 ) ( not ( = ?auto_9147 ?auto_9148 ) ) ( not ( = ?auto_9162 ?auto_9147 ) ) ( not ( = ?auto_9162 ?auto_9148 ) ) ( not ( = ?auto_9156 ?auto_9155 ) ) ( HOIST-AT ?auto_9149 ?auto_9156 ) ( not ( = ?auto_9157 ?auto_9149 ) ) ( SURFACE-AT ?auto_9148 ?auto_9156 ) ( ON ?auto_9148 ?auto_9158 ) ( CLEAR ?auto_9148 ) ( not ( = ?auto_9147 ?auto_9158 ) ) ( not ( = ?auto_9148 ?auto_9158 ) ) ( not ( = ?auto_9162 ?auto_9158 ) ) ( IS-CRATE ?auto_9147 ) ( SURFACE-AT ?auto_9147 ?auto_9156 ) ( ON ?auto_9147 ?auto_9152 ) ( CLEAR ?auto_9147 ) ( not ( = ?auto_9147 ?auto_9152 ) ) ( not ( = ?auto_9148 ?auto_9152 ) ) ( not ( = ?auto_9162 ?auto_9152 ) ) ( not ( = ?auto_9158 ?auto_9152 ) ) ( IS-CRATE ?auto_9162 ) ( not ( = ?auto_9154 ?auto_9162 ) ) ( not ( = ?auto_9147 ?auto_9154 ) ) ( not ( = ?auto_9148 ?auto_9154 ) ) ( not ( = ?auto_9158 ?auto_9154 ) ) ( not ( = ?auto_9152 ?auto_9154 ) ) ( AVAILABLE ?auto_9149 ) ( SURFACE-AT ?auto_9162 ?auto_9156 ) ( ON ?auto_9162 ?auto_9161 ) ( CLEAR ?auto_9162 ) ( not ( = ?auto_9147 ?auto_9161 ) ) ( not ( = ?auto_9148 ?auto_9161 ) ) ( not ( = ?auto_9162 ?auto_9161 ) ) ( not ( = ?auto_9158 ?auto_9161 ) ) ( not ( = ?auto_9152 ?auto_9161 ) ) ( not ( = ?auto_9154 ?auto_9161 ) ) ( SURFACE-AT ?auto_9160 ?auto_9155 ) ( CLEAR ?auto_9160 ) ( IS-CRATE ?auto_9154 ) ( not ( = ?auto_9160 ?auto_9154 ) ) ( not ( = ?auto_9147 ?auto_9160 ) ) ( not ( = ?auto_9148 ?auto_9160 ) ) ( not ( = ?auto_9162 ?auto_9160 ) ) ( not ( = ?auto_9158 ?auto_9160 ) ) ( not ( = ?auto_9152 ?auto_9160 ) ) ( not ( = ?auto_9161 ?auto_9160 ) ) ( AVAILABLE ?auto_9157 ) ( not ( = ?auto_9150 ?auto_9155 ) ) ( not ( = ?auto_9156 ?auto_9150 ) ) ( HOIST-AT ?auto_9151 ?auto_9150 ) ( not ( = ?auto_9157 ?auto_9151 ) ) ( not ( = ?auto_9149 ?auto_9151 ) ) ( AVAILABLE ?auto_9151 ) ( SURFACE-AT ?auto_9154 ?auto_9150 ) ( ON ?auto_9154 ?auto_9159 ) ( CLEAR ?auto_9154 ) ( not ( = ?auto_9147 ?auto_9159 ) ) ( not ( = ?auto_9148 ?auto_9159 ) ) ( not ( = ?auto_9162 ?auto_9159 ) ) ( not ( = ?auto_9158 ?auto_9159 ) ) ( not ( = ?auto_9152 ?auto_9159 ) ) ( not ( = ?auto_9154 ?auto_9159 ) ) ( not ( = ?auto_9161 ?auto_9159 ) ) ( not ( = ?auto_9160 ?auto_9159 ) ) ( TRUCK-AT ?auto_9153 ?auto_9155 ) )
    :subtasks
    ( ( !DRIVE ?auto_9153 ?auto_9155 ?auto_9150 )
      ( MAKE-2CRATE ?auto_9162 ?auto_9147 ?auto_9148 )
      ( MAKE-1CRATE-VERIFY ?auto_9147 ?auto_9148 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9163 - SURFACE
      ?auto_9164 - SURFACE
      ?auto_9165 - SURFACE
    )
    :vars
    (
      ?auto_9174 - HOIST
      ?auto_9172 - PLACE
      ?auto_9171 - PLACE
      ?auto_9176 - HOIST
      ?auto_9169 - SURFACE
      ?auto_9167 - SURFACE
      ?auto_9168 - SURFACE
      ?auto_9173 - SURFACE
      ?auto_9175 - SURFACE
      ?auto_9166 - PLACE
      ?auto_9170 - HOIST
      ?auto_9178 - SURFACE
      ?auto_9177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9174 ?auto_9172 ) ( IS-CRATE ?auto_9165 ) ( not ( = ?auto_9164 ?auto_9165 ) ) ( not ( = ?auto_9163 ?auto_9164 ) ) ( not ( = ?auto_9163 ?auto_9165 ) ) ( not ( = ?auto_9171 ?auto_9172 ) ) ( HOIST-AT ?auto_9176 ?auto_9171 ) ( not ( = ?auto_9174 ?auto_9176 ) ) ( SURFACE-AT ?auto_9165 ?auto_9171 ) ( ON ?auto_9165 ?auto_9169 ) ( CLEAR ?auto_9165 ) ( not ( = ?auto_9164 ?auto_9169 ) ) ( not ( = ?auto_9165 ?auto_9169 ) ) ( not ( = ?auto_9163 ?auto_9169 ) ) ( IS-CRATE ?auto_9164 ) ( SURFACE-AT ?auto_9164 ?auto_9171 ) ( ON ?auto_9164 ?auto_9167 ) ( CLEAR ?auto_9164 ) ( not ( = ?auto_9164 ?auto_9167 ) ) ( not ( = ?auto_9165 ?auto_9167 ) ) ( not ( = ?auto_9163 ?auto_9167 ) ) ( not ( = ?auto_9169 ?auto_9167 ) ) ( IS-CRATE ?auto_9163 ) ( not ( = ?auto_9168 ?auto_9163 ) ) ( not ( = ?auto_9164 ?auto_9168 ) ) ( not ( = ?auto_9165 ?auto_9168 ) ) ( not ( = ?auto_9169 ?auto_9168 ) ) ( not ( = ?auto_9167 ?auto_9168 ) ) ( AVAILABLE ?auto_9176 ) ( SURFACE-AT ?auto_9163 ?auto_9171 ) ( ON ?auto_9163 ?auto_9173 ) ( CLEAR ?auto_9163 ) ( not ( = ?auto_9164 ?auto_9173 ) ) ( not ( = ?auto_9165 ?auto_9173 ) ) ( not ( = ?auto_9163 ?auto_9173 ) ) ( not ( = ?auto_9169 ?auto_9173 ) ) ( not ( = ?auto_9167 ?auto_9173 ) ) ( not ( = ?auto_9168 ?auto_9173 ) ) ( SURFACE-AT ?auto_9175 ?auto_9172 ) ( CLEAR ?auto_9175 ) ( IS-CRATE ?auto_9168 ) ( not ( = ?auto_9175 ?auto_9168 ) ) ( not ( = ?auto_9164 ?auto_9175 ) ) ( not ( = ?auto_9165 ?auto_9175 ) ) ( not ( = ?auto_9163 ?auto_9175 ) ) ( not ( = ?auto_9169 ?auto_9175 ) ) ( not ( = ?auto_9167 ?auto_9175 ) ) ( not ( = ?auto_9173 ?auto_9175 ) ) ( AVAILABLE ?auto_9174 ) ( not ( = ?auto_9166 ?auto_9172 ) ) ( not ( = ?auto_9171 ?auto_9166 ) ) ( HOIST-AT ?auto_9170 ?auto_9166 ) ( not ( = ?auto_9174 ?auto_9170 ) ) ( not ( = ?auto_9176 ?auto_9170 ) ) ( AVAILABLE ?auto_9170 ) ( SURFACE-AT ?auto_9168 ?auto_9166 ) ( ON ?auto_9168 ?auto_9178 ) ( CLEAR ?auto_9168 ) ( not ( = ?auto_9164 ?auto_9178 ) ) ( not ( = ?auto_9165 ?auto_9178 ) ) ( not ( = ?auto_9163 ?auto_9178 ) ) ( not ( = ?auto_9169 ?auto_9178 ) ) ( not ( = ?auto_9167 ?auto_9178 ) ) ( not ( = ?auto_9168 ?auto_9178 ) ) ( not ( = ?auto_9173 ?auto_9178 ) ) ( not ( = ?auto_9175 ?auto_9178 ) ) ( TRUCK-AT ?auto_9177 ?auto_9172 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9164 ?auto_9165 )
      ( MAKE-2CRATE-VERIFY ?auto_9163 ?auto_9164 ?auto_9165 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9179 - SURFACE
      ?auto_9180 - SURFACE
      ?auto_9181 - SURFACE
      ?auto_9182 - SURFACE
    )
    :vars
    (
      ?auto_9189 - HOIST
      ?auto_9194 - PLACE
      ?auto_9184 - PLACE
      ?auto_9183 - HOIST
      ?auto_9188 - SURFACE
      ?auto_9192 - SURFACE
      ?auto_9193 - SURFACE
      ?auto_9185 - SURFACE
      ?auto_9187 - PLACE
      ?auto_9190 - HOIST
      ?auto_9186 - SURFACE
      ?auto_9191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9189 ?auto_9194 ) ( IS-CRATE ?auto_9182 ) ( not ( = ?auto_9181 ?auto_9182 ) ) ( not ( = ?auto_9180 ?auto_9181 ) ) ( not ( = ?auto_9180 ?auto_9182 ) ) ( not ( = ?auto_9184 ?auto_9194 ) ) ( HOIST-AT ?auto_9183 ?auto_9184 ) ( not ( = ?auto_9189 ?auto_9183 ) ) ( SURFACE-AT ?auto_9182 ?auto_9184 ) ( ON ?auto_9182 ?auto_9188 ) ( CLEAR ?auto_9182 ) ( not ( = ?auto_9181 ?auto_9188 ) ) ( not ( = ?auto_9182 ?auto_9188 ) ) ( not ( = ?auto_9180 ?auto_9188 ) ) ( IS-CRATE ?auto_9181 ) ( SURFACE-AT ?auto_9181 ?auto_9184 ) ( ON ?auto_9181 ?auto_9192 ) ( CLEAR ?auto_9181 ) ( not ( = ?auto_9181 ?auto_9192 ) ) ( not ( = ?auto_9182 ?auto_9192 ) ) ( not ( = ?auto_9180 ?auto_9192 ) ) ( not ( = ?auto_9188 ?auto_9192 ) ) ( IS-CRATE ?auto_9180 ) ( not ( = ?auto_9179 ?auto_9180 ) ) ( not ( = ?auto_9181 ?auto_9179 ) ) ( not ( = ?auto_9182 ?auto_9179 ) ) ( not ( = ?auto_9188 ?auto_9179 ) ) ( not ( = ?auto_9192 ?auto_9179 ) ) ( AVAILABLE ?auto_9183 ) ( SURFACE-AT ?auto_9180 ?auto_9184 ) ( ON ?auto_9180 ?auto_9193 ) ( CLEAR ?auto_9180 ) ( not ( = ?auto_9181 ?auto_9193 ) ) ( not ( = ?auto_9182 ?auto_9193 ) ) ( not ( = ?auto_9180 ?auto_9193 ) ) ( not ( = ?auto_9188 ?auto_9193 ) ) ( not ( = ?auto_9192 ?auto_9193 ) ) ( not ( = ?auto_9179 ?auto_9193 ) ) ( SURFACE-AT ?auto_9185 ?auto_9194 ) ( CLEAR ?auto_9185 ) ( IS-CRATE ?auto_9179 ) ( not ( = ?auto_9185 ?auto_9179 ) ) ( not ( = ?auto_9181 ?auto_9185 ) ) ( not ( = ?auto_9182 ?auto_9185 ) ) ( not ( = ?auto_9180 ?auto_9185 ) ) ( not ( = ?auto_9188 ?auto_9185 ) ) ( not ( = ?auto_9192 ?auto_9185 ) ) ( not ( = ?auto_9193 ?auto_9185 ) ) ( AVAILABLE ?auto_9189 ) ( not ( = ?auto_9187 ?auto_9194 ) ) ( not ( = ?auto_9184 ?auto_9187 ) ) ( HOIST-AT ?auto_9190 ?auto_9187 ) ( not ( = ?auto_9189 ?auto_9190 ) ) ( not ( = ?auto_9183 ?auto_9190 ) ) ( AVAILABLE ?auto_9190 ) ( SURFACE-AT ?auto_9179 ?auto_9187 ) ( ON ?auto_9179 ?auto_9186 ) ( CLEAR ?auto_9179 ) ( not ( = ?auto_9181 ?auto_9186 ) ) ( not ( = ?auto_9182 ?auto_9186 ) ) ( not ( = ?auto_9180 ?auto_9186 ) ) ( not ( = ?auto_9188 ?auto_9186 ) ) ( not ( = ?auto_9192 ?auto_9186 ) ) ( not ( = ?auto_9179 ?auto_9186 ) ) ( not ( = ?auto_9193 ?auto_9186 ) ) ( not ( = ?auto_9185 ?auto_9186 ) ) ( TRUCK-AT ?auto_9191 ?auto_9194 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9180 ?auto_9181 ?auto_9182 )
      ( MAKE-3CRATE-VERIFY ?auto_9179 ?auto_9180 ?auto_9181 ?auto_9182 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9195 - SURFACE
      ?auto_9196 - SURFACE
      ?auto_9197 - SURFACE
      ?auto_9198 - SURFACE
      ?auto_9199 - SURFACE
    )
    :vars
    (
      ?auto_9205 - HOIST
      ?auto_9210 - PLACE
      ?auto_9201 - PLACE
      ?auto_9200 - HOIST
      ?auto_9204 - SURFACE
      ?auto_9208 - SURFACE
      ?auto_9209 - SURFACE
      ?auto_9203 - PLACE
      ?auto_9206 - HOIST
      ?auto_9202 - SURFACE
      ?auto_9207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9205 ?auto_9210 ) ( IS-CRATE ?auto_9199 ) ( not ( = ?auto_9198 ?auto_9199 ) ) ( not ( = ?auto_9197 ?auto_9198 ) ) ( not ( = ?auto_9197 ?auto_9199 ) ) ( not ( = ?auto_9201 ?auto_9210 ) ) ( HOIST-AT ?auto_9200 ?auto_9201 ) ( not ( = ?auto_9205 ?auto_9200 ) ) ( SURFACE-AT ?auto_9199 ?auto_9201 ) ( ON ?auto_9199 ?auto_9204 ) ( CLEAR ?auto_9199 ) ( not ( = ?auto_9198 ?auto_9204 ) ) ( not ( = ?auto_9199 ?auto_9204 ) ) ( not ( = ?auto_9197 ?auto_9204 ) ) ( IS-CRATE ?auto_9198 ) ( SURFACE-AT ?auto_9198 ?auto_9201 ) ( ON ?auto_9198 ?auto_9208 ) ( CLEAR ?auto_9198 ) ( not ( = ?auto_9198 ?auto_9208 ) ) ( not ( = ?auto_9199 ?auto_9208 ) ) ( not ( = ?auto_9197 ?auto_9208 ) ) ( not ( = ?auto_9204 ?auto_9208 ) ) ( IS-CRATE ?auto_9197 ) ( not ( = ?auto_9196 ?auto_9197 ) ) ( not ( = ?auto_9198 ?auto_9196 ) ) ( not ( = ?auto_9199 ?auto_9196 ) ) ( not ( = ?auto_9204 ?auto_9196 ) ) ( not ( = ?auto_9208 ?auto_9196 ) ) ( AVAILABLE ?auto_9200 ) ( SURFACE-AT ?auto_9197 ?auto_9201 ) ( ON ?auto_9197 ?auto_9209 ) ( CLEAR ?auto_9197 ) ( not ( = ?auto_9198 ?auto_9209 ) ) ( not ( = ?auto_9199 ?auto_9209 ) ) ( not ( = ?auto_9197 ?auto_9209 ) ) ( not ( = ?auto_9204 ?auto_9209 ) ) ( not ( = ?auto_9208 ?auto_9209 ) ) ( not ( = ?auto_9196 ?auto_9209 ) ) ( SURFACE-AT ?auto_9195 ?auto_9210 ) ( CLEAR ?auto_9195 ) ( IS-CRATE ?auto_9196 ) ( not ( = ?auto_9195 ?auto_9196 ) ) ( not ( = ?auto_9198 ?auto_9195 ) ) ( not ( = ?auto_9199 ?auto_9195 ) ) ( not ( = ?auto_9197 ?auto_9195 ) ) ( not ( = ?auto_9204 ?auto_9195 ) ) ( not ( = ?auto_9208 ?auto_9195 ) ) ( not ( = ?auto_9209 ?auto_9195 ) ) ( AVAILABLE ?auto_9205 ) ( not ( = ?auto_9203 ?auto_9210 ) ) ( not ( = ?auto_9201 ?auto_9203 ) ) ( HOIST-AT ?auto_9206 ?auto_9203 ) ( not ( = ?auto_9205 ?auto_9206 ) ) ( not ( = ?auto_9200 ?auto_9206 ) ) ( AVAILABLE ?auto_9206 ) ( SURFACE-AT ?auto_9196 ?auto_9203 ) ( ON ?auto_9196 ?auto_9202 ) ( CLEAR ?auto_9196 ) ( not ( = ?auto_9198 ?auto_9202 ) ) ( not ( = ?auto_9199 ?auto_9202 ) ) ( not ( = ?auto_9197 ?auto_9202 ) ) ( not ( = ?auto_9204 ?auto_9202 ) ) ( not ( = ?auto_9208 ?auto_9202 ) ) ( not ( = ?auto_9196 ?auto_9202 ) ) ( not ( = ?auto_9209 ?auto_9202 ) ) ( not ( = ?auto_9195 ?auto_9202 ) ) ( TRUCK-AT ?auto_9207 ?auto_9210 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9197 ?auto_9198 ?auto_9199 )
      ( MAKE-4CRATE-VERIFY ?auto_9195 ?auto_9196 ?auto_9197 ?auto_9198 ?auto_9199 ) )
  )

)

