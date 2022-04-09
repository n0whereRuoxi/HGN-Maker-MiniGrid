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
      ?auto_89953 - SURFACE
      ?auto_89954 - SURFACE
    )
    :vars
    (
      ?auto_89955 - HOIST
      ?auto_89956 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_89955 ?auto_89956 ) ( SURFACE-AT ?auto_89953 ?auto_89956 ) ( CLEAR ?auto_89953 ) ( LIFTING ?auto_89955 ?auto_89954 ) ( IS-CRATE ?auto_89954 ) ( not ( = ?auto_89953 ?auto_89954 ) ) )
    :subtasks
    ( ( !DROP ?auto_89955 ?auto_89954 ?auto_89953 ?auto_89956 )
      ( MAKE-1CRATE-VERIFY ?auto_89953 ?auto_89954 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_89957 - SURFACE
      ?auto_89958 - SURFACE
    )
    :vars
    (
      ?auto_89960 - HOIST
      ?auto_89959 - PLACE
      ?auto_89961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_89960 ?auto_89959 ) ( SURFACE-AT ?auto_89957 ?auto_89959 ) ( CLEAR ?auto_89957 ) ( IS-CRATE ?auto_89958 ) ( not ( = ?auto_89957 ?auto_89958 ) ) ( TRUCK-AT ?auto_89961 ?auto_89959 ) ( AVAILABLE ?auto_89960 ) ( IN ?auto_89958 ?auto_89961 ) )
    :subtasks
    ( ( !UNLOAD ?auto_89960 ?auto_89958 ?auto_89961 ?auto_89959 )
      ( MAKE-1CRATE ?auto_89957 ?auto_89958 )
      ( MAKE-1CRATE-VERIFY ?auto_89957 ?auto_89958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_89962 - SURFACE
      ?auto_89963 - SURFACE
    )
    :vars
    (
      ?auto_89965 - HOIST
      ?auto_89966 - PLACE
      ?auto_89964 - TRUCK
      ?auto_89967 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_89965 ?auto_89966 ) ( SURFACE-AT ?auto_89962 ?auto_89966 ) ( CLEAR ?auto_89962 ) ( IS-CRATE ?auto_89963 ) ( not ( = ?auto_89962 ?auto_89963 ) ) ( AVAILABLE ?auto_89965 ) ( IN ?auto_89963 ?auto_89964 ) ( TRUCK-AT ?auto_89964 ?auto_89967 ) ( not ( = ?auto_89967 ?auto_89966 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_89964 ?auto_89967 ?auto_89966 )
      ( MAKE-1CRATE ?auto_89962 ?auto_89963 )
      ( MAKE-1CRATE-VERIFY ?auto_89962 ?auto_89963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_89968 - SURFACE
      ?auto_89969 - SURFACE
    )
    :vars
    (
      ?auto_89971 - HOIST
      ?auto_89973 - PLACE
      ?auto_89970 - TRUCK
      ?auto_89972 - PLACE
      ?auto_89974 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_89971 ?auto_89973 ) ( SURFACE-AT ?auto_89968 ?auto_89973 ) ( CLEAR ?auto_89968 ) ( IS-CRATE ?auto_89969 ) ( not ( = ?auto_89968 ?auto_89969 ) ) ( AVAILABLE ?auto_89971 ) ( TRUCK-AT ?auto_89970 ?auto_89972 ) ( not ( = ?auto_89972 ?auto_89973 ) ) ( HOIST-AT ?auto_89974 ?auto_89972 ) ( LIFTING ?auto_89974 ?auto_89969 ) ( not ( = ?auto_89971 ?auto_89974 ) ) )
    :subtasks
    ( ( !LOAD ?auto_89974 ?auto_89969 ?auto_89970 ?auto_89972 )
      ( MAKE-1CRATE ?auto_89968 ?auto_89969 )
      ( MAKE-1CRATE-VERIFY ?auto_89968 ?auto_89969 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_89975 - SURFACE
      ?auto_89976 - SURFACE
    )
    :vars
    (
      ?auto_89978 - HOIST
      ?auto_89981 - PLACE
      ?auto_89977 - TRUCK
      ?auto_89979 - PLACE
      ?auto_89980 - HOIST
      ?auto_89982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_89978 ?auto_89981 ) ( SURFACE-AT ?auto_89975 ?auto_89981 ) ( CLEAR ?auto_89975 ) ( IS-CRATE ?auto_89976 ) ( not ( = ?auto_89975 ?auto_89976 ) ) ( AVAILABLE ?auto_89978 ) ( TRUCK-AT ?auto_89977 ?auto_89979 ) ( not ( = ?auto_89979 ?auto_89981 ) ) ( HOIST-AT ?auto_89980 ?auto_89979 ) ( not ( = ?auto_89978 ?auto_89980 ) ) ( AVAILABLE ?auto_89980 ) ( SURFACE-AT ?auto_89976 ?auto_89979 ) ( ON ?auto_89976 ?auto_89982 ) ( CLEAR ?auto_89976 ) ( not ( = ?auto_89975 ?auto_89982 ) ) ( not ( = ?auto_89976 ?auto_89982 ) ) )
    :subtasks
    ( ( !LIFT ?auto_89980 ?auto_89976 ?auto_89982 ?auto_89979 )
      ( MAKE-1CRATE ?auto_89975 ?auto_89976 )
      ( MAKE-1CRATE-VERIFY ?auto_89975 ?auto_89976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_89983 - SURFACE
      ?auto_89984 - SURFACE
    )
    :vars
    (
      ?auto_89989 - HOIST
      ?auto_89987 - PLACE
      ?auto_89985 - PLACE
      ?auto_89986 - HOIST
      ?auto_89990 - SURFACE
      ?auto_89988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_89989 ?auto_89987 ) ( SURFACE-AT ?auto_89983 ?auto_89987 ) ( CLEAR ?auto_89983 ) ( IS-CRATE ?auto_89984 ) ( not ( = ?auto_89983 ?auto_89984 ) ) ( AVAILABLE ?auto_89989 ) ( not ( = ?auto_89985 ?auto_89987 ) ) ( HOIST-AT ?auto_89986 ?auto_89985 ) ( not ( = ?auto_89989 ?auto_89986 ) ) ( AVAILABLE ?auto_89986 ) ( SURFACE-AT ?auto_89984 ?auto_89985 ) ( ON ?auto_89984 ?auto_89990 ) ( CLEAR ?auto_89984 ) ( not ( = ?auto_89983 ?auto_89990 ) ) ( not ( = ?auto_89984 ?auto_89990 ) ) ( TRUCK-AT ?auto_89988 ?auto_89987 ) )
    :subtasks
    ( ( !DRIVE ?auto_89988 ?auto_89987 ?auto_89985 )
      ( MAKE-1CRATE ?auto_89983 ?auto_89984 )
      ( MAKE-1CRATE-VERIFY ?auto_89983 ?auto_89984 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90000 - SURFACE
      ?auto_90001 - SURFACE
      ?auto_90002 - SURFACE
    )
    :vars
    (
      ?auto_90004 - HOIST
      ?auto_90003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90004 ?auto_90003 ) ( SURFACE-AT ?auto_90001 ?auto_90003 ) ( CLEAR ?auto_90001 ) ( LIFTING ?auto_90004 ?auto_90002 ) ( IS-CRATE ?auto_90002 ) ( not ( = ?auto_90001 ?auto_90002 ) ) ( ON ?auto_90001 ?auto_90000 ) ( not ( = ?auto_90000 ?auto_90001 ) ) ( not ( = ?auto_90000 ?auto_90002 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90001 ?auto_90002 )
      ( MAKE-2CRATE-VERIFY ?auto_90000 ?auto_90001 ?auto_90002 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90010 - SURFACE
      ?auto_90011 - SURFACE
      ?auto_90012 - SURFACE
    )
    :vars
    (
      ?auto_90015 - HOIST
      ?auto_90014 - PLACE
      ?auto_90013 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90015 ?auto_90014 ) ( SURFACE-AT ?auto_90011 ?auto_90014 ) ( CLEAR ?auto_90011 ) ( IS-CRATE ?auto_90012 ) ( not ( = ?auto_90011 ?auto_90012 ) ) ( TRUCK-AT ?auto_90013 ?auto_90014 ) ( AVAILABLE ?auto_90015 ) ( IN ?auto_90012 ?auto_90013 ) ( ON ?auto_90011 ?auto_90010 ) ( not ( = ?auto_90010 ?auto_90011 ) ) ( not ( = ?auto_90010 ?auto_90012 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90011 ?auto_90012 )
      ( MAKE-2CRATE-VERIFY ?auto_90010 ?auto_90011 ?auto_90012 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90016 - SURFACE
      ?auto_90017 - SURFACE
    )
    :vars
    (
      ?auto_90021 - HOIST
      ?auto_90019 - PLACE
      ?auto_90020 - TRUCK
      ?auto_90018 - SURFACE
      ?auto_90022 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90021 ?auto_90019 ) ( SURFACE-AT ?auto_90016 ?auto_90019 ) ( CLEAR ?auto_90016 ) ( IS-CRATE ?auto_90017 ) ( not ( = ?auto_90016 ?auto_90017 ) ) ( AVAILABLE ?auto_90021 ) ( IN ?auto_90017 ?auto_90020 ) ( ON ?auto_90016 ?auto_90018 ) ( not ( = ?auto_90018 ?auto_90016 ) ) ( not ( = ?auto_90018 ?auto_90017 ) ) ( TRUCK-AT ?auto_90020 ?auto_90022 ) ( not ( = ?auto_90022 ?auto_90019 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90020 ?auto_90022 ?auto_90019 )
      ( MAKE-2CRATE ?auto_90018 ?auto_90016 ?auto_90017 )
      ( MAKE-1CRATE-VERIFY ?auto_90016 ?auto_90017 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90023 - SURFACE
      ?auto_90024 - SURFACE
      ?auto_90025 - SURFACE
    )
    :vars
    (
      ?auto_90027 - HOIST
      ?auto_90029 - PLACE
      ?auto_90028 - TRUCK
      ?auto_90026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90027 ?auto_90029 ) ( SURFACE-AT ?auto_90024 ?auto_90029 ) ( CLEAR ?auto_90024 ) ( IS-CRATE ?auto_90025 ) ( not ( = ?auto_90024 ?auto_90025 ) ) ( AVAILABLE ?auto_90027 ) ( IN ?auto_90025 ?auto_90028 ) ( ON ?auto_90024 ?auto_90023 ) ( not ( = ?auto_90023 ?auto_90024 ) ) ( not ( = ?auto_90023 ?auto_90025 ) ) ( TRUCK-AT ?auto_90028 ?auto_90026 ) ( not ( = ?auto_90026 ?auto_90029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90024 ?auto_90025 )
      ( MAKE-2CRATE-VERIFY ?auto_90023 ?auto_90024 ?auto_90025 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90030 - SURFACE
      ?auto_90031 - SURFACE
    )
    :vars
    (
      ?auto_90035 - HOIST
      ?auto_90032 - PLACE
      ?auto_90034 - SURFACE
      ?auto_90033 - TRUCK
      ?auto_90036 - PLACE
      ?auto_90037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90035 ?auto_90032 ) ( SURFACE-AT ?auto_90030 ?auto_90032 ) ( CLEAR ?auto_90030 ) ( IS-CRATE ?auto_90031 ) ( not ( = ?auto_90030 ?auto_90031 ) ) ( AVAILABLE ?auto_90035 ) ( ON ?auto_90030 ?auto_90034 ) ( not ( = ?auto_90034 ?auto_90030 ) ) ( not ( = ?auto_90034 ?auto_90031 ) ) ( TRUCK-AT ?auto_90033 ?auto_90036 ) ( not ( = ?auto_90036 ?auto_90032 ) ) ( HOIST-AT ?auto_90037 ?auto_90036 ) ( LIFTING ?auto_90037 ?auto_90031 ) ( not ( = ?auto_90035 ?auto_90037 ) ) )
    :subtasks
    ( ( !LOAD ?auto_90037 ?auto_90031 ?auto_90033 ?auto_90036 )
      ( MAKE-2CRATE ?auto_90034 ?auto_90030 ?auto_90031 )
      ( MAKE-1CRATE-VERIFY ?auto_90030 ?auto_90031 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90038 - SURFACE
      ?auto_90039 - SURFACE
      ?auto_90040 - SURFACE
    )
    :vars
    (
      ?auto_90041 - HOIST
      ?auto_90045 - PLACE
      ?auto_90042 - TRUCK
      ?auto_90043 - PLACE
      ?auto_90044 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90041 ?auto_90045 ) ( SURFACE-AT ?auto_90039 ?auto_90045 ) ( CLEAR ?auto_90039 ) ( IS-CRATE ?auto_90040 ) ( not ( = ?auto_90039 ?auto_90040 ) ) ( AVAILABLE ?auto_90041 ) ( ON ?auto_90039 ?auto_90038 ) ( not ( = ?auto_90038 ?auto_90039 ) ) ( not ( = ?auto_90038 ?auto_90040 ) ) ( TRUCK-AT ?auto_90042 ?auto_90043 ) ( not ( = ?auto_90043 ?auto_90045 ) ) ( HOIST-AT ?auto_90044 ?auto_90043 ) ( LIFTING ?auto_90044 ?auto_90040 ) ( not ( = ?auto_90041 ?auto_90044 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90039 ?auto_90040 )
      ( MAKE-2CRATE-VERIFY ?auto_90038 ?auto_90039 ?auto_90040 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90046 - SURFACE
      ?auto_90047 - SURFACE
    )
    :vars
    (
      ?auto_90051 - HOIST
      ?auto_90048 - PLACE
      ?auto_90050 - SURFACE
      ?auto_90049 - TRUCK
      ?auto_90052 - PLACE
      ?auto_90053 - HOIST
      ?auto_90054 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90051 ?auto_90048 ) ( SURFACE-AT ?auto_90046 ?auto_90048 ) ( CLEAR ?auto_90046 ) ( IS-CRATE ?auto_90047 ) ( not ( = ?auto_90046 ?auto_90047 ) ) ( AVAILABLE ?auto_90051 ) ( ON ?auto_90046 ?auto_90050 ) ( not ( = ?auto_90050 ?auto_90046 ) ) ( not ( = ?auto_90050 ?auto_90047 ) ) ( TRUCK-AT ?auto_90049 ?auto_90052 ) ( not ( = ?auto_90052 ?auto_90048 ) ) ( HOIST-AT ?auto_90053 ?auto_90052 ) ( not ( = ?auto_90051 ?auto_90053 ) ) ( AVAILABLE ?auto_90053 ) ( SURFACE-AT ?auto_90047 ?auto_90052 ) ( ON ?auto_90047 ?auto_90054 ) ( CLEAR ?auto_90047 ) ( not ( = ?auto_90046 ?auto_90054 ) ) ( not ( = ?auto_90047 ?auto_90054 ) ) ( not ( = ?auto_90050 ?auto_90054 ) ) )
    :subtasks
    ( ( !LIFT ?auto_90053 ?auto_90047 ?auto_90054 ?auto_90052 )
      ( MAKE-2CRATE ?auto_90050 ?auto_90046 ?auto_90047 )
      ( MAKE-1CRATE-VERIFY ?auto_90046 ?auto_90047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90055 - SURFACE
      ?auto_90056 - SURFACE
      ?auto_90057 - SURFACE
    )
    :vars
    (
      ?auto_90060 - HOIST
      ?auto_90063 - PLACE
      ?auto_90059 - TRUCK
      ?auto_90062 - PLACE
      ?auto_90058 - HOIST
      ?auto_90061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90060 ?auto_90063 ) ( SURFACE-AT ?auto_90056 ?auto_90063 ) ( CLEAR ?auto_90056 ) ( IS-CRATE ?auto_90057 ) ( not ( = ?auto_90056 ?auto_90057 ) ) ( AVAILABLE ?auto_90060 ) ( ON ?auto_90056 ?auto_90055 ) ( not ( = ?auto_90055 ?auto_90056 ) ) ( not ( = ?auto_90055 ?auto_90057 ) ) ( TRUCK-AT ?auto_90059 ?auto_90062 ) ( not ( = ?auto_90062 ?auto_90063 ) ) ( HOIST-AT ?auto_90058 ?auto_90062 ) ( not ( = ?auto_90060 ?auto_90058 ) ) ( AVAILABLE ?auto_90058 ) ( SURFACE-AT ?auto_90057 ?auto_90062 ) ( ON ?auto_90057 ?auto_90061 ) ( CLEAR ?auto_90057 ) ( not ( = ?auto_90056 ?auto_90061 ) ) ( not ( = ?auto_90057 ?auto_90061 ) ) ( not ( = ?auto_90055 ?auto_90061 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90056 ?auto_90057 )
      ( MAKE-2CRATE-VERIFY ?auto_90055 ?auto_90056 ?auto_90057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90064 - SURFACE
      ?auto_90065 - SURFACE
    )
    :vars
    (
      ?auto_90072 - HOIST
      ?auto_90067 - PLACE
      ?auto_90066 - SURFACE
      ?auto_90069 - PLACE
      ?auto_90070 - HOIST
      ?auto_90068 - SURFACE
      ?auto_90071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90072 ?auto_90067 ) ( SURFACE-AT ?auto_90064 ?auto_90067 ) ( CLEAR ?auto_90064 ) ( IS-CRATE ?auto_90065 ) ( not ( = ?auto_90064 ?auto_90065 ) ) ( AVAILABLE ?auto_90072 ) ( ON ?auto_90064 ?auto_90066 ) ( not ( = ?auto_90066 ?auto_90064 ) ) ( not ( = ?auto_90066 ?auto_90065 ) ) ( not ( = ?auto_90069 ?auto_90067 ) ) ( HOIST-AT ?auto_90070 ?auto_90069 ) ( not ( = ?auto_90072 ?auto_90070 ) ) ( AVAILABLE ?auto_90070 ) ( SURFACE-AT ?auto_90065 ?auto_90069 ) ( ON ?auto_90065 ?auto_90068 ) ( CLEAR ?auto_90065 ) ( not ( = ?auto_90064 ?auto_90068 ) ) ( not ( = ?auto_90065 ?auto_90068 ) ) ( not ( = ?auto_90066 ?auto_90068 ) ) ( TRUCK-AT ?auto_90071 ?auto_90067 ) )
    :subtasks
    ( ( !DRIVE ?auto_90071 ?auto_90067 ?auto_90069 )
      ( MAKE-2CRATE ?auto_90066 ?auto_90064 ?auto_90065 )
      ( MAKE-1CRATE-VERIFY ?auto_90064 ?auto_90065 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90073 - SURFACE
      ?auto_90074 - SURFACE
      ?auto_90075 - SURFACE
    )
    :vars
    (
      ?auto_90076 - HOIST
      ?auto_90080 - PLACE
      ?auto_90079 - PLACE
      ?auto_90078 - HOIST
      ?auto_90081 - SURFACE
      ?auto_90077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90076 ?auto_90080 ) ( SURFACE-AT ?auto_90074 ?auto_90080 ) ( CLEAR ?auto_90074 ) ( IS-CRATE ?auto_90075 ) ( not ( = ?auto_90074 ?auto_90075 ) ) ( AVAILABLE ?auto_90076 ) ( ON ?auto_90074 ?auto_90073 ) ( not ( = ?auto_90073 ?auto_90074 ) ) ( not ( = ?auto_90073 ?auto_90075 ) ) ( not ( = ?auto_90079 ?auto_90080 ) ) ( HOIST-AT ?auto_90078 ?auto_90079 ) ( not ( = ?auto_90076 ?auto_90078 ) ) ( AVAILABLE ?auto_90078 ) ( SURFACE-AT ?auto_90075 ?auto_90079 ) ( ON ?auto_90075 ?auto_90081 ) ( CLEAR ?auto_90075 ) ( not ( = ?auto_90074 ?auto_90081 ) ) ( not ( = ?auto_90075 ?auto_90081 ) ) ( not ( = ?auto_90073 ?auto_90081 ) ) ( TRUCK-AT ?auto_90077 ?auto_90080 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90074 ?auto_90075 )
      ( MAKE-2CRATE-VERIFY ?auto_90073 ?auto_90074 ?auto_90075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90082 - SURFACE
      ?auto_90083 - SURFACE
    )
    :vars
    (
      ?auto_90084 - HOIST
      ?auto_90088 - PLACE
      ?auto_90087 - SURFACE
      ?auto_90090 - PLACE
      ?auto_90085 - HOIST
      ?auto_90089 - SURFACE
      ?auto_90086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90084 ?auto_90088 ) ( IS-CRATE ?auto_90083 ) ( not ( = ?auto_90082 ?auto_90083 ) ) ( not ( = ?auto_90087 ?auto_90082 ) ) ( not ( = ?auto_90087 ?auto_90083 ) ) ( not ( = ?auto_90090 ?auto_90088 ) ) ( HOIST-AT ?auto_90085 ?auto_90090 ) ( not ( = ?auto_90084 ?auto_90085 ) ) ( AVAILABLE ?auto_90085 ) ( SURFACE-AT ?auto_90083 ?auto_90090 ) ( ON ?auto_90083 ?auto_90089 ) ( CLEAR ?auto_90083 ) ( not ( = ?auto_90082 ?auto_90089 ) ) ( not ( = ?auto_90083 ?auto_90089 ) ) ( not ( = ?auto_90087 ?auto_90089 ) ) ( TRUCK-AT ?auto_90086 ?auto_90088 ) ( SURFACE-AT ?auto_90087 ?auto_90088 ) ( CLEAR ?auto_90087 ) ( LIFTING ?auto_90084 ?auto_90082 ) ( IS-CRATE ?auto_90082 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90087 ?auto_90082 )
      ( MAKE-2CRATE ?auto_90087 ?auto_90082 ?auto_90083 )
      ( MAKE-1CRATE-VERIFY ?auto_90082 ?auto_90083 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90091 - SURFACE
      ?auto_90092 - SURFACE
      ?auto_90093 - SURFACE
    )
    :vars
    (
      ?auto_90097 - HOIST
      ?auto_90099 - PLACE
      ?auto_90094 - PLACE
      ?auto_90096 - HOIST
      ?auto_90098 - SURFACE
      ?auto_90095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90097 ?auto_90099 ) ( IS-CRATE ?auto_90093 ) ( not ( = ?auto_90092 ?auto_90093 ) ) ( not ( = ?auto_90091 ?auto_90092 ) ) ( not ( = ?auto_90091 ?auto_90093 ) ) ( not ( = ?auto_90094 ?auto_90099 ) ) ( HOIST-AT ?auto_90096 ?auto_90094 ) ( not ( = ?auto_90097 ?auto_90096 ) ) ( AVAILABLE ?auto_90096 ) ( SURFACE-AT ?auto_90093 ?auto_90094 ) ( ON ?auto_90093 ?auto_90098 ) ( CLEAR ?auto_90093 ) ( not ( = ?auto_90092 ?auto_90098 ) ) ( not ( = ?auto_90093 ?auto_90098 ) ) ( not ( = ?auto_90091 ?auto_90098 ) ) ( TRUCK-AT ?auto_90095 ?auto_90099 ) ( SURFACE-AT ?auto_90091 ?auto_90099 ) ( CLEAR ?auto_90091 ) ( LIFTING ?auto_90097 ?auto_90092 ) ( IS-CRATE ?auto_90092 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90092 ?auto_90093 )
      ( MAKE-2CRATE-VERIFY ?auto_90091 ?auto_90092 ?auto_90093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90100 - SURFACE
      ?auto_90101 - SURFACE
    )
    :vars
    (
      ?auto_90106 - HOIST
      ?auto_90102 - PLACE
      ?auto_90103 - SURFACE
      ?auto_90104 - PLACE
      ?auto_90105 - HOIST
      ?auto_90107 - SURFACE
      ?auto_90108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90106 ?auto_90102 ) ( IS-CRATE ?auto_90101 ) ( not ( = ?auto_90100 ?auto_90101 ) ) ( not ( = ?auto_90103 ?auto_90100 ) ) ( not ( = ?auto_90103 ?auto_90101 ) ) ( not ( = ?auto_90104 ?auto_90102 ) ) ( HOIST-AT ?auto_90105 ?auto_90104 ) ( not ( = ?auto_90106 ?auto_90105 ) ) ( AVAILABLE ?auto_90105 ) ( SURFACE-AT ?auto_90101 ?auto_90104 ) ( ON ?auto_90101 ?auto_90107 ) ( CLEAR ?auto_90101 ) ( not ( = ?auto_90100 ?auto_90107 ) ) ( not ( = ?auto_90101 ?auto_90107 ) ) ( not ( = ?auto_90103 ?auto_90107 ) ) ( TRUCK-AT ?auto_90108 ?auto_90102 ) ( SURFACE-AT ?auto_90103 ?auto_90102 ) ( CLEAR ?auto_90103 ) ( IS-CRATE ?auto_90100 ) ( AVAILABLE ?auto_90106 ) ( IN ?auto_90100 ?auto_90108 ) )
    :subtasks
    ( ( !UNLOAD ?auto_90106 ?auto_90100 ?auto_90108 ?auto_90102 )
      ( MAKE-2CRATE ?auto_90103 ?auto_90100 ?auto_90101 )
      ( MAKE-1CRATE-VERIFY ?auto_90100 ?auto_90101 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_90109 - SURFACE
      ?auto_90110 - SURFACE
      ?auto_90111 - SURFACE
    )
    :vars
    (
      ?auto_90114 - HOIST
      ?auto_90117 - PLACE
      ?auto_90116 - PLACE
      ?auto_90115 - HOIST
      ?auto_90112 - SURFACE
      ?auto_90113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90114 ?auto_90117 ) ( IS-CRATE ?auto_90111 ) ( not ( = ?auto_90110 ?auto_90111 ) ) ( not ( = ?auto_90109 ?auto_90110 ) ) ( not ( = ?auto_90109 ?auto_90111 ) ) ( not ( = ?auto_90116 ?auto_90117 ) ) ( HOIST-AT ?auto_90115 ?auto_90116 ) ( not ( = ?auto_90114 ?auto_90115 ) ) ( AVAILABLE ?auto_90115 ) ( SURFACE-AT ?auto_90111 ?auto_90116 ) ( ON ?auto_90111 ?auto_90112 ) ( CLEAR ?auto_90111 ) ( not ( = ?auto_90110 ?auto_90112 ) ) ( not ( = ?auto_90111 ?auto_90112 ) ) ( not ( = ?auto_90109 ?auto_90112 ) ) ( TRUCK-AT ?auto_90113 ?auto_90117 ) ( SURFACE-AT ?auto_90109 ?auto_90117 ) ( CLEAR ?auto_90109 ) ( IS-CRATE ?auto_90110 ) ( AVAILABLE ?auto_90114 ) ( IN ?auto_90110 ?auto_90113 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90110 ?auto_90111 )
      ( MAKE-2CRATE-VERIFY ?auto_90109 ?auto_90110 ?auto_90111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_90154 - SURFACE
      ?auto_90155 - SURFACE
    )
    :vars
    (
      ?auto_90160 - HOIST
      ?auto_90161 - PLACE
      ?auto_90156 - SURFACE
      ?auto_90158 - PLACE
      ?auto_90157 - HOIST
      ?auto_90162 - SURFACE
      ?auto_90159 - TRUCK
      ?auto_90163 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90160 ?auto_90161 ) ( SURFACE-AT ?auto_90154 ?auto_90161 ) ( CLEAR ?auto_90154 ) ( IS-CRATE ?auto_90155 ) ( not ( = ?auto_90154 ?auto_90155 ) ) ( AVAILABLE ?auto_90160 ) ( ON ?auto_90154 ?auto_90156 ) ( not ( = ?auto_90156 ?auto_90154 ) ) ( not ( = ?auto_90156 ?auto_90155 ) ) ( not ( = ?auto_90158 ?auto_90161 ) ) ( HOIST-AT ?auto_90157 ?auto_90158 ) ( not ( = ?auto_90160 ?auto_90157 ) ) ( AVAILABLE ?auto_90157 ) ( SURFACE-AT ?auto_90155 ?auto_90158 ) ( ON ?auto_90155 ?auto_90162 ) ( CLEAR ?auto_90155 ) ( not ( = ?auto_90154 ?auto_90162 ) ) ( not ( = ?auto_90155 ?auto_90162 ) ) ( not ( = ?auto_90156 ?auto_90162 ) ) ( TRUCK-AT ?auto_90159 ?auto_90163 ) ( not ( = ?auto_90163 ?auto_90161 ) ) ( not ( = ?auto_90158 ?auto_90163 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_90159 ?auto_90163 ?auto_90161 )
      ( MAKE-1CRATE ?auto_90154 ?auto_90155 )
      ( MAKE-1CRATE-VERIFY ?auto_90154 ?auto_90155 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90193 - SURFACE
      ?auto_90194 - SURFACE
      ?auto_90195 - SURFACE
      ?auto_90196 - SURFACE
    )
    :vars
    (
      ?auto_90198 - HOIST
      ?auto_90197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90198 ?auto_90197 ) ( SURFACE-AT ?auto_90195 ?auto_90197 ) ( CLEAR ?auto_90195 ) ( LIFTING ?auto_90198 ?auto_90196 ) ( IS-CRATE ?auto_90196 ) ( not ( = ?auto_90195 ?auto_90196 ) ) ( ON ?auto_90194 ?auto_90193 ) ( ON ?auto_90195 ?auto_90194 ) ( not ( = ?auto_90193 ?auto_90194 ) ) ( not ( = ?auto_90193 ?auto_90195 ) ) ( not ( = ?auto_90193 ?auto_90196 ) ) ( not ( = ?auto_90194 ?auto_90195 ) ) ( not ( = ?auto_90194 ?auto_90196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90195 ?auto_90196 )
      ( MAKE-3CRATE-VERIFY ?auto_90193 ?auto_90194 ?auto_90195 ?auto_90196 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90210 - SURFACE
      ?auto_90211 - SURFACE
      ?auto_90212 - SURFACE
      ?auto_90213 - SURFACE
    )
    :vars
    (
      ?auto_90215 - HOIST
      ?auto_90214 - PLACE
      ?auto_90216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90215 ?auto_90214 ) ( SURFACE-AT ?auto_90212 ?auto_90214 ) ( CLEAR ?auto_90212 ) ( IS-CRATE ?auto_90213 ) ( not ( = ?auto_90212 ?auto_90213 ) ) ( TRUCK-AT ?auto_90216 ?auto_90214 ) ( AVAILABLE ?auto_90215 ) ( IN ?auto_90213 ?auto_90216 ) ( ON ?auto_90212 ?auto_90211 ) ( not ( = ?auto_90211 ?auto_90212 ) ) ( not ( = ?auto_90211 ?auto_90213 ) ) ( ON ?auto_90211 ?auto_90210 ) ( not ( = ?auto_90210 ?auto_90211 ) ) ( not ( = ?auto_90210 ?auto_90212 ) ) ( not ( = ?auto_90210 ?auto_90213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90211 ?auto_90212 ?auto_90213 )
      ( MAKE-3CRATE-VERIFY ?auto_90210 ?auto_90211 ?auto_90212 ?auto_90213 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90231 - SURFACE
      ?auto_90232 - SURFACE
      ?auto_90233 - SURFACE
      ?auto_90234 - SURFACE
    )
    :vars
    (
      ?auto_90237 - HOIST
      ?auto_90235 - PLACE
      ?auto_90238 - TRUCK
      ?auto_90236 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90237 ?auto_90235 ) ( SURFACE-AT ?auto_90233 ?auto_90235 ) ( CLEAR ?auto_90233 ) ( IS-CRATE ?auto_90234 ) ( not ( = ?auto_90233 ?auto_90234 ) ) ( AVAILABLE ?auto_90237 ) ( IN ?auto_90234 ?auto_90238 ) ( ON ?auto_90233 ?auto_90232 ) ( not ( = ?auto_90232 ?auto_90233 ) ) ( not ( = ?auto_90232 ?auto_90234 ) ) ( TRUCK-AT ?auto_90238 ?auto_90236 ) ( not ( = ?auto_90236 ?auto_90235 ) ) ( ON ?auto_90232 ?auto_90231 ) ( not ( = ?auto_90231 ?auto_90232 ) ) ( not ( = ?auto_90231 ?auto_90233 ) ) ( not ( = ?auto_90231 ?auto_90234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90232 ?auto_90233 ?auto_90234 )
      ( MAKE-3CRATE-VERIFY ?auto_90231 ?auto_90232 ?auto_90233 ?auto_90234 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90255 - SURFACE
      ?auto_90256 - SURFACE
      ?auto_90257 - SURFACE
      ?auto_90258 - SURFACE
    )
    :vars
    (
      ?auto_90262 - HOIST
      ?auto_90261 - PLACE
      ?auto_90260 - TRUCK
      ?auto_90259 - PLACE
      ?auto_90263 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90262 ?auto_90261 ) ( SURFACE-AT ?auto_90257 ?auto_90261 ) ( CLEAR ?auto_90257 ) ( IS-CRATE ?auto_90258 ) ( not ( = ?auto_90257 ?auto_90258 ) ) ( AVAILABLE ?auto_90262 ) ( ON ?auto_90257 ?auto_90256 ) ( not ( = ?auto_90256 ?auto_90257 ) ) ( not ( = ?auto_90256 ?auto_90258 ) ) ( TRUCK-AT ?auto_90260 ?auto_90259 ) ( not ( = ?auto_90259 ?auto_90261 ) ) ( HOIST-AT ?auto_90263 ?auto_90259 ) ( LIFTING ?auto_90263 ?auto_90258 ) ( not ( = ?auto_90262 ?auto_90263 ) ) ( ON ?auto_90256 ?auto_90255 ) ( not ( = ?auto_90255 ?auto_90256 ) ) ( not ( = ?auto_90255 ?auto_90257 ) ) ( not ( = ?auto_90255 ?auto_90258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90256 ?auto_90257 ?auto_90258 )
      ( MAKE-3CRATE-VERIFY ?auto_90255 ?auto_90256 ?auto_90257 ?auto_90258 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90282 - SURFACE
      ?auto_90283 - SURFACE
      ?auto_90284 - SURFACE
      ?auto_90285 - SURFACE
    )
    :vars
    (
      ?auto_90290 - HOIST
      ?auto_90289 - PLACE
      ?auto_90288 - TRUCK
      ?auto_90291 - PLACE
      ?auto_90287 - HOIST
      ?auto_90286 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90290 ?auto_90289 ) ( SURFACE-AT ?auto_90284 ?auto_90289 ) ( CLEAR ?auto_90284 ) ( IS-CRATE ?auto_90285 ) ( not ( = ?auto_90284 ?auto_90285 ) ) ( AVAILABLE ?auto_90290 ) ( ON ?auto_90284 ?auto_90283 ) ( not ( = ?auto_90283 ?auto_90284 ) ) ( not ( = ?auto_90283 ?auto_90285 ) ) ( TRUCK-AT ?auto_90288 ?auto_90291 ) ( not ( = ?auto_90291 ?auto_90289 ) ) ( HOIST-AT ?auto_90287 ?auto_90291 ) ( not ( = ?auto_90290 ?auto_90287 ) ) ( AVAILABLE ?auto_90287 ) ( SURFACE-AT ?auto_90285 ?auto_90291 ) ( ON ?auto_90285 ?auto_90286 ) ( CLEAR ?auto_90285 ) ( not ( = ?auto_90284 ?auto_90286 ) ) ( not ( = ?auto_90285 ?auto_90286 ) ) ( not ( = ?auto_90283 ?auto_90286 ) ) ( ON ?auto_90283 ?auto_90282 ) ( not ( = ?auto_90282 ?auto_90283 ) ) ( not ( = ?auto_90282 ?auto_90284 ) ) ( not ( = ?auto_90282 ?auto_90285 ) ) ( not ( = ?auto_90282 ?auto_90286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90283 ?auto_90284 ?auto_90285 )
      ( MAKE-3CRATE-VERIFY ?auto_90282 ?auto_90283 ?auto_90284 ?auto_90285 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90310 - SURFACE
      ?auto_90311 - SURFACE
      ?auto_90312 - SURFACE
      ?auto_90313 - SURFACE
    )
    :vars
    (
      ?auto_90316 - HOIST
      ?auto_90319 - PLACE
      ?auto_90317 - PLACE
      ?auto_90314 - HOIST
      ?auto_90318 - SURFACE
      ?auto_90315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90316 ?auto_90319 ) ( SURFACE-AT ?auto_90312 ?auto_90319 ) ( CLEAR ?auto_90312 ) ( IS-CRATE ?auto_90313 ) ( not ( = ?auto_90312 ?auto_90313 ) ) ( AVAILABLE ?auto_90316 ) ( ON ?auto_90312 ?auto_90311 ) ( not ( = ?auto_90311 ?auto_90312 ) ) ( not ( = ?auto_90311 ?auto_90313 ) ) ( not ( = ?auto_90317 ?auto_90319 ) ) ( HOIST-AT ?auto_90314 ?auto_90317 ) ( not ( = ?auto_90316 ?auto_90314 ) ) ( AVAILABLE ?auto_90314 ) ( SURFACE-AT ?auto_90313 ?auto_90317 ) ( ON ?auto_90313 ?auto_90318 ) ( CLEAR ?auto_90313 ) ( not ( = ?auto_90312 ?auto_90318 ) ) ( not ( = ?auto_90313 ?auto_90318 ) ) ( not ( = ?auto_90311 ?auto_90318 ) ) ( TRUCK-AT ?auto_90315 ?auto_90319 ) ( ON ?auto_90311 ?auto_90310 ) ( not ( = ?auto_90310 ?auto_90311 ) ) ( not ( = ?auto_90310 ?auto_90312 ) ) ( not ( = ?auto_90310 ?auto_90313 ) ) ( not ( = ?auto_90310 ?auto_90318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90311 ?auto_90312 ?auto_90313 )
      ( MAKE-3CRATE-VERIFY ?auto_90310 ?auto_90311 ?auto_90312 ?auto_90313 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90338 - SURFACE
      ?auto_90339 - SURFACE
      ?auto_90340 - SURFACE
      ?auto_90341 - SURFACE
    )
    :vars
    (
      ?auto_90347 - HOIST
      ?auto_90343 - PLACE
      ?auto_90346 - PLACE
      ?auto_90344 - HOIST
      ?auto_90345 - SURFACE
      ?auto_90342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90347 ?auto_90343 ) ( IS-CRATE ?auto_90341 ) ( not ( = ?auto_90340 ?auto_90341 ) ) ( not ( = ?auto_90339 ?auto_90340 ) ) ( not ( = ?auto_90339 ?auto_90341 ) ) ( not ( = ?auto_90346 ?auto_90343 ) ) ( HOIST-AT ?auto_90344 ?auto_90346 ) ( not ( = ?auto_90347 ?auto_90344 ) ) ( AVAILABLE ?auto_90344 ) ( SURFACE-AT ?auto_90341 ?auto_90346 ) ( ON ?auto_90341 ?auto_90345 ) ( CLEAR ?auto_90341 ) ( not ( = ?auto_90340 ?auto_90345 ) ) ( not ( = ?auto_90341 ?auto_90345 ) ) ( not ( = ?auto_90339 ?auto_90345 ) ) ( TRUCK-AT ?auto_90342 ?auto_90343 ) ( SURFACE-AT ?auto_90339 ?auto_90343 ) ( CLEAR ?auto_90339 ) ( LIFTING ?auto_90347 ?auto_90340 ) ( IS-CRATE ?auto_90340 ) ( ON ?auto_90339 ?auto_90338 ) ( not ( = ?auto_90338 ?auto_90339 ) ) ( not ( = ?auto_90338 ?auto_90340 ) ) ( not ( = ?auto_90338 ?auto_90341 ) ) ( not ( = ?auto_90338 ?auto_90345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90339 ?auto_90340 ?auto_90341 )
      ( MAKE-3CRATE-VERIFY ?auto_90338 ?auto_90339 ?auto_90340 ?auto_90341 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_90366 - SURFACE
      ?auto_90367 - SURFACE
      ?auto_90368 - SURFACE
      ?auto_90369 - SURFACE
    )
    :vars
    (
      ?auto_90374 - HOIST
      ?auto_90375 - PLACE
      ?auto_90372 - PLACE
      ?auto_90370 - HOIST
      ?auto_90371 - SURFACE
      ?auto_90373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90374 ?auto_90375 ) ( IS-CRATE ?auto_90369 ) ( not ( = ?auto_90368 ?auto_90369 ) ) ( not ( = ?auto_90367 ?auto_90368 ) ) ( not ( = ?auto_90367 ?auto_90369 ) ) ( not ( = ?auto_90372 ?auto_90375 ) ) ( HOIST-AT ?auto_90370 ?auto_90372 ) ( not ( = ?auto_90374 ?auto_90370 ) ) ( AVAILABLE ?auto_90370 ) ( SURFACE-AT ?auto_90369 ?auto_90372 ) ( ON ?auto_90369 ?auto_90371 ) ( CLEAR ?auto_90369 ) ( not ( = ?auto_90368 ?auto_90371 ) ) ( not ( = ?auto_90369 ?auto_90371 ) ) ( not ( = ?auto_90367 ?auto_90371 ) ) ( TRUCK-AT ?auto_90373 ?auto_90375 ) ( SURFACE-AT ?auto_90367 ?auto_90375 ) ( CLEAR ?auto_90367 ) ( IS-CRATE ?auto_90368 ) ( AVAILABLE ?auto_90374 ) ( IN ?auto_90368 ?auto_90373 ) ( ON ?auto_90367 ?auto_90366 ) ( not ( = ?auto_90366 ?auto_90367 ) ) ( not ( = ?auto_90366 ?auto_90368 ) ) ( not ( = ?auto_90366 ?auto_90369 ) ) ( not ( = ?auto_90366 ?auto_90371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90367 ?auto_90368 ?auto_90369 )
      ( MAKE-3CRATE-VERIFY ?auto_90366 ?auto_90367 ?auto_90368 ?auto_90369 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90657 - SURFACE
      ?auto_90658 - SURFACE
      ?auto_90659 - SURFACE
      ?auto_90661 - SURFACE
      ?auto_90660 - SURFACE
    )
    :vars
    (
      ?auto_90663 - HOIST
      ?auto_90662 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90663 ?auto_90662 ) ( SURFACE-AT ?auto_90661 ?auto_90662 ) ( CLEAR ?auto_90661 ) ( LIFTING ?auto_90663 ?auto_90660 ) ( IS-CRATE ?auto_90660 ) ( not ( = ?auto_90661 ?auto_90660 ) ) ( ON ?auto_90658 ?auto_90657 ) ( ON ?auto_90659 ?auto_90658 ) ( ON ?auto_90661 ?auto_90659 ) ( not ( = ?auto_90657 ?auto_90658 ) ) ( not ( = ?auto_90657 ?auto_90659 ) ) ( not ( = ?auto_90657 ?auto_90661 ) ) ( not ( = ?auto_90657 ?auto_90660 ) ) ( not ( = ?auto_90658 ?auto_90659 ) ) ( not ( = ?auto_90658 ?auto_90661 ) ) ( not ( = ?auto_90658 ?auto_90660 ) ) ( not ( = ?auto_90659 ?auto_90661 ) ) ( not ( = ?auto_90659 ?auto_90660 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_90661 ?auto_90660 )
      ( MAKE-4CRATE-VERIFY ?auto_90657 ?auto_90658 ?auto_90659 ?auto_90661 ?auto_90660 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90682 - SURFACE
      ?auto_90683 - SURFACE
      ?auto_90684 - SURFACE
      ?auto_90686 - SURFACE
      ?auto_90685 - SURFACE
    )
    :vars
    (
      ?auto_90687 - HOIST
      ?auto_90689 - PLACE
      ?auto_90688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90687 ?auto_90689 ) ( SURFACE-AT ?auto_90686 ?auto_90689 ) ( CLEAR ?auto_90686 ) ( IS-CRATE ?auto_90685 ) ( not ( = ?auto_90686 ?auto_90685 ) ) ( TRUCK-AT ?auto_90688 ?auto_90689 ) ( AVAILABLE ?auto_90687 ) ( IN ?auto_90685 ?auto_90688 ) ( ON ?auto_90686 ?auto_90684 ) ( not ( = ?auto_90684 ?auto_90686 ) ) ( not ( = ?auto_90684 ?auto_90685 ) ) ( ON ?auto_90683 ?auto_90682 ) ( ON ?auto_90684 ?auto_90683 ) ( not ( = ?auto_90682 ?auto_90683 ) ) ( not ( = ?auto_90682 ?auto_90684 ) ) ( not ( = ?auto_90682 ?auto_90686 ) ) ( not ( = ?auto_90682 ?auto_90685 ) ) ( not ( = ?auto_90683 ?auto_90684 ) ) ( not ( = ?auto_90683 ?auto_90686 ) ) ( not ( = ?auto_90683 ?auto_90685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90684 ?auto_90686 ?auto_90685 )
      ( MAKE-4CRATE-VERIFY ?auto_90682 ?auto_90683 ?auto_90684 ?auto_90686 ?auto_90685 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90712 - SURFACE
      ?auto_90713 - SURFACE
      ?auto_90714 - SURFACE
      ?auto_90716 - SURFACE
      ?auto_90715 - SURFACE
    )
    :vars
    (
      ?auto_90720 - HOIST
      ?auto_90717 - PLACE
      ?auto_90719 - TRUCK
      ?auto_90718 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90720 ?auto_90717 ) ( SURFACE-AT ?auto_90716 ?auto_90717 ) ( CLEAR ?auto_90716 ) ( IS-CRATE ?auto_90715 ) ( not ( = ?auto_90716 ?auto_90715 ) ) ( AVAILABLE ?auto_90720 ) ( IN ?auto_90715 ?auto_90719 ) ( ON ?auto_90716 ?auto_90714 ) ( not ( = ?auto_90714 ?auto_90716 ) ) ( not ( = ?auto_90714 ?auto_90715 ) ) ( TRUCK-AT ?auto_90719 ?auto_90718 ) ( not ( = ?auto_90718 ?auto_90717 ) ) ( ON ?auto_90713 ?auto_90712 ) ( ON ?auto_90714 ?auto_90713 ) ( not ( = ?auto_90712 ?auto_90713 ) ) ( not ( = ?auto_90712 ?auto_90714 ) ) ( not ( = ?auto_90712 ?auto_90716 ) ) ( not ( = ?auto_90712 ?auto_90715 ) ) ( not ( = ?auto_90713 ?auto_90714 ) ) ( not ( = ?auto_90713 ?auto_90716 ) ) ( not ( = ?auto_90713 ?auto_90715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90714 ?auto_90716 ?auto_90715 )
      ( MAKE-4CRATE-VERIFY ?auto_90712 ?auto_90713 ?auto_90714 ?auto_90716 ?auto_90715 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90746 - SURFACE
      ?auto_90747 - SURFACE
      ?auto_90748 - SURFACE
      ?auto_90750 - SURFACE
      ?auto_90749 - SURFACE
    )
    :vars
    (
      ?auto_90751 - HOIST
      ?auto_90754 - PLACE
      ?auto_90755 - TRUCK
      ?auto_90753 - PLACE
      ?auto_90752 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_90751 ?auto_90754 ) ( SURFACE-AT ?auto_90750 ?auto_90754 ) ( CLEAR ?auto_90750 ) ( IS-CRATE ?auto_90749 ) ( not ( = ?auto_90750 ?auto_90749 ) ) ( AVAILABLE ?auto_90751 ) ( ON ?auto_90750 ?auto_90748 ) ( not ( = ?auto_90748 ?auto_90750 ) ) ( not ( = ?auto_90748 ?auto_90749 ) ) ( TRUCK-AT ?auto_90755 ?auto_90753 ) ( not ( = ?auto_90753 ?auto_90754 ) ) ( HOIST-AT ?auto_90752 ?auto_90753 ) ( LIFTING ?auto_90752 ?auto_90749 ) ( not ( = ?auto_90751 ?auto_90752 ) ) ( ON ?auto_90747 ?auto_90746 ) ( ON ?auto_90748 ?auto_90747 ) ( not ( = ?auto_90746 ?auto_90747 ) ) ( not ( = ?auto_90746 ?auto_90748 ) ) ( not ( = ?auto_90746 ?auto_90750 ) ) ( not ( = ?auto_90746 ?auto_90749 ) ) ( not ( = ?auto_90747 ?auto_90748 ) ) ( not ( = ?auto_90747 ?auto_90750 ) ) ( not ( = ?auto_90747 ?auto_90749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90748 ?auto_90750 ?auto_90749 )
      ( MAKE-4CRATE-VERIFY ?auto_90746 ?auto_90747 ?auto_90748 ?auto_90750 ?auto_90749 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90784 - SURFACE
      ?auto_90785 - SURFACE
      ?auto_90786 - SURFACE
      ?auto_90788 - SURFACE
      ?auto_90787 - SURFACE
    )
    :vars
    (
      ?auto_90791 - HOIST
      ?auto_90794 - PLACE
      ?auto_90793 - TRUCK
      ?auto_90789 - PLACE
      ?auto_90790 - HOIST
      ?auto_90792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_90791 ?auto_90794 ) ( SURFACE-AT ?auto_90788 ?auto_90794 ) ( CLEAR ?auto_90788 ) ( IS-CRATE ?auto_90787 ) ( not ( = ?auto_90788 ?auto_90787 ) ) ( AVAILABLE ?auto_90791 ) ( ON ?auto_90788 ?auto_90786 ) ( not ( = ?auto_90786 ?auto_90788 ) ) ( not ( = ?auto_90786 ?auto_90787 ) ) ( TRUCK-AT ?auto_90793 ?auto_90789 ) ( not ( = ?auto_90789 ?auto_90794 ) ) ( HOIST-AT ?auto_90790 ?auto_90789 ) ( not ( = ?auto_90791 ?auto_90790 ) ) ( AVAILABLE ?auto_90790 ) ( SURFACE-AT ?auto_90787 ?auto_90789 ) ( ON ?auto_90787 ?auto_90792 ) ( CLEAR ?auto_90787 ) ( not ( = ?auto_90788 ?auto_90792 ) ) ( not ( = ?auto_90787 ?auto_90792 ) ) ( not ( = ?auto_90786 ?auto_90792 ) ) ( ON ?auto_90785 ?auto_90784 ) ( ON ?auto_90786 ?auto_90785 ) ( not ( = ?auto_90784 ?auto_90785 ) ) ( not ( = ?auto_90784 ?auto_90786 ) ) ( not ( = ?auto_90784 ?auto_90788 ) ) ( not ( = ?auto_90784 ?auto_90787 ) ) ( not ( = ?auto_90784 ?auto_90792 ) ) ( not ( = ?auto_90785 ?auto_90786 ) ) ( not ( = ?auto_90785 ?auto_90788 ) ) ( not ( = ?auto_90785 ?auto_90787 ) ) ( not ( = ?auto_90785 ?auto_90792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90786 ?auto_90788 ?auto_90787 )
      ( MAKE-4CRATE-VERIFY ?auto_90784 ?auto_90785 ?auto_90786 ?auto_90788 ?auto_90787 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90823 - SURFACE
      ?auto_90824 - SURFACE
      ?auto_90825 - SURFACE
      ?auto_90827 - SURFACE
      ?auto_90826 - SURFACE
    )
    :vars
    (
      ?auto_90831 - HOIST
      ?auto_90833 - PLACE
      ?auto_90830 - PLACE
      ?auto_90832 - HOIST
      ?auto_90829 - SURFACE
      ?auto_90828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90831 ?auto_90833 ) ( SURFACE-AT ?auto_90827 ?auto_90833 ) ( CLEAR ?auto_90827 ) ( IS-CRATE ?auto_90826 ) ( not ( = ?auto_90827 ?auto_90826 ) ) ( AVAILABLE ?auto_90831 ) ( ON ?auto_90827 ?auto_90825 ) ( not ( = ?auto_90825 ?auto_90827 ) ) ( not ( = ?auto_90825 ?auto_90826 ) ) ( not ( = ?auto_90830 ?auto_90833 ) ) ( HOIST-AT ?auto_90832 ?auto_90830 ) ( not ( = ?auto_90831 ?auto_90832 ) ) ( AVAILABLE ?auto_90832 ) ( SURFACE-AT ?auto_90826 ?auto_90830 ) ( ON ?auto_90826 ?auto_90829 ) ( CLEAR ?auto_90826 ) ( not ( = ?auto_90827 ?auto_90829 ) ) ( not ( = ?auto_90826 ?auto_90829 ) ) ( not ( = ?auto_90825 ?auto_90829 ) ) ( TRUCK-AT ?auto_90828 ?auto_90833 ) ( ON ?auto_90824 ?auto_90823 ) ( ON ?auto_90825 ?auto_90824 ) ( not ( = ?auto_90823 ?auto_90824 ) ) ( not ( = ?auto_90823 ?auto_90825 ) ) ( not ( = ?auto_90823 ?auto_90827 ) ) ( not ( = ?auto_90823 ?auto_90826 ) ) ( not ( = ?auto_90823 ?auto_90829 ) ) ( not ( = ?auto_90824 ?auto_90825 ) ) ( not ( = ?auto_90824 ?auto_90827 ) ) ( not ( = ?auto_90824 ?auto_90826 ) ) ( not ( = ?auto_90824 ?auto_90829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90825 ?auto_90827 ?auto_90826 )
      ( MAKE-4CRATE-VERIFY ?auto_90823 ?auto_90824 ?auto_90825 ?auto_90827 ?auto_90826 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90862 - SURFACE
      ?auto_90863 - SURFACE
      ?auto_90864 - SURFACE
      ?auto_90866 - SURFACE
      ?auto_90865 - SURFACE
    )
    :vars
    (
      ?auto_90870 - HOIST
      ?auto_90868 - PLACE
      ?auto_90869 - PLACE
      ?auto_90872 - HOIST
      ?auto_90867 - SURFACE
      ?auto_90871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90870 ?auto_90868 ) ( IS-CRATE ?auto_90865 ) ( not ( = ?auto_90866 ?auto_90865 ) ) ( not ( = ?auto_90864 ?auto_90866 ) ) ( not ( = ?auto_90864 ?auto_90865 ) ) ( not ( = ?auto_90869 ?auto_90868 ) ) ( HOIST-AT ?auto_90872 ?auto_90869 ) ( not ( = ?auto_90870 ?auto_90872 ) ) ( AVAILABLE ?auto_90872 ) ( SURFACE-AT ?auto_90865 ?auto_90869 ) ( ON ?auto_90865 ?auto_90867 ) ( CLEAR ?auto_90865 ) ( not ( = ?auto_90866 ?auto_90867 ) ) ( not ( = ?auto_90865 ?auto_90867 ) ) ( not ( = ?auto_90864 ?auto_90867 ) ) ( TRUCK-AT ?auto_90871 ?auto_90868 ) ( SURFACE-AT ?auto_90864 ?auto_90868 ) ( CLEAR ?auto_90864 ) ( LIFTING ?auto_90870 ?auto_90866 ) ( IS-CRATE ?auto_90866 ) ( ON ?auto_90863 ?auto_90862 ) ( ON ?auto_90864 ?auto_90863 ) ( not ( = ?auto_90862 ?auto_90863 ) ) ( not ( = ?auto_90862 ?auto_90864 ) ) ( not ( = ?auto_90862 ?auto_90866 ) ) ( not ( = ?auto_90862 ?auto_90865 ) ) ( not ( = ?auto_90862 ?auto_90867 ) ) ( not ( = ?auto_90863 ?auto_90864 ) ) ( not ( = ?auto_90863 ?auto_90866 ) ) ( not ( = ?auto_90863 ?auto_90865 ) ) ( not ( = ?auto_90863 ?auto_90867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90864 ?auto_90866 ?auto_90865 )
      ( MAKE-4CRATE-VERIFY ?auto_90862 ?auto_90863 ?auto_90864 ?auto_90866 ?auto_90865 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_90901 - SURFACE
      ?auto_90902 - SURFACE
      ?auto_90903 - SURFACE
      ?auto_90905 - SURFACE
      ?auto_90904 - SURFACE
    )
    :vars
    (
      ?auto_90909 - HOIST
      ?auto_90906 - PLACE
      ?auto_90908 - PLACE
      ?auto_90907 - HOIST
      ?auto_90911 - SURFACE
      ?auto_90910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_90909 ?auto_90906 ) ( IS-CRATE ?auto_90904 ) ( not ( = ?auto_90905 ?auto_90904 ) ) ( not ( = ?auto_90903 ?auto_90905 ) ) ( not ( = ?auto_90903 ?auto_90904 ) ) ( not ( = ?auto_90908 ?auto_90906 ) ) ( HOIST-AT ?auto_90907 ?auto_90908 ) ( not ( = ?auto_90909 ?auto_90907 ) ) ( AVAILABLE ?auto_90907 ) ( SURFACE-AT ?auto_90904 ?auto_90908 ) ( ON ?auto_90904 ?auto_90911 ) ( CLEAR ?auto_90904 ) ( not ( = ?auto_90905 ?auto_90911 ) ) ( not ( = ?auto_90904 ?auto_90911 ) ) ( not ( = ?auto_90903 ?auto_90911 ) ) ( TRUCK-AT ?auto_90910 ?auto_90906 ) ( SURFACE-AT ?auto_90903 ?auto_90906 ) ( CLEAR ?auto_90903 ) ( IS-CRATE ?auto_90905 ) ( AVAILABLE ?auto_90909 ) ( IN ?auto_90905 ?auto_90910 ) ( ON ?auto_90902 ?auto_90901 ) ( ON ?auto_90903 ?auto_90902 ) ( not ( = ?auto_90901 ?auto_90902 ) ) ( not ( = ?auto_90901 ?auto_90903 ) ) ( not ( = ?auto_90901 ?auto_90905 ) ) ( not ( = ?auto_90901 ?auto_90904 ) ) ( not ( = ?auto_90901 ?auto_90911 ) ) ( not ( = ?auto_90902 ?auto_90903 ) ) ( not ( = ?auto_90902 ?auto_90905 ) ) ( not ( = ?auto_90902 ?auto_90904 ) ) ( not ( = ?auto_90902 ?auto_90911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_90903 ?auto_90905 ?auto_90904 )
      ( MAKE-4CRATE-VERIFY ?auto_90901 ?auto_90902 ?auto_90903 ?auto_90905 ?auto_90904 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91561 - SURFACE
      ?auto_91562 - SURFACE
      ?auto_91563 - SURFACE
      ?auto_91565 - SURFACE
      ?auto_91564 - SURFACE
      ?auto_91566 - SURFACE
    )
    :vars
    (
      ?auto_91568 - HOIST
      ?auto_91567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91568 ?auto_91567 ) ( SURFACE-AT ?auto_91564 ?auto_91567 ) ( CLEAR ?auto_91564 ) ( LIFTING ?auto_91568 ?auto_91566 ) ( IS-CRATE ?auto_91566 ) ( not ( = ?auto_91564 ?auto_91566 ) ) ( ON ?auto_91562 ?auto_91561 ) ( ON ?auto_91563 ?auto_91562 ) ( ON ?auto_91565 ?auto_91563 ) ( ON ?auto_91564 ?auto_91565 ) ( not ( = ?auto_91561 ?auto_91562 ) ) ( not ( = ?auto_91561 ?auto_91563 ) ) ( not ( = ?auto_91561 ?auto_91565 ) ) ( not ( = ?auto_91561 ?auto_91564 ) ) ( not ( = ?auto_91561 ?auto_91566 ) ) ( not ( = ?auto_91562 ?auto_91563 ) ) ( not ( = ?auto_91562 ?auto_91565 ) ) ( not ( = ?auto_91562 ?auto_91564 ) ) ( not ( = ?auto_91562 ?auto_91566 ) ) ( not ( = ?auto_91563 ?auto_91565 ) ) ( not ( = ?auto_91563 ?auto_91564 ) ) ( not ( = ?auto_91563 ?auto_91566 ) ) ( not ( = ?auto_91565 ?auto_91564 ) ) ( not ( = ?auto_91565 ?auto_91566 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_91564 ?auto_91566 )
      ( MAKE-5CRATE-VERIFY ?auto_91561 ?auto_91562 ?auto_91563 ?auto_91565 ?auto_91564 ?auto_91566 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91595 - SURFACE
      ?auto_91596 - SURFACE
      ?auto_91597 - SURFACE
      ?auto_91599 - SURFACE
      ?auto_91598 - SURFACE
      ?auto_91600 - SURFACE
    )
    :vars
    (
      ?auto_91601 - HOIST
      ?auto_91602 - PLACE
      ?auto_91603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91601 ?auto_91602 ) ( SURFACE-AT ?auto_91598 ?auto_91602 ) ( CLEAR ?auto_91598 ) ( IS-CRATE ?auto_91600 ) ( not ( = ?auto_91598 ?auto_91600 ) ) ( TRUCK-AT ?auto_91603 ?auto_91602 ) ( AVAILABLE ?auto_91601 ) ( IN ?auto_91600 ?auto_91603 ) ( ON ?auto_91598 ?auto_91599 ) ( not ( = ?auto_91599 ?auto_91598 ) ) ( not ( = ?auto_91599 ?auto_91600 ) ) ( ON ?auto_91596 ?auto_91595 ) ( ON ?auto_91597 ?auto_91596 ) ( ON ?auto_91599 ?auto_91597 ) ( not ( = ?auto_91595 ?auto_91596 ) ) ( not ( = ?auto_91595 ?auto_91597 ) ) ( not ( = ?auto_91595 ?auto_91599 ) ) ( not ( = ?auto_91595 ?auto_91598 ) ) ( not ( = ?auto_91595 ?auto_91600 ) ) ( not ( = ?auto_91596 ?auto_91597 ) ) ( not ( = ?auto_91596 ?auto_91599 ) ) ( not ( = ?auto_91596 ?auto_91598 ) ) ( not ( = ?auto_91596 ?auto_91600 ) ) ( not ( = ?auto_91597 ?auto_91599 ) ) ( not ( = ?auto_91597 ?auto_91598 ) ) ( not ( = ?auto_91597 ?auto_91600 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91599 ?auto_91598 ?auto_91600 )
      ( MAKE-5CRATE-VERIFY ?auto_91595 ?auto_91596 ?auto_91597 ?auto_91599 ?auto_91598 ?auto_91600 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91635 - SURFACE
      ?auto_91636 - SURFACE
      ?auto_91637 - SURFACE
      ?auto_91639 - SURFACE
      ?auto_91638 - SURFACE
      ?auto_91640 - SURFACE
    )
    :vars
    (
      ?auto_91643 - HOIST
      ?auto_91641 - PLACE
      ?auto_91644 - TRUCK
      ?auto_91642 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91643 ?auto_91641 ) ( SURFACE-AT ?auto_91638 ?auto_91641 ) ( CLEAR ?auto_91638 ) ( IS-CRATE ?auto_91640 ) ( not ( = ?auto_91638 ?auto_91640 ) ) ( AVAILABLE ?auto_91643 ) ( IN ?auto_91640 ?auto_91644 ) ( ON ?auto_91638 ?auto_91639 ) ( not ( = ?auto_91639 ?auto_91638 ) ) ( not ( = ?auto_91639 ?auto_91640 ) ) ( TRUCK-AT ?auto_91644 ?auto_91642 ) ( not ( = ?auto_91642 ?auto_91641 ) ) ( ON ?auto_91636 ?auto_91635 ) ( ON ?auto_91637 ?auto_91636 ) ( ON ?auto_91639 ?auto_91637 ) ( not ( = ?auto_91635 ?auto_91636 ) ) ( not ( = ?auto_91635 ?auto_91637 ) ) ( not ( = ?auto_91635 ?auto_91639 ) ) ( not ( = ?auto_91635 ?auto_91638 ) ) ( not ( = ?auto_91635 ?auto_91640 ) ) ( not ( = ?auto_91636 ?auto_91637 ) ) ( not ( = ?auto_91636 ?auto_91639 ) ) ( not ( = ?auto_91636 ?auto_91638 ) ) ( not ( = ?auto_91636 ?auto_91640 ) ) ( not ( = ?auto_91637 ?auto_91639 ) ) ( not ( = ?auto_91637 ?auto_91638 ) ) ( not ( = ?auto_91637 ?auto_91640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91639 ?auto_91638 ?auto_91640 )
      ( MAKE-5CRATE-VERIFY ?auto_91635 ?auto_91636 ?auto_91637 ?auto_91639 ?auto_91638 ?auto_91640 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91680 - SURFACE
      ?auto_91681 - SURFACE
      ?auto_91682 - SURFACE
      ?auto_91684 - SURFACE
      ?auto_91683 - SURFACE
      ?auto_91685 - SURFACE
    )
    :vars
    (
      ?auto_91690 - HOIST
      ?auto_91687 - PLACE
      ?auto_91686 - TRUCK
      ?auto_91688 - PLACE
      ?auto_91689 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_91690 ?auto_91687 ) ( SURFACE-AT ?auto_91683 ?auto_91687 ) ( CLEAR ?auto_91683 ) ( IS-CRATE ?auto_91685 ) ( not ( = ?auto_91683 ?auto_91685 ) ) ( AVAILABLE ?auto_91690 ) ( ON ?auto_91683 ?auto_91684 ) ( not ( = ?auto_91684 ?auto_91683 ) ) ( not ( = ?auto_91684 ?auto_91685 ) ) ( TRUCK-AT ?auto_91686 ?auto_91688 ) ( not ( = ?auto_91688 ?auto_91687 ) ) ( HOIST-AT ?auto_91689 ?auto_91688 ) ( LIFTING ?auto_91689 ?auto_91685 ) ( not ( = ?auto_91690 ?auto_91689 ) ) ( ON ?auto_91681 ?auto_91680 ) ( ON ?auto_91682 ?auto_91681 ) ( ON ?auto_91684 ?auto_91682 ) ( not ( = ?auto_91680 ?auto_91681 ) ) ( not ( = ?auto_91680 ?auto_91682 ) ) ( not ( = ?auto_91680 ?auto_91684 ) ) ( not ( = ?auto_91680 ?auto_91683 ) ) ( not ( = ?auto_91680 ?auto_91685 ) ) ( not ( = ?auto_91681 ?auto_91682 ) ) ( not ( = ?auto_91681 ?auto_91684 ) ) ( not ( = ?auto_91681 ?auto_91683 ) ) ( not ( = ?auto_91681 ?auto_91685 ) ) ( not ( = ?auto_91682 ?auto_91684 ) ) ( not ( = ?auto_91682 ?auto_91683 ) ) ( not ( = ?auto_91682 ?auto_91685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91684 ?auto_91683 ?auto_91685 )
      ( MAKE-5CRATE-VERIFY ?auto_91680 ?auto_91681 ?auto_91682 ?auto_91684 ?auto_91683 ?auto_91685 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91730 - SURFACE
      ?auto_91731 - SURFACE
      ?auto_91732 - SURFACE
      ?auto_91734 - SURFACE
      ?auto_91733 - SURFACE
      ?auto_91735 - SURFACE
    )
    :vars
    (
      ?auto_91738 - HOIST
      ?auto_91737 - PLACE
      ?auto_91739 - TRUCK
      ?auto_91740 - PLACE
      ?auto_91736 - HOIST
      ?auto_91741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_91738 ?auto_91737 ) ( SURFACE-AT ?auto_91733 ?auto_91737 ) ( CLEAR ?auto_91733 ) ( IS-CRATE ?auto_91735 ) ( not ( = ?auto_91733 ?auto_91735 ) ) ( AVAILABLE ?auto_91738 ) ( ON ?auto_91733 ?auto_91734 ) ( not ( = ?auto_91734 ?auto_91733 ) ) ( not ( = ?auto_91734 ?auto_91735 ) ) ( TRUCK-AT ?auto_91739 ?auto_91740 ) ( not ( = ?auto_91740 ?auto_91737 ) ) ( HOIST-AT ?auto_91736 ?auto_91740 ) ( not ( = ?auto_91738 ?auto_91736 ) ) ( AVAILABLE ?auto_91736 ) ( SURFACE-AT ?auto_91735 ?auto_91740 ) ( ON ?auto_91735 ?auto_91741 ) ( CLEAR ?auto_91735 ) ( not ( = ?auto_91733 ?auto_91741 ) ) ( not ( = ?auto_91735 ?auto_91741 ) ) ( not ( = ?auto_91734 ?auto_91741 ) ) ( ON ?auto_91731 ?auto_91730 ) ( ON ?auto_91732 ?auto_91731 ) ( ON ?auto_91734 ?auto_91732 ) ( not ( = ?auto_91730 ?auto_91731 ) ) ( not ( = ?auto_91730 ?auto_91732 ) ) ( not ( = ?auto_91730 ?auto_91734 ) ) ( not ( = ?auto_91730 ?auto_91733 ) ) ( not ( = ?auto_91730 ?auto_91735 ) ) ( not ( = ?auto_91730 ?auto_91741 ) ) ( not ( = ?auto_91731 ?auto_91732 ) ) ( not ( = ?auto_91731 ?auto_91734 ) ) ( not ( = ?auto_91731 ?auto_91733 ) ) ( not ( = ?auto_91731 ?auto_91735 ) ) ( not ( = ?auto_91731 ?auto_91741 ) ) ( not ( = ?auto_91732 ?auto_91734 ) ) ( not ( = ?auto_91732 ?auto_91733 ) ) ( not ( = ?auto_91732 ?auto_91735 ) ) ( not ( = ?auto_91732 ?auto_91741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91734 ?auto_91733 ?auto_91735 )
      ( MAKE-5CRATE-VERIFY ?auto_91730 ?auto_91731 ?auto_91732 ?auto_91734 ?auto_91733 ?auto_91735 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91781 - SURFACE
      ?auto_91782 - SURFACE
      ?auto_91783 - SURFACE
      ?auto_91785 - SURFACE
      ?auto_91784 - SURFACE
      ?auto_91786 - SURFACE
    )
    :vars
    (
      ?auto_91788 - HOIST
      ?auto_91790 - PLACE
      ?auto_91787 - PLACE
      ?auto_91791 - HOIST
      ?auto_91792 - SURFACE
      ?auto_91789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91788 ?auto_91790 ) ( SURFACE-AT ?auto_91784 ?auto_91790 ) ( CLEAR ?auto_91784 ) ( IS-CRATE ?auto_91786 ) ( not ( = ?auto_91784 ?auto_91786 ) ) ( AVAILABLE ?auto_91788 ) ( ON ?auto_91784 ?auto_91785 ) ( not ( = ?auto_91785 ?auto_91784 ) ) ( not ( = ?auto_91785 ?auto_91786 ) ) ( not ( = ?auto_91787 ?auto_91790 ) ) ( HOIST-AT ?auto_91791 ?auto_91787 ) ( not ( = ?auto_91788 ?auto_91791 ) ) ( AVAILABLE ?auto_91791 ) ( SURFACE-AT ?auto_91786 ?auto_91787 ) ( ON ?auto_91786 ?auto_91792 ) ( CLEAR ?auto_91786 ) ( not ( = ?auto_91784 ?auto_91792 ) ) ( not ( = ?auto_91786 ?auto_91792 ) ) ( not ( = ?auto_91785 ?auto_91792 ) ) ( TRUCK-AT ?auto_91789 ?auto_91790 ) ( ON ?auto_91782 ?auto_91781 ) ( ON ?auto_91783 ?auto_91782 ) ( ON ?auto_91785 ?auto_91783 ) ( not ( = ?auto_91781 ?auto_91782 ) ) ( not ( = ?auto_91781 ?auto_91783 ) ) ( not ( = ?auto_91781 ?auto_91785 ) ) ( not ( = ?auto_91781 ?auto_91784 ) ) ( not ( = ?auto_91781 ?auto_91786 ) ) ( not ( = ?auto_91781 ?auto_91792 ) ) ( not ( = ?auto_91782 ?auto_91783 ) ) ( not ( = ?auto_91782 ?auto_91785 ) ) ( not ( = ?auto_91782 ?auto_91784 ) ) ( not ( = ?auto_91782 ?auto_91786 ) ) ( not ( = ?auto_91782 ?auto_91792 ) ) ( not ( = ?auto_91783 ?auto_91785 ) ) ( not ( = ?auto_91783 ?auto_91784 ) ) ( not ( = ?auto_91783 ?auto_91786 ) ) ( not ( = ?auto_91783 ?auto_91792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91785 ?auto_91784 ?auto_91786 )
      ( MAKE-5CRATE-VERIFY ?auto_91781 ?auto_91782 ?auto_91783 ?auto_91785 ?auto_91784 ?auto_91786 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91832 - SURFACE
      ?auto_91833 - SURFACE
      ?auto_91834 - SURFACE
      ?auto_91836 - SURFACE
      ?auto_91835 - SURFACE
      ?auto_91837 - SURFACE
    )
    :vars
    (
      ?auto_91842 - HOIST
      ?auto_91841 - PLACE
      ?auto_91843 - PLACE
      ?auto_91840 - HOIST
      ?auto_91839 - SURFACE
      ?auto_91838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91842 ?auto_91841 ) ( IS-CRATE ?auto_91837 ) ( not ( = ?auto_91835 ?auto_91837 ) ) ( not ( = ?auto_91836 ?auto_91835 ) ) ( not ( = ?auto_91836 ?auto_91837 ) ) ( not ( = ?auto_91843 ?auto_91841 ) ) ( HOIST-AT ?auto_91840 ?auto_91843 ) ( not ( = ?auto_91842 ?auto_91840 ) ) ( AVAILABLE ?auto_91840 ) ( SURFACE-AT ?auto_91837 ?auto_91843 ) ( ON ?auto_91837 ?auto_91839 ) ( CLEAR ?auto_91837 ) ( not ( = ?auto_91835 ?auto_91839 ) ) ( not ( = ?auto_91837 ?auto_91839 ) ) ( not ( = ?auto_91836 ?auto_91839 ) ) ( TRUCK-AT ?auto_91838 ?auto_91841 ) ( SURFACE-AT ?auto_91836 ?auto_91841 ) ( CLEAR ?auto_91836 ) ( LIFTING ?auto_91842 ?auto_91835 ) ( IS-CRATE ?auto_91835 ) ( ON ?auto_91833 ?auto_91832 ) ( ON ?auto_91834 ?auto_91833 ) ( ON ?auto_91836 ?auto_91834 ) ( not ( = ?auto_91832 ?auto_91833 ) ) ( not ( = ?auto_91832 ?auto_91834 ) ) ( not ( = ?auto_91832 ?auto_91836 ) ) ( not ( = ?auto_91832 ?auto_91835 ) ) ( not ( = ?auto_91832 ?auto_91837 ) ) ( not ( = ?auto_91832 ?auto_91839 ) ) ( not ( = ?auto_91833 ?auto_91834 ) ) ( not ( = ?auto_91833 ?auto_91836 ) ) ( not ( = ?auto_91833 ?auto_91835 ) ) ( not ( = ?auto_91833 ?auto_91837 ) ) ( not ( = ?auto_91833 ?auto_91839 ) ) ( not ( = ?auto_91834 ?auto_91836 ) ) ( not ( = ?auto_91834 ?auto_91835 ) ) ( not ( = ?auto_91834 ?auto_91837 ) ) ( not ( = ?auto_91834 ?auto_91839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91836 ?auto_91835 ?auto_91837 )
      ( MAKE-5CRATE-VERIFY ?auto_91832 ?auto_91833 ?auto_91834 ?auto_91836 ?auto_91835 ?auto_91837 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_91883 - SURFACE
      ?auto_91884 - SURFACE
      ?auto_91885 - SURFACE
      ?auto_91887 - SURFACE
      ?auto_91886 - SURFACE
      ?auto_91888 - SURFACE
    )
    :vars
    (
      ?auto_91890 - HOIST
      ?auto_91894 - PLACE
      ?auto_91891 - PLACE
      ?auto_91893 - HOIST
      ?auto_91889 - SURFACE
      ?auto_91892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_91890 ?auto_91894 ) ( IS-CRATE ?auto_91888 ) ( not ( = ?auto_91886 ?auto_91888 ) ) ( not ( = ?auto_91887 ?auto_91886 ) ) ( not ( = ?auto_91887 ?auto_91888 ) ) ( not ( = ?auto_91891 ?auto_91894 ) ) ( HOIST-AT ?auto_91893 ?auto_91891 ) ( not ( = ?auto_91890 ?auto_91893 ) ) ( AVAILABLE ?auto_91893 ) ( SURFACE-AT ?auto_91888 ?auto_91891 ) ( ON ?auto_91888 ?auto_91889 ) ( CLEAR ?auto_91888 ) ( not ( = ?auto_91886 ?auto_91889 ) ) ( not ( = ?auto_91888 ?auto_91889 ) ) ( not ( = ?auto_91887 ?auto_91889 ) ) ( TRUCK-AT ?auto_91892 ?auto_91894 ) ( SURFACE-AT ?auto_91887 ?auto_91894 ) ( CLEAR ?auto_91887 ) ( IS-CRATE ?auto_91886 ) ( AVAILABLE ?auto_91890 ) ( IN ?auto_91886 ?auto_91892 ) ( ON ?auto_91884 ?auto_91883 ) ( ON ?auto_91885 ?auto_91884 ) ( ON ?auto_91887 ?auto_91885 ) ( not ( = ?auto_91883 ?auto_91884 ) ) ( not ( = ?auto_91883 ?auto_91885 ) ) ( not ( = ?auto_91883 ?auto_91887 ) ) ( not ( = ?auto_91883 ?auto_91886 ) ) ( not ( = ?auto_91883 ?auto_91888 ) ) ( not ( = ?auto_91883 ?auto_91889 ) ) ( not ( = ?auto_91884 ?auto_91885 ) ) ( not ( = ?auto_91884 ?auto_91887 ) ) ( not ( = ?auto_91884 ?auto_91886 ) ) ( not ( = ?auto_91884 ?auto_91888 ) ) ( not ( = ?auto_91884 ?auto_91889 ) ) ( not ( = ?auto_91885 ?auto_91887 ) ) ( not ( = ?auto_91885 ?auto_91886 ) ) ( not ( = ?auto_91885 ?auto_91888 ) ) ( not ( = ?auto_91885 ?auto_91889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_91887 ?auto_91886 ?auto_91888 )
      ( MAKE-5CRATE-VERIFY ?auto_91883 ?auto_91884 ?auto_91885 ?auto_91887 ?auto_91886 ?auto_91888 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93092 - SURFACE
      ?auto_93093 - SURFACE
      ?auto_93094 - SURFACE
      ?auto_93096 - SURFACE
      ?auto_93095 - SURFACE
      ?auto_93097 - SURFACE
      ?auto_93098 - SURFACE
    )
    :vars
    (
      ?auto_93099 - HOIST
      ?auto_93100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93099 ?auto_93100 ) ( SURFACE-AT ?auto_93097 ?auto_93100 ) ( CLEAR ?auto_93097 ) ( LIFTING ?auto_93099 ?auto_93098 ) ( IS-CRATE ?auto_93098 ) ( not ( = ?auto_93097 ?auto_93098 ) ) ( ON ?auto_93093 ?auto_93092 ) ( ON ?auto_93094 ?auto_93093 ) ( ON ?auto_93096 ?auto_93094 ) ( ON ?auto_93095 ?auto_93096 ) ( ON ?auto_93097 ?auto_93095 ) ( not ( = ?auto_93092 ?auto_93093 ) ) ( not ( = ?auto_93092 ?auto_93094 ) ) ( not ( = ?auto_93092 ?auto_93096 ) ) ( not ( = ?auto_93092 ?auto_93095 ) ) ( not ( = ?auto_93092 ?auto_93097 ) ) ( not ( = ?auto_93092 ?auto_93098 ) ) ( not ( = ?auto_93093 ?auto_93094 ) ) ( not ( = ?auto_93093 ?auto_93096 ) ) ( not ( = ?auto_93093 ?auto_93095 ) ) ( not ( = ?auto_93093 ?auto_93097 ) ) ( not ( = ?auto_93093 ?auto_93098 ) ) ( not ( = ?auto_93094 ?auto_93096 ) ) ( not ( = ?auto_93094 ?auto_93095 ) ) ( not ( = ?auto_93094 ?auto_93097 ) ) ( not ( = ?auto_93094 ?auto_93098 ) ) ( not ( = ?auto_93096 ?auto_93095 ) ) ( not ( = ?auto_93096 ?auto_93097 ) ) ( not ( = ?auto_93096 ?auto_93098 ) ) ( not ( = ?auto_93095 ?auto_93097 ) ) ( not ( = ?auto_93095 ?auto_93098 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_93097 ?auto_93098 )
      ( MAKE-6CRATE-VERIFY ?auto_93092 ?auto_93093 ?auto_93094 ?auto_93096 ?auto_93095 ?auto_93097 ?auto_93098 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93136 - SURFACE
      ?auto_93137 - SURFACE
      ?auto_93138 - SURFACE
      ?auto_93140 - SURFACE
      ?auto_93139 - SURFACE
      ?auto_93141 - SURFACE
      ?auto_93142 - SURFACE
    )
    :vars
    (
      ?auto_93144 - HOIST
      ?auto_93145 - PLACE
      ?auto_93143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93144 ?auto_93145 ) ( SURFACE-AT ?auto_93141 ?auto_93145 ) ( CLEAR ?auto_93141 ) ( IS-CRATE ?auto_93142 ) ( not ( = ?auto_93141 ?auto_93142 ) ) ( TRUCK-AT ?auto_93143 ?auto_93145 ) ( AVAILABLE ?auto_93144 ) ( IN ?auto_93142 ?auto_93143 ) ( ON ?auto_93141 ?auto_93139 ) ( not ( = ?auto_93139 ?auto_93141 ) ) ( not ( = ?auto_93139 ?auto_93142 ) ) ( ON ?auto_93137 ?auto_93136 ) ( ON ?auto_93138 ?auto_93137 ) ( ON ?auto_93140 ?auto_93138 ) ( ON ?auto_93139 ?auto_93140 ) ( not ( = ?auto_93136 ?auto_93137 ) ) ( not ( = ?auto_93136 ?auto_93138 ) ) ( not ( = ?auto_93136 ?auto_93140 ) ) ( not ( = ?auto_93136 ?auto_93139 ) ) ( not ( = ?auto_93136 ?auto_93141 ) ) ( not ( = ?auto_93136 ?auto_93142 ) ) ( not ( = ?auto_93137 ?auto_93138 ) ) ( not ( = ?auto_93137 ?auto_93140 ) ) ( not ( = ?auto_93137 ?auto_93139 ) ) ( not ( = ?auto_93137 ?auto_93141 ) ) ( not ( = ?auto_93137 ?auto_93142 ) ) ( not ( = ?auto_93138 ?auto_93140 ) ) ( not ( = ?auto_93138 ?auto_93139 ) ) ( not ( = ?auto_93138 ?auto_93141 ) ) ( not ( = ?auto_93138 ?auto_93142 ) ) ( not ( = ?auto_93140 ?auto_93139 ) ) ( not ( = ?auto_93140 ?auto_93141 ) ) ( not ( = ?auto_93140 ?auto_93142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93139 ?auto_93141 ?auto_93142 )
      ( MAKE-6CRATE-VERIFY ?auto_93136 ?auto_93137 ?auto_93138 ?auto_93140 ?auto_93139 ?auto_93141 ?auto_93142 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93187 - SURFACE
      ?auto_93188 - SURFACE
      ?auto_93189 - SURFACE
      ?auto_93191 - SURFACE
      ?auto_93190 - SURFACE
      ?auto_93192 - SURFACE
      ?auto_93193 - SURFACE
    )
    :vars
    (
      ?auto_93195 - HOIST
      ?auto_93197 - PLACE
      ?auto_93196 - TRUCK
      ?auto_93194 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93195 ?auto_93197 ) ( SURFACE-AT ?auto_93192 ?auto_93197 ) ( CLEAR ?auto_93192 ) ( IS-CRATE ?auto_93193 ) ( not ( = ?auto_93192 ?auto_93193 ) ) ( AVAILABLE ?auto_93195 ) ( IN ?auto_93193 ?auto_93196 ) ( ON ?auto_93192 ?auto_93190 ) ( not ( = ?auto_93190 ?auto_93192 ) ) ( not ( = ?auto_93190 ?auto_93193 ) ) ( TRUCK-AT ?auto_93196 ?auto_93194 ) ( not ( = ?auto_93194 ?auto_93197 ) ) ( ON ?auto_93188 ?auto_93187 ) ( ON ?auto_93189 ?auto_93188 ) ( ON ?auto_93191 ?auto_93189 ) ( ON ?auto_93190 ?auto_93191 ) ( not ( = ?auto_93187 ?auto_93188 ) ) ( not ( = ?auto_93187 ?auto_93189 ) ) ( not ( = ?auto_93187 ?auto_93191 ) ) ( not ( = ?auto_93187 ?auto_93190 ) ) ( not ( = ?auto_93187 ?auto_93192 ) ) ( not ( = ?auto_93187 ?auto_93193 ) ) ( not ( = ?auto_93188 ?auto_93189 ) ) ( not ( = ?auto_93188 ?auto_93191 ) ) ( not ( = ?auto_93188 ?auto_93190 ) ) ( not ( = ?auto_93188 ?auto_93192 ) ) ( not ( = ?auto_93188 ?auto_93193 ) ) ( not ( = ?auto_93189 ?auto_93191 ) ) ( not ( = ?auto_93189 ?auto_93190 ) ) ( not ( = ?auto_93189 ?auto_93192 ) ) ( not ( = ?auto_93189 ?auto_93193 ) ) ( not ( = ?auto_93191 ?auto_93190 ) ) ( not ( = ?auto_93191 ?auto_93192 ) ) ( not ( = ?auto_93191 ?auto_93193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93190 ?auto_93192 ?auto_93193 )
      ( MAKE-6CRATE-VERIFY ?auto_93187 ?auto_93188 ?auto_93189 ?auto_93191 ?auto_93190 ?auto_93192 ?auto_93193 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93244 - SURFACE
      ?auto_93245 - SURFACE
      ?auto_93246 - SURFACE
      ?auto_93248 - SURFACE
      ?auto_93247 - SURFACE
      ?auto_93249 - SURFACE
      ?auto_93250 - SURFACE
    )
    :vars
    (
      ?auto_93255 - HOIST
      ?auto_93254 - PLACE
      ?auto_93251 - TRUCK
      ?auto_93253 - PLACE
      ?auto_93252 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_93255 ?auto_93254 ) ( SURFACE-AT ?auto_93249 ?auto_93254 ) ( CLEAR ?auto_93249 ) ( IS-CRATE ?auto_93250 ) ( not ( = ?auto_93249 ?auto_93250 ) ) ( AVAILABLE ?auto_93255 ) ( ON ?auto_93249 ?auto_93247 ) ( not ( = ?auto_93247 ?auto_93249 ) ) ( not ( = ?auto_93247 ?auto_93250 ) ) ( TRUCK-AT ?auto_93251 ?auto_93253 ) ( not ( = ?auto_93253 ?auto_93254 ) ) ( HOIST-AT ?auto_93252 ?auto_93253 ) ( LIFTING ?auto_93252 ?auto_93250 ) ( not ( = ?auto_93255 ?auto_93252 ) ) ( ON ?auto_93245 ?auto_93244 ) ( ON ?auto_93246 ?auto_93245 ) ( ON ?auto_93248 ?auto_93246 ) ( ON ?auto_93247 ?auto_93248 ) ( not ( = ?auto_93244 ?auto_93245 ) ) ( not ( = ?auto_93244 ?auto_93246 ) ) ( not ( = ?auto_93244 ?auto_93248 ) ) ( not ( = ?auto_93244 ?auto_93247 ) ) ( not ( = ?auto_93244 ?auto_93249 ) ) ( not ( = ?auto_93244 ?auto_93250 ) ) ( not ( = ?auto_93245 ?auto_93246 ) ) ( not ( = ?auto_93245 ?auto_93248 ) ) ( not ( = ?auto_93245 ?auto_93247 ) ) ( not ( = ?auto_93245 ?auto_93249 ) ) ( not ( = ?auto_93245 ?auto_93250 ) ) ( not ( = ?auto_93246 ?auto_93248 ) ) ( not ( = ?auto_93246 ?auto_93247 ) ) ( not ( = ?auto_93246 ?auto_93249 ) ) ( not ( = ?auto_93246 ?auto_93250 ) ) ( not ( = ?auto_93248 ?auto_93247 ) ) ( not ( = ?auto_93248 ?auto_93249 ) ) ( not ( = ?auto_93248 ?auto_93250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93247 ?auto_93249 ?auto_93250 )
      ( MAKE-6CRATE-VERIFY ?auto_93244 ?auto_93245 ?auto_93246 ?auto_93248 ?auto_93247 ?auto_93249 ?auto_93250 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93307 - SURFACE
      ?auto_93308 - SURFACE
      ?auto_93309 - SURFACE
      ?auto_93311 - SURFACE
      ?auto_93310 - SURFACE
      ?auto_93312 - SURFACE
      ?auto_93313 - SURFACE
    )
    :vars
    (
      ?auto_93314 - HOIST
      ?auto_93318 - PLACE
      ?auto_93315 - TRUCK
      ?auto_93319 - PLACE
      ?auto_93316 - HOIST
      ?auto_93317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_93314 ?auto_93318 ) ( SURFACE-AT ?auto_93312 ?auto_93318 ) ( CLEAR ?auto_93312 ) ( IS-CRATE ?auto_93313 ) ( not ( = ?auto_93312 ?auto_93313 ) ) ( AVAILABLE ?auto_93314 ) ( ON ?auto_93312 ?auto_93310 ) ( not ( = ?auto_93310 ?auto_93312 ) ) ( not ( = ?auto_93310 ?auto_93313 ) ) ( TRUCK-AT ?auto_93315 ?auto_93319 ) ( not ( = ?auto_93319 ?auto_93318 ) ) ( HOIST-AT ?auto_93316 ?auto_93319 ) ( not ( = ?auto_93314 ?auto_93316 ) ) ( AVAILABLE ?auto_93316 ) ( SURFACE-AT ?auto_93313 ?auto_93319 ) ( ON ?auto_93313 ?auto_93317 ) ( CLEAR ?auto_93313 ) ( not ( = ?auto_93312 ?auto_93317 ) ) ( not ( = ?auto_93313 ?auto_93317 ) ) ( not ( = ?auto_93310 ?auto_93317 ) ) ( ON ?auto_93308 ?auto_93307 ) ( ON ?auto_93309 ?auto_93308 ) ( ON ?auto_93311 ?auto_93309 ) ( ON ?auto_93310 ?auto_93311 ) ( not ( = ?auto_93307 ?auto_93308 ) ) ( not ( = ?auto_93307 ?auto_93309 ) ) ( not ( = ?auto_93307 ?auto_93311 ) ) ( not ( = ?auto_93307 ?auto_93310 ) ) ( not ( = ?auto_93307 ?auto_93312 ) ) ( not ( = ?auto_93307 ?auto_93313 ) ) ( not ( = ?auto_93307 ?auto_93317 ) ) ( not ( = ?auto_93308 ?auto_93309 ) ) ( not ( = ?auto_93308 ?auto_93311 ) ) ( not ( = ?auto_93308 ?auto_93310 ) ) ( not ( = ?auto_93308 ?auto_93312 ) ) ( not ( = ?auto_93308 ?auto_93313 ) ) ( not ( = ?auto_93308 ?auto_93317 ) ) ( not ( = ?auto_93309 ?auto_93311 ) ) ( not ( = ?auto_93309 ?auto_93310 ) ) ( not ( = ?auto_93309 ?auto_93312 ) ) ( not ( = ?auto_93309 ?auto_93313 ) ) ( not ( = ?auto_93309 ?auto_93317 ) ) ( not ( = ?auto_93311 ?auto_93310 ) ) ( not ( = ?auto_93311 ?auto_93312 ) ) ( not ( = ?auto_93311 ?auto_93313 ) ) ( not ( = ?auto_93311 ?auto_93317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93310 ?auto_93312 ?auto_93313 )
      ( MAKE-6CRATE-VERIFY ?auto_93307 ?auto_93308 ?auto_93309 ?auto_93311 ?auto_93310 ?auto_93312 ?auto_93313 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93371 - SURFACE
      ?auto_93372 - SURFACE
      ?auto_93373 - SURFACE
      ?auto_93375 - SURFACE
      ?auto_93374 - SURFACE
      ?auto_93376 - SURFACE
      ?auto_93377 - SURFACE
    )
    :vars
    (
      ?auto_93379 - HOIST
      ?auto_93381 - PLACE
      ?auto_93383 - PLACE
      ?auto_93378 - HOIST
      ?auto_93380 - SURFACE
      ?auto_93382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93379 ?auto_93381 ) ( SURFACE-AT ?auto_93376 ?auto_93381 ) ( CLEAR ?auto_93376 ) ( IS-CRATE ?auto_93377 ) ( not ( = ?auto_93376 ?auto_93377 ) ) ( AVAILABLE ?auto_93379 ) ( ON ?auto_93376 ?auto_93374 ) ( not ( = ?auto_93374 ?auto_93376 ) ) ( not ( = ?auto_93374 ?auto_93377 ) ) ( not ( = ?auto_93383 ?auto_93381 ) ) ( HOIST-AT ?auto_93378 ?auto_93383 ) ( not ( = ?auto_93379 ?auto_93378 ) ) ( AVAILABLE ?auto_93378 ) ( SURFACE-AT ?auto_93377 ?auto_93383 ) ( ON ?auto_93377 ?auto_93380 ) ( CLEAR ?auto_93377 ) ( not ( = ?auto_93376 ?auto_93380 ) ) ( not ( = ?auto_93377 ?auto_93380 ) ) ( not ( = ?auto_93374 ?auto_93380 ) ) ( TRUCK-AT ?auto_93382 ?auto_93381 ) ( ON ?auto_93372 ?auto_93371 ) ( ON ?auto_93373 ?auto_93372 ) ( ON ?auto_93375 ?auto_93373 ) ( ON ?auto_93374 ?auto_93375 ) ( not ( = ?auto_93371 ?auto_93372 ) ) ( not ( = ?auto_93371 ?auto_93373 ) ) ( not ( = ?auto_93371 ?auto_93375 ) ) ( not ( = ?auto_93371 ?auto_93374 ) ) ( not ( = ?auto_93371 ?auto_93376 ) ) ( not ( = ?auto_93371 ?auto_93377 ) ) ( not ( = ?auto_93371 ?auto_93380 ) ) ( not ( = ?auto_93372 ?auto_93373 ) ) ( not ( = ?auto_93372 ?auto_93375 ) ) ( not ( = ?auto_93372 ?auto_93374 ) ) ( not ( = ?auto_93372 ?auto_93376 ) ) ( not ( = ?auto_93372 ?auto_93377 ) ) ( not ( = ?auto_93372 ?auto_93380 ) ) ( not ( = ?auto_93373 ?auto_93375 ) ) ( not ( = ?auto_93373 ?auto_93374 ) ) ( not ( = ?auto_93373 ?auto_93376 ) ) ( not ( = ?auto_93373 ?auto_93377 ) ) ( not ( = ?auto_93373 ?auto_93380 ) ) ( not ( = ?auto_93375 ?auto_93374 ) ) ( not ( = ?auto_93375 ?auto_93376 ) ) ( not ( = ?auto_93375 ?auto_93377 ) ) ( not ( = ?auto_93375 ?auto_93380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93374 ?auto_93376 ?auto_93377 )
      ( MAKE-6CRATE-VERIFY ?auto_93371 ?auto_93372 ?auto_93373 ?auto_93375 ?auto_93374 ?auto_93376 ?auto_93377 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93435 - SURFACE
      ?auto_93436 - SURFACE
      ?auto_93437 - SURFACE
      ?auto_93439 - SURFACE
      ?auto_93438 - SURFACE
      ?auto_93440 - SURFACE
      ?auto_93441 - SURFACE
    )
    :vars
    (
      ?auto_93443 - HOIST
      ?auto_93442 - PLACE
      ?auto_93447 - PLACE
      ?auto_93444 - HOIST
      ?auto_93445 - SURFACE
      ?auto_93446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93443 ?auto_93442 ) ( IS-CRATE ?auto_93441 ) ( not ( = ?auto_93440 ?auto_93441 ) ) ( not ( = ?auto_93438 ?auto_93440 ) ) ( not ( = ?auto_93438 ?auto_93441 ) ) ( not ( = ?auto_93447 ?auto_93442 ) ) ( HOIST-AT ?auto_93444 ?auto_93447 ) ( not ( = ?auto_93443 ?auto_93444 ) ) ( AVAILABLE ?auto_93444 ) ( SURFACE-AT ?auto_93441 ?auto_93447 ) ( ON ?auto_93441 ?auto_93445 ) ( CLEAR ?auto_93441 ) ( not ( = ?auto_93440 ?auto_93445 ) ) ( not ( = ?auto_93441 ?auto_93445 ) ) ( not ( = ?auto_93438 ?auto_93445 ) ) ( TRUCK-AT ?auto_93446 ?auto_93442 ) ( SURFACE-AT ?auto_93438 ?auto_93442 ) ( CLEAR ?auto_93438 ) ( LIFTING ?auto_93443 ?auto_93440 ) ( IS-CRATE ?auto_93440 ) ( ON ?auto_93436 ?auto_93435 ) ( ON ?auto_93437 ?auto_93436 ) ( ON ?auto_93439 ?auto_93437 ) ( ON ?auto_93438 ?auto_93439 ) ( not ( = ?auto_93435 ?auto_93436 ) ) ( not ( = ?auto_93435 ?auto_93437 ) ) ( not ( = ?auto_93435 ?auto_93439 ) ) ( not ( = ?auto_93435 ?auto_93438 ) ) ( not ( = ?auto_93435 ?auto_93440 ) ) ( not ( = ?auto_93435 ?auto_93441 ) ) ( not ( = ?auto_93435 ?auto_93445 ) ) ( not ( = ?auto_93436 ?auto_93437 ) ) ( not ( = ?auto_93436 ?auto_93439 ) ) ( not ( = ?auto_93436 ?auto_93438 ) ) ( not ( = ?auto_93436 ?auto_93440 ) ) ( not ( = ?auto_93436 ?auto_93441 ) ) ( not ( = ?auto_93436 ?auto_93445 ) ) ( not ( = ?auto_93437 ?auto_93439 ) ) ( not ( = ?auto_93437 ?auto_93438 ) ) ( not ( = ?auto_93437 ?auto_93440 ) ) ( not ( = ?auto_93437 ?auto_93441 ) ) ( not ( = ?auto_93437 ?auto_93445 ) ) ( not ( = ?auto_93439 ?auto_93438 ) ) ( not ( = ?auto_93439 ?auto_93440 ) ) ( not ( = ?auto_93439 ?auto_93441 ) ) ( not ( = ?auto_93439 ?auto_93445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93438 ?auto_93440 ?auto_93441 )
      ( MAKE-6CRATE-VERIFY ?auto_93435 ?auto_93436 ?auto_93437 ?auto_93439 ?auto_93438 ?auto_93440 ?auto_93441 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_93499 - SURFACE
      ?auto_93500 - SURFACE
      ?auto_93501 - SURFACE
      ?auto_93503 - SURFACE
      ?auto_93502 - SURFACE
      ?auto_93504 - SURFACE
      ?auto_93505 - SURFACE
    )
    :vars
    (
      ?auto_93510 - HOIST
      ?auto_93507 - PLACE
      ?auto_93506 - PLACE
      ?auto_93508 - HOIST
      ?auto_93511 - SURFACE
      ?auto_93509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_93510 ?auto_93507 ) ( IS-CRATE ?auto_93505 ) ( not ( = ?auto_93504 ?auto_93505 ) ) ( not ( = ?auto_93502 ?auto_93504 ) ) ( not ( = ?auto_93502 ?auto_93505 ) ) ( not ( = ?auto_93506 ?auto_93507 ) ) ( HOIST-AT ?auto_93508 ?auto_93506 ) ( not ( = ?auto_93510 ?auto_93508 ) ) ( AVAILABLE ?auto_93508 ) ( SURFACE-AT ?auto_93505 ?auto_93506 ) ( ON ?auto_93505 ?auto_93511 ) ( CLEAR ?auto_93505 ) ( not ( = ?auto_93504 ?auto_93511 ) ) ( not ( = ?auto_93505 ?auto_93511 ) ) ( not ( = ?auto_93502 ?auto_93511 ) ) ( TRUCK-AT ?auto_93509 ?auto_93507 ) ( SURFACE-AT ?auto_93502 ?auto_93507 ) ( CLEAR ?auto_93502 ) ( IS-CRATE ?auto_93504 ) ( AVAILABLE ?auto_93510 ) ( IN ?auto_93504 ?auto_93509 ) ( ON ?auto_93500 ?auto_93499 ) ( ON ?auto_93501 ?auto_93500 ) ( ON ?auto_93503 ?auto_93501 ) ( ON ?auto_93502 ?auto_93503 ) ( not ( = ?auto_93499 ?auto_93500 ) ) ( not ( = ?auto_93499 ?auto_93501 ) ) ( not ( = ?auto_93499 ?auto_93503 ) ) ( not ( = ?auto_93499 ?auto_93502 ) ) ( not ( = ?auto_93499 ?auto_93504 ) ) ( not ( = ?auto_93499 ?auto_93505 ) ) ( not ( = ?auto_93499 ?auto_93511 ) ) ( not ( = ?auto_93500 ?auto_93501 ) ) ( not ( = ?auto_93500 ?auto_93503 ) ) ( not ( = ?auto_93500 ?auto_93502 ) ) ( not ( = ?auto_93500 ?auto_93504 ) ) ( not ( = ?auto_93500 ?auto_93505 ) ) ( not ( = ?auto_93500 ?auto_93511 ) ) ( not ( = ?auto_93501 ?auto_93503 ) ) ( not ( = ?auto_93501 ?auto_93502 ) ) ( not ( = ?auto_93501 ?auto_93504 ) ) ( not ( = ?auto_93501 ?auto_93505 ) ) ( not ( = ?auto_93501 ?auto_93511 ) ) ( not ( = ?auto_93503 ?auto_93502 ) ) ( not ( = ?auto_93503 ?auto_93504 ) ) ( not ( = ?auto_93503 ?auto_93505 ) ) ( not ( = ?auto_93503 ?auto_93511 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_93502 ?auto_93504 ?auto_93505 )
      ( MAKE-6CRATE-VERIFY ?auto_93499 ?auto_93500 ?auto_93501 ?auto_93503 ?auto_93502 ?auto_93504 ?auto_93505 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95455 - SURFACE
      ?auto_95456 - SURFACE
      ?auto_95457 - SURFACE
      ?auto_95459 - SURFACE
      ?auto_95458 - SURFACE
      ?auto_95460 - SURFACE
      ?auto_95461 - SURFACE
      ?auto_95462 - SURFACE
    )
    :vars
    (
      ?auto_95464 - HOIST
      ?auto_95463 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95464 ?auto_95463 ) ( SURFACE-AT ?auto_95461 ?auto_95463 ) ( CLEAR ?auto_95461 ) ( LIFTING ?auto_95464 ?auto_95462 ) ( IS-CRATE ?auto_95462 ) ( not ( = ?auto_95461 ?auto_95462 ) ) ( ON ?auto_95456 ?auto_95455 ) ( ON ?auto_95457 ?auto_95456 ) ( ON ?auto_95459 ?auto_95457 ) ( ON ?auto_95458 ?auto_95459 ) ( ON ?auto_95460 ?auto_95458 ) ( ON ?auto_95461 ?auto_95460 ) ( not ( = ?auto_95455 ?auto_95456 ) ) ( not ( = ?auto_95455 ?auto_95457 ) ) ( not ( = ?auto_95455 ?auto_95459 ) ) ( not ( = ?auto_95455 ?auto_95458 ) ) ( not ( = ?auto_95455 ?auto_95460 ) ) ( not ( = ?auto_95455 ?auto_95461 ) ) ( not ( = ?auto_95455 ?auto_95462 ) ) ( not ( = ?auto_95456 ?auto_95457 ) ) ( not ( = ?auto_95456 ?auto_95459 ) ) ( not ( = ?auto_95456 ?auto_95458 ) ) ( not ( = ?auto_95456 ?auto_95460 ) ) ( not ( = ?auto_95456 ?auto_95461 ) ) ( not ( = ?auto_95456 ?auto_95462 ) ) ( not ( = ?auto_95457 ?auto_95459 ) ) ( not ( = ?auto_95457 ?auto_95458 ) ) ( not ( = ?auto_95457 ?auto_95460 ) ) ( not ( = ?auto_95457 ?auto_95461 ) ) ( not ( = ?auto_95457 ?auto_95462 ) ) ( not ( = ?auto_95459 ?auto_95458 ) ) ( not ( = ?auto_95459 ?auto_95460 ) ) ( not ( = ?auto_95459 ?auto_95461 ) ) ( not ( = ?auto_95459 ?auto_95462 ) ) ( not ( = ?auto_95458 ?auto_95460 ) ) ( not ( = ?auto_95458 ?auto_95461 ) ) ( not ( = ?auto_95458 ?auto_95462 ) ) ( not ( = ?auto_95460 ?auto_95461 ) ) ( not ( = ?auto_95460 ?auto_95462 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_95461 ?auto_95462 )
      ( MAKE-7CRATE-VERIFY ?auto_95455 ?auto_95456 ?auto_95457 ?auto_95459 ?auto_95458 ?auto_95460 ?auto_95461 ?auto_95462 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95510 - SURFACE
      ?auto_95511 - SURFACE
      ?auto_95512 - SURFACE
      ?auto_95514 - SURFACE
      ?auto_95513 - SURFACE
      ?auto_95515 - SURFACE
      ?auto_95516 - SURFACE
      ?auto_95517 - SURFACE
    )
    :vars
    (
      ?auto_95520 - HOIST
      ?auto_95519 - PLACE
      ?auto_95518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_95520 ?auto_95519 ) ( SURFACE-AT ?auto_95516 ?auto_95519 ) ( CLEAR ?auto_95516 ) ( IS-CRATE ?auto_95517 ) ( not ( = ?auto_95516 ?auto_95517 ) ) ( TRUCK-AT ?auto_95518 ?auto_95519 ) ( AVAILABLE ?auto_95520 ) ( IN ?auto_95517 ?auto_95518 ) ( ON ?auto_95516 ?auto_95515 ) ( not ( = ?auto_95515 ?auto_95516 ) ) ( not ( = ?auto_95515 ?auto_95517 ) ) ( ON ?auto_95511 ?auto_95510 ) ( ON ?auto_95512 ?auto_95511 ) ( ON ?auto_95514 ?auto_95512 ) ( ON ?auto_95513 ?auto_95514 ) ( ON ?auto_95515 ?auto_95513 ) ( not ( = ?auto_95510 ?auto_95511 ) ) ( not ( = ?auto_95510 ?auto_95512 ) ) ( not ( = ?auto_95510 ?auto_95514 ) ) ( not ( = ?auto_95510 ?auto_95513 ) ) ( not ( = ?auto_95510 ?auto_95515 ) ) ( not ( = ?auto_95510 ?auto_95516 ) ) ( not ( = ?auto_95510 ?auto_95517 ) ) ( not ( = ?auto_95511 ?auto_95512 ) ) ( not ( = ?auto_95511 ?auto_95514 ) ) ( not ( = ?auto_95511 ?auto_95513 ) ) ( not ( = ?auto_95511 ?auto_95515 ) ) ( not ( = ?auto_95511 ?auto_95516 ) ) ( not ( = ?auto_95511 ?auto_95517 ) ) ( not ( = ?auto_95512 ?auto_95514 ) ) ( not ( = ?auto_95512 ?auto_95513 ) ) ( not ( = ?auto_95512 ?auto_95515 ) ) ( not ( = ?auto_95512 ?auto_95516 ) ) ( not ( = ?auto_95512 ?auto_95517 ) ) ( not ( = ?auto_95514 ?auto_95513 ) ) ( not ( = ?auto_95514 ?auto_95515 ) ) ( not ( = ?auto_95514 ?auto_95516 ) ) ( not ( = ?auto_95514 ?auto_95517 ) ) ( not ( = ?auto_95513 ?auto_95515 ) ) ( not ( = ?auto_95513 ?auto_95516 ) ) ( not ( = ?auto_95513 ?auto_95517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95515 ?auto_95516 ?auto_95517 )
      ( MAKE-7CRATE-VERIFY ?auto_95510 ?auto_95511 ?auto_95512 ?auto_95514 ?auto_95513 ?auto_95515 ?auto_95516 ?auto_95517 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95573 - SURFACE
      ?auto_95574 - SURFACE
      ?auto_95575 - SURFACE
      ?auto_95577 - SURFACE
      ?auto_95576 - SURFACE
      ?auto_95578 - SURFACE
      ?auto_95579 - SURFACE
      ?auto_95580 - SURFACE
    )
    :vars
    (
      ?auto_95581 - HOIST
      ?auto_95583 - PLACE
      ?auto_95584 - TRUCK
      ?auto_95582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95581 ?auto_95583 ) ( SURFACE-AT ?auto_95579 ?auto_95583 ) ( CLEAR ?auto_95579 ) ( IS-CRATE ?auto_95580 ) ( not ( = ?auto_95579 ?auto_95580 ) ) ( AVAILABLE ?auto_95581 ) ( IN ?auto_95580 ?auto_95584 ) ( ON ?auto_95579 ?auto_95578 ) ( not ( = ?auto_95578 ?auto_95579 ) ) ( not ( = ?auto_95578 ?auto_95580 ) ) ( TRUCK-AT ?auto_95584 ?auto_95582 ) ( not ( = ?auto_95582 ?auto_95583 ) ) ( ON ?auto_95574 ?auto_95573 ) ( ON ?auto_95575 ?auto_95574 ) ( ON ?auto_95577 ?auto_95575 ) ( ON ?auto_95576 ?auto_95577 ) ( ON ?auto_95578 ?auto_95576 ) ( not ( = ?auto_95573 ?auto_95574 ) ) ( not ( = ?auto_95573 ?auto_95575 ) ) ( not ( = ?auto_95573 ?auto_95577 ) ) ( not ( = ?auto_95573 ?auto_95576 ) ) ( not ( = ?auto_95573 ?auto_95578 ) ) ( not ( = ?auto_95573 ?auto_95579 ) ) ( not ( = ?auto_95573 ?auto_95580 ) ) ( not ( = ?auto_95574 ?auto_95575 ) ) ( not ( = ?auto_95574 ?auto_95577 ) ) ( not ( = ?auto_95574 ?auto_95576 ) ) ( not ( = ?auto_95574 ?auto_95578 ) ) ( not ( = ?auto_95574 ?auto_95579 ) ) ( not ( = ?auto_95574 ?auto_95580 ) ) ( not ( = ?auto_95575 ?auto_95577 ) ) ( not ( = ?auto_95575 ?auto_95576 ) ) ( not ( = ?auto_95575 ?auto_95578 ) ) ( not ( = ?auto_95575 ?auto_95579 ) ) ( not ( = ?auto_95575 ?auto_95580 ) ) ( not ( = ?auto_95577 ?auto_95576 ) ) ( not ( = ?auto_95577 ?auto_95578 ) ) ( not ( = ?auto_95577 ?auto_95579 ) ) ( not ( = ?auto_95577 ?auto_95580 ) ) ( not ( = ?auto_95576 ?auto_95578 ) ) ( not ( = ?auto_95576 ?auto_95579 ) ) ( not ( = ?auto_95576 ?auto_95580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95578 ?auto_95579 ?auto_95580 )
      ( MAKE-7CRATE-VERIFY ?auto_95573 ?auto_95574 ?auto_95575 ?auto_95577 ?auto_95576 ?auto_95578 ?auto_95579 ?auto_95580 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95643 - SURFACE
      ?auto_95644 - SURFACE
      ?auto_95645 - SURFACE
      ?auto_95647 - SURFACE
      ?auto_95646 - SURFACE
      ?auto_95648 - SURFACE
      ?auto_95649 - SURFACE
      ?auto_95650 - SURFACE
    )
    :vars
    (
      ?auto_95651 - HOIST
      ?auto_95654 - PLACE
      ?auto_95652 - TRUCK
      ?auto_95655 - PLACE
      ?auto_95653 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_95651 ?auto_95654 ) ( SURFACE-AT ?auto_95649 ?auto_95654 ) ( CLEAR ?auto_95649 ) ( IS-CRATE ?auto_95650 ) ( not ( = ?auto_95649 ?auto_95650 ) ) ( AVAILABLE ?auto_95651 ) ( ON ?auto_95649 ?auto_95648 ) ( not ( = ?auto_95648 ?auto_95649 ) ) ( not ( = ?auto_95648 ?auto_95650 ) ) ( TRUCK-AT ?auto_95652 ?auto_95655 ) ( not ( = ?auto_95655 ?auto_95654 ) ) ( HOIST-AT ?auto_95653 ?auto_95655 ) ( LIFTING ?auto_95653 ?auto_95650 ) ( not ( = ?auto_95651 ?auto_95653 ) ) ( ON ?auto_95644 ?auto_95643 ) ( ON ?auto_95645 ?auto_95644 ) ( ON ?auto_95647 ?auto_95645 ) ( ON ?auto_95646 ?auto_95647 ) ( ON ?auto_95648 ?auto_95646 ) ( not ( = ?auto_95643 ?auto_95644 ) ) ( not ( = ?auto_95643 ?auto_95645 ) ) ( not ( = ?auto_95643 ?auto_95647 ) ) ( not ( = ?auto_95643 ?auto_95646 ) ) ( not ( = ?auto_95643 ?auto_95648 ) ) ( not ( = ?auto_95643 ?auto_95649 ) ) ( not ( = ?auto_95643 ?auto_95650 ) ) ( not ( = ?auto_95644 ?auto_95645 ) ) ( not ( = ?auto_95644 ?auto_95647 ) ) ( not ( = ?auto_95644 ?auto_95646 ) ) ( not ( = ?auto_95644 ?auto_95648 ) ) ( not ( = ?auto_95644 ?auto_95649 ) ) ( not ( = ?auto_95644 ?auto_95650 ) ) ( not ( = ?auto_95645 ?auto_95647 ) ) ( not ( = ?auto_95645 ?auto_95646 ) ) ( not ( = ?auto_95645 ?auto_95648 ) ) ( not ( = ?auto_95645 ?auto_95649 ) ) ( not ( = ?auto_95645 ?auto_95650 ) ) ( not ( = ?auto_95647 ?auto_95646 ) ) ( not ( = ?auto_95647 ?auto_95648 ) ) ( not ( = ?auto_95647 ?auto_95649 ) ) ( not ( = ?auto_95647 ?auto_95650 ) ) ( not ( = ?auto_95646 ?auto_95648 ) ) ( not ( = ?auto_95646 ?auto_95649 ) ) ( not ( = ?auto_95646 ?auto_95650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95648 ?auto_95649 ?auto_95650 )
      ( MAKE-7CRATE-VERIFY ?auto_95643 ?auto_95644 ?auto_95645 ?auto_95647 ?auto_95646 ?auto_95648 ?auto_95649 ?auto_95650 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95720 - SURFACE
      ?auto_95721 - SURFACE
      ?auto_95722 - SURFACE
      ?auto_95724 - SURFACE
      ?auto_95723 - SURFACE
      ?auto_95725 - SURFACE
      ?auto_95726 - SURFACE
      ?auto_95727 - SURFACE
    )
    :vars
    (
      ?auto_95731 - HOIST
      ?auto_95728 - PLACE
      ?auto_95733 - TRUCK
      ?auto_95729 - PLACE
      ?auto_95732 - HOIST
      ?auto_95730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_95731 ?auto_95728 ) ( SURFACE-AT ?auto_95726 ?auto_95728 ) ( CLEAR ?auto_95726 ) ( IS-CRATE ?auto_95727 ) ( not ( = ?auto_95726 ?auto_95727 ) ) ( AVAILABLE ?auto_95731 ) ( ON ?auto_95726 ?auto_95725 ) ( not ( = ?auto_95725 ?auto_95726 ) ) ( not ( = ?auto_95725 ?auto_95727 ) ) ( TRUCK-AT ?auto_95733 ?auto_95729 ) ( not ( = ?auto_95729 ?auto_95728 ) ) ( HOIST-AT ?auto_95732 ?auto_95729 ) ( not ( = ?auto_95731 ?auto_95732 ) ) ( AVAILABLE ?auto_95732 ) ( SURFACE-AT ?auto_95727 ?auto_95729 ) ( ON ?auto_95727 ?auto_95730 ) ( CLEAR ?auto_95727 ) ( not ( = ?auto_95726 ?auto_95730 ) ) ( not ( = ?auto_95727 ?auto_95730 ) ) ( not ( = ?auto_95725 ?auto_95730 ) ) ( ON ?auto_95721 ?auto_95720 ) ( ON ?auto_95722 ?auto_95721 ) ( ON ?auto_95724 ?auto_95722 ) ( ON ?auto_95723 ?auto_95724 ) ( ON ?auto_95725 ?auto_95723 ) ( not ( = ?auto_95720 ?auto_95721 ) ) ( not ( = ?auto_95720 ?auto_95722 ) ) ( not ( = ?auto_95720 ?auto_95724 ) ) ( not ( = ?auto_95720 ?auto_95723 ) ) ( not ( = ?auto_95720 ?auto_95725 ) ) ( not ( = ?auto_95720 ?auto_95726 ) ) ( not ( = ?auto_95720 ?auto_95727 ) ) ( not ( = ?auto_95720 ?auto_95730 ) ) ( not ( = ?auto_95721 ?auto_95722 ) ) ( not ( = ?auto_95721 ?auto_95724 ) ) ( not ( = ?auto_95721 ?auto_95723 ) ) ( not ( = ?auto_95721 ?auto_95725 ) ) ( not ( = ?auto_95721 ?auto_95726 ) ) ( not ( = ?auto_95721 ?auto_95727 ) ) ( not ( = ?auto_95721 ?auto_95730 ) ) ( not ( = ?auto_95722 ?auto_95724 ) ) ( not ( = ?auto_95722 ?auto_95723 ) ) ( not ( = ?auto_95722 ?auto_95725 ) ) ( not ( = ?auto_95722 ?auto_95726 ) ) ( not ( = ?auto_95722 ?auto_95727 ) ) ( not ( = ?auto_95722 ?auto_95730 ) ) ( not ( = ?auto_95724 ?auto_95723 ) ) ( not ( = ?auto_95724 ?auto_95725 ) ) ( not ( = ?auto_95724 ?auto_95726 ) ) ( not ( = ?auto_95724 ?auto_95727 ) ) ( not ( = ?auto_95724 ?auto_95730 ) ) ( not ( = ?auto_95723 ?auto_95725 ) ) ( not ( = ?auto_95723 ?auto_95726 ) ) ( not ( = ?auto_95723 ?auto_95727 ) ) ( not ( = ?auto_95723 ?auto_95730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95725 ?auto_95726 ?auto_95727 )
      ( MAKE-7CRATE-VERIFY ?auto_95720 ?auto_95721 ?auto_95722 ?auto_95724 ?auto_95723 ?auto_95725 ?auto_95726 ?auto_95727 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95798 - SURFACE
      ?auto_95799 - SURFACE
      ?auto_95800 - SURFACE
      ?auto_95802 - SURFACE
      ?auto_95801 - SURFACE
      ?auto_95803 - SURFACE
      ?auto_95804 - SURFACE
      ?auto_95805 - SURFACE
    )
    :vars
    (
      ?auto_95808 - HOIST
      ?auto_95809 - PLACE
      ?auto_95807 - PLACE
      ?auto_95810 - HOIST
      ?auto_95811 - SURFACE
      ?auto_95806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_95808 ?auto_95809 ) ( SURFACE-AT ?auto_95804 ?auto_95809 ) ( CLEAR ?auto_95804 ) ( IS-CRATE ?auto_95805 ) ( not ( = ?auto_95804 ?auto_95805 ) ) ( AVAILABLE ?auto_95808 ) ( ON ?auto_95804 ?auto_95803 ) ( not ( = ?auto_95803 ?auto_95804 ) ) ( not ( = ?auto_95803 ?auto_95805 ) ) ( not ( = ?auto_95807 ?auto_95809 ) ) ( HOIST-AT ?auto_95810 ?auto_95807 ) ( not ( = ?auto_95808 ?auto_95810 ) ) ( AVAILABLE ?auto_95810 ) ( SURFACE-AT ?auto_95805 ?auto_95807 ) ( ON ?auto_95805 ?auto_95811 ) ( CLEAR ?auto_95805 ) ( not ( = ?auto_95804 ?auto_95811 ) ) ( not ( = ?auto_95805 ?auto_95811 ) ) ( not ( = ?auto_95803 ?auto_95811 ) ) ( TRUCK-AT ?auto_95806 ?auto_95809 ) ( ON ?auto_95799 ?auto_95798 ) ( ON ?auto_95800 ?auto_95799 ) ( ON ?auto_95802 ?auto_95800 ) ( ON ?auto_95801 ?auto_95802 ) ( ON ?auto_95803 ?auto_95801 ) ( not ( = ?auto_95798 ?auto_95799 ) ) ( not ( = ?auto_95798 ?auto_95800 ) ) ( not ( = ?auto_95798 ?auto_95802 ) ) ( not ( = ?auto_95798 ?auto_95801 ) ) ( not ( = ?auto_95798 ?auto_95803 ) ) ( not ( = ?auto_95798 ?auto_95804 ) ) ( not ( = ?auto_95798 ?auto_95805 ) ) ( not ( = ?auto_95798 ?auto_95811 ) ) ( not ( = ?auto_95799 ?auto_95800 ) ) ( not ( = ?auto_95799 ?auto_95802 ) ) ( not ( = ?auto_95799 ?auto_95801 ) ) ( not ( = ?auto_95799 ?auto_95803 ) ) ( not ( = ?auto_95799 ?auto_95804 ) ) ( not ( = ?auto_95799 ?auto_95805 ) ) ( not ( = ?auto_95799 ?auto_95811 ) ) ( not ( = ?auto_95800 ?auto_95802 ) ) ( not ( = ?auto_95800 ?auto_95801 ) ) ( not ( = ?auto_95800 ?auto_95803 ) ) ( not ( = ?auto_95800 ?auto_95804 ) ) ( not ( = ?auto_95800 ?auto_95805 ) ) ( not ( = ?auto_95800 ?auto_95811 ) ) ( not ( = ?auto_95802 ?auto_95801 ) ) ( not ( = ?auto_95802 ?auto_95803 ) ) ( not ( = ?auto_95802 ?auto_95804 ) ) ( not ( = ?auto_95802 ?auto_95805 ) ) ( not ( = ?auto_95802 ?auto_95811 ) ) ( not ( = ?auto_95801 ?auto_95803 ) ) ( not ( = ?auto_95801 ?auto_95804 ) ) ( not ( = ?auto_95801 ?auto_95805 ) ) ( not ( = ?auto_95801 ?auto_95811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95803 ?auto_95804 ?auto_95805 )
      ( MAKE-7CRATE-VERIFY ?auto_95798 ?auto_95799 ?auto_95800 ?auto_95802 ?auto_95801 ?auto_95803 ?auto_95804 ?auto_95805 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95876 - SURFACE
      ?auto_95877 - SURFACE
      ?auto_95878 - SURFACE
      ?auto_95880 - SURFACE
      ?auto_95879 - SURFACE
      ?auto_95881 - SURFACE
      ?auto_95882 - SURFACE
      ?auto_95883 - SURFACE
    )
    :vars
    (
      ?auto_95887 - HOIST
      ?auto_95886 - PLACE
      ?auto_95885 - PLACE
      ?auto_95889 - HOIST
      ?auto_95888 - SURFACE
      ?auto_95884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_95887 ?auto_95886 ) ( IS-CRATE ?auto_95883 ) ( not ( = ?auto_95882 ?auto_95883 ) ) ( not ( = ?auto_95881 ?auto_95882 ) ) ( not ( = ?auto_95881 ?auto_95883 ) ) ( not ( = ?auto_95885 ?auto_95886 ) ) ( HOIST-AT ?auto_95889 ?auto_95885 ) ( not ( = ?auto_95887 ?auto_95889 ) ) ( AVAILABLE ?auto_95889 ) ( SURFACE-AT ?auto_95883 ?auto_95885 ) ( ON ?auto_95883 ?auto_95888 ) ( CLEAR ?auto_95883 ) ( not ( = ?auto_95882 ?auto_95888 ) ) ( not ( = ?auto_95883 ?auto_95888 ) ) ( not ( = ?auto_95881 ?auto_95888 ) ) ( TRUCK-AT ?auto_95884 ?auto_95886 ) ( SURFACE-AT ?auto_95881 ?auto_95886 ) ( CLEAR ?auto_95881 ) ( LIFTING ?auto_95887 ?auto_95882 ) ( IS-CRATE ?auto_95882 ) ( ON ?auto_95877 ?auto_95876 ) ( ON ?auto_95878 ?auto_95877 ) ( ON ?auto_95880 ?auto_95878 ) ( ON ?auto_95879 ?auto_95880 ) ( ON ?auto_95881 ?auto_95879 ) ( not ( = ?auto_95876 ?auto_95877 ) ) ( not ( = ?auto_95876 ?auto_95878 ) ) ( not ( = ?auto_95876 ?auto_95880 ) ) ( not ( = ?auto_95876 ?auto_95879 ) ) ( not ( = ?auto_95876 ?auto_95881 ) ) ( not ( = ?auto_95876 ?auto_95882 ) ) ( not ( = ?auto_95876 ?auto_95883 ) ) ( not ( = ?auto_95876 ?auto_95888 ) ) ( not ( = ?auto_95877 ?auto_95878 ) ) ( not ( = ?auto_95877 ?auto_95880 ) ) ( not ( = ?auto_95877 ?auto_95879 ) ) ( not ( = ?auto_95877 ?auto_95881 ) ) ( not ( = ?auto_95877 ?auto_95882 ) ) ( not ( = ?auto_95877 ?auto_95883 ) ) ( not ( = ?auto_95877 ?auto_95888 ) ) ( not ( = ?auto_95878 ?auto_95880 ) ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95881 ) ) ( not ( = ?auto_95878 ?auto_95882 ) ) ( not ( = ?auto_95878 ?auto_95883 ) ) ( not ( = ?auto_95878 ?auto_95888 ) ) ( not ( = ?auto_95880 ?auto_95879 ) ) ( not ( = ?auto_95880 ?auto_95881 ) ) ( not ( = ?auto_95880 ?auto_95882 ) ) ( not ( = ?auto_95880 ?auto_95883 ) ) ( not ( = ?auto_95880 ?auto_95888 ) ) ( not ( = ?auto_95879 ?auto_95881 ) ) ( not ( = ?auto_95879 ?auto_95882 ) ) ( not ( = ?auto_95879 ?auto_95883 ) ) ( not ( = ?auto_95879 ?auto_95888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95881 ?auto_95882 ?auto_95883 )
      ( MAKE-7CRATE-VERIFY ?auto_95876 ?auto_95877 ?auto_95878 ?auto_95880 ?auto_95879 ?auto_95881 ?auto_95882 ?auto_95883 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_95954 - SURFACE
      ?auto_95955 - SURFACE
      ?auto_95956 - SURFACE
      ?auto_95958 - SURFACE
      ?auto_95957 - SURFACE
      ?auto_95959 - SURFACE
      ?auto_95960 - SURFACE
      ?auto_95961 - SURFACE
    )
    :vars
    (
      ?auto_95965 - HOIST
      ?auto_95963 - PLACE
      ?auto_95967 - PLACE
      ?auto_95962 - HOIST
      ?auto_95966 - SURFACE
      ?auto_95964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_95965 ?auto_95963 ) ( IS-CRATE ?auto_95961 ) ( not ( = ?auto_95960 ?auto_95961 ) ) ( not ( = ?auto_95959 ?auto_95960 ) ) ( not ( = ?auto_95959 ?auto_95961 ) ) ( not ( = ?auto_95967 ?auto_95963 ) ) ( HOIST-AT ?auto_95962 ?auto_95967 ) ( not ( = ?auto_95965 ?auto_95962 ) ) ( AVAILABLE ?auto_95962 ) ( SURFACE-AT ?auto_95961 ?auto_95967 ) ( ON ?auto_95961 ?auto_95966 ) ( CLEAR ?auto_95961 ) ( not ( = ?auto_95960 ?auto_95966 ) ) ( not ( = ?auto_95961 ?auto_95966 ) ) ( not ( = ?auto_95959 ?auto_95966 ) ) ( TRUCK-AT ?auto_95964 ?auto_95963 ) ( SURFACE-AT ?auto_95959 ?auto_95963 ) ( CLEAR ?auto_95959 ) ( IS-CRATE ?auto_95960 ) ( AVAILABLE ?auto_95965 ) ( IN ?auto_95960 ?auto_95964 ) ( ON ?auto_95955 ?auto_95954 ) ( ON ?auto_95956 ?auto_95955 ) ( ON ?auto_95958 ?auto_95956 ) ( ON ?auto_95957 ?auto_95958 ) ( ON ?auto_95959 ?auto_95957 ) ( not ( = ?auto_95954 ?auto_95955 ) ) ( not ( = ?auto_95954 ?auto_95956 ) ) ( not ( = ?auto_95954 ?auto_95958 ) ) ( not ( = ?auto_95954 ?auto_95957 ) ) ( not ( = ?auto_95954 ?auto_95959 ) ) ( not ( = ?auto_95954 ?auto_95960 ) ) ( not ( = ?auto_95954 ?auto_95961 ) ) ( not ( = ?auto_95954 ?auto_95966 ) ) ( not ( = ?auto_95955 ?auto_95956 ) ) ( not ( = ?auto_95955 ?auto_95958 ) ) ( not ( = ?auto_95955 ?auto_95957 ) ) ( not ( = ?auto_95955 ?auto_95959 ) ) ( not ( = ?auto_95955 ?auto_95960 ) ) ( not ( = ?auto_95955 ?auto_95961 ) ) ( not ( = ?auto_95955 ?auto_95966 ) ) ( not ( = ?auto_95956 ?auto_95958 ) ) ( not ( = ?auto_95956 ?auto_95957 ) ) ( not ( = ?auto_95956 ?auto_95959 ) ) ( not ( = ?auto_95956 ?auto_95960 ) ) ( not ( = ?auto_95956 ?auto_95961 ) ) ( not ( = ?auto_95956 ?auto_95966 ) ) ( not ( = ?auto_95958 ?auto_95957 ) ) ( not ( = ?auto_95958 ?auto_95959 ) ) ( not ( = ?auto_95958 ?auto_95960 ) ) ( not ( = ?auto_95958 ?auto_95961 ) ) ( not ( = ?auto_95958 ?auto_95966 ) ) ( not ( = ?auto_95957 ?auto_95959 ) ) ( not ( = ?auto_95957 ?auto_95960 ) ) ( not ( = ?auto_95957 ?auto_95961 ) ) ( not ( = ?auto_95957 ?auto_95966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_95959 ?auto_95960 ?auto_95961 )
      ( MAKE-7CRATE-VERIFY ?auto_95954 ?auto_95955 ?auto_95956 ?auto_95958 ?auto_95957 ?auto_95959 ?auto_95960 ?auto_95961 ) )
  )

)

