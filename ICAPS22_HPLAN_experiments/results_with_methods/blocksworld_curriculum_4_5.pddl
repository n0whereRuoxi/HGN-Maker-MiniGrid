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
      ?auto_2746 - BLOCK
    )
    :vars
    (
      ?auto_2747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2746 ?auto_2747 ) ( CLEAR ?auto_2746 ) ( HAND-EMPTY ) ( not ( = ?auto_2746 ?auto_2747 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2746 ?auto_2747 )
      ( !PUTDOWN ?auto_2746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2749 - BLOCK
    )
    :vars
    (
      ?auto_2750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2749 ?auto_2750 ) ( CLEAR ?auto_2749 ) ( HAND-EMPTY ) ( not ( = ?auto_2749 ?auto_2750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2749 ?auto_2750 )
      ( !PUTDOWN ?auto_2749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2753 - BLOCK
      ?auto_2754 - BLOCK
    )
    :vars
    (
      ?auto_2755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2753 ) ( ON ?auto_2754 ?auto_2755 ) ( CLEAR ?auto_2754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2753 ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( not ( = ?auto_2753 ?auto_2755 ) ) ( not ( = ?auto_2754 ?auto_2755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2754 ?auto_2755 )
      ( !STACK ?auto_2754 ?auto_2753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2758 - BLOCK
      ?auto_2759 - BLOCK
    )
    :vars
    (
      ?auto_2760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2758 ) ( ON ?auto_2759 ?auto_2760 ) ( CLEAR ?auto_2759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2758 ) ( not ( = ?auto_2758 ?auto_2759 ) ) ( not ( = ?auto_2758 ?auto_2760 ) ) ( not ( = ?auto_2759 ?auto_2760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2759 ?auto_2760 )
      ( !STACK ?auto_2759 ?auto_2758 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2763 - BLOCK
      ?auto_2764 - BLOCK
    )
    :vars
    (
      ?auto_2765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2764 ?auto_2765 ) ( not ( = ?auto_2763 ?auto_2764 ) ) ( not ( = ?auto_2763 ?auto_2765 ) ) ( not ( = ?auto_2764 ?auto_2765 ) ) ( ON ?auto_2763 ?auto_2764 ) ( CLEAR ?auto_2763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2763 )
      ( MAKE-2PILE ?auto_2763 ?auto_2764 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2768 - BLOCK
      ?auto_2769 - BLOCK
    )
    :vars
    (
      ?auto_2770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2769 ?auto_2770 ) ( not ( = ?auto_2768 ?auto_2769 ) ) ( not ( = ?auto_2768 ?auto_2770 ) ) ( not ( = ?auto_2769 ?auto_2770 ) ) ( ON ?auto_2768 ?auto_2769 ) ( CLEAR ?auto_2768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2768 )
      ( MAKE-2PILE ?auto_2768 ?auto_2769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2774 - BLOCK
      ?auto_2775 - BLOCK
      ?auto_2776 - BLOCK
    )
    :vars
    (
      ?auto_2777 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2775 ) ( ON ?auto_2776 ?auto_2777 ) ( CLEAR ?auto_2776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2774 ) ( ON ?auto_2775 ?auto_2774 ) ( not ( = ?auto_2774 ?auto_2775 ) ) ( not ( = ?auto_2774 ?auto_2776 ) ) ( not ( = ?auto_2774 ?auto_2777 ) ) ( not ( = ?auto_2775 ?auto_2776 ) ) ( not ( = ?auto_2775 ?auto_2777 ) ) ( not ( = ?auto_2776 ?auto_2777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2776 ?auto_2777 )
      ( !STACK ?auto_2776 ?auto_2775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2781 - BLOCK
      ?auto_2782 - BLOCK
      ?auto_2783 - BLOCK
    )
    :vars
    (
      ?auto_2784 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2782 ) ( ON ?auto_2783 ?auto_2784 ) ( CLEAR ?auto_2783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2781 ) ( ON ?auto_2782 ?auto_2781 ) ( not ( = ?auto_2781 ?auto_2782 ) ) ( not ( = ?auto_2781 ?auto_2783 ) ) ( not ( = ?auto_2781 ?auto_2784 ) ) ( not ( = ?auto_2782 ?auto_2783 ) ) ( not ( = ?auto_2782 ?auto_2784 ) ) ( not ( = ?auto_2783 ?auto_2784 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2783 ?auto_2784 )
      ( !STACK ?auto_2783 ?auto_2782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2788 - BLOCK
      ?auto_2789 - BLOCK
      ?auto_2790 - BLOCK
    )
    :vars
    (
      ?auto_2791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2790 ?auto_2791 ) ( ON-TABLE ?auto_2788 ) ( not ( = ?auto_2788 ?auto_2789 ) ) ( not ( = ?auto_2788 ?auto_2790 ) ) ( not ( = ?auto_2788 ?auto_2791 ) ) ( not ( = ?auto_2789 ?auto_2790 ) ) ( not ( = ?auto_2789 ?auto_2791 ) ) ( not ( = ?auto_2790 ?auto_2791 ) ) ( CLEAR ?auto_2788 ) ( ON ?auto_2789 ?auto_2790 ) ( CLEAR ?auto_2789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2788 ?auto_2789 )
      ( MAKE-3PILE ?auto_2788 ?auto_2789 ?auto_2790 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2795 - BLOCK
      ?auto_2796 - BLOCK
      ?auto_2797 - BLOCK
    )
    :vars
    (
      ?auto_2798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2797 ?auto_2798 ) ( ON-TABLE ?auto_2795 ) ( not ( = ?auto_2795 ?auto_2796 ) ) ( not ( = ?auto_2795 ?auto_2797 ) ) ( not ( = ?auto_2795 ?auto_2798 ) ) ( not ( = ?auto_2796 ?auto_2797 ) ) ( not ( = ?auto_2796 ?auto_2798 ) ) ( not ( = ?auto_2797 ?auto_2798 ) ) ( CLEAR ?auto_2795 ) ( ON ?auto_2796 ?auto_2797 ) ( CLEAR ?auto_2796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2795 ?auto_2796 )
      ( MAKE-3PILE ?auto_2795 ?auto_2796 ?auto_2797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2802 - BLOCK
      ?auto_2803 - BLOCK
      ?auto_2804 - BLOCK
    )
    :vars
    (
      ?auto_2805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2804 ?auto_2805 ) ( not ( = ?auto_2802 ?auto_2803 ) ) ( not ( = ?auto_2802 ?auto_2804 ) ) ( not ( = ?auto_2802 ?auto_2805 ) ) ( not ( = ?auto_2803 ?auto_2804 ) ) ( not ( = ?auto_2803 ?auto_2805 ) ) ( not ( = ?auto_2804 ?auto_2805 ) ) ( ON ?auto_2803 ?auto_2804 ) ( ON ?auto_2802 ?auto_2803 ) ( CLEAR ?auto_2802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2802 )
      ( MAKE-3PILE ?auto_2802 ?auto_2803 ?auto_2804 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2809 - BLOCK
      ?auto_2810 - BLOCK
      ?auto_2811 - BLOCK
    )
    :vars
    (
      ?auto_2812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2811 ?auto_2812 ) ( not ( = ?auto_2809 ?auto_2810 ) ) ( not ( = ?auto_2809 ?auto_2811 ) ) ( not ( = ?auto_2809 ?auto_2812 ) ) ( not ( = ?auto_2810 ?auto_2811 ) ) ( not ( = ?auto_2810 ?auto_2812 ) ) ( not ( = ?auto_2811 ?auto_2812 ) ) ( ON ?auto_2810 ?auto_2811 ) ( ON ?auto_2809 ?auto_2810 ) ( CLEAR ?auto_2809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2809 )
      ( MAKE-3PILE ?auto_2809 ?auto_2810 ?auto_2811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2817 - BLOCK
      ?auto_2818 - BLOCK
      ?auto_2819 - BLOCK
      ?auto_2820 - BLOCK
    )
    :vars
    (
      ?auto_2821 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2819 ) ( ON ?auto_2820 ?auto_2821 ) ( CLEAR ?auto_2820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2817 ) ( ON ?auto_2818 ?auto_2817 ) ( ON ?auto_2819 ?auto_2818 ) ( not ( = ?auto_2817 ?auto_2818 ) ) ( not ( = ?auto_2817 ?auto_2819 ) ) ( not ( = ?auto_2817 ?auto_2820 ) ) ( not ( = ?auto_2817 ?auto_2821 ) ) ( not ( = ?auto_2818 ?auto_2819 ) ) ( not ( = ?auto_2818 ?auto_2820 ) ) ( not ( = ?auto_2818 ?auto_2821 ) ) ( not ( = ?auto_2819 ?auto_2820 ) ) ( not ( = ?auto_2819 ?auto_2821 ) ) ( not ( = ?auto_2820 ?auto_2821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2820 ?auto_2821 )
      ( !STACK ?auto_2820 ?auto_2819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2826 - BLOCK
      ?auto_2827 - BLOCK
      ?auto_2828 - BLOCK
      ?auto_2829 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2828 ) ( ON-TABLE ?auto_2829 ) ( CLEAR ?auto_2829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2826 ) ( ON ?auto_2827 ?auto_2826 ) ( ON ?auto_2828 ?auto_2827 ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2828 ) ) ( not ( = ?auto_2826 ?auto_2829 ) ) ( not ( = ?auto_2827 ?auto_2828 ) ) ( not ( = ?auto_2827 ?auto_2829 ) ) ( not ( = ?auto_2828 ?auto_2829 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_2829 )
      ( !STACK ?auto_2829 ?auto_2828 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2834 - BLOCK
      ?auto_2835 - BLOCK
      ?auto_2836 - BLOCK
      ?auto_2837 - BLOCK
    )
    :vars
    (
      ?auto_2838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2837 ?auto_2838 ) ( ON-TABLE ?auto_2834 ) ( ON ?auto_2835 ?auto_2834 ) ( not ( = ?auto_2834 ?auto_2835 ) ) ( not ( = ?auto_2834 ?auto_2836 ) ) ( not ( = ?auto_2834 ?auto_2837 ) ) ( not ( = ?auto_2834 ?auto_2838 ) ) ( not ( = ?auto_2835 ?auto_2836 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2835 ?auto_2838 ) ) ( not ( = ?auto_2836 ?auto_2837 ) ) ( not ( = ?auto_2836 ?auto_2838 ) ) ( not ( = ?auto_2837 ?auto_2838 ) ) ( CLEAR ?auto_2835 ) ( ON ?auto_2836 ?auto_2837 ) ( CLEAR ?auto_2836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2834 ?auto_2835 ?auto_2836 )
      ( MAKE-4PILE ?auto_2834 ?auto_2835 ?auto_2836 ?auto_2837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2843 - BLOCK
      ?auto_2844 - BLOCK
      ?auto_2845 - BLOCK
      ?auto_2846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2846 ) ( ON-TABLE ?auto_2843 ) ( ON ?auto_2844 ?auto_2843 ) ( not ( = ?auto_2843 ?auto_2844 ) ) ( not ( = ?auto_2843 ?auto_2845 ) ) ( not ( = ?auto_2843 ?auto_2846 ) ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( not ( = ?auto_2844 ?auto_2846 ) ) ( not ( = ?auto_2845 ?auto_2846 ) ) ( CLEAR ?auto_2844 ) ( ON ?auto_2845 ?auto_2846 ) ( CLEAR ?auto_2845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2843 ?auto_2844 ?auto_2845 )
      ( MAKE-4PILE ?auto_2843 ?auto_2844 ?auto_2845 ?auto_2846 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2851 - BLOCK
      ?auto_2852 - BLOCK
      ?auto_2853 - BLOCK
      ?auto_2854 - BLOCK
    )
    :vars
    (
      ?auto_2855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2854 ?auto_2855 ) ( ON-TABLE ?auto_2851 ) ( not ( = ?auto_2851 ?auto_2852 ) ) ( not ( = ?auto_2851 ?auto_2853 ) ) ( not ( = ?auto_2851 ?auto_2854 ) ) ( not ( = ?auto_2851 ?auto_2855 ) ) ( not ( = ?auto_2852 ?auto_2853 ) ) ( not ( = ?auto_2852 ?auto_2854 ) ) ( not ( = ?auto_2852 ?auto_2855 ) ) ( not ( = ?auto_2853 ?auto_2854 ) ) ( not ( = ?auto_2853 ?auto_2855 ) ) ( not ( = ?auto_2854 ?auto_2855 ) ) ( ON ?auto_2853 ?auto_2854 ) ( CLEAR ?auto_2851 ) ( ON ?auto_2852 ?auto_2853 ) ( CLEAR ?auto_2852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2851 ?auto_2852 )
      ( MAKE-4PILE ?auto_2851 ?auto_2852 ?auto_2853 ?auto_2854 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2860 - BLOCK
      ?auto_2861 - BLOCK
      ?auto_2862 - BLOCK
      ?auto_2863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2863 ) ( ON-TABLE ?auto_2860 ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( not ( = ?auto_2860 ?auto_2862 ) ) ( not ( = ?auto_2860 ?auto_2863 ) ) ( not ( = ?auto_2861 ?auto_2862 ) ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( ON ?auto_2862 ?auto_2863 ) ( CLEAR ?auto_2860 ) ( ON ?auto_2861 ?auto_2862 ) ( CLEAR ?auto_2861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2860 ?auto_2861 )
      ( MAKE-4PILE ?auto_2860 ?auto_2861 ?auto_2862 ?auto_2863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2868 - BLOCK
      ?auto_2869 - BLOCK
      ?auto_2870 - BLOCK
      ?auto_2871 - BLOCK
    )
    :vars
    (
      ?auto_2872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2871 ?auto_2872 ) ( not ( = ?auto_2868 ?auto_2869 ) ) ( not ( = ?auto_2868 ?auto_2870 ) ) ( not ( = ?auto_2868 ?auto_2871 ) ) ( not ( = ?auto_2868 ?auto_2872 ) ) ( not ( = ?auto_2869 ?auto_2870 ) ) ( not ( = ?auto_2869 ?auto_2871 ) ) ( not ( = ?auto_2869 ?auto_2872 ) ) ( not ( = ?auto_2870 ?auto_2871 ) ) ( not ( = ?auto_2870 ?auto_2872 ) ) ( not ( = ?auto_2871 ?auto_2872 ) ) ( ON ?auto_2870 ?auto_2871 ) ( ON ?auto_2869 ?auto_2870 ) ( ON ?auto_2868 ?auto_2869 ) ( CLEAR ?auto_2868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2868 )
      ( MAKE-4PILE ?auto_2868 ?auto_2869 ?auto_2870 ?auto_2871 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2877 - BLOCK
      ?auto_2878 - BLOCK
      ?auto_2879 - BLOCK
      ?auto_2880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2880 ) ( not ( = ?auto_2877 ?auto_2878 ) ) ( not ( = ?auto_2877 ?auto_2879 ) ) ( not ( = ?auto_2877 ?auto_2880 ) ) ( not ( = ?auto_2878 ?auto_2879 ) ) ( not ( = ?auto_2878 ?auto_2880 ) ) ( not ( = ?auto_2879 ?auto_2880 ) ) ( ON ?auto_2879 ?auto_2880 ) ( ON ?auto_2878 ?auto_2879 ) ( ON ?auto_2877 ?auto_2878 ) ( CLEAR ?auto_2877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2877 )
      ( MAKE-4PILE ?auto_2877 ?auto_2878 ?auto_2879 ?auto_2880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_2885 - BLOCK
      ?auto_2886 - BLOCK
      ?auto_2887 - BLOCK
      ?auto_2888 - BLOCK
    )
    :vars
    (
      ?auto_2889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2885 ?auto_2886 ) ) ( not ( = ?auto_2885 ?auto_2887 ) ) ( not ( = ?auto_2885 ?auto_2888 ) ) ( not ( = ?auto_2886 ?auto_2887 ) ) ( not ( = ?auto_2886 ?auto_2888 ) ) ( not ( = ?auto_2887 ?auto_2888 ) ) ( ON ?auto_2885 ?auto_2889 ) ( not ( = ?auto_2888 ?auto_2889 ) ) ( not ( = ?auto_2887 ?auto_2889 ) ) ( not ( = ?auto_2886 ?auto_2889 ) ) ( not ( = ?auto_2885 ?auto_2889 ) ) ( ON ?auto_2886 ?auto_2885 ) ( ON ?auto_2887 ?auto_2886 ) ( ON ?auto_2888 ?auto_2887 ) ( CLEAR ?auto_2888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_2888 ?auto_2887 ?auto_2886 ?auto_2885 )
      ( MAKE-4PILE ?auto_2885 ?auto_2886 ?auto_2887 ?auto_2888 ) )
  )

)

