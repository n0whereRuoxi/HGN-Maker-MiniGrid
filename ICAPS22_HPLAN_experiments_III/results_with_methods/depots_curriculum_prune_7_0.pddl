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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2528 - SURFACE
      ?auto_2529 - SURFACE
      ?auto_2530 - SURFACE
    )
    :vars
    (
      ?auto_2536 - HOIST
      ?auto_2533 - PLACE
      ?auto_2535 - PLACE
      ?auto_2532 - HOIST
      ?auto_2531 - SURFACE
      ?auto_2537 - PLACE
      ?auto_2539 - HOIST
      ?auto_2538 - SURFACE
      ?auto_2534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2536 ?auto_2533 ) ( IS-CRATE ?auto_2530 ) ( not ( = ?auto_2535 ?auto_2533 ) ) ( HOIST-AT ?auto_2532 ?auto_2535 ) ( AVAILABLE ?auto_2532 ) ( SURFACE-AT ?auto_2530 ?auto_2535 ) ( ON ?auto_2530 ?auto_2531 ) ( CLEAR ?auto_2530 ) ( not ( = ?auto_2529 ?auto_2530 ) ) ( not ( = ?auto_2529 ?auto_2531 ) ) ( not ( = ?auto_2530 ?auto_2531 ) ) ( not ( = ?auto_2536 ?auto_2532 ) ) ( SURFACE-AT ?auto_2528 ?auto_2533 ) ( CLEAR ?auto_2528 ) ( IS-CRATE ?auto_2529 ) ( AVAILABLE ?auto_2536 ) ( not ( = ?auto_2537 ?auto_2533 ) ) ( HOIST-AT ?auto_2539 ?auto_2537 ) ( AVAILABLE ?auto_2539 ) ( SURFACE-AT ?auto_2529 ?auto_2537 ) ( ON ?auto_2529 ?auto_2538 ) ( CLEAR ?auto_2529 ) ( TRUCK-AT ?auto_2534 ?auto_2533 ) ( not ( = ?auto_2528 ?auto_2529 ) ) ( not ( = ?auto_2528 ?auto_2538 ) ) ( not ( = ?auto_2529 ?auto_2538 ) ) ( not ( = ?auto_2536 ?auto_2539 ) ) ( not ( = ?auto_2528 ?auto_2530 ) ) ( not ( = ?auto_2528 ?auto_2531 ) ) ( not ( = ?auto_2530 ?auto_2538 ) ) ( not ( = ?auto_2535 ?auto_2537 ) ) ( not ( = ?auto_2532 ?auto_2539 ) ) ( not ( = ?auto_2531 ?auto_2538 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2528 ?auto_2529 )
      ( MAKE-1CRATE ?auto_2529 ?auto_2530 )
      ( MAKE-2CRATE-VERIFY ?auto_2528 ?auto_2529 ?auto_2530 ) )
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
      ?auto_2560 - HOIST
      ?auto_2563 - PLACE
      ?auto_2558 - PLACE
      ?auto_2562 - HOIST
      ?auto_2559 - SURFACE
      ?auto_2567 - PLACE
      ?auto_2566 - HOIST
      ?auto_2565 - SURFACE
      ?auto_2564 - SURFACE
      ?auto_2561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2560 ?auto_2563 ) ( IS-CRATE ?auto_2557 ) ( not ( = ?auto_2558 ?auto_2563 ) ) ( HOIST-AT ?auto_2562 ?auto_2558 ) ( SURFACE-AT ?auto_2557 ?auto_2558 ) ( ON ?auto_2557 ?auto_2559 ) ( CLEAR ?auto_2557 ) ( not ( = ?auto_2556 ?auto_2557 ) ) ( not ( = ?auto_2556 ?auto_2559 ) ) ( not ( = ?auto_2557 ?auto_2559 ) ) ( not ( = ?auto_2560 ?auto_2562 ) ) ( IS-CRATE ?auto_2556 ) ( not ( = ?auto_2567 ?auto_2563 ) ) ( HOIST-AT ?auto_2566 ?auto_2567 ) ( AVAILABLE ?auto_2566 ) ( SURFACE-AT ?auto_2556 ?auto_2567 ) ( ON ?auto_2556 ?auto_2565 ) ( CLEAR ?auto_2556 ) ( not ( = ?auto_2555 ?auto_2556 ) ) ( not ( = ?auto_2555 ?auto_2565 ) ) ( not ( = ?auto_2556 ?auto_2565 ) ) ( not ( = ?auto_2560 ?auto_2566 ) ) ( SURFACE-AT ?auto_2554 ?auto_2563 ) ( CLEAR ?auto_2554 ) ( IS-CRATE ?auto_2555 ) ( AVAILABLE ?auto_2560 ) ( AVAILABLE ?auto_2562 ) ( SURFACE-AT ?auto_2555 ?auto_2558 ) ( ON ?auto_2555 ?auto_2564 ) ( CLEAR ?auto_2555 ) ( TRUCK-AT ?auto_2561 ?auto_2563 ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2564 ) ) ( not ( = ?auto_2555 ?auto_2564 ) ) ( not ( = ?auto_2554 ?auto_2556 ) ) ( not ( = ?auto_2554 ?auto_2565 ) ) ( not ( = ?auto_2556 ?auto_2564 ) ) ( not ( = ?auto_2567 ?auto_2558 ) ) ( not ( = ?auto_2566 ?auto_2562 ) ) ( not ( = ?auto_2565 ?auto_2564 ) ) ( not ( = ?auto_2554 ?auto_2557 ) ) ( not ( = ?auto_2554 ?auto_2559 ) ) ( not ( = ?auto_2555 ?auto_2557 ) ) ( not ( = ?auto_2555 ?auto_2559 ) ) ( not ( = ?auto_2557 ?auto_2565 ) ) ( not ( = ?auto_2557 ?auto_2564 ) ) ( not ( = ?auto_2559 ?auto_2565 ) ) ( not ( = ?auto_2559 ?auto_2564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2554 ?auto_2555 ?auto_2556 )
      ( MAKE-1CRATE ?auto_2556 ?auto_2557 )
      ( MAKE-3CRATE-VERIFY ?auto_2554 ?auto_2555 ?auto_2556 ?auto_2557 ) )
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
      ?auto_2588 - HOIST
      ?auto_2591 - PLACE
      ?auto_2590 - PLACE
      ?auto_2589 - HOIST
      ?auto_2593 - SURFACE
      ?auto_2596 - SURFACE
      ?auto_2597 - PLACE
      ?auto_2594 - HOIST
      ?auto_2598 - SURFACE
      ?auto_2595 - SURFACE
      ?auto_2592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2588 ?auto_2591 ) ( IS-CRATE ?auto_2587 ) ( not ( = ?auto_2590 ?auto_2591 ) ) ( HOIST-AT ?auto_2589 ?auto_2590 ) ( SURFACE-AT ?auto_2587 ?auto_2590 ) ( ON ?auto_2587 ?auto_2593 ) ( CLEAR ?auto_2587 ) ( not ( = ?auto_2586 ?auto_2587 ) ) ( not ( = ?auto_2586 ?auto_2593 ) ) ( not ( = ?auto_2587 ?auto_2593 ) ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( IS-CRATE ?auto_2586 ) ( SURFACE-AT ?auto_2586 ?auto_2590 ) ( ON ?auto_2586 ?auto_2596 ) ( CLEAR ?auto_2586 ) ( not ( = ?auto_2585 ?auto_2586 ) ) ( not ( = ?auto_2585 ?auto_2596 ) ) ( not ( = ?auto_2586 ?auto_2596 ) ) ( IS-CRATE ?auto_2585 ) ( not ( = ?auto_2597 ?auto_2591 ) ) ( HOIST-AT ?auto_2594 ?auto_2597 ) ( AVAILABLE ?auto_2594 ) ( SURFACE-AT ?auto_2585 ?auto_2597 ) ( ON ?auto_2585 ?auto_2598 ) ( CLEAR ?auto_2585 ) ( not ( = ?auto_2584 ?auto_2585 ) ) ( not ( = ?auto_2584 ?auto_2598 ) ) ( not ( = ?auto_2585 ?auto_2598 ) ) ( not ( = ?auto_2588 ?auto_2594 ) ) ( SURFACE-AT ?auto_2583 ?auto_2591 ) ( CLEAR ?auto_2583 ) ( IS-CRATE ?auto_2584 ) ( AVAILABLE ?auto_2588 ) ( AVAILABLE ?auto_2589 ) ( SURFACE-AT ?auto_2584 ?auto_2590 ) ( ON ?auto_2584 ?auto_2595 ) ( CLEAR ?auto_2584 ) ( TRUCK-AT ?auto_2592 ?auto_2591 ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( not ( = ?auto_2583 ?auto_2595 ) ) ( not ( = ?auto_2584 ?auto_2595 ) ) ( not ( = ?auto_2583 ?auto_2585 ) ) ( not ( = ?auto_2583 ?auto_2598 ) ) ( not ( = ?auto_2585 ?auto_2595 ) ) ( not ( = ?auto_2597 ?auto_2590 ) ) ( not ( = ?auto_2594 ?auto_2589 ) ) ( not ( = ?auto_2598 ?auto_2595 ) ) ( not ( = ?auto_2583 ?auto_2586 ) ) ( not ( = ?auto_2583 ?auto_2596 ) ) ( not ( = ?auto_2584 ?auto_2586 ) ) ( not ( = ?auto_2584 ?auto_2596 ) ) ( not ( = ?auto_2586 ?auto_2598 ) ) ( not ( = ?auto_2586 ?auto_2595 ) ) ( not ( = ?auto_2596 ?auto_2598 ) ) ( not ( = ?auto_2596 ?auto_2595 ) ) ( not ( = ?auto_2583 ?auto_2587 ) ) ( not ( = ?auto_2583 ?auto_2593 ) ) ( not ( = ?auto_2584 ?auto_2587 ) ) ( not ( = ?auto_2584 ?auto_2593 ) ) ( not ( = ?auto_2585 ?auto_2587 ) ) ( not ( = ?auto_2585 ?auto_2593 ) ) ( not ( = ?auto_2587 ?auto_2596 ) ) ( not ( = ?auto_2587 ?auto_2598 ) ) ( not ( = ?auto_2587 ?auto_2595 ) ) ( not ( = ?auto_2593 ?auto_2596 ) ) ( not ( = ?auto_2593 ?auto_2598 ) ) ( not ( = ?auto_2593 ?auto_2595 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2583 ?auto_2584 ?auto_2585 ?auto_2586 )
      ( MAKE-1CRATE ?auto_2586 ?auto_2587 )
      ( MAKE-4CRATE-VERIFY ?auto_2583 ?auto_2584 ?auto_2585 ?auto_2586 ?auto_2587 ) )
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
      ?auto_2621 - HOIST
      ?auto_2624 - PLACE
      ?auto_2626 - PLACE
      ?auto_2625 - HOIST
      ?auto_2622 - SURFACE
      ?auto_2632 - SURFACE
      ?auto_2630 - SURFACE
      ?auto_2627 - PLACE
      ?auto_2631 - HOIST
      ?auto_2628 - SURFACE
      ?auto_2629 - SURFACE
      ?auto_2623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2621 ?auto_2624 ) ( IS-CRATE ?auto_2620 ) ( not ( = ?auto_2626 ?auto_2624 ) ) ( HOIST-AT ?auto_2625 ?auto_2626 ) ( SURFACE-AT ?auto_2620 ?auto_2626 ) ( ON ?auto_2620 ?auto_2622 ) ( CLEAR ?auto_2620 ) ( not ( = ?auto_2619 ?auto_2620 ) ) ( not ( = ?auto_2619 ?auto_2622 ) ) ( not ( = ?auto_2620 ?auto_2622 ) ) ( not ( = ?auto_2621 ?auto_2625 ) ) ( IS-CRATE ?auto_2619 ) ( SURFACE-AT ?auto_2619 ?auto_2626 ) ( ON ?auto_2619 ?auto_2632 ) ( CLEAR ?auto_2619 ) ( not ( = ?auto_2618 ?auto_2619 ) ) ( not ( = ?auto_2618 ?auto_2632 ) ) ( not ( = ?auto_2619 ?auto_2632 ) ) ( IS-CRATE ?auto_2618 ) ( SURFACE-AT ?auto_2618 ?auto_2626 ) ( ON ?auto_2618 ?auto_2630 ) ( CLEAR ?auto_2618 ) ( not ( = ?auto_2617 ?auto_2618 ) ) ( not ( = ?auto_2617 ?auto_2630 ) ) ( not ( = ?auto_2618 ?auto_2630 ) ) ( IS-CRATE ?auto_2617 ) ( not ( = ?auto_2627 ?auto_2624 ) ) ( HOIST-AT ?auto_2631 ?auto_2627 ) ( AVAILABLE ?auto_2631 ) ( SURFACE-AT ?auto_2617 ?auto_2627 ) ( ON ?auto_2617 ?auto_2628 ) ( CLEAR ?auto_2617 ) ( not ( = ?auto_2616 ?auto_2617 ) ) ( not ( = ?auto_2616 ?auto_2628 ) ) ( not ( = ?auto_2617 ?auto_2628 ) ) ( not ( = ?auto_2621 ?auto_2631 ) ) ( SURFACE-AT ?auto_2615 ?auto_2624 ) ( CLEAR ?auto_2615 ) ( IS-CRATE ?auto_2616 ) ( AVAILABLE ?auto_2621 ) ( AVAILABLE ?auto_2625 ) ( SURFACE-AT ?auto_2616 ?auto_2626 ) ( ON ?auto_2616 ?auto_2629 ) ( CLEAR ?auto_2616 ) ( TRUCK-AT ?auto_2623 ?auto_2624 ) ( not ( = ?auto_2615 ?auto_2616 ) ) ( not ( = ?auto_2615 ?auto_2629 ) ) ( not ( = ?auto_2616 ?auto_2629 ) ) ( not ( = ?auto_2615 ?auto_2617 ) ) ( not ( = ?auto_2615 ?auto_2628 ) ) ( not ( = ?auto_2617 ?auto_2629 ) ) ( not ( = ?auto_2627 ?auto_2626 ) ) ( not ( = ?auto_2631 ?auto_2625 ) ) ( not ( = ?auto_2628 ?auto_2629 ) ) ( not ( = ?auto_2615 ?auto_2618 ) ) ( not ( = ?auto_2615 ?auto_2630 ) ) ( not ( = ?auto_2616 ?auto_2618 ) ) ( not ( = ?auto_2616 ?auto_2630 ) ) ( not ( = ?auto_2618 ?auto_2628 ) ) ( not ( = ?auto_2618 ?auto_2629 ) ) ( not ( = ?auto_2630 ?auto_2628 ) ) ( not ( = ?auto_2630 ?auto_2629 ) ) ( not ( = ?auto_2615 ?auto_2619 ) ) ( not ( = ?auto_2615 ?auto_2632 ) ) ( not ( = ?auto_2616 ?auto_2619 ) ) ( not ( = ?auto_2616 ?auto_2632 ) ) ( not ( = ?auto_2617 ?auto_2619 ) ) ( not ( = ?auto_2617 ?auto_2632 ) ) ( not ( = ?auto_2619 ?auto_2630 ) ) ( not ( = ?auto_2619 ?auto_2628 ) ) ( not ( = ?auto_2619 ?auto_2629 ) ) ( not ( = ?auto_2632 ?auto_2630 ) ) ( not ( = ?auto_2632 ?auto_2628 ) ) ( not ( = ?auto_2632 ?auto_2629 ) ) ( not ( = ?auto_2615 ?auto_2620 ) ) ( not ( = ?auto_2615 ?auto_2622 ) ) ( not ( = ?auto_2616 ?auto_2620 ) ) ( not ( = ?auto_2616 ?auto_2622 ) ) ( not ( = ?auto_2617 ?auto_2620 ) ) ( not ( = ?auto_2617 ?auto_2622 ) ) ( not ( = ?auto_2618 ?auto_2620 ) ) ( not ( = ?auto_2618 ?auto_2622 ) ) ( not ( = ?auto_2620 ?auto_2632 ) ) ( not ( = ?auto_2620 ?auto_2630 ) ) ( not ( = ?auto_2620 ?auto_2628 ) ) ( not ( = ?auto_2620 ?auto_2629 ) ) ( not ( = ?auto_2622 ?auto_2632 ) ) ( not ( = ?auto_2622 ?auto_2630 ) ) ( not ( = ?auto_2622 ?auto_2628 ) ) ( not ( = ?auto_2622 ?auto_2629 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2615 ?auto_2616 ?auto_2617 ?auto_2618 ?auto_2619 )
      ( MAKE-1CRATE ?auto_2619 ?auto_2620 )
      ( MAKE-5CRATE-VERIFY ?auto_2615 ?auto_2616 ?auto_2617 ?auto_2618 ?auto_2619 ?auto_2620 ) )
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
      ?auto_2659 - HOIST
      ?auto_2658 - PLACE
      ?auto_2661 - PLACE
      ?auto_2660 - HOIST
      ?auto_2662 - SURFACE
      ?auto_2668 - PLACE
      ?auto_2667 - HOIST
      ?auto_2671 - SURFACE
      ?auto_2669 - SURFACE
      ?auto_2663 - SURFACE
      ?auto_2664 - PLACE
      ?auto_2666 - HOIST
      ?auto_2665 - SURFACE
      ?auto_2670 - SURFACE
      ?auto_2657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2659 ?auto_2658 ) ( IS-CRATE ?auto_2656 ) ( not ( = ?auto_2661 ?auto_2658 ) ) ( HOIST-AT ?auto_2660 ?auto_2661 ) ( AVAILABLE ?auto_2660 ) ( SURFACE-AT ?auto_2656 ?auto_2661 ) ( ON ?auto_2656 ?auto_2662 ) ( CLEAR ?auto_2656 ) ( not ( = ?auto_2655 ?auto_2656 ) ) ( not ( = ?auto_2655 ?auto_2662 ) ) ( not ( = ?auto_2656 ?auto_2662 ) ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( IS-CRATE ?auto_2655 ) ( not ( = ?auto_2668 ?auto_2658 ) ) ( HOIST-AT ?auto_2667 ?auto_2668 ) ( SURFACE-AT ?auto_2655 ?auto_2668 ) ( ON ?auto_2655 ?auto_2671 ) ( CLEAR ?auto_2655 ) ( not ( = ?auto_2654 ?auto_2655 ) ) ( not ( = ?auto_2654 ?auto_2671 ) ) ( not ( = ?auto_2655 ?auto_2671 ) ) ( not ( = ?auto_2659 ?auto_2667 ) ) ( IS-CRATE ?auto_2654 ) ( SURFACE-AT ?auto_2654 ?auto_2668 ) ( ON ?auto_2654 ?auto_2669 ) ( CLEAR ?auto_2654 ) ( not ( = ?auto_2653 ?auto_2654 ) ) ( not ( = ?auto_2653 ?auto_2669 ) ) ( not ( = ?auto_2654 ?auto_2669 ) ) ( IS-CRATE ?auto_2653 ) ( SURFACE-AT ?auto_2653 ?auto_2668 ) ( ON ?auto_2653 ?auto_2663 ) ( CLEAR ?auto_2653 ) ( not ( = ?auto_2652 ?auto_2653 ) ) ( not ( = ?auto_2652 ?auto_2663 ) ) ( not ( = ?auto_2653 ?auto_2663 ) ) ( IS-CRATE ?auto_2652 ) ( not ( = ?auto_2664 ?auto_2658 ) ) ( HOIST-AT ?auto_2666 ?auto_2664 ) ( AVAILABLE ?auto_2666 ) ( SURFACE-AT ?auto_2652 ?auto_2664 ) ( ON ?auto_2652 ?auto_2665 ) ( CLEAR ?auto_2652 ) ( not ( = ?auto_2651 ?auto_2652 ) ) ( not ( = ?auto_2651 ?auto_2665 ) ) ( not ( = ?auto_2652 ?auto_2665 ) ) ( not ( = ?auto_2659 ?auto_2666 ) ) ( SURFACE-AT ?auto_2650 ?auto_2658 ) ( CLEAR ?auto_2650 ) ( IS-CRATE ?auto_2651 ) ( AVAILABLE ?auto_2659 ) ( AVAILABLE ?auto_2667 ) ( SURFACE-AT ?auto_2651 ?auto_2668 ) ( ON ?auto_2651 ?auto_2670 ) ( CLEAR ?auto_2651 ) ( TRUCK-AT ?auto_2657 ?auto_2658 ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( not ( = ?auto_2650 ?auto_2670 ) ) ( not ( = ?auto_2651 ?auto_2670 ) ) ( not ( = ?auto_2650 ?auto_2652 ) ) ( not ( = ?auto_2650 ?auto_2665 ) ) ( not ( = ?auto_2652 ?auto_2670 ) ) ( not ( = ?auto_2664 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2667 ) ) ( not ( = ?auto_2665 ?auto_2670 ) ) ( not ( = ?auto_2650 ?auto_2653 ) ) ( not ( = ?auto_2650 ?auto_2663 ) ) ( not ( = ?auto_2651 ?auto_2653 ) ) ( not ( = ?auto_2651 ?auto_2663 ) ) ( not ( = ?auto_2653 ?auto_2665 ) ) ( not ( = ?auto_2653 ?auto_2670 ) ) ( not ( = ?auto_2663 ?auto_2665 ) ) ( not ( = ?auto_2663 ?auto_2670 ) ) ( not ( = ?auto_2650 ?auto_2654 ) ) ( not ( = ?auto_2650 ?auto_2669 ) ) ( not ( = ?auto_2651 ?auto_2654 ) ) ( not ( = ?auto_2651 ?auto_2669 ) ) ( not ( = ?auto_2652 ?auto_2654 ) ) ( not ( = ?auto_2652 ?auto_2669 ) ) ( not ( = ?auto_2654 ?auto_2663 ) ) ( not ( = ?auto_2654 ?auto_2665 ) ) ( not ( = ?auto_2654 ?auto_2670 ) ) ( not ( = ?auto_2669 ?auto_2663 ) ) ( not ( = ?auto_2669 ?auto_2665 ) ) ( not ( = ?auto_2669 ?auto_2670 ) ) ( not ( = ?auto_2650 ?auto_2655 ) ) ( not ( = ?auto_2650 ?auto_2671 ) ) ( not ( = ?auto_2651 ?auto_2655 ) ) ( not ( = ?auto_2651 ?auto_2671 ) ) ( not ( = ?auto_2652 ?auto_2655 ) ) ( not ( = ?auto_2652 ?auto_2671 ) ) ( not ( = ?auto_2653 ?auto_2655 ) ) ( not ( = ?auto_2653 ?auto_2671 ) ) ( not ( = ?auto_2655 ?auto_2669 ) ) ( not ( = ?auto_2655 ?auto_2663 ) ) ( not ( = ?auto_2655 ?auto_2665 ) ) ( not ( = ?auto_2655 ?auto_2670 ) ) ( not ( = ?auto_2671 ?auto_2669 ) ) ( not ( = ?auto_2671 ?auto_2663 ) ) ( not ( = ?auto_2671 ?auto_2665 ) ) ( not ( = ?auto_2671 ?auto_2670 ) ) ( not ( = ?auto_2650 ?auto_2656 ) ) ( not ( = ?auto_2650 ?auto_2662 ) ) ( not ( = ?auto_2651 ?auto_2656 ) ) ( not ( = ?auto_2651 ?auto_2662 ) ) ( not ( = ?auto_2652 ?auto_2656 ) ) ( not ( = ?auto_2652 ?auto_2662 ) ) ( not ( = ?auto_2653 ?auto_2656 ) ) ( not ( = ?auto_2653 ?auto_2662 ) ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( not ( = ?auto_2654 ?auto_2662 ) ) ( not ( = ?auto_2656 ?auto_2671 ) ) ( not ( = ?auto_2656 ?auto_2669 ) ) ( not ( = ?auto_2656 ?auto_2663 ) ) ( not ( = ?auto_2656 ?auto_2665 ) ) ( not ( = ?auto_2656 ?auto_2670 ) ) ( not ( = ?auto_2661 ?auto_2668 ) ) ( not ( = ?auto_2661 ?auto_2664 ) ) ( not ( = ?auto_2660 ?auto_2667 ) ) ( not ( = ?auto_2660 ?auto_2666 ) ) ( not ( = ?auto_2662 ?auto_2671 ) ) ( not ( = ?auto_2662 ?auto_2669 ) ) ( not ( = ?auto_2662 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2665 ) ) ( not ( = ?auto_2662 ?auto_2670 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2650 ?auto_2651 ?auto_2652 ?auto_2653 ?auto_2654 ?auto_2655 )
      ( MAKE-1CRATE ?auto_2655 ?auto_2656 )
      ( MAKE-6CRATE-VERIFY ?auto_2650 ?auto_2651 ?auto_2652 ?auto_2653 ?auto_2654 ?auto_2655 ?auto_2656 ) )
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
      ?auto_2703 - HOIST
      ?auto_2702 - PLACE
      ?auto_2698 - PLACE
      ?auto_2699 - HOIST
      ?auto_2700 - SURFACE
      ?auto_2707 - PLACE
      ?auto_2712 - HOIST
      ?auto_2708 - SURFACE
      ?auto_2704 - PLACE
      ?auto_2709 - HOIST
      ?auto_2705 - SURFACE
      ?auto_2714 - SURFACE
      ?auto_2711 - SURFACE
      ?auto_2713 - PLACE
      ?auto_2715 - HOIST
      ?auto_2710 - SURFACE
      ?auto_2706 - SURFACE
      ?auto_2701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2703 ?auto_2702 ) ( IS-CRATE ?auto_2697 ) ( not ( = ?auto_2698 ?auto_2702 ) ) ( HOIST-AT ?auto_2699 ?auto_2698 ) ( AVAILABLE ?auto_2699 ) ( SURFACE-AT ?auto_2697 ?auto_2698 ) ( ON ?auto_2697 ?auto_2700 ) ( CLEAR ?auto_2697 ) ( not ( = ?auto_2696 ?auto_2697 ) ) ( not ( = ?auto_2696 ?auto_2700 ) ) ( not ( = ?auto_2697 ?auto_2700 ) ) ( not ( = ?auto_2703 ?auto_2699 ) ) ( IS-CRATE ?auto_2696 ) ( not ( = ?auto_2707 ?auto_2702 ) ) ( HOIST-AT ?auto_2712 ?auto_2707 ) ( AVAILABLE ?auto_2712 ) ( SURFACE-AT ?auto_2696 ?auto_2707 ) ( ON ?auto_2696 ?auto_2708 ) ( CLEAR ?auto_2696 ) ( not ( = ?auto_2695 ?auto_2696 ) ) ( not ( = ?auto_2695 ?auto_2708 ) ) ( not ( = ?auto_2696 ?auto_2708 ) ) ( not ( = ?auto_2703 ?auto_2712 ) ) ( IS-CRATE ?auto_2695 ) ( not ( = ?auto_2704 ?auto_2702 ) ) ( HOIST-AT ?auto_2709 ?auto_2704 ) ( SURFACE-AT ?auto_2695 ?auto_2704 ) ( ON ?auto_2695 ?auto_2705 ) ( CLEAR ?auto_2695 ) ( not ( = ?auto_2694 ?auto_2695 ) ) ( not ( = ?auto_2694 ?auto_2705 ) ) ( not ( = ?auto_2695 ?auto_2705 ) ) ( not ( = ?auto_2703 ?auto_2709 ) ) ( IS-CRATE ?auto_2694 ) ( SURFACE-AT ?auto_2694 ?auto_2704 ) ( ON ?auto_2694 ?auto_2714 ) ( CLEAR ?auto_2694 ) ( not ( = ?auto_2693 ?auto_2694 ) ) ( not ( = ?auto_2693 ?auto_2714 ) ) ( not ( = ?auto_2694 ?auto_2714 ) ) ( IS-CRATE ?auto_2693 ) ( SURFACE-AT ?auto_2693 ?auto_2704 ) ( ON ?auto_2693 ?auto_2711 ) ( CLEAR ?auto_2693 ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2711 ) ) ( not ( = ?auto_2693 ?auto_2711 ) ) ( IS-CRATE ?auto_2692 ) ( not ( = ?auto_2713 ?auto_2702 ) ) ( HOIST-AT ?auto_2715 ?auto_2713 ) ( AVAILABLE ?auto_2715 ) ( SURFACE-AT ?auto_2692 ?auto_2713 ) ( ON ?auto_2692 ?auto_2710 ) ( CLEAR ?auto_2692 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2691 ?auto_2710 ) ) ( not ( = ?auto_2692 ?auto_2710 ) ) ( not ( = ?auto_2703 ?auto_2715 ) ) ( SURFACE-AT ?auto_2690 ?auto_2702 ) ( CLEAR ?auto_2690 ) ( IS-CRATE ?auto_2691 ) ( AVAILABLE ?auto_2703 ) ( AVAILABLE ?auto_2709 ) ( SURFACE-AT ?auto_2691 ?auto_2704 ) ( ON ?auto_2691 ?auto_2706 ) ( CLEAR ?auto_2691 ) ( TRUCK-AT ?auto_2701 ?auto_2702 ) ( not ( = ?auto_2690 ?auto_2691 ) ) ( not ( = ?auto_2690 ?auto_2706 ) ) ( not ( = ?auto_2691 ?auto_2706 ) ) ( not ( = ?auto_2690 ?auto_2692 ) ) ( not ( = ?auto_2690 ?auto_2710 ) ) ( not ( = ?auto_2692 ?auto_2706 ) ) ( not ( = ?auto_2713 ?auto_2704 ) ) ( not ( = ?auto_2715 ?auto_2709 ) ) ( not ( = ?auto_2710 ?auto_2706 ) ) ( not ( = ?auto_2690 ?auto_2693 ) ) ( not ( = ?auto_2690 ?auto_2711 ) ) ( not ( = ?auto_2691 ?auto_2693 ) ) ( not ( = ?auto_2691 ?auto_2711 ) ) ( not ( = ?auto_2693 ?auto_2710 ) ) ( not ( = ?auto_2693 ?auto_2706 ) ) ( not ( = ?auto_2711 ?auto_2710 ) ) ( not ( = ?auto_2711 ?auto_2706 ) ) ( not ( = ?auto_2690 ?auto_2694 ) ) ( not ( = ?auto_2690 ?auto_2714 ) ) ( not ( = ?auto_2691 ?auto_2694 ) ) ( not ( = ?auto_2691 ?auto_2714 ) ) ( not ( = ?auto_2692 ?auto_2694 ) ) ( not ( = ?auto_2692 ?auto_2714 ) ) ( not ( = ?auto_2694 ?auto_2711 ) ) ( not ( = ?auto_2694 ?auto_2710 ) ) ( not ( = ?auto_2694 ?auto_2706 ) ) ( not ( = ?auto_2714 ?auto_2711 ) ) ( not ( = ?auto_2714 ?auto_2710 ) ) ( not ( = ?auto_2714 ?auto_2706 ) ) ( not ( = ?auto_2690 ?auto_2695 ) ) ( not ( = ?auto_2690 ?auto_2705 ) ) ( not ( = ?auto_2691 ?auto_2695 ) ) ( not ( = ?auto_2691 ?auto_2705 ) ) ( not ( = ?auto_2692 ?auto_2695 ) ) ( not ( = ?auto_2692 ?auto_2705 ) ) ( not ( = ?auto_2693 ?auto_2695 ) ) ( not ( = ?auto_2693 ?auto_2705 ) ) ( not ( = ?auto_2695 ?auto_2714 ) ) ( not ( = ?auto_2695 ?auto_2711 ) ) ( not ( = ?auto_2695 ?auto_2710 ) ) ( not ( = ?auto_2695 ?auto_2706 ) ) ( not ( = ?auto_2705 ?auto_2714 ) ) ( not ( = ?auto_2705 ?auto_2711 ) ) ( not ( = ?auto_2705 ?auto_2710 ) ) ( not ( = ?auto_2705 ?auto_2706 ) ) ( not ( = ?auto_2690 ?auto_2696 ) ) ( not ( = ?auto_2690 ?auto_2708 ) ) ( not ( = ?auto_2691 ?auto_2696 ) ) ( not ( = ?auto_2691 ?auto_2708 ) ) ( not ( = ?auto_2692 ?auto_2696 ) ) ( not ( = ?auto_2692 ?auto_2708 ) ) ( not ( = ?auto_2693 ?auto_2696 ) ) ( not ( = ?auto_2693 ?auto_2708 ) ) ( not ( = ?auto_2694 ?auto_2696 ) ) ( not ( = ?auto_2694 ?auto_2708 ) ) ( not ( = ?auto_2696 ?auto_2705 ) ) ( not ( = ?auto_2696 ?auto_2714 ) ) ( not ( = ?auto_2696 ?auto_2711 ) ) ( not ( = ?auto_2696 ?auto_2710 ) ) ( not ( = ?auto_2696 ?auto_2706 ) ) ( not ( = ?auto_2707 ?auto_2704 ) ) ( not ( = ?auto_2707 ?auto_2713 ) ) ( not ( = ?auto_2712 ?auto_2709 ) ) ( not ( = ?auto_2712 ?auto_2715 ) ) ( not ( = ?auto_2708 ?auto_2705 ) ) ( not ( = ?auto_2708 ?auto_2714 ) ) ( not ( = ?auto_2708 ?auto_2711 ) ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( not ( = ?auto_2708 ?auto_2706 ) ) ( not ( = ?auto_2690 ?auto_2697 ) ) ( not ( = ?auto_2690 ?auto_2700 ) ) ( not ( = ?auto_2691 ?auto_2697 ) ) ( not ( = ?auto_2691 ?auto_2700 ) ) ( not ( = ?auto_2692 ?auto_2697 ) ) ( not ( = ?auto_2692 ?auto_2700 ) ) ( not ( = ?auto_2693 ?auto_2697 ) ) ( not ( = ?auto_2693 ?auto_2700 ) ) ( not ( = ?auto_2694 ?auto_2697 ) ) ( not ( = ?auto_2694 ?auto_2700 ) ) ( not ( = ?auto_2695 ?auto_2697 ) ) ( not ( = ?auto_2695 ?auto_2700 ) ) ( not ( = ?auto_2697 ?auto_2708 ) ) ( not ( = ?auto_2697 ?auto_2705 ) ) ( not ( = ?auto_2697 ?auto_2714 ) ) ( not ( = ?auto_2697 ?auto_2711 ) ) ( not ( = ?auto_2697 ?auto_2710 ) ) ( not ( = ?auto_2697 ?auto_2706 ) ) ( not ( = ?auto_2698 ?auto_2707 ) ) ( not ( = ?auto_2698 ?auto_2704 ) ) ( not ( = ?auto_2698 ?auto_2713 ) ) ( not ( = ?auto_2699 ?auto_2712 ) ) ( not ( = ?auto_2699 ?auto_2709 ) ) ( not ( = ?auto_2699 ?auto_2715 ) ) ( not ( = ?auto_2700 ?auto_2708 ) ) ( not ( = ?auto_2700 ?auto_2705 ) ) ( not ( = ?auto_2700 ?auto_2714 ) ) ( not ( = ?auto_2700 ?auto_2711 ) ) ( not ( = ?auto_2700 ?auto_2710 ) ) ( not ( = ?auto_2700 ?auto_2706 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2690 ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2694 ?auto_2695 ?auto_2696 )
      ( MAKE-1CRATE ?auto_2696 ?auto_2697 )
      ( MAKE-7CRATE-VERIFY ?auto_2690 ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2694 ?auto_2695 ?auto_2696 ?auto_2697 ) )
  )

)

