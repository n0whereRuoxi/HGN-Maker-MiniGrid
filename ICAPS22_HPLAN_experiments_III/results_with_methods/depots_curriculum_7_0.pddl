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
      ?auto_2521 - SURFACE
      ?auto_2522 - SURFACE
    )
    :vars
    (
      ?auto_2523 - HOIST
      ?auto_2524 - PLACE
      ?auto_2526 - PLACE
      ?auto_2527 - HOIST
      ?auto_2528 - SURFACE
      ?auto_2525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2523 ?auto_2524 ) ( SURFACE-AT ?auto_2521 ?auto_2524 ) ( CLEAR ?auto_2521 ) ( IS-CRATE ?auto_2522 ) ( AVAILABLE ?auto_2523 ) ( not ( = ?auto_2526 ?auto_2524 ) ) ( HOIST-AT ?auto_2527 ?auto_2526 ) ( AVAILABLE ?auto_2527 ) ( SURFACE-AT ?auto_2522 ?auto_2526 ) ( ON ?auto_2522 ?auto_2528 ) ( CLEAR ?auto_2522 ) ( TRUCK-AT ?auto_2525 ?auto_2524 ) ( not ( = ?auto_2521 ?auto_2522 ) ) ( not ( = ?auto_2521 ?auto_2528 ) ) ( not ( = ?auto_2522 ?auto_2528 ) ) ( not ( = ?auto_2523 ?auto_2527 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2525 ?auto_2524 ?auto_2526 )
      ( !LIFT ?auto_2527 ?auto_2522 ?auto_2528 ?auto_2526 )
      ( !LOAD ?auto_2527 ?auto_2522 ?auto_2525 ?auto_2526 )
      ( !DRIVE ?auto_2525 ?auto_2526 ?auto_2524 )
      ( !UNLOAD ?auto_2523 ?auto_2522 ?auto_2525 ?auto_2524 )
      ( !DROP ?auto_2523 ?auto_2522 ?auto_2521 ?auto_2524 )
      ( MAKE-1CRATE-VERIFY ?auto_2521 ?auto_2522 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2531 - SURFACE
      ?auto_2532 - SURFACE
    )
    :vars
    (
      ?auto_2533 - HOIST
      ?auto_2534 - PLACE
      ?auto_2536 - PLACE
      ?auto_2537 - HOIST
      ?auto_2538 - SURFACE
      ?auto_2535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533 ?auto_2534 ) ( SURFACE-AT ?auto_2531 ?auto_2534 ) ( CLEAR ?auto_2531 ) ( IS-CRATE ?auto_2532 ) ( AVAILABLE ?auto_2533 ) ( not ( = ?auto_2536 ?auto_2534 ) ) ( HOIST-AT ?auto_2537 ?auto_2536 ) ( AVAILABLE ?auto_2537 ) ( SURFACE-AT ?auto_2532 ?auto_2536 ) ( ON ?auto_2532 ?auto_2538 ) ( CLEAR ?auto_2532 ) ( TRUCK-AT ?auto_2535 ?auto_2534 ) ( not ( = ?auto_2531 ?auto_2532 ) ) ( not ( = ?auto_2531 ?auto_2538 ) ) ( not ( = ?auto_2532 ?auto_2538 ) ) ( not ( = ?auto_2533 ?auto_2537 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2535 ?auto_2534 ?auto_2536 )
      ( !LIFT ?auto_2537 ?auto_2532 ?auto_2538 ?auto_2536 )
      ( !LOAD ?auto_2537 ?auto_2532 ?auto_2535 ?auto_2536 )
      ( !DRIVE ?auto_2535 ?auto_2536 ?auto_2534 )
      ( !UNLOAD ?auto_2533 ?auto_2532 ?auto_2535 ?auto_2534 )
      ( !DROP ?auto_2533 ?auto_2532 ?auto_2531 ?auto_2534 )
      ( MAKE-1CRATE-VERIFY ?auto_2531 ?auto_2532 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2542 - SURFACE
      ?auto_2543 - SURFACE
      ?auto_2544 - SURFACE
    )
    :vars
    (
      ?auto_2547 - HOIST
      ?auto_2550 - PLACE
      ?auto_2546 - PLACE
      ?auto_2545 - HOIST
      ?auto_2549 - SURFACE
      ?auto_2552 - PLACE
      ?auto_2551 - HOIST
      ?auto_2553 - SURFACE
      ?auto_2548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2547 ?auto_2550 ) ( IS-CRATE ?auto_2544 ) ( not ( = ?auto_2546 ?auto_2550 ) ) ( HOIST-AT ?auto_2545 ?auto_2546 ) ( AVAILABLE ?auto_2545 ) ( SURFACE-AT ?auto_2544 ?auto_2546 ) ( ON ?auto_2544 ?auto_2549 ) ( CLEAR ?auto_2544 ) ( not ( = ?auto_2543 ?auto_2544 ) ) ( not ( = ?auto_2543 ?auto_2549 ) ) ( not ( = ?auto_2544 ?auto_2549 ) ) ( not ( = ?auto_2547 ?auto_2545 ) ) ( SURFACE-AT ?auto_2542 ?auto_2550 ) ( CLEAR ?auto_2542 ) ( IS-CRATE ?auto_2543 ) ( AVAILABLE ?auto_2547 ) ( not ( = ?auto_2552 ?auto_2550 ) ) ( HOIST-AT ?auto_2551 ?auto_2552 ) ( AVAILABLE ?auto_2551 ) ( SURFACE-AT ?auto_2543 ?auto_2552 ) ( ON ?auto_2543 ?auto_2553 ) ( CLEAR ?auto_2543 ) ( TRUCK-AT ?auto_2548 ?auto_2550 ) ( not ( = ?auto_2542 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2553 ) ) ( not ( = ?auto_2543 ?auto_2553 ) ) ( not ( = ?auto_2547 ?auto_2551 ) ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( not ( = ?auto_2542 ?auto_2549 ) ) ( not ( = ?auto_2544 ?auto_2553 ) ) ( not ( = ?auto_2546 ?auto_2552 ) ) ( not ( = ?auto_2545 ?auto_2551 ) ) ( not ( = ?auto_2549 ?auto_2553 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2542 ?auto_2543 )
      ( MAKE-1CRATE ?auto_2543 ?auto_2544 )
      ( MAKE-2CRATE-VERIFY ?auto_2542 ?auto_2543 ?auto_2544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2556 - SURFACE
      ?auto_2557 - SURFACE
    )
    :vars
    (
      ?auto_2558 - HOIST
      ?auto_2559 - PLACE
      ?auto_2561 - PLACE
      ?auto_2562 - HOIST
      ?auto_2563 - SURFACE
      ?auto_2560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2558 ?auto_2559 ) ( SURFACE-AT ?auto_2556 ?auto_2559 ) ( CLEAR ?auto_2556 ) ( IS-CRATE ?auto_2557 ) ( AVAILABLE ?auto_2558 ) ( not ( = ?auto_2561 ?auto_2559 ) ) ( HOIST-AT ?auto_2562 ?auto_2561 ) ( AVAILABLE ?auto_2562 ) ( SURFACE-AT ?auto_2557 ?auto_2561 ) ( ON ?auto_2557 ?auto_2563 ) ( CLEAR ?auto_2557 ) ( TRUCK-AT ?auto_2560 ?auto_2559 ) ( not ( = ?auto_2556 ?auto_2557 ) ) ( not ( = ?auto_2556 ?auto_2563 ) ) ( not ( = ?auto_2557 ?auto_2563 ) ) ( not ( = ?auto_2558 ?auto_2562 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2560 ?auto_2559 ?auto_2561 )
      ( !LIFT ?auto_2562 ?auto_2557 ?auto_2563 ?auto_2561 )
      ( !LOAD ?auto_2562 ?auto_2557 ?auto_2560 ?auto_2561 )
      ( !DRIVE ?auto_2560 ?auto_2561 ?auto_2559 )
      ( !UNLOAD ?auto_2558 ?auto_2557 ?auto_2560 ?auto_2559 )
      ( !DROP ?auto_2558 ?auto_2557 ?auto_2556 ?auto_2559 )
      ( MAKE-1CRATE-VERIFY ?auto_2556 ?auto_2557 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2568 - SURFACE
      ?auto_2569 - SURFACE
      ?auto_2570 - SURFACE
      ?auto_2571 - SURFACE
    )
    :vars
    (
      ?auto_2577 - HOIST
      ?auto_2575 - PLACE
      ?auto_2572 - PLACE
      ?auto_2574 - HOIST
      ?auto_2573 - SURFACE
      ?auto_2579 - PLACE
      ?auto_2580 - HOIST
      ?auto_2581 - SURFACE
      ?auto_2578 - SURFACE
      ?auto_2576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2577 ?auto_2575 ) ( IS-CRATE ?auto_2571 ) ( not ( = ?auto_2572 ?auto_2575 ) ) ( HOIST-AT ?auto_2574 ?auto_2572 ) ( SURFACE-AT ?auto_2571 ?auto_2572 ) ( ON ?auto_2571 ?auto_2573 ) ( CLEAR ?auto_2571 ) ( not ( = ?auto_2570 ?auto_2571 ) ) ( not ( = ?auto_2570 ?auto_2573 ) ) ( not ( = ?auto_2571 ?auto_2573 ) ) ( not ( = ?auto_2577 ?auto_2574 ) ) ( IS-CRATE ?auto_2570 ) ( not ( = ?auto_2579 ?auto_2575 ) ) ( HOIST-AT ?auto_2580 ?auto_2579 ) ( AVAILABLE ?auto_2580 ) ( SURFACE-AT ?auto_2570 ?auto_2579 ) ( ON ?auto_2570 ?auto_2581 ) ( CLEAR ?auto_2570 ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( not ( = ?auto_2569 ?auto_2581 ) ) ( not ( = ?auto_2570 ?auto_2581 ) ) ( not ( = ?auto_2577 ?auto_2580 ) ) ( SURFACE-AT ?auto_2568 ?auto_2575 ) ( CLEAR ?auto_2568 ) ( IS-CRATE ?auto_2569 ) ( AVAILABLE ?auto_2577 ) ( AVAILABLE ?auto_2574 ) ( SURFACE-AT ?auto_2569 ?auto_2572 ) ( ON ?auto_2569 ?auto_2578 ) ( CLEAR ?auto_2569 ) ( TRUCK-AT ?auto_2576 ?auto_2575 ) ( not ( = ?auto_2568 ?auto_2569 ) ) ( not ( = ?auto_2568 ?auto_2578 ) ) ( not ( = ?auto_2569 ?auto_2578 ) ) ( not ( = ?auto_2568 ?auto_2570 ) ) ( not ( = ?auto_2568 ?auto_2581 ) ) ( not ( = ?auto_2570 ?auto_2578 ) ) ( not ( = ?auto_2579 ?auto_2572 ) ) ( not ( = ?auto_2580 ?auto_2574 ) ) ( not ( = ?auto_2581 ?auto_2578 ) ) ( not ( = ?auto_2568 ?auto_2571 ) ) ( not ( = ?auto_2568 ?auto_2573 ) ) ( not ( = ?auto_2569 ?auto_2571 ) ) ( not ( = ?auto_2569 ?auto_2573 ) ) ( not ( = ?auto_2571 ?auto_2581 ) ) ( not ( = ?auto_2571 ?auto_2578 ) ) ( not ( = ?auto_2573 ?auto_2581 ) ) ( not ( = ?auto_2573 ?auto_2578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2568 ?auto_2569 ?auto_2570 )
      ( MAKE-1CRATE ?auto_2570 ?auto_2571 )
      ( MAKE-3CRATE-VERIFY ?auto_2568 ?auto_2569 ?auto_2570 ?auto_2571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2584 - SURFACE
      ?auto_2585 - SURFACE
    )
    :vars
    (
      ?auto_2586 - HOIST
      ?auto_2587 - PLACE
      ?auto_2589 - PLACE
      ?auto_2590 - HOIST
      ?auto_2591 - SURFACE
      ?auto_2588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2586 ?auto_2587 ) ( SURFACE-AT ?auto_2584 ?auto_2587 ) ( CLEAR ?auto_2584 ) ( IS-CRATE ?auto_2585 ) ( AVAILABLE ?auto_2586 ) ( not ( = ?auto_2589 ?auto_2587 ) ) ( HOIST-AT ?auto_2590 ?auto_2589 ) ( AVAILABLE ?auto_2590 ) ( SURFACE-AT ?auto_2585 ?auto_2589 ) ( ON ?auto_2585 ?auto_2591 ) ( CLEAR ?auto_2585 ) ( TRUCK-AT ?auto_2588 ?auto_2587 ) ( not ( = ?auto_2584 ?auto_2585 ) ) ( not ( = ?auto_2584 ?auto_2591 ) ) ( not ( = ?auto_2585 ?auto_2591 ) ) ( not ( = ?auto_2586 ?auto_2590 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2588 ?auto_2587 ?auto_2589 )
      ( !LIFT ?auto_2590 ?auto_2585 ?auto_2591 ?auto_2589 )
      ( !LOAD ?auto_2590 ?auto_2585 ?auto_2588 ?auto_2589 )
      ( !DRIVE ?auto_2588 ?auto_2589 ?auto_2587 )
      ( !UNLOAD ?auto_2586 ?auto_2585 ?auto_2588 ?auto_2587 )
      ( !DROP ?auto_2586 ?auto_2585 ?auto_2584 ?auto_2587 )
      ( MAKE-1CRATE-VERIFY ?auto_2584 ?auto_2585 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2597 - SURFACE
      ?auto_2598 - SURFACE
      ?auto_2599 - SURFACE
      ?auto_2600 - SURFACE
      ?auto_2601 - SURFACE
    )
    :vars
    (
      ?auto_2606 - HOIST
      ?auto_2605 - PLACE
      ?auto_2604 - PLACE
      ?auto_2603 - HOIST
      ?auto_2607 - SURFACE
      ?auto_2612 - PLACE
      ?auto_2611 - HOIST
      ?auto_2609 - SURFACE
      ?auto_2608 - PLACE
      ?auto_2613 - HOIST
      ?auto_2614 - SURFACE
      ?auto_2610 - SURFACE
      ?auto_2602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2606 ?auto_2605 ) ( IS-CRATE ?auto_2601 ) ( not ( = ?auto_2604 ?auto_2605 ) ) ( HOIST-AT ?auto_2603 ?auto_2604 ) ( AVAILABLE ?auto_2603 ) ( SURFACE-AT ?auto_2601 ?auto_2604 ) ( ON ?auto_2601 ?auto_2607 ) ( CLEAR ?auto_2601 ) ( not ( = ?auto_2600 ?auto_2601 ) ) ( not ( = ?auto_2600 ?auto_2607 ) ) ( not ( = ?auto_2601 ?auto_2607 ) ) ( not ( = ?auto_2606 ?auto_2603 ) ) ( IS-CRATE ?auto_2600 ) ( not ( = ?auto_2612 ?auto_2605 ) ) ( HOIST-AT ?auto_2611 ?auto_2612 ) ( SURFACE-AT ?auto_2600 ?auto_2612 ) ( ON ?auto_2600 ?auto_2609 ) ( CLEAR ?auto_2600 ) ( not ( = ?auto_2599 ?auto_2600 ) ) ( not ( = ?auto_2599 ?auto_2609 ) ) ( not ( = ?auto_2600 ?auto_2609 ) ) ( not ( = ?auto_2606 ?auto_2611 ) ) ( IS-CRATE ?auto_2599 ) ( not ( = ?auto_2608 ?auto_2605 ) ) ( HOIST-AT ?auto_2613 ?auto_2608 ) ( AVAILABLE ?auto_2613 ) ( SURFACE-AT ?auto_2599 ?auto_2608 ) ( ON ?auto_2599 ?auto_2614 ) ( CLEAR ?auto_2599 ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( not ( = ?auto_2598 ?auto_2614 ) ) ( not ( = ?auto_2599 ?auto_2614 ) ) ( not ( = ?auto_2606 ?auto_2613 ) ) ( SURFACE-AT ?auto_2597 ?auto_2605 ) ( CLEAR ?auto_2597 ) ( IS-CRATE ?auto_2598 ) ( AVAILABLE ?auto_2606 ) ( AVAILABLE ?auto_2611 ) ( SURFACE-AT ?auto_2598 ?auto_2612 ) ( ON ?auto_2598 ?auto_2610 ) ( CLEAR ?auto_2598 ) ( TRUCK-AT ?auto_2602 ?auto_2605 ) ( not ( = ?auto_2597 ?auto_2598 ) ) ( not ( = ?auto_2597 ?auto_2610 ) ) ( not ( = ?auto_2598 ?auto_2610 ) ) ( not ( = ?auto_2597 ?auto_2599 ) ) ( not ( = ?auto_2597 ?auto_2614 ) ) ( not ( = ?auto_2599 ?auto_2610 ) ) ( not ( = ?auto_2608 ?auto_2612 ) ) ( not ( = ?auto_2613 ?auto_2611 ) ) ( not ( = ?auto_2614 ?auto_2610 ) ) ( not ( = ?auto_2597 ?auto_2600 ) ) ( not ( = ?auto_2597 ?auto_2609 ) ) ( not ( = ?auto_2598 ?auto_2600 ) ) ( not ( = ?auto_2598 ?auto_2609 ) ) ( not ( = ?auto_2600 ?auto_2614 ) ) ( not ( = ?auto_2600 ?auto_2610 ) ) ( not ( = ?auto_2609 ?auto_2614 ) ) ( not ( = ?auto_2609 ?auto_2610 ) ) ( not ( = ?auto_2597 ?auto_2601 ) ) ( not ( = ?auto_2597 ?auto_2607 ) ) ( not ( = ?auto_2598 ?auto_2601 ) ) ( not ( = ?auto_2598 ?auto_2607 ) ) ( not ( = ?auto_2599 ?auto_2601 ) ) ( not ( = ?auto_2599 ?auto_2607 ) ) ( not ( = ?auto_2601 ?auto_2609 ) ) ( not ( = ?auto_2601 ?auto_2614 ) ) ( not ( = ?auto_2601 ?auto_2610 ) ) ( not ( = ?auto_2604 ?auto_2612 ) ) ( not ( = ?auto_2604 ?auto_2608 ) ) ( not ( = ?auto_2603 ?auto_2611 ) ) ( not ( = ?auto_2603 ?auto_2613 ) ) ( not ( = ?auto_2607 ?auto_2609 ) ) ( not ( = ?auto_2607 ?auto_2614 ) ) ( not ( = ?auto_2607 ?auto_2610 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2600 )
      ( MAKE-1CRATE ?auto_2600 ?auto_2601 )
      ( MAKE-4CRATE-VERIFY ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2600 ?auto_2601 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2617 - SURFACE
      ?auto_2618 - SURFACE
    )
    :vars
    (
      ?auto_2619 - HOIST
      ?auto_2620 - PLACE
      ?auto_2622 - PLACE
      ?auto_2623 - HOIST
      ?auto_2624 - SURFACE
      ?auto_2621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2619 ?auto_2620 ) ( SURFACE-AT ?auto_2617 ?auto_2620 ) ( CLEAR ?auto_2617 ) ( IS-CRATE ?auto_2618 ) ( AVAILABLE ?auto_2619 ) ( not ( = ?auto_2622 ?auto_2620 ) ) ( HOIST-AT ?auto_2623 ?auto_2622 ) ( AVAILABLE ?auto_2623 ) ( SURFACE-AT ?auto_2618 ?auto_2622 ) ( ON ?auto_2618 ?auto_2624 ) ( CLEAR ?auto_2618 ) ( TRUCK-AT ?auto_2621 ?auto_2620 ) ( not ( = ?auto_2617 ?auto_2618 ) ) ( not ( = ?auto_2617 ?auto_2624 ) ) ( not ( = ?auto_2618 ?auto_2624 ) ) ( not ( = ?auto_2619 ?auto_2623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2621 ?auto_2620 ?auto_2622 )
      ( !LIFT ?auto_2623 ?auto_2618 ?auto_2624 ?auto_2622 )
      ( !LOAD ?auto_2623 ?auto_2618 ?auto_2621 ?auto_2622 )
      ( !DRIVE ?auto_2621 ?auto_2622 ?auto_2620 )
      ( !UNLOAD ?auto_2619 ?auto_2618 ?auto_2621 ?auto_2620 )
      ( !DROP ?auto_2619 ?auto_2618 ?auto_2617 ?auto_2620 )
      ( MAKE-1CRATE-VERIFY ?auto_2617 ?auto_2618 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2631 - SURFACE
      ?auto_2632 - SURFACE
      ?auto_2633 - SURFACE
      ?auto_2634 - SURFACE
      ?auto_2635 - SURFACE
      ?auto_2636 - SURFACE
    )
    :vars
    (
      ?auto_2641 - HOIST
      ?auto_2642 - PLACE
      ?auto_2640 - PLACE
      ?auto_2638 - HOIST
      ?auto_2639 - SURFACE
      ?auto_2652 - PLACE
      ?auto_2650 - HOIST
      ?auto_2643 - SURFACE
      ?auto_2645 - PLACE
      ?auto_2644 - HOIST
      ?auto_2651 - SURFACE
      ?auto_2647 - PLACE
      ?auto_2646 - HOIST
      ?auto_2649 - SURFACE
      ?auto_2648 - SURFACE
      ?auto_2637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2641 ?auto_2642 ) ( IS-CRATE ?auto_2636 ) ( not ( = ?auto_2640 ?auto_2642 ) ) ( HOIST-AT ?auto_2638 ?auto_2640 ) ( AVAILABLE ?auto_2638 ) ( SURFACE-AT ?auto_2636 ?auto_2640 ) ( ON ?auto_2636 ?auto_2639 ) ( CLEAR ?auto_2636 ) ( not ( = ?auto_2635 ?auto_2636 ) ) ( not ( = ?auto_2635 ?auto_2639 ) ) ( not ( = ?auto_2636 ?auto_2639 ) ) ( not ( = ?auto_2641 ?auto_2638 ) ) ( IS-CRATE ?auto_2635 ) ( not ( = ?auto_2652 ?auto_2642 ) ) ( HOIST-AT ?auto_2650 ?auto_2652 ) ( AVAILABLE ?auto_2650 ) ( SURFACE-AT ?auto_2635 ?auto_2652 ) ( ON ?auto_2635 ?auto_2643 ) ( CLEAR ?auto_2635 ) ( not ( = ?auto_2634 ?auto_2635 ) ) ( not ( = ?auto_2634 ?auto_2643 ) ) ( not ( = ?auto_2635 ?auto_2643 ) ) ( not ( = ?auto_2641 ?auto_2650 ) ) ( IS-CRATE ?auto_2634 ) ( not ( = ?auto_2645 ?auto_2642 ) ) ( HOIST-AT ?auto_2644 ?auto_2645 ) ( SURFACE-AT ?auto_2634 ?auto_2645 ) ( ON ?auto_2634 ?auto_2651 ) ( CLEAR ?auto_2634 ) ( not ( = ?auto_2633 ?auto_2634 ) ) ( not ( = ?auto_2633 ?auto_2651 ) ) ( not ( = ?auto_2634 ?auto_2651 ) ) ( not ( = ?auto_2641 ?auto_2644 ) ) ( IS-CRATE ?auto_2633 ) ( not ( = ?auto_2647 ?auto_2642 ) ) ( HOIST-AT ?auto_2646 ?auto_2647 ) ( AVAILABLE ?auto_2646 ) ( SURFACE-AT ?auto_2633 ?auto_2647 ) ( ON ?auto_2633 ?auto_2649 ) ( CLEAR ?auto_2633 ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( not ( = ?auto_2632 ?auto_2649 ) ) ( not ( = ?auto_2633 ?auto_2649 ) ) ( not ( = ?auto_2641 ?auto_2646 ) ) ( SURFACE-AT ?auto_2631 ?auto_2642 ) ( CLEAR ?auto_2631 ) ( IS-CRATE ?auto_2632 ) ( AVAILABLE ?auto_2641 ) ( AVAILABLE ?auto_2644 ) ( SURFACE-AT ?auto_2632 ?auto_2645 ) ( ON ?auto_2632 ?auto_2648 ) ( CLEAR ?auto_2632 ) ( TRUCK-AT ?auto_2637 ?auto_2642 ) ( not ( = ?auto_2631 ?auto_2632 ) ) ( not ( = ?auto_2631 ?auto_2648 ) ) ( not ( = ?auto_2632 ?auto_2648 ) ) ( not ( = ?auto_2631 ?auto_2633 ) ) ( not ( = ?auto_2631 ?auto_2649 ) ) ( not ( = ?auto_2633 ?auto_2648 ) ) ( not ( = ?auto_2647 ?auto_2645 ) ) ( not ( = ?auto_2646 ?auto_2644 ) ) ( not ( = ?auto_2649 ?auto_2648 ) ) ( not ( = ?auto_2631 ?auto_2634 ) ) ( not ( = ?auto_2631 ?auto_2651 ) ) ( not ( = ?auto_2632 ?auto_2634 ) ) ( not ( = ?auto_2632 ?auto_2651 ) ) ( not ( = ?auto_2634 ?auto_2649 ) ) ( not ( = ?auto_2634 ?auto_2648 ) ) ( not ( = ?auto_2651 ?auto_2649 ) ) ( not ( = ?auto_2651 ?auto_2648 ) ) ( not ( = ?auto_2631 ?auto_2635 ) ) ( not ( = ?auto_2631 ?auto_2643 ) ) ( not ( = ?auto_2632 ?auto_2635 ) ) ( not ( = ?auto_2632 ?auto_2643 ) ) ( not ( = ?auto_2633 ?auto_2635 ) ) ( not ( = ?auto_2633 ?auto_2643 ) ) ( not ( = ?auto_2635 ?auto_2651 ) ) ( not ( = ?auto_2635 ?auto_2649 ) ) ( not ( = ?auto_2635 ?auto_2648 ) ) ( not ( = ?auto_2652 ?auto_2645 ) ) ( not ( = ?auto_2652 ?auto_2647 ) ) ( not ( = ?auto_2650 ?auto_2644 ) ) ( not ( = ?auto_2650 ?auto_2646 ) ) ( not ( = ?auto_2643 ?auto_2651 ) ) ( not ( = ?auto_2643 ?auto_2649 ) ) ( not ( = ?auto_2643 ?auto_2648 ) ) ( not ( = ?auto_2631 ?auto_2636 ) ) ( not ( = ?auto_2631 ?auto_2639 ) ) ( not ( = ?auto_2632 ?auto_2636 ) ) ( not ( = ?auto_2632 ?auto_2639 ) ) ( not ( = ?auto_2633 ?auto_2636 ) ) ( not ( = ?auto_2633 ?auto_2639 ) ) ( not ( = ?auto_2634 ?auto_2636 ) ) ( not ( = ?auto_2634 ?auto_2639 ) ) ( not ( = ?auto_2636 ?auto_2643 ) ) ( not ( = ?auto_2636 ?auto_2651 ) ) ( not ( = ?auto_2636 ?auto_2649 ) ) ( not ( = ?auto_2636 ?auto_2648 ) ) ( not ( = ?auto_2640 ?auto_2652 ) ) ( not ( = ?auto_2640 ?auto_2645 ) ) ( not ( = ?auto_2640 ?auto_2647 ) ) ( not ( = ?auto_2638 ?auto_2650 ) ) ( not ( = ?auto_2638 ?auto_2644 ) ) ( not ( = ?auto_2638 ?auto_2646 ) ) ( not ( = ?auto_2639 ?auto_2643 ) ) ( not ( = ?auto_2639 ?auto_2651 ) ) ( not ( = ?auto_2639 ?auto_2649 ) ) ( not ( = ?auto_2639 ?auto_2648 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2631 ?auto_2632 ?auto_2633 ?auto_2634 ?auto_2635 )
      ( MAKE-1CRATE ?auto_2635 ?auto_2636 )
      ( MAKE-5CRATE-VERIFY ?auto_2631 ?auto_2632 ?auto_2633 ?auto_2634 ?auto_2635 ?auto_2636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655 - SURFACE
      ?auto_2656 - SURFACE
    )
    :vars
    (
      ?auto_2657 - HOIST
      ?auto_2658 - PLACE
      ?auto_2660 - PLACE
      ?auto_2661 - HOIST
      ?auto_2662 - SURFACE
      ?auto_2659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2657 ?auto_2658 ) ( SURFACE-AT ?auto_2655 ?auto_2658 ) ( CLEAR ?auto_2655 ) ( IS-CRATE ?auto_2656 ) ( AVAILABLE ?auto_2657 ) ( not ( = ?auto_2660 ?auto_2658 ) ) ( HOIST-AT ?auto_2661 ?auto_2660 ) ( AVAILABLE ?auto_2661 ) ( SURFACE-AT ?auto_2656 ?auto_2660 ) ( ON ?auto_2656 ?auto_2662 ) ( CLEAR ?auto_2656 ) ( TRUCK-AT ?auto_2659 ?auto_2658 ) ( not ( = ?auto_2655 ?auto_2656 ) ) ( not ( = ?auto_2655 ?auto_2662 ) ) ( not ( = ?auto_2656 ?auto_2662 ) ) ( not ( = ?auto_2657 ?auto_2661 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2659 ?auto_2658 ?auto_2660 )
      ( !LIFT ?auto_2661 ?auto_2656 ?auto_2662 ?auto_2660 )
      ( !LOAD ?auto_2661 ?auto_2656 ?auto_2659 ?auto_2660 )
      ( !DRIVE ?auto_2659 ?auto_2660 ?auto_2658 )
      ( !UNLOAD ?auto_2657 ?auto_2656 ?auto_2659 ?auto_2658 )
      ( !DROP ?auto_2657 ?auto_2656 ?auto_2655 ?auto_2658 )
      ( MAKE-1CRATE-VERIFY ?auto_2655 ?auto_2656 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2670 - SURFACE
      ?auto_2671 - SURFACE
      ?auto_2672 - SURFACE
      ?auto_2673 - SURFACE
      ?auto_2674 - SURFACE
      ?auto_2675 - SURFACE
      ?auto_2676 - SURFACE
    )
    :vars
    (
      ?auto_2681 - HOIST
      ?auto_2680 - PLACE
      ?auto_2678 - PLACE
      ?auto_2677 - HOIST
      ?auto_2682 - SURFACE
      ?auto_2687 - PLACE
      ?auto_2690 - HOIST
      ?auto_2686 - SURFACE
      ?auto_2688 - PLACE
      ?auto_2691 - HOIST
      ?auto_2684 - SURFACE
      ?auto_2692 - PLACE
      ?auto_2683 - HOIST
      ?auto_2685 - SURFACE
      ?auto_2694 - PLACE
      ?auto_2689 - HOIST
      ?auto_2693 - SURFACE
      ?auto_2695 - SURFACE
      ?auto_2679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2681 ?auto_2680 ) ( IS-CRATE ?auto_2676 ) ( not ( = ?auto_2678 ?auto_2680 ) ) ( HOIST-AT ?auto_2677 ?auto_2678 ) ( AVAILABLE ?auto_2677 ) ( SURFACE-AT ?auto_2676 ?auto_2678 ) ( ON ?auto_2676 ?auto_2682 ) ( CLEAR ?auto_2676 ) ( not ( = ?auto_2675 ?auto_2676 ) ) ( not ( = ?auto_2675 ?auto_2682 ) ) ( not ( = ?auto_2676 ?auto_2682 ) ) ( not ( = ?auto_2681 ?auto_2677 ) ) ( IS-CRATE ?auto_2675 ) ( not ( = ?auto_2687 ?auto_2680 ) ) ( HOIST-AT ?auto_2690 ?auto_2687 ) ( AVAILABLE ?auto_2690 ) ( SURFACE-AT ?auto_2675 ?auto_2687 ) ( ON ?auto_2675 ?auto_2686 ) ( CLEAR ?auto_2675 ) ( not ( = ?auto_2674 ?auto_2675 ) ) ( not ( = ?auto_2674 ?auto_2686 ) ) ( not ( = ?auto_2675 ?auto_2686 ) ) ( not ( = ?auto_2681 ?auto_2690 ) ) ( IS-CRATE ?auto_2674 ) ( not ( = ?auto_2688 ?auto_2680 ) ) ( HOIST-AT ?auto_2691 ?auto_2688 ) ( AVAILABLE ?auto_2691 ) ( SURFACE-AT ?auto_2674 ?auto_2688 ) ( ON ?auto_2674 ?auto_2684 ) ( CLEAR ?auto_2674 ) ( not ( = ?auto_2673 ?auto_2674 ) ) ( not ( = ?auto_2673 ?auto_2684 ) ) ( not ( = ?auto_2674 ?auto_2684 ) ) ( not ( = ?auto_2681 ?auto_2691 ) ) ( IS-CRATE ?auto_2673 ) ( not ( = ?auto_2692 ?auto_2680 ) ) ( HOIST-AT ?auto_2683 ?auto_2692 ) ( SURFACE-AT ?auto_2673 ?auto_2692 ) ( ON ?auto_2673 ?auto_2685 ) ( CLEAR ?auto_2673 ) ( not ( = ?auto_2672 ?auto_2673 ) ) ( not ( = ?auto_2672 ?auto_2685 ) ) ( not ( = ?auto_2673 ?auto_2685 ) ) ( not ( = ?auto_2681 ?auto_2683 ) ) ( IS-CRATE ?auto_2672 ) ( not ( = ?auto_2694 ?auto_2680 ) ) ( HOIST-AT ?auto_2689 ?auto_2694 ) ( AVAILABLE ?auto_2689 ) ( SURFACE-AT ?auto_2672 ?auto_2694 ) ( ON ?auto_2672 ?auto_2693 ) ( CLEAR ?auto_2672 ) ( not ( = ?auto_2671 ?auto_2672 ) ) ( not ( = ?auto_2671 ?auto_2693 ) ) ( not ( = ?auto_2672 ?auto_2693 ) ) ( not ( = ?auto_2681 ?auto_2689 ) ) ( SURFACE-AT ?auto_2670 ?auto_2680 ) ( CLEAR ?auto_2670 ) ( IS-CRATE ?auto_2671 ) ( AVAILABLE ?auto_2681 ) ( AVAILABLE ?auto_2683 ) ( SURFACE-AT ?auto_2671 ?auto_2692 ) ( ON ?auto_2671 ?auto_2695 ) ( CLEAR ?auto_2671 ) ( TRUCK-AT ?auto_2679 ?auto_2680 ) ( not ( = ?auto_2670 ?auto_2671 ) ) ( not ( = ?auto_2670 ?auto_2695 ) ) ( not ( = ?auto_2671 ?auto_2695 ) ) ( not ( = ?auto_2670 ?auto_2672 ) ) ( not ( = ?auto_2670 ?auto_2693 ) ) ( not ( = ?auto_2672 ?auto_2695 ) ) ( not ( = ?auto_2694 ?auto_2692 ) ) ( not ( = ?auto_2689 ?auto_2683 ) ) ( not ( = ?auto_2693 ?auto_2695 ) ) ( not ( = ?auto_2670 ?auto_2673 ) ) ( not ( = ?auto_2670 ?auto_2685 ) ) ( not ( = ?auto_2671 ?auto_2673 ) ) ( not ( = ?auto_2671 ?auto_2685 ) ) ( not ( = ?auto_2673 ?auto_2693 ) ) ( not ( = ?auto_2673 ?auto_2695 ) ) ( not ( = ?auto_2685 ?auto_2693 ) ) ( not ( = ?auto_2685 ?auto_2695 ) ) ( not ( = ?auto_2670 ?auto_2674 ) ) ( not ( = ?auto_2670 ?auto_2684 ) ) ( not ( = ?auto_2671 ?auto_2674 ) ) ( not ( = ?auto_2671 ?auto_2684 ) ) ( not ( = ?auto_2672 ?auto_2674 ) ) ( not ( = ?auto_2672 ?auto_2684 ) ) ( not ( = ?auto_2674 ?auto_2685 ) ) ( not ( = ?auto_2674 ?auto_2693 ) ) ( not ( = ?auto_2674 ?auto_2695 ) ) ( not ( = ?auto_2688 ?auto_2692 ) ) ( not ( = ?auto_2688 ?auto_2694 ) ) ( not ( = ?auto_2691 ?auto_2683 ) ) ( not ( = ?auto_2691 ?auto_2689 ) ) ( not ( = ?auto_2684 ?auto_2685 ) ) ( not ( = ?auto_2684 ?auto_2693 ) ) ( not ( = ?auto_2684 ?auto_2695 ) ) ( not ( = ?auto_2670 ?auto_2675 ) ) ( not ( = ?auto_2670 ?auto_2686 ) ) ( not ( = ?auto_2671 ?auto_2675 ) ) ( not ( = ?auto_2671 ?auto_2686 ) ) ( not ( = ?auto_2672 ?auto_2675 ) ) ( not ( = ?auto_2672 ?auto_2686 ) ) ( not ( = ?auto_2673 ?auto_2675 ) ) ( not ( = ?auto_2673 ?auto_2686 ) ) ( not ( = ?auto_2675 ?auto_2684 ) ) ( not ( = ?auto_2675 ?auto_2685 ) ) ( not ( = ?auto_2675 ?auto_2693 ) ) ( not ( = ?auto_2675 ?auto_2695 ) ) ( not ( = ?auto_2687 ?auto_2688 ) ) ( not ( = ?auto_2687 ?auto_2692 ) ) ( not ( = ?auto_2687 ?auto_2694 ) ) ( not ( = ?auto_2690 ?auto_2691 ) ) ( not ( = ?auto_2690 ?auto_2683 ) ) ( not ( = ?auto_2690 ?auto_2689 ) ) ( not ( = ?auto_2686 ?auto_2684 ) ) ( not ( = ?auto_2686 ?auto_2685 ) ) ( not ( = ?auto_2686 ?auto_2693 ) ) ( not ( = ?auto_2686 ?auto_2695 ) ) ( not ( = ?auto_2670 ?auto_2676 ) ) ( not ( = ?auto_2670 ?auto_2682 ) ) ( not ( = ?auto_2671 ?auto_2676 ) ) ( not ( = ?auto_2671 ?auto_2682 ) ) ( not ( = ?auto_2672 ?auto_2676 ) ) ( not ( = ?auto_2672 ?auto_2682 ) ) ( not ( = ?auto_2673 ?auto_2676 ) ) ( not ( = ?auto_2673 ?auto_2682 ) ) ( not ( = ?auto_2674 ?auto_2676 ) ) ( not ( = ?auto_2674 ?auto_2682 ) ) ( not ( = ?auto_2676 ?auto_2686 ) ) ( not ( = ?auto_2676 ?auto_2684 ) ) ( not ( = ?auto_2676 ?auto_2685 ) ) ( not ( = ?auto_2676 ?auto_2693 ) ) ( not ( = ?auto_2676 ?auto_2695 ) ) ( not ( = ?auto_2678 ?auto_2687 ) ) ( not ( = ?auto_2678 ?auto_2688 ) ) ( not ( = ?auto_2678 ?auto_2692 ) ) ( not ( = ?auto_2678 ?auto_2694 ) ) ( not ( = ?auto_2677 ?auto_2690 ) ) ( not ( = ?auto_2677 ?auto_2691 ) ) ( not ( = ?auto_2677 ?auto_2683 ) ) ( not ( = ?auto_2677 ?auto_2689 ) ) ( not ( = ?auto_2682 ?auto_2686 ) ) ( not ( = ?auto_2682 ?auto_2684 ) ) ( not ( = ?auto_2682 ?auto_2685 ) ) ( not ( = ?auto_2682 ?auto_2693 ) ) ( not ( = ?auto_2682 ?auto_2695 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2670 ?auto_2671 ?auto_2672 ?auto_2673 ?auto_2674 ?auto_2675 )
      ( MAKE-1CRATE ?auto_2675 ?auto_2676 )
      ( MAKE-6CRATE-VERIFY ?auto_2670 ?auto_2671 ?auto_2672 ?auto_2673 ?auto_2674 ?auto_2675 ?auto_2676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2698 - SURFACE
      ?auto_2699 - SURFACE
    )
    :vars
    (
      ?auto_2700 - HOIST
      ?auto_2701 - PLACE
      ?auto_2703 - PLACE
      ?auto_2704 - HOIST
      ?auto_2705 - SURFACE
      ?auto_2702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2700 ?auto_2701 ) ( SURFACE-AT ?auto_2698 ?auto_2701 ) ( CLEAR ?auto_2698 ) ( IS-CRATE ?auto_2699 ) ( AVAILABLE ?auto_2700 ) ( not ( = ?auto_2703 ?auto_2701 ) ) ( HOIST-AT ?auto_2704 ?auto_2703 ) ( AVAILABLE ?auto_2704 ) ( SURFACE-AT ?auto_2699 ?auto_2703 ) ( ON ?auto_2699 ?auto_2705 ) ( CLEAR ?auto_2699 ) ( TRUCK-AT ?auto_2702 ?auto_2701 ) ( not ( = ?auto_2698 ?auto_2699 ) ) ( not ( = ?auto_2698 ?auto_2705 ) ) ( not ( = ?auto_2699 ?auto_2705 ) ) ( not ( = ?auto_2700 ?auto_2704 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2702 ?auto_2701 ?auto_2703 )
      ( !LIFT ?auto_2704 ?auto_2699 ?auto_2705 ?auto_2703 )
      ( !LOAD ?auto_2704 ?auto_2699 ?auto_2702 ?auto_2703 )
      ( !DRIVE ?auto_2702 ?auto_2703 ?auto_2701 )
      ( !UNLOAD ?auto_2700 ?auto_2699 ?auto_2702 ?auto_2701 )
      ( !DROP ?auto_2700 ?auto_2699 ?auto_2698 ?auto_2701 )
      ( MAKE-1CRATE-VERIFY ?auto_2698 ?auto_2699 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2714 - SURFACE
      ?auto_2715 - SURFACE
      ?auto_2716 - SURFACE
      ?auto_2717 - SURFACE
      ?auto_2718 - SURFACE
      ?auto_2719 - SURFACE
      ?auto_2721 - SURFACE
      ?auto_2720 - SURFACE
    )
    :vars
    (
      ?auto_2722 - HOIST
      ?auto_2727 - PLACE
      ?auto_2724 - PLACE
      ?auto_2725 - HOIST
      ?auto_2726 - SURFACE
      ?auto_2729 - PLACE
      ?auto_2733 - HOIST
      ?auto_2731 - SURFACE
      ?auto_2737 - PLACE
      ?auto_2734 - HOIST
      ?auto_2738 - SURFACE
      ?auto_2736 - PLACE
      ?auto_2730 - HOIST
      ?auto_2728 - SURFACE
      ?auto_2740 - PLACE
      ?auto_2732 - HOIST
      ?auto_2739 - SURFACE
      ?auto_2741 - PLACE
      ?auto_2735 - HOIST
      ?auto_2742 - SURFACE
      ?auto_2743 - SURFACE
      ?auto_2723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2722 ?auto_2727 ) ( IS-CRATE ?auto_2720 ) ( not ( = ?auto_2724 ?auto_2727 ) ) ( HOIST-AT ?auto_2725 ?auto_2724 ) ( AVAILABLE ?auto_2725 ) ( SURFACE-AT ?auto_2720 ?auto_2724 ) ( ON ?auto_2720 ?auto_2726 ) ( CLEAR ?auto_2720 ) ( not ( = ?auto_2721 ?auto_2720 ) ) ( not ( = ?auto_2721 ?auto_2726 ) ) ( not ( = ?auto_2720 ?auto_2726 ) ) ( not ( = ?auto_2722 ?auto_2725 ) ) ( IS-CRATE ?auto_2721 ) ( not ( = ?auto_2729 ?auto_2727 ) ) ( HOIST-AT ?auto_2733 ?auto_2729 ) ( AVAILABLE ?auto_2733 ) ( SURFACE-AT ?auto_2721 ?auto_2729 ) ( ON ?auto_2721 ?auto_2731 ) ( CLEAR ?auto_2721 ) ( not ( = ?auto_2719 ?auto_2721 ) ) ( not ( = ?auto_2719 ?auto_2731 ) ) ( not ( = ?auto_2721 ?auto_2731 ) ) ( not ( = ?auto_2722 ?auto_2733 ) ) ( IS-CRATE ?auto_2719 ) ( not ( = ?auto_2737 ?auto_2727 ) ) ( HOIST-AT ?auto_2734 ?auto_2737 ) ( AVAILABLE ?auto_2734 ) ( SURFACE-AT ?auto_2719 ?auto_2737 ) ( ON ?auto_2719 ?auto_2738 ) ( CLEAR ?auto_2719 ) ( not ( = ?auto_2718 ?auto_2719 ) ) ( not ( = ?auto_2718 ?auto_2738 ) ) ( not ( = ?auto_2719 ?auto_2738 ) ) ( not ( = ?auto_2722 ?auto_2734 ) ) ( IS-CRATE ?auto_2718 ) ( not ( = ?auto_2736 ?auto_2727 ) ) ( HOIST-AT ?auto_2730 ?auto_2736 ) ( AVAILABLE ?auto_2730 ) ( SURFACE-AT ?auto_2718 ?auto_2736 ) ( ON ?auto_2718 ?auto_2728 ) ( CLEAR ?auto_2718 ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( not ( = ?auto_2717 ?auto_2728 ) ) ( not ( = ?auto_2718 ?auto_2728 ) ) ( not ( = ?auto_2722 ?auto_2730 ) ) ( IS-CRATE ?auto_2717 ) ( not ( = ?auto_2740 ?auto_2727 ) ) ( HOIST-AT ?auto_2732 ?auto_2740 ) ( SURFACE-AT ?auto_2717 ?auto_2740 ) ( ON ?auto_2717 ?auto_2739 ) ( CLEAR ?auto_2717 ) ( not ( = ?auto_2716 ?auto_2717 ) ) ( not ( = ?auto_2716 ?auto_2739 ) ) ( not ( = ?auto_2717 ?auto_2739 ) ) ( not ( = ?auto_2722 ?auto_2732 ) ) ( IS-CRATE ?auto_2716 ) ( not ( = ?auto_2741 ?auto_2727 ) ) ( HOIST-AT ?auto_2735 ?auto_2741 ) ( AVAILABLE ?auto_2735 ) ( SURFACE-AT ?auto_2716 ?auto_2741 ) ( ON ?auto_2716 ?auto_2742 ) ( CLEAR ?auto_2716 ) ( not ( = ?auto_2715 ?auto_2716 ) ) ( not ( = ?auto_2715 ?auto_2742 ) ) ( not ( = ?auto_2716 ?auto_2742 ) ) ( not ( = ?auto_2722 ?auto_2735 ) ) ( SURFACE-AT ?auto_2714 ?auto_2727 ) ( CLEAR ?auto_2714 ) ( IS-CRATE ?auto_2715 ) ( AVAILABLE ?auto_2722 ) ( AVAILABLE ?auto_2732 ) ( SURFACE-AT ?auto_2715 ?auto_2740 ) ( ON ?auto_2715 ?auto_2743 ) ( CLEAR ?auto_2715 ) ( TRUCK-AT ?auto_2723 ?auto_2727 ) ( not ( = ?auto_2714 ?auto_2715 ) ) ( not ( = ?auto_2714 ?auto_2743 ) ) ( not ( = ?auto_2715 ?auto_2743 ) ) ( not ( = ?auto_2714 ?auto_2716 ) ) ( not ( = ?auto_2714 ?auto_2742 ) ) ( not ( = ?auto_2716 ?auto_2743 ) ) ( not ( = ?auto_2741 ?auto_2740 ) ) ( not ( = ?auto_2735 ?auto_2732 ) ) ( not ( = ?auto_2742 ?auto_2743 ) ) ( not ( = ?auto_2714 ?auto_2717 ) ) ( not ( = ?auto_2714 ?auto_2739 ) ) ( not ( = ?auto_2715 ?auto_2717 ) ) ( not ( = ?auto_2715 ?auto_2739 ) ) ( not ( = ?auto_2717 ?auto_2742 ) ) ( not ( = ?auto_2717 ?auto_2743 ) ) ( not ( = ?auto_2739 ?auto_2742 ) ) ( not ( = ?auto_2739 ?auto_2743 ) ) ( not ( = ?auto_2714 ?auto_2718 ) ) ( not ( = ?auto_2714 ?auto_2728 ) ) ( not ( = ?auto_2715 ?auto_2718 ) ) ( not ( = ?auto_2715 ?auto_2728 ) ) ( not ( = ?auto_2716 ?auto_2718 ) ) ( not ( = ?auto_2716 ?auto_2728 ) ) ( not ( = ?auto_2718 ?auto_2739 ) ) ( not ( = ?auto_2718 ?auto_2742 ) ) ( not ( = ?auto_2718 ?auto_2743 ) ) ( not ( = ?auto_2736 ?auto_2740 ) ) ( not ( = ?auto_2736 ?auto_2741 ) ) ( not ( = ?auto_2730 ?auto_2732 ) ) ( not ( = ?auto_2730 ?auto_2735 ) ) ( not ( = ?auto_2728 ?auto_2739 ) ) ( not ( = ?auto_2728 ?auto_2742 ) ) ( not ( = ?auto_2728 ?auto_2743 ) ) ( not ( = ?auto_2714 ?auto_2719 ) ) ( not ( = ?auto_2714 ?auto_2738 ) ) ( not ( = ?auto_2715 ?auto_2719 ) ) ( not ( = ?auto_2715 ?auto_2738 ) ) ( not ( = ?auto_2716 ?auto_2719 ) ) ( not ( = ?auto_2716 ?auto_2738 ) ) ( not ( = ?auto_2717 ?auto_2719 ) ) ( not ( = ?auto_2717 ?auto_2738 ) ) ( not ( = ?auto_2719 ?auto_2728 ) ) ( not ( = ?auto_2719 ?auto_2739 ) ) ( not ( = ?auto_2719 ?auto_2742 ) ) ( not ( = ?auto_2719 ?auto_2743 ) ) ( not ( = ?auto_2737 ?auto_2736 ) ) ( not ( = ?auto_2737 ?auto_2740 ) ) ( not ( = ?auto_2737 ?auto_2741 ) ) ( not ( = ?auto_2734 ?auto_2730 ) ) ( not ( = ?auto_2734 ?auto_2732 ) ) ( not ( = ?auto_2734 ?auto_2735 ) ) ( not ( = ?auto_2738 ?auto_2728 ) ) ( not ( = ?auto_2738 ?auto_2739 ) ) ( not ( = ?auto_2738 ?auto_2742 ) ) ( not ( = ?auto_2738 ?auto_2743 ) ) ( not ( = ?auto_2714 ?auto_2721 ) ) ( not ( = ?auto_2714 ?auto_2731 ) ) ( not ( = ?auto_2715 ?auto_2721 ) ) ( not ( = ?auto_2715 ?auto_2731 ) ) ( not ( = ?auto_2716 ?auto_2721 ) ) ( not ( = ?auto_2716 ?auto_2731 ) ) ( not ( = ?auto_2717 ?auto_2721 ) ) ( not ( = ?auto_2717 ?auto_2731 ) ) ( not ( = ?auto_2718 ?auto_2721 ) ) ( not ( = ?auto_2718 ?auto_2731 ) ) ( not ( = ?auto_2721 ?auto_2738 ) ) ( not ( = ?auto_2721 ?auto_2728 ) ) ( not ( = ?auto_2721 ?auto_2739 ) ) ( not ( = ?auto_2721 ?auto_2742 ) ) ( not ( = ?auto_2721 ?auto_2743 ) ) ( not ( = ?auto_2729 ?auto_2737 ) ) ( not ( = ?auto_2729 ?auto_2736 ) ) ( not ( = ?auto_2729 ?auto_2740 ) ) ( not ( = ?auto_2729 ?auto_2741 ) ) ( not ( = ?auto_2733 ?auto_2734 ) ) ( not ( = ?auto_2733 ?auto_2730 ) ) ( not ( = ?auto_2733 ?auto_2732 ) ) ( not ( = ?auto_2733 ?auto_2735 ) ) ( not ( = ?auto_2731 ?auto_2738 ) ) ( not ( = ?auto_2731 ?auto_2728 ) ) ( not ( = ?auto_2731 ?auto_2739 ) ) ( not ( = ?auto_2731 ?auto_2742 ) ) ( not ( = ?auto_2731 ?auto_2743 ) ) ( not ( = ?auto_2714 ?auto_2720 ) ) ( not ( = ?auto_2714 ?auto_2726 ) ) ( not ( = ?auto_2715 ?auto_2720 ) ) ( not ( = ?auto_2715 ?auto_2726 ) ) ( not ( = ?auto_2716 ?auto_2720 ) ) ( not ( = ?auto_2716 ?auto_2726 ) ) ( not ( = ?auto_2717 ?auto_2720 ) ) ( not ( = ?auto_2717 ?auto_2726 ) ) ( not ( = ?auto_2718 ?auto_2720 ) ) ( not ( = ?auto_2718 ?auto_2726 ) ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( not ( = ?auto_2719 ?auto_2726 ) ) ( not ( = ?auto_2720 ?auto_2731 ) ) ( not ( = ?auto_2720 ?auto_2738 ) ) ( not ( = ?auto_2720 ?auto_2728 ) ) ( not ( = ?auto_2720 ?auto_2739 ) ) ( not ( = ?auto_2720 ?auto_2742 ) ) ( not ( = ?auto_2720 ?auto_2743 ) ) ( not ( = ?auto_2724 ?auto_2729 ) ) ( not ( = ?auto_2724 ?auto_2737 ) ) ( not ( = ?auto_2724 ?auto_2736 ) ) ( not ( = ?auto_2724 ?auto_2740 ) ) ( not ( = ?auto_2724 ?auto_2741 ) ) ( not ( = ?auto_2725 ?auto_2733 ) ) ( not ( = ?auto_2725 ?auto_2734 ) ) ( not ( = ?auto_2725 ?auto_2730 ) ) ( not ( = ?auto_2725 ?auto_2732 ) ) ( not ( = ?auto_2725 ?auto_2735 ) ) ( not ( = ?auto_2726 ?auto_2731 ) ) ( not ( = ?auto_2726 ?auto_2738 ) ) ( not ( = ?auto_2726 ?auto_2728 ) ) ( not ( = ?auto_2726 ?auto_2739 ) ) ( not ( = ?auto_2726 ?auto_2742 ) ) ( not ( = ?auto_2726 ?auto_2743 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2714 ?auto_2715 ?auto_2716 ?auto_2717 ?auto_2718 ?auto_2719 ?auto_2721 )
      ( MAKE-1CRATE ?auto_2721 ?auto_2720 )
      ( MAKE-7CRATE-VERIFY ?auto_2714 ?auto_2715 ?auto_2716 ?auto_2717 ?auto_2718 ?auto_2719 ?auto_2721 ?auto_2720 ) )
  )

)

