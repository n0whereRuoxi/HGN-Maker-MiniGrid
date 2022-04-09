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
      ?auto_2954 - SURFACE
      ?auto_2955 - SURFACE
    )
    :vars
    (
      ?auto_2956 - HOIST
      ?auto_2957 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2956 ?auto_2957 ) ( SURFACE-AT ?auto_2954 ?auto_2957 ) ( CLEAR ?auto_2954 ) ( LIFTING ?auto_2956 ?auto_2955 ) ( IS-CRATE ?auto_2955 ) ( not ( = ?auto_2954 ?auto_2955 ) ) )
    :subtasks
    ( ( !DROP ?auto_2956 ?auto_2955 ?auto_2954 ?auto_2957 )
      ( MAKE-1CRATE-VERIFY ?auto_2954 ?auto_2955 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2958 - SURFACE
      ?auto_2959 - SURFACE
    )
    :vars
    (
      ?auto_2960 - HOIST
      ?auto_2961 - PLACE
      ?auto_2962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2960 ?auto_2961 ) ( SURFACE-AT ?auto_2958 ?auto_2961 ) ( CLEAR ?auto_2958 ) ( IS-CRATE ?auto_2959 ) ( not ( = ?auto_2958 ?auto_2959 ) ) ( TRUCK-AT ?auto_2962 ?auto_2961 ) ( AVAILABLE ?auto_2960 ) ( IN ?auto_2959 ?auto_2962 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2960 ?auto_2959 ?auto_2962 ?auto_2961 )
      ( MAKE-1CRATE ?auto_2958 ?auto_2959 )
      ( MAKE-1CRATE-VERIFY ?auto_2958 ?auto_2959 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2963 - SURFACE
      ?auto_2964 - SURFACE
    )
    :vars
    (
      ?auto_2966 - HOIST
      ?auto_2965 - PLACE
      ?auto_2967 - TRUCK
      ?auto_2968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2966 ?auto_2965 ) ( SURFACE-AT ?auto_2963 ?auto_2965 ) ( CLEAR ?auto_2963 ) ( IS-CRATE ?auto_2964 ) ( not ( = ?auto_2963 ?auto_2964 ) ) ( AVAILABLE ?auto_2966 ) ( IN ?auto_2964 ?auto_2967 ) ( TRUCK-AT ?auto_2967 ?auto_2968 ) ( not ( = ?auto_2968 ?auto_2965 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2967 ?auto_2968 ?auto_2965 )
      ( MAKE-1CRATE ?auto_2963 ?auto_2964 )
      ( MAKE-1CRATE-VERIFY ?auto_2963 ?auto_2964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2969 - SURFACE
      ?auto_2970 - SURFACE
    )
    :vars
    (
      ?auto_2971 - HOIST
      ?auto_2973 - PLACE
      ?auto_2972 - TRUCK
      ?auto_2974 - PLACE
      ?auto_2975 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2971 ?auto_2973 ) ( SURFACE-AT ?auto_2969 ?auto_2973 ) ( CLEAR ?auto_2969 ) ( IS-CRATE ?auto_2970 ) ( not ( = ?auto_2969 ?auto_2970 ) ) ( AVAILABLE ?auto_2971 ) ( TRUCK-AT ?auto_2972 ?auto_2974 ) ( not ( = ?auto_2974 ?auto_2973 ) ) ( HOIST-AT ?auto_2975 ?auto_2974 ) ( LIFTING ?auto_2975 ?auto_2970 ) ( not ( = ?auto_2971 ?auto_2975 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2975 ?auto_2970 ?auto_2972 ?auto_2974 )
      ( MAKE-1CRATE ?auto_2969 ?auto_2970 )
      ( MAKE-1CRATE-VERIFY ?auto_2969 ?auto_2970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2976 - SURFACE
      ?auto_2977 - SURFACE
    )
    :vars
    (
      ?auto_2979 - HOIST
      ?auto_2981 - PLACE
      ?auto_2980 - TRUCK
      ?auto_2978 - PLACE
      ?auto_2982 - HOIST
      ?auto_2983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2979 ?auto_2981 ) ( SURFACE-AT ?auto_2976 ?auto_2981 ) ( CLEAR ?auto_2976 ) ( IS-CRATE ?auto_2977 ) ( not ( = ?auto_2976 ?auto_2977 ) ) ( AVAILABLE ?auto_2979 ) ( TRUCK-AT ?auto_2980 ?auto_2978 ) ( not ( = ?auto_2978 ?auto_2981 ) ) ( HOIST-AT ?auto_2982 ?auto_2978 ) ( not ( = ?auto_2979 ?auto_2982 ) ) ( AVAILABLE ?auto_2982 ) ( SURFACE-AT ?auto_2977 ?auto_2978 ) ( ON ?auto_2977 ?auto_2983 ) ( CLEAR ?auto_2977 ) ( not ( = ?auto_2976 ?auto_2983 ) ) ( not ( = ?auto_2977 ?auto_2983 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2982 ?auto_2977 ?auto_2983 ?auto_2978 )
      ( MAKE-1CRATE ?auto_2976 ?auto_2977 )
      ( MAKE-1CRATE-VERIFY ?auto_2976 ?auto_2977 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2984 - SURFACE
      ?auto_2985 - SURFACE
    )
    :vars
    (
      ?auto_2987 - HOIST
      ?auto_2990 - PLACE
      ?auto_2989 - PLACE
      ?auto_2991 - HOIST
      ?auto_2986 - SURFACE
      ?auto_2988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2987 ?auto_2990 ) ( SURFACE-AT ?auto_2984 ?auto_2990 ) ( CLEAR ?auto_2984 ) ( IS-CRATE ?auto_2985 ) ( not ( = ?auto_2984 ?auto_2985 ) ) ( AVAILABLE ?auto_2987 ) ( not ( = ?auto_2989 ?auto_2990 ) ) ( HOIST-AT ?auto_2991 ?auto_2989 ) ( not ( = ?auto_2987 ?auto_2991 ) ) ( AVAILABLE ?auto_2991 ) ( SURFACE-AT ?auto_2985 ?auto_2989 ) ( ON ?auto_2985 ?auto_2986 ) ( CLEAR ?auto_2985 ) ( not ( = ?auto_2984 ?auto_2986 ) ) ( not ( = ?auto_2985 ?auto_2986 ) ) ( TRUCK-AT ?auto_2988 ?auto_2990 ) )
    :subtasks
    ( ( !DRIVE ?auto_2988 ?auto_2990 ?auto_2989 )
      ( MAKE-1CRATE ?auto_2984 ?auto_2985 )
      ( MAKE-1CRATE-VERIFY ?auto_2984 ?auto_2985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2997 - SURFACE
      ?auto_2998 - SURFACE
    )
    :vars
    (
      ?auto_2999 - HOIST
      ?auto_3000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2999 ?auto_3000 ) ( SURFACE-AT ?auto_2997 ?auto_3000 ) ( CLEAR ?auto_2997 ) ( LIFTING ?auto_2999 ?auto_2998 ) ( IS-CRATE ?auto_2998 ) ( not ( = ?auto_2997 ?auto_2998 ) ) )
    :subtasks
    ( ( !DROP ?auto_2999 ?auto_2998 ?auto_2997 ?auto_3000 )
      ( MAKE-1CRATE-VERIFY ?auto_2997 ?auto_2998 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3001 - SURFACE
      ?auto_3002 - SURFACE
      ?auto_3003 - SURFACE
    )
    :vars
    (
      ?auto_3005 - HOIST
      ?auto_3004 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3005 ?auto_3004 ) ( SURFACE-AT ?auto_3002 ?auto_3004 ) ( CLEAR ?auto_3002 ) ( LIFTING ?auto_3005 ?auto_3003 ) ( IS-CRATE ?auto_3003 ) ( not ( = ?auto_3002 ?auto_3003 ) ) ( ON ?auto_3002 ?auto_3001 ) ( not ( = ?auto_3001 ?auto_3002 ) ) ( not ( = ?auto_3001 ?auto_3003 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3002 ?auto_3003 )
      ( MAKE-2CRATE-VERIFY ?auto_3001 ?auto_3002 ?auto_3003 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3006 - SURFACE
      ?auto_3007 - SURFACE
    )
    :vars
    (
      ?auto_3009 - HOIST
      ?auto_3008 - PLACE
      ?auto_3010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3009 ?auto_3008 ) ( SURFACE-AT ?auto_3006 ?auto_3008 ) ( CLEAR ?auto_3006 ) ( IS-CRATE ?auto_3007 ) ( not ( = ?auto_3006 ?auto_3007 ) ) ( TRUCK-AT ?auto_3010 ?auto_3008 ) ( AVAILABLE ?auto_3009 ) ( IN ?auto_3007 ?auto_3010 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3009 ?auto_3007 ?auto_3010 ?auto_3008 )
      ( MAKE-1CRATE ?auto_3006 ?auto_3007 )
      ( MAKE-1CRATE-VERIFY ?auto_3006 ?auto_3007 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3011 - SURFACE
      ?auto_3012 - SURFACE
      ?auto_3013 - SURFACE
    )
    :vars
    (
      ?auto_3014 - HOIST
      ?auto_3016 - PLACE
      ?auto_3015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3014 ?auto_3016 ) ( SURFACE-AT ?auto_3012 ?auto_3016 ) ( CLEAR ?auto_3012 ) ( IS-CRATE ?auto_3013 ) ( not ( = ?auto_3012 ?auto_3013 ) ) ( TRUCK-AT ?auto_3015 ?auto_3016 ) ( AVAILABLE ?auto_3014 ) ( IN ?auto_3013 ?auto_3015 ) ( ON ?auto_3012 ?auto_3011 ) ( not ( = ?auto_3011 ?auto_3012 ) ) ( not ( = ?auto_3011 ?auto_3013 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3012 ?auto_3013 )
      ( MAKE-2CRATE-VERIFY ?auto_3011 ?auto_3012 ?auto_3013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3017 - SURFACE
      ?auto_3018 - SURFACE
    )
    :vars
    (
      ?auto_3022 - HOIST
      ?auto_3021 - PLACE
      ?auto_3020 - TRUCK
      ?auto_3019 - SURFACE
      ?auto_3023 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3022 ?auto_3021 ) ( SURFACE-AT ?auto_3017 ?auto_3021 ) ( CLEAR ?auto_3017 ) ( IS-CRATE ?auto_3018 ) ( not ( = ?auto_3017 ?auto_3018 ) ) ( AVAILABLE ?auto_3022 ) ( IN ?auto_3018 ?auto_3020 ) ( ON ?auto_3017 ?auto_3019 ) ( not ( = ?auto_3019 ?auto_3017 ) ) ( not ( = ?auto_3019 ?auto_3018 ) ) ( TRUCK-AT ?auto_3020 ?auto_3023 ) ( not ( = ?auto_3023 ?auto_3021 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3020 ?auto_3023 ?auto_3021 )
      ( MAKE-2CRATE ?auto_3019 ?auto_3017 ?auto_3018 )
      ( MAKE-1CRATE-VERIFY ?auto_3017 ?auto_3018 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3024 - SURFACE
      ?auto_3025 - SURFACE
      ?auto_3026 - SURFACE
    )
    :vars
    (
      ?auto_3027 - HOIST
      ?auto_3028 - PLACE
      ?auto_3029 - TRUCK
      ?auto_3030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3027 ?auto_3028 ) ( SURFACE-AT ?auto_3025 ?auto_3028 ) ( CLEAR ?auto_3025 ) ( IS-CRATE ?auto_3026 ) ( not ( = ?auto_3025 ?auto_3026 ) ) ( AVAILABLE ?auto_3027 ) ( IN ?auto_3026 ?auto_3029 ) ( ON ?auto_3025 ?auto_3024 ) ( not ( = ?auto_3024 ?auto_3025 ) ) ( not ( = ?auto_3024 ?auto_3026 ) ) ( TRUCK-AT ?auto_3029 ?auto_3030 ) ( not ( = ?auto_3030 ?auto_3028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3025 ?auto_3026 )
      ( MAKE-2CRATE-VERIFY ?auto_3024 ?auto_3025 ?auto_3026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3031 - SURFACE
      ?auto_3032 - SURFACE
    )
    :vars
    (
      ?auto_3033 - HOIST
      ?auto_3037 - PLACE
      ?auto_3036 - SURFACE
      ?auto_3034 - TRUCK
      ?auto_3035 - PLACE
      ?auto_3038 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3033 ?auto_3037 ) ( SURFACE-AT ?auto_3031 ?auto_3037 ) ( CLEAR ?auto_3031 ) ( IS-CRATE ?auto_3032 ) ( not ( = ?auto_3031 ?auto_3032 ) ) ( AVAILABLE ?auto_3033 ) ( ON ?auto_3031 ?auto_3036 ) ( not ( = ?auto_3036 ?auto_3031 ) ) ( not ( = ?auto_3036 ?auto_3032 ) ) ( TRUCK-AT ?auto_3034 ?auto_3035 ) ( not ( = ?auto_3035 ?auto_3037 ) ) ( HOIST-AT ?auto_3038 ?auto_3035 ) ( LIFTING ?auto_3038 ?auto_3032 ) ( not ( = ?auto_3033 ?auto_3038 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3038 ?auto_3032 ?auto_3034 ?auto_3035 )
      ( MAKE-2CRATE ?auto_3036 ?auto_3031 ?auto_3032 )
      ( MAKE-1CRATE-VERIFY ?auto_3031 ?auto_3032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3039 - SURFACE
      ?auto_3040 - SURFACE
      ?auto_3041 - SURFACE
    )
    :vars
    (
      ?auto_3043 - HOIST
      ?auto_3042 - PLACE
      ?auto_3045 - TRUCK
      ?auto_3044 - PLACE
      ?auto_3046 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3043 ?auto_3042 ) ( SURFACE-AT ?auto_3040 ?auto_3042 ) ( CLEAR ?auto_3040 ) ( IS-CRATE ?auto_3041 ) ( not ( = ?auto_3040 ?auto_3041 ) ) ( AVAILABLE ?auto_3043 ) ( ON ?auto_3040 ?auto_3039 ) ( not ( = ?auto_3039 ?auto_3040 ) ) ( not ( = ?auto_3039 ?auto_3041 ) ) ( TRUCK-AT ?auto_3045 ?auto_3044 ) ( not ( = ?auto_3044 ?auto_3042 ) ) ( HOIST-AT ?auto_3046 ?auto_3044 ) ( LIFTING ?auto_3046 ?auto_3041 ) ( not ( = ?auto_3043 ?auto_3046 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3040 ?auto_3041 )
      ( MAKE-2CRATE-VERIFY ?auto_3039 ?auto_3040 ?auto_3041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3047 - SURFACE
      ?auto_3048 - SURFACE
    )
    :vars
    (
      ?auto_3051 - HOIST
      ?auto_3050 - PLACE
      ?auto_3053 - SURFACE
      ?auto_3054 - TRUCK
      ?auto_3049 - PLACE
      ?auto_3052 - HOIST
      ?auto_3055 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3051 ?auto_3050 ) ( SURFACE-AT ?auto_3047 ?auto_3050 ) ( CLEAR ?auto_3047 ) ( IS-CRATE ?auto_3048 ) ( not ( = ?auto_3047 ?auto_3048 ) ) ( AVAILABLE ?auto_3051 ) ( ON ?auto_3047 ?auto_3053 ) ( not ( = ?auto_3053 ?auto_3047 ) ) ( not ( = ?auto_3053 ?auto_3048 ) ) ( TRUCK-AT ?auto_3054 ?auto_3049 ) ( not ( = ?auto_3049 ?auto_3050 ) ) ( HOIST-AT ?auto_3052 ?auto_3049 ) ( not ( = ?auto_3051 ?auto_3052 ) ) ( AVAILABLE ?auto_3052 ) ( SURFACE-AT ?auto_3048 ?auto_3049 ) ( ON ?auto_3048 ?auto_3055 ) ( CLEAR ?auto_3048 ) ( not ( = ?auto_3047 ?auto_3055 ) ) ( not ( = ?auto_3048 ?auto_3055 ) ) ( not ( = ?auto_3053 ?auto_3055 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3052 ?auto_3048 ?auto_3055 ?auto_3049 )
      ( MAKE-2CRATE ?auto_3053 ?auto_3047 ?auto_3048 )
      ( MAKE-1CRATE-VERIFY ?auto_3047 ?auto_3048 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3056 - SURFACE
      ?auto_3057 - SURFACE
      ?auto_3058 - SURFACE
    )
    :vars
    (
      ?auto_3062 - HOIST
      ?auto_3064 - PLACE
      ?auto_3059 - TRUCK
      ?auto_3060 - PLACE
      ?auto_3061 - HOIST
      ?auto_3063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3062 ?auto_3064 ) ( SURFACE-AT ?auto_3057 ?auto_3064 ) ( CLEAR ?auto_3057 ) ( IS-CRATE ?auto_3058 ) ( not ( = ?auto_3057 ?auto_3058 ) ) ( AVAILABLE ?auto_3062 ) ( ON ?auto_3057 ?auto_3056 ) ( not ( = ?auto_3056 ?auto_3057 ) ) ( not ( = ?auto_3056 ?auto_3058 ) ) ( TRUCK-AT ?auto_3059 ?auto_3060 ) ( not ( = ?auto_3060 ?auto_3064 ) ) ( HOIST-AT ?auto_3061 ?auto_3060 ) ( not ( = ?auto_3062 ?auto_3061 ) ) ( AVAILABLE ?auto_3061 ) ( SURFACE-AT ?auto_3058 ?auto_3060 ) ( ON ?auto_3058 ?auto_3063 ) ( CLEAR ?auto_3058 ) ( not ( = ?auto_3057 ?auto_3063 ) ) ( not ( = ?auto_3058 ?auto_3063 ) ) ( not ( = ?auto_3056 ?auto_3063 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3057 ?auto_3058 )
      ( MAKE-2CRATE-VERIFY ?auto_3056 ?auto_3057 ?auto_3058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3065 - SURFACE
      ?auto_3066 - SURFACE
    )
    :vars
    (
      ?auto_3071 - HOIST
      ?auto_3073 - PLACE
      ?auto_3069 - SURFACE
      ?auto_3067 - PLACE
      ?auto_3072 - HOIST
      ?auto_3070 - SURFACE
      ?auto_3068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3071 ?auto_3073 ) ( SURFACE-AT ?auto_3065 ?auto_3073 ) ( CLEAR ?auto_3065 ) ( IS-CRATE ?auto_3066 ) ( not ( = ?auto_3065 ?auto_3066 ) ) ( AVAILABLE ?auto_3071 ) ( ON ?auto_3065 ?auto_3069 ) ( not ( = ?auto_3069 ?auto_3065 ) ) ( not ( = ?auto_3069 ?auto_3066 ) ) ( not ( = ?auto_3067 ?auto_3073 ) ) ( HOIST-AT ?auto_3072 ?auto_3067 ) ( not ( = ?auto_3071 ?auto_3072 ) ) ( AVAILABLE ?auto_3072 ) ( SURFACE-AT ?auto_3066 ?auto_3067 ) ( ON ?auto_3066 ?auto_3070 ) ( CLEAR ?auto_3066 ) ( not ( = ?auto_3065 ?auto_3070 ) ) ( not ( = ?auto_3066 ?auto_3070 ) ) ( not ( = ?auto_3069 ?auto_3070 ) ) ( TRUCK-AT ?auto_3068 ?auto_3073 ) )
    :subtasks
    ( ( !DRIVE ?auto_3068 ?auto_3073 ?auto_3067 )
      ( MAKE-2CRATE ?auto_3069 ?auto_3065 ?auto_3066 )
      ( MAKE-1CRATE-VERIFY ?auto_3065 ?auto_3066 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3074 - SURFACE
      ?auto_3075 - SURFACE
      ?auto_3076 - SURFACE
    )
    :vars
    (
      ?auto_3081 - HOIST
      ?auto_3080 - PLACE
      ?auto_3079 - PLACE
      ?auto_3077 - HOIST
      ?auto_3078 - SURFACE
      ?auto_3082 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3081 ?auto_3080 ) ( SURFACE-AT ?auto_3075 ?auto_3080 ) ( CLEAR ?auto_3075 ) ( IS-CRATE ?auto_3076 ) ( not ( = ?auto_3075 ?auto_3076 ) ) ( AVAILABLE ?auto_3081 ) ( ON ?auto_3075 ?auto_3074 ) ( not ( = ?auto_3074 ?auto_3075 ) ) ( not ( = ?auto_3074 ?auto_3076 ) ) ( not ( = ?auto_3079 ?auto_3080 ) ) ( HOIST-AT ?auto_3077 ?auto_3079 ) ( not ( = ?auto_3081 ?auto_3077 ) ) ( AVAILABLE ?auto_3077 ) ( SURFACE-AT ?auto_3076 ?auto_3079 ) ( ON ?auto_3076 ?auto_3078 ) ( CLEAR ?auto_3076 ) ( not ( = ?auto_3075 ?auto_3078 ) ) ( not ( = ?auto_3076 ?auto_3078 ) ) ( not ( = ?auto_3074 ?auto_3078 ) ) ( TRUCK-AT ?auto_3082 ?auto_3080 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3075 ?auto_3076 )
      ( MAKE-2CRATE-VERIFY ?auto_3074 ?auto_3075 ?auto_3076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3083 - SURFACE
      ?auto_3084 - SURFACE
    )
    :vars
    (
      ?auto_3085 - HOIST
      ?auto_3087 - PLACE
      ?auto_3090 - SURFACE
      ?auto_3091 - PLACE
      ?auto_3088 - HOIST
      ?auto_3086 - SURFACE
      ?auto_3089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3085 ?auto_3087 ) ( IS-CRATE ?auto_3084 ) ( not ( = ?auto_3083 ?auto_3084 ) ) ( not ( = ?auto_3090 ?auto_3083 ) ) ( not ( = ?auto_3090 ?auto_3084 ) ) ( not ( = ?auto_3091 ?auto_3087 ) ) ( HOIST-AT ?auto_3088 ?auto_3091 ) ( not ( = ?auto_3085 ?auto_3088 ) ) ( AVAILABLE ?auto_3088 ) ( SURFACE-AT ?auto_3084 ?auto_3091 ) ( ON ?auto_3084 ?auto_3086 ) ( CLEAR ?auto_3084 ) ( not ( = ?auto_3083 ?auto_3086 ) ) ( not ( = ?auto_3084 ?auto_3086 ) ) ( not ( = ?auto_3090 ?auto_3086 ) ) ( TRUCK-AT ?auto_3089 ?auto_3087 ) ( SURFACE-AT ?auto_3090 ?auto_3087 ) ( CLEAR ?auto_3090 ) ( LIFTING ?auto_3085 ?auto_3083 ) ( IS-CRATE ?auto_3083 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3090 ?auto_3083 )
      ( MAKE-2CRATE ?auto_3090 ?auto_3083 ?auto_3084 )
      ( MAKE-1CRATE-VERIFY ?auto_3083 ?auto_3084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3092 - SURFACE
      ?auto_3093 - SURFACE
      ?auto_3094 - SURFACE
    )
    :vars
    (
      ?auto_3095 - HOIST
      ?auto_3096 - PLACE
      ?auto_3098 - PLACE
      ?auto_3099 - HOIST
      ?auto_3097 - SURFACE
      ?auto_3100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3095 ?auto_3096 ) ( IS-CRATE ?auto_3094 ) ( not ( = ?auto_3093 ?auto_3094 ) ) ( not ( = ?auto_3092 ?auto_3093 ) ) ( not ( = ?auto_3092 ?auto_3094 ) ) ( not ( = ?auto_3098 ?auto_3096 ) ) ( HOIST-AT ?auto_3099 ?auto_3098 ) ( not ( = ?auto_3095 ?auto_3099 ) ) ( AVAILABLE ?auto_3099 ) ( SURFACE-AT ?auto_3094 ?auto_3098 ) ( ON ?auto_3094 ?auto_3097 ) ( CLEAR ?auto_3094 ) ( not ( = ?auto_3093 ?auto_3097 ) ) ( not ( = ?auto_3094 ?auto_3097 ) ) ( not ( = ?auto_3092 ?auto_3097 ) ) ( TRUCK-AT ?auto_3100 ?auto_3096 ) ( SURFACE-AT ?auto_3092 ?auto_3096 ) ( CLEAR ?auto_3092 ) ( LIFTING ?auto_3095 ?auto_3093 ) ( IS-CRATE ?auto_3093 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3093 ?auto_3094 )
      ( MAKE-2CRATE-VERIFY ?auto_3092 ?auto_3093 ?auto_3094 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3101 - SURFACE
      ?auto_3102 - SURFACE
    )
    :vars
    (
      ?auto_3105 - HOIST
      ?auto_3108 - PLACE
      ?auto_3109 - SURFACE
      ?auto_3103 - PLACE
      ?auto_3106 - HOIST
      ?auto_3107 - SURFACE
      ?auto_3104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3105 ?auto_3108 ) ( IS-CRATE ?auto_3102 ) ( not ( = ?auto_3101 ?auto_3102 ) ) ( not ( = ?auto_3109 ?auto_3101 ) ) ( not ( = ?auto_3109 ?auto_3102 ) ) ( not ( = ?auto_3103 ?auto_3108 ) ) ( HOIST-AT ?auto_3106 ?auto_3103 ) ( not ( = ?auto_3105 ?auto_3106 ) ) ( AVAILABLE ?auto_3106 ) ( SURFACE-AT ?auto_3102 ?auto_3103 ) ( ON ?auto_3102 ?auto_3107 ) ( CLEAR ?auto_3102 ) ( not ( = ?auto_3101 ?auto_3107 ) ) ( not ( = ?auto_3102 ?auto_3107 ) ) ( not ( = ?auto_3109 ?auto_3107 ) ) ( TRUCK-AT ?auto_3104 ?auto_3108 ) ( SURFACE-AT ?auto_3109 ?auto_3108 ) ( CLEAR ?auto_3109 ) ( IS-CRATE ?auto_3101 ) ( AVAILABLE ?auto_3105 ) ( IN ?auto_3101 ?auto_3104 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3105 ?auto_3101 ?auto_3104 ?auto_3108 )
      ( MAKE-2CRATE ?auto_3109 ?auto_3101 ?auto_3102 )
      ( MAKE-1CRATE-VERIFY ?auto_3101 ?auto_3102 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3110 - SURFACE
      ?auto_3111 - SURFACE
      ?auto_3112 - SURFACE
    )
    :vars
    (
      ?auto_3115 - HOIST
      ?auto_3118 - PLACE
      ?auto_3116 - PLACE
      ?auto_3114 - HOIST
      ?auto_3113 - SURFACE
      ?auto_3117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3115 ?auto_3118 ) ( IS-CRATE ?auto_3112 ) ( not ( = ?auto_3111 ?auto_3112 ) ) ( not ( = ?auto_3110 ?auto_3111 ) ) ( not ( = ?auto_3110 ?auto_3112 ) ) ( not ( = ?auto_3116 ?auto_3118 ) ) ( HOIST-AT ?auto_3114 ?auto_3116 ) ( not ( = ?auto_3115 ?auto_3114 ) ) ( AVAILABLE ?auto_3114 ) ( SURFACE-AT ?auto_3112 ?auto_3116 ) ( ON ?auto_3112 ?auto_3113 ) ( CLEAR ?auto_3112 ) ( not ( = ?auto_3111 ?auto_3113 ) ) ( not ( = ?auto_3112 ?auto_3113 ) ) ( not ( = ?auto_3110 ?auto_3113 ) ) ( TRUCK-AT ?auto_3117 ?auto_3118 ) ( SURFACE-AT ?auto_3110 ?auto_3118 ) ( CLEAR ?auto_3110 ) ( IS-CRATE ?auto_3111 ) ( AVAILABLE ?auto_3115 ) ( IN ?auto_3111 ?auto_3117 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3111 ?auto_3112 )
      ( MAKE-2CRATE-VERIFY ?auto_3110 ?auto_3111 ?auto_3112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3119 - SURFACE
      ?auto_3120 - SURFACE
    )
    :vars
    (
      ?auto_3127 - HOIST
      ?auto_3123 - PLACE
      ?auto_3124 - SURFACE
      ?auto_3121 - PLACE
      ?auto_3126 - HOIST
      ?auto_3122 - SURFACE
      ?auto_3125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3127 ?auto_3123 ) ( IS-CRATE ?auto_3120 ) ( not ( = ?auto_3119 ?auto_3120 ) ) ( not ( = ?auto_3124 ?auto_3119 ) ) ( not ( = ?auto_3124 ?auto_3120 ) ) ( not ( = ?auto_3121 ?auto_3123 ) ) ( HOIST-AT ?auto_3126 ?auto_3121 ) ( not ( = ?auto_3127 ?auto_3126 ) ) ( AVAILABLE ?auto_3126 ) ( SURFACE-AT ?auto_3120 ?auto_3121 ) ( ON ?auto_3120 ?auto_3122 ) ( CLEAR ?auto_3120 ) ( not ( = ?auto_3119 ?auto_3122 ) ) ( not ( = ?auto_3120 ?auto_3122 ) ) ( not ( = ?auto_3124 ?auto_3122 ) ) ( SURFACE-AT ?auto_3124 ?auto_3123 ) ( CLEAR ?auto_3124 ) ( IS-CRATE ?auto_3119 ) ( AVAILABLE ?auto_3127 ) ( IN ?auto_3119 ?auto_3125 ) ( TRUCK-AT ?auto_3125 ?auto_3121 ) )
    :subtasks
    ( ( !DRIVE ?auto_3125 ?auto_3121 ?auto_3123 )
      ( MAKE-2CRATE ?auto_3124 ?auto_3119 ?auto_3120 )
      ( MAKE-1CRATE-VERIFY ?auto_3119 ?auto_3120 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3128 - SURFACE
      ?auto_3129 - SURFACE
      ?auto_3130 - SURFACE
    )
    :vars
    (
      ?auto_3131 - HOIST
      ?auto_3135 - PLACE
      ?auto_3133 - PLACE
      ?auto_3134 - HOIST
      ?auto_3136 - SURFACE
      ?auto_3132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3131 ?auto_3135 ) ( IS-CRATE ?auto_3130 ) ( not ( = ?auto_3129 ?auto_3130 ) ) ( not ( = ?auto_3128 ?auto_3129 ) ) ( not ( = ?auto_3128 ?auto_3130 ) ) ( not ( = ?auto_3133 ?auto_3135 ) ) ( HOIST-AT ?auto_3134 ?auto_3133 ) ( not ( = ?auto_3131 ?auto_3134 ) ) ( AVAILABLE ?auto_3134 ) ( SURFACE-AT ?auto_3130 ?auto_3133 ) ( ON ?auto_3130 ?auto_3136 ) ( CLEAR ?auto_3130 ) ( not ( = ?auto_3129 ?auto_3136 ) ) ( not ( = ?auto_3130 ?auto_3136 ) ) ( not ( = ?auto_3128 ?auto_3136 ) ) ( SURFACE-AT ?auto_3128 ?auto_3135 ) ( CLEAR ?auto_3128 ) ( IS-CRATE ?auto_3129 ) ( AVAILABLE ?auto_3131 ) ( IN ?auto_3129 ?auto_3132 ) ( TRUCK-AT ?auto_3132 ?auto_3133 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3129 ?auto_3130 )
      ( MAKE-2CRATE-VERIFY ?auto_3128 ?auto_3129 ?auto_3130 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3137 - SURFACE
      ?auto_3138 - SURFACE
    )
    :vars
    (
      ?auto_3139 - HOIST
      ?auto_3141 - PLACE
      ?auto_3142 - SURFACE
      ?auto_3145 - PLACE
      ?auto_3140 - HOIST
      ?auto_3143 - SURFACE
      ?auto_3144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3139 ?auto_3141 ) ( IS-CRATE ?auto_3138 ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( not ( = ?auto_3142 ?auto_3137 ) ) ( not ( = ?auto_3142 ?auto_3138 ) ) ( not ( = ?auto_3145 ?auto_3141 ) ) ( HOIST-AT ?auto_3140 ?auto_3145 ) ( not ( = ?auto_3139 ?auto_3140 ) ) ( SURFACE-AT ?auto_3138 ?auto_3145 ) ( ON ?auto_3138 ?auto_3143 ) ( CLEAR ?auto_3138 ) ( not ( = ?auto_3137 ?auto_3143 ) ) ( not ( = ?auto_3138 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( SURFACE-AT ?auto_3142 ?auto_3141 ) ( CLEAR ?auto_3142 ) ( IS-CRATE ?auto_3137 ) ( AVAILABLE ?auto_3139 ) ( TRUCK-AT ?auto_3144 ?auto_3145 ) ( LIFTING ?auto_3140 ?auto_3137 ) )
    :subtasks
    ( ( !LOAD ?auto_3140 ?auto_3137 ?auto_3144 ?auto_3145 )
      ( MAKE-2CRATE ?auto_3142 ?auto_3137 ?auto_3138 )
      ( MAKE-1CRATE-VERIFY ?auto_3137 ?auto_3138 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3146 - SURFACE
      ?auto_3147 - SURFACE
      ?auto_3148 - SURFACE
    )
    :vars
    (
      ?auto_3150 - HOIST
      ?auto_3152 - PLACE
      ?auto_3153 - PLACE
      ?auto_3151 - HOIST
      ?auto_3149 - SURFACE
      ?auto_3154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3150 ?auto_3152 ) ( IS-CRATE ?auto_3148 ) ( not ( = ?auto_3147 ?auto_3148 ) ) ( not ( = ?auto_3146 ?auto_3147 ) ) ( not ( = ?auto_3146 ?auto_3148 ) ) ( not ( = ?auto_3153 ?auto_3152 ) ) ( HOIST-AT ?auto_3151 ?auto_3153 ) ( not ( = ?auto_3150 ?auto_3151 ) ) ( SURFACE-AT ?auto_3148 ?auto_3153 ) ( ON ?auto_3148 ?auto_3149 ) ( CLEAR ?auto_3148 ) ( not ( = ?auto_3147 ?auto_3149 ) ) ( not ( = ?auto_3148 ?auto_3149 ) ) ( not ( = ?auto_3146 ?auto_3149 ) ) ( SURFACE-AT ?auto_3146 ?auto_3152 ) ( CLEAR ?auto_3146 ) ( IS-CRATE ?auto_3147 ) ( AVAILABLE ?auto_3150 ) ( TRUCK-AT ?auto_3154 ?auto_3153 ) ( LIFTING ?auto_3151 ?auto_3147 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3147 ?auto_3148 )
      ( MAKE-2CRATE-VERIFY ?auto_3146 ?auto_3147 ?auto_3148 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3155 - SURFACE
      ?auto_3156 - SURFACE
    )
    :vars
    (
      ?auto_3159 - HOIST
      ?auto_3163 - PLACE
      ?auto_3161 - SURFACE
      ?auto_3157 - PLACE
      ?auto_3158 - HOIST
      ?auto_3160 - SURFACE
      ?auto_3162 - TRUCK
      ?auto_3164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3159 ?auto_3163 ) ( IS-CRATE ?auto_3156 ) ( not ( = ?auto_3155 ?auto_3156 ) ) ( not ( = ?auto_3161 ?auto_3155 ) ) ( not ( = ?auto_3161 ?auto_3156 ) ) ( not ( = ?auto_3157 ?auto_3163 ) ) ( HOIST-AT ?auto_3158 ?auto_3157 ) ( not ( = ?auto_3159 ?auto_3158 ) ) ( SURFACE-AT ?auto_3156 ?auto_3157 ) ( ON ?auto_3156 ?auto_3160 ) ( CLEAR ?auto_3156 ) ( not ( = ?auto_3155 ?auto_3160 ) ) ( not ( = ?auto_3156 ?auto_3160 ) ) ( not ( = ?auto_3161 ?auto_3160 ) ) ( SURFACE-AT ?auto_3161 ?auto_3163 ) ( CLEAR ?auto_3161 ) ( IS-CRATE ?auto_3155 ) ( AVAILABLE ?auto_3159 ) ( TRUCK-AT ?auto_3162 ?auto_3157 ) ( AVAILABLE ?auto_3158 ) ( SURFACE-AT ?auto_3155 ?auto_3157 ) ( ON ?auto_3155 ?auto_3164 ) ( CLEAR ?auto_3155 ) ( not ( = ?auto_3155 ?auto_3164 ) ) ( not ( = ?auto_3156 ?auto_3164 ) ) ( not ( = ?auto_3161 ?auto_3164 ) ) ( not ( = ?auto_3160 ?auto_3164 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3158 ?auto_3155 ?auto_3164 ?auto_3157 )
      ( MAKE-2CRATE ?auto_3161 ?auto_3155 ?auto_3156 )
      ( MAKE-1CRATE-VERIFY ?auto_3155 ?auto_3156 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3165 - SURFACE
      ?auto_3166 - SURFACE
      ?auto_3167 - SURFACE
    )
    :vars
    (
      ?auto_3171 - HOIST
      ?auto_3168 - PLACE
      ?auto_3173 - PLACE
      ?auto_3174 - HOIST
      ?auto_3169 - SURFACE
      ?auto_3170 - TRUCK
      ?auto_3172 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3171 ?auto_3168 ) ( IS-CRATE ?auto_3167 ) ( not ( = ?auto_3166 ?auto_3167 ) ) ( not ( = ?auto_3165 ?auto_3166 ) ) ( not ( = ?auto_3165 ?auto_3167 ) ) ( not ( = ?auto_3173 ?auto_3168 ) ) ( HOIST-AT ?auto_3174 ?auto_3173 ) ( not ( = ?auto_3171 ?auto_3174 ) ) ( SURFACE-AT ?auto_3167 ?auto_3173 ) ( ON ?auto_3167 ?auto_3169 ) ( CLEAR ?auto_3167 ) ( not ( = ?auto_3166 ?auto_3169 ) ) ( not ( = ?auto_3167 ?auto_3169 ) ) ( not ( = ?auto_3165 ?auto_3169 ) ) ( SURFACE-AT ?auto_3165 ?auto_3168 ) ( CLEAR ?auto_3165 ) ( IS-CRATE ?auto_3166 ) ( AVAILABLE ?auto_3171 ) ( TRUCK-AT ?auto_3170 ?auto_3173 ) ( AVAILABLE ?auto_3174 ) ( SURFACE-AT ?auto_3166 ?auto_3173 ) ( ON ?auto_3166 ?auto_3172 ) ( CLEAR ?auto_3166 ) ( not ( = ?auto_3166 ?auto_3172 ) ) ( not ( = ?auto_3167 ?auto_3172 ) ) ( not ( = ?auto_3165 ?auto_3172 ) ) ( not ( = ?auto_3169 ?auto_3172 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3166 ?auto_3167 )
      ( MAKE-2CRATE-VERIFY ?auto_3165 ?auto_3166 ?auto_3167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3175 - SURFACE
      ?auto_3176 - SURFACE
    )
    :vars
    (
      ?auto_3179 - HOIST
      ?auto_3183 - PLACE
      ?auto_3177 - SURFACE
      ?auto_3181 - PLACE
      ?auto_3180 - HOIST
      ?auto_3184 - SURFACE
      ?auto_3182 - SURFACE
      ?auto_3178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3179 ?auto_3183 ) ( IS-CRATE ?auto_3176 ) ( not ( = ?auto_3175 ?auto_3176 ) ) ( not ( = ?auto_3177 ?auto_3175 ) ) ( not ( = ?auto_3177 ?auto_3176 ) ) ( not ( = ?auto_3181 ?auto_3183 ) ) ( HOIST-AT ?auto_3180 ?auto_3181 ) ( not ( = ?auto_3179 ?auto_3180 ) ) ( SURFACE-AT ?auto_3176 ?auto_3181 ) ( ON ?auto_3176 ?auto_3184 ) ( CLEAR ?auto_3176 ) ( not ( = ?auto_3175 ?auto_3184 ) ) ( not ( = ?auto_3176 ?auto_3184 ) ) ( not ( = ?auto_3177 ?auto_3184 ) ) ( SURFACE-AT ?auto_3177 ?auto_3183 ) ( CLEAR ?auto_3177 ) ( IS-CRATE ?auto_3175 ) ( AVAILABLE ?auto_3179 ) ( AVAILABLE ?auto_3180 ) ( SURFACE-AT ?auto_3175 ?auto_3181 ) ( ON ?auto_3175 ?auto_3182 ) ( CLEAR ?auto_3175 ) ( not ( = ?auto_3175 ?auto_3182 ) ) ( not ( = ?auto_3176 ?auto_3182 ) ) ( not ( = ?auto_3177 ?auto_3182 ) ) ( not ( = ?auto_3184 ?auto_3182 ) ) ( TRUCK-AT ?auto_3178 ?auto_3183 ) )
    :subtasks
    ( ( !DRIVE ?auto_3178 ?auto_3183 ?auto_3181 )
      ( MAKE-2CRATE ?auto_3177 ?auto_3175 ?auto_3176 )
      ( MAKE-1CRATE-VERIFY ?auto_3175 ?auto_3176 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3185 - SURFACE
      ?auto_3186 - SURFACE
      ?auto_3187 - SURFACE
    )
    :vars
    (
      ?auto_3191 - HOIST
      ?auto_3190 - PLACE
      ?auto_3193 - PLACE
      ?auto_3189 - HOIST
      ?auto_3188 - SURFACE
      ?auto_3194 - SURFACE
      ?auto_3192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3191 ?auto_3190 ) ( IS-CRATE ?auto_3187 ) ( not ( = ?auto_3186 ?auto_3187 ) ) ( not ( = ?auto_3185 ?auto_3186 ) ) ( not ( = ?auto_3185 ?auto_3187 ) ) ( not ( = ?auto_3193 ?auto_3190 ) ) ( HOIST-AT ?auto_3189 ?auto_3193 ) ( not ( = ?auto_3191 ?auto_3189 ) ) ( SURFACE-AT ?auto_3187 ?auto_3193 ) ( ON ?auto_3187 ?auto_3188 ) ( CLEAR ?auto_3187 ) ( not ( = ?auto_3186 ?auto_3188 ) ) ( not ( = ?auto_3187 ?auto_3188 ) ) ( not ( = ?auto_3185 ?auto_3188 ) ) ( SURFACE-AT ?auto_3185 ?auto_3190 ) ( CLEAR ?auto_3185 ) ( IS-CRATE ?auto_3186 ) ( AVAILABLE ?auto_3191 ) ( AVAILABLE ?auto_3189 ) ( SURFACE-AT ?auto_3186 ?auto_3193 ) ( ON ?auto_3186 ?auto_3194 ) ( CLEAR ?auto_3186 ) ( not ( = ?auto_3186 ?auto_3194 ) ) ( not ( = ?auto_3187 ?auto_3194 ) ) ( not ( = ?auto_3185 ?auto_3194 ) ) ( not ( = ?auto_3188 ?auto_3194 ) ) ( TRUCK-AT ?auto_3192 ?auto_3190 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3186 ?auto_3187 )
      ( MAKE-2CRATE-VERIFY ?auto_3185 ?auto_3186 ?auto_3187 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3204 - SURFACE
      ?auto_3205 - SURFACE
    )
    :vars
    (
      ?auto_3206 - HOIST
      ?auto_3207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3206 ?auto_3207 ) ( SURFACE-AT ?auto_3204 ?auto_3207 ) ( CLEAR ?auto_3204 ) ( LIFTING ?auto_3206 ?auto_3205 ) ( IS-CRATE ?auto_3205 ) ( not ( = ?auto_3204 ?auto_3205 ) ) )
    :subtasks
    ( ( !DROP ?auto_3206 ?auto_3205 ?auto_3204 ?auto_3207 )
      ( MAKE-1CRATE-VERIFY ?auto_3204 ?auto_3205 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3208 - SURFACE
      ?auto_3209 - SURFACE
      ?auto_3210 - SURFACE
    )
    :vars
    (
      ?auto_3211 - HOIST
      ?auto_3212 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3211 ?auto_3212 ) ( SURFACE-AT ?auto_3209 ?auto_3212 ) ( CLEAR ?auto_3209 ) ( LIFTING ?auto_3211 ?auto_3210 ) ( IS-CRATE ?auto_3210 ) ( not ( = ?auto_3209 ?auto_3210 ) ) ( ON ?auto_3209 ?auto_3208 ) ( not ( = ?auto_3208 ?auto_3209 ) ) ( not ( = ?auto_3208 ?auto_3210 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3209 ?auto_3210 )
      ( MAKE-2CRATE-VERIFY ?auto_3208 ?auto_3209 ?auto_3210 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3213 - SURFACE
      ?auto_3214 - SURFACE
      ?auto_3215 - SURFACE
      ?auto_3216 - SURFACE
    )
    :vars
    (
      ?auto_3217 - HOIST
      ?auto_3218 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3217 ?auto_3218 ) ( SURFACE-AT ?auto_3215 ?auto_3218 ) ( CLEAR ?auto_3215 ) ( LIFTING ?auto_3217 ?auto_3216 ) ( IS-CRATE ?auto_3216 ) ( not ( = ?auto_3215 ?auto_3216 ) ) ( ON ?auto_3214 ?auto_3213 ) ( ON ?auto_3215 ?auto_3214 ) ( not ( = ?auto_3213 ?auto_3214 ) ) ( not ( = ?auto_3213 ?auto_3215 ) ) ( not ( = ?auto_3213 ?auto_3216 ) ) ( not ( = ?auto_3214 ?auto_3215 ) ) ( not ( = ?auto_3214 ?auto_3216 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3215 ?auto_3216 )
      ( MAKE-3CRATE-VERIFY ?auto_3213 ?auto_3214 ?auto_3215 ?auto_3216 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3219 - SURFACE
      ?auto_3220 - SURFACE
    )
    :vars
    (
      ?auto_3221 - HOIST
      ?auto_3222 - PLACE
      ?auto_3223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3221 ?auto_3222 ) ( SURFACE-AT ?auto_3219 ?auto_3222 ) ( CLEAR ?auto_3219 ) ( IS-CRATE ?auto_3220 ) ( not ( = ?auto_3219 ?auto_3220 ) ) ( TRUCK-AT ?auto_3223 ?auto_3222 ) ( AVAILABLE ?auto_3221 ) ( IN ?auto_3220 ?auto_3223 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3221 ?auto_3220 ?auto_3223 ?auto_3222 )
      ( MAKE-1CRATE ?auto_3219 ?auto_3220 )
      ( MAKE-1CRATE-VERIFY ?auto_3219 ?auto_3220 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3224 - SURFACE
      ?auto_3225 - SURFACE
      ?auto_3226 - SURFACE
    )
    :vars
    (
      ?auto_3227 - HOIST
      ?auto_3228 - PLACE
      ?auto_3229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3227 ?auto_3228 ) ( SURFACE-AT ?auto_3225 ?auto_3228 ) ( CLEAR ?auto_3225 ) ( IS-CRATE ?auto_3226 ) ( not ( = ?auto_3225 ?auto_3226 ) ) ( TRUCK-AT ?auto_3229 ?auto_3228 ) ( AVAILABLE ?auto_3227 ) ( IN ?auto_3226 ?auto_3229 ) ( ON ?auto_3225 ?auto_3224 ) ( not ( = ?auto_3224 ?auto_3225 ) ) ( not ( = ?auto_3224 ?auto_3226 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3225 ?auto_3226 )
      ( MAKE-2CRATE-VERIFY ?auto_3224 ?auto_3225 ?auto_3226 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3230 - SURFACE
      ?auto_3231 - SURFACE
      ?auto_3232 - SURFACE
      ?auto_3233 - SURFACE
    )
    :vars
    (
      ?auto_3235 - HOIST
      ?auto_3236 - PLACE
      ?auto_3234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3235 ?auto_3236 ) ( SURFACE-AT ?auto_3232 ?auto_3236 ) ( CLEAR ?auto_3232 ) ( IS-CRATE ?auto_3233 ) ( not ( = ?auto_3232 ?auto_3233 ) ) ( TRUCK-AT ?auto_3234 ?auto_3236 ) ( AVAILABLE ?auto_3235 ) ( IN ?auto_3233 ?auto_3234 ) ( ON ?auto_3232 ?auto_3231 ) ( not ( = ?auto_3231 ?auto_3232 ) ) ( not ( = ?auto_3231 ?auto_3233 ) ) ( ON ?auto_3231 ?auto_3230 ) ( not ( = ?auto_3230 ?auto_3231 ) ) ( not ( = ?auto_3230 ?auto_3232 ) ) ( not ( = ?auto_3230 ?auto_3233 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3231 ?auto_3232 ?auto_3233 )
      ( MAKE-3CRATE-VERIFY ?auto_3230 ?auto_3231 ?auto_3232 ?auto_3233 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3237 - SURFACE
      ?auto_3238 - SURFACE
    )
    :vars
    (
      ?auto_3240 - HOIST
      ?auto_3242 - PLACE
      ?auto_3239 - TRUCK
      ?auto_3241 - SURFACE
      ?auto_3243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3240 ?auto_3242 ) ( SURFACE-AT ?auto_3237 ?auto_3242 ) ( CLEAR ?auto_3237 ) ( IS-CRATE ?auto_3238 ) ( not ( = ?auto_3237 ?auto_3238 ) ) ( AVAILABLE ?auto_3240 ) ( IN ?auto_3238 ?auto_3239 ) ( ON ?auto_3237 ?auto_3241 ) ( not ( = ?auto_3241 ?auto_3237 ) ) ( not ( = ?auto_3241 ?auto_3238 ) ) ( TRUCK-AT ?auto_3239 ?auto_3243 ) ( not ( = ?auto_3243 ?auto_3242 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3239 ?auto_3243 ?auto_3242 )
      ( MAKE-2CRATE ?auto_3241 ?auto_3237 ?auto_3238 )
      ( MAKE-1CRATE-VERIFY ?auto_3237 ?auto_3238 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3244 - SURFACE
      ?auto_3245 - SURFACE
      ?auto_3246 - SURFACE
    )
    :vars
    (
      ?auto_3247 - HOIST
      ?auto_3250 - PLACE
      ?auto_3249 - TRUCK
      ?auto_3248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3247 ?auto_3250 ) ( SURFACE-AT ?auto_3245 ?auto_3250 ) ( CLEAR ?auto_3245 ) ( IS-CRATE ?auto_3246 ) ( not ( = ?auto_3245 ?auto_3246 ) ) ( AVAILABLE ?auto_3247 ) ( IN ?auto_3246 ?auto_3249 ) ( ON ?auto_3245 ?auto_3244 ) ( not ( = ?auto_3244 ?auto_3245 ) ) ( not ( = ?auto_3244 ?auto_3246 ) ) ( TRUCK-AT ?auto_3249 ?auto_3248 ) ( not ( = ?auto_3248 ?auto_3250 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3245 ?auto_3246 )
      ( MAKE-2CRATE-VERIFY ?auto_3244 ?auto_3245 ?auto_3246 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3251 - SURFACE
      ?auto_3252 - SURFACE
      ?auto_3253 - SURFACE
      ?auto_3254 - SURFACE
    )
    :vars
    (
      ?auto_3258 - HOIST
      ?auto_3257 - PLACE
      ?auto_3256 - TRUCK
      ?auto_3255 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3258 ?auto_3257 ) ( SURFACE-AT ?auto_3253 ?auto_3257 ) ( CLEAR ?auto_3253 ) ( IS-CRATE ?auto_3254 ) ( not ( = ?auto_3253 ?auto_3254 ) ) ( AVAILABLE ?auto_3258 ) ( IN ?auto_3254 ?auto_3256 ) ( ON ?auto_3253 ?auto_3252 ) ( not ( = ?auto_3252 ?auto_3253 ) ) ( not ( = ?auto_3252 ?auto_3254 ) ) ( TRUCK-AT ?auto_3256 ?auto_3255 ) ( not ( = ?auto_3255 ?auto_3257 ) ) ( ON ?auto_3252 ?auto_3251 ) ( not ( = ?auto_3251 ?auto_3252 ) ) ( not ( = ?auto_3251 ?auto_3253 ) ) ( not ( = ?auto_3251 ?auto_3254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3252 ?auto_3253 ?auto_3254 )
      ( MAKE-3CRATE-VERIFY ?auto_3251 ?auto_3252 ?auto_3253 ?auto_3254 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3259 - SURFACE
      ?auto_3260 - SURFACE
    )
    :vars
    (
      ?auto_3265 - HOIST
      ?auto_3264 - PLACE
      ?auto_3263 - SURFACE
      ?auto_3262 - TRUCK
      ?auto_3261 - PLACE
      ?auto_3266 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3265 ?auto_3264 ) ( SURFACE-AT ?auto_3259 ?auto_3264 ) ( CLEAR ?auto_3259 ) ( IS-CRATE ?auto_3260 ) ( not ( = ?auto_3259 ?auto_3260 ) ) ( AVAILABLE ?auto_3265 ) ( ON ?auto_3259 ?auto_3263 ) ( not ( = ?auto_3263 ?auto_3259 ) ) ( not ( = ?auto_3263 ?auto_3260 ) ) ( TRUCK-AT ?auto_3262 ?auto_3261 ) ( not ( = ?auto_3261 ?auto_3264 ) ) ( HOIST-AT ?auto_3266 ?auto_3261 ) ( LIFTING ?auto_3266 ?auto_3260 ) ( not ( = ?auto_3265 ?auto_3266 ) ) )
    :subtasks
    ( ( !LOAD ?auto_3266 ?auto_3260 ?auto_3262 ?auto_3261 )
      ( MAKE-2CRATE ?auto_3263 ?auto_3259 ?auto_3260 )
      ( MAKE-1CRATE-VERIFY ?auto_3259 ?auto_3260 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3267 - SURFACE
      ?auto_3268 - SURFACE
      ?auto_3269 - SURFACE
    )
    :vars
    (
      ?auto_3274 - HOIST
      ?auto_3270 - PLACE
      ?auto_3271 - TRUCK
      ?auto_3272 - PLACE
      ?auto_3273 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3274 ?auto_3270 ) ( SURFACE-AT ?auto_3268 ?auto_3270 ) ( CLEAR ?auto_3268 ) ( IS-CRATE ?auto_3269 ) ( not ( = ?auto_3268 ?auto_3269 ) ) ( AVAILABLE ?auto_3274 ) ( ON ?auto_3268 ?auto_3267 ) ( not ( = ?auto_3267 ?auto_3268 ) ) ( not ( = ?auto_3267 ?auto_3269 ) ) ( TRUCK-AT ?auto_3271 ?auto_3272 ) ( not ( = ?auto_3272 ?auto_3270 ) ) ( HOIST-AT ?auto_3273 ?auto_3272 ) ( LIFTING ?auto_3273 ?auto_3269 ) ( not ( = ?auto_3274 ?auto_3273 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3268 ?auto_3269 )
      ( MAKE-2CRATE-VERIFY ?auto_3267 ?auto_3268 ?auto_3269 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3275 - SURFACE
      ?auto_3276 - SURFACE
      ?auto_3277 - SURFACE
      ?auto_3278 - SURFACE
    )
    :vars
    (
      ?auto_3281 - HOIST
      ?auto_3280 - PLACE
      ?auto_3279 - TRUCK
      ?auto_3283 - PLACE
      ?auto_3282 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_3281 ?auto_3280 ) ( SURFACE-AT ?auto_3277 ?auto_3280 ) ( CLEAR ?auto_3277 ) ( IS-CRATE ?auto_3278 ) ( not ( = ?auto_3277 ?auto_3278 ) ) ( AVAILABLE ?auto_3281 ) ( ON ?auto_3277 ?auto_3276 ) ( not ( = ?auto_3276 ?auto_3277 ) ) ( not ( = ?auto_3276 ?auto_3278 ) ) ( TRUCK-AT ?auto_3279 ?auto_3283 ) ( not ( = ?auto_3283 ?auto_3280 ) ) ( HOIST-AT ?auto_3282 ?auto_3283 ) ( LIFTING ?auto_3282 ?auto_3278 ) ( not ( = ?auto_3281 ?auto_3282 ) ) ( ON ?auto_3276 ?auto_3275 ) ( not ( = ?auto_3275 ?auto_3276 ) ) ( not ( = ?auto_3275 ?auto_3277 ) ) ( not ( = ?auto_3275 ?auto_3278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3276 ?auto_3277 ?auto_3278 )
      ( MAKE-3CRATE-VERIFY ?auto_3275 ?auto_3276 ?auto_3277 ?auto_3278 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3284 - SURFACE
      ?auto_3285 - SURFACE
    )
    :vars
    (
      ?auto_3289 - HOIST
      ?auto_3288 - PLACE
      ?auto_3287 - SURFACE
      ?auto_3286 - TRUCK
      ?auto_3291 - PLACE
      ?auto_3290 - HOIST
      ?auto_3292 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3289 ?auto_3288 ) ( SURFACE-AT ?auto_3284 ?auto_3288 ) ( CLEAR ?auto_3284 ) ( IS-CRATE ?auto_3285 ) ( not ( = ?auto_3284 ?auto_3285 ) ) ( AVAILABLE ?auto_3289 ) ( ON ?auto_3284 ?auto_3287 ) ( not ( = ?auto_3287 ?auto_3284 ) ) ( not ( = ?auto_3287 ?auto_3285 ) ) ( TRUCK-AT ?auto_3286 ?auto_3291 ) ( not ( = ?auto_3291 ?auto_3288 ) ) ( HOIST-AT ?auto_3290 ?auto_3291 ) ( not ( = ?auto_3289 ?auto_3290 ) ) ( AVAILABLE ?auto_3290 ) ( SURFACE-AT ?auto_3285 ?auto_3291 ) ( ON ?auto_3285 ?auto_3292 ) ( CLEAR ?auto_3285 ) ( not ( = ?auto_3284 ?auto_3292 ) ) ( not ( = ?auto_3285 ?auto_3292 ) ) ( not ( = ?auto_3287 ?auto_3292 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3290 ?auto_3285 ?auto_3292 ?auto_3291 )
      ( MAKE-2CRATE ?auto_3287 ?auto_3284 ?auto_3285 )
      ( MAKE-1CRATE-VERIFY ?auto_3284 ?auto_3285 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3293 - SURFACE
      ?auto_3294 - SURFACE
      ?auto_3295 - SURFACE
    )
    :vars
    (
      ?auto_3296 - HOIST
      ?auto_3299 - PLACE
      ?auto_3300 - TRUCK
      ?auto_3297 - PLACE
      ?auto_3301 - HOIST
      ?auto_3298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3296 ?auto_3299 ) ( SURFACE-AT ?auto_3294 ?auto_3299 ) ( CLEAR ?auto_3294 ) ( IS-CRATE ?auto_3295 ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( AVAILABLE ?auto_3296 ) ( ON ?auto_3294 ?auto_3293 ) ( not ( = ?auto_3293 ?auto_3294 ) ) ( not ( = ?auto_3293 ?auto_3295 ) ) ( TRUCK-AT ?auto_3300 ?auto_3297 ) ( not ( = ?auto_3297 ?auto_3299 ) ) ( HOIST-AT ?auto_3301 ?auto_3297 ) ( not ( = ?auto_3296 ?auto_3301 ) ) ( AVAILABLE ?auto_3301 ) ( SURFACE-AT ?auto_3295 ?auto_3297 ) ( ON ?auto_3295 ?auto_3298 ) ( CLEAR ?auto_3295 ) ( not ( = ?auto_3294 ?auto_3298 ) ) ( not ( = ?auto_3295 ?auto_3298 ) ) ( not ( = ?auto_3293 ?auto_3298 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3294 ?auto_3295 )
      ( MAKE-2CRATE-VERIFY ?auto_3293 ?auto_3294 ?auto_3295 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3302 - SURFACE
      ?auto_3303 - SURFACE
      ?auto_3304 - SURFACE
      ?auto_3305 - SURFACE
    )
    :vars
    (
      ?auto_3310 - HOIST
      ?auto_3306 - PLACE
      ?auto_3308 - TRUCK
      ?auto_3307 - PLACE
      ?auto_3309 - HOIST
      ?auto_3311 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3310 ?auto_3306 ) ( SURFACE-AT ?auto_3304 ?auto_3306 ) ( CLEAR ?auto_3304 ) ( IS-CRATE ?auto_3305 ) ( not ( = ?auto_3304 ?auto_3305 ) ) ( AVAILABLE ?auto_3310 ) ( ON ?auto_3304 ?auto_3303 ) ( not ( = ?auto_3303 ?auto_3304 ) ) ( not ( = ?auto_3303 ?auto_3305 ) ) ( TRUCK-AT ?auto_3308 ?auto_3307 ) ( not ( = ?auto_3307 ?auto_3306 ) ) ( HOIST-AT ?auto_3309 ?auto_3307 ) ( not ( = ?auto_3310 ?auto_3309 ) ) ( AVAILABLE ?auto_3309 ) ( SURFACE-AT ?auto_3305 ?auto_3307 ) ( ON ?auto_3305 ?auto_3311 ) ( CLEAR ?auto_3305 ) ( not ( = ?auto_3304 ?auto_3311 ) ) ( not ( = ?auto_3305 ?auto_3311 ) ) ( not ( = ?auto_3303 ?auto_3311 ) ) ( ON ?auto_3303 ?auto_3302 ) ( not ( = ?auto_3302 ?auto_3303 ) ) ( not ( = ?auto_3302 ?auto_3304 ) ) ( not ( = ?auto_3302 ?auto_3305 ) ) ( not ( = ?auto_3302 ?auto_3311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3303 ?auto_3304 ?auto_3305 )
      ( MAKE-3CRATE-VERIFY ?auto_3302 ?auto_3303 ?auto_3304 ?auto_3305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3312 - SURFACE
      ?auto_3313 - SURFACE
    )
    :vars
    (
      ?auto_3319 - HOIST
      ?auto_3314 - PLACE
      ?auto_3315 - SURFACE
      ?auto_3316 - PLACE
      ?auto_3318 - HOIST
      ?auto_3320 - SURFACE
      ?auto_3317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3319 ?auto_3314 ) ( SURFACE-AT ?auto_3312 ?auto_3314 ) ( CLEAR ?auto_3312 ) ( IS-CRATE ?auto_3313 ) ( not ( = ?auto_3312 ?auto_3313 ) ) ( AVAILABLE ?auto_3319 ) ( ON ?auto_3312 ?auto_3315 ) ( not ( = ?auto_3315 ?auto_3312 ) ) ( not ( = ?auto_3315 ?auto_3313 ) ) ( not ( = ?auto_3316 ?auto_3314 ) ) ( HOIST-AT ?auto_3318 ?auto_3316 ) ( not ( = ?auto_3319 ?auto_3318 ) ) ( AVAILABLE ?auto_3318 ) ( SURFACE-AT ?auto_3313 ?auto_3316 ) ( ON ?auto_3313 ?auto_3320 ) ( CLEAR ?auto_3313 ) ( not ( = ?auto_3312 ?auto_3320 ) ) ( not ( = ?auto_3313 ?auto_3320 ) ) ( not ( = ?auto_3315 ?auto_3320 ) ) ( TRUCK-AT ?auto_3317 ?auto_3314 ) )
    :subtasks
    ( ( !DRIVE ?auto_3317 ?auto_3314 ?auto_3316 )
      ( MAKE-2CRATE ?auto_3315 ?auto_3312 ?auto_3313 )
      ( MAKE-1CRATE-VERIFY ?auto_3312 ?auto_3313 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3321 - SURFACE
      ?auto_3322 - SURFACE
      ?auto_3323 - SURFACE
    )
    :vars
    (
      ?auto_3327 - HOIST
      ?auto_3325 - PLACE
      ?auto_3326 - PLACE
      ?auto_3324 - HOIST
      ?auto_3328 - SURFACE
      ?auto_3329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3327 ?auto_3325 ) ( SURFACE-AT ?auto_3322 ?auto_3325 ) ( CLEAR ?auto_3322 ) ( IS-CRATE ?auto_3323 ) ( not ( = ?auto_3322 ?auto_3323 ) ) ( AVAILABLE ?auto_3327 ) ( ON ?auto_3322 ?auto_3321 ) ( not ( = ?auto_3321 ?auto_3322 ) ) ( not ( = ?auto_3321 ?auto_3323 ) ) ( not ( = ?auto_3326 ?auto_3325 ) ) ( HOIST-AT ?auto_3324 ?auto_3326 ) ( not ( = ?auto_3327 ?auto_3324 ) ) ( AVAILABLE ?auto_3324 ) ( SURFACE-AT ?auto_3323 ?auto_3326 ) ( ON ?auto_3323 ?auto_3328 ) ( CLEAR ?auto_3323 ) ( not ( = ?auto_3322 ?auto_3328 ) ) ( not ( = ?auto_3323 ?auto_3328 ) ) ( not ( = ?auto_3321 ?auto_3328 ) ) ( TRUCK-AT ?auto_3329 ?auto_3325 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3322 ?auto_3323 )
      ( MAKE-2CRATE-VERIFY ?auto_3321 ?auto_3322 ?auto_3323 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3330 - SURFACE
      ?auto_3331 - SURFACE
      ?auto_3332 - SURFACE
      ?auto_3333 - SURFACE
    )
    :vars
    (
      ?auto_3339 - HOIST
      ?auto_3335 - PLACE
      ?auto_3337 - PLACE
      ?auto_3338 - HOIST
      ?auto_3334 - SURFACE
      ?auto_3336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3339 ?auto_3335 ) ( SURFACE-AT ?auto_3332 ?auto_3335 ) ( CLEAR ?auto_3332 ) ( IS-CRATE ?auto_3333 ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( AVAILABLE ?auto_3339 ) ( ON ?auto_3332 ?auto_3331 ) ( not ( = ?auto_3331 ?auto_3332 ) ) ( not ( = ?auto_3331 ?auto_3333 ) ) ( not ( = ?auto_3337 ?auto_3335 ) ) ( HOIST-AT ?auto_3338 ?auto_3337 ) ( not ( = ?auto_3339 ?auto_3338 ) ) ( AVAILABLE ?auto_3338 ) ( SURFACE-AT ?auto_3333 ?auto_3337 ) ( ON ?auto_3333 ?auto_3334 ) ( CLEAR ?auto_3333 ) ( not ( = ?auto_3332 ?auto_3334 ) ) ( not ( = ?auto_3333 ?auto_3334 ) ) ( not ( = ?auto_3331 ?auto_3334 ) ) ( TRUCK-AT ?auto_3336 ?auto_3335 ) ( ON ?auto_3331 ?auto_3330 ) ( not ( = ?auto_3330 ?auto_3331 ) ) ( not ( = ?auto_3330 ?auto_3332 ) ) ( not ( = ?auto_3330 ?auto_3333 ) ) ( not ( = ?auto_3330 ?auto_3334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3331 ?auto_3332 ?auto_3333 )
      ( MAKE-3CRATE-VERIFY ?auto_3330 ?auto_3331 ?auto_3332 ?auto_3333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3340 - SURFACE
      ?auto_3341 - SURFACE
    )
    :vars
    (
      ?auto_3348 - HOIST
      ?auto_3344 - PLACE
      ?auto_3342 - SURFACE
      ?auto_3346 - PLACE
      ?auto_3347 - HOIST
      ?auto_3343 - SURFACE
      ?auto_3345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3348 ?auto_3344 ) ( IS-CRATE ?auto_3341 ) ( not ( = ?auto_3340 ?auto_3341 ) ) ( not ( = ?auto_3342 ?auto_3340 ) ) ( not ( = ?auto_3342 ?auto_3341 ) ) ( not ( = ?auto_3346 ?auto_3344 ) ) ( HOIST-AT ?auto_3347 ?auto_3346 ) ( not ( = ?auto_3348 ?auto_3347 ) ) ( AVAILABLE ?auto_3347 ) ( SURFACE-AT ?auto_3341 ?auto_3346 ) ( ON ?auto_3341 ?auto_3343 ) ( CLEAR ?auto_3341 ) ( not ( = ?auto_3340 ?auto_3343 ) ) ( not ( = ?auto_3341 ?auto_3343 ) ) ( not ( = ?auto_3342 ?auto_3343 ) ) ( TRUCK-AT ?auto_3345 ?auto_3344 ) ( SURFACE-AT ?auto_3342 ?auto_3344 ) ( CLEAR ?auto_3342 ) ( LIFTING ?auto_3348 ?auto_3340 ) ( IS-CRATE ?auto_3340 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3342 ?auto_3340 )
      ( MAKE-2CRATE ?auto_3342 ?auto_3340 ?auto_3341 )
      ( MAKE-1CRATE-VERIFY ?auto_3340 ?auto_3341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3349 - SURFACE
      ?auto_3350 - SURFACE
      ?auto_3351 - SURFACE
    )
    :vars
    (
      ?auto_3353 - HOIST
      ?auto_3356 - PLACE
      ?auto_3354 - PLACE
      ?auto_3355 - HOIST
      ?auto_3352 - SURFACE
      ?auto_3357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3353 ?auto_3356 ) ( IS-CRATE ?auto_3351 ) ( not ( = ?auto_3350 ?auto_3351 ) ) ( not ( = ?auto_3349 ?auto_3350 ) ) ( not ( = ?auto_3349 ?auto_3351 ) ) ( not ( = ?auto_3354 ?auto_3356 ) ) ( HOIST-AT ?auto_3355 ?auto_3354 ) ( not ( = ?auto_3353 ?auto_3355 ) ) ( AVAILABLE ?auto_3355 ) ( SURFACE-AT ?auto_3351 ?auto_3354 ) ( ON ?auto_3351 ?auto_3352 ) ( CLEAR ?auto_3351 ) ( not ( = ?auto_3350 ?auto_3352 ) ) ( not ( = ?auto_3351 ?auto_3352 ) ) ( not ( = ?auto_3349 ?auto_3352 ) ) ( TRUCK-AT ?auto_3357 ?auto_3356 ) ( SURFACE-AT ?auto_3349 ?auto_3356 ) ( CLEAR ?auto_3349 ) ( LIFTING ?auto_3353 ?auto_3350 ) ( IS-CRATE ?auto_3350 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3350 ?auto_3351 )
      ( MAKE-2CRATE-VERIFY ?auto_3349 ?auto_3350 ?auto_3351 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3358 - SURFACE
      ?auto_3359 - SURFACE
      ?auto_3360 - SURFACE
      ?auto_3361 - SURFACE
    )
    :vars
    (
      ?auto_3366 - HOIST
      ?auto_3365 - PLACE
      ?auto_3362 - PLACE
      ?auto_3364 - HOIST
      ?auto_3363 - SURFACE
      ?auto_3367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3366 ?auto_3365 ) ( IS-CRATE ?auto_3361 ) ( not ( = ?auto_3360 ?auto_3361 ) ) ( not ( = ?auto_3359 ?auto_3360 ) ) ( not ( = ?auto_3359 ?auto_3361 ) ) ( not ( = ?auto_3362 ?auto_3365 ) ) ( HOIST-AT ?auto_3364 ?auto_3362 ) ( not ( = ?auto_3366 ?auto_3364 ) ) ( AVAILABLE ?auto_3364 ) ( SURFACE-AT ?auto_3361 ?auto_3362 ) ( ON ?auto_3361 ?auto_3363 ) ( CLEAR ?auto_3361 ) ( not ( = ?auto_3360 ?auto_3363 ) ) ( not ( = ?auto_3361 ?auto_3363 ) ) ( not ( = ?auto_3359 ?auto_3363 ) ) ( TRUCK-AT ?auto_3367 ?auto_3365 ) ( SURFACE-AT ?auto_3359 ?auto_3365 ) ( CLEAR ?auto_3359 ) ( LIFTING ?auto_3366 ?auto_3360 ) ( IS-CRATE ?auto_3360 ) ( ON ?auto_3359 ?auto_3358 ) ( not ( = ?auto_3358 ?auto_3359 ) ) ( not ( = ?auto_3358 ?auto_3360 ) ) ( not ( = ?auto_3358 ?auto_3361 ) ) ( not ( = ?auto_3358 ?auto_3363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3359 ?auto_3360 ?auto_3361 )
      ( MAKE-3CRATE-VERIFY ?auto_3358 ?auto_3359 ?auto_3360 ?auto_3361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3368 - SURFACE
      ?auto_3369 - SURFACE
    )
    :vars
    (
      ?auto_3375 - HOIST
      ?auto_3373 - PLACE
      ?auto_3374 - SURFACE
      ?auto_3370 - PLACE
      ?auto_3372 - HOIST
      ?auto_3371 - SURFACE
      ?auto_3376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3375 ?auto_3373 ) ( IS-CRATE ?auto_3369 ) ( not ( = ?auto_3368 ?auto_3369 ) ) ( not ( = ?auto_3374 ?auto_3368 ) ) ( not ( = ?auto_3374 ?auto_3369 ) ) ( not ( = ?auto_3370 ?auto_3373 ) ) ( HOIST-AT ?auto_3372 ?auto_3370 ) ( not ( = ?auto_3375 ?auto_3372 ) ) ( AVAILABLE ?auto_3372 ) ( SURFACE-AT ?auto_3369 ?auto_3370 ) ( ON ?auto_3369 ?auto_3371 ) ( CLEAR ?auto_3369 ) ( not ( = ?auto_3368 ?auto_3371 ) ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( not ( = ?auto_3374 ?auto_3371 ) ) ( TRUCK-AT ?auto_3376 ?auto_3373 ) ( SURFACE-AT ?auto_3374 ?auto_3373 ) ( CLEAR ?auto_3374 ) ( IS-CRATE ?auto_3368 ) ( AVAILABLE ?auto_3375 ) ( IN ?auto_3368 ?auto_3376 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3375 ?auto_3368 ?auto_3376 ?auto_3373 )
      ( MAKE-2CRATE ?auto_3374 ?auto_3368 ?auto_3369 )
      ( MAKE-1CRATE-VERIFY ?auto_3368 ?auto_3369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3377 - SURFACE
      ?auto_3378 - SURFACE
      ?auto_3379 - SURFACE
    )
    :vars
    (
      ?auto_3385 - HOIST
      ?auto_3384 - PLACE
      ?auto_3381 - PLACE
      ?auto_3383 - HOIST
      ?auto_3382 - SURFACE
      ?auto_3380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3385 ?auto_3384 ) ( IS-CRATE ?auto_3379 ) ( not ( = ?auto_3378 ?auto_3379 ) ) ( not ( = ?auto_3377 ?auto_3378 ) ) ( not ( = ?auto_3377 ?auto_3379 ) ) ( not ( = ?auto_3381 ?auto_3384 ) ) ( HOIST-AT ?auto_3383 ?auto_3381 ) ( not ( = ?auto_3385 ?auto_3383 ) ) ( AVAILABLE ?auto_3383 ) ( SURFACE-AT ?auto_3379 ?auto_3381 ) ( ON ?auto_3379 ?auto_3382 ) ( CLEAR ?auto_3379 ) ( not ( = ?auto_3378 ?auto_3382 ) ) ( not ( = ?auto_3379 ?auto_3382 ) ) ( not ( = ?auto_3377 ?auto_3382 ) ) ( TRUCK-AT ?auto_3380 ?auto_3384 ) ( SURFACE-AT ?auto_3377 ?auto_3384 ) ( CLEAR ?auto_3377 ) ( IS-CRATE ?auto_3378 ) ( AVAILABLE ?auto_3385 ) ( IN ?auto_3378 ?auto_3380 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3378 ?auto_3379 )
      ( MAKE-2CRATE-VERIFY ?auto_3377 ?auto_3378 ?auto_3379 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3386 - SURFACE
      ?auto_3387 - SURFACE
      ?auto_3388 - SURFACE
      ?auto_3389 - SURFACE
    )
    :vars
    (
      ?auto_3391 - HOIST
      ?auto_3395 - PLACE
      ?auto_3394 - PLACE
      ?auto_3392 - HOIST
      ?auto_3390 - SURFACE
      ?auto_3393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3391 ?auto_3395 ) ( IS-CRATE ?auto_3389 ) ( not ( = ?auto_3388 ?auto_3389 ) ) ( not ( = ?auto_3387 ?auto_3388 ) ) ( not ( = ?auto_3387 ?auto_3389 ) ) ( not ( = ?auto_3394 ?auto_3395 ) ) ( HOIST-AT ?auto_3392 ?auto_3394 ) ( not ( = ?auto_3391 ?auto_3392 ) ) ( AVAILABLE ?auto_3392 ) ( SURFACE-AT ?auto_3389 ?auto_3394 ) ( ON ?auto_3389 ?auto_3390 ) ( CLEAR ?auto_3389 ) ( not ( = ?auto_3388 ?auto_3390 ) ) ( not ( = ?auto_3389 ?auto_3390 ) ) ( not ( = ?auto_3387 ?auto_3390 ) ) ( TRUCK-AT ?auto_3393 ?auto_3395 ) ( SURFACE-AT ?auto_3387 ?auto_3395 ) ( CLEAR ?auto_3387 ) ( IS-CRATE ?auto_3388 ) ( AVAILABLE ?auto_3391 ) ( IN ?auto_3388 ?auto_3393 ) ( ON ?auto_3387 ?auto_3386 ) ( not ( = ?auto_3386 ?auto_3387 ) ) ( not ( = ?auto_3386 ?auto_3388 ) ) ( not ( = ?auto_3386 ?auto_3389 ) ) ( not ( = ?auto_3386 ?auto_3390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3387 ?auto_3388 ?auto_3389 )
      ( MAKE-3CRATE-VERIFY ?auto_3386 ?auto_3387 ?auto_3388 ?auto_3389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3396 - SURFACE
      ?auto_3397 - SURFACE
    )
    :vars
    (
      ?auto_3399 - HOIST
      ?auto_3404 - PLACE
      ?auto_3403 - SURFACE
      ?auto_3402 - PLACE
      ?auto_3400 - HOIST
      ?auto_3398 - SURFACE
      ?auto_3401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3399 ?auto_3404 ) ( IS-CRATE ?auto_3397 ) ( not ( = ?auto_3396 ?auto_3397 ) ) ( not ( = ?auto_3403 ?auto_3396 ) ) ( not ( = ?auto_3403 ?auto_3397 ) ) ( not ( = ?auto_3402 ?auto_3404 ) ) ( HOIST-AT ?auto_3400 ?auto_3402 ) ( not ( = ?auto_3399 ?auto_3400 ) ) ( AVAILABLE ?auto_3400 ) ( SURFACE-AT ?auto_3397 ?auto_3402 ) ( ON ?auto_3397 ?auto_3398 ) ( CLEAR ?auto_3397 ) ( not ( = ?auto_3396 ?auto_3398 ) ) ( not ( = ?auto_3397 ?auto_3398 ) ) ( not ( = ?auto_3403 ?auto_3398 ) ) ( SURFACE-AT ?auto_3403 ?auto_3404 ) ( CLEAR ?auto_3403 ) ( IS-CRATE ?auto_3396 ) ( AVAILABLE ?auto_3399 ) ( IN ?auto_3396 ?auto_3401 ) ( TRUCK-AT ?auto_3401 ?auto_3402 ) )
    :subtasks
    ( ( !DRIVE ?auto_3401 ?auto_3402 ?auto_3404 )
      ( MAKE-2CRATE ?auto_3403 ?auto_3396 ?auto_3397 )
      ( MAKE-1CRATE-VERIFY ?auto_3396 ?auto_3397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3405 - SURFACE
      ?auto_3406 - SURFACE
      ?auto_3407 - SURFACE
    )
    :vars
    (
      ?auto_3408 - HOIST
      ?auto_3412 - PLACE
      ?auto_3411 - PLACE
      ?auto_3409 - HOIST
      ?auto_3410 - SURFACE
      ?auto_3413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3408 ?auto_3412 ) ( IS-CRATE ?auto_3407 ) ( not ( = ?auto_3406 ?auto_3407 ) ) ( not ( = ?auto_3405 ?auto_3406 ) ) ( not ( = ?auto_3405 ?auto_3407 ) ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( HOIST-AT ?auto_3409 ?auto_3411 ) ( not ( = ?auto_3408 ?auto_3409 ) ) ( AVAILABLE ?auto_3409 ) ( SURFACE-AT ?auto_3407 ?auto_3411 ) ( ON ?auto_3407 ?auto_3410 ) ( CLEAR ?auto_3407 ) ( not ( = ?auto_3406 ?auto_3410 ) ) ( not ( = ?auto_3407 ?auto_3410 ) ) ( not ( = ?auto_3405 ?auto_3410 ) ) ( SURFACE-AT ?auto_3405 ?auto_3412 ) ( CLEAR ?auto_3405 ) ( IS-CRATE ?auto_3406 ) ( AVAILABLE ?auto_3408 ) ( IN ?auto_3406 ?auto_3413 ) ( TRUCK-AT ?auto_3413 ?auto_3411 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3406 ?auto_3407 )
      ( MAKE-2CRATE-VERIFY ?auto_3405 ?auto_3406 ?auto_3407 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3414 - SURFACE
      ?auto_3415 - SURFACE
      ?auto_3416 - SURFACE
      ?auto_3417 - SURFACE
    )
    :vars
    (
      ?auto_3422 - HOIST
      ?auto_3421 - PLACE
      ?auto_3420 - PLACE
      ?auto_3418 - HOIST
      ?auto_3423 - SURFACE
      ?auto_3419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3422 ?auto_3421 ) ( IS-CRATE ?auto_3417 ) ( not ( = ?auto_3416 ?auto_3417 ) ) ( not ( = ?auto_3415 ?auto_3416 ) ) ( not ( = ?auto_3415 ?auto_3417 ) ) ( not ( = ?auto_3420 ?auto_3421 ) ) ( HOIST-AT ?auto_3418 ?auto_3420 ) ( not ( = ?auto_3422 ?auto_3418 ) ) ( AVAILABLE ?auto_3418 ) ( SURFACE-AT ?auto_3417 ?auto_3420 ) ( ON ?auto_3417 ?auto_3423 ) ( CLEAR ?auto_3417 ) ( not ( = ?auto_3416 ?auto_3423 ) ) ( not ( = ?auto_3417 ?auto_3423 ) ) ( not ( = ?auto_3415 ?auto_3423 ) ) ( SURFACE-AT ?auto_3415 ?auto_3421 ) ( CLEAR ?auto_3415 ) ( IS-CRATE ?auto_3416 ) ( AVAILABLE ?auto_3422 ) ( IN ?auto_3416 ?auto_3419 ) ( TRUCK-AT ?auto_3419 ?auto_3420 ) ( ON ?auto_3415 ?auto_3414 ) ( not ( = ?auto_3414 ?auto_3415 ) ) ( not ( = ?auto_3414 ?auto_3416 ) ) ( not ( = ?auto_3414 ?auto_3417 ) ) ( not ( = ?auto_3414 ?auto_3423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3415 ?auto_3416 ?auto_3417 )
      ( MAKE-3CRATE-VERIFY ?auto_3414 ?auto_3415 ?auto_3416 ?auto_3417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3424 - SURFACE
      ?auto_3425 - SURFACE
    )
    :vars
    (
      ?auto_3430 - HOIST
      ?auto_3429 - PLACE
      ?auto_3432 - SURFACE
      ?auto_3428 - PLACE
      ?auto_3426 - HOIST
      ?auto_3431 - SURFACE
      ?auto_3427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3430 ?auto_3429 ) ( IS-CRATE ?auto_3425 ) ( not ( = ?auto_3424 ?auto_3425 ) ) ( not ( = ?auto_3432 ?auto_3424 ) ) ( not ( = ?auto_3432 ?auto_3425 ) ) ( not ( = ?auto_3428 ?auto_3429 ) ) ( HOIST-AT ?auto_3426 ?auto_3428 ) ( not ( = ?auto_3430 ?auto_3426 ) ) ( SURFACE-AT ?auto_3425 ?auto_3428 ) ( ON ?auto_3425 ?auto_3431 ) ( CLEAR ?auto_3425 ) ( not ( = ?auto_3424 ?auto_3431 ) ) ( not ( = ?auto_3425 ?auto_3431 ) ) ( not ( = ?auto_3432 ?auto_3431 ) ) ( SURFACE-AT ?auto_3432 ?auto_3429 ) ( CLEAR ?auto_3432 ) ( IS-CRATE ?auto_3424 ) ( AVAILABLE ?auto_3430 ) ( TRUCK-AT ?auto_3427 ?auto_3428 ) ( LIFTING ?auto_3426 ?auto_3424 ) )
    :subtasks
    ( ( !LOAD ?auto_3426 ?auto_3424 ?auto_3427 ?auto_3428 )
      ( MAKE-2CRATE ?auto_3432 ?auto_3424 ?auto_3425 )
      ( MAKE-1CRATE-VERIFY ?auto_3424 ?auto_3425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3433 - SURFACE
      ?auto_3434 - SURFACE
      ?auto_3435 - SURFACE
    )
    :vars
    (
      ?auto_3438 - HOIST
      ?auto_3441 - PLACE
      ?auto_3436 - PLACE
      ?auto_3439 - HOIST
      ?auto_3437 - SURFACE
      ?auto_3440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3438 ?auto_3441 ) ( IS-CRATE ?auto_3435 ) ( not ( = ?auto_3434 ?auto_3435 ) ) ( not ( = ?auto_3433 ?auto_3434 ) ) ( not ( = ?auto_3433 ?auto_3435 ) ) ( not ( = ?auto_3436 ?auto_3441 ) ) ( HOIST-AT ?auto_3439 ?auto_3436 ) ( not ( = ?auto_3438 ?auto_3439 ) ) ( SURFACE-AT ?auto_3435 ?auto_3436 ) ( ON ?auto_3435 ?auto_3437 ) ( CLEAR ?auto_3435 ) ( not ( = ?auto_3434 ?auto_3437 ) ) ( not ( = ?auto_3435 ?auto_3437 ) ) ( not ( = ?auto_3433 ?auto_3437 ) ) ( SURFACE-AT ?auto_3433 ?auto_3441 ) ( CLEAR ?auto_3433 ) ( IS-CRATE ?auto_3434 ) ( AVAILABLE ?auto_3438 ) ( TRUCK-AT ?auto_3440 ?auto_3436 ) ( LIFTING ?auto_3439 ?auto_3434 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3434 ?auto_3435 )
      ( MAKE-2CRATE-VERIFY ?auto_3433 ?auto_3434 ?auto_3435 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3442 - SURFACE
      ?auto_3443 - SURFACE
      ?auto_3444 - SURFACE
      ?auto_3445 - SURFACE
    )
    :vars
    (
      ?auto_3447 - HOIST
      ?auto_3449 - PLACE
      ?auto_3446 - PLACE
      ?auto_3448 - HOIST
      ?auto_3450 - SURFACE
      ?auto_3451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3447 ?auto_3449 ) ( IS-CRATE ?auto_3445 ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( not ( = ?auto_3443 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3445 ) ) ( not ( = ?auto_3446 ?auto_3449 ) ) ( HOIST-AT ?auto_3448 ?auto_3446 ) ( not ( = ?auto_3447 ?auto_3448 ) ) ( SURFACE-AT ?auto_3445 ?auto_3446 ) ( ON ?auto_3445 ?auto_3450 ) ( CLEAR ?auto_3445 ) ( not ( = ?auto_3444 ?auto_3450 ) ) ( not ( = ?auto_3445 ?auto_3450 ) ) ( not ( = ?auto_3443 ?auto_3450 ) ) ( SURFACE-AT ?auto_3443 ?auto_3449 ) ( CLEAR ?auto_3443 ) ( IS-CRATE ?auto_3444 ) ( AVAILABLE ?auto_3447 ) ( TRUCK-AT ?auto_3451 ?auto_3446 ) ( LIFTING ?auto_3448 ?auto_3444 ) ( ON ?auto_3443 ?auto_3442 ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( not ( = ?auto_3442 ?auto_3445 ) ) ( not ( = ?auto_3442 ?auto_3450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3443 ?auto_3444 ?auto_3445 )
      ( MAKE-3CRATE-VERIFY ?auto_3442 ?auto_3443 ?auto_3444 ?auto_3445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3452 - SURFACE
      ?auto_3453 - SURFACE
    )
    :vars
    (
      ?auto_3455 - HOIST
      ?auto_3457 - PLACE
      ?auto_3458 - SURFACE
      ?auto_3454 - PLACE
      ?auto_3456 - HOIST
      ?auto_3459 - SURFACE
      ?auto_3460 - TRUCK
      ?auto_3461 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3455 ?auto_3457 ) ( IS-CRATE ?auto_3453 ) ( not ( = ?auto_3452 ?auto_3453 ) ) ( not ( = ?auto_3458 ?auto_3452 ) ) ( not ( = ?auto_3458 ?auto_3453 ) ) ( not ( = ?auto_3454 ?auto_3457 ) ) ( HOIST-AT ?auto_3456 ?auto_3454 ) ( not ( = ?auto_3455 ?auto_3456 ) ) ( SURFACE-AT ?auto_3453 ?auto_3454 ) ( ON ?auto_3453 ?auto_3459 ) ( CLEAR ?auto_3453 ) ( not ( = ?auto_3452 ?auto_3459 ) ) ( not ( = ?auto_3453 ?auto_3459 ) ) ( not ( = ?auto_3458 ?auto_3459 ) ) ( SURFACE-AT ?auto_3458 ?auto_3457 ) ( CLEAR ?auto_3458 ) ( IS-CRATE ?auto_3452 ) ( AVAILABLE ?auto_3455 ) ( TRUCK-AT ?auto_3460 ?auto_3454 ) ( AVAILABLE ?auto_3456 ) ( SURFACE-AT ?auto_3452 ?auto_3454 ) ( ON ?auto_3452 ?auto_3461 ) ( CLEAR ?auto_3452 ) ( not ( = ?auto_3452 ?auto_3461 ) ) ( not ( = ?auto_3453 ?auto_3461 ) ) ( not ( = ?auto_3458 ?auto_3461 ) ) ( not ( = ?auto_3459 ?auto_3461 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3456 ?auto_3452 ?auto_3461 ?auto_3454 )
      ( MAKE-2CRATE ?auto_3458 ?auto_3452 ?auto_3453 )
      ( MAKE-1CRATE-VERIFY ?auto_3452 ?auto_3453 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3462 - SURFACE
      ?auto_3463 - SURFACE
      ?auto_3464 - SURFACE
    )
    :vars
    (
      ?auto_3465 - HOIST
      ?auto_3466 - PLACE
      ?auto_3468 - PLACE
      ?auto_3469 - HOIST
      ?auto_3467 - SURFACE
      ?auto_3471 - TRUCK
      ?auto_3470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3465 ?auto_3466 ) ( IS-CRATE ?auto_3464 ) ( not ( = ?auto_3463 ?auto_3464 ) ) ( not ( = ?auto_3462 ?auto_3463 ) ) ( not ( = ?auto_3462 ?auto_3464 ) ) ( not ( = ?auto_3468 ?auto_3466 ) ) ( HOIST-AT ?auto_3469 ?auto_3468 ) ( not ( = ?auto_3465 ?auto_3469 ) ) ( SURFACE-AT ?auto_3464 ?auto_3468 ) ( ON ?auto_3464 ?auto_3467 ) ( CLEAR ?auto_3464 ) ( not ( = ?auto_3463 ?auto_3467 ) ) ( not ( = ?auto_3464 ?auto_3467 ) ) ( not ( = ?auto_3462 ?auto_3467 ) ) ( SURFACE-AT ?auto_3462 ?auto_3466 ) ( CLEAR ?auto_3462 ) ( IS-CRATE ?auto_3463 ) ( AVAILABLE ?auto_3465 ) ( TRUCK-AT ?auto_3471 ?auto_3468 ) ( AVAILABLE ?auto_3469 ) ( SURFACE-AT ?auto_3463 ?auto_3468 ) ( ON ?auto_3463 ?auto_3470 ) ( CLEAR ?auto_3463 ) ( not ( = ?auto_3463 ?auto_3470 ) ) ( not ( = ?auto_3464 ?auto_3470 ) ) ( not ( = ?auto_3462 ?auto_3470 ) ) ( not ( = ?auto_3467 ?auto_3470 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3463 ?auto_3464 )
      ( MAKE-2CRATE-VERIFY ?auto_3462 ?auto_3463 ?auto_3464 ) )
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
      ?auto_3481 - PLACE
      ?auto_3478 - PLACE
      ?auto_3480 - HOIST
      ?auto_3479 - SURFACE
      ?auto_3482 - TRUCK
      ?auto_3477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3476 ?auto_3481 ) ( IS-CRATE ?auto_3475 ) ( not ( = ?auto_3474 ?auto_3475 ) ) ( not ( = ?auto_3473 ?auto_3474 ) ) ( not ( = ?auto_3473 ?auto_3475 ) ) ( not ( = ?auto_3478 ?auto_3481 ) ) ( HOIST-AT ?auto_3480 ?auto_3478 ) ( not ( = ?auto_3476 ?auto_3480 ) ) ( SURFACE-AT ?auto_3475 ?auto_3478 ) ( ON ?auto_3475 ?auto_3479 ) ( CLEAR ?auto_3475 ) ( not ( = ?auto_3474 ?auto_3479 ) ) ( not ( = ?auto_3475 ?auto_3479 ) ) ( not ( = ?auto_3473 ?auto_3479 ) ) ( SURFACE-AT ?auto_3473 ?auto_3481 ) ( CLEAR ?auto_3473 ) ( IS-CRATE ?auto_3474 ) ( AVAILABLE ?auto_3476 ) ( TRUCK-AT ?auto_3482 ?auto_3478 ) ( AVAILABLE ?auto_3480 ) ( SURFACE-AT ?auto_3474 ?auto_3478 ) ( ON ?auto_3474 ?auto_3477 ) ( CLEAR ?auto_3474 ) ( not ( = ?auto_3474 ?auto_3477 ) ) ( not ( = ?auto_3475 ?auto_3477 ) ) ( not ( = ?auto_3473 ?auto_3477 ) ) ( not ( = ?auto_3479 ?auto_3477 ) ) ( ON ?auto_3473 ?auto_3472 ) ( not ( = ?auto_3472 ?auto_3473 ) ) ( not ( = ?auto_3472 ?auto_3474 ) ) ( not ( = ?auto_3472 ?auto_3475 ) ) ( not ( = ?auto_3472 ?auto_3479 ) ) ( not ( = ?auto_3472 ?auto_3477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3473 ?auto_3474 ?auto_3475 )
      ( MAKE-3CRATE-VERIFY ?auto_3472 ?auto_3473 ?auto_3474 ?auto_3475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3483 - SURFACE
      ?auto_3484 - SURFACE
    )
    :vars
    (
      ?auto_3485 - HOIST
      ?auto_3491 - PLACE
      ?auto_3486 - SURFACE
      ?auto_3488 - PLACE
      ?auto_3490 - HOIST
      ?auto_3489 - SURFACE
      ?auto_3487 - SURFACE
      ?auto_3492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3485 ?auto_3491 ) ( IS-CRATE ?auto_3484 ) ( not ( = ?auto_3483 ?auto_3484 ) ) ( not ( = ?auto_3486 ?auto_3483 ) ) ( not ( = ?auto_3486 ?auto_3484 ) ) ( not ( = ?auto_3488 ?auto_3491 ) ) ( HOIST-AT ?auto_3490 ?auto_3488 ) ( not ( = ?auto_3485 ?auto_3490 ) ) ( SURFACE-AT ?auto_3484 ?auto_3488 ) ( ON ?auto_3484 ?auto_3489 ) ( CLEAR ?auto_3484 ) ( not ( = ?auto_3483 ?auto_3489 ) ) ( not ( = ?auto_3484 ?auto_3489 ) ) ( not ( = ?auto_3486 ?auto_3489 ) ) ( SURFACE-AT ?auto_3486 ?auto_3491 ) ( CLEAR ?auto_3486 ) ( IS-CRATE ?auto_3483 ) ( AVAILABLE ?auto_3485 ) ( AVAILABLE ?auto_3490 ) ( SURFACE-AT ?auto_3483 ?auto_3488 ) ( ON ?auto_3483 ?auto_3487 ) ( CLEAR ?auto_3483 ) ( not ( = ?auto_3483 ?auto_3487 ) ) ( not ( = ?auto_3484 ?auto_3487 ) ) ( not ( = ?auto_3486 ?auto_3487 ) ) ( not ( = ?auto_3489 ?auto_3487 ) ) ( TRUCK-AT ?auto_3492 ?auto_3491 ) )
    :subtasks
    ( ( !DRIVE ?auto_3492 ?auto_3491 ?auto_3488 )
      ( MAKE-2CRATE ?auto_3486 ?auto_3483 ?auto_3484 )
      ( MAKE-1CRATE-VERIFY ?auto_3483 ?auto_3484 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3493 - SURFACE
      ?auto_3494 - SURFACE
      ?auto_3495 - SURFACE
    )
    :vars
    (
      ?auto_3501 - HOIST
      ?auto_3502 - PLACE
      ?auto_3496 - PLACE
      ?auto_3497 - HOIST
      ?auto_3500 - SURFACE
      ?auto_3499 - SURFACE
      ?auto_3498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3501 ?auto_3502 ) ( IS-CRATE ?auto_3495 ) ( not ( = ?auto_3494 ?auto_3495 ) ) ( not ( = ?auto_3493 ?auto_3494 ) ) ( not ( = ?auto_3493 ?auto_3495 ) ) ( not ( = ?auto_3496 ?auto_3502 ) ) ( HOIST-AT ?auto_3497 ?auto_3496 ) ( not ( = ?auto_3501 ?auto_3497 ) ) ( SURFACE-AT ?auto_3495 ?auto_3496 ) ( ON ?auto_3495 ?auto_3500 ) ( CLEAR ?auto_3495 ) ( not ( = ?auto_3494 ?auto_3500 ) ) ( not ( = ?auto_3495 ?auto_3500 ) ) ( not ( = ?auto_3493 ?auto_3500 ) ) ( SURFACE-AT ?auto_3493 ?auto_3502 ) ( CLEAR ?auto_3493 ) ( IS-CRATE ?auto_3494 ) ( AVAILABLE ?auto_3501 ) ( AVAILABLE ?auto_3497 ) ( SURFACE-AT ?auto_3494 ?auto_3496 ) ( ON ?auto_3494 ?auto_3499 ) ( CLEAR ?auto_3494 ) ( not ( = ?auto_3494 ?auto_3499 ) ) ( not ( = ?auto_3495 ?auto_3499 ) ) ( not ( = ?auto_3493 ?auto_3499 ) ) ( not ( = ?auto_3500 ?auto_3499 ) ) ( TRUCK-AT ?auto_3498 ?auto_3502 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3494 ?auto_3495 )
      ( MAKE-2CRATE-VERIFY ?auto_3493 ?auto_3494 ?auto_3495 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3503 - SURFACE
      ?auto_3504 - SURFACE
      ?auto_3505 - SURFACE
      ?auto_3506 - SURFACE
    )
    :vars
    (
      ?auto_3508 - HOIST
      ?auto_3507 - PLACE
      ?auto_3511 - PLACE
      ?auto_3513 - HOIST
      ?auto_3510 - SURFACE
      ?auto_3512 - SURFACE
      ?auto_3509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3508 ?auto_3507 ) ( IS-CRATE ?auto_3506 ) ( not ( = ?auto_3505 ?auto_3506 ) ) ( not ( = ?auto_3504 ?auto_3505 ) ) ( not ( = ?auto_3504 ?auto_3506 ) ) ( not ( = ?auto_3511 ?auto_3507 ) ) ( HOIST-AT ?auto_3513 ?auto_3511 ) ( not ( = ?auto_3508 ?auto_3513 ) ) ( SURFACE-AT ?auto_3506 ?auto_3511 ) ( ON ?auto_3506 ?auto_3510 ) ( CLEAR ?auto_3506 ) ( not ( = ?auto_3505 ?auto_3510 ) ) ( not ( = ?auto_3506 ?auto_3510 ) ) ( not ( = ?auto_3504 ?auto_3510 ) ) ( SURFACE-AT ?auto_3504 ?auto_3507 ) ( CLEAR ?auto_3504 ) ( IS-CRATE ?auto_3505 ) ( AVAILABLE ?auto_3508 ) ( AVAILABLE ?auto_3513 ) ( SURFACE-AT ?auto_3505 ?auto_3511 ) ( ON ?auto_3505 ?auto_3512 ) ( CLEAR ?auto_3505 ) ( not ( = ?auto_3505 ?auto_3512 ) ) ( not ( = ?auto_3506 ?auto_3512 ) ) ( not ( = ?auto_3504 ?auto_3512 ) ) ( not ( = ?auto_3510 ?auto_3512 ) ) ( TRUCK-AT ?auto_3509 ?auto_3507 ) ( ON ?auto_3504 ?auto_3503 ) ( not ( = ?auto_3503 ?auto_3504 ) ) ( not ( = ?auto_3503 ?auto_3505 ) ) ( not ( = ?auto_3503 ?auto_3506 ) ) ( not ( = ?auto_3503 ?auto_3510 ) ) ( not ( = ?auto_3503 ?auto_3512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3504 ?auto_3505 ?auto_3506 )
      ( MAKE-3CRATE-VERIFY ?auto_3503 ?auto_3504 ?auto_3505 ?auto_3506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3514 - SURFACE
      ?auto_3515 - SURFACE
    )
    :vars
    (
      ?auto_3517 - HOIST
      ?auto_3516 - PLACE
      ?auto_3522 - SURFACE
      ?auto_3520 - PLACE
      ?auto_3523 - HOIST
      ?auto_3519 - SURFACE
      ?auto_3521 - SURFACE
      ?auto_3518 - TRUCK
      ?auto_3524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3517 ?auto_3516 ) ( IS-CRATE ?auto_3515 ) ( not ( = ?auto_3514 ?auto_3515 ) ) ( not ( = ?auto_3522 ?auto_3514 ) ) ( not ( = ?auto_3522 ?auto_3515 ) ) ( not ( = ?auto_3520 ?auto_3516 ) ) ( HOIST-AT ?auto_3523 ?auto_3520 ) ( not ( = ?auto_3517 ?auto_3523 ) ) ( SURFACE-AT ?auto_3515 ?auto_3520 ) ( ON ?auto_3515 ?auto_3519 ) ( CLEAR ?auto_3515 ) ( not ( = ?auto_3514 ?auto_3519 ) ) ( not ( = ?auto_3515 ?auto_3519 ) ) ( not ( = ?auto_3522 ?auto_3519 ) ) ( IS-CRATE ?auto_3514 ) ( AVAILABLE ?auto_3523 ) ( SURFACE-AT ?auto_3514 ?auto_3520 ) ( ON ?auto_3514 ?auto_3521 ) ( CLEAR ?auto_3514 ) ( not ( = ?auto_3514 ?auto_3521 ) ) ( not ( = ?auto_3515 ?auto_3521 ) ) ( not ( = ?auto_3522 ?auto_3521 ) ) ( not ( = ?auto_3519 ?auto_3521 ) ) ( TRUCK-AT ?auto_3518 ?auto_3516 ) ( SURFACE-AT ?auto_3524 ?auto_3516 ) ( CLEAR ?auto_3524 ) ( LIFTING ?auto_3517 ?auto_3522 ) ( IS-CRATE ?auto_3522 ) ( not ( = ?auto_3524 ?auto_3522 ) ) ( not ( = ?auto_3514 ?auto_3524 ) ) ( not ( = ?auto_3515 ?auto_3524 ) ) ( not ( = ?auto_3519 ?auto_3524 ) ) ( not ( = ?auto_3521 ?auto_3524 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3524 ?auto_3522 )
      ( MAKE-2CRATE ?auto_3522 ?auto_3514 ?auto_3515 )
      ( MAKE-1CRATE-VERIFY ?auto_3514 ?auto_3515 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3525 - SURFACE
      ?auto_3526 - SURFACE
      ?auto_3527 - SURFACE
    )
    :vars
    (
      ?auto_3528 - HOIST
      ?auto_3530 - PLACE
      ?auto_3533 - PLACE
      ?auto_3531 - HOIST
      ?auto_3532 - SURFACE
      ?auto_3534 - SURFACE
      ?auto_3535 - TRUCK
      ?auto_3529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3528 ?auto_3530 ) ( IS-CRATE ?auto_3527 ) ( not ( = ?auto_3526 ?auto_3527 ) ) ( not ( = ?auto_3525 ?auto_3526 ) ) ( not ( = ?auto_3525 ?auto_3527 ) ) ( not ( = ?auto_3533 ?auto_3530 ) ) ( HOIST-AT ?auto_3531 ?auto_3533 ) ( not ( = ?auto_3528 ?auto_3531 ) ) ( SURFACE-AT ?auto_3527 ?auto_3533 ) ( ON ?auto_3527 ?auto_3532 ) ( CLEAR ?auto_3527 ) ( not ( = ?auto_3526 ?auto_3532 ) ) ( not ( = ?auto_3527 ?auto_3532 ) ) ( not ( = ?auto_3525 ?auto_3532 ) ) ( IS-CRATE ?auto_3526 ) ( AVAILABLE ?auto_3531 ) ( SURFACE-AT ?auto_3526 ?auto_3533 ) ( ON ?auto_3526 ?auto_3534 ) ( CLEAR ?auto_3526 ) ( not ( = ?auto_3526 ?auto_3534 ) ) ( not ( = ?auto_3527 ?auto_3534 ) ) ( not ( = ?auto_3525 ?auto_3534 ) ) ( not ( = ?auto_3532 ?auto_3534 ) ) ( TRUCK-AT ?auto_3535 ?auto_3530 ) ( SURFACE-AT ?auto_3529 ?auto_3530 ) ( CLEAR ?auto_3529 ) ( LIFTING ?auto_3528 ?auto_3525 ) ( IS-CRATE ?auto_3525 ) ( not ( = ?auto_3529 ?auto_3525 ) ) ( not ( = ?auto_3526 ?auto_3529 ) ) ( not ( = ?auto_3527 ?auto_3529 ) ) ( not ( = ?auto_3532 ?auto_3529 ) ) ( not ( = ?auto_3534 ?auto_3529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3526 ?auto_3527 )
      ( MAKE-2CRATE-VERIFY ?auto_3525 ?auto_3526 ?auto_3527 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3536 - SURFACE
      ?auto_3537 - SURFACE
      ?auto_3538 - SURFACE
      ?auto_3539 - SURFACE
    )
    :vars
    (
      ?auto_3546 - HOIST
      ?auto_3541 - PLACE
      ?auto_3543 - PLACE
      ?auto_3542 - HOIST
      ?auto_3544 - SURFACE
      ?auto_3540 - SURFACE
      ?auto_3545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3546 ?auto_3541 ) ( IS-CRATE ?auto_3539 ) ( not ( = ?auto_3538 ?auto_3539 ) ) ( not ( = ?auto_3537 ?auto_3538 ) ) ( not ( = ?auto_3537 ?auto_3539 ) ) ( not ( = ?auto_3543 ?auto_3541 ) ) ( HOIST-AT ?auto_3542 ?auto_3543 ) ( not ( = ?auto_3546 ?auto_3542 ) ) ( SURFACE-AT ?auto_3539 ?auto_3543 ) ( ON ?auto_3539 ?auto_3544 ) ( CLEAR ?auto_3539 ) ( not ( = ?auto_3538 ?auto_3544 ) ) ( not ( = ?auto_3539 ?auto_3544 ) ) ( not ( = ?auto_3537 ?auto_3544 ) ) ( IS-CRATE ?auto_3538 ) ( AVAILABLE ?auto_3542 ) ( SURFACE-AT ?auto_3538 ?auto_3543 ) ( ON ?auto_3538 ?auto_3540 ) ( CLEAR ?auto_3538 ) ( not ( = ?auto_3538 ?auto_3540 ) ) ( not ( = ?auto_3539 ?auto_3540 ) ) ( not ( = ?auto_3537 ?auto_3540 ) ) ( not ( = ?auto_3544 ?auto_3540 ) ) ( TRUCK-AT ?auto_3545 ?auto_3541 ) ( SURFACE-AT ?auto_3536 ?auto_3541 ) ( CLEAR ?auto_3536 ) ( LIFTING ?auto_3546 ?auto_3537 ) ( IS-CRATE ?auto_3537 ) ( not ( = ?auto_3536 ?auto_3537 ) ) ( not ( = ?auto_3538 ?auto_3536 ) ) ( not ( = ?auto_3539 ?auto_3536 ) ) ( not ( = ?auto_3544 ?auto_3536 ) ) ( not ( = ?auto_3540 ?auto_3536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3537 ?auto_3538 ?auto_3539 )
      ( MAKE-3CRATE-VERIFY ?auto_3536 ?auto_3537 ?auto_3538 ?auto_3539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3547 - SURFACE
      ?auto_3548 - SURFACE
    )
    :vars
    (
      ?auto_3555 - HOIST
      ?auto_3550 - PLACE
      ?auto_3557 - SURFACE
      ?auto_3552 - PLACE
      ?auto_3551 - HOIST
      ?auto_3553 - SURFACE
      ?auto_3549 - SURFACE
      ?auto_3554 - TRUCK
      ?auto_3556 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3555 ?auto_3550 ) ( IS-CRATE ?auto_3548 ) ( not ( = ?auto_3547 ?auto_3548 ) ) ( not ( = ?auto_3557 ?auto_3547 ) ) ( not ( = ?auto_3557 ?auto_3548 ) ) ( not ( = ?auto_3552 ?auto_3550 ) ) ( HOIST-AT ?auto_3551 ?auto_3552 ) ( not ( = ?auto_3555 ?auto_3551 ) ) ( SURFACE-AT ?auto_3548 ?auto_3552 ) ( ON ?auto_3548 ?auto_3553 ) ( CLEAR ?auto_3548 ) ( not ( = ?auto_3547 ?auto_3553 ) ) ( not ( = ?auto_3548 ?auto_3553 ) ) ( not ( = ?auto_3557 ?auto_3553 ) ) ( IS-CRATE ?auto_3547 ) ( AVAILABLE ?auto_3551 ) ( SURFACE-AT ?auto_3547 ?auto_3552 ) ( ON ?auto_3547 ?auto_3549 ) ( CLEAR ?auto_3547 ) ( not ( = ?auto_3547 ?auto_3549 ) ) ( not ( = ?auto_3548 ?auto_3549 ) ) ( not ( = ?auto_3557 ?auto_3549 ) ) ( not ( = ?auto_3553 ?auto_3549 ) ) ( TRUCK-AT ?auto_3554 ?auto_3550 ) ( SURFACE-AT ?auto_3556 ?auto_3550 ) ( CLEAR ?auto_3556 ) ( IS-CRATE ?auto_3557 ) ( not ( = ?auto_3556 ?auto_3557 ) ) ( not ( = ?auto_3547 ?auto_3556 ) ) ( not ( = ?auto_3548 ?auto_3556 ) ) ( not ( = ?auto_3553 ?auto_3556 ) ) ( not ( = ?auto_3549 ?auto_3556 ) ) ( AVAILABLE ?auto_3555 ) ( IN ?auto_3557 ?auto_3554 ) )
    :subtasks
    ( ( !UNLOAD ?auto_3555 ?auto_3557 ?auto_3554 ?auto_3550 )
      ( MAKE-2CRATE ?auto_3557 ?auto_3547 ?auto_3548 )
      ( MAKE-1CRATE-VERIFY ?auto_3547 ?auto_3548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3558 - SURFACE
      ?auto_3559 - SURFACE
      ?auto_3560 - SURFACE
    )
    :vars
    (
      ?auto_3562 - HOIST
      ?auto_3566 - PLACE
      ?auto_3564 - PLACE
      ?auto_3561 - HOIST
      ?auto_3565 - SURFACE
      ?auto_3567 - SURFACE
      ?auto_3568 - TRUCK
      ?auto_3563 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3562 ?auto_3566 ) ( IS-CRATE ?auto_3560 ) ( not ( = ?auto_3559 ?auto_3560 ) ) ( not ( = ?auto_3558 ?auto_3559 ) ) ( not ( = ?auto_3558 ?auto_3560 ) ) ( not ( = ?auto_3564 ?auto_3566 ) ) ( HOIST-AT ?auto_3561 ?auto_3564 ) ( not ( = ?auto_3562 ?auto_3561 ) ) ( SURFACE-AT ?auto_3560 ?auto_3564 ) ( ON ?auto_3560 ?auto_3565 ) ( CLEAR ?auto_3560 ) ( not ( = ?auto_3559 ?auto_3565 ) ) ( not ( = ?auto_3560 ?auto_3565 ) ) ( not ( = ?auto_3558 ?auto_3565 ) ) ( IS-CRATE ?auto_3559 ) ( AVAILABLE ?auto_3561 ) ( SURFACE-AT ?auto_3559 ?auto_3564 ) ( ON ?auto_3559 ?auto_3567 ) ( CLEAR ?auto_3559 ) ( not ( = ?auto_3559 ?auto_3567 ) ) ( not ( = ?auto_3560 ?auto_3567 ) ) ( not ( = ?auto_3558 ?auto_3567 ) ) ( not ( = ?auto_3565 ?auto_3567 ) ) ( TRUCK-AT ?auto_3568 ?auto_3566 ) ( SURFACE-AT ?auto_3563 ?auto_3566 ) ( CLEAR ?auto_3563 ) ( IS-CRATE ?auto_3558 ) ( not ( = ?auto_3563 ?auto_3558 ) ) ( not ( = ?auto_3559 ?auto_3563 ) ) ( not ( = ?auto_3560 ?auto_3563 ) ) ( not ( = ?auto_3565 ?auto_3563 ) ) ( not ( = ?auto_3567 ?auto_3563 ) ) ( AVAILABLE ?auto_3562 ) ( IN ?auto_3558 ?auto_3568 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3559 ?auto_3560 )
      ( MAKE-2CRATE-VERIFY ?auto_3558 ?auto_3559 ?auto_3560 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3569 - SURFACE
      ?auto_3570 - SURFACE
      ?auto_3571 - SURFACE
      ?auto_3572 - SURFACE
    )
    :vars
    (
      ?auto_3578 - HOIST
      ?auto_3579 - PLACE
      ?auto_3573 - PLACE
      ?auto_3577 - HOIST
      ?auto_3575 - SURFACE
      ?auto_3574 - SURFACE
      ?auto_3576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3578 ?auto_3579 ) ( IS-CRATE ?auto_3572 ) ( not ( = ?auto_3571 ?auto_3572 ) ) ( not ( = ?auto_3570 ?auto_3571 ) ) ( not ( = ?auto_3570 ?auto_3572 ) ) ( not ( = ?auto_3573 ?auto_3579 ) ) ( HOIST-AT ?auto_3577 ?auto_3573 ) ( not ( = ?auto_3578 ?auto_3577 ) ) ( SURFACE-AT ?auto_3572 ?auto_3573 ) ( ON ?auto_3572 ?auto_3575 ) ( CLEAR ?auto_3572 ) ( not ( = ?auto_3571 ?auto_3575 ) ) ( not ( = ?auto_3572 ?auto_3575 ) ) ( not ( = ?auto_3570 ?auto_3575 ) ) ( IS-CRATE ?auto_3571 ) ( AVAILABLE ?auto_3577 ) ( SURFACE-AT ?auto_3571 ?auto_3573 ) ( ON ?auto_3571 ?auto_3574 ) ( CLEAR ?auto_3571 ) ( not ( = ?auto_3571 ?auto_3574 ) ) ( not ( = ?auto_3572 ?auto_3574 ) ) ( not ( = ?auto_3570 ?auto_3574 ) ) ( not ( = ?auto_3575 ?auto_3574 ) ) ( TRUCK-AT ?auto_3576 ?auto_3579 ) ( SURFACE-AT ?auto_3569 ?auto_3579 ) ( CLEAR ?auto_3569 ) ( IS-CRATE ?auto_3570 ) ( not ( = ?auto_3569 ?auto_3570 ) ) ( not ( = ?auto_3571 ?auto_3569 ) ) ( not ( = ?auto_3572 ?auto_3569 ) ) ( not ( = ?auto_3575 ?auto_3569 ) ) ( not ( = ?auto_3574 ?auto_3569 ) ) ( AVAILABLE ?auto_3578 ) ( IN ?auto_3570 ?auto_3576 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3570 ?auto_3571 ?auto_3572 )
      ( MAKE-3CRATE-VERIFY ?auto_3569 ?auto_3570 ?auto_3571 ?auto_3572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3580 - SURFACE
      ?auto_3581 - SURFACE
    )
    :vars
    (
      ?auto_3588 - HOIST
      ?auto_3589 - PLACE
      ?auto_3584 - SURFACE
      ?auto_3582 - PLACE
      ?auto_3587 - HOIST
      ?auto_3585 - SURFACE
      ?auto_3583 - SURFACE
      ?auto_3590 - SURFACE
      ?auto_3586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3588 ?auto_3589 ) ( IS-CRATE ?auto_3581 ) ( not ( = ?auto_3580 ?auto_3581 ) ) ( not ( = ?auto_3584 ?auto_3580 ) ) ( not ( = ?auto_3584 ?auto_3581 ) ) ( not ( = ?auto_3582 ?auto_3589 ) ) ( HOIST-AT ?auto_3587 ?auto_3582 ) ( not ( = ?auto_3588 ?auto_3587 ) ) ( SURFACE-AT ?auto_3581 ?auto_3582 ) ( ON ?auto_3581 ?auto_3585 ) ( CLEAR ?auto_3581 ) ( not ( = ?auto_3580 ?auto_3585 ) ) ( not ( = ?auto_3581 ?auto_3585 ) ) ( not ( = ?auto_3584 ?auto_3585 ) ) ( IS-CRATE ?auto_3580 ) ( AVAILABLE ?auto_3587 ) ( SURFACE-AT ?auto_3580 ?auto_3582 ) ( ON ?auto_3580 ?auto_3583 ) ( CLEAR ?auto_3580 ) ( not ( = ?auto_3580 ?auto_3583 ) ) ( not ( = ?auto_3581 ?auto_3583 ) ) ( not ( = ?auto_3584 ?auto_3583 ) ) ( not ( = ?auto_3585 ?auto_3583 ) ) ( SURFACE-AT ?auto_3590 ?auto_3589 ) ( CLEAR ?auto_3590 ) ( IS-CRATE ?auto_3584 ) ( not ( = ?auto_3590 ?auto_3584 ) ) ( not ( = ?auto_3580 ?auto_3590 ) ) ( not ( = ?auto_3581 ?auto_3590 ) ) ( not ( = ?auto_3585 ?auto_3590 ) ) ( not ( = ?auto_3583 ?auto_3590 ) ) ( AVAILABLE ?auto_3588 ) ( IN ?auto_3584 ?auto_3586 ) ( TRUCK-AT ?auto_3586 ?auto_3582 ) )
    :subtasks
    ( ( !DRIVE ?auto_3586 ?auto_3582 ?auto_3589 )
      ( MAKE-2CRATE ?auto_3584 ?auto_3580 ?auto_3581 )
      ( MAKE-1CRATE-VERIFY ?auto_3580 ?auto_3581 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3591 - SURFACE
      ?auto_3592 - SURFACE
      ?auto_3593 - SURFACE
    )
    :vars
    (
      ?auto_3599 - HOIST
      ?auto_3598 - PLACE
      ?auto_3594 - PLACE
      ?auto_3597 - HOIST
      ?auto_3595 - SURFACE
      ?auto_3601 - SURFACE
      ?auto_3596 - SURFACE
      ?auto_3600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3599 ?auto_3598 ) ( IS-CRATE ?auto_3593 ) ( not ( = ?auto_3592 ?auto_3593 ) ) ( not ( = ?auto_3591 ?auto_3592 ) ) ( not ( = ?auto_3591 ?auto_3593 ) ) ( not ( = ?auto_3594 ?auto_3598 ) ) ( HOIST-AT ?auto_3597 ?auto_3594 ) ( not ( = ?auto_3599 ?auto_3597 ) ) ( SURFACE-AT ?auto_3593 ?auto_3594 ) ( ON ?auto_3593 ?auto_3595 ) ( CLEAR ?auto_3593 ) ( not ( = ?auto_3592 ?auto_3595 ) ) ( not ( = ?auto_3593 ?auto_3595 ) ) ( not ( = ?auto_3591 ?auto_3595 ) ) ( IS-CRATE ?auto_3592 ) ( AVAILABLE ?auto_3597 ) ( SURFACE-AT ?auto_3592 ?auto_3594 ) ( ON ?auto_3592 ?auto_3601 ) ( CLEAR ?auto_3592 ) ( not ( = ?auto_3592 ?auto_3601 ) ) ( not ( = ?auto_3593 ?auto_3601 ) ) ( not ( = ?auto_3591 ?auto_3601 ) ) ( not ( = ?auto_3595 ?auto_3601 ) ) ( SURFACE-AT ?auto_3596 ?auto_3598 ) ( CLEAR ?auto_3596 ) ( IS-CRATE ?auto_3591 ) ( not ( = ?auto_3596 ?auto_3591 ) ) ( not ( = ?auto_3592 ?auto_3596 ) ) ( not ( = ?auto_3593 ?auto_3596 ) ) ( not ( = ?auto_3595 ?auto_3596 ) ) ( not ( = ?auto_3601 ?auto_3596 ) ) ( AVAILABLE ?auto_3599 ) ( IN ?auto_3591 ?auto_3600 ) ( TRUCK-AT ?auto_3600 ?auto_3594 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3592 ?auto_3593 )
      ( MAKE-2CRATE-VERIFY ?auto_3591 ?auto_3592 ?auto_3593 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3602 - SURFACE
      ?auto_3603 - SURFACE
      ?auto_3604 - SURFACE
      ?auto_3605 - SURFACE
    )
    :vars
    (
      ?auto_3607 - HOIST
      ?auto_3610 - PLACE
      ?auto_3606 - PLACE
      ?auto_3608 - HOIST
      ?auto_3612 - SURFACE
      ?auto_3611 - SURFACE
      ?auto_3609 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3607 ?auto_3610 ) ( IS-CRATE ?auto_3605 ) ( not ( = ?auto_3604 ?auto_3605 ) ) ( not ( = ?auto_3603 ?auto_3604 ) ) ( not ( = ?auto_3603 ?auto_3605 ) ) ( not ( = ?auto_3606 ?auto_3610 ) ) ( HOIST-AT ?auto_3608 ?auto_3606 ) ( not ( = ?auto_3607 ?auto_3608 ) ) ( SURFACE-AT ?auto_3605 ?auto_3606 ) ( ON ?auto_3605 ?auto_3612 ) ( CLEAR ?auto_3605 ) ( not ( = ?auto_3604 ?auto_3612 ) ) ( not ( = ?auto_3605 ?auto_3612 ) ) ( not ( = ?auto_3603 ?auto_3612 ) ) ( IS-CRATE ?auto_3604 ) ( AVAILABLE ?auto_3608 ) ( SURFACE-AT ?auto_3604 ?auto_3606 ) ( ON ?auto_3604 ?auto_3611 ) ( CLEAR ?auto_3604 ) ( not ( = ?auto_3604 ?auto_3611 ) ) ( not ( = ?auto_3605 ?auto_3611 ) ) ( not ( = ?auto_3603 ?auto_3611 ) ) ( not ( = ?auto_3612 ?auto_3611 ) ) ( SURFACE-AT ?auto_3602 ?auto_3610 ) ( CLEAR ?auto_3602 ) ( IS-CRATE ?auto_3603 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3604 ?auto_3602 ) ) ( not ( = ?auto_3605 ?auto_3602 ) ) ( not ( = ?auto_3612 ?auto_3602 ) ) ( not ( = ?auto_3611 ?auto_3602 ) ) ( AVAILABLE ?auto_3607 ) ( IN ?auto_3603 ?auto_3609 ) ( TRUCK-AT ?auto_3609 ?auto_3606 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3603 ?auto_3604 ?auto_3605 )
      ( MAKE-3CRATE-VERIFY ?auto_3602 ?auto_3603 ?auto_3604 ?auto_3605 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3613 - SURFACE
      ?auto_3614 - SURFACE
    )
    :vars
    (
      ?auto_3617 - HOIST
      ?auto_3621 - PLACE
      ?auto_3615 - SURFACE
      ?auto_3616 - PLACE
      ?auto_3618 - HOIST
      ?auto_3623 - SURFACE
      ?auto_3622 - SURFACE
      ?auto_3619 - SURFACE
      ?auto_3620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3617 ?auto_3621 ) ( IS-CRATE ?auto_3614 ) ( not ( = ?auto_3613 ?auto_3614 ) ) ( not ( = ?auto_3615 ?auto_3613 ) ) ( not ( = ?auto_3615 ?auto_3614 ) ) ( not ( = ?auto_3616 ?auto_3621 ) ) ( HOIST-AT ?auto_3618 ?auto_3616 ) ( not ( = ?auto_3617 ?auto_3618 ) ) ( SURFACE-AT ?auto_3614 ?auto_3616 ) ( ON ?auto_3614 ?auto_3623 ) ( CLEAR ?auto_3614 ) ( not ( = ?auto_3613 ?auto_3623 ) ) ( not ( = ?auto_3614 ?auto_3623 ) ) ( not ( = ?auto_3615 ?auto_3623 ) ) ( IS-CRATE ?auto_3613 ) ( SURFACE-AT ?auto_3613 ?auto_3616 ) ( ON ?auto_3613 ?auto_3622 ) ( CLEAR ?auto_3613 ) ( not ( = ?auto_3613 ?auto_3622 ) ) ( not ( = ?auto_3614 ?auto_3622 ) ) ( not ( = ?auto_3615 ?auto_3622 ) ) ( not ( = ?auto_3623 ?auto_3622 ) ) ( SURFACE-AT ?auto_3619 ?auto_3621 ) ( CLEAR ?auto_3619 ) ( IS-CRATE ?auto_3615 ) ( not ( = ?auto_3619 ?auto_3615 ) ) ( not ( = ?auto_3613 ?auto_3619 ) ) ( not ( = ?auto_3614 ?auto_3619 ) ) ( not ( = ?auto_3623 ?auto_3619 ) ) ( not ( = ?auto_3622 ?auto_3619 ) ) ( AVAILABLE ?auto_3617 ) ( TRUCK-AT ?auto_3620 ?auto_3616 ) ( LIFTING ?auto_3618 ?auto_3615 ) )
    :subtasks
    ( ( !LOAD ?auto_3618 ?auto_3615 ?auto_3620 ?auto_3616 )
      ( MAKE-2CRATE ?auto_3615 ?auto_3613 ?auto_3614 )
      ( MAKE-1CRATE-VERIFY ?auto_3613 ?auto_3614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3624 - SURFACE
      ?auto_3625 - SURFACE
      ?auto_3626 - SURFACE
    )
    :vars
    (
      ?auto_3632 - HOIST
      ?auto_3628 - PLACE
      ?auto_3627 - PLACE
      ?auto_3634 - HOIST
      ?auto_3630 - SURFACE
      ?auto_3629 - SURFACE
      ?auto_3633 - SURFACE
      ?auto_3631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3632 ?auto_3628 ) ( IS-CRATE ?auto_3626 ) ( not ( = ?auto_3625 ?auto_3626 ) ) ( not ( = ?auto_3624 ?auto_3625 ) ) ( not ( = ?auto_3624 ?auto_3626 ) ) ( not ( = ?auto_3627 ?auto_3628 ) ) ( HOIST-AT ?auto_3634 ?auto_3627 ) ( not ( = ?auto_3632 ?auto_3634 ) ) ( SURFACE-AT ?auto_3626 ?auto_3627 ) ( ON ?auto_3626 ?auto_3630 ) ( CLEAR ?auto_3626 ) ( not ( = ?auto_3625 ?auto_3630 ) ) ( not ( = ?auto_3626 ?auto_3630 ) ) ( not ( = ?auto_3624 ?auto_3630 ) ) ( IS-CRATE ?auto_3625 ) ( SURFACE-AT ?auto_3625 ?auto_3627 ) ( ON ?auto_3625 ?auto_3629 ) ( CLEAR ?auto_3625 ) ( not ( = ?auto_3625 ?auto_3629 ) ) ( not ( = ?auto_3626 ?auto_3629 ) ) ( not ( = ?auto_3624 ?auto_3629 ) ) ( not ( = ?auto_3630 ?auto_3629 ) ) ( SURFACE-AT ?auto_3633 ?auto_3628 ) ( CLEAR ?auto_3633 ) ( IS-CRATE ?auto_3624 ) ( not ( = ?auto_3633 ?auto_3624 ) ) ( not ( = ?auto_3625 ?auto_3633 ) ) ( not ( = ?auto_3626 ?auto_3633 ) ) ( not ( = ?auto_3630 ?auto_3633 ) ) ( not ( = ?auto_3629 ?auto_3633 ) ) ( AVAILABLE ?auto_3632 ) ( TRUCK-AT ?auto_3631 ?auto_3627 ) ( LIFTING ?auto_3634 ?auto_3624 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3625 ?auto_3626 )
      ( MAKE-2CRATE-VERIFY ?auto_3624 ?auto_3625 ?auto_3626 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3635 - SURFACE
      ?auto_3636 - SURFACE
      ?auto_3637 - SURFACE
      ?auto_3638 - SURFACE
    )
    :vars
    (
      ?auto_3640 - HOIST
      ?auto_3645 - PLACE
      ?auto_3639 - PLACE
      ?auto_3644 - HOIST
      ?auto_3643 - SURFACE
      ?auto_3641 - SURFACE
      ?auto_3642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3640 ?auto_3645 ) ( IS-CRATE ?auto_3638 ) ( not ( = ?auto_3637 ?auto_3638 ) ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( not ( = ?auto_3636 ?auto_3638 ) ) ( not ( = ?auto_3639 ?auto_3645 ) ) ( HOIST-AT ?auto_3644 ?auto_3639 ) ( not ( = ?auto_3640 ?auto_3644 ) ) ( SURFACE-AT ?auto_3638 ?auto_3639 ) ( ON ?auto_3638 ?auto_3643 ) ( CLEAR ?auto_3638 ) ( not ( = ?auto_3637 ?auto_3643 ) ) ( not ( = ?auto_3638 ?auto_3643 ) ) ( not ( = ?auto_3636 ?auto_3643 ) ) ( IS-CRATE ?auto_3637 ) ( SURFACE-AT ?auto_3637 ?auto_3639 ) ( ON ?auto_3637 ?auto_3641 ) ( CLEAR ?auto_3637 ) ( not ( = ?auto_3637 ?auto_3641 ) ) ( not ( = ?auto_3638 ?auto_3641 ) ) ( not ( = ?auto_3636 ?auto_3641 ) ) ( not ( = ?auto_3643 ?auto_3641 ) ) ( SURFACE-AT ?auto_3635 ?auto_3645 ) ( CLEAR ?auto_3635 ) ( IS-CRATE ?auto_3636 ) ( not ( = ?auto_3635 ?auto_3636 ) ) ( not ( = ?auto_3637 ?auto_3635 ) ) ( not ( = ?auto_3638 ?auto_3635 ) ) ( not ( = ?auto_3643 ?auto_3635 ) ) ( not ( = ?auto_3641 ?auto_3635 ) ) ( AVAILABLE ?auto_3640 ) ( TRUCK-AT ?auto_3642 ?auto_3639 ) ( LIFTING ?auto_3644 ?auto_3636 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3636 ?auto_3637 ?auto_3638 )
      ( MAKE-3CRATE-VERIFY ?auto_3635 ?auto_3636 ?auto_3637 ?auto_3638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3646 - SURFACE
      ?auto_3647 - SURFACE
    )
    :vars
    (
      ?auto_3649 - HOIST
      ?auto_3656 - PLACE
      ?auto_3655 - SURFACE
      ?auto_3648 - PLACE
      ?auto_3653 - HOIST
      ?auto_3652 - SURFACE
      ?auto_3650 - SURFACE
      ?auto_3654 - SURFACE
      ?auto_3651 - TRUCK
      ?auto_3657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3649 ?auto_3656 ) ( IS-CRATE ?auto_3647 ) ( not ( = ?auto_3646 ?auto_3647 ) ) ( not ( = ?auto_3655 ?auto_3646 ) ) ( not ( = ?auto_3655 ?auto_3647 ) ) ( not ( = ?auto_3648 ?auto_3656 ) ) ( HOIST-AT ?auto_3653 ?auto_3648 ) ( not ( = ?auto_3649 ?auto_3653 ) ) ( SURFACE-AT ?auto_3647 ?auto_3648 ) ( ON ?auto_3647 ?auto_3652 ) ( CLEAR ?auto_3647 ) ( not ( = ?auto_3646 ?auto_3652 ) ) ( not ( = ?auto_3647 ?auto_3652 ) ) ( not ( = ?auto_3655 ?auto_3652 ) ) ( IS-CRATE ?auto_3646 ) ( SURFACE-AT ?auto_3646 ?auto_3648 ) ( ON ?auto_3646 ?auto_3650 ) ( CLEAR ?auto_3646 ) ( not ( = ?auto_3646 ?auto_3650 ) ) ( not ( = ?auto_3647 ?auto_3650 ) ) ( not ( = ?auto_3655 ?auto_3650 ) ) ( not ( = ?auto_3652 ?auto_3650 ) ) ( SURFACE-AT ?auto_3654 ?auto_3656 ) ( CLEAR ?auto_3654 ) ( IS-CRATE ?auto_3655 ) ( not ( = ?auto_3654 ?auto_3655 ) ) ( not ( = ?auto_3646 ?auto_3654 ) ) ( not ( = ?auto_3647 ?auto_3654 ) ) ( not ( = ?auto_3652 ?auto_3654 ) ) ( not ( = ?auto_3650 ?auto_3654 ) ) ( AVAILABLE ?auto_3649 ) ( TRUCK-AT ?auto_3651 ?auto_3648 ) ( AVAILABLE ?auto_3653 ) ( SURFACE-AT ?auto_3655 ?auto_3648 ) ( ON ?auto_3655 ?auto_3657 ) ( CLEAR ?auto_3655 ) ( not ( = ?auto_3646 ?auto_3657 ) ) ( not ( = ?auto_3647 ?auto_3657 ) ) ( not ( = ?auto_3655 ?auto_3657 ) ) ( not ( = ?auto_3652 ?auto_3657 ) ) ( not ( = ?auto_3650 ?auto_3657 ) ) ( not ( = ?auto_3654 ?auto_3657 ) ) )
    :subtasks
    ( ( !LIFT ?auto_3653 ?auto_3655 ?auto_3657 ?auto_3648 )
      ( MAKE-2CRATE ?auto_3655 ?auto_3646 ?auto_3647 )
      ( MAKE-1CRATE-VERIFY ?auto_3646 ?auto_3647 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3658 - SURFACE
      ?auto_3659 - SURFACE
      ?auto_3660 - SURFACE
    )
    :vars
    (
      ?auto_3661 - HOIST
      ?auto_3663 - PLACE
      ?auto_3665 - PLACE
      ?auto_3669 - HOIST
      ?auto_3664 - SURFACE
      ?auto_3662 - SURFACE
      ?auto_3668 - SURFACE
      ?auto_3667 - TRUCK
      ?auto_3666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3661 ?auto_3663 ) ( IS-CRATE ?auto_3660 ) ( not ( = ?auto_3659 ?auto_3660 ) ) ( not ( = ?auto_3658 ?auto_3659 ) ) ( not ( = ?auto_3658 ?auto_3660 ) ) ( not ( = ?auto_3665 ?auto_3663 ) ) ( HOIST-AT ?auto_3669 ?auto_3665 ) ( not ( = ?auto_3661 ?auto_3669 ) ) ( SURFACE-AT ?auto_3660 ?auto_3665 ) ( ON ?auto_3660 ?auto_3664 ) ( CLEAR ?auto_3660 ) ( not ( = ?auto_3659 ?auto_3664 ) ) ( not ( = ?auto_3660 ?auto_3664 ) ) ( not ( = ?auto_3658 ?auto_3664 ) ) ( IS-CRATE ?auto_3659 ) ( SURFACE-AT ?auto_3659 ?auto_3665 ) ( ON ?auto_3659 ?auto_3662 ) ( CLEAR ?auto_3659 ) ( not ( = ?auto_3659 ?auto_3662 ) ) ( not ( = ?auto_3660 ?auto_3662 ) ) ( not ( = ?auto_3658 ?auto_3662 ) ) ( not ( = ?auto_3664 ?auto_3662 ) ) ( SURFACE-AT ?auto_3668 ?auto_3663 ) ( CLEAR ?auto_3668 ) ( IS-CRATE ?auto_3658 ) ( not ( = ?auto_3668 ?auto_3658 ) ) ( not ( = ?auto_3659 ?auto_3668 ) ) ( not ( = ?auto_3660 ?auto_3668 ) ) ( not ( = ?auto_3664 ?auto_3668 ) ) ( not ( = ?auto_3662 ?auto_3668 ) ) ( AVAILABLE ?auto_3661 ) ( TRUCK-AT ?auto_3667 ?auto_3665 ) ( AVAILABLE ?auto_3669 ) ( SURFACE-AT ?auto_3658 ?auto_3665 ) ( ON ?auto_3658 ?auto_3666 ) ( CLEAR ?auto_3658 ) ( not ( = ?auto_3659 ?auto_3666 ) ) ( not ( = ?auto_3660 ?auto_3666 ) ) ( not ( = ?auto_3658 ?auto_3666 ) ) ( not ( = ?auto_3664 ?auto_3666 ) ) ( not ( = ?auto_3662 ?auto_3666 ) ) ( not ( = ?auto_3668 ?auto_3666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3659 ?auto_3660 )
      ( MAKE-2CRATE-VERIFY ?auto_3658 ?auto_3659 ?auto_3660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3670 - SURFACE
      ?auto_3671 - SURFACE
      ?auto_3672 - SURFACE
      ?auto_3673 - SURFACE
    )
    :vars
    (
      ?auto_3674 - HOIST
      ?auto_3676 - PLACE
      ?auto_3681 - PLACE
      ?auto_3680 - HOIST
      ?auto_3678 - SURFACE
      ?auto_3675 - SURFACE
      ?auto_3677 - TRUCK
      ?auto_3679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_3674 ?auto_3676 ) ( IS-CRATE ?auto_3673 ) ( not ( = ?auto_3672 ?auto_3673 ) ) ( not ( = ?auto_3671 ?auto_3672 ) ) ( not ( = ?auto_3671 ?auto_3673 ) ) ( not ( = ?auto_3681 ?auto_3676 ) ) ( HOIST-AT ?auto_3680 ?auto_3681 ) ( not ( = ?auto_3674 ?auto_3680 ) ) ( SURFACE-AT ?auto_3673 ?auto_3681 ) ( ON ?auto_3673 ?auto_3678 ) ( CLEAR ?auto_3673 ) ( not ( = ?auto_3672 ?auto_3678 ) ) ( not ( = ?auto_3673 ?auto_3678 ) ) ( not ( = ?auto_3671 ?auto_3678 ) ) ( IS-CRATE ?auto_3672 ) ( SURFACE-AT ?auto_3672 ?auto_3681 ) ( ON ?auto_3672 ?auto_3675 ) ( CLEAR ?auto_3672 ) ( not ( = ?auto_3672 ?auto_3675 ) ) ( not ( = ?auto_3673 ?auto_3675 ) ) ( not ( = ?auto_3671 ?auto_3675 ) ) ( not ( = ?auto_3678 ?auto_3675 ) ) ( SURFACE-AT ?auto_3670 ?auto_3676 ) ( CLEAR ?auto_3670 ) ( IS-CRATE ?auto_3671 ) ( not ( = ?auto_3670 ?auto_3671 ) ) ( not ( = ?auto_3672 ?auto_3670 ) ) ( not ( = ?auto_3673 ?auto_3670 ) ) ( not ( = ?auto_3678 ?auto_3670 ) ) ( not ( = ?auto_3675 ?auto_3670 ) ) ( AVAILABLE ?auto_3674 ) ( TRUCK-AT ?auto_3677 ?auto_3681 ) ( AVAILABLE ?auto_3680 ) ( SURFACE-AT ?auto_3671 ?auto_3681 ) ( ON ?auto_3671 ?auto_3679 ) ( CLEAR ?auto_3671 ) ( not ( = ?auto_3672 ?auto_3679 ) ) ( not ( = ?auto_3673 ?auto_3679 ) ) ( not ( = ?auto_3671 ?auto_3679 ) ) ( not ( = ?auto_3678 ?auto_3679 ) ) ( not ( = ?auto_3675 ?auto_3679 ) ) ( not ( = ?auto_3670 ?auto_3679 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3671 ?auto_3672 ?auto_3673 )
      ( MAKE-3CRATE-VERIFY ?auto_3670 ?auto_3671 ?auto_3672 ?auto_3673 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3682 - SURFACE
      ?auto_3683 - SURFACE
    )
    :vars
    (
      ?auto_3684 - HOIST
      ?auto_3686 - PLACE
      ?auto_3690 - SURFACE
      ?auto_3692 - PLACE
      ?auto_3691 - HOIST
      ?auto_3688 - SURFACE
      ?auto_3685 - SURFACE
      ?auto_3693 - SURFACE
      ?auto_3689 - SURFACE
      ?auto_3687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3684 ?auto_3686 ) ( IS-CRATE ?auto_3683 ) ( not ( = ?auto_3682 ?auto_3683 ) ) ( not ( = ?auto_3690 ?auto_3682 ) ) ( not ( = ?auto_3690 ?auto_3683 ) ) ( not ( = ?auto_3692 ?auto_3686 ) ) ( HOIST-AT ?auto_3691 ?auto_3692 ) ( not ( = ?auto_3684 ?auto_3691 ) ) ( SURFACE-AT ?auto_3683 ?auto_3692 ) ( ON ?auto_3683 ?auto_3688 ) ( CLEAR ?auto_3683 ) ( not ( = ?auto_3682 ?auto_3688 ) ) ( not ( = ?auto_3683 ?auto_3688 ) ) ( not ( = ?auto_3690 ?auto_3688 ) ) ( IS-CRATE ?auto_3682 ) ( SURFACE-AT ?auto_3682 ?auto_3692 ) ( ON ?auto_3682 ?auto_3685 ) ( CLEAR ?auto_3682 ) ( not ( = ?auto_3682 ?auto_3685 ) ) ( not ( = ?auto_3683 ?auto_3685 ) ) ( not ( = ?auto_3690 ?auto_3685 ) ) ( not ( = ?auto_3688 ?auto_3685 ) ) ( SURFACE-AT ?auto_3693 ?auto_3686 ) ( CLEAR ?auto_3693 ) ( IS-CRATE ?auto_3690 ) ( not ( = ?auto_3693 ?auto_3690 ) ) ( not ( = ?auto_3682 ?auto_3693 ) ) ( not ( = ?auto_3683 ?auto_3693 ) ) ( not ( = ?auto_3688 ?auto_3693 ) ) ( not ( = ?auto_3685 ?auto_3693 ) ) ( AVAILABLE ?auto_3684 ) ( AVAILABLE ?auto_3691 ) ( SURFACE-AT ?auto_3690 ?auto_3692 ) ( ON ?auto_3690 ?auto_3689 ) ( CLEAR ?auto_3690 ) ( not ( = ?auto_3682 ?auto_3689 ) ) ( not ( = ?auto_3683 ?auto_3689 ) ) ( not ( = ?auto_3690 ?auto_3689 ) ) ( not ( = ?auto_3688 ?auto_3689 ) ) ( not ( = ?auto_3685 ?auto_3689 ) ) ( not ( = ?auto_3693 ?auto_3689 ) ) ( TRUCK-AT ?auto_3687 ?auto_3686 ) )
    :subtasks
    ( ( !DRIVE ?auto_3687 ?auto_3686 ?auto_3692 )
      ( MAKE-2CRATE ?auto_3690 ?auto_3682 ?auto_3683 )
      ( MAKE-1CRATE-VERIFY ?auto_3682 ?auto_3683 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_3694 - SURFACE
      ?auto_3695 - SURFACE
      ?auto_3696 - SURFACE
    )
    :vars
    (
      ?auto_3698 - HOIST
      ?auto_3697 - PLACE
      ?auto_3703 - PLACE
      ?auto_3702 - HOIST
      ?auto_3705 - SURFACE
      ?auto_3701 - SURFACE
      ?auto_3699 - SURFACE
      ?auto_3704 - SURFACE
      ?auto_3700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3698 ?auto_3697 ) ( IS-CRATE ?auto_3696 ) ( not ( = ?auto_3695 ?auto_3696 ) ) ( not ( = ?auto_3694 ?auto_3695 ) ) ( not ( = ?auto_3694 ?auto_3696 ) ) ( not ( = ?auto_3703 ?auto_3697 ) ) ( HOIST-AT ?auto_3702 ?auto_3703 ) ( not ( = ?auto_3698 ?auto_3702 ) ) ( SURFACE-AT ?auto_3696 ?auto_3703 ) ( ON ?auto_3696 ?auto_3705 ) ( CLEAR ?auto_3696 ) ( not ( = ?auto_3695 ?auto_3705 ) ) ( not ( = ?auto_3696 ?auto_3705 ) ) ( not ( = ?auto_3694 ?auto_3705 ) ) ( IS-CRATE ?auto_3695 ) ( SURFACE-AT ?auto_3695 ?auto_3703 ) ( ON ?auto_3695 ?auto_3701 ) ( CLEAR ?auto_3695 ) ( not ( = ?auto_3695 ?auto_3701 ) ) ( not ( = ?auto_3696 ?auto_3701 ) ) ( not ( = ?auto_3694 ?auto_3701 ) ) ( not ( = ?auto_3705 ?auto_3701 ) ) ( SURFACE-AT ?auto_3699 ?auto_3697 ) ( CLEAR ?auto_3699 ) ( IS-CRATE ?auto_3694 ) ( not ( = ?auto_3699 ?auto_3694 ) ) ( not ( = ?auto_3695 ?auto_3699 ) ) ( not ( = ?auto_3696 ?auto_3699 ) ) ( not ( = ?auto_3705 ?auto_3699 ) ) ( not ( = ?auto_3701 ?auto_3699 ) ) ( AVAILABLE ?auto_3698 ) ( AVAILABLE ?auto_3702 ) ( SURFACE-AT ?auto_3694 ?auto_3703 ) ( ON ?auto_3694 ?auto_3704 ) ( CLEAR ?auto_3694 ) ( not ( = ?auto_3695 ?auto_3704 ) ) ( not ( = ?auto_3696 ?auto_3704 ) ) ( not ( = ?auto_3694 ?auto_3704 ) ) ( not ( = ?auto_3705 ?auto_3704 ) ) ( not ( = ?auto_3701 ?auto_3704 ) ) ( not ( = ?auto_3699 ?auto_3704 ) ) ( TRUCK-AT ?auto_3700 ?auto_3697 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_3695 ?auto_3696 )
      ( MAKE-2CRATE-VERIFY ?auto_3694 ?auto_3695 ?auto_3696 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3706 - SURFACE
      ?auto_3707 - SURFACE
      ?auto_3708 - SURFACE
      ?auto_3709 - SURFACE
    )
    :vars
    (
      ?auto_3717 - HOIST
      ?auto_3711 - PLACE
      ?auto_3713 - PLACE
      ?auto_3710 - HOIST
      ?auto_3712 - SURFACE
      ?auto_3716 - SURFACE
      ?auto_3714 - SURFACE
      ?auto_3715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3717 ?auto_3711 ) ( IS-CRATE ?auto_3709 ) ( not ( = ?auto_3708 ?auto_3709 ) ) ( not ( = ?auto_3707 ?auto_3708 ) ) ( not ( = ?auto_3707 ?auto_3709 ) ) ( not ( = ?auto_3713 ?auto_3711 ) ) ( HOIST-AT ?auto_3710 ?auto_3713 ) ( not ( = ?auto_3717 ?auto_3710 ) ) ( SURFACE-AT ?auto_3709 ?auto_3713 ) ( ON ?auto_3709 ?auto_3712 ) ( CLEAR ?auto_3709 ) ( not ( = ?auto_3708 ?auto_3712 ) ) ( not ( = ?auto_3709 ?auto_3712 ) ) ( not ( = ?auto_3707 ?auto_3712 ) ) ( IS-CRATE ?auto_3708 ) ( SURFACE-AT ?auto_3708 ?auto_3713 ) ( ON ?auto_3708 ?auto_3716 ) ( CLEAR ?auto_3708 ) ( not ( = ?auto_3708 ?auto_3716 ) ) ( not ( = ?auto_3709 ?auto_3716 ) ) ( not ( = ?auto_3707 ?auto_3716 ) ) ( not ( = ?auto_3712 ?auto_3716 ) ) ( SURFACE-AT ?auto_3706 ?auto_3711 ) ( CLEAR ?auto_3706 ) ( IS-CRATE ?auto_3707 ) ( not ( = ?auto_3706 ?auto_3707 ) ) ( not ( = ?auto_3708 ?auto_3706 ) ) ( not ( = ?auto_3709 ?auto_3706 ) ) ( not ( = ?auto_3712 ?auto_3706 ) ) ( not ( = ?auto_3716 ?auto_3706 ) ) ( AVAILABLE ?auto_3717 ) ( AVAILABLE ?auto_3710 ) ( SURFACE-AT ?auto_3707 ?auto_3713 ) ( ON ?auto_3707 ?auto_3714 ) ( CLEAR ?auto_3707 ) ( not ( = ?auto_3708 ?auto_3714 ) ) ( not ( = ?auto_3709 ?auto_3714 ) ) ( not ( = ?auto_3707 ?auto_3714 ) ) ( not ( = ?auto_3712 ?auto_3714 ) ) ( not ( = ?auto_3716 ?auto_3714 ) ) ( not ( = ?auto_3706 ?auto_3714 ) ) ( TRUCK-AT ?auto_3715 ?auto_3711 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3707 ?auto_3708 ?auto_3709 )
      ( MAKE-3CRATE-VERIFY ?auto_3706 ?auto_3707 ?auto_3708 ?auto_3709 ) )
  )

)

