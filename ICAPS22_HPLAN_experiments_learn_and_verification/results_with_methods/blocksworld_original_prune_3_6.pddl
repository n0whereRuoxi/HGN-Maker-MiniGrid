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
      ?auto_2815 - BLOCK
      ?auto_2816 - BLOCK
      ?auto_2817 - BLOCK
    )
    :vars
    (
      ?auto_2818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2818 ?auto_2817 ) ( CLEAR ?auto_2818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2815 ) ( ON ?auto_2816 ?auto_2815 ) ( ON ?auto_2817 ?auto_2816 ) ( not ( = ?auto_2815 ?auto_2816 ) ) ( not ( = ?auto_2815 ?auto_2817 ) ) ( not ( = ?auto_2815 ?auto_2818 ) ) ( not ( = ?auto_2816 ?auto_2817 ) ) ( not ( = ?auto_2816 ?auto_2818 ) ) ( not ( = ?auto_2817 ?auto_2818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2818 ?auto_2817 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2820 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2820 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2821 - BLOCK
    )
    :vars
    (
      ?auto_2822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2821 ?auto_2822 ) ( CLEAR ?auto_2821 ) ( HAND-EMPTY ) ( not ( = ?auto_2821 ?auto_2822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2821 ?auto_2822 )
      ( MAKE-1PILE ?auto_2821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2825 - BLOCK
      ?auto_2826 - BLOCK
    )
    :vars
    (
      ?auto_2827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2827 ?auto_2826 ) ( CLEAR ?auto_2827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2825 ) ( ON ?auto_2826 ?auto_2825 ) ( not ( = ?auto_2825 ?auto_2826 ) ) ( not ( = ?auto_2825 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2827 ?auto_2826 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2828 - BLOCK
      ?auto_2829 - BLOCK
    )
    :vars
    (
      ?auto_2830 - BLOCK
      ?auto_2831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2830 ?auto_2829 ) ( CLEAR ?auto_2830 ) ( ON-TABLE ?auto_2828 ) ( ON ?auto_2829 ?auto_2828 ) ( not ( = ?auto_2828 ?auto_2829 ) ) ( not ( = ?auto_2828 ?auto_2830 ) ) ( not ( = ?auto_2829 ?auto_2830 ) ) ( HOLDING ?auto_2831 ) ( not ( = ?auto_2828 ?auto_2831 ) ) ( not ( = ?auto_2829 ?auto_2831 ) ) ( not ( = ?auto_2830 ?auto_2831 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2831 )
      ( MAKE-2PILE ?auto_2828 ?auto_2829 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2832 - BLOCK
      ?auto_2833 - BLOCK
    )
    :vars
    (
      ?auto_2835 - BLOCK
      ?auto_2834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2835 ?auto_2833 ) ( ON-TABLE ?auto_2832 ) ( ON ?auto_2833 ?auto_2832 ) ( not ( = ?auto_2832 ?auto_2833 ) ) ( not ( = ?auto_2832 ?auto_2835 ) ) ( not ( = ?auto_2833 ?auto_2835 ) ) ( not ( = ?auto_2832 ?auto_2834 ) ) ( not ( = ?auto_2833 ?auto_2834 ) ) ( not ( = ?auto_2835 ?auto_2834 ) ) ( ON ?auto_2834 ?auto_2835 ) ( CLEAR ?auto_2834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2832 ?auto_2833 ?auto_2835 )
      ( MAKE-2PILE ?auto_2832 ?auto_2833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2838 - BLOCK
      ?auto_2839 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2839 ) ( CLEAR ?auto_2838 ) ( ON-TABLE ?auto_2838 ) ( not ( = ?auto_2838 ?auto_2839 ) ) )
    :subtasks
    ( ( !STACK ?auto_2839 ?auto_2838 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2840 - BLOCK
      ?auto_2841 - BLOCK
    )
    :vars
    (
      ?auto_2842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2840 ) ( ON-TABLE ?auto_2840 ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( ON ?auto_2841 ?auto_2842 ) ( CLEAR ?auto_2841 ) ( HAND-EMPTY ) ( not ( = ?auto_2840 ?auto_2842 ) ) ( not ( = ?auto_2841 ?auto_2842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2841 ?auto_2842 )
      ( MAKE-2PILE ?auto_2840 ?auto_2841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2843 - BLOCK
      ?auto_2844 - BLOCK
    )
    :vars
    (
      ?auto_2845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2843 ?auto_2844 ) ) ( ON ?auto_2844 ?auto_2845 ) ( CLEAR ?auto_2844 ) ( not ( = ?auto_2843 ?auto_2845 ) ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( HOLDING ?auto_2843 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2843 )
      ( MAKE-2PILE ?auto_2843 ?auto_2844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2846 - BLOCK
      ?auto_2847 - BLOCK
    )
    :vars
    (
      ?auto_2848 - BLOCK
      ?auto_2849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2846 ?auto_2847 ) ) ( ON ?auto_2847 ?auto_2848 ) ( not ( = ?auto_2846 ?auto_2848 ) ) ( not ( = ?auto_2847 ?auto_2848 ) ) ( ON ?auto_2846 ?auto_2847 ) ( CLEAR ?auto_2846 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2849 ) ( ON ?auto_2848 ?auto_2849 ) ( not ( = ?auto_2849 ?auto_2848 ) ) ( not ( = ?auto_2849 ?auto_2847 ) ) ( not ( = ?auto_2849 ?auto_2846 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2849 ?auto_2848 ?auto_2847 )
      ( MAKE-2PILE ?auto_2846 ?auto_2847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2851 - BLOCK
    )
    :vars
    (
      ?auto_2852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2852 ?auto_2851 ) ( CLEAR ?auto_2852 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2851 ) ( not ( = ?auto_2851 ?auto_2852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2852 ?auto_2851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2853 - BLOCK
    )
    :vars
    (
      ?auto_2854 - BLOCK
      ?auto_2855 - BLOCK
      ?auto_2856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2854 ?auto_2853 ) ( CLEAR ?auto_2854 ) ( ON-TABLE ?auto_2853 ) ( not ( = ?auto_2853 ?auto_2854 ) ) ( HOLDING ?auto_2855 ) ( CLEAR ?auto_2856 ) ( not ( = ?auto_2853 ?auto_2855 ) ) ( not ( = ?auto_2853 ?auto_2856 ) ) ( not ( = ?auto_2854 ?auto_2855 ) ) ( not ( = ?auto_2854 ?auto_2856 ) ) ( not ( = ?auto_2855 ?auto_2856 ) ) )
    :subtasks
    ( ( !STACK ?auto_2855 ?auto_2856 )
      ( MAKE-1PILE ?auto_2853 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2943 - BLOCK
    )
    :vars
    (
      ?auto_2944 - BLOCK
      ?auto_2945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2944 ?auto_2943 ) ( ON-TABLE ?auto_2943 ) ( not ( = ?auto_2943 ?auto_2944 ) ) ( not ( = ?auto_2943 ?auto_2945 ) ) ( not ( = ?auto_2944 ?auto_2945 ) ) ( ON ?auto_2945 ?auto_2944 ) ( CLEAR ?auto_2945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2943 ?auto_2944 )
      ( MAKE-1PILE ?auto_2943 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2861 - BLOCK
    )
    :vars
    (
      ?auto_2863 - BLOCK
      ?auto_2864 - BLOCK
      ?auto_2862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2863 ?auto_2861 ) ( ON-TABLE ?auto_2861 ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2861 ?auto_2864 ) ) ( not ( = ?auto_2861 ?auto_2862 ) ) ( not ( = ?auto_2863 ?auto_2864 ) ) ( not ( = ?auto_2863 ?auto_2862 ) ) ( not ( = ?auto_2864 ?auto_2862 ) ) ( ON ?auto_2864 ?auto_2863 ) ( CLEAR ?auto_2864 ) ( HOLDING ?auto_2862 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2862 )
      ( MAKE-1PILE ?auto_2861 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2865 - BLOCK
    )
    :vars
    (
      ?auto_2868 - BLOCK
      ?auto_2866 - BLOCK
      ?auto_2867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2868 ?auto_2865 ) ( ON-TABLE ?auto_2865 ) ( not ( = ?auto_2865 ?auto_2868 ) ) ( not ( = ?auto_2865 ?auto_2866 ) ) ( not ( = ?auto_2865 ?auto_2867 ) ) ( not ( = ?auto_2868 ?auto_2866 ) ) ( not ( = ?auto_2868 ?auto_2867 ) ) ( not ( = ?auto_2866 ?auto_2867 ) ) ( ON ?auto_2866 ?auto_2868 ) ( ON ?auto_2867 ?auto_2866 ) ( CLEAR ?auto_2867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2865 ?auto_2868 ?auto_2866 )
      ( MAKE-1PILE ?auto_2865 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2872 - BLOCK
      ?auto_2873 - BLOCK
      ?auto_2874 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2874 ) ( CLEAR ?auto_2873 ) ( ON-TABLE ?auto_2872 ) ( ON ?auto_2873 ?auto_2872 ) ( not ( = ?auto_2872 ?auto_2873 ) ) ( not ( = ?auto_2872 ?auto_2874 ) ) ( not ( = ?auto_2873 ?auto_2874 ) ) )
    :subtasks
    ( ( !STACK ?auto_2874 ?auto_2873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2875 - BLOCK
      ?auto_2876 - BLOCK
      ?auto_2877 - BLOCK
    )
    :vars
    (
      ?auto_2878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2876 ) ( ON-TABLE ?auto_2875 ) ( ON ?auto_2876 ?auto_2875 ) ( not ( = ?auto_2875 ?auto_2876 ) ) ( not ( = ?auto_2875 ?auto_2877 ) ) ( not ( = ?auto_2876 ?auto_2877 ) ) ( ON ?auto_2877 ?auto_2878 ) ( CLEAR ?auto_2877 ) ( HAND-EMPTY ) ( not ( = ?auto_2875 ?auto_2878 ) ) ( not ( = ?auto_2876 ?auto_2878 ) ) ( not ( = ?auto_2877 ?auto_2878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2877 ?auto_2878 )
      ( MAKE-3PILE ?auto_2875 ?auto_2876 ?auto_2877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2879 - BLOCK
      ?auto_2880 - BLOCK
      ?auto_2881 - BLOCK
    )
    :vars
    (
      ?auto_2882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2879 ) ( not ( = ?auto_2879 ?auto_2880 ) ) ( not ( = ?auto_2879 ?auto_2881 ) ) ( not ( = ?auto_2880 ?auto_2881 ) ) ( ON ?auto_2881 ?auto_2882 ) ( CLEAR ?auto_2881 ) ( not ( = ?auto_2879 ?auto_2882 ) ) ( not ( = ?auto_2880 ?auto_2882 ) ) ( not ( = ?auto_2881 ?auto_2882 ) ) ( HOLDING ?auto_2880 ) ( CLEAR ?auto_2879 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2879 ?auto_2880 )
      ( MAKE-3PILE ?auto_2879 ?auto_2880 ?auto_2881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2883 - BLOCK
      ?auto_2884 - BLOCK
      ?auto_2885 - BLOCK
    )
    :vars
    (
      ?auto_2886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2883 ) ( not ( = ?auto_2883 ?auto_2884 ) ) ( not ( = ?auto_2883 ?auto_2885 ) ) ( not ( = ?auto_2884 ?auto_2885 ) ) ( ON ?auto_2885 ?auto_2886 ) ( not ( = ?auto_2883 ?auto_2886 ) ) ( not ( = ?auto_2884 ?auto_2886 ) ) ( not ( = ?auto_2885 ?auto_2886 ) ) ( CLEAR ?auto_2883 ) ( ON ?auto_2884 ?auto_2885 ) ( CLEAR ?auto_2884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2886 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2886 ?auto_2885 )
      ( MAKE-3PILE ?auto_2883 ?auto_2884 ?auto_2885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2887 - BLOCK
      ?auto_2888 - BLOCK
      ?auto_2889 - BLOCK
    )
    :vars
    (
      ?auto_2890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2887 ?auto_2888 ) ) ( not ( = ?auto_2887 ?auto_2889 ) ) ( not ( = ?auto_2888 ?auto_2889 ) ) ( ON ?auto_2889 ?auto_2890 ) ( not ( = ?auto_2887 ?auto_2890 ) ) ( not ( = ?auto_2888 ?auto_2890 ) ) ( not ( = ?auto_2889 ?auto_2890 ) ) ( ON ?auto_2888 ?auto_2889 ) ( CLEAR ?auto_2888 ) ( ON-TABLE ?auto_2890 ) ( HOLDING ?auto_2887 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2887 )
      ( MAKE-3PILE ?auto_2887 ?auto_2888 ?auto_2889 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2891 - BLOCK
      ?auto_2892 - BLOCK
      ?auto_2893 - BLOCK
    )
    :vars
    (
      ?auto_2894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2891 ?auto_2892 ) ) ( not ( = ?auto_2891 ?auto_2893 ) ) ( not ( = ?auto_2892 ?auto_2893 ) ) ( ON ?auto_2893 ?auto_2894 ) ( not ( = ?auto_2891 ?auto_2894 ) ) ( not ( = ?auto_2892 ?auto_2894 ) ) ( not ( = ?auto_2893 ?auto_2894 ) ) ( ON ?auto_2892 ?auto_2893 ) ( ON-TABLE ?auto_2894 ) ( ON ?auto_2891 ?auto_2892 ) ( CLEAR ?auto_2891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2894 ?auto_2893 ?auto_2892 )
      ( MAKE-3PILE ?auto_2891 ?auto_2892 ?auto_2893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2921 - BLOCK
    )
    :vars
    (
      ?auto_2922 - BLOCK
      ?auto_2923 - BLOCK
      ?auto_2924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2921 ?auto_2922 ) ( CLEAR ?auto_2921 ) ( not ( = ?auto_2921 ?auto_2922 ) ) ( HOLDING ?auto_2923 ) ( CLEAR ?auto_2924 ) ( not ( = ?auto_2921 ?auto_2923 ) ) ( not ( = ?auto_2921 ?auto_2924 ) ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2922 ?auto_2924 ) ) ( not ( = ?auto_2923 ?auto_2924 ) ) )
    :subtasks
    ( ( !STACK ?auto_2923 ?auto_2924 )
      ( MAKE-1PILE ?auto_2921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2925 - BLOCK
    )
    :vars
    (
      ?auto_2927 - BLOCK
      ?auto_2928 - BLOCK
      ?auto_2926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2925 ?auto_2927 ) ( not ( = ?auto_2925 ?auto_2927 ) ) ( CLEAR ?auto_2928 ) ( not ( = ?auto_2925 ?auto_2926 ) ) ( not ( = ?auto_2925 ?auto_2928 ) ) ( not ( = ?auto_2927 ?auto_2926 ) ) ( not ( = ?auto_2927 ?auto_2928 ) ) ( not ( = ?auto_2926 ?auto_2928 ) ) ( ON ?auto_2926 ?auto_2925 ) ( CLEAR ?auto_2926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2927 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2927 ?auto_2925 )
      ( MAKE-1PILE ?auto_2925 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2929 - BLOCK
    )
    :vars
    (
      ?auto_2931 - BLOCK
      ?auto_2932 - BLOCK
      ?auto_2930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2929 ?auto_2931 ) ( not ( = ?auto_2929 ?auto_2931 ) ) ( not ( = ?auto_2929 ?auto_2932 ) ) ( not ( = ?auto_2929 ?auto_2930 ) ) ( not ( = ?auto_2931 ?auto_2932 ) ) ( not ( = ?auto_2931 ?auto_2930 ) ) ( not ( = ?auto_2932 ?auto_2930 ) ) ( ON ?auto_2932 ?auto_2929 ) ( CLEAR ?auto_2932 ) ( ON-TABLE ?auto_2931 ) ( HOLDING ?auto_2930 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2930 )
      ( MAKE-1PILE ?auto_2929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2933 - BLOCK
    )
    :vars
    (
      ?auto_2934 - BLOCK
      ?auto_2935 - BLOCK
      ?auto_2936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2933 ?auto_2934 ) ( not ( = ?auto_2933 ?auto_2934 ) ) ( not ( = ?auto_2933 ?auto_2935 ) ) ( not ( = ?auto_2933 ?auto_2936 ) ) ( not ( = ?auto_2934 ?auto_2935 ) ) ( not ( = ?auto_2934 ?auto_2936 ) ) ( not ( = ?auto_2935 ?auto_2936 ) ) ( ON ?auto_2935 ?auto_2933 ) ( ON-TABLE ?auto_2934 ) ( ON ?auto_2936 ?auto_2935 ) ( CLEAR ?auto_2936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2934 ?auto_2933 ?auto_2935 )
      ( MAKE-1PILE ?auto_2933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2940 - BLOCK
    )
    :vars
    (
      ?auto_2941 - BLOCK
      ?auto_2942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2941 ?auto_2940 ) ( CLEAR ?auto_2941 ) ( ON-TABLE ?auto_2940 ) ( not ( = ?auto_2940 ?auto_2941 ) ) ( HOLDING ?auto_2942 ) ( not ( = ?auto_2940 ?auto_2942 ) ) ( not ( = ?auto_2941 ?auto_2942 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2942 )
      ( MAKE-1PILE ?auto_2940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2965 - BLOCK
      ?auto_2966 - BLOCK
    )
    :vars
    (
      ?auto_2967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2965 ?auto_2966 ) ) ( ON ?auto_2966 ?auto_2967 ) ( not ( = ?auto_2965 ?auto_2967 ) ) ( not ( = ?auto_2966 ?auto_2967 ) ) ( ON ?auto_2965 ?auto_2966 ) ( CLEAR ?auto_2965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2967 ?auto_2966 )
      ( MAKE-2PILE ?auto_2965 ?auto_2966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2970 - BLOCK
      ?auto_2971 - BLOCK
    )
    :vars
    (
      ?auto_2972 - BLOCK
      ?auto_2973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2970 ?auto_2971 ) ) ( ON ?auto_2971 ?auto_2972 ) ( CLEAR ?auto_2971 ) ( not ( = ?auto_2970 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2972 ) ) ( ON ?auto_2970 ?auto_2973 ) ( CLEAR ?auto_2970 ) ( HAND-EMPTY ) ( not ( = ?auto_2970 ?auto_2973 ) ) ( not ( = ?auto_2971 ?auto_2973 ) ) ( not ( = ?auto_2972 ?auto_2973 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2970 ?auto_2973 )
      ( MAKE-2PILE ?auto_2970 ?auto_2971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2974 - BLOCK
      ?auto_2975 - BLOCK
    )
    :vars
    (
      ?auto_2977 - BLOCK
      ?auto_2976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2974 ?auto_2975 ) ) ( not ( = ?auto_2974 ?auto_2977 ) ) ( not ( = ?auto_2975 ?auto_2977 ) ) ( ON ?auto_2974 ?auto_2976 ) ( CLEAR ?auto_2974 ) ( not ( = ?auto_2974 ?auto_2976 ) ) ( not ( = ?auto_2975 ?auto_2976 ) ) ( not ( = ?auto_2977 ?auto_2976 ) ) ( HOLDING ?auto_2975 ) ( CLEAR ?auto_2977 ) ( ON-TABLE ?auto_2977 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2977 ?auto_2975 )
      ( MAKE-2PILE ?auto_2974 ?auto_2975 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2978 - BLOCK
      ?auto_2979 - BLOCK
    )
    :vars
    (
      ?auto_2980 - BLOCK
      ?auto_2981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2978 ?auto_2979 ) ) ( not ( = ?auto_2978 ?auto_2980 ) ) ( not ( = ?auto_2979 ?auto_2980 ) ) ( ON ?auto_2978 ?auto_2981 ) ( not ( = ?auto_2978 ?auto_2981 ) ) ( not ( = ?auto_2979 ?auto_2981 ) ) ( not ( = ?auto_2980 ?auto_2981 ) ) ( CLEAR ?auto_2980 ) ( ON-TABLE ?auto_2980 ) ( ON ?auto_2979 ?auto_2978 ) ( CLEAR ?auto_2979 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2981 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2981 ?auto_2978 )
      ( MAKE-2PILE ?auto_2978 ?auto_2979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2982 - BLOCK
      ?auto_2983 - BLOCK
    )
    :vars
    (
      ?auto_2985 - BLOCK
      ?auto_2984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2982 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2985 ) ) ( not ( = ?auto_2983 ?auto_2985 ) ) ( ON ?auto_2982 ?auto_2984 ) ( not ( = ?auto_2982 ?auto_2984 ) ) ( not ( = ?auto_2983 ?auto_2984 ) ) ( not ( = ?auto_2985 ?auto_2984 ) ) ( ON ?auto_2983 ?auto_2982 ) ( CLEAR ?auto_2983 ) ( ON-TABLE ?auto_2984 ) ( HOLDING ?auto_2985 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2985 )
      ( MAKE-2PILE ?auto_2982 ?auto_2983 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2986 - BLOCK
      ?auto_2987 - BLOCK
    )
    :vars
    (
      ?auto_2989 - BLOCK
      ?auto_2988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2986 ?auto_2987 ) ) ( not ( = ?auto_2986 ?auto_2989 ) ) ( not ( = ?auto_2987 ?auto_2989 ) ) ( ON ?auto_2986 ?auto_2988 ) ( not ( = ?auto_2986 ?auto_2988 ) ) ( not ( = ?auto_2987 ?auto_2988 ) ) ( not ( = ?auto_2989 ?auto_2988 ) ) ( ON ?auto_2987 ?auto_2986 ) ( ON-TABLE ?auto_2988 ) ( ON ?auto_2989 ?auto_2987 ) ( CLEAR ?auto_2989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2988 ?auto_2986 ?auto_2987 )
      ( MAKE-2PILE ?auto_2986 ?auto_2987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2996 - BLOCK
      ?auto_2997 - BLOCK
      ?auto_2998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2997 ) ( ON-TABLE ?auto_2996 ) ( ON ?auto_2997 ?auto_2996 ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_2998 ) ) ( not ( = ?auto_2997 ?auto_2998 ) ) ( ON-TABLE ?auto_2998 ) ( CLEAR ?auto_2998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_2998 )
      ( MAKE-3PILE ?auto_2996 ?auto_2997 ?auto_2998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2999 - BLOCK
      ?auto_3000 - BLOCK
      ?auto_3001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2999 ) ( not ( = ?auto_2999 ?auto_3000 ) ) ( not ( = ?auto_2999 ?auto_3001 ) ) ( not ( = ?auto_3000 ?auto_3001 ) ) ( ON-TABLE ?auto_3001 ) ( CLEAR ?auto_3001 ) ( HOLDING ?auto_3000 ) ( CLEAR ?auto_2999 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2999 ?auto_3000 )
      ( MAKE-3PILE ?auto_2999 ?auto_3000 ?auto_3001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3002 - BLOCK
      ?auto_3003 - BLOCK
      ?auto_3004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3002 ) ( not ( = ?auto_3002 ?auto_3003 ) ) ( not ( = ?auto_3002 ?auto_3004 ) ) ( not ( = ?auto_3003 ?auto_3004 ) ) ( ON-TABLE ?auto_3004 ) ( CLEAR ?auto_3002 ) ( ON ?auto_3003 ?auto_3004 ) ( CLEAR ?auto_3003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3004 )
      ( MAKE-3PILE ?auto_3002 ?auto_3003 ?auto_3004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3005 - BLOCK
      ?auto_3006 - BLOCK
      ?auto_3007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3005 ?auto_3006 ) ) ( not ( = ?auto_3005 ?auto_3007 ) ) ( not ( = ?auto_3006 ?auto_3007 ) ) ( ON-TABLE ?auto_3007 ) ( ON ?auto_3006 ?auto_3007 ) ( CLEAR ?auto_3006 ) ( HOLDING ?auto_3005 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3005 )
      ( MAKE-3PILE ?auto_3005 ?auto_3006 ?auto_3007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3008 - BLOCK
      ?auto_3009 - BLOCK
      ?auto_3010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3008 ?auto_3009 ) ) ( not ( = ?auto_3008 ?auto_3010 ) ) ( not ( = ?auto_3009 ?auto_3010 ) ) ( ON-TABLE ?auto_3010 ) ( ON ?auto_3009 ?auto_3010 ) ( ON ?auto_3008 ?auto_3009 ) ( CLEAR ?auto_3008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3010 ?auto_3009 )
      ( MAKE-3PILE ?auto_3008 ?auto_3009 ?auto_3010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3014 - BLOCK
      ?auto_3015 - BLOCK
      ?auto_3016 - BLOCK
    )
    :vars
    (
      ?auto_3017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3014 ?auto_3015 ) ) ( not ( = ?auto_3014 ?auto_3016 ) ) ( not ( = ?auto_3015 ?auto_3016 ) ) ( ON-TABLE ?auto_3016 ) ( ON ?auto_3015 ?auto_3016 ) ( CLEAR ?auto_3015 ) ( ON ?auto_3014 ?auto_3017 ) ( CLEAR ?auto_3014 ) ( HAND-EMPTY ) ( not ( = ?auto_3014 ?auto_3017 ) ) ( not ( = ?auto_3015 ?auto_3017 ) ) ( not ( = ?auto_3016 ?auto_3017 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3014 ?auto_3017 )
      ( MAKE-3PILE ?auto_3014 ?auto_3015 ?auto_3016 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3018 - BLOCK
      ?auto_3019 - BLOCK
      ?auto_3020 - BLOCK
    )
    :vars
    (
      ?auto_3021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3018 ?auto_3019 ) ) ( not ( = ?auto_3018 ?auto_3020 ) ) ( not ( = ?auto_3019 ?auto_3020 ) ) ( ON-TABLE ?auto_3020 ) ( ON ?auto_3018 ?auto_3021 ) ( CLEAR ?auto_3018 ) ( not ( = ?auto_3018 ?auto_3021 ) ) ( not ( = ?auto_3019 ?auto_3021 ) ) ( not ( = ?auto_3020 ?auto_3021 ) ) ( HOLDING ?auto_3019 ) ( CLEAR ?auto_3020 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3020 ?auto_3019 )
      ( MAKE-3PILE ?auto_3018 ?auto_3019 ?auto_3020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3022 - BLOCK
      ?auto_3023 - BLOCK
      ?auto_3024 - BLOCK
    )
    :vars
    (
      ?auto_3025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3022 ?auto_3023 ) ) ( not ( = ?auto_3022 ?auto_3024 ) ) ( not ( = ?auto_3023 ?auto_3024 ) ) ( ON-TABLE ?auto_3024 ) ( ON ?auto_3022 ?auto_3025 ) ( not ( = ?auto_3022 ?auto_3025 ) ) ( not ( = ?auto_3023 ?auto_3025 ) ) ( not ( = ?auto_3024 ?auto_3025 ) ) ( CLEAR ?auto_3024 ) ( ON ?auto_3023 ?auto_3022 ) ( CLEAR ?auto_3023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3025 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3025 ?auto_3022 )
      ( MAKE-3PILE ?auto_3022 ?auto_3023 ?auto_3024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3026 - BLOCK
      ?auto_3027 - BLOCK
      ?auto_3028 - BLOCK
    )
    :vars
    (
      ?auto_3029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3026 ?auto_3027 ) ) ( not ( = ?auto_3026 ?auto_3028 ) ) ( not ( = ?auto_3027 ?auto_3028 ) ) ( ON ?auto_3026 ?auto_3029 ) ( not ( = ?auto_3026 ?auto_3029 ) ) ( not ( = ?auto_3027 ?auto_3029 ) ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( ON ?auto_3027 ?auto_3026 ) ( CLEAR ?auto_3027 ) ( ON-TABLE ?auto_3029 ) ( HOLDING ?auto_3028 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3028 )
      ( MAKE-3PILE ?auto_3026 ?auto_3027 ?auto_3028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3030 - BLOCK
      ?auto_3031 - BLOCK
      ?auto_3032 - BLOCK
    )
    :vars
    (
      ?auto_3033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3030 ?auto_3031 ) ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( not ( = ?auto_3031 ?auto_3032 ) ) ( ON ?auto_3030 ?auto_3033 ) ( not ( = ?auto_3030 ?auto_3033 ) ) ( not ( = ?auto_3031 ?auto_3033 ) ) ( not ( = ?auto_3032 ?auto_3033 ) ) ( ON ?auto_3031 ?auto_3030 ) ( ON-TABLE ?auto_3033 ) ( ON ?auto_3032 ?auto_3031 ) ( CLEAR ?auto_3032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3033 ?auto_3030 ?auto_3031 )
      ( MAKE-3PILE ?auto_3030 ?auto_3031 ?auto_3032 ) )
  )

)

