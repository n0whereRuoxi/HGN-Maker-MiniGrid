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
      ?auto_2718 - SURFACE
      ?auto_2719 - SURFACE
    )
    :vars
    (
      ?auto_2720 - HOIST
      ?auto_2721 - PLACE
      ?auto_2723 - PLACE
      ?auto_2724 - HOIST
      ?auto_2725 - SURFACE
      ?auto_2722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2720 ?auto_2721 ) ( SURFACE-AT ?auto_2718 ?auto_2721 ) ( CLEAR ?auto_2718 ) ( IS-CRATE ?auto_2719 ) ( AVAILABLE ?auto_2720 ) ( not ( = ?auto_2723 ?auto_2721 ) ) ( HOIST-AT ?auto_2724 ?auto_2723 ) ( AVAILABLE ?auto_2724 ) ( SURFACE-AT ?auto_2719 ?auto_2723 ) ( ON ?auto_2719 ?auto_2725 ) ( CLEAR ?auto_2719 ) ( TRUCK-AT ?auto_2722 ?auto_2721 ) ( not ( = ?auto_2718 ?auto_2719 ) ) ( not ( = ?auto_2718 ?auto_2725 ) ) ( not ( = ?auto_2719 ?auto_2725 ) ) ( not ( = ?auto_2720 ?auto_2724 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2722 ?auto_2721 ?auto_2723 )
      ( !LIFT ?auto_2724 ?auto_2719 ?auto_2725 ?auto_2723 )
      ( !LOAD ?auto_2724 ?auto_2719 ?auto_2722 ?auto_2723 )
      ( !DRIVE ?auto_2722 ?auto_2723 ?auto_2721 )
      ( !UNLOAD ?auto_2720 ?auto_2719 ?auto_2722 ?auto_2721 )
      ( !DROP ?auto_2720 ?auto_2719 ?auto_2718 ?auto_2721 )
      ( MAKE-1CRATE-VERIFY ?auto_2718 ?auto_2719 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2739 - SURFACE
      ?auto_2740 - SURFACE
      ?auto_2741 - SURFACE
    )
    :vars
    (
      ?auto_2744 - HOIST
      ?auto_2743 - PLACE
      ?auto_2745 - PLACE
      ?auto_2742 - HOIST
      ?auto_2747 - SURFACE
      ?auto_2749 - PLACE
      ?auto_2750 - HOIST
      ?auto_2748 - SURFACE
      ?auto_2746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2744 ?auto_2743 ) ( IS-CRATE ?auto_2741 ) ( not ( = ?auto_2745 ?auto_2743 ) ) ( HOIST-AT ?auto_2742 ?auto_2745 ) ( AVAILABLE ?auto_2742 ) ( SURFACE-AT ?auto_2741 ?auto_2745 ) ( ON ?auto_2741 ?auto_2747 ) ( CLEAR ?auto_2741 ) ( not ( = ?auto_2740 ?auto_2741 ) ) ( not ( = ?auto_2740 ?auto_2747 ) ) ( not ( = ?auto_2741 ?auto_2747 ) ) ( not ( = ?auto_2744 ?auto_2742 ) ) ( SURFACE-AT ?auto_2739 ?auto_2743 ) ( CLEAR ?auto_2739 ) ( IS-CRATE ?auto_2740 ) ( AVAILABLE ?auto_2744 ) ( not ( = ?auto_2749 ?auto_2743 ) ) ( HOIST-AT ?auto_2750 ?auto_2749 ) ( AVAILABLE ?auto_2750 ) ( SURFACE-AT ?auto_2740 ?auto_2749 ) ( ON ?auto_2740 ?auto_2748 ) ( CLEAR ?auto_2740 ) ( TRUCK-AT ?auto_2746 ?auto_2743 ) ( not ( = ?auto_2739 ?auto_2740 ) ) ( not ( = ?auto_2739 ?auto_2748 ) ) ( not ( = ?auto_2740 ?auto_2748 ) ) ( not ( = ?auto_2744 ?auto_2750 ) ) ( not ( = ?auto_2739 ?auto_2741 ) ) ( not ( = ?auto_2739 ?auto_2747 ) ) ( not ( = ?auto_2741 ?auto_2748 ) ) ( not ( = ?auto_2745 ?auto_2749 ) ) ( not ( = ?auto_2742 ?auto_2750 ) ) ( not ( = ?auto_2747 ?auto_2748 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2739 ?auto_2740 )
      ( MAKE-1CRATE ?auto_2740 ?auto_2741 )
      ( MAKE-2CRATE-VERIFY ?auto_2739 ?auto_2740 ?auto_2741 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2765 - SURFACE
      ?auto_2766 - SURFACE
      ?auto_2767 - SURFACE
      ?auto_2768 - SURFACE
    )
    :vars
    (
      ?auto_2770 - HOIST
      ?auto_2769 - PLACE
      ?auto_2774 - PLACE
      ?auto_2771 - HOIST
      ?auto_2772 - SURFACE
      ?auto_2775 - PLACE
      ?auto_2780 - HOIST
      ?auto_2779 - SURFACE
      ?auto_2777 - PLACE
      ?auto_2776 - HOIST
      ?auto_2778 - SURFACE
      ?auto_2773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2770 ?auto_2769 ) ( IS-CRATE ?auto_2768 ) ( not ( = ?auto_2774 ?auto_2769 ) ) ( HOIST-AT ?auto_2771 ?auto_2774 ) ( AVAILABLE ?auto_2771 ) ( SURFACE-AT ?auto_2768 ?auto_2774 ) ( ON ?auto_2768 ?auto_2772 ) ( CLEAR ?auto_2768 ) ( not ( = ?auto_2767 ?auto_2768 ) ) ( not ( = ?auto_2767 ?auto_2772 ) ) ( not ( = ?auto_2768 ?auto_2772 ) ) ( not ( = ?auto_2770 ?auto_2771 ) ) ( IS-CRATE ?auto_2767 ) ( not ( = ?auto_2775 ?auto_2769 ) ) ( HOIST-AT ?auto_2780 ?auto_2775 ) ( AVAILABLE ?auto_2780 ) ( SURFACE-AT ?auto_2767 ?auto_2775 ) ( ON ?auto_2767 ?auto_2779 ) ( CLEAR ?auto_2767 ) ( not ( = ?auto_2766 ?auto_2767 ) ) ( not ( = ?auto_2766 ?auto_2779 ) ) ( not ( = ?auto_2767 ?auto_2779 ) ) ( not ( = ?auto_2770 ?auto_2780 ) ) ( SURFACE-AT ?auto_2765 ?auto_2769 ) ( CLEAR ?auto_2765 ) ( IS-CRATE ?auto_2766 ) ( AVAILABLE ?auto_2770 ) ( not ( = ?auto_2777 ?auto_2769 ) ) ( HOIST-AT ?auto_2776 ?auto_2777 ) ( AVAILABLE ?auto_2776 ) ( SURFACE-AT ?auto_2766 ?auto_2777 ) ( ON ?auto_2766 ?auto_2778 ) ( CLEAR ?auto_2766 ) ( TRUCK-AT ?auto_2773 ?auto_2769 ) ( not ( = ?auto_2765 ?auto_2766 ) ) ( not ( = ?auto_2765 ?auto_2778 ) ) ( not ( = ?auto_2766 ?auto_2778 ) ) ( not ( = ?auto_2770 ?auto_2776 ) ) ( not ( = ?auto_2765 ?auto_2767 ) ) ( not ( = ?auto_2765 ?auto_2779 ) ) ( not ( = ?auto_2767 ?auto_2778 ) ) ( not ( = ?auto_2775 ?auto_2777 ) ) ( not ( = ?auto_2780 ?auto_2776 ) ) ( not ( = ?auto_2779 ?auto_2778 ) ) ( not ( = ?auto_2765 ?auto_2768 ) ) ( not ( = ?auto_2765 ?auto_2772 ) ) ( not ( = ?auto_2766 ?auto_2768 ) ) ( not ( = ?auto_2766 ?auto_2772 ) ) ( not ( = ?auto_2768 ?auto_2779 ) ) ( not ( = ?auto_2768 ?auto_2778 ) ) ( not ( = ?auto_2774 ?auto_2775 ) ) ( not ( = ?auto_2774 ?auto_2777 ) ) ( not ( = ?auto_2771 ?auto_2780 ) ) ( not ( = ?auto_2771 ?auto_2776 ) ) ( not ( = ?auto_2772 ?auto_2779 ) ) ( not ( = ?auto_2772 ?auto_2778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2765 ?auto_2766 ?auto_2767 )
      ( MAKE-1CRATE ?auto_2767 ?auto_2768 )
      ( MAKE-3CRATE-VERIFY ?auto_2765 ?auto_2766 ?auto_2767 ?auto_2768 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2796 - SURFACE
      ?auto_2797 - SURFACE
      ?auto_2798 - SURFACE
      ?auto_2799 - SURFACE
      ?auto_2800 - SURFACE
    )
    :vars
    (
      ?auto_2802 - HOIST
      ?auto_2804 - PLACE
      ?auto_2806 - PLACE
      ?auto_2801 - HOIST
      ?auto_2803 - SURFACE
      ?auto_2813 - PLACE
      ?auto_2812 - HOIST
      ?auto_2810 - SURFACE
      ?auto_2814 - PLACE
      ?auto_2809 - HOIST
      ?auto_2811 - SURFACE
      ?auto_2807 - PLACE
      ?auto_2815 - HOIST
      ?auto_2808 - SURFACE
      ?auto_2805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2802 ?auto_2804 ) ( IS-CRATE ?auto_2800 ) ( not ( = ?auto_2806 ?auto_2804 ) ) ( HOIST-AT ?auto_2801 ?auto_2806 ) ( AVAILABLE ?auto_2801 ) ( SURFACE-AT ?auto_2800 ?auto_2806 ) ( ON ?auto_2800 ?auto_2803 ) ( CLEAR ?auto_2800 ) ( not ( = ?auto_2799 ?auto_2800 ) ) ( not ( = ?auto_2799 ?auto_2803 ) ) ( not ( = ?auto_2800 ?auto_2803 ) ) ( not ( = ?auto_2802 ?auto_2801 ) ) ( IS-CRATE ?auto_2799 ) ( not ( = ?auto_2813 ?auto_2804 ) ) ( HOIST-AT ?auto_2812 ?auto_2813 ) ( AVAILABLE ?auto_2812 ) ( SURFACE-AT ?auto_2799 ?auto_2813 ) ( ON ?auto_2799 ?auto_2810 ) ( CLEAR ?auto_2799 ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( not ( = ?auto_2798 ?auto_2810 ) ) ( not ( = ?auto_2799 ?auto_2810 ) ) ( not ( = ?auto_2802 ?auto_2812 ) ) ( IS-CRATE ?auto_2798 ) ( not ( = ?auto_2814 ?auto_2804 ) ) ( HOIST-AT ?auto_2809 ?auto_2814 ) ( AVAILABLE ?auto_2809 ) ( SURFACE-AT ?auto_2798 ?auto_2814 ) ( ON ?auto_2798 ?auto_2811 ) ( CLEAR ?auto_2798 ) ( not ( = ?auto_2797 ?auto_2798 ) ) ( not ( = ?auto_2797 ?auto_2811 ) ) ( not ( = ?auto_2798 ?auto_2811 ) ) ( not ( = ?auto_2802 ?auto_2809 ) ) ( SURFACE-AT ?auto_2796 ?auto_2804 ) ( CLEAR ?auto_2796 ) ( IS-CRATE ?auto_2797 ) ( AVAILABLE ?auto_2802 ) ( not ( = ?auto_2807 ?auto_2804 ) ) ( HOIST-AT ?auto_2815 ?auto_2807 ) ( AVAILABLE ?auto_2815 ) ( SURFACE-AT ?auto_2797 ?auto_2807 ) ( ON ?auto_2797 ?auto_2808 ) ( CLEAR ?auto_2797 ) ( TRUCK-AT ?auto_2805 ?auto_2804 ) ( not ( = ?auto_2796 ?auto_2797 ) ) ( not ( = ?auto_2796 ?auto_2808 ) ) ( not ( = ?auto_2797 ?auto_2808 ) ) ( not ( = ?auto_2802 ?auto_2815 ) ) ( not ( = ?auto_2796 ?auto_2798 ) ) ( not ( = ?auto_2796 ?auto_2811 ) ) ( not ( = ?auto_2798 ?auto_2808 ) ) ( not ( = ?auto_2814 ?auto_2807 ) ) ( not ( = ?auto_2809 ?auto_2815 ) ) ( not ( = ?auto_2811 ?auto_2808 ) ) ( not ( = ?auto_2796 ?auto_2799 ) ) ( not ( = ?auto_2796 ?auto_2810 ) ) ( not ( = ?auto_2797 ?auto_2799 ) ) ( not ( = ?auto_2797 ?auto_2810 ) ) ( not ( = ?auto_2799 ?auto_2811 ) ) ( not ( = ?auto_2799 ?auto_2808 ) ) ( not ( = ?auto_2813 ?auto_2814 ) ) ( not ( = ?auto_2813 ?auto_2807 ) ) ( not ( = ?auto_2812 ?auto_2809 ) ) ( not ( = ?auto_2812 ?auto_2815 ) ) ( not ( = ?auto_2810 ?auto_2811 ) ) ( not ( = ?auto_2810 ?auto_2808 ) ) ( not ( = ?auto_2796 ?auto_2800 ) ) ( not ( = ?auto_2796 ?auto_2803 ) ) ( not ( = ?auto_2797 ?auto_2800 ) ) ( not ( = ?auto_2797 ?auto_2803 ) ) ( not ( = ?auto_2798 ?auto_2800 ) ) ( not ( = ?auto_2798 ?auto_2803 ) ) ( not ( = ?auto_2800 ?auto_2810 ) ) ( not ( = ?auto_2800 ?auto_2811 ) ) ( not ( = ?auto_2800 ?auto_2808 ) ) ( not ( = ?auto_2806 ?auto_2813 ) ) ( not ( = ?auto_2806 ?auto_2814 ) ) ( not ( = ?auto_2806 ?auto_2807 ) ) ( not ( = ?auto_2801 ?auto_2812 ) ) ( not ( = ?auto_2801 ?auto_2809 ) ) ( not ( = ?auto_2801 ?auto_2815 ) ) ( not ( = ?auto_2803 ?auto_2810 ) ) ( not ( = ?auto_2803 ?auto_2811 ) ) ( not ( = ?auto_2803 ?auto_2808 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2796 ?auto_2797 ?auto_2798 ?auto_2799 )
      ( MAKE-1CRATE ?auto_2799 ?auto_2800 )
      ( MAKE-4CRATE-VERIFY ?auto_2796 ?auto_2797 ?auto_2798 ?auto_2799 ?auto_2800 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2832 - SURFACE
      ?auto_2833 - SURFACE
      ?auto_2834 - SURFACE
      ?auto_2835 - SURFACE
      ?auto_2836 - SURFACE
      ?auto_2837 - SURFACE
    )
    :vars
    (
      ?auto_2838 - HOIST
      ?auto_2842 - PLACE
      ?auto_2843 - PLACE
      ?auto_2840 - HOIST
      ?auto_2839 - SURFACE
      ?auto_2845 - PLACE
      ?auto_2848 - HOIST
      ?auto_2849 - SURFACE
      ?auto_2844 - PLACE
      ?auto_2846 - HOIST
      ?auto_2851 - SURFACE
      ?auto_2850 - PLACE
      ?auto_2855 - HOIST
      ?auto_2852 - SURFACE
      ?auto_2853 - PLACE
      ?auto_2854 - HOIST
      ?auto_2847 - SURFACE
      ?auto_2841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2838 ?auto_2842 ) ( IS-CRATE ?auto_2837 ) ( not ( = ?auto_2843 ?auto_2842 ) ) ( HOIST-AT ?auto_2840 ?auto_2843 ) ( AVAILABLE ?auto_2840 ) ( SURFACE-AT ?auto_2837 ?auto_2843 ) ( ON ?auto_2837 ?auto_2839 ) ( CLEAR ?auto_2837 ) ( not ( = ?auto_2836 ?auto_2837 ) ) ( not ( = ?auto_2836 ?auto_2839 ) ) ( not ( = ?auto_2837 ?auto_2839 ) ) ( not ( = ?auto_2838 ?auto_2840 ) ) ( IS-CRATE ?auto_2836 ) ( not ( = ?auto_2845 ?auto_2842 ) ) ( HOIST-AT ?auto_2848 ?auto_2845 ) ( AVAILABLE ?auto_2848 ) ( SURFACE-AT ?auto_2836 ?auto_2845 ) ( ON ?auto_2836 ?auto_2849 ) ( CLEAR ?auto_2836 ) ( not ( = ?auto_2835 ?auto_2836 ) ) ( not ( = ?auto_2835 ?auto_2849 ) ) ( not ( = ?auto_2836 ?auto_2849 ) ) ( not ( = ?auto_2838 ?auto_2848 ) ) ( IS-CRATE ?auto_2835 ) ( not ( = ?auto_2844 ?auto_2842 ) ) ( HOIST-AT ?auto_2846 ?auto_2844 ) ( AVAILABLE ?auto_2846 ) ( SURFACE-AT ?auto_2835 ?auto_2844 ) ( ON ?auto_2835 ?auto_2851 ) ( CLEAR ?auto_2835 ) ( not ( = ?auto_2834 ?auto_2835 ) ) ( not ( = ?auto_2834 ?auto_2851 ) ) ( not ( = ?auto_2835 ?auto_2851 ) ) ( not ( = ?auto_2838 ?auto_2846 ) ) ( IS-CRATE ?auto_2834 ) ( not ( = ?auto_2850 ?auto_2842 ) ) ( HOIST-AT ?auto_2855 ?auto_2850 ) ( AVAILABLE ?auto_2855 ) ( SURFACE-AT ?auto_2834 ?auto_2850 ) ( ON ?auto_2834 ?auto_2852 ) ( CLEAR ?auto_2834 ) ( not ( = ?auto_2833 ?auto_2834 ) ) ( not ( = ?auto_2833 ?auto_2852 ) ) ( not ( = ?auto_2834 ?auto_2852 ) ) ( not ( = ?auto_2838 ?auto_2855 ) ) ( SURFACE-AT ?auto_2832 ?auto_2842 ) ( CLEAR ?auto_2832 ) ( IS-CRATE ?auto_2833 ) ( AVAILABLE ?auto_2838 ) ( not ( = ?auto_2853 ?auto_2842 ) ) ( HOIST-AT ?auto_2854 ?auto_2853 ) ( AVAILABLE ?auto_2854 ) ( SURFACE-AT ?auto_2833 ?auto_2853 ) ( ON ?auto_2833 ?auto_2847 ) ( CLEAR ?auto_2833 ) ( TRUCK-AT ?auto_2841 ?auto_2842 ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( not ( = ?auto_2832 ?auto_2847 ) ) ( not ( = ?auto_2833 ?auto_2847 ) ) ( not ( = ?auto_2838 ?auto_2854 ) ) ( not ( = ?auto_2832 ?auto_2834 ) ) ( not ( = ?auto_2832 ?auto_2852 ) ) ( not ( = ?auto_2834 ?auto_2847 ) ) ( not ( = ?auto_2850 ?auto_2853 ) ) ( not ( = ?auto_2855 ?auto_2854 ) ) ( not ( = ?auto_2852 ?auto_2847 ) ) ( not ( = ?auto_2832 ?auto_2835 ) ) ( not ( = ?auto_2832 ?auto_2851 ) ) ( not ( = ?auto_2833 ?auto_2835 ) ) ( not ( = ?auto_2833 ?auto_2851 ) ) ( not ( = ?auto_2835 ?auto_2852 ) ) ( not ( = ?auto_2835 ?auto_2847 ) ) ( not ( = ?auto_2844 ?auto_2850 ) ) ( not ( = ?auto_2844 ?auto_2853 ) ) ( not ( = ?auto_2846 ?auto_2855 ) ) ( not ( = ?auto_2846 ?auto_2854 ) ) ( not ( = ?auto_2851 ?auto_2852 ) ) ( not ( = ?auto_2851 ?auto_2847 ) ) ( not ( = ?auto_2832 ?auto_2836 ) ) ( not ( = ?auto_2832 ?auto_2849 ) ) ( not ( = ?auto_2833 ?auto_2836 ) ) ( not ( = ?auto_2833 ?auto_2849 ) ) ( not ( = ?auto_2834 ?auto_2836 ) ) ( not ( = ?auto_2834 ?auto_2849 ) ) ( not ( = ?auto_2836 ?auto_2851 ) ) ( not ( = ?auto_2836 ?auto_2852 ) ) ( not ( = ?auto_2836 ?auto_2847 ) ) ( not ( = ?auto_2845 ?auto_2844 ) ) ( not ( = ?auto_2845 ?auto_2850 ) ) ( not ( = ?auto_2845 ?auto_2853 ) ) ( not ( = ?auto_2848 ?auto_2846 ) ) ( not ( = ?auto_2848 ?auto_2855 ) ) ( not ( = ?auto_2848 ?auto_2854 ) ) ( not ( = ?auto_2849 ?auto_2851 ) ) ( not ( = ?auto_2849 ?auto_2852 ) ) ( not ( = ?auto_2849 ?auto_2847 ) ) ( not ( = ?auto_2832 ?auto_2837 ) ) ( not ( = ?auto_2832 ?auto_2839 ) ) ( not ( = ?auto_2833 ?auto_2837 ) ) ( not ( = ?auto_2833 ?auto_2839 ) ) ( not ( = ?auto_2834 ?auto_2837 ) ) ( not ( = ?auto_2834 ?auto_2839 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2835 ?auto_2839 ) ) ( not ( = ?auto_2837 ?auto_2849 ) ) ( not ( = ?auto_2837 ?auto_2851 ) ) ( not ( = ?auto_2837 ?auto_2852 ) ) ( not ( = ?auto_2837 ?auto_2847 ) ) ( not ( = ?auto_2843 ?auto_2845 ) ) ( not ( = ?auto_2843 ?auto_2844 ) ) ( not ( = ?auto_2843 ?auto_2850 ) ) ( not ( = ?auto_2843 ?auto_2853 ) ) ( not ( = ?auto_2840 ?auto_2848 ) ) ( not ( = ?auto_2840 ?auto_2846 ) ) ( not ( = ?auto_2840 ?auto_2855 ) ) ( not ( = ?auto_2840 ?auto_2854 ) ) ( not ( = ?auto_2839 ?auto_2849 ) ) ( not ( = ?auto_2839 ?auto_2851 ) ) ( not ( = ?auto_2839 ?auto_2852 ) ) ( not ( = ?auto_2839 ?auto_2847 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2832 ?auto_2833 ?auto_2834 ?auto_2835 ?auto_2836 )
      ( MAKE-1CRATE ?auto_2836 ?auto_2837 )
      ( MAKE-5CRATE-VERIFY ?auto_2832 ?auto_2833 ?auto_2834 ?auto_2835 ?auto_2836 ?auto_2837 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2873 - SURFACE
      ?auto_2874 - SURFACE
      ?auto_2875 - SURFACE
      ?auto_2876 - SURFACE
      ?auto_2877 - SURFACE
      ?auto_2878 - SURFACE
      ?auto_2879 - SURFACE
    )
    :vars
    (
      ?auto_2885 - HOIST
      ?auto_2884 - PLACE
      ?auto_2880 - PLACE
      ?auto_2881 - HOIST
      ?auto_2882 - SURFACE
      ?auto_2891 - PLACE
      ?auto_2887 - HOIST
      ?auto_2886 - SURFACE
      ?auto_2888 - PLACE
      ?auto_2895 - HOIST
      ?auto_2897 - SURFACE
      ?auto_2893 - PLACE
      ?auto_2892 - HOIST
      ?auto_2898 - SURFACE
      ?auto_2896 - PLACE
      ?auto_2890 - HOIST
      ?auto_2889 - SURFACE
      ?auto_2894 - SURFACE
      ?auto_2883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2885 ?auto_2884 ) ( IS-CRATE ?auto_2879 ) ( not ( = ?auto_2880 ?auto_2884 ) ) ( HOIST-AT ?auto_2881 ?auto_2880 ) ( SURFACE-AT ?auto_2879 ?auto_2880 ) ( ON ?auto_2879 ?auto_2882 ) ( CLEAR ?auto_2879 ) ( not ( = ?auto_2878 ?auto_2879 ) ) ( not ( = ?auto_2878 ?auto_2882 ) ) ( not ( = ?auto_2879 ?auto_2882 ) ) ( not ( = ?auto_2885 ?auto_2881 ) ) ( IS-CRATE ?auto_2878 ) ( not ( = ?auto_2891 ?auto_2884 ) ) ( HOIST-AT ?auto_2887 ?auto_2891 ) ( AVAILABLE ?auto_2887 ) ( SURFACE-AT ?auto_2878 ?auto_2891 ) ( ON ?auto_2878 ?auto_2886 ) ( CLEAR ?auto_2878 ) ( not ( = ?auto_2877 ?auto_2878 ) ) ( not ( = ?auto_2877 ?auto_2886 ) ) ( not ( = ?auto_2878 ?auto_2886 ) ) ( not ( = ?auto_2885 ?auto_2887 ) ) ( IS-CRATE ?auto_2877 ) ( not ( = ?auto_2888 ?auto_2884 ) ) ( HOIST-AT ?auto_2895 ?auto_2888 ) ( AVAILABLE ?auto_2895 ) ( SURFACE-AT ?auto_2877 ?auto_2888 ) ( ON ?auto_2877 ?auto_2897 ) ( CLEAR ?auto_2877 ) ( not ( = ?auto_2876 ?auto_2877 ) ) ( not ( = ?auto_2876 ?auto_2897 ) ) ( not ( = ?auto_2877 ?auto_2897 ) ) ( not ( = ?auto_2885 ?auto_2895 ) ) ( IS-CRATE ?auto_2876 ) ( not ( = ?auto_2893 ?auto_2884 ) ) ( HOIST-AT ?auto_2892 ?auto_2893 ) ( AVAILABLE ?auto_2892 ) ( SURFACE-AT ?auto_2876 ?auto_2893 ) ( ON ?auto_2876 ?auto_2898 ) ( CLEAR ?auto_2876 ) ( not ( = ?auto_2875 ?auto_2876 ) ) ( not ( = ?auto_2875 ?auto_2898 ) ) ( not ( = ?auto_2876 ?auto_2898 ) ) ( not ( = ?auto_2885 ?auto_2892 ) ) ( IS-CRATE ?auto_2875 ) ( not ( = ?auto_2896 ?auto_2884 ) ) ( HOIST-AT ?auto_2890 ?auto_2896 ) ( AVAILABLE ?auto_2890 ) ( SURFACE-AT ?auto_2875 ?auto_2896 ) ( ON ?auto_2875 ?auto_2889 ) ( CLEAR ?auto_2875 ) ( not ( = ?auto_2874 ?auto_2875 ) ) ( not ( = ?auto_2874 ?auto_2889 ) ) ( not ( = ?auto_2875 ?auto_2889 ) ) ( not ( = ?auto_2885 ?auto_2890 ) ) ( SURFACE-AT ?auto_2873 ?auto_2884 ) ( CLEAR ?auto_2873 ) ( IS-CRATE ?auto_2874 ) ( AVAILABLE ?auto_2885 ) ( AVAILABLE ?auto_2881 ) ( SURFACE-AT ?auto_2874 ?auto_2880 ) ( ON ?auto_2874 ?auto_2894 ) ( CLEAR ?auto_2874 ) ( TRUCK-AT ?auto_2883 ?auto_2884 ) ( not ( = ?auto_2873 ?auto_2874 ) ) ( not ( = ?auto_2873 ?auto_2894 ) ) ( not ( = ?auto_2874 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2875 ) ) ( not ( = ?auto_2873 ?auto_2889 ) ) ( not ( = ?auto_2875 ?auto_2894 ) ) ( not ( = ?auto_2896 ?auto_2880 ) ) ( not ( = ?auto_2890 ?auto_2881 ) ) ( not ( = ?auto_2889 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2876 ) ) ( not ( = ?auto_2873 ?auto_2898 ) ) ( not ( = ?auto_2874 ?auto_2876 ) ) ( not ( = ?auto_2874 ?auto_2898 ) ) ( not ( = ?auto_2876 ?auto_2889 ) ) ( not ( = ?auto_2876 ?auto_2894 ) ) ( not ( = ?auto_2893 ?auto_2896 ) ) ( not ( = ?auto_2893 ?auto_2880 ) ) ( not ( = ?auto_2892 ?auto_2890 ) ) ( not ( = ?auto_2892 ?auto_2881 ) ) ( not ( = ?auto_2898 ?auto_2889 ) ) ( not ( = ?auto_2898 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2877 ) ) ( not ( = ?auto_2873 ?auto_2897 ) ) ( not ( = ?auto_2874 ?auto_2877 ) ) ( not ( = ?auto_2874 ?auto_2897 ) ) ( not ( = ?auto_2875 ?auto_2877 ) ) ( not ( = ?auto_2875 ?auto_2897 ) ) ( not ( = ?auto_2877 ?auto_2898 ) ) ( not ( = ?auto_2877 ?auto_2889 ) ) ( not ( = ?auto_2877 ?auto_2894 ) ) ( not ( = ?auto_2888 ?auto_2893 ) ) ( not ( = ?auto_2888 ?auto_2896 ) ) ( not ( = ?auto_2888 ?auto_2880 ) ) ( not ( = ?auto_2895 ?auto_2892 ) ) ( not ( = ?auto_2895 ?auto_2890 ) ) ( not ( = ?auto_2895 ?auto_2881 ) ) ( not ( = ?auto_2897 ?auto_2898 ) ) ( not ( = ?auto_2897 ?auto_2889 ) ) ( not ( = ?auto_2897 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2878 ) ) ( not ( = ?auto_2873 ?auto_2886 ) ) ( not ( = ?auto_2874 ?auto_2878 ) ) ( not ( = ?auto_2874 ?auto_2886 ) ) ( not ( = ?auto_2875 ?auto_2878 ) ) ( not ( = ?auto_2875 ?auto_2886 ) ) ( not ( = ?auto_2876 ?auto_2878 ) ) ( not ( = ?auto_2876 ?auto_2886 ) ) ( not ( = ?auto_2878 ?auto_2897 ) ) ( not ( = ?auto_2878 ?auto_2898 ) ) ( not ( = ?auto_2878 ?auto_2889 ) ) ( not ( = ?auto_2878 ?auto_2894 ) ) ( not ( = ?auto_2891 ?auto_2888 ) ) ( not ( = ?auto_2891 ?auto_2893 ) ) ( not ( = ?auto_2891 ?auto_2896 ) ) ( not ( = ?auto_2891 ?auto_2880 ) ) ( not ( = ?auto_2887 ?auto_2895 ) ) ( not ( = ?auto_2887 ?auto_2892 ) ) ( not ( = ?auto_2887 ?auto_2890 ) ) ( not ( = ?auto_2887 ?auto_2881 ) ) ( not ( = ?auto_2886 ?auto_2897 ) ) ( not ( = ?auto_2886 ?auto_2898 ) ) ( not ( = ?auto_2886 ?auto_2889 ) ) ( not ( = ?auto_2886 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2879 ) ) ( not ( = ?auto_2873 ?auto_2882 ) ) ( not ( = ?auto_2874 ?auto_2879 ) ) ( not ( = ?auto_2874 ?auto_2882 ) ) ( not ( = ?auto_2875 ?auto_2879 ) ) ( not ( = ?auto_2875 ?auto_2882 ) ) ( not ( = ?auto_2876 ?auto_2879 ) ) ( not ( = ?auto_2876 ?auto_2882 ) ) ( not ( = ?auto_2877 ?auto_2879 ) ) ( not ( = ?auto_2877 ?auto_2882 ) ) ( not ( = ?auto_2879 ?auto_2886 ) ) ( not ( = ?auto_2879 ?auto_2897 ) ) ( not ( = ?auto_2879 ?auto_2898 ) ) ( not ( = ?auto_2879 ?auto_2889 ) ) ( not ( = ?auto_2879 ?auto_2894 ) ) ( not ( = ?auto_2882 ?auto_2886 ) ) ( not ( = ?auto_2882 ?auto_2897 ) ) ( not ( = ?auto_2882 ?auto_2898 ) ) ( not ( = ?auto_2882 ?auto_2889 ) ) ( not ( = ?auto_2882 ?auto_2894 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2873 ?auto_2874 ?auto_2875 ?auto_2876 ?auto_2877 ?auto_2878 )
      ( MAKE-1CRATE ?auto_2878 ?auto_2879 )
      ( MAKE-6CRATE-VERIFY ?auto_2873 ?auto_2874 ?auto_2875 ?auto_2876 ?auto_2877 ?auto_2878 ?auto_2879 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2917 - SURFACE
      ?auto_2918 - SURFACE
      ?auto_2919 - SURFACE
      ?auto_2920 - SURFACE
      ?auto_2921 - SURFACE
      ?auto_2922 - SURFACE
      ?auto_2923 - SURFACE
      ?auto_2924 - SURFACE
    )
    :vars
    (
      ?auto_2926 - HOIST
      ?auto_2929 - PLACE
      ?auto_2930 - PLACE
      ?auto_2928 - HOIST
      ?auto_2927 - SURFACE
      ?auto_2940 - PLACE
      ?auto_2931 - HOIST
      ?auto_2941 - SURFACE
      ?auto_2934 - PLACE
      ?auto_2936 - HOIST
      ?auto_2932 - SURFACE
      ?auto_2938 - PLACE
      ?auto_2937 - HOIST
      ?auto_2944 - SURFACE
      ?auto_2935 - PLACE
      ?auto_2943 - HOIST
      ?auto_2939 - SURFACE
      ?auto_2946 - PLACE
      ?auto_2933 - HOIST
      ?auto_2942 - SURFACE
      ?auto_2945 - SURFACE
      ?auto_2925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2926 ?auto_2929 ) ( IS-CRATE ?auto_2924 ) ( not ( = ?auto_2930 ?auto_2929 ) ) ( HOIST-AT ?auto_2928 ?auto_2930 ) ( AVAILABLE ?auto_2928 ) ( SURFACE-AT ?auto_2924 ?auto_2930 ) ( ON ?auto_2924 ?auto_2927 ) ( CLEAR ?auto_2924 ) ( not ( = ?auto_2923 ?auto_2924 ) ) ( not ( = ?auto_2923 ?auto_2927 ) ) ( not ( = ?auto_2924 ?auto_2927 ) ) ( not ( = ?auto_2926 ?auto_2928 ) ) ( IS-CRATE ?auto_2923 ) ( not ( = ?auto_2940 ?auto_2929 ) ) ( HOIST-AT ?auto_2931 ?auto_2940 ) ( SURFACE-AT ?auto_2923 ?auto_2940 ) ( ON ?auto_2923 ?auto_2941 ) ( CLEAR ?auto_2923 ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2922 ?auto_2941 ) ) ( not ( = ?auto_2923 ?auto_2941 ) ) ( not ( = ?auto_2926 ?auto_2931 ) ) ( IS-CRATE ?auto_2922 ) ( not ( = ?auto_2934 ?auto_2929 ) ) ( HOIST-AT ?auto_2936 ?auto_2934 ) ( AVAILABLE ?auto_2936 ) ( SURFACE-AT ?auto_2922 ?auto_2934 ) ( ON ?auto_2922 ?auto_2932 ) ( CLEAR ?auto_2922 ) ( not ( = ?auto_2921 ?auto_2922 ) ) ( not ( = ?auto_2921 ?auto_2932 ) ) ( not ( = ?auto_2922 ?auto_2932 ) ) ( not ( = ?auto_2926 ?auto_2936 ) ) ( IS-CRATE ?auto_2921 ) ( not ( = ?auto_2938 ?auto_2929 ) ) ( HOIST-AT ?auto_2937 ?auto_2938 ) ( AVAILABLE ?auto_2937 ) ( SURFACE-AT ?auto_2921 ?auto_2938 ) ( ON ?auto_2921 ?auto_2944 ) ( CLEAR ?auto_2921 ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( not ( = ?auto_2920 ?auto_2944 ) ) ( not ( = ?auto_2921 ?auto_2944 ) ) ( not ( = ?auto_2926 ?auto_2937 ) ) ( IS-CRATE ?auto_2920 ) ( not ( = ?auto_2935 ?auto_2929 ) ) ( HOIST-AT ?auto_2943 ?auto_2935 ) ( AVAILABLE ?auto_2943 ) ( SURFACE-AT ?auto_2920 ?auto_2935 ) ( ON ?auto_2920 ?auto_2939 ) ( CLEAR ?auto_2920 ) ( not ( = ?auto_2919 ?auto_2920 ) ) ( not ( = ?auto_2919 ?auto_2939 ) ) ( not ( = ?auto_2920 ?auto_2939 ) ) ( not ( = ?auto_2926 ?auto_2943 ) ) ( IS-CRATE ?auto_2919 ) ( not ( = ?auto_2946 ?auto_2929 ) ) ( HOIST-AT ?auto_2933 ?auto_2946 ) ( AVAILABLE ?auto_2933 ) ( SURFACE-AT ?auto_2919 ?auto_2946 ) ( ON ?auto_2919 ?auto_2942 ) ( CLEAR ?auto_2919 ) ( not ( = ?auto_2918 ?auto_2919 ) ) ( not ( = ?auto_2918 ?auto_2942 ) ) ( not ( = ?auto_2919 ?auto_2942 ) ) ( not ( = ?auto_2926 ?auto_2933 ) ) ( SURFACE-AT ?auto_2917 ?auto_2929 ) ( CLEAR ?auto_2917 ) ( IS-CRATE ?auto_2918 ) ( AVAILABLE ?auto_2926 ) ( AVAILABLE ?auto_2931 ) ( SURFACE-AT ?auto_2918 ?auto_2940 ) ( ON ?auto_2918 ?auto_2945 ) ( CLEAR ?auto_2918 ) ( TRUCK-AT ?auto_2925 ?auto_2929 ) ( not ( = ?auto_2917 ?auto_2918 ) ) ( not ( = ?auto_2917 ?auto_2945 ) ) ( not ( = ?auto_2918 ?auto_2945 ) ) ( not ( = ?auto_2917 ?auto_2919 ) ) ( not ( = ?auto_2917 ?auto_2942 ) ) ( not ( = ?auto_2919 ?auto_2945 ) ) ( not ( = ?auto_2946 ?auto_2940 ) ) ( not ( = ?auto_2933 ?auto_2931 ) ) ( not ( = ?auto_2942 ?auto_2945 ) ) ( not ( = ?auto_2917 ?auto_2920 ) ) ( not ( = ?auto_2917 ?auto_2939 ) ) ( not ( = ?auto_2918 ?auto_2920 ) ) ( not ( = ?auto_2918 ?auto_2939 ) ) ( not ( = ?auto_2920 ?auto_2942 ) ) ( not ( = ?auto_2920 ?auto_2945 ) ) ( not ( = ?auto_2935 ?auto_2946 ) ) ( not ( = ?auto_2935 ?auto_2940 ) ) ( not ( = ?auto_2943 ?auto_2933 ) ) ( not ( = ?auto_2943 ?auto_2931 ) ) ( not ( = ?auto_2939 ?auto_2942 ) ) ( not ( = ?auto_2939 ?auto_2945 ) ) ( not ( = ?auto_2917 ?auto_2921 ) ) ( not ( = ?auto_2917 ?auto_2944 ) ) ( not ( = ?auto_2918 ?auto_2921 ) ) ( not ( = ?auto_2918 ?auto_2944 ) ) ( not ( = ?auto_2919 ?auto_2921 ) ) ( not ( = ?auto_2919 ?auto_2944 ) ) ( not ( = ?auto_2921 ?auto_2939 ) ) ( not ( = ?auto_2921 ?auto_2942 ) ) ( not ( = ?auto_2921 ?auto_2945 ) ) ( not ( = ?auto_2938 ?auto_2935 ) ) ( not ( = ?auto_2938 ?auto_2946 ) ) ( not ( = ?auto_2938 ?auto_2940 ) ) ( not ( = ?auto_2937 ?auto_2943 ) ) ( not ( = ?auto_2937 ?auto_2933 ) ) ( not ( = ?auto_2937 ?auto_2931 ) ) ( not ( = ?auto_2944 ?auto_2939 ) ) ( not ( = ?auto_2944 ?auto_2942 ) ) ( not ( = ?auto_2944 ?auto_2945 ) ) ( not ( = ?auto_2917 ?auto_2922 ) ) ( not ( = ?auto_2917 ?auto_2932 ) ) ( not ( = ?auto_2918 ?auto_2922 ) ) ( not ( = ?auto_2918 ?auto_2932 ) ) ( not ( = ?auto_2919 ?auto_2922 ) ) ( not ( = ?auto_2919 ?auto_2932 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2932 ) ) ( not ( = ?auto_2922 ?auto_2944 ) ) ( not ( = ?auto_2922 ?auto_2939 ) ) ( not ( = ?auto_2922 ?auto_2942 ) ) ( not ( = ?auto_2922 ?auto_2945 ) ) ( not ( = ?auto_2934 ?auto_2938 ) ) ( not ( = ?auto_2934 ?auto_2935 ) ) ( not ( = ?auto_2934 ?auto_2946 ) ) ( not ( = ?auto_2934 ?auto_2940 ) ) ( not ( = ?auto_2936 ?auto_2937 ) ) ( not ( = ?auto_2936 ?auto_2943 ) ) ( not ( = ?auto_2936 ?auto_2933 ) ) ( not ( = ?auto_2936 ?auto_2931 ) ) ( not ( = ?auto_2932 ?auto_2944 ) ) ( not ( = ?auto_2932 ?auto_2939 ) ) ( not ( = ?auto_2932 ?auto_2942 ) ) ( not ( = ?auto_2932 ?auto_2945 ) ) ( not ( = ?auto_2917 ?auto_2923 ) ) ( not ( = ?auto_2917 ?auto_2941 ) ) ( not ( = ?auto_2918 ?auto_2923 ) ) ( not ( = ?auto_2918 ?auto_2941 ) ) ( not ( = ?auto_2919 ?auto_2923 ) ) ( not ( = ?auto_2919 ?auto_2941 ) ) ( not ( = ?auto_2920 ?auto_2923 ) ) ( not ( = ?auto_2920 ?auto_2941 ) ) ( not ( = ?auto_2921 ?auto_2923 ) ) ( not ( = ?auto_2921 ?auto_2941 ) ) ( not ( = ?auto_2923 ?auto_2932 ) ) ( not ( = ?auto_2923 ?auto_2944 ) ) ( not ( = ?auto_2923 ?auto_2939 ) ) ( not ( = ?auto_2923 ?auto_2942 ) ) ( not ( = ?auto_2923 ?auto_2945 ) ) ( not ( = ?auto_2941 ?auto_2932 ) ) ( not ( = ?auto_2941 ?auto_2944 ) ) ( not ( = ?auto_2941 ?auto_2939 ) ) ( not ( = ?auto_2941 ?auto_2942 ) ) ( not ( = ?auto_2941 ?auto_2945 ) ) ( not ( = ?auto_2917 ?auto_2924 ) ) ( not ( = ?auto_2917 ?auto_2927 ) ) ( not ( = ?auto_2918 ?auto_2924 ) ) ( not ( = ?auto_2918 ?auto_2927 ) ) ( not ( = ?auto_2919 ?auto_2924 ) ) ( not ( = ?auto_2919 ?auto_2927 ) ) ( not ( = ?auto_2920 ?auto_2924 ) ) ( not ( = ?auto_2920 ?auto_2927 ) ) ( not ( = ?auto_2921 ?auto_2924 ) ) ( not ( = ?auto_2921 ?auto_2927 ) ) ( not ( = ?auto_2922 ?auto_2924 ) ) ( not ( = ?auto_2922 ?auto_2927 ) ) ( not ( = ?auto_2924 ?auto_2941 ) ) ( not ( = ?auto_2924 ?auto_2932 ) ) ( not ( = ?auto_2924 ?auto_2944 ) ) ( not ( = ?auto_2924 ?auto_2939 ) ) ( not ( = ?auto_2924 ?auto_2942 ) ) ( not ( = ?auto_2924 ?auto_2945 ) ) ( not ( = ?auto_2930 ?auto_2940 ) ) ( not ( = ?auto_2930 ?auto_2934 ) ) ( not ( = ?auto_2930 ?auto_2938 ) ) ( not ( = ?auto_2930 ?auto_2935 ) ) ( not ( = ?auto_2930 ?auto_2946 ) ) ( not ( = ?auto_2928 ?auto_2931 ) ) ( not ( = ?auto_2928 ?auto_2936 ) ) ( not ( = ?auto_2928 ?auto_2937 ) ) ( not ( = ?auto_2928 ?auto_2943 ) ) ( not ( = ?auto_2928 ?auto_2933 ) ) ( not ( = ?auto_2927 ?auto_2941 ) ) ( not ( = ?auto_2927 ?auto_2932 ) ) ( not ( = ?auto_2927 ?auto_2944 ) ) ( not ( = ?auto_2927 ?auto_2939 ) ) ( not ( = ?auto_2927 ?auto_2942 ) ) ( not ( = ?auto_2927 ?auto_2945 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2917 ?auto_2918 ?auto_2919 ?auto_2920 ?auto_2921 ?auto_2922 ?auto_2923 )
      ( MAKE-1CRATE ?auto_2923 ?auto_2924 )
      ( MAKE-7CRATE-VERIFY ?auto_2917 ?auto_2918 ?auto_2919 ?auto_2920 ?auto_2921 ?auto_2922 ?auto_2923 ?auto_2924 ) )
  )

)

