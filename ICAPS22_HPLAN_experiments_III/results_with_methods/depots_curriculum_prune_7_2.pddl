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
      ?auto_2949 - SURFACE
      ?auto_2950 - SURFACE
    )
    :vars
    (
      ?auto_2951 - HOIST
      ?auto_2952 - PLACE
      ?auto_2954 - PLACE
      ?auto_2955 - HOIST
      ?auto_2956 - SURFACE
      ?auto_2953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2951 ?auto_2952 ) ( SURFACE-AT ?auto_2949 ?auto_2952 ) ( CLEAR ?auto_2949 ) ( IS-CRATE ?auto_2950 ) ( AVAILABLE ?auto_2951 ) ( not ( = ?auto_2954 ?auto_2952 ) ) ( HOIST-AT ?auto_2955 ?auto_2954 ) ( AVAILABLE ?auto_2955 ) ( SURFACE-AT ?auto_2950 ?auto_2954 ) ( ON ?auto_2950 ?auto_2956 ) ( CLEAR ?auto_2950 ) ( TRUCK-AT ?auto_2953 ?auto_2952 ) ( not ( = ?auto_2949 ?auto_2950 ) ) ( not ( = ?auto_2949 ?auto_2956 ) ) ( not ( = ?auto_2950 ?auto_2956 ) ) ( not ( = ?auto_2951 ?auto_2955 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2953 ?auto_2952 ?auto_2954 )
      ( !LIFT ?auto_2955 ?auto_2950 ?auto_2956 ?auto_2954 )
      ( !LOAD ?auto_2955 ?auto_2950 ?auto_2953 ?auto_2954 )
      ( !DRIVE ?auto_2953 ?auto_2954 ?auto_2952 )
      ( !UNLOAD ?auto_2951 ?auto_2950 ?auto_2953 ?auto_2952 )
      ( !DROP ?auto_2951 ?auto_2950 ?auto_2949 ?auto_2952 )
      ( MAKE-1CRATE-VERIFY ?auto_2949 ?auto_2950 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2970 - SURFACE
      ?auto_2971 - SURFACE
      ?auto_2972 - SURFACE
    )
    :vars
    (
      ?auto_2977 - HOIST
      ?auto_2973 - PLACE
      ?auto_2976 - PLACE
      ?auto_2974 - HOIST
      ?auto_2975 - SURFACE
      ?auto_2981 - PLACE
      ?auto_2979 - HOIST
      ?auto_2980 - SURFACE
      ?auto_2978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2977 ?auto_2973 ) ( IS-CRATE ?auto_2972 ) ( not ( = ?auto_2976 ?auto_2973 ) ) ( HOIST-AT ?auto_2974 ?auto_2976 ) ( AVAILABLE ?auto_2974 ) ( SURFACE-AT ?auto_2972 ?auto_2976 ) ( ON ?auto_2972 ?auto_2975 ) ( CLEAR ?auto_2972 ) ( not ( = ?auto_2971 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2975 ) ) ( not ( = ?auto_2972 ?auto_2975 ) ) ( not ( = ?auto_2977 ?auto_2974 ) ) ( SURFACE-AT ?auto_2970 ?auto_2973 ) ( CLEAR ?auto_2970 ) ( IS-CRATE ?auto_2971 ) ( AVAILABLE ?auto_2977 ) ( not ( = ?auto_2981 ?auto_2973 ) ) ( HOIST-AT ?auto_2979 ?auto_2981 ) ( AVAILABLE ?auto_2979 ) ( SURFACE-AT ?auto_2971 ?auto_2981 ) ( ON ?auto_2971 ?auto_2980 ) ( CLEAR ?auto_2971 ) ( TRUCK-AT ?auto_2978 ?auto_2973 ) ( not ( = ?auto_2970 ?auto_2971 ) ) ( not ( = ?auto_2970 ?auto_2980 ) ) ( not ( = ?auto_2971 ?auto_2980 ) ) ( not ( = ?auto_2977 ?auto_2979 ) ) ( not ( = ?auto_2970 ?auto_2972 ) ) ( not ( = ?auto_2970 ?auto_2975 ) ) ( not ( = ?auto_2972 ?auto_2980 ) ) ( not ( = ?auto_2976 ?auto_2981 ) ) ( not ( = ?auto_2974 ?auto_2979 ) ) ( not ( = ?auto_2975 ?auto_2980 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2970 ?auto_2971 )
      ( MAKE-1CRATE ?auto_2971 ?auto_2972 )
      ( MAKE-2CRATE-VERIFY ?auto_2970 ?auto_2971 ?auto_2972 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2996 - SURFACE
      ?auto_2997 - SURFACE
      ?auto_2998 - SURFACE
      ?auto_2999 - SURFACE
    )
    :vars
    (
      ?auto_3004 - HOIST
      ?auto_3001 - PLACE
      ?auto_3002 - PLACE
      ?auto_3000 - HOIST
      ?auto_3005 - SURFACE
      ?auto_3007 - SURFACE
      ?auto_3006 - PLACE
      ?auto_3008 - HOIST
      ?auto_3009 - SURFACE
      ?auto_3003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3004 ?auto_3001 ) ( IS-CRATE ?auto_2999 ) ( not ( = ?auto_3002 ?auto_3001 ) ) ( HOIST-AT ?auto_3000 ?auto_3002 ) ( SURFACE-AT ?auto_2999 ?auto_3002 ) ( ON ?auto_2999 ?auto_3005 ) ( CLEAR ?auto_2999 ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( not ( = ?auto_2998 ?auto_3005 ) ) ( not ( = ?auto_2999 ?auto_3005 ) ) ( not ( = ?auto_3004 ?auto_3000 ) ) ( IS-CRATE ?auto_2998 ) ( AVAILABLE ?auto_3000 ) ( SURFACE-AT ?auto_2998 ?auto_3002 ) ( ON ?auto_2998 ?auto_3007 ) ( CLEAR ?auto_2998 ) ( not ( = ?auto_2997 ?auto_2998 ) ) ( not ( = ?auto_2997 ?auto_3007 ) ) ( not ( = ?auto_2998 ?auto_3007 ) ) ( SURFACE-AT ?auto_2996 ?auto_3001 ) ( CLEAR ?auto_2996 ) ( IS-CRATE ?auto_2997 ) ( AVAILABLE ?auto_3004 ) ( not ( = ?auto_3006 ?auto_3001 ) ) ( HOIST-AT ?auto_3008 ?auto_3006 ) ( AVAILABLE ?auto_3008 ) ( SURFACE-AT ?auto_2997 ?auto_3006 ) ( ON ?auto_2997 ?auto_3009 ) ( CLEAR ?auto_2997 ) ( TRUCK-AT ?auto_3003 ?auto_3001 ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_3009 ) ) ( not ( = ?auto_2997 ?auto_3009 ) ) ( not ( = ?auto_3004 ?auto_3008 ) ) ( not ( = ?auto_2996 ?auto_2998 ) ) ( not ( = ?auto_2996 ?auto_3007 ) ) ( not ( = ?auto_2998 ?auto_3009 ) ) ( not ( = ?auto_3002 ?auto_3006 ) ) ( not ( = ?auto_3000 ?auto_3008 ) ) ( not ( = ?auto_3007 ?auto_3009 ) ) ( not ( = ?auto_2996 ?auto_2999 ) ) ( not ( = ?auto_2996 ?auto_3005 ) ) ( not ( = ?auto_2997 ?auto_2999 ) ) ( not ( = ?auto_2997 ?auto_3005 ) ) ( not ( = ?auto_2999 ?auto_3007 ) ) ( not ( = ?auto_2999 ?auto_3009 ) ) ( not ( = ?auto_3005 ?auto_3007 ) ) ( not ( = ?auto_3005 ?auto_3009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2996 ?auto_2997 ?auto_2998 )
      ( MAKE-1CRATE ?auto_2998 ?auto_2999 )
      ( MAKE-3CRATE-VERIFY ?auto_2996 ?auto_2997 ?auto_2998 ?auto_2999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_3025 - SURFACE
      ?auto_3026 - SURFACE
      ?auto_3027 - SURFACE
      ?auto_3028 - SURFACE
      ?auto_3029 - SURFACE
    )
    :vars
    (
      ?auto_3035 - HOIST
      ?auto_3034 - PLACE
      ?auto_3033 - PLACE
      ?auto_3030 - HOIST
      ?auto_3031 - SURFACE
      ?auto_3037 - SURFACE
      ?auto_3040 - SURFACE
      ?auto_3038 - PLACE
      ?auto_3036 - HOIST
      ?auto_3039 - SURFACE
      ?auto_3032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3035 ?auto_3034 ) ( IS-CRATE ?auto_3029 ) ( not ( = ?auto_3033 ?auto_3034 ) ) ( HOIST-AT ?auto_3030 ?auto_3033 ) ( SURFACE-AT ?auto_3029 ?auto_3033 ) ( ON ?auto_3029 ?auto_3031 ) ( CLEAR ?auto_3029 ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( not ( = ?auto_3028 ?auto_3031 ) ) ( not ( = ?auto_3029 ?auto_3031 ) ) ( not ( = ?auto_3035 ?auto_3030 ) ) ( IS-CRATE ?auto_3028 ) ( SURFACE-AT ?auto_3028 ?auto_3033 ) ( ON ?auto_3028 ?auto_3037 ) ( CLEAR ?auto_3028 ) ( not ( = ?auto_3027 ?auto_3028 ) ) ( not ( = ?auto_3027 ?auto_3037 ) ) ( not ( = ?auto_3028 ?auto_3037 ) ) ( IS-CRATE ?auto_3027 ) ( AVAILABLE ?auto_3030 ) ( SURFACE-AT ?auto_3027 ?auto_3033 ) ( ON ?auto_3027 ?auto_3040 ) ( CLEAR ?auto_3027 ) ( not ( = ?auto_3026 ?auto_3027 ) ) ( not ( = ?auto_3026 ?auto_3040 ) ) ( not ( = ?auto_3027 ?auto_3040 ) ) ( SURFACE-AT ?auto_3025 ?auto_3034 ) ( CLEAR ?auto_3025 ) ( IS-CRATE ?auto_3026 ) ( AVAILABLE ?auto_3035 ) ( not ( = ?auto_3038 ?auto_3034 ) ) ( HOIST-AT ?auto_3036 ?auto_3038 ) ( AVAILABLE ?auto_3036 ) ( SURFACE-AT ?auto_3026 ?auto_3038 ) ( ON ?auto_3026 ?auto_3039 ) ( CLEAR ?auto_3026 ) ( TRUCK-AT ?auto_3032 ?auto_3034 ) ( not ( = ?auto_3025 ?auto_3026 ) ) ( not ( = ?auto_3025 ?auto_3039 ) ) ( not ( = ?auto_3026 ?auto_3039 ) ) ( not ( = ?auto_3035 ?auto_3036 ) ) ( not ( = ?auto_3025 ?auto_3027 ) ) ( not ( = ?auto_3025 ?auto_3040 ) ) ( not ( = ?auto_3027 ?auto_3039 ) ) ( not ( = ?auto_3033 ?auto_3038 ) ) ( not ( = ?auto_3030 ?auto_3036 ) ) ( not ( = ?auto_3040 ?auto_3039 ) ) ( not ( = ?auto_3025 ?auto_3028 ) ) ( not ( = ?auto_3025 ?auto_3037 ) ) ( not ( = ?auto_3026 ?auto_3028 ) ) ( not ( = ?auto_3026 ?auto_3037 ) ) ( not ( = ?auto_3028 ?auto_3040 ) ) ( not ( = ?auto_3028 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3040 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) ( not ( = ?auto_3025 ?auto_3029 ) ) ( not ( = ?auto_3025 ?auto_3031 ) ) ( not ( = ?auto_3026 ?auto_3029 ) ) ( not ( = ?auto_3026 ?auto_3031 ) ) ( not ( = ?auto_3027 ?auto_3029 ) ) ( not ( = ?auto_3027 ?auto_3031 ) ) ( not ( = ?auto_3029 ?auto_3037 ) ) ( not ( = ?auto_3029 ?auto_3040 ) ) ( not ( = ?auto_3029 ?auto_3039 ) ) ( not ( = ?auto_3031 ?auto_3037 ) ) ( not ( = ?auto_3031 ?auto_3040 ) ) ( not ( = ?auto_3031 ?auto_3039 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3025 ?auto_3026 ?auto_3027 ?auto_3028 )
      ( MAKE-1CRATE ?auto_3028 ?auto_3029 )
      ( MAKE-4CRATE-VERIFY ?auto_3025 ?auto_3026 ?auto_3027 ?auto_3028 ?auto_3029 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_3057 - SURFACE
      ?auto_3058 - SURFACE
      ?auto_3059 - SURFACE
      ?auto_3060 - SURFACE
      ?auto_3061 - SURFACE
      ?auto_3062 - SURFACE
    )
    :vars
    (
      ?auto_3064 - HOIST
      ?auto_3066 - PLACE
      ?auto_3067 - PLACE
      ?auto_3065 - HOIST
      ?auto_3068 - SURFACE
      ?auto_3069 - PLACE
      ?auto_3070 - HOIST
      ?auto_3076 - SURFACE
      ?auto_3071 - SURFACE
      ?auto_3074 - SURFACE
      ?auto_3075 - PLACE
      ?auto_3073 - HOIST
      ?auto_3072 - SURFACE
      ?auto_3063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3064 ?auto_3066 ) ( IS-CRATE ?auto_3062 ) ( not ( = ?auto_3067 ?auto_3066 ) ) ( HOIST-AT ?auto_3065 ?auto_3067 ) ( AVAILABLE ?auto_3065 ) ( SURFACE-AT ?auto_3062 ?auto_3067 ) ( ON ?auto_3062 ?auto_3068 ) ( CLEAR ?auto_3062 ) ( not ( = ?auto_3061 ?auto_3062 ) ) ( not ( = ?auto_3061 ?auto_3068 ) ) ( not ( = ?auto_3062 ?auto_3068 ) ) ( not ( = ?auto_3064 ?auto_3065 ) ) ( IS-CRATE ?auto_3061 ) ( not ( = ?auto_3069 ?auto_3066 ) ) ( HOIST-AT ?auto_3070 ?auto_3069 ) ( SURFACE-AT ?auto_3061 ?auto_3069 ) ( ON ?auto_3061 ?auto_3076 ) ( CLEAR ?auto_3061 ) ( not ( = ?auto_3060 ?auto_3061 ) ) ( not ( = ?auto_3060 ?auto_3076 ) ) ( not ( = ?auto_3061 ?auto_3076 ) ) ( not ( = ?auto_3064 ?auto_3070 ) ) ( IS-CRATE ?auto_3060 ) ( SURFACE-AT ?auto_3060 ?auto_3069 ) ( ON ?auto_3060 ?auto_3071 ) ( CLEAR ?auto_3060 ) ( not ( = ?auto_3059 ?auto_3060 ) ) ( not ( = ?auto_3059 ?auto_3071 ) ) ( not ( = ?auto_3060 ?auto_3071 ) ) ( IS-CRATE ?auto_3059 ) ( AVAILABLE ?auto_3070 ) ( SURFACE-AT ?auto_3059 ?auto_3069 ) ( ON ?auto_3059 ?auto_3074 ) ( CLEAR ?auto_3059 ) ( not ( = ?auto_3058 ?auto_3059 ) ) ( not ( = ?auto_3058 ?auto_3074 ) ) ( not ( = ?auto_3059 ?auto_3074 ) ) ( SURFACE-AT ?auto_3057 ?auto_3066 ) ( CLEAR ?auto_3057 ) ( IS-CRATE ?auto_3058 ) ( AVAILABLE ?auto_3064 ) ( not ( = ?auto_3075 ?auto_3066 ) ) ( HOIST-AT ?auto_3073 ?auto_3075 ) ( AVAILABLE ?auto_3073 ) ( SURFACE-AT ?auto_3058 ?auto_3075 ) ( ON ?auto_3058 ?auto_3072 ) ( CLEAR ?auto_3058 ) ( TRUCK-AT ?auto_3063 ?auto_3066 ) ( not ( = ?auto_3057 ?auto_3058 ) ) ( not ( = ?auto_3057 ?auto_3072 ) ) ( not ( = ?auto_3058 ?auto_3072 ) ) ( not ( = ?auto_3064 ?auto_3073 ) ) ( not ( = ?auto_3057 ?auto_3059 ) ) ( not ( = ?auto_3057 ?auto_3074 ) ) ( not ( = ?auto_3059 ?auto_3072 ) ) ( not ( = ?auto_3069 ?auto_3075 ) ) ( not ( = ?auto_3070 ?auto_3073 ) ) ( not ( = ?auto_3074 ?auto_3072 ) ) ( not ( = ?auto_3057 ?auto_3060 ) ) ( not ( = ?auto_3057 ?auto_3071 ) ) ( not ( = ?auto_3058 ?auto_3060 ) ) ( not ( = ?auto_3058 ?auto_3071 ) ) ( not ( = ?auto_3060 ?auto_3074 ) ) ( not ( = ?auto_3060 ?auto_3072 ) ) ( not ( = ?auto_3071 ?auto_3074 ) ) ( not ( = ?auto_3071 ?auto_3072 ) ) ( not ( = ?auto_3057 ?auto_3061 ) ) ( not ( = ?auto_3057 ?auto_3076 ) ) ( not ( = ?auto_3058 ?auto_3061 ) ) ( not ( = ?auto_3058 ?auto_3076 ) ) ( not ( = ?auto_3059 ?auto_3061 ) ) ( not ( = ?auto_3059 ?auto_3076 ) ) ( not ( = ?auto_3061 ?auto_3071 ) ) ( not ( = ?auto_3061 ?auto_3074 ) ) ( not ( = ?auto_3061 ?auto_3072 ) ) ( not ( = ?auto_3076 ?auto_3071 ) ) ( not ( = ?auto_3076 ?auto_3074 ) ) ( not ( = ?auto_3076 ?auto_3072 ) ) ( not ( = ?auto_3057 ?auto_3062 ) ) ( not ( = ?auto_3057 ?auto_3068 ) ) ( not ( = ?auto_3058 ?auto_3062 ) ) ( not ( = ?auto_3058 ?auto_3068 ) ) ( not ( = ?auto_3059 ?auto_3062 ) ) ( not ( = ?auto_3059 ?auto_3068 ) ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( not ( = ?auto_3060 ?auto_3068 ) ) ( not ( = ?auto_3062 ?auto_3076 ) ) ( not ( = ?auto_3062 ?auto_3071 ) ) ( not ( = ?auto_3062 ?auto_3074 ) ) ( not ( = ?auto_3062 ?auto_3072 ) ) ( not ( = ?auto_3067 ?auto_3069 ) ) ( not ( = ?auto_3067 ?auto_3075 ) ) ( not ( = ?auto_3065 ?auto_3070 ) ) ( not ( = ?auto_3065 ?auto_3073 ) ) ( not ( = ?auto_3068 ?auto_3076 ) ) ( not ( = ?auto_3068 ?auto_3071 ) ) ( not ( = ?auto_3068 ?auto_3074 ) ) ( not ( = ?auto_3068 ?auto_3072 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3057 ?auto_3058 ?auto_3059 ?auto_3060 ?auto_3061 )
      ( MAKE-1CRATE ?auto_3061 ?auto_3062 )
      ( MAKE-5CRATE-VERIFY ?auto_3057 ?auto_3058 ?auto_3059 ?auto_3060 ?auto_3061 ?auto_3062 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_3094 - SURFACE
      ?auto_3095 - SURFACE
      ?auto_3096 - SURFACE
      ?auto_3097 - SURFACE
      ?auto_3098 - SURFACE
      ?auto_3099 - SURFACE
      ?auto_3100 - SURFACE
    )
    :vars
    (
      ?auto_3101 - HOIST
      ?auto_3103 - PLACE
      ?auto_3102 - PLACE
      ?auto_3104 - HOIST
      ?auto_3106 - SURFACE
      ?auto_3108 - PLACE
      ?auto_3109 - HOIST
      ?auto_3107 - SURFACE
      ?auto_3112 - PLACE
      ?auto_3111 - HOIST
      ?auto_3110 - SURFACE
      ?auto_3117 - SURFACE
      ?auto_3114 - SURFACE
      ?auto_3116 - PLACE
      ?auto_3115 - HOIST
      ?auto_3113 - SURFACE
      ?auto_3105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3101 ?auto_3103 ) ( IS-CRATE ?auto_3100 ) ( not ( = ?auto_3102 ?auto_3103 ) ) ( HOIST-AT ?auto_3104 ?auto_3102 ) ( AVAILABLE ?auto_3104 ) ( SURFACE-AT ?auto_3100 ?auto_3102 ) ( ON ?auto_3100 ?auto_3106 ) ( CLEAR ?auto_3100 ) ( not ( = ?auto_3099 ?auto_3100 ) ) ( not ( = ?auto_3099 ?auto_3106 ) ) ( not ( = ?auto_3100 ?auto_3106 ) ) ( not ( = ?auto_3101 ?auto_3104 ) ) ( IS-CRATE ?auto_3099 ) ( not ( = ?auto_3108 ?auto_3103 ) ) ( HOIST-AT ?auto_3109 ?auto_3108 ) ( AVAILABLE ?auto_3109 ) ( SURFACE-AT ?auto_3099 ?auto_3108 ) ( ON ?auto_3099 ?auto_3107 ) ( CLEAR ?auto_3099 ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( not ( = ?auto_3098 ?auto_3107 ) ) ( not ( = ?auto_3099 ?auto_3107 ) ) ( not ( = ?auto_3101 ?auto_3109 ) ) ( IS-CRATE ?auto_3098 ) ( not ( = ?auto_3112 ?auto_3103 ) ) ( HOIST-AT ?auto_3111 ?auto_3112 ) ( SURFACE-AT ?auto_3098 ?auto_3112 ) ( ON ?auto_3098 ?auto_3110 ) ( CLEAR ?auto_3098 ) ( not ( = ?auto_3097 ?auto_3098 ) ) ( not ( = ?auto_3097 ?auto_3110 ) ) ( not ( = ?auto_3098 ?auto_3110 ) ) ( not ( = ?auto_3101 ?auto_3111 ) ) ( IS-CRATE ?auto_3097 ) ( SURFACE-AT ?auto_3097 ?auto_3112 ) ( ON ?auto_3097 ?auto_3117 ) ( CLEAR ?auto_3097 ) ( not ( = ?auto_3096 ?auto_3097 ) ) ( not ( = ?auto_3096 ?auto_3117 ) ) ( not ( = ?auto_3097 ?auto_3117 ) ) ( IS-CRATE ?auto_3096 ) ( AVAILABLE ?auto_3111 ) ( SURFACE-AT ?auto_3096 ?auto_3112 ) ( ON ?auto_3096 ?auto_3114 ) ( CLEAR ?auto_3096 ) ( not ( = ?auto_3095 ?auto_3096 ) ) ( not ( = ?auto_3095 ?auto_3114 ) ) ( not ( = ?auto_3096 ?auto_3114 ) ) ( SURFACE-AT ?auto_3094 ?auto_3103 ) ( CLEAR ?auto_3094 ) ( IS-CRATE ?auto_3095 ) ( AVAILABLE ?auto_3101 ) ( not ( = ?auto_3116 ?auto_3103 ) ) ( HOIST-AT ?auto_3115 ?auto_3116 ) ( AVAILABLE ?auto_3115 ) ( SURFACE-AT ?auto_3095 ?auto_3116 ) ( ON ?auto_3095 ?auto_3113 ) ( CLEAR ?auto_3095 ) ( TRUCK-AT ?auto_3105 ?auto_3103 ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3113 ) ) ( not ( = ?auto_3095 ?auto_3113 ) ) ( not ( = ?auto_3101 ?auto_3115 ) ) ( not ( = ?auto_3094 ?auto_3096 ) ) ( not ( = ?auto_3094 ?auto_3114 ) ) ( not ( = ?auto_3096 ?auto_3113 ) ) ( not ( = ?auto_3112 ?auto_3116 ) ) ( not ( = ?auto_3111 ?auto_3115 ) ) ( not ( = ?auto_3114 ?auto_3113 ) ) ( not ( = ?auto_3094 ?auto_3097 ) ) ( not ( = ?auto_3094 ?auto_3117 ) ) ( not ( = ?auto_3095 ?auto_3097 ) ) ( not ( = ?auto_3095 ?auto_3117 ) ) ( not ( = ?auto_3097 ?auto_3114 ) ) ( not ( = ?auto_3097 ?auto_3113 ) ) ( not ( = ?auto_3117 ?auto_3114 ) ) ( not ( = ?auto_3117 ?auto_3113 ) ) ( not ( = ?auto_3094 ?auto_3098 ) ) ( not ( = ?auto_3094 ?auto_3110 ) ) ( not ( = ?auto_3095 ?auto_3098 ) ) ( not ( = ?auto_3095 ?auto_3110 ) ) ( not ( = ?auto_3096 ?auto_3098 ) ) ( not ( = ?auto_3096 ?auto_3110 ) ) ( not ( = ?auto_3098 ?auto_3117 ) ) ( not ( = ?auto_3098 ?auto_3114 ) ) ( not ( = ?auto_3098 ?auto_3113 ) ) ( not ( = ?auto_3110 ?auto_3117 ) ) ( not ( = ?auto_3110 ?auto_3114 ) ) ( not ( = ?auto_3110 ?auto_3113 ) ) ( not ( = ?auto_3094 ?auto_3099 ) ) ( not ( = ?auto_3094 ?auto_3107 ) ) ( not ( = ?auto_3095 ?auto_3099 ) ) ( not ( = ?auto_3095 ?auto_3107 ) ) ( not ( = ?auto_3096 ?auto_3099 ) ) ( not ( = ?auto_3096 ?auto_3107 ) ) ( not ( = ?auto_3097 ?auto_3099 ) ) ( not ( = ?auto_3097 ?auto_3107 ) ) ( not ( = ?auto_3099 ?auto_3110 ) ) ( not ( = ?auto_3099 ?auto_3117 ) ) ( not ( = ?auto_3099 ?auto_3114 ) ) ( not ( = ?auto_3099 ?auto_3113 ) ) ( not ( = ?auto_3108 ?auto_3112 ) ) ( not ( = ?auto_3108 ?auto_3116 ) ) ( not ( = ?auto_3109 ?auto_3111 ) ) ( not ( = ?auto_3109 ?auto_3115 ) ) ( not ( = ?auto_3107 ?auto_3110 ) ) ( not ( = ?auto_3107 ?auto_3117 ) ) ( not ( = ?auto_3107 ?auto_3114 ) ) ( not ( = ?auto_3107 ?auto_3113 ) ) ( not ( = ?auto_3094 ?auto_3100 ) ) ( not ( = ?auto_3094 ?auto_3106 ) ) ( not ( = ?auto_3095 ?auto_3100 ) ) ( not ( = ?auto_3095 ?auto_3106 ) ) ( not ( = ?auto_3096 ?auto_3100 ) ) ( not ( = ?auto_3096 ?auto_3106 ) ) ( not ( = ?auto_3097 ?auto_3100 ) ) ( not ( = ?auto_3097 ?auto_3106 ) ) ( not ( = ?auto_3098 ?auto_3100 ) ) ( not ( = ?auto_3098 ?auto_3106 ) ) ( not ( = ?auto_3100 ?auto_3107 ) ) ( not ( = ?auto_3100 ?auto_3110 ) ) ( not ( = ?auto_3100 ?auto_3117 ) ) ( not ( = ?auto_3100 ?auto_3114 ) ) ( not ( = ?auto_3100 ?auto_3113 ) ) ( not ( = ?auto_3102 ?auto_3108 ) ) ( not ( = ?auto_3102 ?auto_3112 ) ) ( not ( = ?auto_3102 ?auto_3116 ) ) ( not ( = ?auto_3104 ?auto_3109 ) ) ( not ( = ?auto_3104 ?auto_3111 ) ) ( not ( = ?auto_3104 ?auto_3115 ) ) ( not ( = ?auto_3106 ?auto_3107 ) ) ( not ( = ?auto_3106 ?auto_3110 ) ) ( not ( = ?auto_3106 ?auto_3117 ) ) ( not ( = ?auto_3106 ?auto_3114 ) ) ( not ( = ?auto_3106 ?auto_3113 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3099 )
      ( MAKE-1CRATE ?auto_3099 ?auto_3100 )
      ( MAKE-6CRATE-VERIFY ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3099 ?auto_3100 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_3136 - SURFACE
      ?auto_3137 - SURFACE
      ?auto_3138 - SURFACE
      ?auto_3139 - SURFACE
      ?auto_3140 - SURFACE
      ?auto_3141 - SURFACE
      ?auto_3142 - SURFACE
      ?auto_3143 - SURFACE
    )
    :vars
    (
      ?auto_3148 - HOIST
      ?auto_3149 - PLACE
      ?auto_3144 - PLACE
      ?auto_3146 - HOIST
      ?auto_3147 - SURFACE
      ?auto_3155 - PLACE
      ?auto_3162 - HOIST
      ?auto_3158 - SURFACE
      ?auto_3161 - PLACE
      ?auto_3160 - HOIST
      ?auto_3163 - SURFACE
      ?auto_3154 - PLACE
      ?auto_3150 - HOIST
      ?auto_3152 - SURFACE
      ?auto_3156 - SURFACE
      ?auto_3159 - SURFACE
      ?auto_3153 - PLACE
      ?auto_3157 - HOIST
      ?auto_3151 - SURFACE
      ?auto_3145 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3148 ?auto_3149 ) ( IS-CRATE ?auto_3143 ) ( not ( = ?auto_3144 ?auto_3149 ) ) ( HOIST-AT ?auto_3146 ?auto_3144 ) ( AVAILABLE ?auto_3146 ) ( SURFACE-AT ?auto_3143 ?auto_3144 ) ( ON ?auto_3143 ?auto_3147 ) ( CLEAR ?auto_3143 ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3147 ) ) ( not ( = ?auto_3143 ?auto_3147 ) ) ( not ( = ?auto_3148 ?auto_3146 ) ) ( IS-CRATE ?auto_3142 ) ( not ( = ?auto_3155 ?auto_3149 ) ) ( HOIST-AT ?auto_3162 ?auto_3155 ) ( AVAILABLE ?auto_3162 ) ( SURFACE-AT ?auto_3142 ?auto_3155 ) ( ON ?auto_3142 ?auto_3158 ) ( CLEAR ?auto_3142 ) ( not ( = ?auto_3141 ?auto_3142 ) ) ( not ( = ?auto_3141 ?auto_3158 ) ) ( not ( = ?auto_3142 ?auto_3158 ) ) ( not ( = ?auto_3148 ?auto_3162 ) ) ( IS-CRATE ?auto_3141 ) ( not ( = ?auto_3161 ?auto_3149 ) ) ( HOIST-AT ?auto_3160 ?auto_3161 ) ( AVAILABLE ?auto_3160 ) ( SURFACE-AT ?auto_3141 ?auto_3161 ) ( ON ?auto_3141 ?auto_3163 ) ( CLEAR ?auto_3141 ) ( not ( = ?auto_3140 ?auto_3141 ) ) ( not ( = ?auto_3140 ?auto_3163 ) ) ( not ( = ?auto_3141 ?auto_3163 ) ) ( not ( = ?auto_3148 ?auto_3160 ) ) ( IS-CRATE ?auto_3140 ) ( not ( = ?auto_3154 ?auto_3149 ) ) ( HOIST-AT ?auto_3150 ?auto_3154 ) ( SURFACE-AT ?auto_3140 ?auto_3154 ) ( ON ?auto_3140 ?auto_3152 ) ( CLEAR ?auto_3140 ) ( not ( = ?auto_3139 ?auto_3140 ) ) ( not ( = ?auto_3139 ?auto_3152 ) ) ( not ( = ?auto_3140 ?auto_3152 ) ) ( not ( = ?auto_3148 ?auto_3150 ) ) ( IS-CRATE ?auto_3139 ) ( SURFACE-AT ?auto_3139 ?auto_3154 ) ( ON ?auto_3139 ?auto_3156 ) ( CLEAR ?auto_3139 ) ( not ( = ?auto_3138 ?auto_3139 ) ) ( not ( = ?auto_3138 ?auto_3156 ) ) ( not ( = ?auto_3139 ?auto_3156 ) ) ( IS-CRATE ?auto_3138 ) ( AVAILABLE ?auto_3150 ) ( SURFACE-AT ?auto_3138 ?auto_3154 ) ( ON ?auto_3138 ?auto_3159 ) ( CLEAR ?auto_3138 ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( not ( = ?auto_3137 ?auto_3159 ) ) ( not ( = ?auto_3138 ?auto_3159 ) ) ( SURFACE-AT ?auto_3136 ?auto_3149 ) ( CLEAR ?auto_3136 ) ( IS-CRATE ?auto_3137 ) ( AVAILABLE ?auto_3148 ) ( not ( = ?auto_3153 ?auto_3149 ) ) ( HOIST-AT ?auto_3157 ?auto_3153 ) ( AVAILABLE ?auto_3157 ) ( SURFACE-AT ?auto_3137 ?auto_3153 ) ( ON ?auto_3137 ?auto_3151 ) ( CLEAR ?auto_3137 ) ( TRUCK-AT ?auto_3145 ?auto_3149 ) ( not ( = ?auto_3136 ?auto_3137 ) ) ( not ( = ?auto_3136 ?auto_3151 ) ) ( not ( = ?auto_3137 ?auto_3151 ) ) ( not ( = ?auto_3148 ?auto_3157 ) ) ( not ( = ?auto_3136 ?auto_3138 ) ) ( not ( = ?auto_3136 ?auto_3159 ) ) ( not ( = ?auto_3138 ?auto_3151 ) ) ( not ( = ?auto_3154 ?auto_3153 ) ) ( not ( = ?auto_3150 ?auto_3157 ) ) ( not ( = ?auto_3159 ?auto_3151 ) ) ( not ( = ?auto_3136 ?auto_3139 ) ) ( not ( = ?auto_3136 ?auto_3156 ) ) ( not ( = ?auto_3137 ?auto_3139 ) ) ( not ( = ?auto_3137 ?auto_3156 ) ) ( not ( = ?auto_3139 ?auto_3159 ) ) ( not ( = ?auto_3139 ?auto_3151 ) ) ( not ( = ?auto_3156 ?auto_3159 ) ) ( not ( = ?auto_3156 ?auto_3151 ) ) ( not ( = ?auto_3136 ?auto_3140 ) ) ( not ( = ?auto_3136 ?auto_3152 ) ) ( not ( = ?auto_3137 ?auto_3140 ) ) ( not ( = ?auto_3137 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3140 ) ) ( not ( = ?auto_3138 ?auto_3152 ) ) ( not ( = ?auto_3140 ?auto_3156 ) ) ( not ( = ?auto_3140 ?auto_3159 ) ) ( not ( = ?auto_3140 ?auto_3151 ) ) ( not ( = ?auto_3152 ?auto_3156 ) ) ( not ( = ?auto_3152 ?auto_3159 ) ) ( not ( = ?auto_3152 ?auto_3151 ) ) ( not ( = ?auto_3136 ?auto_3141 ) ) ( not ( = ?auto_3136 ?auto_3163 ) ) ( not ( = ?auto_3137 ?auto_3141 ) ) ( not ( = ?auto_3137 ?auto_3163 ) ) ( not ( = ?auto_3138 ?auto_3141 ) ) ( not ( = ?auto_3138 ?auto_3163 ) ) ( not ( = ?auto_3139 ?auto_3141 ) ) ( not ( = ?auto_3139 ?auto_3163 ) ) ( not ( = ?auto_3141 ?auto_3152 ) ) ( not ( = ?auto_3141 ?auto_3156 ) ) ( not ( = ?auto_3141 ?auto_3159 ) ) ( not ( = ?auto_3141 ?auto_3151 ) ) ( not ( = ?auto_3161 ?auto_3154 ) ) ( not ( = ?auto_3161 ?auto_3153 ) ) ( not ( = ?auto_3160 ?auto_3150 ) ) ( not ( = ?auto_3160 ?auto_3157 ) ) ( not ( = ?auto_3163 ?auto_3152 ) ) ( not ( = ?auto_3163 ?auto_3156 ) ) ( not ( = ?auto_3163 ?auto_3159 ) ) ( not ( = ?auto_3163 ?auto_3151 ) ) ( not ( = ?auto_3136 ?auto_3142 ) ) ( not ( = ?auto_3136 ?auto_3158 ) ) ( not ( = ?auto_3137 ?auto_3142 ) ) ( not ( = ?auto_3137 ?auto_3158 ) ) ( not ( = ?auto_3138 ?auto_3142 ) ) ( not ( = ?auto_3138 ?auto_3158 ) ) ( not ( = ?auto_3139 ?auto_3142 ) ) ( not ( = ?auto_3139 ?auto_3158 ) ) ( not ( = ?auto_3140 ?auto_3142 ) ) ( not ( = ?auto_3140 ?auto_3158 ) ) ( not ( = ?auto_3142 ?auto_3163 ) ) ( not ( = ?auto_3142 ?auto_3152 ) ) ( not ( = ?auto_3142 ?auto_3156 ) ) ( not ( = ?auto_3142 ?auto_3159 ) ) ( not ( = ?auto_3142 ?auto_3151 ) ) ( not ( = ?auto_3155 ?auto_3161 ) ) ( not ( = ?auto_3155 ?auto_3154 ) ) ( not ( = ?auto_3155 ?auto_3153 ) ) ( not ( = ?auto_3162 ?auto_3160 ) ) ( not ( = ?auto_3162 ?auto_3150 ) ) ( not ( = ?auto_3162 ?auto_3157 ) ) ( not ( = ?auto_3158 ?auto_3163 ) ) ( not ( = ?auto_3158 ?auto_3152 ) ) ( not ( = ?auto_3158 ?auto_3156 ) ) ( not ( = ?auto_3158 ?auto_3159 ) ) ( not ( = ?auto_3158 ?auto_3151 ) ) ( not ( = ?auto_3136 ?auto_3143 ) ) ( not ( = ?auto_3136 ?auto_3147 ) ) ( not ( = ?auto_3137 ?auto_3143 ) ) ( not ( = ?auto_3137 ?auto_3147 ) ) ( not ( = ?auto_3138 ?auto_3143 ) ) ( not ( = ?auto_3138 ?auto_3147 ) ) ( not ( = ?auto_3139 ?auto_3143 ) ) ( not ( = ?auto_3139 ?auto_3147 ) ) ( not ( = ?auto_3140 ?auto_3143 ) ) ( not ( = ?auto_3140 ?auto_3147 ) ) ( not ( = ?auto_3141 ?auto_3143 ) ) ( not ( = ?auto_3141 ?auto_3147 ) ) ( not ( = ?auto_3143 ?auto_3158 ) ) ( not ( = ?auto_3143 ?auto_3163 ) ) ( not ( = ?auto_3143 ?auto_3152 ) ) ( not ( = ?auto_3143 ?auto_3156 ) ) ( not ( = ?auto_3143 ?auto_3159 ) ) ( not ( = ?auto_3143 ?auto_3151 ) ) ( not ( = ?auto_3144 ?auto_3155 ) ) ( not ( = ?auto_3144 ?auto_3161 ) ) ( not ( = ?auto_3144 ?auto_3154 ) ) ( not ( = ?auto_3144 ?auto_3153 ) ) ( not ( = ?auto_3146 ?auto_3162 ) ) ( not ( = ?auto_3146 ?auto_3160 ) ) ( not ( = ?auto_3146 ?auto_3150 ) ) ( not ( = ?auto_3146 ?auto_3157 ) ) ( not ( = ?auto_3147 ?auto_3158 ) ) ( not ( = ?auto_3147 ?auto_3163 ) ) ( not ( = ?auto_3147 ?auto_3152 ) ) ( not ( = ?auto_3147 ?auto_3156 ) ) ( not ( = ?auto_3147 ?auto_3159 ) ) ( not ( = ?auto_3147 ?auto_3151 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3139 ?auto_3140 ?auto_3141 ?auto_3142 )
      ( MAKE-1CRATE ?auto_3142 ?auto_3143 )
      ( MAKE-7CRATE-VERIFY ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3139 ?auto_3140 ?auto_3141 ?auto_3142 ?auto_3143 ) )
  )

)

