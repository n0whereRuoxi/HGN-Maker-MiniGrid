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
      ?auto_2623 - BLOCK
      ?auto_2624 - BLOCK
      ?auto_2625 - BLOCK
    )
    :vars
    (
      ?auto_2626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2626 ?auto_2625 ) ( CLEAR ?auto_2626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2623 ) ( ON ?auto_2624 ?auto_2623 ) ( ON ?auto_2625 ?auto_2624 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( not ( = ?auto_2623 ?auto_2625 ) ) ( not ( = ?auto_2623 ?auto_2626 ) ) ( not ( = ?auto_2624 ?auto_2625 ) ) ( not ( = ?auto_2624 ?auto_2626 ) ) ( not ( = ?auto_2625 ?auto_2626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2626 ?auto_2625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2628 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2628 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2628 ) )
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
    ( and ( ON ?auto_2629 ?auto_2630 ) ( CLEAR ?auto_2629 ) ( HAND-EMPTY ) ( not ( = ?auto_2629 ?auto_2630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2629 ?auto_2630 )
      ( MAKE-1PILE ?auto_2629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2633 - BLOCK
      ?auto_2634 - BLOCK
    )
    :vars
    (
      ?auto_2635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2635 ?auto_2634 ) ( CLEAR ?auto_2635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2633 ) ( ON ?auto_2634 ?auto_2633 ) ( not ( = ?auto_2633 ?auto_2634 ) ) ( not ( = ?auto_2633 ?auto_2635 ) ) ( not ( = ?auto_2634 ?auto_2635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2635 ?auto_2634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2636 - BLOCK
      ?auto_2637 - BLOCK
    )
    :vars
    (
      ?auto_2638 - BLOCK
      ?auto_2639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2638 ?auto_2637 ) ( CLEAR ?auto_2638 ) ( ON-TABLE ?auto_2636 ) ( ON ?auto_2637 ?auto_2636 ) ( not ( = ?auto_2636 ?auto_2637 ) ) ( not ( = ?auto_2636 ?auto_2638 ) ) ( not ( = ?auto_2637 ?auto_2638 ) ) ( HOLDING ?auto_2639 ) ( not ( = ?auto_2636 ?auto_2639 ) ) ( not ( = ?auto_2637 ?auto_2639 ) ) ( not ( = ?auto_2638 ?auto_2639 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2639 )
      ( MAKE-2PILE ?auto_2636 ?auto_2637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2640 - BLOCK
      ?auto_2641 - BLOCK
    )
    :vars
    (
      ?auto_2642 - BLOCK
      ?auto_2643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2642 ?auto_2641 ) ( ON-TABLE ?auto_2640 ) ( ON ?auto_2641 ?auto_2640 ) ( not ( = ?auto_2640 ?auto_2641 ) ) ( not ( = ?auto_2640 ?auto_2642 ) ) ( not ( = ?auto_2641 ?auto_2642 ) ) ( not ( = ?auto_2640 ?auto_2643 ) ) ( not ( = ?auto_2641 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( ON ?auto_2643 ?auto_2642 ) ( CLEAR ?auto_2643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2640 ?auto_2641 ?auto_2642 )
      ( MAKE-2PILE ?auto_2640 ?auto_2641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2646 - BLOCK
      ?auto_2647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2647 ) ( CLEAR ?auto_2646 ) ( ON-TABLE ?auto_2646 ) ( not ( = ?auto_2646 ?auto_2647 ) ) )
    :subtasks
    ( ( !STACK ?auto_2647 ?auto_2646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2648 - BLOCK
      ?auto_2649 - BLOCK
    )
    :vars
    (
      ?auto_2650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2648 ) ( ON-TABLE ?auto_2648 ) ( not ( = ?auto_2648 ?auto_2649 ) ) ( ON ?auto_2649 ?auto_2650 ) ( CLEAR ?auto_2649 ) ( HAND-EMPTY ) ( not ( = ?auto_2648 ?auto_2650 ) ) ( not ( = ?auto_2649 ?auto_2650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2649 ?auto_2650 )
      ( MAKE-2PILE ?auto_2648 ?auto_2649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2651 - BLOCK
      ?auto_2652 - BLOCK
    )
    :vars
    (
      ?auto_2653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2651 ?auto_2652 ) ) ( ON ?auto_2652 ?auto_2653 ) ( CLEAR ?auto_2652 ) ( not ( = ?auto_2651 ?auto_2653 ) ) ( not ( = ?auto_2652 ?auto_2653 ) ) ( HOLDING ?auto_2651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2651 )
      ( MAKE-2PILE ?auto_2651 ?auto_2652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2654 - BLOCK
      ?auto_2655 - BLOCK
    )
    :vars
    (
      ?auto_2656 - BLOCK
      ?auto_2657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2654 ?auto_2655 ) ) ( ON ?auto_2655 ?auto_2656 ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( not ( = ?auto_2655 ?auto_2656 ) ) ( ON ?auto_2654 ?auto_2655 ) ( CLEAR ?auto_2654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2657 ) ( ON ?auto_2656 ?auto_2657 ) ( not ( = ?auto_2657 ?auto_2656 ) ) ( not ( = ?auto_2657 ?auto_2655 ) ) ( not ( = ?auto_2657 ?auto_2654 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2657 ?auto_2656 ?auto_2655 )
      ( MAKE-2PILE ?auto_2654 ?auto_2655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2659 - BLOCK
    )
    :vars
    (
      ?auto_2660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2660 ?auto_2659 ) ( CLEAR ?auto_2660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2659 ) ( not ( = ?auto_2659 ?auto_2660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2660 ?auto_2659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2661 - BLOCK
    )
    :vars
    (
      ?auto_2662 - BLOCK
      ?auto_2663 - BLOCK
      ?auto_2664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2662 ?auto_2661 ) ( CLEAR ?auto_2662 ) ( ON-TABLE ?auto_2661 ) ( not ( = ?auto_2661 ?auto_2662 ) ) ( HOLDING ?auto_2663 ) ( CLEAR ?auto_2664 ) ( not ( = ?auto_2661 ?auto_2663 ) ) ( not ( = ?auto_2661 ?auto_2664 ) ) ( not ( = ?auto_2662 ?auto_2663 ) ) ( not ( = ?auto_2662 ?auto_2664 ) ) ( not ( = ?auto_2663 ?auto_2664 ) ) )
    :subtasks
    ( ( !STACK ?auto_2663 ?auto_2664 )
      ( MAKE-1PILE ?auto_2661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2665 - BLOCK
    )
    :vars
    (
      ?auto_2667 - BLOCK
      ?auto_2668 - BLOCK
      ?auto_2666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2667 ?auto_2665 ) ( ON-TABLE ?auto_2665 ) ( not ( = ?auto_2665 ?auto_2667 ) ) ( CLEAR ?auto_2668 ) ( not ( = ?auto_2665 ?auto_2666 ) ) ( not ( = ?auto_2665 ?auto_2668 ) ) ( not ( = ?auto_2667 ?auto_2666 ) ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( not ( = ?auto_2666 ?auto_2668 ) ) ( ON ?auto_2666 ?auto_2667 ) ( CLEAR ?auto_2666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2665 ?auto_2667 )
      ( MAKE-1PILE ?auto_2665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2669 - BLOCK
    )
    :vars
    (
      ?auto_2672 - BLOCK
      ?auto_2671 - BLOCK
      ?auto_2670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2672 ?auto_2669 ) ( ON-TABLE ?auto_2669 ) ( not ( = ?auto_2669 ?auto_2672 ) ) ( not ( = ?auto_2669 ?auto_2671 ) ) ( not ( = ?auto_2669 ?auto_2670 ) ) ( not ( = ?auto_2672 ?auto_2671 ) ) ( not ( = ?auto_2672 ?auto_2670 ) ) ( not ( = ?auto_2671 ?auto_2670 ) ) ( ON ?auto_2671 ?auto_2672 ) ( CLEAR ?auto_2671 ) ( HOLDING ?auto_2670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2670 )
      ( MAKE-1PILE ?auto_2669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2673 - BLOCK
    )
    :vars
    (
      ?auto_2675 - BLOCK
      ?auto_2676 - BLOCK
      ?auto_2674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2675 ?auto_2673 ) ( ON-TABLE ?auto_2673 ) ( not ( = ?auto_2673 ?auto_2675 ) ) ( not ( = ?auto_2673 ?auto_2676 ) ) ( not ( = ?auto_2673 ?auto_2674 ) ) ( not ( = ?auto_2675 ?auto_2676 ) ) ( not ( = ?auto_2675 ?auto_2674 ) ) ( not ( = ?auto_2676 ?auto_2674 ) ) ( ON ?auto_2676 ?auto_2675 ) ( ON ?auto_2674 ?auto_2676 ) ( CLEAR ?auto_2674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2673 ?auto_2675 ?auto_2676 )
      ( MAKE-1PILE ?auto_2673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2680 - BLOCK
      ?auto_2681 - BLOCK
      ?auto_2682 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2682 ) ( CLEAR ?auto_2681 ) ( ON-TABLE ?auto_2680 ) ( ON ?auto_2681 ?auto_2680 ) ( not ( = ?auto_2680 ?auto_2681 ) ) ( not ( = ?auto_2680 ?auto_2682 ) ) ( not ( = ?auto_2681 ?auto_2682 ) ) )
    :subtasks
    ( ( !STACK ?auto_2682 ?auto_2681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2683 - BLOCK
      ?auto_2684 - BLOCK
      ?auto_2685 - BLOCK
    )
    :vars
    (
      ?auto_2686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2684 ) ( ON-TABLE ?auto_2683 ) ( ON ?auto_2684 ?auto_2683 ) ( not ( = ?auto_2683 ?auto_2684 ) ) ( not ( = ?auto_2683 ?auto_2685 ) ) ( not ( = ?auto_2684 ?auto_2685 ) ) ( ON ?auto_2685 ?auto_2686 ) ( CLEAR ?auto_2685 ) ( HAND-EMPTY ) ( not ( = ?auto_2683 ?auto_2686 ) ) ( not ( = ?auto_2684 ?auto_2686 ) ) ( not ( = ?auto_2685 ?auto_2686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2685 ?auto_2686 )
      ( MAKE-3PILE ?auto_2683 ?auto_2684 ?auto_2685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2687 - BLOCK
      ?auto_2688 - BLOCK
      ?auto_2689 - BLOCK
    )
    :vars
    (
      ?auto_2690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2687 ) ( not ( = ?auto_2687 ?auto_2688 ) ) ( not ( = ?auto_2687 ?auto_2689 ) ) ( not ( = ?auto_2688 ?auto_2689 ) ) ( ON ?auto_2689 ?auto_2690 ) ( CLEAR ?auto_2689 ) ( not ( = ?auto_2687 ?auto_2690 ) ) ( not ( = ?auto_2688 ?auto_2690 ) ) ( not ( = ?auto_2689 ?auto_2690 ) ) ( HOLDING ?auto_2688 ) ( CLEAR ?auto_2687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2687 ?auto_2688 )
      ( MAKE-3PILE ?auto_2687 ?auto_2688 ?auto_2689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2691 - BLOCK
      ?auto_2692 - BLOCK
      ?auto_2693 - BLOCK
    )
    :vars
    (
      ?auto_2694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2691 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2691 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( ON ?auto_2693 ?auto_2694 ) ( not ( = ?auto_2691 ?auto_2694 ) ) ( not ( = ?auto_2692 ?auto_2694 ) ) ( not ( = ?auto_2693 ?auto_2694 ) ) ( CLEAR ?auto_2691 ) ( ON ?auto_2692 ?auto_2693 ) ( CLEAR ?auto_2692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2694 ?auto_2693 )
      ( MAKE-3PILE ?auto_2691 ?auto_2692 ?auto_2693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2695 - BLOCK
      ?auto_2696 - BLOCK
      ?auto_2697 - BLOCK
    )
    :vars
    (
      ?auto_2698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2695 ?auto_2696 ) ) ( not ( = ?auto_2695 ?auto_2697 ) ) ( not ( = ?auto_2696 ?auto_2697 ) ) ( ON ?auto_2697 ?auto_2698 ) ( not ( = ?auto_2695 ?auto_2698 ) ) ( not ( = ?auto_2696 ?auto_2698 ) ) ( not ( = ?auto_2697 ?auto_2698 ) ) ( ON ?auto_2696 ?auto_2697 ) ( CLEAR ?auto_2696 ) ( ON-TABLE ?auto_2698 ) ( HOLDING ?auto_2695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2695 )
      ( MAKE-3PILE ?auto_2695 ?auto_2696 ?auto_2697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2699 - BLOCK
      ?auto_2700 - BLOCK
      ?auto_2701 - BLOCK
    )
    :vars
    (
      ?auto_2702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2699 ?auto_2700 ) ) ( not ( = ?auto_2699 ?auto_2701 ) ) ( not ( = ?auto_2700 ?auto_2701 ) ) ( ON ?auto_2701 ?auto_2702 ) ( not ( = ?auto_2699 ?auto_2702 ) ) ( not ( = ?auto_2700 ?auto_2702 ) ) ( not ( = ?auto_2701 ?auto_2702 ) ) ( ON ?auto_2700 ?auto_2701 ) ( ON-TABLE ?auto_2702 ) ( ON ?auto_2699 ?auto_2700 ) ( CLEAR ?auto_2699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2702 ?auto_2701 ?auto_2700 )
      ( MAKE-3PILE ?auto_2699 ?auto_2700 ?auto_2701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2705 - BLOCK
      ?auto_2706 - BLOCK
    )
    :vars
    (
      ?auto_2707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2707 ?auto_2706 ) ( CLEAR ?auto_2707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2705 ) ( ON ?auto_2706 ?auto_2705 ) ( not ( = ?auto_2705 ?auto_2706 ) ) ( not ( = ?auto_2705 ?auto_2707 ) ) ( not ( = ?auto_2706 ?auto_2707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2707 ?auto_2706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2715 - BLOCK
      ?auto_2716 - BLOCK
    )
    :vars
    (
      ?auto_2717 - BLOCK
      ?auto_2718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2715 ) ( not ( = ?auto_2715 ?auto_2716 ) ) ( not ( = ?auto_2715 ?auto_2717 ) ) ( not ( = ?auto_2716 ?auto_2717 ) ) ( ON ?auto_2717 ?auto_2718 ) ( CLEAR ?auto_2717 ) ( not ( = ?auto_2715 ?auto_2718 ) ) ( not ( = ?auto_2716 ?auto_2718 ) ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( HOLDING ?auto_2716 ) ( CLEAR ?auto_2715 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2715 ?auto_2716 ?auto_2717 )
      ( MAKE-2PILE ?auto_2715 ?auto_2716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2719 - BLOCK
      ?auto_2720 - BLOCK
    )
    :vars
    (
      ?auto_2721 - BLOCK
      ?auto_2722 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2719 ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( not ( = ?auto_2719 ?auto_2721 ) ) ( not ( = ?auto_2720 ?auto_2721 ) ) ( ON ?auto_2721 ?auto_2722 ) ( not ( = ?auto_2719 ?auto_2722 ) ) ( not ( = ?auto_2720 ?auto_2722 ) ) ( not ( = ?auto_2721 ?auto_2722 ) ) ( CLEAR ?auto_2719 ) ( ON ?auto_2720 ?auto_2721 ) ( CLEAR ?auto_2720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2722 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2722 ?auto_2721 )
      ( MAKE-2PILE ?auto_2719 ?auto_2720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2723 - BLOCK
      ?auto_2724 - BLOCK
    )
    :vars
    (
      ?auto_2725 - BLOCK
      ?auto_2726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2723 ?auto_2724 ) ) ( not ( = ?auto_2723 ?auto_2725 ) ) ( not ( = ?auto_2724 ?auto_2725 ) ) ( ON ?auto_2725 ?auto_2726 ) ( not ( = ?auto_2723 ?auto_2726 ) ) ( not ( = ?auto_2724 ?auto_2726 ) ) ( not ( = ?auto_2725 ?auto_2726 ) ) ( ON ?auto_2724 ?auto_2725 ) ( CLEAR ?auto_2724 ) ( ON-TABLE ?auto_2726 ) ( HOLDING ?auto_2723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2723 )
      ( MAKE-2PILE ?auto_2723 ?auto_2724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2727 - BLOCK
      ?auto_2728 - BLOCK
    )
    :vars
    (
      ?auto_2729 - BLOCK
      ?auto_2730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2727 ?auto_2728 ) ) ( not ( = ?auto_2727 ?auto_2729 ) ) ( not ( = ?auto_2728 ?auto_2729 ) ) ( ON ?auto_2729 ?auto_2730 ) ( not ( = ?auto_2727 ?auto_2730 ) ) ( not ( = ?auto_2728 ?auto_2730 ) ) ( not ( = ?auto_2729 ?auto_2730 ) ) ( ON ?auto_2728 ?auto_2729 ) ( ON-TABLE ?auto_2730 ) ( ON ?auto_2727 ?auto_2728 ) ( CLEAR ?auto_2727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2730 ?auto_2729 ?auto_2728 )
      ( MAKE-2PILE ?auto_2727 ?auto_2728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2732 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2733 - BLOCK
    )
    :vars
    (
      ?auto_2734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2733 ?auto_2734 ) ( CLEAR ?auto_2733 ) ( HAND-EMPTY ) ( not ( = ?auto_2733 ?auto_2734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2733 ?auto_2734 )
      ( MAKE-1PILE ?auto_2733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2735 - BLOCK
    )
    :vars
    (
      ?auto_2736 - BLOCK
      ?auto_2737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2735 ?auto_2736 ) ) ( HOLDING ?auto_2735 ) ( CLEAR ?auto_2736 ) ( ON-TABLE ?auto_2737 ) ( ON ?auto_2736 ?auto_2737 ) ( not ( = ?auto_2737 ?auto_2736 ) ) ( not ( = ?auto_2737 ?auto_2735 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2737 ?auto_2736 ?auto_2735 )
      ( MAKE-1PILE ?auto_2735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2738 - BLOCK
    )
    :vars
    (
      ?auto_2739 - BLOCK
      ?auto_2740 - BLOCK
      ?auto_2741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2738 ?auto_2739 ) ) ( CLEAR ?auto_2739 ) ( ON-TABLE ?auto_2740 ) ( ON ?auto_2739 ?auto_2740 ) ( not ( = ?auto_2740 ?auto_2739 ) ) ( not ( = ?auto_2740 ?auto_2738 ) ) ( ON ?auto_2738 ?auto_2741 ) ( CLEAR ?auto_2738 ) ( HAND-EMPTY ) ( not ( = ?auto_2738 ?auto_2741 ) ) ( not ( = ?auto_2739 ?auto_2741 ) ) ( not ( = ?auto_2740 ?auto_2741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2738 ?auto_2741 )
      ( MAKE-1PILE ?auto_2738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2742 - BLOCK
    )
    :vars
    (
      ?auto_2744 - BLOCK
      ?auto_2745 - BLOCK
      ?auto_2743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2742 ?auto_2744 ) ) ( ON-TABLE ?auto_2745 ) ( not ( = ?auto_2745 ?auto_2744 ) ) ( not ( = ?auto_2745 ?auto_2742 ) ) ( ON ?auto_2742 ?auto_2743 ) ( CLEAR ?auto_2742 ) ( not ( = ?auto_2742 ?auto_2743 ) ) ( not ( = ?auto_2744 ?auto_2743 ) ) ( not ( = ?auto_2745 ?auto_2743 ) ) ( HOLDING ?auto_2744 ) ( CLEAR ?auto_2745 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2745 ?auto_2744 )
      ( MAKE-1PILE ?auto_2742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2746 - BLOCK
    )
    :vars
    (
      ?auto_2748 - BLOCK
      ?auto_2749 - BLOCK
      ?auto_2747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2746 ?auto_2748 ) ) ( ON-TABLE ?auto_2749 ) ( not ( = ?auto_2749 ?auto_2748 ) ) ( not ( = ?auto_2749 ?auto_2746 ) ) ( ON ?auto_2746 ?auto_2747 ) ( not ( = ?auto_2746 ?auto_2747 ) ) ( not ( = ?auto_2748 ?auto_2747 ) ) ( not ( = ?auto_2749 ?auto_2747 ) ) ( CLEAR ?auto_2749 ) ( ON ?auto_2748 ?auto_2746 ) ( CLEAR ?auto_2748 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2747 ?auto_2746 )
      ( MAKE-1PILE ?auto_2746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2750 - BLOCK
    )
    :vars
    (
      ?auto_2753 - BLOCK
      ?auto_2752 - BLOCK
      ?auto_2751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2750 ?auto_2753 ) ) ( not ( = ?auto_2752 ?auto_2753 ) ) ( not ( = ?auto_2752 ?auto_2750 ) ) ( ON ?auto_2750 ?auto_2751 ) ( not ( = ?auto_2750 ?auto_2751 ) ) ( not ( = ?auto_2753 ?auto_2751 ) ) ( not ( = ?auto_2752 ?auto_2751 ) ) ( ON ?auto_2753 ?auto_2750 ) ( CLEAR ?auto_2753 ) ( ON-TABLE ?auto_2751 ) ( HOLDING ?auto_2752 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2752 )
      ( MAKE-1PILE ?auto_2750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2754 - BLOCK
    )
    :vars
    (
      ?auto_2756 - BLOCK
      ?auto_2757 - BLOCK
      ?auto_2755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2754 ?auto_2756 ) ) ( not ( = ?auto_2757 ?auto_2756 ) ) ( not ( = ?auto_2757 ?auto_2754 ) ) ( ON ?auto_2754 ?auto_2755 ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( not ( = ?auto_2756 ?auto_2755 ) ) ( not ( = ?auto_2757 ?auto_2755 ) ) ( ON ?auto_2756 ?auto_2754 ) ( ON-TABLE ?auto_2755 ) ( ON ?auto_2757 ?auto_2756 ) ( CLEAR ?auto_2757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2755 ?auto_2754 ?auto_2756 )
      ( MAKE-1PILE ?auto_2754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2759 - BLOCK
    )
    :vars
    (
      ?auto_2760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2760 ?auto_2759 ) ( CLEAR ?auto_2760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2759 ) ( not ( = ?auto_2759 ?auto_2760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2760 ?auto_2759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2761 - BLOCK
    )
    :vars
    (
      ?auto_2762 - BLOCK
      ?auto_2763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2762 ?auto_2761 ) ( CLEAR ?auto_2762 ) ( ON-TABLE ?auto_2761 ) ( not ( = ?auto_2761 ?auto_2762 ) ) ( HOLDING ?auto_2763 ) ( not ( = ?auto_2761 ?auto_2763 ) ) ( not ( = ?auto_2762 ?auto_2763 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2763 )
      ( MAKE-1PILE ?auto_2761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2764 - BLOCK
    )
    :vars
    (
      ?auto_2766 - BLOCK
      ?auto_2765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2766 ?auto_2764 ) ( ON-TABLE ?auto_2764 ) ( not ( = ?auto_2764 ?auto_2766 ) ) ( not ( = ?auto_2764 ?auto_2765 ) ) ( not ( = ?auto_2766 ?auto_2765 ) ) ( ON ?auto_2765 ?auto_2766 ) ( CLEAR ?auto_2765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2764 ?auto_2766 )
      ( MAKE-1PILE ?auto_2764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2767 - BLOCK
    )
    :vars
    (
      ?auto_2768 - BLOCK
      ?auto_2769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2768 ?auto_2767 ) ( ON-TABLE ?auto_2767 ) ( not ( = ?auto_2767 ?auto_2768 ) ) ( not ( = ?auto_2767 ?auto_2769 ) ) ( not ( = ?auto_2768 ?auto_2769 ) ) ( HOLDING ?auto_2769 ) ( CLEAR ?auto_2768 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2767 ?auto_2768 ?auto_2769 )
      ( MAKE-1PILE ?auto_2767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2770 - BLOCK
    )
    :vars
    (
      ?auto_2772 - BLOCK
      ?auto_2771 - BLOCK
      ?auto_2773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2772 ?auto_2770 ) ( ON-TABLE ?auto_2770 ) ( not ( = ?auto_2770 ?auto_2772 ) ) ( not ( = ?auto_2770 ?auto_2771 ) ) ( not ( = ?auto_2772 ?auto_2771 ) ) ( CLEAR ?auto_2772 ) ( ON ?auto_2771 ?auto_2773 ) ( CLEAR ?auto_2771 ) ( HAND-EMPTY ) ( not ( = ?auto_2770 ?auto_2773 ) ) ( not ( = ?auto_2772 ?auto_2773 ) ) ( not ( = ?auto_2771 ?auto_2773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2771 ?auto_2773 )
      ( MAKE-1PILE ?auto_2770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2782 - BLOCK
    )
    :vars
    (
      ?auto_2784 - BLOCK
      ?auto_2785 - BLOCK
      ?auto_2783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2782 ?auto_2784 ) ) ( not ( = ?auto_2782 ?auto_2785 ) ) ( not ( = ?auto_2784 ?auto_2785 ) ) ( ON ?auto_2785 ?auto_2783 ) ( not ( = ?auto_2782 ?auto_2783 ) ) ( not ( = ?auto_2784 ?auto_2783 ) ) ( not ( = ?auto_2785 ?auto_2783 ) ) ( ON ?auto_2784 ?auto_2785 ) ( CLEAR ?auto_2784 ) ( HOLDING ?auto_2782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2782 ?auto_2784 )
      ( MAKE-1PILE ?auto_2782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2786 - BLOCK
    )
    :vars
    (
      ?auto_2789 - BLOCK
      ?auto_2787 - BLOCK
      ?auto_2788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2786 ?auto_2789 ) ) ( not ( = ?auto_2786 ?auto_2787 ) ) ( not ( = ?auto_2789 ?auto_2787 ) ) ( ON ?auto_2787 ?auto_2788 ) ( not ( = ?auto_2786 ?auto_2788 ) ) ( not ( = ?auto_2789 ?auto_2788 ) ) ( not ( = ?auto_2787 ?auto_2788 ) ) ( ON ?auto_2789 ?auto_2787 ) ( ON ?auto_2786 ?auto_2789 ) ( CLEAR ?auto_2786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2788 ?auto_2787 ?auto_2789 )
      ( MAKE-1PILE ?auto_2786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2792 - BLOCK
      ?auto_2793 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2793 ) ( CLEAR ?auto_2792 ) ( ON-TABLE ?auto_2792 ) ( not ( = ?auto_2792 ?auto_2793 ) ) )
    :subtasks
    ( ( !STACK ?auto_2793 ?auto_2792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2794 - BLOCK
      ?auto_2795 - BLOCK
    )
    :vars
    (
      ?auto_2796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2794 ) ( ON-TABLE ?auto_2794 ) ( not ( = ?auto_2794 ?auto_2795 ) ) ( ON ?auto_2795 ?auto_2796 ) ( CLEAR ?auto_2795 ) ( HAND-EMPTY ) ( not ( = ?auto_2794 ?auto_2796 ) ) ( not ( = ?auto_2795 ?auto_2796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2795 ?auto_2796 )
      ( MAKE-2PILE ?auto_2794 ?auto_2795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2797 - BLOCK
      ?auto_2798 - BLOCK
    )
    :vars
    (
      ?auto_2799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2797 ?auto_2798 ) ) ( ON ?auto_2798 ?auto_2799 ) ( CLEAR ?auto_2798 ) ( not ( = ?auto_2797 ?auto_2799 ) ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( HOLDING ?auto_2797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2797 )
      ( MAKE-2PILE ?auto_2797 ?auto_2798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2800 - BLOCK
      ?auto_2801 - BLOCK
    )
    :vars
    (
      ?auto_2802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2800 ?auto_2801 ) ) ( ON ?auto_2801 ?auto_2802 ) ( not ( = ?auto_2800 ?auto_2802 ) ) ( not ( = ?auto_2801 ?auto_2802 ) ) ( ON ?auto_2800 ?auto_2801 ) ( CLEAR ?auto_2800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2802 ?auto_2801 )
      ( MAKE-2PILE ?auto_2800 ?auto_2801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2803 - BLOCK
      ?auto_2804 - BLOCK
    )
    :vars
    (
      ?auto_2805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2803 ?auto_2804 ) ) ( ON ?auto_2804 ?auto_2805 ) ( not ( = ?auto_2803 ?auto_2805 ) ) ( not ( = ?auto_2804 ?auto_2805 ) ) ( ON-TABLE ?auto_2805 ) ( HOLDING ?auto_2803 ) ( CLEAR ?auto_2804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2805 ?auto_2804 ?auto_2803 )
      ( MAKE-2PILE ?auto_2803 ?auto_2804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2806 - BLOCK
      ?auto_2807 - BLOCK
    )
    :vars
    (
      ?auto_2808 - BLOCK
      ?auto_2809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2806 ?auto_2807 ) ) ( ON ?auto_2807 ?auto_2808 ) ( not ( = ?auto_2806 ?auto_2808 ) ) ( not ( = ?auto_2807 ?auto_2808 ) ) ( ON-TABLE ?auto_2808 ) ( CLEAR ?auto_2807 ) ( ON ?auto_2806 ?auto_2809 ) ( CLEAR ?auto_2806 ) ( HAND-EMPTY ) ( not ( = ?auto_2806 ?auto_2809 ) ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( not ( = ?auto_2808 ?auto_2809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2806 ?auto_2809 )
      ( MAKE-2PILE ?auto_2806 ?auto_2807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2810 - BLOCK
      ?auto_2811 - BLOCK
    )
    :vars
    (
      ?auto_2813 - BLOCK
      ?auto_2812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2810 ?auto_2811 ) ) ( not ( = ?auto_2810 ?auto_2813 ) ) ( not ( = ?auto_2811 ?auto_2813 ) ) ( ON-TABLE ?auto_2813 ) ( ON ?auto_2810 ?auto_2812 ) ( CLEAR ?auto_2810 ) ( not ( = ?auto_2810 ?auto_2812 ) ) ( not ( = ?auto_2811 ?auto_2812 ) ) ( not ( = ?auto_2813 ?auto_2812 ) ) ( HOLDING ?auto_2811 ) ( CLEAR ?auto_2813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2813 ?auto_2811 )
      ( MAKE-2PILE ?auto_2810 ?auto_2811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2814 - BLOCK
      ?auto_2815 - BLOCK
    )
    :vars
    (
      ?auto_2816 - BLOCK
      ?auto_2817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2814 ?auto_2815 ) ) ( not ( = ?auto_2814 ?auto_2816 ) ) ( not ( = ?auto_2815 ?auto_2816 ) ) ( ON-TABLE ?auto_2816 ) ( ON ?auto_2814 ?auto_2817 ) ( not ( = ?auto_2814 ?auto_2817 ) ) ( not ( = ?auto_2815 ?auto_2817 ) ) ( not ( = ?auto_2816 ?auto_2817 ) ) ( CLEAR ?auto_2816 ) ( ON ?auto_2815 ?auto_2814 ) ( CLEAR ?auto_2815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2817 ?auto_2814 )
      ( MAKE-2PILE ?auto_2814 ?auto_2815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2818 - BLOCK
      ?auto_2819 - BLOCK
    )
    :vars
    (
      ?auto_2821 - BLOCK
      ?auto_2820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2818 ?auto_2819 ) ) ( not ( = ?auto_2818 ?auto_2821 ) ) ( not ( = ?auto_2819 ?auto_2821 ) ) ( ON ?auto_2818 ?auto_2820 ) ( not ( = ?auto_2818 ?auto_2820 ) ) ( not ( = ?auto_2819 ?auto_2820 ) ) ( not ( = ?auto_2821 ?auto_2820 ) ) ( ON ?auto_2819 ?auto_2818 ) ( CLEAR ?auto_2819 ) ( ON-TABLE ?auto_2820 ) ( HOLDING ?auto_2821 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2821 )
      ( MAKE-2PILE ?auto_2818 ?auto_2819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2822 - BLOCK
      ?auto_2823 - BLOCK
    )
    :vars
    (
      ?auto_2824 - BLOCK
      ?auto_2825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2822 ?auto_2823 ) ) ( not ( = ?auto_2822 ?auto_2824 ) ) ( not ( = ?auto_2823 ?auto_2824 ) ) ( ON ?auto_2822 ?auto_2825 ) ( not ( = ?auto_2822 ?auto_2825 ) ) ( not ( = ?auto_2823 ?auto_2825 ) ) ( not ( = ?auto_2824 ?auto_2825 ) ) ( ON ?auto_2823 ?auto_2822 ) ( ON-TABLE ?auto_2825 ) ( ON ?auto_2824 ?auto_2823 ) ( CLEAR ?auto_2824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2825 ?auto_2822 ?auto_2823 )
      ( MAKE-2PILE ?auto_2822 ?auto_2823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2829 - BLOCK
      ?auto_2830 - BLOCK
      ?auto_2831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2831 ) ( CLEAR ?auto_2830 ) ( ON-TABLE ?auto_2829 ) ( ON ?auto_2830 ?auto_2829 ) ( not ( = ?auto_2829 ?auto_2830 ) ) ( not ( = ?auto_2829 ?auto_2831 ) ) ( not ( = ?auto_2830 ?auto_2831 ) ) )
    :subtasks
    ( ( !STACK ?auto_2831 ?auto_2830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2832 - BLOCK
      ?auto_2833 - BLOCK
      ?auto_2834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2833 ) ( ON-TABLE ?auto_2832 ) ( ON ?auto_2833 ?auto_2832 ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( not ( = ?auto_2832 ?auto_2834 ) ) ( not ( = ?auto_2833 ?auto_2834 ) ) ( ON-TABLE ?auto_2834 ) ( CLEAR ?auto_2834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2834 )
      ( MAKE-3PILE ?auto_2832 ?auto_2833 ?auto_2834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2835 - BLOCK
      ?auto_2836 - BLOCK
      ?auto_2837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2835 ) ( not ( = ?auto_2835 ?auto_2836 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2836 ?auto_2837 ) ) ( ON-TABLE ?auto_2837 ) ( CLEAR ?auto_2837 ) ( HOLDING ?auto_2836 ) ( CLEAR ?auto_2835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2835 ?auto_2836 )
      ( MAKE-3PILE ?auto_2835 ?auto_2836 ?auto_2837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2838 - BLOCK
      ?auto_2839 - BLOCK
      ?auto_2840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2838 ) ( not ( = ?auto_2838 ?auto_2839 ) ) ( not ( = ?auto_2838 ?auto_2840 ) ) ( not ( = ?auto_2839 ?auto_2840 ) ) ( ON-TABLE ?auto_2840 ) ( CLEAR ?auto_2838 ) ( ON ?auto_2839 ?auto_2840 ) ( CLEAR ?auto_2839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2840 )
      ( MAKE-3PILE ?auto_2838 ?auto_2839 ?auto_2840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2841 - BLOCK
      ?auto_2842 - BLOCK
      ?auto_2843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2841 ?auto_2842 ) ) ( not ( = ?auto_2841 ?auto_2843 ) ) ( not ( = ?auto_2842 ?auto_2843 ) ) ( ON-TABLE ?auto_2843 ) ( ON ?auto_2842 ?auto_2843 ) ( CLEAR ?auto_2842 ) ( HOLDING ?auto_2841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2841 )
      ( MAKE-3PILE ?auto_2841 ?auto_2842 ?auto_2843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2844 - BLOCK
      ?auto_2845 - BLOCK
      ?auto_2846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2844 ?auto_2845 ) ) ( not ( = ?auto_2844 ?auto_2846 ) ) ( not ( = ?auto_2845 ?auto_2846 ) ) ( ON-TABLE ?auto_2846 ) ( ON ?auto_2845 ?auto_2846 ) ( ON ?auto_2844 ?auto_2845 ) ( CLEAR ?auto_2844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2846 ?auto_2845 )
      ( MAKE-3PILE ?auto_2844 ?auto_2845 ?auto_2846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2847 - BLOCK
      ?auto_2848 - BLOCK
      ?auto_2849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2847 ?auto_2848 ) ) ( not ( = ?auto_2847 ?auto_2849 ) ) ( not ( = ?auto_2848 ?auto_2849 ) ) ( ON-TABLE ?auto_2849 ) ( ON ?auto_2848 ?auto_2849 ) ( HOLDING ?auto_2847 ) ( CLEAR ?auto_2848 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2849 ?auto_2848 ?auto_2847 )
      ( MAKE-3PILE ?auto_2847 ?auto_2848 ?auto_2849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2850 - BLOCK
      ?auto_2851 - BLOCK
      ?auto_2852 - BLOCK
    )
    :vars
    (
      ?auto_2853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2850 ?auto_2851 ) ) ( not ( = ?auto_2850 ?auto_2852 ) ) ( not ( = ?auto_2851 ?auto_2852 ) ) ( ON-TABLE ?auto_2852 ) ( ON ?auto_2851 ?auto_2852 ) ( CLEAR ?auto_2851 ) ( ON ?auto_2850 ?auto_2853 ) ( CLEAR ?auto_2850 ) ( HAND-EMPTY ) ( not ( = ?auto_2850 ?auto_2853 ) ) ( not ( = ?auto_2851 ?auto_2853 ) ) ( not ( = ?auto_2852 ?auto_2853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2850 ?auto_2853 )
      ( MAKE-3PILE ?auto_2850 ?auto_2851 ?auto_2852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2854 - BLOCK
      ?auto_2855 - BLOCK
      ?auto_2856 - BLOCK
    )
    :vars
    (
      ?auto_2857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2854 ?auto_2855 ) ) ( not ( = ?auto_2854 ?auto_2856 ) ) ( not ( = ?auto_2855 ?auto_2856 ) ) ( ON-TABLE ?auto_2856 ) ( ON ?auto_2854 ?auto_2857 ) ( CLEAR ?auto_2854 ) ( not ( = ?auto_2854 ?auto_2857 ) ) ( not ( = ?auto_2855 ?auto_2857 ) ) ( not ( = ?auto_2856 ?auto_2857 ) ) ( HOLDING ?auto_2855 ) ( CLEAR ?auto_2856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2856 ?auto_2855 )
      ( MAKE-3PILE ?auto_2854 ?auto_2855 ?auto_2856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2858 - BLOCK
      ?auto_2859 - BLOCK
      ?auto_2860 - BLOCK
    )
    :vars
    (
      ?auto_2861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2858 ?auto_2859 ) ) ( not ( = ?auto_2858 ?auto_2860 ) ) ( not ( = ?auto_2859 ?auto_2860 ) ) ( ON-TABLE ?auto_2860 ) ( ON ?auto_2858 ?auto_2861 ) ( not ( = ?auto_2858 ?auto_2861 ) ) ( not ( = ?auto_2859 ?auto_2861 ) ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( CLEAR ?auto_2860 ) ( ON ?auto_2859 ?auto_2858 ) ( CLEAR ?auto_2859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2861 ?auto_2858 )
      ( MAKE-3PILE ?auto_2858 ?auto_2859 ?auto_2860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2862 - BLOCK
      ?auto_2863 - BLOCK
      ?auto_2864 - BLOCK
    )
    :vars
    (
      ?auto_2865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2864 ) ) ( not ( = ?auto_2863 ?auto_2864 ) ) ( ON ?auto_2862 ?auto_2865 ) ( not ( = ?auto_2862 ?auto_2865 ) ) ( not ( = ?auto_2863 ?auto_2865 ) ) ( not ( = ?auto_2864 ?auto_2865 ) ) ( ON ?auto_2863 ?auto_2862 ) ( CLEAR ?auto_2863 ) ( ON-TABLE ?auto_2865 ) ( HOLDING ?auto_2864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2864 )
      ( MAKE-3PILE ?auto_2862 ?auto_2863 ?auto_2864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2866 - BLOCK
      ?auto_2867 - BLOCK
      ?auto_2868 - BLOCK
    )
    :vars
    (
      ?auto_2869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2866 ?auto_2867 ) ) ( not ( = ?auto_2866 ?auto_2868 ) ) ( not ( = ?auto_2867 ?auto_2868 ) ) ( ON ?auto_2866 ?auto_2869 ) ( not ( = ?auto_2866 ?auto_2869 ) ) ( not ( = ?auto_2867 ?auto_2869 ) ) ( not ( = ?auto_2868 ?auto_2869 ) ) ( ON ?auto_2867 ?auto_2866 ) ( ON-TABLE ?auto_2869 ) ( ON ?auto_2868 ?auto_2867 ) ( CLEAR ?auto_2868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2869 ?auto_2866 ?auto_2867 )
      ( MAKE-3PILE ?auto_2866 ?auto_2867 ?auto_2868 ) )
  )

)

