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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2767 - SURFACE
      ?auto_2768 - SURFACE
      ?auto_2769 - SURFACE
    )
    :vars
    (
      ?auto_2770 - HOIST
      ?auto_2773 - PLACE
      ?auto_2775 - PLACE
      ?auto_2771 - HOIST
      ?auto_2772 - SURFACE
      ?auto_2776 - PLACE
      ?auto_2778 - HOIST
      ?auto_2777 - SURFACE
      ?auto_2774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2770 ?auto_2773 ) ( IS-CRATE ?auto_2769 ) ( not ( = ?auto_2775 ?auto_2773 ) ) ( HOIST-AT ?auto_2771 ?auto_2775 ) ( AVAILABLE ?auto_2771 ) ( SURFACE-AT ?auto_2769 ?auto_2775 ) ( ON ?auto_2769 ?auto_2772 ) ( CLEAR ?auto_2769 ) ( not ( = ?auto_2768 ?auto_2769 ) ) ( not ( = ?auto_2768 ?auto_2772 ) ) ( not ( = ?auto_2769 ?auto_2772 ) ) ( not ( = ?auto_2770 ?auto_2771 ) ) ( SURFACE-AT ?auto_2767 ?auto_2773 ) ( CLEAR ?auto_2767 ) ( IS-CRATE ?auto_2768 ) ( AVAILABLE ?auto_2770 ) ( not ( = ?auto_2776 ?auto_2773 ) ) ( HOIST-AT ?auto_2778 ?auto_2776 ) ( AVAILABLE ?auto_2778 ) ( SURFACE-AT ?auto_2768 ?auto_2776 ) ( ON ?auto_2768 ?auto_2777 ) ( CLEAR ?auto_2768 ) ( TRUCK-AT ?auto_2774 ?auto_2773 ) ( not ( = ?auto_2767 ?auto_2768 ) ) ( not ( = ?auto_2767 ?auto_2777 ) ) ( not ( = ?auto_2768 ?auto_2777 ) ) ( not ( = ?auto_2770 ?auto_2778 ) ) ( not ( = ?auto_2767 ?auto_2769 ) ) ( not ( = ?auto_2767 ?auto_2772 ) ) ( not ( = ?auto_2769 ?auto_2777 ) ) ( not ( = ?auto_2775 ?auto_2776 ) ) ( not ( = ?auto_2771 ?auto_2778 ) ) ( not ( = ?auto_2772 ?auto_2777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2767 ?auto_2768 )
      ( MAKE-1CRATE ?auto_2768 ?auto_2769 )
      ( MAKE-2CRATE-VERIFY ?auto_2767 ?auto_2768 ?auto_2769 ) )
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
      ?auto_2802 - HOIST
      ?auto_2801 - PLACE
      ?auto_2800 - PLACE
      ?auto_2798 - HOIST
      ?auto_2797 - SURFACE
      ?auto_2804 - PLACE
      ?auto_2808 - HOIST
      ?auto_2807 - SURFACE
      ?auto_2803 - PLACE
      ?auto_2805 - HOIST
      ?auto_2806 - SURFACE
      ?auto_2799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2802 ?auto_2801 ) ( IS-CRATE ?auto_2796 ) ( not ( = ?auto_2800 ?auto_2801 ) ) ( HOIST-AT ?auto_2798 ?auto_2800 ) ( AVAILABLE ?auto_2798 ) ( SURFACE-AT ?auto_2796 ?auto_2800 ) ( ON ?auto_2796 ?auto_2797 ) ( CLEAR ?auto_2796 ) ( not ( = ?auto_2795 ?auto_2796 ) ) ( not ( = ?auto_2795 ?auto_2797 ) ) ( not ( = ?auto_2796 ?auto_2797 ) ) ( not ( = ?auto_2802 ?auto_2798 ) ) ( IS-CRATE ?auto_2795 ) ( not ( = ?auto_2804 ?auto_2801 ) ) ( HOIST-AT ?auto_2808 ?auto_2804 ) ( AVAILABLE ?auto_2808 ) ( SURFACE-AT ?auto_2795 ?auto_2804 ) ( ON ?auto_2795 ?auto_2807 ) ( CLEAR ?auto_2795 ) ( not ( = ?auto_2794 ?auto_2795 ) ) ( not ( = ?auto_2794 ?auto_2807 ) ) ( not ( = ?auto_2795 ?auto_2807 ) ) ( not ( = ?auto_2802 ?auto_2808 ) ) ( SURFACE-AT ?auto_2793 ?auto_2801 ) ( CLEAR ?auto_2793 ) ( IS-CRATE ?auto_2794 ) ( AVAILABLE ?auto_2802 ) ( not ( = ?auto_2803 ?auto_2801 ) ) ( HOIST-AT ?auto_2805 ?auto_2803 ) ( AVAILABLE ?auto_2805 ) ( SURFACE-AT ?auto_2794 ?auto_2803 ) ( ON ?auto_2794 ?auto_2806 ) ( CLEAR ?auto_2794 ) ( TRUCK-AT ?auto_2799 ?auto_2801 ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( not ( = ?auto_2793 ?auto_2806 ) ) ( not ( = ?auto_2794 ?auto_2806 ) ) ( not ( = ?auto_2802 ?auto_2805 ) ) ( not ( = ?auto_2793 ?auto_2795 ) ) ( not ( = ?auto_2793 ?auto_2807 ) ) ( not ( = ?auto_2795 ?auto_2806 ) ) ( not ( = ?auto_2804 ?auto_2803 ) ) ( not ( = ?auto_2808 ?auto_2805 ) ) ( not ( = ?auto_2807 ?auto_2806 ) ) ( not ( = ?auto_2793 ?auto_2796 ) ) ( not ( = ?auto_2793 ?auto_2797 ) ) ( not ( = ?auto_2794 ?auto_2796 ) ) ( not ( = ?auto_2794 ?auto_2797 ) ) ( not ( = ?auto_2796 ?auto_2807 ) ) ( not ( = ?auto_2796 ?auto_2806 ) ) ( not ( = ?auto_2800 ?auto_2804 ) ) ( not ( = ?auto_2800 ?auto_2803 ) ) ( not ( = ?auto_2798 ?auto_2808 ) ) ( not ( = ?auto_2798 ?auto_2805 ) ) ( not ( = ?auto_2797 ?auto_2807 ) ) ( not ( = ?auto_2797 ?auto_2806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2793 ?auto_2794 ?auto_2795 )
      ( MAKE-1CRATE ?auto_2795 ?auto_2796 )
      ( MAKE-3CRATE-VERIFY ?auto_2793 ?auto_2794 ?auto_2795 ?auto_2796 ) )
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
      ?auto_2832 - HOIST
      ?auto_2831 - PLACE
      ?auto_2834 - PLACE
      ?auto_2833 - HOIST
      ?auto_2829 - SURFACE
      ?auto_2841 - PLACE
      ?auto_2840 - HOIST
      ?auto_2835 - SURFACE
      ?auto_2837 - SURFACE
      ?auto_2839 - PLACE
      ?auto_2836 - HOIST
      ?auto_2838 - SURFACE
      ?auto_2830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2832 ?auto_2831 ) ( IS-CRATE ?auto_2828 ) ( not ( = ?auto_2834 ?auto_2831 ) ) ( HOIST-AT ?auto_2833 ?auto_2834 ) ( SURFACE-AT ?auto_2828 ?auto_2834 ) ( ON ?auto_2828 ?auto_2829 ) ( CLEAR ?auto_2828 ) ( not ( = ?auto_2827 ?auto_2828 ) ) ( not ( = ?auto_2827 ?auto_2829 ) ) ( not ( = ?auto_2828 ?auto_2829 ) ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( IS-CRATE ?auto_2827 ) ( not ( = ?auto_2841 ?auto_2831 ) ) ( HOIST-AT ?auto_2840 ?auto_2841 ) ( AVAILABLE ?auto_2840 ) ( SURFACE-AT ?auto_2827 ?auto_2841 ) ( ON ?auto_2827 ?auto_2835 ) ( CLEAR ?auto_2827 ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2835 ) ) ( not ( = ?auto_2827 ?auto_2835 ) ) ( not ( = ?auto_2832 ?auto_2840 ) ) ( IS-CRATE ?auto_2826 ) ( AVAILABLE ?auto_2833 ) ( SURFACE-AT ?auto_2826 ?auto_2834 ) ( ON ?auto_2826 ?auto_2837 ) ( CLEAR ?auto_2826 ) ( not ( = ?auto_2825 ?auto_2826 ) ) ( not ( = ?auto_2825 ?auto_2837 ) ) ( not ( = ?auto_2826 ?auto_2837 ) ) ( SURFACE-AT ?auto_2824 ?auto_2831 ) ( CLEAR ?auto_2824 ) ( IS-CRATE ?auto_2825 ) ( AVAILABLE ?auto_2832 ) ( not ( = ?auto_2839 ?auto_2831 ) ) ( HOIST-AT ?auto_2836 ?auto_2839 ) ( AVAILABLE ?auto_2836 ) ( SURFACE-AT ?auto_2825 ?auto_2839 ) ( ON ?auto_2825 ?auto_2838 ) ( CLEAR ?auto_2825 ) ( TRUCK-AT ?auto_2830 ?auto_2831 ) ( not ( = ?auto_2824 ?auto_2825 ) ) ( not ( = ?auto_2824 ?auto_2838 ) ) ( not ( = ?auto_2825 ?auto_2838 ) ) ( not ( = ?auto_2832 ?auto_2836 ) ) ( not ( = ?auto_2824 ?auto_2826 ) ) ( not ( = ?auto_2824 ?auto_2837 ) ) ( not ( = ?auto_2826 ?auto_2838 ) ) ( not ( = ?auto_2834 ?auto_2839 ) ) ( not ( = ?auto_2833 ?auto_2836 ) ) ( not ( = ?auto_2837 ?auto_2838 ) ) ( not ( = ?auto_2824 ?auto_2827 ) ) ( not ( = ?auto_2824 ?auto_2835 ) ) ( not ( = ?auto_2825 ?auto_2827 ) ) ( not ( = ?auto_2825 ?auto_2835 ) ) ( not ( = ?auto_2827 ?auto_2837 ) ) ( not ( = ?auto_2827 ?auto_2838 ) ) ( not ( = ?auto_2841 ?auto_2834 ) ) ( not ( = ?auto_2841 ?auto_2839 ) ) ( not ( = ?auto_2840 ?auto_2833 ) ) ( not ( = ?auto_2840 ?auto_2836 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2835 ?auto_2838 ) ) ( not ( = ?auto_2824 ?auto_2828 ) ) ( not ( = ?auto_2824 ?auto_2829 ) ) ( not ( = ?auto_2825 ?auto_2828 ) ) ( not ( = ?auto_2825 ?auto_2829 ) ) ( not ( = ?auto_2826 ?auto_2828 ) ) ( not ( = ?auto_2826 ?auto_2829 ) ) ( not ( = ?auto_2828 ?auto_2835 ) ) ( not ( = ?auto_2828 ?auto_2837 ) ) ( not ( = ?auto_2828 ?auto_2838 ) ) ( not ( = ?auto_2829 ?auto_2835 ) ) ( not ( = ?auto_2829 ?auto_2837 ) ) ( not ( = ?auto_2829 ?auto_2838 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2824 ?auto_2825 ?auto_2826 ?auto_2827 )
      ( MAKE-1CRATE ?auto_2827 ?auto_2828 )
      ( MAKE-4CRATE-VERIFY ?auto_2824 ?auto_2825 ?auto_2826 ?auto_2827 ?auto_2828 ) )
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
      ?auto_2865 - HOIST
      ?auto_2867 - PLACE
      ?auto_2864 - PLACE
      ?auto_2868 - HOIST
      ?auto_2869 - SURFACE
      ?auto_2873 - PLACE
      ?auto_2872 - HOIST
      ?auto_2877 - SURFACE
      ?auto_2870 - PLACE
      ?auto_2874 - HOIST
      ?auto_2875 - SURFACE
      ?auto_2876 - SURFACE
      ?auto_2871 - SURFACE
      ?auto_2866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2865 ?auto_2867 ) ( IS-CRATE ?auto_2863 ) ( not ( = ?auto_2864 ?auto_2867 ) ) ( HOIST-AT ?auto_2868 ?auto_2864 ) ( SURFACE-AT ?auto_2863 ?auto_2864 ) ( ON ?auto_2863 ?auto_2869 ) ( CLEAR ?auto_2863 ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2869 ) ) ( not ( = ?auto_2863 ?auto_2869 ) ) ( not ( = ?auto_2865 ?auto_2868 ) ) ( IS-CRATE ?auto_2862 ) ( not ( = ?auto_2873 ?auto_2867 ) ) ( HOIST-AT ?auto_2872 ?auto_2873 ) ( SURFACE-AT ?auto_2862 ?auto_2873 ) ( ON ?auto_2862 ?auto_2877 ) ( CLEAR ?auto_2862 ) ( not ( = ?auto_2861 ?auto_2862 ) ) ( not ( = ?auto_2861 ?auto_2877 ) ) ( not ( = ?auto_2862 ?auto_2877 ) ) ( not ( = ?auto_2865 ?auto_2872 ) ) ( IS-CRATE ?auto_2861 ) ( not ( = ?auto_2870 ?auto_2867 ) ) ( HOIST-AT ?auto_2874 ?auto_2870 ) ( AVAILABLE ?auto_2874 ) ( SURFACE-AT ?auto_2861 ?auto_2870 ) ( ON ?auto_2861 ?auto_2875 ) ( CLEAR ?auto_2861 ) ( not ( = ?auto_2860 ?auto_2861 ) ) ( not ( = ?auto_2860 ?auto_2875 ) ) ( not ( = ?auto_2861 ?auto_2875 ) ) ( not ( = ?auto_2865 ?auto_2874 ) ) ( IS-CRATE ?auto_2860 ) ( AVAILABLE ?auto_2872 ) ( SURFACE-AT ?auto_2860 ?auto_2873 ) ( ON ?auto_2860 ?auto_2876 ) ( CLEAR ?auto_2860 ) ( not ( = ?auto_2859 ?auto_2860 ) ) ( not ( = ?auto_2859 ?auto_2876 ) ) ( not ( = ?auto_2860 ?auto_2876 ) ) ( SURFACE-AT ?auto_2858 ?auto_2867 ) ( CLEAR ?auto_2858 ) ( IS-CRATE ?auto_2859 ) ( AVAILABLE ?auto_2865 ) ( AVAILABLE ?auto_2868 ) ( SURFACE-AT ?auto_2859 ?auto_2864 ) ( ON ?auto_2859 ?auto_2871 ) ( CLEAR ?auto_2859 ) ( TRUCK-AT ?auto_2866 ?auto_2867 ) ( not ( = ?auto_2858 ?auto_2859 ) ) ( not ( = ?auto_2858 ?auto_2871 ) ) ( not ( = ?auto_2859 ?auto_2871 ) ) ( not ( = ?auto_2858 ?auto_2860 ) ) ( not ( = ?auto_2858 ?auto_2876 ) ) ( not ( = ?auto_2860 ?auto_2871 ) ) ( not ( = ?auto_2873 ?auto_2864 ) ) ( not ( = ?auto_2872 ?auto_2868 ) ) ( not ( = ?auto_2876 ?auto_2871 ) ) ( not ( = ?auto_2858 ?auto_2861 ) ) ( not ( = ?auto_2858 ?auto_2875 ) ) ( not ( = ?auto_2859 ?auto_2861 ) ) ( not ( = ?auto_2859 ?auto_2875 ) ) ( not ( = ?auto_2861 ?auto_2876 ) ) ( not ( = ?auto_2861 ?auto_2871 ) ) ( not ( = ?auto_2870 ?auto_2873 ) ) ( not ( = ?auto_2870 ?auto_2864 ) ) ( not ( = ?auto_2874 ?auto_2872 ) ) ( not ( = ?auto_2874 ?auto_2868 ) ) ( not ( = ?auto_2875 ?auto_2876 ) ) ( not ( = ?auto_2875 ?auto_2871 ) ) ( not ( = ?auto_2858 ?auto_2862 ) ) ( not ( = ?auto_2858 ?auto_2877 ) ) ( not ( = ?auto_2859 ?auto_2862 ) ) ( not ( = ?auto_2859 ?auto_2877 ) ) ( not ( = ?auto_2860 ?auto_2862 ) ) ( not ( = ?auto_2860 ?auto_2877 ) ) ( not ( = ?auto_2862 ?auto_2875 ) ) ( not ( = ?auto_2862 ?auto_2876 ) ) ( not ( = ?auto_2862 ?auto_2871 ) ) ( not ( = ?auto_2877 ?auto_2875 ) ) ( not ( = ?auto_2877 ?auto_2876 ) ) ( not ( = ?auto_2877 ?auto_2871 ) ) ( not ( = ?auto_2858 ?auto_2863 ) ) ( not ( = ?auto_2858 ?auto_2869 ) ) ( not ( = ?auto_2859 ?auto_2863 ) ) ( not ( = ?auto_2859 ?auto_2869 ) ) ( not ( = ?auto_2860 ?auto_2863 ) ) ( not ( = ?auto_2860 ?auto_2869 ) ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2861 ?auto_2869 ) ) ( not ( = ?auto_2863 ?auto_2877 ) ) ( not ( = ?auto_2863 ?auto_2875 ) ) ( not ( = ?auto_2863 ?auto_2876 ) ) ( not ( = ?auto_2863 ?auto_2871 ) ) ( not ( = ?auto_2869 ?auto_2877 ) ) ( not ( = ?auto_2869 ?auto_2875 ) ) ( not ( = ?auto_2869 ?auto_2876 ) ) ( not ( = ?auto_2869 ?auto_2871 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2858 ?auto_2859 ?auto_2860 ?auto_2861 ?auto_2862 )
      ( MAKE-1CRATE ?auto_2862 ?auto_2863 )
      ( MAKE-5CRATE-VERIFY ?auto_2858 ?auto_2859 ?auto_2860 ?auto_2861 ?auto_2862 ?auto_2863 ) )
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
      ?auto_2903 - HOIST
      ?auto_2902 - PLACE
      ?auto_2907 - PLACE
      ?auto_2905 - HOIST
      ?auto_2906 - SURFACE
      ?auto_2916 - SURFACE
      ?auto_2911 - PLACE
      ?auto_2914 - HOIST
      ?auto_2909 - SURFACE
      ?auto_2915 - PLACE
      ?auto_2910 - HOIST
      ?auto_2913 - SURFACE
      ?auto_2912 - SURFACE
      ?auto_2908 - SURFACE
      ?auto_2904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2903 ?auto_2902 ) ( IS-CRATE ?auto_2901 ) ( not ( = ?auto_2907 ?auto_2902 ) ) ( HOIST-AT ?auto_2905 ?auto_2907 ) ( SURFACE-AT ?auto_2901 ?auto_2907 ) ( ON ?auto_2901 ?auto_2906 ) ( CLEAR ?auto_2901 ) ( not ( = ?auto_2900 ?auto_2901 ) ) ( not ( = ?auto_2900 ?auto_2906 ) ) ( not ( = ?auto_2901 ?auto_2906 ) ) ( not ( = ?auto_2903 ?auto_2905 ) ) ( IS-CRATE ?auto_2900 ) ( SURFACE-AT ?auto_2900 ?auto_2907 ) ( ON ?auto_2900 ?auto_2916 ) ( CLEAR ?auto_2900 ) ( not ( = ?auto_2899 ?auto_2900 ) ) ( not ( = ?auto_2899 ?auto_2916 ) ) ( not ( = ?auto_2900 ?auto_2916 ) ) ( IS-CRATE ?auto_2899 ) ( not ( = ?auto_2911 ?auto_2902 ) ) ( HOIST-AT ?auto_2914 ?auto_2911 ) ( SURFACE-AT ?auto_2899 ?auto_2911 ) ( ON ?auto_2899 ?auto_2909 ) ( CLEAR ?auto_2899 ) ( not ( = ?auto_2898 ?auto_2899 ) ) ( not ( = ?auto_2898 ?auto_2909 ) ) ( not ( = ?auto_2899 ?auto_2909 ) ) ( not ( = ?auto_2903 ?auto_2914 ) ) ( IS-CRATE ?auto_2898 ) ( not ( = ?auto_2915 ?auto_2902 ) ) ( HOIST-AT ?auto_2910 ?auto_2915 ) ( AVAILABLE ?auto_2910 ) ( SURFACE-AT ?auto_2898 ?auto_2915 ) ( ON ?auto_2898 ?auto_2913 ) ( CLEAR ?auto_2898 ) ( not ( = ?auto_2897 ?auto_2898 ) ) ( not ( = ?auto_2897 ?auto_2913 ) ) ( not ( = ?auto_2898 ?auto_2913 ) ) ( not ( = ?auto_2903 ?auto_2910 ) ) ( IS-CRATE ?auto_2897 ) ( AVAILABLE ?auto_2914 ) ( SURFACE-AT ?auto_2897 ?auto_2911 ) ( ON ?auto_2897 ?auto_2912 ) ( CLEAR ?auto_2897 ) ( not ( = ?auto_2896 ?auto_2897 ) ) ( not ( = ?auto_2896 ?auto_2912 ) ) ( not ( = ?auto_2897 ?auto_2912 ) ) ( SURFACE-AT ?auto_2895 ?auto_2902 ) ( CLEAR ?auto_2895 ) ( IS-CRATE ?auto_2896 ) ( AVAILABLE ?auto_2903 ) ( AVAILABLE ?auto_2905 ) ( SURFACE-AT ?auto_2896 ?auto_2907 ) ( ON ?auto_2896 ?auto_2908 ) ( CLEAR ?auto_2896 ) ( TRUCK-AT ?auto_2904 ?auto_2902 ) ( not ( = ?auto_2895 ?auto_2896 ) ) ( not ( = ?auto_2895 ?auto_2908 ) ) ( not ( = ?auto_2896 ?auto_2908 ) ) ( not ( = ?auto_2895 ?auto_2897 ) ) ( not ( = ?auto_2895 ?auto_2912 ) ) ( not ( = ?auto_2897 ?auto_2908 ) ) ( not ( = ?auto_2911 ?auto_2907 ) ) ( not ( = ?auto_2914 ?auto_2905 ) ) ( not ( = ?auto_2912 ?auto_2908 ) ) ( not ( = ?auto_2895 ?auto_2898 ) ) ( not ( = ?auto_2895 ?auto_2913 ) ) ( not ( = ?auto_2896 ?auto_2898 ) ) ( not ( = ?auto_2896 ?auto_2913 ) ) ( not ( = ?auto_2898 ?auto_2912 ) ) ( not ( = ?auto_2898 ?auto_2908 ) ) ( not ( = ?auto_2915 ?auto_2911 ) ) ( not ( = ?auto_2915 ?auto_2907 ) ) ( not ( = ?auto_2910 ?auto_2914 ) ) ( not ( = ?auto_2910 ?auto_2905 ) ) ( not ( = ?auto_2913 ?auto_2912 ) ) ( not ( = ?auto_2913 ?auto_2908 ) ) ( not ( = ?auto_2895 ?auto_2899 ) ) ( not ( = ?auto_2895 ?auto_2909 ) ) ( not ( = ?auto_2896 ?auto_2899 ) ) ( not ( = ?auto_2896 ?auto_2909 ) ) ( not ( = ?auto_2897 ?auto_2899 ) ) ( not ( = ?auto_2897 ?auto_2909 ) ) ( not ( = ?auto_2899 ?auto_2913 ) ) ( not ( = ?auto_2899 ?auto_2912 ) ) ( not ( = ?auto_2899 ?auto_2908 ) ) ( not ( = ?auto_2909 ?auto_2913 ) ) ( not ( = ?auto_2909 ?auto_2912 ) ) ( not ( = ?auto_2909 ?auto_2908 ) ) ( not ( = ?auto_2895 ?auto_2900 ) ) ( not ( = ?auto_2895 ?auto_2916 ) ) ( not ( = ?auto_2896 ?auto_2900 ) ) ( not ( = ?auto_2896 ?auto_2916 ) ) ( not ( = ?auto_2897 ?auto_2900 ) ) ( not ( = ?auto_2897 ?auto_2916 ) ) ( not ( = ?auto_2898 ?auto_2900 ) ) ( not ( = ?auto_2898 ?auto_2916 ) ) ( not ( = ?auto_2900 ?auto_2909 ) ) ( not ( = ?auto_2900 ?auto_2913 ) ) ( not ( = ?auto_2900 ?auto_2912 ) ) ( not ( = ?auto_2900 ?auto_2908 ) ) ( not ( = ?auto_2916 ?auto_2909 ) ) ( not ( = ?auto_2916 ?auto_2913 ) ) ( not ( = ?auto_2916 ?auto_2912 ) ) ( not ( = ?auto_2916 ?auto_2908 ) ) ( not ( = ?auto_2895 ?auto_2901 ) ) ( not ( = ?auto_2895 ?auto_2906 ) ) ( not ( = ?auto_2896 ?auto_2901 ) ) ( not ( = ?auto_2896 ?auto_2906 ) ) ( not ( = ?auto_2897 ?auto_2901 ) ) ( not ( = ?auto_2897 ?auto_2906 ) ) ( not ( = ?auto_2898 ?auto_2901 ) ) ( not ( = ?auto_2898 ?auto_2906 ) ) ( not ( = ?auto_2899 ?auto_2901 ) ) ( not ( = ?auto_2899 ?auto_2906 ) ) ( not ( = ?auto_2901 ?auto_2916 ) ) ( not ( = ?auto_2901 ?auto_2909 ) ) ( not ( = ?auto_2901 ?auto_2913 ) ) ( not ( = ?auto_2901 ?auto_2912 ) ) ( not ( = ?auto_2901 ?auto_2908 ) ) ( not ( = ?auto_2906 ?auto_2916 ) ) ( not ( = ?auto_2906 ?auto_2909 ) ) ( not ( = ?auto_2906 ?auto_2913 ) ) ( not ( = ?auto_2906 ?auto_2912 ) ) ( not ( = ?auto_2906 ?auto_2908 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2895 ?auto_2896 ?auto_2897 ?auto_2898 ?auto_2899 ?auto_2900 )
      ( MAKE-1CRATE ?auto_2900 ?auto_2901 )
      ( MAKE-6CRATE-VERIFY ?auto_2895 ?auto_2896 ?auto_2897 ?auto_2898 ?auto_2899 ?auto_2900 ?auto_2901 ) )
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
      ?auto_2941 - SURFACE
      ?auto_2942 - SURFACE
    )
    :vars
    (
      ?auto_2947 - HOIST
      ?auto_2946 - PLACE
      ?auto_2944 - PLACE
      ?auto_2943 - HOIST
      ?auto_2948 - SURFACE
      ?auto_2958 - PLACE
      ?auto_2956 - HOIST
      ?auto_2957 - SURFACE
      ?auto_2954 - SURFACE
      ?auto_2951 - SURFACE
      ?auto_2950 - PLACE
      ?auto_2955 - HOIST
      ?auto_2949 - SURFACE
      ?auto_2953 - SURFACE
      ?auto_2952 - SURFACE
      ?auto_2945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2947 ?auto_2946 ) ( IS-CRATE ?auto_2942 ) ( not ( = ?auto_2944 ?auto_2946 ) ) ( HOIST-AT ?auto_2943 ?auto_2944 ) ( SURFACE-AT ?auto_2942 ?auto_2944 ) ( ON ?auto_2942 ?auto_2948 ) ( CLEAR ?auto_2942 ) ( not ( = ?auto_2941 ?auto_2942 ) ) ( not ( = ?auto_2941 ?auto_2948 ) ) ( not ( = ?auto_2942 ?auto_2948 ) ) ( not ( = ?auto_2947 ?auto_2943 ) ) ( IS-CRATE ?auto_2941 ) ( not ( = ?auto_2958 ?auto_2946 ) ) ( HOIST-AT ?auto_2956 ?auto_2958 ) ( SURFACE-AT ?auto_2941 ?auto_2958 ) ( ON ?auto_2941 ?auto_2957 ) ( CLEAR ?auto_2941 ) ( not ( = ?auto_2940 ?auto_2941 ) ) ( not ( = ?auto_2940 ?auto_2957 ) ) ( not ( = ?auto_2941 ?auto_2957 ) ) ( not ( = ?auto_2947 ?auto_2956 ) ) ( IS-CRATE ?auto_2940 ) ( SURFACE-AT ?auto_2940 ?auto_2958 ) ( ON ?auto_2940 ?auto_2954 ) ( CLEAR ?auto_2940 ) ( not ( = ?auto_2939 ?auto_2940 ) ) ( not ( = ?auto_2939 ?auto_2954 ) ) ( not ( = ?auto_2940 ?auto_2954 ) ) ( IS-CRATE ?auto_2939 ) ( SURFACE-AT ?auto_2939 ?auto_2944 ) ( ON ?auto_2939 ?auto_2951 ) ( CLEAR ?auto_2939 ) ( not ( = ?auto_2938 ?auto_2939 ) ) ( not ( = ?auto_2938 ?auto_2951 ) ) ( not ( = ?auto_2939 ?auto_2951 ) ) ( IS-CRATE ?auto_2938 ) ( not ( = ?auto_2950 ?auto_2946 ) ) ( HOIST-AT ?auto_2955 ?auto_2950 ) ( AVAILABLE ?auto_2955 ) ( SURFACE-AT ?auto_2938 ?auto_2950 ) ( ON ?auto_2938 ?auto_2949 ) ( CLEAR ?auto_2938 ) ( not ( = ?auto_2937 ?auto_2938 ) ) ( not ( = ?auto_2937 ?auto_2949 ) ) ( not ( = ?auto_2938 ?auto_2949 ) ) ( not ( = ?auto_2947 ?auto_2955 ) ) ( IS-CRATE ?auto_2937 ) ( AVAILABLE ?auto_2943 ) ( SURFACE-AT ?auto_2937 ?auto_2944 ) ( ON ?auto_2937 ?auto_2953 ) ( CLEAR ?auto_2937 ) ( not ( = ?auto_2936 ?auto_2937 ) ) ( not ( = ?auto_2936 ?auto_2953 ) ) ( not ( = ?auto_2937 ?auto_2953 ) ) ( SURFACE-AT ?auto_2935 ?auto_2946 ) ( CLEAR ?auto_2935 ) ( IS-CRATE ?auto_2936 ) ( AVAILABLE ?auto_2947 ) ( AVAILABLE ?auto_2956 ) ( SURFACE-AT ?auto_2936 ?auto_2958 ) ( ON ?auto_2936 ?auto_2952 ) ( CLEAR ?auto_2936 ) ( TRUCK-AT ?auto_2945 ?auto_2946 ) ( not ( = ?auto_2935 ?auto_2936 ) ) ( not ( = ?auto_2935 ?auto_2952 ) ) ( not ( = ?auto_2936 ?auto_2952 ) ) ( not ( = ?auto_2935 ?auto_2937 ) ) ( not ( = ?auto_2935 ?auto_2953 ) ) ( not ( = ?auto_2937 ?auto_2952 ) ) ( not ( = ?auto_2944 ?auto_2958 ) ) ( not ( = ?auto_2943 ?auto_2956 ) ) ( not ( = ?auto_2953 ?auto_2952 ) ) ( not ( = ?auto_2935 ?auto_2938 ) ) ( not ( = ?auto_2935 ?auto_2949 ) ) ( not ( = ?auto_2936 ?auto_2938 ) ) ( not ( = ?auto_2936 ?auto_2949 ) ) ( not ( = ?auto_2938 ?auto_2953 ) ) ( not ( = ?auto_2938 ?auto_2952 ) ) ( not ( = ?auto_2950 ?auto_2944 ) ) ( not ( = ?auto_2950 ?auto_2958 ) ) ( not ( = ?auto_2955 ?auto_2943 ) ) ( not ( = ?auto_2955 ?auto_2956 ) ) ( not ( = ?auto_2949 ?auto_2953 ) ) ( not ( = ?auto_2949 ?auto_2952 ) ) ( not ( = ?auto_2935 ?auto_2939 ) ) ( not ( = ?auto_2935 ?auto_2951 ) ) ( not ( = ?auto_2936 ?auto_2939 ) ) ( not ( = ?auto_2936 ?auto_2951 ) ) ( not ( = ?auto_2937 ?auto_2939 ) ) ( not ( = ?auto_2937 ?auto_2951 ) ) ( not ( = ?auto_2939 ?auto_2949 ) ) ( not ( = ?auto_2939 ?auto_2953 ) ) ( not ( = ?auto_2939 ?auto_2952 ) ) ( not ( = ?auto_2951 ?auto_2949 ) ) ( not ( = ?auto_2951 ?auto_2953 ) ) ( not ( = ?auto_2951 ?auto_2952 ) ) ( not ( = ?auto_2935 ?auto_2940 ) ) ( not ( = ?auto_2935 ?auto_2954 ) ) ( not ( = ?auto_2936 ?auto_2940 ) ) ( not ( = ?auto_2936 ?auto_2954 ) ) ( not ( = ?auto_2937 ?auto_2940 ) ) ( not ( = ?auto_2937 ?auto_2954 ) ) ( not ( = ?auto_2938 ?auto_2940 ) ) ( not ( = ?auto_2938 ?auto_2954 ) ) ( not ( = ?auto_2940 ?auto_2951 ) ) ( not ( = ?auto_2940 ?auto_2949 ) ) ( not ( = ?auto_2940 ?auto_2953 ) ) ( not ( = ?auto_2940 ?auto_2952 ) ) ( not ( = ?auto_2954 ?auto_2951 ) ) ( not ( = ?auto_2954 ?auto_2949 ) ) ( not ( = ?auto_2954 ?auto_2953 ) ) ( not ( = ?auto_2954 ?auto_2952 ) ) ( not ( = ?auto_2935 ?auto_2941 ) ) ( not ( = ?auto_2935 ?auto_2957 ) ) ( not ( = ?auto_2936 ?auto_2941 ) ) ( not ( = ?auto_2936 ?auto_2957 ) ) ( not ( = ?auto_2937 ?auto_2941 ) ) ( not ( = ?auto_2937 ?auto_2957 ) ) ( not ( = ?auto_2938 ?auto_2941 ) ) ( not ( = ?auto_2938 ?auto_2957 ) ) ( not ( = ?auto_2939 ?auto_2941 ) ) ( not ( = ?auto_2939 ?auto_2957 ) ) ( not ( = ?auto_2941 ?auto_2954 ) ) ( not ( = ?auto_2941 ?auto_2951 ) ) ( not ( = ?auto_2941 ?auto_2949 ) ) ( not ( = ?auto_2941 ?auto_2953 ) ) ( not ( = ?auto_2941 ?auto_2952 ) ) ( not ( = ?auto_2957 ?auto_2954 ) ) ( not ( = ?auto_2957 ?auto_2951 ) ) ( not ( = ?auto_2957 ?auto_2949 ) ) ( not ( = ?auto_2957 ?auto_2953 ) ) ( not ( = ?auto_2957 ?auto_2952 ) ) ( not ( = ?auto_2935 ?auto_2942 ) ) ( not ( = ?auto_2935 ?auto_2948 ) ) ( not ( = ?auto_2936 ?auto_2942 ) ) ( not ( = ?auto_2936 ?auto_2948 ) ) ( not ( = ?auto_2937 ?auto_2942 ) ) ( not ( = ?auto_2937 ?auto_2948 ) ) ( not ( = ?auto_2938 ?auto_2942 ) ) ( not ( = ?auto_2938 ?auto_2948 ) ) ( not ( = ?auto_2939 ?auto_2942 ) ) ( not ( = ?auto_2939 ?auto_2948 ) ) ( not ( = ?auto_2940 ?auto_2942 ) ) ( not ( = ?auto_2940 ?auto_2948 ) ) ( not ( = ?auto_2942 ?auto_2957 ) ) ( not ( = ?auto_2942 ?auto_2954 ) ) ( not ( = ?auto_2942 ?auto_2951 ) ) ( not ( = ?auto_2942 ?auto_2949 ) ) ( not ( = ?auto_2942 ?auto_2953 ) ) ( not ( = ?auto_2942 ?auto_2952 ) ) ( not ( = ?auto_2948 ?auto_2957 ) ) ( not ( = ?auto_2948 ?auto_2954 ) ) ( not ( = ?auto_2948 ?auto_2951 ) ) ( not ( = ?auto_2948 ?auto_2949 ) ) ( not ( = ?auto_2948 ?auto_2953 ) ) ( not ( = ?auto_2948 ?auto_2952 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_2935 ?auto_2936 ?auto_2937 ?auto_2938 ?auto_2939 ?auto_2940 ?auto_2941 )
      ( MAKE-1CRATE ?auto_2941 ?auto_2942 )
      ( MAKE-7CRATE-VERIFY ?auto_2935 ?auto_2936 ?auto_2937 ?auto_2938 ?auto_2939 ?auto_2940 ?auto_2941 ?auto_2942 ) )
  )

)

