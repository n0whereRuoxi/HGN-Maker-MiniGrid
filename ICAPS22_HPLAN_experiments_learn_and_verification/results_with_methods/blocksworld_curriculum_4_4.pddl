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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2601 - BLOCK
    )
    :vars
    (
      ?auto_2602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2601 ?auto_2602 ) ( CLEAR ?auto_2601 ) ( HAND-EMPTY ) ( not ( = ?auto_2601 ?auto_2602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2601 ?auto_2602 )
      ( !PUTDOWN ?auto_2601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2604 - BLOCK
    )
    :vars
    (
      ?auto_2605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2604 ?auto_2605 ) ( CLEAR ?auto_2604 ) ( HAND-EMPTY ) ( not ( = ?auto_2604 ?auto_2605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2604 ?auto_2605 )
      ( !PUTDOWN ?auto_2604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2608 - BLOCK
      ?auto_2609 - BLOCK
    )
    :vars
    (
      ?auto_2610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2608 ) ( ON ?auto_2609 ?auto_2610 ) ( CLEAR ?auto_2609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2608 ) ( not ( = ?auto_2608 ?auto_2609 ) ) ( not ( = ?auto_2608 ?auto_2610 ) ) ( not ( = ?auto_2609 ?auto_2610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2609 ?auto_2610 )
      ( !STACK ?auto_2609 ?auto_2608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2613 - BLOCK
      ?auto_2614 - BLOCK
    )
    :vars
    (
      ?auto_2615 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2613 ) ( ON ?auto_2614 ?auto_2615 ) ( CLEAR ?auto_2614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2613 ) ( not ( = ?auto_2613 ?auto_2614 ) ) ( not ( = ?auto_2613 ?auto_2615 ) ) ( not ( = ?auto_2614 ?auto_2615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2614 ?auto_2615 )
      ( !STACK ?auto_2614 ?auto_2613 ) )
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
    ( and ( ON ?auto_2619 ?auto_2620 ) ( not ( = ?auto_2618 ?auto_2619 ) ) ( not ( = ?auto_2618 ?auto_2620 ) ) ( not ( = ?auto_2619 ?auto_2620 ) ) ( ON ?auto_2618 ?auto_2619 ) ( CLEAR ?auto_2618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2618 )
      ( MAKE-2PILE ?auto_2618 ?auto_2619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2623 - BLOCK
      ?auto_2624 - BLOCK
    )
    :vars
    (
      ?auto_2625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2624 ?auto_2625 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( not ( = ?auto_2623 ?auto_2625 ) ) ( not ( = ?auto_2624 ?auto_2625 ) ) ( ON ?auto_2623 ?auto_2624 ) ( CLEAR ?auto_2623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2623 )
      ( MAKE-2PILE ?auto_2623 ?auto_2624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2629 - BLOCK
      ?auto_2630 - BLOCK
      ?auto_2631 - BLOCK
    )
    :vars
    (
      ?auto_2632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2630 ) ( ON ?auto_2631 ?auto_2632 ) ( CLEAR ?auto_2631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2629 ) ( ON ?auto_2630 ?auto_2629 ) ( not ( = ?auto_2629 ?auto_2630 ) ) ( not ( = ?auto_2629 ?auto_2631 ) ) ( not ( = ?auto_2629 ?auto_2632 ) ) ( not ( = ?auto_2630 ?auto_2631 ) ) ( not ( = ?auto_2630 ?auto_2632 ) ) ( not ( = ?auto_2631 ?auto_2632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2631 ?auto_2632 )
      ( !STACK ?auto_2631 ?auto_2630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2636 - BLOCK
      ?auto_2637 - BLOCK
      ?auto_2638 - BLOCK
    )
    :vars
    (
      ?auto_2639 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2637 ) ( ON ?auto_2638 ?auto_2639 ) ( CLEAR ?auto_2638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2636 ) ( ON ?auto_2637 ?auto_2636 ) ( not ( = ?auto_2636 ?auto_2637 ) ) ( not ( = ?auto_2636 ?auto_2638 ) ) ( not ( = ?auto_2636 ?auto_2639 ) ) ( not ( = ?auto_2637 ?auto_2638 ) ) ( not ( = ?auto_2637 ?auto_2639 ) ) ( not ( = ?auto_2638 ?auto_2639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2638 ?auto_2639 )
      ( !STACK ?auto_2638 ?auto_2637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2643 - BLOCK
      ?auto_2644 - BLOCK
      ?auto_2645 - BLOCK
    )
    :vars
    (
      ?auto_2646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2645 ?auto_2646 ) ( ON-TABLE ?auto_2643 ) ( not ( = ?auto_2643 ?auto_2644 ) ) ( not ( = ?auto_2643 ?auto_2645 ) ) ( not ( = ?auto_2643 ?auto_2646 ) ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( not ( = ?auto_2644 ?auto_2646 ) ) ( not ( = ?auto_2645 ?auto_2646 ) ) ( CLEAR ?auto_2643 ) ( ON ?auto_2644 ?auto_2645 ) ( CLEAR ?auto_2644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2643 ?auto_2644 )
      ( MAKE-3PILE ?auto_2643 ?auto_2644 ?auto_2645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2650 - BLOCK
      ?auto_2651 - BLOCK
      ?auto_2652 - BLOCK
    )
    :vars
    (
      ?auto_2653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2652 ?auto_2653 ) ( ON-TABLE ?auto_2650 ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( not ( = ?auto_2650 ?auto_2652 ) ) ( not ( = ?auto_2650 ?auto_2653 ) ) ( not ( = ?auto_2651 ?auto_2652 ) ) ( not ( = ?auto_2651 ?auto_2653 ) ) ( not ( = ?auto_2652 ?auto_2653 ) ) ( CLEAR ?auto_2650 ) ( ON ?auto_2651 ?auto_2652 ) ( CLEAR ?auto_2651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2650 ?auto_2651 )
      ( MAKE-3PILE ?auto_2650 ?auto_2651 ?auto_2652 ) )
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
    ( and ( ON ?auto_2659 ?auto_2660 ) ( not ( = ?auto_2657 ?auto_2658 ) ) ( not ( = ?auto_2657 ?auto_2659 ) ) ( not ( = ?auto_2657 ?auto_2660 ) ) ( not ( = ?auto_2658 ?auto_2659 ) ) ( not ( = ?auto_2658 ?auto_2660 ) ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( ON ?auto_2658 ?auto_2659 ) ( ON ?auto_2657 ?auto_2658 ) ( CLEAR ?auto_2657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2657 )
      ( MAKE-3PILE ?auto_2657 ?auto_2658 ?auto_2659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2664 - BLOCK
      ?auto_2665 - BLOCK
      ?auto_2666 - BLOCK
    )
    :vars
    (
      ?auto_2667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2666 ?auto_2667 ) ( not ( = ?auto_2664 ?auto_2665 ) ) ( not ( = ?auto_2664 ?auto_2666 ) ) ( not ( = ?auto_2664 ?auto_2667 ) ) ( not ( = ?auto_2665 ?auto_2666 ) ) ( not ( = ?auto_2665 ?auto_2667 ) ) ( not ( = ?auto_2666 ?auto_2667 ) ) ( ON ?auto_2665 ?auto_2666 ) ( ON ?auto_2664 ?auto_2665 ) ( CLEAR ?auto_2664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2664 )
      ( MAKE-3PILE ?auto_2664 ?auto_2665 ?auto_2666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2672 - BLOCK
      ?auto_2673 - BLOCK
      ?auto_2674 - BLOCK
      ?auto_2675 - BLOCK
    )
    :vars
    (
      ?auto_2676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2674 ) ( ON ?auto_2675 ?auto_2676 ) ( CLEAR ?auto_2675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2672 ) ( ON ?auto_2673 ?auto_2672 ) ( ON ?auto_2674 ?auto_2673 ) ( not ( = ?auto_2672 ?auto_2673 ) ) ( not ( = ?auto_2672 ?auto_2674 ) ) ( not ( = ?auto_2672 ?auto_2675 ) ) ( not ( = ?auto_2672 ?auto_2676 ) ) ( not ( = ?auto_2673 ?auto_2674 ) ) ( not ( = ?auto_2673 ?auto_2675 ) ) ( not ( = ?auto_2673 ?auto_2676 ) ) ( not ( = ?auto_2674 ?auto_2675 ) ) ( not ( = ?auto_2674 ?auto_2676 ) ) ( not ( = ?auto_2675 ?auto_2676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2675 ?auto_2676 )
      ( !STACK ?auto_2675 ?auto_2674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2681 - BLOCK
      ?auto_2682 - BLOCK
      ?auto_2683 - BLOCK
      ?auto_2684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2683 ) ( ON-TABLE ?auto_2684 ) ( CLEAR ?auto_2684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2681 ) ( ON ?auto_2682 ?auto_2681 ) ( ON ?auto_2683 ?auto_2682 ) ( not ( = ?auto_2681 ?auto_2682 ) ) ( not ( = ?auto_2681 ?auto_2683 ) ) ( not ( = ?auto_2681 ?auto_2684 ) ) ( not ( = ?auto_2682 ?auto_2683 ) ) ( not ( = ?auto_2682 ?auto_2684 ) ) ( not ( = ?auto_2683 ?auto_2684 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_2684 )
      ( !STACK ?auto_2684 ?auto_2683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2689 - BLOCK
      ?auto_2690 - BLOCK
      ?auto_2691 - BLOCK
      ?auto_2692 - BLOCK
    )
    :vars
    (
      ?auto_2693 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2692 ?auto_2693 ) ( ON-TABLE ?auto_2689 ) ( ON ?auto_2690 ?auto_2689 ) ( not ( = ?auto_2689 ?auto_2690 ) ) ( not ( = ?auto_2689 ?auto_2691 ) ) ( not ( = ?auto_2689 ?auto_2692 ) ) ( not ( = ?auto_2689 ?auto_2693 ) ) ( not ( = ?auto_2690 ?auto_2691 ) ) ( not ( = ?auto_2690 ?auto_2692 ) ) ( not ( = ?auto_2690 ?auto_2693 ) ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2691 ?auto_2693 ) ) ( not ( = ?auto_2692 ?auto_2693 ) ) ( CLEAR ?auto_2690 ) ( ON ?auto_2691 ?auto_2692 ) ( CLEAR ?auto_2691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2689 ?auto_2690 ?auto_2691 )
      ( MAKE-4PILE ?auto_2689 ?auto_2690 ?auto_2691 ?auto_2692 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2698 - BLOCK
      ?auto_2699 - BLOCK
      ?auto_2700 - BLOCK
      ?auto_2701 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2701 ) ( ON-TABLE ?auto_2698 ) ( ON ?auto_2699 ?auto_2698 ) ( not ( = ?auto_2698 ?auto_2699 ) ) ( not ( = ?auto_2698 ?auto_2700 ) ) ( not ( = ?auto_2698 ?auto_2701 ) ) ( not ( = ?auto_2699 ?auto_2700 ) ) ( not ( = ?auto_2699 ?auto_2701 ) ) ( not ( = ?auto_2700 ?auto_2701 ) ) ( CLEAR ?auto_2699 ) ( ON ?auto_2700 ?auto_2701 ) ( CLEAR ?auto_2700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2698 ?auto_2699 ?auto_2700 )
      ( MAKE-4PILE ?auto_2698 ?auto_2699 ?auto_2700 ?auto_2701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2706 - BLOCK
      ?auto_2707 - BLOCK
      ?auto_2708 - BLOCK
      ?auto_2709 - BLOCK
    )
    :vars
    (
      ?auto_2710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2709 ?auto_2710 ) ( ON-TABLE ?auto_2706 ) ( not ( = ?auto_2706 ?auto_2707 ) ) ( not ( = ?auto_2706 ?auto_2708 ) ) ( not ( = ?auto_2706 ?auto_2709 ) ) ( not ( = ?auto_2706 ?auto_2710 ) ) ( not ( = ?auto_2707 ?auto_2708 ) ) ( not ( = ?auto_2707 ?auto_2709 ) ) ( not ( = ?auto_2707 ?auto_2710 ) ) ( not ( = ?auto_2708 ?auto_2709 ) ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( not ( = ?auto_2709 ?auto_2710 ) ) ( ON ?auto_2708 ?auto_2709 ) ( CLEAR ?auto_2706 ) ( ON ?auto_2707 ?auto_2708 ) ( CLEAR ?auto_2707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2706 ?auto_2707 )
      ( MAKE-4PILE ?auto_2706 ?auto_2707 ?auto_2708 ?auto_2709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2715 - BLOCK
      ?auto_2716 - BLOCK
      ?auto_2717 - BLOCK
      ?auto_2718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2718 ) ( ON-TABLE ?auto_2715 ) ( not ( = ?auto_2715 ?auto_2716 ) ) ( not ( = ?auto_2715 ?auto_2717 ) ) ( not ( = ?auto_2715 ?auto_2718 ) ) ( not ( = ?auto_2716 ?auto_2717 ) ) ( not ( = ?auto_2716 ?auto_2718 ) ) ( not ( = ?auto_2717 ?auto_2718 ) ) ( ON ?auto_2717 ?auto_2718 ) ( CLEAR ?auto_2715 ) ( ON ?auto_2716 ?auto_2717 ) ( CLEAR ?auto_2716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2715 ?auto_2716 )
      ( MAKE-4PILE ?auto_2715 ?auto_2716 ?auto_2717 ?auto_2718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2723 - BLOCK
      ?auto_2724 - BLOCK
      ?auto_2725 - BLOCK
      ?auto_2726 - BLOCK
    )
    :vars
    (
      ?auto_2727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2726 ?auto_2727 ) ( not ( = ?auto_2723 ?auto_2724 ) ) ( not ( = ?auto_2723 ?auto_2725 ) ) ( not ( = ?auto_2723 ?auto_2726 ) ) ( not ( = ?auto_2723 ?auto_2727 ) ) ( not ( = ?auto_2724 ?auto_2725 ) ) ( not ( = ?auto_2724 ?auto_2726 ) ) ( not ( = ?auto_2724 ?auto_2727 ) ) ( not ( = ?auto_2725 ?auto_2726 ) ) ( not ( = ?auto_2725 ?auto_2727 ) ) ( not ( = ?auto_2726 ?auto_2727 ) ) ( ON ?auto_2725 ?auto_2726 ) ( ON ?auto_2724 ?auto_2725 ) ( ON ?auto_2723 ?auto_2724 ) ( CLEAR ?auto_2723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2723 )
      ( MAKE-4PILE ?auto_2723 ?auto_2724 ?auto_2725 ?auto_2726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2732 - BLOCK
      ?auto_2733 - BLOCK
      ?auto_2734 - BLOCK
      ?auto_2735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2735 ) ( not ( = ?auto_2732 ?auto_2733 ) ) ( not ( = ?auto_2732 ?auto_2734 ) ) ( not ( = ?auto_2732 ?auto_2735 ) ) ( not ( = ?auto_2733 ?auto_2734 ) ) ( not ( = ?auto_2733 ?auto_2735 ) ) ( not ( = ?auto_2734 ?auto_2735 ) ) ( ON ?auto_2734 ?auto_2735 ) ( ON ?auto_2733 ?auto_2734 ) ( ON ?auto_2732 ?auto_2733 ) ( CLEAR ?auto_2732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2732 )
      ( MAKE-4PILE ?auto_2732 ?auto_2733 ?auto_2734 ?auto_2735 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2740 - BLOCK
      ?auto_2741 - BLOCK
      ?auto_2742 - BLOCK
      ?auto_2743 - BLOCK
    )
    :vars
    (
      ?auto_2744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2740 ?auto_2741 ) ) ( not ( = ?auto_2740 ?auto_2742 ) ) ( not ( = ?auto_2740 ?auto_2743 ) ) ( not ( = ?auto_2741 ?auto_2742 ) ) ( not ( = ?auto_2741 ?auto_2743 ) ) ( not ( = ?auto_2742 ?auto_2743 ) ) ( ON ?auto_2740 ?auto_2744 ) ( not ( = ?auto_2743 ?auto_2744 ) ) ( not ( = ?auto_2742 ?auto_2744 ) ) ( not ( = ?auto_2741 ?auto_2744 ) ) ( not ( = ?auto_2740 ?auto_2744 ) ) ( ON ?auto_2741 ?auto_2740 ) ( ON ?auto_2742 ?auto_2741 ) ( ON ?auto_2743 ?auto_2742 ) ( CLEAR ?auto_2743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_2743 ?auto_2742 ?auto_2741 ?auto_2740 )
      ( MAKE-4PILE ?auto_2740 ?auto_2741 ?auto_2742 ?auto_2743 ) )
  )

)

