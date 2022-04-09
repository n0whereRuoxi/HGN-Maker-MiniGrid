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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2728 - SURFACE
      ?auto_2729 - SURFACE
    )
    :vars
    (
      ?auto_2730 - HOIST
      ?auto_2731 - PLACE
      ?auto_2733 - PLACE
      ?auto_2734 - HOIST
      ?auto_2735 - SURFACE
      ?auto_2732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2730 ?auto_2731 ) ( SURFACE-AT ?auto_2728 ?auto_2731 ) ( CLEAR ?auto_2728 ) ( IS-CRATE ?auto_2729 ) ( AVAILABLE ?auto_2730 ) ( not ( = ?auto_2733 ?auto_2731 ) ) ( HOIST-AT ?auto_2734 ?auto_2733 ) ( AVAILABLE ?auto_2734 ) ( SURFACE-AT ?auto_2729 ?auto_2733 ) ( ON ?auto_2729 ?auto_2735 ) ( CLEAR ?auto_2729 ) ( TRUCK-AT ?auto_2732 ?auto_2731 ) ( not ( = ?auto_2728 ?auto_2729 ) ) ( not ( = ?auto_2728 ?auto_2735 ) ) ( not ( = ?auto_2729 ?auto_2735 ) ) ( not ( = ?auto_2730 ?auto_2734 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2732 ?auto_2731 ?auto_2733 )
      ( !LIFT ?auto_2734 ?auto_2729 ?auto_2735 ?auto_2733 )
      ( !LOAD ?auto_2734 ?auto_2729 ?auto_2732 ?auto_2733 )
      ( !DRIVE ?auto_2732 ?auto_2733 ?auto_2731 )
      ( !UNLOAD ?auto_2730 ?auto_2729 ?auto_2732 ?auto_2731 )
      ( !DROP ?auto_2730 ?auto_2729 ?auto_2728 ?auto_2731 )
      ( MAKE-1CRATE-VERIFY ?auto_2728 ?auto_2729 ) )
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
      ?auto_2746 - HOIST
      ?auto_2745 - PLACE
      ?auto_2743 - PLACE
      ?auto_2744 - HOIST
      ?auto_2742 - SURFACE
      ?auto_2748 - PLACE
      ?auto_2750 - HOIST
      ?auto_2749 - SURFACE
      ?auto_2747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2746 ?auto_2745 ) ( IS-CRATE ?auto_2741 ) ( not ( = ?auto_2743 ?auto_2745 ) ) ( HOIST-AT ?auto_2744 ?auto_2743 ) ( AVAILABLE ?auto_2744 ) ( SURFACE-AT ?auto_2741 ?auto_2743 ) ( ON ?auto_2741 ?auto_2742 ) ( CLEAR ?auto_2741 ) ( not ( = ?auto_2740 ?auto_2741 ) ) ( not ( = ?auto_2740 ?auto_2742 ) ) ( not ( = ?auto_2741 ?auto_2742 ) ) ( not ( = ?auto_2746 ?auto_2744 ) ) ( SURFACE-AT ?auto_2739 ?auto_2745 ) ( CLEAR ?auto_2739 ) ( IS-CRATE ?auto_2740 ) ( AVAILABLE ?auto_2746 ) ( not ( = ?auto_2748 ?auto_2745 ) ) ( HOIST-AT ?auto_2750 ?auto_2748 ) ( AVAILABLE ?auto_2750 ) ( SURFACE-AT ?auto_2740 ?auto_2748 ) ( ON ?auto_2740 ?auto_2749 ) ( CLEAR ?auto_2740 ) ( TRUCK-AT ?auto_2747 ?auto_2745 ) ( not ( = ?auto_2739 ?auto_2740 ) ) ( not ( = ?auto_2739 ?auto_2749 ) ) ( not ( = ?auto_2740 ?auto_2749 ) ) ( not ( = ?auto_2746 ?auto_2750 ) ) ( not ( = ?auto_2739 ?auto_2741 ) ) ( not ( = ?auto_2739 ?auto_2742 ) ) ( not ( = ?auto_2741 ?auto_2749 ) ) ( not ( = ?auto_2743 ?auto_2748 ) ) ( not ( = ?auto_2744 ?auto_2750 ) ) ( not ( = ?auto_2742 ?auto_2749 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2739 ?auto_2740 )
      ( MAKE-1CRATE ?auto_2740 ?auto_2741 )
      ( MAKE-2CRATE-VERIFY ?auto_2739 ?auto_2740 ?auto_2741 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2753 - SURFACE
      ?auto_2754 - SURFACE
    )
    :vars
    (
      ?auto_2755 - HOIST
      ?auto_2756 - PLACE
      ?auto_2758 - PLACE
      ?auto_2759 - HOIST
      ?auto_2760 - SURFACE
      ?auto_2757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2755 ?auto_2756 ) ( SURFACE-AT ?auto_2753 ?auto_2756 ) ( CLEAR ?auto_2753 ) ( IS-CRATE ?auto_2754 ) ( AVAILABLE ?auto_2755 ) ( not ( = ?auto_2758 ?auto_2756 ) ) ( HOIST-AT ?auto_2759 ?auto_2758 ) ( AVAILABLE ?auto_2759 ) ( SURFACE-AT ?auto_2754 ?auto_2758 ) ( ON ?auto_2754 ?auto_2760 ) ( CLEAR ?auto_2754 ) ( TRUCK-AT ?auto_2757 ?auto_2756 ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( not ( = ?auto_2753 ?auto_2760 ) ) ( not ( = ?auto_2754 ?auto_2760 ) ) ( not ( = ?auto_2755 ?auto_2759 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2757 ?auto_2756 ?auto_2758 )
      ( !LIFT ?auto_2759 ?auto_2754 ?auto_2760 ?auto_2758 )
      ( !LOAD ?auto_2759 ?auto_2754 ?auto_2757 ?auto_2758 )
      ( !DRIVE ?auto_2757 ?auto_2758 ?auto_2756 )
      ( !UNLOAD ?auto_2755 ?auto_2754 ?auto_2757 ?auto_2756 )
      ( !DROP ?auto_2755 ?auto_2754 ?auto_2753 ?auto_2756 )
      ( MAKE-1CRATE-VERIFY ?auto_2753 ?auto_2754 ) )
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
      ?auto_2771 - HOIST
      ?auto_2774 - PLACE
      ?auto_2770 - PLACE
      ?auto_2773 - HOIST
      ?auto_2769 - SURFACE
      ?auto_2779 - PLACE
      ?auto_2778 - HOIST
      ?auto_2780 - SURFACE
      ?auto_2777 - PLACE
      ?auto_2775 - HOIST
      ?auto_2776 - SURFACE
      ?auto_2772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2771 ?auto_2774 ) ( IS-CRATE ?auto_2768 ) ( not ( = ?auto_2770 ?auto_2774 ) ) ( HOIST-AT ?auto_2773 ?auto_2770 ) ( AVAILABLE ?auto_2773 ) ( SURFACE-AT ?auto_2768 ?auto_2770 ) ( ON ?auto_2768 ?auto_2769 ) ( CLEAR ?auto_2768 ) ( not ( = ?auto_2767 ?auto_2768 ) ) ( not ( = ?auto_2767 ?auto_2769 ) ) ( not ( = ?auto_2768 ?auto_2769 ) ) ( not ( = ?auto_2771 ?auto_2773 ) ) ( IS-CRATE ?auto_2767 ) ( not ( = ?auto_2779 ?auto_2774 ) ) ( HOIST-AT ?auto_2778 ?auto_2779 ) ( AVAILABLE ?auto_2778 ) ( SURFACE-AT ?auto_2767 ?auto_2779 ) ( ON ?auto_2767 ?auto_2780 ) ( CLEAR ?auto_2767 ) ( not ( = ?auto_2766 ?auto_2767 ) ) ( not ( = ?auto_2766 ?auto_2780 ) ) ( not ( = ?auto_2767 ?auto_2780 ) ) ( not ( = ?auto_2771 ?auto_2778 ) ) ( SURFACE-AT ?auto_2765 ?auto_2774 ) ( CLEAR ?auto_2765 ) ( IS-CRATE ?auto_2766 ) ( AVAILABLE ?auto_2771 ) ( not ( = ?auto_2777 ?auto_2774 ) ) ( HOIST-AT ?auto_2775 ?auto_2777 ) ( AVAILABLE ?auto_2775 ) ( SURFACE-AT ?auto_2766 ?auto_2777 ) ( ON ?auto_2766 ?auto_2776 ) ( CLEAR ?auto_2766 ) ( TRUCK-AT ?auto_2772 ?auto_2774 ) ( not ( = ?auto_2765 ?auto_2766 ) ) ( not ( = ?auto_2765 ?auto_2776 ) ) ( not ( = ?auto_2766 ?auto_2776 ) ) ( not ( = ?auto_2771 ?auto_2775 ) ) ( not ( = ?auto_2765 ?auto_2767 ) ) ( not ( = ?auto_2765 ?auto_2780 ) ) ( not ( = ?auto_2767 ?auto_2776 ) ) ( not ( = ?auto_2779 ?auto_2777 ) ) ( not ( = ?auto_2778 ?auto_2775 ) ) ( not ( = ?auto_2780 ?auto_2776 ) ) ( not ( = ?auto_2765 ?auto_2768 ) ) ( not ( = ?auto_2765 ?auto_2769 ) ) ( not ( = ?auto_2766 ?auto_2768 ) ) ( not ( = ?auto_2766 ?auto_2769 ) ) ( not ( = ?auto_2768 ?auto_2780 ) ) ( not ( = ?auto_2768 ?auto_2776 ) ) ( not ( = ?auto_2770 ?auto_2779 ) ) ( not ( = ?auto_2770 ?auto_2777 ) ) ( not ( = ?auto_2773 ?auto_2778 ) ) ( not ( = ?auto_2773 ?auto_2775 ) ) ( not ( = ?auto_2769 ?auto_2780 ) ) ( not ( = ?auto_2769 ?auto_2776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2765 ?auto_2766 ?auto_2767 )
      ( MAKE-1CRATE ?auto_2767 ?auto_2768 )
      ( MAKE-3CRATE-VERIFY ?auto_2765 ?auto_2766 ?auto_2767 ?auto_2768 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2783 - SURFACE
      ?auto_2784 - SURFACE
    )
    :vars
    (
      ?auto_2785 - HOIST
      ?auto_2786 - PLACE
      ?auto_2788 - PLACE
      ?auto_2789 - HOIST
      ?auto_2790 - SURFACE
      ?auto_2787 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2785 ?auto_2786 ) ( SURFACE-AT ?auto_2783 ?auto_2786 ) ( CLEAR ?auto_2783 ) ( IS-CRATE ?auto_2784 ) ( AVAILABLE ?auto_2785 ) ( not ( = ?auto_2788 ?auto_2786 ) ) ( HOIST-AT ?auto_2789 ?auto_2788 ) ( AVAILABLE ?auto_2789 ) ( SURFACE-AT ?auto_2784 ?auto_2788 ) ( ON ?auto_2784 ?auto_2790 ) ( CLEAR ?auto_2784 ) ( TRUCK-AT ?auto_2787 ?auto_2786 ) ( not ( = ?auto_2783 ?auto_2784 ) ) ( not ( = ?auto_2783 ?auto_2790 ) ) ( not ( = ?auto_2784 ?auto_2790 ) ) ( not ( = ?auto_2785 ?auto_2789 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2787 ?auto_2786 ?auto_2788 )
      ( !LIFT ?auto_2789 ?auto_2784 ?auto_2790 ?auto_2788 )
      ( !LOAD ?auto_2789 ?auto_2784 ?auto_2787 ?auto_2788 )
      ( !DRIVE ?auto_2787 ?auto_2788 ?auto_2786 )
      ( !UNLOAD ?auto_2785 ?auto_2784 ?auto_2787 ?auto_2786 )
      ( !DROP ?auto_2785 ?auto_2784 ?auto_2783 ?auto_2786 )
      ( MAKE-1CRATE-VERIFY ?auto_2783 ?auto_2784 ) )
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
      ?auto_2806 - HOIST
      ?auto_2801 - PLACE
      ?auto_2805 - PLACE
      ?auto_2804 - HOIST
      ?auto_2802 - SURFACE
      ?auto_2808 - PLACE
      ?auto_2812 - HOIST
      ?auto_2807 - SURFACE
      ?auto_2811 - PLACE
      ?auto_2813 - HOIST
      ?auto_2809 - SURFACE
      ?auto_2810 - PLACE
      ?auto_2814 - HOIST
      ?auto_2815 - SURFACE
      ?auto_2803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2806 ?auto_2801 ) ( IS-CRATE ?auto_2800 ) ( not ( = ?auto_2805 ?auto_2801 ) ) ( HOIST-AT ?auto_2804 ?auto_2805 ) ( AVAILABLE ?auto_2804 ) ( SURFACE-AT ?auto_2800 ?auto_2805 ) ( ON ?auto_2800 ?auto_2802 ) ( CLEAR ?auto_2800 ) ( not ( = ?auto_2799 ?auto_2800 ) ) ( not ( = ?auto_2799 ?auto_2802 ) ) ( not ( = ?auto_2800 ?auto_2802 ) ) ( not ( = ?auto_2806 ?auto_2804 ) ) ( IS-CRATE ?auto_2799 ) ( not ( = ?auto_2808 ?auto_2801 ) ) ( HOIST-AT ?auto_2812 ?auto_2808 ) ( AVAILABLE ?auto_2812 ) ( SURFACE-AT ?auto_2799 ?auto_2808 ) ( ON ?auto_2799 ?auto_2807 ) ( CLEAR ?auto_2799 ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( not ( = ?auto_2798 ?auto_2807 ) ) ( not ( = ?auto_2799 ?auto_2807 ) ) ( not ( = ?auto_2806 ?auto_2812 ) ) ( IS-CRATE ?auto_2798 ) ( not ( = ?auto_2811 ?auto_2801 ) ) ( HOIST-AT ?auto_2813 ?auto_2811 ) ( AVAILABLE ?auto_2813 ) ( SURFACE-AT ?auto_2798 ?auto_2811 ) ( ON ?auto_2798 ?auto_2809 ) ( CLEAR ?auto_2798 ) ( not ( = ?auto_2797 ?auto_2798 ) ) ( not ( = ?auto_2797 ?auto_2809 ) ) ( not ( = ?auto_2798 ?auto_2809 ) ) ( not ( = ?auto_2806 ?auto_2813 ) ) ( SURFACE-AT ?auto_2796 ?auto_2801 ) ( CLEAR ?auto_2796 ) ( IS-CRATE ?auto_2797 ) ( AVAILABLE ?auto_2806 ) ( not ( = ?auto_2810 ?auto_2801 ) ) ( HOIST-AT ?auto_2814 ?auto_2810 ) ( AVAILABLE ?auto_2814 ) ( SURFACE-AT ?auto_2797 ?auto_2810 ) ( ON ?auto_2797 ?auto_2815 ) ( CLEAR ?auto_2797 ) ( TRUCK-AT ?auto_2803 ?auto_2801 ) ( not ( = ?auto_2796 ?auto_2797 ) ) ( not ( = ?auto_2796 ?auto_2815 ) ) ( not ( = ?auto_2797 ?auto_2815 ) ) ( not ( = ?auto_2806 ?auto_2814 ) ) ( not ( = ?auto_2796 ?auto_2798 ) ) ( not ( = ?auto_2796 ?auto_2809 ) ) ( not ( = ?auto_2798 ?auto_2815 ) ) ( not ( = ?auto_2811 ?auto_2810 ) ) ( not ( = ?auto_2813 ?auto_2814 ) ) ( not ( = ?auto_2809 ?auto_2815 ) ) ( not ( = ?auto_2796 ?auto_2799 ) ) ( not ( = ?auto_2796 ?auto_2807 ) ) ( not ( = ?auto_2797 ?auto_2799 ) ) ( not ( = ?auto_2797 ?auto_2807 ) ) ( not ( = ?auto_2799 ?auto_2809 ) ) ( not ( = ?auto_2799 ?auto_2815 ) ) ( not ( = ?auto_2808 ?auto_2811 ) ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( not ( = ?auto_2812 ?auto_2813 ) ) ( not ( = ?auto_2812 ?auto_2814 ) ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( not ( = ?auto_2807 ?auto_2815 ) ) ( not ( = ?auto_2796 ?auto_2800 ) ) ( not ( = ?auto_2796 ?auto_2802 ) ) ( not ( = ?auto_2797 ?auto_2800 ) ) ( not ( = ?auto_2797 ?auto_2802 ) ) ( not ( = ?auto_2798 ?auto_2800 ) ) ( not ( = ?auto_2798 ?auto_2802 ) ) ( not ( = ?auto_2800 ?auto_2807 ) ) ( not ( = ?auto_2800 ?auto_2809 ) ) ( not ( = ?auto_2800 ?auto_2815 ) ) ( not ( = ?auto_2805 ?auto_2808 ) ) ( not ( = ?auto_2805 ?auto_2811 ) ) ( not ( = ?auto_2805 ?auto_2810 ) ) ( not ( = ?auto_2804 ?auto_2812 ) ) ( not ( = ?auto_2804 ?auto_2813 ) ) ( not ( = ?auto_2804 ?auto_2814 ) ) ( not ( = ?auto_2802 ?auto_2807 ) ) ( not ( = ?auto_2802 ?auto_2809 ) ) ( not ( = ?auto_2802 ?auto_2815 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2796 ?auto_2797 ?auto_2798 ?auto_2799 )
      ( MAKE-1CRATE ?auto_2799 ?auto_2800 )
      ( MAKE-4CRATE-VERIFY ?auto_2796 ?auto_2797 ?auto_2798 ?auto_2799 ?auto_2800 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2818 - SURFACE
      ?auto_2819 - SURFACE
    )
    :vars
    (
      ?auto_2820 - HOIST
      ?auto_2821 - PLACE
      ?auto_2823 - PLACE
      ?auto_2824 - HOIST
      ?auto_2825 - SURFACE
      ?auto_2822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2820 ?auto_2821 ) ( SURFACE-AT ?auto_2818 ?auto_2821 ) ( CLEAR ?auto_2818 ) ( IS-CRATE ?auto_2819 ) ( AVAILABLE ?auto_2820 ) ( not ( = ?auto_2823 ?auto_2821 ) ) ( HOIST-AT ?auto_2824 ?auto_2823 ) ( AVAILABLE ?auto_2824 ) ( SURFACE-AT ?auto_2819 ?auto_2823 ) ( ON ?auto_2819 ?auto_2825 ) ( CLEAR ?auto_2819 ) ( TRUCK-AT ?auto_2822 ?auto_2821 ) ( not ( = ?auto_2818 ?auto_2819 ) ) ( not ( = ?auto_2818 ?auto_2825 ) ) ( not ( = ?auto_2819 ?auto_2825 ) ) ( not ( = ?auto_2820 ?auto_2824 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2822 ?auto_2821 ?auto_2823 )
      ( !LIFT ?auto_2824 ?auto_2819 ?auto_2825 ?auto_2823 )
      ( !LOAD ?auto_2824 ?auto_2819 ?auto_2822 ?auto_2823 )
      ( !DRIVE ?auto_2822 ?auto_2823 ?auto_2821 )
      ( !UNLOAD ?auto_2820 ?auto_2819 ?auto_2822 ?auto_2821 )
      ( !DROP ?auto_2820 ?auto_2819 ?auto_2818 ?auto_2821 )
      ( MAKE-1CRATE-VERIFY ?auto_2818 ?auto_2819 ) )
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
      ?auto_2839 - HOIST
      ?auto_2841 - PLACE
      ?auto_2840 - PLACE
      ?auto_2842 - HOIST
      ?auto_2838 - SURFACE
      ?auto_2845 - PLACE
      ?auto_2855 - HOIST
      ?auto_2850 - SURFACE
      ?auto_2853 - PLACE
      ?auto_2852 - HOIST
      ?auto_2848 - SURFACE
      ?auto_2851 - PLACE
      ?auto_2849 - HOIST
      ?auto_2847 - SURFACE
      ?auto_2854 - PLACE
      ?auto_2844 - HOIST
      ?auto_2846 - SURFACE
      ?auto_2843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2839 ?auto_2841 ) ( IS-CRATE ?auto_2837 ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( HOIST-AT ?auto_2842 ?auto_2840 ) ( AVAILABLE ?auto_2842 ) ( SURFACE-AT ?auto_2837 ?auto_2840 ) ( ON ?auto_2837 ?auto_2838 ) ( CLEAR ?auto_2837 ) ( not ( = ?auto_2836 ?auto_2837 ) ) ( not ( = ?auto_2836 ?auto_2838 ) ) ( not ( = ?auto_2837 ?auto_2838 ) ) ( not ( = ?auto_2839 ?auto_2842 ) ) ( IS-CRATE ?auto_2836 ) ( not ( = ?auto_2845 ?auto_2841 ) ) ( HOIST-AT ?auto_2855 ?auto_2845 ) ( AVAILABLE ?auto_2855 ) ( SURFACE-AT ?auto_2836 ?auto_2845 ) ( ON ?auto_2836 ?auto_2850 ) ( CLEAR ?auto_2836 ) ( not ( = ?auto_2835 ?auto_2836 ) ) ( not ( = ?auto_2835 ?auto_2850 ) ) ( not ( = ?auto_2836 ?auto_2850 ) ) ( not ( = ?auto_2839 ?auto_2855 ) ) ( IS-CRATE ?auto_2835 ) ( not ( = ?auto_2853 ?auto_2841 ) ) ( HOIST-AT ?auto_2852 ?auto_2853 ) ( AVAILABLE ?auto_2852 ) ( SURFACE-AT ?auto_2835 ?auto_2853 ) ( ON ?auto_2835 ?auto_2848 ) ( CLEAR ?auto_2835 ) ( not ( = ?auto_2834 ?auto_2835 ) ) ( not ( = ?auto_2834 ?auto_2848 ) ) ( not ( = ?auto_2835 ?auto_2848 ) ) ( not ( = ?auto_2839 ?auto_2852 ) ) ( IS-CRATE ?auto_2834 ) ( not ( = ?auto_2851 ?auto_2841 ) ) ( HOIST-AT ?auto_2849 ?auto_2851 ) ( AVAILABLE ?auto_2849 ) ( SURFACE-AT ?auto_2834 ?auto_2851 ) ( ON ?auto_2834 ?auto_2847 ) ( CLEAR ?auto_2834 ) ( not ( = ?auto_2833 ?auto_2834 ) ) ( not ( = ?auto_2833 ?auto_2847 ) ) ( not ( = ?auto_2834 ?auto_2847 ) ) ( not ( = ?auto_2839 ?auto_2849 ) ) ( SURFACE-AT ?auto_2832 ?auto_2841 ) ( CLEAR ?auto_2832 ) ( IS-CRATE ?auto_2833 ) ( AVAILABLE ?auto_2839 ) ( not ( = ?auto_2854 ?auto_2841 ) ) ( HOIST-AT ?auto_2844 ?auto_2854 ) ( AVAILABLE ?auto_2844 ) ( SURFACE-AT ?auto_2833 ?auto_2854 ) ( ON ?auto_2833 ?auto_2846 ) ( CLEAR ?auto_2833 ) ( TRUCK-AT ?auto_2843 ?auto_2841 ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( not ( = ?auto_2832 ?auto_2846 ) ) ( not ( = ?auto_2833 ?auto_2846 ) ) ( not ( = ?auto_2839 ?auto_2844 ) ) ( not ( = ?auto_2832 ?auto_2834 ) ) ( not ( = ?auto_2832 ?auto_2847 ) ) ( not ( = ?auto_2834 ?auto_2846 ) ) ( not ( = ?auto_2851 ?auto_2854 ) ) ( not ( = ?auto_2849 ?auto_2844 ) ) ( not ( = ?auto_2847 ?auto_2846 ) ) ( not ( = ?auto_2832 ?auto_2835 ) ) ( not ( = ?auto_2832 ?auto_2848 ) ) ( not ( = ?auto_2833 ?auto_2835 ) ) ( not ( = ?auto_2833 ?auto_2848 ) ) ( not ( = ?auto_2835 ?auto_2847 ) ) ( not ( = ?auto_2835 ?auto_2846 ) ) ( not ( = ?auto_2853 ?auto_2851 ) ) ( not ( = ?auto_2853 ?auto_2854 ) ) ( not ( = ?auto_2852 ?auto_2849 ) ) ( not ( = ?auto_2852 ?auto_2844 ) ) ( not ( = ?auto_2848 ?auto_2847 ) ) ( not ( = ?auto_2848 ?auto_2846 ) ) ( not ( = ?auto_2832 ?auto_2836 ) ) ( not ( = ?auto_2832 ?auto_2850 ) ) ( not ( = ?auto_2833 ?auto_2836 ) ) ( not ( = ?auto_2833 ?auto_2850 ) ) ( not ( = ?auto_2834 ?auto_2836 ) ) ( not ( = ?auto_2834 ?auto_2850 ) ) ( not ( = ?auto_2836 ?auto_2848 ) ) ( not ( = ?auto_2836 ?auto_2847 ) ) ( not ( = ?auto_2836 ?auto_2846 ) ) ( not ( = ?auto_2845 ?auto_2853 ) ) ( not ( = ?auto_2845 ?auto_2851 ) ) ( not ( = ?auto_2845 ?auto_2854 ) ) ( not ( = ?auto_2855 ?auto_2852 ) ) ( not ( = ?auto_2855 ?auto_2849 ) ) ( not ( = ?auto_2855 ?auto_2844 ) ) ( not ( = ?auto_2850 ?auto_2848 ) ) ( not ( = ?auto_2850 ?auto_2847 ) ) ( not ( = ?auto_2850 ?auto_2846 ) ) ( not ( = ?auto_2832 ?auto_2837 ) ) ( not ( = ?auto_2832 ?auto_2838 ) ) ( not ( = ?auto_2833 ?auto_2837 ) ) ( not ( = ?auto_2833 ?auto_2838 ) ) ( not ( = ?auto_2834 ?auto_2837 ) ) ( not ( = ?auto_2834 ?auto_2838 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2835 ?auto_2838 ) ) ( not ( = ?auto_2837 ?auto_2850 ) ) ( not ( = ?auto_2837 ?auto_2848 ) ) ( not ( = ?auto_2837 ?auto_2847 ) ) ( not ( = ?auto_2837 ?auto_2846 ) ) ( not ( = ?auto_2840 ?auto_2845 ) ) ( not ( = ?auto_2840 ?auto_2853 ) ) ( not ( = ?auto_2840 ?auto_2851 ) ) ( not ( = ?auto_2840 ?auto_2854 ) ) ( not ( = ?auto_2842 ?auto_2855 ) ) ( not ( = ?auto_2842 ?auto_2852 ) ) ( not ( = ?auto_2842 ?auto_2849 ) ) ( not ( = ?auto_2842 ?auto_2844 ) ) ( not ( = ?auto_2838 ?auto_2850 ) ) ( not ( = ?auto_2838 ?auto_2848 ) ) ( not ( = ?auto_2838 ?auto_2847 ) ) ( not ( = ?auto_2838 ?auto_2846 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2832 ?auto_2833 ?auto_2834 ?auto_2835 ?auto_2836 )
      ( MAKE-1CRATE ?auto_2836 ?auto_2837 )
      ( MAKE-5CRATE-VERIFY ?auto_2832 ?auto_2833 ?auto_2834 ?auto_2835 ?auto_2836 ?auto_2837 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2858 - SURFACE
      ?auto_2859 - SURFACE
    )
    :vars
    (
      ?auto_2860 - HOIST
      ?auto_2861 - PLACE
      ?auto_2863 - PLACE
      ?auto_2864 - HOIST
      ?auto_2865 - SURFACE
      ?auto_2862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2860 ?auto_2861 ) ( SURFACE-AT ?auto_2858 ?auto_2861 ) ( CLEAR ?auto_2858 ) ( IS-CRATE ?auto_2859 ) ( AVAILABLE ?auto_2860 ) ( not ( = ?auto_2863 ?auto_2861 ) ) ( HOIST-AT ?auto_2864 ?auto_2863 ) ( AVAILABLE ?auto_2864 ) ( SURFACE-AT ?auto_2859 ?auto_2863 ) ( ON ?auto_2859 ?auto_2865 ) ( CLEAR ?auto_2859 ) ( TRUCK-AT ?auto_2862 ?auto_2861 ) ( not ( = ?auto_2858 ?auto_2859 ) ) ( not ( = ?auto_2858 ?auto_2865 ) ) ( not ( = ?auto_2859 ?auto_2865 ) ) ( not ( = ?auto_2860 ?auto_2864 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2862 ?auto_2861 ?auto_2863 )
      ( !LIFT ?auto_2864 ?auto_2859 ?auto_2865 ?auto_2863 )
      ( !LOAD ?auto_2864 ?auto_2859 ?auto_2862 ?auto_2863 )
      ( !DRIVE ?auto_2862 ?auto_2863 ?auto_2861 )
      ( !UNLOAD ?auto_2860 ?auto_2859 ?auto_2862 ?auto_2861 )
      ( !DROP ?auto_2860 ?auto_2859 ?auto_2858 ?auto_2861 )
      ( MAKE-1CRATE-VERIFY ?auto_2858 ?auto_2859 ) )
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
      ?auto_2880 - PLACE
      ?auto_2883 - PLACE
      ?auto_2882 - HOIST
      ?auto_2881 - SURFACE
      ?auto_2889 - PLACE
      ?auto_2891 - HOIST
      ?auto_2890 - SURFACE
      ?auto_2887 - PLACE
      ?auto_2895 - HOIST
      ?auto_2896 - SURFACE
      ?auto_2886 - PLACE
      ?auto_2893 - HOIST
      ?auto_2898 - SURFACE
      ?auto_2892 - PLACE
      ?auto_2897 - HOIST
      ?auto_2888 - SURFACE
      ?auto_2894 - SURFACE
      ?auto_2884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2885 ?auto_2880 ) ( IS-CRATE ?auto_2879 ) ( not ( = ?auto_2883 ?auto_2880 ) ) ( HOIST-AT ?auto_2882 ?auto_2883 ) ( SURFACE-AT ?auto_2879 ?auto_2883 ) ( ON ?auto_2879 ?auto_2881 ) ( CLEAR ?auto_2879 ) ( not ( = ?auto_2878 ?auto_2879 ) ) ( not ( = ?auto_2878 ?auto_2881 ) ) ( not ( = ?auto_2879 ?auto_2881 ) ) ( not ( = ?auto_2885 ?auto_2882 ) ) ( IS-CRATE ?auto_2878 ) ( not ( = ?auto_2889 ?auto_2880 ) ) ( HOIST-AT ?auto_2891 ?auto_2889 ) ( AVAILABLE ?auto_2891 ) ( SURFACE-AT ?auto_2878 ?auto_2889 ) ( ON ?auto_2878 ?auto_2890 ) ( CLEAR ?auto_2878 ) ( not ( = ?auto_2877 ?auto_2878 ) ) ( not ( = ?auto_2877 ?auto_2890 ) ) ( not ( = ?auto_2878 ?auto_2890 ) ) ( not ( = ?auto_2885 ?auto_2891 ) ) ( IS-CRATE ?auto_2877 ) ( not ( = ?auto_2887 ?auto_2880 ) ) ( HOIST-AT ?auto_2895 ?auto_2887 ) ( AVAILABLE ?auto_2895 ) ( SURFACE-AT ?auto_2877 ?auto_2887 ) ( ON ?auto_2877 ?auto_2896 ) ( CLEAR ?auto_2877 ) ( not ( = ?auto_2876 ?auto_2877 ) ) ( not ( = ?auto_2876 ?auto_2896 ) ) ( not ( = ?auto_2877 ?auto_2896 ) ) ( not ( = ?auto_2885 ?auto_2895 ) ) ( IS-CRATE ?auto_2876 ) ( not ( = ?auto_2886 ?auto_2880 ) ) ( HOIST-AT ?auto_2893 ?auto_2886 ) ( AVAILABLE ?auto_2893 ) ( SURFACE-AT ?auto_2876 ?auto_2886 ) ( ON ?auto_2876 ?auto_2898 ) ( CLEAR ?auto_2876 ) ( not ( = ?auto_2875 ?auto_2876 ) ) ( not ( = ?auto_2875 ?auto_2898 ) ) ( not ( = ?auto_2876 ?auto_2898 ) ) ( not ( = ?auto_2885 ?auto_2893 ) ) ( IS-CRATE ?auto_2875 ) ( not ( = ?auto_2892 ?auto_2880 ) ) ( HOIST-AT ?auto_2897 ?auto_2892 ) ( AVAILABLE ?auto_2897 ) ( SURFACE-AT ?auto_2875 ?auto_2892 ) ( ON ?auto_2875 ?auto_2888 ) ( CLEAR ?auto_2875 ) ( not ( = ?auto_2874 ?auto_2875 ) ) ( not ( = ?auto_2874 ?auto_2888 ) ) ( not ( = ?auto_2875 ?auto_2888 ) ) ( not ( = ?auto_2885 ?auto_2897 ) ) ( SURFACE-AT ?auto_2873 ?auto_2880 ) ( CLEAR ?auto_2873 ) ( IS-CRATE ?auto_2874 ) ( AVAILABLE ?auto_2885 ) ( AVAILABLE ?auto_2882 ) ( SURFACE-AT ?auto_2874 ?auto_2883 ) ( ON ?auto_2874 ?auto_2894 ) ( CLEAR ?auto_2874 ) ( TRUCK-AT ?auto_2884 ?auto_2880 ) ( not ( = ?auto_2873 ?auto_2874 ) ) ( not ( = ?auto_2873 ?auto_2894 ) ) ( not ( = ?auto_2874 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2875 ) ) ( not ( = ?auto_2873 ?auto_2888 ) ) ( not ( = ?auto_2875 ?auto_2894 ) ) ( not ( = ?auto_2892 ?auto_2883 ) ) ( not ( = ?auto_2897 ?auto_2882 ) ) ( not ( = ?auto_2888 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2876 ) ) ( not ( = ?auto_2873 ?auto_2898 ) ) ( not ( = ?auto_2874 ?auto_2876 ) ) ( not ( = ?auto_2874 ?auto_2898 ) ) ( not ( = ?auto_2876 ?auto_2888 ) ) ( not ( = ?auto_2876 ?auto_2894 ) ) ( not ( = ?auto_2886 ?auto_2892 ) ) ( not ( = ?auto_2886 ?auto_2883 ) ) ( not ( = ?auto_2893 ?auto_2897 ) ) ( not ( = ?auto_2893 ?auto_2882 ) ) ( not ( = ?auto_2898 ?auto_2888 ) ) ( not ( = ?auto_2898 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2877 ) ) ( not ( = ?auto_2873 ?auto_2896 ) ) ( not ( = ?auto_2874 ?auto_2877 ) ) ( not ( = ?auto_2874 ?auto_2896 ) ) ( not ( = ?auto_2875 ?auto_2877 ) ) ( not ( = ?auto_2875 ?auto_2896 ) ) ( not ( = ?auto_2877 ?auto_2898 ) ) ( not ( = ?auto_2877 ?auto_2888 ) ) ( not ( = ?auto_2877 ?auto_2894 ) ) ( not ( = ?auto_2887 ?auto_2886 ) ) ( not ( = ?auto_2887 ?auto_2892 ) ) ( not ( = ?auto_2887 ?auto_2883 ) ) ( not ( = ?auto_2895 ?auto_2893 ) ) ( not ( = ?auto_2895 ?auto_2897 ) ) ( not ( = ?auto_2895 ?auto_2882 ) ) ( not ( = ?auto_2896 ?auto_2898 ) ) ( not ( = ?auto_2896 ?auto_2888 ) ) ( not ( = ?auto_2896 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2878 ) ) ( not ( = ?auto_2873 ?auto_2890 ) ) ( not ( = ?auto_2874 ?auto_2878 ) ) ( not ( = ?auto_2874 ?auto_2890 ) ) ( not ( = ?auto_2875 ?auto_2878 ) ) ( not ( = ?auto_2875 ?auto_2890 ) ) ( not ( = ?auto_2876 ?auto_2878 ) ) ( not ( = ?auto_2876 ?auto_2890 ) ) ( not ( = ?auto_2878 ?auto_2896 ) ) ( not ( = ?auto_2878 ?auto_2898 ) ) ( not ( = ?auto_2878 ?auto_2888 ) ) ( not ( = ?auto_2878 ?auto_2894 ) ) ( not ( = ?auto_2889 ?auto_2887 ) ) ( not ( = ?auto_2889 ?auto_2886 ) ) ( not ( = ?auto_2889 ?auto_2892 ) ) ( not ( = ?auto_2889 ?auto_2883 ) ) ( not ( = ?auto_2891 ?auto_2895 ) ) ( not ( = ?auto_2891 ?auto_2893 ) ) ( not ( = ?auto_2891 ?auto_2897 ) ) ( not ( = ?auto_2891 ?auto_2882 ) ) ( not ( = ?auto_2890 ?auto_2896 ) ) ( not ( = ?auto_2890 ?auto_2898 ) ) ( not ( = ?auto_2890 ?auto_2888 ) ) ( not ( = ?auto_2890 ?auto_2894 ) ) ( not ( = ?auto_2873 ?auto_2879 ) ) ( not ( = ?auto_2873 ?auto_2881 ) ) ( not ( = ?auto_2874 ?auto_2879 ) ) ( not ( = ?auto_2874 ?auto_2881 ) ) ( not ( = ?auto_2875 ?auto_2879 ) ) ( not ( = ?auto_2875 ?auto_2881 ) ) ( not ( = ?auto_2876 ?auto_2879 ) ) ( not ( = ?auto_2876 ?auto_2881 ) ) ( not ( = ?auto_2877 ?auto_2879 ) ) ( not ( = ?auto_2877 ?auto_2881 ) ) ( not ( = ?auto_2879 ?auto_2890 ) ) ( not ( = ?auto_2879 ?auto_2896 ) ) ( not ( = ?auto_2879 ?auto_2898 ) ) ( not ( = ?auto_2879 ?auto_2888 ) ) ( not ( = ?auto_2879 ?auto_2894 ) ) ( not ( = ?auto_2881 ?auto_2890 ) ) ( not ( = ?auto_2881 ?auto_2896 ) ) ( not ( = ?auto_2881 ?auto_2898 ) ) ( not ( = ?auto_2881 ?auto_2888 ) ) ( not ( = ?auto_2881 ?auto_2894 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2873 ?auto_2874 ?auto_2875 ?auto_2876 ?auto_2877 ?auto_2878 )
      ( MAKE-1CRATE ?auto_2878 ?auto_2879 )
      ( MAKE-6CRATE-VERIFY ?auto_2873 ?auto_2874 ?auto_2875 ?auto_2876 ?auto_2877 ?auto_2878 ?auto_2879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2901 - SURFACE
      ?auto_2902 - SURFACE
    )
    :vars
    (
      ?auto_2903 - HOIST
      ?auto_2904 - PLACE
      ?auto_2906 - PLACE
      ?auto_2907 - HOIST
      ?auto_2908 - SURFACE
      ?auto_2905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2903 ?auto_2904 ) ( SURFACE-AT ?auto_2901 ?auto_2904 ) ( CLEAR ?auto_2901 ) ( IS-CRATE ?auto_2902 ) ( AVAILABLE ?auto_2903 ) ( not ( = ?auto_2906 ?auto_2904 ) ) ( HOIST-AT ?auto_2907 ?auto_2906 ) ( AVAILABLE ?auto_2907 ) ( SURFACE-AT ?auto_2902 ?auto_2906 ) ( ON ?auto_2902 ?auto_2908 ) ( CLEAR ?auto_2902 ) ( TRUCK-AT ?auto_2905 ?auto_2904 ) ( not ( = ?auto_2901 ?auto_2902 ) ) ( not ( = ?auto_2901 ?auto_2908 ) ) ( not ( = ?auto_2902 ?auto_2908 ) ) ( not ( = ?auto_2903 ?auto_2907 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2905 ?auto_2904 ?auto_2906 )
      ( !LIFT ?auto_2907 ?auto_2902 ?auto_2908 ?auto_2906 )
      ( !LOAD ?auto_2907 ?auto_2902 ?auto_2905 ?auto_2906 )
      ( !DRIVE ?auto_2905 ?auto_2906 ?auto_2904 )
      ( !UNLOAD ?auto_2903 ?auto_2902 ?auto_2905 ?auto_2904 )
      ( !DROP ?auto_2903 ?auto_2902 ?auto_2901 ?auto_2904 )
      ( MAKE-1CRATE-VERIFY ?auto_2901 ?auto_2902 ) )
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
      ?auto_2927 - HOIST
      ?auto_2928 - PLACE
      ?auto_2929 - PLACE
      ?auto_2926 - HOIST
      ?auto_2925 - SURFACE
      ?auto_2946 - PLACE
      ?auto_2945 - HOIST
      ?auto_2932 - SURFACE
      ?auto_2943 - PLACE
      ?auto_2940 - HOIST
      ?auto_2941 - SURFACE
      ?auto_2942 - PLACE
      ?auto_2935 - HOIST
      ?auto_2934 - SURFACE
      ?auto_2933 - PLACE
      ?auto_2938 - HOIST
      ?auto_2937 - SURFACE
      ?auto_2939 - PLACE
      ?auto_2936 - HOIST
      ?auto_2944 - SURFACE
      ?auto_2931 - SURFACE
      ?auto_2930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2927 ?auto_2928 ) ( IS-CRATE ?auto_2924 ) ( not ( = ?auto_2929 ?auto_2928 ) ) ( HOIST-AT ?auto_2926 ?auto_2929 ) ( AVAILABLE ?auto_2926 ) ( SURFACE-AT ?auto_2924 ?auto_2929 ) ( ON ?auto_2924 ?auto_2925 ) ( CLEAR ?auto_2924 ) ( not ( = ?auto_2923 ?auto_2924 ) ) ( not ( = ?auto_2923 ?auto_2925 ) ) ( not ( = ?auto_2924 ?auto_2925 ) ) ( not ( = ?auto_2927 ?auto_2926 ) ) ( IS-CRATE ?auto_2923 ) ( not ( = ?auto_2946 ?auto_2928 ) ) ( HOIST-AT ?auto_2945 ?auto_2946 ) ( SURFACE-AT ?auto_2923 ?auto_2946 ) ( ON ?auto_2923 ?auto_2932 ) ( CLEAR ?auto_2923 ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2922 ?auto_2932 ) ) ( not ( = ?auto_2923 ?auto_2932 ) ) ( not ( = ?auto_2927 ?auto_2945 ) ) ( IS-CRATE ?auto_2922 ) ( not ( = ?auto_2943 ?auto_2928 ) ) ( HOIST-AT ?auto_2940 ?auto_2943 ) ( AVAILABLE ?auto_2940 ) ( SURFACE-AT ?auto_2922 ?auto_2943 ) ( ON ?auto_2922 ?auto_2941 ) ( CLEAR ?auto_2922 ) ( not ( = ?auto_2921 ?auto_2922 ) ) ( not ( = ?auto_2921 ?auto_2941 ) ) ( not ( = ?auto_2922 ?auto_2941 ) ) ( not ( = ?auto_2927 ?auto_2940 ) ) ( IS-CRATE ?auto_2921 ) ( not ( = ?auto_2942 ?auto_2928 ) ) ( HOIST-AT ?auto_2935 ?auto_2942 ) ( AVAILABLE ?auto_2935 ) ( SURFACE-AT ?auto_2921 ?auto_2942 ) ( ON ?auto_2921 ?auto_2934 ) ( CLEAR ?auto_2921 ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( not ( = ?auto_2920 ?auto_2934 ) ) ( not ( = ?auto_2921 ?auto_2934 ) ) ( not ( = ?auto_2927 ?auto_2935 ) ) ( IS-CRATE ?auto_2920 ) ( not ( = ?auto_2933 ?auto_2928 ) ) ( HOIST-AT ?auto_2938 ?auto_2933 ) ( AVAILABLE ?auto_2938 ) ( SURFACE-AT ?auto_2920 ?auto_2933 ) ( ON ?auto_2920 ?auto_2937 ) ( CLEAR ?auto_2920 ) ( not ( = ?auto_2919 ?auto_2920 ) ) ( not ( = ?auto_2919 ?auto_2937 ) ) ( not ( = ?auto_2920 ?auto_2937 ) ) ( not ( = ?auto_2927 ?auto_2938 ) ) ( IS-CRATE ?auto_2919 ) ( not ( = ?auto_2939 ?auto_2928 ) ) ( HOIST-AT ?auto_2936 ?auto_2939 ) ( AVAILABLE ?auto_2936 ) ( SURFACE-AT ?auto_2919 ?auto_2939 ) ( ON ?auto_2919 ?auto_2944 ) ( CLEAR ?auto_2919 ) ( not ( = ?auto_2918 ?auto_2919 ) ) ( not ( = ?auto_2918 ?auto_2944 ) ) ( not ( = ?auto_2919 ?auto_2944 ) ) ( not ( = ?auto_2927 ?auto_2936 ) ) ( SURFACE-AT ?auto_2917 ?auto_2928 ) ( CLEAR ?auto_2917 ) ( IS-CRATE ?auto_2918 ) ( AVAILABLE ?auto_2927 ) ( AVAILABLE ?auto_2945 ) ( SURFACE-AT ?auto_2918 ?auto_2946 ) ( ON ?auto_2918 ?auto_2931 ) ( CLEAR ?auto_2918 ) ( TRUCK-AT ?auto_2930 ?auto_2928 ) ( not ( = ?auto_2917 ?auto_2918 ) ) ( not ( = ?auto_2917 ?auto_2931 ) ) ( not ( = ?auto_2918 ?auto_2931 ) ) ( not ( = ?auto_2917 ?auto_2919 ) ) ( not ( = ?auto_2917 ?auto_2944 ) ) ( not ( = ?auto_2919 ?auto_2931 ) ) ( not ( = ?auto_2939 ?auto_2946 ) ) ( not ( = ?auto_2936 ?auto_2945 ) ) ( not ( = ?auto_2944 ?auto_2931 ) ) ( not ( = ?auto_2917 ?auto_2920 ) ) ( not ( = ?auto_2917 ?auto_2937 ) ) ( not ( = ?auto_2918 ?auto_2920 ) ) ( not ( = ?auto_2918 ?auto_2937 ) ) ( not ( = ?auto_2920 ?auto_2944 ) ) ( not ( = ?auto_2920 ?auto_2931 ) ) ( not ( = ?auto_2933 ?auto_2939 ) ) ( not ( = ?auto_2933 ?auto_2946 ) ) ( not ( = ?auto_2938 ?auto_2936 ) ) ( not ( = ?auto_2938 ?auto_2945 ) ) ( not ( = ?auto_2937 ?auto_2944 ) ) ( not ( = ?auto_2937 ?auto_2931 ) ) ( not ( = ?auto_2917 ?auto_2921 ) ) ( not ( = ?auto_2917 ?auto_2934 ) ) ( not ( = ?auto_2918 ?auto_2921 ) ) ( not ( = ?auto_2918 ?auto_2934 ) ) ( not ( = ?auto_2919 ?auto_2921 ) ) ( not ( = ?auto_2919 ?auto_2934 ) ) ( not ( = ?auto_2921 ?auto_2937 ) ) ( not ( = ?auto_2921 ?auto_2944 ) ) ( not ( = ?auto_2921 ?auto_2931 ) ) ( not ( = ?auto_2942 ?auto_2933 ) ) ( not ( = ?auto_2942 ?auto_2939 ) ) ( not ( = ?auto_2942 ?auto_2946 ) ) ( not ( = ?auto_2935 ?auto_2938 ) ) ( not ( = ?auto_2935 ?auto_2936 ) ) ( not ( = ?auto_2935 ?auto_2945 ) ) ( not ( = ?auto_2934 ?auto_2937 ) ) ( not ( = ?auto_2934 ?auto_2944 ) ) ( not ( = ?auto_2934 ?auto_2931 ) ) ( not ( = ?auto_2917 ?auto_2922 ) ) ( not ( = ?auto_2917 ?auto_2941 ) ) ( not ( = ?auto_2918 ?auto_2922 ) ) ( not ( = ?auto_2918 ?auto_2941 ) ) ( not ( = ?auto_2919 ?auto_2922 ) ) ( not ( = ?auto_2919 ?auto_2941 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2941 ) ) ( not ( = ?auto_2922 ?auto_2934 ) ) ( not ( = ?auto_2922 ?auto_2937 ) ) ( not ( = ?auto_2922 ?auto_2944 ) ) ( not ( = ?auto_2922 ?auto_2931 ) ) ( not ( = ?auto_2943 ?auto_2942 ) ) ( not ( = ?auto_2943 ?auto_2933 ) ) ( not ( = ?auto_2943 ?auto_2939 ) ) ( not ( = ?auto_2943 ?auto_2946 ) ) ( not ( = ?auto_2940 ?auto_2935 ) ) ( not ( = ?auto_2940 ?auto_2938 ) ) ( not ( = ?auto_2940 ?auto_2936 ) ) ( not ( = ?auto_2940 ?auto_2945 ) ) ( not ( = ?auto_2941 ?auto_2934 ) ) ( not ( = ?auto_2941 ?auto_2937 ) ) ( not ( = ?auto_2941 ?auto_2944 ) ) ( not ( = ?auto_2941 ?auto_2931 ) ) ( not ( = ?auto_2917 ?auto_2923 ) ) ( not ( = ?auto_2917 ?auto_2932 ) ) ( not ( = ?auto_2918 ?auto_2923 ) ) ( not ( = ?auto_2918 ?auto_2932 ) ) ( not ( = ?auto_2919 ?auto_2923 ) ) ( not ( = ?auto_2919 ?auto_2932 ) ) ( not ( = ?auto_2920 ?auto_2923 ) ) ( not ( = ?auto_2920 ?auto_2932 ) ) ( not ( = ?auto_2921 ?auto_2923 ) ) ( not ( = ?auto_2921 ?auto_2932 ) ) ( not ( = ?auto_2923 ?auto_2941 ) ) ( not ( = ?auto_2923 ?auto_2934 ) ) ( not ( = ?auto_2923 ?auto_2937 ) ) ( not ( = ?auto_2923 ?auto_2944 ) ) ( not ( = ?auto_2923 ?auto_2931 ) ) ( not ( = ?auto_2932 ?auto_2941 ) ) ( not ( = ?auto_2932 ?auto_2934 ) ) ( not ( = ?auto_2932 ?auto_2937 ) ) ( not ( = ?auto_2932 ?auto_2944 ) ) ( not ( = ?auto_2932 ?auto_2931 ) ) ( not ( = ?auto_2917 ?auto_2924 ) ) ( not ( = ?auto_2917 ?auto_2925 ) ) ( not ( = ?auto_2918 ?auto_2924 ) ) ( not ( = ?auto_2918 ?auto_2925 ) ) ( not ( = ?auto_2919 ?auto_2924 ) ) ( not ( = ?auto_2919 ?auto_2925 ) ) ( not ( = ?auto_2920 ?auto_2924 ) ) ( not ( = ?auto_2920 ?auto_2925 ) ) ( not ( = ?auto_2921 ?auto_2924 ) ) ( not ( = ?auto_2921 ?auto_2925 ) ) ( not ( = ?auto_2922 ?auto_2924 ) ) ( not ( = ?auto_2922 ?auto_2925 ) ) ( not ( = ?auto_2924 ?auto_2932 ) ) ( not ( = ?auto_2924 ?auto_2941 ) ) ( not ( = ?auto_2924 ?auto_2934 ) ) ( not ( = ?auto_2924 ?auto_2937 ) ) ( not ( = ?auto_2924 ?auto_2944 ) ) ( not ( = ?auto_2924 ?auto_2931 ) ) ( not ( = ?auto_2929 ?auto_2946 ) ) ( not ( = ?auto_2929 ?auto_2943 ) ) ( not ( = ?auto_2929 ?auto_2942 ) ) ( not ( = ?auto_2929 ?auto_2933 ) ) ( not ( = ?auto_2929 ?auto_2939 ) ) ( not ( = ?auto_2926 ?auto_2945 ) ) ( not ( = ?auto_2926 ?auto_2940 ) ) ( not ( = ?auto_2926 ?auto_2935 ) ) ( not ( = ?auto_2926 ?auto_2938 ) ) ( not ( = ?auto_2926 ?auto_2936 ) ) ( not ( = ?auto_2925 ?auto_2932 ) ) ( not ( = ?auto_2925 ?auto_2941 ) ) ( not ( = ?auto_2925 ?auto_2934 ) ) ( not ( = ?auto_2925 ?auto_2937 ) ) ( not ( = ?auto_2925 ?auto_2944 ) ) ( not ( = ?auto_2925 ?auto_2931 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2917 ?auto_2918 ?auto_2919 ?auto_2920 ?auto_2921 ?auto_2922 ?auto_2923 )
      ( MAKE-1CRATE ?auto_2923 ?auto_2924 )
      ( MAKE-7CRATE-VERIFY ?auto_2917 ?auto_2918 ?auto_2919 ?auto_2920 ?auto_2921 ?auto_2922 ?auto_2923 ?auto_2924 ) )
  )

)

