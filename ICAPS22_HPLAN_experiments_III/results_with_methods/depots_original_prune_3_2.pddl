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
      ?auto_2557 - SURFACE
      ?auto_2558 - SURFACE
    )
    :vars
    (
      ?auto_2559 - HOIST
      ?auto_2560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2559 ?auto_2560 ) ( SURFACE-AT ?auto_2557 ?auto_2560 ) ( CLEAR ?auto_2557 ) ( LIFTING ?auto_2559 ?auto_2558 ) ( IS-CRATE ?auto_2558 ) ( not ( = ?auto_2557 ?auto_2558 ) ) )
    :subtasks
    ( ( !DROP ?auto_2559 ?auto_2558 ?auto_2557 ?auto_2560 )
      ( MAKE-1CRATE-VERIFY ?auto_2557 ?auto_2558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2561 - SURFACE
      ?auto_2562 - SURFACE
    )
    :vars
    (
      ?auto_2563 - HOIST
      ?auto_2564 - PLACE
      ?auto_2565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2563 ?auto_2564 ) ( SURFACE-AT ?auto_2561 ?auto_2564 ) ( CLEAR ?auto_2561 ) ( IS-CRATE ?auto_2562 ) ( not ( = ?auto_2561 ?auto_2562 ) ) ( TRUCK-AT ?auto_2565 ?auto_2564 ) ( AVAILABLE ?auto_2563 ) ( IN ?auto_2562 ?auto_2565 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2563 ?auto_2562 ?auto_2565 ?auto_2564 )
      ( MAKE-1CRATE ?auto_2561 ?auto_2562 )
      ( MAKE-1CRATE-VERIFY ?auto_2561 ?auto_2562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2566 - SURFACE
      ?auto_2567 - SURFACE
    )
    :vars
    (
      ?auto_2570 - HOIST
      ?auto_2568 - PLACE
      ?auto_2569 - TRUCK
      ?auto_2571 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2570 ?auto_2568 ) ( SURFACE-AT ?auto_2566 ?auto_2568 ) ( CLEAR ?auto_2566 ) ( IS-CRATE ?auto_2567 ) ( not ( = ?auto_2566 ?auto_2567 ) ) ( AVAILABLE ?auto_2570 ) ( IN ?auto_2567 ?auto_2569 ) ( TRUCK-AT ?auto_2569 ?auto_2571 ) ( not ( = ?auto_2571 ?auto_2568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2569 ?auto_2571 ?auto_2568 )
      ( MAKE-1CRATE ?auto_2566 ?auto_2567 )
      ( MAKE-1CRATE-VERIFY ?auto_2566 ?auto_2567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2572 - SURFACE
      ?auto_2573 - SURFACE
    )
    :vars
    (
      ?auto_2575 - HOIST
      ?auto_2574 - PLACE
      ?auto_2576 - TRUCK
      ?auto_2577 - PLACE
      ?auto_2578 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2575 ?auto_2574 ) ( SURFACE-AT ?auto_2572 ?auto_2574 ) ( CLEAR ?auto_2572 ) ( IS-CRATE ?auto_2573 ) ( not ( = ?auto_2572 ?auto_2573 ) ) ( AVAILABLE ?auto_2575 ) ( TRUCK-AT ?auto_2576 ?auto_2577 ) ( not ( = ?auto_2577 ?auto_2574 ) ) ( HOIST-AT ?auto_2578 ?auto_2577 ) ( LIFTING ?auto_2578 ?auto_2573 ) ( not ( = ?auto_2575 ?auto_2578 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2578 ?auto_2573 ?auto_2576 ?auto_2577 )
      ( MAKE-1CRATE ?auto_2572 ?auto_2573 )
      ( MAKE-1CRATE-VERIFY ?auto_2572 ?auto_2573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2579 - SURFACE
      ?auto_2580 - SURFACE
    )
    :vars
    (
      ?auto_2583 - HOIST
      ?auto_2582 - PLACE
      ?auto_2585 - TRUCK
      ?auto_2581 - PLACE
      ?auto_2584 - HOIST
      ?auto_2586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2583 ?auto_2582 ) ( SURFACE-AT ?auto_2579 ?auto_2582 ) ( CLEAR ?auto_2579 ) ( IS-CRATE ?auto_2580 ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( AVAILABLE ?auto_2583 ) ( TRUCK-AT ?auto_2585 ?auto_2581 ) ( not ( = ?auto_2581 ?auto_2582 ) ) ( HOIST-AT ?auto_2584 ?auto_2581 ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( AVAILABLE ?auto_2584 ) ( SURFACE-AT ?auto_2580 ?auto_2581 ) ( ON ?auto_2580 ?auto_2586 ) ( CLEAR ?auto_2580 ) ( not ( = ?auto_2579 ?auto_2586 ) ) ( not ( = ?auto_2580 ?auto_2586 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2584 ?auto_2580 ?auto_2586 ?auto_2581 )
      ( MAKE-1CRATE ?auto_2579 ?auto_2580 )
      ( MAKE-1CRATE-VERIFY ?auto_2579 ?auto_2580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2587 - SURFACE
      ?auto_2588 - SURFACE
    )
    :vars
    (
      ?auto_2593 - HOIST
      ?auto_2592 - PLACE
      ?auto_2594 - PLACE
      ?auto_2589 - HOIST
      ?auto_2591 - SURFACE
      ?auto_2590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2593 ?auto_2592 ) ( SURFACE-AT ?auto_2587 ?auto_2592 ) ( CLEAR ?auto_2587 ) ( IS-CRATE ?auto_2588 ) ( not ( = ?auto_2587 ?auto_2588 ) ) ( AVAILABLE ?auto_2593 ) ( not ( = ?auto_2594 ?auto_2592 ) ) ( HOIST-AT ?auto_2589 ?auto_2594 ) ( not ( = ?auto_2593 ?auto_2589 ) ) ( AVAILABLE ?auto_2589 ) ( SURFACE-AT ?auto_2588 ?auto_2594 ) ( ON ?auto_2588 ?auto_2591 ) ( CLEAR ?auto_2588 ) ( not ( = ?auto_2587 ?auto_2591 ) ) ( not ( = ?auto_2588 ?auto_2591 ) ) ( TRUCK-AT ?auto_2590 ?auto_2592 ) )
    :subtasks
    ( ( !DRIVE ?auto_2590 ?auto_2592 ?auto_2594 )
      ( MAKE-1CRATE ?auto_2587 ?auto_2588 )
      ( MAKE-1CRATE-VERIFY ?auto_2587 ?auto_2588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2604 - SURFACE
      ?auto_2605 - SURFACE
      ?auto_2606 - SURFACE
    )
    :vars
    (
      ?auto_2608 - HOIST
      ?auto_2607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2608 ?auto_2607 ) ( SURFACE-AT ?auto_2605 ?auto_2607 ) ( CLEAR ?auto_2605 ) ( LIFTING ?auto_2608 ?auto_2606 ) ( IS-CRATE ?auto_2606 ) ( not ( = ?auto_2605 ?auto_2606 ) ) ( ON ?auto_2605 ?auto_2604 ) ( not ( = ?auto_2604 ?auto_2605 ) ) ( not ( = ?auto_2604 ?auto_2606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2605 ?auto_2606 )
      ( MAKE-2CRATE-VERIFY ?auto_2604 ?auto_2605 ?auto_2606 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2614 - SURFACE
      ?auto_2615 - SURFACE
      ?auto_2616 - SURFACE
    )
    :vars
    (
      ?auto_2619 - HOIST
      ?auto_2617 - PLACE
      ?auto_2618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2619 ?auto_2617 ) ( SURFACE-AT ?auto_2615 ?auto_2617 ) ( CLEAR ?auto_2615 ) ( IS-CRATE ?auto_2616 ) ( not ( = ?auto_2615 ?auto_2616 ) ) ( TRUCK-AT ?auto_2618 ?auto_2617 ) ( AVAILABLE ?auto_2619 ) ( IN ?auto_2616 ?auto_2618 ) ( ON ?auto_2615 ?auto_2614 ) ( not ( = ?auto_2614 ?auto_2615 ) ) ( not ( = ?auto_2614 ?auto_2616 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2615 ?auto_2616 )
      ( MAKE-2CRATE-VERIFY ?auto_2614 ?auto_2615 ?auto_2616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2620 - SURFACE
      ?auto_2621 - SURFACE
    )
    :vars
    (
      ?auto_2623 - HOIST
      ?auto_2624 - PLACE
      ?auto_2622 - TRUCK
      ?auto_2625 - SURFACE
      ?auto_2626 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2623 ?auto_2624 ) ( SURFACE-AT ?auto_2620 ?auto_2624 ) ( CLEAR ?auto_2620 ) ( IS-CRATE ?auto_2621 ) ( not ( = ?auto_2620 ?auto_2621 ) ) ( AVAILABLE ?auto_2623 ) ( IN ?auto_2621 ?auto_2622 ) ( ON ?auto_2620 ?auto_2625 ) ( not ( = ?auto_2625 ?auto_2620 ) ) ( not ( = ?auto_2625 ?auto_2621 ) ) ( TRUCK-AT ?auto_2622 ?auto_2626 ) ( not ( = ?auto_2626 ?auto_2624 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2622 ?auto_2626 ?auto_2624 )
      ( MAKE-2CRATE ?auto_2625 ?auto_2620 ?auto_2621 )
      ( MAKE-1CRATE-VERIFY ?auto_2620 ?auto_2621 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2627 - SURFACE
      ?auto_2628 - SURFACE
      ?auto_2629 - SURFACE
    )
    :vars
    (
      ?auto_2632 - HOIST
      ?auto_2633 - PLACE
      ?auto_2631 - TRUCK
      ?auto_2630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2632 ?auto_2633 ) ( SURFACE-AT ?auto_2628 ?auto_2633 ) ( CLEAR ?auto_2628 ) ( IS-CRATE ?auto_2629 ) ( not ( = ?auto_2628 ?auto_2629 ) ) ( AVAILABLE ?auto_2632 ) ( IN ?auto_2629 ?auto_2631 ) ( ON ?auto_2628 ?auto_2627 ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( not ( = ?auto_2627 ?auto_2629 ) ) ( TRUCK-AT ?auto_2631 ?auto_2630 ) ( not ( = ?auto_2630 ?auto_2633 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2628 ?auto_2629 )
      ( MAKE-2CRATE-VERIFY ?auto_2627 ?auto_2628 ?auto_2629 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2634 - SURFACE
      ?auto_2635 - SURFACE
    )
    :vars
    (
      ?auto_2636 - HOIST
      ?auto_2640 - PLACE
      ?auto_2637 - SURFACE
      ?auto_2638 - TRUCK
      ?auto_2639 - PLACE
      ?auto_2641 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2636 ?auto_2640 ) ( SURFACE-AT ?auto_2634 ?auto_2640 ) ( CLEAR ?auto_2634 ) ( IS-CRATE ?auto_2635 ) ( not ( = ?auto_2634 ?auto_2635 ) ) ( AVAILABLE ?auto_2636 ) ( ON ?auto_2634 ?auto_2637 ) ( not ( = ?auto_2637 ?auto_2634 ) ) ( not ( = ?auto_2637 ?auto_2635 ) ) ( TRUCK-AT ?auto_2638 ?auto_2639 ) ( not ( = ?auto_2639 ?auto_2640 ) ) ( HOIST-AT ?auto_2641 ?auto_2639 ) ( LIFTING ?auto_2641 ?auto_2635 ) ( not ( = ?auto_2636 ?auto_2641 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2641 ?auto_2635 ?auto_2638 ?auto_2639 )
      ( MAKE-2CRATE ?auto_2637 ?auto_2634 ?auto_2635 )
      ( MAKE-1CRATE-VERIFY ?auto_2634 ?auto_2635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2642 - SURFACE
      ?auto_2643 - SURFACE
      ?auto_2644 - SURFACE
    )
    :vars
    (
      ?auto_2647 - HOIST
      ?auto_2645 - PLACE
      ?auto_2648 - TRUCK
      ?auto_2649 - PLACE
      ?auto_2646 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2647 ?auto_2645 ) ( SURFACE-AT ?auto_2643 ?auto_2645 ) ( CLEAR ?auto_2643 ) ( IS-CRATE ?auto_2644 ) ( not ( = ?auto_2643 ?auto_2644 ) ) ( AVAILABLE ?auto_2647 ) ( ON ?auto_2643 ?auto_2642 ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2644 ) ) ( TRUCK-AT ?auto_2648 ?auto_2649 ) ( not ( = ?auto_2649 ?auto_2645 ) ) ( HOIST-AT ?auto_2646 ?auto_2649 ) ( LIFTING ?auto_2646 ?auto_2644 ) ( not ( = ?auto_2647 ?auto_2646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2643 ?auto_2644 )
      ( MAKE-2CRATE-VERIFY ?auto_2642 ?auto_2643 ?auto_2644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2650 - SURFACE
      ?auto_2651 - SURFACE
    )
    :vars
    (
      ?auto_2652 - HOIST
      ?auto_2654 - PLACE
      ?auto_2657 - SURFACE
      ?auto_2656 - TRUCK
      ?auto_2653 - PLACE
      ?auto_2655 - HOIST
      ?auto_2658 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2652 ?auto_2654 ) ( SURFACE-AT ?auto_2650 ?auto_2654 ) ( CLEAR ?auto_2650 ) ( IS-CRATE ?auto_2651 ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( AVAILABLE ?auto_2652 ) ( ON ?auto_2650 ?auto_2657 ) ( not ( = ?auto_2657 ?auto_2650 ) ) ( not ( = ?auto_2657 ?auto_2651 ) ) ( TRUCK-AT ?auto_2656 ?auto_2653 ) ( not ( = ?auto_2653 ?auto_2654 ) ) ( HOIST-AT ?auto_2655 ?auto_2653 ) ( not ( = ?auto_2652 ?auto_2655 ) ) ( AVAILABLE ?auto_2655 ) ( SURFACE-AT ?auto_2651 ?auto_2653 ) ( ON ?auto_2651 ?auto_2658 ) ( CLEAR ?auto_2651 ) ( not ( = ?auto_2650 ?auto_2658 ) ) ( not ( = ?auto_2651 ?auto_2658 ) ) ( not ( = ?auto_2657 ?auto_2658 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2655 ?auto_2651 ?auto_2658 ?auto_2653 )
      ( MAKE-2CRATE ?auto_2657 ?auto_2650 ?auto_2651 )
      ( MAKE-1CRATE-VERIFY ?auto_2650 ?auto_2651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2659 - SURFACE
      ?auto_2660 - SURFACE
      ?auto_2661 - SURFACE
    )
    :vars
    (
      ?auto_2666 - HOIST
      ?auto_2665 - PLACE
      ?auto_2664 - TRUCK
      ?auto_2663 - PLACE
      ?auto_2662 - HOIST
      ?auto_2667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2666 ?auto_2665 ) ( SURFACE-AT ?auto_2660 ?auto_2665 ) ( CLEAR ?auto_2660 ) ( IS-CRATE ?auto_2661 ) ( not ( = ?auto_2660 ?auto_2661 ) ) ( AVAILABLE ?auto_2666 ) ( ON ?auto_2660 ?auto_2659 ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( not ( = ?auto_2659 ?auto_2661 ) ) ( TRUCK-AT ?auto_2664 ?auto_2663 ) ( not ( = ?auto_2663 ?auto_2665 ) ) ( HOIST-AT ?auto_2662 ?auto_2663 ) ( not ( = ?auto_2666 ?auto_2662 ) ) ( AVAILABLE ?auto_2662 ) ( SURFACE-AT ?auto_2661 ?auto_2663 ) ( ON ?auto_2661 ?auto_2667 ) ( CLEAR ?auto_2661 ) ( not ( = ?auto_2660 ?auto_2667 ) ) ( not ( = ?auto_2661 ?auto_2667 ) ) ( not ( = ?auto_2659 ?auto_2667 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2660 ?auto_2661 )
      ( MAKE-2CRATE-VERIFY ?auto_2659 ?auto_2660 ?auto_2661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2668 - SURFACE
      ?auto_2669 - SURFACE
    )
    :vars
    (
      ?auto_2670 - HOIST
      ?auto_2673 - PLACE
      ?auto_2672 - SURFACE
      ?auto_2671 - PLACE
      ?auto_2676 - HOIST
      ?auto_2675 - SURFACE
      ?auto_2674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2670 ?auto_2673 ) ( SURFACE-AT ?auto_2668 ?auto_2673 ) ( CLEAR ?auto_2668 ) ( IS-CRATE ?auto_2669 ) ( not ( = ?auto_2668 ?auto_2669 ) ) ( AVAILABLE ?auto_2670 ) ( ON ?auto_2668 ?auto_2672 ) ( not ( = ?auto_2672 ?auto_2668 ) ) ( not ( = ?auto_2672 ?auto_2669 ) ) ( not ( = ?auto_2671 ?auto_2673 ) ) ( HOIST-AT ?auto_2676 ?auto_2671 ) ( not ( = ?auto_2670 ?auto_2676 ) ) ( AVAILABLE ?auto_2676 ) ( SURFACE-AT ?auto_2669 ?auto_2671 ) ( ON ?auto_2669 ?auto_2675 ) ( CLEAR ?auto_2669 ) ( not ( = ?auto_2668 ?auto_2675 ) ) ( not ( = ?auto_2669 ?auto_2675 ) ) ( not ( = ?auto_2672 ?auto_2675 ) ) ( TRUCK-AT ?auto_2674 ?auto_2673 ) )
    :subtasks
    ( ( !DRIVE ?auto_2674 ?auto_2673 ?auto_2671 )
      ( MAKE-2CRATE ?auto_2672 ?auto_2668 ?auto_2669 )
      ( MAKE-1CRATE-VERIFY ?auto_2668 ?auto_2669 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2677 - SURFACE
      ?auto_2678 - SURFACE
      ?auto_2679 - SURFACE
    )
    :vars
    (
      ?auto_2685 - HOIST
      ?auto_2684 - PLACE
      ?auto_2681 - PLACE
      ?auto_2680 - HOIST
      ?auto_2682 - SURFACE
      ?auto_2683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2685 ?auto_2684 ) ( SURFACE-AT ?auto_2678 ?auto_2684 ) ( CLEAR ?auto_2678 ) ( IS-CRATE ?auto_2679 ) ( not ( = ?auto_2678 ?auto_2679 ) ) ( AVAILABLE ?auto_2685 ) ( ON ?auto_2678 ?auto_2677 ) ( not ( = ?auto_2677 ?auto_2678 ) ) ( not ( = ?auto_2677 ?auto_2679 ) ) ( not ( = ?auto_2681 ?auto_2684 ) ) ( HOIST-AT ?auto_2680 ?auto_2681 ) ( not ( = ?auto_2685 ?auto_2680 ) ) ( AVAILABLE ?auto_2680 ) ( SURFACE-AT ?auto_2679 ?auto_2681 ) ( ON ?auto_2679 ?auto_2682 ) ( CLEAR ?auto_2679 ) ( not ( = ?auto_2678 ?auto_2682 ) ) ( not ( = ?auto_2679 ?auto_2682 ) ) ( not ( = ?auto_2677 ?auto_2682 ) ) ( TRUCK-AT ?auto_2683 ?auto_2684 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2678 ?auto_2679 )
      ( MAKE-2CRATE-VERIFY ?auto_2677 ?auto_2678 ?auto_2679 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2686 - SURFACE
      ?auto_2687 - SURFACE
    )
    :vars
    (
      ?auto_2692 - HOIST
      ?auto_2691 - PLACE
      ?auto_2688 - SURFACE
      ?auto_2690 - PLACE
      ?auto_2693 - HOIST
      ?auto_2689 - SURFACE
      ?auto_2694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2692 ?auto_2691 ) ( IS-CRATE ?auto_2687 ) ( not ( = ?auto_2686 ?auto_2687 ) ) ( not ( = ?auto_2688 ?auto_2686 ) ) ( not ( = ?auto_2688 ?auto_2687 ) ) ( not ( = ?auto_2690 ?auto_2691 ) ) ( HOIST-AT ?auto_2693 ?auto_2690 ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( AVAILABLE ?auto_2693 ) ( SURFACE-AT ?auto_2687 ?auto_2690 ) ( ON ?auto_2687 ?auto_2689 ) ( CLEAR ?auto_2687 ) ( not ( = ?auto_2686 ?auto_2689 ) ) ( not ( = ?auto_2687 ?auto_2689 ) ) ( not ( = ?auto_2688 ?auto_2689 ) ) ( TRUCK-AT ?auto_2694 ?auto_2691 ) ( SURFACE-AT ?auto_2688 ?auto_2691 ) ( CLEAR ?auto_2688 ) ( LIFTING ?auto_2692 ?auto_2686 ) ( IS-CRATE ?auto_2686 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2688 ?auto_2686 )
      ( MAKE-2CRATE ?auto_2688 ?auto_2686 ?auto_2687 )
      ( MAKE-1CRATE-VERIFY ?auto_2686 ?auto_2687 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2695 - SURFACE
      ?auto_2696 - SURFACE
      ?auto_2697 - SURFACE
    )
    :vars
    (
      ?auto_2699 - HOIST
      ?auto_2702 - PLACE
      ?auto_2698 - PLACE
      ?auto_2701 - HOIST
      ?auto_2700 - SURFACE
      ?auto_2703 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2699 ?auto_2702 ) ( IS-CRATE ?auto_2697 ) ( not ( = ?auto_2696 ?auto_2697 ) ) ( not ( = ?auto_2695 ?auto_2696 ) ) ( not ( = ?auto_2695 ?auto_2697 ) ) ( not ( = ?auto_2698 ?auto_2702 ) ) ( HOIST-AT ?auto_2701 ?auto_2698 ) ( not ( = ?auto_2699 ?auto_2701 ) ) ( AVAILABLE ?auto_2701 ) ( SURFACE-AT ?auto_2697 ?auto_2698 ) ( ON ?auto_2697 ?auto_2700 ) ( CLEAR ?auto_2697 ) ( not ( = ?auto_2696 ?auto_2700 ) ) ( not ( = ?auto_2697 ?auto_2700 ) ) ( not ( = ?auto_2695 ?auto_2700 ) ) ( TRUCK-AT ?auto_2703 ?auto_2702 ) ( SURFACE-AT ?auto_2695 ?auto_2702 ) ( CLEAR ?auto_2695 ) ( LIFTING ?auto_2699 ?auto_2696 ) ( IS-CRATE ?auto_2696 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2696 ?auto_2697 )
      ( MAKE-2CRATE-VERIFY ?auto_2695 ?auto_2696 ?auto_2697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2704 - SURFACE
      ?auto_2705 - SURFACE
    )
    :vars
    (
      ?auto_2709 - HOIST
      ?auto_2706 - PLACE
      ?auto_2710 - SURFACE
      ?auto_2711 - PLACE
      ?auto_2712 - HOIST
      ?auto_2707 - SURFACE
      ?auto_2708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2709 ?auto_2706 ) ( IS-CRATE ?auto_2705 ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( not ( = ?auto_2710 ?auto_2704 ) ) ( not ( = ?auto_2710 ?auto_2705 ) ) ( not ( = ?auto_2711 ?auto_2706 ) ) ( HOIST-AT ?auto_2712 ?auto_2711 ) ( not ( = ?auto_2709 ?auto_2712 ) ) ( AVAILABLE ?auto_2712 ) ( SURFACE-AT ?auto_2705 ?auto_2711 ) ( ON ?auto_2705 ?auto_2707 ) ( CLEAR ?auto_2705 ) ( not ( = ?auto_2704 ?auto_2707 ) ) ( not ( = ?auto_2705 ?auto_2707 ) ) ( not ( = ?auto_2710 ?auto_2707 ) ) ( TRUCK-AT ?auto_2708 ?auto_2706 ) ( SURFACE-AT ?auto_2710 ?auto_2706 ) ( CLEAR ?auto_2710 ) ( IS-CRATE ?auto_2704 ) ( AVAILABLE ?auto_2709 ) ( IN ?auto_2704 ?auto_2708 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2709 ?auto_2704 ?auto_2708 ?auto_2706 )
      ( MAKE-2CRATE ?auto_2710 ?auto_2704 ?auto_2705 )
      ( MAKE-1CRATE-VERIFY ?auto_2704 ?auto_2705 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2713 - SURFACE
      ?auto_2714 - SURFACE
      ?auto_2715 - SURFACE
    )
    :vars
    (
      ?auto_2721 - HOIST
      ?auto_2720 - PLACE
      ?auto_2719 - PLACE
      ?auto_2718 - HOIST
      ?auto_2716 - SURFACE
      ?auto_2717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2721 ?auto_2720 ) ( IS-CRATE ?auto_2715 ) ( not ( = ?auto_2714 ?auto_2715 ) ) ( not ( = ?auto_2713 ?auto_2714 ) ) ( not ( = ?auto_2713 ?auto_2715 ) ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( HOIST-AT ?auto_2718 ?auto_2719 ) ( not ( = ?auto_2721 ?auto_2718 ) ) ( AVAILABLE ?auto_2718 ) ( SURFACE-AT ?auto_2715 ?auto_2719 ) ( ON ?auto_2715 ?auto_2716 ) ( CLEAR ?auto_2715 ) ( not ( = ?auto_2714 ?auto_2716 ) ) ( not ( = ?auto_2715 ?auto_2716 ) ) ( not ( = ?auto_2713 ?auto_2716 ) ) ( TRUCK-AT ?auto_2717 ?auto_2720 ) ( SURFACE-AT ?auto_2713 ?auto_2720 ) ( CLEAR ?auto_2713 ) ( IS-CRATE ?auto_2714 ) ( AVAILABLE ?auto_2721 ) ( IN ?auto_2714 ?auto_2717 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2714 ?auto_2715 )
      ( MAKE-2CRATE-VERIFY ?auto_2713 ?auto_2714 ?auto_2715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2758 - SURFACE
      ?auto_2759 - SURFACE
    )
    :vars
    (
      ?auto_2762 - HOIST
      ?auto_2766 - PLACE
      ?auto_2761 - SURFACE
      ?auto_2764 - PLACE
      ?auto_2763 - HOIST
      ?auto_2760 - SURFACE
      ?auto_2765 - TRUCK
      ?auto_2767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2762 ?auto_2766 ) ( SURFACE-AT ?auto_2758 ?auto_2766 ) ( CLEAR ?auto_2758 ) ( IS-CRATE ?auto_2759 ) ( not ( = ?auto_2758 ?auto_2759 ) ) ( AVAILABLE ?auto_2762 ) ( ON ?auto_2758 ?auto_2761 ) ( not ( = ?auto_2761 ?auto_2758 ) ) ( not ( = ?auto_2761 ?auto_2759 ) ) ( not ( = ?auto_2764 ?auto_2766 ) ) ( HOIST-AT ?auto_2763 ?auto_2764 ) ( not ( = ?auto_2762 ?auto_2763 ) ) ( AVAILABLE ?auto_2763 ) ( SURFACE-AT ?auto_2759 ?auto_2764 ) ( ON ?auto_2759 ?auto_2760 ) ( CLEAR ?auto_2759 ) ( not ( = ?auto_2758 ?auto_2760 ) ) ( not ( = ?auto_2759 ?auto_2760 ) ) ( not ( = ?auto_2761 ?auto_2760 ) ) ( TRUCK-AT ?auto_2765 ?auto_2767 ) ( not ( = ?auto_2767 ?auto_2766 ) ) ( not ( = ?auto_2764 ?auto_2767 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2765 ?auto_2767 ?auto_2766 )
      ( MAKE-1CRATE ?auto_2758 ?auto_2759 )
      ( MAKE-1CRATE-VERIFY ?auto_2758 ?auto_2759 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2797 - SURFACE
      ?auto_2798 - SURFACE
      ?auto_2799 - SURFACE
      ?auto_2800 - SURFACE
    )
    :vars
    (
      ?auto_2801 - HOIST
      ?auto_2802 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2801 ?auto_2802 ) ( SURFACE-AT ?auto_2799 ?auto_2802 ) ( CLEAR ?auto_2799 ) ( LIFTING ?auto_2801 ?auto_2800 ) ( IS-CRATE ?auto_2800 ) ( not ( = ?auto_2799 ?auto_2800 ) ) ( ON ?auto_2798 ?auto_2797 ) ( ON ?auto_2799 ?auto_2798 ) ( not ( = ?auto_2797 ?auto_2798 ) ) ( not ( = ?auto_2797 ?auto_2799 ) ) ( not ( = ?auto_2797 ?auto_2800 ) ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( not ( = ?auto_2798 ?auto_2800 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2799 ?auto_2800 )
      ( MAKE-3CRATE-VERIFY ?auto_2797 ?auto_2798 ?auto_2799 ?auto_2800 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2814 - SURFACE
      ?auto_2815 - SURFACE
      ?auto_2816 - SURFACE
      ?auto_2817 - SURFACE
    )
    :vars
    (
      ?auto_2820 - HOIST
      ?auto_2818 - PLACE
      ?auto_2819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2820 ?auto_2818 ) ( SURFACE-AT ?auto_2816 ?auto_2818 ) ( CLEAR ?auto_2816 ) ( IS-CRATE ?auto_2817 ) ( not ( = ?auto_2816 ?auto_2817 ) ) ( TRUCK-AT ?auto_2819 ?auto_2818 ) ( AVAILABLE ?auto_2820 ) ( IN ?auto_2817 ?auto_2819 ) ( ON ?auto_2816 ?auto_2815 ) ( not ( = ?auto_2815 ?auto_2816 ) ) ( not ( = ?auto_2815 ?auto_2817 ) ) ( ON ?auto_2815 ?auto_2814 ) ( not ( = ?auto_2814 ?auto_2815 ) ) ( not ( = ?auto_2814 ?auto_2816 ) ) ( not ( = ?auto_2814 ?auto_2817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2815 ?auto_2816 ?auto_2817 )
      ( MAKE-3CRATE-VERIFY ?auto_2814 ?auto_2815 ?auto_2816 ?auto_2817 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2835 - SURFACE
      ?auto_2836 - SURFACE
      ?auto_2837 - SURFACE
      ?auto_2838 - SURFACE
    )
    :vars
    (
      ?auto_2839 - HOIST
      ?auto_2840 - PLACE
      ?auto_2841 - TRUCK
      ?auto_2842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2839 ?auto_2840 ) ( SURFACE-AT ?auto_2837 ?auto_2840 ) ( CLEAR ?auto_2837 ) ( IS-CRATE ?auto_2838 ) ( not ( = ?auto_2837 ?auto_2838 ) ) ( AVAILABLE ?auto_2839 ) ( IN ?auto_2838 ?auto_2841 ) ( ON ?auto_2837 ?auto_2836 ) ( not ( = ?auto_2836 ?auto_2837 ) ) ( not ( = ?auto_2836 ?auto_2838 ) ) ( TRUCK-AT ?auto_2841 ?auto_2842 ) ( not ( = ?auto_2842 ?auto_2840 ) ) ( ON ?auto_2836 ?auto_2835 ) ( not ( = ?auto_2835 ?auto_2836 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2835 ?auto_2838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2836 ?auto_2837 ?auto_2838 )
      ( MAKE-3CRATE-VERIFY ?auto_2835 ?auto_2836 ?auto_2837 ?auto_2838 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2859 - SURFACE
      ?auto_2860 - SURFACE
      ?auto_2861 - SURFACE
      ?auto_2862 - SURFACE
    )
    :vars
    (
      ?auto_2865 - HOIST
      ?auto_2863 - PLACE
      ?auto_2866 - TRUCK
      ?auto_2867 - PLACE
      ?auto_2864 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2865 ?auto_2863 ) ( SURFACE-AT ?auto_2861 ?auto_2863 ) ( CLEAR ?auto_2861 ) ( IS-CRATE ?auto_2862 ) ( not ( = ?auto_2861 ?auto_2862 ) ) ( AVAILABLE ?auto_2865 ) ( ON ?auto_2861 ?auto_2860 ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( not ( = ?auto_2860 ?auto_2862 ) ) ( TRUCK-AT ?auto_2866 ?auto_2867 ) ( not ( = ?auto_2867 ?auto_2863 ) ) ( HOIST-AT ?auto_2864 ?auto_2867 ) ( LIFTING ?auto_2864 ?auto_2862 ) ( not ( = ?auto_2865 ?auto_2864 ) ) ( ON ?auto_2860 ?auto_2859 ) ( not ( = ?auto_2859 ?auto_2860 ) ) ( not ( = ?auto_2859 ?auto_2861 ) ) ( not ( = ?auto_2859 ?auto_2862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2860 ?auto_2861 ?auto_2862 )
      ( MAKE-3CRATE-VERIFY ?auto_2859 ?auto_2860 ?auto_2861 ?auto_2862 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2886 - SURFACE
      ?auto_2887 - SURFACE
      ?auto_2888 - SURFACE
      ?auto_2889 - SURFACE
    )
    :vars
    (
      ?auto_2894 - HOIST
      ?auto_2895 - PLACE
      ?auto_2893 - TRUCK
      ?auto_2891 - PLACE
      ?auto_2892 - HOIST
      ?auto_2890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2894 ?auto_2895 ) ( SURFACE-AT ?auto_2888 ?auto_2895 ) ( CLEAR ?auto_2888 ) ( IS-CRATE ?auto_2889 ) ( not ( = ?auto_2888 ?auto_2889 ) ) ( AVAILABLE ?auto_2894 ) ( ON ?auto_2888 ?auto_2887 ) ( not ( = ?auto_2887 ?auto_2888 ) ) ( not ( = ?auto_2887 ?auto_2889 ) ) ( TRUCK-AT ?auto_2893 ?auto_2891 ) ( not ( = ?auto_2891 ?auto_2895 ) ) ( HOIST-AT ?auto_2892 ?auto_2891 ) ( not ( = ?auto_2894 ?auto_2892 ) ) ( AVAILABLE ?auto_2892 ) ( SURFACE-AT ?auto_2889 ?auto_2891 ) ( ON ?auto_2889 ?auto_2890 ) ( CLEAR ?auto_2889 ) ( not ( = ?auto_2888 ?auto_2890 ) ) ( not ( = ?auto_2889 ?auto_2890 ) ) ( not ( = ?auto_2887 ?auto_2890 ) ) ( ON ?auto_2887 ?auto_2886 ) ( not ( = ?auto_2886 ?auto_2887 ) ) ( not ( = ?auto_2886 ?auto_2888 ) ) ( not ( = ?auto_2886 ?auto_2889 ) ) ( not ( = ?auto_2886 ?auto_2890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2887 ?auto_2888 ?auto_2889 )
      ( MAKE-3CRATE-VERIFY ?auto_2886 ?auto_2887 ?auto_2888 ?auto_2889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2914 - SURFACE
      ?auto_2915 - SURFACE
      ?auto_2916 - SURFACE
      ?auto_2917 - SURFACE
    )
    :vars
    (
      ?auto_2920 - HOIST
      ?auto_2919 - PLACE
      ?auto_2918 - PLACE
      ?auto_2921 - HOIST
      ?auto_2923 - SURFACE
      ?auto_2922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2920 ?auto_2919 ) ( SURFACE-AT ?auto_2916 ?auto_2919 ) ( CLEAR ?auto_2916 ) ( IS-CRATE ?auto_2917 ) ( not ( = ?auto_2916 ?auto_2917 ) ) ( AVAILABLE ?auto_2920 ) ( ON ?auto_2916 ?auto_2915 ) ( not ( = ?auto_2915 ?auto_2916 ) ) ( not ( = ?auto_2915 ?auto_2917 ) ) ( not ( = ?auto_2918 ?auto_2919 ) ) ( HOIST-AT ?auto_2921 ?auto_2918 ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( AVAILABLE ?auto_2921 ) ( SURFACE-AT ?auto_2917 ?auto_2918 ) ( ON ?auto_2917 ?auto_2923 ) ( CLEAR ?auto_2917 ) ( not ( = ?auto_2916 ?auto_2923 ) ) ( not ( = ?auto_2917 ?auto_2923 ) ) ( not ( = ?auto_2915 ?auto_2923 ) ) ( TRUCK-AT ?auto_2922 ?auto_2919 ) ( ON ?auto_2915 ?auto_2914 ) ( not ( = ?auto_2914 ?auto_2915 ) ) ( not ( = ?auto_2914 ?auto_2916 ) ) ( not ( = ?auto_2914 ?auto_2917 ) ) ( not ( = ?auto_2914 ?auto_2923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2915 ?auto_2916 ?auto_2917 )
      ( MAKE-3CRATE-VERIFY ?auto_2914 ?auto_2915 ?auto_2916 ?auto_2917 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2942 - SURFACE
      ?auto_2943 - SURFACE
      ?auto_2944 - SURFACE
      ?auto_2945 - SURFACE
    )
    :vars
    (
      ?auto_2951 - HOIST
      ?auto_2946 - PLACE
      ?auto_2949 - PLACE
      ?auto_2948 - HOIST
      ?auto_2947 - SURFACE
      ?auto_2950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2951 ?auto_2946 ) ( IS-CRATE ?auto_2945 ) ( not ( = ?auto_2944 ?auto_2945 ) ) ( not ( = ?auto_2943 ?auto_2944 ) ) ( not ( = ?auto_2943 ?auto_2945 ) ) ( not ( = ?auto_2949 ?auto_2946 ) ) ( HOIST-AT ?auto_2948 ?auto_2949 ) ( not ( = ?auto_2951 ?auto_2948 ) ) ( AVAILABLE ?auto_2948 ) ( SURFACE-AT ?auto_2945 ?auto_2949 ) ( ON ?auto_2945 ?auto_2947 ) ( CLEAR ?auto_2945 ) ( not ( = ?auto_2944 ?auto_2947 ) ) ( not ( = ?auto_2945 ?auto_2947 ) ) ( not ( = ?auto_2943 ?auto_2947 ) ) ( TRUCK-AT ?auto_2950 ?auto_2946 ) ( SURFACE-AT ?auto_2943 ?auto_2946 ) ( CLEAR ?auto_2943 ) ( LIFTING ?auto_2951 ?auto_2944 ) ( IS-CRATE ?auto_2944 ) ( ON ?auto_2943 ?auto_2942 ) ( not ( = ?auto_2942 ?auto_2943 ) ) ( not ( = ?auto_2942 ?auto_2944 ) ) ( not ( = ?auto_2942 ?auto_2945 ) ) ( not ( = ?auto_2942 ?auto_2947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2943 ?auto_2944 ?auto_2945 )
      ( MAKE-3CRATE-VERIFY ?auto_2942 ?auto_2943 ?auto_2944 ?auto_2945 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2970 - SURFACE
      ?auto_2971 - SURFACE
      ?auto_2972 - SURFACE
      ?auto_2973 - SURFACE
    )
    :vars
    (
      ?auto_2979 - HOIST
      ?auto_2974 - PLACE
      ?auto_2977 - PLACE
      ?auto_2976 - HOIST
      ?auto_2975 - SURFACE
      ?auto_2978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2979 ?auto_2974 ) ( IS-CRATE ?auto_2973 ) ( not ( = ?auto_2972 ?auto_2973 ) ) ( not ( = ?auto_2971 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2973 ) ) ( not ( = ?auto_2977 ?auto_2974 ) ) ( HOIST-AT ?auto_2976 ?auto_2977 ) ( not ( = ?auto_2979 ?auto_2976 ) ) ( AVAILABLE ?auto_2976 ) ( SURFACE-AT ?auto_2973 ?auto_2977 ) ( ON ?auto_2973 ?auto_2975 ) ( CLEAR ?auto_2973 ) ( not ( = ?auto_2972 ?auto_2975 ) ) ( not ( = ?auto_2973 ?auto_2975 ) ) ( not ( = ?auto_2971 ?auto_2975 ) ) ( TRUCK-AT ?auto_2978 ?auto_2974 ) ( SURFACE-AT ?auto_2971 ?auto_2974 ) ( CLEAR ?auto_2971 ) ( IS-CRATE ?auto_2972 ) ( AVAILABLE ?auto_2979 ) ( IN ?auto_2972 ?auto_2978 ) ( ON ?auto_2971 ?auto_2970 ) ( not ( = ?auto_2970 ?auto_2971 ) ) ( not ( = ?auto_2970 ?auto_2972 ) ) ( not ( = ?auto_2970 ?auto_2973 ) ) ( not ( = ?auto_2970 ?auto_2975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2971 ?auto_2972 ?auto_2973 )
      ( MAKE-3CRATE-VERIFY ?auto_2970 ?auto_2971 ?auto_2972 ?auto_2973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3155 - SURFACE
      ?auto_3156 - SURFACE
    )
    :vars
    (
      ?auto_3163 - HOIST
      ?auto_3158 - PLACE
      ?auto_3159 - SURFACE
      ?auto_3157 - TRUCK
      ?auto_3161 - PLACE
      ?auto_3160 - HOIST
      ?auto_3162 - SURFACE
      ?auto_3164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3163 ?auto_3158 ) ( SURFACE-AT ?auto_3155 ?auto_3158 ) ( CLEAR ?auto_3155 ) ( IS-CRATE ?auto_3156 ) ( not ( = ?auto_3155 ?auto_3156 ) ) ( AVAILABLE ?auto_3163 ) ( ON ?auto_3155 ?auto_3159 ) ( not ( = ?auto_3159 ?auto_3155 ) ) ( not ( = ?auto_3159 ?auto_3156 ) ) ( TRUCK-AT ?auto_3157 ?auto_3161 ) ( not ( = ?auto_3161 ?auto_3158 ) ) ( HOIST-AT ?auto_3160 ?auto_3161 ) ( not ( = ?auto_3163 ?auto_3160 ) ) ( SURFACE-AT ?auto_3156 ?auto_3161 ) ( ON ?auto_3156 ?auto_3162 ) ( CLEAR ?auto_3156 ) ( not ( = ?auto_3155 ?auto_3162 ) ) ( not ( = ?auto_3156 ?auto_3162 ) ) ( not ( = ?auto_3159 ?auto_3162 ) ) ( LIFTING ?auto_3160 ?auto_3164 ) ( IS-CRATE ?auto_3164 ) ( not ( = ?auto_3155 ?auto_3164 ) ) ( not ( = ?auto_3156 ?auto_3164 ) ) ( not ( = ?auto_3159 ?auto_3164 ) ) ( not ( = ?auto_3162 ?auto_3164 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3160 ?auto_3164 ?auto_3157 ?auto_3161 )
      ( MAKE-1CRATE ?auto_3155 ?auto_3156 )
      ( MAKE-1CRATE-VERIFY ?auto_3155 ?auto_3156 ) )
  )

)

