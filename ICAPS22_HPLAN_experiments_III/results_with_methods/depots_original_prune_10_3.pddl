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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347375 - SURFACE
      ?auto_347376 - SURFACE
    )
    :vars
    (
      ?auto_347377 - HOIST
      ?auto_347378 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347377 ?auto_347378 ) ( SURFACE-AT ?auto_347375 ?auto_347378 ) ( CLEAR ?auto_347375 ) ( LIFTING ?auto_347377 ?auto_347376 ) ( IS-CRATE ?auto_347376 ) ( not ( = ?auto_347375 ?auto_347376 ) ) )
    :subtasks
    ( ( !DROP ?auto_347377 ?auto_347376 ?auto_347375 ?auto_347378 )
      ( MAKE-1CRATE-VERIFY ?auto_347375 ?auto_347376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347379 - SURFACE
      ?auto_347380 - SURFACE
    )
    :vars
    (
      ?auto_347382 - HOIST
      ?auto_347381 - PLACE
      ?auto_347383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347382 ?auto_347381 ) ( SURFACE-AT ?auto_347379 ?auto_347381 ) ( CLEAR ?auto_347379 ) ( IS-CRATE ?auto_347380 ) ( not ( = ?auto_347379 ?auto_347380 ) ) ( TRUCK-AT ?auto_347383 ?auto_347381 ) ( AVAILABLE ?auto_347382 ) ( IN ?auto_347380 ?auto_347383 ) )
    :subtasks
    ( ( !UNLOAD ?auto_347382 ?auto_347380 ?auto_347383 ?auto_347381 )
      ( MAKE-1CRATE ?auto_347379 ?auto_347380 )
      ( MAKE-1CRATE-VERIFY ?auto_347379 ?auto_347380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347384 - SURFACE
      ?auto_347385 - SURFACE
    )
    :vars
    (
      ?auto_347387 - HOIST
      ?auto_347388 - PLACE
      ?auto_347386 - TRUCK
      ?auto_347389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347387 ?auto_347388 ) ( SURFACE-AT ?auto_347384 ?auto_347388 ) ( CLEAR ?auto_347384 ) ( IS-CRATE ?auto_347385 ) ( not ( = ?auto_347384 ?auto_347385 ) ) ( AVAILABLE ?auto_347387 ) ( IN ?auto_347385 ?auto_347386 ) ( TRUCK-AT ?auto_347386 ?auto_347389 ) ( not ( = ?auto_347389 ?auto_347388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_347386 ?auto_347389 ?auto_347388 )
      ( MAKE-1CRATE ?auto_347384 ?auto_347385 )
      ( MAKE-1CRATE-VERIFY ?auto_347384 ?auto_347385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347390 - SURFACE
      ?auto_347391 - SURFACE
    )
    :vars
    (
      ?auto_347392 - HOIST
      ?auto_347393 - PLACE
      ?auto_347394 - TRUCK
      ?auto_347395 - PLACE
      ?auto_347396 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347392 ?auto_347393 ) ( SURFACE-AT ?auto_347390 ?auto_347393 ) ( CLEAR ?auto_347390 ) ( IS-CRATE ?auto_347391 ) ( not ( = ?auto_347390 ?auto_347391 ) ) ( AVAILABLE ?auto_347392 ) ( TRUCK-AT ?auto_347394 ?auto_347395 ) ( not ( = ?auto_347395 ?auto_347393 ) ) ( HOIST-AT ?auto_347396 ?auto_347395 ) ( LIFTING ?auto_347396 ?auto_347391 ) ( not ( = ?auto_347392 ?auto_347396 ) ) )
    :subtasks
    ( ( !LOAD ?auto_347396 ?auto_347391 ?auto_347394 ?auto_347395 )
      ( MAKE-1CRATE ?auto_347390 ?auto_347391 )
      ( MAKE-1CRATE-VERIFY ?auto_347390 ?auto_347391 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347397 - SURFACE
      ?auto_347398 - SURFACE
    )
    :vars
    (
      ?auto_347399 - HOIST
      ?auto_347402 - PLACE
      ?auto_347400 - TRUCK
      ?auto_347401 - PLACE
      ?auto_347403 - HOIST
      ?auto_347404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347399 ?auto_347402 ) ( SURFACE-AT ?auto_347397 ?auto_347402 ) ( CLEAR ?auto_347397 ) ( IS-CRATE ?auto_347398 ) ( not ( = ?auto_347397 ?auto_347398 ) ) ( AVAILABLE ?auto_347399 ) ( TRUCK-AT ?auto_347400 ?auto_347401 ) ( not ( = ?auto_347401 ?auto_347402 ) ) ( HOIST-AT ?auto_347403 ?auto_347401 ) ( not ( = ?auto_347399 ?auto_347403 ) ) ( AVAILABLE ?auto_347403 ) ( SURFACE-AT ?auto_347398 ?auto_347401 ) ( ON ?auto_347398 ?auto_347404 ) ( CLEAR ?auto_347398 ) ( not ( = ?auto_347397 ?auto_347404 ) ) ( not ( = ?auto_347398 ?auto_347404 ) ) )
    :subtasks
    ( ( !LIFT ?auto_347403 ?auto_347398 ?auto_347404 ?auto_347401 )
      ( MAKE-1CRATE ?auto_347397 ?auto_347398 )
      ( MAKE-1CRATE-VERIFY ?auto_347397 ?auto_347398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347405 - SURFACE
      ?auto_347406 - SURFACE
    )
    :vars
    (
      ?auto_347410 - HOIST
      ?auto_347407 - PLACE
      ?auto_347412 - PLACE
      ?auto_347409 - HOIST
      ?auto_347408 - SURFACE
      ?auto_347411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347410 ?auto_347407 ) ( SURFACE-AT ?auto_347405 ?auto_347407 ) ( CLEAR ?auto_347405 ) ( IS-CRATE ?auto_347406 ) ( not ( = ?auto_347405 ?auto_347406 ) ) ( AVAILABLE ?auto_347410 ) ( not ( = ?auto_347412 ?auto_347407 ) ) ( HOIST-AT ?auto_347409 ?auto_347412 ) ( not ( = ?auto_347410 ?auto_347409 ) ) ( AVAILABLE ?auto_347409 ) ( SURFACE-AT ?auto_347406 ?auto_347412 ) ( ON ?auto_347406 ?auto_347408 ) ( CLEAR ?auto_347406 ) ( not ( = ?auto_347405 ?auto_347408 ) ) ( not ( = ?auto_347406 ?auto_347408 ) ) ( TRUCK-AT ?auto_347411 ?auto_347407 ) )
    :subtasks
    ( ( !DRIVE ?auto_347411 ?auto_347407 ?auto_347412 )
      ( MAKE-1CRATE ?auto_347405 ?auto_347406 )
      ( MAKE-1CRATE-VERIFY ?auto_347405 ?auto_347406 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347422 - SURFACE
      ?auto_347423 - SURFACE
      ?auto_347424 - SURFACE
    )
    :vars
    (
      ?auto_347426 - HOIST
      ?auto_347425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347426 ?auto_347425 ) ( SURFACE-AT ?auto_347423 ?auto_347425 ) ( CLEAR ?auto_347423 ) ( LIFTING ?auto_347426 ?auto_347424 ) ( IS-CRATE ?auto_347424 ) ( not ( = ?auto_347423 ?auto_347424 ) ) ( ON ?auto_347423 ?auto_347422 ) ( not ( = ?auto_347422 ?auto_347423 ) ) ( not ( = ?auto_347422 ?auto_347424 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347423 ?auto_347424 )
      ( MAKE-2CRATE-VERIFY ?auto_347422 ?auto_347423 ?auto_347424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347432 - SURFACE
      ?auto_347433 - SURFACE
      ?auto_347434 - SURFACE
    )
    :vars
    (
      ?auto_347437 - HOIST
      ?auto_347435 - PLACE
      ?auto_347436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347437 ?auto_347435 ) ( SURFACE-AT ?auto_347433 ?auto_347435 ) ( CLEAR ?auto_347433 ) ( IS-CRATE ?auto_347434 ) ( not ( = ?auto_347433 ?auto_347434 ) ) ( TRUCK-AT ?auto_347436 ?auto_347435 ) ( AVAILABLE ?auto_347437 ) ( IN ?auto_347434 ?auto_347436 ) ( ON ?auto_347433 ?auto_347432 ) ( not ( = ?auto_347432 ?auto_347433 ) ) ( not ( = ?auto_347432 ?auto_347434 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347433 ?auto_347434 )
      ( MAKE-2CRATE-VERIFY ?auto_347432 ?auto_347433 ?auto_347434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347438 - SURFACE
      ?auto_347439 - SURFACE
    )
    :vars
    (
      ?auto_347441 - HOIST
      ?auto_347442 - PLACE
      ?auto_347443 - TRUCK
      ?auto_347440 - SURFACE
      ?auto_347444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347441 ?auto_347442 ) ( SURFACE-AT ?auto_347438 ?auto_347442 ) ( CLEAR ?auto_347438 ) ( IS-CRATE ?auto_347439 ) ( not ( = ?auto_347438 ?auto_347439 ) ) ( AVAILABLE ?auto_347441 ) ( IN ?auto_347439 ?auto_347443 ) ( ON ?auto_347438 ?auto_347440 ) ( not ( = ?auto_347440 ?auto_347438 ) ) ( not ( = ?auto_347440 ?auto_347439 ) ) ( TRUCK-AT ?auto_347443 ?auto_347444 ) ( not ( = ?auto_347444 ?auto_347442 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_347443 ?auto_347444 ?auto_347442 )
      ( MAKE-2CRATE ?auto_347440 ?auto_347438 ?auto_347439 )
      ( MAKE-1CRATE-VERIFY ?auto_347438 ?auto_347439 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347445 - SURFACE
      ?auto_347446 - SURFACE
      ?auto_347447 - SURFACE
    )
    :vars
    (
      ?auto_347450 - HOIST
      ?auto_347449 - PLACE
      ?auto_347448 - TRUCK
      ?auto_347451 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347450 ?auto_347449 ) ( SURFACE-AT ?auto_347446 ?auto_347449 ) ( CLEAR ?auto_347446 ) ( IS-CRATE ?auto_347447 ) ( not ( = ?auto_347446 ?auto_347447 ) ) ( AVAILABLE ?auto_347450 ) ( IN ?auto_347447 ?auto_347448 ) ( ON ?auto_347446 ?auto_347445 ) ( not ( = ?auto_347445 ?auto_347446 ) ) ( not ( = ?auto_347445 ?auto_347447 ) ) ( TRUCK-AT ?auto_347448 ?auto_347451 ) ( not ( = ?auto_347451 ?auto_347449 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347446 ?auto_347447 )
      ( MAKE-2CRATE-VERIFY ?auto_347445 ?auto_347446 ?auto_347447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347452 - SURFACE
      ?auto_347453 - SURFACE
    )
    :vars
    (
      ?auto_347455 - HOIST
      ?auto_347457 - PLACE
      ?auto_347454 - SURFACE
      ?auto_347456 - TRUCK
      ?auto_347458 - PLACE
      ?auto_347459 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347455 ?auto_347457 ) ( SURFACE-AT ?auto_347452 ?auto_347457 ) ( CLEAR ?auto_347452 ) ( IS-CRATE ?auto_347453 ) ( not ( = ?auto_347452 ?auto_347453 ) ) ( AVAILABLE ?auto_347455 ) ( ON ?auto_347452 ?auto_347454 ) ( not ( = ?auto_347454 ?auto_347452 ) ) ( not ( = ?auto_347454 ?auto_347453 ) ) ( TRUCK-AT ?auto_347456 ?auto_347458 ) ( not ( = ?auto_347458 ?auto_347457 ) ) ( HOIST-AT ?auto_347459 ?auto_347458 ) ( LIFTING ?auto_347459 ?auto_347453 ) ( not ( = ?auto_347455 ?auto_347459 ) ) )
    :subtasks
    ( ( !LOAD ?auto_347459 ?auto_347453 ?auto_347456 ?auto_347458 )
      ( MAKE-2CRATE ?auto_347454 ?auto_347452 ?auto_347453 )
      ( MAKE-1CRATE-VERIFY ?auto_347452 ?auto_347453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347460 - SURFACE
      ?auto_347461 - SURFACE
      ?auto_347462 - SURFACE
    )
    :vars
    (
      ?auto_347467 - HOIST
      ?auto_347465 - PLACE
      ?auto_347464 - TRUCK
      ?auto_347463 - PLACE
      ?auto_347466 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347467 ?auto_347465 ) ( SURFACE-AT ?auto_347461 ?auto_347465 ) ( CLEAR ?auto_347461 ) ( IS-CRATE ?auto_347462 ) ( not ( = ?auto_347461 ?auto_347462 ) ) ( AVAILABLE ?auto_347467 ) ( ON ?auto_347461 ?auto_347460 ) ( not ( = ?auto_347460 ?auto_347461 ) ) ( not ( = ?auto_347460 ?auto_347462 ) ) ( TRUCK-AT ?auto_347464 ?auto_347463 ) ( not ( = ?auto_347463 ?auto_347465 ) ) ( HOIST-AT ?auto_347466 ?auto_347463 ) ( LIFTING ?auto_347466 ?auto_347462 ) ( not ( = ?auto_347467 ?auto_347466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347461 ?auto_347462 )
      ( MAKE-2CRATE-VERIFY ?auto_347460 ?auto_347461 ?auto_347462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347468 - SURFACE
      ?auto_347469 - SURFACE
    )
    :vars
    (
      ?auto_347474 - HOIST
      ?auto_347475 - PLACE
      ?auto_347470 - SURFACE
      ?auto_347471 - TRUCK
      ?auto_347473 - PLACE
      ?auto_347472 - HOIST
      ?auto_347476 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347474 ?auto_347475 ) ( SURFACE-AT ?auto_347468 ?auto_347475 ) ( CLEAR ?auto_347468 ) ( IS-CRATE ?auto_347469 ) ( not ( = ?auto_347468 ?auto_347469 ) ) ( AVAILABLE ?auto_347474 ) ( ON ?auto_347468 ?auto_347470 ) ( not ( = ?auto_347470 ?auto_347468 ) ) ( not ( = ?auto_347470 ?auto_347469 ) ) ( TRUCK-AT ?auto_347471 ?auto_347473 ) ( not ( = ?auto_347473 ?auto_347475 ) ) ( HOIST-AT ?auto_347472 ?auto_347473 ) ( not ( = ?auto_347474 ?auto_347472 ) ) ( AVAILABLE ?auto_347472 ) ( SURFACE-AT ?auto_347469 ?auto_347473 ) ( ON ?auto_347469 ?auto_347476 ) ( CLEAR ?auto_347469 ) ( not ( = ?auto_347468 ?auto_347476 ) ) ( not ( = ?auto_347469 ?auto_347476 ) ) ( not ( = ?auto_347470 ?auto_347476 ) ) )
    :subtasks
    ( ( !LIFT ?auto_347472 ?auto_347469 ?auto_347476 ?auto_347473 )
      ( MAKE-2CRATE ?auto_347470 ?auto_347468 ?auto_347469 )
      ( MAKE-1CRATE-VERIFY ?auto_347468 ?auto_347469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347477 - SURFACE
      ?auto_347478 - SURFACE
      ?auto_347479 - SURFACE
    )
    :vars
    (
      ?auto_347480 - HOIST
      ?auto_347482 - PLACE
      ?auto_347484 - TRUCK
      ?auto_347483 - PLACE
      ?auto_347485 - HOIST
      ?auto_347481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347480 ?auto_347482 ) ( SURFACE-AT ?auto_347478 ?auto_347482 ) ( CLEAR ?auto_347478 ) ( IS-CRATE ?auto_347479 ) ( not ( = ?auto_347478 ?auto_347479 ) ) ( AVAILABLE ?auto_347480 ) ( ON ?auto_347478 ?auto_347477 ) ( not ( = ?auto_347477 ?auto_347478 ) ) ( not ( = ?auto_347477 ?auto_347479 ) ) ( TRUCK-AT ?auto_347484 ?auto_347483 ) ( not ( = ?auto_347483 ?auto_347482 ) ) ( HOIST-AT ?auto_347485 ?auto_347483 ) ( not ( = ?auto_347480 ?auto_347485 ) ) ( AVAILABLE ?auto_347485 ) ( SURFACE-AT ?auto_347479 ?auto_347483 ) ( ON ?auto_347479 ?auto_347481 ) ( CLEAR ?auto_347479 ) ( not ( = ?auto_347478 ?auto_347481 ) ) ( not ( = ?auto_347479 ?auto_347481 ) ) ( not ( = ?auto_347477 ?auto_347481 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347478 ?auto_347479 )
      ( MAKE-2CRATE-VERIFY ?auto_347477 ?auto_347478 ?auto_347479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347486 - SURFACE
      ?auto_347487 - SURFACE
    )
    :vars
    (
      ?auto_347490 - HOIST
      ?auto_347494 - PLACE
      ?auto_347493 - SURFACE
      ?auto_347491 - PLACE
      ?auto_347492 - HOIST
      ?auto_347489 - SURFACE
      ?auto_347488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347490 ?auto_347494 ) ( SURFACE-AT ?auto_347486 ?auto_347494 ) ( CLEAR ?auto_347486 ) ( IS-CRATE ?auto_347487 ) ( not ( = ?auto_347486 ?auto_347487 ) ) ( AVAILABLE ?auto_347490 ) ( ON ?auto_347486 ?auto_347493 ) ( not ( = ?auto_347493 ?auto_347486 ) ) ( not ( = ?auto_347493 ?auto_347487 ) ) ( not ( = ?auto_347491 ?auto_347494 ) ) ( HOIST-AT ?auto_347492 ?auto_347491 ) ( not ( = ?auto_347490 ?auto_347492 ) ) ( AVAILABLE ?auto_347492 ) ( SURFACE-AT ?auto_347487 ?auto_347491 ) ( ON ?auto_347487 ?auto_347489 ) ( CLEAR ?auto_347487 ) ( not ( = ?auto_347486 ?auto_347489 ) ) ( not ( = ?auto_347487 ?auto_347489 ) ) ( not ( = ?auto_347493 ?auto_347489 ) ) ( TRUCK-AT ?auto_347488 ?auto_347494 ) )
    :subtasks
    ( ( !DRIVE ?auto_347488 ?auto_347494 ?auto_347491 )
      ( MAKE-2CRATE ?auto_347493 ?auto_347486 ?auto_347487 )
      ( MAKE-1CRATE-VERIFY ?auto_347486 ?auto_347487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347495 - SURFACE
      ?auto_347496 - SURFACE
      ?auto_347497 - SURFACE
    )
    :vars
    (
      ?auto_347501 - HOIST
      ?auto_347502 - PLACE
      ?auto_347498 - PLACE
      ?auto_347499 - HOIST
      ?auto_347503 - SURFACE
      ?auto_347500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347501 ?auto_347502 ) ( SURFACE-AT ?auto_347496 ?auto_347502 ) ( CLEAR ?auto_347496 ) ( IS-CRATE ?auto_347497 ) ( not ( = ?auto_347496 ?auto_347497 ) ) ( AVAILABLE ?auto_347501 ) ( ON ?auto_347496 ?auto_347495 ) ( not ( = ?auto_347495 ?auto_347496 ) ) ( not ( = ?auto_347495 ?auto_347497 ) ) ( not ( = ?auto_347498 ?auto_347502 ) ) ( HOIST-AT ?auto_347499 ?auto_347498 ) ( not ( = ?auto_347501 ?auto_347499 ) ) ( AVAILABLE ?auto_347499 ) ( SURFACE-AT ?auto_347497 ?auto_347498 ) ( ON ?auto_347497 ?auto_347503 ) ( CLEAR ?auto_347497 ) ( not ( = ?auto_347496 ?auto_347503 ) ) ( not ( = ?auto_347497 ?auto_347503 ) ) ( not ( = ?auto_347495 ?auto_347503 ) ) ( TRUCK-AT ?auto_347500 ?auto_347502 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347496 ?auto_347497 )
      ( MAKE-2CRATE-VERIFY ?auto_347495 ?auto_347496 ?auto_347497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347504 - SURFACE
      ?auto_347505 - SURFACE
    )
    :vars
    (
      ?auto_347507 - HOIST
      ?auto_347511 - PLACE
      ?auto_347509 - SURFACE
      ?auto_347510 - PLACE
      ?auto_347512 - HOIST
      ?auto_347506 - SURFACE
      ?auto_347508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347507 ?auto_347511 ) ( IS-CRATE ?auto_347505 ) ( not ( = ?auto_347504 ?auto_347505 ) ) ( not ( = ?auto_347509 ?auto_347504 ) ) ( not ( = ?auto_347509 ?auto_347505 ) ) ( not ( = ?auto_347510 ?auto_347511 ) ) ( HOIST-AT ?auto_347512 ?auto_347510 ) ( not ( = ?auto_347507 ?auto_347512 ) ) ( AVAILABLE ?auto_347512 ) ( SURFACE-AT ?auto_347505 ?auto_347510 ) ( ON ?auto_347505 ?auto_347506 ) ( CLEAR ?auto_347505 ) ( not ( = ?auto_347504 ?auto_347506 ) ) ( not ( = ?auto_347505 ?auto_347506 ) ) ( not ( = ?auto_347509 ?auto_347506 ) ) ( TRUCK-AT ?auto_347508 ?auto_347511 ) ( SURFACE-AT ?auto_347509 ?auto_347511 ) ( CLEAR ?auto_347509 ) ( LIFTING ?auto_347507 ?auto_347504 ) ( IS-CRATE ?auto_347504 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347509 ?auto_347504 )
      ( MAKE-2CRATE ?auto_347509 ?auto_347504 ?auto_347505 )
      ( MAKE-1CRATE-VERIFY ?auto_347504 ?auto_347505 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347513 - SURFACE
      ?auto_347514 - SURFACE
      ?auto_347515 - SURFACE
    )
    :vars
    (
      ?auto_347519 - HOIST
      ?auto_347518 - PLACE
      ?auto_347521 - PLACE
      ?auto_347517 - HOIST
      ?auto_347520 - SURFACE
      ?auto_347516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347519 ?auto_347518 ) ( IS-CRATE ?auto_347515 ) ( not ( = ?auto_347514 ?auto_347515 ) ) ( not ( = ?auto_347513 ?auto_347514 ) ) ( not ( = ?auto_347513 ?auto_347515 ) ) ( not ( = ?auto_347521 ?auto_347518 ) ) ( HOIST-AT ?auto_347517 ?auto_347521 ) ( not ( = ?auto_347519 ?auto_347517 ) ) ( AVAILABLE ?auto_347517 ) ( SURFACE-AT ?auto_347515 ?auto_347521 ) ( ON ?auto_347515 ?auto_347520 ) ( CLEAR ?auto_347515 ) ( not ( = ?auto_347514 ?auto_347520 ) ) ( not ( = ?auto_347515 ?auto_347520 ) ) ( not ( = ?auto_347513 ?auto_347520 ) ) ( TRUCK-AT ?auto_347516 ?auto_347518 ) ( SURFACE-AT ?auto_347513 ?auto_347518 ) ( CLEAR ?auto_347513 ) ( LIFTING ?auto_347519 ?auto_347514 ) ( IS-CRATE ?auto_347514 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347514 ?auto_347515 )
      ( MAKE-2CRATE-VERIFY ?auto_347513 ?auto_347514 ?auto_347515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347522 - SURFACE
      ?auto_347523 - SURFACE
    )
    :vars
    (
      ?auto_347528 - HOIST
      ?auto_347524 - PLACE
      ?auto_347527 - SURFACE
      ?auto_347525 - PLACE
      ?auto_347530 - HOIST
      ?auto_347526 - SURFACE
      ?auto_347529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347528 ?auto_347524 ) ( IS-CRATE ?auto_347523 ) ( not ( = ?auto_347522 ?auto_347523 ) ) ( not ( = ?auto_347527 ?auto_347522 ) ) ( not ( = ?auto_347527 ?auto_347523 ) ) ( not ( = ?auto_347525 ?auto_347524 ) ) ( HOIST-AT ?auto_347530 ?auto_347525 ) ( not ( = ?auto_347528 ?auto_347530 ) ) ( AVAILABLE ?auto_347530 ) ( SURFACE-AT ?auto_347523 ?auto_347525 ) ( ON ?auto_347523 ?auto_347526 ) ( CLEAR ?auto_347523 ) ( not ( = ?auto_347522 ?auto_347526 ) ) ( not ( = ?auto_347523 ?auto_347526 ) ) ( not ( = ?auto_347527 ?auto_347526 ) ) ( TRUCK-AT ?auto_347529 ?auto_347524 ) ( SURFACE-AT ?auto_347527 ?auto_347524 ) ( CLEAR ?auto_347527 ) ( IS-CRATE ?auto_347522 ) ( AVAILABLE ?auto_347528 ) ( IN ?auto_347522 ?auto_347529 ) )
    :subtasks
    ( ( !UNLOAD ?auto_347528 ?auto_347522 ?auto_347529 ?auto_347524 )
      ( MAKE-2CRATE ?auto_347527 ?auto_347522 ?auto_347523 )
      ( MAKE-1CRATE-VERIFY ?auto_347522 ?auto_347523 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_347531 - SURFACE
      ?auto_347532 - SURFACE
      ?auto_347533 - SURFACE
    )
    :vars
    (
      ?auto_347534 - HOIST
      ?auto_347535 - PLACE
      ?auto_347539 - PLACE
      ?auto_347538 - HOIST
      ?auto_347537 - SURFACE
      ?auto_347536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347534 ?auto_347535 ) ( IS-CRATE ?auto_347533 ) ( not ( = ?auto_347532 ?auto_347533 ) ) ( not ( = ?auto_347531 ?auto_347532 ) ) ( not ( = ?auto_347531 ?auto_347533 ) ) ( not ( = ?auto_347539 ?auto_347535 ) ) ( HOIST-AT ?auto_347538 ?auto_347539 ) ( not ( = ?auto_347534 ?auto_347538 ) ) ( AVAILABLE ?auto_347538 ) ( SURFACE-AT ?auto_347533 ?auto_347539 ) ( ON ?auto_347533 ?auto_347537 ) ( CLEAR ?auto_347533 ) ( not ( = ?auto_347532 ?auto_347537 ) ) ( not ( = ?auto_347533 ?auto_347537 ) ) ( not ( = ?auto_347531 ?auto_347537 ) ) ( TRUCK-AT ?auto_347536 ?auto_347535 ) ( SURFACE-AT ?auto_347531 ?auto_347535 ) ( CLEAR ?auto_347531 ) ( IS-CRATE ?auto_347532 ) ( AVAILABLE ?auto_347534 ) ( IN ?auto_347532 ?auto_347536 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347532 ?auto_347533 )
      ( MAKE-2CRATE-VERIFY ?auto_347531 ?auto_347532 ?auto_347533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347576 - SURFACE
      ?auto_347577 - SURFACE
    )
    :vars
    (
      ?auto_347582 - HOIST
      ?auto_347583 - PLACE
      ?auto_347580 - SURFACE
      ?auto_347579 - PLACE
      ?auto_347578 - HOIST
      ?auto_347584 - SURFACE
      ?auto_347581 - TRUCK
      ?auto_347585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347582 ?auto_347583 ) ( SURFACE-AT ?auto_347576 ?auto_347583 ) ( CLEAR ?auto_347576 ) ( IS-CRATE ?auto_347577 ) ( not ( = ?auto_347576 ?auto_347577 ) ) ( AVAILABLE ?auto_347582 ) ( ON ?auto_347576 ?auto_347580 ) ( not ( = ?auto_347580 ?auto_347576 ) ) ( not ( = ?auto_347580 ?auto_347577 ) ) ( not ( = ?auto_347579 ?auto_347583 ) ) ( HOIST-AT ?auto_347578 ?auto_347579 ) ( not ( = ?auto_347582 ?auto_347578 ) ) ( AVAILABLE ?auto_347578 ) ( SURFACE-AT ?auto_347577 ?auto_347579 ) ( ON ?auto_347577 ?auto_347584 ) ( CLEAR ?auto_347577 ) ( not ( = ?auto_347576 ?auto_347584 ) ) ( not ( = ?auto_347577 ?auto_347584 ) ) ( not ( = ?auto_347580 ?auto_347584 ) ) ( TRUCK-AT ?auto_347581 ?auto_347585 ) ( not ( = ?auto_347585 ?auto_347583 ) ) ( not ( = ?auto_347579 ?auto_347585 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_347581 ?auto_347585 ?auto_347583 )
      ( MAKE-1CRATE ?auto_347576 ?auto_347577 )
      ( MAKE-1CRATE-VERIFY ?auto_347576 ?auto_347577 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347615 - SURFACE
      ?auto_347616 - SURFACE
      ?auto_347617 - SURFACE
      ?auto_347618 - SURFACE
    )
    :vars
    (
      ?auto_347620 - HOIST
      ?auto_347619 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347620 ?auto_347619 ) ( SURFACE-AT ?auto_347617 ?auto_347619 ) ( CLEAR ?auto_347617 ) ( LIFTING ?auto_347620 ?auto_347618 ) ( IS-CRATE ?auto_347618 ) ( not ( = ?auto_347617 ?auto_347618 ) ) ( ON ?auto_347616 ?auto_347615 ) ( ON ?auto_347617 ?auto_347616 ) ( not ( = ?auto_347615 ?auto_347616 ) ) ( not ( = ?auto_347615 ?auto_347617 ) ) ( not ( = ?auto_347615 ?auto_347618 ) ) ( not ( = ?auto_347616 ?auto_347617 ) ) ( not ( = ?auto_347616 ?auto_347618 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_347617 ?auto_347618 )
      ( MAKE-3CRATE-VERIFY ?auto_347615 ?auto_347616 ?auto_347617 ?auto_347618 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347632 - SURFACE
      ?auto_347633 - SURFACE
      ?auto_347634 - SURFACE
      ?auto_347635 - SURFACE
    )
    :vars
    (
      ?auto_347637 - HOIST
      ?auto_347638 - PLACE
      ?auto_347636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347637 ?auto_347638 ) ( SURFACE-AT ?auto_347634 ?auto_347638 ) ( CLEAR ?auto_347634 ) ( IS-CRATE ?auto_347635 ) ( not ( = ?auto_347634 ?auto_347635 ) ) ( TRUCK-AT ?auto_347636 ?auto_347638 ) ( AVAILABLE ?auto_347637 ) ( IN ?auto_347635 ?auto_347636 ) ( ON ?auto_347634 ?auto_347633 ) ( not ( = ?auto_347633 ?auto_347634 ) ) ( not ( = ?auto_347633 ?auto_347635 ) ) ( ON ?auto_347633 ?auto_347632 ) ( not ( = ?auto_347632 ?auto_347633 ) ) ( not ( = ?auto_347632 ?auto_347634 ) ) ( not ( = ?auto_347632 ?auto_347635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_347633 ?auto_347634 ?auto_347635 )
      ( MAKE-3CRATE-VERIFY ?auto_347632 ?auto_347633 ?auto_347634 ?auto_347635 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347653 - SURFACE
      ?auto_347654 - SURFACE
      ?auto_347655 - SURFACE
      ?auto_347656 - SURFACE
    )
    :vars
    (
      ?auto_347659 - HOIST
      ?auto_347657 - PLACE
      ?auto_347658 - TRUCK
      ?auto_347660 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347659 ?auto_347657 ) ( SURFACE-AT ?auto_347655 ?auto_347657 ) ( CLEAR ?auto_347655 ) ( IS-CRATE ?auto_347656 ) ( not ( = ?auto_347655 ?auto_347656 ) ) ( AVAILABLE ?auto_347659 ) ( IN ?auto_347656 ?auto_347658 ) ( ON ?auto_347655 ?auto_347654 ) ( not ( = ?auto_347654 ?auto_347655 ) ) ( not ( = ?auto_347654 ?auto_347656 ) ) ( TRUCK-AT ?auto_347658 ?auto_347660 ) ( not ( = ?auto_347660 ?auto_347657 ) ) ( ON ?auto_347654 ?auto_347653 ) ( not ( = ?auto_347653 ?auto_347654 ) ) ( not ( = ?auto_347653 ?auto_347655 ) ) ( not ( = ?auto_347653 ?auto_347656 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_347654 ?auto_347655 ?auto_347656 )
      ( MAKE-3CRATE-VERIFY ?auto_347653 ?auto_347654 ?auto_347655 ?auto_347656 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347677 - SURFACE
      ?auto_347678 - SURFACE
      ?auto_347679 - SURFACE
      ?auto_347680 - SURFACE
    )
    :vars
    (
      ?auto_347682 - HOIST
      ?auto_347681 - PLACE
      ?auto_347683 - TRUCK
      ?auto_347684 - PLACE
      ?auto_347685 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_347682 ?auto_347681 ) ( SURFACE-AT ?auto_347679 ?auto_347681 ) ( CLEAR ?auto_347679 ) ( IS-CRATE ?auto_347680 ) ( not ( = ?auto_347679 ?auto_347680 ) ) ( AVAILABLE ?auto_347682 ) ( ON ?auto_347679 ?auto_347678 ) ( not ( = ?auto_347678 ?auto_347679 ) ) ( not ( = ?auto_347678 ?auto_347680 ) ) ( TRUCK-AT ?auto_347683 ?auto_347684 ) ( not ( = ?auto_347684 ?auto_347681 ) ) ( HOIST-AT ?auto_347685 ?auto_347684 ) ( LIFTING ?auto_347685 ?auto_347680 ) ( not ( = ?auto_347682 ?auto_347685 ) ) ( ON ?auto_347678 ?auto_347677 ) ( not ( = ?auto_347677 ?auto_347678 ) ) ( not ( = ?auto_347677 ?auto_347679 ) ) ( not ( = ?auto_347677 ?auto_347680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_347678 ?auto_347679 ?auto_347680 )
      ( MAKE-3CRATE-VERIFY ?auto_347677 ?auto_347678 ?auto_347679 ?auto_347680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347704 - SURFACE
      ?auto_347705 - SURFACE
      ?auto_347706 - SURFACE
      ?auto_347707 - SURFACE
    )
    :vars
    (
      ?auto_347710 - HOIST
      ?auto_347708 - PLACE
      ?auto_347712 - TRUCK
      ?auto_347713 - PLACE
      ?auto_347709 - HOIST
      ?auto_347711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347710 ?auto_347708 ) ( SURFACE-AT ?auto_347706 ?auto_347708 ) ( CLEAR ?auto_347706 ) ( IS-CRATE ?auto_347707 ) ( not ( = ?auto_347706 ?auto_347707 ) ) ( AVAILABLE ?auto_347710 ) ( ON ?auto_347706 ?auto_347705 ) ( not ( = ?auto_347705 ?auto_347706 ) ) ( not ( = ?auto_347705 ?auto_347707 ) ) ( TRUCK-AT ?auto_347712 ?auto_347713 ) ( not ( = ?auto_347713 ?auto_347708 ) ) ( HOIST-AT ?auto_347709 ?auto_347713 ) ( not ( = ?auto_347710 ?auto_347709 ) ) ( AVAILABLE ?auto_347709 ) ( SURFACE-AT ?auto_347707 ?auto_347713 ) ( ON ?auto_347707 ?auto_347711 ) ( CLEAR ?auto_347707 ) ( not ( = ?auto_347706 ?auto_347711 ) ) ( not ( = ?auto_347707 ?auto_347711 ) ) ( not ( = ?auto_347705 ?auto_347711 ) ) ( ON ?auto_347705 ?auto_347704 ) ( not ( = ?auto_347704 ?auto_347705 ) ) ( not ( = ?auto_347704 ?auto_347706 ) ) ( not ( = ?auto_347704 ?auto_347707 ) ) ( not ( = ?auto_347704 ?auto_347711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_347705 ?auto_347706 ?auto_347707 )
      ( MAKE-3CRATE-VERIFY ?auto_347704 ?auto_347705 ?auto_347706 ?auto_347707 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347732 - SURFACE
      ?auto_347733 - SURFACE
      ?auto_347734 - SURFACE
      ?auto_347735 - SURFACE
    )
    :vars
    (
      ?auto_347741 - HOIST
      ?auto_347738 - PLACE
      ?auto_347740 - PLACE
      ?auto_347736 - HOIST
      ?auto_347737 - SURFACE
      ?auto_347739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347741 ?auto_347738 ) ( SURFACE-AT ?auto_347734 ?auto_347738 ) ( CLEAR ?auto_347734 ) ( IS-CRATE ?auto_347735 ) ( not ( = ?auto_347734 ?auto_347735 ) ) ( AVAILABLE ?auto_347741 ) ( ON ?auto_347734 ?auto_347733 ) ( not ( = ?auto_347733 ?auto_347734 ) ) ( not ( = ?auto_347733 ?auto_347735 ) ) ( not ( = ?auto_347740 ?auto_347738 ) ) ( HOIST-AT ?auto_347736 ?auto_347740 ) ( not ( = ?auto_347741 ?auto_347736 ) ) ( AVAILABLE ?auto_347736 ) ( SURFACE-AT ?auto_347735 ?auto_347740 ) ( ON ?auto_347735 ?auto_347737 ) ( CLEAR ?auto_347735 ) ( not ( = ?auto_347734 ?auto_347737 ) ) ( not ( = ?auto_347735 ?auto_347737 ) ) ( not ( = ?auto_347733 ?auto_347737 ) ) ( TRUCK-AT ?auto_347739 ?auto_347738 ) ( ON ?auto_347733 ?auto_347732 ) ( not ( = ?auto_347732 ?auto_347733 ) ) ( not ( = ?auto_347732 ?auto_347734 ) ) ( not ( = ?auto_347732 ?auto_347735 ) ) ( not ( = ?auto_347732 ?auto_347737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_347733 ?auto_347734 ?auto_347735 )
      ( MAKE-3CRATE-VERIFY ?auto_347732 ?auto_347733 ?auto_347734 ?auto_347735 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347760 - SURFACE
      ?auto_347761 - SURFACE
      ?auto_347762 - SURFACE
      ?auto_347763 - SURFACE
    )
    :vars
    (
      ?auto_347768 - HOIST
      ?auto_347769 - PLACE
      ?auto_347765 - PLACE
      ?auto_347766 - HOIST
      ?auto_347764 - SURFACE
      ?auto_347767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347768 ?auto_347769 ) ( IS-CRATE ?auto_347763 ) ( not ( = ?auto_347762 ?auto_347763 ) ) ( not ( = ?auto_347761 ?auto_347762 ) ) ( not ( = ?auto_347761 ?auto_347763 ) ) ( not ( = ?auto_347765 ?auto_347769 ) ) ( HOIST-AT ?auto_347766 ?auto_347765 ) ( not ( = ?auto_347768 ?auto_347766 ) ) ( AVAILABLE ?auto_347766 ) ( SURFACE-AT ?auto_347763 ?auto_347765 ) ( ON ?auto_347763 ?auto_347764 ) ( CLEAR ?auto_347763 ) ( not ( = ?auto_347762 ?auto_347764 ) ) ( not ( = ?auto_347763 ?auto_347764 ) ) ( not ( = ?auto_347761 ?auto_347764 ) ) ( TRUCK-AT ?auto_347767 ?auto_347769 ) ( SURFACE-AT ?auto_347761 ?auto_347769 ) ( CLEAR ?auto_347761 ) ( LIFTING ?auto_347768 ?auto_347762 ) ( IS-CRATE ?auto_347762 ) ( ON ?auto_347761 ?auto_347760 ) ( not ( = ?auto_347760 ?auto_347761 ) ) ( not ( = ?auto_347760 ?auto_347762 ) ) ( not ( = ?auto_347760 ?auto_347763 ) ) ( not ( = ?auto_347760 ?auto_347764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_347761 ?auto_347762 ?auto_347763 )
      ( MAKE-3CRATE-VERIFY ?auto_347760 ?auto_347761 ?auto_347762 ?auto_347763 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_347788 - SURFACE
      ?auto_347789 - SURFACE
      ?auto_347790 - SURFACE
      ?auto_347791 - SURFACE
    )
    :vars
    (
      ?auto_347794 - HOIST
      ?auto_347796 - PLACE
      ?auto_347793 - PLACE
      ?auto_347795 - HOIST
      ?auto_347797 - SURFACE
      ?auto_347792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_347794 ?auto_347796 ) ( IS-CRATE ?auto_347791 ) ( not ( = ?auto_347790 ?auto_347791 ) ) ( not ( = ?auto_347789 ?auto_347790 ) ) ( not ( = ?auto_347789 ?auto_347791 ) ) ( not ( = ?auto_347793 ?auto_347796 ) ) ( HOIST-AT ?auto_347795 ?auto_347793 ) ( not ( = ?auto_347794 ?auto_347795 ) ) ( AVAILABLE ?auto_347795 ) ( SURFACE-AT ?auto_347791 ?auto_347793 ) ( ON ?auto_347791 ?auto_347797 ) ( CLEAR ?auto_347791 ) ( not ( = ?auto_347790 ?auto_347797 ) ) ( not ( = ?auto_347791 ?auto_347797 ) ) ( not ( = ?auto_347789 ?auto_347797 ) ) ( TRUCK-AT ?auto_347792 ?auto_347796 ) ( SURFACE-AT ?auto_347789 ?auto_347796 ) ( CLEAR ?auto_347789 ) ( IS-CRATE ?auto_347790 ) ( AVAILABLE ?auto_347794 ) ( IN ?auto_347790 ?auto_347792 ) ( ON ?auto_347789 ?auto_347788 ) ( not ( = ?auto_347788 ?auto_347789 ) ) ( not ( = ?auto_347788 ?auto_347790 ) ) ( not ( = ?auto_347788 ?auto_347791 ) ) ( not ( = ?auto_347788 ?auto_347797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_347789 ?auto_347790 ?auto_347791 )
      ( MAKE-3CRATE-VERIFY ?auto_347788 ?auto_347789 ?auto_347790 ?auto_347791 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_347973 - SURFACE
      ?auto_347974 - SURFACE
    )
    :vars
    (
      ?auto_347976 - HOIST
      ?auto_347980 - PLACE
      ?auto_347979 - SURFACE
      ?auto_347977 - TRUCK
      ?auto_347981 - PLACE
      ?auto_347975 - HOIST
      ?auto_347978 - SURFACE
      ?auto_347982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347976 ?auto_347980 ) ( SURFACE-AT ?auto_347973 ?auto_347980 ) ( CLEAR ?auto_347973 ) ( IS-CRATE ?auto_347974 ) ( not ( = ?auto_347973 ?auto_347974 ) ) ( AVAILABLE ?auto_347976 ) ( ON ?auto_347973 ?auto_347979 ) ( not ( = ?auto_347979 ?auto_347973 ) ) ( not ( = ?auto_347979 ?auto_347974 ) ) ( TRUCK-AT ?auto_347977 ?auto_347981 ) ( not ( = ?auto_347981 ?auto_347980 ) ) ( HOIST-AT ?auto_347975 ?auto_347981 ) ( not ( = ?auto_347976 ?auto_347975 ) ) ( SURFACE-AT ?auto_347974 ?auto_347981 ) ( ON ?auto_347974 ?auto_347978 ) ( CLEAR ?auto_347974 ) ( not ( = ?auto_347973 ?auto_347978 ) ) ( not ( = ?auto_347974 ?auto_347978 ) ) ( not ( = ?auto_347979 ?auto_347978 ) ) ( LIFTING ?auto_347975 ?auto_347982 ) ( IS-CRATE ?auto_347982 ) ( not ( = ?auto_347973 ?auto_347982 ) ) ( not ( = ?auto_347974 ?auto_347982 ) ) ( not ( = ?auto_347979 ?auto_347982 ) ) ( not ( = ?auto_347978 ?auto_347982 ) ) )
    :subtasks
    ( ( !LOAD ?auto_347975 ?auto_347982 ?auto_347977 ?auto_347981 )
      ( MAKE-1CRATE ?auto_347973 ?auto_347974 )
      ( MAKE-1CRATE-VERIFY ?auto_347973 ?auto_347974 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348081 - SURFACE
      ?auto_348082 - SURFACE
      ?auto_348083 - SURFACE
      ?auto_348085 - SURFACE
      ?auto_348084 - SURFACE
    )
    :vars
    (
      ?auto_348087 - HOIST
      ?auto_348086 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348087 ?auto_348086 ) ( SURFACE-AT ?auto_348085 ?auto_348086 ) ( CLEAR ?auto_348085 ) ( LIFTING ?auto_348087 ?auto_348084 ) ( IS-CRATE ?auto_348084 ) ( not ( = ?auto_348085 ?auto_348084 ) ) ( ON ?auto_348082 ?auto_348081 ) ( ON ?auto_348083 ?auto_348082 ) ( ON ?auto_348085 ?auto_348083 ) ( not ( = ?auto_348081 ?auto_348082 ) ) ( not ( = ?auto_348081 ?auto_348083 ) ) ( not ( = ?auto_348081 ?auto_348085 ) ) ( not ( = ?auto_348081 ?auto_348084 ) ) ( not ( = ?auto_348082 ?auto_348083 ) ) ( not ( = ?auto_348082 ?auto_348085 ) ) ( not ( = ?auto_348082 ?auto_348084 ) ) ( not ( = ?auto_348083 ?auto_348085 ) ) ( not ( = ?auto_348083 ?auto_348084 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348085 ?auto_348084 )
      ( MAKE-4CRATE-VERIFY ?auto_348081 ?auto_348082 ?auto_348083 ?auto_348085 ?auto_348084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348106 - SURFACE
      ?auto_348107 - SURFACE
      ?auto_348108 - SURFACE
      ?auto_348110 - SURFACE
      ?auto_348109 - SURFACE
    )
    :vars
    (
      ?auto_348113 - HOIST
      ?auto_348112 - PLACE
      ?auto_348111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348113 ?auto_348112 ) ( SURFACE-AT ?auto_348110 ?auto_348112 ) ( CLEAR ?auto_348110 ) ( IS-CRATE ?auto_348109 ) ( not ( = ?auto_348110 ?auto_348109 ) ) ( TRUCK-AT ?auto_348111 ?auto_348112 ) ( AVAILABLE ?auto_348113 ) ( IN ?auto_348109 ?auto_348111 ) ( ON ?auto_348110 ?auto_348108 ) ( not ( = ?auto_348108 ?auto_348110 ) ) ( not ( = ?auto_348108 ?auto_348109 ) ) ( ON ?auto_348107 ?auto_348106 ) ( ON ?auto_348108 ?auto_348107 ) ( not ( = ?auto_348106 ?auto_348107 ) ) ( not ( = ?auto_348106 ?auto_348108 ) ) ( not ( = ?auto_348106 ?auto_348110 ) ) ( not ( = ?auto_348106 ?auto_348109 ) ) ( not ( = ?auto_348107 ?auto_348108 ) ) ( not ( = ?auto_348107 ?auto_348110 ) ) ( not ( = ?auto_348107 ?auto_348109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348108 ?auto_348110 ?auto_348109 )
      ( MAKE-4CRATE-VERIFY ?auto_348106 ?auto_348107 ?auto_348108 ?auto_348110 ?auto_348109 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348136 - SURFACE
      ?auto_348137 - SURFACE
      ?auto_348138 - SURFACE
      ?auto_348140 - SURFACE
      ?auto_348139 - SURFACE
    )
    :vars
    (
      ?auto_348144 - HOIST
      ?auto_348141 - PLACE
      ?auto_348143 - TRUCK
      ?auto_348142 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348144 ?auto_348141 ) ( SURFACE-AT ?auto_348140 ?auto_348141 ) ( CLEAR ?auto_348140 ) ( IS-CRATE ?auto_348139 ) ( not ( = ?auto_348140 ?auto_348139 ) ) ( AVAILABLE ?auto_348144 ) ( IN ?auto_348139 ?auto_348143 ) ( ON ?auto_348140 ?auto_348138 ) ( not ( = ?auto_348138 ?auto_348140 ) ) ( not ( = ?auto_348138 ?auto_348139 ) ) ( TRUCK-AT ?auto_348143 ?auto_348142 ) ( not ( = ?auto_348142 ?auto_348141 ) ) ( ON ?auto_348137 ?auto_348136 ) ( ON ?auto_348138 ?auto_348137 ) ( not ( = ?auto_348136 ?auto_348137 ) ) ( not ( = ?auto_348136 ?auto_348138 ) ) ( not ( = ?auto_348136 ?auto_348140 ) ) ( not ( = ?auto_348136 ?auto_348139 ) ) ( not ( = ?auto_348137 ?auto_348138 ) ) ( not ( = ?auto_348137 ?auto_348140 ) ) ( not ( = ?auto_348137 ?auto_348139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348138 ?auto_348140 ?auto_348139 )
      ( MAKE-4CRATE-VERIFY ?auto_348136 ?auto_348137 ?auto_348138 ?auto_348140 ?auto_348139 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348170 - SURFACE
      ?auto_348171 - SURFACE
      ?auto_348172 - SURFACE
      ?auto_348174 - SURFACE
      ?auto_348173 - SURFACE
    )
    :vars
    (
      ?auto_348175 - HOIST
      ?auto_348176 - PLACE
      ?auto_348177 - TRUCK
      ?auto_348178 - PLACE
      ?auto_348179 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_348175 ?auto_348176 ) ( SURFACE-AT ?auto_348174 ?auto_348176 ) ( CLEAR ?auto_348174 ) ( IS-CRATE ?auto_348173 ) ( not ( = ?auto_348174 ?auto_348173 ) ) ( AVAILABLE ?auto_348175 ) ( ON ?auto_348174 ?auto_348172 ) ( not ( = ?auto_348172 ?auto_348174 ) ) ( not ( = ?auto_348172 ?auto_348173 ) ) ( TRUCK-AT ?auto_348177 ?auto_348178 ) ( not ( = ?auto_348178 ?auto_348176 ) ) ( HOIST-AT ?auto_348179 ?auto_348178 ) ( LIFTING ?auto_348179 ?auto_348173 ) ( not ( = ?auto_348175 ?auto_348179 ) ) ( ON ?auto_348171 ?auto_348170 ) ( ON ?auto_348172 ?auto_348171 ) ( not ( = ?auto_348170 ?auto_348171 ) ) ( not ( = ?auto_348170 ?auto_348172 ) ) ( not ( = ?auto_348170 ?auto_348174 ) ) ( not ( = ?auto_348170 ?auto_348173 ) ) ( not ( = ?auto_348171 ?auto_348172 ) ) ( not ( = ?auto_348171 ?auto_348174 ) ) ( not ( = ?auto_348171 ?auto_348173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348172 ?auto_348174 ?auto_348173 )
      ( MAKE-4CRATE-VERIFY ?auto_348170 ?auto_348171 ?auto_348172 ?auto_348174 ?auto_348173 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348208 - SURFACE
      ?auto_348209 - SURFACE
      ?auto_348210 - SURFACE
      ?auto_348212 - SURFACE
      ?auto_348211 - SURFACE
    )
    :vars
    (
      ?auto_348218 - HOIST
      ?auto_348217 - PLACE
      ?auto_348213 - TRUCK
      ?auto_348215 - PLACE
      ?auto_348216 - HOIST
      ?auto_348214 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348218 ?auto_348217 ) ( SURFACE-AT ?auto_348212 ?auto_348217 ) ( CLEAR ?auto_348212 ) ( IS-CRATE ?auto_348211 ) ( not ( = ?auto_348212 ?auto_348211 ) ) ( AVAILABLE ?auto_348218 ) ( ON ?auto_348212 ?auto_348210 ) ( not ( = ?auto_348210 ?auto_348212 ) ) ( not ( = ?auto_348210 ?auto_348211 ) ) ( TRUCK-AT ?auto_348213 ?auto_348215 ) ( not ( = ?auto_348215 ?auto_348217 ) ) ( HOIST-AT ?auto_348216 ?auto_348215 ) ( not ( = ?auto_348218 ?auto_348216 ) ) ( AVAILABLE ?auto_348216 ) ( SURFACE-AT ?auto_348211 ?auto_348215 ) ( ON ?auto_348211 ?auto_348214 ) ( CLEAR ?auto_348211 ) ( not ( = ?auto_348212 ?auto_348214 ) ) ( not ( = ?auto_348211 ?auto_348214 ) ) ( not ( = ?auto_348210 ?auto_348214 ) ) ( ON ?auto_348209 ?auto_348208 ) ( ON ?auto_348210 ?auto_348209 ) ( not ( = ?auto_348208 ?auto_348209 ) ) ( not ( = ?auto_348208 ?auto_348210 ) ) ( not ( = ?auto_348208 ?auto_348212 ) ) ( not ( = ?auto_348208 ?auto_348211 ) ) ( not ( = ?auto_348208 ?auto_348214 ) ) ( not ( = ?auto_348209 ?auto_348210 ) ) ( not ( = ?auto_348209 ?auto_348212 ) ) ( not ( = ?auto_348209 ?auto_348211 ) ) ( not ( = ?auto_348209 ?auto_348214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348210 ?auto_348212 ?auto_348211 )
      ( MAKE-4CRATE-VERIFY ?auto_348208 ?auto_348209 ?auto_348210 ?auto_348212 ?auto_348211 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348247 - SURFACE
      ?auto_348248 - SURFACE
      ?auto_348249 - SURFACE
      ?auto_348251 - SURFACE
      ?auto_348250 - SURFACE
    )
    :vars
    (
      ?auto_348255 - HOIST
      ?auto_348256 - PLACE
      ?auto_348254 - PLACE
      ?auto_348252 - HOIST
      ?auto_348253 - SURFACE
      ?auto_348257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348255 ?auto_348256 ) ( SURFACE-AT ?auto_348251 ?auto_348256 ) ( CLEAR ?auto_348251 ) ( IS-CRATE ?auto_348250 ) ( not ( = ?auto_348251 ?auto_348250 ) ) ( AVAILABLE ?auto_348255 ) ( ON ?auto_348251 ?auto_348249 ) ( not ( = ?auto_348249 ?auto_348251 ) ) ( not ( = ?auto_348249 ?auto_348250 ) ) ( not ( = ?auto_348254 ?auto_348256 ) ) ( HOIST-AT ?auto_348252 ?auto_348254 ) ( not ( = ?auto_348255 ?auto_348252 ) ) ( AVAILABLE ?auto_348252 ) ( SURFACE-AT ?auto_348250 ?auto_348254 ) ( ON ?auto_348250 ?auto_348253 ) ( CLEAR ?auto_348250 ) ( not ( = ?auto_348251 ?auto_348253 ) ) ( not ( = ?auto_348250 ?auto_348253 ) ) ( not ( = ?auto_348249 ?auto_348253 ) ) ( TRUCK-AT ?auto_348257 ?auto_348256 ) ( ON ?auto_348248 ?auto_348247 ) ( ON ?auto_348249 ?auto_348248 ) ( not ( = ?auto_348247 ?auto_348248 ) ) ( not ( = ?auto_348247 ?auto_348249 ) ) ( not ( = ?auto_348247 ?auto_348251 ) ) ( not ( = ?auto_348247 ?auto_348250 ) ) ( not ( = ?auto_348247 ?auto_348253 ) ) ( not ( = ?auto_348248 ?auto_348249 ) ) ( not ( = ?auto_348248 ?auto_348251 ) ) ( not ( = ?auto_348248 ?auto_348250 ) ) ( not ( = ?auto_348248 ?auto_348253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348249 ?auto_348251 ?auto_348250 )
      ( MAKE-4CRATE-VERIFY ?auto_348247 ?auto_348248 ?auto_348249 ?auto_348251 ?auto_348250 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348286 - SURFACE
      ?auto_348287 - SURFACE
      ?auto_348288 - SURFACE
      ?auto_348290 - SURFACE
      ?auto_348289 - SURFACE
    )
    :vars
    (
      ?auto_348292 - HOIST
      ?auto_348295 - PLACE
      ?auto_348291 - PLACE
      ?auto_348296 - HOIST
      ?auto_348293 - SURFACE
      ?auto_348294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348292 ?auto_348295 ) ( IS-CRATE ?auto_348289 ) ( not ( = ?auto_348290 ?auto_348289 ) ) ( not ( = ?auto_348288 ?auto_348290 ) ) ( not ( = ?auto_348288 ?auto_348289 ) ) ( not ( = ?auto_348291 ?auto_348295 ) ) ( HOIST-AT ?auto_348296 ?auto_348291 ) ( not ( = ?auto_348292 ?auto_348296 ) ) ( AVAILABLE ?auto_348296 ) ( SURFACE-AT ?auto_348289 ?auto_348291 ) ( ON ?auto_348289 ?auto_348293 ) ( CLEAR ?auto_348289 ) ( not ( = ?auto_348290 ?auto_348293 ) ) ( not ( = ?auto_348289 ?auto_348293 ) ) ( not ( = ?auto_348288 ?auto_348293 ) ) ( TRUCK-AT ?auto_348294 ?auto_348295 ) ( SURFACE-AT ?auto_348288 ?auto_348295 ) ( CLEAR ?auto_348288 ) ( LIFTING ?auto_348292 ?auto_348290 ) ( IS-CRATE ?auto_348290 ) ( ON ?auto_348287 ?auto_348286 ) ( ON ?auto_348288 ?auto_348287 ) ( not ( = ?auto_348286 ?auto_348287 ) ) ( not ( = ?auto_348286 ?auto_348288 ) ) ( not ( = ?auto_348286 ?auto_348290 ) ) ( not ( = ?auto_348286 ?auto_348289 ) ) ( not ( = ?auto_348286 ?auto_348293 ) ) ( not ( = ?auto_348287 ?auto_348288 ) ) ( not ( = ?auto_348287 ?auto_348290 ) ) ( not ( = ?auto_348287 ?auto_348289 ) ) ( not ( = ?auto_348287 ?auto_348293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348288 ?auto_348290 ?auto_348289 )
      ( MAKE-4CRATE-VERIFY ?auto_348286 ?auto_348287 ?auto_348288 ?auto_348290 ?auto_348289 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_348325 - SURFACE
      ?auto_348326 - SURFACE
      ?auto_348327 - SURFACE
      ?auto_348329 - SURFACE
      ?auto_348328 - SURFACE
    )
    :vars
    (
      ?auto_348334 - HOIST
      ?auto_348333 - PLACE
      ?auto_348330 - PLACE
      ?auto_348331 - HOIST
      ?auto_348332 - SURFACE
      ?auto_348335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_348334 ?auto_348333 ) ( IS-CRATE ?auto_348328 ) ( not ( = ?auto_348329 ?auto_348328 ) ) ( not ( = ?auto_348327 ?auto_348329 ) ) ( not ( = ?auto_348327 ?auto_348328 ) ) ( not ( = ?auto_348330 ?auto_348333 ) ) ( HOIST-AT ?auto_348331 ?auto_348330 ) ( not ( = ?auto_348334 ?auto_348331 ) ) ( AVAILABLE ?auto_348331 ) ( SURFACE-AT ?auto_348328 ?auto_348330 ) ( ON ?auto_348328 ?auto_348332 ) ( CLEAR ?auto_348328 ) ( not ( = ?auto_348329 ?auto_348332 ) ) ( not ( = ?auto_348328 ?auto_348332 ) ) ( not ( = ?auto_348327 ?auto_348332 ) ) ( TRUCK-AT ?auto_348335 ?auto_348333 ) ( SURFACE-AT ?auto_348327 ?auto_348333 ) ( CLEAR ?auto_348327 ) ( IS-CRATE ?auto_348329 ) ( AVAILABLE ?auto_348334 ) ( IN ?auto_348329 ?auto_348335 ) ( ON ?auto_348326 ?auto_348325 ) ( ON ?auto_348327 ?auto_348326 ) ( not ( = ?auto_348325 ?auto_348326 ) ) ( not ( = ?auto_348325 ?auto_348327 ) ) ( not ( = ?auto_348325 ?auto_348329 ) ) ( not ( = ?auto_348325 ?auto_348328 ) ) ( not ( = ?auto_348325 ?auto_348332 ) ) ( not ( = ?auto_348326 ?auto_348327 ) ) ( not ( = ?auto_348326 ?auto_348329 ) ) ( not ( = ?auto_348326 ?auto_348328 ) ) ( not ( = ?auto_348326 ?auto_348332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_348327 ?auto_348329 ?auto_348328 )
      ( MAKE-4CRATE-VERIFY ?auto_348325 ?auto_348326 ?auto_348327 ?auto_348329 ?auto_348328 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_348826 - SURFACE
      ?auto_348827 - SURFACE
    )
    :vars
    (
      ?auto_348829 - HOIST
      ?auto_348834 - PLACE
      ?auto_348828 - SURFACE
      ?auto_348831 - PLACE
      ?auto_348832 - HOIST
      ?auto_348833 - SURFACE
      ?auto_348830 - TRUCK
      ?auto_348835 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348829 ?auto_348834 ) ( SURFACE-AT ?auto_348826 ?auto_348834 ) ( CLEAR ?auto_348826 ) ( IS-CRATE ?auto_348827 ) ( not ( = ?auto_348826 ?auto_348827 ) ) ( ON ?auto_348826 ?auto_348828 ) ( not ( = ?auto_348828 ?auto_348826 ) ) ( not ( = ?auto_348828 ?auto_348827 ) ) ( not ( = ?auto_348831 ?auto_348834 ) ) ( HOIST-AT ?auto_348832 ?auto_348831 ) ( not ( = ?auto_348829 ?auto_348832 ) ) ( AVAILABLE ?auto_348832 ) ( SURFACE-AT ?auto_348827 ?auto_348831 ) ( ON ?auto_348827 ?auto_348833 ) ( CLEAR ?auto_348827 ) ( not ( = ?auto_348826 ?auto_348833 ) ) ( not ( = ?auto_348827 ?auto_348833 ) ) ( not ( = ?auto_348828 ?auto_348833 ) ) ( TRUCK-AT ?auto_348830 ?auto_348834 ) ( LIFTING ?auto_348829 ?auto_348835 ) ( IS-CRATE ?auto_348835 ) ( not ( = ?auto_348826 ?auto_348835 ) ) ( not ( = ?auto_348827 ?auto_348835 ) ) ( not ( = ?auto_348828 ?auto_348835 ) ) ( not ( = ?auto_348833 ?auto_348835 ) ) )
    :subtasks
    ( ( !LOAD ?auto_348829 ?auto_348835 ?auto_348830 ?auto_348834 )
      ( MAKE-1CRATE ?auto_348826 ?auto_348827 )
      ( MAKE-1CRATE-VERIFY ?auto_348826 ?auto_348827 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_348985 - SURFACE
      ?auto_348986 - SURFACE
      ?auto_348987 - SURFACE
      ?auto_348989 - SURFACE
      ?auto_348988 - SURFACE
      ?auto_348990 - SURFACE
    )
    :vars
    (
      ?auto_348992 - HOIST
      ?auto_348991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_348992 ?auto_348991 ) ( SURFACE-AT ?auto_348988 ?auto_348991 ) ( CLEAR ?auto_348988 ) ( LIFTING ?auto_348992 ?auto_348990 ) ( IS-CRATE ?auto_348990 ) ( not ( = ?auto_348988 ?auto_348990 ) ) ( ON ?auto_348986 ?auto_348985 ) ( ON ?auto_348987 ?auto_348986 ) ( ON ?auto_348989 ?auto_348987 ) ( ON ?auto_348988 ?auto_348989 ) ( not ( = ?auto_348985 ?auto_348986 ) ) ( not ( = ?auto_348985 ?auto_348987 ) ) ( not ( = ?auto_348985 ?auto_348989 ) ) ( not ( = ?auto_348985 ?auto_348988 ) ) ( not ( = ?auto_348985 ?auto_348990 ) ) ( not ( = ?auto_348986 ?auto_348987 ) ) ( not ( = ?auto_348986 ?auto_348989 ) ) ( not ( = ?auto_348986 ?auto_348988 ) ) ( not ( = ?auto_348986 ?auto_348990 ) ) ( not ( = ?auto_348987 ?auto_348989 ) ) ( not ( = ?auto_348987 ?auto_348988 ) ) ( not ( = ?auto_348987 ?auto_348990 ) ) ( not ( = ?auto_348989 ?auto_348988 ) ) ( not ( = ?auto_348989 ?auto_348990 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_348988 ?auto_348990 )
      ( MAKE-5CRATE-VERIFY ?auto_348985 ?auto_348986 ?auto_348987 ?auto_348989 ?auto_348988 ?auto_348990 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349019 - SURFACE
      ?auto_349020 - SURFACE
      ?auto_349021 - SURFACE
      ?auto_349023 - SURFACE
      ?auto_349022 - SURFACE
      ?auto_349024 - SURFACE
    )
    :vars
    (
      ?auto_349025 - HOIST
      ?auto_349027 - PLACE
      ?auto_349026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349025 ?auto_349027 ) ( SURFACE-AT ?auto_349022 ?auto_349027 ) ( CLEAR ?auto_349022 ) ( IS-CRATE ?auto_349024 ) ( not ( = ?auto_349022 ?auto_349024 ) ) ( TRUCK-AT ?auto_349026 ?auto_349027 ) ( AVAILABLE ?auto_349025 ) ( IN ?auto_349024 ?auto_349026 ) ( ON ?auto_349022 ?auto_349023 ) ( not ( = ?auto_349023 ?auto_349022 ) ) ( not ( = ?auto_349023 ?auto_349024 ) ) ( ON ?auto_349020 ?auto_349019 ) ( ON ?auto_349021 ?auto_349020 ) ( ON ?auto_349023 ?auto_349021 ) ( not ( = ?auto_349019 ?auto_349020 ) ) ( not ( = ?auto_349019 ?auto_349021 ) ) ( not ( = ?auto_349019 ?auto_349023 ) ) ( not ( = ?auto_349019 ?auto_349022 ) ) ( not ( = ?auto_349019 ?auto_349024 ) ) ( not ( = ?auto_349020 ?auto_349021 ) ) ( not ( = ?auto_349020 ?auto_349023 ) ) ( not ( = ?auto_349020 ?auto_349022 ) ) ( not ( = ?auto_349020 ?auto_349024 ) ) ( not ( = ?auto_349021 ?auto_349023 ) ) ( not ( = ?auto_349021 ?auto_349022 ) ) ( not ( = ?auto_349021 ?auto_349024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349023 ?auto_349022 ?auto_349024 )
      ( MAKE-5CRATE-VERIFY ?auto_349019 ?auto_349020 ?auto_349021 ?auto_349023 ?auto_349022 ?auto_349024 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349059 - SURFACE
      ?auto_349060 - SURFACE
      ?auto_349061 - SURFACE
      ?auto_349063 - SURFACE
      ?auto_349062 - SURFACE
      ?auto_349064 - SURFACE
    )
    :vars
    (
      ?auto_349068 - HOIST
      ?auto_349066 - PLACE
      ?auto_349065 - TRUCK
      ?auto_349067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349068 ?auto_349066 ) ( SURFACE-AT ?auto_349062 ?auto_349066 ) ( CLEAR ?auto_349062 ) ( IS-CRATE ?auto_349064 ) ( not ( = ?auto_349062 ?auto_349064 ) ) ( AVAILABLE ?auto_349068 ) ( IN ?auto_349064 ?auto_349065 ) ( ON ?auto_349062 ?auto_349063 ) ( not ( = ?auto_349063 ?auto_349062 ) ) ( not ( = ?auto_349063 ?auto_349064 ) ) ( TRUCK-AT ?auto_349065 ?auto_349067 ) ( not ( = ?auto_349067 ?auto_349066 ) ) ( ON ?auto_349060 ?auto_349059 ) ( ON ?auto_349061 ?auto_349060 ) ( ON ?auto_349063 ?auto_349061 ) ( not ( = ?auto_349059 ?auto_349060 ) ) ( not ( = ?auto_349059 ?auto_349061 ) ) ( not ( = ?auto_349059 ?auto_349063 ) ) ( not ( = ?auto_349059 ?auto_349062 ) ) ( not ( = ?auto_349059 ?auto_349064 ) ) ( not ( = ?auto_349060 ?auto_349061 ) ) ( not ( = ?auto_349060 ?auto_349063 ) ) ( not ( = ?auto_349060 ?auto_349062 ) ) ( not ( = ?auto_349060 ?auto_349064 ) ) ( not ( = ?auto_349061 ?auto_349063 ) ) ( not ( = ?auto_349061 ?auto_349062 ) ) ( not ( = ?auto_349061 ?auto_349064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349063 ?auto_349062 ?auto_349064 )
      ( MAKE-5CRATE-VERIFY ?auto_349059 ?auto_349060 ?auto_349061 ?auto_349063 ?auto_349062 ?auto_349064 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349104 - SURFACE
      ?auto_349105 - SURFACE
      ?auto_349106 - SURFACE
      ?auto_349108 - SURFACE
      ?auto_349107 - SURFACE
      ?auto_349109 - SURFACE
    )
    :vars
    (
      ?auto_349112 - HOIST
      ?auto_349110 - PLACE
      ?auto_349113 - TRUCK
      ?auto_349114 - PLACE
      ?auto_349111 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_349112 ?auto_349110 ) ( SURFACE-AT ?auto_349107 ?auto_349110 ) ( CLEAR ?auto_349107 ) ( IS-CRATE ?auto_349109 ) ( not ( = ?auto_349107 ?auto_349109 ) ) ( AVAILABLE ?auto_349112 ) ( ON ?auto_349107 ?auto_349108 ) ( not ( = ?auto_349108 ?auto_349107 ) ) ( not ( = ?auto_349108 ?auto_349109 ) ) ( TRUCK-AT ?auto_349113 ?auto_349114 ) ( not ( = ?auto_349114 ?auto_349110 ) ) ( HOIST-AT ?auto_349111 ?auto_349114 ) ( LIFTING ?auto_349111 ?auto_349109 ) ( not ( = ?auto_349112 ?auto_349111 ) ) ( ON ?auto_349105 ?auto_349104 ) ( ON ?auto_349106 ?auto_349105 ) ( ON ?auto_349108 ?auto_349106 ) ( not ( = ?auto_349104 ?auto_349105 ) ) ( not ( = ?auto_349104 ?auto_349106 ) ) ( not ( = ?auto_349104 ?auto_349108 ) ) ( not ( = ?auto_349104 ?auto_349107 ) ) ( not ( = ?auto_349104 ?auto_349109 ) ) ( not ( = ?auto_349105 ?auto_349106 ) ) ( not ( = ?auto_349105 ?auto_349108 ) ) ( not ( = ?auto_349105 ?auto_349107 ) ) ( not ( = ?auto_349105 ?auto_349109 ) ) ( not ( = ?auto_349106 ?auto_349108 ) ) ( not ( = ?auto_349106 ?auto_349107 ) ) ( not ( = ?auto_349106 ?auto_349109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349108 ?auto_349107 ?auto_349109 )
      ( MAKE-5CRATE-VERIFY ?auto_349104 ?auto_349105 ?auto_349106 ?auto_349108 ?auto_349107 ?auto_349109 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349154 - SURFACE
      ?auto_349155 - SURFACE
      ?auto_349156 - SURFACE
      ?auto_349158 - SURFACE
      ?auto_349157 - SURFACE
      ?auto_349159 - SURFACE
    )
    :vars
    (
      ?auto_349163 - HOIST
      ?auto_349165 - PLACE
      ?auto_349160 - TRUCK
      ?auto_349164 - PLACE
      ?auto_349161 - HOIST
      ?auto_349162 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_349163 ?auto_349165 ) ( SURFACE-AT ?auto_349157 ?auto_349165 ) ( CLEAR ?auto_349157 ) ( IS-CRATE ?auto_349159 ) ( not ( = ?auto_349157 ?auto_349159 ) ) ( AVAILABLE ?auto_349163 ) ( ON ?auto_349157 ?auto_349158 ) ( not ( = ?auto_349158 ?auto_349157 ) ) ( not ( = ?auto_349158 ?auto_349159 ) ) ( TRUCK-AT ?auto_349160 ?auto_349164 ) ( not ( = ?auto_349164 ?auto_349165 ) ) ( HOIST-AT ?auto_349161 ?auto_349164 ) ( not ( = ?auto_349163 ?auto_349161 ) ) ( AVAILABLE ?auto_349161 ) ( SURFACE-AT ?auto_349159 ?auto_349164 ) ( ON ?auto_349159 ?auto_349162 ) ( CLEAR ?auto_349159 ) ( not ( = ?auto_349157 ?auto_349162 ) ) ( not ( = ?auto_349159 ?auto_349162 ) ) ( not ( = ?auto_349158 ?auto_349162 ) ) ( ON ?auto_349155 ?auto_349154 ) ( ON ?auto_349156 ?auto_349155 ) ( ON ?auto_349158 ?auto_349156 ) ( not ( = ?auto_349154 ?auto_349155 ) ) ( not ( = ?auto_349154 ?auto_349156 ) ) ( not ( = ?auto_349154 ?auto_349158 ) ) ( not ( = ?auto_349154 ?auto_349157 ) ) ( not ( = ?auto_349154 ?auto_349159 ) ) ( not ( = ?auto_349154 ?auto_349162 ) ) ( not ( = ?auto_349155 ?auto_349156 ) ) ( not ( = ?auto_349155 ?auto_349158 ) ) ( not ( = ?auto_349155 ?auto_349157 ) ) ( not ( = ?auto_349155 ?auto_349159 ) ) ( not ( = ?auto_349155 ?auto_349162 ) ) ( not ( = ?auto_349156 ?auto_349158 ) ) ( not ( = ?auto_349156 ?auto_349157 ) ) ( not ( = ?auto_349156 ?auto_349159 ) ) ( not ( = ?auto_349156 ?auto_349162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349158 ?auto_349157 ?auto_349159 )
      ( MAKE-5CRATE-VERIFY ?auto_349154 ?auto_349155 ?auto_349156 ?auto_349158 ?auto_349157 ?auto_349159 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349205 - SURFACE
      ?auto_349206 - SURFACE
      ?auto_349207 - SURFACE
      ?auto_349209 - SURFACE
      ?auto_349208 - SURFACE
      ?auto_349210 - SURFACE
    )
    :vars
    (
      ?auto_349214 - HOIST
      ?auto_349216 - PLACE
      ?auto_349212 - PLACE
      ?auto_349213 - HOIST
      ?auto_349211 - SURFACE
      ?auto_349215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349214 ?auto_349216 ) ( SURFACE-AT ?auto_349208 ?auto_349216 ) ( CLEAR ?auto_349208 ) ( IS-CRATE ?auto_349210 ) ( not ( = ?auto_349208 ?auto_349210 ) ) ( AVAILABLE ?auto_349214 ) ( ON ?auto_349208 ?auto_349209 ) ( not ( = ?auto_349209 ?auto_349208 ) ) ( not ( = ?auto_349209 ?auto_349210 ) ) ( not ( = ?auto_349212 ?auto_349216 ) ) ( HOIST-AT ?auto_349213 ?auto_349212 ) ( not ( = ?auto_349214 ?auto_349213 ) ) ( AVAILABLE ?auto_349213 ) ( SURFACE-AT ?auto_349210 ?auto_349212 ) ( ON ?auto_349210 ?auto_349211 ) ( CLEAR ?auto_349210 ) ( not ( = ?auto_349208 ?auto_349211 ) ) ( not ( = ?auto_349210 ?auto_349211 ) ) ( not ( = ?auto_349209 ?auto_349211 ) ) ( TRUCK-AT ?auto_349215 ?auto_349216 ) ( ON ?auto_349206 ?auto_349205 ) ( ON ?auto_349207 ?auto_349206 ) ( ON ?auto_349209 ?auto_349207 ) ( not ( = ?auto_349205 ?auto_349206 ) ) ( not ( = ?auto_349205 ?auto_349207 ) ) ( not ( = ?auto_349205 ?auto_349209 ) ) ( not ( = ?auto_349205 ?auto_349208 ) ) ( not ( = ?auto_349205 ?auto_349210 ) ) ( not ( = ?auto_349205 ?auto_349211 ) ) ( not ( = ?auto_349206 ?auto_349207 ) ) ( not ( = ?auto_349206 ?auto_349209 ) ) ( not ( = ?auto_349206 ?auto_349208 ) ) ( not ( = ?auto_349206 ?auto_349210 ) ) ( not ( = ?auto_349206 ?auto_349211 ) ) ( not ( = ?auto_349207 ?auto_349209 ) ) ( not ( = ?auto_349207 ?auto_349208 ) ) ( not ( = ?auto_349207 ?auto_349210 ) ) ( not ( = ?auto_349207 ?auto_349211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349209 ?auto_349208 ?auto_349210 )
      ( MAKE-5CRATE-VERIFY ?auto_349205 ?auto_349206 ?auto_349207 ?auto_349209 ?auto_349208 ?auto_349210 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349256 - SURFACE
      ?auto_349257 - SURFACE
      ?auto_349258 - SURFACE
      ?auto_349260 - SURFACE
      ?auto_349259 - SURFACE
      ?auto_349261 - SURFACE
    )
    :vars
    (
      ?auto_349262 - HOIST
      ?auto_349267 - PLACE
      ?auto_349266 - PLACE
      ?auto_349265 - HOIST
      ?auto_349263 - SURFACE
      ?auto_349264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349262 ?auto_349267 ) ( IS-CRATE ?auto_349261 ) ( not ( = ?auto_349259 ?auto_349261 ) ) ( not ( = ?auto_349260 ?auto_349259 ) ) ( not ( = ?auto_349260 ?auto_349261 ) ) ( not ( = ?auto_349266 ?auto_349267 ) ) ( HOIST-AT ?auto_349265 ?auto_349266 ) ( not ( = ?auto_349262 ?auto_349265 ) ) ( AVAILABLE ?auto_349265 ) ( SURFACE-AT ?auto_349261 ?auto_349266 ) ( ON ?auto_349261 ?auto_349263 ) ( CLEAR ?auto_349261 ) ( not ( = ?auto_349259 ?auto_349263 ) ) ( not ( = ?auto_349261 ?auto_349263 ) ) ( not ( = ?auto_349260 ?auto_349263 ) ) ( TRUCK-AT ?auto_349264 ?auto_349267 ) ( SURFACE-AT ?auto_349260 ?auto_349267 ) ( CLEAR ?auto_349260 ) ( LIFTING ?auto_349262 ?auto_349259 ) ( IS-CRATE ?auto_349259 ) ( ON ?auto_349257 ?auto_349256 ) ( ON ?auto_349258 ?auto_349257 ) ( ON ?auto_349260 ?auto_349258 ) ( not ( = ?auto_349256 ?auto_349257 ) ) ( not ( = ?auto_349256 ?auto_349258 ) ) ( not ( = ?auto_349256 ?auto_349260 ) ) ( not ( = ?auto_349256 ?auto_349259 ) ) ( not ( = ?auto_349256 ?auto_349261 ) ) ( not ( = ?auto_349256 ?auto_349263 ) ) ( not ( = ?auto_349257 ?auto_349258 ) ) ( not ( = ?auto_349257 ?auto_349260 ) ) ( not ( = ?auto_349257 ?auto_349259 ) ) ( not ( = ?auto_349257 ?auto_349261 ) ) ( not ( = ?auto_349257 ?auto_349263 ) ) ( not ( = ?auto_349258 ?auto_349260 ) ) ( not ( = ?auto_349258 ?auto_349259 ) ) ( not ( = ?auto_349258 ?auto_349261 ) ) ( not ( = ?auto_349258 ?auto_349263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349260 ?auto_349259 ?auto_349261 )
      ( MAKE-5CRATE-VERIFY ?auto_349256 ?auto_349257 ?auto_349258 ?auto_349260 ?auto_349259 ?auto_349261 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_349307 - SURFACE
      ?auto_349308 - SURFACE
      ?auto_349309 - SURFACE
      ?auto_349311 - SURFACE
      ?auto_349310 - SURFACE
      ?auto_349312 - SURFACE
    )
    :vars
    (
      ?auto_349314 - HOIST
      ?auto_349315 - PLACE
      ?auto_349317 - PLACE
      ?auto_349313 - HOIST
      ?auto_349318 - SURFACE
      ?auto_349316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349314 ?auto_349315 ) ( IS-CRATE ?auto_349312 ) ( not ( = ?auto_349310 ?auto_349312 ) ) ( not ( = ?auto_349311 ?auto_349310 ) ) ( not ( = ?auto_349311 ?auto_349312 ) ) ( not ( = ?auto_349317 ?auto_349315 ) ) ( HOIST-AT ?auto_349313 ?auto_349317 ) ( not ( = ?auto_349314 ?auto_349313 ) ) ( AVAILABLE ?auto_349313 ) ( SURFACE-AT ?auto_349312 ?auto_349317 ) ( ON ?auto_349312 ?auto_349318 ) ( CLEAR ?auto_349312 ) ( not ( = ?auto_349310 ?auto_349318 ) ) ( not ( = ?auto_349312 ?auto_349318 ) ) ( not ( = ?auto_349311 ?auto_349318 ) ) ( TRUCK-AT ?auto_349316 ?auto_349315 ) ( SURFACE-AT ?auto_349311 ?auto_349315 ) ( CLEAR ?auto_349311 ) ( IS-CRATE ?auto_349310 ) ( AVAILABLE ?auto_349314 ) ( IN ?auto_349310 ?auto_349316 ) ( ON ?auto_349308 ?auto_349307 ) ( ON ?auto_349309 ?auto_349308 ) ( ON ?auto_349311 ?auto_349309 ) ( not ( = ?auto_349307 ?auto_349308 ) ) ( not ( = ?auto_349307 ?auto_349309 ) ) ( not ( = ?auto_349307 ?auto_349311 ) ) ( not ( = ?auto_349307 ?auto_349310 ) ) ( not ( = ?auto_349307 ?auto_349312 ) ) ( not ( = ?auto_349307 ?auto_349318 ) ) ( not ( = ?auto_349308 ?auto_349309 ) ) ( not ( = ?auto_349308 ?auto_349311 ) ) ( not ( = ?auto_349308 ?auto_349310 ) ) ( not ( = ?auto_349308 ?auto_349312 ) ) ( not ( = ?auto_349308 ?auto_349318 ) ) ( not ( = ?auto_349309 ?auto_349311 ) ) ( not ( = ?auto_349309 ?auto_349310 ) ) ( not ( = ?auto_349309 ?auto_349312 ) ) ( not ( = ?auto_349309 ?auto_349318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_349311 ?auto_349310 ?auto_349312 )
      ( MAKE-5CRATE-VERIFY ?auto_349307 ?auto_349308 ?auto_349309 ?auto_349311 ?auto_349310 ?auto_349312 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350502 - SURFACE
      ?auto_350503 - SURFACE
      ?auto_350504 - SURFACE
      ?auto_350506 - SURFACE
      ?auto_350505 - SURFACE
      ?auto_350507 - SURFACE
      ?auto_350508 - SURFACE
    )
    :vars
    (
      ?auto_350509 - HOIST
      ?auto_350510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_350509 ?auto_350510 ) ( SURFACE-AT ?auto_350507 ?auto_350510 ) ( CLEAR ?auto_350507 ) ( LIFTING ?auto_350509 ?auto_350508 ) ( IS-CRATE ?auto_350508 ) ( not ( = ?auto_350507 ?auto_350508 ) ) ( ON ?auto_350503 ?auto_350502 ) ( ON ?auto_350504 ?auto_350503 ) ( ON ?auto_350506 ?auto_350504 ) ( ON ?auto_350505 ?auto_350506 ) ( ON ?auto_350507 ?auto_350505 ) ( not ( = ?auto_350502 ?auto_350503 ) ) ( not ( = ?auto_350502 ?auto_350504 ) ) ( not ( = ?auto_350502 ?auto_350506 ) ) ( not ( = ?auto_350502 ?auto_350505 ) ) ( not ( = ?auto_350502 ?auto_350507 ) ) ( not ( = ?auto_350502 ?auto_350508 ) ) ( not ( = ?auto_350503 ?auto_350504 ) ) ( not ( = ?auto_350503 ?auto_350506 ) ) ( not ( = ?auto_350503 ?auto_350505 ) ) ( not ( = ?auto_350503 ?auto_350507 ) ) ( not ( = ?auto_350503 ?auto_350508 ) ) ( not ( = ?auto_350504 ?auto_350506 ) ) ( not ( = ?auto_350504 ?auto_350505 ) ) ( not ( = ?auto_350504 ?auto_350507 ) ) ( not ( = ?auto_350504 ?auto_350508 ) ) ( not ( = ?auto_350506 ?auto_350505 ) ) ( not ( = ?auto_350506 ?auto_350507 ) ) ( not ( = ?auto_350506 ?auto_350508 ) ) ( not ( = ?auto_350505 ?auto_350507 ) ) ( not ( = ?auto_350505 ?auto_350508 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_350507 ?auto_350508 )
      ( MAKE-6CRATE-VERIFY ?auto_350502 ?auto_350503 ?auto_350504 ?auto_350506 ?auto_350505 ?auto_350507 ?auto_350508 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350546 - SURFACE
      ?auto_350547 - SURFACE
      ?auto_350548 - SURFACE
      ?auto_350550 - SURFACE
      ?auto_350549 - SURFACE
      ?auto_350551 - SURFACE
      ?auto_350552 - SURFACE
    )
    :vars
    (
      ?auto_350554 - HOIST
      ?auto_350553 - PLACE
      ?auto_350555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_350554 ?auto_350553 ) ( SURFACE-AT ?auto_350551 ?auto_350553 ) ( CLEAR ?auto_350551 ) ( IS-CRATE ?auto_350552 ) ( not ( = ?auto_350551 ?auto_350552 ) ) ( TRUCK-AT ?auto_350555 ?auto_350553 ) ( AVAILABLE ?auto_350554 ) ( IN ?auto_350552 ?auto_350555 ) ( ON ?auto_350551 ?auto_350549 ) ( not ( = ?auto_350549 ?auto_350551 ) ) ( not ( = ?auto_350549 ?auto_350552 ) ) ( ON ?auto_350547 ?auto_350546 ) ( ON ?auto_350548 ?auto_350547 ) ( ON ?auto_350550 ?auto_350548 ) ( ON ?auto_350549 ?auto_350550 ) ( not ( = ?auto_350546 ?auto_350547 ) ) ( not ( = ?auto_350546 ?auto_350548 ) ) ( not ( = ?auto_350546 ?auto_350550 ) ) ( not ( = ?auto_350546 ?auto_350549 ) ) ( not ( = ?auto_350546 ?auto_350551 ) ) ( not ( = ?auto_350546 ?auto_350552 ) ) ( not ( = ?auto_350547 ?auto_350548 ) ) ( not ( = ?auto_350547 ?auto_350550 ) ) ( not ( = ?auto_350547 ?auto_350549 ) ) ( not ( = ?auto_350547 ?auto_350551 ) ) ( not ( = ?auto_350547 ?auto_350552 ) ) ( not ( = ?auto_350548 ?auto_350550 ) ) ( not ( = ?auto_350548 ?auto_350549 ) ) ( not ( = ?auto_350548 ?auto_350551 ) ) ( not ( = ?auto_350548 ?auto_350552 ) ) ( not ( = ?auto_350550 ?auto_350549 ) ) ( not ( = ?auto_350550 ?auto_350551 ) ) ( not ( = ?auto_350550 ?auto_350552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350549 ?auto_350551 ?auto_350552 )
      ( MAKE-6CRATE-VERIFY ?auto_350546 ?auto_350547 ?auto_350548 ?auto_350550 ?auto_350549 ?auto_350551 ?auto_350552 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350597 - SURFACE
      ?auto_350598 - SURFACE
      ?auto_350599 - SURFACE
      ?auto_350601 - SURFACE
      ?auto_350600 - SURFACE
      ?auto_350602 - SURFACE
      ?auto_350603 - SURFACE
    )
    :vars
    (
      ?auto_350604 - HOIST
      ?auto_350607 - PLACE
      ?auto_350606 - TRUCK
      ?auto_350605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_350604 ?auto_350607 ) ( SURFACE-AT ?auto_350602 ?auto_350607 ) ( CLEAR ?auto_350602 ) ( IS-CRATE ?auto_350603 ) ( not ( = ?auto_350602 ?auto_350603 ) ) ( AVAILABLE ?auto_350604 ) ( IN ?auto_350603 ?auto_350606 ) ( ON ?auto_350602 ?auto_350600 ) ( not ( = ?auto_350600 ?auto_350602 ) ) ( not ( = ?auto_350600 ?auto_350603 ) ) ( TRUCK-AT ?auto_350606 ?auto_350605 ) ( not ( = ?auto_350605 ?auto_350607 ) ) ( ON ?auto_350598 ?auto_350597 ) ( ON ?auto_350599 ?auto_350598 ) ( ON ?auto_350601 ?auto_350599 ) ( ON ?auto_350600 ?auto_350601 ) ( not ( = ?auto_350597 ?auto_350598 ) ) ( not ( = ?auto_350597 ?auto_350599 ) ) ( not ( = ?auto_350597 ?auto_350601 ) ) ( not ( = ?auto_350597 ?auto_350600 ) ) ( not ( = ?auto_350597 ?auto_350602 ) ) ( not ( = ?auto_350597 ?auto_350603 ) ) ( not ( = ?auto_350598 ?auto_350599 ) ) ( not ( = ?auto_350598 ?auto_350601 ) ) ( not ( = ?auto_350598 ?auto_350600 ) ) ( not ( = ?auto_350598 ?auto_350602 ) ) ( not ( = ?auto_350598 ?auto_350603 ) ) ( not ( = ?auto_350599 ?auto_350601 ) ) ( not ( = ?auto_350599 ?auto_350600 ) ) ( not ( = ?auto_350599 ?auto_350602 ) ) ( not ( = ?auto_350599 ?auto_350603 ) ) ( not ( = ?auto_350601 ?auto_350600 ) ) ( not ( = ?auto_350601 ?auto_350602 ) ) ( not ( = ?auto_350601 ?auto_350603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350600 ?auto_350602 ?auto_350603 )
      ( MAKE-6CRATE-VERIFY ?auto_350597 ?auto_350598 ?auto_350599 ?auto_350601 ?auto_350600 ?auto_350602 ?auto_350603 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350654 - SURFACE
      ?auto_350655 - SURFACE
      ?auto_350656 - SURFACE
      ?auto_350658 - SURFACE
      ?auto_350657 - SURFACE
      ?auto_350659 - SURFACE
      ?auto_350660 - SURFACE
    )
    :vars
    (
      ?auto_350665 - HOIST
      ?auto_350661 - PLACE
      ?auto_350662 - TRUCK
      ?auto_350663 - PLACE
      ?auto_350664 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_350665 ?auto_350661 ) ( SURFACE-AT ?auto_350659 ?auto_350661 ) ( CLEAR ?auto_350659 ) ( IS-CRATE ?auto_350660 ) ( not ( = ?auto_350659 ?auto_350660 ) ) ( AVAILABLE ?auto_350665 ) ( ON ?auto_350659 ?auto_350657 ) ( not ( = ?auto_350657 ?auto_350659 ) ) ( not ( = ?auto_350657 ?auto_350660 ) ) ( TRUCK-AT ?auto_350662 ?auto_350663 ) ( not ( = ?auto_350663 ?auto_350661 ) ) ( HOIST-AT ?auto_350664 ?auto_350663 ) ( LIFTING ?auto_350664 ?auto_350660 ) ( not ( = ?auto_350665 ?auto_350664 ) ) ( ON ?auto_350655 ?auto_350654 ) ( ON ?auto_350656 ?auto_350655 ) ( ON ?auto_350658 ?auto_350656 ) ( ON ?auto_350657 ?auto_350658 ) ( not ( = ?auto_350654 ?auto_350655 ) ) ( not ( = ?auto_350654 ?auto_350656 ) ) ( not ( = ?auto_350654 ?auto_350658 ) ) ( not ( = ?auto_350654 ?auto_350657 ) ) ( not ( = ?auto_350654 ?auto_350659 ) ) ( not ( = ?auto_350654 ?auto_350660 ) ) ( not ( = ?auto_350655 ?auto_350656 ) ) ( not ( = ?auto_350655 ?auto_350658 ) ) ( not ( = ?auto_350655 ?auto_350657 ) ) ( not ( = ?auto_350655 ?auto_350659 ) ) ( not ( = ?auto_350655 ?auto_350660 ) ) ( not ( = ?auto_350656 ?auto_350658 ) ) ( not ( = ?auto_350656 ?auto_350657 ) ) ( not ( = ?auto_350656 ?auto_350659 ) ) ( not ( = ?auto_350656 ?auto_350660 ) ) ( not ( = ?auto_350658 ?auto_350657 ) ) ( not ( = ?auto_350658 ?auto_350659 ) ) ( not ( = ?auto_350658 ?auto_350660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350657 ?auto_350659 ?auto_350660 )
      ( MAKE-6CRATE-VERIFY ?auto_350654 ?auto_350655 ?auto_350656 ?auto_350658 ?auto_350657 ?auto_350659 ?auto_350660 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350717 - SURFACE
      ?auto_350718 - SURFACE
      ?auto_350719 - SURFACE
      ?auto_350721 - SURFACE
      ?auto_350720 - SURFACE
      ?auto_350722 - SURFACE
      ?auto_350723 - SURFACE
    )
    :vars
    (
      ?auto_350726 - HOIST
      ?auto_350724 - PLACE
      ?auto_350728 - TRUCK
      ?auto_350729 - PLACE
      ?auto_350725 - HOIST
      ?auto_350727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_350726 ?auto_350724 ) ( SURFACE-AT ?auto_350722 ?auto_350724 ) ( CLEAR ?auto_350722 ) ( IS-CRATE ?auto_350723 ) ( not ( = ?auto_350722 ?auto_350723 ) ) ( AVAILABLE ?auto_350726 ) ( ON ?auto_350722 ?auto_350720 ) ( not ( = ?auto_350720 ?auto_350722 ) ) ( not ( = ?auto_350720 ?auto_350723 ) ) ( TRUCK-AT ?auto_350728 ?auto_350729 ) ( not ( = ?auto_350729 ?auto_350724 ) ) ( HOIST-AT ?auto_350725 ?auto_350729 ) ( not ( = ?auto_350726 ?auto_350725 ) ) ( AVAILABLE ?auto_350725 ) ( SURFACE-AT ?auto_350723 ?auto_350729 ) ( ON ?auto_350723 ?auto_350727 ) ( CLEAR ?auto_350723 ) ( not ( = ?auto_350722 ?auto_350727 ) ) ( not ( = ?auto_350723 ?auto_350727 ) ) ( not ( = ?auto_350720 ?auto_350727 ) ) ( ON ?auto_350718 ?auto_350717 ) ( ON ?auto_350719 ?auto_350718 ) ( ON ?auto_350721 ?auto_350719 ) ( ON ?auto_350720 ?auto_350721 ) ( not ( = ?auto_350717 ?auto_350718 ) ) ( not ( = ?auto_350717 ?auto_350719 ) ) ( not ( = ?auto_350717 ?auto_350721 ) ) ( not ( = ?auto_350717 ?auto_350720 ) ) ( not ( = ?auto_350717 ?auto_350722 ) ) ( not ( = ?auto_350717 ?auto_350723 ) ) ( not ( = ?auto_350717 ?auto_350727 ) ) ( not ( = ?auto_350718 ?auto_350719 ) ) ( not ( = ?auto_350718 ?auto_350721 ) ) ( not ( = ?auto_350718 ?auto_350720 ) ) ( not ( = ?auto_350718 ?auto_350722 ) ) ( not ( = ?auto_350718 ?auto_350723 ) ) ( not ( = ?auto_350718 ?auto_350727 ) ) ( not ( = ?auto_350719 ?auto_350721 ) ) ( not ( = ?auto_350719 ?auto_350720 ) ) ( not ( = ?auto_350719 ?auto_350722 ) ) ( not ( = ?auto_350719 ?auto_350723 ) ) ( not ( = ?auto_350719 ?auto_350727 ) ) ( not ( = ?auto_350721 ?auto_350720 ) ) ( not ( = ?auto_350721 ?auto_350722 ) ) ( not ( = ?auto_350721 ?auto_350723 ) ) ( not ( = ?auto_350721 ?auto_350727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350720 ?auto_350722 ?auto_350723 )
      ( MAKE-6CRATE-VERIFY ?auto_350717 ?auto_350718 ?auto_350719 ?auto_350721 ?auto_350720 ?auto_350722 ?auto_350723 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350781 - SURFACE
      ?auto_350782 - SURFACE
      ?auto_350783 - SURFACE
      ?auto_350785 - SURFACE
      ?auto_350784 - SURFACE
      ?auto_350786 - SURFACE
      ?auto_350787 - SURFACE
    )
    :vars
    (
      ?auto_350792 - HOIST
      ?auto_350790 - PLACE
      ?auto_350789 - PLACE
      ?auto_350788 - HOIST
      ?auto_350791 - SURFACE
      ?auto_350793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_350792 ?auto_350790 ) ( SURFACE-AT ?auto_350786 ?auto_350790 ) ( CLEAR ?auto_350786 ) ( IS-CRATE ?auto_350787 ) ( not ( = ?auto_350786 ?auto_350787 ) ) ( AVAILABLE ?auto_350792 ) ( ON ?auto_350786 ?auto_350784 ) ( not ( = ?auto_350784 ?auto_350786 ) ) ( not ( = ?auto_350784 ?auto_350787 ) ) ( not ( = ?auto_350789 ?auto_350790 ) ) ( HOIST-AT ?auto_350788 ?auto_350789 ) ( not ( = ?auto_350792 ?auto_350788 ) ) ( AVAILABLE ?auto_350788 ) ( SURFACE-AT ?auto_350787 ?auto_350789 ) ( ON ?auto_350787 ?auto_350791 ) ( CLEAR ?auto_350787 ) ( not ( = ?auto_350786 ?auto_350791 ) ) ( not ( = ?auto_350787 ?auto_350791 ) ) ( not ( = ?auto_350784 ?auto_350791 ) ) ( TRUCK-AT ?auto_350793 ?auto_350790 ) ( ON ?auto_350782 ?auto_350781 ) ( ON ?auto_350783 ?auto_350782 ) ( ON ?auto_350785 ?auto_350783 ) ( ON ?auto_350784 ?auto_350785 ) ( not ( = ?auto_350781 ?auto_350782 ) ) ( not ( = ?auto_350781 ?auto_350783 ) ) ( not ( = ?auto_350781 ?auto_350785 ) ) ( not ( = ?auto_350781 ?auto_350784 ) ) ( not ( = ?auto_350781 ?auto_350786 ) ) ( not ( = ?auto_350781 ?auto_350787 ) ) ( not ( = ?auto_350781 ?auto_350791 ) ) ( not ( = ?auto_350782 ?auto_350783 ) ) ( not ( = ?auto_350782 ?auto_350785 ) ) ( not ( = ?auto_350782 ?auto_350784 ) ) ( not ( = ?auto_350782 ?auto_350786 ) ) ( not ( = ?auto_350782 ?auto_350787 ) ) ( not ( = ?auto_350782 ?auto_350791 ) ) ( not ( = ?auto_350783 ?auto_350785 ) ) ( not ( = ?auto_350783 ?auto_350784 ) ) ( not ( = ?auto_350783 ?auto_350786 ) ) ( not ( = ?auto_350783 ?auto_350787 ) ) ( not ( = ?auto_350783 ?auto_350791 ) ) ( not ( = ?auto_350785 ?auto_350784 ) ) ( not ( = ?auto_350785 ?auto_350786 ) ) ( not ( = ?auto_350785 ?auto_350787 ) ) ( not ( = ?auto_350785 ?auto_350791 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350784 ?auto_350786 ?auto_350787 )
      ( MAKE-6CRATE-VERIFY ?auto_350781 ?auto_350782 ?auto_350783 ?auto_350785 ?auto_350784 ?auto_350786 ?auto_350787 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350845 - SURFACE
      ?auto_350846 - SURFACE
      ?auto_350847 - SURFACE
      ?auto_350849 - SURFACE
      ?auto_350848 - SURFACE
      ?auto_350850 - SURFACE
      ?auto_350851 - SURFACE
    )
    :vars
    (
      ?auto_350857 - HOIST
      ?auto_350852 - PLACE
      ?auto_350854 - PLACE
      ?auto_350856 - HOIST
      ?auto_350853 - SURFACE
      ?auto_350855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_350857 ?auto_350852 ) ( IS-CRATE ?auto_350851 ) ( not ( = ?auto_350850 ?auto_350851 ) ) ( not ( = ?auto_350848 ?auto_350850 ) ) ( not ( = ?auto_350848 ?auto_350851 ) ) ( not ( = ?auto_350854 ?auto_350852 ) ) ( HOIST-AT ?auto_350856 ?auto_350854 ) ( not ( = ?auto_350857 ?auto_350856 ) ) ( AVAILABLE ?auto_350856 ) ( SURFACE-AT ?auto_350851 ?auto_350854 ) ( ON ?auto_350851 ?auto_350853 ) ( CLEAR ?auto_350851 ) ( not ( = ?auto_350850 ?auto_350853 ) ) ( not ( = ?auto_350851 ?auto_350853 ) ) ( not ( = ?auto_350848 ?auto_350853 ) ) ( TRUCK-AT ?auto_350855 ?auto_350852 ) ( SURFACE-AT ?auto_350848 ?auto_350852 ) ( CLEAR ?auto_350848 ) ( LIFTING ?auto_350857 ?auto_350850 ) ( IS-CRATE ?auto_350850 ) ( ON ?auto_350846 ?auto_350845 ) ( ON ?auto_350847 ?auto_350846 ) ( ON ?auto_350849 ?auto_350847 ) ( ON ?auto_350848 ?auto_350849 ) ( not ( = ?auto_350845 ?auto_350846 ) ) ( not ( = ?auto_350845 ?auto_350847 ) ) ( not ( = ?auto_350845 ?auto_350849 ) ) ( not ( = ?auto_350845 ?auto_350848 ) ) ( not ( = ?auto_350845 ?auto_350850 ) ) ( not ( = ?auto_350845 ?auto_350851 ) ) ( not ( = ?auto_350845 ?auto_350853 ) ) ( not ( = ?auto_350846 ?auto_350847 ) ) ( not ( = ?auto_350846 ?auto_350849 ) ) ( not ( = ?auto_350846 ?auto_350848 ) ) ( not ( = ?auto_350846 ?auto_350850 ) ) ( not ( = ?auto_350846 ?auto_350851 ) ) ( not ( = ?auto_350846 ?auto_350853 ) ) ( not ( = ?auto_350847 ?auto_350849 ) ) ( not ( = ?auto_350847 ?auto_350848 ) ) ( not ( = ?auto_350847 ?auto_350850 ) ) ( not ( = ?auto_350847 ?auto_350851 ) ) ( not ( = ?auto_350847 ?auto_350853 ) ) ( not ( = ?auto_350849 ?auto_350848 ) ) ( not ( = ?auto_350849 ?auto_350850 ) ) ( not ( = ?auto_350849 ?auto_350851 ) ) ( not ( = ?auto_350849 ?auto_350853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350848 ?auto_350850 ?auto_350851 )
      ( MAKE-6CRATE-VERIFY ?auto_350845 ?auto_350846 ?auto_350847 ?auto_350849 ?auto_350848 ?auto_350850 ?auto_350851 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_350909 - SURFACE
      ?auto_350910 - SURFACE
      ?auto_350911 - SURFACE
      ?auto_350913 - SURFACE
      ?auto_350912 - SURFACE
      ?auto_350914 - SURFACE
      ?auto_350915 - SURFACE
    )
    :vars
    (
      ?auto_350920 - HOIST
      ?auto_350918 - PLACE
      ?auto_350921 - PLACE
      ?auto_350916 - HOIST
      ?auto_350919 - SURFACE
      ?auto_350917 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_350920 ?auto_350918 ) ( IS-CRATE ?auto_350915 ) ( not ( = ?auto_350914 ?auto_350915 ) ) ( not ( = ?auto_350912 ?auto_350914 ) ) ( not ( = ?auto_350912 ?auto_350915 ) ) ( not ( = ?auto_350921 ?auto_350918 ) ) ( HOIST-AT ?auto_350916 ?auto_350921 ) ( not ( = ?auto_350920 ?auto_350916 ) ) ( AVAILABLE ?auto_350916 ) ( SURFACE-AT ?auto_350915 ?auto_350921 ) ( ON ?auto_350915 ?auto_350919 ) ( CLEAR ?auto_350915 ) ( not ( = ?auto_350914 ?auto_350919 ) ) ( not ( = ?auto_350915 ?auto_350919 ) ) ( not ( = ?auto_350912 ?auto_350919 ) ) ( TRUCK-AT ?auto_350917 ?auto_350918 ) ( SURFACE-AT ?auto_350912 ?auto_350918 ) ( CLEAR ?auto_350912 ) ( IS-CRATE ?auto_350914 ) ( AVAILABLE ?auto_350920 ) ( IN ?auto_350914 ?auto_350917 ) ( ON ?auto_350910 ?auto_350909 ) ( ON ?auto_350911 ?auto_350910 ) ( ON ?auto_350913 ?auto_350911 ) ( ON ?auto_350912 ?auto_350913 ) ( not ( = ?auto_350909 ?auto_350910 ) ) ( not ( = ?auto_350909 ?auto_350911 ) ) ( not ( = ?auto_350909 ?auto_350913 ) ) ( not ( = ?auto_350909 ?auto_350912 ) ) ( not ( = ?auto_350909 ?auto_350914 ) ) ( not ( = ?auto_350909 ?auto_350915 ) ) ( not ( = ?auto_350909 ?auto_350919 ) ) ( not ( = ?auto_350910 ?auto_350911 ) ) ( not ( = ?auto_350910 ?auto_350913 ) ) ( not ( = ?auto_350910 ?auto_350912 ) ) ( not ( = ?auto_350910 ?auto_350914 ) ) ( not ( = ?auto_350910 ?auto_350915 ) ) ( not ( = ?auto_350910 ?auto_350919 ) ) ( not ( = ?auto_350911 ?auto_350913 ) ) ( not ( = ?auto_350911 ?auto_350912 ) ) ( not ( = ?auto_350911 ?auto_350914 ) ) ( not ( = ?auto_350911 ?auto_350915 ) ) ( not ( = ?auto_350911 ?auto_350919 ) ) ( not ( = ?auto_350913 ?auto_350912 ) ) ( not ( = ?auto_350913 ?auto_350914 ) ) ( not ( = ?auto_350913 ?auto_350915 ) ) ( not ( = ?auto_350913 ?auto_350919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_350912 ?auto_350914 ?auto_350915 )
      ( MAKE-6CRATE-VERIFY ?auto_350909 ?auto_350910 ?auto_350911 ?auto_350913 ?auto_350912 ?auto_350914 ?auto_350915 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_352834 - SURFACE
      ?auto_352835 - SURFACE
      ?auto_352836 - SURFACE
      ?auto_352838 - SURFACE
      ?auto_352837 - SURFACE
      ?auto_352839 - SURFACE
      ?auto_352840 - SURFACE
      ?auto_352841 - SURFACE
    )
    :vars
    (
      ?auto_352843 - HOIST
      ?auto_352842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_352843 ?auto_352842 ) ( SURFACE-AT ?auto_352840 ?auto_352842 ) ( CLEAR ?auto_352840 ) ( LIFTING ?auto_352843 ?auto_352841 ) ( IS-CRATE ?auto_352841 ) ( not ( = ?auto_352840 ?auto_352841 ) ) ( ON ?auto_352835 ?auto_352834 ) ( ON ?auto_352836 ?auto_352835 ) ( ON ?auto_352838 ?auto_352836 ) ( ON ?auto_352837 ?auto_352838 ) ( ON ?auto_352839 ?auto_352837 ) ( ON ?auto_352840 ?auto_352839 ) ( not ( = ?auto_352834 ?auto_352835 ) ) ( not ( = ?auto_352834 ?auto_352836 ) ) ( not ( = ?auto_352834 ?auto_352838 ) ) ( not ( = ?auto_352834 ?auto_352837 ) ) ( not ( = ?auto_352834 ?auto_352839 ) ) ( not ( = ?auto_352834 ?auto_352840 ) ) ( not ( = ?auto_352834 ?auto_352841 ) ) ( not ( = ?auto_352835 ?auto_352836 ) ) ( not ( = ?auto_352835 ?auto_352838 ) ) ( not ( = ?auto_352835 ?auto_352837 ) ) ( not ( = ?auto_352835 ?auto_352839 ) ) ( not ( = ?auto_352835 ?auto_352840 ) ) ( not ( = ?auto_352835 ?auto_352841 ) ) ( not ( = ?auto_352836 ?auto_352838 ) ) ( not ( = ?auto_352836 ?auto_352837 ) ) ( not ( = ?auto_352836 ?auto_352839 ) ) ( not ( = ?auto_352836 ?auto_352840 ) ) ( not ( = ?auto_352836 ?auto_352841 ) ) ( not ( = ?auto_352838 ?auto_352837 ) ) ( not ( = ?auto_352838 ?auto_352839 ) ) ( not ( = ?auto_352838 ?auto_352840 ) ) ( not ( = ?auto_352838 ?auto_352841 ) ) ( not ( = ?auto_352837 ?auto_352839 ) ) ( not ( = ?auto_352837 ?auto_352840 ) ) ( not ( = ?auto_352837 ?auto_352841 ) ) ( not ( = ?auto_352839 ?auto_352840 ) ) ( not ( = ?auto_352839 ?auto_352841 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_352840 ?auto_352841 )
      ( MAKE-7CRATE-VERIFY ?auto_352834 ?auto_352835 ?auto_352836 ?auto_352838 ?auto_352837 ?auto_352839 ?auto_352840 ?auto_352841 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_352889 - SURFACE
      ?auto_352890 - SURFACE
      ?auto_352891 - SURFACE
      ?auto_352893 - SURFACE
      ?auto_352892 - SURFACE
      ?auto_352894 - SURFACE
      ?auto_352895 - SURFACE
      ?auto_352896 - SURFACE
    )
    :vars
    (
      ?auto_352899 - HOIST
      ?auto_352898 - PLACE
      ?auto_352897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_352899 ?auto_352898 ) ( SURFACE-AT ?auto_352895 ?auto_352898 ) ( CLEAR ?auto_352895 ) ( IS-CRATE ?auto_352896 ) ( not ( = ?auto_352895 ?auto_352896 ) ) ( TRUCK-AT ?auto_352897 ?auto_352898 ) ( AVAILABLE ?auto_352899 ) ( IN ?auto_352896 ?auto_352897 ) ( ON ?auto_352895 ?auto_352894 ) ( not ( = ?auto_352894 ?auto_352895 ) ) ( not ( = ?auto_352894 ?auto_352896 ) ) ( ON ?auto_352890 ?auto_352889 ) ( ON ?auto_352891 ?auto_352890 ) ( ON ?auto_352893 ?auto_352891 ) ( ON ?auto_352892 ?auto_352893 ) ( ON ?auto_352894 ?auto_352892 ) ( not ( = ?auto_352889 ?auto_352890 ) ) ( not ( = ?auto_352889 ?auto_352891 ) ) ( not ( = ?auto_352889 ?auto_352893 ) ) ( not ( = ?auto_352889 ?auto_352892 ) ) ( not ( = ?auto_352889 ?auto_352894 ) ) ( not ( = ?auto_352889 ?auto_352895 ) ) ( not ( = ?auto_352889 ?auto_352896 ) ) ( not ( = ?auto_352890 ?auto_352891 ) ) ( not ( = ?auto_352890 ?auto_352893 ) ) ( not ( = ?auto_352890 ?auto_352892 ) ) ( not ( = ?auto_352890 ?auto_352894 ) ) ( not ( = ?auto_352890 ?auto_352895 ) ) ( not ( = ?auto_352890 ?auto_352896 ) ) ( not ( = ?auto_352891 ?auto_352893 ) ) ( not ( = ?auto_352891 ?auto_352892 ) ) ( not ( = ?auto_352891 ?auto_352894 ) ) ( not ( = ?auto_352891 ?auto_352895 ) ) ( not ( = ?auto_352891 ?auto_352896 ) ) ( not ( = ?auto_352893 ?auto_352892 ) ) ( not ( = ?auto_352893 ?auto_352894 ) ) ( not ( = ?auto_352893 ?auto_352895 ) ) ( not ( = ?auto_352893 ?auto_352896 ) ) ( not ( = ?auto_352892 ?auto_352894 ) ) ( not ( = ?auto_352892 ?auto_352895 ) ) ( not ( = ?auto_352892 ?auto_352896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_352894 ?auto_352895 ?auto_352896 )
      ( MAKE-7CRATE-VERIFY ?auto_352889 ?auto_352890 ?auto_352891 ?auto_352893 ?auto_352892 ?auto_352894 ?auto_352895 ?auto_352896 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_352952 - SURFACE
      ?auto_352953 - SURFACE
      ?auto_352954 - SURFACE
      ?auto_352956 - SURFACE
      ?auto_352955 - SURFACE
      ?auto_352957 - SURFACE
      ?auto_352958 - SURFACE
      ?auto_352959 - SURFACE
    )
    :vars
    (
      ?auto_352961 - HOIST
      ?auto_352962 - PLACE
      ?auto_352960 - TRUCK
      ?auto_352963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_352961 ?auto_352962 ) ( SURFACE-AT ?auto_352958 ?auto_352962 ) ( CLEAR ?auto_352958 ) ( IS-CRATE ?auto_352959 ) ( not ( = ?auto_352958 ?auto_352959 ) ) ( AVAILABLE ?auto_352961 ) ( IN ?auto_352959 ?auto_352960 ) ( ON ?auto_352958 ?auto_352957 ) ( not ( = ?auto_352957 ?auto_352958 ) ) ( not ( = ?auto_352957 ?auto_352959 ) ) ( TRUCK-AT ?auto_352960 ?auto_352963 ) ( not ( = ?auto_352963 ?auto_352962 ) ) ( ON ?auto_352953 ?auto_352952 ) ( ON ?auto_352954 ?auto_352953 ) ( ON ?auto_352956 ?auto_352954 ) ( ON ?auto_352955 ?auto_352956 ) ( ON ?auto_352957 ?auto_352955 ) ( not ( = ?auto_352952 ?auto_352953 ) ) ( not ( = ?auto_352952 ?auto_352954 ) ) ( not ( = ?auto_352952 ?auto_352956 ) ) ( not ( = ?auto_352952 ?auto_352955 ) ) ( not ( = ?auto_352952 ?auto_352957 ) ) ( not ( = ?auto_352952 ?auto_352958 ) ) ( not ( = ?auto_352952 ?auto_352959 ) ) ( not ( = ?auto_352953 ?auto_352954 ) ) ( not ( = ?auto_352953 ?auto_352956 ) ) ( not ( = ?auto_352953 ?auto_352955 ) ) ( not ( = ?auto_352953 ?auto_352957 ) ) ( not ( = ?auto_352953 ?auto_352958 ) ) ( not ( = ?auto_352953 ?auto_352959 ) ) ( not ( = ?auto_352954 ?auto_352956 ) ) ( not ( = ?auto_352954 ?auto_352955 ) ) ( not ( = ?auto_352954 ?auto_352957 ) ) ( not ( = ?auto_352954 ?auto_352958 ) ) ( not ( = ?auto_352954 ?auto_352959 ) ) ( not ( = ?auto_352956 ?auto_352955 ) ) ( not ( = ?auto_352956 ?auto_352957 ) ) ( not ( = ?auto_352956 ?auto_352958 ) ) ( not ( = ?auto_352956 ?auto_352959 ) ) ( not ( = ?auto_352955 ?auto_352957 ) ) ( not ( = ?auto_352955 ?auto_352958 ) ) ( not ( = ?auto_352955 ?auto_352959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_352957 ?auto_352958 ?auto_352959 )
      ( MAKE-7CRATE-VERIFY ?auto_352952 ?auto_352953 ?auto_352954 ?auto_352956 ?auto_352955 ?auto_352957 ?auto_352958 ?auto_352959 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353022 - SURFACE
      ?auto_353023 - SURFACE
      ?auto_353024 - SURFACE
      ?auto_353026 - SURFACE
      ?auto_353025 - SURFACE
      ?auto_353027 - SURFACE
      ?auto_353028 - SURFACE
      ?auto_353029 - SURFACE
    )
    :vars
    (
      ?auto_353030 - HOIST
      ?auto_353031 - PLACE
      ?auto_353032 - TRUCK
      ?auto_353034 - PLACE
      ?auto_353033 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_353030 ?auto_353031 ) ( SURFACE-AT ?auto_353028 ?auto_353031 ) ( CLEAR ?auto_353028 ) ( IS-CRATE ?auto_353029 ) ( not ( = ?auto_353028 ?auto_353029 ) ) ( AVAILABLE ?auto_353030 ) ( ON ?auto_353028 ?auto_353027 ) ( not ( = ?auto_353027 ?auto_353028 ) ) ( not ( = ?auto_353027 ?auto_353029 ) ) ( TRUCK-AT ?auto_353032 ?auto_353034 ) ( not ( = ?auto_353034 ?auto_353031 ) ) ( HOIST-AT ?auto_353033 ?auto_353034 ) ( LIFTING ?auto_353033 ?auto_353029 ) ( not ( = ?auto_353030 ?auto_353033 ) ) ( ON ?auto_353023 ?auto_353022 ) ( ON ?auto_353024 ?auto_353023 ) ( ON ?auto_353026 ?auto_353024 ) ( ON ?auto_353025 ?auto_353026 ) ( ON ?auto_353027 ?auto_353025 ) ( not ( = ?auto_353022 ?auto_353023 ) ) ( not ( = ?auto_353022 ?auto_353024 ) ) ( not ( = ?auto_353022 ?auto_353026 ) ) ( not ( = ?auto_353022 ?auto_353025 ) ) ( not ( = ?auto_353022 ?auto_353027 ) ) ( not ( = ?auto_353022 ?auto_353028 ) ) ( not ( = ?auto_353022 ?auto_353029 ) ) ( not ( = ?auto_353023 ?auto_353024 ) ) ( not ( = ?auto_353023 ?auto_353026 ) ) ( not ( = ?auto_353023 ?auto_353025 ) ) ( not ( = ?auto_353023 ?auto_353027 ) ) ( not ( = ?auto_353023 ?auto_353028 ) ) ( not ( = ?auto_353023 ?auto_353029 ) ) ( not ( = ?auto_353024 ?auto_353026 ) ) ( not ( = ?auto_353024 ?auto_353025 ) ) ( not ( = ?auto_353024 ?auto_353027 ) ) ( not ( = ?auto_353024 ?auto_353028 ) ) ( not ( = ?auto_353024 ?auto_353029 ) ) ( not ( = ?auto_353026 ?auto_353025 ) ) ( not ( = ?auto_353026 ?auto_353027 ) ) ( not ( = ?auto_353026 ?auto_353028 ) ) ( not ( = ?auto_353026 ?auto_353029 ) ) ( not ( = ?auto_353025 ?auto_353027 ) ) ( not ( = ?auto_353025 ?auto_353028 ) ) ( not ( = ?auto_353025 ?auto_353029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353027 ?auto_353028 ?auto_353029 )
      ( MAKE-7CRATE-VERIFY ?auto_353022 ?auto_353023 ?auto_353024 ?auto_353026 ?auto_353025 ?auto_353027 ?auto_353028 ?auto_353029 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353099 - SURFACE
      ?auto_353100 - SURFACE
      ?auto_353101 - SURFACE
      ?auto_353103 - SURFACE
      ?auto_353102 - SURFACE
      ?auto_353104 - SURFACE
      ?auto_353105 - SURFACE
      ?auto_353106 - SURFACE
    )
    :vars
    (
      ?auto_353107 - HOIST
      ?auto_353110 - PLACE
      ?auto_353111 - TRUCK
      ?auto_353109 - PLACE
      ?auto_353112 - HOIST
      ?auto_353108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353107 ?auto_353110 ) ( SURFACE-AT ?auto_353105 ?auto_353110 ) ( CLEAR ?auto_353105 ) ( IS-CRATE ?auto_353106 ) ( not ( = ?auto_353105 ?auto_353106 ) ) ( AVAILABLE ?auto_353107 ) ( ON ?auto_353105 ?auto_353104 ) ( not ( = ?auto_353104 ?auto_353105 ) ) ( not ( = ?auto_353104 ?auto_353106 ) ) ( TRUCK-AT ?auto_353111 ?auto_353109 ) ( not ( = ?auto_353109 ?auto_353110 ) ) ( HOIST-AT ?auto_353112 ?auto_353109 ) ( not ( = ?auto_353107 ?auto_353112 ) ) ( AVAILABLE ?auto_353112 ) ( SURFACE-AT ?auto_353106 ?auto_353109 ) ( ON ?auto_353106 ?auto_353108 ) ( CLEAR ?auto_353106 ) ( not ( = ?auto_353105 ?auto_353108 ) ) ( not ( = ?auto_353106 ?auto_353108 ) ) ( not ( = ?auto_353104 ?auto_353108 ) ) ( ON ?auto_353100 ?auto_353099 ) ( ON ?auto_353101 ?auto_353100 ) ( ON ?auto_353103 ?auto_353101 ) ( ON ?auto_353102 ?auto_353103 ) ( ON ?auto_353104 ?auto_353102 ) ( not ( = ?auto_353099 ?auto_353100 ) ) ( not ( = ?auto_353099 ?auto_353101 ) ) ( not ( = ?auto_353099 ?auto_353103 ) ) ( not ( = ?auto_353099 ?auto_353102 ) ) ( not ( = ?auto_353099 ?auto_353104 ) ) ( not ( = ?auto_353099 ?auto_353105 ) ) ( not ( = ?auto_353099 ?auto_353106 ) ) ( not ( = ?auto_353099 ?auto_353108 ) ) ( not ( = ?auto_353100 ?auto_353101 ) ) ( not ( = ?auto_353100 ?auto_353103 ) ) ( not ( = ?auto_353100 ?auto_353102 ) ) ( not ( = ?auto_353100 ?auto_353104 ) ) ( not ( = ?auto_353100 ?auto_353105 ) ) ( not ( = ?auto_353100 ?auto_353106 ) ) ( not ( = ?auto_353100 ?auto_353108 ) ) ( not ( = ?auto_353101 ?auto_353103 ) ) ( not ( = ?auto_353101 ?auto_353102 ) ) ( not ( = ?auto_353101 ?auto_353104 ) ) ( not ( = ?auto_353101 ?auto_353105 ) ) ( not ( = ?auto_353101 ?auto_353106 ) ) ( not ( = ?auto_353101 ?auto_353108 ) ) ( not ( = ?auto_353103 ?auto_353102 ) ) ( not ( = ?auto_353103 ?auto_353104 ) ) ( not ( = ?auto_353103 ?auto_353105 ) ) ( not ( = ?auto_353103 ?auto_353106 ) ) ( not ( = ?auto_353103 ?auto_353108 ) ) ( not ( = ?auto_353102 ?auto_353104 ) ) ( not ( = ?auto_353102 ?auto_353105 ) ) ( not ( = ?auto_353102 ?auto_353106 ) ) ( not ( = ?auto_353102 ?auto_353108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353104 ?auto_353105 ?auto_353106 )
      ( MAKE-7CRATE-VERIFY ?auto_353099 ?auto_353100 ?auto_353101 ?auto_353103 ?auto_353102 ?auto_353104 ?auto_353105 ?auto_353106 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353177 - SURFACE
      ?auto_353178 - SURFACE
      ?auto_353179 - SURFACE
      ?auto_353181 - SURFACE
      ?auto_353180 - SURFACE
      ?auto_353182 - SURFACE
      ?auto_353183 - SURFACE
      ?auto_353184 - SURFACE
    )
    :vars
    (
      ?auto_353188 - HOIST
      ?auto_353187 - PLACE
      ?auto_353185 - PLACE
      ?auto_353190 - HOIST
      ?auto_353186 - SURFACE
      ?auto_353189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353188 ?auto_353187 ) ( SURFACE-AT ?auto_353183 ?auto_353187 ) ( CLEAR ?auto_353183 ) ( IS-CRATE ?auto_353184 ) ( not ( = ?auto_353183 ?auto_353184 ) ) ( AVAILABLE ?auto_353188 ) ( ON ?auto_353183 ?auto_353182 ) ( not ( = ?auto_353182 ?auto_353183 ) ) ( not ( = ?auto_353182 ?auto_353184 ) ) ( not ( = ?auto_353185 ?auto_353187 ) ) ( HOIST-AT ?auto_353190 ?auto_353185 ) ( not ( = ?auto_353188 ?auto_353190 ) ) ( AVAILABLE ?auto_353190 ) ( SURFACE-AT ?auto_353184 ?auto_353185 ) ( ON ?auto_353184 ?auto_353186 ) ( CLEAR ?auto_353184 ) ( not ( = ?auto_353183 ?auto_353186 ) ) ( not ( = ?auto_353184 ?auto_353186 ) ) ( not ( = ?auto_353182 ?auto_353186 ) ) ( TRUCK-AT ?auto_353189 ?auto_353187 ) ( ON ?auto_353178 ?auto_353177 ) ( ON ?auto_353179 ?auto_353178 ) ( ON ?auto_353181 ?auto_353179 ) ( ON ?auto_353180 ?auto_353181 ) ( ON ?auto_353182 ?auto_353180 ) ( not ( = ?auto_353177 ?auto_353178 ) ) ( not ( = ?auto_353177 ?auto_353179 ) ) ( not ( = ?auto_353177 ?auto_353181 ) ) ( not ( = ?auto_353177 ?auto_353180 ) ) ( not ( = ?auto_353177 ?auto_353182 ) ) ( not ( = ?auto_353177 ?auto_353183 ) ) ( not ( = ?auto_353177 ?auto_353184 ) ) ( not ( = ?auto_353177 ?auto_353186 ) ) ( not ( = ?auto_353178 ?auto_353179 ) ) ( not ( = ?auto_353178 ?auto_353181 ) ) ( not ( = ?auto_353178 ?auto_353180 ) ) ( not ( = ?auto_353178 ?auto_353182 ) ) ( not ( = ?auto_353178 ?auto_353183 ) ) ( not ( = ?auto_353178 ?auto_353184 ) ) ( not ( = ?auto_353178 ?auto_353186 ) ) ( not ( = ?auto_353179 ?auto_353181 ) ) ( not ( = ?auto_353179 ?auto_353180 ) ) ( not ( = ?auto_353179 ?auto_353182 ) ) ( not ( = ?auto_353179 ?auto_353183 ) ) ( not ( = ?auto_353179 ?auto_353184 ) ) ( not ( = ?auto_353179 ?auto_353186 ) ) ( not ( = ?auto_353181 ?auto_353180 ) ) ( not ( = ?auto_353181 ?auto_353182 ) ) ( not ( = ?auto_353181 ?auto_353183 ) ) ( not ( = ?auto_353181 ?auto_353184 ) ) ( not ( = ?auto_353181 ?auto_353186 ) ) ( not ( = ?auto_353180 ?auto_353182 ) ) ( not ( = ?auto_353180 ?auto_353183 ) ) ( not ( = ?auto_353180 ?auto_353184 ) ) ( not ( = ?auto_353180 ?auto_353186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353182 ?auto_353183 ?auto_353184 )
      ( MAKE-7CRATE-VERIFY ?auto_353177 ?auto_353178 ?auto_353179 ?auto_353181 ?auto_353180 ?auto_353182 ?auto_353183 ?auto_353184 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353255 - SURFACE
      ?auto_353256 - SURFACE
      ?auto_353257 - SURFACE
      ?auto_353259 - SURFACE
      ?auto_353258 - SURFACE
      ?auto_353260 - SURFACE
      ?auto_353261 - SURFACE
      ?auto_353262 - SURFACE
    )
    :vars
    (
      ?auto_353267 - HOIST
      ?auto_353268 - PLACE
      ?auto_353266 - PLACE
      ?auto_353263 - HOIST
      ?auto_353265 - SURFACE
      ?auto_353264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353267 ?auto_353268 ) ( IS-CRATE ?auto_353262 ) ( not ( = ?auto_353261 ?auto_353262 ) ) ( not ( = ?auto_353260 ?auto_353261 ) ) ( not ( = ?auto_353260 ?auto_353262 ) ) ( not ( = ?auto_353266 ?auto_353268 ) ) ( HOIST-AT ?auto_353263 ?auto_353266 ) ( not ( = ?auto_353267 ?auto_353263 ) ) ( AVAILABLE ?auto_353263 ) ( SURFACE-AT ?auto_353262 ?auto_353266 ) ( ON ?auto_353262 ?auto_353265 ) ( CLEAR ?auto_353262 ) ( not ( = ?auto_353261 ?auto_353265 ) ) ( not ( = ?auto_353262 ?auto_353265 ) ) ( not ( = ?auto_353260 ?auto_353265 ) ) ( TRUCK-AT ?auto_353264 ?auto_353268 ) ( SURFACE-AT ?auto_353260 ?auto_353268 ) ( CLEAR ?auto_353260 ) ( LIFTING ?auto_353267 ?auto_353261 ) ( IS-CRATE ?auto_353261 ) ( ON ?auto_353256 ?auto_353255 ) ( ON ?auto_353257 ?auto_353256 ) ( ON ?auto_353259 ?auto_353257 ) ( ON ?auto_353258 ?auto_353259 ) ( ON ?auto_353260 ?auto_353258 ) ( not ( = ?auto_353255 ?auto_353256 ) ) ( not ( = ?auto_353255 ?auto_353257 ) ) ( not ( = ?auto_353255 ?auto_353259 ) ) ( not ( = ?auto_353255 ?auto_353258 ) ) ( not ( = ?auto_353255 ?auto_353260 ) ) ( not ( = ?auto_353255 ?auto_353261 ) ) ( not ( = ?auto_353255 ?auto_353262 ) ) ( not ( = ?auto_353255 ?auto_353265 ) ) ( not ( = ?auto_353256 ?auto_353257 ) ) ( not ( = ?auto_353256 ?auto_353259 ) ) ( not ( = ?auto_353256 ?auto_353258 ) ) ( not ( = ?auto_353256 ?auto_353260 ) ) ( not ( = ?auto_353256 ?auto_353261 ) ) ( not ( = ?auto_353256 ?auto_353262 ) ) ( not ( = ?auto_353256 ?auto_353265 ) ) ( not ( = ?auto_353257 ?auto_353259 ) ) ( not ( = ?auto_353257 ?auto_353258 ) ) ( not ( = ?auto_353257 ?auto_353260 ) ) ( not ( = ?auto_353257 ?auto_353261 ) ) ( not ( = ?auto_353257 ?auto_353262 ) ) ( not ( = ?auto_353257 ?auto_353265 ) ) ( not ( = ?auto_353259 ?auto_353258 ) ) ( not ( = ?auto_353259 ?auto_353260 ) ) ( not ( = ?auto_353259 ?auto_353261 ) ) ( not ( = ?auto_353259 ?auto_353262 ) ) ( not ( = ?auto_353259 ?auto_353265 ) ) ( not ( = ?auto_353258 ?auto_353260 ) ) ( not ( = ?auto_353258 ?auto_353261 ) ) ( not ( = ?auto_353258 ?auto_353262 ) ) ( not ( = ?auto_353258 ?auto_353265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353260 ?auto_353261 ?auto_353262 )
      ( MAKE-7CRATE-VERIFY ?auto_353255 ?auto_353256 ?auto_353257 ?auto_353259 ?auto_353258 ?auto_353260 ?auto_353261 ?auto_353262 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353333 - SURFACE
      ?auto_353334 - SURFACE
      ?auto_353335 - SURFACE
      ?auto_353337 - SURFACE
      ?auto_353336 - SURFACE
      ?auto_353338 - SURFACE
      ?auto_353339 - SURFACE
      ?auto_353340 - SURFACE
    )
    :vars
    (
      ?auto_353342 - HOIST
      ?auto_353346 - PLACE
      ?auto_353344 - PLACE
      ?auto_353345 - HOIST
      ?auto_353341 - SURFACE
      ?auto_353343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353342 ?auto_353346 ) ( IS-CRATE ?auto_353340 ) ( not ( = ?auto_353339 ?auto_353340 ) ) ( not ( = ?auto_353338 ?auto_353339 ) ) ( not ( = ?auto_353338 ?auto_353340 ) ) ( not ( = ?auto_353344 ?auto_353346 ) ) ( HOIST-AT ?auto_353345 ?auto_353344 ) ( not ( = ?auto_353342 ?auto_353345 ) ) ( AVAILABLE ?auto_353345 ) ( SURFACE-AT ?auto_353340 ?auto_353344 ) ( ON ?auto_353340 ?auto_353341 ) ( CLEAR ?auto_353340 ) ( not ( = ?auto_353339 ?auto_353341 ) ) ( not ( = ?auto_353340 ?auto_353341 ) ) ( not ( = ?auto_353338 ?auto_353341 ) ) ( TRUCK-AT ?auto_353343 ?auto_353346 ) ( SURFACE-AT ?auto_353338 ?auto_353346 ) ( CLEAR ?auto_353338 ) ( IS-CRATE ?auto_353339 ) ( AVAILABLE ?auto_353342 ) ( IN ?auto_353339 ?auto_353343 ) ( ON ?auto_353334 ?auto_353333 ) ( ON ?auto_353335 ?auto_353334 ) ( ON ?auto_353337 ?auto_353335 ) ( ON ?auto_353336 ?auto_353337 ) ( ON ?auto_353338 ?auto_353336 ) ( not ( = ?auto_353333 ?auto_353334 ) ) ( not ( = ?auto_353333 ?auto_353335 ) ) ( not ( = ?auto_353333 ?auto_353337 ) ) ( not ( = ?auto_353333 ?auto_353336 ) ) ( not ( = ?auto_353333 ?auto_353338 ) ) ( not ( = ?auto_353333 ?auto_353339 ) ) ( not ( = ?auto_353333 ?auto_353340 ) ) ( not ( = ?auto_353333 ?auto_353341 ) ) ( not ( = ?auto_353334 ?auto_353335 ) ) ( not ( = ?auto_353334 ?auto_353337 ) ) ( not ( = ?auto_353334 ?auto_353336 ) ) ( not ( = ?auto_353334 ?auto_353338 ) ) ( not ( = ?auto_353334 ?auto_353339 ) ) ( not ( = ?auto_353334 ?auto_353340 ) ) ( not ( = ?auto_353334 ?auto_353341 ) ) ( not ( = ?auto_353335 ?auto_353337 ) ) ( not ( = ?auto_353335 ?auto_353336 ) ) ( not ( = ?auto_353335 ?auto_353338 ) ) ( not ( = ?auto_353335 ?auto_353339 ) ) ( not ( = ?auto_353335 ?auto_353340 ) ) ( not ( = ?auto_353335 ?auto_353341 ) ) ( not ( = ?auto_353337 ?auto_353336 ) ) ( not ( = ?auto_353337 ?auto_353338 ) ) ( not ( = ?auto_353337 ?auto_353339 ) ) ( not ( = ?auto_353337 ?auto_353340 ) ) ( not ( = ?auto_353337 ?auto_353341 ) ) ( not ( = ?auto_353336 ?auto_353338 ) ) ( not ( = ?auto_353336 ?auto_353339 ) ) ( not ( = ?auto_353336 ?auto_353340 ) ) ( not ( = ?auto_353336 ?auto_353341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353338 ?auto_353339 ?auto_353340 )
      ( MAKE-7CRATE-VERIFY ?auto_353333 ?auto_353334 ?auto_353335 ?auto_353337 ?auto_353336 ?auto_353338 ?auto_353339 ?auto_353340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_353347 - SURFACE
      ?auto_353348 - SURFACE
    )
    :vars
    (
      ?auto_353350 - HOIST
      ?auto_353355 - PLACE
      ?auto_353353 - SURFACE
      ?auto_353352 - PLACE
      ?auto_353354 - HOIST
      ?auto_353349 - SURFACE
      ?auto_353351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353350 ?auto_353355 ) ( IS-CRATE ?auto_353348 ) ( not ( = ?auto_353347 ?auto_353348 ) ) ( not ( = ?auto_353353 ?auto_353347 ) ) ( not ( = ?auto_353353 ?auto_353348 ) ) ( not ( = ?auto_353352 ?auto_353355 ) ) ( HOIST-AT ?auto_353354 ?auto_353352 ) ( not ( = ?auto_353350 ?auto_353354 ) ) ( AVAILABLE ?auto_353354 ) ( SURFACE-AT ?auto_353348 ?auto_353352 ) ( ON ?auto_353348 ?auto_353349 ) ( CLEAR ?auto_353348 ) ( not ( = ?auto_353347 ?auto_353349 ) ) ( not ( = ?auto_353348 ?auto_353349 ) ) ( not ( = ?auto_353353 ?auto_353349 ) ) ( SURFACE-AT ?auto_353353 ?auto_353355 ) ( CLEAR ?auto_353353 ) ( IS-CRATE ?auto_353347 ) ( AVAILABLE ?auto_353350 ) ( IN ?auto_353347 ?auto_353351 ) ( TRUCK-AT ?auto_353351 ?auto_353352 ) )
    :subtasks
    ( ( !DRIVE ?auto_353351 ?auto_353352 ?auto_353355 )
      ( MAKE-2CRATE ?auto_353353 ?auto_353347 ?auto_353348 )
      ( MAKE-1CRATE-VERIFY ?auto_353347 ?auto_353348 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_353356 - SURFACE
      ?auto_353357 - SURFACE
      ?auto_353358 - SURFACE
    )
    :vars
    (
      ?auto_353362 - HOIST
      ?auto_353361 - PLACE
      ?auto_353364 - PLACE
      ?auto_353359 - HOIST
      ?auto_353363 - SURFACE
      ?auto_353360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353362 ?auto_353361 ) ( IS-CRATE ?auto_353358 ) ( not ( = ?auto_353357 ?auto_353358 ) ) ( not ( = ?auto_353356 ?auto_353357 ) ) ( not ( = ?auto_353356 ?auto_353358 ) ) ( not ( = ?auto_353364 ?auto_353361 ) ) ( HOIST-AT ?auto_353359 ?auto_353364 ) ( not ( = ?auto_353362 ?auto_353359 ) ) ( AVAILABLE ?auto_353359 ) ( SURFACE-AT ?auto_353358 ?auto_353364 ) ( ON ?auto_353358 ?auto_353363 ) ( CLEAR ?auto_353358 ) ( not ( = ?auto_353357 ?auto_353363 ) ) ( not ( = ?auto_353358 ?auto_353363 ) ) ( not ( = ?auto_353356 ?auto_353363 ) ) ( SURFACE-AT ?auto_353356 ?auto_353361 ) ( CLEAR ?auto_353356 ) ( IS-CRATE ?auto_353357 ) ( AVAILABLE ?auto_353362 ) ( IN ?auto_353357 ?auto_353360 ) ( TRUCK-AT ?auto_353360 ?auto_353364 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353357 ?auto_353358 )
      ( MAKE-2CRATE-VERIFY ?auto_353356 ?auto_353357 ?auto_353358 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_353365 - SURFACE
      ?auto_353366 - SURFACE
      ?auto_353367 - SURFACE
      ?auto_353368 - SURFACE
    )
    :vars
    (
      ?auto_353374 - HOIST
      ?auto_353370 - PLACE
      ?auto_353371 - PLACE
      ?auto_353372 - HOIST
      ?auto_353369 - SURFACE
      ?auto_353373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353374 ?auto_353370 ) ( IS-CRATE ?auto_353368 ) ( not ( = ?auto_353367 ?auto_353368 ) ) ( not ( = ?auto_353366 ?auto_353367 ) ) ( not ( = ?auto_353366 ?auto_353368 ) ) ( not ( = ?auto_353371 ?auto_353370 ) ) ( HOIST-AT ?auto_353372 ?auto_353371 ) ( not ( = ?auto_353374 ?auto_353372 ) ) ( AVAILABLE ?auto_353372 ) ( SURFACE-AT ?auto_353368 ?auto_353371 ) ( ON ?auto_353368 ?auto_353369 ) ( CLEAR ?auto_353368 ) ( not ( = ?auto_353367 ?auto_353369 ) ) ( not ( = ?auto_353368 ?auto_353369 ) ) ( not ( = ?auto_353366 ?auto_353369 ) ) ( SURFACE-AT ?auto_353366 ?auto_353370 ) ( CLEAR ?auto_353366 ) ( IS-CRATE ?auto_353367 ) ( AVAILABLE ?auto_353374 ) ( IN ?auto_353367 ?auto_353373 ) ( TRUCK-AT ?auto_353373 ?auto_353371 ) ( ON ?auto_353366 ?auto_353365 ) ( not ( = ?auto_353365 ?auto_353366 ) ) ( not ( = ?auto_353365 ?auto_353367 ) ) ( not ( = ?auto_353365 ?auto_353368 ) ) ( not ( = ?auto_353365 ?auto_353369 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353366 ?auto_353367 ?auto_353368 )
      ( MAKE-3CRATE-VERIFY ?auto_353365 ?auto_353366 ?auto_353367 ?auto_353368 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_353375 - SURFACE
      ?auto_353376 - SURFACE
      ?auto_353377 - SURFACE
      ?auto_353379 - SURFACE
      ?auto_353378 - SURFACE
    )
    :vars
    (
      ?auto_353385 - HOIST
      ?auto_353381 - PLACE
      ?auto_353382 - PLACE
      ?auto_353383 - HOIST
      ?auto_353380 - SURFACE
      ?auto_353384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353385 ?auto_353381 ) ( IS-CRATE ?auto_353378 ) ( not ( = ?auto_353379 ?auto_353378 ) ) ( not ( = ?auto_353377 ?auto_353379 ) ) ( not ( = ?auto_353377 ?auto_353378 ) ) ( not ( = ?auto_353382 ?auto_353381 ) ) ( HOIST-AT ?auto_353383 ?auto_353382 ) ( not ( = ?auto_353385 ?auto_353383 ) ) ( AVAILABLE ?auto_353383 ) ( SURFACE-AT ?auto_353378 ?auto_353382 ) ( ON ?auto_353378 ?auto_353380 ) ( CLEAR ?auto_353378 ) ( not ( = ?auto_353379 ?auto_353380 ) ) ( not ( = ?auto_353378 ?auto_353380 ) ) ( not ( = ?auto_353377 ?auto_353380 ) ) ( SURFACE-AT ?auto_353377 ?auto_353381 ) ( CLEAR ?auto_353377 ) ( IS-CRATE ?auto_353379 ) ( AVAILABLE ?auto_353385 ) ( IN ?auto_353379 ?auto_353384 ) ( TRUCK-AT ?auto_353384 ?auto_353382 ) ( ON ?auto_353376 ?auto_353375 ) ( ON ?auto_353377 ?auto_353376 ) ( not ( = ?auto_353375 ?auto_353376 ) ) ( not ( = ?auto_353375 ?auto_353377 ) ) ( not ( = ?auto_353375 ?auto_353379 ) ) ( not ( = ?auto_353375 ?auto_353378 ) ) ( not ( = ?auto_353375 ?auto_353380 ) ) ( not ( = ?auto_353376 ?auto_353377 ) ) ( not ( = ?auto_353376 ?auto_353379 ) ) ( not ( = ?auto_353376 ?auto_353378 ) ) ( not ( = ?auto_353376 ?auto_353380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353377 ?auto_353379 ?auto_353378 )
      ( MAKE-4CRATE-VERIFY ?auto_353375 ?auto_353376 ?auto_353377 ?auto_353379 ?auto_353378 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_353386 - SURFACE
      ?auto_353387 - SURFACE
      ?auto_353388 - SURFACE
      ?auto_353390 - SURFACE
      ?auto_353389 - SURFACE
      ?auto_353391 - SURFACE
    )
    :vars
    (
      ?auto_353397 - HOIST
      ?auto_353393 - PLACE
      ?auto_353394 - PLACE
      ?auto_353395 - HOIST
      ?auto_353392 - SURFACE
      ?auto_353396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353397 ?auto_353393 ) ( IS-CRATE ?auto_353391 ) ( not ( = ?auto_353389 ?auto_353391 ) ) ( not ( = ?auto_353390 ?auto_353389 ) ) ( not ( = ?auto_353390 ?auto_353391 ) ) ( not ( = ?auto_353394 ?auto_353393 ) ) ( HOIST-AT ?auto_353395 ?auto_353394 ) ( not ( = ?auto_353397 ?auto_353395 ) ) ( AVAILABLE ?auto_353395 ) ( SURFACE-AT ?auto_353391 ?auto_353394 ) ( ON ?auto_353391 ?auto_353392 ) ( CLEAR ?auto_353391 ) ( not ( = ?auto_353389 ?auto_353392 ) ) ( not ( = ?auto_353391 ?auto_353392 ) ) ( not ( = ?auto_353390 ?auto_353392 ) ) ( SURFACE-AT ?auto_353390 ?auto_353393 ) ( CLEAR ?auto_353390 ) ( IS-CRATE ?auto_353389 ) ( AVAILABLE ?auto_353397 ) ( IN ?auto_353389 ?auto_353396 ) ( TRUCK-AT ?auto_353396 ?auto_353394 ) ( ON ?auto_353387 ?auto_353386 ) ( ON ?auto_353388 ?auto_353387 ) ( ON ?auto_353390 ?auto_353388 ) ( not ( = ?auto_353386 ?auto_353387 ) ) ( not ( = ?auto_353386 ?auto_353388 ) ) ( not ( = ?auto_353386 ?auto_353390 ) ) ( not ( = ?auto_353386 ?auto_353389 ) ) ( not ( = ?auto_353386 ?auto_353391 ) ) ( not ( = ?auto_353386 ?auto_353392 ) ) ( not ( = ?auto_353387 ?auto_353388 ) ) ( not ( = ?auto_353387 ?auto_353390 ) ) ( not ( = ?auto_353387 ?auto_353389 ) ) ( not ( = ?auto_353387 ?auto_353391 ) ) ( not ( = ?auto_353387 ?auto_353392 ) ) ( not ( = ?auto_353388 ?auto_353390 ) ) ( not ( = ?auto_353388 ?auto_353389 ) ) ( not ( = ?auto_353388 ?auto_353391 ) ) ( not ( = ?auto_353388 ?auto_353392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353390 ?auto_353389 ?auto_353391 )
      ( MAKE-5CRATE-VERIFY ?auto_353386 ?auto_353387 ?auto_353388 ?auto_353390 ?auto_353389 ?auto_353391 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_353398 - SURFACE
      ?auto_353399 - SURFACE
      ?auto_353400 - SURFACE
      ?auto_353402 - SURFACE
      ?auto_353401 - SURFACE
      ?auto_353403 - SURFACE
      ?auto_353404 - SURFACE
    )
    :vars
    (
      ?auto_353410 - HOIST
      ?auto_353406 - PLACE
      ?auto_353407 - PLACE
      ?auto_353408 - HOIST
      ?auto_353405 - SURFACE
      ?auto_353409 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353410 ?auto_353406 ) ( IS-CRATE ?auto_353404 ) ( not ( = ?auto_353403 ?auto_353404 ) ) ( not ( = ?auto_353401 ?auto_353403 ) ) ( not ( = ?auto_353401 ?auto_353404 ) ) ( not ( = ?auto_353407 ?auto_353406 ) ) ( HOIST-AT ?auto_353408 ?auto_353407 ) ( not ( = ?auto_353410 ?auto_353408 ) ) ( AVAILABLE ?auto_353408 ) ( SURFACE-AT ?auto_353404 ?auto_353407 ) ( ON ?auto_353404 ?auto_353405 ) ( CLEAR ?auto_353404 ) ( not ( = ?auto_353403 ?auto_353405 ) ) ( not ( = ?auto_353404 ?auto_353405 ) ) ( not ( = ?auto_353401 ?auto_353405 ) ) ( SURFACE-AT ?auto_353401 ?auto_353406 ) ( CLEAR ?auto_353401 ) ( IS-CRATE ?auto_353403 ) ( AVAILABLE ?auto_353410 ) ( IN ?auto_353403 ?auto_353409 ) ( TRUCK-AT ?auto_353409 ?auto_353407 ) ( ON ?auto_353399 ?auto_353398 ) ( ON ?auto_353400 ?auto_353399 ) ( ON ?auto_353402 ?auto_353400 ) ( ON ?auto_353401 ?auto_353402 ) ( not ( = ?auto_353398 ?auto_353399 ) ) ( not ( = ?auto_353398 ?auto_353400 ) ) ( not ( = ?auto_353398 ?auto_353402 ) ) ( not ( = ?auto_353398 ?auto_353401 ) ) ( not ( = ?auto_353398 ?auto_353403 ) ) ( not ( = ?auto_353398 ?auto_353404 ) ) ( not ( = ?auto_353398 ?auto_353405 ) ) ( not ( = ?auto_353399 ?auto_353400 ) ) ( not ( = ?auto_353399 ?auto_353402 ) ) ( not ( = ?auto_353399 ?auto_353401 ) ) ( not ( = ?auto_353399 ?auto_353403 ) ) ( not ( = ?auto_353399 ?auto_353404 ) ) ( not ( = ?auto_353399 ?auto_353405 ) ) ( not ( = ?auto_353400 ?auto_353402 ) ) ( not ( = ?auto_353400 ?auto_353401 ) ) ( not ( = ?auto_353400 ?auto_353403 ) ) ( not ( = ?auto_353400 ?auto_353404 ) ) ( not ( = ?auto_353400 ?auto_353405 ) ) ( not ( = ?auto_353402 ?auto_353401 ) ) ( not ( = ?auto_353402 ?auto_353403 ) ) ( not ( = ?auto_353402 ?auto_353404 ) ) ( not ( = ?auto_353402 ?auto_353405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353401 ?auto_353403 ?auto_353404 )
      ( MAKE-6CRATE-VERIFY ?auto_353398 ?auto_353399 ?auto_353400 ?auto_353402 ?auto_353401 ?auto_353403 ?auto_353404 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353411 - SURFACE
      ?auto_353412 - SURFACE
      ?auto_353413 - SURFACE
      ?auto_353415 - SURFACE
      ?auto_353414 - SURFACE
      ?auto_353416 - SURFACE
      ?auto_353417 - SURFACE
      ?auto_353418 - SURFACE
    )
    :vars
    (
      ?auto_353424 - HOIST
      ?auto_353420 - PLACE
      ?auto_353421 - PLACE
      ?auto_353422 - HOIST
      ?auto_353419 - SURFACE
      ?auto_353423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353424 ?auto_353420 ) ( IS-CRATE ?auto_353418 ) ( not ( = ?auto_353417 ?auto_353418 ) ) ( not ( = ?auto_353416 ?auto_353417 ) ) ( not ( = ?auto_353416 ?auto_353418 ) ) ( not ( = ?auto_353421 ?auto_353420 ) ) ( HOIST-AT ?auto_353422 ?auto_353421 ) ( not ( = ?auto_353424 ?auto_353422 ) ) ( AVAILABLE ?auto_353422 ) ( SURFACE-AT ?auto_353418 ?auto_353421 ) ( ON ?auto_353418 ?auto_353419 ) ( CLEAR ?auto_353418 ) ( not ( = ?auto_353417 ?auto_353419 ) ) ( not ( = ?auto_353418 ?auto_353419 ) ) ( not ( = ?auto_353416 ?auto_353419 ) ) ( SURFACE-AT ?auto_353416 ?auto_353420 ) ( CLEAR ?auto_353416 ) ( IS-CRATE ?auto_353417 ) ( AVAILABLE ?auto_353424 ) ( IN ?auto_353417 ?auto_353423 ) ( TRUCK-AT ?auto_353423 ?auto_353421 ) ( ON ?auto_353412 ?auto_353411 ) ( ON ?auto_353413 ?auto_353412 ) ( ON ?auto_353415 ?auto_353413 ) ( ON ?auto_353414 ?auto_353415 ) ( ON ?auto_353416 ?auto_353414 ) ( not ( = ?auto_353411 ?auto_353412 ) ) ( not ( = ?auto_353411 ?auto_353413 ) ) ( not ( = ?auto_353411 ?auto_353415 ) ) ( not ( = ?auto_353411 ?auto_353414 ) ) ( not ( = ?auto_353411 ?auto_353416 ) ) ( not ( = ?auto_353411 ?auto_353417 ) ) ( not ( = ?auto_353411 ?auto_353418 ) ) ( not ( = ?auto_353411 ?auto_353419 ) ) ( not ( = ?auto_353412 ?auto_353413 ) ) ( not ( = ?auto_353412 ?auto_353415 ) ) ( not ( = ?auto_353412 ?auto_353414 ) ) ( not ( = ?auto_353412 ?auto_353416 ) ) ( not ( = ?auto_353412 ?auto_353417 ) ) ( not ( = ?auto_353412 ?auto_353418 ) ) ( not ( = ?auto_353412 ?auto_353419 ) ) ( not ( = ?auto_353413 ?auto_353415 ) ) ( not ( = ?auto_353413 ?auto_353414 ) ) ( not ( = ?auto_353413 ?auto_353416 ) ) ( not ( = ?auto_353413 ?auto_353417 ) ) ( not ( = ?auto_353413 ?auto_353418 ) ) ( not ( = ?auto_353413 ?auto_353419 ) ) ( not ( = ?auto_353415 ?auto_353414 ) ) ( not ( = ?auto_353415 ?auto_353416 ) ) ( not ( = ?auto_353415 ?auto_353417 ) ) ( not ( = ?auto_353415 ?auto_353418 ) ) ( not ( = ?auto_353415 ?auto_353419 ) ) ( not ( = ?auto_353414 ?auto_353416 ) ) ( not ( = ?auto_353414 ?auto_353417 ) ) ( not ( = ?auto_353414 ?auto_353418 ) ) ( not ( = ?auto_353414 ?auto_353419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353416 ?auto_353417 ?auto_353418 )
      ( MAKE-7CRATE-VERIFY ?auto_353411 ?auto_353412 ?auto_353413 ?auto_353415 ?auto_353414 ?auto_353416 ?auto_353417 ?auto_353418 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_353425 - SURFACE
      ?auto_353426 - SURFACE
    )
    :vars
    (
      ?auto_353433 - HOIST
      ?auto_353428 - PLACE
      ?auto_353431 - SURFACE
      ?auto_353429 - PLACE
      ?auto_353430 - HOIST
      ?auto_353427 - SURFACE
      ?auto_353432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353433 ?auto_353428 ) ( IS-CRATE ?auto_353426 ) ( not ( = ?auto_353425 ?auto_353426 ) ) ( not ( = ?auto_353431 ?auto_353425 ) ) ( not ( = ?auto_353431 ?auto_353426 ) ) ( not ( = ?auto_353429 ?auto_353428 ) ) ( HOIST-AT ?auto_353430 ?auto_353429 ) ( not ( = ?auto_353433 ?auto_353430 ) ) ( SURFACE-AT ?auto_353426 ?auto_353429 ) ( ON ?auto_353426 ?auto_353427 ) ( CLEAR ?auto_353426 ) ( not ( = ?auto_353425 ?auto_353427 ) ) ( not ( = ?auto_353426 ?auto_353427 ) ) ( not ( = ?auto_353431 ?auto_353427 ) ) ( SURFACE-AT ?auto_353431 ?auto_353428 ) ( CLEAR ?auto_353431 ) ( IS-CRATE ?auto_353425 ) ( AVAILABLE ?auto_353433 ) ( TRUCK-AT ?auto_353432 ?auto_353429 ) ( LIFTING ?auto_353430 ?auto_353425 ) )
    :subtasks
    ( ( !LOAD ?auto_353430 ?auto_353425 ?auto_353432 ?auto_353429 )
      ( MAKE-2CRATE ?auto_353431 ?auto_353425 ?auto_353426 )
      ( MAKE-1CRATE-VERIFY ?auto_353425 ?auto_353426 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_353434 - SURFACE
      ?auto_353435 - SURFACE
      ?auto_353436 - SURFACE
    )
    :vars
    (
      ?auto_353438 - HOIST
      ?auto_353442 - PLACE
      ?auto_353437 - PLACE
      ?auto_353440 - HOIST
      ?auto_353441 - SURFACE
      ?auto_353439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353438 ?auto_353442 ) ( IS-CRATE ?auto_353436 ) ( not ( = ?auto_353435 ?auto_353436 ) ) ( not ( = ?auto_353434 ?auto_353435 ) ) ( not ( = ?auto_353434 ?auto_353436 ) ) ( not ( = ?auto_353437 ?auto_353442 ) ) ( HOIST-AT ?auto_353440 ?auto_353437 ) ( not ( = ?auto_353438 ?auto_353440 ) ) ( SURFACE-AT ?auto_353436 ?auto_353437 ) ( ON ?auto_353436 ?auto_353441 ) ( CLEAR ?auto_353436 ) ( not ( = ?auto_353435 ?auto_353441 ) ) ( not ( = ?auto_353436 ?auto_353441 ) ) ( not ( = ?auto_353434 ?auto_353441 ) ) ( SURFACE-AT ?auto_353434 ?auto_353442 ) ( CLEAR ?auto_353434 ) ( IS-CRATE ?auto_353435 ) ( AVAILABLE ?auto_353438 ) ( TRUCK-AT ?auto_353439 ?auto_353437 ) ( LIFTING ?auto_353440 ?auto_353435 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353435 ?auto_353436 )
      ( MAKE-2CRATE-VERIFY ?auto_353434 ?auto_353435 ?auto_353436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_353443 - SURFACE
      ?auto_353444 - SURFACE
      ?auto_353445 - SURFACE
      ?auto_353446 - SURFACE
    )
    :vars
    (
      ?auto_353447 - HOIST
      ?auto_353452 - PLACE
      ?auto_353449 - PLACE
      ?auto_353451 - HOIST
      ?auto_353448 - SURFACE
      ?auto_353450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353447 ?auto_353452 ) ( IS-CRATE ?auto_353446 ) ( not ( = ?auto_353445 ?auto_353446 ) ) ( not ( = ?auto_353444 ?auto_353445 ) ) ( not ( = ?auto_353444 ?auto_353446 ) ) ( not ( = ?auto_353449 ?auto_353452 ) ) ( HOIST-AT ?auto_353451 ?auto_353449 ) ( not ( = ?auto_353447 ?auto_353451 ) ) ( SURFACE-AT ?auto_353446 ?auto_353449 ) ( ON ?auto_353446 ?auto_353448 ) ( CLEAR ?auto_353446 ) ( not ( = ?auto_353445 ?auto_353448 ) ) ( not ( = ?auto_353446 ?auto_353448 ) ) ( not ( = ?auto_353444 ?auto_353448 ) ) ( SURFACE-AT ?auto_353444 ?auto_353452 ) ( CLEAR ?auto_353444 ) ( IS-CRATE ?auto_353445 ) ( AVAILABLE ?auto_353447 ) ( TRUCK-AT ?auto_353450 ?auto_353449 ) ( LIFTING ?auto_353451 ?auto_353445 ) ( ON ?auto_353444 ?auto_353443 ) ( not ( = ?auto_353443 ?auto_353444 ) ) ( not ( = ?auto_353443 ?auto_353445 ) ) ( not ( = ?auto_353443 ?auto_353446 ) ) ( not ( = ?auto_353443 ?auto_353448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353444 ?auto_353445 ?auto_353446 )
      ( MAKE-3CRATE-VERIFY ?auto_353443 ?auto_353444 ?auto_353445 ?auto_353446 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_353453 - SURFACE
      ?auto_353454 - SURFACE
      ?auto_353455 - SURFACE
      ?auto_353457 - SURFACE
      ?auto_353456 - SURFACE
    )
    :vars
    (
      ?auto_353458 - HOIST
      ?auto_353463 - PLACE
      ?auto_353460 - PLACE
      ?auto_353462 - HOIST
      ?auto_353459 - SURFACE
      ?auto_353461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353458 ?auto_353463 ) ( IS-CRATE ?auto_353456 ) ( not ( = ?auto_353457 ?auto_353456 ) ) ( not ( = ?auto_353455 ?auto_353457 ) ) ( not ( = ?auto_353455 ?auto_353456 ) ) ( not ( = ?auto_353460 ?auto_353463 ) ) ( HOIST-AT ?auto_353462 ?auto_353460 ) ( not ( = ?auto_353458 ?auto_353462 ) ) ( SURFACE-AT ?auto_353456 ?auto_353460 ) ( ON ?auto_353456 ?auto_353459 ) ( CLEAR ?auto_353456 ) ( not ( = ?auto_353457 ?auto_353459 ) ) ( not ( = ?auto_353456 ?auto_353459 ) ) ( not ( = ?auto_353455 ?auto_353459 ) ) ( SURFACE-AT ?auto_353455 ?auto_353463 ) ( CLEAR ?auto_353455 ) ( IS-CRATE ?auto_353457 ) ( AVAILABLE ?auto_353458 ) ( TRUCK-AT ?auto_353461 ?auto_353460 ) ( LIFTING ?auto_353462 ?auto_353457 ) ( ON ?auto_353454 ?auto_353453 ) ( ON ?auto_353455 ?auto_353454 ) ( not ( = ?auto_353453 ?auto_353454 ) ) ( not ( = ?auto_353453 ?auto_353455 ) ) ( not ( = ?auto_353453 ?auto_353457 ) ) ( not ( = ?auto_353453 ?auto_353456 ) ) ( not ( = ?auto_353453 ?auto_353459 ) ) ( not ( = ?auto_353454 ?auto_353455 ) ) ( not ( = ?auto_353454 ?auto_353457 ) ) ( not ( = ?auto_353454 ?auto_353456 ) ) ( not ( = ?auto_353454 ?auto_353459 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353455 ?auto_353457 ?auto_353456 )
      ( MAKE-4CRATE-VERIFY ?auto_353453 ?auto_353454 ?auto_353455 ?auto_353457 ?auto_353456 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_353464 - SURFACE
      ?auto_353465 - SURFACE
      ?auto_353466 - SURFACE
      ?auto_353468 - SURFACE
      ?auto_353467 - SURFACE
      ?auto_353469 - SURFACE
    )
    :vars
    (
      ?auto_353470 - HOIST
      ?auto_353475 - PLACE
      ?auto_353472 - PLACE
      ?auto_353474 - HOIST
      ?auto_353471 - SURFACE
      ?auto_353473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353470 ?auto_353475 ) ( IS-CRATE ?auto_353469 ) ( not ( = ?auto_353467 ?auto_353469 ) ) ( not ( = ?auto_353468 ?auto_353467 ) ) ( not ( = ?auto_353468 ?auto_353469 ) ) ( not ( = ?auto_353472 ?auto_353475 ) ) ( HOIST-AT ?auto_353474 ?auto_353472 ) ( not ( = ?auto_353470 ?auto_353474 ) ) ( SURFACE-AT ?auto_353469 ?auto_353472 ) ( ON ?auto_353469 ?auto_353471 ) ( CLEAR ?auto_353469 ) ( not ( = ?auto_353467 ?auto_353471 ) ) ( not ( = ?auto_353469 ?auto_353471 ) ) ( not ( = ?auto_353468 ?auto_353471 ) ) ( SURFACE-AT ?auto_353468 ?auto_353475 ) ( CLEAR ?auto_353468 ) ( IS-CRATE ?auto_353467 ) ( AVAILABLE ?auto_353470 ) ( TRUCK-AT ?auto_353473 ?auto_353472 ) ( LIFTING ?auto_353474 ?auto_353467 ) ( ON ?auto_353465 ?auto_353464 ) ( ON ?auto_353466 ?auto_353465 ) ( ON ?auto_353468 ?auto_353466 ) ( not ( = ?auto_353464 ?auto_353465 ) ) ( not ( = ?auto_353464 ?auto_353466 ) ) ( not ( = ?auto_353464 ?auto_353468 ) ) ( not ( = ?auto_353464 ?auto_353467 ) ) ( not ( = ?auto_353464 ?auto_353469 ) ) ( not ( = ?auto_353464 ?auto_353471 ) ) ( not ( = ?auto_353465 ?auto_353466 ) ) ( not ( = ?auto_353465 ?auto_353468 ) ) ( not ( = ?auto_353465 ?auto_353467 ) ) ( not ( = ?auto_353465 ?auto_353469 ) ) ( not ( = ?auto_353465 ?auto_353471 ) ) ( not ( = ?auto_353466 ?auto_353468 ) ) ( not ( = ?auto_353466 ?auto_353467 ) ) ( not ( = ?auto_353466 ?auto_353469 ) ) ( not ( = ?auto_353466 ?auto_353471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353468 ?auto_353467 ?auto_353469 )
      ( MAKE-5CRATE-VERIFY ?auto_353464 ?auto_353465 ?auto_353466 ?auto_353468 ?auto_353467 ?auto_353469 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_353476 - SURFACE
      ?auto_353477 - SURFACE
      ?auto_353478 - SURFACE
      ?auto_353480 - SURFACE
      ?auto_353479 - SURFACE
      ?auto_353481 - SURFACE
      ?auto_353482 - SURFACE
    )
    :vars
    (
      ?auto_353483 - HOIST
      ?auto_353488 - PLACE
      ?auto_353485 - PLACE
      ?auto_353487 - HOIST
      ?auto_353484 - SURFACE
      ?auto_353486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353483 ?auto_353488 ) ( IS-CRATE ?auto_353482 ) ( not ( = ?auto_353481 ?auto_353482 ) ) ( not ( = ?auto_353479 ?auto_353481 ) ) ( not ( = ?auto_353479 ?auto_353482 ) ) ( not ( = ?auto_353485 ?auto_353488 ) ) ( HOIST-AT ?auto_353487 ?auto_353485 ) ( not ( = ?auto_353483 ?auto_353487 ) ) ( SURFACE-AT ?auto_353482 ?auto_353485 ) ( ON ?auto_353482 ?auto_353484 ) ( CLEAR ?auto_353482 ) ( not ( = ?auto_353481 ?auto_353484 ) ) ( not ( = ?auto_353482 ?auto_353484 ) ) ( not ( = ?auto_353479 ?auto_353484 ) ) ( SURFACE-AT ?auto_353479 ?auto_353488 ) ( CLEAR ?auto_353479 ) ( IS-CRATE ?auto_353481 ) ( AVAILABLE ?auto_353483 ) ( TRUCK-AT ?auto_353486 ?auto_353485 ) ( LIFTING ?auto_353487 ?auto_353481 ) ( ON ?auto_353477 ?auto_353476 ) ( ON ?auto_353478 ?auto_353477 ) ( ON ?auto_353480 ?auto_353478 ) ( ON ?auto_353479 ?auto_353480 ) ( not ( = ?auto_353476 ?auto_353477 ) ) ( not ( = ?auto_353476 ?auto_353478 ) ) ( not ( = ?auto_353476 ?auto_353480 ) ) ( not ( = ?auto_353476 ?auto_353479 ) ) ( not ( = ?auto_353476 ?auto_353481 ) ) ( not ( = ?auto_353476 ?auto_353482 ) ) ( not ( = ?auto_353476 ?auto_353484 ) ) ( not ( = ?auto_353477 ?auto_353478 ) ) ( not ( = ?auto_353477 ?auto_353480 ) ) ( not ( = ?auto_353477 ?auto_353479 ) ) ( not ( = ?auto_353477 ?auto_353481 ) ) ( not ( = ?auto_353477 ?auto_353482 ) ) ( not ( = ?auto_353477 ?auto_353484 ) ) ( not ( = ?auto_353478 ?auto_353480 ) ) ( not ( = ?auto_353478 ?auto_353479 ) ) ( not ( = ?auto_353478 ?auto_353481 ) ) ( not ( = ?auto_353478 ?auto_353482 ) ) ( not ( = ?auto_353478 ?auto_353484 ) ) ( not ( = ?auto_353480 ?auto_353479 ) ) ( not ( = ?auto_353480 ?auto_353481 ) ) ( not ( = ?auto_353480 ?auto_353482 ) ) ( not ( = ?auto_353480 ?auto_353484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353479 ?auto_353481 ?auto_353482 )
      ( MAKE-6CRATE-VERIFY ?auto_353476 ?auto_353477 ?auto_353478 ?auto_353480 ?auto_353479 ?auto_353481 ?auto_353482 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353489 - SURFACE
      ?auto_353490 - SURFACE
      ?auto_353491 - SURFACE
      ?auto_353493 - SURFACE
      ?auto_353492 - SURFACE
      ?auto_353494 - SURFACE
      ?auto_353495 - SURFACE
      ?auto_353496 - SURFACE
    )
    :vars
    (
      ?auto_353497 - HOIST
      ?auto_353502 - PLACE
      ?auto_353499 - PLACE
      ?auto_353501 - HOIST
      ?auto_353498 - SURFACE
      ?auto_353500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353497 ?auto_353502 ) ( IS-CRATE ?auto_353496 ) ( not ( = ?auto_353495 ?auto_353496 ) ) ( not ( = ?auto_353494 ?auto_353495 ) ) ( not ( = ?auto_353494 ?auto_353496 ) ) ( not ( = ?auto_353499 ?auto_353502 ) ) ( HOIST-AT ?auto_353501 ?auto_353499 ) ( not ( = ?auto_353497 ?auto_353501 ) ) ( SURFACE-AT ?auto_353496 ?auto_353499 ) ( ON ?auto_353496 ?auto_353498 ) ( CLEAR ?auto_353496 ) ( not ( = ?auto_353495 ?auto_353498 ) ) ( not ( = ?auto_353496 ?auto_353498 ) ) ( not ( = ?auto_353494 ?auto_353498 ) ) ( SURFACE-AT ?auto_353494 ?auto_353502 ) ( CLEAR ?auto_353494 ) ( IS-CRATE ?auto_353495 ) ( AVAILABLE ?auto_353497 ) ( TRUCK-AT ?auto_353500 ?auto_353499 ) ( LIFTING ?auto_353501 ?auto_353495 ) ( ON ?auto_353490 ?auto_353489 ) ( ON ?auto_353491 ?auto_353490 ) ( ON ?auto_353493 ?auto_353491 ) ( ON ?auto_353492 ?auto_353493 ) ( ON ?auto_353494 ?auto_353492 ) ( not ( = ?auto_353489 ?auto_353490 ) ) ( not ( = ?auto_353489 ?auto_353491 ) ) ( not ( = ?auto_353489 ?auto_353493 ) ) ( not ( = ?auto_353489 ?auto_353492 ) ) ( not ( = ?auto_353489 ?auto_353494 ) ) ( not ( = ?auto_353489 ?auto_353495 ) ) ( not ( = ?auto_353489 ?auto_353496 ) ) ( not ( = ?auto_353489 ?auto_353498 ) ) ( not ( = ?auto_353490 ?auto_353491 ) ) ( not ( = ?auto_353490 ?auto_353493 ) ) ( not ( = ?auto_353490 ?auto_353492 ) ) ( not ( = ?auto_353490 ?auto_353494 ) ) ( not ( = ?auto_353490 ?auto_353495 ) ) ( not ( = ?auto_353490 ?auto_353496 ) ) ( not ( = ?auto_353490 ?auto_353498 ) ) ( not ( = ?auto_353491 ?auto_353493 ) ) ( not ( = ?auto_353491 ?auto_353492 ) ) ( not ( = ?auto_353491 ?auto_353494 ) ) ( not ( = ?auto_353491 ?auto_353495 ) ) ( not ( = ?auto_353491 ?auto_353496 ) ) ( not ( = ?auto_353491 ?auto_353498 ) ) ( not ( = ?auto_353493 ?auto_353492 ) ) ( not ( = ?auto_353493 ?auto_353494 ) ) ( not ( = ?auto_353493 ?auto_353495 ) ) ( not ( = ?auto_353493 ?auto_353496 ) ) ( not ( = ?auto_353493 ?auto_353498 ) ) ( not ( = ?auto_353492 ?auto_353494 ) ) ( not ( = ?auto_353492 ?auto_353495 ) ) ( not ( = ?auto_353492 ?auto_353496 ) ) ( not ( = ?auto_353492 ?auto_353498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353494 ?auto_353495 ?auto_353496 )
      ( MAKE-7CRATE-VERIFY ?auto_353489 ?auto_353490 ?auto_353491 ?auto_353493 ?auto_353492 ?auto_353494 ?auto_353495 ?auto_353496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_353503 - SURFACE
      ?auto_353504 - SURFACE
    )
    :vars
    (
      ?auto_353505 - HOIST
      ?auto_353511 - PLACE
      ?auto_353507 - SURFACE
      ?auto_353508 - PLACE
      ?auto_353510 - HOIST
      ?auto_353506 - SURFACE
      ?auto_353509 - TRUCK
      ?auto_353512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353505 ?auto_353511 ) ( IS-CRATE ?auto_353504 ) ( not ( = ?auto_353503 ?auto_353504 ) ) ( not ( = ?auto_353507 ?auto_353503 ) ) ( not ( = ?auto_353507 ?auto_353504 ) ) ( not ( = ?auto_353508 ?auto_353511 ) ) ( HOIST-AT ?auto_353510 ?auto_353508 ) ( not ( = ?auto_353505 ?auto_353510 ) ) ( SURFACE-AT ?auto_353504 ?auto_353508 ) ( ON ?auto_353504 ?auto_353506 ) ( CLEAR ?auto_353504 ) ( not ( = ?auto_353503 ?auto_353506 ) ) ( not ( = ?auto_353504 ?auto_353506 ) ) ( not ( = ?auto_353507 ?auto_353506 ) ) ( SURFACE-AT ?auto_353507 ?auto_353511 ) ( CLEAR ?auto_353507 ) ( IS-CRATE ?auto_353503 ) ( AVAILABLE ?auto_353505 ) ( TRUCK-AT ?auto_353509 ?auto_353508 ) ( AVAILABLE ?auto_353510 ) ( SURFACE-AT ?auto_353503 ?auto_353508 ) ( ON ?auto_353503 ?auto_353512 ) ( CLEAR ?auto_353503 ) ( not ( = ?auto_353503 ?auto_353512 ) ) ( not ( = ?auto_353504 ?auto_353512 ) ) ( not ( = ?auto_353507 ?auto_353512 ) ) ( not ( = ?auto_353506 ?auto_353512 ) ) )
    :subtasks
    ( ( !LIFT ?auto_353510 ?auto_353503 ?auto_353512 ?auto_353508 )
      ( MAKE-2CRATE ?auto_353507 ?auto_353503 ?auto_353504 )
      ( MAKE-1CRATE-VERIFY ?auto_353503 ?auto_353504 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_353513 - SURFACE
      ?auto_353514 - SURFACE
      ?auto_353515 - SURFACE
    )
    :vars
    (
      ?auto_353522 - HOIST
      ?auto_353521 - PLACE
      ?auto_353517 - PLACE
      ?auto_353519 - HOIST
      ?auto_353520 - SURFACE
      ?auto_353518 - TRUCK
      ?auto_353516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353522 ?auto_353521 ) ( IS-CRATE ?auto_353515 ) ( not ( = ?auto_353514 ?auto_353515 ) ) ( not ( = ?auto_353513 ?auto_353514 ) ) ( not ( = ?auto_353513 ?auto_353515 ) ) ( not ( = ?auto_353517 ?auto_353521 ) ) ( HOIST-AT ?auto_353519 ?auto_353517 ) ( not ( = ?auto_353522 ?auto_353519 ) ) ( SURFACE-AT ?auto_353515 ?auto_353517 ) ( ON ?auto_353515 ?auto_353520 ) ( CLEAR ?auto_353515 ) ( not ( = ?auto_353514 ?auto_353520 ) ) ( not ( = ?auto_353515 ?auto_353520 ) ) ( not ( = ?auto_353513 ?auto_353520 ) ) ( SURFACE-AT ?auto_353513 ?auto_353521 ) ( CLEAR ?auto_353513 ) ( IS-CRATE ?auto_353514 ) ( AVAILABLE ?auto_353522 ) ( TRUCK-AT ?auto_353518 ?auto_353517 ) ( AVAILABLE ?auto_353519 ) ( SURFACE-AT ?auto_353514 ?auto_353517 ) ( ON ?auto_353514 ?auto_353516 ) ( CLEAR ?auto_353514 ) ( not ( = ?auto_353514 ?auto_353516 ) ) ( not ( = ?auto_353515 ?auto_353516 ) ) ( not ( = ?auto_353513 ?auto_353516 ) ) ( not ( = ?auto_353520 ?auto_353516 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353514 ?auto_353515 )
      ( MAKE-2CRATE-VERIFY ?auto_353513 ?auto_353514 ?auto_353515 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_353523 - SURFACE
      ?auto_353524 - SURFACE
      ?auto_353525 - SURFACE
      ?auto_353526 - SURFACE
    )
    :vars
    (
      ?auto_353527 - HOIST
      ?auto_353532 - PLACE
      ?auto_353531 - PLACE
      ?auto_353533 - HOIST
      ?auto_353529 - SURFACE
      ?auto_353530 - TRUCK
      ?auto_353528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353527 ?auto_353532 ) ( IS-CRATE ?auto_353526 ) ( not ( = ?auto_353525 ?auto_353526 ) ) ( not ( = ?auto_353524 ?auto_353525 ) ) ( not ( = ?auto_353524 ?auto_353526 ) ) ( not ( = ?auto_353531 ?auto_353532 ) ) ( HOIST-AT ?auto_353533 ?auto_353531 ) ( not ( = ?auto_353527 ?auto_353533 ) ) ( SURFACE-AT ?auto_353526 ?auto_353531 ) ( ON ?auto_353526 ?auto_353529 ) ( CLEAR ?auto_353526 ) ( not ( = ?auto_353525 ?auto_353529 ) ) ( not ( = ?auto_353526 ?auto_353529 ) ) ( not ( = ?auto_353524 ?auto_353529 ) ) ( SURFACE-AT ?auto_353524 ?auto_353532 ) ( CLEAR ?auto_353524 ) ( IS-CRATE ?auto_353525 ) ( AVAILABLE ?auto_353527 ) ( TRUCK-AT ?auto_353530 ?auto_353531 ) ( AVAILABLE ?auto_353533 ) ( SURFACE-AT ?auto_353525 ?auto_353531 ) ( ON ?auto_353525 ?auto_353528 ) ( CLEAR ?auto_353525 ) ( not ( = ?auto_353525 ?auto_353528 ) ) ( not ( = ?auto_353526 ?auto_353528 ) ) ( not ( = ?auto_353524 ?auto_353528 ) ) ( not ( = ?auto_353529 ?auto_353528 ) ) ( ON ?auto_353524 ?auto_353523 ) ( not ( = ?auto_353523 ?auto_353524 ) ) ( not ( = ?auto_353523 ?auto_353525 ) ) ( not ( = ?auto_353523 ?auto_353526 ) ) ( not ( = ?auto_353523 ?auto_353529 ) ) ( not ( = ?auto_353523 ?auto_353528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353524 ?auto_353525 ?auto_353526 )
      ( MAKE-3CRATE-VERIFY ?auto_353523 ?auto_353524 ?auto_353525 ?auto_353526 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_353534 - SURFACE
      ?auto_353535 - SURFACE
      ?auto_353536 - SURFACE
      ?auto_353538 - SURFACE
      ?auto_353537 - SURFACE
    )
    :vars
    (
      ?auto_353539 - HOIST
      ?auto_353544 - PLACE
      ?auto_353543 - PLACE
      ?auto_353545 - HOIST
      ?auto_353541 - SURFACE
      ?auto_353542 - TRUCK
      ?auto_353540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353539 ?auto_353544 ) ( IS-CRATE ?auto_353537 ) ( not ( = ?auto_353538 ?auto_353537 ) ) ( not ( = ?auto_353536 ?auto_353538 ) ) ( not ( = ?auto_353536 ?auto_353537 ) ) ( not ( = ?auto_353543 ?auto_353544 ) ) ( HOIST-AT ?auto_353545 ?auto_353543 ) ( not ( = ?auto_353539 ?auto_353545 ) ) ( SURFACE-AT ?auto_353537 ?auto_353543 ) ( ON ?auto_353537 ?auto_353541 ) ( CLEAR ?auto_353537 ) ( not ( = ?auto_353538 ?auto_353541 ) ) ( not ( = ?auto_353537 ?auto_353541 ) ) ( not ( = ?auto_353536 ?auto_353541 ) ) ( SURFACE-AT ?auto_353536 ?auto_353544 ) ( CLEAR ?auto_353536 ) ( IS-CRATE ?auto_353538 ) ( AVAILABLE ?auto_353539 ) ( TRUCK-AT ?auto_353542 ?auto_353543 ) ( AVAILABLE ?auto_353545 ) ( SURFACE-AT ?auto_353538 ?auto_353543 ) ( ON ?auto_353538 ?auto_353540 ) ( CLEAR ?auto_353538 ) ( not ( = ?auto_353538 ?auto_353540 ) ) ( not ( = ?auto_353537 ?auto_353540 ) ) ( not ( = ?auto_353536 ?auto_353540 ) ) ( not ( = ?auto_353541 ?auto_353540 ) ) ( ON ?auto_353535 ?auto_353534 ) ( ON ?auto_353536 ?auto_353535 ) ( not ( = ?auto_353534 ?auto_353535 ) ) ( not ( = ?auto_353534 ?auto_353536 ) ) ( not ( = ?auto_353534 ?auto_353538 ) ) ( not ( = ?auto_353534 ?auto_353537 ) ) ( not ( = ?auto_353534 ?auto_353541 ) ) ( not ( = ?auto_353534 ?auto_353540 ) ) ( not ( = ?auto_353535 ?auto_353536 ) ) ( not ( = ?auto_353535 ?auto_353538 ) ) ( not ( = ?auto_353535 ?auto_353537 ) ) ( not ( = ?auto_353535 ?auto_353541 ) ) ( not ( = ?auto_353535 ?auto_353540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353536 ?auto_353538 ?auto_353537 )
      ( MAKE-4CRATE-VERIFY ?auto_353534 ?auto_353535 ?auto_353536 ?auto_353538 ?auto_353537 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_353546 - SURFACE
      ?auto_353547 - SURFACE
      ?auto_353548 - SURFACE
      ?auto_353550 - SURFACE
      ?auto_353549 - SURFACE
      ?auto_353551 - SURFACE
    )
    :vars
    (
      ?auto_353552 - HOIST
      ?auto_353557 - PLACE
      ?auto_353556 - PLACE
      ?auto_353558 - HOIST
      ?auto_353554 - SURFACE
      ?auto_353555 - TRUCK
      ?auto_353553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353552 ?auto_353557 ) ( IS-CRATE ?auto_353551 ) ( not ( = ?auto_353549 ?auto_353551 ) ) ( not ( = ?auto_353550 ?auto_353549 ) ) ( not ( = ?auto_353550 ?auto_353551 ) ) ( not ( = ?auto_353556 ?auto_353557 ) ) ( HOIST-AT ?auto_353558 ?auto_353556 ) ( not ( = ?auto_353552 ?auto_353558 ) ) ( SURFACE-AT ?auto_353551 ?auto_353556 ) ( ON ?auto_353551 ?auto_353554 ) ( CLEAR ?auto_353551 ) ( not ( = ?auto_353549 ?auto_353554 ) ) ( not ( = ?auto_353551 ?auto_353554 ) ) ( not ( = ?auto_353550 ?auto_353554 ) ) ( SURFACE-AT ?auto_353550 ?auto_353557 ) ( CLEAR ?auto_353550 ) ( IS-CRATE ?auto_353549 ) ( AVAILABLE ?auto_353552 ) ( TRUCK-AT ?auto_353555 ?auto_353556 ) ( AVAILABLE ?auto_353558 ) ( SURFACE-AT ?auto_353549 ?auto_353556 ) ( ON ?auto_353549 ?auto_353553 ) ( CLEAR ?auto_353549 ) ( not ( = ?auto_353549 ?auto_353553 ) ) ( not ( = ?auto_353551 ?auto_353553 ) ) ( not ( = ?auto_353550 ?auto_353553 ) ) ( not ( = ?auto_353554 ?auto_353553 ) ) ( ON ?auto_353547 ?auto_353546 ) ( ON ?auto_353548 ?auto_353547 ) ( ON ?auto_353550 ?auto_353548 ) ( not ( = ?auto_353546 ?auto_353547 ) ) ( not ( = ?auto_353546 ?auto_353548 ) ) ( not ( = ?auto_353546 ?auto_353550 ) ) ( not ( = ?auto_353546 ?auto_353549 ) ) ( not ( = ?auto_353546 ?auto_353551 ) ) ( not ( = ?auto_353546 ?auto_353554 ) ) ( not ( = ?auto_353546 ?auto_353553 ) ) ( not ( = ?auto_353547 ?auto_353548 ) ) ( not ( = ?auto_353547 ?auto_353550 ) ) ( not ( = ?auto_353547 ?auto_353549 ) ) ( not ( = ?auto_353547 ?auto_353551 ) ) ( not ( = ?auto_353547 ?auto_353554 ) ) ( not ( = ?auto_353547 ?auto_353553 ) ) ( not ( = ?auto_353548 ?auto_353550 ) ) ( not ( = ?auto_353548 ?auto_353549 ) ) ( not ( = ?auto_353548 ?auto_353551 ) ) ( not ( = ?auto_353548 ?auto_353554 ) ) ( not ( = ?auto_353548 ?auto_353553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353550 ?auto_353549 ?auto_353551 )
      ( MAKE-5CRATE-VERIFY ?auto_353546 ?auto_353547 ?auto_353548 ?auto_353550 ?auto_353549 ?auto_353551 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_353559 - SURFACE
      ?auto_353560 - SURFACE
      ?auto_353561 - SURFACE
      ?auto_353563 - SURFACE
      ?auto_353562 - SURFACE
      ?auto_353564 - SURFACE
      ?auto_353565 - SURFACE
    )
    :vars
    (
      ?auto_353566 - HOIST
      ?auto_353571 - PLACE
      ?auto_353570 - PLACE
      ?auto_353572 - HOIST
      ?auto_353568 - SURFACE
      ?auto_353569 - TRUCK
      ?auto_353567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353566 ?auto_353571 ) ( IS-CRATE ?auto_353565 ) ( not ( = ?auto_353564 ?auto_353565 ) ) ( not ( = ?auto_353562 ?auto_353564 ) ) ( not ( = ?auto_353562 ?auto_353565 ) ) ( not ( = ?auto_353570 ?auto_353571 ) ) ( HOIST-AT ?auto_353572 ?auto_353570 ) ( not ( = ?auto_353566 ?auto_353572 ) ) ( SURFACE-AT ?auto_353565 ?auto_353570 ) ( ON ?auto_353565 ?auto_353568 ) ( CLEAR ?auto_353565 ) ( not ( = ?auto_353564 ?auto_353568 ) ) ( not ( = ?auto_353565 ?auto_353568 ) ) ( not ( = ?auto_353562 ?auto_353568 ) ) ( SURFACE-AT ?auto_353562 ?auto_353571 ) ( CLEAR ?auto_353562 ) ( IS-CRATE ?auto_353564 ) ( AVAILABLE ?auto_353566 ) ( TRUCK-AT ?auto_353569 ?auto_353570 ) ( AVAILABLE ?auto_353572 ) ( SURFACE-AT ?auto_353564 ?auto_353570 ) ( ON ?auto_353564 ?auto_353567 ) ( CLEAR ?auto_353564 ) ( not ( = ?auto_353564 ?auto_353567 ) ) ( not ( = ?auto_353565 ?auto_353567 ) ) ( not ( = ?auto_353562 ?auto_353567 ) ) ( not ( = ?auto_353568 ?auto_353567 ) ) ( ON ?auto_353560 ?auto_353559 ) ( ON ?auto_353561 ?auto_353560 ) ( ON ?auto_353563 ?auto_353561 ) ( ON ?auto_353562 ?auto_353563 ) ( not ( = ?auto_353559 ?auto_353560 ) ) ( not ( = ?auto_353559 ?auto_353561 ) ) ( not ( = ?auto_353559 ?auto_353563 ) ) ( not ( = ?auto_353559 ?auto_353562 ) ) ( not ( = ?auto_353559 ?auto_353564 ) ) ( not ( = ?auto_353559 ?auto_353565 ) ) ( not ( = ?auto_353559 ?auto_353568 ) ) ( not ( = ?auto_353559 ?auto_353567 ) ) ( not ( = ?auto_353560 ?auto_353561 ) ) ( not ( = ?auto_353560 ?auto_353563 ) ) ( not ( = ?auto_353560 ?auto_353562 ) ) ( not ( = ?auto_353560 ?auto_353564 ) ) ( not ( = ?auto_353560 ?auto_353565 ) ) ( not ( = ?auto_353560 ?auto_353568 ) ) ( not ( = ?auto_353560 ?auto_353567 ) ) ( not ( = ?auto_353561 ?auto_353563 ) ) ( not ( = ?auto_353561 ?auto_353562 ) ) ( not ( = ?auto_353561 ?auto_353564 ) ) ( not ( = ?auto_353561 ?auto_353565 ) ) ( not ( = ?auto_353561 ?auto_353568 ) ) ( not ( = ?auto_353561 ?auto_353567 ) ) ( not ( = ?auto_353563 ?auto_353562 ) ) ( not ( = ?auto_353563 ?auto_353564 ) ) ( not ( = ?auto_353563 ?auto_353565 ) ) ( not ( = ?auto_353563 ?auto_353568 ) ) ( not ( = ?auto_353563 ?auto_353567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353562 ?auto_353564 ?auto_353565 )
      ( MAKE-6CRATE-VERIFY ?auto_353559 ?auto_353560 ?auto_353561 ?auto_353563 ?auto_353562 ?auto_353564 ?auto_353565 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353573 - SURFACE
      ?auto_353574 - SURFACE
      ?auto_353575 - SURFACE
      ?auto_353577 - SURFACE
      ?auto_353576 - SURFACE
      ?auto_353578 - SURFACE
      ?auto_353579 - SURFACE
      ?auto_353580 - SURFACE
    )
    :vars
    (
      ?auto_353581 - HOIST
      ?auto_353586 - PLACE
      ?auto_353585 - PLACE
      ?auto_353587 - HOIST
      ?auto_353583 - SURFACE
      ?auto_353584 - TRUCK
      ?auto_353582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353581 ?auto_353586 ) ( IS-CRATE ?auto_353580 ) ( not ( = ?auto_353579 ?auto_353580 ) ) ( not ( = ?auto_353578 ?auto_353579 ) ) ( not ( = ?auto_353578 ?auto_353580 ) ) ( not ( = ?auto_353585 ?auto_353586 ) ) ( HOIST-AT ?auto_353587 ?auto_353585 ) ( not ( = ?auto_353581 ?auto_353587 ) ) ( SURFACE-AT ?auto_353580 ?auto_353585 ) ( ON ?auto_353580 ?auto_353583 ) ( CLEAR ?auto_353580 ) ( not ( = ?auto_353579 ?auto_353583 ) ) ( not ( = ?auto_353580 ?auto_353583 ) ) ( not ( = ?auto_353578 ?auto_353583 ) ) ( SURFACE-AT ?auto_353578 ?auto_353586 ) ( CLEAR ?auto_353578 ) ( IS-CRATE ?auto_353579 ) ( AVAILABLE ?auto_353581 ) ( TRUCK-AT ?auto_353584 ?auto_353585 ) ( AVAILABLE ?auto_353587 ) ( SURFACE-AT ?auto_353579 ?auto_353585 ) ( ON ?auto_353579 ?auto_353582 ) ( CLEAR ?auto_353579 ) ( not ( = ?auto_353579 ?auto_353582 ) ) ( not ( = ?auto_353580 ?auto_353582 ) ) ( not ( = ?auto_353578 ?auto_353582 ) ) ( not ( = ?auto_353583 ?auto_353582 ) ) ( ON ?auto_353574 ?auto_353573 ) ( ON ?auto_353575 ?auto_353574 ) ( ON ?auto_353577 ?auto_353575 ) ( ON ?auto_353576 ?auto_353577 ) ( ON ?auto_353578 ?auto_353576 ) ( not ( = ?auto_353573 ?auto_353574 ) ) ( not ( = ?auto_353573 ?auto_353575 ) ) ( not ( = ?auto_353573 ?auto_353577 ) ) ( not ( = ?auto_353573 ?auto_353576 ) ) ( not ( = ?auto_353573 ?auto_353578 ) ) ( not ( = ?auto_353573 ?auto_353579 ) ) ( not ( = ?auto_353573 ?auto_353580 ) ) ( not ( = ?auto_353573 ?auto_353583 ) ) ( not ( = ?auto_353573 ?auto_353582 ) ) ( not ( = ?auto_353574 ?auto_353575 ) ) ( not ( = ?auto_353574 ?auto_353577 ) ) ( not ( = ?auto_353574 ?auto_353576 ) ) ( not ( = ?auto_353574 ?auto_353578 ) ) ( not ( = ?auto_353574 ?auto_353579 ) ) ( not ( = ?auto_353574 ?auto_353580 ) ) ( not ( = ?auto_353574 ?auto_353583 ) ) ( not ( = ?auto_353574 ?auto_353582 ) ) ( not ( = ?auto_353575 ?auto_353577 ) ) ( not ( = ?auto_353575 ?auto_353576 ) ) ( not ( = ?auto_353575 ?auto_353578 ) ) ( not ( = ?auto_353575 ?auto_353579 ) ) ( not ( = ?auto_353575 ?auto_353580 ) ) ( not ( = ?auto_353575 ?auto_353583 ) ) ( not ( = ?auto_353575 ?auto_353582 ) ) ( not ( = ?auto_353577 ?auto_353576 ) ) ( not ( = ?auto_353577 ?auto_353578 ) ) ( not ( = ?auto_353577 ?auto_353579 ) ) ( not ( = ?auto_353577 ?auto_353580 ) ) ( not ( = ?auto_353577 ?auto_353583 ) ) ( not ( = ?auto_353577 ?auto_353582 ) ) ( not ( = ?auto_353576 ?auto_353578 ) ) ( not ( = ?auto_353576 ?auto_353579 ) ) ( not ( = ?auto_353576 ?auto_353580 ) ) ( not ( = ?auto_353576 ?auto_353583 ) ) ( not ( = ?auto_353576 ?auto_353582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353578 ?auto_353579 ?auto_353580 )
      ( MAKE-7CRATE-VERIFY ?auto_353573 ?auto_353574 ?auto_353575 ?auto_353577 ?auto_353576 ?auto_353578 ?auto_353579 ?auto_353580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_353588 - SURFACE
      ?auto_353589 - SURFACE
    )
    :vars
    (
      ?auto_353590 - HOIST
      ?auto_353595 - PLACE
      ?auto_353597 - SURFACE
      ?auto_353594 - PLACE
      ?auto_353596 - HOIST
      ?auto_353592 - SURFACE
      ?auto_353591 - SURFACE
      ?auto_353593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353590 ?auto_353595 ) ( IS-CRATE ?auto_353589 ) ( not ( = ?auto_353588 ?auto_353589 ) ) ( not ( = ?auto_353597 ?auto_353588 ) ) ( not ( = ?auto_353597 ?auto_353589 ) ) ( not ( = ?auto_353594 ?auto_353595 ) ) ( HOIST-AT ?auto_353596 ?auto_353594 ) ( not ( = ?auto_353590 ?auto_353596 ) ) ( SURFACE-AT ?auto_353589 ?auto_353594 ) ( ON ?auto_353589 ?auto_353592 ) ( CLEAR ?auto_353589 ) ( not ( = ?auto_353588 ?auto_353592 ) ) ( not ( = ?auto_353589 ?auto_353592 ) ) ( not ( = ?auto_353597 ?auto_353592 ) ) ( SURFACE-AT ?auto_353597 ?auto_353595 ) ( CLEAR ?auto_353597 ) ( IS-CRATE ?auto_353588 ) ( AVAILABLE ?auto_353590 ) ( AVAILABLE ?auto_353596 ) ( SURFACE-AT ?auto_353588 ?auto_353594 ) ( ON ?auto_353588 ?auto_353591 ) ( CLEAR ?auto_353588 ) ( not ( = ?auto_353588 ?auto_353591 ) ) ( not ( = ?auto_353589 ?auto_353591 ) ) ( not ( = ?auto_353597 ?auto_353591 ) ) ( not ( = ?auto_353592 ?auto_353591 ) ) ( TRUCK-AT ?auto_353593 ?auto_353595 ) )
    :subtasks
    ( ( !DRIVE ?auto_353593 ?auto_353595 ?auto_353594 )
      ( MAKE-2CRATE ?auto_353597 ?auto_353588 ?auto_353589 )
      ( MAKE-1CRATE-VERIFY ?auto_353588 ?auto_353589 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_353598 - SURFACE
      ?auto_353599 - SURFACE
      ?auto_353600 - SURFACE
    )
    :vars
    (
      ?auto_353604 - HOIST
      ?auto_353601 - PLACE
      ?auto_353603 - PLACE
      ?auto_353606 - HOIST
      ?auto_353607 - SURFACE
      ?auto_353602 - SURFACE
      ?auto_353605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353604 ?auto_353601 ) ( IS-CRATE ?auto_353600 ) ( not ( = ?auto_353599 ?auto_353600 ) ) ( not ( = ?auto_353598 ?auto_353599 ) ) ( not ( = ?auto_353598 ?auto_353600 ) ) ( not ( = ?auto_353603 ?auto_353601 ) ) ( HOIST-AT ?auto_353606 ?auto_353603 ) ( not ( = ?auto_353604 ?auto_353606 ) ) ( SURFACE-AT ?auto_353600 ?auto_353603 ) ( ON ?auto_353600 ?auto_353607 ) ( CLEAR ?auto_353600 ) ( not ( = ?auto_353599 ?auto_353607 ) ) ( not ( = ?auto_353600 ?auto_353607 ) ) ( not ( = ?auto_353598 ?auto_353607 ) ) ( SURFACE-AT ?auto_353598 ?auto_353601 ) ( CLEAR ?auto_353598 ) ( IS-CRATE ?auto_353599 ) ( AVAILABLE ?auto_353604 ) ( AVAILABLE ?auto_353606 ) ( SURFACE-AT ?auto_353599 ?auto_353603 ) ( ON ?auto_353599 ?auto_353602 ) ( CLEAR ?auto_353599 ) ( not ( = ?auto_353599 ?auto_353602 ) ) ( not ( = ?auto_353600 ?auto_353602 ) ) ( not ( = ?auto_353598 ?auto_353602 ) ) ( not ( = ?auto_353607 ?auto_353602 ) ) ( TRUCK-AT ?auto_353605 ?auto_353601 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353599 ?auto_353600 )
      ( MAKE-2CRATE-VERIFY ?auto_353598 ?auto_353599 ?auto_353600 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_353608 - SURFACE
      ?auto_353609 - SURFACE
      ?auto_353610 - SURFACE
      ?auto_353611 - SURFACE
    )
    :vars
    (
      ?auto_353614 - HOIST
      ?auto_353616 - PLACE
      ?auto_353613 - PLACE
      ?auto_353612 - HOIST
      ?auto_353615 - SURFACE
      ?auto_353618 - SURFACE
      ?auto_353617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353614 ?auto_353616 ) ( IS-CRATE ?auto_353611 ) ( not ( = ?auto_353610 ?auto_353611 ) ) ( not ( = ?auto_353609 ?auto_353610 ) ) ( not ( = ?auto_353609 ?auto_353611 ) ) ( not ( = ?auto_353613 ?auto_353616 ) ) ( HOIST-AT ?auto_353612 ?auto_353613 ) ( not ( = ?auto_353614 ?auto_353612 ) ) ( SURFACE-AT ?auto_353611 ?auto_353613 ) ( ON ?auto_353611 ?auto_353615 ) ( CLEAR ?auto_353611 ) ( not ( = ?auto_353610 ?auto_353615 ) ) ( not ( = ?auto_353611 ?auto_353615 ) ) ( not ( = ?auto_353609 ?auto_353615 ) ) ( SURFACE-AT ?auto_353609 ?auto_353616 ) ( CLEAR ?auto_353609 ) ( IS-CRATE ?auto_353610 ) ( AVAILABLE ?auto_353614 ) ( AVAILABLE ?auto_353612 ) ( SURFACE-AT ?auto_353610 ?auto_353613 ) ( ON ?auto_353610 ?auto_353618 ) ( CLEAR ?auto_353610 ) ( not ( = ?auto_353610 ?auto_353618 ) ) ( not ( = ?auto_353611 ?auto_353618 ) ) ( not ( = ?auto_353609 ?auto_353618 ) ) ( not ( = ?auto_353615 ?auto_353618 ) ) ( TRUCK-AT ?auto_353617 ?auto_353616 ) ( ON ?auto_353609 ?auto_353608 ) ( not ( = ?auto_353608 ?auto_353609 ) ) ( not ( = ?auto_353608 ?auto_353610 ) ) ( not ( = ?auto_353608 ?auto_353611 ) ) ( not ( = ?auto_353608 ?auto_353615 ) ) ( not ( = ?auto_353608 ?auto_353618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353609 ?auto_353610 ?auto_353611 )
      ( MAKE-3CRATE-VERIFY ?auto_353608 ?auto_353609 ?auto_353610 ?auto_353611 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_353619 - SURFACE
      ?auto_353620 - SURFACE
      ?auto_353621 - SURFACE
      ?auto_353623 - SURFACE
      ?auto_353622 - SURFACE
    )
    :vars
    (
      ?auto_353626 - HOIST
      ?auto_353628 - PLACE
      ?auto_353625 - PLACE
      ?auto_353624 - HOIST
      ?auto_353627 - SURFACE
      ?auto_353630 - SURFACE
      ?auto_353629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353626 ?auto_353628 ) ( IS-CRATE ?auto_353622 ) ( not ( = ?auto_353623 ?auto_353622 ) ) ( not ( = ?auto_353621 ?auto_353623 ) ) ( not ( = ?auto_353621 ?auto_353622 ) ) ( not ( = ?auto_353625 ?auto_353628 ) ) ( HOIST-AT ?auto_353624 ?auto_353625 ) ( not ( = ?auto_353626 ?auto_353624 ) ) ( SURFACE-AT ?auto_353622 ?auto_353625 ) ( ON ?auto_353622 ?auto_353627 ) ( CLEAR ?auto_353622 ) ( not ( = ?auto_353623 ?auto_353627 ) ) ( not ( = ?auto_353622 ?auto_353627 ) ) ( not ( = ?auto_353621 ?auto_353627 ) ) ( SURFACE-AT ?auto_353621 ?auto_353628 ) ( CLEAR ?auto_353621 ) ( IS-CRATE ?auto_353623 ) ( AVAILABLE ?auto_353626 ) ( AVAILABLE ?auto_353624 ) ( SURFACE-AT ?auto_353623 ?auto_353625 ) ( ON ?auto_353623 ?auto_353630 ) ( CLEAR ?auto_353623 ) ( not ( = ?auto_353623 ?auto_353630 ) ) ( not ( = ?auto_353622 ?auto_353630 ) ) ( not ( = ?auto_353621 ?auto_353630 ) ) ( not ( = ?auto_353627 ?auto_353630 ) ) ( TRUCK-AT ?auto_353629 ?auto_353628 ) ( ON ?auto_353620 ?auto_353619 ) ( ON ?auto_353621 ?auto_353620 ) ( not ( = ?auto_353619 ?auto_353620 ) ) ( not ( = ?auto_353619 ?auto_353621 ) ) ( not ( = ?auto_353619 ?auto_353623 ) ) ( not ( = ?auto_353619 ?auto_353622 ) ) ( not ( = ?auto_353619 ?auto_353627 ) ) ( not ( = ?auto_353619 ?auto_353630 ) ) ( not ( = ?auto_353620 ?auto_353621 ) ) ( not ( = ?auto_353620 ?auto_353623 ) ) ( not ( = ?auto_353620 ?auto_353622 ) ) ( not ( = ?auto_353620 ?auto_353627 ) ) ( not ( = ?auto_353620 ?auto_353630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353621 ?auto_353623 ?auto_353622 )
      ( MAKE-4CRATE-VERIFY ?auto_353619 ?auto_353620 ?auto_353621 ?auto_353623 ?auto_353622 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_353631 - SURFACE
      ?auto_353632 - SURFACE
      ?auto_353633 - SURFACE
      ?auto_353635 - SURFACE
      ?auto_353634 - SURFACE
      ?auto_353636 - SURFACE
    )
    :vars
    (
      ?auto_353639 - HOIST
      ?auto_353641 - PLACE
      ?auto_353638 - PLACE
      ?auto_353637 - HOIST
      ?auto_353640 - SURFACE
      ?auto_353643 - SURFACE
      ?auto_353642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353639 ?auto_353641 ) ( IS-CRATE ?auto_353636 ) ( not ( = ?auto_353634 ?auto_353636 ) ) ( not ( = ?auto_353635 ?auto_353634 ) ) ( not ( = ?auto_353635 ?auto_353636 ) ) ( not ( = ?auto_353638 ?auto_353641 ) ) ( HOIST-AT ?auto_353637 ?auto_353638 ) ( not ( = ?auto_353639 ?auto_353637 ) ) ( SURFACE-AT ?auto_353636 ?auto_353638 ) ( ON ?auto_353636 ?auto_353640 ) ( CLEAR ?auto_353636 ) ( not ( = ?auto_353634 ?auto_353640 ) ) ( not ( = ?auto_353636 ?auto_353640 ) ) ( not ( = ?auto_353635 ?auto_353640 ) ) ( SURFACE-AT ?auto_353635 ?auto_353641 ) ( CLEAR ?auto_353635 ) ( IS-CRATE ?auto_353634 ) ( AVAILABLE ?auto_353639 ) ( AVAILABLE ?auto_353637 ) ( SURFACE-AT ?auto_353634 ?auto_353638 ) ( ON ?auto_353634 ?auto_353643 ) ( CLEAR ?auto_353634 ) ( not ( = ?auto_353634 ?auto_353643 ) ) ( not ( = ?auto_353636 ?auto_353643 ) ) ( not ( = ?auto_353635 ?auto_353643 ) ) ( not ( = ?auto_353640 ?auto_353643 ) ) ( TRUCK-AT ?auto_353642 ?auto_353641 ) ( ON ?auto_353632 ?auto_353631 ) ( ON ?auto_353633 ?auto_353632 ) ( ON ?auto_353635 ?auto_353633 ) ( not ( = ?auto_353631 ?auto_353632 ) ) ( not ( = ?auto_353631 ?auto_353633 ) ) ( not ( = ?auto_353631 ?auto_353635 ) ) ( not ( = ?auto_353631 ?auto_353634 ) ) ( not ( = ?auto_353631 ?auto_353636 ) ) ( not ( = ?auto_353631 ?auto_353640 ) ) ( not ( = ?auto_353631 ?auto_353643 ) ) ( not ( = ?auto_353632 ?auto_353633 ) ) ( not ( = ?auto_353632 ?auto_353635 ) ) ( not ( = ?auto_353632 ?auto_353634 ) ) ( not ( = ?auto_353632 ?auto_353636 ) ) ( not ( = ?auto_353632 ?auto_353640 ) ) ( not ( = ?auto_353632 ?auto_353643 ) ) ( not ( = ?auto_353633 ?auto_353635 ) ) ( not ( = ?auto_353633 ?auto_353634 ) ) ( not ( = ?auto_353633 ?auto_353636 ) ) ( not ( = ?auto_353633 ?auto_353640 ) ) ( not ( = ?auto_353633 ?auto_353643 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353635 ?auto_353634 ?auto_353636 )
      ( MAKE-5CRATE-VERIFY ?auto_353631 ?auto_353632 ?auto_353633 ?auto_353635 ?auto_353634 ?auto_353636 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_353644 - SURFACE
      ?auto_353645 - SURFACE
      ?auto_353646 - SURFACE
      ?auto_353648 - SURFACE
      ?auto_353647 - SURFACE
      ?auto_353649 - SURFACE
      ?auto_353650 - SURFACE
    )
    :vars
    (
      ?auto_353653 - HOIST
      ?auto_353655 - PLACE
      ?auto_353652 - PLACE
      ?auto_353651 - HOIST
      ?auto_353654 - SURFACE
      ?auto_353657 - SURFACE
      ?auto_353656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353653 ?auto_353655 ) ( IS-CRATE ?auto_353650 ) ( not ( = ?auto_353649 ?auto_353650 ) ) ( not ( = ?auto_353647 ?auto_353649 ) ) ( not ( = ?auto_353647 ?auto_353650 ) ) ( not ( = ?auto_353652 ?auto_353655 ) ) ( HOIST-AT ?auto_353651 ?auto_353652 ) ( not ( = ?auto_353653 ?auto_353651 ) ) ( SURFACE-AT ?auto_353650 ?auto_353652 ) ( ON ?auto_353650 ?auto_353654 ) ( CLEAR ?auto_353650 ) ( not ( = ?auto_353649 ?auto_353654 ) ) ( not ( = ?auto_353650 ?auto_353654 ) ) ( not ( = ?auto_353647 ?auto_353654 ) ) ( SURFACE-AT ?auto_353647 ?auto_353655 ) ( CLEAR ?auto_353647 ) ( IS-CRATE ?auto_353649 ) ( AVAILABLE ?auto_353653 ) ( AVAILABLE ?auto_353651 ) ( SURFACE-AT ?auto_353649 ?auto_353652 ) ( ON ?auto_353649 ?auto_353657 ) ( CLEAR ?auto_353649 ) ( not ( = ?auto_353649 ?auto_353657 ) ) ( not ( = ?auto_353650 ?auto_353657 ) ) ( not ( = ?auto_353647 ?auto_353657 ) ) ( not ( = ?auto_353654 ?auto_353657 ) ) ( TRUCK-AT ?auto_353656 ?auto_353655 ) ( ON ?auto_353645 ?auto_353644 ) ( ON ?auto_353646 ?auto_353645 ) ( ON ?auto_353648 ?auto_353646 ) ( ON ?auto_353647 ?auto_353648 ) ( not ( = ?auto_353644 ?auto_353645 ) ) ( not ( = ?auto_353644 ?auto_353646 ) ) ( not ( = ?auto_353644 ?auto_353648 ) ) ( not ( = ?auto_353644 ?auto_353647 ) ) ( not ( = ?auto_353644 ?auto_353649 ) ) ( not ( = ?auto_353644 ?auto_353650 ) ) ( not ( = ?auto_353644 ?auto_353654 ) ) ( not ( = ?auto_353644 ?auto_353657 ) ) ( not ( = ?auto_353645 ?auto_353646 ) ) ( not ( = ?auto_353645 ?auto_353648 ) ) ( not ( = ?auto_353645 ?auto_353647 ) ) ( not ( = ?auto_353645 ?auto_353649 ) ) ( not ( = ?auto_353645 ?auto_353650 ) ) ( not ( = ?auto_353645 ?auto_353654 ) ) ( not ( = ?auto_353645 ?auto_353657 ) ) ( not ( = ?auto_353646 ?auto_353648 ) ) ( not ( = ?auto_353646 ?auto_353647 ) ) ( not ( = ?auto_353646 ?auto_353649 ) ) ( not ( = ?auto_353646 ?auto_353650 ) ) ( not ( = ?auto_353646 ?auto_353654 ) ) ( not ( = ?auto_353646 ?auto_353657 ) ) ( not ( = ?auto_353648 ?auto_353647 ) ) ( not ( = ?auto_353648 ?auto_353649 ) ) ( not ( = ?auto_353648 ?auto_353650 ) ) ( not ( = ?auto_353648 ?auto_353654 ) ) ( not ( = ?auto_353648 ?auto_353657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353647 ?auto_353649 ?auto_353650 )
      ( MAKE-6CRATE-VERIFY ?auto_353644 ?auto_353645 ?auto_353646 ?auto_353648 ?auto_353647 ?auto_353649 ?auto_353650 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353658 - SURFACE
      ?auto_353659 - SURFACE
      ?auto_353660 - SURFACE
      ?auto_353662 - SURFACE
      ?auto_353661 - SURFACE
      ?auto_353663 - SURFACE
      ?auto_353664 - SURFACE
      ?auto_353665 - SURFACE
    )
    :vars
    (
      ?auto_353668 - HOIST
      ?auto_353670 - PLACE
      ?auto_353667 - PLACE
      ?auto_353666 - HOIST
      ?auto_353669 - SURFACE
      ?auto_353672 - SURFACE
      ?auto_353671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353668 ?auto_353670 ) ( IS-CRATE ?auto_353665 ) ( not ( = ?auto_353664 ?auto_353665 ) ) ( not ( = ?auto_353663 ?auto_353664 ) ) ( not ( = ?auto_353663 ?auto_353665 ) ) ( not ( = ?auto_353667 ?auto_353670 ) ) ( HOIST-AT ?auto_353666 ?auto_353667 ) ( not ( = ?auto_353668 ?auto_353666 ) ) ( SURFACE-AT ?auto_353665 ?auto_353667 ) ( ON ?auto_353665 ?auto_353669 ) ( CLEAR ?auto_353665 ) ( not ( = ?auto_353664 ?auto_353669 ) ) ( not ( = ?auto_353665 ?auto_353669 ) ) ( not ( = ?auto_353663 ?auto_353669 ) ) ( SURFACE-AT ?auto_353663 ?auto_353670 ) ( CLEAR ?auto_353663 ) ( IS-CRATE ?auto_353664 ) ( AVAILABLE ?auto_353668 ) ( AVAILABLE ?auto_353666 ) ( SURFACE-AT ?auto_353664 ?auto_353667 ) ( ON ?auto_353664 ?auto_353672 ) ( CLEAR ?auto_353664 ) ( not ( = ?auto_353664 ?auto_353672 ) ) ( not ( = ?auto_353665 ?auto_353672 ) ) ( not ( = ?auto_353663 ?auto_353672 ) ) ( not ( = ?auto_353669 ?auto_353672 ) ) ( TRUCK-AT ?auto_353671 ?auto_353670 ) ( ON ?auto_353659 ?auto_353658 ) ( ON ?auto_353660 ?auto_353659 ) ( ON ?auto_353662 ?auto_353660 ) ( ON ?auto_353661 ?auto_353662 ) ( ON ?auto_353663 ?auto_353661 ) ( not ( = ?auto_353658 ?auto_353659 ) ) ( not ( = ?auto_353658 ?auto_353660 ) ) ( not ( = ?auto_353658 ?auto_353662 ) ) ( not ( = ?auto_353658 ?auto_353661 ) ) ( not ( = ?auto_353658 ?auto_353663 ) ) ( not ( = ?auto_353658 ?auto_353664 ) ) ( not ( = ?auto_353658 ?auto_353665 ) ) ( not ( = ?auto_353658 ?auto_353669 ) ) ( not ( = ?auto_353658 ?auto_353672 ) ) ( not ( = ?auto_353659 ?auto_353660 ) ) ( not ( = ?auto_353659 ?auto_353662 ) ) ( not ( = ?auto_353659 ?auto_353661 ) ) ( not ( = ?auto_353659 ?auto_353663 ) ) ( not ( = ?auto_353659 ?auto_353664 ) ) ( not ( = ?auto_353659 ?auto_353665 ) ) ( not ( = ?auto_353659 ?auto_353669 ) ) ( not ( = ?auto_353659 ?auto_353672 ) ) ( not ( = ?auto_353660 ?auto_353662 ) ) ( not ( = ?auto_353660 ?auto_353661 ) ) ( not ( = ?auto_353660 ?auto_353663 ) ) ( not ( = ?auto_353660 ?auto_353664 ) ) ( not ( = ?auto_353660 ?auto_353665 ) ) ( not ( = ?auto_353660 ?auto_353669 ) ) ( not ( = ?auto_353660 ?auto_353672 ) ) ( not ( = ?auto_353662 ?auto_353661 ) ) ( not ( = ?auto_353662 ?auto_353663 ) ) ( not ( = ?auto_353662 ?auto_353664 ) ) ( not ( = ?auto_353662 ?auto_353665 ) ) ( not ( = ?auto_353662 ?auto_353669 ) ) ( not ( = ?auto_353662 ?auto_353672 ) ) ( not ( = ?auto_353661 ?auto_353663 ) ) ( not ( = ?auto_353661 ?auto_353664 ) ) ( not ( = ?auto_353661 ?auto_353665 ) ) ( not ( = ?auto_353661 ?auto_353669 ) ) ( not ( = ?auto_353661 ?auto_353672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353663 ?auto_353664 ?auto_353665 )
      ( MAKE-7CRATE-VERIFY ?auto_353658 ?auto_353659 ?auto_353660 ?auto_353662 ?auto_353661 ?auto_353663 ?auto_353664 ?auto_353665 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_353673 - SURFACE
      ?auto_353674 - SURFACE
    )
    :vars
    (
      ?auto_353678 - HOIST
      ?auto_353680 - PLACE
      ?auto_353677 - SURFACE
      ?auto_353676 - PLACE
      ?auto_353675 - HOIST
      ?auto_353679 - SURFACE
      ?auto_353682 - SURFACE
      ?auto_353681 - TRUCK
      ?auto_353683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353678 ?auto_353680 ) ( IS-CRATE ?auto_353674 ) ( not ( = ?auto_353673 ?auto_353674 ) ) ( not ( = ?auto_353677 ?auto_353673 ) ) ( not ( = ?auto_353677 ?auto_353674 ) ) ( not ( = ?auto_353676 ?auto_353680 ) ) ( HOIST-AT ?auto_353675 ?auto_353676 ) ( not ( = ?auto_353678 ?auto_353675 ) ) ( SURFACE-AT ?auto_353674 ?auto_353676 ) ( ON ?auto_353674 ?auto_353679 ) ( CLEAR ?auto_353674 ) ( not ( = ?auto_353673 ?auto_353679 ) ) ( not ( = ?auto_353674 ?auto_353679 ) ) ( not ( = ?auto_353677 ?auto_353679 ) ) ( IS-CRATE ?auto_353673 ) ( AVAILABLE ?auto_353675 ) ( SURFACE-AT ?auto_353673 ?auto_353676 ) ( ON ?auto_353673 ?auto_353682 ) ( CLEAR ?auto_353673 ) ( not ( = ?auto_353673 ?auto_353682 ) ) ( not ( = ?auto_353674 ?auto_353682 ) ) ( not ( = ?auto_353677 ?auto_353682 ) ) ( not ( = ?auto_353679 ?auto_353682 ) ) ( TRUCK-AT ?auto_353681 ?auto_353680 ) ( SURFACE-AT ?auto_353683 ?auto_353680 ) ( CLEAR ?auto_353683 ) ( LIFTING ?auto_353678 ?auto_353677 ) ( IS-CRATE ?auto_353677 ) ( not ( = ?auto_353683 ?auto_353677 ) ) ( not ( = ?auto_353673 ?auto_353683 ) ) ( not ( = ?auto_353674 ?auto_353683 ) ) ( not ( = ?auto_353679 ?auto_353683 ) ) ( not ( = ?auto_353682 ?auto_353683 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353683 ?auto_353677 )
      ( MAKE-2CRATE ?auto_353677 ?auto_353673 ?auto_353674 )
      ( MAKE-1CRATE-VERIFY ?auto_353673 ?auto_353674 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_353684 - SURFACE
      ?auto_353685 - SURFACE
      ?auto_353686 - SURFACE
    )
    :vars
    (
      ?auto_353691 - HOIST
      ?auto_353687 - PLACE
      ?auto_353693 - PLACE
      ?auto_353690 - HOIST
      ?auto_353688 - SURFACE
      ?auto_353694 - SURFACE
      ?auto_353689 - TRUCK
      ?auto_353692 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_353691 ?auto_353687 ) ( IS-CRATE ?auto_353686 ) ( not ( = ?auto_353685 ?auto_353686 ) ) ( not ( = ?auto_353684 ?auto_353685 ) ) ( not ( = ?auto_353684 ?auto_353686 ) ) ( not ( = ?auto_353693 ?auto_353687 ) ) ( HOIST-AT ?auto_353690 ?auto_353693 ) ( not ( = ?auto_353691 ?auto_353690 ) ) ( SURFACE-AT ?auto_353686 ?auto_353693 ) ( ON ?auto_353686 ?auto_353688 ) ( CLEAR ?auto_353686 ) ( not ( = ?auto_353685 ?auto_353688 ) ) ( not ( = ?auto_353686 ?auto_353688 ) ) ( not ( = ?auto_353684 ?auto_353688 ) ) ( IS-CRATE ?auto_353685 ) ( AVAILABLE ?auto_353690 ) ( SURFACE-AT ?auto_353685 ?auto_353693 ) ( ON ?auto_353685 ?auto_353694 ) ( CLEAR ?auto_353685 ) ( not ( = ?auto_353685 ?auto_353694 ) ) ( not ( = ?auto_353686 ?auto_353694 ) ) ( not ( = ?auto_353684 ?auto_353694 ) ) ( not ( = ?auto_353688 ?auto_353694 ) ) ( TRUCK-AT ?auto_353689 ?auto_353687 ) ( SURFACE-AT ?auto_353692 ?auto_353687 ) ( CLEAR ?auto_353692 ) ( LIFTING ?auto_353691 ?auto_353684 ) ( IS-CRATE ?auto_353684 ) ( not ( = ?auto_353692 ?auto_353684 ) ) ( not ( = ?auto_353685 ?auto_353692 ) ) ( not ( = ?auto_353686 ?auto_353692 ) ) ( not ( = ?auto_353688 ?auto_353692 ) ) ( not ( = ?auto_353694 ?auto_353692 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_353685 ?auto_353686 )
      ( MAKE-2CRATE-VERIFY ?auto_353684 ?auto_353685 ?auto_353686 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_353695 - SURFACE
      ?auto_353696 - SURFACE
      ?auto_353697 - SURFACE
      ?auto_353698 - SURFACE
    )
    :vars
    (
      ?auto_353705 - HOIST
      ?auto_353704 - PLACE
      ?auto_353701 - PLACE
      ?auto_353700 - HOIST
      ?auto_353703 - SURFACE
      ?auto_353699 - SURFACE
      ?auto_353702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353705 ?auto_353704 ) ( IS-CRATE ?auto_353698 ) ( not ( = ?auto_353697 ?auto_353698 ) ) ( not ( = ?auto_353696 ?auto_353697 ) ) ( not ( = ?auto_353696 ?auto_353698 ) ) ( not ( = ?auto_353701 ?auto_353704 ) ) ( HOIST-AT ?auto_353700 ?auto_353701 ) ( not ( = ?auto_353705 ?auto_353700 ) ) ( SURFACE-AT ?auto_353698 ?auto_353701 ) ( ON ?auto_353698 ?auto_353703 ) ( CLEAR ?auto_353698 ) ( not ( = ?auto_353697 ?auto_353703 ) ) ( not ( = ?auto_353698 ?auto_353703 ) ) ( not ( = ?auto_353696 ?auto_353703 ) ) ( IS-CRATE ?auto_353697 ) ( AVAILABLE ?auto_353700 ) ( SURFACE-AT ?auto_353697 ?auto_353701 ) ( ON ?auto_353697 ?auto_353699 ) ( CLEAR ?auto_353697 ) ( not ( = ?auto_353697 ?auto_353699 ) ) ( not ( = ?auto_353698 ?auto_353699 ) ) ( not ( = ?auto_353696 ?auto_353699 ) ) ( not ( = ?auto_353703 ?auto_353699 ) ) ( TRUCK-AT ?auto_353702 ?auto_353704 ) ( SURFACE-AT ?auto_353695 ?auto_353704 ) ( CLEAR ?auto_353695 ) ( LIFTING ?auto_353705 ?auto_353696 ) ( IS-CRATE ?auto_353696 ) ( not ( = ?auto_353695 ?auto_353696 ) ) ( not ( = ?auto_353697 ?auto_353695 ) ) ( not ( = ?auto_353698 ?auto_353695 ) ) ( not ( = ?auto_353703 ?auto_353695 ) ) ( not ( = ?auto_353699 ?auto_353695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353696 ?auto_353697 ?auto_353698 )
      ( MAKE-3CRATE-VERIFY ?auto_353695 ?auto_353696 ?auto_353697 ?auto_353698 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_353706 - SURFACE
      ?auto_353707 - SURFACE
      ?auto_353708 - SURFACE
      ?auto_353710 - SURFACE
      ?auto_353709 - SURFACE
    )
    :vars
    (
      ?auto_353717 - HOIST
      ?auto_353716 - PLACE
      ?auto_353713 - PLACE
      ?auto_353712 - HOIST
      ?auto_353715 - SURFACE
      ?auto_353711 - SURFACE
      ?auto_353714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353717 ?auto_353716 ) ( IS-CRATE ?auto_353709 ) ( not ( = ?auto_353710 ?auto_353709 ) ) ( not ( = ?auto_353708 ?auto_353710 ) ) ( not ( = ?auto_353708 ?auto_353709 ) ) ( not ( = ?auto_353713 ?auto_353716 ) ) ( HOIST-AT ?auto_353712 ?auto_353713 ) ( not ( = ?auto_353717 ?auto_353712 ) ) ( SURFACE-AT ?auto_353709 ?auto_353713 ) ( ON ?auto_353709 ?auto_353715 ) ( CLEAR ?auto_353709 ) ( not ( = ?auto_353710 ?auto_353715 ) ) ( not ( = ?auto_353709 ?auto_353715 ) ) ( not ( = ?auto_353708 ?auto_353715 ) ) ( IS-CRATE ?auto_353710 ) ( AVAILABLE ?auto_353712 ) ( SURFACE-AT ?auto_353710 ?auto_353713 ) ( ON ?auto_353710 ?auto_353711 ) ( CLEAR ?auto_353710 ) ( not ( = ?auto_353710 ?auto_353711 ) ) ( not ( = ?auto_353709 ?auto_353711 ) ) ( not ( = ?auto_353708 ?auto_353711 ) ) ( not ( = ?auto_353715 ?auto_353711 ) ) ( TRUCK-AT ?auto_353714 ?auto_353716 ) ( SURFACE-AT ?auto_353707 ?auto_353716 ) ( CLEAR ?auto_353707 ) ( LIFTING ?auto_353717 ?auto_353708 ) ( IS-CRATE ?auto_353708 ) ( not ( = ?auto_353707 ?auto_353708 ) ) ( not ( = ?auto_353710 ?auto_353707 ) ) ( not ( = ?auto_353709 ?auto_353707 ) ) ( not ( = ?auto_353715 ?auto_353707 ) ) ( not ( = ?auto_353711 ?auto_353707 ) ) ( ON ?auto_353707 ?auto_353706 ) ( not ( = ?auto_353706 ?auto_353707 ) ) ( not ( = ?auto_353706 ?auto_353708 ) ) ( not ( = ?auto_353706 ?auto_353710 ) ) ( not ( = ?auto_353706 ?auto_353709 ) ) ( not ( = ?auto_353706 ?auto_353715 ) ) ( not ( = ?auto_353706 ?auto_353711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353708 ?auto_353710 ?auto_353709 )
      ( MAKE-4CRATE-VERIFY ?auto_353706 ?auto_353707 ?auto_353708 ?auto_353710 ?auto_353709 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_353718 - SURFACE
      ?auto_353719 - SURFACE
      ?auto_353720 - SURFACE
      ?auto_353722 - SURFACE
      ?auto_353721 - SURFACE
      ?auto_353723 - SURFACE
    )
    :vars
    (
      ?auto_353730 - HOIST
      ?auto_353729 - PLACE
      ?auto_353726 - PLACE
      ?auto_353725 - HOIST
      ?auto_353728 - SURFACE
      ?auto_353724 - SURFACE
      ?auto_353727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353730 ?auto_353729 ) ( IS-CRATE ?auto_353723 ) ( not ( = ?auto_353721 ?auto_353723 ) ) ( not ( = ?auto_353722 ?auto_353721 ) ) ( not ( = ?auto_353722 ?auto_353723 ) ) ( not ( = ?auto_353726 ?auto_353729 ) ) ( HOIST-AT ?auto_353725 ?auto_353726 ) ( not ( = ?auto_353730 ?auto_353725 ) ) ( SURFACE-AT ?auto_353723 ?auto_353726 ) ( ON ?auto_353723 ?auto_353728 ) ( CLEAR ?auto_353723 ) ( not ( = ?auto_353721 ?auto_353728 ) ) ( not ( = ?auto_353723 ?auto_353728 ) ) ( not ( = ?auto_353722 ?auto_353728 ) ) ( IS-CRATE ?auto_353721 ) ( AVAILABLE ?auto_353725 ) ( SURFACE-AT ?auto_353721 ?auto_353726 ) ( ON ?auto_353721 ?auto_353724 ) ( CLEAR ?auto_353721 ) ( not ( = ?auto_353721 ?auto_353724 ) ) ( not ( = ?auto_353723 ?auto_353724 ) ) ( not ( = ?auto_353722 ?auto_353724 ) ) ( not ( = ?auto_353728 ?auto_353724 ) ) ( TRUCK-AT ?auto_353727 ?auto_353729 ) ( SURFACE-AT ?auto_353720 ?auto_353729 ) ( CLEAR ?auto_353720 ) ( LIFTING ?auto_353730 ?auto_353722 ) ( IS-CRATE ?auto_353722 ) ( not ( = ?auto_353720 ?auto_353722 ) ) ( not ( = ?auto_353721 ?auto_353720 ) ) ( not ( = ?auto_353723 ?auto_353720 ) ) ( not ( = ?auto_353728 ?auto_353720 ) ) ( not ( = ?auto_353724 ?auto_353720 ) ) ( ON ?auto_353719 ?auto_353718 ) ( ON ?auto_353720 ?auto_353719 ) ( not ( = ?auto_353718 ?auto_353719 ) ) ( not ( = ?auto_353718 ?auto_353720 ) ) ( not ( = ?auto_353718 ?auto_353722 ) ) ( not ( = ?auto_353718 ?auto_353721 ) ) ( not ( = ?auto_353718 ?auto_353723 ) ) ( not ( = ?auto_353718 ?auto_353728 ) ) ( not ( = ?auto_353718 ?auto_353724 ) ) ( not ( = ?auto_353719 ?auto_353720 ) ) ( not ( = ?auto_353719 ?auto_353722 ) ) ( not ( = ?auto_353719 ?auto_353721 ) ) ( not ( = ?auto_353719 ?auto_353723 ) ) ( not ( = ?auto_353719 ?auto_353728 ) ) ( not ( = ?auto_353719 ?auto_353724 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353722 ?auto_353721 ?auto_353723 )
      ( MAKE-5CRATE-VERIFY ?auto_353718 ?auto_353719 ?auto_353720 ?auto_353722 ?auto_353721 ?auto_353723 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_353731 - SURFACE
      ?auto_353732 - SURFACE
      ?auto_353733 - SURFACE
      ?auto_353735 - SURFACE
      ?auto_353734 - SURFACE
      ?auto_353736 - SURFACE
      ?auto_353737 - SURFACE
    )
    :vars
    (
      ?auto_353744 - HOIST
      ?auto_353743 - PLACE
      ?auto_353740 - PLACE
      ?auto_353739 - HOIST
      ?auto_353742 - SURFACE
      ?auto_353738 - SURFACE
      ?auto_353741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353744 ?auto_353743 ) ( IS-CRATE ?auto_353737 ) ( not ( = ?auto_353736 ?auto_353737 ) ) ( not ( = ?auto_353734 ?auto_353736 ) ) ( not ( = ?auto_353734 ?auto_353737 ) ) ( not ( = ?auto_353740 ?auto_353743 ) ) ( HOIST-AT ?auto_353739 ?auto_353740 ) ( not ( = ?auto_353744 ?auto_353739 ) ) ( SURFACE-AT ?auto_353737 ?auto_353740 ) ( ON ?auto_353737 ?auto_353742 ) ( CLEAR ?auto_353737 ) ( not ( = ?auto_353736 ?auto_353742 ) ) ( not ( = ?auto_353737 ?auto_353742 ) ) ( not ( = ?auto_353734 ?auto_353742 ) ) ( IS-CRATE ?auto_353736 ) ( AVAILABLE ?auto_353739 ) ( SURFACE-AT ?auto_353736 ?auto_353740 ) ( ON ?auto_353736 ?auto_353738 ) ( CLEAR ?auto_353736 ) ( not ( = ?auto_353736 ?auto_353738 ) ) ( not ( = ?auto_353737 ?auto_353738 ) ) ( not ( = ?auto_353734 ?auto_353738 ) ) ( not ( = ?auto_353742 ?auto_353738 ) ) ( TRUCK-AT ?auto_353741 ?auto_353743 ) ( SURFACE-AT ?auto_353735 ?auto_353743 ) ( CLEAR ?auto_353735 ) ( LIFTING ?auto_353744 ?auto_353734 ) ( IS-CRATE ?auto_353734 ) ( not ( = ?auto_353735 ?auto_353734 ) ) ( not ( = ?auto_353736 ?auto_353735 ) ) ( not ( = ?auto_353737 ?auto_353735 ) ) ( not ( = ?auto_353742 ?auto_353735 ) ) ( not ( = ?auto_353738 ?auto_353735 ) ) ( ON ?auto_353732 ?auto_353731 ) ( ON ?auto_353733 ?auto_353732 ) ( ON ?auto_353735 ?auto_353733 ) ( not ( = ?auto_353731 ?auto_353732 ) ) ( not ( = ?auto_353731 ?auto_353733 ) ) ( not ( = ?auto_353731 ?auto_353735 ) ) ( not ( = ?auto_353731 ?auto_353734 ) ) ( not ( = ?auto_353731 ?auto_353736 ) ) ( not ( = ?auto_353731 ?auto_353737 ) ) ( not ( = ?auto_353731 ?auto_353742 ) ) ( not ( = ?auto_353731 ?auto_353738 ) ) ( not ( = ?auto_353732 ?auto_353733 ) ) ( not ( = ?auto_353732 ?auto_353735 ) ) ( not ( = ?auto_353732 ?auto_353734 ) ) ( not ( = ?auto_353732 ?auto_353736 ) ) ( not ( = ?auto_353732 ?auto_353737 ) ) ( not ( = ?auto_353732 ?auto_353742 ) ) ( not ( = ?auto_353732 ?auto_353738 ) ) ( not ( = ?auto_353733 ?auto_353735 ) ) ( not ( = ?auto_353733 ?auto_353734 ) ) ( not ( = ?auto_353733 ?auto_353736 ) ) ( not ( = ?auto_353733 ?auto_353737 ) ) ( not ( = ?auto_353733 ?auto_353742 ) ) ( not ( = ?auto_353733 ?auto_353738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353734 ?auto_353736 ?auto_353737 )
      ( MAKE-6CRATE-VERIFY ?auto_353731 ?auto_353732 ?auto_353733 ?auto_353735 ?auto_353734 ?auto_353736 ?auto_353737 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_353745 - SURFACE
      ?auto_353746 - SURFACE
      ?auto_353747 - SURFACE
      ?auto_353749 - SURFACE
      ?auto_353748 - SURFACE
      ?auto_353750 - SURFACE
      ?auto_353751 - SURFACE
      ?auto_353752 - SURFACE
    )
    :vars
    (
      ?auto_353759 - HOIST
      ?auto_353758 - PLACE
      ?auto_353755 - PLACE
      ?auto_353754 - HOIST
      ?auto_353757 - SURFACE
      ?auto_353753 - SURFACE
      ?auto_353756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353759 ?auto_353758 ) ( IS-CRATE ?auto_353752 ) ( not ( = ?auto_353751 ?auto_353752 ) ) ( not ( = ?auto_353750 ?auto_353751 ) ) ( not ( = ?auto_353750 ?auto_353752 ) ) ( not ( = ?auto_353755 ?auto_353758 ) ) ( HOIST-AT ?auto_353754 ?auto_353755 ) ( not ( = ?auto_353759 ?auto_353754 ) ) ( SURFACE-AT ?auto_353752 ?auto_353755 ) ( ON ?auto_353752 ?auto_353757 ) ( CLEAR ?auto_353752 ) ( not ( = ?auto_353751 ?auto_353757 ) ) ( not ( = ?auto_353752 ?auto_353757 ) ) ( not ( = ?auto_353750 ?auto_353757 ) ) ( IS-CRATE ?auto_353751 ) ( AVAILABLE ?auto_353754 ) ( SURFACE-AT ?auto_353751 ?auto_353755 ) ( ON ?auto_353751 ?auto_353753 ) ( CLEAR ?auto_353751 ) ( not ( = ?auto_353751 ?auto_353753 ) ) ( not ( = ?auto_353752 ?auto_353753 ) ) ( not ( = ?auto_353750 ?auto_353753 ) ) ( not ( = ?auto_353757 ?auto_353753 ) ) ( TRUCK-AT ?auto_353756 ?auto_353758 ) ( SURFACE-AT ?auto_353748 ?auto_353758 ) ( CLEAR ?auto_353748 ) ( LIFTING ?auto_353759 ?auto_353750 ) ( IS-CRATE ?auto_353750 ) ( not ( = ?auto_353748 ?auto_353750 ) ) ( not ( = ?auto_353751 ?auto_353748 ) ) ( not ( = ?auto_353752 ?auto_353748 ) ) ( not ( = ?auto_353757 ?auto_353748 ) ) ( not ( = ?auto_353753 ?auto_353748 ) ) ( ON ?auto_353746 ?auto_353745 ) ( ON ?auto_353747 ?auto_353746 ) ( ON ?auto_353749 ?auto_353747 ) ( ON ?auto_353748 ?auto_353749 ) ( not ( = ?auto_353745 ?auto_353746 ) ) ( not ( = ?auto_353745 ?auto_353747 ) ) ( not ( = ?auto_353745 ?auto_353749 ) ) ( not ( = ?auto_353745 ?auto_353748 ) ) ( not ( = ?auto_353745 ?auto_353750 ) ) ( not ( = ?auto_353745 ?auto_353751 ) ) ( not ( = ?auto_353745 ?auto_353752 ) ) ( not ( = ?auto_353745 ?auto_353757 ) ) ( not ( = ?auto_353745 ?auto_353753 ) ) ( not ( = ?auto_353746 ?auto_353747 ) ) ( not ( = ?auto_353746 ?auto_353749 ) ) ( not ( = ?auto_353746 ?auto_353748 ) ) ( not ( = ?auto_353746 ?auto_353750 ) ) ( not ( = ?auto_353746 ?auto_353751 ) ) ( not ( = ?auto_353746 ?auto_353752 ) ) ( not ( = ?auto_353746 ?auto_353757 ) ) ( not ( = ?auto_353746 ?auto_353753 ) ) ( not ( = ?auto_353747 ?auto_353749 ) ) ( not ( = ?auto_353747 ?auto_353748 ) ) ( not ( = ?auto_353747 ?auto_353750 ) ) ( not ( = ?auto_353747 ?auto_353751 ) ) ( not ( = ?auto_353747 ?auto_353752 ) ) ( not ( = ?auto_353747 ?auto_353757 ) ) ( not ( = ?auto_353747 ?auto_353753 ) ) ( not ( = ?auto_353749 ?auto_353748 ) ) ( not ( = ?auto_353749 ?auto_353750 ) ) ( not ( = ?auto_353749 ?auto_353751 ) ) ( not ( = ?auto_353749 ?auto_353752 ) ) ( not ( = ?auto_353749 ?auto_353757 ) ) ( not ( = ?auto_353749 ?auto_353753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_353750 ?auto_353751 ?auto_353752 )
      ( MAKE-7CRATE-VERIFY ?auto_353745 ?auto_353746 ?auto_353747 ?auto_353749 ?auto_353748 ?auto_353750 ?auto_353751 ?auto_353752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_355329 - SURFACE
      ?auto_355330 - SURFACE
    )
    :vars
    (
      ?auto_355335 - HOIST
      ?auto_355338 - PLACE
      ?auto_355331 - SURFACE
      ?auto_355337 - PLACE
      ?auto_355336 - HOIST
      ?auto_355334 - SURFACE
      ?auto_355332 - TRUCK
      ?auto_355333 - SURFACE
      ?auto_355339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_355335 ?auto_355338 ) ( IS-CRATE ?auto_355330 ) ( not ( = ?auto_355329 ?auto_355330 ) ) ( not ( = ?auto_355331 ?auto_355329 ) ) ( not ( = ?auto_355331 ?auto_355330 ) ) ( not ( = ?auto_355337 ?auto_355338 ) ) ( HOIST-AT ?auto_355336 ?auto_355337 ) ( not ( = ?auto_355335 ?auto_355336 ) ) ( SURFACE-AT ?auto_355330 ?auto_355337 ) ( ON ?auto_355330 ?auto_355334 ) ( CLEAR ?auto_355330 ) ( not ( = ?auto_355329 ?auto_355334 ) ) ( not ( = ?auto_355330 ?auto_355334 ) ) ( not ( = ?auto_355331 ?auto_355334 ) ) ( SURFACE-AT ?auto_355331 ?auto_355338 ) ( CLEAR ?auto_355331 ) ( IS-CRATE ?auto_355329 ) ( AVAILABLE ?auto_355335 ) ( TRUCK-AT ?auto_355332 ?auto_355337 ) ( SURFACE-AT ?auto_355329 ?auto_355337 ) ( ON ?auto_355329 ?auto_355333 ) ( CLEAR ?auto_355329 ) ( not ( = ?auto_355329 ?auto_355333 ) ) ( not ( = ?auto_355330 ?auto_355333 ) ) ( not ( = ?auto_355331 ?auto_355333 ) ) ( not ( = ?auto_355334 ?auto_355333 ) ) ( LIFTING ?auto_355336 ?auto_355339 ) ( IS-CRATE ?auto_355339 ) ( not ( = ?auto_355329 ?auto_355339 ) ) ( not ( = ?auto_355330 ?auto_355339 ) ) ( not ( = ?auto_355331 ?auto_355339 ) ) ( not ( = ?auto_355334 ?auto_355339 ) ) ( not ( = ?auto_355333 ?auto_355339 ) ) )
    :subtasks
    ( ( !LOAD ?auto_355336 ?auto_355339 ?auto_355332 ?auto_355337 )
      ( MAKE-2CRATE ?auto_355331 ?auto_355329 ?auto_355330 )
      ( MAKE-1CRATE-VERIFY ?auto_355329 ?auto_355330 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_355340 - SURFACE
      ?auto_355341 - SURFACE
      ?auto_355342 - SURFACE
    )
    :vars
    (
      ?auto_355347 - HOIST
      ?auto_355348 - PLACE
      ?auto_355345 - PLACE
      ?auto_355349 - HOIST
      ?auto_355350 - SURFACE
      ?auto_355343 - TRUCK
      ?auto_355346 - SURFACE
      ?auto_355344 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_355347 ?auto_355348 ) ( IS-CRATE ?auto_355342 ) ( not ( = ?auto_355341 ?auto_355342 ) ) ( not ( = ?auto_355340 ?auto_355341 ) ) ( not ( = ?auto_355340 ?auto_355342 ) ) ( not ( = ?auto_355345 ?auto_355348 ) ) ( HOIST-AT ?auto_355349 ?auto_355345 ) ( not ( = ?auto_355347 ?auto_355349 ) ) ( SURFACE-AT ?auto_355342 ?auto_355345 ) ( ON ?auto_355342 ?auto_355350 ) ( CLEAR ?auto_355342 ) ( not ( = ?auto_355341 ?auto_355350 ) ) ( not ( = ?auto_355342 ?auto_355350 ) ) ( not ( = ?auto_355340 ?auto_355350 ) ) ( SURFACE-AT ?auto_355340 ?auto_355348 ) ( CLEAR ?auto_355340 ) ( IS-CRATE ?auto_355341 ) ( AVAILABLE ?auto_355347 ) ( TRUCK-AT ?auto_355343 ?auto_355345 ) ( SURFACE-AT ?auto_355341 ?auto_355345 ) ( ON ?auto_355341 ?auto_355346 ) ( CLEAR ?auto_355341 ) ( not ( = ?auto_355341 ?auto_355346 ) ) ( not ( = ?auto_355342 ?auto_355346 ) ) ( not ( = ?auto_355340 ?auto_355346 ) ) ( not ( = ?auto_355350 ?auto_355346 ) ) ( LIFTING ?auto_355349 ?auto_355344 ) ( IS-CRATE ?auto_355344 ) ( not ( = ?auto_355341 ?auto_355344 ) ) ( not ( = ?auto_355342 ?auto_355344 ) ) ( not ( = ?auto_355340 ?auto_355344 ) ) ( not ( = ?auto_355350 ?auto_355344 ) ) ( not ( = ?auto_355346 ?auto_355344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_355341 ?auto_355342 )
      ( MAKE-2CRATE-VERIFY ?auto_355340 ?auto_355341 ?auto_355342 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356139 - SURFACE
      ?auto_356140 - SURFACE
      ?auto_356141 - SURFACE
      ?auto_356143 - SURFACE
      ?auto_356142 - SURFACE
      ?auto_356144 - SURFACE
      ?auto_356145 - SURFACE
      ?auto_356146 - SURFACE
      ?auto_356147 - SURFACE
    )
    :vars
    (
      ?auto_356148 - HOIST
      ?auto_356149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_356148 ?auto_356149 ) ( SURFACE-AT ?auto_356146 ?auto_356149 ) ( CLEAR ?auto_356146 ) ( LIFTING ?auto_356148 ?auto_356147 ) ( IS-CRATE ?auto_356147 ) ( not ( = ?auto_356146 ?auto_356147 ) ) ( ON ?auto_356140 ?auto_356139 ) ( ON ?auto_356141 ?auto_356140 ) ( ON ?auto_356143 ?auto_356141 ) ( ON ?auto_356142 ?auto_356143 ) ( ON ?auto_356144 ?auto_356142 ) ( ON ?auto_356145 ?auto_356144 ) ( ON ?auto_356146 ?auto_356145 ) ( not ( = ?auto_356139 ?auto_356140 ) ) ( not ( = ?auto_356139 ?auto_356141 ) ) ( not ( = ?auto_356139 ?auto_356143 ) ) ( not ( = ?auto_356139 ?auto_356142 ) ) ( not ( = ?auto_356139 ?auto_356144 ) ) ( not ( = ?auto_356139 ?auto_356145 ) ) ( not ( = ?auto_356139 ?auto_356146 ) ) ( not ( = ?auto_356139 ?auto_356147 ) ) ( not ( = ?auto_356140 ?auto_356141 ) ) ( not ( = ?auto_356140 ?auto_356143 ) ) ( not ( = ?auto_356140 ?auto_356142 ) ) ( not ( = ?auto_356140 ?auto_356144 ) ) ( not ( = ?auto_356140 ?auto_356145 ) ) ( not ( = ?auto_356140 ?auto_356146 ) ) ( not ( = ?auto_356140 ?auto_356147 ) ) ( not ( = ?auto_356141 ?auto_356143 ) ) ( not ( = ?auto_356141 ?auto_356142 ) ) ( not ( = ?auto_356141 ?auto_356144 ) ) ( not ( = ?auto_356141 ?auto_356145 ) ) ( not ( = ?auto_356141 ?auto_356146 ) ) ( not ( = ?auto_356141 ?auto_356147 ) ) ( not ( = ?auto_356143 ?auto_356142 ) ) ( not ( = ?auto_356143 ?auto_356144 ) ) ( not ( = ?auto_356143 ?auto_356145 ) ) ( not ( = ?auto_356143 ?auto_356146 ) ) ( not ( = ?auto_356143 ?auto_356147 ) ) ( not ( = ?auto_356142 ?auto_356144 ) ) ( not ( = ?auto_356142 ?auto_356145 ) ) ( not ( = ?auto_356142 ?auto_356146 ) ) ( not ( = ?auto_356142 ?auto_356147 ) ) ( not ( = ?auto_356144 ?auto_356145 ) ) ( not ( = ?auto_356144 ?auto_356146 ) ) ( not ( = ?auto_356144 ?auto_356147 ) ) ( not ( = ?auto_356145 ?auto_356146 ) ) ( not ( = ?auto_356145 ?auto_356147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_356146 ?auto_356147 )
      ( MAKE-8CRATE-VERIFY ?auto_356139 ?auto_356140 ?auto_356141 ?auto_356143 ?auto_356142 ?auto_356144 ?auto_356145 ?auto_356146 ?auto_356147 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356206 - SURFACE
      ?auto_356207 - SURFACE
      ?auto_356208 - SURFACE
      ?auto_356210 - SURFACE
      ?auto_356209 - SURFACE
      ?auto_356211 - SURFACE
      ?auto_356212 - SURFACE
      ?auto_356213 - SURFACE
      ?auto_356214 - SURFACE
    )
    :vars
    (
      ?auto_356216 - HOIST
      ?auto_356215 - PLACE
      ?auto_356217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_356216 ?auto_356215 ) ( SURFACE-AT ?auto_356213 ?auto_356215 ) ( CLEAR ?auto_356213 ) ( IS-CRATE ?auto_356214 ) ( not ( = ?auto_356213 ?auto_356214 ) ) ( TRUCK-AT ?auto_356217 ?auto_356215 ) ( AVAILABLE ?auto_356216 ) ( IN ?auto_356214 ?auto_356217 ) ( ON ?auto_356213 ?auto_356212 ) ( not ( = ?auto_356212 ?auto_356213 ) ) ( not ( = ?auto_356212 ?auto_356214 ) ) ( ON ?auto_356207 ?auto_356206 ) ( ON ?auto_356208 ?auto_356207 ) ( ON ?auto_356210 ?auto_356208 ) ( ON ?auto_356209 ?auto_356210 ) ( ON ?auto_356211 ?auto_356209 ) ( ON ?auto_356212 ?auto_356211 ) ( not ( = ?auto_356206 ?auto_356207 ) ) ( not ( = ?auto_356206 ?auto_356208 ) ) ( not ( = ?auto_356206 ?auto_356210 ) ) ( not ( = ?auto_356206 ?auto_356209 ) ) ( not ( = ?auto_356206 ?auto_356211 ) ) ( not ( = ?auto_356206 ?auto_356212 ) ) ( not ( = ?auto_356206 ?auto_356213 ) ) ( not ( = ?auto_356206 ?auto_356214 ) ) ( not ( = ?auto_356207 ?auto_356208 ) ) ( not ( = ?auto_356207 ?auto_356210 ) ) ( not ( = ?auto_356207 ?auto_356209 ) ) ( not ( = ?auto_356207 ?auto_356211 ) ) ( not ( = ?auto_356207 ?auto_356212 ) ) ( not ( = ?auto_356207 ?auto_356213 ) ) ( not ( = ?auto_356207 ?auto_356214 ) ) ( not ( = ?auto_356208 ?auto_356210 ) ) ( not ( = ?auto_356208 ?auto_356209 ) ) ( not ( = ?auto_356208 ?auto_356211 ) ) ( not ( = ?auto_356208 ?auto_356212 ) ) ( not ( = ?auto_356208 ?auto_356213 ) ) ( not ( = ?auto_356208 ?auto_356214 ) ) ( not ( = ?auto_356210 ?auto_356209 ) ) ( not ( = ?auto_356210 ?auto_356211 ) ) ( not ( = ?auto_356210 ?auto_356212 ) ) ( not ( = ?auto_356210 ?auto_356213 ) ) ( not ( = ?auto_356210 ?auto_356214 ) ) ( not ( = ?auto_356209 ?auto_356211 ) ) ( not ( = ?auto_356209 ?auto_356212 ) ) ( not ( = ?auto_356209 ?auto_356213 ) ) ( not ( = ?auto_356209 ?auto_356214 ) ) ( not ( = ?auto_356211 ?auto_356212 ) ) ( not ( = ?auto_356211 ?auto_356213 ) ) ( not ( = ?auto_356211 ?auto_356214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356212 ?auto_356213 ?auto_356214 )
      ( MAKE-8CRATE-VERIFY ?auto_356206 ?auto_356207 ?auto_356208 ?auto_356210 ?auto_356209 ?auto_356211 ?auto_356212 ?auto_356213 ?auto_356214 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356282 - SURFACE
      ?auto_356283 - SURFACE
      ?auto_356284 - SURFACE
      ?auto_356286 - SURFACE
      ?auto_356285 - SURFACE
      ?auto_356287 - SURFACE
      ?auto_356288 - SURFACE
      ?auto_356289 - SURFACE
      ?auto_356290 - SURFACE
    )
    :vars
    (
      ?auto_356291 - HOIST
      ?auto_356292 - PLACE
      ?auto_356294 - TRUCK
      ?auto_356293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_356291 ?auto_356292 ) ( SURFACE-AT ?auto_356289 ?auto_356292 ) ( CLEAR ?auto_356289 ) ( IS-CRATE ?auto_356290 ) ( not ( = ?auto_356289 ?auto_356290 ) ) ( AVAILABLE ?auto_356291 ) ( IN ?auto_356290 ?auto_356294 ) ( ON ?auto_356289 ?auto_356288 ) ( not ( = ?auto_356288 ?auto_356289 ) ) ( not ( = ?auto_356288 ?auto_356290 ) ) ( TRUCK-AT ?auto_356294 ?auto_356293 ) ( not ( = ?auto_356293 ?auto_356292 ) ) ( ON ?auto_356283 ?auto_356282 ) ( ON ?auto_356284 ?auto_356283 ) ( ON ?auto_356286 ?auto_356284 ) ( ON ?auto_356285 ?auto_356286 ) ( ON ?auto_356287 ?auto_356285 ) ( ON ?auto_356288 ?auto_356287 ) ( not ( = ?auto_356282 ?auto_356283 ) ) ( not ( = ?auto_356282 ?auto_356284 ) ) ( not ( = ?auto_356282 ?auto_356286 ) ) ( not ( = ?auto_356282 ?auto_356285 ) ) ( not ( = ?auto_356282 ?auto_356287 ) ) ( not ( = ?auto_356282 ?auto_356288 ) ) ( not ( = ?auto_356282 ?auto_356289 ) ) ( not ( = ?auto_356282 ?auto_356290 ) ) ( not ( = ?auto_356283 ?auto_356284 ) ) ( not ( = ?auto_356283 ?auto_356286 ) ) ( not ( = ?auto_356283 ?auto_356285 ) ) ( not ( = ?auto_356283 ?auto_356287 ) ) ( not ( = ?auto_356283 ?auto_356288 ) ) ( not ( = ?auto_356283 ?auto_356289 ) ) ( not ( = ?auto_356283 ?auto_356290 ) ) ( not ( = ?auto_356284 ?auto_356286 ) ) ( not ( = ?auto_356284 ?auto_356285 ) ) ( not ( = ?auto_356284 ?auto_356287 ) ) ( not ( = ?auto_356284 ?auto_356288 ) ) ( not ( = ?auto_356284 ?auto_356289 ) ) ( not ( = ?auto_356284 ?auto_356290 ) ) ( not ( = ?auto_356286 ?auto_356285 ) ) ( not ( = ?auto_356286 ?auto_356287 ) ) ( not ( = ?auto_356286 ?auto_356288 ) ) ( not ( = ?auto_356286 ?auto_356289 ) ) ( not ( = ?auto_356286 ?auto_356290 ) ) ( not ( = ?auto_356285 ?auto_356287 ) ) ( not ( = ?auto_356285 ?auto_356288 ) ) ( not ( = ?auto_356285 ?auto_356289 ) ) ( not ( = ?auto_356285 ?auto_356290 ) ) ( not ( = ?auto_356287 ?auto_356288 ) ) ( not ( = ?auto_356287 ?auto_356289 ) ) ( not ( = ?auto_356287 ?auto_356290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356288 ?auto_356289 ?auto_356290 )
      ( MAKE-8CRATE-VERIFY ?auto_356282 ?auto_356283 ?auto_356284 ?auto_356286 ?auto_356285 ?auto_356287 ?auto_356288 ?auto_356289 ?auto_356290 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356366 - SURFACE
      ?auto_356367 - SURFACE
      ?auto_356368 - SURFACE
      ?auto_356370 - SURFACE
      ?auto_356369 - SURFACE
      ?auto_356371 - SURFACE
      ?auto_356372 - SURFACE
      ?auto_356373 - SURFACE
      ?auto_356374 - SURFACE
    )
    :vars
    (
      ?auto_356379 - HOIST
      ?auto_356376 - PLACE
      ?auto_356377 - TRUCK
      ?auto_356375 - PLACE
      ?auto_356378 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_356379 ?auto_356376 ) ( SURFACE-AT ?auto_356373 ?auto_356376 ) ( CLEAR ?auto_356373 ) ( IS-CRATE ?auto_356374 ) ( not ( = ?auto_356373 ?auto_356374 ) ) ( AVAILABLE ?auto_356379 ) ( ON ?auto_356373 ?auto_356372 ) ( not ( = ?auto_356372 ?auto_356373 ) ) ( not ( = ?auto_356372 ?auto_356374 ) ) ( TRUCK-AT ?auto_356377 ?auto_356375 ) ( not ( = ?auto_356375 ?auto_356376 ) ) ( HOIST-AT ?auto_356378 ?auto_356375 ) ( LIFTING ?auto_356378 ?auto_356374 ) ( not ( = ?auto_356379 ?auto_356378 ) ) ( ON ?auto_356367 ?auto_356366 ) ( ON ?auto_356368 ?auto_356367 ) ( ON ?auto_356370 ?auto_356368 ) ( ON ?auto_356369 ?auto_356370 ) ( ON ?auto_356371 ?auto_356369 ) ( ON ?auto_356372 ?auto_356371 ) ( not ( = ?auto_356366 ?auto_356367 ) ) ( not ( = ?auto_356366 ?auto_356368 ) ) ( not ( = ?auto_356366 ?auto_356370 ) ) ( not ( = ?auto_356366 ?auto_356369 ) ) ( not ( = ?auto_356366 ?auto_356371 ) ) ( not ( = ?auto_356366 ?auto_356372 ) ) ( not ( = ?auto_356366 ?auto_356373 ) ) ( not ( = ?auto_356366 ?auto_356374 ) ) ( not ( = ?auto_356367 ?auto_356368 ) ) ( not ( = ?auto_356367 ?auto_356370 ) ) ( not ( = ?auto_356367 ?auto_356369 ) ) ( not ( = ?auto_356367 ?auto_356371 ) ) ( not ( = ?auto_356367 ?auto_356372 ) ) ( not ( = ?auto_356367 ?auto_356373 ) ) ( not ( = ?auto_356367 ?auto_356374 ) ) ( not ( = ?auto_356368 ?auto_356370 ) ) ( not ( = ?auto_356368 ?auto_356369 ) ) ( not ( = ?auto_356368 ?auto_356371 ) ) ( not ( = ?auto_356368 ?auto_356372 ) ) ( not ( = ?auto_356368 ?auto_356373 ) ) ( not ( = ?auto_356368 ?auto_356374 ) ) ( not ( = ?auto_356370 ?auto_356369 ) ) ( not ( = ?auto_356370 ?auto_356371 ) ) ( not ( = ?auto_356370 ?auto_356372 ) ) ( not ( = ?auto_356370 ?auto_356373 ) ) ( not ( = ?auto_356370 ?auto_356374 ) ) ( not ( = ?auto_356369 ?auto_356371 ) ) ( not ( = ?auto_356369 ?auto_356372 ) ) ( not ( = ?auto_356369 ?auto_356373 ) ) ( not ( = ?auto_356369 ?auto_356374 ) ) ( not ( = ?auto_356371 ?auto_356372 ) ) ( not ( = ?auto_356371 ?auto_356373 ) ) ( not ( = ?auto_356371 ?auto_356374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356372 ?auto_356373 ?auto_356374 )
      ( MAKE-8CRATE-VERIFY ?auto_356366 ?auto_356367 ?auto_356368 ?auto_356370 ?auto_356369 ?auto_356371 ?auto_356372 ?auto_356373 ?auto_356374 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356458 - SURFACE
      ?auto_356459 - SURFACE
      ?auto_356460 - SURFACE
      ?auto_356462 - SURFACE
      ?auto_356461 - SURFACE
      ?auto_356463 - SURFACE
      ?auto_356464 - SURFACE
      ?auto_356465 - SURFACE
      ?auto_356466 - SURFACE
    )
    :vars
    (
      ?auto_356467 - HOIST
      ?auto_356468 - PLACE
      ?auto_356471 - TRUCK
      ?auto_356470 - PLACE
      ?auto_356472 - HOIST
      ?auto_356469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_356467 ?auto_356468 ) ( SURFACE-AT ?auto_356465 ?auto_356468 ) ( CLEAR ?auto_356465 ) ( IS-CRATE ?auto_356466 ) ( not ( = ?auto_356465 ?auto_356466 ) ) ( AVAILABLE ?auto_356467 ) ( ON ?auto_356465 ?auto_356464 ) ( not ( = ?auto_356464 ?auto_356465 ) ) ( not ( = ?auto_356464 ?auto_356466 ) ) ( TRUCK-AT ?auto_356471 ?auto_356470 ) ( not ( = ?auto_356470 ?auto_356468 ) ) ( HOIST-AT ?auto_356472 ?auto_356470 ) ( not ( = ?auto_356467 ?auto_356472 ) ) ( AVAILABLE ?auto_356472 ) ( SURFACE-AT ?auto_356466 ?auto_356470 ) ( ON ?auto_356466 ?auto_356469 ) ( CLEAR ?auto_356466 ) ( not ( = ?auto_356465 ?auto_356469 ) ) ( not ( = ?auto_356466 ?auto_356469 ) ) ( not ( = ?auto_356464 ?auto_356469 ) ) ( ON ?auto_356459 ?auto_356458 ) ( ON ?auto_356460 ?auto_356459 ) ( ON ?auto_356462 ?auto_356460 ) ( ON ?auto_356461 ?auto_356462 ) ( ON ?auto_356463 ?auto_356461 ) ( ON ?auto_356464 ?auto_356463 ) ( not ( = ?auto_356458 ?auto_356459 ) ) ( not ( = ?auto_356458 ?auto_356460 ) ) ( not ( = ?auto_356458 ?auto_356462 ) ) ( not ( = ?auto_356458 ?auto_356461 ) ) ( not ( = ?auto_356458 ?auto_356463 ) ) ( not ( = ?auto_356458 ?auto_356464 ) ) ( not ( = ?auto_356458 ?auto_356465 ) ) ( not ( = ?auto_356458 ?auto_356466 ) ) ( not ( = ?auto_356458 ?auto_356469 ) ) ( not ( = ?auto_356459 ?auto_356460 ) ) ( not ( = ?auto_356459 ?auto_356462 ) ) ( not ( = ?auto_356459 ?auto_356461 ) ) ( not ( = ?auto_356459 ?auto_356463 ) ) ( not ( = ?auto_356459 ?auto_356464 ) ) ( not ( = ?auto_356459 ?auto_356465 ) ) ( not ( = ?auto_356459 ?auto_356466 ) ) ( not ( = ?auto_356459 ?auto_356469 ) ) ( not ( = ?auto_356460 ?auto_356462 ) ) ( not ( = ?auto_356460 ?auto_356461 ) ) ( not ( = ?auto_356460 ?auto_356463 ) ) ( not ( = ?auto_356460 ?auto_356464 ) ) ( not ( = ?auto_356460 ?auto_356465 ) ) ( not ( = ?auto_356460 ?auto_356466 ) ) ( not ( = ?auto_356460 ?auto_356469 ) ) ( not ( = ?auto_356462 ?auto_356461 ) ) ( not ( = ?auto_356462 ?auto_356463 ) ) ( not ( = ?auto_356462 ?auto_356464 ) ) ( not ( = ?auto_356462 ?auto_356465 ) ) ( not ( = ?auto_356462 ?auto_356466 ) ) ( not ( = ?auto_356462 ?auto_356469 ) ) ( not ( = ?auto_356461 ?auto_356463 ) ) ( not ( = ?auto_356461 ?auto_356464 ) ) ( not ( = ?auto_356461 ?auto_356465 ) ) ( not ( = ?auto_356461 ?auto_356466 ) ) ( not ( = ?auto_356461 ?auto_356469 ) ) ( not ( = ?auto_356463 ?auto_356464 ) ) ( not ( = ?auto_356463 ?auto_356465 ) ) ( not ( = ?auto_356463 ?auto_356466 ) ) ( not ( = ?auto_356463 ?auto_356469 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356464 ?auto_356465 ?auto_356466 )
      ( MAKE-8CRATE-VERIFY ?auto_356458 ?auto_356459 ?auto_356460 ?auto_356462 ?auto_356461 ?auto_356463 ?auto_356464 ?auto_356465 ?auto_356466 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356551 - SURFACE
      ?auto_356552 - SURFACE
      ?auto_356553 - SURFACE
      ?auto_356555 - SURFACE
      ?auto_356554 - SURFACE
      ?auto_356556 - SURFACE
      ?auto_356557 - SURFACE
      ?auto_356558 - SURFACE
      ?auto_356559 - SURFACE
    )
    :vars
    (
      ?auto_356564 - HOIST
      ?auto_356561 - PLACE
      ?auto_356562 - PLACE
      ?auto_356565 - HOIST
      ?auto_356563 - SURFACE
      ?auto_356560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_356564 ?auto_356561 ) ( SURFACE-AT ?auto_356558 ?auto_356561 ) ( CLEAR ?auto_356558 ) ( IS-CRATE ?auto_356559 ) ( not ( = ?auto_356558 ?auto_356559 ) ) ( AVAILABLE ?auto_356564 ) ( ON ?auto_356558 ?auto_356557 ) ( not ( = ?auto_356557 ?auto_356558 ) ) ( not ( = ?auto_356557 ?auto_356559 ) ) ( not ( = ?auto_356562 ?auto_356561 ) ) ( HOIST-AT ?auto_356565 ?auto_356562 ) ( not ( = ?auto_356564 ?auto_356565 ) ) ( AVAILABLE ?auto_356565 ) ( SURFACE-AT ?auto_356559 ?auto_356562 ) ( ON ?auto_356559 ?auto_356563 ) ( CLEAR ?auto_356559 ) ( not ( = ?auto_356558 ?auto_356563 ) ) ( not ( = ?auto_356559 ?auto_356563 ) ) ( not ( = ?auto_356557 ?auto_356563 ) ) ( TRUCK-AT ?auto_356560 ?auto_356561 ) ( ON ?auto_356552 ?auto_356551 ) ( ON ?auto_356553 ?auto_356552 ) ( ON ?auto_356555 ?auto_356553 ) ( ON ?auto_356554 ?auto_356555 ) ( ON ?auto_356556 ?auto_356554 ) ( ON ?auto_356557 ?auto_356556 ) ( not ( = ?auto_356551 ?auto_356552 ) ) ( not ( = ?auto_356551 ?auto_356553 ) ) ( not ( = ?auto_356551 ?auto_356555 ) ) ( not ( = ?auto_356551 ?auto_356554 ) ) ( not ( = ?auto_356551 ?auto_356556 ) ) ( not ( = ?auto_356551 ?auto_356557 ) ) ( not ( = ?auto_356551 ?auto_356558 ) ) ( not ( = ?auto_356551 ?auto_356559 ) ) ( not ( = ?auto_356551 ?auto_356563 ) ) ( not ( = ?auto_356552 ?auto_356553 ) ) ( not ( = ?auto_356552 ?auto_356555 ) ) ( not ( = ?auto_356552 ?auto_356554 ) ) ( not ( = ?auto_356552 ?auto_356556 ) ) ( not ( = ?auto_356552 ?auto_356557 ) ) ( not ( = ?auto_356552 ?auto_356558 ) ) ( not ( = ?auto_356552 ?auto_356559 ) ) ( not ( = ?auto_356552 ?auto_356563 ) ) ( not ( = ?auto_356553 ?auto_356555 ) ) ( not ( = ?auto_356553 ?auto_356554 ) ) ( not ( = ?auto_356553 ?auto_356556 ) ) ( not ( = ?auto_356553 ?auto_356557 ) ) ( not ( = ?auto_356553 ?auto_356558 ) ) ( not ( = ?auto_356553 ?auto_356559 ) ) ( not ( = ?auto_356553 ?auto_356563 ) ) ( not ( = ?auto_356555 ?auto_356554 ) ) ( not ( = ?auto_356555 ?auto_356556 ) ) ( not ( = ?auto_356555 ?auto_356557 ) ) ( not ( = ?auto_356555 ?auto_356558 ) ) ( not ( = ?auto_356555 ?auto_356559 ) ) ( not ( = ?auto_356555 ?auto_356563 ) ) ( not ( = ?auto_356554 ?auto_356556 ) ) ( not ( = ?auto_356554 ?auto_356557 ) ) ( not ( = ?auto_356554 ?auto_356558 ) ) ( not ( = ?auto_356554 ?auto_356559 ) ) ( not ( = ?auto_356554 ?auto_356563 ) ) ( not ( = ?auto_356556 ?auto_356557 ) ) ( not ( = ?auto_356556 ?auto_356558 ) ) ( not ( = ?auto_356556 ?auto_356559 ) ) ( not ( = ?auto_356556 ?auto_356563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356557 ?auto_356558 ?auto_356559 )
      ( MAKE-8CRATE-VERIFY ?auto_356551 ?auto_356552 ?auto_356553 ?auto_356555 ?auto_356554 ?auto_356556 ?auto_356557 ?auto_356558 ?auto_356559 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356644 - SURFACE
      ?auto_356645 - SURFACE
      ?auto_356646 - SURFACE
      ?auto_356648 - SURFACE
      ?auto_356647 - SURFACE
      ?auto_356649 - SURFACE
      ?auto_356650 - SURFACE
      ?auto_356651 - SURFACE
      ?auto_356652 - SURFACE
    )
    :vars
    (
      ?auto_356655 - HOIST
      ?auto_356654 - PLACE
      ?auto_356657 - PLACE
      ?auto_356656 - HOIST
      ?auto_356658 - SURFACE
      ?auto_356653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_356655 ?auto_356654 ) ( IS-CRATE ?auto_356652 ) ( not ( = ?auto_356651 ?auto_356652 ) ) ( not ( = ?auto_356650 ?auto_356651 ) ) ( not ( = ?auto_356650 ?auto_356652 ) ) ( not ( = ?auto_356657 ?auto_356654 ) ) ( HOIST-AT ?auto_356656 ?auto_356657 ) ( not ( = ?auto_356655 ?auto_356656 ) ) ( AVAILABLE ?auto_356656 ) ( SURFACE-AT ?auto_356652 ?auto_356657 ) ( ON ?auto_356652 ?auto_356658 ) ( CLEAR ?auto_356652 ) ( not ( = ?auto_356651 ?auto_356658 ) ) ( not ( = ?auto_356652 ?auto_356658 ) ) ( not ( = ?auto_356650 ?auto_356658 ) ) ( TRUCK-AT ?auto_356653 ?auto_356654 ) ( SURFACE-AT ?auto_356650 ?auto_356654 ) ( CLEAR ?auto_356650 ) ( LIFTING ?auto_356655 ?auto_356651 ) ( IS-CRATE ?auto_356651 ) ( ON ?auto_356645 ?auto_356644 ) ( ON ?auto_356646 ?auto_356645 ) ( ON ?auto_356648 ?auto_356646 ) ( ON ?auto_356647 ?auto_356648 ) ( ON ?auto_356649 ?auto_356647 ) ( ON ?auto_356650 ?auto_356649 ) ( not ( = ?auto_356644 ?auto_356645 ) ) ( not ( = ?auto_356644 ?auto_356646 ) ) ( not ( = ?auto_356644 ?auto_356648 ) ) ( not ( = ?auto_356644 ?auto_356647 ) ) ( not ( = ?auto_356644 ?auto_356649 ) ) ( not ( = ?auto_356644 ?auto_356650 ) ) ( not ( = ?auto_356644 ?auto_356651 ) ) ( not ( = ?auto_356644 ?auto_356652 ) ) ( not ( = ?auto_356644 ?auto_356658 ) ) ( not ( = ?auto_356645 ?auto_356646 ) ) ( not ( = ?auto_356645 ?auto_356648 ) ) ( not ( = ?auto_356645 ?auto_356647 ) ) ( not ( = ?auto_356645 ?auto_356649 ) ) ( not ( = ?auto_356645 ?auto_356650 ) ) ( not ( = ?auto_356645 ?auto_356651 ) ) ( not ( = ?auto_356645 ?auto_356652 ) ) ( not ( = ?auto_356645 ?auto_356658 ) ) ( not ( = ?auto_356646 ?auto_356648 ) ) ( not ( = ?auto_356646 ?auto_356647 ) ) ( not ( = ?auto_356646 ?auto_356649 ) ) ( not ( = ?auto_356646 ?auto_356650 ) ) ( not ( = ?auto_356646 ?auto_356651 ) ) ( not ( = ?auto_356646 ?auto_356652 ) ) ( not ( = ?auto_356646 ?auto_356658 ) ) ( not ( = ?auto_356648 ?auto_356647 ) ) ( not ( = ?auto_356648 ?auto_356649 ) ) ( not ( = ?auto_356648 ?auto_356650 ) ) ( not ( = ?auto_356648 ?auto_356651 ) ) ( not ( = ?auto_356648 ?auto_356652 ) ) ( not ( = ?auto_356648 ?auto_356658 ) ) ( not ( = ?auto_356647 ?auto_356649 ) ) ( not ( = ?auto_356647 ?auto_356650 ) ) ( not ( = ?auto_356647 ?auto_356651 ) ) ( not ( = ?auto_356647 ?auto_356652 ) ) ( not ( = ?auto_356647 ?auto_356658 ) ) ( not ( = ?auto_356649 ?auto_356650 ) ) ( not ( = ?auto_356649 ?auto_356651 ) ) ( not ( = ?auto_356649 ?auto_356652 ) ) ( not ( = ?auto_356649 ?auto_356658 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356650 ?auto_356651 ?auto_356652 )
      ( MAKE-8CRATE-VERIFY ?auto_356644 ?auto_356645 ?auto_356646 ?auto_356648 ?auto_356647 ?auto_356649 ?auto_356650 ?auto_356651 ?auto_356652 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_356737 - SURFACE
      ?auto_356738 - SURFACE
      ?auto_356739 - SURFACE
      ?auto_356741 - SURFACE
      ?auto_356740 - SURFACE
      ?auto_356742 - SURFACE
      ?auto_356743 - SURFACE
      ?auto_356744 - SURFACE
      ?auto_356745 - SURFACE
    )
    :vars
    (
      ?auto_356746 - HOIST
      ?auto_356748 - PLACE
      ?auto_356750 - PLACE
      ?auto_356747 - HOIST
      ?auto_356749 - SURFACE
      ?auto_356751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_356746 ?auto_356748 ) ( IS-CRATE ?auto_356745 ) ( not ( = ?auto_356744 ?auto_356745 ) ) ( not ( = ?auto_356743 ?auto_356744 ) ) ( not ( = ?auto_356743 ?auto_356745 ) ) ( not ( = ?auto_356750 ?auto_356748 ) ) ( HOIST-AT ?auto_356747 ?auto_356750 ) ( not ( = ?auto_356746 ?auto_356747 ) ) ( AVAILABLE ?auto_356747 ) ( SURFACE-AT ?auto_356745 ?auto_356750 ) ( ON ?auto_356745 ?auto_356749 ) ( CLEAR ?auto_356745 ) ( not ( = ?auto_356744 ?auto_356749 ) ) ( not ( = ?auto_356745 ?auto_356749 ) ) ( not ( = ?auto_356743 ?auto_356749 ) ) ( TRUCK-AT ?auto_356751 ?auto_356748 ) ( SURFACE-AT ?auto_356743 ?auto_356748 ) ( CLEAR ?auto_356743 ) ( IS-CRATE ?auto_356744 ) ( AVAILABLE ?auto_356746 ) ( IN ?auto_356744 ?auto_356751 ) ( ON ?auto_356738 ?auto_356737 ) ( ON ?auto_356739 ?auto_356738 ) ( ON ?auto_356741 ?auto_356739 ) ( ON ?auto_356740 ?auto_356741 ) ( ON ?auto_356742 ?auto_356740 ) ( ON ?auto_356743 ?auto_356742 ) ( not ( = ?auto_356737 ?auto_356738 ) ) ( not ( = ?auto_356737 ?auto_356739 ) ) ( not ( = ?auto_356737 ?auto_356741 ) ) ( not ( = ?auto_356737 ?auto_356740 ) ) ( not ( = ?auto_356737 ?auto_356742 ) ) ( not ( = ?auto_356737 ?auto_356743 ) ) ( not ( = ?auto_356737 ?auto_356744 ) ) ( not ( = ?auto_356737 ?auto_356745 ) ) ( not ( = ?auto_356737 ?auto_356749 ) ) ( not ( = ?auto_356738 ?auto_356739 ) ) ( not ( = ?auto_356738 ?auto_356741 ) ) ( not ( = ?auto_356738 ?auto_356740 ) ) ( not ( = ?auto_356738 ?auto_356742 ) ) ( not ( = ?auto_356738 ?auto_356743 ) ) ( not ( = ?auto_356738 ?auto_356744 ) ) ( not ( = ?auto_356738 ?auto_356745 ) ) ( not ( = ?auto_356738 ?auto_356749 ) ) ( not ( = ?auto_356739 ?auto_356741 ) ) ( not ( = ?auto_356739 ?auto_356740 ) ) ( not ( = ?auto_356739 ?auto_356742 ) ) ( not ( = ?auto_356739 ?auto_356743 ) ) ( not ( = ?auto_356739 ?auto_356744 ) ) ( not ( = ?auto_356739 ?auto_356745 ) ) ( not ( = ?auto_356739 ?auto_356749 ) ) ( not ( = ?auto_356741 ?auto_356740 ) ) ( not ( = ?auto_356741 ?auto_356742 ) ) ( not ( = ?auto_356741 ?auto_356743 ) ) ( not ( = ?auto_356741 ?auto_356744 ) ) ( not ( = ?auto_356741 ?auto_356745 ) ) ( not ( = ?auto_356741 ?auto_356749 ) ) ( not ( = ?auto_356740 ?auto_356742 ) ) ( not ( = ?auto_356740 ?auto_356743 ) ) ( not ( = ?auto_356740 ?auto_356744 ) ) ( not ( = ?auto_356740 ?auto_356745 ) ) ( not ( = ?auto_356740 ?auto_356749 ) ) ( not ( = ?auto_356742 ?auto_356743 ) ) ( not ( = ?auto_356742 ?auto_356744 ) ) ( not ( = ?auto_356742 ?auto_356745 ) ) ( not ( = ?auto_356742 ?auto_356749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_356743 ?auto_356744 ?auto_356745 )
      ( MAKE-8CRATE-VERIFY ?auto_356737 ?auto_356738 ?auto_356739 ?auto_356741 ?auto_356740 ?auto_356742 ?auto_356743 ?auto_356744 ?auto_356745 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_360823 - SURFACE
      ?auto_360824 - SURFACE
      ?auto_360825 - SURFACE
      ?auto_360827 - SURFACE
      ?auto_360826 - SURFACE
      ?auto_360828 - SURFACE
      ?auto_360829 - SURFACE
      ?auto_360830 - SURFACE
      ?auto_360831 - SURFACE
      ?auto_360832 - SURFACE
    )
    :vars
    (
      ?auto_360834 - HOIST
      ?auto_360833 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_360834 ?auto_360833 ) ( SURFACE-AT ?auto_360831 ?auto_360833 ) ( CLEAR ?auto_360831 ) ( LIFTING ?auto_360834 ?auto_360832 ) ( IS-CRATE ?auto_360832 ) ( not ( = ?auto_360831 ?auto_360832 ) ) ( ON ?auto_360824 ?auto_360823 ) ( ON ?auto_360825 ?auto_360824 ) ( ON ?auto_360827 ?auto_360825 ) ( ON ?auto_360826 ?auto_360827 ) ( ON ?auto_360828 ?auto_360826 ) ( ON ?auto_360829 ?auto_360828 ) ( ON ?auto_360830 ?auto_360829 ) ( ON ?auto_360831 ?auto_360830 ) ( not ( = ?auto_360823 ?auto_360824 ) ) ( not ( = ?auto_360823 ?auto_360825 ) ) ( not ( = ?auto_360823 ?auto_360827 ) ) ( not ( = ?auto_360823 ?auto_360826 ) ) ( not ( = ?auto_360823 ?auto_360828 ) ) ( not ( = ?auto_360823 ?auto_360829 ) ) ( not ( = ?auto_360823 ?auto_360830 ) ) ( not ( = ?auto_360823 ?auto_360831 ) ) ( not ( = ?auto_360823 ?auto_360832 ) ) ( not ( = ?auto_360824 ?auto_360825 ) ) ( not ( = ?auto_360824 ?auto_360827 ) ) ( not ( = ?auto_360824 ?auto_360826 ) ) ( not ( = ?auto_360824 ?auto_360828 ) ) ( not ( = ?auto_360824 ?auto_360829 ) ) ( not ( = ?auto_360824 ?auto_360830 ) ) ( not ( = ?auto_360824 ?auto_360831 ) ) ( not ( = ?auto_360824 ?auto_360832 ) ) ( not ( = ?auto_360825 ?auto_360827 ) ) ( not ( = ?auto_360825 ?auto_360826 ) ) ( not ( = ?auto_360825 ?auto_360828 ) ) ( not ( = ?auto_360825 ?auto_360829 ) ) ( not ( = ?auto_360825 ?auto_360830 ) ) ( not ( = ?auto_360825 ?auto_360831 ) ) ( not ( = ?auto_360825 ?auto_360832 ) ) ( not ( = ?auto_360827 ?auto_360826 ) ) ( not ( = ?auto_360827 ?auto_360828 ) ) ( not ( = ?auto_360827 ?auto_360829 ) ) ( not ( = ?auto_360827 ?auto_360830 ) ) ( not ( = ?auto_360827 ?auto_360831 ) ) ( not ( = ?auto_360827 ?auto_360832 ) ) ( not ( = ?auto_360826 ?auto_360828 ) ) ( not ( = ?auto_360826 ?auto_360829 ) ) ( not ( = ?auto_360826 ?auto_360830 ) ) ( not ( = ?auto_360826 ?auto_360831 ) ) ( not ( = ?auto_360826 ?auto_360832 ) ) ( not ( = ?auto_360828 ?auto_360829 ) ) ( not ( = ?auto_360828 ?auto_360830 ) ) ( not ( = ?auto_360828 ?auto_360831 ) ) ( not ( = ?auto_360828 ?auto_360832 ) ) ( not ( = ?auto_360829 ?auto_360830 ) ) ( not ( = ?auto_360829 ?auto_360831 ) ) ( not ( = ?auto_360829 ?auto_360832 ) ) ( not ( = ?auto_360830 ?auto_360831 ) ) ( not ( = ?auto_360830 ?auto_360832 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_360831 ?auto_360832 )
      ( MAKE-9CRATE-VERIFY ?auto_360823 ?auto_360824 ?auto_360825 ?auto_360827 ?auto_360826 ?auto_360828 ?auto_360829 ?auto_360830 ?auto_360831 ?auto_360832 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_360903 - SURFACE
      ?auto_360904 - SURFACE
      ?auto_360905 - SURFACE
      ?auto_360907 - SURFACE
      ?auto_360906 - SURFACE
      ?auto_360908 - SURFACE
      ?auto_360909 - SURFACE
      ?auto_360910 - SURFACE
      ?auto_360911 - SURFACE
      ?auto_360912 - SURFACE
    )
    :vars
    (
      ?auto_360915 - HOIST
      ?auto_360914 - PLACE
      ?auto_360913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_360915 ?auto_360914 ) ( SURFACE-AT ?auto_360911 ?auto_360914 ) ( CLEAR ?auto_360911 ) ( IS-CRATE ?auto_360912 ) ( not ( = ?auto_360911 ?auto_360912 ) ) ( TRUCK-AT ?auto_360913 ?auto_360914 ) ( AVAILABLE ?auto_360915 ) ( IN ?auto_360912 ?auto_360913 ) ( ON ?auto_360911 ?auto_360910 ) ( not ( = ?auto_360910 ?auto_360911 ) ) ( not ( = ?auto_360910 ?auto_360912 ) ) ( ON ?auto_360904 ?auto_360903 ) ( ON ?auto_360905 ?auto_360904 ) ( ON ?auto_360907 ?auto_360905 ) ( ON ?auto_360906 ?auto_360907 ) ( ON ?auto_360908 ?auto_360906 ) ( ON ?auto_360909 ?auto_360908 ) ( ON ?auto_360910 ?auto_360909 ) ( not ( = ?auto_360903 ?auto_360904 ) ) ( not ( = ?auto_360903 ?auto_360905 ) ) ( not ( = ?auto_360903 ?auto_360907 ) ) ( not ( = ?auto_360903 ?auto_360906 ) ) ( not ( = ?auto_360903 ?auto_360908 ) ) ( not ( = ?auto_360903 ?auto_360909 ) ) ( not ( = ?auto_360903 ?auto_360910 ) ) ( not ( = ?auto_360903 ?auto_360911 ) ) ( not ( = ?auto_360903 ?auto_360912 ) ) ( not ( = ?auto_360904 ?auto_360905 ) ) ( not ( = ?auto_360904 ?auto_360907 ) ) ( not ( = ?auto_360904 ?auto_360906 ) ) ( not ( = ?auto_360904 ?auto_360908 ) ) ( not ( = ?auto_360904 ?auto_360909 ) ) ( not ( = ?auto_360904 ?auto_360910 ) ) ( not ( = ?auto_360904 ?auto_360911 ) ) ( not ( = ?auto_360904 ?auto_360912 ) ) ( not ( = ?auto_360905 ?auto_360907 ) ) ( not ( = ?auto_360905 ?auto_360906 ) ) ( not ( = ?auto_360905 ?auto_360908 ) ) ( not ( = ?auto_360905 ?auto_360909 ) ) ( not ( = ?auto_360905 ?auto_360910 ) ) ( not ( = ?auto_360905 ?auto_360911 ) ) ( not ( = ?auto_360905 ?auto_360912 ) ) ( not ( = ?auto_360907 ?auto_360906 ) ) ( not ( = ?auto_360907 ?auto_360908 ) ) ( not ( = ?auto_360907 ?auto_360909 ) ) ( not ( = ?auto_360907 ?auto_360910 ) ) ( not ( = ?auto_360907 ?auto_360911 ) ) ( not ( = ?auto_360907 ?auto_360912 ) ) ( not ( = ?auto_360906 ?auto_360908 ) ) ( not ( = ?auto_360906 ?auto_360909 ) ) ( not ( = ?auto_360906 ?auto_360910 ) ) ( not ( = ?auto_360906 ?auto_360911 ) ) ( not ( = ?auto_360906 ?auto_360912 ) ) ( not ( = ?auto_360908 ?auto_360909 ) ) ( not ( = ?auto_360908 ?auto_360910 ) ) ( not ( = ?auto_360908 ?auto_360911 ) ) ( not ( = ?auto_360908 ?auto_360912 ) ) ( not ( = ?auto_360909 ?auto_360910 ) ) ( not ( = ?auto_360909 ?auto_360911 ) ) ( not ( = ?auto_360909 ?auto_360912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_360910 ?auto_360911 ?auto_360912 )
      ( MAKE-9CRATE-VERIFY ?auto_360903 ?auto_360904 ?auto_360905 ?auto_360907 ?auto_360906 ?auto_360908 ?auto_360909 ?auto_360910 ?auto_360911 ?auto_360912 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_360993 - SURFACE
      ?auto_360994 - SURFACE
      ?auto_360995 - SURFACE
      ?auto_360997 - SURFACE
      ?auto_360996 - SURFACE
      ?auto_360998 - SURFACE
      ?auto_360999 - SURFACE
      ?auto_361000 - SURFACE
      ?auto_361001 - SURFACE
      ?auto_361002 - SURFACE
    )
    :vars
    (
      ?auto_361006 - HOIST
      ?auto_361004 - PLACE
      ?auto_361005 - TRUCK
      ?auto_361003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361006 ?auto_361004 ) ( SURFACE-AT ?auto_361001 ?auto_361004 ) ( CLEAR ?auto_361001 ) ( IS-CRATE ?auto_361002 ) ( not ( = ?auto_361001 ?auto_361002 ) ) ( AVAILABLE ?auto_361006 ) ( IN ?auto_361002 ?auto_361005 ) ( ON ?auto_361001 ?auto_361000 ) ( not ( = ?auto_361000 ?auto_361001 ) ) ( not ( = ?auto_361000 ?auto_361002 ) ) ( TRUCK-AT ?auto_361005 ?auto_361003 ) ( not ( = ?auto_361003 ?auto_361004 ) ) ( ON ?auto_360994 ?auto_360993 ) ( ON ?auto_360995 ?auto_360994 ) ( ON ?auto_360997 ?auto_360995 ) ( ON ?auto_360996 ?auto_360997 ) ( ON ?auto_360998 ?auto_360996 ) ( ON ?auto_360999 ?auto_360998 ) ( ON ?auto_361000 ?auto_360999 ) ( not ( = ?auto_360993 ?auto_360994 ) ) ( not ( = ?auto_360993 ?auto_360995 ) ) ( not ( = ?auto_360993 ?auto_360997 ) ) ( not ( = ?auto_360993 ?auto_360996 ) ) ( not ( = ?auto_360993 ?auto_360998 ) ) ( not ( = ?auto_360993 ?auto_360999 ) ) ( not ( = ?auto_360993 ?auto_361000 ) ) ( not ( = ?auto_360993 ?auto_361001 ) ) ( not ( = ?auto_360993 ?auto_361002 ) ) ( not ( = ?auto_360994 ?auto_360995 ) ) ( not ( = ?auto_360994 ?auto_360997 ) ) ( not ( = ?auto_360994 ?auto_360996 ) ) ( not ( = ?auto_360994 ?auto_360998 ) ) ( not ( = ?auto_360994 ?auto_360999 ) ) ( not ( = ?auto_360994 ?auto_361000 ) ) ( not ( = ?auto_360994 ?auto_361001 ) ) ( not ( = ?auto_360994 ?auto_361002 ) ) ( not ( = ?auto_360995 ?auto_360997 ) ) ( not ( = ?auto_360995 ?auto_360996 ) ) ( not ( = ?auto_360995 ?auto_360998 ) ) ( not ( = ?auto_360995 ?auto_360999 ) ) ( not ( = ?auto_360995 ?auto_361000 ) ) ( not ( = ?auto_360995 ?auto_361001 ) ) ( not ( = ?auto_360995 ?auto_361002 ) ) ( not ( = ?auto_360997 ?auto_360996 ) ) ( not ( = ?auto_360997 ?auto_360998 ) ) ( not ( = ?auto_360997 ?auto_360999 ) ) ( not ( = ?auto_360997 ?auto_361000 ) ) ( not ( = ?auto_360997 ?auto_361001 ) ) ( not ( = ?auto_360997 ?auto_361002 ) ) ( not ( = ?auto_360996 ?auto_360998 ) ) ( not ( = ?auto_360996 ?auto_360999 ) ) ( not ( = ?auto_360996 ?auto_361000 ) ) ( not ( = ?auto_360996 ?auto_361001 ) ) ( not ( = ?auto_360996 ?auto_361002 ) ) ( not ( = ?auto_360998 ?auto_360999 ) ) ( not ( = ?auto_360998 ?auto_361000 ) ) ( not ( = ?auto_360998 ?auto_361001 ) ) ( not ( = ?auto_360998 ?auto_361002 ) ) ( not ( = ?auto_360999 ?auto_361000 ) ) ( not ( = ?auto_360999 ?auto_361001 ) ) ( not ( = ?auto_360999 ?auto_361002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361000 ?auto_361001 ?auto_361002 )
      ( MAKE-9CRATE-VERIFY ?auto_360993 ?auto_360994 ?auto_360995 ?auto_360997 ?auto_360996 ?auto_360998 ?auto_360999 ?auto_361000 ?auto_361001 ?auto_361002 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361092 - SURFACE
      ?auto_361093 - SURFACE
      ?auto_361094 - SURFACE
      ?auto_361096 - SURFACE
      ?auto_361095 - SURFACE
      ?auto_361097 - SURFACE
      ?auto_361098 - SURFACE
      ?auto_361099 - SURFACE
      ?auto_361100 - SURFACE
      ?auto_361101 - SURFACE
    )
    :vars
    (
      ?auto_361106 - HOIST
      ?auto_361103 - PLACE
      ?auto_361104 - TRUCK
      ?auto_361105 - PLACE
      ?auto_361102 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_361106 ?auto_361103 ) ( SURFACE-AT ?auto_361100 ?auto_361103 ) ( CLEAR ?auto_361100 ) ( IS-CRATE ?auto_361101 ) ( not ( = ?auto_361100 ?auto_361101 ) ) ( AVAILABLE ?auto_361106 ) ( ON ?auto_361100 ?auto_361099 ) ( not ( = ?auto_361099 ?auto_361100 ) ) ( not ( = ?auto_361099 ?auto_361101 ) ) ( TRUCK-AT ?auto_361104 ?auto_361105 ) ( not ( = ?auto_361105 ?auto_361103 ) ) ( HOIST-AT ?auto_361102 ?auto_361105 ) ( LIFTING ?auto_361102 ?auto_361101 ) ( not ( = ?auto_361106 ?auto_361102 ) ) ( ON ?auto_361093 ?auto_361092 ) ( ON ?auto_361094 ?auto_361093 ) ( ON ?auto_361096 ?auto_361094 ) ( ON ?auto_361095 ?auto_361096 ) ( ON ?auto_361097 ?auto_361095 ) ( ON ?auto_361098 ?auto_361097 ) ( ON ?auto_361099 ?auto_361098 ) ( not ( = ?auto_361092 ?auto_361093 ) ) ( not ( = ?auto_361092 ?auto_361094 ) ) ( not ( = ?auto_361092 ?auto_361096 ) ) ( not ( = ?auto_361092 ?auto_361095 ) ) ( not ( = ?auto_361092 ?auto_361097 ) ) ( not ( = ?auto_361092 ?auto_361098 ) ) ( not ( = ?auto_361092 ?auto_361099 ) ) ( not ( = ?auto_361092 ?auto_361100 ) ) ( not ( = ?auto_361092 ?auto_361101 ) ) ( not ( = ?auto_361093 ?auto_361094 ) ) ( not ( = ?auto_361093 ?auto_361096 ) ) ( not ( = ?auto_361093 ?auto_361095 ) ) ( not ( = ?auto_361093 ?auto_361097 ) ) ( not ( = ?auto_361093 ?auto_361098 ) ) ( not ( = ?auto_361093 ?auto_361099 ) ) ( not ( = ?auto_361093 ?auto_361100 ) ) ( not ( = ?auto_361093 ?auto_361101 ) ) ( not ( = ?auto_361094 ?auto_361096 ) ) ( not ( = ?auto_361094 ?auto_361095 ) ) ( not ( = ?auto_361094 ?auto_361097 ) ) ( not ( = ?auto_361094 ?auto_361098 ) ) ( not ( = ?auto_361094 ?auto_361099 ) ) ( not ( = ?auto_361094 ?auto_361100 ) ) ( not ( = ?auto_361094 ?auto_361101 ) ) ( not ( = ?auto_361096 ?auto_361095 ) ) ( not ( = ?auto_361096 ?auto_361097 ) ) ( not ( = ?auto_361096 ?auto_361098 ) ) ( not ( = ?auto_361096 ?auto_361099 ) ) ( not ( = ?auto_361096 ?auto_361100 ) ) ( not ( = ?auto_361096 ?auto_361101 ) ) ( not ( = ?auto_361095 ?auto_361097 ) ) ( not ( = ?auto_361095 ?auto_361098 ) ) ( not ( = ?auto_361095 ?auto_361099 ) ) ( not ( = ?auto_361095 ?auto_361100 ) ) ( not ( = ?auto_361095 ?auto_361101 ) ) ( not ( = ?auto_361097 ?auto_361098 ) ) ( not ( = ?auto_361097 ?auto_361099 ) ) ( not ( = ?auto_361097 ?auto_361100 ) ) ( not ( = ?auto_361097 ?auto_361101 ) ) ( not ( = ?auto_361098 ?auto_361099 ) ) ( not ( = ?auto_361098 ?auto_361100 ) ) ( not ( = ?auto_361098 ?auto_361101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361099 ?auto_361100 ?auto_361101 )
      ( MAKE-9CRATE-VERIFY ?auto_361092 ?auto_361093 ?auto_361094 ?auto_361096 ?auto_361095 ?auto_361097 ?auto_361098 ?auto_361099 ?auto_361100 ?auto_361101 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361200 - SURFACE
      ?auto_361201 - SURFACE
      ?auto_361202 - SURFACE
      ?auto_361204 - SURFACE
      ?auto_361203 - SURFACE
      ?auto_361205 - SURFACE
      ?auto_361206 - SURFACE
      ?auto_361207 - SURFACE
      ?auto_361208 - SURFACE
      ?auto_361209 - SURFACE
    )
    :vars
    (
      ?auto_361214 - HOIST
      ?auto_361213 - PLACE
      ?auto_361215 - TRUCK
      ?auto_361211 - PLACE
      ?auto_361210 - HOIST
      ?auto_361212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_361214 ?auto_361213 ) ( SURFACE-AT ?auto_361208 ?auto_361213 ) ( CLEAR ?auto_361208 ) ( IS-CRATE ?auto_361209 ) ( not ( = ?auto_361208 ?auto_361209 ) ) ( AVAILABLE ?auto_361214 ) ( ON ?auto_361208 ?auto_361207 ) ( not ( = ?auto_361207 ?auto_361208 ) ) ( not ( = ?auto_361207 ?auto_361209 ) ) ( TRUCK-AT ?auto_361215 ?auto_361211 ) ( not ( = ?auto_361211 ?auto_361213 ) ) ( HOIST-AT ?auto_361210 ?auto_361211 ) ( not ( = ?auto_361214 ?auto_361210 ) ) ( AVAILABLE ?auto_361210 ) ( SURFACE-AT ?auto_361209 ?auto_361211 ) ( ON ?auto_361209 ?auto_361212 ) ( CLEAR ?auto_361209 ) ( not ( = ?auto_361208 ?auto_361212 ) ) ( not ( = ?auto_361209 ?auto_361212 ) ) ( not ( = ?auto_361207 ?auto_361212 ) ) ( ON ?auto_361201 ?auto_361200 ) ( ON ?auto_361202 ?auto_361201 ) ( ON ?auto_361204 ?auto_361202 ) ( ON ?auto_361203 ?auto_361204 ) ( ON ?auto_361205 ?auto_361203 ) ( ON ?auto_361206 ?auto_361205 ) ( ON ?auto_361207 ?auto_361206 ) ( not ( = ?auto_361200 ?auto_361201 ) ) ( not ( = ?auto_361200 ?auto_361202 ) ) ( not ( = ?auto_361200 ?auto_361204 ) ) ( not ( = ?auto_361200 ?auto_361203 ) ) ( not ( = ?auto_361200 ?auto_361205 ) ) ( not ( = ?auto_361200 ?auto_361206 ) ) ( not ( = ?auto_361200 ?auto_361207 ) ) ( not ( = ?auto_361200 ?auto_361208 ) ) ( not ( = ?auto_361200 ?auto_361209 ) ) ( not ( = ?auto_361200 ?auto_361212 ) ) ( not ( = ?auto_361201 ?auto_361202 ) ) ( not ( = ?auto_361201 ?auto_361204 ) ) ( not ( = ?auto_361201 ?auto_361203 ) ) ( not ( = ?auto_361201 ?auto_361205 ) ) ( not ( = ?auto_361201 ?auto_361206 ) ) ( not ( = ?auto_361201 ?auto_361207 ) ) ( not ( = ?auto_361201 ?auto_361208 ) ) ( not ( = ?auto_361201 ?auto_361209 ) ) ( not ( = ?auto_361201 ?auto_361212 ) ) ( not ( = ?auto_361202 ?auto_361204 ) ) ( not ( = ?auto_361202 ?auto_361203 ) ) ( not ( = ?auto_361202 ?auto_361205 ) ) ( not ( = ?auto_361202 ?auto_361206 ) ) ( not ( = ?auto_361202 ?auto_361207 ) ) ( not ( = ?auto_361202 ?auto_361208 ) ) ( not ( = ?auto_361202 ?auto_361209 ) ) ( not ( = ?auto_361202 ?auto_361212 ) ) ( not ( = ?auto_361204 ?auto_361203 ) ) ( not ( = ?auto_361204 ?auto_361205 ) ) ( not ( = ?auto_361204 ?auto_361206 ) ) ( not ( = ?auto_361204 ?auto_361207 ) ) ( not ( = ?auto_361204 ?auto_361208 ) ) ( not ( = ?auto_361204 ?auto_361209 ) ) ( not ( = ?auto_361204 ?auto_361212 ) ) ( not ( = ?auto_361203 ?auto_361205 ) ) ( not ( = ?auto_361203 ?auto_361206 ) ) ( not ( = ?auto_361203 ?auto_361207 ) ) ( not ( = ?auto_361203 ?auto_361208 ) ) ( not ( = ?auto_361203 ?auto_361209 ) ) ( not ( = ?auto_361203 ?auto_361212 ) ) ( not ( = ?auto_361205 ?auto_361206 ) ) ( not ( = ?auto_361205 ?auto_361207 ) ) ( not ( = ?auto_361205 ?auto_361208 ) ) ( not ( = ?auto_361205 ?auto_361209 ) ) ( not ( = ?auto_361205 ?auto_361212 ) ) ( not ( = ?auto_361206 ?auto_361207 ) ) ( not ( = ?auto_361206 ?auto_361208 ) ) ( not ( = ?auto_361206 ?auto_361209 ) ) ( not ( = ?auto_361206 ?auto_361212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361207 ?auto_361208 ?auto_361209 )
      ( MAKE-9CRATE-VERIFY ?auto_361200 ?auto_361201 ?auto_361202 ?auto_361204 ?auto_361203 ?auto_361205 ?auto_361206 ?auto_361207 ?auto_361208 ?auto_361209 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361309 - SURFACE
      ?auto_361310 - SURFACE
      ?auto_361311 - SURFACE
      ?auto_361313 - SURFACE
      ?auto_361312 - SURFACE
      ?auto_361314 - SURFACE
      ?auto_361315 - SURFACE
      ?auto_361316 - SURFACE
      ?auto_361317 - SURFACE
      ?auto_361318 - SURFACE
    )
    :vars
    (
      ?auto_361320 - HOIST
      ?auto_361319 - PLACE
      ?auto_361322 - PLACE
      ?auto_361323 - HOIST
      ?auto_361321 - SURFACE
      ?auto_361324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361320 ?auto_361319 ) ( SURFACE-AT ?auto_361317 ?auto_361319 ) ( CLEAR ?auto_361317 ) ( IS-CRATE ?auto_361318 ) ( not ( = ?auto_361317 ?auto_361318 ) ) ( AVAILABLE ?auto_361320 ) ( ON ?auto_361317 ?auto_361316 ) ( not ( = ?auto_361316 ?auto_361317 ) ) ( not ( = ?auto_361316 ?auto_361318 ) ) ( not ( = ?auto_361322 ?auto_361319 ) ) ( HOIST-AT ?auto_361323 ?auto_361322 ) ( not ( = ?auto_361320 ?auto_361323 ) ) ( AVAILABLE ?auto_361323 ) ( SURFACE-AT ?auto_361318 ?auto_361322 ) ( ON ?auto_361318 ?auto_361321 ) ( CLEAR ?auto_361318 ) ( not ( = ?auto_361317 ?auto_361321 ) ) ( not ( = ?auto_361318 ?auto_361321 ) ) ( not ( = ?auto_361316 ?auto_361321 ) ) ( TRUCK-AT ?auto_361324 ?auto_361319 ) ( ON ?auto_361310 ?auto_361309 ) ( ON ?auto_361311 ?auto_361310 ) ( ON ?auto_361313 ?auto_361311 ) ( ON ?auto_361312 ?auto_361313 ) ( ON ?auto_361314 ?auto_361312 ) ( ON ?auto_361315 ?auto_361314 ) ( ON ?auto_361316 ?auto_361315 ) ( not ( = ?auto_361309 ?auto_361310 ) ) ( not ( = ?auto_361309 ?auto_361311 ) ) ( not ( = ?auto_361309 ?auto_361313 ) ) ( not ( = ?auto_361309 ?auto_361312 ) ) ( not ( = ?auto_361309 ?auto_361314 ) ) ( not ( = ?auto_361309 ?auto_361315 ) ) ( not ( = ?auto_361309 ?auto_361316 ) ) ( not ( = ?auto_361309 ?auto_361317 ) ) ( not ( = ?auto_361309 ?auto_361318 ) ) ( not ( = ?auto_361309 ?auto_361321 ) ) ( not ( = ?auto_361310 ?auto_361311 ) ) ( not ( = ?auto_361310 ?auto_361313 ) ) ( not ( = ?auto_361310 ?auto_361312 ) ) ( not ( = ?auto_361310 ?auto_361314 ) ) ( not ( = ?auto_361310 ?auto_361315 ) ) ( not ( = ?auto_361310 ?auto_361316 ) ) ( not ( = ?auto_361310 ?auto_361317 ) ) ( not ( = ?auto_361310 ?auto_361318 ) ) ( not ( = ?auto_361310 ?auto_361321 ) ) ( not ( = ?auto_361311 ?auto_361313 ) ) ( not ( = ?auto_361311 ?auto_361312 ) ) ( not ( = ?auto_361311 ?auto_361314 ) ) ( not ( = ?auto_361311 ?auto_361315 ) ) ( not ( = ?auto_361311 ?auto_361316 ) ) ( not ( = ?auto_361311 ?auto_361317 ) ) ( not ( = ?auto_361311 ?auto_361318 ) ) ( not ( = ?auto_361311 ?auto_361321 ) ) ( not ( = ?auto_361313 ?auto_361312 ) ) ( not ( = ?auto_361313 ?auto_361314 ) ) ( not ( = ?auto_361313 ?auto_361315 ) ) ( not ( = ?auto_361313 ?auto_361316 ) ) ( not ( = ?auto_361313 ?auto_361317 ) ) ( not ( = ?auto_361313 ?auto_361318 ) ) ( not ( = ?auto_361313 ?auto_361321 ) ) ( not ( = ?auto_361312 ?auto_361314 ) ) ( not ( = ?auto_361312 ?auto_361315 ) ) ( not ( = ?auto_361312 ?auto_361316 ) ) ( not ( = ?auto_361312 ?auto_361317 ) ) ( not ( = ?auto_361312 ?auto_361318 ) ) ( not ( = ?auto_361312 ?auto_361321 ) ) ( not ( = ?auto_361314 ?auto_361315 ) ) ( not ( = ?auto_361314 ?auto_361316 ) ) ( not ( = ?auto_361314 ?auto_361317 ) ) ( not ( = ?auto_361314 ?auto_361318 ) ) ( not ( = ?auto_361314 ?auto_361321 ) ) ( not ( = ?auto_361315 ?auto_361316 ) ) ( not ( = ?auto_361315 ?auto_361317 ) ) ( not ( = ?auto_361315 ?auto_361318 ) ) ( not ( = ?auto_361315 ?auto_361321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361316 ?auto_361317 ?auto_361318 )
      ( MAKE-9CRATE-VERIFY ?auto_361309 ?auto_361310 ?auto_361311 ?auto_361313 ?auto_361312 ?auto_361314 ?auto_361315 ?auto_361316 ?auto_361317 ?auto_361318 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361418 - SURFACE
      ?auto_361419 - SURFACE
      ?auto_361420 - SURFACE
      ?auto_361422 - SURFACE
      ?auto_361421 - SURFACE
      ?auto_361423 - SURFACE
      ?auto_361424 - SURFACE
      ?auto_361425 - SURFACE
      ?auto_361426 - SURFACE
      ?auto_361427 - SURFACE
    )
    :vars
    (
      ?auto_361429 - HOIST
      ?auto_361432 - PLACE
      ?auto_361428 - PLACE
      ?auto_361431 - HOIST
      ?auto_361433 - SURFACE
      ?auto_361430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361429 ?auto_361432 ) ( IS-CRATE ?auto_361427 ) ( not ( = ?auto_361426 ?auto_361427 ) ) ( not ( = ?auto_361425 ?auto_361426 ) ) ( not ( = ?auto_361425 ?auto_361427 ) ) ( not ( = ?auto_361428 ?auto_361432 ) ) ( HOIST-AT ?auto_361431 ?auto_361428 ) ( not ( = ?auto_361429 ?auto_361431 ) ) ( AVAILABLE ?auto_361431 ) ( SURFACE-AT ?auto_361427 ?auto_361428 ) ( ON ?auto_361427 ?auto_361433 ) ( CLEAR ?auto_361427 ) ( not ( = ?auto_361426 ?auto_361433 ) ) ( not ( = ?auto_361427 ?auto_361433 ) ) ( not ( = ?auto_361425 ?auto_361433 ) ) ( TRUCK-AT ?auto_361430 ?auto_361432 ) ( SURFACE-AT ?auto_361425 ?auto_361432 ) ( CLEAR ?auto_361425 ) ( LIFTING ?auto_361429 ?auto_361426 ) ( IS-CRATE ?auto_361426 ) ( ON ?auto_361419 ?auto_361418 ) ( ON ?auto_361420 ?auto_361419 ) ( ON ?auto_361422 ?auto_361420 ) ( ON ?auto_361421 ?auto_361422 ) ( ON ?auto_361423 ?auto_361421 ) ( ON ?auto_361424 ?auto_361423 ) ( ON ?auto_361425 ?auto_361424 ) ( not ( = ?auto_361418 ?auto_361419 ) ) ( not ( = ?auto_361418 ?auto_361420 ) ) ( not ( = ?auto_361418 ?auto_361422 ) ) ( not ( = ?auto_361418 ?auto_361421 ) ) ( not ( = ?auto_361418 ?auto_361423 ) ) ( not ( = ?auto_361418 ?auto_361424 ) ) ( not ( = ?auto_361418 ?auto_361425 ) ) ( not ( = ?auto_361418 ?auto_361426 ) ) ( not ( = ?auto_361418 ?auto_361427 ) ) ( not ( = ?auto_361418 ?auto_361433 ) ) ( not ( = ?auto_361419 ?auto_361420 ) ) ( not ( = ?auto_361419 ?auto_361422 ) ) ( not ( = ?auto_361419 ?auto_361421 ) ) ( not ( = ?auto_361419 ?auto_361423 ) ) ( not ( = ?auto_361419 ?auto_361424 ) ) ( not ( = ?auto_361419 ?auto_361425 ) ) ( not ( = ?auto_361419 ?auto_361426 ) ) ( not ( = ?auto_361419 ?auto_361427 ) ) ( not ( = ?auto_361419 ?auto_361433 ) ) ( not ( = ?auto_361420 ?auto_361422 ) ) ( not ( = ?auto_361420 ?auto_361421 ) ) ( not ( = ?auto_361420 ?auto_361423 ) ) ( not ( = ?auto_361420 ?auto_361424 ) ) ( not ( = ?auto_361420 ?auto_361425 ) ) ( not ( = ?auto_361420 ?auto_361426 ) ) ( not ( = ?auto_361420 ?auto_361427 ) ) ( not ( = ?auto_361420 ?auto_361433 ) ) ( not ( = ?auto_361422 ?auto_361421 ) ) ( not ( = ?auto_361422 ?auto_361423 ) ) ( not ( = ?auto_361422 ?auto_361424 ) ) ( not ( = ?auto_361422 ?auto_361425 ) ) ( not ( = ?auto_361422 ?auto_361426 ) ) ( not ( = ?auto_361422 ?auto_361427 ) ) ( not ( = ?auto_361422 ?auto_361433 ) ) ( not ( = ?auto_361421 ?auto_361423 ) ) ( not ( = ?auto_361421 ?auto_361424 ) ) ( not ( = ?auto_361421 ?auto_361425 ) ) ( not ( = ?auto_361421 ?auto_361426 ) ) ( not ( = ?auto_361421 ?auto_361427 ) ) ( not ( = ?auto_361421 ?auto_361433 ) ) ( not ( = ?auto_361423 ?auto_361424 ) ) ( not ( = ?auto_361423 ?auto_361425 ) ) ( not ( = ?auto_361423 ?auto_361426 ) ) ( not ( = ?auto_361423 ?auto_361427 ) ) ( not ( = ?auto_361423 ?auto_361433 ) ) ( not ( = ?auto_361424 ?auto_361425 ) ) ( not ( = ?auto_361424 ?auto_361426 ) ) ( not ( = ?auto_361424 ?auto_361427 ) ) ( not ( = ?auto_361424 ?auto_361433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361425 ?auto_361426 ?auto_361427 )
      ( MAKE-9CRATE-VERIFY ?auto_361418 ?auto_361419 ?auto_361420 ?auto_361422 ?auto_361421 ?auto_361423 ?auto_361424 ?auto_361425 ?auto_361426 ?auto_361427 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_361527 - SURFACE
      ?auto_361528 - SURFACE
      ?auto_361529 - SURFACE
      ?auto_361531 - SURFACE
      ?auto_361530 - SURFACE
      ?auto_361532 - SURFACE
      ?auto_361533 - SURFACE
      ?auto_361534 - SURFACE
      ?auto_361535 - SURFACE
      ?auto_361536 - SURFACE
    )
    :vars
    (
      ?auto_361539 - HOIST
      ?auto_361538 - PLACE
      ?auto_361537 - PLACE
      ?auto_361542 - HOIST
      ?auto_361540 - SURFACE
      ?auto_361541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_361539 ?auto_361538 ) ( IS-CRATE ?auto_361536 ) ( not ( = ?auto_361535 ?auto_361536 ) ) ( not ( = ?auto_361534 ?auto_361535 ) ) ( not ( = ?auto_361534 ?auto_361536 ) ) ( not ( = ?auto_361537 ?auto_361538 ) ) ( HOIST-AT ?auto_361542 ?auto_361537 ) ( not ( = ?auto_361539 ?auto_361542 ) ) ( AVAILABLE ?auto_361542 ) ( SURFACE-AT ?auto_361536 ?auto_361537 ) ( ON ?auto_361536 ?auto_361540 ) ( CLEAR ?auto_361536 ) ( not ( = ?auto_361535 ?auto_361540 ) ) ( not ( = ?auto_361536 ?auto_361540 ) ) ( not ( = ?auto_361534 ?auto_361540 ) ) ( TRUCK-AT ?auto_361541 ?auto_361538 ) ( SURFACE-AT ?auto_361534 ?auto_361538 ) ( CLEAR ?auto_361534 ) ( IS-CRATE ?auto_361535 ) ( AVAILABLE ?auto_361539 ) ( IN ?auto_361535 ?auto_361541 ) ( ON ?auto_361528 ?auto_361527 ) ( ON ?auto_361529 ?auto_361528 ) ( ON ?auto_361531 ?auto_361529 ) ( ON ?auto_361530 ?auto_361531 ) ( ON ?auto_361532 ?auto_361530 ) ( ON ?auto_361533 ?auto_361532 ) ( ON ?auto_361534 ?auto_361533 ) ( not ( = ?auto_361527 ?auto_361528 ) ) ( not ( = ?auto_361527 ?auto_361529 ) ) ( not ( = ?auto_361527 ?auto_361531 ) ) ( not ( = ?auto_361527 ?auto_361530 ) ) ( not ( = ?auto_361527 ?auto_361532 ) ) ( not ( = ?auto_361527 ?auto_361533 ) ) ( not ( = ?auto_361527 ?auto_361534 ) ) ( not ( = ?auto_361527 ?auto_361535 ) ) ( not ( = ?auto_361527 ?auto_361536 ) ) ( not ( = ?auto_361527 ?auto_361540 ) ) ( not ( = ?auto_361528 ?auto_361529 ) ) ( not ( = ?auto_361528 ?auto_361531 ) ) ( not ( = ?auto_361528 ?auto_361530 ) ) ( not ( = ?auto_361528 ?auto_361532 ) ) ( not ( = ?auto_361528 ?auto_361533 ) ) ( not ( = ?auto_361528 ?auto_361534 ) ) ( not ( = ?auto_361528 ?auto_361535 ) ) ( not ( = ?auto_361528 ?auto_361536 ) ) ( not ( = ?auto_361528 ?auto_361540 ) ) ( not ( = ?auto_361529 ?auto_361531 ) ) ( not ( = ?auto_361529 ?auto_361530 ) ) ( not ( = ?auto_361529 ?auto_361532 ) ) ( not ( = ?auto_361529 ?auto_361533 ) ) ( not ( = ?auto_361529 ?auto_361534 ) ) ( not ( = ?auto_361529 ?auto_361535 ) ) ( not ( = ?auto_361529 ?auto_361536 ) ) ( not ( = ?auto_361529 ?auto_361540 ) ) ( not ( = ?auto_361531 ?auto_361530 ) ) ( not ( = ?auto_361531 ?auto_361532 ) ) ( not ( = ?auto_361531 ?auto_361533 ) ) ( not ( = ?auto_361531 ?auto_361534 ) ) ( not ( = ?auto_361531 ?auto_361535 ) ) ( not ( = ?auto_361531 ?auto_361536 ) ) ( not ( = ?auto_361531 ?auto_361540 ) ) ( not ( = ?auto_361530 ?auto_361532 ) ) ( not ( = ?auto_361530 ?auto_361533 ) ) ( not ( = ?auto_361530 ?auto_361534 ) ) ( not ( = ?auto_361530 ?auto_361535 ) ) ( not ( = ?auto_361530 ?auto_361536 ) ) ( not ( = ?auto_361530 ?auto_361540 ) ) ( not ( = ?auto_361532 ?auto_361533 ) ) ( not ( = ?auto_361532 ?auto_361534 ) ) ( not ( = ?auto_361532 ?auto_361535 ) ) ( not ( = ?auto_361532 ?auto_361536 ) ) ( not ( = ?auto_361532 ?auto_361540 ) ) ( not ( = ?auto_361533 ?auto_361534 ) ) ( not ( = ?auto_361533 ?auto_361535 ) ) ( not ( = ?auto_361533 ?auto_361536 ) ) ( not ( = ?auto_361533 ?auto_361540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_361534 ?auto_361535 ?auto_361536 )
      ( MAKE-9CRATE-VERIFY ?auto_361527 ?auto_361528 ?auto_361529 ?auto_361531 ?auto_361530 ?auto_361532 ?auto_361533 ?auto_361534 ?auto_361535 ?auto_361536 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367092 - SURFACE
      ?auto_367093 - SURFACE
      ?auto_367094 - SURFACE
      ?auto_367096 - SURFACE
      ?auto_367095 - SURFACE
      ?auto_367097 - SURFACE
      ?auto_367098 - SURFACE
      ?auto_367099 - SURFACE
      ?auto_367100 - SURFACE
      ?auto_367101 - SURFACE
      ?auto_367102 - SURFACE
    )
    :vars
    (
      ?auto_367104 - HOIST
      ?auto_367103 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367104 ?auto_367103 ) ( SURFACE-AT ?auto_367101 ?auto_367103 ) ( CLEAR ?auto_367101 ) ( LIFTING ?auto_367104 ?auto_367102 ) ( IS-CRATE ?auto_367102 ) ( not ( = ?auto_367101 ?auto_367102 ) ) ( ON ?auto_367093 ?auto_367092 ) ( ON ?auto_367094 ?auto_367093 ) ( ON ?auto_367096 ?auto_367094 ) ( ON ?auto_367095 ?auto_367096 ) ( ON ?auto_367097 ?auto_367095 ) ( ON ?auto_367098 ?auto_367097 ) ( ON ?auto_367099 ?auto_367098 ) ( ON ?auto_367100 ?auto_367099 ) ( ON ?auto_367101 ?auto_367100 ) ( not ( = ?auto_367092 ?auto_367093 ) ) ( not ( = ?auto_367092 ?auto_367094 ) ) ( not ( = ?auto_367092 ?auto_367096 ) ) ( not ( = ?auto_367092 ?auto_367095 ) ) ( not ( = ?auto_367092 ?auto_367097 ) ) ( not ( = ?auto_367092 ?auto_367098 ) ) ( not ( = ?auto_367092 ?auto_367099 ) ) ( not ( = ?auto_367092 ?auto_367100 ) ) ( not ( = ?auto_367092 ?auto_367101 ) ) ( not ( = ?auto_367092 ?auto_367102 ) ) ( not ( = ?auto_367093 ?auto_367094 ) ) ( not ( = ?auto_367093 ?auto_367096 ) ) ( not ( = ?auto_367093 ?auto_367095 ) ) ( not ( = ?auto_367093 ?auto_367097 ) ) ( not ( = ?auto_367093 ?auto_367098 ) ) ( not ( = ?auto_367093 ?auto_367099 ) ) ( not ( = ?auto_367093 ?auto_367100 ) ) ( not ( = ?auto_367093 ?auto_367101 ) ) ( not ( = ?auto_367093 ?auto_367102 ) ) ( not ( = ?auto_367094 ?auto_367096 ) ) ( not ( = ?auto_367094 ?auto_367095 ) ) ( not ( = ?auto_367094 ?auto_367097 ) ) ( not ( = ?auto_367094 ?auto_367098 ) ) ( not ( = ?auto_367094 ?auto_367099 ) ) ( not ( = ?auto_367094 ?auto_367100 ) ) ( not ( = ?auto_367094 ?auto_367101 ) ) ( not ( = ?auto_367094 ?auto_367102 ) ) ( not ( = ?auto_367096 ?auto_367095 ) ) ( not ( = ?auto_367096 ?auto_367097 ) ) ( not ( = ?auto_367096 ?auto_367098 ) ) ( not ( = ?auto_367096 ?auto_367099 ) ) ( not ( = ?auto_367096 ?auto_367100 ) ) ( not ( = ?auto_367096 ?auto_367101 ) ) ( not ( = ?auto_367096 ?auto_367102 ) ) ( not ( = ?auto_367095 ?auto_367097 ) ) ( not ( = ?auto_367095 ?auto_367098 ) ) ( not ( = ?auto_367095 ?auto_367099 ) ) ( not ( = ?auto_367095 ?auto_367100 ) ) ( not ( = ?auto_367095 ?auto_367101 ) ) ( not ( = ?auto_367095 ?auto_367102 ) ) ( not ( = ?auto_367097 ?auto_367098 ) ) ( not ( = ?auto_367097 ?auto_367099 ) ) ( not ( = ?auto_367097 ?auto_367100 ) ) ( not ( = ?auto_367097 ?auto_367101 ) ) ( not ( = ?auto_367097 ?auto_367102 ) ) ( not ( = ?auto_367098 ?auto_367099 ) ) ( not ( = ?auto_367098 ?auto_367100 ) ) ( not ( = ?auto_367098 ?auto_367101 ) ) ( not ( = ?auto_367098 ?auto_367102 ) ) ( not ( = ?auto_367099 ?auto_367100 ) ) ( not ( = ?auto_367099 ?auto_367101 ) ) ( not ( = ?auto_367099 ?auto_367102 ) ) ( not ( = ?auto_367100 ?auto_367101 ) ) ( not ( = ?auto_367100 ?auto_367102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_367101 ?auto_367102 )
      ( MAKE-10CRATE-VERIFY ?auto_367092 ?auto_367093 ?auto_367094 ?auto_367096 ?auto_367095 ?auto_367097 ?auto_367098 ?auto_367099 ?auto_367100 ?auto_367101 ?auto_367102 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367186 - SURFACE
      ?auto_367187 - SURFACE
      ?auto_367188 - SURFACE
      ?auto_367190 - SURFACE
      ?auto_367189 - SURFACE
      ?auto_367191 - SURFACE
      ?auto_367192 - SURFACE
      ?auto_367193 - SURFACE
      ?auto_367194 - SURFACE
      ?auto_367195 - SURFACE
      ?auto_367196 - SURFACE
    )
    :vars
    (
      ?auto_367199 - HOIST
      ?auto_367197 - PLACE
      ?auto_367198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367199 ?auto_367197 ) ( SURFACE-AT ?auto_367195 ?auto_367197 ) ( CLEAR ?auto_367195 ) ( IS-CRATE ?auto_367196 ) ( not ( = ?auto_367195 ?auto_367196 ) ) ( TRUCK-AT ?auto_367198 ?auto_367197 ) ( AVAILABLE ?auto_367199 ) ( IN ?auto_367196 ?auto_367198 ) ( ON ?auto_367195 ?auto_367194 ) ( not ( = ?auto_367194 ?auto_367195 ) ) ( not ( = ?auto_367194 ?auto_367196 ) ) ( ON ?auto_367187 ?auto_367186 ) ( ON ?auto_367188 ?auto_367187 ) ( ON ?auto_367190 ?auto_367188 ) ( ON ?auto_367189 ?auto_367190 ) ( ON ?auto_367191 ?auto_367189 ) ( ON ?auto_367192 ?auto_367191 ) ( ON ?auto_367193 ?auto_367192 ) ( ON ?auto_367194 ?auto_367193 ) ( not ( = ?auto_367186 ?auto_367187 ) ) ( not ( = ?auto_367186 ?auto_367188 ) ) ( not ( = ?auto_367186 ?auto_367190 ) ) ( not ( = ?auto_367186 ?auto_367189 ) ) ( not ( = ?auto_367186 ?auto_367191 ) ) ( not ( = ?auto_367186 ?auto_367192 ) ) ( not ( = ?auto_367186 ?auto_367193 ) ) ( not ( = ?auto_367186 ?auto_367194 ) ) ( not ( = ?auto_367186 ?auto_367195 ) ) ( not ( = ?auto_367186 ?auto_367196 ) ) ( not ( = ?auto_367187 ?auto_367188 ) ) ( not ( = ?auto_367187 ?auto_367190 ) ) ( not ( = ?auto_367187 ?auto_367189 ) ) ( not ( = ?auto_367187 ?auto_367191 ) ) ( not ( = ?auto_367187 ?auto_367192 ) ) ( not ( = ?auto_367187 ?auto_367193 ) ) ( not ( = ?auto_367187 ?auto_367194 ) ) ( not ( = ?auto_367187 ?auto_367195 ) ) ( not ( = ?auto_367187 ?auto_367196 ) ) ( not ( = ?auto_367188 ?auto_367190 ) ) ( not ( = ?auto_367188 ?auto_367189 ) ) ( not ( = ?auto_367188 ?auto_367191 ) ) ( not ( = ?auto_367188 ?auto_367192 ) ) ( not ( = ?auto_367188 ?auto_367193 ) ) ( not ( = ?auto_367188 ?auto_367194 ) ) ( not ( = ?auto_367188 ?auto_367195 ) ) ( not ( = ?auto_367188 ?auto_367196 ) ) ( not ( = ?auto_367190 ?auto_367189 ) ) ( not ( = ?auto_367190 ?auto_367191 ) ) ( not ( = ?auto_367190 ?auto_367192 ) ) ( not ( = ?auto_367190 ?auto_367193 ) ) ( not ( = ?auto_367190 ?auto_367194 ) ) ( not ( = ?auto_367190 ?auto_367195 ) ) ( not ( = ?auto_367190 ?auto_367196 ) ) ( not ( = ?auto_367189 ?auto_367191 ) ) ( not ( = ?auto_367189 ?auto_367192 ) ) ( not ( = ?auto_367189 ?auto_367193 ) ) ( not ( = ?auto_367189 ?auto_367194 ) ) ( not ( = ?auto_367189 ?auto_367195 ) ) ( not ( = ?auto_367189 ?auto_367196 ) ) ( not ( = ?auto_367191 ?auto_367192 ) ) ( not ( = ?auto_367191 ?auto_367193 ) ) ( not ( = ?auto_367191 ?auto_367194 ) ) ( not ( = ?auto_367191 ?auto_367195 ) ) ( not ( = ?auto_367191 ?auto_367196 ) ) ( not ( = ?auto_367192 ?auto_367193 ) ) ( not ( = ?auto_367192 ?auto_367194 ) ) ( not ( = ?auto_367192 ?auto_367195 ) ) ( not ( = ?auto_367192 ?auto_367196 ) ) ( not ( = ?auto_367193 ?auto_367194 ) ) ( not ( = ?auto_367193 ?auto_367195 ) ) ( not ( = ?auto_367193 ?auto_367196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367194 ?auto_367195 ?auto_367196 )
      ( MAKE-10CRATE-VERIFY ?auto_367186 ?auto_367187 ?auto_367188 ?auto_367190 ?auto_367189 ?auto_367191 ?auto_367192 ?auto_367193 ?auto_367194 ?auto_367195 ?auto_367196 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367291 - SURFACE
      ?auto_367292 - SURFACE
      ?auto_367293 - SURFACE
      ?auto_367295 - SURFACE
      ?auto_367294 - SURFACE
      ?auto_367296 - SURFACE
      ?auto_367297 - SURFACE
      ?auto_367298 - SURFACE
      ?auto_367299 - SURFACE
      ?auto_367300 - SURFACE
      ?auto_367301 - SURFACE
    )
    :vars
    (
      ?auto_367304 - HOIST
      ?auto_367302 - PLACE
      ?auto_367303 - TRUCK
      ?auto_367305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367304 ?auto_367302 ) ( SURFACE-AT ?auto_367300 ?auto_367302 ) ( CLEAR ?auto_367300 ) ( IS-CRATE ?auto_367301 ) ( not ( = ?auto_367300 ?auto_367301 ) ) ( AVAILABLE ?auto_367304 ) ( IN ?auto_367301 ?auto_367303 ) ( ON ?auto_367300 ?auto_367299 ) ( not ( = ?auto_367299 ?auto_367300 ) ) ( not ( = ?auto_367299 ?auto_367301 ) ) ( TRUCK-AT ?auto_367303 ?auto_367305 ) ( not ( = ?auto_367305 ?auto_367302 ) ) ( ON ?auto_367292 ?auto_367291 ) ( ON ?auto_367293 ?auto_367292 ) ( ON ?auto_367295 ?auto_367293 ) ( ON ?auto_367294 ?auto_367295 ) ( ON ?auto_367296 ?auto_367294 ) ( ON ?auto_367297 ?auto_367296 ) ( ON ?auto_367298 ?auto_367297 ) ( ON ?auto_367299 ?auto_367298 ) ( not ( = ?auto_367291 ?auto_367292 ) ) ( not ( = ?auto_367291 ?auto_367293 ) ) ( not ( = ?auto_367291 ?auto_367295 ) ) ( not ( = ?auto_367291 ?auto_367294 ) ) ( not ( = ?auto_367291 ?auto_367296 ) ) ( not ( = ?auto_367291 ?auto_367297 ) ) ( not ( = ?auto_367291 ?auto_367298 ) ) ( not ( = ?auto_367291 ?auto_367299 ) ) ( not ( = ?auto_367291 ?auto_367300 ) ) ( not ( = ?auto_367291 ?auto_367301 ) ) ( not ( = ?auto_367292 ?auto_367293 ) ) ( not ( = ?auto_367292 ?auto_367295 ) ) ( not ( = ?auto_367292 ?auto_367294 ) ) ( not ( = ?auto_367292 ?auto_367296 ) ) ( not ( = ?auto_367292 ?auto_367297 ) ) ( not ( = ?auto_367292 ?auto_367298 ) ) ( not ( = ?auto_367292 ?auto_367299 ) ) ( not ( = ?auto_367292 ?auto_367300 ) ) ( not ( = ?auto_367292 ?auto_367301 ) ) ( not ( = ?auto_367293 ?auto_367295 ) ) ( not ( = ?auto_367293 ?auto_367294 ) ) ( not ( = ?auto_367293 ?auto_367296 ) ) ( not ( = ?auto_367293 ?auto_367297 ) ) ( not ( = ?auto_367293 ?auto_367298 ) ) ( not ( = ?auto_367293 ?auto_367299 ) ) ( not ( = ?auto_367293 ?auto_367300 ) ) ( not ( = ?auto_367293 ?auto_367301 ) ) ( not ( = ?auto_367295 ?auto_367294 ) ) ( not ( = ?auto_367295 ?auto_367296 ) ) ( not ( = ?auto_367295 ?auto_367297 ) ) ( not ( = ?auto_367295 ?auto_367298 ) ) ( not ( = ?auto_367295 ?auto_367299 ) ) ( not ( = ?auto_367295 ?auto_367300 ) ) ( not ( = ?auto_367295 ?auto_367301 ) ) ( not ( = ?auto_367294 ?auto_367296 ) ) ( not ( = ?auto_367294 ?auto_367297 ) ) ( not ( = ?auto_367294 ?auto_367298 ) ) ( not ( = ?auto_367294 ?auto_367299 ) ) ( not ( = ?auto_367294 ?auto_367300 ) ) ( not ( = ?auto_367294 ?auto_367301 ) ) ( not ( = ?auto_367296 ?auto_367297 ) ) ( not ( = ?auto_367296 ?auto_367298 ) ) ( not ( = ?auto_367296 ?auto_367299 ) ) ( not ( = ?auto_367296 ?auto_367300 ) ) ( not ( = ?auto_367296 ?auto_367301 ) ) ( not ( = ?auto_367297 ?auto_367298 ) ) ( not ( = ?auto_367297 ?auto_367299 ) ) ( not ( = ?auto_367297 ?auto_367300 ) ) ( not ( = ?auto_367297 ?auto_367301 ) ) ( not ( = ?auto_367298 ?auto_367299 ) ) ( not ( = ?auto_367298 ?auto_367300 ) ) ( not ( = ?auto_367298 ?auto_367301 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367299 ?auto_367300 ?auto_367301 )
      ( MAKE-10CRATE-VERIFY ?auto_367291 ?auto_367292 ?auto_367293 ?auto_367295 ?auto_367294 ?auto_367296 ?auto_367297 ?auto_367298 ?auto_367299 ?auto_367300 ?auto_367301 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367406 - SURFACE
      ?auto_367407 - SURFACE
      ?auto_367408 - SURFACE
      ?auto_367410 - SURFACE
      ?auto_367409 - SURFACE
      ?auto_367411 - SURFACE
      ?auto_367412 - SURFACE
      ?auto_367413 - SURFACE
      ?auto_367414 - SURFACE
      ?auto_367415 - SURFACE
      ?auto_367416 - SURFACE
    )
    :vars
    (
      ?auto_367421 - HOIST
      ?auto_367420 - PLACE
      ?auto_367417 - TRUCK
      ?auto_367418 - PLACE
      ?auto_367419 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_367421 ?auto_367420 ) ( SURFACE-AT ?auto_367415 ?auto_367420 ) ( CLEAR ?auto_367415 ) ( IS-CRATE ?auto_367416 ) ( not ( = ?auto_367415 ?auto_367416 ) ) ( AVAILABLE ?auto_367421 ) ( ON ?auto_367415 ?auto_367414 ) ( not ( = ?auto_367414 ?auto_367415 ) ) ( not ( = ?auto_367414 ?auto_367416 ) ) ( TRUCK-AT ?auto_367417 ?auto_367418 ) ( not ( = ?auto_367418 ?auto_367420 ) ) ( HOIST-AT ?auto_367419 ?auto_367418 ) ( LIFTING ?auto_367419 ?auto_367416 ) ( not ( = ?auto_367421 ?auto_367419 ) ) ( ON ?auto_367407 ?auto_367406 ) ( ON ?auto_367408 ?auto_367407 ) ( ON ?auto_367410 ?auto_367408 ) ( ON ?auto_367409 ?auto_367410 ) ( ON ?auto_367411 ?auto_367409 ) ( ON ?auto_367412 ?auto_367411 ) ( ON ?auto_367413 ?auto_367412 ) ( ON ?auto_367414 ?auto_367413 ) ( not ( = ?auto_367406 ?auto_367407 ) ) ( not ( = ?auto_367406 ?auto_367408 ) ) ( not ( = ?auto_367406 ?auto_367410 ) ) ( not ( = ?auto_367406 ?auto_367409 ) ) ( not ( = ?auto_367406 ?auto_367411 ) ) ( not ( = ?auto_367406 ?auto_367412 ) ) ( not ( = ?auto_367406 ?auto_367413 ) ) ( not ( = ?auto_367406 ?auto_367414 ) ) ( not ( = ?auto_367406 ?auto_367415 ) ) ( not ( = ?auto_367406 ?auto_367416 ) ) ( not ( = ?auto_367407 ?auto_367408 ) ) ( not ( = ?auto_367407 ?auto_367410 ) ) ( not ( = ?auto_367407 ?auto_367409 ) ) ( not ( = ?auto_367407 ?auto_367411 ) ) ( not ( = ?auto_367407 ?auto_367412 ) ) ( not ( = ?auto_367407 ?auto_367413 ) ) ( not ( = ?auto_367407 ?auto_367414 ) ) ( not ( = ?auto_367407 ?auto_367415 ) ) ( not ( = ?auto_367407 ?auto_367416 ) ) ( not ( = ?auto_367408 ?auto_367410 ) ) ( not ( = ?auto_367408 ?auto_367409 ) ) ( not ( = ?auto_367408 ?auto_367411 ) ) ( not ( = ?auto_367408 ?auto_367412 ) ) ( not ( = ?auto_367408 ?auto_367413 ) ) ( not ( = ?auto_367408 ?auto_367414 ) ) ( not ( = ?auto_367408 ?auto_367415 ) ) ( not ( = ?auto_367408 ?auto_367416 ) ) ( not ( = ?auto_367410 ?auto_367409 ) ) ( not ( = ?auto_367410 ?auto_367411 ) ) ( not ( = ?auto_367410 ?auto_367412 ) ) ( not ( = ?auto_367410 ?auto_367413 ) ) ( not ( = ?auto_367410 ?auto_367414 ) ) ( not ( = ?auto_367410 ?auto_367415 ) ) ( not ( = ?auto_367410 ?auto_367416 ) ) ( not ( = ?auto_367409 ?auto_367411 ) ) ( not ( = ?auto_367409 ?auto_367412 ) ) ( not ( = ?auto_367409 ?auto_367413 ) ) ( not ( = ?auto_367409 ?auto_367414 ) ) ( not ( = ?auto_367409 ?auto_367415 ) ) ( not ( = ?auto_367409 ?auto_367416 ) ) ( not ( = ?auto_367411 ?auto_367412 ) ) ( not ( = ?auto_367411 ?auto_367413 ) ) ( not ( = ?auto_367411 ?auto_367414 ) ) ( not ( = ?auto_367411 ?auto_367415 ) ) ( not ( = ?auto_367411 ?auto_367416 ) ) ( not ( = ?auto_367412 ?auto_367413 ) ) ( not ( = ?auto_367412 ?auto_367414 ) ) ( not ( = ?auto_367412 ?auto_367415 ) ) ( not ( = ?auto_367412 ?auto_367416 ) ) ( not ( = ?auto_367413 ?auto_367414 ) ) ( not ( = ?auto_367413 ?auto_367415 ) ) ( not ( = ?auto_367413 ?auto_367416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367414 ?auto_367415 ?auto_367416 )
      ( MAKE-10CRATE-VERIFY ?auto_367406 ?auto_367407 ?auto_367408 ?auto_367410 ?auto_367409 ?auto_367411 ?auto_367412 ?auto_367413 ?auto_367414 ?auto_367415 ?auto_367416 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367531 - SURFACE
      ?auto_367532 - SURFACE
      ?auto_367533 - SURFACE
      ?auto_367535 - SURFACE
      ?auto_367534 - SURFACE
      ?auto_367536 - SURFACE
      ?auto_367537 - SURFACE
      ?auto_367538 - SURFACE
      ?auto_367539 - SURFACE
      ?auto_367540 - SURFACE
      ?auto_367541 - SURFACE
    )
    :vars
    (
      ?auto_367544 - HOIST
      ?auto_367543 - PLACE
      ?auto_367546 - TRUCK
      ?auto_367545 - PLACE
      ?auto_367547 - HOIST
      ?auto_367542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_367544 ?auto_367543 ) ( SURFACE-AT ?auto_367540 ?auto_367543 ) ( CLEAR ?auto_367540 ) ( IS-CRATE ?auto_367541 ) ( not ( = ?auto_367540 ?auto_367541 ) ) ( AVAILABLE ?auto_367544 ) ( ON ?auto_367540 ?auto_367539 ) ( not ( = ?auto_367539 ?auto_367540 ) ) ( not ( = ?auto_367539 ?auto_367541 ) ) ( TRUCK-AT ?auto_367546 ?auto_367545 ) ( not ( = ?auto_367545 ?auto_367543 ) ) ( HOIST-AT ?auto_367547 ?auto_367545 ) ( not ( = ?auto_367544 ?auto_367547 ) ) ( AVAILABLE ?auto_367547 ) ( SURFACE-AT ?auto_367541 ?auto_367545 ) ( ON ?auto_367541 ?auto_367542 ) ( CLEAR ?auto_367541 ) ( not ( = ?auto_367540 ?auto_367542 ) ) ( not ( = ?auto_367541 ?auto_367542 ) ) ( not ( = ?auto_367539 ?auto_367542 ) ) ( ON ?auto_367532 ?auto_367531 ) ( ON ?auto_367533 ?auto_367532 ) ( ON ?auto_367535 ?auto_367533 ) ( ON ?auto_367534 ?auto_367535 ) ( ON ?auto_367536 ?auto_367534 ) ( ON ?auto_367537 ?auto_367536 ) ( ON ?auto_367538 ?auto_367537 ) ( ON ?auto_367539 ?auto_367538 ) ( not ( = ?auto_367531 ?auto_367532 ) ) ( not ( = ?auto_367531 ?auto_367533 ) ) ( not ( = ?auto_367531 ?auto_367535 ) ) ( not ( = ?auto_367531 ?auto_367534 ) ) ( not ( = ?auto_367531 ?auto_367536 ) ) ( not ( = ?auto_367531 ?auto_367537 ) ) ( not ( = ?auto_367531 ?auto_367538 ) ) ( not ( = ?auto_367531 ?auto_367539 ) ) ( not ( = ?auto_367531 ?auto_367540 ) ) ( not ( = ?auto_367531 ?auto_367541 ) ) ( not ( = ?auto_367531 ?auto_367542 ) ) ( not ( = ?auto_367532 ?auto_367533 ) ) ( not ( = ?auto_367532 ?auto_367535 ) ) ( not ( = ?auto_367532 ?auto_367534 ) ) ( not ( = ?auto_367532 ?auto_367536 ) ) ( not ( = ?auto_367532 ?auto_367537 ) ) ( not ( = ?auto_367532 ?auto_367538 ) ) ( not ( = ?auto_367532 ?auto_367539 ) ) ( not ( = ?auto_367532 ?auto_367540 ) ) ( not ( = ?auto_367532 ?auto_367541 ) ) ( not ( = ?auto_367532 ?auto_367542 ) ) ( not ( = ?auto_367533 ?auto_367535 ) ) ( not ( = ?auto_367533 ?auto_367534 ) ) ( not ( = ?auto_367533 ?auto_367536 ) ) ( not ( = ?auto_367533 ?auto_367537 ) ) ( not ( = ?auto_367533 ?auto_367538 ) ) ( not ( = ?auto_367533 ?auto_367539 ) ) ( not ( = ?auto_367533 ?auto_367540 ) ) ( not ( = ?auto_367533 ?auto_367541 ) ) ( not ( = ?auto_367533 ?auto_367542 ) ) ( not ( = ?auto_367535 ?auto_367534 ) ) ( not ( = ?auto_367535 ?auto_367536 ) ) ( not ( = ?auto_367535 ?auto_367537 ) ) ( not ( = ?auto_367535 ?auto_367538 ) ) ( not ( = ?auto_367535 ?auto_367539 ) ) ( not ( = ?auto_367535 ?auto_367540 ) ) ( not ( = ?auto_367535 ?auto_367541 ) ) ( not ( = ?auto_367535 ?auto_367542 ) ) ( not ( = ?auto_367534 ?auto_367536 ) ) ( not ( = ?auto_367534 ?auto_367537 ) ) ( not ( = ?auto_367534 ?auto_367538 ) ) ( not ( = ?auto_367534 ?auto_367539 ) ) ( not ( = ?auto_367534 ?auto_367540 ) ) ( not ( = ?auto_367534 ?auto_367541 ) ) ( not ( = ?auto_367534 ?auto_367542 ) ) ( not ( = ?auto_367536 ?auto_367537 ) ) ( not ( = ?auto_367536 ?auto_367538 ) ) ( not ( = ?auto_367536 ?auto_367539 ) ) ( not ( = ?auto_367536 ?auto_367540 ) ) ( not ( = ?auto_367536 ?auto_367541 ) ) ( not ( = ?auto_367536 ?auto_367542 ) ) ( not ( = ?auto_367537 ?auto_367538 ) ) ( not ( = ?auto_367537 ?auto_367539 ) ) ( not ( = ?auto_367537 ?auto_367540 ) ) ( not ( = ?auto_367537 ?auto_367541 ) ) ( not ( = ?auto_367537 ?auto_367542 ) ) ( not ( = ?auto_367538 ?auto_367539 ) ) ( not ( = ?auto_367538 ?auto_367540 ) ) ( not ( = ?auto_367538 ?auto_367541 ) ) ( not ( = ?auto_367538 ?auto_367542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367539 ?auto_367540 ?auto_367541 )
      ( MAKE-10CRATE-VERIFY ?auto_367531 ?auto_367532 ?auto_367533 ?auto_367535 ?auto_367534 ?auto_367536 ?auto_367537 ?auto_367538 ?auto_367539 ?auto_367540 ?auto_367541 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367657 - SURFACE
      ?auto_367658 - SURFACE
      ?auto_367659 - SURFACE
      ?auto_367661 - SURFACE
      ?auto_367660 - SURFACE
      ?auto_367662 - SURFACE
      ?auto_367663 - SURFACE
      ?auto_367664 - SURFACE
      ?auto_367665 - SURFACE
      ?auto_367666 - SURFACE
      ?auto_367667 - SURFACE
    )
    :vars
    (
      ?auto_367670 - HOIST
      ?auto_367668 - PLACE
      ?auto_367672 - PLACE
      ?auto_367669 - HOIST
      ?auto_367673 - SURFACE
      ?auto_367671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367670 ?auto_367668 ) ( SURFACE-AT ?auto_367666 ?auto_367668 ) ( CLEAR ?auto_367666 ) ( IS-CRATE ?auto_367667 ) ( not ( = ?auto_367666 ?auto_367667 ) ) ( AVAILABLE ?auto_367670 ) ( ON ?auto_367666 ?auto_367665 ) ( not ( = ?auto_367665 ?auto_367666 ) ) ( not ( = ?auto_367665 ?auto_367667 ) ) ( not ( = ?auto_367672 ?auto_367668 ) ) ( HOIST-AT ?auto_367669 ?auto_367672 ) ( not ( = ?auto_367670 ?auto_367669 ) ) ( AVAILABLE ?auto_367669 ) ( SURFACE-AT ?auto_367667 ?auto_367672 ) ( ON ?auto_367667 ?auto_367673 ) ( CLEAR ?auto_367667 ) ( not ( = ?auto_367666 ?auto_367673 ) ) ( not ( = ?auto_367667 ?auto_367673 ) ) ( not ( = ?auto_367665 ?auto_367673 ) ) ( TRUCK-AT ?auto_367671 ?auto_367668 ) ( ON ?auto_367658 ?auto_367657 ) ( ON ?auto_367659 ?auto_367658 ) ( ON ?auto_367661 ?auto_367659 ) ( ON ?auto_367660 ?auto_367661 ) ( ON ?auto_367662 ?auto_367660 ) ( ON ?auto_367663 ?auto_367662 ) ( ON ?auto_367664 ?auto_367663 ) ( ON ?auto_367665 ?auto_367664 ) ( not ( = ?auto_367657 ?auto_367658 ) ) ( not ( = ?auto_367657 ?auto_367659 ) ) ( not ( = ?auto_367657 ?auto_367661 ) ) ( not ( = ?auto_367657 ?auto_367660 ) ) ( not ( = ?auto_367657 ?auto_367662 ) ) ( not ( = ?auto_367657 ?auto_367663 ) ) ( not ( = ?auto_367657 ?auto_367664 ) ) ( not ( = ?auto_367657 ?auto_367665 ) ) ( not ( = ?auto_367657 ?auto_367666 ) ) ( not ( = ?auto_367657 ?auto_367667 ) ) ( not ( = ?auto_367657 ?auto_367673 ) ) ( not ( = ?auto_367658 ?auto_367659 ) ) ( not ( = ?auto_367658 ?auto_367661 ) ) ( not ( = ?auto_367658 ?auto_367660 ) ) ( not ( = ?auto_367658 ?auto_367662 ) ) ( not ( = ?auto_367658 ?auto_367663 ) ) ( not ( = ?auto_367658 ?auto_367664 ) ) ( not ( = ?auto_367658 ?auto_367665 ) ) ( not ( = ?auto_367658 ?auto_367666 ) ) ( not ( = ?auto_367658 ?auto_367667 ) ) ( not ( = ?auto_367658 ?auto_367673 ) ) ( not ( = ?auto_367659 ?auto_367661 ) ) ( not ( = ?auto_367659 ?auto_367660 ) ) ( not ( = ?auto_367659 ?auto_367662 ) ) ( not ( = ?auto_367659 ?auto_367663 ) ) ( not ( = ?auto_367659 ?auto_367664 ) ) ( not ( = ?auto_367659 ?auto_367665 ) ) ( not ( = ?auto_367659 ?auto_367666 ) ) ( not ( = ?auto_367659 ?auto_367667 ) ) ( not ( = ?auto_367659 ?auto_367673 ) ) ( not ( = ?auto_367661 ?auto_367660 ) ) ( not ( = ?auto_367661 ?auto_367662 ) ) ( not ( = ?auto_367661 ?auto_367663 ) ) ( not ( = ?auto_367661 ?auto_367664 ) ) ( not ( = ?auto_367661 ?auto_367665 ) ) ( not ( = ?auto_367661 ?auto_367666 ) ) ( not ( = ?auto_367661 ?auto_367667 ) ) ( not ( = ?auto_367661 ?auto_367673 ) ) ( not ( = ?auto_367660 ?auto_367662 ) ) ( not ( = ?auto_367660 ?auto_367663 ) ) ( not ( = ?auto_367660 ?auto_367664 ) ) ( not ( = ?auto_367660 ?auto_367665 ) ) ( not ( = ?auto_367660 ?auto_367666 ) ) ( not ( = ?auto_367660 ?auto_367667 ) ) ( not ( = ?auto_367660 ?auto_367673 ) ) ( not ( = ?auto_367662 ?auto_367663 ) ) ( not ( = ?auto_367662 ?auto_367664 ) ) ( not ( = ?auto_367662 ?auto_367665 ) ) ( not ( = ?auto_367662 ?auto_367666 ) ) ( not ( = ?auto_367662 ?auto_367667 ) ) ( not ( = ?auto_367662 ?auto_367673 ) ) ( not ( = ?auto_367663 ?auto_367664 ) ) ( not ( = ?auto_367663 ?auto_367665 ) ) ( not ( = ?auto_367663 ?auto_367666 ) ) ( not ( = ?auto_367663 ?auto_367667 ) ) ( not ( = ?auto_367663 ?auto_367673 ) ) ( not ( = ?auto_367664 ?auto_367665 ) ) ( not ( = ?auto_367664 ?auto_367666 ) ) ( not ( = ?auto_367664 ?auto_367667 ) ) ( not ( = ?auto_367664 ?auto_367673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367665 ?auto_367666 ?auto_367667 )
      ( MAKE-10CRATE-VERIFY ?auto_367657 ?auto_367658 ?auto_367659 ?auto_367661 ?auto_367660 ?auto_367662 ?auto_367663 ?auto_367664 ?auto_367665 ?auto_367666 ?auto_367667 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367783 - SURFACE
      ?auto_367784 - SURFACE
      ?auto_367785 - SURFACE
      ?auto_367787 - SURFACE
      ?auto_367786 - SURFACE
      ?auto_367788 - SURFACE
      ?auto_367789 - SURFACE
      ?auto_367790 - SURFACE
      ?auto_367791 - SURFACE
      ?auto_367792 - SURFACE
      ?auto_367793 - SURFACE
    )
    :vars
    (
      ?auto_367794 - HOIST
      ?auto_367795 - PLACE
      ?auto_367798 - PLACE
      ?auto_367796 - HOIST
      ?auto_367799 - SURFACE
      ?auto_367797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367794 ?auto_367795 ) ( IS-CRATE ?auto_367793 ) ( not ( = ?auto_367792 ?auto_367793 ) ) ( not ( = ?auto_367791 ?auto_367792 ) ) ( not ( = ?auto_367791 ?auto_367793 ) ) ( not ( = ?auto_367798 ?auto_367795 ) ) ( HOIST-AT ?auto_367796 ?auto_367798 ) ( not ( = ?auto_367794 ?auto_367796 ) ) ( AVAILABLE ?auto_367796 ) ( SURFACE-AT ?auto_367793 ?auto_367798 ) ( ON ?auto_367793 ?auto_367799 ) ( CLEAR ?auto_367793 ) ( not ( = ?auto_367792 ?auto_367799 ) ) ( not ( = ?auto_367793 ?auto_367799 ) ) ( not ( = ?auto_367791 ?auto_367799 ) ) ( TRUCK-AT ?auto_367797 ?auto_367795 ) ( SURFACE-AT ?auto_367791 ?auto_367795 ) ( CLEAR ?auto_367791 ) ( LIFTING ?auto_367794 ?auto_367792 ) ( IS-CRATE ?auto_367792 ) ( ON ?auto_367784 ?auto_367783 ) ( ON ?auto_367785 ?auto_367784 ) ( ON ?auto_367787 ?auto_367785 ) ( ON ?auto_367786 ?auto_367787 ) ( ON ?auto_367788 ?auto_367786 ) ( ON ?auto_367789 ?auto_367788 ) ( ON ?auto_367790 ?auto_367789 ) ( ON ?auto_367791 ?auto_367790 ) ( not ( = ?auto_367783 ?auto_367784 ) ) ( not ( = ?auto_367783 ?auto_367785 ) ) ( not ( = ?auto_367783 ?auto_367787 ) ) ( not ( = ?auto_367783 ?auto_367786 ) ) ( not ( = ?auto_367783 ?auto_367788 ) ) ( not ( = ?auto_367783 ?auto_367789 ) ) ( not ( = ?auto_367783 ?auto_367790 ) ) ( not ( = ?auto_367783 ?auto_367791 ) ) ( not ( = ?auto_367783 ?auto_367792 ) ) ( not ( = ?auto_367783 ?auto_367793 ) ) ( not ( = ?auto_367783 ?auto_367799 ) ) ( not ( = ?auto_367784 ?auto_367785 ) ) ( not ( = ?auto_367784 ?auto_367787 ) ) ( not ( = ?auto_367784 ?auto_367786 ) ) ( not ( = ?auto_367784 ?auto_367788 ) ) ( not ( = ?auto_367784 ?auto_367789 ) ) ( not ( = ?auto_367784 ?auto_367790 ) ) ( not ( = ?auto_367784 ?auto_367791 ) ) ( not ( = ?auto_367784 ?auto_367792 ) ) ( not ( = ?auto_367784 ?auto_367793 ) ) ( not ( = ?auto_367784 ?auto_367799 ) ) ( not ( = ?auto_367785 ?auto_367787 ) ) ( not ( = ?auto_367785 ?auto_367786 ) ) ( not ( = ?auto_367785 ?auto_367788 ) ) ( not ( = ?auto_367785 ?auto_367789 ) ) ( not ( = ?auto_367785 ?auto_367790 ) ) ( not ( = ?auto_367785 ?auto_367791 ) ) ( not ( = ?auto_367785 ?auto_367792 ) ) ( not ( = ?auto_367785 ?auto_367793 ) ) ( not ( = ?auto_367785 ?auto_367799 ) ) ( not ( = ?auto_367787 ?auto_367786 ) ) ( not ( = ?auto_367787 ?auto_367788 ) ) ( not ( = ?auto_367787 ?auto_367789 ) ) ( not ( = ?auto_367787 ?auto_367790 ) ) ( not ( = ?auto_367787 ?auto_367791 ) ) ( not ( = ?auto_367787 ?auto_367792 ) ) ( not ( = ?auto_367787 ?auto_367793 ) ) ( not ( = ?auto_367787 ?auto_367799 ) ) ( not ( = ?auto_367786 ?auto_367788 ) ) ( not ( = ?auto_367786 ?auto_367789 ) ) ( not ( = ?auto_367786 ?auto_367790 ) ) ( not ( = ?auto_367786 ?auto_367791 ) ) ( not ( = ?auto_367786 ?auto_367792 ) ) ( not ( = ?auto_367786 ?auto_367793 ) ) ( not ( = ?auto_367786 ?auto_367799 ) ) ( not ( = ?auto_367788 ?auto_367789 ) ) ( not ( = ?auto_367788 ?auto_367790 ) ) ( not ( = ?auto_367788 ?auto_367791 ) ) ( not ( = ?auto_367788 ?auto_367792 ) ) ( not ( = ?auto_367788 ?auto_367793 ) ) ( not ( = ?auto_367788 ?auto_367799 ) ) ( not ( = ?auto_367789 ?auto_367790 ) ) ( not ( = ?auto_367789 ?auto_367791 ) ) ( not ( = ?auto_367789 ?auto_367792 ) ) ( not ( = ?auto_367789 ?auto_367793 ) ) ( not ( = ?auto_367789 ?auto_367799 ) ) ( not ( = ?auto_367790 ?auto_367791 ) ) ( not ( = ?auto_367790 ?auto_367792 ) ) ( not ( = ?auto_367790 ?auto_367793 ) ) ( not ( = ?auto_367790 ?auto_367799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367791 ?auto_367792 ?auto_367793 )
      ( MAKE-10CRATE-VERIFY ?auto_367783 ?auto_367784 ?auto_367785 ?auto_367787 ?auto_367786 ?auto_367788 ?auto_367789 ?auto_367790 ?auto_367791 ?auto_367792 ?auto_367793 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_367909 - SURFACE
      ?auto_367910 - SURFACE
      ?auto_367911 - SURFACE
      ?auto_367913 - SURFACE
      ?auto_367912 - SURFACE
      ?auto_367914 - SURFACE
      ?auto_367915 - SURFACE
      ?auto_367916 - SURFACE
      ?auto_367917 - SURFACE
      ?auto_367918 - SURFACE
      ?auto_367919 - SURFACE
    )
    :vars
    (
      ?auto_367921 - HOIST
      ?auto_367920 - PLACE
      ?auto_367922 - PLACE
      ?auto_367924 - HOIST
      ?auto_367925 - SURFACE
      ?auto_367923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_367921 ?auto_367920 ) ( IS-CRATE ?auto_367919 ) ( not ( = ?auto_367918 ?auto_367919 ) ) ( not ( = ?auto_367917 ?auto_367918 ) ) ( not ( = ?auto_367917 ?auto_367919 ) ) ( not ( = ?auto_367922 ?auto_367920 ) ) ( HOIST-AT ?auto_367924 ?auto_367922 ) ( not ( = ?auto_367921 ?auto_367924 ) ) ( AVAILABLE ?auto_367924 ) ( SURFACE-AT ?auto_367919 ?auto_367922 ) ( ON ?auto_367919 ?auto_367925 ) ( CLEAR ?auto_367919 ) ( not ( = ?auto_367918 ?auto_367925 ) ) ( not ( = ?auto_367919 ?auto_367925 ) ) ( not ( = ?auto_367917 ?auto_367925 ) ) ( TRUCK-AT ?auto_367923 ?auto_367920 ) ( SURFACE-AT ?auto_367917 ?auto_367920 ) ( CLEAR ?auto_367917 ) ( IS-CRATE ?auto_367918 ) ( AVAILABLE ?auto_367921 ) ( IN ?auto_367918 ?auto_367923 ) ( ON ?auto_367910 ?auto_367909 ) ( ON ?auto_367911 ?auto_367910 ) ( ON ?auto_367913 ?auto_367911 ) ( ON ?auto_367912 ?auto_367913 ) ( ON ?auto_367914 ?auto_367912 ) ( ON ?auto_367915 ?auto_367914 ) ( ON ?auto_367916 ?auto_367915 ) ( ON ?auto_367917 ?auto_367916 ) ( not ( = ?auto_367909 ?auto_367910 ) ) ( not ( = ?auto_367909 ?auto_367911 ) ) ( not ( = ?auto_367909 ?auto_367913 ) ) ( not ( = ?auto_367909 ?auto_367912 ) ) ( not ( = ?auto_367909 ?auto_367914 ) ) ( not ( = ?auto_367909 ?auto_367915 ) ) ( not ( = ?auto_367909 ?auto_367916 ) ) ( not ( = ?auto_367909 ?auto_367917 ) ) ( not ( = ?auto_367909 ?auto_367918 ) ) ( not ( = ?auto_367909 ?auto_367919 ) ) ( not ( = ?auto_367909 ?auto_367925 ) ) ( not ( = ?auto_367910 ?auto_367911 ) ) ( not ( = ?auto_367910 ?auto_367913 ) ) ( not ( = ?auto_367910 ?auto_367912 ) ) ( not ( = ?auto_367910 ?auto_367914 ) ) ( not ( = ?auto_367910 ?auto_367915 ) ) ( not ( = ?auto_367910 ?auto_367916 ) ) ( not ( = ?auto_367910 ?auto_367917 ) ) ( not ( = ?auto_367910 ?auto_367918 ) ) ( not ( = ?auto_367910 ?auto_367919 ) ) ( not ( = ?auto_367910 ?auto_367925 ) ) ( not ( = ?auto_367911 ?auto_367913 ) ) ( not ( = ?auto_367911 ?auto_367912 ) ) ( not ( = ?auto_367911 ?auto_367914 ) ) ( not ( = ?auto_367911 ?auto_367915 ) ) ( not ( = ?auto_367911 ?auto_367916 ) ) ( not ( = ?auto_367911 ?auto_367917 ) ) ( not ( = ?auto_367911 ?auto_367918 ) ) ( not ( = ?auto_367911 ?auto_367919 ) ) ( not ( = ?auto_367911 ?auto_367925 ) ) ( not ( = ?auto_367913 ?auto_367912 ) ) ( not ( = ?auto_367913 ?auto_367914 ) ) ( not ( = ?auto_367913 ?auto_367915 ) ) ( not ( = ?auto_367913 ?auto_367916 ) ) ( not ( = ?auto_367913 ?auto_367917 ) ) ( not ( = ?auto_367913 ?auto_367918 ) ) ( not ( = ?auto_367913 ?auto_367919 ) ) ( not ( = ?auto_367913 ?auto_367925 ) ) ( not ( = ?auto_367912 ?auto_367914 ) ) ( not ( = ?auto_367912 ?auto_367915 ) ) ( not ( = ?auto_367912 ?auto_367916 ) ) ( not ( = ?auto_367912 ?auto_367917 ) ) ( not ( = ?auto_367912 ?auto_367918 ) ) ( not ( = ?auto_367912 ?auto_367919 ) ) ( not ( = ?auto_367912 ?auto_367925 ) ) ( not ( = ?auto_367914 ?auto_367915 ) ) ( not ( = ?auto_367914 ?auto_367916 ) ) ( not ( = ?auto_367914 ?auto_367917 ) ) ( not ( = ?auto_367914 ?auto_367918 ) ) ( not ( = ?auto_367914 ?auto_367919 ) ) ( not ( = ?auto_367914 ?auto_367925 ) ) ( not ( = ?auto_367915 ?auto_367916 ) ) ( not ( = ?auto_367915 ?auto_367917 ) ) ( not ( = ?auto_367915 ?auto_367918 ) ) ( not ( = ?auto_367915 ?auto_367919 ) ) ( not ( = ?auto_367915 ?auto_367925 ) ) ( not ( = ?auto_367916 ?auto_367917 ) ) ( not ( = ?auto_367916 ?auto_367918 ) ) ( not ( = ?auto_367916 ?auto_367919 ) ) ( not ( = ?auto_367916 ?auto_367925 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_367917 ?auto_367918 ?auto_367919 )
      ( MAKE-10CRATE-VERIFY ?auto_367909 ?auto_367910 ?auto_367911 ?auto_367913 ?auto_367912 ?auto_367914 ?auto_367915 ?auto_367916 ?auto_367917 ?auto_367918 ?auto_367919 ) )
  )

)

