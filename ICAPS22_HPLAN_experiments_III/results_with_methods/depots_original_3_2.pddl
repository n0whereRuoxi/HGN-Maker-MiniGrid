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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2890 - SURFACE
      ?auto_2891 - SURFACE
    )
    :vars
    (
      ?auto_2892 - HOIST
      ?auto_2893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2892 ?auto_2893 ) ( SURFACE-AT ?auto_2890 ?auto_2893 ) ( CLEAR ?auto_2890 ) ( LIFTING ?auto_2892 ?auto_2891 ) ( IS-CRATE ?auto_2891 ) ( not ( = ?auto_2890 ?auto_2891 ) ) )
    :subtasks
    ( ( !DROP ?auto_2892 ?auto_2891 ?auto_2890 ?auto_2893 )
      ( MAKE-1CRATE-VERIFY ?auto_2890 ?auto_2891 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2894 - SURFACE
      ?auto_2895 - SURFACE
    )
    :vars
    (
      ?auto_2896 - HOIST
      ?auto_2897 - PLACE
      ?auto_2898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2896 ?auto_2897 ) ( SURFACE-AT ?auto_2894 ?auto_2897 ) ( CLEAR ?auto_2894 ) ( IS-CRATE ?auto_2895 ) ( not ( = ?auto_2894 ?auto_2895 ) ) ( TRUCK-AT ?auto_2898 ?auto_2897 ) ( AVAILABLE ?auto_2896 ) ( IN ?auto_2895 ?auto_2898 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2896 ?auto_2895 ?auto_2898 ?auto_2897 )
      ( MAKE-1CRATE ?auto_2894 ?auto_2895 )
      ( MAKE-1CRATE-VERIFY ?auto_2894 ?auto_2895 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2899 - SURFACE
      ?auto_2900 - SURFACE
    )
    :vars
    (
      ?auto_2901 - HOIST
      ?auto_2903 - PLACE
      ?auto_2902 - TRUCK
      ?auto_2904 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2901 ?auto_2903 ) ( SURFACE-AT ?auto_2899 ?auto_2903 ) ( CLEAR ?auto_2899 ) ( IS-CRATE ?auto_2900 ) ( not ( = ?auto_2899 ?auto_2900 ) ) ( AVAILABLE ?auto_2901 ) ( IN ?auto_2900 ?auto_2902 ) ( TRUCK-AT ?auto_2902 ?auto_2904 ) ( not ( = ?auto_2904 ?auto_2903 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2902 ?auto_2904 ?auto_2903 )
      ( MAKE-1CRATE ?auto_2899 ?auto_2900 )
      ( MAKE-1CRATE-VERIFY ?auto_2899 ?auto_2900 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2905 - SURFACE
      ?auto_2906 - SURFACE
    )
    :vars
    (
      ?auto_2910 - HOIST
      ?auto_2908 - PLACE
      ?auto_2909 - TRUCK
      ?auto_2907 - PLACE
      ?auto_2911 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2910 ?auto_2908 ) ( SURFACE-AT ?auto_2905 ?auto_2908 ) ( CLEAR ?auto_2905 ) ( IS-CRATE ?auto_2906 ) ( not ( = ?auto_2905 ?auto_2906 ) ) ( AVAILABLE ?auto_2910 ) ( TRUCK-AT ?auto_2909 ?auto_2907 ) ( not ( = ?auto_2907 ?auto_2908 ) ) ( HOIST-AT ?auto_2911 ?auto_2907 ) ( LIFTING ?auto_2911 ?auto_2906 ) ( not ( = ?auto_2910 ?auto_2911 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2911 ?auto_2906 ?auto_2909 ?auto_2907 )
      ( MAKE-1CRATE ?auto_2905 ?auto_2906 )
      ( MAKE-1CRATE-VERIFY ?auto_2905 ?auto_2906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2912 - SURFACE
      ?auto_2913 - SURFACE
    )
    :vars
    (
      ?auto_2918 - HOIST
      ?auto_2917 - PLACE
      ?auto_2914 - TRUCK
      ?auto_2915 - PLACE
      ?auto_2916 - HOIST
      ?auto_2919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2918 ?auto_2917 ) ( SURFACE-AT ?auto_2912 ?auto_2917 ) ( CLEAR ?auto_2912 ) ( IS-CRATE ?auto_2913 ) ( not ( = ?auto_2912 ?auto_2913 ) ) ( AVAILABLE ?auto_2918 ) ( TRUCK-AT ?auto_2914 ?auto_2915 ) ( not ( = ?auto_2915 ?auto_2917 ) ) ( HOIST-AT ?auto_2916 ?auto_2915 ) ( not ( = ?auto_2918 ?auto_2916 ) ) ( AVAILABLE ?auto_2916 ) ( SURFACE-AT ?auto_2913 ?auto_2915 ) ( ON ?auto_2913 ?auto_2919 ) ( CLEAR ?auto_2913 ) ( not ( = ?auto_2912 ?auto_2919 ) ) ( not ( = ?auto_2913 ?auto_2919 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2916 ?auto_2913 ?auto_2919 ?auto_2915 )
      ( MAKE-1CRATE ?auto_2912 ?auto_2913 )
      ( MAKE-1CRATE-VERIFY ?auto_2912 ?auto_2913 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2920 - SURFACE
      ?auto_2921 - SURFACE
    )
    :vars
    (
      ?auto_2922 - HOIST
      ?auto_2926 - PLACE
      ?auto_2923 - PLACE
      ?auto_2925 - HOIST
      ?auto_2924 - SURFACE
      ?auto_2927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2922 ?auto_2926 ) ( SURFACE-AT ?auto_2920 ?auto_2926 ) ( CLEAR ?auto_2920 ) ( IS-CRATE ?auto_2921 ) ( not ( = ?auto_2920 ?auto_2921 ) ) ( AVAILABLE ?auto_2922 ) ( not ( = ?auto_2923 ?auto_2926 ) ) ( HOIST-AT ?auto_2925 ?auto_2923 ) ( not ( = ?auto_2922 ?auto_2925 ) ) ( AVAILABLE ?auto_2925 ) ( SURFACE-AT ?auto_2921 ?auto_2923 ) ( ON ?auto_2921 ?auto_2924 ) ( CLEAR ?auto_2921 ) ( not ( = ?auto_2920 ?auto_2924 ) ) ( not ( = ?auto_2921 ?auto_2924 ) ) ( TRUCK-AT ?auto_2927 ?auto_2926 ) )
    :subtasks
    ( ( !DRIVE ?auto_2927 ?auto_2926 ?auto_2923 )
      ( MAKE-1CRATE ?auto_2920 ?auto_2921 )
      ( MAKE-1CRATE-VERIFY ?auto_2920 ?auto_2921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2933 - SURFACE
      ?auto_2934 - SURFACE
    )
    :vars
    (
      ?auto_2935 - HOIST
      ?auto_2936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2935 ?auto_2936 ) ( SURFACE-AT ?auto_2933 ?auto_2936 ) ( CLEAR ?auto_2933 ) ( LIFTING ?auto_2935 ?auto_2934 ) ( IS-CRATE ?auto_2934 ) ( not ( = ?auto_2933 ?auto_2934 ) ) )
    :subtasks
    ( ( !DROP ?auto_2935 ?auto_2934 ?auto_2933 ?auto_2936 )
      ( MAKE-1CRATE-VERIFY ?auto_2933 ?auto_2934 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2937 - SURFACE
      ?auto_2938 - SURFACE
      ?auto_2939 - SURFACE
    )
    :vars
    (
      ?auto_2941 - HOIST
      ?auto_2940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2941 ?auto_2940 ) ( SURFACE-AT ?auto_2938 ?auto_2940 ) ( CLEAR ?auto_2938 ) ( LIFTING ?auto_2941 ?auto_2939 ) ( IS-CRATE ?auto_2939 ) ( not ( = ?auto_2938 ?auto_2939 ) ) ( ON ?auto_2938 ?auto_2937 ) ( not ( = ?auto_2937 ?auto_2938 ) ) ( not ( = ?auto_2937 ?auto_2939 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2938 ?auto_2939 )
      ( MAKE-2CRATE-VERIFY ?auto_2937 ?auto_2938 ?auto_2939 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2942 - SURFACE
      ?auto_2943 - SURFACE
    )
    :vars
    (
      ?auto_2945 - HOIST
      ?auto_2944 - PLACE
      ?auto_2946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2945 ?auto_2944 ) ( SURFACE-AT ?auto_2942 ?auto_2944 ) ( CLEAR ?auto_2942 ) ( IS-CRATE ?auto_2943 ) ( not ( = ?auto_2942 ?auto_2943 ) ) ( TRUCK-AT ?auto_2946 ?auto_2944 ) ( AVAILABLE ?auto_2945 ) ( IN ?auto_2943 ?auto_2946 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2945 ?auto_2943 ?auto_2946 ?auto_2944 )
      ( MAKE-1CRATE ?auto_2942 ?auto_2943 )
      ( MAKE-1CRATE-VERIFY ?auto_2942 ?auto_2943 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2947 - SURFACE
      ?auto_2948 - SURFACE
      ?auto_2949 - SURFACE
    )
    :vars
    (
      ?auto_2952 - HOIST
      ?auto_2951 - PLACE
      ?auto_2950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2952 ?auto_2951 ) ( SURFACE-AT ?auto_2948 ?auto_2951 ) ( CLEAR ?auto_2948 ) ( IS-CRATE ?auto_2949 ) ( not ( = ?auto_2948 ?auto_2949 ) ) ( TRUCK-AT ?auto_2950 ?auto_2951 ) ( AVAILABLE ?auto_2952 ) ( IN ?auto_2949 ?auto_2950 ) ( ON ?auto_2948 ?auto_2947 ) ( not ( = ?auto_2947 ?auto_2948 ) ) ( not ( = ?auto_2947 ?auto_2949 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2948 ?auto_2949 )
      ( MAKE-2CRATE-VERIFY ?auto_2947 ?auto_2948 ?auto_2949 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2953 - SURFACE
      ?auto_2954 - SURFACE
    )
    :vars
    (
      ?auto_2958 - HOIST
      ?auto_2956 - PLACE
      ?auto_2955 - TRUCK
      ?auto_2957 - SURFACE
      ?auto_2959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2958 ?auto_2956 ) ( SURFACE-AT ?auto_2953 ?auto_2956 ) ( CLEAR ?auto_2953 ) ( IS-CRATE ?auto_2954 ) ( not ( = ?auto_2953 ?auto_2954 ) ) ( AVAILABLE ?auto_2958 ) ( IN ?auto_2954 ?auto_2955 ) ( ON ?auto_2953 ?auto_2957 ) ( not ( = ?auto_2957 ?auto_2953 ) ) ( not ( = ?auto_2957 ?auto_2954 ) ) ( TRUCK-AT ?auto_2955 ?auto_2959 ) ( not ( = ?auto_2959 ?auto_2956 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2955 ?auto_2959 ?auto_2956 )
      ( MAKE-2CRATE ?auto_2957 ?auto_2953 ?auto_2954 )
      ( MAKE-1CRATE-VERIFY ?auto_2953 ?auto_2954 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2960 - SURFACE
      ?auto_2961 - SURFACE
      ?auto_2962 - SURFACE
    )
    :vars
    (
      ?auto_2965 - HOIST
      ?auto_2963 - PLACE
      ?auto_2964 - TRUCK
      ?auto_2966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2965 ?auto_2963 ) ( SURFACE-AT ?auto_2961 ?auto_2963 ) ( CLEAR ?auto_2961 ) ( IS-CRATE ?auto_2962 ) ( not ( = ?auto_2961 ?auto_2962 ) ) ( AVAILABLE ?auto_2965 ) ( IN ?auto_2962 ?auto_2964 ) ( ON ?auto_2961 ?auto_2960 ) ( not ( = ?auto_2960 ?auto_2961 ) ) ( not ( = ?auto_2960 ?auto_2962 ) ) ( TRUCK-AT ?auto_2964 ?auto_2966 ) ( not ( = ?auto_2966 ?auto_2963 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2961 ?auto_2962 )
      ( MAKE-2CRATE-VERIFY ?auto_2960 ?auto_2961 ?auto_2962 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2967 - SURFACE
      ?auto_2968 - SURFACE
    )
    :vars
    (
      ?auto_2971 - HOIST
      ?auto_2973 - PLACE
      ?auto_2972 - SURFACE
      ?auto_2969 - TRUCK
      ?auto_2970 - PLACE
      ?auto_2974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2971 ?auto_2973 ) ( SURFACE-AT ?auto_2967 ?auto_2973 ) ( CLEAR ?auto_2967 ) ( IS-CRATE ?auto_2968 ) ( not ( = ?auto_2967 ?auto_2968 ) ) ( AVAILABLE ?auto_2971 ) ( ON ?auto_2967 ?auto_2972 ) ( not ( = ?auto_2972 ?auto_2967 ) ) ( not ( = ?auto_2972 ?auto_2968 ) ) ( TRUCK-AT ?auto_2969 ?auto_2970 ) ( not ( = ?auto_2970 ?auto_2973 ) ) ( HOIST-AT ?auto_2974 ?auto_2970 ) ( LIFTING ?auto_2974 ?auto_2968 ) ( not ( = ?auto_2971 ?auto_2974 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2974 ?auto_2968 ?auto_2969 ?auto_2970 )
      ( MAKE-2CRATE ?auto_2972 ?auto_2967 ?auto_2968 )
      ( MAKE-1CRATE-VERIFY ?auto_2967 ?auto_2968 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2975 - SURFACE
      ?auto_2976 - SURFACE
      ?auto_2977 - SURFACE
    )
    :vars
    (
      ?auto_2981 - HOIST
      ?auto_2978 - PLACE
      ?auto_2982 - TRUCK
      ?auto_2979 - PLACE
      ?auto_2980 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2981 ?auto_2978 ) ( SURFACE-AT ?auto_2976 ?auto_2978 ) ( CLEAR ?auto_2976 ) ( IS-CRATE ?auto_2977 ) ( not ( = ?auto_2976 ?auto_2977 ) ) ( AVAILABLE ?auto_2981 ) ( ON ?auto_2976 ?auto_2975 ) ( not ( = ?auto_2975 ?auto_2976 ) ) ( not ( = ?auto_2975 ?auto_2977 ) ) ( TRUCK-AT ?auto_2982 ?auto_2979 ) ( not ( = ?auto_2979 ?auto_2978 ) ) ( HOIST-AT ?auto_2980 ?auto_2979 ) ( LIFTING ?auto_2980 ?auto_2977 ) ( not ( = ?auto_2981 ?auto_2980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2976 ?auto_2977 )
      ( MAKE-2CRATE-VERIFY ?auto_2975 ?auto_2976 ?auto_2977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2983 - SURFACE
      ?auto_2984 - SURFACE
    )
    :vars
    (
      ?auto_2987 - HOIST
      ?auto_2989 - PLACE
      ?auto_2990 - SURFACE
      ?auto_2986 - TRUCK
      ?auto_2988 - PLACE
      ?auto_2985 - HOIST
      ?auto_2991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2987 ?auto_2989 ) ( SURFACE-AT ?auto_2983 ?auto_2989 ) ( CLEAR ?auto_2983 ) ( IS-CRATE ?auto_2984 ) ( not ( = ?auto_2983 ?auto_2984 ) ) ( AVAILABLE ?auto_2987 ) ( ON ?auto_2983 ?auto_2990 ) ( not ( = ?auto_2990 ?auto_2983 ) ) ( not ( = ?auto_2990 ?auto_2984 ) ) ( TRUCK-AT ?auto_2986 ?auto_2988 ) ( not ( = ?auto_2988 ?auto_2989 ) ) ( HOIST-AT ?auto_2985 ?auto_2988 ) ( not ( = ?auto_2987 ?auto_2985 ) ) ( AVAILABLE ?auto_2985 ) ( SURFACE-AT ?auto_2984 ?auto_2988 ) ( ON ?auto_2984 ?auto_2991 ) ( CLEAR ?auto_2984 ) ( not ( = ?auto_2983 ?auto_2991 ) ) ( not ( = ?auto_2984 ?auto_2991 ) ) ( not ( = ?auto_2990 ?auto_2991 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2985 ?auto_2984 ?auto_2991 ?auto_2988 )
      ( MAKE-2CRATE ?auto_2990 ?auto_2983 ?auto_2984 )
      ( MAKE-1CRATE-VERIFY ?auto_2983 ?auto_2984 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2992 - SURFACE
      ?auto_2993 - SURFACE
      ?auto_2994 - SURFACE
    )
    :vars
    (
      ?auto_2998 - HOIST
      ?auto_2999 - PLACE
      ?auto_2995 - TRUCK
      ?auto_2997 - PLACE
      ?auto_2996 - HOIST
      ?auto_3000 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2998 ?auto_2999 ) ( SURFACE-AT ?auto_2993 ?auto_2999 ) ( CLEAR ?auto_2993 ) ( IS-CRATE ?auto_2994 ) ( not ( = ?auto_2993 ?auto_2994 ) ) ( AVAILABLE ?auto_2998 ) ( ON ?auto_2993 ?auto_2992 ) ( not ( = ?auto_2992 ?auto_2993 ) ) ( not ( = ?auto_2992 ?auto_2994 ) ) ( TRUCK-AT ?auto_2995 ?auto_2997 ) ( not ( = ?auto_2997 ?auto_2999 ) ) ( HOIST-AT ?auto_2996 ?auto_2997 ) ( not ( = ?auto_2998 ?auto_2996 ) ) ( AVAILABLE ?auto_2996 ) ( SURFACE-AT ?auto_2994 ?auto_2997 ) ( ON ?auto_2994 ?auto_3000 ) ( CLEAR ?auto_2994 ) ( not ( = ?auto_2993 ?auto_3000 ) ) ( not ( = ?auto_2994 ?auto_3000 ) ) ( not ( = ?auto_2992 ?auto_3000 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2993 ?auto_2994 )
      ( MAKE-2CRATE-VERIFY ?auto_2992 ?auto_2993 ?auto_2994 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3001 - SURFACE
      ?auto_3002 - SURFACE
    )
    :vars
    (
      ?auto_3004 - HOIST
      ?auto_3007 - PLACE
      ?auto_3003 - SURFACE
      ?auto_3006 - PLACE
      ?auto_3009 - HOIST
      ?auto_3005 - SURFACE
      ?auto_3008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3004 ?auto_3007 ) ( SURFACE-AT ?auto_3001 ?auto_3007 ) ( CLEAR ?auto_3001 ) ( IS-CRATE ?auto_3002 ) ( not ( = ?auto_3001 ?auto_3002 ) ) ( AVAILABLE ?auto_3004 ) ( ON ?auto_3001 ?auto_3003 ) ( not ( = ?auto_3003 ?auto_3001 ) ) ( not ( = ?auto_3003 ?auto_3002 ) ) ( not ( = ?auto_3006 ?auto_3007 ) ) ( HOIST-AT ?auto_3009 ?auto_3006 ) ( not ( = ?auto_3004 ?auto_3009 ) ) ( AVAILABLE ?auto_3009 ) ( SURFACE-AT ?auto_3002 ?auto_3006 ) ( ON ?auto_3002 ?auto_3005 ) ( CLEAR ?auto_3002 ) ( not ( = ?auto_3001 ?auto_3005 ) ) ( not ( = ?auto_3002 ?auto_3005 ) ) ( not ( = ?auto_3003 ?auto_3005 ) ) ( TRUCK-AT ?auto_3008 ?auto_3007 ) )
    :subtasks
    ( ( !DRIVE ?auto_3008 ?auto_3007 ?auto_3006 )
      ( MAKE-2CRATE ?auto_3003 ?auto_3001 ?auto_3002 )
      ( MAKE-1CRATE-VERIFY ?auto_3001 ?auto_3002 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3010 - SURFACE
      ?auto_3011 - SURFACE
      ?auto_3012 - SURFACE
    )
    :vars
    (
      ?auto_3013 - HOIST
      ?auto_3016 - PLACE
      ?auto_3015 - PLACE
      ?auto_3014 - HOIST
      ?auto_3017 - SURFACE
      ?auto_3018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3013 ?auto_3016 ) ( SURFACE-AT ?auto_3011 ?auto_3016 ) ( CLEAR ?auto_3011 ) ( IS-CRATE ?auto_3012 ) ( not ( = ?auto_3011 ?auto_3012 ) ) ( AVAILABLE ?auto_3013 ) ( ON ?auto_3011 ?auto_3010 ) ( not ( = ?auto_3010 ?auto_3011 ) ) ( not ( = ?auto_3010 ?auto_3012 ) ) ( not ( = ?auto_3015 ?auto_3016 ) ) ( HOIST-AT ?auto_3014 ?auto_3015 ) ( not ( = ?auto_3013 ?auto_3014 ) ) ( AVAILABLE ?auto_3014 ) ( SURFACE-AT ?auto_3012 ?auto_3015 ) ( ON ?auto_3012 ?auto_3017 ) ( CLEAR ?auto_3012 ) ( not ( = ?auto_3011 ?auto_3017 ) ) ( not ( = ?auto_3012 ?auto_3017 ) ) ( not ( = ?auto_3010 ?auto_3017 ) ) ( TRUCK-AT ?auto_3018 ?auto_3016 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3011 ?auto_3012 )
      ( MAKE-2CRATE-VERIFY ?auto_3010 ?auto_3011 ?auto_3012 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3019 - SURFACE
      ?auto_3020 - SURFACE
    )
    :vars
    (
      ?auto_3022 - HOIST
      ?auto_3024 - PLACE
      ?auto_3027 - SURFACE
      ?auto_3021 - PLACE
      ?auto_3025 - HOIST
      ?auto_3026 - SURFACE
      ?auto_3023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3022 ?auto_3024 ) ( IS-CRATE ?auto_3020 ) ( not ( = ?auto_3019 ?auto_3020 ) ) ( not ( = ?auto_3027 ?auto_3019 ) ) ( not ( = ?auto_3027 ?auto_3020 ) ) ( not ( = ?auto_3021 ?auto_3024 ) ) ( HOIST-AT ?auto_3025 ?auto_3021 ) ( not ( = ?auto_3022 ?auto_3025 ) ) ( AVAILABLE ?auto_3025 ) ( SURFACE-AT ?auto_3020 ?auto_3021 ) ( ON ?auto_3020 ?auto_3026 ) ( CLEAR ?auto_3020 ) ( not ( = ?auto_3019 ?auto_3026 ) ) ( not ( = ?auto_3020 ?auto_3026 ) ) ( not ( = ?auto_3027 ?auto_3026 ) ) ( TRUCK-AT ?auto_3023 ?auto_3024 ) ( SURFACE-AT ?auto_3027 ?auto_3024 ) ( CLEAR ?auto_3027 ) ( LIFTING ?auto_3022 ?auto_3019 ) ( IS-CRATE ?auto_3019 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3027 ?auto_3019 )
      ( MAKE-2CRATE ?auto_3027 ?auto_3019 ?auto_3020 )
      ( MAKE-1CRATE-VERIFY ?auto_3019 ?auto_3020 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3028 - SURFACE
      ?auto_3029 - SURFACE
      ?auto_3030 - SURFACE
    )
    :vars
    (
      ?auto_3031 - HOIST
      ?auto_3033 - PLACE
      ?auto_3035 - PLACE
      ?auto_3036 - HOIST
      ?auto_3032 - SURFACE
      ?auto_3034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3031 ?auto_3033 ) ( IS-CRATE ?auto_3030 ) ( not ( = ?auto_3029 ?auto_3030 ) ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( not ( = ?auto_3028 ?auto_3030 ) ) ( not ( = ?auto_3035 ?auto_3033 ) ) ( HOIST-AT ?auto_3036 ?auto_3035 ) ( not ( = ?auto_3031 ?auto_3036 ) ) ( AVAILABLE ?auto_3036 ) ( SURFACE-AT ?auto_3030 ?auto_3035 ) ( ON ?auto_3030 ?auto_3032 ) ( CLEAR ?auto_3030 ) ( not ( = ?auto_3029 ?auto_3032 ) ) ( not ( = ?auto_3030 ?auto_3032 ) ) ( not ( = ?auto_3028 ?auto_3032 ) ) ( TRUCK-AT ?auto_3034 ?auto_3033 ) ( SURFACE-AT ?auto_3028 ?auto_3033 ) ( CLEAR ?auto_3028 ) ( LIFTING ?auto_3031 ?auto_3029 ) ( IS-CRATE ?auto_3029 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3029 ?auto_3030 )
      ( MAKE-2CRATE-VERIFY ?auto_3028 ?auto_3029 ?auto_3030 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3037 - SURFACE
      ?auto_3038 - SURFACE
    )
    :vars
    (
      ?auto_3043 - HOIST
      ?auto_3045 - PLACE
      ?auto_3044 - SURFACE
      ?auto_3042 - PLACE
      ?auto_3039 - HOIST
      ?auto_3040 - SURFACE
      ?auto_3041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3043 ?auto_3045 ) ( IS-CRATE ?auto_3038 ) ( not ( = ?auto_3037 ?auto_3038 ) ) ( not ( = ?auto_3044 ?auto_3037 ) ) ( not ( = ?auto_3044 ?auto_3038 ) ) ( not ( = ?auto_3042 ?auto_3045 ) ) ( HOIST-AT ?auto_3039 ?auto_3042 ) ( not ( = ?auto_3043 ?auto_3039 ) ) ( AVAILABLE ?auto_3039 ) ( SURFACE-AT ?auto_3038 ?auto_3042 ) ( ON ?auto_3038 ?auto_3040 ) ( CLEAR ?auto_3038 ) ( not ( = ?auto_3037 ?auto_3040 ) ) ( not ( = ?auto_3038 ?auto_3040 ) ) ( not ( = ?auto_3044 ?auto_3040 ) ) ( TRUCK-AT ?auto_3041 ?auto_3045 ) ( SURFACE-AT ?auto_3044 ?auto_3045 ) ( CLEAR ?auto_3044 ) ( IS-CRATE ?auto_3037 ) ( AVAILABLE ?auto_3043 ) ( IN ?auto_3037 ?auto_3041 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3043 ?auto_3037 ?auto_3041 ?auto_3045 )
      ( MAKE-2CRATE ?auto_3044 ?auto_3037 ?auto_3038 )
      ( MAKE-1CRATE-VERIFY ?auto_3037 ?auto_3038 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3046 - SURFACE
      ?auto_3047 - SURFACE
      ?auto_3048 - SURFACE
    )
    :vars
    (
      ?auto_3054 - HOIST
      ?auto_3049 - PLACE
      ?auto_3051 - PLACE
      ?auto_3053 - HOIST
      ?auto_3050 - SURFACE
      ?auto_3052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3054 ?auto_3049 ) ( IS-CRATE ?auto_3048 ) ( not ( = ?auto_3047 ?auto_3048 ) ) ( not ( = ?auto_3046 ?auto_3047 ) ) ( not ( = ?auto_3046 ?auto_3048 ) ) ( not ( = ?auto_3051 ?auto_3049 ) ) ( HOIST-AT ?auto_3053 ?auto_3051 ) ( not ( = ?auto_3054 ?auto_3053 ) ) ( AVAILABLE ?auto_3053 ) ( SURFACE-AT ?auto_3048 ?auto_3051 ) ( ON ?auto_3048 ?auto_3050 ) ( CLEAR ?auto_3048 ) ( not ( = ?auto_3047 ?auto_3050 ) ) ( not ( = ?auto_3048 ?auto_3050 ) ) ( not ( = ?auto_3046 ?auto_3050 ) ) ( TRUCK-AT ?auto_3052 ?auto_3049 ) ( SURFACE-AT ?auto_3046 ?auto_3049 ) ( CLEAR ?auto_3046 ) ( IS-CRATE ?auto_3047 ) ( AVAILABLE ?auto_3054 ) ( IN ?auto_3047 ?auto_3052 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3047 ?auto_3048 )
      ( MAKE-2CRATE-VERIFY ?auto_3046 ?auto_3047 ?auto_3048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3055 - SURFACE
      ?auto_3056 - SURFACE
    )
    :vars
    (
      ?auto_3059 - HOIST
      ?auto_3058 - PLACE
      ?auto_3060 - SURFACE
      ?auto_3061 - PLACE
      ?auto_3063 - HOIST
      ?auto_3062 - SURFACE
      ?auto_3057 - TRUCK
      ?auto_3064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3059 ?auto_3058 ) ( IS-CRATE ?auto_3056 ) ( not ( = ?auto_3055 ?auto_3056 ) ) ( not ( = ?auto_3060 ?auto_3055 ) ) ( not ( = ?auto_3060 ?auto_3056 ) ) ( not ( = ?auto_3061 ?auto_3058 ) ) ( HOIST-AT ?auto_3063 ?auto_3061 ) ( not ( = ?auto_3059 ?auto_3063 ) ) ( AVAILABLE ?auto_3063 ) ( SURFACE-AT ?auto_3056 ?auto_3061 ) ( ON ?auto_3056 ?auto_3062 ) ( CLEAR ?auto_3056 ) ( not ( = ?auto_3055 ?auto_3062 ) ) ( not ( = ?auto_3056 ?auto_3062 ) ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( SURFACE-AT ?auto_3060 ?auto_3058 ) ( CLEAR ?auto_3060 ) ( IS-CRATE ?auto_3055 ) ( AVAILABLE ?auto_3059 ) ( IN ?auto_3055 ?auto_3057 ) ( TRUCK-AT ?auto_3057 ?auto_3064 ) ( not ( = ?auto_3064 ?auto_3058 ) ) ( not ( = ?auto_3061 ?auto_3064 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3057 ?auto_3064 ?auto_3058 )
      ( MAKE-2CRATE ?auto_3060 ?auto_3055 ?auto_3056 )
      ( MAKE-1CRATE-VERIFY ?auto_3055 ?auto_3056 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3065 - SURFACE
      ?auto_3066 - SURFACE
      ?auto_3067 - SURFACE
    )
    :vars
    (
      ?auto_3069 - HOIST
      ?auto_3073 - PLACE
      ?auto_3071 - PLACE
      ?auto_3072 - HOIST
      ?auto_3070 - SURFACE
      ?auto_3068 - TRUCK
      ?auto_3074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3069 ?auto_3073 ) ( IS-CRATE ?auto_3067 ) ( not ( = ?auto_3066 ?auto_3067 ) ) ( not ( = ?auto_3065 ?auto_3066 ) ) ( not ( = ?auto_3065 ?auto_3067 ) ) ( not ( = ?auto_3071 ?auto_3073 ) ) ( HOIST-AT ?auto_3072 ?auto_3071 ) ( not ( = ?auto_3069 ?auto_3072 ) ) ( AVAILABLE ?auto_3072 ) ( SURFACE-AT ?auto_3067 ?auto_3071 ) ( ON ?auto_3067 ?auto_3070 ) ( CLEAR ?auto_3067 ) ( not ( = ?auto_3066 ?auto_3070 ) ) ( not ( = ?auto_3067 ?auto_3070 ) ) ( not ( = ?auto_3065 ?auto_3070 ) ) ( SURFACE-AT ?auto_3065 ?auto_3073 ) ( CLEAR ?auto_3065 ) ( IS-CRATE ?auto_3066 ) ( AVAILABLE ?auto_3069 ) ( IN ?auto_3066 ?auto_3068 ) ( TRUCK-AT ?auto_3068 ?auto_3074 ) ( not ( = ?auto_3074 ?auto_3073 ) ) ( not ( = ?auto_3071 ?auto_3074 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3066 ?auto_3067 )
      ( MAKE-2CRATE-VERIFY ?auto_3065 ?auto_3066 ?auto_3067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3075 - SURFACE
      ?auto_3076 - SURFACE
    )
    :vars
    (
      ?auto_3077 - HOIST
      ?auto_3078 - PLACE
      ?auto_3084 - SURFACE
      ?auto_3080 - PLACE
      ?auto_3079 - HOIST
      ?auto_3081 - SURFACE
      ?auto_3083 - TRUCK
      ?auto_3082 - PLACE
      ?auto_3085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3077 ?auto_3078 ) ( IS-CRATE ?auto_3076 ) ( not ( = ?auto_3075 ?auto_3076 ) ) ( not ( = ?auto_3084 ?auto_3075 ) ) ( not ( = ?auto_3084 ?auto_3076 ) ) ( not ( = ?auto_3080 ?auto_3078 ) ) ( HOIST-AT ?auto_3079 ?auto_3080 ) ( not ( = ?auto_3077 ?auto_3079 ) ) ( AVAILABLE ?auto_3079 ) ( SURFACE-AT ?auto_3076 ?auto_3080 ) ( ON ?auto_3076 ?auto_3081 ) ( CLEAR ?auto_3076 ) ( not ( = ?auto_3075 ?auto_3081 ) ) ( not ( = ?auto_3076 ?auto_3081 ) ) ( not ( = ?auto_3084 ?auto_3081 ) ) ( SURFACE-AT ?auto_3084 ?auto_3078 ) ( CLEAR ?auto_3084 ) ( IS-CRATE ?auto_3075 ) ( AVAILABLE ?auto_3077 ) ( TRUCK-AT ?auto_3083 ?auto_3082 ) ( not ( = ?auto_3082 ?auto_3078 ) ) ( not ( = ?auto_3080 ?auto_3082 ) ) ( HOIST-AT ?auto_3085 ?auto_3082 ) ( LIFTING ?auto_3085 ?auto_3075 ) ( not ( = ?auto_3077 ?auto_3085 ) ) ( not ( = ?auto_3079 ?auto_3085 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3085 ?auto_3075 ?auto_3083 ?auto_3082 )
      ( MAKE-2CRATE ?auto_3084 ?auto_3075 ?auto_3076 )
      ( MAKE-1CRATE-VERIFY ?auto_3075 ?auto_3076 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3086 - SURFACE
      ?auto_3087 - SURFACE
      ?auto_3088 - SURFACE
    )
    :vars
    (
      ?auto_3095 - HOIST
      ?auto_3091 - PLACE
      ?auto_3096 - PLACE
      ?auto_3093 - HOIST
      ?auto_3090 - SURFACE
      ?auto_3089 - TRUCK
      ?auto_3094 - PLACE
      ?auto_3092 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3095 ?auto_3091 ) ( IS-CRATE ?auto_3088 ) ( not ( = ?auto_3087 ?auto_3088 ) ) ( not ( = ?auto_3086 ?auto_3087 ) ) ( not ( = ?auto_3086 ?auto_3088 ) ) ( not ( = ?auto_3096 ?auto_3091 ) ) ( HOIST-AT ?auto_3093 ?auto_3096 ) ( not ( = ?auto_3095 ?auto_3093 ) ) ( AVAILABLE ?auto_3093 ) ( SURFACE-AT ?auto_3088 ?auto_3096 ) ( ON ?auto_3088 ?auto_3090 ) ( CLEAR ?auto_3088 ) ( not ( = ?auto_3087 ?auto_3090 ) ) ( not ( = ?auto_3088 ?auto_3090 ) ) ( not ( = ?auto_3086 ?auto_3090 ) ) ( SURFACE-AT ?auto_3086 ?auto_3091 ) ( CLEAR ?auto_3086 ) ( IS-CRATE ?auto_3087 ) ( AVAILABLE ?auto_3095 ) ( TRUCK-AT ?auto_3089 ?auto_3094 ) ( not ( = ?auto_3094 ?auto_3091 ) ) ( not ( = ?auto_3096 ?auto_3094 ) ) ( HOIST-AT ?auto_3092 ?auto_3094 ) ( LIFTING ?auto_3092 ?auto_3087 ) ( not ( = ?auto_3095 ?auto_3092 ) ) ( not ( = ?auto_3093 ?auto_3092 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3087 ?auto_3088 )
      ( MAKE-2CRATE-VERIFY ?auto_3086 ?auto_3087 ?auto_3088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3097 - SURFACE
      ?auto_3098 - SURFACE
    )
    :vars
    (
      ?auto_3100 - HOIST
      ?auto_3105 - PLACE
      ?auto_3102 - SURFACE
      ?auto_3104 - PLACE
      ?auto_3106 - HOIST
      ?auto_3103 - SURFACE
      ?auto_3107 - TRUCK
      ?auto_3101 - PLACE
      ?auto_3099 - HOIST
      ?auto_3108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3100 ?auto_3105 ) ( IS-CRATE ?auto_3098 ) ( not ( = ?auto_3097 ?auto_3098 ) ) ( not ( = ?auto_3102 ?auto_3097 ) ) ( not ( = ?auto_3102 ?auto_3098 ) ) ( not ( = ?auto_3104 ?auto_3105 ) ) ( HOIST-AT ?auto_3106 ?auto_3104 ) ( not ( = ?auto_3100 ?auto_3106 ) ) ( AVAILABLE ?auto_3106 ) ( SURFACE-AT ?auto_3098 ?auto_3104 ) ( ON ?auto_3098 ?auto_3103 ) ( CLEAR ?auto_3098 ) ( not ( = ?auto_3097 ?auto_3103 ) ) ( not ( = ?auto_3098 ?auto_3103 ) ) ( not ( = ?auto_3102 ?auto_3103 ) ) ( SURFACE-AT ?auto_3102 ?auto_3105 ) ( CLEAR ?auto_3102 ) ( IS-CRATE ?auto_3097 ) ( AVAILABLE ?auto_3100 ) ( TRUCK-AT ?auto_3107 ?auto_3101 ) ( not ( = ?auto_3101 ?auto_3105 ) ) ( not ( = ?auto_3104 ?auto_3101 ) ) ( HOIST-AT ?auto_3099 ?auto_3101 ) ( not ( = ?auto_3100 ?auto_3099 ) ) ( not ( = ?auto_3106 ?auto_3099 ) ) ( AVAILABLE ?auto_3099 ) ( SURFACE-AT ?auto_3097 ?auto_3101 ) ( ON ?auto_3097 ?auto_3108 ) ( CLEAR ?auto_3097 ) ( not ( = ?auto_3097 ?auto_3108 ) ) ( not ( = ?auto_3098 ?auto_3108 ) ) ( not ( = ?auto_3102 ?auto_3108 ) ) ( not ( = ?auto_3103 ?auto_3108 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3099 ?auto_3097 ?auto_3108 ?auto_3101 )
      ( MAKE-2CRATE ?auto_3102 ?auto_3097 ?auto_3098 )
      ( MAKE-1CRATE-VERIFY ?auto_3097 ?auto_3098 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3109 - SURFACE
      ?auto_3110 - SURFACE
      ?auto_3111 - SURFACE
    )
    :vars
    (
      ?auto_3113 - HOIST
      ?auto_3117 - PLACE
      ?auto_3112 - PLACE
      ?auto_3119 - HOIST
      ?auto_3116 - SURFACE
      ?auto_3114 - TRUCK
      ?auto_3118 - PLACE
      ?auto_3115 - HOIST
      ?auto_3120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3113 ?auto_3117 ) ( IS-CRATE ?auto_3111 ) ( not ( = ?auto_3110 ?auto_3111 ) ) ( not ( = ?auto_3109 ?auto_3110 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3112 ?auto_3117 ) ) ( HOIST-AT ?auto_3119 ?auto_3112 ) ( not ( = ?auto_3113 ?auto_3119 ) ) ( AVAILABLE ?auto_3119 ) ( SURFACE-AT ?auto_3111 ?auto_3112 ) ( ON ?auto_3111 ?auto_3116 ) ( CLEAR ?auto_3111 ) ( not ( = ?auto_3110 ?auto_3116 ) ) ( not ( = ?auto_3111 ?auto_3116 ) ) ( not ( = ?auto_3109 ?auto_3116 ) ) ( SURFACE-AT ?auto_3109 ?auto_3117 ) ( CLEAR ?auto_3109 ) ( IS-CRATE ?auto_3110 ) ( AVAILABLE ?auto_3113 ) ( TRUCK-AT ?auto_3114 ?auto_3118 ) ( not ( = ?auto_3118 ?auto_3117 ) ) ( not ( = ?auto_3112 ?auto_3118 ) ) ( HOIST-AT ?auto_3115 ?auto_3118 ) ( not ( = ?auto_3113 ?auto_3115 ) ) ( not ( = ?auto_3119 ?auto_3115 ) ) ( AVAILABLE ?auto_3115 ) ( SURFACE-AT ?auto_3110 ?auto_3118 ) ( ON ?auto_3110 ?auto_3120 ) ( CLEAR ?auto_3110 ) ( not ( = ?auto_3110 ?auto_3120 ) ) ( not ( = ?auto_3111 ?auto_3120 ) ) ( not ( = ?auto_3109 ?auto_3120 ) ) ( not ( = ?auto_3116 ?auto_3120 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3110 ?auto_3111 )
      ( MAKE-2CRATE-VERIFY ?auto_3109 ?auto_3110 ?auto_3111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3121 - SURFACE
      ?auto_3122 - SURFACE
    )
    :vars
    (
      ?auto_3131 - HOIST
      ?auto_3128 - PLACE
      ?auto_3125 - SURFACE
      ?auto_3130 - PLACE
      ?auto_3132 - HOIST
      ?auto_3126 - SURFACE
      ?auto_3124 - PLACE
      ?auto_3127 - HOIST
      ?auto_3129 - SURFACE
      ?auto_3123 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3131 ?auto_3128 ) ( IS-CRATE ?auto_3122 ) ( not ( = ?auto_3121 ?auto_3122 ) ) ( not ( = ?auto_3125 ?auto_3121 ) ) ( not ( = ?auto_3125 ?auto_3122 ) ) ( not ( = ?auto_3130 ?auto_3128 ) ) ( HOIST-AT ?auto_3132 ?auto_3130 ) ( not ( = ?auto_3131 ?auto_3132 ) ) ( AVAILABLE ?auto_3132 ) ( SURFACE-AT ?auto_3122 ?auto_3130 ) ( ON ?auto_3122 ?auto_3126 ) ( CLEAR ?auto_3122 ) ( not ( = ?auto_3121 ?auto_3126 ) ) ( not ( = ?auto_3122 ?auto_3126 ) ) ( not ( = ?auto_3125 ?auto_3126 ) ) ( SURFACE-AT ?auto_3125 ?auto_3128 ) ( CLEAR ?auto_3125 ) ( IS-CRATE ?auto_3121 ) ( AVAILABLE ?auto_3131 ) ( not ( = ?auto_3124 ?auto_3128 ) ) ( not ( = ?auto_3130 ?auto_3124 ) ) ( HOIST-AT ?auto_3127 ?auto_3124 ) ( not ( = ?auto_3131 ?auto_3127 ) ) ( not ( = ?auto_3132 ?auto_3127 ) ) ( AVAILABLE ?auto_3127 ) ( SURFACE-AT ?auto_3121 ?auto_3124 ) ( ON ?auto_3121 ?auto_3129 ) ( CLEAR ?auto_3121 ) ( not ( = ?auto_3121 ?auto_3129 ) ) ( not ( = ?auto_3122 ?auto_3129 ) ) ( not ( = ?auto_3125 ?auto_3129 ) ) ( not ( = ?auto_3126 ?auto_3129 ) ) ( TRUCK-AT ?auto_3123 ?auto_3128 ) )
    :subtasks
    ( ( !DRIVE ?auto_3123 ?auto_3128 ?auto_3124 )
      ( MAKE-2CRATE ?auto_3125 ?auto_3121 ?auto_3122 )
      ( MAKE-1CRATE-VERIFY ?auto_3121 ?auto_3122 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3133 - SURFACE
      ?auto_3134 - SURFACE
      ?auto_3135 - SURFACE
    )
    :vars
    (
      ?auto_3136 - HOIST
      ?auto_3138 - PLACE
      ?auto_3141 - PLACE
      ?auto_3142 - HOIST
      ?auto_3144 - SURFACE
      ?auto_3137 - PLACE
      ?auto_3139 - HOIST
      ?auto_3143 - SURFACE
      ?auto_3140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3136 ?auto_3138 ) ( IS-CRATE ?auto_3135 ) ( not ( = ?auto_3134 ?auto_3135 ) ) ( not ( = ?auto_3133 ?auto_3134 ) ) ( not ( = ?auto_3133 ?auto_3135 ) ) ( not ( = ?auto_3141 ?auto_3138 ) ) ( HOIST-AT ?auto_3142 ?auto_3141 ) ( not ( = ?auto_3136 ?auto_3142 ) ) ( AVAILABLE ?auto_3142 ) ( SURFACE-AT ?auto_3135 ?auto_3141 ) ( ON ?auto_3135 ?auto_3144 ) ( CLEAR ?auto_3135 ) ( not ( = ?auto_3134 ?auto_3144 ) ) ( not ( = ?auto_3135 ?auto_3144 ) ) ( not ( = ?auto_3133 ?auto_3144 ) ) ( SURFACE-AT ?auto_3133 ?auto_3138 ) ( CLEAR ?auto_3133 ) ( IS-CRATE ?auto_3134 ) ( AVAILABLE ?auto_3136 ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( not ( = ?auto_3141 ?auto_3137 ) ) ( HOIST-AT ?auto_3139 ?auto_3137 ) ( not ( = ?auto_3136 ?auto_3139 ) ) ( not ( = ?auto_3142 ?auto_3139 ) ) ( AVAILABLE ?auto_3139 ) ( SURFACE-AT ?auto_3134 ?auto_3137 ) ( ON ?auto_3134 ?auto_3143 ) ( CLEAR ?auto_3134 ) ( not ( = ?auto_3134 ?auto_3143 ) ) ( not ( = ?auto_3135 ?auto_3143 ) ) ( not ( = ?auto_3133 ?auto_3143 ) ) ( not ( = ?auto_3144 ?auto_3143 ) ) ( TRUCK-AT ?auto_3140 ?auto_3138 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3134 ?auto_3135 )
      ( MAKE-2CRATE-VERIFY ?auto_3133 ?auto_3134 ?auto_3135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3154 - SURFACE
      ?auto_3155 - SURFACE
    )
    :vars
    (
      ?auto_3156 - HOIST
      ?auto_3157 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3156 ?auto_3157 ) ( SURFACE-AT ?auto_3154 ?auto_3157 ) ( CLEAR ?auto_3154 ) ( LIFTING ?auto_3156 ?auto_3155 ) ( IS-CRATE ?auto_3155 ) ( not ( = ?auto_3154 ?auto_3155 ) ) )
    :subtasks
    ( ( !DROP ?auto_3156 ?auto_3155 ?auto_3154 ?auto_3157 )
      ( MAKE-1CRATE-VERIFY ?auto_3154 ?auto_3155 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3158 - SURFACE
      ?auto_3159 - SURFACE
      ?auto_3160 - SURFACE
    )
    :vars
    (
      ?auto_3161 - HOIST
      ?auto_3162 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3161 ?auto_3162 ) ( SURFACE-AT ?auto_3159 ?auto_3162 ) ( CLEAR ?auto_3159 ) ( LIFTING ?auto_3161 ?auto_3160 ) ( IS-CRATE ?auto_3160 ) ( not ( = ?auto_3159 ?auto_3160 ) ) ( ON ?auto_3159 ?auto_3158 ) ( not ( = ?auto_3158 ?auto_3159 ) ) ( not ( = ?auto_3158 ?auto_3160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3159 ?auto_3160 )
      ( MAKE-2CRATE-VERIFY ?auto_3158 ?auto_3159 ?auto_3160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3163 - SURFACE
      ?auto_3164 - SURFACE
      ?auto_3165 - SURFACE
      ?auto_3166 - SURFACE
    )
    :vars
    (
      ?auto_3167 - HOIST
      ?auto_3168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3167 ?auto_3168 ) ( SURFACE-AT ?auto_3165 ?auto_3168 ) ( CLEAR ?auto_3165 ) ( LIFTING ?auto_3167 ?auto_3166 ) ( IS-CRATE ?auto_3166 ) ( not ( = ?auto_3165 ?auto_3166 ) ) ( ON ?auto_3164 ?auto_3163 ) ( ON ?auto_3165 ?auto_3164 ) ( not ( = ?auto_3163 ?auto_3164 ) ) ( not ( = ?auto_3163 ?auto_3165 ) ) ( not ( = ?auto_3163 ?auto_3166 ) ) ( not ( = ?auto_3164 ?auto_3165 ) ) ( not ( = ?auto_3164 ?auto_3166 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3165 ?auto_3166 )
      ( MAKE-3CRATE-VERIFY ?auto_3163 ?auto_3164 ?auto_3165 ?auto_3166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3169 - SURFACE
      ?auto_3170 - SURFACE
    )
    :vars
    (
      ?auto_3171 - HOIST
      ?auto_3172 - PLACE
      ?auto_3173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3171 ?auto_3172 ) ( SURFACE-AT ?auto_3169 ?auto_3172 ) ( CLEAR ?auto_3169 ) ( IS-CRATE ?auto_3170 ) ( not ( = ?auto_3169 ?auto_3170 ) ) ( TRUCK-AT ?auto_3173 ?auto_3172 ) ( AVAILABLE ?auto_3171 ) ( IN ?auto_3170 ?auto_3173 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3171 ?auto_3170 ?auto_3173 ?auto_3172 )
      ( MAKE-1CRATE ?auto_3169 ?auto_3170 )
      ( MAKE-1CRATE-VERIFY ?auto_3169 ?auto_3170 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3174 - SURFACE
      ?auto_3175 - SURFACE
      ?auto_3176 - SURFACE
    )
    :vars
    (
      ?auto_3177 - HOIST
      ?auto_3179 - PLACE
      ?auto_3178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3177 ?auto_3179 ) ( SURFACE-AT ?auto_3175 ?auto_3179 ) ( CLEAR ?auto_3175 ) ( IS-CRATE ?auto_3176 ) ( not ( = ?auto_3175 ?auto_3176 ) ) ( TRUCK-AT ?auto_3178 ?auto_3179 ) ( AVAILABLE ?auto_3177 ) ( IN ?auto_3176 ?auto_3178 ) ( ON ?auto_3175 ?auto_3174 ) ( not ( = ?auto_3174 ?auto_3175 ) ) ( not ( = ?auto_3174 ?auto_3176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3175 ?auto_3176 )
      ( MAKE-2CRATE-VERIFY ?auto_3174 ?auto_3175 ?auto_3176 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3180 - SURFACE
      ?auto_3181 - SURFACE
      ?auto_3182 - SURFACE
      ?auto_3183 - SURFACE
    )
    :vars
    (
      ?auto_3184 - HOIST
      ?auto_3185 - PLACE
      ?auto_3186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3184 ?auto_3185 ) ( SURFACE-AT ?auto_3182 ?auto_3185 ) ( CLEAR ?auto_3182 ) ( IS-CRATE ?auto_3183 ) ( not ( = ?auto_3182 ?auto_3183 ) ) ( TRUCK-AT ?auto_3186 ?auto_3185 ) ( AVAILABLE ?auto_3184 ) ( IN ?auto_3183 ?auto_3186 ) ( ON ?auto_3182 ?auto_3181 ) ( not ( = ?auto_3181 ?auto_3182 ) ) ( not ( = ?auto_3181 ?auto_3183 ) ) ( ON ?auto_3181 ?auto_3180 ) ( not ( = ?auto_3180 ?auto_3181 ) ) ( not ( = ?auto_3180 ?auto_3182 ) ) ( not ( = ?auto_3180 ?auto_3183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3181 ?auto_3182 ?auto_3183 )
      ( MAKE-3CRATE-VERIFY ?auto_3180 ?auto_3181 ?auto_3182 ?auto_3183 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3187 - SURFACE
      ?auto_3188 - SURFACE
    )
    :vars
    (
      ?auto_3189 - HOIST
      ?auto_3190 - PLACE
      ?auto_3191 - TRUCK
      ?auto_3192 - SURFACE
      ?auto_3193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3189 ?auto_3190 ) ( SURFACE-AT ?auto_3187 ?auto_3190 ) ( CLEAR ?auto_3187 ) ( IS-CRATE ?auto_3188 ) ( not ( = ?auto_3187 ?auto_3188 ) ) ( AVAILABLE ?auto_3189 ) ( IN ?auto_3188 ?auto_3191 ) ( ON ?auto_3187 ?auto_3192 ) ( not ( = ?auto_3192 ?auto_3187 ) ) ( not ( = ?auto_3192 ?auto_3188 ) ) ( TRUCK-AT ?auto_3191 ?auto_3193 ) ( not ( = ?auto_3193 ?auto_3190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3191 ?auto_3193 ?auto_3190 )
      ( MAKE-2CRATE ?auto_3192 ?auto_3187 ?auto_3188 )
      ( MAKE-1CRATE-VERIFY ?auto_3187 ?auto_3188 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3194 - SURFACE
      ?auto_3195 - SURFACE
      ?auto_3196 - SURFACE
    )
    :vars
    (
      ?auto_3199 - HOIST
      ?auto_3197 - PLACE
      ?auto_3200 - TRUCK
      ?auto_3198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3199 ?auto_3197 ) ( SURFACE-AT ?auto_3195 ?auto_3197 ) ( CLEAR ?auto_3195 ) ( IS-CRATE ?auto_3196 ) ( not ( = ?auto_3195 ?auto_3196 ) ) ( AVAILABLE ?auto_3199 ) ( IN ?auto_3196 ?auto_3200 ) ( ON ?auto_3195 ?auto_3194 ) ( not ( = ?auto_3194 ?auto_3195 ) ) ( not ( = ?auto_3194 ?auto_3196 ) ) ( TRUCK-AT ?auto_3200 ?auto_3198 ) ( not ( = ?auto_3198 ?auto_3197 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3195 ?auto_3196 )
      ( MAKE-2CRATE-VERIFY ?auto_3194 ?auto_3195 ?auto_3196 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3201 - SURFACE
      ?auto_3202 - SURFACE
      ?auto_3203 - SURFACE
      ?auto_3204 - SURFACE
    )
    :vars
    (
      ?auto_3205 - HOIST
      ?auto_3206 - PLACE
      ?auto_3207 - TRUCK
      ?auto_3208 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3205 ?auto_3206 ) ( SURFACE-AT ?auto_3203 ?auto_3206 ) ( CLEAR ?auto_3203 ) ( IS-CRATE ?auto_3204 ) ( not ( = ?auto_3203 ?auto_3204 ) ) ( AVAILABLE ?auto_3205 ) ( IN ?auto_3204 ?auto_3207 ) ( ON ?auto_3203 ?auto_3202 ) ( not ( = ?auto_3202 ?auto_3203 ) ) ( not ( = ?auto_3202 ?auto_3204 ) ) ( TRUCK-AT ?auto_3207 ?auto_3208 ) ( not ( = ?auto_3208 ?auto_3206 ) ) ( ON ?auto_3202 ?auto_3201 ) ( not ( = ?auto_3201 ?auto_3202 ) ) ( not ( = ?auto_3201 ?auto_3203 ) ) ( not ( = ?auto_3201 ?auto_3204 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3202 ?auto_3203 ?auto_3204 )
      ( MAKE-3CRATE-VERIFY ?auto_3201 ?auto_3202 ?auto_3203 ?auto_3204 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3209 - SURFACE
      ?auto_3210 - SURFACE
    )
    :vars
    (
      ?auto_3211 - HOIST
      ?auto_3212 - PLACE
      ?auto_3213 - SURFACE
      ?auto_3214 - TRUCK
      ?auto_3215 - PLACE
      ?auto_3216 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3211 ?auto_3212 ) ( SURFACE-AT ?auto_3209 ?auto_3212 ) ( CLEAR ?auto_3209 ) ( IS-CRATE ?auto_3210 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( AVAILABLE ?auto_3211 ) ( ON ?auto_3209 ?auto_3213 ) ( not ( = ?auto_3213 ?auto_3209 ) ) ( not ( = ?auto_3213 ?auto_3210 ) ) ( TRUCK-AT ?auto_3214 ?auto_3215 ) ( not ( = ?auto_3215 ?auto_3212 ) ) ( HOIST-AT ?auto_3216 ?auto_3215 ) ( LIFTING ?auto_3216 ?auto_3210 ) ( not ( = ?auto_3211 ?auto_3216 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3216 ?auto_3210 ?auto_3214 ?auto_3215 )
      ( MAKE-2CRATE ?auto_3213 ?auto_3209 ?auto_3210 )
      ( MAKE-1CRATE-VERIFY ?auto_3209 ?auto_3210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3217 - SURFACE
      ?auto_3218 - SURFACE
      ?auto_3219 - SURFACE
    )
    :vars
    (
      ?auto_3223 - HOIST
      ?auto_3222 - PLACE
      ?auto_3220 - TRUCK
      ?auto_3224 - PLACE
      ?auto_3221 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3223 ?auto_3222 ) ( SURFACE-AT ?auto_3218 ?auto_3222 ) ( CLEAR ?auto_3218 ) ( IS-CRATE ?auto_3219 ) ( not ( = ?auto_3218 ?auto_3219 ) ) ( AVAILABLE ?auto_3223 ) ( ON ?auto_3218 ?auto_3217 ) ( not ( = ?auto_3217 ?auto_3218 ) ) ( not ( = ?auto_3217 ?auto_3219 ) ) ( TRUCK-AT ?auto_3220 ?auto_3224 ) ( not ( = ?auto_3224 ?auto_3222 ) ) ( HOIST-AT ?auto_3221 ?auto_3224 ) ( LIFTING ?auto_3221 ?auto_3219 ) ( not ( = ?auto_3223 ?auto_3221 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3218 ?auto_3219 )
      ( MAKE-2CRATE-VERIFY ?auto_3217 ?auto_3218 ?auto_3219 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3225 - SURFACE
      ?auto_3226 - SURFACE
      ?auto_3227 - SURFACE
      ?auto_3228 - SURFACE
    )
    :vars
    (
      ?auto_3229 - HOIST
      ?auto_3233 - PLACE
      ?auto_3231 - TRUCK
      ?auto_3230 - PLACE
      ?auto_3232 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3229 ?auto_3233 ) ( SURFACE-AT ?auto_3227 ?auto_3233 ) ( CLEAR ?auto_3227 ) ( IS-CRATE ?auto_3228 ) ( not ( = ?auto_3227 ?auto_3228 ) ) ( AVAILABLE ?auto_3229 ) ( ON ?auto_3227 ?auto_3226 ) ( not ( = ?auto_3226 ?auto_3227 ) ) ( not ( = ?auto_3226 ?auto_3228 ) ) ( TRUCK-AT ?auto_3231 ?auto_3230 ) ( not ( = ?auto_3230 ?auto_3233 ) ) ( HOIST-AT ?auto_3232 ?auto_3230 ) ( LIFTING ?auto_3232 ?auto_3228 ) ( not ( = ?auto_3229 ?auto_3232 ) ) ( ON ?auto_3226 ?auto_3225 ) ( not ( = ?auto_3225 ?auto_3226 ) ) ( not ( = ?auto_3225 ?auto_3227 ) ) ( not ( = ?auto_3225 ?auto_3228 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3226 ?auto_3227 ?auto_3228 )
      ( MAKE-3CRATE-VERIFY ?auto_3225 ?auto_3226 ?auto_3227 ?auto_3228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3234 - SURFACE
      ?auto_3235 - SURFACE
    )
    :vars
    (
      ?auto_3236 - HOIST
      ?auto_3241 - PLACE
      ?auto_3238 - SURFACE
      ?auto_3239 - TRUCK
      ?auto_3237 - PLACE
      ?auto_3240 - HOIST
      ?auto_3242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3236 ?auto_3241 ) ( SURFACE-AT ?auto_3234 ?auto_3241 ) ( CLEAR ?auto_3234 ) ( IS-CRATE ?auto_3235 ) ( not ( = ?auto_3234 ?auto_3235 ) ) ( AVAILABLE ?auto_3236 ) ( ON ?auto_3234 ?auto_3238 ) ( not ( = ?auto_3238 ?auto_3234 ) ) ( not ( = ?auto_3238 ?auto_3235 ) ) ( TRUCK-AT ?auto_3239 ?auto_3237 ) ( not ( = ?auto_3237 ?auto_3241 ) ) ( HOIST-AT ?auto_3240 ?auto_3237 ) ( not ( = ?auto_3236 ?auto_3240 ) ) ( AVAILABLE ?auto_3240 ) ( SURFACE-AT ?auto_3235 ?auto_3237 ) ( ON ?auto_3235 ?auto_3242 ) ( CLEAR ?auto_3235 ) ( not ( = ?auto_3234 ?auto_3242 ) ) ( not ( = ?auto_3235 ?auto_3242 ) ) ( not ( = ?auto_3238 ?auto_3242 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3240 ?auto_3235 ?auto_3242 ?auto_3237 )
      ( MAKE-2CRATE ?auto_3238 ?auto_3234 ?auto_3235 )
      ( MAKE-1CRATE-VERIFY ?auto_3234 ?auto_3235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3243 - SURFACE
      ?auto_3244 - SURFACE
      ?auto_3245 - SURFACE
    )
    :vars
    (
      ?auto_3249 - HOIST
      ?auto_3251 - PLACE
      ?auto_3246 - TRUCK
      ?auto_3247 - PLACE
      ?auto_3250 - HOIST
      ?auto_3248 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3249 ?auto_3251 ) ( SURFACE-AT ?auto_3244 ?auto_3251 ) ( CLEAR ?auto_3244 ) ( IS-CRATE ?auto_3245 ) ( not ( = ?auto_3244 ?auto_3245 ) ) ( AVAILABLE ?auto_3249 ) ( ON ?auto_3244 ?auto_3243 ) ( not ( = ?auto_3243 ?auto_3244 ) ) ( not ( = ?auto_3243 ?auto_3245 ) ) ( TRUCK-AT ?auto_3246 ?auto_3247 ) ( not ( = ?auto_3247 ?auto_3251 ) ) ( HOIST-AT ?auto_3250 ?auto_3247 ) ( not ( = ?auto_3249 ?auto_3250 ) ) ( AVAILABLE ?auto_3250 ) ( SURFACE-AT ?auto_3245 ?auto_3247 ) ( ON ?auto_3245 ?auto_3248 ) ( CLEAR ?auto_3245 ) ( not ( = ?auto_3244 ?auto_3248 ) ) ( not ( = ?auto_3245 ?auto_3248 ) ) ( not ( = ?auto_3243 ?auto_3248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3244 ?auto_3245 )
      ( MAKE-2CRATE-VERIFY ?auto_3243 ?auto_3244 ?auto_3245 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3252 - SURFACE
      ?auto_3253 - SURFACE
      ?auto_3254 - SURFACE
      ?auto_3255 - SURFACE
    )
    :vars
    (
      ?auto_3258 - HOIST
      ?auto_3259 - PLACE
      ?auto_3256 - TRUCK
      ?auto_3257 - PLACE
      ?auto_3260 - HOIST
      ?auto_3261 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3258 ?auto_3259 ) ( SURFACE-AT ?auto_3254 ?auto_3259 ) ( CLEAR ?auto_3254 ) ( IS-CRATE ?auto_3255 ) ( not ( = ?auto_3254 ?auto_3255 ) ) ( AVAILABLE ?auto_3258 ) ( ON ?auto_3254 ?auto_3253 ) ( not ( = ?auto_3253 ?auto_3254 ) ) ( not ( = ?auto_3253 ?auto_3255 ) ) ( TRUCK-AT ?auto_3256 ?auto_3257 ) ( not ( = ?auto_3257 ?auto_3259 ) ) ( HOIST-AT ?auto_3260 ?auto_3257 ) ( not ( = ?auto_3258 ?auto_3260 ) ) ( AVAILABLE ?auto_3260 ) ( SURFACE-AT ?auto_3255 ?auto_3257 ) ( ON ?auto_3255 ?auto_3261 ) ( CLEAR ?auto_3255 ) ( not ( = ?auto_3254 ?auto_3261 ) ) ( not ( = ?auto_3255 ?auto_3261 ) ) ( not ( = ?auto_3253 ?auto_3261 ) ) ( ON ?auto_3253 ?auto_3252 ) ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3254 ) ) ( not ( = ?auto_3252 ?auto_3255 ) ) ( not ( = ?auto_3252 ?auto_3261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3253 ?auto_3254 ?auto_3255 )
      ( MAKE-3CRATE-VERIFY ?auto_3252 ?auto_3253 ?auto_3254 ?auto_3255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3262 - SURFACE
      ?auto_3263 - SURFACE
    )
    :vars
    (
      ?auto_3266 - HOIST
      ?auto_3267 - PLACE
      ?auto_3270 - SURFACE
      ?auto_3265 - PLACE
      ?auto_3268 - HOIST
      ?auto_3269 - SURFACE
      ?auto_3264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3266 ?auto_3267 ) ( SURFACE-AT ?auto_3262 ?auto_3267 ) ( CLEAR ?auto_3262 ) ( IS-CRATE ?auto_3263 ) ( not ( = ?auto_3262 ?auto_3263 ) ) ( AVAILABLE ?auto_3266 ) ( ON ?auto_3262 ?auto_3270 ) ( not ( = ?auto_3270 ?auto_3262 ) ) ( not ( = ?auto_3270 ?auto_3263 ) ) ( not ( = ?auto_3265 ?auto_3267 ) ) ( HOIST-AT ?auto_3268 ?auto_3265 ) ( not ( = ?auto_3266 ?auto_3268 ) ) ( AVAILABLE ?auto_3268 ) ( SURFACE-AT ?auto_3263 ?auto_3265 ) ( ON ?auto_3263 ?auto_3269 ) ( CLEAR ?auto_3263 ) ( not ( = ?auto_3262 ?auto_3269 ) ) ( not ( = ?auto_3263 ?auto_3269 ) ) ( not ( = ?auto_3270 ?auto_3269 ) ) ( TRUCK-AT ?auto_3264 ?auto_3267 ) )
    :subtasks
    ( ( !DRIVE ?auto_3264 ?auto_3267 ?auto_3265 )
      ( MAKE-2CRATE ?auto_3270 ?auto_3262 ?auto_3263 )
      ( MAKE-1CRATE-VERIFY ?auto_3262 ?auto_3263 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3271 - SURFACE
      ?auto_3272 - SURFACE
      ?auto_3273 - SURFACE
    )
    :vars
    (
      ?auto_3277 - HOIST
      ?auto_3276 - PLACE
      ?auto_3278 - PLACE
      ?auto_3275 - HOIST
      ?auto_3274 - SURFACE
      ?auto_3279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3277 ?auto_3276 ) ( SURFACE-AT ?auto_3272 ?auto_3276 ) ( CLEAR ?auto_3272 ) ( IS-CRATE ?auto_3273 ) ( not ( = ?auto_3272 ?auto_3273 ) ) ( AVAILABLE ?auto_3277 ) ( ON ?auto_3272 ?auto_3271 ) ( not ( = ?auto_3271 ?auto_3272 ) ) ( not ( = ?auto_3271 ?auto_3273 ) ) ( not ( = ?auto_3278 ?auto_3276 ) ) ( HOIST-AT ?auto_3275 ?auto_3278 ) ( not ( = ?auto_3277 ?auto_3275 ) ) ( AVAILABLE ?auto_3275 ) ( SURFACE-AT ?auto_3273 ?auto_3278 ) ( ON ?auto_3273 ?auto_3274 ) ( CLEAR ?auto_3273 ) ( not ( = ?auto_3272 ?auto_3274 ) ) ( not ( = ?auto_3273 ?auto_3274 ) ) ( not ( = ?auto_3271 ?auto_3274 ) ) ( TRUCK-AT ?auto_3279 ?auto_3276 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3272 ?auto_3273 )
      ( MAKE-2CRATE-VERIFY ?auto_3271 ?auto_3272 ?auto_3273 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3280 - SURFACE
      ?auto_3281 - SURFACE
      ?auto_3282 - SURFACE
      ?auto_3283 - SURFACE
    )
    :vars
    (
      ?auto_3285 - HOIST
      ?auto_3286 - PLACE
      ?auto_3287 - PLACE
      ?auto_3288 - HOIST
      ?auto_3289 - SURFACE
      ?auto_3284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3285 ?auto_3286 ) ( SURFACE-AT ?auto_3282 ?auto_3286 ) ( CLEAR ?auto_3282 ) ( IS-CRATE ?auto_3283 ) ( not ( = ?auto_3282 ?auto_3283 ) ) ( AVAILABLE ?auto_3285 ) ( ON ?auto_3282 ?auto_3281 ) ( not ( = ?auto_3281 ?auto_3282 ) ) ( not ( = ?auto_3281 ?auto_3283 ) ) ( not ( = ?auto_3287 ?auto_3286 ) ) ( HOIST-AT ?auto_3288 ?auto_3287 ) ( not ( = ?auto_3285 ?auto_3288 ) ) ( AVAILABLE ?auto_3288 ) ( SURFACE-AT ?auto_3283 ?auto_3287 ) ( ON ?auto_3283 ?auto_3289 ) ( CLEAR ?auto_3283 ) ( not ( = ?auto_3282 ?auto_3289 ) ) ( not ( = ?auto_3283 ?auto_3289 ) ) ( not ( = ?auto_3281 ?auto_3289 ) ) ( TRUCK-AT ?auto_3284 ?auto_3286 ) ( ON ?auto_3281 ?auto_3280 ) ( not ( = ?auto_3280 ?auto_3281 ) ) ( not ( = ?auto_3280 ?auto_3282 ) ) ( not ( = ?auto_3280 ?auto_3283 ) ) ( not ( = ?auto_3280 ?auto_3289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3281 ?auto_3282 ?auto_3283 )
      ( MAKE-3CRATE-VERIFY ?auto_3280 ?auto_3281 ?auto_3282 ?auto_3283 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3290 - SURFACE
      ?auto_3291 - SURFACE
    )
    :vars
    (
      ?auto_3294 - HOIST
      ?auto_3295 - PLACE
      ?auto_3292 - SURFACE
      ?auto_3296 - PLACE
      ?auto_3297 - HOIST
      ?auto_3298 - SURFACE
      ?auto_3293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3294 ?auto_3295 ) ( IS-CRATE ?auto_3291 ) ( not ( = ?auto_3290 ?auto_3291 ) ) ( not ( = ?auto_3292 ?auto_3290 ) ) ( not ( = ?auto_3292 ?auto_3291 ) ) ( not ( = ?auto_3296 ?auto_3295 ) ) ( HOIST-AT ?auto_3297 ?auto_3296 ) ( not ( = ?auto_3294 ?auto_3297 ) ) ( AVAILABLE ?auto_3297 ) ( SURFACE-AT ?auto_3291 ?auto_3296 ) ( ON ?auto_3291 ?auto_3298 ) ( CLEAR ?auto_3291 ) ( not ( = ?auto_3290 ?auto_3298 ) ) ( not ( = ?auto_3291 ?auto_3298 ) ) ( not ( = ?auto_3292 ?auto_3298 ) ) ( TRUCK-AT ?auto_3293 ?auto_3295 ) ( SURFACE-AT ?auto_3292 ?auto_3295 ) ( CLEAR ?auto_3292 ) ( LIFTING ?auto_3294 ?auto_3290 ) ( IS-CRATE ?auto_3290 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3292 ?auto_3290 )
      ( MAKE-2CRATE ?auto_3292 ?auto_3290 ?auto_3291 )
      ( MAKE-1CRATE-VERIFY ?auto_3290 ?auto_3291 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3299 - SURFACE
      ?auto_3300 - SURFACE
      ?auto_3301 - SURFACE
    )
    :vars
    (
      ?auto_3302 - HOIST
      ?auto_3305 - PLACE
      ?auto_3304 - PLACE
      ?auto_3306 - HOIST
      ?auto_3307 - SURFACE
      ?auto_3303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3302 ?auto_3305 ) ( IS-CRATE ?auto_3301 ) ( not ( = ?auto_3300 ?auto_3301 ) ) ( not ( = ?auto_3299 ?auto_3300 ) ) ( not ( = ?auto_3299 ?auto_3301 ) ) ( not ( = ?auto_3304 ?auto_3305 ) ) ( HOIST-AT ?auto_3306 ?auto_3304 ) ( not ( = ?auto_3302 ?auto_3306 ) ) ( AVAILABLE ?auto_3306 ) ( SURFACE-AT ?auto_3301 ?auto_3304 ) ( ON ?auto_3301 ?auto_3307 ) ( CLEAR ?auto_3301 ) ( not ( = ?auto_3300 ?auto_3307 ) ) ( not ( = ?auto_3301 ?auto_3307 ) ) ( not ( = ?auto_3299 ?auto_3307 ) ) ( TRUCK-AT ?auto_3303 ?auto_3305 ) ( SURFACE-AT ?auto_3299 ?auto_3305 ) ( CLEAR ?auto_3299 ) ( LIFTING ?auto_3302 ?auto_3300 ) ( IS-CRATE ?auto_3300 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3300 ?auto_3301 )
      ( MAKE-2CRATE-VERIFY ?auto_3299 ?auto_3300 ?auto_3301 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3308 - SURFACE
      ?auto_3309 - SURFACE
      ?auto_3310 - SURFACE
      ?auto_3311 - SURFACE
    )
    :vars
    (
      ?auto_3313 - HOIST
      ?auto_3315 - PLACE
      ?auto_3312 - PLACE
      ?auto_3316 - HOIST
      ?auto_3317 - SURFACE
      ?auto_3314 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3313 ?auto_3315 ) ( IS-CRATE ?auto_3311 ) ( not ( = ?auto_3310 ?auto_3311 ) ) ( not ( = ?auto_3309 ?auto_3310 ) ) ( not ( = ?auto_3309 ?auto_3311 ) ) ( not ( = ?auto_3312 ?auto_3315 ) ) ( HOIST-AT ?auto_3316 ?auto_3312 ) ( not ( = ?auto_3313 ?auto_3316 ) ) ( AVAILABLE ?auto_3316 ) ( SURFACE-AT ?auto_3311 ?auto_3312 ) ( ON ?auto_3311 ?auto_3317 ) ( CLEAR ?auto_3311 ) ( not ( = ?auto_3310 ?auto_3317 ) ) ( not ( = ?auto_3311 ?auto_3317 ) ) ( not ( = ?auto_3309 ?auto_3317 ) ) ( TRUCK-AT ?auto_3314 ?auto_3315 ) ( SURFACE-AT ?auto_3309 ?auto_3315 ) ( CLEAR ?auto_3309 ) ( LIFTING ?auto_3313 ?auto_3310 ) ( IS-CRATE ?auto_3310 ) ( ON ?auto_3309 ?auto_3308 ) ( not ( = ?auto_3308 ?auto_3309 ) ) ( not ( = ?auto_3308 ?auto_3310 ) ) ( not ( = ?auto_3308 ?auto_3311 ) ) ( not ( = ?auto_3308 ?auto_3317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3309 ?auto_3310 ?auto_3311 )
      ( MAKE-3CRATE-VERIFY ?auto_3308 ?auto_3309 ?auto_3310 ?auto_3311 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3318 - SURFACE
      ?auto_3319 - SURFACE
    )
    :vars
    (
      ?auto_3321 - HOIST
      ?auto_3323 - PLACE
      ?auto_3326 - SURFACE
      ?auto_3320 - PLACE
      ?auto_3324 - HOIST
      ?auto_3325 - SURFACE
      ?auto_3322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3321 ?auto_3323 ) ( IS-CRATE ?auto_3319 ) ( not ( = ?auto_3318 ?auto_3319 ) ) ( not ( = ?auto_3326 ?auto_3318 ) ) ( not ( = ?auto_3326 ?auto_3319 ) ) ( not ( = ?auto_3320 ?auto_3323 ) ) ( HOIST-AT ?auto_3324 ?auto_3320 ) ( not ( = ?auto_3321 ?auto_3324 ) ) ( AVAILABLE ?auto_3324 ) ( SURFACE-AT ?auto_3319 ?auto_3320 ) ( ON ?auto_3319 ?auto_3325 ) ( CLEAR ?auto_3319 ) ( not ( = ?auto_3318 ?auto_3325 ) ) ( not ( = ?auto_3319 ?auto_3325 ) ) ( not ( = ?auto_3326 ?auto_3325 ) ) ( TRUCK-AT ?auto_3322 ?auto_3323 ) ( SURFACE-AT ?auto_3326 ?auto_3323 ) ( CLEAR ?auto_3326 ) ( IS-CRATE ?auto_3318 ) ( AVAILABLE ?auto_3321 ) ( IN ?auto_3318 ?auto_3322 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3321 ?auto_3318 ?auto_3322 ?auto_3323 )
      ( MAKE-2CRATE ?auto_3326 ?auto_3318 ?auto_3319 )
      ( MAKE-1CRATE-VERIFY ?auto_3318 ?auto_3319 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3327 - SURFACE
      ?auto_3328 - SURFACE
      ?auto_3329 - SURFACE
    )
    :vars
    (
      ?auto_3330 - HOIST
      ?auto_3335 - PLACE
      ?auto_3331 - PLACE
      ?auto_3333 - HOIST
      ?auto_3334 - SURFACE
      ?auto_3332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3330 ?auto_3335 ) ( IS-CRATE ?auto_3329 ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( not ( = ?auto_3327 ?auto_3328 ) ) ( not ( = ?auto_3327 ?auto_3329 ) ) ( not ( = ?auto_3331 ?auto_3335 ) ) ( HOIST-AT ?auto_3333 ?auto_3331 ) ( not ( = ?auto_3330 ?auto_3333 ) ) ( AVAILABLE ?auto_3333 ) ( SURFACE-AT ?auto_3329 ?auto_3331 ) ( ON ?auto_3329 ?auto_3334 ) ( CLEAR ?auto_3329 ) ( not ( = ?auto_3328 ?auto_3334 ) ) ( not ( = ?auto_3329 ?auto_3334 ) ) ( not ( = ?auto_3327 ?auto_3334 ) ) ( TRUCK-AT ?auto_3332 ?auto_3335 ) ( SURFACE-AT ?auto_3327 ?auto_3335 ) ( CLEAR ?auto_3327 ) ( IS-CRATE ?auto_3328 ) ( AVAILABLE ?auto_3330 ) ( IN ?auto_3328 ?auto_3332 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3328 ?auto_3329 )
      ( MAKE-2CRATE-VERIFY ?auto_3327 ?auto_3328 ?auto_3329 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3336 - SURFACE
      ?auto_3337 - SURFACE
      ?auto_3338 - SURFACE
      ?auto_3339 - SURFACE
    )
    :vars
    (
      ?auto_3342 - HOIST
      ?auto_3345 - PLACE
      ?auto_3343 - PLACE
      ?auto_3340 - HOIST
      ?auto_3341 - SURFACE
      ?auto_3344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3342 ?auto_3345 ) ( IS-CRATE ?auto_3339 ) ( not ( = ?auto_3338 ?auto_3339 ) ) ( not ( = ?auto_3337 ?auto_3338 ) ) ( not ( = ?auto_3337 ?auto_3339 ) ) ( not ( = ?auto_3343 ?auto_3345 ) ) ( HOIST-AT ?auto_3340 ?auto_3343 ) ( not ( = ?auto_3342 ?auto_3340 ) ) ( AVAILABLE ?auto_3340 ) ( SURFACE-AT ?auto_3339 ?auto_3343 ) ( ON ?auto_3339 ?auto_3341 ) ( CLEAR ?auto_3339 ) ( not ( = ?auto_3338 ?auto_3341 ) ) ( not ( = ?auto_3339 ?auto_3341 ) ) ( not ( = ?auto_3337 ?auto_3341 ) ) ( TRUCK-AT ?auto_3344 ?auto_3345 ) ( SURFACE-AT ?auto_3337 ?auto_3345 ) ( CLEAR ?auto_3337 ) ( IS-CRATE ?auto_3338 ) ( AVAILABLE ?auto_3342 ) ( IN ?auto_3338 ?auto_3344 ) ( ON ?auto_3337 ?auto_3336 ) ( not ( = ?auto_3336 ?auto_3337 ) ) ( not ( = ?auto_3336 ?auto_3338 ) ) ( not ( = ?auto_3336 ?auto_3339 ) ) ( not ( = ?auto_3336 ?auto_3341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3337 ?auto_3338 ?auto_3339 )
      ( MAKE-3CRATE-VERIFY ?auto_3336 ?auto_3337 ?auto_3338 ?auto_3339 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3346 - SURFACE
      ?auto_3347 - SURFACE
    )
    :vars
    (
      ?auto_3351 - HOIST
      ?auto_3354 - PLACE
      ?auto_3349 - SURFACE
      ?auto_3352 - PLACE
      ?auto_3348 - HOIST
      ?auto_3350 - SURFACE
      ?auto_3353 - TRUCK
      ?auto_3355 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3351 ?auto_3354 ) ( IS-CRATE ?auto_3347 ) ( not ( = ?auto_3346 ?auto_3347 ) ) ( not ( = ?auto_3349 ?auto_3346 ) ) ( not ( = ?auto_3349 ?auto_3347 ) ) ( not ( = ?auto_3352 ?auto_3354 ) ) ( HOIST-AT ?auto_3348 ?auto_3352 ) ( not ( = ?auto_3351 ?auto_3348 ) ) ( AVAILABLE ?auto_3348 ) ( SURFACE-AT ?auto_3347 ?auto_3352 ) ( ON ?auto_3347 ?auto_3350 ) ( CLEAR ?auto_3347 ) ( not ( = ?auto_3346 ?auto_3350 ) ) ( not ( = ?auto_3347 ?auto_3350 ) ) ( not ( = ?auto_3349 ?auto_3350 ) ) ( SURFACE-AT ?auto_3349 ?auto_3354 ) ( CLEAR ?auto_3349 ) ( IS-CRATE ?auto_3346 ) ( AVAILABLE ?auto_3351 ) ( IN ?auto_3346 ?auto_3353 ) ( TRUCK-AT ?auto_3353 ?auto_3355 ) ( not ( = ?auto_3355 ?auto_3354 ) ) ( not ( = ?auto_3352 ?auto_3355 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3353 ?auto_3355 ?auto_3354 )
      ( MAKE-2CRATE ?auto_3349 ?auto_3346 ?auto_3347 )
      ( MAKE-1CRATE-VERIFY ?auto_3346 ?auto_3347 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3356 - SURFACE
      ?auto_3357 - SURFACE
      ?auto_3358 - SURFACE
    )
    :vars
    (
      ?auto_3364 - HOIST
      ?auto_3363 - PLACE
      ?auto_3359 - PLACE
      ?auto_3361 - HOIST
      ?auto_3360 - SURFACE
      ?auto_3362 - TRUCK
      ?auto_3365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3364 ?auto_3363 ) ( IS-CRATE ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3358 ) ) ( not ( = ?auto_3356 ?auto_3357 ) ) ( not ( = ?auto_3356 ?auto_3358 ) ) ( not ( = ?auto_3359 ?auto_3363 ) ) ( HOIST-AT ?auto_3361 ?auto_3359 ) ( not ( = ?auto_3364 ?auto_3361 ) ) ( AVAILABLE ?auto_3361 ) ( SURFACE-AT ?auto_3358 ?auto_3359 ) ( ON ?auto_3358 ?auto_3360 ) ( CLEAR ?auto_3358 ) ( not ( = ?auto_3357 ?auto_3360 ) ) ( not ( = ?auto_3358 ?auto_3360 ) ) ( not ( = ?auto_3356 ?auto_3360 ) ) ( SURFACE-AT ?auto_3356 ?auto_3363 ) ( CLEAR ?auto_3356 ) ( IS-CRATE ?auto_3357 ) ( AVAILABLE ?auto_3364 ) ( IN ?auto_3357 ?auto_3362 ) ( TRUCK-AT ?auto_3362 ?auto_3365 ) ( not ( = ?auto_3365 ?auto_3363 ) ) ( not ( = ?auto_3359 ?auto_3365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3357 ?auto_3358 )
      ( MAKE-2CRATE-VERIFY ?auto_3356 ?auto_3357 ?auto_3358 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3366 - SURFACE
      ?auto_3367 - SURFACE
      ?auto_3368 - SURFACE
      ?auto_3369 - SURFACE
    )
    :vars
    (
      ?auto_3373 - HOIST
      ?auto_3371 - PLACE
      ?auto_3375 - PLACE
      ?auto_3376 - HOIST
      ?auto_3374 - SURFACE
      ?auto_3372 - TRUCK
      ?auto_3370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3373 ?auto_3371 ) ( IS-CRATE ?auto_3369 ) ( not ( = ?auto_3368 ?auto_3369 ) ) ( not ( = ?auto_3367 ?auto_3368 ) ) ( not ( = ?auto_3367 ?auto_3369 ) ) ( not ( = ?auto_3375 ?auto_3371 ) ) ( HOIST-AT ?auto_3376 ?auto_3375 ) ( not ( = ?auto_3373 ?auto_3376 ) ) ( AVAILABLE ?auto_3376 ) ( SURFACE-AT ?auto_3369 ?auto_3375 ) ( ON ?auto_3369 ?auto_3374 ) ( CLEAR ?auto_3369 ) ( not ( = ?auto_3368 ?auto_3374 ) ) ( not ( = ?auto_3369 ?auto_3374 ) ) ( not ( = ?auto_3367 ?auto_3374 ) ) ( SURFACE-AT ?auto_3367 ?auto_3371 ) ( CLEAR ?auto_3367 ) ( IS-CRATE ?auto_3368 ) ( AVAILABLE ?auto_3373 ) ( IN ?auto_3368 ?auto_3372 ) ( TRUCK-AT ?auto_3372 ?auto_3370 ) ( not ( = ?auto_3370 ?auto_3371 ) ) ( not ( = ?auto_3375 ?auto_3370 ) ) ( ON ?auto_3367 ?auto_3366 ) ( not ( = ?auto_3366 ?auto_3367 ) ) ( not ( = ?auto_3366 ?auto_3368 ) ) ( not ( = ?auto_3366 ?auto_3369 ) ) ( not ( = ?auto_3366 ?auto_3374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3367 ?auto_3368 ?auto_3369 )
      ( MAKE-3CRATE-VERIFY ?auto_3366 ?auto_3367 ?auto_3368 ?auto_3369 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3377 - SURFACE
      ?auto_3378 - SURFACE
    )
    :vars
    (
      ?auto_3383 - HOIST
      ?auto_3380 - PLACE
      ?auto_3382 - SURFACE
      ?auto_3385 - PLACE
      ?auto_3386 - HOIST
      ?auto_3384 - SURFACE
      ?auto_3381 - TRUCK
      ?auto_3379 - PLACE
      ?auto_3387 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3383 ?auto_3380 ) ( IS-CRATE ?auto_3378 ) ( not ( = ?auto_3377 ?auto_3378 ) ) ( not ( = ?auto_3382 ?auto_3377 ) ) ( not ( = ?auto_3382 ?auto_3378 ) ) ( not ( = ?auto_3385 ?auto_3380 ) ) ( HOIST-AT ?auto_3386 ?auto_3385 ) ( not ( = ?auto_3383 ?auto_3386 ) ) ( AVAILABLE ?auto_3386 ) ( SURFACE-AT ?auto_3378 ?auto_3385 ) ( ON ?auto_3378 ?auto_3384 ) ( CLEAR ?auto_3378 ) ( not ( = ?auto_3377 ?auto_3384 ) ) ( not ( = ?auto_3378 ?auto_3384 ) ) ( not ( = ?auto_3382 ?auto_3384 ) ) ( SURFACE-AT ?auto_3382 ?auto_3380 ) ( CLEAR ?auto_3382 ) ( IS-CRATE ?auto_3377 ) ( AVAILABLE ?auto_3383 ) ( TRUCK-AT ?auto_3381 ?auto_3379 ) ( not ( = ?auto_3379 ?auto_3380 ) ) ( not ( = ?auto_3385 ?auto_3379 ) ) ( HOIST-AT ?auto_3387 ?auto_3379 ) ( LIFTING ?auto_3387 ?auto_3377 ) ( not ( = ?auto_3383 ?auto_3387 ) ) ( not ( = ?auto_3386 ?auto_3387 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3387 ?auto_3377 ?auto_3381 ?auto_3379 )
      ( MAKE-2CRATE ?auto_3382 ?auto_3377 ?auto_3378 )
      ( MAKE-1CRATE-VERIFY ?auto_3377 ?auto_3378 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3388 - SURFACE
      ?auto_3389 - SURFACE
      ?auto_3390 - SURFACE
    )
    :vars
    (
      ?auto_3393 - HOIST
      ?auto_3392 - PLACE
      ?auto_3395 - PLACE
      ?auto_3391 - HOIST
      ?auto_3396 - SURFACE
      ?auto_3398 - TRUCK
      ?auto_3394 - PLACE
      ?auto_3397 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3393 ?auto_3392 ) ( IS-CRATE ?auto_3390 ) ( not ( = ?auto_3389 ?auto_3390 ) ) ( not ( = ?auto_3388 ?auto_3389 ) ) ( not ( = ?auto_3388 ?auto_3390 ) ) ( not ( = ?auto_3395 ?auto_3392 ) ) ( HOIST-AT ?auto_3391 ?auto_3395 ) ( not ( = ?auto_3393 ?auto_3391 ) ) ( AVAILABLE ?auto_3391 ) ( SURFACE-AT ?auto_3390 ?auto_3395 ) ( ON ?auto_3390 ?auto_3396 ) ( CLEAR ?auto_3390 ) ( not ( = ?auto_3389 ?auto_3396 ) ) ( not ( = ?auto_3390 ?auto_3396 ) ) ( not ( = ?auto_3388 ?auto_3396 ) ) ( SURFACE-AT ?auto_3388 ?auto_3392 ) ( CLEAR ?auto_3388 ) ( IS-CRATE ?auto_3389 ) ( AVAILABLE ?auto_3393 ) ( TRUCK-AT ?auto_3398 ?auto_3394 ) ( not ( = ?auto_3394 ?auto_3392 ) ) ( not ( = ?auto_3395 ?auto_3394 ) ) ( HOIST-AT ?auto_3397 ?auto_3394 ) ( LIFTING ?auto_3397 ?auto_3389 ) ( not ( = ?auto_3393 ?auto_3397 ) ) ( not ( = ?auto_3391 ?auto_3397 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3389 ?auto_3390 )
      ( MAKE-2CRATE-VERIFY ?auto_3388 ?auto_3389 ?auto_3390 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3399 - SURFACE
      ?auto_3400 - SURFACE
      ?auto_3401 - SURFACE
      ?auto_3402 - SURFACE
    )
    :vars
    (
      ?auto_3404 - HOIST
      ?auto_3403 - PLACE
      ?auto_3408 - PLACE
      ?auto_3405 - HOIST
      ?auto_3410 - SURFACE
      ?auto_3406 - TRUCK
      ?auto_3409 - PLACE
      ?auto_3407 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3404 ?auto_3403 ) ( IS-CRATE ?auto_3402 ) ( not ( = ?auto_3401 ?auto_3402 ) ) ( not ( = ?auto_3400 ?auto_3401 ) ) ( not ( = ?auto_3400 ?auto_3402 ) ) ( not ( = ?auto_3408 ?auto_3403 ) ) ( HOIST-AT ?auto_3405 ?auto_3408 ) ( not ( = ?auto_3404 ?auto_3405 ) ) ( AVAILABLE ?auto_3405 ) ( SURFACE-AT ?auto_3402 ?auto_3408 ) ( ON ?auto_3402 ?auto_3410 ) ( CLEAR ?auto_3402 ) ( not ( = ?auto_3401 ?auto_3410 ) ) ( not ( = ?auto_3402 ?auto_3410 ) ) ( not ( = ?auto_3400 ?auto_3410 ) ) ( SURFACE-AT ?auto_3400 ?auto_3403 ) ( CLEAR ?auto_3400 ) ( IS-CRATE ?auto_3401 ) ( AVAILABLE ?auto_3404 ) ( TRUCK-AT ?auto_3406 ?auto_3409 ) ( not ( = ?auto_3409 ?auto_3403 ) ) ( not ( = ?auto_3408 ?auto_3409 ) ) ( HOIST-AT ?auto_3407 ?auto_3409 ) ( LIFTING ?auto_3407 ?auto_3401 ) ( not ( = ?auto_3404 ?auto_3407 ) ) ( not ( = ?auto_3405 ?auto_3407 ) ) ( ON ?auto_3400 ?auto_3399 ) ( not ( = ?auto_3399 ?auto_3400 ) ) ( not ( = ?auto_3399 ?auto_3401 ) ) ( not ( = ?auto_3399 ?auto_3402 ) ) ( not ( = ?auto_3399 ?auto_3410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3400 ?auto_3401 ?auto_3402 )
      ( MAKE-3CRATE-VERIFY ?auto_3399 ?auto_3400 ?auto_3401 ?auto_3402 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3411 - SURFACE
      ?auto_3412 - SURFACE
    )
    :vars
    (
      ?auto_3414 - HOIST
      ?auto_3413 - PLACE
      ?auto_3420 - SURFACE
      ?auto_3418 - PLACE
      ?auto_3415 - HOIST
      ?auto_3421 - SURFACE
      ?auto_3416 - TRUCK
      ?auto_3419 - PLACE
      ?auto_3417 - HOIST
      ?auto_3422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3414 ?auto_3413 ) ( IS-CRATE ?auto_3412 ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( not ( = ?auto_3420 ?auto_3411 ) ) ( not ( = ?auto_3420 ?auto_3412 ) ) ( not ( = ?auto_3418 ?auto_3413 ) ) ( HOIST-AT ?auto_3415 ?auto_3418 ) ( not ( = ?auto_3414 ?auto_3415 ) ) ( AVAILABLE ?auto_3415 ) ( SURFACE-AT ?auto_3412 ?auto_3418 ) ( ON ?auto_3412 ?auto_3421 ) ( CLEAR ?auto_3412 ) ( not ( = ?auto_3411 ?auto_3421 ) ) ( not ( = ?auto_3412 ?auto_3421 ) ) ( not ( = ?auto_3420 ?auto_3421 ) ) ( SURFACE-AT ?auto_3420 ?auto_3413 ) ( CLEAR ?auto_3420 ) ( IS-CRATE ?auto_3411 ) ( AVAILABLE ?auto_3414 ) ( TRUCK-AT ?auto_3416 ?auto_3419 ) ( not ( = ?auto_3419 ?auto_3413 ) ) ( not ( = ?auto_3418 ?auto_3419 ) ) ( HOIST-AT ?auto_3417 ?auto_3419 ) ( not ( = ?auto_3414 ?auto_3417 ) ) ( not ( = ?auto_3415 ?auto_3417 ) ) ( AVAILABLE ?auto_3417 ) ( SURFACE-AT ?auto_3411 ?auto_3419 ) ( ON ?auto_3411 ?auto_3422 ) ( CLEAR ?auto_3411 ) ( not ( = ?auto_3411 ?auto_3422 ) ) ( not ( = ?auto_3412 ?auto_3422 ) ) ( not ( = ?auto_3420 ?auto_3422 ) ) ( not ( = ?auto_3421 ?auto_3422 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3417 ?auto_3411 ?auto_3422 ?auto_3419 )
      ( MAKE-2CRATE ?auto_3420 ?auto_3411 ?auto_3412 )
      ( MAKE-1CRATE-VERIFY ?auto_3411 ?auto_3412 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3423 - SURFACE
      ?auto_3424 - SURFACE
      ?auto_3425 - SURFACE
    )
    :vars
    (
      ?auto_3427 - HOIST
      ?auto_3429 - PLACE
      ?auto_3431 - PLACE
      ?auto_3430 - HOIST
      ?auto_3426 - SURFACE
      ?auto_3433 - TRUCK
      ?auto_3434 - PLACE
      ?auto_3432 - HOIST
      ?auto_3428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3427 ?auto_3429 ) ( IS-CRATE ?auto_3425 ) ( not ( = ?auto_3424 ?auto_3425 ) ) ( not ( = ?auto_3423 ?auto_3424 ) ) ( not ( = ?auto_3423 ?auto_3425 ) ) ( not ( = ?auto_3431 ?auto_3429 ) ) ( HOIST-AT ?auto_3430 ?auto_3431 ) ( not ( = ?auto_3427 ?auto_3430 ) ) ( AVAILABLE ?auto_3430 ) ( SURFACE-AT ?auto_3425 ?auto_3431 ) ( ON ?auto_3425 ?auto_3426 ) ( CLEAR ?auto_3425 ) ( not ( = ?auto_3424 ?auto_3426 ) ) ( not ( = ?auto_3425 ?auto_3426 ) ) ( not ( = ?auto_3423 ?auto_3426 ) ) ( SURFACE-AT ?auto_3423 ?auto_3429 ) ( CLEAR ?auto_3423 ) ( IS-CRATE ?auto_3424 ) ( AVAILABLE ?auto_3427 ) ( TRUCK-AT ?auto_3433 ?auto_3434 ) ( not ( = ?auto_3434 ?auto_3429 ) ) ( not ( = ?auto_3431 ?auto_3434 ) ) ( HOIST-AT ?auto_3432 ?auto_3434 ) ( not ( = ?auto_3427 ?auto_3432 ) ) ( not ( = ?auto_3430 ?auto_3432 ) ) ( AVAILABLE ?auto_3432 ) ( SURFACE-AT ?auto_3424 ?auto_3434 ) ( ON ?auto_3424 ?auto_3428 ) ( CLEAR ?auto_3424 ) ( not ( = ?auto_3424 ?auto_3428 ) ) ( not ( = ?auto_3425 ?auto_3428 ) ) ( not ( = ?auto_3423 ?auto_3428 ) ) ( not ( = ?auto_3426 ?auto_3428 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3424 ?auto_3425 )
      ( MAKE-2CRATE-VERIFY ?auto_3423 ?auto_3424 ?auto_3425 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3435 - SURFACE
      ?auto_3436 - SURFACE
      ?auto_3437 - SURFACE
      ?auto_3438 - SURFACE
    )
    :vars
    (
      ?auto_3442 - HOIST
      ?auto_3446 - PLACE
      ?auto_3440 - PLACE
      ?auto_3444 - HOIST
      ?auto_3447 - SURFACE
      ?auto_3439 - TRUCK
      ?auto_3441 - PLACE
      ?auto_3443 - HOIST
      ?auto_3445 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3442 ?auto_3446 ) ( IS-CRATE ?auto_3438 ) ( not ( = ?auto_3437 ?auto_3438 ) ) ( not ( = ?auto_3436 ?auto_3437 ) ) ( not ( = ?auto_3436 ?auto_3438 ) ) ( not ( = ?auto_3440 ?auto_3446 ) ) ( HOIST-AT ?auto_3444 ?auto_3440 ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( AVAILABLE ?auto_3444 ) ( SURFACE-AT ?auto_3438 ?auto_3440 ) ( ON ?auto_3438 ?auto_3447 ) ( CLEAR ?auto_3438 ) ( not ( = ?auto_3437 ?auto_3447 ) ) ( not ( = ?auto_3438 ?auto_3447 ) ) ( not ( = ?auto_3436 ?auto_3447 ) ) ( SURFACE-AT ?auto_3436 ?auto_3446 ) ( CLEAR ?auto_3436 ) ( IS-CRATE ?auto_3437 ) ( AVAILABLE ?auto_3442 ) ( TRUCK-AT ?auto_3439 ?auto_3441 ) ( not ( = ?auto_3441 ?auto_3446 ) ) ( not ( = ?auto_3440 ?auto_3441 ) ) ( HOIST-AT ?auto_3443 ?auto_3441 ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( not ( = ?auto_3444 ?auto_3443 ) ) ( AVAILABLE ?auto_3443 ) ( SURFACE-AT ?auto_3437 ?auto_3441 ) ( ON ?auto_3437 ?auto_3445 ) ( CLEAR ?auto_3437 ) ( not ( = ?auto_3437 ?auto_3445 ) ) ( not ( = ?auto_3438 ?auto_3445 ) ) ( not ( = ?auto_3436 ?auto_3445 ) ) ( not ( = ?auto_3447 ?auto_3445 ) ) ( ON ?auto_3436 ?auto_3435 ) ( not ( = ?auto_3435 ?auto_3436 ) ) ( not ( = ?auto_3435 ?auto_3437 ) ) ( not ( = ?auto_3435 ?auto_3438 ) ) ( not ( = ?auto_3435 ?auto_3447 ) ) ( not ( = ?auto_3435 ?auto_3445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3436 ?auto_3437 ?auto_3438 )
      ( MAKE-3CRATE-VERIFY ?auto_3435 ?auto_3436 ?auto_3437 ?auto_3438 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3448 - SURFACE
      ?auto_3449 - SURFACE
    )
    :vars
    (
      ?auto_3453 - HOIST
      ?auto_3457 - PLACE
      ?auto_3459 - SURFACE
      ?auto_3451 - PLACE
      ?auto_3455 - HOIST
      ?auto_3458 - SURFACE
      ?auto_3452 - PLACE
      ?auto_3454 - HOIST
      ?auto_3456 - SURFACE
      ?auto_3450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3453 ?auto_3457 ) ( IS-CRATE ?auto_3449 ) ( not ( = ?auto_3448 ?auto_3449 ) ) ( not ( = ?auto_3459 ?auto_3448 ) ) ( not ( = ?auto_3459 ?auto_3449 ) ) ( not ( = ?auto_3451 ?auto_3457 ) ) ( HOIST-AT ?auto_3455 ?auto_3451 ) ( not ( = ?auto_3453 ?auto_3455 ) ) ( AVAILABLE ?auto_3455 ) ( SURFACE-AT ?auto_3449 ?auto_3451 ) ( ON ?auto_3449 ?auto_3458 ) ( CLEAR ?auto_3449 ) ( not ( = ?auto_3448 ?auto_3458 ) ) ( not ( = ?auto_3449 ?auto_3458 ) ) ( not ( = ?auto_3459 ?auto_3458 ) ) ( SURFACE-AT ?auto_3459 ?auto_3457 ) ( CLEAR ?auto_3459 ) ( IS-CRATE ?auto_3448 ) ( AVAILABLE ?auto_3453 ) ( not ( = ?auto_3452 ?auto_3457 ) ) ( not ( = ?auto_3451 ?auto_3452 ) ) ( HOIST-AT ?auto_3454 ?auto_3452 ) ( not ( = ?auto_3453 ?auto_3454 ) ) ( not ( = ?auto_3455 ?auto_3454 ) ) ( AVAILABLE ?auto_3454 ) ( SURFACE-AT ?auto_3448 ?auto_3452 ) ( ON ?auto_3448 ?auto_3456 ) ( CLEAR ?auto_3448 ) ( not ( = ?auto_3448 ?auto_3456 ) ) ( not ( = ?auto_3449 ?auto_3456 ) ) ( not ( = ?auto_3459 ?auto_3456 ) ) ( not ( = ?auto_3458 ?auto_3456 ) ) ( TRUCK-AT ?auto_3450 ?auto_3457 ) )
    :subtasks
    ( ( !DRIVE ?auto_3450 ?auto_3457 ?auto_3452 )
      ( MAKE-2CRATE ?auto_3459 ?auto_3448 ?auto_3449 )
      ( MAKE-1CRATE-VERIFY ?auto_3448 ?auto_3449 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3460 - SURFACE
      ?auto_3461 - SURFACE
      ?auto_3462 - SURFACE
    )
    :vars
    (
      ?auto_3467 - HOIST
      ?auto_3465 - PLACE
      ?auto_3466 - PLACE
      ?auto_3464 - HOIST
      ?auto_3463 - SURFACE
      ?auto_3468 - PLACE
      ?auto_3470 - HOIST
      ?auto_3469 - SURFACE
      ?auto_3471 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3467 ?auto_3465 ) ( IS-CRATE ?auto_3462 ) ( not ( = ?auto_3461 ?auto_3462 ) ) ( not ( = ?auto_3460 ?auto_3461 ) ) ( not ( = ?auto_3460 ?auto_3462 ) ) ( not ( = ?auto_3466 ?auto_3465 ) ) ( HOIST-AT ?auto_3464 ?auto_3466 ) ( not ( = ?auto_3467 ?auto_3464 ) ) ( AVAILABLE ?auto_3464 ) ( SURFACE-AT ?auto_3462 ?auto_3466 ) ( ON ?auto_3462 ?auto_3463 ) ( CLEAR ?auto_3462 ) ( not ( = ?auto_3461 ?auto_3463 ) ) ( not ( = ?auto_3462 ?auto_3463 ) ) ( not ( = ?auto_3460 ?auto_3463 ) ) ( SURFACE-AT ?auto_3460 ?auto_3465 ) ( CLEAR ?auto_3460 ) ( IS-CRATE ?auto_3461 ) ( AVAILABLE ?auto_3467 ) ( not ( = ?auto_3468 ?auto_3465 ) ) ( not ( = ?auto_3466 ?auto_3468 ) ) ( HOIST-AT ?auto_3470 ?auto_3468 ) ( not ( = ?auto_3467 ?auto_3470 ) ) ( not ( = ?auto_3464 ?auto_3470 ) ) ( AVAILABLE ?auto_3470 ) ( SURFACE-AT ?auto_3461 ?auto_3468 ) ( ON ?auto_3461 ?auto_3469 ) ( CLEAR ?auto_3461 ) ( not ( = ?auto_3461 ?auto_3469 ) ) ( not ( = ?auto_3462 ?auto_3469 ) ) ( not ( = ?auto_3460 ?auto_3469 ) ) ( not ( = ?auto_3463 ?auto_3469 ) ) ( TRUCK-AT ?auto_3471 ?auto_3465 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3461 ?auto_3462 )
      ( MAKE-2CRATE-VERIFY ?auto_3460 ?auto_3461 ?auto_3462 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3472 - SURFACE
      ?auto_3473 - SURFACE
      ?auto_3474 - SURFACE
      ?auto_3475 - SURFACE
    )
    :vars
    (
      ?auto_3476 - HOIST
      ?auto_3483 - PLACE
      ?auto_3480 - PLACE
      ?auto_3477 - HOIST
      ?auto_3482 - SURFACE
      ?auto_3481 - PLACE
      ?auto_3484 - HOIST
      ?auto_3478 - SURFACE
      ?auto_3479 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3476 ?auto_3483 ) ( IS-CRATE ?auto_3475 ) ( not ( = ?auto_3474 ?auto_3475 ) ) ( not ( = ?auto_3473 ?auto_3474 ) ) ( not ( = ?auto_3473 ?auto_3475 ) ) ( not ( = ?auto_3480 ?auto_3483 ) ) ( HOIST-AT ?auto_3477 ?auto_3480 ) ( not ( = ?auto_3476 ?auto_3477 ) ) ( AVAILABLE ?auto_3477 ) ( SURFACE-AT ?auto_3475 ?auto_3480 ) ( ON ?auto_3475 ?auto_3482 ) ( CLEAR ?auto_3475 ) ( not ( = ?auto_3474 ?auto_3482 ) ) ( not ( = ?auto_3475 ?auto_3482 ) ) ( not ( = ?auto_3473 ?auto_3482 ) ) ( SURFACE-AT ?auto_3473 ?auto_3483 ) ( CLEAR ?auto_3473 ) ( IS-CRATE ?auto_3474 ) ( AVAILABLE ?auto_3476 ) ( not ( = ?auto_3481 ?auto_3483 ) ) ( not ( = ?auto_3480 ?auto_3481 ) ) ( HOIST-AT ?auto_3484 ?auto_3481 ) ( not ( = ?auto_3476 ?auto_3484 ) ) ( not ( = ?auto_3477 ?auto_3484 ) ) ( AVAILABLE ?auto_3484 ) ( SURFACE-AT ?auto_3474 ?auto_3481 ) ( ON ?auto_3474 ?auto_3478 ) ( CLEAR ?auto_3474 ) ( not ( = ?auto_3474 ?auto_3478 ) ) ( not ( = ?auto_3475 ?auto_3478 ) ) ( not ( = ?auto_3473 ?auto_3478 ) ) ( not ( = ?auto_3482 ?auto_3478 ) ) ( TRUCK-AT ?auto_3479 ?auto_3483 ) ( ON ?auto_3473 ?auto_3472 ) ( not ( = ?auto_3472 ?auto_3473 ) ) ( not ( = ?auto_3472 ?auto_3474 ) ) ( not ( = ?auto_3472 ?auto_3475 ) ) ( not ( = ?auto_3472 ?auto_3482 ) ) ( not ( = ?auto_3472 ?auto_3478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3473 ?auto_3474 ?auto_3475 )
      ( MAKE-3CRATE-VERIFY ?auto_3472 ?auto_3473 ?auto_3474 ?auto_3475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3485 - SURFACE
      ?auto_3486 - SURFACE
    )
    :vars
    (
      ?auto_3487 - HOIST
      ?auto_3495 - PLACE
      ?auto_3494 - SURFACE
      ?auto_3491 - PLACE
      ?auto_3488 - HOIST
      ?auto_3493 - SURFACE
      ?auto_3492 - PLACE
      ?auto_3496 - HOIST
      ?auto_3489 - SURFACE
      ?auto_3490 - TRUCK
      ?auto_3497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3487 ?auto_3495 ) ( IS-CRATE ?auto_3486 ) ( not ( = ?auto_3485 ?auto_3486 ) ) ( not ( = ?auto_3494 ?auto_3485 ) ) ( not ( = ?auto_3494 ?auto_3486 ) ) ( not ( = ?auto_3491 ?auto_3495 ) ) ( HOIST-AT ?auto_3488 ?auto_3491 ) ( not ( = ?auto_3487 ?auto_3488 ) ) ( AVAILABLE ?auto_3488 ) ( SURFACE-AT ?auto_3486 ?auto_3491 ) ( ON ?auto_3486 ?auto_3493 ) ( CLEAR ?auto_3486 ) ( not ( = ?auto_3485 ?auto_3493 ) ) ( not ( = ?auto_3486 ?auto_3493 ) ) ( not ( = ?auto_3494 ?auto_3493 ) ) ( IS-CRATE ?auto_3485 ) ( not ( = ?auto_3492 ?auto_3495 ) ) ( not ( = ?auto_3491 ?auto_3492 ) ) ( HOIST-AT ?auto_3496 ?auto_3492 ) ( not ( = ?auto_3487 ?auto_3496 ) ) ( not ( = ?auto_3488 ?auto_3496 ) ) ( AVAILABLE ?auto_3496 ) ( SURFACE-AT ?auto_3485 ?auto_3492 ) ( ON ?auto_3485 ?auto_3489 ) ( CLEAR ?auto_3485 ) ( not ( = ?auto_3485 ?auto_3489 ) ) ( not ( = ?auto_3486 ?auto_3489 ) ) ( not ( = ?auto_3494 ?auto_3489 ) ) ( not ( = ?auto_3493 ?auto_3489 ) ) ( TRUCK-AT ?auto_3490 ?auto_3495 ) ( SURFACE-AT ?auto_3497 ?auto_3495 ) ( CLEAR ?auto_3497 ) ( LIFTING ?auto_3487 ?auto_3494 ) ( IS-CRATE ?auto_3494 ) ( not ( = ?auto_3497 ?auto_3494 ) ) ( not ( = ?auto_3485 ?auto_3497 ) ) ( not ( = ?auto_3486 ?auto_3497 ) ) ( not ( = ?auto_3493 ?auto_3497 ) ) ( not ( = ?auto_3489 ?auto_3497 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3497 ?auto_3494 )
      ( MAKE-2CRATE ?auto_3494 ?auto_3485 ?auto_3486 )
      ( MAKE-1CRATE-VERIFY ?auto_3485 ?auto_3486 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3498 - SURFACE
      ?auto_3499 - SURFACE
      ?auto_3500 - SURFACE
    )
    :vars
    (
      ?auto_3503 - HOIST
      ?auto_3505 - PLACE
      ?auto_3504 - PLACE
      ?auto_3501 - HOIST
      ?auto_3510 - SURFACE
      ?auto_3509 - PLACE
      ?auto_3506 - HOIST
      ?auto_3502 - SURFACE
      ?auto_3508 - TRUCK
      ?auto_3507 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3503 ?auto_3505 ) ( IS-CRATE ?auto_3500 ) ( not ( = ?auto_3499 ?auto_3500 ) ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3500 ) ) ( not ( = ?auto_3504 ?auto_3505 ) ) ( HOIST-AT ?auto_3501 ?auto_3504 ) ( not ( = ?auto_3503 ?auto_3501 ) ) ( AVAILABLE ?auto_3501 ) ( SURFACE-AT ?auto_3500 ?auto_3504 ) ( ON ?auto_3500 ?auto_3510 ) ( CLEAR ?auto_3500 ) ( not ( = ?auto_3499 ?auto_3510 ) ) ( not ( = ?auto_3500 ?auto_3510 ) ) ( not ( = ?auto_3498 ?auto_3510 ) ) ( IS-CRATE ?auto_3499 ) ( not ( = ?auto_3509 ?auto_3505 ) ) ( not ( = ?auto_3504 ?auto_3509 ) ) ( HOIST-AT ?auto_3506 ?auto_3509 ) ( not ( = ?auto_3503 ?auto_3506 ) ) ( not ( = ?auto_3501 ?auto_3506 ) ) ( AVAILABLE ?auto_3506 ) ( SURFACE-AT ?auto_3499 ?auto_3509 ) ( ON ?auto_3499 ?auto_3502 ) ( CLEAR ?auto_3499 ) ( not ( = ?auto_3499 ?auto_3502 ) ) ( not ( = ?auto_3500 ?auto_3502 ) ) ( not ( = ?auto_3498 ?auto_3502 ) ) ( not ( = ?auto_3510 ?auto_3502 ) ) ( TRUCK-AT ?auto_3508 ?auto_3505 ) ( SURFACE-AT ?auto_3507 ?auto_3505 ) ( CLEAR ?auto_3507 ) ( LIFTING ?auto_3503 ?auto_3498 ) ( IS-CRATE ?auto_3498 ) ( not ( = ?auto_3507 ?auto_3498 ) ) ( not ( = ?auto_3499 ?auto_3507 ) ) ( not ( = ?auto_3500 ?auto_3507 ) ) ( not ( = ?auto_3510 ?auto_3507 ) ) ( not ( = ?auto_3502 ?auto_3507 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3499 ?auto_3500 )
      ( MAKE-2CRATE-VERIFY ?auto_3498 ?auto_3499 ?auto_3500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3511 - SURFACE
      ?auto_3512 - SURFACE
      ?auto_3513 - SURFACE
      ?auto_3514 - SURFACE
    )
    :vars
    (
      ?auto_3516 - HOIST
      ?auto_3520 - PLACE
      ?auto_3522 - PLACE
      ?auto_3517 - HOIST
      ?auto_3518 - SURFACE
      ?auto_3515 - PLACE
      ?auto_3519 - HOIST
      ?auto_3521 - SURFACE
      ?auto_3523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3516 ?auto_3520 ) ( IS-CRATE ?auto_3514 ) ( not ( = ?auto_3513 ?auto_3514 ) ) ( not ( = ?auto_3512 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3514 ) ) ( not ( = ?auto_3522 ?auto_3520 ) ) ( HOIST-AT ?auto_3517 ?auto_3522 ) ( not ( = ?auto_3516 ?auto_3517 ) ) ( AVAILABLE ?auto_3517 ) ( SURFACE-AT ?auto_3514 ?auto_3522 ) ( ON ?auto_3514 ?auto_3518 ) ( CLEAR ?auto_3514 ) ( not ( = ?auto_3513 ?auto_3518 ) ) ( not ( = ?auto_3514 ?auto_3518 ) ) ( not ( = ?auto_3512 ?auto_3518 ) ) ( IS-CRATE ?auto_3513 ) ( not ( = ?auto_3515 ?auto_3520 ) ) ( not ( = ?auto_3522 ?auto_3515 ) ) ( HOIST-AT ?auto_3519 ?auto_3515 ) ( not ( = ?auto_3516 ?auto_3519 ) ) ( not ( = ?auto_3517 ?auto_3519 ) ) ( AVAILABLE ?auto_3519 ) ( SURFACE-AT ?auto_3513 ?auto_3515 ) ( ON ?auto_3513 ?auto_3521 ) ( CLEAR ?auto_3513 ) ( not ( = ?auto_3513 ?auto_3521 ) ) ( not ( = ?auto_3514 ?auto_3521 ) ) ( not ( = ?auto_3512 ?auto_3521 ) ) ( not ( = ?auto_3518 ?auto_3521 ) ) ( TRUCK-AT ?auto_3523 ?auto_3520 ) ( SURFACE-AT ?auto_3511 ?auto_3520 ) ( CLEAR ?auto_3511 ) ( LIFTING ?auto_3516 ?auto_3512 ) ( IS-CRATE ?auto_3512 ) ( not ( = ?auto_3511 ?auto_3512 ) ) ( not ( = ?auto_3513 ?auto_3511 ) ) ( not ( = ?auto_3514 ?auto_3511 ) ) ( not ( = ?auto_3518 ?auto_3511 ) ) ( not ( = ?auto_3521 ?auto_3511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3512 ?auto_3513 ?auto_3514 )
      ( MAKE-3CRATE-VERIFY ?auto_3511 ?auto_3512 ?auto_3513 ?auto_3514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3524 - SURFACE
      ?auto_3525 - SURFACE
    )
    :vars
    (
      ?auto_3528 - HOIST
      ?auto_3533 - PLACE
      ?auto_3530 - SURFACE
      ?auto_3535 - PLACE
      ?auto_3529 - HOIST
      ?auto_3531 - SURFACE
      ?auto_3526 - PLACE
      ?auto_3532 - HOIST
      ?auto_3534 - SURFACE
      ?auto_3536 - TRUCK
      ?auto_3527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3528 ?auto_3533 ) ( IS-CRATE ?auto_3525 ) ( not ( = ?auto_3524 ?auto_3525 ) ) ( not ( = ?auto_3530 ?auto_3524 ) ) ( not ( = ?auto_3530 ?auto_3525 ) ) ( not ( = ?auto_3535 ?auto_3533 ) ) ( HOIST-AT ?auto_3529 ?auto_3535 ) ( not ( = ?auto_3528 ?auto_3529 ) ) ( AVAILABLE ?auto_3529 ) ( SURFACE-AT ?auto_3525 ?auto_3535 ) ( ON ?auto_3525 ?auto_3531 ) ( CLEAR ?auto_3525 ) ( not ( = ?auto_3524 ?auto_3531 ) ) ( not ( = ?auto_3525 ?auto_3531 ) ) ( not ( = ?auto_3530 ?auto_3531 ) ) ( IS-CRATE ?auto_3524 ) ( not ( = ?auto_3526 ?auto_3533 ) ) ( not ( = ?auto_3535 ?auto_3526 ) ) ( HOIST-AT ?auto_3532 ?auto_3526 ) ( not ( = ?auto_3528 ?auto_3532 ) ) ( not ( = ?auto_3529 ?auto_3532 ) ) ( AVAILABLE ?auto_3532 ) ( SURFACE-AT ?auto_3524 ?auto_3526 ) ( ON ?auto_3524 ?auto_3534 ) ( CLEAR ?auto_3524 ) ( not ( = ?auto_3524 ?auto_3534 ) ) ( not ( = ?auto_3525 ?auto_3534 ) ) ( not ( = ?auto_3530 ?auto_3534 ) ) ( not ( = ?auto_3531 ?auto_3534 ) ) ( TRUCK-AT ?auto_3536 ?auto_3533 ) ( SURFACE-AT ?auto_3527 ?auto_3533 ) ( CLEAR ?auto_3527 ) ( IS-CRATE ?auto_3530 ) ( not ( = ?auto_3527 ?auto_3530 ) ) ( not ( = ?auto_3524 ?auto_3527 ) ) ( not ( = ?auto_3525 ?auto_3527 ) ) ( not ( = ?auto_3531 ?auto_3527 ) ) ( not ( = ?auto_3534 ?auto_3527 ) ) ( AVAILABLE ?auto_3528 ) ( IN ?auto_3530 ?auto_3536 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3528 ?auto_3530 ?auto_3536 ?auto_3533 )
      ( MAKE-2CRATE ?auto_3530 ?auto_3524 ?auto_3525 )
      ( MAKE-1CRATE-VERIFY ?auto_3524 ?auto_3525 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3537 - SURFACE
      ?auto_3538 - SURFACE
      ?auto_3539 - SURFACE
    )
    :vars
    (
      ?auto_3543 - HOIST
      ?auto_3544 - PLACE
      ?auto_3545 - PLACE
      ?auto_3549 - HOIST
      ?auto_3548 - SURFACE
      ?auto_3540 - PLACE
      ?auto_3547 - HOIST
      ?auto_3542 - SURFACE
      ?auto_3541 - TRUCK
      ?auto_3546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3543 ?auto_3544 ) ( IS-CRATE ?auto_3539 ) ( not ( = ?auto_3538 ?auto_3539 ) ) ( not ( = ?auto_3537 ?auto_3538 ) ) ( not ( = ?auto_3537 ?auto_3539 ) ) ( not ( = ?auto_3545 ?auto_3544 ) ) ( HOIST-AT ?auto_3549 ?auto_3545 ) ( not ( = ?auto_3543 ?auto_3549 ) ) ( AVAILABLE ?auto_3549 ) ( SURFACE-AT ?auto_3539 ?auto_3545 ) ( ON ?auto_3539 ?auto_3548 ) ( CLEAR ?auto_3539 ) ( not ( = ?auto_3538 ?auto_3548 ) ) ( not ( = ?auto_3539 ?auto_3548 ) ) ( not ( = ?auto_3537 ?auto_3548 ) ) ( IS-CRATE ?auto_3538 ) ( not ( = ?auto_3540 ?auto_3544 ) ) ( not ( = ?auto_3545 ?auto_3540 ) ) ( HOIST-AT ?auto_3547 ?auto_3540 ) ( not ( = ?auto_3543 ?auto_3547 ) ) ( not ( = ?auto_3549 ?auto_3547 ) ) ( AVAILABLE ?auto_3547 ) ( SURFACE-AT ?auto_3538 ?auto_3540 ) ( ON ?auto_3538 ?auto_3542 ) ( CLEAR ?auto_3538 ) ( not ( = ?auto_3538 ?auto_3542 ) ) ( not ( = ?auto_3539 ?auto_3542 ) ) ( not ( = ?auto_3537 ?auto_3542 ) ) ( not ( = ?auto_3548 ?auto_3542 ) ) ( TRUCK-AT ?auto_3541 ?auto_3544 ) ( SURFACE-AT ?auto_3546 ?auto_3544 ) ( CLEAR ?auto_3546 ) ( IS-CRATE ?auto_3537 ) ( not ( = ?auto_3546 ?auto_3537 ) ) ( not ( = ?auto_3538 ?auto_3546 ) ) ( not ( = ?auto_3539 ?auto_3546 ) ) ( not ( = ?auto_3548 ?auto_3546 ) ) ( not ( = ?auto_3542 ?auto_3546 ) ) ( AVAILABLE ?auto_3543 ) ( IN ?auto_3537 ?auto_3541 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3538 ?auto_3539 )
      ( MAKE-2CRATE-VERIFY ?auto_3537 ?auto_3538 ?auto_3539 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3550 - SURFACE
      ?auto_3551 - SURFACE
      ?auto_3552 - SURFACE
      ?auto_3553 - SURFACE
    )
    :vars
    (
      ?auto_3562 - HOIST
      ?auto_3555 - PLACE
      ?auto_3556 - PLACE
      ?auto_3559 - HOIST
      ?auto_3561 - SURFACE
      ?auto_3554 - PLACE
      ?auto_3558 - HOIST
      ?auto_3560 - SURFACE
      ?auto_3557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3562 ?auto_3555 ) ( IS-CRATE ?auto_3553 ) ( not ( = ?auto_3552 ?auto_3553 ) ) ( not ( = ?auto_3551 ?auto_3552 ) ) ( not ( = ?auto_3551 ?auto_3553 ) ) ( not ( = ?auto_3556 ?auto_3555 ) ) ( HOIST-AT ?auto_3559 ?auto_3556 ) ( not ( = ?auto_3562 ?auto_3559 ) ) ( AVAILABLE ?auto_3559 ) ( SURFACE-AT ?auto_3553 ?auto_3556 ) ( ON ?auto_3553 ?auto_3561 ) ( CLEAR ?auto_3553 ) ( not ( = ?auto_3552 ?auto_3561 ) ) ( not ( = ?auto_3553 ?auto_3561 ) ) ( not ( = ?auto_3551 ?auto_3561 ) ) ( IS-CRATE ?auto_3552 ) ( not ( = ?auto_3554 ?auto_3555 ) ) ( not ( = ?auto_3556 ?auto_3554 ) ) ( HOIST-AT ?auto_3558 ?auto_3554 ) ( not ( = ?auto_3562 ?auto_3558 ) ) ( not ( = ?auto_3559 ?auto_3558 ) ) ( AVAILABLE ?auto_3558 ) ( SURFACE-AT ?auto_3552 ?auto_3554 ) ( ON ?auto_3552 ?auto_3560 ) ( CLEAR ?auto_3552 ) ( not ( = ?auto_3552 ?auto_3560 ) ) ( not ( = ?auto_3553 ?auto_3560 ) ) ( not ( = ?auto_3551 ?auto_3560 ) ) ( not ( = ?auto_3561 ?auto_3560 ) ) ( TRUCK-AT ?auto_3557 ?auto_3555 ) ( SURFACE-AT ?auto_3550 ?auto_3555 ) ( CLEAR ?auto_3550 ) ( IS-CRATE ?auto_3551 ) ( not ( = ?auto_3550 ?auto_3551 ) ) ( not ( = ?auto_3552 ?auto_3550 ) ) ( not ( = ?auto_3553 ?auto_3550 ) ) ( not ( = ?auto_3561 ?auto_3550 ) ) ( not ( = ?auto_3560 ?auto_3550 ) ) ( AVAILABLE ?auto_3562 ) ( IN ?auto_3551 ?auto_3557 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3551 ?auto_3552 ?auto_3553 )
      ( MAKE-3CRATE-VERIFY ?auto_3550 ?auto_3551 ?auto_3552 ?auto_3553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3563 - SURFACE
      ?auto_3564 - SURFACE
    )
    :vars
    (
      ?auto_3575 - HOIST
      ?auto_3567 - PLACE
      ?auto_3572 - SURFACE
      ?auto_3568 - PLACE
      ?auto_3571 - HOIST
      ?auto_3574 - SURFACE
      ?auto_3565 - PLACE
      ?auto_3570 - HOIST
      ?auto_3573 - SURFACE
      ?auto_3566 - SURFACE
      ?auto_3569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3575 ?auto_3567 ) ( IS-CRATE ?auto_3564 ) ( not ( = ?auto_3563 ?auto_3564 ) ) ( not ( = ?auto_3572 ?auto_3563 ) ) ( not ( = ?auto_3572 ?auto_3564 ) ) ( not ( = ?auto_3568 ?auto_3567 ) ) ( HOIST-AT ?auto_3571 ?auto_3568 ) ( not ( = ?auto_3575 ?auto_3571 ) ) ( AVAILABLE ?auto_3571 ) ( SURFACE-AT ?auto_3564 ?auto_3568 ) ( ON ?auto_3564 ?auto_3574 ) ( CLEAR ?auto_3564 ) ( not ( = ?auto_3563 ?auto_3574 ) ) ( not ( = ?auto_3564 ?auto_3574 ) ) ( not ( = ?auto_3572 ?auto_3574 ) ) ( IS-CRATE ?auto_3563 ) ( not ( = ?auto_3565 ?auto_3567 ) ) ( not ( = ?auto_3568 ?auto_3565 ) ) ( HOIST-AT ?auto_3570 ?auto_3565 ) ( not ( = ?auto_3575 ?auto_3570 ) ) ( not ( = ?auto_3571 ?auto_3570 ) ) ( AVAILABLE ?auto_3570 ) ( SURFACE-AT ?auto_3563 ?auto_3565 ) ( ON ?auto_3563 ?auto_3573 ) ( CLEAR ?auto_3563 ) ( not ( = ?auto_3563 ?auto_3573 ) ) ( not ( = ?auto_3564 ?auto_3573 ) ) ( not ( = ?auto_3572 ?auto_3573 ) ) ( not ( = ?auto_3574 ?auto_3573 ) ) ( SURFACE-AT ?auto_3566 ?auto_3567 ) ( CLEAR ?auto_3566 ) ( IS-CRATE ?auto_3572 ) ( not ( = ?auto_3566 ?auto_3572 ) ) ( not ( = ?auto_3563 ?auto_3566 ) ) ( not ( = ?auto_3564 ?auto_3566 ) ) ( not ( = ?auto_3574 ?auto_3566 ) ) ( not ( = ?auto_3573 ?auto_3566 ) ) ( AVAILABLE ?auto_3575 ) ( IN ?auto_3572 ?auto_3569 ) ( TRUCK-AT ?auto_3569 ?auto_3568 ) )
    :subtasks
    ( ( !DRIVE ?auto_3569 ?auto_3568 ?auto_3567 )
      ( MAKE-2CRATE ?auto_3572 ?auto_3563 ?auto_3564 )
      ( MAKE-1CRATE-VERIFY ?auto_3563 ?auto_3564 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3576 - SURFACE
      ?auto_3577 - SURFACE
      ?auto_3578 - SURFACE
    )
    :vars
    (
      ?auto_3588 - HOIST
      ?auto_3584 - PLACE
      ?auto_3587 - PLACE
      ?auto_3586 - HOIST
      ?auto_3582 - SURFACE
      ?auto_3579 - PLACE
      ?auto_3583 - HOIST
      ?auto_3581 - SURFACE
      ?auto_3585 - SURFACE
      ?auto_3580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3588 ?auto_3584 ) ( IS-CRATE ?auto_3578 ) ( not ( = ?auto_3577 ?auto_3578 ) ) ( not ( = ?auto_3576 ?auto_3577 ) ) ( not ( = ?auto_3576 ?auto_3578 ) ) ( not ( = ?auto_3587 ?auto_3584 ) ) ( HOIST-AT ?auto_3586 ?auto_3587 ) ( not ( = ?auto_3588 ?auto_3586 ) ) ( AVAILABLE ?auto_3586 ) ( SURFACE-AT ?auto_3578 ?auto_3587 ) ( ON ?auto_3578 ?auto_3582 ) ( CLEAR ?auto_3578 ) ( not ( = ?auto_3577 ?auto_3582 ) ) ( not ( = ?auto_3578 ?auto_3582 ) ) ( not ( = ?auto_3576 ?auto_3582 ) ) ( IS-CRATE ?auto_3577 ) ( not ( = ?auto_3579 ?auto_3584 ) ) ( not ( = ?auto_3587 ?auto_3579 ) ) ( HOIST-AT ?auto_3583 ?auto_3579 ) ( not ( = ?auto_3588 ?auto_3583 ) ) ( not ( = ?auto_3586 ?auto_3583 ) ) ( AVAILABLE ?auto_3583 ) ( SURFACE-AT ?auto_3577 ?auto_3579 ) ( ON ?auto_3577 ?auto_3581 ) ( CLEAR ?auto_3577 ) ( not ( = ?auto_3577 ?auto_3581 ) ) ( not ( = ?auto_3578 ?auto_3581 ) ) ( not ( = ?auto_3576 ?auto_3581 ) ) ( not ( = ?auto_3582 ?auto_3581 ) ) ( SURFACE-AT ?auto_3585 ?auto_3584 ) ( CLEAR ?auto_3585 ) ( IS-CRATE ?auto_3576 ) ( not ( = ?auto_3585 ?auto_3576 ) ) ( not ( = ?auto_3577 ?auto_3585 ) ) ( not ( = ?auto_3578 ?auto_3585 ) ) ( not ( = ?auto_3582 ?auto_3585 ) ) ( not ( = ?auto_3581 ?auto_3585 ) ) ( AVAILABLE ?auto_3588 ) ( IN ?auto_3576 ?auto_3580 ) ( TRUCK-AT ?auto_3580 ?auto_3587 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3577 ?auto_3578 )
      ( MAKE-2CRATE-VERIFY ?auto_3576 ?auto_3577 ?auto_3578 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3589 - SURFACE
      ?auto_3590 - SURFACE
      ?auto_3591 - SURFACE
      ?auto_3592 - SURFACE
    )
    :vars
    (
      ?auto_3596 - HOIST
      ?auto_3595 - PLACE
      ?auto_3594 - PLACE
      ?auto_3598 - HOIST
      ?auto_3600 - SURFACE
      ?auto_3593 - PLACE
      ?auto_3597 - HOIST
      ?auto_3601 - SURFACE
      ?auto_3599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3596 ?auto_3595 ) ( IS-CRATE ?auto_3592 ) ( not ( = ?auto_3591 ?auto_3592 ) ) ( not ( = ?auto_3590 ?auto_3591 ) ) ( not ( = ?auto_3590 ?auto_3592 ) ) ( not ( = ?auto_3594 ?auto_3595 ) ) ( HOIST-AT ?auto_3598 ?auto_3594 ) ( not ( = ?auto_3596 ?auto_3598 ) ) ( AVAILABLE ?auto_3598 ) ( SURFACE-AT ?auto_3592 ?auto_3594 ) ( ON ?auto_3592 ?auto_3600 ) ( CLEAR ?auto_3592 ) ( not ( = ?auto_3591 ?auto_3600 ) ) ( not ( = ?auto_3592 ?auto_3600 ) ) ( not ( = ?auto_3590 ?auto_3600 ) ) ( IS-CRATE ?auto_3591 ) ( not ( = ?auto_3593 ?auto_3595 ) ) ( not ( = ?auto_3594 ?auto_3593 ) ) ( HOIST-AT ?auto_3597 ?auto_3593 ) ( not ( = ?auto_3596 ?auto_3597 ) ) ( not ( = ?auto_3598 ?auto_3597 ) ) ( AVAILABLE ?auto_3597 ) ( SURFACE-AT ?auto_3591 ?auto_3593 ) ( ON ?auto_3591 ?auto_3601 ) ( CLEAR ?auto_3591 ) ( not ( = ?auto_3591 ?auto_3601 ) ) ( not ( = ?auto_3592 ?auto_3601 ) ) ( not ( = ?auto_3590 ?auto_3601 ) ) ( not ( = ?auto_3600 ?auto_3601 ) ) ( SURFACE-AT ?auto_3589 ?auto_3595 ) ( CLEAR ?auto_3589 ) ( IS-CRATE ?auto_3590 ) ( not ( = ?auto_3589 ?auto_3590 ) ) ( not ( = ?auto_3591 ?auto_3589 ) ) ( not ( = ?auto_3592 ?auto_3589 ) ) ( not ( = ?auto_3600 ?auto_3589 ) ) ( not ( = ?auto_3601 ?auto_3589 ) ) ( AVAILABLE ?auto_3596 ) ( IN ?auto_3590 ?auto_3599 ) ( TRUCK-AT ?auto_3599 ?auto_3594 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3590 ?auto_3591 ?auto_3592 )
      ( MAKE-3CRATE-VERIFY ?auto_3589 ?auto_3590 ?auto_3591 ?auto_3592 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3602 - SURFACE
      ?auto_3603 - SURFACE
    )
    :vars
    (
      ?auto_3608 - HOIST
      ?auto_3607 - PLACE
      ?auto_3610 - SURFACE
      ?auto_3605 - PLACE
      ?auto_3611 - HOIST
      ?auto_3613 - SURFACE
      ?auto_3604 - PLACE
      ?auto_3609 - HOIST
      ?auto_3614 - SURFACE
      ?auto_3606 - SURFACE
      ?auto_3612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3608 ?auto_3607 ) ( IS-CRATE ?auto_3603 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3610 ?auto_3602 ) ) ( not ( = ?auto_3610 ?auto_3603 ) ) ( not ( = ?auto_3605 ?auto_3607 ) ) ( HOIST-AT ?auto_3611 ?auto_3605 ) ( not ( = ?auto_3608 ?auto_3611 ) ) ( SURFACE-AT ?auto_3603 ?auto_3605 ) ( ON ?auto_3603 ?auto_3613 ) ( CLEAR ?auto_3603 ) ( not ( = ?auto_3602 ?auto_3613 ) ) ( not ( = ?auto_3603 ?auto_3613 ) ) ( not ( = ?auto_3610 ?auto_3613 ) ) ( IS-CRATE ?auto_3602 ) ( not ( = ?auto_3604 ?auto_3607 ) ) ( not ( = ?auto_3605 ?auto_3604 ) ) ( HOIST-AT ?auto_3609 ?auto_3604 ) ( not ( = ?auto_3608 ?auto_3609 ) ) ( not ( = ?auto_3611 ?auto_3609 ) ) ( AVAILABLE ?auto_3609 ) ( SURFACE-AT ?auto_3602 ?auto_3604 ) ( ON ?auto_3602 ?auto_3614 ) ( CLEAR ?auto_3602 ) ( not ( = ?auto_3602 ?auto_3614 ) ) ( not ( = ?auto_3603 ?auto_3614 ) ) ( not ( = ?auto_3610 ?auto_3614 ) ) ( not ( = ?auto_3613 ?auto_3614 ) ) ( SURFACE-AT ?auto_3606 ?auto_3607 ) ( CLEAR ?auto_3606 ) ( IS-CRATE ?auto_3610 ) ( not ( = ?auto_3606 ?auto_3610 ) ) ( not ( = ?auto_3602 ?auto_3606 ) ) ( not ( = ?auto_3603 ?auto_3606 ) ) ( not ( = ?auto_3613 ?auto_3606 ) ) ( not ( = ?auto_3614 ?auto_3606 ) ) ( AVAILABLE ?auto_3608 ) ( TRUCK-AT ?auto_3612 ?auto_3605 ) ( LIFTING ?auto_3611 ?auto_3610 ) )
    :subtasks
    ( ( !LOAD ?auto_3611 ?auto_3610 ?auto_3612 ?auto_3605 )
      ( MAKE-2CRATE ?auto_3610 ?auto_3602 ?auto_3603 )
      ( MAKE-1CRATE-VERIFY ?auto_3602 ?auto_3603 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3615 - SURFACE
      ?auto_3616 - SURFACE
      ?auto_3617 - SURFACE
    )
    :vars
    (
      ?auto_3624 - HOIST
      ?auto_3622 - PLACE
      ?auto_3621 - PLACE
      ?auto_3620 - HOIST
      ?auto_3623 - SURFACE
      ?auto_3627 - PLACE
      ?auto_3625 - HOIST
      ?auto_3619 - SURFACE
      ?auto_3618 - SURFACE
      ?auto_3626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3624 ?auto_3622 ) ( IS-CRATE ?auto_3617 ) ( not ( = ?auto_3616 ?auto_3617 ) ) ( not ( = ?auto_3615 ?auto_3616 ) ) ( not ( = ?auto_3615 ?auto_3617 ) ) ( not ( = ?auto_3621 ?auto_3622 ) ) ( HOIST-AT ?auto_3620 ?auto_3621 ) ( not ( = ?auto_3624 ?auto_3620 ) ) ( SURFACE-AT ?auto_3617 ?auto_3621 ) ( ON ?auto_3617 ?auto_3623 ) ( CLEAR ?auto_3617 ) ( not ( = ?auto_3616 ?auto_3623 ) ) ( not ( = ?auto_3617 ?auto_3623 ) ) ( not ( = ?auto_3615 ?auto_3623 ) ) ( IS-CRATE ?auto_3616 ) ( not ( = ?auto_3627 ?auto_3622 ) ) ( not ( = ?auto_3621 ?auto_3627 ) ) ( HOIST-AT ?auto_3625 ?auto_3627 ) ( not ( = ?auto_3624 ?auto_3625 ) ) ( not ( = ?auto_3620 ?auto_3625 ) ) ( AVAILABLE ?auto_3625 ) ( SURFACE-AT ?auto_3616 ?auto_3627 ) ( ON ?auto_3616 ?auto_3619 ) ( CLEAR ?auto_3616 ) ( not ( = ?auto_3616 ?auto_3619 ) ) ( not ( = ?auto_3617 ?auto_3619 ) ) ( not ( = ?auto_3615 ?auto_3619 ) ) ( not ( = ?auto_3623 ?auto_3619 ) ) ( SURFACE-AT ?auto_3618 ?auto_3622 ) ( CLEAR ?auto_3618 ) ( IS-CRATE ?auto_3615 ) ( not ( = ?auto_3618 ?auto_3615 ) ) ( not ( = ?auto_3616 ?auto_3618 ) ) ( not ( = ?auto_3617 ?auto_3618 ) ) ( not ( = ?auto_3623 ?auto_3618 ) ) ( not ( = ?auto_3619 ?auto_3618 ) ) ( AVAILABLE ?auto_3624 ) ( TRUCK-AT ?auto_3626 ?auto_3621 ) ( LIFTING ?auto_3620 ?auto_3615 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3616 ?auto_3617 )
      ( MAKE-2CRATE-VERIFY ?auto_3615 ?auto_3616 ?auto_3617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3628 - SURFACE
      ?auto_3629 - SURFACE
      ?auto_3630 - SURFACE
      ?auto_3631 - SURFACE
    )
    :vars
    (
      ?auto_3633 - HOIST
      ?auto_3639 - PLACE
      ?auto_3632 - PLACE
      ?auto_3636 - HOIST
      ?auto_3638 - SURFACE
      ?auto_3634 - PLACE
      ?auto_3635 - HOIST
      ?auto_3640 - SURFACE
      ?auto_3637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3633 ?auto_3639 ) ( IS-CRATE ?auto_3631 ) ( not ( = ?auto_3630 ?auto_3631 ) ) ( not ( = ?auto_3629 ?auto_3630 ) ) ( not ( = ?auto_3629 ?auto_3631 ) ) ( not ( = ?auto_3632 ?auto_3639 ) ) ( HOIST-AT ?auto_3636 ?auto_3632 ) ( not ( = ?auto_3633 ?auto_3636 ) ) ( SURFACE-AT ?auto_3631 ?auto_3632 ) ( ON ?auto_3631 ?auto_3638 ) ( CLEAR ?auto_3631 ) ( not ( = ?auto_3630 ?auto_3638 ) ) ( not ( = ?auto_3631 ?auto_3638 ) ) ( not ( = ?auto_3629 ?auto_3638 ) ) ( IS-CRATE ?auto_3630 ) ( not ( = ?auto_3634 ?auto_3639 ) ) ( not ( = ?auto_3632 ?auto_3634 ) ) ( HOIST-AT ?auto_3635 ?auto_3634 ) ( not ( = ?auto_3633 ?auto_3635 ) ) ( not ( = ?auto_3636 ?auto_3635 ) ) ( AVAILABLE ?auto_3635 ) ( SURFACE-AT ?auto_3630 ?auto_3634 ) ( ON ?auto_3630 ?auto_3640 ) ( CLEAR ?auto_3630 ) ( not ( = ?auto_3630 ?auto_3640 ) ) ( not ( = ?auto_3631 ?auto_3640 ) ) ( not ( = ?auto_3629 ?auto_3640 ) ) ( not ( = ?auto_3638 ?auto_3640 ) ) ( SURFACE-AT ?auto_3628 ?auto_3639 ) ( CLEAR ?auto_3628 ) ( IS-CRATE ?auto_3629 ) ( not ( = ?auto_3628 ?auto_3629 ) ) ( not ( = ?auto_3630 ?auto_3628 ) ) ( not ( = ?auto_3631 ?auto_3628 ) ) ( not ( = ?auto_3638 ?auto_3628 ) ) ( not ( = ?auto_3640 ?auto_3628 ) ) ( AVAILABLE ?auto_3633 ) ( TRUCK-AT ?auto_3637 ?auto_3632 ) ( LIFTING ?auto_3636 ?auto_3629 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3629 ?auto_3630 ?auto_3631 )
      ( MAKE-3CRATE-VERIFY ?auto_3628 ?auto_3629 ?auto_3630 ?auto_3631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3641 - SURFACE
      ?auto_3642 - SURFACE
    )
    :vars
    (
      ?auto_3644 - HOIST
      ?auto_3651 - PLACE
      ?auto_3653 - SURFACE
      ?auto_3643 - PLACE
      ?auto_3648 - HOIST
      ?auto_3650 - SURFACE
      ?auto_3645 - PLACE
      ?auto_3647 - HOIST
      ?auto_3652 - SURFACE
      ?auto_3646 - SURFACE
      ?auto_3649 - TRUCK
      ?auto_3654 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3644 ?auto_3651 ) ( IS-CRATE ?auto_3642 ) ( not ( = ?auto_3641 ?auto_3642 ) ) ( not ( = ?auto_3653 ?auto_3641 ) ) ( not ( = ?auto_3653 ?auto_3642 ) ) ( not ( = ?auto_3643 ?auto_3651 ) ) ( HOIST-AT ?auto_3648 ?auto_3643 ) ( not ( = ?auto_3644 ?auto_3648 ) ) ( SURFACE-AT ?auto_3642 ?auto_3643 ) ( ON ?auto_3642 ?auto_3650 ) ( CLEAR ?auto_3642 ) ( not ( = ?auto_3641 ?auto_3650 ) ) ( not ( = ?auto_3642 ?auto_3650 ) ) ( not ( = ?auto_3653 ?auto_3650 ) ) ( IS-CRATE ?auto_3641 ) ( not ( = ?auto_3645 ?auto_3651 ) ) ( not ( = ?auto_3643 ?auto_3645 ) ) ( HOIST-AT ?auto_3647 ?auto_3645 ) ( not ( = ?auto_3644 ?auto_3647 ) ) ( not ( = ?auto_3648 ?auto_3647 ) ) ( AVAILABLE ?auto_3647 ) ( SURFACE-AT ?auto_3641 ?auto_3645 ) ( ON ?auto_3641 ?auto_3652 ) ( CLEAR ?auto_3641 ) ( not ( = ?auto_3641 ?auto_3652 ) ) ( not ( = ?auto_3642 ?auto_3652 ) ) ( not ( = ?auto_3653 ?auto_3652 ) ) ( not ( = ?auto_3650 ?auto_3652 ) ) ( SURFACE-AT ?auto_3646 ?auto_3651 ) ( CLEAR ?auto_3646 ) ( IS-CRATE ?auto_3653 ) ( not ( = ?auto_3646 ?auto_3653 ) ) ( not ( = ?auto_3641 ?auto_3646 ) ) ( not ( = ?auto_3642 ?auto_3646 ) ) ( not ( = ?auto_3650 ?auto_3646 ) ) ( not ( = ?auto_3652 ?auto_3646 ) ) ( AVAILABLE ?auto_3644 ) ( TRUCK-AT ?auto_3649 ?auto_3643 ) ( AVAILABLE ?auto_3648 ) ( SURFACE-AT ?auto_3653 ?auto_3643 ) ( ON ?auto_3653 ?auto_3654 ) ( CLEAR ?auto_3653 ) ( not ( = ?auto_3641 ?auto_3654 ) ) ( not ( = ?auto_3642 ?auto_3654 ) ) ( not ( = ?auto_3653 ?auto_3654 ) ) ( not ( = ?auto_3650 ?auto_3654 ) ) ( not ( = ?auto_3652 ?auto_3654 ) ) ( not ( = ?auto_3646 ?auto_3654 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3648 ?auto_3653 ?auto_3654 ?auto_3643 )
      ( MAKE-2CRATE ?auto_3653 ?auto_3641 ?auto_3642 )
      ( MAKE-1CRATE-VERIFY ?auto_3641 ?auto_3642 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3655 - SURFACE
      ?auto_3656 - SURFACE
      ?auto_3657 - SURFACE
    )
    :vars
    (
      ?auto_3667 - HOIST
      ?auto_3668 - PLACE
      ?auto_3661 - PLACE
      ?auto_3658 - HOIST
      ?auto_3664 - SURFACE
      ?auto_3663 - PLACE
      ?auto_3662 - HOIST
      ?auto_3659 - SURFACE
      ?auto_3660 - SURFACE
      ?auto_3665 - TRUCK
      ?auto_3666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3667 ?auto_3668 ) ( IS-CRATE ?auto_3657 ) ( not ( = ?auto_3656 ?auto_3657 ) ) ( not ( = ?auto_3655 ?auto_3656 ) ) ( not ( = ?auto_3655 ?auto_3657 ) ) ( not ( = ?auto_3661 ?auto_3668 ) ) ( HOIST-AT ?auto_3658 ?auto_3661 ) ( not ( = ?auto_3667 ?auto_3658 ) ) ( SURFACE-AT ?auto_3657 ?auto_3661 ) ( ON ?auto_3657 ?auto_3664 ) ( CLEAR ?auto_3657 ) ( not ( = ?auto_3656 ?auto_3664 ) ) ( not ( = ?auto_3657 ?auto_3664 ) ) ( not ( = ?auto_3655 ?auto_3664 ) ) ( IS-CRATE ?auto_3656 ) ( not ( = ?auto_3663 ?auto_3668 ) ) ( not ( = ?auto_3661 ?auto_3663 ) ) ( HOIST-AT ?auto_3662 ?auto_3663 ) ( not ( = ?auto_3667 ?auto_3662 ) ) ( not ( = ?auto_3658 ?auto_3662 ) ) ( AVAILABLE ?auto_3662 ) ( SURFACE-AT ?auto_3656 ?auto_3663 ) ( ON ?auto_3656 ?auto_3659 ) ( CLEAR ?auto_3656 ) ( not ( = ?auto_3656 ?auto_3659 ) ) ( not ( = ?auto_3657 ?auto_3659 ) ) ( not ( = ?auto_3655 ?auto_3659 ) ) ( not ( = ?auto_3664 ?auto_3659 ) ) ( SURFACE-AT ?auto_3660 ?auto_3668 ) ( CLEAR ?auto_3660 ) ( IS-CRATE ?auto_3655 ) ( not ( = ?auto_3660 ?auto_3655 ) ) ( not ( = ?auto_3656 ?auto_3660 ) ) ( not ( = ?auto_3657 ?auto_3660 ) ) ( not ( = ?auto_3664 ?auto_3660 ) ) ( not ( = ?auto_3659 ?auto_3660 ) ) ( AVAILABLE ?auto_3667 ) ( TRUCK-AT ?auto_3665 ?auto_3661 ) ( AVAILABLE ?auto_3658 ) ( SURFACE-AT ?auto_3655 ?auto_3661 ) ( ON ?auto_3655 ?auto_3666 ) ( CLEAR ?auto_3655 ) ( not ( = ?auto_3656 ?auto_3666 ) ) ( not ( = ?auto_3657 ?auto_3666 ) ) ( not ( = ?auto_3655 ?auto_3666 ) ) ( not ( = ?auto_3664 ?auto_3666 ) ) ( not ( = ?auto_3659 ?auto_3666 ) ) ( not ( = ?auto_3660 ?auto_3666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3656 ?auto_3657 )
      ( MAKE-2CRATE-VERIFY ?auto_3655 ?auto_3656 ?auto_3657 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3669 - SURFACE
      ?auto_3670 - SURFACE
      ?auto_3671 - SURFACE
      ?auto_3672 - SURFACE
    )
    :vars
    (
      ?auto_3677 - HOIST
      ?auto_3673 - PLACE
      ?auto_3680 - PLACE
      ?auto_3675 - HOIST
      ?auto_3682 - SURFACE
      ?auto_3681 - PLACE
      ?auto_3678 - HOIST
      ?auto_3679 - SURFACE
      ?auto_3676 - TRUCK
      ?auto_3674 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3677 ?auto_3673 ) ( IS-CRATE ?auto_3672 ) ( not ( = ?auto_3671 ?auto_3672 ) ) ( not ( = ?auto_3670 ?auto_3671 ) ) ( not ( = ?auto_3670 ?auto_3672 ) ) ( not ( = ?auto_3680 ?auto_3673 ) ) ( HOIST-AT ?auto_3675 ?auto_3680 ) ( not ( = ?auto_3677 ?auto_3675 ) ) ( SURFACE-AT ?auto_3672 ?auto_3680 ) ( ON ?auto_3672 ?auto_3682 ) ( CLEAR ?auto_3672 ) ( not ( = ?auto_3671 ?auto_3682 ) ) ( not ( = ?auto_3672 ?auto_3682 ) ) ( not ( = ?auto_3670 ?auto_3682 ) ) ( IS-CRATE ?auto_3671 ) ( not ( = ?auto_3681 ?auto_3673 ) ) ( not ( = ?auto_3680 ?auto_3681 ) ) ( HOIST-AT ?auto_3678 ?auto_3681 ) ( not ( = ?auto_3677 ?auto_3678 ) ) ( not ( = ?auto_3675 ?auto_3678 ) ) ( AVAILABLE ?auto_3678 ) ( SURFACE-AT ?auto_3671 ?auto_3681 ) ( ON ?auto_3671 ?auto_3679 ) ( CLEAR ?auto_3671 ) ( not ( = ?auto_3671 ?auto_3679 ) ) ( not ( = ?auto_3672 ?auto_3679 ) ) ( not ( = ?auto_3670 ?auto_3679 ) ) ( not ( = ?auto_3682 ?auto_3679 ) ) ( SURFACE-AT ?auto_3669 ?auto_3673 ) ( CLEAR ?auto_3669 ) ( IS-CRATE ?auto_3670 ) ( not ( = ?auto_3669 ?auto_3670 ) ) ( not ( = ?auto_3671 ?auto_3669 ) ) ( not ( = ?auto_3672 ?auto_3669 ) ) ( not ( = ?auto_3682 ?auto_3669 ) ) ( not ( = ?auto_3679 ?auto_3669 ) ) ( AVAILABLE ?auto_3677 ) ( TRUCK-AT ?auto_3676 ?auto_3680 ) ( AVAILABLE ?auto_3675 ) ( SURFACE-AT ?auto_3670 ?auto_3680 ) ( ON ?auto_3670 ?auto_3674 ) ( CLEAR ?auto_3670 ) ( not ( = ?auto_3671 ?auto_3674 ) ) ( not ( = ?auto_3672 ?auto_3674 ) ) ( not ( = ?auto_3670 ?auto_3674 ) ) ( not ( = ?auto_3682 ?auto_3674 ) ) ( not ( = ?auto_3679 ?auto_3674 ) ) ( not ( = ?auto_3669 ?auto_3674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3670 ?auto_3671 ?auto_3672 )
      ( MAKE-3CRATE-VERIFY ?auto_3669 ?auto_3670 ?auto_3671 ?auto_3672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3683 - SURFACE
      ?auto_3684 - SURFACE
    )
    :vars
    (
      ?auto_3689 - HOIST
      ?auto_3685 - PLACE
      ?auto_3696 - SURFACE
      ?auto_3693 - PLACE
      ?auto_3687 - HOIST
      ?auto_3695 - SURFACE
      ?auto_3694 - PLACE
      ?auto_3690 - HOIST
      ?auto_3691 - SURFACE
      ?auto_3692 - SURFACE
      ?auto_3686 - SURFACE
      ?auto_3688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3689 ?auto_3685 ) ( IS-CRATE ?auto_3684 ) ( not ( = ?auto_3683 ?auto_3684 ) ) ( not ( = ?auto_3696 ?auto_3683 ) ) ( not ( = ?auto_3696 ?auto_3684 ) ) ( not ( = ?auto_3693 ?auto_3685 ) ) ( HOIST-AT ?auto_3687 ?auto_3693 ) ( not ( = ?auto_3689 ?auto_3687 ) ) ( SURFACE-AT ?auto_3684 ?auto_3693 ) ( ON ?auto_3684 ?auto_3695 ) ( CLEAR ?auto_3684 ) ( not ( = ?auto_3683 ?auto_3695 ) ) ( not ( = ?auto_3684 ?auto_3695 ) ) ( not ( = ?auto_3696 ?auto_3695 ) ) ( IS-CRATE ?auto_3683 ) ( not ( = ?auto_3694 ?auto_3685 ) ) ( not ( = ?auto_3693 ?auto_3694 ) ) ( HOIST-AT ?auto_3690 ?auto_3694 ) ( not ( = ?auto_3689 ?auto_3690 ) ) ( not ( = ?auto_3687 ?auto_3690 ) ) ( AVAILABLE ?auto_3690 ) ( SURFACE-AT ?auto_3683 ?auto_3694 ) ( ON ?auto_3683 ?auto_3691 ) ( CLEAR ?auto_3683 ) ( not ( = ?auto_3683 ?auto_3691 ) ) ( not ( = ?auto_3684 ?auto_3691 ) ) ( not ( = ?auto_3696 ?auto_3691 ) ) ( not ( = ?auto_3695 ?auto_3691 ) ) ( SURFACE-AT ?auto_3692 ?auto_3685 ) ( CLEAR ?auto_3692 ) ( IS-CRATE ?auto_3696 ) ( not ( = ?auto_3692 ?auto_3696 ) ) ( not ( = ?auto_3683 ?auto_3692 ) ) ( not ( = ?auto_3684 ?auto_3692 ) ) ( not ( = ?auto_3695 ?auto_3692 ) ) ( not ( = ?auto_3691 ?auto_3692 ) ) ( AVAILABLE ?auto_3689 ) ( AVAILABLE ?auto_3687 ) ( SURFACE-AT ?auto_3696 ?auto_3693 ) ( ON ?auto_3696 ?auto_3686 ) ( CLEAR ?auto_3696 ) ( not ( = ?auto_3683 ?auto_3686 ) ) ( not ( = ?auto_3684 ?auto_3686 ) ) ( not ( = ?auto_3696 ?auto_3686 ) ) ( not ( = ?auto_3695 ?auto_3686 ) ) ( not ( = ?auto_3691 ?auto_3686 ) ) ( not ( = ?auto_3692 ?auto_3686 ) ) ( TRUCK-AT ?auto_3688 ?auto_3685 ) )
    :subtasks
    ( ( !DRIVE ?auto_3688 ?auto_3685 ?auto_3693 )
      ( MAKE-2CRATE ?auto_3696 ?auto_3683 ?auto_3684 )
      ( MAKE-1CRATE-VERIFY ?auto_3683 ?auto_3684 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3697 - SURFACE
      ?auto_3698 - SURFACE
      ?auto_3699 - SURFACE
    )
    :vars
    (
      ?auto_3702 - HOIST
      ?auto_3708 - PLACE
      ?auto_3701 - PLACE
      ?auto_3707 - HOIST
      ?auto_3710 - SURFACE
      ?auto_3709 - PLACE
      ?auto_3703 - HOIST
      ?auto_3706 - SURFACE
      ?auto_3705 - SURFACE
      ?auto_3704 - SURFACE
      ?auto_3700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3702 ?auto_3708 ) ( IS-CRATE ?auto_3699 ) ( not ( = ?auto_3698 ?auto_3699 ) ) ( not ( = ?auto_3697 ?auto_3698 ) ) ( not ( = ?auto_3697 ?auto_3699 ) ) ( not ( = ?auto_3701 ?auto_3708 ) ) ( HOIST-AT ?auto_3707 ?auto_3701 ) ( not ( = ?auto_3702 ?auto_3707 ) ) ( SURFACE-AT ?auto_3699 ?auto_3701 ) ( ON ?auto_3699 ?auto_3710 ) ( CLEAR ?auto_3699 ) ( not ( = ?auto_3698 ?auto_3710 ) ) ( not ( = ?auto_3699 ?auto_3710 ) ) ( not ( = ?auto_3697 ?auto_3710 ) ) ( IS-CRATE ?auto_3698 ) ( not ( = ?auto_3709 ?auto_3708 ) ) ( not ( = ?auto_3701 ?auto_3709 ) ) ( HOIST-AT ?auto_3703 ?auto_3709 ) ( not ( = ?auto_3702 ?auto_3703 ) ) ( not ( = ?auto_3707 ?auto_3703 ) ) ( AVAILABLE ?auto_3703 ) ( SURFACE-AT ?auto_3698 ?auto_3709 ) ( ON ?auto_3698 ?auto_3706 ) ( CLEAR ?auto_3698 ) ( not ( = ?auto_3698 ?auto_3706 ) ) ( not ( = ?auto_3699 ?auto_3706 ) ) ( not ( = ?auto_3697 ?auto_3706 ) ) ( not ( = ?auto_3710 ?auto_3706 ) ) ( SURFACE-AT ?auto_3705 ?auto_3708 ) ( CLEAR ?auto_3705 ) ( IS-CRATE ?auto_3697 ) ( not ( = ?auto_3705 ?auto_3697 ) ) ( not ( = ?auto_3698 ?auto_3705 ) ) ( not ( = ?auto_3699 ?auto_3705 ) ) ( not ( = ?auto_3710 ?auto_3705 ) ) ( not ( = ?auto_3706 ?auto_3705 ) ) ( AVAILABLE ?auto_3702 ) ( AVAILABLE ?auto_3707 ) ( SURFACE-AT ?auto_3697 ?auto_3701 ) ( ON ?auto_3697 ?auto_3704 ) ( CLEAR ?auto_3697 ) ( not ( = ?auto_3698 ?auto_3704 ) ) ( not ( = ?auto_3699 ?auto_3704 ) ) ( not ( = ?auto_3697 ?auto_3704 ) ) ( not ( = ?auto_3710 ?auto_3704 ) ) ( not ( = ?auto_3706 ?auto_3704 ) ) ( not ( = ?auto_3705 ?auto_3704 ) ) ( TRUCK-AT ?auto_3700 ?auto_3708 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3698 ?auto_3699 )
      ( MAKE-2CRATE-VERIFY ?auto_3697 ?auto_3698 ?auto_3699 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3711 - SURFACE
      ?auto_3712 - SURFACE
      ?auto_3713 - SURFACE
      ?auto_3714 - SURFACE
    )
    :vars
    (
      ?auto_3715 - HOIST
      ?auto_3722 - PLACE
      ?auto_3720 - PLACE
      ?auto_3717 - HOIST
      ?auto_3724 - SURFACE
      ?auto_3718 - PLACE
      ?auto_3716 - HOIST
      ?auto_3719 - SURFACE
      ?auto_3723 - SURFACE
      ?auto_3721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3715 ?auto_3722 ) ( IS-CRATE ?auto_3714 ) ( not ( = ?auto_3713 ?auto_3714 ) ) ( not ( = ?auto_3712 ?auto_3713 ) ) ( not ( = ?auto_3712 ?auto_3714 ) ) ( not ( = ?auto_3720 ?auto_3722 ) ) ( HOIST-AT ?auto_3717 ?auto_3720 ) ( not ( = ?auto_3715 ?auto_3717 ) ) ( SURFACE-AT ?auto_3714 ?auto_3720 ) ( ON ?auto_3714 ?auto_3724 ) ( CLEAR ?auto_3714 ) ( not ( = ?auto_3713 ?auto_3724 ) ) ( not ( = ?auto_3714 ?auto_3724 ) ) ( not ( = ?auto_3712 ?auto_3724 ) ) ( IS-CRATE ?auto_3713 ) ( not ( = ?auto_3718 ?auto_3722 ) ) ( not ( = ?auto_3720 ?auto_3718 ) ) ( HOIST-AT ?auto_3716 ?auto_3718 ) ( not ( = ?auto_3715 ?auto_3716 ) ) ( not ( = ?auto_3717 ?auto_3716 ) ) ( AVAILABLE ?auto_3716 ) ( SURFACE-AT ?auto_3713 ?auto_3718 ) ( ON ?auto_3713 ?auto_3719 ) ( CLEAR ?auto_3713 ) ( not ( = ?auto_3713 ?auto_3719 ) ) ( not ( = ?auto_3714 ?auto_3719 ) ) ( not ( = ?auto_3712 ?auto_3719 ) ) ( not ( = ?auto_3724 ?auto_3719 ) ) ( SURFACE-AT ?auto_3711 ?auto_3722 ) ( CLEAR ?auto_3711 ) ( IS-CRATE ?auto_3712 ) ( not ( = ?auto_3711 ?auto_3712 ) ) ( not ( = ?auto_3713 ?auto_3711 ) ) ( not ( = ?auto_3714 ?auto_3711 ) ) ( not ( = ?auto_3724 ?auto_3711 ) ) ( not ( = ?auto_3719 ?auto_3711 ) ) ( AVAILABLE ?auto_3715 ) ( AVAILABLE ?auto_3717 ) ( SURFACE-AT ?auto_3712 ?auto_3720 ) ( ON ?auto_3712 ?auto_3723 ) ( CLEAR ?auto_3712 ) ( not ( = ?auto_3713 ?auto_3723 ) ) ( not ( = ?auto_3714 ?auto_3723 ) ) ( not ( = ?auto_3712 ?auto_3723 ) ) ( not ( = ?auto_3724 ?auto_3723 ) ) ( not ( = ?auto_3719 ?auto_3723 ) ) ( not ( = ?auto_3711 ?auto_3723 ) ) ( TRUCK-AT ?auto_3721 ?auto_3722 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3712 ?auto_3713 ?auto_3714 )
      ( MAKE-3CRATE-VERIFY ?auto_3711 ?auto_3712 ?auto_3713 ?auto_3714 ) )
  )

)

