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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2516 - SURFACE
      ?auto_2517 - SURFACE
    )
    :vars
    (
      ?auto_2518 - HOIST
      ?auto_2519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2518 ?auto_2519 ) ( SURFACE-AT ?auto_2516 ?auto_2519 ) ( CLEAR ?auto_2516 ) ( LIFTING ?auto_2518 ?auto_2517 ) ( IS-CRATE ?auto_2517 ) ( not ( = ?auto_2516 ?auto_2517 ) ) )
    :subtasks
    ( ( !DROP ?auto_2518 ?auto_2517 ?auto_2516 ?auto_2519 )
      ( MAKE-1CRATE-VERIFY ?auto_2516 ?auto_2517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2520 - SURFACE
      ?auto_2521 - SURFACE
    )
    :vars
    (
      ?auto_2522 - HOIST
      ?auto_2523 - PLACE
      ?auto_2524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2522 ?auto_2523 ) ( SURFACE-AT ?auto_2520 ?auto_2523 ) ( CLEAR ?auto_2520 ) ( IS-CRATE ?auto_2521 ) ( not ( = ?auto_2520 ?auto_2521 ) ) ( TRUCK-AT ?auto_2524 ?auto_2523 ) ( AVAILABLE ?auto_2522 ) ( IN ?auto_2521 ?auto_2524 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2522 ?auto_2521 ?auto_2524 ?auto_2523 )
      ( MAKE-1CRATE ?auto_2520 ?auto_2521 )
      ( MAKE-1CRATE-VERIFY ?auto_2520 ?auto_2521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2525 - SURFACE
      ?auto_2526 - SURFACE
    )
    :vars
    (
      ?auto_2529 - HOIST
      ?auto_2528 - PLACE
      ?auto_2527 - TRUCK
      ?auto_2530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2529 ?auto_2528 ) ( SURFACE-AT ?auto_2525 ?auto_2528 ) ( CLEAR ?auto_2525 ) ( IS-CRATE ?auto_2526 ) ( not ( = ?auto_2525 ?auto_2526 ) ) ( AVAILABLE ?auto_2529 ) ( IN ?auto_2526 ?auto_2527 ) ( TRUCK-AT ?auto_2527 ?auto_2530 ) ( not ( = ?auto_2530 ?auto_2528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2527 ?auto_2530 ?auto_2528 )
      ( MAKE-1CRATE ?auto_2525 ?auto_2526 )
      ( MAKE-1CRATE-VERIFY ?auto_2525 ?auto_2526 ) )
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
      ?auto_2535 - TRUCK
      ?auto_2536 - PLACE
      ?auto_2537 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2533 ?auto_2534 ) ( SURFACE-AT ?auto_2531 ?auto_2534 ) ( CLEAR ?auto_2531 ) ( IS-CRATE ?auto_2532 ) ( not ( = ?auto_2531 ?auto_2532 ) ) ( AVAILABLE ?auto_2533 ) ( TRUCK-AT ?auto_2535 ?auto_2536 ) ( not ( = ?auto_2536 ?auto_2534 ) ) ( HOIST-AT ?auto_2537 ?auto_2536 ) ( LIFTING ?auto_2537 ?auto_2532 ) ( not ( = ?auto_2533 ?auto_2537 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2537 ?auto_2532 ?auto_2535 ?auto_2536 )
      ( MAKE-1CRATE ?auto_2531 ?auto_2532 )
      ( MAKE-1CRATE-VERIFY ?auto_2531 ?auto_2532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2538 - SURFACE
      ?auto_2539 - SURFACE
    )
    :vars
    (
      ?auto_2540 - HOIST
      ?auto_2544 - PLACE
      ?auto_2543 - TRUCK
      ?auto_2542 - PLACE
      ?auto_2541 - HOIST
      ?auto_2545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2540 ?auto_2544 ) ( SURFACE-AT ?auto_2538 ?auto_2544 ) ( CLEAR ?auto_2538 ) ( IS-CRATE ?auto_2539 ) ( not ( = ?auto_2538 ?auto_2539 ) ) ( AVAILABLE ?auto_2540 ) ( TRUCK-AT ?auto_2543 ?auto_2542 ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( HOIST-AT ?auto_2541 ?auto_2542 ) ( not ( = ?auto_2540 ?auto_2541 ) ) ( AVAILABLE ?auto_2541 ) ( SURFACE-AT ?auto_2539 ?auto_2542 ) ( ON ?auto_2539 ?auto_2545 ) ( CLEAR ?auto_2539 ) ( not ( = ?auto_2538 ?auto_2545 ) ) ( not ( = ?auto_2539 ?auto_2545 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2541 ?auto_2539 ?auto_2545 ?auto_2542 )
      ( MAKE-1CRATE ?auto_2538 ?auto_2539 )
      ( MAKE-1CRATE-VERIFY ?auto_2538 ?auto_2539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2546 - SURFACE
      ?auto_2547 - SURFACE
    )
    :vars
    (
      ?auto_2549 - HOIST
      ?auto_2552 - PLACE
      ?auto_2548 - PLACE
      ?auto_2550 - HOIST
      ?auto_2553 - SURFACE
      ?auto_2551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2549 ?auto_2552 ) ( SURFACE-AT ?auto_2546 ?auto_2552 ) ( CLEAR ?auto_2546 ) ( IS-CRATE ?auto_2547 ) ( not ( = ?auto_2546 ?auto_2547 ) ) ( AVAILABLE ?auto_2549 ) ( not ( = ?auto_2548 ?auto_2552 ) ) ( HOIST-AT ?auto_2550 ?auto_2548 ) ( not ( = ?auto_2549 ?auto_2550 ) ) ( AVAILABLE ?auto_2550 ) ( SURFACE-AT ?auto_2547 ?auto_2548 ) ( ON ?auto_2547 ?auto_2553 ) ( CLEAR ?auto_2547 ) ( not ( = ?auto_2546 ?auto_2553 ) ) ( not ( = ?auto_2547 ?auto_2553 ) ) ( TRUCK-AT ?auto_2551 ?auto_2552 ) )
    :subtasks
    ( ( !DRIVE ?auto_2551 ?auto_2552 ?auto_2548 )
      ( MAKE-1CRATE ?auto_2546 ?auto_2547 )
      ( MAKE-1CRATE-VERIFY ?auto_2546 ?auto_2547 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2563 - SURFACE
      ?auto_2564 - SURFACE
      ?auto_2565 - SURFACE
    )
    :vars
    (
      ?auto_2566 - HOIST
      ?auto_2567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2566 ?auto_2567 ) ( SURFACE-AT ?auto_2564 ?auto_2567 ) ( CLEAR ?auto_2564 ) ( LIFTING ?auto_2566 ?auto_2565 ) ( IS-CRATE ?auto_2565 ) ( not ( = ?auto_2564 ?auto_2565 ) ) ( ON ?auto_2564 ?auto_2563 ) ( not ( = ?auto_2563 ?auto_2564 ) ) ( not ( = ?auto_2563 ?auto_2565 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2564 ?auto_2565 )
      ( MAKE-2CRATE-VERIFY ?auto_2563 ?auto_2564 ?auto_2565 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2573 - SURFACE
      ?auto_2574 - SURFACE
      ?auto_2575 - SURFACE
    )
    :vars
    (
      ?auto_2578 - HOIST
      ?auto_2576 - PLACE
      ?auto_2577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2578 ?auto_2576 ) ( SURFACE-AT ?auto_2574 ?auto_2576 ) ( CLEAR ?auto_2574 ) ( IS-CRATE ?auto_2575 ) ( not ( = ?auto_2574 ?auto_2575 ) ) ( TRUCK-AT ?auto_2577 ?auto_2576 ) ( AVAILABLE ?auto_2578 ) ( IN ?auto_2575 ?auto_2577 ) ( ON ?auto_2574 ?auto_2573 ) ( not ( = ?auto_2573 ?auto_2574 ) ) ( not ( = ?auto_2573 ?auto_2575 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2574 ?auto_2575 )
      ( MAKE-2CRATE-VERIFY ?auto_2573 ?auto_2574 ?auto_2575 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2579 - SURFACE
      ?auto_2580 - SURFACE
    )
    :vars
    (
      ?auto_2582 - HOIST
      ?auto_2583 - PLACE
      ?auto_2581 - TRUCK
      ?auto_2584 - SURFACE
      ?auto_2585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2582 ?auto_2583 ) ( SURFACE-AT ?auto_2579 ?auto_2583 ) ( CLEAR ?auto_2579 ) ( IS-CRATE ?auto_2580 ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( AVAILABLE ?auto_2582 ) ( IN ?auto_2580 ?auto_2581 ) ( ON ?auto_2579 ?auto_2584 ) ( not ( = ?auto_2584 ?auto_2579 ) ) ( not ( = ?auto_2584 ?auto_2580 ) ) ( TRUCK-AT ?auto_2581 ?auto_2585 ) ( not ( = ?auto_2585 ?auto_2583 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2581 ?auto_2585 ?auto_2583 )
      ( MAKE-2CRATE ?auto_2584 ?auto_2579 ?auto_2580 )
      ( MAKE-1CRATE-VERIFY ?auto_2579 ?auto_2580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2586 - SURFACE
      ?auto_2587 - SURFACE
      ?auto_2588 - SURFACE
    )
    :vars
    (
      ?auto_2592 - HOIST
      ?auto_2591 - PLACE
      ?auto_2589 - TRUCK
      ?auto_2590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2592 ?auto_2591 ) ( SURFACE-AT ?auto_2587 ?auto_2591 ) ( CLEAR ?auto_2587 ) ( IS-CRATE ?auto_2588 ) ( not ( = ?auto_2587 ?auto_2588 ) ) ( AVAILABLE ?auto_2592 ) ( IN ?auto_2588 ?auto_2589 ) ( ON ?auto_2587 ?auto_2586 ) ( not ( = ?auto_2586 ?auto_2587 ) ) ( not ( = ?auto_2586 ?auto_2588 ) ) ( TRUCK-AT ?auto_2589 ?auto_2590 ) ( not ( = ?auto_2590 ?auto_2591 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2587 ?auto_2588 )
      ( MAKE-2CRATE-VERIFY ?auto_2586 ?auto_2587 ?auto_2588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2593 - SURFACE
      ?auto_2594 - SURFACE
    )
    :vars
    (
      ?auto_2598 - HOIST
      ?auto_2596 - PLACE
      ?auto_2595 - SURFACE
      ?auto_2597 - TRUCK
      ?auto_2599 - PLACE
      ?auto_2600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2598 ?auto_2596 ) ( SURFACE-AT ?auto_2593 ?auto_2596 ) ( CLEAR ?auto_2593 ) ( IS-CRATE ?auto_2594 ) ( not ( = ?auto_2593 ?auto_2594 ) ) ( AVAILABLE ?auto_2598 ) ( ON ?auto_2593 ?auto_2595 ) ( not ( = ?auto_2595 ?auto_2593 ) ) ( not ( = ?auto_2595 ?auto_2594 ) ) ( TRUCK-AT ?auto_2597 ?auto_2599 ) ( not ( = ?auto_2599 ?auto_2596 ) ) ( HOIST-AT ?auto_2600 ?auto_2599 ) ( LIFTING ?auto_2600 ?auto_2594 ) ( not ( = ?auto_2598 ?auto_2600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2600 ?auto_2594 ?auto_2597 ?auto_2599 )
      ( MAKE-2CRATE ?auto_2595 ?auto_2593 ?auto_2594 )
      ( MAKE-1CRATE-VERIFY ?auto_2593 ?auto_2594 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2601 - SURFACE
      ?auto_2602 - SURFACE
      ?auto_2603 - SURFACE
    )
    :vars
    (
      ?auto_2606 - HOIST
      ?auto_2607 - PLACE
      ?auto_2604 - TRUCK
      ?auto_2605 - PLACE
      ?auto_2608 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2606 ?auto_2607 ) ( SURFACE-AT ?auto_2602 ?auto_2607 ) ( CLEAR ?auto_2602 ) ( IS-CRATE ?auto_2603 ) ( not ( = ?auto_2602 ?auto_2603 ) ) ( AVAILABLE ?auto_2606 ) ( ON ?auto_2602 ?auto_2601 ) ( not ( = ?auto_2601 ?auto_2602 ) ) ( not ( = ?auto_2601 ?auto_2603 ) ) ( TRUCK-AT ?auto_2604 ?auto_2605 ) ( not ( = ?auto_2605 ?auto_2607 ) ) ( HOIST-AT ?auto_2608 ?auto_2605 ) ( LIFTING ?auto_2608 ?auto_2603 ) ( not ( = ?auto_2606 ?auto_2608 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2602 ?auto_2603 )
      ( MAKE-2CRATE-VERIFY ?auto_2601 ?auto_2602 ?auto_2603 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2609 - SURFACE
      ?auto_2610 - SURFACE
    )
    :vars
    (
      ?auto_2613 - HOIST
      ?auto_2611 - PLACE
      ?auto_2614 - SURFACE
      ?auto_2616 - TRUCK
      ?auto_2612 - PLACE
      ?auto_2615 - HOIST
      ?auto_2617 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2613 ?auto_2611 ) ( SURFACE-AT ?auto_2609 ?auto_2611 ) ( CLEAR ?auto_2609 ) ( IS-CRATE ?auto_2610 ) ( not ( = ?auto_2609 ?auto_2610 ) ) ( AVAILABLE ?auto_2613 ) ( ON ?auto_2609 ?auto_2614 ) ( not ( = ?auto_2614 ?auto_2609 ) ) ( not ( = ?auto_2614 ?auto_2610 ) ) ( TRUCK-AT ?auto_2616 ?auto_2612 ) ( not ( = ?auto_2612 ?auto_2611 ) ) ( HOIST-AT ?auto_2615 ?auto_2612 ) ( not ( = ?auto_2613 ?auto_2615 ) ) ( AVAILABLE ?auto_2615 ) ( SURFACE-AT ?auto_2610 ?auto_2612 ) ( ON ?auto_2610 ?auto_2617 ) ( CLEAR ?auto_2610 ) ( not ( = ?auto_2609 ?auto_2617 ) ) ( not ( = ?auto_2610 ?auto_2617 ) ) ( not ( = ?auto_2614 ?auto_2617 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2615 ?auto_2610 ?auto_2617 ?auto_2612 )
      ( MAKE-2CRATE ?auto_2614 ?auto_2609 ?auto_2610 )
      ( MAKE-1CRATE-VERIFY ?auto_2609 ?auto_2610 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2618 - SURFACE
      ?auto_2619 - SURFACE
      ?auto_2620 - SURFACE
    )
    :vars
    (
      ?auto_2625 - HOIST
      ?auto_2623 - PLACE
      ?auto_2622 - TRUCK
      ?auto_2626 - PLACE
      ?auto_2624 - HOIST
      ?auto_2621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2625 ?auto_2623 ) ( SURFACE-AT ?auto_2619 ?auto_2623 ) ( CLEAR ?auto_2619 ) ( IS-CRATE ?auto_2620 ) ( not ( = ?auto_2619 ?auto_2620 ) ) ( AVAILABLE ?auto_2625 ) ( ON ?auto_2619 ?auto_2618 ) ( not ( = ?auto_2618 ?auto_2619 ) ) ( not ( = ?auto_2618 ?auto_2620 ) ) ( TRUCK-AT ?auto_2622 ?auto_2626 ) ( not ( = ?auto_2626 ?auto_2623 ) ) ( HOIST-AT ?auto_2624 ?auto_2626 ) ( not ( = ?auto_2625 ?auto_2624 ) ) ( AVAILABLE ?auto_2624 ) ( SURFACE-AT ?auto_2620 ?auto_2626 ) ( ON ?auto_2620 ?auto_2621 ) ( CLEAR ?auto_2620 ) ( not ( = ?auto_2619 ?auto_2621 ) ) ( not ( = ?auto_2620 ?auto_2621 ) ) ( not ( = ?auto_2618 ?auto_2621 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2619 ?auto_2620 )
      ( MAKE-2CRATE-VERIFY ?auto_2618 ?auto_2619 ?auto_2620 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2627 - SURFACE
      ?auto_2628 - SURFACE
    )
    :vars
    (
      ?auto_2635 - HOIST
      ?auto_2629 - PLACE
      ?auto_2632 - SURFACE
      ?auto_2634 - PLACE
      ?auto_2630 - HOIST
      ?auto_2631 - SURFACE
      ?auto_2633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2635 ?auto_2629 ) ( SURFACE-AT ?auto_2627 ?auto_2629 ) ( CLEAR ?auto_2627 ) ( IS-CRATE ?auto_2628 ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( AVAILABLE ?auto_2635 ) ( ON ?auto_2627 ?auto_2632 ) ( not ( = ?auto_2632 ?auto_2627 ) ) ( not ( = ?auto_2632 ?auto_2628 ) ) ( not ( = ?auto_2634 ?auto_2629 ) ) ( HOIST-AT ?auto_2630 ?auto_2634 ) ( not ( = ?auto_2635 ?auto_2630 ) ) ( AVAILABLE ?auto_2630 ) ( SURFACE-AT ?auto_2628 ?auto_2634 ) ( ON ?auto_2628 ?auto_2631 ) ( CLEAR ?auto_2628 ) ( not ( = ?auto_2627 ?auto_2631 ) ) ( not ( = ?auto_2628 ?auto_2631 ) ) ( not ( = ?auto_2632 ?auto_2631 ) ) ( TRUCK-AT ?auto_2633 ?auto_2629 ) )
    :subtasks
    ( ( !DRIVE ?auto_2633 ?auto_2629 ?auto_2634 )
      ( MAKE-2CRATE ?auto_2632 ?auto_2627 ?auto_2628 )
      ( MAKE-1CRATE-VERIFY ?auto_2627 ?auto_2628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2636 - SURFACE
      ?auto_2637 - SURFACE
      ?auto_2638 - SURFACE
    )
    :vars
    (
      ?auto_2644 - HOIST
      ?auto_2639 - PLACE
      ?auto_2641 - PLACE
      ?auto_2643 - HOIST
      ?auto_2642 - SURFACE
      ?auto_2640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2644 ?auto_2639 ) ( SURFACE-AT ?auto_2637 ?auto_2639 ) ( CLEAR ?auto_2637 ) ( IS-CRATE ?auto_2638 ) ( not ( = ?auto_2637 ?auto_2638 ) ) ( AVAILABLE ?auto_2644 ) ( ON ?auto_2637 ?auto_2636 ) ( not ( = ?auto_2636 ?auto_2637 ) ) ( not ( = ?auto_2636 ?auto_2638 ) ) ( not ( = ?auto_2641 ?auto_2639 ) ) ( HOIST-AT ?auto_2643 ?auto_2641 ) ( not ( = ?auto_2644 ?auto_2643 ) ) ( AVAILABLE ?auto_2643 ) ( SURFACE-AT ?auto_2638 ?auto_2641 ) ( ON ?auto_2638 ?auto_2642 ) ( CLEAR ?auto_2638 ) ( not ( = ?auto_2637 ?auto_2642 ) ) ( not ( = ?auto_2638 ?auto_2642 ) ) ( not ( = ?auto_2636 ?auto_2642 ) ) ( TRUCK-AT ?auto_2640 ?auto_2639 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2637 ?auto_2638 )
      ( MAKE-2CRATE-VERIFY ?auto_2636 ?auto_2637 ?auto_2638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2645 - SURFACE
      ?auto_2646 - SURFACE
    )
    :vars
    (
      ?auto_2649 - HOIST
      ?auto_2650 - PLACE
      ?auto_2647 - SURFACE
      ?auto_2648 - PLACE
      ?auto_2653 - HOIST
      ?auto_2651 - SURFACE
      ?auto_2652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2649 ?auto_2650 ) ( IS-CRATE ?auto_2646 ) ( not ( = ?auto_2645 ?auto_2646 ) ) ( not ( = ?auto_2647 ?auto_2645 ) ) ( not ( = ?auto_2647 ?auto_2646 ) ) ( not ( = ?auto_2648 ?auto_2650 ) ) ( HOIST-AT ?auto_2653 ?auto_2648 ) ( not ( = ?auto_2649 ?auto_2653 ) ) ( AVAILABLE ?auto_2653 ) ( SURFACE-AT ?auto_2646 ?auto_2648 ) ( ON ?auto_2646 ?auto_2651 ) ( CLEAR ?auto_2646 ) ( not ( = ?auto_2645 ?auto_2651 ) ) ( not ( = ?auto_2646 ?auto_2651 ) ) ( not ( = ?auto_2647 ?auto_2651 ) ) ( TRUCK-AT ?auto_2652 ?auto_2650 ) ( SURFACE-AT ?auto_2647 ?auto_2650 ) ( CLEAR ?auto_2647 ) ( LIFTING ?auto_2649 ?auto_2645 ) ( IS-CRATE ?auto_2645 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2647 ?auto_2645 )
      ( MAKE-2CRATE ?auto_2647 ?auto_2645 ?auto_2646 )
      ( MAKE-1CRATE-VERIFY ?auto_2645 ?auto_2646 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2654 - SURFACE
      ?auto_2655 - SURFACE
      ?auto_2656 - SURFACE
    )
    :vars
    (
      ?auto_2658 - HOIST
      ?auto_2662 - PLACE
      ?auto_2660 - PLACE
      ?auto_2661 - HOIST
      ?auto_2657 - SURFACE
      ?auto_2659 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658 ?auto_2662 ) ( IS-CRATE ?auto_2656 ) ( not ( = ?auto_2655 ?auto_2656 ) ) ( not ( = ?auto_2654 ?auto_2655 ) ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( not ( = ?auto_2660 ?auto_2662 ) ) ( HOIST-AT ?auto_2661 ?auto_2660 ) ( not ( = ?auto_2658 ?auto_2661 ) ) ( AVAILABLE ?auto_2661 ) ( SURFACE-AT ?auto_2656 ?auto_2660 ) ( ON ?auto_2656 ?auto_2657 ) ( CLEAR ?auto_2656 ) ( not ( = ?auto_2655 ?auto_2657 ) ) ( not ( = ?auto_2656 ?auto_2657 ) ) ( not ( = ?auto_2654 ?auto_2657 ) ) ( TRUCK-AT ?auto_2659 ?auto_2662 ) ( SURFACE-AT ?auto_2654 ?auto_2662 ) ( CLEAR ?auto_2654 ) ( LIFTING ?auto_2658 ?auto_2655 ) ( IS-CRATE ?auto_2655 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2655 ?auto_2656 )
      ( MAKE-2CRATE-VERIFY ?auto_2654 ?auto_2655 ?auto_2656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2663 - SURFACE
      ?auto_2664 - SURFACE
    )
    :vars
    (
      ?auto_2669 - HOIST
      ?auto_2671 - PLACE
      ?auto_2666 - SURFACE
      ?auto_2667 - PLACE
      ?auto_2670 - HOIST
      ?auto_2668 - SURFACE
      ?auto_2665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669 ?auto_2671 ) ( IS-CRATE ?auto_2664 ) ( not ( = ?auto_2663 ?auto_2664 ) ) ( not ( = ?auto_2666 ?auto_2663 ) ) ( not ( = ?auto_2666 ?auto_2664 ) ) ( not ( = ?auto_2667 ?auto_2671 ) ) ( HOIST-AT ?auto_2670 ?auto_2667 ) ( not ( = ?auto_2669 ?auto_2670 ) ) ( AVAILABLE ?auto_2670 ) ( SURFACE-AT ?auto_2664 ?auto_2667 ) ( ON ?auto_2664 ?auto_2668 ) ( CLEAR ?auto_2664 ) ( not ( = ?auto_2663 ?auto_2668 ) ) ( not ( = ?auto_2664 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( TRUCK-AT ?auto_2665 ?auto_2671 ) ( SURFACE-AT ?auto_2666 ?auto_2671 ) ( CLEAR ?auto_2666 ) ( IS-CRATE ?auto_2663 ) ( AVAILABLE ?auto_2669 ) ( IN ?auto_2663 ?auto_2665 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2669 ?auto_2663 ?auto_2665 ?auto_2671 )
      ( MAKE-2CRATE ?auto_2666 ?auto_2663 ?auto_2664 )
      ( MAKE-1CRATE-VERIFY ?auto_2663 ?auto_2664 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2672 - SURFACE
      ?auto_2673 - SURFACE
      ?auto_2674 - SURFACE
    )
    :vars
    (
      ?auto_2676 - HOIST
      ?auto_2675 - PLACE
      ?auto_2677 - PLACE
      ?auto_2679 - HOIST
      ?auto_2680 - SURFACE
      ?auto_2678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676 ?auto_2675 ) ( IS-CRATE ?auto_2674 ) ( not ( = ?auto_2673 ?auto_2674 ) ) ( not ( = ?auto_2672 ?auto_2673 ) ) ( not ( = ?auto_2672 ?auto_2674 ) ) ( not ( = ?auto_2677 ?auto_2675 ) ) ( HOIST-AT ?auto_2679 ?auto_2677 ) ( not ( = ?auto_2676 ?auto_2679 ) ) ( AVAILABLE ?auto_2679 ) ( SURFACE-AT ?auto_2674 ?auto_2677 ) ( ON ?auto_2674 ?auto_2680 ) ( CLEAR ?auto_2674 ) ( not ( = ?auto_2673 ?auto_2680 ) ) ( not ( = ?auto_2674 ?auto_2680 ) ) ( not ( = ?auto_2672 ?auto_2680 ) ) ( TRUCK-AT ?auto_2678 ?auto_2675 ) ( SURFACE-AT ?auto_2672 ?auto_2675 ) ( CLEAR ?auto_2672 ) ( IS-CRATE ?auto_2673 ) ( AVAILABLE ?auto_2676 ) ( IN ?auto_2673 ?auto_2678 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2673 ?auto_2674 )
      ( MAKE-2CRATE-VERIFY ?auto_2672 ?auto_2673 ?auto_2674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2681 - SURFACE
      ?auto_2682 - SURFACE
    )
    :vars
    (
      ?auto_2685 - HOIST
      ?auto_2689 - PLACE
      ?auto_2688 - SURFACE
      ?auto_2687 - PLACE
      ?auto_2684 - HOIST
      ?auto_2686 - SURFACE
      ?auto_2683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685 ?auto_2689 ) ( IS-CRATE ?auto_2682 ) ( not ( = ?auto_2681 ?auto_2682 ) ) ( not ( = ?auto_2688 ?auto_2681 ) ) ( not ( = ?auto_2688 ?auto_2682 ) ) ( not ( = ?auto_2687 ?auto_2689 ) ) ( HOIST-AT ?auto_2684 ?auto_2687 ) ( not ( = ?auto_2685 ?auto_2684 ) ) ( AVAILABLE ?auto_2684 ) ( SURFACE-AT ?auto_2682 ?auto_2687 ) ( ON ?auto_2682 ?auto_2686 ) ( CLEAR ?auto_2682 ) ( not ( = ?auto_2681 ?auto_2686 ) ) ( not ( = ?auto_2682 ?auto_2686 ) ) ( not ( = ?auto_2688 ?auto_2686 ) ) ( SURFACE-AT ?auto_2688 ?auto_2689 ) ( CLEAR ?auto_2688 ) ( IS-CRATE ?auto_2681 ) ( AVAILABLE ?auto_2685 ) ( IN ?auto_2681 ?auto_2683 ) ( TRUCK-AT ?auto_2683 ?auto_2687 ) )
    :subtasks
    ( ( !DRIVE ?auto_2683 ?auto_2687 ?auto_2689 )
      ( MAKE-2CRATE ?auto_2688 ?auto_2681 ?auto_2682 )
      ( MAKE-1CRATE-VERIFY ?auto_2681 ?auto_2682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2690 - SURFACE
      ?auto_2691 - SURFACE
      ?auto_2692 - SURFACE
    )
    :vars
    (
      ?auto_2696 - HOIST
      ?auto_2695 - PLACE
      ?auto_2697 - PLACE
      ?auto_2698 - HOIST
      ?auto_2694 - SURFACE
      ?auto_2693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2696 ?auto_2695 ) ( IS-CRATE ?auto_2692 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2690 ?auto_2691 ) ) ( not ( = ?auto_2690 ?auto_2692 ) ) ( not ( = ?auto_2697 ?auto_2695 ) ) ( HOIST-AT ?auto_2698 ?auto_2697 ) ( not ( = ?auto_2696 ?auto_2698 ) ) ( AVAILABLE ?auto_2698 ) ( SURFACE-AT ?auto_2692 ?auto_2697 ) ( ON ?auto_2692 ?auto_2694 ) ( CLEAR ?auto_2692 ) ( not ( = ?auto_2691 ?auto_2694 ) ) ( not ( = ?auto_2692 ?auto_2694 ) ) ( not ( = ?auto_2690 ?auto_2694 ) ) ( SURFACE-AT ?auto_2690 ?auto_2695 ) ( CLEAR ?auto_2690 ) ( IS-CRATE ?auto_2691 ) ( AVAILABLE ?auto_2696 ) ( IN ?auto_2691 ?auto_2693 ) ( TRUCK-AT ?auto_2693 ?auto_2697 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2691 ?auto_2692 )
      ( MAKE-2CRATE-VERIFY ?auto_2690 ?auto_2691 ?auto_2692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2699 - SURFACE
      ?auto_2700 - SURFACE
    )
    :vars
    (
      ?auto_2704 - HOIST
      ?auto_2706 - PLACE
      ?auto_2702 - SURFACE
      ?auto_2701 - PLACE
      ?auto_2703 - HOIST
      ?auto_2705 - SURFACE
      ?auto_2707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2704 ?auto_2706 ) ( IS-CRATE ?auto_2700 ) ( not ( = ?auto_2699 ?auto_2700 ) ) ( not ( = ?auto_2702 ?auto_2699 ) ) ( not ( = ?auto_2702 ?auto_2700 ) ) ( not ( = ?auto_2701 ?auto_2706 ) ) ( HOIST-AT ?auto_2703 ?auto_2701 ) ( not ( = ?auto_2704 ?auto_2703 ) ) ( SURFACE-AT ?auto_2700 ?auto_2701 ) ( ON ?auto_2700 ?auto_2705 ) ( CLEAR ?auto_2700 ) ( not ( = ?auto_2699 ?auto_2705 ) ) ( not ( = ?auto_2700 ?auto_2705 ) ) ( not ( = ?auto_2702 ?auto_2705 ) ) ( SURFACE-AT ?auto_2702 ?auto_2706 ) ( CLEAR ?auto_2702 ) ( IS-CRATE ?auto_2699 ) ( AVAILABLE ?auto_2704 ) ( TRUCK-AT ?auto_2707 ?auto_2701 ) ( LIFTING ?auto_2703 ?auto_2699 ) )
    :subtasks
    ( ( !LOAD ?auto_2703 ?auto_2699 ?auto_2707 ?auto_2701 )
      ( MAKE-2CRATE ?auto_2702 ?auto_2699 ?auto_2700 )
      ( MAKE-1CRATE-VERIFY ?auto_2699 ?auto_2700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2708 - SURFACE
      ?auto_2709 - SURFACE
      ?auto_2710 - SURFACE
    )
    :vars
    (
      ?auto_2716 - HOIST
      ?auto_2711 - PLACE
      ?auto_2714 - PLACE
      ?auto_2715 - HOIST
      ?auto_2712 - SURFACE
      ?auto_2713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2716 ?auto_2711 ) ( IS-CRATE ?auto_2710 ) ( not ( = ?auto_2709 ?auto_2710 ) ) ( not ( = ?auto_2708 ?auto_2709 ) ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( not ( = ?auto_2714 ?auto_2711 ) ) ( HOIST-AT ?auto_2715 ?auto_2714 ) ( not ( = ?auto_2716 ?auto_2715 ) ) ( SURFACE-AT ?auto_2710 ?auto_2714 ) ( ON ?auto_2710 ?auto_2712 ) ( CLEAR ?auto_2710 ) ( not ( = ?auto_2709 ?auto_2712 ) ) ( not ( = ?auto_2710 ?auto_2712 ) ) ( not ( = ?auto_2708 ?auto_2712 ) ) ( SURFACE-AT ?auto_2708 ?auto_2711 ) ( CLEAR ?auto_2708 ) ( IS-CRATE ?auto_2709 ) ( AVAILABLE ?auto_2716 ) ( TRUCK-AT ?auto_2713 ?auto_2714 ) ( LIFTING ?auto_2715 ?auto_2709 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2709 ?auto_2710 )
      ( MAKE-2CRATE-VERIFY ?auto_2708 ?auto_2709 ?auto_2710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2717 - SURFACE
      ?auto_2718 - SURFACE
    )
    :vars
    (
      ?auto_2719 - HOIST
      ?auto_2722 - PLACE
      ?auto_2724 - SURFACE
      ?auto_2725 - PLACE
      ?auto_2723 - HOIST
      ?auto_2720 - SURFACE
      ?auto_2721 - TRUCK
      ?auto_2726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2719 ?auto_2722 ) ( IS-CRATE ?auto_2718 ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( not ( = ?auto_2724 ?auto_2717 ) ) ( not ( = ?auto_2724 ?auto_2718 ) ) ( not ( = ?auto_2725 ?auto_2722 ) ) ( HOIST-AT ?auto_2723 ?auto_2725 ) ( not ( = ?auto_2719 ?auto_2723 ) ) ( SURFACE-AT ?auto_2718 ?auto_2725 ) ( ON ?auto_2718 ?auto_2720 ) ( CLEAR ?auto_2718 ) ( not ( = ?auto_2717 ?auto_2720 ) ) ( not ( = ?auto_2718 ?auto_2720 ) ) ( not ( = ?auto_2724 ?auto_2720 ) ) ( SURFACE-AT ?auto_2724 ?auto_2722 ) ( CLEAR ?auto_2724 ) ( IS-CRATE ?auto_2717 ) ( AVAILABLE ?auto_2719 ) ( TRUCK-AT ?auto_2721 ?auto_2725 ) ( AVAILABLE ?auto_2723 ) ( SURFACE-AT ?auto_2717 ?auto_2725 ) ( ON ?auto_2717 ?auto_2726 ) ( CLEAR ?auto_2717 ) ( not ( = ?auto_2717 ?auto_2726 ) ) ( not ( = ?auto_2718 ?auto_2726 ) ) ( not ( = ?auto_2724 ?auto_2726 ) ) ( not ( = ?auto_2720 ?auto_2726 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2723 ?auto_2717 ?auto_2726 ?auto_2725 )
      ( MAKE-2CRATE ?auto_2724 ?auto_2717 ?auto_2718 )
      ( MAKE-1CRATE-VERIFY ?auto_2717 ?auto_2718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2727 - SURFACE
      ?auto_2728 - SURFACE
      ?auto_2729 - SURFACE
    )
    :vars
    (
      ?auto_2736 - HOIST
      ?auto_2734 - PLACE
      ?auto_2730 - PLACE
      ?auto_2733 - HOIST
      ?auto_2731 - SURFACE
      ?auto_2732 - TRUCK
      ?auto_2735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2736 ?auto_2734 ) ( IS-CRATE ?auto_2729 ) ( not ( = ?auto_2728 ?auto_2729 ) ) ( not ( = ?auto_2727 ?auto_2728 ) ) ( not ( = ?auto_2727 ?auto_2729 ) ) ( not ( = ?auto_2730 ?auto_2734 ) ) ( HOIST-AT ?auto_2733 ?auto_2730 ) ( not ( = ?auto_2736 ?auto_2733 ) ) ( SURFACE-AT ?auto_2729 ?auto_2730 ) ( ON ?auto_2729 ?auto_2731 ) ( CLEAR ?auto_2729 ) ( not ( = ?auto_2728 ?auto_2731 ) ) ( not ( = ?auto_2729 ?auto_2731 ) ) ( not ( = ?auto_2727 ?auto_2731 ) ) ( SURFACE-AT ?auto_2727 ?auto_2734 ) ( CLEAR ?auto_2727 ) ( IS-CRATE ?auto_2728 ) ( AVAILABLE ?auto_2736 ) ( TRUCK-AT ?auto_2732 ?auto_2730 ) ( AVAILABLE ?auto_2733 ) ( SURFACE-AT ?auto_2728 ?auto_2730 ) ( ON ?auto_2728 ?auto_2735 ) ( CLEAR ?auto_2728 ) ( not ( = ?auto_2728 ?auto_2735 ) ) ( not ( = ?auto_2729 ?auto_2735 ) ) ( not ( = ?auto_2727 ?auto_2735 ) ) ( not ( = ?auto_2731 ?auto_2735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2728 ?auto_2729 )
      ( MAKE-2CRATE-VERIFY ?auto_2727 ?auto_2728 ?auto_2729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2737 - SURFACE
      ?auto_2738 - SURFACE
    )
    :vars
    (
      ?auto_2744 - HOIST
      ?auto_2745 - PLACE
      ?auto_2746 - SURFACE
      ?auto_2741 - PLACE
      ?auto_2743 - HOIST
      ?auto_2742 - SURFACE
      ?auto_2739 - SURFACE
      ?auto_2740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2744 ?auto_2745 ) ( IS-CRATE ?auto_2738 ) ( not ( = ?auto_2737 ?auto_2738 ) ) ( not ( = ?auto_2746 ?auto_2737 ) ) ( not ( = ?auto_2746 ?auto_2738 ) ) ( not ( = ?auto_2741 ?auto_2745 ) ) ( HOIST-AT ?auto_2743 ?auto_2741 ) ( not ( = ?auto_2744 ?auto_2743 ) ) ( SURFACE-AT ?auto_2738 ?auto_2741 ) ( ON ?auto_2738 ?auto_2742 ) ( CLEAR ?auto_2738 ) ( not ( = ?auto_2737 ?auto_2742 ) ) ( not ( = ?auto_2738 ?auto_2742 ) ) ( not ( = ?auto_2746 ?auto_2742 ) ) ( SURFACE-AT ?auto_2746 ?auto_2745 ) ( CLEAR ?auto_2746 ) ( IS-CRATE ?auto_2737 ) ( AVAILABLE ?auto_2744 ) ( AVAILABLE ?auto_2743 ) ( SURFACE-AT ?auto_2737 ?auto_2741 ) ( ON ?auto_2737 ?auto_2739 ) ( CLEAR ?auto_2737 ) ( not ( = ?auto_2737 ?auto_2739 ) ) ( not ( = ?auto_2738 ?auto_2739 ) ) ( not ( = ?auto_2746 ?auto_2739 ) ) ( not ( = ?auto_2742 ?auto_2739 ) ) ( TRUCK-AT ?auto_2740 ?auto_2745 ) )
    :subtasks
    ( ( !DRIVE ?auto_2740 ?auto_2745 ?auto_2741 )
      ( MAKE-2CRATE ?auto_2746 ?auto_2737 ?auto_2738 )
      ( MAKE-1CRATE-VERIFY ?auto_2737 ?auto_2738 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2747 - SURFACE
      ?auto_2748 - SURFACE
      ?auto_2749 - SURFACE
    )
    :vars
    (
      ?auto_2750 - HOIST
      ?auto_2751 - PLACE
      ?auto_2755 - PLACE
      ?auto_2756 - HOIST
      ?auto_2753 - SURFACE
      ?auto_2752 - SURFACE
      ?auto_2754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2750 ?auto_2751 ) ( IS-CRATE ?auto_2749 ) ( not ( = ?auto_2748 ?auto_2749 ) ) ( not ( = ?auto_2747 ?auto_2748 ) ) ( not ( = ?auto_2747 ?auto_2749 ) ) ( not ( = ?auto_2755 ?auto_2751 ) ) ( HOIST-AT ?auto_2756 ?auto_2755 ) ( not ( = ?auto_2750 ?auto_2756 ) ) ( SURFACE-AT ?auto_2749 ?auto_2755 ) ( ON ?auto_2749 ?auto_2753 ) ( CLEAR ?auto_2749 ) ( not ( = ?auto_2748 ?auto_2753 ) ) ( not ( = ?auto_2749 ?auto_2753 ) ) ( not ( = ?auto_2747 ?auto_2753 ) ) ( SURFACE-AT ?auto_2747 ?auto_2751 ) ( CLEAR ?auto_2747 ) ( IS-CRATE ?auto_2748 ) ( AVAILABLE ?auto_2750 ) ( AVAILABLE ?auto_2756 ) ( SURFACE-AT ?auto_2748 ?auto_2755 ) ( ON ?auto_2748 ?auto_2752 ) ( CLEAR ?auto_2748 ) ( not ( = ?auto_2748 ?auto_2752 ) ) ( not ( = ?auto_2749 ?auto_2752 ) ) ( not ( = ?auto_2747 ?auto_2752 ) ) ( not ( = ?auto_2753 ?auto_2752 ) ) ( TRUCK-AT ?auto_2754 ?auto_2751 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2748 ?auto_2749 )
      ( MAKE-2CRATE-VERIFY ?auto_2747 ?auto_2748 ?auto_2749 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2775 - SURFACE
      ?auto_2776 - SURFACE
      ?auto_2777 - SURFACE
      ?auto_2778 - SURFACE
    )
    :vars
    (
      ?auto_2780 - HOIST
      ?auto_2779 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2780 ?auto_2779 ) ( SURFACE-AT ?auto_2777 ?auto_2779 ) ( CLEAR ?auto_2777 ) ( LIFTING ?auto_2780 ?auto_2778 ) ( IS-CRATE ?auto_2778 ) ( not ( = ?auto_2777 ?auto_2778 ) ) ( ON ?auto_2776 ?auto_2775 ) ( ON ?auto_2777 ?auto_2776 ) ( not ( = ?auto_2775 ?auto_2776 ) ) ( not ( = ?auto_2775 ?auto_2777 ) ) ( not ( = ?auto_2775 ?auto_2778 ) ) ( not ( = ?auto_2776 ?auto_2777 ) ) ( not ( = ?auto_2776 ?auto_2778 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2777 ?auto_2778 )
      ( MAKE-3CRATE-VERIFY ?auto_2775 ?auto_2776 ?auto_2777 ?auto_2778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2792 - SURFACE
      ?auto_2793 - SURFACE
      ?auto_2794 - SURFACE
      ?auto_2795 - SURFACE
    )
    :vars
    (
      ?auto_2798 - HOIST
      ?auto_2796 - PLACE
      ?auto_2797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2798 ?auto_2796 ) ( SURFACE-AT ?auto_2794 ?auto_2796 ) ( CLEAR ?auto_2794 ) ( IS-CRATE ?auto_2795 ) ( not ( = ?auto_2794 ?auto_2795 ) ) ( TRUCK-AT ?auto_2797 ?auto_2796 ) ( AVAILABLE ?auto_2798 ) ( IN ?auto_2795 ?auto_2797 ) ( ON ?auto_2794 ?auto_2793 ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( not ( = ?auto_2793 ?auto_2795 ) ) ( ON ?auto_2793 ?auto_2792 ) ( not ( = ?auto_2792 ?auto_2793 ) ) ( not ( = ?auto_2792 ?auto_2794 ) ) ( not ( = ?auto_2792 ?auto_2795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2793 ?auto_2794 ?auto_2795 )
      ( MAKE-3CRATE-VERIFY ?auto_2792 ?auto_2793 ?auto_2794 ?auto_2795 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2813 - SURFACE
      ?auto_2814 - SURFACE
      ?auto_2815 - SURFACE
      ?auto_2816 - SURFACE
    )
    :vars
    (
      ?auto_2819 - HOIST
      ?auto_2820 - PLACE
      ?auto_2818 - TRUCK
      ?auto_2817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2819 ?auto_2820 ) ( SURFACE-AT ?auto_2815 ?auto_2820 ) ( CLEAR ?auto_2815 ) ( IS-CRATE ?auto_2816 ) ( not ( = ?auto_2815 ?auto_2816 ) ) ( AVAILABLE ?auto_2819 ) ( IN ?auto_2816 ?auto_2818 ) ( ON ?auto_2815 ?auto_2814 ) ( not ( = ?auto_2814 ?auto_2815 ) ) ( not ( = ?auto_2814 ?auto_2816 ) ) ( TRUCK-AT ?auto_2818 ?auto_2817 ) ( not ( = ?auto_2817 ?auto_2820 ) ) ( ON ?auto_2814 ?auto_2813 ) ( not ( = ?auto_2813 ?auto_2814 ) ) ( not ( = ?auto_2813 ?auto_2815 ) ) ( not ( = ?auto_2813 ?auto_2816 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2814 ?auto_2815 ?auto_2816 )
      ( MAKE-3CRATE-VERIFY ?auto_2813 ?auto_2814 ?auto_2815 ?auto_2816 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2837 - SURFACE
      ?auto_2838 - SURFACE
      ?auto_2839 - SURFACE
      ?auto_2840 - SURFACE
    )
    :vars
    (
      ?auto_2844 - HOIST
      ?auto_2841 - PLACE
      ?auto_2843 - TRUCK
      ?auto_2845 - PLACE
      ?auto_2842 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2844 ?auto_2841 ) ( SURFACE-AT ?auto_2839 ?auto_2841 ) ( CLEAR ?auto_2839 ) ( IS-CRATE ?auto_2840 ) ( not ( = ?auto_2839 ?auto_2840 ) ) ( AVAILABLE ?auto_2844 ) ( ON ?auto_2839 ?auto_2838 ) ( not ( = ?auto_2838 ?auto_2839 ) ) ( not ( = ?auto_2838 ?auto_2840 ) ) ( TRUCK-AT ?auto_2843 ?auto_2845 ) ( not ( = ?auto_2845 ?auto_2841 ) ) ( HOIST-AT ?auto_2842 ?auto_2845 ) ( LIFTING ?auto_2842 ?auto_2840 ) ( not ( = ?auto_2844 ?auto_2842 ) ) ( ON ?auto_2838 ?auto_2837 ) ( not ( = ?auto_2837 ?auto_2838 ) ) ( not ( = ?auto_2837 ?auto_2839 ) ) ( not ( = ?auto_2837 ?auto_2840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2838 ?auto_2839 ?auto_2840 )
      ( MAKE-3CRATE-VERIFY ?auto_2837 ?auto_2838 ?auto_2839 ?auto_2840 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2864 - SURFACE
      ?auto_2865 - SURFACE
      ?auto_2866 - SURFACE
      ?auto_2867 - SURFACE
    )
    :vars
    (
      ?auto_2871 - HOIST
      ?auto_2868 - PLACE
      ?auto_2873 - TRUCK
      ?auto_2872 - PLACE
      ?auto_2870 - HOIST
      ?auto_2869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2871 ?auto_2868 ) ( SURFACE-AT ?auto_2866 ?auto_2868 ) ( CLEAR ?auto_2866 ) ( IS-CRATE ?auto_2867 ) ( not ( = ?auto_2866 ?auto_2867 ) ) ( AVAILABLE ?auto_2871 ) ( ON ?auto_2866 ?auto_2865 ) ( not ( = ?auto_2865 ?auto_2866 ) ) ( not ( = ?auto_2865 ?auto_2867 ) ) ( TRUCK-AT ?auto_2873 ?auto_2872 ) ( not ( = ?auto_2872 ?auto_2868 ) ) ( HOIST-AT ?auto_2870 ?auto_2872 ) ( not ( = ?auto_2871 ?auto_2870 ) ) ( AVAILABLE ?auto_2870 ) ( SURFACE-AT ?auto_2867 ?auto_2872 ) ( ON ?auto_2867 ?auto_2869 ) ( CLEAR ?auto_2867 ) ( not ( = ?auto_2866 ?auto_2869 ) ) ( not ( = ?auto_2867 ?auto_2869 ) ) ( not ( = ?auto_2865 ?auto_2869 ) ) ( ON ?auto_2865 ?auto_2864 ) ( not ( = ?auto_2864 ?auto_2865 ) ) ( not ( = ?auto_2864 ?auto_2866 ) ) ( not ( = ?auto_2864 ?auto_2867 ) ) ( not ( = ?auto_2864 ?auto_2869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2865 ?auto_2866 ?auto_2867 )
      ( MAKE-3CRATE-VERIFY ?auto_2864 ?auto_2865 ?auto_2866 ?auto_2867 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2892 - SURFACE
      ?auto_2893 - SURFACE
      ?auto_2894 - SURFACE
      ?auto_2895 - SURFACE
    )
    :vars
    (
      ?auto_2897 - HOIST
      ?auto_2896 - PLACE
      ?auto_2901 - PLACE
      ?auto_2898 - HOIST
      ?auto_2900 - SURFACE
      ?auto_2899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2897 ?auto_2896 ) ( SURFACE-AT ?auto_2894 ?auto_2896 ) ( CLEAR ?auto_2894 ) ( IS-CRATE ?auto_2895 ) ( not ( = ?auto_2894 ?auto_2895 ) ) ( AVAILABLE ?auto_2897 ) ( ON ?auto_2894 ?auto_2893 ) ( not ( = ?auto_2893 ?auto_2894 ) ) ( not ( = ?auto_2893 ?auto_2895 ) ) ( not ( = ?auto_2901 ?auto_2896 ) ) ( HOIST-AT ?auto_2898 ?auto_2901 ) ( not ( = ?auto_2897 ?auto_2898 ) ) ( AVAILABLE ?auto_2898 ) ( SURFACE-AT ?auto_2895 ?auto_2901 ) ( ON ?auto_2895 ?auto_2900 ) ( CLEAR ?auto_2895 ) ( not ( = ?auto_2894 ?auto_2900 ) ) ( not ( = ?auto_2895 ?auto_2900 ) ) ( not ( = ?auto_2893 ?auto_2900 ) ) ( TRUCK-AT ?auto_2899 ?auto_2896 ) ( ON ?auto_2893 ?auto_2892 ) ( not ( = ?auto_2892 ?auto_2893 ) ) ( not ( = ?auto_2892 ?auto_2894 ) ) ( not ( = ?auto_2892 ?auto_2895 ) ) ( not ( = ?auto_2892 ?auto_2900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2893 ?auto_2894 ?auto_2895 )
      ( MAKE-3CRATE-VERIFY ?auto_2892 ?auto_2893 ?auto_2894 ?auto_2895 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2920 - SURFACE
      ?auto_2921 - SURFACE
      ?auto_2922 - SURFACE
      ?auto_2923 - SURFACE
    )
    :vars
    (
      ?auto_2929 - HOIST
      ?auto_2925 - PLACE
      ?auto_2924 - PLACE
      ?auto_2927 - HOIST
      ?auto_2928 - SURFACE
      ?auto_2926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2929 ?auto_2925 ) ( IS-CRATE ?auto_2923 ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2921 ?auto_2922 ) ) ( not ( = ?auto_2921 ?auto_2923 ) ) ( not ( = ?auto_2924 ?auto_2925 ) ) ( HOIST-AT ?auto_2927 ?auto_2924 ) ( not ( = ?auto_2929 ?auto_2927 ) ) ( AVAILABLE ?auto_2927 ) ( SURFACE-AT ?auto_2923 ?auto_2924 ) ( ON ?auto_2923 ?auto_2928 ) ( CLEAR ?auto_2923 ) ( not ( = ?auto_2922 ?auto_2928 ) ) ( not ( = ?auto_2923 ?auto_2928 ) ) ( not ( = ?auto_2921 ?auto_2928 ) ) ( TRUCK-AT ?auto_2926 ?auto_2925 ) ( SURFACE-AT ?auto_2921 ?auto_2925 ) ( CLEAR ?auto_2921 ) ( LIFTING ?auto_2929 ?auto_2922 ) ( IS-CRATE ?auto_2922 ) ( ON ?auto_2921 ?auto_2920 ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2923 ) ) ( not ( = ?auto_2920 ?auto_2928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2921 ?auto_2922 ?auto_2923 )
      ( MAKE-3CRATE-VERIFY ?auto_2920 ?auto_2921 ?auto_2922 ?auto_2923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2948 - SURFACE
      ?auto_2949 - SURFACE
      ?auto_2950 - SURFACE
      ?auto_2951 - SURFACE
    )
    :vars
    (
      ?auto_2957 - HOIST
      ?auto_2952 - PLACE
      ?auto_2953 - PLACE
      ?auto_2955 - HOIST
      ?auto_2954 - SURFACE
      ?auto_2956 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2957 ?auto_2952 ) ( IS-CRATE ?auto_2951 ) ( not ( = ?auto_2950 ?auto_2951 ) ) ( not ( = ?auto_2949 ?auto_2950 ) ) ( not ( = ?auto_2949 ?auto_2951 ) ) ( not ( = ?auto_2953 ?auto_2952 ) ) ( HOIST-AT ?auto_2955 ?auto_2953 ) ( not ( = ?auto_2957 ?auto_2955 ) ) ( AVAILABLE ?auto_2955 ) ( SURFACE-AT ?auto_2951 ?auto_2953 ) ( ON ?auto_2951 ?auto_2954 ) ( CLEAR ?auto_2951 ) ( not ( = ?auto_2950 ?auto_2954 ) ) ( not ( = ?auto_2951 ?auto_2954 ) ) ( not ( = ?auto_2949 ?auto_2954 ) ) ( TRUCK-AT ?auto_2956 ?auto_2952 ) ( SURFACE-AT ?auto_2949 ?auto_2952 ) ( CLEAR ?auto_2949 ) ( IS-CRATE ?auto_2950 ) ( AVAILABLE ?auto_2957 ) ( IN ?auto_2950 ?auto_2956 ) ( ON ?auto_2949 ?auto_2948 ) ( not ( = ?auto_2948 ?auto_2949 ) ) ( not ( = ?auto_2948 ?auto_2950 ) ) ( not ( = ?auto_2948 ?auto_2951 ) ) ( not ( = ?auto_2948 ?auto_2954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2949 ?auto_2950 ?auto_2951 )
      ( MAKE-3CRATE-VERIFY ?auto_2948 ?auto_2949 ?auto_2950 ?auto_2951 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2976 - SURFACE
      ?auto_2977 - SURFACE
      ?auto_2978 - SURFACE
      ?auto_2979 - SURFACE
    )
    :vars
    (
      ?auto_2984 - HOIST
      ?auto_2985 - PLACE
      ?auto_2980 - PLACE
      ?auto_2983 - HOIST
      ?auto_2982 - SURFACE
      ?auto_2981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2984 ?auto_2985 ) ( IS-CRATE ?auto_2979 ) ( not ( = ?auto_2978 ?auto_2979 ) ) ( not ( = ?auto_2977 ?auto_2978 ) ) ( not ( = ?auto_2977 ?auto_2979 ) ) ( not ( = ?auto_2980 ?auto_2985 ) ) ( HOIST-AT ?auto_2983 ?auto_2980 ) ( not ( = ?auto_2984 ?auto_2983 ) ) ( AVAILABLE ?auto_2983 ) ( SURFACE-AT ?auto_2979 ?auto_2980 ) ( ON ?auto_2979 ?auto_2982 ) ( CLEAR ?auto_2979 ) ( not ( = ?auto_2978 ?auto_2982 ) ) ( not ( = ?auto_2979 ?auto_2982 ) ) ( not ( = ?auto_2977 ?auto_2982 ) ) ( SURFACE-AT ?auto_2977 ?auto_2985 ) ( CLEAR ?auto_2977 ) ( IS-CRATE ?auto_2978 ) ( AVAILABLE ?auto_2984 ) ( IN ?auto_2978 ?auto_2981 ) ( TRUCK-AT ?auto_2981 ?auto_2980 ) ( ON ?auto_2977 ?auto_2976 ) ( not ( = ?auto_2976 ?auto_2977 ) ) ( not ( = ?auto_2976 ?auto_2978 ) ) ( not ( = ?auto_2976 ?auto_2979 ) ) ( not ( = ?auto_2976 ?auto_2982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2977 ?auto_2978 ?auto_2979 )
      ( MAKE-3CRATE-VERIFY ?auto_2976 ?auto_2977 ?auto_2978 ?auto_2979 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3004 - SURFACE
      ?auto_3005 - SURFACE
      ?auto_3006 - SURFACE
      ?auto_3007 - SURFACE
    )
    :vars
    (
      ?auto_3010 - HOIST
      ?auto_3012 - PLACE
      ?auto_3011 - PLACE
      ?auto_3008 - HOIST
      ?auto_3013 - SURFACE
      ?auto_3009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3010 ?auto_3012 ) ( IS-CRATE ?auto_3007 ) ( not ( = ?auto_3006 ?auto_3007 ) ) ( not ( = ?auto_3005 ?auto_3006 ) ) ( not ( = ?auto_3005 ?auto_3007 ) ) ( not ( = ?auto_3011 ?auto_3012 ) ) ( HOIST-AT ?auto_3008 ?auto_3011 ) ( not ( = ?auto_3010 ?auto_3008 ) ) ( SURFACE-AT ?auto_3007 ?auto_3011 ) ( ON ?auto_3007 ?auto_3013 ) ( CLEAR ?auto_3007 ) ( not ( = ?auto_3006 ?auto_3013 ) ) ( not ( = ?auto_3007 ?auto_3013 ) ) ( not ( = ?auto_3005 ?auto_3013 ) ) ( SURFACE-AT ?auto_3005 ?auto_3012 ) ( CLEAR ?auto_3005 ) ( IS-CRATE ?auto_3006 ) ( AVAILABLE ?auto_3010 ) ( TRUCK-AT ?auto_3009 ?auto_3011 ) ( LIFTING ?auto_3008 ?auto_3006 ) ( ON ?auto_3005 ?auto_3004 ) ( not ( = ?auto_3004 ?auto_3005 ) ) ( not ( = ?auto_3004 ?auto_3006 ) ) ( not ( = ?auto_3004 ?auto_3007 ) ) ( not ( = ?auto_3004 ?auto_3013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3005 ?auto_3006 ?auto_3007 )
      ( MAKE-3CRATE-VERIFY ?auto_3004 ?auto_3005 ?auto_3006 ?auto_3007 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3034 - SURFACE
      ?auto_3035 - SURFACE
      ?auto_3036 - SURFACE
      ?auto_3037 - SURFACE
    )
    :vars
    (
      ?auto_3040 - HOIST
      ?auto_3038 - PLACE
      ?auto_3041 - PLACE
      ?auto_3044 - HOIST
      ?auto_3043 - SURFACE
      ?auto_3042 - TRUCK
      ?auto_3039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3040 ?auto_3038 ) ( IS-CRATE ?auto_3037 ) ( not ( = ?auto_3036 ?auto_3037 ) ) ( not ( = ?auto_3035 ?auto_3036 ) ) ( not ( = ?auto_3035 ?auto_3037 ) ) ( not ( = ?auto_3041 ?auto_3038 ) ) ( HOIST-AT ?auto_3044 ?auto_3041 ) ( not ( = ?auto_3040 ?auto_3044 ) ) ( SURFACE-AT ?auto_3037 ?auto_3041 ) ( ON ?auto_3037 ?auto_3043 ) ( CLEAR ?auto_3037 ) ( not ( = ?auto_3036 ?auto_3043 ) ) ( not ( = ?auto_3037 ?auto_3043 ) ) ( not ( = ?auto_3035 ?auto_3043 ) ) ( SURFACE-AT ?auto_3035 ?auto_3038 ) ( CLEAR ?auto_3035 ) ( IS-CRATE ?auto_3036 ) ( AVAILABLE ?auto_3040 ) ( TRUCK-AT ?auto_3042 ?auto_3041 ) ( AVAILABLE ?auto_3044 ) ( SURFACE-AT ?auto_3036 ?auto_3041 ) ( ON ?auto_3036 ?auto_3039 ) ( CLEAR ?auto_3036 ) ( not ( = ?auto_3036 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) ( not ( = ?auto_3035 ?auto_3039 ) ) ( not ( = ?auto_3043 ?auto_3039 ) ) ( ON ?auto_3035 ?auto_3034 ) ( not ( = ?auto_3034 ?auto_3035 ) ) ( not ( = ?auto_3034 ?auto_3036 ) ) ( not ( = ?auto_3034 ?auto_3037 ) ) ( not ( = ?auto_3034 ?auto_3043 ) ) ( not ( = ?auto_3034 ?auto_3039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3035 ?auto_3036 ?auto_3037 )
      ( MAKE-3CRATE-VERIFY ?auto_3034 ?auto_3035 ?auto_3036 ?auto_3037 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3065 - SURFACE
      ?auto_3066 - SURFACE
      ?auto_3067 - SURFACE
      ?auto_3068 - SURFACE
    )
    :vars
    (
      ?auto_3073 - HOIST
      ?auto_3070 - PLACE
      ?auto_3069 - PLACE
      ?auto_3071 - HOIST
      ?auto_3072 - SURFACE
      ?auto_3074 - SURFACE
      ?auto_3075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3073 ?auto_3070 ) ( IS-CRATE ?auto_3068 ) ( not ( = ?auto_3067 ?auto_3068 ) ) ( not ( = ?auto_3066 ?auto_3067 ) ) ( not ( = ?auto_3066 ?auto_3068 ) ) ( not ( = ?auto_3069 ?auto_3070 ) ) ( HOIST-AT ?auto_3071 ?auto_3069 ) ( not ( = ?auto_3073 ?auto_3071 ) ) ( SURFACE-AT ?auto_3068 ?auto_3069 ) ( ON ?auto_3068 ?auto_3072 ) ( CLEAR ?auto_3068 ) ( not ( = ?auto_3067 ?auto_3072 ) ) ( not ( = ?auto_3068 ?auto_3072 ) ) ( not ( = ?auto_3066 ?auto_3072 ) ) ( SURFACE-AT ?auto_3066 ?auto_3070 ) ( CLEAR ?auto_3066 ) ( IS-CRATE ?auto_3067 ) ( AVAILABLE ?auto_3073 ) ( AVAILABLE ?auto_3071 ) ( SURFACE-AT ?auto_3067 ?auto_3069 ) ( ON ?auto_3067 ?auto_3074 ) ( CLEAR ?auto_3067 ) ( not ( = ?auto_3067 ?auto_3074 ) ) ( not ( = ?auto_3068 ?auto_3074 ) ) ( not ( = ?auto_3066 ?auto_3074 ) ) ( not ( = ?auto_3072 ?auto_3074 ) ) ( TRUCK-AT ?auto_3075 ?auto_3070 ) ( ON ?auto_3066 ?auto_3065 ) ( not ( = ?auto_3065 ?auto_3066 ) ) ( not ( = ?auto_3065 ?auto_3067 ) ) ( not ( = ?auto_3065 ?auto_3068 ) ) ( not ( = ?auto_3065 ?auto_3072 ) ) ( not ( = ?auto_3065 ?auto_3074 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3066 ?auto_3067 ?auto_3068 )
      ( MAKE-3CRATE-VERIFY ?auto_3065 ?auto_3066 ?auto_3067 ?auto_3068 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3076 - SURFACE
      ?auto_3077 - SURFACE
    )
    :vars
    (
      ?auto_3082 - HOIST
      ?auto_3079 - PLACE
      ?auto_3083 - SURFACE
      ?auto_3078 - PLACE
      ?auto_3080 - HOIST
      ?auto_3081 - SURFACE
      ?auto_3084 - SURFACE
      ?auto_3085 - TRUCK
      ?auto_3086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3082 ?auto_3079 ) ( IS-CRATE ?auto_3077 ) ( not ( = ?auto_3076 ?auto_3077 ) ) ( not ( = ?auto_3083 ?auto_3076 ) ) ( not ( = ?auto_3083 ?auto_3077 ) ) ( not ( = ?auto_3078 ?auto_3079 ) ) ( HOIST-AT ?auto_3080 ?auto_3078 ) ( not ( = ?auto_3082 ?auto_3080 ) ) ( SURFACE-AT ?auto_3077 ?auto_3078 ) ( ON ?auto_3077 ?auto_3081 ) ( CLEAR ?auto_3077 ) ( not ( = ?auto_3076 ?auto_3081 ) ) ( not ( = ?auto_3077 ?auto_3081 ) ) ( not ( = ?auto_3083 ?auto_3081 ) ) ( IS-CRATE ?auto_3076 ) ( AVAILABLE ?auto_3080 ) ( SURFACE-AT ?auto_3076 ?auto_3078 ) ( ON ?auto_3076 ?auto_3084 ) ( CLEAR ?auto_3076 ) ( not ( = ?auto_3076 ?auto_3084 ) ) ( not ( = ?auto_3077 ?auto_3084 ) ) ( not ( = ?auto_3083 ?auto_3084 ) ) ( not ( = ?auto_3081 ?auto_3084 ) ) ( TRUCK-AT ?auto_3085 ?auto_3079 ) ( SURFACE-AT ?auto_3086 ?auto_3079 ) ( CLEAR ?auto_3086 ) ( LIFTING ?auto_3082 ?auto_3083 ) ( IS-CRATE ?auto_3083 ) ( not ( = ?auto_3086 ?auto_3083 ) ) ( not ( = ?auto_3076 ?auto_3086 ) ) ( not ( = ?auto_3077 ?auto_3086 ) ) ( not ( = ?auto_3081 ?auto_3086 ) ) ( not ( = ?auto_3084 ?auto_3086 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3086 ?auto_3083 )
      ( MAKE-2CRATE ?auto_3083 ?auto_3076 ?auto_3077 )
      ( MAKE-1CRATE-VERIFY ?auto_3076 ?auto_3077 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3087 - SURFACE
      ?auto_3088 - SURFACE
      ?auto_3089 - SURFACE
    )
    :vars
    (
      ?auto_3095 - HOIST
      ?auto_3094 - PLACE
      ?auto_3090 - PLACE
      ?auto_3092 - HOIST
      ?auto_3096 - SURFACE
      ?auto_3091 - SURFACE
      ?auto_3097 - TRUCK
      ?auto_3093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3095 ?auto_3094 ) ( IS-CRATE ?auto_3089 ) ( not ( = ?auto_3088 ?auto_3089 ) ) ( not ( = ?auto_3087 ?auto_3088 ) ) ( not ( = ?auto_3087 ?auto_3089 ) ) ( not ( = ?auto_3090 ?auto_3094 ) ) ( HOIST-AT ?auto_3092 ?auto_3090 ) ( not ( = ?auto_3095 ?auto_3092 ) ) ( SURFACE-AT ?auto_3089 ?auto_3090 ) ( ON ?auto_3089 ?auto_3096 ) ( CLEAR ?auto_3089 ) ( not ( = ?auto_3088 ?auto_3096 ) ) ( not ( = ?auto_3089 ?auto_3096 ) ) ( not ( = ?auto_3087 ?auto_3096 ) ) ( IS-CRATE ?auto_3088 ) ( AVAILABLE ?auto_3092 ) ( SURFACE-AT ?auto_3088 ?auto_3090 ) ( ON ?auto_3088 ?auto_3091 ) ( CLEAR ?auto_3088 ) ( not ( = ?auto_3088 ?auto_3091 ) ) ( not ( = ?auto_3089 ?auto_3091 ) ) ( not ( = ?auto_3087 ?auto_3091 ) ) ( not ( = ?auto_3096 ?auto_3091 ) ) ( TRUCK-AT ?auto_3097 ?auto_3094 ) ( SURFACE-AT ?auto_3093 ?auto_3094 ) ( CLEAR ?auto_3093 ) ( LIFTING ?auto_3095 ?auto_3087 ) ( IS-CRATE ?auto_3087 ) ( not ( = ?auto_3093 ?auto_3087 ) ) ( not ( = ?auto_3088 ?auto_3093 ) ) ( not ( = ?auto_3089 ?auto_3093 ) ) ( not ( = ?auto_3096 ?auto_3093 ) ) ( not ( = ?auto_3091 ?auto_3093 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3088 ?auto_3089 )
      ( MAKE-2CRATE-VERIFY ?auto_3087 ?auto_3088 ?auto_3089 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3098 - SURFACE
      ?auto_3099 - SURFACE
      ?auto_3100 - SURFACE
      ?auto_3101 - SURFACE
    )
    :vars
    (
      ?auto_3107 - HOIST
      ?auto_3105 - PLACE
      ?auto_3102 - PLACE
      ?auto_3104 - HOIST
      ?auto_3103 - SURFACE
      ?auto_3108 - SURFACE
      ?auto_3106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3107 ?auto_3105 ) ( IS-CRATE ?auto_3101 ) ( not ( = ?auto_3100 ?auto_3101 ) ) ( not ( = ?auto_3099 ?auto_3100 ) ) ( not ( = ?auto_3099 ?auto_3101 ) ) ( not ( = ?auto_3102 ?auto_3105 ) ) ( HOIST-AT ?auto_3104 ?auto_3102 ) ( not ( = ?auto_3107 ?auto_3104 ) ) ( SURFACE-AT ?auto_3101 ?auto_3102 ) ( ON ?auto_3101 ?auto_3103 ) ( CLEAR ?auto_3101 ) ( not ( = ?auto_3100 ?auto_3103 ) ) ( not ( = ?auto_3101 ?auto_3103 ) ) ( not ( = ?auto_3099 ?auto_3103 ) ) ( IS-CRATE ?auto_3100 ) ( AVAILABLE ?auto_3104 ) ( SURFACE-AT ?auto_3100 ?auto_3102 ) ( ON ?auto_3100 ?auto_3108 ) ( CLEAR ?auto_3100 ) ( not ( = ?auto_3100 ?auto_3108 ) ) ( not ( = ?auto_3101 ?auto_3108 ) ) ( not ( = ?auto_3099 ?auto_3108 ) ) ( not ( = ?auto_3103 ?auto_3108 ) ) ( TRUCK-AT ?auto_3106 ?auto_3105 ) ( SURFACE-AT ?auto_3098 ?auto_3105 ) ( CLEAR ?auto_3098 ) ( LIFTING ?auto_3107 ?auto_3099 ) ( IS-CRATE ?auto_3099 ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( not ( = ?auto_3100 ?auto_3098 ) ) ( not ( = ?auto_3101 ?auto_3098 ) ) ( not ( = ?auto_3103 ?auto_3098 ) ) ( not ( = ?auto_3108 ?auto_3098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3099 ?auto_3100 ?auto_3101 )
      ( MAKE-3CRATE-VERIFY ?auto_3098 ?auto_3099 ?auto_3100 ?auto_3101 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3157 - SURFACE
      ?auto_3158 - SURFACE
    )
    :vars
    (
      ?auto_3162 - HOIST
      ?auto_3161 - PLACE
      ?auto_3164 - SURFACE
      ?auto_3163 - PLACE
      ?auto_3159 - HOIST
      ?auto_3160 - SURFACE
      ?auto_3166 - TRUCK
      ?auto_3165 - SURFACE
      ?auto_3167 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3162 ?auto_3161 ) ( IS-CRATE ?auto_3158 ) ( not ( = ?auto_3157 ?auto_3158 ) ) ( not ( = ?auto_3164 ?auto_3157 ) ) ( not ( = ?auto_3164 ?auto_3158 ) ) ( not ( = ?auto_3163 ?auto_3161 ) ) ( HOIST-AT ?auto_3159 ?auto_3163 ) ( not ( = ?auto_3162 ?auto_3159 ) ) ( SURFACE-AT ?auto_3158 ?auto_3163 ) ( ON ?auto_3158 ?auto_3160 ) ( CLEAR ?auto_3158 ) ( not ( = ?auto_3157 ?auto_3160 ) ) ( not ( = ?auto_3158 ?auto_3160 ) ) ( not ( = ?auto_3164 ?auto_3160 ) ) ( SURFACE-AT ?auto_3164 ?auto_3161 ) ( CLEAR ?auto_3164 ) ( IS-CRATE ?auto_3157 ) ( AVAILABLE ?auto_3162 ) ( TRUCK-AT ?auto_3166 ?auto_3163 ) ( SURFACE-AT ?auto_3157 ?auto_3163 ) ( ON ?auto_3157 ?auto_3165 ) ( CLEAR ?auto_3157 ) ( not ( = ?auto_3157 ?auto_3165 ) ) ( not ( = ?auto_3158 ?auto_3165 ) ) ( not ( = ?auto_3164 ?auto_3165 ) ) ( not ( = ?auto_3160 ?auto_3165 ) ) ( LIFTING ?auto_3159 ?auto_3167 ) ( IS-CRATE ?auto_3167 ) ( not ( = ?auto_3157 ?auto_3167 ) ) ( not ( = ?auto_3158 ?auto_3167 ) ) ( not ( = ?auto_3164 ?auto_3167 ) ) ( not ( = ?auto_3160 ?auto_3167 ) ) ( not ( = ?auto_3165 ?auto_3167 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3159 ?auto_3167 ?auto_3166 ?auto_3163 )
      ( MAKE-1CRATE ?auto_3157 ?auto_3158 )
      ( MAKE-1CRATE-VERIFY ?auto_3157 ?auto_3158 ) )
  )

)

