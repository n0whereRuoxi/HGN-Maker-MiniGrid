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
      ?auto_2507 - SURFACE
      ?auto_2508 - SURFACE
    )
    :vars
    (
      ?auto_2509 - HOIST
      ?auto_2510 - PLACE
      ?auto_2512 - PLACE
      ?auto_2513 - HOIST
      ?auto_2514 - SURFACE
      ?auto_2511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2509 ?auto_2510 ) ( SURFACE-AT ?auto_2507 ?auto_2510 ) ( CLEAR ?auto_2507 ) ( IS-CRATE ?auto_2508 ) ( AVAILABLE ?auto_2509 ) ( not ( = ?auto_2512 ?auto_2510 ) ) ( HOIST-AT ?auto_2513 ?auto_2512 ) ( AVAILABLE ?auto_2513 ) ( SURFACE-AT ?auto_2508 ?auto_2512 ) ( ON ?auto_2508 ?auto_2514 ) ( CLEAR ?auto_2508 ) ( TRUCK-AT ?auto_2511 ?auto_2510 ) ( not ( = ?auto_2507 ?auto_2508 ) ) ( not ( = ?auto_2507 ?auto_2514 ) ) ( not ( = ?auto_2508 ?auto_2514 ) ) ( not ( = ?auto_2509 ?auto_2513 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2511 ?auto_2510 ?auto_2512 )
      ( !LIFT ?auto_2513 ?auto_2508 ?auto_2514 ?auto_2512 )
      ( !LOAD ?auto_2513 ?auto_2508 ?auto_2511 ?auto_2512 )
      ( !DRIVE ?auto_2511 ?auto_2512 ?auto_2510 )
      ( !UNLOAD ?auto_2509 ?auto_2508 ?auto_2511 ?auto_2510 )
      ( !DROP ?auto_2509 ?auto_2508 ?auto_2507 ?auto_2510 )
      ( MAKE-1CRATE-VERIFY ?auto_2507 ?auto_2508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2517 - SURFACE
      ?auto_2518 - SURFACE
    )
    :vars
    (
      ?auto_2519 - HOIST
      ?auto_2520 - PLACE
      ?auto_2522 - PLACE
      ?auto_2523 - HOIST
      ?auto_2524 - SURFACE
      ?auto_2521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2519 ?auto_2520 ) ( SURFACE-AT ?auto_2517 ?auto_2520 ) ( CLEAR ?auto_2517 ) ( IS-CRATE ?auto_2518 ) ( AVAILABLE ?auto_2519 ) ( not ( = ?auto_2522 ?auto_2520 ) ) ( HOIST-AT ?auto_2523 ?auto_2522 ) ( AVAILABLE ?auto_2523 ) ( SURFACE-AT ?auto_2518 ?auto_2522 ) ( ON ?auto_2518 ?auto_2524 ) ( CLEAR ?auto_2518 ) ( TRUCK-AT ?auto_2521 ?auto_2520 ) ( not ( = ?auto_2517 ?auto_2518 ) ) ( not ( = ?auto_2517 ?auto_2524 ) ) ( not ( = ?auto_2518 ?auto_2524 ) ) ( not ( = ?auto_2519 ?auto_2523 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2521 ?auto_2520 ?auto_2522 )
      ( !LIFT ?auto_2523 ?auto_2518 ?auto_2524 ?auto_2522 )
      ( !LOAD ?auto_2523 ?auto_2518 ?auto_2521 ?auto_2522 )
      ( !DRIVE ?auto_2521 ?auto_2522 ?auto_2520 )
      ( !UNLOAD ?auto_2519 ?auto_2518 ?auto_2521 ?auto_2520 )
      ( !DROP ?auto_2519 ?auto_2518 ?auto_2517 ?auto_2520 )
      ( MAKE-1CRATE-VERIFY ?auto_2517 ?auto_2518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2528 - SURFACE
      ?auto_2529 - SURFACE
      ?auto_2530 - SURFACE
    )
    :vars
    (
      ?auto_2532 - HOIST
      ?auto_2531 - PLACE
      ?auto_2536 - PLACE
      ?auto_2534 - HOIST
      ?auto_2533 - SURFACE
      ?auto_2539 - PLACE
      ?auto_2538 - HOIST
      ?auto_2537 - SURFACE
      ?auto_2535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2532 ?auto_2531 ) ( IS-CRATE ?auto_2530 ) ( not ( = ?auto_2536 ?auto_2531 ) ) ( HOIST-AT ?auto_2534 ?auto_2536 ) ( AVAILABLE ?auto_2534 ) ( SURFACE-AT ?auto_2530 ?auto_2536 ) ( ON ?auto_2530 ?auto_2533 ) ( CLEAR ?auto_2530 ) ( not ( = ?auto_2529 ?auto_2530 ) ) ( not ( = ?auto_2529 ?auto_2533 ) ) ( not ( = ?auto_2530 ?auto_2533 ) ) ( not ( = ?auto_2532 ?auto_2534 ) ) ( SURFACE-AT ?auto_2528 ?auto_2531 ) ( CLEAR ?auto_2528 ) ( IS-CRATE ?auto_2529 ) ( AVAILABLE ?auto_2532 ) ( not ( = ?auto_2539 ?auto_2531 ) ) ( HOIST-AT ?auto_2538 ?auto_2539 ) ( AVAILABLE ?auto_2538 ) ( SURFACE-AT ?auto_2529 ?auto_2539 ) ( ON ?auto_2529 ?auto_2537 ) ( CLEAR ?auto_2529 ) ( TRUCK-AT ?auto_2535 ?auto_2531 ) ( not ( = ?auto_2528 ?auto_2529 ) ) ( not ( = ?auto_2528 ?auto_2537 ) ) ( not ( = ?auto_2529 ?auto_2537 ) ) ( not ( = ?auto_2532 ?auto_2538 ) ) ( not ( = ?auto_2528 ?auto_2530 ) ) ( not ( = ?auto_2528 ?auto_2533 ) ) ( not ( = ?auto_2530 ?auto_2537 ) ) ( not ( = ?auto_2536 ?auto_2539 ) ) ( not ( = ?auto_2534 ?auto_2538 ) ) ( not ( = ?auto_2533 ?auto_2537 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2528 ?auto_2529 )
      ( MAKE-1CRATE ?auto_2529 ?auto_2530 )
      ( MAKE-2CRATE-VERIFY ?auto_2528 ?auto_2529 ?auto_2530 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2542 - SURFACE
      ?auto_2543 - SURFACE
    )
    :vars
    (
      ?auto_2544 - HOIST
      ?auto_2545 - PLACE
      ?auto_2547 - PLACE
      ?auto_2548 - HOIST
      ?auto_2549 - SURFACE
      ?auto_2546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2544 ?auto_2545 ) ( SURFACE-AT ?auto_2542 ?auto_2545 ) ( CLEAR ?auto_2542 ) ( IS-CRATE ?auto_2543 ) ( AVAILABLE ?auto_2544 ) ( not ( = ?auto_2547 ?auto_2545 ) ) ( HOIST-AT ?auto_2548 ?auto_2547 ) ( AVAILABLE ?auto_2548 ) ( SURFACE-AT ?auto_2543 ?auto_2547 ) ( ON ?auto_2543 ?auto_2549 ) ( CLEAR ?auto_2543 ) ( TRUCK-AT ?auto_2546 ?auto_2545 ) ( not ( = ?auto_2542 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2549 ) ) ( not ( = ?auto_2543 ?auto_2549 ) ) ( not ( = ?auto_2544 ?auto_2548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2546 ?auto_2545 ?auto_2547 )
      ( !LIFT ?auto_2548 ?auto_2543 ?auto_2549 ?auto_2547 )
      ( !LOAD ?auto_2548 ?auto_2543 ?auto_2546 ?auto_2547 )
      ( !DRIVE ?auto_2546 ?auto_2547 ?auto_2545 )
      ( !UNLOAD ?auto_2544 ?auto_2543 ?auto_2546 ?auto_2545 )
      ( !DROP ?auto_2544 ?auto_2543 ?auto_2542 ?auto_2545 )
      ( MAKE-1CRATE-VERIFY ?auto_2542 ?auto_2543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2554 - SURFACE
      ?auto_2555 - SURFACE
      ?auto_2556 - SURFACE
      ?auto_2557 - SURFACE
    )
    :vars
    (
      ?auto_2558 - HOIST
      ?auto_2561 - PLACE
      ?auto_2562 - PLACE
      ?auto_2559 - HOIST
      ?auto_2560 - SURFACE
      ?auto_2567 - PLACE
      ?auto_2565 - HOIST
      ?auto_2564 - SURFACE
      ?auto_2566 - SURFACE
      ?auto_2563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2558 ?auto_2561 ) ( IS-CRATE ?auto_2557 ) ( not ( = ?auto_2562 ?auto_2561 ) ) ( HOIST-AT ?auto_2559 ?auto_2562 ) ( SURFACE-AT ?auto_2557 ?auto_2562 ) ( ON ?auto_2557 ?auto_2560 ) ( CLEAR ?auto_2557 ) ( not ( = ?auto_2556 ?auto_2557 ) ) ( not ( = ?auto_2556 ?auto_2560 ) ) ( not ( = ?auto_2557 ?auto_2560 ) ) ( not ( = ?auto_2558 ?auto_2559 ) ) ( IS-CRATE ?auto_2556 ) ( not ( = ?auto_2567 ?auto_2561 ) ) ( HOIST-AT ?auto_2565 ?auto_2567 ) ( AVAILABLE ?auto_2565 ) ( SURFACE-AT ?auto_2556 ?auto_2567 ) ( ON ?auto_2556 ?auto_2564 ) ( CLEAR ?auto_2556 ) ( not ( = ?auto_2555 ?auto_2556 ) ) ( not ( = ?auto_2555 ?auto_2564 ) ) ( not ( = ?auto_2556 ?auto_2564 ) ) ( not ( = ?auto_2558 ?auto_2565 ) ) ( SURFACE-AT ?auto_2554 ?auto_2561 ) ( CLEAR ?auto_2554 ) ( IS-CRATE ?auto_2555 ) ( AVAILABLE ?auto_2558 ) ( AVAILABLE ?auto_2559 ) ( SURFACE-AT ?auto_2555 ?auto_2562 ) ( ON ?auto_2555 ?auto_2566 ) ( CLEAR ?auto_2555 ) ( TRUCK-AT ?auto_2563 ?auto_2561 ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2566 ) ) ( not ( = ?auto_2555 ?auto_2566 ) ) ( not ( = ?auto_2554 ?auto_2556 ) ) ( not ( = ?auto_2554 ?auto_2564 ) ) ( not ( = ?auto_2556 ?auto_2566 ) ) ( not ( = ?auto_2567 ?auto_2562 ) ) ( not ( = ?auto_2565 ?auto_2559 ) ) ( not ( = ?auto_2564 ?auto_2566 ) ) ( not ( = ?auto_2554 ?auto_2557 ) ) ( not ( = ?auto_2554 ?auto_2560 ) ) ( not ( = ?auto_2555 ?auto_2557 ) ) ( not ( = ?auto_2555 ?auto_2560 ) ) ( not ( = ?auto_2557 ?auto_2564 ) ) ( not ( = ?auto_2557 ?auto_2566 ) ) ( not ( = ?auto_2560 ?auto_2564 ) ) ( not ( = ?auto_2560 ?auto_2566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2554 ?auto_2555 ?auto_2556 )
      ( MAKE-1CRATE ?auto_2556 ?auto_2557 )
      ( MAKE-3CRATE-VERIFY ?auto_2554 ?auto_2555 ?auto_2556 ?auto_2557 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2570 - SURFACE
      ?auto_2571 - SURFACE
    )
    :vars
    (
      ?auto_2572 - HOIST
      ?auto_2573 - PLACE
      ?auto_2575 - PLACE
      ?auto_2576 - HOIST
      ?auto_2577 - SURFACE
      ?auto_2574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2572 ?auto_2573 ) ( SURFACE-AT ?auto_2570 ?auto_2573 ) ( CLEAR ?auto_2570 ) ( IS-CRATE ?auto_2571 ) ( AVAILABLE ?auto_2572 ) ( not ( = ?auto_2575 ?auto_2573 ) ) ( HOIST-AT ?auto_2576 ?auto_2575 ) ( AVAILABLE ?auto_2576 ) ( SURFACE-AT ?auto_2571 ?auto_2575 ) ( ON ?auto_2571 ?auto_2577 ) ( CLEAR ?auto_2571 ) ( TRUCK-AT ?auto_2574 ?auto_2573 ) ( not ( = ?auto_2570 ?auto_2571 ) ) ( not ( = ?auto_2570 ?auto_2577 ) ) ( not ( = ?auto_2571 ?auto_2577 ) ) ( not ( = ?auto_2572 ?auto_2576 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2574 ?auto_2573 ?auto_2575 )
      ( !LIFT ?auto_2576 ?auto_2571 ?auto_2577 ?auto_2575 )
      ( !LOAD ?auto_2576 ?auto_2571 ?auto_2574 ?auto_2575 )
      ( !DRIVE ?auto_2574 ?auto_2575 ?auto_2573 )
      ( !UNLOAD ?auto_2572 ?auto_2571 ?auto_2574 ?auto_2573 )
      ( !DROP ?auto_2572 ?auto_2571 ?auto_2570 ?auto_2573 )
      ( MAKE-1CRATE-VERIFY ?auto_2570 ?auto_2571 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2583 - SURFACE
      ?auto_2584 - SURFACE
      ?auto_2585 - SURFACE
      ?auto_2586 - SURFACE
      ?auto_2587 - SURFACE
    )
    :vars
    (
      ?auto_2593 - HOIST
      ?auto_2591 - PLACE
      ?auto_2588 - PLACE
      ?auto_2589 - HOIST
      ?auto_2590 - SURFACE
      ?auto_2595 - SURFACE
      ?auto_2598 - PLACE
      ?auto_2597 - HOIST
      ?auto_2596 - SURFACE
      ?auto_2594 - SURFACE
      ?auto_2592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2593 ?auto_2591 ) ( IS-CRATE ?auto_2587 ) ( not ( = ?auto_2588 ?auto_2591 ) ) ( HOIST-AT ?auto_2589 ?auto_2588 ) ( SURFACE-AT ?auto_2587 ?auto_2588 ) ( ON ?auto_2587 ?auto_2590 ) ( CLEAR ?auto_2587 ) ( not ( = ?auto_2586 ?auto_2587 ) ) ( not ( = ?auto_2586 ?auto_2590 ) ) ( not ( = ?auto_2587 ?auto_2590 ) ) ( not ( = ?auto_2593 ?auto_2589 ) ) ( IS-CRATE ?auto_2586 ) ( SURFACE-AT ?auto_2586 ?auto_2588 ) ( ON ?auto_2586 ?auto_2595 ) ( CLEAR ?auto_2586 ) ( not ( = ?auto_2585 ?auto_2586 ) ) ( not ( = ?auto_2585 ?auto_2595 ) ) ( not ( = ?auto_2586 ?auto_2595 ) ) ( IS-CRATE ?auto_2585 ) ( not ( = ?auto_2598 ?auto_2591 ) ) ( HOIST-AT ?auto_2597 ?auto_2598 ) ( AVAILABLE ?auto_2597 ) ( SURFACE-AT ?auto_2585 ?auto_2598 ) ( ON ?auto_2585 ?auto_2596 ) ( CLEAR ?auto_2585 ) ( not ( = ?auto_2584 ?auto_2585 ) ) ( not ( = ?auto_2584 ?auto_2596 ) ) ( not ( = ?auto_2585 ?auto_2596 ) ) ( not ( = ?auto_2593 ?auto_2597 ) ) ( SURFACE-AT ?auto_2583 ?auto_2591 ) ( CLEAR ?auto_2583 ) ( IS-CRATE ?auto_2584 ) ( AVAILABLE ?auto_2593 ) ( AVAILABLE ?auto_2589 ) ( SURFACE-AT ?auto_2584 ?auto_2588 ) ( ON ?auto_2584 ?auto_2594 ) ( CLEAR ?auto_2584 ) ( TRUCK-AT ?auto_2592 ?auto_2591 ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( not ( = ?auto_2583 ?auto_2594 ) ) ( not ( = ?auto_2584 ?auto_2594 ) ) ( not ( = ?auto_2583 ?auto_2585 ) ) ( not ( = ?auto_2583 ?auto_2596 ) ) ( not ( = ?auto_2585 ?auto_2594 ) ) ( not ( = ?auto_2598 ?auto_2588 ) ) ( not ( = ?auto_2597 ?auto_2589 ) ) ( not ( = ?auto_2596 ?auto_2594 ) ) ( not ( = ?auto_2583 ?auto_2586 ) ) ( not ( = ?auto_2583 ?auto_2595 ) ) ( not ( = ?auto_2584 ?auto_2586 ) ) ( not ( = ?auto_2584 ?auto_2595 ) ) ( not ( = ?auto_2586 ?auto_2596 ) ) ( not ( = ?auto_2586 ?auto_2594 ) ) ( not ( = ?auto_2595 ?auto_2596 ) ) ( not ( = ?auto_2595 ?auto_2594 ) ) ( not ( = ?auto_2583 ?auto_2587 ) ) ( not ( = ?auto_2583 ?auto_2590 ) ) ( not ( = ?auto_2584 ?auto_2587 ) ) ( not ( = ?auto_2584 ?auto_2590 ) ) ( not ( = ?auto_2585 ?auto_2587 ) ) ( not ( = ?auto_2585 ?auto_2590 ) ) ( not ( = ?auto_2587 ?auto_2595 ) ) ( not ( = ?auto_2587 ?auto_2596 ) ) ( not ( = ?auto_2587 ?auto_2594 ) ) ( not ( = ?auto_2590 ?auto_2595 ) ) ( not ( = ?auto_2590 ?auto_2596 ) ) ( not ( = ?auto_2590 ?auto_2594 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2583 ?auto_2584 ?auto_2585 ?auto_2586 )
      ( MAKE-1CRATE ?auto_2586 ?auto_2587 )
      ( MAKE-4CRATE-VERIFY ?auto_2583 ?auto_2584 ?auto_2585 ?auto_2586 ?auto_2587 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2601 - SURFACE
      ?auto_2602 - SURFACE
    )
    :vars
    (
      ?auto_2603 - HOIST
      ?auto_2604 - PLACE
      ?auto_2606 - PLACE
      ?auto_2607 - HOIST
      ?auto_2608 - SURFACE
      ?auto_2605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2603 ?auto_2604 ) ( SURFACE-AT ?auto_2601 ?auto_2604 ) ( CLEAR ?auto_2601 ) ( IS-CRATE ?auto_2602 ) ( AVAILABLE ?auto_2603 ) ( not ( = ?auto_2606 ?auto_2604 ) ) ( HOIST-AT ?auto_2607 ?auto_2606 ) ( AVAILABLE ?auto_2607 ) ( SURFACE-AT ?auto_2602 ?auto_2606 ) ( ON ?auto_2602 ?auto_2608 ) ( CLEAR ?auto_2602 ) ( TRUCK-AT ?auto_2605 ?auto_2604 ) ( not ( = ?auto_2601 ?auto_2602 ) ) ( not ( = ?auto_2601 ?auto_2608 ) ) ( not ( = ?auto_2602 ?auto_2608 ) ) ( not ( = ?auto_2603 ?auto_2607 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2605 ?auto_2604 ?auto_2606 )
      ( !LIFT ?auto_2607 ?auto_2602 ?auto_2608 ?auto_2606 )
      ( !LOAD ?auto_2607 ?auto_2602 ?auto_2605 ?auto_2606 )
      ( !DRIVE ?auto_2605 ?auto_2606 ?auto_2604 )
      ( !UNLOAD ?auto_2603 ?auto_2602 ?auto_2605 ?auto_2604 )
      ( !DROP ?auto_2603 ?auto_2602 ?auto_2601 ?auto_2604 )
      ( MAKE-1CRATE-VERIFY ?auto_2601 ?auto_2602 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2615 - SURFACE
      ?auto_2616 - SURFACE
      ?auto_2617 - SURFACE
      ?auto_2618 - SURFACE
      ?auto_2619 - SURFACE
      ?auto_2620 - SURFACE
    )
    :vars
    (
      ?auto_2622 - HOIST
      ?auto_2625 - PLACE
      ?auto_2626 - PLACE
      ?auto_2624 - HOIST
      ?auto_2623 - SURFACE
      ?auto_2627 - SURFACE
      ?auto_2629 - SURFACE
      ?auto_2628 - PLACE
      ?auto_2631 - HOIST
      ?auto_2632 - SURFACE
      ?auto_2630 - SURFACE
      ?auto_2621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2622 ?auto_2625 ) ( IS-CRATE ?auto_2620 ) ( not ( = ?auto_2626 ?auto_2625 ) ) ( HOIST-AT ?auto_2624 ?auto_2626 ) ( SURFACE-AT ?auto_2620 ?auto_2626 ) ( ON ?auto_2620 ?auto_2623 ) ( CLEAR ?auto_2620 ) ( not ( = ?auto_2619 ?auto_2620 ) ) ( not ( = ?auto_2619 ?auto_2623 ) ) ( not ( = ?auto_2620 ?auto_2623 ) ) ( not ( = ?auto_2622 ?auto_2624 ) ) ( IS-CRATE ?auto_2619 ) ( SURFACE-AT ?auto_2619 ?auto_2626 ) ( ON ?auto_2619 ?auto_2627 ) ( CLEAR ?auto_2619 ) ( not ( = ?auto_2618 ?auto_2619 ) ) ( not ( = ?auto_2618 ?auto_2627 ) ) ( not ( = ?auto_2619 ?auto_2627 ) ) ( IS-CRATE ?auto_2618 ) ( SURFACE-AT ?auto_2618 ?auto_2626 ) ( ON ?auto_2618 ?auto_2629 ) ( CLEAR ?auto_2618 ) ( not ( = ?auto_2617 ?auto_2618 ) ) ( not ( = ?auto_2617 ?auto_2629 ) ) ( not ( = ?auto_2618 ?auto_2629 ) ) ( IS-CRATE ?auto_2617 ) ( not ( = ?auto_2628 ?auto_2625 ) ) ( HOIST-AT ?auto_2631 ?auto_2628 ) ( AVAILABLE ?auto_2631 ) ( SURFACE-AT ?auto_2617 ?auto_2628 ) ( ON ?auto_2617 ?auto_2632 ) ( CLEAR ?auto_2617 ) ( not ( = ?auto_2616 ?auto_2617 ) ) ( not ( = ?auto_2616 ?auto_2632 ) ) ( not ( = ?auto_2617 ?auto_2632 ) ) ( not ( = ?auto_2622 ?auto_2631 ) ) ( SURFACE-AT ?auto_2615 ?auto_2625 ) ( CLEAR ?auto_2615 ) ( IS-CRATE ?auto_2616 ) ( AVAILABLE ?auto_2622 ) ( AVAILABLE ?auto_2624 ) ( SURFACE-AT ?auto_2616 ?auto_2626 ) ( ON ?auto_2616 ?auto_2630 ) ( CLEAR ?auto_2616 ) ( TRUCK-AT ?auto_2621 ?auto_2625 ) ( not ( = ?auto_2615 ?auto_2616 ) ) ( not ( = ?auto_2615 ?auto_2630 ) ) ( not ( = ?auto_2616 ?auto_2630 ) ) ( not ( = ?auto_2615 ?auto_2617 ) ) ( not ( = ?auto_2615 ?auto_2632 ) ) ( not ( = ?auto_2617 ?auto_2630 ) ) ( not ( = ?auto_2628 ?auto_2626 ) ) ( not ( = ?auto_2631 ?auto_2624 ) ) ( not ( = ?auto_2632 ?auto_2630 ) ) ( not ( = ?auto_2615 ?auto_2618 ) ) ( not ( = ?auto_2615 ?auto_2629 ) ) ( not ( = ?auto_2616 ?auto_2618 ) ) ( not ( = ?auto_2616 ?auto_2629 ) ) ( not ( = ?auto_2618 ?auto_2632 ) ) ( not ( = ?auto_2618 ?auto_2630 ) ) ( not ( = ?auto_2629 ?auto_2632 ) ) ( not ( = ?auto_2629 ?auto_2630 ) ) ( not ( = ?auto_2615 ?auto_2619 ) ) ( not ( = ?auto_2615 ?auto_2627 ) ) ( not ( = ?auto_2616 ?auto_2619 ) ) ( not ( = ?auto_2616 ?auto_2627 ) ) ( not ( = ?auto_2617 ?auto_2619 ) ) ( not ( = ?auto_2617 ?auto_2627 ) ) ( not ( = ?auto_2619 ?auto_2629 ) ) ( not ( = ?auto_2619 ?auto_2632 ) ) ( not ( = ?auto_2619 ?auto_2630 ) ) ( not ( = ?auto_2627 ?auto_2629 ) ) ( not ( = ?auto_2627 ?auto_2632 ) ) ( not ( = ?auto_2627 ?auto_2630 ) ) ( not ( = ?auto_2615 ?auto_2620 ) ) ( not ( = ?auto_2615 ?auto_2623 ) ) ( not ( = ?auto_2616 ?auto_2620 ) ) ( not ( = ?auto_2616 ?auto_2623 ) ) ( not ( = ?auto_2617 ?auto_2620 ) ) ( not ( = ?auto_2617 ?auto_2623 ) ) ( not ( = ?auto_2618 ?auto_2620 ) ) ( not ( = ?auto_2618 ?auto_2623 ) ) ( not ( = ?auto_2620 ?auto_2627 ) ) ( not ( = ?auto_2620 ?auto_2629 ) ) ( not ( = ?auto_2620 ?auto_2632 ) ) ( not ( = ?auto_2620 ?auto_2630 ) ) ( not ( = ?auto_2623 ?auto_2627 ) ) ( not ( = ?auto_2623 ?auto_2629 ) ) ( not ( = ?auto_2623 ?auto_2632 ) ) ( not ( = ?auto_2623 ?auto_2630 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2615 ?auto_2616 ?auto_2617 ?auto_2618 ?auto_2619 )
      ( MAKE-1CRATE ?auto_2619 ?auto_2620 )
      ( MAKE-5CRATE-VERIFY ?auto_2615 ?auto_2616 ?auto_2617 ?auto_2618 ?auto_2619 ?auto_2620 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2635 - SURFACE
      ?auto_2636 - SURFACE
    )
    :vars
    (
      ?auto_2637 - HOIST
      ?auto_2638 - PLACE
      ?auto_2640 - PLACE
      ?auto_2641 - HOIST
      ?auto_2642 - SURFACE
      ?auto_2639 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2637 ?auto_2638 ) ( SURFACE-AT ?auto_2635 ?auto_2638 ) ( CLEAR ?auto_2635 ) ( IS-CRATE ?auto_2636 ) ( AVAILABLE ?auto_2637 ) ( not ( = ?auto_2640 ?auto_2638 ) ) ( HOIST-AT ?auto_2641 ?auto_2640 ) ( AVAILABLE ?auto_2641 ) ( SURFACE-AT ?auto_2636 ?auto_2640 ) ( ON ?auto_2636 ?auto_2642 ) ( CLEAR ?auto_2636 ) ( TRUCK-AT ?auto_2639 ?auto_2638 ) ( not ( = ?auto_2635 ?auto_2636 ) ) ( not ( = ?auto_2635 ?auto_2642 ) ) ( not ( = ?auto_2636 ?auto_2642 ) ) ( not ( = ?auto_2637 ?auto_2641 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2639 ?auto_2638 ?auto_2640 )
      ( !LIFT ?auto_2641 ?auto_2636 ?auto_2642 ?auto_2640 )
      ( !LOAD ?auto_2641 ?auto_2636 ?auto_2639 ?auto_2640 )
      ( !DRIVE ?auto_2639 ?auto_2640 ?auto_2638 )
      ( !UNLOAD ?auto_2637 ?auto_2636 ?auto_2639 ?auto_2638 )
      ( !DROP ?auto_2637 ?auto_2636 ?auto_2635 ?auto_2638 )
      ( MAKE-1CRATE-VERIFY ?auto_2635 ?auto_2636 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2650 - SURFACE
      ?auto_2651 - SURFACE
      ?auto_2652 - SURFACE
      ?auto_2653 - SURFACE
      ?auto_2654 - SURFACE
      ?auto_2655 - SURFACE
      ?auto_2656 - SURFACE
    )
    :vars
    (
      ?auto_2658 - HOIST
      ?auto_2657 - PLACE
      ?auto_2661 - PLACE
      ?auto_2659 - HOIST
      ?auto_2660 - SURFACE
      ?auto_2663 - PLACE
      ?auto_2671 - HOIST
      ?auto_2670 - SURFACE
      ?auto_2665 - SURFACE
      ?auto_2667 - SURFACE
      ?auto_2664 - PLACE
      ?auto_2669 - HOIST
      ?auto_2666 - SURFACE
      ?auto_2668 - SURFACE
      ?auto_2662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658 ?auto_2657 ) ( IS-CRATE ?auto_2656 ) ( not ( = ?auto_2661 ?auto_2657 ) ) ( HOIST-AT ?auto_2659 ?auto_2661 ) ( AVAILABLE ?auto_2659 ) ( SURFACE-AT ?auto_2656 ?auto_2661 ) ( ON ?auto_2656 ?auto_2660 ) ( CLEAR ?auto_2656 ) ( not ( = ?auto_2655 ?auto_2656 ) ) ( not ( = ?auto_2655 ?auto_2660 ) ) ( not ( = ?auto_2656 ?auto_2660 ) ) ( not ( = ?auto_2658 ?auto_2659 ) ) ( IS-CRATE ?auto_2655 ) ( not ( = ?auto_2663 ?auto_2657 ) ) ( HOIST-AT ?auto_2671 ?auto_2663 ) ( SURFACE-AT ?auto_2655 ?auto_2663 ) ( ON ?auto_2655 ?auto_2670 ) ( CLEAR ?auto_2655 ) ( not ( = ?auto_2654 ?auto_2655 ) ) ( not ( = ?auto_2654 ?auto_2670 ) ) ( not ( = ?auto_2655 ?auto_2670 ) ) ( not ( = ?auto_2658 ?auto_2671 ) ) ( IS-CRATE ?auto_2654 ) ( SURFACE-AT ?auto_2654 ?auto_2663 ) ( ON ?auto_2654 ?auto_2665 ) ( CLEAR ?auto_2654 ) ( not ( = ?auto_2653 ?auto_2654 ) ) ( not ( = ?auto_2653 ?auto_2665 ) ) ( not ( = ?auto_2654 ?auto_2665 ) ) ( IS-CRATE ?auto_2653 ) ( SURFACE-AT ?auto_2653 ?auto_2663 ) ( ON ?auto_2653 ?auto_2667 ) ( CLEAR ?auto_2653 ) ( not ( = ?auto_2652 ?auto_2653 ) ) ( not ( = ?auto_2652 ?auto_2667 ) ) ( not ( = ?auto_2653 ?auto_2667 ) ) ( IS-CRATE ?auto_2652 ) ( not ( = ?auto_2664 ?auto_2657 ) ) ( HOIST-AT ?auto_2669 ?auto_2664 ) ( AVAILABLE ?auto_2669 ) ( SURFACE-AT ?auto_2652 ?auto_2664 ) ( ON ?auto_2652 ?auto_2666 ) ( CLEAR ?auto_2652 ) ( not ( = ?auto_2651 ?auto_2652 ) ) ( not ( = ?auto_2651 ?auto_2666 ) ) ( not ( = ?auto_2652 ?auto_2666 ) ) ( not ( = ?auto_2658 ?auto_2669 ) ) ( SURFACE-AT ?auto_2650 ?auto_2657 ) ( CLEAR ?auto_2650 ) ( IS-CRATE ?auto_2651 ) ( AVAILABLE ?auto_2658 ) ( AVAILABLE ?auto_2671 ) ( SURFACE-AT ?auto_2651 ?auto_2663 ) ( ON ?auto_2651 ?auto_2668 ) ( CLEAR ?auto_2651 ) ( TRUCK-AT ?auto_2662 ?auto_2657 ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( not ( = ?auto_2650 ?auto_2668 ) ) ( not ( = ?auto_2651 ?auto_2668 ) ) ( not ( = ?auto_2650 ?auto_2652 ) ) ( not ( = ?auto_2650 ?auto_2666 ) ) ( not ( = ?auto_2652 ?auto_2668 ) ) ( not ( = ?auto_2664 ?auto_2663 ) ) ( not ( = ?auto_2669 ?auto_2671 ) ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( not ( = ?auto_2650 ?auto_2653 ) ) ( not ( = ?auto_2650 ?auto_2667 ) ) ( not ( = ?auto_2651 ?auto_2653 ) ) ( not ( = ?auto_2651 ?auto_2667 ) ) ( not ( = ?auto_2653 ?auto_2666 ) ) ( not ( = ?auto_2653 ?auto_2668 ) ) ( not ( = ?auto_2667 ?auto_2666 ) ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( not ( = ?auto_2650 ?auto_2654 ) ) ( not ( = ?auto_2650 ?auto_2665 ) ) ( not ( = ?auto_2651 ?auto_2654 ) ) ( not ( = ?auto_2651 ?auto_2665 ) ) ( not ( = ?auto_2652 ?auto_2654 ) ) ( not ( = ?auto_2652 ?auto_2665 ) ) ( not ( = ?auto_2654 ?auto_2667 ) ) ( not ( = ?auto_2654 ?auto_2666 ) ) ( not ( = ?auto_2654 ?auto_2668 ) ) ( not ( = ?auto_2665 ?auto_2667 ) ) ( not ( = ?auto_2665 ?auto_2666 ) ) ( not ( = ?auto_2665 ?auto_2668 ) ) ( not ( = ?auto_2650 ?auto_2655 ) ) ( not ( = ?auto_2650 ?auto_2670 ) ) ( not ( = ?auto_2651 ?auto_2655 ) ) ( not ( = ?auto_2651 ?auto_2670 ) ) ( not ( = ?auto_2652 ?auto_2655 ) ) ( not ( = ?auto_2652 ?auto_2670 ) ) ( not ( = ?auto_2653 ?auto_2655 ) ) ( not ( = ?auto_2653 ?auto_2670 ) ) ( not ( = ?auto_2655 ?auto_2665 ) ) ( not ( = ?auto_2655 ?auto_2667 ) ) ( not ( = ?auto_2655 ?auto_2666 ) ) ( not ( = ?auto_2655 ?auto_2668 ) ) ( not ( = ?auto_2670 ?auto_2665 ) ) ( not ( = ?auto_2670 ?auto_2667 ) ) ( not ( = ?auto_2670 ?auto_2666 ) ) ( not ( = ?auto_2670 ?auto_2668 ) ) ( not ( = ?auto_2650 ?auto_2656 ) ) ( not ( = ?auto_2650 ?auto_2660 ) ) ( not ( = ?auto_2651 ?auto_2656 ) ) ( not ( = ?auto_2651 ?auto_2660 ) ) ( not ( = ?auto_2652 ?auto_2656 ) ) ( not ( = ?auto_2652 ?auto_2660 ) ) ( not ( = ?auto_2653 ?auto_2656 ) ) ( not ( = ?auto_2653 ?auto_2660 ) ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( not ( = ?auto_2654 ?auto_2660 ) ) ( not ( = ?auto_2656 ?auto_2670 ) ) ( not ( = ?auto_2656 ?auto_2665 ) ) ( not ( = ?auto_2656 ?auto_2667 ) ) ( not ( = ?auto_2656 ?auto_2666 ) ) ( not ( = ?auto_2656 ?auto_2668 ) ) ( not ( = ?auto_2661 ?auto_2663 ) ) ( not ( = ?auto_2661 ?auto_2664 ) ) ( not ( = ?auto_2659 ?auto_2671 ) ) ( not ( = ?auto_2659 ?auto_2669 ) ) ( not ( = ?auto_2660 ?auto_2670 ) ) ( not ( = ?auto_2660 ?auto_2665 ) ) ( not ( = ?auto_2660 ?auto_2667 ) ) ( not ( = ?auto_2660 ?auto_2666 ) ) ( not ( = ?auto_2660 ?auto_2668 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2650 ?auto_2651 ?auto_2652 ?auto_2653 ?auto_2654 ?auto_2655 )
      ( MAKE-1CRATE ?auto_2655 ?auto_2656 )
      ( MAKE-6CRATE-VERIFY ?auto_2650 ?auto_2651 ?auto_2652 ?auto_2653 ?auto_2654 ?auto_2655 ?auto_2656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2674 - SURFACE
      ?auto_2675 - SURFACE
    )
    :vars
    (
      ?auto_2676 - HOIST
      ?auto_2677 - PLACE
      ?auto_2679 - PLACE
      ?auto_2680 - HOIST
      ?auto_2681 - SURFACE
      ?auto_2678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676 ?auto_2677 ) ( SURFACE-AT ?auto_2674 ?auto_2677 ) ( CLEAR ?auto_2674 ) ( IS-CRATE ?auto_2675 ) ( AVAILABLE ?auto_2676 ) ( not ( = ?auto_2679 ?auto_2677 ) ) ( HOIST-AT ?auto_2680 ?auto_2679 ) ( AVAILABLE ?auto_2680 ) ( SURFACE-AT ?auto_2675 ?auto_2679 ) ( ON ?auto_2675 ?auto_2681 ) ( CLEAR ?auto_2675 ) ( TRUCK-AT ?auto_2678 ?auto_2677 ) ( not ( = ?auto_2674 ?auto_2675 ) ) ( not ( = ?auto_2674 ?auto_2681 ) ) ( not ( = ?auto_2675 ?auto_2681 ) ) ( not ( = ?auto_2676 ?auto_2680 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2678 ?auto_2677 ?auto_2679 )
      ( !LIFT ?auto_2680 ?auto_2675 ?auto_2681 ?auto_2679 )
      ( !LOAD ?auto_2680 ?auto_2675 ?auto_2678 ?auto_2679 )
      ( !DRIVE ?auto_2678 ?auto_2679 ?auto_2677 )
      ( !UNLOAD ?auto_2676 ?auto_2675 ?auto_2678 ?auto_2677 )
      ( !DROP ?auto_2676 ?auto_2675 ?auto_2674 ?auto_2677 )
      ( MAKE-1CRATE-VERIFY ?auto_2674 ?auto_2675 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2690 - SURFACE
      ?auto_2691 - SURFACE
      ?auto_2692 - SURFACE
      ?auto_2693 - SURFACE
      ?auto_2694 - SURFACE
      ?auto_2695 - SURFACE
      ?auto_2696 - SURFACE
      ?auto_2697 - SURFACE
    )
    :vars
    (
      ?auto_2700 - HOIST
      ?auto_2699 - PLACE
      ?auto_2701 - PLACE
      ?auto_2702 - HOIST
      ?auto_2703 - SURFACE
      ?auto_2705 - PLACE
      ?auto_2706 - HOIST
      ?auto_2712 - SURFACE
      ?auto_2707 - PLACE
      ?auto_2704 - HOIST
      ?auto_2708 - SURFACE
      ?auto_2715 - SURFACE
      ?auto_2711 - SURFACE
      ?auto_2714 - PLACE
      ?auto_2709 - HOIST
      ?auto_2713 - SURFACE
      ?auto_2710 - SURFACE
      ?auto_2698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2700 ?auto_2699 ) ( IS-CRATE ?auto_2697 ) ( not ( = ?auto_2701 ?auto_2699 ) ) ( HOIST-AT ?auto_2702 ?auto_2701 ) ( AVAILABLE ?auto_2702 ) ( SURFACE-AT ?auto_2697 ?auto_2701 ) ( ON ?auto_2697 ?auto_2703 ) ( CLEAR ?auto_2697 ) ( not ( = ?auto_2696 ?auto_2697 ) ) ( not ( = ?auto_2696 ?auto_2703 ) ) ( not ( = ?auto_2697 ?auto_2703 ) ) ( not ( = ?auto_2700 ?auto_2702 ) ) ( IS-CRATE ?auto_2696 ) ( not ( = ?auto_2705 ?auto_2699 ) ) ( HOIST-AT ?auto_2706 ?auto_2705 ) ( AVAILABLE ?auto_2706 ) ( SURFACE-AT ?auto_2696 ?auto_2705 ) ( ON ?auto_2696 ?auto_2712 ) ( CLEAR ?auto_2696 ) ( not ( = ?auto_2695 ?auto_2696 ) ) ( not ( = ?auto_2695 ?auto_2712 ) ) ( not ( = ?auto_2696 ?auto_2712 ) ) ( not ( = ?auto_2700 ?auto_2706 ) ) ( IS-CRATE ?auto_2695 ) ( not ( = ?auto_2707 ?auto_2699 ) ) ( HOIST-AT ?auto_2704 ?auto_2707 ) ( SURFACE-AT ?auto_2695 ?auto_2707 ) ( ON ?auto_2695 ?auto_2708 ) ( CLEAR ?auto_2695 ) ( not ( = ?auto_2694 ?auto_2695 ) ) ( not ( = ?auto_2694 ?auto_2708 ) ) ( not ( = ?auto_2695 ?auto_2708 ) ) ( not ( = ?auto_2700 ?auto_2704 ) ) ( IS-CRATE ?auto_2694 ) ( SURFACE-AT ?auto_2694 ?auto_2707 ) ( ON ?auto_2694 ?auto_2715 ) ( CLEAR ?auto_2694 ) ( not ( = ?auto_2693 ?auto_2694 ) ) ( not ( = ?auto_2693 ?auto_2715 ) ) ( not ( = ?auto_2694 ?auto_2715 ) ) ( IS-CRATE ?auto_2693 ) ( SURFACE-AT ?auto_2693 ?auto_2707 ) ( ON ?auto_2693 ?auto_2711 ) ( CLEAR ?auto_2693 ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2711 ) ) ( not ( = ?auto_2693 ?auto_2711 ) ) ( IS-CRATE ?auto_2692 ) ( not ( = ?auto_2714 ?auto_2699 ) ) ( HOIST-AT ?auto_2709 ?auto_2714 ) ( AVAILABLE ?auto_2709 ) ( SURFACE-AT ?auto_2692 ?auto_2714 ) ( ON ?auto_2692 ?auto_2713 ) ( CLEAR ?auto_2692 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2691 ?auto_2713 ) ) ( not ( = ?auto_2692 ?auto_2713 ) ) ( not ( = ?auto_2700 ?auto_2709 ) ) ( SURFACE-AT ?auto_2690 ?auto_2699 ) ( CLEAR ?auto_2690 ) ( IS-CRATE ?auto_2691 ) ( AVAILABLE ?auto_2700 ) ( AVAILABLE ?auto_2704 ) ( SURFACE-AT ?auto_2691 ?auto_2707 ) ( ON ?auto_2691 ?auto_2710 ) ( CLEAR ?auto_2691 ) ( TRUCK-AT ?auto_2698 ?auto_2699 ) ( not ( = ?auto_2690 ?auto_2691 ) ) ( not ( = ?auto_2690 ?auto_2710 ) ) ( not ( = ?auto_2691 ?auto_2710 ) ) ( not ( = ?auto_2690 ?auto_2692 ) ) ( not ( = ?auto_2690 ?auto_2713 ) ) ( not ( = ?auto_2692 ?auto_2710 ) ) ( not ( = ?auto_2714 ?auto_2707 ) ) ( not ( = ?auto_2709 ?auto_2704 ) ) ( not ( = ?auto_2713 ?auto_2710 ) ) ( not ( = ?auto_2690 ?auto_2693 ) ) ( not ( = ?auto_2690 ?auto_2711 ) ) ( not ( = ?auto_2691 ?auto_2693 ) ) ( not ( = ?auto_2691 ?auto_2711 ) ) ( not ( = ?auto_2693 ?auto_2713 ) ) ( not ( = ?auto_2693 ?auto_2710 ) ) ( not ( = ?auto_2711 ?auto_2713 ) ) ( not ( = ?auto_2711 ?auto_2710 ) ) ( not ( = ?auto_2690 ?auto_2694 ) ) ( not ( = ?auto_2690 ?auto_2715 ) ) ( not ( = ?auto_2691 ?auto_2694 ) ) ( not ( = ?auto_2691 ?auto_2715 ) ) ( not ( = ?auto_2692 ?auto_2694 ) ) ( not ( = ?auto_2692 ?auto_2715 ) ) ( not ( = ?auto_2694 ?auto_2711 ) ) ( not ( = ?auto_2694 ?auto_2713 ) ) ( not ( = ?auto_2694 ?auto_2710 ) ) ( not ( = ?auto_2715 ?auto_2711 ) ) ( not ( = ?auto_2715 ?auto_2713 ) ) ( not ( = ?auto_2715 ?auto_2710 ) ) ( not ( = ?auto_2690 ?auto_2695 ) ) ( not ( = ?auto_2690 ?auto_2708 ) ) ( not ( = ?auto_2691 ?auto_2695 ) ) ( not ( = ?auto_2691 ?auto_2708 ) ) ( not ( = ?auto_2692 ?auto_2695 ) ) ( not ( = ?auto_2692 ?auto_2708 ) ) ( not ( = ?auto_2693 ?auto_2695 ) ) ( not ( = ?auto_2693 ?auto_2708 ) ) ( not ( = ?auto_2695 ?auto_2715 ) ) ( not ( = ?auto_2695 ?auto_2711 ) ) ( not ( = ?auto_2695 ?auto_2713 ) ) ( not ( = ?auto_2695 ?auto_2710 ) ) ( not ( = ?auto_2708 ?auto_2715 ) ) ( not ( = ?auto_2708 ?auto_2711 ) ) ( not ( = ?auto_2708 ?auto_2713 ) ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( not ( = ?auto_2690 ?auto_2696 ) ) ( not ( = ?auto_2690 ?auto_2712 ) ) ( not ( = ?auto_2691 ?auto_2696 ) ) ( not ( = ?auto_2691 ?auto_2712 ) ) ( not ( = ?auto_2692 ?auto_2696 ) ) ( not ( = ?auto_2692 ?auto_2712 ) ) ( not ( = ?auto_2693 ?auto_2696 ) ) ( not ( = ?auto_2693 ?auto_2712 ) ) ( not ( = ?auto_2694 ?auto_2696 ) ) ( not ( = ?auto_2694 ?auto_2712 ) ) ( not ( = ?auto_2696 ?auto_2708 ) ) ( not ( = ?auto_2696 ?auto_2715 ) ) ( not ( = ?auto_2696 ?auto_2711 ) ) ( not ( = ?auto_2696 ?auto_2713 ) ) ( not ( = ?auto_2696 ?auto_2710 ) ) ( not ( = ?auto_2705 ?auto_2707 ) ) ( not ( = ?auto_2705 ?auto_2714 ) ) ( not ( = ?auto_2706 ?auto_2704 ) ) ( not ( = ?auto_2706 ?auto_2709 ) ) ( not ( = ?auto_2712 ?auto_2708 ) ) ( not ( = ?auto_2712 ?auto_2715 ) ) ( not ( = ?auto_2712 ?auto_2711 ) ) ( not ( = ?auto_2712 ?auto_2713 ) ) ( not ( = ?auto_2712 ?auto_2710 ) ) ( not ( = ?auto_2690 ?auto_2697 ) ) ( not ( = ?auto_2690 ?auto_2703 ) ) ( not ( = ?auto_2691 ?auto_2697 ) ) ( not ( = ?auto_2691 ?auto_2703 ) ) ( not ( = ?auto_2692 ?auto_2697 ) ) ( not ( = ?auto_2692 ?auto_2703 ) ) ( not ( = ?auto_2693 ?auto_2697 ) ) ( not ( = ?auto_2693 ?auto_2703 ) ) ( not ( = ?auto_2694 ?auto_2697 ) ) ( not ( = ?auto_2694 ?auto_2703 ) ) ( not ( = ?auto_2695 ?auto_2697 ) ) ( not ( = ?auto_2695 ?auto_2703 ) ) ( not ( = ?auto_2697 ?auto_2712 ) ) ( not ( = ?auto_2697 ?auto_2708 ) ) ( not ( = ?auto_2697 ?auto_2715 ) ) ( not ( = ?auto_2697 ?auto_2711 ) ) ( not ( = ?auto_2697 ?auto_2713 ) ) ( not ( = ?auto_2697 ?auto_2710 ) ) ( not ( = ?auto_2701 ?auto_2705 ) ) ( not ( = ?auto_2701 ?auto_2707 ) ) ( not ( = ?auto_2701 ?auto_2714 ) ) ( not ( = ?auto_2702 ?auto_2706 ) ) ( not ( = ?auto_2702 ?auto_2704 ) ) ( not ( = ?auto_2702 ?auto_2709 ) ) ( not ( = ?auto_2703 ?auto_2712 ) ) ( not ( = ?auto_2703 ?auto_2708 ) ) ( not ( = ?auto_2703 ?auto_2715 ) ) ( not ( = ?auto_2703 ?auto_2711 ) ) ( not ( = ?auto_2703 ?auto_2713 ) ) ( not ( = ?auto_2703 ?auto_2710 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2690 ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2694 ?auto_2695 ?auto_2696 )
      ( MAKE-1CRATE ?auto_2696 ?auto_2697 )
      ( MAKE-7CRATE-VERIFY ?auto_2690 ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2694 ?auto_2695 ?auto_2696 ?auto_2697 ) )
  )

)

