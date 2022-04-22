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
      ?auto_2873 - BLOCK
      ?auto_2874 - BLOCK
      ?auto_2875 - BLOCK
    )
    :vars
    (
      ?auto_2876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2876 ?auto_2875 ) ( CLEAR ?auto_2876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2873 ) ( ON ?auto_2874 ?auto_2873 ) ( ON ?auto_2875 ?auto_2874 ) ( not ( = ?auto_2873 ?auto_2874 ) ) ( not ( = ?auto_2873 ?auto_2875 ) ) ( not ( = ?auto_2873 ?auto_2876 ) ) ( not ( = ?auto_2874 ?auto_2875 ) ) ( not ( = ?auto_2874 ?auto_2876 ) ) ( not ( = ?auto_2875 ?auto_2876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2876 ?auto_2875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2878 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2879 - BLOCK
    )
    :vars
    (
      ?auto_2880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2879 ?auto_2880 ) ( CLEAR ?auto_2879 ) ( HAND-EMPTY ) ( not ( = ?auto_2879 ?auto_2880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2879 ?auto_2880 )
      ( MAKE-1PILE ?auto_2879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2883 - BLOCK
      ?auto_2884 - BLOCK
    )
    :vars
    (
      ?auto_2885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2885 ?auto_2884 ) ( CLEAR ?auto_2885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2883 ) ( ON ?auto_2884 ?auto_2883 ) ( not ( = ?auto_2883 ?auto_2884 ) ) ( not ( = ?auto_2883 ?auto_2885 ) ) ( not ( = ?auto_2884 ?auto_2885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2885 ?auto_2884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2886 - BLOCK
      ?auto_2887 - BLOCK
    )
    :vars
    (
      ?auto_2888 - BLOCK
      ?auto_2889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2888 ?auto_2887 ) ( CLEAR ?auto_2888 ) ( ON-TABLE ?auto_2886 ) ( ON ?auto_2887 ?auto_2886 ) ( not ( = ?auto_2886 ?auto_2887 ) ) ( not ( = ?auto_2886 ?auto_2888 ) ) ( not ( = ?auto_2887 ?auto_2888 ) ) ( HOLDING ?auto_2889 ) ( not ( = ?auto_2886 ?auto_2889 ) ) ( not ( = ?auto_2887 ?auto_2889 ) ) ( not ( = ?auto_2888 ?auto_2889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2889 )
      ( MAKE-2PILE ?auto_2886 ?auto_2887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2890 - BLOCK
      ?auto_2891 - BLOCK
    )
    :vars
    (
      ?auto_2892 - BLOCK
      ?auto_2893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2892 ?auto_2891 ) ( ON-TABLE ?auto_2890 ) ( ON ?auto_2891 ?auto_2890 ) ( not ( = ?auto_2890 ?auto_2891 ) ) ( not ( = ?auto_2890 ?auto_2892 ) ) ( not ( = ?auto_2891 ?auto_2892 ) ) ( not ( = ?auto_2890 ?auto_2893 ) ) ( not ( = ?auto_2891 ?auto_2893 ) ) ( not ( = ?auto_2892 ?auto_2893 ) ) ( ON ?auto_2893 ?auto_2892 ) ( CLEAR ?auto_2893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2890 ?auto_2891 ?auto_2892 )
      ( MAKE-2PILE ?auto_2890 ?auto_2891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2896 - BLOCK
      ?auto_2897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2897 ) ( CLEAR ?auto_2896 ) ( ON-TABLE ?auto_2896 ) ( not ( = ?auto_2896 ?auto_2897 ) ) )
    :subtasks
    ( ( !STACK ?auto_2897 ?auto_2896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2898 - BLOCK
      ?auto_2899 - BLOCK
    )
    :vars
    (
      ?auto_2900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2898 ) ( ON-TABLE ?auto_2898 ) ( not ( = ?auto_2898 ?auto_2899 ) ) ( ON ?auto_2899 ?auto_2900 ) ( CLEAR ?auto_2899 ) ( HAND-EMPTY ) ( not ( = ?auto_2898 ?auto_2900 ) ) ( not ( = ?auto_2899 ?auto_2900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2899 ?auto_2900 )
      ( MAKE-2PILE ?auto_2898 ?auto_2899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2901 - BLOCK
      ?auto_2902 - BLOCK
    )
    :vars
    (
      ?auto_2903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2901 ?auto_2902 ) ) ( ON ?auto_2902 ?auto_2903 ) ( CLEAR ?auto_2902 ) ( not ( = ?auto_2901 ?auto_2903 ) ) ( not ( = ?auto_2902 ?auto_2903 ) ) ( HOLDING ?auto_2901 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2901 )
      ( MAKE-2PILE ?auto_2901 ?auto_2902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2904 - BLOCK
      ?auto_2905 - BLOCK
    )
    :vars
    (
      ?auto_2906 - BLOCK
      ?auto_2907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2904 ?auto_2905 ) ) ( ON ?auto_2905 ?auto_2906 ) ( not ( = ?auto_2904 ?auto_2906 ) ) ( not ( = ?auto_2905 ?auto_2906 ) ) ( ON ?auto_2904 ?auto_2905 ) ( CLEAR ?auto_2904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2907 ) ( ON ?auto_2906 ?auto_2907 ) ( not ( = ?auto_2907 ?auto_2906 ) ) ( not ( = ?auto_2907 ?auto_2905 ) ) ( not ( = ?auto_2907 ?auto_2904 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2907 ?auto_2906 ?auto_2905 )
      ( MAKE-2PILE ?auto_2904 ?auto_2905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2909 - BLOCK
    )
    :vars
    (
      ?auto_2910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2910 ?auto_2909 ) ( CLEAR ?auto_2910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2909 ) ( not ( = ?auto_2909 ?auto_2910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2910 ?auto_2909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2911 - BLOCK
    )
    :vars
    (
      ?auto_2912 - BLOCK
      ?auto_2913 - BLOCK
      ?auto_2914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2912 ?auto_2911 ) ( CLEAR ?auto_2912 ) ( ON-TABLE ?auto_2911 ) ( not ( = ?auto_2911 ?auto_2912 ) ) ( HOLDING ?auto_2913 ) ( CLEAR ?auto_2914 ) ( not ( = ?auto_2911 ?auto_2913 ) ) ( not ( = ?auto_2911 ?auto_2914 ) ) ( not ( = ?auto_2912 ?auto_2913 ) ) ( not ( = ?auto_2912 ?auto_2914 ) ) ( not ( = ?auto_2913 ?auto_2914 ) ) )
    :subtasks
    ( ( !STACK ?auto_2913 ?auto_2914 )
      ( MAKE-1PILE ?auto_2911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2915 - BLOCK
    )
    :vars
    (
      ?auto_2917 - BLOCK
      ?auto_2918 - BLOCK
      ?auto_2916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2917 ?auto_2915 ) ( ON-TABLE ?auto_2915 ) ( not ( = ?auto_2915 ?auto_2917 ) ) ( CLEAR ?auto_2918 ) ( not ( = ?auto_2915 ?auto_2916 ) ) ( not ( = ?auto_2915 ?auto_2918 ) ) ( not ( = ?auto_2917 ?auto_2916 ) ) ( not ( = ?auto_2917 ?auto_2918 ) ) ( not ( = ?auto_2916 ?auto_2918 ) ) ( ON ?auto_2916 ?auto_2917 ) ( CLEAR ?auto_2916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2915 ?auto_2917 )
      ( MAKE-1PILE ?auto_2915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2919 - BLOCK
    )
    :vars
    (
      ?auto_2921 - BLOCK
      ?auto_2920 - BLOCK
      ?auto_2922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2921 ?auto_2919 ) ( ON-TABLE ?auto_2919 ) ( not ( = ?auto_2919 ?auto_2921 ) ) ( not ( = ?auto_2919 ?auto_2920 ) ) ( not ( = ?auto_2919 ?auto_2922 ) ) ( not ( = ?auto_2921 ?auto_2920 ) ) ( not ( = ?auto_2921 ?auto_2922 ) ) ( not ( = ?auto_2920 ?auto_2922 ) ) ( ON ?auto_2920 ?auto_2921 ) ( CLEAR ?auto_2920 ) ( HOLDING ?auto_2922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2922 )
      ( MAKE-1PILE ?auto_2919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2923 - BLOCK
    )
    :vars
    (
      ?auto_2925 - BLOCK
      ?auto_2924 - BLOCK
      ?auto_2926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2925 ?auto_2923 ) ( ON-TABLE ?auto_2923 ) ( not ( = ?auto_2923 ?auto_2925 ) ) ( not ( = ?auto_2923 ?auto_2924 ) ) ( not ( = ?auto_2923 ?auto_2926 ) ) ( not ( = ?auto_2925 ?auto_2924 ) ) ( not ( = ?auto_2925 ?auto_2926 ) ) ( not ( = ?auto_2924 ?auto_2926 ) ) ( ON ?auto_2924 ?auto_2925 ) ( ON ?auto_2926 ?auto_2924 ) ( CLEAR ?auto_2926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2923 ?auto_2925 ?auto_2924 )
      ( MAKE-1PILE ?auto_2923 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2930 - BLOCK
      ?auto_2931 - BLOCK
      ?auto_2932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2932 ) ( CLEAR ?auto_2931 ) ( ON-TABLE ?auto_2930 ) ( ON ?auto_2931 ?auto_2930 ) ( not ( = ?auto_2930 ?auto_2931 ) ) ( not ( = ?auto_2930 ?auto_2932 ) ) ( not ( = ?auto_2931 ?auto_2932 ) ) )
    :subtasks
    ( ( !STACK ?auto_2932 ?auto_2931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2933 - BLOCK
      ?auto_2934 - BLOCK
      ?auto_2935 - BLOCK
    )
    :vars
    (
      ?auto_2936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_2934 ) ( ON-TABLE ?auto_2933 ) ( ON ?auto_2934 ?auto_2933 ) ( not ( = ?auto_2933 ?auto_2934 ) ) ( not ( = ?auto_2933 ?auto_2935 ) ) ( not ( = ?auto_2934 ?auto_2935 ) ) ( ON ?auto_2935 ?auto_2936 ) ( CLEAR ?auto_2935 ) ( HAND-EMPTY ) ( not ( = ?auto_2933 ?auto_2936 ) ) ( not ( = ?auto_2934 ?auto_2936 ) ) ( not ( = ?auto_2935 ?auto_2936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2935 ?auto_2936 )
      ( MAKE-3PILE ?auto_2933 ?auto_2934 ?auto_2935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2937 - BLOCK
      ?auto_2938 - BLOCK
      ?auto_2939 - BLOCK
    )
    :vars
    (
      ?auto_2940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2937 ) ( not ( = ?auto_2937 ?auto_2938 ) ) ( not ( = ?auto_2937 ?auto_2939 ) ) ( not ( = ?auto_2938 ?auto_2939 ) ) ( ON ?auto_2939 ?auto_2940 ) ( CLEAR ?auto_2939 ) ( not ( = ?auto_2937 ?auto_2940 ) ) ( not ( = ?auto_2938 ?auto_2940 ) ) ( not ( = ?auto_2939 ?auto_2940 ) ) ( HOLDING ?auto_2938 ) ( CLEAR ?auto_2937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2937 ?auto_2938 )
      ( MAKE-3PILE ?auto_2937 ?auto_2938 ?auto_2939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2941 - BLOCK
      ?auto_2942 - BLOCK
      ?auto_2943 - BLOCK
    )
    :vars
    (
      ?auto_2944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2941 ) ( not ( = ?auto_2941 ?auto_2942 ) ) ( not ( = ?auto_2941 ?auto_2943 ) ) ( not ( = ?auto_2942 ?auto_2943 ) ) ( ON ?auto_2943 ?auto_2944 ) ( not ( = ?auto_2941 ?auto_2944 ) ) ( not ( = ?auto_2942 ?auto_2944 ) ) ( not ( = ?auto_2943 ?auto_2944 ) ) ( CLEAR ?auto_2941 ) ( ON ?auto_2942 ?auto_2943 ) ( CLEAR ?auto_2942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2944 ?auto_2943 )
      ( MAKE-3PILE ?auto_2941 ?auto_2942 ?auto_2943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2945 - BLOCK
      ?auto_2946 - BLOCK
      ?auto_2947 - BLOCK
    )
    :vars
    (
      ?auto_2948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2945 ?auto_2946 ) ) ( not ( = ?auto_2945 ?auto_2947 ) ) ( not ( = ?auto_2946 ?auto_2947 ) ) ( ON ?auto_2947 ?auto_2948 ) ( not ( = ?auto_2945 ?auto_2948 ) ) ( not ( = ?auto_2946 ?auto_2948 ) ) ( not ( = ?auto_2947 ?auto_2948 ) ) ( ON ?auto_2946 ?auto_2947 ) ( CLEAR ?auto_2946 ) ( ON-TABLE ?auto_2948 ) ( HOLDING ?auto_2945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2945 )
      ( MAKE-3PILE ?auto_2945 ?auto_2946 ?auto_2947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_2949 - BLOCK
      ?auto_2950 - BLOCK
      ?auto_2951 - BLOCK
    )
    :vars
    (
      ?auto_2952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2949 ?auto_2950 ) ) ( not ( = ?auto_2949 ?auto_2951 ) ) ( not ( = ?auto_2950 ?auto_2951 ) ) ( ON ?auto_2951 ?auto_2952 ) ( not ( = ?auto_2949 ?auto_2952 ) ) ( not ( = ?auto_2950 ?auto_2952 ) ) ( not ( = ?auto_2951 ?auto_2952 ) ) ( ON ?auto_2950 ?auto_2951 ) ( ON-TABLE ?auto_2952 ) ( ON ?auto_2949 ?auto_2950 ) ( CLEAR ?auto_2949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2952 ?auto_2951 ?auto_2950 )
      ( MAKE-3PILE ?auto_2949 ?auto_2950 ?auto_2951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2955 - BLOCK
      ?auto_2956 - BLOCK
    )
    :vars
    (
      ?auto_2957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2957 ?auto_2956 ) ( CLEAR ?auto_2957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2955 ) ( ON ?auto_2956 ?auto_2955 ) ( not ( = ?auto_2955 ?auto_2956 ) ) ( not ( = ?auto_2955 ?auto_2957 ) ) ( not ( = ?auto_2956 ?auto_2957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2957 ?auto_2956 ) )
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
      ?auto_2968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2965 ) ( not ( = ?auto_2965 ?auto_2966 ) ) ( not ( = ?auto_2965 ?auto_2967 ) ) ( not ( = ?auto_2966 ?auto_2967 ) ) ( ON ?auto_2967 ?auto_2968 ) ( CLEAR ?auto_2967 ) ( not ( = ?auto_2965 ?auto_2968 ) ) ( not ( = ?auto_2966 ?auto_2968 ) ) ( not ( = ?auto_2967 ?auto_2968 ) ) ( HOLDING ?auto_2966 ) ( CLEAR ?auto_2965 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2965 ?auto_2966 ?auto_2967 )
      ( MAKE-2PILE ?auto_2965 ?auto_2966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2969 - BLOCK
      ?auto_2970 - BLOCK
    )
    :vars
    (
      ?auto_2971 - BLOCK
      ?auto_2972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_2969 ) ( not ( = ?auto_2969 ?auto_2970 ) ) ( not ( = ?auto_2969 ?auto_2971 ) ) ( not ( = ?auto_2970 ?auto_2971 ) ) ( ON ?auto_2971 ?auto_2972 ) ( not ( = ?auto_2969 ?auto_2972 ) ) ( not ( = ?auto_2970 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2972 ) ) ( CLEAR ?auto_2969 ) ( ON ?auto_2970 ?auto_2971 ) ( CLEAR ?auto_2970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2972 ?auto_2971 )
      ( MAKE-2PILE ?auto_2969 ?auto_2970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2973 - BLOCK
      ?auto_2974 - BLOCK
    )
    :vars
    (
      ?auto_2975 - BLOCK
      ?auto_2976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2973 ?auto_2974 ) ) ( not ( = ?auto_2973 ?auto_2975 ) ) ( not ( = ?auto_2974 ?auto_2975 ) ) ( ON ?auto_2975 ?auto_2976 ) ( not ( = ?auto_2973 ?auto_2976 ) ) ( not ( = ?auto_2974 ?auto_2976 ) ) ( not ( = ?auto_2975 ?auto_2976 ) ) ( ON ?auto_2974 ?auto_2975 ) ( CLEAR ?auto_2974 ) ( ON-TABLE ?auto_2976 ) ( HOLDING ?auto_2973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_2973 )
      ( MAKE-2PILE ?auto_2973 ?auto_2974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2977 - BLOCK
      ?auto_2978 - BLOCK
    )
    :vars
    (
      ?auto_2979 - BLOCK
      ?auto_2980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2977 ?auto_2978 ) ) ( not ( = ?auto_2977 ?auto_2979 ) ) ( not ( = ?auto_2978 ?auto_2979 ) ) ( ON ?auto_2979 ?auto_2980 ) ( not ( = ?auto_2977 ?auto_2980 ) ) ( not ( = ?auto_2978 ?auto_2980 ) ) ( not ( = ?auto_2979 ?auto_2980 ) ) ( ON ?auto_2978 ?auto_2979 ) ( ON-TABLE ?auto_2980 ) ( ON ?auto_2977 ?auto_2978 ) ( CLEAR ?auto_2977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2980 ?auto_2979 ?auto_2978 )
      ( MAKE-2PILE ?auto_2977 ?auto_2978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_2982 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_2982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2983 - BLOCK
    )
    :vars
    (
      ?auto_2984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_2983 ?auto_2984 ) ( CLEAR ?auto_2983 ) ( HAND-EMPTY ) ( not ( = ?auto_2983 ?auto_2984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2983 ?auto_2984 )
      ( MAKE-1PILE ?auto_2983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2985 - BLOCK
    )
    :vars
    (
      ?auto_2986 - BLOCK
      ?auto_2987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2985 ?auto_2986 ) ) ( HOLDING ?auto_2985 ) ( CLEAR ?auto_2986 ) ( ON-TABLE ?auto_2987 ) ( ON ?auto_2986 ?auto_2987 ) ( not ( = ?auto_2987 ?auto_2986 ) ) ( not ( = ?auto_2987 ?auto_2985 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_2987 ?auto_2986 ?auto_2985 )
      ( MAKE-1PILE ?auto_2985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2988 - BLOCK
    )
    :vars
    (
      ?auto_2989 - BLOCK
      ?auto_2990 - BLOCK
      ?auto_2991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2988 ?auto_2989 ) ) ( CLEAR ?auto_2989 ) ( ON-TABLE ?auto_2990 ) ( ON ?auto_2989 ?auto_2990 ) ( not ( = ?auto_2990 ?auto_2989 ) ) ( not ( = ?auto_2990 ?auto_2988 ) ) ( ON ?auto_2988 ?auto_2991 ) ( CLEAR ?auto_2988 ) ( HAND-EMPTY ) ( not ( = ?auto_2988 ?auto_2991 ) ) ( not ( = ?auto_2989 ?auto_2991 ) ) ( not ( = ?auto_2990 ?auto_2991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_2988 ?auto_2991 )
      ( MAKE-1PILE ?auto_2988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2992 - BLOCK
    )
    :vars
    (
      ?auto_2994 - BLOCK
      ?auto_2993 - BLOCK
      ?auto_2995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2992 ?auto_2994 ) ) ( ON-TABLE ?auto_2993 ) ( not ( = ?auto_2993 ?auto_2994 ) ) ( not ( = ?auto_2993 ?auto_2992 ) ) ( ON ?auto_2992 ?auto_2995 ) ( CLEAR ?auto_2992 ) ( not ( = ?auto_2992 ?auto_2995 ) ) ( not ( = ?auto_2994 ?auto_2995 ) ) ( not ( = ?auto_2993 ?auto_2995 ) ) ( HOLDING ?auto_2994 ) ( CLEAR ?auto_2993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2993 ?auto_2994 )
      ( MAKE-1PILE ?auto_2992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_2996 - BLOCK
    )
    :vars
    (
      ?auto_2999 - BLOCK
      ?auto_2998 - BLOCK
      ?auto_2997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_2996 ?auto_2999 ) ) ( ON-TABLE ?auto_2998 ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( not ( = ?auto_2998 ?auto_2996 ) ) ( ON ?auto_2996 ?auto_2997 ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( not ( = ?auto_2999 ?auto_2997 ) ) ( not ( = ?auto_2998 ?auto_2997 ) ) ( CLEAR ?auto_2998 ) ( ON ?auto_2999 ?auto_2996 ) ( CLEAR ?auto_2999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2997 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_2997 ?auto_2996 )
      ( MAKE-1PILE ?auto_2996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3000 - BLOCK
    )
    :vars
    (
      ?auto_3002 - BLOCK
      ?auto_3001 - BLOCK
      ?auto_3003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3000 ?auto_3002 ) ) ( not ( = ?auto_3001 ?auto_3002 ) ) ( not ( = ?auto_3001 ?auto_3000 ) ) ( ON ?auto_3000 ?auto_3003 ) ( not ( = ?auto_3000 ?auto_3003 ) ) ( not ( = ?auto_3002 ?auto_3003 ) ) ( not ( = ?auto_3001 ?auto_3003 ) ) ( ON ?auto_3002 ?auto_3000 ) ( CLEAR ?auto_3002 ) ( ON-TABLE ?auto_3003 ) ( HOLDING ?auto_3001 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3001 )
      ( MAKE-1PILE ?auto_3000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3004 - BLOCK
    )
    :vars
    (
      ?auto_3007 - BLOCK
      ?auto_3005 - BLOCK
      ?auto_3006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3004 ?auto_3007 ) ) ( not ( = ?auto_3005 ?auto_3007 ) ) ( not ( = ?auto_3005 ?auto_3004 ) ) ( ON ?auto_3004 ?auto_3006 ) ( not ( = ?auto_3004 ?auto_3006 ) ) ( not ( = ?auto_3007 ?auto_3006 ) ) ( not ( = ?auto_3005 ?auto_3006 ) ) ( ON ?auto_3007 ?auto_3004 ) ( ON-TABLE ?auto_3006 ) ( ON ?auto_3005 ?auto_3007 ) ( CLEAR ?auto_3005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3006 ?auto_3004 ?auto_3007 )
      ( MAKE-1PILE ?auto_3004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3009 - BLOCK
    )
    :vars
    (
      ?auto_3010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3010 ?auto_3009 ) ( CLEAR ?auto_3010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3009 ) ( not ( = ?auto_3009 ?auto_3010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3010 ?auto_3009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3011 - BLOCK
    )
    :vars
    (
      ?auto_3012 - BLOCK
      ?auto_3013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3012 ?auto_3011 ) ( CLEAR ?auto_3012 ) ( ON-TABLE ?auto_3011 ) ( not ( = ?auto_3011 ?auto_3012 ) ) ( HOLDING ?auto_3013 ) ( not ( = ?auto_3011 ?auto_3013 ) ) ( not ( = ?auto_3012 ?auto_3013 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3013 )
      ( MAKE-1PILE ?auto_3011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3014 - BLOCK
    )
    :vars
    (
      ?auto_3015 - BLOCK
      ?auto_3016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3015 ?auto_3014 ) ( ON-TABLE ?auto_3014 ) ( not ( = ?auto_3014 ?auto_3015 ) ) ( not ( = ?auto_3014 ?auto_3016 ) ) ( not ( = ?auto_3015 ?auto_3016 ) ) ( ON ?auto_3016 ?auto_3015 ) ( CLEAR ?auto_3016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3014 ?auto_3015 )
      ( MAKE-1PILE ?auto_3014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3017 - BLOCK
    )
    :vars
    (
      ?auto_3018 - BLOCK
      ?auto_3019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3018 ?auto_3017 ) ( ON-TABLE ?auto_3017 ) ( not ( = ?auto_3017 ?auto_3018 ) ) ( not ( = ?auto_3017 ?auto_3019 ) ) ( not ( = ?auto_3018 ?auto_3019 ) ) ( HOLDING ?auto_3019 ) ( CLEAR ?auto_3018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3017 ?auto_3018 ?auto_3019 )
      ( MAKE-1PILE ?auto_3017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3020 - BLOCK
    )
    :vars
    (
      ?auto_3022 - BLOCK
      ?auto_3021 - BLOCK
      ?auto_3023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3022 ?auto_3020 ) ( ON-TABLE ?auto_3020 ) ( not ( = ?auto_3020 ?auto_3022 ) ) ( not ( = ?auto_3020 ?auto_3021 ) ) ( not ( = ?auto_3022 ?auto_3021 ) ) ( CLEAR ?auto_3022 ) ( ON ?auto_3021 ?auto_3023 ) ( CLEAR ?auto_3021 ) ( HAND-EMPTY ) ( not ( = ?auto_3020 ?auto_3023 ) ) ( not ( = ?auto_3022 ?auto_3023 ) ) ( not ( = ?auto_3021 ?auto_3023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3021 ?auto_3023 )
      ( MAKE-1PILE ?auto_3020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3032 - BLOCK
    )
    :vars
    (
      ?auto_3033 - BLOCK
      ?auto_3034 - BLOCK
      ?auto_3035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3032 ?auto_3033 ) ) ( not ( = ?auto_3032 ?auto_3034 ) ) ( not ( = ?auto_3033 ?auto_3034 ) ) ( ON ?auto_3034 ?auto_3035 ) ( not ( = ?auto_3032 ?auto_3035 ) ) ( not ( = ?auto_3033 ?auto_3035 ) ) ( not ( = ?auto_3034 ?auto_3035 ) ) ( ON ?auto_3033 ?auto_3034 ) ( CLEAR ?auto_3033 ) ( HOLDING ?auto_3032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3032 ?auto_3033 )
      ( MAKE-1PILE ?auto_3032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3036 - BLOCK
    )
    :vars
    (
      ?auto_3037 - BLOCK
      ?auto_3039 - BLOCK
      ?auto_3038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3036 ?auto_3037 ) ) ( not ( = ?auto_3036 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) ( ON ?auto_3039 ?auto_3038 ) ( not ( = ?auto_3036 ?auto_3038 ) ) ( not ( = ?auto_3037 ?auto_3038 ) ) ( not ( = ?auto_3039 ?auto_3038 ) ) ( ON ?auto_3037 ?auto_3039 ) ( ON ?auto_3036 ?auto_3037 ) ( CLEAR ?auto_3036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3038 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3038 ?auto_3039 ?auto_3037 )
      ( MAKE-1PILE ?auto_3036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3042 - BLOCK
      ?auto_3043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3043 ) ( CLEAR ?auto_3042 ) ( ON-TABLE ?auto_3042 ) ( not ( = ?auto_3042 ?auto_3043 ) ) )
    :subtasks
    ( ( !STACK ?auto_3043 ?auto_3042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3044 - BLOCK
      ?auto_3045 - BLOCK
    )
    :vars
    (
      ?auto_3046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3044 ) ( ON-TABLE ?auto_3044 ) ( not ( = ?auto_3044 ?auto_3045 ) ) ( ON ?auto_3045 ?auto_3046 ) ( CLEAR ?auto_3045 ) ( HAND-EMPTY ) ( not ( = ?auto_3044 ?auto_3046 ) ) ( not ( = ?auto_3045 ?auto_3046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3045 ?auto_3046 )
      ( MAKE-2PILE ?auto_3044 ?auto_3045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3047 - BLOCK
      ?auto_3048 - BLOCK
    )
    :vars
    (
      ?auto_3049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3047 ?auto_3048 ) ) ( ON ?auto_3048 ?auto_3049 ) ( CLEAR ?auto_3048 ) ( not ( = ?auto_3047 ?auto_3049 ) ) ( not ( = ?auto_3048 ?auto_3049 ) ) ( HOLDING ?auto_3047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3047 )
      ( MAKE-2PILE ?auto_3047 ?auto_3048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3050 - BLOCK
      ?auto_3051 - BLOCK
    )
    :vars
    (
      ?auto_3052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3050 ?auto_3051 ) ) ( ON ?auto_3051 ?auto_3052 ) ( not ( = ?auto_3050 ?auto_3052 ) ) ( not ( = ?auto_3051 ?auto_3052 ) ) ( ON ?auto_3050 ?auto_3051 ) ( CLEAR ?auto_3050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3052 ?auto_3051 )
      ( MAKE-2PILE ?auto_3050 ?auto_3051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3053 - BLOCK
      ?auto_3054 - BLOCK
    )
    :vars
    (
      ?auto_3055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3053 ?auto_3054 ) ) ( ON ?auto_3054 ?auto_3055 ) ( not ( = ?auto_3053 ?auto_3055 ) ) ( not ( = ?auto_3054 ?auto_3055 ) ) ( ON-TABLE ?auto_3055 ) ( HOLDING ?auto_3053 ) ( CLEAR ?auto_3054 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3055 ?auto_3054 ?auto_3053 )
      ( MAKE-2PILE ?auto_3053 ?auto_3054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3056 - BLOCK
      ?auto_3057 - BLOCK
    )
    :vars
    (
      ?auto_3058 - BLOCK
      ?auto_3059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3056 ?auto_3057 ) ) ( ON ?auto_3057 ?auto_3058 ) ( not ( = ?auto_3056 ?auto_3058 ) ) ( not ( = ?auto_3057 ?auto_3058 ) ) ( ON-TABLE ?auto_3058 ) ( CLEAR ?auto_3057 ) ( ON ?auto_3056 ?auto_3059 ) ( CLEAR ?auto_3056 ) ( HAND-EMPTY ) ( not ( = ?auto_3056 ?auto_3059 ) ) ( not ( = ?auto_3057 ?auto_3059 ) ) ( not ( = ?auto_3058 ?auto_3059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3056 ?auto_3059 )
      ( MAKE-2PILE ?auto_3056 ?auto_3057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3060 - BLOCK
      ?auto_3061 - BLOCK
    )
    :vars
    (
      ?auto_3063 - BLOCK
      ?auto_3062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3060 ?auto_3061 ) ) ( not ( = ?auto_3060 ?auto_3063 ) ) ( not ( = ?auto_3061 ?auto_3063 ) ) ( ON-TABLE ?auto_3063 ) ( ON ?auto_3060 ?auto_3062 ) ( CLEAR ?auto_3060 ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( not ( = ?auto_3061 ?auto_3062 ) ) ( not ( = ?auto_3063 ?auto_3062 ) ) ( HOLDING ?auto_3061 ) ( CLEAR ?auto_3063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3063 ?auto_3061 )
      ( MAKE-2PILE ?auto_3060 ?auto_3061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3064 - BLOCK
      ?auto_3065 - BLOCK
    )
    :vars
    (
      ?auto_3067 - BLOCK
      ?auto_3066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3064 ?auto_3065 ) ) ( not ( = ?auto_3064 ?auto_3067 ) ) ( not ( = ?auto_3065 ?auto_3067 ) ) ( ON-TABLE ?auto_3067 ) ( ON ?auto_3064 ?auto_3066 ) ( not ( = ?auto_3064 ?auto_3066 ) ) ( not ( = ?auto_3065 ?auto_3066 ) ) ( not ( = ?auto_3067 ?auto_3066 ) ) ( CLEAR ?auto_3067 ) ( ON ?auto_3065 ?auto_3064 ) ( CLEAR ?auto_3065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3066 ?auto_3064 )
      ( MAKE-2PILE ?auto_3064 ?auto_3065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3068 - BLOCK
      ?auto_3069 - BLOCK
    )
    :vars
    (
      ?auto_3071 - BLOCK
      ?auto_3070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3068 ?auto_3069 ) ) ( not ( = ?auto_3068 ?auto_3071 ) ) ( not ( = ?auto_3069 ?auto_3071 ) ) ( ON ?auto_3068 ?auto_3070 ) ( not ( = ?auto_3068 ?auto_3070 ) ) ( not ( = ?auto_3069 ?auto_3070 ) ) ( not ( = ?auto_3071 ?auto_3070 ) ) ( ON ?auto_3069 ?auto_3068 ) ( CLEAR ?auto_3069 ) ( ON-TABLE ?auto_3070 ) ( HOLDING ?auto_3071 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3071 )
      ( MAKE-2PILE ?auto_3068 ?auto_3069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3072 - BLOCK
      ?auto_3073 - BLOCK
    )
    :vars
    (
      ?auto_3075 - BLOCK
      ?auto_3074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3075 ) ) ( not ( = ?auto_3073 ?auto_3075 ) ) ( ON ?auto_3072 ?auto_3074 ) ( not ( = ?auto_3072 ?auto_3074 ) ) ( not ( = ?auto_3073 ?auto_3074 ) ) ( not ( = ?auto_3075 ?auto_3074 ) ) ( ON ?auto_3073 ?auto_3072 ) ( ON-TABLE ?auto_3074 ) ( ON ?auto_3075 ?auto_3073 ) ( CLEAR ?auto_3075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3074 ?auto_3072 ?auto_3073 )
      ( MAKE-2PILE ?auto_3072 ?auto_3073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3079 - BLOCK
      ?auto_3080 - BLOCK
      ?auto_3081 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3081 ) ( CLEAR ?auto_3080 ) ( ON-TABLE ?auto_3079 ) ( ON ?auto_3080 ?auto_3079 ) ( not ( = ?auto_3079 ?auto_3080 ) ) ( not ( = ?auto_3079 ?auto_3081 ) ) ( not ( = ?auto_3080 ?auto_3081 ) ) )
    :subtasks
    ( ( !STACK ?auto_3081 ?auto_3080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3082 - BLOCK
      ?auto_3083 - BLOCK
      ?auto_3084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3083 ) ( ON-TABLE ?auto_3082 ) ( ON ?auto_3083 ?auto_3082 ) ( not ( = ?auto_3082 ?auto_3083 ) ) ( not ( = ?auto_3082 ?auto_3084 ) ) ( not ( = ?auto_3083 ?auto_3084 ) ) ( ON-TABLE ?auto_3084 ) ( CLEAR ?auto_3084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3084 )
      ( MAKE-3PILE ?auto_3082 ?auto_3083 ?auto_3084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3085 - BLOCK
      ?auto_3086 - BLOCK
      ?auto_3087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3085 ) ( not ( = ?auto_3085 ?auto_3086 ) ) ( not ( = ?auto_3085 ?auto_3087 ) ) ( not ( = ?auto_3086 ?auto_3087 ) ) ( ON-TABLE ?auto_3087 ) ( CLEAR ?auto_3087 ) ( HOLDING ?auto_3086 ) ( CLEAR ?auto_3085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3085 ?auto_3086 )
      ( MAKE-3PILE ?auto_3085 ?auto_3086 ?auto_3087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3088 - BLOCK
      ?auto_3089 - BLOCK
      ?auto_3090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3088 ) ( not ( = ?auto_3088 ?auto_3089 ) ) ( not ( = ?auto_3088 ?auto_3090 ) ) ( not ( = ?auto_3089 ?auto_3090 ) ) ( ON-TABLE ?auto_3090 ) ( CLEAR ?auto_3088 ) ( ON ?auto_3089 ?auto_3090 ) ( CLEAR ?auto_3089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3090 )
      ( MAKE-3PILE ?auto_3088 ?auto_3089 ?auto_3090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3091 - BLOCK
      ?auto_3092 - BLOCK
      ?auto_3093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3091 ?auto_3092 ) ) ( not ( = ?auto_3091 ?auto_3093 ) ) ( not ( = ?auto_3092 ?auto_3093 ) ) ( ON-TABLE ?auto_3093 ) ( ON ?auto_3092 ?auto_3093 ) ( CLEAR ?auto_3092 ) ( HOLDING ?auto_3091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3091 )
      ( MAKE-3PILE ?auto_3091 ?auto_3092 ?auto_3093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3094 - BLOCK
      ?auto_3095 - BLOCK
      ?auto_3096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3096 ) ) ( not ( = ?auto_3095 ?auto_3096 ) ) ( ON-TABLE ?auto_3096 ) ( ON ?auto_3095 ?auto_3096 ) ( ON ?auto_3094 ?auto_3095 ) ( CLEAR ?auto_3094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3096 ?auto_3095 )
      ( MAKE-3PILE ?auto_3094 ?auto_3095 ?auto_3096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3097 - BLOCK
      ?auto_3098 - BLOCK
      ?auto_3099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3097 ?auto_3098 ) ) ( not ( = ?auto_3097 ?auto_3099 ) ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( ON-TABLE ?auto_3099 ) ( ON ?auto_3098 ?auto_3099 ) ( HOLDING ?auto_3097 ) ( CLEAR ?auto_3098 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3099 ?auto_3098 ?auto_3097 )
      ( MAKE-3PILE ?auto_3097 ?auto_3098 ?auto_3099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3100 - BLOCK
      ?auto_3101 - BLOCK
      ?auto_3102 - BLOCK
    )
    :vars
    (
      ?auto_3103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3100 ?auto_3101 ) ) ( not ( = ?auto_3100 ?auto_3102 ) ) ( not ( = ?auto_3101 ?auto_3102 ) ) ( ON-TABLE ?auto_3102 ) ( ON ?auto_3101 ?auto_3102 ) ( CLEAR ?auto_3101 ) ( ON ?auto_3100 ?auto_3103 ) ( CLEAR ?auto_3100 ) ( HAND-EMPTY ) ( not ( = ?auto_3100 ?auto_3103 ) ) ( not ( = ?auto_3101 ?auto_3103 ) ) ( not ( = ?auto_3102 ?auto_3103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3100 ?auto_3103 )
      ( MAKE-3PILE ?auto_3100 ?auto_3101 ?auto_3102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3104 - BLOCK
      ?auto_3105 - BLOCK
      ?auto_3106 - BLOCK
    )
    :vars
    (
      ?auto_3107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3104 ?auto_3105 ) ) ( not ( = ?auto_3104 ?auto_3106 ) ) ( not ( = ?auto_3105 ?auto_3106 ) ) ( ON-TABLE ?auto_3106 ) ( ON ?auto_3104 ?auto_3107 ) ( CLEAR ?auto_3104 ) ( not ( = ?auto_3104 ?auto_3107 ) ) ( not ( = ?auto_3105 ?auto_3107 ) ) ( not ( = ?auto_3106 ?auto_3107 ) ) ( HOLDING ?auto_3105 ) ( CLEAR ?auto_3106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3106 ?auto_3105 )
      ( MAKE-3PILE ?auto_3104 ?auto_3105 ?auto_3106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3108 - BLOCK
      ?auto_3109 - BLOCK
      ?auto_3110 - BLOCK
    )
    :vars
    (
      ?auto_3111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3108 ?auto_3109 ) ) ( not ( = ?auto_3108 ?auto_3110 ) ) ( not ( = ?auto_3109 ?auto_3110 ) ) ( ON-TABLE ?auto_3110 ) ( ON ?auto_3108 ?auto_3111 ) ( not ( = ?auto_3108 ?auto_3111 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3110 ?auto_3111 ) ) ( CLEAR ?auto_3110 ) ( ON ?auto_3109 ?auto_3108 ) ( CLEAR ?auto_3109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3111 ?auto_3108 )
      ( MAKE-3PILE ?auto_3108 ?auto_3109 ?auto_3110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3112 - BLOCK
      ?auto_3113 - BLOCK
      ?auto_3114 - BLOCK
    )
    :vars
    (
      ?auto_3115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3112 ?auto_3113 ) ) ( not ( = ?auto_3112 ?auto_3114 ) ) ( not ( = ?auto_3113 ?auto_3114 ) ) ( ON ?auto_3112 ?auto_3115 ) ( not ( = ?auto_3112 ?auto_3115 ) ) ( not ( = ?auto_3113 ?auto_3115 ) ) ( not ( = ?auto_3114 ?auto_3115 ) ) ( ON ?auto_3113 ?auto_3112 ) ( CLEAR ?auto_3113 ) ( ON-TABLE ?auto_3115 ) ( HOLDING ?auto_3114 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3114 )
      ( MAKE-3PILE ?auto_3112 ?auto_3113 ?auto_3114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3116 - BLOCK
      ?auto_3117 - BLOCK
      ?auto_3118 - BLOCK
    )
    :vars
    (
      ?auto_3119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3116 ?auto_3117 ) ) ( not ( = ?auto_3116 ?auto_3118 ) ) ( not ( = ?auto_3117 ?auto_3118 ) ) ( ON ?auto_3116 ?auto_3119 ) ( not ( = ?auto_3116 ?auto_3119 ) ) ( not ( = ?auto_3117 ?auto_3119 ) ) ( not ( = ?auto_3118 ?auto_3119 ) ) ( ON ?auto_3117 ?auto_3116 ) ( ON-TABLE ?auto_3119 ) ( ON ?auto_3118 ?auto_3117 ) ( CLEAR ?auto_3118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3119 ?auto_3116 ?auto_3117 )
      ( MAKE-3PILE ?auto_3116 ?auto_3117 ?auto_3118 ) )
  )

)

