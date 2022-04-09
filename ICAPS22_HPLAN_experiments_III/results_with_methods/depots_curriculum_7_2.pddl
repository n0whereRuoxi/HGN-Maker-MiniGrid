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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2959 - SURFACE
      ?auto_2960 - SURFACE
    )
    :vars
    (
      ?auto_2961 - HOIST
      ?auto_2962 - PLACE
      ?auto_2964 - PLACE
      ?auto_2965 - HOIST
      ?auto_2966 - SURFACE
      ?auto_2963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2961 ?auto_2962 ) ( SURFACE-AT ?auto_2959 ?auto_2962 ) ( CLEAR ?auto_2959 ) ( IS-CRATE ?auto_2960 ) ( AVAILABLE ?auto_2961 ) ( not ( = ?auto_2964 ?auto_2962 ) ) ( HOIST-AT ?auto_2965 ?auto_2964 ) ( AVAILABLE ?auto_2965 ) ( SURFACE-AT ?auto_2960 ?auto_2964 ) ( ON ?auto_2960 ?auto_2966 ) ( CLEAR ?auto_2960 ) ( TRUCK-AT ?auto_2963 ?auto_2962 ) ( not ( = ?auto_2959 ?auto_2960 ) ) ( not ( = ?auto_2959 ?auto_2966 ) ) ( not ( = ?auto_2960 ?auto_2966 ) ) ( not ( = ?auto_2961 ?auto_2965 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2963 ?auto_2962 ?auto_2964 )
      ( !LIFT ?auto_2965 ?auto_2960 ?auto_2966 ?auto_2964 )
      ( !LOAD ?auto_2965 ?auto_2960 ?auto_2963 ?auto_2964 )
      ( !DRIVE ?auto_2963 ?auto_2964 ?auto_2962 )
      ( !UNLOAD ?auto_2961 ?auto_2960 ?auto_2963 ?auto_2962 )
      ( !DROP ?auto_2961 ?auto_2960 ?auto_2959 ?auto_2962 )
      ( MAKE-1CRATE-VERIFY ?auto_2959 ?auto_2960 ) )
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
      ?auto_2976 - HOIST
      ?auto_2977 - PLACE
      ?auto_2975 - PLACE
      ?auto_2974 - HOIST
      ?auto_2973 - SURFACE
      ?auto_2981 - PLACE
      ?auto_2980 - HOIST
      ?auto_2979 - SURFACE
      ?auto_2978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2976 ?auto_2977 ) ( IS-CRATE ?auto_2972 ) ( not ( = ?auto_2975 ?auto_2977 ) ) ( HOIST-AT ?auto_2974 ?auto_2975 ) ( AVAILABLE ?auto_2974 ) ( SURFACE-AT ?auto_2972 ?auto_2975 ) ( ON ?auto_2972 ?auto_2973 ) ( CLEAR ?auto_2972 ) ( not ( = ?auto_2971 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2973 ) ) ( not ( = ?auto_2972 ?auto_2973 ) ) ( not ( = ?auto_2976 ?auto_2974 ) ) ( SURFACE-AT ?auto_2970 ?auto_2977 ) ( CLEAR ?auto_2970 ) ( IS-CRATE ?auto_2971 ) ( AVAILABLE ?auto_2976 ) ( not ( = ?auto_2981 ?auto_2977 ) ) ( HOIST-AT ?auto_2980 ?auto_2981 ) ( AVAILABLE ?auto_2980 ) ( SURFACE-AT ?auto_2971 ?auto_2981 ) ( ON ?auto_2971 ?auto_2979 ) ( CLEAR ?auto_2971 ) ( TRUCK-AT ?auto_2978 ?auto_2977 ) ( not ( = ?auto_2970 ?auto_2971 ) ) ( not ( = ?auto_2970 ?auto_2979 ) ) ( not ( = ?auto_2971 ?auto_2979 ) ) ( not ( = ?auto_2976 ?auto_2980 ) ) ( not ( = ?auto_2970 ?auto_2972 ) ) ( not ( = ?auto_2970 ?auto_2973 ) ) ( not ( = ?auto_2972 ?auto_2979 ) ) ( not ( = ?auto_2975 ?auto_2981 ) ) ( not ( = ?auto_2974 ?auto_2980 ) ) ( not ( = ?auto_2973 ?auto_2979 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2970 ?auto_2971 )
      ( MAKE-1CRATE ?auto_2971 ?auto_2972 )
      ( MAKE-2CRATE-VERIFY ?auto_2970 ?auto_2971 ?auto_2972 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2984 - SURFACE
      ?auto_2985 - SURFACE
    )
    :vars
    (
      ?auto_2986 - HOIST
      ?auto_2987 - PLACE
      ?auto_2989 - PLACE
      ?auto_2990 - HOIST
      ?auto_2991 - SURFACE
      ?auto_2988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2986 ?auto_2987 ) ( SURFACE-AT ?auto_2984 ?auto_2987 ) ( CLEAR ?auto_2984 ) ( IS-CRATE ?auto_2985 ) ( AVAILABLE ?auto_2986 ) ( not ( = ?auto_2989 ?auto_2987 ) ) ( HOIST-AT ?auto_2990 ?auto_2989 ) ( AVAILABLE ?auto_2990 ) ( SURFACE-AT ?auto_2985 ?auto_2989 ) ( ON ?auto_2985 ?auto_2991 ) ( CLEAR ?auto_2985 ) ( TRUCK-AT ?auto_2988 ?auto_2987 ) ( not ( = ?auto_2984 ?auto_2985 ) ) ( not ( = ?auto_2984 ?auto_2991 ) ) ( not ( = ?auto_2985 ?auto_2991 ) ) ( not ( = ?auto_2986 ?auto_2990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2988 ?auto_2987 ?auto_2989 )
      ( !LIFT ?auto_2990 ?auto_2985 ?auto_2991 ?auto_2989 )
      ( !LOAD ?auto_2990 ?auto_2985 ?auto_2988 ?auto_2989 )
      ( !DRIVE ?auto_2988 ?auto_2989 ?auto_2987 )
      ( !UNLOAD ?auto_2986 ?auto_2985 ?auto_2988 ?auto_2987 )
      ( !DROP ?auto_2986 ?auto_2985 ?auto_2984 ?auto_2987 )
      ( MAKE-1CRATE-VERIFY ?auto_2984 ?auto_2985 ) )
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
      ?auto_3005 - HOIST
      ?auto_3001 - PLACE
      ?auto_3004 - PLACE
      ?auto_3000 - HOIST
      ?auto_3002 - SURFACE
      ?auto_3007 - SURFACE
      ?auto_3008 - PLACE
      ?auto_3006 - HOIST
      ?auto_3009 - SURFACE
      ?auto_3003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3005 ?auto_3001 ) ( IS-CRATE ?auto_2999 ) ( not ( = ?auto_3004 ?auto_3001 ) ) ( HOIST-AT ?auto_3000 ?auto_3004 ) ( SURFACE-AT ?auto_2999 ?auto_3004 ) ( ON ?auto_2999 ?auto_3002 ) ( CLEAR ?auto_2999 ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( not ( = ?auto_2998 ?auto_3002 ) ) ( not ( = ?auto_2999 ?auto_3002 ) ) ( not ( = ?auto_3005 ?auto_3000 ) ) ( IS-CRATE ?auto_2998 ) ( AVAILABLE ?auto_3000 ) ( SURFACE-AT ?auto_2998 ?auto_3004 ) ( ON ?auto_2998 ?auto_3007 ) ( CLEAR ?auto_2998 ) ( not ( = ?auto_2997 ?auto_2998 ) ) ( not ( = ?auto_2997 ?auto_3007 ) ) ( not ( = ?auto_2998 ?auto_3007 ) ) ( SURFACE-AT ?auto_2996 ?auto_3001 ) ( CLEAR ?auto_2996 ) ( IS-CRATE ?auto_2997 ) ( AVAILABLE ?auto_3005 ) ( not ( = ?auto_3008 ?auto_3001 ) ) ( HOIST-AT ?auto_3006 ?auto_3008 ) ( AVAILABLE ?auto_3006 ) ( SURFACE-AT ?auto_2997 ?auto_3008 ) ( ON ?auto_2997 ?auto_3009 ) ( CLEAR ?auto_2997 ) ( TRUCK-AT ?auto_3003 ?auto_3001 ) ( not ( = ?auto_2996 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_3009 ) ) ( not ( = ?auto_2997 ?auto_3009 ) ) ( not ( = ?auto_3005 ?auto_3006 ) ) ( not ( = ?auto_2996 ?auto_2998 ) ) ( not ( = ?auto_2996 ?auto_3007 ) ) ( not ( = ?auto_2998 ?auto_3009 ) ) ( not ( = ?auto_3004 ?auto_3008 ) ) ( not ( = ?auto_3000 ?auto_3006 ) ) ( not ( = ?auto_3007 ?auto_3009 ) ) ( not ( = ?auto_2996 ?auto_2999 ) ) ( not ( = ?auto_2996 ?auto_3002 ) ) ( not ( = ?auto_2997 ?auto_2999 ) ) ( not ( = ?auto_2997 ?auto_3002 ) ) ( not ( = ?auto_2999 ?auto_3007 ) ) ( not ( = ?auto_2999 ?auto_3009 ) ) ( not ( = ?auto_3002 ?auto_3007 ) ) ( not ( = ?auto_3002 ?auto_3009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2996 ?auto_2997 ?auto_2998 )
      ( MAKE-1CRATE ?auto_2998 ?auto_2999 )
      ( MAKE-3CRATE-VERIFY ?auto_2996 ?auto_2997 ?auto_2998 ?auto_2999 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3012 - SURFACE
      ?auto_3013 - SURFACE
    )
    :vars
    (
      ?auto_3014 - HOIST
      ?auto_3015 - PLACE
      ?auto_3017 - PLACE
      ?auto_3018 - HOIST
      ?auto_3019 - SURFACE
      ?auto_3016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3014 ?auto_3015 ) ( SURFACE-AT ?auto_3012 ?auto_3015 ) ( CLEAR ?auto_3012 ) ( IS-CRATE ?auto_3013 ) ( AVAILABLE ?auto_3014 ) ( not ( = ?auto_3017 ?auto_3015 ) ) ( HOIST-AT ?auto_3018 ?auto_3017 ) ( AVAILABLE ?auto_3018 ) ( SURFACE-AT ?auto_3013 ?auto_3017 ) ( ON ?auto_3013 ?auto_3019 ) ( CLEAR ?auto_3013 ) ( TRUCK-AT ?auto_3016 ?auto_3015 ) ( not ( = ?auto_3012 ?auto_3013 ) ) ( not ( = ?auto_3012 ?auto_3019 ) ) ( not ( = ?auto_3013 ?auto_3019 ) ) ( not ( = ?auto_3014 ?auto_3018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3016 ?auto_3015 ?auto_3017 )
      ( !LIFT ?auto_3018 ?auto_3013 ?auto_3019 ?auto_3017 )
      ( !LOAD ?auto_3018 ?auto_3013 ?auto_3016 ?auto_3017 )
      ( !DRIVE ?auto_3016 ?auto_3017 ?auto_3015 )
      ( !UNLOAD ?auto_3014 ?auto_3013 ?auto_3016 ?auto_3015 )
      ( !DROP ?auto_3014 ?auto_3013 ?auto_3012 ?auto_3015 )
      ( MAKE-1CRATE-VERIFY ?auto_3012 ?auto_3013 ) )
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
      ?auto_3033 - HOIST
      ?auto_3034 - PLACE
      ?auto_3030 - PLACE
      ?auto_3032 - HOIST
      ?auto_3031 - SURFACE
      ?auto_3037 - SURFACE
      ?auto_3040 - SURFACE
      ?auto_3038 - PLACE
      ?auto_3036 - HOIST
      ?auto_3039 - SURFACE
      ?auto_3035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3033 ?auto_3034 ) ( IS-CRATE ?auto_3029 ) ( not ( = ?auto_3030 ?auto_3034 ) ) ( HOIST-AT ?auto_3032 ?auto_3030 ) ( SURFACE-AT ?auto_3029 ?auto_3030 ) ( ON ?auto_3029 ?auto_3031 ) ( CLEAR ?auto_3029 ) ( not ( = ?auto_3028 ?auto_3029 ) ) ( not ( = ?auto_3028 ?auto_3031 ) ) ( not ( = ?auto_3029 ?auto_3031 ) ) ( not ( = ?auto_3033 ?auto_3032 ) ) ( IS-CRATE ?auto_3028 ) ( SURFACE-AT ?auto_3028 ?auto_3030 ) ( ON ?auto_3028 ?auto_3037 ) ( CLEAR ?auto_3028 ) ( not ( = ?auto_3027 ?auto_3028 ) ) ( not ( = ?auto_3027 ?auto_3037 ) ) ( not ( = ?auto_3028 ?auto_3037 ) ) ( IS-CRATE ?auto_3027 ) ( AVAILABLE ?auto_3032 ) ( SURFACE-AT ?auto_3027 ?auto_3030 ) ( ON ?auto_3027 ?auto_3040 ) ( CLEAR ?auto_3027 ) ( not ( = ?auto_3026 ?auto_3027 ) ) ( not ( = ?auto_3026 ?auto_3040 ) ) ( not ( = ?auto_3027 ?auto_3040 ) ) ( SURFACE-AT ?auto_3025 ?auto_3034 ) ( CLEAR ?auto_3025 ) ( IS-CRATE ?auto_3026 ) ( AVAILABLE ?auto_3033 ) ( not ( = ?auto_3038 ?auto_3034 ) ) ( HOIST-AT ?auto_3036 ?auto_3038 ) ( AVAILABLE ?auto_3036 ) ( SURFACE-AT ?auto_3026 ?auto_3038 ) ( ON ?auto_3026 ?auto_3039 ) ( CLEAR ?auto_3026 ) ( TRUCK-AT ?auto_3035 ?auto_3034 ) ( not ( = ?auto_3025 ?auto_3026 ) ) ( not ( = ?auto_3025 ?auto_3039 ) ) ( not ( = ?auto_3026 ?auto_3039 ) ) ( not ( = ?auto_3033 ?auto_3036 ) ) ( not ( = ?auto_3025 ?auto_3027 ) ) ( not ( = ?auto_3025 ?auto_3040 ) ) ( not ( = ?auto_3027 ?auto_3039 ) ) ( not ( = ?auto_3030 ?auto_3038 ) ) ( not ( = ?auto_3032 ?auto_3036 ) ) ( not ( = ?auto_3040 ?auto_3039 ) ) ( not ( = ?auto_3025 ?auto_3028 ) ) ( not ( = ?auto_3025 ?auto_3037 ) ) ( not ( = ?auto_3026 ?auto_3028 ) ) ( not ( = ?auto_3026 ?auto_3037 ) ) ( not ( = ?auto_3028 ?auto_3040 ) ) ( not ( = ?auto_3028 ?auto_3039 ) ) ( not ( = ?auto_3037 ?auto_3040 ) ) ( not ( = ?auto_3037 ?auto_3039 ) ) ( not ( = ?auto_3025 ?auto_3029 ) ) ( not ( = ?auto_3025 ?auto_3031 ) ) ( not ( = ?auto_3026 ?auto_3029 ) ) ( not ( = ?auto_3026 ?auto_3031 ) ) ( not ( = ?auto_3027 ?auto_3029 ) ) ( not ( = ?auto_3027 ?auto_3031 ) ) ( not ( = ?auto_3029 ?auto_3037 ) ) ( not ( = ?auto_3029 ?auto_3040 ) ) ( not ( = ?auto_3029 ?auto_3039 ) ) ( not ( = ?auto_3031 ?auto_3037 ) ) ( not ( = ?auto_3031 ?auto_3040 ) ) ( not ( = ?auto_3031 ?auto_3039 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_3025 ?auto_3026 ?auto_3027 ?auto_3028 )
      ( MAKE-1CRATE ?auto_3028 ?auto_3029 )
      ( MAKE-4CRATE-VERIFY ?auto_3025 ?auto_3026 ?auto_3027 ?auto_3028 ?auto_3029 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3043 - SURFACE
      ?auto_3044 - SURFACE
    )
    :vars
    (
      ?auto_3045 - HOIST
      ?auto_3046 - PLACE
      ?auto_3048 - PLACE
      ?auto_3049 - HOIST
      ?auto_3050 - SURFACE
      ?auto_3047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3045 ?auto_3046 ) ( SURFACE-AT ?auto_3043 ?auto_3046 ) ( CLEAR ?auto_3043 ) ( IS-CRATE ?auto_3044 ) ( AVAILABLE ?auto_3045 ) ( not ( = ?auto_3048 ?auto_3046 ) ) ( HOIST-AT ?auto_3049 ?auto_3048 ) ( AVAILABLE ?auto_3049 ) ( SURFACE-AT ?auto_3044 ?auto_3048 ) ( ON ?auto_3044 ?auto_3050 ) ( CLEAR ?auto_3044 ) ( TRUCK-AT ?auto_3047 ?auto_3046 ) ( not ( = ?auto_3043 ?auto_3044 ) ) ( not ( = ?auto_3043 ?auto_3050 ) ) ( not ( = ?auto_3044 ?auto_3050 ) ) ( not ( = ?auto_3045 ?auto_3049 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3047 ?auto_3046 ?auto_3048 )
      ( !LIFT ?auto_3049 ?auto_3044 ?auto_3050 ?auto_3048 )
      ( !LOAD ?auto_3049 ?auto_3044 ?auto_3047 ?auto_3048 )
      ( !DRIVE ?auto_3047 ?auto_3048 ?auto_3046 )
      ( !UNLOAD ?auto_3045 ?auto_3044 ?auto_3047 ?auto_3046 )
      ( !DROP ?auto_3045 ?auto_3044 ?auto_3043 ?auto_3046 )
      ( MAKE-1CRATE-VERIFY ?auto_3043 ?auto_3044 ) )
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
      ?auto_3067 - HOIST
      ?auto_3068 - PLACE
      ?auto_3066 - PLACE
      ?auto_3065 - HOIST
      ?auto_3064 - SURFACE
      ?auto_3076 - PLACE
      ?auto_3069 - HOIST
      ?auto_3071 - SURFACE
      ?auto_3073 - SURFACE
      ?auto_3070 - SURFACE
      ?auto_3074 - PLACE
      ?auto_3072 - HOIST
      ?auto_3075 - SURFACE
      ?auto_3063 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3067 ?auto_3068 ) ( IS-CRATE ?auto_3062 ) ( not ( = ?auto_3066 ?auto_3068 ) ) ( HOIST-AT ?auto_3065 ?auto_3066 ) ( AVAILABLE ?auto_3065 ) ( SURFACE-AT ?auto_3062 ?auto_3066 ) ( ON ?auto_3062 ?auto_3064 ) ( CLEAR ?auto_3062 ) ( not ( = ?auto_3061 ?auto_3062 ) ) ( not ( = ?auto_3061 ?auto_3064 ) ) ( not ( = ?auto_3062 ?auto_3064 ) ) ( not ( = ?auto_3067 ?auto_3065 ) ) ( IS-CRATE ?auto_3061 ) ( not ( = ?auto_3076 ?auto_3068 ) ) ( HOIST-AT ?auto_3069 ?auto_3076 ) ( SURFACE-AT ?auto_3061 ?auto_3076 ) ( ON ?auto_3061 ?auto_3071 ) ( CLEAR ?auto_3061 ) ( not ( = ?auto_3060 ?auto_3061 ) ) ( not ( = ?auto_3060 ?auto_3071 ) ) ( not ( = ?auto_3061 ?auto_3071 ) ) ( not ( = ?auto_3067 ?auto_3069 ) ) ( IS-CRATE ?auto_3060 ) ( SURFACE-AT ?auto_3060 ?auto_3076 ) ( ON ?auto_3060 ?auto_3073 ) ( CLEAR ?auto_3060 ) ( not ( = ?auto_3059 ?auto_3060 ) ) ( not ( = ?auto_3059 ?auto_3073 ) ) ( not ( = ?auto_3060 ?auto_3073 ) ) ( IS-CRATE ?auto_3059 ) ( AVAILABLE ?auto_3069 ) ( SURFACE-AT ?auto_3059 ?auto_3076 ) ( ON ?auto_3059 ?auto_3070 ) ( CLEAR ?auto_3059 ) ( not ( = ?auto_3058 ?auto_3059 ) ) ( not ( = ?auto_3058 ?auto_3070 ) ) ( not ( = ?auto_3059 ?auto_3070 ) ) ( SURFACE-AT ?auto_3057 ?auto_3068 ) ( CLEAR ?auto_3057 ) ( IS-CRATE ?auto_3058 ) ( AVAILABLE ?auto_3067 ) ( not ( = ?auto_3074 ?auto_3068 ) ) ( HOIST-AT ?auto_3072 ?auto_3074 ) ( AVAILABLE ?auto_3072 ) ( SURFACE-AT ?auto_3058 ?auto_3074 ) ( ON ?auto_3058 ?auto_3075 ) ( CLEAR ?auto_3058 ) ( TRUCK-AT ?auto_3063 ?auto_3068 ) ( not ( = ?auto_3057 ?auto_3058 ) ) ( not ( = ?auto_3057 ?auto_3075 ) ) ( not ( = ?auto_3058 ?auto_3075 ) ) ( not ( = ?auto_3067 ?auto_3072 ) ) ( not ( = ?auto_3057 ?auto_3059 ) ) ( not ( = ?auto_3057 ?auto_3070 ) ) ( not ( = ?auto_3059 ?auto_3075 ) ) ( not ( = ?auto_3076 ?auto_3074 ) ) ( not ( = ?auto_3069 ?auto_3072 ) ) ( not ( = ?auto_3070 ?auto_3075 ) ) ( not ( = ?auto_3057 ?auto_3060 ) ) ( not ( = ?auto_3057 ?auto_3073 ) ) ( not ( = ?auto_3058 ?auto_3060 ) ) ( not ( = ?auto_3058 ?auto_3073 ) ) ( not ( = ?auto_3060 ?auto_3070 ) ) ( not ( = ?auto_3060 ?auto_3075 ) ) ( not ( = ?auto_3073 ?auto_3070 ) ) ( not ( = ?auto_3073 ?auto_3075 ) ) ( not ( = ?auto_3057 ?auto_3061 ) ) ( not ( = ?auto_3057 ?auto_3071 ) ) ( not ( = ?auto_3058 ?auto_3061 ) ) ( not ( = ?auto_3058 ?auto_3071 ) ) ( not ( = ?auto_3059 ?auto_3061 ) ) ( not ( = ?auto_3059 ?auto_3071 ) ) ( not ( = ?auto_3061 ?auto_3073 ) ) ( not ( = ?auto_3061 ?auto_3070 ) ) ( not ( = ?auto_3061 ?auto_3075 ) ) ( not ( = ?auto_3071 ?auto_3073 ) ) ( not ( = ?auto_3071 ?auto_3070 ) ) ( not ( = ?auto_3071 ?auto_3075 ) ) ( not ( = ?auto_3057 ?auto_3062 ) ) ( not ( = ?auto_3057 ?auto_3064 ) ) ( not ( = ?auto_3058 ?auto_3062 ) ) ( not ( = ?auto_3058 ?auto_3064 ) ) ( not ( = ?auto_3059 ?auto_3062 ) ) ( not ( = ?auto_3059 ?auto_3064 ) ) ( not ( = ?auto_3060 ?auto_3062 ) ) ( not ( = ?auto_3060 ?auto_3064 ) ) ( not ( = ?auto_3062 ?auto_3071 ) ) ( not ( = ?auto_3062 ?auto_3073 ) ) ( not ( = ?auto_3062 ?auto_3070 ) ) ( not ( = ?auto_3062 ?auto_3075 ) ) ( not ( = ?auto_3066 ?auto_3076 ) ) ( not ( = ?auto_3066 ?auto_3074 ) ) ( not ( = ?auto_3065 ?auto_3069 ) ) ( not ( = ?auto_3065 ?auto_3072 ) ) ( not ( = ?auto_3064 ?auto_3071 ) ) ( not ( = ?auto_3064 ?auto_3073 ) ) ( not ( = ?auto_3064 ?auto_3070 ) ) ( not ( = ?auto_3064 ?auto_3075 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_3057 ?auto_3058 ?auto_3059 ?auto_3060 ?auto_3061 )
      ( MAKE-1CRATE ?auto_3061 ?auto_3062 )
      ( MAKE-5CRATE-VERIFY ?auto_3057 ?auto_3058 ?auto_3059 ?auto_3060 ?auto_3061 ?auto_3062 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3079 - SURFACE
      ?auto_3080 - SURFACE
    )
    :vars
    (
      ?auto_3081 - HOIST
      ?auto_3082 - PLACE
      ?auto_3084 - PLACE
      ?auto_3085 - HOIST
      ?auto_3086 - SURFACE
      ?auto_3083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3081 ?auto_3082 ) ( SURFACE-AT ?auto_3079 ?auto_3082 ) ( CLEAR ?auto_3079 ) ( IS-CRATE ?auto_3080 ) ( AVAILABLE ?auto_3081 ) ( not ( = ?auto_3084 ?auto_3082 ) ) ( HOIST-AT ?auto_3085 ?auto_3084 ) ( AVAILABLE ?auto_3085 ) ( SURFACE-AT ?auto_3080 ?auto_3084 ) ( ON ?auto_3080 ?auto_3086 ) ( CLEAR ?auto_3080 ) ( TRUCK-AT ?auto_3083 ?auto_3082 ) ( not ( = ?auto_3079 ?auto_3080 ) ) ( not ( = ?auto_3079 ?auto_3086 ) ) ( not ( = ?auto_3080 ?auto_3086 ) ) ( not ( = ?auto_3081 ?auto_3085 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3083 ?auto_3082 ?auto_3084 )
      ( !LIFT ?auto_3085 ?auto_3080 ?auto_3086 ?auto_3084 )
      ( !LOAD ?auto_3085 ?auto_3080 ?auto_3083 ?auto_3084 )
      ( !DRIVE ?auto_3083 ?auto_3084 ?auto_3082 )
      ( !UNLOAD ?auto_3081 ?auto_3080 ?auto_3083 ?auto_3082 )
      ( !DROP ?auto_3081 ?auto_3080 ?auto_3079 ?auto_3082 )
      ( MAKE-1CRATE-VERIFY ?auto_3079 ?auto_3080 ) )
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
      ?auto_3106 - HOIST
      ?auto_3105 - PLACE
      ?auto_3103 - PLACE
      ?auto_3101 - HOIST
      ?auto_3102 - SURFACE
      ?auto_3116 - PLACE
      ?auto_3117 - HOIST
      ?auto_3115 - SURFACE
      ?auto_3109 - PLACE
      ?auto_3112 - HOIST
      ?auto_3110 - SURFACE
      ?auto_3114 - SURFACE
      ?auto_3113 - SURFACE
      ?auto_3107 - PLACE
      ?auto_3111 - HOIST
      ?auto_3108 - SURFACE
      ?auto_3104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3106 ?auto_3105 ) ( IS-CRATE ?auto_3100 ) ( not ( = ?auto_3103 ?auto_3105 ) ) ( HOIST-AT ?auto_3101 ?auto_3103 ) ( AVAILABLE ?auto_3101 ) ( SURFACE-AT ?auto_3100 ?auto_3103 ) ( ON ?auto_3100 ?auto_3102 ) ( CLEAR ?auto_3100 ) ( not ( = ?auto_3099 ?auto_3100 ) ) ( not ( = ?auto_3099 ?auto_3102 ) ) ( not ( = ?auto_3100 ?auto_3102 ) ) ( not ( = ?auto_3106 ?auto_3101 ) ) ( IS-CRATE ?auto_3099 ) ( not ( = ?auto_3116 ?auto_3105 ) ) ( HOIST-AT ?auto_3117 ?auto_3116 ) ( AVAILABLE ?auto_3117 ) ( SURFACE-AT ?auto_3099 ?auto_3116 ) ( ON ?auto_3099 ?auto_3115 ) ( CLEAR ?auto_3099 ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( not ( = ?auto_3098 ?auto_3115 ) ) ( not ( = ?auto_3099 ?auto_3115 ) ) ( not ( = ?auto_3106 ?auto_3117 ) ) ( IS-CRATE ?auto_3098 ) ( not ( = ?auto_3109 ?auto_3105 ) ) ( HOIST-AT ?auto_3112 ?auto_3109 ) ( SURFACE-AT ?auto_3098 ?auto_3109 ) ( ON ?auto_3098 ?auto_3110 ) ( CLEAR ?auto_3098 ) ( not ( = ?auto_3097 ?auto_3098 ) ) ( not ( = ?auto_3097 ?auto_3110 ) ) ( not ( = ?auto_3098 ?auto_3110 ) ) ( not ( = ?auto_3106 ?auto_3112 ) ) ( IS-CRATE ?auto_3097 ) ( SURFACE-AT ?auto_3097 ?auto_3109 ) ( ON ?auto_3097 ?auto_3114 ) ( CLEAR ?auto_3097 ) ( not ( = ?auto_3096 ?auto_3097 ) ) ( not ( = ?auto_3096 ?auto_3114 ) ) ( not ( = ?auto_3097 ?auto_3114 ) ) ( IS-CRATE ?auto_3096 ) ( AVAILABLE ?auto_3112 ) ( SURFACE-AT ?auto_3096 ?auto_3109 ) ( ON ?auto_3096 ?auto_3113 ) ( CLEAR ?auto_3096 ) ( not ( = ?auto_3095 ?auto_3096 ) ) ( not ( = ?auto_3095 ?auto_3113 ) ) ( not ( = ?auto_3096 ?auto_3113 ) ) ( SURFACE-AT ?auto_3094 ?auto_3105 ) ( CLEAR ?auto_3094 ) ( IS-CRATE ?auto_3095 ) ( AVAILABLE ?auto_3106 ) ( not ( = ?auto_3107 ?auto_3105 ) ) ( HOIST-AT ?auto_3111 ?auto_3107 ) ( AVAILABLE ?auto_3111 ) ( SURFACE-AT ?auto_3095 ?auto_3107 ) ( ON ?auto_3095 ?auto_3108 ) ( CLEAR ?auto_3095 ) ( TRUCK-AT ?auto_3104 ?auto_3105 ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3094 ?auto_3108 ) ) ( not ( = ?auto_3095 ?auto_3108 ) ) ( not ( = ?auto_3106 ?auto_3111 ) ) ( not ( = ?auto_3094 ?auto_3096 ) ) ( not ( = ?auto_3094 ?auto_3113 ) ) ( not ( = ?auto_3096 ?auto_3108 ) ) ( not ( = ?auto_3109 ?auto_3107 ) ) ( not ( = ?auto_3112 ?auto_3111 ) ) ( not ( = ?auto_3113 ?auto_3108 ) ) ( not ( = ?auto_3094 ?auto_3097 ) ) ( not ( = ?auto_3094 ?auto_3114 ) ) ( not ( = ?auto_3095 ?auto_3097 ) ) ( not ( = ?auto_3095 ?auto_3114 ) ) ( not ( = ?auto_3097 ?auto_3113 ) ) ( not ( = ?auto_3097 ?auto_3108 ) ) ( not ( = ?auto_3114 ?auto_3113 ) ) ( not ( = ?auto_3114 ?auto_3108 ) ) ( not ( = ?auto_3094 ?auto_3098 ) ) ( not ( = ?auto_3094 ?auto_3110 ) ) ( not ( = ?auto_3095 ?auto_3098 ) ) ( not ( = ?auto_3095 ?auto_3110 ) ) ( not ( = ?auto_3096 ?auto_3098 ) ) ( not ( = ?auto_3096 ?auto_3110 ) ) ( not ( = ?auto_3098 ?auto_3114 ) ) ( not ( = ?auto_3098 ?auto_3113 ) ) ( not ( = ?auto_3098 ?auto_3108 ) ) ( not ( = ?auto_3110 ?auto_3114 ) ) ( not ( = ?auto_3110 ?auto_3113 ) ) ( not ( = ?auto_3110 ?auto_3108 ) ) ( not ( = ?auto_3094 ?auto_3099 ) ) ( not ( = ?auto_3094 ?auto_3115 ) ) ( not ( = ?auto_3095 ?auto_3099 ) ) ( not ( = ?auto_3095 ?auto_3115 ) ) ( not ( = ?auto_3096 ?auto_3099 ) ) ( not ( = ?auto_3096 ?auto_3115 ) ) ( not ( = ?auto_3097 ?auto_3099 ) ) ( not ( = ?auto_3097 ?auto_3115 ) ) ( not ( = ?auto_3099 ?auto_3110 ) ) ( not ( = ?auto_3099 ?auto_3114 ) ) ( not ( = ?auto_3099 ?auto_3113 ) ) ( not ( = ?auto_3099 ?auto_3108 ) ) ( not ( = ?auto_3116 ?auto_3109 ) ) ( not ( = ?auto_3116 ?auto_3107 ) ) ( not ( = ?auto_3117 ?auto_3112 ) ) ( not ( = ?auto_3117 ?auto_3111 ) ) ( not ( = ?auto_3115 ?auto_3110 ) ) ( not ( = ?auto_3115 ?auto_3114 ) ) ( not ( = ?auto_3115 ?auto_3113 ) ) ( not ( = ?auto_3115 ?auto_3108 ) ) ( not ( = ?auto_3094 ?auto_3100 ) ) ( not ( = ?auto_3094 ?auto_3102 ) ) ( not ( = ?auto_3095 ?auto_3100 ) ) ( not ( = ?auto_3095 ?auto_3102 ) ) ( not ( = ?auto_3096 ?auto_3100 ) ) ( not ( = ?auto_3096 ?auto_3102 ) ) ( not ( = ?auto_3097 ?auto_3100 ) ) ( not ( = ?auto_3097 ?auto_3102 ) ) ( not ( = ?auto_3098 ?auto_3100 ) ) ( not ( = ?auto_3098 ?auto_3102 ) ) ( not ( = ?auto_3100 ?auto_3115 ) ) ( not ( = ?auto_3100 ?auto_3110 ) ) ( not ( = ?auto_3100 ?auto_3114 ) ) ( not ( = ?auto_3100 ?auto_3113 ) ) ( not ( = ?auto_3100 ?auto_3108 ) ) ( not ( = ?auto_3103 ?auto_3116 ) ) ( not ( = ?auto_3103 ?auto_3109 ) ) ( not ( = ?auto_3103 ?auto_3107 ) ) ( not ( = ?auto_3101 ?auto_3117 ) ) ( not ( = ?auto_3101 ?auto_3112 ) ) ( not ( = ?auto_3101 ?auto_3111 ) ) ( not ( = ?auto_3102 ?auto_3115 ) ) ( not ( = ?auto_3102 ?auto_3110 ) ) ( not ( = ?auto_3102 ?auto_3114 ) ) ( not ( = ?auto_3102 ?auto_3113 ) ) ( not ( = ?auto_3102 ?auto_3108 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3099 )
      ( MAKE-1CRATE ?auto_3099 ?auto_3100 )
      ( MAKE-6CRATE-VERIFY ?auto_3094 ?auto_3095 ?auto_3096 ?auto_3097 ?auto_3098 ?auto_3099 ?auto_3100 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_3120 - SURFACE
      ?auto_3121 - SURFACE
    )
    :vars
    (
      ?auto_3122 - HOIST
      ?auto_3123 - PLACE
      ?auto_3125 - PLACE
      ?auto_3126 - HOIST
      ?auto_3127 - SURFACE
      ?auto_3124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3122 ?auto_3123 ) ( SURFACE-AT ?auto_3120 ?auto_3123 ) ( CLEAR ?auto_3120 ) ( IS-CRATE ?auto_3121 ) ( AVAILABLE ?auto_3122 ) ( not ( = ?auto_3125 ?auto_3123 ) ) ( HOIST-AT ?auto_3126 ?auto_3125 ) ( AVAILABLE ?auto_3126 ) ( SURFACE-AT ?auto_3121 ?auto_3125 ) ( ON ?auto_3121 ?auto_3127 ) ( CLEAR ?auto_3121 ) ( TRUCK-AT ?auto_3124 ?auto_3123 ) ( not ( = ?auto_3120 ?auto_3121 ) ) ( not ( = ?auto_3120 ?auto_3127 ) ) ( not ( = ?auto_3121 ?auto_3127 ) ) ( not ( = ?auto_3122 ?auto_3126 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_3124 ?auto_3123 ?auto_3125 )
      ( !LIFT ?auto_3126 ?auto_3121 ?auto_3127 ?auto_3125 )
      ( !LOAD ?auto_3126 ?auto_3121 ?auto_3124 ?auto_3125 )
      ( !DRIVE ?auto_3124 ?auto_3125 ?auto_3123 )
      ( !UNLOAD ?auto_3122 ?auto_3121 ?auto_3124 ?auto_3123 )
      ( !DROP ?auto_3122 ?auto_3121 ?auto_3120 ?auto_3123 )
      ( MAKE-1CRATE-VERIFY ?auto_3120 ?auto_3121 ) )
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
      ?auto_3146 - HOIST
      ?auto_3147 - PLACE
      ?auto_3145 - PLACE
      ?auto_3149 - HOIST
      ?auto_3148 - SURFACE
      ?auto_3163 - PLACE
      ?auto_3162 - HOIST
      ?auto_3160 - SURFACE
      ?auto_3155 - PLACE
      ?auto_3154 - HOIST
      ?auto_3153 - SURFACE
      ?auto_3151 - PLACE
      ?auto_3158 - HOIST
      ?auto_3152 - SURFACE
      ?auto_3156 - SURFACE
      ?auto_3157 - SURFACE
      ?auto_3161 - PLACE
      ?auto_3159 - HOIST
      ?auto_3150 - SURFACE
      ?auto_3144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_3146 ?auto_3147 ) ( IS-CRATE ?auto_3143 ) ( not ( = ?auto_3145 ?auto_3147 ) ) ( HOIST-AT ?auto_3149 ?auto_3145 ) ( AVAILABLE ?auto_3149 ) ( SURFACE-AT ?auto_3143 ?auto_3145 ) ( ON ?auto_3143 ?auto_3148 ) ( CLEAR ?auto_3143 ) ( not ( = ?auto_3142 ?auto_3143 ) ) ( not ( = ?auto_3142 ?auto_3148 ) ) ( not ( = ?auto_3143 ?auto_3148 ) ) ( not ( = ?auto_3146 ?auto_3149 ) ) ( IS-CRATE ?auto_3142 ) ( not ( = ?auto_3163 ?auto_3147 ) ) ( HOIST-AT ?auto_3162 ?auto_3163 ) ( AVAILABLE ?auto_3162 ) ( SURFACE-AT ?auto_3142 ?auto_3163 ) ( ON ?auto_3142 ?auto_3160 ) ( CLEAR ?auto_3142 ) ( not ( = ?auto_3141 ?auto_3142 ) ) ( not ( = ?auto_3141 ?auto_3160 ) ) ( not ( = ?auto_3142 ?auto_3160 ) ) ( not ( = ?auto_3146 ?auto_3162 ) ) ( IS-CRATE ?auto_3141 ) ( not ( = ?auto_3155 ?auto_3147 ) ) ( HOIST-AT ?auto_3154 ?auto_3155 ) ( AVAILABLE ?auto_3154 ) ( SURFACE-AT ?auto_3141 ?auto_3155 ) ( ON ?auto_3141 ?auto_3153 ) ( CLEAR ?auto_3141 ) ( not ( = ?auto_3140 ?auto_3141 ) ) ( not ( = ?auto_3140 ?auto_3153 ) ) ( not ( = ?auto_3141 ?auto_3153 ) ) ( not ( = ?auto_3146 ?auto_3154 ) ) ( IS-CRATE ?auto_3140 ) ( not ( = ?auto_3151 ?auto_3147 ) ) ( HOIST-AT ?auto_3158 ?auto_3151 ) ( SURFACE-AT ?auto_3140 ?auto_3151 ) ( ON ?auto_3140 ?auto_3152 ) ( CLEAR ?auto_3140 ) ( not ( = ?auto_3139 ?auto_3140 ) ) ( not ( = ?auto_3139 ?auto_3152 ) ) ( not ( = ?auto_3140 ?auto_3152 ) ) ( not ( = ?auto_3146 ?auto_3158 ) ) ( IS-CRATE ?auto_3139 ) ( SURFACE-AT ?auto_3139 ?auto_3151 ) ( ON ?auto_3139 ?auto_3156 ) ( CLEAR ?auto_3139 ) ( not ( = ?auto_3138 ?auto_3139 ) ) ( not ( = ?auto_3138 ?auto_3156 ) ) ( not ( = ?auto_3139 ?auto_3156 ) ) ( IS-CRATE ?auto_3138 ) ( AVAILABLE ?auto_3158 ) ( SURFACE-AT ?auto_3138 ?auto_3151 ) ( ON ?auto_3138 ?auto_3157 ) ( CLEAR ?auto_3138 ) ( not ( = ?auto_3137 ?auto_3138 ) ) ( not ( = ?auto_3137 ?auto_3157 ) ) ( not ( = ?auto_3138 ?auto_3157 ) ) ( SURFACE-AT ?auto_3136 ?auto_3147 ) ( CLEAR ?auto_3136 ) ( IS-CRATE ?auto_3137 ) ( AVAILABLE ?auto_3146 ) ( not ( = ?auto_3161 ?auto_3147 ) ) ( HOIST-AT ?auto_3159 ?auto_3161 ) ( AVAILABLE ?auto_3159 ) ( SURFACE-AT ?auto_3137 ?auto_3161 ) ( ON ?auto_3137 ?auto_3150 ) ( CLEAR ?auto_3137 ) ( TRUCK-AT ?auto_3144 ?auto_3147 ) ( not ( = ?auto_3136 ?auto_3137 ) ) ( not ( = ?auto_3136 ?auto_3150 ) ) ( not ( = ?auto_3137 ?auto_3150 ) ) ( not ( = ?auto_3146 ?auto_3159 ) ) ( not ( = ?auto_3136 ?auto_3138 ) ) ( not ( = ?auto_3136 ?auto_3157 ) ) ( not ( = ?auto_3138 ?auto_3150 ) ) ( not ( = ?auto_3151 ?auto_3161 ) ) ( not ( = ?auto_3158 ?auto_3159 ) ) ( not ( = ?auto_3157 ?auto_3150 ) ) ( not ( = ?auto_3136 ?auto_3139 ) ) ( not ( = ?auto_3136 ?auto_3156 ) ) ( not ( = ?auto_3137 ?auto_3139 ) ) ( not ( = ?auto_3137 ?auto_3156 ) ) ( not ( = ?auto_3139 ?auto_3157 ) ) ( not ( = ?auto_3139 ?auto_3150 ) ) ( not ( = ?auto_3156 ?auto_3157 ) ) ( not ( = ?auto_3156 ?auto_3150 ) ) ( not ( = ?auto_3136 ?auto_3140 ) ) ( not ( = ?auto_3136 ?auto_3152 ) ) ( not ( = ?auto_3137 ?auto_3140 ) ) ( not ( = ?auto_3137 ?auto_3152 ) ) ( not ( = ?auto_3138 ?auto_3140 ) ) ( not ( = ?auto_3138 ?auto_3152 ) ) ( not ( = ?auto_3140 ?auto_3156 ) ) ( not ( = ?auto_3140 ?auto_3157 ) ) ( not ( = ?auto_3140 ?auto_3150 ) ) ( not ( = ?auto_3152 ?auto_3156 ) ) ( not ( = ?auto_3152 ?auto_3157 ) ) ( not ( = ?auto_3152 ?auto_3150 ) ) ( not ( = ?auto_3136 ?auto_3141 ) ) ( not ( = ?auto_3136 ?auto_3153 ) ) ( not ( = ?auto_3137 ?auto_3141 ) ) ( not ( = ?auto_3137 ?auto_3153 ) ) ( not ( = ?auto_3138 ?auto_3141 ) ) ( not ( = ?auto_3138 ?auto_3153 ) ) ( not ( = ?auto_3139 ?auto_3141 ) ) ( not ( = ?auto_3139 ?auto_3153 ) ) ( not ( = ?auto_3141 ?auto_3152 ) ) ( not ( = ?auto_3141 ?auto_3156 ) ) ( not ( = ?auto_3141 ?auto_3157 ) ) ( not ( = ?auto_3141 ?auto_3150 ) ) ( not ( = ?auto_3155 ?auto_3151 ) ) ( not ( = ?auto_3155 ?auto_3161 ) ) ( not ( = ?auto_3154 ?auto_3158 ) ) ( not ( = ?auto_3154 ?auto_3159 ) ) ( not ( = ?auto_3153 ?auto_3152 ) ) ( not ( = ?auto_3153 ?auto_3156 ) ) ( not ( = ?auto_3153 ?auto_3157 ) ) ( not ( = ?auto_3153 ?auto_3150 ) ) ( not ( = ?auto_3136 ?auto_3142 ) ) ( not ( = ?auto_3136 ?auto_3160 ) ) ( not ( = ?auto_3137 ?auto_3142 ) ) ( not ( = ?auto_3137 ?auto_3160 ) ) ( not ( = ?auto_3138 ?auto_3142 ) ) ( not ( = ?auto_3138 ?auto_3160 ) ) ( not ( = ?auto_3139 ?auto_3142 ) ) ( not ( = ?auto_3139 ?auto_3160 ) ) ( not ( = ?auto_3140 ?auto_3142 ) ) ( not ( = ?auto_3140 ?auto_3160 ) ) ( not ( = ?auto_3142 ?auto_3153 ) ) ( not ( = ?auto_3142 ?auto_3152 ) ) ( not ( = ?auto_3142 ?auto_3156 ) ) ( not ( = ?auto_3142 ?auto_3157 ) ) ( not ( = ?auto_3142 ?auto_3150 ) ) ( not ( = ?auto_3163 ?auto_3155 ) ) ( not ( = ?auto_3163 ?auto_3151 ) ) ( not ( = ?auto_3163 ?auto_3161 ) ) ( not ( = ?auto_3162 ?auto_3154 ) ) ( not ( = ?auto_3162 ?auto_3158 ) ) ( not ( = ?auto_3162 ?auto_3159 ) ) ( not ( = ?auto_3160 ?auto_3153 ) ) ( not ( = ?auto_3160 ?auto_3152 ) ) ( not ( = ?auto_3160 ?auto_3156 ) ) ( not ( = ?auto_3160 ?auto_3157 ) ) ( not ( = ?auto_3160 ?auto_3150 ) ) ( not ( = ?auto_3136 ?auto_3143 ) ) ( not ( = ?auto_3136 ?auto_3148 ) ) ( not ( = ?auto_3137 ?auto_3143 ) ) ( not ( = ?auto_3137 ?auto_3148 ) ) ( not ( = ?auto_3138 ?auto_3143 ) ) ( not ( = ?auto_3138 ?auto_3148 ) ) ( not ( = ?auto_3139 ?auto_3143 ) ) ( not ( = ?auto_3139 ?auto_3148 ) ) ( not ( = ?auto_3140 ?auto_3143 ) ) ( not ( = ?auto_3140 ?auto_3148 ) ) ( not ( = ?auto_3141 ?auto_3143 ) ) ( not ( = ?auto_3141 ?auto_3148 ) ) ( not ( = ?auto_3143 ?auto_3160 ) ) ( not ( = ?auto_3143 ?auto_3153 ) ) ( not ( = ?auto_3143 ?auto_3152 ) ) ( not ( = ?auto_3143 ?auto_3156 ) ) ( not ( = ?auto_3143 ?auto_3157 ) ) ( not ( = ?auto_3143 ?auto_3150 ) ) ( not ( = ?auto_3145 ?auto_3163 ) ) ( not ( = ?auto_3145 ?auto_3155 ) ) ( not ( = ?auto_3145 ?auto_3151 ) ) ( not ( = ?auto_3145 ?auto_3161 ) ) ( not ( = ?auto_3149 ?auto_3162 ) ) ( not ( = ?auto_3149 ?auto_3154 ) ) ( not ( = ?auto_3149 ?auto_3158 ) ) ( not ( = ?auto_3149 ?auto_3159 ) ) ( not ( = ?auto_3148 ?auto_3160 ) ) ( not ( = ?auto_3148 ?auto_3153 ) ) ( not ( = ?auto_3148 ?auto_3152 ) ) ( not ( = ?auto_3148 ?auto_3156 ) ) ( not ( = ?auto_3148 ?auto_3157 ) ) ( not ( = ?auto_3148 ?auto_3150 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3139 ?auto_3140 ?auto_3141 ?auto_3142 )
      ( MAKE-1CRATE ?auto_3142 ?auto_3143 )
      ( MAKE-7CRATE-VERIFY ?auto_3136 ?auto_3137 ?auto_3138 ?auto_3139 ?auto_3140 ?auto_3141 ?auto_3142 ?auto_3143 ) )
  )

)

