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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2542 - SURFACE
      ?auto_2543 - SURFACE
      ?auto_2544 - SURFACE
    )
    :vars
    (
      ?auto_2546 - HOIST
      ?auto_2549 - PLACE
      ?auto_2547 - PLACE
      ?auto_2548 - HOIST
      ?auto_2550 - SURFACE
      ?auto_2552 - PLACE
      ?auto_2553 - HOIST
      ?auto_2551 - SURFACE
      ?auto_2545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2546 ?auto_2549 ) ( IS-CRATE ?auto_2544 ) ( not ( = ?auto_2547 ?auto_2549 ) ) ( HOIST-AT ?auto_2548 ?auto_2547 ) ( AVAILABLE ?auto_2548 ) ( SURFACE-AT ?auto_2544 ?auto_2547 ) ( ON ?auto_2544 ?auto_2550 ) ( CLEAR ?auto_2544 ) ( not ( = ?auto_2543 ?auto_2544 ) ) ( not ( = ?auto_2543 ?auto_2550 ) ) ( not ( = ?auto_2544 ?auto_2550 ) ) ( not ( = ?auto_2546 ?auto_2548 ) ) ( SURFACE-AT ?auto_2542 ?auto_2549 ) ( CLEAR ?auto_2542 ) ( IS-CRATE ?auto_2543 ) ( AVAILABLE ?auto_2546 ) ( not ( = ?auto_2552 ?auto_2549 ) ) ( HOIST-AT ?auto_2553 ?auto_2552 ) ( AVAILABLE ?auto_2553 ) ( SURFACE-AT ?auto_2543 ?auto_2552 ) ( ON ?auto_2543 ?auto_2551 ) ( CLEAR ?auto_2543 ) ( TRUCK-AT ?auto_2545 ?auto_2549 ) ( not ( = ?auto_2542 ?auto_2543 ) ) ( not ( = ?auto_2542 ?auto_2551 ) ) ( not ( = ?auto_2543 ?auto_2551 ) ) ( not ( = ?auto_2546 ?auto_2553 ) ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( not ( = ?auto_2542 ?auto_2550 ) ) ( not ( = ?auto_2544 ?auto_2551 ) ) ( not ( = ?auto_2547 ?auto_2552 ) ) ( not ( = ?auto_2548 ?auto_2553 ) ) ( not ( = ?auto_2550 ?auto_2551 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2542 ?auto_2543 )
      ( MAKE-1CRATE ?auto_2543 ?auto_2544 )
      ( MAKE-2CRATE-VERIFY ?auto_2542 ?auto_2543 ?auto_2544 ) )
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
      ?auto_2572 - PLACE
      ?auto_2574 - PLACE
      ?auto_2576 - HOIST
      ?auto_2573 - SURFACE
      ?auto_2581 - PLACE
      ?auto_2579 - HOIST
      ?auto_2578 - SURFACE
      ?auto_2580 - SURFACE
      ?auto_2575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2577 ?auto_2572 ) ( IS-CRATE ?auto_2571 ) ( not ( = ?auto_2574 ?auto_2572 ) ) ( HOIST-AT ?auto_2576 ?auto_2574 ) ( SURFACE-AT ?auto_2571 ?auto_2574 ) ( ON ?auto_2571 ?auto_2573 ) ( CLEAR ?auto_2571 ) ( not ( = ?auto_2570 ?auto_2571 ) ) ( not ( = ?auto_2570 ?auto_2573 ) ) ( not ( = ?auto_2571 ?auto_2573 ) ) ( not ( = ?auto_2577 ?auto_2576 ) ) ( IS-CRATE ?auto_2570 ) ( not ( = ?auto_2581 ?auto_2572 ) ) ( HOIST-AT ?auto_2579 ?auto_2581 ) ( AVAILABLE ?auto_2579 ) ( SURFACE-AT ?auto_2570 ?auto_2581 ) ( ON ?auto_2570 ?auto_2578 ) ( CLEAR ?auto_2570 ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( not ( = ?auto_2569 ?auto_2578 ) ) ( not ( = ?auto_2570 ?auto_2578 ) ) ( not ( = ?auto_2577 ?auto_2579 ) ) ( SURFACE-AT ?auto_2568 ?auto_2572 ) ( CLEAR ?auto_2568 ) ( IS-CRATE ?auto_2569 ) ( AVAILABLE ?auto_2577 ) ( AVAILABLE ?auto_2576 ) ( SURFACE-AT ?auto_2569 ?auto_2574 ) ( ON ?auto_2569 ?auto_2580 ) ( CLEAR ?auto_2569 ) ( TRUCK-AT ?auto_2575 ?auto_2572 ) ( not ( = ?auto_2568 ?auto_2569 ) ) ( not ( = ?auto_2568 ?auto_2580 ) ) ( not ( = ?auto_2569 ?auto_2580 ) ) ( not ( = ?auto_2568 ?auto_2570 ) ) ( not ( = ?auto_2568 ?auto_2578 ) ) ( not ( = ?auto_2570 ?auto_2580 ) ) ( not ( = ?auto_2581 ?auto_2574 ) ) ( not ( = ?auto_2579 ?auto_2576 ) ) ( not ( = ?auto_2578 ?auto_2580 ) ) ( not ( = ?auto_2568 ?auto_2571 ) ) ( not ( = ?auto_2568 ?auto_2573 ) ) ( not ( = ?auto_2569 ?auto_2571 ) ) ( not ( = ?auto_2569 ?auto_2573 ) ) ( not ( = ?auto_2571 ?auto_2578 ) ) ( not ( = ?auto_2571 ?auto_2580 ) ) ( not ( = ?auto_2573 ?auto_2578 ) ) ( not ( = ?auto_2573 ?auto_2580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2568 ?auto_2569 ?auto_2570 )
      ( MAKE-1CRATE ?auto_2570 ?auto_2571 )
      ( MAKE-3CRATE-VERIFY ?auto_2568 ?auto_2569 ?auto_2570 ?auto_2571 ) )
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
      ?auto_2603 - HOIST
      ?auto_2606 - PLACE
      ?auto_2602 - PLACE
      ?auto_2605 - HOIST
      ?auto_2607 - SURFACE
      ?auto_2611 - PLACE
      ?auto_2612 - HOIST
      ?auto_2610 - SURFACE
      ?auto_2614 - PLACE
      ?auto_2608 - HOIST
      ?auto_2609 - SURFACE
      ?auto_2613 - SURFACE
      ?auto_2604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2603 ?auto_2606 ) ( IS-CRATE ?auto_2601 ) ( not ( = ?auto_2602 ?auto_2606 ) ) ( HOIST-AT ?auto_2605 ?auto_2602 ) ( AVAILABLE ?auto_2605 ) ( SURFACE-AT ?auto_2601 ?auto_2602 ) ( ON ?auto_2601 ?auto_2607 ) ( CLEAR ?auto_2601 ) ( not ( = ?auto_2600 ?auto_2601 ) ) ( not ( = ?auto_2600 ?auto_2607 ) ) ( not ( = ?auto_2601 ?auto_2607 ) ) ( not ( = ?auto_2603 ?auto_2605 ) ) ( IS-CRATE ?auto_2600 ) ( not ( = ?auto_2611 ?auto_2606 ) ) ( HOIST-AT ?auto_2612 ?auto_2611 ) ( SURFACE-AT ?auto_2600 ?auto_2611 ) ( ON ?auto_2600 ?auto_2610 ) ( CLEAR ?auto_2600 ) ( not ( = ?auto_2599 ?auto_2600 ) ) ( not ( = ?auto_2599 ?auto_2610 ) ) ( not ( = ?auto_2600 ?auto_2610 ) ) ( not ( = ?auto_2603 ?auto_2612 ) ) ( IS-CRATE ?auto_2599 ) ( not ( = ?auto_2614 ?auto_2606 ) ) ( HOIST-AT ?auto_2608 ?auto_2614 ) ( AVAILABLE ?auto_2608 ) ( SURFACE-AT ?auto_2599 ?auto_2614 ) ( ON ?auto_2599 ?auto_2609 ) ( CLEAR ?auto_2599 ) ( not ( = ?auto_2598 ?auto_2599 ) ) ( not ( = ?auto_2598 ?auto_2609 ) ) ( not ( = ?auto_2599 ?auto_2609 ) ) ( not ( = ?auto_2603 ?auto_2608 ) ) ( SURFACE-AT ?auto_2597 ?auto_2606 ) ( CLEAR ?auto_2597 ) ( IS-CRATE ?auto_2598 ) ( AVAILABLE ?auto_2603 ) ( AVAILABLE ?auto_2612 ) ( SURFACE-AT ?auto_2598 ?auto_2611 ) ( ON ?auto_2598 ?auto_2613 ) ( CLEAR ?auto_2598 ) ( TRUCK-AT ?auto_2604 ?auto_2606 ) ( not ( = ?auto_2597 ?auto_2598 ) ) ( not ( = ?auto_2597 ?auto_2613 ) ) ( not ( = ?auto_2598 ?auto_2613 ) ) ( not ( = ?auto_2597 ?auto_2599 ) ) ( not ( = ?auto_2597 ?auto_2609 ) ) ( not ( = ?auto_2599 ?auto_2613 ) ) ( not ( = ?auto_2614 ?auto_2611 ) ) ( not ( = ?auto_2608 ?auto_2612 ) ) ( not ( = ?auto_2609 ?auto_2613 ) ) ( not ( = ?auto_2597 ?auto_2600 ) ) ( not ( = ?auto_2597 ?auto_2610 ) ) ( not ( = ?auto_2598 ?auto_2600 ) ) ( not ( = ?auto_2598 ?auto_2610 ) ) ( not ( = ?auto_2600 ?auto_2609 ) ) ( not ( = ?auto_2600 ?auto_2613 ) ) ( not ( = ?auto_2610 ?auto_2609 ) ) ( not ( = ?auto_2610 ?auto_2613 ) ) ( not ( = ?auto_2597 ?auto_2601 ) ) ( not ( = ?auto_2597 ?auto_2607 ) ) ( not ( = ?auto_2598 ?auto_2601 ) ) ( not ( = ?auto_2598 ?auto_2607 ) ) ( not ( = ?auto_2599 ?auto_2601 ) ) ( not ( = ?auto_2599 ?auto_2607 ) ) ( not ( = ?auto_2601 ?auto_2610 ) ) ( not ( = ?auto_2601 ?auto_2609 ) ) ( not ( = ?auto_2601 ?auto_2613 ) ) ( not ( = ?auto_2602 ?auto_2611 ) ) ( not ( = ?auto_2602 ?auto_2614 ) ) ( not ( = ?auto_2605 ?auto_2612 ) ) ( not ( = ?auto_2605 ?auto_2608 ) ) ( not ( = ?auto_2607 ?auto_2610 ) ) ( not ( = ?auto_2607 ?auto_2609 ) ) ( not ( = ?auto_2607 ?auto_2613 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2600 )
      ( MAKE-1CRATE ?auto_2600 ?auto_2601 )
      ( MAKE-4CRATE-VERIFY ?auto_2597 ?auto_2598 ?auto_2599 ?auto_2600 ?auto_2601 ) )
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
      ?auto_2638 - HOIST
      ?auto_2637 - PLACE
      ?auto_2639 - PLACE
      ?auto_2642 - HOIST
      ?auto_2641 - SURFACE
      ?auto_2652 - PLACE
      ?auto_2649 - HOIST
      ?auto_2646 - SURFACE
      ?auto_2650 - PLACE
      ?auto_2643 - HOIST
      ?auto_2648 - SURFACE
      ?auto_2645 - PLACE
      ?auto_2647 - HOIST
      ?auto_2651 - SURFACE
      ?auto_2644 - SURFACE
      ?auto_2640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2638 ?auto_2637 ) ( IS-CRATE ?auto_2636 ) ( not ( = ?auto_2639 ?auto_2637 ) ) ( HOIST-AT ?auto_2642 ?auto_2639 ) ( AVAILABLE ?auto_2642 ) ( SURFACE-AT ?auto_2636 ?auto_2639 ) ( ON ?auto_2636 ?auto_2641 ) ( CLEAR ?auto_2636 ) ( not ( = ?auto_2635 ?auto_2636 ) ) ( not ( = ?auto_2635 ?auto_2641 ) ) ( not ( = ?auto_2636 ?auto_2641 ) ) ( not ( = ?auto_2638 ?auto_2642 ) ) ( IS-CRATE ?auto_2635 ) ( not ( = ?auto_2652 ?auto_2637 ) ) ( HOIST-AT ?auto_2649 ?auto_2652 ) ( AVAILABLE ?auto_2649 ) ( SURFACE-AT ?auto_2635 ?auto_2652 ) ( ON ?auto_2635 ?auto_2646 ) ( CLEAR ?auto_2635 ) ( not ( = ?auto_2634 ?auto_2635 ) ) ( not ( = ?auto_2634 ?auto_2646 ) ) ( not ( = ?auto_2635 ?auto_2646 ) ) ( not ( = ?auto_2638 ?auto_2649 ) ) ( IS-CRATE ?auto_2634 ) ( not ( = ?auto_2650 ?auto_2637 ) ) ( HOIST-AT ?auto_2643 ?auto_2650 ) ( SURFACE-AT ?auto_2634 ?auto_2650 ) ( ON ?auto_2634 ?auto_2648 ) ( CLEAR ?auto_2634 ) ( not ( = ?auto_2633 ?auto_2634 ) ) ( not ( = ?auto_2633 ?auto_2648 ) ) ( not ( = ?auto_2634 ?auto_2648 ) ) ( not ( = ?auto_2638 ?auto_2643 ) ) ( IS-CRATE ?auto_2633 ) ( not ( = ?auto_2645 ?auto_2637 ) ) ( HOIST-AT ?auto_2647 ?auto_2645 ) ( AVAILABLE ?auto_2647 ) ( SURFACE-AT ?auto_2633 ?auto_2645 ) ( ON ?auto_2633 ?auto_2651 ) ( CLEAR ?auto_2633 ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( not ( = ?auto_2632 ?auto_2651 ) ) ( not ( = ?auto_2633 ?auto_2651 ) ) ( not ( = ?auto_2638 ?auto_2647 ) ) ( SURFACE-AT ?auto_2631 ?auto_2637 ) ( CLEAR ?auto_2631 ) ( IS-CRATE ?auto_2632 ) ( AVAILABLE ?auto_2638 ) ( AVAILABLE ?auto_2643 ) ( SURFACE-AT ?auto_2632 ?auto_2650 ) ( ON ?auto_2632 ?auto_2644 ) ( CLEAR ?auto_2632 ) ( TRUCK-AT ?auto_2640 ?auto_2637 ) ( not ( = ?auto_2631 ?auto_2632 ) ) ( not ( = ?auto_2631 ?auto_2644 ) ) ( not ( = ?auto_2632 ?auto_2644 ) ) ( not ( = ?auto_2631 ?auto_2633 ) ) ( not ( = ?auto_2631 ?auto_2651 ) ) ( not ( = ?auto_2633 ?auto_2644 ) ) ( not ( = ?auto_2645 ?auto_2650 ) ) ( not ( = ?auto_2647 ?auto_2643 ) ) ( not ( = ?auto_2651 ?auto_2644 ) ) ( not ( = ?auto_2631 ?auto_2634 ) ) ( not ( = ?auto_2631 ?auto_2648 ) ) ( not ( = ?auto_2632 ?auto_2634 ) ) ( not ( = ?auto_2632 ?auto_2648 ) ) ( not ( = ?auto_2634 ?auto_2651 ) ) ( not ( = ?auto_2634 ?auto_2644 ) ) ( not ( = ?auto_2648 ?auto_2651 ) ) ( not ( = ?auto_2648 ?auto_2644 ) ) ( not ( = ?auto_2631 ?auto_2635 ) ) ( not ( = ?auto_2631 ?auto_2646 ) ) ( not ( = ?auto_2632 ?auto_2635 ) ) ( not ( = ?auto_2632 ?auto_2646 ) ) ( not ( = ?auto_2633 ?auto_2635 ) ) ( not ( = ?auto_2633 ?auto_2646 ) ) ( not ( = ?auto_2635 ?auto_2648 ) ) ( not ( = ?auto_2635 ?auto_2651 ) ) ( not ( = ?auto_2635 ?auto_2644 ) ) ( not ( = ?auto_2652 ?auto_2650 ) ) ( not ( = ?auto_2652 ?auto_2645 ) ) ( not ( = ?auto_2649 ?auto_2643 ) ) ( not ( = ?auto_2649 ?auto_2647 ) ) ( not ( = ?auto_2646 ?auto_2648 ) ) ( not ( = ?auto_2646 ?auto_2651 ) ) ( not ( = ?auto_2646 ?auto_2644 ) ) ( not ( = ?auto_2631 ?auto_2636 ) ) ( not ( = ?auto_2631 ?auto_2641 ) ) ( not ( = ?auto_2632 ?auto_2636 ) ) ( not ( = ?auto_2632 ?auto_2641 ) ) ( not ( = ?auto_2633 ?auto_2636 ) ) ( not ( = ?auto_2633 ?auto_2641 ) ) ( not ( = ?auto_2634 ?auto_2636 ) ) ( not ( = ?auto_2634 ?auto_2641 ) ) ( not ( = ?auto_2636 ?auto_2646 ) ) ( not ( = ?auto_2636 ?auto_2648 ) ) ( not ( = ?auto_2636 ?auto_2651 ) ) ( not ( = ?auto_2636 ?auto_2644 ) ) ( not ( = ?auto_2639 ?auto_2652 ) ) ( not ( = ?auto_2639 ?auto_2650 ) ) ( not ( = ?auto_2639 ?auto_2645 ) ) ( not ( = ?auto_2642 ?auto_2649 ) ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2647 ) ) ( not ( = ?auto_2641 ?auto_2646 ) ) ( not ( = ?auto_2641 ?auto_2648 ) ) ( not ( = ?auto_2641 ?auto_2651 ) ) ( not ( = ?auto_2641 ?auto_2644 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2631 ?auto_2632 ?auto_2633 ?auto_2634 ?auto_2635 )
      ( MAKE-1CRATE ?auto_2635 ?auto_2636 )
      ( MAKE-5CRATE-VERIFY ?auto_2631 ?auto_2632 ?auto_2633 ?auto_2634 ?auto_2635 ?auto_2636 ) )
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
      ?auto_2682 - HOIST
      ?auto_2679 - PLACE
      ?auto_2680 - PLACE
      ?auto_2678 - HOIST
      ?auto_2681 - SURFACE
      ?auto_2691 - PLACE
      ?auto_2684 - HOIST
      ?auto_2692 - SURFACE
      ?auto_2688 - PLACE
      ?auto_2693 - HOIST
      ?auto_2685 - SURFACE
      ?auto_2695 - PLACE
      ?auto_2690 - HOIST
      ?auto_2694 - SURFACE
      ?auto_2689 - PLACE
      ?auto_2683 - HOIST
      ?auto_2686 - SURFACE
      ?auto_2687 - SURFACE
      ?auto_2677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2682 ?auto_2679 ) ( IS-CRATE ?auto_2676 ) ( not ( = ?auto_2680 ?auto_2679 ) ) ( HOIST-AT ?auto_2678 ?auto_2680 ) ( AVAILABLE ?auto_2678 ) ( SURFACE-AT ?auto_2676 ?auto_2680 ) ( ON ?auto_2676 ?auto_2681 ) ( CLEAR ?auto_2676 ) ( not ( = ?auto_2675 ?auto_2676 ) ) ( not ( = ?auto_2675 ?auto_2681 ) ) ( not ( = ?auto_2676 ?auto_2681 ) ) ( not ( = ?auto_2682 ?auto_2678 ) ) ( IS-CRATE ?auto_2675 ) ( not ( = ?auto_2691 ?auto_2679 ) ) ( HOIST-AT ?auto_2684 ?auto_2691 ) ( AVAILABLE ?auto_2684 ) ( SURFACE-AT ?auto_2675 ?auto_2691 ) ( ON ?auto_2675 ?auto_2692 ) ( CLEAR ?auto_2675 ) ( not ( = ?auto_2674 ?auto_2675 ) ) ( not ( = ?auto_2674 ?auto_2692 ) ) ( not ( = ?auto_2675 ?auto_2692 ) ) ( not ( = ?auto_2682 ?auto_2684 ) ) ( IS-CRATE ?auto_2674 ) ( not ( = ?auto_2688 ?auto_2679 ) ) ( HOIST-AT ?auto_2693 ?auto_2688 ) ( AVAILABLE ?auto_2693 ) ( SURFACE-AT ?auto_2674 ?auto_2688 ) ( ON ?auto_2674 ?auto_2685 ) ( CLEAR ?auto_2674 ) ( not ( = ?auto_2673 ?auto_2674 ) ) ( not ( = ?auto_2673 ?auto_2685 ) ) ( not ( = ?auto_2674 ?auto_2685 ) ) ( not ( = ?auto_2682 ?auto_2693 ) ) ( IS-CRATE ?auto_2673 ) ( not ( = ?auto_2695 ?auto_2679 ) ) ( HOIST-AT ?auto_2690 ?auto_2695 ) ( SURFACE-AT ?auto_2673 ?auto_2695 ) ( ON ?auto_2673 ?auto_2694 ) ( CLEAR ?auto_2673 ) ( not ( = ?auto_2672 ?auto_2673 ) ) ( not ( = ?auto_2672 ?auto_2694 ) ) ( not ( = ?auto_2673 ?auto_2694 ) ) ( not ( = ?auto_2682 ?auto_2690 ) ) ( IS-CRATE ?auto_2672 ) ( not ( = ?auto_2689 ?auto_2679 ) ) ( HOIST-AT ?auto_2683 ?auto_2689 ) ( AVAILABLE ?auto_2683 ) ( SURFACE-AT ?auto_2672 ?auto_2689 ) ( ON ?auto_2672 ?auto_2686 ) ( CLEAR ?auto_2672 ) ( not ( = ?auto_2671 ?auto_2672 ) ) ( not ( = ?auto_2671 ?auto_2686 ) ) ( not ( = ?auto_2672 ?auto_2686 ) ) ( not ( = ?auto_2682 ?auto_2683 ) ) ( SURFACE-AT ?auto_2670 ?auto_2679 ) ( CLEAR ?auto_2670 ) ( IS-CRATE ?auto_2671 ) ( AVAILABLE ?auto_2682 ) ( AVAILABLE ?auto_2690 ) ( SURFACE-AT ?auto_2671 ?auto_2695 ) ( ON ?auto_2671 ?auto_2687 ) ( CLEAR ?auto_2671 ) ( TRUCK-AT ?auto_2677 ?auto_2679 ) ( not ( = ?auto_2670 ?auto_2671 ) ) ( not ( = ?auto_2670 ?auto_2687 ) ) ( not ( = ?auto_2671 ?auto_2687 ) ) ( not ( = ?auto_2670 ?auto_2672 ) ) ( not ( = ?auto_2670 ?auto_2686 ) ) ( not ( = ?auto_2672 ?auto_2687 ) ) ( not ( = ?auto_2689 ?auto_2695 ) ) ( not ( = ?auto_2683 ?auto_2690 ) ) ( not ( = ?auto_2686 ?auto_2687 ) ) ( not ( = ?auto_2670 ?auto_2673 ) ) ( not ( = ?auto_2670 ?auto_2694 ) ) ( not ( = ?auto_2671 ?auto_2673 ) ) ( not ( = ?auto_2671 ?auto_2694 ) ) ( not ( = ?auto_2673 ?auto_2686 ) ) ( not ( = ?auto_2673 ?auto_2687 ) ) ( not ( = ?auto_2694 ?auto_2686 ) ) ( not ( = ?auto_2694 ?auto_2687 ) ) ( not ( = ?auto_2670 ?auto_2674 ) ) ( not ( = ?auto_2670 ?auto_2685 ) ) ( not ( = ?auto_2671 ?auto_2674 ) ) ( not ( = ?auto_2671 ?auto_2685 ) ) ( not ( = ?auto_2672 ?auto_2674 ) ) ( not ( = ?auto_2672 ?auto_2685 ) ) ( not ( = ?auto_2674 ?auto_2694 ) ) ( not ( = ?auto_2674 ?auto_2686 ) ) ( not ( = ?auto_2674 ?auto_2687 ) ) ( not ( = ?auto_2688 ?auto_2695 ) ) ( not ( = ?auto_2688 ?auto_2689 ) ) ( not ( = ?auto_2693 ?auto_2690 ) ) ( not ( = ?auto_2693 ?auto_2683 ) ) ( not ( = ?auto_2685 ?auto_2694 ) ) ( not ( = ?auto_2685 ?auto_2686 ) ) ( not ( = ?auto_2685 ?auto_2687 ) ) ( not ( = ?auto_2670 ?auto_2675 ) ) ( not ( = ?auto_2670 ?auto_2692 ) ) ( not ( = ?auto_2671 ?auto_2675 ) ) ( not ( = ?auto_2671 ?auto_2692 ) ) ( not ( = ?auto_2672 ?auto_2675 ) ) ( not ( = ?auto_2672 ?auto_2692 ) ) ( not ( = ?auto_2673 ?auto_2675 ) ) ( not ( = ?auto_2673 ?auto_2692 ) ) ( not ( = ?auto_2675 ?auto_2685 ) ) ( not ( = ?auto_2675 ?auto_2694 ) ) ( not ( = ?auto_2675 ?auto_2686 ) ) ( not ( = ?auto_2675 ?auto_2687 ) ) ( not ( = ?auto_2691 ?auto_2688 ) ) ( not ( = ?auto_2691 ?auto_2695 ) ) ( not ( = ?auto_2691 ?auto_2689 ) ) ( not ( = ?auto_2684 ?auto_2693 ) ) ( not ( = ?auto_2684 ?auto_2690 ) ) ( not ( = ?auto_2684 ?auto_2683 ) ) ( not ( = ?auto_2692 ?auto_2685 ) ) ( not ( = ?auto_2692 ?auto_2694 ) ) ( not ( = ?auto_2692 ?auto_2686 ) ) ( not ( = ?auto_2692 ?auto_2687 ) ) ( not ( = ?auto_2670 ?auto_2676 ) ) ( not ( = ?auto_2670 ?auto_2681 ) ) ( not ( = ?auto_2671 ?auto_2676 ) ) ( not ( = ?auto_2671 ?auto_2681 ) ) ( not ( = ?auto_2672 ?auto_2676 ) ) ( not ( = ?auto_2672 ?auto_2681 ) ) ( not ( = ?auto_2673 ?auto_2676 ) ) ( not ( = ?auto_2673 ?auto_2681 ) ) ( not ( = ?auto_2674 ?auto_2676 ) ) ( not ( = ?auto_2674 ?auto_2681 ) ) ( not ( = ?auto_2676 ?auto_2692 ) ) ( not ( = ?auto_2676 ?auto_2685 ) ) ( not ( = ?auto_2676 ?auto_2694 ) ) ( not ( = ?auto_2676 ?auto_2686 ) ) ( not ( = ?auto_2676 ?auto_2687 ) ) ( not ( = ?auto_2680 ?auto_2691 ) ) ( not ( = ?auto_2680 ?auto_2688 ) ) ( not ( = ?auto_2680 ?auto_2695 ) ) ( not ( = ?auto_2680 ?auto_2689 ) ) ( not ( = ?auto_2678 ?auto_2684 ) ) ( not ( = ?auto_2678 ?auto_2693 ) ) ( not ( = ?auto_2678 ?auto_2690 ) ) ( not ( = ?auto_2678 ?auto_2683 ) ) ( not ( = ?auto_2681 ?auto_2692 ) ) ( not ( = ?auto_2681 ?auto_2685 ) ) ( not ( = ?auto_2681 ?auto_2694 ) ) ( not ( = ?auto_2681 ?auto_2686 ) ) ( not ( = ?auto_2681 ?auto_2687 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2670 ?auto_2671 ?auto_2672 ?auto_2673 ?auto_2674 ?auto_2675 )
      ( MAKE-1CRATE ?auto_2675 ?auto_2676 )
      ( MAKE-6CRATE-VERIFY ?auto_2670 ?auto_2671 ?auto_2672 ?auto_2673 ?auto_2674 ?auto_2675 ?auto_2676 ) )
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
      ?auto_2720 - SURFACE
      ?auto_2721 - SURFACE
    )
    :vars
    (
      ?auto_2727 - HOIST
      ?auto_2723 - PLACE
      ?auto_2722 - PLACE
      ?auto_2724 - HOIST
      ?auto_2725 - SURFACE
      ?auto_2737 - PLACE
      ?auto_2743 - HOIST
      ?auto_2736 - SURFACE
      ?auto_2740 - PLACE
      ?auto_2730 - HOIST
      ?auto_2733 - SURFACE
      ?auto_2741 - PLACE
      ?auto_2732 - HOIST
      ?auto_2742 - SURFACE
      ?auto_2738 - PLACE
      ?auto_2728 - HOIST
      ?auto_2731 - SURFACE
      ?auto_2735 - PLACE
      ?auto_2729 - HOIST
      ?auto_2739 - SURFACE
      ?auto_2734 - SURFACE
      ?auto_2726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2727 ?auto_2723 ) ( IS-CRATE ?auto_2721 ) ( not ( = ?auto_2722 ?auto_2723 ) ) ( HOIST-AT ?auto_2724 ?auto_2722 ) ( AVAILABLE ?auto_2724 ) ( SURFACE-AT ?auto_2721 ?auto_2722 ) ( ON ?auto_2721 ?auto_2725 ) ( CLEAR ?auto_2721 ) ( not ( = ?auto_2720 ?auto_2721 ) ) ( not ( = ?auto_2720 ?auto_2725 ) ) ( not ( = ?auto_2721 ?auto_2725 ) ) ( not ( = ?auto_2727 ?auto_2724 ) ) ( IS-CRATE ?auto_2720 ) ( not ( = ?auto_2737 ?auto_2723 ) ) ( HOIST-AT ?auto_2743 ?auto_2737 ) ( AVAILABLE ?auto_2743 ) ( SURFACE-AT ?auto_2720 ?auto_2737 ) ( ON ?auto_2720 ?auto_2736 ) ( CLEAR ?auto_2720 ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( not ( = ?auto_2719 ?auto_2736 ) ) ( not ( = ?auto_2720 ?auto_2736 ) ) ( not ( = ?auto_2727 ?auto_2743 ) ) ( IS-CRATE ?auto_2719 ) ( not ( = ?auto_2740 ?auto_2723 ) ) ( HOIST-AT ?auto_2730 ?auto_2740 ) ( AVAILABLE ?auto_2730 ) ( SURFACE-AT ?auto_2719 ?auto_2740 ) ( ON ?auto_2719 ?auto_2733 ) ( CLEAR ?auto_2719 ) ( not ( = ?auto_2718 ?auto_2719 ) ) ( not ( = ?auto_2718 ?auto_2733 ) ) ( not ( = ?auto_2719 ?auto_2733 ) ) ( not ( = ?auto_2727 ?auto_2730 ) ) ( IS-CRATE ?auto_2718 ) ( not ( = ?auto_2741 ?auto_2723 ) ) ( HOIST-AT ?auto_2732 ?auto_2741 ) ( AVAILABLE ?auto_2732 ) ( SURFACE-AT ?auto_2718 ?auto_2741 ) ( ON ?auto_2718 ?auto_2742 ) ( CLEAR ?auto_2718 ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( not ( = ?auto_2717 ?auto_2742 ) ) ( not ( = ?auto_2718 ?auto_2742 ) ) ( not ( = ?auto_2727 ?auto_2732 ) ) ( IS-CRATE ?auto_2717 ) ( not ( = ?auto_2738 ?auto_2723 ) ) ( HOIST-AT ?auto_2728 ?auto_2738 ) ( SURFACE-AT ?auto_2717 ?auto_2738 ) ( ON ?auto_2717 ?auto_2731 ) ( CLEAR ?auto_2717 ) ( not ( = ?auto_2716 ?auto_2717 ) ) ( not ( = ?auto_2716 ?auto_2731 ) ) ( not ( = ?auto_2717 ?auto_2731 ) ) ( not ( = ?auto_2727 ?auto_2728 ) ) ( IS-CRATE ?auto_2716 ) ( not ( = ?auto_2735 ?auto_2723 ) ) ( HOIST-AT ?auto_2729 ?auto_2735 ) ( AVAILABLE ?auto_2729 ) ( SURFACE-AT ?auto_2716 ?auto_2735 ) ( ON ?auto_2716 ?auto_2739 ) ( CLEAR ?auto_2716 ) ( not ( = ?auto_2715 ?auto_2716 ) ) ( not ( = ?auto_2715 ?auto_2739 ) ) ( not ( = ?auto_2716 ?auto_2739 ) ) ( not ( = ?auto_2727 ?auto_2729 ) ) ( SURFACE-AT ?auto_2714 ?auto_2723 ) ( CLEAR ?auto_2714 ) ( IS-CRATE ?auto_2715 ) ( AVAILABLE ?auto_2727 ) ( AVAILABLE ?auto_2728 ) ( SURFACE-AT ?auto_2715 ?auto_2738 ) ( ON ?auto_2715 ?auto_2734 ) ( CLEAR ?auto_2715 ) ( TRUCK-AT ?auto_2726 ?auto_2723 ) ( not ( = ?auto_2714 ?auto_2715 ) ) ( not ( = ?auto_2714 ?auto_2734 ) ) ( not ( = ?auto_2715 ?auto_2734 ) ) ( not ( = ?auto_2714 ?auto_2716 ) ) ( not ( = ?auto_2714 ?auto_2739 ) ) ( not ( = ?auto_2716 ?auto_2734 ) ) ( not ( = ?auto_2735 ?auto_2738 ) ) ( not ( = ?auto_2729 ?auto_2728 ) ) ( not ( = ?auto_2739 ?auto_2734 ) ) ( not ( = ?auto_2714 ?auto_2717 ) ) ( not ( = ?auto_2714 ?auto_2731 ) ) ( not ( = ?auto_2715 ?auto_2717 ) ) ( not ( = ?auto_2715 ?auto_2731 ) ) ( not ( = ?auto_2717 ?auto_2739 ) ) ( not ( = ?auto_2717 ?auto_2734 ) ) ( not ( = ?auto_2731 ?auto_2739 ) ) ( not ( = ?auto_2731 ?auto_2734 ) ) ( not ( = ?auto_2714 ?auto_2718 ) ) ( not ( = ?auto_2714 ?auto_2742 ) ) ( not ( = ?auto_2715 ?auto_2718 ) ) ( not ( = ?auto_2715 ?auto_2742 ) ) ( not ( = ?auto_2716 ?auto_2718 ) ) ( not ( = ?auto_2716 ?auto_2742 ) ) ( not ( = ?auto_2718 ?auto_2731 ) ) ( not ( = ?auto_2718 ?auto_2739 ) ) ( not ( = ?auto_2718 ?auto_2734 ) ) ( not ( = ?auto_2741 ?auto_2738 ) ) ( not ( = ?auto_2741 ?auto_2735 ) ) ( not ( = ?auto_2732 ?auto_2728 ) ) ( not ( = ?auto_2732 ?auto_2729 ) ) ( not ( = ?auto_2742 ?auto_2731 ) ) ( not ( = ?auto_2742 ?auto_2739 ) ) ( not ( = ?auto_2742 ?auto_2734 ) ) ( not ( = ?auto_2714 ?auto_2719 ) ) ( not ( = ?auto_2714 ?auto_2733 ) ) ( not ( = ?auto_2715 ?auto_2719 ) ) ( not ( = ?auto_2715 ?auto_2733 ) ) ( not ( = ?auto_2716 ?auto_2719 ) ) ( not ( = ?auto_2716 ?auto_2733 ) ) ( not ( = ?auto_2717 ?auto_2719 ) ) ( not ( = ?auto_2717 ?auto_2733 ) ) ( not ( = ?auto_2719 ?auto_2742 ) ) ( not ( = ?auto_2719 ?auto_2731 ) ) ( not ( = ?auto_2719 ?auto_2739 ) ) ( not ( = ?auto_2719 ?auto_2734 ) ) ( not ( = ?auto_2740 ?auto_2741 ) ) ( not ( = ?auto_2740 ?auto_2738 ) ) ( not ( = ?auto_2740 ?auto_2735 ) ) ( not ( = ?auto_2730 ?auto_2732 ) ) ( not ( = ?auto_2730 ?auto_2728 ) ) ( not ( = ?auto_2730 ?auto_2729 ) ) ( not ( = ?auto_2733 ?auto_2742 ) ) ( not ( = ?auto_2733 ?auto_2731 ) ) ( not ( = ?auto_2733 ?auto_2739 ) ) ( not ( = ?auto_2733 ?auto_2734 ) ) ( not ( = ?auto_2714 ?auto_2720 ) ) ( not ( = ?auto_2714 ?auto_2736 ) ) ( not ( = ?auto_2715 ?auto_2720 ) ) ( not ( = ?auto_2715 ?auto_2736 ) ) ( not ( = ?auto_2716 ?auto_2720 ) ) ( not ( = ?auto_2716 ?auto_2736 ) ) ( not ( = ?auto_2717 ?auto_2720 ) ) ( not ( = ?auto_2717 ?auto_2736 ) ) ( not ( = ?auto_2718 ?auto_2720 ) ) ( not ( = ?auto_2718 ?auto_2736 ) ) ( not ( = ?auto_2720 ?auto_2733 ) ) ( not ( = ?auto_2720 ?auto_2742 ) ) ( not ( = ?auto_2720 ?auto_2731 ) ) ( not ( = ?auto_2720 ?auto_2739 ) ) ( not ( = ?auto_2720 ?auto_2734 ) ) ( not ( = ?auto_2737 ?auto_2740 ) ) ( not ( = ?auto_2737 ?auto_2741 ) ) ( not ( = ?auto_2737 ?auto_2738 ) ) ( not ( = ?auto_2737 ?auto_2735 ) ) ( not ( = ?auto_2743 ?auto_2730 ) ) ( not ( = ?auto_2743 ?auto_2732 ) ) ( not ( = ?auto_2743 ?auto_2728 ) ) ( not ( = ?auto_2743 ?auto_2729 ) ) ( not ( = ?auto_2736 ?auto_2733 ) ) ( not ( = ?auto_2736 ?auto_2742 ) ) ( not ( = ?auto_2736 ?auto_2731 ) ) ( not ( = ?auto_2736 ?auto_2739 ) ) ( not ( = ?auto_2736 ?auto_2734 ) ) ( not ( = ?auto_2714 ?auto_2721 ) ) ( not ( = ?auto_2714 ?auto_2725 ) ) ( not ( = ?auto_2715 ?auto_2721 ) ) ( not ( = ?auto_2715 ?auto_2725 ) ) ( not ( = ?auto_2716 ?auto_2721 ) ) ( not ( = ?auto_2716 ?auto_2725 ) ) ( not ( = ?auto_2717 ?auto_2721 ) ) ( not ( = ?auto_2717 ?auto_2725 ) ) ( not ( = ?auto_2718 ?auto_2721 ) ) ( not ( = ?auto_2718 ?auto_2725 ) ) ( not ( = ?auto_2719 ?auto_2721 ) ) ( not ( = ?auto_2719 ?auto_2725 ) ) ( not ( = ?auto_2721 ?auto_2736 ) ) ( not ( = ?auto_2721 ?auto_2733 ) ) ( not ( = ?auto_2721 ?auto_2742 ) ) ( not ( = ?auto_2721 ?auto_2731 ) ) ( not ( = ?auto_2721 ?auto_2739 ) ) ( not ( = ?auto_2721 ?auto_2734 ) ) ( not ( = ?auto_2722 ?auto_2737 ) ) ( not ( = ?auto_2722 ?auto_2740 ) ) ( not ( = ?auto_2722 ?auto_2741 ) ) ( not ( = ?auto_2722 ?auto_2738 ) ) ( not ( = ?auto_2722 ?auto_2735 ) ) ( not ( = ?auto_2724 ?auto_2743 ) ) ( not ( = ?auto_2724 ?auto_2730 ) ) ( not ( = ?auto_2724 ?auto_2732 ) ) ( not ( = ?auto_2724 ?auto_2728 ) ) ( not ( = ?auto_2724 ?auto_2729 ) ) ( not ( = ?auto_2725 ?auto_2736 ) ) ( not ( = ?auto_2725 ?auto_2733 ) ) ( not ( = ?auto_2725 ?auto_2742 ) ) ( not ( = ?auto_2725 ?auto_2731 ) ) ( not ( = ?auto_2725 ?auto_2739 ) ) ( not ( = ?auto_2725 ?auto_2734 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2714 ?auto_2715 ?auto_2716 ?auto_2717 ?auto_2718 ?auto_2719 ?auto_2720 )
      ( MAKE-1CRATE ?auto_2720 ?auto_2721 )
      ( MAKE-7CRATE-VERIFY ?auto_2714 ?auto_2715 ?auto_2716 ?auto_2717 ?auto_2718 ?auto_2719 ?auto_2720 ?auto_2721 ) )
  )

)

