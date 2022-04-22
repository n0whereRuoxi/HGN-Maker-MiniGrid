( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2593 - BLOCK
      ?auto_2594 - BLOCK
      ?auto_2595 - BLOCK
    )
    :vars
    (
      ?auto_2596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2596 ?auto_2595 ) ( CLEAR ?auto_2596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2593 ) ( ON ?auto_2594 ?auto_2593 ) ( ON ?auto_2595 ?auto_2594 ) ( not ( = ?auto_2593 ?auto_2594 ) ) ( not ( = ?auto_2593 ?auto_2595 ) ) ( not ( = ?auto_2593 ?auto_2596 ) ) ( not ( = ?auto_2594 ?auto_2595 ) ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( not ( = ?auto_2595 ?auto_2596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2596 ?auto_2595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2598 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2598 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2598 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2599 - BLOCK
    )
    :vars
    (
      ?auto_2600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2599 ?auto_2600 ) ( CLEAR ?auto_2599 ) ( HAND-EMPTY ) ( not ( = ?auto_2599 ?auto_2600 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2599 ?auto_2600 )
      ( MAKE-1PILE ?auto_2599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2603 - BLOCK
      ?auto_2604 - BLOCK
    )
    :vars
    (
      ?auto_2605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2605 ?auto_2604 ) ( CLEAR ?auto_2605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2603 ) ( ON ?auto_2604 ?auto_2603 ) ( not ( = ?auto_2603 ?auto_2604 ) ) ( not ( = ?auto_2603 ?auto_2605 ) ) ( not ( = ?auto_2604 ?auto_2605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2605 ?auto_2604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2606 - BLOCK
      ?auto_2607 - BLOCK
    )
    :vars
    (
      ?auto_2608 - BLOCK
      ?auto_2609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2608 ?auto_2607 ) ( CLEAR ?auto_2608 ) ( ON-TABLE ?auto_2606 ) ( ON ?auto_2607 ?auto_2606 ) ( not ( = ?auto_2606 ?auto_2607 ) ) ( not ( = ?auto_2606 ?auto_2608 ) ) ( not ( = ?auto_2607 ?auto_2608 ) ) ( HOLDING ?auto_2609 ) ( not ( = ?auto_2606 ?auto_2609 ) ) ( not ( = ?auto_2607 ?auto_2609 ) ) ( not ( = ?auto_2608 ?auto_2609 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2609 )
      ( MAKE-2PILE ?auto_2606 ?auto_2607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2610 - BLOCK
      ?auto_2611 - BLOCK
    )
    :vars
    (
      ?auto_2612 - BLOCK
      ?auto_2613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2612 ?auto_2611 ) ( ON-TABLE ?auto_2610 ) ( ON ?auto_2611 ?auto_2610 ) ( not ( = ?auto_2610 ?auto_2611 ) ) ( not ( = ?auto_2610 ?auto_2612 ) ) ( not ( = ?auto_2611 ?auto_2612 ) ) ( not ( = ?auto_2610 ?auto_2613 ) ) ( not ( = ?auto_2611 ?auto_2613 ) ) ( not ( = ?auto_2612 ?auto_2613 ) ) ( ON ?auto_2613 ?auto_2612 ) ( CLEAR ?auto_2613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2610 ?auto_2611 ?auto_2612 )
      ( MAKE-2PILE ?auto_2610 ?auto_2611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2616 - BLOCK
      ?auto_2617 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2617 ) ( CLEAR ?auto_2616 ) ( ON-TABLE ?auto_2616 ) ( not ( = ?auto_2616 ?auto_2617 ) ) )
    :subtasks
    ( ( !STACK ?auto_2617 ?auto_2616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2618 - BLOCK
      ?auto_2619 - BLOCK
    )
    :vars
    (
      ?auto_2620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2618 ) ( ON-TABLE ?auto_2618 ) ( not ( = ?auto_2618 ?auto_2619 ) ) ( ON ?auto_2619 ?auto_2620 ) ( CLEAR ?auto_2619 ) ( HAND-EMPTY ) ( not ( = ?auto_2618 ?auto_2620 ) ) ( not ( = ?auto_2619 ?auto_2620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2619 ?auto_2620 )
      ( MAKE-2PILE ?auto_2618 ?auto_2619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2621 - BLOCK
      ?auto_2622 - BLOCK
    )
    :vars
    (
      ?auto_2623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2621 ?auto_2622 ) ) ( ON ?auto_2622 ?auto_2623 ) ( CLEAR ?auto_2622 ) ( not ( = ?auto_2621 ?auto_2623 ) ) ( not ( = ?auto_2622 ?auto_2623 ) ) ( HOLDING ?auto_2621 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2621 )
      ( MAKE-2PILE ?auto_2621 ?auto_2622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2624 - BLOCK
      ?auto_2625 - BLOCK
    )
    :vars
    (
      ?auto_2626 - BLOCK
      ?auto_2627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2624 ?auto_2625 ) ) ( ON ?auto_2625 ?auto_2626 ) ( not ( = ?auto_2624 ?auto_2626 ) ) ( not ( = ?auto_2625 ?auto_2626 ) ) ( ON ?auto_2624 ?auto_2625 ) ( CLEAR ?auto_2624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2627 ) ( ON ?auto_2626 ?auto_2627 ) ( not ( = ?auto_2627 ?auto_2626 ) ) ( not ( = ?auto_2627 ?auto_2625 ) ) ( not ( = ?auto_2627 ?auto_2624 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2627 ?auto_2626 ?auto_2625 )
      ( MAKE-2PILE ?auto_2624 ?auto_2625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2629 - BLOCK
    )
    :vars
    (
      ?auto_2630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2630 ?auto_2629 ) ( CLEAR ?auto_2630 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2629 ) ( not ( = ?auto_2629 ?auto_2630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2630 ?auto_2629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2631 - BLOCK
    )
    :vars
    (
      ?auto_2632 - BLOCK
      ?auto_2633 - BLOCK
      ?auto_2634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2632 ?auto_2631 ) ( CLEAR ?auto_2632 ) ( ON-TABLE ?auto_2631 ) ( not ( = ?auto_2631 ?auto_2632 ) ) ( HOLDING ?auto_2633 ) ( CLEAR ?auto_2634 ) ( not ( = ?auto_2631 ?auto_2633 ) ) ( not ( = ?auto_2631 ?auto_2634 ) ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( not ( = ?auto_2632 ?auto_2634 ) ) ( not ( = ?auto_2633 ?auto_2634 ) ) )
    :subtasks
    ( ( !STACK ?auto_2633 ?auto_2634 )
      ( MAKE-1PILE ?auto_2631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2721 - BLOCK
    )
    :vars
    (
      ?auto_2723 - BLOCK
      ?auto_2722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2723 ?auto_2721 ) ( ON-TABLE ?auto_2721 ) ( not ( = ?auto_2721 ?auto_2723 ) ) ( not ( = ?auto_2721 ?auto_2722 ) ) ( not ( = ?auto_2723 ?auto_2722 ) ) ( ON ?auto_2722 ?auto_2723 ) ( CLEAR ?auto_2722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2721 ?auto_2723 )
      ( MAKE-1PILE ?auto_2721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2639 - BLOCK
    )
    :vars
    (
      ?auto_2641 - BLOCK
      ?auto_2640 - BLOCK
      ?auto_2642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2641 ?auto_2639 ) ( ON-TABLE ?auto_2639 ) ( not ( = ?auto_2639 ?auto_2641 ) ) ( not ( = ?auto_2639 ?auto_2640 ) ) ( not ( = ?auto_2639 ?auto_2642 ) ) ( not ( = ?auto_2641 ?auto_2640 ) ) ( not ( = ?auto_2641 ?auto_2642 ) ) ( not ( = ?auto_2640 ?auto_2642 ) ) ( ON ?auto_2640 ?auto_2641 ) ( CLEAR ?auto_2640 ) ( HOLDING ?auto_2642 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2642 )
      ( MAKE-1PILE ?auto_2639 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2643 - BLOCK
    )
    :vars
    (
      ?auto_2644 - BLOCK
      ?auto_2645 - BLOCK
      ?auto_2646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2644 ?auto_2643 ) ( ON-TABLE ?auto_2643 ) ( not ( = ?auto_2643 ?auto_2644 ) ) ( not ( = ?auto_2643 ?auto_2645 ) ) ( not ( = ?auto_2643 ?auto_2646 ) ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( not ( = ?auto_2644 ?auto_2646 ) ) ( not ( = ?auto_2645 ?auto_2646 ) ) ( ON ?auto_2645 ?auto_2644 ) ( ON ?auto_2646 ?auto_2645 ) ( CLEAR ?auto_2646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2643 ?auto_2644 ?auto_2645 )
      ( MAKE-1PILE ?auto_2643 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2650 - BLOCK
      ?auto_2651 - BLOCK
      ?auto_2652 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2652 ) ( CLEAR ?auto_2651 ) ( ON-TABLE ?auto_2650 ) ( ON ?auto_2651 ?auto_2650 ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( not ( = ?auto_2650 ?auto_2652 ) ) ( not ( = ?auto_2651 ?auto_2652 ) ) )
    :subtasks
    ( ( !STACK ?auto_2652 ?auto_2651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2653 - BLOCK
      ?auto_2654 - BLOCK
      ?auto_2655 - BLOCK
    )
    :vars
    (
      ?auto_2656 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2654 ) ( ON-TABLE ?auto_2653 ) ( ON ?auto_2654 ?auto_2653 ) ( not ( = ?auto_2653 ?auto_2654 ) ) ( not ( = ?auto_2653 ?auto_2655 ) ) ( not ( = ?auto_2654 ?auto_2655 ) ) ( ON ?auto_2655 ?auto_2656 ) ( CLEAR ?auto_2655 ) ( HAND-EMPTY ) ( not ( = ?auto_2653 ?auto_2656 ) ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( not ( = ?auto_2655 ?auto_2656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2655 ?auto_2656 )
      ( MAKE-3PILE ?auto_2653 ?auto_2654 ?auto_2655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2657 - BLOCK
      ?auto_2658 - BLOCK
      ?auto_2659 - BLOCK
    )
    :vars
    (
      ?auto_2660 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2657 ) ( not ( = ?auto_2657 ?auto_2658 ) ) ( not ( = ?auto_2657 ?auto_2659 ) ) ( not ( = ?auto_2658 ?auto_2659 ) ) ( ON ?auto_2659 ?auto_2660 ) ( CLEAR ?auto_2659 ) ( not ( = ?auto_2657 ?auto_2660 ) ) ( not ( = ?auto_2658 ?auto_2660 ) ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( HOLDING ?auto_2658 ) ( CLEAR ?auto_2657 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2657 ?auto_2658 )
      ( MAKE-3PILE ?auto_2657 ?auto_2658 ?auto_2659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2661 - BLOCK
      ?auto_2662 - BLOCK
      ?auto_2663 - BLOCK
    )
    :vars
    (
      ?auto_2664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2661 ) ( not ( = ?auto_2661 ?auto_2662 ) ) ( not ( = ?auto_2661 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2663 ) ) ( ON ?auto_2663 ?auto_2664 ) ( not ( = ?auto_2661 ?auto_2664 ) ) ( not ( = ?auto_2662 ?auto_2664 ) ) ( not ( = ?auto_2663 ?auto_2664 ) ) ( CLEAR ?auto_2661 ) ( ON ?auto_2662 ?auto_2663 ) ( CLEAR ?auto_2662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2664 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2664 ?auto_2663 )
      ( MAKE-3PILE ?auto_2661 ?auto_2662 ?auto_2663 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2665 - BLOCK
      ?auto_2666 - BLOCK
      ?auto_2667 - BLOCK
    )
    :vars
    (
      ?auto_2668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2665 ?auto_2666 ) ) ( not ( = ?auto_2665 ?auto_2667 ) ) ( not ( = ?auto_2666 ?auto_2667 ) ) ( ON ?auto_2667 ?auto_2668 ) ( not ( = ?auto_2665 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( ON ?auto_2666 ?auto_2667 ) ( CLEAR ?auto_2666 ) ( ON-TABLE ?auto_2668 ) ( HOLDING ?auto_2665 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2665 )
      ( MAKE-3PILE ?auto_2665 ?auto_2666 ?auto_2667 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2669 - BLOCK
      ?auto_2670 - BLOCK
      ?auto_2671 - BLOCK
    )
    :vars
    (
      ?auto_2672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2669 ?auto_2670 ) ) ( not ( = ?auto_2669 ?auto_2671 ) ) ( not ( = ?auto_2670 ?auto_2671 ) ) ( ON ?auto_2671 ?auto_2672 ) ( not ( = ?auto_2669 ?auto_2672 ) ) ( not ( = ?auto_2670 ?auto_2672 ) ) ( not ( = ?auto_2671 ?auto_2672 ) ) ( ON ?auto_2670 ?auto_2671 ) ( ON-TABLE ?auto_2672 ) ( ON ?auto_2669 ?auto_2670 ) ( CLEAR ?auto_2669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2672 ?auto_2671 ?auto_2670 )
      ( MAKE-3PILE ?auto_2669 ?auto_2670 ?auto_2671 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2699 - BLOCK
    )
    :vars
    (
      ?auto_2700 - BLOCK
      ?auto_2701 - BLOCK
      ?auto_2702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2699 ?auto_2700 ) ( CLEAR ?auto_2699 ) ( not ( = ?auto_2699 ?auto_2700 ) ) ( HOLDING ?auto_2701 ) ( CLEAR ?auto_2702 ) ( not ( = ?auto_2699 ?auto_2701 ) ) ( not ( = ?auto_2699 ?auto_2702 ) ) ( not ( = ?auto_2700 ?auto_2701 ) ) ( not ( = ?auto_2700 ?auto_2702 ) ) ( not ( = ?auto_2701 ?auto_2702 ) ) )
    :subtasks
    ( ( !STACK ?auto_2701 ?auto_2702 )
      ( MAKE-1PILE ?auto_2699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2703 - BLOCK
    )
    :vars
    (
      ?auto_2704 - BLOCK
      ?auto_2705 - BLOCK
      ?auto_2706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2703 ?auto_2704 ) ( not ( = ?auto_2703 ?auto_2704 ) ) ( CLEAR ?auto_2705 ) ( not ( = ?auto_2703 ?auto_2706 ) ) ( not ( = ?auto_2703 ?auto_2705 ) ) ( not ( = ?auto_2704 ?auto_2706 ) ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( not ( = ?auto_2706 ?auto_2705 ) ) ( ON ?auto_2706 ?auto_2703 ) ( CLEAR ?auto_2706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2704 ?auto_2703 )
      ( MAKE-1PILE ?auto_2703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2707 - BLOCK
    )
    :vars
    (
      ?auto_2710 - BLOCK
      ?auto_2709 - BLOCK
      ?auto_2708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2707 ?auto_2710 ) ( not ( = ?auto_2707 ?auto_2710 ) ) ( not ( = ?auto_2707 ?auto_2709 ) ) ( not ( = ?auto_2707 ?auto_2708 ) ) ( not ( = ?auto_2710 ?auto_2709 ) ) ( not ( = ?auto_2710 ?auto_2708 ) ) ( not ( = ?auto_2709 ?auto_2708 ) ) ( ON ?auto_2709 ?auto_2707 ) ( CLEAR ?auto_2709 ) ( ON-TABLE ?auto_2710 ) ( HOLDING ?auto_2708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2708 )
      ( MAKE-1PILE ?auto_2707 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2711 - BLOCK
    )
    :vars
    (
      ?auto_2712 - BLOCK
      ?auto_2714 - BLOCK
      ?auto_2713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2711 ?auto_2712 ) ( not ( = ?auto_2711 ?auto_2712 ) ) ( not ( = ?auto_2711 ?auto_2714 ) ) ( not ( = ?auto_2711 ?auto_2713 ) ) ( not ( = ?auto_2712 ?auto_2714 ) ) ( not ( = ?auto_2712 ?auto_2713 ) ) ( not ( = ?auto_2714 ?auto_2713 ) ) ( ON ?auto_2714 ?auto_2711 ) ( ON-TABLE ?auto_2712 ) ( ON ?auto_2713 ?auto_2714 ) ( CLEAR ?auto_2713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2712 ?auto_2711 ?auto_2714 )
      ( MAKE-1PILE ?auto_2711 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2718 - BLOCK
    )
    :vars
    (
      ?auto_2719 - BLOCK
      ?auto_2720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2719 ?auto_2718 ) ( CLEAR ?auto_2719 ) ( ON-TABLE ?auto_2718 ) ( not ( = ?auto_2718 ?auto_2719 ) ) ( HOLDING ?auto_2720 ) ( not ( = ?auto_2718 ?auto_2720 ) ) ( not ( = ?auto_2719 ?auto_2720 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2720 )
      ( MAKE-1PILE ?auto_2718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2743 - BLOCK
      ?auto_2744 - BLOCK
    )
    :vars
    (
      ?auto_2745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2743 ?auto_2744 ) ) ( ON ?auto_2744 ?auto_2745 ) ( not ( = ?auto_2743 ?auto_2745 ) ) ( not ( = ?auto_2744 ?auto_2745 ) ) ( ON ?auto_2743 ?auto_2744 ) ( CLEAR ?auto_2743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2745 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2745 ?auto_2744 )
      ( MAKE-2PILE ?auto_2743 ?auto_2744 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2748 - BLOCK
      ?auto_2749 - BLOCK
    )
    :vars
    (
      ?auto_2750 - BLOCK
      ?auto_2751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2748 ?auto_2749 ) ) ( ON ?auto_2749 ?auto_2750 ) ( CLEAR ?auto_2749 ) ( not ( = ?auto_2748 ?auto_2750 ) ) ( not ( = ?auto_2749 ?auto_2750 ) ) ( ON ?auto_2748 ?auto_2751 ) ( CLEAR ?auto_2748 ) ( HAND-EMPTY ) ( not ( = ?auto_2748 ?auto_2751 ) ) ( not ( = ?auto_2749 ?auto_2751 ) ) ( not ( = ?auto_2750 ?auto_2751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2748 ?auto_2751 )
      ( MAKE-2PILE ?auto_2748 ?auto_2749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2752 - BLOCK
      ?auto_2753 - BLOCK
    )
    :vars
    (
      ?auto_2754 - BLOCK
      ?auto_2755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2752 ?auto_2753 ) ) ( not ( = ?auto_2752 ?auto_2754 ) ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( ON ?auto_2752 ?auto_2755 ) ( CLEAR ?auto_2752 ) ( not ( = ?auto_2752 ?auto_2755 ) ) ( not ( = ?auto_2753 ?auto_2755 ) ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( HOLDING ?auto_2753 ) ( CLEAR ?auto_2754 ) ( ON-TABLE ?auto_2754 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2754 ?auto_2753 )
      ( MAKE-2PILE ?auto_2752 ?auto_2753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2756 - BLOCK
      ?auto_2757 - BLOCK
    )
    :vars
    (
      ?auto_2759 - BLOCK
      ?auto_2758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2756 ?auto_2757 ) ) ( not ( = ?auto_2756 ?auto_2759 ) ) ( not ( = ?auto_2757 ?auto_2759 ) ) ( ON ?auto_2756 ?auto_2758 ) ( not ( = ?auto_2756 ?auto_2758 ) ) ( not ( = ?auto_2757 ?auto_2758 ) ) ( not ( = ?auto_2759 ?auto_2758 ) ) ( CLEAR ?auto_2759 ) ( ON-TABLE ?auto_2759 ) ( ON ?auto_2757 ?auto_2756 ) ( CLEAR ?auto_2757 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2758 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2758 ?auto_2756 )
      ( MAKE-2PILE ?auto_2756 ?auto_2757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2760 - BLOCK
      ?auto_2761 - BLOCK
    )
    :vars
    (
      ?auto_2763 - BLOCK
      ?auto_2762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2760 ?auto_2761 ) ) ( not ( = ?auto_2760 ?auto_2763 ) ) ( not ( = ?auto_2761 ?auto_2763 ) ) ( ON ?auto_2760 ?auto_2762 ) ( not ( = ?auto_2760 ?auto_2762 ) ) ( not ( = ?auto_2761 ?auto_2762 ) ) ( not ( = ?auto_2763 ?auto_2762 ) ) ( ON ?auto_2761 ?auto_2760 ) ( CLEAR ?auto_2761 ) ( ON-TABLE ?auto_2762 ) ( HOLDING ?auto_2763 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2763 )
      ( MAKE-2PILE ?auto_2760 ?auto_2761 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2764 - BLOCK
      ?auto_2765 - BLOCK
    )
    :vars
    (
      ?auto_2767 - BLOCK
      ?auto_2766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2764 ?auto_2765 ) ) ( not ( = ?auto_2764 ?auto_2767 ) ) ( not ( = ?auto_2765 ?auto_2767 ) ) ( ON ?auto_2764 ?auto_2766 ) ( not ( = ?auto_2764 ?auto_2766 ) ) ( not ( = ?auto_2765 ?auto_2766 ) ) ( not ( = ?auto_2767 ?auto_2766 ) ) ( ON ?auto_2765 ?auto_2764 ) ( ON-TABLE ?auto_2766 ) ( ON ?auto_2767 ?auto_2765 ) ( CLEAR ?auto_2767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2766 ?auto_2764 ?auto_2765 )
      ( MAKE-2PILE ?auto_2764 ?auto_2765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2774 - BLOCK
      ?auto_2775 - BLOCK
      ?auto_2776 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2775 ) ( ON-TABLE ?auto_2774 ) ( ON ?auto_2775 ?auto_2774 ) ( not ( = ?auto_2774 ?auto_2775 ) ) ( not ( = ?auto_2774 ?auto_2776 ) ) ( not ( = ?auto_2775 ?auto_2776 ) ) ( ON-TABLE ?auto_2776 ) ( CLEAR ?auto_2776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2776 )
      ( MAKE-3PILE ?auto_2774 ?auto_2775 ?auto_2776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2777 - BLOCK
      ?auto_2778 - BLOCK
      ?auto_2779 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2777 ) ( not ( = ?auto_2777 ?auto_2778 ) ) ( not ( = ?auto_2777 ?auto_2779 ) ) ( not ( = ?auto_2778 ?auto_2779 ) ) ( ON-TABLE ?auto_2779 ) ( CLEAR ?auto_2779 ) ( HOLDING ?auto_2778 ) ( CLEAR ?auto_2777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2777 ?auto_2778 )
      ( MAKE-3PILE ?auto_2777 ?auto_2778 ?auto_2779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2780 - BLOCK
      ?auto_2781 - BLOCK
      ?auto_2782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2780 ) ( not ( = ?auto_2780 ?auto_2781 ) ) ( not ( = ?auto_2780 ?auto_2782 ) ) ( not ( = ?auto_2781 ?auto_2782 ) ) ( ON-TABLE ?auto_2782 ) ( CLEAR ?auto_2780 ) ( ON ?auto_2781 ?auto_2782 ) ( CLEAR ?auto_2781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2782 )
      ( MAKE-3PILE ?auto_2780 ?auto_2781 ?auto_2782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2783 - BLOCK
      ?auto_2784 - BLOCK
      ?auto_2785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2783 ?auto_2784 ) ) ( not ( = ?auto_2783 ?auto_2785 ) ) ( not ( = ?auto_2784 ?auto_2785 ) ) ( ON-TABLE ?auto_2785 ) ( ON ?auto_2784 ?auto_2785 ) ( CLEAR ?auto_2784 ) ( HOLDING ?auto_2783 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2783 )
      ( MAKE-3PILE ?auto_2783 ?auto_2784 ?auto_2785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2786 - BLOCK
      ?auto_2787 - BLOCK
      ?auto_2788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2786 ?auto_2787 ) ) ( not ( = ?auto_2786 ?auto_2788 ) ) ( not ( = ?auto_2787 ?auto_2788 ) ) ( ON-TABLE ?auto_2788 ) ( ON ?auto_2787 ?auto_2788 ) ( ON ?auto_2786 ?auto_2787 ) ( CLEAR ?auto_2786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2788 ?auto_2787 )
      ( MAKE-3PILE ?auto_2786 ?auto_2787 ?auto_2788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2792 - BLOCK
      ?auto_2793 - BLOCK
      ?auto_2794 - BLOCK
    )
    :vars
    (
      ?auto_2795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2792 ?auto_2793 ) ) ( not ( = ?auto_2792 ?auto_2794 ) ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( ON-TABLE ?auto_2794 ) ( ON ?auto_2793 ?auto_2794 ) ( CLEAR ?auto_2793 ) ( ON ?auto_2792 ?auto_2795 ) ( CLEAR ?auto_2792 ) ( HAND-EMPTY ) ( not ( = ?auto_2792 ?auto_2795 ) ) ( not ( = ?auto_2793 ?auto_2795 ) ) ( not ( = ?auto_2794 ?auto_2795 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2792 ?auto_2795 )
      ( MAKE-3PILE ?auto_2792 ?auto_2793 ?auto_2794 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2796 - BLOCK
      ?auto_2797 - BLOCK
      ?auto_2798 - BLOCK
    )
    :vars
    (
      ?auto_2799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2796 ?auto_2797 ) ) ( not ( = ?auto_2796 ?auto_2798 ) ) ( not ( = ?auto_2797 ?auto_2798 ) ) ( ON-TABLE ?auto_2798 ) ( ON ?auto_2796 ?auto_2799 ) ( CLEAR ?auto_2796 ) ( not ( = ?auto_2796 ?auto_2799 ) ) ( not ( = ?auto_2797 ?auto_2799 ) ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( HOLDING ?auto_2797 ) ( CLEAR ?auto_2798 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2798 ?auto_2797 )
      ( MAKE-3PILE ?auto_2796 ?auto_2797 ?auto_2798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2800 - BLOCK
      ?auto_2801 - BLOCK
      ?auto_2802 - BLOCK
    )
    :vars
    (
      ?auto_2803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2800 ?auto_2801 ) ) ( not ( = ?auto_2800 ?auto_2802 ) ) ( not ( = ?auto_2801 ?auto_2802 ) ) ( ON-TABLE ?auto_2802 ) ( ON ?auto_2800 ?auto_2803 ) ( not ( = ?auto_2800 ?auto_2803 ) ) ( not ( = ?auto_2801 ?auto_2803 ) ) ( not ( = ?auto_2802 ?auto_2803 ) ) ( CLEAR ?auto_2802 ) ( ON ?auto_2801 ?auto_2800 ) ( CLEAR ?auto_2801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2803 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2803 ?auto_2800 )
      ( MAKE-3PILE ?auto_2800 ?auto_2801 ?auto_2802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2804 - BLOCK
      ?auto_2805 - BLOCK
      ?auto_2806 - BLOCK
    )
    :vars
    (
      ?auto_2807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2804 ?auto_2805 ) ) ( not ( = ?auto_2804 ?auto_2806 ) ) ( not ( = ?auto_2805 ?auto_2806 ) ) ( ON ?auto_2804 ?auto_2807 ) ( not ( = ?auto_2804 ?auto_2807 ) ) ( not ( = ?auto_2805 ?auto_2807 ) ) ( not ( = ?auto_2806 ?auto_2807 ) ) ( ON ?auto_2805 ?auto_2804 ) ( CLEAR ?auto_2805 ) ( ON-TABLE ?auto_2807 ) ( HOLDING ?auto_2806 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2806 )
      ( MAKE-3PILE ?auto_2804 ?auto_2805 ?auto_2806 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2808 - BLOCK
      ?auto_2809 - BLOCK
      ?auto_2810 - BLOCK
    )
    :vars
    (
      ?auto_2811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2808 ?auto_2809 ) ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( not ( = ?auto_2809 ?auto_2810 ) ) ( ON ?auto_2808 ?auto_2811 ) ( not ( = ?auto_2808 ?auto_2811 ) ) ( not ( = ?auto_2809 ?auto_2811 ) ) ( not ( = ?auto_2810 ?auto_2811 ) ) ( ON ?auto_2809 ?auto_2808 ) ( ON-TABLE ?auto_2811 ) ( ON ?auto_2810 ?auto_2809 ) ( CLEAR ?auto_2810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2811 ?auto_2808 ?auto_2809 )
      ( MAKE-3PILE ?auto_2808 ?auto_2809 ?auto_2810 ) )
  )

)

