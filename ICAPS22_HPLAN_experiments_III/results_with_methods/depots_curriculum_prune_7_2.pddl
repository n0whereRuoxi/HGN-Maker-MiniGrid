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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2982 - SURFACE
      ?auto_2983 - SURFACE
      ?auto_2984 - SURFACE
    )
    :vars
    (
      ?auto_2987 - HOIST
      ?auto_2988 - PLACE
      ?auto_2989 - PLACE
      ?auto_2990 - HOIST
      ?auto_2985 - SURFACE
      ?auto_2992 - PLACE
      ?auto_2991 - HOIST
      ?auto_2993 - SURFACE
      ?auto_2986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2987 ?auto_2988 ) ( IS-CRATE ?auto_2984 ) ( not ( = ?auto_2989 ?auto_2988 ) ) ( HOIST-AT ?auto_2990 ?auto_2989 ) ( AVAILABLE ?auto_2990 ) ( SURFACE-AT ?auto_2984 ?auto_2989 ) ( ON ?auto_2984 ?auto_2985 ) ( CLEAR ?auto_2984 ) ( not ( = ?auto_2983 ?auto_2984 ) ) ( not ( = ?auto_2983 ?auto_2985 ) ) ( not ( = ?auto_2984 ?auto_2985 ) ) ( not ( = ?auto_2987 ?auto_2990 ) ) ( SURFACE-AT ?auto_2982 ?auto_2988 ) ( CLEAR ?auto_2982 ) ( IS-CRATE ?auto_2983 ) ( AVAILABLE ?auto_2987 ) ( not ( = ?auto_2992 ?auto_2988 ) ) ( HOIST-AT ?auto_2991 ?auto_2992 ) ( AVAILABLE ?auto_2991 ) ( SURFACE-AT ?auto_2983 ?auto_2992 ) ( ON ?auto_2983 ?auto_2993 ) ( CLEAR ?auto_2983 ) ( TRUCK-AT ?auto_2986 ?auto_2988 ) ( not ( = ?auto_2982 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2993 ) ) ( not ( = ?auto_2983 ?auto_2993 ) ) ( not ( = ?auto_2987 ?auto_2991 ) ) ( not ( = ?auto_2982 ?auto_2984 ) ) ( not ( = ?auto_2982 ?auto_2985 ) ) ( not ( = ?auto_2984 ?auto_2993 ) ) ( not ( = ?auto_2989 ?auto_2992 ) ) ( not ( = ?auto_2990 ?auto_2991 ) ) ( not ( = ?auto_2985 ?auto_2993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2982 ?auto_2983 )
      ( MAKE-1CRATE ?auto_2983 ?auto_2984 )
      ( MAKE-2CRATE-VERIFY ?auto_2982 ?auto_2983 ?auto_2984 ) )
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
      ?auto_3014 - HOIST
      ?auto_3017 - PLACE
      ?auto_3015 - PLACE
      ?auto_3012 - HOIST
      ?auto_3013 - SURFACE
      ?auto_3021 - SURFACE
      ?auto_3019 - PLACE
      ?auto_3020 - HOIST
      ?auto_3018 - SURFACE
      ?auto_3016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3014 ?auto_3017 ) ( IS-CRATE ?auto_3011 ) ( not ( = ?auto_3015 ?auto_3017 ) ) ( HOIST-AT ?auto_3012 ?auto_3015 ) ( SURFACE-AT ?auto_3011 ?auto_3015 ) ( ON ?auto_3011 ?auto_3013 ) ( CLEAR ?auto_3011 ) ( not ( = ?auto_3010 ?auto_3011 ) ) ( not ( = ?auto_3010 ?auto_3013 ) ) ( not ( = ?auto_3011 ?auto_3013 ) ) ( not ( = ?auto_3014 ?auto_3012 ) ) ( IS-CRATE ?auto_3010 ) ( AVAILABLE ?auto_3012 ) ( SURFACE-AT ?auto_3010 ?auto_3015 ) ( ON ?auto_3010 ?auto_3021 ) ( CLEAR ?auto_3010 ) ( not ( = ?auto_3009 ?auto_3010 ) ) ( not ( = ?auto_3009 ?auto_3021 ) ) ( not ( = ?auto_3010 ?auto_3021 ) ) ( SURFACE-AT ?auto_3008 ?auto_3017 ) ( CLEAR ?auto_3008 ) ( IS-CRATE ?auto_3009 ) ( AVAILABLE ?auto_3014 ) ( not ( = ?auto_3019 ?auto_3017 ) ) ( HOIST-AT ?auto_3020 ?auto_3019 ) ( AVAILABLE ?auto_3020 ) ( SURFACE-AT ?auto_3009 ?auto_3019 ) ( ON ?auto_3009 ?auto_3018 ) ( CLEAR ?auto_3009 ) ( TRUCK-AT ?auto_3016 ?auto_3017 ) ( not ( = ?auto_3008 ?auto_3009 ) ) ( not ( = ?auto_3008 ?auto_3018 ) ) ( not ( = ?auto_3009 ?auto_3018 ) ) ( not ( = ?auto_3014 ?auto_3020 ) ) ( not ( = ?auto_3008 ?auto_3010 ) ) ( not ( = ?auto_3008 ?auto_3021 ) ) ( not ( = ?auto_3010 ?auto_3018 ) ) ( not ( = ?auto_3015 ?auto_3019 ) ) ( not ( = ?auto_3012 ?auto_3020 ) ) ( not ( = ?auto_3021 ?auto_3018 ) ) ( not ( = ?auto_3008 ?auto_3011 ) ) ( not ( = ?auto_3008 ?auto_3013 ) ) ( not ( = ?auto_3009 ?auto_3011 ) ) ( not ( = ?auto_3009 ?auto_3013 ) ) ( not ( = ?auto_3011 ?auto_3021 ) ) ( not ( = ?auto_3011 ?auto_3018 ) ) ( not ( = ?auto_3013 ?auto_3021 ) ) ( not ( = ?auto_3013 ?auto_3018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_3008 ?auto_3009 ?auto_3010 )
      ( MAKE-1CRATE ?auto_3010 ?auto_3011 )
      ( MAKE-3CRATE-VERIFY ?auto_3008 ?auto_3009 ?auto_3010 ?auto_3011 ) )
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
      ?auto_3043 - HOIST
      ?auto_3046 - PLACE
      ?auto_3044 - PLACE
      ?auto_3045 - HOIST
      ?auto_3042 - SURFACE
      ?auto_3054 - PLACE
      ?auto_3053 - HOIST
      ?auto_3048 - SURFACE
      ?auto_3051 - SURFACE
      ?auto_3050 - PLACE
      ?auto_3052 - HOIST
      ?auto_3049 - SURFACE
      ?auto_3047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3043 ?auto_3046 ) ( IS-CRATE ?auto_3041 ) ( not ( = ?auto_3044 ?auto_3046 ) ) ( HOIST-AT ?auto_3045 ?auto_3044 ) ( AVAILABLE ?auto_3045 ) ( SURFACE-AT ?auto_3041 ?auto_3044 ) ( ON ?auto_3041 ?auto_3042 ) ( CLEAR ?auto_3041 ) ( not ( = ?auto_3040 ?auto_3041 ) ) ( not ( = ?auto_3040 ?auto_3042 ) ) ( not ( = ?auto_3041 ?auto_3042 ) ) ( not ( = ?auto_3043 ?auto_3045 ) ) ( IS-CRATE ?auto_3040 ) ( not ( = ?auto_3054 ?auto_3046 ) ) ( HOIST-AT ?auto_3053 ?auto_3054 ) ( SURFACE-AT ?auto_3040 ?auto_3054 ) ( ON ?auto_3040 ?auto_3048 ) ( CLEAR ?auto_3040 ) ( not ( = ?auto_3039 ?auto_3040 ) ) ( not ( = ?auto_3039 ?auto_3048 ) ) ( not ( = ?auto_3040 ?auto_3048 ) ) ( not ( = ?auto_3043 ?auto_3053 ) ) ( IS-CRATE ?auto_3039 ) ( AVAILABLE ?auto_3053 ) ( SURFACE-AT ?auto_3039 ?auto_3054 ) ( ON ?auto_3039 ?auto_3051 ) ( CLEAR ?auto_3039 ) ( not ( = ?auto_3038 ?auto_3039 ) ) ( not ( = ?auto_3038 ?auto_3051 ) ) ( not ( = ?auto_3039 ?auto_3051 ) ) ( SURFACE-AT ?auto_3037 ?auto_3046 ) ( CLEAR ?auto_3037 ) ( IS-CRATE ?auto_3038 ) ( AVAILABLE ?auto_3043 ) ( not ( = ?auto_3050 ?auto_3046 ) ) ( HOIST-AT ?auto_3052 ?auto_3050 ) ( AVAILABLE ?auto_3052 ) ( SURFACE-AT ?auto_3038 ?auto_3050 ) ( ON ?auto_3038 ?auto_3049 ) ( CLEAR ?auto_3038 ) ( TRUCK-AT ?auto_3047 ?auto_3046 ) ( not ( = ?auto_3037 ?auto_3038 ) ) ( not ( = ?auto_3037 ?auto_3049 ) ) ( not ( = ?auto_3038 ?auto_3049 ) ) ( not ( = ?auto_3043 ?auto_3052 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3051 ) ) ( not ( = ?auto_3039 ?auto_3049 ) ) ( not ( = ?auto_3054 ?auto_3050 ) ) ( not ( = ?auto_3053 ?auto_3052 ) ) ( not ( = ?auto_3051 ?auto_3049 ) ) ( not ( = ?auto_3037 ?auto_3040 ) ) ( not ( = ?auto_3037 ?auto_3048 ) ) ( not ( = ?auto_3038 ?auto_3040 ) ) ( not ( = ?auto_3038 ?auto_3048 ) ) ( not ( = ?auto_3040 ?auto_3051 ) ) ( not ( = ?auto_3040 ?auto_3049 ) ) ( not ( = ?auto_3048 ?auto_3051 ) ) ( not ( = ?auto_3048 ?auto_3049 ) ) ( not ( = ?auto_3037 ?auto_3041 ) ) ( not ( = ?auto_3037 ?auto_3042 ) ) ( not ( = ?auto_3038 ?auto_3041 ) ) ( not ( = ?auto_3038 ?auto_3042 ) ) ( not ( = ?auto_3039 ?auto_3041 ) ) ( not ( = ?auto_3039 ?auto_3042 ) ) ( not ( = ?auto_3041 ?auto_3048 ) ) ( not ( = ?auto_3041 ?auto_3051 ) ) ( not ( = ?auto_3041 ?auto_3049 ) ) ( not ( = ?auto_3044 ?auto_3054 ) ) ( not ( = ?auto_3044 ?auto_3050 ) ) ( not ( = ?auto_3045 ?auto_3053 ) ) ( not ( = ?auto_3045 ?auto_3052 ) ) ( not ( = ?auto_3042 ?auto_3048 ) ) ( not ( = ?auto_3042 ?auto_3051 ) ) ( not ( = ?auto_3042 ?auto_3049 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3037 ?auto_3038 ?auto_3039 ?auto_3040 )
      ( MAKE-1CRATE ?auto_3040 ?auto_3041 )
      ( MAKE-4CRATE-VERIFY ?auto_3037 ?auto_3038 ?auto_3039 ?auto_3040 ?auto_3041 ) )
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
      ?auto_3079 - HOIST
      ?auto_3081 - PLACE
      ?auto_3080 - PLACE
      ?auto_3082 - HOIST
      ?auto_3078 - SURFACE
      ?auto_3083 - SURFACE
      ?auto_3090 - PLACE
      ?auto_3085 - HOIST
      ?auto_3086 - SURFACE
      ?auto_3089 - SURFACE
      ?auto_3087 - PLACE
      ?auto_3084 - HOIST
      ?auto_3088 - SURFACE
      ?auto_3077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3079 ?auto_3081 ) ( IS-CRATE ?auto_3076 ) ( not ( = ?auto_3080 ?auto_3081 ) ) ( HOIST-AT ?auto_3082 ?auto_3080 ) ( SURFACE-AT ?auto_3076 ?auto_3080 ) ( ON ?auto_3076 ?auto_3078 ) ( CLEAR ?auto_3076 ) ( not ( = ?auto_3075 ?auto_3076 ) ) ( not ( = ?auto_3075 ?auto_3078 ) ) ( not ( = ?auto_3076 ?auto_3078 ) ) ( not ( = ?auto_3079 ?auto_3082 ) ) ( IS-CRATE ?auto_3075 ) ( AVAILABLE ?auto_3082 ) ( SURFACE-AT ?auto_3075 ?auto_3080 ) ( ON ?auto_3075 ?auto_3083 ) ( CLEAR ?auto_3075 ) ( not ( = ?auto_3074 ?auto_3075 ) ) ( not ( = ?auto_3074 ?auto_3083 ) ) ( not ( = ?auto_3075 ?auto_3083 ) ) ( IS-CRATE ?auto_3074 ) ( not ( = ?auto_3090 ?auto_3081 ) ) ( HOIST-AT ?auto_3085 ?auto_3090 ) ( SURFACE-AT ?auto_3074 ?auto_3090 ) ( ON ?auto_3074 ?auto_3086 ) ( CLEAR ?auto_3074 ) ( not ( = ?auto_3073 ?auto_3074 ) ) ( not ( = ?auto_3073 ?auto_3086 ) ) ( not ( = ?auto_3074 ?auto_3086 ) ) ( not ( = ?auto_3079 ?auto_3085 ) ) ( IS-CRATE ?auto_3073 ) ( AVAILABLE ?auto_3085 ) ( SURFACE-AT ?auto_3073 ?auto_3090 ) ( ON ?auto_3073 ?auto_3089 ) ( CLEAR ?auto_3073 ) ( not ( = ?auto_3072 ?auto_3073 ) ) ( not ( = ?auto_3072 ?auto_3089 ) ) ( not ( = ?auto_3073 ?auto_3089 ) ) ( SURFACE-AT ?auto_3071 ?auto_3081 ) ( CLEAR ?auto_3071 ) ( IS-CRATE ?auto_3072 ) ( AVAILABLE ?auto_3079 ) ( not ( = ?auto_3087 ?auto_3081 ) ) ( HOIST-AT ?auto_3084 ?auto_3087 ) ( AVAILABLE ?auto_3084 ) ( SURFACE-AT ?auto_3072 ?auto_3087 ) ( ON ?auto_3072 ?auto_3088 ) ( CLEAR ?auto_3072 ) ( TRUCK-AT ?auto_3077 ?auto_3081 ) ( not ( = ?auto_3071 ?auto_3072 ) ) ( not ( = ?auto_3071 ?auto_3088 ) ) ( not ( = ?auto_3072 ?auto_3088 ) ) ( not ( = ?auto_3079 ?auto_3084 ) ) ( not ( = ?auto_3071 ?auto_3073 ) ) ( not ( = ?auto_3071 ?auto_3089 ) ) ( not ( = ?auto_3073 ?auto_3088 ) ) ( not ( = ?auto_3090 ?auto_3087 ) ) ( not ( = ?auto_3085 ?auto_3084 ) ) ( not ( = ?auto_3089 ?auto_3088 ) ) ( not ( = ?auto_3071 ?auto_3074 ) ) ( not ( = ?auto_3071 ?auto_3086 ) ) ( not ( = ?auto_3072 ?auto_3074 ) ) ( not ( = ?auto_3072 ?auto_3086 ) ) ( not ( = ?auto_3074 ?auto_3089 ) ) ( not ( = ?auto_3074 ?auto_3088 ) ) ( not ( = ?auto_3086 ?auto_3089 ) ) ( not ( = ?auto_3086 ?auto_3088 ) ) ( not ( = ?auto_3071 ?auto_3075 ) ) ( not ( = ?auto_3071 ?auto_3083 ) ) ( not ( = ?auto_3072 ?auto_3075 ) ) ( not ( = ?auto_3072 ?auto_3083 ) ) ( not ( = ?auto_3073 ?auto_3075 ) ) ( not ( = ?auto_3073 ?auto_3083 ) ) ( not ( = ?auto_3075 ?auto_3086 ) ) ( not ( = ?auto_3075 ?auto_3089 ) ) ( not ( = ?auto_3075 ?auto_3088 ) ) ( not ( = ?auto_3080 ?auto_3090 ) ) ( not ( = ?auto_3080 ?auto_3087 ) ) ( not ( = ?auto_3082 ?auto_3085 ) ) ( not ( = ?auto_3082 ?auto_3084 ) ) ( not ( = ?auto_3083 ?auto_3086 ) ) ( not ( = ?auto_3083 ?auto_3089 ) ) ( not ( = ?auto_3083 ?auto_3088 ) ) ( not ( = ?auto_3071 ?auto_3076 ) ) ( not ( = ?auto_3071 ?auto_3078 ) ) ( not ( = ?auto_3072 ?auto_3076 ) ) ( not ( = ?auto_3072 ?auto_3078 ) ) ( not ( = ?auto_3073 ?auto_3076 ) ) ( not ( = ?auto_3073 ?auto_3078 ) ) ( not ( = ?auto_3074 ?auto_3076 ) ) ( not ( = ?auto_3074 ?auto_3078 ) ) ( not ( = ?auto_3076 ?auto_3083 ) ) ( not ( = ?auto_3076 ?auto_3086 ) ) ( not ( = ?auto_3076 ?auto_3089 ) ) ( not ( = ?auto_3076 ?auto_3088 ) ) ( not ( = ?auto_3078 ?auto_3083 ) ) ( not ( = ?auto_3078 ?auto_3086 ) ) ( not ( = ?auto_3078 ?auto_3089 ) ) ( not ( = ?auto_3078 ?auto_3088 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3071 ?auto_3072 ?auto_3073 ?auto_3074 ?auto_3075 )
      ( MAKE-1CRATE ?auto_3075 ?auto_3076 )
      ( MAKE-5CRATE-VERIFY ?auto_3071 ?auto_3072 ?auto_3073 ?auto_3074 ?auto_3075 ?auto_3076 ) )
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
      ?auto_3116 - HOIST
      ?auto_3119 - PLACE
      ?auto_3120 - PLACE
      ?auto_3115 - HOIST
      ?auto_3117 - SURFACE
      ?auto_3123 - PLACE
      ?auto_3126 - HOIST
      ?auto_3122 - SURFACE
      ?auto_3124 - SURFACE
      ?auto_3129 - PLACE
      ?auto_3121 - HOIST
      ?auto_3125 - SURFACE
      ?auto_3128 - SURFACE
      ?auto_3127 - SURFACE
      ?auto_3118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3116 ?auto_3119 ) ( IS-CRATE ?auto_3114 ) ( not ( = ?auto_3120 ?auto_3119 ) ) ( HOIST-AT ?auto_3115 ?auto_3120 ) ( SURFACE-AT ?auto_3114 ?auto_3120 ) ( ON ?auto_3114 ?auto_3117 ) ( CLEAR ?auto_3114 ) ( not ( = ?auto_3113 ?auto_3114 ) ) ( not ( = ?auto_3113 ?auto_3117 ) ) ( not ( = ?auto_3114 ?auto_3117 ) ) ( not ( = ?auto_3116 ?auto_3115 ) ) ( IS-CRATE ?auto_3113 ) ( not ( = ?auto_3123 ?auto_3119 ) ) ( HOIST-AT ?auto_3126 ?auto_3123 ) ( SURFACE-AT ?auto_3113 ?auto_3123 ) ( ON ?auto_3113 ?auto_3122 ) ( CLEAR ?auto_3113 ) ( not ( = ?auto_3112 ?auto_3113 ) ) ( not ( = ?auto_3112 ?auto_3122 ) ) ( not ( = ?auto_3113 ?auto_3122 ) ) ( not ( = ?auto_3116 ?auto_3126 ) ) ( IS-CRATE ?auto_3112 ) ( AVAILABLE ?auto_3126 ) ( SURFACE-AT ?auto_3112 ?auto_3123 ) ( ON ?auto_3112 ?auto_3124 ) ( CLEAR ?auto_3112 ) ( not ( = ?auto_3111 ?auto_3112 ) ) ( not ( = ?auto_3111 ?auto_3124 ) ) ( not ( = ?auto_3112 ?auto_3124 ) ) ( IS-CRATE ?auto_3111 ) ( not ( = ?auto_3129 ?auto_3119 ) ) ( HOIST-AT ?auto_3121 ?auto_3129 ) ( SURFACE-AT ?auto_3111 ?auto_3129 ) ( ON ?auto_3111 ?auto_3125 ) ( CLEAR ?auto_3111 ) ( not ( = ?auto_3110 ?auto_3111 ) ) ( not ( = ?auto_3110 ?auto_3125 ) ) ( not ( = ?auto_3111 ?auto_3125 ) ) ( not ( = ?auto_3116 ?auto_3121 ) ) ( IS-CRATE ?auto_3110 ) ( AVAILABLE ?auto_3121 ) ( SURFACE-AT ?auto_3110 ?auto_3129 ) ( ON ?auto_3110 ?auto_3128 ) ( CLEAR ?auto_3110 ) ( not ( = ?auto_3109 ?auto_3110 ) ) ( not ( = ?auto_3109 ?auto_3128 ) ) ( not ( = ?auto_3110 ?auto_3128 ) ) ( SURFACE-AT ?auto_3108 ?auto_3119 ) ( CLEAR ?auto_3108 ) ( IS-CRATE ?auto_3109 ) ( AVAILABLE ?auto_3116 ) ( AVAILABLE ?auto_3115 ) ( SURFACE-AT ?auto_3109 ?auto_3120 ) ( ON ?auto_3109 ?auto_3127 ) ( CLEAR ?auto_3109 ) ( TRUCK-AT ?auto_3118 ?auto_3119 ) ( not ( = ?auto_3108 ?auto_3109 ) ) ( not ( = ?auto_3108 ?auto_3127 ) ) ( not ( = ?auto_3109 ?auto_3127 ) ) ( not ( = ?auto_3108 ?auto_3110 ) ) ( not ( = ?auto_3108 ?auto_3128 ) ) ( not ( = ?auto_3110 ?auto_3127 ) ) ( not ( = ?auto_3129 ?auto_3120 ) ) ( not ( = ?auto_3121 ?auto_3115 ) ) ( not ( = ?auto_3128 ?auto_3127 ) ) ( not ( = ?auto_3108 ?auto_3111 ) ) ( not ( = ?auto_3108 ?auto_3125 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3109 ?auto_3125 ) ) ( not ( = ?auto_3111 ?auto_3128 ) ) ( not ( = ?auto_3111 ?auto_3127 ) ) ( not ( = ?auto_3125 ?auto_3128 ) ) ( not ( = ?auto_3125 ?auto_3127 ) ) ( not ( = ?auto_3108 ?auto_3112 ) ) ( not ( = ?auto_3108 ?auto_3124 ) ) ( not ( = ?auto_3109 ?auto_3112 ) ) ( not ( = ?auto_3109 ?auto_3124 ) ) ( not ( = ?auto_3110 ?auto_3112 ) ) ( not ( = ?auto_3110 ?auto_3124 ) ) ( not ( = ?auto_3112 ?auto_3125 ) ) ( not ( = ?auto_3112 ?auto_3128 ) ) ( not ( = ?auto_3112 ?auto_3127 ) ) ( not ( = ?auto_3123 ?auto_3129 ) ) ( not ( = ?auto_3123 ?auto_3120 ) ) ( not ( = ?auto_3126 ?auto_3121 ) ) ( not ( = ?auto_3126 ?auto_3115 ) ) ( not ( = ?auto_3124 ?auto_3125 ) ) ( not ( = ?auto_3124 ?auto_3128 ) ) ( not ( = ?auto_3124 ?auto_3127 ) ) ( not ( = ?auto_3108 ?auto_3113 ) ) ( not ( = ?auto_3108 ?auto_3122 ) ) ( not ( = ?auto_3109 ?auto_3113 ) ) ( not ( = ?auto_3109 ?auto_3122 ) ) ( not ( = ?auto_3110 ?auto_3113 ) ) ( not ( = ?auto_3110 ?auto_3122 ) ) ( not ( = ?auto_3111 ?auto_3113 ) ) ( not ( = ?auto_3111 ?auto_3122 ) ) ( not ( = ?auto_3113 ?auto_3124 ) ) ( not ( = ?auto_3113 ?auto_3125 ) ) ( not ( = ?auto_3113 ?auto_3128 ) ) ( not ( = ?auto_3113 ?auto_3127 ) ) ( not ( = ?auto_3122 ?auto_3124 ) ) ( not ( = ?auto_3122 ?auto_3125 ) ) ( not ( = ?auto_3122 ?auto_3128 ) ) ( not ( = ?auto_3122 ?auto_3127 ) ) ( not ( = ?auto_3108 ?auto_3114 ) ) ( not ( = ?auto_3108 ?auto_3117 ) ) ( not ( = ?auto_3109 ?auto_3114 ) ) ( not ( = ?auto_3109 ?auto_3117 ) ) ( not ( = ?auto_3110 ?auto_3114 ) ) ( not ( = ?auto_3110 ?auto_3117 ) ) ( not ( = ?auto_3111 ?auto_3114 ) ) ( not ( = ?auto_3111 ?auto_3117 ) ) ( not ( = ?auto_3112 ?auto_3114 ) ) ( not ( = ?auto_3112 ?auto_3117 ) ) ( not ( = ?auto_3114 ?auto_3122 ) ) ( not ( = ?auto_3114 ?auto_3124 ) ) ( not ( = ?auto_3114 ?auto_3125 ) ) ( not ( = ?auto_3114 ?auto_3128 ) ) ( not ( = ?auto_3114 ?auto_3127 ) ) ( not ( = ?auto_3117 ?auto_3122 ) ) ( not ( = ?auto_3117 ?auto_3124 ) ) ( not ( = ?auto_3117 ?auto_3125 ) ) ( not ( = ?auto_3117 ?auto_3128 ) ) ( not ( = ?auto_3117 ?auto_3127 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3108 ?auto_3109 ?auto_3110 ?auto_3111 ?auto_3112 ?auto_3113 )
      ( MAKE-1CRATE ?auto_3113 ?auto_3114 )
      ( MAKE-6CRATE-VERIFY ?auto_3108 ?auto_3109 ?auto_3110 ?auto_3111 ?auto_3112 ?auto_3113 ?auto_3114 ) )
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
      ?auto_3154 - SURFACE
      ?auto_3155 - SURFACE
    )
    :vars
    (
      ?auto_3161 - HOIST
      ?auto_3157 - PLACE
      ?auto_3158 - PLACE
      ?auto_3156 - HOIST
      ?auto_3159 - SURFACE
      ?auto_3170 - PLACE
      ?auto_3168 - HOIST
      ?auto_3165 - SURFACE
      ?auto_3169 - PLACE
      ?auto_3167 - HOIST
      ?auto_3162 - SURFACE
      ?auto_3163 - SURFACE
      ?auto_3166 - SURFACE
      ?auto_3164 - SURFACE
      ?auto_3171 - SURFACE
      ?auto_3160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3161 ?auto_3157 ) ( IS-CRATE ?auto_3155 ) ( not ( = ?auto_3158 ?auto_3157 ) ) ( HOIST-AT ?auto_3156 ?auto_3158 ) ( SURFACE-AT ?auto_3155 ?auto_3158 ) ( ON ?auto_3155 ?auto_3159 ) ( CLEAR ?auto_3155 ) ( not ( = ?auto_3154 ?auto_3155 ) ) ( not ( = ?auto_3154 ?auto_3159 ) ) ( not ( = ?auto_3155 ?auto_3159 ) ) ( not ( = ?auto_3161 ?auto_3156 ) ) ( IS-CRATE ?auto_3154 ) ( not ( = ?auto_3170 ?auto_3157 ) ) ( HOIST-AT ?auto_3168 ?auto_3170 ) ( SURFACE-AT ?auto_3154 ?auto_3170 ) ( ON ?auto_3154 ?auto_3165 ) ( CLEAR ?auto_3154 ) ( not ( = ?auto_3153 ?auto_3154 ) ) ( not ( = ?auto_3153 ?auto_3165 ) ) ( not ( = ?auto_3154 ?auto_3165 ) ) ( not ( = ?auto_3161 ?auto_3168 ) ) ( IS-CRATE ?auto_3153 ) ( not ( = ?auto_3169 ?auto_3157 ) ) ( HOIST-AT ?auto_3167 ?auto_3169 ) ( SURFACE-AT ?auto_3153 ?auto_3169 ) ( ON ?auto_3153 ?auto_3162 ) ( CLEAR ?auto_3153 ) ( not ( = ?auto_3152 ?auto_3153 ) ) ( not ( = ?auto_3152 ?auto_3162 ) ) ( not ( = ?auto_3153 ?auto_3162 ) ) ( not ( = ?auto_3161 ?auto_3167 ) ) ( IS-CRATE ?auto_3152 ) ( AVAILABLE ?auto_3167 ) ( SURFACE-AT ?auto_3152 ?auto_3169 ) ( ON ?auto_3152 ?auto_3163 ) ( CLEAR ?auto_3152 ) ( not ( = ?auto_3151 ?auto_3152 ) ) ( not ( = ?auto_3151 ?auto_3163 ) ) ( not ( = ?auto_3152 ?auto_3163 ) ) ( IS-CRATE ?auto_3151 ) ( SURFACE-AT ?auto_3151 ?auto_3158 ) ( ON ?auto_3151 ?auto_3166 ) ( CLEAR ?auto_3151 ) ( not ( = ?auto_3150 ?auto_3151 ) ) ( not ( = ?auto_3150 ?auto_3166 ) ) ( not ( = ?auto_3151 ?auto_3166 ) ) ( IS-CRATE ?auto_3150 ) ( AVAILABLE ?auto_3156 ) ( SURFACE-AT ?auto_3150 ?auto_3158 ) ( ON ?auto_3150 ?auto_3164 ) ( CLEAR ?auto_3150 ) ( not ( = ?auto_3149 ?auto_3150 ) ) ( not ( = ?auto_3149 ?auto_3164 ) ) ( not ( = ?auto_3150 ?auto_3164 ) ) ( SURFACE-AT ?auto_3148 ?auto_3157 ) ( CLEAR ?auto_3148 ) ( IS-CRATE ?auto_3149 ) ( AVAILABLE ?auto_3161 ) ( AVAILABLE ?auto_3168 ) ( SURFACE-AT ?auto_3149 ?auto_3170 ) ( ON ?auto_3149 ?auto_3171 ) ( CLEAR ?auto_3149 ) ( TRUCK-AT ?auto_3160 ?auto_3157 ) ( not ( = ?auto_3148 ?auto_3149 ) ) ( not ( = ?auto_3148 ?auto_3171 ) ) ( not ( = ?auto_3149 ?auto_3171 ) ) ( not ( = ?auto_3148 ?auto_3150 ) ) ( not ( = ?auto_3148 ?auto_3164 ) ) ( not ( = ?auto_3150 ?auto_3171 ) ) ( not ( = ?auto_3158 ?auto_3170 ) ) ( not ( = ?auto_3156 ?auto_3168 ) ) ( not ( = ?auto_3164 ?auto_3171 ) ) ( not ( = ?auto_3148 ?auto_3151 ) ) ( not ( = ?auto_3148 ?auto_3166 ) ) ( not ( = ?auto_3149 ?auto_3151 ) ) ( not ( = ?auto_3149 ?auto_3166 ) ) ( not ( = ?auto_3151 ?auto_3164 ) ) ( not ( = ?auto_3151 ?auto_3171 ) ) ( not ( = ?auto_3166 ?auto_3164 ) ) ( not ( = ?auto_3166 ?auto_3171 ) ) ( not ( = ?auto_3148 ?auto_3152 ) ) ( not ( = ?auto_3148 ?auto_3163 ) ) ( not ( = ?auto_3149 ?auto_3152 ) ) ( not ( = ?auto_3149 ?auto_3163 ) ) ( not ( = ?auto_3150 ?auto_3152 ) ) ( not ( = ?auto_3150 ?auto_3163 ) ) ( not ( = ?auto_3152 ?auto_3166 ) ) ( not ( = ?auto_3152 ?auto_3164 ) ) ( not ( = ?auto_3152 ?auto_3171 ) ) ( not ( = ?auto_3169 ?auto_3158 ) ) ( not ( = ?auto_3169 ?auto_3170 ) ) ( not ( = ?auto_3167 ?auto_3156 ) ) ( not ( = ?auto_3167 ?auto_3168 ) ) ( not ( = ?auto_3163 ?auto_3166 ) ) ( not ( = ?auto_3163 ?auto_3164 ) ) ( not ( = ?auto_3163 ?auto_3171 ) ) ( not ( = ?auto_3148 ?auto_3153 ) ) ( not ( = ?auto_3148 ?auto_3162 ) ) ( not ( = ?auto_3149 ?auto_3153 ) ) ( not ( = ?auto_3149 ?auto_3162 ) ) ( not ( = ?auto_3150 ?auto_3153 ) ) ( not ( = ?auto_3150 ?auto_3162 ) ) ( not ( = ?auto_3151 ?auto_3153 ) ) ( not ( = ?auto_3151 ?auto_3162 ) ) ( not ( = ?auto_3153 ?auto_3163 ) ) ( not ( = ?auto_3153 ?auto_3166 ) ) ( not ( = ?auto_3153 ?auto_3164 ) ) ( not ( = ?auto_3153 ?auto_3171 ) ) ( not ( = ?auto_3162 ?auto_3163 ) ) ( not ( = ?auto_3162 ?auto_3166 ) ) ( not ( = ?auto_3162 ?auto_3164 ) ) ( not ( = ?auto_3162 ?auto_3171 ) ) ( not ( = ?auto_3148 ?auto_3154 ) ) ( not ( = ?auto_3148 ?auto_3165 ) ) ( not ( = ?auto_3149 ?auto_3154 ) ) ( not ( = ?auto_3149 ?auto_3165 ) ) ( not ( = ?auto_3150 ?auto_3154 ) ) ( not ( = ?auto_3150 ?auto_3165 ) ) ( not ( = ?auto_3151 ?auto_3154 ) ) ( not ( = ?auto_3151 ?auto_3165 ) ) ( not ( = ?auto_3152 ?auto_3154 ) ) ( not ( = ?auto_3152 ?auto_3165 ) ) ( not ( = ?auto_3154 ?auto_3162 ) ) ( not ( = ?auto_3154 ?auto_3163 ) ) ( not ( = ?auto_3154 ?auto_3166 ) ) ( not ( = ?auto_3154 ?auto_3164 ) ) ( not ( = ?auto_3154 ?auto_3171 ) ) ( not ( = ?auto_3165 ?auto_3162 ) ) ( not ( = ?auto_3165 ?auto_3163 ) ) ( not ( = ?auto_3165 ?auto_3166 ) ) ( not ( = ?auto_3165 ?auto_3164 ) ) ( not ( = ?auto_3165 ?auto_3171 ) ) ( not ( = ?auto_3148 ?auto_3155 ) ) ( not ( = ?auto_3148 ?auto_3159 ) ) ( not ( = ?auto_3149 ?auto_3155 ) ) ( not ( = ?auto_3149 ?auto_3159 ) ) ( not ( = ?auto_3150 ?auto_3155 ) ) ( not ( = ?auto_3150 ?auto_3159 ) ) ( not ( = ?auto_3151 ?auto_3155 ) ) ( not ( = ?auto_3151 ?auto_3159 ) ) ( not ( = ?auto_3152 ?auto_3155 ) ) ( not ( = ?auto_3152 ?auto_3159 ) ) ( not ( = ?auto_3153 ?auto_3155 ) ) ( not ( = ?auto_3153 ?auto_3159 ) ) ( not ( = ?auto_3155 ?auto_3165 ) ) ( not ( = ?auto_3155 ?auto_3162 ) ) ( not ( = ?auto_3155 ?auto_3163 ) ) ( not ( = ?auto_3155 ?auto_3166 ) ) ( not ( = ?auto_3155 ?auto_3164 ) ) ( not ( = ?auto_3155 ?auto_3171 ) ) ( not ( = ?auto_3159 ?auto_3165 ) ) ( not ( = ?auto_3159 ?auto_3162 ) ) ( not ( = ?auto_3159 ?auto_3163 ) ) ( not ( = ?auto_3159 ?auto_3166 ) ) ( not ( = ?auto_3159 ?auto_3164 ) ) ( not ( = ?auto_3159 ?auto_3171 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3148 ?auto_3149 ?auto_3150 ?auto_3151 ?auto_3152 ?auto_3153 ?auto_3154 )
      ( MAKE-1CRATE ?auto_3154 ?auto_3155 )
      ( MAKE-7CRATE-VERIFY ?auto_3148 ?auto_3149 ?auto_3150 ?auto_3151 ?auto_3152 ?auto_3153 ?auto_3154 ?auto_3155 ) )
  )

)

