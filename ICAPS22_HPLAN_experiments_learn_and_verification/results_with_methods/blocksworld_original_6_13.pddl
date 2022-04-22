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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63013 - BLOCK
      ?auto_63014 - BLOCK
      ?auto_63015 - BLOCK
      ?auto_63016 - BLOCK
      ?auto_63017 - BLOCK
      ?auto_63018 - BLOCK
    )
    :vars
    (
      ?auto_63019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63019 ?auto_63018 ) ( CLEAR ?auto_63019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63013 ) ( ON ?auto_63014 ?auto_63013 ) ( ON ?auto_63015 ?auto_63014 ) ( ON ?auto_63016 ?auto_63015 ) ( ON ?auto_63017 ?auto_63016 ) ( ON ?auto_63018 ?auto_63017 ) ( not ( = ?auto_63013 ?auto_63014 ) ) ( not ( = ?auto_63013 ?auto_63015 ) ) ( not ( = ?auto_63013 ?auto_63016 ) ) ( not ( = ?auto_63013 ?auto_63017 ) ) ( not ( = ?auto_63013 ?auto_63018 ) ) ( not ( = ?auto_63013 ?auto_63019 ) ) ( not ( = ?auto_63014 ?auto_63015 ) ) ( not ( = ?auto_63014 ?auto_63016 ) ) ( not ( = ?auto_63014 ?auto_63017 ) ) ( not ( = ?auto_63014 ?auto_63018 ) ) ( not ( = ?auto_63014 ?auto_63019 ) ) ( not ( = ?auto_63015 ?auto_63016 ) ) ( not ( = ?auto_63015 ?auto_63017 ) ) ( not ( = ?auto_63015 ?auto_63018 ) ) ( not ( = ?auto_63015 ?auto_63019 ) ) ( not ( = ?auto_63016 ?auto_63017 ) ) ( not ( = ?auto_63016 ?auto_63018 ) ) ( not ( = ?auto_63016 ?auto_63019 ) ) ( not ( = ?auto_63017 ?auto_63018 ) ) ( not ( = ?auto_63017 ?auto_63019 ) ) ( not ( = ?auto_63018 ?auto_63019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63019 ?auto_63018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63021 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63021 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_63021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63022 - BLOCK
    )
    :vars
    (
      ?auto_63023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63022 ?auto_63023 ) ( CLEAR ?auto_63022 ) ( HAND-EMPTY ) ( not ( = ?auto_63022 ?auto_63023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63022 ?auto_63023 )
      ( MAKE-1PILE ?auto_63022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63029 - BLOCK
      ?auto_63030 - BLOCK
      ?auto_63031 - BLOCK
      ?auto_63032 - BLOCK
      ?auto_63033 - BLOCK
    )
    :vars
    (
      ?auto_63034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63034 ?auto_63033 ) ( CLEAR ?auto_63034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63029 ) ( ON ?auto_63030 ?auto_63029 ) ( ON ?auto_63031 ?auto_63030 ) ( ON ?auto_63032 ?auto_63031 ) ( ON ?auto_63033 ?auto_63032 ) ( not ( = ?auto_63029 ?auto_63030 ) ) ( not ( = ?auto_63029 ?auto_63031 ) ) ( not ( = ?auto_63029 ?auto_63032 ) ) ( not ( = ?auto_63029 ?auto_63033 ) ) ( not ( = ?auto_63029 ?auto_63034 ) ) ( not ( = ?auto_63030 ?auto_63031 ) ) ( not ( = ?auto_63030 ?auto_63032 ) ) ( not ( = ?auto_63030 ?auto_63033 ) ) ( not ( = ?auto_63030 ?auto_63034 ) ) ( not ( = ?auto_63031 ?auto_63032 ) ) ( not ( = ?auto_63031 ?auto_63033 ) ) ( not ( = ?auto_63031 ?auto_63034 ) ) ( not ( = ?auto_63032 ?auto_63033 ) ) ( not ( = ?auto_63032 ?auto_63034 ) ) ( not ( = ?auto_63033 ?auto_63034 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63034 ?auto_63033 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63035 - BLOCK
      ?auto_63036 - BLOCK
      ?auto_63037 - BLOCK
      ?auto_63038 - BLOCK
      ?auto_63039 - BLOCK
    )
    :vars
    (
      ?auto_63040 - BLOCK
      ?auto_63041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63040 ?auto_63039 ) ( CLEAR ?auto_63040 ) ( ON-TABLE ?auto_63035 ) ( ON ?auto_63036 ?auto_63035 ) ( ON ?auto_63037 ?auto_63036 ) ( ON ?auto_63038 ?auto_63037 ) ( ON ?auto_63039 ?auto_63038 ) ( not ( = ?auto_63035 ?auto_63036 ) ) ( not ( = ?auto_63035 ?auto_63037 ) ) ( not ( = ?auto_63035 ?auto_63038 ) ) ( not ( = ?auto_63035 ?auto_63039 ) ) ( not ( = ?auto_63035 ?auto_63040 ) ) ( not ( = ?auto_63036 ?auto_63037 ) ) ( not ( = ?auto_63036 ?auto_63038 ) ) ( not ( = ?auto_63036 ?auto_63039 ) ) ( not ( = ?auto_63036 ?auto_63040 ) ) ( not ( = ?auto_63037 ?auto_63038 ) ) ( not ( = ?auto_63037 ?auto_63039 ) ) ( not ( = ?auto_63037 ?auto_63040 ) ) ( not ( = ?auto_63038 ?auto_63039 ) ) ( not ( = ?auto_63038 ?auto_63040 ) ) ( not ( = ?auto_63039 ?auto_63040 ) ) ( HOLDING ?auto_63041 ) ( not ( = ?auto_63035 ?auto_63041 ) ) ( not ( = ?auto_63036 ?auto_63041 ) ) ( not ( = ?auto_63037 ?auto_63041 ) ) ( not ( = ?auto_63038 ?auto_63041 ) ) ( not ( = ?auto_63039 ?auto_63041 ) ) ( not ( = ?auto_63040 ?auto_63041 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_63041 )
      ( MAKE-5PILE ?auto_63035 ?auto_63036 ?auto_63037 ?auto_63038 ?auto_63039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63042 - BLOCK
      ?auto_63043 - BLOCK
      ?auto_63044 - BLOCK
      ?auto_63045 - BLOCK
      ?auto_63046 - BLOCK
    )
    :vars
    (
      ?auto_63047 - BLOCK
      ?auto_63048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63047 ?auto_63046 ) ( ON-TABLE ?auto_63042 ) ( ON ?auto_63043 ?auto_63042 ) ( ON ?auto_63044 ?auto_63043 ) ( ON ?auto_63045 ?auto_63044 ) ( ON ?auto_63046 ?auto_63045 ) ( not ( = ?auto_63042 ?auto_63043 ) ) ( not ( = ?auto_63042 ?auto_63044 ) ) ( not ( = ?auto_63042 ?auto_63045 ) ) ( not ( = ?auto_63042 ?auto_63046 ) ) ( not ( = ?auto_63042 ?auto_63047 ) ) ( not ( = ?auto_63043 ?auto_63044 ) ) ( not ( = ?auto_63043 ?auto_63045 ) ) ( not ( = ?auto_63043 ?auto_63046 ) ) ( not ( = ?auto_63043 ?auto_63047 ) ) ( not ( = ?auto_63044 ?auto_63045 ) ) ( not ( = ?auto_63044 ?auto_63046 ) ) ( not ( = ?auto_63044 ?auto_63047 ) ) ( not ( = ?auto_63045 ?auto_63046 ) ) ( not ( = ?auto_63045 ?auto_63047 ) ) ( not ( = ?auto_63046 ?auto_63047 ) ) ( not ( = ?auto_63042 ?auto_63048 ) ) ( not ( = ?auto_63043 ?auto_63048 ) ) ( not ( = ?auto_63044 ?auto_63048 ) ) ( not ( = ?auto_63045 ?auto_63048 ) ) ( not ( = ?auto_63046 ?auto_63048 ) ) ( not ( = ?auto_63047 ?auto_63048 ) ) ( ON ?auto_63048 ?auto_63047 ) ( CLEAR ?auto_63048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63042 ?auto_63043 ?auto_63044 ?auto_63045 ?auto_63046 ?auto_63047 )
      ( MAKE-5PILE ?auto_63042 ?auto_63043 ?auto_63044 ?auto_63045 ?auto_63046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63051 - BLOCK
      ?auto_63052 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63052 ) ( CLEAR ?auto_63051 ) ( ON-TABLE ?auto_63051 ) ( not ( = ?auto_63051 ?auto_63052 ) ) )
    :subtasks
    ( ( !STACK ?auto_63052 ?auto_63051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63053 - BLOCK
      ?auto_63054 - BLOCK
    )
    :vars
    (
      ?auto_63055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63053 ) ( ON-TABLE ?auto_63053 ) ( not ( = ?auto_63053 ?auto_63054 ) ) ( ON ?auto_63054 ?auto_63055 ) ( CLEAR ?auto_63054 ) ( HAND-EMPTY ) ( not ( = ?auto_63053 ?auto_63055 ) ) ( not ( = ?auto_63054 ?auto_63055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63054 ?auto_63055 )
      ( MAKE-2PILE ?auto_63053 ?auto_63054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63056 - BLOCK
      ?auto_63057 - BLOCK
    )
    :vars
    (
      ?auto_63058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63056 ?auto_63057 ) ) ( ON ?auto_63057 ?auto_63058 ) ( CLEAR ?auto_63057 ) ( not ( = ?auto_63056 ?auto_63058 ) ) ( not ( = ?auto_63057 ?auto_63058 ) ) ( HOLDING ?auto_63056 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63056 )
      ( MAKE-2PILE ?auto_63056 ?auto_63057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63059 - BLOCK
      ?auto_63060 - BLOCK
    )
    :vars
    (
      ?auto_63061 - BLOCK
      ?auto_63065 - BLOCK
      ?auto_63064 - BLOCK
      ?auto_63062 - BLOCK
      ?auto_63063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63059 ?auto_63060 ) ) ( ON ?auto_63060 ?auto_63061 ) ( not ( = ?auto_63059 ?auto_63061 ) ) ( not ( = ?auto_63060 ?auto_63061 ) ) ( ON ?auto_63059 ?auto_63060 ) ( CLEAR ?auto_63059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63065 ) ( ON ?auto_63064 ?auto_63065 ) ( ON ?auto_63062 ?auto_63064 ) ( ON ?auto_63063 ?auto_63062 ) ( ON ?auto_63061 ?auto_63063 ) ( not ( = ?auto_63065 ?auto_63064 ) ) ( not ( = ?auto_63065 ?auto_63062 ) ) ( not ( = ?auto_63065 ?auto_63063 ) ) ( not ( = ?auto_63065 ?auto_63061 ) ) ( not ( = ?auto_63065 ?auto_63060 ) ) ( not ( = ?auto_63065 ?auto_63059 ) ) ( not ( = ?auto_63064 ?auto_63062 ) ) ( not ( = ?auto_63064 ?auto_63063 ) ) ( not ( = ?auto_63064 ?auto_63061 ) ) ( not ( = ?auto_63064 ?auto_63060 ) ) ( not ( = ?auto_63064 ?auto_63059 ) ) ( not ( = ?auto_63062 ?auto_63063 ) ) ( not ( = ?auto_63062 ?auto_63061 ) ) ( not ( = ?auto_63062 ?auto_63060 ) ) ( not ( = ?auto_63062 ?auto_63059 ) ) ( not ( = ?auto_63063 ?auto_63061 ) ) ( not ( = ?auto_63063 ?auto_63060 ) ) ( not ( = ?auto_63063 ?auto_63059 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63065 ?auto_63064 ?auto_63062 ?auto_63063 ?auto_63061 ?auto_63060 )
      ( MAKE-2PILE ?auto_63059 ?auto_63060 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63070 - BLOCK
      ?auto_63071 - BLOCK
      ?auto_63072 - BLOCK
      ?auto_63073 - BLOCK
    )
    :vars
    (
      ?auto_63074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63074 ?auto_63073 ) ( CLEAR ?auto_63074 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63070 ) ( ON ?auto_63071 ?auto_63070 ) ( ON ?auto_63072 ?auto_63071 ) ( ON ?auto_63073 ?auto_63072 ) ( not ( = ?auto_63070 ?auto_63071 ) ) ( not ( = ?auto_63070 ?auto_63072 ) ) ( not ( = ?auto_63070 ?auto_63073 ) ) ( not ( = ?auto_63070 ?auto_63074 ) ) ( not ( = ?auto_63071 ?auto_63072 ) ) ( not ( = ?auto_63071 ?auto_63073 ) ) ( not ( = ?auto_63071 ?auto_63074 ) ) ( not ( = ?auto_63072 ?auto_63073 ) ) ( not ( = ?auto_63072 ?auto_63074 ) ) ( not ( = ?auto_63073 ?auto_63074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63074 ?auto_63073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63075 - BLOCK
      ?auto_63076 - BLOCK
      ?auto_63077 - BLOCK
      ?auto_63078 - BLOCK
    )
    :vars
    (
      ?auto_63079 - BLOCK
      ?auto_63080 - BLOCK
      ?auto_63081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63079 ?auto_63078 ) ( CLEAR ?auto_63079 ) ( ON-TABLE ?auto_63075 ) ( ON ?auto_63076 ?auto_63075 ) ( ON ?auto_63077 ?auto_63076 ) ( ON ?auto_63078 ?auto_63077 ) ( not ( = ?auto_63075 ?auto_63076 ) ) ( not ( = ?auto_63075 ?auto_63077 ) ) ( not ( = ?auto_63075 ?auto_63078 ) ) ( not ( = ?auto_63075 ?auto_63079 ) ) ( not ( = ?auto_63076 ?auto_63077 ) ) ( not ( = ?auto_63076 ?auto_63078 ) ) ( not ( = ?auto_63076 ?auto_63079 ) ) ( not ( = ?auto_63077 ?auto_63078 ) ) ( not ( = ?auto_63077 ?auto_63079 ) ) ( not ( = ?auto_63078 ?auto_63079 ) ) ( HOLDING ?auto_63080 ) ( CLEAR ?auto_63081 ) ( not ( = ?auto_63075 ?auto_63080 ) ) ( not ( = ?auto_63075 ?auto_63081 ) ) ( not ( = ?auto_63076 ?auto_63080 ) ) ( not ( = ?auto_63076 ?auto_63081 ) ) ( not ( = ?auto_63077 ?auto_63080 ) ) ( not ( = ?auto_63077 ?auto_63081 ) ) ( not ( = ?auto_63078 ?auto_63080 ) ) ( not ( = ?auto_63078 ?auto_63081 ) ) ( not ( = ?auto_63079 ?auto_63080 ) ) ( not ( = ?auto_63079 ?auto_63081 ) ) ( not ( = ?auto_63080 ?auto_63081 ) ) )
    :subtasks
    ( ( !STACK ?auto_63080 ?auto_63081 )
      ( MAKE-4PILE ?auto_63075 ?auto_63076 ?auto_63077 ?auto_63078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63082 - BLOCK
      ?auto_63083 - BLOCK
      ?auto_63084 - BLOCK
      ?auto_63085 - BLOCK
    )
    :vars
    (
      ?auto_63086 - BLOCK
      ?auto_63087 - BLOCK
      ?auto_63088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63086 ?auto_63085 ) ( ON-TABLE ?auto_63082 ) ( ON ?auto_63083 ?auto_63082 ) ( ON ?auto_63084 ?auto_63083 ) ( ON ?auto_63085 ?auto_63084 ) ( not ( = ?auto_63082 ?auto_63083 ) ) ( not ( = ?auto_63082 ?auto_63084 ) ) ( not ( = ?auto_63082 ?auto_63085 ) ) ( not ( = ?auto_63082 ?auto_63086 ) ) ( not ( = ?auto_63083 ?auto_63084 ) ) ( not ( = ?auto_63083 ?auto_63085 ) ) ( not ( = ?auto_63083 ?auto_63086 ) ) ( not ( = ?auto_63084 ?auto_63085 ) ) ( not ( = ?auto_63084 ?auto_63086 ) ) ( not ( = ?auto_63085 ?auto_63086 ) ) ( CLEAR ?auto_63087 ) ( not ( = ?auto_63082 ?auto_63088 ) ) ( not ( = ?auto_63082 ?auto_63087 ) ) ( not ( = ?auto_63083 ?auto_63088 ) ) ( not ( = ?auto_63083 ?auto_63087 ) ) ( not ( = ?auto_63084 ?auto_63088 ) ) ( not ( = ?auto_63084 ?auto_63087 ) ) ( not ( = ?auto_63085 ?auto_63088 ) ) ( not ( = ?auto_63085 ?auto_63087 ) ) ( not ( = ?auto_63086 ?auto_63088 ) ) ( not ( = ?auto_63086 ?auto_63087 ) ) ( not ( = ?auto_63088 ?auto_63087 ) ) ( ON ?auto_63088 ?auto_63086 ) ( CLEAR ?auto_63088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63082 ?auto_63083 ?auto_63084 ?auto_63085 ?auto_63086 )
      ( MAKE-4PILE ?auto_63082 ?auto_63083 ?auto_63084 ?auto_63085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63089 - BLOCK
      ?auto_63090 - BLOCK
      ?auto_63091 - BLOCK
      ?auto_63092 - BLOCK
    )
    :vars
    (
      ?auto_63093 - BLOCK
      ?auto_63094 - BLOCK
      ?auto_63095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63093 ?auto_63092 ) ( ON-TABLE ?auto_63089 ) ( ON ?auto_63090 ?auto_63089 ) ( ON ?auto_63091 ?auto_63090 ) ( ON ?auto_63092 ?auto_63091 ) ( not ( = ?auto_63089 ?auto_63090 ) ) ( not ( = ?auto_63089 ?auto_63091 ) ) ( not ( = ?auto_63089 ?auto_63092 ) ) ( not ( = ?auto_63089 ?auto_63093 ) ) ( not ( = ?auto_63090 ?auto_63091 ) ) ( not ( = ?auto_63090 ?auto_63092 ) ) ( not ( = ?auto_63090 ?auto_63093 ) ) ( not ( = ?auto_63091 ?auto_63092 ) ) ( not ( = ?auto_63091 ?auto_63093 ) ) ( not ( = ?auto_63092 ?auto_63093 ) ) ( not ( = ?auto_63089 ?auto_63094 ) ) ( not ( = ?auto_63089 ?auto_63095 ) ) ( not ( = ?auto_63090 ?auto_63094 ) ) ( not ( = ?auto_63090 ?auto_63095 ) ) ( not ( = ?auto_63091 ?auto_63094 ) ) ( not ( = ?auto_63091 ?auto_63095 ) ) ( not ( = ?auto_63092 ?auto_63094 ) ) ( not ( = ?auto_63092 ?auto_63095 ) ) ( not ( = ?auto_63093 ?auto_63094 ) ) ( not ( = ?auto_63093 ?auto_63095 ) ) ( not ( = ?auto_63094 ?auto_63095 ) ) ( ON ?auto_63094 ?auto_63093 ) ( CLEAR ?auto_63094 ) ( HOLDING ?auto_63095 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63095 )
      ( MAKE-4PILE ?auto_63089 ?auto_63090 ?auto_63091 ?auto_63092 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63096 - BLOCK
      ?auto_63097 - BLOCK
      ?auto_63098 - BLOCK
      ?auto_63099 - BLOCK
    )
    :vars
    (
      ?auto_63102 - BLOCK
      ?auto_63101 - BLOCK
      ?auto_63100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63102 ?auto_63099 ) ( ON-TABLE ?auto_63096 ) ( ON ?auto_63097 ?auto_63096 ) ( ON ?auto_63098 ?auto_63097 ) ( ON ?auto_63099 ?auto_63098 ) ( not ( = ?auto_63096 ?auto_63097 ) ) ( not ( = ?auto_63096 ?auto_63098 ) ) ( not ( = ?auto_63096 ?auto_63099 ) ) ( not ( = ?auto_63096 ?auto_63102 ) ) ( not ( = ?auto_63097 ?auto_63098 ) ) ( not ( = ?auto_63097 ?auto_63099 ) ) ( not ( = ?auto_63097 ?auto_63102 ) ) ( not ( = ?auto_63098 ?auto_63099 ) ) ( not ( = ?auto_63098 ?auto_63102 ) ) ( not ( = ?auto_63099 ?auto_63102 ) ) ( not ( = ?auto_63096 ?auto_63101 ) ) ( not ( = ?auto_63096 ?auto_63100 ) ) ( not ( = ?auto_63097 ?auto_63101 ) ) ( not ( = ?auto_63097 ?auto_63100 ) ) ( not ( = ?auto_63098 ?auto_63101 ) ) ( not ( = ?auto_63098 ?auto_63100 ) ) ( not ( = ?auto_63099 ?auto_63101 ) ) ( not ( = ?auto_63099 ?auto_63100 ) ) ( not ( = ?auto_63102 ?auto_63101 ) ) ( not ( = ?auto_63102 ?auto_63100 ) ) ( not ( = ?auto_63101 ?auto_63100 ) ) ( ON ?auto_63101 ?auto_63102 ) ( ON ?auto_63100 ?auto_63101 ) ( CLEAR ?auto_63100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63096 ?auto_63097 ?auto_63098 ?auto_63099 ?auto_63102 ?auto_63101 )
      ( MAKE-4PILE ?auto_63096 ?auto_63097 ?auto_63098 ?auto_63099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63106 - BLOCK
      ?auto_63107 - BLOCK
      ?auto_63108 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63108 ) ( CLEAR ?auto_63107 ) ( ON-TABLE ?auto_63106 ) ( ON ?auto_63107 ?auto_63106 ) ( not ( = ?auto_63106 ?auto_63107 ) ) ( not ( = ?auto_63106 ?auto_63108 ) ) ( not ( = ?auto_63107 ?auto_63108 ) ) )
    :subtasks
    ( ( !STACK ?auto_63108 ?auto_63107 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63109 - BLOCK
      ?auto_63110 - BLOCK
      ?auto_63111 - BLOCK
    )
    :vars
    (
      ?auto_63112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63110 ) ( ON-TABLE ?auto_63109 ) ( ON ?auto_63110 ?auto_63109 ) ( not ( = ?auto_63109 ?auto_63110 ) ) ( not ( = ?auto_63109 ?auto_63111 ) ) ( not ( = ?auto_63110 ?auto_63111 ) ) ( ON ?auto_63111 ?auto_63112 ) ( CLEAR ?auto_63111 ) ( HAND-EMPTY ) ( not ( = ?auto_63109 ?auto_63112 ) ) ( not ( = ?auto_63110 ?auto_63112 ) ) ( not ( = ?auto_63111 ?auto_63112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63111 ?auto_63112 )
      ( MAKE-3PILE ?auto_63109 ?auto_63110 ?auto_63111 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63113 - BLOCK
      ?auto_63114 - BLOCK
      ?auto_63115 - BLOCK
    )
    :vars
    (
      ?auto_63116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63113 ) ( not ( = ?auto_63113 ?auto_63114 ) ) ( not ( = ?auto_63113 ?auto_63115 ) ) ( not ( = ?auto_63114 ?auto_63115 ) ) ( ON ?auto_63115 ?auto_63116 ) ( CLEAR ?auto_63115 ) ( not ( = ?auto_63113 ?auto_63116 ) ) ( not ( = ?auto_63114 ?auto_63116 ) ) ( not ( = ?auto_63115 ?auto_63116 ) ) ( HOLDING ?auto_63114 ) ( CLEAR ?auto_63113 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63113 ?auto_63114 )
      ( MAKE-3PILE ?auto_63113 ?auto_63114 ?auto_63115 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63117 - BLOCK
      ?auto_63118 - BLOCK
      ?auto_63119 - BLOCK
    )
    :vars
    (
      ?auto_63120 - BLOCK
      ?auto_63121 - BLOCK
      ?auto_63122 - BLOCK
      ?auto_63123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63117 ) ( not ( = ?auto_63117 ?auto_63118 ) ) ( not ( = ?auto_63117 ?auto_63119 ) ) ( not ( = ?auto_63118 ?auto_63119 ) ) ( ON ?auto_63119 ?auto_63120 ) ( not ( = ?auto_63117 ?auto_63120 ) ) ( not ( = ?auto_63118 ?auto_63120 ) ) ( not ( = ?auto_63119 ?auto_63120 ) ) ( CLEAR ?auto_63117 ) ( ON ?auto_63118 ?auto_63119 ) ( CLEAR ?auto_63118 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63121 ) ( ON ?auto_63122 ?auto_63121 ) ( ON ?auto_63123 ?auto_63122 ) ( ON ?auto_63120 ?auto_63123 ) ( not ( = ?auto_63121 ?auto_63122 ) ) ( not ( = ?auto_63121 ?auto_63123 ) ) ( not ( = ?auto_63121 ?auto_63120 ) ) ( not ( = ?auto_63121 ?auto_63119 ) ) ( not ( = ?auto_63121 ?auto_63118 ) ) ( not ( = ?auto_63122 ?auto_63123 ) ) ( not ( = ?auto_63122 ?auto_63120 ) ) ( not ( = ?auto_63122 ?auto_63119 ) ) ( not ( = ?auto_63122 ?auto_63118 ) ) ( not ( = ?auto_63123 ?auto_63120 ) ) ( not ( = ?auto_63123 ?auto_63119 ) ) ( not ( = ?auto_63123 ?auto_63118 ) ) ( not ( = ?auto_63117 ?auto_63121 ) ) ( not ( = ?auto_63117 ?auto_63122 ) ) ( not ( = ?auto_63117 ?auto_63123 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63121 ?auto_63122 ?auto_63123 ?auto_63120 ?auto_63119 )
      ( MAKE-3PILE ?auto_63117 ?auto_63118 ?auto_63119 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63124 - BLOCK
      ?auto_63125 - BLOCK
      ?auto_63126 - BLOCK
    )
    :vars
    (
      ?auto_63130 - BLOCK
      ?auto_63129 - BLOCK
      ?auto_63127 - BLOCK
      ?auto_63128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63124 ?auto_63125 ) ) ( not ( = ?auto_63124 ?auto_63126 ) ) ( not ( = ?auto_63125 ?auto_63126 ) ) ( ON ?auto_63126 ?auto_63130 ) ( not ( = ?auto_63124 ?auto_63130 ) ) ( not ( = ?auto_63125 ?auto_63130 ) ) ( not ( = ?auto_63126 ?auto_63130 ) ) ( ON ?auto_63125 ?auto_63126 ) ( CLEAR ?auto_63125 ) ( ON-TABLE ?auto_63129 ) ( ON ?auto_63127 ?auto_63129 ) ( ON ?auto_63128 ?auto_63127 ) ( ON ?auto_63130 ?auto_63128 ) ( not ( = ?auto_63129 ?auto_63127 ) ) ( not ( = ?auto_63129 ?auto_63128 ) ) ( not ( = ?auto_63129 ?auto_63130 ) ) ( not ( = ?auto_63129 ?auto_63126 ) ) ( not ( = ?auto_63129 ?auto_63125 ) ) ( not ( = ?auto_63127 ?auto_63128 ) ) ( not ( = ?auto_63127 ?auto_63130 ) ) ( not ( = ?auto_63127 ?auto_63126 ) ) ( not ( = ?auto_63127 ?auto_63125 ) ) ( not ( = ?auto_63128 ?auto_63130 ) ) ( not ( = ?auto_63128 ?auto_63126 ) ) ( not ( = ?auto_63128 ?auto_63125 ) ) ( not ( = ?auto_63124 ?auto_63129 ) ) ( not ( = ?auto_63124 ?auto_63127 ) ) ( not ( = ?auto_63124 ?auto_63128 ) ) ( HOLDING ?auto_63124 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63124 )
      ( MAKE-3PILE ?auto_63124 ?auto_63125 ?auto_63126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63131 - BLOCK
      ?auto_63132 - BLOCK
      ?auto_63133 - BLOCK
    )
    :vars
    (
      ?auto_63135 - BLOCK
      ?auto_63136 - BLOCK
      ?auto_63134 - BLOCK
      ?auto_63137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63131 ?auto_63132 ) ) ( not ( = ?auto_63131 ?auto_63133 ) ) ( not ( = ?auto_63132 ?auto_63133 ) ) ( ON ?auto_63133 ?auto_63135 ) ( not ( = ?auto_63131 ?auto_63135 ) ) ( not ( = ?auto_63132 ?auto_63135 ) ) ( not ( = ?auto_63133 ?auto_63135 ) ) ( ON ?auto_63132 ?auto_63133 ) ( ON-TABLE ?auto_63136 ) ( ON ?auto_63134 ?auto_63136 ) ( ON ?auto_63137 ?auto_63134 ) ( ON ?auto_63135 ?auto_63137 ) ( not ( = ?auto_63136 ?auto_63134 ) ) ( not ( = ?auto_63136 ?auto_63137 ) ) ( not ( = ?auto_63136 ?auto_63135 ) ) ( not ( = ?auto_63136 ?auto_63133 ) ) ( not ( = ?auto_63136 ?auto_63132 ) ) ( not ( = ?auto_63134 ?auto_63137 ) ) ( not ( = ?auto_63134 ?auto_63135 ) ) ( not ( = ?auto_63134 ?auto_63133 ) ) ( not ( = ?auto_63134 ?auto_63132 ) ) ( not ( = ?auto_63137 ?auto_63135 ) ) ( not ( = ?auto_63137 ?auto_63133 ) ) ( not ( = ?auto_63137 ?auto_63132 ) ) ( not ( = ?auto_63131 ?auto_63136 ) ) ( not ( = ?auto_63131 ?auto_63134 ) ) ( not ( = ?auto_63131 ?auto_63137 ) ) ( ON ?auto_63131 ?auto_63132 ) ( CLEAR ?auto_63131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63136 ?auto_63134 ?auto_63137 ?auto_63135 ?auto_63133 ?auto_63132 )
      ( MAKE-3PILE ?auto_63131 ?auto_63132 ?auto_63133 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63141 - BLOCK
      ?auto_63142 - BLOCK
      ?auto_63143 - BLOCK
    )
    :vars
    (
      ?auto_63144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63144 ?auto_63143 ) ( CLEAR ?auto_63144 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63141 ) ( ON ?auto_63142 ?auto_63141 ) ( ON ?auto_63143 ?auto_63142 ) ( not ( = ?auto_63141 ?auto_63142 ) ) ( not ( = ?auto_63141 ?auto_63143 ) ) ( not ( = ?auto_63141 ?auto_63144 ) ) ( not ( = ?auto_63142 ?auto_63143 ) ) ( not ( = ?auto_63142 ?auto_63144 ) ) ( not ( = ?auto_63143 ?auto_63144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63144 ?auto_63143 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63145 - BLOCK
      ?auto_63146 - BLOCK
      ?auto_63147 - BLOCK
    )
    :vars
    (
      ?auto_63148 - BLOCK
      ?auto_63149 - BLOCK
      ?auto_63150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63148 ?auto_63147 ) ( CLEAR ?auto_63148 ) ( ON-TABLE ?auto_63145 ) ( ON ?auto_63146 ?auto_63145 ) ( ON ?auto_63147 ?auto_63146 ) ( not ( = ?auto_63145 ?auto_63146 ) ) ( not ( = ?auto_63145 ?auto_63147 ) ) ( not ( = ?auto_63145 ?auto_63148 ) ) ( not ( = ?auto_63146 ?auto_63147 ) ) ( not ( = ?auto_63146 ?auto_63148 ) ) ( not ( = ?auto_63147 ?auto_63148 ) ) ( HOLDING ?auto_63149 ) ( CLEAR ?auto_63150 ) ( not ( = ?auto_63145 ?auto_63149 ) ) ( not ( = ?auto_63145 ?auto_63150 ) ) ( not ( = ?auto_63146 ?auto_63149 ) ) ( not ( = ?auto_63146 ?auto_63150 ) ) ( not ( = ?auto_63147 ?auto_63149 ) ) ( not ( = ?auto_63147 ?auto_63150 ) ) ( not ( = ?auto_63148 ?auto_63149 ) ) ( not ( = ?auto_63148 ?auto_63150 ) ) ( not ( = ?auto_63149 ?auto_63150 ) ) )
    :subtasks
    ( ( !STACK ?auto_63149 ?auto_63150 )
      ( MAKE-3PILE ?auto_63145 ?auto_63146 ?auto_63147 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63151 - BLOCK
      ?auto_63152 - BLOCK
      ?auto_63153 - BLOCK
    )
    :vars
    (
      ?auto_63156 - BLOCK
      ?auto_63154 - BLOCK
      ?auto_63155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63156 ?auto_63153 ) ( ON-TABLE ?auto_63151 ) ( ON ?auto_63152 ?auto_63151 ) ( ON ?auto_63153 ?auto_63152 ) ( not ( = ?auto_63151 ?auto_63152 ) ) ( not ( = ?auto_63151 ?auto_63153 ) ) ( not ( = ?auto_63151 ?auto_63156 ) ) ( not ( = ?auto_63152 ?auto_63153 ) ) ( not ( = ?auto_63152 ?auto_63156 ) ) ( not ( = ?auto_63153 ?auto_63156 ) ) ( CLEAR ?auto_63154 ) ( not ( = ?auto_63151 ?auto_63155 ) ) ( not ( = ?auto_63151 ?auto_63154 ) ) ( not ( = ?auto_63152 ?auto_63155 ) ) ( not ( = ?auto_63152 ?auto_63154 ) ) ( not ( = ?auto_63153 ?auto_63155 ) ) ( not ( = ?auto_63153 ?auto_63154 ) ) ( not ( = ?auto_63156 ?auto_63155 ) ) ( not ( = ?auto_63156 ?auto_63154 ) ) ( not ( = ?auto_63155 ?auto_63154 ) ) ( ON ?auto_63155 ?auto_63156 ) ( CLEAR ?auto_63155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63151 ?auto_63152 ?auto_63153 ?auto_63156 )
      ( MAKE-3PILE ?auto_63151 ?auto_63152 ?auto_63153 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63157 - BLOCK
      ?auto_63158 - BLOCK
      ?auto_63159 - BLOCK
    )
    :vars
    (
      ?auto_63162 - BLOCK
      ?auto_63161 - BLOCK
      ?auto_63160 - BLOCK
      ?auto_63163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63162 ?auto_63159 ) ( ON-TABLE ?auto_63157 ) ( ON ?auto_63158 ?auto_63157 ) ( ON ?auto_63159 ?auto_63158 ) ( not ( = ?auto_63157 ?auto_63158 ) ) ( not ( = ?auto_63157 ?auto_63159 ) ) ( not ( = ?auto_63157 ?auto_63162 ) ) ( not ( = ?auto_63158 ?auto_63159 ) ) ( not ( = ?auto_63158 ?auto_63162 ) ) ( not ( = ?auto_63159 ?auto_63162 ) ) ( not ( = ?auto_63157 ?auto_63161 ) ) ( not ( = ?auto_63157 ?auto_63160 ) ) ( not ( = ?auto_63158 ?auto_63161 ) ) ( not ( = ?auto_63158 ?auto_63160 ) ) ( not ( = ?auto_63159 ?auto_63161 ) ) ( not ( = ?auto_63159 ?auto_63160 ) ) ( not ( = ?auto_63162 ?auto_63161 ) ) ( not ( = ?auto_63162 ?auto_63160 ) ) ( not ( = ?auto_63161 ?auto_63160 ) ) ( ON ?auto_63161 ?auto_63162 ) ( CLEAR ?auto_63161 ) ( HOLDING ?auto_63160 ) ( CLEAR ?auto_63163 ) ( ON-TABLE ?auto_63163 ) ( not ( = ?auto_63163 ?auto_63160 ) ) ( not ( = ?auto_63157 ?auto_63163 ) ) ( not ( = ?auto_63158 ?auto_63163 ) ) ( not ( = ?auto_63159 ?auto_63163 ) ) ( not ( = ?auto_63162 ?auto_63163 ) ) ( not ( = ?auto_63161 ?auto_63163 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63163 ?auto_63160 )
      ( MAKE-3PILE ?auto_63157 ?auto_63158 ?auto_63159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63164 - BLOCK
      ?auto_63165 - BLOCK
      ?auto_63166 - BLOCK
    )
    :vars
    (
      ?auto_63167 - BLOCK
      ?auto_63168 - BLOCK
      ?auto_63170 - BLOCK
      ?auto_63169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63167 ?auto_63166 ) ( ON-TABLE ?auto_63164 ) ( ON ?auto_63165 ?auto_63164 ) ( ON ?auto_63166 ?auto_63165 ) ( not ( = ?auto_63164 ?auto_63165 ) ) ( not ( = ?auto_63164 ?auto_63166 ) ) ( not ( = ?auto_63164 ?auto_63167 ) ) ( not ( = ?auto_63165 ?auto_63166 ) ) ( not ( = ?auto_63165 ?auto_63167 ) ) ( not ( = ?auto_63166 ?auto_63167 ) ) ( not ( = ?auto_63164 ?auto_63168 ) ) ( not ( = ?auto_63164 ?auto_63170 ) ) ( not ( = ?auto_63165 ?auto_63168 ) ) ( not ( = ?auto_63165 ?auto_63170 ) ) ( not ( = ?auto_63166 ?auto_63168 ) ) ( not ( = ?auto_63166 ?auto_63170 ) ) ( not ( = ?auto_63167 ?auto_63168 ) ) ( not ( = ?auto_63167 ?auto_63170 ) ) ( not ( = ?auto_63168 ?auto_63170 ) ) ( ON ?auto_63168 ?auto_63167 ) ( CLEAR ?auto_63169 ) ( ON-TABLE ?auto_63169 ) ( not ( = ?auto_63169 ?auto_63170 ) ) ( not ( = ?auto_63164 ?auto_63169 ) ) ( not ( = ?auto_63165 ?auto_63169 ) ) ( not ( = ?auto_63166 ?auto_63169 ) ) ( not ( = ?auto_63167 ?auto_63169 ) ) ( not ( = ?auto_63168 ?auto_63169 ) ) ( ON ?auto_63170 ?auto_63168 ) ( CLEAR ?auto_63170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63164 ?auto_63165 ?auto_63166 ?auto_63167 ?auto_63168 )
      ( MAKE-3PILE ?auto_63164 ?auto_63165 ?auto_63166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63171 - BLOCK
      ?auto_63172 - BLOCK
      ?auto_63173 - BLOCK
    )
    :vars
    (
      ?auto_63175 - BLOCK
      ?auto_63176 - BLOCK
      ?auto_63174 - BLOCK
      ?auto_63177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63175 ?auto_63173 ) ( ON-TABLE ?auto_63171 ) ( ON ?auto_63172 ?auto_63171 ) ( ON ?auto_63173 ?auto_63172 ) ( not ( = ?auto_63171 ?auto_63172 ) ) ( not ( = ?auto_63171 ?auto_63173 ) ) ( not ( = ?auto_63171 ?auto_63175 ) ) ( not ( = ?auto_63172 ?auto_63173 ) ) ( not ( = ?auto_63172 ?auto_63175 ) ) ( not ( = ?auto_63173 ?auto_63175 ) ) ( not ( = ?auto_63171 ?auto_63176 ) ) ( not ( = ?auto_63171 ?auto_63174 ) ) ( not ( = ?auto_63172 ?auto_63176 ) ) ( not ( = ?auto_63172 ?auto_63174 ) ) ( not ( = ?auto_63173 ?auto_63176 ) ) ( not ( = ?auto_63173 ?auto_63174 ) ) ( not ( = ?auto_63175 ?auto_63176 ) ) ( not ( = ?auto_63175 ?auto_63174 ) ) ( not ( = ?auto_63176 ?auto_63174 ) ) ( ON ?auto_63176 ?auto_63175 ) ( not ( = ?auto_63177 ?auto_63174 ) ) ( not ( = ?auto_63171 ?auto_63177 ) ) ( not ( = ?auto_63172 ?auto_63177 ) ) ( not ( = ?auto_63173 ?auto_63177 ) ) ( not ( = ?auto_63175 ?auto_63177 ) ) ( not ( = ?auto_63176 ?auto_63177 ) ) ( ON ?auto_63174 ?auto_63176 ) ( CLEAR ?auto_63174 ) ( HOLDING ?auto_63177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63177 )
      ( MAKE-3PILE ?auto_63171 ?auto_63172 ?auto_63173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63178 - BLOCK
      ?auto_63179 - BLOCK
      ?auto_63180 - BLOCK
    )
    :vars
    (
      ?auto_63183 - BLOCK
      ?auto_63181 - BLOCK
      ?auto_63184 - BLOCK
      ?auto_63182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63183 ?auto_63180 ) ( ON-TABLE ?auto_63178 ) ( ON ?auto_63179 ?auto_63178 ) ( ON ?auto_63180 ?auto_63179 ) ( not ( = ?auto_63178 ?auto_63179 ) ) ( not ( = ?auto_63178 ?auto_63180 ) ) ( not ( = ?auto_63178 ?auto_63183 ) ) ( not ( = ?auto_63179 ?auto_63180 ) ) ( not ( = ?auto_63179 ?auto_63183 ) ) ( not ( = ?auto_63180 ?auto_63183 ) ) ( not ( = ?auto_63178 ?auto_63181 ) ) ( not ( = ?auto_63178 ?auto_63184 ) ) ( not ( = ?auto_63179 ?auto_63181 ) ) ( not ( = ?auto_63179 ?auto_63184 ) ) ( not ( = ?auto_63180 ?auto_63181 ) ) ( not ( = ?auto_63180 ?auto_63184 ) ) ( not ( = ?auto_63183 ?auto_63181 ) ) ( not ( = ?auto_63183 ?auto_63184 ) ) ( not ( = ?auto_63181 ?auto_63184 ) ) ( ON ?auto_63181 ?auto_63183 ) ( not ( = ?auto_63182 ?auto_63184 ) ) ( not ( = ?auto_63178 ?auto_63182 ) ) ( not ( = ?auto_63179 ?auto_63182 ) ) ( not ( = ?auto_63180 ?auto_63182 ) ) ( not ( = ?auto_63183 ?auto_63182 ) ) ( not ( = ?auto_63181 ?auto_63182 ) ) ( ON ?auto_63184 ?auto_63181 ) ( ON ?auto_63182 ?auto_63184 ) ( CLEAR ?auto_63182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63178 ?auto_63179 ?auto_63180 ?auto_63183 ?auto_63181 ?auto_63184 )
      ( MAKE-3PILE ?auto_63178 ?auto_63179 ?auto_63180 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63189 - BLOCK
      ?auto_63190 - BLOCK
      ?auto_63191 - BLOCK
      ?auto_63192 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63192 ) ( CLEAR ?auto_63191 ) ( ON-TABLE ?auto_63189 ) ( ON ?auto_63190 ?auto_63189 ) ( ON ?auto_63191 ?auto_63190 ) ( not ( = ?auto_63189 ?auto_63190 ) ) ( not ( = ?auto_63189 ?auto_63191 ) ) ( not ( = ?auto_63189 ?auto_63192 ) ) ( not ( = ?auto_63190 ?auto_63191 ) ) ( not ( = ?auto_63190 ?auto_63192 ) ) ( not ( = ?auto_63191 ?auto_63192 ) ) )
    :subtasks
    ( ( !STACK ?auto_63192 ?auto_63191 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63193 - BLOCK
      ?auto_63194 - BLOCK
      ?auto_63195 - BLOCK
      ?auto_63196 - BLOCK
    )
    :vars
    (
      ?auto_63197 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63195 ) ( ON-TABLE ?auto_63193 ) ( ON ?auto_63194 ?auto_63193 ) ( ON ?auto_63195 ?auto_63194 ) ( not ( = ?auto_63193 ?auto_63194 ) ) ( not ( = ?auto_63193 ?auto_63195 ) ) ( not ( = ?auto_63193 ?auto_63196 ) ) ( not ( = ?auto_63194 ?auto_63195 ) ) ( not ( = ?auto_63194 ?auto_63196 ) ) ( not ( = ?auto_63195 ?auto_63196 ) ) ( ON ?auto_63196 ?auto_63197 ) ( CLEAR ?auto_63196 ) ( HAND-EMPTY ) ( not ( = ?auto_63193 ?auto_63197 ) ) ( not ( = ?auto_63194 ?auto_63197 ) ) ( not ( = ?auto_63195 ?auto_63197 ) ) ( not ( = ?auto_63196 ?auto_63197 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63196 ?auto_63197 )
      ( MAKE-4PILE ?auto_63193 ?auto_63194 ?auto_63195 ?auto_63196 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63198 - BLOCK
      ?auto_63199 - BLOCK
      ?auto_63200 - BLOCK
      ?auto_63201 - BLOCK
    )
    :vars
    (
      ?auto_63202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63198 ) ( ON ?auto_63199 ?auto_63198 ) ( not ( = ?auto_63198 ?auto_63199 ) ) ( not ( = ?auto_63198 ?auto_63200 ) ) ( not ( = ?auto_63198 ?auto_63201 ) ) ( not ( = ?auto_63199 ?auto_63200 ) ) ( not ( = ?auto_63199 ?auto_63201 ) ) ( not ( = ?auto_63200 ?auto_63201 ) ) ( ON ?auto_63201 ?auto_63202 ) ( CLEAR ?auto_63201 ) ( not ( = ?auto_63198 ?auto_63202 ) ) ( not ( = ?auto_63199 ?auto_63202 ) ) ( not ( = ?auto_63200 ?auto_63202 ) ) ( not ( = ?auto_63201 ?auto_63202 ) ) ( HOLDING ?auto_63200 ) ( CLEAR ?auto_63199 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63198 ?auto_63199 ?auto_63200 )
      ( MAKE-4PILE ?auto_63198 ?auto_63199 ?auto_63200 ?auto_63201 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63203 - BLOCK
      ?auto_63204 - BLOCK
      ?auto_63205 - BLOCK
      ?auto_63206 - BLOCK
    )
    :vars
    (
      ?auto_63207 - BLOCK
      ?auto_63209 - BLOCK
      ?auto_63208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63203 ) ( ON ?auto_63204 ?auto_63203 ) ( not ( = ?auto_63203 ?auto_63204 ) ) ( not ( = ?auto_63203 ?auto_63205 ) ) ( not ( = ?auto_63203 ?auto_63206 ) ) ( not ( = ?auto_63204 ?auto_63205 ) ) ( not ( = ?auto_63204 ?auto_63206 ) ) ( not ( = ?auto_63205 ?auto_63206 ) ) ( ON ?auto_63206 ?auto_63207 ) ( not ( = ?auto_63203 ?auto_63207 ) ) ( not ( = ?auto_63204 ?auto_63207 ) ) ( not ( = ?auto_63205 ?auto_63207 ) ) ( not ( = ?auto_63206 ?auto_63207 ) ) ( CLEAR ?auto_63204 ) ( ON ?auto_63205 ?auto_63206 ) ( CLEAR ?auto_63205 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63209 ) ( ON ?auto_63208 ?auto_63209 ) ( ON ?auto_63207 ?auto_63208 ) ( not ( = ?auto_63209 ?auto_63208 ) ) ( not ( = ?auto_63209 ?auto_63207 ) ) ( not ( = ?auto_63209 ?auto_63206 ) ) ( not ( = ?auto_63209 ?auto_63205 ) ) ( not ( = ?auto_63208 ?auto_63207 ) ) ( not ( = ?auto_63208 ?auto_63206 ) ) ( not ( = ?auto_63208 ?auto_63205 ) ) ( not ( = ?auto_63203 ?auto_63209 ) ) ( not ( = ?auto_63203 ?auto_63208 ) ) ( not ( = ?auto_63204 ?auto_63209 ) ) ( not ( = ?auto_63204 ?auto_63208 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63209 ?auto_63208 ?auto_63207 ?auto_63206 )
      ( MAKE-4PILE ?auto_63203 ?auto_63204 ?auto_63205 ?auto_63206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63210 - BLOCK
      ?auto_63211 - BLOCK
      ?auto_63212 - BLOCK
      ?auto_63213 - BLOCK
    )
    :vars
    (
      ?auto_63216 - BLOCK
      ?auto_63214 - BLOCK
      ?auto_63215 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63210 ) ( not ( = ?auto_63210 ?auto_63211 ) ) ( not ( = ?auto_63210 ?auto_63212 ) ) ( not ( = ?auto_63210 ?auto_63213 ) ) ( not ( = ?auto_63211 ?auto_63212 ) ) ( not ( = ?auto_63211 ?auto_63213 ) ) ( not ( = ?auto_63212 ?auto_63213 ) ) ( ON ?auto_63213 ?auto_63216 ) ( not ( = ?auto_63210 ?auto_63216 ) ) ( not ( = ?auto_63211 ?auto_63216 ) ) ( not ( = ?auto_63212 ?auto_63216 ) ) ( not ( = ?auto_63213 ?auto_63216 ) ) ( ON ?auto_63212 ?auto_63213 ) ( CLEAR ?auto_63212 ) ( ON-TABLE ?auto_63214 ) ( ON ?auto_63215 ?auto_63214 ) ( ON ?auto_63216 ?auto_63215 ) ( not ( = ?auto_63214 ?auto_63215 ) ) ( not ( = ?auto_63214 ?auto_63216 ) ) ( not ( = ?auto_63214 ?auto_63213 ) ) ( not ( = ?auto_63214 ?auto_63212 ) ) ( not ( = ?auto_63215 ?auto_63216 ) ) ( not ( = ?auto_63215 ?auto_63213 ) ) ( not ( = ?auto_63215 ?auto_63212 ) ) ( not ( = ?auto_63210 ?auto_63214 ) ) ( not ( = ?auto_63210 ?auto_63215 ) ) ( not ( = ?auto_63211 ?auto_63214 ) ) ( not ( = ?auto_63211 ?auto_63215 ) ) ( HOLDING ?auto_63211 ) ( CLEAR ?auto_63210 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63210 ?auto_63211 )
      ( MAKE-4PILE ?auto_63210 ?auto_63211 ?auto_63212 ?auto_63213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63217 - BLOCK
      ?auto_63218 - BLOCK
      ?auto_63219 - BLOCK
      ?auto_63220 - BLOCK
    )
    :vars
    (
      ?auto_63223 - BLOCK
      ?auto_63222 - BLOCK
      ?auto_63221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63217 ) ( not ( = ?auto_63217 ?auto_63218 ) ) ( not ( = ?auto_63217 ?auto_63219 ) ) ( not ( = ?auto_63217 ?auto_63220 ) ) ( not ( = ?auto_63218 ?auto_63219 ) ) ( not ( = ?auto_63218 ?auto_63220 ) ) ( not ( = ?auto_63219 ?auto_63220 ) ) ( ON ?auto_63220 ?auto_63223 ) ( not ( = ?auto_63217 ?auto_63223 ) ) ( not ( = ?auto_63218 ?auto_63223 ) ) ( not ( = ?auto_63219 ?auto_63223 ) ) ( not ( = ?auto_63220 ?auto_63223 ) ) ( ON ?auto_63219 ?auto_63220 ) ( ON-TABLE ?auto_63222 ) ( ON ?auto_63221 ?auto_63222 ) ( ON ?auto_63223 ?auto_63221 ) ( not ( = ?auto_63222 ?auto_63221 ) ) ( not ( = ?auto_63222 ?auto_63223 ) ) ( not ( = ?auto_63222 ?auto_63220 ) ) ( not ( = ?auto_63222 ?auto_63219 ) ) ( not ( = ?auto_63221 ?auto_63223 ) ) ( not ( = ?auto_63221 ?auto_63220 ) ) ( not ( = ?auto_63221 ?auto_63219 ) ) ( not ( = ?auto_63217 ?auto_63222 ) ) ( not ( = ?auto_63217 ?auto_63221 ) ) ( not ( = ?auto_63218 ?auto_63222 ) ) ( not ( = ?auto_63218 ?auto_63221 ) ) ( CLEAR ?auto_63217 ) ( ON ?auto_63218 ?auto_63219 ) ( CLEAR ?auto_63218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63222 ?auto_63221 ?auto_63223 ?auto_63220 ?auto_63219 )
      ( MAKE-4PILE ?auto_63217 ?auto_63218 ?auto_63219 ?auto_63220 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63224 - BLOCK
      ?auto_63225 - BLOCK
      ?auto_63226 - BLOCK
      ?auto_63227 - BLOCK
    )
    :vars
    (
      ?auto_63230 - BLOCK
      ?auto_63228 - BLOCK
      ?auto_63229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63224 ?auto_63225 ) ) ( not ( = ?auto_63224 ?auto_63226 ) ) ( not ( = ?auto_63224 ?auto_63227 ) ) ( not ( = ?auto_63225 ?auto_63226 ) ) ( not ( = ?auto_63225 ?auto_63227 ) ) ( not ( = ?auto_63226 ?auto_63227 ) ) ( ON ?auto_63227 ?auto_63230 ) ( not ( = ?auto_63224 ?auto_63230 ) ) ( not ( = ?auto_63225 ?auto_63230 ) ) ( not ( = ?auto_63226 ?auto_63230 ) ) ( not ( = ?auto_63227 ?auto_63230 ) ) ( ON ?auto_63226 ?auto_63227 ) ( ON-TABLE ?auto_63228 ) ( ON ?auto_63229 ?auto_63228 ) ( ON ?auto_63230 ?auto_63229 ) ( not ( = ?auto_63228 ?auto_63229 ) ) ( not ( = ?auto_63228 ?auto_63230 ) ) ( not ( = ?auto_63228 ?auto_63227 ) ) ( not ( = ?auto_63228 ?auto_63226 ) ) ( not ( = ?auto_63229 ?auto_63230 ) ) ( not ( = ?auto_63229 ?auto_63227 ) ) ( not ( = ?auto_63229 ?auto_63226 ) ) ( not ( = ?auto_63224 ?auto_63228 ) ) ( not ( = ?auto_63224 ?auto_63229 ) ) ( not ( = ?auto_63225 ?auto_63228 ) ) ( not ( = ?auto_63225 ?auto_63229 ) ) ( ON ?auto_63225 ?auto_63226 ) ( CLEAR ?auto_63225 ) ( HOLDING ?auto_63224 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63224 )
      ( MAKE-4PILE ?auto_63224 ?auto_63225 ?auto_63226 ?auto_63227 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63231 - BLOCK
      ?auto_63232 - BLOCK
      ?auto_63233 - BLOCK
      ?auto_63234 - BLOCK
    )
    :vars
    (
      ?auto_63236 - BLOCK
      ?auto_63235 - BLOCK
      ?auto_63237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63231 ?auto_63232 ) ) ( not ( = ?auto_63231 ?auto_63233 ) ) ( not ( = ?auto_63231 ?auto_63234 ) ) ( not ( = ?auto_63232 ?auto_63233 ) ) ( not ( = ?auto_63232 ?auto_63234 ) ) ( not ( = ?auto_63233 ?auto_63234 ) ) ( ON ?auto_63234 ?auto_63236 ) ( not ( = ?auto_63231 ?auto_63236 ) ) ( not ( = ?auto_63232 ?auto_63236 ) ) ( not ( = ?auto_63233 ?auto_63236 ) ) ( not ( = ?auto_63234 ?auto_63236 ) ) ( ON ?auto_63233 ?auto_63234 ) ( ON-TABLE ?auto_63235 ) ( ON ?auto_63237 ?auto_63235 ) ( ON ?auto_63236 ?auto_63237 ) ( not ( = ?auto_63235 ?auto_63237 ) ) ( not ( = ?auto_63235 ?auto_63236 ) ) ( not ( = ?auto_63235 ?auto_63234 ) ) ( not ( = ?auto_63235 ?auto_63233 ) ) ( not ( = ?auto_63237 ?auto_63236 ) ) ( not ( = ?auto_63237 ?auto_63234 ) ) ( not ( = ?auto_63237 ?auto_63233 ) ) ( not ( = ?auto_63231 ?auto_63235 ) ) ( not ( = ?auto_63231 ?auto_63237 ) ) ( not ( = ?auto_63232 ?auto_63235 ) ) ( not ( = ?auto_63232 ?auto_63237 ) ) ( ON ?auto_63232 ?auto_63233 ) ( ON ?auto_63231 ?auto_63232 ) ( CLEAR ?auto_63231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63235 ?auto_63237 ?auto_63236 ?auto_63234 ?auto_63233 ?auto_63232 )
      ( MAKE-4PILE ?auto_63231 ?auto_63232 ?auto_63233 ?auto_63234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63240 - BLOCK
      ?auto_63241 - BLOCK
    )
    :vars
    (
      ?auto_63242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63242 ?auto_63241 ) ( CLEAR ?auto_63242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63240 ) ( ON ?auto_63241 ?auto_63240 ) ( not ( = ?auto_63240 ?auto_63241 ) ) ( not ( = ?auto_63240 ?auto_63242 ) ) ( not ( = ?auto_63241 ?auto_63242 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63242 ?auto_63241 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63243 - BLOCK
      ?auto_63244 - BLOCK
    )
    :vars
    (
      ?auto_63245 - BLOCK
      ?auto_63246 - BLOCK
      ?auto_63247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63245 ?auto_63244 ) ( CLEAR ?auto_63245 ) ( ON-TABLE ?auto_63243 ) ( ON ?auto_63244 ?auto_63243 ) ( not ( = ?auto_63243 ?auto_63244 ) ) ( not ( = ?auto_63243 ?auto_63245 ) ) ( not ( = ?auto_63244 ?auto_63245 ) ) ( HOLDING ?auto_63246 ) ( CLEAR ?auto_63247 ) ( not ( = ?auto_63243 ?auto_63246 ) ) ( not ( = ?auto_63243 ?auto_63247 ) ) ( not ( = ?auto_63244 ?auto_63246 ) ) ( not ( = ?auto_63244 ?auto_63247 ) ) ( not ( = ?auto_63245 ?auto_63246 ) ) ( not ( = ?auto_63245 ?auto_63247 ) ) ( not ( = ?auto_63246 ?auto_63247 ) ) )
    :subtasks
    ( ( !STACK ?auto_63246 ?auto_63247 )
      ( MAKE-2PILE ?auto_63243 ?auto_63244 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63248 - BLOCK
      ?auto_63249 - BLOCK
    )
    :vars
    (
      ?auto_63251 - BLOCK
      ?auto_63250 - BLOCK
      ?auto_63252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63251 ?auto_63249 ) ( ON-TABLE ?auto_63248 ) ( ON ?auto_63249 ?auto_63248 ) ( not ( = ?auto_63248 ?auto_63249 ) ) ( not ( = ?auto_63248 ?auto_63251 ) ) ( not ( = ?auto_63249 ?auto_63251 ) ) ( CLEAR ?auto_63250 ) ( not ( = ?auto_63248 ?auto_63252 ) ) ( not ( = ?auto_63248 ?auto_63250 ) ) ( not ( = ?auto_63249 ?auto_63252 ) ) ( not ( = ?auto_63249 ?auto_63250 ) ) ( not ( = ?auto_63251 ?auto_63252 ) ) ( not ( = ?auto_63251 ?auto_63250 ) ) ( not ( = ?auto_63252 ?auto_63250 ) ) ( ON ?auto_63252 ?auto_63251 ) ( CLEAR ?auto_63252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63248 ?auto_63249 ?auto_63251 )
      ( MAKE-2PILE ?auto_63248 ?auto_63249 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63253 - BLOCK
      ?auto_63254 - BLOCK
    )
    :vars
    (
      ?auto_63257 - BLOCK
      ?auto_63255 - BLOCK
      ?auto_63256 - BLOCK
      ?auto_63259 - BLOCK
      ?auto_63258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63257 ?auto_63254 ) ( ON-TABLE ?auto_63253 ) ( ON ?auto_63254 ?auto_63253 ) ( not ( = ?auto_63253 ?auto_63254 ) ) ( not ( = ?auto_63253 ?auto_63257 ) ) ( not ( = ?auto_63254 ?auto_63257 ) ) ( not ( = ?auto_63253 ?auto_63255 ) ) ( not ( = ?auto_63253 ?auto_63256 ) ) ( not ( = ?auto_63254 ?auto_63255 ) ) ( not ( = ?auto_63254 ?auto_63256 ) ) ( not ( = ?auto_63257 ?auto_63255 ) ) ( not ( = ?auto_63257 ?auto_63256 ) ) ( not ( = ?auto_63255 ?auto_63256 ) ) ( ON ?auto_63255 ?auto_63257 ) ( CLEAR ?auto_63255 ) ( HOLDING ?auto_63256 ) ( CLEAR ?auto_63259 ) ( ON-TABLE ?auto_63258 ) ( ON ?auto_63259 ?auto_63258 ) ( not ( = ?auto_63258 ?auto_63259 ) ) ( not ( = ?auto_63258 ?auto_63256 ) ) ( not ( = ?auto_63259 ?auto_63256 ) ) ( not ( = ?auto_63253 ?auto_63259 ) ) ( not ( = ?auto_63253 ?auto_63258 ) ) ( not ( = ?auto_63254 ?auto_63259 ) ) ( not ( = ?auto_63254 ?auto_63258 ) ) ( not ( = ?auto_63257 ?auto_63259 ) ) ( not ( = ?auto_63257 ?auto_63258 ) ) ( not ( = ?auto_63255 ?auto_63259 ) ) ( not ( = ?auto_63255 ?auto_63258 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63258 ?auto_63259 ?auto_63256 )
      ( MAKE-2PILE ?auto_63253 ?auto_63254 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63260 - BLOCK
      ?auto_63261 - BLOCK
    )
    :vars
    (
      ?auto_63264 - BLOCK
      ?auto_63266 - BLOCK
      ?auto_63263 - BLOCK
      ?auto_63262 - BLOCK
      ?auto_63265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63264 ?auto_63261 ) ( ON-TABLE ?auto_63260 ) ( ON ?auto_63261 ?auto_63260 ) ( not ( = ?auto_63260 ?auto_63261 ) ) ( not ( = ?auto_63260 ?auto_63264 ) ) ( not ( = ?auto_63261 ?auto_63264 ) ) ( not ( = ?auto_63260 ?auto_63266 ) ) ( not ( = ?auto_63260 ?auto_63263 ) ) ( not ( = ?auto_63261 ?auto_63266 ) ) ( not ( = ?auto_63261 ?auto_63263 ) ) ( not ( = ?auto_63264 ?auto_63266 ) ) ( not ( = ?auto_63264 ?auto_63263 ) ) ( not ( = ?auto_63266 ?auto_63263 ) ) ( ON ?auto_63266 ?auto_63264 ) ( CLEAR ?auto_63262 ) ( ON-TABLE ?auto_63265 ) ( ON ?auto_63262 ?auto_63265 ) ( not ( = ?auto_63265 ?auto_63262 ) ) ( not ( = ?auto_63265 ?auto_63263 ) ) ( not ( = ?auto_63262 ?auto_63263 ) ) ( not ( = ?auto_63260 ?auto_63262 ) ) ( not ( = ?auto_63260 ?auto_63265 ) ) ( not ( = ?auto_63261 ?auto_63262 ) ) ( not ( = ?auto_63261 ?auto_63265 ) ) ( not ( = ?auto_63264 ?auto_63262 ) ) ( not ( = ?auto_63264 ?auto_63265 ) ) ( not ( = ?auto_63266 ?auto_63262 ) ) ( not ( = ?auto_63266 ?auto_63265 ) ) ( ON ?auto_63263 ?auto_63266 ) ( CLEAR ?auto_63263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63260 ?auto_63261 ?auto_63264 ?auto_63266 )
      ( MAKE-2PILE ?auto_63260 ?auto_63261 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63267 - BLOCK
      ?auto_63268 - BLOCK
    )
    :vars
    (
      ?auto_63270 - BLOCK
      ?auto_63273 - BLOCK
      ?auto_63269 - BLOCK
      ?auto_63272 - BLOCK
      ?auto_63271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63270 ?auto_63268 ) ( ON-TABLE ?auto_63267 ) ( ON ?auto_63268 ?auto_63267 ) ( not ( = ?auto_63267 ?auto_63268 ) ) ( not ( = ?auto_63267 ?auto_63270 ) ) ( not ( = ?auto_63268 ?auto_63270 ) ) ( not ( = ?auto_63267 ?auto_63273 ) ) ( not ( = ?auto_63267 ?auto_63269 ) ) ( not ( = ?auto_63268 ?auto_63273 ) ) ( not ( = ?auto_63268 ?auto_63269 ) ) ( not ( = ?auto_63270 ?auto_63273 ) ) ( not ( = ?auto_63270 ?auto_63269 ) ) ( not ( = ?auto_63273 ?auto_63269 ) ) ( ON ?auto_63273 ?auto_63270 ) ( ON-TABLE ?auto_63272 ) ( not ( = ?auto_63272 ?auto_63271 ) ) ( not ( = ?auto_63272 ?auto_63269 ) ) ( not ( = ?auto_63271 ?auto_63269 ) ) ( not ( = ?auto_63267 ?auto_63271 ) ) ( not ( = ?auto_63267 ?auto_63272 ) ) ( not ( = ?auto_63268 ?auto_63271 ) ) ( not ( = ?auto_63268 ?auto_63272 ) ) ( not ( = ?auto_63270 ?auto_63271 ) ) ( not ( = ?auto_63270 ?auto_63272 ) ) ( not ( = ?auto_63273 ?auto_63271 ) ) ( not ( = ?auto_63273 ?auto_63272 ) ) ( ON ?auto_63269 ?auto_63273 ) ( CLEAR ?auto_63269 ) ( HOLDING ?auto_63271 ) ( CLEAR ?auto_63272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63272 ?auto_63271 )
      ( MAKE-2PILE ?auto_63267 ?auto_63268 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63274 - BLOCK
      ?auto_63275 - BLOCK
    )
    :vars
    (
      ?auto_63276 - BLOCK
      ?auto_63280 - BLOCK
      ?auto_63277 - BLOCK
      ?auto_63278 - BLOCK
      ?auto_63279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63276 ?auto_63275 ) ( ON-TABLE ?auto_63274 ) ( ON ?auto_63275 ?auto_63274 ) ( not ( = ?auto_63274 ?auto_63275 ) ) ( not ( = ?auto_63274 ?auto_63276 ) ) ( not ( = ?auto_63275 ?auto_63276 ) ) ( not ( = ?auto_63274 ?auto_63280 ) ) ( not ( = ?auto_63274 ?auto_63277 ) ) ( not ( = ?auto_63275 ?auto_63280 ) ) ( not ( = ?auto_63275 ?auto_63277 ) ) ( not ( = ?auto_63276 ?auto_63280 ) ) ( not ( = ?auto_63276 ?auto_63277 ) ) ( not ( = ?auto_63280 ?auto_63277 ) ) ( ON ?auto_63280 ?auto_63276 ) ( ON-TABLE ?auto_63278 ) ( not ( = ?auto_63278 ?auto_63279 ) ) ( not ( = ?auto_63278 ?auto_63277 ) ) ( not ( = ?auto_63279 ?auto_63277 ) ) ( not ( = ?auto_63274 ?auto_63279 ) ) ( not ( = ?auto_63274 ?auto_63278 ) ) ( not ( = ?auto_63275 ?auto_63279 ) ) ( not ( = ?auto_63275 ?auto_63278 ) ) ( not ( = ?auto_63276 ?auto_63279 ) ) ( not ( = ?auto_63276 ?auto_63278 ) ) ( not ( = ?auto_63280 ?auto_63279 ) ) ( not ( = ?auto_63280 ?auto_63278 ) ) ( ON ?auto_63277 ?auto_63280 ) ( CLEAR ?auto_63278 ) ( ON ?auto_63279 ?auto_63277 ) ( CLEAR ?auto_63279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63274 ?auto_63275 ?auto_63276 ?auto_63280 ?auto_63277 )
      ( MAKE-2PILE ?auto_63274 ?auto_63275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63281 - BLOCK
      ?auto_63282 - BLOCK
    )
    :vars
    (
      ?auto_63284 - BLOCK
      ?auto_63283 - BLOCK
      ?auto_63286 - BLOCK
      ?auto_63287 - BLOCK
      ?auto_63285 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63284 ?auto_63282 ) ( ON-TABLE ?auto_63281 ) ( ON ?auto_63282 ?auto_63281 ) ( not ( = ?auto_63281 ?auto_63282 ) ) ( not ( = ?auto_63281 ?auto_63284 ) ) ( not ( = ?auto_63282 ?auto_63284 ) ) ( not ( = ?auto_63281 ?auto_63283 ) ) ( not ( = ?auto_63281 ?auto_63286 ) ) ( not ( = ?auto_63282 ?auto_63283 ) ) ( not ( = ?auto_63282 ?auto_63286 ) ) ( not ( = ?auto_63284 ?auto_63283 ) ) ( not ( = ?auto_63284 ?auto_63286 ) ) ( not ( = ?auto_63283 ?auto_63286 ) ) ( ON ?auto_63283 ?auto_63284 ) ( not ( = ?auto_63287 ?auto_63285 ) ) ( not ( = ?auto_63287 ?auto_63286 ) ) ( not ( = ?auto_63285 ?auto_63286 ) ) ( not ( = ?auto_63281 ?auto_63285 ) ) ( not ( = ?auto_63281 ?auto_63287 ) ) ( not ( = ?auto_63282 ?auto_63285 ) ) ( not ( = ?auto_63282 ?auto_63287 ) ) ( not ( = ?auto_63284 ?auto_63285 ) ) ( not ( = ?auto_63284 ?auto_63287 ) ) ( not ( = ?auto_63283 ?auto_63285 ) ) ( not ( = ?auto_63283 ?auto_63287 ) ) ( ON ?auto_63286 ?auto_63283 ) ( ON ?auto_63285 ?auto_63286 ) ( CLEAR ?auto_63285 ) ( HOLDING ?auto_63287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63287 )
      ( MAKE-2PILE ?auto_63281 ?auto_63282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63288 - BLOCK
      ?auto_63289 - BLOCK
    )
    :vars
    (
      ?auto_63292 - BLOCK
      ?auto_63291 - BLOCK
      ?auto_63293 - BLOCK
      ?auto_63294 - BLOCK
      ?auto_63290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63292 ?auto_63289 ) ( ON-TABLE ?auto_63288 ) ( ON ?auto_63289 ?auto_63288 ) ( not ( = ?auto_63288 ?auto_63289 ) ) ( not ( = ?auto_63288 ?auto_63292 ) ) ( not ( = ?auto_63289 ?auto_63292 ) ) ( not ( = ?auto_63288 ?auto_63291 ) ) ( not ( = ?auto_63288 ?auto_63293 ) ) ( not ( = ?auto_63289 ?auto_63291 ) ) ( not ( = ?auto_63289 ?auto_63293 ) ) ( not ( = ?auto_63292 ?auto_63291 ) ) ( not ( = ?auto_63292 ?auto_63293 ) ) ( not ( = ?auto_63291 ?auto_63293 ) ) ( ON ?auto_63291 ?auto_63292 ) ( not ( = ?auto_63294 ?auto_63290 ) ) ( not ( = ?auto_63294 ?auto_63293 ) ) ( not ( = ?auto_63290 ?auto_63293 ) ) ( not ( = ?auto_63288 ?auto_63290 ) ) ( not ( = ?auto_63288 ?auto_63294 ) ) ( not ( = ?auto_63289 ?auto_63290 ) ) ( not ( = ?auto_63289 ?auto_63294 ) ) ( not ( = ?auto_63292 ?auto_63290 ) ) ( not ( = ?auto_63292 ?auto_63294 ) ) ( not ( = ?auto_63291 ?auto_63290 ) ) ( not ( = ?auto_63291 ?auto_63294 ) ) ( ON ?auto_63293 ?auto_63291 ) ( ON ?auto_63290 ?auto_63293 ) ( ON ?auto_63294 ?auto_63290 ) ( CLEAR ?auto_63294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63288 ?auto_63289 ?auto_63292 ?auto_63291 ?auto_63293 ?auto_63290 )
      ( MAKE-2PILE ?auto_63288 ?auto_63289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63300 - BLOCK
      ?auto_63301 - BLOCK
      ?auto_63302 - BLOCK
      ?auto_63303 - BLOCK
      ?auto_63304 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63304 ) ( CLEAR ?auto_63303 ) ( ON-TABLE ?auto_63300 ) ( ON ?auto_63301 ?auto_63300 ) ( ON ?auto_63302 ?auto_63301 ) ( ON ?auto_63303 ?auto_63302 ) ( not ( = ?auto_63300 ?auto_63301 ) ) ( not ( = ?auto_63300 ?auto_63302 ) ) ( not ( = ?auto_63300 ?auto_63303 ) ) ( not ( = ?auto_63300 ?auto_63304 ) ) ( not ( = ?auto_63301 ?auto_63302 ) ) ( not ( = ?auto_63301 ?auto_63303 ) ) ( not ( = ?auto_63301 ?auto_63304 ) ) ( not ( = ?auto_63302 ?auto_63303 ) ) ( not ( = ?auto_63302 ?auto_63304 ) ) ( not ( = ?auto_63303 ?auto_63304 ) ) )
    :subtasks
    ( ( !STACK ?auto_63304 ?auto_63303 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63305 - BLOCK
      ?auto_63306 - BLOCK
      ?auto_63307 - BLOCK
      ?auto_63308 - BLOCK
      ?auto_63309 - BLOCK
    )
    :vars
    (
      ?auto_63310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63308 ) ( ON-TABLE ?auto_63305 ) ( ON ?auto_63306 ?auto_63305 ) ( ON ?auto_63307 ?auto_63306 ) ( ON ?auto_63308 ?auto_63307 ) ( not ( = ?auto_63305 ?auto_63306 ) ) ( not ( = ?auto_63305 ?auto_63307 ) ) ( not ( = ?auto_63305 ?auto_63308 ) ) ( not ( = ?auto_63305 ?auto_63309 ) ) ( not ( = ?auto_63306 ?auto_63307 ) ) ( not ( = ?auto_63306 ?auto_63308 ) ) ( not ( = ?auto_63306 ?auto_63309 ) ) ( not ( = ?auto_63307 ?auto_63308 ) ) ( not ( = ?auto_63307 ?auto_63309 ) ) ( not ( = ?auto_63308 ?auto_63309 ) ) ( ON ?auto_63309 ?auto_63310 ) ( CLEAR ?auto_63309 ) ( HAND-EMPTY ) ( not ( = ?auto_63305 ?auto_63310 ) ) ( not ( = ?auto_63306 ?auto_63310 ) ) ( not ( = ?auto_63307 ?auto_63310 ) ) ( not ( = ?auto_63308 ?auto_63310 ) ) ( not ( = ?auto_63309 ?auto_63310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63309 ?auto_63310 )
      ( MAKE-5PILE ?auto_63305 ?auto_63306 ?auto_63307 ?auto_63308 ?auto_63309 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63311 - BLOCK
      ?auto_63312 - BLOCK
      ?auto_63313 - BLOCK
      ?auto_63314 - BLOCK
      ?auto_63315 - BLOCK
    )
    :vars
    (
      ?auto_63316 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63311 ) ( ON ?auto_63312 ?auto_63311 ) ( ON ?auto_63313 ?auto_63312 ) ( not ( = ?auto_63311 ?auto_63312 ) ) ( not ( = ?auto_63311 ?auto_63313 ) ) ( not ( = ?auto_63311 ?auto_63314 ) ) ( not ( = ?auto_63311 ?auto_63315 ) ) ( not ( = ?auto_63312 ?auto_63313 ) ) ( not ( = ?auto_63312 ?auto_63314 ) ) ( not ( = ?auto_63312 ?auto_63315 ) ) ( not ( = ?auto_63313 ?auto_63314 ) ) ( not ( = ?auto_63313 ?auto_63315 ) ) ( not ( = ?auto_63314 ?auto_63315 ) ) ( ON ?auto_63315 ?auto_63316 ) ( CLEAR ?auto_63315 ) ( not ( = ?auto_63311 ?auto_63316 ) ) ( not ( = ?auto_63312 ?auto_63316 ) ) ( not ( = ?auto_63313 ?auto_63316 ) ) ( not ( = ?auto_63314 ?auto_63316 ) ) ( not ( = ?auto_63315 ?auto_63316 ) ) ( HOLDING ?auto_63314 ) ( CLEAR ?auto_63313 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63311 ?auto_63312 ?auto_63313 ?auto_63314 )
      ( MAKE-5PILE ?auto_63311 ?auto_63312 ?auto_63313 ?auto_63314 ?auto_63315 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63317 - BLOCK
      ?auto_63318 - BLOCK
      ?auto_63319 - BLOCK
      ?auto_63320 - BLOCK
      ?auto_63321 - BLOCK
    )
    :vars
    (
      ?auto_63322 - BLOCK
      ?auto_63323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63317 ) ( ON ?auto_63318 ?auto_63317 ) ( ON ?auto_63319 ?auto_63318 ) ( not ( = ?auto_63317 ?auto_63318 ) ) ( not ( = ?auto_63317 ?auto_63319 ) ) ( not ( = ?auto_63317 ?auto_63320 ) ) ( not ( = ?auto_63317 ?auto_63321 ) ) ( not ( = ?auto_63318 ?auto_63319 ) ) ( not ( = ?auto_63318 ?auto_63320 ) ) ( not ( = ?auto_63318 ?auto_63321 ) ) ( not ( = ?auto_63319 ?auto_63320 ) ) ( not ( = ?auto_63319 ?auto_63321 ) ) ( not ( = ?auto_63320 ?auto_63321 ) ) ( ON ?auto_63321 ?auto_63322 ) ( not ( = ?auto_63317 ?auto_63322 ) ) ( not ( = ?auto_63318 ?auto_63322 ) ) ( not ( = ?auto_63319 ?auto_63322 ) ) ( not ( = ?auto_63320 ?auto_63322 ) ) ( not ( = ?auto_63321 ?auto_63322 ) ) ( CLEAR ?auto_63319 ) ( ON ?auto_63320 ?auto_63321 ) ( CLEAR ?auto_63320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63323 ) ( ON ?auto_63322 ?auto_63323 ) ( not ( = ?auto_63323 ?auto_63322 ) ) ( not ( = ?auto_63323 ?auto_63321 ) ) ( not ( = ?auto_63323 ?auto_63320 ) ) ( not ( = ?auto_63317 ?auto_63323 ) ) ( not ( = ?auto_63318 ?auto_63323 ) ) ( not ( = ?auto_63319 ?auto_63323 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63323 ?auto_63322 ?auto_63321 )
      ( MAKE-5PILE ?auto_63317 ?auto_63318 ?auto_63319 ?auto_63320 ?auto_63321 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63324 - BLOCK
      ?auto_63325 - BLOCK
      ?auto_63326 - BLOCK
      ?auto_63327 - BLOCK
      ?auto_63328 - BLOCK
    )
    :vars
    (
      ?auto_63330 - BLOCK
      ?auto_63329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63324 ) ( ON ?auto_63325 ?auto_63324 ) ( not ( = ?auto_63324 ?auto_63325 ) ) ( not ( = ?auto_63324 ?auto_63326 ) ) ( not ( = ?auto_63324 ?auto_63327 ) ) ( not ( = ?auto_63324 ?auto_63328 ) ) ( not ( = ?auto_63325 ?auto_63326 ) ) ( not ( = ?auto_63325 ?auto_63327 ) ) ( not ( = ?auto_63325 ?auto_63328 ) ) ( not ( = ?auto_63326 ?auto_63327 ) ) ( not ( = ?auto_63326 ?auto_63328 ) ) ( not ( = ?auto_63327 ?auto_63328 ) ) ( ON ?auto_63328 ?auto_63330 ) ( not ( = ?auto_63324 ?auto_63330 ) ) ( not ( = ?auto_63325 ?auto_63330 ) ) ( not ( = ?auto_63326 ?auto_63330 ) ) ( not ( = ?auto_63327 ?auto_63330 ) ) ( not ( = ?auto_63328 ?auto_63330 ) ) ( ON ?auto_63327 ?auto_63328 ) ( CLEAR ?auto_63327 ) ( ON-TABLE ?auto_63329 ) ( ON ?auto_63330 ?auto_63329 ) ( not ( = ?auto_63329 ?auto_63330 ) ) ( not ( = ?auto_63329 ?auto_63328 ) ) ( not ( = ?auto_63329 ?auto_63327 ) ) ( not ( = ?auto_63324 ?auto_63329 ) ) ( not ( = ?auto_63325 ?auto_63329 ) ) ( not ( = ?auto_63326 ?auto_63329 ) ) ( HOLDING ?auto_63326 ) ( CLEAR ?auto_63325 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63324 ?auto_63325 ?auto_63326 )
      ( MAKE-5PILE ?auto_63324 ?auto_63325 ?auto_63326 ?auto_63327 ?auto_63328 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63331 - BLOCK
      ?auto_63332 - BLOCK
      ?auto_63333 - BLOCK
      ?auto_63334 - BLOCK
      ?auto_63335 - BLOCK
    )
    :vars
    (
      ?auto_63336 - BLOCK
      ?auto_63337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63331 ) ( ON ?auto_63332 ?auto_63331 ) ( not ( = ?auto_63331 ?auto_63332 ) ) ( not ( = ?auto_63331 ?auto_63333 ) ) ( not ( = ?auto_63331 ?auto_63334 ) ) ( not ( = ?auto_63331 ?auto_63335 ) ) ( not ( = ?auto_63332 ?auto_63333 ) ) ( not ( = ?auto_63332 ?auto_63334 ) ) ( not ( = ?auto_63332 ?auto_63335 ) ) ( not ( = ?auto_63333 ?auto_63334 ) ) ( not ( = ?auto_63333 ?auto_63335 ) ) ( not ( = ?auto_63334 ?auto_63335 ) ) ( ON ?auto_63335 ?auto_63336 ) ( not ( = ?auto_63331 ?auto_63336 ) ) ( not ( = ?auto_63332 ?auto_63336 ) ) ( not ( = ?auto_63333 ?auto_63336 ) ) ( not ( = ?auto_63334 ?auto_63336 ) ) ( not ( = ?auto_63335 ?auto_63336 ) ) ( ON ?auto_63334 ?auto_63335 ) ( ON-TABLE ?auto_63337 ) ( ON ?auto_63336 ?auto_63337 ) ( not ( = ?auto_63337 ?auto_63336 ) ) ( not ( = ?auto_63337 ?auto_63335 ) ) ( not ( = ?auto_63337 ?auto_63334 ) ) ( not ( = ?auto_63331 ?auto_63337 ) ) ( not ( = ?auto_63332 ?auto_63337 ) ) ( not ( = ?auto_63333 ?auto_63337 ) ) ( CLEAR ?auto_63332 ) ( ON ?auto_63333 ?auto_63334 ) ( CLEAR ?auto_63333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63337 ?auto_63336 ?auto_63335 ?auto_63334 )
      ( MAKE-5PILE ?auto_63331 ?auto_63332 ?auto_63333 ?auto_63334 ?auto_63335 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63338 - BLOCK
      ?auto_63339 - BLOCK
      ?auto_63340 - BLOCK
      ?auto_63341 - BLOCK
      ?auto_63342 - BLOCK
    )
    :vars
    (
      ?auto_63344 - BLOCK
      ?auto_63343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63338 ) ( not ( = ?auto_63338 ?auto_63339 ) ) ( not ( = ?auto_63338 ?auto_63340 ) ) ( not ( = ?auto_63338 ?auto_63341 ) ) ( not ( = ?auto_63338 ?auto_63342 ) ) ( not ( = ?auto_63339 ?auto_63340 ) ) ( not ( = ?auto_63339 ?auto_63341 ) ) ( not ( = ?auto_63339 ?auto_63342 ) ) ( not ( = ?auto_63340 ?auto_63341 ) ) ( not ( = ?auto_63340 ?auto_63342 ) ) ( not ( = ?auto_63341 ?auto_63342 ) ) ( ON ?auto_63342 ?auto_63344 ) ( not ( = ?auto_63338 ?auto_63344 ) ) ( not ( = ?auto_63339 ?auto_63344 ) ) ( not ( = ?auto_63340 ?auto_63344 ) ) ( not ( = ?auto_63341 ?auto_63344 ) ) ( not ( = ?auto_63342 ?auto_63344 ) ) ( ON ?auto_63341 ?auto_63342 ) ( ON-TABLE ?auto_63343 ) ( ON ?auto_63344 ?auto_63343 ) ( not ( = ?auto_63343 ?auto_63344 ) ) ( not ( = ?auto_63343 ?auto_63342 ) ) ( not ( = ?auto_63343 ?auto_63341 ) ) ( not ( = ?auto_63338 ?auto_63343 ) ) ( not ( = ?auto_63339 ?auto_63343 ) ) ( not ( = ?auto_63340 ?auto_63343 ) ) ( ON ?auto_63340 ?auto_63341 ) ( CLEAR ?auto_63340 ) ( HOLDING ?auto_63339 ) ( CLEAR ?auto_63338 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63338 ?auto_63339 )
      ( MAKE-5PILE ?auto_63338 ?auto_63339 ?auto_63340 ?auto_63341 ?auto_63342 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63345 - BLOCK
      ?auto_63346 - BLOCK
      ?auto_63347 - BLOCK
      ?auto_63348 - BLOCK
      ?auto_63349 - BLOCK
    )
    :vars
    (
      ?auto_63351 - BLOCK
      ?auto_63350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63345 ) ( not ( = ?auto_63345 ?auto_63346 ) ) ( not ( = ?auto_63345 ?auto_63347 ) ) ( not ( = ?auto_63345 ?auto_63348 ) ) ( not ( = ?auto_63345 ?auto_63349 ) ) ( not ( = ?auto_63346 ?auto_63347 ) ) ( not ( = ?auto_63346 ?auto_63348 ) ) ( not ( = ?auto_63346 ?auto_63349 ) ) ( not ( = ?auto_63347 ?auto_63348 ) ) ( not ( = ?auto_63347 ?auto_63349 ) ) ( not ( = ?auto_63348 ?auto_63349 ) ) ( ON ?auto_63349 ?auto_63351 ) ( not ( = ?auto_63345 ?auto_63351 ) ) ( not ( = ?auto_63346 ?auto_63351 ) ) ( not ( = ?auto_63347 ?auto_63351 ) ) ( not ( = ?auto_63348 ?auto_63351 ) ) ( not ( = ?auto_63349 ?auto_63351 ) ) ( ON ?auto_63348 ?auto_63349 ) ( ON-TABLE ?auto_63350 ) ( ON ?auto_63351 ?auto_63350 ) ( not ( = ?auto_63350 ?auto_63351 ) ) ( not ( = ?auto_63350 ?auto_63349 ) ) ( not ( = ?auto_63350 ?auto_63348 ) ) ( not ( = ?auto_63345 ?auto_63350 ) ) ( not ( = ?auto_63346 ?auto_63350 ) ) ( not ( = ?auto_63347 ?auto_63350 ) ) ( ON ?auto_63347 ?auto_63348 ) ( CLEAR ?auto_63345 ) ( ON ?auto_63346 ?auto_63347 ) ( CLEAR ?auto_63346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63350 ?auto_63351 ?auto_63349 ?auto_63348 ?auto_63347 )
      ( MAKE-5PILE ?auto_63345 ?auto_63346 ?auto_63347 ?auto_63348 ?auto_63349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63352 - BLOCK
      ?auto_63353 - BLOCK
      ?auto_63354 - BLOCK
      ?auto_63355 - BLOCK
      ?auto_63356 - BLOCK
    )
    :vars
    (
      ?auto_63357 - BLOCK
      ?auto_63358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63352 ?auto_63353 ) ) ( not ( = ?auto_63352 ?auto_63354 ) ) ( not ( = ?auto_63352 ?auto_63355 ) ) ( not ( = ?auto_63352 ?auto_63356 ) ) ( not ( = ?auto_63353 ?auto_63354 ) ) ( not ( = ?auto_63353 ?auto_63355 ) ) ( not ( = ?auto_63353 ?auto_63356 ) ) ( not ( = ?auto_63354 ?auto_63355 ) ) ( not ( = ?auto_63354 ?auto_63356 ) ) ( not ( = ?auto_63355 ?auto_63356 ) ) ( ON ?auto_63356 ?auto_63357 ) ( not ( = ?auto_63352 ?auto_63357 ) ) ( not ( = ?auto_63353 ?auto_63357 ) ) ( not ( = ?auto_63354 ?auto_63357 ) ) ( not ( = ?auto_63355 ?auto_63357 ) ) ( not ( = ?auto_63356 ?auto_63357 ) ) ( ON ?auto_63355 ?auto_63356 ) ( ON-TABLE ?auto_63358 ) ( ON ?auto_63357 ?auto_63358 ) ( not ( = ?auto_63358 ?auto_63357 ) ) ( not ( = ?auto_63358 ?auto_63356 ) ) ( not ( = ?auto_63358 ?auto_63355 ) ) ( not ( = ?auto_63352 ?auto_63358 ) ) ( not ( = ?auto_63353 ?auto_63358 ) ) ( not ( = ?auto_63354 ?auto_63358 ) ) ( ON ?auto_63354 ?auto_63355 ) ( ON ?auto_63353 ?auto_63354 ) ( CLEAR ?auto_63353 ) ( HOLDING ?auto_63352 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63352 )
      ( MAKE-5PILE ?auto_63352 ?auto_63353 ?auto_63354 ?auto_63355 ?auto_63356 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63359 - BLOCK
      ?auto_63360 - BLOCK
      ?auto_63361 - BLOCK
      ?auto_63362 - BLOCK
      ?auto_63363 - BLOCK
    )
    :vars
    (
      ?auto_63364 - BLOCK
      ?auto_63365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63359 ?auto_63360 ) ) ( not ( = ?auto_63359 ?auto_63361 ) ) ( not ( = ?auto_63359 ?auto_63362 ) ) ( not ( = ?auto_63359 ?auto_63363 ) ) ( not ( = ?auto_63360 ?auto_63361 ) ) ( not ( = ?auto_63360 ?auto_63362 ) ) ( not ( = ?auto_63360 ?auto_63363 ) ) ( not ( = ?auto_63361 ?auto_63362 ) ) ( not ( = ?auto_63361 ?auto_63363 ) ) ( not ( = ?auto_63362 ?auto_63363 ) ) ( ON ?auto_63363 ?auto_63364 ) ( not ( = ?auto_63359 ?auto_63364 ) ) ( not ( = ?auto_63360 ?auto_63364 ) ) ( not ( = ?auto_63361 ?auto_63364 ) ) ( not ( = ?auto_63362 ?auto_63364 ) ) ( not ( = ?auto_63363 ?auto_63364 ) ) ( ON ?auto_63362 ?auto_63363 ) ( ON-TABLE ?auto_63365 ) ( ON ?auto_63364 ?auto_63365 ) ( not ( = ?auto_63365 ?auto_63364 ) ) ( not ( = ?auto_63365 ?auto_63363 ) ) ( not ( = ?auto_63365 ?auto_63362 ) ) ( not ( = ?auto_63359 ?auto_63365 ) ) ( not ( = ?auto_63360 ?auto_63365 ) ) ( not ( = ?auto_63361 ?auto_63365 ) ) ( ON ?auto_63361 ?auto_63362 ) ( ON ?auto_63360 ?auto_63361 ) ( ON ?auto_63359 ?auto_63360 ) ( CLEAR ?auto_63359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63365 ?auto_63364 ?auto_63363 ?auto_63362 ?auto_63361 ?auto_63360 )
      ( MAKE-5PILE ?auto_63359 ?auto_63360 ?auto_63361 ?auto_63362 ?auto_63363 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63367 - BLOCK
    )
    :vars
    (
      ?auto_63368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63368 ?auto_63367 ) ( CLEAR ?auto_63368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63367 ) ( not ( = ?auto_63367 ?auto_63368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63368 ?auto_63367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63369 - BLOCK
    )
    :vars
    (
      ?auto_63370 - BLOCK
      ?auto_63371 - BLOCK
      ?auto_63372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63370 ?auto_63369 ) ( CLEAR ?auto_63370 ) ( ON-TABLE ?auto_63369 ) ( not ( = ?auto_63369 ?auto_63370 ) ) ( HOLDING ?auto_63371 ) ( CLEAR ?auto_63372 ) ( not ( = ?auto_63369 ?auto_63371 ) ) ( not ( = ?auto_63369 ?auto_63372 ) ) ( not ( = ?auto_63370 ?auto_63371 ) ) ( not ( = ?auto_63370 ?auto_63372 ) ) ( not ( = ?auto_63371 ?auto_63372 ) ) )
    :subtasks
    ( ( !STACK ?auto_63371 ?auto_63372 )
      ( MAKE-1PILE ?auto_63369 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63373 - BLOCK
    )
    :vars
    (
      ?auto_63376 - BLOCK
      ?auto_63374 - BLOCK
      ?auto_63375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63376 ?auto_63373 ) ( ON-TABLE ?auto_63373 ) ( not ( = ?auto_63373 ?auto_63376 ) ) ( CLEAR ?auto_63374 ) ( not ( = ?auto_63373 ?auto_63375 ) ) ( not ( = ?auto_63373 ?auto_63374 ) ) ( not ( = ?auto_63376 ?auto_63375 ) ) ( not ( = ?auto_63376 ?auto_63374 ) ) ( not ( = ?auto_63375 ?auto_63374 ) ) ( ON ?auto_63375 ?auto_63376 ) ( CLEAR ?auto_63375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63373 ?auto_63376 )
      ( MAKE-1PILE ?auto_63373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63377 - BLOCK
    )
    :vars
    (
      ?auto_63378 - BLOCK
      ?auto_63379 - BLOCK
      ?auto_63380 - BLOCK
      ?auto_63381 - BLOCK
      ?auto_63382 - BLOCK
      ?auto_63383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63378 ?auto_63377 ) ( ON-TABLE ?auto_63377 ) ( not ( = ?auto_63377 ?auto_63378 ) ) ( not ( = ?auto_63377 ?auto_63379 ) ) ( not ( = ?auto_63377 ?auto_63380 ) ) ( not ( = ?auto_63378 ?auto_63379 ) ) ( not ( = ?auto_63378 ?auto_63380 ) ) ( not ( = ?auto_63379 ?auto_63380 ) ) ( ON ?auto_63379 ?auto_63378 ) ( CLEAR ?auto_63379 ) ( HOLDING ?auto_63380 ) ( CLEAR ?auto_63381 ) ( ON-TABLE ?auto_63382 ) ( ON ?auto_63383 ?auto_63382 ) ( ON ?auto_63381 ?auto_63383 ) ( not ( = ?auto_63382 ?auto_63383 ) ) ( not ( = ?auto_63382 ?auto_63381 ) ) ( not ( = ?auto_63382 ?auto_63380 ) ) ( not ( = ?auto_63383 ?auto_63381 ) ) ( not ( = ?auto_63383 ?auto_63380 ) ) ( not ( = ?auto_63381 ?auto_63380 ) ) ( not ( = ?auto_63377 ?auto_63381 ) ) ( not ( = ?auto_63377 ?auto_63382 ) ) ( not ( = ?auto_63377 ?auto_63383 ) ) ( not ( = ?auto_63378 ?auto_63381 ) ) ( not ( = ?auto_63378 ?auto_63382 ) ) ( not ( = ?auto_63378 ?auto_63383 ) ) ( not ( = ?auto_63379 ?auto_63381 ) ) ( not ( = ?auto_63379 ?auto_63382 ) ) ( not ( = ?auto_63379 ?auto_63383 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63382 ?auto_63383 ?auto_63381 ?auto_63380 )
      ( MAKE-1PILE ?auto_63377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63384 - BLOCK
    )
    :vars
    (
      ?auto_63385 - BLOCK
      ?auto_63390 - BLOCK
      ?auto_63388 - BLOCK
      ?auto_63386 - BLOCK
      ?auto_63389 - BLOCK
      ?auto_63387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63385 ?auto_63384 ) ( ON-TABLE ?auto_63384 ) ( not ( = ?auto_63384 ?auto_63385 ) ) ( not ( = ?auto_63384 ?auto_63390 ) ) ( not ( = ?auto_63384 ?auto_63388 ) ) ( not ( = ?auto_63385 ?auto_63390 ) ) ( not ( = ?auto_63385 ?auto_63388 ) ) ( not ( = ?auto_63390 ?auto_63388 ) ) ( ON ?auto_63390 ?auto_63385 ) ( CLEAR ?auto_63386 ) ( ON-TABLE ?auto_63389 ) ( ON ?auto_63387 ?auto_63389 ) ( ON ?auto_63386 ?auto_63387 ) ( not ( = ?auto_63389 ?auto_63387 ) ) ( not ( = ?auto_63389 ?auto_63386 ) ) ( not ( = ?auto_63389 ?auto_63388 ) ) ( not ( = ?auto_63387 ?auto_63386 ) ) ( not ( = ?auto_63387 ?auto_63388 ) ) ( not ( = ?auto_63386 ?auto_63388 ) ) ( not ( = ?auto_63384 ?auto_63386 ) ) ( not ( = ?auto_63384 ?auto_63389 ) ) ( not ( = ?auto_63384 ?auto_63387 ) ) ( not ( = ?auto_63385 ?auto_63386 ) ) ( not ( = ?auto_63385 ?auto_63389 ) ) ( not ( = ?auto_63385 ?auto_63387 ) ) ( not ( = ?auto_63390 ?auto_63386 ) ) ( not ( = ?auto_63390 ?auto_63389 ) ) ( not ( = ?auto_63390 ?auto_63387 ) ) ( ON ?auto_63388 ?auto_63390 ) ( CLEAR ?auto_63388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63384 ?auto_63385 ?auto_63390 )
      ( MAKE-1PILE ?auto_63384 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63391 - BLOCK
    )
    :vars
    (
      ?auto_63395 - BLOCK
      ?auto_63396 - BLOCK
      ?auto_63394 - BLOCK
      ?auto_63393 - BLOCK
      ?auto_63392 - BLOCK
      ?auto_63397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63395 ?auto_63391 ) ( ON-TABLE ?auto_63391 ) ( not ( = ?auto_63391 ?auto_63395 ) ) ( not ( = ?auto_63391 ?auto_63396 ) ) ( not ( = ?auto_63391 ?auto_63394 ) ) ( not ( = ?auto_63395 ?auto_63396 ) ) ( not ( = ?auto_63395 ?auto_63394 ) ) ( not ( = ?auto_63396 ?auto_63394 ) ) ( ON ?auto_63396 ?auto_63395 ) ( ON-TABLE ?auto_63393 ) ( ON ?auto_63392 ?auto_63393 ) ( not ( = ?auto_63393 ?auto_63392 ) ) ( not ( = ?auto_63393 ?auto_63397 ) ) ( not ( = ?auto_63393 ?auto_63394 ) ) ( not ( = ?auto_63392 ?auto_63397 ) ) ( not ( = ?auto_63392 ?auto_63394 ) ) ( not ( = ?auto_63397 ?auto_63394 ) ) ( not ( = ?auto_63391 ?auto_63397 ) ) ( not ( = ?auto_63391 ?auto_63393 ) ) ( not ( = ?auto_63391 ?auto_63392 ) ) ( not ( = ?auto_63395 ?auto_63397 ) ) ( not ( = ?auto_63395 ?auto_63393 ) ) ( not ( = ?auto_63395 ?auto_63392 ) ) ( not ( = ?auto_63396 ?auto_63397 ) ) ( not ( = ?auto_63396 ?auto_63393 ) ) ( not ( = ?auto_63396 ?auto_63392 ) ) ( ON ?auto_63394 ?auto_63396 ) ( CLEAR ?auto_63394 ) ( HOLDING ?auto_63397 ) ( CLEAR ?auto_63392 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63393 ?auto_63392 ?auto_63397 )
      ( MAKE-1PILE ?auto_63391 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63398 - BLOCK
    )
    :vars
    (
      ?auto_63401 - BLOCK
      ?auto_63400 - BLOCK
      ?auto_63403 - BLOCK
      ?auto_63402 - BLOCK
      ?auto_63399 - BLOCK
      ?auto_63404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63401 ?auto_63398 ) ( ON-TABLE ?auto_63398 ) ( not ( = ?auto_63398 ?auto_63401 ) ) ( not ( = ?auto_63398 ?auto_63400 ) ) ( not ( = ?auto_63398 ?auto_63403 ) ) ( not ( = ?auto_63401 ?auto_63400 ) ) ( not ( = ?auto_63401 ?auto_63403 ) ) ( not ( = ?auto_63400 ?auto_63403 ) ) ( ON ?auto_63400 ?auto_63401 ) ( ON-TABLE ?auto_63402 ) ( ON ?auto_63399 ?auto_63402 ) ( not ( = ?auto_63402 ?auto_63399 ) ) ( not ( = ?auto_63402 ?auto_63404 ) ) ( not ( = ?auto_63402 ?auto_63403 ) ) ( not ( = ?auto_63399 ?auto_63404 ) ) ( not ( = ?auto_63399 ?auto_63403 ) ) ( not ( = ?auto_63404 ?auto_63403 ) ) ( not ( = ?auto_63398 ?auto_63404 ) ) ( not ( = ?auto_63398 ?auto_63402 ) ) ( not ( = ?auto_63398 ?auto_63399 ) ) ( not ( = ?auto_63401 ?auto_63404 ) ) ( not ( = ?auto_63401 ?auto_63402 ) ) ( not ( = ?auto_63401 ?auto_63399 ) ) ( not ( = ?auto_63400 ?auto_63404 ) ) ( not ( = ?auto_63400 ?auto_63402 ) ) ( not ( = ?auto_63400 ?auto_63399 ) ) ( ON ?auto_63403 ?auto_63400 ) ( CLEAR ?auto_63399 ) ( ON ?auto_63404 ?auto_63403 ) ( CLEAR ?auto_63404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63398 ?auto_63401 ?auto_63400 ?auto_63403 )
      ( MAKE-1PILE ?auto_63398 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63405 - BLOCK
    )
    :vars
    (
      ?auto_63408 - BLOCK
      ?auto_63410 - BLOCK
      ?auto_63407 - BLOCK
      ?auto_63409 - BLOCK
      ?auto_63406 - BLOCK
      ?auto_63411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63408 ?auto_63405 ) ( ON-TABLE ?auto_63405 ) ( not ( = ?auto_63405 ?auto_63408 ) ) ( not ( = ?auto_63405 ?auto_63410 ) ) ( not ( = ?auto_63405 ?auto_63407 ) ) ( not ( = ?auto_63408 ?auto_63410 ) ) ( not ( = ?auto_63408 ?auto_63407 ) ) ( not ( = ?auto_63410 ?auto_63407 ) ) ( ON ?auto_63410 ?auto_63408 ) ( ON-TABLE ?auto_63409 ) ( not ( = ?auto_63409 ?auto_63406 ) ) ( not ( = ?auto_63409 ?auto_63411 ) ) ( not ( = ?auto_63409 ?auto_63407 ) ) ( not ( = ?auto_63406 ?auto_63411 ) ) ( not ( = ?auto_63406 ?auto_63407 ) ) ( not ( = ?auto_63411 ?auto_63407 ) ) ( not ( = ?auto_63405 ?auto_63411 ) ) ( not ( = ?auto_63405 ?auto_63409 ) ) ( not ( = ?auto_63405 ?auto_63406 ) ) ( not ( = ?auto_63408 ?auto_63411 ) ) ( not ( = ?auto_63408 ?auto_63409 ) ) ( not ( = ?auto_63408 ?auto_63406 ) ) ( not ( = ?auto_63410 ?auto_63411 ) ) ( not ( = ?auto_63410 ?auto_63409 ) ) ( not ( = ?auto_63410 ?auto_63406 ) ) ( ON ?auto_63407 ?auto_63410 ) ( ON ?auto_63411 ?auto_63407 ) ( CLEAR ?auto_63411 ) ( HOLDING ?auto_63406 ) ( CLEAR ?auto_63409 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63409 ?auto_63406 )
      ( MAKE-1PILE ?auto_63405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63412 - BLOCK
    )
    :vars
    (
      ?auto_63416 - BLOCK
      ?auto_63414 - BLOCK
      ?auto_63415 - BLOCK
      ?auto_63418 - BLOCK
      ?auto_63417 - BLOCK
      ?auto_63413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63416 ?auto_63412 ) ( ON-TABLE ?auto_63412 ) ( not ( = ?auto_63412 ?auto_63416 ) ) ( not ( = ?auto_63412 ?auto_63414 ) ) ( not ( = ?auto_63412 ?auto_63415 ) ) ( not ( = ?auto_63416 ?auto_63414 ) ) ( not ( = ?auto_63416 ?auto_63415 ) ) ( not ( = ?auto_63414 ?auto_63415 ) ) ( ON ?auto_63414 ?auto_63416 ) ( ON-TABLE ?auto_63418 ) ( not ( = ?auto_63418 ?auto_63417 ) ) ( not ( = ?auto_63418 ?auto_63413 ) ) ( not ( = ?auto_63418 ?auto_63415 ) ) ( not ( = ?auto_63417 ?auto_63413 ) ) ( not ( = ?auto_63417 ?auto_63415 ) ) ( not ( = ?auto_63413 ?auto_63415 ) ) ( not ( = ?auto_63412 ?auto_63413 ) ) ( not ( = ?auto_63412 ?auto_63418 ) ) ( not ( = ?auto_63412 ?auto_63417 ) ) ( not ( = ?auto_63416 ?auto_63413 ) ) ( not ( = ?auto_63416 ?auto_63418 ) ) ( not ( = ?auto_63416 ?auto_63417 ) ) ( not ( = ?auto_63414 ?auto_63413 ) ) ( not ( = ?auto_63414 ?auto_63418 ) ) ( not ( = ?auto_63414 ?auto_63417 ) ) ( ON ?auto_63415 ?auto_63414 ) ( ON ?auto_63413 ?auto_63415 ) ( CLEAR ?auto_63418 ) ( ON ?auto_63417 ?auto_63413 ) ( CLEAR ?auto_63417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63412 ?auto_63416 ?auto_63414 ?auto_63415 ?auto_63413 )
      ( MAKE-1PILE ?auto_63412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63419 - BLOCK
    )
    :vars
    (
      ?auto_63420 - BLOCK
      ?auto_63425 - BLOCK
      ?auto_63421 - BLOCK
      ?auto_63424 - BLOCK
      ?auto_63422 - BLOCK
      ?auto_63423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63420 ?auto_63419 ) ( ON-TABLE ?auto_63419 ) ( not ( = ?auto_63419 ?auto_63420 ) ) ( not ( = ?auto_63419 ?auto_63425 ) ) ( not ( = ?auto_63419 ?auto_63421 ) ) ( not ( = ?auto_63420 ?auto_63425 ) ) ( not ( = ?auto_63420 ?auto_63421 ) ) ( not ( = ?auto_63425 ?auto_63421 ) ) ( ON ?auto_63425 ?auto_63420 ) ( not ( = ?auto_63424 ?auto_63422 ) ) ( not ( = ?auto_63424 ?auto_63423 ) ) ( not ( = ?auto_63424 ?auto_63421 ) ) ( not ( = ?auto_63422 ?auto_63423 ) ) ( not ( = ?auto_63422 ?auto_63421 ) ) ( not ( = ?auto_63423 ?auto_63421 ) ) ( not ( = ?auto_63419 ?auto_63423 ) ) ( not ( = ?auto_63419 ?auto_63424 ) ) ( not ( = ?auto_63419 ?auto_63422 ) ) ( not ( = ?auto_63420 ?auto_63423 ) ) ( not ( = ?auto_63420 ?auto_63424 ) ) ( not ( = ?auto_63420 ?auto_63422 ) ) ( not ( = ?auto_63425 ?auto_63423 ) ) ( not ( = ?auto_63425 ?auto_63424 ) ) ( not ( = ?auto_63425 ?auto_63422 ) ) ( ON ?auto_63421 ?auto_63425 ) ( ON ?auto_63423 ?auto_63421 ) ( ON ?auto_63422 ?auto_63423 ) ( CLEAR ?auto_63422 ) ( HOLDING ?auto_63424 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63424 )
      ( MAKE-1PILE ?auto_63419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63426 - BLOCK
    )
    :vars
    (
      ?auto_63432 - BLOCK
      ?auto_63427 - BLOCK
      ?auto_63431 - BLOCK
      ?auto_63430 - BLOCK
      ?auto_63428 - BLOCK
      ?auto_63429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63432 ?auto_63426 ) ( ON-TABLE ?auto_63426 ) ( not ( = ?auto_63426 ?auto_63432 ) ) ( not ( = ?auto_63426 ?auto_63427 ) ) ( not ( = ?auto_63426 ?auto_63431 ) ) ( not ( = ?auto_63432 ?auto_63427 ) ) ( not ( = ?auto_63432 ?auto_63431 ) ) ( not ( = ?auto_63427 ?auto_63431 ) ) ( ON ?auto_63427 ?auto_63432 ) ( not ( = ?auto_63430 ?auto_63428 ) ) ( not ( = ?auto_63430 ?auto_63429 ) ) ( not ( = ?auto_63430 ?auto_63431 ) ) ( not ( = ?auto_63428 ?auto_63429 ) ) ( not ( = ?auto_63428 ?auto_63431 ) ) ( not ( = ?auto_63429 ?auto_63431 ) ) ( not ( = ?auto_63426 ?auto_63429 ) ) ( not ( = ?auto_63426 ?auto_63430 ) ) ( not ( = ?auto_63426 ?auto_63428 ) ) ( not ( = ?auto_63432 ?auto_63429 ) ) ( not ( = ?auto_63432 ?auto_63430 ) ) ( not ( = ?auto_63432 ?auto_63428 ) ) ( not ( = ?auto_63427 ?auto_63429 ) ) ( not ( = ?auto_63427 ?auto_63430 ) ) ( not ( = ?auto_63427 ?auto_63428 ) ) ( ON ?auto_63431 ?auto_63427 ) ( ON ?auto_63429 ?auto_63431 ) ( ON ?auto_63428 ?auto_63429 ) ( ON ?auto_63430 ?auto_63428 ) ( CLEAR ?auto_63430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63426 ?auto_63432 ?auto_63427 ?auto_63431 ?auto_63429 ?auto_63428 )
      ( MAKE-1PILE ?auto_63426 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63439 - BLOCK
      ?auto_63440 - BLOCK
      ?auto_63441 - BLOCK
      ?auto_63442 - BLOCK
      ?auto_63443 - BLOCK
      ?auto_63444 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63444 ) ( CLEAR ?auto_63443 ) ( ON-TABLE ?auto_63439 ) ( ON ?auto_63440 ?auto_63439 ) ( ON ?auto_63441 ?auto_63440 ) ( ON ?auto_63442 ?auto_63441 ) ( ON ?auto_63443 ?auto_63442 ) ( not ( = ?auto_63439 ?auto_63440 ) ) ( not ( = ?auto_63439 ?auto_63441 ) ) ( not ( = ?auto_63439 ?auto_63442 ) ) ( not ( = ?auto_63439 ?auto_63443 ) ) ( not ( = ?auto_63439 ?auto_63444 ) ) ( not ( = ?auto_63440 ?auto_63441 ) ) ( not ( = ?auto_63440 ?auto_63442 ) ) ( not ( = ?auto_63440 ?auto_63443 ) ) ( not ( = ?auto_63440 ?auto_63444 ) ) ( not ( = ?auto_63441 ?auto_63442 ) ) ( not ( = ?auto_63441 ?auto_63443 ) ) ( not ( = ?auto_63441 ?auto_63444 ) ) ( not ( = ?auto_63442 ?auto_63443 ) ) ( not ( = ?auto_63442 ?auto_63444 ) ) ( not ( = ?auto_63443 ?auto_63444 ) ) )
    :subtasks
    ( ( !STACK ?auto_63444 ?auto_63443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63445 - BLOCK
      ?auto_63446 - BLOCK
      ?auto_63447 - BLOCK
      ?auto_63448 - BLOCK
      ?auto_63449 - BLOCK
      ?auto_63450 - BLOCK
    )
    :vars
    (
      ?auto_63451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63449 ) ( ON-TABLE ?auto_63445 ) ( ON ?auto_63446 ?auto_63445 ) ( ON ?auto_63447 ?auto_63446 ) ( ON ?auto_63448 ?auto_63447 ) ( ON ?auto_63449 ?auto_63448 ) ( not ( = ?auto_63445 ?auto_63446 ) ) ( not ( = ?auto_63445 ?auto_63447 ) ) ( not ( = ?auto_63445 ?auto_63448 ) ) ( not ( = ?auto_63445 ?auto_63449 ) ) ( not ( = ?auto_63445 ?auto_63450 ) ) ( not ( = ?auto_63446 ?auto_63447 ) ) ( not ( = ?auto_63446 ?auto_63448 ) ) ( not ( = ?auto_63446 ?auto_63449 ) ) ( not ( = ?auto_63446 ?auto_63450 ) ) ( not ( = ?auto_63447 ?auto_63448 ) ) ( not ( = ?auto_63447 ?auto_63449 ) ) ( not ( = ?auto_63447 ?auto_63450 ) ) ( not ( = ?auto_63448 ?auto_63449 ) ) ( not ( = ?auto_63448 ?auto_63450 ) ) ( not ( = ?auto_63449 ?auto_63450 ) ) ( ON ?auto_63450 ?auto_63451 ) ( CLEAR ?auto_63450 ) ( HAND-EMPTY ) ( not ( = ?auto_63445 ?auto_63451 ) ) ( not ( = ?auto_63446 ?auto_63451 ) ) ( not ( = ?auto_63447 ?auto_63451 ) ) ( not ( = ?auto_63448 ?auto_63451 ) ) ( not ( = ?auto_63449 ?auto_63451 ) ) ( not ( = ?auto_63450 ?auto_63451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63450 ?auto_63451 )
      ( MAKE-6PILE ?auto_63445 ?auto_63446 ?auto_63447 ?auto_63448 ?auto_63449 ?auto_63450 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63452 - BLOCK
      ?auto_63453 - BLOCK
      ?auto_63454 - BLOCK
      ?auto_63455 - BLOCK
      ?auto_63456 - BLOCK
      ?auto_63457 - BLOCK
    )
    :vars
    (
      ?auto_63458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63452 ) ( ON ?auto_63453 ?auto_63452 ) ( ON ?auto_63454 ?auto_63453 ) ( ON ?auto_63455 ?auto_63454 ) ( not ( = ?auto_63452 ?auto_63453 ) ) ( not ( = ?auto_63452 ?auto_63454 ) ) ( not ( = ?auto_63452 ?auto_63455 ) ) ( not ( = ?auto_63452 ?auto_63456 ) ) ( not ( = ?auto_63452 ?auto_63457 ) ) ( not ( = ?auto_63453 ?auto_63454 ) ) ( not ( = ?auto_63453 ?auto_63455 ) ) ( not ( = ?auto_63453 ?auto_63456 ) ) ( not ( = ?auto_63453 ?auto_63457 ) ) ( not ( = ?auto_63454 ?auto_63455 ) ) ( not ( = ?auto_63454 ?auto_63456 ) ) ( not ( = ?auto_63454 ?auto_63457 ) ) ( not ( = ?auto_63455 ?auto_63456 ) ) ( not ( = ?auto_63455 ?auto_63457 ) ) ( not ( = ?auto_63456 ?auto_63457 ) ) ( ON ?auto_63457 ?auto_63458 ) ( CLEAR ?auto_63457 ) ( not ( = ?auto_63452 ?auto_63458 ) ) ( not ( = ?auto_63453 ?auto_63458 ) ) ( not ( = ?auto_63454 ?auto_63458 ) ) ( not ( = ?auto_63455 ?auto_63458 ) ) ( not ( = ?auto_63456 ?auto_63458 ) ) ( not ( = ?auto_63457 ?auto_63458 ) ) ( HOLDING ?auto_63456 ) ( CLEAR ?auto_63455 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63452 ?auto_63453 ?auto_63454 ?auto_63455 ?auto_63456 )
      ( MAKE-6PILE ?auto_63452 ?auto_63453 ?auto_63454 ?auto_63455 ?auto_63456 ?auto_63457 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63459 - BLOCK
      ?auto_63460 - BLOCK
      ?auto_63461 - BLOCK
      ?auto_63462 - BLOCK
      ?auto_63463 - BLOCK
      ?auto_63464 - BLOCK
    )
    :vars
    (
      ?auto_63465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63459 ) ( ON ?auto_63460 ?auto_63459 ) ( ON ?auto_63461 ?auto_63460 ) ( ON ?auto_63462 ?auto_63461 ) ( not ( = ?auto_63459 ?auto_63460 ) ) ( not ( = ?auto_63459 ?auto_63461 ) ) ( not ( = ?auto_63459 ?auto_63462 ) ) ( not ( = ?auto_63459 ?auto_63463 ) ) ( not ( = ?auto_63459 ?auto_63464 ) ) ( not ( = ?auto_63460 ?auto_63461 ) ) ( not ( = ?auto_63460 ?auto_63462 ) ) ( not ( = ?auto_63460 ?auto_63463 ) ) ( not ( = ?auto_63460 ?auto_63464 ) ) ( not ( = ?auto_63461 ?auto_63462 ) ) ( not ( = ?auto_63461 ?auto_63463 ) ) ( not ( = ?auto_63461 ?auto_63464 ) ) ( not ( = ?auto_63462 ?auto_63463 ) ) ( not ( = ?auto_63462 ?auto_63464 ) ) ( not ( = ?auto_63463 ?auto_63464 ) ) ( ON ?auto_63464 ?auto_63465 ) ( not ( = ?auto_63459 ?auto_63465 ) ) ( not ( = ?auto_63460 ?auto_63465 ) ) ( not ( = ?auto_63461 ?auto_63465 ) ) ( not ( = ?auto_63462 ?auto_63465 ) ) ( not ( = ?auto_63463 ?auto_63465 ) ) ( not ( = ?auto_63464 ?auto_63465 ) ) ( CLEAR ?auto_63462 ) ( ON ?auto_63463 ?auto_63464 ) ( CLEAR ?auto_63463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63465 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63465 ?auto_63464 )
      ( MAKE-6PILE ?auto_63459 ?auto_63460 ?auto_63461 ?auto_63462 ?auto_63463 ?auto_63464 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63466 - BLOCK
      ?auto_63467 - BLOCK
      ?auto_63468 - BLOCK
      ?auto_63469 - BLOCK
      ?auto_63470 - BLOCK
      ?auto_63471 - BLOCK
    )
    :vars
    (
      ?auto_63472 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63466 ) ( ON ?auto_63467 ?auto_63466 ) ( ON ?auto_63468 ?auto_63467 ) ( not ( = ?auto_63466 ?auto_63467 ) ) ( not ( = ?auto_63466 ?auto_63468 ) ) ( not ( = ?auto_63466 ?auto_63469 ) ) ( not ( = ?auto_63466 ?auto_63470 ) ) ( not ( = ?auto_63466 ?auto_63471 ) ) ( not ( = ?auto_63467 ?auto_63468 ) ) ( not ( = ?auto_63467 ?auto_63469 ) ) ( not ( = ?auto_63467 ?auto_63470 ) ) ( not ( = ?auto_63467 ?auto_63471 ) ) ( not ( = ?auto_63468 ?auto_63469 ) ) ( not ( = ?auto_63468 ?auto_63470 ) ) ( not ( = ?auto_63468 ?auto_63471 ) ) ( not ( = ?auto_63469 ?auto_63470 ) ) ( not ( = ?auto_63469 ?auto_63471 ) ) ( not ( = ?auto_63470 ?auto_63471 ) ) ( ON ?auto_63471 ?auto_63472 ) ( not ( = ?auto_63466 ?auto_63472 ) ) ( not ( = ?auto_63467 ?auto_63472 ) ) ( not ( = ?auto_63468 ?auto_63472 ) ) ( not ( = ?auto_63469 ?auto_63472 ) ) ( not ( = ?auto_63470 ?auto_63472 ) ) ( not ( = ?auto_63471 ?auto_63472 ) ) ( ON ?auto_63470 ?auto_63471 ) ( CLEAR ?auto_63470 ) ( ON-TABLE ?auto_63472 ) ( HOLDING ?auto_63469 ) ( CLEAR ?auto_63468 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63466 ?auto_63467 ?auto_63468 ?auto_63469 )
      ( MAKE-6PILE ?auto_63466 ?auto_63467 ?auto_63468 ?auto_63469 ?auto_63470 ?auto_63471 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63473 - BLOCK
      ?auto_63474 - BLOCK
      ?auto_63475 - BLOCK
      ?auto_63476 - BLOCK
      ?auto_63477 - BLOCK
      ?auto_63478 - BLOCK
    )
    :vars
    (
      ?auto_63479 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63473 ) ( ON ?auto_63474 ?auto_63473 ) ( ON ?auto_63475 ?auto_63474 ) ( not ( = ?auto_63473 ?auto_63474 ) ) ( not ( = ?auto_63473 ?auto_63475 ) ) ( not ( = ?auto_63473 ?auto_63476 ) ) ( not ( = ?auto_63473 ?auto_63477 ) ) ( not ( = ?auto_63473 ?auto_63478 ) ) ( not ( = ?auto_63474 ?auto_63475 ) ) ( not ( = ?auto_63474 ?auto_63476 ) ) ( not ( = ?auto_63474 ?auto_63477 ) ) ( not ( = ?auto_63474 ?auto_63478 ) ) ( not ( = ?auto_63475 ?auto_63476 ) ) ( not ( = ?auto_63475 ?auto_63477 ) ) ( not ( = ?auto_63475 ?auto_63478 ) ) ( not ( = ?auto_63476 ?auto_63477 ) ) ( not ( = ?auto_63476 ?auto_63478 ) ) ( not ( = ?auto_63477 ?auto_63478 ) ) ( ON ?auto_63478 ?auto_63479 ) ( not ( = ?auto_63473 ?auto_63479 ) ) ( not ( = ?auto_63474 ?auto_63479 ) ) ( not ( = ?auto_63475 ?auto_63479 ) ) ( not ( = ?auto_63476 ?auto_63479 ) ) ( not ( = ?auto_63477 ?auto_63479 ) ) ( not ( = ?auto_63478 ?auto_63479 ) ) ( ON ?auto_63477 ?auto_63478 ) ( ON-TABLE ?auto_63479 ) ( CLEAR ?auto_63475 ) ( ON ?auto_63476 ?auto_63477 ) ( CLEAR ?auto_63476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63479 ?auto_63478 ?auto_63477 )
      ( MAKE-6PILE ?auto_63473 ?auto_63474 ?auto_63475 ?auto_63476 ?auto_63477 ?auto_63478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63480 - BLOCK
      ?auto_63481 - BLOCK
      ?auto_63482 - BLOCK
      ?auto_63483 - BLOCK
      ?auto_63484 - BLOCK
      ?auto_63485 - BLOCK
    )
    :vars
    (
      ?auto_63486 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63480 ) ( ON ?auto_63481 ?auto_63480 ) ( not ( = ?auto_63480 ?auto_63481 ) ) ( not ( = ?auto_63480 ?auto_63482 ) ) ( not ( = ?auto_63480 ?auto_63483 ) ) ( not ( = ?auto_63480 ?auto_63484 ) ) ( not ( = ?auto_63480 ?auto_63485 ) ) ( not ( = ?auto_63481 ?auto_63482 ) ) ( not ( = ?auto_63481 ?auto_63483 ) ) ( not ( = ?auto_63481 ?auto_63484 ) ) ( not ( = ?auto_63481 ?auto_63485 ) ) ( not ( = ?auto_63482 ?auto_63483 ) ) ( not ( = ?auto_63482 ?auto_63484 ) ) ( not ( = ?auto_63482 ?auto_63485 ) ) ( not ( = ?auto_63483 ?auto_63484 ) ) ( not ( = ?auto_63483 ?auto_63485 ) ) ( not ( = ?auto_63484 ?auto_63485 ) ) ( ON ?auto_63485 ?auto_63486 ) ( not ( = ?auto_63480 ?auto_63486 ) ) ( not ( = ?auto_63481 ?auto_63486 ) ) ( not ( = ?auto_63482 ?auto_63486 ) ) ( not ( = ?auto_63483 ?auto_63486 ) ) ( not ( = ?auto_63484 ?auto_63486 ) ) ( not ( = ?auto_63485 ?auto_63486 ) ) ( ON ?auto_63484 ?auto_63485 ) ( ON-TABLE ?auto_63486 ) ( ON ?auto_63483 ?auto_63484 ) ( CLEAR ?auto_63483 ) ( HOLDING ?auto_63482 ) ( CLEAR ?auto_63481 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63480 ?auto_63481 ?auto_63482 )
      ( MAKE-6PILE ?auto_63480 ?auto_63481 ?auto_63482 ?auto_63483 ?auto_63484 ?auto_63485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63487 - BLOCK
      ?auto_63488 - BLOCK
      ?auto_63489 - BLOCK
      ?auto_63490 - BLOCK
      ?auto_63491 - BLOCK
      ?auto_63492 - BLOCK
    )
    :vars
    (
      ?auto_63493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63487 ) ( ON ?auto_63488 ?auto_63487 ) ( not ( = ?auto_63487 ?auto_63488 ) ) ( not ( = ?auto_63487 ?auto_63489 ) ) ( not ( = ?auto_63487 ?auto_63490 ) ) ( not ( = ?auto_63487 ?auto_63491 ) ) ( not ( = ?auto_63487 ?auto_63492 ) ) ( not ( = ?auto_63488 ?auto_63489 ) ) ( not ( = ?auto_63488 ?auto_63490 ) ) ( not ( = ?auto_63488 ?auto_63491 ) ) ( not ( = ?auto_63488 ?auto_63492 ) ) ( not ( = ?auto_63489 ?auto_63490 ) ) ( not ( = ?auto_63489 ?auto_63491 ) ) ( not ( = ?auto_63489 ?auto_63492 ) ) ( not ( = ?auto_63490 ?auto_63491 ) ) ( not ( = ?auto_63490 ?auto_63492 ) ) ( not ( = ?auto_63491 ?auto_63492 ) ) ( ON ?auto_63492 ?auto_63493 ) ( not ( = ?auto_63487 ?auto_63493 ) ) ( not ( = ?auto_63488 ?auto_63493 ) ) ( not ( = ?auto_63489 ?auto_63493 ) ) ( not ( = ?auto_63490 ?auto_63493 ) ) ( not ( = ?auto_63491 ?auto_63493 ) ) ( not ( = ?auto_63492 ?auto_63493 ) ) ( ON ?auto_63491 ?auto_63492 ) ( ON-TABLE ?auto_63493 ) ( ON ?auto_63490 ?auto_63491 ) ( CLEAR ?auto_63488 ) ( ON ?auto_63489 ?auto_63490 ) ( CLEAR ?auto_63489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63493 ?auto_63492 ?auto_63491 ?auto_63490 )
      ( MAKE-6PILE ?auto_63487 ?auto_63488 ?auto_63489 ?auto_63490 ?auto_63491 ?auto_63492 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63494 - BLOCK
      ?auto_63495 - BLOCK
      ?auto_63496 - BLOCK
      ?auto_63497 - BLOCK
      ?auto_63498 - BLOCK
      ?auto_63499 - BLOCK
    )
    :vars
    (
      ?auto_63500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63494 ) ( not ( = ?auto_63494 ?auto_63495 ) ) ( not ( = ?auto_63494 ?auto_63496 ) ) ( not ( = ?auto_63494 ?auto_63497 ) ) ( not ( = ?auto_63494 ?auto_63498 ) ) ( not ( = ?auto_63494 ?auto_63499 ) ) ( not ( = ?auto_63495 ?auto_63496 ) ) ( not ( = ?auto_63495 ?auto_63497 ) ) ( not ( = ?auto_63495 ?auto_63498 ) ) ( not ( = ?auto_63495 ?auto_63499 ) ) ( not ( = ?auto_63496 ?auto_63497 ) ) ( not ( = ?auto_63496 ?auto_63498 ) ) ( not ( = ?auto_63496 ?auto_63499 ) ) ( not ( = ?auto_63497 ?auto_63498 ) ) ( not ( = ?auto_63497 ?auto_63499 ) ) ( not ( = ?auto_63498 ?auto_63499 ) ) ( ON ?auto_63499 ?auto_63500 ) ( not ( = ?auto_63494 ?auto_63500 ) ) ( not ( = ?auto_63495 ?auto_63500 ) ) ( not ( = ?auto_63496 ?auto_63500 ) ) ( not ( = ?auto_63497 ?auto_63500 ) ) ( not ( = ?auto_63498 ?auto_63500 ) ) ( not ( = ?auto_63499 ?auto_63500 ) ) ( ON ?auto_63498 ?auto_63499 ) ( ON-TABLE ?auto_63500 ) ( ON ?auto_63497 ?auto_63498 ) ( ON ?auto_63496 ?auto_63497 ) ( CLEAR ?auto_63496 ) ( HOLDING ?auto_63495 ) ( CLEAR ?auto_63494 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63494 ?auto_63495 )
      ( MAKE-6PILE ?auto_63494 ?auto_63495 ?auto_63496 ?auto_63497 ?auto_63498 ?auto_63499 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63501 - BLOCK
      ?auto_63502 - BLOCK
      ?auto_63503 - BLOCK
      ?auto_63504 - BLOCK
      ?auto_63505 - BLOCK
      ?auto_63506 - BLOCK
    )
    :vars
    (
      ?auto_63507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63501 ) ( not ( = ?auto_63501 ?auto_63502 ) ) ( not ( = ?auto_63501 ?auto_63503 ) ) ( not ( = ?auto_63501 ?auto_63504 ) ) ( not ( = ?auto_63501 ?auto_63505 ) ) ( not ( = ?auto_63501 ?auto_63506 ) ) ( not ( = ?auto_63502 ?auto_63503 ) ) ( not ( = ?auto_63502 ?auto_63504 ) ) ( not ( = ?auto_63502 ?auto_63505 ) ) ( not ( = ?auto_63502 ?auto_63506 ) ) ( not ( = ?auto_63503 ?auto_63504 ) ) ( not ( = ?auto_63503 ?auto_63505 ) ) ( not ( = ?auto_63503 ?auto_63506 ) ) ( not ( = ?auto_63504 ?auto_63505 ) ) ( not ( = ?auto_63504 ?auto_63506 ) ) ( not ( = ?auto_63505 ?auto_63506 ) ) ( ON ?auto_63506 ?auto_63507 ) ( not ( = ?auto_63501 ?auto_63507 ) ) ( not ( = ?auto_63502 ?auto_63507 ) ) ( not ( = ?auto_63503 ?auto_63507 ) ) ( not ( = ?auto_63504 ?auto_63507 ) ) ( not ( = ?auto_63505 ?auto_63507 ) ) ( not ( = ?auto_63506 ?auto_63507 ) ) ( ON ?auto_63505 ?auto_63506 ) ( ON-TABLE ?auto_63507 ) ( ON ?auto_63504 ?auto_63505 ) ( ON ?auto_63503 ?auto_63504 ) ( CLEAR ?auto_63501 ) ( ON ?auto_63502 ?auto_63503 ) ( CLEAR ?auto_63502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63507 ?auto_63506 ?auto_63505 ?auto_63504 ?auto_63503 )
      ( MAKE-6PILE ?auto_63501 ?auto_63502 ?auto_63503 ?auto_63504 ?auto_63505 ?auto_63506 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63508 - BLOCK
      ?auto_63509 - BLOCK
      ?auto_63510 - BLOCK
      ?auto_63511 - BLOCK
      ?auto_63512 - BLOCK
      ?auto_63513 - BLOCK
    )
    :vars
    (
      ?auto_63514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63508 ?auto_63509 ) ) ( not ( = ?auto_63508 ?auto_63510 ) ) ( not ( = ?auto_63508 ?auto_63511 ) ) ( not ( = ?auto_63508 ?auto_63512 ) ) ( not ( = ?auto_63508 ?auto_63513 ) ) ( not ( = ?auto_63509 ?auto_63510 ) ) ( not ( = ?auto_63509 ?auto_63511 ) ) ( not ( = ?auto_63509 ?auto_63512 ) ) ( not ( = ?auto_63509 ?auto_63513 ) ) ( not ( = ?auto_63510 ?auto_63511 ) ) ( not ( = ?auto_63510 ?auto_63512 ) ) ( not ( = ?auto_63510 ?auto_63513 ) ) ( not ( = ?auto_63511 ?auto_63512 ) ) ( not ( = ?auto_63511 ?auto_63513 ) ) ( not ( = ?auto_63512 ?auto_63513 ) ) ( ON ?auto_63513 ?auto_63514 ) ( not ( = ?auto_63508 ?auto_63514 ) ) ( not ( = ?auto_63509 ?auto_63514 ) ) ( not ( = ?auto_63510 ?auto_63514 ) ) ( not ( = ?auto_63511 ?auto_63514 ) ) ( not ( = ?auto_63512 ?auto_63514 ) ) ( not ( = ?auto_63513 ?auto_63514 ) ) ( ON ?auto_63512 ?auto_63513 ) ( ON-TABLE ?auto_63514 ) ( ON ?auto_63511 ?auto_63512 ) ( ON ?auto_63510 ?auto_63511 ) ( ON ?auto_63509 ?auto_63510 ) ( CLEAR ?auto_63509 ) ( HOLDING ?auto_63508 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63508 )
      ( MAKE-6PILE ?auto_63508 ?auto_63509 ?auto_63510 ?auto_63511 ?auto_63512 ?auto_63513 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63515 - BLOCK
      ?auto_63516 - BLOCK
      ?auto_63517 - BLOCK
      ?auto_63518 - BLOCK
      ?auto_63519 - BLOCK
      ?auto_63520 - BLOCK
    )
    :vars
    (
      ?auto_63521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63515 ?auto_63516 ) ) ( not ( = ?auto_63515 ?auto_63517 ) ) ( not ( = ?auto_63515 ?auto_63518 ) ) ( not ( = ?auto_63515 ?auto_63519 ) ) ( not ( = ?auto_63515 ?auto_63520 ) ) ( not ( = ?auto_63516 ?auto_63517 ) ) ( not ( = ?auto_63516 ?auto_63518 ) ) ( not ( = ?auto_63516 ?auto_63519 ) ) ( not ( = ?auto_63516 ?auto_63520 ) ) ( not ( = ?auto_63517 ?auto_63518 ) ) ( not ( = ?auto_63517 ?auto_63519 ) ) ( not ( = ?auto_63517 ?auto_63520 ) ) ( not ( = ?auto_63518 ?auto_63519 ) ) ( not ( = ?auto_63518 ?auto_63520 ) ) ( not ( = ?auto_63519 ?auto_63520 ) ) ( ON ?auto_63520 ?auto_63521 ) ( not ( = ?auto_63515 ?auto_63521 ) ) ( not ( = ?auto_63516 ?auto_63521 ) ) ( not ( = ?auto_63517 ?auto_63521 ) ) ( not ( = ?auto_63518 ?auto_63521 ) ) ( not ( = ?auto_63519 ?auto_63521 ) ) ( not ( = ?auto_63520 ?auto_63521 ) ) ( ON ?auto_63519 ?auto_63520 ) ( ON-TABLE ?auto_63521 ) ( ON ?auto_63518 ?auto_63519 ) ( ON ?auto_63517 ?auto_63518 ) ( ON ?auto_63516 ?auto_63517 ) ( ON ?auto_63515 ?auto_63516 ) ( CLEAR ?auto_63515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63521 ?auto_63520 ?auto_63519 ?auto_63518 ?auto_63517 ?auto_63516 )
      ( MAKE-6PILE ?auto_63515 ?auto_63516 ?auto_63517 ?auto_63518 ?auto_63519 ?auto_63520 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63527 - BLOCK
      ?auto_63528 - BLOCK
      ?auto_63529 - BLOCK
      ?auto_63530 - BLOCK
      ?auto_63531 - BLOCK
    )
    :vars
    (
      ?auto_63532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63532 ?auto_63531 ) ( CLEAR ?auto_63532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63527 ) ( ON ?auto_63528 ?auto_63527 ) ( ON ?auto_63529 ?auto_63528 ) ( ON ?auto_63530 ?auto_63529 ) ( ON ?auto_63531 ?auto_63530 ) ( not ( = ?auto_63527 ?auto_63528 ) ) ( not ( = ?auto_63527 ?auto_63529 ) ) ( not ( = ?auto_63527 ?auto_63530 ) ) ( not ( = ?auto_63527 ?auto_63531 ) ) ( not ( = ?auto_63527 ?auto_63532 ) ) ( not ( = ?auto_63528 ?auto_63529 ) ) ( not ( = ?auto_63528 ?auto_63530 ) ) ( not ( = ?auto_63528 ?auto_63531 ) ) ( not ( = ?auto_63528 ?auto_63532 ) ) ( not ( = ?auto_63529 ?auto_63530 ) ) ( not ( = ?auto_63529 ?auto_63531 ) ) ( not ( = ?auto_63529 ?auto_63532 ) ) ( not ( = ?auto_63530 ?auto_63531 ) ) ( not ( = ?auto_63530 ?auto_63532 ) ) ( not ( = ?auto_63531 ?auto_63532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63532 ?auto_63531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63546 - BLOCK
      ?auto_63547 - BLOCK
      ?auto_63548 - BLOCK
      ?auto_63549 - BLOCK
      ?auto_63550 - BLOCK
    )
    :vars
    (
      ?auto_63551 - BLOCK
      ?auto_63552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63546 ) ( ON ?auto_63547 ?auto_63546 ) ( ON ?auto_63548 ?auto_63547 ) ( ON ?auto_63549 ?auto_63548 ) ( not ( = ?auto_63546 ?auto_63547 ) ) ( not ( = ?auto_63546 ?auto_63548 ) ) ( not ( = ?auto_63546 ?auto_63549 ) ) ( not ( = ?auto_63546 ?auto_63550 ) ) ( not ( = ?auto_63546 ?auto_63551 ) ) ( not ( = ?auto_63547 ?auto_63548 ) ) ( not ( = ?auto_63547 ?auto_63549 ) ) ( not ( = ?auto_63547 ?auto_63550 ) ) ( not ( = ?auto_63547 ?auto_63551 ) ) ( not ( = ?auto_63548 ?auto_63549 ) ) ( not ( = ?auto_63548 ?auto_63550 ) ) ( not ( = ?auto_63548 ?auto_63551 ) ) ( not ( = ?auto_63549 ?auto_63550 ) ) ( not ( = ?auto_63549 ?auto_63551 ) ) ( not ( = ?auto_63550 ?auto_63551 ) ) ( ON ?auto_63551 ?auto_63552 ) ( CLEAR ?auto_63551 ) ( not ( = ?auto_63546 ?auto_63552 ) ) ( not ( = ?auto_63547 ?auto_63552 ) ) ( not ( = ?auto_63548 ?auto_63552 ) ) ( not ( = ?auto_63549 ?auto_63552 ) ) ( not ( = ?auto_63550 ?auto_63552 ) ) ( not ( = ?auto_63551 ?auto_63552 ) ) ( HOLDING ?auto_63550 ) ( CLEAR ?auto_63549 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63546 ?auto_63547 ?auto_63548 ?auto_63549 ?auto_63550 ?auto_63551 )
      ( MAKE-5PILE ?auto_63546 ?auto_63547 ?auto_63548 ?auto_63549 ?auto_63550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63553 - BLOCK
      ?auto_63554 - BLOCK
      ?auto_63555 - BLOCK
      ?auto_63556 - BLOCK
      ?auto_63557 - BLOCK
    )
    :vars
    (
      ?auto_63559 - BLOCK
      ?auto_63558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63553 ) ( ON ?auto_63554 ?auto_63553 ) ( ON ?auto_63555 ?auto_63554 ) ( ON ?auto_63556 ?auto_63555 ) ( not ( = ?auto_63553 ?auto_63554 ) ) ( not ( = ?auto_63553 ?auto_63555 ) ) ( not ( = ?auto_63553 ?auto_63556 ) ) ( not ( = ?auto_63553 ?auto_63557 ) ) ( not ( = ?auto_63553 ?auto_63559 ) ) ( not ( = ?auto_63554 ?auto_63555 ) ) ( not ( = ?auto_63554 ?auto_63556 ) ) ( not ( = ?auto_63554 ?auto_63557 ) ) ( not ( = ?auto_63554 ?auto_63559 ) ) ( not ( = ?auto_63555 ?auto_63556 ) ) ( not ( = ?auto_63555 ?auto_63557 ) ) ( not ( = ?auto_63555 ?auto_63559 ) ) ( not ( = ?auto_63556 ?auto_63557 ) ) ( not ( = ?auto_63556 ?auto_63559 ) ) ( not ( = ?auto_63557 ?auto_63559 ) ) ( ON ?auto_63559 ?auto_63558 ) ( not ( = ?auto_63553 ?auto_63558 ) ) ( not ( = ?auto_63554 ?auto_63558 ) ) ( not ( = ?auto_63555 ?auto_63558 ) ) ( not ( = ?auto_63556 ?auto_63558 ) ) ( not ( = ?auto_63557 ?auto_63558 ) ) ( not ( = ?auto_63559 ?auto_63558 ) ) ( CLEAR ?auto_63556 ) ( ON ?auto_63557 ?auto_63559 ) ( CLEAR ?auto_63557 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63558 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63558 ?auto_63559 )
      ( MAKE-5PILE ?auto_63553 ?auto_63554 ?auto_63555 ?auto_63556 ?auto_63557 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63560 - BLOCK
      ?auto_63561 - BLOCK
      ?auto_63562 - BLOCK
      ?auto_63563 - BLOCK
      ?auto_63564 - BLOCK
    )
    :vars
    (
      ?auto_63565 - BLOCK
      ?auto_63566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63560 ) ( ON ?auto_63561 ?auto_63560 ) ( ON ?auto_63562 ?auto_63561 ) ( not ( = ?auto_63560 ?auto_63561 ) ) ( not ( = ?auto_63560 ?auto_63562 ) ) ( not ( = ?auto_63560 ?auto_63563 ) ) ( not ( = ?auto_63560 ?auto_63564 ) ) ( not ( = ?auto_63560 ?auto_63565 ) ) ( not ( = ?auto_63561 ?auto_63562 ) ) ( not ( = ?auto_63561 ?auto_63563 ) ) ( not ( = ?auto_63561 ?auto_63564 ) ) ( not ( = ?auto_63561 ?auto_63565 ) ) ( not ( = ?auto_63562 ?auto_63563 ) ) ( not ( = ?auto_63562 ?auto_63564 ) ) ( not ( = ?auto_63562 ?auto_63565 ) ) ( not ( = ?auto_63563 ?auto_63564 ) ) ( not ( = ?auto_63563 ?auto_63565 ) ) ( not ( = ?auto_63564 ?auto_63565 ) ) ( ON ?auto_63565 ?auto_63566 ) ( not ( = ?auto_63560 ?auto_63566 ) ) ( not ( = ?auto_63561 ?auto_63566 ) ) ( not ( = ?auto_63562 ?auto_63566 ) ) ( not ( = ?auto_63563 ?auto_63566 ) ) ( not ( = ?auto_63564 ?auto_63566 ) ) ( not ( = ?auto_63565 ?auto_63566 ) ) ( ON ?auto_63564 ?auto_63565 ) ( CLEAR ?auto_63564 ) ( ON-TABLE ?auto_63566 ) ( HOLDING ?auto_63563 ) ( CLEAR ?auto_63562 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63560 ?auto_63561 ?auto_63562 ?auto_63563 )
      ( MAKE-5PILE ?auto_63560 ?auto_63561 ?auto_63562 ?auto_63563 ?auto_63564 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63567 - BLOCK
      ?auto_63568 - BLOCK
      ?auto_63569 - BLOCK
      ?auto_63570 - BLOCK
      ?auto_63571 - BLOCK
    )
    :vars
    (
      ?auto_63572 - BLOCK
      ?auto_63573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63567 ) ( ON ?auto_63568 ?auto_63567 ) ( ON ?auto_63569 ?auto_63568 ) ( not ( = ?auto_63567 ?auto_63568 ) ) ( not ( = ?auto_63567 ?auto_63569 ) ) ( not ( = ?auto_63567 ?auto_63570 ) ) ( not ( = ?auto_63567 ?auto_63571 ) ) ( not ( = ?auto_63567 ?auto_63572 ) ) ( not ( = ?auto_63568 ?auto_63569 ) ) ( not ( = ?auto_63568 ?auto_63570 ) ) ( not ( = ?auto_63568 ?auto_63571 ) ) ( not ( = ?auto_63568 ?auto_63572 ) ) ( not ( = ?auto_63569 ?auto_63570 ) ) ( not ( = ?auto_63569 ?auto_63571 ) ) ( not ( = ?auto_63569 ?auto_63572 ) ) ( not ( = ?auto_63570 ?auto_63571 ) ) ( not ( = ?auto_63570 ?auto_63572 ) ) ( not ( = ?auto_63571 ?auto_63572 ) ) ( ON ?auto_63572 ?auto_63573 ) ( not ( = ?auto_63567 ?auto_63573 ) ) ( not ( = ?auto_63568 ?auto_63573 ) ) ( not ( = ?auto_63569 ?auto_63573 ) ) ( not ( = ?auto_63570 ?auto_63573 ) ) ( not ( = ?auto_63571 ?auto_63573 ) ) ( not ( = ?auto_63572 ?auto_63573 ) ) ( ON ?auto_63571 ?auto_63572 ) ( ON-TABLE ?auto_63573 ) ( CLEAR ?auto_63569 ) ( ON ?auto_63570 ?auto_63571 ) ( CLEAR ?auto_63570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63573 ?auto_63572 ?auto_63571 )
      ( MAKE-5PILE ?auto_63567 ?auto_63568 ?auto_63569 ?auto_63570 ?auto_63571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63574 - BLOCK
      ?auto_63575 - BLOCK
      ?auto_63576 - BLOCK
      ?auto_63577 - BLOCK
      ?auto_63578 - BLOCK
    )
    :vars
    (
      ?auto_63580 - BLOCK
      ?auto_63579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63574 ) ( ON ?auto_63575 ?auto_63574 ) ( not ( = ?auto_63574 ?auto_63575 ) ) ( not ( = ?auto_63574 ?auto_63576 ) ) ( not ( = ?auto_63574 ?auto_63577 ) ) ( not ( = ?auto_63574 ?auto_63578 ) ) ( not ( = ?auto_63574 ?auto_63580 ) ) ( not ( = ?auto_63575 ?auto_63576 ) ) ( not ( = ?auto_63575 ?auto_63577 ) ) ( not ( = ?auto_63575 ?auto_63578 ) ) ( not ( = ?auto_63575 ?auto_63580 ) ) ( not ( = ?auto_63576 ?auto_63577 ) ) ( not ( = ?auto_63576 ?auto_63578 ) ) ( not ( = ?auto_63576 ?auto_63580 ) ) ( not ( = ?auto_63577 ?auto_63578 ) ) ( not ( = ?auto_63577 ?auto_63580 ) ) ( not ( = ?auto_63578 ?auto_63580 ) ) ( ON ?auto_63580 ?auto_63579 ) ( not ( = ?auto_63574 ?auto_63579 ) ) ( not ( = ?auto_63575 ?auto_63579 ) ) ( not ( = ?auto_63576 ?auto_63579 ) ) ( not ( = ?auto_63577 ?auto_63579 ) ) ( not ( = ?auto_63578 ?auto_63579 ) ) ( not ( = ?auto_63580 ?auto_63579 ) ) ( ON ?auto_63578 ?auto_63580 ) ( ON-TABLE ?auto_63579 ) ( ON ?auto_63577 ?auto_63578 ) ( CLEAR ?auto_63577 ) ( HOLDING ?auto_63576 ) ( CLEAR ?auto_63575 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63574 ?auto_63575 ?auto_63576 )
      ( MAKE-5PILE ?auto_63574 ?auto_63575 ?auto_63576 ?auto_63577 ?auto_63578 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63581 - BLOCK
      ?auto_63582 - BLOCK
      ?auto_63583 - BLOCK
      ?auto_63584 - BLOCK
      ?auto_63585 - BLOCK
    )
    :vars
    (
      ?auto_63587 - BLOCK
      ?auto_63586 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63581 ) ( ON ?auto_63582 ?auto_63581 ) ( not ( = ?auto_63581 ?auto_63582 ) ) ( not ( = ?auto_63581 ?auto_63583 ) ) ( not ( = ?auto_63581 ?auto_63584 ) ) ( not ( = ?auto_63581 ?auto_63585 ) ) ( not ( = ?auto_63581 ?auto_63587 ) ) ( not ( = ?auto_63582 ?auto_63583 ) ) ( not ( = ?auto_63582 ?auto_63584 ) ) ( not ( = ?auto_63582 ?auto_63585 ) ) ( not ( = ?auto_63582 ?auto_63587 ) ) ( not ( = ?auto_63583 ?auto_63584 ) ) ( not ( = ?auto_63583 ?auto_63585 ) ) ( not ( = ?auto_63583 ?auto_63587 ) ) ( not ( = ?auto_63584 ?auto_63585 ) ) ( not ( = ?auto_63584 ?auto_63587 ) ) ( not ( = ?auto_63585 ?auto_63587 ) ) ( ON ?auto_63587 ?auto_63586 ) ( not ( = ?auto_63581 ?auto_63586 ) ) ( not ( = ?auto_63582 ?auto_63586 ) ) ( not ( = ?auto_63583 ?auto_63586 ) ) ( not ( = ?auto_63584 ?auto_63586 ) ) ( not ( = ?auto_63585 ?auto_63586 ) ) ( not ( = ?auto_63587 ?auto_63586 ) ) ( ON ?auto_63585 ?auto_63587 ) ( ON-TABLE ?auto_63586 ) ( ON ?auto_63584 ?auto_63585 ) ( CLEAR ?auto_63582 ) ( ON ?auto_63583 ?auto_63584 ) ( CLEAR ?auto_63583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63586 ?auto_63587 ?auto_63585 ?auto_63584 )
      ( MAKE-5PILE ?auto_63581 ?auto_63582 ?auto_63583 ?auto_63584 ?auto_63585 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63588 - BLOCK
      ?auto_63589 - BLOCK
      ?auto_63590 - BLOCK
      ?auto_63591 - BLOCK
      ?auto_63592 - BLOCK
    )
    :vars
    (
      ?auto_63594 - BLOCK
      ?auto_63593 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63588 ) ( not ( = ?auto_63588 ?auto_63589 ) ) ( not ( = ?auto_63588 ?auto_63590 ) ) ( not ( = ?auto_63588 ?auto_63591 ) ) ( not ( = ?auto_63588 ?auto_63592 ) ) ( not ( = ?auto_63588 ?auto_63594 ) ) ( not ( = ?auto_63589 ?auto_63590 ) ) ( not ( = ?auto_63589 ?auto_63591 ) ) ( not ( = ?auto_63589 ?auto_63592 ) ) ( not ( = ?auto_63589 ?auto_63594 ) ) ( not ( = ?auto_63590 ?auto_63591 ) ) ( not ( = ?auto_63590 ?auto_63592 ) ) ( not ( = ?auto_63590 ?auto_63594 ) ) ( not ( = ?auto_63591 ?auto_63592 ) ) ( not ( = ?auto_63591 ?auto_63594 ) ) ( not ( = ?auto_63592 ?auto_63594 ) ) ( ON ?auto_63594 ?auto_63593 ) ( not ( = ?auto_63588 ?auto_63593 ) ) ( not ( = ?auto_63589 ?auto_63593 ) ) ( not ( = ?auto_63590 ?auto_63593 ) ) ( not ( = ?auto_63591 ?auto_63593 ) ) ( not ( = ?auto_63592 ?auto_63593 ) ) ( not ( = ?auto_63594 ?auto_63593 ) ) ( ON ?auto_63592 ?auto_63594 ) ( ON-TABLE ?auto_63593 ) ( ON ?auto_63591 ?auto_63592 ) ( ON ?auto_63590 ?auto_63591 ) ( CLEAR ?auto_63590 ) ( HOLDING ?auto_63589 ) ( CLEAR ?auto_63588 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63588 ?auto_63589 )
      ( MAKE-5PILE ?auto_63588 ?auto_63589 ?auto_63590 ?auto_63591 ?auto_63592 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63595 - BLOCK
      ?auto_63596 - BLOCK
      ?auto_63597 - BLOCK
      ?auto_63598 - BLOCK
      ?auto_63599 - BLOCK
    )
    :vars
    (
      ?auto_63601 - BLOCK
      ?auto_63600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63595 ) ( not ( = ?auto_63595 ?auto_63596 ) ) ( not ( = ?auto_63595 ?auto_63597 ) ) ( not ( = ?auto_63595 ?auto_63598 ) ) ( not ( = ?auto_63595 ?auto_63599 ) ) ( not ( = ?auto_63595 ?auto_63601 ) ) ( not ( = ?auto_63596 ?auto_63597 ) ) ( not ( = ?auto_63596 ?auto_63598 ) ) ( not ( = ?auto_63596 ?auto_63599 ) ) ( not ( = ?auto_63596 ?auto_63601 ) ) ( not ( = ?auto_63597 ?auto_63598 ) ) ( not ( = ?auto_63597 ?auto_63599 ) ) ( not ( = ?auto_63597 ?auto_63601 ) ) ( not ( = ?auto_63598 ?auto_63599 ) ) ( not ( = ?auto_63598 ?auto_63601 ) ) ( not ( = ?auto_63599 ?auto_63601 ) ) ( ON ?auto_63601 ?auto_63600 ) ( not ( = ?auto_63595 ?auto_63600 ) ) ( not ( = ?auto_63596 ?auto_63600 ) ) ( not ( = ?auto_63597 ?auto_63600 ) ) ( not ( = ?auto_63598 ?auto_63600 ) ) ( not ( = ?auto_63599 ?auto_63600 ) ) ( not ( = ?auto_63601 ?auto_63600 ) ) ( ON ?auto_63599 ?auto_63601 ) ( ON-TABLE ?auto_63600 ) ( ON ?auto_63598 ?auto_63599 ) ( ON ?auto_63597 ?auto_63598 ) ( CLEAR ?auto_63595 ) ( ON ?auto_63596 ?auto_63597 ) ( CLEAR ?auto_63596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63600 ?auto_63601 ?auto_63599 ?auto_63598 ?auto_63597 )
      ( MAKE-5PILE ?auto_63595 ?auto_63596 ?auto_63597 ?auto_63598 ?auto_63599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63602 - BLOCK
      ?auto_63603 - BLOCK
      ?auto_63604 - BLOCK
      ?auto_63605 - BLOCK
      ?auto_63606 - BLOCK
    )
    :vars
    (
      ?auto_63608 - BLOCK
      ?auto_63607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63602 ?auto_63603 ) ) ( not ( = ?auto_63602 ?auto_63604 ) ) ( not ( = ?auto_63602 ?auto_63605 ) ) ( not ( = ?auto_63602 ?auto_63606 ) ) ( not ( = ?auto_63602 ?auto_63608 ) ) ( not ( = ?auto_63603 ?auto_63604 ) ) ( not ( = ?auto_63603 ?auto_63605 ) ) ( not ( = ?auto_63603 ?auto_63606 ) ) ( not ( = ?auto_63603 ?auto_63608 ) ) ( not ( = ?auto_63604 ?auto_63605 ) ) ( not ( = ?auto_63604 ?auto_63606 ) ) ( not ( = ?auto_63604 ?auto_63608 ) ) ( not ( = ?auto_63605 ?auto_63606 ) ) ( not ( = ?auto_63605 ?auto_63608 ) ) ( not ( = ?auto_63606 ?auto_63608 ) ) ( ON ?auto_63608 ?auto_63607 ) ( not ( = ?auto_63602 ?auto_63607 ) ) ( not ( = ?auto_63603 ?auto_63607 ) ) ( not ( = ?auto_63604 ?auto_63607 ) ) ( not ( = ?auto_63605 ?auto_63607 ) ) ( not ( = ?auto_63606 ?auto_63607 ) ) ( not ( = ?auto_63608 ?auto_63607 ) ) ( ON ?auto_63606 ?auto_63608 ) ( ON-TABLE ?auto_63607 ) ( ON ?auto_63605 ?auto_63606 ) ( ON ?auto_63604 ?auto_63605 ) ( ON ?auto_63603 ?auto_63604 ) ( CLEAR ?auto_63603 ) ( HOLDING ?auto_63602 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63602 )
      ( MAKE-5PILE ?auto_63602 ?auto_63603 ?auto_63604 ?auto_63605 ?auto_63606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63609 - BLOCK
      ?auto_63610 - BLOCK
      ?auto_63611 - BLOCK
      ?auto_63612 - BLOCK
      ?auto_63613 - BLOCK
    )
    :vars
    (
      ?auto_63614 - BLOCK
      ?auto_63615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63609 ?auto_63610 ) ) ( not ( = ?auto_63609 ?auto_63611 ) ) ( not ( = ?auto_63609 ?auto_63612 ) ) ( not ( = ?auto_63609 ?auto_63613 ) ) ( not ( = ?auto_63609 ?auto_63614 ) ) ( not ( = ?auto_63610 ?auto_63611 ) ) ( not ( = ?auto_63610 ?auto_63612 ) ) ( not ( = ?auto_63610 ?auto_63613 ) ) ( not ( = ?auto_63610 ?auto_63614 ) ) ( not ( = ?auto_63611 ?auto_63612 ) ) ( not ( = ?auto_63611 ?auto_63613 ) ) ( not ( = ?auto_63611 ?auto_63614 ) ) ( not ( = ?auto_63612 ?auto_63613 ) ) ( not ( = ?auto_63612 ?auto_63614 ) ) ( not ( = ?auto_63613 ?auto_63614 ) ) ( ON ?auto_63614 ?auto_63615 ) ( not ( = ?auto_63609 ?auto_63615 ) ) ( not ( = ?auto_63610 ?auto_63615 ) ) ( not ( = ?auto_63611 ?auto_63615 ) ) ( not ( = ?auto_63612 ?auto_63615 ) ) ( not ( = ?auto_63613 ?auto_63615 ) ) ( not ( = ?auto_63614 ?auto_63615 ) ) ( ON ?auto_63613 ?auto_63614 ) ( ON-TABLE ?auto_63615 ) ( ON ?auto_63612 ?auto_63613 ) ( ON ?auto_63611 ?auto_63612 ) ( ON ?auto_63610 ?auto_63611 ) ( ON ?auto_63609 ?auto_63610 ) ( CLEAR ?auto_63609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63615 ?auto_63614 ?auto_63613 ?auto_63612 ?auto_63611 ?auto_63610 )
      ( MAKE-5PILE ?auto_63609 ?auto_63610 ?auto_63611 ?auto_63612 ?auto_63613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63617 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63617 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_63617 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63618 - BLOCK
    )
    :vars
    (
      ?auto_63619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63618 ?auto_63619 ) ( CLEAR ?auto_63618 ) ( HAND-EMPTY ) ( not ( = ?auto_63618 ?auto_63619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63618 ?auto_63619 )
      ( MAKE-1PILE ?auto_63618 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63620 - BLOCK
    )
    :vars
    (
      ?auto_63621 - BLOCK
      ?auto_63623 - BLOCK
      ?auto_63624 - BLOCK
      ?auto_63622 - BLOCK
      ?auto_63625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63620 ?auto_63621 ) ) ( HOLDING ?auto_63620 ) ( CLEAR ?auto_63621 ) ( ON-TABLE ?auto_63623 ) ( ON ?auto_63624 ?auto_63623 ) ( ON ?auto_63622 ?auto_63624 ) ( ON ?auto_63625 ?auto_63622 ) ( ON ?auto_63621 ?auto_63625 ) ( not ( = ?auto_63623 ?auto_63624 ) ) ( not ( = ?auto_63623 ?auto_63622 ) ) ( not ( = ?auto_63623 ?auto_63625 ) ) ( not ( = ?auto_63623 ?auto_63621 ) ) ( not ( = ?auto_63623 ?auto_63620 ) ) ( not ( = ?auto_63624 ?auto_63622 ) ) ( not ( = ?auto_63624 ?auto_63625 ) ) ( not ( = ?auto_63624 ?auto_63621 ) ) ( not ( = ?auto_63624 ?auto_63620 ) ) ( not ( = ?auto_63622 ?auto_63625 ) ) ( not ( = ?auto_63622 ?auto_63621 ) ) ( not ( = ?auto_63622 ?auto_63620 ) ) ( not ( = ?auto_63625 ?auto_63621 ) ) ( not ( = ?auto_63625 ?auto_63620 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63623 ?auto_63624 ?auto_63622 ?auto_63625 ?auto_63621 ?auto_63620 )
      ( MAKE-1PILE ?auto_63620 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63626 - BLOCK
    )
    :vars
    (
      ?auto_63630 - BLOCK
      ?auto_63629 - BLOCK
      ?auto_63631 - BLOCK
      ?auto_63627 - BLOCK
      ?auto_63628 - BLOCK
      ?auto_63632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63626 ?auto_63630 ) ) ( CLEAR ?auto_63630 ) ( ON-TABLE ?auto_63629 ) ( ON ?auto_63631 ?auto_63629 ) ( ON ?auto_63627 ?auto_63631 ) ( ON ?auto_63628 ?auto_63627 ) ( ON ?auto_63630 ?auto_63628 ) ( not ( = ?auto_63629 ?auto_63631 ) ) ( not ( = ?auto_63629 ?auto_63627 ) ) ( not ( = ?auto_63629 ?auto_63628 ) ) ( not ( = ?auto_63629 ?auto_63630 ) ) ( not ( = ?auto_63629 ?auto_63626 ) ) ( not ( = ?auto_63631 ?auto_63627 ) ) ( not ( = ?auto_63631 ?auto_63628 ) ) ( not ( = ?auto_63631 ?auto_63630 ) ) ( not ( = ?auto_63631 ?auto_63626 ) ) ( not ( = ?auto_63627 ?auto_63628 ) ) ( not ( = ?auto_63627 ?auto_63630 ) ) ( not ( = ?auto_63627 ?auto_63626 ) ) ( not ( = ?auto_63628 ?auto_63630 ) ) ( not ( = ?auto_63628 ?auto_63626 ) ) ( ON ?auto_63626 ?auto_63632 ) ( CLEAR ?auto_63626 ) ( HAND-EMPTY ) ( not ( = ?auto_63626 ?auto_63632 ) ) ( not ( = ?auto_63630 ?auto_63632 ) ) ( not ( = ?auto_63629 ?auto_63632 ) ) ( not ( = ?auto_63631 ?auto_63632 ) ) ( not ( = ?auto_63627 ?auto_63632 ) ) ( not ( = ?auto_63628 ?auto_63632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63626 ?auto_63632 )
      ( MAKE-1PILE ?auto_63626 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63633 - BLOCK
    )
    :vars
    (
      ?auto_63634 - BLOCK
      ?auto_63635 - BLOCK
      ?auto_63639 - BLOCK
      ?auto_63638 - BLOCK
      ?auto_63637 - BLOCK
      ?auto_63636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63633 ?auto_63634 ) ) ( ON-TABLE ?auto_63635 ) ( ON ?auto_63639 ?auto_63635 ) ( ON ?auto_63638 ?auto_63639 ) ( ON ?auto_63637 ?auto_63638 ) ( not ( = ?auto_63635 ?auto_63639 ) ) ( not ( = ?auto_63635 ?auto_63638 ) ) ( not ( = ?auto_63635 ?auto_63637 ) ) ( not ( = ?auto_63635 ?auto_63634 ) ) ( not ( = ?auto_63635 ?auto_63633 ) ) ( not ( = ?auto_63639 ?auto_63638 ) ) ( not ( = ?auto_63639 ?auto_63637 ) ) ( not ( = ?auto_63639 ?auto_63634 ) ) ( not ( = ?auto_63639 ?auto_63633 ) ) ( not ( = ?auto_63638 ?auto_63637 ) ) ( not ( = ?auto_63638 ?auto_63634 ) ) ( not ( = ?auto_63638 ?auto_63633 ) ) ( not ( = ?auto_63637 ?auto_63634 ) ) ( not ( = ?auto_63637 ?auto_63633 ) ) ( ON ?auto_63633 ?auto_63636 ) ( CLEAR ?auto_63633 ) ( not ( = ?auto_63633 ?auto_63636 ) ) ( not ( = ?auto_63634 ?auto_63636 ) ) ( not ( = ?auto_63635 ?auto_63636 ) ) ( not ( = ?auto_63639 ?auto_63636 ) ) ( not ( = ?auto_63638 ?auto_63636 ) ) ( not ( = ?auto_63637 ?auto_63636 ) ) ( HOLDING ?auto_63634 ) ( CLEAR ?auto_63637 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63635 ?auto_63639 ?auto_63638 ?auto_63637 ?auto_63634 )
      ( MAKE-1PILE ?auto_63633 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63640 - BLOCK
    )
    :vars
    (
      ?auto_63643 - BLOCK
      ?auto_63646 - BLOCK
      ?auto_63642 - BLOCK
      ?auto_63641 - BLOCK
      ?auto_63645 - BLOCK
      ?auto_63644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63640 ?auto_63643 ) ) ( ON-TABLE ?auto_63646 ) ( ON ?auto_63642 ?auto_63646 ) ( ON ?auto_63641 ?auto_63642 ) ( ON ?auto_63645 ?auto_63641 ) ( not ( = ?auto_63646 ?auto_63642 ) ) ( not ( = ?auto_63646 ?auto_63641 ) ) ( not ( = ?auto_63646 ?auto_63645 ) ) ( not ( = ?auto_63646 ?auto_63643 ) ) ( not ( = ?auto_63646 ?auto_63640 ) ) ( not ( = ?auto_63642 ?auto_63641 ) ) ( not ( = ?auto_63642 ?auto_63645 ) ) ( not ( = ?auto_63642 ?auto_63643 ) ) ( not ( = ?auto_63642 ?auto_63640 ) ) ( not ( = ?auto_63641 ?auto_63645 ) ) ( not ( = ?auto_63641 ?auto_63643 ) ) ( not ( = ?auto_63641 ?auto_63640 ) ) ( not ( = ?auto_63645 ?auto_63643 ) ) ( not ( = ?auto_63645 ?auto_63640 ) ) ( ON ?auto_63640 ?auto_63644 ) ( not ( = ?auto_63640 ?auto_63644 ) ) ( not ( = ?auto_63643 ?auto_63644 ) ) ( not ( = ?auto_63646 ?auto_63644 ) ) ( not ( = ?auto_63642 ?auto_63644 ) ) ( not ( = ?auto_63641 ?auto_63644 ) ) ( not ( = ?auto_63645 ?auto_63644 ) ) ( CLEAR ?auto_63645 ) ( ON ?auto_63643 ?auto_63640 ) ( CLEAR ?auto_63643 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63644 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63644 ?auto_63640 )
      ( MAKE-1PILE ?auto_63640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63647 - BLOCK
    )
    :vars
    (
      ?auto_63649 - BLOCK
      ?auto_63651 - BLOCK
      ?auto_63650 - BLOCK
      ?auto_63653 - BLOCK
      ?auto_63652 - BLOCK
      ?auto_63648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63647 ?auto_63649 ) ) ( ON-TABLE ?auto_63651 ) ( ON ?auto_63650 ?auto_63651 ) ( ON ?auto_63653 ?auto_63650 ) ( not ( = ?auto_63651 ?auto_63650 ) ) ( not ( = ?auto_63651 ?auto_63653 ) ) ( not ( = ?auto_63651 ?auto_63652 ) ) ( not ( = ?auto_63651 ?auto_63649 ) ) ( not ( = ?auto_63651 ?auto_63647 ) ) ( not ( = ?auto_63650 ?auto_63653 ) ) ( not ( = ?auto_63650 ?auto_63652 ) ) ( not ( = ?auto_63650 ?auto_63649 ) ) ( not ( = ?auto_63650 ?auto_63647 ) ) ( not ( = ?auto_63653 ?auto_63652 ) ) ( not ( = ?auto_63653 ?auto_63649 ) ) ( not ( = ?auto_63653 ?auto_63647 ) ) ( not ( = ?auto_63652 ?auto_63649 ) ) ( not ( = ?auto_63652 ?auto_63647 ) ) ( ON ?auto_63647 ?auto_63648 ) ( not ( = ?auto_63647 ?auto_63648 ) ) ( not ( = ?auto_63649 ?auto_63648 ) ) ( not ( = ?auto_63651 ?auto_63648 ) ) ( not ( = ?auto_63650 ?auto_63648 ) ) ( not ( = ?auto_63653 ?auto_63648 ) ) ( not ( = ?auto_63652 ?auto_63648 ) ) ( ON ?auto_63649 ?auto_63647 ) ( CLEAR ?auto_63649 ) ( ON-TABLE ?auto_63648 ) ( HOLDING ?auto_63652 ) ( CLEAR ?auto_63653 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63651 ?auto_63650 ?auto_63653 ?auto_63652 )
      ( MAKE-1PILE ?auto_63647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63654 - BLOCK
    )
    :vars
    (
      ?auto_63655 - BLOCK
      ?auto_63656 - BLOCK
      ?auto_63658 - BLOCK
      ?auto_63659 - BLOCK
      ?auto_63660 - BLOCK
      ?auto_63657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63654 ?auto_63655 ) ) ( ON-TABLE ?auto_63656 ) ( ON ?auto_63658 ?auto_63656 ) ( ON ?auto_63659 ?auto_63658 ) ( not ( = ?auto_63656 ?auto_63658 ) ) ( not ( = ?auto_63656 ?auto_63659 ) ) ( not ( = ?auto_63656 ?auto_63660 ) ) ( not ( = ?auto_63656 ?auto_63655 ) ) ( not ( = ?auto_63656 ?auto_63654 ) ) ( not ( = ?auto_63658 ?auto_63659 ) ) ( not ( = ?auto_63658 ?auto_63660 ) ) ( not ( = ?auto_63658 ?auto_63655 ) ) ( not ( = ?auto_63658 ?auto_63654 ) ) ( not ( = ?auto_63659 ?auto_63660 ) ) ( not ( = ?auto_63659 ?auto_63655 ) ) ( not ( = ?auto_63659 ?auto_63654 ) ) ( not ( = ?auto_63660 ?auto_63655 ) ) ( not ( = ?auto_63660 ?auto_63654 ) ) ( ON ?auto_63654 ?auto_63657 ) ( not ( = ?auto_63654 ?auto_63657 ) ) ( not ( = ?auto_63655 ?auto_63657 ) ) ( not ( = ?auto_63656 ?auto_63657 ) ) ( not ( = ?auto_63658 ?auto_63657 ) ) ( not ( = ?auto_63659 ?auto_63657 ) ) ( not ( = ?auto_63660 ?auto_63657 ) ) ( ON ?auto_63655 ?auto_63654 ) ( ON-TABLE ?auto_63657 ) ( CLEAR ?auto_63659 ) ( ON ?auto_63660 ?auto_63655 ) ( CLEAR ?auto_63660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63657 ?auto_63654 ?auto_63655 )
      ( MAKE-1PILE ?auto_63654 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63661 - BLOCK
    )
    :vars
    (
      ?auto_63662 - BLOCK
      ?auto_63665 - BLOCK
      ?auto_63663 - BLOCK
      ?auto_63666 - BLOCK
      ?auto_63667 - BLOCK
      ?auto_63664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63661 ?auto_63662 ) ) ( ON-TABLE ?auto_63665 ) ( ON ?auto_63663 ?auto_63665 ) ( not ( = ?auto_63665 ?auto_63663 ) ) ( not ( = ?auto_63665 ?auto_63666 ) ) ( not ( = ?auto_63665 ?auto_63667 ) ) ( not ( = ?auto_63665 ?auto_63662 ) ) ( not ( = ?auto_63665 ?auto_63661 ) ) ( not ( = ?auto_63663 ?auto_63666 ) ) ( not ( = ?auto_63663 ?auto_63667 ) ) ( not ( = ?auto_63663 ?auto_63662 ) ) ( not ( = ?auto_63663 ?auto_63661 ) ) ( not ( = ?auto_63666 ?auto_63667 ) ) ( not ( = ?auto_63666 ?auto_63662 ) ) ( not ( = ?auto_63666 ?auto_63661 ) ) ( not ( = ?auto_63667 ?auto_63662 ) ) ( not ( = ?auto_63667 ?auto_63661 ) ) ( ON ?auto_63661 ?auto_63664 ) ( not ( = ?auto_63661 ?auto_63664 ) ) ( not ( = ?auto_63662 ?auto_63664 ) ) ( not ( = ?auto_63665 ?auto_63664 ) ) ( not ( = ?auto_63663 ?auto_63664 ) ) ( not ( = ?auto_63666 ?auto_63664 ) ) ( not ( = ?auto_63667 ?auto_63664 ) ) ( ON ?auto_63662 ?auto_63661 ) ( ON-TABLE ?auto_63664 ) ( ON ?auto_63667 ?auto_63662 ) ( CLEAR ?auto_63667 ) ( HOLDING ?auto_63666 ) ( CLEAR ?auto_63663 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63665 ?auto_63663 ?auto_63666 )
      ( MAKE-1PILE ?auto_63661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63668 - BLOCK
    )
    :vars
    (
      ?auto_63670 - BLOCK
      ?auto_63673 - BLOCK
      ?auto_63674 - BLOCK
      ?auto_63669 - BLOCK
      ?auto_63671 - BLOCK
      ?auto_63672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63668 ?auto_63670 ) ) ( ON-TABLE ?auto_63673 ) ( ON ?auto_63674 ?auto_63673 ) ( not ( = ?auto_63673 ?auto_63674 ) ) ( not ( = ?auto_63673 ?auto_63669 ) ) ( not ( = ?auto_63673 ?auto_63671 ) ) ( not ( = ?auto_63673 ?auto_63670 ) ) ( not ( = ?auto_63673 ?auto_63668 ) ) ( not ( = ?auto_63674 ?auto_63669 ) ) ( not ( = ?auto_63674 ?auto_63671 ) ) ( not ( = ?auto_63674 ?auto_63670 ) ) ( not ( = ?auto_63674 ?auto_63668 ) ) ( not ( = ?auto_63669 ?auto_63671 ) ) ( not ( = ?auto_63669 ?auto_63670 ) ) ( not ( = ?auto_63669 ?auto_63668 ) ) ( not ( = ?auto_63671 ?auto_63670 ) ) ( not ( = ?auto_63671 ?auto_63668 ) ) ( ON ?auto_63668 ?auto_63672 ) ( not ( = ?auto_63668 ?auto_63672 ) ) ( not ( = ?auto_63670 ?auto_63672 ) ) ( not ( = ?auto_63673 ?auto_63672 ) ) ( not ( = ?auto_63674 ?auto_63672 ) ) ( not ( = ?auto_63669 ?auto_63672 ) ) ( not ( = ?auto_63671 ?auto_63672 ) ) ( ON ?auto_63670 ?auto_63668 ) ( ON-TABLE ?auto_63672 ) ( ON ?auto_63671 ?auto_63670 ) ( CLEAR ?auto_63674 ) ( ON ?auto_63669 ?auto_63671 ) ( CLEAR ?auto_63669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63672 ?auto_63668 ?auto_63670 ?auto_63671 )
      ( MAKE-1PILE ?auto_63668 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63675 - BLOCK
    )
    :vars
    (
      ?auto_63681 - BLOCK
      ?auto_63677 - BLOCK
      ?auto_63679 - BLOCK
      ?auto_63676 - BLOCK
      ?auto_63678 - BLOCK
      ?auto_63680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63675 ?auto_63681 ) ) ( ON-TABLE ?auto_63677 ) ( not ( = ?auto_63677 ?auto_63679 ) ) ( not ( = ?auto_63677 ?auto_63676 ) ) ( not ( = ?auto_63677 ?auto_63678 ) ) ( not ( = ?auto_63677 ?auto_63681 ) ) ( not ( = ?auto_63677 ?auto_63675 ) ) ( not ( = ?auto_63679 ?auto_63676 ) ) ( not ( = ?auto_63679 ?auto_63678 ) ) ( not ( = ?auto_63679 ?auto_63681 ) ) ( not ( = ?auto_63679 ?auto_63675 ) ) ( not ( = ?auto_63676 ?auto_63678 ) ) ( not ( = ?auto_63676 ?auto_63681 ) ) ( not ( = ?auto_63676 ?auto_63675 ) ) ( not ( = ?auto_63678 ?auto_63681 ) ) ( not ( = ?auto_63678 ?auto_63675 ) ) ( ON ?auto_63675 ?auto_63680 ) ( not ( = ?auto_63675 ?auto_63680 ) ) ( not ( = ?auto_63681 ?auto_63680 ) ) ( not ( = ?auto_63677 ?auto_63680 ) ) ( not ( = ?auto_63679 ?auto_63680 ) ) ( not ( = ?auto_63676 ?auto_63680 ) ) ( not ( = ?auto_63678 ?auto_63680 ) ) ( ON ?auto_63681 ?auto_63675 ) ( ON-TABLE ?auto_63680 ) ( ON ?auto_63678 ?auto_63681 ) ( ON ?auto_63676 ?auto_63678 ) ( CLEAR ?auto_63676 ) ( HOLDING ?auto_63679 ) ( CLEAR ?auto_63677 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63677 ?auto_63679 )
      ( MAKE-1PILE ?auto_63675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63682 - BLOCK
    )
    :vars
    (
      ?auto_63687 - BLOCK
      ?auto_63686 - BLOCK
      ?auto_63685 - BLOCK
      ?auto_63684 - BLOCK
      ?auto_63683 - BLOCK
      ?auto_63688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63682 ?auto_63687 ) ) ( ON-TABLE ?auto_63686 ) ( not ( = ?auto_63686 ?auto_63685 ) ) ( not ( = ?auto_63686 ?auto_63684 ) ) ( not ( = ?auto_63686 ?auto_63683 ) ) ( not ( = ?auto_63686 ?auto_63687 ) ) ( not ( = ?auto_63686 ?auto_63682 ) ) ( not ( = ?auto_63685 ?auto_63684 ) ) ( not ( = ?auto_63685 ?auto_63683 ) ) ( not ( = ?auto_63685 ?auto_63687 ) ) ( not ( = ?auto_63685 ?auto_63682 ) ) ( not ( = ?auto_63684 ?auto_63683 ) ) ( not ( = ?auto_63684 ?auto_63687 ) ) ( not ( = ?auto_63684 ?auto_63682 ) ) ( not ( = ?auto_63683 ?auto_63687 ) ) ( not ( = ?auto_63683 ?auto_63682 ) ) ( ON ?auto_63682 ?auto_63688 ) ( not ( = ?auto_63682 ?auto_63688 ) ) ( not ( = ?auto_63687 ?auto_63688 ) ) ( not ( = ?auto_63686 ?auto_63688 ) ) ( not ( = ?auto_63685 ?auto_63688 ) ) ( not ( = ?auto_63684 ?auto_63688 ) ) ( not ( = ?auto_63683 ?auto_63688 ) ) ( ON ?auto_63687 ?auto_63682 ) ( ON-TABLE ?auto_63688 ) ( ON ?auto_63683 ?auto_63687 ) ( ON ?auto_63684 ?auto_63683 ) ( CLEAR ?auto_63686 ) ( ON ?auto_63685 ?auto_63684 ) ( CLEAR ?auto_63685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63688 ?auto_63682 ?auto_63687 ?auto_63683 ?auto_63684 )
      ( MAKE-1PILE ?auto_63682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63689 - BLOCK
    )
    :vars
    (
      ?auto_63690 - BLOCK
      ?auto_63693 - BLOCK
      ?auto_63692 - BLOCK
      ?auto_63691 - BLOCK
      ?auto_63695 - BLOCK
      ?auto_63694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63689 ?auto_63690 ) ) ( not ( = ?auto_63693 ?auto_63692 ) ) ( not ( = ?auto_63693 ?auto_63691 ) ) ( not ( = ?auto_63693 ?auto_63695 ) ) ( not ( = ?auto_63693 ?auto_63690 ) ) ( not ( = ?auto_63693 ?auto_63689 ) ) ( not ( = ?auto_63692 ?auto_63691 ) ) ( not ( = ?auto_63692 ?auto_63695 ) ) ( not ( = ?auto_63692 ?auto_63690 ) ) ( not ( = ?auto_63692 ?auto_63689 ) ) ( not ( = ?auto_63691 ?auto_63695 ) ) ( not ( = ?auto_63691 ?auto_63690 ) ) ( not ( = ?auto_63691 ?auto_63689 ) ) ( not ( = ?auto_63695 ?auto_63690 ) ) ( not ( = ?auto_63695 ?auto_63689 ) ) ( ON ?auto_63689 ?auto_63694 ) ( not ( = ?auto_63689 ?auto_63694 ) ) ( not ( = ?auto_63690 ?auto_63694 ) ) ( not ( = ?auto_63693 ?auto_63694 ) ) ( not ( = ?auto_63692 ?auto_63694 ) ) ( not ( = ?auto_63691 ?auto_63694 ) ) ( not ( = ?auto_63695 ?auto_63694 ) ) ( ON ?auto_63690 ?auto_63689 ) ( ON-TABLE ?auto_63694 ) ( ON ?auto_63695 ?auto_63690 ) ( ON ?auto_63691 ?auto_63695 ) ( ON ?auto_63692 ?auto_63691 ) ( CLEAR ?auto_63692 ) ( HOLDING ?auto_63693 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63693 )
      ( MAKE-1PILE ?auto_63689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63696 - BLOCK
    )
    :vars
    (
      ?auto_63702 - BLOCK
      ?auto_63700 - BLOCK
      ?auto_63698 - BLOCK
      ?auto_63701 - BLOCK
      ?auto_63699 - BLOCK
      ?auto_63697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63696 ?auto_63702 ) ) ( not ( = ?auto_63700 ?auto_63698 ) ) ( not ( = ?auto_63700 ?auto_63701 ) ) ( not ( = ?auto_63700 ?auto_63699 ) ) ( not ( = ?auto_63700 ?auto_63702 ) ) ( not ( = ?auto_63700 ?auto_63696 ) ) ( not ( = ?auto_63698 ?auto_63701 ) ) ( not ( = ?auto_63698 ?auto_63699 ) ) ( not ( = ?auto_63698 ?auto_63702 ) ) ( not ( = ?auto_63698 ?auto_63696 ) ) ( not ( = ?auto_63701 ?auto_63699 ) ) ( not ( = ?auto_63701 ?auto_63702 ) ) ( not ( = ?auto_63701 ?auto_63696 ) ) ( not ( = ?auto_63699 ?auto_63702 ) ) ( not ( = ?auto_63699 ?auto_63696 ) ) ( ON ?auto_63696 ?auto_63697 ) ( not ( = ?auto_63696 ?auto_63697 ) ) ( not ( = ?auto_63702 ?auto_63697 ) ) ( not ( = ?auto_63700 ?auto_63697 ) ) ( not ( = ?auto_63698 ?auto_63697 ) ) ( not ( = ?auto_63701 ?auto_63697 ) ) ( not ( = ?auto_63699 ?auto_63697 ) ) ( ON ?auto_63702 ?auto_63696 ) ( ON-TABLE ?auto_63697 ) ( ON ?auto_63699 ?auto_63702 ) ( ON ?auto_63701 ?auto_63699 ) ( ON ?auto_63698 ?auto_63701 ) ( ON ?auto_63700 ?auto_63698 ) ( CLEAR ?auto_63700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63697 ?auto_63696 ?auto_63702 ?auto_63699 ?auto_63701 ?auto_63698 )
      ( MAKE-1PILE ?auto_63696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63707 - BLOCK
      ?auto_63708 - BLOCK
      ?auto_63709 - BLOCK
      ?auto_63710 - BLOCK
    )
    :vars
    (
      ?auto_63711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63711 ?auto_63710 ) ( CLEAR ?auto_63711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63707 ) ( ON ?auto_63708 ?auto_63707 ) ( ON ?auto_63709 ?auto_63708 ) ( ON ?auto_63710 ?auto_63709 ) ( not ( = ?auto_63707 ?auto_63708 ) ) ( not ( = ?auto_63707 ?auto_63709 ) ) ( not ( = ?auto_63707 ?auto_63710 ) ) ( not ( = ?auto_63707 ?auto_63711 ) ) ( not ( = ?auto_63708 ?auto_63709 ) ) ( not ( = ?auto_63708 ?auto_63710 ) ) ( not ( = ?auto_63708 ?auto_63711 ) ) ( not ( = ?auto_63709 ?auto_63710 ) ) ( not ( = ?auto_63709 ?auto_63711 ) ) ( not ( = ?auto_63710 ?auto_63711 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63711 ?auto_63710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63712 - BLOCK
      ?auto_63713 - BLOCK
      ?auto_63714 - BLOCK
      ?auto_63715 - BLOCK
    )
    :vars
    (
      ?auto_63716 - BLOCK
      ?auto_63717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63716 ?auto_63715 ) ( CLEAR ?auto_63716 ) ( ON-TABLE ?auto_63712 ) ( ON ?auto_63713 ?auto_63712 ) ( ON ?auto_63714 ?auto_63713 ) ( ON ?auto_63715 ?auto_63714 ) ( not ( = ?auto_63712 ?auto_63713 ) ) ( not ( = ?auto_63712 ?auto_63714 ) ) ( not ( = ?auto_63712 ?auto_63715 ) ) ( not ( = ?auto_63712 ?auto_63716 ) ) ( not ( = ?auto_63713 ?auto_63714 ) ) ( not ( = ?auto_63713 ?auto_63715 ) ) ( not ( = ?auto_63713 ?auto_63716 ) ) ( not ( = ?auto_63714 ?auto_63715 ) ) ( not ( = ?auto_63714 ?auto_63716 ) ) ( not ( = ?auto_63715 ?auto_63716 ) ) ( HOLDING ?auto_63717 ) ( not ( = ?auto_63712 ?auto_63717 ) ) ( not ( = ?auto_63713 ?auto_63717 ) ) ( not ( = ?auto_63714 ?auto_63717 ) ) ( not ( = ?auto_63715 ?auto_63717 ) ) ( not ( = ?auto_63716 ?auto_63717 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_63717 )
      ( MAKE-4PILE ?auto_63712 ?auto_63713 ?auto_63714 ?auto_63715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63718 - BLOCK
      ?auto_63719 - BLOCK
      ?auto_63720 - BLOCK
      ?auto_63721 - BLOCK
    )
    :vars
    (
      ?auto_63723 - BLOCK
      ?auto_63722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63723 ?auto_63721 ) ( ON-TABLE ?auto_63718 ) ( ON ?auto_63719 ?auto_63718 ) ( ON ?auto_63720 ?auto_63719 ) ( ON ?auto_63721 ?auto_63720 ) ( not ( = ?auto_63718 ?auto_63719 ) ) ( not ( = ?auto_63718 ?auto_63720 ) ) ( not ( = ?auto_63718 ?auto_63721 ) ) ( not ( = ?auto_63718 ?auto_63723 ) ) ( not ( = ?auto_63719 ?auto_63720 ) ) ( not ( = ?auto_63719 ?auto_63721 ) ) ( not ( = ?auto_63719 ?auto_63723 ) ) ( not ( = ?auto_63720 ?auto_63721 ) ) ( not ( = ?auto_63720 ?auto_63723 ) ) ( not ( = ?auto_63721 ?auto_63723 ) ) ( not ( = ?auto_63718 ?auto_63722 ) ) ( not ( = ?auto_63719 ?auto_63722 ) ) ( not ( = ?auto_63720 ?auto_63722 ) ) ( not ( = ?auto_63721 ?auto_63722 ) ) ( not ( = ?auto_63723 ?auto_63722 ) ) ( ON ?auto_63722 ?auto_63723 ) ( CLEAR ?auto_63722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63718 ?auto_63719 ?auto_63720 ?auto_63721 ?auto_63723 )
      ( MAKE-4PILE ?auto_63718 ?auto_63719 ?auto_63720 ?auto_63721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63724 - BLOCK
      ?auto_63725 - BLOCK
      ?auto_63726 - BLOCK
      ?auto_63727 - BLOCK
    )
    :vars
    (
      ?auto_63729 - BLOCK
      ?auto_63728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63729 ?auto_63727 ) ( ON-TABLE ?auto_63724 ) ( ON ?auto_63725 ?auto_63724 ) ( ON ?auto_63726 ?auto_63725 ) ( ON ?auto_63727 ?auto_63726 ) ( not ( = ?auto_63724 ?auto_63725 ) ) ( not ( = ?auto_63724 ?auto_63726 ) ) ( not ( = ?auto_63724 ?auto_63727 ) ) ( not ( = ?auto_63724 ?auto_63729 ) ) ( not ( = ?auto_63725 ?auto_63726 ) ) ( not ( = ?auto_63725 ?auto_63727 ) ) ( not ( = ?auto_63725 ?auto_63729 ) ) ( not ( = ?auto_63726 ?auto_63727 ) ) ( not ( = ?auto_63726 ?auto_63729 ) ) ( not ( = ?auto_63727 ?auto_63729 ) ) ( not ( = ?auto_63724 ?auto_63728 ) ) ( not ( = ?auto_63725 ?auto_63728 ) ) ( not ( = ?auto_63726 ?auto_63728 ) ) ( not ( = ?auto_63727 ?auto_63728 ) ) ( not ( = ?auto_63729 ?auto_63728 ) ) ( HOLDING ?auto_63728 ) ( CLEAR ?auto_63729 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63724 ?auto_63725 ?auto_63726 ?auto_63727 ?auto_63729 ?auto_63728 )
      ( MAKE-4PILE ?auto_63724 ?auto_63725 ?auto_63726 ?auto_63727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63730 - BLOCK
      ?auto_63731 - BLOCK
      ?auto_63732 - BLOCK
      ?auto_63733 - BLOCK
    )
    :vars
    (
      ?auto_63735 - BLOCK
      ?auto_63734 - BLOCK
      ?auto_63736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63735 ?auto_63733 ) ( ON-TABLE ?auto_63730 ) ( ON ?auto_63731 ?auto_63730 ) ( ON ?auto_63732 ?auto_63731 ) ( ON ?auto_63733 ?auto_63732 ) ( not ( = ?auto_63730 ?auto_63731 ) ) ( not ( = ?auto_63730 ?auto_63732 ) ) ( not ( = ?auto_63730 ?auto_63733 ) ) ( not ( = ?auto_63730 ?auto_63735 ) ) ( not ( = ?auto_63731 ?auto_63732 ) ) ( not ( = ?auto_63731 ?auto_63733 ) ) ( not ( = ?auto_63731 ?auto_63735 ) ) ( not ( = ?auto_63732 ?auto_63733 ) ) ( not ( = ?auto_63732 ?auto_63735 ) ) ( not ( = ?auto_63733 ?auto_63735 ) ) ( not ( = ?auto_63730 ?auto_63734 ) ) ( not ( = ?auto_63731 ?auto_63734 ) ) ( not ( = ?auto_63732 ?auto_63734 ) ) ( not ( = ?auto_63733 ?auto_63734 ) ) ( not ( = ?auto_63735 ?auto_63734 ) ) ( CLEAR ?auto_63735 ) ( ON ?auto_63734 ?auto_63736 ) ( CLEAR ?auto_63734 ) ( HAND-EMPTY ) ( not ( = ?auto_63730 ?auto_63736 ) ) ( not ( = ?auto_63731 ?auto_63736 ) ) ( not ( = ?auto_63732 ?auto_63736 ) ) ( not ( = ?auto_63733 ?auto_63736 ) ) ( not ( = ?auto_63735 ?auto_63736 ) ) ( not ( = ?auto_63734 ?auto_63736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63734 ?auto_63736 )
      ( MAKE-4PILE ?auto_63730 ?auto_63731 ?auto_63732 ?auto_63733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63751 - BLOCK
      ?auto_63752 - BLOCK
      ?auto_63753 - BLOCK
      ?auto_63754 - BLOCK
    )
    :vars
    (
      ?auto_63756 - BLOCK
      ?auto_63757 - BLOCK
      ?auto_63755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63751 ) ( ON ?auto_63752 ?auto_63751 ) ( ON ?auto_63753 ?auto_63752 ) ( not ( = ?auto_63751 ?auto_63752 ) ) ( not ( = ?auto_63751 ?auto_63753 ) ) ( not ( = ?auto_63751 ?auto_63754 ) ) ( not ( = ?auto_63751 ?auto_63756 ) ) ( not ( = ?auto_63752 ?auto_63753 ) ) ( not ( = ?auto_63752 ?auto_63754 ) ) ( not ( = ?auto_63752 ?auto_63756 ) ) ( not ( = ?auto_63753 ?auto_63754 ) ) ( not ( = ?auto_63753 ?auto_63756 ) ) ( not ( = ?auto_63754 ?auto_63756 ) ) ( not ( = ?auto_63751 ?auto_63757 ) ) ( not ( = ?auto_63752 ?auto_63757 ) ) ( not ( = ?auto_63753 ?auto_63757 ) ) ( not ( = ?auto_63754 ?auto_63757 ) ) ( not ( = ?auto_63756 ?auto_63757 ) ) ( ON ?auto_63757 ?auto_63755 ) ( not ( = ?auto_63751 ?auto_63755 ) ) ( not ( = ?auto_63752 ?auto_63755 ) ) ( not ( = ?auto_63753 ?auto_63755 ) ) ( not ( = ?auto_63754 ?auto_63755 ) ) ( not ( = ?auto_63756 ?auto_63755 ) ) ( not ( = ?auto_63757 ?auto_63755 ) ) ( ON ?auto_63756 ?auto_63757 ) ( CLEAR ?auto_63756 ) ( HOLDING ?auto_63754 ) ( CLEAR ?auto_63753 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63751 ?auto_63752 ?auto_63753 ?auto_63754 ?auto_63756 )
      ( MAKE-4PILE ?auto_63751 ?auto_63752 ?auto_63753 ?auto_63754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63758 - BLOCK
      ?auto_63759 - BLOCK
      ?auto_63760 - BLOCK
      ?auto_63761 - BLOCK
    )
    :vars
    (
      ?auto_63762 - BLOCK
      ?auto_63763 - BLOCK
      ?auto_63764 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63758 ) ( ON ?auto_63759 ?auto_63758 ) ( ON ?auto_63760 ?auto_63759 ) ( not ( = ?auto_63758 ?auto_63759 ) ) ( not ( = ?auto_63758 ?auto_63760 ) ) ( not ( = ?auto_63758 ?auto_63761 ) ) ( not ( = ?auto_63758 ?auto_63762 ) ) ( not ( = ?auto_63759 ?auto_63760 ) ) ( not ( = ?auto_63759 ?auto_63761 ) ) ( not ( = ?auto_63759 ?auto_63762 ) ) ( not ( = ?auto_63760 ?auto_63761 ) ) ( not ( = ?auto_63760 ?auto_63762 ) ) ( not ( = ?auto_63761 ?auto_63762 ) ) ( not ( = ?auto_63758 ?auto_63763 ) ) ( not ( = ?auto_63759 ?auto_63763 ) ) ( not ( = ?auto_63760 ?auto_63763 ) ) ( not ( = ?auto_63761 ?auto_63763 ) ) ( not ( = ?auto_63762 ?auto_63763 ) ) ( ON ?auto_63763 ?auto_63764 ) ( not ( = ?auto_63758 ?auto_63764 ) ) ( not ( = ?auto_63759 ?auto_63764 ) ) ( not ( = ?auto_63760 ?auto_63764 ) ) ( not ( = ?auto_63761 ?auto_63764 ) ) ( not ( = ?auto_63762 ?auto_63764 ) ) ( not ( = ?auto_63763 ?auto_63764 ) ) ( ON ?auto_63762 ?auto_63763 ) ( CLEAR ?auto_63760 ) ( ON ?auto_63761 ?auto_63762 ) ( CLEAR ?auto_63761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63764 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63764 ?auto_63763 ?auto_63762 )
      ( MAKE-4PILE ?auto_63758 ?auto_63759 ?auto_63760 ?auto_63761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63765 - BLOCK
      ?auto_63766 - BLOCK
      ?auto_63767 - BLOCK
      ?auto_63768 - BLOCK
    )
    :vars
    (
      ?auto_63769 - BLOCK
      ?auto_63770 - BLOCK
      ?auto_63771 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63765 ) ( ON ?auto_63766 ?auto_63765 ) ( not ( = ?auto_63765 ?auto_63766 ) ) ( not ( = ?auto_63765 ?auto_63767 ) ) ( not ( = ?auto_63765 ?auto_63768 ) ) ( not ( = ?auto_63765 ?auto_63769 ) ) ( not ( = ?auto_63766 ?auto_63767 ) ) ( not ( = ?auto_63766 ?auto_63768 ) ) ( not ( = ?auto_63766 ?auto_63769 ) ) ( not ( = ?auto_63767 ?auto_63768 ) ) ( not ( = ?auto_63767 ?auto_63769 ) ) ( not ( = ?auto_63768 ?auto_63769 ) ) ( not ( = ?auto_63765 ?auto_63770 ) ) ( not ( = ?auto_63766 ?auto_63770 ) ) ( not ( = ?auto_63767 ?auto_63770 ) ) ( not ( = ?auto_63768 ?auto_63770 ) ) ( not ( = ?auto_63769 ?auto_63770 ) ) ( ON ?auto_63770 ?auto_63771 ) ( not ( = ?auto_63765 ?auto_63771 ) ) ( not ( = ?auto_63766 ?auto_63771 ) ) ( not ( = ?auto_63767 ?auto_63771 ) ) ( not ( = ?auto_63768 ?auto_63771 ) ) ( not ( = ?auto_63769 ?auto_63771 ) ) ( not ( = ?auto_63770 ?auto_63771 ) ) ( ON ?auto_63769 ?auto_63770 ) ( ON ?auto_63768 ?auto_63769 ) ( CLEAR ?auto_63768 ) ( ON-TABLE ?auto_63771 ) ( HOLDING ?auto_63767 ) ( CLEAR ?auto_63766 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63765 ?auto_63766 ?auto_63767 )
      ( MAKE-4PILE ?auto_63765 ?auto_63766 ?auto_63767 ?auto_63768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63772 - BLOCK
      ?auto_63773 - BLOCK
      ?auto_63774 - BLOCK
      ?auto_63775 - BLOCK
    )
    :vars
    (
      ?auto_63778 - BLOCK
      ?auto_63777 - BLOCK
      ?auto_63776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63772 ) ( ON ?auto_63773 ?auto_63772 ) ( not ( = ?auto_63772 ?auto_63773 ) ) ( not ( = ?auto_63772 ?auto_63774 ) ) ( not ( = ?auto_63772 ?auto_63775 ) ) ( not ( = ?auto_63772 ?auto_63778 ) ) ( not ( = ?auto_63773 ?auto_63774 ) ) ( not ( = ?auto_63773 ?auto_63775 ) ) ( not ( = ?auto_63773 ?auto_63778 ) ) ( not ( = ?auto_63774 ?auto_63775 ) ) ( not ( = ?auto_63774 ?auto_63778 ) ) ( not ( = ?auto_63775 ?auto_63778 ) ) ( not ( = ?auto_63772 ?auto_63777 ) ) ( not ( = ?auto_63773 ?auto_63777 ) ) ( not ( = ?auto_63774 ?auto_63777 ) ) ( not ( = ?auto_63775 ?auto_63777 ) ) ( not ( = ?auto_63778 ?auto_63777 ) ) ( ON ?auto_63777 ?auto_63776 ) ( not ( = ?auto_63772 ?auto_63776 ) ) ( not ( = ?auto_63773 ?auto_63776 ) ) ( not ( = ?auto_63774 ?auto_63776 ) ) ( not ( = ?auto_63775 ?auto_63776 ) ) ( not ( = ?auto_63778 ?auto_63776 ) ) ( not ( = ?auto_63777 ?auto_63776 ) ) ( ON ?auto_63778 ?auto_63777 ) ( ON ?auto_63775 ?auto_63778 ) ( ON-TABLE ?auto_63776 ) ( CLEAR ?auto_63773 ) ( ON ?auto_63774 ?auto_63775 ) ( CLEAR ?auto_63774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63776 ?auto_63777 ?auto_63778 ?auto_63775 )
      ( MAKE-4PILE ?auto_63772 ?auto_63773 ?auto_63774 ?auto_63775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63779 - BLOCK
      ?auto_63780 - BLOCK
      ?auto_63781 - BLOCK
      ?auto_63782 - BLOCK
    )
    :vars
    (
      ?auto_63784 - BLOCK
      ?auto_63783 - BLOCK
      ?auto_63785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63779 ) ( not ( = ?auto_63779 ?auto_63780 ) ) ( not ( = ?auto_63779 ?auto_63781 ) ) ( not ( = ?auto_63779 ?auto_63782 ) ) ( not ( = ?auto_63779 ?auto_63784 ) ) ( not ( = ?auto_63780 ?auto_63781 ) ) ( not ( = ?auto_63780 ?auto_63782 ) ) ( not ( = ?auto_63780 ?auto_63784 ) ) ( not ( = ?auto_63781 ?auto_63782 ) ) ( not ( = ?auto_63781 ?auto_63784 ) ) ( not ( = ?auto_63782 ?auto_63784 ) ) ( not ( = ?auto_63779 ?auto_63783 ) ) ( not ( = ?auto_63780 ?auto_63783 ) ) ( not ( = ?auto_63781 ?auto_63783 ) ) ( not ( = ?auto_63782 ?auto_63783 ) ) ( not ( = ?auto_63784 ?auto_63783 ) ) ( ON ?auto_63783 ?auto_63785 ) ( not ( = ?auto_63779 ?auto_63785 ) ) ( not ( = ?auto_63780 ?auto_63785 ) ) ( not ( = ?auto_63781 ?auto_63785 ) ) ( not ( = ?auto_63782 ?auto_63785 ) ) ( not ( = ?auto_63784 ?auto_63785 ) ) ( not ( = ?auto_63783 ?auto_63785 ) ) ( ON ?auto_63784 ?auto_63783 ) ( ON ?auto_63782 ?auto_63784 ) ( ON-TABLE ?auto_63785 ) ( ON ?auto_63781 ?auto_63782 ) ( CLEAR ?auto_63781 ) ( HOLDING ?auto_63780 ) ( CLEAR ?auto_63779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63779 ?auto_63780 )
      ( MAKE-4PILE ?auto_63779 ?auto_63780 ?auto_63781 ?auto_63782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63786 - BLOCK
      ?auto_63787 - BLOCK
      ?auto_63788 - BLOCK
      ?auto_63789 - BLOCK
    )
    :vars
    (
      ?auto_63792 - BLOCK
      ?auto_63790 - BLOCK
      ?auto_63791 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63786 ) ( not ( = ?auto_63786 ?auto_63787 ) ) ( not ( = ?auto_63786 ?auto_63788 ) ) ( not ( = ?auto_63786 ?auto_63789 ) ) ( not ( = ?auto_63786 ?auto_63792 ) ) ( not ( = ?auto_63787 ?auto_63788 ) ) ( not ( = ?auto_63787 ?auto_63789 ) ) ( not ( = ?auto_63787 ?auto_63792 ) ) ( not ( = ?auto_63788 ?auto_63789 ) ) ( not ( = ?auto_63788 ?auto_63792 ) ) ( not ( = ?auto_63789 ?auto_63792 ) ) ( not ( = ?auto_63786 ?auto_63790 ) ) ( not ( = ?auto_63787 ?auto_63790 ) ) ( not ( = ?auto_63788 ?auto_63790 ) ) ( not ( = ?auto_63789 ?auto_63790 ) ) ( not ( = ?auto_63792 ?auto_63790 ) ) ( ON ?auto_63790 ?auto_63791 ) ( not ( = ?auto_63786 ?auto_63791 ) ) ( not ( = ?auto_63787 ?auto_63791 ) ) ( not ( = ?auto_63788 ?auto_63791 ) ) ( not ( = ?auto_63789 ?auto_63791 ) ) ( not ( = ?auto_63792 ?auto_63791 ) ) ( not ( = ?auto_63790 ?auto_63791 ) ) ( ON ?auto_63792 ?auto_63790 ) ( ON ?auto_63789 ?auto_63792 ) ( ON-TABLE ?auto_63791 ) ( ON ?auto_63788 ?auto_63789 ) ( CLEAR ?auto_63786 ) ( ON ?auto_63787 ?auto_63788 ) ( CLEAR ?auto_63787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63791 ?auto_63790 ?auto_63792 ?auto_63789 ?auto_63788 )
      ( MAKE-4PILE ?auto_63786 ?auto_63787 ?auto_63788 ?auto_63789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63793 - BLOCK
      ?auto_63794 - BLOCK
      ?auto_63795 - BLOCK
      ?auto_63796 - BLOCK
    )
    :vars
    (
      ?auto_63797 - BLOCK
      ?auto_63798 - BLOCK
      ?auto_63799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63793 ?auto_63794 ) ) ( not ( = ?auto_63793 ?auto_63795 ) ) ( not ( = ?auto_63793 ?auto_63796 ) ) ( not ( = ?auto_63793 ?auto_63797 ) ) ( not ( = ?auto_63794 ?auto_63795 ) ) ( not ( = ?auto_63794 ?auto_63796 ) ) ( not ( = ?auto_63794 ?auto_63797 ) ) ( not ( = ?auto_63795 ?auto_63796 ) ) ( not ( = ?auto_63795 ?auto_63797 ) ) ( not ( = ?auto_63796 ?auto_63797 ) ) ( not ( = ?auto_63793 ?auto_63798 ) ) ( not ( = ?auto_63794 ?auto_63798 ) ) ( not ( = ?auto_63795 ?auto_63798 ) ) ( not ( = ?auto_63796 ?auto_63798 ) ) ( not ( = ?auto_63797 ?auto_63798 ) ) ( ON ?auto_63798 ?auto_63799 ) ( not ( = ?auto_63793 ?auto_63799 ) ) ( not ( = ?auto_63794 ?auto_63799 ) ) ( not ( = ?auto_63795 ?auto_63799 ) ) ( not ( = ?auto_63796 ?auto_63799 ) ) ( not ( = ?auto_63797 ?auto_63799 ) ) ( not ( = ?auto_63798 ?auto_63799 ) ) ( ON ?auto_63797 ?auto_63798 ) ( ON ?auto_63796 ?auto_63797 ) ( ON-TABLE ?auto_63799 ) ( ON ?auto_63795 ?auto_63796 ) ( ON ?auto_63794 ?auto_63795 ) ( CLEAR ?auto_63794 ) ( HOLDING ?auto_63793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63793 )
      ( MAKE-4PILE ?auto_63793 ?auto_63794 ?auto_63795 ?auto_63796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63800 - BLOCK
      ?auto_63801 - BLOCK
      ?auto_63802 - BLOCK
      ?auto_63803 - BLOCK
    )
    :vars
    (
      ?auto_63805 - BLOCK
      ?auto_63806 - BLOCK
      ?auto_63804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63800 ?auto_63801 ) ) ( not ( = ?auto_63800 ?auto_63802 ) ) ( not ( = ?auto_63800 ?auto_63803 ) ) ( not ( = ?auto_63800 ?auto_63805 ) ) ( not ( = ?auto_63801 ?auto_63802 ) ) ( not ( = ?auto_63801 ?auto_63803 ) ) ( not ( = ?auto_63801 ?auto_63805 ) ) ( not ( = ?auto_63802 ?auto_63803 ) ) ( not ( = ?auto_63802 ?auto_63805 ) ) ( not ( = ?auto_63803 ?auto_63805 ) ) ( not ( = ?auto_63800 ?auto_63806 ) ) ( not ( = ?auto_63801 ?auto_63806 ) ) ( not ( = ?auto_63802 ?auto_63806 ) ) ( not ( = ?auto_63803 ?auto_63806 ) ) ( not ( = ?auto_63805 ?auto_63806 ) ) ( ON ?auto_63806 ?auto_63804 ) ( not ( = ?auto_63800 ?auto_63804 ) ) ( not ( = ?auto_63801 ?auto_63804 ) ) ( not ( = ?auto_63802 ?auto_63804 ) ) ( not ( = ?auto_63803 ?auto_63804 ) ) ( not ( = ?auto_63805 ?auto_63804 ) ) ( not ( = ?auto_63806 ?auto_63804 ) ) ( ON ?auto_63805 ?auto_63806 ) ( ON ?auto_63803 ?auto_63805 ) ( ON-TABLE ?auto_63804 ) ( ON ?auto_63802 ?auto_63803 ) ( ON ?auto_63801 ?auto_63802 ) ( ON ?auto_63800 ?auto_63801 ) ( CLEAR ?auto_63800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63804 ?auto_63806 ?auto_63805 ?auto_63803 ?auto_63802 ?auto_63801 )
      ( MAKE-4PILE ?auto_63800 ?auto_63801 ?auto_63802 ?auto_63803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63809 - BLOCK
      ?auto_63810 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63810 ) ( CLEAR ?auto_63809 ) ( ON-TABLE ?auto_63809 ) ( not ( = ?auto_63809 ?auto_63810 ) ) )
    :subtasks
    ( ( !STACK ?auto_63810 ?auto_63809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63811 - BLOCK
      ?auto_63812 - BLOCK
    )
    :vars
    (
      ?auto_63813 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63811 ) ( ON-TABLE ?auto_63811 ) ( not ( = ?auto_63811 ?auto_63812 ) ) ( ON ?auto_63812 ?auto_63813 ) ( CLEAR ?auto_63812 ) ( HAND-EMPTY ) ( not ( = ?auto_63811 ?auto_63813 ) ) ( not ( = ?auto_63812 ?auto_63813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63812 ?auto_63813 )
      ( MAKE-2PILE ?auto_63811 ?auto_63812 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63814 - BLOCK
      ?auto_63815 - BLOCK
    )
    :vars
    (
      ?auto_63816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63814 ?auto_63815 ) ) ( ON ?auto_63815 ?auto_63816 ) ( CLEAR ?auto_63815 ) ( not ( = ?auto_63814 ?auto_63816 ) ) ( not ( = ?auto_63815 ?auto_63816 ) ) ( HOLDING ?auto_63814 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63814 )
      ( MAKE-2PILE ?auto_63814 ?auto_63815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63817 - BLOCK
      ?auto_63818 - BLOCK
    )
    :vars
    (
      ?auto_63819 - BLOCK
      ?auto_63820 - BLOCK
      ?auto_63821 - BLOCK
      ?auto_63822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63817 ?auto_63818 ) ) ( ON ?auto_63818 ?auto_63819 ) ( not ( = ?auto_63817 ?auto_63819 ) ) ( not ( = ?auto_63818 ?auto_63819 ) ) ( ON ?auto_63817 ?auto_63818 ) ( CLEAR ?auto_63817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63820 ) ( ON ?auto_63821 ?auto_63820 ) ( ON ?auto_63822 ?auto_63821 ) ( ON ?auto_63819 ?auto_63822 ) ( not ( = ?auto_63820 ?auto_63821 ) ) ( not ( = ?auto_63820 ?auto_63822 ) ) ( not ( = ?auto_63820 ?auto_63819 ) ) ( not ( = ?auto_63820 ?auto_63818 ) ) ( not ( = ?auto_63820 ?auto_63817 ) ) ( not ( = ?auto_63821 ?auto_63822 ) ) ( not ( = ?auto_63821 ?auto_63819 ) ) ( not ( = ?auto_63821 ?auto_63818 ) ) ( not ( = ?auto_63821 ?auto_63817 ) ) ( not ( = ?auto_63822 ?auto_63819 ) ) ( not ( = ?auto_63822 ?auto_63818 ) ) ( not ( = ?auto_63822 ?auto_63817 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63820 ?auto_63821 ?auto_63822 ?auto_63819 ?auto_63818 )
      ( MAKE-2PILE ?auto_63817 ?auto_63818 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63823 - BLOCK
      ?auto_63824 - BLOCK
    )
    :vars
    (
      ?auto_63827 - BLOCK
      ?auto_63826 - BLOCK
      ?auto_63828 - BLOCK
      ?auto_63825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63823 ?auto_63824 ) ) ( ON ?auto_63824 ?auto_63827 ) ( not ( = ?auto_63823 ?auto_63827 ) ) ( not ( = ?auto_63824 ?auto_63827 ) ) ( ON-TABLE ?auto_63826 ) ( ON ?auto_63828 ?auto_63826 ) ( ON ?auto_63825 ?auto_63828 ) ( ON ?auto_63827 ?auto_63825 ) ( not ( = ?auto_63826 ?auto_63828 ) ) ( not ( = ?auto_63826 ?auto_63825 ) ) ( not ( = ?auto_63826 ?auto_63827 ) ) ( not ( = ?auto_63826 ?auto_63824 ) ) ( not ( = ?auto_63826 ?auto_63823 ) ) ( not ( = ?auto_63828 ?auto_63825 ) ) ( not ( = ?auto_63828 ?auto_63827 ) ) ( not ( = ?auto_63828 ?auto_63824 ) ) ( not ( = ?auto_63828 ?auto_63823 ) ) ( not ( = ?auto_63825 ?auto_63827 ) ) ( not ( = ?auto_63825 ?auto_63824 ) ) ( not ( = ?auto_63825 ?auto_63823 ) ) ( HOLDING ?auto_63823 ) ( CLEAR ?auto_63824 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63826 ?auto_63828 ?auto_63825 ?auto_63827 ?auto_63824 ?auto_63823 )
      ( MAKE-2PILE ?auto_63823 ?auto_63824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63829 - BLOCK
      ?auto_63830 - BLOCK
    )
    :vars
    (
      ?auto_63833 - BLOCK
      ?auto_63834 - BLOCK
      ?auto_63832 - BLOCK
      ?auto_63831 - BLOCK
      ?auto_63835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63829 ?auto_63830 ) ) ( ON ?auto_63830 ?auto_63833 ) ( not ( = ?auto_63829 ?auto_63833 ) ) ( not ( = ?auto_63830 ?auto_63833 ) ) ( ON-TABLE ?auto_63834 ) ( ON ?auto_63832 ?auto_63834 ) ( ON ?auto_63831 ?auto_63832 ) ( ON ?auto_63833 ?auto_63831 ) ( not ( = ?auto_63834 ?auto_63832 ) ) ( not ( = ?auto_63834 ?auto_63831 ) ) ( not ( = ?auto_63834 ?auto_63833 ) ) ( not ( = ?auto_63834 ?auto_63830 ) ) ( not ( = ?auto_63834 ?auto_63829 ) ) ( not ( = ?auto_63832 ?auto_63831 ) ) ( not ( = ?auto_63832 ?auto_63833 ) ) ( not ( = ?auto_63832 ?auto_63830 ) ) ( not ( = ?auto_63832 ?auto_63829 ) ) ( not ( = ?auto_63831 ?auto_63833 ) ) ( not ( = ?auto_63831 ?auto_63830 ) ) ( not ( = ?auto_63831 ?auto_63829 ) ) ( CLEAR ?auto_63830 ) ( ON ?auto_63829 ?auto_63835 ) ( CLEAR ?auto_63829 ) ( HAND-EMPTY ) ( not ( = ?auto_63829 ?auto_63835 ) ) ( not ( = ?auto_63830 ?auto_63835 ) ) ( not ( = ?auto_63833 ?auto_63835 ) ) ( not ( = ?auto_63834 ?auto_63835 ) ) ( not ( = ?auto_63832 ?auto_63835 ) ) ( not ( = ?auto_63831 ?auto_63835 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63829 ?auto_63835 )
      ( MAKE-2PILE ?auto_63829 ?auto_63830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63836 - BLOCK
      ?auto_63837 - BLOCK
    )
    :vars
    (
      ?auto_63841 - BLOCK
      ?auto_63838 - BLOCK
      ?auto_63840 - BLOCK
      ?auto_63839 - BLOCK
      ?auto_63842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63836 ?auto_63837 ) ) ( not ( = ?auto_63836 ?auto_63841 ) ) ( not ( = ?auto_63837 ?auto_63841 ) ) ( ON-TABLE ?auto_63838 ) ( ON ?auto_63840 ?auto_63838 ) ( ON ?auto_63839 ?auto_63840 ) ( ON ?auto_63841 ?auto_63839 ) ( not ( = ?auto_63838 ?auto_63840 ) ) ( not ( = ?auto_63838 ?auto_63839 ) ) ( not ( = ?auto_63838 ?auto_63841 ) ) ( not ( = ?auto_63838 ?auto_63837 ) ) ( not ( = ?auto_63838 ?auto_63836 ) ) ( not ( = ?auto_63840 ?auto_63839 ) ) ( not ( = ?auto_63840 ?auto_63841 ) ) ( not ( = ?auto_63840 ?auto_63837 ) ) ( not ( = ?auto_63840 ?auto_63836 ) ) ( not ( = ?auto_63839 ?auto_63841 ) ) ( not ( = ?auto_63839 ?auto_63837 ) ) ( not ( = ?auto_63839 ?auto_63836 ) ) ( ON ?auto_63836 ?auto_63842 ) ( CLEAR ?auto_63836 ) ( not ( = ?auto_63836 ?auto_63842 ) ) ( not ( = ?auto_63837 ?auto_63842 ) ) ( not ( = ?auto_63841 ?auto_63842 ) ) ( not ( = ?auto_63838 ?auto_63842 ) ) ( not ( = ?auto_63840 ?auto_63842 ) ) ( not ( = ?auto_63839 ?auto_63842 ) ) ( HOLDING ?auto_63837 ) ( CLEAR ?auto_63841 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63838 ?auto_63840 ?auto_63839 ?auto_63841 ?auto_63837 )
      ( MAKE-2PILE ?auto_63836 ?auto_63837 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63843 - BLOCK
      ?auto_63844 - BLOCK
    )
    :vars
    (
      ?auto_63848 - BLOCK
      ?auto_63849 - BLOCK
      ?auto_63847 - BLOCK
      ?auto_63846 - BLOCK
      ?auto_63845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63843 ?auto_63844 ) ) ( not ( = ?auto_63843 ?auto_63848 ) ) ( not ( = ?auto_63844 ?auto_63848 ) ) ( ON-TABLE ?auto_63849 ) ( ON ?auto_63847 ?auto_63849 ) ( ON ?auto_63846 ?auto_63847 ) ( ON ?auto_63848 ?auto_63846 ) ( not ( = ?auto_63849 ?auto_63847 ) ) ( not ( = ?auto_63849 ?auto_63846 ) ) ( not ( = ?auto_63849 ?auto_63848 ) ) ( not ( = ?auto_63849 ?auto_63844 ) ) ( not ( = ?auto_63849 ?auto_63843 ) ) ( not ( = ?auto_63847 ?auto_63846 ) ) ( not ( = ?auto_63847 ?auto_63848 ) ) ( not ( = ?auto_63847 ?auto_63844 ) ) ( not ( = ?auto_63847 ?auto_63843 ) ) ( not ( = ?auto_63846 ?auto_63848 ) ) ( not ( = ?auto_63846 ?auto_63844 ) ) ( not ( = ?auto_63846 ?auto_63843 ) ) ( ON ?auto_63843 ?auto_63845 ) ( not ( = ?auto_63843 ?auto_63845 ) ) ( not ( = ?auto_63844 ?auto_63845 ) ) ( not ( = ?auto_63848 ?auto_63845 ) ) ( not ( = ?auto_63849 ?auto_63845 ) ) ( not ( = ?auto_63847 ?auto_63845 ) ) ( not ( = ?auto_63846 ?auto_63845 ) ) ( CLEAR ?auto_63848 ) ( ON ?auto_63844 ?auto_63843 ) ( CLEAR ?auto_63844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63845 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63845 ?auto_63843 )
      ( MAKE-2PILE ?auto_63843 ?auto_63844 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63850 - BLOCK
      ?auto_63851 - BLOCK
    )
    :vars
    (
      ?auto_63853 - BLOCK
      ?auto_63852 - BLOCK
      ?auto_63854 - BLOCK
      ?auto_63855 - BLOCK
      ?auto_63856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63850 ?auto_63851 ) ) ( not ( = ?auto_63850 ?auto_63853 ) ) ( not ( = ?auto_63851 ?auto_63853 ) ) ( ON-TABLE ?auto_63852 ) ( ON ?auto_63854 ?auto_63852 ) ( ON ?auto_63855 ?auto_63854 ) ( not ( = ?auto_63852 ?auto_63854 ) ) ( not ( = ?auto_63852 ?auto_63855 ) ) ( not ( = ?auto_63852 ?auto_63853 ) ) ( not ( = ?auto_63852 ?auto_63851 ) ) ( not ( = ?auto_63852 ?auto_63850 ) ) ( not ( = ?auto_63854 ?auto_63855 ) ) ( not ( = ?auto_63854 ?auto_63853 ) ) ( not ( = ?auto_63854 ?auto_63851 ) ) ( not ( = ?auto_63854 ?auto_63850 ) ) ( not ( = ?auto_63855 ?auto_63853 ) ) ( not ( = ?auto_63855 ?auto_63851 ) ) ( not ( = ?auto_63855 ?auto_63850 ) ) ( ON ?auto_63850 ?auto_63856 ) ( not ( = ?auto_63850 ?auto_63856 ) ) ( not ( = ?auto_63851 ?auto_63856 ) ) ( not ( = ?auto_63853 ?auto_63856 ) ) ( not ( = ?auto_63852 ?auto_63856 ) ) ( not ( = ?auto_63854 ?auto_63856 ) ) ( not ( = ?auto_63855 ?auto_63856 ) ) ( ON ?auto_63851 ?auto_63850 ) ( CLEAR ?auto_63851 ) ( ON-TABLE ?auto_63856 ) ( HOLDING ?auto_63853 ) ( CLEAR ?auto_63855 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63852 ?auto_63854 ?auto_63855 ?auto_63853 )
      ( MAKE-2PILE ?auto_63850 ?auto_63851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63857 - BLOCK
      ?auto_63858 - BLOCK
    )
    :vars
    (
      ?auto_63861 - BLOCK
      ?auto_63860 - BLOCK
      ?auto_63859 - BLOCK
      ?auto_63863 - BLOCK
      ?auto_63862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63857 ?auto_63858 ) ) ( not ( = ?auto_63857 ?auto_63861 ) ) ( not ( = ?auto_63858 ?auto_63861 ) ) ( ON-TABLE ?auto_63860 ) ( ON ?auto_63859 ?auto_63860 ) ( ON ?auto_63863 ?auto_63859 ) ( not ( = ?auto_63860 ?auto_63859 ) ) ( not ( = ?auto_63860 ?auto_63863 ) ) ( not ( = ?auto_63860 ?auto_63861 ) ) ( not ( = ?auto_63860 ?auto_63858 ) ) ( not ( = ?auto_63860 ?auto_63857 ) ) ( not ( = ?auto_63859 ?auto_63863 ) ) ( not ( = ?auto_63859 ?auto_63861 ) ) ( not ( = ?auto_63859 ?auto_63858 ) ) ( not ( = ?auto_63859 ?auto_63857 ) ) ( not ( = ?auto_63863 ?auto_63861 ) ) ( not ( = ?auto_63863 ?auto_63858 ) ) ( not ( = ?auto_63863 ?auto_63857 ) ) ( ON ?auto_63857 ?auto_63862 ) ( not ( = ?auto_63857 ?auto_63862 ) ) ( not ( = ?auto_63858 ?auto_63862 ) ) ( not ( = ?auto_63861 ?auto_63862 ) ) ( not ( = ?auto_63860 ?auto_63862 ) ) ( not ( = ?auto_63859 ?auto_63862 ) ) ( not ( = ?auto_63863 ?auto_63862 ) ) ( ON ?auto_63858 ?auto_63857 ) ( ON-TABLE ?auto_63862 ) ( CLEAR ?auto_63863 ) ( ON ?auto_63861 ?auto_63858 ) ( CLEAR ?auto_63861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63862 ?auto_63857 ?auto_63858 )
      ( MAKE-2PILE ?auto_63857 ?auto_63858 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63864 - BLOCK
      ?auto_63865 - BLOCK
    )
    :vars
    (
      ?auto_63870 - BLOCK
      ?auto_63868 - BLOCK
      ?auto_63866 - BLOCK
      ?auto_63869 - BLOCK
      ?auto_63867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63864 ?auto_63865 ) ) ( not ( = ?auto_63864 ?auto_63870 ) ) ( not ( = ?auto_63865 ?auto_63870 ) ) ( ON-TABLE ?auto_63868 ) ( ON ?auto_63866 ?auto_63868 ) ( not ( = ?auto_63868 ?auto_63866 ) ) ( not ( = ?auto_63868 ?auto_63869 ) ) ( not ( = ?auto_63868 ?auto_63870 ) ) ( not ( = ?auto_63868 ?auto_63865 ) ) ( not ( = ?auto_63868 ?auto_63864 ) ) ( not ( = ?auto_63866 ?auto_63869 ) ) ( not ( = ?auto_63866 ?auto_63870 ) ) ( not ( = ?auto_63866 ?auto_63865 ) ) ( not ( = ?auto_63866 ?auto_63864 ) ) ( not ( = ?auto_63869 ?auto_63870 ) ) ( not ( = ?auto_63869 ?auto_63865 ) ) ( not ( = ?auto_63869 ?auto_63864 ) ) ( ON ?auto_63864 ?auto_63867 ) ( not ( = ?auto_63864 ?auto_63867 ) ) ( not ( = ?auto_63865 ?auto_63867 ) ) ( not ( = ?auto_63870 ?auto_63867 ) ) ( not ( = ?auto_63868 ?auto_63867 ) ) ( not ( = ?auto_63866 ?auto_63867 ) ) ( not ( = ?auto_63869 ?auto_63867 ) ) ( ON ?auto_63865 ?auto_63864 ) ( ON-TABLE ?auto_63867 ) ( ON ?auto_63870 ?auto_63865 ) ( CLEAR ?auto_63870 ) ( HOLDING ?auto_63869 ) ( CLEAR ?auto_63866 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63868 ?auto_63866 ?auto_63869 )
      ( MAKE-2PILE ?auto_63864 ?auto_63865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63871 - BLOCK
      ?auto_63872 - BLOCK
    )
    :vars
    (
      ?auto_63873 - BLOCK
      ?auto_63876 - BLOCK
      ?auto_63874 - BLOCK
      ?auto_63875 - BLOCK
      ?auto_63877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63871 ?auto_63872 ) ) ( not ( = ?auto_63871 ?auto_63873 ) ) ( not ( = ?auto_63872 ?auto_63873 ) ) ( ON-TABLE ?auto_63876 ) ( ON ?auto_63874 ?auto_63876 ) ( not ( = ?auto_63876 ?auto_63874 ) ) ( not ( = ?auto_63876 ?auto_63875 ) ) ( not ( = ?auto_63876 ?auto_63873 ) ) ( not ( = ?auto_63876 ?auto_63872 ) ) ( not ( = ?auto_63876 ?auto_63871 ) ) ( not ( = ?auto_63874 ?auto_63875 ) ) ( not ( = ?auto_63874 ?auto_63873 ) ) ( not ( = ?auto_63874 ?auto_63872 ) ) ( not ( = ?auto_63874 ?auto_63871 ) ) ( not ( = ?auto_63875 ?auto_63873 ) ) ( not ( = ?auto_63875 ?auto_63872 ) ) ( not ( = ?auto_63875 ?auto_63871 ) ) ( ON ?auto_63871 ?auto_63877 ) ( not ( = ?auto_63871 ?auto_63877 ) ) ( not ( = ?auto_63872 ?auto_63877 ) ) ( not ( = ?auto_63873 ?auto_63877 ) ) ( not ( = ?auto_63876 ?auto_63877 ) ) ( not ( = ?auto_63874 ?auto_63877 ) ) ( not ( = ?auto_63875 ?auto_63877 ) ) ( ON ?auto_63872 ?auto_63871 ) ( ON-TABLE ?auto_63877 ) ( ON ?auto_63873 ?auto_63872 ) ( CLEAR ?auto_63874 ) ( ON ?auto_63875 ?auto_63873 ) ( CLEAR ?auto_63875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63877 ?auto_63871 ?auto_63872 ?auto_63873 )
      ( MAKE-2PILE ?auto_63871 ?auto_63872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63878 - BLOCK
      ?auto_63879 - BLOCK
    )
    :vars
    (
      ?auto_63884 - BLOCK
      ?auto_63883 - BLOCK
      ?auto_63881 - BLOCK
      ?auto_63880 - BLOCK
      ?auto_63882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63878 ?auto_63879 ) ) ( not ( = ?auto_63878 ?auto_63884 ) ) ( not ( = ?auto_63879 ?auto_63884 ) ) ( ON-TABLE ?auto_63883 ) ( not ( = ?auto_63883 ?auto_63881 ) ) ( not ( = ?auto_63883 ?auto_63880 ) ) ( not ( = ?auto_63883 ?auto_63884 ) ) ( not ( = ?auto_63883 ?auto_63879 ) ) ( not ( = ?auto_63883 ?auto_63878 ) ) ( not ( = ?auto_63881 ?auto_63880 ) ) ( not ( = ?auto_63881 ?auto_63884 ) ) ( not ( = ?auto_63881 ?auto_63879 ) ) ( not ( = ?auto_63881 ?auto_63878 ) ) ( not ( = ?auto_63880 ?auto_63884 ) ) ( not ( = ?auto_63880 ?auto_63879 ) ) ( not ( = ?auto_63880 ?auto_63878 ) ) ( ON ?auto_63878 ?auto_63882 ) ( not ( = ?auto_63878 ?auto_63882 ) ) ( not ( = ?auto_63879 ?auto_63882 ) ) ( not ( = ?auto_63884 ?auto_63882 ) ) ( not ( = ?auto_63883 ?auto_63882 ) ) ( not ( = ?auto_63881 ?auto_63882 ) ) ( not ( = ?auto_63880 ?auto_63882 ) ) ( ON ?auto_63879 ?auto_63878 ) ( ON-TABLE ?auto_63882 ) ( ON ?auto_63884 ?auto_63879 ) ( ON ?auto_63880 ?auto_63884 ) ( CLEAR ?auto_63880 ) ( HOLDING ?auto_63881 ) ( CLEAR ?auto_63883 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63883 ?auto_63881 )
      ( MAKE-2PILE ?auto_63878 ?auto_63879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63885 - BLOCK
      ?auto_63886 - BLOCK
    )
    :vars
    (
      ?auto_63887 - BLOCK
      ?auto_63891 - BLOCK
      ?auto_63889 - BLOCK
      ?auto_63888 - BLOCK
      ?auto_63890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63885 ?auto_63886 ) ) ( not ( = ?auto_63885 ?auto_63887 ) ) ( not ( = ?auto_63886 ?auto_63887 ) ) ( ON-TABLE ?auto_63891 ) ( not ( = ?auto_63891 ?auto_63889 ) ) ( not ( = ?auto_63891 ?auto_63888 ) ) ( not ( = ?auto_63891 ?auto_63887 ) ) ( not ( = ?auto_63891 ?auto_63886 ) ) ( not ( = ?auto_63891 ?auto_63885 ) ) ( not ( = ?auto_63889 ?auto_63888 ) ) ( not ( = ?auto_63889 ?auto_63887 ) ) ( not ( = ?auto_63889 ?auto_63886 ) ) ( not ( = ?auto_63889 ?auto_63885 ) ) ( not ( = ?auto_63888 ?auto_63887 ) ) ( not ( = ?auto_63888 ?auto_63886 ) ) ( not ( = ?auto_63888 ?auto_63885 ) ) ( ON ?auto_63885 ?auto_63890 ) ( not ( = ?auto_63885 ?auto_63890 ) ) ( not ( = ?auto_63886 ?auto_63890 ) ) ( not ( = ?auto_63887 ?auto_63890 ) ) ( not ( = ?auto_63891 ?auto_63890 ) ) ( not ( = ?auto_63889 ?auto_63890 ) ) ( not ( = ?auto_63888 ?auto_63890 ) ) ( ON ?auto_63886 ?auto_63885 ) ( ON-TABLE ?auto_63890 ) ( ON ?auto_63887 ?auto_63886 ) ( ON ?auto_63888 ?auto_63887 ) ( CLEAR ?auto_63891 ) ( ON ?auto_63889 ?auto_63888 ) ( CLEAR ?auto_63889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63890 ?auto_63885 ?auto_63886 ?auto_63887 ?auto_63888 )
      ( MAKE-2PILE ?auto_63885 ?auto_63886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63892 - BLOCK
      ?auto_63893 - BLOCK
    )
    :vars
    (
      ?auto_63896 - BLOCK
      ?auto_63894 - BLOCK
      ?auto_63895 - BLOCK
      ?auto_63897 - BLOCK
      ?auto_63898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63892 ?auto_63893 ) ) ( not ( = ?auto_63892 ?auto_63896 ) ) ( not ( = ?auto_63893 ?auto_63896 ) ) ( not ( = ?auto_63894 ?auto_63895 ) ) ( not ( = ?auto_63894 ?auto_63897 ) ) ( not ( = ?auto_63894 ?auto_63896 ) ) ( not ( = ?auto_63894 ?auto_63893 ) ) ( not ( = ?auto_63894 ?auto_63892 ) ) ( not ( = ?auto_63895 ?auto_63897 ) ) ( not ( = ?auto_63895 ?auto_63896 ) ) ( not ( = ?auto_63895 ?auto_63893 ) ) ( not ( = ?auto_63895 ?auto_63892 ) ) ( not ( = ?auto_63897 ?auto_63896 ) ) ( not ( = ?auto_63897 ?auto_63893 ) ) ( not ( = ?auto_63897 ?auto_63892 ) ) ( ON ?auto_63892 ?auto_63898 ) ( not ( = ?auto_63892 ?auto_63898 ) ) ( not ( = ?auto_63893 ?auto_63898 ) ) ( not ( = ?auto_63896 ?auto_63898 ) ) ( not ( = ?auto_63894 ?auto_63898 ) ) ( not ( = ?auto_63895 ?auto_63898 ) ) ( not ( = ?auto_63897 ?auto_63898 ) ) ( ON ?auto_63893 ?auto_63892 ) ( ON-TABLE ?auto_63898 ) ( ON ?auto_63896 ?auto_63893 ) ( ON ?auto_63897 ?auto_63896 ) ( ON ?auto_63895 ?auto_63897 ) ( CLEAR ?auto_63895 ) ( HOLDING ?auto_63894 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63894 )
      ( MAKE-2PILE ?auto_63892 ?auto_63893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63899 - BLOCK
      ?auto_63900 - BLOCK
    )
    :vars
    (
      ?auto_63904 - BLOCK
      ?auto_63901 - BLOCK
      ?auto_63905 - BLOCK
      ?auto_63902 - BLOCK
      ?auto_63903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63899 ?auto_63900 ) ) ( not ( = ?auto_63899 ?auto_63904 ) ) ( not ( = ?auto_63900 ?auto_63904 ) ) ( not ( = ?auto_63901 ?auto_63905 ) ) ( not ( = ?auto_63901 ?auto_63902 ) ) ( not ( = ?auto_63901 ?auto_63904 ) ) ( not ( = ?auto_63901 ?auto_63900 ) ) ( not ( = ?auto_63901 ?auto_63899 ) ) ( not ( = ?auto_63905 ?auto_63902 ) ) ( not ( = ?auto_63905 ?auto_63904 ) ) ( not ( = ?auto_63905 ?auto_63900 ) ) ( not ( = ?auto_63905 ?auto_63899 ) ) ( not ( = ?auto_63902 ?auto_63904 ) ) ( not ( = ?auto_63902 ?auto_63900 ) ) ( not ( = ?auto_63902 ?auto_63899 ) ) ( ON ?auto_63899 ?auto_63903 ) ( not ( = ?auto_63899 ?auto_63903 ) ) ( not ( = ?auto_63900 ?auto_63903 ) ) ( not ( = ?auto_63904 ?auto_63903 ) ) ( not ( = ?auto_63901 ?auto_63903 ) ) ( not ( = ?auto_63905 ?auto_63903 ) ) ( not ( = ?auto_63902 ?auto_63903 ) ) ( ON ?auto_63900 ?auto_63899 ) ( ON-TABLE ?auto_63903 ) ( ON ?auto_63904 ?auto_63900 ) ( ON ?auto_63902 ?auto_63904 ) ( ON ?auto_63905 ?auto_63902 ) ( ON ?auto_63901 ?auto_63905 ) ( CLEAR ?auto_63901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63903 ?auto_63899 ?auto_63900 ?auto_63904 ?auto_63902 ?auto_63905 )
      ( MAKE-2PILE ?auto_63899 ?auto_63900 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63909 - BLOCK
      ?auto_63910 - BLOCK
      ?auto_63911 - BLOCK
    )
    :vars
    (
      ?auto_63912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63912 ?auto_63911 ) ( CLEAR ?auto_63912 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63909 ) ( ON ?auto_63910 ?auto_63909 ) ( ON ?auto_63911 ?auto_63910 ) ( not ( = ?auto_63909 ?auto_63910 ) ) ( not ( = ?auto_63909 ?auto_63911 ) ) ( not ( = ?auto_63909 ?auto_63912 ) ) ( not ( = ?auto_63910 ?auto_63911 ) ) ( not ( = ?auto_63910 ?auto_63912 ) ) ( not ( = ?auto_63911 ?auto_63912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63912 ?auto_63911 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63913 - BLOCK
      ?auto_63914 - BLOCK
      ?auto_63915 - BLOCK
    )
    :vars
    (
      ?auto_63916 - BLOCK
      ?auto_63917 - BLOCK
      ?auto_63918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63916 ?auto_63915 ) ( CLEAR ?auto_63916 ) ( ON-TABLE ?auto_63913 ) ( ON ?auto_63914 ?auto_63913 ) ( ON ?auto_63915 ?auto_63914 ) ( not ( = ?auto_63913 ?auto_63914 ) ) ( not ( = ?auto_63913 ?auto_63915 ) ) ( not ( = ?auto_63913 ?auto_63916 ) ) ( not ( = ?auto_63914 ?auto_63915 ) ) ( not ( = ?auto_63914 ?auto_63916 ) ) ( not ( = ?auto_63915 ?auto_63916 ) ) ( HOLDING ?auto_63917 ) ( CLEAR ?auto_63918 ) ( not ( = ?auto_63913 ?auto_63917 ) ) ( not ( = ?auto_63913 ?auto_63918 ) ) ( not ( = ?auto_63914 ?auto_63917 ) ) ( not ( = ?auto_63914 ?auto_63918 ) ) ( not ( = ?auto_63915 ?auto_63917 ) ) ( not ( = ?auto_63915 ?auto_63918 ) ) ( not ( = ?auto_63916 ?auto_63917 ) ) ( not ( = ?auto_63916 ?auto_63918 ) ) ( not ( = ?auto_63917 ?auto_63918 ) ) )
    :subtasks
    ( ( !STACK ?auto_63917 ?auto_63918 )
      ( MAKE-3PILE ?auto_63913 ?auto_63914 ?auto_63915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63919 - BLOCK
      ?auto_63920 - BLOCK
      ?auto_63921 - BLOCK
    )
    :vars
    (
      ?auto_63922 - BLOCK
      ?auto_63924 - BLOCK
      ?auto_63923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63922 ?auto_63921 ) ( ON-TABLE ?auto_63919 ) ( ON ?auto_63920 ?auto_63919 ) ( ON ?auto_63921 ?auto_63920 ) ( not ( = ?auto_63919 ?auto_63920 ) ) ( not ( = ?auto_63919 ?auto_63921 ) ) ( not ( = ?auto_63919 ?auto_63922 ) ) ( not ( = ?auto_63920 ?auto_63921 ) ) ( not ( = ?auto_63920 ?auto_63922 ) ) ( not ( = ?auto_63921 ?auto_63922 ) ) ( CLEAR ?auto_63924 ) ( not ( = ?auto_63919 ?auto_63923 ) ) ( not ( = ?auto_63919 ?auto_63924 ) ) ( not ( = ?auto_63920 ?auto_63923 ) ) ( not ( = ?auto_63920 ?auto_63924 ) ) ( not ( = ?auto_63921 ?auto_63923 ) ) ( not ( = ?auto_63921 ?auto_63924 ) ) ( not ( = ?auto_63922 ?auto_63923 ) ) ( not ( = ?auto_63922 ?auto_63924 ) ) ( not ( = ?auto_63923 ?auto_63924 ) ) ( ON ?auto_63923 ?auto_63922 ) ( CLEAR ?auto_63923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63919 ?auto_63920 ?auto_63921 ?auto_63922 )
      ( MAKE-3PILE ?auto_63919 ?auto_63920 ?auto_63921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63925 - BLOCK
      ?auto_63926 - BLOCK
      ?auto_63927 - BLOCK
    )
    :vars
    (
      ?auto_63928 - BLOCK
      ?auto_63929 - BLOCK
      ?auto_63930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63928 ?auto_63927 ) ( ON-TABLE ?auto_63925 ) ( ON ?auto_63926 ?auto_63925 ) ( ON ?auto_63927 ?auto_63926 ) ( not ( = ?auto_63925 ?auto_63926 ) ) ( not ( = ?auto_63925 ?auto_63927 ) ) ( not ( = ?auto_63925 ?auto_63928 ) ) ( not ( = ?auto_63926 ?auto_63927 ) ) ( not ( = ?auto_63926 ?auto_63928 ) ) ( not ( = ?auto_63927 ?auto_63928 ) ) ( not ( = ?auto_63925 ?auto_63929 ) ) ( not ( = ?auto_63925 ?auto_63930 ) ) ( not ( = ?auto_63926 ?auto_63929 ) ) ( not ( = ?auto_63926 ?auto_63930 ) ) ( not ( = ?auto_63927 ?auto_63929 ) ) ( not ( = ?auto_63927 ?auto_63930 ) ) ( not ( = ?auto_63928 ?auto_63929 ) ) ( not ( = ?auto_63928 ?auto_63930 ) ) ( not ( = ?auto_63929 ?auto_63930 ) ) ( ON ?auto_63929 ?auto_63928 ) ( CLEAR ?auto_63929 ) ( HOLDING ?auto_63930 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63930 )
      ( MAKE-3PILE ?auto_63925 ?auto_63926 ?auto_63927 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63931 - BLOCK
      ?auto_63932 - BLOCK
      ?auto_63933 - BLOCK
    )
    :vars
    (
      ?auto_63934 - BLOCK
      ?auto_63936 - BLOCK
      ?auto_63935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63934 ?auto_63933 ) ( ON-TABLE ?auto_63931 ) ( ON ?auto_63932 ?auto_63931 ) ( ON ?auto_63933 ?auto_63932 ) ( not ( = ?auto_63931 ?auto_63932 ) ) ( not ( = ?auto_63931 ?auto_63933 ) ) ( not ( = ?auto_63931 ?auto_63934 ) ) ( not ( = ?auto_63932 ?auto_63933 ) ) ( not ( = ?auto_63932 ?auto_63934 ) ) ( not ( = ?auto_63933 ?auto_63934 ) ) ( not ( = ?auto_63931 ?auto_63936 ) ) ( not ( = ?auto_63931 ?auto_63935 ) ) ( not ( = ?auto_63932 ?auto_63936 ) ) ( not ( = ?auto_63932 ?auto_63935 ) ) ( not ( = ?auto_63933 ?auto_63936 ) ) ( not ( = ?auto_63933 ?auto_63935 ) ) ( not ( = ?auto_63934 ?auto_63936 ) ) ( not ( = ?auto_63934 ?auto_63935 ) ) ( not ( = ?auto_63936 ?auto_63935 ) ) ( ON ?auto_63936 ?auto_63934 ) ( ON ?auto_63935 ?auto_63936 ) ( CLEAR ?auto_63935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63931 ?auto_63932 ?auto_63933 ?auto_63934 ?auto_63936 )
      ( MAKE-3PILE ?auto_63931 ?auto_63932 ?auto_63933 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63937 - BLOCK
      ?auto_63938 - BLOCK
      ?auto_63939 - BLOCK
    )
    :vars
    (
      ?auto_63940 - BLOCK
      ?auto_63942 - BLOCK
      ?auto_63941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63940 ?auto_63939 ) ( ON-TABLE ?auto_63937 ) ( ON ?auto_63938 ?auto_63937 ) ( ON ?auto_63939 ?auto_63938 ) ( not ( = ?auto_63937 ?auto_63938 ) ) ( not ( = ?auto_63937 ?auto_63939 ) ) ( not ( = ?auto_63937 ?auto_63940 ) ) ( not ( = ?auto_63938 ?auto_63939 ) ) ( not ( = ?auto_63938 ?auto_63940 ) ) ( not ( = ?auto_63939 ?auto_63940 ) ) ( not ( = ?auto_63937 ?auto_63942 ) ) ( not ( = ?auto_63937 ?auto_63941 ) ) ( not ( = ?auto_63938 ?auto_63942 ) ) ( not ( = ?auto_63938 ?auto_63941 ) ) ( not ( = ?auto_63939 ?auto_63942 ) ) ( not ( = ?auto_63939 ?auto_63941 ) ) ( not ( = ?auto_63940 ?auto_63942 ) ) ( not ( = ?auto_63940 ?auto_63941 ) ) ( not ( = ?auto_63942 ?auto_63941 ) ) ( ON ?auto_63942 ?auto_63940 ) ( HOLDING ?auto_63941 ) ( CLEAR ?auto_63942 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63937 ?auto_63938 ?auto_63939 ?auto_63940 ?auto_63942 ?auto_63941 )
      ( MAKE-3PILE ?auto_63937 ?auto_63938 ?auto_63939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63943 - BLOCK
      ?auto_63944 - BLOCK
      ?auto_63945 - BLOCK
    )
    :vars
    (
      ?auto_63947 - BLOCK
      ?auto_63946 - BLOCK
      ?auto_63948 - BLOCK
      ?auto_63949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63947 ?auto_63945 ) ( ON-TABLE ?auto_63943 ) ( ON ?auto_63944 ?auto_63943 ) ( ON ?auto_63945 ?auto_63944 ) ( not ( = ?auto_63943 ?auto_63944 ) ) ( not ( = ?auto_63943 ?auto_63945 ) ) ( not ( = ?auto_63943 ?auto_63947 ) ) ( not ( = ?auto_63944 ?auto_63945 ) ) ( not ( = ?auto_63944 ?auto_63947 ) ) ( not ( = ?auto_63945 ?auto_63947 ) ) ( not ( = ?auto_63943 ?auto_63946 ) ) ( not ( = ?auto_63943 ?auto_63948 ) ) ( not ( = ?auto_63944 ?auto_63946 ) ) ( not ( = ?auto_63944 ?auto_63948 ) ) ( not ( = ?auto_63945 ?auto_63946 ) ) ( not ( = ?auto_63945 ?auto_63948 ) ) ( not ( = ?auto_63947 ?auto_63946 ) ) ( not ( = ?auto_63947 ?auto_63948 ) ) ( not ( = ?auto_63946 ?auto_63948 ) ) ( ON ?auto_63946 ?auto_63947 ) ( CLEAR ?auto_63946 ) ( ON ?auto_63948 ?auto_63949 ) ( CLEAR ?auto_63948 ) ( HAND-EMPTY ) ( not ( = ?auto_63943 ?auto_63949 ) ) ( not ( = ?auto_63944 ?auto_63949 ) ) ( not ( = ?auto_63945 ?auto_63949 ) ) ( not ( = ?auto_63947 ?auto_63949 ) ) ( not ( = ?auto_63946 ?auto_63949 ) ) ( not ( = ?auto_63948 ?auto_63949 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63948 ?auto_63949 )
      ( MAKE-3PILE ?auto_63943 ?auto_63944 ?auto_63945 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63950 - BLOCK
      ?auto_63951 - BLOCK
      ?auto_63952 - BLOCK
    )
    :vars
    (
      ?auto_63956 - BLOCK
      ?auto_63954 - BLOCK
      ?auto_63953 - BLOCK
      ?auto_63955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63956 ?auto_63952 ) ( ON-TABLE ?auto_63950 ) ( ON ?auto_63951 ?auto_63950 ) ( ON ?auto_63952 ?auto_63951 ) ( not ( = ?auto_63950 ?auto_63951 ) ) ( not ( = ?auto_63950 ?auto_63952 ) ) ( not ( = ?auto_63950 ?auto_63956 ) ) ( not ( = ?auto_63951 ?auto_63952 ) ) ( not ( = ?auto_63951 ?auto_63956 ) ) ( not ( = ?auto_63952 ?auto_63956 ) ) ( not ( = ?auto_63950 ?auto_63954 ) ) ( not ( = ?auto_63950 ?auto_63953 ) ) ( not ( = ?auto_63951 ?auto_63954 ) ) ( not ( = ?auto_63951 ?auto_63953 ) ) ( not ( = ?auto_63952 ?auto_63954 ) ) ( not ( = ?auto_63952 ?auto_63953 ) ) ( not ( = ?auto_63956 ?auto_63954 ) ) ( not ( = ?auto_63956 ?auto_63953 ) ) ( not ( = ?auto_63954 ?auto_63953 ) ) ( ON ?auto_63953 ?auto_63955 ) ( CLEAR ?auto_63953 ) ( not ( = ?auto_63950 ?auto_63955 ) ) ( not ( = ?auto_63951 ?auto_63955 ) ) ( not ( = ?auto_63952 ?auto_63955 ) ) ( not ( = ?auto_63956 ?auto_63955 ) ) ( not ( = ?auto_63954 ?auto_63955 ) ) ( not ( = ?auto_63953 ?auto_63955 ) ) ( HOLDING ?auto_63954 ) ( CLEAR ?auto_63956 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63950 ?auto_63951 ?auto_63952 ?auto_63956 ?auto_63954 )
      ( MAKE-3PILE ?auto_63950 ?auto_63951 ?auto_63952 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63957 - BLOCK
      ?auto_63958 - BLOCK
      ?auto_63959 - BLOCK
    )
    :vars
    (
      ?auto_63961 - BLOCK
      ?auto_63962 - BLOCK
      ?auto_63960 - BLOCK
      ?auto_63963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63961 ?auto_63959 ) ( ON-TABLE ?auto_63957 ) ( ON ?auto_63958 ?auto_63957 ) ( ON ?auto_63959 ?auto_63958 ) ( not ( = ?auto_63957 ?auto_63958 ) ) ( not ( = ?auto_63957 ?auto_63959 ) ) ( not ( = ?auto_63957 ?auto_63961 ) ) ( not ( = ?auto_63958 ?auto_63959 ) ) ( not ( = ?auto_63958 ?auto_63961 ) ) ( not ( = ?auto_63959 ?auto_63961 ) ) ( not ( = ?auto_63957 ?auto_63962 ) ) ( not ( = ?auto_63957 ?auto_63960 ) ) ( not ( = ?auto_63958 ?auto_63962 ) ) ( not ( = ?auto_63958 ?auto_63960 ) ) ( not ( = ?auto_63959 ?auto_63962 ) ) ( not ( = ?auto_63959 ?auto_63960 ) ) ( not ( = ?auto_63961 ?auto_63962 ) ) ( not ( = ?auto_63961 ?auto_63960 ) ) ( not ( = ?auto_63962 ?auto_63960 ) ) ( ON ?auto_63960 ?auto_63963 ) ( not ( = ?auto_63957 ?auto_63963 ) ) ( not ( = ?auto_63958 ?auto_63963 ) ) ( not ( = ?auto_63959 ?auto_63963 ) ) ( not ( = ?auto_63961 ?auto_63963 ) ) ( not ( = ?auto_63962 ?auto_63963 ) ) ( not ( = ?auto_63960 ?auto_63963 ) ) ( CLEAR ?auto_63961 ) ( ON ?auto_63962 ?auto_63960 ) ( CLEAR ?auto_63962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63963 ?auto_63960 )
      ( MAKE-3PILE ?auto_63957 ?auto_63958 ?auto_63959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63978 - BLOCK
      ?auto_63979 - BLOCK
      ?auto_63980 - BLOCK
    )
    :vars
    (
      ?auto_63981 - BLOCK
      ?auto_63983 - BLOCK
      ?auto_63984 - BLOCK
      ?auto_63982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63978 ) ( ON ?auto_63979 ?auto_63978 ) ( not ( = ?auto_63978 ?auto_63979 ) ) ( not ( = ?auto_63978 ?auto_63980 ) ) ( not ( = ?auto_63978 ?auto_63981 ) ) ( not ( = ?auto_63979 ?auto_63980 ) ) ( not ( = ?auto_63979 ?auto_63981 ) ) ( not ( = ?auto_63980 ?auto_63981 ) ) ( not ( = ?auto_63978 ?auto_63983 ) ) ( not ( = ?auto_63978 ?auto_63984 ) ) ( not ( = ?auto_63979 ?auto_63983 ) ) ( not ( = ?auto_63979 ?auto_63984 ) ) ( not ( = ?auto_63980 ?auto_63983 ) ) ( not ( = ?auto_63980 ?auto_63984 ) ) ( not ( = ?auto_63981 ?auto_63983 ) ) ( not ( = ?auto_63981 ?auto_63984 ) ) ( not ( = ?auto_63983 ?auto_63984 ) ) ( ON ?auto_63984 ?auto_63982 ) ( not ( = ?auto_63978 ?auto_63982 ) ) ( not ( = ?auto_63979 ?auto_63982 ) ) ( not ( = ?auto_63980 ?auto_63982 ) ) ( not ( = ?auto_63981 ?auto_63982 ) ) ( not ( = ?auto_63983 ?auto_63982 ) ) ( not ( = ?auto_63984 ?auto_63982 ) ) ( ON ?auto_63983 ?auto_63984 ) ( ON-TABLE ?auto_63982 ) ( ON ?auto_63981 ?auto_63983 ) ( CLEAR ?auto_63981 ) ( HOLDING ?auto_63980 ) ( CLEAR ?auto_63979 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63978 ?auto_63979 ?auto_63980 ?auto_63981 )
      ( MAKE-3PILE ?auto_63978 ?auto_63979 ?auto_63980 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63985 - BLOCK
      ?auto_63986 - BLOCK
      ?auto_63987 - BLOCK
    )
    :vars
    (
      ?auto_63990 - BLOCK
      ?auto_63989 - BLOCK
      ?auto_63991 - BLOCK
      ?auto_63988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63985 ) ( ON ?auto_63986 ?auto_63985 ) ( not ( = ?auto_63985 ?auto_63986 ) ) ( not ( = ?auto_63985 ?auto_63987 ) ) ( not ( = ?auto_63985 ?auto_63990 ) ) ( not ( = ?auto_63986 ?auto_63987 ) ) ( not ( = ?auto_63986 ?auto_63990 ) ) ( not ( = ?auto_63987 ?auto_63990 ) ) ( not ( = ?auto_63985 ?auto_63989 ) ) ( not ( = ?auto_63985 ?auto_63991 ) ) ( not ( = ?auto_63986 ?auto_63989 ) ) ( not ( = ?auto_63986 ?auto_63991 ) ) ( not ( = ?auto_63987 ?auto_63989 ) ) ( not ( = ?auto_63987 ?auto_63991 ) ) ( not ( = ?auto_63990 ?auto_63989 ) ) ( not ( = ?auto_63990 ?auto_63991 ) ) ( not ( = ?auto_63989 ?auto_63991 ) ) ( ON ?auto_63991 ?auto_63988 ) ( not ( = ?auto_63985 ?auto_63988 ) ) ( not ( = ?auto_63986 ?auto_63988 ) ) ( not ( = ?auto_63987 ?auto_63988 ) ) ( not ( = ?auto_63990 ?auto_63988 ) ) ( not ( = ?auto_63989 ?auto_63988 ) ) ( not ( = ?auto_63991 ?auto_63988 ) ) ( ON ?auto_63989 ?auto_63991 ) ( ON-TABLE ?auto_63988 ) ( ON ?auto_63990 ?auto_63989 ) ( CLEAR ?auto_63986 ) ( ON ?auto_63987 ?auto_63990 ) ( CLEAR ?auto_63987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63988 ?auto_63991 ?auto_63989 ?auto_63990 )
      ( MAKE-3PILE ?auto_63985 ?auto_63986 ?auto_63987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63992 - BLOCK
      ?auto_63993 - BLOCK
      ?auto_63994 - BLOCK
    )
    :vars
    (
      ?auto_63997 - BLOCK
      ?auto_63996 - BLOCK
      ?auto_63998 - BLOCK
      ?auto_63995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63992 ) ( not ( = ?auto_63992 ?auto_63993 ) ) ( not ( = ?auto_63992 ?auto_63994 ) ) ( not ( = ?auto_63992 ?auto_63997 ) ) ( not ( = ?auto_63993 ?auto_63994 ) ) ( not ( = ?auto_63993 ?auto_63997 ) ) ( not ( = ?auto_63994 ?auto_63997 ) ) ( not ( = ?auto_63992 ?auto_63996 ) ) ( not ( = ?auto_63992 ?auto_63998 ) ) ( not ( = ?auto_63993 ?auto_63996 ) ) ( not ( = ?auto_63993 ?auto_63998 ) ) ( not ( = ?auto_63994 ?auto_63996 ) ) ( not ( = ?auto_63994 ?auto_63998 ) ) ( not ( = ?auto_63997 ?auto_63996 ) ) ( not ( = ?auto_63997 ?auto_63998 ) ) ( not ( = ?auto_63996 ?auto_63998 ) ) ( ON ?auto_63998 ?auto_63995 ) ( not ( = ?auto_63992 ?auto_63995 ) ) ( not ( = ?auto_63993 ?auto_63995 ) ) ( not ( = ?auto_63994 ?auto_63995 ) ) ( not ( = ?auto_63997 ?auto_63995 ) ) ( not ( = ?auto_63996 ?auto_63995 ) ) ( not ( = ?auto_63998 ?auto_63995 ) ) ( ON ?auto_63996 ?auto_63998 ) ( ON-TABLE ?auto_63995 ) ( ON ?auto_63997 ?auto_63996 ) ( ON ?auto_63994 ?auto_63997 ) ( CLEAR ?auto_63994 ) ( HOLDING ?auto_63993 ) ( CLEAR ?auto_63992 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63992 ?auto_63993 )
      ( MAKE-3PILE ?auto_63992 ?auto_63993 ?auto_63994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63999 - BLOCK
      ?auto_64000 - BLOCK
      ?auto_64001 - BLOCK
    )
    :vars
    (
      ?auto_64003 - BLOCK
      ?auto_64002 - BLOCK
      ?auto_64005 - BLOCK
      ?auto_64004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63999 ) ( not ( = ?auto_63999 ?auto_64000 ) ) ( not ( = ?auto_63999 ?auto_64001 ) ) ( not ( = ?auto_63999 ?auto_64003 ) ) ( not ( = ?auto_64000 ?auto_64001 ) ) ( not ( = ?auto_64000 ?auto_64003 ) ) ( not ( = ?auto_64001 ?auto_64003 ) ) ( not ( = ?auto_63999 ?auto_64002 ) ) ( not ( = ?auto_63999 ?auto_64005 ) ) ( not ( = ?auto_64000 ?auto_64002 ) ) ( not ( = ?auto_64000 ?auto_64005 ) ) ( not ( = ?auto_64001 ?auto_64002 ) ) ( not ( = ?auto_64001 ?auto_64005 ) ) ( not ( = ?auto_64003 ?auto_64002 ) ) ( not ( = ?auto_64003 ?auto_64005 ) ) ( not ( = ?auto_64002 ?auto_64005 ) ) ( ON ?auto_64005 ?auto_64004 ) ( not ( = ?auto_63999 ?auto_64004 ) ) ( not ( = ?auto_64000 ?auto_64004 ) ) ( not ( = ?auto_64001 ?auto_64004 ) ) ( not ( = ?auto_64003 ?auto_64004 ) ) ( not ( = ?auto_64002 ?auto_64004 ) ) ( not ( = ?auto_64005 ?auto_64004 ) ) ( ON ?auto_64002 ?auto_64005 ) ( ON-TABLE ?auto_64004 ) ( ON ?auto_64003 ?auto_64002 ) ( ON ?auto_64001 ?auto_64003 ) ( CLEAR ?auto_63999 ) ( ON ?auto_64000 ?auto_64001 ) ( CLEAR ?auto_64000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64004 ?auto_64005 ?auto_64002 ?auto_64003 ?auto_64001 )
      ( MAKE-3PILE ?auto_63999 ?auto_64000 ?auto_64001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64006 - BLOCK
      ?auto_64007 - BLOCK
      ?auto_64008 - BLOCK
    )
    :vars
    (
      ?auto_64012 - BLOCK
      ?auto_64010 - BLOCK
      ?auto_64009 - BLOCK
      ?auto_64011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64006 ?auto_64007 ) ) ( not ( = ?auto_64006 ?auto_64008 ) ) ( not ( = ?auto_64006 ?auto_64012 ) ) ( not ( = ?auto_64007 ?auto_64008 ) ) ( not ( = ?auto_64007 ?auto_64012 ) ) ( not ( = ?auto_64008 ?auto_64012 ) ) ( not ( = ?auto_64006 ?auto_64010 ) ) ( not ( = ?auto_64006 ?auto_64009 ) ) ( not ( = ?auto_64007 ?auto_64010 ) ) ( not ( = ?auto_64007 ?auto_64009 ) ) ( not ( = ?auto_64008 ?auto_64010 ) ) ( not ( = ?auto_64008 ?auto_64009 ) ) ( not ( = ?auto_64012 ?auto_64010 ) ) ( not ( = ?auto_64012 ?auto_64009 ) ) ( not ( = ?auto_64010 ?auto_64009 ) ) ( ON ?auto_64009 ?auto_64011 ) ( not ( = ?auto_64006 ?auto_64011 ) ) ( not ( = ?auto_64007 ?auto_64011 ) ) ( not ( = ?auto_64008 ?auto_64011 ) ) ( not ( = ?auto_64012 ?auto_64011 ) ) ( not ( = ?auto_64010 ?auto_64011 ) ) ( not ( = ?auto_64009 ?auto_64011 ) ) ( ON ?auto_64010 ?auto_64009 ) ( ON-TABLE ?auto_64011 ) ( ON ?auto_64012 ?auto_64010 ) ( ON ?auto_64008 ?auto_64012 ) ( ON ?auto_64007 ?auto_64008 ) ( CLEAR ?auto_64007 ) ( HOLDING ?auto_64006 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64006 )
      ( MAKE-3PILE ?auto_64006 ?auto_64007 ?auto_64008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64013 - BLOCK
      ?auto_64014 - BLOCK
      ?auto_64015 - BLOCK
    )
    :vars
    (
      ?auto_64019 - BLOCK
      ?auto_64016 - BLOCK
      ?auto_64017 - BLOCK
      ?auto_64018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64013 ?auto_64014 ) ) ( not ( = ?auto_64013 ?auto_64015 ) ) ( not ( = ?auto_64013 ?auto_64019 ) ) ( not ( = ?auto_64014 ?auto_64015 ) ) ( not ( = ?auto_64014 ?auto_64019 ) ) ( not ( = ?auto_64015 ?auto_64019 ) ) ( not ( = ?auto_64013 ?auto_64016 ) ) ( not ( = ?auto_64013 ?auto_64017 ) ) ( not ( = ?auto_64014 ?auto_64016 ) ) ( not ( = ?auto_64014 ?auto_64017 ) ) ( not ( = ?auto_64015 ?auto_64016 ) ) ( not ( = ?auto_64015 ?auto_64017 ) ) ( not ( = ?auto_64019 ?auto_64016 ) ) ( not ( = ?auto_64019 ?auto_64017 ) ) ( not ( = ?auto_64016 ?auto_64017 ) ) ( ON ?auto_64017 ?auto_64018 ) ( not ( = ?auto_64013 ?auto_64018 ) ) ( not ( = ?auto_64014 ?auto_64018 ) ) ( not ( = ?auto_64015 ?auto_64018 ) ) ( not ( = ?auto_64019 ?auto_64018 ) ) ( not ( = ?auto_64016 ?auto_64018 ) ) ( not ( = ?auto_64017 ?auto_64018 ) ) ( ON ?auto_64016 ?auto_64017 ) ( ON-TABLE ?auto_64018 ) ( ON ?auto_64019 ?auto_64016 ) ( ON ?auto_64015 ?auto_64019 ) ( ON ?auto_64014 ?auto_64015 ) ( ON ?auto_64013 ?auto_64014 ) ( CLEAR ?auto_64013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64018 ?auto_64017 ?auto_64016 ?auto_64019 ?auto_64015 ?auto_64014 )
      ( MAKE-3PILE ?auto_64013 ?auto_64014 ?auto_64015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64023 - BLOCK
      ?auto_64024 - BLOCK
      ?auto_64025 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64025 ) ( CLEAR ?auto_64024 ) ( ON-TABLE ?auto_64023 ) ( ON ?auto_64024 ?auto_64023 ) ( not ( = ?auto_64023 ?auto_64024 ) ) ( not ( = ?auto_64023 ?auto_64025 ) ) ( not ( = ?auto_64024 ?auto_64025 ) ) )
    :subtasks
    ( ( !STACK ?auto_64025 ?auto_64024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64026 - BLOCK
      ?auto_64027 - BLOCK
      ?auto_64028 - BLOCK
    )
    :vars
    (
      ?auto_64029 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64027 ) ( ON-TABLE ?auto_64026 ) ( ON ?auto_64027 ?auto_64026 ) ( not ( = ?auto_64026 ?auto_64027 ) ) ( not ( = ?auto_64026 ?auto_64028 ) ) ( not ( = ?auto_64027 ?auto_64028 ) ) ( ON ?auto_64028 ?auto_64029 ) ( CLEAR ?auto_64028 ) ( HAND-EMPTY ) ( not ( = ?auto_64026 ?auto_64029 ) ) ( not ( = ?auto_64027 ?auto_64029 ) ) ( not ( = ?auto_64028 ?auto_64029 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64028 ?auto_64029 )
      ( MAKE-3PILE ?auto_64026 ?auto_64027 ?auto_64028 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64030 - BLOCK
      ?auto_64031 - BLOCK
      ?auto_64032 - BLOCK
    )
    :vars
    (
      ?auto_64033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64030 ) ( not ( = ?auto_64030 ?auto_64031 ) ) ( not ( = ?auto_64030 ?auto_64032 ) ) ( not ( = ?auto_64031 ?auto_64032 ) ) ( ON ?auto_64032 ?auto_64033 ) ( CLEAR ?auto_64032 ) ( not ( = ?auto_64030 ?auto_64033 ) ) ( not ( = ?auto_64031 ?auto_64033 ) ) ( not ( = ?auto_64032 ?auto_64033 ) ) ( HOLDING ?auto_64031 ) ( CLEAR ?auto_64030 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64030 ?auto_64031 )
      ( MAKE-3PILE ?auto_64030 ?auto_64031 ?auto_64032 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64034 - BLOCK
      ?auto_64035 - BLOCK
      ?auto_64036 - BLOCK
    )
    :vars
    (
      ?auto_64037 - BLOCK
      ?auto_64039 - BLOCK
      ?auto_64038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64034 ) ( not ( = ?auto_64034 ?auto_64035 ) ) ( not ( = ?auto_64034 ?auto_64036 ) ) ( not ( = ?auto_64035 ?auto_64036 ) ) ( ON ?auto_64036 ?auto_64037 ) ( not ( = ?auto_64034 ?auto_64037 ) ) ( not ( = ?auto_64035 ?auto_64037 ) ) ( not ( = ?auto_64036 ?auto_64037 ) ) ( CLEAR ?auto_64034 ) ( ON ?auto_64035 ?auto_64036 ) ( CLEAR ?auto_64035 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64039 ) ( ON ?auto_64038 ?auto_64039 ) ( ON ?auto_64037 ?auto_64038 ) ( not ( = ?auto_64039 ?auto_64038 ) ) ( not ( = ?auto_64039 ?auto_64037 ) ) ( not ( = ?auto_64039 ?auto_64036 ) ) ( not ( = ?auto_64039 ?auto_64035 ) ) ( not ( = ?auto_64038 ?auto_64037 ) ) ( not ( = ?auto_64038 ?auto_64036 ) ) ( not ( = ?auto_64038 ?auto_64035 ) ) ( not ( = ?auto_64034 ?auto_64039 ) ) ( not ( = ?auto_64034 ?auto_64038 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64039 ?auto_64038 ?auto_64037 ?auto_64036 )
      ( MAKE-3PILE ?auto_64034 ?auto_64035 ?auto_64036 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64040 - BLOCK
      ?auto_64041 - BLOCK
      ?auto_64042 - BLOCK
    )
    :vars
    (
      ?auto_64043 - BLOCK
      ?auto_64044 - BLOCK
      ?auto_64045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64040 ?auto_64041 ) ) ( not ( = ?auto_64040 ?auto_64042 ) ) ( not ( = ?auto_64041 ?auto_64042 ) ) ( ON ?auto_64042 ?auto_64043 ) ( not ( = ?auto_64040 ?auto_64043 ) ) ( not ( = ?auto_64041 ?auto_64043 ) ) ( not ( = ?auto_64042 ?auto_64043 ) ) ( ON ?auto_64041 ?auto_64042 ) ( CLEAR ?auto_64041 ) ( ON-TABLE ?auto_64044 ) ( ON ?auto_64045 ?auto_64044 ) ( ON ?auto_64043 ?auto_64045 ) ( not ( = ?auto_64044 ?auto_64045 ) ) ( not ( = ?auto_64044 ?auto_64043 ) ) ( not ( = ?auto_64044 ?auto_64042 ) ) ( not ( = ?auto_64044 ?auto_64041 ) ) ( not ( = ?auto_64045 ?auto_64043 ) ) ( not ( = ?auto_64045 ?auto_64042 ) ) ( not ( = ?auto_64045 ?auto_64041 ) ) ( not ( = ?auto_64040 ?auto_64044 ) ) ( not ( = ?auto_64040 ?auto_64045 ) ) ( HOLDING ?auto_64040 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64040 )
      ( MAKE-3PILE ?auto_64040 ?auto_64041 ?auto_64042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64046 - BLOCK
      ?auto_64047 - BLOCK
      ?auto_64048 - BLOCK
    )
    :vars
    (
      ?auto_64049 - BLOCK
      ?auto_64050 - BLOCK
      ?auto_64051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64046 ?auto_64047 ) ) ( not ( = ?auto_64046 ?auto_64048 ) ) ( not ( = ?auto_64047 ?auto_64048 ) ) ( ON ?auto_64048 ?auto_64049 ) ( not ( = ?auto_64046 ?auto_64049 ) ) ( not ( = ?auto_64047 ?auto_64049 ) ) ( not ( = ?auto_64048 ?auto_64049 ) ) ( ON ?auto_64047 ?auto_64048 ) ( ON-TABLE ?auto_64050 ) ( ON ?auto_64051 ?auto_64050 ) ( ON ?auto_64049 ?auto_64051 ) ( not ( = ?auto_64050 ?auto_64051 ) ) ( not ( = ?auto_64050 ?auto_64049 ) ) ( not ( = ?auto_64050 ?auto_64048 ) ) ( not ( = ?auto_64050 ?auto_64047 ) ) ( not ( = ?auto_64051 ?auto_64049 ) ) ( not ( = ?auto_64051 ?auto_64048 ) ) ( not ( = ?auto_64051 ?auto_64047 ) ) ( not ( = ?auto_64046 ?auto_64050 ) ) ( not ( = ?auto_64046 ?auto_64051 ) ) ( ON ?auto_64046 ?auto_64047 ) ( CLEAR ?auto_64046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64050 ?auto_64051 ?auto_64049 ?auto_64048 ?auto_64047 )
      ( MAKE-3PILE ?auto_64046 ?auto_64047 ?auto_64048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64052 - BLOCK
      ?auto_64053 - BLOCK
      ?auto_64054 - BLOCK
    )
    :vars
    (
      ?auto_64056 - BLOCK
      ?auto_64055 - BLOCK
      ?auto_64057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64052 ?auto_64053 ) ) ( not ( = ?auto_64052 ?auto_64054 ) ) ( not ( = ?auto_64053 ?auto_64054 ) ) ( ON ?auto_64054 ?auto_64056 ) ( not ( = ?auto_64052 ?auto_64056 ) ) ( not ( = ?auto_64053 ?auto_64056 ) ) ( not ( = ?auto_64054 ?auto_64056 ) ) ( ON ?auto_64053 ?auto_64054 ) ( ON-TABLE ?auto_64055 ) ( ON ?auto_64057 ?auto_64055 ) ( ON ?auto_64056 ?auto_64057 ) ( not ( = ?auto_64055 ?auto_64057 ) ) ( not ( = ?auto_64055 ?auto_64056 ) ) ( not ( = ?auto_64055 ?auto_64054 ) ) ( not ( = ?auto_64055 ?auto_64053 ) ) ( not ( = ?auto_64057 ?auto_64056 ) ) ( not ( = ?auto_64057 ?auto_64054 ) ) ( not ( = ?auto_64057 ?auto_64053 ) ) ( not ( = ?auto_64052 ?auto_64055 ) ) ( not ( = ?auto_64052 ?auto_64057 ) ) ( HOLDING ?auto_64052 ) ( CLEAR ?auto_64053 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64055 ?auto_64057 ?auto_64056 ?auto_64054 ?auto_64053 ?auto_64052 )
      ( MAKE-3PILE ?auto_64052 ?auto_64053 ?auto_64054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64058 - BLOCK
      ?auto_64059 - BLOCK
      ?auto_64060 - BLOCK
    )
    :vars
    (
      ?auto_64063 - BLOCK
      ?auto_64062 - BLOCK
      ?auto_64061 - BLOCK
      ?auto_64064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64058 ?auto_64059 ) ) ( not ( = ?auto_64058 ?auto_64060 ) ) ( not ( = ?auto_64059 ?auto_64060 ) ) ( ON ?auto_64060 ?auto_64063 ) ( not ( = ?auto_64058 ?auto_64063 ) ) ( not ( = ?auto_64059 ?auto_64063 ) ) ( not ( = ?auto_64060 ?auto_64063 ) ) ( ON ?auto_64059 ?auto_64060 ) ( ON-TABLE ?auto_64062 ) ( ON ?auto_64061 ?auto_64062 ) ( ON ?auto_64063 ?auto_64061 ) ( not ( = ?auto_64062 ?auto_64061 ) ) ( not ( = ?auto_64062 ?auto_64063 ) ) ( not ( = ?auto_64062 ?auto_64060 ) ) ( not ( = ?auto_64062 ?auto_64059 ) ) ( not ( = ?auto_64061 ?auto_64063 ) ) ( not ( = ?auto_64061 ?auto_64060 ) ) ( not ( = ?auto_64061 ?auto_64059 ) ) ( not ( = ?auto_64058 ?auto_64062 ) ) ( not ( = ?auto_64058 ?auto_64061 ) ) ( CLEAR ?auto_64059 ) ( ON ?auto_64058 ?auto_64064 ) ( CLEAR ?auto_64058 ) ( HAND-EMPTY ) ( not ( = ?auto_64058 ?auto_64064 ) ) ( not ( = ?auto_64059 ?auto_64064 ) ) ( not ( = ?auto_64060 ?auto_64064 ) ) ( not ( = ?auto_64063 ?auto_64064 ) ) ( not ( = ?auto_64062 ?auto_64064 ) ) ( not ( = ?auto_64061 ?auto_64064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64058 ?auto_64064 )
      ( MAKE-3PILE ?auto_64058 ?auto_64059 ?auto_64060 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64065 - BLOCK
      ?auto_64066 - BLOCK
      ?auto_64067 - BLOCK
    )
    :vars
    (
      ?auto_64071 - BLOCK
      ?auto_64070 - BLOCK
      ?auto_64068 - BLOCK
      ?auto_64069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64065 ?auto_64066 ) ) ( not ( = ?auto_64065 ?auto_64067 ) ) ( not ( = ?auto_64066 ?auto_64067 ) ) ( ON ?auto_64067 ?auto_64071 ) ( not ( = ?auto_64065 ?auto_64071 ) ) ( not ( = ?auto_64066 ?auto_64071 ) ) ( not ( = ?auto_64067 ?auto_64071 ) ) ( ON-TABLE ?auto_64070 ) ( ON ?auto_64068 ?auto_64070 ) ( ON ?auto_64071 ?auto_64068 ) ( not ( = ?auto_64070 ?auto_64068 ) ) ( not ( = ?auto_64070 ?auto_64071 ) ) ( not ( = ?auto_64070 ?auto_64067 ) ) ( not ( = ?auto_64070 ?auto_64066 ) ) ( not ( = ?auto_64068 ?auto_64071 ) ) ( not ( = ?auto_64068 ?auto_64067 ) ) ( not ( = ?auto_64068 ?auto_64066 ) ) ( not ( = ?auto_64065 ?auto_64070 ) ) ( not ( = ?auto_64065 ?auto_64068 ) ) ( ON ?auto_64065 ?auto_64069 ) ( CLEAR ?auto_64065 ) ( not ( = ?auto_64065 ?auto_64069 ) ) ( not ( = ?auto_64066 ?auto_64069 ) ) ( not ( = ?auto_64067 ?auto_64069 ) ) ( not ( = ?auto_64071 ?auto_64069 ) ) ( not ( = ?auto_64070 ?auto_64069 ) ) ( not ( = ?auto_64068 ?auto_64069 ) ) ( HOLDING ?auto_64066 ) ( CLEAR ?auto_64067 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64070 ?auto_64068 ?auto_64071 ?auto_64067 ?auto_64066 )
      ( MAKE-3PILE ?auto_64065 ?auto_64066 ?auto_64067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64072 - BLOCK
      ?auto_64073 - BLOCK
      ?auto_64074 - BLOCK
    )
    :vars
    (
      ?auto_64075 - BLOCK
      ?auto_64078 - BLOCK
      ?auto_64076 - BLOCK
      ?auto_64077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64072 ?auto_64073 ) ) ( not ( = ?auto_64072 ?auto_64074 ) ) ( not ( = ?auto_64073 ?auto_64074 ) ) ( ON ?auto_64074 ?auto_64075 ) ( not ( = ?auto_64072 ?auto_64075 ) ) ( not ( = ?auto_64073 ?auto_64075 ) ) ( not ( = ?auto_64074 ?auto_64075 ) ) ( ON-TABLE ?auto_64078 ) ( ON ?auto_64076 ?auto_64078 ) ( ON ?auto_64075 ?auto_64076 ) ( not ( = ?auto_64078 ?auto_64076 ) ) ( not ( = ?auto_64078 ?auto_64075 ) ) ( not ( = ?auto_64078 ?auto_64074 ) ) ( not ( = ?auto_64078 ?auto_64073 ) ) ( not ( = ?auto_64076 ?auto_64075 ) ) ( not ( = ?auto_64076 ?auto_64074 ) ) ( not ( = ?auto_64076 ?auto_64073 ) ) ( not ( = ?auto_64072 ?auto_64078 ) ) ( not ( = ?auto_64072 ?auto_64076 ) ) ( ON ?auto_64072 ?auto_64077 ) ( not ( = ?auto_64072 ?auto_64077 ) ) ( not ( = ?auto_64073 ?auto_64077 ) ) ( not ( = ?auto_64074 ?auto_64077 ) ) ( not ( = ?auto_64075 ?auto_64077 ) ) ( not ( = ?auto_64078 ?auto_64077 ) ) ( not ( = ?auto_64076 ?auto_64077 ) ) ( CLEAR ?auto_64074 ) ( ON ?auto_64073 ?auto_64072 ) ( CLEAR ?auto_64073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64077 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64077 ?auto_64072 )
      ( MAKE-3PILE ?auto_64072 ?auto_64073 ?auto_64074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64079 - BLOCK
      ?auto_64080 - BLOCK
      ?auto_64081 - BLOCK
    )
    :vars
    (
      ?auto_64084 - BLOCK
      ?auto_64085 - BLOCK
      ?auto_64083 - BLOCK
      ?auto_64082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64079 ?auto_64080 ) ) ( not ( = ?auto_64079 ?auto_64081 ) ) ( not ( = ?auto_64080 ?auto_64081 ) ) ( not ( = ?auto_64079 ?auto_64084 ) ) ( not ( = ?auto_64080 ?auto_64084 ) ) ( not ( = ?auto_64081 ?auto_64084 ) ) ( ON-TABLE ?auto_64085 ) ( ON ?auto_64083 ?auto_64085 ) ( ON ?auto_64084 ?auto_64083 ) ( not ( = ?auto_64085 ?auto_64083 ) ) ( not ( = ?auto_64085 ?auto_64084 ) ) ( not ( = ?auto_64085 ?auto_64081 ) ) ( not ( = ?auto_64085 ?auto_64080 ) ) ( not ( = ?auto_64083 ?auto_64084 ) ) ( not ( = ?auto_64083 ?auto_64081 ) ) ( not ( = ?auto_64083 ?auto_64080 ) ) ( not ( = ?auto_64079 ?auto_64085 ) ) ( not ( = ?auto_64079 ?auto_64083 ) ) ( ON ?auto_64079 ?auto_64082 ) ( not ( = ?auto_64079 ?auto_64082 ) ) ( not ( = ?auto_64080 ?auto_64082 ) ) ( not ( = ?auto_64081 ?auto_64082 ) ) ( not ( = ?auto_64084 ?auto_64082 ) ) ( not ( = ?auto_64085 ?auto_64082 ) ) ( not ( = ?auto_64083 ?auto_64082 ) ) ( ON ?auto_64080 ?auto_64079 ) ( CLEAR ?auto_64080 ) ( ON-TABLE ?auto_64082 ) ( HOLDING ?auto_64081 ) ( CLEAR ?auto_64084 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64085 ?auto_64083 ?auto_64084 ?auto_64081 )
      ( MAKE-3PILE ?auto_64079 ?auto_64080 ?auto_64081 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64086 - BLOCK
      ?auto_64087 - BLOCK
      ?auto_64088 - BLOCK
    )
    :vars
    (
      ?auto_64092 - BLOCK
      ?auto_64091 - BLOCK
      ?auto_64090 - BLOCK
      ?auto_64089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64086 ?auto_64087 ) ) ( not ( = ?auto_64086 ?auto_64088 ) ) ( not ( = ?auto_64087 ?auto_64088 ) ) ( not ( = ?auto_64086 ?auto_64092 ) ) ( not ( = ?auto_64087 ?auto_64092 ) ) ( not ( = ?auto_64088 ?auto_64092 ) ) ( ON-TABLE ?auto_64091 ) ( ON ?auto_64090 ?auto_64091 ) ( ON ?auto_64092 ?auto_64090 ) ( not ( = ?auto_64091 ?auto_64090 ) ) ( not ( = ?auto_64091 ?auto_64092 ) ) ( not ( = ?auto_64091 ?auto_64088 ) ) ( not ( = ?auto_64091 ?auto_64087 ) ) ( not ( = ?auto_64090 ?auto_64092 ) ) ( not ( = ?auto_64090 ?auto_64088 ) ) ( not ( = ?auto_64090 ?auto_64087 ) ) ( not ( = ?auto_64086 ?auto_64091 ) ) ( not ( = ?auto_64086 ?auto_64090 ) ) ( ON ?auto_64086 ?auto_64089 ) ( not ( = ?auto_64086 ?auto_64089 ) ) ( not ( = ?auto_64087 ?auto_64089 ) ) ( not ( = ?auto_64088 ?auto_64089 ) ) ( not ( = ?auto_64092 ?auto_64089 ) ) ( not ( = ?auto_64091 ?auto_64089 ) ) ( not ( = ?auto_64090 ?auto_64089 ) ) ( ON ?auto_64087 ?auto_64086 ) ( ON-TABLE ?auto_64089 ) ( CLEAR ?auto_64092 ) ( ON ?auto_64088 ?auto_64087 ) ( CLEAR ?auto_64088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64089 ?auto_64086 ?auto_64087 )
      ( MAKE-3PILE ?auto_64086 ?auto_64087 ?auto_64088 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64093 - BLOCK
      ?auto_64094 - BLOCK
      ?auto_64095 - BLOCK
    )
    :vars
    (
      ?auto_64099 - BLOCK
      ?auto_64096 - BLOCK
      ?auto_64097 - BLOCK
      ?auto_64098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64093 ?auto_64094 ) ) ( not ( = ?auto_64093 ?auto_64095 ) ) ( not ( = ?auto_64094 ?auto_64095 ) ) ( not ( = ?auto_64093 ?auto_64099 ) ) ( not ( = ?auto_64094 ?auto_64099 ) ) ( not ( = ?auto_64095 ?auto_64099 ) ) ( ON-TABLE ?auto_64096 ) ( ON ?auto_64097 ?auto_64096 ) ( not ( = ?auto_64096 ?auto_64097 ) ) ( not ( = ?auto_64096 ?auto_64099 ) ) ( not ( = ?auto_64096 ?auto_64095 ) ) ( not ( = ?auto_64096 ?auto_64094 ) ) ( not ( = ?auto_64097 ?auto_64099 ) ) ( not ( = ?auto_64097 ?auto_64095 ) ) ( not ( = ?auto_64097 ?auto_64094 ) ) ( not ( = ?auto_64093 ?auto_64096 ) ) ( not ( = ?auto_64093 ?auto_64097 ) ) ( ON ?auto_64093 ?auto_64098 ) ( not ( = ?auto_64093 ?auto_64098 ) ) ( not ( = ?auto_64094 ?auto_64098 ) ) ( not ( = ?auto_64095 ?auto_64098 ) ) ( not ( = ?auto_64099 ?auto_64098 ) ) ( not ( = ?auto_64096 ?auto_64098 ) ) ( not ( = ?auto_64097 ?auto_64098 ) ) ( ON ?auto_64094 ?auto_64093 ) ( ON-TABLE ?auto_64098 ) ( ON ?auto_64095 ?auto_64094 ) ( CLEAR ?auto_64095 ) ( HOLDING ?auto_64099 ) ( CLEAR ?auto_64097 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64096 ?auto_64097 ?auto_64099 )
      ( MAKE-3PILE ?auto_64093 ?auto_64094 ?auto_64095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64100 - BLOCK
      ?auto_64101 - BLOCK
      ?auto_64102 - BLOCK
    )
    :vars
    (
      ?auto_64106 - BLOCK
      ?auto_64105 - BLOCK
      ?auto_64103 - BLOCK
      ?auto_64104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64100 ?auto_64101 ) ) ( not ( = ?auto_64100 ?auto_64102 ) ) ( not ( = ?auto_64101 ?auto_64102 ) ) ( not ( = ?auto_64100 ?auto_64106 ) ) ( not ( = ?auto_64101 ?auto_64106 ) ) ( not ( = ?auto_64102 ?auto_64106 ) ) ( ON-TABLE ?auto_64105 ) ( ON ?auto_64103 ?auto_64105 ) ( not ( = ?auto_64105 ?auto_64103 ) ) ( not ( = ?auto_64105 ?auto_64106 ) ) ( not ( = ?auto_64105 ?auto_64102 ) ) ( not ( = ?auto_64105 ?auto_64101 ) ) ( not ( = ?auto_64103 ?auto_64106 ) ) ( not ( = ?auto_64103 ?auto_64102 ) ) ( not ( = ?auto_64103 ?auto_64101 ) ) ( not ( = ?auto_64100 ?auto_64105 ) ) ( not ( = ?auto_64100 ?auto_64103 ) ) ( ON ?auto_64100 ?auto_64104 ) ( not ( = ?auto_64100 ?auto_64104 ) ) ( not ( = ?auto_64101 ?auto_64104 ) ) ( not ( = ?auto_64102 ?auto_64104 ) ) ( not ( = ?auto_64106 ?auto_64104 ) ) ( not ( = ?auto_64105 ?auto_64104 ) ) ( not ( = ?auto_64103 ?auto_64104 ) ) ( ON ?auto_64101 ?auto_64100 ) ( ON-TABLE ?auto_64104 ) ( ON ?auto_64102 ?auto_64101 ) ( CLEAR ?auto_64103 ) ( ON ?auto_64106 ?auto_64102 ) ( CLEAR ?auto_64106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64104 ?auto_64100 ?auto_64101 ?auto_64102 )
      ( MAKE-3PILE ?auto_64100 ?auto_64101 ?auto_64102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64107 - BLOCK
      ?auto_64108 - BLOCK
      ?auto_64109 - BLOCK
    )
    :vars
    (
      ?auto_64110 - BLOCK
      ?auto_64111 - BLOCK
      ?auto_64113 - BLOCK
      ?auto_64112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64107 ?auto_64108 ) ) ( not ( = ?auto_64107 ?auto_64109 ) ) ( not ( = ?auto_64108 ?auto_64109 ) ) ( not ( = ?auto_64107 ?auto_64110 ) ) ( not ( = ?auto_64108 ?auto_64110 ) ) ( not ( = ?auto_64109 ?auto_64110 ) ) ( ON-TABLE ?auto_64111 ) ( not ( = ?auto_64111 ?auto_64113 ) ) ( not ( = ?auto_64111 ?auto_64110 ) ) ( not ( = ?auto_64111 ?auto_64109 ) ) ( not ( = ?auto_64111 ?auto_64108 ) ) ( not ( = ?auto_64113 ?auto_64110 ) ) ( not ( = ?auto_64113 ?auto_64109 ) ) ( not ( = ?auto_64113 ?auto_64108 ) ) ( not ( = ?auto_64107 ?auto_64111 ) ) ( not ( = ?auto_64107 ?auto_64113 ) ) ( ON ?auto_64107 ?auto_64112 ) ( not ( = ?auto_64107 ?auto_64112 ) ) ( not ( = ?auto_64108 ?auto_64112 ) ) ( not ( = ?auto_64109 ?auto_64112 ) ) ( not ( = ?auto_64110 ?auto_64112 ) ) ( not ( = ?auto_64111 ?auto_64112 ) ) ( not ( = ?auto_64113 ?auto_64112 ) ) ( ON ?auto_64108 ?auto_64107 ) ( ON-TABLE ?auto_64112 ) ( ON ?auto_64109 ?auto_64108 ) ( ON ?auto_64110 ?auto_64109 ) ( CLEAR ?auto_64110 ) ( HOLDING ?auto_64113 ) ( CLEAR ?auto_64111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64111 ?auto_64113 )
      ( MAKE-3PILE ?auto_64107 ?auto_64108 ?auto_64109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64114 - BLOCK
      ?auto_64115 - BLOCK
      ?auto_64116 - BLOCK
    )
    :vars
    (
      ?auto_64118 - BLOCK
      ?auto_64120 - BLOCK
      ?auto_64119 - BLOCK
      ?auto_64117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64114 ?auto_64115 ) ) ( not ( = ?auto_64114 ?auto_64116 ) ) ( not ( = ?auto_64115 ?auto_64116 ) ) ( not ( = ?auto_64114 ?auto_64118 ) ) ( not ( = ?auto_64115 ?auto_64118 ) ) ( not ( = ?auto_64116 ?auto_64118 ) ) ( ON-TABLE ?auto_64120 ) ( not ( = ?auto_64120 ?auto_64119 ) ) ( not ( = ?auto_64120 ?auto_64118 ) ) ( not ( = ?auto_64120 ?auto_64116 ) ) ( not ( = ?auto_64120 ?auto_64115 ) ) ( not ( = ?auto_64119 ?auto_64118 ) ) ( not ( = ?auto_64119 ?auto_64116 ) ) ( not ( = ?auto_64119 ?auto_64115 ) ) ( not ( = ?auto_64114 ?auto_64120 ) ) ( not ( = ?auto_64114 ?auto_64119 ) ) ( ON ?auto_64114 ?auto_64117 ) ( not ( = ?auto_64114 ?auto_64117 ) ) ( not ( = ?auto_64115 ?auto_64117 ) ) ( not ( = ?auto_64116 ?auto_64117 ) ) ( not ( = ?auto_64118 ?auto_64117 ) ) ( not ( = ?auto_64120 ?auto_64117 ) ) ( not ( = ?auto_64119 ?auto_64117 ) ) ( ON ?auto_64115 ?auto_64114 ) ( ON-TABLE ?auto_64117 ) ( ON ?auto_64116 ?auto_64115 ) ( ON ?auto_64118 ?auto_64116 ) ( CLEAR ?auto_64120 ) ( ON ?auto_64119 ?auto_64118 ) ( CLEAR ?auto_64119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64117 ?auto_64114 ?auto_64115 ?auto_64116 ?auto_64118 )
      ( MAKE-3PILE ?auto_64114 ?auto_64115 ?auto_64116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64121 - BLOCK
      ?auto_64122 - BLOCK
      ?auto_64123 - BLOCK
    )
    :vars
    (
      ?auto_64124 - BLOCK
      ?auto_64126 - BLOCK
      ?auto_64127 - BLOCK
      ?auto_64125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64121 ?auto_64122 ) ) ( not ( = ?auto_64121 ?auto_64123 ) ) ( not ( = ?auto_64122 ?auto_64123 ) ) ( not ( = ?auto_64121 ?auto_64124 ) ) ( not ( = ?auto_64122 ?auto_64124 ) ) ( not ( = ?auto_64123 ?auto_64124 ) ) ( not ( = ?auto_64126 ?auto_64127 ) ) ( not ( = ?auto_64126 ?auto_64124 ) ) ( not ( = ?auto_64126 ?auto_64123 ) ) ( not ( = ?auto_64126 ?auto_64122 ) ) ( not ( = ?auto_64127 ?auto_64124 ) ) ( not ( = ?auto_64127 ?auto_64123 ) ) ( not ( = ?auto_64127 ?auto_64122 ) ) ( not ( = ?auto_64121 ?auto_64126 ) ) ( not ( = ?auto_64121 ?auto_64127 ) ) ( ON ?auto_64121 ?auto_64125 ) ( not ( = ?auto_64121 ?auto_64125 ) ) ( not ( = ?auto_64122 ?auto_64125 ) ) ( not ( = ?auto_64123 ?auto_64125 ) ) ( not ( = ?auto_64124 ?auto_64125 ) ) ( not ( = ?auto_64126 ?auto_64125 ) ) ( not ( = ?auto_64127 ?auto_64125 ) ) ( ON ?auto_64122 ?auto_64121 ) ( ON-TABLE ?auto_64125 ) ( ON ?auto_64123 ?auto_64122 ) ( ON ?auto_64124 ?auto_64123 ) ( ON ?auto_64127 ?auto_64124 ) ( CLEAR ?auto_64127 ) ( HOLDING ?auto_64126 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64126 )
      ( MAKE-3PILE ?auto_64121 ?auto_64122 ?auto_64123 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64128 - BLOCK
      ?auto_64129 - BLOCK
      ?auto_64130 - BLOCK
    )
    :vars
    (
      ?auto_64134 - BLOCK
      ?auto_64131 - BLOCK
      ?auto_64133 - BLOCK
      ?auto_64132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64128 ?auto_64129 ) ) ( not ( = ?auto_64128 ?auto_64130 ) ) ( not ( = ?auto_64129 ?auto_64130 ) ) ( not ( = ?auto_64128 ?auto_64134 ) ) ( not ( = ?auto_64129 ?auto_64134 ) ) ( not ( = ?auto_64130 ?auto_64134 ) ) ( not ( = ?auto_64131 ?auto_64133 ) ) ( not ( = ?auto_64131 ?auto_64134 ) ) ( not ( = ?auto_64131 ?auto_64130 ) ) ( not ( = ?auto_64131 ?auto_64129 ) ) ( not ( = ?auto_64133 ?auto_64134 ) ) ( not ( = ?auto_64133 ?auto_64130 ) ) ( not ( = ?auto_64133 ?auto_64129 ) ) ( not ( = ?auto_64128 ?auto_64131 ) ) ( not ( = ?auto_64128 ?auto_64133 ) ) ( ON ?auto_64128 ?auto_64132 ) ( not ( = ?auto_64128 ?auto_64132 ) ) ( not ( = ?auto_64129 ?auto_64132 ) ) ( not ( = ?auto_64130 ?auto_64132 ) ) ( not ( = ?auto_64134 ?auto_64132 ) ) ( not ( = ?auto_64131 ?auto_64132 ) ) ( not ( = ?auto_64133 ?auto_64132 ) ) ( ON ?auto_64129 ?auto_64128 ) ( ON-TABLE ?auto_64132 ) ( ON ?auto_64130 ?auto_64129 ) ( ON ?auto_64134 ?auto_64130 ) ( ON ?auto_64133 ?auto_64134 ) ( ON ?auto_64131 ?auto_64133 ) ( CLEAR ?auto_64131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64132 ?auto_64128 ?auto_64129 ?auto_64130 ?auto_64134 ?auto_64133 )
      ( MAKE-3PILE ?auto_64128 ?auto_64129 ?auto_64130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64137 - BLOCK
      ?auto_64138 - BLOCK
    )
    :vars
    (
      ?auto_64139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64139 ?auto_64138 ) ( CLEAR ?auto_64139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64137 ) ( ON ?auto_64138 ?auto_64137 ) ( not ( = ?auto_64137 ?auto_64138 ) ) ( not ( = ?auto_64137 ?auto_64139 ) ) ( not ( = ?auto_64138 ?auto_64139 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64139 ?auto_64138 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64140 - BLOCK
      ?auto_64141 - BLOCK
    )
    :vars
    (
      ?auto_64142 - BLOCK
      ?auto_64143 - BLOCK
      ?auto_64144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64142 ?auto_64141 ) ( CLEAR ?auto_64142 ) ( ON-TABLE ?auto_64140 ) ( ON ?auto_64141 ?auto_64140 ) ( not ( = ?auto_64140 ?auto_64141 ) ) ( not ( = ?auto_64140 ?auto_64142 ) ) ( not ( = ?auto_64141 ?auto_64142 ) ) ( HOLDING ?auto_64143 ) ( CLEAR ?auto_64144 ) ( not ( = ?auto_64140 ?auto_64143 ) ) ( not ( = ?auto_64140 ?auto_64144 ) ) ( not ( = ?auto_64141 ?auto_64143 ) ) ( not ( = ?auto_64141 ?auto_64144 ) ) ( not ( = ?auto_64142 ?auto_64143 ) ) ( not ( = ?auto_64142 ?auto_64144 ) ) ( not ( = ?auto_64143 ?auto_64144 ) ) )
    :subtasks
    ( ( !STACK ?auto_64143 ?auto_64144 )
      ( MAKE-2PILE ?auto_64140 ?auto_64141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64145 - BLOCK
      ?auto_64146 - BLOCK
    )
    :vars
    (
      ?auto_64148 - BLOCK
      ?auto_64149 - BLOCK
      ?auto_64147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64148 ?auto_64146 ) ( ON-TABLE ?auto_64145 ) ( ON ?auto_64146 ?auto_64145 ) ( not ( = ?auto_64145 ?auto_64146 ) ) ( not ( = ?auto_64145 ?auto_64148 ) ) ( not ( = ?auto_64146 ?auto_64148 ) ) ( CLEAR ?auto_64149 ) ( not ( = ?auto_64145 ?auto_64147 ) ) ( not ( = ?auto_64145 ?auto_64149 ) ) ( not ( = ?auto_64146 ?auto_64147 ) ) ( not ( = ?auto_64146 ?auto_64149 ) ) ( not ( = ?auto_64148 ?auto_64147 ) ) ( not ( = ?auto_64148 ?auto_64149 ) ) ( not ( = ?auto_64147 ?auto_64149 ) ) ( ON ?auto_64147 ?auto_64148 ) ( CLEAR ?auto_64147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64145 ?auto_64146 ?auto_64148 )
      ( MAKE-2PILE ?auto_64145 ?auto_64146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64150 - BLOCK
      ?auto_64151 - BLOCK
    )
    :vars
    (
      ?auto_64153 - BLOCK
      ?auto_64152 - BLOCK
      ?auto_64154 - BLOCK
      ?auto_64155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64153 ?auto_64151 ) ( ON-TABLE ?auto_64150 ) ( ON ?auto_64151 ?auto_64150 ) ( not ( = ?auto_64150 ?auto_64151 ) ) ( not ( = ?auto_64150 ?auto_64153 ) ) ( not ( = ?auto_64151 ?auto_64153 ) ) ( not ( = ?auto_64150 ?auto_64152 ) ) ( not ( = ?auto_64150 ?auto_64154 ) ) ( not ( = ?auto_64151 ?auto_64152 ) ) ( not ( = ?auto_64151 ?auto_64154 ) ) ( not ( = ?auto_64153 ?auto_64152 ) ) ( not ( = ?auto_64153 ?auto_64154 ) ) ( not ( = ?auto_64152 ?auto_64154 ) ) ( ON ?auto_64152 ?auto_64153 ) ( CLEAR ?auto_64152 ) ( HOLDING ?auto_64154 ) ( CLEAR ?auto_64155 ) ( ON-TABLE ?auto_64155 ) ( not ( = ?auto_64155 ?auto_64154 ) ) ( not ( = ?auto_64150 ?auto_64155 ) ) ( not ( = ?auto_64151 ?auto_64155 ) ) ( not ( = ?auto_64153 ?auto_64155 ) ) ( not ( = ?auto_64152 ?auto_64155 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64155 ?auto_64154 )
      ( MAKE-2PILE ?auto_64150 ?auto_64151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64156 - BLOCK
      ?auto_64157 - BLOCK
    )
    :vars
    (
      ?auto_64160 - BLOCK
      ?auto_64161 - BLOCK
      ?auto_64159 - BLOCK
      ?auto_64158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64160 ?auto_64157 ) ( ON-TABLE ?auto_64156 ) ( ON ?auto_64157 ?auto_64156 ) ( not ( = ?auto_64156 ?auto_64157 ) ) ( not ( = ?auto_64156 ?auto_64160 ) ) ( not ( = ?auto_64157 ?auto_64160 ) ) ( not ( = ?auto_64156 ?auto_64161 ) ) ( not ( = ?auto_64156 ?auto_64159 ) ) ( not ( = ?auto_64157 ?auto_64161 ) ) ( not ( = ?auto_64157 ?auto_64159 ) ) ( not ( = ?auto_64160 ?auto_64161 ) ) ( not ( = ?auto_64160 ?auto_64159 ) ) ( not ( = ?auto_64161 ?auto_64159 ) ) ( ON ?auto_64161 ?auto_64160 ) ( CLEAR ?auto_64158 ) ( ON-TABLE ?auto_64158 ) ( not ( = ?auto_64158 ?auto_64159 ) ) ( not ( = ?auto_64156 ?auto_64158 ) ) ( not ( = ?auto_64157 ?auto_64158 ) ) ( not ( = ?auto_64160 ?auto_64158 ) ) ( not ( = ?auto_64161 ?auto_64158 ) ) ( ON ?auto_64159 ?auto_64161 ) ( CLEAR ?auto_64159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64156 ?auto_64157 ?auto_64160 ?auto_64161 )
      ( MAKE-2PILE ?auto_64156 ?auto_64157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64162 - BLOCK
      ?auto_64163 - BLOCK
    )
    :vars
    (
      ?auto_64164 - BLOCK
      ?auto_64165 - BLOCK
      ?auto_64167 - BLOCK
      ?auto_64166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64164 ?auto_64163 ) ( ON-TABLE ?auto_64162 ) ( ON ?auto_64163 ?auto_64162 ) ( not ( = ?auto_64162 ?auto_64163 ) ) ( not ( = ?auto_64162 ?auto_64164 ) ) ( not ( = ?auto_64163 ?auto_64164 ) ) ( not ( = ?auto_64162 ?auto_64165 ) ) ( not ( = ?auto_64162 ?auto_64167 ) ) ( not ( = ?auto_64163 ?auto_64165 ) ) ( not ( = ?auto_64163 ?auto_64167 ) ) ( not ( = ?auto_64164 ?auto_64165 ) ) ( not ( = ?auto_64164 ?auto_64167 ) ) ( not ( = ?auto_64165 ?auto_64167 ) ) ( ON ?auto_64165 ?auto_64164 ) ( not ( = ?auto_64166 ?auto_64167 ) ) ( not ( = ?auto_64162 ?auto_64166 ) ) ( not ( = ?auto_64163 ?auto_64166 ) ) ( not ( = ?auto_64164 ?auto_64166 ) ) ( not ( = ?auto_64165 ?auto_64166 ) ) ( ON ?auto_64167 ?auto_64165 ) ( CLEAR ?auto_64167 ) ( HOLDING ?auto_64166 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64166 )
      ( MAKE-2PILE ?auto_64162 ?auto_64163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64168 - BLOCK
      ?auto_64169 - BLOCK
    )
    :vars
    (
      ?auto_64173 - BLOCK
      ?auto_64170 - BLOCK
      ?auto_64171 - BLOCK
      ?auto_64172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64173 ?auto_64169 ) ( ON-TABLE ?auto_64168 ) ( ON ?auto_64169 ?auto_64168 ) ( not ( = ?auto_64168 ?auto_64169 ) ) ( not ( = ?auto_64168 ?auto_64173 ) ) ( not ( = ?auto_64169 ?auto_64173 ) ) ( not ( = ?auto_64168 ?auto_64170 ) ) ( not ( = ?auto_64168 ?auto_64171 ) ) ( not ( = ?auto_64169 ?auto_64170 ) ) ( not ( = ?auto_64169 ?auto_64171 ) ) ( not ( = ?auto_64173 ?auto_64170 ) ) ( not ( = ?auto_64173 ?auto_64171 ) ) ( not ( = ?auto_64170 ?auto_64171 ) ) ( ON ?auto_64170 ?auto_64173 ) ( not ( = ?auto_64172 ?auto_64171 ) ) ( not ( = ?auto_64168 ?auto_64172 ) ) ( not ( = ?auto_64169 ?auto_64172 ) ) ( not ( = ?auto_64173 ?auto_64172 ) ) ( not ( = ?auto_64170 ?auto_64172 ) ) ( ON ?auto_64171 ?auto_64170 ) ( ON ?auto_64172 ?auto_64171 ) ( CLEAR ?auto_64172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64168 ?auto_64169 ?auto_64173 ?auto_64170 ?auto_64171 )
      ( MAKE-2PILE ?auto_64168 ?auto_64169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64174 - BLOCK
      ?auto_64175 - BLOCK
    )
    :vars
    (
      ?auto_64176 - BLOCK
      ?auto_64177 - BLOCK
      ?auto_64178 - BLOCK
      ?auto_64179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64176 ?auto_64175 ) ( ON-TABLE ?auto_64174 ) ( ON ?auto_64175 ?auto_64174 ) ( not ( = ?auto_64174 ?auto_64175 ) ) ( not ( = ?auto_64174 ?auto_64176 ) ) ( not ( = ?auto_64175 ?auto_64176 ) ) ( not ( = ?auto_64174 ?auto_64177 ) ) ( not ( = ?auto_64174 ?auto_64178 ) ) ( not ( = ?auto_64175 ?auto_64177 ) ) ( not ( = ?auto_64175 ?auto_64178 ) ) ( not ( = ?auto_64176 ?auto_64177 ) ) ( not ( = ?auto_64176 ?auto_64178 ) ) ( not ( = ?auto_64177 ?auto_64178 ) ) ( ON ?auto_64177 ?auto_64176 ) ( not ( = ?auto_64179 ?auto_64178 ) ) ( not ( = ?auto_64174 ?auto_64179 ) ) ( not ( = ?auto_64175 ?auto_64179 ) ) ( not ( = ?auto_64176 ?auto_64179 ) ) ( not ( = ?auto_64177 ?auto_64179 ) ) ( ON ?auto_64178 ?auto_64177 ) ( HOLDING ?auto_64179 ) ( CLEAR ?auto_64178 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64174 ?auto_64175 ?auto_64176 ?auto_64177 ?auto_64178 ?auto_64179 )
      ( MAKE-2PILE ?auto_64174 ?auto_64175 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64180 - BLOCK
      ?auto_64181 - BLOCK
    )
    :vars
    (
      ?auto_64185 - BLOCK
      ?auto_64184 - BLOCK
      ?auto_64183 - BLOCK
      ?auto_64182 - BLOCK
      ?auto_64186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64185 ?auto_64181 ) ( ON-TABLE ?auto_64180 ) ( ON ?auto_64181 ?auto_64180 ) ( not ( = ?auto_64180 ?auto_64181 ) ) ( not ( = ?auto_64180 ?auto_64185 ) ) ( not ( = ?auto_64181 ?auto_64185 ) ) ( not ( = ?auto_64180 ?auto_64184 ) ) ( not ( = ?auto_64180 ?auto_64183 ) ) ( not ( = ?auto_64181 ?auto_64184 ) ) ( not ( = ?auto_64181 ?auto_64183 ) ) ( not ( = ?auto_64185 ?auto_64184 ) ) ( not ( = ?auto_64185 ?auto_64183 ) ) ( not ( = ?auto_64184 ?auto_64183 ) ) ( ON ?auto_64184 ?auto_64185 ) ( not ( = ?auto_64182 ?auto_64183 ) ) ( not ( = ?auto_64180 ?auto_64182 ) ) ( not ( = ?auto_64181 ?auto_64182 ) ) ( not ( = ?auto_64185 ?auto_64182 ) ) ( not ( = ?auto_64184 ?auto_64182 ) ) ( ON ?auto_64183 ?auto_64184 ) ( CLEAR ?auto_64183 ) ( ON ?auto_64182 ?auto_64186 ) ( CLEAR ?auto_64182 ) ( HAND-EMPTY ) ( not ( = ?auto_64180 ?auto_64186 ) ) ( not ( = ?auto_64181 ?auto_64186 ) ) ( not ( = ?auto_64185 ?auto_64186 ) ) ( not ( = ?auto_64184 ?auto_64186 ) ) ( not ( = ?auto_64183 ?auto_64186 ) ) ( not ( = ?auto_64182 ?auto_64186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64182 ?auto_64186 )
      ( MAKE-2PILE ?auto_64180 ?auto_64181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64187 - BLOCK
      ?auto_64188 - BLOCK
    )
    :vars
    (
      ?auto_64190 - BLOCK
      ?auto_64193 - BLOCK
      ?auto_64192 - BLOCK
      ?auto_64191 - BLOCK
      ?auto_64189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64190 ?auto_64188 ) ( ON-TABLE ?auto_64187 ) ( ON ?auto_64188 ?auto_64187 ) ( not ( = ?auto_64187 ?auto_64188 ) ) ( not ( = ?auto_64187 ?auto_64190 ) ) ( not ( = ?auto_64188 ?auto_64190 ) ) ( not ( = ?auto_64187 ?auto_64193 ) ) ( not ( = ?auto_64187 ?auto_64192 ) ) ( not ( = ?auto_64188 ?auto_64193 ) ) ( not ( = ?auto_64188 ?auto_64192 ) ) ( not ( = ?auto_64190 ?auto_64193 ) ) ( not ( = ?auto_64190 ?auto_64192 ) ) ( not ( = ?auto_64193 ?auto_64192 ) ) ( ON ?auto_64193 ?auto_64190 ) ( not ( = ?auto_64191 ?auto_64192 ) ) ( not ( = ?auto_64187 ?auto_64191 ) ) ( not ( = ?auto_64188 ?auto_64191 ) ) ( not ( = ?auto_64190 ?auto_64191 ) ) ( not ( = ?auto_64193 ?auto_64191 ) ) ( ON ?auto_64191 ?auto_64189 ) ( CLEAR ?auto_64191 ) ( not ( = ?auto_64187 ?auto_64189 ) ) ( not ( = ?auto_64188 ?auto_64189 ) ) ( not ( = ?auto_64190 ?auto_64189 ) ) ( not ( = ?auto_64193 ?auto_64189 ) ) ( not ( = ?auto_64192 ?auto_64189 ) ) ( not ( = ?auto_64191 ?auto_64189 ) ) ( HOLDING ?auto_64192 ) ( CLEAR ?auto_64193 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64187 ?auto_64188 ?auto_64190 ?auto_64193 ?auto_64192 )
      ( MAKE-2PILE ?auto_64187 ?auto_64188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64194 - BLOCK
      ?auto_64195 - BLOCK
    )
    :vars
    (
      ?auto_64199 - BLOCK
      ?auto_64198 - BLOCK
      ?auto_64197 - BLOCK
      ?auto_64200 - BLOCK
      ?auto_64196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64199 ?auto_64195 ) ( ON-TABLE ?auto_64194 ) ( ON ?auto_64195 ?auto_64194 ) ( not ( = ?auto_64194 ?auto_64195 ) ) ( not ( = ?auto_64194 ?auto_64199 ) ) ( not ( = ?auto_64195 ?auto_64199 ) ) ( not ( = ?auto_64194 ?auto_64198 ) ) ( not ( = ?auto_64194 ?auto_64197 ) ) ( not ( = ?auto_64195 ?auto_64198 ) ) ( not ( = ?auto_64195 ?auto_64197 ) ) ( not ( = ?auto_64199 ?auto_64198 ) ) ( not ( = ?auto_64199 ?auto_64197 ) ) ( not ( = ?auto_64198 ?auto_64197 ) ) ( ON ?auto_64198 ?auto_64199 ) ( not ( = ?auto_64200 ?auto_64197 ) ) ( not ( = ?auto_64194 ?auto_64200 ) ) ( not ( = ?auto_64195 ?auto_64200 ) ) ( not ( = ?auto_64199 ?auto_64200 ) ) ( not ( = ?auto_64198 ?auto_64200 ) ) ( ON ?auto_64200 ?auto_64196 ) ( not ( = ?auto_64194 ?auto_64196 ) ) ( not ( = ?auto_64195 ?auto_64196 ) ) ( not ( = ?auto_64199 ?auto_64196 ) ) ( not ( = ?auto_64198 ?auto_64196 ) ) ( not ( = ?auto_64197 ?auto_64196 ) ) ( not ( = ?auto_64200 ?auto_64196 ) ) ( CLEAR ?auto_64198 ) ( ON ?auto_64197 ?auto_64200 ) ( CLEAR ?auto_64197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64196 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64196 ?auto_64200 )
      ( MAKE-2PILE ?auto_64194 ?auto_64195 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64201 - BLOCK
      ?auto_64202 - BLOCK
    )
    :vars
    (
      ?auto_64203 - BLOCK
      ?auto_64204 - BLOCK
      ?auto_64205 - BLOCK
      ?auto_64206 - BLOCK
      ?auto_64207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64203 ?auto_64202 ) ( ON-TABLE ?auto_64201 ) ( ON ?auto_64202 ?auto_64201 ) ( not ( = ?auto_64201 ?auto_64202 ) ) ( not ( = ?auto_64201 ?auto_64203 ) ) ( not ( = ?auto_64202 ?auto_64203 ) ) ( not ( = ?auto_64201 ?auto_64204 ) ) ( not ( = ?auto_64201 ?auto_64205 ) ) ( not ( = ?auto_64202 ?auto_64204 ) ) ( not ( = ?auto_64202 ?auto_64205 ) ) ( not ( = ?auto_64203 ?auto_64204 ) ) ( not ( = ?auto_64203 ?auto_64205 ) ) ( not ( = ?auto_64204 ?auto_64205 ) ) ( not ( = ?auto_64206 ?auto_64205 ) ) ( not ( = ?auto_64201 ?auto_64206 ) ) ( not ( = ?auto_64202 ?auto_64206 ) ) ( not ( = ?auto_64203 ?auto_64206 ) ) ( not ( = ?auto_64204 ?auto_64206 ) ) ( ON ?auto_64206 ?auto_64207 ) ( not ( = ?auto_64201 ?auto_64207 ) ) ( not ( = ?auto_64202 ?auto_64207 ) ) ( not ( = ?auto_64203 ?auto_64207 ) ) ( not ( = ?auto_64204 ?auto_64207 ) ) ( not ( = ?auto_64205 ?auto_64207 ) ) ( not ( = ?auto_64206 ?auto_64207 ) ) ( ON ?auto_64205 ?auto_64206 ) ( CLEAR ?auto_64205 ) ( ON-TABLE ?auto_64207 ) ( HOLDING ?auto_64204 ) ( CLEAR ?auto_64203 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64201 ?auto_64202 ?auto_64203 ?auto_64204 )
      ( MAKE-2PILE ?auto_64201 ?auto_64202 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64208 - BLOCK
      ?auto_64209 - BLOCK
    )
    :vars
    (
      ?auto_64213 - BLOCK
      ?auto_64214 - BLOCK
      ?auto_64212 - BLOCK
      ?auto_64210 - BLOCK
      ?auto_64211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64213 ?auto_64209 ) ( ON-TABLE ?auto_64208 ) ( ON ?auto_64209 ?auto_64208 ) ( not ( = ?auto_64208 ?auto_64209 ) ) ( not ( = ?auto_64208 ?auto_64213 ) ) ( not ( = ?auto_64209 ?auto_64213 ) ) ( not ( = ?auto_64208 ?auto_64214 ) ) ( not ( = ?auto_64208 ?auto_64212 ) ) ( not ( = ?auto_64209 ?auto_64214 ) ) ( not ( = ?auto_64209 ?auto_64212 ) ) ( not ( = ?auto_64213 ?auto_64214 ) ) ( not ( = ?auto_64213 ?auto_64212 ) ) ( not ( = ?auto_64214 ?auto_64212 ) ) ( not ( = ?auto_64210 ?auto_64212 ) ) ( not ( = ?auto_64208 ?auto_64210 ) ) ( not ( = ?auto_64209 ?auto_64210 ) ) ( not ( = ?auto_64213 ?auto_64210 ) ) ( not ( = ?auto_64214 ?auto_64210 ) ) ( ON ?auto_64210 ?auto_64211 ) ( not ( = ?auto_64208 ?auto_64211 ) ) ( not ( = ?auto_64209 ?auto_64211 ) ) ( not ( = ?auto_64213 ?auto_64211 ) ) ( not ( = ?auto_64214 ?auto_64211 ) ) ( not ( = ?auto_64212 ?auto_64211 ) ) ( not ( = ?auto_64210 ?auto_64211 ) ) ( ON ?auto_64212 ?auto_64210 ) ( ON-TABLE ?auto_64211 ) ( CLEAR ?auto_64213 ) ( ON ?auto_64214 ?auto_64212 ) ( CLEAR ?auto_64214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64211 ?auto_64210 ?auto_64212 )
      ( MAKE-2PILE ?auto_64208 ?auto_64209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64229 - BLOCK
      ?auto_64230 - BLOCK
    )
    :vars
    (
      ?auto_64233 - BLOCK
      ?auto_64234 - BLOCK
      ?auto_64235 - BLOCK
      ?auto_64231 - BLOCK
      ?auto_64232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64229 ) ( not ( = ?auto_64229 ?auto_64230 ) ) ( not ( = ?auto_64229 ?auto_64233 ) ) ( not ( = ?auto_64230 ?auto_64233 ) ) ( not ( = ?auto_64229 ?auto_64234 ) ) ( not ( = ?auto_64229 ?auto_64235 ) ) ( not ( = ?auto_64230 ?auto_64234 ) ) ( not ( = ?auto_64230 ?auto_64235 ) ) ( not ( = ?auto_64233 ?auto_64234 ) ) ( not ( = ?auto_64233 ?auto_64235 ) ) ( not ( = ?auto_64234 ?auto_64235 ) ) ( not ( = ?auto_64231 ?auto_64235 ) ) ( not ( = ?auto_64229 ?auto_64231 ) ) ( not ( = ?auto_64230 ?auto_64231 ) ) ( not ( = ?auto_64233 ?auto_64231 ) ) ( not ( = ?auto_64234 ?auto_64231 ) ) ( ON ?auto_64231 ?auto_64232 ) ( not ( = ?auto_64229 ?auto_64232 ) ) ( not ( = ?auto_64230 ?auto_64232 ) ) ( not ( = ?auto_64233 ?auto_64232 ) ) ( not ( = ?auto_64234 ?auto_64232 ) ) ( not ( = ?auto_64235 ?auto_64232 ) ) ( not ( = ?auto_64231 ?auto_64232 ) ) ( ON ?auto_64235 ?auto_64231 ) ( ON-TABLE ?auto_64232 ) ( ON ?auto_64234 ?auto_64235 ) ( ON ?auto_64233 ?auto_64234 ) ( CLEAR ?auto_64233 ) ( HOLDING ?auto_64230 ) ( CLEAR ?auto_64229 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64229 ?auto_64230 ?auto_64233 )
      ( MAKE-2PILE ?auto_64229 ?auto_64230 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64236 - BLOCK
      ?auto_64237 - BLOCK
    )
    :vars
    (
      ?auto_64242 - BLOCK
      ?auto_64238 - BLOCK
      ?auto_64239 - BLOCK
      ?auto_64240 - BLOCK
      ?auto_64241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64236 ) ( not ( = ?auto_64236 ?auto_64237 ) ) ( not ( = ?auto_64236 ?auto_64242 ) ) ( not ( = ?auto_64237 ?auto_64242 ) ) ( not ( = ?auto_64236 ?auto_64238 ) ) ( not ( = ?auto_64236 ?auto_64239 ) ) ( not ( = ?auto_64237 ?auto_64238 ) ) ( not ( = ?auto_64237 ?auto_64239 ) ) ( not ( = ?auto_64242 ?auto_64238 ) ) ( not ( = ?auto_64242 ?auto_64239 ) ) ( not ( = ?auto_64238 ?auto_64239 ) ) ( not ( = ?auto_64240 ?auto_64239 ) ) ( not ( = ?auto_64236 ?auto_64240 ) ) ( not ( = ?auto_64237 ?auto_64240 ) ) ( not ( = ?auto_64242 ?auto_64240 ) ) ( not ( = ?auto_64238 ?auto_64240 ) ) ( ON ?auto_64240 ?auto_64241 ) ( not ( = ?auto_64236 ?auto_64241 ) ) ( not ( = ?auto_64237 ?auto_64241 ) ) ( not ( = ?auto_64242 ?auto_64241 ) ) ( not ( = ?auto_64238 ?auto_64241 ) ) ( not ( = ?auto_64239 ?auto_64241 ) ) ( not ( = ?auto_64240 ?auto_64241 ) ) ( ON ?auto_64239 ?auto_64240 ) ( ON-TABLE ?auto_64241 ) ( ON ?auto_64238 ?auto_64239 ) ( ON ?auto_64242 ?auto_64238 ) ( CLEAR ?auto_64236 ) ( ON ?auto_64237 ?auto_64242 ) ( CLEAR ?auto_64237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64241 ?auto_64240 ?auto_64239 ?auto_64238 ?auto_64242 )
      ( MAKE-2PILE ?auto_64236 ?auto_64237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64243 - BLOCK
      ?auto_64244 - BLOCK
    )
    :vars
    (
      ?auto_64247 - BLOCK
      ?auto_64246 - BLOCK
      ?auto_64249 - BLOCK
      ?auto_64248 - BLOCK
      ?auto_64245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64243 ?auto_64244 ) ) ( not ( = ?auto_64243 ?auto_64247 ) ) ( not ( = ?auto_64244 ?auto_64247 ) ) ( not ( = ?auto_64243 ?auto_64246 ) ) ( not ( = ?auto_64243 ?auto_64249 ) ) ( not ( = ?auto_64244 ?auto_64246 ) ) ( not ( = ?auto_64244 ?auto_64249 ) ) ( not ( = ?auto_64247 ?auto_64246 ) ) ( not ( = ?auto_64247 ?auto_64249 ) ) ( not ( = ?auto_64246 ?auto_64249 ) ) ( not ( = ?auto_64248 ?auto_64249 ) ) ( not ( = ?auto_64243 ?auto_64248 ) ) ( not ( = ?auto_64244 ?auto_64248 ) ) ( not ( = ?auto_64247 ?auto_64248 ) ) ( not ( = ?auto_64246 ?auto_64248 ) ) ( ON ?auto_64248 ?auto_64245 ) ( not ( = ?auto_64243 ?auto_64245 ) ) ( not ( = ?auto_64244 ?auto_64245 ) ) ( not ( = ?auto_64247 ?auto_64245 ) ) ( not ( = ?auto_64246 ?auto_64245 ) ) ( not ( = ?auto_64249 ?auto_64245 ) ) ( not ( = ?auto_64248 ?auto_64245 ) ) ( ON ?auto_64249 ?auto_64248 ) ( ON-TABLE ?auto_64245 ) ( ON ?auto_64246 ?auto_64249 ) ( ON ?auto_64247 ?auto_64246 ) ( ON ?auto_64244 ?auto_64247 ) ( CLEAR ?auto_64244 ) ( HOLDING ?auto_64243 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64243 )
      ( MAKE-2PILE ?auto_64243 ?auto_64244 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64250 - BLOCK
      ?auto_64251 - BLOCK
    )
    :vars
    (
      ?auto_64253 - BLOCK
      ?auto_64254 - BLOCK
      ?auto_64256 - BLOCK
      ?auto_64255 - BLOCK
      ?auto_64252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64250 ?auto_64251 ) ) ( not ( = ?auto_64250 ?auto_64253 ) ) ( not ( = ?auto_64251 ?auto_64253 ) ) ( not ( = ?auto_64250 ?auto_64254 ) ) ( not ( = ?auto_64250 ?auto_64256 ) ) ( not ( = ?auto_64251 ?auto_64254 ) ) ( not ( = ?auto_64251 ?auto_64256 ) ) ( not ( = ?auto_64253 ?auto_64254 ) ) ( not ( = ?auto_64253 ?auto_64256 ) ) ( not ( = ?auto_64254 ?auto_64256 ) ) ( not ( = ?auto_64255 ?auto_64256 ) ) ( not ( = ?auto_64250 ?auto_64255 ) ) ( not ( = ?auto_64251 ?auto_64255 ) ) ( not ( = ?auto_64253 ?auto_64255 ) ) ( not ( = ?auto_64254 ?auto_64255 ) ) ( ON ?auto_64255 ?auto_64252 ) ( not ( = ?auto_64250 ?auto_64252 ) ) ( not ( = ?auto_64251 ?auto_64252 ) ) ( not ( = ?auto_64253 ?auto_64252 ) ) ( not ( = ?auto_64254 ?auto_64252 ) ) ( not ( = ?auto_64256 ?auto_64252 ) ) ( not ( = ?auto_64255 ?auto_64252 ) ) ( ON ?auto_64256 ?auto_64255 ) ( ON-TABLE ?auto_64252 ) ( ON ?auto_64254 ?auto_64256 ) ( ON ?auto_64253 ?auto_64254 ) ( ON ?auto_64251 ?auto_64253 ) ( ON ?auto_64250 ?auto_64251 ) ( CLEAR ?auto_64250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64252 ?auto_64255 ?auto_64256 ?auto_64254 ?auto_64253 ?auto_64251 )
      ( MAKE-2PILE ?auto_64250 ?auto_64251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64261 - BLOCK
      ?auto_64262 - BLOCK
      ?auto_64263 - BLOCK
      ?auto_64264 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64264 ) ( CLEAR ?auto_64263 ) ( ON-TABLE ?auto_64261 ) ( ON ?auto_64262 ?auto_64261 ) ( ON ?auto_64263 ?auto_64262 ) ( not ( = ?auto_64261 ?auto_64262 ) ) ( not ( = ?auto_64261 ?auto_64263 ) ) ( not ( = ?auto_64261 ?auto_64264 ) ) ( not ( = ?auto_64262 ?auto_64263 ) ) ( not ( = ?auto_64262 ?auto_64264 ) ) ( not ( = ?auto_64263 ?auto_64264 ) ) )
    :subtasks
    ( ( !STACK ?auto_64264 ?auto_64263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64265 - BLOCK
      ?auto_64266 - BLOCK
      ?auto_64267 - BLOCK
      ?auto_64268 - BLOCK
    )
    :vars
    (
      ?auto_64269 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64267 ) ( ON-TABLE ?auto_64265 ) ( ON ?auto_64266 ?auto_64265 ) ( ON ?auto_64267 ?auto_64266 ) ( not ( = ?auto_64265 ?auto_64266 ) ) ( not ( = ?auto_64265 ?auto_64267 ) ) ( not ( = ?auto_64265 ?auto_64268 ) ) ( not ( = ?auto_64266 ?auto_64267 ) ) ( not ( = ?auto_64266 ?auto_64268 ) ) ( not ( = ?auto_64267 ?auto_64268 ) ) ( ON ?auto_64268 ?auto_64269 ) ( CLEAR ?auto_64268 ) ( HAND-EMPTY ) ( not ( = ?auto_64265 ?auto_64269 ) ) ( not ( = ?auto_64266 ?auto_64269 ) ) ( not ( = ?auto_64267 ?auto_64269 ) ) ( not ( = ?auto_64268 ?auto_64269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64268 ?auto_64269 )
      ( MAKE-4PILE ?auto_64265 ?auto_64266 ?auto_64267 ?auto_64268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64270 - BLOCK
      ?auto_64271 - BLOCK
      ?auto_64272 - BLOCK
      ?auto_64273 - BLOCK
    )
    :vars
    (
      ?auto_64274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64270 ) ( ON ?auto_64271 ?auto_64270 ) ( not ( = ?auto_64270 ?auto_64271 ) ) ( not ( = ?auto_64270 ?auto_64272 ) ) ( not ( = ?auto_64270 ?auto_64273 ) ) ( not ( = ?auto_64271 ?auto_64272 ) ) ( not ( = ?auto_64271 ?auto_64273 ) ) ( not ( = ?auto_64272 ?auto_64273 ) ) ( ON ?auto_64273 ?auto_64274 ) ( CLEAR ?auto_64273 ) ( not ( = ?auto_64270 ?auto_64274 ) ) ( not ( = ?auto_64271 ?auto_64274 ) ) ( not ( = ?auto_64272 ?auto_64274 ) ) ( not ( = ?auto_64273 ?auto_64274 ) ) ( HOLDING ?auto_64272 ) ( CLEAR ?auto_64271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64270 ?auto_64271 ?auto_64272 )
      ( MAKE-4PILE ?auto_64270 ?auto_64271 ?auto_64272 ?auto_64273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64275 - BLOCK
      ?auto_64276 - BLOCK
      ?auto_64277 - BLOCK
      ?auto_64278 - BLOCK
    )
    :vars
    (
      ?auto_64279 - BLOCK
      ?auto_64280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64275 ) ( ON ?auto_64276 ?auto_64275 ) ( not ( = ?auto_64275 ?auto_64276 ) ) ( not ( = ?auto_64275 ?auto_64277 ) ) ( not ( = ?auto_64275 ?auto_64278 ) ) ( not ( = ?auto_64276 ?auto_64277 ) ) ( not ( = ?auto_64276 ?auto_64278 ) ) ( not ( = ?auto_64277 ?auto_64278 ) ) ( ON ?auto_64278 ?auto_64279 ) ( not ( = ?auto_64275 ?auto_64279 ) ) ( not ( = ?auto_64276 ?auto_64279 ) ) ( not ( = ?auto_64277 ?auto_64279 ) ) ( not ( = ?auto_64278 ?auto_64279 ) ) ( CLEAR ?auto_64276 ) ( ON ?auto_64277 ?auto_64278 ) ( CLEAR ?auto_64277 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64280 ) ( ON ?auto_64279 ?auto_64280 ) ( not ( = ?auto_64280 ?auto_64279 ) ) ( not ( = ?auto_64280 ?auto_64278 ) ) ( not ( = ?auto_64280 ?auto_64277 ) ) ( not ( = ?auto_64275 ?auto_64280 ) ) ( not ( = ?auto_64276 ?auto_64280 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64280 ?auto_64279 ?auto_64278 )
      ( MAKE-4PILE ?auto_64275 ?auto_64276 ?auto_64277 ?auto_64278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64281 - BLOCK
      ?auto_64282 - BLOCK
      ?auto_64283 - BLOCK
      ?auto_64284 - BLOCK
    )
    :vars
    (
      ?auto_64286 - BLOCK
      ?auto_64285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64281 ) ( not ( = ?auto_64281 ?auto_64282 ) ) ( not ( = ?auto_64281 ?auto_64283 ) ) ( not ( = ?auto_64281 ?auto_64284 ) ) ( not ( = ?auto_64282 ?auto_64283 ) ) ( not ( = ?auto_64282 ?auto_64284 ) ) ( not ( = ?auto_64283 ?auto_64284 ) ) ( ON ?auto_64284 ?auto_64286 ) ( not ( = ?auto_64281 ?auto_64286 ) ) ( not ( = ?auto_64282 ?auto_64286 ) ) ( not ( = ?auto_64283 ?auto_64286 ) ) ( not ( = ?auto_64284 ?auto_64286 ) ) ( ON ?auto_64283 ?auto_64284 ) ( CLEAR ?auto_64283 ) ( ON-TABLE ?auto_64285 ) ( ON ?auto_64286 ?auto_64285 ) ( not ( = ?auto_64285 ?auto_64286 ) ) ( not ( = ?auto_64285 ?auto_64284 ) ) ( not ( = ?auto_64285 ?auto_64283 ) ) ( not ( = ?auto_64281 ?auto_64285 ) ) ( not ( = ?auto_64282 ?auto_64285 ) ) ( HOLDING ?auto_64282 ) ( CLEAR ?auto_64281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64281 ?auto_64282 )
      ( MAKE-4PILE ?auto_64281 ?auto_64282 ?auto_64283 ?auto_64284 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64287 - BLOCK
      ?auto_64288 - BLOCK
      ?auto_64289 - BLOCK
      ?auto_64290 - BLOCK
    )
    :vars
    (
      ?auto_64291 - BLOCK
      ?auto_64292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64287 ) ( not ( = ?auto_64287 ?auto_64288 ) ) ( not ( = ?auto_64287 ?auto_64289 ) ) ( not ( = ?auto_64287 ?auto_64290 ) ) ( not ( = ?auto_64288 ?auto_64289 ) ) ( not ( = ?auto_64288 ?auto_64290 ) ) ( not ( = ?auto_64289 ?auto_64290 ) ) ( ON ?auto_64290 ?auto_64291 ) ( not ( = ?auto_64287 ?auto_64291 ) ) ( not ( = ?auto_64288 ?auto_64291 ) ) ( not ( = ?auto_64289 ?auto_64291 ) ) ( not ( = ?auto_64290 ?auto_64291 ) ) ( ON ?auto_64289 ?auto_64290 ) ( ON-TABLE ?auto_64292 ) ( ON ?auto_64291 ?auto_64292 ) ( not ( = ?auto_64292 ?auto_64291 ) ) ( not ( = ?auto_64292 ?auto_64290 ) ) ( not ( = ?auto_64292 ?auto_64289 ) ) ( not ( = ?auto_64287 ?auto_64292 ) ) ( not ( = ?auto_64288 ?auto_64292 ) ) ( CLEAR ?auto_64287 ) ( ON ?auto_64288 ?auto_64289 ) ( CLEAR ?auto_64288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64292 ?auto_64291 ?auto_64290 ?auto_64289 )
      ( MAKE-4PILE ?auto_64287 ?auto_64288 ?auto_64289 ?auto_64290 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64293 - BLOCK
      ?auto_64294 - BLOCK
      ?auto_64295 - BLOCK
      ?auto_64296 - BLOCK
    )
    :vars
    (
      ?auto_64297 - BLOCK
      ?auto_64298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64293 ?auto_64294 ) ) ( not ( = ?auto_64293 ?auto_64295 ) ) ( not ( = ?auto_64293 ?auto_64296 ) ) ( not ( = ?auto_64294 ?auto_64295 ) ) ( not ( = ?auto_64294 ?auto_64296 ) ) ( not ( = ?auto_64295 ?auto_64296 ) ) ( ON ?auto_64296 ?auto_64297 ) ( not ( = ?auto_64293 ?auto_64297 ) ) ( not ( = ?auto_64294 ?auto_64297 ) ) ( not ( = ?auto_64295 ?auto_64297 ) ) ( not ( = ?auto_64296 ?auto_64297 ) ) ( ON ?auto_64295 ?auto_64296 ) ( ON-TABLE ?auto_64298 ) ( ON ?auto_64297 ?auto_64298 ) ( not ( = ?auto_64298 ?auto_64297 ) ) ( not ( = ?auto_64298 ?auto_64296 ) ) ( not ( = ?auto_64298 ?auto_64295 ) ) ( not ( = ?auto_64293 ?auto_64298 ) ) ( not ( = ?auto_64294 ?auto_64298 ) ) ( ON ?auto_64294 ?auto_64295 ) ( CLEAR ?auto_64294 ) ( HOLDING ?auto_64293 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64293 )
      ( MAKE-4PILE ?auto_64293 ?auto_64294 ?auto_64295 ?auto_64296 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64299 - BLOCK
      ?auto_64300 - BLOCK
      ?auto_64301 - BLOCK
      ?auto_64302 - BLOCK
    )
    :vars
    (
      ?auto_64303 - BLOCK
      ?auto_64304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64299 ?auto_64300 ) ) ( not ( = ?auto_64299 ?auto_64301 ) ) ( not ( = ?auto_64299 ?auto_64302 ) ) ( not ( = ?auto_64300 ?auto_64301 ) ) ( not ( = ?auto_64300 ?auto_64302 ) ) ( not ( = ?auto_64301 ?auto_64302 ) ) ( ON ?auto_64302 ?auto_64303 ) ( not ( = ?auto_64299 ?auto_64303 ) ) ( not ( = ?auto_64300 ?auto_64303 ) ) ( not ( = ?auto_64301 ?auto_64303 ) ) ( not ( = ?auto_64302 ?auto_64303 ) ) ( ON ?auto_64301 ?auto_64302 ) ( ON-TABLE ?auto_64304 ) ( ON ?auto_64303 ?auto_64304 ) ( not ( = ?auto_64304 ?auto_64303 ) ) ( not ( = ?auto_64304 ?auto_64302 ) ) ( not ( = ?auto_64304 ?auto_64301 ) ) ( not ( = ?auto_64299 ?auto_64304 ) ) ( not ( = ?auto_64300 ?auto_64304 ) ) ( ON ?auto_64300 ?auto_64301 ) ( ON ?auto_64299 ?auto_64300 ) ( CLEAR ?auto_64299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64304 ?auto_64303 ?auto_64302 ?auto_64301 ?auto_64300 )
      ( MAKE-4PILE ?auto_64299 ?auto_64300 ?auto_64301 ?auto_64302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64305 - BLOCK
      ?auto_64306 - BLOCK
      ?auto_64307 - BLOCK
      ?auto_64308 - BLOCK
    )
    :vars
    (
      ?auto_64310 - BLOCK
      ?auto_64309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64305 ?auto_64306 ) ) ( not ( = ?auto_64305 ?auto_64307 ) ) ( not ( = ?auto_64305 ?auto_64308 ) ) ( not ( = ?auto_64306 ?auto_64307 ) ) ( not ( = ?auto_64306 ?auto_64308 ) ) ( not ( = ?auto_64307 ?auto_64308 ) ) ( ON ?auto_64308 ?auto_64310 ) ( not ( = ?auto_64305 ?auto_64310 ) ) ( not ( = ?auto_64306 ?auto_64310 ) ) ( not ( = ?auto_64307 ?auto_64310 ) ) ( not ( = ?auto_64308 ?auto_64310 ) ) ( ON ?auto_64307 ?auto_64308 ) ( ON-TABLE ?auto_64309 ) ( ON ?auto_64310 ?auto_64309 ) ( not ( = ?auto_64309 ?auto_64310 ) ) ( not ( = ?auto_64309 ?auto_64308 ) ) ( not ( = ?auto_64309 ?auto_64307 ) ) ( not ( = ?auto_64305 ?auto_64309 ) ) ( not ( = ?auto_64306 ?auto_64309 ) ) ( ON ?auto_64306 ?auto_64307 ) ( HOLDING ?auto_64305 ) ( CLEAR ?auto_64306 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64309 ?auto_64310 ?auto_64308 ?auto_64307 ?auto_64306 ?auto_64305 )
      ( MAKE-4PILE ?auto_64305 ?auto_64306 ?auto_64307 ?auto_64308 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64311 - BLOCK
      ?auto_64312 - BLOCK
      ?auto_64313 - BLOCK
      ?auto_64314 - BLOCK
    )
    :vars
    (
      ?auto_64316 - BLOCK
      ?auto_64315 - BLOCK
      ?auto_64317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64311 ?auto_64312 ) ) ( not ( = ?auto_64311 ?auto_64313 ) ) ( not ( = ?auto_64311 ?auto_64314 ) ) ( not ( = ?auto_64312 ?auto_64313 ) ) ( not ( = ?auto_64312 ?auto_64314 ) ) ( not ( = ?auto_64313 ?auto_64314 ) ) ( ON ?auto_64314 ?auto_64316 ) ( not ( = ?auto_64311 ?auto_64316 ) ) ( not ( = ?auto_64312 ?auto_64316 ) ) ( not ( = ?auto_64313 ?auto_64316 ) ) ( not ( = ?auto_64314 ?auto_64316 ) ) ( ON ?auto_64313 ?auto_64314 ) ( ON-TABLE ?auto_64315 ) ( ON ?auto_64316 ?auto_64315 ) ( not ( = ?auto_64315 ?auto_64316 ) ) ( not ( = ?auto_64315 ?auto_64314 ) ) ( not ( = ?auto_64315 ?auto_64313 ) ) ( not ( = ?auto_64311 ?auto_64315 ) ) ( not ( = ?auto_64312 ?auto_64315 ) ) ( ON ?auto_64312 ?auto_64313 ) ( CLEAR ?auto_64312 ) ( ON ?auto_64311 ?auto_64317 ) ( CLEAR ?auto_64311 ) ( HAND-EMPTY ) ( not ( = ?auto_64311 ?auto_64317 ) ) ( not ( = ?auto_64312 ?auto_64317 ) ) ( not ( = ?auto_64313 ?auto_64317 ) ) ( not ( = ?auto_64314 ?auto_64317 ) ) ( not ( = ?auto_64316 ?auto_64317 ) ) ( not ( = ?auto_64315 ?auto_64317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64311 ?auto_64317 )
      ( MAKE-4PILE ?auto_64311 ?auto_64312 ?auto_64313 ?auto_64314 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64318 - BLOCK
      ?auto_64319 - BLOCK
      ?auto_64320 - BLOCK
      ?auto_64321 - BLOCK
    )
    :vars
    (
      ?auto_64322 - BLOCK
      ?auto_64323 - BLOCK
      ?auto_64324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64318 ?auto_64319 ) ) ( not ( = ?auto_64318 ?auto_64320 ) ) ( not ( = ?auto_64318 ?auto_64321 ) ) ( not ( = ?auto_64319 ?auto_64320 ) ) ( not ( = ?auto_64319 ?auto_64321 ) ) ( not ( = ?auto_64320 ?auto_64321 ) ) ( ON ?auto_64321 ?auto_64322 ) ( not ( = ?auto_64318 ?auto_64322 ) ) ( not ( = ?auto_64319 ?auto_64322 ) ) ( not ( = ?auto_64320 ?auto_64322 ) ) ( not ( = ?auto_64321 ?auto_64322 ) ) ( ON ?auto_64320 ?auto_64321 ) ( ON-TABLE ?auto_64323 ) ( ON ?auto_64322 ?auto_64323 ) ( not ( = ?auto_64323 ?auto_64322 ) ) ( not ( = ?auto_64323 ?auto_64321 ) ) ( not ( = ?auto_64323 ?auto_64320 ) ) ( not ( = ?auto_64318 ?auto_64323 ) ) ( not ( = ?auto_64319 ?auto_64323 ) ) ( ON ?auto_64318 ?auto_64324 ) ( CLEAR ?auto_64318 ) ( not ( = ?auto_64318 ?auto_64324 ) ) ( not ( = ?auto_64319 ?auto_64324 ) ) ( not ( = ?auto_64320 ?auto_64324 ) ) ( not ( = ?auto_64321 ?auto_64324 ) ) ( not ( = ?auto_64322 ?auto_64324 ) ) ( not ( = ?auto_64323 ?auto_64324 ) ) ( HOLDING ?auto_64319 ) ( CLEAR ?auto_64320 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64323 ?auto_64322 ?auto_64321 ?auto_64320 ?auto_64319 )
      ( MAKE-4PILE ?auto_64318 ?auto_64319 ?auto_64320 ?auto_64321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64325 - BLOCK
      ?auto_64326 - BLOCK
      ?auto_64327 - BLOCK
      ?auto_64328 - BLOCK
    )
    :vars
    (
      ?auto_64331 - BLOCK
      ?auto_64329 - BLOCK
      ?auto_64330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64325 ?auto_64326 ) ) ( not ( = ?auto_64325 ?auto_64327 ) ) ( not ( = ?auto_64325 ?auto_64328 ) ) ( not ( = ?auto_64326 ?auto_64327 ) ) ( not ( = ?auto_64326 ?auto_64328 ) ) ( not ( = ?auto_64327 ?auto_64328 ) ) ( ON ?auto_64328 ?auto_64331 ) ( not ( = ?auto_64325 ?auto_64331 ) ) ( not ( = ?auto_64326 ?auto_64331 ) ) ( not ( = ?auto_64327 ?auto_64331 ) ) ( not ( = ?auto_64328 ?auto_64331 ) ) ( ON ?auto_64327 ?auto_64328 ) ( ON-TABLE ?auto_64329 ) ( ON ?auto_64331 ?auto_64329 ) ( not ( = ?auto_64329 ?auto_64331 ) ) ( not ( = ?auto_64329 ?auto_64328 ) ) ( not ( = ?auto_64329 ?auto_64327 ) ) ( not ( = ?auto_64325 ?auto_64329 ) ) ( not ( = ?auto_64326 ?auto_64329 ) ) ( ON ?auto_64325 ?auto_64330 ) ( not ( = ?auto_64325 ?auto_64330 ) ) ( not ( = ?auto_64326 ?auto_64330 ) ) ( not ( = ?auto_64327 ?auto_64330 ) ) ( not ( = ?auto_64328 ?auto_64330 ) ) ( not ( = ?auto_64331 ?auto_64330 ) ) ( not ( = ?auto_64329 ?auto_64330 ) ) ( CLEAR ?auto_64327 ) ( ON ?auto_64326 ?auto_64325 ) ( CLEAR ?auto_64326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64330 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64330 ?auto_64325 )
      ( MAKE-4PILE ?auto_64325 ?auto_64326 ?auto_64327 ?auto_64328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64332 - BLOCK
      ?auto_64333 - BLOCK
      ?auto_64334 - BLOCK
      ?auto_64335 - BLOCK
    )
    :vars
    (
      ?auto_64338 - BLOCK
      ?auto_64336 - BLOCK
      ?auto_64337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64332 ?auto_64333 ) ) ( not ( = ?auto_64332 ?auto_64334 ) ) ( not ( = ?auto_64332 ?auto_64335 ) ) ( not ( = ?auto_64333 ?auto_64334 ) ) ( not ( = ?auto_64333 ?auto_64335 ) ) ( not ( = ?auto_64334 ?auto_64335 ) ) ( ON ?auto_64335 ?auto_64338 ) ( not ( = ?auto_64332 ?auto_64338 ) ) ( not ( = ?auto_64333 ?auto_64338 ) ) ( not ( = ?auto_64334 ?auto_64338 ) ) ( not ( = ?auto_64335 ?auto_64338 ) ) ( ON-TABLE ?auto_64336 ) ( ON ?auto_64338 ?auto_64336 ) ( not ( = ?auto_64336 ?auto_64338 ) ) ( not ( = ?auto_64336 ?auto_64335 ) ) ( not ( = ?auto_64336 ?auto_64334 ) ) ( not ( = ?auto_64332 ?auto_64336 ) ) ( not ( = ?auto_64333 ?auto_64336 ) ) ( ON ?auto_64332 ?auto_64337 ) ( not ( = ?auto_64332 ?auto_64337 ) ) ( not ( = ?auto_64333 ?auto_64337 ) ) ( not ( = ?auto_64334 ?auto_64337 ) ) ( not ( = ?auto_64335 ?auto_64337 ) ) ( not ( = ?auto_64338 ?auto_64337 ) ) ( not ( = ?auto_64336 ?auto_64337 ) ) ( ON ?auto_64333 ?auto_64332 ) ( CLEAR ?auto_64333 ) ( ON-TABLE ?auto_64337 ) ( HOLDING ?auto_64334 ) ( CLEAR ?auto_64335 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64336 ?auto_64338 ?auto_64335 ?auto_64334 )
      ( MAKE-4PILE ?auto_64332 ?auto_64333 ?auto_64334 ?auto_64335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64339 - BLOCK
      ?auto_64340 - BLOCK
      ?auto_64341 - BLOCK
      ?auto_64342 - BLOCK
    )
    :vars
    (
      ?auto_64343 - BLOCK
      ?auto_64344 - BLOCK
      ?auto_64345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64339 ?auto_64340 ) ) ( not ( = ?auto_64339 ?auto_64341 ) ) ( not ( = ?auto_64339 ?auto_64342 ) ) ( not ( = ?auto_64340 ?auto_64341 ) ) ( not ( = ?auto_64340 ?auto_64342 ) ) ( not ( = ?auto_64341 ?auto_64342 ) ) ( ON ?auto_64342 ?auto_64343 ) ( not ( = ?auto_64339 ?auto_64343 ) ) ( not ( = ?auto_64340 ?auto_64343 ) ) ( not ( = ?auto_64341 ?auto_64343 ) ) ( not ( = ?auto_64342 ?auto_64343 ) ) ( ON-TABLE ?auto_64344 ) ( ON ?auto_64343 ?auto_64344 ) ( not ( = ?auto_64344 ?auto_64343 ) ) ( not ( = ?auto_64344 ?auto_64342 ) ) ( not ( = ?auto_64344 ?auto_64341 ) ) ( not ( = ?auto_64339 ?auto_64344 ) ) ( not ( = ?auto_64340 ?auto_64344 ) ) ( ON ?auto_64339 ?auto_64345 ) ( not ( = ?auto_64339 ?auto_64345 ) ) ( not ( = ?auto_64340 ?auto_64345 ) ) ( not ( = ?auto_64341 ?auto_64345 ) ) ( not ( = ?auto_64342 ?auto_64345 ) ) ( not ( = ?auto_64343 ?auto_64345 ) ) ( not ( = ?auto_64344 ?auto_64345 ) ) ( ON ?auto_64340 ?auto_64339 ) ( ON-TABLE ?auto_64345 ) ( CLEAR ?auto_64342 ) ( ON ?auto_64341 ?auto_64340 ) ( CLEAR ?auto_64341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64345 ?auto_64339 ?auto_64340 )
      ( MAKE-4PILE ?auto_64339 ?auto_64340 ?auto_64341 ?auto_64342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64346 - BLOCK
      ?auto_64347 - BLOCK
      ?auto_64348 - BLOCK
      ?auto_64349 - BLOCK
    )
    :vars
    (
      ?auto_64351 - BLOCK
      ?auto_64350 - BLOCK
      ?auto_64352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64346 ?auto_64347 ) ) ( not ( = ?auto_64346 ?auto_64348 ) ) ( not ( = ?auto_64346 ?auto_64349 ) ) ( not ( = ?auto_64347 ?auto_64348 ) ) ( not ( = ?auto_64347 ?auto_64349 ) ) ( not ( = ?auto_64348 ?auto_64349 ) ) ( not ( = ?auto_64346 ?auto_64351 ) ) ( not ( = ?auto_64347 ?auto_64351 ) ) ( not ( = ?auto_64348 ?auto_64351 ) ) ( not ( = ?auto_64349 ?auto_64351 ) ) ( ON-TABLE ?auto_64350 ) ( ON ?auto_64351 ?auto_64350 ) ( not ( = ?auto_64350 ?auto_64351 ) ) ( not ( = ?auto_64350 ?auto_64349 ) ) ( not ( = ?auto_64350 ?auto_64348 ) ) ( not ( = ?auto_64346 ?auto_64350 ) ) ( not ( = ?auto_64347 ?auto_64350 ) ) ( ON ?auto_64346 ?auto_64352 ) ( not ( = ?auto_64346 ?auto_64352 ) ) ( not ( = ?auto_64347 ?auto_64352 ) ) ( not ( = ?auto_64348 ?auto_64352 ) ) ( not ( = ?auto_64349 ?auto_64352 ) ) ( not ( = ?auto_64351 ?auto_64352 ) ) ( not ( = ?auto_64350 ?auto_64352 ) ) ( ON ?auto_64347 ?auto_64346 ) ( ON-TABLE ?auto_64352 ) ( ON ?auto_64348 ?auto_64347 ) ( CLEAR ?auto_64348 ) ( HOLDING ?auto_64349 ) ( CLEAR ?auto_64351 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64350 ?auto_64351 ?auto_64349 )
      ( MAKE-4PILE ?auto_64346 ?auto_64347 ?auto_64348 ?auto_64349 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64353 - BLOCK
      ?auto_64354 - BLOCK
      ?auto_64355 - BLOCK
      ?auto_64356 - BLOCK
    )
    :vars
    (
      ?auto_64357 - BLOCK
      ?auto_64358 - BLOCK
      ?auto_64359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64353 ?auto_64354 ) ) ( not ( = ?auto_64353 ?auto_64355 ) ) ( not ( = ?auto_64353 ?auto_64356 ) ) ( not ( = ?auto_64354 ?auto_64355 ) ) ( not ( = ?auto_64354 ?auto_64356 ) ) ( not ( = ?auto_64355 ?auto_64356 ) ) ( not ( = ?auto_64353 ?auto_64357 ) ) ( not ( = ?auto_64354 ?auto_64357 ) ) ( not ( = ?auto_64355 ?auto_64357 ) ) ( not ( = ?auto_64356 ?auto_64357 ) ) ( ON-TABLE ?auto_64358 ) ( ON ?auto_64357 ?auto_64358 ) ( not ( = ?auto_64358 ?auto_64357 ) ) ( not ( = ?auto_64358 ?auto_64356 ) ) ( not ( = ?auto_64358 ?auto_64355 ) ) ( not ( = ?auto_64353 ?auto_64358 ) ) ( not ( = ?auto_64354 ?auto_64358 ) ) ( ON ?auto_64353 ?auto_64359 ) ( not ( = ?auto_64353 ?auto_64359 ) ) ( not ( = ?auto_64354 ?auto_64359 ) ) ( not ( = ?auto_64355 ?auto_64359 ) ) ( not ( = ?auto_64356 ?auto_64359 ) ) ( not ( = ?auto_64357 ?auto_64359 ) ) ( not ( = ?auto_64358 ?auto_64359 ) ) ( ON ?auto_64354 ?auto_64353 ) ( ON-TABLE ?auto_64359 ) ( ON ?auto_64355 ?auto_64354 ) ( CLEAR ?auto_64357 ) ( ON ?auto_64356 ?auto_64355 ) ( CLEAR ?auto_64356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64359 ?auto_64353 ?auto_64354 ?auto_64355 )
      ( MAKE-4PILE ?auto_64353 ?auto_64354 ?auto_64355 ?auto_64356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64360 - BLOCK
      ?auto_64361 - BLOCK
      ?auto_64362 - BLOCK
      ?auto_64363 - BLOCK
    )
    :vars
    (
      ?auto_64364 - BLOCK
      ?auto_64365 - BLOCK
      ?auto_64366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64360 ?auto_64361 ) ) ( not ( = ?auto_64360 ?auto_64362 ) ) ( not ( = ?auto_64360 ?auto_64363 ) ) ( not ( = ?auto_64361 ?auto_64362 ) ) ( not ( = ?auto_64361 ?auto_64363 ) ) ( not ( = ?auto_64362 ?auto_64363 ) ) ( not ( = ?auto_64360 ?auto_64364 ) ) ( not ( = ?auto_64361 ?auto_64364 ) ) ( not ( = ?auto_64362 ?auto_64364 ) ) ( not ( = ?auto_64363 ?auto_64364 ) ) ( ON-TABLE ?auto_64365 ) ( not ( = ?auto_64365 ?auto_64364 ) ) ( not ( = ?auto_64365 ?auto_64363 ) ) ( not ( = ?auto_64365 ?auto_64362 ) ) ( not ( = ?auto_64360 ?auto_64365 ) ) ( not ( = ?auto_64361 ?auto_64365 ) ) ( ON ?auto_64360 ?auto_64366 ) ( not ( = ?auto_64360 ?auto_64366 ) ) ( not ( = ?auto_64361 ?auto_64366 ) ) ( not ( = ?auto_64362 ?auto_64366 ) ) ( not ( = ?auto_64363 ?auto_64366 ) ) ( not ( = ?auto_64364 ?auto_64366 ) ) ( not ( = ?auto_64365 ?auto_64366 ) ) ( ON ?auto_64361 ?auto_64360 ) ( ON-TABLE ?auto_64366 ) ( ON ?auto_64362 ?auto_64361 ) ( ON ?auto_64363 ?auto_64362 ) ( CLEAR ?auto_64363 ) ( HOLDING ?auto_64364 ) ( CLEAR ?auto_64365 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64365 ?auto_64364 )
      ( MAKE-4PILE ?auto_64360 ?auto_64361 ?auto_64362 ?auto_64363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64367 - BLOCK
      ?auto_64368 - BLOCK
      ?auto_64369 - BLOCK
      ?auto_64370 - BLOCK
    )
    :vars
    (
      ?auto_64372 - BLOCK
      ?auto_64373 - BLOCK
      ?auto_64371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64367 ?auto_64368 ) ) ( not ( = ?auto_64367 ?auto_64369 ) ) ( not ( = ?auto_64367 ?auto_64370 ) ) ( not ( = ?auto_64368 ?auto_64369 ) ) ( not ( = ?auto_64368 ?auto_64370 ) ) ( not ( = ?auto_64369 ?auto_64370 ) ) ( not ( = ?auto_64367 ?auto_64372 ) ) ( not ( = ?auto_64368 ?auto_64372 ) ) ( not ( = ?auto_64369 ?auto_64372 ) ) ( not ( = ?auto_64370 ?auto_64372 ) ) ( ON-TABLE ?auto_64373 ) ( not ( = ?auto_64373 ?auto_64372 ) ) ( not ( = ?auto_64373 ?auto_64370 ) ) ( not ( = ?auto_64373 ?auto_64369 ) ) ( not ( = ?auto_64367 ?auto_64373 ) ) ( not ( = ?auto_64368 ?auto_64373 ) ) ( ON ?auto_64367 ?auto_64371 ) ( not ( = ?auto_64367 ?auto_64371 ) ) ( not ( = ?auto_64368 ?auto_64371 ) ) ( not ( = ?auto_64369 ?auto_64371 ) ) ( not ( = ?auto_64370 ?auto_64371 ) ) ( not ( = ?auto_64372 ?auto_64371 ) ) ( not ( = ?auto_64373 ?auto_64371 ) ) ( ON ?auto_64368 ?auto_64367 ) ( ON-TABLE ?auto_64371 ) ( ON ?auto_64369 ?auto_64368 ) ( ON ?auto_64370 ?auto_64369 ) ( CLEAR ?auto_64373 ) ( ON ?auto_64372 ?auto_64370 ) ( CLEAR ?auto_64372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64371 ?auto_64367 ?auto_64368 ?auto_64369 ?auto_64370 )
      ( MAKE-4PILE ?auto_64367 ?auto_64368 ?auto_64369 ?auto_64370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64374 - BLOCK
      ?auto_64375 - BLOCK
      ?auto_64376 - BLOCK
      ?auto_64377 - BLOCK
    )
    :vars
    (
      ?auto_64380 - BLOCK
      ?auto_64379 - BLOCK
      ?auto_64378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64374 ?auto_64375 ) ) ( not ( = ?auto_64374 ?auto_64376 ) ) ( not ( = ?auto_64374 ?auto_64377 ) ) ( not ( = ?auto_64375 ?auto_64376 ) ) ( not ( = ?auto_64375 ?auto_64377 ) ) ( not ( = ?auto_64376 ?auto_64377 ) ) ( not ( = ?auto_64374 ?auto_64380 ) ) ( not ( = ?auto_64375 ?auto_64380 ) ) ( not ( = ?auto_64376 ?auto_64380 ) ) ( not ( = ?auto_64377 ?auto_64380 ) ) ( not ( = ?auto_64379 ?auto_64380 ) ) ( not ( = ?auto_64379 ?auto_64377 ) ) ( not ( = ?auto_64379 ?auto_64376 ) ) ( not ( = ?auto_64374 ?auto_64379 ) ) ( not ( = ?auto_64375 ?auto_64379 ) ) ( ON ?auto_64374 ?auto_64378 ) ( not ( = ?auto_64374 ?auto_64378 ) ) ( not ( = ?auto_64375 ?auto_64378 ) ) ( not ( = ?auto_64376 ?auto_64378 ) ) ( not ( = ?auto_64377 ?auto_64378 ) ) ( not ( = ?auto_64380 ?auto_64378 ) ) ( not ( = ?auto_64379 ?auto_64378 ) ) ( ON ?auto_64375 ?auto_64374 ) ( ON-TABLE ?auto_64378 ) ( ON ?auto_64376 ?auto_64375 ) ( ON ?auto_64377 ?auto_64376 ) ( ON ?auto_64380 ?auto_64377 ) ( CLEAR ?auto_64380 ) ( HOLDING ?auto_64379 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64379 )
      ( MAKE-4PILE ?auto_64374 ?auto_64375 ?auto_64376 ?auto_64377 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64381 - BLOCK
      ?auto_64382 - BLOCK
      ?auto_64383 - BLOCK
      ?auto_64384 - BLOCK
    )
    :vars
    (
      ?auto_64385 - BLOCK
      ?auto_64386 - BLOCK
      ?auto_64387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64381 ?auto_64382 ) ) ( not ( = ?auto_64381 ?auto_64383 ) ) ( not ( = ?auto_64381 ?auto_64384 ) ) ( not ( = ?auto_64382 ?auto_64383 ) ) ( not ( = ?auto_64382 ?auto_64384 ) ) ( not ( = ?auto_64383 ?auto_64384 ) ) ( not ( = ?auto_64381 ?auto_64385 ) ) ( not ( = ?auto_64382 ?auto_64385 ) ) ( not ( = ?auto_64383 ?auto_64385 ) ) ( not ( = ?auto_64384 ?auto_64385 ) ) ( not ( = ?auto_64386 ?auto_64385 ) ) ( not ( = ?auto_64386 ?auto_64384 ) ) ( not ( = ?auto_64386 ?auto_64383 ) ) ( not ( = ?auto_64381 ?auto_64386 ) ) ( not ( = ?auto_64382 ?auto_64386 ) ) ( ON ?auto_64381 ?auto_64387 ) ( not ( = ?auto_64381 ?auto_64387 ) ) ( not ( = ?auto_64382 ?auto_64387 ) ) ( not ( = ?auto_64383 ?auto_64387 ) ) ( not ( = ?auto_64384 ?auto_64387 ) ) ( not ( = ?auto_64385 ?auto_64387 ) ) ( not ( = ?auto_64386 ?auto_64387 ) ) ( ON ?auto_64382 ?auto_64381 ) ( ON-TABLE ?auto_64387 ) ( ON ?auto_64383 ?auto_64382 ) ( ON ?auto_64384 ?auto_64383 ) ( ON ?auto_64385 ?auto_64384 ) ( ON ?auto_64386 ?auto_64385 ) ( CLEAR ?auto_64386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64387 ?auto_64381 ?auto_64382 ?auto_64383 ?auto_64384 ?auto_64385 )
      ( MAKE-4PILE ?auto_64381 ?auto_64382 ?auto_64383 ?auto_64384 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64389 - BLOCK
    )
    :vars
    (
      ?auto_64390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64390 ?auto_64389 ) ( CLEAR ?auto_64390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64389 ) ( not ( = ?auto_64389 ?auto_64390 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64390 ?auto_64389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64391 - BLOCK
    )
    :vars
    (
      ?auto_64392 - BLOCK
      ?auto_64393 - BLOCK
      ?auto_64394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64392 ?auto_64391 ) ( CLEAR ?auto_64392 ) ( ON-TABLE ?auto_64391 ) ( not ( = ?auto_64391 ?auto_64392 ) ) ( HOLDING ?auto_64393 ) ( CLEAR ?auto_64394 ) ( not ( = ?auto_64391 ?auto_64393 ) ) ( not ( = ?auto_64391 ?auto_64394 ) ) ( not ( = ?auto_64392 ?auto_64393 ) ) ( not ( = ?auto_64392 ?auto_64394 ) ) ( not ( = ?auto_64393 ?auto_64394 ) ) )
    :subtasks
    ( ( !STACK ?auto_64393 ?auto_64394 )
      ( MAKE-1PILE ?auto_64391 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64395 - BLOCK
    )
    :vars
    (
      ?auto_64397 - BLOCK
      ?auto_64396 - BLOCK
      ?auto_64398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64397 ?auto_64395 ) ( ON-TABLE ?auto_64395 ) ( not ( = ?auto_64395 ?auto_64397 ) ) ( CLEAR ?auto_64396 ) ( not ( = ?auto_64395 ?auto_64398 ) ) ( not ( = ?auto_64395 ?auto_64396 ) ) ( not ( = ?auto_64397 ?auto_64398 ) ) ( not ( = ?auto_64397 ?auto_64396 ) ) ( not ( = ?auto_64398 ?auto_64396 ) ) ( ON ?auto_64398 ?auto_64397 ) ( CLEAR ?auto_64398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64395 ?auto_64397 )
      ( MAKE-1PILE ?auto_64395 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64399 - BLOCK
    )
    :vars
    (
      ?auto_64401 - BLOCK
      ?auto_64402 - BLOCK
      ?auto_64400 - BLOCK
      ?auto_64404 - BLOCK
      ?auto_64403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64401 ?auto_64399 ) ( ON-TABLE ?auto_64399 ) ( not ( = ?auto_64399 ?auto_64401 ) ) ( not ( = ?auto_64399 ?auto_64402 ) ) ( not ( = ?auto_64399 ?auto_64400 ) ) ( not ( = ?auto_64401 ?auto_64402 ) ) ( not ( = ?auto_64401 ?auto_64400 ) ) ( not ( = ?auto_64402 ?auto_64400 ) ) ( ON ?auto_64402 ?auto_64401 ) ( CLEAR ?auto_64402 ) ( HOLDING ?auto_64400 ) ( CLEAR ?auto_64404 ) ( ON-TABLE ?auto_64403 ) ( ON ?auto_64404 ?auto_64403 ) ( not ( = ?auto_64403 ?auto_64404 ) ) ( not ( = ?auto_64403 ?auto_64400 ) ) ( not ( = ?auto_64404 ?auto_64400 ) ) ( not ( = ?auto_64399 ?auto_64404 ) ) ( not ( = ?auto_64399 ?auto_64403 ) ) ( not ( = ?auto_64401 ?auto_64404 ) ) ( not ( = ?auto_64401 ?auto_64403 ) ) ( not ( = ?auto_64402 ?auto_64404 ) ) ( not ( = ?auto_64402 ?auto_64403 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64403 ?auto_64404 ?auto_64400 )
      ( MAKE-1PILE ?auto_64399 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64405 - BLOCK
    )
    :vars
    (
      ?auto_64409 - BLOCK
      ?auto_64408 - BLOCK
      ?auto_64410 - BLOCK
      ?auto_64407 - BLOCK
      ?auto_64406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64409 ?auto_64405 ) ( ON-TABLE ?auto_64405 ) ( not ( = ?auto_64405 ?auto_64409 ) ) ( not ( = ?auto_64405 ?auto_64408 ) ) ( not ( = ?auto_64405 ?auto_64410 ) ) ( not ( = ?auto_64409 ?auto_64408 ) ) ( not ( = ?auto_64409 ?auto_64410 ) ) ( not ( = ?auto_64408 ?auto_64410 ) ) ( ON ?auto_64408 ?auto_64409 ) ( CLEAR ?auto_64407 ) ( ON-TABLE ?auto_64406 ) ( ON ?auto_64407 ?auto_64406 ) ( not ( = ?auto_64406 ?auto_64407 ) ) ( not ( = ?auto_64406 ?auto_64410 ) ) ( not ( = ?auto_64407 ?auto_64410 ) ) ( not ( = ?auto_64405 ?auto_64407 ) ) ( not ( = ?auto_64405 ?auto_64406 ) ) ( not ( = ?auto_64409 ?auto_64407 ) ) ( not ( = ?auto_64409 ?auto_64406 ) ) ( not ( = ?auto_64408 ?auto_64407 ) ) ( not ( = ?auto_64408 ?auto_64406 ) ) ( ON ?auto_64410 ?auto_64408 ) ( CLEAR ?auto_64410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64405 ?auto_64409 ?auto_64408 )
      ( MAKE-1PILE ?auto_64405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64411 - BLOCK
    )
    :vars
    (
      ?auto_64414 - BLOCK
      ?auto_64415 - BLOCK
      ?auto_64412 - BLOCK
      ?auto_64416 - BLOCK
      ?auto_64413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64414 ?auto_64411 ) ( ON-TABLE ?auto_64411 ) ( not ( = ?auto_64411 ?auto_64414 ) ) ( not ( = ?auto_64411 ?auto_64415 ) ) ( not ( = ?auto_64411 ?auto_64412 ) ) ( not ( = ?auto_64414 ?auto_64415 ) ) ( not ( = ?auto_64414 ?auto_64412 ) ) ( not ( = ?auto_64415 ?auto_64412 ) ) ( ON ?auto_64415 ?auto_64414 ) ( ON-TABLE ?auto_64416 ) ( not ( = ?auto_64416 ?auto_64413 ) ) ( not ( = ?auto_64416 ?auto_64412 ) ) ( not ( = ?auto_64413 ?auto_64412 ) ) ( not ( = ?auto_64411 ?auto_64413 ) ) ( not ( = ?auto_64411 ?auto_64416 ) ) ( not ( = ?auto_64414 ?auto_64413 ) ) ( not ( = ?auto_64414 ?auto_64416 ) ) ( not ( = ?auto_64415 ?auto_64413 ) ) ( not ( = ?auto_64415 ?auto_64416 ) ) ( ON ?auto_64412 ?auto_64415 ) ( CLEAR ?auto_64412 ) ( HOLDING ?auto_64413 ) ( CLEAR ?auto_64416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64416 ?auto_64413 )
      ( MAKE-1PILE ?auto_64411 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64417 - BLOCK
    )
    :vars
    (
      ?auto_64418 - BLOCK
      ?auto_64419 - BLOCK
      ?auto_64422 - BLOCK
      ?auto_64420 - BLOCK
      ?auto_64421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64418 ?auto_64417 ) ( ON-TABLE ?auto_64417 ) ( not ( = ?auto_64417 ?auto_64418 ) ) ( not ( = ?auto_64417 ?auto_64419 ) ) ( not ( = ?auto_64417 ?auto_64422 ) ) ( not ( = ?auto_64418 ?auto_64419 ) ) ( not ( = ?auto_64418 ?auto_64422 ) ) ( not ( = ?auto_64419 ?auto_64422 ) ) ( ON ?auto_64419 ?auto_64418 ) ( ON-TABLE ?auto_64420 ) ( not ( = ?auto_64420 ?auto_64421 ) ) ( not ( = ?auto_64420 ?auto_64422 ) ) ( not ( = ?auto_64421 ?auto_64422 ) ) ( not ( = ?auto_64417 ?auto_64421 ) ) ( not ( = ?auto_64417 ?auto_64420 ) ) ( not ( = ?auto_64418 ?auto_64421 ) ) ( not ( = ?auto_64418 ?auto_64420 ) ) ( not ( = ?auto_64419 ?auto_64421 ) ) ( not ( = ?auto_64419 ?auto_64420 ) ) ( ON ?auto_64422 ?auto_64419 ) ( CLEAR ?auto_64420 ) ( ON ?auto_64421 ?auto_64422 ) ( CLEAR ?auto_64421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64417 ?auto_64418 ?auto_64419 ?auto_64422 )
      ( MAKE-1PILE ?auto_64417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64423 - BLOCK
    )
    :vars
    (
      ?auto_64427 - BLOCK
      ?auto_64424 - BLOCK
      ?auto_64426 - BLOCK
      ?auto_64425 - BLOCK
      ?auto_64428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64427 ?auto_64423 ) ( ON-TABLE ?auto_64423 ) ( not ( = ?auto_64423 ?auto_64427 ) ) ( not ( = ?auto_64423 ?auto_64424 ) ) ( not ( = ?auto_64423 ?auto_64426 ) ) ( not ( = ?auto_64427 ?auto_64424 ) ) ( not ( = ?auto_64427 ?auto_64426 ) ) ( not ( = ?auto_64424 ?auto_64426 ) ) ( ON ?auto_64424 ?auto_64427 ) ( not ( = ?auto_64425 ?auto_64428 ) ) ( not ( = ?auto_64425 ?auto_64426 ) ) ( not ( = ?auto_64428 ?auto_64426 ) ) ( not ( = ?auto_64423 ?auto_64428 ) ) ( not ( = ?auto_64423 ?auto_64425 ) ) ( not ( = ?auto_64427 ?auto_64428 ) ) ( not ( = ?auto_64427 ?auto_64425 ) ) ( not ( = ?auto_64424 ?auto_64428 ) ) ( not ( = ?auto_64424 ?auto_64425 ) ) ( ON ?auto_64426 ?auto_64424 ) ( ON ?auto_64428 ?auto_64426 ) ( CLEAR ?auto_64428 ) ( HOLDING ?auto_64425 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64425 )
      ( MAKE-1PILE ?auto_64423 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64429 - BLOCK
    )
    :vars
    (
      ?auto_64432 - BLOCK
      ?auto_64434 - BLOCK
      ?auto_64430 - BLOCK
      ?auto_64431 - BLOCK
      ?auto_64433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64432 ?auto_64429 ) ( ON-TABLE ?auto_64429 ) ( not ( = ?auto_64429 ?auto_64432 ) ) ( not ( = ?auto_64429 ?auto_64434 ) ) ( not ( = ?auto_64429 ?auto_64430 ) ) ( not ( = ?auto_64432 ?auto_64434 ) ) ( not ( = ?auto_64432 ?auto_64430 ) ) ( not ( = ?auto_64434 ?auto_64430 ) ) ( ON ?auto_64434 ?auto_64432 ) ( not ( = ?auto_64431 ?auto_64433 ) ) ( not ( = ?auto_64431 ?auto_64430 ) ) ( not ( = ?auto_64433 ?auto_64430 ) ) ( not ( = ?auto_64429 ?auto_64433 ) ) ( not ( = ?auto_64429 ?auto_64431 ) ) ( not ( = ?auto_64432 ?auto_64433 ) ) ( not ( = ?auto_64432 ?auto_64431 ) ) ( not ( = ?auto_64434 ?auto_64433 ) ) ( not ( = ?auto_64434 ?auto_64431 ) ) ( ON ?auto_64430 ?auto_64434 ) ( ON ?auto_64433 ?auto_64430 ) ( ON ?auto_64431 ?auto_64433 ) ( CLEAR ?auto_64431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64429 ?auto_64432 ?auto_64434 ?auto_64430 ?auto_64433 )
      ( MAKE-1PILE ?auto_64429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64435 - BLOCK
    )
    :vars
    (
      ?auto_64438 - BLOCK
      ?auto_64437 - BLOCK
      ?auto_64436 - BLOCK
      ?auto_64439 - BLOCK
      ?auto_64440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64438 ?auto_64435 ) ( ON-TABLE ?auto_64435 ) ( not ( = ?auto_64435 ?auto_64438 ) ) ( not ( = ?auto_64435 ?auto_64437 ) ) ( not ( = ?auto_64435 ?auto_64436 ) ) ( not ( = ?auto_64438 ?auto_64437 ) ) ( not ( = ?auto_64438 ?auto_64436 ) ) ( not ( = ?auto_64437 ?auto_64436 ) ) ( ON ?auto_64437 ?auto_64438 ) ( not ( = ?auto_64439 ?auto_64440 ) ) ( not ( = ?auto_64439 ?auto_64436 ) ) ( not ( = ?auto_64440 ?auto_64436 ) ) ( not ( = ?auto_64435 ?auto_64440 ) ) ( not ( = ?auto_64435 ?auto_64439 ) ) ( not ( = ?auto_64438 ?auto_64440 ) ) ( not ( = ?auto_64438 ?auto_64439 ) ) ( not ( = ?auto_64437 ?auto_64440 ) ) ( not ( = ?auto_64437 ?auto_64439 ) ) ( ON ?auto_64436 ?auto_64437 ) ( ON ?auto_64440 ?auto_64436 ) ( HOLDING ?auto_64439 ) ( CLEAR ?auto_64440 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64435 ?auto_64438 ?auto_64437 ?auto_64436 ?auto_64440 ?auto_64439 )
      ( MAKE-1PILE ?auto_64435 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64441 - BLOCK
    )
    :vars
    (
      ?auto_64444 - BLOCK
      ?auto_64445 - BLOCK
      ?auto_64446 - BLOCK
      ?auto_64443 - BLOCK
      ?auto_64442 - BLOCK
      ?auto_64447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64444 ?auto_64441 ) ( ON-TABLE ?auto_64441 ) ( not ( = ?auto_64441 ?auto_64444 ) ) ( not ( = ?auto_64441 ?auto_64445 ) ) ( not ( = ?auto_64441 ?auto_64446 ) ) ( not ( = ?auto_64444 ?auto_64445 ) ) ( not ( = ?auto_64444 ?auto_64446 ) ) ( not ( = ?auto_64445 ?auto_64446 ) ) ( ON ?auto_64445 ?auto_64444 ) ( not ( = ?auto_64443 ?auto_64442 ) ) ( not ( = ?auto_64443 ?auto_64446 ) ) ( not ( = ?auto_64442 ?auto_64446 ) ) ( not ( = ?auto_64441 ?auto_64442 ) ) ( not ( = ?auto_64441 ?auto_64443 ) ) ( not ( = ?auto_64444 ?auto_64442 ) ) ( not ( = ?auto_64444 ?auto_64443 ) ) ( not ( = ?auto_64445 ?auto_64442 ) ) ( not ( = ?auto_64445 ?auto_64443 ) ) ( ON ?auto_64446 ?auto_64445 ) ( ON ?auto_64442 ?auto_64446 ) ( CLEAR ?auto_64442 ) ( ON ?auto_64443 ?auto_64447 ) ( CLEAR ?auto_64443 ) ( HAND-EMPTY ) ( not ( = ?auto_64441 ?auto_64447 ) ) ( not ( = ?auto_64444 ?auto_64447 ) ) ( not ( = ?auto_64445 ?auto_64447 ) ) ( not ( = ?auto_64446 ?auto_64447 ) ) ( not ( = ?auto_64443 ?auto_64447 ) ) ( not ( = ?auto_64442 ?auto_64447 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64443 ?auto_64447 )
      ( MAKE-1PILE ?auto_64441 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64448 - BLOCK
    )
    :vars
    (
      ?auto_64451 - BLOCK
      ?auto_64453 - BLOCK
      ?auto_64454 - BLOCK
      ?auto_64452 - BLOCK
      ?auto_64450 - BLOCK
      ?auto_64449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64451 ?auto_64448 ) ( ON-TABLE ?auto_64448 ) ( not ( = ?auto_64448 ?auto_64451 ) ) ( not ( = ?auto_64448 ?auto_64453 ) ) ( not ( = ?auto_64448 ?auto_64454 ) ) ( not ( = ?auto_64451 ?auto_64453 ) ) ( not ( = ?auto_64451 ?auto_64454 ) ) ( not ( = ?auto_64453 ?auto_64454 ) ) ( ON ?auto_64453 ?auto_64451 ) ( not ( = ?auto_64452 ?auto_64450 ) ) ( not ( = ?auto_64452 ?auto_64454 ) ) ( not ( = ?auto_64450 ?auto_64454 ) ) ( not ( = ?auto_64448 ?auto_64450 ) ) ( not ( = ?auto_64448 ?auto_64452 ) ) ( not ( = ?auto_64451 ?auto_64450 ) ) ( not ( = ?auto_64451 ?auto_64452 ) ) ( not ( = ?auto_64453 ?auto_64450 ) ) ( not ( = ?auto_64453 ?auto_64452 ) ) ( ON ?auto_64454 ?auto_64453 ) ( ON ?auto_64452 ?auto_64449 ) ( CLEAR ?auto_64452 ) ( not ( = ?auto_64448 ?auto_64449 ) ) ( not ( = ?auto_64451 ?auto_64449 ) ) ( not ( = ?auto_64453 ?auto_64449 ) ) ( not ( = ?auto_64454 ?auto_64449 ) ) ( not ( = ?auto_64452 ?auto_64449 ) ) ( not ( = ?auto_64450 ?auto_64449 ) ) ( HOLDING ?auto_64450 ) ( CLEAR ?auto_64454 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64448 ?auto_64451 ?auto_64453 ?auto_64454 ?auto_64450 )
      ( MAKE-1PILE ?auto_64448 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64455 - BLOCK
    )
    :vars
    (
      ?auto_64459 - BLOCK
      ?auto_64461 - BLOCK
      ?auto_64458 - BLOCK
      ?auto_64460 - BLOCK
      ?auto_64457 - BLOCK
      ?auto_64456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64459 ?auto_64455 ) ( ON-TABLE ?auto_64455 ) ( not ( = ?auto_64455 ?auto_64459 ) ) ( not ( = ?auto_64455 ?auto_64461 ) ) ( not ( = ?auto_64455 ?auto_64458 ) ) ( not ( = ?auto_64459 ?auto_64461 ) ) ( not ( = ?auto_64459 ?auto_64458 ) ) ( not ( = ?auto_64461 ?auto_64458 ) ) ( ON ?auto_64461 ?auto_64459 ) ( not ( = ?auto_64460 ?auto_64457 ) ) ( not ( = ?auto_64460 ?auto_64458 ) ) ( not ( = ?auto_64457 ?auto_64458 ) ) ( not ( = ?auto_64455 ?auto_64457 ) ) ( not ( = ?auto_64455 ?auto_64460 ) ) ( not ( = ?auto_64459 ?auto_64457 ) ) ( not ( = ?auto_64459 ?auto_64460 ) ) ( not ( = ?auto_64461 ?auto_64457 ) ) ( not ( = ?auto_64461 ?auto_64460 ) ) ( ON ?auto_64458 ?auto_64461 ) ( ON ?auto_64460 ?auto_64456 ) ( not ( = ?auto_64455 ?auto_64456 ) ) ( not ( = ?auto_64459 ?auto_64456 ) ) ( not ( = ?auto_64461 ?auto_64456 ) ) ( not ( = ?auto_64458 ?auto_64456 ) ) ( not ( = ?auto_64460 ?auto_64456 ) ) ( not ( = ?auto_64457 ?auto_64456 ) ) ( CLEAR ?auto_64458 ) ( ON ?auto_64457 ?auto_64460 ) ( CLEAR ?auto_64457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64456 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64456 ?auto_64460 )
      ( MAKE-1PILE ?auto_64455 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64462 - BLOCK
    )
    :vars
    (
      ?auto_64464 - BLOCK
      ?auto_64465 - BLOCK
      ?auto_64468 - BLOCK
      ?auto_64467 - BLOCK
      ?auto_64463 - BLOCK
      ?auto_64466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64464 ?auto_64462 ) ( ON-TABLE ?auto_64462 ) ( not ( = ?auto_64462 ?auto_64464 ) ) ( not ( = ?auto_64462 ?auto_64465 ) ) ( not ( = ?auto_64462 ?auto_64468 ) ) ( not ( = ?auto_64464 ?auto_64465 ) ) ( not ( = ?auto_64464 ?auto_64468 ) ) ( not ( = ?auto_64465 ?auto_64468 ) ) ( ON ?auto_64465 ?auto_64464 ) ( not ( = ?auto_64467 ?auto_64463 ) ) ( not ( = ?auto_64467 ?auto_64468 ) ) ( not ( = ?auto_64463 ?auto_64468 ) ) ( not ( = ?auto_64462 ?auto_64463 ) ) ( not ( = ?auto_64462 ?auto_64467 ) ) ( not ( = ?auto_64464 ?auto_64463 ) ) ( not ( = ?auto_64464 ?auto_64467 ) ) ( not ( = ?auto_64465 ?auto_64463 ) ) ( not ( = ?auto_64465 ?auto_64467 ) ) ( ON ?auto_64467 ?auto_64466 ) ( not ( = ?auto_64462 ?auto_64466 ) ) ( not ( = ?auto_64464 ?auto_64466 ) ) ( not ( = ?auto_64465 ?auto_64466 ) ) ( not ( = ?auto_64468 ?auto_64466 ) ) ( not ( = ?auto_64467 ?auto_64466 ) ) ( not ( = ?auto_64463 ?auto_64466 ) ) ( ON ?auto_64463 ?auto_64467 ) ( CLEAR ?auto_64463 ) ( ON-TABLE ?auto_64466 ) ( HOLDING ?auto_64468 ) ( CLEAR ?auto_64465 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64462 ?auto_64464 ?auto_64465 ?auto_64468 )
      ( MAKE-1PILE ?auto_64462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64469 - BLOCK
    )
    :vars
    (
      ?auto_64475 - BLOCK
      ?auto_64471 - BLOCK
      ?auto_64474 - BLOCK
      ?auto_64473 - BLOCK
      ?auto_64472 - BLOCK
      ?auto_64470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64475 ?auto_64469 ) ( ON-TABLE ?auto_64469 ) ( not ( = ?auto_64469 ?auto_64475 ) ) ( not ( = ?auto_64469 ?auto_64471 ) ) ( not ( = ?auto_64469 ?auto_64474 ) ) ( not ( = ?auto_64475 ?auto_64471 ) ) ( not ( = ?auto_64475 ?auto_64474 ) ) ( not ( = ?auto_64471 ?auto_64474 ) ) ( ON ?auto_64471 ?auto_64475 ) ( not ( = ?auto_64473 ?auto_64472 ) ) ( not ( = ?auto_64473 ?auto_64474 ) ) ( not ( = ?auto_64472 ?auto_64474 ) ) ( not ( = ?auto_64469 ?auto_64472 ) ) ( not ( = ?auto_64469 ?auto_64473 ) ) ( not ( = ?auto_64475 ?auto_64472 ) ) ( not ( = ?auto_64475 ?auto_64473 ) ) ( not ( = ?auto_64471 ?auto_64472 ) ) ( not ( = ?auto_64471 ?auto_64473 ) ) ( ON ?auto_64473 ?auto_64470 ) ( not ( = ?auto_64469 ?auto_64470 ) ) ( not ( = ?auto_64475 ?auto_64470 ) ) ( not ( = ?auto_64471 ?auto_64470 ) ) ( not ( = ?auto_64474 ?auto_64470 ) ) ( not ( = ?auto_64473 ?auto_64470 ) ) ( not ( = ?auto_64472 ?auto_64470 ) ) ( ON ?auto_64472 ?auto_64473 ) ( ON-TABLE ?auto_64470 ) ( CLEAR ?auto_64471 ) ( ON ?auto_64474 ?auto_64472 ) ( CLEAR ?auto_64474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64470 ?auto_64473 ?auto_64472 )
      ( MAKE-1PILE ?auto_64469 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64476 - BLOCK
    )
    :vars
    (
      ?auto_64481 - BLOCK
      ?auto_64482 - BLOCK
      ?auto_64480 - BLOCK
      ?auto_64477 - BLOCK
      ?auto_64479 - BLOCK
      ?auto_64478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64481 ?auto_64476 ) ( ON-TABLE ?auto_64476 ) ( not ( = ?auto_64476 ?auto_64481 ) ) ( not ( = ?auto_64476 ?auto_64482 ) ) ( not ( = ?auto_64476 ?auto_64480 ) ) ( not ( = ?auto_64481 ?auto_64482 ) ) ( not ( = ?auto_64481 ?auto_64480 ) ) ( not ( = ?auto_64482 ?auto_64480 ) ) ( not ( = ?auto_64477 ?auto_64479 ) ) ( not ( = ?auto_64477 ?auto_64480 ) ) ( not ( = ?auto_64479 ?auto_64480 ) ) ( not ( = ?auto_64476 ?auto_64479 ) ) ( not ( = ?auto_64476 ?auto_64477 ) ) ( not ( = ?auto_64481 ?auto_64479 ) ) ( not ( = ?auto_64481 ?auto_64477 ) ) ( not ( = ?auto_64482 ?auto_64479 ) ) ( not ( = ?auto_64482 ?auto_64477 ) ) ( ON ?auto_64477 ?auto_64478 ) ( not ( = ?auto_64476 ?auto_64478 ) ) ( not ( = ?auto_64481 ?auto_64478 ) ) ( not ( = ?auto_64482 ?auto_64478 ) ) ( not ( = ?auto_64480 ?auto_64478 ) ) ( not ( = ?auto_64477 ?auto_64478 ) ) ( not ( = ?auto_64479 ?auto_64478 ) ) ( ON ?auto_64479 ?auto_64477 ) ( ON-TABLE ?auto_64478 ) ( ON ?auto_64480 ?auto_64479 ) ( CLEAR ?auto_64480 ) ( HOLDING ?auto_64482 ) ( CLEAR ?auto_64481 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64476 ?auto_64481 ?auto_64482 )
      ( MAKE-1PILE ?auto_64476 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64483 - BLOCK
    )
    :vars
    (
      ?auto_64488 - BLOCK
      ?auto_64484 - BLOCK
      ?auto_64487 - BLOCK
      ?auto_64489 - BLOCK
      ?auto_64485 - BLOCK
      ?auto_64486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64488 ?auto_64483 ) ( ON-TABLE ?auto_64483 ) ( not ( = ?auto_64483 ?auto_64488 ) ) ( not ( = ?auto_64483 ?auto_64484 ) ) ( not ( = ?auto_64483 ?auto_64487 ) ) ( not ( = ?auto_64488 ?auto_64484 ) ) ( not ( = ?auto_64488 ?auto_64487 ) ) ( not ( = ?auto_64484 ?auto_64487 ) ) ( not ( = ?auto_64489 ?auto_64485 ) ) ( not ( = ?auto_64489 ?auto_64487 ) ) ( not ( = ?auto_64485 ?auto_64487 ) ) ( not ( = ?auto_64483 ?auto_64485 ) ) ( not ( = ?auto_64483 ?auto_64489 ) ) ( not ( = ?auto_64488 ?auto_64485 ) ) ( not ( = ?auto_64488 ?auto_64489 ) ) ( not ( = ?auto_64484 ?auto_64485 ) ) ( not ( = ?auto_64484 ?auto_64489 ) ) ( ON ?auto_64489 ?auto_64486 ) ( not ( = ?auto_64483 ?auto_64486 ) ) ( not ( = ?auto_64488 ?auto_64486 ) ) ( not ( = ?auto_64484 ?auto_64486 ) ) ( not ( = ?auto_64487 ?auto_64486 ) ) ( not ( = ?auto_64489 ?auto_64486 ) ) ( not ( = ?auto_64485 ?auto_64486 ) ) ( ON ?auto_64485 ?auto_64489 ) ( ON-TABLE ?auto_64486 ) ( ON ?auto_64487 ?auto_64485 ) ( CLEAR ?auto_64488 ) ( ON ?auto_64484 ?auto_64487 ) ( CLEAR ?auto_64484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64486 ?auto_64489 ?auto_64485 ?auto_64487 )
      ( MAKE-1PILE ?auto_64483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64504 - BLOCK
    )
    :vars
    (
      ?auto_64506 - BLOCK
      ?auto_64508 - BLOCK
      ?auto_64505 - BLOCK
      ?auto_64507 - BLOCK
      ?auto_64509 - BLOCK
      ?auto_64510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64504 ?auto_64506 ) ) ( not ( = ?auto_64504 ?auto_64508 ) ) ( not ( = ?auto_64504 ?auto_64505 ) ) ( not ( = ?auto_64506 ?auto_64508 ) ) ( not ( = ?auto_64506 ?auto_64505 ) ) ( not ( = ?auto_64508 ?auto_64505 ) ) ( not ( = ?auto_64507 ?auto_64509 ) ) ( not ( = ?auto_64507 ?auto_64505 ) ) ( not ( = ?auto_64509 ?auto_64505 ) ) ( not ( = ?auto_64504 ?auto_64509 ) ) ( not ( = ?auto_64504 ?auto_64507 ) ) ( not ( = ?auto_64506 ?auto_64509 ) ) ( not ( = ?auto_64506 ?auto_64507 ) ) ( not ( = ?auto_64508 ?auto_64509 ) ) ( not ( = ?auto_64508 ?auto_64507 ) ) ( ON ?auto_64507 ?auto_64510 ) ( not ( = ?auto_64504 ?auto_64510 ) ) ( not ( = ?auto_64506 ?auto_64510 ) ) ( not ( = ?auto_64508 ?auto_64510 ) ) ( not ( = ?auto_64505 ?auto_64510 ) ) ( not ( = ?auto_64507 ?auto_64510 ) ) ( not ( = ?auto_64509 ?auto_64510 ) ) ( ON ?auto_64509 ?auto_64507 ) ( ON-TABLE ?auto_64510 ) ( ON ?auto_64505 ?auto_64509 ) ( ON ?auto_64508 ?auto_64505 ) ( ON ?auto_64506 ?auto_64508 ) ( CLEAR ?auto_64506 ) ( HOLDING ?auto_64504 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64504 ?auto_64506 )
      ( MAKE-1PILE ?auto_64504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64511 - BLOCK
    )
    :vars
    (
      ?auto_64513 - BLOCK
      ?auto_64516 - BLOCK
      ?auto_64515 - BLOCK
      ?auto_64512 - BLOCK
      ?auto_64514 - BLOCK
      ?auto_64517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64511 ?auto_64513 ) ) ( not ( = ?auto_64511 ?auto_64516 ) ) ( not ( = ?auto_64511 ?auto_64515 ) ) ( not ( = ?auto_64513 ?auto_64516 ) ) ( not ( = ?auto_64513 ?auto_64515 ) ) ( not ( = ?auto_64516 ?auto_64515 ) ) ( not ( = ?auto_64512 ?auto_64514 ) ) ( not ( = ?auto_64512 ?auto_64515 ) ) ( not ( = ?auto_64514 ?auto_64515 ) ) ( not ( = ?auto_64511 ?auto_64514 ) ) ( not ( = ?auto_64511 ?auto_64512 ) ) ( not ( = ?auto_64513 ?auto_64514 ) ) ( not ( = ?auto_64513 ?auto_64512 ) ) ( not ( = ?auto_64516 ?auto_64514 ) ) ( not ( = ?auto_64516 ?auto_64512 ) ) ( ON ?auto_64512 ?auto_64517 ) ( not ( = ?auto_64511 ?auto_64517 ) ) ( not ( = ?auto_64513 ?auto_64517 ) ) ( not ( = ?auto_64516 ?auto_64517 ) ) ( not ( = ?auto_64515 ?auto_64517 ) ) ( not ( = ?auto_64512 ?auto_64517 ) ) ( not ( = ?auto_64514 ?auto_64517 ) ) ( ON ?auto_64514 ?auto_64512 ) ( ON-TABLE ?auto_64517 ) ( ON ?auto_64515 ?auto_64514 ) ( ON ?auto_64516 ?auto_64515 ) ( ON ?auto_64513 ?auto_64516 ) ( ON ?auto_64511 ?auto_64513 ) ( CLEAR ?auto_64511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64517 ?auto_64512 ?auto_64514 ?auto_64515 ?auto_64516 ?auto_64513 )
      ( MAKE-1PILE ?auto_64511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64523 - BLOCK
      ?auto_64524 - BLOCK
      ?auto_64525 - BLOCK
      ?auto_64526 - BLOCK
      ?auto_64527 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64527 ) ( CLEAR ?auto_64526 ) ( ON-TABLE ?auto_64523 ) ( ON ?auto_64524 ?auto_64523 ) ( ON ?auto_64525 ?auto_64524 ) ( ON ?auto_64526 ?auto_64525 ) ( not ( = ?auto_64523 ?auto_64524 ) ) ( not ( = ?auto_64523 ?auto_64525 ) ) ( not ( = ?auto_64523 ?auto_64526 ) ) ( not ( = ?auto_64523 ?auto_64527 ) ) ( not ( = ?auto_64524 ?auto_64525 ) ) ( not ( = ?auto_64524 ?auto_64526 ) ) ( not ( = ?auto_64524 ?auto_64527 ) ) ( not ( = ?auto_64525 ?auto_64526 ) ) ( not ( = ?auto_64525 ?auto_64527 ) ) ( not ( = ?auto_64526 ?auto_64527 ) ) )
    :subtasks
    ( ( !STACK ?auto_64527 ?auto_64526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64528 - BLOCK
      ?auto_64529 - BLOCK
      ?auto_64530 - BLOCK
      ?auto_64531 - BLOCK
      ?auto_64532 - BLOCK
    )
    :vars
    (
      ?auto_64533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64531 ) ( ON-TABLE ?auto_64528 ) ( ON ?auto_64529 ?auto_64528 ) ( ON ?auto_64530 ?auto_64529 ) ( ON ?auto_64531 ?auto_64530 ) ( not ( = ?auto_64528 ?auto_64529 ) ) ( not ( = ?auto_64528 ?auto_64530 ) ) ( not ( = ?auto_64528 ?auto_64531 ) ) ( not ( = ?auto_64528 ?auto_64532 ) ) ( not ( = ?auto_64529 ?auto_64530 ) ) ( not ( = ?auto_64529 ?auto_64531 ) ) ( not ( = ?auto_64529 ?auto_64532 ) ) ( not ( = ?auto_64530 ?auto_64531 ) ) ( not ( = ?auto_64530 ?auto_64532 ) ) ( not ( = ?auto_64531 ?auto_64532 ) ) ( ON ?auto_64532 ?auto_64533 ) ( CLEAR ?auto_64532 ) ( HAND-EMPTY ) ( not ( = ?auto_64528 ?auto_64533 ) ) ( not ( = ?auto_64529 ?auto_64533 ) ) ( not ( = ?auto_64530 ?auto_64533 ) ) ( not ( = ?auto_64531 ?auto_64533 ) ) ( not ( = ?auto_64532 ?auto_64533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64532 ?auto_64533 )
      ( MAKE-5PILE ?auto_64528 ?auto_64529 ?auto_64530 ?auto_64531 ?auto_64532 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64534 - BLOCK
      ?auto_64535 - BLOCK
      ?auto_64536 - BLOCK
      ?auto_64537 - BLOCK
      ?auto_64538 - BLOCK
    )
    :vars
    (
      ?auto_64539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64534 ) ( ON ?auto_64535 ?auto_64534 ) ( ON ?auto_64536 ?auto_64535 ) ( not ( = ?auto_64534 ?auto_64535 ) ) ( not ( = ?auto_64534 ?auto_64536 ) ) ( not ( = ?auto_64534 ?auto_64537 ) ) ( not ( = ?auto_64534 ?auto_64538 ) ) ( not ( = ?auto_64535 ?auto_64536 ) ) ( not ( = ?auto_64535 ?auto_64537 ) ) ( not ( = ?auto_64535 ?auto_64538 ) ) ( not ( = ?auto_64536 ?auto_64537 ) ) ( not ( = ?auto_64536 ?auto_64538 ) ) ( not ( = ?auto_64537 ?auto_64538 ) ) ( ON ?auto_64538 ?auto_64539 ) ( CLEAR ?auto_64538 ) ( not ( = ?auto_64534 ?auto_64539 ) ) ( not ( = ?auto_64535 ?auto_64539 ) ) ( not ( = ?auto_64536 ?auto_64539 ) ) ( not ( = ?auto_64537 ?auto_64539 ) ) ( not ( = ?auto_64538 ?auto_64539 ) ) ( HOLDING ?auto_64537 ) ( CLEAR ?auto_64536 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64534 ?auto_64535 ?auto_64536 ?auto_64537 )
      ( MAKE-5PILE ?auto_64534 ?auto_64535 ?auto_64536 ?auto_64537 ?auto_64538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64540 - BLOCK
      ?auto_64541 - BLOCK
      ?auto_64542 - BLOCK
      ?auto_64543 - BLOCK
      ?auto_64544 - BLOCK
    )
    :vars
    (
      ?auto_64545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64540 ) ( ON ?auto_64541 ?auto_64540 ) ( ON ?auto_64542 ?auto_64541 ) ( not ( = ?auto_64540 ?auto_64541 ) ) ( not ( = ?auto_64540 ?auto_64542 ) ) ( not ( = ?auto_64540 ?auto_64543 ) ) ( not ( = ?auto_64540 ?auto_64544 ) ) ( not ( = ?auto_64541 ?auto_64542 ) ) ( not ( = ?auto_64541 ?auto_64543 ) ) ( not ( = ?auto_64541 ?auto_64544 ) ) ( not ( = ?auto_64542 ?auto_64543 ) ) ( not ( = ?auto_64542 ?auto_64544 ) ) ( not ( = ?auto_64543 ?auto_64544 ) ) ( ON ?auto_64544 ?auto_64545 ) ( not ( = ?auto_64540 ?auto_64545 ) ) ( not ( = ?auto_64541 ?auto_64545 ) ) ( not ( = ?auto_64542 ?auto_64545 ) ) ( not ( = ?auto_64543 ?auto_64545 ) ) ( not ( = ?auto_64544 ?auto_64545 ) ) ( CLEAR ?auto_64542 ) ( ON ?auto_64543 ?auto_64544 ) ( CLEAR ?auto_64543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64545 ?auto_64544 )
      ( MAKE-5PILE ?auto_64540 ?auto_64541 ?auto_64542 ?auto_64543 ?auto_64544 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64546 - BLOCK
      ?auto_64547 - BLOCK
      ?auto_64548 - BLOCK
      ?auto_64549 - BLOCK
      ?auto_64550 - BLOCK
    )
    :vars
    (
      ?auto_64551 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64546 ) ( ON ?auto_64547 ?auto_64546 ) ( not ( = ?auto_64546 ?auto_64547 ) ) ( not ( = ?auto_64546 ?auto_64548 ) ) ( not ( = ?auto_64546 ?auto_64549 ) ) ( not ( = ?auto_64546 ?auto_64550 ) ) ( not ( = ?auto_64547 ?auto_64548 ) ) ( not ( = ?auto_64547 ?auto_64549 ) ) ( not ( = ?auto_64547 ?auto_64550 ) ) ( not ( = ?auto_64548 ?auto_64549 ) ) ( not ( = ?auto_64548 ?auto_64550 ) ) ( not ( = ?auto_64549 ?auto_64550 ) ) ( ON ?auto_64550 ?auto_64551 ) ( not ( = ?auto_64546 ?auto_64551 ) ) ( not ( = ?auto_64547 ?auto_64551 ) ) ( not ( = ?auto_64548 ?auto_64551 ) ) ( not ( = ?auto_64549 ?auto_64551 ) ) ( not ( = ?auto_64550 ?auto_64551 ) ) ( ON ?auto_64549 ?auto_64550 ) ( CLEAR ?auto_64549 ) ( ON-TABLE ?auto_64551 ) ( HOLDING ?auto_64548 ) ( CLEAR ?auto_64547 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64546 ?auto_64547 ?auto_64548 )
      ( MAKE-5PILE ?auto_64546 ?auto_64547 ?auto_64548 ?auto_64549 ?auto_64550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64552 - BLOCK
      ?auto_64553 - BLOCK
      ?auto_64554 - BLOCK
      ?auto_64555 - BLOCK
      ?auto_64556 - BLOCK
    )
    :vars
    (
      ?auto_64557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64552 ) ( ON ?auto_64553 ?auto_64552 ) ( not ( = ?auto_64552 ?auto_64553 ) ) ( not ( = ?auto_64552 ?auto_64554 ) ) ( not ( = ?auto_64552 ?auto_64555 ) ) ( not ( = ?auto_64552 ?auto_64556 ) ) ( not ( = ?auto_64553 ?auto_64554 ) ) ( not ( = ?auto_64553 ?auto_64555 ) ) ( not ( = ?auto_64553 ?auto_64556 ) ) ( not ( = ?auto_64554 ?auto_64555 ) ) ( not ( = ?auto_64554 ?auto_64556 ) ) ( not ( = ?auto_64555 ?auto_64556 ) ) ( ON ?auto_64556 ?auto_64557 ) ( not ( = ?auto_64552 ?auto_64557 ) ) ( not ( = ?auto_64553 ?auto_64557 ) ) ( not ( = ?auto_64554 ?auto_64557 ) ) ( not ( = ?auto_64555 ?auto_64557 ) ) ( not ( = ?auto_64556 ?auto_64557 ) ) ( ON ?auto_64555 ?auto_64556 ) ( ON-TABLE ?auto_64557 ) ( CLEAR ?auto_64553 ) ( ON ?auto_64554 ?auto_64555 ) ( CLEAR ?auto_64554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64557 ?auto_64556 ?auto_64555 )
      ( MAKE-5PILE ?auto_64552 ?auto_64553 ?auto_64554 ?auto_64555 ?auto_64556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64558 - BLOCK
      ?auto_64559 - BLOCK
      ?auto_64560 - BLOCK
      ?auto_64561 - BLOCK
      ?auto_64562 - BLOCK
    )
    :vars
    (
      ?auto_64563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64558 ) ( not ( = ?auto_64558 ?auto_64559 ) ) ( not ( = ?auto_64558 ?auto_64560 ) ) ( not ( = ?auto_64558 ?auto_64561 ) ) ( not ( = ?auto_64558 ?auto_64562 ) ) ( not ( = ?auto_64559 ?auto_64560 ) ) ( not ( = ?auto_64559 ?auto_64561 ) ) ( not ( = ?auto_64559 ?auto_64562 ) ) ( not ( = ?auto_64560 ?auto_64561 ) ) ( not ( = ?auto_64560 ?auto_64562 ) ) ( not ( = ?auto_64561 ?auto_64562 ) ) ( ON ?auto_64562 ?auto_64563 ) ( not ( = ?auto_64558 ?auto_64563 ) ) ( not ( = ?auto_64559 ?auto_64563 ) ) ( not ( = ?auto_64560 ?auto_64563 ) ) ( not ( = ?auto_64561 ?auto_64563 ) ) ( not ( = ?auto_64562 ?auto_64563 ) ) ( ON ?auto_64561 ?auto_64562 ) ( ON-TABLE ?auto_64563 ) ( ON ?auto_64560 ?auto_64561 ) ( CLEAR ?auto_64560 ) ( HOLDING ?auto_64559 ) ( CLEAR ?auto_64558 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64558 ?auto_64559 )
      ( MAKE-5PILE ?auto_64558 ?auto_64559 ?auto_64560 ?auto_64561 ?auto_64562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64564 - BLOCK
      ?auto_64565 - BLOCK
      ?auto_64566 - BLOCK
      ?auto_64567 - BLOCK
      ?auto_64568 - BLOCK
    )
    :vars
    (
      ?auto_64569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64564 ) ( not ( = ?auto_64564 ?auto_64565 ) ) ( not ( = ?auto_64564 ?auto_64566 ) ) ( not ( = ?auto_64564 ?auto_64567 ) ) ( not ( = ?auto_64564 ?auto_64568 ) ) ( not ( = ?auto_64565 ?auto_64566 ) ) ( not ( = ?auto_64565 ?auto_64567 ) ) ( not ( = ?auto_64565 ?auto_64568 ) ) ( not ( = ?auto_64566 ?auto_64567 ) ) ( not ( = ?auto_64566 ?auto_64568 ) ) ( not ( = ?auto_64567 ?auto_64568 ) ) ( ON ?auto_64568 ?auto_64569 ) ( not ( = ?auto_64564 ?auto_64569 ) ) ( not ( = ?auto_64565 ?auto_64569 ) ) ( not ( = ?auto_64566 ?auto_64569 ) ) ( not ( = ?auto_64567 ?auto_64569 ) ) ( not ( = ?auto_64568 ?auto_64569 ) ) ( ON ?auto_64567 ?auto_64568 ) ( ON-TABLE ?auto_64569 ) ( ON ?auto_64566 ?auto_64567 ) ( CLEAR ?auto_64564 ) ( ON ?auto_64565 ?auto_64566 ) ( CLEAR ?auto_64565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64569 ?auto_64568 ?auto_64567 ?auto_64566 )
      ( MAKE-5PILE ?auto_64564 ?auto_64565 ?auto_64566 ?auto_64567 ?auto_64568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64570 - BLOCK
      ?auto_64571 - BLOCK
      ?auto_64572 - BLOCK
      ?auto_64573 - BLOCK
      ?auto_64574 - BLOCK
    )
    :vars
    (
      ?auto_64575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64570 ?auto_64571 ) ) ( not ( = ?auto_64570 ?auto_64572 ) ) ( not ( = ?auto_64570 ?auto_64573 ) ) ( not ( = ?auto_64570 ?auto_64574 ) ) ( not ( = ?auto_64571 ?auto_64572 ) ) ( not ( = ?auto_64571 ?auto_64573 ) ) ( not ( = ?auto_64571 ?auto_64574 ) ) ( not ( = ?auto_64572 ?auto_64573 ) ) ( not ( = ?auto_64572 ?auto_64574 ) ) ( not ( = ?auto_64573 ?auto_64574 ) ) ( ON ?auto_64574 ?auto_64575 ) ( not ( = ?auto_64570 ?auto_64575 ) ) ( not ( = ?auto_64571 ?auto_64575 ) ) ( not ( = ?auto_64572 ?auto_64575 ) ) ( not ( = ?auto_64573 ?auto_64575 ) ) ( not ( = ?auto_64574 ?auto_64575 ) ) ( ON ?auto_64573 ?auto_64574 ) ( ON-TABLE ?auto_64575 ) ( ON ?auto_64572 ?auto_64573 ) ( ON ?auto_64571 ?auto_64572 ) ( CLEAR ?auto_64571 ) ( HOLDING ?auto_64570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64570 )
      ( MAKE-5PILE ?auto_64570 ?auto_64571 ?auto_64572 ?auto_64573 ?auto_64574 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64576 - BLOCK
      ?auto_64577 - BLOCK
      ?auto_64578 - BLOCK
      ?auto_64579 - BLOCK
      ?auto_64580 - BLOCK
    )
    :vars
    (
      ?auto_64581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64576 ?auto_64577 ) ) ( not ( = ?auto_64576 ?auto_64578 ) ) ( not ( = ?auto_64576 ?auto_64579 ) ) ( not ( = ?auto_64576 ?auto_64580 ) ) ( not ( = ?auto_64577 ?auto_64578 ) ) ( not ( = ?auto_64577 ?auto_64579 ) ) ( not ( = ?auto_64577 ?auto_64580 ) ) ( not ( = ?auto_64578 ?auto_64579 ) ) ( not ( = ?auto_64578 ?auto_64580 ) ) ( not ( = ?auto_64579 ?auto_64580 ) ) ( ON ?auto_64580 ?auto_64581 ) ( not ( = ?auto_64576 ?auto_64581 ) ) ( not ( = ?auto_64577 ?auto_64581 ) ) ( not ( = ?auto_64578 ?auto_64581 ) ) ( not ( = ?auto_64579 ?auto_64581 ) ) ( not ( = ?auto_64580 ?auto_64581 ) ) ( ON ?auto_64579 ?auto_64580 ) ( ON-TABLE ?auto_64581 ) ( ON ?auto_64578 ?auto_64579 ) ( ON ?auto_64577 ?auto_64578 ) ( ON ?auto_64576 ?auto_64577 ) ( CLEAR ?auto_64576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64581 ?auto_64580 ?auto_64579 ?auto_64578 ?auto_64577 )
      ( MAKE-5PILE ?auto_64576 ?auto_64577 ?auto_64578 ?auto_64579 ?auto_64580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64582 - BLOCK
      ?auto_64583 - BLOCK
      ?auto_64584 - BLOCK
      ?auto_64585 - BLOCK
      ?auto_64586 - BLOCK
    )
    :vars
    (
      ?auto_64587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64582 ?auto_64583 ) ) ( not ( = ?auto_64582 ?auto_64584 ) ) ( not ( = ?auto_64582 ?auto_64585 ) ) ( not ( = ?auto_64582 ?auto_64586 ) ) ( not ( = ?auto_64583 ?auto_64584 ) ) ( not ( = ?auto_64583 ?auto_64585 ) ) ( not ( = ?auto_64583 ?auto_64586 ) ) ( not ( = ?auto_64584 ?auto_64585 ) ) ( not ( = ?auto_64584 ?auto_64586 ) ) ( not ( = ?auto_64585 ?auto_64586 ) ) ( ON ?auto_64586 ?auto_64587 ) ( not ( = ?auto_64582 ?auto_64587 ) ) ( not ( = ?auto_64583 ?auto_64587 ) ) ( not ( = ?auto_64584 ?auto_64587 ) ) ( not ( = ?auto_64585 ?auto_64587 ) ) ( not ( = ?auto_64586 ?auto_64587 ) ) ( ON ?auto_64585 ?auto_64586 ) ( ON-TABLE ?auto_64587 ) ( ON ?auto_64584 ?auto_64585 ) ( ON ?auto_64583 ?auto_64584 ) ( HOLDING ?auto_64582 ) ( CLEAR ?auto_64583 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64587 ?auto_64586 ?auto_64585 ?auto_64584 ?auto_64583 ?auto_64582 )
      ( MAKE-5PILE ?auto_64582 ?auto_64583 ?auto_64584 ?auto_64585 ?auto_64586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64588 - BLOCK
      ?auto_64589 - BLOCK
      ?auto_64590 - BLOCK
      ?auto_64591 - BLOCK
      ?auto_64592 - BLOCK
    )
    :vars
    (
      ?auto_64593 - BLOCK
      ?auto_64594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64588 ?auto_64589 ) ) ( not ( = ?auto_64588 ?auto_64590 ) ) ( not ( = ?auto_64588 ?auto_64591 ) ) ( not ( = ?auto_64588 ?auto_64592 ) ) ( not ( = ?auto_64589 ?auto_64590 ) ) ( not ( = ?auto_64589 ?auto_64591 ) ) ( not ( = ?auto_64589 ?auto_64592 ) ) ( not ( = ?auto_64590 ?auto_64591 ) ) ( not ( = ?auto_64590 ?auto_64592 ) ) ( not ( = ?auto_64591 ?auto_64592 ) ) ( ON ?auto_64592 ?auto_64593 ) ( not ( = ?auto_64588 ?auto_64593 ) ) ( not ( = ?auto_64589 ?auto_64593 ) ) ( not ( = ?auto_64590 ?auto_64593 ) ) ( not ( = ?auto_64591 ?auto_64593 ) ) ( not ( = ?auto_64592 ?auto_64593 ) ) ( ON ?auto_64591 ?auto_64592 ) ( ON-TABLE ?auto_64593 ) ( ON ?auto_64590 ?auto_64591 ) ( ON ?auto_64589 ?auto_64590 ) ( CLEAR ?auto_64589 ) ( ON ?auto_64588 ?auto_64594 ) ( CLEAR ?auto_64588 ) ( HAND-EMPTY ) ( not ( = ?auto_64588 ?auto_64594 ) ) ( not ( = ?auto_64589 ?auto_64594 ) ) ( not ( = ?auto_64590 ?auto_64594 ) ) ( not ( = ?auto_64591 ?auto_64594 ) ) ( not ( = ?auto_64592 ?auto_64594 ) ) ( not ( = ?auto_64593 ?auto_64594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64588 ?auto_64594 )
      ( MAKE-5PILE ?auto_64588 ?auto_64589 ?auto_64590 ?auto_64591 ?auto_64592 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64595 - BLOCK
      ?auto_64596 - BLOCK
      ?auto_64597 - BLOCK
      ?auto_64598 - BLOCK
      ?auto_64599 - BLOCK
    )
    :vars
    (
      ?auto_64600 - BLOCK
      ?auto_64601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64595 ?auto_64596 ) ) ( not ( = ?auto_64595 ?auto_64597 ) ) ( not ( = ?auto_64595 ?auto_64598 ) ) ( not ( = ?auto_64595 ?auto_64599 ) ) ( not ( = ?auto_64596 ?auto_64597 ) ) ( not ( = ?auto_64596 ?auto_64598 ) ) ( not ( = ?auto_64596 ?auto_64599 ) ) ( not ( = ?auto_64597 ?auto_64598 ) ) ( not ( = ?auto_64597 ?auto_64599 ) ) ( not ( = ?auto_64598 ?auto_64599 ) ) ( ON ?auto_64599 ?auto_64600 ) ( not ( = ?auto_64595 ?auto_64600 ) ) ( not ( = ?auto_64596 ?auto_64600 ) ) ( not ( = ?auto_64597 ?auto_64600 ) ) ( not ( = ?auto_64598 ?auto_64600 ) ) ( not ( = ?auto_64599 ?auto_64600 ) ) ( ON ?auto_64598 ?auto_64599 ) ( ON-TABLE ?auto_64600 ) ( ON ?auto_64597 ?auto_64598 ) ( ON ?auto_64595 ?auto_64601 ) ( CLEAR ?auto_64595 ) ( not ( = ?auto_64595 ?auto_64601 ) ) ( not ( = ?auto_64596 ?auto_64601 ) ) ( not ( = ?auto_64597 ?auto_64601 ) ) ( not ( = ?auto_64598 ?auto_64601 ) ) ( not ( = ?auto_64599 ?auto_64601 ) ) ( not ( = ?auto_64600 ?auto_64601 ) ) ( HOLDING ?auto_64596 ) ( CLEAR ?auto_64597 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64600 ?auto_64599 ?auto_64598 ?auto_64597 ?auto_64596 )
      ( MAKE-5PILE ?auto_64595 ?auto_64596 ?auto_64597 ?auto_64598 ?auto_64599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64602 - BLOCK
      ?auto_64603 - BLOCK
      ?auto_64604 - BLOCK
      ?auto_64605 - BLOCK
      ?auto_64606 - BLOCK
    )
    :vars
    (
      ?auto_64607 - BLOCK
      ?auto_64608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64602 ?auto_64603 ) ) ( not ( = ?auto_64602 ?auto_64604 ) ) ( not ( = ?auto_64602 ?auto_64605 ) ) ( not ( = ?auto_64602 ?auto_64606 ) ) ( not ( = ?auto_64603 ?auto_64604 ) ) ( not ( = ?auto_64603 ?auto_64605 ) ) ( not ( = ?auto_64603 ?auto_64606 ) ) ( not ( = ?auto_64604 ?auto_64605 ) ) ( not ( = ?auto_64604 ?auto_64606 ) ) ( not ( = ?auto_64605 ?auto_64606 ) ) ( ON ?auto_64606 ?auto_64607 ) ( not ( = ?auto_64602 ?auto_64607 ) ) ( not ( = ?auto_64603 ?auto_64607 ) ) ( not ( = ?auto_64604 ?auto_64607 ) ) ( not ( = ?auto_64605 ?auto_64607 ) ) ( not ( = ?auto_64606 ?auto_64607 ) ) ( ON ?auto_64605 ?auto_64606 ) ( ON-TABLE ?auto_64607 ) ( ON ?auto_64604 ?auto_64605 ) ( ON ?auto_64602 ?auto_64608 ) ( not ( = ?auto_64602 ?auto_64608 ) ) ( not ( = ?auto_64603 ?auto_64608 ) ) ( not ( = ?auto_64604 ?auto_64608 ) ) ( not ( = ?auto_64605 ?auto_64608 ) ) ( not ( = ?auto_64606 ?auto_64608 ) ) ( not ( = ?auto_64607 ?auto_64608 ) ) ( CLEAR ?auto_64604 ) ( ON ?auto_64603 ?auto_64602 ) ( CLEAR ?auto_64603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64608 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64608 ?auto_64602 )
      ( MAKE-5PILE ?auto_64602 ?auto_64603 ?auto_64604 ?auto_64605 ?auto_64606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64609 - BLOCK
      ?auto_64610 - BLOCK
      ?auto_64611 - BLOCK
      ?auto_64612 - BLOCK
      ?auto_64613 - BLOCK
    )
    :vars
    (
      ?auto_64614 - BLOCK
      ?auto_64615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64609 ?auto_64610 ) ) ( not ( = ?auto_64609 ?auto_64611 ) ) ( not ( = ?auto_64609 ?auto_64612 ) ) ( not ( = ?auto_64609 ?auto_64613 ) ) ( not ( = ?auto_64610 ?auto_64611 ) ) ( not ( = ?auto_64610 ?auto_64612 ) ) ( not ( = ?auto_64610 ?auto_64613 ) ) ( not ( = ?auto_64611 ?auto_64612 ) ) ( not ( = ?auto_64611 ?auto_64613 ) ) ( not ( = ?auto_64612 ?auto_64613 ) ) ( ON ?auto_64613 ?auto_64614 ) ( not ( = ?auto_64609 ?auto_64614 ) ) ( not ( = ?auto_64610 ?auto_64614 ) ) ( not ( = ?auto_64611 ?auto_64614 ) ) ( not ( = ?auto_64612 ?auto_64614 ) ) ( not ( = ?auto_64613 ?auto_64614 ) ) ( ON ?auto_64612 ?auto_64613 ) ( ON-TABLE ?auto_64614 ) ( ON ?auto_64609 ?auto_64615 ) ( not ( = ?auto_64609 ?auto_64615 ) ) ( not ( = ?auto_64610 ?auto_64615 ) ) ( not ( = ?auto_64611 ?auto_64615 ) ) ( not ( = ?auto_64612 ?auto_64615 ) ) ( not ( = ?auto_64613 ?auto_64615 ) ) ( not ( = ?auto_64614 ?auto_64615 ) ) ( ON ?auto_64610 ?auto_64609 ) ( CLEAR ?auto_64610 ) ( ON-TABLE ?auto_64615 ) ( HOLDING ?auto_64611 ) ( CLEAR ?auto_64612 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64614 ?auto_64613 ?auto_64612 ?auto_64611 )
      ( MAKE-5PILE ?auto_64609 ?auto_64610 ?auto_64611 ?auto_64612 ?auto_64613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64616 - BLOCK
      ?auto_64617 - BLOCK
      ?auto_64618 - BLOCK
      ?auto_64619 - BLOCK
      ?auto_64620 - BLOCK
    )
    :vars
    (
      ?auto_64621 - BLOCK
      ?auto_64622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64616 ?auto_64617 ) ) ( not ( = ?auto_64616 ?auto_64618 ) ) ( not ( = ?auto_64616 ?auto_64619 ) ) ( not ( = ?auto_64616 ?auto_64620 ) ) ( not ( = ?auto_64617 ?auto_64618 ) ) ( not ( = ?auto_64617 ?auto_64619 ) ) ( not ( = ?auto_64617 ?auto_64620 ) ) ( not ( = ?auto_64618 ?auto_64619 ) ) ( not ( = ?auto_64618 ?auto_64620 ) ) ( not ( = ?auto_64619 ?auto_64620 ) ) ( ON ?auto_64620 ?auto_64621 ) ( not ( = ?auto_64616 ?auto_64621 ) ) ( not ( = ?auto_64617 ?auto_64621 ) ) ( not ( = ?auto_64618 ?auto_64621 ) ) ( not ( = ?auto_64619 ?auto_64621 ) ) ( not ( = ?auto_64620 ?auto_64621 ) ) ( ON ?auto_64619 ?auto_64620 ) ( ON-TABLE ?auto_64621 ) ( ON ?auto_64616 ?auto_64622 ) ( not ( = ?auto_64616 ?auto_64622 ) ) ( not ( = ?auto_64617 ?auto_64622 ) ) ( not ( = ?auto_64618 ?auto_64622 ) ) ( not ( = ?auto_64619 ?auto_64622 ) ) ( not ( = ?auto_64620 ?auto_64622 ) ) ( not ( = ?auto_64621 ?auto_64622 ) ) ( ON ?auto_64617 ?auto_64616 ) ( ON-TABLE ?auto_64622 ) ( CLEAR ?auto_64619 ) ( ON ?auto_64618 ?auto_64617 ) ( CLEAR ?auto_64618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64622 ?auto_64616 ?auto_64617 )
      ( MAKE-5PILE ?auto_64616 ?auto_64617 ?auto_64618 ?auto_64619 ?auto_64620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64623 - BLOCK
      ?auto_64624 - BLOCK
      ?auto_64625 - BLOCK
      ?auto_64626 - BLOCK
      ?auto_64627 - BLOCK
    )
    :vars
    (
      ?auto_64628 - BLOCK
      ?auto_64629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64623 ?auto_64624 ) ) ( not ( = ?auto_64623 ?auto_64625 ) ) ( not ( = ?auto_64623 ?auto_64626 ) ) ( not ( = ?auto_64623 ?auto_64627 ) ) ( not ( = ?auto_64624 ?auto_64625 ) ) ( not ( = ?auto_64624 ?auto_64626 ) ) ( not ( = ?auto_64624 ?auto_64627 ) ) ( not ( = ?auto_64625 ?auto_64626 ) ) ( not ( = ?auto_64625 ?auto_64627 ) ) ( not ( = ?auto_64626 ?auto_64627 ) ) ( ON ?auto_64627 ?auto_64628 ) ( not ( = ?auto_64623 ?auto_64628 ) ) ( not ( = ?auto_64624 ?auto_64628 ) ) ( not ( = ?auto_64625 ?auto_64628 ) ) ( not ( = ?auto_64626 ?auto_64628 ) ) ( not ( = ?auto_64627 ?auto_64628 ) ) ( ON-TABLE ?auto_64628 ) ( ON ?auto_64623 ?auto_64629 ) ( not ( = ?auto_64623 ?auto_64629 ) ) ( not ( = ?auto_64624 ?auto_64629 ) ) ( not ( = ?auto_64625 ?auto_64629 ) ) ( not ( = ?auto_64626 ?auto_64629 ) ) ( not ( = ?auto_64627 ?auto_64629 ) ) ( not ( = ?auto_64628 ?auto_64629 ) ) ( ON ?auto_64624 ?auto_64623 ) ( ON-TABLE ?auto_64629 ) ( ON ?auto_64625 ?auto_64624 ) ( CLEAR ?auto_64625 ) ( HOLDING ?auto_64626 ) ( CLEAR ?auto_64627 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64628 ?auto_64627 ?auto_64626 )
      ( MAKE-5PILE ?auto_64623 ?auto_64624 ?auto_64625 ?auto_64626 ?auto_64627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64630 - BLOCK
      ?auto_64631 - BLOCK
      ?auto_64632 - BLOCK
      ?auto_64633 - BLOCK
      ?auto_64634 - BLOCK
    )
    :vars
    (
      ?auto_64636 - BLOCK
      ?auto_64635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64630 ?auto_64631 ) ) ( not ( = ?auto_64630 ?auto_64632 ) ) ( not ( = ?auto_64630 ?auto_64633 ) ) ( not ( = ?auto_64630 ?auto_64634 ) ) ( not ( = ?auto_64631 ?auto_64632 ) ) ( not ( = ?auto_64631 ?auto_64633 ) ) ( not ( = ?auto_64631 ?auto_64634 ) ) ( not ( = ?auto_64632 ?auto_64633 ) ) ( not ( = ?auto_64632 ?auto_64634 ) ) ( not ( = ?auto_64633 ?auto_64634 ) ) ( ON ?auto_64634 ?auto_64636 ) ( not ( = ?auto_64630 ?auto_64636 ) ) ( not ( = ?auto_64631 ?auto_64636 ) ) ( not ( = ?auto_64632 ?auto_64636 ) ) ( not ( = ?auto_64633 ?auto_64636 ) ) ( not ( = ?auto_64634 ?auto_64636 ) ) ( ON-TABLE ?auto_64636 ) ( ON ?auto_64630 ?auto_64635 ) ( not ( = ?auto_64630 ?auto_64635 ) ) ( not ( = ?auto_64631 ?auto_64635 ) ) ( not ( = ?auto_64632 ?auto_64635 ) ) ( not ( = ?auto_64633 ?auto_64635 ) ) ( not ( = ?auto_64634 ?auto_64635 ) ) ( not ( = ?auto_64636 ?auto_64635 ) ) ( ON ?auto_64631 ?auto_64630 ) ( ON-TABLE ?auto_64635 ) ( ON ?auto_64632 ?auto_64631 ) ( CLEAR ?auto_64634 ) ( ON ?auto_64633 ?auto_64632 ) ( CLEAR ?auto_64633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64635 ?auto_64630 ?auto_64631 ?auto_64632 )
      ( MAKE-5PILE ?auto_64630 ?auto_64631 ?auto_64632 ?auto_64633 ?auto_64634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64637 - BLOCK
      ?auto_64638 - BLOCK
      ?auto_64639 - BLOCK
      ?auto_64640 - BLOCK
      ?auto_64641 - BLOCK
    )
    :vars
    (
      ?auto_64642 - BLOCK
      ?auto_64643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64637 ?auto_64638 ) ) ( not ( = ?auto_64637 ?auto_64639 ) ) ( not ( = ?auto_64637 ?auto_64640 ) ) ( not ( = ?auto_64637 ?auto_64641 ) ) ( not ( = ?auto_64638 ?auto_64639 ) ) ( not ( = ?auto_64638 ?auto_64640 ) ) ( not ( = ?auto_64638 ?auto_64641 ) ) ( not ( = ?auto_64639 ?auto_64640 ) ) ( not ( = ?auto_64639 ?auto_64641 ) ) ( not ( = ?auto_64640 ?auto_64641 ) ) ( not ( = ?auto_64637 ?auto_64642 ) ) ( not ( = ?auto_64638 ?auto_64642 ) ) ( not ( = ?auto_64639 ?auto_64642 ) ) ( not ( = ?auto_64640 ?auto_64642 ) ) ( not ( = ?auto_64641 ?auto_64642 ) ) ( ON-TABLE ?auto_64642 ) ( ON ?auto_64637 ?auto_64643 ) ( not ( = ?auto_64637 ?auto_64643 ) ) ( not ( = ?auto_64638 ?auto_64643 ) ) ( not ( = ?auto_64639 ?auto_64643 ) ) ( not ( = ?auto_64640 ?auto_64643 ) ) ( not ( = ?auto_64641 ?auto_64643 ) ) ( not ( = ?auto_64642 ?auto_64643 ) ) ( ON ?auto_64638 ?auto_64637 ) ( ON-TABLE ?auto_64643 ) ( ON ?auto_64639 ?auto_64638 ) ( ON ?auto_64640 ?auto_64639 ) ( CLEAR ?auto_64640 ) ( HOLDING ?auto_64641 ) ( CLEAR ?auto_64642 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64642 ?auto_64641 )
      ( MAKE-5PILE ?auto_64637 ?auto_64638 ?auto_64639 ?auto_64640 ?auto_64641 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64644 - BLOCK
      ?auto_64645 - BLOCK
      ?auto_64646 - BLOCK
      ?auto_64647 - BLOCK
      ?auto_64648 - BLOCK
    )
    :vars
    (
      ?auto_64649 - BLOCK
      ?auto_64650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64644 ?auto_64645 ) ) ( not ( = ?auto_64644 ?auto_64646 ) ) ( not ( = ?auto_64644 ?auto_64647 ) ) ( not ( = ?auto_64644 ?auto_64648 ) ) ( not ( = ?auto_64645 ?auto_64646 ) ) ( not ( = ?auto_64645 ?auto_64647 ) ) ( not ( = ?auto_64645 ?auto_64648 ) ) ( not ( = ?auto_64646 ?auto_64647 ) ) ( not ( = ?auto_64646 ?auto_64648 ) ) ( not ( = ?auto_64647 ?auto_64648 ) ) ( not ( = ?auto_64644 ?auto_64649 ) ) ( not ( = ?auto_64645 ?auto_64649 ) ) ( not ( = ?auto_64646 ?auto_64649 ) ) ( not ( = ?auto_64647 ?auto_64649 ) ) ( not ( = ?auto_64648 ?auto_64649 ) ) ( ON-TABLE ?auto_64649 ) ( ON ?auto_64644 ?auto_64650 ) ( not ( = ?auto_64644 ?auto_64650 ) ) ( not ( = ?auto_64645 ?auto_64650 ) ) ( not ( = ?auto_64646 ?auto_64650 ) ) ( not ( = ?auto_64647 ?auto_64650 ) ) ( not ( = ?auto_64648 ?auto_64650 ) ) ( not ( = ?auto_64649 ?auto_64650 ) ) ( ON ?auto_64645 ?auto_64644 ) ( ON-TABLE ?auto_64650 ) ( ON ?auto_64646 ?auto_64645 ) ( ON ?auto_64647 ?auto_64646 ) ( CLEAR ?auto_64649 ) ( ON ?auto_64648 ?auto_64647 ) ( CLEAR ?auto_64648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64650 ?auto_64644 ?auto_64645 ?auto_64646 ?auto_64647 )
      ( MAKE-5PILE ?auto_64644 ?auto_64645 ?auto_64646 ?auto_64647 ?auto_64648 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64651 - BLOCK
      ?auto_64652 - BLOCK
      ?auto_64653 - BLOCK
      ?auto_64654 - BLOCK
      ?auto_64655 - BLOCK
    )
    :vars
    (
      ?auto_64656 - BLOCK
      ?auto_64657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64651 ?auto_64652 ) ) ( not ( = ?auto_64651 ?auto_64653 ) ) ( not ( = ?auto_64651 ?auto_64654 ) ) ( not ( = ?auto_64651 ?auto_64655 ) ) ( not ( = ?auto_64652 ?auto_64653 ) ) ( not ( = ?auto_64652 ?auto_64654 ) ) ( not ( = ?auto_64652 ?auto_64655 ) ) ( not ( = ?auto_64653 ?auto_64654 ) ) ( not ( = ?auto_64653 ?auto_64655 ) ) ( not ( = ?auto_64654 ?auto_64655 ) ) ( not ( = ?auto_64651 ?auto_64656 ) ) ( not ( = ?auto_64652 ?auto_64656 ) ) ( not ( = ?auto_64653 ?auto_64656 ) ) ( not ( = ?auto_64654 ?auto_64656 ) ) ( not ( = ?auto_64655 ?auto_64656 ) ) ( ON ?auto_64651 ?auto_64657 ) ( not ( = ?auto_64651 ?auto_64657 ) ) ( not ( = ?auto_64652 ?auto_64657 ) ) ( not ( = ?auto_64653 ?auto_64657 ) ) ( not ( = ?auto_64654 ?auto_64657 ) ) ( not ( = ?auto_64655 ?auto_64657 ) ) ( not ( = ?auto_64656 ?auto_64657 ) ) ( ON ?auto_64652 ?auto_64651 ) ( ON-TABLE ?auto_64657 ) ( ON ?auto_64653 ?auto_64652 ) ( ON ?auto_64654 ?auto_64653 ) ( ON ?auto_64655 ?auto_64654 ) ( CLEAR ?auto_64655 ) ( HOLDING ?auto_64656 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64656 )
      ( MAKE-5PILE ?auto_64651 ?auto_64652 ?auto_64653 ?auto_64654 ?auto_64655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64658 - BLOCK
      ?auto_64659 - BLOCK
      ?auto_64660 - BLOCK
      ?auto_64661 - BLOCK
      ?auto_64662 - BLOCK
    )
    :vars
    (
      ?auto_64664 - BLOCK
      ?auto_64663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64658 ?auto_64659 ) ) ( not ( = ?auto_64658 ?auto_64660 ) ) ( not ( = ?auto_64658 ?auto_64661 ) ) ( not ( = ?auto_64658 ?auto_64662 ) ) ( not ( = ?auto_64659 ?auto_64660 ) ) ( not ( = ?auto_64659 ?auto_64661 ) ) ( not ( = ?auto_64659 ?auto_64662 ) ) ( not ( = ?auto_64660 ?auto_64661 ) ) ( not ( = ?auto_64660 ?auto_64662 ) ) ( not ( = ?auto_64661 ?auto_64662 ) ) ( not ( = ?auto_64658 ?auto_64664 ) ) ( not ( = ?auto_64659 ?auto_64664 ) ) ( not ( = ?auto_64660 ?auto_64664 ) ) ( not ( = ?auto_64661 ?auto_64664 ) ) ( not ( = ?auto_64662 ?auto_64664 ) ) ( ON ?auto_64658 ?auto_64663 ) ( not ( = ?auto_64658 ?auto_64663 ) ) ( not ( = ?auto_64659 ?auto_64663 ) ) ( not ( = ?auto_64660 ?auto_64663 ) ) ( not ( = ?auto_64661 ?auto_64663 ) ) ( not ( = ?auto_64662 ?auto_64663 ) ) ( not ( = ?auto_64664 ?auto_64663 ) ) ( ON ?auto_64659 ?auto_64658 ) ( ON-TABLE ?auto_64663 ) ( ON ?auto_64660 ?auto_64659 ) ( ON ?auto_64661 ?auto_64660 ) ( ON ?auto_64662 ?auto_64661 ) ( ON ?auto_64664 ?auto_64662 ) ( CLEAR ?auto_64664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64663 ?auto_64658 ?auto_64659 ?auto_64660 ?auto_64661 ?auto_64662 )
      ( MAKE-5PILE ?auto_64658 ?auto_64659 ?auto_64660 ?auto_64661 ?auto_64662 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64671 - BLOCK
      ?auto_64672 - BLOCK
      ?auto_64673 - BLOCK
      ?auto_64674 - BLOCK
      ?auto_64675 - BLOCK
      ?auto_64676 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_64676 ) ( CLEAR ?auto_64675 ) ( ON-TABLE ?auto_64671 ) ( ON ?auto_64672 ?auto_64671 ) ( ON ?auto_64673 ?auto_64672 ) ( ON ?auto_64674 ?auto_64673 ) ( ON ?auto_64675 ?auto_64674 ) ( not ( = ?auto_64671 ?auto_64672 ) ) ( not ( = ?auto_64671 ?auto_64673 ) ) ( not ( = ?auto_64671 ?auto_64674 ) ) ( not ( = ?auto_64671 ?auto_64675 ) ) ( not ( = ?auto_64671 ?auto_64676 ) ) ( not ( = ?auto_64672 ?auto_64673 ) ) ( not ( = ?auto_64672 ?auto_64674 ) ) ( not ( = ?auto_64672 ?auto_64675 ) ) ( not ( = ?auto_64672 ?auto_64676 ) ) ( not ( = ?auto_64673 ?auto_64674 ) ) ( not ( = ?auto_64673 ?auto_64675 ) ) ( not ( = ?auto_64673 ?auto_64676 ) ) ( not ( = ?auto_64674 ?auto_64675 ) ) ( not ( = ?auto_64674 ?auto_64676 ) ) ( not ( = ?auto_64675 ?auto_64676 ) ) )
    :subtasks
    ( ( !STACK ?auto_64676 ?auto_64675 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64677 - BLOCK
      ?auto_64678 - BLOCK
      ?auto_64679 - BLOCK
      ?auto_64680 - BLOCK
      ?auto_64681 - BLOCK
      ?auto_64682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64681 ) ( ON-TABLE ?auto_64677 ) ( ON ?auto_64678 ?auto_64677 ) ( ON ?auto_64679 ?auto_64678 ) ( ON ?auto_64680 ?auto_64679 ) ( ON ?auto_64681 ?auto_64680 ) ( not ( = ?auto_64677 ?auto_64678 ) ) ( not ( = ?auto_64677 ?auto_64679 ) ) ( not ( = ?auto_64677 ?auto_64680 ) ) ( not ( = ?auto_64677 ?auto_64681 ) ) ( not ( = ?auto_64677 ?auto_64682 ) ) ( not ( = ?auto_64678 ?auto_64679 ) ) ( not ( = ?auto_64678 ?auto_64680 ) ) ( not ( = ?auto_64678 ?auto_64681 ) ) ( not ( = ?auto_64678 ?auto_64682 ) ) ( not ( = ?auto_64679 ?auto_64680 ) ) ( not ( = ?auto_64679 ?auto_64681 ) ) ( not ( = ?auto_64679 ?auto_64682 ) ) ( not ( = ?auto_64680 ?auto_64681 ) ) ( not ( = ?auto_64680 ?auto_64682 ) ) ( not ( = ?auto_64681 ?auto_64682 ) ) ( ON-TABLE ?auto_64682 ) ( CLEAR ?auto_64682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_64682 )
      ( MAKE-6PILE ?auto_64677 ?auto_64678 ?auto_64679 ?auto_64680 ?auto_64681 ?auto_64682 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64683 - BLOCK
      ?auto_64684 - BLOCK
      ?auto_64685 - BLOCK
      ?auto_64686 - BLOCK
      ?auto_64687 - BLOCK
      ?auto_64688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64683 ) ( ON ?auto_64684 ?auto_64683 ) ( ON ?auto_64685 ?auto_64684 ) ( ON ?auto_64686 ?auto_64685 ) ( not ( = ?auto_64683 ?auto_64684 ) ) ( not ( = ?auto_64683 ?auto_64685 ) ) ( not ( = ?auto_64683 ?auto_64686 ) ) ( not ( = ?auto_64683 ?auto_64687 ) ) ( not ( = ?auto_64683 ?auto_64688 ) ) ( not ( = ?auto_64684 ?auto_64685 ) ) ( not ( = ?auto_64684 ?auto_64686 ) ) ( not ( = ?auto_64684 ?auto_64687 ) ) ( not ( = ?auto_64684 ?auto_64688 ) ) ( not ( = ?auto_64685 ?auto_64686 ) ) ( not ( = ?auto_64685 ?auto_64687 ) ) ( not ( = ?auto_64685 ?auto_64688 ) ) ( not ( = ?auto_64686 ?auto_64687 ) ) ( not ( = ?auto_64686 ?auto_64688 ) ) ( not ( = ?auto_64687 ?auto_64688 ) ) ( ON-TABLE ?auto_64688 ) ( CLEAR ?auto_64688 ) ( HOLDING ?auto_64687 ) ( CLEAR ?auto_64686 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64683 ?auto_64684 ?auto_64685 ?auto_64686 ?auto_64687 )
      ( MAKE-6PILE ?auto_64683 ?auto_64684 ?auto_64685 ?auto_64686 ?auto_64687 ?auto_64688 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64689 - BLOCK
      ?auto_64690 - BLOCK
      ?auto_64691 - BLOCK
      ?auto_64692 - BLOCK
      ?auto_64693 - BLOCK
      ?auto_64694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64689 ) ( ON ?auto_64690 ?auto_64689 ) ( ON ?auto_64691 ?auto_64690 ) ( ON ?auto_64692 ?auto_64691 ) ( not ( = ?auto_64689 ?auto_64690 ) ) ( not ( = ?auto_64689 ?auto_64691 ) ) ( not ( = ?auto_64689 ?auto_64692 ) ) ( not ( = ?auto_64689 ?auto_64693 ) ) ( not ( = ?auto_64689 ?auto_64694 ) ) ( not ( = ?auto_64690 ?auto_64691 ) ) ( not ( = ?auto_64690 ?auto_64692 ) ) ( not ( = ?auto_64690 ?auto_64693 ) ) ( not ( = ?auto_64690 ?auto_64694 ) ) ( not ( = ?auto_64691 ?auto_64692 ) ) ( not ( = ?auto_64691 ?auto_64693 ) ) ( not ( = ?auto_64691 ?auto_64694 ) ) ( not ( = ?auto_64692 ?auto_64693 ) ) ( not ( = ?auto_64692 ?auto_64694 ) ) ( not ( = ?auto_64693 ?auto_64694 ) ) ( ON-TABLE ?auto_64694 ) ( CLEAR ?auto_64692 ) ( ON ?auto_64693 ?auto_64694 ) ( CLEAR ?auto_64693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64694 )
      ( MAKE-6PILE ?auto_64689 ?auto_64690 ?auto_64691 ?auto_64692 ?auto_64693 ?auto_64694 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64695 - BLOCK
      ?auto_64696 - BLOCK
      ?auto_64697 - BLOCK
      ?auto_64698 - BLOCK
      ?auto_64699 - BLOCK
      ?auto_64700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64695 ) ( ON ?auto_64696 ?auto_64695 ) ( ON ?auto_64697 ?auto_64696 ) ( not ( = ?auto_64695 ?auto_64696 ) ) ( not ( = ?auto_64695 ?auto_64697 ) ) ( not ( = ?auto_64695 ?auto_64698 ) ) ( not ( = ?auto_64695 ?auto_64699 ) ) ( not ( = ?auto_64695 ?auto_64700 ) ) ( not ( = ?auto_64696 ?auto_64697 ) ) ( not ( = ?auto_64696 ?auto_64698 ) ) ( not ( = ?auto_64696 ?auto_64699 ) ) ( not ( = ?auto_64696 ?auto_64700 ) ) ( not ( = ?auto_64697 ?auto_64698 ) ) ( not ( = ?auto_64697 ?auto_64699 ) ) ( not ( = ?auto_64697 ?auto_64700 ) ) ( not ( = ?auto_64698 ?auto_64699 ) ) ( not ( = ?auto_64698 ?auto_64700 ) ) ( not ( = ?auto_64699 ?auto_64700 ) ) ( ON-TABLE ?auto_64700 ) ( ON ?auto_64699 ?auto_64700 ) ( CLEAR ?auto_64699 ) ( HOLDING ?auto_64698 ) ( CLEAR ?auto_64697 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64695 ?auto_64696 ?auto_64697 ?auto_64698 )
      ( MAKE-6PILE ?auto_64695 ?auto_64696 ?auto_64697 ?auto_64698 ?auto_64699 ?auto_64700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64701 - BLOCK
      ?auto_64702 - BLOCK
      ?auto_64703 - BLOCK
      ?auto_64704 - BLOCK
      ?auto_64705 - BLOCK
      ?auto_64706 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64701 ) ( ON ?auto_64702 ?auto_64701 ) ( ON ?auto_64703 ?auto_64702 ) ( not ( = ?auto_64701 ?auto_64702 ) ) ( not ( = ?auto_64701 ?auto_64703 ) ) ( not ( = ?auto_64701 ?auto_64704 ) ) ( not ( = ?auto_64701 ?auto_64705 ) ) ( not ( = ?auto_64701 ?auto_64706 ) ) ( not ( = ?auto_64702 ?auto_64703 ) ) ( not ( = ?auto_64702 ?auto_64704 ) ) ( not ( = ?auto_64702 ?auto_64705 ) ) ( not ( = ?auto_64702 ?auto_64706 ) ) ( not ( = ?auto_64703 ?auto_64704 ) ) ( not ( = ?auto_64703 ?auto_64705 ) ) ( not ( = ?auto_64703 ?auto_64706 ) ) ( not ( = ?auto_64704 ?auto_64705 ) ) ( not ( = ?auto_64704 ?auto_64706 ) ) ( not ( = ?auto_64705 ?auto_64706 ) ) ( ON-TABLE ?auto_64706 ) ( ON ?auto_64705 ?auto_64706 ) ( CLEAR ?auto_64703 ) ( ON ?auto_64704 ?auto_64705 ) ( CLEAR ?auto_64704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64706 ?auto_64705 )
      ( MAKE-6PILE ?auto_64701 ?auto_64702 ?auto_64703 ?auto_64704 ?auto_64705 ?auto_64706 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64707 - BLOCK
      ?auto_64708 - BLOCK
      ?auto_64709 - BLOCK
      ?auto_64710 - BLOCK
      ?auto_64711 - BLOCK
      ?auto_64712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64707 ) ( ON ?auto_64708 ?auto_64707 ) ( not ( = ?auto_64707 ?auto_64708 ) ) ( not ( = ?auto_64707 ?auto_64709 ) ) ( not ( = ?auto_64707 ?auto_64710 ) ) ( not ( = ?auto_64707 ?auto_64711 ) ) ( not ( = ?auto_64707 ?auto_64712 ) ) ( not ( = ?auto_64708 ?auto_64709 ) ) ( not ( = ?auto_64708 ?auto_64710 ) ) ( not ( = ?auto_64708 ?auto_64711 ) ) ( not ( = ?auto_64708 ?auto_64712 ) ) ( not ( = ?auto_64709 ?auto_64710 ) ) ( not ( = ?auto_64709 ?auto_64711 ) ) ( not ( = ?auto_64709 ?auto_64712 ) ) ( not ( = ?auto_64710 ?auto_64711 ) ) ( not ( = ?auto_64710 ?auto_64712 ) ) ( not ( = ?auto_64711 ?auto_64712 ) ) ( ON-TABLE ?auto_64712 ) ( ON ?auto_64711 ?auto_64712 ) ( ON ?auto_64710 ?auto_64711 ) ( CLEAR ?auto_64710 ) ( HOLDING ?auto_64709 ) ( CLEAR ?auto_64708 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64707 ?auto_64708 ?auto_64709 )
      ( MAKE-6PILE ?auto_64707 ?auto_64708 ?auto_64709 ?auto_64710 ?auto_64711 ?auto_64712 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64713 - BLOCK
      ?auto_64714 - BLOCK
      ?auto_64715 - BLOCK
      ?auto_64716 - BLOCK
      ?auto_64717 - BLOCK
      ?auto_64718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64713 ) ( ON ?auto_64714 ?auto_64713 ) ( not ( = ?auto_64713 ?auto_64714 ) ) ( not ( = ?auto_64713 ?auto_64715 ) ) ( not ( = ?auto_64713 ?auto_64716 ) ) ( not ( = ?auto_64713 ?auto_64717 ) ) ( not ( = ?auto_64713 ?auto_64718 ) ) ( not ( = ?auto_64714 ?auto_64715 ) ) ( not ( = ?auto_64714 ?auto_64716 ) ) ( not ( = ?auto_64714 ?auto_64717 ) ) ( not ( = ?auto_64714 ?auto_64718 ) ) ( not ( = ?auto_64715 ?auto_64716 ) ) ( not ( = ?auto_64715 ?auto_64717 ) ) ( not ( = ?auto_64715 ?auto_64718 ) ) ( not ( = ?auto_64716 ?auto_64717 ) ) ( not ( = ?auto_64716 ?auto_64718 ) ) ( not ( = ?auto_64717 ?auto_64718 ) ) ( ON-TABLE ?auto_64718 ) ( ON ?auto_64717 ?auto_64718 ) ( ON ?auto_64716 ?auto_64717 ) ( CLEAR ?auto_64714 ) ( ON ?auto_64715 ?auto_64716 ) ( CLEAR ?auto_64715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64718 ?auto_64717 ?auto_64716 )
      ( MAKE-6PILE ?auto_64713 ?auto_64714 ?auto_64715 ?auto_64716 ?auto_64717 ?auto_64718 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64719 - BLOCK
      ?auto_64720 - BLOCK
      ?auto_64721 - BLOCK
      ?auto_64722 - BLOCK
      ?auto_64723 - BLOCK
      ?auto_64724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64719 ) ( not ( = ?auto_64719 ?auto_64720 ) ) ( not ( = ?auto_64719 ?auto_64721 ) ) ( not ( = ?auto_64719 ?auto_64722 ) ) ( not ( = ?auto_64719 ?auto_64723 ) ) ( not ( = ?auto_64719 ?auto_64724 ) ) ( not ( = ?auto_64720 ?auto_64721 ) ) ( not ( = ?auto_64720 ?auto_64722 ) ) ( not ( = ?auto_64720 ?auto_64723 ) ) ( not ( = ?auto_64720 ?auto_64724 ) ) ( not ( = ?auto_64721 ?auto_64722 ) ) ( not ( = ?auto_64721 ?auto_64723 ) ) ( not ( = ?auto_64721 ?auto_64724 ) ) ( not ( = ?auto_64722 ?auto_64723 ) ) ( not ( = ?auto_64722 ?auto_64724 ) ) ( not ( = ?auto_64723 ?auto_64724 ) ) ( ON-TABLE ?auto_64724 ) ( ON ?auto_64723 ?auto_64724 ) ( ON ?auto_64722 ?auto_64723 ) ( ON ?auto_64721 ?auto_64722 ) ( CLEAR ?auto_64721 ) ( HOLDING ?auto_64720 ) ( CLEAR ?auto_64719 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64719 ?auto_64720 )
      ( MAKE-6PILE ?auto_64719 ?auto_64720 ?auto_64721 ?auto_64722 ?auto_64723 ?auto_64724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64725 - BLOCK
      ?auto_64726 - BLOCK
      ?auto_64727 - BLOCK
      ?auto_64728 - BLOCK
      ?auto_64729 - BLOCK
      ?auto_64730 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64725 ) ( not ( = ?auto_64725 ?auto_64726 ) ) ( not ( = ?auto_64725 ?auto_64727 ) ) ( not ( = ?auto_64725 ?auto_64728 ) ) ( not ( = ?auto_64725 ?auto_64729 ) ) ( not ( = ?auto_64725 ?auto_64730 ) ) ( not ( = ?auto_64726 ?auto_64727 ) ) ( not ( = ?auto_64726 ?auto_64728 ) ) ( not ( = ?auto_64726 ?auto_64729 ) ) ( not ( = ?auto_64726 ?auto_64730 ) ) ( not ( = ?auto_64727 ?auto_64728 ) ) ( not ( = ?auto_64727 ?auto_64729 ) ) ( not ( = ?auto_64727 ?auto_64730 ) ) ( not ( = ?auto_64728 ?auto_64729 ) ) ( not ( = ?auto_64728 ?auto_64730 ) ) ( not ( = ?auto_64729 ?auto_64730 ) ) ( ON-TABLE ?auto_64730 ) ( ON ?auto_64729 ?auto_64730 ) ( ON ?auto_64728 ?auto_64729 ) ( ON ?auto_64727 ?auto_64728 ) ( CLEAR ?auto_64725 ) ( ON ?auto_64726 ?auto_64727 ) ( CLEAR ?auto_64726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64730 ?auto_64729 ?auto_64728 ?auto_64727 )
      ( MAKE-6PILE ?auto_64725 ?auto_64726 ?auto_64727 ?auto_64728 ?auto_64729 ?auto_64730 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64731 - BLOCK
      ?auto_64732 - BLOCK
      ?auto_64733 - BLOCK
      ?auto_64734 - BLOCK
      ?auto_64735 - BLOCK
      ?auto_64736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64731 ?auto_64732 ) ) ( not ( = ?auto_64731 ?auto_64733 ) ) ( not ( = ?auto_64731 ?auto_64734 ) ) ( not ( = ?auto_64731 ?auto_64735 ) ) ( not ( = ?auto_64731 ?auto_64736 ) ) ( not ( = ?auto_64732 ?auto_64733 ) ) ( not ( = ?auto_64732 ?auto_64734 ) ) ( not ( = ?auto_64732 ?auto_64735 ) ) ( not ( = ?auto_64732 ?auto_64736 ) ) ( not ( = ?auto_64733 ?auto_64734 ) ) ( not ( = ?auto_64733 ?auto_64735 ) ) ( not ( = ?auto_64733 ?auto_64736 ) ) ( not ( = ?auto_64734 ?auto_64735 ) ) ( not ( = ?auto_64734 ?auto_64736 ) ) ( not ( = ?auto_64735 ?auto_64736 ) ) ( ON-TABLE ?auto_64736 ) ( ON ?auto_64735 ?auto_64736 ) ( ON ?auto_64734 ?auto_64735 ) ( ON ?auto_64733 ?auto_64734 ) ( ON ?auto_64732 ?auto_64733 ) ( CLEAR ?auto_64732 ) ( HOLDING ?auto_64731 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64731 )
      ( MAKE-6PILE ?auto_64731 ?auto_64732 ?auto_64733 ?auto_64734 ?auto_64735 ?auto_64736 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64737 - BLOCK
      ?auto_64738 - BLOCK
      ?auto_64739 - BLOCK
      ?auto_64740 - BLOCK
      ?auto_64741 - BLOCK
      ?auto_64742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64737 ?auto_64738 ) ) ( not ( = ?auto_64737 ?auto_64739 ) ) ( not ( = ?auto_64737 ?auto_64740 ) ) ( not ( = ?auto_64737 ?auto_64741 ) ) ( not ( = ?auto_64737 ?auto_64742 ) ) ( not ( = ?auto_64738 ?auto_64739 ) ) ( not ( = ?auto_64738 ?auto_64740 ) ) ( not ( = ?auto_64738 ?auto_64741 ) ) ( not ( = ?auto_64738 ?auto_64742 ) ) ( not ( = ?auto_64739 ?auto_64740 ) ) ( not ( = ?auto_64739 ?auto_64741 ) ) ( not ( = ?auto_64739 ?auto_64742 ) ) ( not ( = ?auto_64740 ?auto_64741 ) ) ( not ( = ?auto_64740 ?auto_64742 ) ) ( not ( = ?auto_64741 ?auto_64742 ) ) ( ON-TABLE ?auto_64742 ) ( ON ?auto_64741 ?auto_64742 ) ( ON ?auto_64740 ?auto_64741 ) ( ON ?auto_64739 ?auto_64740 ) ( ON ?auto_64738 ?auto_64739 ) ( ON ?auto_64737 ?auto_64738 ) ( CLEAR ?auto_64737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64742 ?auto_64741 ?auto_64740 ?auto_64739 ?auto_64738 )
      ( MAKE-6PILE ?auto_64737 ?auto_64738 ?auto_64739 ?auto_64740 ?auto_64741 ?auto_64742 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64743 - BLOCK
      ?auto_64744 - BLOCK
      ?auto_64745 - BLOCK
      ?auto_64746 - BLOCK
      ?auto_64747 - BLOCK
      ?auto_64748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64743 ?auto_64744 ) ) ( not ( = ?auto_64743 ?auto_64745 ) ) ( not ( = ?auto_64743 ?auto_64746 ) ) ( not ( = ?auto_64743 ?auto_64747 ) ) ( not ( = ?auto_64743 ?auto_64748 ) ) ( not ( = ?auto_64744 ?auto_64745 ) ) ( not ( = ?auto_64744 ?auto_64746 ) ) ( not ( = ?auto_64744 ?auto_64747 ) ) ( not ( = ?auto_64744 ?auto_64748 ) ) ( not ( = ?auto_64745 ?auto_64746 ) ) ( not ( = ?auto_64745 ?auto_64747 ) ) ( not ( = ?auto_64745 ?auto_64748 ) ) ( not ( = ?auto_64746 ?auto_64747 ) ) ( not ( = ?auto_64746 ?auto_64748 ) ) ( not ( = ?auto_64747 ?auto_64748 ) ) ( ON-TABLE ?auto_64748 ) ( ON ?auto_64747 ?auto_64748 ) ( ON ?auto_64746 ?auto_64747 ) ( ON ?auto_64745 ?auto_64746 ) ( ON ?auto_64744 ?auto_64745 ) ( HOLDING ?auto_64743 ) ( CLEAR ?auto_64744 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64748 ?auto_64747 ?auto_64746 ?auto_64745 ?auto_64744 ?auto_64743 )
      ( MAKE-6PILE ?auto_64743 ?auto_64744 ?auto_64745 ?auto_64746 ?auto_64747 ?auto_64748 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64749 - BLOCK
      ?auto_64750 - BLOCK
      ?auto_64751 - BLOCK
      ?auto_64752 - BLOCK
      ?auto_64753 - BLOCK
      ?auto_64754 - BLOCK
    )
    :vars
    (
      ?auto_64755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64749 ?auto_64750 ) ) ( not ( = ?auto_64749 ?auto_64751 ) ) ( not ( = ?auto_64749 ?auto_64752 ) ) ( not ( = ?auto_64749 ?auto_64753 ) ) ( not ( = ?auto_64749 ?auto_64754 ) ) ( not ( = ?auto_64750 ?auto_64751 ) ) ( not ( = ?auto_64750 ?auto_64752 ) ) ( not ( = ?auto_64750 ?auto_64753 ) ) ( not ( = ?auto_64750 ?auto_64754 ) ) ( not ( = ?auto_64751 ?auto_64752 ) ) ( not ( = ?auto_64751 ?auto_64753 ) ) ( not ( = ?auto_64751 ?auto_64754 ) ) ( not ( = ?auto_64752 ?auto_64753 ) ) ( not ( = ?auto_64752 ?auto_64754 ) ) ( not ( = ?auto_64753 ?auto_64754 ) ) ( ON-TABLE ?auto_64754 ) ( ON ?auto_64753 ?auto_64754 ) ( ON ?auto_64752 ?auto_64753 ) ( ON ?auto_64751 ?auto_64752 ) ( ON ?auto_64750 ?auto_64751 ) ( CLEAR ?auto_64750 ) ( ON ?auto_64749 ?auto_64755 ) ( CLEAR ?auto_64749 ) ( HAND-EMPTY ) ( not ( = ?auto_64749 ?auto_64755 ) ) ( not ( = ?auto_64750 ?auto_64755 ) ) ( not ( = ?auto_64751 ?auto_64755 ) ) ( not ( = ?auto_64752 ?auto_64755 ) ) ( not ( = ?auto_64753 ?auto_64755 ) ) ( not ( = ?auto_64754 ?auto_64755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64749 ?auto_64755 )
      ( MAKE-6PILE ?auto_64749 ?auto_64750 ?auto_64751 ?auto_64752 ?auto_64753 ?auto_64754 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64756 - BLOCK
      ?auto_64757 - BLOCK
      ?auto_64758 - BLOCK
      ?auto_64759 - BLOCK
      ?auto_64760 - BLOCK
      ?auto_64761 - BLOCK
    )
    :vars
    (
      ?auto_64762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64756 ?auto_64757 ) ) ( not ( = ?auto_64756 ?auto_64758 ) ) ( not ( = ?auto_64756 ?auto_64759 ) ) ( not ( = ?auto_64756 ?auto_64760 ) ) ( not ( = ?auto_64756 ?auto_64761 ) ) ( not ( = ?auto_64757 ?auto_64758 ) ) ( not ( = ?auto_64757 ?auto_64759 ) ) ( not ( = ?auto_64757 ?auto_64760 ) ) ( not ( = ?auto_64757 ?auto_64761 ) ) ( not ( = ?auto_64758 ?auto_64759 ) ) ( not ( = ?auto_64758 ?auto_64760 ) ) ( not ( = ?auto_64758 ?auto_64761 ) ) ( not ( = ?auto_64759 ?auto_64760 ) ) ( not ( = ?auto_64759 ?auto_64761 ) ) ( not ( = ?auto_64760 ?auto_64761 ) ) ( ON-TABLE ?auto_64761 ) ( ON ?auto_64760 ?auto_64761 ) ( ON ?auto_64759 ?auto_64760 ) ( ON ?auto_64758 ?auto_64759 ) ( ON ?auto_64756 ?auto_64762 ) ( CLEAR ?auto_64756 ) ( not ( = ?auto_64756 ?auto_64762 ) ) ( not ( = ?auto_64757 ?auto_64762 ) ) ( not ( = ?auto_64758 ?auto_64762 ) ) ( not ( = ?auto_64759 ?auto_64762 ) ) ( not ( = ?auto_64760 ?auto_64762 ) ) ( not ( = ?auto_64761 ?auto_64762 ) ) ( HOLDING ?auto_64757 ) ( CLEAR ?auto_64758 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64761 ?auto_64760 ?auto_64759 ?auto_64758 ?auto_64757 )
      ( MAKE-6PILE ?auto_64756 ?auto_64757 ?auto_64758 ?auto_64759 ?auto_64760 ?auto_64761 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64763 - BLOCK
      ?auto_64764 - BLOCK
      ?auto_64765 - BLOCK
      ?auto_64766 - BLOCK
      ?auto_64767 - BLOCK
      ?auto_64768 - BLOCK
    )
    :vars
    (
      ?auto_64769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64763 ?auto_64764 ) ) ( not ( = ?auto_64763 ?auto_64765 ) ) ( not ( = ?auto_64763 ?auto_64766 ) ) ( not ( = ?auto_64763 ?auto_64767 ) ) ( not ( = ?auto_64763 ?auto_64768 ) ) ( not ( = ?auto_64764 ?auto_64765 ) ) ( not ( = ?auto_64764 ?auto_64766 ) ) ( not ( = ?auto_64764 ?auto_64767 ) ) ( not ( = ?auto_64764 ?auto_64768 ) ) ( not ( = ?auto_64765 ?auto_64766 ) ) ( not ( = ?auto_64765 ?auto_64767 ) ) ( not ( = ?auto_64765 ?auto_64768 ) ) ( not ( = ?auto_64766 ?auto_64767 ) ) ( not ( = ?auto_64766 ?auto_64768 ) ) ( not ( = ?auto_64767 ?auto_64768 ) ) ( ON-TABLE ?auto_64768 ) ( ON ?auto_64767 ?auto_64768 ) ( ON ?auto_64766 ?auto_64767 ) ( ON ?auto_64765 ?auto_64766 ) ( ON ?auto_64763 ?auto_64769 ) ( not ( = ?auto_64763 ?auto_64769 ) ) ( not ( = ?auto_64764 ?auto_64769 ) ) ( not ( = ?auto_64765 ?auto_64769 ) ) ( not ( = ?auto_64766 ?auto_64769 ) ) ( not ( = ?auto_64767 ?auto_64769 ) ) ( not ( = ?auto_64768 ?auto_64769 ) ) ( CLEAR ?auto_64765 ) ( ON ?auto_64764 ?auto_64763 ) ( CLEAR ?auto_64764 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64769 ?auto_64763 )
      ( MAKE-6PILE ?auto_64763 ?auto_64764 ?auto_64765 ?auto_64766 ?auto_64767 ?auto_64768 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64770 - BLOCK
      ?auto_64771 - BLOCK
      ?auto_64772 - BLOCK
      ?auto_64773 - BLOCK
      ?auto_64774 - BLOCK
      ?auto_64775 - BLOCK
    )
    :vars
    (
      ?auto_64776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64770 ?auto_64771 ) ) ( not ( = ?auto_64770 ?auto_64772 ) ) ( not ( = ?auto_64770 ?auto_64773 ) ) ( not ( = ?auto_64770 ?auto_64774 ) ) ( not ( = ?auto_64770 ?auto_64775 ) ) ( not ( = ?auto_64771 ?auto_64772 ) ) ( not ( = ?auto_64771 ?auto_64773 ) ) ( not ( = ?auto_64771 ?auto_64774 ) ) ( not ( = ?auto_64771 ?auto_64775 ) ) ( not ( = ?auto_64772 ?auto_64773 ) ) ( not ( = ?auto_64772 ?auto_64774 ) ) ( not ( = ?auto_64772 ?auto_64775 ) ) ( not ( = ?auto_64773 ?auto_64774 ) ) ( not ( = ?auto_64773 ?auto_64775 ) ) ( not ( = ?auto_64774 ?auto_64775 ) ) ( ON-TABLE ?auto_64775 ) ( ON ?auto_64774 ?auto_64775 ) ( ON ?auto_64773 ?auto_64774 ) ( ON ?auto_64770 ?auto_64776 ) ( not ( = ?auto_64770 ?auto_64776 ) ) ( not ( = ?auto_64771 ?auto_64776 ) ) ( not ( = ?auto_64772 ?auto_64776 ) ) ( not ( = ?auto_64773 ?auto_64776 ) ) ( not ( = ?auto_64774 ?auto_64776 ) ) ( not ( = ?auto_64775 ?auto_64776 ) ) ( ON ?auto_64771 ?auto_64770 ) ( CLEAR ?auto_64771 ) ( ON-TABLE ?auto_64776 ) ( HOLDING ?auto_64772 ) ( CLEAR ?auto_64773 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64775 ?auto_64774 ?auto_64773 ?auto_64772 )
      ( MAKE-6PILE ?auto_64770 ?auto_64771 ?auto_64772 ?auto_64773 ?auto_64774 ?auto_64775 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64777 - BLOCK
      ?auto_64778 - BLOCK
      ?auto_64779 - BLOCK
      ?auto_64780 - BLOCK
      ?auto_64781 - BLOCK
      ?auto_64782 - BLOCK
    )
    :vars
    (
      ?auto_64783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64777 ?auto_64778 ) ) ( not ( = ?auto_64777 ?auto_64779 ) ) ( not ( = ?auto_64777 ?auto_64780 ) ) ( not ( = ?auto_64777 ?auto_64781 ) ) ( not ( = ?auto_64777 ?auto_64782 ) ) ( not ( = ?auto_64778 ?auto_64779 ) ) ( not ( = ?auto_64778 ?auto_64780 ) ) ( not ( = ?auto_64778 ?auto_64781 ) ) ( not ( = ?auto_64778 ?auto_64782 ) ) ( not ( = ?auto_64779 ?auto_64780 ) ) ( not ( = ?auto_64779 ?auto_64781 ) ) ( not ( = ?auto_64779 ?auto_64782 ) ) ( not ( = ?auto_64780 ?auto_64781 ) ) ( not ( = ?auto_64780 ?auto_64782 ) ) ( not ( = ?auto_64781 ?auto_64782 ) ) ( ON-TABLE ?auto_64782 ) ( ON ?auto_64781 ?auto_64782 ) ( ON ?auto_64780 ?auto_64781 ) ( ON ?auto_64777 ?auto_64783 ) ( not ( = ?auto_64777 ?auto_64783 ) ) ( not ( = ?auto_64778 ?auto_64783 ) ) ( not ( = ?auto_64779 ?auto_64783 ) ) ( not ( = ?auto_64780 ?auto_64783 ) ) ( not ( = ?auto_64781 ?auto_64783 ) ) ( not ( = ?auto_64782 ?auto_64783 ) ) ( ON ?auto_64778 ?auto_64777 ) ( ON-TABLE ?auto_64783 ) ( CLEAR ?auto_64780 ) ( ON ?auto_64779 ?auto_64778 ) ( CLEAR ?auto_64779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64783 ?auto_64777 ?auto_64778 )
      ( MAKE-6PILE ?auto_64777 ?auto_64778 ?auto_64779 ?auto_64780 ?auto_64781 ?auto_64782 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64784 - BLOCK
      ?auto_64785 - BLOCK
      ?auto_64786 - BLOCK
      ?auto_64787 - BLOCK
      ?auto_64788 - BLOCK
      ?auto_64789 - BLOCK
    )
    :vars
    (
      ?auto_64790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64784 ?auto_64785 ) ) ( not ( = ?auto_64784 ?auto_64786 ) ) ( not ( = ?auto_64784 ?auto_64787 ) ) ( not ( = ?auto_64784 ?auto_64788 ) ) ( not ( = ?auto_64784 ?auto_64789 ) ) ( not ( = ?auto_64785 ?auto_64786 ) ) ( not ( = ?auto_64785 ?auto_64787 ) ) ( not ( = ?auto_64785 ?auto_64788 ) ) ( not ( = ?auto_64785 ?auto_64789 ) ) ( not ( = ?auto_64786 ?auto_64787 ) ) ( not ( = ?auto_64786 ?auto_64788 ) ) ( not ( = ?auto_64786 ?auto_64789 ) ) ( not ( = ?auto_64787 ?auto_64788 ) ) ( not ( = ?auto_64787 ?auto_64789 ) ) ( not ( = ?auto_64788 ?auto_64789 ) ) ( ON-TABLE ?auto_64789 ) ( ON ?auto_64788 ?auto_64789 ) ( ON ?auto_64784 ?auto_64790 ) ( not ( = ?auto_64784 ?auto_64790 ) ) ( not ( = ?auto_64785 ?auto_64790 ) ) ( not ( = ?auto_64786 ?auto_64790 ) ) ( not ( = ?auto_64787 ?auto_64790 ) ) ( not ( = ?auto_64788 ?auto_64790 ) ) ( not ( = ?auto_64789 ?auto_64790 ) ) ( ON ?auto_64785 ?auto_64784 ) ( ON-TABLE ?auto_64790 ) ( ON ?auto_64786 ?auto_64785 ) ( CLEAR ?auto_64786 ) ( HOLDING ?auto_64787 ) ( CLEAR ?auto_64788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64789 ?auto_64788 ?auto_64787 )
      ( MAKE-6PILE ?auto_64784 ?auto_64785 ?auto_64786 ?auto_64787 ?auto_64788 ?auto_64789 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64791 - BLOCK
      ?auto_64792 - BLOCK
      ?auto_64793 - BLOCK
      ?auto_64794 - BLOCK
      ?auto_64795 - BLOCK
      ?auto_64796 - BLOCK
    )
    :vars
    (
      ?auto_64797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64791 ?auto_64792 ) ) ( not ( = ?auto_64791 ?auto_64793 ) ) ( not ( = ?auto_64791 ?auto_64794 ) ) ( not ( = ?auto_64791 ?auto_64795 ) ) ( not ( = ?auto_64791 ?auto_64796 ) ) ( not ( = ?auto_64792 ?auto_64793 ) ) ( not ( = ?auto_64792 ?auto_64794 ) ) ( not ( = ?auto_64792 ?auto_64795 ) ) ( not ( = ?auto_64792 ?auto_64796 ) ) ( not ( = ?auto_64793 ?auto_64794 ) ) ( not ( = ?auto_64793 ?auto_64795 ) ) ( not ( = ?auto_64793 ?auto_64796 ) ) ( not ( = ?auto_64794 ?auto_64795 ) ) ( not ( = ?auto_64794 ?auto_64796 ) ) ( not ( = ?auto_64795 ?auto_64796 ) ) ( ON-TABLE ?auto_64796 ) ( ON ?auto_64795 ?auto_64796 ) ( ON ?auto_64791 ?auto_64797 ) ( not ( = ?auto_64791 ?auto_64797 ) ) ( not ( = ?auto_64792 ?auto_64797 ) ) ( not ( = ?auto_64793 ?auto_64797 ) ) ( not ( = ?auto_64794 ?auto_64797 ) ) ( not ( = ?auto_64795 ?auto_64797 ) ) ( not ( = ?auto_64796 ?auto_64797 ) ) ( ON ?auto_64792 ?auto_64791 ) ( ON-TABLE ?auto_64797 ) ( ON ?auto_64793 ?auto_64792 ) ( CLEAR ?auto_64795 ) ( ON ?auto_64794 ?auto_64793 ) ( CLEAR ?auto_64794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64797 ?auto_64791 ?auto_64792 ?auto_64793 )
      ( MAKE-6PILE ?auto_64791 ?auto_64792 ?auto_64793 ?auto_64794 ?auto_64795 ?auto_64796 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64798 - BLOCK
      ?auto_64799 - BLOCK
      ?auto_64800 - BLOCK
      ?auto_64801 - BLOCK
      ?auto_64802 - BLOCK
      ?auto_64803 - BLOCK
    )
    :vars
    (
      ?auto_64804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64798 ?auto_64799 ) ) ( not ( = ?auto_64798 ?auto_64800 ) ) ( not ( = ?auto_64798 ?auto_64801 ) ) ( not ( = ?auto_64798 ?auto_64802 ) ) ( not ( = ?auto_64798 ?auto_64803 ) ) ( not ( = ?auto_64799 ?auto_64800 ) ) ( not ( = ?auto_64799 ?auto_64801 ) ) ( not ( = ?auto_64799 ?auto_64802 ) ) ( not ( = ?auto_64799 ?auto_64803 ) ) ( not ( = ?auto_64800 ?auto_64801 ) ) ( not ( = ?auto_64800 ?auto_64802 ) ) ( not ( = ?auto_64800 ?auto_64803 ) ) ( not ( = ?auto_64801 ?auto_64802 ) ) ( not ( = ?auto_64801 ?auto_64803 ) ) ( not ( = ?auto_64802 ?auto_64803 ) ) ( ON-TABLE ?auto_64803 ) ( ON ?auto_64798 ?auto_64804 ) ( not ( = ?auto_64798 ?auto_64804 ) ) ( not ( = ?auto_64799 ?auto_64804 ) ) ( not ( = ?auto_64800 ?auto_64804 ) ) ( not ( = ?auto_64801 ?auto_64804 ) ) ( not ( = ?auto_64802 ?auto_64804 ) ) ( not ( = ?auto_64803 ?auto_64804 ) ) ( ON ?auto_64799 ?auto_64798 ) ( ON-TABLE ?auto_64804 ) ( ON ?auto_64800 ?auto_64799 ) ( ON ?auto_64801 ?auto_64800 ) ( CLEAR ?auto_64801 ) ( HOLDING ?auto_64802 ) ( CLEAR ?auto_64803 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64803 ?auto_64802 )
      ( MAKE-6PILE ?auto_64798 ?auto_64799 ?auto_64800 ?auto_64801 ?auto_64802 ?auto_64803 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64805 - BLOCK
      ?auto_64806 - BLOCK
      ?auto_64807 - BLOCK
      ?auto_64808 - BLOCK
      ?auto_64809 - BLOCK
      ?auto_64810 - BLOCK
    )
    :vars
    (
      ?auto_64811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64805 ?auto_64806 ) ) ( not ( = ?auto_64805 ?auto_64807 ) ) ( not ( = ?auto_64805 ?auto_64808 ) ) ( not ( = ?auto_64805 ?auto_64809 ) ) ( not ( = ?auto_64805 ?auto_64810 ) ) ( not ( = ?auto_64806 ?auto_64807 ) ) ( not ( = ?auto_64806 ?auto_64808 ) ) ( not ( = ?auto_64806 ?auto_64809 ) ) ( not ( = ?auto_64806 ?auto_64810 ) ) ( not ( = ?auto_64807 ?auto_64808 ) ) ( not ( = ?auto_64807 ?auto_64809 ) ) ( not ( = ?auto_64807 ?auto_64810 ) ) ( not ( = ?auto_64808 ?auto_64809 ) ) ( not ( = ?auto_64808 ?auto_64810 ) ) ( not ( = ?auto_64809 ?auto_64810 ) ) ( ON-TABLE ?auto_64810 ) ( ON ?auto_64805 ?auto_64811 ) ( not ( = ?auto_64805 ?auto_64811 ) ) ( not ( = ?auto_64806 ?auto_64811 ) ) ( not ( = ?auto_64807 ?auto_64811 ) ) ( not ( = ?auto_64808 ?auto_64811 ) ) ( not ( = ?auto_64809 ?auto_64811 ) ) ( not ( = ?auto_64810 ?auto_64811 ) ) ( ON ?auto_64806 ?auto_64805 ) ( ON-TABLE ?auto_64811 ) ( ON ?auto_64807 ?auto_64806 ) ( ON ?auto_64808 ?auto_64807 ) ( CLEAR ?auto_64810 ) ( ON ?auto_64809 ?auto_64808 ) ( CLEAR ?auto_64809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64811 ?auto_64805 ?auto_64806 ?auto_64807 ?auto_64808 )
      ( MAKE-6PILE ?auto_64805 ?auto_64806 ?auto_64807 ?auto_64808 ?auto_64809 ?auto_64810 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64812 - BLOCK
      ?auto_64813 - BLOCK
      ?auto_64814 - BLOCK
      ?auto_64815 - BLOCK
      ?auto_64816 - BLOCK
      ?auto_64817 - BLOCK
    )
    :vars
    (
      ?auto_64818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64812 ?auto_64813 ) ) ( not ( = ?auto_64812 ?auto_64814 ) ) ( not ( = ?auto_64812 ?auto_64815 ) ) ( not ( = ?auto_64812 ?auto_64816 ) ) ( not ( = ?auto_64812 ?auto_64817 ) ) ( not ( = ?auto_64813 ?auto_64814 ) ) ( not ( = ?auto_64813 ?auto_64815 ) ) ( not ( = ?auto_64813 ?auto_64816 ) ) ( not ( = ?auto_64813 ?auto_64817 ) ) ( not ( = ?auto_64814 ?auto_64815 ) ) ( not ( = ?auto_64814 ?auto_64816 ) ) ( not ( = ?auto_64814 ?auto_64817 ) ) ( not ( = ?auto_64815 ?auto_64816 ) ) ( not ( = ?auto_64815 ?auto_64817 ) ) ( not ( = ?auto_64816 ?auto_64817 ) ) ( ON ?auto_64812 ?auto_64818 ) ( not ( = ?auto_64812 ?auto_64818 ) ) ( not ( = ?auto_64813 ?auto_64818 ) ) ( not ( = ?auto_64814 ?auto_64818 ) ) ( not ( = ?auto_64815 ?auto_64818 ) ) ( not ( = ?auto_64816 ?auto_64818 ) ) ( not ( = ?auto_64817 ?auto_64818 ) ) ( ON ?auto_64813 ?auto_64812 ) ( ON-TABLE ?auto_64818 ) ( ON ?auto_64814 ?auto_64813 ) ( ON ?auto_64815 ?auto_64814 ) ( ON ?auto_64816 ?auto_64815 ) ( CLEAR ?auto_64816 ) ( HOLDING ?auto_64817 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64817 )
      ( MAKE-6PILE ?auto_64812 ?auto_64813 ?auto_64814 ?auto_64815 ?auto_64816 ?auto_64817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64819 - BLOCK
      ?auto_64820 - BLOCK
      ?auto_64821 - BLOCK
      ?auto_64822 - BLOCK
      ?auto_64823 - BLOCK
      ?auto_64824 - BLOCK
    )
    :vars
    (
      ?auto_64825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64819 ?auto_64820 ) ) ( not ( = ?auto_64819 ?auto_64821 ) ) ( not ( = ?auto_64819 ?auto_64822 ) ) ( not ( = ?auto_64819 ?auto_64823 ) ) ( not ( = ?auto_64819 ?auto_64824 ) ) ( not ( = ?auto_64820 ?auto_64821 ) ) ( not ( = ?auto_64820 ?auto_64822 ) ) ( not ( = ?auto_64820 ?auto_64823 ) ) ( not ( = ?auto_64820 ?auto_64824 ) ) ( not ( = ?auto_64821 ?auto_64822 ) ) ( not ( = ?auto_64821 ?auto_64823 ) ) ( not ( = ?auto_64821 ?auto_64824 ) ) ( not ( = ?auto_64822 ?auto_64823 ) ) ( not ( = ?auto_64822 ?auto_64824 ) ) ( not ( = ?auto_64823 ?auto_64824 ) ) ( ON ?auto_64819 ?auto_64825 ) ( not ( = ?auto_64819 ?auto_64825 ) ) ( not ( = ?auto_64820 ?auto_64825 ) ) ( not ( = ?auto_64821 ?auto_64825 ) ) ( not ( = ?auto_64822 ?auto_64825 ) ) ( not ( = ?auto_64823 ?auto_64825 ) ) ( not ( = ?auto_64824 ?auto_64825 ) ) ( ON ?auto_64820 ?auto_64819 ) ( ON-TABLE ?auto_64825 ) ( ON ?auto_64821 ?auto_64820 ) ( ON ?auto_64822 ?auto_64821 ) ( ON ?auto_64823 ?auto_64822 ) ( ON ?auto_64824 ?auto_64823 ) ( CLEAR ?auto_64824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64825 ?auto_64819 ?auto_64820 ?auto_64821 ?auto_64822 ?auto_64823 )
      ( MAKE-6PILE ?auto_64819 ?auto_64820 ?auto_64821 ?auto_64822 ?auto_64823 ?auto_64824 ) )
  )

)

