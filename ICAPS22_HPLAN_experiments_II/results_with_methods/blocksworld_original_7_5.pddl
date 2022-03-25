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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90017 - BLOCK
      ?auto_90018 - BLOCK
      ?auto_90019 - BLOCK
      ?auto_90020 - BLOCK
      ?auto_90021 - BLOCK
      ?auto_90022 - BLOCK
      ?auto_90023 - BLOCK
    )
    :vars
    (
      ?auto_90024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90024 ?auto_90023 ) ( CLEAR ?auto_90024 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90017 ) ( ON ?auto_90018 ?auto_90017 ) ( ON ?auto_90019 ?auto_90018 ) ( ON ?auto_90020 ?auto_90019 ) ( ON ?auto_90021 ?auto_90020 ) ( ON ?auto_90022 ?auto_90021 ) ( ON ?auto_90023 ?auto_90022 ) ( not ( = ?auto_90017 ?auto_90018 ) ) ( not ( = ?auto_90017 ?auto_90019 ) ) ( not ( = ?auto_90017 ?auto_90020 ) ) ( not ( = ?auto_90017 ?auto_90021 ) ) ( not ( = ?auto_90017 ?auto_90022 ) ) ( not ( = ?auto_90017 ?auto_90023 ) ) ( not ( = ?auto_90017 ?auto_90024 ) ) ( not ( = ?auto_90018 ?auto_90019 ) ) ( not ( = ?auto_90018 ?auto_90020 ) ) ( not ( = ?auto_90018 ?auto_90021 ) ) ( not ( = ?auto_90018 ?auto_90022 ) ) ( not ( = ?auto_90018 ?auto_90023 ) ) ( not ( = ?auto_90018 ?auto_90024 ) ) ( not ( = ?auto_90019 ?auto_90020 ) ) ( not ( = ?auto_90019 ?auto_90021 ) ) ( not ( = ?auto_90019 ?auto_90022 ) ) ( not ( = ?auto_90019 ?auto_90023 ) ) ( not ( = ?auto_90019 ?auto_90024 ) ) ( not ( = ?auto_90020 ?auto_90021 ) ) ( not ( = ?auto_90020 ?auto_90022 ) ) ( not ( = ?auto_90020 ?auto_90023 ) ) ( not ( = ?auto_90020 ?auto_90024 ) ) ( not ( = ?auto_90021 ?auto_90022 ) ) ( not ( = ?auto_90021 ?auto_90023 ) ) ( not ( = ?auto_90021 ?auto_90024 ) ) ( not ( = ?auto_90022 ?auto_90023 ) ) ( not ( = ?auto_90022 ?auto_90024 ) ) ( not ( = ?auto_90023 ?auto_90024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90024 ?auto_90023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90026 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90026 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_90026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90027 - BLOCK
    )
    :vars
    (
      ?auto_90028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90027 ?auto_90028 ) ( CLEAR ?auto_90027 ) ( HAND-EMPTY ) ( not ( = ?auto_90027 ?auto_90028 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90027 ?auto_90028 )
      ( MAKE-1PILE ?auto_90027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90035 - BLOCK
      ?auto_90036 - BLOCK
      ?auto_90037 - BLOCK
      ?auto_90038 - BLOCK
      ?auto_90039 - BLOCK
      ?auto_90040 - BLOCK
    )
    :vars
    (
      ?auto_90041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90041 ?auto_90040 ) ( CLEAR ?auto_90041 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90035 ) ( ON ?auto_90036 ?auto_90035 ) ( ON ?auto_90037 ?auto_90036 ) ( ON ?auto_90038 ?auto_90037 ) ( ON ?auto_90039 ?auto_90038 ) ( ON ?auto_90040 ?auto_90039 ) ( not ( = ?auto_90035 ?auto_90036 ) ) ( not ( = ?auto_90035 ?auto_90037 ) ) ( not ( = ?auto_90035 ?auto_90038 ) ) ( not ( = ?auto_90035 ?auto_90039 ) ) ( not ( = ?auto_90035 ?auto_90040 ) ) ( not ( = ?auto_90035 ?auto_90041 ) ) ( not ( = ?auto_90036 ?auto_90037 ) ) ( not ( = ?auto_90036 ?auto_90038 ) ) ( not ( = ?auto_90036 ?auto_90039 ) ) ( not ( = ?auto_90036 ?auto_90040 ) ) ( not ( = ?auto_90036 ?auto_90041 ) ) ( not ( = ?auto_90037 ?auto_90038 ) ) ( not ( = ?auto_90037 ?auto_90039 ) ) ( not ( = ?auto_90037 ?auto_90040 ) ) ( not ( = ?auto_90037 ?auto_90041 ) ) ( not ( = ?auto_90038 ?auto_90039 ) ) ( not ( = ?auto_90038 ?auto_90040 ) ) ( not ( = ?auto_90038 ?auto_90041 ) ) ( not ( = ?auto_90039 ?auto_90040 ) ) ( not ( = ?auto_90039 ?auto_90041 ) ) ( not ( = ?auto_90040 ?auto_90041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90041 ?auto_90040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90042 - BLOCK
      ?auto_90043 - BLOCK
      ?auto_90044 - BLOCK
      ?auto_90045 - BLOCK
      ?auto_90046 - BLOCK
      ?auto_90047 - BLOCK
    )
    :vars
    (
      ?auto_90048 - BLOCK
      ?auto_90049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90048 ?auto_90047 ) ( CLEAR ?auto_90048 ) ( ON-TABLE ?auto_90042 ) ( ON ?auto_90043 ?auto_90042 ) ( ON ?auto_90044 ?auto_90043 ) ( ON ?auto_90045 ?auto_90044 ) ( ON ?auto_90046 ?auto_90045 ) ( ON ?auto_90047 ?auto_90046 ) ( not ( = ?auto_90042 ?auto_90043 ) ) ( not ( = ?auto_90042 ?auto_90044 ) ) ( not ( = ?auto_90042 ?auto_90045 ) ) ( not ( = ?auto_90042 ?auto_90046 ) ) ( not ( = ?auto_90042 ?auto_90047 ) ) ( not ( = ?auto_90042 ?auto_90048 ) ) ( not ( = ?auto_90043 ?auto_90044 ) ) ( not ( = ?auto_90043 ?auto_90045 ) ) ( not ( = ?auto_90043 ?auto_90046 ) ) ( not ( = ?auto_90043 ?auto_90047 ) ) ( not ( = ?auto_90043 ?auto_90048 ) ) ( not ( = ?auto_90044 ?auto_90045 ) ) ( not ( = ?auto_90044 ?auto_90046 ) ) ( not ( = ?auto_90044 ?auto_90047 ) ) ( not ( = ?auto_90044 ?auto_90048 ) ) ( not ( = ?auto_90045 ?auto_90046 ) ) ( not ( = ?auto_90045 ?auto_90047 ) ) ( not ( = ?auto_90045 ?auto_90048 ) ) ( not ( = ?auto_90046 ?auto_90047 ) ) ( not ( = ?auto_90046 ?auto_90048 ) ) ( not ( = ?auto_90047 ?auto_90048 ) ) ( HOLDING ?auto_90049 ) ( not ( = ?auto_90042 ?auto_90049 ) ) ( not ( = ?auto_90043 ?auto_90049 ) ) ( not ( = ?auto_90044 ?auto_90049 ) ) ( not ( = ?auto_90045 ?auto_90049 ) ) ( not ( = ?auto_90046 ?auto_90049 ) ) ( not ( = ?auto_90047 ?auto_90049 ) ) ( not ( = ?auto_90048 ?auto_90049 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_90049 )
      ( MAKE-6PILE ?auto_90042 ?auto_90043 ?auto_90044 ?auto_90045 ?auto_90046 ?auto_90047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90050 - BLOCK
      ?auto_90051 - BLOCK
      ?auto_90052 - BLOCK
      ?auto_90053 - BLOCK
      ?auto_90054 - BLOCK
      ?auto_90055 - BLOCK
    )
    :vars
    (
      ?auto_90057 - BLOCK
      ?auto_90056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90057 ?auto_90055 ) ( ON-TABLE ?auto_90050 ) ( ON ?auto_90051 ?auto_90050 ) ( ON ?auto_90052 ?auto_90051 ) ( ON ?auto_90053 ?auto_90052 ) ( ON ?auto_90054 ?auto_90053 ) ( ON ?auto_90055 ?auto_90054 ) ( not ( = ?auto_90050 ?auto_90051 ) ) ( not ( = ?auto_90050 ?auto_90052 ) ) ( not ( = ?auto_90050 ?auto_90053 ) ) ( not ( = ?auto_90050 ?auto_90054 ) ) ( not ( = ?auto_90050 ?auto_90055 ) ) ( not ( = ?auto_90050 ?auto_90057 ) ) ( not ( = ?auto_90051 ?auto_90052 ) ) ( not ( = ?auto_90051 ?auto_90053 ) ) ( not ( = ?auto_90051 ?auto_90054 ) ) ( not ( = ?auto_90051 ?auto_90055 ) ) ( not ( = ?auto_90051 ?auto_90057 ) ) ( not ( = ?auto_90052 ?auto_90053 ) ) ( not ( = ?auto_90052 ?auto_90054 ) ) ( not ( = ?auto_90052 ?auto_90055 ) ) ( not ( = ?auto_90052 ?auto_90057 ) ) ( not ( = ?auto_90053 ?auto_90054 ) ) ( not ( = ?auto_90053 ?auto_90055 ) ) ( not ( = ?auto_90053 ?auto_90057 ) ) ( not ( = ?auto_90054 ?auto_90055 ) ) ( not ( = ?auto_90054 ?auto_90057 ) ) ( not ( = ?auto_90055 ?auto_90057 ) ) ( not ( = ?auto_90050 ?auto_90056 ) ) ( not ( = ?auto_90051 ?auto_90056 ) ) ( not ( = ?auto_90052 ?auto_90056 ) ) ( not ( = ?auto_90053 ?auto_90056 ) ) ( not ( = ?auto_90054 ?auto_90056 ) ) ( not ( = ?auto_90055 ?auto_90056 ) ) ( not ( = ?auto_90057 ?auto_90056 ) ) ( ON ?auto_90056 ?auto_90057 ) ( CLEAR ?auto_90056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90050 ?auto_90051 ?auto_90052 ?auto_90053 ?auto_90054 ?auto_90055 ?auto_90057 )
      ( MAKE-6PILE ?auto_90050 ?auto_90051 ?auto_90052 ?auto_90053 ?auto_90054 ?auto_90055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90060 - BLOCK
      ?auto_90061 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90061 ) ( CLEAR ?auto_90060 ) ( ON-TABLE ?auto_90060 ) ( not ( = ?auto_90060 ?auto_90061 ) ) )
    :subtasks
    ( ( !STACK ?auto_90061 ?auto_90060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90062 - BLOCK
      ?auto_90063 - BLOCK
    )
    :vars
    (
      ?auto_90064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90062 ) ( ON-TABLE ?auto_90062 ) ( not ( = ?auto_90062 ?auto_90063 ) ) ( ON ?auto_90063 ?auto_90064 ) ( CLEAR ?auto_90063 ) ( HAND-EMPTY ) ( not ( = ?auto_90062 ?auto_90064 ) ) ( not ( = ?auto_90063 ?auto_90064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90063 ?auto_90064 )
      ( MAKE-2PILE ?auto_90062 ?auto_90063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90065 - BLOCK
      ?auto_90066 - BLOCK
    )
    :vars
    (
      ?auto_90067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90065 ?auto_90066 ) ) ( ON ?auto_90066 ?auto_90067 ) ( CLEAR ?auto_90066 ) ( not ( = ?auto_90065 ?auto_90067 ) ) ( not ( = ?auto_90066 ?auto_90067 ) ) ( HOLDING ?auto_90065 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90065 )
      ( MAKE-2PILE ?auto_90065 ?auto_90066 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90068 - BLOCK
      ?auto_90069 - BLOCK
    )
    :vars
    (
      ?auto_90070 - BLOCK
      ?auto_90072 - BLOCK
      ?auto_90075 - BLOCK
      ?auto_90071 - BLOCK
      ?auto_90074 - BLOCK
      ?auto_90073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90068 ?auto_90069 ) ) ( ON ?auto_90069 ?auto_90070 ) ( not ( = ?auto_90068 ?auto_90070 ) ) ( not ( = ?auto_90069 ?auto_90070 ) ) ( ON ?auto_90068 ?auto_90069 ) ( CLEAR ?auto_90068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90072 ) ( ON ?auto_90075 ?auto_90072 ) ( ON ?auto_90071 ?auto_90075 ) ( ON ?auto_90074 ?auto_90071 ) ( ON ?auto_90073 ?auto_90074 ) ( ON ?auto_90070 ?auto_90073 ) ( not ( = ?auto_90072 ?auto_90075 ) ) ( not ( = ?auto_90072 ?auto_90071 ) ) ( not ( = ?auto_90072 ?auto_90074 ) ) ( not ( = ?auto_90072 ?auto_90073 ) ) ( not ( = ?auto_90072 ?auto_90070 ) ) ( not ( = ?auto_90072 ?auto_90069 ) ) ( not ( = ?auto_90072 ?auto_90068 ) ) ( not ( = ?auto_90075 ?auto_90071 ) ) ( not ( = ?auto_90075 ?auto_90074 ) ) ( not ( = ?auto_90075 ?auto_90073 ) ) ( not ( = ?auto_90075 ?auto_90070 ) ) ( not ( = ?auto_90075 ?auto_90069 ) ) ( not ( = ?auto_90075 ?auto_90068 ) ) ( not ( = ?auto_90071 ?auto_90074 ) ) ( not ( = ?auto_90071 ?auto_90073 ) ) ( not ( = ?auto_90071 ?auto_90070 ) ) ( not ( = ?auto_90071 ?auto_90069 ) ) ( not ( = ?auto_90071 ?auto_90068 ) ) ( not ( = ?auto_90074 ?auto_90073 ) ) ( not ( = ?auto_90074 ?auto_90070 ) ) ( not ( = ?auto_90074 ?auto_90069 ) ) ( not ( = ?auto_90074 ?auto_90068 ) ) ( not ( = ?auto_90073 ?auto_90070 ) ) ( not ( = ?auto_90073 ?auto_90069 ) ) ( not ( = ?auto_90073 ?auto_90068 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90072 ?auto_90075 ?auto_90071 ?auto_90074 ?auto_90073 ?auto_90070 ?auto_90069 )
      ( MAKE-2PILE ?auto_90068 ?auto_90069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90081 - BLOCK
      ?auto_90082 - BLOCK
      ?auto_90083 - BLOCK
      ?auto_90084 - BLOCK
      ?auto_90085 - BLOCK
    )
    :vars
    (
      ?auto_90086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90086 ?auto_90085 ) ( CLEAR ?auto_90086 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90081 ) ( ON ?auto_90082 ?auto_90081 ) ( ON ?auto_90083 ?auto_90082 ) ( ON ?auto_90084 ?auto_90083 ) ( ON ?auto_90085 ?auto_90084 ) ( not ( = ?auto_90081 ?auto_90082 ) ) ( not ( = ?auto_90081 ?auto_90083 ) ) ( not ( = ?auto_90081 ?auto_90084 ) ) ( not ( = ?auto_90081 ?auto_90085 ) ) ( not ( = ?auto_90081 ?auto_90086 ) ) ( not ( = ?auto_90082 ?auto_90083 ) ) ( not ( = ?auto_90082 ?auto_90084 ) ) ( not ( = ?auto_90082 ?auto_90085 ) ) ( not ( = ?auto_90082 ?auto_90086 ) ) ( not ( = ?auto_90083 ?auto_90084 ) ) ( not ( = ?auto_90083 ?auto_90085 ) ) ( not ( = ?auto_90083 ?auto_90086 ) ) ( not ( = ?auto_90084 ?auto_90085 ) ) ( not ( = ?auto_90084 ?auto_90086 ) ) ( not ( = ?auto_90085 ?auto_90086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90086 ?auto_90085 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90087 - BLOCK
      ?auto_90088 - BLOCK
      ?auto_90089 - BLOCK
      ?auto_90090 - BLOCK
      ?auto_90091 - BLOCK
    )
    :vars
    (
      ?auto_90092 - BLOCK
      ?auto_90093 - BLOCK
      ?auto_90094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90092 ?auto_90091 ) ( CLEAR ?auto_90092 ) ( ON-TABLE ?auto_90087 ) ( ON ?auto_90088 ?auto_90087 ) ( ON ?auto_90089 ?auto_90088 ) ( ON ?auto_90090 ?auto_90089 ) ( ON ?auto_90091 ?auto_90090 ) ( not ( = ?auto_90087 ?auto_90088 ) ) ( not ( = ?auto_90087 ?auto_90089 ) ) ( not ( = ?auto_90087 ?auto_90090 ) ) ( not ( = ?auto_90087 ?auto_90091 ) ) ( not ( = ?auto_90087 ?auto_90092 ) ) ( not ( = ?auto_90088 ?auto_90089 ) ) ( not ( = ?auto_90088 ?auto_90090 ) ) ( not ( = ?auto_90088 ?auto_90091 ) ) ( not ( = ?auto_90088 ?auto_90092 ) ) ( not ( = ?auto_90089 ?auto_90090 ) ) ( not ( = ?auto_90089 ?auto_90091 ) ) ( not ( = ?auto_90089 ?auto_90092 ) ) ( not ( = ?auto_90090 ?auto_90091 ) ) ( not ( = ?auto_90090 ?auto_90092 ) ) ( not ( = ?auto_90091 ?auto_90092 ) ) ( HOLDING ?auto_90093 ) ( CLEAR ?auto_90094 ) ( not ( = ?auto_90087 ?auto_90093 ) ) ( not ( = ?auto_90087 ?auto_90094 ) ) ( not ( = ?auto_90088 ?auto_90093 ) ) ( not ( = ?auto_90088 ?auto_90094 ) ) ( not ( = ?auto_90089 ?auto_90093 ) ) ( not ( = ?auto_90089 ?auto_90094 ) ) ( not ( = ?auto_90090 ?auto_90093 ) ) ( not ( = ?auto_90090 ?auto_90094 ) ) ( not ( = ?auto_90091 ?auto_90093 ) ) ( not ( = ?auto_90091 ?auto_90094 ) ) ( not ( = ?auto_90092 ?auto_90093 ) ) ( not ( = ?auto_90092 ?auto_90094 ) ) ( not ( = ?auto_90093 ?auto_90094 ) ) )
    :subtasks
    ( ( !STACK ?auto_90093 ?auto_90094 )
      ( MAKE-5PILE ?auto_90087 ?auto_90088 ?auto_90089 ?auto_90090 ?auto_90091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90095 - BLOCK
      ?auto_90096 - BLOCK
      ?auto_90097 - BLOCK
      ?auto_90098 - BLOCK
      ?auto_90099 - BLOCK
    )
    :vars
    (
      ?auto_90101 - BLOCK
      ?auto_90100 - BLOCK
      ?auto_90102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90101 ?auto_90099 ) ( ON-TABLE ?auto_90095 ) ( ON ?auto_90096 ?auto_90095 ) ( ON ?auto_90097 ?auto_90096 ) ( ON ?auto_90098 ?auto_90097 ) ( ON ?auto_90099 ?auto_90098 ) ( not ( = ?auto_90095 ?auto_90096 ) ) ( not ( = ?auto_90095 ?auto_90097 ) ) ( not ( = ?auto_90095 ?auto_90098 ) ) ( not ( = ?auto_90095 ?auto_90099 ) ) ( not ( = ?auto_90095 ?auto_90101 ) ) ( not ( = ?auto_90096 ?auto_90097 ) ) ( not ( = ?auto_90096 ?auto_90098 ) ) ( not ( = ?auto_90096 ?auto_90099 ) ) ( not ( = ?auto_90096 ?auto_90101 ) ) ( not ( = ?auto_90097 ?auto_90098 ) ) ( not ( = ?auto_90097 ?auto_90099 ) ) ( not ( = ?auto_90097 ?auto_90101 ) ) ( not ( = ?auto_90098 ?auto_90099 ) ) ( not ( = ?auto_90098 ?auto_90101 ) ) ( not ( = ?auto_90099 ?auto_90101 ) ) ( CLEAR ?auto_90100 ) ( not ( = ?auto_90095 ?auto_90102 ) ) ( not ( = ?auto_90095 ?auto_90100 ) ) ( not ( = ?auto_90096 ?auto_90102 ) ) ( not ( = ?auto_90096 ?auto_90100 ) ) ( not ( = ?auto_90097 ?auto_90102 ) ) ( not ( = ?auto_90097 ?auto_90100 ) ) ( not ( = ?auto_90098 ?auto_90102 ) ) ( not ( = ?auto_90098 ?auto_90100 ) ) ( not ( = ?auto_90099 ?auto_90102 ) ) ( not ( = ?auto_90099 ?auto_90100 ) ) ( not ( = ?auto_90101 ?auto_90102 ) ) ( not ( = ?auto_90101 ?auto_90100 ) ) ( not ( = ?auto_90102 ?auto_90100 ) ) ( ON ?auto_90102 ?auto_90101 ) ( CLEAR ?auto_90102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90095 ?auto_90096 ?auto_90097 ?auto_90098 ?auto_90099 ?auto_90101 )
      ( MAKE-5PILE ?auto_90095 ?auto_90096 ?auto_90097 ?auto_90098 ?auto_90099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90103 - BLOCK
      ?auto_90104 - BLOCK
      ?auto_90105 - BLOCK
      ?auto_90106 - BLOCK
      ?auto_90107 - BLOCK
    )
    :vars
    (
      ?auto_90109 - BLOCK
      ?auto_90110 - BLOCK
      ?auto_90108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90109 ?auto_90107 ) ( ON-TABLE ?auto_90103 ) ( ON ?auto_90104 ?auto_90103 ) ( ON ?auto_90105 ?auto_90104 ) ( ON ?auto_90106 ?auto_90105 ) ( ON ?auto_90107 ?auto_90106 ) ( not ( = ?auto_90103 ?auto_90104 ) ) ( not ( = ?auto_90103 ?auto_90105 ) ) ( not ( = ?auto_90103 ?auto_90106 ) ) ( not ( = ?auto_90103 ?auto_90107 ) ) ( not ( = ?auto_90103 ?auto_90109 ) ) ( not ( = ?auto_90104 ?auto_90105 ) ) ( not ( = ?auto_90104 ?auto_90106 ) ) ( not ( = ?auto_90104 ?auto_90107 ) ) ( not ( = ?auto_90104 ?auto_90109 ) ) ( not ( = ?auto_90105 ?auto_90106 ) ) ( not ( = ?auto_90105 ?auto_90107 ) ) ( not ( = ?auto_90105 ?auto_90109 ) ) ( not ( = ?auto_90106 ?auto_90107 ) ) ( not ( = ?auto_90106 ?auto_90109 ) ) ( not ( = ?auto_90107 ?auto_90109 ) ) ( not ( = ?auto_90103 ?auto_90110 ) ) ( not ( = ?auto_90103 ?auto_90108 ) ) ( not ( = ?auto_90104 ?auto_90110 ) ) ( not ( = ?auto_90104 ?auto_90108 ) ) ( not ( = ?auto_90105 ?auto_90110 ) ) ( not ( = ?auto_90105 ?auto_90108 ) ) ( not ( = ?auto_90106 ?auto_90110 ) ) ( not ( = ?auto_90106 ?auto_90108 ) ) ( not ( = ?auto_90107 ?auto_90110 ) ) ( not ( = ?auto_90107 ?auto_90108 ) ) ( not ( = ?auto_90109 ?auto_90110 ) ) ( not ( = ?auto_90109 ?auto_90108 ) ) ( not ( = ?auto_90110 ?auto_90108 ) ) ( ON ?auto_90110 ?auto_90109 ) ( CLEAR ?auto_90110 ) ( HOLDING ?auto_90108 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90108 )
      ( MAKE-5PILE ?auto_90103 ?auto_90104 ?auto_90105 ?auto_90106 ?auto_90107 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90111 - BLOCK
      ?auto_90112 - BLOCK
      ?auto_90113 - BLOCK
      ?auto_90114 - BLOCK
      ?auto_90115 - BLOCK
    )
    :vars
    (
      ?auto_90116 - BLOCK
      ?auto_90118 - BLOCK
      ?auto_90117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90116 ?auto_90115 ) ( ON-TABLE ?auto_90111 ) ( ON ?auto_90112 ?auto_90111 ) ( ON ?auto_90113 ?auto_90112 ) ( ON ?auto_90114 ?auto_90113 ) ( ON ?auto_90115 ?auto_90114 ) ( not ( = ?auto_90111 ?auto_90112 ) ) ( not ( = ?auto_90111 ?auto_90113 ) ) ( not ( = ?auto_90111 ?auto_90114 ) ) ( not ( = ?auto_90111 ?auto_90115 ) ) ( not ( = ?auto_90111 ?auto_90116 ) ) ( not ( = ?auto_90112 ?auto_90113 ) ) ( not ( = ?auto_90112 ?auto_90114 ) ) ( not ( = ?auto_90112 ?auto_90115 ) ) ( not ( = ?auto_90112 ?auto_90116 ) ) ( not ( = ?auto_90113 ?auto_90114 ) ) ( not ( = ?auto_90113 ?auto_90115 ) ) ( not ( = ?auto_90113 ?auto_90116 ) ) ( not ( = ?auto_90114 ?auto_90115 ) ) ( not ( = ?auto_90114 ?auto_90116 ) ) ( not ( = ?auto_90115 ?auto_90116 ) ) ( not ( = ?auto_90111 ?auto_90118 ) ) ( not ( = ?auto_90111 ?auto_90117 ) ) ( not ( = ?auto_90112 ?auto_90118 ) ) ( not ( = ?auto_90112 ?auto_90117 ) ) ( not ( = ?auto_90113 ?auto_90118 ) ) ( not ( = ?auto_90113 ?auto_90117 ) ) ( not ( = ?auto_90114 ?auto_90118 ) ) ( not ( = ?auto_90114 ?auto_90117 ) ) ( not ( = ?auto_90115 ?auto_90118 ) ) ( not ( = ?auto_90115 ?auto_90117 ) ) ( not ( = ?auto_90116 ?auto_90118 ) ) ( not ( = ?auto_90116 ?auto_90117 ) ) ( not ( = ?auto_90118 ?auto_90117 ) ) ( ON ?auto_90118 ?auto_90116 ) ( ON ?auto_90117 ?auto_90118 ) ( CLEAR ?auto_90117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90111 ?auto_90112 ?auto_90113 ?auto_90114 ?auto_90115 ?auto_90116 ?auto_90118 )
      ( MAKE-5PILE ?auto_90111 ?auto_90112 ?auto_90113 ?auto_90114 ?auto_90115 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90122 - BLOCK
      ?auto_90123 - BLOCK
      ?auto_90124 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90124 ) ( CLEAR ?auto_90123 ) ( ON-TABLE ?auto_90122 ) ( ON ?auto_90123 ?auto_90122 ) ( not ( = ?auto_90122 ?auto_90123 ) ) ( not ( = ?auto_90122 ?auto_90124 ) ) ( not ( = ?auto_90123 ?auto_90124 ) ) )
    :subtasks
    ( ( !STACK ?auto_90124 ?auto_90123 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90125 - BLOCK
      ?auto_90126 - BLOCK
      ?auto_90127 - BLOCK
    )
    :vars
    (
      ?auto_90128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90126 ) ( ON-TABLE ?auto_90125 ) ( ON ?auto_90126 ?auto_90125 ) ( not ( = ?auto_90125 ?auto_90126 ) ) ( not ( = ?auto_90125 ?auto_90127 ) ) ( not ( = ?auto_90126 ?auto_90127 ) ) ( ON ?auto_90127 ?auto_90128 ) ( CLEAR ?auto_90127 ) ( HAND-EMPTY ) ( not ( = ?auto_90125 ?auto_90128 ) ) ( not ( = ?auto_90126 ?auto_90128 ) ) ( not ( = ?auto_90127 ?auto_90128 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90127 ?auto_90128 )
      ( MAKE-3PILE ?auto_90125 ?auto_90126 ?auto_90127 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90129 - BLOCK
      ?auto_90130 - BLOCK
      ?auto_90131 - BLOCK
    )
    :vars
    (
      ?auto_90132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90129 ) ( not ( = ?auto_90129 ?auto_90130 ) ) ( not ( = ?auto_90129 ?auto_90131 ) ) ( not ( = ?auto_90130 ?auto_90131 ) ) ( ON ?auto_90131 ?auto_90132 ) ( CLEAR ?auto_90131 ) ( not ( = ?auto_90129 ?auto_90132 ) ) ( not ( = ?auto_90130 ?auto_90132 ) ) ( not ( = ?auto_90131 ?auto_90132 ) ) ( HOLDING ?auto_90130 ) ( CLEAR ?auto_90129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90129 ?auto_90130 )
      ( MAKE-3PILE ?auto_90129 ?auto_90130 ?auto_90131 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90133 - BLOCK
      ?auto_90134 - BLOCK
      ?auto_90135 - BLOCK
    )
    :vars
    (
      ?auto_90136 - BLOCK
      ?auto_90138 - BLOCK
      ?auto_90139 - BLOCK
      ?auto_90140 - BLOCK
      ?auto_90137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90133 ) ( not ( = ?auto_90133 ?auto_90134 ) ) ( not ( = ?auto_90133 ?auto_90135 ) ) ( not ( = ?auto_90134 ?auto_90135 ) ) ( ON ?auto_90135 ?auto_90136 ) ( not ( = ?auto_90133 ?auto_90136 ) ) ( not ( = ?auto_90134 ?auto_90136 ) ) ( not ( = ?auto_90135 ?auto_90136 ) ) ( CLEAR ?auto_90133 ) ( ON ?auto_90134 ?auto_90135 ) ( CLEAR ?auto_90134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90138 ) ( ON ?auto_90139 ?auto_90138 ) ( ON ?auto_90140 ?auto_90139 ) ( ON ?auto_90137 ?auto_90140 ) ( ON ?auto_90136 ?auto_90137 ) ( not ( = ?auto_90138 ?auto_90139 ) ) ( not ( = ?auto_90138 ?auto_90140 ) ) ( not ( = ?auto_90138 ?auto_90137 ) ) ( not ( = ?auto_90138 ?auto_90136 ) ) ( not ( = ?auto_90138 ?auto_90135 ) ) ( not ( = ?auto_90138 ?auto_90134 ) ) ( not ( = ?auto_90139 ?auto_90140 ) ) ( not ( = ?auto_90139 ?auto_90137 ) ) ( not ( = ?auto_90139 ?auto_90136 ) ) ( not ( = ?auto_90139 ?auto_90135 ) ) ( not ( = ?auto_90139 ?auto_90134 ) ) ( not ( = ?auto_90140 ?auto_90137 ) ) ( not ( = ?auto_90140 ?auto_90136 ) ) ( not ( = ?auto_90140 ?auto_90135 ) ) ( not ( = ?auto_90140 ?auto_90134 ) ) ( not ( = ?auto_90137 ?auto_90136 ) ) ( not ( = ?auto_90137 ?auto_90135 ) ) ( not ( = ?auto_90137 ?auto_90134 ) ) ( not ( = ?auto_90133 ?auto_90138 ) ) ( not ( = ?auto_90133 ?auto_90139 ) ) ( not ( = ?auto_90133 ?auto_90140 ) ) ( not ( = ?auto_90133 ?auto_90137 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90138 ?auto_90139 ?auto_90140 ?auto_90137 ?auto_90136 ?auto_90135 )
      ( MAKE-3PILE ?auto_90133 ?auto_90134 ?auto_90135 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90141 - BLOCK
      ?auto_90142 - BLOCK
      ?auto_90143 - BLOCK
    )
    :vars
    (
      ?auto_90148 - BLOCK
      ?auto_90144 - BLOCK
      ?auto_90146 - BLOCK
      ?auto_90147 - BLOCK
      ?auto_90145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90141 ?auto_90142 ) ) ( not ( = ?auto_90141 ?auto_90143 ) ) ( not ( = ?auto_90142 ?auto_90143 ) ) ( ON ?auto_90143 ?auto_90148 ) ( not ( = ?auto_90141 ?auto_90148 ) ) ( not ( = ?auto_90142 ?auto_90148 ) ) ( not ( = ?auto_90143 ?auto_90148 ) ) ( ON ?auto_90142 ?auto_90143 ) ( CLEAR ?auto_90142 ) ( ON-TABLE ?auto_90144 ) ( ON ?auto_90146 ?auto_90144 ) ( ON ?auto_90147 ?auto_90146 ) ( ON ?auto_90145 ?auto_90147 ) ( ON ?auto_90148 ?auto_90145 ) ( not ( = ?auto_90144 ?auto_90146 ) ) ( not ( = ?auto_90144 ?auto_90147 ) ) ( not ( = ?auto_90144 ?auto_90145 ) ) ( not ( = ?auto_90144 ?auto_90148 ) ) ( not ( = ?auto_90144 ?auto_90143 ) ) ( not ( = ?auto_90144 ?auto_90142 ) ) ( not ( = ?auto_90146 ?auto_90147 ) ) ( not ( = ?auto_90146 ?auto_90145 ) ) ( not ( = ?auto_90146 ?auto_90148 ) ) ( not ( = ?auto_90146 ?auto_90143 ) ) ( not ( = ?auto_90146 ?auto_90142 ) ) ( not ( = ?auto_90147 ?auto_90145 ) ) ( not ( = ?auto_90147 ?auto_90148 ) ) ( not ( = ?auto_90147 ?auto_90143 ) ) ( not ( = ?auto_90147 ?auto_90142 ) ) ( not ( = ?auto_90145 ?auto_90148 ) ) ( not ( = ?auto_90145 ?auto_90143 ) ) ( not ( = ?auto_90145 ?auto_90142 ) ) ( not ( = ?auto_90141 ?auto_90144 ) ) ( not ( = ?auto_90141 ?auto_90146 ) ) ( not ( = ?auto_90141 ?auto_90147 ) ) ( not ( = ?auto_90141 ?auto_90145 ) ) ( HOLDING ?auto_90141 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90141 )
      ( MAKE-3PILE ?auto_90141 ?auto_90142 ?auto_90143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90149 - BLOCK
      ?auto_90150 - BLOCK
      ?auto_90151 - BLOCK
    )
    :vars
    (
      ?auto_90154 - BLOCK
      ?auto_90156 - BLOCK
      ?auto_90152 - BLOCK
      ?auto_90153 - BLOCK
      ?auto_90155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90149 ?auto_90150 ) ) ( not ( = ?auto_90149 ?auto_90151 ) ) ( not ( = ?auto_90150 ?auto_90151 ) ) ( ON ?auto_90151 ?auto_90154 ) ( not ( = ?auto_90149 ?auto_90154 ) ) ( not ( = ?auto_90150 ?auto_90154 ) ) ( not ( = ?auto_90151 ?auto_90154 ) ) ( ON ?auto_90150 ?auto_90151 ) ( ON-TABLE ?auto_90156 ) ( ON ?auto_90152 ?auto_90156 ) ( ON ?auto_90153 ?auto_90152 ) ( ON ?auto_90155 ?auto_90153 ) ( ON ?auto_90154 ?auto_90155 ) ( not ( = ?auto_90156 ?auto_90152 ) ) ( not ( = ?auto_90156 ?auto_90153 ) ) ( not ( = ?auto_90156 ?auto_90155 ) ) ( not ( = ?auto_90156 ?auto_90154 ) ) ( not ( = ?auto_90156 ?auto_90151 ) ) ( not ( = ?auto_90156 ?auto_90150 ) ) ( not ( = ?auto_90152 ?auto_90153 ) ) ( not ( = ?auto_90152 ?auto_90155 ) ) ( not ( = ?auto_90152 ?auto_90154 ) ) ( not ( = ?auto_90152 ?auto_90151 ) ) ( not ( = ?auto_90152 ?auto_90150 ) ) ( not ( = ?auto_90153 ?auto_90155 ) ) ( not ( = ?auto_90153 ?auto_90154 ) ) ( not ( = ?auto_90153 ?auto_90151 ) ) ( not ( = ?auto_90153 ?auto_90150 ) ) ( not ( = ?auto_90155 ?auto_90154 ) ) ( not ( = ?auto_90155 ?auto_90151 ) ) ( not ( = ?auto_90155 ?auto_90150 ) ) ( not ( = ?auto_90149 ?auto_90156 ) ) ( not ( = ?auto_90149 ?auto_90152 ) ) ( not ( = ?auto_90149 ?auto_90153 ) ) ( not ( = ?auto_90149 ?auto_90155 ) ) ( ON ?auto_90149 ?auto_90150 ) ( CLEAR ?auto_90149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90156 ?auto_90152 ?auto_90153 ?auto_90155 ?auto_90154 ?auto_90151 ?auto_90150 )
      ( MAKE-3PILE ?auto_90149 ?auto_90150 ?auto_90151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90161 - BLOCK
      ?auto_90162 - BLOCK
      ?auto_90163 - BLOCK
      ?auto_90164 - BLOCK
    )
    :vars
    (
      ?auto_90165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90165 ?auto_90164 ) ( CLEAR ?auto_90165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90161 ) ( ON ?auto_90162 ?auto_90161 ) ( ON ?auto_90163 ?auto_90162 ) ( ON ?auto_90164 ?auto_90163 ) ( not ( = ?auto_90161 ?auto_90162 ) ) ( not ( = ?auto_90161 ?auto_90163 ) ) ( not ( = ?auto_90161 ?auto_90164 ) ) ( not ( = ?auto_90161 ?auto_90165 ) ) ( not ( = ?auto_90162 ?auto_90163 ) ) ( not ( = ?auto_90162 ?auto_90164 ) ) ( not ( = ?auto_90162 ?auto_90165 ) ) ( not ( = ?auto_90163 ?auto_90164 ) ) ( not ( = ?auto_90163 ?auto_90165 ) ) ( not ( = ?auto_90164 ?auto_90165 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90165 ?auto_90164 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90166 - BLOCK
      ?auto_90167 - BLOCK
      ?auto_90168 - BLOCK
      ?auto_90169 - BLOCK
    )
    :vars
    (
      ?auto_90170 - BLOCK
      ?auto_90171 - BLOCK
      ?auto_90172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90170 ?auto_90169 ) ( CLEAR ?auto_90170 ) ( ON-TABLE ?auto_90166 ) ( ON ?auto_90167 ?auto_90166 ) ( ON ?auto_90168 ?auto_90167 ) ( ON ?auto_90169 ?auto_90168 ) ( not ( = ?auto_90166 ?auto_90167 ) ) ( not ( = ?auto_90166 ?auto_90168 ) ) ( not ( = ?auto_90166 ?auto_90169 ) ) ( not ( = ?auto_90166 ?auto_90170 ) ) ( not ( = ?auto_90167 ?auto_90168 ) ) ( not ( = ?auto_90167 ?auto_90169 ) ) ( not ( = ?auto_90167 ?auto_90170 ) ) ( not ( = ?auto_90168 ?auto_90169 ) ) ( not ( = ?auto_90168 ?auto_90170 ) ) ( not ( = ?auto_90169 ?auto_90170 ) ) ( HOLDING ?auto_90171 ) ( CLEAR ?auto_90172 ) ( not ( = ?auto_90166 ?auto_90171 ) ) ( not ( = ?auto_90166 ?auto_90172 ) ) ( not ( = ?auto_90167 ?auto_90171 ) ) ( not ( = ?auto_90167 ?auto_90172 ) ) ( not ( = ?auto_90168 ?auto_90171 ) ) ( not ( = ?auto_90168 ?auto_90172 ) ) ( not ( = ?auto_90169 ?auto_90171 ) ) ( not ( = ?auto_90169 ?auto_90172 ) ) ( not ( = ?auto_90170 ?auto_90171 ) ) ( not ( = ?auto_90170 ?auto_90172 ) ) ( not ( = ?auto_90171 ?auto_90172 ) ) )
    :subtasks
    ( ( !STACK ?auto_90171 ?auto_90172 )
      ( MAKE-4PILE ?auto_90166 ?auto_90167 ?auto_90168 ?auto_90169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90173 - BLOCK
      ?auto_90174 - BLOCK
      ?auto_90175 - BLOCK
      ?auto_90176 - BLOCK
    )
    :vars
    (
      ?auto_90178 - BLOCK
      ?auto_90179 - BLOCK
      ?auto_90177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90178 ?auto_90176 ) ( ON-TABLE ?auto_90173 ) ( ON ?auto_90174 ?auto_90173 ) ( ON ?auto_90175 ?auto_90174 ) ( ON ?auto_90176 ?auto_90175 ) ( not ( = ?auto_90173 ?auto_90174 ) ) ( not ( = ?auto_90173 ?auto_90175 ) ) ( not ( = ?auto_90173 ?auto_90176 ) ) ( not ( = ?auto_90173 ?auto_90178 ) ) ( not ( = ?auto_90174 ?auto_90175 ) ) ( not ( = ?auto_90174 ?auto_90176 ) ) ( not ( = ?auto_90174 ?auto_90178 ) ) ( not ( = ?auto_90175 ?auto_90176 ) ) ( not ( = ?auto_90175 ?auto_90178 ) ) ( not ( = ?auto_90176 ?auto_90178 ) ) ( CLEAR ?auto_90179 ) ( not ( = ?auto_90173 ?auto_90177 ) ) ( not ( = ?auto_90173 ?auto_90179 ) ) ( not ( = ?auto_90174 ?auto_90177 ) ) ( not ( = ?auto_90174 ?auto_90179 ) ) ( not ( = ?auto_90175 ?auto_90177 ) ) ( not ( = ?auto_90175 ?auto_90179 ) ) ( not ( = ?auto_90176 ?auto_90177 ) ) ( not ( = ?auto_90176 ?auto_90179 ) ) ( not ( = ?auto_90178 ?auto_90177 ) ) ( not ( = ?auto_90178 ?auto_90179 ) ) ( not ( = ?auto_90177 ?auto_90179 ) ) ( ON ?auto_90177 ?auto_90178 ) ( CLEAR ?auto_90177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90173 ?auto_90174 ?auto_90175 ?auto_90176 ?auto_90178 )
      ( MAKE-4PILE ?auto_90173 ?auto_90174 ?auto_90175 ?auto_90176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90180 - BLOCK
      ?auto_90181 - BLOCK
      ?auto_90182 - BLOCK
      ?auto_90183 - BLOCK
    )
    :vars
    (
      ?auto_90184 - BLOCK
      ?auto_90185 - BLOCK
      ?auto_90186 - BLOCK
      ?auto_90187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90184 ?auto_90183 ) ( ON-TABLE ?auto_90180 ) ( ON ?auto_90181 ?auto_90180 ) ( ON ?auto_90182 ?auto_90181 ) ( ON ?auto_90183 ?auto_90182 ) ( not ( = ?auto_90180 ?auto_90181 ) ) ( not ( = ?auto_90180 ?auto_90182 ) ) ( not ( = ?auto_90180 ?auto_90183 ) ) ( not ( = ?auto_90180 ?auto_90184 ) ) ( not ( = ?auto_90181 ?auto_90182 ) ) ( not ( = ?auto_90181 ?auto_90183 ) ) ( not ( = ?auto_90181 ?auto_90184 ) ) ( not ( = ?auto_90182 ?auto_90183 ) ) ( not ( = ?auto_90182 ?auto_90184 ) ) ( not ( = ?auto_90183 ?auto_90184 ) ) ( not ( = ?auto_90180 ?auto_90185 ) ) ( not ( = ?auto_90180 ?auto_90186 ) ) ( not ( = ?auto_90181 ?auto_90185 ) ) ( not ( = ?auto_90181 ?auto_90186 ) ) ( not ( = ?auto_90182 ?auto_90185 ) ) ( not ( = ?auto_90182 ?auto_90186 ) ) ( not ( = ?auto_90183 ?auto_90185 ) ) ( not ( = ?auto_90183 ?auto_90186 ) ) ( not ( = ?auto_90184 ?auto_90185 ) ) ( not ( = ?auto_90184 ?auto_90186 ) ) ( not ( = ?auto_90185 ?auto_90186 ) ) ( ON ?auto_90185 ?auto_90184 ) ( CLEAR ?auto_90185 ) ( HOLDING ?auto_90186 ) ( CLEAR ?auto_90187 ) ( ON-TABLE ?auto_90187 ) ( not ( = ?auto_90187 ?auto_90186 ) ) ( not ( = ?auto_90180 ?auto_90187 ) ) ( not ( = ?auto_90181 ?auto_90187 ) ) ( not ( = ?auto_90182 ?auto_90187 ) ) ( not ( = ?auto_90183 ?auto_90187 ) ) ( not ( = ?auto_90184 ?auto_90187 ) ) ( not ( = ?auto_90185 ?auto_90187 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90187 ?auto_90186 )
      ( MAKE-4PILE ?auto_90180 ?auto_90181 ?auto_90182 ?auto_90183 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90188 - BLOCK
      ?auto_90189 - BLOCK
      ?auto_90190 - BLOCK
      ?auto_90191 - BLOCK
    )
    :vars
    (
      ?auto_90193 - BLOCK
      ?auto_90194 - BLOCK
      ?auto_90192 - BLOCK
      ?auto_90195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90193 ?auto_90191 ) ( ON-TABLE ?auto_90188 ) ( ON ?auto_90189 ?auto_90188 ) ( ON ?auto_90190 ?auto_90189 ) ( ON ?auto_90191 ?auto_90190 ) ( not ( = ?auto_90188 ?auto_90189 ) ) ( not ( = ?auto_90188 ?auto_90190 ) ) ( not ( = ?auto_90188 ?auto_90191 ) ) ( not ( = ?auto_90188 ?auto_90193 ) ) ( not ( = ?auto_90189 ?auto_90190 ) ) ( not ( = ?auto_90189 ?auto_90191 ) ) ( not ( = ?auto_90189 ?auto_90193 ) ) ( not ( = ?auto_90190 ?auto_90191 ) ) ( not ( = ?auto_90190 ?auto_90193 ) ) ( not ( = ?auto_90191 ?auto_90193 ) ) ( not ( = ?auto_90188 ?auto_90194 ) ) ( not ( = ?auto_90188 ?auto_90192 ) ) ( not ( = ?auto_90189 ?auto_90194 ) ) ( not ( = ?auto_90189 ?auto_90192 ) ) ( not ( = ?auto_90190 ?auto_90194 ) ) ( not ( = ?auto_90190 ?auto_90192 ) ) ( not ( = ?auto_90191 ?auto_90194 ) ) ( not ( = ?auto_90191 ?auto_90192 ) ) ( not ( = ?auto_90193 ?auto_90194 ) ) ( not ( = ?auto_90193 ?auto_90192 ) ) ( not ( = ?auto_90194 ?auto_90192 ) ) ( ON ?auto_90194 ?auto_90193 ) ( CLEAR ?auto_90195 ) ( ON-TABLE ?auto_90195 ) ( not ( = ?auto_90195 ?auto_90192 ) ) ( not ( = ?auto_90188 ?auto_90195 ) ) ( not ( = ?auto_90189 ?auto_90195 ) ) ( not ( = ?auto_90190 ?auto_90195 ) ) ( not ( = ?auto_90191 ?auto_90195 ) ) ( not ( = ?auto_90193 ?auto_90195 ) ) ( not ( = ?auto_90194 ?auto_90195 ) ) ( ON ?auto_90192 ?auto_90194 ) ( CLEAR ?auto_90192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90188 ?auto_90189 ?auto_90190 ?auto_90191 ?auto_90193 ?auto_90194 )
      ( MAKE-4PILE ?auto_90188 ?auto_90189 ?auto_90190 ?auto_90191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90196 - BLOCK
      ?auto_90197 - BLOCK
      ?auto_90198 - BLOCK
      ?auto_90199 - BLOCK
    )
    :vars
    (
      ?auto_90200 - BLOCK
      ?auto_90203 - BLOCK
      ?auto_90201 - BLOCK
      ?auto_90202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90200 ?auto_90199 ) ( ON-TABLE ?auto_90196 ) ( ON ?auto_90197 ?auto_90196 ) ( ON ?auto_90198 ?auto_90197 ) ( ON ?auto_90199 ?auto_90198 ) ( not ( = ?auto_90196 ?auto_90197 ) ) ( not ( = ?auto_90196 ?auto_90198 ) ) ( not ( = ?auto_90196 ?auto_90199 ) ) ( not ( = ?auto_90196 ?auto_90200 ) ) ( not ( = ?auto_90197 ?auto_90198 ) ) ( not ( = ?auto_90197 ?auto_90199 ) ) ( not ( = ?auto_90197 ?auto_90200 ) ) ( not ( = ?auto_90198 ?auto_90199 ) ) ( not ( = ?auto_90198 ?auto_90200 ) ) ( not ( = ?auto_90199 ?auto_90200 ) ) ( not ( = ?auto_90196 ?auto_90203 ) ) ( not ( = ?auto_90196 ?auto_90201 ) ) ( not ( = ?auto_90197 ?auto_90203 ) ) ( not ( = ?auto_90197 ?auto_90201 ) ) ( not ( = ?auto_90198 ?auto_90203 ) ) ( not ( = ?auto_90198 ?auto_90201 ) ) ( not ( = ?auto_90199 ?auto_90203 ) ) ( not ( = ?auto_90199 ?auto_90201 ) ) ( not ( = ?auto_90200 ?auto_90203 ) ) ( not ( = ?auto_90200 ?auto_90201 ) ) ( not ( = ?auto_90203 ?auto_90201 ) ) ( ON ?auto_90203 ?auto_90200 ) ( not ( = ?auto_90202 ?auto_90201 ) ) ( not ( = ?auto_90196 ?auto_90202 ) ) ( not ( = ?auto_90197 ?auto_90202 ) ) ( not ( = ?auto_90198 ?auto_90202 ) ) ( not ( = ?auto_90199 ?auto_90202 ) ) ( not ( = ?auto_90200 ?auto_90202 ) ) ( not ( = ?auto_90203 ?auto_90202 ) ) ( ON ?auto_90201 ?auto_90203 ) ( CLEAR ?auto_90201 ) ( HOLDING ?auto_90202 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90202 )
      ( MAKE-4PILE ?auto_90196 ?auto_90197 ?auto_90198 ?auto_90199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90204 - BLOCK
      ?auto_90205 - BLOCK
      ?auto_90206 - BLOCK
      ?auto_90207 - BLOCK
    )
    :vars
    (
      ?auto_90211 - BLOCK
      ?auto_90210 - BLOCK
      ?auto_90208 - BLOCK
      ?auto_90209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90211 ?auto_90207 ) ( ON-TABLE ?auto_90204 ) ( ON ?auto_90205 ?auto_90204 ) ( ON ?auto_90206 ?auto_90205 ) ( ON ?auto_90207 ?auto_90206 ) ( not ( = ?auto_90204 ?auto_90205 ) ) ( not ( = ?auto_90204 ?auto_90206 ) ) ( not ( = ?auto_90204 ?auto_90207 ) ) ( not ( = ?auto_90204 ?auto_90211 ) ) ( not ( = ?auto_90205 ?auto_90206 ) ) ( not ( = ?auto_90205 ?auto_90207 ) ) ( not ( = ?auto_90205 ?auto_90211 ) ) ( not ( = ?auto_90206 ?auto_90207 ) ) ( not ( = ?auto_90206 ?auto_90211 ) ) ( not ( = ?auto_90207 ?auto_90211 ) ) ( not ( = ?auto_90204 ?auto_90210 ) ) ( not ( = ?auto_90204 ?auto_90208 ) ) ( not ( = ?auto_90205 ?auto_90210 ) ) ( not ( = ?auto_90205 ?auto_90208 ) ) ( not ( = ?auto_90206 ?auto_90210 ) ) ( not ( = ?auto_90206 ?auto_90208 ) ) ( not ( = ?auto_90207 ?auto_90210 ) ) ( not ( = ?auto_90207 ?auto_90208 ) ) ( not ( = ?auto_90211 ?auto_90210 ) ) ( not ( = ?auto_90211 ?auto_90208 ) ) ( not ( = ?auto_90210 ?auto_90208 ) ) ( ON ?auto_90210 ?auto_90211 ) ( not ( = ?auto_90209 ?auto_90208 ) ) ( not ( = ?auto_90204 ?auto_90209 ) ) ( not ( = ?auto_90205 ?auto_90209 ) ) ( not ( = ?auto_90206 ?auto_90209 ) ) ( not ( = ?auto_90207 ?auto_90209 ) ) ( not ( = ?auto_90211 ?auto_90209 ) ) ( not ( = ?auto_90210 ?auto_90209 ) ) ( ON ?auto_90208 ?auto_90210 ) ( ON ?auto_90209 ?auto_90208 ) ( CLEAR ?auto_90209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90204 ?auto_90205 ?auto_90206 ?auto_90207 ?auto_90211 ?auto_90210 ?auto_90208 )
      ( MAKE-4PILE ?auto_90204 ?auto_90205 ?auto_90206 ?auto_90207 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90216 - BLOCK
      ?auto_90217 - BLOCK
      ?auto_90218 - BLOCK
      ?auto_90219 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90219 ) ( CLEAR ?auto_90218 ) ( ON-TABLE ?auto_90216 ) ( ON ?auto_90217 ?auto_90216 ) ( ON ?auto_90218 ?auto_90217 ) ( not ( = ?auto_90216 ?auto_90217 ) ) ( not ( = ?auto_90216 ?auto_90218 ) ) ( not ( = ?auto_90216 ?auto_90219 ) ) ( not ( = ?auto_90217 ?auto_90218 ) ) ( not ( = ?auto_90217 ?auto_90219 ) ) ( not ( = ?auto_90218 ?auto_90219 ) ) )
    :subtasks
    ( ( !STACK ?auto_90219 ?auto_90218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90220 - BLOCK
      ?auto_90221 - BLOCK
      ?auto_90222 - BLOCK
      ?auto_90223 - BLOCK
    )
    :vars
    (
      ?auto_90224 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90222 ) ( ON-TABLE ?auto_90220 ) ( ON ?auto_90221 ?auto_90220 ) ( ON ?auto_90222 ?auto_90221 ) ( not ( = ?auto_90220 ?auto_90221 ) ) ( not ( = ?auto_90220 ?auto_90222 ) ) ( not ( = ?auto_90220 ?auto_90223 ) ) ( not ( = ?auto_90221 ?auto_90222 ) ) ( not ( = ?auto_90221 ?auto_90223 ) ) ( not ( = ?auto_90222 ?auto_90223 ) ) ( ON ?auto_90223 ?auto_90224 ) ( CLEAR ?auto_90223 ) ( HAND-EMPTY ) ( not ( = ?auto_90220 ?auto_90224 ) ) ( not ( = ?auto_90221 ?auto_90224 ) ) ( not ( = ?auto_90222 ?auto_90224 ) ) ( not ( = ?auto_90223 ?auto_90224 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90223 ?auto_90224 )
      ( MAKE-4PILE ?auto_90220 ?auto_90221 ?auto_90222 ?auto_90223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90225 - BLOCK
      ?auto_90226 - BLOCK
      ?auto_90227 - BLOCK
      ?auto_90228 - BLOCK
    )
    :vars
    (
      ?auto_90229 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90225 ) ( ON ?auto_90226 ?auto_90225 ) ( not ( = ?auto_90225 ?auto_90226 ) ) ( not ( = ?auto_90225 ?auto_90227 ) ) ( not ( = ?auto_90225 ?auto_90228 ) ) ( not ( = ?auto_90226 ?auto_90227 ) ) ( not ( = ?auto_90226 ?auto_90228 ) ) ( not ( = ?auto_90227 ?auto_90228 ) ) ( ON ?auto_90228 ?auto_90229 ) ( CLEAR ?auto_90228 ) ( not ( = ?auto_90225 ?auto_90229 ) ) ( not ( = ?auto_90226 ?auto_90229 ) ) ( not ( = ?auto_90227 ?auto_90229 ) ) ( not ( = ?auto_90228 ?auto_90229 ) ) ( HOLDING ?auto_90227 ) ( CLEAR ?auto_90226 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90225 ?auto_90226 ?auto_90227 )
      ( MAKE-4PILE ?auto_90225 ?auto_90226 ?auto_90227 ?auto_90228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90230 - BLOCK
      ?auto_90231 - BLOCK
      ?auto_90232 - BLOCK
      ?auto_90233 - BLOCK
    )
    :vars
    (
      ?auto_90234 - BLOCK
      ?auto_90237 - BLOCK
      ?auto_90236 - BLOCK
      ?auto_90235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90230 ) ( ON ?auto_90231 ?auto_90230 ) ( not ( = ?auto_90230 ?auto_90231 ) ) ( not ( = ?auto_90230 ?auto_90232 ) ) ( not ( = ?auto_90230 ?auto_90233 ) ) ( not ( = ?auto_90231 ?auto_90232 ) ) ( not ( = ?auto_90231 ?auto_90233 ) ) ( not ( = ?auto_90232 ?auto_90233 ) ) ( ON ?auto_90233 ?auto_90234 ) ( not ( = ?auto_90230 ?auto_90234 ) ) ( not ( = ?auto_90231 ?auto_90234 ) ) ( not ( = ?auto_90232 ?auto_90234 ) ) ( not ( = ?auto_90233 ?auto_90234 ) ) ( CLEAR ?auto_90231 ) ( ON ?auto_90232 ?auto_90233 ) ( CLEAR ?auto_90232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90237 ) ( ON ?auto_90236 ?auto_90237 ) ( ON ?auto_90235 ?auto_90236 ) ( ON ?auto_90234 ?auto_90235 ) ( not ( = ?auto_90237 ?auto_90236 ) ) ( not ( = ?auto_90237 ?auto_90235 ) ) ( not ( = ?auto_90237 ?auto_90234 ) ) ( not ( = ?auto_90237 ?auto_90233 ) ) ( not ( = ?auto_90237 ?auto_90232 ) ) ( not ( = ?auto_90236 ?auto_90235 ) ) ( not ( = ?auto_90236 ?auto_90234 ) ) ( not ( = ?auto_90236 ?auto_90233 ) ) ( not ( = ?auto_90236 ?auto_90232 ) ) ( not ( = ?auto_90235 ?auto_90234 ) ) ( not ( = ?auto_90235 ?auto_90233 ) ) ( not ( = ?auto_90235 ?auto_90232 ) ) ( not ( = ?auto_90230 ?auto_90237 ) ) ( not ( = ?auto_90230 ?auto_90236 ) ) ( not ( = ?auto_90230 ?auto_90235 ) ) ( not ( = ?auto_90231 ?auto_90237 ) ) ( not ( = ?auto_90231 ?auto_90236 ) ) ( not ( = ?auto_90231 ?auto_90235 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90237 ?auto_90236 ?auto_90235 ?auto_90234 ?auto_90233 )
      ( MAKE-4PILE ?auto_90230 ?auto_90231 ?auto_90232 ?auto_90233 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90238 - BLOCK
      ?auto_90239 - BLOCK
      ?auto_90240 - BLOCK
      ?auto_90241 - BLOCK
    )
    :vars
    (
      ?auto_90242 - BLOCK
      ?auto_90244 - BLOCK
      ?auto_90243 - BLOCK
      ?auto_90245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90238 ) ( not ( = ?auto_90238 ?auto_90239 ) ) ( not ( = ?auto_90238 ?auto_90240 ) ) ( not ( = ?auto_90238 ?auto_90241 ) ) ( not ( = ?auto_90239 ?auto_90240 ) ) ( not ( = ?auto_90239 ?auto_90241 ) ) ( not ( = ?auto_90240 ?auto_90241 ) ) ( ON ?auto_90241 ?auto_90242 ) ( not ( = ?auto_90238 ?auto_90242 ) ) ( not ( = ?auto_90239 ?auto_90242 ) ) ( not ( = ?auto_90240 ?auto_90242 ) ) ( not ( = ?auto_90241 ?auto_90242 ) ) ( ON ?auto_90240 ?auto_90241 ) ( CLEAR ?auto_90240 ) ( ON-TABLE ?auto_90244 ) ( ON ?auto_90243 ?auto_90244 ) ( ON ?auto_90245 ?auto_90243 ) ( ON ?auto_90242 ?auto_90245 ) ( not ( = ?auto_90244 ?auto_90243 ) ) ( not ( = ?auto_90244 ?auto_90245 ) ) ( not ( = ?auto_90244 ?auto_90242 ) ) ( not ( = ?auto_90244 ?auto_90241 ) ) ( not ( = ?auto_90244 ?auto_90240 ) ) ( not ( = ?auto_90243 ?auto_90245 ) ) ( not ( = ?auto_90243 ?auto_90242 ) ) ( not ( = ?auto_90243 ?auto_90241 ) ) ( not ( = ?auto_90243 ?auto_90240 ) ) ( not ( = ?auto_90245 ?auto_90242 ) ) ( not ( = ?auto_90245 ?auto_90241 ) ) ( not ( = ?auto_90245 ?auto_90240 ) ) ( not ( = ?auto_90238 ?auto_90244 ) ) ( not ( = ?auto_90238 ?auto_90243 ) ) ( not ( = ?auto_90238 ?auto_90245 ) ) ( not ( = ?auto_90239 ?auto_90244 ) ) ( not ( = ?auto_90239 ?auto_90243 ) ) ( not ( = ?auto_90239 ?auto_90245 ) ) ( HOLDING ?auto_90239 ) ( CLEAR ?auto_90238 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90238 ?auto_90239 )
      ( MAKE-4PILE ?auto_90238 ?auto_90239 ?auto_90240 ?auto_90241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90246 - BLOCK
      ?auto_90247 - BLOCK
      ?auto_90248 - BLOCK
      ?auto_90249 - BLOCK
    )
    :vars
    (
      ?auto_90251 - BLOCK
      ?auto_90253 - BLOCK
      ?auto_90252 - BLOCK
      ?auto_90250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90246 ) ( not ( = ?auto_90246 ?auto_90247 ) ) ( not ( = ?auto_90246 ?auto_90248 ) ) ( not ( = ?auto_90246 ?auto_90249 ) ) ( not ( = ?auto_90247 ?auto_90248 ) ) ( not ( = ?auto_90247 ?auto_90249 ) ) ( not ( = ?auto_90248 ?auto_90249 ) ) ( ON ?auto_90249 ?auto_90251 ) ( not ( = ?auto_90246 ?auto_90251 ) ) ( not ( = ?auto_90247 ?auto_90251 ) ) ( not ( = ?auto_90248 ?auto_90251 ) ) ( not ( = ?auto_90249 ?auto_90251 ) ) ( ON ?auto_90248 ?auto_90249 ) ( ON-TABLE ?auto_90253 ) ( ON ?auto_90252 ?auto_90253 ) ( ON ?auto_90250 ?auto_90252 ) ( ON ?auto_90251 ?auto_90250 ) ( not ( = ?auto_90253 ?auto_90252 ) ) ( not ( = ?auto_90253 ?auto_90250 ) ) ( not ( = ?auto_90253 ?auto_90251 ) ) ( not ( = ?auto_90253 ?auto_90249 ) ) ( not ( = ?auto_90253 ?auto_90248 ) ) ( not ( = ?auto_90252 ?auto_90250 ) ) ( not ( = ?auto_90252 ?auto_90251 ) ) ( not ( = ?auto_90252 ?auto_90249 ) ) ( not ( = ?auto_90252 ?auto_90248 ) ) ( not ( = ?auto_90250 ?auto_90251 ) ) ( not ( = ?auto_90250 ?auto_90249 ) ) ( not ( = ?auto_90250 ?auto_90248 ) ) ( not ( = ?auto_90246 ?auto_90253 ) ) ( not ( = ?auto_90246 ?auto_90252 ) ) ( not ( = ?auto_90246 ?auto_90250 ) ) ( not ( = ?auto_90247 ?auto_90253 ) ) ( not ( = ?auto_90247 ?auto_90252 ) ) ( not ( = ?auto_90247 ?auto_90250 ) ) ( CLEAR ?auto_90246 ) ( ON ?auto_90247 ?auto_90248 ) ( CLEAR ?auto_90247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90253 ?auto_90252 ?auto_90250 ?auto_90251 ?auto_90249 ?auto_90248 )
      ( MAKE-4PILE ?auto_90246 ?auto_90247 ?auto_90248 ?auto_90249 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90254 - BLOCK
      ?auto_90255 - BLOCK
      ?auto_90256 - BLOCK
      ?auto_90257 - BLOCK
    )
    :vars
    (
      ?auto_90261 - BLOCK
      ?auto_90259 - BLOCK
      ?auto_90258 - BLOCK
      ?auto_90260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90254 ?auto_90255 ) ) ( not ( = ?auto_90254 ?auto_90256 ) ) ( not ( = ?auto_90254 ?auto_90257 ) ) ( not ( = ?auto_90255 ?auto_90256 ) ) ( not ( = ?auto_90255 ?auto_90257 ) ) ( not ( = ?auto_90256 ?auto_90257 ) ) ( ON ?auto_90257 ?auto_90261 ) ( not ( = ?auto_90254 ?auto_90261 ) ) ( not ( = ?auto_90255 ?auto_90261 ) ) ( not ( = ?auto_90256 ?auto_90261 ) ) ( not ( = ?auto_90257 ?auto_90261 ) ) ( ON ?auto_90256 ?auto_90257 ) ( ON-TABLE ?auto_90259 ) ( ON ?auto_90258 ?auto_90259 ) ( ON ?auto_90260 ?auto_90258 ) ( ON ?auto_90261 ?auto_90260 ) ( not ( = ?auto_90259 ?auto_90258 ) ) ( not ( = ?auto_90259 ?auto_90260 ) ) ( not ( = ?auto_90259 ?auto_90261 ) ) ( not ( = ?auto_90259 ?auto_90257 ) ) ( not ( = ?auto_90259 ?auto_90256 ) ) ( not ( = ?auto_90258 ?auto_90260 ) ) ( not ( = ?auto_90258 ?auto_90261 ) ) ( not ( = ?auto_90258 ?auto_90257 ) ) ( not ( = ?auto_90258 ?auto_90256 ) ) ( not ( = ?auto_90260 ?auto_90261 ) ) ( not ( = ?auto_90260 ?auto_90257 ) ) ( not ( = ?auto_90260 ?auto_90256 ) ) ( not ( = ?auto_90254 ?auto_90259 ) ) ( not ( = ?auto_90254 ?auto_90258 ) ) ( not ( = ?auto_90254 ?auto_90260 ) ) ( not ( = ?auto_90255 ?auto_90259 ) ) ( not ( = ?auto_90255 ?auto_90258 ) ) ( not ( = ?auto_90255 ?auto_90260 ) ) ( ON ?auto_90255 ?auto_90256 ) ( CLEAR ?auto_90255 ) ( HOLDING ?auto_90254 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90254 )
      ( MAKE-4PILE ?auto_90254 ?auto_90255 ?auto_90256 ?auto_90257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_90262 - BLOCK
      ?auto_90263 - BLOCK
      ?auto_90264 - BLOCK
      ?auto_90265 - BLOCK
    )
    :vars
    (
      ?auto_90267 - BLOCK
      ?auto_90266 - BLOCK
      ?auto_90269 - BLOCK
      ?auto_90268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90262 ?auto_90263 ) ) ( not ( = ?auto_90262 ?auto_90264 ) ) ( not ( = ?auto_90262 ?auto_90265 ) ) ( not ( = ?auto_90263 ?auto_90264 ) ) ( not ( = ?auto_90263 ?auto_90265 ) ) ( not ( = ?auto_90264 ?auto_90265 ) ) ( ON ?auto_90265 ?auto_90267 ) ( not ( = ?auto_90262 ?auto_90267 ) ) ( not ( = ?auto_90263 ?auto_90267 ) ) ( not ( = ?auto_90264 ?auto_90267 ) ) ( not ( = ?auto_90265 ?auto_90267 ) ) ( ON ?auto_90264 ?auto_90265 ) ( ON-TABLE ?auto_90266 ) ( ON ?auto_90269 ?auto_90266 ) ( ON ?auto_90268 ?auto_90269 ) ( ON ?auto_90267 ?auto_90268 ) ( not ( = ?auto_90266 ?auto_90269 ) ) ( not ( = ?auto_90266 ?auto_90268 ) ) ( not ( = ?auto_90266 ?auto_90267 ) ) ( not ( = ?auto_90266 ?auto_90265 ) ) ( not ( = ?auto_90266 ?auto_90264 ) ) ( not ( = ?auto_90269 ?auto_90268 ) ) ( not ( = ?auto_90269 ?auto_90267 ) ) ( not ( = ?auto_90269 ?auto_90265 ) ) ( not ( = ?auto_90269 ?auto_90264 ) ) ( not ( = ?auto_90268 ?auto_90267 ) ) ( not ( = ?auto_90268 ?auto_90265 ) ) ( not ( = ?auto_90268 ?auto_90264 ) ) ( not ( = ?auto_90262 ?auto_90266 ) ) ( not ( = ?auto_90262 ?auto_90269 ) ) ( not ( = ?auto_90262 ?auto_90268 ) ) ( not ( = ?auto_90263 ?auto_90266 ) ) ( not ( = ?auto_90263 ?auto_90269 ) ) ( not ( = ?auto_90263 ?auto_90268 ) ) ( ON ?auto_90263 ?auto_90264 ) ( ON ?auto_90262 ?auto_90263 ) ( CLEAR ?auto_90262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90266 ?auto_90269 ?auto_90268 ?auto_90267 ?auto_90265 ?auto_90264 ?auto_90263 )
      ( MAKE-4PILE ?auto_90262 ?auto_90263 ?auto_90264 ?auto_90265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90273 - BLOCK
      ?auto_90274 - BLOCK
      ?auto_90275 - BLOCK
    )
    :vars
    (
      ?auto_90276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90276 ?auto_90275 ) ( CLEAR ?auto_90276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90273 ) ( ON ?auto_90274 ?auto_90273 ) ( ON ?auto_90275 ?auto_90274 ) ( not ( = ?auto_90273 ?auto_90274 ) ) ( not ( = ?auto_90273 ?auto_90275 ) ) ( not ( = ?auto_90273 ?auto_90276 ) ) ( not ( = ?auto_90274 ?auto_90275 ) ) ( not ( = ?auto_90274 ?auto_90276 ) ) ( not ( = ?auto_90275 ?auto_90276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90276 ?auto_90275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90277 - BLOCK
      ?auto_90278 - BLOCK
      ?auto_90279 - BLOCK
    )
    :vars
    (
      ?auto_90280 - BLOCK
      ?auto_90281 - BLOCK
      ?auto_90282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90280 ?auto_90279 ) ( CLEAR ?auto_90280 ) ( ON-TABLE ?auto_90277 ) ( ON ?auto_90278 ?auto_90277 ) ( ON ?auto_90279 ?auto_90278 ) ( not ( = ?auto_90277 ?auto_90278 ) ) ( not ( = ?auto_90277 ?auto_90279 ) ) ( not ( = ?auto_90277 ?auto_90280 ) ) ( not ( = ?auto_90278 ?auto_90279 ) ) ( not ( = ?auto_90278 ?auto_90280 ) ) ( not ( = ?auto_90279 ?auto_90280 ) ) ( HOLDING ?auto_90281 ) ( CLEAR ?auto_90282 ) ( not ( = ?auto_90277 ?auto_90281 ) ) ( not ( = ?auto_90277 ?auto_90282 ) ) ( not ( = ?auto_90278 ?auto_90281 ) ) ( not ( = ?auto_90278 ?auto_90282 ) ) ( not ( = ?auto_90279 ?auto_90281 ) ) ( not ( = ?auto_90279 ?auto_90282 ) ) ( not ( = ?auto_90280 ?auto_90281 ) ) ( not ( = ?auto_90280 ?auto_90282 ) ) ( not ( = ?auto_90281 ?auto_90282 ) ) )
    :subtasks
    ( ( !STACK ?auto_90281 ?auto_90282 )
      ( MAKE-3PILE ?auto_90277 ?auto_90278 ?auto_90279 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90283 - BLOCK
      ?auto_90284 - BLOCK
      ?auto_90285 - BLOCK
    )
    :vars
    (
      ?auto_90287 - BLOCK
      ?auto_90288 - BLOCK
      ?auto_90286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90287 ?auto_90285 ) ( ON-TABLE ?auto_90283 ) ( ON ?auto_90284 ?auto_90283 ) ( ON ?auto_90285 ?auto_90284 ) ( not ( = ?auto_90283 ?auto_90284 ) ) ( not ( = ?auto_90283 ?auto_90285 ) ) ( not ( = ?auto_90283 ?auto_90287 ) ) ( not ( = ?auto_90284 ?auto_90285 ) ) ( not ( = ?auto_90284 ?auto_90287 ) ) ( not ( = ?auto_90285 ?auto_90287 ) ) ( CLEAR ?auto_90288 ) ( not ( = ?auto_90283 ?auto_90286 ) ) ( not ( = ?auto_90283 ?auto_90288 ) ) ( not ( = ?auto_90284 ?auto_90286 ) ) ( not ( = ?auto_90284 ?auto_90288 ) ) ( not ( = ?auto_90285 ?auto_90286 ) ) ( not ( = ?auto_90285 ?auto_90288 ) ) ( not ( = ?auto_90287 ?auto_90286 ) ) ( not ( = ?auto_90287 ?auto_90288 ) ) ( not ( = ?auto_90286 ?auto_90288 ) ) ( ON ?auto_90286 ?auto_90287 ) ( CLEAR ?auto_90286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90283 ?auto_90284 ?auto_90285 ?auto_90287 )
      ( MAKE-3PILE ?auto_90283 ?auto_90284 ?auto_90285 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90289 - BLOCK
      ?auto_90290 - BLOCK
      ?auto_90291 - BLOCK
    )
    :vars
    (
      ?auto_90294 - BLOCK
      ?auto_90292 - BLOCK
      ?auto_90293 - BLOCK
      ?auto_90296 - BLOCK
      ?auto_90295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90294 ?auto_90291 ) ( ON-TABLE ?auto_90289 ) ( ON ?auto_90290 ?auto_90289 ) ( ON ?auto_90291 ?auto_90290 ) ( not ( = ?auto_90289 ?auto_90290 ) ) ( not ( = ?auto_90289 ?auto_90291 ) ) ( not ( = ?auto_90289 ?auto_90294 ) ) ( not ( = ?auto_90290 ?auto_90291 ) ) ( not ( = ?auto_90290 ?auto_90294 ) ) ( not ( = ?auto_90291 ?auto_90294 ) ) ( not ( = ?auto_90289 ?auto_90292 ) ) ( not ( = ?auto_90289 ?auto_90293 ) ) ( not ( = ?auto_90290 ?auto_90292 ) ) ( not ( = ?auto_90290 ?auto_90293 ) ) ( not ( = ?auto_90291 ?auto_90292 ) ) ( not ( = ?auto_90291 ?auto_90293 ) ) ( not ( = ?auto_90294 ?auto_90292 ) ) ( not ( = ?auto_90294 ?auto_90293 ) ) ( not ( = ?auto_90292 ?auto_90293 ) ) ( ON ?auto_90292 ?auto_90294 ) ( CLEAR ?auto_90292 ) ( HOLDING ?auto_90293 ) ( CLEAR ?auto_90296 ) ( ON-TABLE ?auto_90295 ) ( ON ?auto_90296 ?auto_90295 ) ( not ( = ?auto_90295 ?auto_90296 ) ) ( not ( = ?auto_90295 ?auto_90293 ) ) ( not ( = ?auto_90296 ?auto_90293 ) ) ( not ( = ?auto_90289 ?auto_90296 ) ) ( not ( = ?auto_90289 ?auto_90295 ) ) ( not ( = ?auto_90290 ?auto_90296 ) ) ( not ( = ?auto_90290 ?auto_90295 ) ) ( not ( = ?auto_90291 ?auto_90296 ) ) ( not ( = ?auto_90291 ?auto_90295 ) ) ( not ( = ?auto_90294 ?auto_90296 ) ) ( not ( = ?auto_90294 ?auto_90295 ) ) ( not ( = ?auto_90292 ?auto_90296 ) ) ( not ( = ?auto_90292 ?auto_90295 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90295 ?auto_90296 ?auto_90293 )
      ( MAKE-3PILE ?auto_90289 ?auto_90290 ?auto_90291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90297 - BLOCK
      ?auto_90298 - BLOCK
      ?auto_90299 - BLOCK
    )
    :vars
    (
      ?auto_90304 - BLOCK
      ?auto_90303 - BLOCK
      ?auto_90301 - BLOCK
      ?auto_90300 - BLOCK
      ?auto_90302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90304 ?auto_90299 ) ( ON-TABLE ?auto_90297 ) ( ON ?auto_90298 ?auto_90297 ) ( ON ?auto_90299 ?auto_90298 ) ( not ( = ?auto_90297 ?auto_90298 ) ) ( not ( = ?auto_90297 ?auto_90299 ) ) ( not ( = ?auto_90297 ?auto_90304 ) ) ( not ( = ?auto_90298 ?auto_90299 ) ) ( not ( = ?auto_90298 ?auto_90304 ) ) ( not ( = ?auto_90299 ?auto_90304 ) ) ( not ( = ?auto_90297 ?auto_90303 ) ) ( not ( = ?auto_90297 ?auto_90301 ) ) ( not ( = ?auto_90298 ?auto_90303 ) ) ( not ( = ?auto_90298 ?auto_90301 ) ) ( not ( = ?auto_90299 ?auto_90303 ) ) ( not ( = ?auto_90299 ?auto_90301 ) ) ( not ( = ?auto_90304 ?auto_90303 ) ) ( not ( = ?auto_90304 ?auto_90301 ) ) ( not ( = ?auto_90303 ?auto_90301 ) ) ( ON ?auto_90303 ?auto_90304 ) ( CLEAR ?auto_90300 ) ( ON-TABLE ?auto_90302 ) ( ON ?auto_90300 ?auto_90302 ) ( not ( = ?auto_90302 ?auto_90300 ) ) ( not ( = ?auto_90302 ?auto_90301 ) ) ( not ( = ?auto_90300 ?auto_90301 ) ) ( not ( = ?auto_90297 ?auto_90300 ) ) ( not ( = ?auto_90297 ?auto_90302 ) ) ( not ( = ?auto_90298 ?auto_90300 ) ) ( not ( = ?auto_90298 ?auto_90302 ) ) ( not ( = ?auto_90299 ?auto_90300 ) ) ( not ( = ?auto_90299 ?auto_90302 ) ) ( not ( = ?auto_90304 ?auto_90300 ) ) ( not ( = ?auto_90304 ?auto_90302 ) ) ( not ( = ?auto_90303 ?auto_90300 ) ) ( not ( = ?auto_90303 ?auto_90302 ) ) ( ON ?auto_90301 ?auto_90303 ) ( CLEAR ?auto_90301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90297 ?auto_90298 ?auto_90299 ?auto_90304 ?auto_90303 )
      ( MAKE-3PILE ?auto_90297 ?auto_90298 ?auto_90299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90305 - BLOCK
      ?auto_90306 - BLOCK
      ?auto_90307 - BLOCK
    )
    :vars
    (
      ?auto_90308 - BLOCK
      ?auto_90312 - BLOCK
      ?auto_90310 - BLOCK
      ?auto_90309 - BLOCK
      ?auto_90311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90308 ?auto_90307 ) ( ON-TABLE ?auto_90305 ) ( ON ?auto_90306 ?auto_90305 ) ( ON ?auto_90307 ?auto_90306 ) ( not ( = ?auto_90305 ?auto_90306 ) ) ( not ( = ?auto_90305 ?auto_90307 ) ) ( not ( = ?auto_90305 ?auto_90308 ) ) ( not ( = ?auto_90306 ?auto_90307 ) ) ( not ( = ?auto_90306 ?auto_90308 ) ) ( not ( = ?auto_90307 ?auto_90308 ) ) ( not ( = ?auto_90305 ?auto_90312 ) ) ( not ( = ?auto_90305 ?auto_90310 ) ) ( not ( = ?auto_90306 ?auto_90312 ) ) ( not ( = ?auto_90306 ?auto_90310 ) ) ( not ( = ?auto_90307 ?auto_90312 ) ) ( not ( = ?auto_90307 ?auto_90310 ) ) ( not ( = ?auto_90308 ?auto_90312 ) ) ( not ( = ?auto_90308 ?auto_90310 ) ) ( not ( = ?auto_90312 ?auto_90310 ) ) ( ON ?auto_90312 ?auto_90308 ) ( ON-TABLE ?auto_90309 ) ( not ( = ?auto_90309 ?auto_90311 ) ) ( not ( = ?auto_90309 ?auto_90310 ) ) ( not ( = ?auto_90311 ?auto_90310 ) ) ( not ( = ?auto_90305 ?auto_90311 ) ) ( not ( = ?auto_90305 ?auto_90309 ) ) ( not ( = ?auto_90306 ?auto_90311 ) ) ( not ( = ?auto_90306 ?auto_90309 ) ) ( not ( = ?auto_90307 ?auto_90311 ) ) ( not ( = ?auto_90307 ?auto_90309 ) ) ( not ( = ?auto_90308 ?auto_90311 ) ) ( not ( = ?auto_90308 ?auto_90309 ) ) ( not ( = ?auto_90312 ?auto_90311 ) ) ( not ( = ?auto_90312 ?auto_90309 ) ) ( ON ?auto_90310 ?auto_90312 ) ( CLEAR ?auto_90310 ) ( HOLDING ?auto_90311 ) ( CLEAR ?auto_90309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90309 ?auto_90311 )
      ( MAKE-3PILE ?auto_90305 ?auto_90306 ?auto_90307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90313 - BLOCK
      ?auto_90314 - BLOCK
      ?auto_90315 - BLOCK
    )
    :vars
    (
      ?auto_90320 - BLOCK
      ?auto_90317 - BLOCK
      ?auto_90319 - BLOCK
      ?auto_90318 - BLOCK
      ?auto_90316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90320 ?auto_90315 ) ( ON-TABLE ?auto_90313 ) ( ON ?auto_90314 ?auto_90313 ) ( ON ?auto_90315 ?auto_90314 ) ( not ( = ?auto_90313 ?auto_90314 ) ) ( not ( = ?auto_90313 ?auto_90315 ) ) ( not ( = ?auto_90313 ?auto_90320 ) ) ( not ( = ?auto_90314 ?auto_90315 ) ) ( not ( = ?auto_90314 ?auto_90320 ) ) ( not ( = ?auto_90315 ?auto_90320 ) ) ( not ( = ?auto_90313 ?auto_90317 ) ) ( not ( = ?auto_90313 ?auto_90319 ) ) ( not ( = ?auto_90314 ?auto_90317 ) ) ( not ( = ?auto_90314 ?auto_90319 ) ) ( not ( = ?auto_90315 ?auto_90317 ) ) ( not ( = ?auto_90315 ?auto_90319 ) ) ( not ( = ?auto_90320 ?auto_90317 ) ) ( not ( = ?auto_90320 ?auto_90319 ) ) ( not ( = ?auto_90317 ?auto_90319 ) ) ( ON ?auto_90317 ?auto_90320 ) ( ON-TABLE ?auto_90318 ) ( not ( = ?auto_90318 ?auto_90316 ) ) ( not ( = ?auto_90318 ?auto_90319 ) ) ( not ( = ?auto_90316 ?auto_90319 ) ) ( not ( = ?auto_90313 ?auto_90316 ) ) ( not ( = ?auto_90313 ?auto_90318 ) ) ( not ( = ?auto_90314 ?auto_90316 ) ) ( not ( = ?auto_90314 ?auto_90318 ) ) ( not ( = ?auto_90315 ?auto_90316 ) ) ( not ( = ?auto_90315 ?auto_90318 ) ) ( not ( = ?auto_90320 ?auto_90316 ) ) ( not ( = ?auto_90320 ?auto_90318 ) ) ( not ( = ?auto_90317 ?auto_90316 ) ) ( not ( = ?auto_90317 ?auto_90318 ) ) ( ON ?auto_90319 ?auto_90317 ) ( CLEAR ?auto_90318 ) ( ON ?auto_90316 ?auto_90319 ) ( CLEAR ?auto_90316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90313 ?auto_90314 ?auto_90315 ?auto_90320 ?auto_90317 ?auto_90319 )
      ( MAKE-3PILE ?auto_90313 ?auto_90314 ?auto_90315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90321 - BLOCK
      ?auto_90322 - BLOCK
      ?auto_90323 - BLOCK
    )
    :vars
    (
      ?auto_90327 - BLOCK
      ?auto_90325 - BLOCK
      ?auto_90326 - BLOCK
      ?auto_90328 - BLOCK
      ?auto_90324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90327 ?auto_90323 ) ( ON-TABLE ?auto_90321 ) ( ON ?auto_90322 ?auto_90321 ) ( ON ?auto_90323 ?auto_90322 ) ( not ( = ?auto_90321 ?auto_90322 ) ) ( not ( = ?auto_90321 ?auto_90323 ) ) ( not ( = ?auto_90321 ?auto_90327 ) ) ( not ( = ?auto_90322 ?auto_90323 ) ) ( not ( = ?auto_90322 ?auto_90327 ) ) ( not ( = ?auto_90323 ?auto_90327 ) ) ( not ( = ?auto_90321 ?auto_90325 ) ) ( not ( = ?auto_90321 ?auto_90326 ) ) ( not ( = ?auto_90322 ?auto_90325 ) ) ( not ( = ?auto_90322 ?auto_90326 ) ) ( not ( = ?auto_90323 ?auto_90325 ) ) ( not ( = ?auto_90323 ?auto_90326 ) ) ( not ( = ?auto_90327 ?auto_90325 ) ) ( not ( = ?auto_90327 ?auto_90326 ) ) ( not ( = ?auto_90325 ?auto_90326 ) ) ( ON ?auto_90325 ?auto_90327 ) ( not ( = ?auto_90328 ?auto_90324 ) ) ( not ( = ?auto_90328 ?auto_90326 ) ) ( not ( = ?auto_90324 ?auto_90326 ) ) ( not ( = ?auto_90321 ?auto_90324 ) ) ( not ( = ?auto_90321 ?auto_90328 ) ) ( not ( = ?auto_90322 ?auto_90324 ) ) ( not ( = ?auto_90322 ?auto_90328 ) ) ( not ( = ?auto_90323 ?auto_90324 ) ) ( not ( = ?auto_90323 ?auto_90328 ) ) ( not ( = ?auto_90327 ?auto_90324 ) ) ( not ( = ?auto_90327 ?auto_90328 ) ) ( not ( = ?auto_90325 ?auto_90324 ) ) ( not ( = ?auto_90325 ?auto_90328 ) ) ( ON ?auto_90326 ?auto_90325 ) ( ON ?auto_90324 ?auto_90326 ) ( CLEAR ?auto_90324 ) ( HOLDING ?auto_90328 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90328 )
      ( MAKE-3PILE ?auto_90321 ?auto_90322 ?auto_90323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_90329 - BLOCK
      ?auto_90330 - BLOCK
      ?auto_90331 - BLOCK
    )
    :vars
    (
      ?auto_90335 - BLOCK
      ?auto_90332 - BLOCK
      ?auto_90333 - BLOCK
      ?auto_90334 - BLOCK
      ?auto_90336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90335 ?auto_90331 ) ( ON-TABLE ?auto_90329 ) ( ON ?auto_90330 ?auto_90329 ) ( ON ?auto_90331 ?auto_90330 ) ( not ( = ?auto_90329 ?auto_90330 ) ) ( not ( = ?auto_90329 ?auto_90331 ) ) ( not ( = ?auto_90329 ?auto_90335 ) ) ( not ( = ?auto_90330 ?auto_90331 ) ) ( not ( = ?auto_90330 ?auto_90335 ) ) ( not ( = ?auto_90331 ?auto_90335 ) ) ( not ( = ?auto_90329 ?auto_90332 ) ) ( not ( = ?auto_90329 ?auto_90333 ) ) ( not ( = ?auto_90330 ?auto_90332 ) ) ( not ( = ?auto_90330 ?auto_90333 ) ) ( not ( = ?auto_90331 ?auto_90332 ) ) ( not ( = ?auto_90331 ?auto_90333 ) ) ( not ( = ?auto_90335 ?auto_90332 ) ) ( not ( = ?auto_90335 ?auto_90333 ) ) ( not ( = ?auto_90332 ?auto_90333 ) ) ( ON ?auto_90332 ?auto_90335 ) ( not ( = ?auto_90334 ?auto_90336 ) ) ( not ( = ?auto_90334 ?auto_90333 ) ) ( not ( = ?auto_90336 ?auto_90333 ) ) ( not ( = ?auto_90329 ?auto_90336 ) ) ( not ( = ?auto_90329 ?auto_90334 ) ) ( not ( = ?auto_90330 ?auto_90336 ) ) ( not ( = ?auto_90330 ?auto_90334 ) ) ( not ( = ?auto_90331 ?auto_90336 ) ) ( not ( = ?auto_90331 ?auto_90334 ) ) ( not ( = ?auto_90335 ?auto_90336 ) ) ( not ( = ?auto_90335 ?auto_90334 ) ) ( not ( = ?auto_90332 ?auto_90336 ) ) ( not ( = ?auto_90332 ?auto_90334 ) ) ( ON ?auto_90333 ?auto_90332 ) ( ON ?auto_90336 ?auto_90333 ) ( ON ?auto_90334 ?auto_90336 ) ( CLEAR ?auto_90334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90329 ?auto_90330 ?auto_90331 ?auto_90335 ?auto_90332 ?auto_90333 ?auto_90336 )
      ( MAKE-3PILE ?auto_90329 ?auto_90330 ?auto_90331 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90342 - BLOCK
      ?auto_90343 - BLOCK
      ?auto_90344 - BLOCK
      ?auto_90345 - BLOCK
      ?auto_90346 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90346 ) ( CLEAR ?auto_90345 ) ( ON-TABLE ?auto_90342 ) ( ON ?auto_90343 ?auto_90342 ) ( ON ?auto_90344 ?auto_90343 ) ( ON ?auto_90345 ?auto_90344 ) ( not ( = ?auto_90342 ?auto_90343 ) ) ( not ( = ?auto_90342 ?auto_90344 ) ) ( not ( = ?auto_90342 ?auto_90345 ) ) ( not ( = ?auto_90342 ?auto_90346 ) ) ( not ( = ?auto_90343 ?auto_90344 ) ) ( not ( = ?auto_90343 ?auto_90345 ) ) ( not ( = ?auto_90343 ?auto_90346 ) ) ( not ( = ?auto_90344 ?auto_90345 ) ) ( not ( = ?auto_90344 ?auto_90346 ) ) ( not ( = ?auto_90345 ?auto_90346 ) ) )
    :subtasks
    ( ( !STACK ?auto_90346 ?auto_90345 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90347 - BLOCK
      ?auto_90348 - BLOCK
      ?auto_90349 - BLOCK
      ?auto_90350 - BLOCK
      ?auto_90351 - BLOCK
    )
    :vars
    (
      ?auto_90352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90350 ) ( ON-TABLE ?auto_90347 ) ( ON ?auto_90348 ?auto_90347 ) ( ON ?auto_90349 ?auto_90348 ) ( ON ?auto_90350 ?auto_90349 ) ( not ( = ?auto_90347 ?auto_90348 ) ) ( not ( = ?auto_90347 ?auto_90349 ) ) ( not ( = ?auto_90347 ?auto_90350 ) ) ( not ( = ?auto_90347 ?auto_90351 ) ) ( not ( = ?auto_90348 ?auto_90349 ) ) ( not ( = ?auto_90348 ?auto_90350 ) ) ( not ( = ?auto_90348 ?auto_90351 ) ) ( not ( = ?auto_90349 ?auto_90350 ) ) ( not ( = ?auto_90349 ?auto_90351 ) ) ( not ( = ?auto_90350 ?auto_90351 ) ) ( ON ?auto_90351 ?auto_90352 ) ( CLEAR ?auto_90351 ) ( HAND-EMPTY ) ( not ( = ?auto_90347 ?auto_90352 ) ) ( not ( = ?auto_90348 ?auto_90352 ) ) ( not ( = ?auto_90349 ?auto_90352 ) ) ( not ( = ?auto_90350 ?auto_90352 ) ) ( not ( = ?auto_90351 ?auto_90352 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90351 ?auto_90352 )
      ( MAKE-5PILE ?auto_90347 ?auto_90348 ?auto_90349 ?auto_90350 ?auto_90351 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90353 - BLOCK
      ?auto_90354 - BLOCK
      ?auto_90355 - BLOCK
      ?auto_90356 - BLOCK
      ?auto_90357 - BLOCK
    )
    :vars
    (
      ?auto_90358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90353 ) ( ON ?auto_90354 ?auto_90353 ) ( ON ?auto_90355 ?auto_90354 ) ( not ( = ?auto_90353 ?auto_90354 ) ) ( not ( = ?auto_90353 ?auto_90355 ) ) ( not ( = ?auto_90353 ?auto_90356 ) ) ( not ( = ?auto_90353 ?auto_90357 ) ) ( not ( = ?auto_90354 ?auto_90355 ) ) ( not ( = ?auto_90354 ?auto_90356 ) ) ( not ( = ?auto_90354 ?auto_90357 ) ) ( not ( = ?auto_90355 ?auto_90356 ) ) ( not ( = ?auto_90355 ?auto_90357 ) ) ( not ( = ?auto_90356 ?auto_90357 ) ) ( ON ?auto_90357 ?auto_90358 ) ( CLEAR ?auto_90357 ) ( not ( = ?auto_90353 ?auto_90358 ) ) ( not ( = ?auto_90354 ?auto_90358 ) ) ( not ( = ?auto_90355 ?auto_90358 ) ) ( not ( = ?auto_90356 ?auto_90358 ) ) ( not ( = ?auto_90357 ?auto_90358 ) ) ( HOLDING ?auto_90356 ) ( CLEAR ?auto_90355 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90353 ?auto_90354 ?auto_90355 ?auto_90356 )
      ( MAKE-5PILE ?auto_90353 ?auto_90354 ?auto_90355 ?auto_90356 ?auto_90357 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90359 - BLOCK
      ?auto_90360 - BLOCK
      ?auto_90361 - BLOCK
      ?auto_90362 - BLOCK
      ?auto_90363 - BLOCK
    )
    :vars
    (
      ?auto_90364 - BLOCK
      ?auto_90365 - BLOCK
      ?auto_90366 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90359 ) ( ON ?auto_90360 ?auto_90359 ) ( ON ?auto_90361 ?auto_90360 ) ( not ( = ?auto_90359 ?auto_90360 ) ) ( not ( = ?auto_90359 ?auto_90361 ) ) ( not ( = ?auto_90359 ?auto_90362 ) ) ( not ( = ?auto_90359 ?auto_90363 ) ) ( not ( = ?auto_90360 ?auto_90361 ) ) ( not ( = ?auto_90360 ?auto_90362 ) ) ( not ( = ?auto_90360 ?auto_90363 ) ) ( not ( = ?auto_90361 ?auto_90362 ) ) ( not ( = ?auto_90361 ?auto_90363 ) ) ( not ( = ?auto_90362 ?auto_90363 ) ) ( ON ?auto_90363 ?auto_90364 ) ( not ( = ?auto_90359 ?auto_90364 ) ) ( not ( = ?auto_90360 ?auto_90364 ) ) ( not ( = ?auto_90361 ?auto_90364 ) ) ( not ( = ?auto_90362 ?auto_90364 ) ) ( not ( = ?auto_90363 ?auto_90364 ) ) ( CLEAR ?auto_90361 ) ( ON ?auto_90362 ?auto_90363 ) ( CLEAR ?auto_90362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90365 ) ( ON ?auto_90366 ?auto_90365 ) ( ON ?auto_90364 ?auto_90366 ) ( not ( = ?auto_90365 ?auto_90366 ) ) ( not ( = ?auto_90365 ?auto_90364 ) ) ( not ( = ?auto_90365 ?auto_90363 ) ) ( not ( = ?auto_90365 ?auto_90362 ) ) ( not ( = ?auto_90366 ?auto_90364 ) ) ( not ( = ?auto_90366 ?auto_90363 ) ) ( not ( = ?auto_90366 ?auto_90362 ) ) ( not ( = ?auto_90359 ?auto_90365 ) ) ( not ( = ?auto_90359 ?auto_90366 ) ) ( not ( = ?auto_90360 ?auto_90365 ) ) ( not ( = ?auto_90360 ?auto_90366 ) ) ( not ( = ?auto_90361 ?auto_90365 ) ) ( not ( = ?auto_90361 ?auto_90366 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90365 ?auto_90366 ?auto_90364 ?auto_90363 )
      ( MAKE-5PILE ?auto_90359 ?auto_90360 ?auto_90361 ?auto_90362 ?auto_90363 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90367 - BLOCK
      ?auto_90368 - BLOCK
      ?auto_90369 - BLOCK
      ?auto_90370 - BLOCK
      ?auto_90371 - BLOCK
    )
    :vars
    (
      ?auto_90373 - BLOCK
      ?auto_90374 - BLOCK
      ?auto_90372 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90367 ) ( ON ?auto_90368 ?auto_90367 ) ( not ( = ?auto_90367 ?auto_90368 ) ) ( not ( = ?auto_90367 ?auto_90369 ) ) ( not ( = ?auto_90367 ?auto_90370 ) ) ( not ( = ?auto_90367 ?auto_90371 ) ) ( not ( = ?auto_90368 ?auto_90369 ) ) ( not ( = ?auto_90368 ?auto_90370 ) ) ( not ( = ?auto_90368 ?auto_90371 ) ) ( not ( = ?auto_90369 ?auto_90370 ) ) ( not ( = ?auto_90369 ?auto_90371 ) ) ( not ( = ?auto_90370 ?auto_90371 ) ) ( ON ?auto_90371 ?auto_90373 ) ( not ( = ?auto_90367 ?auto_90373 ) ) ( not ( = ?auto_90368 ?auto_90373 ) ) ( not ( = ?auto_90369 ?auto_90373 ) ) ( not ( = ?auto_90370 ?auto_90373 ) ) ( not ( = ?auto_90371 ?auto_90373 ) ) ( ON ?auto_90370 ?auto_90371 ) ( CLEAR ?auto_90370 ) ( ON-TABLE ?auto_90374 ) ( ON ?auto_90372 ?auto_90374 ) ( ON ?auto_90373 ?auto_90372 ) ( not ( = ?auto_90374 ?auto_90372 ) ) ( not ( = ?auto_90374 ?auto_90373 ) ) ( not ( = ?auto_90374 ?auto_90371 ) ) ( not ( = ?auto_90374 ?auto_90370 ) ) ( not ( = ?auto_90372 ?auto_90373 ) ) ( not ( = ?auto_90372 ?auto_90371 ) ) ( not ( = ?auto_90372 ?auto_90370 ) ) ( not ( = ?auto_90367 ?auto_90374 ) ) ( not ( = ?auto_90367 ?auto_90372 ) ) ( not ( = ?auto_90368 ?auto_90374 ) ) ( not ( = ?auto_90368 ?auto_90372 ) ) ( not ( = ?auto_90369 ?auto_90374 ) ) ( not ( = ?auto_90369 ?auto_90372 ) ) ( HOLDING ?auto_90369 ) ( CLEAR ?auto_90368 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90367 ?auto_90368 ?auto_90369 )
      ( MAKE-5PILE ?auto_90367 ?auto_90368 ?auto_90369 ?auto_90370 ?auto_90371 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90375 - BLOCK
      ?auto_90376 - BLOCK
      ?auto_90377 - BLOCK
      ?auto_90378 - BLOCK
      ?auto_90379 - BLOCK
    )
    :vars
    (
      ?auto_90382 - BLOCK
      ?auto_90380 - BLOCK
      ?auto_90381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90375 ) ( ON ?auto_90376 ?auto_90375 ) ( not ( = ?auto_90375 ?auto_90376 ) ) ( not ( = ?auto_90375 ?auto_90377 ) ) ( not ( = ?auto_90375 ?auto_90378 ) ) ( not ( = ?auto_90375 ?auto_90379 ) ) ( not ( = ?auto_90376 ?auto_90377 ) ) ( not ( = ?auto_90376 ?auto_90378 ) ) ( not ( = ?auto_90376 ?auto_90379 ) ) ( not ( = ?auto_90377 ?auto_90378 ) ) ( not ( = ?auto_90377 ?auto_90379 ) ) ( not ( = ?auto_90378 ?auto_90379 ) ) ( ON ?auto_90379 ?auto_90382 ) ( not ( = ?auto_90375 ?auto_90382 ) ) ( not ( = ?auto_90376 ?auto_90382 ) ) ( not ( = ?auto_90377 ?auto_90382 ) ) ( not ( = ?auto_90378 ?auto_90382 ) ) ( not ( = ?auto_90379 ?auto_90382 ) ) ( ON ?auto_90378 ?auto_90379 ) ( ON-TABLE ?auto_90380 ) ( ON ?auto_90381 ?auto_90380 ) ( ON ?auto_90382 ?auto_90381 ) ( not ( = ?auto_90380 ?auto_90381 ) ) ( not ( = ?auto_90380 ?auto_90382 ) ) ( not ( = ?auto_90380 ?auto_90379 ) ) ( not ( = ?auto_90380 ?auto_90378 ) ) ( not ( = ?auto_90381 ?auto_90382 ) ) ( not ( = ?auto_90381 ?auto_90379 ) ) ( not ( = ?auto_90381 ?auto_90378 ) ) ( not ( = ?auto_90375 ?auto_90380 ) ) ( not ( = ?auto_90375 ?auto_90381 ) ) ( not ( = ?auto_90376 ?auto_90380 ) ) ( not ( = ?auto_90376 ?auto_90381 ) ) ( not ( = ?auto_90377 ?auto_90380 ) ) ( not ( = ?auto_90377 ?auto_90381 ) ) ( CLEAR ?auto_90376 ) ( ON ?auto_90377 ?auto_90378 ) ( CLEAR ?auto_90377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90380 ?auto_90381 ?auto_90382 ?auto_90379 ?auto_90378 )
      ( MAKE-5PILE ?auto_90375 ?auto_90376 ?auto_90377 ?auto_90378 ?auto_90379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90383 - BLOCK
      ?auto_90384 - BLOCK
      ?auto_90385 - BLOCK
      ?auto_90386 - BLOCK
      ?auto_90387 - BLOCK
    )
    :vars
    (
      ?auto_90388 - BLOCK
      ?auto_90390 - BLOCK
      ?auto_90389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90383 ) ( not ( = ?auto_90383 ?auto_90384 ) ) ( not ( = ?auto_90383 ?auto_90385 ) ) ( not ( = ?auto_90383 ?auto_90386 ) ) ( not ( = ?auto_90383 ?auto_90387 ) ) ( not ( = ?auto_90384 ?auto_90385 ) ) ( not ( = ?auto_90384 ?auto_90386 ) ) ( not ( = ?auto_90384 ?auto_90387 ) ) ( not ( = ?auto_90385 ?auto_90386 ) ) ( not ( = ?auto_90385 ?auto_90387 ) ) ( not ( = ?auto_90386 ?auto_90387 ) ) ( ON ?auto_90387 ?auto_90388 ) ( not ( = ?auto_90383 ?auto_90388 ) ) ( not ( = ?auto_90384 ?auto_90388 ) ) ( not ( = ?auto_90385 ?auto_90388 ) ) ( not ( = ?auto_90386 ?auto_90388 ) ) ( not ( = ?auto_90387 ?auto_90388 ) ) ( ON ?auto_90386 ?auto_90387 ) ( ON-TABLE ?auto_90390 ) ( ON ?auto_90389 ?auto_90390 ) ( ON ?auto_90388 ?auto_90389 ) ( not ( = ?auto_90390 ?auto_90389 ) ) ( not ( = ?auto_90390 ?auto_90388 ) ) ( not ( = ?auto_90390 ?auto_90387 ) ) ( not ( = ?auto_90390 ?auto_90386 ) ) ( not ( = ?auto_90389 ?auto_90388 ) ) ( not ( = ?auto_90389 ?auto_90387 ) ) ( not ( = ?auto_90389 ?auto_90386 ) ) ( not ( = ?auto_90383 ?auto_90390 ) ) ( not ( = ?auto_90383 ?auto_90389 ) ) ( not ( = ?auto_90384 ?auto_90390 ) ) ( not ( = ?auto_90384 ?auto_90389 ) ) ( not ( = ?auto_90385 ?auto_90390 ) ) ( not ( = ?auto_90385 ?auto_90389 ) ) ( ON ?auto_90385 ?auto_90386 ) ( CLEAR ?auto_90385 ) ( HOLDING ?auto_90384 ) ( CLEAR ?auto_90383 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90383 ?auto_90384 )
      ( MAKE-5PILE ?auto_90383 ?auto_90384 ?auto_90385 ?auto_90386 ?auto_90387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90391 - BLOCK
      ?auto_90392 - BLOCK
      ?auto_90393 - BLOCK
      ?auto_90394 - BLOCK
      ?auto_90395 - BLOCK
    )
    :vars
    (
      ?auto_90396 - BLOCK
      ?auto_90397 - BLOCK
      ?auto_90398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90391 ) ( not ( = ?auto_90391 ?auto_90392 ) ) ( not ( = ?auto_90391 ?auto_90393 ) ) ( not ( = ?auto_90391 ?auto_90394 ) ) ( not ( = ?auto_90391 ?auto_90395 ) ) ( not ( = ?auto_90392 ?auto_90393 ) ) ( not ( = ?auto_90392 ?auto_90394 ) ) ( not ( = ?auto_90392 ?auto_90395 ) ) ( not ( = ?auto_90393 ?auto_90394 ) ) ( not ( = ?auto_90393 ?auto_90395 ) ) ( not ( = ?auto_90394 ?auto_90395 ) ) ( ON ?auto_90395 ?auto_90396 ) ( not ( = ?auto_90391 ?auto_90396 ) ) ( not ( = ?auto_90392 ?auto_90396 ) ) ( not ( = ?auto_90393 ?auto_90396 ) ) ( not ( = ?auto_90394 ?auto_90396 ) ) ( not ( = ?auto_90395 ?auto_90396 ) ) ( ON ?auto_90394 ?auto_90395 ) ( ON-TABLE ?auto_90397 ) ( ON ?auto_90398 ?auto_90397 ) ( ON ?auto_90396 ?auto_90398 ) ( not ( = ?auto_90397 ?auto_90398 ) ) ( not ( = ?auto_90397 ?auto_90396 ) ) ( not ( = ?auto_90397 ?auto_90395 ) ) ( not ( = ?auto_90397 ?auto_90394 ) ) ( not ( = ?auto_90398 ?auto_90396 ) ) ( not ( = ?auto_90398 ?auto_90395 ) ) ( not ( = ?auto_90398 ?auto_90394 ) ) ( not ( = ?auto_90391 ?auto_90397 ) ) ( not ( = ?auto_90391 ?auto_90398 ) ) ( not ( = ?auto_90392 ?auto_90397 ) ) ( not ( = ?auto_90392 ?auto_90398 ) ) ( not ( = ?auto_90393 ?auto_90397 ) ) ( not ( = ?auto_90393 ?auto_90398 ) ) ( ON ?auto_90393 ?auto_90394 ) ( CLEAR ?auto_90391 ) ( ON ?auto_90392 ?auto_90393 ) ( CLEAR ?auto_90392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90397 ?auto_90398 ?auto_90396 ?auto_90395 ?auto_90394 ?auto_90393 )
      ( MAKE-5PILE ?auto_90391 ?auto_90392 ?auto_90393 ?auto_90394 ?auto_90395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90399 - BLOCK
      ?auto_90400 - BLOCK
      ?auto_90401 - BLOCK
      ?auto_90402 - BLOCK
      ?auto_90403 - BLOCK
    )
    :vars
    (
      ?auto_90405 - BLOCK
      ?auto_90406 - BLOCK
      ?auto_90404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90399 ?auto_90400 ) ) ( not ( = ?auto_90399 ?auto_90401 ) ) ( not ( = ?auto_90399 ?auto_90402 ) ) ( not ( = ?auto_90399 ?auto_90403 ) ) ( not ( = ?auto_90400 ?auto_90401 ) ) ( not ( = ?auto_90400 ?auto_90402 ) ) ( not ( = ?auto_90400 ?auto_90403 ) ) ( not ( = ?auto_90401 ?auto_90402 ) ) ( not ( = ?auto_90401 ?auto_90403 ) ) ( not ( = ?auto_90402 ?auto_90403 ) ) ( ON ?auto_90403 ?auto_90405 ) ( not ( = ?auto_90399 ?auto_90405 ) ) ( not ( = ?auto_90400 ?auto_90405 ) ) ( not ( = ?auto_90401 ?auto_90405 ) ) ( not ( = ?auto_90402 ?auto_90405 ) ) ( not ( = ?auto_90403 ?auto_90405 ) ) ( ON ?auto_90402 ?auto_90403 ) ( ON-TABLE ?auto_90406 ) ( ON ?auto_90404 ?auto_90406 ) ( ON ?auto_90405 ?auto_90404 ) ( not ( = ?auto_90406 ?auto_90404 ) ) ( not ( = ?auto_90406 ?auto_90405 ) ) ( not ( = ?auto_90406 ?auto_90403 ) ) ( not ( = ?auto_90406 ?auto_90402 ) ) ( not ( = ?auto_90404 ?auto_90405 ) ) ( not ( = ?auto_90404 ?auto_90403 ) ) ( not ( = ?auto_90404 ?auto_90402 ) ) ( not ( = ?auto_90399 ?auto_90406 ) ) ( not ( = ?auto_90399 ?auto_90404 ) ) ( not ( = ?auto_90400 ?auto_90406 ) ) ( not ( = ?auto_90400 ?auto_90404 ) ) ( not ( = ?auto_90401 ?auto_90406 ) ) ( not ( = ?auto_90401 ?auto_90404 ) ) ( ON ?auto_90401 ?auto_90402 ) ( ON ?auto_90400 ?auto_90401 ) ( CLEAR ?auto_90400 ) ( HOLDING ?auto_90399 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90399 )
      ( MAKE-5PILE ?auto_90399 ?auto_90400 ?auto_90401 ?auto_90402 ?auto_90403 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_90407 - BLOCK
      ?auto_90408 - BLOCK
      ?auto_90409 - BLOCK
      ?auto_90410 - BLOCK
      ?auto_90411 - BLOCK
    )
    :vars
    (
      ?auto_90414 - BLOCK
      ?auto_90412 - BLOCK
      ?auto_90413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90407 ?auto_90408 ) ) ( not ( = ?auto_90407 ?auto_90409 ) ) ( not ( = ?auto_90407 ?auto_90410 ) ) ( not ( = ?auto_90407 ?auto_90411 ) ) ( not ( = ?auto_90408 ?auto_90409 ) ) ( not ( = ?auto_90408 ?auto_90410 ) ) ( not ( = ?auto_90408 ?auto_90411 ) ) ( not ( = ?auto_90409 ?auto_90410 ) ) ( not ( = ?auto_90409 ?auto_90411 ) ) ( not ( = ?auto_90410 ?auto_90411 ) ) ( ON ?auto_90411 ?auto_90414 ) ( not ( = ?auto_90407 ?auto_90414 ) ) ( not ( = ?auto_90408 ?auto_90414 ) ) ( not ( = ?auto_90409 ?auto_90414 ) ) ( not ( = ?auto_90410 ?auto_90414 ) ) ( not ( = ?auto_90411 ?auto_90414 ) ) ( ON ?auto_90410 ?auto_90411 ) ( ON-TABLE ?auto_90412 ) ( ON ?auto_90413 ?auto_90412 ) ( ON ?auto_90414 ?auto_90413 ) ( not ( = ?auto_90412 ?auto_90413 ) ) ( not ( = ?auto_90412 ?auto_90414 ) ) ( not ( = ?auto_90412 ?auto_90411 ) ) ( not ( = ?auto_90412 ?auto_90410 ) ) ( not ( = ?auto_90413 ?auto_90414 ) ) ( not ( = ?auto_90413 ?auto_90411 ) ) ( not ( = ?auto_90413 ?auto_90410 ) ) ( not ( = ?auto_90407 ?auto_90412 ) ) ( not ( = ?auto_90407 ?auto_90413 ) ) ( not ( = ?auto_90408 ?auto_90412 ) ) ( not ( = ?auto_90408 ?auto_90413 ) ) ( not ( = ?auto_90409 ?auto_90412 ) ) ( not ( = ?auto_90409 ?auto_90413 ) ) ( ON ?auto_90409 ?auto_90410 ) ( ON ?auto_90408 ?auto_90409 ) ( ON ?auto_90407 ?auto_90408 ) ( CLEAR ?auto_90407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90412 ?auto_90413 ?auto_90414 ?auto_90411 ?auto_90410 ?auto_90409 ?auto_90408 )
      ( MAKE-5PILE ?auto_90407 ?auto_90408 ?auto_90409 ?auto_90410 ?auto_90411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90417 - BLOCK
      ?auto_90418 - BLOCK
    )
    :vars
    (
      ?auto_90419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90419 ?auto_90418 ) ( CLEAR ?auto_90419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90417 ) ( ON ?auto_90418 ?auto_90417 ) ( not ( = ?auto_90417 ?auto_90418 ) ) ( not ( = ?auto_90417 ?auto_90419 ) ) ( not ( = ?auto_90418 ?auto_90419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90419 ?auto_90418 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90420 - BLOCK
      ?auto_90421 - BLOCK
    )
    :vars
    (
      ?auto_90422 - BLOCK
      ?auto_90423 - BLOCK
      ?auto_90424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90422 ?auto_90421 ) ( CLEAR ?auto_90422 ) ( ON-TABLE ?auto_90420 ) ( ON ?auto_90421 ?auto_90420 ) ( not ( = ?auto_90420 ?auto_90421 ) ) ( not ( = ?auto_90420 ?auto_90422 ) ) ( not ( = ?auto_90421 ?auto_90422 ) ) ( HOLDING ?auto_90423 ) ( CLEAR ?auto_90424 ) ( not ( = ?auto_90420 ?auto_90423 ) ) ( not ( = ?auto_90420 ?auto_90424 ) ) ( not ( = ?auto_90421 ?auto_90423 ) ) ( not ( = ?auto_90421 ?auto_90424 ) ) ( not ( = ?auto_90422 ?auto_90423 ) ) ( not ( = ?auto_90422 ?auto_90424 ) ) ( not ( = ?auto_90423 ?auto_90424 ) ) )
    :subtasks
    ( ( !STACK ?auto_90423 ?auto_90424 )
      ( MAKE-2PILE ?auto_90420 ?auto_90421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90425 - BLOCK
      ?auto_90426 - BLOCK
    )
    :vars
    (
      ?auto_90429 - BLOCK
      ?auto_90427 - BLOCK
      ?auto_90428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90429 ?auto_90426 ) ( ON-TABLE ?auto_90425 ) ( ON ?auto_90426 ?auto_90425 ) ( not ( = ?auto_90425 ?auto_90426 ) ) ( not ( = ?auto_90425 ?auto_90429 ) ) ( not ( = ?auto_90426 ?auto_90429 ) ) ( CLEAR ?auto_90427 ) ( not ( = ?auto_90425 ?auto_90428 ) ) ( not ( = ?auto_90425 ?auto_90427 ) ) ( not ( = ?auto_90426 ?auto_90428 ) ) ( not ( = ?auto_90426 ?auto_90427 ) ) ( not ( = ?auto_90429 ?auto_90428 ) ) ( not ( = ?auto_90429 ?auto_90427 ) ) ( not ( = ?auto_90428 ?auto_90427 ) ) ( ON ?auto_90428 ?auto_90429 ) ( CLEAR ?auto_90428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90425 ?auto_90426 ?auto_90429 )
      ( MAKE-2PILE ?auto_90425 ?auto_90426 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90430 - BLOCK
      ?auto_90431 - BLOCK
    )
    :vars
    (
      ?auto_90433 - BLOCK
      ?auto_90434 - BLOCK
      ?auto_90432 - BLOCK
      ?auto_90436 - BLOCK
      ?auto_90437 - BLOCK
      ?auto_90435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90433 ?auto_90431 ) ( ON-TABLE ?auto_90430 ) ( ON ?auto_90431 ?auto_90430 ) ( not ( = ?auto_90430 ?auto_90431 ) ) ( not ( = ?auto_90430 ?auto_90433 ) ) ( not ( = ?auto_90431 ?auto_90433 ) ) ( not ( = ?auto_90430 ?auto_90434 ) ) ( not ( = ?auto_90430 ?auto_90432 ) ) ( not ( = ?auto_90431 ?auto_90434 ) ) ( not ( = ?auto_90431 ?auto_90432 ) ) ( not ( = ?auto_90433 ?auto_90434 ) ) ( not ( = ?auto_90433 ?auto_90432 ) ) ( not ( = ?auto_90434 ?auto_90432 ) ) ( ON ?auto_90434 ?auto_90433 ) ( CLEAR ?auto_90434 ) ( HOLDING ?auto_90432 ) ( CLEAR ?auto_90436 ) ( ON-TABLE ?auto_90437 ) ( ON ?auto_90435 ?auto_90437 ) ( ON ?auto_90436 ?auto_90435 ) ( not ( = ?auto_90437 ?auto_90435 ) ) ( not ( = ?auto_90437 ?auto_90436 ) ) ( not ( = ?auto_90437 ?auto_90432 ) ) ( not ( = ?auto_90435 ?auto_90436 ) ) ( not ( = ?auto_90435 ?auto_90432 ) ) ( not ( = ?auto_90436 ?auto_90432 ) ) ( not ( = ?auto_90430 ?auto_90436 ) ) ( not ( = ?auto_90430 ?auto_90437 ) ) ( not ( = ?auto_90430 ?auto_90435 ) ) ( not ( = ?auto_90431 ?auto_90436 ) ) ( not ( = ?auto_90431 ?auto_90437 ) ) ( not ( = ?auto_90431 ?auto_90435 ) ) ( not ( = ?auto_90433 ?auto_90436 ) ) ( not ( = ?auto_90433 ?auto_90437 ) ) ( not ( = ?auto_90433 ?auto_90435 ) ) ( not ( = ?auto_90434 ?auto_90436 ) ) ( not ( = ?auto_90434 ?auto_90437 ) ) ( not ( = ?auto_90434 ?auto_90435 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90437 ?auto_90435 ?auto_90436 ?auto_90432 )
      ( MAKE-2PILE ?auto_90430 ?auto_90431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90438 - BLOCK
      ?auto_90439 - BLOCK
    )
    :vars
    (
      ?auto_90442 - BLOCK
      ?auto_90444 - BLOCK
      ?auto_90440 - BLOCK
      ?auto_90441 - BLOCK
      ?auto_90445 - BLOCK
      ?auto_90443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90442 ?auto_90439 ) ( ON-TABLE ?auto_90438 ) ( ON ?auto_90439 ?auto_90438 ) ( not ( = ?auto_90438 ?auto_90439 ) ) ( not ( = ?auto_90438 ?auto_90442 ) ) ( not ( = ?auto_90439 ?auto_90442 ) ) ( not ( = ?auto_90438 ?auto_90444 ) ) ( not ( = ?auto_90438 ?auto_90440 ) ) ( not ( = ?auto_90439 ?auto_90444 ) ) ( not ( = ?auto_90439 ?auto_90440 ) ) ( not ( = ?auto_90442 ?auto_90444 ) ) ( not ( = ?auto_90442 ?auto_90440 ) ) ( not ( = ?auto_90444 ?auto_90440 ) ) ( ON ?auto_90444 ?auto_90442 ) ( CLEAR ?auto_90441 ) ( ON-TABLE ?auto_90445 ) ( ON ?auto_90443 ?auto_90445 ) ( ON ?auto_90441 ?auto_90443 ) ( not ( = ?auto_90445 ?auto_90443 ) ) ( not ( = ?auto_90445 ?auto_90441 ) ) ( not ( = ?auto_90445 ?auto_90440 ) ) ( not ( = ?auto_90443 ?auto_90441 ) ) ( not ( = ?auto_90443 ?auto_90440 ) ) ( not ( = ?auto_90441 ?auto_90440 ) ) ( not ( = ?auto_90438 ?auto_90441 ) ) ( not ( = ?auto_90438 ?auto_90445 ) ) ( not ( = ?auto_90438 ?auto_90443 ) ) ( not ( = ?auto_90439 ?auto_90441 ) ) ( not ( = ?auto_90439 ?auto_90445 ) ) ( not ( = ?auto_90439 ?auto_90443 ) ) ( not ( = ?auto_90442 ?auto_90441 ) ) ( not ( = ?auto_90442 ?auto_90445 ) ) ( not ( = ?auto_90442 ?auto_90443 ) ) ( not ( = ?auto_90444 ?auto_90441 ) ) ( not ( = ?auto_90444 ?auto_90445 ) ) ( not ( = ?auto_90444 ?auto_90443 ) ) ( ON ?auto_90440 ?auto_90444 ) ( CLEAR ?auto_90440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90438 ?auto_90439 ?auto_90442 ?auto_90444 )
      ( MAKE-2PILE ?auto_90438 ?auto_90439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90446 - BLOCK
      ?auto_90447 - BLOCK
    )
    :vars
    (
      ?auto_90450 - BLOCK
      ?auto_90452 - BLOCK
      ?auto_90448 - BLOCK
      ?auto_90449 - BLOCK
      ?auto_90453 - BLOCK
      ?auto_90451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90450 ?auto_90447 ) ( ON-TABLE ?auto_90446 ) ( ON ?auto_90447 ?auto_90446 ) ( not ( = ?auto_90446 ?auto_90447 ) ) ( not ( = ?auto_90446 ?auto_90450 ) ) ( not ( = ?auto_90447 ?auto_90450 ) ) ( not ( = ?auto_90446 ?auto_90452 ) ) ( not ( = ?auto_90446 ?auto_90448 ) ) ( not ( = ?auto_90447 ?auto_90452 ) ) ( not ( = ?auto_90447 ?auto_90448 ) ) ( not ( = ?auto_90450 ?auto_90452 ) ) ( not ( = ?auto_90450 ?auto_90448 ) ) ( not ( = ?auto_90452 ?auto_90448 ) ) ( ON ?auto_90452 ?auto_90450 ) ( ON-TABLE ?auto_90449 ) ( ON ?auto_90453 ?auto_90449 ) ( not ( = ?auto_90449 ?auto_90453 ) ) ( not ( = ?auto_90449 ?auto_90451 ) ) ( not ( = ?auto_90449 ?auto_90448 ) ) ( not ( = ?auto_90453 ?auto_90451 ) ) ( not ( = ?auto_90453 ?auto_90448 ) ) ( not ( = ?auto_90451 ?auto_90448 ) ) ( not ( = ?auto_90446 ?auto_90451 ) ) ( not ( = ?auto_90446 ?auto_90449 ) ) ( not ( = ?auto_90446 ?auto_90453 ) ) ( not ( = ?auto_90447 ?auto_90451 ) ) ( not ( = ?auto_90447 ?auto_90449 ) ) ( not ( = ?auto_90447 ?auto_90453 ) ) ( not ( = ?auto_90450 ?auto_90451 ) ) ( not ( = ?auto_90450 ?auto_90449 ) ) ( not ( = ?auto_90450 ?auto_90453 ) ) ( not ( = ?auto_90452 ?auto_90451 ) ) ( not ( = ?auto_90452 ?auto_90449 ) ) ( not ( = ?auto_90452 ?auto_90453 ) ) ( ON ?auto_90448 ?auto_90452 ) ( CLEAR ?auto_90448 ) ( HOLDING ?auto_90451 ) ( CLEAR ?auto_90453 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90449 ?auto_90453 ?auto_90451 )
      ( MAKE-2PILE ?auto_90446 ?auto_90447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90454 - BLOCK
      ?auto_90455 - BLOCK
    )
    :vars
    (
      ?auto_90459 - BLOCK
      ?auto_90457 - BLOCK
      ?auto_90461 - BLOCK
      ?auto_90460 - BLOCK
      ?auto_90458 - BLOCK
      ?auto_90456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90459 ?auto_90455 ) ( ON-TABLE ?auto_90454 ) ( ON ?auto_90455 ?auto_90454 ) ( not ( = ?auto_90454 ?auto_90455 ) ) ( not ( = ?auto_90454 ?auto_90459 ) ) ( not ( = ?auto_90455 ?auto_90459 ) ) ( not ( = ?auto_90454 ?auto_90457 ) ) ( not ( = ?auto_90454 ?auto_90461 ) ) ( not ( = ?auto_90455 ?auto_90457 ) ) ( not ( = ?auto_90455 ?auto_90461 ) ) ( not ( = ?auto_90459 ?auto_90457 ) ) ( not ( = ?auto_90459 ?auto_90461 ) ) ( not ( = ?auto_90457 ?auto_90461 ) ) ( ON ?auto_90457 ?auto_90459 ) ( ON-TABLE ?auto_90460 ) ( ON ?auto_90458 ?auto_90460 ) ( not ( = ?auto_90460 ?auto_90458 ) ) ( not ( = ?auto_90460 ?auto_90456 ) ) ( not ( = ?auto_90460 ?auto_90461 ) ) ( not ( = ?auto_90458 ?auto_90456 ) ) ( not ( = ?auto_90458 ?auto_90461 ) ) ( not ( = ?auto_90456 ?auto_90461 ) ) ( not ( = ?auto_90454 ?auto_90456 ) ) ( not ( = ?auto_90454 ?auto_90460 ) ) ( not ( = ?auto_90454 ?auto_90458 ) ) ( not ( = ?auto_90455 ?auto_90456 ) ) ( not ( = ?auto_90455 ?auto_90460 ) ) ( not ( = ?auto_90455 ?auto_90458 ) ) ( not ( = ?auto_90459 ?auto_90456 ) ) ( not ( = ?auto_90459 ?auto_90460 ) ) ( not ( = ?auto_90459 ?auto_90458 ) ) ( not ( = ?auto_90457 ?auto_90456 ) ) ( not ( = ?auto_90457 ?auto_90460 ) ) ( not ( = ?auto_90457 ?auto_90458 ) ) ( ON ?auto_90461 ?auto_90457 ) ( CLEAR ?auto_90458 ) ( ON ?auto_90456 ?auto_90461 ) ( CLEAR ?auto_90456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90454 ?auto_90455 ?auto_90459 ?auto_90457 ?auto_90461 )
      ( MAKE-2PILE ?auto_90454 ?auto_90455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90462 - BLOCK
      ?auto_90463 - BLOCK
    )
    :vars
    (
      ?auto_90467 - BLOCK
      ?auto_90466 - BLOCK
      ?auto_90469 - BLOCK
      ?auto_90464 - BLOCK
      ?auto_90468 - BLOCK
      ?auto_90465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90467 ?auto_90463 ) ( ON-TABLE ?auto_90462 ) ( ON ?auto_90463 ?auto_90462 ) ( not ( = ?auto_90462 ?auto_90463 ) ) ( not ( = ?auto_90462 ?auto_90467 ) ) ( not ( = ?auto_90463 ?auto_90467 ) ) ( not ( = ?auto_90462 ?auto_90466 ) ) ( not ( = ?auto_90462 ?auto_90469 ) ) ( not ( = ?auto_90463 ?auto_90466 ) ) ( not ( = ?auto_90463 ?auto_90469 ) ) ( not ( = ?auto_90467 ?auto_90466 ) ) ( not ( = ?auto_90467 ?auto_90469 ) ) ( not ( = ?auto_90466 ?auto_90469 ) ) ( ON ?auto_90466 ?auto_90467 ) ( ON-TABLE ?auto_90464 ) ( not ( = ?auto_90464 ?auto_90468 ) ) ( not ( = ?auto_90464 ?auto_90465 ) ) ( not ( = ?auto_90464 ?auto_90469 ) ) ( not ( = ?auto_90468 ?auto_90465 ) ) ( not ( = ?auto_90468 ?auto_90469 ) ) ( not ( = ?auto_90465 ?auto_90469 ) ) ( not ( = ?auto_90462 ?auto_90465 ) ) ( not ( = ?auto_90462 ?auto_90464 ) ) ( not ( = ?auto_90462 ?auto_90468 ) ) ( not ( = ?auto_90463 ?auto_90465 ) ) ( not ( = ?auto_90463 ?auto_90464 ) ) ( not ( = ?auto_90463 ?auto_90468 ) ) ( not ( = ?auto_90467 ?auto_90465 ) ) ( not ( = ?auto_90467 ?auto_90464 ) ) ( not ( = ?auto_90467 ?auto_90468 ) ) ( not ( = ?auto_90466 ?auto_90465 ) ) ( not ( = ?auto_90466 ?auto_90464 ) ) ( not ( = ?auto_90466 ?auto_90468 ) ) ( ON ?auto_90469 ?auto_90466 ) ( ON ?auto_90465 ?auto_90469 ) ( CLEAR ?auto_90465 ) ( HOLDING ?auto_90468 ) ( CLEAR ?auto_90464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90464 ?auto_90468 )
      ( MAKE-2PILE ?auto_90462 ?auto_90463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90470 - BLOCK
      ?auto_90471 - BLOCK
    )
    :vars
    (
      ?auto_90477 - BLOCK
      ?auto_90474 - BLOCK
      ?auto_90476 - BLOCK
      ?auto_90473 - BLOCK
      ?auto_90475 - BLOCK
      ?auto_90472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90477 ?auto_90471 ) ( ON-TABLE ?auto_90470 ) ( ON ?auto_90471 ?auto_90470 ) ( not ( = ?auto_90470 ?auto_90471 ) ) ( not ( = ?auto_90470 ?auto_90477 ) ) ( not ( = ?auto_90471 ?auto_90477 ) ) ( not ( = ?auto_90470 ?auto_90474 ) ) ( not ( = ?auto_90470 ?auto_90476 ) ) ( not ( = ?auto_90471 ?auto_90474 ) ) ( not ( = ?auto_90471 ?auto_90476 ) ) ( not ( = ?auto_90477 ?auto_90474 ) ) ( not ( = ?auto_90477 ?auto_90476 ) ) ( not ( = ?auto_90474 ?auto_90476 ) ) ( ON ?auto_90474 ?auto_90477 ) ( ON-TABLE ?auto_90473 ) ( not ( = ?auto_90473 ?auto_90475 ) ) ( not ( = ?auto_90473 ?auto_90472 ) ) ( not ( = ?auto_90473 ?auto_90476 ) ) ( not ( = ?auto_90475 ?auto_90472 ) ) ( not ( = ?auto_90475 ?auto_90476 ) ) ( not ( = ?auto_90472 ?auto_90476 ) ) ( not ( = ?auto_90470 ?auto_90472 ) ) ( not ( = ?auto_90470 ?auto_90473 ) ) ( not ( = ?auto_90470 ?auto_90475 ) ) ( not ( = ?auto_90471 ?auto_90472 ) ) ( not ( = ?auto_90471 ?auto_90473 ) ) ( not ( = ?auto_90471 ?auto_90475 ) ) ( not ( = ?auto_90477 ?auto_90472 ) ) ( not ( = ?auto_90477 ?auto_90473 ) ) ( not ( = ?auto_90477 ?auto_90475 ) ) ( not ( = ?auto_90474 ?auto_90472 ) ) ( not ( = ?auto_90474 ?auto_90473 ) ) ( not ( = ?auto_90474 ?auto_90475 ) ) ( ON ?auto_90476 ?auto_90474 ) ( ON ?auto_90472 ?auto_90476 ) ( CLEAR ?auto_90473 ) ( ON ?auto_90475 ?auto_90472 ) ( CLEAR ?auto_90475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90470 ?auto_90471 ?auto_90477 ?auto_90474 ?auto_90476 ?auto_90472 )
      ( MAKE-2PILE ?auto_90470 ?auto_90471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90478 - BLOCK
      ?auto_90479 - BLOCK
    )
    :vars
    (
      ?auto_90482 - BLOCK
      ?auto_90481 - BLOCK
      ?auto_90480 - BLOCK
      ?auto_90483 - BLOCK
      ?auto_90485 - BLOCK
      ?auto_90484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90482 ?auto_90479 ) ( ON-TABLE ?auto_90478 ) ( ON ?auto_90479 ?auto_90478 ) ( not ( = ?auto_90478 ?auto_90479 ) ) ( not ( = ?auto_90478 ?auto_90482 ) ) ( not ( = ?auto_90479 ?auto_90482 ) ) ( not ( = ?auto_90478 ?auto_90481 ) ) ( not ( = ?auto_90478 ?auto_90480 ) ) ( not ( = ?auto_90479 ?auto_90481 ) ) ( not ( = ?auto_90479 ?auto_90480 ) ) ( not ( = ?auto_90482 ?auto_90481 ) ) ( not ( = ?auto_90482 ?auto_90480 ) ) ( not ( = ?auto_90481 ?auto_90480 ) ) ( ON ?auto_90481 ?auto_90482 ) ( not ( = ?auto_90483 ?auto_90485 ) ) ( not ( = ?auto_90483 ?auto_90484 ) ) ( not ( = ?auto_90483 ?auto_90480 ) ) ( not ( = ?auto_90485 ?auto_90484 ) ) ( not ( = ?auto_90485 ?auto_90480 ) ) ( not ( = ?auto_90484 ?auto_90480 ) ) ( not ( = ?auto_90478 ?auto_90484 ) ) ( not ( = ?auto_90478 ?auto_90483 ) ) ( not ( = ?auto_90478 ?auto_90485 ) ) ( not ( = ?auto_90479 ?auto_90484 ) ) ( not ( = ?auto_90479 ?auto_90483 ) ) ( not ( = ?auto_90479 ?auto_90485 ) ) ( not ( = ?auto_90482 ?auto_90484 ) ) ( not ( = ?auto_90482 ?auto_90483 ) ) ( not ( = ?auto_90482 ?auto_90485 ) ) ( not ( = ?auto_90481 ?auto_90484 ) ) ( not ( = ?auto_90481 ?auto_90483 ) ) ( not ( = ?auto_90481 ?auto_90485 ) ) ( ON ?auto_90480 ?auto_90481 ) ( ON ?auto_90484 ?auto_90480 ) ( ON ?auto_90485 ?auto_90484 ) ( CLEAR ?auto_90485 ) ( HOLDING ?auto_90483 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90483 )
      ( MAKE-2PILE ?auto_90478 ?auto_90479 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_90486 - BLOCK
      ?auto_90487 - BLOCK
    )
    :vars
    (
      ?auto_90491 - BLOCK
      ?auto_90489 - BLOCK
      ?auto_90492 - BLOCK
      ?auto_90488 - BLOCK
      ?auto_90493 - BLOCK
      ?auto_90490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90491 ?auto_90487 ) ( ON-TABLE ?auto_90486 ) ( ON ?auto_90487 ?auto_90486 ) ( not ( = ?auto_90486 ?auto_90487 ) ) ( not ( = ?auto_90486 ?auto_90491 ) ) ( not ( = ?auto_90487 ?auto_90491 ) ) ( not ( = ?auto_90486 ?auto_90489 ) ) ( not ( = ?auto_90486 ?auto_90492 ) ) ( not ( = ?auto_90487 ?auto_90489 ) ) ( not ( = ?auto_90487 ?auto_90492 ) ) ( not ( = ?auto_90491 ?auto_90489 ) ) ( not ( = ?auto_90491 ?auto_90492 ) ) ( not ( = ?auto_90489 ?auto_90492 ) ) ( ON ?auto_90489 ?auto_90491 ) ( not ( = ?auto_90488 ?auto_90493 ) ) ( not ( = ?auto_90488 ?auto_90490 ) ) ( not ( = ?auto_90488 ?auto_90492 ) ) ( not ( = ?auto_90493 ?auto_90490 ) ) ( not ( = ?auto_90493 ?auto_90492 ) ) ( not ( = ?auto_90490 ?auto_90492 ) ) ( not ( = ?auto_90486 ?auto_90490 ) ) ( not ( = ?auto_90486 ?auto_90488 ) ) ( not ( = ?auto_90486 ?auto_90493 ) ) ( not ( = ?auto_90487 ?auto_90490 ) ) ( not ( = ?auto_90487 ?auto_90488 ) ) ( not ( = ?auto_90487 ?auto_90493 ) ) ( not ( = ?auto_90491 ?auto_90490 ) ) ( not ( = ?auto_90491 ?auto_90488 ) ) ( not ( = ?auto_90491 ?auto_90493 ) ) ( not ( = ?auto_90489 ?auto_90490 ) ) ( not ( = ?auto_90489 ?auto_90488 ) ) ( not ( = ?auto_90489 ?auto_90493 ) ) ( ON ?auto_90492 ?auto_90489 ) ( ON ?auto_90490 ?auto_90492 ) ( ON ?auto_90493 ?auto_90490 ) ( ON ?auto_90488 ?auto_90493 ) ( CLEAR ?auto_90488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90486 ?auto_90487 ?auto_90491 ?auto_90489 ?auto_90492 ?auto_90490 ?auto_90493 )
      ( MAKE-2PILE ?auto_90486 ?auto_90487 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90500 - BLOCK
      ?auto_90501 - BLOCK
      ?auto_90502 - BLOCK
      ?auto_90503 - BLOCK
      ?auto_90504 - BLOCK
      ?auto_90505 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90505 ) ( CLEAR ?auto_90504 ) ( ON-TABLE ?auto_90500 ) ( ON ?auto_90501 ?auto_90500 ) ( ON ?auto_90502 ?auto_90501 ) ( ON ?auto_90503 ?auto_90502 ) ( ON ?auto_90504 ?auto_90503 ) ( not ( = ?auto_90500 ?auto_90501 ) ) ( not ( = ?auto_90500 ?auto_90502 ) ) ( not ( = ?auto_90500 ?auto_90503 ) ) ( not ( = ?auto_90500 ?auto_90504 ) ) ( not ( = ?auto_90500 ?auto_90505 ) ) ( not ( = ?auto_90501 ?auto_90502 ) ) ( not ( = ?auto_90501 ?auto_90503 ) ) ( not ( = ?auto_90501 ?auto_90504 ) ) ( not ( = ?auto_90501 ?auto_90505 ) ) ( not ( = ?auto_90502 ?auto_90503 ) ) ( not ( = ?auto_90502 ?auto_90504 ) ) ( not ( = ?auto_90502 ?auto_90505 ) ) ( not ( = ?auto_90503 ?auto_90504 ) ) ( not ( = ?auto_90503 ?auto_90505 ) ) ( not ( = ?auto_90504 ?auto_90505 ) ) )
    :subtasks
    ( ( !STACK ?auto_90505 ?auto_90504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90506 - BLOCK
      ?auto_90507 - BLOCK
      ?auto_90508 - BLOCK
      ?auto_90509 - BLOCK
      ?auto_90510 - BLOCK
      ?auto_90511 - BLOCK
    )
    :vars
    (
      ?auto_90512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90510 ) ( ON-TABLE ?auto_90506 ) ( ON ?auto_90507 ?auto_90506 ) ( ON ?auto_90508 ?auto_90507 ) ( ON ?auto_90509 ?auto_90508 ) ( ON ?auto_90510 ?auto_90509 ) ( not ( = ?auto_90506 ?auto_90507 ) ) ( not ( = ?auto_90506 ?auto_90508 ) ) ( not ( = ?auto_90506 ?auto_90509 ) ) ( not ( = ?auto_90506 ?auto_90510 ) ) ( not ( = ?auto_90506 ?auto_90511 ) ) ( not ( = ?auto_90507 ?auto_90508 ) ) ( not ( = ?auto_90507 ?auto_90509 ) ) ( not ( = ?auto_90507 ?auto_90510 ) ) ( not ( = ?auto_90507 ?auto_90511 ) ) ( not ( = ?auto_90508 ?auto_90509 ) ) ( not ( = ?auto_90508 ?auto_90510 ) ) ( not ( = ?auto_90508 ?auto_90511 ) ) ( not ( = ?auto_90509 ?auto_90510 ) ) ( not ( = ?auto_90509 ?auto_90511 ) ) ( not ( = ?auto_90510 ?auto_90511 ) ) ( ON ?auto_90511 ?auto_90512 ) ( CLEAR ?auto_90511 ) ( HAND-EMPTY ) ( not ( = ?auto_90506 ?auto_90512 ) ) ( not ( = ?auto_90507 ?auto_90512 ) ) ( not ( = ?auto_90508 ?auto_90512 ) ) ( not ( = ?auto_90509 ?auto_90512 ) ) ( not ( = ?auto_90510 ?auto_90512 ) ) ( not ( = ?auto_90511 ?auto_90512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90511 ?auto_90512 )
      ( MAKE-6PILE ?auto_90506 ?auto_90507 ?auto_90508 ?auto_90509 ?auto_90510 ?auto_90511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90513 - BLOCK
      ?auto_90514 - BLOCK
      ?auto_90515 - BLOCK
      ?auto_90516 - BLOCK
      ?auto_90517 - BLOCK
      ?auto_90518 - BLOCK
    )
    :vars
    (
      ?auto_90519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90513 ) ( ON ?auto_90514 ?auto_90513 ) ( ON ?auto_90515 ?auto_90514 ) ( ON ?auto_90516 ?auto_90515 ) ( not ( = ?auto_90513 ?auto_90514 ) ) ( not ( = ?auto_90513 ?auto_90515 ) ) ( not ( = ?auto_90513 ?auto_90516 ) ) ( not ( = ?auto_90513 ?auto_90517 ) ) ( not ( = ?auto_90513 ?auto_90518 ) ) ( not ( = ?auto_90514 ?auto_90515 ) ) ( not ( = ?auto_90514 ?auto_90516 ) ) ( not ( = ?auto_90514 ?auto_90517 ) ) ( not ( = ?auto_90514 ?auto_90518 ) ) ( not ( = ?auto_90515 ?auto_90516 ) ) ( not ( = ?auto_90515 ?auto_90517 ) ) ( not ( = ?auto_90515 ?auto_90518 ) ) ( not ( = ?auto_90516 ?auto_90517 ) ) ( not ( = ?auto_90516 ?auto_90518 ) ) ( not ( = ?auto_90517 ?auto_90518 ) ) ( ON ?auto_90518 ?auto_90519 ) ( CLEAR ?auto_90518 ) ( not ( = ?auto_90513 ?auto_90519 ) ) ( not ( = ?auto_90514 ?auto_90519 ) ) ( not ( = ?auto_90515 ?auto_90519 ) ) ( not ( = ?auto_90516 ?auto_90519 ) ) ( not ( = ?auto_90517 ?auto_90519 ) ) ( not ( = ?auto_90518 ?auto_90519 ) ) ( HOLDING ?auto_90517 ) ( CLEAR ?auto_90516 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90513 ?auto_90514 ?auto_90515 ?auto_90516 ?auto_90517 )
      ( MAKE-6PILE ?auto_90513 ?auto_90514 ?auto_90515 ?auto_90516 ?auto_90517 ?auto_90518 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90520 - BLOCK
      ?auto_90521 - BLOCK
      ?auto_90522 - BLOCK
      ?auto_90523 - BLOCK
      ?auto_90524 - BLOCK
      ?auto_90525 - BLOCK
    )
    :vars
    (
      ?auto_90526 - BLOCK
      ?auto_90527 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90520 ) ( ON ?auto_90521 ?auto_90520 ) ( ON ?auto_90522 ?auto_90521 ) ( ON ?auto_90523 ?auto_90522 ) ( not ( = ?auto_90520 ?auto_90521 ) ) ( not ( = ?auto_90520 ?auto_90522 ) ) ( not ( = ?auto_90520 ?auto_90523 ) ) ( not ( = ?auto_90520 ?auto_90524 ) ) ( not ( = ?auto_90520 ?auto_90525 ) ) ( not ( = ?auto_90521 ?auto_90522 ) ) ( not ( = ?auto_90521 ?auto_90523 ) ) ( not ( = ?auto_90521 ?auto_90524 ) ) ( not ( = ?auto_90521 ?auto_90525 ) ) ( not ( = ?auto_90522 ?auto_90523 ) ) ( not ( = ?auto_90522 ?auto_90524 ) ) ( not ( = ?auto_90522 ?auto_90525 ) ) ( not ( = ?auto_90523 ?auto_90524 ) ) ( not ( = ?auto_90523 ?auto_90525 ) ) ( not ( = ?auto_90524 ?auto_90525 ) ) ( ON ?auto_90525 ?auto_90526 ) ( not ( = ?auto_90520 ?auto_90526 ) ) ( not ( = ?auto_90521 ?auto_90526 ) ) ( not ( = ?auto_90522 ?auto_90526 ) ) ( not ( = ?auto_90523 ?auto_90526 ) ) ( not ( = ?auto_90524 ?auto_90526 ) ) ( not ( = ?auto_90525 ?auto_90526 ) ) ( CLEAR ?auto_90523 ) ( ON ?auto_90524 ?auto_90525 ) ( CLEAR ?auto_90524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90527 ) ( ON ?auto_90526 ?auto_90527 ) ( not ( = ?auto_90527 ?auto_90526 ) ) ( not ( = ?auto_90527 ?auto_90525 ) ) ( not ( = ?auto_90527 ?auto_90524 ) ) ( not ( = ?auto_90520 ?auto_90527 ) ) ( not ( = ?auto_90521 ?auto_90527 ) ) ( not ( = ?auto_90522 ?auto_90527 ) ) ( not ( = ?auto_90523 ?auto_90527 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90527 ?auto_90526 ?auto_90525 )
      ( MAKE-6PILE ?auto_90520 ?auto_90521 ?auto_90522 ?auto_90523 ?auto_90524 ?auto_90525 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90528 - BLOCK
      ?auto_90529 - BLOCK
      ?auto_90530 - BLOCK
      ?auto_90531 - BLOCK
      ?auto_90532 - BLOCK
      ?auto_90533 - BLOCK
    )
    :vars
    (
      ?auto_90534 - BLOCK
      ?auto_90535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90528 ) ( ON ?auto_90529 ?auto_90528 ) ( ON ?auto_90530 ?auto_90529 ) ( not ( = ?auto_90528 ?auto_90529 ) ) ( not ( = ?auto_90528 ?auto_90530 ) ) ( not ( = ?auto_90528 ?auto_90531 ) ) ( not ( = ?auto_90528 ?auto_90532 ) ) ( not ( = ?auto_90528 ?auto_90533 ) ) ( not ( = ?auto_90529 ?auto_90530 ) ) ( not ( = ?auto_90529 ?auto_90531 ) ) ( not ( = ?auto_90529 ?auto_90532 ) ) ( not ( = ?auto_90529 ?auto_90533 ) ) ( not ( = ?auto_90530 ?auto_90531 ) ) ( not ( = ?auto_90530 ?auto_90532 ) ) ( not ( = ?auto_90530 ?auto_90533 ) ) ( not ( = ?auto_90531 ?auto_90532 ) ) ( not ( = ?auto_90531 ?auto_90533 ) ) ( not ( = ?auto_90532 ?auto_90533 ) ) ( ON ?auto_90533 ?auto_90534 ) ( not ( = ?auto_90528 ?auto_90534 ) ) ( not ( = ?auto_90529 ?auto_90534 ) ) ( not ( = ?auto_90530 ?auto_90534 ) ) ( not ( = ?auto_90531 ?auto_90534 ) ) ( not ( = ?auto_90532 ?auto_90534 ) ) ( not ( = ?auto_90533 ?auto_90534 ) ) ( ON ?auto_90532 ?auto_90533 ) ( CLEAR ?auto_90532 ) ( ON-TABLE ?auto_90535 ) ( ON ?auto_90534 ?auto_90535 ) ( not ( = ?auto_90535 ?auto_90534 ) ) ( not ( = ?auto_90535 ?auto_90533 ) ) ( not ( = ?auto_90535 ?auto_90532 ) ) ( not ( = ?auto_90528 ?auto_90535 ) ) ( not ( = ?auto_90529 ?auto_90535 ) ) ( not ( = ?auto_90530 ?auto_90535 ) ) ( not ( = ?auto_90531 ?auto_90535 ) ) ( HOLDING ?auto_90531 ) ( CLEAR ?auto_90530 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90528 ?auto_90529 ?auto_90530 ?auto_90531 )
      ( MAKE-6PILE ?auto_90528 ?auto_90529 ?auto_90530 ?auto_90531 ?auto_90532 ?auto_90533 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90536 - BLOCK
      ?auto_90537 - BLOCK
      ?auto_90538 - BLOCK
      ?auto_90539 - BLOCK
      ?auto_90540 - BLOCK
      ?auto_90541 - BLOCK
    )
    :vars
    (
      ?auto_90543 - BLOCK
      ?auto_90542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90536 ) ( ON ?auto_90537 ?auto_90536 ) ( ON ?auto_90538 ?auto_90537 ) ( not ( = ?auto_90536 ?auto_90537 ) ) ( not ( = ?auto_90536 ?auto_90538 ) ) ( not ( = ?auto_90536 ?auto_90539 ) ) ( not ( = ?auto_90536 ?auto_90540 ) ) ( not ( = ?auto_90536 ?auto_90541 ) ) ( not ( = ?auto_90537 ?auto_90538 ) ) ( not ( = ?auto_90537 ?auto_90539 ) ) ( not ( = ?auto_90537 ?auto_90540 ) ) ( not ( = ?auto_90537 ?auto_90541 ) ) ( not ( = ?auto_90538 ?auto_90539 ) ) ( not ( = ?auto_90538 ?auto_90540 ) ) ( not ( = ?auto_90538 ?auto_90541 ) ) ( not ( = ?auto_90539 ?auto_90540 ) ) ( not ( = ?auto_90539 ?auto_90541 ) ) ( not ( = ?auto_90540 ?auto_90541 ) ) ( ON ?auto_90541 ?auto_90543 ) ( not ( = ?auto_90536 ?auto_90543 ) ) ( not ( = ?auto_90537 ?auto_90543 ) ) ( not ( = ?auto_90538 ?auto_90543 ) ) ( not ( = ?auto_90539 ?auto_90543 ) ) ( not ( = ?auto_90540 ?auto_90543 ) ) ( not ( = ?auto_90541 ?auto_90543 ) ) ( ON ?auto_90540 ?auto_90541 ) ( ON-TABLE ?auto_90542 ) ( ON ?auto_90543 ?auto_90542 ) ( not ( = ?auto_90542 ?auto_90543 ) ) ( not ( = ?auto_90542 ?auto_90541 ) ) ( not ( = ?auto_90542 ?auto_90540 ) ) ( not ( = ?auto_90536 ?auto_90542 ) ) ( not ( = ?auto_90537 ?auto_90542 ) ) ( not ( = ?auto_90538 ?auto_90542 ) ) ( not ( = ?auto_90539 ?auto_90542 ) ) ( CLEAR ?auto_90538 ) ( ON ?auto_90539 ?auto_90540 ) ( CLEAR ?auto_90539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90542 ?auto_90543 ?auto_90541 ?auto_90540 )
      ( MAKE-6PILE ?auto_90536 ?auto_90537 ?auto_90538 ?auto_90539 ?auto_90540 ?auto_90541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90544 - BLOCK
      ?auto_90545 - BLOCK
      ?auto_90546 - BLOCK
      ?auto_90547 - BLOCK
      ?auto_90548 - BLOCK
      ?auto_90549 - BLOCK
    )
    :vars
    (
      ?auto_90550 - BLOCK
      ?auto_90551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90544 ) ( ON ?auto_90545 ?auto_90544 ) ( not ( = ?auto_90544 ?auto_90545 ) ) ( not ( = ?auto_90544 ?auto_90546 ) ) ( not ( = ?auto_90544 ?auto_90547 ) ) ( not ( = ?auto_90544 ?auto_90548 ) ) ( not ( = ?auto_90544 ?auto_90549 ) ) ( not ( = ?auto_90545 ?auto_90546 ) ) ( not ( = ?auto_90545 ?auto_90547 ) ) ( not ( = ?auto_90545 ?auto_90548 ) ) ( not ( = ?auto_90545 ?auto_90549 ) ) ( not ( = ?auto_90546 ?auto_90547 ) ) ( not ( = ?auto_90546 ?auto_90548 ) ) ( not ( = ?auto_90546 ?auto_90549 ) ) ( not ( = ?auto_90547 ?auto_90548 ) ) ( not ( = ?auto_90547 ?auto_90549 ) ) ( not ( = ?auto_90548 ?auto_90549 ) ) ( ON ?auto_90549 ?auto_90550 ) ( not ( = ?auto_90544 ?auto_90550 ) ) ( not ( = ?auto_90545 ?auto_90550 ) ) ( not ( = ?auto_90546 ?auto_90550 ) ) ( not ( = ?auto_90547 ?auto_90550 ) ) ( not ( = ?auto_90548 ?auto_90550 ) ) ( not ( = ?auto_90549 ?auto_90550 ) ) ( ON ?auto_90548 ?auto_90549 ) ( ON-TABLE ?auto_90551 ) ( ON ?auto_90550 ?auto_90551 ) ( not ( = ?auto_90551 ?auto_90550 ) ) ( not ( = ?auto_90551 ?auto_90549 ) ) ( not ( = ?auto_90551 ?auto_90548 ) ) ( not ( = ?auto_90544 ?auto_90551 ) ) ( not ( = ?auto_90545 ?auto_90551 ) ) ( not ( = ?auto_90546 ?auto_90551 ) ) ( not ( = ?auto_90547 ?auto_90551 ) ) ( ON ?auto_90547 ?auto_90548 ) ( CLEAR ?auto_90547 ) ( HOLDING ?auto_90546 ) ( CLEAR ?auto_90545 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90544 ?auto_90545 ?auto_90546 )
      ( MAKE-6PILE ?auto_90544 ?auto_90545 ?auto_90546 ?auto_90547 ?auto_90548 ?auto_90549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90552 - BLOCK
      ?auto_90553 - BLOCK
      ?auto_90554 - BLOCK
      ?auto_90555 - BLOCK
      ?auto_90556 - BLOCK
      ?auto_90557 - BLOCK
    )
    :vars
    (
      ?auto_90558 - BLOCK
      ?auto_90559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90552 ) ( ON ?auto_90553 ?auto_90552 ) ( not ( = ?auto_90552 ?auto_90553 ) ) ( not ( = ?auto_90552 ?auto_90554 ) ) ( not ( = ?auto_90552 ?auto_90555 ) ) ( not ( = ?auto_90552 ?auto_90556 ) ) ( not ( = ?auto_90552 ?auto_90557 ) ) ( not ( = ?auto_90553 ?auto_90554 ) ) ( not ( = ?auto_90553 ?auto_90555 ) ) ( not ( = ?auto_90553 ?auto_90556 ) ) ( not ( = ?auto_90553 ?auto_90557 ) ) ( not ( = ?auto_90554 ?auto_90555 ) ) ( not ( = ?auto_90554 ?auto_90556 ) ) ( not ( = ?auto_90554 ?auto_90557 ) ) ( not ( = ?auto_90555 ?auto_90556 ) ) ( not ( = ?auto_90555 ?auto_90557 ) ) ( not ( = ?auto_90556 ?auto_90557 ) ) ( ON ?auto_90557 ?auto_90558 ) ( not ( = ?auto_90552 ?auto_90558 ) ) ( not ( = ?auto_90553 ?auto_90558 ) ) ( not ( = ?auto_90554 ?auto_90558 ) ) ( not ( = ?auto_90555 ?auto_90558 ) ) ( not ( = ?auto_90556 ?auto_90558 ) ) ( not ( = ?auto_90557 ?auto_90558 ) ) ( ON ?auto_90556 ?auto_90557 ) ( ON-TABLE ?auto_90559 ) ( ON ?auto_90558 ?auto_90559 ) ( not ( = ?auto_90559 ?auto_90558 ) ) ( not ( = ?auto_90559 ?auto_90557 ) ) ( not ( = ?auto_90559 ?auto_90556 ) ) ( not ( = ?auto_90552 ?auto_90559 ) ) ( not ( = ?auto_90553 ?auto_90559 ) ) ( not ( = ?auto_90554 ?auto_90559 ) ) ( not ( = ?auto_90555 ?auto_90559 ) ) ( ON ?auto_90555 ?auto_90556 ) ( CLEAR ?auto_90553 ) ( ON ?auto_90554 ?auto_90555 ) ( CLEAR ?auto_90554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90559 ?auto_90558 ?auto_90557 ?auto_90556 ?auto_90555 )
      ( MAKE-6PILE ?auto_90552 ?auto_90553 ?auto_90554 ?auto_90555 ?auto_90556 ?auto_90557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90560 - BLOCK
      ?auto_90561 - BLOCK
      ?auto_90562 - BLOCK
      ?auto_90563 - BLOCK
      ?auto_90564 - BLOCK
      ?auto_90565 - BLOCK
    )
    :vars
    (
      ?auto_90566 - BLOCK
      ?auto_90567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90560 ) ( not ( = ?auto_90560 ?auto_90561 ) ) ( not ( = ?auto_90560 ?auto_90562 ) ) ( not ( = ?auto_90560 ?auto_90563 ) ) ( not ( = ?auto_90560 ?auto_90564 ) ) ( not ( = ?auto_90560 ?auto_90565 ) ) ( not ( = ?auto_90561 ?auto_90562 ) ) ( not ( = ?auto_90561 ?auto_90563 ) ) ( not ( = ?auto_90561 ?auto_90564 ) ) ( not ( = ?auto_90561 ?auto_90565 ) ) ( not ( = ?auto_90562 ?auto_90563 ) ) ( not ( = ?auto_90562 ?auto_90564 ) ) ( not ( = ?auto_90562 ?auto_90565 ) ) ( not ( = ?auto_90563 ?auto_90564 ) ) ( not ( = ?auto_90563 ?auto_90565 ) ) ( not ( = ?auto_90564 ?auto_90565 ) ) ( ON ?auto_90565 ?auto_90566 ) ( not ( = ?auto_90560 ?auto_90566 ) ) ( not ( = ?auto_90561 ?auto_90566 ) ) ( not ( = ?auto_90562 ?auto_90566 ) ) ( not ( = ?auto_90563 ?auto_90566 ) ) ( not ( = ?auto_90564 ?auto_90566 ) ) ( not ( = ?auto_90565 ?auto_90566 ) ) ( ON ?auto_90564 ?auto_90565 ) ( ON-TABLE ?auto_90567 ) ( ON ?auto_90566 ?auto_90567 ) ( not ( = ?auto_90567 ?auto_90566 ) ) ( not ( = ?auto_90567 ?auto_90565 ) ) ( not ( = ?auto_90567 ?auto_90564 ) ) ( not ( = ?auto_90560 ?auto_90567 ) ) ( not ( = ?auto_90561 ?auto_90567 ) ) ( not ( = ?auto_90562 ?auto_90567 ) ) ( not ( = ?auto_90563 ?auto_90567 ) ) ( ON ?auto_90563 ?auto_90564 ) ( ON ?auto_90562 ?auto_90563 ) ( CLEAR ?auto_90562 ) ( HOLDING ?auto_90561 ) ( CLEAR ?auto_90560 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90560 ?auto_90561 )
      ( MAKE-6PILE ?auto_90560 ?auto_90561 ?auto_90562 ?auto_90563 ?auto_90564 ?auto_90565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90568 - BLOCK
      ?auto_90569 - BLOCK
      ?auto_90570 - BLOCK
      ?auto_90571 - BLOCK
      ?auto_90572 - BLOCK
      ?auto_90573 - BLOCK
    )
    :vars
    (
      ?auto_90574 - BLOCK
      ?auto_90575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90568 ) ( not ( = ?auto_90568 ?auto_90569 ) ) ( not ( = ?auto_90568 ?auto_90570 ) ) ( not ( = ?auto_90568 ?auto_90571 ) ) ( not ( = ?auto_90568 ?auto_90572 ) ) ( not ( = ?auto_90568 ?auto_90573 ) ) ( not ( = ?auto_90569 ?auto_90570 ) ) ( not ( = ?auto_90569 ?auto_90571 ) ) ( not ( = ?auto_90569 ?auto_90572 ) ) ( not ( = ?auto_90569 ?auto_90573 ) ) ( not ( = ?auto_90570 ?auto_90571 ) ) ( not ( = ?auto_90570 ?auto_90572 ) ) ( not ( = ?auto_90570 ?auto_90573 ) ) ( not ( = ?auto_90571 ?auto_90572 ) ) ( not ( = ?auto_90571 ?auto_90573 ) ) ( not ( = ?auto_90572 ?auto_90573 ) ) ( ON ?auto_90573 ?auto_90574 ) ( not ( = ?auto_90568 ?auto_90574 ) ) ( not ( = ?auto_90569 ?auto_90574 ) ) ( not ( = ?auto_90570 ?auto_90574 ) ) ( not ( = ?auto_90571 ?auto_90574 ) ) ( not ( = ?auto_90572 ?auto_90574 ) ) ( not ( = ?auto_90573 ?auto_90574 ) ) ( ON ?auto_90572 ?auto_90573 ) ( ON-TABLE ?auto_90575 ) ( ON ?auto_90574 ?auto_90575 ) ( not ( = ?auto_90575 ?auto_90574 ) ) ( not ( = ?auto_90575 ?auto_90573 ) ) ( not ( = ?auto_90575 ?auto_90572 ) ) ( not ( = ?auto_90568 ?auto_90575 ) ) ( not ( = ?auto_90569 ?auto_90575 ) ) ( not ( = ?auto_90570 ?auto_90575 ) ) ( not ( = ?auto_90571 ?auto_90575 ) ) ( ON ?auto_90571 ?auto_90572 ) ( ON ?auto_90570 ?auto_90571 ) ( CLEAR ?auto_90568 ) ( ON ?auto_90569 ?auto_90570 ) ( CLEAR ?auto_90569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90575 ?auto_90574 ?auto_90573 ?auto_90572 ?auto_90571 ?auto_90570 )
      ( MAKE-6PILE ?auto_90568 ?auto_90569 ?auto_90570 ?auto_90571 ?auto_90572 ?auto_90573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90576 - BLOCK
      ?auto_90577 - BLOCK
      ?auto_90578 - BLOCK
      ?auto_90579 - BLOCK
      ?auto_90580 - BLOCK
      ?auto_90581 - BLOCK
    )
    :vars
    (
      ?auto_90582 - BLOCK
      ?auto_90583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90576 ?auto_90577 ) ) ( not ( = ?auto_90576 ?auto_90578 ) ) ( not ( = ?auto_90576 ?auto_90579 ) ) ( not ( = ?auto_90576 ?auto_90580 ) ) ( not ( = ?auto_90576 ?auto_90581 ) ) ( not ( = ?auto_90577 ?auto_90578 ) ) ( not ( = ?auto_90577 ?auto_90579 ) ) ( not ( = ?auto_90577 ?auto_90580 ) ) ( not ( = ?auto_90577 ?auto_90581 ) ) ( not ( = ?auto_90578 ?auto_90579 ) ) ( not ( = ?auto_90578 ?auto_90580 ) ) ( not ( = ?auto_90578 ?auto_90581 ) ) ( not ( = ?auto_90579 ?auto_90580 ) ) ( not ( = ?auto_90579 ?auto_90581 ) ) ( not ( = ?auto_90580 ?auto_90581 ) ) ( ON ?auto_90581 ?auto_90582 ) ( not ( = ?auto_90576 ?auto_90582 ) ) ( not ( = ?auto_90577 ?auto_90582 ) ) ( not ( = ?auto_90578 ?auto_90582 ) ) ( not ( = ?auto_90579 ?auto_90582 ) ) ( not ( = ?auto_90580 ?auto_90582 ) ) ( not ( = ?auto_90581 ?auto_90582 ) ) ( ON ?auto_90580 ?auto_90581 ) ( ON-TABLE ?auto_90583 ) ( ON ?auto_90582 ?auto_90583 ) ( not ( = ?auto_90583 ?auto_90582 ) ) ( not ( = ?auto_90583 ?auto_90581 ) ) ( not ( = ?auto_90583 ?auto_90580 ) ) ( not ( = ?auto_90576 ?auto_90583 ) ) ( not ( = ?auto_90577 ?auto_90583 ) ) ( not ( = ?auto_90578 ?auto_90583 ) ) ( not ( = ?auto_90579 ?auto_90583 ) ) ( ON ?auto_90579 ?auto_90580 ) ( ON ?auto_90578 ?auto_90579 ) ( ON ?auto_90577 ?auto_90578 ) ( CLEAR ?auto_90577 ) ( HOLDING ?auto_90576 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90576 )
      ( MAKE-6PILE ?auto_90576 ?auto_90577 ?auto_90578 ?auto_90579 ?auto_90580 ?auto_90581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90584 - BLOCK
      ?auto_90585 - BLOCK
      ?auto_90586 - BLOCK
      ?auto_90587 - BLOCK
      ?auto_90588 - BLOCK
      ?auto_90589 - BLOCK
    )
    :vars
    (
      ?auto_90590 - BLOCK
      ?auto_90591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90584 ?auto_90585 ) ) ( not ( = ?auto_90584 ?auto_90586 ) ) ( not ( = ?auto_90584 ?auto_90587 ) ) ( not ( = ?auto_90584 ?auto_90588 ) ) ( not ( = ?auto_90584 ?auto_90589 ) ) ( not ( = ?auto_90585 ?auto_90586 ) ) ( not ( = ?auto_90585 ?auto_90587 ) ) ( not ( = ?auto_90585 ?auto_90588 ) ) ( not ( = ?auto_90585 ?auto_90589 ) ) ( not ( = ?auto_90586 ?auto_90587 ) ) ( not ( = ?auto_90586 ?auto_90588 ) ) ( not ( = ?auto_90586 ?auto_90589 ) ) ( not ( = ?auto_90587 ?auto_90588 ) ) ( not ( = ?auto_90587 ?auto_90589 ) ) ( not ( = ?auto_90588 ?auto_90589 ) ) ( ON ?auto_90589 ?auto_90590 ) ( not ( = ?auto_90584 ?auto_90590 ) ) ( not ( = ?auto_90585 ?auto_90590 ) ) ( not ( = ?auto_90586 ?auto_90590 ) ) ( not ( = ?auto_90587 ?auto_90590 ) ) ( not ( = ?auto_90588 ?auto_90590 ) ) ( not ( = ?auto_90589 ?auto_90590 ) ) ( ON ?auto_90588 ?auto_90589 ) ( ON-TABLE ?auto_90591 ) ( ON ?auto_90590 ?auto_90591 ) ( not ( = ?auto_90591 ?auto_90590 ) ) ( not ( = ?auto_90591 ?auto_90589 ) ) ( not ( = ?auto_90591 ?auto_90588 ) ) ( not ( = ?auto_90584 ?auto_90591 ) ) ( not ( = ?auto_90585 ?auto_90591 ) ) ( not ( = ?auto_90586 ?auto_90591 ) ) ( not ( = ?auto_90587 ?auto_90591 ) ) ( ON ?auto_90587 ?auto_90588 ) ( ON ?auto_90586 ?auto_90587 ) ( ON ?auto_90585 ?auto_90586 ) ( ON ?auto_90584 ?auto_90585 ) ( CLEAR ?auto_90584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90591 ?auto_90590 ?auto_90589 ?auto_90588 ?auto_90587 ?auto_90586 ?auto_90585 )
      ( MAKE-6PILE ?auto_90584 ?auto_90585 ?auto_90586 ?auto_90587 ?auto_90588 ?auto_90589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90593 - BLOCK
    )
    :vars
    (
      ?auto_90594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90594 ?auto_90593 ) ( CLEAR ?auto_90594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90593 ) ( not ( = ?auto_90593 ?auto_90594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90594 ?auto_90593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90595 - BLOCK
    )
    :vars
    (
      ?auto_90596 - BLOCK
      ?auto_90597 - BLOCK
      ?auto_90598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90596 ?auto_90595 ) ( CLEAR ?auto_90596 ) ( ON-TABLE ?auto_90595 ) ( not ( = ?auto_90595 ?auto_90596 ) ) ( HOLDING ?auto_90597 ) ( CLEAR ?auto_90598 ) ( not ( = ?auto_90595 ?auto_90597 ) ) ( not ( = ?auto_90595 ?auto_90598 ) ) ( not ( = ?auto_90596 ?auto_90597 ) ) ( not ( = ?auto_90596 ?auto_90598 ) ) ( not ( = ?auto_90597 ?auto_90598 ) ) )
    :subtasks
    ( ( !STACK ?auto_90597 ?auto_90598 )
      ( MAKE-1PILE ?auto_90595 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90599 - BLOCK
    )
    :vars
    (
      ?auto_90601 - BLOCK
      ?auto_90602 - BLOCK
      ?auto_90600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90601 ?auto_90599 ) ( ON-TABLE ?auto_90599 ) ( not ( = ?auto_90599 ?auto_90601 ) ) ( CLEAR ?auto_90602 ) ( not ( = ?auto_90599 ?auto_90600 ) ) ( not ( = ?auto_90599 ?auto_90602 ) ) ( not ( = ?auto_90601 ?auto_90600 ) ) ( not ( = ?auto_90601 ?auto_90602 ) ) ( not ( = ?auto_90600 ?auto_90602 ) ) ( ON ?auto_90600 ?auto_90601 ) ( CLEAR ?auto_90600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90599 ?auto_90601 )
      ( MAKE-1PILE ?auto_90599 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90603 - BLOCK
    )
    :vars
    (
      ?auto_90606 - BLOCK
      ?auto_90604 - BLOCK
      ?auto_90605 - BLOCK
      ?auto_90609 - BLOCK
      ?auto_90610 - BLOCK
      ?auto_90608 - BLOCK
      ?auto_90607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90606 ?auto_90603 ) ( ON-TABLE ?auto_90603 ) ( not ( = ?auto_90603 ?auto_90606 ) ) ( not ( = ?auto_90603 ?auto_90604 ) ) ( not ( = ?auto_90603 ?auto_90605 ) ) ( not ( = ?auto_90606 ?auto_90604 ) ) ( not ( = ?auto_90606 ?auto_90605 ) ) ( not ( = ?auto_90604 ?auto_90605 ) ) ( ON ?auto_90604 ?auto_90606 ) ( CLEAR ?auto_90604 ) ( HOLDING ?auto_90605 ) ( CLEAR ?auto_90609 ) ( ON-TABLE ?auto_90610 ) ( ON ?auto_90608 ?auto_90610 ) ( ON ?auto_90607 ?auto_90608 ) ( ON ?auto_90609 ?auto_90607 ) ( not ( = ?auto_90610 ?auto_90608 ) ) ( not ( = ?auto_90610 ?auto_90607 ) ) ( not ( = ?auto_90610 ?auto_90609 ) ) ( not ( = ?auto_90610 ?auto_90605 ) ) ( not ( = ?auto_90608 ?auto_90607 ) ) ( not ( = ?auto_90608 ?auto_90609 ) ) ( not ( = ?auto_90608 ?auto_90605 ) ) ( not ( = ?auto_90607 ?auto_90609 ) ) ( not ( = ?auto_90607 ?auto_90605 ) ) ( not ( = ?auto_90609 ?auto_90605 ) ) ( not ( = ?auto_90603 ?auto_90609 ) ) ( not ( = ?auto_90603 ?auto_90610 ) ) ( not ( = ?auto_90603 ?auto_90608 ) ) ( not ( = ?auto_90603 ?auto_90607 ) ) ( not ( = ?auto_90606 ?auto_90609 ) ) ( not ( = ?auto_90606 ?auto_90610 ) ) ( not ( = ?auto_90606 ?auto_90608 ) ) ( not ( = ?auto_90606 ?auto_90607 ) ) ( not ( = ?auto_90604 ?auto_90609 ) ) ( not ( = ?auto_90604 ?auto_90610 ) ) ( not ( = ?auto_90604 ?auto_90608 ) ) ( not ( = ?auto_90604 ?auto_90607 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90610 ?auto_90608 ?auto_90607 ?auto_90609 ?auto_90605 )
      ( MAKE-1PILE ?auto_90603 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90611 - BLOCK
    )
    :vars
    (
      ?auto_90618 - BLOCK
      ?auto_90615 - BLOCK
      ?auto_90612 - BLOCK
      ?auto_90614 - BLOCK
      ?auto_90613 - BLOCK
      ?auto_90617 - BLOCK
      ?auto_90616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90618 ?auto_90611 ) ( ON-TABLE ?auto_90611 ) ( not ( = ?auto_90611 ?auto_90618 ) ) ( not ( = ?auto_90611 ?auto_90615 ) ) ( not ( = ?auto_90611 ?auto_90612 ) ) ( not ( = ?auto_90618 ?auto_90615 ) ) ( not ( = ?auto_90618 ?auto_90612 ) ) ( not ( = ?auto_90615 ?auto_90612 ) ) ( ON ?auto_90615 ?auto_90618 ) ( CLEAR ?auto_90614 ) ( ON-TABLE ?auto_90613 ) ( ON ?auto_90617 ?auto_90613 ) ( ON ?auto_90616 ?auto_90617 ) ( ON ?auto_90614 ?auto_90616 ) ( not ( = ?auto_90613 ?auto_90617 ) ) ( not ( = ?auto_90613 ?auto_90616 ) ) ( not ( = ?auto_90613 ?auto_90614 ) ) ( not ( = ?auto_90613 ?auto_90612 ) ) ( not ( = ?auto_90617 ?auto_90616 ) ) ( not ( = ?auto_90617 ?auto_90614 ) ) ( not ( = ?auto_90617 ?auto_90612 ) ) ( not ( = ?auto_90616 ?auto_90614 ) ) ( not ( = ?auto_90616 ?auto_90612 ) ) ( not ( = ?auto_90614 ?auto_90612 ) ) ( not ( = ?auto_90611 ?auto_90614 ) ) ( not ( = ?auto_90611 ?auto_90613 ) ) ( not ( = ?auto_90611 ?auto_90617 ) ) ( not ( = ?auto_90611 ?auto_90616 ) ) ( not ( = ?auto_90618 ?auto_90614 ) ) ( not ( = ?auto_90618 ?auto_90613 ) ) ( not ( = ?auto_90618 ?auto_90617 ) ) ( not ( = ?auto_90618 ?auto_90616 ) ) ( not ( = ?auto_90615 ?auto_90614 ) ) ( not ( = ?auto_90615 ?auto_90613 ) ) ( not ( = ?auto_90615 ?auto_90617 ) ) ( not ( = ?auto_90615 ?auto_90616 ) ) ( ON ?auto_90612 ?auto_90615 ) ( CLEAR ?auto_90612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90611 ?auto_90618 ?auto_90615 )
      ( MAKE-1PILE ?auto_90611 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90619 - BLOCK
    )
    :vars
    (
      ?auto_90621 - BLOCK
      ?auto_90620 - BLOCK
      ?auto_90626 - BLOCK
      ?auto_90625 - BLOCK
      ?auto_90622 - BLOCK
      ?auto_90624 - BLOCK
      ?auto_90623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90621 ?auto_90619 ) ( ON-TABLE ?auto_90619 ) ( not ( = ?auto_90619 ?auto_90621 ) ) ( not ( = ?auto_90619 ?auto_90620 ) ) ( not ( = ?auto_90619 ?auto_90626 ) ) ( not ( = ?auto_90621 ?auto_90620 ) ) ( not ( = ?auto_90621 ?auto_90626 ) ) ( not ( = ?auto_90620 ?auto_90626 ) ) ( ON ?auto_90620 ?auto_90621 ) ( ON-TABLE ?auto_90625 ) ( ON ?auto_90622 ?auto_90625 ) ( ON ?auto_90624 ?auto_90622 ) ( not ( = ?auto_90625 ?auto_90622 ) ) ( not ( = ?auto_90625 ?auto_90624 ) ) ( not ( = ?auto_90625 ?auto_90623 ) ) ( not ( = ?auto_90625 ?auto_90626 ) ) ( not ( = ?auto_90622 ?auto_90624 ) ) ( not ( = ?auto_90622 ?auto_90623 ) ) ( not ( = ?auto_90622 ?auto_90626 ) ) ( not ( = ?auto_90624 ?auto_90623 ) ) ( not ( = ?auto_90624 ?auto_90626 ) ) ( not ( = ?auto_90623 ?auto_90626 ) ) ( not ( = ?auto_90619 ?auto_90623 ) ) ( not ( = ?auto_90619 ?auto_90625 ) ) ( not ( = ?auto_90619 ?auto_90622 ) ) ( not ( = ?auto_90619 ?auto_90624 ) ) ( not ( = ?auto_90621 ?auto_90623 ) ) ( not ( = ?auto_90621 ?auto_90625 ) ) ( not ( = ?auto_90621 ?auto_90622 ) ) ( not ( = ?auto_90621 ?auto_90624 ) ) ( not ( = ?auto_90620 ?auto_90623 ) ) ( not ( = ?auto_90620 ?auto_90625 ) ) ( not ( = ?auto_90620 ?auto_90622 ) ) ( not ( = ?auto_90620 ?auto_90624 ) ) ( ON ?auto_90626 ?auto_90620 ) ( CLEAR ?auto_90626 ) ( HOLDING ?auto_90623 ) ( CLEAR ?auto_90624 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90625 ?auto_90622 ?auto_90624 ?auto_90623 )
      ( MAKE-1PILE ?auto_90619 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90627 - BLOCK
    )
    :vars
    (
      ?auto_90628 - BLOCK
      ?auto_90629 - BLOCK
      ?auto_90634 - BLOCK
      ?auto_90631 - BLOCK
      ?auto_90632 - BLOCK
      ?auto_90630 - BLOCK
      ?auto_90633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90628 ?auto_90627 ) ( ON-TABLE ?auto_90627 ) ( not ( = ?auto_90627 ?auto_90628 ) ) ( not ( = ?auto_90627 ?auto_90629 ) ) ( not ( = ?auto_90627 ?auto_90634 ) ) ( not ( = ?auto_90628 ?auto_90629 ) ) ( not ( = ?auto_90628 ?auto_90634 ) ) ( not ( = ?auto_90629 ?auto_90634 ) ) ( ON ?auto_90629 ?auto_90628 ) ( ON-TABLE ?auto_90631 ) ( ON ?auto_90632 ?auto_90631 ) ( ON ?auto_90630 ?auto_90632 ) ( not ( = ?auto_90631 ?auto_90632 ) ) ( not ( = ?auto_90631 ?auto_90630 ) ) ( not ( = ?auto_90631 ?auto_90633 ) ) ( not ( = ?auto_90631 ?auto_90634 ) ) ( not ( = ?auto_90632 ?auto_90630 ) ) ( not ( = ?auto_90632 ?auto_90633 ) ) ( not ( = ?auto_90632 ?auto_90634 ) ) ( not ( = ?auto_90630 ?auto_90633 ) ) ( not ( = ?auto_90630 ?auto_90634 ) ) ( not ( = ?auto_90633 ?auto_90634 ) ) ( not ( = ?auto_90627 ?auto_90633 ) ) ( not ( = ?auto_90627 ?auto_90631 ) ) ( not ( = ?auto_90627 ?auto_90632 ) ) ( not ( = ?auto_90627 ?auto_90630 ) ) ( not ( = ?auto_90628 ?auto_90633 ) ) ( not ( = ?auto_90628 ?auto_90631 ) ) ( not ( = ?auto_90628 ?auto_90632 ) ) ( not ( = ?auto_90628 ?auto_90630 ) ) ( not ( = ?auto_90629 ?auto_90633 ) ) ( not ( = ?auto_90629 ?auto_90631 ) ) ( not ( = ?auto_90629 ?auto_90632 ) ) ( not ( = ?auto_90629 ?auto_90630 ) ) ( ON ?auto_90634 ?auto_90629 ) ( CLEAR ?auto_90630 ) ( ON ?auto_90633 ?auto_90634 ) ( CLEAR ?auto_90633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90627 ?auto_90628 ?auto_90629 ?auto_90634 )
      ( MAKE-1PILE ?auto_90627 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90635 - BLOCK
    )
    :vars
    (
      ?auto_90637 - BLOCK
      ?auto_90638 - BLOCK
      ?auto_90636 - BLOCK
      ?auto_90641 - BLOCK
      ?auto_90640 - BLOCK
      ?auto_90639 - BLOCK
      ?auto_90642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90637 ?auto_90635 ) ( ON-TABLE ?auto_90635 ) ( not ( = ?auto_90635 ?auto_90637 ) ) ( not ( = ?auto_90635 ?auto_90638 ) ) ( not ( = ?auto_90635 ?auto_90636 ) ) ( not ( = ?auto_90637 ?auto_90638 ) ) ( not ( = ?auto_90637 ?auto_90636 ) ) ( not ( = ?auto_90638 ?auto_90636 ) ) ( ON ?auto_90638 ?auto_90637 ) ( ON-TABLE ?auto_90641 ) ( ON ?auto_90640 ?auto_90641 ) ( not ( = ?auto_90641 ?auto_90640 ) ) ( not ( = ?auto_90641 ?auto_90639 ) ) ( not ( = ?auto_90641 ?auto_90642 ) ) ( not ( = ?auto_90641 ?auto_90636 ) ) ( not ( = ?auto_90640 ?auto_90639 ) ) ( not ( = ?auto_90640 ?auto_90642 ) ) ( not ( = ?auto_90640 ?auto_90636 ) ) ( not ( = ?auto_90639 ?auto_90642 ) ) ( not ( = ?auto_90639 ?auto_90636 ) ) ( not ( = ?auto_90642 ?auto_90636 ) ) ( not ( = ?auto_90635 ?auto_90642 ) ) ( not ( = ?auto_90635 ?auto_90641 ) ) ( not ( = ?auto_90635 ?auto_90640 ) ) ( not ( = ?auto_90635 ?auto_90639 ) ) ( not ( = ?auto_90637 ?auto_90642 ) ) ( not ( = ?auto_90637 ?auto_90641 ) ) ( not ( = ?auto_90637 ?auto_90640 ) ) ( not ( = ?auto_90637 ?auto_90639 ) ) ( not ( = ?auto_90638 ?auto_90642 ) ) ( not ( = ?auto_90638 ?auto_90641 ) ) ( not ( = ?auto_90638 ?auto_90640 ) ) ( not ( = ?auto_90638 ?auto_90639 ) ) ( ON ?auto_90636 ?auto_90638 ) ( ON ?auto_90642 ?auto_90636 ) ( CLEAR ?auto_90642 ) ( HOLDING ?auto_90639 ) ( CLEAR ?auto_90640 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90641 ?auto_90640 ?auto_90639 )
      ( MAKE-1PILE ?auto_90635 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90643 - BLOCK
    )
    :vars
    (
      ?auto_90648 - BLOCK
      ?auto_90646 - BLOCK
      ?auto_90644 - BLOCK
      ?auto_90650 - BLOCK
      ?auto_90645 - BLOCK
      ?auto_90647 - BLOCK
      ?auto_90649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90648 ?auto_90643 ) ( ON-TABLE ?auto_90643 ) ( not ( = ?auto_90643 ?auto_90648 ) ) ( not ( = ?auto_90643 ?auto_90646 ) ) ( not ( = ?auto_90643 ?auto_90644 ) ) ( not ( = ?auto_90648 ?auto_90646 ) ) ( not ( = ?auto_90648 ?auto_90644 ) ) ( not ( = ?auto_90646 ?auto_90644 ) ) ( ON ?auto_90646 ?auto_90648 ) ( ON-TABLE ?auto_90650 ) ( ON ?auto_90645 ?auto_90650 ) ( not ( = ?auto_90650 ?auto_90645 ) ) ( not ( = ?auto_90650 ?auto_90647 ) ) ( not ( = ?auto_90650 ?auto_90649 ) ) ( not ( = ?auto_90650 ?auto_90644 ) ) ( not ( = ?auto_90645 ?auto_90647 ) ) ( not ( = ?auto_90645 ?auto_90649 ) ) ( not ( = ?auto_90645 ?auto_90644 ) ) ( not ( = ?auto_90647 ?auto_90649 ) ) ( not ( = ?auto_90647 ?auto_90644 ) ) ( not ( = ?auto_90649 ?auto_90644 ) ) ( not ( = ?auto_90643 ?auto_90649 ) ) ( not ( = ?auto_90643 ?auto_90650 ) ) ( not ( = ?auto_90643 ?auto_90645 ) ) ( not ( = ?auto_90643 ?auto_90647 ) ) ( not ( = ?auto_90648 ?auto_90649 ) ) ( not ( = ?auto_90648 ?auto_90650 ) ) ( not ( = ?auto_90648 ?auto_90645 ) ) ( not ( = ?auto_90648 ?auto_90647 ) ) ( not ( = ?auto_90646 ?auto_90649 ) ) ( not ( = ?auto_90646 ?auto_90650 ) ) ( not ( = ?auto_90646 ?auto_90645 ) ) ( not ( = ?auto_90646 ?auto_90647 ) ) ( ON ?auto_90644 ?auto_90646 ) ( ON ?auto_90649 ?auto_90644 ) ( CLEAR ?auto_90645 ) ( ON ?auto_90647 ?auto_90649 ) ( CLEAR ?auto_90647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90643 ?auto_90648 ?auto_90646 ?auto_90644 ?auto_90649 )
      ( MAKE-1PILE ?auto_90643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90651 - BLOCK
    )
    :vars
    (
      ?auto_90656 - BLOCK
      ?auto_90657 - BLOCK
      ?auto_90653 - BLOCK
      ?auto_90655 - BLOCK
      ?auto_90654 - BLOCK
      ?auto_90658 - BLOCK
      ?auto_90652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90656 ?auto_90651 ) ( ON-TABLE ?auto_90651 ) ( not ( = ?auto_90651 ?auto_90656 ) ) ( not ( = ?auto_90651 ?auto_90657 ) ) ( not ( = ?auto_90651 ?auto_90653 ) ) ( not ( = ?auto_90656 ?auto_90657 ) ) ( not ( = ?auto_90656 ?auto_90653 ) ) ( not ( = ?auto_90657 ?auto_90653 ) ) ( ON ?auto_90657 ?auto_90656 ) ( ON-TABLE ?auto_90655 ) ( not ( = ?auto_90655 ?auto_90654 ) ) ( not ( = ?auto_90655 ?auto_90658 ) ) ( not ( = ?auto_90655 ?auto_90652 ) ) ( not ( = ?auto_90655 ?auto_90653 ) ) ( not ( = ?auto_90654 ?auto_90658 ) ) ( not ( = ?auto_90654 ?auto_90652 ) ) ( not ( = ?auto_90654 ?auto_90653 ) ) ( not ( = ?auto_90658 ?auto_90652 ) ) ( not ( = ?auto_90658 ?auto_90653 ) ) ( not ( = ?auto_90652 ?auto_90653 ) ) ( not ( = ?auto_90651 ?auto_90652 ) ) ( not ( = ?auto_90651 ?auto_90655 ) ) ( not ( = ?auto_90651 ?auto_90654 ) ) ( not ( = ?auto_90651 ?auto_90658 ) ) ( not ( = ?auto_90656 ?auto_90652 ) ) ( not ( = ?auto_90656 ?auto_90655 ) ) ( not ( = ?auto_90656 ?auto_90654 ) ) ( not ( = ?auto_90656 ?auto_90658 ) ) ( not ( = ?auto_90657 ?auto_90652 ) ) ( not ( = ?auto_90657 ?auto_90655 ) ) ( not ( = ?auto_90657 ?auto_90654 ) ) ( not ( = ?auto_90657 ?auto_90658 ) ) ( ON ?auto_90653 ?auto_90657 ) ( ON ?auto_90652 ?auto_90653 ) ( ON ?auto_90658 ?auto_90652 ) ( CLEAR ?auto_90658 ) ( HOLDING ?auto_90654 ) ( CLEAR ?auto_90655 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90655 ?auto_90654 )
      ( MAKE-1PILE ?auto_90651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90659 - BLOCK
    )
    :vars
    (
      ?auto_90666 - BLOCK
      ?auto_90660 - BLOCK
      ?auto_90665 - BLOCK
      ?auto_90664 - BLOCK
      ?auto_90663 - BLOCK
      ?auto_90661 - BLOCK
      ?auto_90662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90666 ?auto_90659 ) ( ON-TABLE ?auto_90659 ) ( not ( = ?auto_90659 ?auto_90666 ) ) ( not ( = ?auto_90659 ?auto_90660 ) ) ( not ( = ?auto_90659 ?auto_90665 ) ) ( not ( = ?auto_90666 ?auto_90660 ) ) ( not ( = ?auto_90666 ?auto_90665 ) ) ( not ( = ?auto_90660 ?auto_90665 ) ) ( ON ?auto_90660 ?auto_90666 ) ( ON-TABLE ?auto_90664 ) ( not ( = ?auto_90664 ?auto_90663 ) ) ( not ( = ?auto_90664 ?auto_90661 ) ) ( not ( = ?auto_90664 ?auto_90662 ) ) ( not ( = ?auto_90664 ?auto_90665 ) ) ( not ( = ?auto_90663 ?auto_90661 ) ) ( not ( = ?auto_90663 ?auto_90662 ) ) ( not ( = ?auto_90663 ?auto_90665 ) ) ( not ( = ?auto_90661 ?auto_90662 ) ) ( not ( = ?auto_90661 ?auto_90665 ) ) ( not ( = ?auto_90662 ?auto_90665 ) ) ( not ( = ?auto_90659 ?auto_90662 ) ) ( not ( = ?auto_90659 ?auto_90664 ) ) ( not ( = ?auto_90659 ?auto_90663 ) ) ( not ( = ?auto_90659 ?auto_90661 ) ) ( not ( = ?auto_90666 ?auto_90662 ) ) ( not ( = ?auto_90666 ?auto_90664 ) ) ( not ( = ?auto_90666 ?auto_90663 ) ) ( not ( = ?auto_90666 ?auto_90661 ) ) ( not ( = ?auto_90660 ?auto_90662 ) ) ( not ( = ?auto_90660 ?auto_90664 ) ) ( not ( = ?auto_90660 ?auto_90663 ) ) ( not ( = ?auto_90660 ?auto_90661 ) ) ( ON ?auto_90665 ?auto_90660 ) ( ON ?auto_90662 ?auto_90665 ) ( ON ?auto_90661 ?auto_90662 ) ( CLEAR ?auto_90664 ) ( ON ?auto_90663 ?auto_90661 ) ( CLEAR ?auto_90663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90659 ?auto_90666 ?auto_90660 ?auto_90665 ?auto_90662 ?auto_90661 )
      ( MAKE-1PILE ?auto_90659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90667 - BLOCK
    )
    :vars
    (
      ?auto_90669 - BLOCK
      ?auto_90670 - BLOCK
      ?auto_90668 - BLOCK
      ?auto_90671 - BLOCK
      ?auto_90672 - BLOCK
      ?auto_90674 - BLOCK
      ?auto_90673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90669 ?auto_90667 ) ( ON-TABLE ?auto_90667 ) ( not ( = ?auto_90667 ?auto_90669 ) ) ( not ( = ?auto_90667 ?auto_90670 ) ) ( not ( = ?auto_90667 ?auto_90668 ) ) ( not ( = ?auto_90669 ?auto_90670 ) ) ( not ( = ?auto_90669 ?auto_90668 ) ) ( not ( = ?auto_90670 ?auto_90668 ) ) ( ON ?auto_90670 ?auto_90669 ) ( not ( = ?auto_90671 ?auto_90672 ) ) ( not ( = ?auto_90671 ?auto_90674 ) ) ( not ( = ?auto_90671 ?auto_90673 ) ) ( not ( = ?auto_90671 ?auto_90668 ) ) ( not ( = ?auto_90672 ?auto_90674 ) ) ( not ( = ?auto_90672 ?auto_90673 ) ) ( not ( = ?auto_90672 ?auto_90668 ) ) ( not ( = ?auto_90674 ?auto_90673 ) ) ( not ( = ?auto_90674 ?auto_90668 ) ) ( not ( = ?auto_90673 ?auto_90668 ) ) ( not ( = ?auto_90667 ?auto_90673 ) ) ( not ( = ?auto_90667 ?auto_90671 ) ) ( not ( = ?auto_90667 ?auto_90672 ) ) ( not ( = ?auto_90667 ?auto_90674 ) ) ( not ( = ?auto_90669 ?auto_90673 ) ) ( not ( = ?auto_90669 ?auto_90671 ) ) ( not ( = ?auto_90669 ?auto_90672 ) ) ( not ( = ?auto_90669 ?auto_90674 ) ) ( not ( = ?auto_90670 ?auto_90673 ) ) ( not ( = ?auto_90670 ?auto_90671 ) ) ( not ( = ?auto_90670 ?auto_90672 ) ) ( not ( = ?auto_90670 ?auto_90674 ) ) ( ON ?auto_90668 ?auto_90670 ) ( ON ?auto_90673 ?auto_90668 ) ( ON ?auto_90674 ?auto_90673 ) ( ON ?auto_90672 ?auto_90674 ) ( CLEAR ?auto_90672 ) ( HOLDING ?auto_90671 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90671 )
      ( MAKE-1PILE ?auto_90667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90675 - BLOCK
    )
    :vars
    (
      ?auto_90681 - BLOCK
      ?auto_90680 - BLOCK
      ?auto_90679 - BLOCK
      ?auto_90682 - BLOCK
      ?auto_90676 - BLOCK
      ?auto_90678 - BLOCK
      ?auto_90677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90681 ?auto_90675 ) ( ON-TABLE ?auto_90675 ) ( not ( = ?auto_90675 ?auto_90681 ) ) ( not ( = ?auto_90675 ?auto_90680 ) ) ( not ( = ?auto_90675 ?auto_90679 ) ) ( not ( = ?auto_90681 ?auto_90680 ) ) ( not ( = ?auto_90681 ?auto_90679 ) ) ( not ( = ?auto_90680 ?auto_90679 ) ) ( ON ?auto_90680 ?auto_90681 ) ( not ( = ?auto_90682 ?auto_90676 ) ) ( not ( = ?auto_90682 ?auto_90678 ) ) ( not ( = ?auto_90682 ?auto_90677 ) ) ( not ( = ?auto_90682 ?auto_90679 ) ) ( not ( = ?auto_90676 ?auto_90678 ) ) ( not ( = ?auto_90676 ?auto_90677 ) ) ( not ( = ?auto_90676 ?auto_90679 ) ) ( not ( = ?auto_90678 ?auto_90677 ) ) ( not ( = ?auto_90678 ?auto_90679 ) ) ( not ( = ?auto_90677 ?auto_90679 ) ) ( not ( = ?auto_90675 ?auto_90677 ) ) ( not ( = ?auto_90675 ?auto_90682 ) ) ( not ( = ?auto_90675 ?auto_90676 ) ) ( not ( = ?auto_90675 ?auto_90678 ) ) ( not ( = ?auto_90681 ?auto_90677 ) ) ( not ( = ?auto_90681 ?auto_90682 ) ) ( not ( = ?auto_90681 ?auto_90676 ) ) ( not ( = ?auto_90681 ?auto_90678 ) ) ( not ( = ?auto_90680 ?auto_90677 ) ) ( not ( = ?auto_90680 ?auto_90682 ) ) ( not ( = ?auto_90680 ?auto_90676 ) ) ( not ( = ?auto_90680 ?auto_90678 ) ) ( ON ?auto_90679 ?auto_90680 ) ( ON ?auto_90677 ?auto_90679 ) ( ON ?auto_90678 ?auto_90677 ) ( ON ?auto_90676 ?auto_90678 ) ( ON ?auto_90682 ?auto_90676 ) ( CLEAR ?auto_90682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90675 ?auto_90681 ?auto_90680 ?auto_90679 ?auto_90677 ?auto_90678 ?auto_90676 )
      ( MAKE-1PILE ?auto_90675 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90690 - BLOCK
      ?auto_90691 - BLOCK
      ?auto_90692 - BLOCK
      ?auto_90693 - BLOCK
      ?auto_90694 - BLOCK
      ?auto_90695 - BLOCK
      ?auto_90696 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90696 ) ( CLEAR ?auto_90695 ) ( ON-TABLE ?auto_90690 ) ( ON ?auto_90691 ?auto_90690 ) ( ON ?auto_90692 ?auto_90691 ) ( ON ?auto_90693 ?auto_90692 ) ( ON ?auto_90694 ?auto_90693 ) ( ON ?auto_90695 ?auto_90694 ) ( not ( = ?auto_90690 ?auto_90691 ) ) ( not ( = ?auto_90690 ?auto_90692 ) ) ( not ( = ?auto_90690 ?auto_90693 ) ) ( not ( = ?auto_90690 ?auto_90694 ) ) ( not ( = ?auto_90690 ?auto_90695 ) ) ( not ( = ?auto_90690 ?auto_90696 ) ) ( not ( = ?auto_90691 ?auto_90692 ) ) ( not ( = ?auto_90691 ?auto_90693 ) ) ( not ( = ?auto_90691 ?auto_90694 ) ) ( not ( = ?auto_90691 ?auto_90695 ) ) ( not ( = ?auto_90691 ?auto_90696 ) ) ( not ( = ?auto_90692 ?auto_90693 ) ) ( not ( = ?auto_90692 ?auto_90694 ) ) ( not ( = ?auto_90692 ?auto_90695 ) ) ( not ( = ?auto_90692 ?auto_90696 ) ) ( not ( = ?auto_90693 ?auto_90694 ) ) ( not ( = ?auto_90693 ?auto_90695 ) ) ( not ( = ?auto_90693 ?auto_90696 ) ) ( not ( = ?auto_90694 ?auto_90695 ) ) ( not ( = ?auto_90694 ?auto_90696 ) ) ( not ( = ?auto_90695 ?auto_90696 ) ) )
    :subtasks
    ( ( !STACK ?auto_90696 ?auto_90695 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90697 - BLOCK
      ?auto_90698 - BLOCK
      ?auto_90699 - BLOCK
      ?auto_90700 - BLOCK
      ?auto_90701 - BLOCK
      ?auto_90702 - BLOCK
      ?auto_90703 - BLOCK
    )
    :vars
    (
      ?auto_90704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_90702 ) ( ON-TABLE ?auto_90697 ) ( ON ?auto_90698 ?auto_90697 ) ( ON ?auto_90699 ?auto_90698 ) ( ON ?auto_90700 ?auto_90699 ) ( ON ?auto_90701 ?auto_90700 ) ( ON ?auto_90702 ?auto_90701 ) ( not ( = ?auto_90697 ?auto_90698 ) ) ( not ( = ?auto_90697 ?auto_90699 ) ) ( not ( = ?auto_90697 ?auto_90700 ) ) ( not ( = ?auto_90697 ?auto_90701 ) ) ( not ( = ?auto_90697 ?auto_90702 ) ) ( not ( = ?auto_90697 ?auto_90703 ) ) ( not ( = ?auto_90698 ?auto_90699 ) ) ( not ( = ?auto_90698 ?auto_90700 ) ) ( not ( = ?auto_90698 ?auto_90701 ) ) ( not ( = ?auto_90698 ?auto_90702 ) ) ( not ( = ?auto_90698 ?auto_90703 ) ) ( not ( = ?auto_90699 ?auto_90700 ) ) ( not ( = ?auto_90699 ?auto_90701 ) ) ( not ( = ?auto_90699 ?auto_90702 ) ) ( not ( = ?auto_90699 ?auto_90703 ) ) ( not ( = ?auto_90700 ?auto_90701 ) ) ( not ( = ?auto_90700 ?auto_90702 ) ) ( not ( = ?auto_90700 ?auto_90703 ) ) ( not ( = ?auto_90701 ?auto_90702 ) ) ( not ( = ?auto_90701 ?auto_90703 ) ) ( not ( = ?auto_90702 ?auto_90703 ) ) ( ON ?auto_90703 ?auto_90704 ) ( CLEAR ?auto_90703 ) ( HAND-EMPTY ) ( not ( = ?auto_90697 ?auto_90704 ) ) ( not ( = ?auto_90698 ?auto_90704 ) ) ( not ( = ?auto_90699 ?auto_90704 ) ) ( not ( = ?auto_90700 ?auto_90704 ) ) ( not ( = ?auto_90701 ?auto_90704 ) ) ( not ( = ?auto_90702 ?auto_90704 ) ) ( not ( = ?auto_90703 ?auto_90704 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90703 ?auto_90704 )
      ( MAKE-7PILE ?auto_90697 ?auto_90698 ?auto_90699 ?auto_90700 ?auto_90701 ?auto_90702 ?auto_90703 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90705 - BLOCK
      ?auto_90706 - BLOCK
      ?auto_90707 - BLOCK
      ?auto_90708 - BLOCK
      ?auto_90709 - BLOCK
      ?auto_90710 - BLOCK
      ?auto_90711 - BLOCK
    )
    :vars
    (
      ?auto_90712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90705 ) ( ON ?auto_90706 ?auto_90705 ) ( ON ?auto_90707 ?auto_90706 ) ( ON ?auto_90708 ?auto_90707 ) ( ON ?auto_90709 ?auto_90708 ) ( not ( = ?auto_90705 ?auto_90706 ) ) ( not ( = ?auto_90705 ?auto_90707 ) ) ( not ( = ?auto_90705 ?auto_90708 ) ) ( not ( = ?auto_90705 ?auto_90709 ) ) ( not ( = ?auto_90705 ?auto_90710 ) ) ( not ( = ?auto_90705 ?auto_90711 ) ) ( not ( = ?auto_90706 ?auto_90707 ) ) ( not ( = ?auto_90706 ?auto_90708 ) ) ( not ( = ?auto_90706 ?auto_90709 ) ) ( not ( = ?auto_90706 ?auto_90710 ) ) ( not ( = ?auto_90706 ?auto_90711 ) ) ( not ( = ?auto_90707 ?auto_90708 ) ) ( not ( = ?auto_90707 ?auto_90709 ) ) ( not ( = ?auto_90707 ?auto_90710 ) ) ( not ( = ?auto_90707 ?auto_90711 ) ) ( not ( = ?auto_90708 ?auto_90709 ) ) ( not ( = ?auto_90708 ?auto_90710 ) ) ( not ( = ?auto_90708 ?auto_90711 ) ) ( not ( = ?auto_90709 ?auto_90710 ) ) ( not ( = ?auto_90709 ?auto_90711 ) ) ( not ( = ?auto_90710 ?auto_90711 ) ) ( ON ?auto_90711 ?auto_90712 ) ( CLEAR ?auto_90711 ) ( not ( = ?auto_90705 ?auto_90712 ) ) ( not ( = ?auto_90706 ?auto_90712 ) ) ( not ( = ?auto_90707 ?auto_90712 ) ) ( not ( = ?auto_90708 ?auto_90712 ) ) ( not ( = ?auto_90709 ?auto_90712 ) ) ( not ( = ?auto_90710 ?auto_90712 ) ) ( not ( = ?auto_90711 ?auto_90712 ) ) ( HOLDING ?auto_90710 ) ( CLEAR ?auto_90709 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90705 ?auto_90706 ?auto_90707 ?auto_90708 ?auto_90709 ?auto_90710 )
      ( MAKE-7PILE ?auto_90705 ?auto_90706 ?auto_90707 ?auto_90708 ?auto_90709 ?auto_90710 ?auto_90711 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90713 - BLOCK
      ?auto_90714 - BLOCK
      ?auto_90715 - BLOCK
      ?auto_90716 - BLOCK
      ?auto_90717 - BLOCK
      ?auto_90718 - BLOCK
      ?auto_90719 - BLOCK
    )
    :vars
    (
      ?auto_90720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90713 ) ( ON ?auto_90714 ?auto_90713 ) ( ON ?auto_90715 ?auto_90714 ) ( ON ?auto_90716 ?auto_90715 ) ( ON ?auto_90717 ?auto_90716 ) ( not ( = ?auto_90713 ?auto_90714 ) ) ( not ( = ?auto_90713 ?auto_90715 ) ) ( not ( = ?auto_90713 ?auto_90716 ) ) ( not ( = ?auto_90713 ?auto_90717 ) ) ( not ( = ?auto_90713 ?auto_90718 ) ) ( not ( = ?auto_90713 ?auto_90719 ) ) ( not ( = ?auto_90714 ?auto_90715 ) ) ( not ( = ?auto_90714 ?auto_90716 ) ) ( not ( = ?auto_90714 ?auto_90717 ) ) ( not ( = ?auto_90714 ?auto_90718 ) ) ( not ( = ?auto_90714 ?auto_90719 ) ) ( not ( = ?auto_90715 ?auto_90716 ) ) ( not ( = ?auto_90715 ?auto_90717 ) ) ( not ( = ?auto_90715 ?auto_90718 ) ) ( not ( = ?auto_90715 ?auto_90719 ) ) ( not ( = ?auto_90716 ?auto_90717 ) ) ( not ( = ?auto_90716 ?auto_90718 ) ) ( not ( = ?auto_90716 ?auto_90719 ) ) ( not ( = ?auto_90717 ?auto_90718 ) ) ( not ( = ?auto_90717 ?auto_90719 ) ) ( not ( = ?auto_90718 ?auto_90719 ) ) ( ON ?auto_90719 ?auto_90720 ) ( not ( = ?auto_90713 ?auto_90720 ) ) ( not ( = ?auto_90714 ?auto_90720 ) ) ( not ( = ?auto_90715 ?auto_90720 ) ) ( not ( = ?auto_90716 ?auto_90720 ) ) ( not ( = ?auto_90717 ?auto_90720 ) ) ( not ( = ?auto_90718 ?auto_90720 ) ) ( not ( = ?auto_90719 ?auto_90720 ) ) ( CLEAR ?auto_90717 ) ( ON ?auto_90718 ?auto_90719 ) ( CLEAR ?auto_90718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90720 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90720 ?auto_90719 )
      ( MAKE-7PILE ?auto_90713 ?auto_90714 ?auto_90715 ?auto_90716 ?auto_90717 ?auto_90718 ?auto_90719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90721 - BLOCK
      ?auto_90722 - BLOCK
      ?auto_90723 - BLOCK
      ?auto_90724 - BLOCK
      ?auto_90725 - BLOCK
      ?auto_90726 - BLOCK
      ?auto_90727 - BLOCK
    )
    :vars
    (
      ?auto_90728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90721 ) ( ON ?auto_90722 ?auto_90721 ) ( ON ?auto_90723 ?auto_90722 ) ( ON ?auto_90724 ?auto_90723 ) ( not ( = ?auto_90721 ?auto_90722 ) ) ( not ( = ?auto_90721 ?auto_90723 ) ) ( not ( = ?auto_90721 ?auto_90724 ) ) ( not ( = ?auto_90721 ?auto_90725 ) ) ( not ( = ?auto_90721 ?auto_90726 ) ) ( not ( = ?auto_90721 ?auto_90727 ) ) ( not ( = ?auto_90722 ?auto_90723 ) ) ( not ( = ?auto_90722 ?auto_90724 ) ) ( not ( = ?auto_90722 ?auto_90725 ) ) ( not ( = ?auto_90722 ?auto_90726 ) ) ( not ( = ?auto_90722 ?auto_90727 ) ) ( not ( = ?auto_90723 ?auto_90724 ) ) ( not ( = ?auto_90723 ?auto_90725 ) ) ( not ( = ?auto_90723 ?auto_90726 ) ) ( not ( = ?auto_90723 ?auto_90727 ) ) ( not ( = ?auto_90724 ?auto_90725 ) ) ( not ( = ?auto_90724 ?auto_90726 ) ) ( not ( = ?auto_90724 ?auto_90727 ) ) ( not ( = ?auto_90725 ?auto_90726 ) ) ( not ( = ?auto_90725 ?auto_90727 ) ) ( not ( = ?auto_90726 ?auto_90727 ) ) ( ON ?auto_90727 ?auto_90728 ) ( not ( = ?auto_90721 ?auto_90728 ) ) ( not ( = ?auto_90722 ?auto_90728 ) ) ( not ( = ?auto_90723 ?auto_90728 ) ) ( not ( = ?auto_90724 ?auto_90728 ) ) ( not ( = ?auto_90725 ?auto_90728 ) ) ( not ( = ?auto_90726 ?auto_90728 ) ) ( not ( = ?auto_90727 ?auto_90728 ) ) ( ON ?auto_90726 ?auto_90727 ) ( CLEAR ?auto_90726 ) ( ON-TABLE ?auto_90728 ) ( HOLDING ?auto_90725 ) ( CLEAR ?auto_90724 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90721 ?auto_90722 ?auto_90723 ?auto_90724 ?auto_90725 )
      ( MAKE-7PILE ?auto_90721 ?auto_90722 ?auto_90723 ?auto_90724 ?auto_90725 ?auto_90726 ?auto_90727 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90729 - BLOCK
      ?auto_90730 - BLOCK
      ?auto_90731 - BLOCK
      ?auto_90732 - BLOCK
      ?auto_90733 - BLOCK
      ?auto_90734 - BLOCK
      ?auto_90735 - BLOCK
    )
    :vars
    (
      ?auto_90736 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90729 ) ( ON ?auto_90730 ?auto_90729 ) ( ON ?auto_90731 ?auto_90730 ) ( ON ?auto_90732 ?auto_90731 ) ( not ( = ?auto_90729 ?auto_90730 ) ) ( not ( = ?auto_90729 ?auto_90731 ) ) ( not ( = ?auto_90729 ?auto_90732 ) ) ( not ( = ?auto_90729 ?auto_90733 ) ) ( not ( = ?auto_90729 ?auto_90734 ) ) ( not ( = ?auto_90729 ?auto_90735 ) ) ( not ( = ?auto_90730 ?auto_90731 ) ) ( not ( = ?auto_90730 ?auto_90732 ) ) ( not ( = ?auto_90730 ?auto_90733 ) ) ( not ( = ?auto_90730 ?auto_90734 ) ) ( not ( = ?auto_90730 ?auto_90735 ) ) ( not ( = ?auto_90731 ?auto_90732 ) ) ( not ( = ?auto_90731 ?auto_90733 ) ) ( not ( = ?auto_90731 ?auto_90734 ) ) ( not ( = ?auto_90731 ?auto_90735 ) ) ( not ( = ?auto_90732 ?auto_90733 ) ) ( not ( = ?auto_90732 ?auto_90734 ) ) ( not ( = ?auto_90732 ?auto_90735 ) ) ( not ( = ?auto_90733 ?auto_90734 ) ) ( not ( = ?auto_90733 ?auto_90735 ) ) ( not ( = ?auto_90734 ?auto_90735 ) ) ( ON ?auto_90735 ?auto_90736 ) ( not ( = ?auto_90729 ?auto_90736 ) ) ( not ( = ?auto_90730 ?auto_90736 ) ) ( not ( = ?auto_90731 ?auto_90736 ) ) ( not ( = ?auto_90732 ?auto_90736 ) ) ( not ( = ?auto_90733 ?auto_90736 ) ) ( not ( = ?auto_90734 ?auto_90736 ) ) ( not ( = ?auto_90735 ?auto_90736 ) ) ( ON ?auto_90734 ?auto_90735 ) ( ON-TABLE ?auto_90736 ) ( CLEAR ?auto_90732 ) ( ON ?auto_90733 ?auto_90734 ) ( CLEAR ?auto_90733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90736 ?auto_90735 ?auto_90734 )
      ( MAKE-7PILE ?auto_90729 ?auto_90730 ?auto_90731 ?auto_90732 ?auto_90733 ?auto_90734 ?auto_90735 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90737 - BLOCK
      ?auto_90738 - BLOCK
      ?auto_90739 - BLOCK
      ?auto_90740 - BLOCK
      ?auto_90741 - BLOCK
      ?auto_90742 - BLOCK
      ?auto_90743 - BLOCK
    )
    :vars
    (
      ?auto_90744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90737 ) ( ON ?auto_90738 ?auto_90737 ) ( ON ?auto_90739 ?auto_90738 ) ( not ( = ?auto_90737 ?auto_90738 ) ) ( not ( = ?auto_90737 ?auto_90739 ) ) ( not ( = ?auto_90737 ?auto_90740 ) ) ( not ( = ?auto_90737 ?auto_90741 ) ) ( not ( = ?auto_90737 ?auto_90742 ) ) ( not ( = ?auto_90737 ?auto_90743 ) ) ( not ( = ?auto_90738 ?auto_90739 ) ) ( not ( = ?auto_90738 ?auto_90740 ) ) ( not ( = ?auto_90738 ?auto_90741 ) ) ( not ( = ?auto_90738 ?auto_90742 ) ) ( not ( = ?auto_90738 ?auto_90743 ) ) ( not ( = ?auto_90739 ?auto_90740 ) ) ( not ( = ?auto_90739 ?auto_90741 ) ) ( not ( = ?auto_90739 ?auto_90742 ) ) ( not ( = ?auto_90739 ?auto_90743 ) ) ( not ( = ?auto_90740 ?auto_90741 ) ) ( not ( = ?auto_90740 ?auto_90742 ) ) ( not ( = ?auto_90740 ?auto_90743 ) ) ( not ( = ?auto_90741 ?auto_90742 ) ) ( not ( = ?auto_90741 ?auto_90743 ) ) ( not ( = ?auto_90742 ?auto_90743 ) ) ( ON ?auto_90743 ?auto_90744 ) ( not ( = ?auto_90737 ?auto_90744 ) ) ( not ( = ?auto_90738 ?auto_90744 ) ) ( not ( = ?auto_90739 ?auto_90744 ) ) ( not ( = ?auto_90740 ?auto_90744 ) ) ( not ( = ?auto_90741 ?auto_90744 ) ) ( not ( = ?auto_90742 ?auto_90744 ) ) ( not ( = ?auto_90743 ?auto_90744 ) ) ( ON ?auto_90742 ?auto_90743 ) ( ON-TABLE ?auto_90744 ) ( ON ?auto_90741 ?auto_90742 ) ( CLEAR ?auto_90741 ) ( HOLDING ?auto_90740 ) ( CLEAR ?auto_90739 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90737 ?auto_90738 ?auto_90739 ?auto_90740 )
      ( MAKE-7PILE ?auto_90737 ?auto_90738 ?auto_90739 ?auto_90740 ?auto_90741 ?auto_90742 ?auto_90743 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90745 - BLOCK
      ?auto_90746 - BLOCK
      ?auto_90747 - BLOCK
      ?auto_90748 - BLOCK
      ?auto_90749 - BLOCK
      ?auto_90750 - BLOCK
      ?auto_90751 - BLOCK
    )
    :vars
    (
      ?auto_90752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90745 ) ( ON ?auto_90746 ?auto_90745 ) ( ON ?auto_90747 ?auto_90746 ) ( not ( = ?auto_90745 ?auto_90746 ) ) ( not ( = ?auto_90745 ?auto_90747 ) ) ( not ( = ?auto_90745 ?auto_90748 ) ) ( not ( = ?auto_90745 ?auto_90749 ) ) ( not ( = ?auto_90745 ?auto_90750 ) ) ( not ( = ?auto_90745 ?auto_90751 ) ) ( not ( = ?auto_90746 ?auto_90747 ) ) ( not ( = ?auto_90746 ?auto_90748 ) ) ( not ( = ?auto_90746 ?auto_90749 ) ) ( not ( = ?auto_90746 ?auto_90750 ) ) ( not ( = ?auto_90746 ?auto_90751 ) ) ( not ( = ?auto_90747 ?auto_90748 ) ) ( not ( = ?auto_90747 ?auto_90749 ) ) ( not ( = ?auto_90747 ?auto_90750 ) ) ( not ( = ?auto_90747 ?auto_90751 ) ) ( not ( = ?auto_90748 ?auto_90749 ) ) ( not ( = ?auto_90748 ?auto_90750 ) ) ( not ( = ?auto_90748 ?auto_90751 ) ) ( not ( = ?auto_90749 ?auto_90750 ) ) ( not ( = ?auto_90749 ?auto_90751 ) ) ( not ( = ?auto_90750 ?auto_90751 ) ) ( ON ?auto_90751 ?auto_90752 ) ( not ( = ?auto_90745 ?auto_90752 ) ) ( not ( = ?auto_90746 ?auto_90752 ) ) ( not ( = ?auto_90747 ?auto_90752 ) ) ( not ( = ?auto_90748 ?auto_90752 ) ) ( not ( = ?auto_90749 ?auto_90752 ) ) ( not ( = ?auto_90750 ?auto_90752 ) ) ( not ( = ?auto_90751 ?auto_90752 ) ) ( ON ?auto_90750 ?auto_90751 ) ( ON-TABLE ?auto_90752 ) ( ON ?auto_90749 ?auto_90750 ) ( CLEAR ?auto_90747 ) ( ON ?auto_90748 ?auto_90749 ) ( CLEAR ?auto_90748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90752 ?auto_90751 ?auto_90750 ?auto_90749 )
      ( MAKE-7PILE ?auto_90745 ?auto_90746 ?auto_90747 ?auto_90748 ?auto_90749 ?auto_90750 ?auto_90751 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90753 - BLOCK
      ?auto_90754 - BLOCK
      ?auto_90755 - BLOCK
      ?auto_90756 - BLOCK
      ?auto_90757 - BLOCK
      ?auto_90758 - BLOCK
      ?auto_90759 - BLOCK
    )
    :vars
    (
      ?auto_90760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90753 ) ( ON ?auto_90754 ?auto_90753 ) ( not ( = ?auto_90753 ?auto_90754 ) ) ( not ( = ?auto_90753 ?auto_90755 ) ) ( not ( = ?auto_90753 ?auto_90756 ) ) ( not ( = ?auto_90753 ?auto_90757 ) ) ( not ( = ?auto_90753 ?auto_90758 ) ) ( not ( = ?auto_90753 ?auto_90759 ) ) ( not ( = ?auto_90754 ?auto_90755 ) ) ( not ( = ?auto_90754 ?auto_90756 ) ) ( not ( = ?auto_90754 ?auto_90757 ) ) ( not ( = ?auto_90754 ?auto_90758 ) ) ( not ( = ?auto_90754 ?auto_90759 ) ) ( not ( = ?auto_90755 ?auto_90756 ) ) ( not ( = ?auto_90755 ?auto_90757 ) ) ( not ( = ?auto_90755 ?auto_90758 ) ) ( not ( = ?auto_90755 ?auto_90759 ) ) ( not ( = ?auto_90756 ?auto_90757 ) ) ( not ( = ?auto_90756 ?auto_90758 ) ) ( not ( = ?auto_90756 ?auto_90759 ) ) ( not ( = ?auto_90757 ?auto_90758 ) ) ( not ( = ?auto_90757 ?auto_90759 ) ) ( not ( = ?auto_90758 ?auto_90759 ) ) ( ON ?auto_90759 ?auto_90760 ) ( not ( = ?auto_90753 ?auto_90760 ) ) ( not ( = ?auto_90754 ?auto_90760 ) ) ( not ( = ?auto_90755 ?auto_90760 ) ) ( not ( = ?auto_90756 ?auto_90760 ) ) ( not ( = ?auto_90757 ?auto_90760 ) ) ( not ( = ?auto_90758 ?auto_90760 ) ) ( not ( = ?auto_90759 ?auto_90760 ) ) ( ON ?auto_90758 ?auto_90759 ) ( ON-TABLE ?auto_90760 ) ( ON ?auto_90757 ?auto_90758 ) ( ON ?auto_90756 ?auto_90757 ) ( CLEAR ?auto_90756 ) ( HOLDING ?auto_90755 ) ( CLEAR ?auto_90754 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90753 ?auto_90754 ?auto_90755 )
      ( MAKE-7PILE ?auto_90753 ?auto_90754 ?auto_90755 ?auto_90756 ?auto_90757 ?auto_90758 ?auto_90759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90761 - BLOCK
      ?auto_90762 - BLOCK
      ?auto_90763 - BLOCK
      ?auto_90764 - BLOCK
      ?auto_90765 - BLOCK
      ?auto_90766 - BLOCK
      ?auto_90767 - BLOCK
    )
    :vars
    (
      ?auto_90768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90761 ) ( ON ?auto_90762 ?auto_90761 ) ( not ( = ?auto_90761 ?auto_90762 ) ) ( not ( = ?auto_90761 ?auto_90763 ) ) ( not ( = ?auto_90761 ?auto_90764 ) ) ( not ( = ?auto_90761 ?auto_90765 ) ) ( not ( = ?auto_90761 ?auto_90766 ) ) ( not ( = ?auto_90761 ?auto_90767 ) ) ( not ( = ?auto_90762 ?auto_90763 ) ) ( not ( = ?auto_90762 ?auto_90764 ) ) ( not ( = ?auto_90762 ?auto_90765 ) ) ( not ( = ?auto_90762 ?auto_90766 ) ) ( not ( = ?auto_90762 ?auto_90767 ) ) ( not ( = ?auto_90763 ?auto_90764 ) ) ( not ( = ?auto_90763 ?auto_90765 ) ) ( not ( = ?auto_90763 ?auto_90766 ) ) ( not ( = ?auto_90763 ?auto_90767 ) ) ( not ( = ?auto_90764 ?auto_90765 ) ) ( not ( = ?auto_90764 ?auto_90766 ) ) ( not ( = ?auto_90764 ?auto_90767 ) ) ( not ( = ?auto_90765 ?auto_90766 ) ) ( not ( = ?auto_90765 ?auto_90767 ) ) ( not ( = ?auto_90766 ?auto_90767 ) ) ( ON ?auto_90767 ?auto_90768 ) ( not ( = ?auto_90761 ?auto_90768 ) ) ( not ( = ?auto_90762 ?auto_90768 ) ) ( not ( = ?auto_90763 ?auto_90768 ) ) ( not ( = ?auto_90764 ?auto_90768 ) ) ( not ( = ?auto_90765 ?auto_90768 ) ) ( not ( = ?auto_90766 ?auto_90768 ) ) ( not ( = ?auto_90767 ?auto_90768 ) ) ( ON ?auto_90766 ?auto_90767 ) ( ON-TABLE ?auto_90768 ) ( ON ?auto_90765 ?auto_90766 ) ( ON ?auto_90764 ?auto_90765 ) ( CLEAR ?auto_90762 ) ( ON ?auto_90763 ?auto_90764 ) ( CLEAR ?auto_90763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90768 ?auto_90767 ?auto_90766 ?auto_90765 ?auto_90764 )
      ( MAKE-7PILE ?auto_90761 ?auto_90762 ?auto_90763 ?auto_90764 ?auto_90765 ?auto_90766 ?auto_90767 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90769 - BLOCK
      ?auto_90770 - BLOCK
      ?auto_90771 - BLOCK
      ?auto_90772 - BLOCK
      ?auto_90773 - BLOCK
      ?auto_90774 - BLOCK
      ?auto_90775 - BLOCK
    )
    :vars
    (
      ?auto_90776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90769 ) ( not ( = ?auto_90769 ?auto_90770 ) ) ( not ( = ?auto_90769 ?auto_90771 ) ) ( not ( = ?auto_90769 ?auto_90772 ) ) ( not ( = ?auto_90769 ?auto_90773 ) ) ( not ( = ?auto_90769 ?auto_90774 ) ) ( not ( = ?auto_90769 ?auto_90775 ) ) ( not ( = ?auto_90770 ?auto_90771 ) ) ( not ( = ?auto_90770 ?auto_90772 ) ) ( not ( = ?auto_90770 ?auto_90773 ) ) ( not ( = ?auto_90770 ?auto_90774 ) ) ( not ( = ?auto_90770 ?auto_90775 ) ) ( not ( = ?auto_90771 ?auto_90772 ) ) ( not ( = ?auto_90771 ?auto_90773 ) ) ( not ( = ?auto_90771 ?auto_90774 ) ) ( not ( = ?auto_90771 ?auto_90775 ) ) ( not ( = ?auto_90772 ?auto_90773 ) ) ( not ( = ?auto_90772 ?auto_90774 ) ) ( not ( = ?auto_90772 ?auto_90775 ) ) ( not ( = ?auto_90773 ?auto_90774 ) ) ( not ( = ?auto_90773 ?auto_90775 ) ) ( not ( = ?auto_90774 ?auto_90775 ) ) ( ON ?auto_90775 ?auto_90776 ) ( not ( = ?auto_90769 ?auto_90776 ) ) ( not ( = ?auto_90770 ?auto_90776 ) ) ( not ( = ?auto_90771 ?auto_90776 ) ) ( not ( = ?auto_90772 ?auto_90776 ) ) ( not ( = ?auto_90773 ?auto_90776 ) ) ( not ( = ?auto_90774 ?auto_90776 ) ) ( not ( = ?auto_90775 ?auto_90776 ) ) ( ON ?auto_90774 ?auto_90775 ) ( ON-TABLE ?auto_90776 ) ( ON ?auto_90773 ?auto_90774 ) ( ON ?auto_90772 ?auto_90773 ) ( ON ?auto_90771 ?auto_90772 ) ( CLEAR ?auto_90771 ) ( HOLDING ?auto_90770 ) ( CLEAR ?auto_90769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90769 ?auto_90770 )
      ( MAKE-7PILE ?auto_90769 ?auto_90770 ?auto_90771 ?auto_90772 ?auto_90773 ?auto_90774 ?auto_90775 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90777 - BLOCK
      ?auto_90778 - BLOCK
      ?auto_90779 - BLOCK
      ?auto_90780 - BLOCK
      ?auto_90781 - BLOCK
      ?auto_90782 - BLOCK
      ?auto_90783 - BLOCK
    )
    :vars
    (
      ?auto_90784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90777 ) ( not ( = ?auto_90777 ?auto_90778 ) ) ( not ( = ?auto_90777 ?auto_90779 ) ) ( not ( = ?auto_90777 ?auto_90780 ) ) ( not ( = ?auto_90777 ?auto_90781 ) ) ( not ( = ?auto_90777 ?auto_90782 ) ) ( not ( = ?auto_90777 ?auto_90783 ) ) ( not ( = ?auto_90778 ?auto_90779 ) ) ( not ( = ?auto_90778 ?auto_90780 ) ) ( not ( = ?auto_90778 ?auto_90781 ) ) ( not ( = ?auto_90778 ?auto_90782 ) ) ( not ( = ?auto_90778 ?auto_90783 ) ) ( not ( = ?auto_90779 ?auto_90780 ) ) ( not ( = ?auto_90779 ?auto_90781 ) ) ( not ( = ?auto_90779 ?auto_90782 ) ) ( not ( = ?auto_90779 ?auto_90783 ) ) ( not ( = ?auto_90780 ?auto_90781 ) ) ( not ( = ?auto_90780 ?auto_90782 ) ) ( not ( = ?auto_90780 ?auto_90783 ) ) ( not ( = ?auto_90781 ?auto_90782 ) ) ( not ( = ?auto_90781 ?auto_90783 ) ) ( not ( = ?auto_90782 ?auto_90783 ) ) ( ON ?auto_90783 ?auto_90784 ) ( not ( = ?auto_90777 ?auto_90784 ) ) ( not ( = ?auto_90778 ?auto_90784 ) ) ( not ( = ?auto_90779 ?auto_90784 ) ) ( not ( = ?auto_90780 ?auto_90784 ) ) ( not ( = ?auto_90781 ?auto_90784 ) ) ( not ( = ?auto_90782 ?auto_90784 ) ) ( not ( = ?auto_90783 ?auto_90784 ) ) ( ON ?auto_90782 ?auto_90783 ) ( ON-TABLE ?auto_90784 ) ( ON ?auto_90781 ?auto_90782 ) ( ON ?auto_90780 ?auto_90781 ) ( ON ?auto_90779 ?auto_90780 ) ( CLEAR ?auto_90777 ) ( ON ?auto_90778 ?auto_90779 ) ( CLEAR ?auto_90778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90784 ?auto_90783 ?auto_90782 ?auto_90781 ?auto_90780 ?auto_90779 )
      ( MAKE-7PILE ?auto_90777 ?auto_90778 ?auto_90779 ?auto_90780 ?auto_90781 ?auto_90782 ?auto_90783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90785 - BLOCK
      ?auto_90786 - BLOCK
      ?auto_90787 - BLOCK
      ?auto_90788 - BLOCK
      ?auto_90789 - BLOCK
      ?auto_90790 - BLOCK
      ?auto_90791 - BLOCK
    )
    :vars
    (
      ?auto_90792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90785 ?auto_90786 ) ) ( not ( = ?auto_90785 ?auto_90787 ) ) ( not ( = ?auto_90785 ?auto_90788 ) ) ( not ( = ?auto_90785 ?auto_90789 ) ) ( not ( = ?auto_90785 ?auto_90790 ) ) ( not ( = ?auto_90785 ?auto_90791 ) ) ( not ( = ?auto_90786 ?auto_90787 ) ) ( not ( = ?auto_90786 ?auto_90788 ) ) ( not ( = ?auto_90786 ?auto_90789 ) ) ( not ( = ?auto_90786 ?auto_90790 ) ) ( not ( = ?auto_90786 ?auto_90791 ) ) ( not ( = ?auto_90787 ?auto_90788 ) ) ( not ( = ?auto_90787 ?auto_90789 ) ) ( not ( = ?auto_90787 ?auto_90790 ) ) ( not ( = ?auto_90787 ?auto_90791 ) ) ( not ( = ?auto_90788 ?auto_90789 ) ) ( not ( = ?auto_90788 ?auto_90790 ) ) ( not ( = ?auto_90788 ?auto_90791 ) ) ( not ( = ?auto_90789 ?auto_90790 ) ) ( not ( = ?auto_90789 ?auto_90791 ) ) ( not ( = ?auto_90790 ?auto_90791 ) ) ( ON ?auto_90791 ?auto_90792 ) ( not ( = ?auto_90785 ?auto_90792 ) ) ( not ( = ?auto_90786 ?auto_90792 ) ) ( not ( = ?auto_90787 ?auto_90792 ) ) ( not ( = ?auto_90788 ?auto_90792 ) ) ( not ( = ?auto_90789 ?auto_90792 ) ) ( not ( = ?auto_90790 ?auto_90792 ) ) ( not ( = ?auto_90791 ?auto_90792 ) ) ( ON ?auto_90790 ?auto_90791 ) ( ON-TABLE ?auto_90792 ) ( ON ?auto_90789 ?auto_90790 ) ( ON ?auto_90788 ?auto_90789 ) ( ON ?auto_90787 ?auto_90788 ) ( ON ?auto_90786 ?auto_90787 ) ( CLEAR ?auto_90786 ) ( HOLDING ?auto_90785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90785 )
      ( MAKE-7PILE ?auto_90785 ?auto_90786 ?auto_90787 ?auto_90788 ?auto_90789 ?auto_90790 ?auto_90791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_90793 - BLOCK
      ?auto_90794 - BLOCK
      ?auto_90795 - BLOCK
      ?auto_90796 - BLOCK
      ?auto_90797 - BLOCK
      ?auto_90798 - BLOCK
      ?auto_90799 - BLOCK
    )
    :vars
    (
      ?auto_90800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90793 ?auto_90794 ) ) ( not ( = ?auto_90793 ?auto_90795 ) ) ( not ( = ?auto_90793 ?auto_90796 ) ) ( not ( = ?auto_90793 ?auto_90797 ) ) ( not ( = ?auto_90793 ?auto_90798 ) ) ( not ( = ?auto_90793 ?auto_90799 ) ) ( not ( = ?auto_90794 ?auto_90795 ) ) ( not ( = ?auto_90794 ?auto_90796 ) ) ( not ( = ?auto_90794 ?auto_90797 ) ) ( not ( = ?auto_90794 ?auto_90798 ) ) ( not ( = ?auto_90794 ?auto_90799 ) ) ( not ( = ?auto_90795 ?auto_90796 ) ) ( not ( = ?auto_90795 ?auto_90797 ) ) ( not ( = ?auto_90795 ?auto_90798 ) ) ( not ( = ?auto_90795 ?auto_90799 ) ) ( not ( = ?auto_90796 ?auto_90797 ) ) ( not ( = ?auto_90796 ?auto_90798 ) ) ( not ( = ?auto_90796 ?auto_90799 ) ) ( not ( = ?auto_90797 ?auto_90798 ) ) ( not ( = ?auto_90797 ?auto_90799 ) ) ( not ( = ?auto_90798 ?auto_90799 ) ) ( ON ?auto_90799 ?auto_90800 ) ( not ( = ?auto_90793 ?auto_90800 ) ) ( not ( = ?auto_90794 ?auto_90800 ) ) ( not ( = ?auto_90795 ?auto_90800 ) ) ( not ( = ?auto_90796 ?auto_90800 ) ) ( not ( = ?auto_90797 ?auto_90800 ) ) ( not ( = ?auto_90798 ?auto_90800 ) ) ( not ( = ?auto_90799 ?auto_90800 ) ) ( ON ?auto_90798 ?auto_90799 ) ( ON-TABLE ?auto_90800 ) ( ON ?auto_90797 ?auto_90798 ) ( ON ?auto_90796 ?auto_90797 ) ( ON ?auto_90795 ?auto_90796 ) ( ON ?auto_90794 ?auto_90795 ) ( ON ?auto_90793 ?auto_90794 ) ( CLEAR ?auto_90793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90800 ?auto_90799 ?auto_90798 ?auto_90797 ?auto_90796 ?auto_90795 ?auto_90794 )
      ( MAKE-7PILE ?auto_90793 ?auto_90794 ?auto_90795 ?auto_90796 ?auto_90797 ?auto_90798 ?auto_90799 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90807 - BLOCK
      ?auto_90808 - BLOCK
      ?auto_90809 - BLOCK
      ?auto_90810 - BLOCK
      ?auto_90811 - BLOCK
      ?auto_90812 - BLOCK
    )
    :vars
    (
      ?auto_90813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90813 ?auto_90812 ) ( CLEAR ?auto_90813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90807 ) ( ON ?auto_90808 ?auto_90807 ) ( ON ?auto_90809 ?auto_90808 ) ( ON ?auto_90810 ?auto_90809 ) ( ON ?auto_90811 ?auto_90810 ) ( ON ?auto_90812 ?auto_90811 ) ( not ( = ?auto_90807 ?auto_90808 ) ) ( not ( = ?auto_90807 ?auto_90809 ) ) ( not ( = ?auto_90807 ?auto_90810 ) ) ( not ( = ?auto_90807 ?auto_90811 ) ) ( not ( = ?auto_90807 ?auto_90812 ) ) ( not ( = ?auto_90807 ?auto_90813 ) ) ( not ( = ?auto_90808 ?auto_90809 ) ) ( not ( = ?auto_90808 ?auto_90810 ) ) ( not ( = ?auto_90808 ?auto_90811 ) ) ( not ( = ?auto_90808 ?auto_90812 ) ) ( not ( = ?auto_90808 ?auto_90813 ) ) ( not ( = ?auto_90809 ?auto_90810 ) ) ( not ( = ?auto_90809 ?auto_90811 ) ) ( not ( = ?auto_90809 ?auto_90812 ) ) ( not ( = ?auto_90809 ?auto_90813 ) ) ( not ( = ?auto_90810 ?auto_90811 ) ) ( not ( = ?auto_90810 ?auto_90812 ) ) ( not ( = ?auto_90810 ?auto_90813 ) ) ( not ( = ?auto_90811 ?auto_90812 ) ) ( not ( = ?auto_90811 ?auto_90813 ) ) ( not ( = ?auto_90812 ?auto_90813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90813 ?auto_90812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90829 - BLOCK
      ?auto_90830 - BLOCK
      ?auto_90831 - BLOCK
      ?auto_90832 - BLOCK
      ?auto_90833 - BLOCK
      ?auto_90834 - BLOCK
    )
    :vars
    (
      ?auto_90835 - BLOCK
      ?auto_90836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90829 ) ( ON ?auto_90830 ?auto_90829 ) ( ON ?auto_90831 ?auto_90830 ) ( ON ?auto_90832 ?auto_90831 ) ( ON ?auto_90833 ?auto_90832 ) ( not ( = ?auto_90829 ?auto_90830 ) ) ( not ( = ?auto_90829 ?auto_90831 ) ) ( not ( = ?auto_90829 ?auto_90832 ) ) ( not ( = ?auto_90829 ?auto_90833 ) ) ( not ( = ?auto_90829 ?auto_90834 ) ) ( not ( = ?auto_90829 ?auto_90835 ) ) ( not ( = ?auto_90830 ?auto_90831 ) ) ( not ( = ?auto_90830 ?auto_90832 ) ) ( not ( = ?auto_90830 ?auto_90833 ) ) ( not ( = ?auto_90830 ?auto_90834 ) ) ( not ( = ?auto_90830 ?auto_90835 ) ) ( not ( = ?auto_90831 ?auto_90832 ) ) ( not ( = ?auto_90831 ?auto_90833 ) ) ( not ( = ?auto_90831 ?auto_90834 ) ) ( not ( = ?auto_90831 ?auto_90835 ) ) ( not ( = ?auto_90832 ?auto_90833 ) ) ( not ( = ?auto_90832 ?auto_90834 ) ) ( not ( = ?auto_90832 ?auto_90835 ) ) ( not ( = ?auto_90833 ?auto_90834 ) ) ( not ( = ?auto_90833 ?auto_90835 ) ) ( not ( = ?auto_90834 ?auto_90835 ) ) ( ON ?auto_90835 ?auto_90836 ) ( CLEAR ?auto_90835 ) ( not ( = ?auto_90829 ?auto_90836 ) ) ( not ( = ?auto_90830 ?auto_90836 ) ) ( not ( = ?auto_90831 ?auto_90836 ) ) ( not ( = ?auto_90832 ?auto_90836 ) ) ( not ( = ?auto_90833 ?auto_90836 ) ) ( not ( = ?auto_90834 ?auto_90836 ) ) ( not ( = ?auto_90835 ?auto_90836 ) ) ( HOLDING ?auto_90834 ) ( CLEAR ?auto_90833 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90829 ?auto_90830 ?auto_90831 ?auto_90832 ?auto_90833 ?auto_90834 ?auto_90835 )
      ( MAKE-6PILE ?auto_90829 ?auto_90830 ?auto_90831 ?auto_90832 ?auto_90833 ?auto_90834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90837 - BLOCK
      ?auto_90838 - BLOCK
      ?auto_90839 - BLOCK
      ?auto_90840 - BLOCK
      ?auto_90841 - BLOCK
      ?auto_90842 - BLOCK
    )
    :vars
    (
      ?auto_90844 - BLOCK
      ?auto_90843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90837 ) ( ON ?auto_90838 ?auto_90837 ) ( ON ?auto_90839 ?auto_90838 ) ( ON ?auto_90840 ?auto_90839 ) ( ON ?auto_90841 ?auto_90840 ) ( not ( = ?auto_90837 ?auto_90838 ) ) ( not ( = ?auto_90837 ?auto_90839 ) ) ( not ( = ?auto_90837 ?auto_90840 ) ) ( not ( = ?auto_90837 ?auto_90841 ) ) ( not ( = ?auto_90837 ?auto_90842 ) ) ( not ( = ?auto_90837 ?auto_90844 ) ) ( not ( = ?auto_90838 ?auto_90839 ) ) ( not ( = ?auto_90838 ?auto_90840 ) ) ( not ( = ?auto_90838 ?auto_90841 ) ) ( not ( = ?auto_90838 ?auto_90842 ) ) ( not ( = ?auto_90838 ?auto_90844 ) ) ( not ( = ?auto_90839 ?auto_90840 ) ) ( not ( = ?auto_90839 ?auto_90841 ) ) ( not ( = ?auto_90839 ?auto_90842 ) ) ( not ( = ?auto_90839 ?auto_90844 ) ) ( not ( = ?auto_90840 ?auto_90841 ) ) ( not ( = ?auto_90840 ?auto_90842 ) ) ( not ( = ?auto_90840 ?auto_90844 ) ) ( not ( = ?auto_90841 ?auto_90842 ) ) ( not ( = ?auto_90841 ?auto_90844 ) ) ( not ( = ?auto_90842 ?auto_90844 ) ) ( ON ?auto_90844 ?auto_90843 ) ( not ( = ?auto_90837 ?auto_90843 ) ) ( not ( = ?auto_90838 ?auto_90843 ) ) ( not ( = ?auto_90839 ?auto_90843 ) ) ( not ( = ?auto_90840 ?auto_90843 ) ) ( not ( = ?auto_90841 ?auto_90843 ) ) ( not ( = ?auto_90842 ?auto_90843 ) ) ( not ( = ?auto_90844 ?auto_90843 ) ) ( CLEAR ?auto_90841 ) ( ON ?auto_90842 ?auto_90844 ) ( CLEAR ?auto_90842 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90843 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90843 ?auto_90844 )
      ( MAKE-6PILE ?auto_90837 ?auto_90838 ?auto_90839 ?auto_90840 ?auto_90841 ?auto_90842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90845 - BLOCK
      ?auto_90846 - BLOCK
      ?auto_90847 - BLOCK
      ?auto_90848 - BLOCK
      ?auto_90849 - BLOCK
      ?auto_90850 - BLOCK
    )
    :vars
    (
      ?auto_90852 - BLOCK
      ?auto_90851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90845 ) ( ON ?auto_90846 ?auto_90845 ) ( ON ?auto_90847 ?auto_90846 ) ( ON ?auto_90848 ?auto_90847 ) ( not ( = ?auto_90845 ?auto_90846 ) ) ( not ( = ?auto_90845 ?auto_90847 ) ) ( not ( = ?auto_90845 ?auto_90848 ) ) ( not ( = ?auto_90845 ?auto_90849 ) ) ( not ( = ?auto_90845 ?auto_90850 ) ) ( not ( = ?auto_90845 ?auto_90852 ) ) ( not ( = ?auto_90846 ?auto_90847 ) ) ( not ( = ?auto_90846 ?auto_90848 ) ) ( not ( = ?auto_90846 ?auto_90849 ) ) ( not ( = ?auto_90846 ?auto_90850 ) ) ( not ( = ?auto_90846 ?auto_90852 ) ) ( not ( = ?auto_90847 ?auto_90848 ) ) ( not ( = ?auto_90847 ?auto_90849 ) ) ( not ( = ?auto_90847 ?auto_90850 ) ) ( not ( = ?auto_90847 ?auto_90852 ) ) ( not ( = ?auto_90848 ?auto_90849 ) ) ( not ( = ?auto_90848 ?auto_90850 ) ) ( not ( = ?auto_90848 ?auto_90852 ) ) ( not ( = ?auto_90849 ?auto_90850 ) ) ( not ( = ?auto_90849 ?auto_90852 ) ) ( not ( = ?auto_90850 ?auto_90852 ) ) ( ON ?auto_90852 ?auto_90851 ) ( not ( = ?auto_90845 ?auto_90851 ) ) ( not ( = ?auto_90846 ?auto_90851 ) ) ( not ( = ?auto_90847 ?auto_90851 ) ) ( not ( = ?auto_90848 ?auto_90851 ) ) ( not ( = ?auto_90849 ?auto_90851 ) ) ( not ( = ?auto_90850 ?auto_90851 ) ) ( not ( = ?auto_90852 ?auto_90851 ) ) ( ON ?auto_90850 ?auto_90852 ) ( CLEAR ?auto_90850 ) ( ON-TABLE ?auto_90851 ) ( HOLDING ?auto_90849 ) ( CLEAR ?auto_90848 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90845 ?auto_90846 ?auto_90847 ?auto_90848 ?auto_90849 )
      ( MAKE-6PILE ?auto_90845 ?auto_90846 ?auto_90847 ?auto_90848 ?auto_90849 ?auto_90850 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90853 - BLOCK
      ?auto_90854 - BLOCK
      ?auto_90855 - BLOCK
      ?auto_90856 - BLOCK
      ?auto_90857 - BLOCK
      ?auto_90858 - BLOCK
    )
    :vars
    (
      ?auto_90859 - BLOCK
      ?auto_90860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90853 ) ( ON ?auto_90854 ?auto_90853 ) ( ON ?auto_90855 ?auto_90854 ) ( ON ?auto_90856 ?auto_90855 ) ( not ( = ?auto_90853 ?auto_90854 ) ) ( not ( = ?auto_90853 ?auto_90855 ) ) ( not ( = ?auto_90853 ?auto_90856 ) ) ( not ( = ?auto_90853 ?auto_90857 ) ) ( not ( = ?auto_90853 ?auto_90858 ) ) ( not ( = ?auto_90853 ?auto_90859 ) ) ( not ( = ?auto_90854 ?auto_90855 ) ) ( not ( = ?auto_90854 ?auto_90856 ) ) ( not ( = ?auto_90854 ?auto_90857 ) ) ( not ( = ?auto_90854 ?auto_90858 ) ) ( not ( = ?auto_90854 ?auto_90859 ) ) ( not ( = ?auto_90855 ?auto_90856 ) ) ( not ( = ?auto_90855 ?auto_90857 ) ) ( not ( = ?auto_90855 ?auto_90858 ) ) ( not ( = ?auto_90855 ?auto_90859 ) ) ( not ( = ?auto_90856 ?auto_90857 ) ) ( not ( = ?auto_90856 ?auto_90858 ) ) ( not ( = ?auto_90856 ?auto_90859 ) ) ( not ( = ?auto_90857 ?auto_90858 ) ) ( not ( = ?auto_90857 ?auto_90859 ) ) ( not ( = ?auto_90858 ?auto_90859 ) ) ( ON ?auto_90859 ?auto_90860 ) ( not ( = ?auto_90853 ?auto_90860 ) ) ( not ( = ?auto_90854 ?auto_90860 ) ) ( not ( = ?auto_90855 ?auto_90860 ) ) ( not ( = ?auto_90856 ?auto_90860 ) ) ( not ( = ?auto_90857 ?auto_90860 ) ) ( not ( = ?auto_90858 ?auto_90860 ) ) ( not ( = ?auto_90859 ?auto_90860 ) ) ( ON ?auto_90858 ?auto_90859 ) ( ON-TABLE ?auto_90860 ) ( CLEAR ?auto_90856 ) ( ON ?auto_90857 ?auto_90858 ) ( CLEAR ?auto_90857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90860 ?auto_90859 ?auto_90858 )
      ( MAKE-6PILE ?auto_90853 ?auto_90854 ?auto_90855 ?auto_90856 ?auto_90857 ?auto_90858 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90861 - BLOCK
      ?auto_90862 - BLOCK
      ?auto_90863 - BLOCK
      ?auto_90864 - BLOCK
      ?auto_90865 - BLOCK
      ?auto_90866 - BLOCK
    )
    :vars
    (
      ?auto_90868 - BLOCK
      ?auto_90867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90861 ) ( ON ?auto_90862 ?auto_90861 ) ( ON ?auto_90863 ?auto_90862 ) ( not ( = ?auto_90861 ?auto_90862 ) ) ( not ( = ?auto_90861 ?auto_90863 ) ) ( not ( = ?auto_90861 ?auto_90864 ) ) ( not ( = ?auto_90861 ?auto_90865 ) ) ( not ( = ?auto_90861 ?auto_90866 ) ) ( not ( = ?auto_90861 ?auto_90868 ) ) ( not ( = ?auto_90862 ?auto_90863 ) ) ( not ( = ?auto_90862 ?auto_90864 ) ) ( not ( = ?auto_90862 ?auto_90865 ) ) ( not ( = ?auto_90862 ?auto_90866 ) ) ( not ( = ?auto_90862 ?auto_90868 ) ) ( not ( = ?auto_90863 ?auto_90864 ) ) ( not ( = ?auto_90863 ?auto_90865 ) ) ( not ( = ?auto_90863 ?auto_90866 ) ) ( not ( = ?auto_90863 ?auto_90868 ) ) ( not ( = ?auto_90864 ?auto_90865 ) ) ( not ( = ?auto_90864 ?auto_90866 ) ) ( not ( = ?auto_90864 ?auto_90868 ) ) ( not ( = ?auto_90865 ?auto_90866 ) ) ( not ( = ?auto_90865 ?auto_90868 ) ) ( not ( = ?auto_90866 ?auto_90868 ) ) ( ON ?auto_90868 ?auto_90867 ) ( not ( = ?auto_90861 ?auto_90867 ) ) ( not ( = ?auto_90862 ?auto_90867 ) ) ( not ( = ?auto_90863 ?auto_90867 ) ) ( not ( = ?auto_90864 ?auto_90867 ) ) ( not ( = ?auto_90865 ?auto_90867 ) ) ( not ( = ?auto_90866 ?auto_90867 ) ) ( not ( = ?auto_90868 ?auto_90867 ) ) ( ON ?auto_90866 ?auto_90868 ) ( ON-TABLE ?auto_90867 ) ( ON ?auto_90865 ?auto_90866 ) ( CLEAR ?auto_90865 ) ( HOLDING ?auto_90864 ) ( CLEAR ?auto_90863 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90861 ?auto_90862 ?auto_90863 ?auto_90864 )
      ( MAKE-6PILE ?auto_90861 ?auto_90862 ?auto_90863 ?auto_90864 ?auto_90865 ?auto_90866 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90869 - BLOCK
      ?auto_90870 - BLOCK
      ?auto_90871 - BLOCK
      ?auto_90872 - BLOCK
      ?auto_90873 - BLOCK
      ?auto_90874 - BLOCK
    )
    :vars
    (
      ?auto_90876 - BLOCK
      ?auto_90875 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90869 ) ( ON ?auto_90870 ?auto_90869 ) ( ON ?auto_90871 ?auto_90870 ) ( not ( = ?auto_90869 ?auto_90870 ) ) ( not ( = ?auto_90869 ?auto_90871 ) ) ( not ( = ?auto_90869 ?auto_90872 ) ) ( not ( = ?auto_90869 ?auto_90873 ) ) ( not ( = ?auto_90869 ?auto_90874 ) ) ( not ( = ?auto_90869 ?auto_90876 ) ) ( not ( = ?auto_90870 ?auto_90871 ) ) ( not ( = ?auto_90870 ?auto_90872 ) ) ( not ( = ?auto_90870 ?auto_90873 ) ) ( not ( = ?auto_90870 ?auto_90874 ) ) ( not ( = ?auto_90870 ?auto_90876 ) ) ( not ( = ?auto_90871 ?auto_90872 ) ) ( not ( = ?auto_90871 ?auto_90873 ) ) ( not ( = ?auto_90871 ?auto_90874 ) ) ( not ( = ?auto_90871 ?auto_90876 ) ) ( not ( = ?auto_90872 ?auto_90873 ) ) ( not ( = ?auto_90872 ?auto_90874 ) ) ( not ( = ?auto_90872 ?auto_90876 ) ) ( not ( = ?auto_90873 ?auto_90874 ) ) ( not ( = ?auto_90873 ?auto_90876 ) ) ( not ( = ?auto_90874 ?auto_90876 ) ) ( ON ?auto_90876 ?auto_90875 ) ( not ( = ?auto_90869 ?auto_90875 ) ) ( not ( = ?auto_90870 ?auto_90875 ) ) ( not ( = ?auto_90871 ?auto_90875 ) ) ( not ( = ?auto_90872 ?auto_90875 ) ) ( not ( = ?auto_90873 ?auto_90875 ) ) ( not ( = ?auto_90874 ?auto_90875 ) ) ( not ( = ?auto_90876 ?auto_90875 ) ) ( ON ?auto_90874 ?auto_90876 ) ( ON-TABLE ?auto_90875 ) ( ON ?auto_90873 ?auto_90874 ) ( CLEAR ?auto_90871 ) ( ON ?auto_90872 ?auto_90873 ) ( CLEAR ?auto_90872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90875 ?auto_90876 ?auto_90874 ?auto_90873 )
      ( MAKE-6PILE ?auto_90869 ?auto_90870 ?auto_90871 ?auto_90872 ?auto_90873 ?auto_90874 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90877 - BLOCK
      ?auto_90878 - BLOCK
      ?auto_90879 - BLOCK
      ?auto_90880 - BLOCK
      ?auto_90881 - BLOCK
      ?auto_90882 - BLOCK
    )
    :vars
    (
      ?auto_90884 - BLOCK
      ?auto_90883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90877 ) ( ON ?auto_90878 ?auto_90877 ) ( not ( = ?auto_90877 ?auto_90878 ) ) ( not ( = ?auto_90877 ?auto_90879 ) ) ( not ( = ?auto_90877 ?auto_90880 ) ) ( not ( = ?auto_90877 ?auto_90881 ) ) ( not ( = ?auto_90877 ?auto_90882 ) ) ( not ( = ?auto_90877 ?auto_90884 ) ) ( not ( = ?auto_90878 ?auto_90879 ) ) ( not ( = ?auto_90878 ?auto_90880 ) ) ( not ( = ?auto_90878 ?auto_90881 ) ) ( not ( = ?auto_90878 ?auto_90882 ) ) ( not ( = ?auto_90878 ?auto_90884 ) ) ( not ( = ?auto_90879 ?auto_90880 ) ) ( not ( = ?auto_90879 ?auto_90881 ) ) ( not ( = ?auto_90879 ?auto_90882 ) ) ( not ( = ?auto_90879 ?auto_90884 ) ) ( not ( = ?auto_90880 ?auto_90881 ) ) ( not ( = ?auto_90880 ?auto_90882 ) ) ( not ( = ?auto_90880 ?auto_90884 ) ) ( not ( = ?auto_90881 ?auto_90882 ) ) ( not ( = ?auto_90881 ?auto_90884 ) ) ( not ( = ?auto_90882 ?auto_90884 ) ) ( ON ?auto_90884 ?auto_90883 ) ( not ( = ?auto_90877 ?auto_90883 ) ) ( not ( = ?auto_90878 ?auto_90883 ) ) ( not ( = ?auto_90879 ?auto_90883 ) ) ( not ( = ?auto_90880 ?auto_90883 ) ) ( not ( = ?auto_90881 ?auto_90883 ) ) ( not ( = ?auto_90882 ?auto_90883 ) ) ( not ( = ?auto_90884 ?auto_90883 ) ) ( ON ?auto_90882 ?auto_90884 ) ( ON-TABLE ?auto_90883 ) ( ON ?auto_90881 ?auto_90882 ) ( ON ?auto_90880 ?auto_90881 ) ( CLEAR ?auto_90880 ) ( HOLDING ?auto_90879 ) ( CLEAR ?auto_90878 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90877 ?auto_90878 ?auto_90879 )
      ( MAKE-6PILE ?auto_90877 ?auto_90878 ?auto_90879 ?auto_90880 ?auto_90881 ?auto_90882 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90885 - BLOCK
      ?auto_90886 - BLOCK
      ?auto_90887 - BLOCK
      ?auto_90888 - BLOCK
      ?auto_90889 - BLOCK
      ?auto_90890 - BLOCK
    )
    :vars
    (
      ?auto_90892 - BLOCK
      ?auto_90891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90885 ) ( ON ?auto_90886 ?auto_90885 ) ( not ( = ?auto_90885 ?auto_90886 ) ) ( not ( = ?auto_90885 ?auto_90887 ) ) ( not ( = ?auto_90885 ?auto_90888 ) ) ( not ( = ?auto_90885 ?auto_90889 ) ) ( not ( = ?auto_90885 ?auto_90890 ) ) ( not ( = ?auto_90885 ?auto_90892 ) ) ( not ( = ?auto_90886 ?auto_90887 ) ) ( not ( = ?auto_90886 ?auto_90888 ) ) ( not ( = ?auto_90886 ?auto_90889 ) ) ( not ( = ?auto_90886 ?auto_90890 ) ) ( not ( = ?auto_90886 ?auto_90892 ) ) ( not ( = ?auto_90887 ?auto_90888 ) ) ( not ( = ?auto_90887 ?auto_90889 ) ) ( not ( = ?auto_90887 ?auto_90890 ) ) ( not ( = ?auto_90887 ?auto_90892 ) ) ( not ( = ?auto_90888 ?auto_90889 ) ) ( not ( = ?auto_90888 ?auto_90890 ) ) ( not ( = ?auto_90888 ?auto_90892 ) ) ( not ( = ?auto_90889 ?auto_90890 ) ) ( not ( = ?auto_90889 ?auto_90892 ) ) ( not ( = ?auto_90890 ?auto_90892 ) ) ( ON ?auto_90892 ?auto_90891 ) ( not ( = ?auto_90885 ?auto_90891 ) ) ( not ( = ?auto_90886 ?auto_90891 ) ) ( not ( = ?auto_90887 ?auto_90891 ) ) ( not ( = ?auto_90888 ?auto_90891 ) ) ( not ( = ?auto_90889 ?auto_90891 ) ) ( not ( = ?auto_90890 ?auto_90891 ) ) ( not ( = ?auto_90892 ?auto_90891 ) ) ( ON ?auto_90890 ?auto_90892 ) ( ON-TABLE ?auto_90891 ) ( ON ?auto_90889 ?auto_90890 ) ( ON ?auto_90888 ?auto_90889 ) ( CLEAR ?auto_90886 ) ( ON ?auto_90887 ?auto_90888 ) ( CLEAR ?auto_90887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90891 ?auto_90892 ?auto_90890 ?auto_90889 ?auto_90888 )
      ( MAKE-6PILE ?auto_90885 ?auto_90886 ?auto_90887 ?auto_90888 ?auto_90889 ?auto_90890 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90893 - BLOCK
      ?auto_90894 - BLOCK
      ?auto_90895 - BLOCK
      ?auto_90896 - BLOCK
      ?auto_90897 - BLOCK
      ?auto_90898 - BLOCK
    )
    :vars
    (
      ?auto_90899 - BLOCK
      ?auto_90900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90893 ) ( not ( = ?auto_90893 ?auto_90894 ) ) ( not ( = ?auto_90893 ?auto_90895 ) ) ( not ( = ?auto_90893 ?auto_90896 ) ) ( not ( = ?auto_90893 ?auto_90897 ) ) ( not ( = ?auto_90893 ?auto_90898 ) ) ( not ( = ?auto_90893 ?auto_90899 ) ) ( not ( = ?auto_90894 ?auto_90895 ) ) ( not ( = ?auto_90894 ?auto_90896 ) ) ( not ( = ?auto_90894 ?auto_90897 ) ) ( not ( = ?auto_90894 ?auto_90898 ) ) ( not ( = ?auto_90894 ?auto_90899 ) ) ( not ( = ?auto_90895 ?auto_90896 ) ) ( not ( = ?auto_90895 ?auto_90897 ) ) ( not ( = ?auto_90895 ?auto_90898 ) ) ( not ( = ?auto_90895 ?auto_90899 ) ) ( not ( = ?auto_90896 ?auto_90897 ) ) ( not ( = ?auto_90896 ?auto_90898 ) ) ( not ( = ?auto_90896 ?auto_90899 ) ) ( not ( = ?auto_90897 ?auto_90898 ) ) ( not ( = ?auto_90897 ?auto_90899 ) ) ( not ( = ?auto_90898 ?auto_90899 ) ) ( ON ?auto_90899 ?auto_90900 ) ( not ( = ?auto_90893 ?auto_90900 ) ) ( not ( = ?auto_90894 ?auto_90900 ) ) ( not ( = ?auto_90895 ?auto_90900 ) ) ( not ( = ?auto_90896 ?auto_90900 ) ) ( not ( = ?auto_90897 ?auto_90900 ) ) ( not ( = ?auto_90898 ?auto_90900 ) ) ( not ( = ?auto_90899 ?auto_90900 ) ) ( ON ?auto_90898 ?auto_90899 ) ( ON-TABLE ?auto_90900 ) ( ON ?auto_90897 ?auto_90898 ) ( ON ?auto_90896 ?auto_90897 ) ( ON ?auto_90895 ?auto_90896 ) ( CLEAR ?auto_90895 ) ( HOLDING ?auto_90894 ) ( CLEAR ?auto_90893 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90893 ?auto_90894 )
      ( MAKE-6PILE ?auto_90893 ?auto_90894 ?auto_90895 ?auto_90896 ?auto_90897 ?auto_90898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90901 - BLOCK
      ?auto_90902 - BLOCK
      ?auto_90903 - BLOCK
      ?auto_90904 - BLOCK
      ?auto_90905 - BLOCK
      ?auto_90906 - BLOCK
    )
    :vars
    (
      ?auto_90907 - BLOCK
      ?auto_90908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90901 ) ( not ( = ?auto_90901 ?auto_90902 ) ) ( not ( = ?auto_90901 ?auto_90903 ) ) ( not ( = ?auto_90901 ?auto_90904 ) ) ( not ( = ?auto_90901 ?auto_90905 ) ) ( not ( = ?auto_90901 ?auto_90906 ) ) ( not ( = ?auto_90901 ?auto_90907 ) ) ( not ( = ?auto_90902 ?auto_90903 ) ) ( not ( = ?auto_90902 ?auto_90904 ) ) ( not ( = ?auto_90902 ?auto_90905 ) ) ( not ( = ?auto_90902 ?auto_90906 ) ) ( not ( = ?auto_90902 ?auto_90907 ) ) ( not ( = ?auto_90903 ?auto_90904 ) ) ( not ( = ?auto_90903 ?auto_90905 ) ) ( not ( = ?auto_90903 ?auto_90906 ) ) ( not ( = ?auto_90903 ?auto_90907 ) ) ( not ( = ?auto_90904 ?auto_90905 ) ) ( not ( = ?auto_90904 ?auto_90906 ) ) ( not ( = ?auto_90904 ?auto_90907 ) ) ( not ( = ?auto_90905 ?auto_90906 ) ) ( not ( = ?auto_90905 ?auto_90907 ) ) ( not ( = ?auto_90906 ?auto_90907 ) ) ( ON ?auto_90907 ?auto_90908 ) ( not ( = ?auto_90901 ?auto_90908 ) ) ( not ( = ?auto_90902 ?auto_90908 ) ) ( not ( = ?auto_90903 ?auto_90908 ) ) ( not ( = ?auto_90904 ?auto_90908 ) ) ( not ( = ?auto_90905 ?auto_90908 ) ) ( not ( = ?auto_90906 ?auto_90908 ) ) ( not ( = ?auto_90907 ?auto_90908 ) ) ( ON ?auto_90906 ?auto_90907 ) ( ON-TABLE ?auto_90908 ) ( ON ?auto_90905 ?auto_90906 ) ( ON ?auto_90904 ?auto_90905 ) ( ON ?auto_90903 ?auto_90904 ) ( CLEAR ?auto_90901 ) ( ON ?auto_90902 ?auto_90903 ) ( CLEAR ?auto_90902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90908 ?auto_90907 ?auto_90906 ?auto_90905 ?auto_90904 ?auto_90903 )
      ( MAKE-6PILE ?auto_90901 ?auto_90902 ?auto_90903 ?auto_90904 ?auto_90905 ?auto_90906 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90909 - BLOCK
      ?auto_90910 - BLOCK
      ?auto_90911 - BLOCK
      ?auto_90912 - BLOCK
      ?auto_90913 - BLOCK
      ?auto_90914 - BLOCK
    )
    :vars
    (
      ?auto_90916 - BLOCK
      ?auto_90915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90909 ?auto_90910 ) ) ( not ( = ?auto_90909 ?auto_90911 ) ) ( not ( = ?auto_90909 ?auto_90912 ) ) ( not ( = ?auto_90909 ?auto_90913 ) ) ( not ( = ?auto_90909 ?auto_90914 ) ) ( not ( = ?auto_90909 ?auto_90916 ) ) ( not ( = ?auto_90910 ?auto_90911 ) ) ( not ( = ?auto_90910 ?auto_90912 ) ) ( not ( = ?auto_90910 ?auto_90913 ) ) ( not ( = ?auto_90910 ?auto_90914 ) ) ( not ( = ?auto_90910 ?auto_90916 ) ) ( not ( = ?auto_90911 ?auto_90912 ) ) ( not ( = ?auto_90911 ?auto_90913 ) ) ( not ( = ?auto_90911 ?auto_90914 ) ) ( not ( = ?auto_90911 ?auto_90916 ) ) ( not ( = ?auto_90912 ?auto_90913 ) ) ( not ( = ?auto_90912 ?auto_90914 ) ) ( not ( = ?auto_90912 ?auto_90916 ) ) ( not ( = ?auto_90913 ?auto_90914 ) ) ( not ( = ?auto_90913 ?auto_90916 ) ) ( not ( = ?auto_90914 ?auto_90916 ) ) ( ON ?auto_90916 ?auto_90915 ) ( not ( = ?auto_90909 ?auto_90915 ) ) ( not ( = ?auto_90910 ?auto_90915 ) ) ( not ( = ?auto_90911 ?auto_90915 ) ) ( not ( = ?auto_90912 ?auto_90915 ) ) ( not ( = ?auto_90913 ?auto_90915 ) ) ( not ( = ?auto_90914 ?auto_90915 ) ) ( not ( = ?auto_90916 ?auto_90915 ) ) ( ON ?auto_90914 ?auto_90916 ) ( ON-TABLE ?auto_90915 ) ( ON ?auto_90913 ?auto_90914 ) ( ON ?auto_90912 ?auto_90913 ) ( ON ?auto_90911 ?auto_90912 ) ( ON ?auto_90910 ?auto_90911 ) ( CLEAR ?auto_90910 ) ( HOLDING ?auto_90909 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_90909 )
      ( MAKE-6PILE ?auto_90909 ?auto_90910 ?auto_90911 ?auto_90912 ?auto_90913 ?auto_90914 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_90917 - BLOCK
      ?auto_90918 - BLOCK
      ?auto_90919 - BLOCK
      ?auto_90920 - BLOCK
      ?auto_90921 - BLOCK
      ?auto_90922 - BLOCK
    )
    :vars
    (
      ?auto_90923 - BLOCK
      ?auto_90924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90917 ?auto_90918 ) ) ( not ( = ?auto_90917 ?auto_90919 ) ) ( not ( = ?auto_90917 ?auto_90920 ) ) ( not ( = ?auto_90917 ?auto_90921 ) ) ( not ( = ?auto_90917 ?auto_90922 ) ) ( not ( = ?auto_90917 ?auto_90923 ) ) ( not ( = ?auto_90918 ?auto_90919 ) ) ( not ( = ?auto_90918 ?auto_90920 ) ) ( not ( = ?auto_90918 ?auto_90921 ) ) ( not ( = ?auto_90918 ?auto_90922 ) ) ( not ( = ?auto_90918 ?auto_90923 ) ) ( not ( = ?auto_90919 ?auto_90920 ) ) ( not ( = ?auto_90919 ?auto_90921 ) ) ( not ( = ?auto_90919 ?auto_90922 ) ) ( not ( = ?auto_90919 ?auto_90923 ) ) ( not ( = ?auto_90920 ?auto_90921 ) ) ( not ( = ?auto_90920 ?auto_90922 ) ) ( not ( = ?auto_90920 ?auto_90923 ) ) ( not ( = ?auto_90921 ?auto_90922 ) ) ( not ( = ?auto_90921 ?auto_90923 ) ) ( not ( = ?auto_90922 ?auto_90923 ) ) ( ON ?auto_90923 ?auto_90924 ) ( not ( = ?auto_90917 ?auto_90924 ) ) ( not ( = ?auto_90918 ?auto_90924 ) ) ( not ( = ?auto_90919 ?auto_90924 ) ) ( not ( = ?auto_90920 ?auto_90924 ) ) ( not ( = ?auto_90921 ?auto_90924 ) ) ( not ( = ?auto_90922 ?auto_90924 ) ) ( not ( = ?auto_90923 ?auto_90924 ) ) ( ON ?auto_90922 ?auto_90923 ) ( ON-TABLE ?auto_90924 ) ( ON ?auto_90921 ?auto_90922 ) ( ON ?auto_90920 ?auto_90921 ) ( ON ?auto_90919 ?auto_90920 ) ( ON ?auto_90918 ?auto_90919 ) ( ON ?auto_90917 ?auto_90918 ) ( CLEAR ?auto_90917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90924 ?auto_90923 ?auto_90922 ?auto_90921 ?auto_90920 ?auto_90919 ?auto_90918 )
      ( MAKE-6PILE ?auto_90917 ?auto_90918 ?auto_90919 ?auto_90920 ?auto_90921 ?auto_90922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90926 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_90926 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_90926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90927 - BLOCK
    )
    :vars
    (
      ?auto_90928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_90927 ?auto_90928 ) ( CLEAR ?auto_90927 ) ( HAND-EMPTY ) ( not ( = ?auto_90927 ?auto_90928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90927 ?auto_90928 )
      ( MAKE-1PILE ?auto_90927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90929 - BLOCK
    )
    :vars
    (
      ?auto_90930 - BLOCK
      ?auto_90931 - BLOCK
      ?auto_90932 - BLOCK
      ?auto_90934 - BLOCK
      ?auto_90935 - BLOCK
      ?auto_90933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90929 ?auto_90930 ) ) ( HOLDING ?auto_90929 ) ( CLEAR ?auto_90930 ) ( ON-TABLE ?auto_90931 ) ( ON ?auto_90932 ?auto_90931 ) ( ON ?auto_90934 ?auto_90932 ) ( ON ?auto_90935 ?auto_90934 ) ( ON ?auto_90933 ?auto_90935 ) ( ON ?auto_90930 ?auto_90933 ) ( not ( = ?auto_90931 ?auto_90932 ) ) ( not ( = ?auto_90931 ?auto_90934 ) ) ( not ( = ?auto_90931 ?auto_90935 ) ) ( not ( = ?auto_90931 ?auto_90933 ) ) ( not ( = ?auto_90931 ?auto_90930 ) ) ( not ( = ?auto_90931 ?auto_90929 ) ) ( not ( = ?auto_90932 ?auto_90934 ) ) ( not ( = ?auto_90932 ?auto_90935 ) ) ( not ( = ?auto_90932 ?auto_90933 ) ) ( not ( = ?auto_90932 ?auto_90930 ) ) ( not ( = ?auto_90932 ?auto_90929 ) ) ( not ( = ?auto_90934 ?auto_90935 ) ) ( not ( = ?auto_90934 ?auto_90933 ) ) ( not ( = ?auto_90934 ?auto_90930 ) ) ( not ( = ?auto_90934 ?auto_90929 ) ) ( not ( = ?auto_90935 ?auto_90933 ) ) ( not ( = ?auto_90935 ?auto_90930 ) ) ( not ( = ?auto_90935 ?auto_90929 ) ) ( not ( = ?auto_90933 ?auto_90930 ) ) ( not ( = ?auto_90933 ?auto_90929 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_90931 ?auto_90932 ?auto_90934 ?auto_90935 ?auto_90933 ?auto_90930 ?auto_90929 )
      ( MAKE-1PILE ?auto_90929 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90936 - BLOCK
    )
    :vars
    (
      ?auto_90938 - BLOCK
      ?auto_90937 - BLOCK
      ?auto_90940 - BLOCK
      ?auto_90942 - BLOCK
      ?auto_90939 - BLOCK
      ?auto_90941 - BLOCK
      ?auto_90943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90936 ?auto_90938 ) ) ( CLEAR ?auto_90938 ) ( ON-TABLE ?auto_90937 ) ( ON ?auto_90940 ?auto_90937 ) ( ON ?auto_90942 ?auto_90940 ) ( ON ?auto_90939 ?auto_90942 ) ( ON ?auto_90941 ?auto_90939 ) ( ON ?auto_90938 ?auto_90941 ) ( not ( = ?auto_90937 ?auto_90940 ) ) ( not ( = ?auto_90937 ?auto_90942 ) ) ( not ( = ?auto_90937 ?auto_90939 ) ) ( not ( = ?auto_90937 ?auto_90941 ) ) ( not ( = ?auto_90937 ?auto_90938 ) ) ( not ( = ?auto_90937 ?auto_90936 ) ) ( not ( = ?auto_90940 ?auto_90942 ) ) ( not ( = ?auto_90940 ?auto_90939 ) ) ( not ( = ?auto_90940 ?auto_90941 ) ) ( not ( = ?auto_90940 ?auto_90938 ) ) ( not ( = ?auto_90940 ?auto_90936 ) ) ( not ( = ?auto_90942 ?auto_90939 ) ) ( not ( = ?auto_90942 ?auto_90941 ) ) ( not ( = ?auto_90942 ?auto_90938 ) ) ( not ( = ?auto_90942 ?auto_90936 ) ) ( not ( = ?auto_90939 ?auto_90941 ) ) ( not ( = ?auto_90939 ?auto_90938 ) ) ( not ( = ?auto_90939 ?auto_90936 ) ) ( not ( = ?auto_90941 ?auto_90938 ) ) ( not ( = ?auto_90941 ?auto_90936 ) ) ( ON ?auto_90936 ?auto_90943 ) ( CLEAR ?auto_90936 ) ( HAND-EMPTY ) ( not ( = ?auto_90936 ?auto_90943 ) ) ( not ( = ?auto_90938 ?auto_90943 ) ) ( not ( = ?auto_90937 ?auto_90943 ) ) ( not ( = ?auto_90940 ?auto_90943 ) ) ( not ( = ?auto_90942 ?auto_90943 ) ) ( not ( = ?auto_90939 ?auto_90943 ) ) ( not ( = ?auto_90941 ?auto_90943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_90936 ?auto_90943 )
      ( MAKE-1PILE ?auto_90936 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90944 - BLOCK
    )
    :vars
    (
      ?auto_90950 - BLOCK
      ?auto_90947 - BLOCK
      ?auto_90945 - BLOCK
      ?auto_90949 - BLOCK
      ?auto_90946 - BLOCK
      ?auto_90951 - BLOCK
      ?auto_90948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90944 ?auto_90950 ) ) ( ON-TABLE ?auto_90947 ) ( ON ?auto_90945 ?auto_90947 ) ( ON ?auto_90949 ?auto_90945 ) ( ON ?auto_90946 ?auto_90949 ) ( ON ?auto_90951 ?auto_90946 ) ( not ( = ?auto_90947 ?auto_90945 ) ) ( not ( = ?auto_90947 ?auto_90949 ) ) ( not ( = ?auto_90947 ?auto_90946 ) ) ( not ( = ?auto_90947 ?auto_90951 ) ) ( not ( = ?auto_90947 ?auto_90950 ) ) ( not ( = ?auto_90947 ?auto_90944 ) ) ( not ( = ?auto_90945 ?auto_90949 ) ) ( not ( = ?auto_90945 ?auto_90946 ) ) ( not ( = ?auto_90945 ?auto_90951 ) ) ( not ( = ?auto_90945 ?auto_90950 ) ) ( not ( = ?auto_90945 ?auto_90944 ) ) ( not ( = ?auto_90949 ?auto_90946 ) ) ( not ( = ?auto_90949 ?auto_90951 ) ) ( not ( = ?auto_90949 ?auto_90950 ) ) ( not ( = ?auto_90949 ?auto_90944 ) ) ( not ( = ?auto_90946 ?auto_90951 ) ) ( not ( = ?auto_90946 ?auto_90950 ) ) ( not ( = ?auto_90946 ?auto_90944 ) ) ( not ( = ?auto_90951 ?auto_90950 ) ) ( not ( = ?auto_90951 ?auto_90944 ) ) ( ON ?auto_90944 ?auto_90948 ) ( CLEAR ?auto_90944 ) ( not ( = ?auto_90944 ?auto_90948 ) ) ( not ( = ?auto_90950 ?auto_90948 ) ) ( not ( = ?auto_90947 ?auto_90948 ) ) ( not ( = ?auto_90945 ?auto_90948 ) ) ( not ( = ?auto_90949 ?auto_90948 ) ) ( not ( = ?auto_90946 ?auto_90948 ) ) ( not ( = ?auto_90951 ?auto_90948 ) ) ( HOLDING ?auto_90950 ) ( CLEAR ?auto_90951 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_90947 ?auto_90945 ?auto_90949 ?auto_90946 ?auto_90951 ?auto_90950 )
      ( MAKE-1PILE ?auto_90944 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90952 - BLOCK
    )
    :vars
    (
      ?auto_90958 - BLOCK
      ?auto_90954 - BLOCK
      ?auto_90959 - BLOCK
      ?auto_90953 - BLOCK
      ?auto_90955 - BLOCK
      ?auto_90956 - BLOCK
      ?auto_90957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90952 ?auto_90958 ) ) ( ON-TABLE ?auto_90954 ) ( ON ?auto_90959 ?auto_90954 ) ( ON ?auto_90953 ?auto_90959 ) ( ON ?auto_90955 ?auto_90953 ) ( ON ?auto_90956 ?auto_90955 ) ( not ( = ?auto_90954 ?auto_90959 ) ) ( not ( = ?auto_90954 ?auto_90953 ) ) ( not ( = ?auto_90954 ?auto_90955 ) ) ( not ( = ?auto_90954 ?auto_90956 ) ) ( not ( = ?auto_90954 ?auto_90958 ) ) ( not ( = ?auto_90954 ?auto_90952 ) ) ( not ( = ?auto_90959 ?auto_90953 ) ) ( not ( = ?auto_90959 ?auto_90955 ) ) ( not ( = ?auto_90959 ?auto_90956 ) ) ( not ( = ?auto_90959 ?auto_90958 ) ) ( not ( = ?auto_90959 ?auto_90952 ) ) ( not ( = ?auto_90953 ?auto_90955 ) ) ( not ( = ?auto_90953 ?auto_90956 ) ) ( not ( = ?auto_90953 ?auto_90958 ) ) ( not ( = ?auto_90953 ?auto_90952 ) ) ( not ( = ?auto_90955 ?auto_90956 ) ) ( not ( = ?auto_90955 ?auto_90958 ) ) ( not ( = ?auto_90955 ?auto_90952 ) ) ( not ( = ?auto_90956 ?auto_90958 ) ) ( not ( = ?auto_90956 ?auto_90952 ) ) ( ON ?auto_90952 ?auto_90957 ) ( not ( = ?auto_90952 ?auto_90957 ) ) ( not ( = ?auto_90958 ?auto_90957 ) ) ( not ( = ?auto_90954 ?auto_90957 ) ) ( not ( = ?auto_90959 ?auto_90957 ) ) ( not ( = ?auto_90953 ?auto_90957 ) ) ( not ( = ?auto_90955 ?auto_90957 ) ) ( not ( = ?auto_90956 ?auto_90957 ) ) ( CLEAR ?auto_90956 ) ( ON ?auto_90958 ?auto_90952 ) ( CLEAR ?auto_90958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_90957 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_90957 ?auto_90952 )
      ( MAKE-1PILE ?auto_90952 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90960 - BLOCK
    )
    :vars
    (
      ?auto_90965 - BLOCK
      ?auto_90962 - BLOCK
      ?auto_90967 - BLOCK
      ?auto_90966 - BLOCK
      ?auto_90963 - BLOCK
      ?auto_90964 - BLOCK
      ?auto_90961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90960 ?auto_90965 ) ) ( ON-TABLE ?auto_90962 ) ( ON ?auto_90967 ?auto_90962 ) ( ON ?auto_90966 ?auto_90967 ) ( ON ?auto_90963 ?auto_90966 ) ( not ( = ?auto_90962 ?auto_90967 ) ) ( not ( = ?auto_90962 ?auto_90966 ) ) ( not ( = ?auto_90962 ?auto_90963 ) ) ( not ( = ?auto_90962 ?auto_90964 ) ) ( not ( = ?auto_90962 ?auto_90965 ) ) ( not ( = ?auto_90962 ?auto_90960 ) ) ( not ( = ?auto_90967 ?auto_90966 ) ) ( not ( = ?auto_90967 ?auto_90963 ) ) ( not ( = ?auto_90967 ?auto_90964 ) ) ( not ( = ?auto_90967 ?auto_90965 ) ) ( not ( = ?auto_90967 ?auto_90960 ) ) ( not ( = ?auto_90966 ?auto_90963 ) ) ( not ( = ?auto_90966 ?auto_90964 ) ) ( not ( = ?auto_90966 ?auto_90965 ) ) ( not ( = ?auto_90966 ?auto_90960 ) ) ( not ( = ?auto_90963 ?auto_90964 ) ) ( not ( = ?auto_90963 ?auto_90965 ) ) ( not ( = ?auto_90963 ?auto_90960 ) ) ( not ( = ?auto_90964 ?auto_90965 ) ) ( not ( = ?auto_90964 ?auto_90960 ) ) ( ON ?auto_90960 ?auto_90961 ) ( not ( = ?auto_90960 ?auto_90961 ) ) ( not ( = ?auto_90965 ?auto_90961 ) ) ( not ( = ?auto_90962 ?auto_90961 ) ) ( not ( = ?auto_90967 ?auto_90961 ) ) ( not ( = ?auto_90966 ?auto_90961 ) ) ( not ( = ?auto_90963 ?auto_90961 ) ) ( not ( = ?auto_90964 ?auto_90961 ) ) ( ON ?auto_90965 ?auto_90960 ) ( CLEAR ?auto_90965 ) ( ON-TABLE ?auto_90961 ) ( HOLDING ?auto_90964 ) ( CLEAR ?auto_90963 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_90962 ?auto_90967 ?auto_90966 ?auto_90963 ?auto_90964 )
      ( MAKE-1PILE ?auto_90960 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90968 - BLOCK
    )
    :vars
    (
      ?auto_90975 - BLOCK
      ?auto_90974 - BLOCK
      ?auto_90971 - BLOCK
      ?auto_90972 - BLOCK
      ?auto_90973 - BLOCK
      ?auto_90970 - BLOCK
      ?auto_90969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90968 ?auto_90975 ) ) ( ON-TABLE ?auto_90974 ) ( ON ?auto_90971 ?auto_90974 ) ( ON ?auto_90972 ?auto_90971 ) ( ON ?auto_90973 ?auto_90972 ) ( not ( = ?auto_90974 ?auto_90971 ) ) ( not ( = ?auto_90974 ?auto_90972 ) ) ( not ( = ?auto_90974 ?auto_90973 ) ) ( not ( = ?auto_90974 ?auto_90970 ) ) ( not ( = ?auto_90974 ?auto_90975 ) ) ( not ( = ?auto_90974 ?auto_90968 ) ) ( not ( = ?auto_90971 ?auto_90972 ) ) ( not ( = ?auto_90971 ?auto_90973 ) ) ( not ( = ?auto_90971 ?auto_90970 ) ) ( not ( = ?auto_90971 ?auto_90975 ) ) ( not ( = ?auto_90971 ?auto_90968 ) ) ( not ( = ?auto_90972 ?auto_90973 ) ) ( not ( = ?auto_90972 ?auto_90970 ) ) ( not ( = ?auto_90972 ?auto_90975 ) ) ( not ( = ?auto_90972 ?auto_90968 ) ) ( not ( = ?auto_90973 ?auto_90970 ) ) ( not ( = ?auto_90973 ?auto_90975 ) ) ( not ( = ?auto_90973 ?auto_90968 ) ) ( not ( = ?auto_90970 ?auto_90975 ) ) ( not ( = ?auto_90970 ?auto_90968 ) ) ( ON ?auto_90968 ?auto_90969 ) ( not ( = ?auto_90968 ?auto_90969 ) ) ( not ( = ?auto_90975 ?auto_90969 ) ) ( not ( = ?auto_90974 ?auto_90969 ) ) ( not ( = ?auto_90971 ?auto_90969 ) ) ( not ( = ?auto_90972 ?auto_90969 ) ) ( not ( = ?auto_90973 ?auto_90969 ) ) ( not ( = ?auto_90970 ?auto_90969 ) ) ( ON ?auto_90975 ?auto_90968 ) ( ON-TABLE ?auto_90969 ) ( CLEAR ?auto_90973 ) ( ON ?auto_90970 ?auto_90975 ) ( CLEAR ?auto_90970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90969 ?auto_90968 ?auto_90975 )
      ( MAKE-1PILE ?auto_90968 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90976 - BLOCK
    )
    :vars
    (
      ?auto_90979 - BLOCK
      ?auto_90977 - BLOCK
      ?auto_90983 - BLOCK
      ?auto_90981 - BLOCK
      ?auto_90980 - BLOCK
      ?auto_90982 - BLOCK
      ?auto_90978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90976 ?auto_90979 ) ) ( ON-TABLE ?auto_90977 ) ( ON ?auto_90983 ?auto_90977 ) ( ON ?auto_90981 ?auto_90983 ) ( not ( = ?auto_90977 ?auto_90983 ) ) ( not ( = ?auto_90977 ?auto_90981 ) ) ( not ( = ?auto_90977 ?auto_90980 ) ) ( not ( = ?auto_90977 ?auto_90982 ) ) ( not ( = ?auto_90977 ?auto_90979 ) ) ( not ( = ?auto_90977 ?auto_90976 ) ) ( not ( = ?auto_90983 ?auto_90981 ) ) ( not ( = ?auto_90983 ?auto_90980 ) ) ( not ( = ?auto_90983 ?auto_90982 ) ) ( not ( = ?auto_90983 ?auto_90979 ) ) ( not ( = ?auto_90983 ?auto_90976 ) ) ( not ( = ?auto_90981 ?auto_90980 ) ) ( not ( = ?auto_90981 ?auto_90982 ) ) ( not ( = ?auto_90981 ?auto_90979 ) ) ( not ( = ?auto_90981 ?auto_90976 ) ) ( not ( = ?auto_90980 ?auto_90982 ) ) ( not ( = ?auto_90980 ?auto_90979 ) ) ( not ( = ?auto_90980 ?auto_90976 ) ) ( not ( = ?auto_90982 ?auto_90979 ) ) ( not ( = ?auto_90982 ?auto_90976 ) ) ( ON ?auto_90976 ?auto_90978 ) ( not ( = ?auto_90976 ?auto_90978 ) ) ( not ( = ?auto_90979 ?auto_90978 ) ) ( not ( = ?auto_90977 ?auto_90978 ) ) ( not ( = ?auto_90983 ?auto_90978 ) ) ( not ( = ?auto_90981 ?auto_90978 ) ) ( not ( = ?auto_90980 ?auto_90978 ) ) ( not ( = ?auto_90982 ?auto_90978 ) ) ( ON ?auto_90979 ?auto_90976 ) ( ON-TABLE ?auto_90978 ) ( ON ?auto_90982 ?auto_90979 ) ( CLEAR ?auto_90982 ) ( HOLDING ?auto_90980 ) ( CLEAR ?auto_90981 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90977 ?auto_90983 ?auto_90981 ?auto_90980 )
      ( MAKE-1PILE ?auto_90976 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90984 - BLOCK
    )
    :vars
    (
      ?auto_90991 - BLOCK
      ?auto_90987 - BLOCK
      ?auto_90985 - BLOCK
      ?auto_90989 - BLOCK
      ?auto_90986 - BLOCK
      ?auto_90988 - BLOCK
      ?auto_90990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90984 ?auto_90991 ) ) ( ON-TABLE ?auto_90987 ) ( ON ?auto_90985 ?auto_90987 ) ( ON ?auto_90989 ?auto_90985 ) ( not ( = ?auto_90987 ?auto_90985 ) ) ( not ( = ?auto_90987 ?auto_90989 ) ) ( not ( = ?auto_90987 ?auto_90986 ) ) ( not ( = ?auto_90987 ?auto_90988 ) ) ( not ( = ?auto_90987 ?auto_90991 ) ) ( not ( = ?auto_90987 ?auto_90984 ) ) ( not ( = ?auto_90985 ?auto_90989 ) ) ( not ( = ?auto_90985 ?auto_90986 ) ) ( not ( = ?auto_90985 ?auto_90988 ) ) ( not ( = ?auto_90985 ?auto_90991 ) ) ( not ( = ?auto_90985 ?auto_90984 ) ) ( not ( = ?auto_90989 ?auto_90986 ) ) ( not ( = ?auto_90989 ?auto_90988 ) ) ( not ( = ?auto_90989 ?auto_90991 ) ) ( not ( = ?auto_90989 ?auto_90984 ) ) ( not ( = ?auto_90986 ?auto_90988 ) ) ( not ( = ?auto_90986 ?auto_90991 ) ) ( not ( = ?auto_90986 ?auto_90984 ) ) ( not ( = ?auto_90988 ?auto_90991 ) ) ( not ( = ?auto_90988 ?auto_90984 ) ) ( ON ?auto_90984 ?auto_90990 ) ( not ( = ?auto_90984 ?auto_90990 ) ) ( not ( = ?auto_90991 ?auto_90990 ) ) ( not ( = ?auto_90987 ?auto_90990 ) ) ( not ( = ?auto_90985 ?auto_90990 ) ) ( not ( = ?auto_90989 ?auto_90990 ) ) ( not ( = ?auto_90986 ?auto_90990 ) ) ( not ( = ?auto_90988 ?auto_90990 ) ) ( ON ?auto_90991 ?auto_90984 ) ( ON-TABLE ?auto_90990 ) ( ON ?auto_90988 ?auto_90991 ) ( CLEAR ?auto_90989 ) ( ON ?auto_90986 ?auto_90988 ) ( CLEAR ?auto_90986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_90990 ?auto_90984 ?auto_90991 ?auto_90988 )
      ( MAKE-1PILE ?auto_90984 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_90992 - BLOCK
    )
    :vars
    (
      ?auto_90999 - BLOCK
      ?auto_90998 - BLOCK
      ?auto_90993 - BLOCK
      ?auto_90994 - BLOCK
      ?auto_90996 - BLOCK
      ?auto_90995 - BLOCK
      ?auto_90997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_90992 ?auto_90999 ) ) ( ON-TABLE ?auto_90998 ) ( ON ?auto_90993 ?auto_90998 ) ( not ( = ?auto_90998 ?auto_90993 ) ) ( not ( = ?auto_90998 ?auto_90994 ) ) ( not ( = ?auto_90998 ?auto_90996 ) ) ( not ( = ?auto_90998 ?auto_90995 ) ) ( not ( = ?auto_90998 ?auto_90999 ) ) ( not ( = ?auto_90998 ?auto_90992 ) ) ( not ( = ?auto_90993 ?auto_90994 ) ) ( not ( = ?auto_90993 ?auto_90996 ) ) ( not ( = ?auto_90993 ?auto_90995 ) ) ( not ( = ?auto_90993 ?auto_90999 ) ) ( not ( = ?auto_90993 ?auto_90992 ) ) ( not ( = ?auto_90994 ?auto_90996 ) ) ( not ( = ?auto_90994 ?auto_90995 ) ) ( not ( = ?auto_90994 ?auto_90999 ) ) ( not ( = ?auto_90994 ?auto_90992 ) ) ( not ( = ?auto_90996 ?auto_90995 ) ) ( not ( = ?auto_90996 ?auto_90999 ) ) ( not ( = ?auto_90996 ?auto_90992 ) ) ( not ( = ?auto_90995 ?auto_90999 ) ) ( not ( = ?auto_90995 ?auto_90992 ) ) ( ON ?auto_90992 ?auto_90997 ) ( not ( = ?auto_90992 ?auto_90997 ) ) ( not ( = ?auto_90999 ?auto_90997 ) ) ( not ( = ?auto_90998 ?auto_90997 ) ) ( not ( = ?auto_90993 ?auto_90997 ) ) ( not ( = ?auto_90994 ?auto_90997 ) ) ( not ( = ?auto_90996 ?auto_90997 ) ) ( not ( = ?auto_90995 ?auto_90997 ) ) ( ON ?auto_90999 ?auto_90992 ) ( ON-TABLE ?auto_90997 ) ( ON ?auto_90995 ?auto_90999 ) ( ON ?auto_90996 ?auto_90995 ) ( CLEAR ?auto_90996 ) ( HOLDING ?auto_90994 ) ( CLEAR ?auto_90993 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_90998 ?auto_90993 ?auto_90994 )
      ( MAKE-1PILE ?auto_90992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91000 - BLOCK
    )
    :vars
    (
      ?auto_91005 - BLOCK
      ?auto_91004 - BLOCK
      ?auto_91003 - BLOCK
      ?auto_91006 - BLOCK
      ?auto_91007 - BLOCK
      ?auto_91002 - BLOCK
      ?auto_91001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91000 ?auto_91005 ) ) ( ON-TABLE ?auto_91004 ) ( ON ?auto_91003 ?auto_91004 ) ( not ( = ?auto_91004 ?auto_91003 ) ) ( not ( = ?auto_91004 ?auto_91006 ) ) ( not ( = ?auto_91004 ?auto_91007 ) ) ( not ( = ?auto_91004 ?auto_91002 ) ) ( not ( = ?auto_91004 ?auto_91005 ) ) ( not ( = ?auto_91004 ?auto_91000 ) ) ( not ( = ?auto_91003 ?auto_91006 ) ) ( not ( = ?auto_91003 ?auto_91007 ) ) ( not ( = ?auto_91003 ?auto_91002 ) ) ( not ( = ?auto_91003 ?auto_91005 ) ) ( not ( = ?auto_91003 ?auto_91000 ) ) ( not ( = ?auto_91006 ?auto_91007 ) ) ( not ( = ?auto_91006 ?auto_91002 ) ) ( not ( = ?auto_91006 ?auto_91005 ) ) ( not ( = ?auto_91006 ?auto_91000 ) ) ( not ( = ?auto_91007 ?auto_91002 ) ) ( not ( = ?auto_91007 ?auto_91005 ) ) ( not ( = ?auto_91007 ?auto_91000 ) ) ( not ( = ?auto_91002 ?auto_91005 ) ) ( not ( = ?auto_91002 ?auto_91000 ) ) ( ON ?auto_91000 ?auto_91001 ) ( not ( = ?auto_91000 ?auto_91001 ) ) ( not ( = ?auto_91005 ?auto_91001 ) ) ( not ( = ?auto_91004 ?auto_91001 ) ) ( not ( = ?auto_91003 ?auto_91001 ) ) ( not ( = ?auto_91006 ?auto_91001 ) ) ( not ( = ?auto_91007 ?auto_91001 ) ) ( not ( = ?auto_91002 ?auto_91001 ) ) ( ON ?auto_91005 ?auto_91000 ) ( ON-TABLE ?auto_91001 ) ( ON ?auto_91002 ?auto_91005 ) ( ON ?auto_91007 ?auto_91002 ) ( CLEAR ?auto_91003 ) ( ON ?auto_91006 ?auto_91007 ) ( CLEAR ?auto_91006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91001 ?auto_91000 ?auto_91005 ?auto_91002 ?auto_91007 )
      ( MAKE-1PILE ?auto_91000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91008 - BLOCK
    )
    :vars
    (
      ?auto_91011 - BLOCK
      ?auto_91014 - BLOCK
      ?auto_91015 - BLOCK
      ?auto_91010 - BLOCK
      ?auto_91013 - BLOCK
      ?auto_91012 - BLOCK
      ?auto_91009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91008 ?auto_91011 ) ) ( ON-TABLE ?auto_91014 ) ( not ( = ?auto_91014 ?auto_91015 ) ) ( not ( = ?auto_91014 ?auto_91010 ) ) ( not ( = ?auto_91014 ?auto_91013 ) ) ( not ( = ?auto_91014 ?auto_91012 ) ) ( not ( = ?auto_91014 ?auto_91011 ) ) ( not ( = ?auto_91014 ?auto_91008 ) ) ( not ( = ?auto_91015 ?auto_91010 ) ) ( not ( = ?auto_91015 ?auto_91013 ) ) ( not ( = ?auto_91015 ?auto_91012 ) ) ( not ( = ?auto_91015 ?auto_91011 ) ) ( not ( = ?auto_91015 ?auto_91008 ) ) ( not ( = ?auto_91010 ?auto_91013 ) ) ( not ( = ?auto_91010 ?auto_91012 ) ) ( not ( = ?auto_91010 ?auto_91011 ) ) ( not ( = ?auto_91010 ?auto_91008 ) ) ( not ( = ?auto_91013 ?auto_91012 ) ) ( not ( = ?auto_91013 ?auto_91011 ) ) ( not ( = ?auto_91013 ?auto_91008 ) ) ( not ( = ?auto_91012 ?auto_91011 ) ) ( not ( = ?auto_91012 ?auto_91008 ) ) ( ON ?auto_91008 ?auto_91009 ) ( not ( = ?auto_91008 ?auto_91009 ) ) ( not ( = ?auto_91011 ?auto_91009 ) ) ( not ( = ?auto_91014 ?auto_91009 ) ) ( not ( = ?auto_91015 ?auto_91009 ) ) ( not ( = ?auto_91010 ?auto_91009 ) ) ( not ( = ?auto_91013 ?auto_91009 ) ) ( not ( = ?auto_91012 ?auto_91009 ) ) ( ON ?auto_91011 ?auto_91008 ) ( ON-TABLE ?auto_91009 ) ( ON ?auto_91012 ?auto_91011 ) ( ON ?auto_91013 ?auto_91012 ) ( ON ?auto_91010 ?auto_91013 ) ( CLEAR ?auto_91010 ) ( HOLDING ?auto_91015 ) ( CLEAR ?auto_91014 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91014 ?auto_91015 )
      ( MAKE-1PILE ?auto_91008 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91016 - BLOCK
    )
    :vars
    (
      ?auto_91017 - BLOCK
      ?auto_91022 - BLOCK
      ?auto_91020 - BLOCK
      ?auto_91023 - BLOCK
      ?auto_91019 - BLOCK
      ?auto_91021 - BLOCK
      ?auto_91018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91016 ?auto_91017 ) ) ( ON-TABLE ?auto_91022 ) ( not ( = ?auto_91022 ?auto_91020 ) ) ( not ( = ?auto_91022 ?auto_91023 ) ) ( not ( = ?auto_91022 ?auto_91019 ) ) ( not ( = ?auto_91022 ?auto_91021 ) ) ( not ( = ?auto_91022 ?auto_91017 ) ) ( not ( = ?auto_91022 ?auto_91016 ) ) ( not ( = ?auto_91020 ?auto_91023 ) ) ( not ( = ?auto_91020 ?auto_91019 ) ) ( not ( = ?auto_91020 ?auto_91021 ) ) ( not ( = ?auto_91020 ?auto_91017 ) ) ( not ( = ?auto_91020 ?auto_91016 ) ) ( not ( = ?auto_91023 ?auto_91019 ) ) ( not ( = ?auto_91023 ?auto_91021 ) ) ( not ( = ?auto_91023 ?auto_91017 ) ) ( not ( = ?auto_91023 ?auto_91016 ) ) ( not ( = ?auto_91019 ?auto_91021 ) ) ( not ( = ?auto_91019 ?auto_91017 ) ) ( not ( = ?auto_91019 ?auto_91016 ) ) ( not ( = ?auto_91021 ?auto_91017 ) ) ( not ( = ?auto_91021 ?auto_91016 ) ) ( ON ?auto_91016 ?auto_91018 ) ( not ( = ?auto_91016 ?auto_91018 ) ) ( not ( = ?auto_91017 ?auto_91018 ) ) ( not ( = ?auto_91022 ?auto_91018 ) ) ( not ( = ?auto_91020 ?auto_91018 ) ) ( not ( = ?auto_91023 ?auto_91018 ) ) ( not ( = ?auto_91019 ?auto_91018 ) ) ( not ( = ?auto_91021 ?auto_91018 ) ) ( ON ?auto_91017 ?auto_91016 ) ( ON-TABLE ?auto_91018 ) ( ON ?auto_91021 ?auto_91017 ) ( ON ?auto_91019 ?auto_91021 ) ( ON ?auto_91023 ?auto_91019 ) ( CLEAR ?auto_91022 ) ( ON ?auto_91020 ?auto_91023 ) ( CLEAR ?auto_91020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91018 ?auto_91016 ?auto_91017 ?auto_91021 ?auto_91019 ?auto_91023 )
      ( MAKE-1PILE ?auto_91016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91024 - BLOCK
    )
    :vars
    (
      ?auto_91027 - BLOCK
      ?auto_91029 - BLOCK
      ?auto_91031 - BLOCK
      ?auto_91026 - BLOCK
      ?auto_91028 - BLOCK
      ?auto_91025 - BLOCK
      ?auto_91030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91024 ?auto_91027 ) ) ( not ( = ?auto_91029 ?auto_91031 ) ) ( not ( = ?auto_91029 ?auto_91026 ) ) ( not ( = ?auto_91029 ?auto_91028 ) ) ( not ( = ?auto_91029 ?auto_91025 ) ) ( not ( = ?auto_91029 ?auto_91027 ) ) ( not ( = ?auto_91029 ?auto_91024 ) ) ( not ( = ?auto_91031 ?auto_91026 ) ) ( not ( = ?auto_91031 ?auto_91028 ) ) ( not ( = ?auto_91031 ?auto_91025 ) ) ( not ( = ?auto_91031 ?auto_91027 ) ) ( not ( = ?auto_91031 ?auto_91024 ) ) ( not ( = ?auto_91026 ?auto_91028 ) ) ( not ( = ?auto_91026 ?auto_91025 ) ) ( not ( = ?auto_91026 ?auto_91027 ) ) ( not ( = ?auto_91026 ?auto_91024 ) ) ( not ( = ?auto_91028 ?auto_91025 ) ) ( not ( = ?auto_91028 ?auto_91027 ) ) ( not ( = ?auto_91028 ?auto_91024 ) ) ( not ( = ?auto_91025 ?auto_91027 ) ) ( not ( = ?auto_91025 ?auto_91024 ) ) ( ON ?auto_91024 ?auto_91030 ) ( not ( = ?auto_91024 ?auto_91030 ) ) ( not ( = ?auto_91027 ?auto_91030 ) ) ( not ( = ?auto_91029 ?auto_91030 ) ) ( not ( = ?auto_91031 ?auto_91030 ) ) ( not ( = ?auto_91026 ?auto_91030 ) ) ( not ( = ?auto_91028 ?auto_91030 ) ) ( not ( = ?auto_91025 ?auto_91030 ) ) ( ON ?auto_91027 ?auto_91024 ) ( ON-TABLE ?auto_91030 ) ( ON ?auto_91025 ?auto_91027 ) ( ON ?auto_91028 ?auto_91025 ) ( ON ?auto_91026 ?auto_91028 ) ( ON ?auto_91031 ?auto_91026 ) ( CLEAR ?auto_91031 ) ( HOLDING ?auto_91029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91029 )
      ( MAKE-1PILE ?auto_91024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91032 - BLOCK
    )
    :vars
    (
      ?auto_91035 - BLOCK
      ?auto_91039 - BLOCK
      ?auto_91037 - BLOCK
      ?auto_91036 - BLOCK
      ?auto_91033 - BLOCK
      ?auto_91038 - BLOCK
      ?auto_91034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91032 ?auto_91035 ) ) ( not ( = ?auto_91039 ?auto_91037 ) ) ( not ( = ?auto_91039 ?auto_91036 ) ) ( not ( = ?auto_91039 ?auto_91033 ) ) ( not ( = ?auto_91039 ?auto_91038 ) ) ( not ( = ?auto_91039 ?auto_91035 ) ) ( not ( = ?auto_91039 ?auto_91032 ) ) ( not ( = ?auto_91037 ?auto_91036 ) ) ( not ( = ?auto_91037 ?auto_91033 ) ) ( not ( = ?auto_91037 ?auto_91038 ) ) ( not ( = ?auto_91037 ?auto_91035 ) ) ( not ( = ?auto_91037 ?auto_91032 ) ) ( not ( = ?auto_91036 ?auto_91033 ) ) ( not ( = ?auto_91036 ?auto_91038 ) ) ( not ( = ?auto_91036 ?auto_91035 ) ) ( not ( = ?auto_91036 ?auto_91032 ) ) ( not ( = ?auto_91033 ?auto_91038 ) ) ( not ( = ?auto_91033 ?auto_91035 ) ) ( not ( = ?auto_91033 ?auto_91032 ) ) ( not ( = ?auto_91038 ?auto_91035 ) ) ( not ( = ?auto_91038 ?auto_91032 ) ) ( ON ?auto_91032 ?auto_91034 ) ( not ( = ?auto_91032 ?auto_91034 ) ) ( not ( = ?auto_91035 ?auto_91034 ) ) ( not ( = ?auto_91039 ?auto_91034 ) ) ( not ( = ?auto_91037 ?auto_91034 ) ) ( not ( = ?auto_91036 ?auto_91034 ) ) ( not ( = ?auto_91033 ?auto_91034 ) ) ( not ( = ?auto_91038 ?auto_91034 ) ) ( ON ?auto_91035 ?auto_91032 ) ( ON-TABLE ?auto_91034 ) ( ON ?auto_91038 ?auto_91035 ) ( ON ?auto_91033 ?auto_91038 ) ( ON ?auto_91036 ?auto_91033 ) ( ON ?auto_91037 ?auto_91036 ) ( ON ?auto_91039 ?auto_91037 ) ( CLEAR ?auto_91039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91034 ?auto_91032 ?auto_91035 ?auto_91038 ?auto_91033 ?auto_91036 ?auto_91037 )
      ( MAKE-1PILE ?auto_91032 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91045 - BLOCK
      ?auto_91046 - BLOCK
      ?auto_91047 - BLOCK
      ?auto_91048 - BLOCK
      ?auto_91049 - BLOCK
    )
    :vars
    (
      ?auto_91050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91050 ?auto_91049 ) ( CLEAR ?auto_91050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91045 ) ( ON ?auto_91046 ?auto_91045 ) ( ON ?auto_91047 ?auto_91046 ) ( ON ?auto_91048 ?auto_91047 ) ( ON ?auto_91049 ?auto_91048 ) ( not ( = ?auto_91045 ?auto_91046 ) ) ( not ( = ?auto_91045 ?auto_91047 ) ) ( not ( = ?auto_91045 ?auto_91048 ) ) ( not ( = ?auto_91045 ?auto_91049 ) ) ( not ( = ?auto_91045 ?auto_91050 ) ) ( not ( = ?auto_91046 ?auto_91047 ) ) ( not ( = ?auto_91046 ?auto_91048 ) ) ( not ( = ?auto_91046 ?auto_91049 ) ) ( not ( = ?auto_91046 ?auto_91050 ) ) ( not ( = ?auto_91047 ?auto_91048 ) ) ( not ( = ?auto_91047 ?auto_91049 ) ) ( not ( = ?auto_91047 ?auto_91050 ) ) ( not ( = ?auto_91048 ?auto_91049 ) ) ( not ( = ?auto_91048 ?auto_91050 ) ) ( not ( = ?auto_91049 ?auto_91050 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91050 ?auto_91049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91051 - BLOCK
      ?auto_91052 - BLOCK
      ?auto_91053 - BLOCK
      ?auto_91054 - BLOCK
      ?auto_91055 - BLOCK
    )
    :vars
    (
      ?auto_91056 - BLOCK
      ?auto_91057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91056 ?auto_91055 ) ( CLEAR ?auto_91056 ) ( ON-TABLE ?auto_91051 ) ( ON ?auto_91052 ?auto_91051 ) ( ON ?auto_91053 ?auto_91052 ) ( ON ?auto_91054 ?auto_91053 ) ( ON ?auto_91055 ?auto_91054 ) ( not ( = ?auto_91051 ?auto_91052 ) ) ( not ( = ?auto_91051 ?auto_91053 ) ) ( not ( = ?auto_91051 ?auto_91054 ) ) ( not ( = ?auto_91051 ?auto_91055 ) ) ( not ( = ?auto_91051 ?auto_91056 ) ) ( not ( = ?auto_91052 ?auto_91053 ) ) ( not ( = ?auto_91052 ?auto_91054 ) ) ( not ( = ?auto_91052 ?auto_91055 ) ) ( not ( = ?auto_91052 ?auto_91056 ) ) ( not ( = ?auto_91053 ?auto_91054 ) ) ( not ( = ?auto_91053 ?auto_91055 ) ) ( not ( = ?auto_91053 ?auto_91056 ) ) ( not ( = ?auto_91054 ?auto_91055 ) ) ( not ( = ?auto_91054 ?auto_91056 ) ) ( not ( = ?auto_91055 ?auto_91056 ) ) ( HOLDING ?auto_91057 ) ( not ( = ?auto_91051 ?auto_91057 ) ) ( not ( = ?auto_91052 ?auto_91057 ) ) ( not ( = ?auto_91053 ?auto_91057 ) ) ( not ( = ?auto_91054 ?auto_91057 ) ) ( not ( = ?auto_91055 ?auto_91057 ) ) ( not ( = ?auto_91056 ?auto_91057 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_91057 )
      ( MAKE-5PILE ?auto_91051 ?auto_91052 ?auto_91053 ?auto_91054 ?auto_91055 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91058 - BLOCK
      ?auto_91059 - BLOCK
      ?auto_91060 - BLOCK
      ?auto_91061 - BLOCK
      ?auto_91062 - BLOCK
    )
    :vars
    (
      ?auto_91063 - BLOCK
      ?auto_91064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91063 ?auto_91062 ) ( ON-TABLE ?auto_91058 ) ( ON ?auto_91059 ?auto_91058 ) ( ON ?auto_91060 ?auto_91059 ) ( ON ?auto_91061 ?auto_91060 ) ( ON ?auto_91062 ?auto_91061 ) ( not ( = ?auto_91058 ?auto_91059 ) ) ( not ( = ?auto_91058 ?auto_91060 ) ) ( not ( = ?auto_91058 ?auto_91061 ) ) ( not ( = ?auto_91058 ?auto_91062 ) ) ( not ( = ?auto_91058 ?auto_91063 ) ) ( not ( = ?auto_91059 ?auto_91060 ) ) ( not ( = ?auto_91059 ?auto_91061 ) ) ( not ( = ?auto_91059 ?auto_91062 ) ) ( not ( = ?auto_91059 ?auto_91063 ) ) ( not ( = ?auto_91060 ?auto_91061 ) ) ( not ( = ?auto_91060 ?auto_91062 ) ) ( not ( = ?auto_91060 ?auto_91063 ) ) ( not ( = ?auto_91061 ?auto_91062 ) ) ( not ( = ?auto_91061 ?auto_91063 ) ) ( not ( = ?auto_91062 ?auto_91063 ) ) ( not ( = ?auto_91058 ?auto_91064 ) ) ( not ( = ?auto_91059 ?auto_91064 ) ) ( not ( = ?auto_91060 ?auto_91064 ) ) ( not ( = ?auto_91061 ?auto_91064 ) ) ( not ( = ?auto_91062 ?auto_91064 ) ) ( not ( = ?auto_91063 ?auto_91064 ) ) ( ON ?auto_91064 ?auto_91063 ) ( CLEAR ?auto_91064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91058 ?auto_91059 ?auto_91060 ?auto_91061 ?auto_91062 ?auto_91063 )
      ( MAKE-5PILE ?auto_91058 ?auto_91059 ?auto_91060 ?auto_91061 ?auto_91062 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91065 - BLOCK
      ?auto_91066 - BLOCK
      ?auto_91067 - BLOCK
      ?auto_91068 - BLOCK
      ?auto_91069 - BLOCK
    )
    :vars
    (
      ?auto_91071 - BLOCK
      ?auto_91070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91071 ?auto_91069 ) ( ON-TABLE ?auto_91065 ) ( ON ?auto_91066 ?auto_91065 ) ( ON ?auto_91067 ?auto_91066 ) ( ON ?auto_91068 ?auto_91067 ) ( ON ?auto_91069 ?auto_91068 ) ( not ( = ?auto_91065 ?auto_91066 ) ) ( not ( = ?auto_91065 ?auto_91067 ) ) ( not ( = ?auto_91065 ?auto_91068 ) ) ( not ( = ?auto_91065 ?auto_91069 ) ) ( not ( = ?auto_91065 ?auto_91071 ) ) ( not ( = ?auto_91066 ?auto_91067 ) ) ( not ( = ?auto_91066 ?auto_91068 ) ) ( not ( = ?auto_91066 ?auto_91069 ) ) ( not ( = ?auto_91066 ?auto_91071 ) ) ( not ( = ?auto_91067 ?auto_91068 ) ) ( not ( = ?auto_91067 ?auto_91069 ) ) ( not ( = ?auto_91067 ?auto_91071 ) ) ( not ( = ?auto_91068 ?auto_91069 ) ) ( not ( = ?auto_91068 ?auto_91071 ) ) ( not ( = ?auto_91069 ?auto_91071 ) ) ( not ( = ?auto_91065 ?auto_91070 ) ) ( not ( = ?auto_91066 ?auto_91070 ) ) ( not ( = ?auto_91067 ?auto_91070 ) ) ( not ( = ?auto_91068 ?auto_91070 ) ) ( not ( = ?auto_91069 ?auto_91070 ) ) ( not ( = ?auto_91071 ?auto_91070 ) ) ( HOLDING ?auto_91070 ) ( CLEAR ?auto_91071 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91065 ?auto_91066 ?auto_91067 ?auto_91068 ?auto_91069 ?auto_91071 ?auto_91070 )
      ( MAKE-5PILE ?auto_91065 ?auto_91066 ?auto_91067 ?auto_91068 ?auto_91069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91072 - BLOCK
      ?auto_91073 - BLOCK
      ?auto_91074 - BLOCK
      ?auto_91075 - BLOCK
      ?auto_91076 - BLOCK
    )
    :vars
    (
      ?auto_91077 - BLOCK
      ?auto_91078 - BLOCK
      ?auto_91079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91077 ?auto_91076 ) ( ON-TABLE ?auto_91072 ) ( ON ?auto_91073 ?auto_91072 ) ( ON ?auto_91074 ?auto_91073 ) ( ON ?auto_91075 ?auto_91074 ) ( ON ?auto_91076 ?auto_91075 ) ( not ( = ?auto_91072 ?auto_91073 ) ) ( not ( = ?auto_91072 ?auto_91074 ) ) ( not ( = ?auto_91072 ?auto_91075 ) ) ( not ( = ?auto_91072 ?auto_91076 ) ) ( not ( = ?auto_91072 ?auto_91077 ) ) ( not ( = ?auto_91073 ?auto_91074 ) ) ( not ( = ?auto_91073 ?auto_91075 ) ) ( not ( = ?auto_91073 ?auto_91076 ) ) ( not ( = ?auto_91073 ?auto_91077 ) ) ( not ( = ?auto_91074 ?auto_91075 ) ) ( not ( = ?auto_91074 ?auto_91076 ) ) ( not ( = ?auto_91074 ?auto_91077 ) ) ( not ( = ?auto_91075 ?auto_91076 ) ) ( not ( = ?auto_91075 ?auto_91077 ) ) ( not ( = ?auto_91076 ?auto_91077 ) ) ( not ( = ?auto_91072 ?auto_91078 ) ) ( not ( = ?auto_91073 ?auto_91078 ) ) ( not ( = ?auto_91074 ?auto_91078 ) ) ( not ( = ?auto_91075 ?auto_91078 ) ) ( not ( = ?auto_91076 ?auto_91078 ) ) ( not ( = ?auto_91077 ?auto_91078 ) ) ( CLEAR ?auto_91077 ) ( ON ?auto_91078 ?auto_91079 ) ( CLEAR ?auto_91078 ) ( HAND-EMPTY ) ( not ( = ?auto_91072 ?auto_91079 ) ) ( not ( = ?auto_91073 ?auto_91079 ) ) ( not ( = ?auto_91074 ?auto_91079 ) ) ( not ( = ?auto_91075 ?auto_91079 ) ) ( not ( = ?auto_91076 ?auto_91079 ) ) ( not ( = ?auto_91077 ?auto_91079 ) ) ( not ( = ?auto_91078 ?auto_91079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91078 ?auto_91079 )
      ( MAKE-5PILE ?auto_91072 ?auto_91073 ?auto_91074 ?auto_91075 ?auto_91076 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91096 - BLOCK
      ?auto_91097 - BLOCK
      ?auto_91098 - BLOCK
      ?auto_91099 - BLOCK
      ?auto_91100 - BLOCK
    )
    :vars
    (
      ?auto_91101 - BLOCK
      ?auto_91103 - BLOCK
      ?auto_91102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91096 ) ( ON ?auto_91097 ?auto_91096 ) ( ON ?auto_91098 ?auto_91097 ) ( ON ?auto_91099 ?auto_91098 ) ( not ( = ?auto_91096 ?auto_91097 ) ) ( not ( = ?auto_91096 ?auto_91098 ) ) ( not ( = ?auto_91096 ?auto_91099 ) ) ( not ( = ?auto_91096 ?auto_91100 ) ) ( not ( = ?auto_91096 ?auto_91101 ) ) ( not ( = ?auto_91097 ?auto_91098 ) ) ( not ( = ?auto_91097 ?auto_91099 ) ) ( not ( = ?auto_91097 ?auto_91100 ) ) ( not ( = ?auto_91097 ?auto_91101 ) ) ( not ( = ?auto_91098 ?auto_91099 ) ) ( not ( = ?auto_91098 ?auto_91100 ) ) ( not ( = ?auto_91098 ?auto_91101 ) ) ( not ( = ?auto_91099 ?auto_91100 ) ) ( not ( = ?auto_91099 ?auto_91101 ) ) ( not ( = ?auto_91100 ?auto_91101 ) ) ( not ( = ?auto_91096 ?auto_91103 ) ) ( not ( = ?auto_91097 ?auto_91103 ) ) ( not ( = ?auto_91098 ?auto_91103 ) ) ( not ( = ?auto_91099 ?auto_91103 ) ) ( not ( = ?auto_91100 ?auto_91103 ) ) ( not ( = ?auto_91101 ?auto_91103 ) ) ( ON ?auto_91103 ?auto_91102 ) ( not ( = ?auto_91096 ?auto_91102 ) ) ( not ( = ?auto_91097 ?auto_91102 ) ) ( not ( = ?auto_91098 ?auto_91102 ) ) ( not ( = ?auto_91099 ?auto_91102 ) ) ( not ( = ?auto_91100 ?auto_91102 ) ) ( not ( = ?auto_91101 ?auto_91102 ) ) ( not ( = ?auto_91103 ?auto_91102 ) ) ( ON ?auto_91101 ?auto_91103 ) ( CLEAR ?auto_91101 ) ( HOLDING ?auto_91100 ) ( CLEAR ?auto_91099 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91096 ?auto_91097 ?auto_91098 ?auto_91099 ?auto_91100 ?auto_91101 )
      ( MAKE-5PILE ?auto_91096 ?auto_91097 ?auto_91098 ?auto_91099 ?auto_91100 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91104 - BLOCK
      ?auto_91105 - BLOCK
      ?auto_91106 - BLOCK
      ?auto_91107 - BLOCK
      ?auto_91108 - BLOCK
    )
    :vars
    (
      ?auto_91109 - BLOCK
      ?auto_91110 - BLOCK
      ?auto_91111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91104 ) ( ON ?auto_91105 ?auto_91104 ) ( ON ?auto_91106 ?auto_91105 ) ( ON ?auto_91107 ?auto_91106 ) ( not ( = ?auto_91104 ?auto_91105 ) ) ( not ( = ?auto_91104 ?auto_91106 ) ) ( not ( = ?auto_91104 ?auto_91107 ) ) ( not ( = ?auto_91104 ?auto_91108 ) ) ( not ( = ?auto_91104 ?auto_91109 ) ) ( not ( = ?auto_91105 ?auto_91106 ) ) ( not ( = ?auto_91105 ?auto_91107 ) ) ( not ( = ?auto_91105 ?auto_91108 ) ) ( not ( = ?auto_91105 ?auto_91109 ) ) ( not ( = ?auto_91106 ?auto_91107 ) ) ( not ( = ?auto_91106 ?auto_91108 ) ) ( not ( = ?auto_91106 ?auto_91109 ) ) ( not ( = ?auto_91107 ?auto_91108 ) ) ( not ( = ?auto_91107 ?auto_91109 ) ) ( not ( = ?auto_91108 ?auto_91109 ) ) ( not ( = ?auto_91104 ?auto_91110 ) ) ( not ( = ?auto_91105 ?auto_91110 ) ) ( not ( = ?auto_91106 ?auto_91110 ) ) ( not ( = ?auto_91107 ?auto_91110 ) ) ( not ( = ?auto_91108 ?auto_91110 ) ) ( not ( = ?auto_91109 ?auto_91110 ) ) ( ON ?auto_91110 ?auto_91111 ) ( not ( = ?auto_91104 ?auto_91111 ) ) ( not ( = ?auto_91105 ?auto_91111 ) ) ( not ( = ?auto_91106 ?auto_91111 ) ) ( not ( = ?auto_91107 ?auto_91111 ) ) ( not ( = ?auto_91108 ?auto_91111 ) ) ( not ( = ?auto_91109 ?auto_91111 ) ) ( not ( = ?auto_91110 ?auto_91111 ) ) ( ON ?auto_91109 ?auto_91110 ) ( CLEAR ?auto_91107 ) ( ON ?auto_91108 ?auto_91109 ) ( CLEAR ?auto_91108 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91111 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91111 ?auto_91110 ?auto_91109 )
      ( MAKE-5PILE ?auto_91104 ?auto_91105 ?auto_91106 ?auto_91107 ?auto_91108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91112 - BLOCK
      ?auto_91113 - BLOCK
      ?auto_91114 - BLOCK
      ?auto_91115 - BLOCK
      ?auto_91116 - BLOCK
    )
    :vars
    (
      ?auto_91119 - BLOCK
      ?auto_91118 - BLOCK
      ?auto_91117 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91112 ) ( ON ?auto_91113 ?auto_91112 ) ( ON ?auto_91114 ?auto_91113 ) ( not ( = ?auto_91112 ?auto_91113 ) ) ( not ( = ?auto_91112 ?auto_91114 ) ) ( not ( = ?auto_91112 ?auto_91115 ) ) ( not ( = ?auto_91112 ?auto_91116 ) ) ( not ( = ?auto_91112 ?auto_91119 ) ) ( not ( = ?auto_91113 ?auto_91114 ) ) ( not ( = ?auto_91113 ?auto_91115 ) ) ( not ( = ?auto_91113 ?auto_91116 ) ) ( not ( = ?auto_91113 ?auto_91119 ) ) ( not ( = ?auto_91114 ?auto_91115 ) ) ( not ( = ?auto_91114 ?auto_91116 ) ) ( not ( = ?auto_91114 ?auto_91119 ) ) ( not ( = ?auto_91115 ?auto_91116 ) ) ( not ( = ?auto_91115 ?auto_91119 ) ) ( not ( = ?auto_91116 ?auto_91119 ) ) ( not ( = ?auto_91112 ?auto_91118 ) ) ( not ( = ?auto_91113 ?auto_91118 ) ) ( not ( = ?auto_91114 ?auto_91118 ) ) ( not ( = ?auto_91115 ?auto_91118 ) ) ( not ( = ?auto_91116 ?auto_91118 ) ) ( not ( = ?auto_91119 ?auto_91118 ) ) ( ON ?auto_91118 ?auto_91117 ) ( not ( = ?auto_91112 ?auto_91117 ) ) ( not ( = ?auto_91113 ?auto_91117 ) ) ( not ( = ?auto_91114 ?auto_91117 ) ) ( not ( = ?auto_91115 ?auto_91117 ) ) ( not ( = ?auto_91116 ?auto_91117 ) ) ( not ( = ?auto_91119 ?auto_91117 ) ) ( not ( = ?auto_91118 ?auto_91117 ) ) ( ON ?auto_91119 ?auto_91118 ) ( ON ?auto_91116 ?auto_91119 ) ( CLEAR ?auto_91116 ) ( ON-TABLE ?auto_91117 ) ( HOLDING ?auto_91115 ) ( CLEAR ?auto_91114 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91112 ?auto_91113 ?auto_91114 ?auto_91115 )
      ( MAKE-5PILE ?auto_91112 ?auto_91113 ?auto_91114 ?auto_91115 ?auto_91116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91120 - BLOCK
      ?auto_91121 - BLOCK
      ?auto_91122 - BLOCK
      ?auto_91123 - BLOCK
      ?auto_91124 - BLOCK
    )
    :vars
    (
      ?auto_91126 - BLOCK
      ?auto_91127 - BLOCK
      ?auto_91125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91120 ) ( ON ?auto_91121 ?auto_91120 ) ( ON ?auto_91122 ?auto_91121 ) ( not ( = ?auto_91120 ?auto_91121 ) ) ( not ( = ?auto_91120 ?auto_91122 ) ) ( not ( = ?auto_91120 ?auto_91123 ) ) ( not ( = ?auto_91120 ?auto_91124 ) ) ( not ( = ?auto_91120 ?auto_91126 ) ) ( not ( = ?auto_91121 ?auto_91122 ) ) ( not ( = ?auto_91121 ?auto_91123 ) ) ( not ( = ?auto_91121 ?auto_91124 ) ) ( not ( = ?auto_91121 ?auto_91126 ) ) ( not ( = ?auto_91122 ?auto_91123 ) ) ( not ( = ?auto_91122 ?auto_91124 ) ) ( not ( = ?auto_91122 ?auto_91126 ) ) ( not ( = ?auto_91123 ?auto_91124 ) ) ( not ( = ?auto_91123 ?auto_91126 ) ) ( not ( = ?auto_91124 ?auto_91126 ) ) ( not ( = ?auto_91120 ?auto_91127 ) ) ( not ( = ?auto_91121 ?auto_91127 ) ) ( not ( = ?auto_91122 ?auto_91127 ) ) ( not ( = ?auto_91123 ?auto_91127 ) ) ( not ( = ?auto_91124 ?auto_91127 ) ) ( not ( = ?auto_91126 ?auto_91127 ) ) ( ON ?auto_91127 ?auto_91125 ) ( not ( = ?auto_91120 ?auto_91125 ) ) ( not ( = ?auto_91121 ?auto_91125 ) ) ( not ( = ?auto_91122 ?auto_91125 ) ) ( not ( = ?auto_91123 ?auto_91125 ) ) ( not ( = ?auto_91124 ?auto_91125 ) ) ( not ( = ?auto_91126 ?auto_91125 ) ) ( not ( = ?auto_91127 ?auto_91125 ) ) ( ON ?auto_91126 ?auto_91127 ) ( ON ?auto_91124 ?auto_91126 ) ( ON-TABLE ?auto_91125 ) ( CLEAR ?auto_91122 ) ( ON ?auto_91123 ?auto_91124 ) ( CLEAR ?auto_91123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91125 ?auto_91127 ?auto_91126 ?auto_91124 )
      ( MAKE-5PILE ?auto_91120 ?auto_91121 ?auto_91122 ?auto_91123 ?auto_91124 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91128 - BLOCK
      ?auto_91129 - BLOCK
      ?auto_91130 - BLOCK
      ?auto_91131 - BLOCK
      ?auto_91132 - BLOCK
    )
    :vars
    (
      ?auto_91134 - BLOCK
      ?auto_91133 - BLOCK
      ?auto_91135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91128 ) ( ON ?auto_91129 ?auto_91128 ) ( not ( = ?auto_91128 ?auto_91129 ) ) ( not ( = ?auto_91128 ?auto_91130 ) ) ( not ( = ?auto_91128 ?auto_91131 ) ) ( not ( = ?auto_91128 ?auto_91132 ) ) ( not ( = ?auto_91128 ?auto_91134 ) ) ( not ( = ?auto_91129 ?auto_91130 ) ) ( not ( = ?auto_91129 ?auto_91131 ) ) ( not ( = ?auto_91129 ?auto_91132 ) ) ( not ( = ?auto_91129 ?auto_91134 ) ) ( not ( = ?auto_91130 ?auto_91131 ) ) ( not ( = ?auto_91130 ?auto_91132 ) ) ( not ( = ?auto_91130 ?auto_91134 ) ) ( not ( = ?auto_91131 ?auto_91132 ) ) ( not ( = ?auto_91131 ?auto_91134 ) ) ( not ( = ?auto_91132 ?auto_91134 ) ) ( not ( = ?auto_91128 ?auto_91133 ) ) ( not ( = ?auto_91129 ?auto_91133 ) ) ( not ( = ?auto_91130 ?auto_91133 ) ) ( not ( = ?auto_91131 ?auto_91133 ) ) ( not ( = ?auto_91132 ?auto_91133 ) ) ( not ( = ?auto_91134 ?auto_91133 ) ) ( ON ?auto_91133 ?auto_91135 ) ( not ( = ?auto_91128 ?auto_91135 ) ) ( not ( = ?auto_91129 ?auto_91135 ) ) ( not ( = ?auto_91130 ?auto_91135 ) ) ( not ( = ?auto_91131 ?auto_91135 ) ) ( not ( = ?auto_91132 ?auto_91135 ) ) ( not ( = ?auto_91134 ?auto_91135 ) ) ( not ( = ?auto_91133 ?auto_91135 ) ) ( ON ?auto_91134 ?auto_91133 ) ( ON ?auto_91132 ?auto_91134 ) ( ON-TABLE ?auto_91135 ) ( ON ?auto_91131 ?auto_91132 ) ( CLEAR ?auto_91131 ) ( HOLDING ?auto_91130 ) ( CLEAR ?auto_91129 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91128 ?auto_91129 ?auto_91130 )
      ( MAKE-5PILE ?auto_91128 ?auto_91129 ?auto_91130 ?auto_91131 ?auto_91132 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91136 - BLOCK
      ?auto_91137 - BLOCK
      ?auto_91138 - BLOCK
      ?auto_91139 - BLOCK
      ?auto_91140 - BLOCK
    )
    :vars
    (
      ?auto_91141 - BLOCK
      ?auto_91143 - BLOCK
      ?auto_91142 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91136 ) ( ON ?auto_91137 ?auto_91136 ) ( not ( = ?auto_91136 ?auto_91137 ) ) ( not ( = ?auto_91136 ?auto_91138 ) ) ( not ( = ?auto_91136 ?auto_91139 ) ) ( not ( = ?auto_91136 ?auto_91140 ) ) ( not ( = ?auto_91136 ?auto_91141 ) ) ( not ( = ?auto_91137 ?auto_91138 ) ) ( not ( = ?auto_91137 ?auto_91139 ) ) ( not ( = ?auto_91137 ?auto_91140 ) ) ( not ( = ?auto_91137 ?auto_91141 ) ) ( not ( = ?auto_91138 ?auto_91139 ) ) ( not ( = ?auto_91138 ?auto_91140 ) ) ( not ( = ?auto_91138 ?auto_91141 ) ) ( not ( = ?auto_91139 ?auto_91140 ) ) ( not ( = ?auto_91139 ?auto_91141 ) ) ( not ( = ?auto_91140 ?auto_91141 ) ) ( not ( = ?auto_91136 ?auto_91143 ) ) ( not ( = ?auto_91137 ?auto_91143 ) ) ( not ( = ?auto_91138 ?auto_91143 ) ) ( not ( = ?auto_91139 ?auto_91143 ) ) ( not ( = ?auto_91140 ?auto_91143 ) ) ( not ( = ?auto_91141 ?auto_91143 ) ) ( ON ?auto_91143 ?auto_91142 ) ( not ( = ?auto_91136 ?auto_91142 ) ) ( not ( = ?auto_91137 ?auto_91142 ) ) ( not ( = ?auto_91138 ?auto_91142 ) ) ( not ( = ?auto_91139 ?auto_91142 ) ) ( not ( = ?auto_91140 ?auto_91142 ) ) ( not ( = ?auto_91141 ?auto_91142 ) ) ( not ( = ?auto_91143 ?auto_91142 ) ) ( ON ?auto_91141 ?auto_91143 ) ( ON ?auto_91140 ?auto_91141 ) ( ON-TABLE ?auto_91142 ) ( ON ?auto_91139 ?auto_91140 ) ( CLEAR ?auto_91137 ) ( ON ?auto_91138 ?auto_91139 ) ( CLEAR ?auto_91138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91142 ?auto_91143 ?auto_91141 ?auto_91140 ?auto_91139 )
      ( MAKE-5PILE ?auto_91136 ?auto_91137 ?auto_91138 ?auto_91139 ?auto_91140 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91144 - BLOCK
      ?auto_91145 - BLOCK
      ?auto_91146 - BLOCK
      ?auto_91147 - BLOCK
      ?auto_91148 - BLOCK
    )
    :vars
    (
      ?auto_91151 - BLOCK
      ?auto_91150 - BLOCK
      ?auto_91149 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91144 ) ( not ( = ?auto_91144 ?auto_91145 ) ) ( not ( = ?auto_91144 ?auto_91146 ) ) ( not ( = ?auto_91144 ?auto_91147 ) ) ( not ( = ?auto_91144 ?auto_91148 ) ) ( not ( = ?auto_91144 ?auto_91151 ) ) ( not ( = ?auto_91145 ?auto_91146 ) ) ( not ( = ?auto_91145 ?auto_91147 ) ) ( not ( = ?auto_91145 ?auto_91148 ) ) ( not ( = ?auto_91145 ?auto_91151 ) ) ( not ( = ?auto_91146 ?auto_91147 ) ) ( not ( = ?auto_91146 ?auto_91148 ) ) ( not ( = ?auto_91146 ?auto_91151 ) ) ( not ( = ?auto_91147 ?auto_91148 ) ) ( not ( = ?auto_91147 ?auto_91151 ) ) ( not ( = ?auto_91148 ?auto_91151 ) ) ( not ( = ?auto_91144 ?auto_91150 ) ) ( not ( = ?auto_91145 ?auto_91150 ) ) ( not ( = ?auto_91146 ?auto_91150 ) ) ( not ( = ?auto_91147 ?auto_91150 ) ) ( not ( = ?auto_91148 ?auto_91150 ) ) ( not ( = ?auto_91151 ?auto_91150 ) ) ( ON ?auto_91150 ?auto_91149 ) ( not ( = ?auto_91144 ?auto_91149 ) ) ( not ( = ?auto_91145 ?auto_91149 ) ) ( not ( = ?auto_91146 ?auto_91149 ) ) ( not ( = ?auto_91147 ?auto_91149 ) ) ( not ( = ?auto_91148 ?auto_91149 ) ) ( not ( = ?auto_91151 ?auto_91149 ) ) ( not ( = ?auto_91150 ?auto_91149 ) ) ( ON ?auto_91151 ?auto_91150 ) ( ON ?auto_91148 ?auto_91151 ) ( ON-TABLE ?auto_91149 ) ( ON ?auto_91147 ?auto_91148 ) ( ON ?auto_91146 ?auto_91147 ) ( CLEAR ?auto_91146 ) ( HOLDING ?auto_91145 ) ( CLEAR ?auto_91144 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91144 ?auto_91145 )
      ( MAKE-5PILE ?auto_91144 ?auto_91145 ?auto_91146 ?auto_91147 ?auto_91148 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91152 - BLOCK
      ?auto_91153 - BLOCK
      ?auto_91154 - BLOCK
      ?auto_91155 - BLOCK
      ?auto_91156 - BLOCK
    )
    :vars
    (
      ?auto_91159 - BLOCK
      ?auto_91158 - BLOCK
      ?auto_91157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91152 ) ( not ( = ?auto_91152 ?auto_91153 ) ) ( not ( = ?auto_91152 ?auto_91154 ) ) ( not ( = ?auto_91152 ?auto_91155 ) ) ( not ( = ?auto_91152 ?auto_91156 ) ) ( not ( = ?auto_91152 ?auto_91159 ) ) ( not ( = ?auto_91153 ?auto_91154 ) ) ( not ( = ?auto_91153 ?auto_91155 ) ) ( not ( = ?auto_91153 ?auto_91156 ) ) ( not ( = ?auto_91153 ?auto_91159 ) ) ( not ( = ?auto_91154 ?auto_91155 ) ) ( not ( = ?auto_91154 ?auto_91156 ) ) ( not ( = ?auto_91154 ?auto_91159 ) ) ( not ( = ?auto_91155 ?auto_91156 ) ) ( not ( = ?auto_91155 ?auto_91159 ) ) ( not ( = ?auto_91156 ?auto_91159 ) ) ( not ( = ?auto_91152 ?auto_91158 ) ) ( not ( = ?auto_91153 ?auto_91158 ) ) ( not ( = ?auto_91154 ?auto_91158 ) ) ( not ( = ?auto_91155 ?auto_91158 ) ) ( not ( = ?auto_91156 ?auto_91158 ) ) ( not ( = ?auto_91159 ?auto_91158 ) ) ( ON ?auto_91158 ?auto_91157 ) ( not ( = ?auto_91152 ?auto_91157 ) ) ( not ( = ?auto_91153 ?auto_91157 ) ) ( not ( = ?auto_91154 ?auto_91157 ) ) ( not ( = ?auto_91155 ?auto_91157 ) ) ( not ( = ?auto_91156 ?auto_91157 ) ) ( not ( = ?auto_91159 ?auto_91157 ) ) ( not ( = ?auto_91158 ?auto_91157 ) ) ( ON ?auto_91159 ?auto_91158 ) ( ON ?auto_91156 ?auto_91159 ) ( ON-TABLE ?auto_91157 ) ( ON ?auto_91155 ?auto_91156 ) ( ON ?auto_91154 ?auto_91155 ) ( CLEAR ?auto_91152 ) ( ON ?auto_91153 ?auto_91154 ) ( CLEAR ?auto_91153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91157 ?auto_91158 ?auto_91159 ?auto_91156 ?auto_91155 ?auto_91154 )
      ( MAKE-5PILE ?auto_91152 ?auto_91153 ?auto_91154 ?auto_91155 ?auto_91156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91160 - BLOCK
      ?auto_91161 - BLOCK
      ?auto_91162 - BLOCK
      ?auto_91163 - BLOCK
      ?auto_91164 - BLOCK
    )
    :vars
    (
      ?auto_91166 - BLOCK
      ?auto_91165 - BLOCK
      ?auto_91167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91160 ?auto_91161 ) ) ( not ( = ?auto_91160 ?auto_91162 ) ) ( not ( = ?auto_91160 ?auto_91163 ) ) ( not ( = ?auto_91160 ?auto_91164 ) ) ( not ( = ?auto_91160 ?auto_91166 ) ) ( not ( = ?auto_91161 ?auto_91162 ) ) ( not ( = ?auto_91161 ?auto_91163 ) ) ( not ( = ?auto_91161 ?auto_91164 ) ) ( not ( = ?auto_91161 ?auto_91166 ) ) ( not ( = ?auto_91162 ?auto_91163 ) ) ( not ( = ?auto_91162 ?auto_91164 ) ) ( not ( = ?auto_91162 ?auto_91166 ) ) ( not ( = ?auto_91163 ?auto_91164 ) ) ( not ( = ?auto_91163 ?auto_91166 ) ) ( not ( = ?auto_91164 ?auto_91166 ) ) ( not ( = ?auto_91160 ?auto_91165 ) ) ( not ( = ?auto_91161 ?auto_91165 ) ) ( not ( = ?auto_91162 ?auto_91165 ) ) ( not ( = ?auto_91163 ?auto_91165 ) ) ( not ( = ?auto_91164 ?auto_91165 ) ) ( not ( = ?auto_91166 ?auto_91165 ) ) ( ON ?auto_91165 ?auto_91167 ) ( not ( = ?auto_91160 ?auto_91167 ) ) ( not ( = ?auto_91161 ?auto_91167 ) ) ( not ( = ?auto_91162 ?auto_91167 ) ) ( not ( = ?auto_91163 ?auto_91167 ) ) ( not ( = ?auto_91164 ?auto_91167 ) ) ( not ( = ?auto_91166 ?auto_91167 ) ) ( not ( = ?auto_91165 ?auto_91167 ) ) ( ON ?auto_91166 ?auto_91165 ) ( ON ?auto_91164 ?auto_91166 ) ( ON-TABLE ?auto_91167 ) ( ON ?auto_91163 ?auto_91164 ) ( ON ?auto_91162 ?auto_91163 ) ( ON ?auto_91161 ?auto_91162 ) ( CLEAR ?auto_91161 ) ( HOLDING ?auto_91160 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91160 )
      ( MAKE-5PILE ?auto_91160 ?auto_91161 ?auto_91162 ?auto_91163 ?auto_91164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91168 - BLOCK
      ?auto_91169 - BLOCK
      ?auto_91170 - BLOCK
      ?auto_91171 - BLOCK
      ?auto_91172 - BLOCK
    )
    :vars
    (
      ?auto_91173 - BLOCK
      ?auto_91175 - BLOCK
      ?auto_91174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91168 ?auto_91169 ) ) ( not ( = ?auto_91168 ?auto_91170 ) ) ( not ( = ?auto_91168 ?auto_91171 ) ) ( not ( = ?auto_91168 ?auto_91172 ) ) ( not ( = ?auto_91168 ?auto_91173 ) ) ( not ( = ?auto_91169 ?auto_91170 ) ) ( not ( = ?auto_91169 ?auto_91171 ) ) ( not ( = ?auto_91169 ?auto_91172 ) ) ( not ( = ?auto_91169 ?auto_91173 ) ) ( not ( = ?auto_91170 ?auto_91171 ) ) ( not ( = ?auto_91170 ?auto_91172 ) ) ( not ( = ?auto_91170 ?auto_91173 ) ) ( not ( = ?auto_91171 ?auto_91172 ) ) ( not ( = ?auto_91171 ?auto_91173 ) ) ( not ( = ?auto_91172 ?auto_91173 ) ) ( not ( = ?auto_91168 ?auto_91175 ) ) ( not ( = ?auto_91169 ?auto_91175 ) ) ( not ( = ?auto_91170 ?auto_91175 ) ) ( not ( = ?auto_91171 ?auto_91175 ) ) ( not ( = ?auto_91172 ?auto_91175 ) ) ( not ( = ?auto_91173 ?auto_91175 ) ) ( ON ?auto_91175 ?auto_91174 ) ( not ( = ?auto_91168 ?auto_91174 ) ) ( not ( = ?auto_91169 ?auto_91174 ) ) ( not ( = ?auto_91170 ?auto_91174 ) ) ( not ( = ?auto_91171 ?auto_91174 ) ) ( not ( = ?auto_91172 ?auto_91174 ) ) ( not ( = ?auto_91173 ?auto_91174 ) ) ( not ( = ?auto_91175 ?auto_91174 ) ) ( ON ?auto_91173 ?auto_91175 ) ( ON ?auto_91172 ?auto_91173 ) ( ON-TABLE ?auto_91174 ) ( ON ?auto_91171 ?auto_91172 ) ( ON ?auto_91170 ?auto_91171 ) ( ON ?auto_91169 ?auto_91170 ) ( ON ?auto_91168 ?auto_91169 ) ( CLEAR ?auto_91168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91174 ?auto_91175 ?auto_91173 ?auto_91172 ?auto_91171 ?auto_91170 ?auto_91169 )
      ( MAKE-5PILE ?auto_91168 ?auto_91169 ?auto_91170 ?auto_91171 ?auto_91172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91178 - BLOCK
      ?auto_91179 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91179 ) ( CLEAR ?auto_91178 ) ( ON-TABLE ?auto_91178 ) ( not ( = ?auto_91178 ?auto_91179 ) ) )
    :subtasks
    ( ( !STACK ?auto_91179 ?auto_91178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91180 - BLOCK
      ?auto_91181 - BLOCK
    )
    :vars
    (
      ?auto_91182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91180 ) ( ON-TABLE ?auto_91180 ) ( not ( = ?auto_91180 ?auto_91181 ) ) ( ON ?auto_91181 ?auto_91182 ) ( CLEAR ?auto_91181 ) ( HAND-EMPTY ) ( not ( = ?auto_91180 ?auto_91182 ) ) ( not ( = ?auto_91181 ?auto_91182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91181 ?auto_91182 )
      ( MAKE-2PILE ?auto_91180 ?auto_91181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91183 - BLOCK
      ?auto_91184 - BLOCK
    )
    :vars
    (
      ?auto_91185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91183 ?auto_91184 ) ) ( ON ?auto_91184 ?auto_91185 ) ( CLEAR ?auto_91184 ) ( not ( = ?auto_91183 ?auto_91185 ) ) ( not ( = ?auto_91184 ?auto_91185 ) ) ( HOLDING ?auto_91183 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91183 )
      ( MAKE-2PILE ?auto_91183 ?auto_91184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91186 - BLOCK
      ?auto_91187 - BLOCK
    )
    :vars
    (
      ?auto_91188 - BLOCK
      ?auto_91192 - BLOCK
      ?auto_91191 - BLOCK
      ?auto_91189 - BLOCK
      ?auto_91190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91186 ?auto_91187 ) ) ( ON ?auto_91187 ?auto_91188 ) ( not ( = ?auto_91186 ?auto_91188 ) ) ( not ( = ?auto_91187 ?auto_91188 ) ) ( ON ?auto_91186 ?auto_91187 ) ( CLEAR ?auto_91186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91192 ) ( ON ?auto_91191 ?auto_91192 ) ( ON ?auto_91189 ?auto_91191 ) ( ON ?auto_91190 ?auto_91189 ) ( ON ?auto_91188 ?auto_91190 ) ( not ( = ?auto_91192 ?auto_91191 ) ) ( not ( = ?auto_91192 ?auto_91189 ) ) ( not ( = ?auto_91192 ?auto_91190 ) ) ( not ( = ?auto_91192 ?auto_91188 ) ) ( not ( = ?auto_91192 ?auto_91187 ) ) ( not ( = ?auto_91192 ?auto_91186 ) ) ( not ( = ?auto_91191 ?auto_91189 ) ) ( not ( = ?auto_91191 ?auto_91190 ) ) ( not ( = ?auto_91191 ?auto_91188 ) ) ( not ( = ?auto_91191 ?auto_91187 ) ) ( not ( = ?auto_91191 ?auto_91186 ) ) ( not ( = ?auto_91189 ?auto_91190 ) ) ( not ( = ?auto_91189 ?auto_91188 ) ) ( not ( = ?auto_91189 ?auto_91187 ) ) ( not ( = ?auto_91189 ?auto_91186 ) ) ( not ( = ?auto_91190 ?auto_91188 ) ) ( not ( = ?auto_91190 ?auto_91187 ) ) ( not ( = ?auto_91190 ?auto_91186 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91192 ?auto_91191 ?auto_91189 ?auto_91190 ?auto_91188 ?auto_91187 )
      ( MAKE-2PILE ?auto_91186 ?auto_91187 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91193 - BLOCK
      ?auto_91194 - BLOCK
    )
    :vars
    (
      ?auto_91198 - BLOCK
      ?auto_91195 - BLOCK
      ?auto_91196 - BLOCK
      ?auto_91199 - BLOCK
      ?auto_91197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91193 ?auto_91194 ) ) ( ON ?auto_91194 ?auto_91198 ) ( not ( = ?auto_91193 ?auto_91198 ) ) ( not ( = ?auto_91194 ?auto_91198 ) ) ( ON-TABLE ?auto_91195 ) ( ON ?auto_91196 ?auto_91195 ) ( ON ?auto_91199 ?auto_91196 ) ( ON ?auto_91197 ?auto_91199 ) ( ON ?auto_91198 ?auto_91197 ) ( not ( = ?auto_91195 ?auto_91196 ) ) ( not ( = ?auto_91195 ?auto_91199 ) ) ( not ( = ?auto_91195 ?auto_91197 ) ) ( not ( = ?auto_91195 ?auto_91198 ) ) ( not ( = ?auto_91195 ?auto_91194 ) ) ( not ( = ?auto_91195 ?auto_91193 ) ) ( not ( = ?auto_91196 ?auto_91199 ) ) ( not ( = ?auto_91196 ?auto_91197 ) ) ( not ( = ?auto_91196 ?auto_91198 ) ) ( not ( = ?auto_91196 ?auto_91194 ) ) ( not ( = ?auto_91196 ?auto_91193 ) ) ( not ( = ?auto_91199 ?auto_91197 ) ) ( not ( = ?auto_91199 ?auto_91198 ) ) ( not ( = ?auto_91199 ?auto_91194 ) ) ( not ( = ?auto_91199 ?auto_91193 ) ) ( not ( = ?auto_91197 ?auto_91198 ) ) ( not ( = ?auto_91197 ?auto_91194 ) ) ( not ( = ?auto_91197 ?auto_91193 ) ) ( HOLDING ?auto_91193 ) ( CLEAR ?auto_91194 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91195 ?auto_91196 ?auto_91199 ?auto_91197 ?auto_91198 ?auto_91194 ?auto_91193 )
      ( MAKE-2PILE ?auto_91193 ?auto_91194 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91200 - BLOCK
      ?auto_91201 - BLOCK
    )
    :vars
    (
      ?auto_91204 - BLOCK
      ?auto_91202 - BLOCK
      ?auto_91205 - BLOCK
      ?auto_91206 - BLOCK
      ?auto_91203 - BLOCK
      ?auto_91207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91200 ?auto_91201 ) ) ( ON ?auto_91201 ?auto_91204 ) ( not ( = ?auto_91200 ?auto_91204 ) ) ( not ( = ?auto_91201 ?auto_91204 ) ) ( ON-TABLE ?auto_91202 ) ( ON ?auto_91205 ?auto_91202 ) ( ON ?auto_91206 ?auto_91205 ) ( ON ?auto_91203 ?auto_91206 ) ( ON ?auto_91204 ?auto_91203 ) ( not ( = ?auto_91202 ?auto_91205 ) ) ( not ( = ?auto_91202 ?auto_91206 ) ) ( not ( = ?auto_91202 ?auto_91203 ) ) ( not ( = ?auto_91202 ?auto_91204 ) ) ( not ( = ?auto_91202 ?auto_91201 ) ) ( not ( = ?auto_91202 ?auto_91200 ) ) ( not ( = ?auto_91205 ?auto_91206 ) ) ( not ( = ?auto_91205 ?auto_91203 ) ) ( not ( = ?auto_91205 ?auto_91204 ) ) ( not ( = ?auto_91205 ?auto_91201 ) ) ( not ( = ?auto_91205 ?auto_91200 ) ) ( not ( = ?auto_91206 ?auto_91203 ) ) ( not ( = ?auto_91206 ?auto_91204 ) ) ( not ( = ?auto_91206 ?auto_91201 ) ) ( not ( = ?auto_91206 ?auto_91200 ) ) ( not ( = ?auto_91203 ?auto_91204 ) ) ( not ( = ?auto_91203 ?auto_91201 ) ) ( not ( = ?auto_91203 ?auto_91200 ) ) ( CLEAR ?auto_91201 ) ( ON ?auto_91200 ?auto_91207 ) ( CLEAR ?auto_91200 ) ( HAND-EMPTY ) ( not ( = ?auto_91200 ?auto_91207 ) ) ( not ( = ?auto_91201 ?auto_91207 ) ) ( not ( = ?auto_91204 ?auto_91207 ) ) ( not ( = ?auto_91202 ?auto_91207 ) ) ( not ( = ?auto_91205 ?auto_91207 ) ) ( not ( = ?auto_91206 ?auto_91207 ) ) ( not ( = ?auto_91203 ?auto_91207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91200 ?auto_91207 )
      ( MAKE-2PILE ?auto_91200 ?auto_91201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91208 - BLOCK
      ?auto_91209 - BLOCK
    )
    :vars
    (
      ?auto_91211 - BLOCK
      ?auto_91210 - BLOCK
      ?auto_91215 - BLOCK
      ?auto_91212 - BLOCK
      ?auto_91213 - BLOCK
      ?auto_91214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91208 ?auto_91209 ) ) ( not ( = ?auto_91208 ?auto_91211 ) ) ( not ( = ?auto_91209 ?auto_91211 ) ) ( ON-TABLE ?auto_91210 ) ( ON ?auto_91215 ?auto_91210 ) ( ON ?auto_91212 ?auto_91215 ) ( ON ?auto_91213 ?auto_91212 ) ( ON ?auto_91211 ?auto_91213 ) ( not ( = ?auto_91210 ?auto_91215 ) ) ( not ( = ?auto_91210 ?auto_91212 ) ) ( not ( = ?auto_91210 ?auto_91213 ) ) ( not ( = ?auto_91210 ?auto_91211 ) ) ( not ( = ?auto_91210 ?auto_91209 ) ) ( not ( = ?auto_91210 ?auto_91208 ) ) ( not ( = ?auto_91215 ?auto_91212 ) ) ( not ( = ?auto_91215 ?auto_91213 ) ) ( not ( = ?auto_91215 ?auto_91211 ) ) ( not ( = ?auto_91215 ?auto_91209 ) ) ( not ( = ?auto_91215 ?auto_91208 ) ) ( not ( = ?auto_91212 ?auto_91213 ) ) ( not ( = ?auto_91212 ?auto_91211 ) ) ( not ( = ?auto_91212 ?auto_91209 ) ) ( not ( = ?auto_91212 ?auto_91208 ) ) ( not ( = ?auto_91213 ?auto_91211 ) ) ( not ( = ?auto_91213 ?auto_91209 ) ) ( not ( = ?auto_91213 ?auto_91208 ) ) ( ON ?auto_91208 ?auto_91214 ) ( CLEAR ?auto_91208 ) ( not ( = ?auto_91208 ?auto_91214 ) ) ( not ( = ?auto_91209 ?auto_91214 ) ) ( not ( = ?auto_91211 ?auto_91214 ) ) ( not ( = ?auto_91210 ?auto_91214 ) ) ( not ( = ?auto_91215 ?auto_91214 ) ) ( not ( = ?auto_91212 ?auto_91214 ) ) ( not ( = ?auto_91213 ?auto_91214 ) ) ( HOLDING ?auto_91209 ) ( CLEAR ?auto_91211 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91210 ?auto_91215 ?auto_91212 ?auto_91213 ?auto_91211 ?auto_91209 )
      ( MAKE-2PILE ?auto_91208 ?auto_91209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91216 - BLOCK
      ?auto_91217 - BLOCK
    )
    :vars
    (
      ?auto_91223 - BLOCK
      ?auto_91218 - BLOCK
      ?auto_91219 - BLOCK
      ?auto_91221 - BLOCK
      ?auto_91222 - BLOCK
      ?auto_91220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91216 ?auto_91217 ) ) ( not ( = ?auto_91216 ?auto_91223 ) ) ( not ( = ?auto_91217 ?auto_91223 ) ) ( ON-TABLE ?auto_91218 ) ( ON ?auto_91219 ?auto_91218 ) ( ON ?auto_91221 ?auto_91219 ) ( ON ?auto_91222 ?auto_91221 ) ( ON ?auto_91223 ?auto_91222 ) ( not ( = ?auto_91218 ?auto_91219 ) ) ( not ( = ?auto_91218 ?auto_91221 ) ) ( not ( = ?auto_91218 ?auto_91222 ) ) ( not ( = ?auto_91218 ?auto_91223 ) ) ( not ( = ?auto_91218 ?auto_91217 ) ) ( not ( = ?auto_91218 ?auto_91216 ) ) ( not ( = ?auto_91219 ?auto_91221 ) ) ( not ( = ?auto_91219 ?auto_91222 ) ) ( not ( = ?auto_91219 ?auto_91223 ) ) ( not ( = ?auto_91219 ?auto_91217 ) ) ( not ( = ?auto_91219 ?auto_91216 ) ) ( not ( = ?auto_91221 ?auto_91222 ) ) ( not ( = ?auto_91221 ?auto_91223 ) ) ( not ( = ?auto_91221 ?auto_91217 ) ) ( not ( = ?auto_91221 ?auto_91216 ) ) ( not ( = ?auto_91222 ?auto_91223 ) ) ( not ( = ?auto_91222 ?auto_91217 ) ) ( not ( = ?auto_91222 ?auto_91216 ) ) ( ON ?auto_91216 ?auto_91220 ) ( not ( = ?auto_91216 ?auto_91220 ) ) ( not ( = ?auto_91217 ?auto_91220 ) ) ( not ( = ?auto_91223 ?auto_91220 ) ) ( not ( = ?auto_91218 ?auto_91220 ) ) ( not ( = ?auto_91219 ?auto_91220 ) ) ( not ( = ?auto_91221 ?auto_91220 ) ) ( not ( = ?auto_91222 ?auto_91220 ) ) ( CLEAR ?auto_91223 ) ( ON ?auto_91217 ?auto_91216 ) ( CLEAR ?auto_91217 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91220 ?auto_91216 )
      ( MAKE-2PILE ?auto_91216 ?auto_91217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91224 - BLOCK
      ?auto_91225 - BLOCK
    )
    :vars
    (
      ?auto_91227 - BLOCK
      ?auto_91228 - BLOCK
      ?auto_91230 - BLOCK
      ?auto_91229 - BLOCK
      ?auto_91226 - BLOCK
      ?auto_91231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91224 ?auto_91225 ) ) ( not ( = ?auto_91224 ?auto_91227 ) ) ( not ( = ?auto_91225 ?auto_91227 ) ) ( ON-TABLE ?auto_91228 ) ( ON ?auto_91230 ?auto_91228 ) ( ON ?auto_91229 ?auto_91230 ) ( ON ?auto_91226 ?auto_91229 ) ( not ( = ?auto_91228 ?auto_91230 ) ) ( not ( = ?auto_91228 ?auto_91229 ) ) ( not ( = ?auto_91228 ?auto_91226 ) ) ( not ( = ?auto_91228 ?auto_91227 ) ) ( not ( = ?auto_91228 ?auto_91225 ) ) ( not ( = ?auto_91228 ?auto_91224 ) ) ( not ( = ?auto_91230 ?auto_91229 ) ) ( not ( = ?auto_91230 ?auto_91226 ) ) ( not ( = ?auto_91230 ?auto_91227 ) ) ( not ( = ?auto_91230 ?auto_91225 ) ) ( not ( = ?auto_91230 ?auto_91224 ) ) ( not ( = ?auto_91229 ?auto_91226 ) ) ( not ( = ?auto_91229 ?auto_91227 ) ) ( not ( = ?auto_91229 ?auto_91225 ) ) ( not ( = ?auto_91229 ?auto_91224 ) ) ( not ( = ?auto_91226 ?auto_91227 ) ) ( not ( = ?auto_91226 ?auto_91225 ) ) ( not ( = ?auto_91226 ?auto_91224 ) ) ( ON ?auto_91224 ?auto_91231 ) ( not ( = ?auto_91224 ?auto_91231 ) ) ( not ( = ?auto_91225 ?auto_91231 ) ) ( not ( = ?auto_91227 ?auto_91231 ) ) ( not ( = ?auto_91228 ?auto_91231 ) ) ( not ( = ?auto_91230 ?auto_91231 ) ) ( not ( = ?auto_91229 ?auto_91231 ) ) ( not ( = ?auto_91226 ?auto_91231 ) ) ( ON ?auto_91225 ?auto_91224 ) ( CLEAR ?auto_91225 ) ( ON-TABLE ?auto_91231 ) ( HOLDING ?auto_91227 ) ( CLEAR ?auto_91226 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91228 ?auto_91230 ?auto_91229 ?auto_91226 ?auto_91227 )
      ( MAKE-2PILE ?auto_91224 ?auto_91225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91232 - BLOCK
      ?auto_91233 - BLOCK
    )
    :vars
    (
      ?auto_91236 - BLOCK
      ?auto_91237 - BLOCK
      ?auto_91238 - BLOCK
      ?auto_91239 - BLOCK
      ?auto_91235 - BLOCK
      ?auto_91234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91232 ?auto_91233 ) ) ( not ( = ?auto_91232 ?auto_91236 ) ) ( not ( = ?auto_91233 ?auto_91236 ) ) ( ON-TABLE ?auto_91237 ) ( ON ?auto_91238 ?auto_91237 ) ( ON ?auto_91239 ?auto_91238 ) ( ON ?auto_91235 ?auto_91239 ) ( not ( = ?auto_91237 ?auto_91238 ) ) ( not ( = ?auto_91237 ?auto_91239 ) ) ( not ( = ?auto_91237 ?auto_91235 ) ) ( not ( = ?auto_91237 ?auto_91236 ) ) ( not ( = ?auto_91237 ?auto_91233 ) ) ( not ( = ?auto_91237 ?auto_91232 ) ) ( not ( = ?auto_91238 ?auto_91239 ) ) ( not ( = ?auto_91238 ?auto_91235 ) ) ( not ( = ?auto_91238 ?auto_91236 ) ) ( not ( = ?auto_91238 ?auto_91233 ) ) ( not ( = ?auto_91238 ?auto_91232 ) ) ( not ( = ?auto_91239 ?auto_91235 ) ) ( not ( = ?auto_91239 ?auto_91236 ) ) ( not ( = ?auto_91239 ?auto_91233 ) ) ( not ( = ?auto_91239 ?auto_91232 ) ) ( not ( = ?auto_91235 ?auto_91236 ) ) ( not ( = ?auto_91235 ?auto_91233 ) ) ( not ( = ?auto_91235 ?auto_91232 ) ) ( ON ?auto_91232 ?auto_91234 ) ( not ( = ?auto_91232 ?auto_91234 ) ) ( not ( = ?auto_91233 ?auto_91234 ) ) ( not ( = ?auto_91236 ?auto_91234 ) ) ( not ( = ?auto_91237 ?auto_91234 ) ) ( not ( = ?auto_91238 ?auto_91234 ) ) ( not ( = ?auto_91239 ?auto_91234 ) ) ( not ( = ?auto_91235 ?auto_91234 ) ) ( ON ?auto_91233 ?auto_91232 ) ( ON-TABLE ?auto_91234 ) ( CLEAR ?auto_91235 ) ( ON ?auto_91236 ?auto_91233 ) ( CLEAR ?auto_91236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91234 ?auto_91232 ?auto_91233 )
      ( MAKE-2PILE ?auto_91232 ?auto_91233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91240 - BLOCK
      ?auto_91241 - BLOCK
    )
    :vars
    (
      ?auto_91246 - BLOCK
      ?auto_91247 - BLOCK
      ?auto_91242 - BLOCK
      ?auto_91243 - BLOCK
      ?auto_91244 - BLOCK
      ?auto_91245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91240 ?auto_91241 ) ) ( not ( = ?auto_91240 ?auto_91246 ) ) ( not ( = ?auto_91241 ?auto_91246 ) ) ( ON-TABLE ?auto_91247 ) ( ON ?auto_91242 ?auto_91247 ) ( ON ?auto_91243 ?auto_91242 ) ( not ( = ?auto_91247 ?auto_91242 ) ) ( not ( = ?auto_91247 ?auto_91243 ) ) ( not ( = ?auto_91247 ?auto_91244 ) ) ( not ( = ?auto_91247 ?auto_91246 ) ) ( not ( = ?auto_91247 ?auto_91241 ) ) ( not ( = ?auto_91247 ?auto_91240 ) ) ( not ( = ?auto_91242 ?auto_91243 ) ) ( not ( = ?auto_91242 ?auto_91244 ) ) ( not ( = ?auto_91242 ?auto_91246 ) ) ( not ( = ?auto_91242 ?auto_91241 ) ) ( not ( = ?auto_91242 ?auto_91240 ) ) ( not ( = ?auto_91243 ?auto_91244 ) ) ( not ( = ?auto_91243 ?auto_91246 ) ) ( not ( = ?auto_91243 ?auto_91241 ) ) ( not ( = ?auto_91243 ?auto_91240 ) ) ( not ( = ?auto_91244 ?auto_91246 ) ) ( not ( = ?auto_91244 ?auto_91241 ) ) ( not ( = ?auto_91244 ?auto_91240 ) ) ( ON ?auto_91240 ?auto_91245 ) ( not ( = ?auto_91240 ?auto_91245 ) ) ( not ( = ?auto_91241 ?auto_91245 ) ) ( not ( = ?auto_91246 ?auto_91245 ) ) ( not ( = ?auto_91247 ?auto_91245 ) ) ( not ( = ?auto_91242 ?auto_91245 ) ) ( not ( = ?auto_91243 ?auto_91245 ) ) ( not ( = ?auto_91244 ?auto_91245 ) ) ( ON ?auto_91241 ?auto_91240 ) ( ON-TABLE ?auto_91245 ) ( ON ?auto_91246 ?auto_91241 ) ( CLEAR ?auto_91246 ) ( HOLDING ?auto_91244 ) ( CLEAR ?auto_91243 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91247 ?auto_91242 ?auto_91243 ?auto_91244 )
      ( MAKE-2PILE ?auto_91240 ?auto_91241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91248 - BLOCK
      ?auto_91249 - BLOCK
    )
    :vars
    (
      ?auto_91255 - BLOCK
      ?auto_91250 - BLOCK
      ?auto_91254 - BLOCK
      ?auto_91253 - BLOCK
      ?auto_91251 - BLOCK
      ?auto_91252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91248 ?auto_91249 ) ) ( not ( = ?auto_91248 ?auto_91255 ) ) ( not ( = ?auto_91249 ?auto_91255 ) ) ( ON-TABLE ?auto_91250 ) ( ON ?auto_91254 ?auto_91250 ) ( ON ?auto_91253 ?auto_91254 ) ( not ( = ?auto_91250 ?auto_91254 ) ) ( not ( = ?auto_91250 ?auto_91253 ) ) ( not ( = ?auto_91250 ?auto_91251 ) ) ( not ( = ?auto_91250 ?auto_91255 ) ) ( not ( = ?auto_91250 ?auto_91249 ) ) ( not ( = ?auto_91250 ?auto_91248 ) ) ( not ( = ?auto_91254 ?auto_91253 ) ) ( not ( = ?auto_91254 ?auto_91251 ) ) ( not ( = ?auto_91254 ?auto_91255 ) ) ( not ( = ?auto_91254 ?auto_91249 ) ) ( not ( = ?auto_91254 ?auto_91248 ) ) ( not ( = ?auto_91253 ?auto_91251 ) ) ( not ( = ?auto_91253 ?auto_91255 ) ) ( not ( = ?auto_91253 ?auto_91249 ) ) ( not ( = ?auto_91253 ?auto_91248 ) ) ( not ( = ?auto_91251 ?auto_91255 ) ) ( not ( = ?auto_91251 ?auto_91249 ) ) ( not ( = ?auto_91251 ?auto_91248 ) ) ( ON ?auto_91248 ?auto_91252 ) ( not ( = ?auto_91248 ?auto_91252 ) ) ( not ( = ?auto_91249 ?auto_91252 ) ) ( not ( = ?auto_91255 ?auto_91252 ) ) ( not ( = ?auto_91250 ?auto_91252 ) ) ( not ( = ?auto_91254 ?auto_91252 ) ) ( not ( = ?auto_91253 ?auto_91252 ) ) ( not ( = ?auto_91251 ?auto_91252 ) ) ( ON ?auto_91249 ?auto_91248 ) ( ON-TABLE ?auto_91252 ) ( ON ?auto_91255 ?auto_91249 ) ( CLEAR ?auto_91253 ) ( ON ?auto_91251 ?auto_91255 ) ( CLEAR ?auto_91251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91252 ?auto_91248 ?auto_91249 ?auto_91255 )
      ( MAKE-2PILE ?auto_91248 ?auto_91249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91256 - BLOCK
      ?auto_91257 - BLOCK
    )
    :vars
    (
      ?auto_91261 - BLOCK
      ?auto_91258 - BLOCK
      ?auto_91263 - BLOCK
      ?auto_91260 - BLOCK
      ?auto_91259 - BLOCK
      ?auto_91262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91256 ?auto_91257 ) ) ( not ( = ?auto_91256 ?auto_91261 ) ) ( not ( = ?auto_91257 ?auto_91261 ) ) ( ON-TABLE ?auto_91258 ) ( ON ?auto_91263 ?auto_91258 ) ( not ( = ?auto_91258 ?auto_91263 ) ) ( not ( = ?auto_91258 ?auto_91260 ) ) ( not ( = ?auto_91258 ?auto_91259 ) ) ( not ( = ?auto_91258 ?auto_91261 ) ) ( not ( = ?auto_91258 ?auto_91257 ) ) ( not ( = ?auto_91258 ?auto_91256 ) ) ( not ( = ?auto_91263 ?auto_91260 ) ) ( not ( = ?auto_91263 ?auto_91259 ) ) ( not ( = ?auto_91263 ?auto_91261 ) ) ( not ( = ?auto_91263 ?auto_91257 ) ) ( not ( = ?auto_91263 ?auto_91256 ) ) ( not ( = ?auto_91260 ?auto_91259 ) ) ( not ( = ?auto_91260 ?auto_91261 ) ) ( not ( = ?auto_91260 ?auto_91257 ) ) ( not ( = ?auto_91260 ?auto_91256 ) ) ( not ( = ?auto_91259 ?auto_91261 ) ) ( not ( = ?auto_91259 ?auto_91257 ) ) ( not ( = ?auto_91259 ?auto_91256 ) ) ( ON ?auto_91256 ?auto_91262 ) ( not ( = ?auto_91256 ?auto_91262 ) ) ( not ( = ?auto_91257 ?auto_91262 ) ) ( not ( = ?auto_91261 ?auto_91262 ) ) ( not ( = ?auto_91258 ?auto_91262 ) ) ( not ( = ?auto_91263 ?auto_91262 ) ) ( not ( = ?auto_91260 ?auto_91262 ) ) ( not ( = ?auto_91259 ?auto_91262 ) ) ( ON ?auto_91257 ?auto_91256 ) ( ON-TABLE ?auto_91262 ) ( ON ?auto_91261 ?auto_91257 ) ( ON ?auto_91259 ?auto_91261 ) ( CLEAR ?auto_91259 ) ( HOLDING ?auto_91260 ) ( CLEAR ?auto_91263 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91258 ?auto_91263 ?auto_91260 )
      ( MAKE-2PILE ?auto_91256 ?auto_91257 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91264 - BLOCK
      ?auto_91265 - BLOCK
    )
    :vars
    (
      ?auto_91269 - BLOCK
      ?auto_91270 - BLOCK
      ?auto_91267 - BLOCK
      ?auto_91271 - BLOCK
      ?auto_91268 - BLOCK
      ?auto_91266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91264 ?auto_91265 ) ) ( not ( = ?auto_91264 ?auto_91269 ) ) ( not ( = ?auto_91265 ?auto_91269 ) ) ( ON-TABLE ?auto_91270 ) ( ON ?auto_91267 ?auto_91270 ) ( not ( = ?auto_91270 ?auto_91267 ) ) ( not ( = ?auto_91270 ?auto_91271 ) ) ( not ( = ?auto_91270 ?auto_91268 ) ) ( not ( = ?auto_91270 ?auto_91269 ) ) ( not ( = ?auto_91270 ?auto_91265 ) ) ( not ( = ?auto_91270 ?auto_91264 ) ) ( not ( = ?auto_91267 ?auto_91271 ) ) ( not ( = ?auto_91267 ?auto_91268 ) ) ( not ( = ?auto_91267 ?auto_91269 ) ) ( not ( = ?auto_91267 ?auto_91265 ) ) ( not ( = ?auto_91267 ?auto_91264 ) ) ( not ( = ?auto_91271 ?auto_91268 ) ) ( not ( = ?auto_91271 ?auto_91269 ) ) ( not ( = ?auto_91271 ?auto_91265 ) ) ( not ( = ?auto_91271 ?auto_91264 ) ) ( not ( = ?auto_91268 ?auto_91269 ) ) ( not ( = ?auto_91268 ?auto_91265 ) ) ( not ( = ?auto_91268 ?auto_91264 ) ) ( ON ?auto_91264 ?auto_91266 ) ( not ( = ?auto_91264 ?auto_91266 ) ) ( not ( = ?auto_91265 ?auto_91266 ) ) ( not ( = ?auto_91269 ?auto_91266 ) ) ( not ( = ?auto_91270 ?auto_91266 ) ) ( not ( = ?auto_91267 ?auto_91266 ) ) ( not ( = ?auto_91271 ?auto_91266 ) ) ( not ( = ?auto_91268 ?auto_91266 ) ) ( ON ?auto_91265 ?auto_91264 ) ( ON-TABLE ?auto_91266 ) ( ON ?auto_91269 ?auto_91265 ) ( ON ?auto_91268 ?auto_91269 ) ( CLEAR ?auto_91267 ) ( ON ?auto_91271 ?auto_91268 ) ( CLEAR ?auto_91271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91266 ?auto_91264 ?auto_91265 ?auto_91269 ?auto_91268 )
      ( MAKE-2PILE ?auto_91264 ?auto_91265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91272 - BLOCK
      ?auto_91273 - BLOCK
    )
    :vars
    (
      ?auto_91277 - BLOCK
      ?auto_91276 - BLOCK
      ?auto_91278 - BLOCK
      ?auto_91274 - BLOCK
      ?auto_91279 - BLOCK
      ?auto_91275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91272 ?auto_91273 ) ) ( not ( = ?auto_91272 ?auto_91277 ) ) ( not ( = ?auto_91273 ?auto_91277 ) ) ( ON-TABLE ?auto_91276 ) ( not ( = ?auto_91276 ?auto_91278 ) ) ( not ( = ?auto_91276 ?auto_91274 ) ) ( not ( = ?auto_91276 ?auto_91279 ) ) ( not ( = ?auto_91276 ?auto_91277 ) ) ( not ( = ?auto_91276 ?auto_91273 ) ) ( not ( = ?auto_91276 ?auto_91272 ) ) ( not ( = ?auto_91278 ?auto_91274 ) ) ( not ( = ?auto_91278 ?auto_91279 ) ) ( not ( = ?auto_91278 ?auto_91277 ) ) ( not ( = ?auto_91278 ?auto_91273 ) ) ( not ( = ?auto_91278 ?auto_91272 ) ) ( not ( = ?auto_91274 ?auto_91279 ) ) ( not ( = ?auto_91274 ?auto_91277 ) ) ( not ( = ?auto_91274 ?auto_91273 ) ) ( not ( = ?auto_91274 ?auto_91272 ) ) ( not ( = ?auto_91279 ?auto_91277 ) ) ( not ( = ?auto_91279 ?auto_91273 ) ) ( not ( = ?auto_91279 ?auto_91272 ) ) ( ON ?auto_91272 ?auto_91275 ) ( not ( = ?auto_91272 ?auto_91275 ) ) ( not ( = ?auto_91273 ?auto_91275 ) ) ( not ( = ?auto_91277 ?auto_91275 ) ) ( not ( = ?auto_91276 ?auto_91275 ) ) ( not ( = ?auto_91278 ?auto_91275 ) ) ( not ( = ?auto_91274 ?auto_91275 ) ) ( not ( = ?auto_91279 ?auto_91275 ) ) ( ON ?auto_91273 ?auto_91272 ) ( ON-TABLE ?auto_91275 ) ( ON ?auto_91277 ?auto_91273 ) ( ON ?auto_91279 ?auto_91277 ) ( ON ?auto_91274 ?auto_91279 ) ( CLEAR ?auto_91274 ) ( HOLDING ?auto_91278 ) ( CLEAR ?auto_91276 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91276 ?auto_91278 )
      ( MAKE-2PILE ?auto_91272 ?auto_91273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91280 - BLOCK
      ?auto_91281 - BLOCK
    )
    :vars
    (
      ?auto_91282 - BLOCK
      ?auto_91283 - BLOCK
      ?auto_91284 - BLOCK
      ?auto_91287 - BLOCK
      ?auto_91285 - BLOCK
      ?auto_91286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91280 ?auto_91281 ) ) ( not ( = ?auto_91280 ?auto_91282 ) ) ( not ( = ?auto_91281 ?auto_91282 ) ) ( ON-TABLE ?auto_91283 ) ( not ( = ?auto_91283 ?auto_91284 ) ) ( not ( = ?auto_91283 ?auto_91287 ) ) ( not ( = ?auto_91283 ?auto_91285 ) ) ( not ( = ?auto_91283 ?auto_91282 ) ) ( not ( = ?auto_91283 ?auto_91281 ) ) ( not ( = ?auto_91283 ?auto_91280 ) ) ( not ( = ?auto_91284 ?auto_91287 ) ) ( not ( = ?auto_91284 ?auto_91285 ) ) ( not ( = ?auto_91284 ?auto_91282 ) ) ( not ( = ?auto_91284 ?auto_91281 ) ) ( not ( = ?auto_91284 ?auto_91280 ) ) ( not ( = ?auto_91287 ?auto_91285 ) ) ( not ( = ?auto_91287 ?auto_91282 ) ) ( not ( = ?auto_91287 ?auto_91281 ) ) ( not ( = ?auto_91287 ?auto_91280 ) ) ( not ( = ?auto_91285 ?auto_91282 ) ) ( not ( = ?auto_91285 ?auto_91281 ) ) ( not ( = ?auto_91285 ?auto_91280 ) ) ( ON ?auto_91280 ?auto_91286 ) ( not ( = ?auto_91280 ?auto_91286 ) ) ( not ( = ?auto_91281 ?auto_91286 ) ) ( not ( = ?auto_91282 ?auto_91286 ) ) ( not ( = ?auto_91283 ?auto_91286 ) ) ( not ( = ?auto_91284 ?auto_91286 ) ) ( not ( = ?auto_91287 ?auto_91286 ) ) ( not ( = ?auto_91285 ?auto_91286 ) ) ( ON ?auto_91281 ?auto_91280 ) ( ON-TABLE ?auto_91286 ) ( ON ?auto_91282 ?auto_91281 ) ( ON ?auto_91285 ?auto_91282 ) ( ON ?auto_91287 ?auto_91285 ) ( CLEAR ?auto_91283 ) ( ON ?auto_91284 ?auto_91287 ) ( CLEAR ?auto_91284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91286 ?auto_91280 ?auto_91281 ?auto_91282 ?auto_91285 ?auto_91287 )
      ( MAKE-2PILE ?auto_91280 ?auto_91281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91288 - BLOCK
      ?auto_91289 - BLOCK
    )
    :vars
    (
      ?auto_91294 - BLOCK
      ?auto_91291 - BLOCK
      ?auto_91293 - BLOCK
      ?auto_91295 - BLOCK
      ?auto_91290 - BLOCK
      ?auto_91292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91288 ?auto_91289 ) ) ( not ( = ?auto_91288 ?auto_91294 ) ) ( not ( = ?auto_91289 ?auto_91294 ) ) ( not ( = ?auto_91291 ?auto_91293 ) ) ( not ( = ?auto_91291 ?auto_91295 ) ) ( not ( = ?auto_91291 ?auto_91290 ) ) ( not ( = ?auto_91291 ?auto_91294 ) ) ( not ( = ?auto_91291 ?auto_91289 ) ) ( not ( = ?auto_91291 ?auto_91288 ) ) ( not ( = ?auto_91293 ?auto_91295 ) ) ( not ( = ?auto_91293 ?auto_91290 ) ) ( not ( = ?auto_91293 ?auto_91294 ) ) ( not ( = ?auto_91293 ?auto_91289 ) ) ( not ( = ?auto_91293 ?auto_91288 ) ) ( not ( = ?auto_91295 ?auto_91290 ) ) ( not ( = ?auto_91295 ?auto_91294 ) ) ( not ( = ?auto_91295 ?auto_91289 ) ) ( not ( = ?auto_91295 ?auto_91288 ) ) ( not ( = ?auto_91290 ?auto_91294 ) ) ( not ( = ?auto_91290 ?auto_91289 ) ) ( not ( = ?auto_91290 ?auto_91288 ) ) ( ON ?auto_91288 ?auto_91292 ) ( not ( = ?auto_91288 ?auto_91292 ) ) ( not ( = ?auto_91289 ?auto_91292 ) ) ( not ( = ?auto_91294 ?auto_91292 ) ) ( not ( = ?auto_91291 ?auto_91292 ) ) ( not ( = ?auto_91293 ?auto_91292 ) ) ( not ( = ?auto_91295 ?auto_91292 ) ) ( not ( = ?auto_91290 ?auto_91292 ) ) ( ON ?auto_91289 ?auto_91288 ) ( ON-TABLE ?auto_91292 ) ( ON ?auto_91294 ?auto_91289 ) ( ON ?auto_91290 ?auto_91294 ) ( ON ?auto_91295 ?auto_91290 ) ( ON ?auto_91293 ?auto_91295 ) ( CLEAR ?auto_91293 ) ( HOLDING ?auto_91291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91291 )
      ( MAKE-2PILE ?auto_91288 ?auto_91289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91296 - BLOCK
      ?auto_91297 - BLOCK
    )
    :vars
    (
      ?auto_91299 - BLOCK
      ?auto_91303 - BLOCK
      ?auto_91302 - BLOCK
      ?auto_91300 - BLOCK
      ?auto_91298 - BLOCK
      ?auto_91301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91296 ?auto_91297 ) ) ( not ( = ?auto_91296 ?auto_91299 ) ) ( not ( = ?auto_91297 ?auto_91299 ) ) ( not ( = ?auto_91303 ?auto_91302 ) ) ( not ( = ?auto_91303 ?auto_91300 ) ) ( not ( = ?auto_91303 ?auto_91298 ) ) ( not ( = ?auto_91303 ?auto_91299 ) ) ( not ( = ?auto_91303 ?auto_91297 ) ) ( not ( = ?auto_91303 ?auto_91296 ) ) ( not ( = ?auto_91302 ?auto_91300 ) ) ( not ( = ?auto_91302 ?auto_91298 ) ) ( not ( = ?auto_91302 ?auto_91299 ) ) ( not ( = ?auto_91302 ?auto_91297 ) ) ( not ( = ?auto_91302 ?auto_91296 ) ) ( not ( = ?auto_91300 ?auto_91298 ) ) ( not ( = ?auto_91300 ?auto_91299 ) ) ( not ( = ?auto_91300 ?auto_91297 ) ) ( not ( = ?auto_91300 ?auto_91296 ) ) ( not ( = ?auto_91298 ?auto_91299 ) ) ( not ( = ?auto_91298 ?auto_91297 ) ) ( not ( = ?auto_91298 ?auto_91296 ) ) ( ON ?auto_91296 ?auto_91301 ) ( not ( = ?auto_91296 ?auto_91301 ) ) ( not ( = ?auto_91297 ?auto_91301 ) ) ( not ( = ?auto_91299 ?auto_91301 ) ) ( not ( = ?auto_91303 ?auto_91301 ) ) ( not ( = ?auto_91302 ?auto_91301 ) ) ( not ( = ?auto_91300 ?auto_91301 ) ) ( not ( = ?auto_91298 ?auto_91301 ) ) ( ON ?auto_91297 ?auto_91296 ) ( ON-TABLE ?auto_91301 ) ( ON ?auto_91299 ?auto_91297 ) ( ON ?auto_91298 ?auto_91299 ) ( ON ?auto_91300 ?auto_91298 ) ( ON ?auto_91302 ?auto_91300 ) ( ON ?auto_91303 ?auto_91302 ) ( CLEAR ?auto_91303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91301 ?auto_91296 ?auto_91297 ?auto_91299 ?auto_91298 ?auto_91300 ?auto_91302 )
      ( MAKE-2PILE ?auto_91296 ?auto_91297 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91308 - BLOCK
      ?auto_91309 - BLOCK
      ?auto_91310 - BLOCK
      ?auto_91311 - BLOCK
    )
    :vars
    (
      ?auto_91312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91312 ?auto_91311 ) ( CLEAR ?auto_91312 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91308 ) ( ON ?auto_91309 ?auto_91308 ) ( ON ?auto_91310 ?auto_91309 ) ( ON ?auto_91311 ?auto_91310 ) ( not ( = ?auto_91308 ?auto_91309 ) ) ( not ( = ?auto_91308 ?auto_91310 ) ) ( not ( = ?auto_91308 ?auto_91311 ) ) ( not ( = ?auto_91308 ?auto_91312 ) ) ( not ( = ?auto_91309 ?auto_91310 ) ) ( not ( = ?auto_91309 ?auto_91311 ) ) ( not ( = ?auto_91309 ?auto_91312 ) ) ( not ( = ?auto_91310 ?auto_91311 ) ) ( not ( = ?auto_91310 ?auto_91312 ) ) ( not ( = ?auto_91311 ?auto_91312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91312 ?auto_91311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91313 - BLOCK
      ?auto_91314 - BLOCK
      ?auto_91315 - BLOCK
      ?auto_91316 - BLOCK
    )
    :vars
    (
      ?auto_91317 - BLOCK
      ?auto_91318 - BLOCK
      ?auto_91319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91317 ?auto_91316 ) ( CLEAR ?auto_91317 ) ( ON-TABLE ?auto_91313 ) ( ON ?auto_91314 ?auto_91313 ) ( ON ?auto_91315 ?auto_91314 ) ( ON ?auto_91316 ?auto_91315 ) ( not ( = ?auto_91313 ?auto_91314 ) ) ( not ( = ?auto_91313 ?auto_91315 ) ) ( not ( = ?auto_91313 ?auto_91316 ) ) ( not ( = ?auto_91313 ?auto_91317 ) ) ( not ( = ?auto_91314 ?auto_91315 ) ) ( not ( = ?auto_91314 ?auto_91316 ) ) ( not ( = ?auto_91314 ?auto_91317 ) ) ( not ( = ?auto_91315 ?auto_91316 ) ) ( not ( = ?auto_91315 ?auto_91317 ) ) ( not ( = ?auto_91316 ?auto_91317 ) ) ( HOLDING ?auto_91318 ) ( CLEAR ?auto_91319 ) ( not ( = ?auto_91313 ?auto_91318 ) ) ( not ( = ?auto_91313 ?auto_91319 ) ) ( not ( = ?auto_91314 ?auto_91318 ) ) ( not ( = ?auto_91314 ?auto_91319 ) ) ( not ( = ?auto_91315 ?auto_91318 ) ) ( not ( = ?auto_91315 ?auto_91319 ) ) ( not ( = ?auto_91316 ?auto_91318 ) ) ( not ( = ?auto_91316 ?auto_91319 ) ) ( not ( = ?auto_91317 ?auto_91318 ) ) ( not ( = ?auto_91317 ?auto_91319 ) ) ( not ( = ?auto_91318 ?auto_91319 ) ) )
    :subtasks
    ( ( !STACK ?auto_91318 ?auto_91319 )
      ( MAKE-4PILE ?auto_91313 ?auto_91314 ?auto_91315 ?auto_91316 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91320 - BLOCK
      ?auto_91321 - BLOCK
      ?auto_91322 - BLOCK
      ?auto_91323 - BLOCK
    )
    :vars
    (
      ?auto_91324 - BLOCK
      ?auto_91325 - BLOCK
      ?auto_91326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91324 ?auto_91323 ) ( ON-TABLE ?auto_91320 ) ( ON ?auto_91321 ?auto_91320 ) ( ON ?auto_91322 ?auto_91321 ) ( ON ?auto_91323 ?auto_91322 ) ( not ( = ?auto_91320 ?auto_91321 ) ) ( not ( = ?auto_91320 ?auto_91322 ) ) ( not ( = ?auto_91320 ?auto_91323 ) ) ( not ( = ?auto_91320 ?auto_91324 ) ) ( not ( = ?auto_91321 ?auto_91322 ) ) ( not ( = ?auto_91321 ?auto_91323 ) ) ( not ( = ?auto_91321 ?auto_91324 ) ) ( not ( = ?auto_91322 ?auto_91323 ) ) ( not ( = ?auto_91322 ?auto_91324 ) ) ( not ( = ?auto_91323 ?auto_91324 ) ) ( CLEAR ?auto_91325 ) ( not ( = ?auto_91320 ?auto_91326 ) ) ( not ( = ?auto_91320 ?auto_91325 ) ) ( not ( = ?auto_91321 ?auto_91326 ) ) ( not ( = ?auto_91321 ?auto_91325 ) ) ( not ( = ?auto_91322 ?auto_91326 ) ) ( not ( = ?auto_91322 ?auto_91325 ) ) ( not ( = ?auto_91323 ?auto_91326 ) ) ( not ( = ?auto_91323 ?auto_91325 ) ) ( not ( = ?auto_91324 ?auto_91326 ) ) ( not ( = ?auto_91324 ?auto_91325 ) ) ( not ( = ?auto_91326 ?auto_91325 ) ) ( ON ?auto_91326 ?auto_91324 ) ( CLEAR ?auto_91326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91320 ?auto_91321 ?auto_91322 ?auto_91323 ?auto_91324 )
      ( MAKE-4PILE ?auto_91320 ?auto_91321 ?auto_91322 ?auto_91323 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91327 - BLOCK
      ?auto_91328 - BLOCK
      ?auto_91329 - BLOCK
      ?auto_91330 - BLOCK
    )
    :vars
    (
      ?auto_91331 - BLOCK
      ?auto_91332 - BLOCK
      ?auto_91333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91331 ?auto_91330 ) ( ON-TABLE ?auto_91327 ) ( ON ?auto_91328 ?auto_91327 ) ( ON ?auto_91329 ?auto_91328 ) ( ON ?auto_91330 ?auto_91329 ) ( not ( = ?auto_91327 ?auto_91328 ) ) ( not ( = ?auto_91327 ?auto_91329 ) ) ( not ( = ?auto_91327 ?auto_91330 ) ) ( not ( = ?auto_91327 ?auto_91331 ) ) ( not ( = ?auto_91328 ?auto_91329 ) ) ( not ( = ?auto_91328 ?auto_91330 ) ) ( not ( = ?auto_91328 ?auto_91331 ) ) ( not ( = ?auto_91329 ?auto_91330 ) ) ( not ( = ?auto_91329 ?auto_91331 ) ) ( not ( = ?auto_91330 ?auto_91331 ) ) ( not ( = ?auto_91327 ?auto_91332 ) ) ( not ( = ?auto_91327 ?auto_91333 ) ) ( not ( = ?auto_91328 ?auto_91332 ) ) ( not ( = ?auto_91328 ?auto_91333 ) ) ( not ( = ?auto_91329 ?auto_91332 ) ) ( not ( = ?auto_91329 ?auto_91333 ) ) ( not ( = ?auto_91330 ?auto_91332 ) ) ( not ( = ?auto_91330 ?auto_91333 ) ) ( not ( = ?auto_91331 ?auto_91332 ) ) ( not ( = ?auto_91331 ?auto_91333 ) ) ( not ( = ?auto_91332 ?auto_91333 ) ) ( ON ?auto_91332 ?auto_91331 ) ( CLEAR ?auto_91332 ) ( HOLDING ?auto_91333 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91333 )
      ( MAKE-4PILE ?auto_91327 ?auto_91328 ?auto_91329 ?auto_91330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91334 - BLOCK
      ?auto_91335 - BLOCK
      ?auto_91336 - BLOCK
      ?auto_91337 - BLOCK
    )
    :vars
    (
      ?auto_91340 - BLOCK
      ?auto_91338 - BLOCK
      ?auto_91339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91340 ?auto_91337 ) ( ON-TABLE ?auto_91334 ) ( ON ?auto_91335 ?auto_91334 ) ( ON ?auto_91336 ?auto_91335 ) ( ON ?auto_91337 ?auto_91336 ) ( not ( = ?auto_91334 ?auto_91335 ) ) ( not ( = ?auto_91334 ?auto_91336 ) ) ( not ( = ?auto_91334 ?auto_91337 ) ) ( not ( = ?auto_91334 ?auto_91340 ) ) ( not ( = ?auto_91335 ?auto_91336 ) ) ( not ( = ?auto_91335 ?auto_91337 ) ) ( not ( = ?auto_91335 ?auto_91340 ) ) ( not ( = ?auto_91336 ?auto_91337 ) ) ( not ( = ?auto_91336 ?auto_91340 ) ) ( not ( = ?auto_91337 ?auto_91340 ) ) ( not ( = ?auto_91334 ?auto_91338 ) ) ( not ( = ?auto_91334 ?auto_91339 ) ) ( not ( = ?auto_91335 ?auto_91338 ) ) ( not ( = ?auto_91335 ?auto_91339 ) ) ( not ( = ?auto_91336 ?auto_91338 ) ) ( not ( = ?auto_91336 ?auto_91339 ) ) ( not ( = ?auto_91337 ?auto_91338 ) ) ( not ( = ?auto_91337 ?auto_91339 ) ) ( not ( = ?auto_91340 ?auto_91338 ) ) ( not ( = ?auto_91340 ?auto_91339 ) ) ( not ( = ?auto_91338 ?auto_91339 ) ) ( ON ?auto_91338 ?auto_91340 ) ( ON ?auto_91339 ?auto_91338 ) ( CLEAR ?auto_91339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91334 ?auto_91335 ?auto_91336 ?auto_91337 ?auto_91340 ?auto_91338 )
      ( MAKE-4PILE ?auto_91334 ?auto_91335 ?auto_91336 ?auto_91337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91341 - BLOCK
      ?auto_91342 - BLOCK
      ?auto_91343 - BLOCK
      ?auto_91344 - BLOCK
    )
    :vars
    (
      ?auto_91345 - BLOCK
      ?auto_91347 - BLOCK
      ?auto_91346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91345 ?auto_91344 ) ( ON-TABLE ?auto_91341 ) ( ON ?auto_91342 ?auto_91341 ) ( ON ?auto_91343 ?auto_91342 ) ( ON ?auto_91344 ?auto_91343 ) ( not ( = ?auto_91341 ?auto_91342 ) ) ( not ( = ?auto_91341 ?auto_91343 ) ) ( not ( = ?auto_91341 ?auto_91344 ) ) ( not ( = ?auto_91341 ?auto_91345 ) ) ( not ( = ?auto_91342 ?auto_91343 ) ) ( not ( = ?auto_91342 ?auto_91344 ) ) ( not ( = ?auto_91342 ?auto_91345 ) ) ( not ( = ?auto_91343 ?auto_91344 ) ) ( not ( = ?auto_91343 ?auto_91345 ) ) ( not ( = ?auto_91344 ?auto_91345 ) ) ( not ( = ?auto_91341 ?auto_91347 ) ) ( not ( = ?auto_91341 ?auto_91346 ) ) ( not ( = ?auto_91342 ?auto_91347 ) ) ( not ( = ?auto_91342 ?auto_91346 ) ) ( not ( = ?auto_91343 ?auto_91347 ) ) ( not ( = ?auto_91343 ?auto_91346 ) ) ( not ( = ?auto_91344 ?auto_91347 ) ) ( not ( = ?auto_91344 ?auto_91346 ) ) ( not ( = ?auto_91345 ?auto_91347 ) ) ( not ( = ?auto_91345 ?auto_91346 ) ) ( not ( = ?auto_91347 ?auto_91346 ) ) ( ON ?auto_91347 ?auto_91345 ) ( HOLDING ?auto_91346 ) ( CLEAR ?auto_91347 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91341 ?auto_91342 ?auto_91343 ?auto_91344 ?auto_91345 ?auto_91347 ?auto_91346 )
      ( MAKE-4PILE ?auto_91341 ?auto_91342 ?auto_91343 ?auto_91344 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91348 - BLOCK
      ?auto_91349 - BLOCK
      ?auto_91350 - BLOCK
      ?auto_91351 - BLOCK
    )
    :vars
    (
      ?auto_91352 - BLOCK
      ?auto_91353 - BLOCK
      ?auto_91354 - BLOCK
      ?auto_91355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91352 ?auto_91351 ) ( ON-TABLE ?auto_91348 ) ( ON ?auto_91349 ?auto_91348 ) ( ON ?auto_91350 ?auto_91349 ) ( ON ?auto_91351 ?auto_91350 ) ( not ( = ?auto_91348 ?auto_91349 ) ) ( not ( = ?auto_91348 ?auto_91350 ) ) ( not ( = ?auto_91348 ?auto_91351 ) ) ( not ( = ?auto_91348 ?auto_91352 ) ) ( not ( = ?auto_91349 ?auto_91350 ) ) ( not ( = ?auto_91349 ?auto_91351 ) ) ( not ( = ?auto_91349 ?auto_91352 ) ) ( not ( = ?auto_91350 ?auto_91351 ) ) ( not ( = ?auto_91350 ?auto_91352 ) ) ( not ( = ?auto_91351 ?auto_91352 ) ) ( not ( = ?auto_91348 ?auto_91353 ) ) ( not ( = ?auto_91348 ?auto_91354 ) ) ( not ( = ?auto_91349 ?auto_91353 ) ) ( not ( = ?auto_91349 ?auto_91354 ) ) ( not ( = ?auto_91350 ?auto_91353 ) ) ( not ( = ?auto_91350 ?auto_91354 ) ) ( not ( = ?auto_91351 ?auto_91353 ) ) ( not ( = ?auto_91351 ?auto_91354 ) ) ( not ( = ?auto_91352 ?auto_91353 ) ) ( not ( = ?auto_91352 ?auto_91354 ) ) ( not ( = ?auto_91353 ?auto_91354 ) ) ( ON ?auto_91353 ?auto_91352 ) ( CLEAR ?auto_91353 ) ( ON ?auto_91354 ?auto_91355 ) ( CLEAR ?auto_91354 ) ( HAND-EMPTY ) ( not ( = ?auto_91348 ?auto_91355 ) ) ( not ( = ?auto_91349 ?auto_91355 ) ) ( not ( = ?auto_91350 ?auto_91355 ) ) ( not ( = ?auto_91351 ?auto_91355 ) ) ( not ( = ?auto_91352 ?auto_91355 ) ) ( not ( = ?auto_91353 ?auto_91355 ) ) ( not ( = ?auto_91354 ?auto_91355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91354 ?auto_91355 )
      ( MAKE-4PILE ?auto_91348 ?auto_91349 ?auto_91350 ?auto_91351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91356 - BLOCK
      ?auto_91357 - BLOCK
      ?auto_91358 - BLOCK
      ?auto_91359 - BLOCK
    )
    :vars
    (
      ?auto_91362 - BLOCK
      ?auto_91361 - BLOCK
      ?auto_91360 - BLOCK
      ?auto_91363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91362 ?auto_91359 ) ( ON-TABLE ?auto_91356 ) ( ON ?auto_91357 ?auto_91356 ) ( ON ?auto_91358 ?auto_91357 ) ( ON ?auto_91359 ?auto_91358 ) ( not ( = ?auto_91356 ?auto_91357 ) ) ( not ( = ?auto_91356 ?auto_91358 ) ) ( not ( = ?auto_91356 ?auto_91359 ) ) ( not ( = ?auto_91356 ?auto_91362 ) ) ( not ( = ?auto_91357 ?auto_91358 ) ) ( not ( = ?auto_91357 ?auto_91359 ) ) ( not ( = ?auto_91357 ?auto_91362 ) ) ( not ( = ?auto_91358 ?auto_91359 ) ) ( not ( = ?auto_91358 ?auto_91362 ) ) ( not ( = ?auto_91359 ?auto_91362 ) ) ( not ( = ?auto_91356 ?auto_91361 ) ) ( not ( = ?auto_91356 ?auto_91360 ) ) ( not ( = ?auto_91357 ?auto_91361 ) ) ( not ( = ?auto_91357 ?auto_91360 ) ) ( not ( = ?auto_91358 ?auto_91361 ) ) ( not ( = ?auto_91358 ?auto_91360 ) ) ( not ( = ?auto_91359 ?auto_91361 ) ) ( not ( = ?auto_91359 ?auto_91360 ) ) ( not ( = ?auto_91362 ?auto_91361 ) ) ( not ( = ?auto_91362 ?auto_91360 ) ) ( not ( = ?auto_91361 ?auto_91360 ) ) ( ON ?auto_91360 ?auto_91363 ) ( CLEAR ?auto_91360 ) ( not ( = ?auto_91356 ?auto_91363 ) ) ( not ( = ?auto_91357 ?auto_91363 ) ) ( not ( = ?auto_91358 ?auto_91363 ) ) ( not ( = ?auto_91359 ?auto_91363 ) ) ( not ( = ?auto_91362 ?auto_91363 ) ) ( not ( = ?auto_91361 ?auto_91363 ) ) ( not ( = ?auto_91360 ?auto_91363 ) ) ( HOLDING ?auto_91361 ) ( CLEAR ?auto_91362 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91356 ?auto_91357 ?auto_91358 ?auto_91359 ?auto_91362 ?auto_91361 )
      ( MAKE-4PILE ?auto_91356 ?auto_91357 ?auto_91358 ?auto_91359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91364 - BLOCK
      ?auto_91365 - BLOCK
      ?auto_91366 - BLOCK
      ?auto_91367 - BLOCK
    )
    :vars
    (
      ?auto_91370 - BLOCK
      ?auto_91371 - BLOCK
      ?auto_91369 - BLOCK
      ?auto_91368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91370 ?auto_91367 ) ( ON-TABLE ?auto_91364 ) ( ON ?auto_91365 ?auto_91364 ) ( ON ?auto_91366 ?auto_91365 ) ( ON ?auto_91367 ?auto_91366 ) ( not ( = ?auto_91364 ?auto_91365 ) ) ( not ( = ?auto_91364 ?auto_91366 ) ) ( not ( = ?auto_91364 ?auto_91367 ) ) ( not ( = ?auto_91364 ?auto_91370 ) ) ( not ( = ?auto_91365 ?auto_91366 ) ) ( not ( = ?auto_91365 ?auto_91367 ) ) ( not ( = ?auto_91365 ?auto_91370 ) ) ( not ( = ?auto_91366 ?auto_91367 ) ) ( not ( = ?auto_91366 ?auto_91370 ) ) ( not ( = ?auto_91367 ?auto_91370 ) ) ( not ( = ?auto_91364 ?auto_91371 ) ) ( not ( = ?auto_91364 ?auto_91369 ) ) ( not ( = ?auto_91365 ?auto_91371 ) ) ( not ( = ?auto_91365 ?auto_91369 ) ) ( not ( = ?auto_91366 ?auto_91371 ) ) ( not ( = ?auto_91366 ?auto_91369 ) ) ( not ( = ?auto_91367 ?auto_91371 ) ) ( not ( = ?auto_91367 ?auto_91369 ) ) ( not ( = ?auto_91370 ?auto_91371 ) ) ( not ( = ?auto_91370 ?auto_91369 ) ) ( not ( = ?auto_91371 ?auto_91369 ) ) ( ON ?auto_91369 ?auto_91368 ) ( not ( = ?auto_91364 ?auto_91368 ) ) ( not ( = ?auto_91365 ?auto_91368 ) ) ( not ( = ?auto_91366 ?auto_91368 ) ) ( not ( = ?auto_91367 ?auto_91368 ) ) ( not ( = ?auto_91370 ?auto_91368 ) ) ( not ( = ?auto_91371 ?auto_91368 ) ) ( not ( = ?auto_91369 ?auto_91368 ) ) ( CLEAR ?auto_91370 ) ( ON ?auto_91371 ?auto_91369 ) ( CLEAR ?auto_91371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91368 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91368 ?auto_91369 )
      ( MAKE-4PILE ?auto_91364 ?auto_91365 ?auto_91366 ?auto_91367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91388 - BLOCK
      ?auto_91389 - BLOCK
      ?auto_91390 - BLOCK
      ?auto_91391 - BLOCK
    )
    :vars
    (
      ?auto_91395 - BLOCK
      ?auto_91392 - BLOCK
      ?auto_91393 - BLOCK
      ?auto_91394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91388 ) ( ON ?auto_91389 ?auto_91388 ) ( ON ?auto_91390 ?auto_91389 ) ( not ( = ?auto_91388 ?auto_91389 ) ) ( not ( = ?auto_91388 ?auto_91390 ) ) ( not ( = ?auto_91388 ?auto_91391 ) ) ( not ( = ?auto_91388 ?auto_91395 ) ) ( not ( = ?auto_91389 ?auto_91390 ) ) ( not ( = ?auto_91389 ?auto_91391 ) ) ( not ( = ?auto_91389 ?auto_91395 ) ) ( not ( = ?auto_91390 ?auto_91391 ) ) ( not ( = ?auto_91390 ?auto_91395 ) ) ( not ( = ?auto_91391 ?auto_91395 ) ) ( not ( = ?auto_91388 ?auto_91392 ) ) ( not ( = ?auto_91388 ?auto_91393 ) ) ( not ( = ?auto_91389 ?auto_91392 ) ) ( not ( = ?auto_91389 ?auto_91393 ) ) ( not ( = ?auto_91390 ?auto_91392 ) ) ( not ( = ?auto_91390 ?auto_91393 ) ) ( not ( = ?auto_91391 ?auto_91392 ) ) ( not ( = ?auto_91391 ?auto_91393 ) ) ( not ( = ?auto_91395 ?auto_91392 ) ) ( not ( = ?auto_91395 ?auto_91393 ) ) ( not ( = ?auto_91392 ?auto_91393 ) ) ( ON ?auto_91393 ?auto_91394 ) ( not ( = ?auto_91388 ?auto_91394 ) ) ( not ( = ?auto_91389 ?auto_91394 ) ) ( not ( = ?auto_91390 ?auto_91394 ) ) ( not ( = ?auto_91391 ?auto_91394 ) ) ( not ( = ?auto_91395 ?auto_91394 ) ) ( not ( = ?auto_91392 ?auto_91394 ) ) ( not ( = ?auto_91393 ?auto_91394 ) ) ( ON ?auto_91392 ?auto_91393 ) ( ON-TABLE ?auto_91394 ) ( ON ?auto_91395 ?auto_91392 ) ( CLEAR ?auto_91395 ) ( HOLDING ?auto_91391 ) ( CLEAR ?auto_91390 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91388 ?auto_91389 ?auto_91390 ?auto_91391 ?auto_91395 )
      ( MAKE-4PILE ?auto_91388 ?auto_91389 ?auto_91390 ?auto_91391 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91396 - BLOCK
      ?auto_91397 - BLOCK
      ?auto_91398 - BLOCK
      ?auto_91399 - BLOCK
    )
    :vars
    (
      ?auto_91403 - BLOCK
      ?auto_91401 - BLOCK
      ?auto_91400 - BLOCK
      ?auto_91402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91396 ) ( ON ?auto_91397 ?auto_91396 ) ( ON ?auto_91398 ?auto_91397 ) ( not ( = ?auto_91396 ?auto_91397 ) ) ( not ( = ?auto_91396 ?auto_91398 ) ) ( not ( = ?auto_91396 ?auto_91399 ) ) ( not ( = ?auto_91396 ?auto_91403 ) ) ( not ( = ?auto_91397 ?auto_91398 ) ) ( not ( = ?auto_91397 ?auto_91399 ) ) ( not ( = ?auto_91397 ?auto_91403 ) ) ( not ( = ?auto_91398 ?auto_91399 ) ) ( not ( = ?auto_91398 ?auto_91403 ) ) ( not ( = ?auto_91399 ?auto_91403 ) ) ( not ( = ?auto_91396 ?auto_91401 ) ) ( not ( = ?auto_91396 ?auto_91400 ) ) ( not ( = ?auto_91397 ?auto_91401 ) ) ( not ( = ?auto_91397 ?auto_91400 ) ) ( not ( = ?auto_91398 ?auto_91401 ) ) ( not ( = ?auto_91398 ?auto_91400 ) ) ( not ( = ?auto_91399 ?auto_91401 ) ) ( not ( = ?auto_91399 ?auto_91400 ) ) ( not ( = ?auto_91403 ?auto_91401 ) ) ( not ( = ?auto_91403 ?auto_91400 ) ) ( not ( = ?auto_91401 ?auto_91400 ) ) ( ON ?auto_91400 ?auto_91402 ) ( not ( = ?auto_91396 ?auto_91402 ) ) ( not ( = ?auto_91397 ?auto_91402 ) ) ( not ( = ?auto_91398 ?auto_91402 ) ) ( not ( = ?auto_91399 ?auto_91402 ) ) ( not ( = ?auto_91403 ?auto_91402 ) ) ( not ( = ?auto_91401 ?auto_91402 ) ) ( not ( = ?auto_91400 ?auto_91402 ) ) ( ON ?auto_91401 ?auto_91400 ) ( ON-TABLE ?auto_91402 ) ( ON ?auto_91403 ?auto_91401 ) ( CLEAR ?auto_91398 ) ( ON ?auto_91399 ?auto_91403 ) ( CLEAR ?auto_91399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91402 ?auto_91400 ?auto_91401 ?auto_91403 )
      ( MAKE-4PILE ?auto_91396 ?auto_91397 ?auto_91398 ?auto_91399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91404 - BLOCK
      ?auto_91405 - BLOCK
      ?auto_91406 - BLOCK
      ?auto_91407 - BLOCK
    )
    :vars
    (
      ?auto_91408 - BLOCK
      ?auto_91409 - BLOCK
      ?auto_91410 - BLOCK
      ?auto_91411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91404 ) ( ON ?auto_91405 ?auto_91404 ) ( not ( = ?auto_91404 ?auto_91405 ) ) ( not ( = ?auto_91404 ?auto_91406 ) ) ( not ( = ?auto_91404 ?auto_91407 ) ) ( not ( = ?auto_91404 ?auto_91408 ) ) ( not ( = ?auto_91405 ?auto_91406 ) ) ( not ( = ?auto_91405 ?auto_91407 ) ) ( not ( = ?auto_91405 ?auto_91408 ) ) ( not ( = ?auto_91406 ?auto_91407 ) ) ( not ( = ?auto_91406 ?auto_91408 ) ) ( not ( = ?auto_91407 ?auto_91408 ) ) ( not ( = ?auto_91404 ?auto_91409 ) ) ( not ( = ?auto_91404 ?auto_91410 ) ) ( not ( = ?auto_91405 ?auto_91409 ) ) ( not ( = ?auto_91405 ?auto_91410 ) ) ( not ( = ?auto_91406 ?auto_91409 ) ) ( not ( = ?auto_91406 ?auto_91410 ) ) ( not ( = ?auto_91407 ?auto_91409 ) ) ( not ( = ?auto_91407 ?auto_91410 ) ) ( not ( = ?auto_91408 ?auto_91409 ) ) ( not ( = ?auto_91408 ?auto_91410 ) ) ( not ( = ?auto_91409 ?auto_91410 ) ) ( ON ?auto_91410 ?auto_91411 ) ( not ( = ?auto_91404 ?auto_91411 ) ) ( not ( = ?auto_91405 ?auto_91411 ) ) ( not ( = ?auto_91406 ?auto_91411 ) ) ( not ( = ?auto_91407 ?auto_91411 ) ) ( not ( = ?auto_91408 ?auto_91411 ) ) ( not ( = ?auto_91409 ?auto_91411 ) ) ( not ( = ?auto_91410 ?auto_91411 ) ) ( ON ?auto_91409 ?auto_91410 ) ( ON-TABLE ?auto_91411 ) ( ON ?auto_91408 ?auto_91409 ) ( ON ?auto_91407 ?auto_91408 ) ( CLEAR ?auto_91407 ) ( HOLDING ?auto_91406 ) ( CLEAR ?auto_91405 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91404 ?auto_91405 ?auto_91406 )
      ( MAKE-4PILE ?auto_91404 ?auto_91405 ?auto_91406 ?auto_91407 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91412 - BLOCK
      ?auto_91413 - BLOCK
      ?auto_91414 - BLOCK
      ?auto_91415 - BLOCK
    )
    :vars
    (
      ?auto_91416 - BLOCK
      ?auto_91419 - BLOCK
      ?auto_91417 - BLOCK
      ?auto_91418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91412 ) ( ON ?auto_91413 ?auto_91412 ) ( not ( = ?auto_91412 ?auto_91413 ) ) ( not ( = ?auto_91412 ?auto_91414 ) ) ( not ( = ?auto_91412 ?auto_91415 ) ) ( not ( = ?auto_91412 ?auto_91416 ) ) ( not ( = ?auto_91413 ?auto_91414 ) ) ( not ( = ?auto_91413 ?auto_91415 ) ) ( not ( = ?auto_91413 ?auto_91416 ) ) ( not ( = ?auto_91414 ?auto_91415 ) ) ( not ( = ?auto_91414 ?auto_91416 ) ) ( not ( = ?auto_91415 ?auto_91416 ) ) ( not ( = ?auto_91412 ?auto_91419 ) ) ( not ( = ?auto_91412 ?auto_91417 ) ) ( not ( = ?auto_91413 ?auto_91419 ) ) ( not ( = ?auto_91413 ?auto_91417 ) ) ( not ( = ?auto_91414 ?auto_91419 ) ) ( not ( = ?auto_91414 ?auto_91417 ) ) ( not ( = ?auto_91415 ?auto_91419 ) ) ( not ( = ?auto_91415 ?auto_91417 ) ) ( not ( = ?auto_91416 ?auto_91419 ) ) ( not ( = ?auto_91416 ?auto_91417 ) ) ( not ( = ?auto_91419 ?auto_91417 ) ) ( ON ?auto_91417 ?auto_91418 ) ( not ( = ?auto_91412 ?auto_91418 ) ) ( not ( = ?auto_91413 ?auto_91418 ) ) ( not ( = ?auto_91414 ?auto_91418 ) ) ( not ( = ?auto_91415 ?auto_91418 ) ) ( not ( = ?auto_91416 ?auto_91418 ) ) ( not ( = ?auto_91419 ?auto_91418 ) ) ( not ( = ?auto_91417 ?auto_91418 ) ) ( ON ?auto_91419 ?auto_91417 ) ( ON-TABLE ?auto_91418 ) ( ON ?auto_91416 ?auto_91419 ) ( ON ?auto_91415 ?auto_91416 ) ( CLEAR ?auto_91413 ) ( ON ?auto_91414 ?auto_91415 ) ( CLEAR ?auto_91414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91418 ?auto_91417 ?auto_91419 ?auto_91416 ?auto_91415 )
      ( MAKE-4PILE ?auto_91412 ?auto_91413 ?auto_91414 ?auto_91415 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91420 - BLOCK
      ?auto_91421 - BLOCK
      ?auto_91422 - BLOCK
      ?auto_91423 - BLOCK
    )
    :vars
    (
      ?auto_91427 - BLOCK
      ?auto_91426 - BLOCK
      ?auto_91425 - BLOCK
      ?auto_91424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91420 ) ( not ( = ?auto_91420 ?auto_91421 ) ) ( not ( = ?auto_91420 ?auto_91422 ) ) ( not ( = ?auto_91420 ?auto_91423 ) ) ( not ( = ?auto_91420 ?auto_91427 ) ) ( not ( = ?auto_91421 ?auto_91422 ) ) ( not ( = ?auto_91421 ?auto_91423 ) ) ( not ( = ?auto_91421 ?auto_91427 ) ) ( not ( = ?auto_91422 ?auto_91423 ) ) ( not ( = ?auto_91422 ?auto_91427 ) ) ( not ( = ?auto_91423 ?auto_91427 ) ) ( not ( = ?auto_91420 ?auto_91426 ) ) ( not ( = ?auto_91420 ?auto_91425 ) ) ( not ( = ?auto_91421 ?auto_91426 ) ) ( not ( = ?auto_91421 ?auto_91425 ) ) ( not ( = ?auto_91422 ?auto_91426 ) ) ( not ( = ?auto_91422 ?auto_91425 ) ) ( not ( = ?auto_91423 ?auto_91426 ) ) ( not ( = ?auto_91423 ?auto_91425 ) ) ( not ( = ?auto_91427 ?auto_91426 ) ) ( not ( = ?auto_91427 ?auto_91425 ) ) ( not ( = ?auto_91426 ?auto_91425 ) ) ( ON ?auto_91425 ?auto_91424 ) ( not ( = ?auto_91420 ?auto_91424 ) ) ( not ( = ?auto_91421 ?auto_91424 ) ) ( not ( = ?auto_91422 ?auto_91424 ) ) ( not ( = ?auto_91423 ?auto_91424 ) ) ( not ( = ?auto_91427 ?auto_91424 ) ) ( not ( = ?auto_91426 ?auto_91424 ) ) ( not ( = ?auto_91425 ?auto_91424 ) ) ( ON ?auto_91426 ?auto_91425 ) ( ON-TABLE ?auto_91424 ) ( ON ?auto_91427 ?auto_91426 ) ( ON ?auto_91423 ?auto_91427 ) ( ON ?auto_91422 ?auto_91423 ) ( CLEAR ?auto_91422 ) ( HOLDING ?auto_91421 ) ( CLEAR ?auto_91420 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91420 ?auto_91421 )
      ( MAKE-4PILE ?auto_91420 ?auto_91421 ?auto_91422 ?auto_91423 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91428 - BLOCK
      ?auto_91429 - BLOCK
      ?auto_91430 - BLOCK
      ?auto_91431 - BLOCK
    )
    :vars
    (
      ?auto_91433 - BLOCK
      ?auto_91435 - BLOCK
      ?auto_91432 - BLOCK
      ?auto_91434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91428 ) ( not ( = ?auto_91428 ?auto_91429 ) ) ( not ( = ?auto_91428 ?auto_91430 ) ) ( not ( = ?auto_91428 ?auto_91431 ) ) ( not ( = ?auto_91428 ?auto_91433 ) ) ( not ( = ?auto_91429 ?auto_91430 ) ) ( not ( = ?auto_91429 ?auto_91431 ) ) ( not ( = ?auto_91429 ?auto_91433 ) ) ( not ( = ?auto_91430 ?auto_91431 ) ) ( not ( = ?auto_91430 ?auto_91433 ) ) ( not ( = ?auto_91431 ?auto_91433 ) ) ( not ( = ?auto_91428 ?auto_91435 ) ) ( not ( = ?auto_91428 ?auto_91432 ) ) ( not ( = ?auto_91429 ?auto_91435 ) ) ( not ( = ?auto_91429 ?auto_91432 ) ) ( not ( = ?auto_91430 ?auto_91435 ) ) ( not ( = ?auto_91430 ?auto_91432 ) ) ( not ( = ?auto_91431 ?auto_91435 ) ) ( not ( = ?auto_91431 ?auto_91432 ) ) ( not ( = ?auto_91433 ?auto_91435 ) ) ( not ( = ?auto_91433 ?auto_91432 ) ) ( not ( = ?auto_91435 ?auto_91432 ) ) ( ON ?auto_91432 ?auto_91434 ) ( not ( = ?auto_91428 ?auto_91434 ) ) ( not ( = ?auto_91429 ?auto_91434 ) ) ( not ( = ?auto_91430 ?auto_91434 ) ) ( not ( = ?auto_91431 ?auto_91434 ) ) ( not ( = ?auto_91433 ?auto_91434 ) ) ( not ( = ?auto_91435 ?auto_91434 ) ) ( not ( = ?auto_91432 ?auto_91434 ) ) ( ON ?auto_91435 ?auto_91432 ) ( ON-TABLE ?auto_91434 ) ( ON ?auto_91433 ?auto_91435 ) ( ON ?auto_91431 ?auto_91433 ) ( ON ?auto_91430 ?auto_91431 ) ( CLEAR ?auto_91428 ) ( ON ?auto_91429 ?auto_91430 ) ( CLEAR ?auto_91429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91434 ?auto_91432 ?auto_91435 ?auto_91433 ?auto_91431 ?auto_91430 )
      ( MAKE-4PILE ?auto_91428 ?auto_91429 ?auto_91430 ?auto_91431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91436 - BLOCK
      ?auto_91437 - BLOCK
      ?auto_91438 - BLOCK
      ?auto_91439 - BLOCK
    )
    :vars
    (
      ?auto_91443 - BLOCK
      ?auto_91442 - BLOCK
      ?auto_91440 - BLOCK
      ?auto_91441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91436 ?auto_91437 ) ) ( not ( = ?auto_91436 ?auto_91438 ) ) ( not ( = ?auto_91436 ?auto_91439 ) ) ( not ( = ?auto_91436 ?auto_91443 ) ) ( not ( = ?auto_91437 ?auto_91438 ) ) ( not ( = ?auto_91437 ?auto_91439 ) ) ( not ( = ?auto_91437 ?auto_91443 ) ) ( not ( = ?auto_91438 ?auto_91439 ) ) ( not ( = ?auto_91438 ?auto_91443 ) ) ( not ( = ?auto_91439 ?auto_91443 ) ) ( not ( = ?auto_91436 ?auto_91442 ) ) ( not ( = ?auto_91436 ?auto_91440 ) ) ( not ( = ?auto_91437 ?auto_91442 ) ) ( not ( = ?auto_91437 ?auto_91440 ) ) ( not ( = ?auto_91438 ?auto_91442 ) ) ( not ( = ?auto_91438 ?auto_91440 ) ) ( not ( = ?auto_91439 ?auto_91442 ) ) ( not ( = ?auto_91439 ?auto_91440 ) ) ( not ( = ?auto_91443 ?auto_91442 ) ) ( not ( = ?auto_91443 ?auto_91440 ) ) ( not ( = ?auto_91442 ?auto_91440 ) ) ( ON ?auto_91440 ?auto_91441 ) ( not ( = ?auto_91436 ?auto_91441 ) ) ( not ( = ?auto_91437 ?auto_91441 ) ) ( not ( = ?auto_91438 ?auto_91441 ) ) ( not ( = ?auto_91439 ?auto_91441 ) ) ( not ( = ?auto_91443 ?auto_91441 ) ) ( not ( = ?auto_91442 ?auto_91441 ) ) ( not ( = ?auto_91440 ?auto_91441 ) ) ( ON ?auto_91442 ?auto_91440 ) ( ON-TABLE ?auto_91441 ) ( ON ?auto_91443 ?auto_91442 ) ( ON ?auto_91439 ?auto_91443 ) ( ON ?auto_91438 ?auto_91439 ) ( ON ?auto_91437 ?auto_91438 ) ( CLEAR ?auto_91437 ) ( HOLDING ?auto_91436 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91436 )
      ( MAKE-4PILE ?auto_91436 ?auto_91437 ?auto_91438 ?auto_91439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91444 - BLOCK
      ?auto_91445 - BLOCK
      ?auto_91446 - BLOCK
      ?auto_91447 - BLOCK
    )
    :vars
    (
      ?auto_91450 - BLOCK
      ?auto_91448 - BLOCK
      ?auto_91449 - BLOCK
      ?auto_91451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91444 ?auto_91445 ) ) ( not ( = ?auto_91444 ?auto_91446 ) ) ( not ( = ?auto_91444 ?auto_91447 ) ) ( not ( = ?auto_91444 ?auto_91450 ) ) ( not ( = ?auto_91445 ?auto_91446 ) ) ( not ( = ?auto_91445 ?auto_91447 ) ) ( not ( = ?auto_91445 ?auto_91450 ) ) ( not ( = ?auto_91446 ?auto_91447 ) ) ( not ( = ?auto_91446 ?auto_91450 ) ) ( not ( = ?auto_91447 ?auto_91450 ) ) ( not ( = ?auto_91444 ?auto_91448 ) ) ( not ( = ?auto_91444 ?auto_91449 ) ) ( not ( = ?auto_91445 ?auto_91448 ) ) ( not ( = ?auto_91445 ?auto_91449 ) ) ( not ( = ?auto_91446 ?auto_91448 ) ) ( not ( = ?auto_91446 ?auto_91449 ) ) ( not ( = ?auto_91447 ?auto_91448 ) ) ( not ( = ?auto_91447 ?auto_91449 ) ) ( not ( = ?auto_91450 ?auto_91448 ) ) ( not ( = ?auto_91450 ?auto_91449 ) ) ( not ( = ?auto_91448 ?auto_91449 ) ) ( ON ?auto_91449 ?auto_91451 ) ( not ( = ?auto_91444 ?auto_91451 ) ) ( not ( = ?auto_91445 ?auto_91451 ) ) ( not ( = ?auto_91446 ?auto_91451 ) ) ( not ( = ?auto_91447 ?auto_91451 ) ) ( not ( = ?auto_91450 ?auto_91451 ) ) ( not ( = ?auto_91448 ?auto_91451 ) ) ( not ( = ?auto_91449 ?auto_91451 ) ) ( ON ?auto_91448 ?auto_91449 ) ( ON-TABLE ?auto_91451 ) ( ON ?auto_91450 ?auto_91448 ) ( ON ?auto_91447 ?auto_91450 ) ( ON ?auto_91446 ?auto_91447 ) ( ON ?auto_91445 ?auto_91446 ) ( ON ?auto_91444 ?auto_91445 ) ( CLEAR ?auto_91444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91451 ?auto_91449 ?auto_91448 ?auto_91450 ?auto_91447 ?auto_91446 ?auto_91445 )
      ( MAKE-4PILE ?auto_91444 ?auto_91445 ?auto_91446 ?auto_91447 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91455 - BLOCK
      ?auto_91456 - BLOCK
      ?auto_91457 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91457 ) ( CLEAR ?auto_91456 ) ( ON-TABLE ?auto_91455 ) ( ON ?auto_91456 ?auto_91455 ) ( not ( = ?auto_91455 ?auto_91456 ) ) ( not ( = ?auto_91455 ?auto_91457 ) ) ( not ( = ?auto_91456 ?auto_91457 ) ) )
    :subtasks
    ( ( !STACK ?auto_91457 ?auto_91456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91458 - BLOCK
      ?auto_91459 - BLOCK
      ?auto_91460 - BLOCK
    )
    :vars
    (
      ?auto_91461 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91459 ) ( ON-TABLE ?auto_91458 ) ( ON ?auto_91459 ?auto_91458 ) ( not ( = ?auto_91458 ?auto_91459 ) ) ( not ( = ?auto_91458 ?auto_91460 ) ) ( not ( = ?auto_91459 ?auto_91460 ) ) ( ON ?auto_91460 ?auto_91461 ) ( CLEAR ?auto_91460 ) ( HAND-EMPTY ) ( not ( = ?auto_91458 ?auto_91461 ) ) ( not ( = ?auto_91459 ?auto_91461 ) ) ( not ( = ?auto_91460 ?auto_91461 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91460 ?auto_91461 )
      ( MAKE-3PILE ?auto_91458 ?auto_91459 ?auto_91460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91462 - BLOCK
      ?auto_91463 - BLOCK
      ?auto_91464 - BLOCK
    )
    :vars
    (
      ?auto_91465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91462 ) ( not ( = ?auto_91462 ?auto_91463 ) ) ( not ( = ?auto_91462 ?auto_91464 ) ) ( not ( = ?auto_91463 ?auto_91464 ) ) ( ON ?auto_91464 ?auto_91465 ) ( CLEAR ?auto_91464 ) ( not ( = ?auto_91462 ?auto_91465 ) ) ( not ( = ?auto_91463 ?auto_91465 ) ) ( not ( = ?auto_91464 ?auto_91465 ) ) ( HOLDING ?auto_91463 ) ( CLEAR ?auto_91462 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91462 ?auto_91463 )
      ( MAKE-3PILE ?auto_91462 ?auto_91463 ?auto_91464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91466 - BLOCK
      ?auto_91467 - BLOCK
      ?auto_91468 - BLOCK
    )
    :vars
    (
      ?auto_91469 - BLOCK
      ?auto_91471 - BLOCK
      ?auto_91470 - BLOCK
      ?auto_91472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91466 ) ( not ( = ?auto_91466 ?auto_91467 ) ) ( not ( = ?auto_91466 ?auto_91468 ) ) ( not ( = ?auto_91467 ?auto_91468 ) ) ( ON ?auto_91468 ?auto_91469 ) ( not ( = ?auto_91466 ?auto_91469 ) ) ( not ( = ?auto_91467 ?auto_91469 ) ) ( not ( = ?auto_91468 ?auto_91469 ) ) ( CLEAR ?auto_91466 ) ( ON ?auto_91467 ?auto_91468 ) ( CLEAR ?auto_91467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91471 ) ( ON ?auto_91470 ?auto_91471 ) ( ON ?auto_91472 ?auto_91470 ) ( ON ?auto_91469 ?auto_91472 ) ( not ( = ?auto_91471 ?auto_91470 ) ) ( not ( = ?auto_91471 ?auto_91472 ) ) ( not ( = ?auto_91471 ?auto_91469 ) ) ( not ( = ?auto_91471 ?auto_91468 ) ) ( not ( = ?auto_91471 ?auto_91467 ) ) ( not ( = ?auto_91470 ?auto_91472 ) ) ( not ( = ?auto_91470 ?auto_91469 ) ) ( not ( = ?auto_91470 ?auto_91468 ) ) ( not ( = ?auto_91470 ?auto_91467 ) ) ( not ( = ?auto_91472 ?auto_91469 ) ) ( not ( = ?auto_91472 ?auto_91468 ) ) ( not ( = ?auto_91472 ?auto_91467 ) ) ( not ( = ?auto_91466 ?auto_91471 ) ) ( not ( = ?auto_91466 ?auto_91470 ) ) ( not ( = ?auto_91466 ?auto_91472 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91471 ?auto_91470 ?auto_91472 ?auto_91469 ?auto_91468 )
      ( MAKE-3PILE ?auto_91466 ?auto_91467 ?auto_91468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91473 - BLOCK
      ?auto_91474 - BLOCK
      ?auto_91475 - BLOCK
    )
    :vars
    (
      ?auto_91478 - BLOCK
      ?auto_91477 - BLOCK
      ?auto_91476 - BLOCK
      ?auto_91479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91473 ?auto_91474 ) ) ( not ( = ?auto_91473 ?auto_91475 ) ) ( not ( = ?auto_91474 ?auto_91475 ) ) ( ON ?auto_91475 ?auto_91478 ) ( not ( = ?auto_91473 ?auto_91478 ) ) ( not ( = ?auto_91474 ?auto_91478 ) ) ( not ( = ?auto_91475 ?auto_91478 ) ) ( ON ?auto_91474 ?auto_91475 ) ( CLEAR ?auto_91474 ) ( ON-TABLE ?auto_91477 ) ( ON ?auto_91476 ?auto_91477 ) ( ON ?auto_91479 ?auto_91476 ) ( ON ?auto_91478 ?auto_91479 ) ( not ( = ?auto_91477 ?auto_91476 ) ) ( not ( = ?auto_91477 ?auto_91479 ) ) ( not ( = ?auto_91477 ?auto_91478 ) ) ( not ( = ?auto_91477 ?auto_91475 ) ) ( not ( = ?auto_91477 ?auto_91474 ) ) ( not ( = ?auto_91476 ?auto_91479 ) ) ( not ( = ?auto_91476 ?auto_91478 ) ) ( not ( = ?auto_91476 ?auto_91475 ) ) ( not ( = ?auto_91476 ?auto_91474 ) ) ( not ( = ?auto_91479 ?auto_91478 ) ) ( not ( = ?auto_91479 ?auto_91475 ) ) ( not ( = ?auto_91479 ?auto_91474 ) ) ( not ( = ?auto_91473 ?auto_91477 ) ) ( not ( = ?auto_91473 ?auto_91476 ) ) ( not ( = ?auto_91473 ?auto_91479 ) ) ( HOLDING ?auto_91473 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91473 )
      ( MAKE-3PILE ?auto_91473 ?auto_91474 ?auto_91475 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91480 - BLOCK
      ?auto_91481 - BLOCK
      ?auto_91482 - BLOCK
    )
    :vars
    (
      ?auto_91486 - BLOCK
      ?auto_91485 - BLOCK
      ?auto_91484 - BLOCK
      ?auto_91483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91480 ?auto_91481 ) ) ( not ( = ?auto_91480 ?auto_91482 ) ) ( not ( = ?auto_91481 ?auto_91482 ) ) ( ON ?auto_91482 ?auto_91486 ) ( not ( = ?auto_91480 ?auto_91486 ) ) ( not ( = ?auto_91481 ?auto_91486 ) ) ( not ( = ?auto_91482 ?auto_91486 ) ) ( ON ?auto_91481 ?auto_91482 ) ( ON-TABLE ?auto_91485 ) ( ON ?auto_91484 ?auto_91485 ) ( ON ?auto_91483 ?auto_91484 ) ( ON ?auto_91486 ?auto_91483 ) ( not ( = ?auto_91485 ?auto_91484 ) ) ( not ( = ?auto_91485 ?auto_91483 ) ) ( not ( = ?auto_91485 ?auto_91486 ) ) ( not ( = ?auto_91485 ?auto_91482 ) ) ( not ( = ?auto_91485 ?auto_91481 ) ) ( not ( = ?auto_91484 ?auto_91483 ) ) ( not ( = ?auto_91484 ?auto_91486 ) ) ( not ( = ?auto_91484 ?auto_91482 ) ) ( not ( = ?auto_91484 ?auto_91481 ) ) ( not ( = ?auto_91483 ?auto_91486 ) ) ( not ( = ?auto_91483 ?auto_91482 ) ) ( not ( = ?auto_91483 ?auto_91481 ) ) ( not ( = ?auto_91480 ?auto_91485 ) ) ( not ( = ?auto_91480 ?auto_91484 ) ) ( not ( = ?auto_91480 ?auto_91483 ) ) ( ON ?auto_91480 ?auto_91481 ) ( CLEAR ?auto_91480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91485 ?auto_91484 ?auto_91483 ?auto_91486 ?auto_91482 ?auto_91481 )
      ( MAKE-3PILE ?auto_91480 ?auto_91481 ?auto_91482 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91487 - BLOCK
      ?auto_91488 - BLOCK
      ?auto_91489 - BLOCK
    )
    :vars
    (
      ?auto_91493 - BLOCK
      ?auto_91492 - BLOCK
      ?auto_91491 - BLOCK
      ?auto_91490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91487 ?auto_91488 ) ) ( not ( = ?auto_91487 ?auto_91489 ) ) ( not ( = ?auto_91488 ?auto_91489 ) ) ( ON ?auto_91489 ?auto_91493 ) ( not ( = ?auto_91487 ?auto_91493 ) ) ( not ( = ?auto_91488 ?auto_91493 ) ) ( not ( = ?auto_91489 ?auto_91493 ) ) ( ON ?auto_91488 ?auto_91489 ) ( ON-TABLE ?auto_91492 ) ( ON ?auto_91491 ?auto_91492 ) ( ON ?auto_91490 ?auto_91491 ) ( ON ?auto_91493 ?auto_91490 ) ( not ( = ?auto_91492 ?auto_91491 ) ) ( not ( = ?auto_91492 ?auto_91490 ) ) ( not ( = ?auto_91492 ?auto_91493 ) ) ( not ( = ?auto_91492 ?auto_91489 ) ) ( not ( = ?auto_91492 ?auto_91488 ) ) ( not ( = ?auto_91491 ?auto_91490 ) ) ( not ( = ?auto_91491 ?auto_91493 ) ) ( not ( = ?auto_91491 ?auto_91489 ) ) ( not ( = ?auto_91491 ?auto_91488 ) ) ( not ( = ?auto_91490 ?auto_91493 ) ) ( not ( = ?auto_91490 ?auto_91489 ) ) ( not ( = ?auto_91490 ?auto_91488 ) ) ( not ( = ?auto_91487 ?auto_91492 ) ) ( not ( = ?auto_91487 ?auto_91491 ) ) ( not ( = ?auto_91487 ?auto_91490 ) ) ( HOLDING ?auto_91487 ) ( CLEAR ?auto_91488 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91492 ?auto_91491 ?auto_91490 ?auto_91493 ?auto_91489 ?auto_91488 ?auto_91487 )
      ( MAKE-3PILE ?auto_91487 ?auto_91488 ?auto_91489 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91494 - BLOCK
      ?auto_91495 - BLOCK
      ?auto_91496 - BLOCK
    )
    :vars
    (
      ?auto_91500 - BLOCK
      ?auto_91497 - BLOCK
      ?auto_91499 - BLOCK
      ?auto_91498 - BLOCK
      ?auto_91501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91494 ?auto_91495 ) ) ( not ( = ?auto_91494 ?auto_91496 ) ) ( not ( = ?auto_91495 ?auto_91496 ) ) ( ON ?auto_91496 ?auto_91500 ) ( not ( = ?auto_91494 ?auto_91500 ) ) ( not ( = ?auto_91495 ?auto_91500 ) ) ( not ( = ?auto_91496 ?auto_91500 ) ) ( ON ?auto_91495 ?auto_91496 ) ( ON-TABLE ?auto_91497 ) ( ON ?auto_91499 ?auto_91497 ) ( ON ?auto_91498 ?auto_91499 ) ( ON ?auto_91500 ?auto_91498 ) ( not ( = ?auto_91497 ?auto_91499 ) ) ( not ( = ?auto_91497 ?auto_91498 ) ) ( not ( = ?auto_91497 ?auto_91500 ) ) ( not ( = ?auto_91497 ?auto_91496 ) ) ( not ( = ?auto_91497 ?auto_91495 ) ) ( not ( = ?auto_91499 ?auto_91498 ) ) ( not ( = ?auto_91499 ?auto_91500 ) ) ( not ( = ?auto_91499 ?auto_91496 ) ) ( not ( = ?auto_91499 ?auto_91495 ) ) ( not ( = ?auto_91498 ?auto_91500 ) ) ( not ( = ?auto_91498 ?auto_91496 ) ) ( not ( = ?auto_91498 ?auto_91495 ) ) ( not ( = ?auto_91494 ?auto_91497 ) ) ( not ( = ?auto_91494 ?auto_91499 ) ) ( not ( = ?auto_91494 ?auto_91498 ) ) ( CLEAR ?auto_91495 ) ( ON ?auto_91494 ?auto_91501 ) ( CLEAR ?auto_91494 ) ( HAND-EMPTY ) ( not ( = ?auto_91494 ?auto_91501 ) ) ( not ( = ?auto_91495 ?auto_91501 ) ) ( not ( = ?auto_91496 ?auto_91501 ) ) ( not ( = ?auto_91500 ?auto_91501 ) ) ( not ( = ?auto_91497 ?auto_91501 ) ) ( not ( = ?auto_91499 ?auto_91501 ) ) ( not ( = ?auto_91498 ?auto_91501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91494 ?auto_91501 )
      ( MAKE-3PILE ?auto_91494 ?auto_91495 ?auto_91496 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91502 - BLOCK
      ?auto_91503 - BLOCK
      ?auto_91504 - BLOCK
    )
    :vars
    (
      ?auto_91508 - BLOCK
      ?auto_91505 - BLOCK
      ?auto_91507 - BLOCK
      ?auto_91506 - BLOCK
      ?auto_91509 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91502 ?auto_91503 ) ) ( not ( = ?auto_91502 ?auto_91504 ) ) ( not ( = ?auto_91503 ?auto_91504 ) ) ( ON ?auto_91504 ?auto_91508 ) ( not ( = ?auto_91502 ?auto_91508 ) ) ( not ( = ?auto_91503 ?auto_91508 ) ) ( not ( = ?auto_91504 ?auto_91508 ) ) ( ON-TABLE ?auto_91505 ) ( ON ?auto_91507 ?auto_91505 ) ( ON ?auto_91506 ?auto_91507 ) ( ON ?auto_91508 ?auto_91506 ) ( not ( = ?auto_91505 ?auto_91507 ) ) ( not ( = ?auto_91505 ?auto_91506 ) ) ( not ( = ?auto_91505 ?auto_91508 ) ) ( not ( = ?auto_91505 ?auto_91504 ) ) ( not ( = ?auto_91505 ?auto_91503 ) ) ( not ( = ?auto_91507 ?auto_91506 ) ) ( not ( = ?auto_91507 ?auto_91508 ) ) ( not ( = ?auto_91507 ?auto_91504 ) ) ( not ( = ?auto_91507 ?auto_91503 ) ) ( not ( = ?auto_91506 ?auto_91508 ) ) ( not ( = ?auto_91506 ?auto_91504 ) ) ( not ( = ?auto_91506 ?auto_91503 ) ) ( not ( = ?auto_91502 ?auto_91505 ) ) ( not ( = ?auto_91502 ?auto_91507 ) ) ( not ( = ?auto_91502 ?auto_91506 ) ) ( ON ?auto_91502 ?auto_91509 ) ( CLEAR ?auto_91502 ) ( not ( = ?auto_91502 ?auto_91509 ) ) ( not ( = ?auto_91503 ?auto_91509 ) ) ( not ( = ?auto_91504 ?auto_91509 ) ) ( not ( = ?auto_91508 ?auto_91509 ) ) ( not ( = ?auto_91505 ?auto_91509 ) ) ( not ( = ?auto_91507 ?auto_91509 ) ) ( not ( = ?auto_91506 ?auto_91509 ) ) ( HOLDING ?auto_91503 ) ( CLEAR ?auto_91504 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91505 ?auto_91507 ?auto_91506 ?auto_91508 ?auto_91504 ?auto_91503 )
      ( MAKE-3PILE ?auto_91502 ?auto_91503 ?auto_91504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91510 - BLOCK
      ?auto_91511 - BLOCK
      ?auto_91512 - BLOCK
    )
    :vars
    (
      ?auto_91517 - BLOCK
      ?auto_91516 - BLOCK
      ?auto_91513 - BLOCK
      ?auto_91514 - BLOCK
      ?auto_91515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91510 ?auto_91511 ) ) ( not ( = ?auto_91510 ?auto_91512 ) ) ( not ( = ?auto_91511 ?auto_91512 ) ) ( ON ?auto_91512 ?auto_91517 ) ( not ( = ?auto_91510 ?auto_91517 ) ) ( not ( = ?auto_91511 ?auto_91517 ) ) ( not ( = ?auto_91512 ?auto_91517 ) ) ( ON-TABLE ?auto_91516 ) ( ON ?auto_91513 ?auto_91516 ) ( ON ?auto_91514 ?auto_91513 ) ( ON ?auto_91517 ?auto_91514 ) ( not ( = ?auto_91516 ?auto_91513 ) ) ( not ( = ?auto_91516 ?auto_91514 ) ) ( not ( = ?auto_91516 ?auto_91517 ) ) ( not ( = ?auto_91516 ?auto_91512 ) ) ( not ( = ?auto_91516 ?auto_91511 ) ) ( not ( = ?auto_91513 ?auto_91514 ) ) ( not ( = ?auto_91513 ?auto_91517 ) ) ( not ( = ?auto_91513 ?auto_91512 ) ) ( not ( = ?auto_91513 ?auto_91511 ) ) ( not ( = ?auto_91514 ?auto_91517 ) ) ( not ( = ?auto_91514 ?auto_91512 ) ) ( not ( = ?auto_91514 ?auto_91511 ) ) ( not ( = ?auto_91510 ?auto_91516 ) ) ( not ( = ?auto_91510 ?auto_91513 ) ) ( not ( = ?auto_91510 ?auto_91514 ) ) ( ON ?auto_91510 ?auto_91515 ) ( not ( = ?auto_91510 ?auto_91515 ) ) ( not ( = ?auto_91511 ?auto_91515 ) ) ( not ( = ?auto_91512 ?auto_91515 ) ) ( not ( = ?auto_91517 ?auto_91515 ) ) ( not ( = ?auto_91516 ?auto_91515 ) ) ( not ( = ?auto_91513 ?auto_91515 ) ) ( not ( = ?auto_91514 ?auto_91515 ) ) ( CLEAR ?auto_91512 ) ( ON ?auto_91511 ?auto_91510 ) ( CLEAR ?auto_91511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91515 ?auto_91510 )
      ( MAKE-3PILE ?auto_91510 ?auto_91511 ?auto_91512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91518 - BLOCK
      ?auto_91519 - BLOCK
      ?auto_91520 - BLOCK
    )
    :vars
    (
      ?auto_91524 - BLOCK
      ?auto_91525 - BLOCK
      ?auto_91521 - BLOCK
      ?auto_91523 - BLOCK
      ?auto_91522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91518 ?auto_91519 ) ) ( not ( = ?auto_91518 ?auto_91520 ) ) ( not ( = ?auto_91519 ?auto_91520 ) ) ( not ( = ?auto_91518 ?auto_91524 ) ) ( not ( = ?auto_91519 ?auto_91524 ) ) ( not ( = ?auto_91520 ?auto_91524 ) ) ( ON-TABLE ?auto_91525 ) ( ON ?auto_91521 ?auto_91525 ) ( ON ?auto_91523 ?auto_91521 ) ( ON ?auto_91524 ?auto_91523 ) ( not ( = ?auto_91525 ?auto_91521 ) ) ( not ( = ?auto_91525 ?auto_91523 ) ) ( not ( = ?auto_91525 ?auto_91524 ) ) ( not ( = ?auto_91525 ?auto_91520 ) ) ( not ( = ?auto_91525 ?auto_91519 ) ) ( not ( = ?auto_91521 ?auto_91523 ) ) ( not ( = ?auto_91521 ?auto_91524 ) ) ( not ( = ?auto_91521 ?auto_91520 ) ) ( not ( = ?auto_91521 ?auto_91519 ) ) ( not ( = ?auto_91523 ?auto_91524 ) ) ( not ( = ?auto_91523 ?auto_91520 ) ) ( not ( = ?auto_91523 ?auto_91519 ) ) ( not ( = ?auto_91518 ?auto_91525 ) ) ( not ( = ?auto_91518 ?auto_91521 ) ) ( not ( = ?auto_91518 ?auto_91523 ) ) ( ON ?auto_91518 ?auto_91522 ) ( not ( = ?auto_91518 ?auto_91522 ) ) ( not ( = ?auto_91519 ?auto_91522 ) ) ( not ( = ?auto_91520 ?auto_91522 ) ) ( not ( = ?auto_91524 ?auto_91522 ) ) ( not ( = ?auto_91525 ?auto_91522 ) ) ( not ( = ?auto_91521 ?auto_91522 ) ) ( not ( = ?auto_91523 ?auto_91522 ) ) ( ON ?auto_91519 ?auto_91518 ) ( CLEAR ?auto_91519 ) ( ON-TABLE ?auto_91522 ) ( HOLDING ?auto_91520 ) ( CLEAR ?auto_91524 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91525 ?auto_91521 ?auto_91523 ?auto_91524 ?auto_91520 )
      ( MAKE-3PILE ?auto_91518 ?auto_91519 ?auto_91520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91526 - BLOCK
      ?auto_91527 - BLOCK
      ?auto_91528 - BLOCK
    )
    :vars
    (
      ?auto_91529 - BLOCK
      ?auto_91530 - BLOCK
      ?auto_91532 - BLOCK
      ?auto_91531 - BLOCK
      ?auto_91533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91526 ?auto_91527 ) ) ( not ( = ?auto_91526 ?auto_91528 ) ) ( not ( = ?auto_91527 ?auto_91528 ) ) ( not ( = ?auto_91526 ?auto_91529 ) ) ( not ( = ?auto_91527 ?auto_91529 ) ) ( not ( = ?auto_91528 ?auto_91529 ) ) ( ON-TABLE ?auto_91530 ) ( ON ?auto_91532 ?auto_91530 ) ( ON ?auto_91531 ?auto_91532 ) ( ON ?auto_91529 ?auto_91531 ) ( not ( = ?auto_91530 ?auto_91532 ) ) ( not ( = ?auto_91530 ?auto_91531 ) ) ( not ( = ?auto_91530 ?auto_91529 ) ) ( not ( = ?auto_91530 ?auto_91528 ) ) ( not ( = ?auto_91530 ?auto_91527 ) ) ( not ( = ?auto_91532 ?auto_91531 ) ) ( not ( = ?auto_91532 ?auto_91529 ) ) ( not ( = ?auto_91532 ?auto_91528 ) ) ( not ( = ?auto_91532 ?auto_91527 ) ) ( not ( = ?auto_91531 ?auto_91529 ) ) ( not ( = ?auto_91531 ?auto_91528 ) ) ( not ( = ?auto_91531 ?auto_91527 ) ) ( not ( = ?auto_91526 ?auto_91530 ) ) ( not ( = ?auto_91526 ?auto_91532 ) ) ( not ( = ?auto_91526 ?auto_91531 ) ) ( ON ?auto_91526 ?auto_91533 ) ( not ( = ?auto_91526 ?auto_91533 ) ) ( not ( = ?auto_91527 ?auto_91533 ) ) ( not ( = ?auto_91528 ?auto_91533 ) ) ( not ( = ?auto_91529 ?auto_91533 ) ) ( not ( = ?auto_91530 ?auto_91533 ) ) ( not ( = ?auto_91532 ?auto_91533 ) ) ( not ( = ?auto_91531 ?auto_91533 ) ) ( ON ?auto_91527 ?auto_91526 ) ( ON-TABLE ?auto_91533 ) ( CLEAR ?auto_91529 ) ( ON ?auto_91528 ?auto_91527 ) ( CLEAR ?auto_91528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91533 ?auto_91526 ?auto_91527 )
      ( MAKE-3PILE ?auto_91526 ?auto_91527 ?auto_91528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91534 - BLOCK
      ?auto_91535 - BLOCK
      ?auto_91536 - BLOCK
    )
    :vars
    (
      ?auto_91539 - BLOCK
      ?auto_91541 - BLOCK
      ?auto_91538 - BLOCK
      ?auto_91540 - BLOCK
      ?auto_91537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91534 ?auto_91535 ) ) ( not ( = ?auto_91534 ?auto_91536 ) ) ( not ( = ?auto_91535 ?auto_91536 ) ) ( not ( = ?auto_91534 ?auto_91539 ) ) ( not ( = ?auto_91535 ?auto_91539 ) ) ( not ( = ?auto_91536 ?auto_91539 ) ) ( ON-TABLE ?auto_91541 ) ( ON ?auto_91538 ?auto_91541 ) ( ON ?auto_91540 ?auto_91538 ) ( not ( = ?auto_91541 ?auto_91538 ) ) ( not ( = ?auto_91541 ?auto_91540 ) ) ( not ( = ?auto_91541 ?auto_91539 ) ) ( not ( = ?auto_91541 ?auto_91536 ) ) ( not ( = ?auto_91541 ?auto_91535 ) ) ( not ( = ?auto_91538 ?auto_91540 ) ) ( not ( = ?auto_91538 ?auto_91539 ) ) ( not ( = ?auto_91538 ?auto_91536 ) ) ( not ( = ?auto_91538 ?auto_91535 ) ) ( not ( = ?auto_91540 ?auto_91539 ) ) ( not ( = ?auto_91540 ?auto_91536 ) ) ( not ( = ?auto_91540 ?auto_91535 ) ) ( not ( = ?auto_91534 ?auto_91541 ) ) ( not ( = ?auto_91534 ?auto_91538 ) ) ( not ( = ?auto_91534 ?auto_91540 ) ) ( ON ?auto_91534 ?auto_91537 ) ( not ( = ?auto_91534 ?auto_91537 ) ) ( not ( = ?auto_91535 ?auto_91537 ) ) ( not ( = ?auto_91536 ?auto_91537 ) ) ( not ( = ?auto_91539 ?auto_91537 ) ) ( not ( = ?auto_91541 ?auto_91537 ) ) ( not ( = ?auto_91538 ?auto_91537 ) ) ( not ( = ?auto_91540 ?auto_91537 ) ) ( ON ?auto_91535 ?auto_91534 ) ( ON-TABLE ?auto_91537 ) ( ON ?auto_91536 ?auto_91535 ) ( CLEAR ?auto_91536 ) ( HOLDING ?auto_91539 ) ( CLEAR ?auto_91540 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91541 ?auto_91538 ?auto_91540 ?auto_91539 )
      ( MAKE-3PILE ?auto_91534 ?auto_91535 ?auto_91536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91542 - BLOCK
      ?auto_91543 - BLOCK
      ?auto_91544 - BLOCK
    )
    :vars
    (
      ?auto_91545 - BLOCK
      ?auto_91549 - BLOCK
      ?auto_91546 - BLOCK
      ?auto_91548 - BLOCK
      ?auto_91547 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91542 ?auto_91543 ) ) ( not ( = ?auto_91542 ?auto_91544 ) ) ( not ( = ?auto_91543 ?auto_91544 ) ) ( not ( = ?auto_91542 ?auto_91545 ) ) ( not ( = ?auto_91543 ?auto_91545 ) ) ( not ( = ?auto_91544 ?auto_91545 ) ) ( ON-TABLE ?auto_91549 ) ( ON ?auto_91546 ?auto_91549 ) ( ON ?auto_91548 ?auto_91546 ) ( not ( = ?auto_91549 ?auto_91546 ) ) ( not ( = ?auto_91549 ?auto_91548 ) ) ( not ( = ?auto_91549 ?auto_91545 ) ) ( not ( = ?auto_91549 ?auto_91544 ) ) ( not ( = ?auto_91549 ?auto_91543 ) ) ( not ( = ?auto_91546 ?auto_91548 ) ) ( not ( = ?auto_91546 ?auto_91545 ) ) ( not ( = ?auto_91546 ?auto_91544 ) ) ( not ( = ?auto_91546 ?auto_91543 ) ) ( not ( = ?auto_91548 ?auto_91545 ) ) ( not ( = ?auto_91548 ?auto_91544 ) ) ( not ( = ?auto_91548 ?auto_91543 ) ) ( not ( = ?auto_91542 ?auto_91549 ) ) ( not ( = ?auto_91542 ?auto_91546 ) ) ( not ( = ?auto_91542 ?auto_91548 ) ) ( ON ?auto_91542 ?auto_91547 ) ( not ( = ?auto_91542 ?auto_91547 ) ) ( not ( = ?auto_91543 ?auto_91547 ) ) ( not ( = ?auto_91544 ?auto_91547 ) ) ( not ( = ?auto_91545 ?auto_91547 ) ) ( not ( = ?auto_91549 ?auto_91547 ) ) ( not ( = ?auto_91546 ?auto_91547 ) ) ( not ( = ?auto_91548 ?auto_91547 ) ) ( ON ?auto_91543 ?auto_91542 ) ( ON-TABLE ?auto_91547 ) ( ON ?auto_91544 ?auto_91543 ) ( CLEAR ?auto_91548 ) ( ON ?auto_91545 ?auto_91544 ) ( CLEAR ?auto_91545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91547 ?auto_91542 ?auto_91543 ?auto_91544 )
      ( MAKE-3PILE ?auto_91542 ?auto_91543 ?auto_91544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91550 - BLOCK
      ?auto_91551 - BLOCK
      ?auto_91552 - BLOCK
    )
    :vars
    (
      ?auto_91555 - BLOCK
      ?auto_91553 - BLOCK
      ?auto_91554 - BLOCK
      ?auto_91556 - BLOCK
      ?auto_91557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91550 ?auto_91551 ) ) ( not ( = ?auto_91550 ?auto_91552 ) ) ( not ( = ?auto_91551 ?auto_91552 ) ) ( not ( = ?auto_91550 ?auto_91555 ) ) ( not ( = ?auto_91551 ?auto_91555 ) ) ( not ( = ?auto_91552 ?auto_91555 ) ) ( ON-TABLE ?auto_91553 ) ( ON ?auto_91554 ?auto_91553 ) ( not ( = ?auto_91553 ?auto_91554 ) ) ( not ( = ?auto_91553 ?auto_91556 ) ) ( not ( = ?auto_91553 ?auto_91555 ) ) ( not ( = ?auto_91553 ?auto_91552 ) ) ( not ( = ?auto_91553 ?auto_91551 ) ) ( not ( = ?auto_91554 ?auto_91556 ) ) ( not ( = ?auto_91554 ?auto_91555 ) ) ( not ( = ?auto_91554 ?auto_91552 ) ) ( not ( = ?auto_91554 ?auto_91551 ) ) ( not ( = ?auto_91556 ?auto_91555 ) ) ( not ( = ?auto_91556 ?auto_91552 ) ) ( not ( = ?auto_91556 ?auto_91551 ) ) ( not ( = ?auto_91550 ?auto_91553 ) ) ( not ( = ?auto_91550 ?auto_91554 ) ) ( not ( = ?auto_91550 ?auto_91556 ) ) ( ON ?auto_91550 ?auto_91557 ) ( not ( = ?auto_91550 ?auto_91557 ) ) ( not ( = ?auto_91551 ?auto_91557 ) ) ( not ( = ?auto_91552 ?auto_91557 ) ) ( not ( = ?auto_91555 ?auto_91557 ) ) ( not ( = ?auto_91553 ?auto_91557 ) ) ( not ( = ?auto_91554 ?auto_91557 ) ) ( not ( = ?auto_91556 ?auto_91557 ) ) ( ON ?auto_91551 ?auto_91550 ) ( ON-TABLE ?auto_91557 ) ( ON ?auto_91552 ?auto_91551 ) ( ON ?auto_91555 ?auto_91552 ) ( CLEAR ?auto_91555 ) ( HOLDING ?auto_91556 ) ( CLEAR ?auto_91554 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91553 ?auto_91554 ?auto_91556 )
      ( MAKE-3PILE ?auto_91550 ?auto_91551 ?auto_91552 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91558 - BLOCK
      ?auto_91559 - BLOCK
      ?auto_91560 - BLOCK
    )
    :vars
    (
      ?auto_91562 - BLOCK
      ?auto_91564 - BLOCK
      ?auto_91563 - BLOCK
      ?auto_91565 - BLOCK
      ?auto_91561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91558 ?auto_91559 ) ) ( not ( = ?auto_91558 ?auto_91560 ) ) ( not ( = ?auto_91559 ?auto_91560 ) ) ( not ( = ?auto_91558 ?auto_91562 ) ) ( not ( = ?auto_91559 ?auto_91562 ) ) ( not ( = ?auto_91560 ?auto_91562 ) ) ( ON-TABLE ?auto_91564 ) ( ON ?auto_91563 ?auto_91564 ) ( not ( = ?auto_91564 ?auto_91563 ) ) ( not ( = ?auto_91564 ?auto_91565 ) ) ( not ( = ?auto_91564 ?auto_91562 ) ) ( not ( = ?auto_91564 ?auto_91560 ) ) ( not ( = ?auto_91564 ?auto_91559 ) ) ( not ( = ?auto_91563 ?auto_91565 ) ) ( not ( = ?auto_91563 ?auto_91562 ) ) ( not ( = ?auto_91563 ?auto_91560 ) ) ( not ( = ?auto_91563 ?auto_91559 ) ) ( not ( = ?auto_91565 ?auto_91562 ) ) ( not ( = ?auto_91565 ?auto_91560 ) ) ( not ( = ?auto_91565 ?auto_91559 ) ) ( not ( = ?auto_91558 ?auto_91564 ) ) ( not ( = ?auto_91558 ?auto_91563 ) ) ( not ( = ?auto_91558 ?auto_91565 ) ) ( ON ?auto_91558 ?auto_91561 ) ( not ( = ?auto_91558 ?auto_91561 ) ) ( not ( = ?auto_91559 ?auto_91561 ) ) ( not ( = ?auto_91560 ?auto_91561 ) ) ( not ( = ?auto_91562 ?auto_91561 ) ) ( not ( = ?auto_91564 ?auto_91561 ) ) ( not ( = ?auto_91563 ?auto_91561 ) ) ( not ( = ?auto_91565 ?auto_91561 ) ) ( ON ?auto_91559 ?auto_91558 ) ( ON-TABLE ?auto_91561 ) ( ON ?auto_91560 ?auto_91559 ) ( ON ?auto_91562 ?auto_91560 ) ( CLEAR ?auto_91563 ) ( ON ?auto_91565 ?auto_91562 ) ( CLEAR ?auto_91565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91561 ?auto_91558 ?auto_91559 ?auto_91560 ?auto_91562 )
      ( MAKE-3PILE ?auto_91558 ?auto_91559 ?auto_91560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91566 - BLOCK
      ?auto_91567 - BLOCK
      ?auto_91568 - BLOCK
    )
    :vars
    (
      ?auto_91571 - BLOCK
      ?auto_91572 - BLOCK
      ?auto_91573 - BLOCK
      ?auto_91570 - BLOCK
      ?auto_91569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91566 ?auto_91567 ) ) ( not ( = ?auto_91566 ?auto_91568 ) ) ( not ( = ?auto_91567 ?auto_91568 ) ) ( not ( = ?auto_91566 ?auto_91571 ) ) ( not ( = ?auto_91567 ?auto_91571 ) ) ( not ( = ?auto_91568 ?auto_91571 ) ) ( ON-TABLE ?auto_91572 ) ( not ( = ?auto_91572 ?auto_91573 ) ) ( not ( = ?auto_91572 ?auto_91570 ) ) ( not ( = ?auto_91572 ?auto_91571 ) ) ( not ( = ?auto_91572 ?auto_91568 ) ) ( not ( = ?auto_91572 ?auto_91567 ) ) ( not ( = ?auto_91573 ?auto_91570 ) ) ( not ( = ?auto_91573 ?auto_91571 ) ) ( not ( = ?auto_91573 ?auto_91568 ) ) ( not ( = ?auto_91573 ?auto_91567 ) ) ( not ( = ?auto_91570 ?auto_91571 ) ) ( not ( = ?auto_91570 ?auto_91568 ) ) ( not ( = ?auto_91570 ?auto_91567 ) ) ( not ( = ?auto_91566 ?auto_91572 ) ) ( not ( = ?auto_91566 ?auto_91573 ) ) ( not ( = ?auto_91566 ?auto_91570 ) ) ( ON ?auto_91566 ?auto_91569 ) ( not ( = ?auto_91566 ?auto_91569 ) ) ( not ( = ?auto_91567 ?auto_91569 ) ) ( not ( = ?auto_91568 ?auto_91569 ) ) ( not ( = ?auto_91571 ?auto_91569 ) ) ( not ( = ?auto_91572 ?auto_91569 ) ) ( not ( = ?auto_91573 ?auto_91569 ) ) ( not ( = ?auto_91570 ?auto_91569 ) ) ( ON ?auto_91567 ?auto_91566 ) ( ON-TABLE ?auto_91569 ) ( ON ?auto_91568 ?auto_91567 ) ( ON ?auto_91571 ?auto_91568 ) ( ON ?auto_91570 ?auto_91571 ) ( CLEAR ?auto_91570 ) ( HOLDING ?auto_91573 ) ( CLEAR ?auto_91572 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91572 ?auto_91573 )
      ( MAKE-3PILE ?auto_91566 ?auto_91567 ?auto_91568 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91574 - BLOCK
      ?auto_91575 - BLOCK
      ?auto_91576 - BLOCK
    )
    :vars
    (
      ?auto_91581 - BLOCK
      ?auto_91579 - BLOCK
      ?auto_91580 - BLOCK
      ?auto_91577 - BLOCK
      ?auto_91578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91574 ?auto_91575 ) ) ( not ( = ?auto_91574 ?auto_91576 ) ) ( not ( = ?auto_91575 ?auto_91576 ) ) ( not ( = ?auto_91574 ?auto_91581 ) ) ( not ( = ?auto_91575 ?auto_91581 ) ) ( not ( = ?auto_91576 ?auto_91581 ) ) ( ON-TABLE ?auto_91579 ) ( not ( = ?auto_91579 ?auto_91580 ) ) ( not ( = ?auto_91579 ?auto_91577 ) ) ( not ( = ?auto_91579 ?auto_91581 ) ) ( not ( = ?auto_91579 ?auto_91576 ) ) ( not ( = ?auto_91579 ?auto_91575 ) ) ( not ( = ?auto_91580 ?auto_91577 ) ) ( not ( = ?auto_91580 ?auto_91581 ) ) ( not ( = ?auto_91580 ?auto_91576 ) ) ( not ( = ?auto_91580 ?auto_91575 ) ) ( not ( = ?auto_91577 ?auto_91581 ) ) ( not ( = ?auto_91577 ?auto_91576 ) ) ( not ( = ?auto_91577 ?auto_91575 ) ) ( not ( = ?auto_91574 ?auto_91579 ) ) ( not ( = ?auto_91574 ?auto_91580 ) ) ( not ( = ?auto_91574 ?auto_91577 ) ) ( ON ?auto_91574 ?auto_91578 ) ( not ( = ?auto_91574 ?auto_91578 ) ) ( not ( = ?auto_91575 ?auto_91578 ) ) ( not ( = ?auto_91576 ?auto_91578 ) ) ( not ( = ?auto_91581 ?auto_91578 ) ) ( not ( = ?auto_91579 ?auto_91578 ) ) ( not ( = ?auto_91580 ?auto_91578 ) ) ( not ( = ?auto_91577 ?auto_91578 ) ) ( ON ?auto_91575 ?auto_91574 ) ( ON-TABLE ?auto_91578 ) ( ON ?auto_91576 ?auto_91575 ) ( ON ?auto_91581 ?auto_91576 ) ( ON ?auto_91577 ?auto_91581 ) ( CLEAR ?auto_91579 ) ( ON ?auto_91580 ?auto_91577 ) ( CLEAR ?auto_91580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91578 ?auto_91574 ?auto_91575 ?auto_91576 ?auto_91581 ?auto_91577 )
      ( MAKE-3PILE ?auto_91574 ?auto_91575 ?auto_91576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91582 - BLOCK
      ?auto_91583 - BLOCK
      ?auto_91584 - BLOCK
    )
    :vars
    (
      ?auto_91589 - BLOCK
      ?auto_91588 - BLOCK
      ?auto_91587 - BLOCK
      ?auto_91586 - BLOCK
      ?auto_91585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91582 ?auto_91583 ) ) ( not ( = ?auto_91582 ?auto_91584 ) ) ( not ( = ?auto_91583 ?auto_91584 ) ) ( not ( = ?auto_91582 ?auto_91589 ) ) ( not ( = ?auto_91583 ?auto_91589 ) ) ( not ( = ?auto_91584 ?auto_91589 ) ) ( not ( = ?auto_91588 ?auto_91587 ) ) ( not ( = ?auto_91588 ?auto_91586 ) ) ( not ( = ?auto_91588 ?auto_91589 ) ) ( not ( = ?auto_91588 ?auto_91584 ) ) ( not ( = ?auto_91588 ?auto_91583 ) ) ( not ( = ?auto_91587 ?auto_91586 ) ) ( not ( = ?auto_91587 ?auto_91589 ) ) ( not ( = ?auto_91587 ?auto_91584 ) ) ( not ( = ?auto_91587 ?auto_91583 ) ) ( not ( = ?auto_91586 ?auto_91589 ) ) ( not ( = ?auto_91586 ?auto_91584 ) ) ( not ( = ?auto_91586 ?auto_91583 ) ) ( not ( = ?auto_91582 ?auto_91588 ) ) ( not ( = ?auto_91582 ?auto_91587 ) ) ( not ( = ?auto_91582 ?auto_91586 ) ) ( ON ?auto_91582 ?auto_91585 ) ( not ( = ?auto_91582 ?auto_91585 ) ) ( not ( = ?auto_91583 ?auto_91585 ) ) ( not ( = ?auto_91584 ?auto_91585 ) ) ( not ( = ?auto_91589 ?auto_91585 ) ) ( not ( = ?auto_91588 ?auto_91585 ) ) ( not ( = ?auto_91587 ?auto_91585 ) ) ( not ( = ?auto_91586 ?auto_91585 ) ) ( ON ?auto_91583 ?auto_91582 ) ( ON-TABLE ?auto_91585 ) ( ON ?auto_91584 ?auto_91583 ) ( ON ?auto_91589 ?auto_91584 ) ( ON ?auto_91586 ?auto_91589 ) ( ON ?auto_91587 ?auto_91586 ) ( CLEAR ?auto_91587 ) ( HOLDING ?auto_91588 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91588 )
      ( MAKE-3PILE ?auto_91582 ?auto_91583 ?auto_91584 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91590 - BLOCK
      ?auto_91591 - BLOCK
      ?auto_91592 - BLOCK
    )
    :vars
    (
      ?auto_91596 - BLOCK
      ?auto_91595 - BLOCK
      ?auto_91593 - BLOCK
      ?auto_91594 - BLOCK
      ?auto_91597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91590 ?auto_91591 ) ) ( not ( = ?auto_91590 ?auto_91592 ) ) ( not ( = ?auto_91591 ?auto_91592 ) ) ( not ( = ?auto_91590 ?auto_91596 ) ) ( not ( = ?auto_91591 ?auto_91596 ) ) ( not ( = ?auto_91592 ?auto_91596 ) ) ( not ( = ?auto_91595 ?auto_91593 ) ) ( not ( = ?auto_91595 ?auto_91594 ) ) ( not ( = ?auto_91595 ?auto_91596 ) ) ( not ( = ?auto_91595 ?auto_91592 ) ) ( not ( = ?auto_91595 ?auto_91591 ) ) ( not ( = ?auto_91593 ?auto_91594 ) ) ( not ( = ?auto_91593 ?auto_91596 ) ) ( not ( = ?auto_91593 ?auto_91592 ) ) ( not ( = ?auto_91593 ?auto_91591 ) ) ( not ( = ?auto_91594 ?auto_91596 ) ) ( not ( = ?auto_91594 ?auto_91592 ) ) ( not ( = ?auto_91594 ?auto_91591 ) ) ( not ( = ?auto_91590 ?auto_91595 ) ) ( not ( = ?auto_91590 ?auto_91593 ) ) ( not ( = ?auto_91590 ?auto_91594 ) ) ( ON ?auto_91590 ?auto_91597 ) ( not ( = ?auto_91590 ?auto_91597 ) ) ( not ( = ?auto_91591 ?auto_91597 ) ) ( not ( = ?auto_91592 ?auto_91597 ) ) ( not ( = ?auto_91596 ?auto_91597 ) ) ( not ( = ?auto_91595 ?auto_91597 ) ) ( not ( = ?auto_91593 ?auto_91597 ) ) ( not ( = ?auto_91594 ?auto_91597 ) ) ( ON ?auto_91591 ?auto_91590 ) ( ON-TABLE ?auto_91597 ) ( ON ?auto_91592 ?auto_91591 ) ( ON ?auto_91596 ?auto_91592 ) ( ON ?auto_91594 ?auto_91596 ) ( ON ?auto_91593 ?auto_91594 ) ( ON ?auto_91595 ?auto_91593 ) ( CLEAR ?auto_91595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91597 ?auto_91590 ?auto_91591 ?auto_91592 ?auto_91596 ?auto_91594 ?auto_91593 )
      ( MAKE-3PILE ?auto_91590 ?auto_91591 ?auto_91592 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91601 - BLOCK
      ?auto_91602 - BLOCK
      ?auto_91603 - BLOCK
    )
    :vars
    (
      ?auto_91604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91604 ?auto_91603 ) ( CLEAR ?auto_91604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91601 ) ( ON ?auto_91602 ?auto_91601 ) ( ON ?auto_91603 ?auto_91602 ) ( not ( = ?auto_91601 ?auto_91602 ) ) ( not ( = ?auto_91601 ?auto_91603 ) ) ( not ( = ?auto_91601 ?auto_91604 ) ) ( not ( = ?auto_91602 ?auto_91603 ) ) ( not ( = ?auto_91602 ?auto_91604 ) ) ( not ( = ?auto_91603 ?auto_91604 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91604 ?auto_91603 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91605 - BLOCK
      ?auto_91606 - BLOCK
      ?auto_91607 - BLOCK
    )
    :vars
    (
      ?auto_91608 - BLOCK
      ?auto_91609 - BLOCK
      ?auto_91610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91608 ?auto_91607 ) ( CLEAR ?auto_91608 ) ( ON-TABLE ?auto_91605 ) ( ON ?auto_91606 ?auto_91605 ) ( ON ?auto_91607 ?auto_91606 ) ( not ( = ?auto_91605 ?auto_91606 ) ) ( not ( = ?auto_91605 ?auto_91607 ) ) ( not ( = ?auto_91605 ?auto_91608 ) ) ( not ( = ?auto_91606 ?auto_91607 ) ) ( not ( = ?auto_91606 ?auto_91608 ) ) ( not ( = ?auto_91607 ?auto_91608 ) ) ( HOLDING ?auto_91609 ) ( CLEAR ?auto_91610 ) ( not ( = ?auto_91605 ?auto_91609 ) ) ( not ( = ?auto_91605 ?auto_91610 ) ) ( not ( = ?auto_91606 ?auto_91609 ) ) ( not ( = ?auto_91606 ?auto_91610 ) ) ( not ( = ?auto_91607 ?auto_91609 ) ) ( not ( = ?auto_91607 ?auto_91610 ) ) ( not ( = ?auto_91608 ?auto_91609 ) ) ( not ( = ?auto_91608 ?auto_91610 ) ) ( not ( = ?auto_91609 ?auto_91610 ) ) )
    :subtasks
    ( ( !STACK ?auto_91609 ?auto_91610 )
      ( MAKE-3PILE ?auto_91605 ?auto_91606 ?auto_91607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91611 - BLOCK
      ?auto_91612 - BLOCK
      ?auto_91613 - BLOCK
    )
    :vars
    (
      ?auto_91615 - BLOCK
      ?auto_91614 - BLOCK
      ?auto_91616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91615 ?auto_91613 ) ( ON-TABLE ?auto_91611 ) ( ON ?auto_91612 ?auto_91611 ) ( ON ?auto_91613 ?auto_91612 ) ( not ( = ?auto_91611 ?auto_91612 ) ) ( not ( = ?auto_91611 ?auto_91613 ) ) ( not ( = ?auto_91611 ?auto_91615 ) ) ( not ( = ?auto_91612 ?auto_91613 ) ) ( not ( = ?auto_91612 ?auto_91615 ) ) ( not ( = ?auto_91613 ?auto_91615 ) ) ( CLEAR ?auto_91614 ) ( not ( = ?auto_91611 ?auto_91616 ) ) ( not ( = ?auto_91611 ?auto_91614 ) ) ( not ( = ?auto_91612 ?auto_91616 ) ) ( not ( = ?auto_91612 ?auto_91614 ) ) ( not ( = ?auto_91613 ?auto_91616 ) ) ( not ( = ?auto_91613 ?auto_91614 ) ) ( not ( = ?auto_91615 ?auto_91616 ) ) ( not ( = ?auto_91615 ?auto_91614 ) ) ( not ( = ?auto_91616 ?auto_91614 ) ) ( ON ?auto_91616 ?auto_91615 ) ( CLEAR ?auto_91616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91611 ?auto_91612 ?auto_91613 ?auto_91615 )
      ( MAKE-3PILE ?auto_91611 ?auto_91612 ?auto_91613 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91617 - BLOCK
      ?auto_91618 - BLOCK
      ?auto_91619 - BLOCK
    )
    :vars
    (
      ?auto_91621 - BLOCK
      ?auto_91622 - BLOCK
      ?auto_91620 - BLOCK
      ?auto_91623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91621 ?auto_91619 ) ( ON-TABLE ?auto_91617 ) ( ON ?auto_91618 ?auto_91617 ) ( ON ?auto_91619 ?auto_91618 ) ( not ( = ?auto_91617 ?auto_91618 ) ) ( not ( = ?auto_91617 ?auto_91619 ) ) ( not ( = ?auto_91617 ?auto_91621 ) ) ( not ( = ?auto_91618 ?auto_91619 ) ) ( not ( = ?auto_91618 ?auto_91621 ) ) ( not ( = ?auto_91619 ?auto_91621 ) ) ( not ( = ?auto_91617 ?auto_91622 ) ) ( not ( = ?auto_91617 ?auto_91620 ) ) ( not ( = ?auto_91618 ?auto_91622 ) ) ( not ( = ?auto_91618 ?auto_91620 ) ) ( not ( = ?auto_91619 ?auto_91622 ) ) ( not ( = ?auto_91619 ?auto_91620 ) ) ( not ( = ?auto_91621 ?auto_91622 ) ) ( not ( = ?auto_91621 ?auto_91620 ) ) ( not ( = ?auto_91622 ?auto_91620 ) ) ( ON ?auto_91622 ?auto_91621 ) ( CLEAR ?auto_91622 ) ( HOLDING ?auto_91620 ) ( CLEAR ?auto_91623 ) ( ON-TABLE ?auto_91623 ) ( not ( = ?auto_91623 ?auto_91620 ) ) ( not ( = ?auto_91617 ?auto_91623 ) ) ( not ( = ?auto_91618 ?auto_91623 ) ) ( not ( = ?auto_91619 ?auto_91623 ) ) ( not ( = ?auto_91621 ?auto_91623 ) ) ( not ( = ?auto_91622 ?auto_91623 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91623 ?auto_91620 )
      ( MAKE-3PILE ?auto_91617 ?auto_91618 ?auto_91619 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91624 - BLOCK
      ?auto_91625 - BLOCK
      ?auto_91626 - BLOCK
    )
    :vars
    (
      ?auto_91627 - BLOCK
      ?auto_91628 - BLOCK
      ?auto_91630 - BLOCK
      ?auto_91629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91627 ?auto_91626 ) ( ON-TABLE ?auto_91624 ) ( ON ?auto_91625 ?auto_91624 ) ( ON ?auto_91626 ?auto_91625 ) ( not ( = ?auto_91624 ?auto_91625 ) ) ( not ( = ?auto_91624 ?auto_91626 ) ) ( not ( = ?auto_91624 ?auto_91627 ) ) ( not ( = ?auto_91625 ?auto_91626 ) ) ( not ( = ?auto_91625 ?auto_91627 ) ) ( not ( = ?auto_91626 ?auto_91627 ) ) ( not ( = ?auto_91624 ?auto_91628 ) ) ( not ( = ?auto_91624 ?auto_91630 ) ) ( not ( = ?auto_91625 ?auto_91628 ) ) ( not ( = ?auto_91625 ?auto_91630 ) ) ( not ( = ?auto_91626 ?auto_91628 ) ) ( not ( = ?auto_91626 ?auto_91630 ) ) ( not ( = ?auto_91627 ?auto_91628 ) ) ( not ( = ?auto_91627 ?auto_91630 ) ) ( not ( = ?auto_91628 ?auto_91630 ) ) ( ON ?auto_91628 ?auto_91627 ) ( CLEAR ?auto_91629 ) ( ON-TABLE ?auto_91629 ) ( not ( = ?auto_91629 ?auto_91630 ) ) ( not ( = ?auto_91624 ?auto_91629 ) ) ( not ( = ?auto_91625 ?auto_91629 ) ) ( not ( = ?auto_91626 ?auto_91629 ) ) ( not ( = ?auto_91627 ?auto_91629 ) ) ( not ( = ?auto_91628 ?auto_91629 ) ) ( ON ?auto_91630 ?auto_91628 ) ( CLEAR ?auto_91630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91624 ?auto_91625 ?auto_91626 ?auto_91627 ?auto_91628 )
      ( MAKE-3PILE ?auto_91624 ?auto_91625 ?auto_91626 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91631 - BLOCK
      ?auto_91632 - BLOCK
      ?auto_91633 - BLOCK
    )
    :vars
    (
      ?auto_91634 - BLOCK
      ?auto_91637 - BLOCK
      ?auto_91636 - BLOCK
      ?auto_91635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91634 ?auto_91633 ) ( ON-TABLE ?auto_91631 ) ( ON ?auto_91632 ?auto_91631 ) ( ON ?auto_91633 ?auto_91632 ) ( not ( = ?auto_91631 ?auto_91632 ) ) ( not ( = ?auto_91631 ?auto_91633 ) ) ( not ( = ?auto_91631 ?auto_91634 ) ) ( not ( = ?auto_91632 ?auto_91633 ) ) ( not ( = ?auto_91632 ?auto_91634 ) ) ( not ( = ?auto_91633 ?auto_91634 ) ) ( not ( = ?auto_91631 ?auto_91637 ) ) ( not ( = ?auto_91631 ?auto_91636 ) ) ( not ( = ?auto_91632 ?auto_91637 ) ) ( not ( = ?auto_91632 ?auto_91636 ) ) ( not ( = ?auto_91633 ?auto_91637 ) ) ( not ( = ?auto_91633 ?auto_91636 ) ) ( not ( = ?auto_91634 ?auto_91637 ) ) ( not ( = ?auto_91634 ?auto_91636 ) ) ( not ( = ?auto_91637 ?auto_91636 ) ) ( ON ?auto_91637 ?auto_91634 ) ( not ( = ?auto_91635 ?auto_91636 ) ) ( not ( = ?auto_91631 ?auto_91635 ) ) ( not ( = ?auto_91632 ?auto_91635 ) ) ( not ( = ?auto_91633 ?auto_91635 ) ) ( not ( = ?auto_91634 ?auto_91635 ) ) ( not ( = ?auto_91637 ?auto_91635 ) ) ( ON ?auto_91636 ?auto_91637 ) ( CLEAR ?auto_91636 ) ( HOLDING ?auto_91635 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91635 )
      ( MAKE-3PILE ?auto_91631 ?auto_91632 ?auto_91633 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91638 - BLOCK
      ?auto_91639 - BLOCK
      ?auto_91640 - BLOCK
    )
    :vars
    (
      ?auto_91644 - BLOCK
      ?auto_91641 - BLOCK
      ?auto_91643 - BLOCK
      ?auto_91642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91644 ?auto_91640 ) ( ON-TABLE ?auto_91638 ) ( ON ?auto_91639 ?auto_91638 ) ( ON ?auto_91640 ?auto_91639 ) ( not ( = ?auto_91638 ?auto_91639 ) ) ( not ( = ?auto_91638 ?auto_91640 ) ) ( not ( = ?auto_91638 ?auto_91644 ) ) ( not ( = ?auto_91639 ?auto_91640 ) ) ( not ( = ?auto_91639 ?auto_91644 ) ) ( not ( = ?auto_91640 ?auto_91644 ) ) ( not ( = ?auto_91638 ?auto_91641 ) ) ( not ( = ?auto_91638 ?auto_91643 ) ) ( not ( = ?auto_91639 ?auto_91641 ) ) ( not ( = ?auto_91639 ?auto_91643 ) ) ( not ( = ?auto_91640 ?auto_91641 ) ) ( not ( = ?auto_91640 ?auto_91643 ) ) ( not ( = ?auto_91644 ?auto_91641 ) ) ( not ( = ?auto_91644 ?auto_91643 ) ) ( not ( = ?auto_91641 ?auto_91643 ) ) ( ON ?auto_91641 ?auto_91644 ) ( not ( = ?auto_91642 ?auto_91643 ) ) ( not ( = ?auto_91638 ?auto_91642 ) ) ( not ( = ?auto_91639 ?auto_91642 ) ) ( not ( = ?auto_91640 ?auto_91642 ) ) ( not ( = ?auto_91644 ?auto_91642 ) ) ( not ( = ?auto_91641 ?auto_91642 ) ) ( ON ?auto_91643 ?auto_91641 ) ( ON ?auto_91642 ?auto_91643 ) ( CLEAR ?auto_91642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91638 ?auto_91639 ?auto_91640 ?auto_91644 ?auto_91641 ?auto_91643 )
      ( MAKE-3PILE ?auto_91638 ?auto_91639 ?auto_91640 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91645 - BLOCK
      ?auto_91646 - BLOCK
      ?auto_91647 - BLOCK
    )
    :vars
    (
      ?auto_91648 - BLOCK
      ?auto_91649 - BLOCK
      ?auto_91650 - BLOCK
      ?auto_91651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91648 ?auto_91647 ) ( ON-TABLE ?auto_91645 ) ( ON ?auto_91646 ?auto_91645 ) ( ON ?auto_91647 ?auto_91646 ) ( not ( = ?auto_91645 ?auto_91646 ) ) ( not ( = ?auto_91645 ?auto_91647 ) ) ( not ( = ?auto_91645 ?auto_91648 ) ) ( not ( = ?auto_91646 ?auto_91647 ) ) ( not ( = ?auto_91646 ?auto_91648 ) ) ( not ( = ?auto_91647 ?auto_91648 ) ) ( not ( = ?auto_91645 ?auto_91649 ) ) ( not ( = ?auto_91645 ?auto_91650 ) ) ( not ( = ?auto_91646 ?auto_91649 ) ) ( not ( = ?auto_91646 ?auto_91650 ) ) ( not ( = ?auto_91647 ?auto_91649 ) ) ( not ( = ?auto_91647 ?auto_91650 ) ) ( not ( = ?auto_91648 ?auto_91649 ) ) ( not ( = ?auto_91648 ?auto_91650 ) ) ( not ( = ?auto_91649 ?auto_91650 ) ) ( ON ?auto_91649 ?auto_91648 ) ( not ( = ?auto_91651 ?auto_91650 ) ) ( not ( = ?auto_91645 ?auto_91651 ) ) ( not ( = ?auto_91646 ?auto_91651 ) ) ( not ( = ?auto_91647 ?auto_91651 ) ) ( not ( = ?auto_91648 ?auto_91651 ) ) ( not ( = ?auto_91649 ?auto_91651 ) ) ( ON ?auto_91650 ?auto_91649 ) ( HOLDING ?auto_91651 ) ( CLEAR ?auto_91650 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91645 ?auto_91646 ?auto_91647 ?auto_91648 ?auto_91649 ?auto_91650 ?auto_91651 )
      ( MAKE-3PILE ?auto_91645 ?auto_91646 ?auto_91647 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91652 - BLOCK
      ?auto_91653 - BLOCK
      ?auto_91654 - BLOCK
    )
    :vars
    (
      ?auto_91657 - BLOCK
      ?auto_91656 - BLOCK
      ?auto_91658 - BLOCK
      ?auto_91655 - BLOCK
      ?auto_91659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91657 ?auto_91654 ) ( ON-TABLE ?auto_91652 ) ( ON ?auto_91653 ?auto_91652 ) ( ON ?auto_91654 ?auto_91653 ) ( not ( = ?auto_91652 ?auto_91653 ) ) ( not ( = ?auto_91652 ?auto_91654 ) ) ( not ( = ?auto_91652 ?auto_91657 ) ) ( not ( = ?auto_91653 ?auto_91654 ) ) ( not ( = ?auto_91653 ?auto_91657 ) ) ( not ( = ?auto_91654 ?auto_91657 ) ) ( not ( = ?auto_91652 ?auto_91656 ) ) ( not ( = ?auto_91652 ?auto_91658 ) ) ( not ( = ?auto_91653 ?auto_91656 ) ) ( not ( = ?auto_91653 ?auto_91658 ) ) ( not ( = ?auto_91654 ?auto_91656 ) ) ( not ( = ?auto_91654 ?auto_91658 ) ) ( not ( = ?auto_91657 ?auto_91656 ) ) ( not ( = ?auto_91657 ?auto_91658 ) ) ( not ( = ?auto_91656 ?auto_91658 ) ) ( ON ?auto_91656 ?auto_91657 ) ( not ( = ?auto_91655 ?auto_91658 ) ) ( not ( = ?auto_91652 ?auto_91655 ) ) ( not ( = ?auto_91653 ?auto_91655 ) ) ( not ( = ?auto_91654 ?auto_91655 ) ) ( not ( = ?auto_91657 ?auto_91655 ) ) ( not ( = ?auto_91656 ?auto_91655 ) ) ( ON ?auto_91658 ?auto_91656 ) ( CLEAR ?auto_91658 ) ( ON ?auto_91655 ?auto_91659 ) ( CLEAR ?auto_91655 ) ( HAND-EMPTY ) ( not ( = ?auto_91652 ?auto_91659 ) ) ( not ( = ?auto_91653 ?auto_91659 ) ) ( not ( = ?auto_91654 ?auto_91659 ) ) ( not ( = ?auto_91657 ?auto_91659 ) ) ( not ( = ?auto_91656 ?auto_91659 ) ) ( not ( = ?auto_91658 ?auto_91659 ) ) ( not ( = ?auto_91655 ?auto_91659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91655 ?auto_91659 )
      ( MAKE-3PILE ?auto_91652 ?auto_91653 ?auto_91654 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91660 - BLOCK
      ?auto_91661 - BLOCK
      ?auto_91662 - BLOCK
    )
    :vars
    (
      ?auto_91666 - BLOCK
      ?auto_91665 - BLOCK
      ?auto_91667 - BLOCK
      ?auto_91664 - BLOCK
      ?auto_91663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91666 ?auto_91662 ) ( ON-TABLE ?auto_91660 ) ( ON ?auto_91661 ?auto_91660 ) ( ON ?auto_91662 ?auto_91661 ) ( not ( = ?auto_91660 ?auto_91661 ) ) ( not ( = ?auto_91660 ?auto_91662 ) ) ( not ( = ?auto_91660 ?auto_91666 ) ) ( not ( = ?auto_91661 ?auto_91662 ) ) ( not ( = ?auto_91661 ?auto_91666 ) ) ( not ( = ?auto_91662 ?auto_91666 ) ) ( not ( = ?auto_91660 ?auto_91665 ) ) ( not ( = ?auto_91660 ?auto_91667 ) ) ( not ( = ?auto_91661 ?auto_91665 ) ) ( not ( = ?auto_91661 ?auto_91667 ) ) ( not ( = ?auto_91662 ?auto_91665 ) ) ( not ( = ?auto_91662 ?auto_91667 ) ) ( not ( = ?auto_91666 ?auto_91665 ) ) ( not ( = ?auto_91666 ?auto_91667 ) ) ( not ( = ?auto_91665 ?auto_91667 ) ) ( ON ?auto_91665 ?auto_91666 ) ( not ( = ?auto_91664 ?auto_91667 ) ) ( not ( = ?auto_91660 ?auto_91664 ) ) ( not ( = ?auto_91661 ?auto_91664 ) ) ( not ( = ?auto_91662 ?auto_91664 ) ) ( not ( = ?auto_91666 ?auto_91664 ) ) ( not ( = ?auto_91665 ?auto_91664 ) ) ( ON ?auto_91664 ?auto_91663 ) ( CLEAR ?auto_91664 ) ( not ( = ?auto_91660 ?auto_91663 ) ) ( not ( = ?auto_91661 ?auto_91663 ) ) ( not ( = ?auto_91662 ?auto_91663 ) ) ( not ( = ?auto_91666 ?auto_91663 ) ) ( not ( = ?auto_91665 ?auto_91663 ) ) ( not ( = ?auto_91667 ?auto_91663 ) ) ( not ( = ?auto_91664 ?auto_91663 ) ) ( HOLDING ?auto_91667 ) ( CLEAR ?auto_91665 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91660 ?auto_91661 ?auto_91662 ?auto_91666 ?auto_91665 ?auto_91667 )
      ( MAKE-3PILE ?auto_91660 ?auto_91661 ?auto_91662 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91668 - BLOCK
      ?auto_91669 - BLOCK
      ?auto_91670 - BLOCK
    )
    :vars
    (
      ?auto_91673 - BLOCK
      ?auto_91674 - BLOCK
      ?auto_91671 - BLOCK
      ?auto_91672 - BLOCK
      ?auto_91675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91673 ?auto_91670 ) ( ON-TABLE ?auto_91668 ) ( ON ?auto_91669 ?auto_91668 ) ( ON ?auto_91670 ?auto_91669 ) ( not ( = ?auto_91668 ?auto_91669 ) ) ( not ( = ?auto_91668 ?auto_91670 ) ) ( not ( = ?auto_91668 ?auto_91673 ) ) ( not ( = ?auto_91669 ?auto_91670 ) ) ( not ( = ?auto_91669 ?auto_91673 ) ) ( not ( = ?auto_91670 ?auto_91673 ) ) ( not ( = ?auto_91668 ?auto_91674 ) ) ( not ( = ?auto_91668 ?auto_91671 ) ) ( not ( = ?auto_91669 ?auto_91674 ) ) ( not ( = ?auto_91669 ?auto_91671 ) ) ( not ( = ?auto_91670 ?auto_91674 ) ) ( not ( = ?auto_91670 ?auto_91671 ) ) ( not ( = ?auto_91673 ?auto_91674 ) ) ( not ( = ?auto_91673 ?auto_91671 ) ) ( not ( = ?auto_91674 ?auto_91671 ) ) ( ON ?auto_91674 ?auto_91673 ) ( not ( = ?auto_91672 ?auto_91671 ) ) ( not ( = ?auto_91668 ?auto_91672 ) ) ( not ( = ?auto_91669 ?auto_91672 ) ) ( not ( = ?auto_91670 ?auto_91672 ) ) ( not ( = ?auto_91673 ?auto_91672 ) ) ( not ( = ?auto_91674 ?auto_91672 ) ) ( ON ?auto_91672 ?auto_91675 ) ( not ( = ?auto_91668 ?auto_91675 ) ) ( not ( = ?auto_91669 ?auto_91675 ) ) ( not ( = ?auto_91670 ?auto_91675 ) ) ( not ( = ?auto_91673 ?auto_91675 ) ) ( not ( = ?auto_91674 ?auto_91675 ) ) ( not ( = ?auto_91671 ?auto_91675 ) ) ( not ( = ?auto_91672 ?auto_91675 ) ) ( CLEAR ?auto_91674 ) ( ON ?auto_91671 ?auto_91672 ) ( CLEAR ?auto_91671 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91675 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91675 ?auto_91672 )
      ( MAKE-3PILE ?auto_91668 ?auto_91669 ?auto_91670 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91676 - BLOCK
      ?auto_91677 - BLOCK
      ?auto_91678 - BLOCK
    )
    :vars
    (
      ?auto_91682 - BLOCK
      ?auto_91681 - BLOCK
      ?auto_91680 - BLOCK
      ?auto_91679 - BLOCK
      ?auto_91683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91682 ?auto_91678 ) ( ON-TABLE ?auto_91676 ) ( ON ?auto_91677 ?auto_91676 ) ( ON ?auto_91678 ?auto_91677 ) ( not ( = ?auto_91676 ?auto_91677 ) ) ( not ( = ?auto_91676 ?auto_91678 ) ) ( not ( = ?auto_91676 ?auto_91682 ) ) ( not ( = ?auto_91677 ?auto_91678 ) ) ( not ( = ?auto_91677 ?auto_91682 ) ) ( not ( = ?auto_91678 ?auto_91682 ) ) ( not ( = ?auto_91676 ?auto_91681 ) ) ( not ( = ?auto_91676 ?auto_91680 ) ) ( not ( = ?auto_91677 ?auto_91681 ) ) ( not ( = ?auto_91677 ?auto_91680 ) ) ( not ( = ?auto_91678 ?auto_91681 ) ) ( not ( = ?auto_91678 ?auto_91680 ) ) ( not ( = ?auto_91682 ?auto_91681 ) ) ( not ( = ?auto_91682 ?auto_91680 ) ) ( not ( = ?auto_91681 ?auto_91680 ) ) ( not ( = ?auto_91679 ?auto_91680 ) ) ( not ( = ?auto_91676 ?auto_91679 ) ) ( not ( = ?auto_91677 ?auto_91679 ) ) ( not ( = ?auto_91678 ?auto_91679 ) ) ( not ( = ?auto_91682 ?auto_91679 ) ) ( not ( = ?auto_91681 ?auto_91679 ) ) ( ON ?auto_91679 ?auto_91683 ) ( not ( = ?auto_91676 ?auto_91683 ) ) ( not ( = ?auto_91677 ?auto_91683 ) ) ( not ( = ?auto_91678 ?auto_91683 ) ) ( not ( = ?auto_91682 ?auto_91683 ) ) ( not ( = ?auto_91681 ?auto_91683 ) ) ( not ( = ?auto_91680 ?auto_91683 ) ) ( not ( = ?auto_91679 ?auto_91683 ) ) ( ON ?auto_91680 ?auto_91679 ) ( CLEAR ?auto_91680 ) ( ON-TABLE ?auto_91683 ) ( HOLDING ?auto_91681 ) ( CLEAR ?auto_91682 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91676 ?auto_91677 ?auto_91678 ?auto_91682 ?auto_91681 )
      ( MAKE-3PILE ?auto_91676 ?auto_91677 ?auto_91678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91684 - BLOCK
      ?auto_91685 - BLOCK
      ?auto_91686 - BLOCK
    )
    :vars
    (
      ?auto_91691 - BLOCK
      ?auto_91688 - BLOCK
      ?auto_91687 - BLOCK
      ?auto_91689 - BLOCK
      ?auto_91690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91691 ?auto_91686 ) ( ON-TABLE ?auto_91684 ) ( ON ?auto_91685 ?auto_91684 ) ( ON ?auto_91686 ?auto_91685 ) ( not ( = ?auto_91684 ?auto_91685 ) ) ( not ( = ?auto_91684 ?auto_91686 ) ) ( not ( = ?auto_91684 ?auto_91691 ) ) ( not ( = ?auto_91685 ?auto_91686 ) ) ( not ( = ?auto_91685 ?auto_91691 ) ) ( not ( = ?auto_91686 ?auto_91691 ) ) ( not ( = ?auto_91684 ?auto_91688 ) ) ( not ( = ?auto_91684 ?auto_91687 ) ) ( not ( = ?auto_91685 ?auto_91688 ) ) ( not ( = ?auto_91685 ?auto_91687 ) ) ( not ( = ?auto_91686 ?auto_91688 ) ) ( not ( = ?auto_91686 ?auto_91687 ) ) ( not ( = ?auto_91691 ?auto_91688 ) ) ( not ( = ?auto_91691 ?auto_91687 ) ) ( not ( = ?auto_91688 ?auto_91687 ) ) ( not ( = ?auto_91689 ?auto_91687 ) ) ( not ( = ?auto_91684 ?auto_91689 ) ) ( not ( = ?auto_91685 ?auto_91689 ) ) ( not ( = ?auto_91686 ?auto_91689 ) ) ( not ( = ?auto_91691 ?auto_91689 ) ) ( not ( = ?auto_91688 ?auto_91689 ) ) ( ON ?auto_91689 ?auto_91690 ) ( not ( = ?auto_91684 ?auto_91690 ) ) ( not ( = ?auto_91685 ?auto_91690 ) ) ( not ( = ?auto_91686 ?auto_91690 ) ) ( not ( = ?auto_91691 ?auto_91690 ) ) ( not ( = ?auto_91688 ?auto_91690 ) ) ( not ( = ?auto_91687 ?auto_91690 ) ) ( not ( = ?auto_91689 ?auto_91690 ) ) ( ON ?auto_91687 ?auto_91689 ) ( ON-TABLE ?auto_91690 ) ( CLEAR ?auto_91691 ) ( ON ?auto_91688 ?auto_91687 ) ( CLEAR ?auto_91688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91690 ?auto_91689 ?auto_91687 )
      ( MAKE-3PILE ?auto_91684 ?auto_91685 ?auto_91686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91708 - BLOCK
      ?auto_91709 - BLOCK
      ?auto_91710 - BLOCK
    )
    :vars
    (
      ?auto_91711 - BLOCK
      ?auto_91712 - BLOCK
      ?auto_91713 - BLOCK
      ?auto_91714 - BLOCK
      ?auto_91715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91708 ) ( ON ?auto_91709 ?auto_91708 ) ( not ( = ?auto_91708 ?auto_91709 ) ) ( not ( = ?auto_91708 ?auto_91710 ) ) ( not ( = ?auto_91708 ?auto_91711 ) ) ( not ( = ?auto_91709 ?auto_91710 ) ) ( not ( = ?auto_91709 ?auto_91711 ) ) ( not ( = ?auto_91710 ?auto_91711 ) ) ( not ( = ?auto_91708 ?auto_91712 ) ) ( not ( = ?auto_91708 ?auto_91713 ) ) ( not ( = ?auto_91709 ?auto_91712 ) ) ( not ( = ?auto_91709 ?auto_91713 ) ) ( not ( = ?auto_91710 ?auto_91712 ) ) ( not ( = ?auto_91710 ?auto_91713 ) ) ( not ( = ?auto_91711 ?auto_91712 ) ) ( not ( = ?auto_91711 ?auto_91713 ) ) ( not ( = ?auto_91712 ?auto_91713 ) ) ( not ( = ?auto_91714 ?auto_91713 ) ) ( not ( = ?auto_91708 ?auto_91714 ) ) ( not ( = ?auto_91709 ?auto_91714 ) ) ( not ( = ?auto_91710 ?auto_91714 ) ) ( not ( = ?auto_91711 ?auto_91714 ) ) ( not ( = ?auto_91712 ?auto_91714 ) ) ( ON ?auto_91714 ?auto_91715 ) ( not ( = ?auto_91708 ?auto_91715 ) ) ( not ( = ?auto_91709 ?auto_91715 ) ) ( not ( = ?auto_91710 ?auto_91715 ) ) ( not ( = ?auto_91711 ?auto_91715 ) ) ( not ( = ?auto_91712 ?auto_91715 ) ) ( not ( = ?auto_91713 ?auto_91715 ) ) ( not ( = ?auto_91714 ?auto_91715 ) ) ( ON ?auto_91713 ?auto_91714 ) ( ON-TABLE ?auto_91715 ) ( ON ?auto_91712 ?auto_91713 ) ( ON ?auto_91711 ?auto_91712 ) ( CLEAR ?auto_91711 ) ( HOLDING ?auto_91710 ) ( CLEAR ?auto_91709 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91708 ?auto_91709 ?auto_91710 ?auto_91711 )
      ( MAKE-3PILE ?auto_91708 ?auto_91709 ?auto_91710 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91716 - BLOCK
      ?auto_91717 - BLOCK
      ?auto_91718 - BLOCK
    )
    :vars
    (
      ?auto_91722 - BLOCK
      ?auto_91723 - BLOCK
      ?auto_91721 - BLOCK
      ?auto_91719 - BLOCK
      ?auto_91720 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91716 ) ( ON ?auto_91717 ?auto_91716 ) ( not ( = ?auto_91716 ?auto_91717 ) ) ( not ( = ?auto_91716 ?auto_91718 ) ) ( not ( = ?auto_91716 ?auto_91722 ) ) ( not ( = ?auto_91717 ?auto_91718 ) ) ( not ( = ?auto_91717 ?auto_91722 ) ) ( not ( = ?auto_91718 ?auto_91722 ) ) ( not ( = ?auto_91716 ?auto_91723 ) ) ( not ( = ?auto_91716 ?auto_91721 ) ) ( not ( = ?auto_91717 ?auto_91723 ) ) ( not ( = ?auto_91717 ?auto_91721 ) ) ( not ( = ?auto_91718 ?auto_91723 ) ) ( not ( = ?auto_91718 ?auto_91721 ) ) ( not ( = ?auto_91722 ?auto_91723 ) ) ( not ( = ?auto_91722 ?auto_91721 ) ) ( not ( = ?auto_91723 ?auto_91721 ) ) ( not ( = ?auto_91719 ?auto_91721 ) ) ( not ( = ?auto_91716 ?auto_91719 ) ) ( not ( = ?auto_91717 ?auto_91719 ) ) ( not ( = ?auto_91718 ?auto_91719 ) ) ( not ( = ?auto_91722 ?auto_91719 ) ) ( not ( = ?auto_91723 ?auto_91719 ) ) ( ON ?auto_91719 ?auto_91720 ) ( not ( = ?auto_91716 ?auto_91720 ) ) ( not ( = ?auto_91717 ?auto_91720 ) ) ( not ( = ?auto_91718 ?auto_91720 ) ) ( not ( = ?auto_91722 ?auto_91720 ) ) ( not ( = ?auto_91723 ?auto_91720 ) ) ( not ( = ?auto_91721 ?auto_91720 ) ) ( not ( = ?auto_91719 ?auto_91720 ) ) ( ON ?auto_91721 ?auto_91719 ) ( ON-TABLE ?auto_91720 ) ( ON ?auto_91723 ?auto_91721 ) ( ON ?auto_91722 ?auto_91723 ) ( CLEAR ?auto_91717 ) ( ON ?auto_91718 ?auto_91722 ) ( CLEAR ?auto_91718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91720 ?auto_91719 ?auto_91721 ?auto_91723 ?auto_91722 )
      ( MAKE-3PILE ?auto_91716 ?auto_91717 ?auto_91718 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91724 - BLOCK
      ?auto_91725 - BLOCK
      ?auto_91726 - BLOCK
    )
    :vars
    (
      ?auto_91728 - BLOCK
      ?auto_91727 - BLOCK
      ?auto_91730 - BLOCK
      ?auto_91729 - BLOCK
      ?auto_91731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91724 ) ( not ( = ?auto_91724 ?auto_91725 ) ) ( not ( = ?auto_91724 ?auto_91726 ) ) ( not ( = ?auto_91724 ?auto_91728 ) ) ( not ( = ?auto_91725 ?auto_91726 ) ) ( not ( = ?auto_91725 ?auto_91728 ) ) ( not ( = ?auto_91726 ?auto_91728 ) ) ( not ( = ?auto_91724 ?auto_91727 ) ) ( not ( = ?auto_91724 ?auto_91730 ) ) ( not ( = ?auto_91725 ?auto_91727 ) ) ( not ( = ?auto_91725 ?auto_91730 ) ) ( not ( = ?auto_91726 ?auto_91727 ) ) ( not ( = ?auto_91726 ?auto_91730 ) ) ( not ( = ?auto_91728 ?auto_91727 ) ) ( not ( = ?auto_91728 ?auto_91730 ) ) ( not ( = ?auto_91727 ?auto_91730 ) ) ( not ( = ?auto_91729 ?auto_91730 ) ) ( not ( = ?auto_91724 ?auto_91729 ) ) ( not ( = ?auto_91725 ?auto_91729 ) ) ( not ( = ?auto_91726 ?auto_91729 ) ) ( not ( = ?auto_91728 ?auto_91729 ) ) ( not ( = ?auto_91727 ?auto_91729 ) ) ( ON ?auto_91729 ?auto_91731 ) ( not ( = ?auto_91724 ?auto_91731 ) ) ( not ( = ?auto_91725 ?auto_91731 ) ) ( not ( = ?auto_91726 ?auto_91731 ) ) ( not ( = ?auto_91728 ?auto_91731 ) ) ( not ( = ?auto_91727 ?auto_91731 ) ) ( not ( = ?auto_91730 ?auto_91731 ) ) ( not ( = ?auto_91729 ?auto_91731 ) ) ( ON ?auto_91730 ?auto_91729 ) ( ON-TABLE ?auto_91731 ) ( ON ?auto_91727 ?auto_91730 ) ( ON ?auto_91728 ?auto_91727 ) ( ON ?auto_91726 ?auto_91728 ) ( CLEAR ?auto_91726 ) ( HOLDING ?auto_91725 ) ( CLEAR ?auto_91724 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91724 ?auto_91725 )
      ( MAKE-3PILE ?auto_91724 ?auto_91725 ?auto_91726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91732 - BLOCK
      ?auto_91733 - BLOCK
      ?auto_91734 - BLOCK
    )
    :vars
    (
      ?auto_91735 - BLOCK
      ?auto_91736 - BLOCK
      ?auto_91739 - BLOCK
      ?auto_91737 - BLOCK
      ?auto_91738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91732 ) ( not ( = ?auto_91732 ?auto_91733 ) ) ( not ( = ?auto_91732 ?auto_91734 ) ) ( not ( = ?auto_91732 ?auto_91735 ) ) ( not ( = ?auto_91733 ?auto_91734 ) ) ( not ( = ?auto_91733 ?auto_91735 ) ) ( not ( = ?auto_91734 ?auto_91735 ) ) ( not ( = ?auto_91732 ?auto_91736 ) ) ( not ( = ?auto_91732 ?auto_91739 ) ) ( not ( = ?auto_91733 ?auto_91736 ) ) ( not ( = ?auto_91733 ?auto_91739 ) ) ( not ( = ?auto_91734 ?auto_91736 ) ) ( not ( = ?auto_91734 ?auto_91739 ) ) ( not ( = ?auto_91735 ?auto_91736 ) ) ( not ( = ?auto_91735 ?auto_91739 ) ) ( not ( = ?auto_91736 ?auto_91739 ) ) ( not ( = ?auto_91737 ?auto_91739 ) ) ( not ( = ?auto_91732 ?auto_91737 ) ) ( not ( = ?auto_91733 ?auto_91737 ) ) ( not ( = ?auto_91734 ?auto_91737 ) ) ( not ( = ?auto_91735 ?auto_91737 ) ) ( not ( = ?auto_91736 ?auto_91737 ) ) ( ON ?auto_91737 ?auto_91738 ) ( not ( = ?auto_91732 ?auto_91738 ) ) ( not ( = ?auto_91733 ?auto_91738 ) ) ( not ( = ?auto_91734 ?auto_91738 ) ) ( not ( = ?auto_91735 ?auto_91738 ) ) ( not ( = ?auto_91736 ?auto_91738 ) ) ( not ( = ?auto_91739 ?auto_91738 ) ) ( not ( = ?auto_91737 ?auto_91738 ) ) ( ON ?auto_91739 ?auto_91737 ) ( ON-TABLE ?auto_91738 ) ( ON ?auto_91736 ?auto_91739 ) ( ON ?auto_91735 ?auto_91736 ) ( ON ?auto_91734 ?auto_91735 ) ( CLEAR ?auto_91732 ) ( ON ?auto_91733 ?auto_91734 ) ( CLEAR ?auto_91733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91738 ?auto_91737 ?auto_91739 ?auto_91736 ?auto_91735 ?auto_91734 )
      ( MAKE-3PILE ?auto_91732 ?auto_91733 ?auto_91734 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91740 - BLOCK
      ?auto_91741 - BLOCK
      ?auto_91742 - BLOCK
    )
    :vars
    (
      ?auto_91745 - BLOCK
      ?auto_91746 - BLOCK
      ?auto_91743 - BLOCK
      ?auto_91747 - BLOCK
      ?auto_91744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91740 ?auto_91741 ) ) ( not ( = ?auto_91740 ?auto_91742 ) ) ( not ( = ?auto_91740 ?auto_91745 ) ) ( not ( = ?auto_91741 ?auto_91742 ) ) ( not ( = ?auto_91741 ?auto_91745 ) ) ( not ( = ?auto_91742 ?auto_91745 ) ) ( not ( = ?auto_91740 ?auto_91746 ) ) ( not ( = ?auto_91740 ?auto_91743 ) ) ( not ( = ?auto_91741 ?auto_91746 ) ) ( not ( = ?auto_91741 ?auto_91743 ) ) ( not ( = ?auto_91742 ?auto_91746 ) ) ( not ( = ?auto_91742 ?auto_91743 ) ) ( not ( = ?auto_91745 ?auto_91746 ) ) ( not ( = ?auto_91745 ?auto_91743 ) ) ( not ( = ?auto_91746 ?auto_91743 ) ) ( not ( = ?auto_91747 ?auto_91743 ) ) ( not ( = ?auto_91740 ?auto_91747 ) ) ( not ( = ?auto_91741 ?auto_91747 ) ) ( not ( = ?auto_91742 ?auto_91747 ) ) ( not ( = ?auto_91745 ?auto_91747 ) ) ( not ( = ?auto_91746 ?auto_91747 ) ) ( ON ?auto_91747 ?auto_91744 ) ( not ( = ?auto_91740 ?auto_91744 ) ) ( not ( = ?auto_91741 ?auto_91744 ) ) ( not ( = ?auto_91742 ?auto_91744 ) ) ( not ( = ?auto_91745 ?auto_91744 ) ) ( not ( = ?auto_91746 ?auto_91744 ) ) ( not ( = ?auto_91743 ?auto_91744 ) ) ( not ( = ?auto_91747 ?auto_91744 ) ) ( ON ?auto_91743 ?auto_91747 ) ( ON-TABLE ?auto_91744 ) ( ON ?auto_91746 ?auto_91743 ) ( ON ?auto_91745 ?auto_91746 ) ( ON ?auto_91742 ?auto_91745 ) ( ON ?auto_91741 ?auto_91742 ) ( CLEAR ?auto_91741 ) ( HOLDING ?auto_91740 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91740 )
      ( MAKE-3PILE ?auto_91740 ?auto_91741 ?auto_91742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91748 - BLOCK
      ?auto_91749 - BLOCK
      ?auto_91750 - BLOCK
    )
    :vars
    (
      ?auto_91753 - BLOCK
      ?auto_91754 - BLOCK
      ?auto_91752 - BLOCK
      ?auto_91755 - BLOCK
      ?auto_91751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91748 ?auto_91749 ) ) ( not ( = ?auto_91748 ?auto_91750 ) ) ( not ( = ?auto_91748 ?auto_91753 ) ) ( not ( = ?auto_91749 ?auto_91750 ) ) ( not ( = ?auto_91749 ?auto_91753 ) ) ( not ( = ?auto_91750 ?auto_91753 ) ) ( not ( = ?auto_91748 ?auto_91754 ) ) ( not ( = ?auto_91748 ?auto_91752 ) ) ( not ( = ?auto_91749 ?auto_91754 ) ) ( not ( = ?auto_91749 ?auto_91752 ) ) ( not ( = ?auto_91750 ?auto_91754 ) ) ( not ( = ?auto_91750 ?auto_91752 ) ) ( not ( = ?auto_91753 ?auto_91754 ) ) ( not ( = ?auto_91753 ?auto_91752 ) ) ( not ( = ?auto_91754 ?auto_91752 ) ) ( not ( = ?auto_91755 ?auto_91752 ) ) ( not ( = ?auto_91748 ?auto_91755 ) ) ( not ( = ?auto_91749 ?auto_91755 ) ) ( not ( = ?auto_91750 ?auto_91755 ) ) ( not ( = ?auto_91753 ?auto_91755 ) ) ( not ( = ?auto_91754 ?auto_91755 ) ) ( ON ?auto_91755 ?auto_91751 ) ( not ( = ?auto_91748 ?auto_91751 ) ) ( not ( = ?auto_91749 ?auto_91751 ) ) ( not ( = ?auto_91750 ?auto_91751 ) ) ( not ( = ?auto_91753 ?auto_91751 ) ) ( not ( = ?auto_91754 ?auto_91751 ) ) ( not ( = ?auto_91752 ?auto_91751 ) ) ( not ( = ?auto_91755 ?auto_91751 ) ) ( ON ?auto_91752 ?auto_91755 ) ( ON-TABLE ?auto_91751 ) ( ON ?auto_91754 ?auto_91752 ) ( ON ?auto_91753 ?auto_91754 ) ( ON ?auto_91750 ?auto_91753 ) ( ON ?auto_91749 ?auto_91750 ) ( ON ?auto_91748 ?auto_91749 ) ( CLEAR ?auto_91748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91751 ?auto_91755 ?auto_91752 ?auto_91754 ?auto_91753 ?auto_91750 ?auto_91749 )
      ( MAKE-3PILE ?auto_91748 ?auto_91749 ?auto_91750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91760 - BLOCK
      ?auto_91761 - BLOCK
      ?auto_91762 - BLOCK
      ?auto_91763 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91763 ) ( CLEAR ?auto_91762 ) ( ON-TABLE ?auto_91760 ) ( ON ?auto_91761 ?auto_91760 ) ( ON ?auto_91762 ?auto_91761 ) ( not ( = ?auto_91760 ?auto_91761 ) ) ( not ( = ?auto_91760 ?auto_91762 ) ) ( not ( = ?auto_91760 ?auto_91763 ) ) ( not ( = ?auto_91761 ?auto_91762 ) ) ( not ( = ?auto_91761 ?auto_91763 ) ) ( not ( = ?auto_91762 ?auto_91763 ) ) )
    :subtasks
    ( ( !STACK ?auto_91763 ?auto_91762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91764 - BLOCK
      ?auto_91765 - BLOCK
      ?auto_91766 - BLOCK
      ?auto_91767 - BLOCK
    )
    :vars
    (
      ?auto_91768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91766 ) ( ON-TABLE ?auto_91764 ) ( ON ?auto_91765 ?auto_91764 ) ( ON ?auto_91766 ?auto_91765 ) ( not ( = ?auto_91764 ?auto_91765 ) ) ( not ( = ?auto_91764 ?auto_91766 ) ) ( not ( = ?auto_91764 ?auto_91767 ) ) ( not ( = ?auto_91765 ?auto_91766 ) ) ( not ( = ?auto_91765 ?auto_91767 ) ) ( not ( = ?auto_91766 ?auto_91767 ) ) ( ON ?auto_91767 ?auto_91768 ) ( CLEAR ?auto_91767 ) ( HAND-EMPTY ) ( not ( = ?auto_91764 ?auto_91768 ) ) ( not ( = ?auto_91765 ?auto_91768 ) ) ( not ( = ?auto_91766 ?auto_91768 ) ) ( not ( = ?auto_91767 ?auto_91768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91767 ?auto_91768 )
      ( MAKE-4PILE ?auto_91764 ?auto_91765 ?auto_91766 ?auto_91767 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91769 - BLOCK
      ?auto_91770 - BLOCK
      ?auto_91771 - BLOCK
      ?auto_91772 - BLOCK
    )
    :vars
    (
      ?auto_91773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91769 ) ( ON ?auto_91770 ?auto_91769 ) ( not ( = ?auto_91769 ?auto_91770 ) ) ( not ( = ?auto_91769 ?auto_91771 ) ) ( not ( = ?auto_91769 ?auto_91772 ) ) ( not ( = ?auto_91770 ?auto_91771 ) ) ( not ( = ?auto_91770 ?auto_91772 ) ) ( not ( = ?auto_91771 ?auto_91772 ) ) ( ON ?auto_91772 ?auto_91773 ) ( CLEAR ?auto_91772 ) ( not ( = ?auto_91769 ?auto_91773 ) ) ( not ( = ?auto_91770 ?auto_91773 ) ) ( not ( = ?auto_91771 ?auto_91773 ) ) ( not ( = ?auto_91772 ?auto_91773 ) ) ( HOLDING ?auto_91771 ) ( CLEAR ?auto_91770 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91769 ?auto_91770 ?auto_91771 )
      ( MAKE-4PILE ?auto_91769 ?auto_91770 ?auto_91771 ?auto_91772 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91774 - BLOCK
      ?auto_91775 - BLOCK
      ?auto_91776 - BLOCK
      ?auto_91777 - BLOCK
    )
    :vars
    (
      ?auto_91778 - BLOCK
      ?auto_91779 - BLOCK
      ?auto_91780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91774 ) ( ON ?auto_91775 ?auto_91774 ) ( not ( = ?auto_91774 ?auto_91775 ) ) ( not ( = ?auto_91774 ?auto_91776 ) ) ( not ( = ?auto_91774 ?auto_91777 ) ) ( not ( = ?auto_91775 ?auto_91776 ) ) ( not ( = ?auto_91775 ?auto_91777 ) ) ( not ( = ?auto_91776 ?auto_91777 ) ) ( ON ?auto_91777 ?auto_91778 ) ( not ( = ?auto_91774 ?auto_91778 ) ) ( not ( = ?auto_91775 ?auto_91778 ) ) ( not ( = ?auto_91776 ?auto_91778 ) ) ( not ( = ?auto_91777 ?auto_91778 ) ) ( CLEAR ?auto_91775 ) ( ON ?auto_91776 ?auto_91777 ) ( CLEAR ?auto_91776 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91779 ) ( ON ?auto_91780 ?auto_91779 ) ( ON ?auto_91778 ?auto_91780 ) ( not ( = ?auto_91779 ?auto_91780 ) ) ( not ( = ?auto_91779 ?auto_91778 ) ) ( not ( = ?auto_91779 ?auto_91777 ) ) ( not ( = ?auto_91779 ?auto_91776 ) ) ( not ( = ?auto_91780 ?auto_91778 ) ) ( not ( = ?auto_91780 ?auto_91777 ) ) ( not ( = ?auto_91780 ?auto_91776 ) ) ( not ( = ?auto_91774 ?auto_91779 ) ) ( not ( = ?auto_91774 ?auto_91780 ) ) ( not ( = ?auto_91775 ?auto_91779 ) ) ( not ( = ?auto_91775 ?auto_91780 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91779 ?auto_91780 ?auto_91778 ?auto_91777 )
      ( MAKE-4PILE ?auto_91774 ?auto_91775 ?auto_91776 ?auto_91777 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91781 - BLOCK
      ?auto_91782 - BLOCK
      ?auto_91783 - BLOCK
      ?auto_91784 - BLOCK
    )
    :vars
    (
      ?auto_91785 - BLOCK
      ?auto_91787 - BLOCK
      ?auto_91786 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91781 ) ( not ( = ?auto_91781 ?auto_91782 ) ) ( not ( = ?auto_91781 ?auto_91783 ) ) ( not ( = ?auto_91781 ?auto_91784 ) ) ( not ( = ?auto_91782 ?auto_91783 ) ) ( not ( = ?auto_91782 ?auto_91784 ) ) ( not ( = ?auto_91783 ?auto_91784 ) ) ( ON ?auto_91784 ?auto_91785 ) ( not ( = ?auto_91781 ?auto_91785 ) ) ( not ( = ?auto_91782 ?auto_91785 ) ) ( not ( = ?auto_91783 ?auto_91785 ) ) ( not ( = ?auto_91784 ?auto_91785 ) ) ( ON ?auto_91783 ?auto_91784 ) ( CLEAR ?auto_91783 ) ( ON-TABLE ?auto_91787 ) ( ON ?auto_91786 ?auto_91787 ) ( ON ?auto_91785 ?auto_91786 ) ( not ( = ?auto_91787 ?auto_91786 ) ) ( not ( = ?auto_91787 ?auto_91785 ) ) ( not ( = ?auto_91787 ?auto_91784 ) ) ( not ( = ?auto_91787 ?auto_91783 ) ) ( not ( = ?auto_91786 ?auto_91785 ) ) ( not ( = ?auto_91786 ?auto_91784 ) ) ( not ( = ?auto_91786 ?auto_91783 ) ) ( not ( = ?auto_91781 ?auto_91787 ) ) ( not ( = ?auto_91781 ?auto_91786 ) ) ( not ( = ?auto_91782 ?auto_91787 ) ) ( not ( = ?auto_91782 ?auto_91786 ) ) ( HOLDING ?auto_91782 ) ( CLEAR ?auto_91781 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91781 ?auto_91782 )
      ( MAKE-4PILE ?auto_91781 ?auto_91782 ?auto_91783 ?auto_91784 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91788 - BLOCK
      ?auto_91789 - BLOCK
      ?auto_91790 - BLOCK
      ?auto_91791 - BLOCK
    )
    :vars
    (
      ?auto_91793 - BLOCK
      ?auto_91792 - BLOCK
      ?auto_91794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91788 ) ( not ( = ?auto_91788 ?auto_91789 ) ) ( not ( = ?auto_91788 ?auto_91790 ) ) ( not ( = ?auto_91788 ?auto_91791 ) ) ( not ( = ?auto_91789 ?auto_91790 ) ) ( not ( = ?auto_91789 ?auto_91791 ) ) ( not ( = ?auto_91790 ?auto_91791 ) ) ( ON ?auto_91791 ?auto_91793 ) ( not ( = ?auto_91788 ?auto_91793 ) ) ( not ( = ?auto_91789 ?auto_91793 ) ) ( not ( = ?auto_91790 ?auto_91793 ) ) ( not ( = ?auto_91791 ?auto_91793 ) ) ( ON ?auto_91790 ?auto_91791 ) ( ON-TABLE ?auto_91792 ) ( ON ?auto_91794 ?auto_91792 ) ( ON ?auto_91793 ?auto_91794 ) ( not ( = ?auto_91792 ?auto_91794 ) ) ( not ( = ?auto_91792 ?auto_91793 ) ) ( not ( = ?auto_91792 ?auto_91791 ) ) ( not ( = ?auto_91792 ?auto_91790 ) ) ( not ( = ?auto_91794 ?auto_91793 ) ) ( not ( = ?auto_91794 ?auto_91791 ) ) ( not ( = ?auto_91794 ?auto_91790 ) ) ( not ( = ?auto_91788 ?auto_91792 ) ) ( not ( = ?auto_91788 ?auto_91794 ) ) ( not ( = ?auto_91789 ?auto_91792 ) ) ( not ( = ?auto_91789 ?auto_91794 ) ) ( CLEAR ?auto_91788 ) ( ON ?auto_91789 ?auto_91790 ) ( CLEAR ?auto_91789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91792 ?auto_91794 ?auto_91793 ?auto_91791 ?auto_91790 )
      ( MAKE-4PILE ?auto_91788 ?auto_91789 ?auto_91790 ?auto_91791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91795 - BLOCK
      ?auto_91796 - BLOCK
      ?auto_91797 - BLOCK
      ?auto_91798 - BLOCK
    )
    :vars
    (
      ?auto_91800 - BLOCK
      ?auto_91801 - BLOCK
      ?auto_91799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91795 ?auto_91796 ) ) ( not ( = ?auto_91795 ?auto_91797 ) ) ( not ( = ?auto_91795 ?auto_91798 ) ) ( not ( = ?auto_91796 ?auto_91797 ) ) ( not ( = ?auto_91796 ?auto_91798 ) ) ( not ( = ?auto_91797 ?auto_91798 ) ) ( ON ?auto_91798 ?auto_91800 ) ( not ( = ?auto_91795 ?auto_91800 ) ) ( not ( = ?auto_91796 ?auto_91800 ) ) ( not ( = ?auto_91797 ?auto_91800 ) ) ( not ( = ?auto_91798 ?auto_91800 ) ) ( ON ?auto_91797 ?auto_91798 ) ( ON-TABLE ?auto_91801 ) ( ON ?auto_91799 ?auto_91801 ) ( ON ?auto_91800 ?auto_91799 ) ( not ( = ?auto_91801 ?auto_91799 ) ) ( not ( = ?auto_91801 ?auto_91800 ) ) ( not ( = ?auto_91801 ?auto_91798 ) ) ( not ( = ?auto_91801 ?auto_91797 ) ) ( not ( = ?auto_91799 ?auto_91800 ) ) ( not ( = ?auto_91799 ?auto_91798 ) ) ( not ( = ?auto_91799 ?auto_91797 ) ) ( not ( = ?auto_91795 ?auto_91801 ) ) ( not ( = ?auto_91795 ?auto_91799 ) ) ( not ( = ?auto_91796 ?auto_91801 ) ) ( not ( = ?auto_91796 ?auto_91799 ) ) ( ON ?auto_91796 ?auto_91797 ) ( CLEAR ?auto_91796 ) ( HOLDING ?auto_91795 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91795 )
      ( MAKE-4PILE ?auto_91795 ?auto_91796 ?auto_91797 ?auto_91798 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91802 - BLOCK
      ?auto_91803 - BLOCK
      ?auto_91804 - BLOCK
      ?auto_91805 - BLOCK
    )
    :vars
    (
      ?auto_91808 - BLOCK
      ?auto_91807 - BLOCK
      ?auto_91806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91802 ?auto_91803 ) ) ( not ( = ?auto_91802 ?auto_91804 ) ) ( not ( = ?auto_91802 ?auto_91805 ) ) ( not ( = ?auto_91803 ?auto_91804 ) ) ( not ( = ?auto_91803 ?auto_91805 ) ) ( not ( = ?auto_91804 ?auto_91805 ) ) ( ON ?auto_91805 ?auto_91808 ) ( not ( = ?auto_91802 ?auto_91808 ) ) ( not ( = ?auto_91803 ?auto_91808 ) ) ( not ( = ?auto_91804 ?auto_91808 ) ) ( not ( = ?auto_91805 ?auto_91808 ) ) ( ON ?auto_91804 ?auto_91805 ) ( ON-TABLE ?auto_91807 ) ( ON ?auto_91806 ?auto_91807 ) ( ON ?auto_91808 ?auto_91806 ) ( not ( = ?auto_91807 ?auto_91806 ) ) ( not ( = ?auto_91807 ?auto_91808 ) ) ( not ( = ?auto_91807 ?auto_91805 ) ) ( not ( = ?auto_91807 ?auto_91804 ) ) ( not ( = ?auto_91806 ?auto_91808 ) ) ( not ( = ?auto_91806 ?auto_91805 ) ) ( not ( = ?auto_91806 ?auto_91804 ) ) ( not ( = ?auto_91802 ?auto_91807 ) ) ( not ( = ?auto_91802 ?auto_91806 ) ) ( not ( = ?auto_91803 ?auto_91807 ) ) ( not ( = ?auto_91803 ?auto_91806 ) ) ( ON ?auto_91803 ?auto_91804 ) ( ON ?auto_91802 ?auto_91803 ) ( CLEAR ?auto_91802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91807 ?auto_91806 ?auto_91808 ?auto_91805 ?auto_91804 ?auto_91803 )
      ( MAKE-4PILE ?auto_91802 ?auto_91803 ?auto_91804 ?auto_91805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91809 - BLOCK
      ?auto_91810 - BLOCK
      ?auto_91811 - BLOCK
      ?auto_91812 - BLOCK
    )
    :vars
    (
      ?auto_91815 - BLOCK
      ?auto_91814 - BLOCK
      ?auto_91813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91809 ?auto_91810 ) ) ( not ( = ?auto_91809 ?auto_91811 ) ) ( not ( = ?auto_91809 ?auto_91812 ) ) ( not ( = ?auto_91810 ?auto_91811 ) ) ( not ( = ?auto_91810 ?auto_91812 ) ) ( not ( = ?auto_91811 ?auto_91812 ) ) ( ON ?auto_91812 ?auto_91815 ) ( not ( = ?auto_91809 ?auto_91815 ) ) ( not ( = ?auto_91810 ?auto_91815 ) ) ( not ( = ?auto_91811 ?auto_91815 ) ) ( not ( = ?auto_91812 ?auto_91815 ) ) ( ON ?auto_91811 ?auto_91812 ) ( ON-TABLE ?auto_91814 ) ( ON ?auto_91813 ?auto_91814 ) ( ON ?auto_91815 ?auto_91813 ) ( not ( = ?auto_91814 ?auto_91813 ) ) ( not ( = ?auto_91814 ?auto_91815 ) ) ( not ( = ?auto_91814 ?auto_91812 ) ) ( not ( = ?auto_91814 ?auto_91811 ) ) ( not ( = ?auto_91813 ?auto_91815 ) ) ( not ( = ?auto_91813 ?auto_91812 ) ) ( not ( = ?auto_91813 ?auto_91811 ) ) ( not ( = ?auto_91809 ?auto_91814 ) ) ( not ( = ?auto_91809 ?auto_91813 ) ) ( not ( = ?auto_91810 ?auto_91814 ) ) ( not ( = ?auto_91810 ?auto_91813 ) ) ( ON ?auto_91810 ?auto_91811 ) ( HOLDING ?auto_91809 ) ( CLEAR ?auto_91810 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91814 ?auto_91813 ?auto_91815 ?auto_91812 ?auto_91811 ?auto_91810 ?auto_91809 )
      ( MAKE-4PILE ?auto_91809 ?auto_91810 ?auto_91811 ?auto_91812 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91816 - BLOCK
      ?auto_91817 - BLOCK
      ?auto_91818 - BLOCK
      ?auto_91819 - BLOCK
    )
    :vars
    (
      ?auto_91820 - BLOCK
      ?auto_91822 - BLOCK
      ?auto_91821 - BLOCK
      ?auto_91823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91816 ?auto_91817 ) ) ( not ( = ?auto_91816 ?auto_91818 ) ) ( not ( = ?auto_91816 ?auto_91819 ) ) ( not ( = ?auto_91817 ?auto_91818 ) ) ( not ( = ?auto_91817 ?auto_91819 ) ) ( not ( = ?auto_91818 ?auto_91819 ) ) ( ON ?auto_91819 ?auto_91820 ) ( not ( = ?auto_91816 ?auto_91820 ) ) ( not ( = ?auto_91817 ?auto_91820 ) ) ( not ( = ?auto_91818 ?auto_91820 ) ) ( not ( = ?auto_91819 ?auto_91820 ) ) ( ON ?auto_91818 ?auto_91819 ) ( ON-TABLE ?auto_91822 ) ( ON ?auto_91821 ?auto_91822 ) ( ON ?auto_91820 ?auto_91821 ) ( not ( = ?auto_91822 ?auto_91821 ) ) ( not ( = ?auto_91822 ?auto_91820 ) ) ( not ( = ?auto_91822 ?auto_91819 ) ) ( not ( = ?auto_91822 ?auto_91818 ) ) ( not ( = ?auto_91821 ?auto_91820 ) ) ( not ( = ?auto_91821 ?auto_91819 ) ) ( not ( = ?auto_91821 ?auto_91818 ) ) ( not ( = ?auto_91816 ?auto_91822 ) ) ( not ( = ?auto_91816 ?auto_91821 ) ) ( not ( = ?auto_91817 ?auto_91822 ) ) ( not ( = ?auto_91817 ?auto_91821 ) ) ( ON ?auto_91817 ?auto_91818 ) ( CLEAR ?auto_91817 ) ( ON ?auto_91816 ?auto_91823 ) ( CLEAR ?auto_91816 ) ( HAND-EMPTY ) ( not ( = ?auto_91816 ?auto_91823 ) ) ( not ( = ?auto_91817 ?auto_91823 ) ) ( not ( = ?auto_91818 ?auto_91823 ) ) ( not ( = ?auto_91819 ?auto_91823 ) ) ( not ( = ?auto_91820 ?auto_91823 ) ) ( not ( = ?auto_91822 ?auto_91823 ) ) ( not ( = ?auto_91821 ?auto_91823 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91816 ?auto_91823 )
      ( MAKE-4PILE ?auto_91816 ?auto_91817 ?auto_91818 ?auto_91819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91824 - BLOCK
      ?auto_91825 - BLOCK
      ?auto_91826 - BLOCK
      ?auto_91827 - BLOCK
    )
    :vars
    (
      ?auto_91828 - BLOCK
      ?auto_91831 - BLOCK
      ?auto_91830 - BLOCK
      ?auto_91829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91824 ?auto_91825 ) ) ( not ( = ?auto_91824 ?auto_91826 ) ) ( not ( = ?auto_91824 ?auto_91827 ) ) ( not ( = ?auto_91825 ?auto_91826 ) ) ( not ( = ?auto_91825 ?auto_91827 ) ) ( not ( = ?auto_91826 ?auto_91827 ) ) ( ON ?auto_91827 ?auto_91828 ) ( not ( = ?auto_91824 ?auto_91828 ) ) ( not ( = ?auto_91825 ?auto_91828 ) ) ( not ( = ?auto_91826 ?auto_91828 ) ) ( not ( = ?auto_91827 ?auto_91828 ) ) ( ON ?auto_91826 ?auto_91827 ) ( ON-TABLE ?auto_91831 ) ( ON ?auto_91830 ?auto_91831 ) ( ON ?auto_91828 ?auto_91830 ) ( not ( = ?auto_91831 ?auto_91830 ) ) ( not ( = ?auto_91831 ?auto_91828 ) ) ( not ( = ?auto_91831 ?auto_91827 ) ) ( not ( = ?auto_91831 ?auto_91826 ) ) ( not ( = ?auto_91830 ?auto_91828 ) ) ( not ( = ?auto_91830 ?auto_91827 ) ) ( not ( = ?auto_91830 ?auto_91826 ) ) ( not ( = ?auto_91824 ?auto_91831 ) ) ( not ( = ?auto_91824 ?auto_91830 ) ) ( not ( = ?auto_91825 ?auto_91831 ) ) ( not ( = ?auto_91825 ?auto_91830 ) ) ( ON ?auto_91824 ?auto_91829 ) ( CLEAR ?auto_91824 ) ( not ( = ?auto_91824 ?auto_91829 ) ) ( not ( = ?auto_91825 ?auto_91829 ) ) ( not ( = ?auto_91826 ?auto_91829 ) ) ( not ( = ?auto_91827 ?auto_91829 ) ) ( not ( = ?auto_91828 ?auto_91829 ) ) ( not ( = ?auto_91831 ?auto_91829 ) ) ( not ( = ?auto_91830 ?auto_91829 ) ) ( HOLDING ?auto_91825 ) ( CLEAR ?auto_91826 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91831 ?auto_91830 ?auto_91828 ?auto_91827 ?auto_91826 ?auto_91825 )
      ( MAKE-4PILE ?auto_91824 ?auto_91825 ?auto_91826 ?auto_91827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91832 - BLOCK
      ?auto_91833 - BLOCK
      ?auto_91834 - BLOCK
      ?auto_91835 - BLOCK
    )
    :vars
    (
      ?auto_91839 - BLOCK
      ?auto_91838 - BLOCK
      ?auto_91836 - BLOCK
      ?auto_91837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91832 ?auto_91833 ) ) ( not ( = ?auto_91832 ?auto_91834 ) ) ( not ( = ?auto_91832 ?auto_91835 ) ) ( not ( = ?auto_91833 ?auto_91834 ) ) ( not ( = ?auto_91833 ?auto_91835 ) ) ( not ( = ?auto_91834 ?auto_91835 ) ) ( ON ?auto_91835 ?auto_91839 ) ( not ( = ?auto_91832 ?auto_91839 ) ) ( not ( = ?auto_91833 ?auto_91839 ) ) ( not ( = ?auto_91834 ?auto_91839 ) ) ( not ( = ?auto_91835 ?auto_91839 ) ) ( ON ?auto_91834 ?auto_91835 ) ( ON-TABLE ?auto_91838 ) ( ON ?auto_91836 ?auto_91838 ) ( ON ?auto_91839 ?auto_91836 ) ( not ( = ?auto_91838 ?auto_91836 ) ) ( not ( = ?auto_91838 ?auto_91839 ) ) ( not ( = ?auto_91838 ?auto_91835 ) ) ( not ( = ?auto_91838 ?auto_91834 ) ) ( not ( = ?auto_91836 ?auto_91839 ) ) ( not ( = ?auto_91836 ?auto_91835 ) ) ( not ( = ?auto_91836 ?auto_91834 ) ) ( not ( = ?auto_91832 ?auto_91838 ) ) ( not ( = ?auto_91832 ?auto_91836 ) ) ( not ( = ?auto_91833 ?auto_91838 ) ) ( not ( = ?auto_91833 ?auto_91836 ) ) ( ON ?auto_91832 ?auto_91837 ) ( not ( = ?auto_91832 ?auto_91837 ) ) ( not ( = ?auto_91833 ?auto_91837 ) ) ( not ( = ?auto_91834 ?auto_91837 ) ) ( not ( = ?auto_91835 ?auto_91837 ) ) ( not ( = ?auto_91839 ?auto_91837 ) ) ( not ( = ?auto_91838 ?auto_91837 ) ) ( not ( = ?auto_91836 ?auto_91837 ) ) ( CLEAR ?auto_91834 ) ( ON ?auto_91833 ?auto_91832 ) ( CLEAR ?auto_91833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91837 ?auto_91832 )
      ( MAKE-4PILE ?auto_91832 ?auto_91833 ?auto_91834 ?auto_91835 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91840 - BLOCK
      ?auto_91841 - BLOCK
      ?auto_91842 - BLOCK
      ?auto_91843 - BLOCK
    )
    :vars
    (
      ?auto_91844 - BLOCK
      ?auto_91847 - BLOCK
      ?auto_91845 - BLOCK
      ?auto_91846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91840 ?auto_91841 ) ) ( not ( = ?auto_91840 ?auto_91842 ) ) ( not ( = ?auto_91840 ?auto_91843 ) ) ( not ( = ?auto_91841 ?auto_91842 ) ) ( not ( = ?auto_91841 ?auto_91843 ) ) ( not ( = ?auto_91842 ?auto_91843 ) ) ( ON ?auto_91843 ?auto_91844 ) ( not ( = ?auto_91840 ?auto_91844 ) ) ( not ( = ?auto_91841 ?auto_91844 ) ) ( not ( = ?auto_91842 ?auto_91844 ) ) ( not ( = ?auto_91843 ?auto_91844 ) ) ( ON-TABLE ?auto_91847 ) ( ON ?auto_91845 ?auto_91847 ) ( ON ?auto_91844 ?auto_91845 ) ( not ( = ?auto_91847 ?auto_91845 ) ) ( not ( = ?auto_91847 ?auto_91844 ) ) ( not ( = ?auto_91847 ?auto_91843 ) ) ( not ( = ?auto_91847 ?auto_91842 ) ) ( not ( = ?auto_91845 ?auto_91844 ) ) ( not ( = ?auto_91845 ?auto_91843 ) ) ( not ( = ?auto_91845 ?auto_91842 ) ) ( not ( = ?auto_91840 ?auto_91847 ) ) ( not ( = ?auto_91840 ?auto_91845 ) ) ( not ( = ?auto_91841 ?auto_91847 ) ) ( not ( = ?auto_91841 ?auto_91845 ) ) ( ON ?auto_91840 ?auto_91846 ) ( not ( = ?auto_91840 ?auto_91846 ) ) ( not ( = ?auto_91841 ?auto_91846 ) ) ( not ( = ?auto_91842 ?auto_91846 ) ) ( not ( = ?auto_91843 ?auto_91846 ) ) ( not ( = ?auto_91844 ?auto_91846 ) ) ( not ( = ?auto_91847 ?auto_91846 ) ) ( not ( = ?auto_91845 ?auto_91846 ) ) ( ON ?auto_91841 ?auto_91840 ) ( CLEAR ?auto_91841 ) ( ON-TABLE ?auto_91846 ) ( HOLDING ?auto_91842 ) ( CLEAR ?auto_91843 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91847 ?auto_91845 ?auto_91844 ?auto_91843 ?auto_91842 )
      ( MAKE-4PILE ?auto_91840 ?auto_91841 ?auto_91842 ?auto_91843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91848 - BLOCK
      ?auto_91849 - BLOCK
      ?auto_91850 - BLOCK
      ?auto_91851 - BLOCK
    )
    :vars
    (
      ?auto_91853 - BLOCK
      ?auto_91855 - BLOCK
      ?auto_91854 - BLOCK
      ?auto_91852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91848 ?auto_91849 ) ) ( not ( = ?auto_91848 ?auto_91850 ) ) ( not ( = ?auto_91848 ?auto_91851 ) ) ( not ( = ?auto_91849 ?auto_91850 ) ) ( not ( = ?auto_91849 ?auto_91851 ) ) ( not ( = ?auto_91850 ?auto_91851 ) ) ( ON ?auto_91851 ?auto_91853 ) ( not ( = ?auto_91848 ?auto_91853 ) ) ( not ( = ?auto_91849 ?auto_91853 ) ) ( not ( = ?auto_91850 ?auto_91853 ) ) ( not ( = ?auto_91851 ?auto_91853 ) ) ( ON-TABLE ?auto_91855 ) ( ON ?auto_91854 ?auto_91855 ) ( ON ?auto_91853 ?auto_91854 ) ( not ( = ?auto_91855 ?auto_91854 ) ) ( not ( = ?auto_91855 ?auto_91853 ) ) ( not ( = ?auto_91855 ?auto_91851 ) ) ( not ( = ?auto_91855 ?auto_91850 ) ) ( not ( = ?auto_91854 ?auto_91853 ) ) ( not ( = ?auto_91854 ?auto_91851 ) ) ( not ( = ?auto_91854 ?auto_91850 ) ) ( not ( = ?auto_91848 ?auto_91855 ) ) ( not ( = ?auto_91848 ?auto_91854 ) ) ( not ( = ?auto_91849 ?auto_91855 ) ) ( not ( = ?auto_91849 ?auto_91854 ) ) ( ON ?auto_91848 ?auto_91852 ) ( not ( = ?auto_91848 ?auto_91852 ) ) ( not ( = ?auto_91849 ?auto_91852 ) ) ( not ( = ?auto_91850 ?auto_91852 ) ) ( not ( = ?auto_91851 ?auto_91852 ) ) ( not ( = ?auto_91853 ?auto_91852 ) ) ( not ( = ?auto_91855 ?auto_91852 ) ) ( not ( = ?auto_91854 ?auto_91852 ) ) ( ON ?auto_91849 ?auto_91848 ) ( ON-TABLE ?auto_91852 ) ( CLEAR ?auto_91851 ) ( ON ?auto_91850 ?auto_91849 ) ( CLEAR ?auto_91850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91852 ?auto_91848 ?auto_91849 )
      ( MAKE-4PILE ?auto_91848 ?auto_91849 ?auto_91850 ?auto_91851 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91856 - BLOCK
      ?auto_91857 - BLOCK
      ?auto_91858 - BLOCK
      ?auto_91859 - BLOCK
    )
    :vars
    (
      ?auto_91860 - BLOCK
      ?auto_91862 - BLOCK
      ?auto_91861 - BLOCK
      ?auto_91863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91856 ?auto_91857 ) ) ( not ( = ?auto_91856 ?auto_91858 ) ) ( not ( = ?auto_91856 ?auto_91859 ) ) ( not ( = ?auto_91857 ?auto_91858 ) ) ( not ( = ?auto_91857 ?auto_91859 ) ) ( not ( = ?auto_91858 ?auto_91859 ) ) ( not ( = ?auto_91856 ?auto_91860 ) ) ( not ( = ?auto_91857 ?auto_91860 ) ) ( not ( = ?auto_91858 ?auto_91860 ) ) ( not ( = ?auto_91859 ?auto_91860 ) ) ( ON-TABLE ?auto_91862 ) ( ON ?auto_91861 ?auto_91862 ) ( ON ?auto_91860 ?auto_91861 ) ( not ( = ?auto_91862 ?auto_91861 ) ) ( not ( = ?auto_91862 ?auto_91860 ) ) ( not ( = ?auto_91862 ?auto_91859 ) ) ( not ( = ?auto_91862 ?auto_91858 ) ) ( not ( = ?auto_91861 ?auto_91860 ) ) ( not ( = ?auto_91861 ?auto_91859 ) ) ( not ( = ?auto_91861 ?auto_91858 ) ) ( not ( = ?auto_91856 ?auto_91862 ) ) ( not ( = ?auto_91856 ?auto_91861 ) ) ( not ( = ?auto_91857 ?auto_91862 ) ) ( not ( = ?auto_91857 ?auto_91861 ) ) ( ON ?auto_91856 ?auto_91863 ) ( not ( = ?auto_91856 ?auto_91863 ) ) ( not ( = ?auto_91857 ?auto_91863 ) ) ( not ( = ?auto_91858 ?auto_91863 ) ) ( not ( = ?auto_91859 ?auto_91863 ) ) ( not ( = ?auto_91860 ?auto_91863 ) ) ( not ( = ?auto_91862 ?auto_91863 ) ) ( not ( = ?auto_91861 ?auto_91863 ) ) ( ON ?auto_91857 ?auto_91856 ) ( ON-TABLE ?auto_91863 ) ( ON ?auto_91858 ?auto_91857 ) ( CLEAR ?auto_91858 ) ( HOLDING ?auto_91859 ) ( CLEAR ?auto_91860 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91862 ?auto_91861 ?auto_91860 ?auto_91859 )
      ( MAKE-4PILE ?auto_91856 ?auto_91857 ?auto_91858 ?auto_91859 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91864 - BLOCK
      ?auto_91865 - BLOCK
      ?auto_91866 - BLOCK
      ?auto_91867 - BLOCK
    )
    :vars
    (
      ?auto_91869 - BLOCK
      ?auto_91870 - BLOCK
      ?auto_91871 - BLOCK
      ?auto_91868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91864 ?auto_91865 ) ) ( not ( = ?auto_91864 ?auto_91866 ) ) ( not ( = ?auto_91864 ?auto_91867 ) ) ( not ( = ?auto_91865 ?auto_91866 ) ) ( not ( = ?auto_91865 ?auto_91867 ) ) ( not ( = ?auto_91866 ?auto_91867 ) ) ( not ( = ?auto_91864 ?auto_91869 ) ) ( not ( = ?auto_91865 ?auto_91869 ) ) ( not ( = ?auto_91866 ?auto_91869 ) ) ( not ( = ?auto_91867 ?auto_91869 ) ) ( ON-TABLE ?auto_91870 ) ( ON ?auto_91871 ?auto_91870 ) ( ON ?auto_91869 ?auto_91871 ) ( not ( = ?auto_91870 ?auto_91871 ) ) ( not ( = ?auto_91870 ?auto_91869 ) ) ( not ( = ?auto_91870 ?auto_91867 ) ) ( not ( = ?auto_91870 ?auto_91866 ) ) ( not ( = ?auto_91871 ?auto_91869 ) ) ( not ( = ?auto_91871 ?auto_91867 ) ) ( not ( = ?auto_91871 ?auto_91866 ) ) ( not ( = ?auto_91864 ?auto_91870 ) ) ( not ( = ?auto_91864 ?auto_91871 ) ) ( not ( = ?auto_91865 ?auto_91870 ) ) ( not ( = ?auto_91865 ?auto_91871 ) ) ( ON ?auto_91864 ?auto_91868 ) ( not ( = ?auto_91864 ?auto_91868 ) ) ( not ( = ?auto_91865 ?auto_91868 ) ) ( not ( = ?auto_91866 ?auto_91868 ) ) ( not ( = ?auto_91867 ?auto_91868 ) ) ( not ( = ?auto_91869 ?auto_91868 ) ) ( not ( = ?auto_91870 ?auto_91868 ) ) ( not ( = ?auto_91871 ?auto_91868 ) ) ( ON ?auto_91865 ?auto_91864 ) ( ON-TABLE ?auto_91868 ) ( ON ?auto_91866 ?auto_91865 ) ( CLEAR ?auto_91869 ) ( ON ?auto_91867 ?auto_91866 ) ( CLEAR ?auto_91867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91868 ?auto_91864 ?auto_91865 ?auto_91866 )
      ( MAKE-4PILE ?auto_91864 ?auto_91865 ?auto_91866 ?auto_91867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91872 - BLOCK
      ?auto_91873 - BLOCK
      ?auto_91874 - BLOCK
      ?auto_91875 - BLOCK
    )
    :vars
    (
      ?auto_91876 - BLOCK
      ?auto_91878 - BLOCK
      ?auto_91877 - BLOCK
      ?auto_91879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91872 ?auto_91873 ) ) ( not ( = ?auto_91872 ?auto_91874 ) ) ( not ( = ?auto_91872 ?auto_91875 ) ) ( not ( = ?auto_91873 ?auto_91874 ) ) ( not ( = ?auto_91873 ?auto_91875 ) ) ( not ( = ?auto_91874 ?auto_91875 ) ) ( not ( = ?auto_91872 ?auto_91876 ) ) ( not ( = ?auto_91873 ?auto_91876 ) ) ( not ( = ?auto_91874 ?auto_91876 ) ) ( not ( = ?auto_91875 ?auto_91876 ) ) ( ON-TABLE ?auto_91878 ) ( ON ?auto_91877 ?auto_91878 ) ( not ( = ?auto_91878 ?auto_91877 ) ) ( not ( = ?auto_91878 ?auto_91876 ) ) ( not ( = ?auto_91878 ?auto_91875 ) ) ( not ( = ?auto_91878 ?auto_91874 ) ) ( not ( = ?auto_91877 ?auto_91876 ) ) ( not ( = ?auto_91877 ?auto_91875 ) ) ( not ( = ?auto_91877 ?auto_91874 ) ) ( not ( = ?auto_91872 ?auto_91878 ) ) ( not ( = ?auto_91872 ?auto_91877 ) ) ( not ( = ?auto_91873 ?auto_91878 ) ) ( not ( = ?auto_91873 ?auto_91877 ) ) ( ON ?auto_91872 ?auto_91879 ) ( not ( = ?auto_91872 ?auto_91879 ) ) ( not ( = ?auto_91873 ?auto_91879 ) ) ( not ( = ?auto_91874 ?auto_91879 ) ) ( not ( = ?auto_91875 ?auto_91879 ) ) ( not ( = ?auto_91876 ?auto_91879 ) ) ( not ( = ?auto_91878 ?auto_91879 ) ) ( not ( = ?auto_91877 ?auto_91879 ) ) ( ON ?auto_91873 ?auto_91872 ) ( ON-TABLE ?auto_91879 ) ( ON ?auto_91874 ?auto_91873 ) ( ON ?auto_91875 ?auto_91874 ) ( CLEAR ?auto_91875 ) ( HOLDING ?auto_91876 ) ( CLEAR ?auto_91877 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91878 ?auto_91877 ?auto_91876 )
      ( MAKE-4PILE ?auto_91872 ?auto_91873 ?auto_91874 ?auto_91875 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91880 - BLOCK
      ?auto_91881 - BLOCK
      ?auto_91882 - BLOCK
      ?auto_91883 - BLOCK
    )
    :vars
    (
      ?auto_91886 - BLOCK
      ?auto_91885 - BLOCK
      ?auto_91884 - BLOCK
      ?auto_91887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91880 ?auto_91881 ) ) ( not ( = ?auto_91880 ?auto_91882 ) ) ( not ( = ?auto_91880 ?auto_91883 ) ) ( not ( = ?auto_91881 ?auto_91882 ) ) ( not ( = ?auto_91881 ?auto_91883 ) ) ( not ( = ?auto_91882 ?auto_91883 ) ) ( not ( = ?auto_91880 ?auto_91886 ) ) ( not ( = ?auto_91881 ?auto_91886 ) ) ( not ( = ?auto_91882 ?auto_91886 ) ) ( not ( = ?auto_91883 ?auto_91886 ) ) ( ON-TABLE ?auto_91885 ) ( ON ?auto_91884 ?auto_91885 ) ( not ( = ?auto_91885 ?auto_91884 ) ) ( not ( = ?auto_91885 ?auto_91886 ) ) ( not ( = ?auto_91885 ?auto_91883 ) ) ( not ( = ?auto_91885 ?auto_91882 ) ) ( not ( = ?auto_91884 ?auto_91886 ) ) ( not ( = ?auto_91884 ?auto_91883 ) ) ( not ( = ?auto_91884 ?auto_91882 ) ) ( not ( = ?auto_91880 ?auto_91885 ) ) ( not ( = ?auto_91880 ?auto_91884 ) ) ( not ( = ?auto_91881 ?auto_91885 ) ) ( not ( = ?auto_91881 ?auto_91884 ) ) ( ON ?auto_91880 ?auto_91887 ) ( not ( = ?auto_91880 ?auto_91887 ) ) ( not ( = ?auto_91881 ?auto_91887 ) ) ( not ( = ?auto_91882 ?auto_91887 ) ) ( not ( = ?auto_91883 ?auto_91887 ) ) ( not ( = ?auto_91886 ?auto_91887 ) ) ( not ( = ?auto_91885 ?auto_91887 ) ) ( not ( = ?auto_91884 ?auto_91887 ) ) ( ON ?auto_91881 ?auto_91880 ) ( ON-TABLE ?auto_91887 ) ( ON ?auto_91882 ?auto_91881 ) ( ON ?auto_91883 ?auto_91882 ) ( CLEAR ?auto_91884 ) ( ON ?auto_91886 ?auto_91883 ) ( CLEAR ?auto_91886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91887 ?auto_91880 ?auto_91881 ?auto_91882 ?auto_91883 )
      ( MAKE-4PILE ?auto_91880 ?auto_91881 ?auto_91882 ?auto_91883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91888 - BLOCK
      ?auto_91889 - BLOCK
      ?auto_91890 - BLOCK
      ?auto_91891 - BLOCK
    )
    :vars
    (
      ?auto_91892 - BLOCK
      ?auto_91895 - BLOCK
      ?auto_91893 - BLOCK
      ?auto_91894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91888 ?auto_91889 ) ) ( not ( = ?auto_91888 ?auto_91890 ) ) ( not ( = ?auto_91888 ?auto_91891 ) ) ( not ( = ?auto_91889 ?auto_91890 ) ) ( not ( = ?auto_91889 ?auto_91891 ) ) ( not ( = ?auto_91890 ?auto_91891 ) ) ( not ( = ?auto_91888 ?auto_91892 ) ) ( not ( = ?auto_91889 ?auto_91892 ) ) ( not ( = ?auto_91890 ?auto_91892 ) ) ( not ( = ?auto_91891 ?auto_91892 ) ) ( ON-TABLE ?auto_91895 ) ( not ( = ?auto_91895 ?auto_91893 ) ) ( not ( = ?auto_91895 ?auto_91892 ) ) ( not ( = ?auto_91895 ?auto_91891 ) ) ( not ( = ?auto_91895 ?auto_91890 ) ) ( not ( = ?auto_91893 ?auto_91892 ) ) ( not ( = ?auto_91893 ?auto_91891 ) ) ( not ( = ?auto_91893 ?auto_91890 ) ) ( not ( = ?auto_91888 ?auto_91895 ) ) ( not ( = ?auto_91888 ?auto_91893 ) ) ( not ( = ?auto_91889 ?auto_91895 ) ) ( not ( = ?auto_91889 ?auto_91893 ) ) ( ON ?auto_91888 ?auto_91894 ) ( not ( = ?auto_91888 ?auto_91894 ) ) ( not ( = ?auto_91889 ?auto_91894 ) ) ( not ( = ?auto_91890 ?auto_91894 ) ) ( not ( = ?auto_91891 ?auto_91894 ) ) ( not ( = ?auto_91892 ?auto_91894 ) ) ( not ( = ?auto_91895 ?auto_91894 ) ) ( not ( = ?auto_91893 ?auto_91894 ) ) ( ON ?auto_91889 ?auto_91888 ) ( ON-TABLE ?auto_91894 ) ( ON ?auto_91890 ?auto_91889 ) ( ON ?auto_91891 ?auto_91890 ) ( ON ?auto_91892 ?auto_91891 ) ( CLEAR ?auto_91892 ) ( HOLDING ?auto_91893 ) ( CLEAR ?auto_91895 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91895 ?auto_91893 )
      ( MAKE-4PILE ?auto_91888 ?auto_91889 ?auto_91890 ?auto_91891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91896 - BLOCK
      ?auto_91897 - BLOCK
      ?auto_91898 - BLOCK
      ?auto_91899 - BLOCK
    )
    :vars
    (
      ?auto_91902 - BLOCK
      ?auto_91903 - BLOCK
      ?auto_91900 - BLOCK
      ?auto_91901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91896 ?auto_91897 ) ) ( not ( = ?auto_91896 ?auto_91898 ) ) ( not ( = ?auto_91896 ?auto_91899 ) ) ( not ( = ?auto_91897 ?auto_91898 ) ) ( not ( = ?auto_91897 ?auto_91899 ) ) ( not ( = ?auto_91898 ?auto_91899 ) ) ( not ( = ?auto_91896 ?auto_91902 ) ) ( not ( = ?auto_91897 ?auto_91902 ) ) ( not ( = ?auto_91898 ?auto_91902 ) ) ( not ( = ?auto_91899 ?auto_91902 ) ) ( ON-TABLE ?auto_91903 ) ( not ( = ?auto_91903 ?auto_91900 ) ) ( not ( = ?auto_91903 ?auto_91902 ) ) ( not ( = ?auto_91903 ?auto_91899 ) ) ( not ( = ?auto_91903 ?auto_91898 ) ) ( not ( = ?auto_91900 ?auto_91902 ) ) ( not ( = ?auto_91900 ?auto_91899 ) ) ( not ( = ?auto_91900 ?auto_91898 ) ) ( not ( = ?auto_91896 ?auto_91903 ) ) ( not ( = ?auto_91896 ?auto_91900 ) ) ( not ( = ?auto_91897 ?auto_91903 ) ) ( not ( = ?auto_91897 ?auto_91900 ) ) ( ON ?auto_91896 ?auto_91901 ) ( not ( = ?auto_91896 ?auto_91901 ) ) ( not ( = ?auto_91897 ?auto_91901 ) ) ( not ( = ?auto_91898 ?auto_91901 ) ) ( not ( = ?auto_91899 ?auto_91901 ) ) ( not ( = ?auto_91902 ?auto_91901 ) ) ( not ( = ?auto_91903 ?auto_91901 ) ) ( not ( = ?auto_91900 ?auto_91901 ) ) ( ON ?auto_91897 ?auto_91896 ) ( ON-TABLE ?auto_91901 ) ( ON ?auto_91898 ?auto_91897 ) ( ON ?auto_91899 ?auto_91898 ) ( ON ?auto_91902 ?auto_91899 ) ( CLEAR ?auto_91903 ) ( ON ?auto_91900 ?auto_91902 ) ( CLEAR ?auto_91900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91901 ?auto_91896 ?auto_91897 ?auto_91898 ?auto_91899 ?auto_91902 )
      ( MAKE-4PILE ?auto_91896 ?auto_91897 ?auto_91898 ?auto_91899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91904 - BLOCK
      ?auto_91905 - BLOCK
      ?auto_91906 - BLOCK
      ?auto_91907 - BLOCK
    )
    :vars
    (
      ?auto_91908 - BLOCK
      ?auto_91910 - BLOCK
      ?auto_91911 - BLOCK
      ?auto_91909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91904 ?auto_91905 ) ) ( not ( = ?auto_91904 ?auto_91906 ) ) ( not ( = ?auto_91904 ?auto_91907 ) ) ( not ( = ?auto_91905 ?auto_91906 ) ) ( not ( = ?auto_91905 ?auto_91907 ) ) ( not ( = ?auto_91906 ?auto_91907 ) ) ( not ( = ?auto_91904 ?auto_91908 ) ) ( not ( = ?auto_91905 ?auto_91908 ) ) ( not ( = ?auto_91906 ?auto_91908 ) ) ( not ( = ?auto_91907 ?auto_91908 ) ) ( not ( = ?auto_91910 ?auto_91911 ) ) ( not ( = ?auto_91910 ?auto_91908 ) ) ( not ( = ?auto_91910 ?auto_91907 ) ) ( not ( = ?auto_91910 ?auto_91906 ) ) ( not ( = ?auto_91911 ?auto_91908 ) ) ( not ( = ?auto_91911 ?auto_91907 ) ) ( not ( = ?auto_91911 ?auto_91906 ) ) ( not ( = ?auto_91904 ?auto_91910 ) ) ( not ( = ?auto_91904 ?auto_91911 ) ) ( not ( = ?auto_91905 ?auto_91910 ) ) ( not ( = ?auto_91905 ?auto_91911 ) ) ( ON ?auto_91904 ?auto_91909 ) ( not ( = ?auto_91904 ?auto_91909 ) ) ( not ( = ?auto_91905 ?auto_91909 ) ) ( not ( = ?auto_91906 ?auto_91909 ) ) ( not ( = ?auto_91907 ?auto_91909 ) ) ( not ( = ?auto_91908 ?auto_91909 ) ) ( not ( = ?auto_91910 ?auto_91909 ) ) ( not ( = ?auto_91911 ?auto_91909 ) ) ( ON ?auto_91905 ?auto_91904 ) ( ON-TABLE ?auto_91909 ) ( ON ?auto_91906 ?auto_91905 ) ( ON ?auto_91907 ?auto_91906 ) ( ON ?auto_91908 ?auto_91907 ) ( ON ?auto_91911 ?auto_91908 ) ( CLEAR ?auto_91911 ) ( HOLDING ?auto_91910 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91910 )
      ( MAKE-4PILE ?auto_91904 ?auto_91905 ?auto_91906 ?auto_91907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91912 - BLOCK
      ?auto_91913 - BLOCK
      ?auto_91914 - BLOCK
      ?auto_91915 - BLOCK
    )
    :vars
    (
      ?auto_91919 - BLOCK
      ?auto_91916 - BLOCK
      ?auto_91918 - BLOCK
      ?auto_91917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91912 ?auto_91913 ) ) ( not ( = ?auto_91912 ?auto_91914 ) ) ( not ( = ?auto_91912 ?auto_91915 ) ) ( not ( = ?auto_91913 ?auto_91914 ) ) ( not ( = ?auto_91913 ?auto_91915 ) ) ( not ( = ?auto_91914 ?auto_91915 ) ) ( not ( = ?auto_91912 ?auto_91919 ) ) ( not ( = ?auto_91913 ?auto_91919 ) ) ( not ( = ?auto_91914 ?auto_91919 ) ) ( not ( = ?auto_91915 ?auto_91919 ) ) ( not ( = ?auto_91916 ?auto_91918 ) ) ( not ( = ?auto_91916 ?auto_91919 ) ) ( not ( = ?auto_91916 ?auto_91915 ) ) ( not ( = ?auto_91916 ?auto_91914 ) ) ( not ( = ?auto_91918 ?auto_91919 ) ) ( not ( = ?auto_91918 ?auto_91915 ) ) ( not ( = ?auto_91918 ?auto_91914 ) ) ( not ( = ?auto_91912 ?auto_91916 ) ) ( not ( = ?auto_91912 ?auto_91918 ) ) ( not ( = ?auto_91913 ?auto_91916 ) ) ( not ( = ?auto_91913 ?auto_91918 ) ) ( ON ?auto_91912 ?auto_91917 ) ( not ( = ?auto_91912 ?auto_91917 ) ) ( not ( = ?auto_91913 ?auto_91917 ) ) ( not ( = ?auto_91914 ?auto_91917 ) ) ( not ( = ?auto_91915 ?auto_91917 ) ) ( not ( = ?auto_91919 ?auto_91917 ) ) ( not ( = ?auto_91916 ?auto_91917 ) ) ( not ( = ?auto_91918 ?auto_91917 ) ) ( ON ?auto_91913 ?auto_91912 ) ( ON-TABLE ?auto_91917 ) ( ON ?auto_91914 ?auto_91913 ) ( ON ?auto_91915 ?auto_91914 ) ( ON ?auto_91919 ?auto_91915 ) ( ON ?auto_91918 ?auto_91919 ) ( ON ?auto_91916 ?auto_91918 ) ( CLEAR ?auto_91916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91917 ?auto_91912 ?auto_91913 ?auto_91914 ?auto_91915 ?auto_91919 ?auto_91918 )
      ( MAKE-4PILE ?auto_91912 ?auto_91913 ?auto_91914 ?auto_91915 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91922 - BLOCK
      ?auto_91923 - BLOCK
    )
    :vars
    (
      ?auto_91924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91924 ?auto_91923 ) ( CLEAR ?auto_91924 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91922 ) ( ON ?auto_91923 ?auto_91922 ) ( not ( = ?auto_91922 ?auto_91923 ) ) ( not ( = ?auto_91922 ?auto_91924 ) ) ( not ( = ?auto_91923 ?auto_91924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91924 ?auto_91923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91925 - BLOCK
      ?auto_91926 - BLOCK
    )
    :vars
    (
      ?auto_91927 - BLOCK
      ?auto_91928 - BLOCK
      ?auto_91929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91927 ?auto_91926 ) ( CLEAR ?auto_91927 ) ( ON-TABLE ?auto_91925 ) ( ON ?auto_91926 ?auto_91925 ) ( not ( = ?auto_91925 ?auto_91926 ) ) ( not ( = ?auto_91925 ?auto_91927 ) ) ( not ( = ?auto_91926 ?auto_91927 ) ) ( HOLDING ?auto_91928 ) ( CLEAR ?auto_91929 ) ( not ( = ?auto_91925 ?auto_91928 ) ) ( not ( = ?auto_91925 ?auto_91929 ) ) ( not ( = ?auto_91926 ?auto_91928 ) ) ( not ( = ?auto_91926 ?auto_91929 ) ) ( not ( = ?auto_91927 ?auto_91928 ) ) ( not ( = ?auto_91927 ?auto_91929 ) ) ( not ( = ?auto_91928 ?auto_91929 ) ) )
    :subtasks
    ( ( !STACK ?auto_91928 ?auto_91929 )
      ( MAKE-2PILE ?auto_91925 ?auto_91926 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91930 - BLOCK
      ?auto_91931 - BLOCK
    )
    :vars
    (
      ?auto_91932 - BLOCK
      ?auto_91933 - BLOCK
      ?auto_91934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91932 ?auto_91931 ) ( ON-TABLE ?auto_91930 ) ( ON ?auto_91931 ?auto_91930 ) ( not ( = ?auto_91930 ?auto_91931 ) ) ( not ( = ?auto_91930 ?auto_91932 ) ) ( not ( = ?auto_91931 ?auto_91932 ) ) ( CLEAR ?auto_91933 ) ( not ( = ?auto_91930 ?auto_91934 ) ) ( not ( = ?auto_91930 ?auto_91933 ) ) ( not ( = ?auto_91931 ?auto_91934 ) ) ( not ( = ?auto_91931 ?auto_91933 ) ) ( not ( = ?auto_91932 ?auto_91934 ) ) ( not ( = ?auto_91932 ?auto_91933 ) ) ( not ( = ?auto_91934 ?auto_91933 ) ) ( ON ?auto_91934 ?auto_91932 ) ( CLEAR ?auto_91934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91930 ?auto_91931 ?auto_91932 )
      ( MAKE-2PILE ?auto_91930 ?auto_91931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91935 - BLOCK
      ?auto_91936 - BLOCK
    )
    :vars
    (
      ?auto_91939 - BLOCK
      ?auto_91937 - BLOCK
      ?auto_91938 - BLOCK
      ?auto_91941 - BLOCK
      ?auto_91940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91939 ?auto_91936 ) ( ON-TABLE ?auto_91935 ) ( ON ?auto_91936 ?auto_91935 ) ( not ( = ?auto_91935 ?auto_91936 ) ) ( not ( = ?auto_91935 ?auto_91939 ) ) ( not ( = ?auto_91936 ?auto_91939 ) ) ( not ( = ?auto_91935 ?auto_91937 ) ) ( not ( = ?auto_91935 ?auto_91938 ) ) ( not ( = ?auto_91936 ?auto_91937 ) ) ( not ( = ?auto_91936 ?auto_91938 ) ) ( not ( = ?auto_91939 ?auto_91937 ) ) ( not ( = ?auto_91939 ?auto_91938 ) ) ( not ( = ?auto_91937 ?auto_91938 ) ) ( ON ?auto_91937 ?auto_91939 ) ( CLEAR ?auto_91937 ) ( HOLDING ?auto_91938 ) ( CLEAR ?auto_91941 ) ( ON-TABLE ?auto_91940 ) ( ON ?auto_91941 ?auto_91940 ) ( not ( = ?auto_91940 ?auto_91941 ) ) ( not ( = ?auto_91940 ?auto_91938 ) ) ( not ( = ?auto_91941 ?auto_91938 ) ) ( not ( = ?auto_91935 ?auto_91941 ) ) ( not ( = ?auto_91935 ?auto_91940 ) ) ( not ( = ?auto_91936 ?auto_91941 ) ) ( not ( = ?auto_91936 ?auto_91940 ) ) ( not ( = ?auto_91939 ?auto_91941 ) ) ( not ( = ?auto_91939 ?auto_91940 ) ) ( not ( = ?auto_91937 ?auto_91941 ) ) ( not ( = ?auto_91937 ?auto_91940 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91940 ?auto_91941 ?auto_91938 )
      ( MAKE-2PILE ?auto_91935 ?auto_91936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91942 - BLOCK
      ?auto_91943 - BLOCK
    )
    :vars
    (
      ?auto_91947 - BLOCK
      ?auto_91944 - BLOCK
      ?auto_91945 - BLOCK
      ?auto_91946 - BLOCK
      ?auto_91948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91947 ?auto_91943 ) ( ON-TABLE ?auto_91942 ) ( ON ?auto_91943 ?auto_91942 ) ( not ( = ?auto_91942 ?auto_91943 ) ) ( not ( = ?auto_91942 ?auto_91947 ) ) ( not ( = ?auto_91943 ?auto_91947 ) ) ( not ( = ?auto_91942 ?auto_91944 ) ) ( not ( = ?auto_91942 ?auto_91945 ) ) ( not ( = ?auto_91943 ?auto_91944 ) ) ( not ( = ?auto_91943 ?auto_91945 ) ) ( not ( = ?auto_91947 ?auto_91944 ) ) ( not ( = ?auto_91947 ?auto_91945 ) ) ( not ( = ?auto_91944 ?auto_91945 ) ) ( ON ?auto_91944 ?auto_91947 ) ( CLEAR ?auto_91946 ) ( ON-TABLE ?auto_91948 ) ( ON ?auto_91946 ?auto_91948 ) ( not ( = ?auto_91948 ?auto_91946 ) ) ( not ( = ?auto_91948 ?auto_91945 ) ) ( not ( = ?auto_91946 ?auto_91945 ) ) ( not ( = ?auto_91942 ?auto_91946 ) ) ( not ( = ?auto_91942 ?auto_91948 ) ) ( not ( = ?auto_91943 ?auto_91946 ) ) ( not ( = ?auto_91943 ?auto_91948 ) ) ( not ( = ?auto_91947 ?auto_91946 ) ) ( not ( = ?auto_91947 ?auto_91948 ) ) ( not ( = ?auto_91944 ?auto_91946 ) ) ( not ( = ?auto_91944 ?auto_91948 ) ) ( ON ?auto_91945 ?auto_91944 ) ( CLEAR ?auto_91945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91942 ?auto_91943 ?auto_91947 ?auto_91944 )
      ( MAKE-2PILE ?auto_91942 ?auto_91943 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91949 - BLOCK
      ?auto_91950 - BLOCK
    )
    :vars
    (
      ?auto_91951 - BLOCK
      ?auto_91955 - BLOCK
      ?auto_91952 - BLOCK
      ?auto_91954 - BLOCK
      ?auto_91953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91951 ?auto_91950 ) ( ON-TABLE ?auto_91949 ) ( ON ?auto_91950 ?auto_91949 ) ( not ( = ?auto_91949 ?auto_91950 ) ) ( not ( = ?auto_91949 ?auto_91951 ) ) ( not ( = ?auto_91950 ?auto_91951 ) ) ( not ( = ?auto_91949 ?auto_91955 ) ) ( not ( = ?auto_91949 ?auto_91952 ) ) ( not ( = ?auto_91950 ?auto_91955 ) ) ( not ( = ?auto_91950 ?auto_91952 ) ) ( not ( = ?auto_91951 ?auto_91955 ) ) ( not ( = ?auto_91951 ?auto_91952 ) ) ( not ( = ?auto_91955 ?auto_91952 ) ) ( ON ?auto_91955 ?auto_91951 ) ( ON-TABLE ?auto_91954 ) ( not ( = ?auto_91954 ?auto_91953 ) ) ( not ( = ?auto_91954 ?auto_91952 ) ) ( not ( = ?auto_91953 ?auto_91952 ) ) ( not ( = ?auto_91949 ?auto_91953 ) ) ( not ( = ?auto_91949 ?auto_91954 ) ) ( not ( = ?auto_91950 ?auto_91953 ) ) ( not ( = ?auto_91950 ?auto_91954 ) ) ( not ( = ?auto_91951 ?auto_91953 ) ) ( not ( = ?auto_91951 ?auto_91954 ) ) ( not ( = ?auto_91955 ?auto_91953 ) ) ( not ( = ?auto_91955 ?auto_91954 ) ) ( ON ?auto_91952 ?auto_91955 ) ( CLEAR ?auto_91952 ) ( HOLDING ?auto_91953 ) ( CLEAR ?auto_91954 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91954 ?auto_91953 )
      ( MAKE-2PILE ?auto_91949 ?auto_91950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91956 - BLOCK
      ?auto_91957 - BLOCK
    )
    :vars
    (
      ?auto_91960 - BLOCK
      ?auto_91958 - BLOCK
      ?auto_91961 - BLOCK
      ?auto_91962 - BLOCK
      ?auto_91959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91960 ?auto_91957 ) ( ON-TABLE ?auto_91956 ) ( ON ?auto_91957 ?auto_91956 ) ( not ( = ?auto_91956 ?auto_91957 ) ) ( not ( = ?auto_91956 ?auto_91960 ) ) ( not ( = ?auto_91957 ?auto_91960 ) ) ( not ( = ?auto_91956 ?auto_91958 ) ) ( not ( = ?auto_91956 ?auto_91961 ) ) ( not ( = ?auto_91957 ?auto_91958 ) ) ( not ( = ?auto_91957 ?auto_91961 ) ) ( not ( = ?auto_91960 ?auto_91958 ) ) ( not ( = ?auto_91960 ?auto_91961 ) ) ( not ( = ?auto_91958 ?auto_91961 ) ) ( ON ?auto_91958 ?auto_91960 ) ( ON-TABLE ?auto_91962 ) ( not ( = ?auto_91962 ?auto_91959 ) ) ( not ( = ?auto_91962 ?auto_91961 ) ) ( not ( = ?auto_91959 ?auto_91961 ) ) ( not ( = ?auto_91956 ?auto_91959 ) ) ( not ( = ?auto_91956 ?auto_91962 ) ) ( not ( = ?auto_91957 ?auto_91959 ) ) ( not ( = ?auto_91957 ?auto_91962 ) ) ( not ( = ?auto_91960 ?auto_91959 ) ) ( not ( = ?auto_91960 ?auto_91962 ) ) ( not ( = ?auto_91958 ?auto_91959 ) ) ( not ( = ?auto_91958 ?auto_91962 ) ) ( ON ?auto_91961 ?auto_91958 ) ( CLEAR ?auto_91962 ) ( ON ?auto_91959 ?auto_91961 ) ( CLEAR ?auto_91959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91956 ?auto_91957 ?auto_91960 ?auto_91958 ?auto_91961 )
      ( MAKE-2PILE ?auto_91956 ?auto_91957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91963 - BLOCK
      ?auto_91964 - BLOCK
    )
    :vars
    (
      ?auto_91965 - BLOCK
      ?auto_91968 - BLOCK
      ?auto_91967 - BLOCK
      ?auto_91969 - BLOCK
      ?auto_91966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91965 ?auto_91964 ) ( ON-TABLE ?auto_91963 ) ( ON ?auto_91964 ?auto_91963 ) ( not ( = ?auto_91963 ?auto_91964 ) ) ( not ( = ?auto_91963 ?auto_91965 ) ) ( not ( = ?auto_91964 ?auto_91965 ) ) ( not ( = ?auto_91963 ?auto_91968 ) ) ( not ( = ?auto_91963 ?auto_91967 ) ) ( not ( = ?auto_91964 ?auto_91968 ) ) ( not ( = ?auto_91964 ?auto_91967 ) ) ( not ( = ?auto_91965 ?auto_91968 ) ) ( not ( = ?auto_91965 ?auto_91967 ) ) ( not ( = ?auto_91968 ?auto_91967 ) ) ( ON ?auto_91968 ?auto_91965 ) ( not ( = ?auto_91969 ?auto_91966 ) ) ( not ( = ?auto_91969 ?auto_91967 ) ) ( not ( = ?auto_91966 ?auto_91967 ) ) ( not ( = ?auto_91963 ?auto_91966 ) ) ( not ( = ?auto_91963 ?auto_91969 ) ) ( not ( = ?auto_91964 ?auto_91966 ) ) ( not ( = ?auto_91964 ?auto_91969 ) ) ( not ( = ?auto_91965 ?auto_91966 ) ) ( not ( = ?auto_91965 ?auto_91969 ) ) ( not ( = ?auto_91968 ?auto_91966 ) ) ( not ( = ?auto_91968 ?auto_91969 ) ) ( ON ?auto_91967 ?auto_91968 ) ( ON ?auto_91966 ?auto_91967 ) ( CLEAR ?auto_91966 ) ( HOLDING ?auto_91969 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91969 )
      ( MAKE-2PILE ?auto_91963 ?auto_91964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91970 - BLOCK
      ?auto_91971 - BLOCK
    )
    :vars
    (
      ?auto_91974 - BLOCK
      ?auto_91976 - BLOCK
      ?auto_91972 - BLOCK
      ?auto_91975 - BLOCK
      ?auto_91973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91974 ?auto_91971 ) ( ON-TABLE ?auto_91970 ) ( ON ?auto_91971 ?auto_91970 ) ( not ( = ?auto_91970 ?auto_91971 ) ) ( not ( = ?auto_91970 ?auto_91974 ) ) ( not ( = ?auto_91971 ?auto_91974 ) ) ( not ( = ?auto_91970 ?auto_91976 ) ) ( not ( = ?auto_91970 ?auto_91972 ) ) ( not ( = ?auto_91971 ?auto_91976 ) ) ( not ( = ?auto_91971 ?auto_91972 ) ) ( not ( = ?auto_91974 ?auto_91976 ) ) ( not ( = ?auto_91974 ?auto_91972 ) ) ( not ( = ?auto_91976 ?auto_91972 ) ) ( ON ?auto_91976 ?auto_91974 ) ( not ( = ?auto_91975 ?auto_91973 ) ) ( not ( = ?auto_91975 ?auto_91972 ) ) ( not ( = ?auto_91973 ?auto_91972 ) ) ( not ( = ?auto_91970 ?auto_91973 ) ) ( not ( = ?auto_91970 ?auto_91975 ) ) ( not ( = ?auto_91971 ?auto_91973 ) ) ( not ( = ?auto_91971 ?auto_91975 ) ) ( not ( = ?auto_91974 ?auto_91973 ) ) ( not ( = ?auto_91974 ?auto_91975 ) ) ( not ( = ?auto_91976 ?auto_91973 ) ) ( not ( = ?auto_91976 ?auto_91975 ) ) ( ON ?auto_91972 ?auto_91976 ) ( ON ?auto_91973 ?auto_91972 ) ( ON ?auto_91975 ?auto_91973 ) ( CLEAR ?auto_91975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91970 ?auto_91971 ?auto_91974 ?auto_91976 ?auto_91972 ?auto_91973 )
      ( MAKE-2PILE ?auto_91970 ?auto_91971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91977 - BLOCK
      ?auto_91978 - BLOCK
    )
    :vars
    (
      ?auto_91981 - BLOCK
      ?auto_91982 - BLOCK
      ?auto_91979 - BLOCK
      ?auto_91983 - BLOCK
      ?auto_91980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91981 ?auto_91978 ) ( ON-TABLE ?auto_91977 ) ( ON ?auto_91978 ?auto_91977 ) ( not ( = ?auto_91977 ?auto_91978 ) ) ( not ( = ?auto_91977 ?auto_91981 ) ) ( not ( = ?auto_91978 ?auto_91981 ) ) ( not ( = ?auto_91977 ?auto_91982 ) ) ( not ( = ?auto_91977 ?auto_91979 ) ) ( not ( = ?auto_91978 ?auto_91982 ) ) ( not ( = ?auto_91978 ?auto_91979 ) ) ( not ( = ?auto_91981 ?auto_91982 ) ) ( not ( = ?auto_91981 ?auto_91979 ) ) ( not ( = ?auto_91982 ?auto_91979 ) ) ( ON ?auto_91982 ?auto_91981 ) ( not ( = ?auto_91983 ?auto_91980 ) ) ( not ( = ?auto_91983 ?auto_91979 ) ) ( not ( = ?auto_91980 ?auto_91979 ) ) ( not ( = ?auto_91977 ?auto_91980 ) ) ( not ( = ?auto_91977 ?auto_91983 ) ) ( not ( = ?auto_91978 ?auto_91980 ) ) ( not ( = ?auto_91978 ?auto_91983 ) ) ( not ( = ?auto_91981 ?auto_91980 ) ) ( not ( = ?auto_91981 ?auto_91983 ) ) ( not ( = ?auto_91982 ?auto_91980 ) ) ( not ( = ?auto_91982 ?auto_91983 ) ) ( ON ?auto_91979 ?auto_91982 ) ( ON ?auto_91980 ?auto_91979 ) ( HOLDING ?auto_91983 ) ( CLEAR ?auto_91980 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91977 ?auto_91978 ?auto_91981 ?auto_91982 ?auto_91979 ?auto_91980 ?auto_91983 )
      ( MAKE-2PILE ?auto_91977 ?auto_91978 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91984 - BLOCK
      ?auto_91985 - BLOCK
    )
    :vars
    (
      ?auto_91988 - BLOCK
      ?auto_91989 - BLOCK
      ?auto_91987 - BLOCK
      ?auto_91990 - BLOCK
      ?auto_91986 - BLOCK
      ?auto_91991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91988 ?auto_91985 ) ( ON-TABLE ?auto_91984 ) ( ON ?auto_91985 ?auto_91984 ) ( not ( = ?auto_91984 ?auto_91985 ) ) ( not ( = ?auto_91984 ?auto_91988 ) ) ( not ( = ?auto_91985 ?auto_91988 ) ) ( not ( = ?auto_91984 ?auto_91989 ) ) ( not ( = ?auto_91984 ?auto_91987 ) ) ( not ( = ?auto_91985 ?auto_91989 ) ) ( not ( = ?auto_91985 ?auto_91987 ) ) ( not ( = ?auto_91988 ?auto_91989 ) ) ( not ( = ?auto_91988 ?auto_91987 ) ) ( not ( = ?auto_91989 ?auto_91987 ) ) ( ON ?auto_91989 ?auto_91988 ) ( not ( = ?auto_91990 ?auto_91986 ) ) ( not ( = ?auto_91990 ?auto_91987 ) ) ( not ( = ?auto_91986 ?auto_91987 ) ) ( not ( = ?auto_91984 ?auto_91986 ) ) ( not ( = ?auto_91984 ?auto_91990 ) ) ( not ( = ?auto_91985 ?auto_91986 ) ) ( not ( = ?auto_91985 ?auto_91990 ) ) ( not ( = ?auto_91988 ?auto_91986 ) ) ( not ( = ?auto_91988 ?auto_91990 ) ) ( not ( = ?auto_91989 ?auto_91986 ) ) ( not ( = ?auto_91989 ?auto_91990 ) ) ( ON ?auto_91987 ?auto_91989 ) ( ON ?auto_91986 ?auto_91987 ) ( CLEAR ?auto_91986 ) ( ON ?auto_91990 ?auto_91991 ) ( CLEAR ?auto_91990 ) ( HAND-EMPTY ) ( not ( = ?auto_91984 ?auto_91991 ) ) ( not ( = ?auto_91985 ?auto_91991 ) ) ( not ( = ?auto_91988 ?auto_91991 ) ) ( not ( = ?auto_91989 ?auto_91991 ) ) ( not ( = ?auto_91987 ?auto_91991 ) ) ( not ( = ?auto_91990 ?auto_91991 ) ) ( not ( = ?auto_91986 ?auto_91991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91990 ?auto_91991 )
      ( MAKE-2PILE ?auto_91984 ?auto_91985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91992 - BLOCK
      ?auto_91993 - BLOCK
    )
    :vars
    (
      ?auto_91994 - BLOCK
      ?auto_91996 - BLOCK
      ?auto_91997 - BLOCK
      ?auto_91998 - BLOCK
      ?auto_91999 - BLOCK
      ?auto_91995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91994 ?auto_91993 ) ( ON-TABLE ?auto_91992 ) ( ON ?auto_91993 ?auto_91992 ) ( not ( = ?auto_91992 ?auto_91993 ) ) ( not ( = ?auto_91992 ?auto_91994 ) ) ( not ( = ?auto_91993 ?auto_91994 ) ) ( not ( = ?auto_91992 ?auto_91996 ) ) ( not ( = ?auto_91992 ?auto_91997 ) ) ( not ( = ?auto_91993 ?auto_91996 ) ) ( not ( = ?auto_91993 ?auto_91997 ) ) ( not ( = ?auto_91994 ?auto_91996 ) ) ( not ( = ?auto_91994 ?auto_91997 ) ) ( not ( = ?auto_91996 ?auto_91997 ) ) ( ON ?auto_91996 ?auto_91994 ) ( not ( = ?auto_91998 ?auto_91999 ) ) ( not ( = ?auto_91998 ?auto_91997 ) ) ( not ( = ?auto_91999 ?auto_91997 ) ) ( not ( = ?auto_91992 ?auto_91999 ) ) ( not ( = ?auto_91992 ?auto_91998 ) ) ( not ( = ?auto_91993 ?auto_91999 ) ) ( not ( = ?auto_91993 ?auto_91998 ) ) ( not ( = ?auto_91994 ?auto_91999 ) ) ( not ( = ?auto_91994 ?auto_91998 ) ) ( not ( = ?auto_91996 ?auto_91999 ) ) ( not ( = ?auto_91996 ?auto_91998 ) ) ( ON ?auto_91997 ?auto_91996 ) ( ON ?auto_91998 ?auto_91995 ) ( CLEAR ?auto_91998 ) ( not ( = ?auto_91992 ?auto_91995 ) ) ( not ( = ?auto_91993 ?auto_91995 ) ) ( not ( = ?auto_91994 ?auto_91995 ) ) ( not ( = ?auto_91996 ?auto_91995 ) ) ( not ( = ?auto_91997 ?auto_91995 ) ) ( not ( = ?auto_91998 ?auto_91995 ) ) ( not ( = ?auto_91999 ?auto_91995 ) ) ( HOLDING ?auto_91999 ) ( CLEAR ?auto_91997 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91992 ?auto_91993 ?auto_91994 ?auto_91996 ?auto_91997 ?auto_91999 )
      ( MAKE-2PILE ?auto_91992 ?auto_91993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92000 - BLOCK
      ?auto_92001 - BLOCK
    )
    :vars
    (
      ?auto_92006 - BLOCK
      ?auto_92005 - BLOCK
      ?auto_92003 - BLOCK
      ?auto_92002 - BLOCK
      ?auto_92007 - BLOCK
      ?auto_92004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92006 ?auto_92001 ) ( ON-TABLE ?auto_92000 ) ( ON ?auto_92001 ?auto_92000 ) ( not ( = ?auto_92000 ?auto_92001 ) ) ( not ( = ?auto_92000 ?auto_92006 ) ) ( not ( = ?auto_92001 ?auto_92006 ) ) ( not ( = ?auto_92000 ?auto_92005 ) ) ( not ( = ?auto_92000 ?auto_92003 ) ) ( not ( = ?auto_92001 ?auto_92005 ) ) ( not ( = ?auto_92001 ?auto_92003 ) ) ( not ( = ?auto_92006 ?auto_92005 ) ) ( not ( = ?auto_92006 ?auto_92003 ) ) ( not ( = ?auto_92005 ?auto_92003 ) ) ( ON ?auto_92005 ?auto_92006 ) ( not ( = ?auto_92002 ?auto_92007 ) ) ( not ( = ?auto_92002 ?auto_92003 ) ) ( not ( = ?auto_92007 ?auto_92003 ) ) ( not ( = ?auto_92000 ?auto_92007 ) ) ( not ( = ?auto_92000 ?auto_92002 ) ) ( not ( = ?auto_92001 ?auto_92007 ) ) ( not ( = ?auto_92001 ?auto_92002 ) ) ( not ( = ?auto_92006 ?auto_92007 ) ) ( not ( = ?auto_92006 ?auto_92002 ) ) ( not ( = ?auto_92005 ?auto_92007 ) ) ( not ( = ?auto_92005 ?auto_92002 ) ) ( ON ?auto_92003 ?auto_92005 ) ( ON ?auto_92002 ?auto_92004 ) ( not ( = ?auto_92000 ?auto_92004 ) ) ( not ( = ?auto_92001 ?auto_92004 ) ) ( not ( = ?auto_92006 ?auto_92004 ) ) ( not ( = ?auto_92005 ?auto_92004 ) ) ( not ( = ?auto_92003 ?auto_92004 ) ) ( not ( = ?auto_92002 ?auto_92004 ) ) ( not ( = ?auto_92007 ?auto_92004 ) ) ( CLEAR ?auto_92003 ) ( ON ?auto_92007 ?auto_92002 ) ( CLEAR ?auto_92007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92004 ?auto_92002 )
      ( MAKE-2PILE ?auto_92000 ?auto_92001 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92008 - BLOCK
      ?auto_92009 - BLOCK
    )
    :vars
    (
      ?auto_92015 - BLOCK
      ?auto_92011 - BLOCK
      ?auto_92010 - BLOCK
      ?auto_92012 - BLOCK
      ?auto_92013 - BLOCK
      ?auto_92014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92015 ?auto_92009 ) ( ON-TABLE ?auto_92008 ) ( ON ?auto_92009 ?auto_92008 ) ( not ( = ?auto_92008 ?auto_92009 ) ) ( not ( = ?auto_92008 ?auto_92015 ) ) ( not ( = ?auto_92009 ?auto_92015 ) ) ( not ( = ?auto_92008 ?auto_92011 ) ) ( not ( = ?auto_92008 ?auto_92010 ) ) ( not ( = ?auto_92009 ?auto_92011 ) ) ( not ( = ?auto_92009 ?auto_92010 ) ) ( not ( = ?auto_92015 ?auto_92011 ) ) ( not ( = ?auto_92015 ?auto_92010 ) ) ( not ( = ?auto_92011 ?auto_92010 ) ) ( ON ?auto_92011 ?auto_92015 ) ( not ( = ?auto_92012 ?auto_92013 ) ) ( not ( = ?auto_92012 ?auto_92010 ) ) ( not ( = ?auto_92013 ?auto_92010 ) ) ( not ( = ?auto_92008 ?auto_92013 ) ) ( not ( = ?auto_92008 ?auto_92012 ) ) ( not ( = ?auto_92009 ?auto_92013 ) ) ( not ( = ?auto_92009 ?auto_92012 ) ) ( not ( = ?auto_92015 ?auto_92013 ) ) ( not ( = ?auto_92015 ?auto_92012 ) ) ( not ( = ?auto_92011 ?auto_92013 ) ) ( not ( = ?auto_92011 ?auto_92012 ) ) ( ON ?auto_92012 ?auto_92014 ) ( not ( = ?auto_92008 ?auto_92014 ) ) ( not ( = ?auto_92009 ?auto_92014 ) ) ( not ( = ?auto_92015 ?auto_92014 ) ) ( not ( = ?auto_92011 ?auto_92014 ) ) ( not ( = ?auto_92010 ?auto_92014 ) ) ( not ( = ?auto_92012 ?auto_92014 ) ) ( not ( = ?auto_92013 ?auto_92014 ) ) ( ON ?auto_92013 ?auto_92012 ) ( CLEAR ?auto_92013 ) ( ON-TABLE ?auto_92014 ) ( HOLDING ?auto_92010 ) ( CLEAR ?auto_92011 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92008 ?auto_92009 ?auto_92015 ?auto_92011 ?auto_92010 )
      ( MAKE-2PILE ?auto_92008 ?auto_92009 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92016 - BLOCK
      ?auto_92017 - BLOCK
    )
    :vars
    (
      ?auto_92020 - BLOCK
      ?auto_92022 - BLOCK
      ?auto_92023 - BLOCK
      ?auto_92018 - BLOCK
      ?auto_92021 - BLOCK
      ?auto_92019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92020 ?auto_92017 ) ( ON-TABLE ?auto_92016 ) ( ON ?auto_92017 ?auto_92016 ) ( not ( = ?auto_92016 ?auto_92017 ) ) ( not ( = ?auto_92016 ?auto_92020 ) ) ( not ( = ?auto_92017 ?auto_92020 ) ) ( not ( = ?auto_92016 ?auto_92022 ) ) ( not ( = ?auto_92016 ?auto_92023 ) ) ( not ( = ?auto_92017 ?auto_92022 ) ) ( not ( = ?auto_92017 ?auto_92023 ) ) ( not ( = ?auto_92020 ?auto_92022 ) ) ( not ( = ?auto_92020 ?auto_92023 ) ) ( not ( = ?auto_92022 ?auto_92023 ) ) ( ON ?auto_92022 ?auto_92020 ) ( not ( = ?auto_92018 ?auto_92021 ) ) ( not ( = ?auto_92018 ?auto_92023 ) ) ( not ( = ?auto_92021 ?auto_92023 ) ) ( not ( = ?auto_92016 ?auto_92021 ) ) ( not ( = ?auto_92016 ?auto_92018 ) ) ( not ( = ?auto_92017 ?auto_92021 ) ) ( not ( = ?auto_92017 ?auto_92018 ) ) ( not ( = ?auto_92020 ?auto_92021 ) ) ( not ( = ?auto_92020 ?auto_92018 ) ) ( not ( = ?auto_92022 ?auto_92021 ) ) ( not ( = ?auto_92022 ?auto_92018 ) ) ( ON ?auto_92018 ?auto_92019 ) ( not ( = ?auto_92016 ?auto_92019 ) ) ( not ( = ?auto_92017 ?auto_92019 ) ) ( not ( = ?auto_92020 ?auto_92019 ) ) ( not ( = ?auto_92022 ?auto_92019 ) ) ( not ( = ?auto_92023 ?auto_92019 ) ) ( not ( = ?auto_92018 ?auto_92019 ) ) ( not ( = ?auto_92021 ?auto_92019 ) ) ( ON ?auto_92021 ?auto_92018 ) ( ON-TABLE ?auto_92019 ) ( CLEAR ?auto_92022 ) ( ON ?auto_92023 ?auto_92021 ) ( CLEAR ?auto_92023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92019 ?auto_92018 ?auto_92021 )
      ( MAKE-2PILE ?auto_92016 ?auto_92017 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92024 - BLOCK
      ?auto_92025 - BLOCK
    )
    :vars
    (
      ?auto_92031 - BLOCK
      ?auto_92028 - BLOCK
      ?auto_92027 - BLOCK
      ?auto_92026 - BLOCK
      ?auto_92030 - BLOCK
      ?auto_92029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92031 ?auto_92025 ) ( ON-TABLE ?auto_92024 ) ( ON ?auto_92025 ?auto_92024 ) ( not ( = ?auto_92024 ?auto_92025 ) ) ( not ( = ?auto_92024 ?auto_92031 ) ) ( not ( = ?auto_92025 ?auto_92031 ) ) ( not ( = ?auto_92024 ?auto_92028 ) ) ( not ( = ?auto_92024 ?auto_92027 ) ) ( not ( = ?auto_92025 ?auto_92028 ) ) ( not ( = ?auto_92025 ?auto_92027 ) ) ( not ( = ?auto_92031 ?auto_92028 ) ) ( not ( = ?auto_92031 ?auto_92027 ) ) ( not ( = ?auto_92028 ?auto_92027 ) ) ( not ( = ?auto_92026 ?auto_92030 ) ) ( not ( = ?auto_92026 ?auto_92027 ) ) ( not ( = ?auto_92030 ?auto_92027 ) ) ( not ( = ?auto_92024 ?auto_92030 ) ) ( not ( = ?auto_92024 ?auto_92026 ) ) ( not ( = ?auto_92025 ?auto_92030 ) ) ( not ( = ?auto_92025 ?auto_92026 ) ) ( not ( = ?auto_92031 ?auto_92030 ) ) ( not ( = ?auto_92031 ?auto_92026 ) ) ( not ( = ?auto_92028 ?auto_92030 ) ) ( not ( = ?auto_92028 ?auto_92026 ) ) ( ON ?auto_92026 ?auto_92029 ) ( not ( = ?auto_92024 ?auto_92029 ) ) ( not ( = ?auto_92025 ?auto_92029 ) ) ( not ( = ?auto_92031 ?auto_92029 ) ) ( not ( = ?auto_92028 ?auto_92029 ) ) ( not ( = ?auto_92027 ?auto_92029 ) ) ( not ( = ?auto_92026 ?auto_92029 ) ) ( not ( = ?auto_92030 ?auto_92029 ) ) ( ON ?auto_92030 ?auto_92026 ) ( ON-TABLE ?auto_92029 ) ( ON ?auto_92027 ?auto_92030 ) ( CLEAR ?auto_92027 ) ( HOLDING ?auto_92028 ) ( CLEAR ?auto_92031 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92024 ?auto_92025 ?auto_92031 ?auto_92028 )
      ( MAKE-2PILE ?auto_92024 ?auto_92025 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92032 - BLOCK
      ?auto_92033 - BLOCK
    )
    :vars
    (
      ?auto_92039 - BLOCK
      ?auto_92035 - BLOCK
      ?auto_92038 - BLOCK
      ?auto_92036 - BLOCK
      ?auto_92034 - BLOCK
      ?auto_92037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92039 ?auto_92033 ) ( ON-TABLE ?auto_92032 ) ( ON ?auto_92033 ?auto_92032 ) ( not ( = ?auto_92032 ?auto_92033 ) ) ( not ( = ?auto_92032 ?auto_92039 ) ) ( not ( = ?auto_92033 ?auto_92039 ) ) ( not ( = ?auto_92032 ?auto_92035 ) ) ( not ( = ?auto_92032 ?auto_92038 ) ) ( not ( = ?auto_92033 ?auto_92035 ) ) ( not ( = ?auto_92033 ?auto_92038 ) ) ( not ( = ?auto_92039 ?auto_92035 ) ) ( not ( = ?auto_92039 ?auto_92038 ) ) ( not ( = ?auto_92035 ?auto_92038 ) ) ( not ( = ?auto_92036 ?auto_92034 ) ) ( not ( = ?auto_92036 ?auto_92038 ) ) ( not ( = ?auto_92034 ?auto_92038 ) ) ( not ( = ?auto_92032 ?auto_92034 ) ) ( not ( = ?auto_92032 ?auto_92036 ) ) ( not ( = ?auto_92033 ?auto_92034 ) ) ( not ( = ?auto_92033 ?auto_92036 ) ) ( not ( = ?auto_92039 ?auto_92034 ) ) ( not ( = ?auto_92039 ?auto_92036 ) ) ( not ( = ?auto_92035 ?auto_92034 ) ) ( not ( = ?auto_92035 ?auto_92036 ) ) ( ON ?auto_92036 ?auto_92037 ) ( not ( = ?auto_92032 ?auto_92037 ) ) ( not ( = ?auto_92033 ?auto_92037 ) ) ( not ( = ?auto_92039 ?auto_92037 ) ) ( not ( = ?auto_92035 ?auto_92037 ) ) ( not ( = ?auto_92038 ?auto_92037 ) ) ( not ( = ?auto_92036 ?auto_92037 ) ) ( not ( = ?auto_92034 ?auto_92037 ) ) ( ON ?auto_92034 ?auto_92036 ) ( ON-TABLE ?auto_92037 ) ( ON ?auto_92038 ?auto_92034 ) ( CLEAR ?auto_92039 ) ( ON ?auto_92035 ?auto_92038 ) ( CLEAR ?auto_92035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92037 ?auto_92036 ?auto_92034 ?auto_92038 )
      ( MAKE-2PILE ?auto_92032 ?auto_92033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92056 - BLOCK
      ?auto_92057 - BLOCK
    )
    :vars
    (
      ?auto_92060 - BLOCK
      ?auto_92061 - BLOCK
      ?auto_92059 - BLOCK
      ?auto_92058 - BLOCK
      ?auto_92063 - BLOCK
      ?auto_92062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92056 ) ( not ( = ?auto_92056 ?auto_92057 ) ) ( not ( = ?auto_92056 ?auto_92060 ) ) ( not ( = ?auto_92057 ?auto_92060 ) ) ( not ( = ?auto_92056 ?auto_92061 ) ) ( not ( = ?auto_92056 ?auto_92059 ) ) ( not ( = ?auto_92057 ?auto_92061 ) ) ( not ( = ?auto_92057 ?auto_92059 ) ) ( not ( = ?auto_92060 ?auto_92061 ) ) ( not ( = ?auto_92060 ?auto_92059 ) ) ( not ( = ?auto_92061 ?auto_92059 ) ) ( not ( = ?auto_92058 ?auto_92063 ) ) ( not ( = ?auto_92058 ?auto_92059 ) ) ( not ( = ?auto_92063 ?auto_92059 ) ) ( not ( = ?auto_92056 ?auto_92063 ) ) ( not ( = ?auto_92056 ?auto_92058 ) ) ( not ( = ?auto_92057 ?auto_92063 ) ) ( not ( = ?auto_92057 ?auto_92058 ) ) ( not ( = ?auto_92060 ?auto_92063 ) ) ( not ( = ?auto_92060 ?auto_92058 ) ) ( not ( = ?auto_92061 ?auto_92063 ) ) ( not ( = ?auto_92061 ?auto_92058 ) ) ( ON ?auto_92058 ?auto_92062 ) ( not ( = ?auto_92056 ?auto_92062 ) ) ( not ( = ?auto_92057 ?auto_92062 ) ) ( not ( = ?auto_92060 ?auto_92062 ) ) ( not ( = ?auto_92061 ?auto_92062 ) ) ( not ( = ?auto_92059 ?auto_92062 ) ) ( not ( = ?auto_92058 ?auto_92062 ) ) ( not ( = ?auto_92063 ?auto_92062 ) ) ( ON ?auto_92063 ?auto_92058 ) ( ON-TABLE ?auto_92062 ) ( ON ?auto_92059 ?auto_92063 ) ( ON ?auto_92061 ?auto_92059 ) ( ON ?auto_92060 ?auto_92061 ) ( CLEAR ?auto_92060 ) ( HOLDING ?auto_92057 ) ( CLEAR ?auto_92056 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92056 ?auto_92057 ?auto_92060 )
      ( MAKE-2PILE ?auto_92056 ?auto_92057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92064 - BLOCK
      ?auto_92065 - BLOCK
    )
    :vars
    (
      ?auto_92070 - BLOCK
      ?auto_92068 - BLOCK
      ?auto_92069 - BLOCK
      ?auto_92071 - BLOCK
      ?auto_92066 - BLOCK
      ?auto_92067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92064 ) ( not ( = ?auto_92064 ?auto_92065 ) ) ( not ( = ?auto_92064 ?auto_92070 ) ) ( not ( = ?auto_92065 ?auto_92070 ) ) ( not ( = ?auto_92064 ?auto_92068 ) ) ( not ( = ?auto_92064 ?auto_92069 ) ) ( not ( = ?auto_92065 ?auto_92068 ) ) ( not ( = ?auto_92065 ?auto_92069 ) ) ( not ( = ?auto_92070 ?auto_92068 ) ) ( not ( = ?auto_92070 ?auto_92069 ) ) ( not ( = ?auto_92068 ?auto_92069 ) ) ( not ( = ?auto_92071 ?auto_92066 ) ) ( not ( = ?auto_92071 ?auto_92069 ) ) ( not ( = ?auto_92066 ?auto_92069 ) ) ( not ( = ?auto_92064 ?auto_92066 ) ) ( not ( = ?auto_92064 ?auto_92071 ) ) ( not ( = ?auto_92065 ?auto_92066 ) ) ( not ( = ?auto_92065 ?auto_92071 ) ) ( not ( = ?auto_92070 ?auto_92066 ) ) ( not ( = ?auto_92070 ?auto_92071 ) ) ( not ( = ?auto_92068 ?auto_92066 ) ) ( not ( = ?auto_92068 ?auto_92071 ) ) ( ON ?auto_92071 ?auto_92067 ) ( not ( = ?auto_92064 ?auto_92067 ) ) ( not ( = ?auto_92065 ?auto_92067 ) ) ( not ( = ?auto_92070 ?auto_92067 ) ) ( not ( = ?auto_92068 ?auto_92067 ) ) ( not ( = ?auto_92069 ?auto_92067 ) ) ( not ( = ?auto_92071 ?auto_92067 ) ) ( not ( = ?auto_92066 ?auto_92067 ) ) ( ON ?auto_92066 ?auto_92071 ) ( ON-TABLE ?auto_92067 ) ( ON ?auto_92069 ?auto_92066 ) ( ON ?auto_92068 ?auto_92069 ) ( ON ?auto_92070 ?auto_92068 ) ( CLEAR ?auto_92064 ) ( ON ?auto_92065 ?auto_92070 ) ( CLEAR ?auto_92065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92067 ?auto_92071 ?auto_92066 ?auto_92069 ?auto_92068 ?auto_92070 )
      ( MAKE-2PILE ?auto_92064 ?auto_92065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92072 - BLOCK
      ?auto_92073 - BLOCK
    )
    :vars
    (
      ?auto_92075 - BLOCK
      ?auto_92077 - BLOCK
      ?auto_92074 - BLOCK
      ?auto_92079 - BLOCK
      ?auto_92076 - BLOCK
      ?auto_92078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92072 ?auto_92073 ) ) ( not ( = ?auto_92072 ?auto_92075 ) ) ( not ( = ?auto_92073 ?auto_92075 ) ) ( not ( = ?auto_92072 ?auto_92077 ) ) ( not ( = ?auto_92072 ?auto_92074 ) ) ( not ( = ?auto_92073 ?auto_92077 ) ) ( not ( = ?auto_92073 ?auto_92074 ) ) ( not ( = ?auto_92075 ?auto_92077 ) ) ( not ( = ?auto_92075 ?auto_92074 ) ) ( not ( = ?auto_92077 ?auto_92074 ) ) ( not ( = ?auto_92079 ?auto_92076 ) ) ( not ( = ?auto_92079 ?auto_92074 ) ) ( not ( = ?auto_92076 ?auto_92074 ) ) ( not ( = ?auto_92072 ?auto_92076 ) ) ( not ( = ?auto_92072 ?auto_92079 ) ) ( not ( = ?auto_92073 ?auto_92076 ) ) ( not ( = ?auto_92073 ?auto_92079 ) ) ( not ( = ?auto_92075 ?auto_92076 ) ) ( not ( = ?auto_92075 ?auto_92079 ) ) ( not ( = ?auto_92077 ?auto_92076 ) ) ( not ( = ?auto_92077 ?auto_92079 ) ) ( ON ?auto_92079 ?auto_92078 ) ( not ( = ?auto_92072 ?auto_92078 ) ) ( not ( = ?auto_92073 ?auto_92078 ) ) ( not ( = ?auto_92075 ?auto_92078 ) ) ( not ( = ?auto_92077 ?auto_92078 ) ) ( not ( = ?auto_92074 ?auto_92078 ) ) ( not ( = ?auto_92079 ?auto_92078 ) ) ( not ( = ?auto_92076 ?auto_92078 ) ) ( ON ?auto_92076 ?auto_92079 ) ( ON-TABLE ?auto_92078 ) ( ON ?auto_92074 ?auto_92076 ) ( ON ?auto_92077 ?auto_92074 ) ( ON ?auto_92075 ?auto_92077 ) ( ON ?auto_92073 ?auto_92075 ) ( CLEAR ?auto_92073 ) ( HOLDING ?auto_92072 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92072 )
      ( MAKE-2PILE ?auto_92072 ?auto_92073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92080 - BLOCK
      ?auto_92081 - BLOCK
    )
    :vars
    (
      ?auto_92083 - BLOCK
      ?auto_92085 - BLOCK
      ?auto_92084 - BLOCK
      ?auto_92087 - BLOCK
      ?auto_92086 - BLOCK
      ?auto_92082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92080 ?auto_92081 ) ) ( not ( = ?auto_92080 ?auto_92083 ) ) ( not ( = ?auto_92081 ?auto_92083 ) ) ( not ( = ?auto_92080 ?auto_92085 ) ) ( not ( = ?auto_92080 ?auto_92084 ) ) ( not ( = ?auto_92081 ?auto_92085 ) ) ( not ( = ?auto_92081 ?auto_92084 ) ) ( not ( = ?auto_92083 ?auto_92085 ) ) ( not ( = ?auto_92083 ?auto_92084 ) ) ( not ( = ?auto_92085 ?auto_92084 ) ) ( not ( = ?auto_92087 ?auto_92086 ) ) ( not ( = ?auto_92087 ?auto_92084 ) ) ( not ( = ?auto_92086 ?auto_92084 ) ) ( not ( = ?auto_92080 ?auto_92086 ) ) ( not ( = ?auto_92080 ?auto_92087 ) ) ( not ( = ?auto_92081 ?auto_92086 ) ) ( not ( = ?auto_92081 ?auto_92087 ) ) ( not ( = ?auto_92083 ?auto_92086 ) ) ( not ( = ?auto_92083 ?auto_92087 ) ) ( not ( = ?auto_92085 ?auto_92086 ) ) ( not ( = ?auto_92085 ?auto_92087 ) ) ( ON ?auto_92087 ?auto_92082 ) ( not ( = ?auto_92080 ?auto_92082 ) ) ( not ( = ?auto_92081 ?auto_92082 ) ) ( not ( = ?auto_92083 ?auto_92082 ) ) ( not ( = ?auto_92085 ?auto_92082 ) ) ( not ( = ?auto_92084 ?auto_92082 ) ) ( not ( = ?auto_92087 ?auto_92082 ) ) ( not ( = ?auto_92086 ?auto_92082 ) ) ( ON ?auto_92086 ?auto_92087 ) ( ON-TABLE ?auto_92082 ) ( ON ?auto_92084 ?auto_92086 ) ( ON ?auto_92085 ?auto_92084 ) ( ON ?auto_92083 ?auto_92085 ) ( ON ?auto_92081 ?auto_92083 ) ( ON ?auto_92080 ?auto_92081 ) ( CLEAR ?auto_92080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92082 ?auto_92087 ?auto_92086 ?auto_92084 ?auto_92085 ?auto_92083 ?auto_92081 )
      ( MAKE-2PILE ?auto_92080 ?auto_92081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92093 - BLOCK
      ?auto_92094 - BLOCK
      ?auto_92095 - BLOCK
      ?auto_92096 - BLOCK
      ?auto_92097 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92097 ) ( CLEAR ?auto_92096 ) ( ON-TABLE ?auto_92093 ) ( ON ?auto_92094 ?auto_92093 ) ( ON ?auto_92095 ?auto_92094 ) ( ON ?auto_92096 ?auto_92095 ) ( not ( = ?auto_92093 ?auto_92094 ) ) ( not ( = ?auto_92093 ?auto_92095 ) ) ( not ( = ?auto_92093 ?auto_92096 ) ) ( not ( = ?auto_92093 ?auto_92097 ) ) ( not ( = ?auto_92094 ?auto_92095 ) ) ( not ( = ?auto_92094 ?auto_92096 ) ) ( not ( = ?auto_92094 ?auto_92097 ) ) ( not ( = ?auto_92095 ?auto_92096 ) ) ( not ( = ?auto_92095 ?auto_92097 ) ) ( not ( = ?auto_92096 ?auto_92097 ) ) )
    :subtasks
    ( ( !STACK ?auto_92097 ?auto_92096 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92098 - BLOCK
      ?auto_92099 - BLOCK
      ?auto_92100 - BLOCK
      ?auto_92101 - BLOCK
      ?auto_92102 - BLOCK
    )
    :vars
    (
      ?auto_92103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92101 ) ( ON-TABLE ?auto_92098 ) ( ON ?auto_92099 ?auto_92098 ) ( ON ?auto_92100 ?auto_92099 ) ( ON ?auto_92101 ?auto_92100 ) ( not ( = ?auto_92098 ?auto_92099 ) ) ( not ( = ?auto_92098 ?auto_92100 ) ) ( not ( = ?auto_92098 ?auto_92101 ) ) ( not ( = ?auto_92098 ?auto_92102 ) ) ( not ( = ?auto_92099 ?auto_92100 ) ) ( not ( = ?auto_92099 ?auto_92101 ) ) ( not ( = ?auto_92099 ?auto_92102 ) ) ( not ( = ?auto_92100 ?auto_92101 ) ) ( not ( = ?auto_92100 ?auto_92102 ) ) ( not ( = ?auto_92101 ?auto_92102 ) ) ( ON ?auto_92102 ?auto_92103 ) ( CLEAR ?auto_92102 ) ( HAND-EMPTY ) ( not ( = ?auto_92098 ?auto_92103 ) ) ( not ( = ?auto_92099 ?auto_92103 ) ) ( not ( = ?auto_92100 ?auto_92103 ) ) ( not ( = ?auto_92101 ?auto_92103 ) ) ( not ( = ?auto_92102 ?auto_92103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92102 ?auto_92103 )
      ( MAKE-5PILE ?auto_92098 ?auto_92099 ?auto_92100 ?auto_92101 ?auto_92102 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92104 - BLOCK
      ?auto_92105 - BLOCK
      ?auto_92106 - BLOCK
      ?auto_92107 - BLOCK
      ?auto_92108 - BLOCK
    )
    :vars
    (
      ?auto_92109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92104 ) ( ON ?auto_92105 ?auto_92104 ) ( ON ?auto_92106 ?auto_92105 ) ( not ( = ?auto_92104 ?auto_92105 ) ) ( not ( = ?auto_92104 ?auto_92106 ) ) ( not ( = ?auto_92104 ?auto_92107 ) ) ( not ( = ?auto_92104 ?auto_92108 ) ) ( not ( = ?auto_92105 ?auto_92106 ) ) ( not ( = ?auto_92105 ?auto_92107 ) ) ( not ( = ?auto_92105 ?auto_92108 ) ) ( not ( = ?auto_92106 ?auto_92107 ) ) ( not ( = ?auto_92106 ?auto_92108 ) ) ( not ( = ?auto_92107 ?auto_92108 ) ) ( ON ?auto_92108 ?auto_92109 ) ( CLEAR ?auto_92108 ) ( not ( = ?auto_92104 ?auto_92109 ) ) ( not ( = ?auto_92105 ?auto_92109 ) ) ( not ( = ?auto_92106 ?auto_92109 ) ) ( not ( = ?auto_92107 ?auto_92109 ) ) ( not ( = ?auto_92108 ?auto_92109 ) ) ( HOLDING ?auto_92107 ) ( CLEAR ?auto_92106 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92104 ?auto_92105 ?auto_92106 ?auto_92107 )
      ( MAKE-5PILE ?auto_92104 ?auto_92105 ?auto_92106 ?auto_92107 ?auto_92108 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92110 - BLOCK
      ?auto_92111 - BLOCK
      ?auto_92112 - BLOCK
      ?auto_92113 - BLOCK
      ?auto_92114 - BLOCK
    )
    :vars
    (
      ?auto_92115 - BLOCK
      ?auto_92116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92110 ) ( ON ?auto_92111 ?auto_92110 ) ( ON ?auto_92112 ?auto_92111 ) ( not ( = ?auto_92110 ?auto_92111 ) ) ( not ( = ?auto_92110 ?auto_92112 ) ) ( not ( = ?auto_92110 ?auto_92113 ) ) ( not ( = ?auto_92110 ?auto_92114 ) ) ( not ( = ?auto_92111 ?auto_92112 ) ) ( not ( = ?auto_92111 ?auto_92113 ) ) ( not ( = ?auto_92111 ?auto_92114 ) ) ( not ( = ?auto_92112 ?auto_92113 ) ) ( not ( = ?auto_92112 ?auto_92114 ) ) ( not ( = ?auto_92113 ?auto_92114 ) ) ( ON ?auto_92114 ?auto_92115 ) ( not ( = ?auto_92110 ?auto_92115 ) ) ( not ( = ?auto_92111 ?auto_92115 ) ) ( not ( = ?auto_92112 ?auto_92115 ) ) ( not ( = ?auto_92113 ?auto_92115 ) ) ( not ( = ?auto_92114 ?auto_92115 ) ) ( CLEAR ?auto_92112 ) ( ON ?auto_92113 ?auto_92114 ) ( CLEAR ?auto_92113 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92116 ) ( ON ?auto_92115 ?auto_92116 ) ( not ( = ?auto_92116 ?auto_92115 ) ) ( not ( = ?auto_92116 ?auto_92114 ) ) ( not ( = ?auto_92116 ?auto_92113 ) ) ( not ( = ?auto_92110 ?auto_92116 ) ) ( not ( = ?auto_92111 ?auto_92116 ) ) ( not ( = ?auto_92112 ?auto_92116 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92116 ?auto_92115 ?auto_92114 )
      ( MAKE-5PILE ?auto_92110 ?auto_92111 ?auto_92112 ?auto_92113 ?auto_92114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92117 - BLOCK
      ?auto_92118 - BLOCK
      ?auto_92119 - BLOCK
      ?auto_92120 - BLOCK
      ?auto_92121 - BLOCK
    )
    :vars
    (
      ?auto_92123 - BLOCK
      ?auto_92122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92117 ) ( ON ?auto_92118 ?auto_92117 ) ( not ( = ?auto_92117 ?auto_92118 ) ) ( not ( = ?auto_92117 ?auto_92119 ) ) ( not ( = ?auto_92117 ?auto_92120 ) ) ( not ( = ?auto_92117 ?auto_92121 ) ) ( not ( = ?auto_92118 ?auto_92119 ) ) ( not ( = ?auto_92118 ?auto_92120 ) ) ( not ( = ?auto_92118 ?auto_92121 ) ) ( not ( = ?auto_92119 ?auto_92120 ) ) ( not ( = ?auto_92119 ?auto_92121 ) ) ( not ( = ?auto_92120 ?auto_92121 ) ) ( ON ?auto_92121 ?auto_92123 ) ( not ( = ?auto_92117 ?auto_92123 ) ) ( not ( = ?auto_92118 ?auto_92123 ) ) ( not ( = ?auto_92119 ?auto_92123 ) ) ( not ( = ?auto_92120 ?auto_92123 ) ) ( not ( = ?auto_92121 ?auto_92123 ) ) ( ON ?auto_92120 ?auto_92121 ) ( CLEAR ?auto_92120 ) ( ON-TABLE ?auto_92122 ) ( ON ?auto_92123 ?auto_92122 ) ( not ( = ?auto_92122 ?auto_92123 ) ) ( not ( = ?auto_92122 ?auto_92121 ) ) ( not ( = ?auto_92122 ?auto_92120 ) ) ( not ( = ?auto_92117 ?auto_92122 ) ) ( not ( = ?auto_92118 ?auto_92122 ) ) ( not ( = ?auto_92119 ?auto_92122 ) ) ( HOLDING ?auto_92119 ) ( CLEAR ?auto_92118 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92117 ?auto_92118 ?auto_92119 )
      ( MAKE-5PILE ?auto_92117 ?auto_92118 ?auto_92119 ?auto_92120 ?auto_92121 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92124 - BLOCK
      ?auto_92125 - BLOCK
      ?auto_92126 - BLOCK
      ?auto_92127 - BLOCK
      ?auto_92128 - BLOCK
    )
    :vars
    (
      ?auto_92129 - BLOCK
      ?auto_92130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92124 ) ( ON ?auto_92125 ?auto_92124 ) ( not ( = ?auto_92124 ?auto_92125 ) ) ( not ( = ?auto_92124 ?auto_92126 ) ) ( not ( = ?auto_92124 ?auto_92127 ) ) ( not ( = ?auto_92124 ?auto_92128 ) ) ( not ( = ?auto_92125 ?auto_92126 ) ) ( not ( = ?auto_92125 ?auto_92127 ) ) ( not ( = ?auto_92125 ?auto_92128 ) ) ( not ( = ?auto_92126 ?auto_92127 ) ) ( not ( = ?auto_92126 ?auto_92128 ) ) ( not ( = ?auto_92127 ?auto_92128 ) ) ( ON ?auto_92128 ?auto_92129 ) ( not ( = ?auto_92124 ?auto_92129 ) ) ( not ( = ?auto_92125 ?auto_92129 ) ) ( not ( = ?auto_92126 ?auto_92129 ) ) ( not ( = ?auto_92127 ?auto_92129 ) ) ( not ( = ?auto_92128 ?auto_92129 ) ) ( ON ?auto_92127 ?auto_92128 ) ( ON-TABLE ?auto_92130 ) ( ON ?auto_92129 ?auto_92130 ) ( not ( = ?auto_92130 ?auto_92129 ) ) ( not ( = ?auto_92130 ?auto_92128 ) ) ( not ( = ?auto_92130 ?auto_92127 ) ) ( not ( = ?auto_92124 ?auto_92130 ) ) ( not ( = ?auto_92125 ?auto_92130 ) ) ( not ( = ?auto_92126 ?auto_92130 ) ) ( CLEAR ?auto_92125 ) ( ON ?auto_92126 ?auto_92127 ) ( CLEAR ?auto_92126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92130 ?auto_92129 ?auto_92128 ?auto_92127 )
      ( MAKE-5PILE ?auto_92124 ?auto_92125 ?auto_92126 ?auto_92127 ?auto_92128 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92131 - BLOCK
      ?auto_92132 - BLOCK
      ?auto_92133 - BLOCK
      ?auto_92134 - BLOCK
      ?auto_92135 - BLOCK
    )
    :vars
    (
      ?auto_92136 - BLOCK
      ?auto_92137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92131 ) ( not ( = ?auto_92131 ?auto_92132 ) ) ( not ( = ?auto_92131 ?auto_92133 ) ) ( not ( = ?auto_92131 ?auto_92134 ) ) ( not ( = ?auto_92131 ?auto_92135 ) ) ( not ( = ?auto_92132 ?auto_92133 ) ) ( not ( = ?auto_92132 ?auto_92134 ) ) ( not ( = ?auto_92132 ?auto_92135 ) ) ( not ( = ?auto_92133 ?auto_92134 ) ) ( not ( = ?auto_92133 ?auto_92135 ) ) ( not ( = ?auto_92134 ?auto_92135 ) ) ( ON ?auto_92135 ?auto_92136 ) ( not ( = ?auto_92131 ?auto_92136 ) ) ( not ( = ?auto_92132 ?auto_92136 ) ) ( not ( = ?auto_92133 ?auto_92136 ) ) ( not ( = ?auto_92134 ?auto_92136 ) ) ( not ( = ?auto_92135 ?auto_92136 ) ) ( ON ?auto_92134 ?auto_92135 ) ( ON-TABLE ?auto_92137 ) ( ON ?auto_92136 ?auto_92137 ) ( not ( = ?auto_92137 ?auto_92136 ) ) ( not ( = ?auto_92137 ?auto_92135 ) ) ( not ( = ?auto_92137 ?auto_92134 ) ) ( not ( = ?auto_92131 ?auto_92137 ) ) ( not ( = ?auto_92132 ?auto_92137 ) ) ( not ( = ?auto_92133 ?auto_92137 ) ) ( ON ?auto_92133 ?auto_92134 ) ( CLEAR ?auto_92133 ) ( HOLDING ?auto_92132 ) ( CLEAR ?auto_92131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92131 ?auto_92132 )
      ( MAKE-5PILE ?auto_92131 ?auto_92132 ?auto_92133 ?auto_92134 ?auto_92135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92138 - BLOCK
      ?auto_92139 - BLOCK
      ?auto_92140 - BLOCK
      ?auto_92141 - BLOCK
      ?auto_92142 - BLOCK
    )
    :vars
    (
      ?auto_92143 - BLOCK
      ?auto_92144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92138 ) ( not ( = ?auto_92138 ?auto_92139 ) ) ( not ( = ?auto_92138 ?auto_92140 ) ) ( not ( = ?auto_92138 ?auto_92141 ) ) ( not ( = ?auto_92138 ?auto_92142 ) ) ( not ( = ?auto_92139 ?auto_92140 ) ) ( not ( = ?auto_92139 ?auto_92141 ) ) ( not ( = ?auto_92139 ?auto_92142 ) ) ( not ( = ?auto_92140 ?auto_92141 ) ) ( not ( = ?auto_92140 ?auto_92142 ) ) ( not ( = ?auto_92141 ?auto_92142 ) ) ( ON ?auto_92142 ?auto_92143 ) ( not ( = ?auto_92138 ?auto_92143 ) ) ( not ( = ?auto_92139 ?auto_92143 ) ) ( not ( = ?auto_92140 ?auto_92143 ) ) ( not ( = ?auto_92141 ?auto_92143 ) ) ( not ( = ?auto_92142 ?auto_92143 ) ) ( ON ?auto_92141 ?auto_92142 ) ( ON-TABLE ?auto_92144 ) ( ON ?auto_92143 ?auto_92144 ) ( not ( = ?auto_92144 ?auto_92143 ) ) ( not ( = ?auto_92144 ?auto_92142 ) ) ( not ( = ?auto_92144 ?auto_92141 ) ) ( not ( = ?auto_92138 ?auto_92144 ) ) ( not ( = ?auto_92139 ?auto_92144 ) ) ( not ( = ?auto_92140 ?auto_92144 ) ) ( ON ?auto_92140 ?auto_92141 ) ( CLEAR ?auto_92138 ) ( ON ?auto_92139 ?auto_92140 ) ( CLEAR ?auto_92139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92144 ?auto_92143 ?auto_92142 ?auto_92141 ?auto_92140 )
      ( MAKE-5PILE ?auto_92138 ?auto_92139 ?auto_92140 ?auto_92141 ?auto_92142 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92145 - BLOCK
      ?auto_92146 - BLOCK
      ?auto_92147 - BLOCK
      ?auto_92148 - BLOCK
      ?auto_92149 - BLOCK
    )
    :vars
    (
      ?auto_92150 - BLOCK
      ?auto_92151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92145 ?auto_92146 ) ) ( not ( = ?auto_92145 ?auto_92147 ) ) ( not ( = ?auto_92145 ?auto_92148 ) ) ( not ( = ?auto_92145 ?auto_92149 ) ) ( not ( = ?auto_92146 ?auto_92147 ) ) ( not ( = ?auto_92146 ?auto_92148 ) ) ( not ( = ?auto_92146 ?auto_92149 ) ) ( not ( = ?auto_92147 ?auto_92148 ) ) ( not ( = ?auto_92147 ?auto_92149 ) ) ( not ( = ?auto_92148 ?auto_92149 ) ) ( ON ?auto_92149 ?auto_92150 ) ( not ( = ?auto_92145 ?auto_92150 ) ) ( not ( = ?auto_92146 ?auto_92150 ) ) ( not ( = ?auto_92147 ?auto_92150 ) ) ( not ( = ?auto_92148 ?auto_92150 ) ) ( not ( = ?auto_92149 ?auto_92150 ) ) ( ON ?auto_92148 ?auto_92149 ) ( ON-TABLE ?auto_92151 ) ( ON ?auto_92150 ?auto_92151 ) ( not ( = ?auto_92151 ?auto_92150 ) ) ( not ( = ?auto_92151 ?auto_92149 ) ) ( not ( = ?auto_92151 ?auto_92148 ) ) ( not ( = ?auto_92145 ?auto_92151 ) ) ( not ( = ?auto_92146 ?auto_92151 ) ) ( not ( = ?auto_92147 ?auto_92151 ) ) ( ON ?auto_92147 ?auto_92148 ) ( ON ?auto_92146 ?auto_92147 ) ( CLEAR ?auto_92146 ) ( HOLDING ?auto_92145 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92145 )
      ( MAKE-5PILE ?auto_92145 ?auto_92146 ?auto_92147 ?auto_92148 ?auto_92149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92152 - BLOCK
      ?auto_92153 - BLOCK
      ?auto_92154 - BLOCK
      ?auto_92155 - BLOCK
      ?auto_92156 - BLOCK
    )
    :vars
    (
      ?auto_92157 - BLOCK
      ?auto_92158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92152 ?auto_92153 ) ) ( not ( = ?auto_92152 ?auto_92154 ) ) ( not ( = ?auto_92152 ?auto_92155 ) ) ( not ( = ?auto_92152 ?auto_92156 ) ) ( not ( = ?auto_92153 ?auto_92154 ) ) ( not ( = ?auto_92153 ?auto_92155 ) ) ( not ( = ?auto_92153 ?auto_92156 ) ) ( not ( = ?auto_92154 ?auto_92155 ) ) ( not ( = ?auto_92154 ?auto_92156 ) ) ( not ( = ?auto_92155 ?auto_92156 ) ) ( ON ?auto_92156 ?auto_92157 ) ( not ( = ?auto_92152 ?auto_92157 ) ) ( not ( = ?auto_92153 ?auto_92157 ) ) ( not ( = ?auto_92154 ?auto_92157 ) ) ( not ( = ?auto_92155 ?auto_92157 ) ) ( not ( = ?auto_92156 ?auto_92157 ) ) ( ON ?auto_92155 ?auto_92156 ) ( ON-TABLE ?auto_92158 ) ( ON ?auto_92157 ?auto_92158 ) ( not ( = ?auto_92158 ?auto_92157 ) ) ( not ( = ?auto_92158 ?auto_92156 ) ) ( not ( = ?auto_92158 ?auto_92155 ) ) ( not ( = ?auto_92152 ?auto_92158 ) ) ( not ( = ?auto_92153 ?auto_92158 ) ) ( not ( = ?auto_92154 ?auto_92158 ) ) ( ON ?auto_92154 ?auto_92155 ) ( ON ?auto_92153 ?auto_92154 ) ( ON ?auto_92152 ?auto_92153 ) ( CLEAR ?auto_92152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92158 ?auto_92157 ?auto_92156 ?auto_92155 ?auto_92154 ?auto_92153 )
      ( MAKE-5PILE ?auto_92152 ?auto_92153 ?auto_92154 ?auto_92155 ?auto_92156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92159 - BLOCK
      ?auto_92160 - BLOCK
      ?auto_92161 - BLOCK
      ?auto_92162 - BLOCK
      ?auto_92163 - BLOCK
    )
    :vars
    (
      ?auto_92164 - BLOCK
      ?auto_92165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92159 ?auto_92160 ) ) ( not ( = ?auto_92159 ?auto_92161 ) ) ( not ( = ?auto_92159 ?auto_92162 ) ) ( not ( = ?auto_92159 ?auto_92163 ) ) ( not ( = ?auto_92160 ?auto_92161 ) ) ( not ( = ?auto_92160 ?auto_92162 ) ) ( not ( = ?auto_92160 ?auto_92163 ) ) ( not ( = ?auto_92161 ?auto_92162 ) ) ( not ( = ?auto_92161 ?auto_92163 ) ) ( not ( = ?auto_92162 ?auto_92163 ) ) ( ON ?auto_92163 ?auto_92164 ) ( not ( = ?auto_92159 ?auto_92164 ) ) ( not ( = ?auto_92160 ?auto_92164 ) ) ( not ( = ?auto_92161 ?auto_92164 ) ) ( not ( = ?auto_92162 ?auto_92164 ) ) ( not ( = ?auto_92163 ?auto_92164 ) ) ( ON ?auto_92162 ?auto_92163 ) ( ON-TABLE ?auto_92165 ) ( ON ?auto_92164 ?auto_92165 ) ( not ( = ?auto_92165 ?auto_92164 ) ) ( not ( = ?auto_92165 ?auto_92163 ) ) ( not ( = ?auto_92165 ?auto_92162 ) ) ( not ( = ?auto_92159 ?auto_92165 ) ) ( not ( = ?auto_92160 ?auto_92165 ) ) ( not ( = ?auto_92161 ?auto_92165 ) ) ( ON ?auto_92161 ?auto_92162 ) ( ON ?auto_92160 ?auto_92161 ) ( HOLDING ?auto_92159 ) ( CLEAR ?auto_92160 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92165 ?auto_92164 ?auto_92163 ?auto_92162 ?auto_92161 ?auto_92160 ?auto_92159 )
      ( MAKE-5PILE ?auto_92159 ?auto_92160 ?auto_92161 ?auto_92162 ?auto_92163 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92166 - BLOCK
      ?auto_92167 - BLOCK
      ?auto_92168 - BLOCK
      ?auto_92169 - BLOCK
      ?auto_92170 - BLOCK
    )
    :vars
    (
      ?auto_92172 - BLOCK
      ?auto_92171 - BLOCK
      ?auto_92173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92166 ?auto_92167 ) ) ( not ( = ?auto_92166 ?auto_92168 ) ) ( not ( = ?auto_92166 ?auto_92169 ) ) ( not ( = ?auto_92166 ?auto_92170 ) ) ( not ( = ?auto_92167 ?auto_92168 ) ) ( not ( = ?auto_92167 ?auto_92169 ) ) ( not ( = ?auto_92167 ?auto_92170 ) ) ( not ( = ?auto_92168 ?auto_92169 ) ) ( not ( = ?auto_92168 ?auto_92170 ) ) ( not ( = ?auto_92169 ?auto_92170 ) ) ( ON ?auto_92170 ?auto_92172 ) ( not ( = ?auto_92166 ?auto_92172 ) ) ( not ( = ?auto_92167 ?auto_92172 ) ) ( not ( = ?auto_92168 ?auto_92172 ) ) ( not ( = ?auto_92169 ?auto_92172 ) ) ( not ( = ?auto_92170 ?auto_92172 ) ) ( ON ?auto_92169 ?auto_92170 ) ( ON-TABLE ?auto_92171 ) ( ON ?auto_92172 ?auto_92171 ) ( not ( = ?auto_92171 ?auto_92172 ) ) ( not ( = ?auto_92171 ?auto_92170 ) ) ( not ( = ?auto_92171 ?auto_92169 ) ) ( not ( = ?auto_92166 ?auto_92171 ) ) ( not ( = ?auto_92167 ?auto_92171 ) ) ( not ( = ?auto_92168 ?auto_92171 ) ) ( ON ?auto_92168 ?auto_92169 ) ( ON ?auto_92167 ?auto_92168 ) ( CLEAR ?auto_92167 ) ( ON ?auto_92166 ?auto_92173 ) ( CLEAR ?auto_92166 ) ( HAND-EMPTY ) ( not ( = ?auto_92166 ?auto_92173 ) ) ( not ( = ?auto_92167 ?auto_92173 ) ) ( not ( = ?auto_92168 ?auto_92173 ) ) ( not ( = ?auto_92169 ?auto_92173 ) ) ( not ( = ?auto_92170 ?auto_92173 ) ) ( not ( = ?auto_92172 ?auto_92173 ) ) ( not ( = ?auto_92171 ?auto_92173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92166 ?auto_92173 )
      ( MAKE-5PILE ?auto_92166 ?auto_92167 ?auto_92168 ?auto_92169 ?auto_92170 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92174 - BLOCK
      ?auto_92175 - BLOCK
      ?auto_92176 - BLOCK
      ?auto_92177 - BLOCK
      ?auto_92178 - BLOCK
    )
    :vars
    (
      ?auto_92181 - BLOCK
      ?auto_92180 - BLOCK
      ?auto_92179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92174 ?auto_92175 ) ) ( not ( = ?auto_92174 ?auto_92176 ) ) ( not ( = ?auto_92174 ?auto_92177 ) ) ( not ( = ?auto_92174 ?auto_92178 ) ) ( not ( = ?auto_92175 ?auto_92176 ) ) ( not ( = ?auto_92175 ?auto_92177 ) ) ( not ( = ?auto_92175 ?auto_92178 ) ) ( not ( = ?auto_92176 ?auto_92177 ) ) ( not ( = ?auto_92176 ?auto_92178 ) ) ( not ( = ?auto_92177 ?auto_92178 ) ) ( ON ?auto_92178 ?auto_92181 ) ( not ( = ?auto_92174 ?auto_92181 ) ) ( not ( = ?auto_92175 ?auto_92181 ) ) ( not ( = ?auto_92176 ?auto_92181 ) ) ( not ( = ?auto_92177 ?auto_92181 ) ) ( not ( = ?auto_92178 ?auto_92181 ) ) ( ON ?auto_92177 ?auto_92178 ) ( ON-TABLE ?auto_92180 ) ( ON ?auto_92181 ?auto_92180 ) ( not ( = ?auto_92180 ?auto_92181 ) ) ( not ( = ?auto_92180 ?auto_92178 ) ) ( not ( = ?auto_92180 ?auto_92177 ) ) ( not ( = ?auto_92174 ?auto_92180 ) ) ( not ( = ?auto_92175 ?auto_92180 ) ) ( not ( = ?auto_92176 ?auto_92180 ) ) ( ON ?auto_92176 ?auto_92177 ) ( ON ?auto_92174 ?auto_92179 ) ( CLEAR ?auto_92174 ) ( not ( = ?auto_92174 ?auto_92179 ) ) ( not ( = ?auto_92175 ?auto_92179 ) ) ( not ( = ?auto_92176 ?auto_92179 ) ) ( not ( = ?auto_92177 ?auto_92179 ) ) ( not ( = ?auto_92178 ?auto_92179 ) ) ( not ( = ?auto_92181 ?auto_92179 ) ) ( not ( = ?auto_92180 ?auto_92179 ) ) ( HOLDING ?auto_92175 ) ( CLEAR ?auto_92176 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92180 ?auto_92181 ?auto_92178 ?auto_92177 ?auto_92176 ?auto_92175 )
      ( MAKE-5PILE ?auto_92174 ?auto_92175 ?auto_92176 ?auto_92177 ?auto_92178 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92182 - BLOCK
      ?auto_92183 - BLOCK
      ?auto_92184 - BLOCK
      ?auto_92185 - BLOCK
      ?auto_92186 - BLOCK
    )
    :vars
    (
      ?auto_92189 - BLOCK
      ?auto_92188 - BLOCK
      ?auto_92187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92182 ?auto_92183 ) ) ( not ( = ?auto_92182 ?auto_92184 ) ) ( not ( = ?auto_92182 ?auto_92185 ) ) ( not ( = ?auto_92182 ?auto_92186 ) ) ( not ( = ?auto_92183 ?auto_92184 ) ) ( not ( = ?auto_92183 ?auto_92185 ) ) ( not ( = ?auto_92183 ?auto_92186 ) ) ( not ( = ?auto_92184 ?auto_92185 ) ) ( not ( = ?auto_92184 ?auto_92186 ) ) ( not ( = ?auto_92185 ?auto_92186 ) ) ( ON ?auto_92186 ?auto_92189 ) ( not ( = ?auto_92182 ?auto_92189 ) ) ( not ( = ?auto_92183 ?auto_92189 ) ) ( not ( = ?auto_92184 ?auto_92189 ) ) ( not ( = ?auto_92185 ?auto_92189 ) ) ( not ( = ?auto_92186 ?auto_92189 ) ) ( ON ?auto_92185 ?auto_92186 ) ( ON-TABLE ?auto_92188 ) ( ON ?auto_92189 ?auto_92188 ) ( not ( = ?auto_92188 ?auto_92189 ) ) ( not ( = ?auto_92188 ?auto_92186 ) ) ( not ( = ?auto_92188 ?auto_92185 ) ) ( not ( = ?auto_92182 ?auto_92188 ) ) ( not ( = ?auto_92183 ?auto_92188 ) ) ( not ( = ?auto_92184 ?auto_92188 ) ) ( ON ?auto_92184 ?auto_92185 ) ( ON ?auto_92182 ?auto_92187 ) ( not ( = ?auto_92182 ?auto_92187 ) ) ( not ( = ?auto_92183 ?auto_92187 ) ) ( not ( = ?auto_92184 ?auto_92187 ) ) ( not ( = ?auto_92185 ?auto_92187 ) ) ( not ( = ?auto_92186 ?auto_92187 ) ) ( not ( = ?auto_92189 ?auto_92187 ) ) ( not ( = ?auto_92188 ?auto_92187 ) ) ( CLEAR ?auto_92184 ) ( ON ?auto_92183 ?auto_92182 ) ( CLEAR ?auto_92183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92187 ?auto_92182 )
      ( MAKE-5PILE ?auto_92182 ?auto_92183 ?auto_92184 ?auto_92185 ?auto_92186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92190 - BLOCK
      ?auto_92191 - BLOCK
      ?auto_92192 - BLOCK
      ?auto_92193 - BLOCK
      ?auto_92194 - BLOCK
    )
    :vars
    (
      ?auto_92195 - BLOCK
      ?auto_92197 - BLOCK
      ?auto_92196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92190 ?auto_92191 ) ) ( not ( = ?auto_92190 ?auto_92192 ) ) ( not ( = ?auto_92190 ?auto_92193 ) ) ( not ( = ?auto_92190 ?auto_92194 ) ) ( not ( = ?auto_92191 ?auto_92192 ) ) ( not ( = ?auto_92191 ?auto_92193 ) ) ( not ( = ?auto_92191 ?auto_92194 ) ) ( not ( = ?auto_92192 ?auto_92193 ) ) ( not ( = ?auto_92192 ?auto_92194 ) ) ( not ( = ?auto_92193 ?auto_92194 ) ) ( ON ?auto_92194 ?auto_92195 ) ( not ( = ?auto_92190 ?auto_92195 ) ) ( not ( = ?auto_92191 ?auto_92195 ) ) ( not ( = ?auto_92192 ?auto_92195 ) ) ( not ( = ?auto_92193 ?auto_92195 ) ) ( not ( = ?auto_92194 ?auto_92195 ) ) ( ON ?auto_92193 ?auto_92194 ) ( ON-TABLE ?auto_92197 ) ( ON ?auto_92195 ?auto_92197 ) ( not ( = ?auto_92197 ?auto_92195 ) ) ( not ( = ?auto_92197 ?auto_92194 ) ) ( not ( = ?auto_92197 ?auto_92193 ) ) ( not ( = ?auto_92190 ?auto_92197 ) ) ( not ( = ?auto_92191 ?auto_92197 ) ) ( not ( = ?auto_92192 ?auto_92197 ) ) ( ON ?auto_92190 ?auto_92196 ) ( not ( = ?auto_92190 ?auto_92196 ) ) ( not ( = ?auto_92191 ?auto_92196 ) ) ( not ( = ?auto_92192 ?auto_92196 ) ) ( not ( = ?auto_92193 ?auto_92196 ) ) ( not ( = ?auto_92194 ?auto_92196 ) ) ( not ( = ?auto_92195 ?auto_92196 ) ) ( not ( = ?auto_92197 ?auto_92196 ) ) ( ON ?auto_92191 ?auto_92190 ) ( CLEAR ?auto_92191 ) ( ON-TABLE ?auto_92196 ) ( HOLDING ?auto_92192 ) ( CLEAR ?auto_92193 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92197 ?auto_92195 ?auto_92194 ?auto_92193 ?auto_92192 )
      ( MAKE-5PILE ?auto_92190 ?auto_92191 ?auto_92192 ?auto_92193 ?auto_92194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92198 - BLOCK
      ?auto_92199 - BLOCK
      ?auto_92200 - BLOCK
      ?auto_92201 - BLOCK
      ?auto_92202 - BLOCK
    )
    :vars
    (
      ?auto_92204 - BLOCK
      ?auto_92205 - BLOCK
      ?auto_92203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92198 ?auto_92199 ) ) ( not ( = ?auto_92198 ?auto_92200 ) ) ( not ( = ?auto_92198 ?auto_92201 ) ) ( not ( = ?auto_92198 ?auto_92202 ) ) ( not ( = ?auto_92199 ?auto_92200 ) ) ( not ( = ?auto_92199 ?auto_92201 ) ) ( not ( = ?auto_92199 ?auto_92202 ) ) ( not ( = ?auto_92200 ?auto_92201 ) ) ( not ( = ?auto_92200 ?auto_92202 ) ) ( not ( = ?auto_92201 ?auto_92202 ) ) ( ON ?auto_92202 ?auto_92204 ) ( not ( = ?auto_92198 ?auto_92204 ) ) ( not ( = ?auto_92199 ?auto_92204 ) ) ( not ( = ?auto_92200 ?auto_92204 ) ) ( not ( = ?auto_92201 ?auto_92204 ) ) ( not ( = ?auto_92202 ?auto_92204 ) ) ( ON ?auto_92201 ?auto_92202 ) ( ON-TABLE ?auto_92205 ) ( ON ?auto_92204 ?auto_92205 ) ( not ( = ?auto_92205 ?auto_92204 ) ) ( not ( = ?auto_92205 ?auto_92202 ) ) ( not ( = ?auto_92205 ?auto_92201 ) ) ( not ( = ?auto_92198 ?auto_92205 ) ) ( not ( = ?auto_92199 ?auto_92205 ) ) ( not ( = ?auto_92200 ?auto_92205 ) ) ( ON ?auto_92198 ?auto_92203 ) ( not ( = ?auto_92198 ?auto_92203 ) ) ( not ( = ?auto_92199 ?auto_92203 ) ) ( not ( = ?auto_92200 ?auto_92203 ) ) ( not ( = ?auto_92201 ?auto_92203 ) ) ( not ( = ?auto_92202 ?auto_92203 ) ) ( not ( = ?auto_92204 ?auto_92203 ) ) ( not ( = ?auto_92205 ?auto_92203 ) ) ( ON ?auto_92199 ?auto_92198 ) ( ON-TABLE ?auto_92203 ) ( CLEAR ?auto_92201 ) ( ON ?auto_92200 ?auto_92199 ) ( CLEAR ?auto_92200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92203 ?auto_92198 ?auto_92199 )
      ( MAKE-5PILE ?auto_92198 ?auto_92199 ?auto_92200 ?auto_92201 ?auto_92202 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92206 - BLOCK
      ?auto_92207 - BLOCK
      ?auto_92208 - BLOCK
      ?auto_92209 - BLOCK
      ?auto_92210 - BLOCK
    )
    :vars
    (
      ?auto_92212 - BLOCK
      ?auto_92211 - BLOCK
      ?auto_92213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92206 ?auto_92207 ) ) ( not ( = ?auto_92206 ?auto_92208 ) ) ( not ( = ?auto_92206 ?auto_92209 ) ) ( not ( = ?auto_92206 ?auto_92210 ) ) ( not ( = ?auto_92207 ?auto_92208 ) ) ( not ( = ?auto_92207 ?auto_92209 ) ) ( not ( = ?auto_92207 ?auto_92210 ) ) ( not ( = ?auto_92208 ?auto_92209 ) ) ( not ( = ?auto_92208 ?auto_92210 ) ) ( not ( = ?auto_92209 ?auto_92210 ) ) ( ON ?auto_92210 ?auto_92212 ) ( not ( = ?auto_92206 ?auto_92212 ) ) ( not ( = ?auto_92207 ?auto_92212 ) ) ( not ( = ?auto_92208 ?auto_92212 ) ) ( not ( = ?auto_92209 ?auto_92212 ) ) ( not ( = ?auto_92210 ?auto_92212 ) ) ( ON-TABLE ?auto_92211 ) ( ON ?auto_92212 ?auto_92211 ) ( not ( = ?auto_92211 ?auto_92212 ) ) ( not ( = ?auto_92211 ?auto_92210 ) ) ( not ( = ?auto_92211 ?auto_92209 ) ) ( not ( = ?auto_92206 ?auto_92211 ) ) ( not ( = ?auto_92207 ?auto_92211 ) ) ( not ( = ?auto_92208 ?auto_92211 ) ) ( ON ?auto_92206 ?auto_92213 ) ( not ( = ?auto_92206 ?auto_92213 ) ) ( not ( = ?auto_92207 ?auto_92213 ) ) ( not ( = ?auto_92208 ?auto_92213 ) ) ( not ( = ?auto_92209 ?auto_92213 ) ) ( not ( = ?auto_92210 ?auto_92213 ) ) ( not ( = ?auto_92212 ?auto_92213 ) ) ( not ( = ?auto_92211 ?auto_92213 ) ) ( ON ?auto_92207 ?auto_92206 ) ( ON-TABLE ?auto_92213 ) ( ON ?auto_92208 ?auto_92207 ) ( CLEAR ?auto_92208 ) ( HOLDING ?auto_92209 ) ( CLEAR ?auto_92210 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92211 ?auto_92212 ?auto_92210 ?auto_92209 )
      ( MAKE-5PILE ?auto_92206 ?auto_92207 ?auto_92208 ?auto_92209 ?auto_92210 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92214 - BLOCK
      ?auto_92215 - BLOCK
      ?auto_92216 - BLOCK
      ?auto_92217 - BLOCK
      ?auto_92218 - BLOCK
    )
    :vars
    (
      ?auto_92221 - BLOCK
      ?auto_92220 - BLOCK
      ?auto_92219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92214 ?auto_92215 ) ) ( not ( = ?auto_92214 ?auto_92216 ) ) ( not ( = ?auto_92214 ?auto_92217 ) ) ( not ( = ?auto_92214 ?auto_92218 ) ) ( not ( = ?auto_92215 ?auto_92216 ) ) ( not ( = ?auto_92215 ?auto_92217 ) ) ( not ( = ?auto_92215 ?auto_92218 ) ) ( not ( = ?auto_92216 ?auto_92217 ) ) ( not ( = ?auto_92216 ?auto_92218 ) ) ( not ( = ?auto_92217 ?auto_92218 ) ) ( ON ?auto_92218 ?auto_92221 ) ( not ( = ?auto_92214 ?auto_92221 ) ) ( not ( = ?auto_92215 ?auto_92221 ) ) ( not ( = ?auto_92216 ?auto_92221 ) ) ( not ( = ?auto_92217 ?auto_92221 ) ) ( not ( = ?auto_92218 ?auto_92221 ) ) ( ON-TABLE ?auto_92220 ) ( ON ?auto_92221 ?auto_92220 ) ( not ( = ?auto_92220 ?auto_92221 ) ) ( not ( = ?auto_92220 ?auto_92218 ) ) ( not ( = ?auto_92220 ?auto_92217 ) ) ( not ( = ?auto_92214 ?auto_92220 ) ) ( not ( = ?auto_92215 ?auto_92220 ) ) ( not ( = ?auto_92216 ?auto_92220 ) ) ( ON ?auto_92214 ?auto_92219 ) ( not ( = ?auto_92214 ?auto_92219 ) ) ( not ( = ?auto_92215 ?auto_92219 ) ) ( not ( = ?auto_92216 ?auto_92219 ) ) ( not ( = ?auto_92217 ?auto_92219 ) ) ( not ( = ?auto_92218 ?auto_92219 ) ) ( not ( = ?auto_92221 ?auto_92219 ) ) ( not ( = ?auto_92220 ?auto_92219 ) ) ( ON ?auto_92215 ?auto_92214 ) ( ON-TABLE ?auto_92219 ) ( ON ?auto_92216 ?auto_92215 ) ( CLEAR ?auto_92218 ) ( ON ?auto_92217 ?auto_92216 ) ( CLEAR ?auto_92217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92219 ?auto_92214 ?auto_92215 ?auto_92216 )
      ( MAKE-5PILE ?auto_92214 ?auto_92215 ?auto_92216 ?auto_92217 ?auto_92218 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92222 - BLOCK
      ?auto_92223 - BLOCK
      ?auto_92224 - BLOCK
      ?auto_92225 - BLOCK
      ?auto_92226 - BLOCK
    )
    :vars
    (
      ?auto_92228 - BLOCK
      ?auto_92227 - BLOCK
      ?auto_92229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92222 ?auto_92223 ) ) ( not ( = ?auto_92222 ?auto_92224 ) ) ( not ( = ?auto_92222 ?auto_92225 ) ) ( not ( = ?auto_92222 ?auto_92226 ) ) ( not ( = ?auto_92223 ?auto_92224 ) ) ( not ( = ?auto_92223 ?auto_92225 ) ) ( not ( = ?auto_92223 ?auto_92226 ) ) ( not ( = ?auto_92224 ?auto_92225 ) ) ( not ( = ?auto_92224 ?auto_92226 ) ) ( not ( = ?auto_92225 ?auto_92226 ) ) ( not ( = ?auto_92222 ?auto_92228 ) ) ( not ( = ?auto_92223 ?auto_92228 ) ) ( not ( = ?auto_92224 ?auto_92228 ) ) ( not ( = ?auto_92225 ?auto_92228 ) ) ( not ( = ?auto_92226 ?auto_92228 ) ) ( ON-TABLE ?auto_92227 ) ( ON ?auto_92228 ?auto_92227 ) ( not ( = ?auto_92227 ?auto_92228 ) ) ( not ( = ?auto_92227 ?auto_92226 ) ) ( not ( = ?auto_92227 ?auto_92225 ) ) ( not ( = ?auto_92222 ?auto_92227 ) ) ( not ( = ?auto_92223 ?auto_92227 ) ) ( not ( = ?auto_92224 ?auto_92227 ) ) ( ON ?auto_92222 ?auto_92229 ) ( not ( = ?auto_92222 ?auto_92229 ) ) ( not ( = ?auto_92223 ?auto_92229 ) ) ( not ( = ?auto_92224 ?auto_92229 ) ) ( not ( = ?auto_92225 ?auto_92229 ) ) ( not ( = ?auto_92226 ?auto_92229 ) ) ( not ( = ?auto_92228 ?auto_92229 ) ) ( not ( = ?auto_92227 ?auto_92229 ) ) ( ON ?auto_92223 ?auto_92222 ) ( ON-TABLE ?auto_92229 ) ( ON ?auto_92224 ?auto_92223 ) ( ON ?auto_92225 ?auto_92224 ) ( CLEAR ?auto_92225 ) ( HOLDING ?auto_92226 ) ( CLEAR ?auto_92228 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92227 ?auto_92228 ?auto_92226 )
      ( MAKE-5PILE ?auto_92222 ?auto_92223 ?auto_92224 ?auto_92225 ?auto_92226 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92230 - BLOCK
      ?auto_92231 - BLOCK
      ?auto_92232 - BLOCK
      ?auto_92233 - BLOCK
      ?auto_92234 - BLOCK
    )
    :vars
    (
      ?auto_92235 - BLOCK
      ?auto_92237 - BLOCK
      ?auto_92236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92230 ?auto_92231 ) ) ( not ( = ?auto_92230 ?auto_92232 ) ) ( not ( = ?auto_92230 ?auto_92233 ) ) ( not ( = ?auto_92230 ?auto_92234 ) ) ( not ( = ?auto_92231 ?auto_92232 ) ) ( not ( = ?auto_92231 ?auto_92233 ) ) ( not ( = ?auto_92231 ?auto_92234 ) ) ( not ( = ?auto_92232 ?auto_92233 ) ) ( not ( = ?auto_92232 ?auto_92234 ) ) ( not ( = ?auto_92233 ?auto_92234 ) ) ( not ( = ?auto_92230 ?auto_92235 ) ) ( not ( = ?auto_92231 ?auto_92235 ) ) ( not ( = ?auto_92232 ?auto_92235 ) ) ( not ( = ?auto_92233 ?auto_92235 ) ) ( not ( = ?auto_92234 ?auto_92235 ) ) ( ON-TABLE ?auto_92237 ) ( ON ?auto_92235 ?auto_92237 ) ( not ( = ?auto_92237 ?auto_92235 ) ) ( not ( = ?auto_92237 ?auto_92234 ) ) ( not ( = ?auto_92237 ?auto_92233 ) ) ( not ( = ?auto_92230 ?auto_92237 ) ) ( not ( = ?auto_92231 ?auto_92237 ) ) ( not ( = ?auto_92232 ?auto_92237 ) ) ( ON ?auto_92230 ?auto_92236 ) ( not ( = ?auto_92230 ?auto_92236 ) ) ( not ( = ?auto_92231 ?auto_92236 ) ) ( not ( = ?auto_92232 ?auto_92236 ) ) ( not ( = ?auto_92233 ?auto_92236 ) ) ( not ( = ?auto_92234 ?auto_92236 ) ) ( not ( = ?auto_92235 ?auto_92236 ) ) ( not ( = ?auto_92237 ?auto_92236 ) ) ( ON ?auto_92231 ?auto_92230 ) ( ON-TABLE ?auto_92236 ) ( ON ?auto_92232 ?auto_92231 ) ( ON ?auto_92233 ?auto_92232 ) ( CLEAR ?auto_92235 ) ( ON ?auto_92234 ?auto_92233 ) ( CLEAR ?auto_92234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92236 ?auto_92230 ?auto_92231 ?auto_92232 ?auto_92233 )
      ( MAKE-5PILE ?auto_92230 ?auto_92231 ?auto_92232 ?auto_92233 ?auto_92234 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92238 - BLOCK
      ?auto_92239 - BLOCK
      ?auto_92240 - BLOCK
      ?auto_92241 - BLOCK
      ?auto_92242 - BLOCK
    )
    :vars
    (
      ?auto_92243 - BLOCK
      ?auto_92244 - BLOCK
      ?auto_92245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92238 ?auto_92239 ) ) ( not ( = ?auto_92238 ?auto_92240 ) ) ( not ( = ?auto_92238 ?auto_92241 ) ) ( not ( = ?auto_92238 ?auto_92242 ) ) ( not ( = ?auto_92239 ?auto_92240 ) ) ( not ( = ?auto_92239 ?auto_92241 ) ) ( not ( = ?auto_92239 ?auto_92242 ) ) ( not ( = ?auto_92240 ?auto_92241 ) ) ( not ( = ?auto_92240 ?auto_92242 ) ) ( not ( = ?auto_92241 ?auto_92242 ) ) ( not ( = ?auto_92238 ?auto_92243 ) ) ( not ( = ?auto_92239 ?auto_92243 ) ) ( not ( = ?auto_92240 ?auto_92243 ) ) ( not ( = ?auto_92241 ?auto_92243 ) ) ( not ( = ?auto_92242 ?auto_92243 ) ) ( ON-TABLE ?auto_92244 ) ( not ( = ?auto_92244 ?auto_92243 ) ) ( not ( = ?auto_92244 ?auto_92242 ) ) ( not ( = ?auto_92244 ?auto_92241 ) ) ( not ( = ?auto_92238 ?auto_92244 ) ) ( not ( = ?auto_92239 ?auto_92244 ) ) ( not ( = ?auto_92240 ?auto_92244 ) ) ( ON ?auto_92238 ?auto_92245 ) ( not ( = ?auto_92238 ?auto_92245 ) ) ( not ( = ?auto_92239 ?auto_92245 ) ) ( not ( = ?auto_92240 ?auto_92245 ) ) ( not ( = ?auto_92241 ?auto_92245 ) ) ( not ( = ?auto_92242 ?auto_92245 ) ) ( not ( = ?auto_92243 ?auto_92245 ) ) ( not ( = ?auto_92244 ?auto_92245 ) ) ( ON ?auto_92239 ?auto_92238 ) ( ON-TABLE ?auto_92245 ) ( ON ?auto_92240 ?auto_92239 ) ( ON ?auto_92241 ?auto_92240 ) ( ON ?auto_92242 ?auto_92241 ) ( CLEAR ?auto_92242 ) ( HOLDING ?auto_92243 ) ( CLEAR ?auto_92244 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92244 ?auto_92243 )
      ( MAKE-5PILE ?auto_92238 ?auto_92239 ?auto_92240 ?auto_92241 ?auto_92242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92246 - BLOCK
      ?auto_92247 - BLOCK
      ?auto_92248 - BLOCK
      ?auto_92249 - BLOCK
      ?auto_92250 - BLOCK
    )
    :vars
    (
      ?auto_92252 - BLOCK
      ?auto_92251 - BLOCK
      ?auto_92253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92246 ?auto_92247 ) ) ( not ( = ?auto_92246 ?auto_92248 ) ) ( not ( = ?auto_92246 ?auto_92249 ) ) ( not ( = ?auto_92246 ?auto_92250 ) ) ( not ( = ?auto_92247 ?auto_92248 ) ) ( not ( = ?auto_92247 ?auto_92249 ) ) ( not ( = ?auto_92247 ?auto_92250 ) ) ( not ( = ?auto_92248 ?auto_92249 ) ) ( not ( = ?auto_92248 ?auto_92250 ) ) ( not ( = ?auto_92249 ?auto_92250 ) ) ( not ( = ?auto_92246 ?auto_92252 ) ) ( not ( = ?auto_92247 ?auto_92252 ) ) ( not ( = ?auto_92248 ?auto_92252 ) ) ( not ( = ?auto_92249 ?auto_92252 ) ) ( not ( = ?auto_92250 ?auto_92252 ) ) ( ON-TABLE ?auto_92251 ) ( not ( = ?auto_92251 ?auto_92252 ) ) ( not ( = ?auto_92251 ?auto_92250 ) ) ( not ( = ?auto_92251 ?auto_92249 ) ) ( not ( = ?auto_92246 ?auto_92251 ) ) ( not ( = ?auto_92247 ?auto_92251 ) ) ( not ( = ?auto_92248 ?auto_92251 ) ) ( ON ?auto_92246 ?auto_92253 ) ( not ( = ?auto_92246 ?auto_92253 ) ) ( not ( = ?auto_92247 ?auto_92253 ) ) ( not ( = ?auto_92248 ?auto_92253 ) ) ( not ( = ?auto_92249 ?auto_92253 ) ) ( not ( = ?auto_92250 ?auto_92253 ) ) ( not ( = ?auto_92252 ?auto_92253 ) ) ( not ( = ?auto_92251 ?auto_92253 ) ) ( ON ?auto_92247 ?auto_92246 ) ( ON-TABLE ?auto_92253 ) ( ON ?auto_92248 ?auto_92247 ) ( ON ?auto_92249 ?auto_92248 ) ( ON ?auto_92250 ?auto_92249 ) ( CLEAR ?auto_92251 ) ( ON ?auto_92252 ?auto_92250 ) ( CLEAR ?auto_92252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92253 ?auto_92246 ?auto_92247 ?auto_92248 ?auto_92249 ?auto_92250 )
      ( MAKE-5PILE ?auto_92246 ?auto_92247 ?auto_92248 ?auto_92249 ?auto_92250 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92254 - BLOCK
      ?auto_92255 - BLOCK
      ?auto_92256 - BLOCK
      ?auto_92257 - BLOCK
      ?auto_92258 - BLOCK
    )
    :vars
    (
      ?auto_92261 - BLOCK
      ?auto_92259 - BLOCK
      ?auto_92260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92254 ?auto_92255 ) ) ( not ( = ?auto_92254 ?auto_92256 ) ) ( not ( = ?auto_92254 ?auto_92257 ) ) ( not ( = ?auto_92254 ?auto_92258 ) ) ( not ( = ?auto_92255 ?auto_92256 ) ) ( not ( = ?auto_92255 ?auto_92257 ) ) ( not ( = ?auto_92255 ?auto_92258 ) ) ( not ( = ?auto_92256 ?auto_92257 ) ) ( not ( = ?auto_92256 ?auto_92258 ) ) ( not ( = ?auto_92257 ?auto_92258 ) ) ( not ( = ?auto_92254 ?auto_92261 ) ) ( not ( = ?auto_92255 ?auto_92261 ) ) ( not ( = ?auto_92256 ?auto_92261 ) ) ( not ( = ?auto_92257 ?auto_92261 ) ) ( not ( = ?auto_92258 ?auto_92261 ) ) ( not ( = ?auto_92259 ?auto_92261 ) ) ( not ( = ?auto_92259 ?auto_92258 ) ) ( not ( = ?auto_92259 ?auto_92257 ) ) ( not ( = ?auto_92254 ?auto_92259 ) ) ( not ( = ?auto_92255 ?auto_92259 ) ) ( not ( = ?auto_92256 ?auto_92259 ) ) ( ON ?auto_92254 ?auto_92260 ) ( not ( = ?auto_92254 ?auto_92260 ) ) ( not ( = ?auto_92255 ?auto_92260 ) ) ( not ( = ?auto_92256 ?auto_92260 ) ) ( not ( = ?auto_92257 ?auto_92260 ) ) ( not ( = ?auto_92258 ?auto_92260 ) ) ( not ( = ?auto_92261 ?auto_92260 ) ) ( not ( = ?auto_92259 ?auto_92260 ) ) ( ON ?auto_92255 ?auto_92254 ) ( ON-TABLE ?auto_92260 ) ( ON ?auto_92256 ?auto_92255 ) ( ON ?auto_92257 ?auto_92256 ) ( ON ?auto_92258 ?auto_92257 ) ( ON ?auto_92261 ?auto_92258 ) ( CLEAR ?auto_92261 ) ( HOLDING ?auto_92259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92259 )
      ( MAKE-5PILE ?auto_92254 ?auto_92255 ?auto_92256 ?auto_92257 ?auto_92258 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92262 - BLOCK
      ?auto_92263 - BLOCK
      ?auto_92264 - BLOCK
      ?auto_92265 - BLOCK
      ?auto_92266 - BLOCK
    )
    :vars
    (
      ?auto_92269 - BLOCK
      ?auto_92267 - BLOCK
      ?auto_92268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92262 ?auto_92263 ) ) ( not ( = ?auto_92262 ?auto_92264 ) ) ( not ( = ?auto_92262 ?auto_92265 ) ) ( not ( = ?auto_92262 ?auto_92266 ) ) ( not ( = ?auto_92263 ?auto_92264 ) ) ( not ( = ?auto_92263 ?auto_92265 ) ) ( not ( = ?auto_92263 ?auto_92266 ) ) ( not ( = ?auto_92264 ?auto_92265 ) ) ( not ( = ?auto_92264 ?auto_92266 ) ) ( not ( = ?auto_92265 ?auto_92266 ) ) ( not ( = ?auto_92262 ?auto_92269 ) ) ( not ( = ?auto_92263 ?auto_92269 ) ) ( not ( = ?auto_92264 ?auto_92269 ) ) ( not ( = ?auto_92265 ?auto_92269 ) ) ( not ( = ?auto_92266 ?auto_92269 ) ) ( not ( = ?auto_92267 ?auto_92269 ) ) ( not ( = ?auto_92267 ?auto_92266 ) ) ( not ( = ?auto_92267 ?auto_92265 ) ) ( not ( = ?auto_92262 ?auto_92267 ) ) ( not ( = ?auto_92263 ?auto_92267 ) ) ( not ( = ?auto_92264 ?auto_92267 ) ) ( ON ?auto_92262 ?auto_92268 ) ( not ( = ?auto_92262 ?auto_92268 ) ) ( not ( = ?auto_92263 ?auto_92268 ) ) ( not ( = ?auto_92264 ?auto_92268 ) ) ( not ( = ?auto_92265 ?auto_92268 ) ) ( not ( = ?auto_92266 ?auto_92268 ) ) ( not ( = ?auto_92269 ?auto_92268 ) ) ( not ( = ?auto_92267 ?auto_92268 ) ) ( ON ?auto_92263 ?auto_92262 ) ( ON-TABLE ?auto_92268 ) ( ON ?auto_92264 ?auto_92263 ) ( ON ?auto_92265 ?auto_92264 ) ( ON ?auto_92266 ?auto_92265 ) ( ON ?auto_92269 ?auto_92266 ) ( ON ?auto_92267 ?auto_92269 ) ( CLEAR ?auto_92267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92268 ?auto_92262 ?auto_92263 ?auto_92264 ?auto_92265 ?auto_92266 ?auto_92269 )
      ( MAKE-5PILE ?auto_92262 ?auto_92263 ?auto_92264 ?auto_92265 ?auto_92266 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92271 - BLOCK
    )
    :vars
    (
      ?auto_92272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92272 ?auto_92271 ) ( CLEAR ?auto_92272 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92271 ) ( not ( = ?auto_92271 ?auto_92272 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92272 ?auto_92271 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92273 - BLOCK
    )
    :vars
    (
      ?auto_92274 - BLOCK
      ?auto_92275 - BLOCK
      ?auto_92276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92274 ?auto_92273 ) ( CLEAR ?auto_92274 ) ( ON-TABLE ?auto_92273 ) ( not ( = ?auto_92273 ?auto_92274 ) ) ( HOLDING ?auto_92275 ) ( CLEAR ?auto_92276 ) ( not ( = ?auto_92273 ?auto_92275 ) ) ( not ( = ?auto_92273 ?auto_92276 ) ) ( not ( = ?auto_92274 ?auto_92275 ) ) ( not ( = ?auto_92274 ?auto_92276 ) ) ( not ( = ?auto_92275 ?auto_92276 ) ) )
    :subtasks
    ( ( !STACK ?auto_92275 ?auto_92276 )
      ( MAKE-1PILE ?auto_92273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92277 - BLOCK
    )
    :vars
    (
      ?auto_92279 - BLOCK
      ?auto_92280 - BLOCK
      ?auto_92278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92279 ?auto_92277 ) ( ON-TABLE ?auto_92277 ) ( not ( = ?auto_92277 ?auto_92279 ) ) ( CLEAR ?auto_92280 ) ( not ( = ?auto_92277 ?auto_92278 ) ) ( not ( = ?auto_92277 ?auto_92280 ) ) ( not ( = ?auto_92279 ?auto_92278 ) ) ( not ( = ?auto_92279 ?auto_92280 ) ) ( not ( = ?auto_92278 ?auto_92280 ) ) ( ON ?auto_92278 ?auto_92279 ) ( CLEAR ?auto_92278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92277 ?auto_92279 )
      ( MAKE-1PILE ?auto_92277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92281 - BLOCK
    )
    :vars
    (
      ?auto_92283 - BLOCK
      ?auto_92284 - BLOCK
      ?auto_92282 - BLOCK
      ?auto_92285 - BLOCK
      ?auto_92286 - BLOCK
      ?auto_92287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92283 ?auto_92281 ) ( ON-TABLE ?auto_92281 ) ( not ( = ?auto_92281 ?auto_92283 ) ) ( not ( = ?auto_92281 ?auto_92284 ) ) ( not ( = ?auto_92281 ?auto_92282 ) ) ( not ( = ?auto_92283 ?auto_92284 ) ) ( not ( = ?auto_92283 ?auto_92282 ) ) ( not ( = ?auto_92284 ?auto_92282 ) ) ( ON ?auto_92284 ?auto_92283 ) ( CLEAR ?auto_92284 ) ( HOLDING ?auto_92282 ) ( CLEAR ?auto_92285 ) ( ON-TABLE ?auto_92286 ) ( ON ?auto_92287 ?auto_92286 ) ( ON ?auto_92285 ?auto_92287 ) ( not ( = ?auto_92286 ?auto_92287 ) ) ( not ( = ?auto_92286 ?auto_92285 ) ) ( not ( = ?auto_92286 ?auto_92282 ) ) ( not ( = ?auto_92287 ?auto_92285 ) ) ( not ( = ?auto_92287 ?auto_92282 ) ) ( not ( = ?auto_92285 ?auto_92282 ) ) ( not ( = ?auto_92281 ?auto_92285 ) ) ( not ( = ?auto_92281 ?auto_92286 ) ) ( not ( = ?auto_92281 ?auto_92287 ) ) ( not ( = ?auto_92283 ?auto_92285 ) ) ( not ( = ?auto_92283 ?auto_92286 ) ) ( not ( = ?auto_92283 ?auto_92287 ) ) ( not ( = ?auto_92284 ?auto_92285 ) ) ( not ( = ?auto_92284 ?auto_92286 ) ) ( not ( = ?auto_92284 ?auto_92287 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92286 ?auto_92287 ?auto_92285 ?auto_92282 )
      ( MAKE-1PILE ?auto_92281 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92288 - BLOCK
    )
    :vars
    (
      ?auto_92291 - BLOCK
      ?auto_92292 - BLOCK
      ?auto_92293 - BLOCK
      ?auto_92294 - BLOCK
      ?auto_92289 - BLOCK
      ?auto_92290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92291 ?auto_92288 ) ( ON-TABLE ?auto_92288 ) ( not ( = ?auto_92288 ?auto_92291 ) ) ( not ( = ?auto_92288 ?auto_92292 ) ) ( not ( = ?auto_92288 ?auto_92293 ) ) ( not ( = ?auto_92291 ?auto_92292 ) ) ( not ( = ?auto_92291 ?auto_92293 ) ) ( not ( = ?auto_92292 ?auto_92293 ) ) ( ON ?auto_92292 ?auto_92291 ) ( CLEAR ?auto_92294 ) ( ON-TABLE ?auto_92289 ) ( ON ?auto_92290 ?auto_92289 ) ( ON ?auto_92294 ?auto_92290 ) ( not ( = ?auto_92289 ?auto_92290 ) ) ( not ( = ?auto_92289 ?auto_92294 ) ) ( not ( = ?auto_92289 ?auto_92293 ) ) ( not ( = ?auto_92290 ?auto_92294 ) ) ( not ( = ?auto_92290 ?auto_92293 ) ) ( not ( = ?auto_92294 ?auto_92293 ) ) ( not ( = ?auto_92288 ?auto_92294 ) ) ( not ( = ?auto_92288 ?auto_92289 ) ) ( not ( = ?auto_92288 ?auto_92290 ) ) ( not ( = ?auto_92291 ?auto_92294 ) ) ( not ( = ?auto_92291 ?auto_92289 ) ) ( not ( = ?auto_92291 ?auto_92290 ) ) ( not ( = ?auto_92292 ?auto_92294 ) ) ( not ( = ?auto_92292 ?auto_92289 ) ) ( not ( = ?auto_92292 ?auto_92290 ) ) ( ON ?auto_92293 ?auto_92292 ) ( CLEAR ?auto_92293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92288 ?auto_92291 ?auto_92292 )
      ( MAKE-1PILE ?auto_92288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92295 - BLOCK
    )
    :vars
    (
      ?auto_92298 - BLOCK
      ?auto_92299 - BLOCK
      ?auto_92297 - BLOCK
      ?auto_92296 - BLOCK
      ?auto_92300 - BLOCK
      ?auto_92301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92298 ?auto_92295 ) ( ON-TABLE ?auto_92295 ) ( not ( = ?auto_92295 ?auto_92298 ) ) ( not ( = ?auto_92295 ?auto_92299 ) ) ( not ( = ?auto_92295 ?auto_92297 ) ) ( not ( = ?auto_92298 ?auto_92299 ) ) ( not ( = ?auto_92298 ?auto_92297 ) ) ( not ( = ?auto_92299 ?auto_92297 ) ) ( ON ?auto_92299 ?auto_92298 ) ( ON-TABLE ?auto_92296 ) ( ON ?auto_92300 ?auto_92296 ) ( not ( = ?auto_92296 ?auto_92300 ) ) ( not ( = ?auto_92296 ?auto_92301 ) ) ( not ( = ?auto_92296 ?auto_92297 ) ) ( not ( = ?auto_92300 ?auto_92301 ) ) ( not ( = ?auto_92300 ?auto_92297 ) ) ( not ( = ?auto_92301 ?auto_92297 ) ) ( not ( = ?auto_92295 ?auto_92301 ) ) ( not ( = ?auto_92295 ?auto_92296 ) ) ( not ( = ?auto_92295 ?auto_92300 ) ) ( not ( = ?auto_92298 ?auto_92301 ) ) ( not ( = ?auto_92298 ?auto_92296 ) ) ( not ( = ?auto_92298 ?auto_92300 ) ) ( not ( = ?auto_92299 ?auto_92301 ) ) ( not ( = ?auto_92299 ?auto_92296 ) ) ( not ( = ?auto_92299 ?auto_92300 ) ) ( ON ?auto_92297 ?auto_92299 ) ( CLEAR ?auto_92297 ) ( HOLDING ?auto_92301 ) ( CLEAR ?auto_92300 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92296 ?auto_92300 ?auto_92301 )
      ( MAKE-1PILE ?auto_92295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92302 - BLOCK
    )
    :vars
    (
      ?auto_92307 - BLOCK
      ?auto_92308 - BLOCK
      ?auto_92303 - BLOCK
      ?auto_92306 - BLOCK
      ?auto_92304 - BLOCK
      ?auto_92305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92307 ?auto_92302 ) ( ON-TABLE ?auto_92302 ) ( not ( = ?auto_92302 ?auto_92307 ) ) ( not ( = ?auto_92302 ?auto_92308 ) ) ( not ( = ?auto_92302 ?auto_92303 ) ) ( not ( = ?auto_92307 ?auto_92308 ) ) ( not ( = ?auto_92307 ?auto_92303 ) ) ( not ( = ?auto_92308 ?auto_92303 ) ) ( ON ?auto_92308 ?auto_92307 ) ( ON-TABLE ?auto_92306 ) ( ON ?auto_92304 ?auto_92306 ) ( not ( = ?auto_92306 ?auto_92304 ) ) ( not ( = ?auto_92306 ?auto_92305 ) ) ( not ( = ?auto_92306 ?auto_92303 ) ) ( not ( = ?auto_92304 ?auto_92305 ) ) ( not ( = ?auto_92304 ?auto_92303 ) ) ( not ( = ?auto_92305 ?auto_92303 ) ) ( not ( = ?auto_92302 ?auto_92305 ) ) ( not ( = ?auto_92302 ?auto_92306 ) ) ( not ( = ?auto_92302 ?auto_92304 ) ) ( not ( = ?auto_92307 ?auto_92305 ) ) ( not ( = ?auto_92307 ?auto_92306 ) ) ( not ( = ?auto_92307 ?auto_92304 ) ) ( not ( = ?auto_92308 ?auto_92305 ) ) ( not ( = ?auto_92308 ?auto_92306 ) ) ( not ( = ?auto_92308 ?auto_92304 ) ) ( ON ?auto_92303 ?auto_92308 ) ( CLEAR ?auto_92304 ) ( ON ?auto_92305 ?auto_92303 ) ( CLEAR ?auto_92305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92302 ?auto_92307 ?auto_92308 ?auto_92303 )
      ( MAKE-1PILE ?auto_92302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92309 - BLOCK
    )
    :vars
    (
      ?auto_92310 - BLOCK
      ?auto_92311 - BLOCK
      ?auto_92312 - BLOCK
      ?auto_92314 - BLOCK
      ?auto_92313 - BLOCK
      ?auto_92315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92310 ?auto_92309 ) ( ON-TABLE ?auto_92309 ) ( not ( = ?auto_92309 ?auto_92310 ) ) ( not ( = ?auto_92309 ?auto_92311 ) ) ( not ( = ?auto_92309 ?auto_92312 ) ) ( not ( = ?auto_92310 ?auto_92311 ) ) ( not ( = ?auto_92310 ?auto_92312 ) ) ( not ( = ?auto_92311 ?auto_92312 ) ) ( ON ?auto_92311 ?auto_92310 ) ( ON-TABLE ?auto_92314 ) ( not ( = ?auto_92314 ?auto_92313 ) ) ( not ( = ?auto_92314 ?auto_92315 ) ) ( not ( = ?auto_92314 ?auto_92312 ) ) ( not ( = ?auto_92313 ?auto_92315 ) ) ( not ( = ?auto_92313 ?auto_92312 ) ) ( not ( = ?auto_92315 ?auto_92312 ) ) ( not ( = ?auto_92309 ?auto_92315 ) ) ( not ( = ?auto_92309 ?auto_92314 ) ) ( not ( = ?auto_92309 ?auto_92313 ) ) ( not ( = ?auto_92310 ?auto_92315 ) ) ( not ( = ?auto_92310 ?auto_92314 ) ) ( not ( = ?auto_92310 ?auto_92313 ) ) ( not ( = ?auto_92311 ?auto_92315 ) ) ( not ( = ?auto_92311 ?auto_92314 ) ) ( not ( = ?auto_92311 ?auto_92313 ) ) ( ON ?auto_92312 ?auto_92311 ) ( ON ?auto_92315 ?auto_92312 ) ( CLEAR ?auto_92315 ) ( HOLDING ?auto_92313 ) ( CLEAR ?auto_92314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92314 ?auto_92313 )
      ( MAKE-1PILE ?auto_92309 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92316 - BLOCK
    )
    :vars
    (
      ?auto_92321 - BLOCK
      ?auto_92318 - BLOCK
      ?auto_92319 - BLOCK
      ?auto_92322 - BLOCK
      ?auto_92320 - BLOCK
      ?auto_92317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92321 ?auto_92316 ) ( ON-TABLE ?auto_92316 ) ( not ( = ?auto_92316 ?auto_92321 ) ) ( not ( = ?auto_92316 ?auto_92318 ) ) ( not ( = ?auto_92316 ?auto_92319 ) ) ( not ( = ?auto_92321 ?auto_92318 ) ) ( not ( = ?auto_92321 ?auto_92319 ) ) ( not ( = ?auto_92318 ?auto_92319 ) ) ( ON ?auto_92318 ?auto_92321 ) ( ON-TABLE ?auto_92322 ) ( not ( = ?auto_92322 ?auto_92320 ) ) ( not ( = ?auto_92322 ?auto_92317 ) ) ( not ( = ?auto_92322 ?auto_92319 ) ) ( not ( = ?auto_92320 ?auto_92317 ) ) ( not ( = ?auto_92320 ?auto_92319 ) ) ( not ( = ?auto_92317 ?auto_92319 ) ) ( not ( = ?auto_92316 ?auto_92317 ) ) ( not ( = ?auto_92316 ?auto_92322 ) ) ( not ( = ?auto_92316 ?auto_92320 ) ) ( not ( = ?auto_92321 ?auto_92317 ) ) ( not ( = ?auto_92321 ?auto_92322 ) ) ( not ( = ?auto_92321 ?auto_92320 ) ) ( not ( = ?auto_92318 ?auto_92317 ) ) ( not ( = ?auto_92318 ?auto_92322 ) ) ( not ( = ?auto_92318 ?auto_92320 ) ) ( ON ?auto_92319 ?auto_92318 ) ( ON ?auto_92317 ?auto_92319 ) ( CLEAR ?auto_92322 ) ( ON ?auto_92320 ?auto_92317 ) ( CLEAR ?auto_92320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92316 ?auto_92321 ?auto_92318 ?auto_92319 ?auto_92317 )
      ( MAKE-1PILE ?auto_92316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92323 - BLOCK
    )
    :vars
    (
      ?auto_92324 - BLOCK
      ?auto_92325 - BLOCK
      ?auto_92328 - BLOCK
      ?auto_92326 - BLOCK
      ?auto_92329 - BLOCK
      ?auto_92327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92324 ?auto_92323 ) ( ON-TABLE ?auto_92323 ) ( not ( = ?auto_92323 ?auto_92324 ) ) ( not ( = ?auto_92323 ?auto_92325 ) ) ( not ( = ?auto_92323 ?auto_92328 ) ) ( not ( = ?auto_92324 ?auto_92325 ) ) ( not ( = ?auto_92324 ?auto_92328 ) ) ( not ( = ?auto_92325 ?auto_92328 ) ) ( ON ?auto_92325 ?auto_92324 ) ( not ( = ?auto_92326 ?auto_92329 ) ) ( not ( = ?auto_92326 ?auto_92327 ) ) ( not ( = ?auto_92326 ?auto_92328 ) ) ( not ( = ?auto_92329 ?auto_92327 ) ) ( not ( = ?auto_92329 ?auto_92328 ) ) ( not ( = ?auto_92327 ?auto_92328 ) ) ( not ( = ?auto_92323 ?auto_92327 ) ) ( not ( = ?auto_92323 ?auto_92326 ) ) ( not ( = ?auto_92323 ?auto_92329 ) ) ( not ( = ?auto_92324 ?auto_92327 ) ) ( not ( = ?auto_92324 ?auto_92326 ) ) ( not ( = ?auto_92324 ?auto_92329 ) ) ( not ( = ?auto_92325 ?auto_92327 ) ) ( not ( = ?auto_92325 ?auto_92326 ) ) ( not ( = ?auto_92325 ?auto_92329 ) ) ( ON ?auto_92328 ?auto_92325 ) ( ON ?auto_92327 ?auto_92328 ) ( ON ?auto_92329 ?auto_92327 ) ( CLEAR ?auto_92329 ) ( HOLDING ?auto_92326 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92326 )
      ( MAKE-1PILE ?auto_92323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92330 - BLOCK
    )
    :vars
    (
      ?auto_92332 - BLOCK
      ?auto_92333 - BLOCK
      ?auto_92335 - BLOCK
      ?auto_92334 - BLOCK
      ?auto_92331 - BLOCK
      ?auto_92336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92332 ?auto_92330 ) ( ON-TABLE ?auto_92330 ) ( not ( = ?auto_92330 ?auto_92332 ) ) ( not ( = ?auto_92330 ?auto_92333 ) ) ( not ( = ?auto_92330 ?auto_92335 ) ) ( not ( = ?auto_92332 ?auto_92333 ) ) ( not ( = ?auto_92332 ?auto_92335 ) ) ( not ( = ?auto_92333 ?auto_92335 ) ) ( ON ?auto_92333 ?auto_92332 ) ( not ( = ?auto_92334 ?auto_92331 ) ) ( not ( = ?auto_92334 ?auto_92336 ) ) ( not ( = ?auto_92334 ?auto_92335 ) ) ( not ( = ?auto_92331 ?auto_92336 ) ) ( not ( = ?auto_92331 ?auto_92335 ) ) ( not ( = ?auto_92336 ?auto_92335 ) ) ( not ( = ?auto_92330 ?auto_92336 ) ) ( not ( = ?auto_92330 ?auto_92334 ) ) ( not ( = ?auto_92330 ?auto_92331 ) ) ( not ( = ?auto_92332 ?auto_92336 ) ) ( not ( = ?auto_92332 ?auto_92334 ) ) ( not ( = ?auto_92332 ?auto_92331 ) ) ( not ( = ?auto_92333 ?auto_92336 ) ) ( not ( = ?auto_92333 ?auto_92334 ) ) ( not ( = ?auto_92333 ?auto_92331 ) ) ( ON ?auto_92335 ?auto_92333 ) ( ON ?auto_92336 ?auto_92335 ) ( ON ?auto_92331 ?auto_92336 ) ( ON ?auto_92334 ?auto_92331 ) ( CLEAR ?auto_92334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92330 ?auto_92332 ?auto_92333 ?auto_92335 ?auto_92336 ?auto_92331 )
      ( MAKE-1PILE ?auto_92330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92337 - BLOCK
    )
    :vars
    (
      ?auto_92342 - BLOCK
      ?auto_92339 - BLOCK
      ?auto_92338 - BLOCK
      ?auto_92343 - BLOCK
      ?auto_92341 - BLOCK
      ?auto_92340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92342 ?auto_92337 ) ( ON-TABLE ?auto_92337 ) ( not ( = ?auto_92337 ?auto_92342 ) ) ( not ( = ?auto_92337 ?auto_92339 ) ) ( not ( = ?auto_92337 ?auto_92338 ) ) ( not ( = ?auto_92342 ?auto_92339 ) ) ( not ( = ?auto_92342 ?auto_92338 ) ) ( not ( = ?auto_92339 ?auto_92338 ) ) ( ON ?auto_92339 ?auto_92342 ) ( not ( = ?auto_92343 ?auto_92341 ) ) ( not ( = ?auto_92343 ?auto_92340 ) ) ( not ( = ?auto_92343 ?auto_92338 ) ) ( not ( = ?auto_92341 ?auto_92340 ) ) ( not ( = ?auto_92341 ?auto_92338 ) ) ( not ( = ?auto_92340 ?auto_92338 ) ) ( not ( = ?auto_92337 ?auto_92340 ) ) ( not ( = ?auto_92337 ?auto_92343 ) ) ( not ( = ?auto_92337 ?auto_92341 ) ) ( not ( = ?auto_92342 ?auto_92340 ) ) ( not ( = ?auto_92342 ?auto_92343 ) ) ( not ( = ?auto_92342 ?auto_92341 ) ) ( not ( = ?auto_92339 ?auto_92340 ) ) ( not ( = ?auto_92339 ?auto_92343 ) ) ( not ( = ?auto_92339 ?auto_92341 ) ) ( ON ?auto_92338 ?auto_92339 ) ( ON ?auto_92340 ?auto_92338 ) ( ON ?auto_92341 ?auto_92340 ) ( HOLDING ?auto_92343 ) ( CLEAR ?auto_92341 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92337 ?auto_92342 ?auto_92339 ?auto_92338 ?auto_92340 ?auto_92341 ?auto_92343 )
      ( MAKE-1PILE ?auto_92337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92344 - BLOCK
    )
    :vars
    (
      ?auto_92345 - BLOCK
      ?auto_92350 - BLOCK
      ?auto_92347 - BLOCK
      ?auto_92346 - BLOCK
      ?auto_92348 - BLOCK
      ?auto_92349 - BLOCK
      ?auto_92351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92345 ?auto_92344 ) ( ON-TABLE ?auto_92344 ) ( not ( = ?auto_92344 ?auto_92345 ) ) ( not ( = ?auto_92344 ?auto_92350 ) ) ( not ( = ?auto_92344 ?auto_92347 ) ) ( not ( = ?auto_92345 ?auto_92350 ) ) ( not ( = ?auto_92345 ?auto_92347 ) ) ( not ( = ?auto_92350 ?auto_92347 ) ) ( ON ?auto_92350 ?auto_92345 ) ( not ( = ?auto_92346 ?auto_92348 ) ) ( not ( = ?auto_92346 ?auto_92349 ) ) ( not ( = ?auto_92346 ?auto_92347 ) ) ( not ( = ?auto_92348 ?auto_92349 ) ) ( not ( = ?auto_92348 ?auto_92347 ) ) ( not ( = ?auto_92349 ?auto_92347 ) ) ( not ( = ?auto_92344 ?auto_92349 ) ) ( not ( = ?auto_92344 ?auto_92346 ) ) ( not ( = ?auto_92344 ?auto_92348 ) ) ( not ( = ?auto_92345 ?auto_92349 ) ) ( not ( = ?auto_92345 ?auto_92346 ) ) ( not ( = ?auto_92345 ?auto_92348 ) ) ( not ( = ?auto_92350 ?auto_92349 ) ) ( not ( = ?auto_92350 ?auto_92346 ) ) ( not ( = ?auto_92350 ?auto_92348 ) ) ( ON ?auto_92347 ?auto_92350 ) ( ON ?auto_92349 ?auto_92347 ) ( ON ?auto_92348 ?auto_92349 ) ( CLEAR ?auto_92348 ) ( ON ?auto_92346 ?auto_92351 ) ( CLEAR ?auto_92346 ) ( HAND-EMPTY ) ( not ( = ?auto_92344 ?auto_92351 ) ) ( not ( = ?auto_92345 ?auto_92351 ) ) ( not ( = ?auto_92350 ?auto_92351 ) ) ( not ( = ?auto_92347 ?auto_92351 ) ) ( not ( = ?auto_92346 ?auto_92351 ) ) ( not ( = ?auto_92348 ?auto_92351 ) ) ( not ( = ?auto_92349 ?auto_92351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92346 ?auto_92351 )
      ( MAKE-1PILE ?auto_92344 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92352 - BLOCK
    )
    :vars
    (
      ?auto_92359 - BLOCK
      ?auto_92356 - BLOCK
      ?auto_92357 - BLOCK
      ?auto_92358 - BLOCK
      ?auto_92355 - BLOCK
      ?auto_92354 - BLOCK
      ?auto_92353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92359 ?auto_92352 ) ( ON-TABLE ?auto_92352 ) ( not ( = ?auto_92352 ?auto_92359 ) ) ( not ( = ?auto_92352 ?auto_92356 ) ) ( not ( = ?auto_92352 ?auto_92357 ) ) ( not ( = ?auto_92359 ?auto_92356 ) ) ( not ( = ?auto_92359 ?auto_92357 ) ) ( not ( = ?auto_92356 ?auto_92357 ) ) ( ON ?auto_92356 ?auto_92359 ) ( not ( = ?auto_92358 ?auto_92355 ) ) ( not ( = ?auto_92358 ?auto_92354 ) ) ( not ( = ?auto_92358 ?auto_92357 ) ) ( not ( = ?auto_92355 ?auto_92354 ) ) ( not ( = ?auto_92355 ?auto_92357 ) ) ( not ( = ?auto_92354 ?auto_92357 ) ) ( not ( = ?auto_92352 ?auto_92354 ) ) ( not ( = ?auto_92352 ?auto_92358 ) ) ( not ( = ?auto_92352 ?auto_92355 ) ) ( not ( = ?auto_92359 ?auto_92354 ) ) ( not ( = ?auto_92359 ?auto_92358 ) ) ( not ( = ?auto_92359 ?auto_92355 ) ) ( not ( = ?auto_92356 ?auto_92354 ) ) ( not ( = ?auto_92356 ?auto_92358 ) ) ( not ( = ?auto_92356 ?auto_92355 ) ) ( ON ?auto_92357 ?auto_92356 ) ( ON ?auto_92354 ?auto_92357 ) ( ON ?auto_92358 ?auto_92353 ) ( CLEAR ?auto_92358 ) ( not ( = ?auto_92352 ?auto_92353 ) ) ( not ( = ?auto_92359 ?auto_92353 ) ) ( not ( = ?auto_92356 ?auto_92353 ) ) ( not ( = ?auto_92357 ?auto_92353 ) ) ( not ( = ?auto_92358 ?auto_92353 ) ) ( not ( = ?auto_92355 ?auto_92353 ) ) ( not ( = ?auto_92354 ?auto_92353 ) ) ( HOLDING ?auto_92355 ) ( CLEAR ?auto_92354 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92352 ?auto_92359 ?auto_92356 ?auto_92357 ?auto_92354 ?auto_92355 )
      ( MAKE-1PILE ?auto_92352 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92360 - BLOCK
    )
    :vars
    (
      ?auto_92366 - BLOCK
      ?auto_92365 - BLOCK
      ?auto_92364 - BLOCK
      ?auto_92367 - BLOCK
      ?auto_92362 - BLOCK
      ?auto_92363 - BLOCK
      ?auto_92361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92366 ?auto_92360 ) ( ON-TABLE ?auto_92360 ) ( not ( = ?auto_92360 ?auto_92366 ) ) ( not ( = ?auto_92360 ?auto_92365 ) ) ( not ( = ?auto_92360 ?auto_92364 ) ) ( not ( = ?auto_92366 ?auto_92365 ) ) ( not ( = ?auto_92366 ?auto_92364 ) ) ( not ( = ?auto_92365 ?auto_92364 ) ) ( ON ?auto_92365 ?auto_92366 ) ( not ( = ?auto_92367 ?auto_92362 ) ) ( not ( = ?auto_92367 ?auto_92363 ) ) ( not ( = ?auto_92367 ?auto_92364 ) ) ( not ( = ?auto_92362 ?auto_92363 ) ) ( not ( = ?auto_92362 ?auto_92364 ) ) ( not ( = ?auto_92363 ?auto_92364 ) ) ( not ( = ?auto_92360 ?auto_92363 ) ) ( not ( = ?auto_92360 ?auto_92367 ) ) ( not ( = ?auto_92360 ?auto_92362 ) ) ( not ( = ?auto_92366 ?auto_92363 ) ) ( not ( = ?auto_92366 ?auto_92367 ) ) ( not ( = ?auto_92366 ?auto_92362 ) ) ( not ( = ?auto_92365 ?auto_92363 ) ) ( not ( = ?auto_92365 ?auto_92367 ) ) ( not ( = ?auto_92365 ?auto_92362 ) ) ( ON ?auto_92364 ?auto_92365 ) ( ON ?auto_92363 ?auto_92364 ) ( ON ?auto_92367 ?auto_92361 ) ( not ( = ?auto_92360 ?auto_92361 ) ) ( not ( = ?auto_92366 ?auto_92361 ) ) ( not ( = ?auto_92365 ?auto_92361 ) ) ( not ( = ?auto_92364 ?auto_92361 ) ) ( not ( = ?auto_92367 ?auto_92361 ) ) ( not ( = ?auto_92362 ?auto_92361 ) ) ( not ( = ?auto_92363 ?auto_92361 ) ) ( CLEAR ?auto_92363 ) ( ON ?auto_92362 ?auto_92367 ) ( CLEAR ?auto_92362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92361 ?auto_92367 )
      ( MAKE-1PILE ?auto_92360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92368 - BLOCK
    )
    :vars
    (
      ?auto_92372 - BLOCK
      ?auto_92374 - BLOCK
      ?auto_92375 - BLOCK
      ?auto_92371 - BLOCK
      ?auto_92373 - BLOCK
      ?auto_92369 - BLOCK
      ?auto_92370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92372 ?auto_92368 ) ( ON-TABLE ?auto_92368 ) ( not ( = ?auto_92368 ?auto_92372 ) ) ( not ( = ?auto_92368 ?auto_92374 ) ) ( not ( = ?auto_92368 ?auto_92375 ) ) ( not ( = ?auto_92372 ?auto_92374 ) ) ( not ( = ?auto_92372 ?auto_92375 ) ) ( not ( = ?auto_92374 ?auto_92375 ) ) ( ON ?auto_92374 ?auto_92372 ) ( not ( = ?auto_92371 ?auto_92373 ) ) ( not ( = ?auto_92371 ?auto_92369 ) ) ( not ( = ?auto_92371 ?auto_92375 ) ) ( not ( = ?auto_92373 ?auto_92369 ) ) ( not ( = ?auto_92373 ?auto_92375 ) ) ( not ( = ?auto_92369 ?auto_92375 ) ) ( not ( = ?auto_92368 ?auto_92369 ) ) ( not ( = ?auto_92368 ?auto_92371 ) ) ( not ( = ?auto_92368 ?auto_92373 ) ) ( not ( = ?auto_92372 ?auto_92369 ) ) ( not ( = ?auto_92372 ?auto_92371 ) ) ( not ( = ?auto_92372 ?auto_92373 ) ) ( not ( = ?auto_92374 ?auto_92369 ) ) ( not ( = ?auto_92374 ?auto_92371 ) ) ( not ( = ?auto_92374 ?auto_92373 ) ) ( ON ?auto_92375 ?auto_92374 ) ( ON ?auto_92371 ?auto_92370 ) ( not ( = ?auto_92368 ?auto_92370 ) ) ( not ( = ?auto_92372 ?auto_92370 ) ) ( not ( = ?auto_92374 ?auto_92370 ) ) ( not ( = ?auto_92375 ?auto_92370 ) ) ( not ( = ?auto_92371 ?auto_92370 ) ) ( not ( = ?auto_92373 ?auto_92370 ) ) ( not ( = ?auto_92369 ?auto_92370 ) ) ( ON ?auto_92373 ?auto_92371 ) ( CLEAR ?auto_92373 ) ( ON-TABLE ?auto_92370 ) ( HOLDING ?auto_92369 ) ( CLEAR ?auto_92375 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92368 ?auto_92372 ?auto_92374 ?auto_92375 ?auto_92369 )
      ( MAKE-1PILE ?auto_92368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92376 - BLOCK
    )
    :vars
    (
      ?auto_92379 - BLOCK
      ?auto_92377 - BLOCK
      ?auto_92382 - BLOCK
      ?auto_92381 - BLOCK
      ?auto_92383 - BLOCK
      ?auto_92378 - BLOCK
      ?auto_92380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92379 ?auto_92376 ) ( ON-TABLE ?auto_92376 ) ( not ( = ?auto_92376 ?auto_92379 ) ) ( not ( = ?auto_92376 ?auto_92377 ) ) ( not ( = ?auto_92376 ?auto_92382 ) ) ( not ( = ?auto_92379 ?auto_92377 ) ) ( not ( = ?auto_92379 ?auto_92382 ) ) ( not ( = ?auto_92377 ?auto_92382 ) ) ( ON ?auto_92377 ?auto_92379 ) ( not ( = ?auto_92381 ?auto_92383 ) ) ( not ( = ?auto_92381 ?auto_92378 ) ) ( not ( = ?auto_92381 ?auto_92382 ) ) ( not ( = ?auto_92383 ?auto_92378 ) ) ( not ( = ?auto_92383 ?auto_92382 ) ) ( not ( = ?auto_92378 ?auto_92382 ) ) ( not ( = ?auto_92376 ?auto_92378 ) ) ( not ( = ?auto_92376 ?auto_92381 ) ) ( not ( = ?auto_92376 ?auto_92383 ) ) ( not ( = ?auto_92379 ?auto_92378 ) ) ( not ( = ?auto_92379 ?auto_92381 ) ) ( not ( = ?auto_92379 ?auto_92383 ) ) ( not ( = ?auto_92377 ?auto_92378 ) ) ( not ( = ?auto_92377 ?auto_92381 ) ) ( not ( = ?auto_92377 ?auto_92383 ) ) ( ON ?auto_92382 ?auto_92377 ) ( ON ?auto_92381 ?auto_92380 ) ( not ( = ?auto_92376 ?auto_92380 ) ) ( not ( = ?auto_92379 ?auto_92380 ) ) ( not ( = ?auto_92377 ?auto_92380 ) ) ( not ( = ?auto_92382 ?auto_92380 ) ) ( not ( = ?auto_92381 ?auto_92380 ) ) ( not ( = ?auto_92383 ?auto_92380 ) ) ( not ( = ?auto_92378 ?auto_92380 ) ) ( ON ?auto_92383 ?auto_92381 ) ( ON-TABLE ?auto_92380 ) ( CLEAR ?auto_92382 ) ( ON ?auto_92378 ?auto_92383 ) ( CLEAR ?auto_92378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92380 ?auto_92381 ?auto_92383 )
      ( MAKE-1PILE ?auto_92376 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92384 - BLOCK
    )
    :vars
    (
      ?auto_92385 - BLOCK
      ?auto_92386 - BLOCK
      ?auto_92387 - BLOCK
      ?auto_92388 - BLOCK
      ?auto_92390 - BLOCK
      ?auto_92389 - BLOCK
      ?auto_92391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92385 ?auto_92384 ) ( ON-TABLE ?auto_92384 ) ( not ( = ?auto_92384 ?auto_92385 ) ) ( not ( = ?auto_92384 ?auto_92386 ) ) ( not ( = ?auto_92384 ?auto_92387 ) ) ( not ( = ?auto_92385 ?auto_92386 ) ) ( not ( = ?auto_92385 ?auto_92387 ) ) ( not ( = ?auto_92386 ?auto_92387 ) ) ( ON ?auto_92386 ?auto_92385 ) ( not ( = ?auto_92388 ?auto_92390 ) ) ( not ( = ?auto_92388 ?auto_92389 ) ) ( not ( = ?auto_92388 ?auto_92387 ) ) ( not ( = ?auto_92390 ?auto_92389 ) ) ( not ( = ?auto_92390 ?auto_92387 ) ) ( not ( = ?auto_92389 ?auto_92387 ) ) ( not ( = ?auto_92384 ?auto_92389 ) ) ( not ( = ?auto_92384 ?auto_92388 ) ) ( not ( = ?auto_92384 ?auto_92390 ) ) ( not ( = ?auto_92385 ?auto_92389 ) ) ( not ( = ?auto_92385 ?auto_92388 ) ) ( not ( = ?auto_92385 ?auto_92390 ) ) ( not ( = ?auto_92386 ?auto_92389 ) ) ( not ( = ?auto_92386 ?auto_92388 ) ) ( not ( = ?auto_92386 ?auto_92390 ) ) ( ON ?auto_92388 ?auto_92391 ) ( not ( = ?auto_92384 ?auto_92391 ) ) ( not ( = ?auto_92385 ?auto_92391 ) ) ( not ( = ?auto_92386 ?auto_92391 ) ) ( not ( = ?auto_92387 ?auto_92391 ) ) ( not ( = ?auto_92388 ?auto_92391 ) ) ( not ( = ?auto_92390 ?auto_92391 ) ) ( not ( = ?auto_92389 ?auto_92391 ) ) ( ON ?auto_92390 ?auto_92388 ) ( ON-TABLE ?auto_92391 ) ( ON ?auto_92389 ?auto_92390 ) ( CLEAR ?auto_92389 ) ( HOLDING ?auto_92387 ) ( CLEAR ?auto_92386 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92384 ?auto_92385 ?auto_92386 ?auto_92387 )
      ( MAKE-1PILE ?auto_92384 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92392 - BLOCK
    )
    :vars
    (
      ?auto_92394 - BLOCK
      ?auto_92395 - BLOCK
      ?auto_92396 - BLOCK
      ?auto_92398 - BLOCK
      ?auto_92393 - BLOCK
      ?auto_92397 - BLOCK
      ?auto_92399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92394 ?auto_92392 ) ( ON-TABLE ?auto_92392 ) ( not ( = ?auto_92392 ?auto_92394 ) ) ( not ( = ?auto_92392 ?auto_92395 ) ) ( not ( = ?auto_92392 ?auto_92396 ) ) ( not ( = ?auto_92394 ?auto_92395 ) ) ( not ( = ?auto_92394 ?auto_92396 ) ) ( not ( = ?auto_92395 ?auto_92396 ) ) ( ON ?auto_92395 ?auto_92394 ) ( not ( = ?auto_92398 ?auto_92393 ) ) ( not ( = ?auto_92398 ?auto_92397 ) ) ( not ( = ?auto_92398 ?auto_92396 ) ) ( not ( = ?auto_92393 ?auto_92397 ) ) ( not ( = ?auto_92393 ?auto_92396 ) ) ( not ( = ?auto_92397 ?auto_92396 ) ) ( not ( = ?auto_92392 ?auto_92397 ) ) ( not ( = ?auto_92392 ?auto_92398 ) ) ( not ( = ?auto_92392 ?auto_92393 ) ) ( not ( = ?auto_92394 ?auto_92397 ) ) ( not ( = ?auto_92394 ?auto_92398 ) ) ( not ( = ?auto_92394 ?auto_92393 ) ) ( not ( = ?auto_92395 ?auto_92397 ) ) ( not ( = ?auto_92395 ?auto_92398 ) ) ( not ( = ?auto_92395 ?auto_92393 ) ) ( ON ?auto_92398 ?auto_92399 ) ( not ( = ?auto_92392 ?auto_92399 ) ) ( not ( = ?auto_92394 ?auto_92399 ) ) ( not ( = ?auto_92395 ?auto_92399 ) ) ( not ( = ?auto_92396 ?auto_92399 ) ) ( not ( = ?auto_92398 ?auto_92399 ) ) ( not ( = ?auto_92393 ?auto_92399 ) ) ( not ( = ?auto_92397 ?auto_92399 ) ) ( ON ?auto_92393 ?auto_92398 ) ( ON-TABLE ?auto_92399 ) ( ON ?auto_92397 ?auto_92393 ) ( CLEAR ?auto_92395 ) ( ON ?auto_92396 ?auto_92397 ) ( CLEAR ?auto_92396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92399 ?auto_92398 ?auto_92393 ?auto_92397 )
      ( MAKE-1PILE ?auto_92392 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92400 - BLOCK
    )
    :vars
    (
      ?auto_92405 - BLOCK
      ?auto_92407 - BLOCK
      ?auto_92406 - BLOCK
      ?auto_92404 - BLOCK
      ?auto_92402 - BLOCK
      ?auto_92403 - BLOCK
      ?auto_92401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92405 ?auto_92400 ) ( ON-TABLE ?auto_92400 ) ( not ( = ?auto_92400 ?auto_92405 ) ) ( not ( = ?auto_92400 ?auto_92407 ) ) ( not ( = ?auto_92400 ?auto_92406 ) ) ( not ( = ?auto_92405 ?auto_92407 ) ) ( not ( = ?auto_92405 ?auto_92406 ) ) ( not ( = ?auto_92407 ?auto_92406 ) ) ( not ( = ?auto_92404 ?auto_92402 ) ) ( not ( = ?auto_92404 ?auto_92403 ) ) ( not ( = ?auto_92404 ?auto_92406 ) ) ( not ( = ?auto_92402 ?auto_92403 ) ) ( not ( = ?auto_92402 ?auto_92406 ) ) ( not ( = ?auto_92403 ?auto_92406 ) ) ( not ( = ?auto_92400 ?auto_92403 ) ) ( not ( = ?auto_92400 ?auto_92404 ) ) ( not ( = ?auto_92400 ?auto_92402 ) ) ( not ( = ?auto_92405 ?auto_92403 ) ) ( not ( = ?auto_92405 ?auto_92404 ) ) ( not ( = ?auto_92405 ?auto_92402 ) ) ( not ( = ?auto_92407 ?auto_92403 ) ) ( not ( = ?auto_92407 ?auto_92404 ) ) ( not ( = ?auto_92407 ?auto_92402 ) ) ( ON ?auto_92404 ?auto_92401 ) ( not ( = ?auto_92400 ?auto_92401 ) ) ( not ( = ?auto_92405 ?auto_92401 ) ) ( not ( = ?auto_92407 ?auto_92401 ) ) ( not ( = ?auto_92406 ?auto_92401 ) ) ( not ( = ?auto_92404 ?auto_92401 ) ) ( not ( = ?auto_92402 ?auto_92401 ) ) ( not ( = ?auto_92403 ?auto_92401 ) ) ( ON ?auto_92402 ?auto_92404 ) ( ON-TABLE ?auto_92401 ) ( ON ?auto_92403 ?auto_92402 ) ( ON ?auto_92406 ?auto_92403 ) ( CLEAR ?auto_92406 ) ( HOLDING ?auto_92407 ) ( CLEAR ?auto_92405 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92400 ?auto_92405 ?auto_92407 )
      ( MAKE-1PILE ?auto_92400 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92408 - BLOCK
    )
    :vars
    (
      ?auto_92415 - BLOCK
      ?auto_92412 - BLOCK
      ?auto_92410 - BLOCK
      ?auto_92414 - BLOCK
      ?auto_92411 - BLOCK
      ?auto_92413 - BLOCK
      ?auto_92409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92415 ?auto_92408 ) ( ON-TABLE ?auto_92408 ) ( not ( = ?auto_92408 ?auto_92415 ) ) ( not ( = ?auto_92408 ?auto_92412 ) ) ( not ( = ?auto_92408 ?auto_92410 ) ) ( not ( = ?auto_92415 ?auto_92412 ) ) ( not ( = ?auto_92415 ?auto_92410 ) ) ( not ( = ?auto_92412 ?auto_92410 ) ) ( not ( = ?auto_92414 ?auto_92411 ) ) ( not ( = ?auto_92414 ?auto_92413 ) ) ( not ( = ?auto_92414 ?auto_92410 ) ) ( not ( = ?auto_92411 ?auto_92413 ) ) ( not ( = ?auto_92411 ?auto_92410 ) ) ( not ( = ?auto_92413 ?auto_92410 ) ) ( not ( = ?auto_92408 ?auto_92413 ) ) ( not ( = ?auto_92408 ?auto_92414 ) ) ( not ( = ?auto_92408 ?auto_92411 ) ) ( not ( = ?auto_92415 ?auto_92413 ) ) ( not ( = ?auto_92415 ?auto_92414 ) ) ( not ( = ?auto_92415 ?auto_92411 ) ) ( not ( = ?auto_92412 ?auto_92413 ) ) ( not ( = ?auto_92412 ?auto_92414 ) ) ( not ( = ?auto_92412 ?auto_92411 ) ) ( ON ?auto_92414 ?auto_92409 ) ( not ( = ?auto_92408 ?auto_92409 ) ) ( not ( = ?auto_92415 ?auto_92409 ) ) ( not ( = ?auto_92412 ?auto_92409 ) ) ( not ( = ?auto_92410 ?auto_92409 ) ) ( not ( = ?auto_92414 ?auto_92409 ) ) ( not ( = ?auto_92411 ?auto_92409 ) ) ( not ( = ?auto_92413 ?auto_92409 ) ) ( ON ?auto_92411 ?auto_92414 ) ( ON-TABLE ?auto_92409 ) ( ON ?auto_92413 ?auto_92411 ) ( ON ?auto_92410 ?auto_92413 ) ( CLEAR ?auto_92415 ) ( ON ?auto_92412 ?auto_92410 ) ( CLEAR ?auto_92412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92409 ?auto_92414 ?auto_92411 ?auto_92413 ?auto_92410 )
      ( MAKE-1PILE ?auto_92408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92432 - BLOCK
    )
    :vars
    (
      ?auto_92439 - BLOCK
      ?auto_92437 - BLOCK
      ?auto_92435 - BLOCK
      ?auto_92434 - BLOCK
      ?auto_92433 - BLOCK
      ?auto_92438 - BLOCK
      ?auto_92436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92432 ?auto_92439 ) ) ( not ( = ?auto_92432 ?auto_92437 ) ) ( not ( = ?auto_92432 ?auto_92435 ) ) ( not ( = ?auto_92439 ?auto_92437 ) ) ( not ( = ?auto_92439 ?auto_92435 ) ) ( not ( = ?auto_92437 ?auto_92435 ) ) ( not ( = ?auto_92434 ?auto_92433 ) ) ( not ( = ?auto_92434 ?auto_92438 ) ) ( not ( = ?auto_92434 ?auto_92435 ) ) ( not ( = ?auto_92433 ?auto_92438 ) ) ( not ( = ?auto_92433 ?auto_92435 ) ) ( not ( = ?auto_92438 ?auto_92435 ) ) ( not ( = ?auto_92432 ?auto_92438 ) ) ( not ( = ?auto_92432 ?auto_92434 ) ) ( not ( = ?auto_92432 ?auto_92433 ) ) ( not ( = ?auto_92439 ?auto_92438 ) ) ( not ( = ?auto_92439 ?auto_92434 ) ) ( not ( = ?auto_92439 ?auto_92433 ) ) ( not ( = ?auto_92437 ?auto_92438 ) ) ( not ( = ?auto_92437 ?auto_92434 ) ) ( not ( = ?auto_92437 ?auto_92433 ) ) ( ON ?auto_92434 ?auto_92436 ) ( not ( = ?auto_92432 ?auto_92436 ) ) ( not ( = ?auto_92439 ?auto_92436 ) ) ( not ( = ?auto_92437 ?auto_92436 ) ) ( not ( = ?auto_92435 ?auto_92436 ) ) ( not ( = ?auto_92434 ?auto_92436 ) ) ( not ( = ?auto_92433 ?auto_92436 ) ) ( not ( = ?auto_92438 ?auto_92436 ) ) ( ON ?auto_92433 ?auto_92434 ) ( ON-TABLE ?auto_92436 ) ( ON ?auto_92438 ?auto_92433 ) ( ON ?auto_92435 ?auto_92438 ) ( ON ?auto_92437 ?auto_92435 ) ( ON ?auto_92439 ?auto_92437 ) ( CLEAR ?auto_92439 ) ( HOLDING ?auto_92432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92432 ?auto_92439 )
      ( MAKE-1PILE ?auto_92432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92440 - BLOCK
    )
    :vars
    (
      ?auto_92441 - BLOCK
      ?auto_92446 - BLOCK
      ?auto_92442 - BLOCK
      ?auto_92445 - BLOCK
      ?auto_92444 - BLOCK
      ?auto_92443 - BLOCK
      ?auto_92447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92440 ?auto_92441 ) ) ( not ( = ?auto_92440 ?auto_92446 ) ) ( not ( = ?auto_92440 ?auto_92442 ) ) ( not ( = ?auto_92441 ?auto_92446 ) ) ( not ( = ?auto_92441 ?auto_92442 ) ) ( not ( = ?auto_92446 ?auto_92442 ) ) ( not ( = ?auto_92445 ?auto_92444 ) ) ( not ( = ?auto_92445 ?auto_92443 ) ) ( not ( = ?auto_92445 ?auto_92442 ) ) ( not ( = ?auto_92444 ?auto_92443 ) ) ( not ( = ?auto_92444 ?auto_92442 ) ) ( not ( = ?auto_92443 ?auto_92442 ) ) ( not ( = ?auto_92440 ?auto_92443 ) ) ( not ( = ?auto_92440 ?auto_92445 ) ) ( not ( = ?auto_92440 ?auto_92444 ) ) ( not ( = ?auto_92441 ?auto_92443 ) ) ( not ( = ?auto_92441 ?auto_92445 ) ) ( not ( = ?auto_92441 ?auto_92444 ) ) ( not ( = ?auto_92446 ?auto_92443 ) ) ( not ( = ?auto_92446 ?auto_92445 ) ) ( not ( = ?auto_92446 ?auto_92444 ) ) ( ON ?auto_92445 ?auto_92447 ) ( not ( = ?auto_92440 ?auto_92447 ) ) ( not ( = ?auto_92441 ?auto_92447 ) ) ( not ( = ?auto_92446 ?auto_92447 ) ) ( not ( = ?auto_92442 ?auto_92447 ) ) ( not ( = ?auto_92445 ?auto_92447 ) ) ( not ( = ?auto_92444 ?auto_92447 ) ) ( not ( = ?auto_92443 ?auto_92447 ) ) ( ON ?auto_92444 ?auto_92445 ) ( ON-TABLE ?auto_92447 ) ( ON ?auto_92443 ?auto_92444 ) ( ON ?auto_92442 ?auto_92443 ) ( ON ?auto_92446 ?auto_92442 ) ( ON ?auto_92441 ?auto_92446 ) ( ON ?auto_92440 ?auto_92441 ) ( CLEAR ?auto_92440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92447 ?auto_92445 ?auto_92444 ?auto_92443 ?auto_92442 ?auto_92446 ?auto_92441 )
      ( MAKE-1PILE ?auto_92440 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92454 - BLOCK
      ?auto_92455 - BLOCK
      ?auto_92456 - BLOCK
      ?auto_92457 - BLOCK
      ?auto_92458 - BLOCK
      ?auto_92459 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92459 ) ( CLEAR ?auto_92458 ) ( ON-TABLE ?auto_92454 ) ( ON ?auto_92455 ?auto_92454 ) ( ON ?auto_92456 ?auto_92455 ) ( ON ?auto_92457 ?auto_92456 ) ( ON ?auto_92458 ?auto_92457 ) ( not ( = ?auto_92454 ?auto_92455 ) ) ( not ( = ?auto_92454 ?auto_92456 ) ) ( not ( = ?auto_92454 ?auto_92457 ) ) ( not ( = ?auto_92454 ?auto_92458 ) ) ( not ( = ?auto_92454 ?auto_92459 ) ) ( not ( = ?auto_92455 ?auto_92456 ) ) ( not ( = ?auto_92455 ?auto_92457 ) ) ( not ( = ?auto_92455 ?auto_92458 ) ) ( not ( = ?auto_92455 ?auto_92459 ) ) ( not ( = ?auto_92456 ?auto_92457 ) ) ( not ( = ?auto_92456 ?auto_92458 ) ) ( not ( = ?auto_92456 ?auto_92459 ) ) ( not ( = ?auto_92457 ?auto_92458 ) ) ( not ( = ?auto_92457 ?auto_92459 ) ) ( not ( = ?auto_92458 ?auto_92459 ) ) )
    :subtasks
    ( ( !STACK ?auto_92459 ?auto_92458 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92460 - BLOCK
      ?auto_92461 - BLOCK
      ?auto_92462 - BLOCK
      ?auto_92463 - BLOCK
      ?auto_92464 - BLOCK
      ?auto_92465 - BLOCK
    )
    :vars
    (
      ?auto_92466 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92464 ) ( ON-TABLE ?auto_92460 ) ( ON ?auto_92461 ?auto_92460 ) ( ON ?auto_92462 ?auto_92461 ) ( ON ?auto_92463 ?auto_92462 ) ( ON ?auto_92464 ?auto_92463 ) ( not ( = ?auto_92460 ?auto_92461 ) ) ( not ( = ?auto_92460 ?auto_92462 ) ) ( not ( = ?auto_92460 ?auto_92463 ) ) ( not ( = ?auto_92460 ?auto_92464 ) ) ( not ( = ?auto_92460 ?auto_92465 ) ) ( not ( = ?auto_92461 ?auto_92462 ) ) ( not ( = ?auto_92461 ?auto_92463 ) ) ( not ( = ?auto_92461 ?auto_92464 ) ) ( not ( = ?auto_92461 ?auto_92465 ) ) ( not ( = ?auto_92462 ?auto_92463 ) ) ( not ( = ?auto_92462 ?auto_92464 ) ) ( not ( = ?auto_92462 ?auto_92465 ) ) ( not ( = ?auto_92463 ?auto_92464 ) ) ( not ( = ?auto_92463 ?auto_92465 ) ) ( not ( = ?auto_92464 ?auto_92465 ) ) ( ON ?auto_92465 ?auto_92466 ) ( CLEAR ?auto_92465 ) ( HAND-EMPTY ) ( not ( = ?auto_92460 ?auto_92466 ) ) ( not ( = ?auto_92461 ?auto_92466 ) ) ( not ( = ?auto_92462 ?auto_92466 ) ) ( not ( = ?auto_92463 ?auto_92466 ) ) ( not ( = ?auto_92464 ?auto_92466 ) ) ( not ( = ?auto_92465 ?auto_92466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92465 ?auto_92466 )
      ( MAKE-6PILE ?auto_92460 ?auto_92461 ?auto_92462 ?auto_92463 ?auto_92464 ?auto_92465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92467 - BLOCK
      ?auto_92468 - BLOCK
      ?auto_92469 - BLOCK
      ?auto_92470 - BLOCK
      ?auto_92471 - BLOCK
      ?auto_92472 - BLOCK
    )
    :vars
    (
      ?auto_92473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92467 ) ( ON ?auto_92468 ?auto_92467 ) ( ON ?auto_92469 ?auto_92468 ) ( ON ?auto_92470 ?auto_92469 ) ( not ( = ?auto_92467 ?auto_92468 ) ) ( not ( = ?auto_92467 ?auto_92469 ) ) ( not ( = ?auto_92467 ?auto_92470 ) ) ( not ( = ?auto_92467 ?auto_92471 ) ) ( not ( = ?auto_92467 ?auto_92472 ) ) ( not ( = ?auto_92468 ?auto_92469 ) ) ( not ( = ?auto_92468 ?auto_92470 ) ) ( not ( = ?auto_92468 ?auto_92471 ) ) ( not ( = ?auto_92468 ?auto_92472 ) ) ( not ( = ?auto_92469 ?auto_92470 ) ) ( not ( = ?auto_92469 ?auto_92471 ) ) ( not ( = ?auto_92469 ?auto_92472 ) ) ( not ( = ?auto_92470 ?auto_92471 ) ) ( not ( = ?auto_92470 ?auto_92472 ) ) ( not ( = ?auto_92471 ?auto_92472 ) ) ( ON ?auto_92472 ?auto_92473 ) ( CLEAR ?auto_92472 ) ( not ( = ?auto_92467 ?auto_92473 ) ) ( not ( = ?auto_92468 ?auto_92473 ) ) ( not ( = ?auto_92469 ?auto_92473 ) ) ( not ( = ?auto_92470 ?auto_92473 ) ) ( not ( = ?auto_92471 ?auto_92473 ) ) ( not ( = ?auto_92472 ?auto_92473 ) ) ( HOLDING ?auto_92471 ) ( CLEAR ?auto_92470 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92467 ?auto_92468 ?auto_92469 ?auto_92470 ?auto_92471 )
      ( MAKE-6PILE ?auto_92467 ?auto_92468 ?auto_92469 ?auto_92470 ?auto_92471 ?auto_92472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92474 - BLOCK
      ?auto_92475 - BLOCK
      ?auto_92476 - BLOCK
      ?auto_92477 - BLOCK
      ?auto_92478 - BLOCK
      ?auto_92479 - BLOCK
    )
    :vars
    (
      ?auto_92480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92474 ) ( ON ?auto_92475 ?auto_92474 ) ( ON ?auto_92476 ?auto_92475 ) ( ON ?auto_92477 ?auto_92476 ) ( not ( = ?auto_92474 ?auto_92475 ) ) ( not ( = ?auto_92474 ?auto_92476 ) ) ( not ( = ?auto_92474 ?auto_92477 ) ) ( not ( = ?auto_92474 ?auto_92478 ) ) ( not ( = ?auto_92474 ?auto_92479 ) ) ( not ( = ?auto_92475 ?auto_92476 ) ) ( not ( = ?auto_92475 ?auto_92477 ) ) ( not ( = ?auto_92475 ?auto_92478 ) ) ( not ( = ?auto_92475 ?auto_92479 ) ) ( not ( = ?auto_92476 ?auto_92477 ) ) ( not ( = ?auto_92476 ?auto_92478 ) ) ( not ( = ?auto_92476 ?auto_92479 ) ) ( not ( = ?auto_92477 ?auto_92478 ) ) ( not ( = ?auto_92477 ?auto_92479 ) ) ( not ( = ?auto_92478 ?auto_92479 ) ) ( ON ?auto_92479 ?auto_92480 ) ( not ( = ?auto_92474 ?auto_92480 ) ) ( not ( = ?auto_92475 ?auto_92480 ) ) ( not ( = ?auto_92476 ?auto_92480 ) ) ( not ( = ?auto_92477 ?auto_92480 ) ) ( not ( = ?auto_92478 ?auto_92480 ) ) ( not ( = ?auto_92479 ?auto_92480 ) ) ( CLEAR ?auto_92477 ) ( ON ?auto_92478 ?auto_92479 ) ( CLEAR ?auto_92478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92480 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92480 ?auto_92479 )
      ( MAKE-6PILE ?auto_92474 ?auto_92475 ?auto_92476 ?auto_92477 ?auto_92478 ?auto_92479 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92481 - BLOCK
      ?auto_92482 - BLOCK
      ?auto_92483 - BLOCK
      ?auto_92484 - BLOCK
      ?auto_92485 - BLOCK
      ?auto_92486 - BLOCK
    )
    :vars
    (
      ?auto_92487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92481 ) ( ON ?auto_92482 ?auto_92481 ) ( ON ?auto_92483 ?auto_92482 ) ( not ( = ?auto_92481 ?auto_92482 ) ) ( not ( = ?auto_92481 ?auto_92483 ) ) ( not ( = ?auto_92481 ?auto_92484 ) ) ( not ( = ?auto_92481 ?auto_92485 ) ) ( not ( = ?auto_92481 ?auto_92486 ) ) ( not ( = ?auto_92482 ?auto_92483 ) ) ( not ( = ?auto_92482 ?auto_92484 ) ) ( not ( = ?auto_92482 ?auto_92485 ) ) ( not ( = ?auto_92482 ?auto_92486 ) ) ( not ( = ?auto_92483 ?auto_92484 ) ) ( not ( = ?auto_92483 ?auto_92485 ) ) ( not ( = ?auto_92483 ?auto_92486 ) ) ( not ( = ?auto_92484 ?auto_92485 ) ) ( not ( = ?auto_92484 ?auto_92486 ) ) ( not ( = ?auto_92485 ?auto_92486 ) ) ( ON ?auto_92486 ?auto_92487 ) ( not ( = ?auto_92481 ?auto_92487 ) ) ( not ( = ?auto_92482 ?auto_92487 ) ) ( not ( = ?auto_92483 ?auto_92487 ) ) ( not ( = ?auto_92484 ?auto_92487 ) ) ( not ( = ?auto_92485 ?auto_92487 ) ) ( not ( = ?auto_92486 ?auto_92487 ) ) ( ON ?auto_92485 ?auto_92486 ) ( CLEAR ?auto_92485 ) ( ON-TABLE ?auto_92487 ) ( HOLDING ?auto_92484 ) ( CLEAR ?auto_92483 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92481 ?auto_92482 ?auto_92483 ?auto_92484 )
      ( MAKE-6PILE ?auto_92481 ?auto_92482 ?auto_92483 ?auto_92484 ?auto_92485 ?auto_92486 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92488 - BLOCK
      ?auto_92489 - BLOCK
      ?auto_92490 - BLOCK
      ?auto_92491 - BLOCK
      ?auto_92492 - BLOCK
      ?auto_92493 - BLOCK
    )
    :vars
    (
      ?auto_92494 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92488 ) ( ON ?auto_92489 ?auto_92488 ) ( ON ?auto_92490 ?auto_92489 ) ( not ( = ?auto_92488 ?auto_92489 ) ) ( not ( = ?auto_92488 ?auto_92490 ) ) ( not ( = ?auto_92488 ?auto_92491 ) ) ( not ( = ?auto_92488 ?auto_92492 ) ) ( not ( = ?auto_92488 ?auto_92493 ) ) ( not ( = ?auto_92489 ?auto_92490 ) ) ( not ( = ?auto_92489 ?auto_92491 ) ) ( not ( = ?auto_92489 ?auto_92492 ) ) ( not ( = ?auto_92489 ?auto_92493 ) ) ( not ( = ?auto_92490 ?auto_92491 ) ) ( not ( = ?auto_92490 ?auto_92492 ) ) ( not ( = ?auto_92490 ?auto_92493 ) ) ( not ( = ?auto_92491 ?auto_92492 ) ) ( not ( = ?auto_92491 ?auto_92493 ) ) ( not ( = ?auto_92492 ?auto_92493 ) ) ( ON ?auto_92493 ?auto_92494 ) ( not ( = ?auto_92488 ?auto_92494 ) ) ( not ( = ?auto_92489 ?auto_92494 ) ) ( not ( = ?auto_92490 ?auto_92494 ) ) ( not ( = ?auto_92491 ?auto_92494 ) ) ( not ( = ?auto_92492 ?auto_92494 ) ) ( not ( = ?auto_92493 ?auto_92494 ) ) ( ON ?auto_92492 ?auto_92493 ) ( ON-TABLE ?auto_92494 ) ( CLEAR ?auto_92490 ) ( ON ?auto_92491 ?auto_92492 ) ( CLEAR ?auto_92491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92494 ?auto_92493 ?auto_92492 )
      ( MAKE-6PILE ?auto_92488 ?auto_92489 ?auto_92490 ?auto_92491 ?auto_92492 ?auto_92493 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92495 - BLOCK
      ?auto_92496 - BLOCK
      ?auto_92497 - BLOCK
      ?auto_92498 - BLOCK
      ?auto_92499 - BLOCK
      ?auto_92500 - BLOCK
    )
    :vars
    (
      ?auto_92501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92495 ) ( ON ?auto_92496 ?auto_92495 ) ( not ( = ?auto_92495 ?auto_92496 ) ) ( not ( = ?auto_92495 ?auto_92497 ) ) ( not ( = ?auto_92495 ?auto_92498 ) ) ( not ( = ?auto_92495 ?auto_92499 ) ) ( not ( = ?auto_92495 ?auto_92500 ) ) ( not ( = ?auto_92496 ?auto_92497 ) ) ( not ( = ?auto_92496 ?auto_92498 ) ) ( not ( = ?auto_92496 ?auto_92499 ) ) ( not ( = ?auto_92496 ?auto_92500 ) ) ( not ( = ?auto_92497 ?auto_92498 ) ) ( not ( = ?auto_92497 ?auto_92499 ) ) ( not ( = ?auto_92497 ?auto_92500 ) ) ( not ( = ?auto_92498 ?auto_92499 ) ) ( not ( = ?auto_92498 ?auto_92500 ) ) ( not ( = ?auto_92499 ?auto_92500 ) ) ( ON ?auto_92500 ?auto_92501 ) ( not ( = ?auto_92495 ?auto_92501 ) ) ( not ( = ?auto_92496 ?auto_92501 ) ) ( not ( = ?auto_92497 ?auto_92501 ) ) ( not ( = ?auto_92498 ?auto_92501 ) ) ( not ( = ?auto_92499 ?auto_92501 ) ) ( not ( = ?auto_92500 ?auto_92501 ) ) ( ON ?auto_92499 ?auto_92500 ) ( ON-TABLE ?auto_92501 ) ( ON ?auto_92498 ?auto_92499 ) ( CLEAR ?auto_92498 ) ( HOLDING ?auto_92497 ) ( CLEAR ?auto_92496 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92495 ?auto_92496 ?auto_92497 )
      ( MAKE-6PILE ?auto_92495 ?auto_92496 ?auto_92497 ?auto_92498 ?auto_92499 ?auto_92500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92502 - BLOCK
      ?auto_92503 - BLOCK
      ?auto_92504 - BLOCK
      ?auto_92505 - BLOCK
      ?auto_92506 - BLOCK
      ?auto_92507 - BLOCK
    )
    :vars
    (
      ?auto_92508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92502 ) ( ON ?auto_92503 ?auto_92502 ) ( not ( = ?auto_92502 ?auto_92503 ) ) ( not ( = ?auto_92502 ?auto_92504 ) ) ( not ( = ?auto_92502 ?auto_92505 ) ) ( not ( = ?auto_92502 ?auto_92506 ) ) ( not ( = ?auto_92502 ?auto_92507 ) ) ( not ( = ?auto_92503 ?auto_92504 ) ) ( not ( = ?auto_92503 ?auto_92505 ) ) ( not ( = ?auto_92503 ?auto_92506 ) ) ( not ( = ?auto_92503 ?auto_92507 ) ) ( not ( = ?auto_92504 ?auto_92505 ) ) ( not ( = ?auto_92504 ?auto_92506 ) ) ( not ( = ?auto_92504 ?auto_92507 ) ) ( not ( = ?auto_92505 ?auto_92506 ) ) ( not ( = ?auto_92505 ?auto_92507 ) ) ( not ( = ?auto_92506 ?auto_92507 ) ) ( ON ?auto_92507 ?auto_92508 ) ( not ( = ?auto_92502 ?auto_92508 ) ) ( not ( = ?auto_92503 ?auto_92508 ) ) ( not ( = ?auto_92504 ?auto_92508 ) ) ( not ( = ?auto_92505 ?auto_92508 ) ) ( not ( = ?auto_92506 ?auto_92508 ) ) ( not ( = ?auto_92507 ?auto_92508 ) ) ( ON ?auto_92506 ?auto_92507 ) ( ON-TABLE ?auto_92508 ) ( ON ?auto_92505 ?auto_92506 ) ( CLEAR ?auto_92503 ) ( ON ?auto_92504 ?auto_92505 ) ( CLEAR ?auto_92504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92508 ?auto_92507 ?auto_92506 ?auto_92505 )
      ( MAKE-6PILE ?auto_92502 ?auto_92503 ?auto_92504 ?auto_92505 ?auto_92506 ?auto_92507 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92509 - BLOCK
      ?auto_92510 - BLOCK
      ?auto_92511 - BLOCK
      ?auto_92512 - BLOCK
      ?auto_92513 - BLOCK
      ?auto_92514 - BLOCK
    )
    :vars
    (
      ?auto_92515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92509 ) ( not ( = ?auto_92509 ?auto_92510 ) ) ( not ( = ?auto_92509 ?auto_92511 ) ) ( not ( = ?auto_92509 ?auto_92512 ) ) ( not ( = ?auto_92509 ?auto_92513 ) ) ( not ( = ?auto_92509 ?auto_92514 ) ) ( not ( = ?auto_92510 ?auto_92511 ) ) ( not ( = ?auto_92510 ?auto_92512 ) ) ( not ( = ?auto_92510 ?auto_92513 ) ) ( not ( = ?auto_92510 ?auto_92514 ) ) ( not ( = ?auto_92511 ?auto_92512 ) ) ( not ( = ?auto_92511 ?auto_92513 ) ) ( not ( = ?auto_92511 ?auto_92514 ) ) ( not ( = ?auto_92512 ?auto_92513 ) ) ( not ( = ?auto_92512 ?auto_92514 ) ) ( not ( = ?auto_92513 ?auto_92514 ) ) ( ON ?auto_92514 ?auto_92515 ) ( not ( = ?auto_92509 ?auto_92515 ) ) ( not ( = ?auto_92510 ?auto_92515 ) ) ( not ( = ?auto_92511 ?auto_92515 ) ) ( not ( = ?auto_92512 ?auto_92515 ) ) ( not ( = ?auto_92513 ?auto_92515 ) ) ( not ( = ?auto_92514 ?auto_92515 ) ) ( ON ?auto_92513 ?auto_92514 ) ( ON-TABLE ?auto_92515 ) ( ON ?auto_92512 ?auto_92513 ) ( ON ?auto_92511 ?auto_92512 ) ( CLEAR ?auto_92511 ) ( HOLDING ?auto_92510 ) ( CLEAR ?auto_92509 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92509 ?auto_92510 )
      ( MAKE-6PILE ?auto_92509 ?auto_92510 ?auto_92511 ?auto_92512 ?auto_92513 ?auto_92514 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92516 - BLOCK
      ?auto_92517 - BLOCK
      ?auto_92518 - BLOCK
      ?auto_92519 - BLOCK
      ?auto_92520 - BLOCK
      ?auto_92521 - BLOCK
    )
    :vars
    (
      ?auto_92522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92516 ) ( not ( = ?auto_92516 ?auto_92517 ) ) ( not ( = ?auto_92516 ?auto_92518 ) ) ( not ( = ?auto_92516 ?auto_92519 ) ) ( not ( = ?auto_92516 ?auto_92520 ) ) ( not ( = ?auto_92516 ?auto_92521 ) ) ( not ( = ?auto_92517 ?auto_92518 ) ) ( not ( = ?auto_92517 ?auto_92519 ) ) ( not ( = ?auto_92517 ?auto_92520 ) ) ( not ( = ?auto_92517 ?auto_92521 ) ) ( not ( = ?auto_92518 ?auto_92519 ) ) ( not ( = ?auto_92518 ?auto_92520 ) ) ( not ( = ?auto_92518 ?auto_92521 ) ) ( not ( = ?auto_92519 ?auto_92520 ) ) ( not ( = ?auto_92519 ?auto_92521 ) ) ( not ( = ?auto_92520 ?auto_92521 ) ) ( ON ?auto_92521 ?auto_92522 ) ( not ( = ?auto_92516 ?auto_92522 ) ) ( not ( = ?auto_92517 ?auto_92522 ) ) ( not ( = ?auto_92518 ?auto_92522 ) ) ( not ( = ?auto_92519 ?auto_92522 ) ) ( not ( = ?auto_92520 ?auto_92522 ) ) ( not ( = ?auto_92521 ?auto_92522 ) ) ( ON ?auto_92520 ?auto_92521 ) ( ON-TABLE ?auto_92522 ) ( ON ?auto_92519 ?auto_92520 ) ( ON ?auto_92518 ?auto_92519 ) ( CLEAR ?auto_92516 ) ( ON ?auto_92517 ?auto_92518 ) ( CLEAR ?auto_92517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92522 ?auto_92521 ?auto_92520 ?auto_92519 ?auto_92518 )
      ( MAKE-6PILE ?auto_92516 ?auto_92517 ?auto_92518 ?auto_92519 ?auto_92520 ?auto_92521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92523 - BLOCK
      ?auto_92524 - BLOCK
      ?auto_92525 - BLOCK
      ?auto_92526 - BLOCK
      ?auto_92527 - BLOCK
      ?auto_92528 - BLOCK
    )
    :vars
    (
      ?auto_92529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92523 ?auto_92524 ) ) ( not ( = ?auto_92523 ?auto_92525 ) ) ( not ( = ?auto_92523 ?auto_92526 ) ) ( not ( = ?auto_92523 ?auto_92527 ) ) ( not ( = ?auto_92523 ?auto_92528 ) ) ( not ( = ?auto_92524 ?auto_92525 ) ) ( not ( = ?auto_92524 ?auto_92526 ) ) ( not ( = ?auto_92524 ?auto_92527 ) ) ( not ( = ?auto_92524 ?auto_92528 ) ) ( not ( = ?auto_92525 ?auto_92526 ) ) ( not ( = ?auto_92525 ?auto_92527 ) ) ( not ( = ?auto_92525 ?auto_92528 ) ) ( not ( = ?auto_92526 ?auto_92527 ) ) ( not ( = ?auto_92526 ?auto_92528 ) ) ( not ( = ?auto_92527 ?auto_92528 ) ) ( ON ?auto_92528 ?auto_92529 ) ( not ( = ?auto_92523 ?auto_92529 ) ) ( not ( = ?auto_92524 ?auto_92529 ) ) ( not ( = ?auto_92525 ?auto_92529 ) ) ( not ( = ?auto_92526 ?auto_92529 ) ) ( not ( = ?auto_92527 ?auto_92529 ) ) ( not ( = ?auto_92528 ?auto_92529 ) ) ( ON ?auto_92527 ?auto_92528 ) ( ON-TABLE ?auto_92529 ) ( ON ?auto_92526 ?auto_92527 ) ( ON ?auto_92525 ?auto_92526 ) ( ON ?auto_92524 ?auto_92525 ) ( CLEAR ?auto_92524 ) ( HOLDING ?auto_92523 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92523 )
      ( MAKE-6PILE ?auto_92523 ?auto_92524 ?auto_92525 ?auto_92526 ?auto_92527 ?auto_92528 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92530 - BLOCK
      ?auto_92531 - BLOCK
      ?auto_92532 - BLOCK
      ?auto_92533 - BLOCK
      ?auto_92534 - BLOCK
      ?auto_92535 - BLOCK
    )
    :vars
    (
      ?auto_92536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92530 ?auto_92531 ) ) ( not ( = ?auto_92530 ?auto_92532 ) ) ( not ( = ?auto_92530 ?auto_92533 ) ) ( not ( = ?auto_92530 ?auto_92534 ) ) ( not ( = ?auto_92530 ?auto_92535 ) ) ( not ( = ?auto_92531 ?auto_92532 ) ) ( not ( = ?auto_92531 ?auto_92533 ) ) ( not ( = ?auto_92531 ?auto_92534 ) ) ( not ( = ?auto_92531 ?auto_92535 ) ) ( not ( = ?auto_92532 ?auto_92533 ) ) ( not ( = ?auto_92532 ?auto_92534 ) ) ( not ( = ?auto_92532 ?auto_92535 ) ) ( not ( = ?auto_92533 ?auto_92534 ) ) ( not ( = ?auto_92533 ?auto_92535 ) ) ( not ( = ?auto_92534 ?auto_92535 ) ) ( ON ?auto_92535 ?auto_92536 ) ( not ( = ?auto_92530 ?auto_92536 ) ) ( not ( = ?auto_92531 ?auto_92536 ) ) ( not ( = ?auto_92532 ?auto_92536 ) ) ( not ( = ?auto_92533 ?auto_92536 ) ) ( not ( = ?auto_92534 ?auto_92536 ) ) ( not ( = ?auto_92535 ?auto_92536 ) ) ( ON ?auto_92534 ?auto_92535 ) ( ON-TABLE ?auto_92536 ) ( ON ?auto_92533 ?auto_92534 ) ( ON ?auto_92532 ?auto_92533 ) ( ON ?auto_92531 ?auto_92532 ) ( ON ?auto_92530 ?auto_92531 ) ( CLEAR ?auto_92530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92536 ?auto_92535 ?auto_92534 ?auto_92533 ?auto_92532 ?auto_92531 )
      ( MAKE-6PILE ?auto_92530 ?auto_92531 ?auto_92532 ?auto_92533 ?auto_92534 ?auto_92535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92537 - BLOCK
      ?auto_92538 - BLOCK
      ?auto_92539 - BLOCK
      ?auto_92540 - BLOCK
      ?auto_92541 - BLOCK
      ?auto_92542 - BLOCK
    )
    :vars
    (
      ?auto_92543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92537 ?auto_92538 ) ) ( not ( = ?auto_92537 ?auto_92539 ) ) ( not ( = ?auto_92537 ?auto_92540 ) ) ( not ( = ?auto_92537 ?auto_92541 ) ) ( not ( = ?auto_92537 ?auto_92542 ) ) ( not ( = ?auto_92538 ?auto_92539 ) ) ( not ( = ?auto_92538 ?auto_92540 ) ) ( not ( = ?auto_92538 ?auto_92541 ) ) ( not ( = ?auto_92538 ?auto_92542 ) ) ( not ( = ?auto_92539 ?auto_92540 ) ) ( not ( = ?auto_92539 ?auto_92541 ) ) ( not ( = ?auto_92539 ?auto_92542 ) ) ( not ( = ?auto_92540 ?auto_92541 ) ) ( not ( = ?auto_92540 ?auto_92542 ) ) ( not ( = ?auto_92541 ?auto_92542 ) ) ( ON ?auto_92542 ?auto_92543 ) ( not ( = ?auto_92537 ?auto_92543 ) ) ( not ( = ?auto_92538 ?auto_92543 ) ) ( not ( = ?auto_92539 ?auto_92543 ) ) ( not ( = ?auto_92540 ?auto_92543 ) ) ( not ( = ?auto_92541 ?auto_92543 ) ) ( not ( = ?auto_92542 ?auto_92543 ) ) ( ON ?auto_92541 ?auto_92542 ) ( ON-TABLE ?auto_92543 ) ( ON ?auto_92540 ?auto_92541 ) ( ON ?auto_92539 ?auto_92540 ) ( ON ?auto_92538 ?auto_92539 ) ( HOLDING ?auto_92537 ) ( CLEAR ?auto_92538 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92543 ?auto_92542 ?auto_92541 ?auto_92540 ?auto_92539 ?auto_92538 ?auto_92537 )
      ( MAKE-6PILE ?auto_92537 ?auto_92538 ?auto_92539 ?auto_92540 ?auto_92541 ?auto_92542 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92544 - BLOCK
      ?auto_92545 - BLOCK
      ?auto_92546 - BLOCK
      ?auto_92547 - BLOCK
      ?auto_92548 - BLOCK
      ?auto_92549 - BLOCK
    )
    :vars
    (
      ?auto_92550 - BLOCK
      ?auto_92551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92544 ?auto_92545 ) ) ( not ( = ?auto_92544 ?auto_92546 ) ) ( not ( = ?auto_92544 ?auto_92547 ) ) ( not ( = ?auto_92544 ?auto_92548 ) ) ( not ( = ?auto_92544 ?auto_92549 ) ) ( not ( = ?auto_92545 ?auto_92546 ) ) ( not ( = ?auto_92545 ?auto_92547 ) ) ( not ( = ?auto_92545 ?auto_92548 ) ) ( not ( = ?auto_92545 ?auto_92549 ) ) ( not ( = ?auto_92546 ?auto_92547 ) ) ( not ( = ?auto_92546 ?auto_92548 ) ) ( not ( = ?auto_92546 ?auto_92549 ) ) ( not ( = ?auto_92547 ?auto_92548 ) ) ( not ( = ?auto_92547 ?auto_92549 ) ) ( not ( = ?auto_92548 ?auto_92549 ) ) ( ON ?auto_92549 ?auto_92550 ) ( not ( = ?auto_92544 ?auto_92550 ) ) ( not ( = ?auto_92545 ?auto_92550 ) ) ( not ( = ?auto_92546 ?auto_92550 ) ) ( not ( = ?auto_92547 ?auto_92550 ) ) ( not ( = ?auto_92548 ?auto_92550 ) ) ( not ( = ?auto_92549 ?auto_92550 ) ) ( ON ?auto_92548 ?auto_92549 ) ( ON-TABLE ?auto_92550 ) ( ON ?auto_92547 ?auto_92548 ) ( ON ?auto_92546 ?auto_92547 ) ( ON ?auto_92545 ?auto_92546 ) ( CLEAR ?auto_92545 ) ( ON ?auto_92544 ?auto_92551 ) ( CLEAR ?auto_92544 ) ( HAND-EMPTY ) ( not ( = ?auto_92544 ?auto_92551 ) ) ( not ( = ?auto_92545 ?auto_92551 ) ) ( not ( = ?auto_92546 ?auto_92551 ) ) ( not ( = ?auto_92547 ?auto_92551 ) ) ( not ( = ?auto_92548 ?auto_92551 ) ) ( not ( = ?auto_92549 ?auto_92551 ) ) ( not ( = ?auto_92550 ?auto_92551 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92544 ?auto_92551 )
      ( MAKE-6PILE ?auto_92544 ?auto_92545 ?auto_92546 ?auto_92547 ?auto_92548 ?auto_92549 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92552 - BLOCK
      ?auto_92553 - BLOCK
      ?auto_92554 - BLOCK
      ?auto_92555 - BLOCK
      ?auto_92556 - BLOCK
      ?auto_92557 - BLOCK
    )
    :vars
    (
      ?auto_92559 - BLOCK
      ?auto_92558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92552 ?auto_92553 ) ) ( not ( = ?auto_92552 ?auto_92554 ) ) ( not ( = ?auto_92552 ?auto_92555 ) ) ( not ( = ?auto_92552 ?auto_92556 ) ) ( not ( = ?auto_92552 ?auto_92557 ) ) ( not ( = ?auto_92553 ?auto_92554 ) ) ( not ( = ?auto_92553 ?auto_92555 ) ) ( not ( = ?auto_92553 ?auto_92556 ) ) ( not ( = ?auto_92553 ?auto_92557 ) ) ( not ( = ?auto_92554 ?auto_92555 ) ) ( not ( = ?auto_92554 ?auto_92556 ) ) ( not ( = ?auto_92554 ?auto_92557 ) ) ( not ( = ?auto_92555 ?auto_92556 ) ) ( not ( = ?auto_92555 ?auto_92557 ) ) ( not ( = ?auto_92556 ?auto_92557 ) ) ( ON ?auto_92557 ?auto_92559 ) ( not ( = ?auto_92552 ?auto_92559 ) ) ( not ( = ?auto_92553 ?auto_92559 ) ) ( not ( = ?auto_92554 ?auto_92559 ) ) ( not ( = ?auto_92555 ?auto_92559 ) ) ( not ( = ?auto_92556 ?auto_92559 ) ) ( not ( = ?auto_92557 ?auto_92559 ) ) ( ON ?auto_92556 ?auto_92557 ) ( ON-TABLE ?auto_92559 ) ( ON ?auto_92555 ?auto_92556 ) ( ON ?auto_92554 ?auto_92555 ) ( ON ?auto_92552 ?auto_92558 ) ( CLEAR ?auto_92552 ) ( not ( = ?auto_92552 ?auto_92558 ) ) ( not ( = ?auto_92553 ?auto_92558 ) ) ( not ( = ?auto_92554 ?auto_92558 ) ) ( not ( = ?auto_92555 ?auto_92558 ) ) ( not ( = ?auto_92556 ?auto_92558 ) ) ( not ( = ?auto_92557 ?auto_92558 ) ) ( not ( = ?auto_92559 ?auto_92558 ) ) ( HOLDING ?auto_92553 ) ( CLEAR ?auto_92554 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92559 ?auto_92557 ?auto_92556 ?auto_92555 ?auto_92554 ?auto_92553 )
      ( MAKE-6PILE ?auto_92552 ?auto_92553 ?auto_92554 ?auto_92555 ?auto_92556 ?auto_92557 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92560 - BLOCK
      ?auto_92561 - BLOCK
      ?auto_92562 - BLOCK
      ?auto_92563 - BLOCK
      ?auto_92564 - BLOCK
      ?auto_92565 - BLOCK
    )
    :vars
    (
      ?auto_92567 - BLOCK
      ?auto_92566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92560 ?auto_92561 ) ) ( not ( = ?auto_92560 ?auto_92562 ) ) ( not ( = ?auto_92560 ?auto_92563 ) ) ( not ( = ?auto_92560 ?auto_92564 ) ) ( not ( = ?auto_92560 ?auto_92565 ) ) ( not ( = ?auto_92561 ?auto_92562 ) ) ( not ( = ?auto_92561 ?auto_92563 ) ) ( not ( = ?auto_92561 ?auto_92564 ) ) ( not ( = ?auto_92561 ?auto_92565 ) ) ( not ( = ?auto_92562 ?auto_92563 ) ) ( not ( = ?auto_92562 ?auto_92564 ) ) ( not ( = ?auto_92562 ?auto_92565 ) ) ( not ( = ?auto_92563 ?auto_92564 ) ) ( not ( = ?auto_92563 ?auto_92565 ) ) ( not ( = ?auto_92564 ?auto_92565 ) ) ( ON ?auto_92565 ?auto_92567 ) ( not ( = ?auto_92560 ?auto_92567 ) ) ( not ( = ?auto_92561 ?auto_92567 ) ) ( not ( = ?auto_92562 ?auto_92567 ) ) ( not ( = ?auto_92563 ?auto_92567 ) ) ( not ( = ?auto_92564 ?auto_92567 ) ) ( not ( = ?auto_92565 ?auto_92567 ) ) ( ON ?auto_92564 ?auto_92565 ) ( ON-TABLE ?auto_92567 ) ( ON ?auto_92563 ?auto_92564 ) ( ON ?auto_92562 ?auto_92563 ) ( ON ?auto_92560 ?auto_92566 ) ( not ( = ?auto_92560 ?auto_92566 ) ) ( not ( = ?auto_92561 ?auto_92566 ) ) ( not ( = ?auto_92562 ?auto_92566 ) ) ( not ( = ?auto_92563 ?auto_92566 ) ) ( not ( = ?auto_92564 ?auto_92566 ) ) ( not ( = ?auto_92565 ?auto_92566 ) ) ( not ( = ?auto_92567 ?auto_92566 ) ) ( CLEAR ?auto_92562 ) ( ON ?auto_92561 ?auto_92560 ) ( CLEAR ?auto_92561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92566 ?auto_92560 )
      ( MAKE-6PILE ?auto_92560 ?auto_92561 ?auto_92562 ?auto_92563 ?auto_92564 ?auto_92565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92568 - BLOCK
      ?auto_92569 - BLOCK
      ?auto_92570 - BLOCK
      ?auto_92571 - BLOCK
      ?auto_92572 - BLOCK
      ?auto_92573 - BLOCK
    )
    :vars
    (
      ?auto_92575 - BLOCK
      ?auto_92574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92568 ?auto_92569 ) ) ( not ( = ?auto_92568 ?auto_92570 ) ) ( not ( = ?auto_92568 ?auto_92571 ) ) ( not ( = ?auto_92568 ?auto_92572 ) ) ( not ( = ?auto_92568 ?auto_92573 ) ) ( not ( = ?auto_92569 ?auto_92570 ) ) ( not ( = ?auto_92569 ?auto_92571 ) ) ( not ( = ?auto_92569 ?auto_92572 ) ) ( not ( = ?auto_92569 ?auto_92573 ) ) ( not ( = ?auto_92570 ?auto_92571 ) ) ( not ( = ?auto_92570 ?auto_92572 ) ) ( not ( = ?auto_92570 ?auto_92573 ) ) ( not ( = ?auto_92571 ?auto_92572 ) ) ( not ( = ?auto_92571 ?auto_92573 ) ) ( not ( = ?auto_92572 ?auto_92573 ) ) ( ON ?auto_92573 ?auto_92575 ) ( not ( = ?auto_92568 ?auto_92575 ) ) ( not ( = ?auto_92569 ?auto_92575 ) ) ( not ( = ?auto_92570 ?auto_92575 ) ) ( not ( = ?auto_92571 ?auto_92575 ) ) ( not ( = ?auto_92572 ?auto_92575 ) ) ( not ( = ?auto_92573 ?auto_92575 ) ) ( ON ?auto_92572 ?auto_92573 ) ( ON-TABLE ?auto_92575 ) ( ON ?auto_92571 ?auto_92572 ) ( ON ?auto_92568 ?auto_92574 ) ( not ( = ?auto_92568 ?auto_92574 ) ) ( not ( = ?auto_92569 ?auto_92574 ) ) ( not ( = ?auto_92570 ?auto_92574 ) ) ( not ( = ?auto_92571 ?auto_92574 ) ) ( not ( = ?auto_92572 ?auto_92574 ) ) ( not ( = ?auto_92573 ?auto_92574 ) ) ( not ( = ?auto_92575 ?auto_92574 ) ) ( ON ?auto_92569 ?auto_92568 ) ( CLEAR ?auto_92569 ) ( ON-TABLE ?auto_92574 ) ( HOLDING ?auto_92570 ) ( CLEAR ?auto_92571 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92575 ?auto_92573 ?auto_92572 ?auto_92571 ?auto_92570 )
      ( MAKE-6PILE ?auto_92568 ?auto_92569 ?auto_92570 ?auto_92571 ?auto_92572 ?auto_92573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92576 - BLOCK
      ?auto_92577 - BLOCK
      ?auto_92578 - BLOCK
      ?auto_92579 - BLOCK
      ?auto_92580 - BLOCK
      ?auto_92581 - BLOCK
    )
    :vars
    (
      ?auto_92583 - BLOCK
      ?auto_92582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92576 ?auto_92577 ) ) ( not ( = ?auto_92576 ?auto_92578 ) ) ( not ( = ?auto_92576 ?auto_92579 ) ) ( not ( = ?auto_92576 ?auto_92580 ) ) ( not ( = ?auto_92576 ?auto_92581 ) ) ( not ( = ?auto_92577 ?auto_92578 ) ) ( not ( = ?auto_92577 ?auto_92579 ) ) ( not ( = ?auto_92577 ?auto_92580 ) ) ( not ( = ?auto_92577 ?auto_92581 ) ) ( not ( = ?auto_92578 ?auto_92579 ) ) ( not ( = ?auto_92578 ?auto_92580 ) ) ( not ( = ?auto_92578 ?auto_92581 ) ) ( not ( = ?auto_92579 ?auto_92580 ) ) ( not ( = ?auto_92579 ?auto_92581 ) ) ( not ( = ?auto_92580 ?auto_92581 ) ) ( ON ?auto_92581 ?auto_92583 ) ( not ( = ?auto_92576 ?auto_92583 ) ) ( not ( = ?auto_92577 ?auto_92583 ) ) ( not ( = ?auto_92578 ?auto_92583 ) ) ( not ( = ?auto_92579 ?auto_92583 ) ) ( not ( = ?auto_92580 ?auto_92583 ) ) ( not ( = ?auto_92581 ?auto_92583 ) ) ( ON ?auto_92580 ?auto_92581 ) ( ON-TABLE ?auto_92583 ) ( ON ?auto_92579 ?auto_92580 ) ( ON ?auto_92576 ?auto_92582 ) ( not ( = ?auto_92576 ?auto_92582 ) ) ( not ( = ?auto_92577 ?auto_92582 ) ) ( not ( = ?auto_92578 ?auto_92582 ) ) ( not ( = ?auto_92579 ?auto_92582 ) ) ( not ( = ?auto_92580 ?auto_92582 ) ) ( not ( = ?auto_92581 ?auto_92582 ) ) ( not ( = ?auto_92583 ?auto_92582 ) ) ( ON ?auto_92577 ?auto_92576 ) ( ON-TABLE ?auto_92582 ) ( CLEAR ?auto_92579 ) ( ON ?auto_92578 ?auto_92577 ) ( CLEAR ?auto_92578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92582 ?auto_92576 ?auto_92577 )
      ( MAKE-6PILE ?auto_92576 ?auto_92577 ?auto_92578 ?auto_92579 ?auto_92580 ?auto_92581 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92584 - BLOCK
      ?auto_92585 - BLOCK
      ?auto_92586 - BLOCK
      ?auto_92587 - BLOCK
      ?auto_92588 - BLOCK
      ?auto_92589 - BLOCK
    )
    :vars
    (
      ?auto_92591 - BLOCK
      ?auto_92590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92584 ?auto_92585 ) ) ( not ( = ?auto_92584 ?auto_92586 ) ) ( not ( = ?auto_92584 ?auto_92587 ) ) ( not ( = ?auto_92584 ?auto_92588 ) ) ( not ( = ?auto_92584 ?auto_92589 ) ) ( not ( = ?auto_92585 ?auto_92586 ) ) ( not ( = ?auto_92585 ?auto_92587 ) ) ( not ( = ?auto_92585 ?auto_92588 ) ) ( not ( = ?auto_92585 ?auto_92589 ) ) ( not ( = ?auto_92586 ?auto_92587 ) ) ( not ( = ?auto_92586 ?auto_92588 ) ) ( not ( = ?auto_92586 ?auto_92589 ) ) ( not ( = ?auto_92587 ?auto_92588 ) ) ( not ( = ?auto_92587 ?auto_92589 ) ) ( not ( = ?auto_92588 ?auto_92589 ) ) ( ON ?auto_92589 ?auto_92591 ) ( not ( = ?auto_92584 ?auto_92591 ) ) ( not ( = ?auto_92585 ?auto_92591 ) ) ( not ( = ?auto_92586 ?auto_92591 ) ) ( not ( = ?auto_92587 ?auto_92591 ) ) ( not ( = ?auto_92588 ?auto_92591 ) ) ( not ( = ?auto_92589 ?auto_92591 ) ) ( ON ?auto_92588 ?auto_92589 ) ( ON-TABLE ?auto_92591 ) ( ON ?auto_92584 ?auto_92590 ) ( not ( = ?auto_92584 ?auto_92590 ) ) ( not ( = ?auto_92585 ?auto_92590 ) ) ( not ( = ?auto_92586 ?auto_92590 ) ) ( not ( = ?auto_92587 ?auto_92590 ) ) ( not ( = ?auto_92588 ?auto_92590 ) ) ( not ( = ?auto_92589 ?auto_92590 ) ) ( not ( = ?auto_92591 ?auto_92590 ) ) ( ON ?auto_92585 ?auto_92584 ) ( ON-TABLE ?auto_92590 ) ( ON ?auto_92586 ?auto_92585 ) ( CLEAR ?auto_92586 ) ( HOLDING ?auto_92587 ) ( CLEAR ?auto_92588 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92591 ?auto_92589 ?auto_92588 ?auto_92587 )
      ( MAKE-6PILE ?auto_92584 ?auto_92585 ?auto_92586 ?auto_92587 ?auto_92588 ?auto_92589 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92592 - BLOCK
      ?auto_92593 - BLOCK
      ?auto_92594 - BLOCK
      ?auto_92595 - BLOCK
      ?auto_92596 - BLOCK
      ?auto_92597 - BLOCK
    )
    :vars
    (
      ?auto_92598 - BLOCK
      ?auto_92599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92592 ?auto_92593 ) ) ( not ( = ?auto_92592 ?auto_92594 ) ) ( not ( = ?auto_92592 ?auto_92595 ) ) ( not ( = ?auto_92592 ?auto_92596 ) ) ( not ( = ?auto_92592 ?auto_92597 ) ) ( not ( = ?auto_92593 ?auto_92594 ) ) ( not ( = ?auto_92593 ?auto_92595 ) ) ( not ( = ?auto_92593 ?auto_92596 ) ) ( not ( = ?auto_92593 ?auto_92597 ) ) ( not ( = ?auto_92594 ?auto_92595 ) ) ( not ( = ?auto_92594 ?auto_92596 ) ) ( not ( = ?auto_92594 ?auto_92597 ) ) ( not ( = ?auto_92595 ?auto_92596 ) ) ( not ( = ?auto_92595 ?auto_92597 ) ) ( not ( = ?auto_92596 ?auto_92597 ) ) ( ON ?auto_92597 ?auto_92598 ) ( not ( = ?auto_92592 ?auto_92598 ) ) ( not ( = ?auto_92593 ?auto_92598 ) ) ( not ( = ?auto_92594 ?auto_92598 ) ) ( not ( = ?auto_92595 ?auto_92598 ) ) ( not ( = ?auto_92596 ?auto_92598 ) ) ( not ( = ?auto_92597 ?auto_92598 ) ) ( ON ?auto_92596 ?auto_92597 ) ( ON-TABLE ?auto_92598 ) ( ON ?auto_92592 ?auto_92599 ) ( not ( = ?auto_92592 ?auto_92599 ) ) ( not ( = ?auto_92593 ?auto_92599 ) ) ( not ( = ?auto_92594 ?auto_92599 ) ) ( not ( = ?auto_92595 ?auto_92599 ) ) ( not ( = ?auto_92596 ?auto_92599 ) ) ( not ( = ?auto_92597 ?auto_92599 ) ) ( not ( = ?auto_92598 ?auto_92599 ) ) ( ON ?auto_92593 ?auto_92592 ) ( ON-TABLE ?auto_92599 ) ( ON ?auto_92594 ?auto_92593 ) ( CLEAR ?auto_92596 ) ( ON ?auto_92595 ?auto_92594 ) ( CLEAR ?auto_92595 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92599 ?auto_92592 ?auto_92593 ?auto_92594 )
      ( MAKE-6PILE ?auto_92592 ?auto_92593 ?auto_92594 ?auto_92595 ?auto_92596 ?auto_92597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92600 - BLOCK
      ?auto_92601 - BLOCK
      ?auto_92602 - BLOCK
      ?auto_92603 - BLOCK
      ?auto_92604 - BLOCK
      ?auto_92605 - BLOCK
    )
    :vars
    (
      ?auto_92606 - BLOCK
      ?auto_92607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92600 ?auto_92601 ) ) ( not ( = ?auto_92600 ?auto_92602 ) ) ( not ( = ?auto_92600 ?auto_92603 ) ) ( not ( = ?auto_92600 ?auto_92604 ) ) ( not ( = ?auto_92600 ?auto_92605 ) ) ( not ( = ?auto_92601 ?auto_92602 ) ) ( not ( = ?auto_92601 ?auto_92603 ) ) ( not ( = ?auto_92601 ?auto_92604 ) ) ( not ( = ?auto_92601 ?auto_92605 ) ) ( not ( = ?auto_92602 ?auto_92603 ) ) ( not ( = ?auto_92602 ?auto_92604 ) ) ( not ( = ?auto_92602 ?auto_92605 ) ) ( not ( = ?auto_92603 ?auto_92604 ) ) ( not ( = ?auto_92603 ?auto_92605 ) ) ( not ( = ?auto_92604 ?auto_92605 ) ) ( ON ?auto_92605 ?auto_92606 ) ( not ( = ?auto_92600 ?auto_92606 ) ) ( not ( = ?auto_92601 ?auto_92606 ) ) ( not ( = ?auto_92602 ?auto_92606 ) ) ( not ( = ?auto_92603 ?auto_92606 ) ) ( not ( = ?auto_92604 ?auto_92606 ) ) ( not ( = ?auto_92605 ?auto_92606 ) ) ( ON-TABLE ?auto_92606 ) ( ON ?auto_92600 ?auto_92607 ) ( not ( = ?auto_92600 ?auto_92607 ) ) ( not ( = ?auto_92601 ?auto_92607 ) ) ( not ( = ?auto_92602 ?auto_92607 ) ) ( not ( = ?auto_92603 ?auto_92607 ) ) ( not ( = ?auto_92604 ?auto_92607 ) ) ( not ( = ?auto_92605 ?auto_92607 ) ) ( not ( = ?auto_92606 ?auto_92607 ) ) ( ON ?auto_92601 ?auto_92600 ) ( ON-TABLE ?auto_92607 ) ( ON ?auto_92602 ?auto_92601 ) ( ON ?auto_92603 ?auto_92602 ) ( CLEAR ?auto_92603 ) ( HOLDING ?auto_92604 ) ( CLEAR ?auto_92605 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92606 ?auto_92605 ?auto_92604 )
      ( MAKE-6PILE ?auto_92600 ?auto_92601 ?auto_92602 ?auto_92603 ?auto_92604 ?auto_92605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92608 - BLOCK
      ?auto_92609 - BLOCK
      ?auto_92610 - BLOCK
      ?auto_92611 - BLOCK
      ?auto_92612 - BLOCK
      ?auto_92613 - BLOCK
    )
    :vars
    (
      ?auto_92615 - BLOCK
      ?auto_92614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92608 ?auto_92609 ) ) ( not ( = ?auto_92608 ?auto_92610 ) ) ( not ( = ?auto_92608 ?auto_92611 ) ) ( not ( = ?auto_92608 ?auto_92612 ) ) ( not ( = ?auto_92608 ?auto_92613 ) ) ( not ( = ?auto_92609 ?auto_92610 ) ) ( not ( = ?auto_92609 ?auto_92611 ) ) ( not ( = ?auto_92609 ?auto_92612 ) ) ( not ( = ?auto_92609 ?auto_92613 ) ) ( not ( = ?auto_92610 ?auto_92611 ) ) ( not ( = ?auto_92610 ?auto_92612 ) ) ( not ( = ?auto_92610 ?auto_92613 ) ) ( not ( = ?auto_92611 ?auto_92612 ) ) ( not ( = ?auto_92611 ?auto_92613 ) ) ( not ( = ?auto_92612 ?auto_92613 ) ) ( ON ?auto_92613 ?auto_92615 ) ( not ( = ?auto_92608 ?auto_92615 ) ) ( not ( = ?auto_92609 ?auto_92615 ) ) ( not ( = ?auto_92610 ?auto_92615 ) ) ( not ( = ?auto_92611 ?auto_92615 ) ) ( not ( = ?auto_92612 ?auto_92615 ) ) ( not ( = ?auto_92613 ?auto_92615 ) ) ( ON-TABLE ?auto_92615 ) ( ON ?auto_92608 ?auto_92614 ) ( not ( = ?auto_92608 ?auto_92614 ) ) ( not ( = ?auto_92609 ?auto_92614 ) ) ( not ( = ?auto_92610 ?auto_92614 ) ) ( not ( = ?auto_92611 ?auto_92614 ) ) ( not ( = ?auto_92612 ?auto_92614 ) ) ( not ( = ?auto_92613 ?auto_92614 ) ) ( not ( = ?auto_92615 ?auto_92614 ) ) ( ON ?auto_92609 ?auto_92608 ) ( ON-TABLE ?auto_92614 ) ( ON ?auto_92610 ?auto_92609 ) ( ON ?auto_92611 ?auto_92610 ) ( CLEAR ?auto_92613 ) ( ON ?auto_92612 ?auto_92611 ) ( CLEAR ?auto_92612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92614 ?auto_92608 ?auto_92609 ?auto_92610 ?auto_92611 )
      ( MAKE-6PILE ?auto_92608 ?auto_92609 ?auto_92610 ?auto_92611 ?auto_92612 ?auto_92613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92616 - BLOCK
      ?auto_92617 - BLOCK
      ?auto_92618 - BLOCK
      ?auto_92619 - BLOCK
      ?auto_92620 - BLOCK
      ?auto_92621 - BLOCK
    )
    :vars
    (
      ?auto_92622 - BLOCK
      ?auto_92623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92616 ?auto_92617 ) ) ( not ( = ?auto_92616 ?auto_92618 ) ) ( not ( = ?auto_92616 ?auto_92619 ) ) ( not ( = ?auto_92616 ?auto_92620 ) ) ( not ( = ?auto_92616 ?auto_92621 ) ) ( not ( = ?auto_92617 ?auto_92618 ) ) ( not ( = ?auto_92617 ?auto_92619 ) ) ( not ( = ?auto_92617 ?auto_92620 ) ) ( not ( = ?auto_92617 ?auto_92621 ) ) ( not ( = ?auto_92618 ?auto_92619 ) ) ( not ( = ?auto_92618 ?auto_92620 ) ) ( not ( = ?auto_92618 ?auto_92621 ) ) ( not ( = ?auto_92619 ?auto_92620 ) ) ( not ( = ?auto_92619 ?auto_92621 ) ) ( not ( = ?auto_92620 ?auto_92621 ) ) ( not ( = ?auto_92616 ?auto_92622 ) ) ( not ( = ?auto_92617 ?auto_92622 ) ) ( not ( = ?auto_92618 ?auto_92622 ) ) ( not ( = ?auto_92619 ?auto_92622 ) ) ( not ( = ?auto_92620 ?auto_92622 ) ) ( not ( = ?auto_92621 ?auto_92622 ) ) ( ON-TABLE ?auto_92622 ) ( ON ?auto_92616 ?auto_92623 ) ( not ( = ?auto_92616 ?auto_92623 ) ) ( not ( = ?auto_92617 ?auto_92623 ) ) ( not ( = ?auto_92618 ?auto_92623 ) ) ( not ( = ?auto_92619 ?auto_92623 ) ) ( not ( = ?auto_92620 ?auto_92623 ) ) ( not ( = ?auto_92621 ?auto_92623 ) ) ( not ( = ?auto_92622 ?auto_92623 ) ) ( ON ?auto_92617 ?auto_92616 ) ( ON-TABLE ?auto_92623 ) ( ON ?auto_92618 ?auto_92617 ) ( ON ?auto_92619 ?auto_92618 ) ( ON ?auto_92620 ?auto_92619 ) ( CLEAR ?auto_92620 ) ( HOLDING ?auto_92621 ) ( CLEAR ?auto_92622 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92622 ?auto_92621 )
      ( MAKE-6PILE ?auto_92616 ?auto_92617 ?auto_92618 ?auto_92619 ?auto_92620 ?auto_92621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92624 - BLOCK
      ?auto_92625 - BLOCK
      ?auto_92626 - BLOCK
      ?auto_92627 - BLOCK
      ?auto_92628 - BLOCK
      ?auto_92629 - BLOCK
    )
    :vars
    (
      ?auto_92630 - BLOCK
      ?auto_92631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92624 ?auto_92625 ) ) ( not ( = ?auto_92624 ?auto_92626 ) ) ( not ( = ?auto_92624 ?auto_92627 ) ) ( not ( = ?auto_92624 ?auto_92628 ) ) ( not ( = ?auto_92624 ?auto_92629 ) ) ( not ( = ?auto_92625 ?auto_92626 ) ) ( not ( = ?auto_92625 ?auto_92627 ) ) ( not ( = ?auto_92625 ?auto_92628 ) ) ( not ( = ?auto_92625 ?auto_92629 ) ) ( not ( = ?auto_92626 ?auto_92627 ) ) ( not ( = ?auto_92626 ?auto_92628 ) ) ( not ( = ?auto_92626 ?auto_92629 ) ) ( not ( = ?auto_92627 ?auto_92628 ) ) ( not ( = ?auto_92627 ?auto_92629 ) ) ( not ( = ?auto_92628 ?auto_92629 ) ) ( not ( = ?auto_92624 ?auto_92630 ) ) ( not ( = ?auto_92625 ?auto_92630 ) ) ( not ( = ?auto_92626 ?auto_92630 ) ) ( not ( = ?auto_92627 ?auto_92630 ) ) ( not ( = ?auto_92628 ?auto_92630 ) ) ( not ( = ?auto_92629 ?auto_92630 ) ) ( ON-TABLE ?auto_92630 ) ( ON ?auto_92624 ?auto_92631 ) ( not ( = ?auto_92624 ?auto_92631 ) ) ( not ( = ?auto_92625 ?auto_92631 ) ) ( not ( = ?auto_92626 ?auto_92631 ) ) ( not ( = ?auto_92627 ?auto_92631 ) ) ( not ( = ?auto_92628 ?auto_92631 ) ) ( not ( = ?auto_92629 ?auto_92631 ) ) ( not ( = ?auto_92630 ?auto_92631 ) ) ( ON ?auto_92625 ?auto_92624 ) ( ON-TABLE ?auto_92631 ) ( ON ?auto_92626 ?auto_92625 ) ( ON ?auto_92627 ?auto_92626 ) ( ON ?auto_92628 ?auto_92627 ) ( CLEAR ?auto_92630 ) ( ON ?auto_92629 ?auto_92628 ) ( CLEAR ?auto_92629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92631 ?auto_92624 ?auto_92625 ?auto_92626 ?auto_92627 ?auto_92628 )
      ( MAKE-6PILE ?auto_92624 ?auto_92625 ?auto_92626 ?auto_92627 ?auto_92628 ?auto_92629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92632 - BLOCK
      ?auto_92633 - BLOCK
      ?auto_92634 - BLOCK
      ?auto_92635 - BLOCK
      ?auto_92636 - BLOCK
      ?auto_92637 - BLOCK
    )
    :vars
    (
      ?auto_92638 - BLOCK
      ?auto_92639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92632 ?auto_92633 ) ) ( not ( = ?auto_92632 ?auto_92634 ) ) ( not ( = ?auto_92632 ?auto_92635 ) ) ( not ( = ?auto_92632 ?auto_92636 ) ) ( not ( = ?auto_92632 ?auto_92637 ) ) ( not ( = ?auto_92633 ?auto_92634 ) ) ( not ( = ?auto_92633 ?auto_92635 ) ) ( not ( = ?auto_92633 ?auto_92636 ) ) ( not ( = ?auto_92633 ?auto_92637 ) ) ( not ( = ?auto_92634 ?auto_92635 ) ) ( not ( = ?auto_92634 ?auto_92636 ) ) ( not ( = ?auto_92634 ?auto_92637 ) ) ( not ( = ?auto_92635 ?auto_92636 ) ) ( not ( = ?auto_92635 ?auto_92637 ) ) ( not ( = ?auto_92636 ?auto_92637 ) ) ( not ( = ?auto_92632 ?auto_92638 ) ) ( not ( = ?auto_92633 ?auto_92638 ) ) ( not ( = ?auto_92634 ?auto_92638 ) ) ( not ( = ?auto_92635 ?auto_92638 ) ) ( not ( = ?auto_92636 ?auto_92638 ) ) ( not ( = ?auto_92637 ?auto_92638 ) ) ( ON ?auto_92632 ?auto_92639 ) ( not ( = ?auto_92632 ?auto_92639 ) ) ( not ( = ?auto_92633 ?auto_92639 ) ) ( not ( = ?auto_92634 ?auto_92639 ) ) ( not ( = ?auto_92635 ?auto_92639 ) ) ( not ( = ?auto_92636 ?auto_92639 ) ) ( not ( = ?auto_92637 ?auto_92639 ) ) ( not ( = ?auto_92638 ?auto_92639 ) ) ( ON ?auto_92633 ?auto_92632 ) ( ON-TABLE ?auto_92639 ) ( ON ?auto_92634 ?auto_92633 ) ( ON ?auto_92635 ?auto_92634 ) ( ON ?auto_92636 ?auto_92635 ) ( ON ?auto_92637 ?auto_92636 ) ( CLEAR ?auto_92637 ) ( HOLDING ?auto_92638 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92638 )
      ( MAKE-6PILE ?auto_92632 ?auto_92633 ?auto_92634 ?auto_92635 ?auto_92636 ?auto_92637 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92640 - BLOCK
      ?auto_92641 - BLOCK
      ?auto_92642 - BLOCK
      ?auto_92643 - BLOCK
      ?auto_92644 - BLOCK
      ?auto_92645 - BLOCK
    )
    :vars
    (
      ?auto_92646 - BLOCK
      ?auto_92647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92640 ?auto_92641 ) ) ( not ( = ?auto_92640 ?auto_92642 ) ) ( not ( = ?auto_92640 ?auto_92643 ) ) ( not ( = ?auto_92640 ?auto_92644 ) ) ( not ( = ?auto_92640 ?auto_92645 ) ) ( not ( = ?auto_92641 ?auto_92642 ) ) ( not ( = ?auto_92641 ?auto_92643 ) ) ( not ( = ?auto_92641 ?auto_92644 ) ) ( not ( = ?auto_92641 ?auto_92645 ) ) ( not ( = ?auto_92642 ?auto_92643 ) ) ( not ( = ?auto_92642 ?auto_92644 ) ) ( not ( = ?auto_92642 ?auto_92645 ) ) ( not ( = ?auto_92643 ?auto_92644 ) ) ( not ( = ?auto_92643 ?auto_92645 ) ) ( not ( = ?auto_92644 ?auto_92645 ) ) ( not ( = ?auto_92640 ?auto_92646 ) ) ( not ( = ?auto_92641 ?auto_92646 ) ) ( not ( = ?auto_92642 ?auto_92646 ) ) ( not ( = ?auto_92643 ?auto_92646 ) ) ( not ( = ?auto_92644 ?auto_92646 ) ) ( not ( = ?auto_92645 ?auto_92646 ) ) ( ON ?auto_92640 ?auto_92647 ) ( not ( = ?auto_92640 ?auto_92647 ) ) ( not ( = ?auto_92641 ?auto_92647 ) ) ( not ( = ?auto_92642 ?auto_92647 ) ) ( not ( = ?auto_92643 ?auto_92647 ) ) ( not ( = ?auto_92644 ?auto_92647 ) ) ( not ( = ?auto_92645 ?auto_92647 ) ) ( not ( = ?auto_92646 ?auto_92647 ) ) ( ON ?auto_92641 ?auto_92640 ) ( ON-TABLE ?auto_92647 ) ( ON ?auto_92642 ?auto_92641 ) ( ON ?auto_92643 ?auto_92642 ) ( ON ?auto_92644 ?auto_92643 ) ( ON ?auto_92645 ?auto_92644 ) ( ON ?auto_92646 ?auto_92645 ) ( CLEAR ?auto_92646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92647 ?auto_92640 ?auto_92641 ?auto_92642 ?auto_92643 ?auto_92644 ?auto_92645 )
      ( MAKE-6PILE ?auto_92640 ?auto_92641 ?auto_92642 ?auto_92643 ?auto_92644 ?auto_92645 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92655 - BLOCK
      ?auto_92656 - BLOCK
      ?auto_92657 - BLOCK
      ?auto_92658 - BLOCK
      ?auto_92659 - BLOCK
      ?auto_92660 - BLOCK
      ?auto_92661 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92661 ) ( CLEAR ?auto_92660 ) ( ON-TABLE ?auto_92655 ) ( ON ?auto_92656 ?auto_92655 ) ( ON ?auto_92657 ?auto_92656 ) ( ON ?auto_92658 ?auto_92657 ) ( ON ?auto_92659 ?auto_92658 ) ( ON ?auto_92660 ?auto_92659 ) ( not ( = ?auto_92655 ?auto_92656 ) ) ( not ( = ?auto_92655 ?auto_92657 ) ) ( not ( = ?auto_92655 ?auto_92658 ) ) ( not ( = ?auto_92655 ?auto_92659 ) ) ( not ( = ?auto_92655 ?auto_92660 ) ) ( not ( = ?auto_92655 ?auto_92661 ) ) ( not ( = ?auto_92656 ?auto_92657 ) ) ( not ( = ?auto_92656 ?auto_92658 ) ) ( not ( = ?auto_92656 ?auto_92659 ) ) ( not ( = ?auto_92656 ?auto_92660 ) ) ( not ( = ?auto_92656 ?auto_92661 ) ) ( not ( = ?auto_92657 ?auto_92658 ) ) ( not ( = ?auto_92657 ?auto_92659 ) ) ( not ( = ?auto_92657 ?auto_92660 ) ) ( not ( = ?auto_92657 ?auto_92661 ) ) ( not ( = ?auto_92658 ?auto_92659 ) ) ( not ( = ?auto_92658 ?auto_92660 ) ) ( not ( = ?auto_92658 ?auto_92661 ) ) ( not ( = ?auto_92659 ?auto_92660 ) ) ( not ( = ?auto_92659 ?auto_92661 ) ) ( not ( = ?auto_92660 ?auto_92661 ) ) )
    :subtasks
    ( ( !STACK ?auto_92661 ?auto_92660 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92662 - BLOCK
      ?auto_92663 - BLOCK
      ?auto_92664 - BLOCK
      ?auto_92665 - BLOCK
      ?auto_92666 - BLOCK
      ?auto_92667 - BLOCK
      ?auto_92668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92667 ) ( ON-TABLE ?auto_92662 ) ( ON ?auto_92663 ?auto_92662 ) ( ON ?auto_92664 ?auto_92663 ) ( ON ?auto_92665 ?auto_92664 ) ( ON ?auto_92666 ?auto_92665 ) ( ON ?auto_92667 ?auto_92666 ) ( not ( = ?auto_92662 ?auto_92663 ) ) ( not ( = ?auto_92662 ?auto_92664 ) ) ( not ( = ?auto_92662 ?auto_92665 ) ) ( not ( = ?auto_92662 ?auto_92666 ) ) ( not ( = ?auto_92662 ?auto_92667 ) ) ( not ( = ?auto_92662 ?auto_92668 ) ) ( not ( = ?auto_92663 ?auto_92664 ) ) ( not ( = ?auto_92663 ?auto_92665 ) ) ( not ( = ?auto_92663 ?auto_92666 ) ) ( not ( = ?auto_92663 ?auto_92667 ) ) ( not ( = ?auto_92663 ?auto_92668 ) ) ( not ( = ?auto_92664 ?auto_92665 ) ) ( not ( = ?auto_92664 ?auto_92666 ) ) ( not ( = ?auto_92664 ?auto_92667 ) ) ( not ( = ?auto_92664 ?auto_92668 ) ) ( not ( = ?auto_92665 ?auto_92666 ) ) ( not ( = ?auto_92665 ?auto_92667 ) ) ( not ( = ?auto_92665 ?auto_92668 ) ) ( not ( = ?auto_92666 ?auto_92667 ) ) ( not ( = ?auto_92666 ?auto_92668 ) ) ( not ( = ?auto_92667 ?auto_92668 ) ) ( ON-TABLE ?auto_92668 ) ( CLEAR ?auto_92668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_92668 )
      ( MAKE-7PILE ?auto_92662 ?auto_92663 ?auto_92664 ?auto_92665 ?auto_92666 ?auto_92667 ?auto_92668 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92669 - BLOCK
      ?auto_92670 - BLOCK
      ?auto_92671 - BLOCK
      ?auto_92672 - BLOCK
      ?auto_92673 - BLOCK
      ?auto_92674 - BLOCK
      ?auto_92675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92669 ) ( ON ?auto_92670 ?auto_92669 ) ( ON ?auto_92671 ?auto_92670 ) ( ON ?auto_92672 ?auto_92671 ) ( ON ?auto_92673 ?auto_92672 ) ( not ( = ?auto_92669 ?auto_92670 ) ) ( not ( = ?auto_92669 ?auto_92671 ) ) ( not ( = ?auto_92669 ?auto_92672 ) ) ( not ( = ?auto_92669 ?auto_92673 ) ) ( not ( = ?auto_92669 ?auto_92674 ) ) ( not ( = ?auto_92669 ?auto_92675 ) ) ( not ( = ?auto_92670 ?auto_92671 ) ) ( not ( = ?auto_92670 ?auto_92672 ) ) ( not ( = ?auto_92670 ?auto_92673 ) ) ( not ( = ?auto_92670 ?auto_92674 ) ) ( not ( = ?auto_92670 ?auto_92675 ) ) ( not ( = ?auto_92671 ?auto_92672 ) ) ( not ( = ?auto_92671 ?auto_92673 ) ) ( not ( = ?auto_92671 ?auto_92674 ) ) ( not ( = ?auto_92671 ?auto_92675 ) ) ( not ( = ?auto_92672 ?auto_92673 ) ) ( not ( = ?auto_92672 ?auto_92674 ) ) ( not ( = ?auto_92672 ?auto_92675 ) ) ( not ( = ?auto_92673 ?auto_92674 ) ) ( not ( = ?auto_92673 ?auto_92675 ) ) ( not ( = ?auto_92674 ?auto_92675 ) ) ( ON-TABLE ?auto_92675 ) ( CLEAR ?auto_92675 ) ( HOLDING ?auto_92674 ) ( CLEAR ?auto_92673 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92669 ?auto_92670 ?auto_92671 ?auto_92672 ?auto_92673 ?auto_92674 )
      ( MAKE-7PILE ?auto_92669 ?auto_92670 ?auto_92671 ?auto_92672 ?auto_92673 ?auto_92674 ?auto_92675 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92676 - BLOCK
      ?auto_92677 - BLOCK
      ?auto_92678 - BLOCK
      ?auto_92679 - BLOCK
      ?auto_92680 - BLOCK
      ?auto_92681 - BLOCK
      ?auto_92682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92676 ) ( ON ?auto_92677 ?auto_92676 ) ( ON ?auto_92678 ?auto_92677 ) ( ON ?auto_92679 ?auto_92678 ) ( ON ?auto_92680 ?auto_92679 ) ( not ( = ?auto_92676 ?auto_92677 ) ) ( not ( = ?auto_92676 ?auto_92678 ) ) ( not ( = ?auto_92676 ?auto_92679 ) ) ( not ( = ?auto_92676 ?auto_92680 ) ) ( not ( = ?auto_92676 ?auto_92681 ) ) ( not ( = ?auto_92676 ?auto_92682 ) ) ( not ( = ?auto_92677 ?auto_92678 ) ) ( not ( = ?auto_92677 ?auto_92679 ) ) ( not ( = ?auto_92677 ?auto_92680 ) ) ( not ( = ?auto_92677 ?auto_92681 ) ) ( not ( = ?auto_92677 ?auto_92682 ) ) ( not ( = ?auto_92678 ?auto_92679 ) ) ( not ( = ?auto_92678 ?auto_92680 ) ) ( not ( = ?auto_92678 ?auto_92681 ) ) ( not ( = ?auto_92678 ?auto_92682 ) ) ( not ( = ?auto_92679 ?auto_92680 ) ) ( not ( = ?auto_92679 ?auto_92681 ) ) ( not ( = ?auto_92679 ?auto_92682 ) ) ( not ( = ?auto_92680 ?auto_92681 ) ) ( not ( = ?auto_92680 ?auto_92682 ) ) ( not ( = ?auto_92681 ?auto_92682 ) ) ( ON-TABLE ?auto_92682 ) ( CLEAR ?auto_92680 ) ( ON ?auto_92681 ?auto_92682 ) ( CLEAR ?auto_92681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92682 )
      ( MAKE-7PILE ?auto_92676 ?auto_92677 ?auto_92678 ?auto_92679 ?auto_92680 ?auto_92681 ?auto_92682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92683 - BLOCK
      ?auto_92684 - BLOCK
      ?auto_92685 - BLOCK
      ?auto_92686 - BLOCK
      ?auto_92687 - BLOCK
      ?auto_92688 - BLOCK
      ?auto_92689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92683 ) ( ON ?auto_92684 ?auto_92683 ) ( ON ?auto_92685 ?auto_92684 ) ( ON ?auto_92686 ?auto_92685 ) ( not ( = ?auto_92683 ?auto_92684 ) ) ( not ( = ?auto_92683 ?auto_92685 ) ) ( not ( = ?auto_92683 ?auto_92686 ) ) ( not ( = ?auto_92683 ?auto_92687 ) ) ( not ( = ?auto_92683 ?auto_92688 ) ) ( not ( = ?auto_92683 ?auto_92689 ) ) ( not ( = ?auto_92684 ?auto_92685 ) ) ( not ( = ?auto_92684 ?auto_92686 ) ) ( not ( = ?auto_92684 ?auto_92687 ) ) ( not ( = ?auto_92684 ?auto_92688 ) ) ( not ( = ?auto_92684 ?auto_92689 ) ) ( not ( = ?auto_92685 ?auto_92686 ) ) ( not ( = ?auto_92685 ?auto_92687 ) ) ( not ( = ?auto_92685 ?auto_92688 ) ) ( not ( = ?auto_92685 ?auto_92689 ) ) ( not ( = ?auto_92686 ?auto_92687 ) ) ( not ( = ?auto_92686 ?auto_92688 ) ) ( not ( = ?auto_92686 ?auto_92689 ) ) ( not ( = ?auto_92687 ?auto_92688 ) ) ( not ( = ?auto_92687 ?auto_92689 ) ) ( not ( = ?auto_92688 ?auto_92689 ) ) ( ON-TABLE ?auto_92689 ) ( ON ?auto_92688 ?auto_92689 ) ( CLEAR ?auto_92688 ) ( HOLDING ?auto_92687 ) ( CLEAR ?auto_92686 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92683 ?auto_92684 ?auto_92685 ?auto_92686 ?auto_92687 )
      ( MAKE-7PILE ?auto_92683 ?auto_92684 ?auto_92685 ?auto_92686 ?auto_92687 ?auto_92688 ?auto_92689 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92690 - BLOCK
      ?auto_92691 - BLOCK
      ?auto_92692 - BLOCK
      ?auto_92693 - BLOCK
      ?auto_92694 - BLOCK
      ?auto_92695 - BLOCK
      ?auto_92696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92690 ) ( ON ?auto_92691 ?auto_92690 ) ( ON ?auto_92692 ?auto_92691 ) ( ON ?auto_92693 ?auto_92692 ) ( not ( = ?auto_92690 ?auto_92691 ) ) ( not ( = ?auto_92690 ?auto_92692 ) ) ( not ( = ?auto_92690 ?auto_92693 ) ) ( not ( = ?auto_92690 ?auto_92694 ) ) ( not ( = ?auto_92690 ?auto_92695 ) ) ( not ( = ?auto_92690 ?auto_92696 ) ) ( not ( = ?auto_92691 ?auto_92692 ) ) ( not ( = ?auto_92691 ?auto_92693 ) ) ( not ( = ?auto_92691 ?auto_92694 ) ) ( not ( = ?auto_92691 ?auto_92695 ) ) ( not ( = ?auto_92691 ?auto_92696 ) ) ( not ( = ?auto_92692 ?auto_92693 ) ) ( not ( = ?auto_92692 ?auto_92694 ) ) ( not ( = ?auto_92692 ?auto_92695 ) ) ( not ( = ?auto_92692 ?auto_92696 ) ) ( not ( = ?auto_92693 ?auto_92694 ) ) ( not ( = ?auto_92693 ?auto_92695 ) ) ( not ( = ?auto_92693 ?auto_92696 ) ) ( not ( = ?auto_92694 ?auto_92695 ) ) ( not ( = ?auto_92694 ?auto_92696 ) ) ( not ( = ?auto_92695 ?auto_92696 ) ) ( ON-TABLE ?auto_92696 ) ( ON ?auto_92695 ?auto_92696 ) ( CLEAR ?auto_92693 ) ( ON ?auto_92694 ?auto_92695 ) ( CLEAR ?auto_92694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92696 ?auto_92695 )
      ( MAKE-7PILE ?auto_92690 ?auto_92691 ?auto_92692 ?auto_92693 ?auto_92694 ?auto_92695 ?auto_92696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92697 - BLOCK
      ?auto_92698 - BLOCK
      ?auto_92699 - BLOCK
      ?auto_92700 - BLOCK
      ?auto_92701 - BLOCK
      ?auto_92702 - BLOCK
      ?auto_92703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92697 ) ( ON ?auto_92698 ?auto_92697 ) ( ON ?auto_92699 ?auto_92698 ) ( not ( = ?auto_92697 ?auto_92698 ) ) ( not ( = ?auto_92697 ?auto_92699 ) ) ( not ( = ?auto_92697 ?auto_92700 ) ) ( not ( = ?auto_92697 ?auto_92701 ) ) ( not ( = ?auto_92697 ?auto_92702 ) ) ( not ( = ?auto_92697 ?auto_92703 ) ) ( not ( = ?auto_92698 ?auto_92699 ) ) ( not ( = ?auto_92698 ?auto_92700 ) ) ( not ( = ?auto_92698 ?auto_92701 ) ) ( not ( = ?auto_92698 ?auto_92702 ) ) ( not ( = ?auto_92698 ?auto_92703 ) ) ( not ( = ?auto_92699 ?auto_92700 ) ) ( not ( = ?auto_92699 ?auto_92701 ) ) ( not ( = ?auto_92699 ?auto_92702 ) ) ( not ( = ?auto_92699 ?auto_92703 ) ) ( not ( = ?auto_92700 ?auto_92701 ) ) ( not ( = ?auto_92700 ?auto_92702 ) ) ( not ( = ?auto_92700 ?auto_92703 ) ) ( not ( = ?auto_92701 ?auto_92702 ) ) ( not ( = ?auto_92701 ?auto_92703 ) ) ( not ( = ?auto_92702 ?auto_92703 ) ) ( ON-TABLE ?auto_92703 ) ( ON ?auto_92702 ?auto_92703 ) ( ON ?auto_92701 ?auto_92702 ) ( CLEAR ?auto_92701 ) ( HOLDING ?auto_92700 ) ( CLEAR ?auto_92699 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92697 ?auto_92698 ?auto_92699 ?auto_92700 )
      ( MAKE-7PILE ?auto_92697 ?auto_92698 ?auto_92699 ?auto_92700 ?auto_92701 ?auto_92702 ?auto_92703 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92704 - BLOCK
      ?auto_92705 - BLOCK
      ?auto_92706 - BLOCK
      ?auto_92707 - BLOCK
      ?auto_92708 - BLOCK
      ?auto_92709 - BLOCK
      ?auto_92710 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92704 ) ( ON ?auto_92705 ?auto_92704 ) ( ON ?auto_92706 ?auto_92705 ) ( not ( = ?auto_92704 ?auto_92705 ) ) ( not ( = ?auto_92704 ?auto_92706 ) ) ( not ( = ?auto_92704 ?auto_92707 ) ) ( not ( = ?auto_92704 ?auto_92708 ) ) ( not ( = ?auto_92704 ?auto_92709 ) ) ( not ( = ?auto_92704 ?auto_92710 ) ) ( not ( = ?auto_92705 ?auto_92706 ) ) ( not ( = ?auto_92705 ?auto_92707 ) ) ( not ( = ?auto_92705 ?auto_92708 ) ) ( not ( = ?auto_92705 ?auto_92709 ) ) ( not ( = ?auto_92705 ?auto_92710 ) ) ( not ( = ?auto_92706 ?auto_92707 ) ) ( not ( = ?auto_92706 ?auto_92708 ) ) ( not ( = ?auto_92706 ?auto_92709 ) ) ( not ( = ?auto_92706 ?auto_92710 ) ) ( not ( = ?auto_92707 ?auto_92708 ) ) ( not ( = ?auto_92707 ?auto_92709 ) ) ( not ( = ?auto_92707 ?auto_92710 ) ) ( not ( = ?auto_92708 ?auto_92709 ) ) ( not ( = ?auto_92708 ?auto_92710 ) ) ( not ( = ?auto_92709 ?auto_92710 ) ) ( ON-TABLE ?auto_92710 ) ( ON ?auto_92709 ?auto_92710 ) ( ON ?auto_92708 ?auto_92709 ) ( CLEAR ?auto_92706 ) ( ON ?auto_92707 ?auto_92708 ) ( CLEAR ?auto_92707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92710 ?auto_92709 ?auto_92708 )
      ( MAKE-7PILE ?auto_92704 ?auto_92705 ?auto_92706 ?auto_92707 ?auto_92708 ?auto_92709 ?auto_92710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92711 - BLOCK
      ?auto_92712 - BLOCK
      ?auto_92713 - BLOCK
      ?auto_92714 - BLOCK
      ?auto_92715 - BLOCK
      ?auto_92716 - BLOCK
      ?auto_92717 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92711 ) ( ON ?auto_92712 ?auto_92711 ) ( not ( = ?auto_92711 ?auto_92712 ) ) ( not ( = ?auto_92711 ?auto_92713 ) ) ( not ( = ?auto_92711 ?auto_92714 ) ) ( not ( = ?auto_92711 ?auto_92715 ) ) ( not ( = ?auto_92711 ?auto_92716 ) ) ( not ( = ?auto_92711 ?auto_92717 ) ) ( not ( = ?auto_92712 ?auto_92713 ) ) ( not ( = ?auto_92712 ?auto_92714 ) ) ( not ( = ?auto_92712 ?auto_92715 ) ) ( not ( = ?auto_92712 ?auto_92716 ) ) ( not ( = ?auto_92712 ?auto_92717 ) ) ( not ( = ?auto_92713 ?auto_92714 ) ) ( not ( = ?auto_92713 ?auto_92715 ) ) ( not ( = ?auto_92713 ?auto_92716 ) ) ( not ( = ?auto_92713 ?auto_92717 ) ) ( not ( = ?auto_92714 ?auto_92715 ) ) ( not ( = ?auto_92714 ?auto_92716 ) ) ( not ( = ?auto_92714 ?auto_92717 ) ) ( not ( = ?auto_92715 ?auto_92716 ) ) ( not ( = ?auto_92715 ?auto_92717 ) ) ( not ( = ?auto_92716 ?auto_92717 ) ) ( ON-TABLE ?auto_92717 ) ( ON ?auto_92716 ?auto_92717 ) ( ON ?auto_92715 ?auto_92716 ) ( ON ?auto_92714 ?auto_92715 ) ( CLEAR ?auto_92714 ) ( HOLDING ?auto_92713 ) ( CLEAR ?auto_92712 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92711 ?auto_92712 ?auto_92713 )
      ( MAKE-7PILE ?auto_92711 ?auto_92712 ?auto_92713 ?auto_92714 ?auto_92715 ?auto_92716 ?auto_92717 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92718 - BLOCK
      ?auto_92719 - BLOCK
      ?auto_92720 - BLOCK
      ?auto_92721 - BLOCK
      ?auto_92722 - BLOCK
      ?auto_92723 - BLOCK
      ?auto_92724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92718 ) ( ON ?auto_92719 ?auto_92718 ) ( not ( = ?auto_92718 ?auto_92719 ) ) ( not ( = ?auto_92718 ?auto_92720 ) ) ( not ( = ?auto_92718 ?auto_92721 ) ) ( not ( = ?auto_92718 ?auto_92722 ) ) ( not ( = ?auto_92718 ?auto_92723 ) ) ( not ( = ?auto_92718 ?auto_92724 ) ) ( not ( = ?auto_92719 ?auto_92720 ) ) ( not ( = ?auto_92719 ?auto_92721 ) ) ( not ( = ?auto_92719 ?auto_92722 ) ) ( not ( = ?auto_92719 ?auto_92723 ) ) ( not ( = ?auto_92719 ?auto_92724 ) ) ( not ( = ?auto_92720 ?auto_92721 ) ) ( not ( = ?auto_92720 ?auto_92722 ) ) ( not ( = ?auto_92720 ?auto_92723 ) ) ( not ( = ?auto_92720 ?auto_92724 ) ) ( not ( = ?auto_92721 ?auto_92722 ) ) ( not ( = ?auto_92721 ?auto_92723 ) ) ( not ( = ?auto_92721 ?auto_92724 ) ) ( not ( = ?auto_92722 ?auto_92723 ) ) ( not ( = ?auto_92722 ?auto_92724 ) ) ( not ( = ?auto_92723 ?auto_92724 ) ) ( ON-TABLE ?auto_92724 ) ( ON ?auto_92723 ?auto_92724 ) ( ON ?auto_92722 ?auto_92723 ) ( ON ?auto_92721 ?auto_92722 ) ( CLEAR ?auto_92719 ) ( ON ?auto_92720 ?auto_92721 ) ( CLEAR ?auto_92720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92724 ?auto_92723 ?auto_92722 ?auto_92721 )
      ( MAKE-7PILE ?auto_92718 ?auto_92719 ?auto_92720 ?auto_92721 ?auto_92722 ?auto_92723 ?auto_92724 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92725 - BLOCK
      ?auto_92726 - BLOCK
      ?auto_92727 - BLOCK
      ?auto_92728 - BLOCK
      ?auto_92729 - BLOCK
      ?auto_92730 - BLOCK
      ?auto_92731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92725 ) ( not ( = ?auto_92725 ?auto_92726 ) ) ( not ( = ?auto_92725 ?auto_92727 ) ) ( not ( = ?auto_92725 ?auto_92728 ) ) ( not ( = ?auto_92725 ?auto_92729 ) ) ( not ( = ?auto_92725 ?auto_92730 ) ) ( not ( = ?auto_92725 ?auto_92731 ) ) ( not ( = ?auto_92726 ?auto_92727 ) ) ( not ( = ?auto_92726 ?auto_92728 ) ) ( not ( = ?auto_92726 ?auto_92729 ) ) ( not ( = ?auto_92726 ?auto_92730 ) ) ( not ( = ?auto_92726 ?auto_92731 ) ) ( not ( = ?auto_92727 ?auto_92728 ) ) ( not ( = ?auto_92727 ?auto_92729 ) ) ( not ( = ?auto_92727 ?auto_92730 ) ) ( not ( = ?auto_92727 ?auto_92731 ) ) ( not ( = ?auto_92728 ?auto_92729 ) ) ( not ( = ?auto_92728 ?auto_92730 ) ) ( not ( = ?auto_92728 ?auto_92731 ) ) ( not ( = ?auto_92729 ?auto_92730 ) ) ( not ( = ?auto_92729 ?auto_92731 ) ) ( not ( = ?auto_92730 ?auto_92731 ) ) ( ON-TABLE ?auto_92731 ) ( ON ?auto_92730 ?auto_92731 ) ( ON ?auto_92729 ?auto_92730 ) ( ON ?auto_92728 ?auto_92729 ) ( ON ?auto_92727 ?auto_92728 ) ( CLEAR ?auto_92727 ) ( HOLDING ?auto_92726 ) ( CLEAR ?auto_92725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92725 ?auto_92726 )
      ( MAKE-7PILE ?auto_92725 ?auto_92726 ?auto_92727 ?auto_92728 ?auto_92729 ?auto_92730 ?auto_92731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92732 - BLOCK
      ?auto_92733 - BLOCK
      ?auto_92734 - BLOCK
      ?auto_92735 - BLOCK
      ?auto_92736 - BLOCK
      ?auto_92737 - BLOCK
      ?auto_92738 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92732 ) ( not ( = ?auto_92732 ?auto_92733 ) ) ( not ( = ?auto_92732 ?auto_92734 ) ) ( not ( = ?auto_92732 ?auto_92735 ) ) ( not ( = ?auto_92732 ?auto_92736 ) ) ( not ( = ?auto_92732 ?auto_92737 ) ) ( not ( = ?auto_92732 ?auto_92738 ) ) ( not ( = ?auto_92733 ?auto_92734 ) ) ( not ( = ?auto_92733 ?auto_92735 ) ) ( not ( = ?auto_92733 ?auto_92736 ) ) ( not ( = ?auto_92733 ?auto_92737 ) ) ( not ( = ?auto_92733 ?auto_92738 ) ) ( not ( = ?auto_92734 ?auto_92735 ) ) ( not ( = ?auto_92734 ?auto_92736 ) ) ( not ( = ?auto_92734 ?auto_92737 ) ) ( not ( = ?auto_92734 ?auto_92738 ) ) ( not ( = ?auto_92735 ?auto_92736 ) ) ( not ( = ?auto_92735 ?auto_92737 ) ) ( not ( = ?auto_92735 ?auto_92738 ) ) ( not ( = ?auto_92736 ?auto_92737 ) ) ( not ( = ?auto_92736 ?auto_92738 ) ) ( not ( = ?auto_92737 ?auto_92738 ) ) ( ON-TABLE ?auto_92738 ) ( ON ?auto_92737 ?auto_92738 ) ( ON ?auto_92736 ?auto_92737 ) ( ON ?auto_92735 ?auto_92736 ) ( ON ?auto_92734 ?auto_92735 ) ( CLEAR ?auto_92732 ) ( ON ?auto_92733 ?auto_92734 ) ( CLEAR ?auto_92733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92738 ?auto_92737 ?auto_92736 ?auto_92735 ?auto_92734 )
      ( MAKE-7PILE ?auto_92732 ?auto_92733 ?auto_92734 ?auto_92735 ?auto_92736 ?auto_92737 ?auto_92738 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92739 - BLOCK
      ?auto_92740 - BLOCK
      ?auto_92741 - BLOCK
      ?auto_92742 - BLOCK
      ?auto_92743 - BLOCK
      ?auto_92744 - BLOCK
      ?auto_92745 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92739 ?auto_92740 ) ) ( not ( = ?auto_92739 ?auto_92741 ) ) ( not ( = ?auto_92739 ?auto_92742 ) ) ( not ( = ?auto_92739 ?auto_92743 ) ) ( not ( = ?auto_92739 ?auto_92744 ) ) ( not ( = ?auto_92739 ?auto_92745 ) ) ( not ( = ?auto_92740 ?auto_92741 ) ) ( not ( = ?auto_92740 ?auto_92742 ) ) ( not ( = ?auto_92740 ?auto_92743 ) ) ( not ( = ?auto_92740 ?auto_92744 ) ) ( not ( = ?auto_92740 ?auto_92745 ) ) ( not ( = ?auto_92741 ?auto_92742 ) ) ( not ( = ?auto_92741 ?auto_92743 ) ) ( not ( = ?auto_92741 ?auto_92744 ) ) ( not ( = ?auto_92741 ?auto_92745 ) ) ( not ( = ?auto_92742 ?auto_92743 ) ) ( not ( = ?auto_92742 ?auto_92744 ) ) ( not ( = ?auto_92742 ?auto_92745 ) ) ( not ( = ?auto_92743 ?auto_92744 ) ) ( not ( = ?auto_92743 ?auto_92745 ) ) ( not ( = ?auto_92744 ?auto_92745 ) ) ( ON-TABLE ?auto_92745 ) ( ON ?auto_92744 ?auto_92745 ) ( ON ?auto_92743 ?auto_92744 ) ( ON ?auto_92742 ?auto_92743 ) ( ON ?auto_92741 ?auto_92742 ) ( ON ?auto_92740 ?auto_92741 ) ( CLEAR ?auto_92740 ) ( HOLDING ?auto_92739 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92739 )
      ( MAKE-7PILE ?auto_92739 ?auto_92740 ?auto_92741 ?auto_92742 ?auto_92743 ?auto_92744 ?auto_92745 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92746 - BLOCK
      ?auto_92747 - BLOCK
      ?auto_92748 - BLOCK
      ?auto_92749 - BLOCK
      ?auto_92750 - BLOCK
      ?auto_92751 - BLOCK
      ?auto_92752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92746 ?auto_92747 ) ) ( not ( = ?auto_92746 ?auto_92748 ) ) ( not ( = ?auto_92746 ?auto_92749 ) ) ( not ( = ?auto_92746 ?auto_92750 ) ) ( not ( = ?auto_92746 ?auto_92751 ) ) ( not ( = ?auto_92746 ?auto_92752 ) ) ( not ( = ?auto_92747 ?auto_92748 ) ) ( not ( = ?auto_92747 ?auto_92749 ) ) ( not ( = ?auto_92747 ?auto_92750 ) ) ( not ( = ?auto_92747 ?auto_92751 ) ) ( not ( = ?auto_92747 ?auto_92752 ) ) ( not ( = ?auto_92748 ?auto_92749 ) ) ( not ( = ?auto_92748 ?auto_92750 ) ) ( not ( = ?auto_92748 ?auto_92751 ) ) ( not ( = ?auto_92748 ?auto_92752 ) ) ( not ( = ?auto_92749 ?auto_92750 ) ) ( not ( = ?auto_92749 ?auto_92751 ) ) ( not ( = ?auto_92749 ?auto_92752 ) ) ( not ( = ?auto_92750 ?auto_92751 ) ) ( not ( = ?auto_92750 ?auto_92752 ) ) ( not ( = ?auto_92751 ?auto_92752 ) ) ( ON-TABLE ?auto_92752 ) ( ON ?auto_92751 ?auto_92752 ) ( ON ?auto_92750 ?auto_92751 ) ( ON ?auto_92749 ?auto_92750 ) ( ON ?auto_92748 ?auto_92749 ) ( ON ?auto_92747 ?auto_92748 ) ( ON ?auto_92746 ?auto_92747 ) ( CLEAR ?auto_92746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92752 ?auto_92751 ?auto_92750 ?auto_92749 ?auto_92748 ?auto_92747 )
      ( MAKE-7PILE ?auto_92746 ?auto_92747 ?auto_92748 ?auto_92749 ?auto_92750 ?auto_92751 ?auto_92752 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92753 - BLOCK
      ?auto_92754 - BLOCK
      ?auto_92755 - BLOCK
      ?auto_92756 - BLOCK
      ?auto_92757 - BLOCK
      ?auto_92758 - BLOCK
      ?auto_92759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92753 ?auto_92754 ) ) ( not ( = ?auto_92753 ?auto_92755 ) ) ( not ( = ?auto_92753 ?auto_92756 ) ) ( not ( = ?auto_92753 ?auto_92757 ) ) ( not ( = ?auto_92753 ?auto_92758 ) ) ( not ( = ?auto_92753 ?auto_92759 ) ) ( not ( = ?auto_92754 ?auto_92755 ) ) ( not ( = ?auto_92754 ?auto_92756 ) ) ( not ( = ?auto_92754 ?auto_92757 ) ) ( not ( = ?auto_92754 ?auto_92758 ) ) ( not ( = ?auto_92754 ?auto_92759 ) ) ( not ( = ?auto_92755 ?auto_92756 ) ) ( not ( = ?auto_92755 ?auto_92757 ) ) ( not ( = ?auto_92755 ?auto_92758 ) ) ( not ( = ?auto_92755 ?auto_92759 ) ) ( not ( = ?auto_92756 ?auto_92757 ) ) ( not ( = ?auto_92756 ?auto_92758 ) ) ( not ( = ?auto_92756 ?auto_92759 ) ) ( not ( = ?auto_92757 ?auto_92758 ) ) ( not ( = ?auto_92757 ?auto_92759 ) ) ( not ( = ?auto_92758 ?auto_92759 ) ) ( ON-TABLE ?auto_92759 ) ( ON ?auto_92758 ?auto_92759 ) ( ON ?auto_92757 ?auto_92758 ) ( ON ?auto_92756 ?auto_92757 ) ( ON ?auto_92755 ?auto_92756 ) ( ON ?auto_92754 ?auto_92755 ) ( HOLDING ?auto_92753 ) ( CLEAR ?auto_92754 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92759 ?auto_92758 ?auto_92757 ?auto_92756 ?auto_92755 ?auto_92754 ?auto_92753 )
      ( MAKE-7PILE ?auto_92753 ?auto_92754 ?auto_92755 ?auto_92756 ?auto_92757 ?auto_92758 ?auto_92759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92760 - BLOCK
      ?auto_92761 - BLOCK
      ?auto_92762 - BLOCK
      ?auto_92763 - BLOCK
      ?auto_92764 - BLOCK
      ?auto_92765 - BLOCK
      ?auto_92766 - BLOCK
    )
    :vars
    (
      ?auto_92767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92760 ?auto_92761 ) ) ( not ( = ?auto_92760 ?auto_92762 ) ) ( not ( = ?auto_92760 ?auto_92763 ) ) ( not ( = ?auto_92760 ?auto_92764 ) ) ( not ( = ?auto_92760 ?auto_92765 ) ) ( not ( = ?auto_92760 ?auto_92766 ) ) ( not ( = ?auto_92761 ?auto_92762 ) ) ( not ( = ?auto_92761 ?auto_92763 ) ) ( not ( = ?auto_92761 ?auto_92764 ) ) ( not ( = ?auto_92761 ?auto_92765 ) ) ( not ( = ?auto_92761 ?auto_92766 ) ) ( not ( = ?auto_92762 ?auto_92763 ) ) ( not ( = ?auto_92762 ?auto_92764 ) ) ( not ( = ?auto_92762 ?auto_92765 ) ) ( not ( = ?auto_92762 ?auto_92766 ) ) ( not ( = ?auto_92763 ?auto_92764 ) ) ( not ( = ?auto_92763 ?auto_92765 ) ) ( not ( = ?auto_92763 ?auto_92766 ) ) ( not ( = ?auto_92764 ?auto_92765 ) ) ( not ( = ?auto_92764 ?auto_92766 ) ) ( not ( = ?auto_92765 ?auto_92766 ) ) ( ON-TABLE ?auto_92766 ) ( ON ?auto_92765 ?auto_92766 ) ( ON ?auto_92764 ?auto_92765 ) ( ON ?auto_92763 ?auto_92764 ) ( ON ?auto_92762 ?auto_92763 ) ( ON ?auto_92761 ?auto_92762 ) ( CLEAR ?auto_92761 ) ( ON ?auto_92760 ?auto_92767 ) ( CLEAR ?auto_92760 ) ( HAND-EMPTY ) ( not ( = ?auto_92760 ?auto_92767 ) ) ( not ( = ?auto_92761 ?auto_92767 ) ) ( not ( = ?auto_92762 ?auto_92767 ) ) ( not ( = ?auto_92763 ?auto_92767 ) ) ( not ( = ?auto_92764 ?auto_92767 ) ) ( not ( = ?auto_92765 ?auto_92767 ) ) ( not ( = ?auto_92766 ?auto_92767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92760 ?auto_92767 )
      ( MAKE-7PILE ?auto_92760 ?auto_92761 ?auto_92762 ?auto_92763 ?auto_92764 ?auto_92765 ?auto_92766 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92768 - BLOCK
      ?auto_92769 - BLOCK
      ?auto_92770 - BLOCK
      ?auto_92771 - BLOCK
      ?auto_92772 - BLOCK
      ?auto_92773 - BLOCK
      ?auto_92774 - BLOCK
    )
    :vars
    (
      ?auto_92775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92768 ?auto_92769 ) ) ( not ( = ?auto_92768 ?auto_92770 ) ) ( not ( = ?auto_92768 ?auto_92771 ) ) ( not ( = ?auto_92768 ?auto_92772 ) ) ( not ( = ?auto_92768 ?auto_92773 ) ) ( not ( = ?auto_92768 ?auto_92774 ) ) ( not ( = ?auto_92769 ?auto_92770 ) ) ( not ( = ?auto_92769 ?auto_92771 ) ) ( not ( = ?auto_92769 ?auto_92772 ) ) ( not ( = ?auto_92769 ?auto_92773 ) ) ( not ( = ?auto_92769 ?auto_92774 ) ) ( not ( = ?auto_92770 ?auto_92771 ) ) ( not ( = ?auto_92770 ?auto_92772 ) ) ( not ( = ?auto_92770 ?auto_92773 ) ) ( not ( = ?auto_92770 ?auto_92774 ) ) ( not ( = ?auto_92771 ?auto_92772 ) ) ( not ( = ?auto_92771 ?auto_92773 ) ) ( not ( = ?auto_92771 ?auto_92774 ) ) ( not ( = ?auto_92772 ?auto_92773 ) ) ( not ( = ?auto_92772 ?auto_92774 ) ) ( not ( = ?auto_92773 ?auto_92774 ) ) ( ON-TABLE ?auto_92774 ) ( ON ?auto_92773 ?auto_92774 ) ( ON ?auto_92772 ?auto_92773 ) ( ON ?auto_92771 ?auto_92772 ) ( ON ?auto_92770 ?auto_92771 ) ( ON ?auto_92768 ?auto_92775 ) ( CLEAR ?auto_92768 ) ( not ( = ?auto_92768 ?auto_92775 ) ) ( not ( = ?auto_92769 ?auto_92775 ) ) ( not ( = ?auto_92770 ?auto_92775 ) ) ( not ( = ?auto_92771 ?auto_92775 ) ) ( not ( = ?auto_92772 ?auto_92775 ) ) ( not ( = ?auto_92773 ?auto_92775 ) ) ( not ( = ?auto_92774 ?auto_92775 ) ) ( HOLDING ?auto_92769 ) ( CLEAR ?auto_92770 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92774 ?auto_92773 ?auto_92772 ?auto_92771 ?auto_92770 ?auto_92769 )
      ( MAKE-7PILE ?auto_92768 ?auto_92769 ?auto_92770 ?auto_92771 ?auto_92772 ?auto_92773 ?auto_92774 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92776 - BLOCK
      ?auto_92777 - BLOCK
      ?auto_92778 - BLOCK
      ?auto_92779 - BLOCK
      ?auto_92780 - BLOCK
      ?auto_92781 - BLOCK
      ?auto_92782 - BLOCK
    )
    :vars
    (
      ?auto_92783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92776 ?auto_92777 ) ) ( not ( = ?auto_92776 ?auto_92778 ) ) ( not ( = ?auto_92776 ?auto_92779 ) ) ( not ( = ?auto_92776 ?auto_92780 ) ) ( not ( = ?auto_92776 ?auto_92781 ) ) ( not ( = ?auto_92776 ?auto_92782 ) ) ( not ( = ?auto_92777 ?auto_92778 ) ) ( not ( = ?auto_92777 ?auto_92779 ) ) ( not ( = ?auto_92777 ?auto_92780 ) ) ( not ( = ?auto_92777 ?auto_92781 ) ) ( not ( = ?auto_92777 ?auto_92782 ) ) ( not ( = ?auto_92778 ?auto_92779 ) ) ( not ( = ?auto_92778 ?auto_92780 ) ) ( not ( = ?auto_92778 ?auto_92781 ) ) ( not ( = ?auto_92778 ?auto_92782 ) ) ( not ( = ?auto_92779 ?auto_92780 ) ) ( not ( = ?auto_92779 ?auto_92781 ) ) ( not ( = ?auto_92779 ?auto_92782 ) ) ( not ( = ?auto_92780 ?auto_92781 ) ) ( not ( = ?auto_92780 ?auto_92782 ) ) ( not ( = ?auto_92781 ?auto_92782 ) ) ( ON-TABLE ?auto_92782 ) ( ON ?auto_92781 ?auto_92782 ) ( ON ?auto_92780 ?auto_92781 ) ( ON ?auto_92779 ?auto_92780 ) ( ON ?auto_92778 ?auto_92779 ) ( ON ?auto_92776 ?auto_92783 ) ( not ( = ?auto_92776 ?auto_92783 ) ) ( not ( = ?auto_92777 ?auto_92783 ) ) ( not ( = ?auto_92778 ?auto_92783 ) ) ( not ( = ?auto_92779 ?auto_92783 ) ) ( not ( = ?auto_92780 ?auto_92783 ) ) ( not ( = ?auto_92781 ?auto_92783 ) ) ( not ( = ?auto_92782 ?auto_92783 ) ) ( CLEAR ?auto_92778 ) ( ON ?auto_92777 ?auto_92776 ) ( CLEAR ?auto_92777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92783 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92783 ?auto_92776 )
      ( MAKE-7PILE ?auto_92776 ?auto_92777 ?auto_92778 ?auto_92779 ?auto_92780 ?auto_92781 ?auto_92782 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92784 - BLOCK
      ?auto_92785 - BLOCK
      ?auto_92786 - BLOCK
      ?auto_92787 - BLOCK
      ?auto_92788 - BLOCK
      ?auto_92789 - BLOCK
      ?auto_92790 - BLOCK
    )
    :vars
    (
      ?auto_92791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92784 ?auto_92785 ) ) ( not ( = ?auto_92784 ?auto_92786 ) ) ( not ( = ?auto_92784 ?auto_92787 ) ) ( not ( = ?auto_92784 ?auto_92788 ) ) ( not ( = ?auto_92784 ?auto_92789 ) ) ( not ( = ?auto_92784 ?auto_92790 ) ) ( not ( = ?auto_92785 ?auto_92786 ) ) ( not ( = ?auto_92785 ?auto_92787 ) ) ( not ( = ?auto_92785 ?auto_92788 ) ) ( not ( = ?auto_92785 ?auto_92789 ) ) ( not ( = ?auto_92785 ?auto_92790 ) ) ( not ( = ?auto_92786 ?auto_92787 ) ) ( not ( = ?auto_92786 ?auto_92788 ) ) ( not ( = ?auto_92786 ?auto_92789 ) ) ( not ( = ?auto_92786 ?auto_92790 ) ) ( not ( = ?auto_92787 ?auto_92788 ) ) ( not ( = ?auto_92787 ?auto_92789 ) ) ( not ( = ?auto_92787 ?auto_92790 ) ) ( not ( = ?auto_92788 ?auto_92789 ) ) ( not ( = ?auto_92788 ?auto_92790 ) ) ( not ( = ?auto_92789 ?auto_92790 ) ) ( ON-TABLE ?auto_92790 ) ( ON ?auto_92789 ?auto_92790 ) ( ON ?auto_92788 ?auto_92789 ) ( ON ?auto_92787 ?auto_92788 ) ( ON ?auto_92784 ?auto_92791 ) ( not ( = ?auto_92784 ?auto_92791 ) ) ( not ( = ?auto_92785 ?auto_92791 ) ) ( not ( = ?auto_92786 ?auto_92791 ) ) ( not ( = ?auto_92787 ?auto_92791 ) ) ( not ( = ?auto_92788 ?auto_92791 ) ) ( not ( = ?auto_92789 ?auto_92791 ) ) ( not ( = ?auto_92790 ?auto_92791 ) ) ( ON ?auto_92785 ?auto_92784 ) ( CLEAR ?auto_92785 ) ( ON-TABLE ?auto_92791 ) ( HOLDING ?auto_92786 ) ( CLEAR ?auto_92787 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92790 ?auto_92789 ?auto_92788 ?auto_92787 ?auto_92786 )
      ( MAKE-7PILE ?auto_92784 ?auto_92785 ?auto_92786 ?auto_92787 ?auto_92788 ?auto_92789 ?auto_92790 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92792 - BLOCK
      ?auto_92793 - BLOCK
      ?auto_92794 - BLOCK
      ?auto_92795 - BLOCK
      ?auto_92796 - BLOCK
      ?auto_92797 - BLOCK
      ?auto_92798 - BLOCK
    )
    :vars
    (
      ?auto_92799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92792 ?auto_92793 ) ) ( not ( = ?auto_92792 ?auto_92794 ) ) ( not ( = ?auto_92792 ?auto_92795 ) ) ( not ( = ?auto_92792 ?auto_92796 ) ) ( not ( = ?auto_92792 ?auto_92797 ) ) ( not ( = ?auto_92792 ?auto_92798 ) ) ( not ( = ?auto_92793 ?auto_92794 ) ) ( not ( = ?auto_92793 ?auto_92795 ) ) ( not ( = ?auto_92793 ?auto_92796 ) ) ( not ( = ?auto_92793 ?auto_92797 ) ) ( not ( = ?auto_92793 ?auto_92798 ) ) ( not ( = ?auto_92794 ?auto_92795 ) ) ( not ( = ?auto_92794 ?auto_92796 ) ) ( not ( = ?auto_92794 ?auto_92797 ) ) ( not ( = ?auto_92794 ?auto_92798 ) ) ( not ( = ?auto_92795 ?auto_92796 ) ) ( not ( = ?auto_92795 ?auto_92797 ) ) ( not ( = ?auto_92795 ?auto_92798 ) ) ( not ( = ?auto_92796 ?auto_92797 ) ) ( not ( = ?auto_92796 ?auto_92798 ) ) ( not ( = ?auto_92797 ?auto_92798 ) ) ( ON-TABLE ?auto_92798 ) ( ON ?auto_92797 ?auto_92798 ) ( ON ?auto_92796 ?auto_92797 ) ( ON ?auto_92795 ?auto_92796 ) ( ON ?auto_92792 ?auto_92799 ) ( not ( = ?auto_92792 ?auto_92799 ) ) ( not ( = ?auto_92793 ?auto_92799 ) ) ( not ( = ?auto_92794 ?auto_92799 ) ) ( not ( = ?auto_92795 ?auto_92799 ) ) ( not ( = ?auto_92796 ?auto_92799 ) ) ( not ( = ?auto_92797 ?auto_92799 ) ) ( not ( = ?auto_92798 ?auto_92799 ) ) ( ON ?auto_92793 ?auto_92792 ) ( ON-TABLE ?auto_92799 ) ( CLEAR ?auto_92795 ) ( ON ?auto_92794 ?auto_92793 ) ( CLEAR ?auto_92794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92799 ?auto_92792 ?auto_92793 )
      ( MAKE-7PILE ?auto_92792 ?auto_92793 ?auto_92794 ?auto_92795 ?auto_92796 ?auto_92797 ?auto_92798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92800 - BLOCK
      ?auto_92801 - BLOCK
      ?auto_92802 - BLOCK
      ?auto_92803 - BLOCK
      ?auto_92804 - BLOCK
      ?auto_92805 - BLOCK
      ?auto_92806 - BLOCK
    )
    :vars
    (
      ?auto_92807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92800 ?auto_92801 ) ) ( not ( = ?auto_92800 ?auto_92802 ) ) ( not ( = ?auto_92800 ?auto_92803 ) ) ( not ( = ?auto_92800 ?auto_92804 ) ) ( not ( = ?auto_92800 ?auto_92805 ) ) ( not ( = ?auto_92800 ?auto_92806 ) ) ( not ( = ?auto_92801 ?auto_92802 ) ) ( not ( = ?auto_92801 ?auto_92803 ) ) ( not ( = ?auto_92801 ?auto_92804 ) ) ( not ( = ?auto_92801 ?auto_92805 ) ) ( not ( = ?auto_92801 ?auto_92806 ) ) ( not ( = ?auto_92802 ?auto_92803 ) ) ( not ( = ?auto_92802 ?auto_92804 ) ) ( not ( = ?auto_92802 ?auto_92805 ) ) ( not ( = ?auto_92802 ?auto_92806 ) ) ( not ( = ?auto_92803 ?auto_92804 ) ) ( not ( = ?auto_92803 ?auto_92805 ) ) ( not ( = ?auto_92803 ?auto_92806 ) ) ( not ( = ?auto_92804 ?auto_92805 ) ) ( not ( = ?auto_92804 ?auto_92806 ) ) ( not ( = ?auto_92805 ?auto_92806 ) ) ( ON-TABLE ?auto_92806 ) ( ON ?auto_92805 ?auto_92806 ) ( ON ?auto_92804 ?auto_92805 ) ( ON ?auto_92800 ?auto_92807 ) ( not ( = ?auto_92800 ?auto_92807 ) ) ( not ( = ?auto_92801 ?auto_92807 ) ) ( not ( = ?auto_92802 ?auto_92807 ) ) ( not ( = ?auto_92803 ?auto_92807 ) ) ( not ( = ?auto_92804 ?auto_92807 ) ) ( not ( = ?auto_92805 ?auto_92807 ) ) ( not ( = ?auto_92806 ?auto_92807 ) ) ( ON ?auto_92801 ?auto_92800 ) ( ON-TABLE ?auto_92807 ) ( ON ?auto_92802 ?auto_92801 ) ( CLEAR ?auto_92802 ) ( HOLDING ?auto_92803 ) ( CLEAR ?auto_92804 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92806 ?auto_92805 ?auto_92804 ?auto_92803 )
      ( MAKE-7PILE ?auto_92800 ?auto_92801 ?auto_92802 ?auto_92803 ?auto_92804 ?auto_92805 ?auto_92806 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92808 - BLOCK
      ?auto_92809 - BLOCK
      ?auto_92810 - BLOCK
      ?auto_92811 - BLOCK
      ?auto_92812 - BLOCK
      ?auto_92813 - BLOCK
      ?auto_92814 - BLOCK
    )
    :vars
    (
      ?auto_92815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92808 ?auto_92809 ) ) ( not ( = ?auto_92808 ?auto_92810 ) ) ( not ( = ?auto_92808 ?auto_92811 ) ) ( not ( = ?auto_92808 ?auto_92812 ) ) ( not ( = ?auto_92808 ?auto_92813 ) ) ( not ( = ?auto_92808 ?auto_92814 ) ) ( not ( = ?auto_92809 ?auto_92810 ) ) ( not ( = ?auto_92809 ?auto_92811 ) ) ( not ( = ?auto_92809 ?auto_92812 ) ) ( not ( = ?auto_92809 ?auto_92813 ) ) ( not ( = ?auto_92809 ?auto_92814 ) ) ( not ( = ?auto_92810 ?auto_92811 ) ) ( not ( = ?auto_92810 ?auto_92812 ) ) ( not ( = ?auto_92810 ?auto_92813 ) ) ( not ( = ?auto_92810 ?auto_92814 ) ) ( not ( = ?auto_92811 ?auto_92812 ) ) ( not ( = ?auto_92811 ?auto_92813 ) ) ( not ( = ?auto_92811 ?auto_92814 ) ) ( not ( = ?auto_92812 ?auto_92813 ) ) ( not ( = ?auto_92812 ?auto_92814 ) ) ( not ( = ?auto_92813 ?auto_92814 ) ) ( ON-TABLE ?auto_92814 ) ( ON ?auto_92813 ?auto_92814 ) ( ON ?auto_92812 ?auto_92813 ) ( ON ?auto_92808 ?auto_92815 ) ( not ( = ?auto_92808 ?auto_92815 ) ) ( not ( = ?auto_92809 ?auto_92815 ) ) ( not ( = ?auto_92810 ?auto_92815 ) ) ( not ( = ?auto_92811 ?auto_92815 ) ) ( not ( = ?auto_92812 ?auto_92815 ) ) ( not ( = ?auto_92813 ?auto_92815 ) ) ( not ( = ?auto_92814 ?auto_92815 ) ) ( ON ?auto_92809 ?auto_92808 ) ( ON-TABLE ?auto_92815 ) ( ON ?auto_92810 ?auto_92809 ) ( CLEAR ?auto_92812 ) ( ON ?auto_92811 ?auto_92810 ) ( CLEAR ?auto_92811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92815 ?auto_92808 ?auto_92809 ?auto_92810 )
      ( MAKE-7PILE ?auto_92808 ?auto_92809 ?auto_92810 ?auto_92811 ?auto_92812 ?auto_92813 ?auto_92814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92816 - BLOCK
      ?auto_92817 - BLOCK
      ?auto_92818 - BLOCK
      ?auto_92819 - BLOCK
      ?auto_92820 - BLOCK
      ?auto_92821 - BLOCK
      ?auto_92822 - BLOCK
    )
    :vars
    (
      ?auto_92823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92816 ?auto_92817 ) ) ( not ( = ?auto_92816 ?auto_92818 ) ) ( not ( = ?auto_92816 ?auto_92819 ) ) ( not ( = ?auto_92816 ?auto_92820 ) ) ( not ( = ?auto_92816 ?auto_92821 ) ) ( not ( = ?auto_92816 ?auto_92822 ) ) ( not ( = ?auto_92817 ?auto_92818 ) ) ( not ( = ?auto_92817 ?auto_92819 ) ) ( not ( = ?auto_92817 ?auto_92820 ) ) ( not ( = ?auto_92817 ?auto_92821 ) ) ( not ( = ?auto_92817 ?auto_92822 ) ) ( not ( = ?auto_92818 ?auto_92819 ) ) ( not ( = ?auto_92818 ?auto_92820 ) ) ( not ( = ?auto_92818 ?auto_92821 ) ) ( not ( = ?auto_92818 ?auto_92822 ) ) ( not ( = ?auto_92819 ?auto_92820 ) ) ( not ( = ?auto_92819 ?auto_92821 ) ) ( not ( = ?auto_92819 ?auto_92822 ) ) ( not ( = ?auto_92820 ?auto_92821 ) ) ( not ( = ?auto_92820 ?auto_92822 ) ) ( not ( = ?auto_92821 ?auto_92822 ) ) ( ON-TABLE ?auto_92822 ) ( ON ?auto_92821 ?auto_92822 ) ( ON ?auto_92816 ?auto_92823 ) ( not ( = ?auto_92816 ?auto_92823 ) ) ( not ( = ?auto_92817 ?auto_92823 ) ) ( not ( = ?auto_92818 ?auto_92823 ) ) ( not ( = ?auto_92819 ?auto_92823 ) ) ( not ( = ?auto_92820 ?auto_92823 ) ) ( not ( = ?auto_92821 ?auto_92823 ) ) ( not ( = ?auto_92822 ?auto_92823 ) ) ( ON ?auto_92817 ?auto_92816 ) ( ON-TABLE ?auto_92823 ) ( ON ?auto_92818 ?auto_92817 ) ( ON ?auto_92819 ?auto_92818 ) ( CLEAR ?auto_92819 ) ( HOLDING ?auto_92820 ) ( CLEAR ?auto_92821 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92822 ?auto_92821 ?auto_92820 )
      ( MAKE-7PILE ?auto_92816 ?auto_92817 ?auto_92818 ?auto_92819 ?auto_92820 ?auto_92821 ?auto_92822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92824 - BLOCK
      ?auto_92825 - BLOCK
      ?auto_92826 - BLOCK
      ?auto_92827 - BLOCK
      ?auto_92828 - BLOCK
      ?auto_92829 - BLOCK
      ?auto_92830 - BLOCK
    )
    :vars
    (
      ?auto_92831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92824 ?auto_92825 ) ) ( not ( = ?auto_92824 ?auto_92826 ) ) ( not ( = ?auto_92824 ?auto_92827 ) ) ( not ( = ?auto_92824 ?auto_92828 ) ) ( not ( = ?auto_92824 ?auto_92829 ) ) ( not ( = ?auto_92824 ?auto_92830 ) ) ( not ( = ?auto_92825 ?auto_92826 ) ) ( not ( = ?auto_92825 ?auto_92827 ) ) ( not ( = ?auto_92825 ?auto_92828 ) ) ( not ( = ?auto_92825 ?auto_92829 ) ) ( not ( = ?auto_92825 ?auto_92830 ) ) ( not ( = ?auto_92826 ?auto_92827 ) ) ( not ( = ?auto_92826 ?auto_92828 ) ) ( not ( = ?auto_92826 ?auto_92829 ) ) ( not ( = ?auto_92826 ?auto_92830 ) ) ( not ( = ?auto_92827 ?auto_92828 ) ) ( not ( = ?auto_92827 ?auto_92829 ) ) ( not ( = ?auto_92827 ?auto_92830 ) ) ( not ( = ?auto_92828 ?auto_92829 ) ) ( not ( = ?auto_92828 ?auto_92830 ) ) ( not ( = ?auto_92829 ?auto_92830 ) ) ( ON-TABLE ?auto_92830 ) ( ON ?auto_92829 ?auto_92830 ) ( ON ?auto_92824 ?auto_92831 ) ( not ( = ?auto_92824 ?auto_92831 ) ) ( not ( = ?auto_92825 ?auto_92831 ) ) ( not ( = ?auto_92826 ?auto_92831 ) ) ( not ( = ?auto_92827 ?auto_92831 ) ) ( not ( = ?auto_92828 ?auto_92831 ) ) ( not ( = ?auto_92829 ?auto_92831 ) ) ( not ( = ?auto_92830 ?auto_92831 ) ) ( ON ?auto_92825 ?auto_92824 ) ( ON-TABLE ?auto_92831 ) ( ON ?auto_92826 ?auto_92825 ) ( ON ?auto_92827 ?auto_92826 ) ( CLEAR ?auto_92829 ) ( ON ?auto_92828 ?auto_92827 ) ( CLEAR ?auto_92828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92831 ?auto_92824 ?auto_92825 ?auto_92826 ?auto_92827 )
      ( MAKE-7PILE ?auto_92824 ?auto_92825 ?auto_92826 ?auto_92827 ?auto_92828 ?auto_92829 ?auto_92830 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92832 - BLOCK
      ?auto_92833 - BLOCK
      ?auto_92834 - BLOCK
      ?auto_92835 - BLOCK
      ?auto_92836 - BLOCK
      ?auto_92837 - BLOCK
      ?auto_92838 - BLOCK
    )
    :vars
    (
      ?auto_92839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92832 ?auto_92833 ) ) ( not ( = ?auto_92832 ?auto_92834 ) ) ( not ( = ?auto_92832 ?auto_92835 ) ) ( not ( = ?auto_92832 ?auto_92836 ) ) ( not ( = ?auto_92832 ?auto_92837 ) ) ( not ( = ?auto_92832 ?auto_92838 ) ) ( not ( = ?auto_92833 ?auto_92834 ) ) ( not ( = ?auto_92833 ?auto_92835 ) ) ( not ( = ?auto_92833 ?auto_92836 ) ) ( not ( = ?auto_92833 ?auto_92837 ) ) ( not ( = ?auto_92833 ?auto_92838 ) ) ( not ( = ?auto_92834 ?auto_92835 ) ) ( not ( = ?auto_92834 ?auto_92836 ) ) ( not ( = ?auto_92834 ?auto_92837 ) ) ( not ( = ?auto_92834 ?auto_92838 ) ) ( not ( = ?auto_92835 ?auto_92836 ) ) ( not ( = ?auto_92835 ?auto_92837 ) ) ( not ( = ?auto_92835 ?auto_92838 ) ) ( not ( = ?auto_92836 ?auto_92837 ) ) ( not ( = ?auto_92836 ?auto_92838 ) ) ( not ( = ?auto_92837 ?auto_92838 ) ) ( ON-TABLE ?auto_92838 ) ( ON ?auto_92832 ?auto_92839 ) ( not ( = ?auto_92832 ?auto_92839 ) ) ( not ( = ?auto_92833 ?auto_92839 ) ) ( not ( = ?auto_92834 ?auto_92839 ) ) ( not ( = ?auto_92835 ?auto_92839 ) ) ( not ( = ?auto_92836 ?auto_92839 ) ) ( not ( = ?auto_92837 ?auto_92839 ) ) ( not ( = ?auto_92838 ?auto_92839 ) ) ( ON ?auto_92833 ?auto_92832 ) ( ON-TABLE ?auto_92839 ) ( ON ?auto_92834 ?auto_92833 ) ( ON ?auto_92835 ?auto_92834 ) ( ON ?auto_92836 ?auto_92835 ) ( CLEAR ?auto_92836 ) ( HOLDING ?auto_92837 ) ( CLEAR ?auto_92838 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92838 ?auto_92837 )
      ( MAKE-7PILE ?auto_92832 ?auto_92833 ?auto_92834 ?auto_92835 ?auto_92836 ?auto_92837 ?auto_92838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92840 - BLOCK
      ?auto_92841 - BLOCK
      ?auto_92842 - BLOCK
      ?auto_92843 - BLOCK
      ?auto_92844 - BLOCK
      ?auto_92845 - BLOCK
      ?auto_92846 - BLOCK
    )
    :vars
    (
      ?auto_92847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92840 ?auto_92841 ) ) ( not ( = ?auto_92840 ?auto_92842 ) ) ( not ( = ?auto_92840 ?auto_92843 ) ) ( not ( = ?auto_92840 ?auto_92844 ) ) ( not ( = ?auto_92840 ?auto_92845 ) ) ( not ( = ?auto_92840 ?auto_92846 ) ) ( not ( = ?auto_92841 ?auto_92842 ) ) ( not ( = ?auto_92841 ?auto_92843 ) ) ( not ( = ?auto_92841 ?auto_92844 ) ) ( not ( = ?auto_92841 ?auto_92845 ) ) ( not ( = ?auto_92841 ?auto_92846 ) ) ( not ( = ?auto_92842 ?auto_92843 ) ) ( not ( = ?auto_92842 ?auto_92844 ) ) ( not ( = ?auto_92842 ?auto_92845 ) ) ( not ( = ?auto_92842 ?auto_92846 ) ) ( not ( = ?auto_92843 ?auto_92844 ) ) ( not ( = ?auto_92843 ?auto_92845 ) ) ( not ( = ?auto_92843 ?auto_92846 ) ) ( not ( = ?auto_92844 ?auto_92845 ) ) ( not ( = ?auto_92844 ?auto_92846 ) ) ( not ( = ?auto_92845 ?auto_92846 ) ) ( ON-TABLE ?auto_92846 ) ( ON ?auto_92840 ?auto_92847 ) ( not ( = ?auto_92840 ?auto_92847 ) ) ( not ( = ?auto_92841 ?auto_92847 ) ) ( not ( = ?auto_92842 ?auto_92847 ) ) ( not ( = ?auto_92843 ?auto_92847 ) ) ( not ( = ?auto_92844 ?auto_92847 ) ) ( not ( = ?auto_92845 ?auto_92847 ) ) ( not ( = ?auto_92846 ?auto_92847 ) ) ( ON ?auto_92841 ?auto_92840 ) ( ON-TABLE ?auto_92847 ) ( ON ?auto_92842 ?auto_92841 ) ( ON ?auto_92843 ?auto_92842 ) ( ON ?auto_92844 ?auto_92843 ) ( CLEAR ?auto_92846 ) ( ON ?auto_92845 ?auto_92844 ) ( CLEAR ?auto_92845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92847 ?auto_92840 ?auto_92841 ?auto_92842 ?auto_92843 ?auto_92844 )
      ( MAKE-7PILE ?auto_92840 ?auto_92841 ?auto_92842 ?auto_92843 ?auto_92844 ?auto_92845 ?auto_92846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92848 - BLOCK
      ?auto_92849 - BLOCK
      ?auto_92850 - BLOCK
      ?auto_92851 - BLOCK
      ?auto_92852 - BLOCK
      ?auto_92853 - BLOCK
      ?auto_92854 - BLOCK
    )
    :vars
    (
      ?auto_92855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92848 ?auto_92849 ) ) ( not ( = ?auto_92848 ?auto_92850 ) ) ( not ( = ?auto_92848 ?auto_92851 ) ) ( not ( = ?auto_92848 ?auto_92852 ) ) ( not ( = ?auto_92848 ?auto_92853 ) ) ( not ( = ?auto_92848 ?auto_92854 ) ) ( not ( = ?auto_92849 ?auto_92850 ) ) ( not ( = ?auto_92849 ?auto_92851 ) ) ( not ( = ?auto_92849 ?auto_92852 ) ) ( not ( = ?auto_92849 ?auto_92853 ) ) ( not ( = ?auto_92849 ?auto_92854 ) ) ( not ( = ?auto_92850 ?auto_92851 ) ) ( not ( = ?auto_92850 ?auto_92852 ) ) ( not ( = ?auto_92850 ?auto_92853 ) ) ( not ( = ?auto_92850 ?auto_92854 ) ) ( not ( = ?auto_92851 ?auto_92852 ) ) ( not ( = ?auto_92851 ?auto_92853 ) ) ( not ( = ?auto_92851 ?auto_92854 ) ) ( not ( = ?auto_92852 ?auto_92853 ) ) ( not ( = ?auto_92852 ?auto_92854 ) ) ( not ( = ?auto_92853 ?auto_92854 ) ) ( ON ?auto_92848 ?auto_92855 ) ( not ( = ?auto_92848 ?auto_92855 ) ) ( not ( = ?auto_92849 ?auto_92855 ) ) ( not ( = ?auto_92850 ?auto_92855 ) ) ( not ( = ?auto_92851 ?auto_92855 ) ) ( not ( = ?auto_92852 ?auto_92855 ) ) ( not ( = ?auto_92853 ?auto_92855 ) ) ( not ( = ?auto_92854 ?auto_92855 ) ) ( ON ?auto_92849 ?auto_92848 ) ( ON-TABLE ?auto_92855 ) ( ON ?auto_92850 ?auto_92849 ) ( ON ?auto_92851 ?auto_92850 ) ( ON ?auto_92852 ?auto_92851 ) ( ON ?auto_92853 ?auto_92852 ) ( CLEAR ?auto_92853 ) ( HOLDING ?auto_92854 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92854 )
      ( MAKE-7PILE ?auto_92848 ?auto_92849 ?auto_92850 ?auto_92851 ?auto_92852 ?auto_92853 ?auto_92854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92856 - BLOCK
      ?auto_92857 - BLOCK
      ?auto_92858 - BLOCK
      ?auto_92859 - BLOCK
      ?auto_92860 - BLOCK
      ?auto_92861 - BLOCK
      ?auto_92862 - BLOCK
    )
    :vars
    (
      ?auto_92863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92856 ?auto_92857 ) ) ( not ( = ?auto_92856 ?auto_92858 ) ) ( not ( = ?auto_92856 ?auto_92859 ) ) ( not ( = ?auto_92856 ?auto_92860 ) ) ( not ( = ?auto_92856 ?auto_92861 ) ) ( not ( = ?auto_92856 ?auto_92862 ) ) ( not ( = ?auto_92857 ?auto_92858 ) ) ( not ( = ?auto_92857 ?auto_92859 ) ) ( not ( = ?auto_92857 ?auto_92860 ) ) ( not ( = ?auto_92857 ?auto_92861 ) ) ( not ( = ?auto_92857 ?auto_92862 ) ) ( not ( = ?auto_92858 ?auto_92859 ) ) ( not ( = ?auto_92858 ?auto_92860 ) ) ( not ( = ?auto_92858 ?auto_92861 ) ) ( not ( = ?auto_92858 ?auto_92862 ) ) ( not ( = ?auto_92859 ?auto_92860 ) ) ( not ( = ?auto_92859 ?auto_92861 ) ) ( not ( = ?auto_92859 ?auto_92862 ) ) ( not ( = ?auto_92860 ?auto_92861 ) ) ( not ( = ?auto_92860 ?auto_92862 ) ) ( not ( = ?auto_92861 ?auto_92862 ) ) ( ON ?auto_92856 ?auto_92863 ) ( not ( = ?auto_92856 ?auto_92863 ) ) ( not ( = ?auto_92857 ?auto_92863 ) ) ( not ( = ?auto_92858 ?auto_92863 ) ) ( not ( = ?auto_92859 ?auto_92863 ) ) ( not ( = ?auto_92860 ?auto_92863 ) ) ( not ( = ?auto_92861 ?auto_92863 ) ) ( not ( = ?auto_92862 ?auto_92863 ) ) ( ON ?auto_92857 ?auto_92856 ) ( ON-TABLE ?auto_92863 ) ( ON ?auto_92858 ?auto_92857 ) ( ON ?auto_92859 ?auto_92858 ) ( ON ?auto_92860 ?auto_92859 ) ( ON ?auto_92861 ?auto_92860 ) ( ON ?auto_92862 ?auto_92861 ) ( CLEAR ?auto_92862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92863 ?auto_92856 ?auto_92857 ?auto_92858 ?auto_92859 ?auto_92860 ?auto_92861 )
      ( MAKE-7PILE ?auto_92856 ?auto_92857 ?auto_92858 ?auto_92859 ?auto_92860 ?auto_92861 ?auto_92862 ) )
  )

)

