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
      ?auto_2961 - SURFACE
      ?auto_2962 - SURFACE
    )
    :vars
    (
      ?auto_2963 - HOIST
      ?auto_2964 - PLACE
      ?auto_2966 - PLACE
      ?auto_2967 - HOIST
      ?auto_2968 - SURFACE
      ?auto_2965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2963 ?auto_2964 ) ( SURFACE-AT ?auto_2961 ?auto_2964 ) ( CLEAR ?auto_2961 ) ( IS-CRATE ?auto_2962 ) ( AVAILABLE ?auto_2963 ) ( not ( = ?auto_2966 ?auto_2964 ) ) ( HOIST-AT ?auto_2967 ?auto_2966 ) ( AVAILABLE ?auto_2967 ) ( SURFACE-AT ?auto_2962 ?auto_2966 ) ( ON ?auto_2962 ?auto_2968 ) ( CLEAR ?auto_2962 ) ( TRUCK-AT ?auto_2965 ?auto_2964 ) ( not ( = ?auto_2961 ?auto_2962 ) ) ( not ( = ?auto_2961 ?auto_2968 ) ) ( not ( = ?auto_2962 ?auto_2968 ) ) ( not ( = ?auto_2963 ?auto_2967 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2965 ?auto_2964 ?auto_2966 )
      ( !LIFT ?auto_2967 ?auto_2962 ?auto_2968 ?auto_2966 )
      ( !LOAD ?auto_2967 ?auto_2962 ?auto_2965 ?auto_2966 )
      ( !DRIVE ?auto_2965 ?auto_2966 ?auto_2964 )
      ( !UNLOAD ?auto_2963 ?auto_2962 ?auto_2965 ?auto_2964 )
      ( !DROP ?auto_2963 ?auto_2962 ?auto_2961 ?auto_2964 )
      ( MAKE-1CRATE-VERIFY ?auto_2961 ?auto_2962 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2971 - SURFACE
      ?auto_2972 - SURFACE
    )
    :vars
    (
      ?auto_2973 - HOIST
      ?auto_2974 - PLACE
      ?auto_2976 - PLACE
      ?auto_2977 - HOIST
      ?auto_2978 - SURFACE
      ?auto_2975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2973 ?auto_2974 ) ( SURFACE-AT ?auto_2971 ?auto_2974 ) ( CLEAR ?auto_2971 ) ( IS-CRATE ?auto_2972 ) ( AVAILABLE ?auto_2973 ) ( not ( = ?auto_2976 ?auto_2974 ) ) ( HOIST-AT ?auto_2977 ?auto_2976 ) ( AVAILABLE ?auto_2977 ) ( SURFACE-AT ?auto_2972 ?auto_2976 ) ( ON ?auto_2972 ?auto_2978 ) ( CLEAR ?auto_2972 ) ( TRUCK-AT ?auto_2975 ?auto_2974 ) ( not ( = ?auto_2971 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2978 ) ) ( not ( = ?auto_2972 ?auto_2978 ) ) ( not ( = ?auto_2973 ?auto_2977 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2975 ?auto_2974 ?auto_2976 )
      ( !LIFT ?auto_2977 ?auto_2972 ?auto_2978 ?auto_2976 )
      ( !LOAD ?auto_2977 ?auto_2972 ?auto_2975 ?auto_2976 )
      ( !DRIVE ?auto_2975 ?auto_2976 ?auto_2974 )
      ( !UNLOAD ?auto_2973 ?auto_2972 ?auto_2975 ?auto_2974 )
      ( !DROP ?auto_2973 ?auto_2972 ?auto_2971 ?auto_2974 )
      ( MAKE-1CRATE-VERIFY ?auto_2971 ?auto_2972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2982 - SURFACE
      ?auto_2983 - SURFACE
      ?auto_2984 - SURFACE
    )
    :vars
    (
      ?auto_2990 - HOIST
      ?auto_2989 - PLACE
      ?auto_2988 - PLACE
      ?auto_2987 - HOIST
      ?auto_2986 - SURFACE
      ?auto_2992 - PLACE
      ?auto_2991 - HOIST
      ?auto_2993 - SURFACE
      ?auto_2985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2990 ?auto_2989 ) ( IS-CRATE ?auto_2984 ) ( not ( = ?auto_2988 ?auto_2989 ) ) ( HOIST-AT ?auto_2987 ?auto_2988 ) ( AVAILABLE ?auto_2987 ) ( SURFACE-AT ?auto_2984 ?auto_2988 ) ( ON ?auto_2984 ?auto_2986 ) ( CLEAR ?auto_2984 ) ( not ( = ?auto_2983 ?auto_2984 ) ) ( not ( = ?auto_2983 ?auto_2986 ) ) ( not ( = ?auto_2984 ?auto_2986 ) ) ( not ( = ?auto_2990 ?auto_2987 ) ) ( SURFACE-AT ?auto_2982 ?auto_2989 ) ( CLEAR ?auto_2982 ) ( IS-CRATE ?auto_2983 ) ( AVAILABLE ?auto_2990 ) ( not ( = ?auto_2992 ?auto_2989 ) ) ( HOIST-AT ?auto_2991 ?auto_2992 ) ( AVAILABLE ?auto_2991 ) ( SURFACE-AT ?auto_2983 ?auto_2992 ) ( ON ?auto_2983 ?auto_2993 ) ( CLEAR ?auto_2983 ) ( TRUCK-AT ?auto_2985 ?auto_2989 ) ( not ( = ?auto_2982 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2993 ) ) ( not ( = ?auto_2983 ?auto_2993 ) ) ( not ( = ?auto_2990 ?auto_2991 ) ) ( not ( = ?auto_2982 ?auto_2984 ) ) ( not ( = ?auto_2982 ?auto_2986 ) ) ( not ( = ?auto_2984 ?auto_2993 ) ) ( not ( = ?auto_2988 ?auto_2992 ) ) ( not ( = ?auto_2987 ?auto_2991 ) ) ( not ( = ?auto_2986 ?auto_2993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2982 ?auto_2983 )
      ( MAKE-1CRATE ?auto_2983 ?auto_2984 )
      ( MAKE-2CRATE-VERIFY ?auto_2982 ?auto_2983 ?auto_2984 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2996 - SURFACE
      ?auto_2997 - SURFACE
    )
    :vars
    (
      ?auto_2998 - HOIST
      ?auto_2999 - PLACE
      ?auto_3001 - PLACE
      ?auto_3002 - HOIST
      ?auto_3003 - SURFACE
      ?auto_3000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2998 ?auto_2999 ) ( SURFACE-AT ?auto_2996 ?auto_2999 ) ( CLEAR ?auto_2996 ) ( IS-CRATE ?auto_2997 ) ( AVAILABLE ?auto_2998 ) ( not ( = ?auto_3001 ?auto_2999 ) ) ( HOIST-AT ?auto_3002 ?auto_3001 ) ( AVAILABLE ?auto_3002 ) ( SURFACE-AT ?auto_2997 ?auto_3001 ) ( ON ?auto_2997 ?auto_3003 ) ( CLEAR ?auto_2997 ) ( TRUCK-AT ?auto_3000 ?auto_2999 ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_3003 ) ) ( not ( = ?auto_2997 ?auto_3003 ) ) ( not ( = ?auto_2998 ?auto_3002 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3000 ?auto_2999 ?auto_3001 )
      ( !LIFT ?auto_3002 ?auto_2997 ?auto_3003 ?auto_3001 )
      ( !LOAD ?auto_3002 ?auto_2997 ?auto_3000 ?auto_3001 )
      ( !DRIVE ?auto_3000 ?auto_3001 ?auto_2999 )
      ( !UNLOAD ?auto_2998 ?auto_2997 ?auto_3000 ?auto_2999 )
      ( !DROP ?auto_2998 ?auto_2997 ?auto_2996 ?auto_2999 )
      ( MAKE-1CRATE-VERIFY ?auto_2996 ?auto_2997 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_3008 - SURFACE
      ?auto_3009 - SURFACE
      ?auto_3010 - SURFACE
      ?auto_3011 - SURFACE
    )
    :vars
    (
      ?auto_3013 - HOIST
      ?auto_3012 - PLACE
      ?auto_3017 - PLACE
      ?auto_3014 - HOIST
      ?auto_3015 - SURFACE
      ?auto_3020 - SURFACE
      ?auto_3018 - PLACE
      ?auto_3019 - HOIST
      ?auto_3021 - SURFACE
      ?auto_3016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3013 ?auto_3012 ) ( IS-CRATE ?auto_3011 ) ( not ( = ?auto_3017 ?auto_3012 ) ) ( HOIST-AT ?auto_3014 ?auto_3017 ) ( SURFACE-AT ?auto_3011 ?auto_3017 ) ( ON ?auto_3011 ?auto_3015 ) ( CLEAR ?auto_3011 ) ( not ( = ?auto_3010 ?auto_3011 ) ) ( not ( = ?auto_3010 ?auto_3015 ) ) ( not ( = ?auto_3011 ?auto_3015 ) ) ( not ( = ?auto_3013 ?auto_3014 ) ) ( IS-CRATE ?auto_3010 ) ( AVAILABLE ?auto_3014 ) ( SURFACE-AT ?auto_3010 ?auto_3017 ) ( ON ?auto_3010 ?auto_3020 ) ( CLEAR ?auto_3010 ) ( not ( = ?auto_3009 ?auto_3010 ) ) ( not ( = ?auto_3009 ?auto_3020 ) ) ( not ( = ?auto_3010 ?auto_3020 ) ) ( SURFACE-AT ?auto_3008 ?auto_3012 ) ( CLEAR ?auto_3008 ) ( IS-CRATE ?auto_3009 ) ( AVAILABLE ?auto_3013 ) ( not ( = ?auto_3018 ?auto_3012 ) ) ( HOIST-AT ?auto_3019 ?auto_3018 ) ( AVAILABLE ?auto_3019 ) ( SURFACE-AT ?auto_3009 ?auto_3018 ) ( ON ?auto_3009 ?auto_3021 ) ( CLEAR ?auto_3009 ) ( TRUCK-AT ?auto_3016 ?auto_3012 ) ( not ( = ?auto_3008 ?auto_3009 ) ) ( not ( = ?auto_3008 ?auto_3021 ) ) ( not ( = ?auto_3009 ?auto_3021 ) ) ( not ( = ?auto_3013 ?auto_3019 ) ) ( not ( = ?auto_3008 ?auto_3010 ) ) ( not ( = ?auto_3008 ?auto_3020 ) ) ( not ( = ?auto_3010 ?auto_3021 ) ) ( not ( = ?auto_3017 ?auto_3018 ) ) ( not ( = ?auto_3014 ?auto_3019 ) ) ( not ( = ?auto_3020 ?auto_3021 ) ) ( not ( = ?auto_3008 ?auto_3011 ) ) ( not ( = ?auto_3008 ?auto_3015 ) ) ( not ( = ?auto_3009 ?auto_3011 ) ) ( not ( = ?auto_3009 ?auto_3015 ) ) ( not ( = ?auto_3011 ?auto_3020 ) ) ( not ( = ?auto_3011 ?auto_3021 ) ) ( not ( = ?auto_3015 ?auto_3020 ) ) ( not ( = ?auto_3015 ?auto_3021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3008 ?auto_3009 ?auto_3010 )
      ( MAKE-1CRATE ?auto_3010 ?auto_3011 )
      ( MAKE-3CRATE-VERIFY ?auto_3008 ?auto_3009 ?auto_3010 ?auto_3011 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3024 - SURFACE
      ?auto_3025 - SURFACE
    )
    :vars
    (
      ?auto_3026 - HOIST
      ?auto_3027 - PLACE
      ?auto_3029 - PLACE
      ?auto_3030 - HOIST
      ?auto_3031 - SURFACE
      ?auto_3028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3026 ?auto_3027 ) ( SURFACE-AT ?auto_3024 ?auto_3027 ) ( CLEAR ?auto_3024 ) ( IS-CRATE ?auto_3025 ) ( AVAILABLE ?auto_3026 ) ( not ( = ?auto_3029 ?auto_3027 ) ) ( HOIST-AT ?auto_3030 ?auto_3029 ) ( AVAILABLE ?auto_3030 ) ( SURFACE-AT ?auto_3025 ?auto_3029 ) ( ON ?auto_3025 ?auto_3031 ) ( CLEAR ?auto_3025 ) ( TRUCK-AT ?auto_3028 ?auto_3027 ) ( not ( = ?auto_3024 ?auto_3025 ) ) ( not ( = ?auto_3024 ?auto_3031 ) ) ( not ( = ?auto_3025 ?auto_3031 ) ) ( not ( = ?auto_3026 ?auto_3030 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3028 ?auto_3027 ?auto_3029 )
      ( !LIFT ?auto_3030 ?auto_3025 ?auto_3031 ?auto_3029 )
      ( !LOAD ?auto_3030 ?auto_3025 ?auto_3028 ?auto_3029 )
      ( !DRIVE ?auto_3028 ?auto_3029 ?auto_3027 )
      ( !UNLOAD ?auto_3026 ?auto_3025 ?auto_3028 ?auto_3027 )
      ( !DROP ?auto_3026 ?auto_3025 ?auto_3024 ?auto_3027 )
      ( MAKE-1CRATE-VERIFY ?auto_3024 ?auto_3025 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3037 - SURFACE
      ?auto_3038 - SURFACE
      ?auto_3039 - SURFACE
      ?auto_3040 - SURFACE
      ?auto_3041 - SURFACE
    )
    :vars
    (
      ?auto_3045 - HOIST
      ?auto_3046 - PLACE
      ?auto_3044 - PLACE
      ?auto_3043 - HOIST
      ?auto_3047 - SURFACE
      ?auto_3050 - PLACE
      ?auto_3054 - HOIST
      ?auto_3048 - SURFACE
      ?auto_3052 - SURFACE
      ?auto_3051 - PLACE
      ?auto_3053 - HOIST
      ?auto_3049 - SURFACE
      ?auto_3042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3045 ?auto_3046 ) ( IS-CRATE ?auto_3041 ) ( not ( = ?auto_3044 ?auto_3046 ) ) ( HOIST-AT ?auto_3043 ?auto_3044 ) ( AVAILABLE ?auto_3043 ) ( SURFACE-AT ?auto_3041 ?auto_3044 ) ( ON ?auto_3041 ?auto_3047 ) ( CLEAR ?auto_3041 ) ( not ( = ?auto_3040 ?auto_3041 ) ) ( not ( = ?auto_3040 ?auto_3047 ) ) ( not ( = ?auto_3041 ?auto_3047 ) ) ( not ( = ?auto_3045 ?auto_3043 ) ) ( IS-CRATE ?auto_3040 ) ( not ( = ?auto_3050 ?auto_3046 ) ) ( HOIST-AT ?auto_3054 ?auto_3050 ) ( SURFACE-AT ?auto_3040 ?auto_3050 ) ( ON ?auto_3040 ?auto_3048 ) ( CLEAR ?auto_3040 ) ( not ( = ?auto_3039 ?auto_3040 ) ) ( not ( = ?auto_3039 ?auto_3048 ) ) ( not ( = ?auto_3040 ?auto_3048 ) ) ( not ( = ?auto_3045 ?auto_3054 ) ) ( IS-CRATE ?auto_3039 ) ( AVAILABLE ?auto_3054 ) ( SURFACE-AT ?auto_3039 ?auto_3050 ) ( ON ?auto_3039 ?auto_3052 ) ( CLEAR ?auto_3039 ) ( not ( = ?auto_3038 ?auto_3039 ) ) ( not ( = ?auto_3038 ?auto_3052 ) ) ( not ( = ?auto_3039 ?auto_3052 ) ) ( SURFACE-AT ?auto_3037 ?auto_3046 ) ( CLEAR ?auto_3037 ) ( IS-CRATE ?auto_3038 ) ( AVAILABLE ?auto_3045 ) ( not ( = ?auto_3051 ?auto_3046 ) ) ( HOIST-AT ?auto_3053 ?auto_3051 ) ( AVAILABLE ?auto_3053 ) ( SURFACE-AT ?auto_3038 ?auto_3051 ) ( ON ?auto_3038 ?auto_3049 ) ( CLEAR ?auto_3038 ) ( TRUCK-AT ?auto_3042 ?auto_3046 ) ( not ( = ?auto_3037 ?auto_3038 ) ) ( not ( = ?auto_3037 ?auto_3049 ) ) ( not ( = ?auto_3038 ?auto_3049 ) ) ( not ( = ?auto_3045 ?auto_3053 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3052 ) ) ( not ( = ?auto_3039 ?auto_3049 ) ) ( not ( = ?auto_3050 ?auto_3051 ) ) ( not ( = ?auto_3054 ?auto_3053 ) ) ( not ( = ?auto_3052 ?auto_3049 ) ) ( not ( = ?auto_3037 ?auto_3040 ) ) ( not ( = ?auto_3037 ?auto_3048 ) ) ( not ( = ?auto_3038 ?auto_3040 ) ) ( not ( = ?auto_3038 ?auto_3048 ) ) ( not ( = ?auto_3040 ?auto_3052 ) ) ( not ( = ?auto_3040 ?auto_3049 ) ) ( not ( = ?auto_3048 ?auto_3052 ) ) ( not ( = ?auto_3048 ?auto_3049 ) ) ( not ( = ?auto_3037 ?auto_3041 ) ) ( not ( = ?auto_3037 ?auto_3047 ) ) ( not ( = ?auto_3038 ?auto_3041 ) ) ( not ( = ?auto_3038 ?auto_3047 ) ) ( not ( = ?auto_3039 ?auto_3041 ) ) ( not ( = ?auto_3039 ?auto_3047 ) ) ( not ( = ?auto_3041 ?auto_3048 ) ) ( not ( = ?auto_3041 ?auto_3052 ) ) ( not ( = ?auto_3041 ?auto_3049 ) ) ( not ( = ?auto_3044 ?auto_3050 ) ) ( not ( = ?auto_3044 ?auto_3051 ) ) ( not ( = ?auto_3043 ?auto_3054 ) ) ( not ( = ?auto_3043 ?auto_3053 ) ) ( not ( = ?auto_3047 ?auto_3048 ) ) ( not ( = ?auto_3047 ?auto_3052 ) ) ( not ( = ?auto_3047 ?auto_3049 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3037 ?auto_3038 ?auto_3039 ?auto_3040 )
      ( MAKE-1CRATE ?auto_3040 ?auto_3041 )
      ( MAKE-4CRATE-VERIFY ?auto_3037 ?auto_3038 ?auto_3039 ?auto_3040 ?auto_3041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3057 - SURFACE
      ?auto_3058 - SURFACE
    )
    :vars
    (
      ?auto_3059 - HOIST
      ?auto_3060 - PLACE
      ?auto_3062 - PLACE
      ?auto_3063 - HOIST
      ?auto_3064 - SURFACE
      ?auto_3061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3059 ?auto_3060 ) ( SURFACE-AT ?auto_3057 ?auto_3060 ) ( CLEAR ?auto_3057 ) ( IS-CRATE ?auto_3058 ) ( AVAILABLE ?auto_3059 ) ( not ( = ?auto_3062 ?auto_3060 ) ) ( HOIST-AT ?auto_3063 ?auto_3062 ) ( AVAILABLE ?auto_3063 ) ( SURFACE-AT ?auto_3058 ?auto_3062 ) ( ON ?auto_3058 ?auto_3064 ) ( CLEAR ?auto_3058 ) ( TRUCK-AT ?auto_3061 ?auto_3060 ) ( not ( = ?auto_3057 ?auto_3058 ) ) ( not ( = ?auto_3057 ?auto_3064 ) ) ( not ( = ?auto_3058 ?auto_3064 ) ) ( not ( = ?auto_3059 ?auto_3063 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3061 ?auto_3060 ?auto_3062 )
      ( !LIFT ?auto_3063 ?auto_3058 ?auto_3064 ?auto_3062 )
      ( !LOAD ?auto_3063 ?auto_3058 ?auto_3061 ?auto_3062 )
      ( !DRIVE ?auto_3061 ?auto_3062 ?auto_3060 )
      ( !UNLOAD ?auto_3059 ?auto_3058 ?auto_3061 ?auto_3060 )
      ( !DROP ?auto_3059 ?auto_3058 ?auto_3057 ?auto_3060 )
      ( MAKE-1CRATE-VERIFY ?auto_3057 ?auto_3058 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3071 - SURFACE
      ?auto_3072 - SURFACE
      ?auto_3073 - SURFACE
      ?auto_3074 - SURFACE
      ?auto_3075 - SURFACE
      ?auto_3076 - SURFACE
    )
    :vars
    (
      ?auto_3078 - HOIST
      ?auto_3081 - PLACE
      ?auto_3082 - PLACE
      ?auto_3080 - HOIST
      ?auto_3079 - SURFACE
      ?auto_3083 - SURFACE
      ?auto_3089 - PLACE
      ?auto_3087 - HOIST
      ?auto_3090 - SURFACE
      ?auto_3086 - SURFACE
      ?auto_3085 - PLACE
      ?auto_3088 - HOIST
      ?auto_3084 - SURFACE
      ?auto_3077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3078 ?auto_3081 ) ( IS-CRATE ?auto_3076 ) ( not ( = ?auto_3082 ?auto_3081 ) ) ( HOIST-AT ?auto_3080 ?auto_3082 ) ( SURFACE-AT ?auto_3076 ?auto_3082 ) ( ON ?auto_3076 ?auto_3079 ) ( CLEAR ?auto_3076 ) ( not ( = ?auto_3075 ?auto_3076 ) ) ( not ( = ?auto_3075 ?auto_3079 ) ) ( not ( = ?auto_3076 ?auto_3079 ) ) ( not ( = ?auto_3078 ?auto_3080 ) ) ( IS-CRATE ?auto_3075 ) ( AVAILABLE ?auto_3080 ) ( SURFACE-AT ?auto_3075 ?auto_3082 ) ( ON ?auto_3075 ?auto_3083 ) ( CLEAR ?auto_3075 ) ( not ( = ?auto_3074 ?auto_3075 ) ) ( not ( = ?auto_3074 ?auto_3083 ) ) ( not ( = ?auto_3075 ?auto_3083 ) ) ( IS-CRATE ?auto_3074 ) ( not ( = ?auto_3089 ?auto_3081 ) ) ( HOIST-AT ?auto_3087 ?auto_3089 ) ( SURFACE-AT ?auto_3074 ?auto_3089 ) ( ON ?auto_3074 ?auto_3090 ) ( CLEAR ?auto_3074 ) ( not ( = ?auto_3073 ?auto_3074 ) ) ( not ( = ?auto_3073 ?auto_3090 ) ) ( not ( = ?auto_3074 ?auto_3090 ) ) ( not ( = ?auto_3078 ?auto_3087 ) ) ( IS-CRATE ?auto_3073 ) ( AVAILABLE ?auto_3087 ) ( SURFACE-AT ?auto_3073 ?auto_3089 ) ( ON ?auto_3073 ?auto_3086 ) ( CLEAR ?auto_3073 ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3086 ) ) ( not ( = ?auto_3073 ?auto_3086 ) ) ( SURFACE-AT ?auto_3071 ?auto_3081 ) ( CLEAR ?auto_3071 ) ( IS-CRATE ?auto_3072 ) ( AVAILABLE ?auto_3078 ) ( not ( = ?auto_3085 ?auto_3081 ) ) ( HOIST-AT ?auto_3088 ?auto_3085 ) ( AVAILABLE ?auto_3088 ) ( SURFACE-AT ?auto_3072 ?auto_3085 ) ( ON ?auto_3072 ?auto_3084 ) ( CLEAR ?auto_3072 ) ( TRUCK-AT ?auto_3077 ?auto_3081 ) ( not ( = ?auto_3071 ?auto_3072 ) ) ( not ( = ?auto_3071 ?auto_3084 ) ) ( not ( = ?auto_3072 ?auto_3084 ) ) ( not ( = ?auto_3078 ?auto_3088 ) ) ( not ( = ?auto_3071 ?auto_3073 ) ) ( not ( = ?auto_3071 ?auto_3086 ) ) ( not ( = ?auto_3073 ?auto_3084 ) ) ( not ( = ?auto_3089 ?auto_3085 ) ) ( not ( = ?auto_3087 ?auto_3088 ) ) ( not ( = ?auto_3086 ?auto_3084 ) ) ( not ( = ?auto_3071 ?auto_3074 ) ) ( not ( = ?auto_3071 ?auto_3090 ) ) ( not ( = ?auto_3072 ?auto_3074 ) ) ( not ( = ?auto_3072 ?auto_3090 ) ) ( not ( = ?auto_3074 ?auto_3086 ) ) ( not ( = ?auto_3074 ?auto_3084 ) ) ( not ( = ?auto_3090 ?auto_3086 ) ) ( not ( = ?auto_3090 ?auto_3084 ) ) ( not ( = ?auto_3071 ?auto_3075 ) ) ( not ( = ?auto_3071 ?auto_3083 ) ) ( not ( = ?auto_3072 ?auto_3075 ) ) ( not ( = ?auto_3072 ?auto_3083 ) ) ( not ( = ?auto_3073 ?auto_3075 ) ) ( not ( = ?auto_3073 ?auto_3083 ) ) ( not ( = ?auto_3075 ?auto_3090 ) ) ( not ( = ?auto_3075 ?auto_3086 ) ) ( not ( = ?auto_3075 ?auto_3084 ) ) ( not ( = ?auto_3082 ?auto_3089 ) ) ( not ( = ?auto_3082 ?auto_3085 ) ) ( not ( = ?auto_3080 ?auto_3087 ) ) ( not ( = ?auto_3080 ?auto_3088 ) ) ( not ( = ?auto_3083 ?auto_3090 ) ) ( not ( = ?auto_3083 ?auto_3086 ) ) ( not ( = ?auto_3083 ?auto_3084 ) ) ( not ( = ?auto_3071 ?auto_3076 ) ) ( not ( = ?auto_3071 ?auto_3079 ) ) ( not ( = ?auto_3072 ?auto_3076 ) ) ( not ( = ?auto_3072 ?auto_3079 ) ) ( not ( = ?auto_3073 ?auto_3076 ) ) ( not ( = ?auto_3073 ?auto_3079 ) ) ( not ( = ?auto_3074 ?auto_3076 ) ) ( not ( = ?auto_3074 ?auto_3079 ) ) ( not ( = ?auto_3076 ?auto_3083 ) ) ( not ( = ?auto_3076 ?auto_3090 ) ) ( not ( = ?auto_3076 ?auto_3086 ) ) ( not ( = ?auto_3076 ?auto_3084 ) ) ( not ( = ?auto_3079 ?auto_3083 ) ) ( not ( = ?auto_3079 ?auto_3090 ) ) ( not ( = ?auto_3079 ?auto_3086 ) ) ( not ( = ?auto_3079 ?auto_3084 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3071 ?auto_3072 ?auto_3073 ?auto_3074 ?auto_3075 )
      ( MAKE-1CRATE ?auto_3075 ?auto_3076 )
      ( MAKE-5CRATE-VERIFY ?auto_3071 ?auto_3072 ?auto_3073 ?auto_3074 ?auto_3075 ?auto_3076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3093 - SURFACE
      ?auto_3094 - SURFACE
    )
    :vars
    (
      ?auto_3095 - HOIST
      ?auto_3096 - PLACE
      ?auto_3098 - PLACE
      ?auto_3099 - HOIST
      ?auto_3100 - SURFACE
      ?auto_3097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3095 ?auto_3096 ) ( SURFACE-AT ?auto_3093 ?auto_3096 ) ( CLEAR ?auto_3093 ) ( IS-CRATE ?auto_3094 ) ( AVAILABLE ?auto_3095 ) ( not ( = ?auto_3098 ?auto_3096 ) ) ( HOIST-AT ?auto_3099 ?auto_3098 ) ( AVAILABLE ?auto_3099 ) ( SURFACE-AT ?auto_3094 ?auto_3098 ) ( ON ?auto_3094 ?auto_3100 ) ( CLEAR ?auto_3094 ) ( TRUCK-AT ?auto_3097 ?auto_3096 ) ( not ( = ?auto_3093 ?auto_3094 ) ) ( not ( = ?auto_3093 ?auto_3100 ) ) ( not ( = ?auto_3094 ?auto_3100 ) ) ( not ( = ?auto_3095 ?auto_3099 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3097 ?auto_3096 ?auto_3098 )
      ( !LIFT ?auto_3099 ?auto_3094 ?auto_3100 ?auto_3098 )
      ( !LOAD ?auto_3099 ?auto_3094 ?auto_3097 ?auto_3098 )
      ( !DRIVE ?auto_3097 ?auto_3098 ?auto_3096 )
      ( !UNLOAD ?auto_3095 ?auto_3094 ?auto_3097 ?auto_3096 )
      ( !DROP ?auto_3095 ?auto_3094 ?auto_3093 ?auto_3096 )
      ( MAKE-1CRATE-VERIFY ?auto_3093 ?auto_3094 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3108 - SURFACE
      ?auto_3109 - SURFACE
      ?auto_3110 - SURFACE
      ?auto_3111 - SURFACE
      ?auto_3112 - SURFACE
      ?auto_3113 - SURFACE
      ?auto_3114 - SURFACE
    )
    :vars
    (
      ?auto_3119 - HOIST
      ?auto_3118 - PLACE
      ?auto_3120 - PLACE
      ?auto_3115 - HOIST
      ?auto_3116 - SURFACE
      ?auto_3129 - PLACE
      ?auto_3122 - HOIST
      ?auto_3121 - SURFACE
      ?auto_3127 - SURFACE
      ?auto_3125 - PLACE
      ?auto_3123 - HOIST
      ?auto_3126 - SURFACE
      ?auto_3128 - SURFACE
      ?auto_3124 - SURFACE
      ?auto_3117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3119 ?auto_3118 ) ( IS-CRATE ?auto_3114 ) ( not ( = ?auto_3120 ?auto_3118 ) ) ( HOIST-AT ?auto_3115 ?auto_3120 ) ( SURFACE-AT ?auto_3114 ?auto_3120 ) ( ON ?auto_3114 ?auto_3116 ) ( CLEAR ?auto_3114 ) ( not ( = ?auto_3113 ?auto_3114 ) ) ( not ( = ?auto_3113 ?auto_3116 ) ) ( not ( = ?auto_3114 ?auto_3116 ) ) ( not ( = ?auto_3119 ?auto_3115 ) ) ( IS-CRATE ?auto_3113 ) ( not ( = ?auto_3129 ?auto_3118 ) ) ( HOIST-AT ?auto_3122 ?auto_3129 ) ( SURFACE-AT ?auto_3113 ?auto_3129 ) ( ON ?auto_3113 ?auto_3121 ) ( CLEAR ?auto_3113 ) ( not ( = ?auto_3112 ?auto_3113 ) ) ( not ( = ?auto_3112 ?auto_3121 ) ) ( not ( = ?auto_3113 ?auto_3121 ) ) ( not ( = ?auto_3119 ?auto_3122 ) ) ( IS-CRATE ?auto_3112 ) ( AVAILABLE ?auto_3122 ) ( SURFACE-AT ?auto_3112 ?auto_3129 ) ( ON ?auto_3112 ?auto_3127 ) ( CLEAR ?auto_3112 ) ( not ( = ?auto_3111 ?auto_3112 ) ) ( not ( = ?auto_3111 ?auto_3127 ) ) ( not ( = ?auto_3112 ?auto_3127 ) ) ( IS-CRATE ?auto_3111 ) ( not ( = ?auto_3125 ?auto_3118 ) ) ( HOIST-AT ?auto_3123 ?auto_3125 ) ( SURFACE-AT ?auto_3111 ?auto_3125 ) ( ON ?auto_3111 ?auto_3126 ) ( CLEAR ?auto_3111 ) ( not ( = ?auto_3110 ?auto_3111 ) ) ( not ( = ?auto_3110 ?auto_3126 ) ) ( not ( = ?auto_3111 ?auto_3126 ) ) ( not ( = ?auto_3119 ?auto_3123 ) ) ( IS-CRATE ?auto_3110 ) ( AVAILABLE ?auto_3123 ) ( SURFACE-AT ?auto_3110 ?auto_3125 ) ( ON ?auto_3110 ?auto_3128 ) ( CLEAR ?auto_3110 ) ( not ( = ?auto_3109 ?auto_3110 ) ) ( not ( = ?auto_3109 ?auto_3128 ) ) ( not ( = ?auto_3110 ?auto_3128 ) ) ( SURFACE-AT ?auto_3108 ?auto_3118 ) ( CLEAR ?auto_3108 ) ( IS-CRATE ?auto_3109 ) ( AVAILABLE ?auto_3119 ) ( AVAILABLE ?auto_3115 ) ( SURFACE-AT ?auto_3109 ?auto_3120 ) ( ON ?auto_3109 ?auto_3124 ) ( CLEAR ?auto_3109 ) ( TRUCK-AT ?auto_3117 ?auto_3118 ) ( not ( = ?auto_3108 ?auto_3109 ) ) ( not ( = ?auto_3108 ?auto_3124 ) ) ( not ( = ?auto_3109 ?auto_3124 ) ) ( not ( = ?auto_3108 ?auto_3110 ) ) ( not ( = ?auto_3108 ?auto_3128 ) ) ( not ( = ?auto_3110 ?auto_3124 ) ) ( not ( = ?auto_3125 ?auto_3120 ) ) ( not ( = ?auto_3123 ?auto_3115 ) ) ( not ( = ?auto_3128 ?auto_3124 ) ) ( not ( = ?auto_3108 ?auto_3111 ) ) ( not ( = ?auto_3108 ?auto_3126 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3109 ?auto_3126 ) ) ( not ( = ?auto_3111 ?auto_3128 ) ) ( not ( = ?auto_3111 ?auto_3124 ) ) ( not ( = ?auto_3126 ?auto_3128 ) ) ( not ( = ?auto_3126 ?auto_3124 ) ) ( not ( = ?auto_3108 ?auto_3112 ) ) ( not ( = ?auto_3108 ?auto_3127 ) ) ( not ( = ?auto_3109 ?auto_3112 ) ) ( not ( = ?auto_3109 ?auto_3127 ) ) ( not ( = ?auto_3110 ?auto_3112 ) ) ( not ( = ?auto_3110 ?auto_3127 ) ) ( not ( = ?auto_3112 ?auto_3126 ) ) ( not ( = ?auto_3112 ?auto_3128 ) ) ( not ( = ?auto_3112 ?auto_3124 ) ) ( not ( = ?auto_3129 ?auto_3125 ) ) ( not ( = ?auto_3129 ?auto_3120 ) ) ( not ( = ?auto_3122 ?auto_3123 ) ) ( not ( = ?auto_3122 ?auto_3115 ) ) ( not ( = ?auto_3127 ?auto_3126 ) ) ( not ( = ?auto_3127 ?auto_3128 ) ) ( not ( = ?auto_3127 ?auto_3124 ) ) ( not ( = ?auto_3108 ?auto_3113 ) ) ( not ( = ?auto_3108 ?auto_3121 ) ) ( not ( = ?auto_3109 ?auto_3113 ) ) ( not ( = ?auto_3109 ?auto_3121 ) ) ( not ( = ?auto_3110 ?auto_3113 ) ) ( not ( = ?auto_3110 ?auto_3121 ) ) ( not ( = ?auto_3111 ?auto_3113 ) ) ( not ( = ?auto_3111 ?auto_3121 ) ) ( not ( = ?auto_3113 ?auto_3127 ) ) ( not ( = ?auto_3113 ?auto_3126 ) ) ( not ( = ?auto_3113 ?auto_3128 ) ) ( not ( = ?auto_3113 ?auto_3124 ) ) ( not ( = ?auto_3121 ?auto_3127 ) ) ( not ( = ?auto_3121 ?auto_3126 ) ) ( not ( = ?auto_3121 ?auto_3128 ) ) ( not ( = ?auto_3121 ?auto_3124 ) ) ( not ( = ?auto_3108 ?auto_3114 ) ) ( not ( = ?auto_3108 ?auto_3116 ) ) ( not ( = ?auto_3109 ?auto_3114 ) ) ( not ( = ?auto_3109 ?auto_3116 ) ) ( not ( = ?auto_3110 ?auto_3114 ) ) ( not ( = ?auto_3110 ?auto_3116 ) ) ( not ( = ?auto_3111 ?auto_3114 ) ) ( not ( = ?auto_3111 ?auto_3116 ) ) ( not ( = ?auto_3112 ?auto_3114 ) ) ( not ( = ?auto_3112 ?auto_3116 ) ) ( not ( = ?auto_3114 ?auto_3121 ) ) ( not ( = ?auto_3114 ?auto_3127 ) ) ( not ( = ?auto_3114 ?auto_3126 ) ) ( not ( = ?auto_3114 ?auto_3128 ) ) ( not ( = ?auto_3114 ?auto_3124 ) ) ( not ( = ?auto_3116 ?auto_3121 ) ) ( not ( = ?auto_3116 ?auto_3127 ) ) ( not ( = ?auto_3116 ?auto_3126 ) ) ( not ( = ?auto_3116 ?auto_3128 ) ) ( not ( = ?auto_3116 ?auto_3124 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3108 ?auto_3109 ?auto_3110 ?auto_3111 ?auto_3112 ?auto_3113 )
      ( MAKE-1CRATE ?auto_3113 ?auto_3114 )
      ( MAKE-6CRATE-VERIFY ?auto_3108 ?auto_3109 ?auto_3110 ?auto_3111 ?auto_3112 ?auto_3113 ?auto_3114 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3132 - SURFACE
      ?auto_3133 - SURFACE
    )
    :vars
    (
      ?auto_3134 - HOIST
      ?auto_3135 - PLACE
      ?auto_3137 - PLACE
      ?auto_3138 - HOIST
      ?auto_3139 - SURFACE
      ?auto_3136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3134 ?auto_3135 ) ( SURFACE-AT ?auto_3132 ?auto_3135 ) ( CLEAR ?auto_3132 ) ( IS-CRATE ?auto_3133 ) ( AVAILABLE ?auto_3134 ) ( not ( = ?auto_3137 ?auto_3135 ) ) ( HOIST-AT ?auto_3138 ?auto_3137 ) ( AVAILABLE ?auto_3138 ) ( SURFACE-AT ?auto_3133 ?auto_3137 ) ( ON ?auto_3133 ?auto_3139 ) ( CLEAR ?auto_3133 ) ( TRUCK-AT ?auto_3136 ?auto_3135 ) ( not ( = ?auto_3132 ?auto_3133 ) ) ( not ( = ?auto_3132 ?auto_3139 ) ) ( not ( = ?auto_3133 ?auto_3139 ) ) ( not ( = ?auto_3134 ?auto_3138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3136 ?auto_3135 ?auto_3137 )
      ( !LIFT ?auto_3138 ?auto_3133 ?auto_3139 ?auto_3137 )
      ( !LOAD ?auto_3138 ?auto_3133 ?auto_3136 ?auto_3137 )
      ( !DRIVE ?auto_3136 ?auto_3137 ?auto_3135 )
      ( !UNLOAD ?auto_3134 ?auto_3133 ?auto_3136 ?auto_3135 )
      ( !DROP ?auto_3134 ?auto_3133 ?auto_3132 ?auto_3135 )
      ( MAKE-1CRATE-VERIFY ?auto_3132 ?auto_3133 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3148 - SURFACE
      ?auto_3149 - SURFACE
      ?auto_3150 - SURFACE
      ?auto_3151 - SURFACE
      ?auto_3152 - SURFACE
      ?auto_3153 - SURFACE
      ?auto_3155 - SURFACE
      ?auto_3154 - SURFACE
    )
    :vars
    (
      ?auto_3158 - HOIST
      ?auto_3157 - PLACE
      ?auto_3156 - PLACE
      ?auto_3160 - HOIST
      ?auto_3159 - SURFACE
      ?auto_3163 - PLACE
      ?auto_3170 - HOIST
      ?auto_3164 - SURFACE
      ?auto_3165 - PLACE
      ?auto_3171 - HOIST
      ?auto_3169 - SURFACE
      ?auto_3166 - SURFACE
      ?auto_3168 - SURFACE
      ?auto_3167 - SURFACE
      ?auto_3162 - SURFACE
      ?auto_3161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3158 ?auto_3157 ) ( IS-CRATE ?auto_3154 ) ( not ( = ?auto_3156 ?auto_3157 ) ) ( HOIST-AT ?auto_3160 ?auto_3156 ) ( SURFACE-AT ?auto_3154 ?auto_3156 ) ( ON ?auto_3154 ?auto_3159 ) ( CLEAR ?auto_3154 ) ( not ( = ?auto_3155 ?auto_3154 ) ) ( not ( = ?auto_3155 ?auto_3159 ) ) ( not ( = ?auto_3154 ?auto_3159 ) ) ( not ( = ?auto_3158 ?auto_3160 ) ) ( IS-CRATE ?auto_3155 ) ( not ( = ?auto_3163 ?auto_3157 ) ) ( HOIST-AT ?auto_3170 ?auto_3163 ) ( SURFACE-AT ?auto_3155 ?auto_3163 ) ( ON ?auto_3155 ?auto_3164 ) ( CLEAR ?auto_3155 ) ( not ( = ?auto_3153 ?auto_3155 ) ) ( not ( = ?auto_3153 ?auto_3164 ) ) ( not ( = ?auto_3155 ?auto_3164 ) ) ( not ( = ?auto_3158 ?auto_3170 ) ) ( IS-CRATE ?auto_3153 ) ( not ( = ?auto_3165 ?auto_3157 ) ) ( HOIST-AT ?auto_3171 ?auto_3165 ) ( SURFACE-AT ?auto_3153 ?auto_3165 ) ( ON ?auto_3153 ?auto_3169 ) ( CLEAR ?auto_3153 ) ( not ( = ?auto_3152 ?auto_3153 ) ) ( not ( = ?auto_3152 ?auto_3169 ) ) ( not ( = ?auto_3153 ?auto_3169 ) ) ( not ( = ?auto_3158 ?auto_3171 ) ) ( IS-CRATE ?auto_3152 ) ( AVAILABLE ?auto_3171 ) ( SURFACE-AT ?auto_3152 ?auto_3165 ) ( ON ?auto_3152 ?auto_3166 ) ( CLEAR ?auto_3152 ) ( not ( = ?auto_3151 ?auto_3152 ) ) ( not ( = ?auto_3151 ?auto_3166 ) ) ( not ( = ?auto_3152 ?auto_3166 ) ) ( IS-CRATE ?auto_3151 ) ( SURFACE-AT ?auto_3151 ?auto_3156 ) ( ON ?auto_3151 ?auto_3168 ) ( CLEAR ?auto_3151 ) ( not ( = ?auto_3150 ?auto_3151 ) ) ( not ( = ?auto_3150 ?auto_3168 ) ) ( not ( = ?auto_3151 ?auto_3168 ) ) ( IS-CRATE ?auto_3150 ) ( AVAILABLE ?auto_3160 ) ( SURFACE-AT ?auto_3150 ?auto_3156 ) ( ON ?auto_3150 ?auto_3167 ) ( CLEAR ?auto_3150 ) ( not ( = ?auto_3149 ?auto_3150 ) ) ( not ( = ?auto_3149 ?auto_3167 ) ) ( not ( = ?auto_3150 ?auto_3167 ) ) ( SURFACE-AT ?auto_3148 ?auto_3157 ) ( CLEAR ?auto_3148 ) ( IS-CRATE ?auto_3149 ) ( AVAILABLE ?auto_3158 ) ( AVAILABLE ?auto_3170 ) ( SURFACE-AT ?auto_3149 ?auto_3163 ) ( ON ?auto_3149 ?auto_3162 ) ( CLEAR ?auto_3149 ) ( TRUCK-AT ?auto_3161 ?auto_3157 ) ( not ( = ?auto_3148 ?auto_3149 ) ) ( not ( = ?auto_3148 ?auto_3162 ) ) ( not ( = ?auto_3149 ?auto_3162 ) ) ( not ( = ?auto_3148 ?auto_3150 ) ) ( not ( = ?auto_3148 ?auto_3167 ) ) ( not ( = ?auto_3150 ?auto_3162 ) ) ( not ( = ?auto_3156 ?auto_3163 ) ) ( not ( = ?auto_3160 ?auto_3170 ) ) ( not ( = ?auto_3167 ?auto_3162 ) ) ( not ( = ?auto_3148 ?auto_3151 ) ) ( not ( = ?auto_3148 ?auto_3168 ) ) ( not ( = ?auto_3149 ?auto_3151 ) ) ( not ( = ?auto_3149 ?auto_3168 ) ) ( not ( = ?auto_3151 ?auto_3167 ) ) ( not ( = ?auto_3151 ?auto_3162 ) ) ( not ( = ?auto_3168 ?auto_3167 ) ) ( not ( = ?auto_3168 ?auto_3162 ) ) ( not ( = ?auto_3148 ?auto_3152 ) ) ( not ( = ?auto_3148 ?auto_3166 ) ) ( not ( = ?auto_3149 ?auto_3152 ) ) ( not ( = ?auto_3149 ?auto_3166 ) ) ( not ( = ?auto_3150 ?auto_3152 ) ) ( not ( = ?auto_3150 ?auto_3166 ) ) ( not ( = ?auto_3152 ?auto_3168 ) ) ( not ( = ?auto_3152 ?auto_3167 ) ) ( not ( = ?auto_3152 ?auto_3162 ) ) ( not ( = ?auto_3165 ?auto_3156 ) ) ( not ( = ?auto_3165 ?auto_3163 ) ) ( not ( = ?auto_3171 ?auto_3160 ) ) ( not ( = ?auto_3171 ?auto_3170 ) ) ( not ( = ?auto_3166 ?auto_3168 ) ) ( not ( = ?auto_3166 ?auto_3167 ) ) ( not ( = ?auto_3166 ?auto_3162 ) ) ( not ( = ?auto_3148 ?auto_3153 ) ) ( not ( = ?auto_3148 ?auto_3169 ) ) ( not ( = ?auto_3149 ?auto_3153 ) ) ( not ( = ?auto_3149 ?auto_3169 ) ) ( not ( = ?auto_3150 ?auto_3153 ) ) ( not ( = ?auto_3150 ?auto_3169 ) ) ( not ( = ?auto_3151 ?auto_3153 ) ) ( not ( = ?auto_3151 ?auto_3169 ) ) ( not ( = ?auto_3153 ?auto_3166 ) ) ( not ( = ?auto_3153 ?auto_3168 ) ) ( not ( = ?auto_3153 ?auto_3167 ) ) ( not ( = ?auto_3153 ?auto_3162 ) ) ( not ( = ?auto_3169 ?auto_3166 ) ) ( not ( = ?auto_3169 ?auto_3168 ) ) ( not ( = ?auto_3169 ?auto_3167 ) ) ( not ( = ?auto_3169 ?auto_3162 ) ) ( not ( = ?auto_3148 ?auto_3155 ) ) ( not ( = ?auto_3148 ?auto_3164 ) ) ( not ( = ?auto_3149 ?auto_3155 ) ) ( not ( = ?auto_3149 ?auto_3164 ) ) ( not ( = ?auto_3150 ?auto_3155 ) ) ( not ( = ?auto_3150 ?auto_3164 ) ) ( not ( = ?auto_3151 ?auto_3155 ) ) ( not ( = ?auto_3151 ?auto_3164 ) ) ( not ( = ?auto_3152 ?auto_3155 ) ) ( not ( = ?auto_3152 ?auto_3164 ) ) ( not ( = ?auto_3155 ?auto_3169 ) ) ( not ( = ?auto_3155 ?auto_3166 ) ) ( not ( = ?auto_3155 ?auto_3168 ) ) ( not ( = ?auto_3155 ?auto_3167 ) ) ( not ( = ?auto_3155 ?auto_3162 ) ) ( not ( = ?auto_3164 ?auto_3169 ) ) ( not ( = ?auto_3164 ?auto_3166 ) ) ( not ( = ?auto_3164 ?auto_3168 ) ) ( not ( = ?auto_3164 ?auto_3167 ) ) ( not ( = ?auto_3164 ?auto_3162 ) ) ( not ( = ?auto_3148 ?auto_3154 ) ) ( not ( = ?auto_3148 ?auto_3159 ) ) ( not ( = ?auto_3149 ?auto_3154 ) ) ( not ( = ?auto_3149 ?auto_3159 ) ) ( not ( = ?auto_3150 ?auto_3154 ) ) ( not ( = ?auto_3150 ?auto_3159 ) ) ( not ( = ?auto_3151 ?auto_3154 ) ) ( not ( = ?auto_3151 ?auto_3159 ) ) ( not ( = ?auto_3152 ?auto_3154 ) ) ( not ( = ?auto_3152 ?auto_3159 ) ) ( not ( = ?auto_3153 ?auto_3154 ) ) ( not ( = ?auto_3153 ?auto_3159 ) ) ( not ( = ?auto_3154 ?auto_3164 ) ) ( not ( = ?auto_3154 ?auto_3169 ) ) ( not ( = ?auto_3154 ?auto_3166 ) ) ( not ( = ?auto_3154 ?auto_3168 ) ) ( not ( = ?auto_3154 ?auto_3167 ) ) ( not ( = ?auto_3154 ?auto_3162 ) ) ( not ( = ?auto_3159 ?auto_3164 ) ) ( not ( = ?auto_3159 ?auto_3169 ) ) ( not ( = ?auto_3159 ?auto_3166 ) ) ( not ( = ?auto_3159 ?auto_3168 ) ) ( not ( = ?auto_3159 ?auto_3167 ) ) ( not ( = ?auto_3159 ?auto_3162 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3148 ?auto_3149 ?auto_3150 ?auto_3151 ?auto_3152 ?auto_3153 ?auto_3155 )
      ( MAKE-1CRATE ?auto_3155 ?auto_3154 )
      ( MAKE-7CRATE-VERIFY ?auto_3148 ?auto_3149 ?auto_3150 ?auto_3151 ?auto_3152 ?auto_3153 ?auto_3155 ?auto_3154 ) )
  )

)

