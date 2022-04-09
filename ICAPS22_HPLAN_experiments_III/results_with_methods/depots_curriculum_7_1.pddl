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
      ?auto_2746 - SURFACE
      ?auto_2747 - SURFACE
    )
    :vars
    (
      ?auto_2748 - HOIST
      ?auto_2749 - PLACE
      ?auto_2751 - PLACE
      ?auto_2752 - HOIST
      ?auto_2753 - SURFACE
      ?auto_2750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2748 ?auto_2749 ) ( SURFACE-AT ?auto_2746 ?auto_2749 ) ( CLEAR ?auto_2746 ) ( IS-CRATE ?auto_2747 ) ( AVAILABLE ?auto_2748 ) ( not ( = ?auto_2751 ?auto_2749 ) ) ( HOIST-AT ?auto_2752 ?auto_2751 ) ( AVAILABLE ?auto_2752 ) ( SURFACE-AT ?auto_2747 ?auto_2751 ) ( ON ?auto_2747 ?auto_2753 ) ( CLEAR ?auto_2747 ) ( TRUCK-AT ?auto_2750 ?auto_2749 ) ( not ( = ?auto_2746 ?auto_2747 ) ) ( not ( = ?auto_2746 ?auto_2753 ) ) ( not ( = ?auto_2747 ?auto_2753 ) ) ( not ( = ?auto_2748 ?auto_2752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2750 ?auto_2749 ?auto_2751 )
      ( !LIFT ?auto_2752 ?auto_2747 ?auto_2753 ?auto_2751 )
      ( !LOAD ?auto_2752 ?auto_2747 ?auto_2750 ?auto_2751 )
      ( !DRIVE ?auto_2750 ?auto_2751 ?auto_2749 )
      ( !UNLOAD ?auto_2748 ?auto_2747 ?auto_2750 ?auto_2749 )
      ( !DROP ?auto_2748 ?auto_2747 ?auto_2746 ?auto_2749 )
      ( MAKE-1CRATE-VERIFY ?auto_2746 ?auto_2747 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2756 - SURFACE
      ?auto_2757 - SURFACE
    )
    :vars
    (
      ?auto_2758 - HOIST
      ?auto_2759 - PLACE
      ?auto_2761 - PLACE
      ?auto_2762 - HOIST
      ?auto_2763 - SURFACE
      ?auto_2760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2758 ?auto_2759 ) ( SURFACE-AT ?auto_2756 ?auto_2759 ) ( CLEAR ?auto_2756 ) ( IS-CRATE ?auto_2757 ) ( AVAILABLE ?auto_2758 ) ( not ( = ?auto_2761 ?auto_2759 ) ) ( HOIST-AT ?auto_2762 ?auto_2761 ) ( AVAILABLE ?auto_2762 ) ( SURFACE-AT ?auto_2757 ?auto_2761 ) ( ON ?auto_2757 ?auto_2763 ) ( CLEAR ?auto_2757 ) ( TRUCK-AT ?auto_2760 ?auto_2759 ) ( not ( = ?auto_2756 ?auto_2757 ) ) ( not ( = ?auto_2756 ?auto_2763 ) ) ( not ( = ?auto_2757 ?auto_2763 ) ) ( not ( = ?auto_2758 ?auto_2762 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2760 ?auto_2759 ?auto_2761 )
      ( !LIFT ?auto_2762 ?auto_2757 ?auto_2763 ?auto_2761 )
      ( !LOAD ?auto_2762 ?auto_2757 ?auto_2760 ?auto_2761 )
      ( !DRIVE ?auto_2760 ?auto_2761 ?auto_2759 )
      ( !UNLOAD ?auto_2758 ?auto_2757 ?auto_2760 ?auto_2759 )
      ( !DROP ?auto_2758 ?auto_2757 ?auto_2756 ?auto_2759 )
      ( MAKE-1CRATE-VERIFY ?auto_2756 ?auto_2757 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2767 - SURFACE
      ?auto_2768 - SURFACE
      ?auto_2769 - SURFACE
    )
    :vars
    (
      ?auto_2775 - HOIST
      ?auto_2770 - PLACE
      ?auto_2774 - PLACE
      ?auto_2773 - HOIST
      ?auto_2771 - SURFACE
      ?auto_2778 - PLACE
      ?auto_2776 - HOIST
      ?auto_2777 - SURFACE
      ?auto_2772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2775 ?auto_2770 ) ( IS-CRATE ?auto_2769 ) ( not ( = ?auto_2774 ?auto_2770 ) ) ( HOIST-AT ?auto_2773 ?auto_2774 ) ( AVAILABLE ?auto_2773 ) ( SURFACE-AT ?auto_2769 ?auto_2774 ) ( ON ?auto_2769 ?auto_2771 ) ( CLEAR ?auto_2769 ) ( not ( = ?auto_2768 ?auto_2769 ) ) ( not ( = ?auto_2768 ?auto_2771 ) ) ( not ( = ?auto_2769 ?auto_2771 ) ) ( not ( = ?auto_2775 ?auto_2773 ) ) ( SURFACE-AT ?auto_2767 ?auto_2770 ) ( CLEAR ?auto_2767 ) ( IS-CRATE ?auto_2768 ) ( AVAILABLE ?auto_2775 ) ( not ( = ?auto_2778 ?auto_2770 ) ) ( HOIST-AT ?auto_2776 ?auto_2778 ) ( AVAILABLE ?auto_2776 ) ( SURFACE-AT ?auto_2768 ?auto_2778 ) ( ON ?auto_2768 ?auto_2777 ) ( CLEAR ?auto_2768 ) ( TRUCK-AT ?auto_2772 ?auto_2770 ) ( not ( = ?auto_2767 ?auto_2768 ) ) ( not ( = ?auto_2767 ?auto_2777 ) ) ( not ( = ?auto_2768 ?auto_2777 ) ) ( not ( = ?auto_2775 ?auto_2776 ) ) ( not ( = ?auto_2767 ?auto_2769 ) ) ( not ( = ?auto_2767 ?auto_2771 ) ) ( not ( = ?auto_2769 ?auto_2777 ) ) ( not ( = ?auto_2774 ?auto_2778 ) ) ( not ( = ?auto_2773 ?auto_2776 ) ) ( not ( = ?auto_2771 ?auto_2777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2767 ?auto_2768 )
      ( MAKE-1CRATE ?auto_2768 ?auto_2769 )
      ( MAKE-2CRATE-VERIFY ?auto_2767 ?auto_2768 ?auto_2769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2781 - SURFACE
      ?auto_2782 - SURFACE
    )
    :vars
    (
      ?auto_2783 - HOIST
      ?auto_2784 - PLACE
      ?auto_2786 - PLACE
      ?auto_2787 - HOIST
      ?auto_2788 - SURFACE
      ?auto_2785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2783 ?auto_2784 ) ( SURFACE-AT ?auto_2781 ?auto_2784 ) ( CLEAR ?auto_2781 ) ( IS-CRATE ?auto_2782 ) ( AVAILABLE ?auto_2783 ) ( not ( = ?auto_2786 ?auto_2784 ) ) ( HOIST-AT ?auto_2787 ?auto_2786 ) ( AVAILABLE ?auto_2787 ) ( SURFACE-AT ?auto_2782 ?auto_2786 ) ( ON ?auto_2782 ?auto_2788 ) ( CLEAR ?auto_2782 ) ( TRUCK-AT ?auto_2785 ?auto_2784 ) ( not ( = ?auto_2781 ?auto_2782 ) ) ( not ( = ?auto_2781 ?auto_2788 ) ) ( not ( = ?auto_2782 ?auto_2788 ) ) ( not ( = ?auto_2783 ?auto_2787 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2785 ?auto_2784 ?auto_2786 )
      ( !LIFT ?auto_2787 ?auto_2782 ?auto_2788 ?auto_2786 )
      ( !LOAD ?auto_2787 ?auto_2782 ?auto_2785 ?auto_2786 )
      ( !DRIVE ?auto_2785 ?auto_2786 ?auto_2784 )
      ( !UNLOAD ?auto_2783 ?auto_2782 ?auto_2785 ?auto_2784 )
      ( !DROP ?auto_2783 ?auto_2782 ?auto_2781 ?auto_2784 )
      ( MAKE-1CRATE-VERIFY ?auto_2781 ?auto_2782 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2793 - SURFACE
      ?auto_2794 - SURFACE
      ?auto_2795 - SURFACE
      ?auto_2796 - SURFACE
    )
    :vars
    (
      ?auto_2798 - HOIST
      ?auto_2802 - PLACE
      ?auto_2797 - PLACE
      ?auto_2801 - HOIST
      ?auto_2800 - SURFACE
      ?auto_2806 - PLACE
      ?auto_2803 - HOIST
      ?auto_2808 - SURFACE
      ?auto_2805 - PLACE
      ?auto_2807 - HOIST
      ?auto_2804 - SURFACE
      ?auto_2799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2798 ?auto_2802 ) ( IS-CRATE ?auto_2796 ) ( not ( = ?auto_2797 ?auto_2802 ) ) ( HOIST-AT ?auto_2801 ?auto_2797 ) ( AVAILABLE ?auto_2801 ) ( SURFACE-AT ?auto_2796 ?auto_2797 ) ( ON ?auto_2796 ?auto_2800 ) ( CLEAR ?auto_2796 ) ( not ( = ?auto_2795 ?auto_2796 ) ) ( not ( = ?auto_2795 ?auto_2800 ) ) ( not ( = ?auto_2796 ?auto_2800 ) ) ( not ( = ?auto_2798 ?auto_2801 ) ) ( IS-CRATE ?auto_2795 ) ( not ( = ?auto_2806 ?auto_2802 ) ) ( HOIST-AT ?auto_2803 ?auto_2806 ) ( AVAILABLE ?auto_2803 ) ( SURFACE-AT ?auto_2795 ?auto_2806 ) ( ON ?auto_2795 ?auto_2808 ) ( CLEAR ?auto_2795 ) ( not ( = ?auto_2794 ?auto_2795 ) ) ( not ( = ?auto_2794 ?auto_2808 ) ) ( not ( = ?auto_2795 ?auto_2808 ) ) ( not ( = ?auto_2798 ?auto_2803 ) ) ( SURFACE-AT ?auto_2793 ?auto_2802 ) ( CLEAR ?auto_2793 ) ( IS-CRATE ?auto_2794 ) ( AVAILABLE ?auto_2798 ) ( not ( = ?auto_2805 ?auto_2802 ) ) ( HOIST-AT ?auto_2807 ?auto_2805 ) ( AVAILABLE ?auto_2807 ) ( SURFACE-AT ?auto_2794 ?auto_2805 ) ( ON ?auto_2794 ?auto_2804 ) ( CLEAR ?auto_2794 ) ( TRUCK-AT ?auto_2799 ?auto_2802 ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( not ( = ?auto_2793 ?auto_2804 ) ) ( not ( = ?auto_2794 ?auto_2804 ) ) ( not ( = ?auto_2798 ?auto_2807 ) ) ( not ( = ?auto_2793 ?auto_2795 ) ) ( not ( = ?auto_2793 ?auto_2808 ) ) ( not ( = ?auto_2795 ?auto_2804 ) ) ( not ( = ?auto_2806 ?auto_2805 ) ) ( not ( = ?auto_2803 ?auto_2807 ) ) ( not ( = ?auto_2808 ?auto_2804 ) ) ( not ( = ?auto_2793 ?auto_2796 ) ) ( not ( = ?auto_2793 ?auto_2800 ) ) ( not ( = ?auto_2794 ?auto_2796 ) ) ( not ( = ?auto_2794 ?auto_2800 ) ) ( not ( = ?auto_2796 ?auto_2808 ) ) ( not ( = ?auto_2796 ?auto_2804 ) ) ( not ( = ?auto_2797 ?auto_2806 ) ) ( not ( = ?auto_2797 ?auto_2805 ) ) ( not ( = ?auto_2801 ?auto_2803 ) ) ( not ( = ?auto_2801 ?auto_2807 ) ) ( not ( = ?auto_2800 ?auto_2808 ) ) ( not ( = ?auto_2800 ?auto_2804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2793 ?auto_2794 ?auto_2795 )
      ( MAKE-1CRATE ?auto_2795 ?auto_2796 )
      ( MAKE-3CRATE-VERIFY ?auto_2793 ?auto_2794 ?auto_2795 ?auto_2796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2811 - SURFACE
      ?auto_2812 - SURFACE
    )
    :vars
    (
      ?auto_2813 - HOIST
      ?auto_2814 - PLACE
      ?auto_2816 - PLACE
      ?auto_2817 - HOIST
      ?auto_2818 - SURFACE
      ?auto_2815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2813 ?auto_2814 ) ( SURFACE-AT ?auto_2811 ?auto_2814 ) ( CLEAR ?auto_2811 ) ( IS-CRATE ?auto_2812 ) ( AVAILABLE ?auto_2813 ) ( not ( = ?auto_2816 ?auto_2814 ) ) ( HOIST-AT ?auto_2817 ?auto_2816 ) ( AVAILABLE ?auto_2817 ) ( SURFACE-AT ?auto_2812 ?auto_2816 ) ( ON ?auto_2812 ?auto_2818 ) ( CLEAR ?auto_2812 ) ( TRUCK-AT ?auto_2815 ?auto_2814 ) ( not ( = ?auto_2811 ?auto_2812 ) ) ( not ( = ?auto_2811 ?auto_2818 ) ) ( not ( = ?auto_2812 ?auto_2818 ) ) ( not ( = ?auto_2813 ?auto_2817 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2815 ?auto_2814 ?auto_2816 )
      ( !LIFT ?auto_2817 ?auto_2812 ?auto_2818 ?auto_2816 )
      ( !LOAD ?auto_2817 ?auto_2812 ?auto_2815 ?auto_2816 )
      ( !DRIVE ?auto_2815 ?auto_2816 ?auto_2814 )
      ( !UNLOAD ?auto_2813 ?auto_2812 ?auto_2815 ?auto_2814 )
      ( !DROP ?auto_2813 ?auto_2812 ?auto_2811 ?auto_2814 )
      ( MAKE-1CRATE-VERIFY ?auto_2811 ?auto_2812 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2824 - SURFACE
      ?auto_2825 - SURFACE
      ?auto_2826 - SURFACE
      ?auto_2827 - SURFACE
      ?auto_2828 - SURFACE
    )
    :vars
    (
      ?auto_2830 - HOIST
      ?auto_2833 - PLACE
      ?auto_2832 - PLACE
      ?auto_2831 - HOIST
      ?auto_2834 - SURFACE
      ?auto_2841 - PLACE
      ?auto_2839 - HOIST
      ?auto_2838 - SURFACE
      ?auto_2840 - SURFACE
      ?auto_2835 - PLACE
      ?auto_2836 - HOIST
      ?auto_2837 - SURFACE
      ?auto_2829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2830 ?auto_2833 ) ( IS-CRATE ?auto_2828 ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( HOIST-AT ?auto_2831 ?auto_2832 ) ( SURFACE-AT ?auto_2828 ?auto_2832 ) ( ON ?auto_2828 ?auto_2834 ) ( CLEAR ?auto_2828 ) ( not ( = ?auto_2827 ?auto_2828 ) ) ( not ( = ?auto_2827 ?auto_2834 ) ) ( not ( = ?auto_2828 ?auto_2834 ) ) ( not ( = ?auto_2830 ?auto_2831 ) ) ( IS-CRATE ?auto_2827 ) ( not ( = ?auto_2841 ?auto_2833 ) ) ( HOIST-AT ?auto_2839 ?auto_2841 ) ( AVAILABLE ?auto_2839 ) ( SURFACE-AT ?auto_2827 ?auto_2841 ) ( ON ?auto_2827 ?auto_2838 ) ( CLEAR ?auto_2827 ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2838 ) ) ( not ( = ?auto_2827 ?auto_2838 ) ) ( not ( = ?auto_2830 ?auto_2839 ) ) ( IS-CRATE ?auto_2826 ) ( AVAILABLE ?auto_2831 ) ( SURFACE-AT ?auto_2826 ?auto_2832 ) ( ON ?auto_2826 ?auto_2840 ) ( CLEAR ?auto_2826 ) ( not ( = ?auto_2825 ?auto_2826 ) ) ( not ( = ?auto_2825 ?auto_2840 ) ) ( not ( = ?auto_2826 ?auto_2840 ) ) ( SURFACE-AT ?auto_2824 ?auto_2833 ) ( CLEAR ?auto_2824 ) ( IS-CRATE ?auto_2825 ) ( AVAILABLE ?auto_2830 ) ( not ( = ?auto_2835 ?auto_2833 ) ) ( HOIST-AT ?auto_2836 ?auto_2835 ) ( AVAILABLE ?auto_2836 ) ( SURFACE-AT ?auto_2825 ?auto_2835 ) ( ON ?auto_2825 ?auto_2837 ) ( CLEAR ?auto_2825 ) ( TRUCK-AT ?auto_2829 ?auto_2833 ) ( not ( = ?auto_2824 ?auto_2825 ) ) ( not ( = ?auto_2824 ?auto_2837 ) ) ( not ( = ?auto_2825 ?auto_2837 ) ) ( not ( = ?auto_2830 ?auto_2836 ) ) ( not ( = ?auto_2824 ?auto_2826 ) ) ( not ( = ?auto_2824 ?auto_2840 ) ) ( not ( = ?auto_2826 ?auto_2837 ) ) ( not ( = ?auto_2832 ?auto_2835 ) ) ( not ( = ?auto_2831 ?auto_2836 ) ) ( not ( = ?auto_2840 ?auto_2837 ) ) ( not ( = ?auto_2824 ?auto_2827 ) ) ( not ( = ?auto_2824 ?auto_2838 ) ) ( not ( = ?auto_2825 ?auto_2827 ) ) ( not ( = ?auto_2825 ?auto_2838 ) ) ( not ( = ?auto_2827 ?auto_2840 ) ) ( not ( = ?auto_2827 ?auto_2837 ) ) ( not ( = ?auto_2841 ?auto_2832 ) ) ( not ( = ?auto_2841 ?auto_2835 ) ) ( not ( = ?auto_2839 ?auto_2831 ) ) ( not ( = ?auto_2839 ?auto_2836 ) ) ( not ( = ?auto_2838 ?auto_2840 ) ) ( not ( = ?auto_2838 ?auto_2837 ) ) ( not ( = ?auto_2824 ?auto_2828 ) ) ( not ( = ?auto_2824 ?auto_2834 ) ) ( not ( = ?auto_2825 ?auto_2828 ) ) ( not ( = ?auto_2825 ?auto_2834 ) ) ( not ( = ?auto_2826 ?auto_2828 ) ) ( not ( = ?auto_2826 ?auto_2834 ) ) ( not ( = ?auto_2828 ?auto_2838 ) ) ( not ( = ?auto_2828 ?auto_2840 ) ) ( not ( = ?auto_2828 ?auto_2837 ) ) ( not ( = ?auto_2834 ?auto_2838 ) ) ( not ( = ?auto_2834 ?auto_2840 ) ) ( not ( = ?auto_2834 ?auto_2837 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2824 ?auto_2825 ?auto_2826 ?auto_2827 )
      ( MAKE-1CRATE ?auto_2827 ?auto_2828 )
      ( MAKE-4CRATE-VERIFY ?auto_2824 ?auto_2825 ?auto_2826 ?auto_2827 ?auto_2828 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2844 - SURFACE
      ?auto_2845 - SURFACE
    )
    :vars
    (
      ?auto_2846 - HOIST
      ?auto_2847 - PLACE
      ?auto_2849 - PLACE
      ?auto_2850 - HOIST
      ?auto_2851 - SURFACE
      ?auto_2848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2846 ?auto_2847 ) ( SURFACE-AT ?auto_2844 ?auto_2847 ) ( CLEAR ?auto_2844 ) ( IS-CRATE ?auto_2845 ) ( AVAILABLE ?auto_2846 ) ( not ( = ?auto_2849 ?auto_2847 ) ) ( HOIST-AT ?auto_2850 ?auto_2849 ) ( AVAILABLE ?auto_2850 ) ( SURFACE-AT ?auto_2845 ?auto_2849 ) ( ON ?auto_2845 ?auto_2851 ) ( CLEAR ?auto_2845 ) ( TRUCK-AT ?auto_2848 ?auto_2847 ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( not ( = ?auto_2844 ?auto_2851 ) ) ( not ( = ?auto_2845 ?auto_2851 ) ) ( not ( = ?auto_2846 ?auto_2850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2848 ?auto_2847 ?auto_2849 )
      ( !LIFT ?auto_2850 ?auto_2845 ?auto_2851 ?auto_2849 )
      ( !LOAD ?auto_2850 ?auto_2845 ?auto_2848 ?auto_2849 )
      ( !DRIVE ?auto_2848 ?auto_2849 ?auto_2847 )
      ( !UNLOAD ?auto_2846 ?auto_2845 ?auto_2848 ?auto_2847 )
      ( !DROP ?auto_2846 ?auto_2845 ?auto_2844 ?auto_2847 )
      ( MAKE-1CRATE-VERIFY ?auto_2844 ?auto_2845 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2858 - SURFACE
      ?auto_2859 - SURFACE
      ?auto_2860 - SURFACE
      ?auto_2861 - SURFACE
      ?auto_2862 - SURFACE
      ?auto_2863 - SURFACE
    )
    :vars
    (
      ?auto_2869 - HOIST
      ?auto_2868 - PLACE
      ?auto_2867 - PLACE
      ?auto_2866 - HOIST
      ?auto_2865 - SURFACE
      ?auto_2872 - PLACE
      ?auto_2870 - HOIST
      ?auto_2871 - SURFACE
      ?auto_2873 - PLACE
      ?auto_2874 - HOIST
      ?auto_2877 - SURFACE
      ?auto_2875 - SURFACE
      ?auto_2876 - SURFACE
      ?auto_2864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2869 ?auto_2868 ) ( IS-CRATE ?auto_2863 ) ( not ( = ?auto_2867 ?auto_2868 ) ) ( HOIST-AT ?auto_2866 ?auto_2867 ) ( SURFACE-AT ?auto_2863 ?auto_2867 ) ( ON ?auto_2863 ?auto_2865 ) ( CLEAR ?auto_2863 ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2865 ) ) ( not ( = ?auto_2863 ?auto_2865 ) ) ( not ( = ?auto_2869 ?auto_2866 ) ) ( IS-CRATE ?auto_2862 ) ( not ( = ?auto_2872 ?auto_2868 ) ) ( HOIST-AT ?auto_2870 ?auto_2872 ) ( SURFACE-AT ?auto_2862 ?auto_2872 ) ( ON ?auto_2862 ?auto_2871 ) ( CLEAR ?auto_2862 ) ( not ( = ?auto_2861 ?auto_2862 ) ) ( not ( = ?auto_2861 ?auto_2871 ) ) ( not ( = ?auto_2862 ?auto_2871 ) ) ( not ( = ?auto_2869 ?auto_2870 ) ) ( IS-CRATE ?auto_2861 ) ( not ( = ?auto_2873 ?auto_2868 ) ) ( HOIST-AT ?auto_2874 ?auto_2873 ) ( AVAILABLE ?auto_2874 ) ( SURFACE-AT ?auto_2861 ?auto_2873 ) ( ON ?auto_2861 ?auto_2877 ) ( CLEAR ?auto_2861 ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( not ( = ?auto_2860 ?auto_2877 ) ) ( not ( = ?auto_2861 ?auto_2877 ) ) ( not ( = ?auto_2869 ?auto_2874 ) ) ( IS-CRATE ?auto_2860 ) ( AVAILABLE ?auto_2870 ) ( SURFACE-AT ?auto_2860 ?auto_2872 ) ( ON ?auto_2860 ?auto_2875 ) ( CLEAR ?auto_2860 ) ( not ( = ?auto_2859 ?auto_2860 ) ) ( not ( = ?auto_2859 ?auto_2875 ) ) ( not ( = ?auto_2860 ?auto_2875 ) ) ( SURFACE-AT ?auto_2858 ?auto_2868 ) ( CLEAR ?auto_2858 ) ( IS-CRATE ?auto_2859 ) ( AVAILABLE ?auto_2869 ) ( AVAILABLE ?auto_2866 ) ( SURFACE-AT ?auto_2859 ?auto_2867 ) ( ON ?auto_2859 ?auto_2876 ) ( CLEAR ?auto_2859 ) ( TRUCK-AT ?auto_2864 ?auto_2868 ) ( not ( = ?auto_2858 ?auto_2859 ) ) ( not ( = ?auto_2858 ?auto_2876 ) ) ( not ( = ?auto_2859 ?auto_2876 ) ) ( not ( = ?auto_2858 ?auto_2860 ) ) ( not ( = ?auto_2858 ?auto_2875 ) ) ( not ( = ?auto_2860 ?auto_2876 ) ) ( not ( = ?auto_2872 ?auto_2867 ) ) ( not ( = ?auto_2870 ?auto_2866 ) ) ( not ( = ?auto_2875 ?auto_2876 ) ) ( not ( = ?auto_2858 ?auto_2861 ) ) ( not ( = ?auto_2858 ?auto_2877 ) ) ( not ( = ?auto_2859 ?auto_2861 ) ) ( not ( = ?auto_2859 ?auto_2877 ) ) ( not ( = ?auto_2861 ?auto_2875 ) ) ( not ( = ?auto_2861 ?auto_2876 ) ) ( not ( = ?auto_2873 ?auto_2872 ) ) ( not ( = ?auto_2873 ?auto_2867 ) ) ( not ( = ?auto_2874 ?auto_2870 ) ) ( not ( = ?auto_2874 ?auto_2866 ) ) ( not ( = ?auto_2877 ?auto_2875 ) ) ( not ( = ?auto_2877 ?auto_2876 ) ) ( not ( = ?auto_2858 ?auto_2862 ) ) ( not ( = ?auto_2858 ?auto_2871 ) ) ( not ( = ?auto_2859 ?auto_2862 ) ) ( not ( = ?auto_2859 ?auto_2871 ) ) ( not ( = ?auto_2860 ?auto_2862 ) ) ( not ( = ?auto_2860 ?auto_2871 ) ) ( not ( = ?auto_2862 ?auto_2877 ) ) ( not ( = ?auto_2862 ?auto_2875 ) ) ( not ( = ?auto_2862 ?auto_2876 ) ) ( not ( = ?auto_2871 ?auto_2877 ) ) ( not ( = ?auto_2871 ?auto_2875 ) ) ( not ( = ?auto_2871 ?auto_2876 ) ) ( not ( = ?auto_2858 ?auto_2863 ) ) ( not ( = ?auto_2858 ?auto_2865 ) ) ( not ( = ?auto_2859 ?auto_2863 ) ) ( not ( = ?auto_2859 ?auto_2865 ) ) ( not ( = ?auto_2860 ?auto_2863 ) ) ( not ( = ?auto_2860 ?auto_2865 ) ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2861 ?auto_2865 ) ) ( not ( = ?auto_2863 ?auto_2871 ) ) ( not ( = ?auto_2863 ?auto_2877 ) ) ( not ( = ?auto_2863 ?auto_2875 ) ) ( not ( = ?auto_2863 ?auto_2876 ) ) ( not ( = ?auto_2865 ?auto_2871 ) ) ( not ( = ?auto_2865 ?auto_2877 ) ) ( not ( = ?auto_2865 ?auto_2875 ) ) ( not ( = ?auto_2865 ?auto_2876 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2858 ?auto_2859 ?auto_2860 ?auto_2861 ?auto_2862 )
      ( MAKE-1CRATE ?auto_2862 ?auto_2863 )
      ( MAKE-5CRATE-VERIFY ?auto_2858 ?auto_2859 ?auto_2860 ?auto_2861 ?auto_2862 ?auto_2863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2880 - SURFACE
      ?auto_2881 - SURFACE
    )
    :vars
    (
      ?auto_2882 - HOIST
      ?auto_2883 - PLACE
      ?auto_2885 - PLACE
      ?auto_2886 - HOIST
      ?auto_2887 - SURFACE
      ?auto_2884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2882 ?auto_2883 ) ( SURFACE-AT ?auto_2880 ?auto_2883 ) ( CLEAR ?auto_2880 ) ( IS-CRATE ?auto_2881 ) ( AVAILABLE ?auto_2882 ) ( not ( = ?auto_2885 ?auto_2883 ) ) ( HOIST-AT ?auto_2886 ?auto_2885 ) ( AVAILABLE ?auto_2886 ) ( SURFACE-AT ?auto_2881 ?auto_2885 ) ( ON ?auto_2881 ?auto_2887 ) ( CLEAR ?auto_2881 ) ( TRUCK-AT ?auto_2884 ?auto_2883 ) ( not ( = ?auto_2880 ?auto_2881 ) ) ( not ( = ?auto_2880 ?auto_2887 ) ) ( not ( = ?auto_2881 ?auto_2887 ) ) ( not ( = ?auto_2882 ?auto_2886 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2884 ?auto_2883 ?auto_2885 )
      ( !LIFT ?auto_2886 ?auto_2881 ?auto_2887 ?auto_2885 )
      ( !LOAD ?auto_2886 ?auto_2881 ?auto_2884 ?auto_2885 )
      ( !DRIVE ?auto_2884 ?auto_2885 ?auto_2883 )
      ( !UNLOAD ?auto_2882 ?auto_2881 ?auto_2884 ?auto_2883 )
      ( !DROP ?auto_2882 ?auto_2881 ?auto_2880 ?auto_2883 )
      ( MAKE-1CRATE-VERIFY ?auto_2880 ?auto_2881 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2895 - SURFACE
      ?auto_2896 - SURFACE
      ?auto_2897 - SURFACE
      ?auto_2898 - SURFACE
      ?auto_2899 - SURFACE
      ?auto_2900 - SURFACE
      ?auto_2901 - SURFACE
    )
    :vars
    (
      ?auto_2906 - HOIST
      ?auto_2905 - PLACE
      ?auto_2902 - PLACE
      ?auto_2903 - HOIST
      ?auto_2904 - SURFACE
      ?auto_2915 - SURFACE
      ?auto_2916 - PLACE
      ?auto_2911 - HOIST
      ?auto_2914 - SURFACE
      ?auto_2910 - PLACE
      ?auto_2909 - HOIST
      ?auto_2913 - SURFACE
      ?auto_2908 - SURFACE
      ?auto_2912 - SURFACE
      ?auto_2907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2906 ?auto_2905 ) ( IS-CRATE ?auto_2901 ) ( not ( = ?auto_2902 ?auto_2905 ) ) ( HOIST-AT ?auto_2903 ?auto_2902 ) ( SURFACE-AT ?auto_2901 ?auto_2902 ) ( ON ?auto_2901 ?auto_2904 ) ( CLEAR ?auto_2901 ) ( not ( = ?auto_2900 ?auto_2901 ) ) ( not ( = ?auto_2900 ?auto_2904 ) ) ( not ( = ?auto_2901 ?auto_2904 ) ) ( not ( = ?auto_2906 ?auto_2903 ) ) ( IS-CRATE ?auto_2900 ) ( SURFACE-AT ?auto_2900 ?auto_2902 ) ( ON ?auto_2900 ?auto_2915 ) ( CLEAR ?auto_2900 ) ( not ( = ?auto_2899 ?auto_2900 ) ) ( not ( = ?auto_2899 ?auto_2915 ) ) ( not ( = ?auto_2900 ?auto_2915 ) ) ( IS-CRATE ?auto_2899 ) ( not ( = ?auto_2916 ?auto_2905 ) ) ( HOIST-AT ?auto_2911 ?auto_2916 ) ( SURFACE-AT ?auto_2899 ?auto_2916 ) ( ON ?auto_2899 ?auto_2914 ) ( CLEAR ?auto_2899 ) ( not ( = ?auto_2898 ?auto_2899 ) ) ( not ( = ?auto_2898 ?auto_2914 ) ) ( not ( = ?auto_2899 ?auto_2914 ) ) ( not ( = ?auto_2906 ?auto_2911 ) ) ( IS-CRATE ?auto_2898 ) ( not ( = ?auto_2910 ?auto_2905 ) ) ( HOIST-AT ?auto_2909 ?auto_2910 ) ( AVAILABLE ?auto_2909 ) ( SURFACE-AT ?auto_2898 ?auto_2910 ) ( ON ?auto_2898 ?auto_2913 ) ( CLEAR ?auto_2898 ) ( not ( = ?auto_2897 ?auto_2898 ) ) ( not ( = ?auto_2897 ?auto_2913 ) ) ( not ( = ?auto_2898 ?auto_2913 ) ) ( not ( = ?auto_2906 ?auto_2909 ) ) ( IS-CRATE ?auto_2897 ) ( AVAILABLE ?auto_2911 ) ( SURFACE-AT ?auto_2897 ?auto_2916 ) ( ON ?auto_2897 ?auto_2908 ) ( CLEAR ?auto_2897 ) ( not ( = ?auto_2896 ?auto_2897 ) ) ( not ( = ?auto_2896 ?auto_2908 ) ) ( not ( = ?auto_2897 ?auto_2908 ) ) ( SURFACE-AT ?auto_2895 ?auto_2905 ) ( CLEAR ?auto_2895 ) ( IS-CRATE ?auto_2896 ) ( AVAILABLE ?auto_2906 ) ( AVAILABLE ?auto_2903 ) ( SURFACE-AT ?auto_2896 ?auto_2902 ) ( ON ?auto_2896 ?auto_2912 ) ( CLEAR ?auto_2896 ) ( TRUCK-AT ?auto_2907 ?auto_2905 ) ( not ( = ?auto_2895 ?auto_2896 ) ) ( not ( = ?auto_2895 ?auto_2912 ) ) ( not ( = ?auto_2896 ?auto_2912 ) ) ( not ( = ?auto_2895 ?auto_2897 ) ) ( not ( = ?auto_2895 ?auto_2908 ) ) ( not ( = ?auto_2897 ?auto_2912 ) ) ( not ( = ?auto_2916 ?auto_2902 ) ) ( not ( = ?auto_2911 ?auto_2903 ) ) ( not ( = ?auto_2908 ?auto_2912 ) ) ( not ( = ?auto_2895 ?auto_2898 ) ) ( not ( = ?auto_2895 ?auto_2913 ) ) ( not ( = ?auto_2896 ?auto_2898 ) ) ( not ( = ?auto_2896 ?auto_2913 ) ) ( not ( = ?auto_2898 ?auto_2908 ) ) ( not ( = ?auto_2898 ?auto_2912 ) ) ( not ( = ?auto_2910 ?auto_2916 ) ) ( not ( = ?auto_2910 ?auto_2902 ) ) ( not ( = ?auto_2909 ?auto_2911 ) ) ( not ( = ?auto_2909 ?auto_2903 ) ) ( not ( = ?auto_2913 ?auto_2908 ) ) ( not ( = ?auto_2913 ?auto_2912 ) ) ( not ( = ?auto_2895 ?auto_2899 ) ) ( not ( = ?auto_2895 ?auto_2914 ) ) ( not ( = ?auto_2896 ?auto_2899 ) ) ( not ( = ?auto_2896 ?auto_2914 ) ) ( not ( = ?auto_2897 ?auto_2899 ) ) ( not ( = ?auto_2897 ?auto_2914 ) ) ( not ( = ?auto_2899 ?auto_2913 ) ) ( not ( = ?auto_2899 ?auto_2908 ) ) ( not ( = ?auto_2899 ?auto_2912 ) ) ( not ( = ?auto_2914 ?auto_2913 ) ) ( not ( = ?auto_2914 ?auto_2908 ) ) ( not ( = ?auto_2914 ?auto_2912 ) ) ( not ( = ?auto_2895 ?auto_2900 ) ) ( not ( = ?auto_2895 ?auto_2915 ) ) ( not ( = ?auto_2896 ?auto_2900 ) ) ( not ( = ?auto_2896 ?auto_2915 ) ) ( not ( = ?auto_2897 ?auto_2900 ) ) ( not ( = ?auto_2897 ?auto_2915 ) ) ( not ( = ?auto_2898 ?auto_2900 ) ) ( not ( = ?auto_2898 ?auto_2915 ) ) ( not ( = ?auto_2900 ?auto_2914 ) ) ( not ( = ?auto_2900 ?auto_2913 ) ) ( not ( = ?auto_2900 ?auto_2908 ) ) ( not ( = ?auto_2900 ?auto_2912 ) ) ( not ( = ?auto_2915 ?auto_2914 ) ) ( not ( = ?auto_2915 ?auto_2913 ) ) ( not ( = ?auto_2915 ?auto_2908 ) ) ( not ( = ?auto_2915 ?auto_2912 ) ) ( not ( = ?auto_2895 ?auto_2901 ) ) ( not ( = ?auto_2895 ?auto_2904 ) ) ( not ( = ?auto_2896 ?auto_2901 ) ) ( not ( = ?auto_2896 ?auto_2904 ) ) ( not ( = ?auto_2897 ?auto_2901 ) ) ( not ( = ?auto_2897 ?auto_2904 ) ) ( not ( = ?auto_2898 ?auto_2901 ) ) ( not ( = ?auto_2898 ?auto_2904 ) ) ( not ( = ?auto_2899 ?auto_2901 ) ) ( not ( = ?auto_2899 ?auto_2904 ) ) ( not ( = ?auto_2901 ?auto_2915 ) ) ( not ( = ?auto_2901 ?auto_2914 ) ) ( not ( = ?auto_2901 ?auto_2913 ) ) ( not ( = ?auto_2901 ?auto_2908 ) ) ( not ( = ?auto_2901 ?auto_2912 ) ) ( not ( = ?auto_2904 ?auto_2915 ) ) ( not ( = ?auto_2904 ?auto_2914 ) ) ( not ( = ?auto_2904 ?auto_2913 ) ) ( not ( = ?auto_2904 ?auto_2908 ) ) ( not ( = ?auto_2904 ?auto_2912 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2895 ?auto_2896 ?auto_2897 ?auto_2898 ?auto_2899 ?auto_2900 )
      ( MAKE-1CRATE ?auto_2900 ?auto_2901 )
      ( MAKE-6CRATE-VERIFY ?auto_2895 ?auto_2896 ?auto_2897 ?auto_2898 ?auto_2899 ?auto_2900 ?auto_2901 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2919 - SURFACE
      ?auto_2920 - SURFACE
    )
    :vars
    (
      ?auto_2921 - HOIST
      ?auto_2922 - PLACE
      ?auto_2924 - PLACE
      ?auto_2925 - HOIST
      ?auto_2926 - SURFACE
      ?auto_2923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2921 ?auto_2922 ) ( SURFACE-AT ?auto_2919 ?auto_2922 ) ( CLEAR ?auto_2919 ) ( IS-CRATE ?auto_2920 ) ( AVAILABLE ?auto_2921 ) ( not ( = ?auto_2924 ?auto_2922 ) ) ( HOIST-AT ?auto_2925 ?auto_2924 ) ( AVAILABLE ?auto_2925 ) ( SURFACE-AT ?auto_2920 ?auto_2924 ) ( ON ?auto_2920 ?auto_2926 ) ( CLEAR ?auto_2920 ) ( TRUCK-AT ?auto_2923 ?auto_2922 ) ( not ( = ?auto_2919 ?auto_2920 ) ) ( not ( = ?auto_2919 ?auto_2926 ) ) ( not ( = ?auto_2920 ?auto_2926 ) ) ( not ( = ?auto_2921 ?auto_2925 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2923 ?auto_2922 ?auto_2924 )
      ( !LIFT ?auto_2925 ?auto_2920 ?auto_2926 ?auto_2924 )
      ( !LOAD ?auto_2925 ?auto_2920 ?auto_2923 ?auto_2924 )
      ( !DRIVE ?auto_2923 ?auto_2924 ?auto_2922 )
      ( !UNLOAD ?auto_2921 ?auto_2920 ?auto_2923 ?auto_2922 )
      ( !DROP ?auto_2921 ?auto_2920 ?auto_2919 ?auto_2922 )
      ( MAKE-1CRATE-VERIFY ?auto_2919 ?auto_2920 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2935 - SURFACE
      ?auto_2936 - SURFACE
      ?auto_2937 - SURFACE
      ?auto_2938 - SURFACE
      ?auto_2939 - SURFACE
      ?auto_2940 - SURFACE
      ?auto_2942 - SURFACE
      ?auto_2941 - SURFACE
    )
    :vars
    (
      ?auto_2946 - HOIST
      ?auto_2943 - PLACE
      ?auto_2945 - PLACE
      ?auto_2948 - HOIST
      ?auto_2944 - SURFACE
      ?auto_2950 - PLACE
      ?auto_2956 - HOIST
      ?auto_2957 - SURFACE
      ?auto_2952 - SURFACE
      ?auto_2953 - SURFACE
      ?auto_2949 - PLACE
      ?auto_2958 - HOIST
      ?auto_2954 - SURFACE
      ?auto_2951 - SURFACE
      ?auto_2955 - SURFACE
      ?auto_2947 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2946 ?auto_2943 ) ( IS-CRATE ?auto_2941 ) ( not ( = ?auto_2945 ?auto_2943 ) ) ( HOIST-AT ?auto_2948 ?auto_2945 ) ( SURFACE-AT ?auto_2941 ?auto_2945 ) ( ON ?auto_2941 ?auto_2944 ) ( CLEAR ?auto_2941 ) ( not ( = ?auto_2942 ?auto_2941 ) ) ( not ( = ?auto_2942 ?auto_2944 ) ) ( not ( = ?auto_2941 ?auto_2944 ) ) ( not ( = ?auto_2946 ?auto_2948 ) ) ( IS-CRATE ?auto_2942 ) ( not ( = ?auto_2950 ?auto_2943 ) ) ( HOIST-AT ?auto_2956 ?auto_2950 ) ( SURFACE-AT ?auto_2942 ?auto_2950 ) ( ON ?auto_2942 ?auto_2957 ) ( CLEAR ?auto_2942 ) ( not ( = ?auto_2940 ?auto_2942 ) ) ( not ( = ?auto_2940 ?auto_2957 ) ) ( not ( = ?auto_2942 ?auto_2957 ) ) ( not ( = ?auto_2946 ?auto_2956 ) ) ( IS-CRATE ?auto_2940 ) ( SURFACE-AT ?auto_2940 ?auto_2950 ) ( ON ?auto_2940 ?auto_2952 ) ( CLEAR ?auto_2940 ) ( not ( = ?auto_2939 ?auto_2940 ) ) ( not ( = ?auto_2939 ?auto_2952 ) ) ( not ( = ?auto_2940 ?auto_2952 ) ) ( IS-CRATE ?auto_2939 ) ( SURFACE-AT ?auto_2939 ?auto_2945 ) ( ON ?auto_2939 ?auto_2953 ) ( CLEAR ?auto_2939 ) ( not ( = ?auto_2938 ?auto_2939 ) ) ( not ( = ?auto_2938 ?auto_2953 ) ) ( not ( = ?auto_2939 ?auto_2953 ) ) ( IS-CRATE ?auto_2938 ) ( not ( = ?auto_2949 ?auto_2943 ) ) ( HOIST-AT ?auto_2958 ?auto_2949 ) ( AVAILABLE ?auto_2958 ) ( SURFACE-AT ?auto_2938 ?auto_2949 ) ( ON ?auto_2938 ?auto_2954 ) ( CLEAR ?auto_2938 ) ( not ( = ?auto_2937 ?auto_2938 ) ) ( not ( = ?auto_2937 ?auto_2954 ) ) ( not ( = ?auto_2938 ?auto_2954 ) ) ( not ( = ?auto_2946 ?auto_2958 ) ) ( IS-CRATE ?auto_2937 ) ( AVAILABLE ?auto_2948 ) ( SURFACE-AT ?auto_2937 ?auto_2945 ) ( ON ?auto_2937 ?auto_2951 ) ( CLEAR ?auto_2937 ) ( not ( = ?auto_2936 ?auto_2937 ) ) ( not ( = ?auto_2936 ?auto_2951 ) ) ( not ( = ?auto_2937 ?auto_2951 ) ) ( SURFACE-AT ?auto_2935 ?auto_2943 ) ( CLEAR ?auto_2935 ) ( IS-CRATE ?auto_2936 ) ( AVAILABLE ?auto_2946 ) ( AVAILABLE ?auto_2956 ) ( SURFACE-AT ?auto_2936 ?auto_2950 ) ( ON ?auto_2936 ?auto_2955 ) ( CLEAR ?auto_2936 ) ( TRUCK-AT ?auto_2947 ?auto_2943 ) ( not ( = ?auto_2935 ?auto_2936 ) ) ( not ( = ?auto_2935 ?auto_2955 ) ) ( not ( = ?auto_2936 ?auto_2955 ) ) ( not ( = ?auto_2935 ?auto_2937 ) ) ( not ( = ?auto_2935 ?auto_2951 ) ) ( not ( = ?auto_2937 ?auto_2955 ) ) ( not ( = ?auto_2945 ?auto_2950 ) ) ( not ( = ?auto_2948 ?auto_2956 ) ) ( not ( = ?auto_2951 ?auto_2955 ) ) ( not ( = ?auto_2935 ?auto_2938 ) ) ( not ( = ?auto_2935 ?auto_2954 ) ) ( not ( = ?auto_2936 ?auto_2938 ) ) ( not ( = ?auto_2936 ?auto_2954 ) ) ( not ( = ?auto_2938 ?auto_2951 ) ) ( not ( = ?auto_2938 ?auto_2955 ) ) ( not ( = ?auto_2949 ?auto_2945 ) ) ( not ( = ?auto_2949 ?auto_2950 ) ) ( not ( = ?auto_2958 ?auto_2948 ) ) ( not ( = ?auto_2958 ?auto_2956 ) ) ( not ( = ?auto_2954 ?auto_2951 ) ) ( not ( = ?auto_2954 ?auto_2955 ) ) ( not ( = ?auto_2935 ?auto_2939 ) ) ( not ( = ?auto_2935 ?auto_2953 ) ) ( not ( = ?auto_2936 ?auto_2939 ) ) ( not ( = ?auto_2936 ?auto_2953 ) ) ( not ( = ?auto_2937 ?auto_2939 ) ) ( not ( = ?auto_2937 ?auto_2953 ) ) ( not ( = ?auto_2939 ?auto_2954 ) ) ( not ( = ?auto_2939 ?auto_2951 ) ) ( not ( = ?auto_2939 ?auto_2955 ) ) ( not ( = ?auto_2953 ?auto_2954 ) ) ( not ( = ?auto_2953 ?auto_2951 ) ) ( not ( = ?auto_2953 ?auto_2955 ) ) ( not ( = ?auto_2935 ?auto_2940 ) ) ( not ( = ?auto_2935 ?auto_2952 ) ) ( not ( = ?auto_2936 ?auto_2940 ) ) ( not ( = ?auto_2936 ?auto_2952 ) ) ( not ( = ?auto_2937 ?auto_2940 ) ) ( not ( = ?auto_2937 ?auto_2952 ) ) ( not ( = ?auto_2938 ?auto_2940 ) ) ( not ( = ?auto_2938 ?auto_2952 ) ) ( not ( = ?auto_2940 ?auto_2953 ) ) ( not ( = ?auto_2940 ?auto_2954 ) ) ( not ( = ?auto_2940 ?auto_2951 ) ) ( not ( = ?auto_2940 ?auto_2955 ) ) ( not ( = ?auto_2952 ?auto_2953 ) ) ( not ( = ?auto_2952 ?auto_2954 ) ) ( not ( = ?auto_2952 ?auto_2951 ) ) ( not ( = ?auto_2952 ?auto_2955 ) ) ( not ( = ?auto_2935 ?auto_2942 ) ) ( not ( = ?auto_2935 ?auto_2957 ) ) ( not ( = ?auto_2936 ?auto_2942 ) ) ( not ( = ?auto_2936 ?auto_2957 ) ) ( not ( = ?auto_2937 ?auto_2942 ) ) ( not ( = ?auto_2937 ?auto_2957 ) ) ( not ( = ?auto_2938 ?auto_2942 ) ) ( not ( = ?auto_2938 ?auto_2957 ) ) ( not ( = ?auto_2939 ?auto_2942 ) ) ( not ( = ?auto_2939 ?auto_2957 ) ) ( not ( = ?auto_2942 ?auto_2952 ) ) ( not ( = ?auto_2942 ?auto_2953 ) ) ( not ( = ?auto_2942 ?auto_2954 ) ) ( not ( = ?auto_2942 ?auto_2951 ) ) ( not ( = ?auto_2942 ?auto_2955 ) ) ( not ( = ?auto_2957 ?auto_2952 ) ) ( not ( = ?auto_2957 ?auto_2953 ) ) ( not ( = ?auto_2957 ?auto_2954 ) ) ( not ( = ?auto_2957 ?auto_2951 ) ) ( not ( = ?auto_2957 ?auto_2955 ) ) ( not ( = ?auto_2935 ?auto_2941 ) ) ( not ( = ?auto_2935 ?auto_2944 ) ) ( not ( = ?auto_2936 ?auto_2941 ) ) ( not ( = ?auto_2936 ?auto_2944 ) ) ( not ( = ?auto_2937 ?auto_2941 ) ) ( not ( = ?auto_2937 ?auto_2944 ) ) ( not ( = ?auto_2938 ?auto_2941 ) ) ( not ( = ?auto_2938 ?auto_2944 ) ) ( not ( = ?auto_2939 ?auto_2941 ) ) ( not ( = ?auto_2939 ?auto_2944 ) ) ( not ( = ?auto_2940 ?auto_2941 ) ) ( not ( = ?auto_2940 ?auto_2944 ) ) ( not ( = ?auto_2941 ?auto_2957 ) ) ( not ( = ?auto_2941 ?auto_2952 ) ) ( not ( = ?auto_2941 ?auto_2953 ) ) ( not ( = ?auto_2941 ?auto_2954 ) ) ( not ( = ?auto_2941 ?auto_2951 ) ) ( not ( = ?auto_2941 ?auto_2955 ) ) ( not ( = ?auto_2944 ?auto_2957 ) ) ( not ( = ?auto_2944 ?auto_2952 ) ) ( not ( = ?auto_2944 ?auto_2953 ) ) ( not ( = ?auto_2944 ?auto_2954 ) ) ( not ( = ?auto_2944 ?auto_2951 ) ) ( not ( = ?auto_2944 ?auto_2955 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2935 ?auto_2936 ?auto_2937 ?auto_2938 ?auto_2939 ?auto_2940 ?auto_2942 )
      ( MAKE-1CRATE ?auto_2942 ?auto_2941 )
      ( MAKE-7CRATE-VERIFY ?auto_2935 ?auto_2936 ?auto_2937 ?auto_2938 ?auto_2939 ?auto_2940 ?auto_2942 ?auto_2941 ) )
  )

)

