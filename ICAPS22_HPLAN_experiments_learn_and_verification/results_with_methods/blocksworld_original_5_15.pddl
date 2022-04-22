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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34005 - BLOCK
      ?auto_34006 - BLOCK
      ?auto_34007 - BLOCK
      ?auto_34008 - BLOCK
      ?auto_34009 - BLOCK
    )
    :vars
    (
      ?auto_34010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34010 ?auto_34009 ) ( CLEAR ?auto_34010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34005 ) ( ON ?auto_34006 ?auto_34005 ) ( ON ?auto_34007 ?auto_34006 ) ( ON ?auto_34008 ?auto_34007 ) ( ON ?auto_34009 ?auto_34008 ) ( not ( = ?auto_34005 ?auto_34006 ) ) ( not ( = ?auto_34005 ?auto_34007 ) ) ( not ( = ?auto_34005 ?auto_34008 ) ) ( not ( = ?auto_34005 ?auto_34009 ) ) ( not ( = ?auto_34005 ?auto_34010 ) ) ( not ( = ?auto_34006 ?auto_34007 ) ) ( not ( = ?auto_34006 ?auto_34008 ) ) ( not ( = ?auto_34006 ?auto_34009 ) ) ( not ( = ?auto_34006 ?auto_34010 ) ) ( not ( = ?auto_34007 ?auto_34008 ) ) ( not ( = ?auto_34007 ?auto_34009 ) ) ( not ( = ?auto_34007 ?auto_34010 ) ) ( not ( = ?auto_34008 ?auto_34009 ) ) ( not ( = ?auto_34008 ?auto_34010 ) ) ( not ( = ?auto_34009 ?auto_34010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34010 ?auto_34009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34012 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34012 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_34012 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34013 - BLOCK
    )
    :vars
    (
      ?auto_34014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34013 ?auto_34014 ) ( CLEAR ?auto_34013 ) ( HAND-EMPTY ) ( not ( = ?auto_34013 ?auto_34014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34013 ?auto_34014 )
      ( MAKE-1PILE ?auto_34013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34019 - BLOCK
      ?auto_34020 - BLOCK
      ?auto_34021 - BLOCK
      ?auto_34022 - BLOCK
    )
    :vars
    (
      ?auto_34023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34023 ?auto_34022 ) ( CLEAR ?auto_34023 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34019 ) ( ON ?auto_34020 ?auto_34019 ) ( ON ?auto_34021 ?auto_34020 ) ( ON ?auto_34022 ?auto_34021 ) ( not ( = ?auto_34019 ?auto_34020 ) ) ( not ( = ?auto_34019 ?auto_34021 ) ) ( not ( = ?auto_34019 ?auto_34022 ) ) ( not ( = ?auto_34019 ?auto_34023 ) ) ( not ( = ?auto_34020 ?auto_34021 ) ) ( not ( = ?auto_34020 ?auto_34022 ) ) ( not ( = ?auto_34020 ?auto_34023 ) ) ( not ( = ?auto_34021 ?auto_34022 ) ) ( not ( = ?auto_34021 ?auto_34023 ) ) ( not ( = ?auto_34022 ?auto_34023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34023 ?auto_34022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34024 - BLOCK
      ?auto_34025 - BLOCK
      ?auto_34026 - BLOCK
      ?auto_34027 - BLOCK
    )
    :vars
    (
      ?auto_34028 - BLOCK
      ?auto_34029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34028 ?auto_34027 ) ( CLEAR ?auto_34028 ) ( ON-TABLE ?auto_34024 ) ( ON ?auto_34025 ?auto_34024 ) ( ON ?auto_34026 ?auto_34025 ) ( ON ?auto_34027 ?auto_34026 ) ( not ( = ?auto_34024 ?auto_34025 ) ) ( not ( = ?auto_34024 ?auto_34026 ) ) ( not ( = ?auto_34024 ?auto_34027 ) ) ( not ( = ?auto_34024 ?auto_34028 ) ) ( not ( = ?auto_34025 ?auto_34026 ) ) ( not ( = ?auto_34025 ?auto_34027 ) ) ( not ( = ?auto_34025 ?auto_34028 ) ) ( not ( = ?auto_34026 ?auto_34027 ) ) ( not ( = ?auto_34026 ?auto_34028 ) ) ( not ( = ?auto_34027 ?auto_34028 ) ) ( HOLDING ?auto_34029 ) ( not ( = ?auto_34024 ?auto_34029 ) ) ( not ( = ?auto_34025 ?auto_34029 ) ) ( not ( = ?auto_34026 ?auto_34029 ) ) ( not ( = ?auto_34027 ?auto_34029 ) ) ( not ( = ?auto_34028 ?auto_34029 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_34029 )
      ( MAKE-4PILE ?auto_34024 ?auto_34025 ?auto_34026 ?auto_34027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34030 - BLOCK
      ?auto_34031 - BLOCK
      ?auto_34032 - BLOCK
      ?auto_34033 - BLOCK
    )
    :vars
    (
      ?auto_34034 - BLOCK
      ?auto_34035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34034 ?auto_34033 ) ( ON-TABLE ?auto_34030 ) ( ON ?auto_34031 ?auto_34030 ) ( ON ?auto_34032 ?auto_34031 ) ( ON ?auto_34033 ?auto_34032 ) ( not ( = ?auto_34030 ?auto_34031 ) ) ( not ( = ?auto_34030 ?auto_34032 ) ) ( not ( = ?auto_34030 ?auto_34033 ) ) ( not ( = ?auto_34030 ?auto_34034 ) ) ( not ( = ?auto_34031 ?auto_34032 ) ) ( not ( = ?auto_34031 ?auto_34033 ) ) ( not ( = ?auto_34031 ?auto_34034 ) ) ( not ( = ?auto_34032 ?auto_34033 ) ) ( not ( = ?auto_34032 ?auto_34034 ) ) ( not ( = ?auto_34033 ?auto_34034 ) ) ( not ( = ?auto_34030 ?auto_34035 ) ) ( not ( = ?auto_34031 ?auto_34035 ) ) ( not ( = ?auto_34032 ?auto_34035 ) ) ( not ( = ?auto_34033 ?auto_34035 ) ) ( not ( = ?auto_34034 ?auto_34035 ) ) ( ON ?auto_34035 ?auto_34034 ) ( CLEAR ?auto_34035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34030 ?auto_34031 ?auto_34032 ?auto_34033 ?auto_34034 )
      ( MAKE-4PILE ?auto_34030 ?auto_34031 ?auto_34032 ?auto_34033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34038 - BLOCK
      ?auto_34039 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34039 ) ( CLEAR ?auto_34038 ) ( ON-TABLE ?auto_34038 ) ( not ( = ?auto_34038 ?auto_34039 ) ) )
    :subtasks
    ( ( !STACK ?auto_34039 ?auto_34038 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34040 - BLOCK
      ?auto_34041 - BLOCK
    )
    :vars
    (
      ?auto_34042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34040 ) ( ON-TABLE ?auto_34040 ) ( not ( = ?auto_34040 ?auto_34041 ) ) ( ON ?auto_34041 ?auto_34042 ) ( CLEAR ?auto_34041 ) ( HAND-EMPTY ) ( not ( = ?auto_34040 ?auto_34042 ) ) ( not ( = ?auto_34041 ?auto_34042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34041 ?auto_34042 )
      ( MAKE-2PILE ?auto_34040 ?auto_34041 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34043 - BLOCK
      ?auto_34044 - BLOCK
    )
    :vars
    (
      ?auto_34045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34043 ?auto_34044 ) ) ( ON ?auto_34044 ?auto_34045 ) ( CLEAR ?auto_34044 ) ( not ( = ?auto_34043 ?auto_34045 ) ) ( not ( = ?auto_34044 ?auto_34045 ) ) ( HOLDING ?auto_34043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34043 )
      ( MAKE-2PILE ?auto_34043 ?auto_34044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34046 - BLOCK
      ?auto_34047 - BLOCK
    )
    :vars
    (
      ?auto_34048 - BLOCK
      ?auto_34050 - BLOCK
      ?auto_34051 - BLOCK
      ?auto_34049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34046 ?auto_34047 ) ) ( ON ?auto_34047 ?auto_34048 ) ( not ( = ?auto_34046 ?auto_34048 ) ) ( not ( = ?auto_34047 ?auto_34048 ) ) ( ON ?auto_34046 ?auto_34047 ) ( CLEAR ?auto_34046 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34050 ) ( ON ?auto_34051 ?auto_34050 ) ( ON ?auto_34049 ?auto_34051 ) ( ON ?auto_34048 ?auto_34049 ) ( not ( = ?auto_34050 ?auto_34051 ) ) ( not ( = ?auto_34050 ?auto_34049 ) ) ( not ( = ?auto_34050 ?auto_34048 ) ) ( not ( = ?auto_34050 ?auto_34047 ) ) ( not ( = ?auto_34050 ?auto_34046 ) ) ( not ( = ?auto_34051 ?auto_34049 ) ) ( not ( = ?auto_34051 ?auto_34048 ) ) ( not ( = ?auto_34051 ?auto_34047 ) ) ( not ( = ?auto_34051 ?auto_34046 ) ) ( not ( = ?auto_34049 ?auto_34048 ) ) ( not ( = ?auto_34049 ?auto_34047 ) ) ( not ( = ?auto_34049 ?auto_34046 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34050 ?auto_34051 ?auto_34049 ?auto_34048 ?auto_34047 )
      ( MAKE-2PILE ?auto_34046 ?auto_34047 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34055 - BLOCK
      ?auto_34056 - BLOCK
      ?auto_34057 - BLOCK
    )
    :vars
    (
      ?auto_34058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34058 ?auto_34057 ) ( CLEAR ?auto_34058 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34055 ) ( ON ?auto_34056 ?auto_34055 ) ( ON ?auto_34057 ?auto_34056 ) ( not ( = ?auto_34055 ?auto_34056 ) ) ( not ( = ?auto_34055 ?auto_34057 ) ) ( not ( = ?auto_34055 ?auto_34058 ) ) ( not ( = ?auto_34056 ?auto_34057 ) ) ( not ( = ?auto_34056 ?auto_34058 ) ) ( not ( = ?auto_34057 ?auto_34058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34058 ?auto_34057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34059 - BLOCK
      ?auto_34060 - BLOCK
      ?auto_34061 - BLOCK
    )
    :vars
    (
      ?auto_34062 - BLOCK
      ?auto_34063 - BLOCK
      ?auto_34064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34062 ?auto_34061 ) ( CLEAR ?auto_34062 ) ( ON-TABLE ?auto_34059 ) ( ON ?auto_34060 ?auto_34059 ) ( ON ?auto_34061 ?auto_34060 ) ( not ( = ?auto_34059 ?auto_34060 ) ) ( not ( = ?auto_34059 ?auto_34061 ) ) ( not ( = ?auto_34059 ?auto_34062 ) ) ( not ( = ?auto_34060 ?auto_34061 ) ) ( not ( = ?auto_34060 ?auto_34062 ) ) ( not ( = ?auto_34061 ?auto_34062 ) ) ( HOLDING ?auto_34063 ) ( CLEAR ?auto_34064 ) ( not ( = ?auto_34059 ?auto_34063 ) ) ( not ( = ?auto_34059 ?auto_34064 ) ) ( not ( = ?auto_34060 ?auto_34063 ) ) ( not ( = ?auto_34060 ?auto_34064 ) ) ( not ( = ?auto_34061 ?auto_34063 ) ) ( not ( = ?auto_34061 ?auto_34064 ) ) ( not ( = ?auto_34062 ?auto_34063 ) ) ( not ( = ?auto_34062 ?auto_34064 ) ) ( not ( = ?auto_34063 ?auto_34064 ) ) )
    :subtasks
    ( ( !STACK ?auto_34063 ?auto_34064 )
      ( MAKE-3PILE ?auto_34059 ?auto_34060 ?auto_34061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34065 - BLOCK
      ?auto_34066 - BLOCK
      ?auto_34067 - BLOCK
    )
    :vars
    (
      ?auto_34069 - BLOCK
      ?auto_34068 - BLOCK
      ?auto_34070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34069 ?auto_34067 ) ( ON-TABLE ?auto_34065 ) ( ON ?auto_34066 ?auto_34065 ) ( ON ?auto_34067 ?auto_34066 ) ( not ( = ?auto_34065 ?auto_34066 ) ) ( not ( = ?auto_34065 ?auto_34067 ) ) ( not ( = ?auto_34065 ?auto_34069 ) ) ( not ( = ?auto_34066 ?auto_34067 ) ) ( not ( = ?auto_34066 ?auto_34069 ) ) ( not ( = ?auto_34067 ?auto_34069 ) ) ( CLEAR ?auto_34068 ) ( not ( = ?auto_34065 ?auto_34070 ) ) ( not ( = ?auto_34065 ?auto_34068 ) ) ( not ( = ?auto_34066 ?auto_34070 ) ) ( not ( = ?auto_34066 ?auto_34068 ) ) ( not ( = ?auto_34067 ?auto_34070 ) ) ( not ( = ?auto_34067 ?auto_34068 ) ) ( not ( = ?auto_34069 ?auto_34070 ) ) ( not ( = ?auto_34069 ?auto_34068 ) ) ( not ( = ?auto_34070 ?auto_34068 ) ) ( ON ?auto_34070 ?auto_34069 ) ( CLEAR ?auto_34070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34065 ?auto_34066 ?auto_34067 ?auto_34069 )
      ( MAKE-3PILE ?auto_34065 ?auto_34066 ?auto_34067 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34071 - BLOCK
      ?auto_34072 - BLOCK
      ?auto_34073 - BLOCK
    )
    :vars
    (
      ?auto_34074 - BLOCK
      ?auto_34075 - BLOCK
      ?auto_34076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34074 ?auto_34073 ) ( ON-TABLE ?auto_34071 ) ( ON ?auto_34072 ?auto_34071 ) ( ON ?auto_34073 ?auto_34072 ) ( not ( = ?auto_34071 ?auto_34072 ) ) ( not ( = ?auto_34071 ?auto_34073 ) ) ( not ( = ?auto_34071 ?auto_34074 ) ) ( not ( = ?auto_34072 ?auto_34073 ) ) ( not ( = ?auto_34072 ?auto_34074 ) ) ( not ( = ?auto_34073 ?auto_34074 ) ) ( not ( = ?auto_34071 ?auto_34075 ) ) ( not ( = ?auto_34071 ?auto_34076 ) ) ( not ( = ?auto_34072 ?auto_34075 ) ) ( not ( = ?auto_34072 ?auto_34076 ) ) ( not ( = ?auto_34073 ?auto_34075 ) ) ( not ( = ?auto_34073 ?auto_34076 ) ) ( not ( = ?auto_34074 ?auto_34075 ) ) ( not ( = ?auto_34074 ?auto_34076 ) ) ( not ( = ?auto_34075 ?auto_34076 ) ) ( ON ?auto_34075 ?auto_34074 ) ( CLEAR ?auto_34075 ) ( HOLDING ?auto_34076 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34076 )
      ( MAKE-3PILE ?auto_34071 ?auto_34072 ?auto_34073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34077 - BLOCK
      ?auto_34078 - BLOCK
      ?auto_34079 - BLOCK
    )
    :vars
    (
      ?auto_34080 - BLOCK
      ?auto_34082 - BLOCK
      ?auto_34081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34080 ?auto_34079 ) ( ON-TABLE ?auto_34077 ) ( ON ?auto_34078 ?auto_34077 ) ( ON ?auto_34079 ?auto_34078 ) ( not ( = ?auto_34077 ?auto_34078 ) ) ( not ( = ?auto_34077 ?auto_34079 ) ) ( not ( = ?auto_34077 ?auto_34080 ) ) ( not ( = ?auto_34078 ?auto_34079 ) ) ( not ( = ?auto_34078 ?auto_34080 ) ) ( not ( = ?auto_34079 ?auto_34080 ) ) ( not ( = ?auto_34077 ?auto_34082 ) ) ( not ( = ?auto_34077 ?auto_34081 ) ) ( not ( = ?auto_34078 ?auto_34082 ) ) ( not ( = ?auto_34078 ?auto_34081 ) ) ( not ( = ?auto_34079 ?auto_34082 ) ) ( not ( = ?auto_34079 ?auto_34081 ) ) ( not ( = ?auto_34080 ?auto_34082 ) ) ( not ( = ?auto_34080 ?auto_34081 ) ) ( not ( = ?auto_34082 ?auto_34081 ) ) ( ON ?auto_34082 ?auto_34080 ) ( ON ?auto_34081 ?auto_34082 ) ( CLEAR ?auto_34081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34077 ?auto_34078 ?auto_34079 ?auto_34080 ?auto_34082 )
      ( MAKE-3PILE ?auto_34077 ?auto_34078 ?auto_34079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34086 - BLOCK
      ?auto_34087 - BLOCK
      ?auto_34088 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34088 ) ( CLEAR ?auto_34087 ) ( ON-TABLE ?auto_34086 ) ( ON ?auto_34087 ?auto_34086 ) ( not ( = ?auto_34086 ?auto_34087 ) ) ( not ( = ?auto_34086 ?auto_34088 ) ) ( not ( = ?auto_34087 ?auto_34088 ) ) )
    :subtasks
    ( ( !STACK ?auto_34088 ?auto_34087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34089 - BLOCK
      ?auto_34090 - BLOCK
      ?auto_34091 - BLOCK
    )
    :vars
    (
      ?auto_34092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34090 ) ( ON-TABLE ?auto_34089 ) ( ON ?auto_34090 ?auto_34089 ) ( not ( = ?auto_34089 ?auto_34090 ) ) ( not ( = ?auto_34089 ?auto_34091 ) ) ( not ( = ?auto_34090 ?auto_34091 ) ) ( ON ?auto_34091 ?auto_34092 ) ( CLEAR ?auto_34091 ) ( HAND-EMPTY ) ( not ( = ?auto_34089 ?auto_34092 ) ) ( not ( = ?auto_34090 ?auto_34092 ) ) ( not ( = ?auto_34091 ?auto_34092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34091 ?auto_34092 )
      ( MAKE-3PILE ?auto_34089 ?auto_34090 ?auto_34091 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34093 - BLOCK
      ?auto_34094 - BLOCK
      ?auto_34095 - BLOCK
    )
    :vars
    (
      ?auto_34096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34093 ) ( not ( = ?auto_34093 ?auto_34094 ) ) ( not ( = ?auto_34093 ?auto_34095 ) ) ( not ( = ?auto_34094 ?auto_34095 ) ) ( ON ?auto_34095 ?auto_34096 ) ( CLEAR ?auto_34095 ) ( not ( = ?auto_34093 ?auto_34096 ) ) ( not ( = ?auto_34094 ?auto_34096 ) ) ( not ( = ?auto_34095 ?auto_34096 ) ) ( HOLDING ?auto_34094 ) ( CLEAR ?auto_34093 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34093 ?auto_34094 )
      ( MAKE-3PILE ?auto_34093 ?auto_34094 ?auto_34095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34097 - BLOCK
      ?auto_34098 - BLOCK
      ?auto_34099 - BLOCK
    )
    :vars
    (
      ?auto_34100 - BLOCK
      ?auto_34102 - BLOCK
      ?auto_34101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34097 ) ( not ( = ?auto_34097 ?auto_34098 ) ) ( not ( = ?auto_34097 ?auto_34099 ) ) ( not ( = ?auto_34098 ?auto_34099 ) ) ( ON ?auto_34099 ?auto_34100 ) ( not ( = ?auto_34097 ?auto_34100 ) ) ( not ( = ?auto_34098 ?auto_34100 ) ) ( not ( = ?auto_34099 ?auto_34100 ) ) ( CLEAR ?auto_34097 ) ( ON ?auto_34098 ?auto_34099 ) ( CLEAR ?auto_34098 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34102 ) ( ON ?auto_34101 ?auto_34102 ) ( ON ?auto_34100 ?auto_34101 ) ( not ( = ?auto_34102 ?auto_34101 ) ) ( not ( = ?auto_34102 ?auto_34100 ) ) ( not ( = ?auto_34102 ?auto_34099 ) ) ( not ( = ?auto_34102 ?auto_34098 ) ) ( not ( = ?auto_34101 ?auto_34100 ) ) ( not ( = ?auto_34101 ?auto_34099 ) ) ( not ( = ?auto_34101 ?auto_34098 ) ) ( not ( = ?auto_34097 ?auto_34102 ) ) ( not ( = ?auto_34097 ?auto_34101 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34102 ?auto_34101 ?auto_34100 ?auto_34099 )
      ( MAKE-3PILE ?auto_34097 ?auto_34098 ?auto_34099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34103 - BLOCK
      ?auto_34104 - BLOCK
      ?auto_34105 - BLOCK
    )
    :vars
    (
      ?auto_34106 - BLOCK
      ?auto_34108 - BLOCK
      ?auto_34107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34103 ?auto_34104 ) ) ( not ( = ?auto_34103 ?auto_34105 ) ) ( not ( = ?auto_34104 ?auto_34105 ) ) ( ON ?auto_34105 ?auto_34106 ) ( not ( = ?auto_34103 ?auto_34106 ) ) ( not ( = ?auto_34104 ?auto_34106 ) ) ( not ( = ?auto_34105 ?auto_34106 ) ) ( ON ?auto_34104 ?auto_34105 ) ( CLEAR ?auto_34104 ) ( ON-TABLE ?auto_34108 ) ( ON ?auto_34107 ?auto_34108 ) ( ON ?auto_34106 ?auto_34107 ) ( not ( = ?auto_34108 ?auto_34107 ) ) ( not ( = ?auto_34108 ?auto_34106 ) ) ( not ( = ?auto_34108 ?auto_34105 ) ) ( not ( = ?auto_34108 ?auto_34104 ) ) ( not ( = ?auto_34107 ?auto_34106 ) ) ( not ( = ?auto_34107 ?auto_34105 ) ) ( not ( = ?auto_34107 ?auto_34104 ) ) ( not ( = ?auto_34103 ?auto_34108 ) ) ( not ( = ?auto_34103 ?auto_34107 ) ) ( HOLDING ?auto_34103 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34103 )
      ( MAKE-3PILE ?auto_34103 ?auto_34104 ?auto_34105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34109 - BLOCK
      ?auto_34110 - BLOCK
      ?auto_34111 - BLOCK
    )
    :vars
    (
      ?auto_34114 - BLOCK
      ?auto_34112 - BLOCK
      ?auto_34113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34109 ?auto_34110 ) ) ( not ( = ?auto_34109 ?auto_34111 ) ) ( not ( = ?auto_34110 ?auto_34111 ) ) ( ON ?auto_34111 ?auto_34114 ) ( not ( = ?auto_34109 ?auto_34114 ) ) ( not ( = ?auto_34110 ?auto_34114 ) ) ( not ( = ?auto_34111 ?auto_34114 ) ) ( ON ?auto_34110 ?auto_34111 ) ( ON-TABLE ?auto_34112 ) ( ON ?auto_34113 ?auto_34112 ) ( ON ?auto_34114 ?auto_34113 ) ( not ( = ?auto_34112 ?auto_34113 ) ) ( not ( = ?auto_34112 ?auto_34114 ) ) ( not ( = ?auto_34112 ?auto_34111 ) ) ( not ( = ?auto_34112 ?auto_34110 ) ) ( not ( = ?auto_34113 ?auto_34114 ) ) ( not ( = ?auto_34113 ?auto_34111 ) ) ( not ( = ?auto_34113 ?auto_34110 ) ) ( not ( = ?auto_34109 ?auto_34112 ) ) ( not ( = ?auto_34109 ?auto_34113 ) ) ( ON ?auto_34109 ?auto_34110 ) ( CLEAR ?auto_34109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34112 ?auto_34113 ?auto_34114 ?auto_34111 ?auto_34110 )
      ( MAKE-3PILE ?auto_34109 ?auto_34110 ?auto_34111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34117 - BLOCK
      ?auto_34118 - BLOCK
    )
    :vars
    (
      ?auto_34119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34119 ?auto_34118 ) ( CLEAR ?auto_34119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34117 ) ( ON ?auto_34118 ?auto_34117 ) ( not ( = ?auto_34117 ?auto_34118 ) ) ( not ( = ?auto_34117 ?auto_34119 ) ) ( not ( = ?auto_34118 ?auto_34119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34119 ?auto_34118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34120 - BLOCK
      ?auto_34121 - BLOCK
    )
    :vars
    (
      ?auto_34122 - BLOCK
      ?auto_34123 - BLOCK
      ?auto_34124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34122 ?auto_34121 ) ( CLEAR ?auto_34122 ) ( ON-TABLE ?auto_34120 ) ( ON ?auto_34121 ?auto_34120 ) ( not ( = ?auto_34120 ?auto_34121 ) ) ( not ( = ?auto_34120 ?auto_34122 ) ) ( not ( = ?auto_34121 ?auto_34122 ) ) ( HOLDING ?auto_34123 ) ( CLEAR ?auto_34124 ) ( not ( = ?auto_34120 ?auto_34123 ) ) ( not ( = ?auto_34120 ?auto_34124 ) ) ( not ( = ?auto_34121 ?auto_34123 ) ) ( not ( = ?auto_34121 ?auto_34124 ) ) ( not ( = ?auto_34122 ?auto_34123 ) ) ( not ( = ?auto_34122 ?auto_34124 ) ) ( not ( = ?auto_34123 ?auto_34124 ) ) )
    :subtasks
    ( ( !STACK ?auto_34123 ?auto_34124 )
      ( MAKE-2PILE ?auto_34120 ?auto_34121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34125 - BLOCK
      ?auto_34126 - BLOCK
    )
    :vars
    (
      ?auto_34128 - BLOCK
      ?auto_34127 - BLOCK
      ?auto_34129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34128 ?auto_34126 ) ( ON-TABLE ?auto_34125 ) ( ON ?auto_34126 ?auto_34125 ) ( not ( = ?auto_34125 ?auto_34126 ) ) ( not ( = ?auto_34125 ?auto_34128 ) ) ( not ( = ?auto_34126 ?auto_34128 ) ) ( CLEAR ?auto_34127 ) ( not ( = ?auto_34125 ?auto_34129 ) ) ( not ( = ?auto_34125 ?auto_34127 ) ) ( not ( = ?auto_34126 ?auto_34129 ) ) ( not ( = ?auto_34126 ?auto_34127 ) ) ( not ( = ?auto_34128 ?auto_34129 ) ) ( not ( = ?auto_34128 ?auto_34127 ) ) ( not ( = ?auto_34129 ?auto_34127 ) ) ( ON ?auto_34129 ?auto_34128 ) ( CLEAR ?auto_34129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34125 ?auto_34126 ?auto_34128 )
      ( MAKE-2PILE ?auto_34125 ?auto_34126 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34130 - BLOCK
      ?auto_34131 - BLOCK
    )
    :vars
    (
      ?auto_34133 - BLOCK
      ?auto_34134 - BLOCK
      ?auto_34132 - BLOCK
      ?auto_34135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34133 ?auto_34131 ) ( ON-TABLE ?auto_34130 ) ( ON ?auto_34131 ?auto_34130 ) ( not ( = ?auto_34130 ?auto_34131 ) ) ( not ( = ?auto_34130 ?auto_34133 ) ) ( not ( = ?auto_34131 ?auto_34133 ) ) ( not ( = ?auto_34130 ?auto_34134 ) ) ( not ( = ?auto_34130 ?auto_34132 ) ) ( not ( = ?auto_34131 ?auto_34134 ) ) ( not ( = ?auto_34131 ?auto_34132 ) ) ( not ( = ?auto_34133 ?auto_34134 ) ) ( not ( = ?auto_34133 ?auto_34132 ) ) ( not ( = ?auto_34134 ?auto_34132 ) ) ( ON ?auto_34134 ?auto_34133 ) ( CLEAR ?auto_34134 ) ( HOLDING ?auto_34132 ) ( CLEAR ?auto_34135 ) ( ON-TABLE ?auto_34135 ) ( not ( = ?auto_34135 ?auto_34132 ) ) ( not ( = ?auto_34130 ?auto_34135 ) ) ( not ( = ?auto_34131 ?auto_34135 ) ) ( not ( = ?auto_34133 ?auto_34135 ) ) ( not ( = ?auto_34134 ?auto_34135 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34135 ?auto_34132 )
      ( MAKE-2PILE ?auto_34130 ?auto_34131 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34136 - BLOCK
      ?auto_34137 - BLOCK
    )
    :vars
    (
      ?auto_34140 - BLOCK
      ?auto_34138 - BLOCK
      ?auto_34141 - BLOCK
      ?auto_34139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34140 ?auto_34137 ) ( ON-TABLE ?auto_34136 ) ( ON ?auto_34137 ?auto_34136 ) ( not ( = ?auto_34136 ?auto_34137 ) ) ( not ( = ?auto_34136 ?auto_34140 ) ) ( not ( = ?auto_34137 ?auto_34140 ) ) ( not ( = ?auto_34136 ?auto_34138 ) ) ( not ( = ?auto_34136 ?auto_34141 ) ) ( not ( = ?auto_34137 ?auto_34138 ) ) ( not ( = ?auto_34137 ?auto_34141 ) ) ( not ( = ?auto_34140 ?auto_34138 ) ) ( not ( = ?auto_34140 ?auto_34141 ) ) ( not ( = ?auto_34138 ?auto_34141 ) ) ( ON ?auto_34138 ?auto_34140 ) ( CLEAR ?auto_34139 ) ( ON-TABLE ?auto_34139 ) ( not ( = ?auto_34139 ?auto_34141 ) ) ( not ( = ?auto_34136 ?auto_34139 ) ) ( not ( = ?auto_34137 ?auto_34139 ) ) ( not ( = ?auto_34140 ?auto_34139 ) ) ( not ( = ?auto_34138 ?auto_34139 ) ) ( ON ?auto_34141 ?auto_34138 ) ( CLEAR ?auto_34141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34136 ?auto_34137 ?auto_34140 ?auto_34138 )
      ( MAKE-2PILE ?auto_34136 ?auto_34137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34142 - BLOCK
      ?auto_34143 - BLOCK
    )
    :vars
    (
      ?auto_34147 - BLOCK
      ?auto_34144 - BLOCK
      ?auto_34145 - BLOCK
      ?auto_34146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34147 ?auto_34143 ) ( ON-TABLE ?auto_34142 ) ( ON ?auto_34143 ?auto_34142 ) ( not ( = ?auto_34142 ?auto_34143 ) ) ( not ( = ?auto_34142 ?auto_34147 ) ) ( not ( = ?auto_34143 ?auto_34147 ) ) ( not ( = ?auto_34142 ?auto_34144 ) ) ( not ( = ?auto_34142 ?auto_34145 ) ) ( not ( = ?auto_34143 ?auto_34144 ) ) ( not ( = ?auto_34143 ?auto_34145 ) ) ( not ( = ?auto_34147 ?auto_34144 ) ) ( not ( = ?auto_34147 ?auto_34145 ) ) ( not ( = ?auto_34144 ?auto_34145 ) ) ( ON ?auto_34144 ?auto_34147 ) ( not ( = ?auto_34146 ?auto_34145 ) ) ( not ( = ?auto_34142 ?auto_34146 ) ) ( not ( = ?auto_34143 ?auto_34146 ) ) ( not ( = ?auto_34147 ?auto_34146 ) ) ( not ( = ?auto_34144 ?auto_34146 ) ) ( ON ?auto_34145 ?auto_34144 ) ( CLEAR ?auto_34145 ) ( HOLDING ?auto_34146 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34146 )
      ( MAKE-2PILE ?auto_34142 ?auto_34143 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34148 - BLOCK
      ?auto_34149 - BLOCK
    )
    :vars
    (
      ?auto_34150 - BLOCK
      ?auto_34152 - BLOCK
      ?auto_34151 - BLOCK
      ?auto_34153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34150 ?auto_34149 ) ( ON-TABLE ?auto_34148 ) ( ON ?auto_34149 ?auto_34148 ) ( not ( = ?auto_34148 ?auto_34149 ) ) ( not ( = ?auto_34148 ?auto_34150 ) ) ( not ( = ?auto_34149 ?auto_34150 ) ) ( not ( = ?auto_34148 ?auto_34152 ) ) ( not ( = ?auto_34148 ?auto_34151 ) ) ( not ( = ?auto_34149 ?auto_34152 ) ) ( not ( = ?auto_34149 ?auto_34151 ) ) ( not ( = ?auto_34150 ?auto_34152 ) ) ( not ( = ?auto_34150 ?auto_34151 ) ) ( not ( = ?auto_34152 ?auto_34151 ) ) ( ON ?auto_34152 ?auto_34150 ) ( not ( = ?auto_34153 ?auto_34151 ) ) ( not ( = ?auto_34148 ?auto_34153 ) ) ( not ( = ?auto_34149 ?auto_34153 ) ) ( not ( = ?auto_34150 ?auto_34153 ) ) ( not ( = ?auto_34152 ?auto_34153 ) ) ( ON ?auto_34151 ?auto_34152 ) ( ON ?auto_34153 ?auto_34151 ) ( CLEAR ?auto_34153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34148 ?auto_34149 ?auto_34150 ?auto_34152 ?auto_34151 )
      ( MAKE-2PILE ?auto_34148 ?auto_34149 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34158 - BLOCK
      ?auto_34159 - BLOCK
      ?auto_34160 - BLOCK
      ?auto_34161 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34161 ) ( CLEAR ?auto_34160 ) ( ON-TABLE ?auto_34158 ) ( ON ?auto_34159 ?auto_34158 ) ( ON ?auto_34160 ?auto_34159 ) ( not ( = ?auto_34158 ?auto_34159 ) ) ( not ( = ?auto_34158 ?auto_34160 ) ) ( not ( = ?auto_34158 ?auto_34161 ) ) ( not ( = ?auto_34159 ?auto_34160 ) ) ( not ( = ?auto_34159 ?auto_34161 ) ) ( not ( = ?auto_34160 ?auto_34161 ) ) )
    :subtasks
    ( ( !STACK ?auto_34161 ?auto_34160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34162 - BLOCK
      ?auto_34163 - BLOCK
      ?auto_34164 - BLOCK
      ?auto_34165 - BLOCK
    )
    :vars
    (
      ?auto_34166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34164 ) ( ON-TABLE ?auto_34162 ) ( ON ?auto_34163 ?auto_34162 ) ( ON ?auto_34164 ?auto_34163 ) ( not ( = ?auto_34162 ?auto_34163 ) ) ( not ( = ?auto_34162 ?auto_34164 ) ) ( not ( = ?auto_34162 ?auto_34165 ) ) ( not ( = ?auto_34163 ?auto_34164 ) ) ( not ( = ?auto_34163 ?auto_34165 ) ) ( not ( = ?auto_34164 ?auto_34165 ) ) ( ON ?auto_34165 ?auto_34166 ) ( CLEAR ?auto_34165 ) ( HAND-EMPTY ) ( not ( = ?auto_34162 ?auto_34166 ) ) ( not ( = ?auto_34163 ?auto_34166 ) ) ( not ( = ?auto_34164 ?auto_34166 ) ) ( not ( = ?auto_34165 ?auto_34166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34165 ?auto_34166 )
      ( MAKE-4PILE ?auto_34162 ?auto_34163 ?auto_34164 ?auto_34165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34167 - BLOCK
      ?auto_34168 - BLOCK
      ?auto_34169 - BLOCK
      ?auto_34170 - BLOCK
    )
    :vars
    (
      ?auto_34171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34167 ) ( ON ?auto_34168 ?auto_34167 ) ( not ( = ?auto_34167 ?auto_34168 ) ) ( not ( = ?auto_34167 ?auto_34169 ) ) ( not ( = ?auto_34167 ?auto_34170 ) ) ( not ( = ?auto_34168 ?auto_34169 ) ) ( not ( = ?auto_34168 ?auto_34170 ) ) ( not ( = ?auto_34169 ?auto_34170 ) ) ( ON ?auto_34170 ?auto_34171 ) ( CLEAR ?auto_34170 ) ( not ( = ?auto_34167 ?auto_34171 ) ) ( not ( = ?auto_34168 ?auto_34171 ) ) ( not ( = ?auto_34169 ?auto_34171 ) ) ( not ( = ?auto_34170 ?auto_34171 ) ) ( HOLDING ?auto_34169 ) ( CLEAR ?auto_34168 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34167 ?auto_34168 ?auto_34169 )
      ( MAKE-4PILE ?auto_34167 ?auto_34168 ?auto_34169 ?auto_34170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34172 - BLOCK
      ?auto_34173 - BLOCK
      ?auto_34174 - BLOCK
      ?auto_34175 - BLOCK
    )
    :vars
    (
      ?auto_34176 - BLOCK
      ?auto_34177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34172 ) ( ON ?auto_34173 ?auto_34172 ) ( not ( = ?auto_34172 ?auto_34173 ) ) ( not ( = ?auto_34172 ?auto_34174 ) ) ( not ( = ?auto_34172 ?auto_34175 ) ) ( not ( = ?auto_34173 ?auto_34174 ) ) ( not ( = ?auto_34173 ?auto_34175 ) ) ( not ( = ?auto_34174 ?auto_34175 ) ) ( ON ?auto_34175 ?auto_34176 ) ( not ( = ?auto_34172 ?auto_34176 ) ) ( not ( = ?auto_34173 ?auto_34176 ) ) ( not ( = ?auto_34174 ?auto_34176 ) ) ( not ( = ?auto_34175 ?auto_34176 ) ) ( CLEAR ?auto_34173 ) ( ON ?auto_34174 ?auto_34175 ) ( CLEAR ?auto_34174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34177 ) ( ON ?auto_34176 ?auto_34177 ) ( not ( = ?auto_34177 ?auto_34176 ) ) ( not ( = ?auto_34177 ?auto_34175 ) ) ( not ( = ?auto_34177 ?auto_34174 ) ) ( not ( = ?auto_34172 ?auto_34177 ) ) ( not ( = ?auto_34173 ?auto_34177 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34177 ?auto_34176 ?auto_34175 )
      ( MAKE-4PILE ?auto_34172 ?auto_34173 ?auto_34174 ?auto_34175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34178 - BLOCK
      ?auto_34179 - BLOCK
      ?auto_34180 - BLOCK
      ?auto_34181 - BLOCK
    )
    :vars
    (
      ?auto_34182 - BLOCK
      ?auto_34183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34178 ) ( not ( = ?auto_34178 ?auto_34179 ) ) ( not ( = ?auto_34178 ?auto_34180 ) ) ( not ( = ?auto_34178 ?auto_34181 ) ) ( not ( = ?auto_34179 ?auto_34180 ) ) ( not ( = ?auto_34179 ?auto_34181 ) ) ( not ( = ?auto_34180 ?auto_34181 ) ) ( ON ?auto_34181 ?auto_34182 ) ( not ( = ?auto_34178 ?auto_34182 ) ) ( not ( = ?auto_34179 ?auto_34182 ) ) ( not ( = ?auto_34180 ?auto_34182 ) ) ( not ( = ?auto_34181 ?auto_34182 ) ) ( ON ?auto_34180 ?auto_34181 ) ( CLEAR ?auto_34180 ) ( ON-TABLE ?auto_34183 ) ( ON ?auto_34182 ?auto_34183 ) ( not ( = ?auto_34183 ?auto_34182 ) ) ( not ( = ?auto_34183 ?auto_34181 ) ) ( not ( = ?auto_34183 ?auto_34180 ) ) ( not ( = ?auto_34178 ?auto_34183 ) ) ( not ( = ?auto_34179 ?auto_34183 ) ) ( HOLDING ?auto_34179 ) ( CLEAR ?auto_34178 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34178 ?auto_34179 )
      ( MAKE-4PILE ?auto_34178 ?auto_34179 ?auto_34180 ?auto_34181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34184 - BLOCK
      ?auto_34185 - BLOCK
      ?auto_34186 - BLOCK
      ?auto_34187 - BLOCK
    )
    :vars
    (
      ?auto_34188 - BLOCK
      ?auto_34189 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34184 ) ( not ( = ?auto_34184 ?auto_34185 ) ) ( not ( = ?auto_34184 ?auto_34186 ) ) ( not ( = ?auto_34184 ?auto_34187 ) ) ( not ( = ?auto_34185 ?auto_34186 ) ) ( not ( = ?auto_34185 ?auto_34187 ) ) ( not ( = ?auto_34186 ?auto_34187 ) ) ( ON ?auto_34187 ?auto_34188 ) ( not ( = ?auto_34184 ?auto_34188 ) ) ( not ( = ?auto_34185 ?auto_34188 ) ) ( not ( = ?auto_34186 ?auto_34188 ) ) ( not ( = ?auto_34187 ?auto_34188 ) ) ( ON ?auto_34186 ?auto_34187 ) ( ON-TABLE ?auto_34189 ) ( ON ?auto_34188 ?auto_34189 ) ( not ( = ?auto_34189 ?auto_34188 ) ) ( not ( = ?auto_34189 ?auto_34187 ) ) ( not ( = ?auto_34189 ?auto_34186 ) ) ( not ( = ?auto_34184 ?auto_34189 ) ) ( not ( = ?auto_34185 ?auto_34189 ) ) ( CLEAR ?auto_34184 ) ( ON ?auto_34185 ?auto_34186 ) ( CLEAR ?auto_34185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34189 ?auto_34188 ?auto_34187 ?auto_34186 )
      ( MAKE-4PILE ?auto_34184 ?auto_34185 ?auto_34186 ?auto_34187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34190 - BLOCK
      ?auto_34191 - BLOCK
      ?auto_34192 - BLOCK
      ?auto_34193 - BLOCK
    )
    :vars
    (
      ?auto_34194 - BLOCK
      ?auto_34195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34190 ?auto_34191 ) ) ( not ( = ?auto_34190 ?auto_34192 ) ) ( not ( = ?auto_34190 ?auto_34193 ) ) ( not ( = ?auto_34191 ?auto_34192 ) ) ( not ( = ?auto_34191 ?auto_34193 ) ) ( not ( = ?auto_34192 ?auto_34193 ) ) ( ON ?auto_34193 ?auto_34194 ) ( not ( = ?auto_34190 ?auto_34194 ) ) ( not ( = ?auto_34191 ?auto_34194 ) ) ( not ( = ?auto_34192 ?auto_34194 ) ) ( not ( = ?auto_34193 ?auto_34194 ) ) ( ON ?auto_34192 ?auto_34193 ) ( ON-TABLE ?auto_34195 ) ( ON ?auto_34194 ?auto_34195 ) ( not ( = ?auto_34195 ?auto_34194 ) ) ( not ( = ?auto_34195 ?auto_34193 ) ) ( not ( = ?auto_34195 ?auto_34192 ) ) ( not ( = ?auto_34190 ?auto_34195 ) ) ( not ( = ?auto_34191 ?auto_34195 ) ) ( ON ?auto_34191 ?auto_34192 ) ( CLEAR ?auto_34191 ) ( HOLDING ?auto_34190 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34190 )
      ( MAKE-4PILE ?auto_34190 ?auto_34191 ?auto_34192 ?auto_34193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34196 - BLOCK
      ?auto_34197 - BLOCK
      ?auto_34198 - BLOCK
      ?auto_34199 - BLOCK
    )
    :vars
    (
      ?auto_34201 - BLOCK
      ?auto_34200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34196 ?auto_34197 ) ) ( not ( = ?auto_34196 ?auto_34198 ) ) ( not ( = ?auto_34196 ?auto_34199 ) ) ( not ( = ?auto_34197 ?auto_34198 ) ) ( not ( = ?auto_34197 ?auto_34199 ) ) ( not ( = ?auto_34198 ?auto_34199 ) ) ( ON ?auto_34199 ?auto_34201 ) ( not ( = ?auto_34196 ?auto_34201 ) ) ( not ( = ?auto_34197 ?auto_34201 ) ) ( not ( = ?auto_34198 ?auto_34201 ) ) ( not ( = ?auto_34199 ?auto_34201 ) ) ( ON ?auto_34198 ?auto_34199 ) ( ON-TABLE ?auto_34200 ) ( ON ?auto_34201 ?auto_34200 ) ( not ( = ?auto_34200 ?auto_34201 ) ) ( not ( = ?auto_34200 ?auto_34199 ) ) ( not ( = ?auto_34200 ?auto_34198 ) ) ( not ( = ?auto_34196 ?auto_34200 ) ) ( not ( = ?auto_34197 ?auto_34200 ) ) ( ON ?auto_34197 ?auto_34198 ) ( ON ?auto_34196 ?auto_34197 ) ( CLEAR ?auto_34196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34200 ?auto_34201 ?auto_34199 ?auto_34198 ?auto_34197 )
      ( MAKE-4PILE ?auto_34196 ?auto_34197 ?auto_34198 ?auto_34199 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34203 - BLOCK
    )
    :vars
    (
      ?auto_34204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34204 ?auto_34203 ) ( CLEAR ?auto_34204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34203 ) ( not ( = ?auto_34203 ?auto_34204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34204 ?auto_34203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34205 - BLOCK
    )
    :vars
    (
      ?auto_34206 - BLOCK
      ?auto_34207 - BLOCK
      ?auto_34208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34206 ?auto_34205 ) ( CLEAR ?auto_34206 ) ( ON-TABLE ?auto_34205 ) ( not ( = ?auto_34205 ?auto_34206 ) ) ( HOLDING ?auto_34207 ) ( CLEAR ?auto_34208 ) ( not ( = ?auto_34205 ?auto_34207 ) ) ( not ( = ?auto_34205 ?auto_34208 ) ) ( not ( = ?auto_34206 ?auto_34207 ) ) ( not ( = ?auto_34206 ?auto_34208 ) ) ( not ( = ?auto_34207 ?auto_34208 ) ) )
    :subtasks
    ( ( !STACK ?auto_34207 ?auto_34208 )
      ( MAKE-1PILE ?auto_34205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34209 - BLOCK
    )
    :vars
    (
      ?auto_34212 - BLOCK
      ?auto_34211 - BLOCK
      ?auto_34210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34212 ?auto_34209 ) ( ON-TABLE ?auto_34209 ) ( not ( = ?auto_34209 ?auto_34212 ) ) ( CLEAR ?auto_34211 ) ( not ( = ?auto_34209 ?auto_34210 ) ) ( not ( = ?auto_34209 ?auto_34211 ) ) ( not ( = ?auto_34212 ?auto_34210 ) ) ( not ( = ?auto_34212 ?auto_34211 ) ) ( not ( = ?auto_34210 ?auto_34211 ) ) ( ON ?auto_34210 ?auto_34212 ) ( CLEAR ?auto_34210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34209 ?auto_34212 )
      ( MAKE-1PILE ?auto_34209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34213 - BLOCK
    )
    :vars
    (
      ?auto_34216 - BLOCK
      ?auto_34215 - BLOCK
      ?auto_34214 - BLOCK
      ?auto_34218 - BLOCK
      ?auto_34217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34216 ?auto_34213 ) ( ON-TABLE ?auto_34213 ) ( not ( = ?auto_34213 ?auto_34216 ) ) ( not ( = ?auto_34213 ?auto_34215 ) ) ( not ( = ?auto_34213 ?auto_34214 ) ) ( not ( = ?auto_34216 ?auto_34215 ) ) ( not ( = ?auto_34216 ?auto_34214 ) ) ( not ( = ?auto_34215 ?auto_34214 ) ) ( ON ?auto_34215 ?auto_34216 ) ( CLEAR ?auto_34215 ) ( HOLDING ?auto_34214 ) ( CLEAR ?auto_34218 ) ( ON-TABLE ?auto_34217 ) ( ON ?auto_34218 ?auto_34217 ) ( not ( = ?auto_34217 ?auto_34218 ) ) ( not ( = ?auto_34217 ?auto_34214 ) ) ( not ( = ?auto_34218 ?auto_34214 ) ) ( not ( = ?auto_34213 ?auto_34218 ) ) ( not ( = ?auto_34213 ?auto_34217 ) ) ( not ( = ?auto_34216 ?auto_34218 ) ) ( not ( = ?auto_34216 ?auto_34217 ) ) ( not ( = ?auto_34215 ?auto_34218 ) ) ( not ( = ?auto_34215 ?auto_34217 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34217 ?auto_34218 ?auto_34214 )
      ( MAKE-1PILE ?auto_34213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34219 - BLOCK
    )
    :vars
    (
      ?auto_34220 - BLOCK
      ?auto_34224 - BLOCK
      ?auto_34223 - BLOCK
      ?auto_34221 - BLOCK
      ?auto_34222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34220 ?auto_34219 ) ( ON-TABLE ?auto_34219 ) ( not ( = ?auto_34219 ?auto_34220 ) ) ( not ( = ?auto_34219 ?auto_34224 ) ) ( not ( = ?auto_34219 ?auto_34223 ) ) ( not ( = ?auto_34220 ?auto_34224 ) ) ( not ( = ?auto_34220 ?auto_34223 ) ) ( not ( = ?auto_34224 ?auto_34223 ) ) ( ON ?auto_34224 ?auto_34220 ) ( CLEAR ?auto_34221 ) ( ON-TABLE ?auto_34222 ) ( ON ?auto_34221 ?auto_34222 ) ( not ( = ?auto_34222 ?auto_34221 ) ) ( not ( = ?auto_34222 ?auto_34223 ) ) ( not ( = ?auto_34221 ?auto_34223 ) ) ( not ( = ?auto_34219 ?auto_34221 ) ) ( not ( = ?auto_34219 ?auto_34222 ) ) ( not ( = ?auto_34220 ?auto_34221 ) ) ( not ( = ?auto_34220 ?auto_34222 ) ) ( not ( = ?auto_34224 ?auto_34221 ) ) ( not ( = ?auto_34224 ?auto_34222 ) ) ( ON ?auto_34223 ?auto_34224 ) ( CLEAR ?auto_34223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34219 ?auto_34220 ?auto_34224 )
      ( MAKE-1PILE ?auto_34219 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34225 - BLOCK
    )
    :vars
    (
      ?auto_34228 - BLOCK
      ?auto_34229 - BLOCK
      ?auto_34230 - BLOCK
      ?auto_34226 - BLOCK
      ?auto_34227 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34228 ?auto_34225 ) ( ON-TABLE ?auto_34225 ) ( not ( = ?auto_34225 ?auto_34228 ) ) ( not ( = ?auto_34225 ?auto_34229 ) ) ( not ( = ?auto_34225 ?auto_34230 ) ) ( not ( = ?auto_34228 ?auto_34229 ) ) ( not ( = ?auto_34228 ?auto_34230 ) ) ( not ( = ?auto_34229 ?auto_34230 ) ) ( ON ?auto_34229 ?auto_34228 ) ( ON-TABLE ?auto_34226 ) ( not ( = ?auto_34226 ?auto_34227 ) ) ( not ( = ?auto_34226 ?auto_34230 ) ) ( not ( = ?auto_34227 ?auto_34230 ) ) ( not ( = ?auto_34225 ?auto_34227 ) ) ( not ( = ?auto_34225 ?auto_34226 ) ) ( not ( = ?auto_34228 ?auto_34227 ) ) ( not ( = ?auto_34228 ?auto_34226 ) ) ( not ( = ?auto_34229 ?auto_34227 ) ) ( not ( = ?auto_34229 ?auto_34226 ) ) ( ON ?auto_34230 ?auto_34229 ) ( CLEAR ?auto_34230 ) ( HOLDING ?auto_34227 ) ( CLEAR ?auto_34226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34226 ?auto_34227 )
      ( MAKE-1PILE ?auto_34225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34231 - BLOCK
    )
    :vars
    (
      ?auto_34232 - BLOCK
      ?auto_34233 - BLOCK
      ?auto_34236 - BLOCK
      ?auto_34234 - BLOCK
      ?auto_34235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34232 ?auto_34231 ) ( ON-TABLE ?auto_34231 ) ( not ( = ?auto_34231 ?auto_34232 ) ) ( not ( = ?auto_34231 ?auto_34233 ) ) ( not ( = ?auto_34231 ?auto_34236 ) ) ( not ( = ?auto_34232 ?auto_34233 ) ) ( not ( = ?auto_34232 ?auto_34236 ) ) ( not ( = ?auto_34233 ?auto_34236 ) ) ( ON ?auto_34233 ?auto_34232 ) ( ON-TABLE ?auto_34234 ) ( not ( = ?auto_34234 ?auto_34235 ) ) ( not ( = ?auto_34234 ?auto_34236 ) ) ( not ( = ?auto_34235 ?auto_34236 ) ) ( not ( = ?auto_34231 ?auto_34235 ) ) ( not ( = ?auto_34231 ?auto_34234 ) ) ( not ( = ?auto_34232 ?auto_34235 ) ) ( not ( = ?auto_34232 ?auto_34234 ) ) ( not ( = ?auto_34233 ?auto_34235 ) ) ( not ( = ?auto_34233 ?auto_34234 ) ) ( ON ?auto_34236 ?auto_34233 ) ( CLEAR ?auto_34234 ) ( ON ?auto_34235 ?auto_34236 ) ( CLEAR ?auto_34235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34231 ?auto_34232 ?auto_34233 ?auto_34236 )
      ( MAKE-1PILE ?auto_34231 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34237 - BLOCK
    )
    :vars
    (
      ?auto_34238 - BLOCK
      ?auto_34240 - BLOCK
      ?auto_34242 - BLOCK
      ?auto_34239 - BLOCK
      ?auto_34241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34238 ?auto_34237 ) ( ON-TABLE ?auto_34237 ) ( not ( = ?auto_34237 ?auto_34238 ) ) ( not ( = ?auto_34237 ?auto_34240 ) ) ( not ( = ?auto_34237 ?auto_34242 ) ) ( not ( = ?auto_34238 ?auto_34240 ) ) ( not ( = ?auto_34238 ?auto_34242 ) ) ( not ( = ?auto_34240 ?auto_34242 ) ) ( ON ?auto_34240 ?auto_34238 ) ( not ( = ?auto_34239 ?auto_34241 ) ) ( not ( = ?auto_34239 ?auto_34242 ) ) ( not ( = ?auto_34241 ?auto_34242 ) ) ( not ( = ?auto_34237 ?auto_34241 ) ) ( not ( = ?auto_34237 ?auto_34239 ) ) ( not ( = ?auto_34238 ?auto_34241 ) ) ( not ( = ?auto_34238 ?auto_34239 ) ) ( not ( = ?auto_34240 ?auto_34241 ) ) ( not ( = ?auto_34240 ?auto_34239 ) ) ( ON ?auto_34242 ?auto_34240 ) ( ON ?auto_34241 ?auto_34242 ) ( CLEAR ?auto_34241 ) ( HOLDING ?auto_34239 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34239 )
      ( MAKE-1PILE ?auto_34237 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34243 - BLOCK
    )
    :vars
    (
      ?auto_34248 - BLOCK
      ?auto_34246 - BLOCK
      ?auto_34247 - BLOCK
      ?auto_34244 - BLOCK
      ?auto_34245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34248 ?auto_34243 ) ( ON-TABLE ?auto_34243 ) ( not ( = ?auto_34243 ?auto_34248 ) ) ( not ( = ?auto_34243 ?auto_34246 ) ) ( not ( = ?auto_34243 ?auto_34247 ) ) ( not ( = ?auto_34248 ?auto_34246 ) ) ( not ( = ?auto_34248 ?auto_34247 ) ) ( not ( = ?auto_34246 ?auto_34247 ) ) ( ON ?auto_34246 ?auto_34248 ) ( not ( = ?auto_34244 ?auto_34245 ) ) ( not ( = ?auto_34244 ?auto_34247 ) ) ( not ( = ?auto_34245 ?auto_34247 ) ) ( not ( = ?auto_34243 ?auto_34245 ) ) ( not ( = ?auto_34243 ?auto_34244 ) ) ( not ( = ?auto_34248 ?auto_34245 ) ) ( not ( = ?auto_34248 ?auto_34244 ) ) ( not ( = ?auto_34246 ?auto_34245 ) ) ( not ( = ?auto_34246 ?auto_34244 ) ) ( ON ?auto_34247 ?auto_34246 ) ( ON ?auto_34245 ?auto_34247 ) ( ON ?auto_34244 ?auto_34245 ) ( CLEAR ?auto_34244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34243 ?auto_34248 ?auto_34246 ?auto_34247 ?auto_34245 )
      ( MAKE-1PILE ?auto_34243 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34254 - BLOCK
      ?auto_34255 - BLOCK
      ?auto_34256 - BLOCK
      ?auto_34257 - BLOCK
      ?auto_34258 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34258 ) ( CLEAR ?auto_34257 ) ( ON-TABLE ?auto_34254 ) ( ON ?auto_34255 ?auto_34254 ) ( ON ?auto_34256 ?auto_34255 ) ( ON ?auto_34257 ?auto_34256 ) ( not ( = ?auto_34254 ?auto_34255 ) ) ( not ( = ?auto_34254 ?auto_34256 ) ) ( not ( = ?auto_34254 ?auto_34257 ) ) ( not ( = ?auto_34254 ?auto_34258 ) ) ( not ( = ?auto_34255 ?auto_34256 ) ) ( not ( = ?auto_34255 ?auto_34257 ) ) ( not ( = ?auto_34255 ?auto_34258 ) ) ( not ( = ?auto_34256 ?auto_34257 ) ) ( not ( = ?auto_34256 ?auto_34258 ) ) ( not ( = ?auto_34257 ?auto_34258 ) ) )
    :subtasks
    ( ( !STACK ?auto_34258 ?auto_34257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34259 - BLOCK
      ?auto_34260 - BLOCK
      ?auto_34261 - BLOCK
      ?auto_34262 - BLOCK
      ?auto_34263 - BLOCK
    )
    :vars
    (
      ?auto_34264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34262 ) ( ON-TABLE ?auto_34259 ) ( ON ?auto_34260 ?auto_34259 ) ( ON ?auto_34261 ?auto_34260 ) ( ON ?auto_34262 ?auto_34261 ) ( not ( = ?auto_34259 ?auto_34260 ) ) ( not ( = ?auto_34259 ?auto_34261 ) ) ( not ( = ?auto_34259 ?auto_34262 ) ) ( not ( = ?auto_34259 ?auto_34263 ) ) ( not ( = ?auto_34260 ?auto_34261 ) ) ( not ( = ?auto_34260 ?auto_34262 ) ) ( not ( = ?auto_34260 ?auto_34263 ) ) ( not ( = ?auto_34261 ?auto_34262 ) ) ( not ( = ?auto_34261 ?auto_34263 ) ) ( not ( = ?auto_34262 ?auto_34263 ) ) ( ON ?auto_34263 ?auto_34264 ) ( CLEAR ?auto_34263 ) ( HAND-EMPTY ) ( not ( = ?auto_34259 ?auto_34264 ) ) ( not ( = ?auto_34260 ?auto_34264 ) ) ( not ( = ?auto_34261 ?auto_34264 ) ) ( not ( = ?auto_34262 ?auto_34264 ) ) ( not ( = ?auto_34263 ?auto_34264 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34263 ?auto_34264 )
      ( MAKE-5PILE ?auto_34259 ?auto_34260 ?auto_34261 ?auto_34262 ?auto_34263 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34265 - BLOCK
      ?auto_34266 - BLOCK
      ?auto_34267 - BLOCK
      ?auto_34268 - BLOCK
      ?auto_34269 - BLOCK
    )
    :vars
    (
      ?auto_34270 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34265 ) ( ON ?auto_34266 ?auto_34265 ) ( ON ?auto_34267 ?auto_34266 ) ( not ( = ?auto_34265 ?auto_34266 ) ) ( not ( = ?auto_34265 ?auto_34267 ) ) ( not ( = ?auto_34265 ?auto_34268 ) ) ( not ( = ?auto_34265 ?auto_34269 ) ) ( not ( = ?auto_34266 ?auto_34267 ) ) ( not ( = ?auto_34266 ?auto_34268 ) ) ( not ( = ?auto_34266 ?auto_34269 ) ) ( not ( = ?auto_34267 ?auto_34268 ) ) ( not ( = ?auto_34267 ?auto_34269 ) ) ( not ( = ?auto_34268 ?auto_34269 ) ) ( ON ?auto_34269 ?auto_34270 ) ( CLEAR ?auto_34269 ) ( not ( = ?auto_34265 ?auto_34270 ) ) ( not ( = ?auto_34266 ?auto_34270 ) ) ( not ( = ?auto_34267 ?auto_34270 ) ) ( not ( = ?auto_34268 ?auto_34270 ) ) ( not ( = ?auto_34269 ?auto_34270 ) ) ( HOLDING ?auto_34268 ) ( CLEAR ?auto_34267 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34265 ?auto_34266 ?auto_34267 ?auto_34268 )
      ( MAKE-5PILE ?auto_34265 ?auto_34266 ?auto_34267 ?auto_34268 ?auto_34269 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34271 - BLOCK
      ?auto_34272 - BLOCK
      ?auto_34273 - BLOCK
      ?auto_34274 - BLOCK
      ?auto_34275 - BLOCK
    )
    :vars
    (
      ?auto_34276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34271 ) ( ON ?auto_34272 ?auto_34271 ) ( ON ?auto_34273 ?auto_34272 ) ( not ( = ?auto_34271 ?auto_34272 ) ) ( not ( = ?auto_34271 ?auto_34273 ) ) ( not ( = ?auto_34271 ?auto_34274 ) ) ( not ( = ?auto_34271 ?auto_34275 ) ) ( not ( = ?auto_34272 ?auto_34273 ) ) ( not ( = ?auto_34272 ?auto_34274 ) ) ( not ( = ?auto_34272 ?auto_34275 ) ) ( not ( = ?auto_34273 ?auto_34274 ) ) ( not ( = ?auto_34273 ?auto_34275 ) ) ( not ( = ?auto_34274 ?auto_34275 ) ) ( ON ?auto_34275 ?auto_34276 ) ( not ( = ?auto_34271 ?auto_34276 ) ) ( not ( = ?auto_34272 ?auto_34276 ) ) ( not ( = ?auto_34273 ?auto_34276 ) ) ( not ( = ?auto_34274 ?auto_34276 ) ) ( not ( = ?auto_34275 ?auto_34276 ) ) ( CLEAR ?auto_34273 ) ( ON ?auto_34274 ?auto_34275 ) ( CLEAR ?auto_34274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34276 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34276 ?auto_34275 )
      ( MAKE-5PILE ?auto_34271 ?auto_34272 ?auto_34273 ?auto_34274 ?auto_34275 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34277 - BLOCK
      ?auto_34278 - BLOCK
      ?auto_34279 - BLOCK
      ?auto_34280 - BLOCK
      ?auto_34281 - BLOCK
    )
    :vars
    (
      ?auto_34282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34277 ) ( ON ?auto_34278 ?auto_34277 ) ( not ( = ?auto_34277 ?auto_34278 ) ) ( not ( = ?auto_34277 ?auto_34279 ) ) ( not ( = ?auto_34277 ?auto_34280 ) ) ( not ( = ?auto_34277 ?auto_34281 ) ) ( not ( = ?auto_34278 ?auto_34279 ) ) ( not ( = ?auto_34278 ?auto_34280 ) ) ( not ( = ?auto_34278 ?auto_34281 ) ) ( not ( = ?auto_34279 ?auto_34280 ) ) ( not ( = ?auto_34279 ?auto_34281 ) ) ( not ( = ?auto_34280 ?auto_34281 ) ) ( ON ?auto_34281 ?auto_34282 ) ( not ( = ?auto_34277 ?auto_34282 ) ) ( not ( = ?auto_34278 ?auto_34282 ) ) ( not ( = ?auto_34279 ?auto_34282 ) ) ( not ( = ?auto_34280 ?auto_34282 ) ) ( not ( = ?auto_34281 ?auto_34282 ) ) ( ON ?auto_34280 ?auto_34281 ) ( CLEAR ?auto_34280 ) ( ON-TABLE ?auto_34282 ) ( HOLDING ?auto_34279 ) ( CLEAR ?auto_34278 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34277 ?auto_34278 ?auto_34279 )
      ( MAKE-5PILE ?auto_34277 ?auto_34278 ?auto_34279 ?auto_34280 ?auto_34281 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34283 - BLOCK
      ?auto_34284 - BLOCK
      ?auto_34285 - BLOCK
      ?auto_34286 - BLOCK
      ?auto_34287 - BLOCK
    )
    :vars
    (
      ?auto_34288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34283 ) ( ON ?auto_34284 ?auto_34283 ) ( not ( = ?auto_34283 ?auto_34284 ) ) ( not ( = ?auto_34283 ?auto_34285 ) ) ( not ( = ?auto_34283 ?auto_34286 ) ) ( not ( = ?auto_34283 ?auto_34287 ) ) ( not ( = ?auto_34284 ?auto_34285 ) ) ( not ( = ?auto_34284 ?auto_34286 ) ) ( not ( = ?auto_34284 ?auto_34287 ) ) ( not ( = ?auto_34285 ?auto_34286 ) ) ( not ( = ?auto_34285 ?auto_34287 ) ) ( not ( = ?auto_34286 ?auto_34287 ) ) ( ON ?auto_34287 ?auto_34288 ) ( not ( = ?auto_34283 ?auto_34288 ) ) ( not ( = ?auto_34284 ?auto_34288 ) ) ( not ( = ?auto_34285 ?auto_34288 ) ) ( not ( = ?auto_34286 ?auto_34288 ) ) ( not ( = ?auto_34287 ?auto_34288 ) ) ( ON ?auto_34286 ?auto_34287 ) ( ON-TABLE ?auto_34288 ) ( CLEAR ?auto_34284 ) ( ON ?auto_34285 ?auto_34286 ) ( CLEAR ?auto_34285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34288 ?auto_34287 ?auto_34286 )
      ( MAKE-5PILE ?auto_34283 ?auto_34284 ?auto_34285 ?auto_34286 ?auto_34287 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34289 - BLOCK
      ?auto_34290 - BLOCK
      ?auto_34291 - BLOCK
      ?auto_34292 - BLOCK
      ?auto_34293 - BLOCK
    )
    :vars
    (
      ?auto_34294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34289 ) ( not ( = ?auto_34289 ?auto_34290 ) ) ( not ( = ?auto_34289 ?auto_34291 ) ) ( not ( = ?auto_34289 ?auto_34292 ) ) ( not ( = ?auto_34289 ?auto_34293 ) ) ( not ( = ?auto_34290 ?auto_34291 ) ) ( not ( = ?auto_34290 ?auto_34292 ) ) ( not ( = ?auto_34290 ?auto_34293 ) ) ( not ( = ?auto_34291 ?auto_34292 ) ) ( not ( = ?auto_34291 ?auto_34293 ) ) ( not ( = ?auto_34292 ?auto_34293 ) ) ( ON ?auto_34293 ?auto_34294 ) ( not ( = ?auto_34289 ?auto_34294 ) ) ( not ( = ?auto_34290 ?auto_34294 ) ) ( not ( = ?auto_34291 ?auto_34294 ) ) ( not ( = ?auto_34292 ?auto_34294 ) ) ( not ( = ?auto_34293 ?auto_34294 ) ) ( ON ?auto_34292 ?auto_34293 ) ( ON-TABLE ?auto_34294 ) ( ON ?auto_34291 ?auto_34292 ) ( CLEAR ?auto_34291 ) ( HOLDING ?auto_34290 ) ( CLEAR ?auto_34289 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34289 ?auto_34290 )
      ( MAKE-5PILE ?auto_34289 ?auto_34290 ?auto_34291 ?auto_34292 ?auto_34293 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34295 - BLOCK
      ?auto_34296 - BLOCK
      ?auto_34297 - BLOCK
      ?auto_34298 - BLOCK
      ?auto_34299 - BLOCK
    )
    :vars
    (
      ?auto_34300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34295 ) ( not ( = ?auto_34295 ?auto_34296 ) ) ( not ( = ?auto_34295 ?auto_34297 ) ) ( not ( = ?auto_34295 ?auto_34298 ) ) ( not ( = ?auto_34295 ?auto_34299 ) ) ( not ( = ?auto_34296 ?auto_34297 ) ) ( not ( = ?auto_34296 ?auto_34298 ) ) ( not ( = ?auto_34296 ?auto_34299 ) ) ( not ( = ?auto_34297 ?auto_34298 ) ) ( not ( = ?auto_34297 ?auto_34299 ) ) ( not ( = ?auto_34298 ?auto_34299 ) ) ( ON ?auto_34299 ?auto_34300 ) ( not ( = ?auto_34295 ?auto_34300 ) ) ( not ( = ?auto_34296 ?auto_34300 ) ) ( not ( = ?auto_34297 ?auto_34300 ) ) ( not ( = ?auto_34298 ?auto_34300 ) ) ( not ( = ?auto_34299 ?auto_34300 ) ) ( ON ?auto_34298 ?auto_34299 ) ( ON-TABLE ?auto_34300 ) ( ON ?auto_34297 ?auto_34298 ) ( CLEAR ?auto_34295 ) ( ON ?auto_34296 ?auto_34297 ) ( CLEAR ?auto_34296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34300 ?auto_34299 ?auto_34298 ?auto_34297 )
      ( MAKE-5PILE ?auto_34295 ?auto_34296 ?auto_34297 ?auto_34298 ?auto_34299 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34301 - BLOCK
      ?auto_34302 - BLOCK
      ?auto_34303 - BLOCK
      ?auto_34304 - BLOCK
      ?auto_34305 - BLOCK
    )
    :vars
    (
      ?auto_34306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34301 ?auto_34302 ) ) ( not ( = ?auto_34301 ?auto_34303 ) ) ( not ( = ?auto_34301 ?auto_34304 ) ) ( not ( = ?auto_34301 ?auto_34305 ) ) ( not ( = ?auto_34302 ?auto_34303 ) ) ( not ( = ?auto_34302 ?auto_34304 ) ) ( not ( = ?auto_34302 ?auto_34305 ) ) ( not ( = ?auto_34303 ?auto_34304 ) ) ( not ( = ?auto_34303 ?auto_34305 ) ) ( not ( = ?auto_34304 ?auto_34305 ) ) ( ON ?auto_34305 ?auto_34306 ) ( not ( = ?auto_34301 ?auto_34306 ) ) ( not ( = ?auto_34302 ?auto_34306 ) ) ( not ( = ?auto_34303 ?auto_34306 ) ) ( not ( = ?auto_34304 ?auto_34306 ) ) ( not ( = ?auto_34305 ?auto_34306 ) ) ( ON ?auto_34304 ?auto_34305 ) ( ON-TABLE ?auto_34306 ) ( ON ?auto_34303 ?auto_34304 ) ( ON ?auto_34302 ?auto_34303 ) ( CLEAR ?auto_34302 ) ( HOLDING ?auto_34301 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34301 )
      ( MAKE-5PILE ?auto_34301 ?auto_34302 ?auto_34303 ?auto_34304 ?auto_34305 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34307 - BLOCK
      ?auto_34308 - BLOCK
      ?auto_34309 - BLOCK
      ?auto_34310 - BLOCK
      ?auto_34311 - BLOCK
    )
    :vars
    (
      ?auto_34312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34307 ?auto_34308 ) ) ( not ( = ?auto_34307 ?auto_34309 ) ) ( not ( = ?auto_34307 ?auto_34310 ) ) ( not ( = ?auto_34307 ?auto_34311 ) ) ( not ( = ?auto_34308 ?auto_34309 ) ) ( not ( = ?auto_34308 ?auto_34310 ) ) ( not ( = ?auto_34308 ?auto_34311 ) ) ( not ( = ?auto_34309 ?auto_34310 ) ) ( not ( = ?auto_34309 ?auto_34311 ) ) ( not ( = ?auto_34310 ?auto_34311 ) ) ( ON ?auto_34311 ?auto_34312 ) ( not ( = ?auto_34307 ?auto_34312 ) ) ( not ( = ?auto_34308 ?auto_34312 ) ) ( not ( = ?auto_34309 ?auto_34312 ) ) ( not ( = ?auto_34310 ?auto_34312 ) ) ( not ( = ?auto_34311 ?auto_34312 ) ) ( ON ?auto_34310 ?auto_34311 ) ( ON-TABLE ?auto_34312 ) ( ON ?auto_34309 ?auto_34310 ) ( ON ?auto_34308 ?auto_34309 ) ( ON ?auto_34307 ?auto_34308 ) ( CLEAR ?auto_34307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34312 ?auto_34311 ?auto_34310 ?auto_34309 ?auto_34308 )
      ( MAKE-5PILE ?auto_34307 ?auto_34308 ?auto_34309 ?auto_34310 ?auto_34311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34317 - BLOCK
      ?auto_34318 - BLOCK
      ?auto_34319 - BLOCK
      ?auto_34320 - BLOCK
    )
    :vars
    (
      ?auto_34321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34321 ?auto_34320 ) ( CLEAR ?auto_34321 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34317 ) ( ON ?auto_34318 ?auto_34317 ) ( ON ?auto_34319 ?auto_34318 ) ( ON ?auto_34320 ?auto_34319 ) ( not ( = ?auto_34317 ?auto_34318 ) ) ( not ( = ?auto_34317 ?auto_34319 ) ) ( not ( = ?auto_34317 ?auto_34320 ) ) ( not ( = ?auto_34317 ?auto_34321 ) ) ( not ( = ?auto_34318 ?auto_34319 ) ) ( not ( = ?auto_34318 ?auto_34320 ) ) ( not ( = ?auto_34318 ?auto_34321 ) ) ( not ( = ?auto_34319 ?auto_34320 ) ) ( not ( = ?auto_34319 ?auto_34321 ) ) ( not ( = ?auto_34320 ?auto_34321 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34321 ?auto_34320 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34333 - BLOCK
      ?auto_34334 - BLOCK
      ?auto_34335 - BLOCK
      ?auto_34336 - BLOCK
    )
    :vars
    (
      ?auto_34337 - BLOCK
      ?auto_34338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34333 ) ( ON ?auto_34334 ?auto_34333 ) ( ON ?auto_34335 ?auto_34334 ) ( not ( = ?auto_34333 ?auto_34334 ) ) ( not ( = ?auto_34333 ?auto_34335 ) ) ( not ( = ?auto_34333 ?auto_34336 ) ) ( not ( = ?auto_34333 ?auto_34337 ) ) ( not ( = ?auto_34334 ?auto_34335 ) ) ( not ( = ?auto_34334 ?auto_34336 ) ) ( not ( = ?auto_34334 ?auto_34337 ) ) ( not ( = ?auto_34335 ?auto_34336 ) ) ( not ( = ?auto_34335 ?auto_34337 ) ) ( not ( = ?auto_34336 ?auto_34337 ) ) ( ON ?auto_34337 ?auto_34338 ) ( CLEAR ?auto_34337 ) ( not ( = ?auto_34333 ?auto_34338 ) ) ( not ( = ?auto_34334 ?auto_34338 ) ) ( not ( = ?auto_34335 ?auto_34338 ) ) ( not ( = ?auto_34336 ?auto_34338 ) ) ( not ( = ?auto_34337 ?auto_34338 ) ) ( HOLDING ?auto_34336 ) ( CLEAR ?auto_34335 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34333 ?auto_34334 ?auto_34335 ?auto_34336 ?auto_34337 )
      ( MAKE-4PILE ?auto_34333 ?auto_34334 ?auto_34335 ?auto_34336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34339 - BLOCK
      ?auto_34340 - BLOCK
      ?auto_34341 - BLOCK
      ?auto_34342 - BLOCK
    )
    :vars
    (
      ?auto_34343 - BLOCK
      ?auto_34344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34339 ) ( ON ?auto_34340 ?auto_34339 ) ( ON ?auto_34341 ?auto_34340 ) ( not ( = ?auto_34339 ?auto_34340 ) ) ( not ( = ?auto_34339 ?auto_34341 ) ) ( not ( = ?auto_34339 ?auto_34342 ) ) ( not ( = ?auto_34339 ?auto_34343 ) ) ( not ( = ?auto_34340 ?auto_34341 ) ) ( not ( = ?auto_34340 ?auto_34342 ) ) ( not ( = ?auto_34340 ?auto_34343 ) ) ( not ( = ?auto_34341 ?auto_34342 ) ) ( not ( = ?auto_34341 ?auto_34343 ) ) ( not ( = ?auto_34342 ?auto_34343 ) ) ( ON ?auto_34343 ?auto_34344 ) ( not ( = ?auto_34339 ?auto_34344 ) ) ( not ( = ?auto_34340 ?auto_34344 ) ) ( not ( = ?auto_34341 ?auto_34344 ) ) ( not ( = ?auto_34342 ?auto_34344 ) ) ( not ( = ?auto_34343 ?auto_34344 ) ) ( CLEAR ?auto_34341 ) ( ON ?auto_34342 ?auto_34343 ) ( CLEAR ?auto_34342 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34344 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34344 ?auto_34343 )
      ( MAKE-4PILE ?auto_34339 ?auto_34340 ?auto_34341 ?auto_34342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34345 - BLOCK
      ?auto_34346 - BLOCK
      ?auto_34347 - BLOCK
      ?auto_34348 - BLOCK
    )
    :vars
    (
      ?auto_34349 - BLOCK
      ?auto_34350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34345 ) ( ON ?auto_34346 ?auto_34345 ) ( not ( = ?auto_34345 ?auto_34346 ) ) ( not ( = ?auto_34345 ?auto_34347 ) ) ( not ( = ?auto_34345 ?auto_34348 ) ) ( not ( = ?auto_34345 ?auto_34349 ) ) ( not ( = ?auto_34346 ?auto_34347 ) ) ( not ( = ?auto_34346 ?auto_34348 ) ) ( not ( = ?auto_34346 ?auto_34349 ) ) ( not ( = ?auto_34347 ?auto_34348 ) ) ( not ( = ?auto_34347 ?auto_34349 ) ) ( not ( = ?auto_34348 ?auto_34349 ) ) ( ON ?auto_34349 ?auto_34350 ) ( not ( = ?auto_34345 ?auto_34350 ) ) ( not ( = ?auto_34346 ?auto_34350 ) ) ( not ( = ?auto_34347 ?auto_34350 ) ) ( not ( = ?auto_34348 ?auto_34350 ) ) ( not ( = ?auto_34349 ?auto_34350 ) ) ( ON ?auto_34348 ?auto_34349 ) ( CLEAR ?auto_34348 ) ( ON-TABLE ?auto_34350 ) ( HOLDING ?auto_34347 ) ( CLEAR ?auto_34346 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34345 ?auto_34346 ?auto_34347 )
      ( MAKE-4PILE ?auto_34345 ?auto_34346 ?auto_34347 ?auto_34348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34351 - BLOCK
      ?auto_34352 - BLOCK
      ?auto_34353 - BLOCK
      ?auto_34354 - BLOCK
    )
    :vars
    (
      ?auto_34356 - BLOCK
      ?auto_34355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34351 ) ( ON ?auto_34352 ?auto_34351 ) ( not ( = ?auto_34351 ?auto_34352 ) ) ( not ( = ?auto_34351 ?auto_34353 ) ) ( not ( = ?auto_34351 ?auto_34354 ) ) ( not ( = ?auto_34351 ?auto_34356 ) ) ( not ( = ?auto_34352 ?auto_34353 ) ) ( not ( = ?auto_34352 ?auto_34354 ) ) ( not ( = ?auto_34352 ?auto_34356 ) ) ( not ( = ?auto_34353 ?auto_34354 ) ) ( not ( = ?auto_34353 ?auto_34356 ) ) ( not ( = ?auto_34354 ?auto_34356 ) ) ( ON ?auto_34356 ?auto_34355 ) ( not ( = ?auto_34351 ?auto_34355 ) ) ( not ( = ?auto_34352 ?auto_34355 ) ) ( not ( = ?auto_34353 ?auto_34355 ) ) ( not ( = ?auto_34354 ?auto_34355 ) ) ( not ( = ?auto_34356 ?auto_34355 ) ) ( ON ?auto_34354 ?auto_34356 ) ( ON-TABLE ?auto_34355 ) ( CLEAR ?auto_34352 ) ( ON ?auto_34353 ?auto_34354 ) ( CLEAR ?auto_34353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34355 ?auto_34356 ?auto_34354 )
      ( MAKE-4PILE ?auto_34351 ?auto_34352 ?auto_34353 ?auto_34354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34357 - BLOCK
      ?auto_34358 - BLOCK
      ?auto_34359 - BLOCK
      ?auto_34360 - BLOCK
    )
    :vars
    (
      ?auto_34361 - BLOCK
      ?auto_34362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34357 ) ( not ( = ?auto_34357 ?auto_34358 ) ) ( not ( = ?auto_34357 ?auto_34359 ) ) ( not ( = ?auto_34357 ?auto_34360 ) ) ( not ( = ?auto_34357 ?auto_34361 ) ) ( not ( = ?auto_34358 ?auto_34359 ) ) ( not ( = ?auto_34358 ?auto_34360 ) ) ( not ( = ?auto_34358 ?auto_34361 ) ) ( not ( = ?auto_34359 ?auto_34360 ) ) ( not ( = ?auto_34359 ?auto_34361 ) ) ( not ( = ?auto_34360 ?auto_34361 ) ) ( ON ?auto_34361 ?auto_34362 ) ( not ( = ?auto_34357 ?auto_34362 ) ) ( not ( = ?auto_34358 ?auto_34362 ) ) ( not ( = ?auto_34359 ?auto_34362 ) ) ( not ( = ?auto_34360 ?auto_34362 ) ) ( not ( = ?auto_34361 ?auto_34362 ) ) ( ON ?auto_34360 ?auto_34361 ) ( ON-TABLE ?auto_34362 ) ( ON ?auto_34359 ?auto_34360 ) ( CLEAR ?auto_34359 ) ( HOLDING ?auto_34358 ) ( CLEAR ?auto_34357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34357 ?auto_34358 )
      ( MAKE-4PILE ?auto_34357 ?auto_34358 ?auto_34359 ?auto_34360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34363 - BLOCK
      ?auto_34364 - BLOCK
      ?auto_34365 - BLOCK
      ?auto_34366 - BLOCK
    )
    :vars
    (
      ?auto_34368 - BLOCK
      ?auto_34367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34363 ) ( not ( = ?auto_34363 ?auto_34364 ) ) ( not ( = ?auto_34363 ?auto_34365 ) ) ( not ( = ?auto_34363 ?auto_34366 ) ) ( not ( = ?auto_34363 ?auto_34368 ) ) ( not ( = ?auto_34364 ?auto_34365 ) ) ( not ( = ?auto_34364 ?auto_34366 ) ) ( not ( = ?auto_34364 ?auto_34368 ) ) ( not ( = ?auto_34365 ?auto_34366 ) ) ( not ( = ?auto_34365 ?auto_34368 ) ) ( not ( = ?auto_34366 ?auto_34368 ) ) ( ON ?auto_34368 ?auto_34367 ) ( not ( = ?auto_34363 ?auto_34367 ) ) ( not ( = ?auto_34364 ?auto_34367 ) ) ( not ( = ?auto_34365 ?auto_34367 ) ) ( not ( = ?auto_34366 ?auto_34367 ) ) ( not ( = ?auto_34368 ?auto_34367 ) ) ( ON ?auto_34366 ?auto_34368 ) ( ON-TABLE ?auto_34367 ) ( ON ?auto_34365 ?auto_34366 ) ( CLEAR ?auto_34363 ) ( ON ?auto_34364 ?auto_34365 ) ( CLEAR ?auto_34364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34367 ?auto_34368 ?auto_34366 ?auto_34365 )
      ( MAKE-4PILE ?auto_34363 ?auto_34364 ?auto_34365 ?auto_34366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34369 - BLOCK
      ?auto_34370 - BLOCK
      ?auto_34371 - BLOCK
      ?auto_34372 - BLOCK
    )
    :vars
    (
      ?auto_34373 - BLOCK
      ?auto_34374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34369 ?auto_34370 ) ) ( not ( = ?auto_34369 ?auto_34371 ) ) ( not ( = ?auto_34369 ?auto_34372 ) ) ( not ( = ?auto_34369 ?auto_34373 ) ) ( not ( = ?auto_34370 ?auto_34371 ) ) ( not ( = ?auto_34370 ?auto_34372 ) ) ( not ( = ?auto_34370 ?auto_34373 ) ) ( not ( = ?auto_34371 ?auto_34372 ) ) ( not ( = ?auto_34371 ?auto_34373 ) ) ( not ( = ?auto_34372 ?auto_34373 ) ) ( ON ?auto_34373 ?auto_34374 ) ( not ( = ?auto_34369 ?auto_34374 ) ) ( not ( = ?auto_34370 ?auto_34374 ) ) ( not ( = ?auto_34371 ?auto_34374 ) ) ( not ( = ?auto_34372 ?auto_34374 ) ) ( not ( = ?auto_34373 ?auto_34374 ) ) ( ON ?auto_34372 ?auto_34373 ) ( ON-TABLE ?auto_34374 ) ( ON ?auto_34371 ?auto_34372 ) ( ON ?auto_34370 ?auto_34371 ) ( CLEAR ?auto_34370 ) ( HOLDING ?auto_34369 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34369 )
      ( MAKE-4PILE ?auto_34369 ?auto_34370 ?auto_34371 ?auto_34372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34375 - BLOCK
      ?auto_34376 - BLOCK
      ?auto_34377 - BLOCK
      ?auto_34378 - BLOCK
    )
    :vars
    (
      ?auto_34380 - BLOCK
      ?auto_34379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34375 ?auto_34376 ) ) ( not ( = ?auto_34375 ?auto_34377 ) ) ( not ( = ?auto_34375 ?auto_34378 ) ) ( not ( = ?auto_34375 ?auto_34380 ) ) ( not ( = ?auto_34376 ?auto_34377 ) ) ( not ( = ?auto_34376 ?auto_34378 ) ) ( not ( = ?auto_34376 ?auto_34380 ) ) ( not ( = ?auto_34377 ?auto_34378 ) ) ( not ( = ?auto_34377 ?auto_34380 ) ) ( not ( = ?auto_34378 ?auto_34380 ) ) ( ON ?auto_34380 ?auto_34379 ) ( not ( = ?auto_34375 ?auto_34379 ) ) ( not ( = ?auto_34376 ?auto_34379 ) ) ( not ( = ?auto_34377 ?auto_34379 ) ) ( not ( = ?auto_34378 ?auto_34379 ) ) ( not ( = ?auto_34380 ?auto_34379 ) ) ( ON ?auto_34378 ?auto_34380 ) ( ON-TABLE ?auto_34379 ) ( ON ?auto_34377 ?auto_34378 ) ( ON ?auto_34376 ?auto_34377 ) ( ON ?auto_34375 ?auto_34376 ) ( CLEAR ?auto_34375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34379 ?auto_34380 ?auto_34378 ?auto_34377 ?auto_34376 )
      ( MAKE-4PILE ?auto_34375 ?auto_34376 ?auto_34377 ?auto_34378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34382 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34382 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_34382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34383 - BLOCK
    )
    :vars
    (
      ?auto_34384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34383 ?auto_34384 ) ( CLEAR ?auto_34383 ) ( HAND-EMPTY ) ( not ( = ?auto_34383 ?auto_34384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34383 ?auto_34384 )
      ( MAKE-1PILE ?auto_34383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34385 - BLOCK
    )
    :vars
    (
      ?auto_34386 - BLOCK
      ?auto_34389 - BLOCK
      ?auto_34388 - BLOCK
      ?auto_34387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34385 ?auto_34386 ) ) ( HOLDING ?auto_34385 ) ( CLEAR ?auto_34386 ) ( ON-TABLE ?auto_34389 ) ( ON ?auto_34388 ?auto_34389 ) ( ON ?auto_34387 ?auto_34388 ) ( ON ?auto_34386 ?auto_34387 ) ( not ( = ?auto_34389 ?auto_34388 ) ) ( not ( = ?auto_34389 ?auto_34387 ) ) ( not ( = ?auto_34389 ?auto_34386 ) ) ( not ( = ?auto_34389 ?auto_34385 ) ) ( not ( = ?auto_34388 ?auto_34387 ) ) ( not ( = ?auto_34388 ?auto_34386 ) ) ( not ( = ?auto_34388 ?auto_34385 ) ) ( not ( = ?auto_34387 ?auto_34386 ) ) ( not ( = ?auto_34387 ?auto_34385 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34389 ?auto_34388 ?auto_34387 ?auto_34386 ?auto_34385 )
      ( MAKE-1PILE ?auto_34385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34390 - BLOCK
    )
    :vars
    (
      ?auto_34394 - BLOCK
      ?auto_34391 - BLOCK
      ?auto_34392 - BLOCK
      ?auto_34393 - BLOCK
      ?auto_34395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34390 ?auto_34394 ) ) ( CLEAR ?auto_34394 ) ( ON-TABLE ?auto_34391 ) ( ON ?auto_34392 ?auto_34391 ) ( ON ?auto_34393 ?auto_34392 ) ( ON ?auto_34394 ?auto_34393 ) ( not ( = ?auto_34391 ?auto_34392 ) ) ( not ( = ?auto_34391 ?auto_34393 ) ) ( not ( = ?auto_34391 ?auto_34394 ) ) ( not ( = ?auto_34391 ?auto_34390 ) ) ( not ( = ?auto_34392 ?auto_34393 ) ) ( not ( = ?auto_34392 ?auto_34394 ) ) ( not ( = ?auto_34392 ?auto_34390 ) ) ( not ( = ?auto_34393 ?auto_34394 ) ) ( not ( = ?auto_34393 ?auto_34390 ) ) ( ON ?auto_34390 ?auto_34395 ) ( CLEAR ?auto_34390 ) ( HAND-EMPTY ) ( not ( = ?auto_34390 ?auto_34395 ) ) ( not ( = ?auto_34394 ?auto_34395 ) ) ( not ( = ?auto_34391 ?auto_34395 ) ) ( not ( = ?auto_34392 ?auto_34395 ) ) ( not ( = ?auto_34393 ?auto_34395 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34390 ?auto_34395 )
      ( MAKE-1PILE ?auto_34390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34396 - BLOCK
    )
    :vars
    (
      ?auto_34397 - BLOCK
      ?auto_34399 - BLOCK
      ?auto_34400 - BLOCK
      ?auto_34401 - BLOCK
      ?auto_34398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34396 ?auto_34397 ) ) ( ON-TABLE ?auto_34399 ) ( ON ?auto_34400 ?auto_34399 ) ( ON ?auto_34401 ?auto_34400 ) ( not ( = ?auto_34399 ?auto_34400 ) ) ( not ( = ?auto_34399 ?auto_34401 ) ) ( not ( = ?auto_34399 ?auto_34397 ) ) ( not ( = ?auto_34399 ?auto_34396 ) ) ( not ( = ?auto_34400 ?auto_34401 ) ) ( not ( = ?auto_34400 ?auto_34397 ) ) ( not ( = ?auto_34400 ?auto_34396 ) ) ( not ( = ?auto_34401 ?auto_34397 ) ) ( not ( = ?auto_34401 ?auto_34396 ) ) ( ON ?auto_34396 ?auto_34398 ) ( CLEAR ?auto_34396 ) ( not ( = ?auto_34396 ?auto_34398 ) ) ( not ( = ?auto_34397 ?auto_34398 ) ) ( not ( = ?auto_34399 ?auto_34398 ) ) ( not ( = ?auto_34400 ?auto_34398 ) ) ( not ( = ?auto_34401 ?auto_34398 ) ) ( HOLDING ?auto_34397 ) ( CLEAR ?auto_34401 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34399 ?auto_34400 ?auto_34401 ?auto_34397 )
      ( MAKE-1PILE ?auto_34396 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34402 - BLOCK
    )
    :vars
    (
      ?auto_34407 - BLOCK
      ?auto_34403 - BLOCK
      ?auto_34406 - BLOCK
      ?auto_34405 - BLOCK
      ?auto_34404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34402 ?auto_34407 ) ) ( ON-TABLE ?auto_34403 ) ( ON ?auto_34406 ?auto_34403 ) ( ON ?auto_34405 ?auto_34406 ) ( not ( = ?auto_34403 ?auto_34406 ) ) ( not ( = ?auto_34403 ?auto_34405 ) ) ( not ( = ?auto_34403 ?auto_34407 ) ) ( not ( = ?auto_34403 ?auto_34402 ) ) ( not ( = ?auto_34406 ?auto_34405 ) ) ( not ( = ?auto_34406 ?auto_34407 ) ) ( not ( = ?auto_34406 ?auto_34402 ) ) ( not ( = ?auto_34405 ?auto_34407 ) ) ( not ( = ?auto_34405 ?auto_34402 ) ) ( ON ?auto_34402 ?auto_34404 ) ( not ( = ?auto_34402 ?auto_34404 ) ) ( not ( = ?auto_34407 ?auto_34404 ) ) ( not ( = ?auto_34403 ?auto_34404 ) ) ( not ( = ?auto_34406 ?auto_34404 ) ) ( not ( = ?auto_34405 ?auto_34404 ) ) ( CLEAR ?auto_34405 ) ( ON ?auto_34407 ?auto_34402 ) ( CLEAR ?auto_34407 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34404 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34404 ?auto_34402 )
      ( MAKE-1PILE ?auto_34402 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34408 - BLOCK
    )
    :vars
    (
      ?auto_34409 - BLOCK
      ?auto_34410 - BLOCK
      ?auto_34413 - BLOCK
      ?auto_34412 - BLOCK
      ?auto_34411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34408 ?auto_34409 ) ) ( ON-TABLE ?auto_34410 ) ( ON ?auto_34413 ?auto_34410 ) ( not ( = ?auto_34410 ?auto_34413 ) ) ( not ( = ?auto_34410 ?auto_34412 ) ) ( not ( = ?auto_34410 ?auto_34409 ) ) ( not ( = ?auto_34410 ?auto_34408 ) ) ( not ( = ?auto_34413 ?auto_34412 ) ) ( not ( = ?auto_34413 ?auto_34409 ) ) ( not ( = ?auto_34413 ?auto_34408 ) ) ( not ( = ?auto_34412 ?auto_34409 ) ) ( not ( = ?auto_34412 ?auto_34408 ) ) ( ON ?auto_34408 ?auto_34411 ) ( not ( = ?auto_34408 ?auto_34411 ) ) ( not ( = ?auto_34409 ?auto_34411 ) ) ( not ( = ?auto_34410 ?auto_34411 ) ) ( not ( = ?auto_34413 ?auto_34411 ) ) ( not ( = ?auto_34412 ?auto_34411 ) ) ( ON ?auto_34409 ?auto_34408 ) ( CLEAR ?auto_34409 ) ( ON-TABLE ?auto_34411 ) ( HOLDING ?auto_34412 ) ( CLEAR ?auto_34413 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34410 ?auto_34413 ?auto_34412 )
      ( MAKE-1PILE ?auto_34408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34414 - BLOCK
    )
    :vars
    (
      ?auto_34417 - BLOCK
      ?auto_34416 - BLOCK
      ?auto_34418 - BLOCK
      ?auto_34415 - BLOCK
      ?auto_34419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34414 ?auto_34417 ) ) ( ON-TABLE ?auto_34416 ) ( ON ?auto_34418 ?auto_34416 ) ( not ( = ?auto_34416 ?auto_34418 ) ) ( not ( = ?auto_34416 ?auto_34415 ) ) ( not ( = ?auto_34416 ?auto_34417 ) ) ( not ( = ?auto_34416 ?auto_34414 ) ) ( not ( = ?auto_34418 ?auto_34415 ) ) ( not ( = ?auto_34418 ?auto_34417 ) ) ( not ( = ?auto_34418 ?auto_34414 ) ) ( not ( = ?auto_34415 ?auto_34417 ) ) ( not ( = ?auto_34415 ?auto_34414 ) ) ( ON ?auto_34414 ?auto_34419 ) ( not ( = ?auto_34414 ?auto_34419 ) ) ( not ( = ?auto_34417 ?auto_34419 ) ) ( not ( = ?auto_34416 ?auto_34419 ) ) ( not ( = ?auto_34418 ?auto_34419 ) ) ( not ( = ?auto_34415 ?auto_34419 ) ) ( ON ?auto_34417 ?auto_34414 ) ( ON-TABLE ?auto_34419 ) ( CLEAR ?auto_34418 ) ( ON ?auto_34415 ?auto_34417 ) ( CLEAR ?auto_34415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34419 ?auto_34414 ?auto_34417 )
      ( MAKE-1PILE ?auto_34414 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34420 - BLOCK
    )
    :vars
    (
      ?auto_34424 - BLOCK
      ?auto_34421 - BLOCK
      ?auto_34423 - BLOCK
      ?auto_34425 - BLOCK
      ?auto_34422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34420 ?auto_34424 ) ) ( ON-TABLE ?auto_34421 ) ( not ( = ?auto_34421 ?auto_34423 ) ) ( not ( = ?auto_34421 ?auto_34425 ) ) ( not ( = ?auto_34421 ?auto_34424 ) ) ( not ( = ?auto_34421 ?auto_34420 ) ) ( not ( = ?auto_34423 ?auto_34425 ) ) ( not ( = ?auto_34423 ?auto_34424 ) ) ( not ( = ?auto_34423 ?auto_34420 ) ) ( not ( = ?auto_34425 ?auto_34424 ) ) ( not ( = ?auto_34425 ?auto_34420 ) ) ( ON ?auto_34420 ?auto_34422 ) ( not ( = ?auto_34420 ?auto_34422 ) ) ( not ( = ?auto_34424 ?auto_34422 ) ) ( not ( = ?auto_34421 ?auto_34422 ) ) ( not ( = ?auto_34423 ?auto_34422 ) ) ( not ( = ?auto_34425 ?auto_34422 ) ) ( ON ?auto_34424 ?auto_34420 ) ( ON-TABLE ?auto_34422 ) ( ON ?auto_34425 ?auto_34424 ) ( CLEAR ?auto_34425 ) ( HOLDING ?auto_34423 ) ( CLEAR ?auto_34421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34421 ?auto_34423 )
      ( MAKE-1PILE ?auto_34420 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34426 - BLOCK
    )
    :vars
    (
      ?auto_34427 - BLOCK
      ?auto_34429 - BLOCK
      ?auto_34428 - BLOCK
      ?auto_34431 - BLOCK
      ?auto_34430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34426 ?auto_34427 ) ) ( ON-TABLE ?auto_34429 ) ( not ( = ?auto_34429 ?auto_34428 ) ) ( not ( = ?auto_34429 ?auto_34431 ) ) ( not ( = ?auto_34429 ?auto_34427 ) ) ( not ( = ?auto_34429 ?auto_34426 ) ) ( not ( = ?auto_34428 ?auto_34431 ) ) ( not ( = ?auto_34428 ?auto_34427 ) ) ( not ( = ?auto_34428 ?auto_34426 ) ) ( not ( = ?auto_34431 ?auto_34427 ) ) ( not ( = ?auto_34431 ?auto_34426 ) ) ( ON ?auto_34426 ?auto_34430 ) ( not ( = ?auto_34426 ?auto_34430 ) ) ( not ( = ?auto_34427 ?auto_34430 ) ) ( not ( = ?auto_34429 ?auto_34430 ) ) ( not ( = ?auto_34428 ?auto_34430 ) ) ( not ( = ?auto_34431 ?auto_34430 ) ) ( ON ?auto_34427 ?auto_34426 ) ( ON-TABLE ?auto_34430 ) ( ON ?auto_34431 ?auto_34427 ) ( CLEAR ?auto_34429 ) ( ON ?auto_34428 ?auto_34431 ) ( CLEAR ?auto_34428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34430 ?auto_34426 ?auto_34427 ?auto_34431 )
      ( MAKE-1PILE ?auto_34426 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34432 - BLOCK
    )
    :vars
    (
      ?auto_34436 - BLOCK
      ?auto_34437 - BLOCK
      ?auto_34434 - BLOCK
      ?auto_34433 - BLOCK
      ?auto_34435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34432 ?auto_34436 ) ) ( not ( = ?auto_34437 ?auto_34434 ) ) ( not ( = ?auto_34437 ?auto_34433 ) ) ( not ( = ?auto_34437 ?auto_34436 ) ) ( not ( = ?auto_34437 ?auto_34432 ) ) ( not ( = ?auto_34434 ?auto_34433 ) ) ( not ( = ?auto_34434 ?auto_34436 ) ) ( not ( = ?auto_34434 ?auto_34432 ) ) ( not ( = ?auto_34433 ?auto_34436 ) ) ( not ( = ?auto_34433 ?auto_34432 ) ) ( ON ?auto_34432 ?auto_34435 ) ( not ( = ?auto_34432 ?auto_34435 ) ) ( not ( = ?auto_34436 ?auto_34435 ) ) ( not ( = ?auto_34437 ?auto_34435 ) ) ( not ( = ?auto_34434 ?auto_34435 ) ) ( not ( = ?auto_34433 ?auto_34435 ) ) ( ON ?auto_34436 ?auto_34432 ) ( ON-TABLE ?auto_34435 ) ( ON ?auto_34433 ?auto_34436 ) ( ON ?auto_34434 ?auto_34433 ) ( CLEAR ?auto_34434 ) ( HOLDING ?auto_34437 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34437 )
      ( MAKE-1PILE ?auto_34432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34438 - BLOCK
    )
    :vars
    (
      ?auto_34442 - BLOCK
      ?auto_34443 - BLOCK
      ?auto_34439 - BLOCK
      ?auto_34441 - BLOCK
      ?auto_34440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34438 ?auto_34442 ) ) ( not ( = ?auto_34443 ?auto_34439 ) ) ( not ( = ?auto_34443 ?auto_34441 ) ) ( not ( = ?auto_34443 ?auto_34442 ) ) ( not ( = ?auto_34443 ?auto_34438 ) ) ( not ( = ?auto_34439 ?auto_34441 ) ) ( not ( = ?auto_34439 ?auto_34442 ) ) ( not ( = ?auto_34439 ?auto_34438 ) ) ( not ( = ?auto_34441 ?auto_34442 ) ) ( not ( = ?auto_34441 ?auto_34438 ) ) ( ON ?auto_34438 ?auto_34440 ) ( not ( = ?auto_34438 ?auto_34440 ) ) ( not ( = ?auto_34442 ?auto_34440 ) ) ( not ( = ?auto_34443 ?auto_34440 ) ) ( not ( = ?auto_34439 ?auto_34440 ) ) ( not ( = ?auto_34441 ?auto_34440 ) ) ( ON ?auto_34442 ?auto_34438 ) ( ON-TABLE ?auto_34440 ) ( ON ?auto_34441 ?auto_34442 ) ( ON ?auto_34439 ?auto_34441 ) ( ON ?auto_34443 ?auto_34439 ) ( CLEAR ?auto_34443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34440 ?auto_34438 ?auto_34442 ?auto_34441 ?auto_34439 )
      ( MAKE-1PILE ?auto_34438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34447 - BLOCK
      ?auto_34448 - BLOCK
      ?auto_34449 - BLOCK
    )
    :vars
    (
      ?auto_34450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34450 ?auto_34449 ) ( CLEAR ?auto_34450 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34447 ) ( ON ?auto_34448 ?auto_34447 ) ( ON ?auto_34449 ?auto_34448 ) ( not ( = ?auto_34447 ?auto_34448 ) ) ( not ( = ?auto_34447 ?auto_34449 ) ) ( not ( = ?auto_34447 ?auto_34450 ) ) ( not ( = ?auto_34448 ?auto_34449 ) ) ( not ( = ?auto_34448 ?auto_34450 ) ) ( not ( = ?auto_34449 ?auto_34450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34450 ?auto_34449 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34451 - BLOCK
      ?auto_34452 - BLOCK
      ?auto_34453 - BLOCK
    )
    :vars
    (
      ?auto_34454 - BLOCK
      ?auto_34455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34454 ?auto_34453 ) ( CLEAR ?auto_34454 ) ( ON-TABLE ?auto_34451 ) ( ON ?auto_34452 ?auto_34451 ) ( ON ?auto_34453 ?auto_34452 ) ( not ( = ?auto_34451 ?auto_34452 ) ) ( not ( = ?auto_34451 ?auto_34453 ) ) ( not ( = ?auto_34451 ?auto_34454 ) ) ( not ( = ?auto_34452 ?auto_34453 ) ) ( not ( = ?auto_34452 ?auto_34454 ) ) ( not ( = ?auto_34453 ?auto_34454 ) ) ( HOLDING ?auto_34455 ) ( not ( = ?auto_34451 ?auto_34455 ) ) ( not ( = ?auto_34452 ?auto_34455 ) ) ( not ( = ?auto_34453 ?auto_34455 ) ) ( not ( = ?auto_34454 ?auto_34455 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_34455 )
      ( MAKE-3PILE ?auto_34451 ?auto_34452 ?auto_34453 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34456 - BLOCK
      ?auto_34457 - BLOCK
      ?auto_34458 - BLOCK
    )
    :vars
    (
      ?auto_34460 - BLOCK
      ?auto_34459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34460 ?auto_34458 ) ( ON-TABLE ?auto_34456 ) ( ON ?auto_34457 ?auto_34456 ) ( ON ?auto_34458 ?auto_34457 ) ( not ( = ?auto_34456 ?auto_34457 ) ) ( not ( = ?auto_34456 ?auto_34458 ) ) ( not ( = ?auto_34456 ?auto_34460 ) ) ( not ( = ?auto_34457 ?auto_34458 ) ) ( not ( = ?auto_34457 ?auto_34460 ) ) ( not ( = ?auto_34458 ?auto_34460 ) ) ( not ( = ?auto_34456 ?auto_34459 ) ) ( not ( = ?auto_34457 ?auto_34459 ) ) ( not ( = ?auto_34458 ?auto_34459 ) ) ( not ( = ?auto_34460 ?auto_34459 ) ) ( ON ?auto_34459 ?auto_34460 ) ( CLEAR ?auto_34459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34456 ?auto_34457 ?auto_34458 ?auto_34460 )
      ( MAKE-3PILE ?auto_34456 ?auto_34457 ?auto_34458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34461 - BLOCK
      ?auto_34462 - BLOCK
      ?auto_34463 - BLOCK
    )
    :vars
    (
      ?auto_34464 - BLOCK
      ?auto_34465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34464 ?auto_34463 ) ( ON-TABLE ?auto_34461 ) ( ON ?auto_34462 ?auto_34461 ) ( ON ?auto_34463 ?auto_34462 ) ( not ( = ?auto_34461 ?auto_34462 ) ) ( not ( = ?auto_34461 ?auto_34463 ) ) ( not ( = ?auto_34461 ?auto_34464 ) ) ( not ( = ?auto_34462 ?auto_34463 ) ) ( not ( = ?auto_34462 ?auto_34464 ) ) ( not ( = ?auto_34463 ?auto_34464 ) ) ( not ( = ?auto_34461 ?auto_34465 ) ) ( not ( = ?auto_34462 ?auto_34465 ) ) ( not ( = ?auto_34463 ?auto_34465 ) ) ( not ( = ?auto_34464 ?auto_34465 ) ) ( HOLDING ?auto_34465 ) ( CLEAR ?auto_34464 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34461 ?auto_34462 ?auto_34463 ?auto_34464 ?auto_34465 )
      ( MAKE-3PILE ?auto_34461 ?auto_34462 ?auto_34463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34466 - BLOCK
      ?auto_34467 - BLOCK
      ?auto_34468 - BLOCK
    )
    :vars
    (
      ?auto_34469 - BLOCK
      ?auto_34470 - BLOCK
      ?auto_34471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34469 ?auto_34468 ) ( ON-TABLE ?auto_34466 ) ( ON ?auto_34467 ?auto_34466 ) ( ON ?auto_34468 ?auto_34467 ) ( not ( = ?auto_34466 ?auto_34467 ) ) ( not ( = ?auto_34466 ?auto_34468 ) ) ( not ( = ?auto_34466 ?auto_34469 ) ) ( not ( = ?auto_34467 ?auto_34468 ) ) ( not ( = ?auto_34467 ?auto_34469 ) ) ( not ( = ?auto_34468 ?auto_34469 ) ) ( not ( = ?auto_34466 ?auto_34470 ) ) ( not ( = ?auto_34467 ?auto_34470 ) ) ( not ( = ?auto_34468 ?auto_34470 ) ) ( not ( = ?auto_34469 ?auto_34470 ) ) ( CLEAR ?auto_34469 ) ( ON ?auto_34470 ?auto_34471 ) ( CLEAR ?auto_34470 ) ( HAND-EMPTY ) ( not ( = ?auto_34466 ?auto_34471 ) ) ( not ( = ?auto_34467 ?auto_34471 ) ) ( not ( = ?auto_34468 ?auto_34471 ) ) ( not ( = ?auto_34469 ?auto_34471 ) ) ( not ( = ?auto_34470 ?auto_34471 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34470 ?auto_34471 )
      ( MAKE-3PILE ?auto_34466 ?auto_34467 ?auto_34468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34484 - BLOCK
      ?auto_34485 - BLOCK
      ?auto_34486 - BLOCK
    )
    :vars
    (
      ?auto_34487 - BLOCK
      ?auto_34488 - BLOCK
      ?auto_34489 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34484 ) ( ON ?auto_34485 ?auto_34484 ) ( not ( = ?auto_34484 ?auto_34485 ) ) ( not ( = ?auto_34484 ?auto_34486 ) ) ( not ( = ?auto_34484 ?auto_34487 ) ) ( not ( = ?auto_34485 ?auto_34486 ) ) ( not ( = ?auto_34485 ?auto_34487 ) ) ( not ( = ?auto_34486 ?auto_34487 ) ) ( not ( = ?auto_34484 ?auto_34488 ) ) ( not ( = ?auto_34485 ?auto_34488 ) ) ( not ( = ?auto_34486 ?auto_34488 ) ) ( not ( = ?auto_34487 ?auto_34488 ) ) ( ON ?auto_34488 ?auto_34489 ) ( not ( = ?auto_34484 ?auto_34489 ) ) ( not ( = ?auto_34485 ?auto_34489 ) ) ( not ( = ?auto_34486 ?auto_34489 ) ) ( not ( = ?auto_34487 ?auto_34489 ) ) ( not ( = ?auto_34488 ?auto_34489 ) ) ( ON ?auto_34487 ?auto_34488 ) ( CLEAR ?auto_34487 ) ( HOLDING ?auto_34486 ) ( CLEAR ?auto_34485 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34484 ?auto_34485 ?auto_34486 ?auto_34487 )
      ( MAKE-3PILE ?auto_34484 ?auto_34485 ?auto_34486 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34490 - BLOCK
      ?auto_34491 - BLOCK
      ?auto_34492 - BLOCK
    )
    :vars
    (
      ?auto_34494 - BLOCK
      ?auto_34493 - BLOCK
      ?auto_34495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34490 ) ( ON ?auto_34491 ?auto_34490 ) ( not ( = ?auto_34490 ?auto_34491 ) ) ( not ( = ?auto_34490 ?auto_34492 ) ) ( not ( = ?auto_34490 ?auto_34494 ) ) ( not ( = ?auto_34491 ?auto_34492 ) ) ( not ( = ?auto_34491 ?auto_34494 ) ) ( not ( = ?auto_34492 ?auto_34494 ) ) ( not ( = ?auto_34490 ?auto_34493 ) ) ( not ( = ?auto_34491 ?auto_34493 ) ) ( not ( = ?auto_34492 ?auto_34493 ) ) ( not ( = ?auto_34494 ?auto_34493 ) ) ( ON ?auto_34493 ?auto_34495 ) ( not ( = ?auto_34490 ?auto_34495 ) ) ( not ( = ?auto_34491 ?auto_34495 ) ) ( not ( = ?auto_34492 ?auto_34495 ) ) ( not ( = ?auto_34494 ?auto_34495 ) ) ( not ( = ?auto_34493 ?auto_34495 ) ) ( ON ?auto_34494 ?auto_34493 ) ( CLEAR ?auto_34491 ) ( ON ?auto_34492 ?auto_34494 ) ( CLEAR ?auto_34492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34495 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34495 ?auto_34493 ?auto_34494 )
      ( MAKE-3PILE ?auto_34490 ?auto_34491 ?auto_34492 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34496 - BLOCK
      ?auto_34497 - BLOCK
      ?auto_34498 - BLOCK
    )
    :vars
    (
      ?auto_34499 - BLOCK
      ?auto_34500 - BLOCK
      ?auto_34501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34496 ) ( not ( = ?auto_34496 ?auto_34497 ) ) ( not ( = ?auto_34496 ?auto_34498 ) ) ( not ( = ?auto_34496 ?auto_34499 ) ) ( not ( = ?auto_34497 ?auto_34498 ) ) ( not ( = ?auto_34497 ?auto_34499 ) ) ( not ( = ?auto_34498 ?auto_34499 ) ) ( not ( = ?auto_34496 ?auto_34500 ) ) ( not ( = ?auto_34497 ?auto_34500 ) ) ( not ( = ?auto_34498 ?auto_34500 ) ) ( not ( = ?auto_34499 ?auto_34500 ) ) ( ON ?auto_34500 ?auto_34501 ) ( not ( = ?auto_34496 ?auto_34501 ) ) ( not ( = ?auto_34497 ?auto_34501 ) ) ( not ( = ?auto_34498 ?auto_34501 ) ) ( not ( = ?auto_34499 ?auto_34501 ) ) ( not ( = ?auto_34500 ?auto_34501 ) ) ( ON ?auto_34499 ?auto_34500 ) ( ON ?auto_34498 ?auto_34499 ) ( CLEAR ?auto_34498 ) ( ON-TABLE ?auto_34501 ) ( HOLDING ?auto_34497 ) ( CLEAR ?auto_34496 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34496 ?auto_34497 )
      ( MAKE-3PILE ?auto_34496 ?auto_34497 ?auto_34498 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34502 - BLOCK
      ?auto_34503 - BLOCK
      ?auto_34504 - BLOCK
    )
    :vars
    (
      ?auto_34507 - BLOCK
      ?auto_34506 - BLOCK
      ?auto_34505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34502 ) ( not ( = ?auto_34502 ?auto_34503 ) ) ( not ( = ?auto_34502 ?auto_34504 ) ) ( not ( = ?auto_34502 ?auto_34507 ) ) ( not ( = ?auto_34503 ?auto_34504 ) ) ( not ( = ?auto_34503 ?auto_34507 ) ) ( not ( = ?auto_34504 ?auto_34507 ) ) ( not ( = ?auto_34502 ?auto_34506 ) ) ( not ( = ?auto_34503 ?auto_34506 ) ) ( not ( = ?auto_34504 ?auto_34506 ) ) ( not ( = ?auto_34507 ?auto_34506 ) ) ( ON ?auto_34506 ?auto_34505 ) ( not ( = ?auto_34502 ?auto_34505 ) ) ( not ( = ?auto_34503 ?auto_34505 ) ) ( not ( = ?auto_34504 ?auto_34505 ) ) ( not ( = ?auto_34507 ?auto_34505 ) ) ( not ( = ?auto_34506 ?auto_34505 ) ) ( ON ?auto_34507 ?auto_34506 ) ( ON ?auto_34504 ?auto_34507 ) ( ON-TABLE ?auto_34505 ) ( CLEAR ?auto_34502 ) ( ON ?auto_34503 ?auto_34504 ) ( CLEAR ?auto_34503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34505 ?auto_34506 ?auto_34507 ?auto_34504 )
      ( MAKE-3PILE ?auto_34502 ?auto_34503 ?auto_34504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34508 - BLOCK
      ?auto_34509 - BLOCK
      ?auto_34510 - BLOCK
    )
    :vars
    (
      ?auto_34512 - BLOCK
      ?auto_34513 - BLOCK
      ?auto_34511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34508 ?auto_34509 ) ) ( not ( = ?auto_34508 ?auto_34510 ) ) ( not ( = ?auto_34508 ?auto_34512 ) ) ( not ( = ?auto_34509 ?auto_34510 ) ) ( not ( = ?auto_34509 ?auto_34512 ) ) ( not ( = ?auto_34510 ?auto_34512 ) ) ( not ( = ?auto_34508 ?auto_34513 ) ) ( not ( = ?auto_34509 ?auto_34513 ) ) ( not ( = ?auto_34510 ?auto_34513 ) ) ( not ( = ?auto_34512 ?auto_34513 ) ) ( ON ?auto_34513 ?auto_34511 ) ( not ( = ?auto_34508 ?auto_34511 ) ) ( not ( = ?auto_34509 ?auto_34511 ) ) ( not ( = ?auto_34510 ?auto_34511 ) ) ( not ( = ?auto_34512 ?auto_34511 ) ) ( not ( = ?auto_34513 ?auto_34511 ) ) ( ON ?auto_34512 ?auto_34513 ) ( ON ?auto_34510 ?auto_34512 ) ( ON-TABLE ?auto_34511 ) ( ON ?auto_34509 ?auto_34510 ) ( CLEAR ?auto_34509 ) ( HOLDING ?auto_34508 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34508 )
      ( MAKE-3PILE ?auto_34508 ?auto_34509 ?auto_34510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34514 - BLOCK
      ?auto_34515 - BLOCK
      ?auto_34516 - BLOCK
    )
    :vars
    (
      ?auto_34517 - BLOCK
      ?auto_34519 - BLOCK
      ?auto_34518 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34514 ?auto_34515 ) ) ( not ( = ?auto_34514 ?auto_34516 ) ) ( not ( = ?auto_34514 ?auto_34517 ) ) ( not ( = ?auto_34515 ?auto_34516 ) ) ( not ( = ?auto_34515 ?auto_34517 ) ) ( not ( = ?auto_34516 ?auto_34517 ) ) ( not ( = ?auto_34514 ?auto_34519 ) ) ( not ( = ?auto_34515 ?auto_34519 ) ) ( not ( = ?auto_34516 ?auto_34519 ) ) ( not ( = ?auto_34517 ?auto_34519 ) ) ( ON ?auto_34519 ?auto_34518 ) ( not ( = ?auto_34514 ?auto_34518 ) ) ( not ( = ?auto_34515 ?auto_34518 ) ) ( not ( = ?auto_34516 ?auto_34518 ) ) ( not ( = ?auto_34517 ?auto_34518 ) ) ( not ( = ?auto_34519 ?auto_34518 ) ) ( ON ?auto_34517 ?auto_34519 ) ( ON ?auto_34516 ?auto_34517 ) ( ON-TABLE ?auto_34518 ) ( ON ?auto_34515 ?auto_34516 ) ( ON ?auto_34514 ?auto_34515 ) ( CLEAR ?auto_34514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34518 ?auto_34519 ?auto_34517 ?auto_34516 ?auto_34515 )
      ( MAKE-3PILE ?auto_34514 ?auto_34515 ?auto_34516 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34522 - BLOCK
      ?auto_34523 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34523 ) ( CLEAR ?auto_34522 ) ( ON-TABLE ?auto_34522 ) ( not ( = ?auto_34522 ?auto_34523 ) ) )
    :subtasks
    ( ( !STACK ?auto_34523 ?auto_34522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34524 - BLOCK
      ?auto_34525 - BLOCK
    )
    :vars
    (
      ?auto_34526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34524 ) ( ON-TABLE ?auto_34524 ) ( not ( = ?auto_34524 ?auto_34525 ) ) ( ON ?auto_34525 ?auto_34526 ) ( CLEAR ?auto_34525 ) ( HAND-EMPTY ) ( not ( = ?auto_34524 ?auto_34526 ) ) ( not ( = ?auto_34525 ?auto_34526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34525 ?auto_34526 )
      ( MAKE-2PILE ?auto_34524 ?auto_34525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34527 - BLOCK
      ?auto_34528 - BLOCK
    )
    :vars
    (
      ?auto_34529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34527 ?auto_34528 ) ) ( ON ?auto_34528 ?auto_34529 ) ( CLEAR ?auto_34528 ) ( not ( = ?auto_34527 ?auto_34529 ) ) ( not ( = ?auto_34528 ?auto_34529 ) ) ( HOLDING ?auto_34527 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34527 )
      ( MAKE-2PILE ?auto_34527 ?auto_34528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34530 - BLOCK
      ?auto_34531 - BLOCK
    )
    :vars
    (
      ?auto_34532 - BLOCK
      ?auto_34534 - BLOCK
      ?auto_34533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34530 ?auto_34531 ) ) ( ON ?auto_34531 ?auto_34532 ) ( not ( = ?auto_34530 ?auto_34532 ) ) ( not ( = ?auto_34531 ?auto_34532 ) ) ( ON ?auto_34530 ?auto_34531 ) ( CLEAR ?auto_34530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34534 ) ( ON ?auto_34533 ?auto_34534 ) ( ON ?auto_34532 ?auto_34533 ) ( not ( = ?auto_34534 ?auto_34533 ) ) ( not ( = ?auto_34534 ?auto_34532 ) ) ( not ( = ?auto_34534 ?auto_34531 ) ) ( not ( = ?auto_34534 ?auto_34530 ) ) ( not ( = ?auto_34533 ?auto_34532 ) ) ( not ( = ?auto_34533 ?auto_34531 ) ) ( not ( = ?auto_34533 ?auto_34530 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34534 ?auto_34533 ?auto_34532 ?auto_34531 )
      ( MAKE-2PILE ?auto_34530 ?auto_34531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34535 - BLOCK
      ?auto_34536 - BLOCK
    )
    :vars
    (
      ?auto_34538 - BLOCK
      ?auto_34537 - BLOCK
      ?auto_34539 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34535 ?auto_34536 ) ) ( ON ?auto_34536 ?auto_34538 ) ( not ( = ?auto_34535 ?auto_34538 ) ) ( not ( = ?auto_34536 ?auto_34538 ) ) ( ON-TABLE ?auto_34537 ) ( ON ?auto_34539 ?auto_34537 ) ( ON ?auto_34538 ?auto_34539 ) ( not ( = ?auto_34537 ?auto_34539 ) ) ( not ( = ?auto_34537 ?auto_34538 ) ) ( not ( = ?auto_34537 ?auto_34536 ) ) ( not ( = ?auto_34537 ?auto_34535 ) ) ( not ( = ?auto_34539 ?auto_34538 ) ) ( not ( = ?auto_34539 ?auto_34536 ) ) ( not ( = ?auto_34539 ?auto_34535 ) ) ( HOLDING ?auto_34535 ) ( CLEAR ?auto_34536 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34537 ?auto_34539 ?auto_34538 ?auto_34536 ?auto_34535 )
      ( MAKE-2PILE ?auto_34535 ?auto_34536 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34540 - BLOCK
      ?auto_34541 - BLOCK
    )
    :vars
    (
      ?auto_34544 - BLOCK
      ?auto_34543 - BLOCK
      ?auto_34542 - BLOCK
      ?auto_34545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34540 ?auto_34541 ) ) ( ON ?auto_34541 ?auto_34544 ) ( not ( = ?auto_34540 ?auto_34544 ) ) ( not ( = ?auto_34541 ?auto_34544 ) ) ( ON-TABLE ?auto_34543 ) ( ON ?auto_34542 ?auto_34543 ) ( ON ?auto_34544 ?auto_34542 ) ( not ( = ?auto_34543 ?auto_34542 ) ) ( not ( = ?auto_34543 ?auto_34544 ) ) ( not ( = ?auto_34543 ?auto_34541 ) ) ( not ( = ?auto_34543 ?auto_34540 ) ) ( not ( = ?auto_34542 ?auto_34544 ) ) ( not ( = ?auto_34542 ?auto_34541 ) ) ( not ( = ?auto_34542 ?auto_34540 ) ) ( CLEAR ?auto_34541 ) ( ON ?auto_34540 ?auto_34545 ) ( CLEAR ?auto_34540 ) ( HAND-EMPTY ) ( not ( = ?auto_34540 ?auto_34545 ) ) ( not ( = ?auto_34541 ?auto_34545 ) ) ( not ( = ?auto_34544 ?auto_34545 ) ) ( not ( = ?auto_34543 ?auto_34545 ) ) ( not ( = ?auto_34542 ?auto_34545 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34540 ?auto_34545 )
      ( MAKE-2PILE ?auto_34540 ?auto_34541 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34546 - BLOCK
      ?auto_34547 - BLOCK
    )
    :vars
    (
      ?auto_34551 - BLOCK
      ?auto_34548 - BLOCK
      ?auto_34549 - BLOCK
      ?auto_34550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34546 ?auto_34547 ) ) ( not ( = ?auto_34546 ?auto_34551 ) ) ( not ( = ?auto_34547 ?auto_34551 ) ) ( ON-TABLE ?auto_34548 ) ( ON ?auto_34549 ?auto_34548 ) ( ON ?auto_34551 ?auto_34549 ) ( not ( = ?auto_34548 ?auto_34549 ) ) ( not ( = ?auto_34548 ?auto_34551 ) ) ( not ( = ?auto_34548 ?auto_34547 ) ) ( not ( = ?auto_34548 ?auto_34546 ) ) ( not ( = ?auto_34549 ?auto_34551 ) ) ( not ( = ?auto_34549 ?auto_34547 ) ) ( not ( = ?auto_34549 ?auto_34546 ) ) ( ON ?auto_34546 ?auto_34550 ) ( CLEAR ?auto_34546 ) ( not ( = ?auto_34546 ?auto_34550 ) ) ( not ( = ?auto_34547 ?auto_34550 ) ) ( not ( = ?auto_34551 ?auto_34550 ) ) ( not ( = ?auto_34548 ?auto_34550 ) ) ( not ( = ?auto_34549 ?auto_34550 ) ) ( HOLDING ?auto_34547 ) ( CLEAR ?auto_34551 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34548 ?auto_34549 ?auto_34551 ?auto_34547 )
      ( MAKE-2PILE ?auto_34546 ?auto_34547 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34552 - BLOCK
      ?auto_34553 - BLOCK
    )
    :vars
    (
      ?auto_34554 - BLOCK
      ?auto_34555 - BLOCK
      ?auto_34557 - BLOCK
      ?auto_34556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34552 ?auto_34553 ) ) ( not ( = ?auto_34552 ?auto_34554 ) ) ( not ( = ?auto_34553 ?auto_34554 ) ) ( ON-TABLE ?auto_34555 ) ( ON ?auto_34557 ?auto_34555 ) ( ON ?auto_34554 ?auto_34557 ) ( not ( = ?auto_34555 ?auto_34557 ) ) ( not ( = ?auto_34555 ?auto_34554 ) ) ( not ( = ?auto_34555 ?auto_34553 ) ) ( not ( = ?auto_34555 ?auto_34552 ) ) ( not ( = ?auto_34557 ?auto_34554 ) ) ( not ( = ?auto_34557 ?auto_34553 ) ) ( not ( = ?auto_34557 ?auto_34552 ) ) ( ON ?auto_34552 ?auto_34556 ) ( not ( = ?auto_34552 ?auto_34556 ) ) ( not ( = ?auto_34553 ?auto_34556 ) ) ( not ( = ?auto_34554 ?auto_34556 ) ) ( not ( = ?auto_34555 ?auto_34556 ) ) ( not ( = ?auto_34557 ?auto_34556 ) ) ( CLEAR ?auto_34554 ) ( ON ?auto_34553 ?auto_34552 ) ( CLEAR ?auto_34553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34556 ?auto_34552 )
      ( MAKE-2PILE ?auto_34552 ?auto_34553 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34558 - BLOCK
      ?auto_34559 - BLOCK
    )
    :vars
    (
      ?auto_34563 - BLOCK
      ?auto_34560 - BLOCK
      ?auto_34561 - BLOCK
      ?auto_34562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34558 ?auto_34559 ) ) ( not ( = ?auto_34558 ?auto_34563 ) ) ( not ( = ?auto_34559 ?auto_34563 ) ) ( ON-TABLE ?auto_34560 ) ( ON ?auto_34561 ?auto_34560 ) ( not ( = ?auto_34560 ?auto_34561 ) ) ( not ( = ?auto_34560 ?auto_34563 ) ) ( not ( = ?auto_34560 ?auto_34559 ) ) ( not ( = ?auto_34560 ?auto_34558 ) ) ( not ( = ?auto_34561 ?auto_34563 ) ) ( not ( = ?auto_34561 ?auto_34559 ) ) ( not ( = ?auto_34561 ?auto_34558 ) ) ( ON ?auto_34558 ?auto_34562 ) ( not ( = ?auto_34558 ?auto_34562 ) ) ( not ( = ?auto_34559 ?auto_34562 ) ) ( not ( = ?auto_34563 ?auto_34562 ) ) ( not ( = ?auto_34560 ?auto_34562 ) ) ( not ( = ?auto_34561 ?auto_34562 ) ) ( ON ?auto_34559 ?auto_34558 ) ( CLEAR ?auto_34559 ) ( ON-TABLE ?auto_34562 ) ( HOLDING ?auto_34563 ) ( CLEAR ?auto_34561 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34560 ?auto_34561 ?auto_34563 )
      ( MAKE-2PILE ?auto_34558 ?auto_34559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34564 - BLOCK
      ?auto_34565 - BLOCK
    )
    :vars
    (
      ?auto_34566 - BLOCK
      ?auto_34569 - BLOCK
      ?auto_34567 - BLOCK
      ?auto_34568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34564 ?auto_34565 ) ) ( not ( = ?auto_34564 ?auto_34566 ) ) ( not ( = ?auto_34565 ?auto_34566 ) ) ( ON-TABLE ?auto_34569 ) ( ON ?auto_34567 ?auto_34569 ) ( not ( = ?auto_34569 ?auto_34567 ) ) ( not ( = ?auto_34569 ?auto_34566 ) ) ( not ( = ?auto_34569 ?auto_34565 ) ) ( not ( = ?auto_34569 ?auto_34564 ) ) ( not ( = ?auto_34567 ?auto_34566 ) ) ( not ( = ?auto_34567 ?auto_34565 ) ) ( not ( = ?auto_34567 ?auto_34564 ) ) ( ON ?auto_34564 ?auto_34568 ) ( not ( = ?auto_34564 ?auto_34568 ) ) ( not ( = ?auto_34565 ?auto_34568 ) ) ( not ( = ?auto_34566 ?auto_34568 ) ) ( not ( = ?auto_34569 ?auto_34568 ) ) ( not ( = ?auto_34567 ?auto_34568 ) ) ( ON ?auto_34565 ?auto_34564 ) ( ON-TABLE ?auto_34568 ) ( CLEAR ?auto_34567 ) ( ON ?auto_34566 ?auto_34565 ) ( CLEAR ?auto_34566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34568 ?auto_34564 ?auto_34565 )
      ( MAKE-2PILE ?auto_34564 ?auto_34565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34570 - BLOCK
      ?auto_34571 - BLOCK
    )
    :vars
    (
      ?auto_34575 - BLOCK
      ?auto_34573 - BLOCK
      ?auto_34572 - BLOCK
      ?auto_34574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34570 ?auto_34571 ) ) ( not ( = ?auto_34570 ?auto_34575 ) ) ( not ( = ?auto_34571 ?auto_34575 ) ) ( ON-TABLE ?auto_34573 ) ( not ( = ?auto_34573 ?auto_34572 ) ) ( not ( = ?auto_34573 ?auto_34575 ) ) ( not ( = ?auto_34573 ?auto_34571 ) ) ( not ( = ?auto_34573 ?auto_34570 ) ) ( not ( = ?auto_34572 ?auto_34575 ) ) ( not ( = ?auto_34572 ?auto_34571 ) ) ( not ( = ?auto_34572 ?auto_34570 ) ) ( ON ?auto_34570 ?auto_34574 ) ( not ( = ?auto_34570 ?auto_34574 ) ) ( not ( = ?auto_34571 ?auto_34574 ) ) ( not ( = ?auto_34575 ?auto_34574 ) ) ( not ( = ?auto_34573 ?auto_34574 ) ) ( not ( = ?auto_34572 ?auto_34574 ) ) ( ON ?auto_34571 ?auto_34570 ) ( ON-TABLE ?auto_34574 ) ( ON ?auto_34575 ?auto_34571 ) ( CLEAR ?auto_34575 ) ( HOLDING ?auto_34572 ) ( CLEAR ?auto_34573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34573 ?auto_34572 )
      ( MAKE-2PILE ?auto_34570 ?auto_34571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34576 - BLOCK
      ?auto_34577 - BLOCK
    )
    :vars
    (
      ?auto_34579 - BLOCK
      ?auto_34578 - BLOCK
      ?auto_34580 - BLOCK
      ?auto_34581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34576 ?auto_34577 ) ) ( not ( = ?auto_34576 ?auto_34579 ) ) ( not ( = ?auto_34577 ?auto_34579 ) ) ( ON-TABLE ?auto_34578 ) ( not ( = ?auto_34578 ?auto_34580 ) ) ( not ( = ?auto_34578 ?auto_34579 ) ) ( not ( = ?auto_34578 ?auto_34577 ) ) ( not ( = ?auto_34578 ?auto_34576 ) ) ( not ( = ?auto_34580 ?auto_34579 ) ) ( not ( = ?auto_34580 ?auto_34577 ) ) ( not ( = ?auto_34580 ?auto_34576 ) ) ( ON ?auto_34576 ?auto_34581 ) ( not ( = ?auto_34576 ?auto_34581 ) ) ( not ( = ?auto_34577 ?auto_34581 ) ) ( not ( = ?auto_34579 ?auto_34581 ) ) ( not ( = ?auto_34578 ?auto_34581 ) ) ( not ( = ?auto_34580 ?auto_34581 ) ) ( ON ?auto_34577 ?auto_34576 ) ( ON-TABLE ?auto_34581 ) ( ON ?auto_34579 ?auto_34577 ) ( CLEAR ?auto_34578 ) ( ON ?auto_34580 ?auto_34579 ) ( CLEAR ?auto_34580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34581 ?auto_34576 ?auto_34577 ?auto_34579 )
      ( MAKE-2PILE ?auto_34576 ?auto_34577 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34582 - BLOCK
      ?auto_34583 - BLOCK
    )
    :vars
    (
      ?auto_34586 - BLOCK
      ?auto_34587 - BLOCK
      ?auto_34584 - BLOCK
      ?auto_34585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34582 ?auto_34583 ) ) ( not ( = ?auto_34582 ?auto_34586 ) ) ( not ( = ?auto_34583 ?auto_34586 ) ) ( not ( = ?auto_34587 ?auto_34584 ) ) ( not ( = ?auto_34587 ?auto_34586 ) ) ( not ( = ?auto_34587 ?auto_34583 ) ) ( not ( = ?auto_34587 ?auto_34582 ) ) ( not ( = ?auto_34584 ?auto_34586 ) ) ( not ( = ?auto_34584 ?auto_34583 ) ) ( not ( = ?auto_34584 ?auto_34582 ) ) ( ON ?auto_34582 ?auto_34585 ) ( not ( = ?auto_34582 ?auto_34585 ) ) ( not ( = ?auto_34583 ?auto_34585 ) ) ( not ( = ?auto_34586 ?auto_34585 ) ) ( not ( = ?auto_34587 ?auto_34585 ) ) ( not ( = ?auto_34584 ?auto_34585 ) ) ( ON ?auto_34583 ?auto_34582 ) ( ON-TABLE ?auto_34585 ) ( ON ?auto_34586 ?auto_34583 ) ( ON ?auto_34584 ?auto_34586 ) ( CLEAR ?auto_34584 ) ( HOLDING ?auto_34587 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34587 )
      ( MAKE-2PILE ?auto_34582 ?auto_34583 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34588 - BLOCK
      ?auto_34589 - BLOCK
    )
    :vars
    (
      ?auto_34592 - BLOCK
      ?auto_34591 - BLOCK
      ?auto_34593 - BLOCK
      ?auto_34590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34588 ?auto_34589 ) ) ( not ( = ?auto_34588 ?auto_34592 ) ) ( not ( = ?auto_34589 ?auto_34592 ) ) ( not ( = ?auto_34591 ?auto_34593 ) ) ( not ( = ?auto_34591 ?auto_34592 ) ) ( not ( = ?auto_34591 ?auto_34589 ) ) ( not ( = ?auto_34591 ?auto_34588 ) ) ( not ( = ?auto_34593 ?auto_34592 ) ) ( not ( = ?auto_34593 ?auto_34589 ) ) ( not ( = ?auto_34593 ?auto_34588 ) ) ( ON ?auto_34588 ?auto_34590 ) ( not ( = ?auto_34588 ?auto_34590 ) ) ( not ( = ?auto_34589 ?auto_34590 ) ) ( not ( = ?auto_34592 ?auto_34590 ) ) ( not ( = ?auto_34591 ?auto_34590 ) ) ( not ( = ?auto_34593 ?auto_34590 ) ) ( ON ?auto_34589 ?auto_34588 ) ( ON-TABLE ?auto_34590 ) ( ON ?auto_34592 ?auto_34589 ) ( ON ?auto_34593 ?auto_34592 ) ( ON ?auto_34591 ?auto_34593 ) ( CLEAR ?auto_34591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34590 ?auto_34588 ?auto_34589 ?auto_34592 ?auto_34593 )
      ( MAKE-2PILE ?auto_34588 ?auto_34589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34596 - BLOCK
      ?auto_34597 - BLOCK
    )
    :vars
    (
      ?auto_34598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34598 ?auto_34597 ) ( CLEAR ?auto_34598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34596 ) ( ON ?auto_34597 ?auto_34596 ) ( not ( = ?auto_34596 ?auto_34597 ) ) ( not ( = ?auto_34596 ?auto_34598 ) ) ( not ( = ?auto_34597 ?auto_34598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34598 ?auto_34597 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34599 - BLOCK
      ?auto_34600 - BLOCK
    )
    :vars
    (
      ?auto_34601 - BLOCK
      ?auto_34602 - BLOCK
      ?auto_34603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34601 ?auto_34600 ) ( CLEAR ?auto_34601 ) ( ON-TABLE ?auto_34599 ) ( ON ?auto_34600 ?auto_34599 ) ( not ( = ?auto_34599 ?auto_34600 ) ) ( not ( = ?auto_34599 ?auto_34601 ) ) ( not ( = ?auto_34600 ?auto_34601 ) ) ( HOLDING ?auto_34602 ) ( CLEAR ?auto_34603 ) ( not ( = ?auto_34599 ?auto_34602 ) ) ( not ( = ?auto_34599 ?auto_34603 ) ) ( not ( = ?auto_34600 ?auto_34602 ) ) ( not ( = ?auto_34600 ?auto_34603 ) ) ( not ( = ?auto_34601 ?auto_34602 ) ) ( not ( = ?auto_34601 ?auto_34603 ) ) ( not ( = ?auto_34602 ?auto_34603 ) ) )
    :subtasks
    ( ( !STACK ?auto_34602 ?auto_34603 )
      ( MAKE-2PILE ?auto_34599 ?auto_34600 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34604 - BLOCK
      ?auto_34605 - BLOCK
    )
    :vars
    (
      ?auto_34608 - BLOCK
      ?auto_34607 - BLOCK
      ?auto_34606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34608 ?auto_34605 ) ( ON-TABLE ?auto_34604 ) ( ON ?auto_34605 ?auto_34604 ) ( not ( = ?auto_34604 ?auto_34605 ) ) ( not ( = ?auto_34604 ?auto_34608 ) ) ( not ( = ?auto_34605 ?auto_34608 ) ) ( CLEAR ?auto_34607 ) ( not ( = ?auto_34604 ?auto_34606 ) ) ( not ( = ?auto_34604 ?auto_34607 ) ) ( not ( = ?auto_34605 ?auto_34606 ) ) ( not ( = ?auto_34605 ?auto_34607 ) ) ( not ( = ?auto_34608 ?auto_34606 ) ) ( not ( = ?auto_34608 ?auto_34607 ) ) ( not ( = ?auto_34606 ?auto_34607 ) ) ( ON ?auto_34606 ?auto_34608 ) ( CLEAR ?auto_34606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34604 ?auto_34605 ?auto_34608 )
      ( MAKE-2PILE ?auto_34604 ?auto_34605 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34609 - BLOCK
      ?auto_34610 - BLOCK
    )
    :vars
    (
      ?auto_34612 - BLOCK
      ?auto_34613 - BLOCK
      ?auto_34611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34612 ?auto_34610 ) ( ON-TABLE ?auto_34609 ) ( ON ?auto_34610 ?auto_34609 ) ( not ( = ?auto_34609 ?auto_34610 ) ) ( not ( = ?auto_34609 ?auto_34612 ) ) ( not ( = ?auto_34610 ?auto_34612 ) ) ( not ( = ?auto_34609 ?auto_34613 ) ) ( not ( = ?auto_34609 ?auto_34611 ) ) ( not ( = ?auto_34610 ?auto_34613 ) ) ( not ( = ?auto_34610 ?auto_34611 ) ) ( not ( = ?auto_34612 ?auto_34613 ) ) ( not ( = ?auto_34612 ?auto_34611 ) ) ( not ( = ?auto_34613 ?auto_34611 ) ) ( ON ?auto_34613 ?auto_34612 ) ( CLEAR ?auto_34613 ) ( HOLDING ?auto_34611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34611 )
      ( MAKE-2PILE ?auto_34609 ?auto_34610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34614 - BLOCK
      ?auto_34615 - BLOCK
    )
    :vars
    (
      ?auto_34618 - BLOCK
      ?auto_34616 - BLOCK
      ?auto_34617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34618 ?auto_34615 ) ( ON-TABLE ?auto_34614 ) ( ON ?auto_34615 ?auto_34614 ) ( not ( = ?auto_34614 ?auto_34615 ) ) ( not ( = ?auto_34614 ?auto_34618 ) ) ( not ( = ?auto_34615 ?auto_34618 ) ) ( not ( = ?auto_34614 ?auto_34616 ) ) ( not ( = ?auto_34614 ?auto_34617 ) ) ( not ( = ?auto_34615 ?auto_34616 ) ) ( not ( = ?auto_34615 ?auto_34617 ) ) ( not ( = ?auto_34618 ?auto_34616 ) ) ( not ( = ?auto_34618 ?auto_34617 ) ) ( not ( = ?auto_34616 ?auto_34617 ) ) ( ON ?auto_34616 ?auto_34618 ) ( ON ?auto_34617 ?auto_34616 ) ( CLEAR ?auto_34617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34614 ?auto_34615 ?auto_34618 ?auto_34616 )
      ( MAKE-2PILE ?auto_34614 ?auto_34615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34619 - BLOCK
      ?auto_34620 - BLOCK
    )
    :vars
    (
      ?auto_34623 - BLOCK
      ?auto_34622 - BLOCK
      ?auto_34621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34623 ?auto_34620 ) ( ON-TABLE ?auto_34619 ) ( ON ?auto_34620 ?auto_34619 ) ( not ( = ?auto_34619 ?auto_34620 ) ) ( not ( = ?auto_34619 ?auto_34623 ) ) ( not ( = ?auto_34620 ?auto_34623 ) ) ( not ( = ?auto_34619 ?auto_34622 ) ) ( not ( = ?auto_34619 ?auto_34621 ) ) ( not ( = ?auto_34620 ?auto_34622 ) ) ( not ( = ?auto_34620 ?auto_34621 ) ) ( not ( = ?auto_34623 ?auto_34622 ) ) ( not ( = ?auto_34623 ?auto_34621 ) ) ( not ( = ?auto_34622 ?auto_34621 ) ) ( ON ?auto_34622 ?auto_34623 ) ( HOLDING ?auto_34621 ) ( CLEAR ?auto_34622 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34619 ?auto_34620 ?auto_34623 ?auto_34622 ?auto_34621 )
      ( MAKE-2PILE ?auto_34619 ?auto_34620 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34624 - BLOCK
      ?auto_34625 - BLOCK
    )
    :vars
    (
      ?auto_34628 - BLOCK
      ?auto_34627 - BLOCK
      ?auto_34626 - BLOCK
      ?auto_34629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34628 ?auto_34625 ) ( ON-TABLE ?auto_34624 ) ( ON ?auto_34625 ?auto_34624 ) ( not ( = ?auto_34624 ?auto_34625 ) ) ( not ( = ?auto_34624 ?auto_34628 ) ) ( not ( = ?auto_34625 ?auto_34628 ) ) ( not ( = ?auto_34624 ?auto_34627 ) ) ( not ( = ?auto_34624 ?auto_34626 ) ) ( not ( = ?auto_34625 ?auto_34627 ) ) ( not ( = ?auto_34625 ?auto_34626 ) ) ( not ( = ?auto_34628 ?auto_34627 ) ) ( not ( = ?auto_34628 ?auto_34626 ) ) ( not ( = ?auto_34627 ?auto_34626 ) ) ( ON ?auto_34627 ?auto_34628 ) ( CLEAR ?auto_34627 ) ( ON ?auto_34626 ?auto_34629 ) ( CLEAR ?auto_34626 ) ( HAND-EMPTY ) ( not ( = ?auto_34624 ?auto_34629 ) ) ( not ( = ?auto_34625 ?auto_34629 ) ) ( not ( = ?auto_34628 ?auto_34629 ) ) ( not ( = ?auto_34627 ?auto_34629 ) ) ( not ( = ?auto_34626 ?auto_34629 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34626 ?auto_34629 )
      ( MAKE-2PILE ?auto_34624 ?auto_34625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34630 - BLOCK
      ?auto_34631 - BLOCK
    )
    :vars
    (
      ?auto_34632 - BLOCK
      ?auto_34633 - BLOCK
      ?auto_34634 - BLOCK
      ?auto_34635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34632 ?auto_34631 ) ( ON-TABLE ?auto_34630 ) ( ON ?auto_34631 ?auto_34630 ) ( not ( = ?auto_34630 ?auto_34631 ) ) ( not ( = ?auto_34630 ?auto_34632 ) ) ( not ( = ?auto_34631 ?auto_34632 ) ) ( not ( = ?auto_34630 ?auto_34633 ) ) ( not ( = ?auto_34630 ?auto_34634 ) ) ( not ( = ?auto_34631 ?auto_34633 ) ) ( not ( = ?auto_34631 ?auto_34634 ) ) ( not ( = ?auto_34632 ?auto_34633 ) ) ( not ( = ?auto_34632 ?auto_34634 ) ) ( not ( = ?auto_34633 ?auto_34634 ) ) ( ON ?auto_34634 ?auto_34635 ) ( CLEAR ?auto_34634 ) ( not ( = ?auto_34630 ?auto_34635 ) ) ( not ( = ?auto_34631 ?auto_34635 ) ) ( not ( = ?auto_34632 ?auto_34635 ) ) ( not ( = ?auto_34633 ?auto_34635 ) ) ( not ( = ?auto_34634 ?auto_34635 ) ) ( HOLDING ?auto_34633 ) ( CLEAR ?auto_34632 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34630 ?auto_34631 ?auto_34632 ?auto_34633 )
      ( MAKE-2PILE ?auto_34630 ?auto_34631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34636 - BLOCK
      ?auto_34637 - BLOCK
    )
    :vars
    (
      ?auto_34639 - BLOCK
      ?auto_34640 - BLOCK
      ?auto_34638 - BLOCK
      ?auto_34641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34639 ?auto_34637 ) ( ON-TABLE ?auto_34636 ) ( ON ?auto_34637 ?auto_34636 ) ( not ( = ?auto_34636 ?auto_34637 ) ) ( not ( = ?auto_34636 ?auto_34639 ) ) ( not ( = ?auto_34637 ?auto_34639 ) ) ( not ( = ?auto_34636 ?auto_34640 ) ) ( not ( = ?auto_34636 ?auto_34638 ) ) ( not ( = ?auto_34637 ?auto_34640 ) ) ( not ( = ?auto_34637 ?auto_34638 ) ) ( not ( = ?auto_34639 ?auto_34640 ) ) ( not ( = ?auto_34639 ?auto_34638 ) ) ( not ( = ?auto_34640 ?auto_34638 ) ) ( ON ?auto_34638 ?auto_34641 ) ( not ( = ?auto_34636 ?auto_34641 ) ) ( not ( = ?auto_34637 ?auto_34641 ) ) ( not ( = ?auto_34639 ?auto_34641 ) ) ( not ( = ?auto_34640 ?auto_34641 ) ) ( not ( = ?auto_34638 ?auto_34641 ) ) ( CLEAR ?auto_34639 ) ( ON ?auto_34640 ?auto_34638 ) ( CLEAR ?auto_34640 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34641 ?auto_34638 )
      ( MAKE-2PILE ?auto_34636 ?auto_34637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34654 - BLOCK
      ?auto_34655 - BLOCK
    )
    :vars
    (
      ?auto_34659 - BLOCK
      ?auto_34658 - BLOCK
      ?auto_34657 - BLOCK
      ?auto_34656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34654 ) ( not ( = ?auto_34654 ?auto_34655 ) ) ( not ( = ?auto_34654 ?auto_34659 ) ) ( not ( = ?auto_34655 ?auto_34659 ) ) ( not ( = ?auto_34654 ?auto_34658 ) ) ( not ( = ?auto_34654 ?auto_34657 ) ) ( not ( = ?auto_34655 ?auto_34658 ) ) ( not ( = ?auto_34655 ?auto_34657 ) ) ( not ( = ?auto_34659 ?auto_34658 ) ) ( not ( = ?auto_34659 ?auto_34657 ) ) ( not ( = ?auto_34658 ?auto_34657 ) ) ( ON ?auto_34657 ?auto_34656 ) ( not ( = ?auto_34654 ?auto_34656 ) ) ( not ( = ?auto_34655 ?auto_34656 ) ) ( not ( = ?auto_34659 ?auto_34656 ) ) ( not ( = ?auto_34658 ?auto_34656 ) ) ( not ( = ?auto_34657 ?auto_34656 ) ) ( ON ?auto_34658 ?auto_34657 ) ( ON-TABLE ?auto_34656 ) ( ON ?auto_34659 ?auto_34658 ) ( CLEAR ?auto_34659 ) ( HOLDING ?auto_34655 ) ( CLEAR ?auto_34654 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34654 ?auto_34655 ?auto_34659 )
      ( MAKE-2PILE ?auto_34654 ?auto_34655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34660 - BLOCK
      ?auto_34661 - BLOCK
    )
    :vars
    (
      ?auto_34665 - BLOCK
      ?auto_34662 - BLOCK
      ?auto_34663 - BLOCK
      ?auto_34664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34660 ) ( not ( = ?auto_34660 ?auto_34661 ) ) ( not ( = ?auto_34660 ?auto_34665 ) ) ( not ( = ?auto_34661 ?auto_34665 ) ) ( not ( = ?auto_34660 ?auto_34662 ) ) ( not ( = ?auto_34660 ?auto_34663 ) ) ( not ( = ?auto_34661 ?auto_34662 ) ) ( not ( = ?auto_34661 ?auto_34663 ) ) ( not ( = ?auto_34665 ?auto_34662 ) ) ( not ( = ?auto_34665 ?auto_34663 ) ) ( not ( = ?auto_34662 ?auto_34663 ) ) ( ON ?auto_34663 ?auto_34664 ) ( not ( = ?auto_34660 ?auto_34664 ) ) ( not ( = ?auto_34661 ?auto_34664 ) ) ( not ( = ?auto_34665 ?auto_34664 ) ) ( not ( = ?auto_34662 ?auto_34664 ) ) ( not ( = ?auto_34663 ?auto_34664 ) ) ( ON ?auto_34662 ?auto_34663 ) ( ON-TABLE ?auto_34664 ) ( ON ?auto_34665 ?auto_34662 ) ( CLEAR ?auto_34660 ) ( ON ?auto_34661 ?auto_34665 ) ( CLEAR ?auto_34661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34664 ?auto_34663 ?auto_34662 ?auto_34665 )
      ( MAKE-2PILE ?auto_34660 ?auto_34661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34666 - BLOCK
      ?auto_34667 - BLOCK
    )
    :vars
    (
      ?auto_34668 - BLOCK
      ?auto_34670 - BLOCK
      ?auto_34671 - BLOCK
      ?auto_34669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34666 ?auto_34667 ) ) ( not ( = ?auto_34666 ?auto_34668 ) ) ( not ( = ?auto_34667 ?auto_34668 ) ) ( not ( = ?auto_34666 ?auto_34670 ) ) ( not ( = ?auto_34666 ?auto_34671 ) ) ( not ( = ?auto_34667 ?auto_34670 ) ) ( not ( = ?auto_34667 ?auto_34671 ) ) ( not ( = ?auto_34668 ?auto_34670 ) ) ( not ( = ?auto_34668 ?auto_34671 ) ) ( not ( = ?auto_34670 ?auto_34671 ) ) ( ON ?auto_34671 ?auto_34669 ) ( not ( = ?auto_34666 ?auto_34669 ) ) ( not ( = ?auto_34667 ?auto_34669 ) ) ( not ( = ?auto_34668 ?auto_34669 ) ) ( not ( = ?auto_34670 ?auto_34669 ) ) ( not ( = ?auto_34671 ?auto_34669 ) ) ( ON ?auto_34670 ?auto_34671 ) ( ON-TABLE ?auto_34669 ) ( ON ?auto_34668 ?auto_34670 ) ( ON ?auto_34667 ?auto_34668 ) ( CLEAR ?auto_34667 ) ( HOLDING ?auto_34666 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34666 )
      ( MAKE-2PILE ?auto_34666 ?auto_34667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_34672 - BLOCK
      ?auto_34673 - BLOCK
    )
    :vars
    (
      ?auto_34677 - BLOCK
      ?auto_34676 - BLOCK
      ?auto_34675 - BLOCK
      ?auto_34674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34672 ?auto_34673 ) ) ( not ( = ?auto_34672 ?auto_34677 ) ) ( not ( = ?auto_34673 ?auto_34677 ) ) ( not ( = ?auto_34672 ?auto_34676 ) ) ( not ( = ?auto_34672 ?auto_34675 ) ) ( not ( = ?auto_34673 ?auto_34676 ) ) ( not ( = ?auto_34673 ?auto_34675 ) ) ( not ( = ?auto_34677 ?auto_34676 ) ) ( not ( = ?auto_34677 ?auto_34675 ) ) ( not ( = ?auto_34676 ?auto_34675 ) ) ( ON ?auto_34675 ?auto_34674 ) ( not ( = ?auto_34672 ?auto_34674 ) ) ( not ( = ?auto_34673 ?auto_34674 ) ) ( not ( = ?auto_34677 ?auto_34674 ) ) ( not ( = ?auto_34676 ?auto_34674 ) ) ( not ( = ?auto_34675 ?auto_34674 ) ) ( ON ?auto_34676 ?auto_34675 ) ( ON-TABLE ?auto_34674 ) ( ON ?auto_34677 ?auto_34676 ) ( ON ?auto_34673 ?auto_34677 ) ( ON ?auto_34672 ?auto_34673 ) ( CLEAR ?auto_34672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34674 ?auto_34675 ?auto_34676 ?auto_34677 ?auto_34673 )
      ( MAKE-2PILE ?auto_34672 ?auto_34673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34681 - BLOCK
      ?auto_34682 - BLOCK
      ?auto_34683 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34683 ) ( CLEAR ?auto_34682 ) ( ON-TABLE ?auto_34681 ) ( ON ?auto_34682 ?auto_34681 ) ( not ( = ?auto_34681 ?auto_34682 ) ) ( not ( = ?auto_34681 ?auto_34683 ) ) ( not ( = ?auto_34682 ?auto_34683 ) ) )
    :subtasks
    ( ( !STACK ?auto_34683 ?auto_34682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34684 - BLOCK
      ?auto_34685 - BLOCK
      ?auto_34686 - BLOCK
    )
    :vars
    (
      ?auto_34687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34685 ) ( ON-TABLE ?auto_34684 ) ( ON ?auto_34685 ?auto_34684 ) ( not ( = ?auto_34684 ?auto_34685 ) ) ( not ( = ?auto_34684 ?auto_34686 ) ) ( not ( = ?auto_34685 ?auto_34686 ) ) ( ON ?auto_34686 ?auto_34687 ) ( CLEAR ?auto_34686 ) ( HAND-EMPTY ) ( not ( = ?auto_34684 ?auto_34687 ) ) ( not ( = ?auto_34685 ?auto_34687 ) ) ( not ( = ?auto_34686 ?auto_34687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34686 ?auto_34687 )
      ( MAKE-3PILE ?auto_34684 ?auto_34685 ?auto_34686 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34688 - BLOCK
      ?auto_34689 - BLOCK
      ?auto_34690 - BLOCK
    )
    :vars
    (
      ?auto_34691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34688 ) ( not ( = ?auto_34688 ?auto_34689 ) ) ( not ( = ?auto_34688 ?auto_34690 ) ) ( not ( = ?auto_34689 ?auto_34690 ) ) ( ON ?auto_34690 ?auto_34691 ) ( CLEAR ?auto_34690 ) ( not ( = ?auto_34688 ?auto_34691 ) ) ( not ( = ?auto_34689 ?auto_34691 ) ) ( not ( = ?auto_34690 ?auto_34691 ) ) ( HOLDING ?auto_34689 ) ( CLEAR ?auto_34688 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34688 ?auto_34689 )
      ( MAKE-3PILE ?auto_34688 ?auto_34689 ?auto_34690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34692 - BLOCK
      ?auto_34693 - BLOCK
      ?auto_34694 - BLOCK
    )
    :vars
    (
      ?auto_34695 - BLOCK
      ?auto_34696 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34692 ) ( not ( = ?auto_34692 ?auto_34693 ) ) ( not ( = ?auto_34692 ?auto_34694 ) ) ( not ( = ?auto_34693 ?auto_34694 ) ) ( ON ?auto_34694 ?auto_34695 ) ( not ( = ?auto_34692 ?auto_34695 ) ) ( not ( = ?auto_34693 ?auto_34695 ) ) ( not ( = ?auto_34694 ?auto_34695 ) ) ( CLEAR ?auto_34692 ) ( ON ?auto_34693 ?auto_34694 ) ( CLEAR ?auto_34693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34696 ) ( ON ?auto_34695 ?auto_34696 ) ( not ( = ?auto_34696 ?auto_34695 ) ) ( not ( = ?auto_34696 ?auto_34694 ) ) ( not ( = ?auto_34696 ?auto_34693 ) ) ( not ( = ?auto_34692 ?auto_34696 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34696 ?auto_34695 ?auto_34694 )
      ( MAKE-3PILE ?auto_34692 ?auto_34693 ?auto_34694 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34697 - BLOCK
      ?auto_34698 - BLOCK
      ?auto_34699 - BLOCK
    )
    :vars
    (
      ?auto_34700 - BLOCK
      ?auto_34701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34697 ?auto_34698 ) ) ( not ( = ?auto_34697 ?auto_34699 ) ) ( not ( = ?auto_34698 ?auto_34699 ) ) ( ON ?auto_34699 ?auto_34700 ) ( not ( = ?auto_34697 ?auto_34700 ) ) ( not ( = ?auto_34698 ?auto_34700 ) ) ( not ( = ?auto_34699 ?auto_34700 ) ) ( ON ?auto_34698 ?auto_34699 ) ( CLEAR ?auto_34698 ) ( ON-TABLE ?auto_34701 ) ( ON ?auto_34700 ?auto_34701 ) ( not ( = ?auto_34701 ?auto_34700 ) ) ( not ( = ?auto_34701 ?auto_34699 ) ) ( not ( = ?auto_34701 ?auto_34698 ) ) ( not ( = ?auto_34697 ?auto_34701 ) ) ( HOLDING ?auto_34697 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34697 )
      ( MAKE-3PILE ?auto_34697 ?auto_34698 ?auto_34699 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34702 - BLOCK
      ?auto_34703 - BLOCK
      ?auto_34704 - BLOCK
    )
    :vars
    (
      ?auto_34706 - BLOCK
      ?auto_34705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34702 ?auto_34703 ) ) ( not ( = ?auto_34702 ?auto_34704 ) ) ( not ( = ?auto_34703 ?auto_34704 ) ) ( ON ?auto_34704 ?auto_34706 ) ( not ( = ?auto_34702 ?auto_34706 ) ) ( not ( = ?auto_34703 ?auto_34706 ) ) ( not ( = ?auto_34704 ?auto_34706 ) ) ( ON ?auto_34703 ?auto_34704 ) ( ON-TABLE ?auto_34705 ) ( ON ?auto_34706 ?auto_34705 ) ( not ( = ?auto_34705 ?auto_34706 ) ) ( not ( = ?auto_34705 ?auto_34704 ) ) ( not ( = ?auto_34705 ?auto_34703 ) ) ( not ( = ?auto_34702 ?auto_34705 ) ) ( ON ?auto_34702 ?auto_34703 ) ( CLEAR ?auto_34702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34705 ?auto_34706 ?auto_34704 ?auto_34703 )
      ( MAKE-3PILE ?auto_34702 ?auto_34703 ?auto_34704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34707 - BLOCK
      ?auto_34708 - BLOCK
      ?auto_34709 - BLOCK
    )
    :vars
    (
      ?auto_34710 - BLOCK
      ?auto_34711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34707 ?auto_34708 ) ) ( not ( = ?auto_34707 ?auto_34709 ) ) ( not ( = ?auto_34708 ?auto_34709 ) ) ( ON ?auto_34709 ?auto_34710 ) ( not ( = ?auto_34707 ?auto_34710 ) ) ( not ( = ?auto_34708 ?auto_34710 ) ) ( not ( = ?auto_34709 ?auto_34710 ) ) ( ON ?auto_34708 ?auto_34709 ) ( ON-TABLE ?auto_34711 ) ( ON ?auto_34710 ?auto_34711 ) ( not ( = ?auto_34711 ?auto_34710 ) ) ( not ( = ?auto_34711 ?auto_34709 ) ) ( not ( = ?auto_34711 ?auto_34708 ) ) ( not ( = ?auto_34707 ?auto_34711 ) ) ( HOLDING ?auto_34707 ) ( CLEAR ?auto_34708 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34711 ?auto_34710 ?auto_34709 ?auto_34708 ?auto_34707 )
      ( MAKE-3PILE ?auto_34707 ?auto_34708 ?auto_34709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34712 - BLOCK
      ?auto_34713 - BLOCK
      ?auto_34714 - BLOCK
    )
    :vars
    (
      ?auto_34715 - BLOCK
      ?auto_34716 - BLOCK
      ?auto_34717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34712 ?auto_34713 ) ) ( not ( = ?auto_34712 ?auto_34714 ) ) ( not ( = ?auto_34713 ?auto_34714 ) ) ( ON ?auto_34714 ?auto_34715 ) ( not ( = ?auto_34712 ?auto_34715 ) ) ( not ( = ?auto_34713 ?auto_34715 ) ) ( not ( = ?auto_34714 ?auto_34715 ) ) ( ON ?auto_34713 ?auto_34714 ) ( ON-TABLE ?auto_34716 ) ( ON ?auto_34715 ?auto_34716 ) ( not ( = ?auto_34716 ?auto_34715 ) ) ( not ( = ?auto_34716 ?auto_34714 ) ) ( not ( = ?auto_34716 ?auto_34713 ) ) ( not ( = ?auto_34712 ?auto_34716 ) ) ( CLEAR ?auto_34713 ) ( ON ?auto_34712 ?auto_34717 ) ( CLEAR ?auto_34712 ) ( HAND-EMPTY ) ( not ( = ?auto_34712 ?auto_34717 ) ) ( not ( = ?auto_34713 ?auto_34717 ) ) ( not ( = ?auto_34714 ?auto_34717 ) ) ( not ( = ?auto_34715 ?auto_34717 ) ) ( not ( = ?auto_34716 ?auto_34717 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34712 ?auto_34717 )
      ( MAKE-3PILE ?auto_34712 ?auto_34713 ?auto_34714 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34718 - BLOCK
      ?auto_34719 - BLOCK
      ?auto_34720 - BLOCK
    )
    :vars
    (
      ?auto_34723 - BLOCK
      ?auto_34721 - BLOCK
      ?auto_34722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34718 ?auto_34719 ) ) ( not ( = ?auto_34718 ?auto_34720 ) ) ( not ( = ?auto_34719 ?auto_34720 ) ) ( ON ?auto_34720 ?auto_34723 ) ( not ( = ?auto_34718 ?auto_34723 ) ) ( not ( = ?auto_34719 ?auto_34723 ) ) ( not ( = ?auto_34720 ?auto_34723 ) ) ( ON-TABLE ?auto_34721 ) ( ON ?auto_34723 ?auto_34721 ) ( not ( = ?auto_34721 ?auto_34723 ) ) ( not ( = ?auto_34721 ?auto_34720 ) ) ( not ( = ?auto_34721 ?auto_34719 ) ) ( not ( = ?auto_34718 ?auto_34721 ) ) ( ON ?auto_34718 ?auto_34722 ) ( CLEAR ?auto_34718 ) ( not ( = ?auto_34718 ?auto_34722 ) ) ( not ( = ?auto_34719 ?auto_34722 ) ) ( not ( = ?auto_34720 ?auto_34722 ) ) ( not ( = ?auto_34723 ?auto_34722 ) ) ( not ( = ?auto_34721 ?auto_34722 ) ) ( HOLDING ?auto_34719 ) ( CLEAR ?auto_34720 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34721 ?auto_34723 ?auto_34720 ?auto_34719 )
      ( MAKE-3PILE ?auto_34718 ?auto_34719 ?auto_34720 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34724 - BLOCK
      ?auto_34725 - BLOCK
      ?auto_34726 - BLOCK
    )
    :vars
    (
      ?auto_34728 - BLOCK
      ?auto_34729 - BLOCK
      ?auto_34727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34724 ?auto_34725 ) ) ( not ( = ?auto_34724 ?auto_34726 ) ) ( not ( = ?auto_34725 ?auto_34726 ) ) ( ON ?auto_34726 ?auto_34728 ) ( not ( = ?auto_34724 ?auto_34728 ) ) ( not ( = ?auto_34725 ?auto_34728 ) ) ( not ( = ?auto_34726 ?auto_34728 ) ) ( ON-TABLE ?auto_34729 ) ( ON ?auto_34728 ?auto_34729 ) ( not ( = ?auto_34729 ?auto_34728 ) ) ( not ( = ?auto_34729 ?auto_34726 ) ) ( not ( = ?auto_34729 ?auto_34725 ) ) ( not ( = ?auto_34724 ?auto_34729 ) ) ( ON ?auto_34724 ?auto_34727 ) ( not ( = ?auto_34724 ?auto_34727 ) ) ( not ( = ?auto_34725 ?auto_34727 ) ) ( not ( = ?auto_34726 ?auto_34727 ) ) ( not ( = ?auto_34728 ?auto_34727 ) ) ( not ( = ?auto_34729 ?auto_34727 ) ) ( CLEAR ?auto_34726 ) ( ON ?auto_34725 ?auto_34724 ) ( CLEAR ?auto_34725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34727 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34727 ?auto_34724 )
      ( MAKE-3PILE ?auto_34724 ?auto_34725 ?auto_34726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34730 - BLOCK
      ?auto_34731 - BLOCK
      ?auto_34732 - BLOCK
    )
    :vars
    (
      ?auto_34734 - BLOCK
      ?auto_34735 - BLOCK
      ?auto_34733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34730 ?auto_34731 ) ) ( not ( = ?auto_34730 ?auto_34732 ) ) ( not ( = ?auto_34731 ?auto_34732 ) ) ( not ( = ?auto_34730 ?auto_34734 ) ) ( not ( = ?auto_34731 ?auto_34734 ) ) ( not ( = ?auto_34732 ?auto_34734 ) ) ( ON-TABLE ?auto_34735 ) ( ON ?auto_34734 ?auto_34735 ) ( not ( = ?auto_34735 ?auto_34734 ) ) ( not ( = ?auto_34735 ?auto_34732 ) ) ( not ( = ?auto_34735 ?auto_34731 ) ) ( not ( = ?auto_34730 ?auto_34735 ) ) ( ON ?auto_34730 ?auto_34733 ) ( not ( = ?auto_34730 ?auto_34733 ) ) ( not ( = ?auto_34731 ?auto_34733 ) ) ( not ( = ?auto_34732 ?auto_34733 ) ) ( not ( = ?auto_34734 ?auto_34733 ) ) ( not ( = ?auto_34735 ?auto_34733 ) ) ( ON ?auto_34731 ?auto_34730 ) ( CLEAR ?auto_34731 ) ( ON-TABLE ?auto_34733 ) ( HOLDING ?auto_34732 ) ( CLEAR ?auto_34734 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34735 ?auto_34734 ?auto_34732 )
      ( MAKE-3PILE ?auto_34730 ?auto_34731 ?auto_34732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34736 - BLOCK
      ?auto_34737 - BLOCK
      ?auto_34738 - BLOCK
    )
    :vars
    (
      ?auto_34740 - BLOCK
      ?auto_34739 - BLOCK
      ?auto_34741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34736 ?auto_34737 ) ) ( not ( = ?auto_34736 ?auto_34738 ) ) ( not ( = ?auto_34737 ?auto_34738 ) ) ( not ( = ?auto_34736 ?auto_34740 ) ) ( not ( = ?auto_34737 ?auto_34740 ) ) ( not ( = ?auto_34738 ?auto_34740 ) ) ( ON-TABLE ?auto_34739 ) ( ON ?auto_34740 ?auto_34739 ) ( not ( = ?auto_34739 ?auto_34740 ) ) ( not ( = ?auto_34739 ?auto_34738 ) ) ( not ( = ?auto_34739 ?auto_34737 ) ) ( not ( = ?auto_34736 ?auto_34739 ) ) ( ON ?auto_34736 ?auto_34741 ) ( not ( = ?auto_34736 ?auto_34741 ) ) ( not ( = ?auto_34737 ?auto_34741 ) ) ( not ( = ?auto_34738 ?auto_34741 ) ) ( not ( = ?auto_34740 ?auto_34741 ) ) ( not ( = ?auto_34739 ?auto_34741 ) ) ( ON ?auto_34737 ?auto_34736 ) ( ON-TABLE ?auto_34741 ) ( CLEAR ?auto_34740 ) ( ON ?auto_34738 ?auto_34737 ) ( CLEAR ?auto_34738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34741 ?auto_34736 ?auto_34737 )
      ( MAKE-3PILE ?auto_34736 ?auto_34737 ?auto_34738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34742 - BLOCK
      ?auto_34743 - BLOCK
      ?auto_34744 - BLOCK
    )
    :vars
    (
      ?auto_34745 - BLOCK
      ?auto_34747 - BLOCK
      ?auto_34746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34742 ?auto_34743 ) ) ( not ( = ?auto_34742 ?auto_34744 ) ) ( not ( = ?auto_34743 ?auto_34744 ) ) ( not ( = ?auto_34742 ?auto_34745 ) ) ( not ( = ?auto_34743 ?auto_34745 ) ) ( not ( = ?auto_34744 ?auto_34745 ) ) ( ON-TABLE ?auto_34747 ) ( not ( = ?auto_34747 ?auto_34745 ) ) ( not ( = ?auto_34747 ?auto_34744 ) ) ( not ( = ?auto_34747 ?auto_34743 ) ) ( not ( = ?auto_34742 ?auto_34747 ) ) ( ON ?auto_34742 ?auto_34746 ) ( not ( = ?auto_34742 ?auto_34746 ) ) ( not ( = ?auto_34743 ?auto_34746 ) ) ( not ( = ?auto_34744 ?auto_34746 ) ) ( not ( = ?auto_34745 ?auto_34746 ) ) ( not ( = ?auto_34747 ?auto_34746 ) ) ( ON ?auto_34743 ?auto_34742 ) ( ON-TABLE ?auto_34746 ) ( ON ?auto_34744 ?auto_34743 ) ( CLEAR ?auto_34744 ) ( HOLDING ?auto_34745 ) ( CLEAR ?auto_34747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34747 ?auto_34745 )
      ( MAKE-3PILE ?auto_34742 ?auto_34743 ?auto_34744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34748 - BLOCK
      ?auto_34749 - BLOCK
      ?auto_34750 - BLOCK
    )
    :vars
    (
      ?auto_34751 - BLOCK
      ?auto_34753 - BLOCK
      ?auto_34752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34748 ?auto_34749 ) ) ( not ( = ?auto_34748 ?auto_34750 ) ) ( not ( = ?auto_34749 ?auto_34750 ) ) ( not ( = ?auto_34748 ?auto_34751 ) ) ( not ( = ?auto_34749 ?auto_34751 ) ) ( not ( = ?auto_34750 ?auto_34751 ) ) ( ON-TABLE ?auto_34753 ) ( not ( = ?auto_34753 ?auto_34751 ) ) ( not ( = ?auto_34753 ?auto_34750 ) ) ( not ( = ?auto_34753 ?auto_34749 ) ) ( not ( = ?auto_34748 ?auto_34753 ) ) ( ON ?auto_34748 ?auto_34752 ) ( not ( = ?auto_34748 ?auto_34752 ) ) ( not ( = ?auto_34749 ?auto_34752 ) ) ( not ( = ?auto_34750 ?auto_34752 ) ) ( not ( = ?auto_34751 ?auto_34752 ) ) ( not ( = ?auto_34753 ?auto_34752 ) ) ( ON ?auto_34749 ?auto_34748 ) ( ON-TABLE ?auto_34752 ) ( ON ?auto_34750 ?auto_34749 ) ( CLEAR ?auto_34753 ) ( ON ?auto_34751 ?auto_34750 ) ( CLEAR ?auto_34751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34752 ?auto_34748 ?auto_34749 ?auto_34750 )
      ( MAKE-3PILE ?auto_34748 ?auto_34749 ?auto_34750 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34754 - BLOCK
      ?auto_34755 - BLOCK
      ?auto_34756 - BLOCK
    )
    :vars
    (
      ?auto_34758 - BLOCK
      ?auto_34757 - BLOCK
      ?auto_34759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34754 ?auto_34755 ) ) ( not ( = ?auto_34754 ?auto_34756 ) ) ( not ( = ?auto_34755 ?auto_34756 ) ) ( not ( = ?auto_34754 ?auto_34758 ) ) ( not ( = ?auto_34755 ?auto_34758 ) ) ( not ( = ?auto_34756 ?auto_34758 ) ) ( not ( = ?auto_34757 ?auto_34758 ) ) ( not ( = ?auto_34757 ?auto_34756 ) ) ( not ( = ?auto_34757 ?auto_34755 ) ) ( not ( = ?auto_34754 ?auto_34757 ) ) ( ON ?auto_34754 ?auto_34759 ) ( not ( = ?auto_34754 ?auto_34759 ) ) ( not ( = ?auto_34755 ?auto_34759 ) ) ( not ( = ?auto_34756 ?auto_34759 ) ) ( not ( = ?auto_34758 ?auto_34759 ) ) ( not ( = ?auto_34757 ?auto_34759 ) ) ( ON ?auto_34755 ?auto_34754 ) ( ON-TABLE ?auto_34759 ) ( ON ?auto_34756 ?auto_34755 ) ( ON ?auto_34758 ?auto_34756 ) ( CLEAR ?auto_34758 ) ( HOLDING ?auto_34757 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34757 )
      ( MAKE-3PILE ?auto_34754 ?auto_34755 ?auto_34756 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_34760 - BLOCK
      ?auto_34761 - BLOCK
      ?auto_34762 - BLOCK
    )
    :vars
    (
      ?auto_34765 - BLOCK
      ?auto_34763 - BLOCK
      ?auto_34764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34760 ?auto_34761 ) ) ( not ( = ?auto_34760 ?auto_34762 ) ) ( not ( = ?auto_34761 ?auto_34762 ) ) ( not ( = ?auto_34760 ?auto_34765 ) ) ( not ( = ?auto_34761 ?auto_34765 ) ) ( not ( = ?auto_34762 ?auto_34765 ) ) ( not ( = ?auto_34763 ?auto_34765 ) ) ( not ( = ?auto_34763 ?auto_34762 ) ) ( not ( = ?auto_34763 ?auto_34761 ) ) ( not ( = ?auto_34760 ?auto_34763 ) ) ( ON ?auto_34760 ?auto_34764 ) ( not ( = ?auto_34760 ?auto_34764 ) ) ( not ( = ?auto_34761 ?auto_34764 ) ) ( not ( = ?auto_34762 ?auto_34764 ) ) ( not ( = ?auto_34765 ?auto_34764 ) ) ( not ( = ?auto_34763 ?auto_34764 ) ) ( ON ?auto_34761 ?auto_34760 ) ( ON-TABLE ?auto_34764 ) ( ON ?auto_34762 ?auto_34761 ) ( ON ?auto_34765 ?auto_34762 ) ( ON ?auto_34763 ?auto_34765 ) ( CLEAR ?auto_34763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34764 ?auto_34760 ?auto_34761 ?auto_34762 ?auto_34765 )
      ( MAKE-3PILE ?auto_34760 ?auto_34761 ?auto_34762 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34767 - BLOCK
    )
    :vars
    (
      ?auto_34768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34768 ?auto_34767 ) ( CLEAR ?auto_34768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34767 ) ( not ( = ?auto_34767 ?auto_34768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34768 ?auto_34767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34769 - BLOCK
    )
    :vars
    (
      ?auto_34770 - BLOCK
      ?auto_34771 - BLOCK
      ?auto_34772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34770 ?auto_34769 ) ( CLEAR ?auto_34770 ) ( ON-TABLE ?auto_34769 ) ( not ( = ?auto_34769 ?auto_34770 ) ) ( HOLDING ?auto_34771 ) ( CLEAR ?auto_34772 ) ( not ( = ?auto_34769 ?auto_34771 ) ) ( not ( = ?auto_34769 ?auto_34772 ) ) ( not ( = ?auto_34770 ?auto_34771 ) ) ( not ( = ?auto_34770 ?auto_34772 ) ) ( not ( = ?auto_34771 ?auto_34772 ) ) )
    :subtasks
    ( ( !STACK ?auto_34771 ?auto_34772 )
      ( MAKE-1PILE ?auto_34769 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34773 - BLOCK
    )
    :vars
    (
      ?auto_34774 - BLOCK
      ?auto_34776 - BLOCK
      ?auto_34775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34774 ?auto_34773 ) ( ON-TABLE ?auto_34773 ) ( not ( = ?auto_34773 ?auto_34774 ) ) ( CLEAR ?auto_34776 ) ( not ( = ?auto_34773 ?auto_34775 ) ) ( not ( = ?auto_34773 ?auto_34776 ) ) ( not ( = ?auto_34774 ?auto_34775 ) ) ( not ( = ?auto_34774 ?auto_34776 ) ) ( not ( = ?auto_34775 ?auto_34776 ) ) ( ON ?auto_34775 ?auto_34774 ) ( CLEAR ?auto_34775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34773 ?auto_34774 )
      ( MAKE-1PILE ?auto_34773 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34777 - BLOCK
    )
    :vars
    (
      ?auto_34780 - BLOCK
      ?auto_34778 - BLOCK
      ?auto_34779 - BLOCK
      ?auto_34781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34780 ?auto_34777 ) ( ON-TABLE ?auto_34777 ) ( not ( = ?auto_34777 ?auto_34780 ) ) ( not ( = ?auto_34777 ?auto_34778 ) ) ( not ( = ?auto_34777 ?auto_34779 ) ) ( not ( = ?auto_34780 ?auto_34778 ) ) ( not ( = ?auto_34780 ?auto_34779 ) ) ( not ( = ?auto_34778 ?auto_34779 ) ) ( ON ?auto_34778 ?auto_34780 ) ( CLEAR ?auto_34778 ) ( HOLDING ?auto_34779 ) ( CLEAR ?auto_34781 ) ( ON-TABLE ?auto_34781 ) ( not ( = ?auto_34781 ?auto_34779 ) ) ( not ( = ?auto_34777 ?auto_34781 ) ) ( not ( = ?auto_34780 ?auto_34781 ) ) ( not ( = ?auto_34778 ?auto_34781 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34781 ?auto_34779 )
      ( MAKE-1PILE ?auto_34777 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34782 - BLOCK
    )
    :vars
    (
      ?auto_34783 - BLOCK
      ?auto_34784 - BLOCK
      ?auto_34786 - BLOCK
      ?auto_34785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34783 ?auto_34782 ) ( ON-TABLE ?auto_34782 ) ( not ( = ?auto_34782 ?auto_34783 ) ) ( not ( = ?auto_34782 ?auto_34784 ) ) ( not ( = ?auto_34782 ?auto_34786 ) ) ( not ( = ?auto_34783 ?auto_34784 ) ) ( not ( = ?auto_34783 ?auto_34786 ) ) ( not ( = ?auto_34784 ?auto_34786 ) ) ( ON ?auto_34784 ?auto_34783 ) ( CLEAR ?auto_34785 ) ( ON-TABLE ?auto_34785 ) ( not ( = ?auto_34785 ?auto_34786 ) ) ( not ( = ?auto_34782 ?auto_34785 ) ) ( not ( = ?auto_34783 ?auto_34785 ) ) ( not ( = ?auto_34784 ?auto_34785 ) ) ( ON ?auto_34786 ?auto_34784 ) ( CLEAR ?auto_34786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34782 ?auto_34783 ?auto_34784 )
      ( MAKE-1PILE ?auto_34782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34787 - BLOCK
    )
    :vars
    (
      ?auto_34788 - BLOCK
      ?auto_34790 - BLOCK
      ?auto_34789 - BLOCK
      ?auto_34791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34788 ?auto_34787 ) ( ON-TABLE ?auto_34787 ) ( not ( = ?auto_34787 ?auto_34788 ) ) ( not ( = ?auto_34787 ?auto_34790 ) ) ( not ( = ?auto_34787 ?auto_34789 ) ) ( not ( = ?auto_34788 ?auto_34790 ) ) ( not ( = ?auto_34788 ?auto_34789 ) ) ( not ( = ?auto_34790 ?auto_34789 ) ) ( ON ?auto_34790 ?auto_34788 ) ( not ( = ?auto_34791 ?auto_34789 ) ) ( not ( = ?auto_34787 ?auto_34791 ) ) ( not ( = ?auto_34788 ?auto_34791 ) ) ( not ( = ?auto_34790 ?auto_34791 ) ) ( ON ?auto_34789 ?auto_34790 ) ( CLEAR ?auto_34789 ) ( HOLDING ?auto_34791 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34791 )
      ( MAKE-1PILE ?auto_34787 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34792 - BLOCK
    )
    :vars
    (
      ?auto_34795 - BLOCK
      ?auto_34793 - BLOCK
      ?auto_34796 - BLOCK
      ?auto_34794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34795 ?auto_34792 ) ( ON-TABLE ?auto_34792 ) ( not ( = ?auto_34792 ?auto_34795 ) ) ( not ( = ?auto_34792 ?auto_34793 ) ) ( not ( = ?auto_34792 ?auto_34796 ) ) ( not ( = ?auto_34795 ?auto_34793 ) ) ( not ( = ?auto_34795 ?auto_34796 ) ) ( not ( = ?auto_34793 ?auto_34796 ) ) ( ON ?auto_34793 ?auto_34795 ) ( not ( = ?auto_34794 ?auto_34796 ) ) ( not ( = ?auto_34792 ?auto_34794 ) ) ( not ( = ?auto_34795 ?auto_34794 ) ) ( not ( = ?auto_34793 ?auto_34794 ) ) ( ON ?auto_34796 ?auto_34793 ) ( ON ?auto_34794 ?auto_34796 ) ( CLEAR ?auto_34794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34792 ?auto_34795 ?auto_34793 ?auto_34796 )
      ( MAKE-1PILE ?auto_34792 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34797 - BLOCK
    )
    :vars
    (
      ?auto_34801 - BLOCK
      ?auto_34799 - BLOCK
      ?auto_34800 - BLOCK
      ?auto_34798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34801 ?auto_34797 ) ( ON-TABLE ?auto_34797 ) ( not ( = ?auto_34797 ?auto_34801 ) ) ( not ( = ?auto_34797 ?auto_34799 ) ) ( not ( = ?auto_34797 ?auto_34800 ) ) ( not ( = ?auto_34801 ?auto_34799 ) ) ( not ( = ?auto_34801 ?auto_34800 ) ) ( not ( = ?auto_34799 ?auto_34800 ) ) ( ON ?auto_34799 ?auto_34801 ) ( not ( = ?auto_34798 ?auto_34800 ) ) ( not ( = ?auto_34797 ?auto_34798 ) ) ( not ( = ?auto_34801 ?auto_34798 ) ) ( not ( = ?auto_34799 ?auto_34798 ) ) ( ON ?auto_34800 ?auto_34799 ) ( HOLDING ?auto_34798 ) ( CLEAR ?auto_34800 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34797 ?auto_34801 ?auto_34799 ?auto_34800 ?auto_34798 )
      ( MAKE-1PILE ?auto_34797 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34802 - BLOCK
    )
    :vars
    (
      ?auto_34804 - BLOCK
      ?auto_34806 - BLOCK
      ?auto_34805 - BLOCK
      ?auto_34803 - BLOCK
      ?auto_34807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34804 ?auto_34802 ) ( ON-TABLE ?auto_34802 ) ( not ( = ?auto_34802 ?auto_34804 ) ) ( not ( = ?auto_34802 ?auto_34806 ) ) ( not ( = ?auto_34802 ?auto_34805 ) ) ( not ( = ?auto_34804 ?auto_34806 ) ) ( not ( = ?auto_34804 ?auto_34805 ) ) ( not ( = ?auto_34806 ?auto_34805 ) ) ( ON ?auto_34806 ?auto_34804 ) ( not ( = ?auto_34803 ?auto_34805 ) ) ( not ( = ?auto_34802 ?auto_34803 ) ) ( not ( = ?auto_34804 ?auto_34803 ) ) ( not ( = ?auto_34806 ?auto_34803 ) ) ( ON ?auto_34805 ?auto_34806 ) ( CLEAR ?auto_34805 ) ( ON ?auto_34803 ?auto_34807 ) ( CLEAR ?auto_34803 ) ( HAND-EMPTY ) ( not ( = ?auto_34802 ?auto_34807 ) ) ( not ( = ?auto_34804 ?auto_34807 ) ) ( not ( = ?auto_34806 ?auto_34807 ) ) ( not ( = ?auto_34805 ?auto_34807 ) ) ( not ( = ?auto_34803 ?auto_34807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34803 ?auto_34807 )
      ( MAKE-1PILE ?auto_34802 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34808 - BLOCK
    )
    :vars
    (
      ?auto_34812 - BLOCK
      ?auto_34809 - BLOCK
      ?auto_34813 - BLOCK
      ?auto_34810 - BLOCK
      ?auto_34811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34812 ?auto_34808 ) ( ON-TABLE ?auto_34808 ) ( not ( = ?auto_34808 ?auto_34812 ) ) ( not ( = ?auto_34808 ?auto_34809 ) ) ( not ( = ?auto_34808 ?auto_34813 ) ) ( not ( = ?auto_34812 ?auto_34809 ) ) ( not ( = ?auto_34812 ?auto_34813 ) ) ( not ( = ?auto_34809 ?auto_34813 ) ) ( ON ?auto_34809 ?auto_34812 ) ( not ( = ?auto_34810 ?auto_34813 ) ) ( not ( = ?auto_34808 ?auto_34810 ) ) ( not ( = ?auto_34812 ?auto_34810 ) ) ( not ( = ?auto_34809 ?auto_34810 ) ) ( ON ?auto_34810 ?auto_34811 ) ( CLEAR ?auto_34810 ) ( not ( = ?auto_34808 ?auto_34811 ) ) ( not ( = ?auto_34812 ?auto_34811 ) ) ( not ( = ?auto_34809 ?auto_34811 ) ) ( not ( = ?auto_34813 ?auto_34811 ) ) ( not ( = ?auto_34810 ?auto_34811 ) ) ( HOLDING ?auto_34813 ) ( CLEAR ?auto_34809 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34808 ?auto_34812 ?auto_34809 ?auto_34813 )
      ( MAKE-1PILE ?auto_34808 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34814 - BLOCK
    )
    :vars
    (
      ?auto_34818 - BLOCK
      ?auto_34815 - BLOCK
      ?auto_34819 - BLOCK
      ?auto_34816 - BLOCK
      ?auto_34817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34818 ?auto_34814 ) ( ON-TABLE ?auto_34814 ) ( not ( = ?auto_34814 ?auto_34818 ) ) ( not ( = ?auto_34814 ?auto_34815 ) ) ( not ( = ?auto_34814 ?auto_34819 ) ) ( not ( = ?auto_34818 ?auto_34815 ) ) ( not ( = ?auto_34818 ?auto_34819 ) ) ( not ( = ?auto_34815 ?auto_34819 ) ) ( ON ?auto_34815 ?auto_34818 ) ( not ( = ?auto_34816 ?auto_34819 ) ) ( not ( = ?auto_34814 ?auto_34816 ) ) ( not ( = ?auto_34818 ?auto_34816 ) ) ( not ( = ?auto_34815 ?auto_34816 ) ) ( ON ?auto_34816 ?auto_34817 ) ( not ( = ?auto_34814 ?auto_34817 ) ) ( not ( = ?auto_34818 ?auto_34817 ) ) ( not ( = ?auto_34815 ?auto_34817 ) ) ( not ( = ?auto_34819 ?auto_34817 ) ) ( not ( = ?auto_34816 ?auto_34817 ) ) ( CLEAR ?auto_34815 ) ( ON ?auto_34819 ?auto_34816 ) ( CLEAR ?auto_34819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34817 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34817 ?auto_34816 )
      ( MAKE-1PILE ?auto_34814 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34820 - BLOCK
    )
    :vars
    (
      ?auto_34823 - BLOCK
      ?auto_34821 - BLOCK
      ?auto_34822 - BLOCK
      ?auto_34824 - BLOCK
      ?auto_34825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34823 ?auto_34820 ) ( ON-TABLE ?auto_34820 ) ( not ( = ?auto_34820 ?auto_34823 ) ) ( not ( = ?auto_34820 ?auto_34821 ) ) ( not ( = ?auto_34820 ?auto_34822 ) ) ( not ( = ?auto_34823 ?auto_34821 ) ) ( not ( = ?auto_34823 ?auto_34822 ) ) ( not ( = ?auto_34821 ?auto_34822 ) ) ( not ( = ?auto_34824 ?auto_34822 ) ) ( not ( = ?auto_34820 ?auto_34824 ) ) ( not ( = ?auto_34823 ?auto_34824 ) ) ( not ( = ?auto_34821 ?auto_34824 ) ) ( ON ?auto_34824 ?auto_34825 ) ( not ( = ?auto_34820 ?auto_34825 ) ) ( not ( = ?auto_34823 ?auto_34825 ) ) ( not ( = ?auto_34821 ?auto_34825 ) ) ( not ( = ?auto_34822 ?auto_34825 ) ) ( not ( = ?auto_34824 ?auto_34825 ) ) ( ON ?auto_34822 ?auto_34824 ) ( CLEAR ?auto_34822 ) ( ON-TABLE ?auto_34825 ) ( HOLDING ?auto_34821 ) ( CLEAR ?auto_34823 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34820 ?auto_34823 ?auto_34821 )
      ( MAKE-1PILE ?auto_34820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34826 - BLOCK
    )
    :vars
    (
      ?auto_34830 - BLOCK
      ?auto_34829 - BLOCK
      ?auto_34831 - BLOCK
      ?auto_34827 - BLOCK
      ?auto_34828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_34830 ?auto_34826 ) ( ON-TABLE ?auto_34826 ) ( not ( = ?auto_34826 ?auto_34830 ) ) ( not ( = ?auto_34826 ?auto_34829 ) ) ( not ( = ?auto_34826 ?auto_34831 ) ) ( not ( = ?auto_34830 ?auto_34829 ) ) ( not ( = ?auto_34830 ?auto_34831 ) ) ( not ( = ?auto_34829 ?auto_34831 ) ) ( not ( = ?auto_34827 ?auto_34831 ) ) ( not ( = ?auto_34826 ?auto_34827 ) ) ( not ( = ?auto_34830 ?auto_34827 ) ) ( not ( = ?auto_34829 ?auto_34827 ) ) ( ON ?auto_34827 ?auto_34828 ) ( not ( = ?auto_34826 ?auto_34828 ) ) ( not ( = ?auto_34830 ?auto_34828 ) ) ( not ( = ?auto_34829 ?auto_34828 ) ) ( not ( = ?auto_34831 ?auto_34828 ) ) ( not ( = ?auto_34827 ?auto_34828 ) ) ( ON ?auto_34831 ?auto_34827 ) ( ON-TABLE ?auto_34828 ) ( CLEAR ?auto_34830 ) ( ON ?auto_34829 ?auto_34831 ) ( CLEAR ?auto_34829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34828 ?auto_34827 ?auto_34831 )
      ( MAKE-1PILE ?auto_34826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34844 - BLOCK
    )
    :vars
    (
      ?auto_34846 - BLOCK
      ?auto_34848 - BLOCK
      ?auto_34849 - BLOCK
      ?auto_34847 - BLOCK
      ?auto_34845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34844 ?auto_34846 ) ) ( not ( = ?auto_34844 ?auto_34848 ) ) ( not ( = ?auto_34844 ?auto_34849 ) ) ( not ( = ?auto_34846 ?auto_34848 ) ) ( not ( = ?auto_34846 ?auto_34849 ) ) ( not ( = ?auto_34848 ?auto_34849 ) ) ( not ( = ?auto_34847 ?auto_34849 ) ) ( not ( = ?auto_34844 ?auto_34847 ) ) ( not ( = ?auto_34846 ?auto_34847 ) ) ( not ( = ?auto_34848 ?auto_34847 ) ) ( ON ?auto_34847 ?auto_34845 ) ( not ( = ?auto_34844 ?auto_34845 ) ) ( not ( = ?auto_34846 ?auto_34845 ) ) ( not ( = ?auto_34848 ?auto_34845 ) ) ( not ( = ?auto_34849 ?auto_34845 ) ) ( not ( = ?auto_34847 ?auto_34845 ) ) ( ON ?auto_34849 ?auto_34847 ) ( ON-TABLE ?auto_34845 ) ( ON ?auto_34848 ?auto_34849 ) ( ON ?auto_34846 ?auto_34848 ) ( CLEAR ?auto_34846 ) ( HOLDING ?auto_34844 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34844 ?auto_34846 )
      ( MAKE-1PILE ?auto_34844 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_34850 - BLOCK
    )
    :vars
    (
      ?auto_34851 - BLOCK
      ?auto_34852 - BLOCK
      ?auto_34855 - BLOCK
      ?auto_34853 - BLOCK
      ?auto_34854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34850 ?auto_34851 ) ) ( not ( = ?auto_34850 ?auto_34852 ) ) ( not ( = ?auto_34850 ?auto_34855 ) ) ( not ( = ?auto_34851 ?auto_34852 ) ) ( not ( = ?auto_34851 ?auto_34855 ) ) ( not ( = ?auto_34852 ?auto_34855 ) ) ( not ( = ?auto_34853 ?auto_34855 ) ) ( not ( = ?auto_34850 ?auto_34853 ) ) ( not ( = ?auto_34851 ?auto_34853 ) ) ( not ( = ?auto_34852 ?auto_34853 ) ) ( ON ?auto_34853 ?auto_34854 ) ( not ( = ?auto_34850 ?auto_34854 ) ) ( not ( = ?auto_34851 ?auto_34854 ) ) ( not ( = ?auto_34852 ?auto_34854 ) ) ( not ( = ?auto_34855 ?auto_34854 ) ) ( not ( = ?auto_34853 ?auto_34854 ) ) ( ON ?auto_34855 ?auto_34853 ) ( ON-TABLE ?auto_34854 ) ( ON ?auto_34852 ?auto_34855 ) ( ON ?auto_34851 ?auto_34852 ) ( ON ?auto_34850 ?auto_34851 ) ( CLEAR ?auto_34850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34854 ?auto_34853 ?auto_34855 ?auto_34852 ?auto_34851 )
      ( MAKE-1PILE ?auto_34850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34860 - BLOCK
      ?auto_34861 - BLOCK
      ?auto_34862 - BLOCK
      ?auto_34863 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34863 ) ( CLEAR ?auto_34862 ) ( ON-TABLE ?auto_34860 ) ( ON ?auto_34861 ?auto_34860 ) ( ON ?auto_34862 ?auto_34861 ) ( not ( = ?auto_34860 ?auto_34861 ) ) ( not ( = ?auto_34860 ?auto_34862 ) ) ( not ( = ?auto_34860 ?auto_34863 ) ) ( not ( = ?auto_34861 ?auto_34862 ) ) ( not ( = ?auto_34861 ?auto_34863 ) ) ( not ( = ?auto_34862 ?auto_34863 ) ) )
    :subtasks
    ( ( !STACK ?auto_34863 ?auto_34862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34864 - BLOCK
      ?auto_34865 - BLOCK
      ?auto_34866 - BLOCK
      ?auto_34867 - BLOCK
    )
    :vars
    (
      ?auto_34868 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34866 ) ( ON-TABLE ?auto_34864 ) ( ON ?auto_34865 ?auto_34864 ) ( ON ?auto_34866 ?auto_34865 ) ( not ( = ?auto_34864 ?auto_34865 ) ) ( not ( = ?auto_34864 ?auto_34866 ) ) ( not ( = ?auto_34864 ?auto_34867 ) ) ( not ( = ?auto_34865 ?auto_34866 ) ) ( not ( = ?auto_34865 ?auto_34867 ) ) ( not ( = ?auto_34866 ?auto_34867 ) ) ( ON ?auto_34867 ?auto_34868 ) ( CLEAR ?auto_34867 ) ( HAND-EMPTY ) ( not ( = ?auto_34864 ?auto_34868 ) ) ( not ( = ?auto_34865 ?auto_34868 ) ) ( not ( = ?auto_34866 ?auto_34868 ) ) ( not ( = ?auto_34867 ?auto_34868 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34867 ?auto_34868 )
      ( MAKE-4PILE ?auto_34864 ?auto_34865 ?auto_34866 ?auto_34867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34869 - BLOCK
      ?auto_34870 - BLOCK
      ?auto_34871 - BLOCK
      ?auto_34872 - BLOCK
    )
    :vars
    (
      ?auto_34873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34869 ) ( ON ?auto_34870 ?auto_34869 ) ( not ( = ?auto_34869 ?auto_34870 ) ) ( not ( = ?auto_34869 ?auto_34871 ) ) ( not ( = ?auto_34869 ?auto_34872 ) ) ( not ( = ?auto_34870 ?auto_34871 ) ) ( not ( = ?auto_34870 ?auto_34872 ) ) ( not ( = ?auto_34871 ?auto_34872 ) ) ( ON ?auto_34872 ?auto_34873 ) ( CLEAR ?auto_34872 ) ( not ( = ?auto_34869 ?auto_34873 ) ) ( not ( = ?auto_34870 ?auto_34873 ) ) ( not ( = ?auto_34871 ?auto_34873 ) ) ( not ( = ?auto_34872 ?auto_34873 ) ) ( HOLDING ?auto_34871 ) ( CLEAR ?auto_34870 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34869 ?auto_34870 ?auto_34871 )
      ( MAKE-4PILE ?auto_34869 ?auto_34870 ?auto_34871 ?auto_34872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34874 - BLOCK
      ?auto_34875 - BLOCK
      ?auto_34876 - BLOCK
      ?auto_34877 - BLOCK
    )
    :vars
    (
      ?auto_34878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34874 ) ( ON ?auto_34875 ?auto_34874 ) ( not ( = ?auto_34874 ?auto_34875 ) ) ( not ( = ?auto_34874 ?auto_34876 ) ) ( not ( = ?auto_34874 ?auto_34877 ) ) ( not ( = ?auto_34875 ?auto_34876 ) ) ( not ( = ?auto_34875 ?auto_34877 ) ) ( not ( = ?auto_34876 ?auto_34877 ) ) ( ON ?auto_34877 ?auto_34878 ) ( not ( = ?auto_34874 ?auto_34878 ) ) ( not ( = ?auto_34875 ?auto_34878 ) ) ( not ( = ?auto_34876 ?auto_34878 ) ) ( not ( = ?auto_34877 ?auto_34878 ) ) ( CLEAR ?auto_34875 ) ( ON ?auto_34876 ?auto_34877 ) ( CLEAR ?auto_34876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34878 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34878 ?auto_34877 )
      ( MAKE-4PILE ?auto_34874 ?auto_34875 ?auto_34876 ?auto_34877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34879 - BLOCK
      ?auto_34880 - BLOCK
      ?auto_34881 - BLOCK
      ?auto_34882 - BLOCK
    )
    :vars
    (
      ?auto_34883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34879 ) ( not ( = ?auto_34879 ?auto_34880 ) ) ( not ( = ?auto_34879 ?auto_34881 ) ) ( not ( = ?auto_34879 ?auto_34882 ) ) ( not ( = ?auto_34880 ?auto_34881 ) ) ( not ( = ?auto_34880 ?auto_34882 ) ) ( not ( = ?auto_34881 ?auto_34882 ) ) ( ON ?auto_34882 ?auto_34883 ) ( not ( = ?auto_34879 ?auto_34883 ) ) ( not ( = ?auto_34880 ?auto_34883 ) ) ( not ( = ?auto_34881 ?auto_34883 ) ) ( not ( = ?auto_34882 ?auto_34883 ) ) ( ON ?auto_34881 ?auto_34882 ) ( CLEAR ?auto_34881 ) ( ON-TABLE ?auto_34883 ) ( HOLDING ?auto_34880 ) ( CLEAR ?auto_34879 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34879 ?auto_34880 )
      ( MAKE-4PILE ?auto_34879 ?auto_34880 ?auto_34881 ?auto_34882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34884 - BLOCK
      ?auto_34885 - BLOCK
      ?auto_34886 - BLOCK
      ?auto_34887 - BLOCK
    )
    :vars
    (
      ?auto_34888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34884 ) ( not ( = ?auto_34884 ?auto_34885 ) ) ( not ( = ?auto_34884 ?auto_34886 ) ) ( not ( = ?auto_34884 ?auto_34887 ) ) ( not ( = ?auto_34885 ?auto_34886 ) ) ( not ( = ?auto_34885 ?auto_34887 ) ) ( not ( = ?auto_34886 ?auto_34887 ) ) ( ON ?auto_34887 ?auto_34888 ) ( not ( = ?auto_34884 ?auto_34888 ) ) ( not ( = ?auto_34885 ?auto_34888 ) ) ( not ( = ?auto_34886 ?auto_34888 ) ) ( not ( = ?auto_34887 ?auto_34888 ) ) ( ON ?auto_34886 ?auto_34887 ) ( ON-TABLE ?auto_34888 ) ( CLEAR ?auto_34884 ) ( ON ?auto_34885 ?auto_34886 ) ( CLEAR ?auto_34885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34888 ?auto_34887 ?auto_34886 )
      ( MAKE-4PILE ?auto_34884 ?auto_34885 ?auto_34886 ?auto_34887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34889 - BLOCK
      ?auto_34890 - BLOCK
      ?auto_34891 - BLOCK
      ?auto_34892 - BLOCK
    )
    :vars
    (
      ?auto_34893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34889 ?auto_34890 ) ) ( not ( = ?auto_34889 ?auto_34891 ) ) ( not ( = ?auto_34889 ?auto_34892 ) ) ( not ( = ?auto_34890 ?auto_34891 ) ) ( not ( = ?auto_34890 ?auto_34892 ) ) ( not ( = ?auto_34891 ?auto_34892 ) ) ( ON ?auto_34892 ?auto_34893 ) ( not ( = ?auto_34889 ?auto_34893 ) ) ( not ( = ?auto_34890 ?auto_34893 ) ) ( not ( = ?auto_34891 ?auto_34893 ) ) ( not ( = ?auto_34892 ?auto_34893 ) ) ( ON ?auto_34891 ?auto_34892 ) ( ON-TABLE ?auto_34893 ) ( ON ?auto_34890 ?auto_34891 ) ( CLEAR ?auto_34890 ) ( HOLDING ?auto_34889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34889 )
      ( MAKE-4PILE ?auto_34889 ?auto_34890 ?auto_34891 ?auto_34892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34894 - BLOCK
      ?auto_34895 - BLOCK
      ?auto_34896 - BLOCK
      ?auto_34897 - BLOCK
    )
    :vars
    (
      ?auto_34898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34894 ?auto_34895 ) ) ( not ( = ?auto_34894 ?auto_34896 ) ) ( not ( = ?auto_34894 ?auto_34897 ) ) ( not ( = ?auto_34895 ?auto_34896 ) ) ( not ( = ?auto_34895 ?auto_34897 ) ) ( not ( = ?auto_34896 ?auto_34897 ) ) ( ON ?auto_34897 ?auto_34898 ) ( not ( = ?auto_34894 ?auto_34898 ) ) ( not ( = ?auto_34895 ?auto_34898 ) ) ( not ( = ?auto_34896 ?auto_34898 ) ) ( not ( = ?auto_34897 ?auto_34898 ) ) ( ON ?auto_34896 ?auto_34897 ) ( ON-TABLE ?auto_34898 ) ( ON ?auto_34895 ?auto_34896 ) ( ON ?auto_34894 ?auto_34895 ) ( CLEAR ?auto_34894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34898 ?auto_34897 ?auto_34896 ?auto_34895 )
      ( MAKE-4PILE ?auto_34894 ?auto_34895 ?auto_34896 ?auto_34897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34899 - BLOCK
      ?auto_34900 - BLOCK
      ?auto_34901 - BLOCK
      ?auto_34902 - BLOCK
    )
    :vars
    (
      ?auto_34903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34899 ?auto_34900 ) ) ( not ( = ?auto_34899 ?auto_34901 ) ) ( not ( = ?auto_34899 ?auto_34902 ) ) ( not ( = ?auto_34900 ?auto_34901 ) ) ( not ( = ?auto_34900 ?auto_34902 ) ) ( not ( = ?auto_34901 ?auto_34902 ) ) ( ON ?auto_34902 ?auto_34903 ) ( not ( = ?auto_34899 ?auto_34903 ) ) ( not ( = ?auto_34900 ?auto_34903 ) ) ( not ( = ?auto_34901 ?auto_34903 ) ) ( not ( = ?auto_34902 ?auto_34903 ) ) ( ON ?auto_34901 ?auto_34902 ) ( ON-TABLE ?auto_34903 ) ( ON ?auto_34900 ?auto_34901 ) ( HOLDING ?auto_34899 ) ( CLEAR ?auto_34900 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34903 ?auto_34902 ?auto_34901 ?auto_34900 ?auto_34899 )
      ( MAKE-4PILE ?auto_34899 ?auto_34900 ?auto_34901 ?auto_34902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34904 - BLOCK
      ?auto_34905 - BLOCK
      ?auto_34906 - BLOCK
      ?auto_34907 - BLOCK
    )
    :vars
    (
      ?auto_34908 - BLOCK
      ?auto_34909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34904 ?auto_34905 ) ) ( not ( = ?auto_34904 ?auto_34906 ) ) ( not ( = ?auto_34904 ?auto_34907 ) ) ( not ( = ?auto_34905 ?auto_34906 ) ) ( not ( = ?auto_34905 ?auto_34907 ) ) ( not ( = ?auto_34906 ?auto_34907 ) ) ( ON ?auto_34907 ?auto_34908 ) ( not ( = ?auto_34904 ?auto_34908 ) ) ( not ( = ?auto_34905 ?auto_34908 ) ) ( not ( = ?auto_34906 ?auto_34908 ) ) ( not ( = ?auto_34907 ?auto_34908 ) ) ( ON ?auto_34906 ?auto_34907 ) ( ON-TABLE ?auto_34908 ) ( ON ?auto_34905 ?auto_34906 ) ( CLEAR ?auto_34905 ) ( ON ?auto_34904 ?auto_34909 ) ( CLEAR ?auto_34904 ) ( HAND-EMPTY ) ( not ( = ?auto_34904 ?auto_34909 ) ) ( not ( = ?auto_34905 ?auto_34909 ) ) ( not ( = ?auto_34906 ?auto_34909 ) ) ( not ( = ?auto_34907 ?auto_34909 ) ) ( not ( = ?auto_34908 ?auto_34909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_34904 ?auto_34909 )
      ( MAKE-4PILE ?auto_34904 ?auto_34905 ?auto_34906 ?auto_34907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34910 - BLOCK
      ?auto_34911 - BLOCK
      ?auto_34912 - BLOCK
      ?auto_34913 - BLOCK
    )
    :vars
    (
      ?auto_34915 - BLOCK
      ?auto_34914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34910 ?auto_34911 ) ) ( not ( = ?auto_34910 ?auto_34912 ) ) ( not ( = ?auto_34910 ?auto_34913 ) ) ( not ( = ?auto_34911 ?auto_34912 ) ) ( not ( = ?auto_34911 ?auto_34913 ) ) ( not ( = ?auto_34912 ?auto_34913 ) ) ( ON ?auto_34913 ?auto_34915 ) ( not ( = ?auto_34910 ?auto_34915 ) ) ( not ( = ?auto_34911 ?auto_34915 ) ) ( not ( = ?auto_34912 ?auto_34915 ) ) ( not ( = ?auto_34913 ?auto_34915 ) ) ( ON ?auto_34912 ?auto_34913 ) ( ON-TABLE ?auto_34915 ) ( ON ?auto_34910 ?auto_34914 ) ( CLEAR ?auto_34910 ) ( not ( = ?auto_34910 ?auto_34914 ) ) ( not ( = ?auto_34911 ?auto_34914 ) ) ( not ( = ?auto_34912 ?auto_34914 ) ) ( not ( = ?auto_34913 ?auto_34914 ) ) ( not ( = ?auto_34915 ?auto_34914 ) ) ( HOLDING ?auto_34911 ) ( CLEAR ?auto_34912 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34915 ?auto_34913 ?auto_34912 ?auto_34911 )
      ( MAKE-4PILE ?auto_34910 ?auto_34911 ?auto_34912 ?auto_34913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34916 - BLOCK
      ?auto_34917 - BLOCK
      ?auto_34918 - BLOCK
      ?auto_34919 - BLOCK
    )
    :vars
    (
      ?auto_34920 - BLOCK
      ?auto_34921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34916 ?auto_34917 ) ) ( not ( = ?auto_34916 ?auto_34918 ) ) ( not ( = ?auto_34916 ?auto_34919 ) ) ( not ( = ?auto_34917 ?auto_34918 ) ) ( not ( = ?auto_34917 ?auto_34919 ) ) ( not ( = ?auto_34918 ?auto_34919 ) ) ( ON ?auto_34919 ?auto_34920 ) ( not ( = ?auto_34916 ?auto_34920 ) ) ( not ( = ?auto_34917 ?auto_34920 ) ) ( not ( = ?auto_34918 ?auto_34920 ) ) ( not ( = ?auto_34919 ?auto_34920 ) ) ( ON ?auto_34918 ?auto_34919 ) ( ON-TABLE ?auto_34920 ) ( ON ?auto_34916 ?auto_34921 ) ( not ( = ?auto_34916 ?auto_34921 ) ) ( not ( = ?auto_34917 ?auto_34921 ) ) ( not ( = ?auto_34918 ?auto_34921 ) ) ( not ( = ?auto_34919 ?auto_34921 ) ) ( not ( = ?auto_34920 ?auto_34921 ) ) ( CLEAR ?auto_34918 ) ( ON ?auto_34917 ?auto_34916 ) ( CLEAR ?auto_34917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_34921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34921 ?auto_34916 )
      ( MAKE-4PILE ?auto_34916 ?auto_34917 ?auto_34918 ?auto_34919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34922 - BLOCK
      ?auto_34923 - BLOCK
      ?auto_34924 - BLOCK
      ?auto_34925 - BLOCK
    )
    :vars
    (
      ?auto_34926 - BLOCK
      ?auto_34927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34922 ?auto_34923 ) ) ( not ( = ?auto_34922 ?auto_34924 ) ) ( not ( = ?auto_34922 ?auto_34925 ) ) ( not ( = ?auto_34923 ?auto_34924 ) ) ( not ( = ?auto_34923 ?auto_34925 ) ) ( not ( = ?auto_34924 ?auto_34925 ) ) ( ON ?auto_34925 ?auto_34926 ) ( not ( = ?auto_34922 ?auto_34926 ) ) ( not ( = ?auto_34923 ?auto_34926 ) ) ( not ( = ?auto_34924 ?auto_34926 ) ) ( not ( = ?auto_34925 ?auto_34926 ) ) ( ON-TABLE ?auto_34926 ) ( ON ?auto_34922 ?auto_34927 ) ( not ( = ?auto_34922 ?auto_34927 ) ) ( not ( = ?auto_34923 ?auto_34927 ) ) ( not ( = ?auto_34924 ?auto_34927 ) ) ( not ( = ?auto_34925 ?auto_34927 ) ) ( not ( = ?auto_34926 ?auto_34927 ) ) ( ON ?auto_34923 ?auto_34922 ) ( CLEAR ?auto_34923 ) ( ON-TABLE ?auto_34927 ) ( HOLDING ?auto_34924 ) ( CLEAR ?auto_34925 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34926 ?auto_34925 ?auto_34924 )
      ( MAKE-4PILE ?auto_34922 ?auto_34923 ?auto_34924 ?auto_34925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34928 - BLOCK
      ?auto_34929 - BLOCK
      ?auto_34930 - BLOCK
      ?auto_34931 - BLOCK
    )
    :vars
    (
      ?auto_34933 - BLOCK
      ?auto_34932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34928 ?auto_34929 ) ) ( not ( = ?auto_34928 ?auto_34930 ) ) ( not ( = ?auto_34928 ?auto_34931 ) ) ( not ( = ?auto_34929 ?auto_34930 ) ) ( not ( = ?auto_34929 ?auto_34931 ) ) ( not ( = ?auto_34930 ?auto_34931 ) ) ( ON ?auto_34931 ?auto_34933 ) ( not ( = ?auto_34928 ?auto_34933 ) ) ( not ( = ?auto_34929 ?auto_34933 ) ) ( not ( = ?auto_34930 ?auto_34933 ) ) ( not ( = ?auto_34931 ?auto_34933 ) ) ( ON-TABLE ?auto_34933 ) ( ON ?auto_34928 ?auto_34932 ) ( not ( = ?auto_34928 ?auto_34932 ) ) ( not ( = ?auto_34929 ?auto_34932 ) ) ( not ( = ?auto_34930 ?auto_34932 ) ) ( not ( = ?auto_34931 ?auto_34932 ) ) ( not ( = ?auto_34933 ?auto_34932 ) ) ( ON ?auto_34929 ?auto_34928 ) ( ON-TABLE ?auto_34932 ) ( CLEAR ?auto_34931 ) ( ON ?auto_34930 ?auto_34929 ) ( CLEAR ?auto_34930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34932 ?auto_34928 ?auto_34929 )
      ( MAKE-4PILE ?auto_34928 ?auto_34929 ?auto_34930 ?auto_34931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34934 - BLOCK
      ?auto_34935 - BLOCK
      ?auto_34936 - BLOCK
      ?auto_34937 - BLOCK
    )
    :vars
    (
      ?auto_34938 - BLOCK
      ?auto_34939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34934 ?auto_34935 ) ) ( not ( = ?auto_34934 ?auto_34936 ) ) ( not ( = ?auto_34934 ?auto_34937 ) ) ( not ( = ?auto_34935 ?auto_34936 ) ) ( not ( = ?auto_34935 ?auto_34937 ) ) ( not ( = ?auto_34936 ?auto_34937 ) ) ( not ( = ?auto_34934 ?auto_34938 ) ) ( not ( = ?auto_34935 ?auto_34938 ) ) ( not ( = ?auto_34936 ?auto_34938 ) ) ( not ( = ?auto_34937 ?auto_34938 ) ) ( ON-TABLE ?auto_34938 ) ( ON ?auto_34934 ?auto_34939 ) ( not ( = ?auto_34934 ?auto_34939 ) ) ( not ( = ?auto_34935 ?auto_34939 ) ) ( not ( = ?auto_34936 ?auto_34939 ) ) ( not ( = ?auto_34937 ?auto_34939 ) ) ( not ( = ?auto_34938 ?auto_34939 ) ) ( ON ?auto_34935 ?auto_34934 ) ( ON-TABLE ?auto_34939 ) ( ON ?auto_34936 ?auto_34935 ) ( CLEAR ?auto_34936 ) ( HOLDING ?auto_34937 ) ( CLEAR ?auto_34938 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34938 ?auto_34937 )
      ( MAKE-4PILE ?auto_34934 ?auto_34935 ?auto_34936 ?auto_34937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34940 - BLOCK
      ?auto_34941 - BLOCK
      ?auto_34942 - BLOCK
      ?auto_34943 - BLOCK
    )
    :vars
    (
      ?auto_34945 - BLOCK
      ?auto_34944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34940 ?auto_34941 ) ) ( not ( = ?auto_34940 ?auto_34942 ) ) ( not ( = ?auto_34940 ?auto_34943 ) ) ( not ( = ?auto_34941 ?auto_34942 ) ) ( not ( = ?auto_34941 ?auto_34943 ) ) ( not ( = ?auto_34942 ?auto_34943 ) ) ( not ( = ?auto_34940 ?auto_34945 ) ) ( not ( = ?auto_34941 ?auto_34945 ) ) ( not ( = ?auto_34942 ?auto_34945 ) ) ( not ( = ?auto_34943 ?auto_34945 ) ) ( ON-TABLE ?auto_34945 ) ( ON ?auto_34940 ?auto_34944 ) ( not ( = ?auto_34940 ?auto_34944 ) ) ( not ( = ?auto_34941 ?auto_34944 ) ) ( not ( = ?auto_34942 ?auto_34944 ) ) ( not ( = ?auto_34943 ?auto_34944 ) ) ( not ( = ?auto_34945 ?auto_34944 ) ) ( ON ?auto_34941 ?auto_34940 ) ( ON-TABLE ?auto_34944 ) ( ON ?auto_34942 ?auto_34941 ) ( CLEAR ?auto_34945 ) ( ON ?auto_34943 ?auto_34942 ) ( CLEAR ?auto_34943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34944 ?auto_34940 ?auto_34941 ?auto_34942 )
      ( MAKE-4PILE ?auto_34940 ?auto_34941 ?auto_34942 ?auto_34943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34946 - BLOCK
      ?auto_34947 - BLOCK
      ?auto_34948 - BLOCK
      ?auto_34949 - BLOCK
    )
    :vars
    (
      ?auto_34950 - BLOCK
      ?auto_34951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34946 ?auto_34947 ) ) ( not ( = ?auto_34946 ?auto_34948 ) ) ( not ( = ?auto_34946 ?auto_34949 ) ) ( not ( = ?auto_34947 ?auto_34948 ) ) ( not ( = ?auto_34947 ?auto_34949 ) ) ( not ( = ?auto_34948 ?auto_34949 ) ) ( not ( = ?auto_34946 ?auto_34950 ) ) ( not ( = ?auto_34947 ?auto_34950 ) ) ( not ( = ?auto_34948 ?auto_34950 ) ) ( not ( = ?auto_34949 ?auto_34950 ) ) ( ON ?auto_34946 ?auto_34951 ) ( not ( = ?auto_34946 ?auto_34951 ) ) ( not ( = ?auto_34947 ?auto_34951 ) ) ( not ( = ?auto_34948 ?auto_34951 ) ) ( not ( = ?auto_34949 ?auto_34951 ) ) ( not ( = ?auto_34950 ?auto_34951 ) ) ( ON ?auto_34947 ?auto_34946 ) ( ON-TABLE ?auto_34951 ) ( ON ?auto_34948 ?auto_34947 ) ( ON ?auto_34949 ?auto_34948 ) ( CLEAR ?auto_34949 ) ( HOLDING ?auto_34950 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34950 )
      ( MAKE-4PILE ?auto_34946 ?auto_34947 ?auto_34948 ?auto_34949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_34952 - BLOCK
      ?auto_34953 - BLOCK
      ?auto_34954 - BLOCK
      ?auto_34955 - BLOCK
    )
    :vars
    (
      ?auto_34956 - BLOCK
      ?auto_34957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_34952 ?auto_34953 ) ) ( not ( = ?auto_34952 ?auto_34954 ) ) ( not ( = ?auto_34952 ?auto_34955 ) ) ( not ( = ?auto_34953 ?auto_34954 ) ) ( not ( = ?auto_34953 ?auto_34955 ) ) ( not ( = ?auto_34954 ?auto_34955 ) ) ( not ( = ?auto_34952 ?auto_34956 ) ) ( not ( = ?auto_34953 ?auto_34956 ) ) ( not ( = ?auto_34954 ?auto_34956 ) ) ( not ( = ?auto_34955 ?auto_34956 ) ) ( ON ?auto_34952 ?auto_34957 ) ( not ( = ?auto_34952 ?auto_34957 ) ) ( not ( = ?auto_34953 ?auto_34957 ) ) ( not ( = ?auto_34954 ?auto_34957 ) ) ( not ( = ?auto_34955 ?auto_34957 ) ) ( not ( = ?auto_34956 ?auto_34957 ) ) ( ON ?auto_34953 ?auto_34952 ) ( ON-TABLE ?auto_34957 ) ( ON ?auto_34954 ?auto_34953 ) ( ON ?auto_34955 ?auto_34954 ) ( ON ?auto_34956 ?auto_34955 ) ( CLEAR ?auto_34956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_34957 ?auto_34952 ?auto_34953 ?auto_34954 ?auto_34955 )
      ( MAKE-4PILE ?auto_34952 ?auto_34953 ?auto_34954 ?auto_34955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34963 - BLOCK
      ?auto_34964 - BLOCK
      ?auto_34965 - BLOCK
      ?auto_34966 - BLOCK
      ?auto_34967 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_34967 ) ( CLEAR ?auto_34966 ) ( ON-TABLE ?auto_34963 ) ( ON ?auto_34964 ?auto_34963 ) ( ON ?auto_34965 ?auto_34964 ) ( ON ?auto_34966 ?auto_34965 ) ( not ( = ?auto_34963 ?auto_34964 ) ) ( not ( = ?auto_34963 ?auto_34965 ) ) ( not ( = ?auto_34963 ?auto_34966 ) ) ( not ( = ?auto_34963 ?auto_34967 ) ) ( not ( = ?auto_34964 ?auto_34965 ) ) ( not ( = ?auto_34964 ?auto_34966 ) ) ( not ( = ?auto_34964 ?auto_34967 ) ) ( not ( = ?auto_34965 ?auto_34966 ) ) ( not ( = ?auto_34965 ?auto_34967 ) ) ( not ( = ?auto_34966 ?auto_34967 ) ) )
    :subtasks
    ( ( !STACK ?auto_34967 ?auto_34966 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34968 - BLOCK
      ?auto_34969 - BLOCK
      ?auto_34970 - BLOCK
      ?auto_34971 - BLOCK
      ?auto_34972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_34971 ) ( ON-TABLE ?auto_34968 ) ( ON ?auto_34969 ?auto_34968 ) ( ON ?auto_34970 ?auto_34969 ) ( ON ?auto_34971 ?auto_34970 ) ( not ( = ?auto_34968 ?auto_34969 ) ) ( not ( = ?auto_34968 ?auto_34970 ) ) ( not ( = ?auto_34968 ?auto_34971 ) ) ( not ( = ?auto_34968 ?auto_34972 ) ) ( not ( = ?auto_34969 ?auto_34970 ) ) ( not ( = ?auto_34969 ?auto_34971 ) ) ( not ( = ?auto_34969 ?auto_34972 ) ) ( not ( = ?auto_34970 ?auto_34971 ) ) ( not ( = ?auto_34970 ?auto_34972 ) ) ( not ( = ?auto_34971 ?auto_34972 ) ) ( ON-TABLE ?auto_34972 ) ( CLEAR ?auto_34972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_34972 )
      ( MAKE-5PILE ?auto_34968 ?auto_34969 ?auto_34970 ?auto_34971 ?auto_34972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34973 - BLOCK
      ?auto_34974 - BLOCK
      ?auto_34975 - BLOCK
      ?auto_34976 - BLOCK
      ?auto_34977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34973 ) ( ON ?auto_34974 ?auto_34973 ) ( ON ?auto_34975 ?auto_34974 ) ( not ( = ?auto_34973 ?auto_34974 ) ) ( not ( = ?auto_34973 ?auto_34975 ) ) ( not ( = ?auto_34973 ?auto_34976 ) ) ( not ( = ?auto_34973 ?auto_34977 ) ) ( not ( = ?auto_34974 ?auto_34975 ) ) ( not ( = ?auto_34974 ?auto_34976 ) ) ( not ( = ?auto_34974 ?auto_34977 ) ) ( not ( = ?auto_34975 ?auto_34976 ) ) ( not ( = ?auto_34975 ?auto_34977 ) ) ( not ( = ?auto_34976 ?auto_34977 ) ) ( ON-TABLE ?auto_34977 ) ( CLEAR ?auto_34977 ) ( HOLDING ?auto_34976 ) ( CLEAR ?auto_34975 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_34973 ?auto_34974 ?auto_34975 ?auto_34976 )
      ( MAKE-5PILE ?auto_34973 ?auto_34974 ?auto_34975 ?auto_34976 ?auto_34977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34978 - BLOCK
      ?auto_34979 - BLOCK
      ?auto_34980 - BLOCK
      ?auto_34981 - BLOCK
      ?auto_34982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34978 ) ( ON ?auto_34979 ?auto_34978 ) ( ON ?auto_34980 ?auto_34979 ) ( not ( = ?auto_34978 ?auto_34979 ) ) ( not ( = ?auto_34978 ?auto_34980 ) ) ( not ( = ?auto_34978 ?auto_34981 ) ) ( not ( = ?auto_34978 ?auto_34982 ) ) ( not ( = ?auto_34979 ?auto_34980 ) ) ( not ( = ?auto_34979 ?auto_34981 ) ) ( not ( = ?auto_34979 ?auto_34982 ) ) ( not ( = ?auto_34980 ?auto_34981 ) ) ( not ( = ?auto_34980 ?auto_34982 ) ) ( not ( = ?auto_34981 ?auto_34982 ) ) ( ON-TABLE ?auto_34982 ) ( CLEAR ?auto_34980 ) ( ON ?auto_34981 ?auto_34982 ) ( CLEAR ?auto_34981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_34982 )
      ( MAKE-5PILE ?auto_34978 ?auto_34979 ?auto_34980 ?auto_34981 ?auto_34982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34983 - BLOCK
      ?auto_34984 - BLOCK
      ?auto_34985 - BLOCK
      ?auto_34986 - BLOCK
      ?auto_34987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34983 ) ( ON ?auto_34984 ?auto_34983 ) ( not ( = ?auto_34983 ?auto_34984 ) ) ( not ( = ?auto_34983 ?auto_34985 ) ) ( not ( = ?auto_34983 ?auto_34986 ) ) ( not ( = ?auto_34983 ?auto_34987 ) ) ( not ( = ?auto_34984 ?auto_34985 ) ) ( not ( = ?auto_34984 ?auto_34986 ) ) ( not ( = ?auto_34984 ?auto_34987 ) ) ( not ( = ?auto_34985 ?auto_34986 ) ) ( not ( = ?auto_34985 ?auto_34987 ) ) ( not ( = ?auto_34986 ?auto_34987 ) ) ( ON-TABLE ?auto_34987 ) ( ON ?auto_34986 ?auto_34987 ) ( CLEAR ?auto_34986 ) ( HOLDING ?auto_34985 ) ( CLEAR ?auto_34984 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_34983 ?auto_34984 ?auto_34985 )
      ( MAKE-5PILE ?auto_34983 ?auto_34984 ?auto_34985 ?auto_34986 ?auto_34987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34988 - BLOCK
      ?auto_34989 - BLOCK
      ?auto_34990 - BLOCK
      ?auto_34991 - BLOCK
      ?auto_34992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34988 ) ( ON ?auto_34989 ?auto_34988 ) ( not ( = ?auto_34988 ?auto_34989 ) ) ( not ( = ?auto_34988 ?auto_34990 ) ) ( not ( = ?auto_34988 ?auto_34991 ) ) ( not ( = ?auto_34988 ?auto_34992 ) ) ( not ( = ?auto_34989 ?auto_34990 ) ) ( not ( = ?auto_34989 ?auto_34991 ) ) ( not ( = ?auto_34989 ?auto_34992 ) ) ( not ( = ?auto_34990 ?auto_34991 ) ) ( not ( = ?auto_34990 ?auto_34992 ) ) ( not ( = ?auto_34991 ?auto_34992 ) ) ( ON-TABLE ?auto_34992 ) ( ON ?auto_34991 ?auto_34992 ) ( CLEAR ?auto_34989 ) ( ON ?auto_34990 ?auto_34991 ) ( CLEAR ?auto_34990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34992 ?auto_34991 )
      ( MAKE-5PILE ?auto_34988 ?auto_34989 ?auto_34990 ?auto_34991 ?auto_34992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34993 - BLOCK
      ?auto_34994 - BLOCK
      ?auto_34995 - BLOCK
      ?auto_34996 - BLOCK
      ?auto_34997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34993 ) ( not ( = ?auto_34993 ?auto_34994 ) ) ( not ( = ?auto_34993 ?auto_34995 ) ) ( not ( = ?auto_34993 ?auto_34996 ) ) ( not ( = ?auto_34993 ?auto_34997 ) ) ( not ( = ?auto_34994 ?auto_34995 ) ) ( not ( = ?auto_34994 ?auto_34996 ) ) ( not ( = ?auto_34994 ?auto_34997 ) ) ( not ( = ?auto_34995 ?auto_34996 ) ) ( not ( = ?auto_34995 ?auto_34997 ) ) ( not ( = ?auto_34996 ?auto_34997 ) ) ( ON-TABLE ?auto_34997 ) ( ON ?auto_34996 ?auto_34997 ) ( ON ?auto_34995 ?auto_34996 ) ( CLEAR ?auto_34995 ) ( HOLDING ?auto_34994 ) ( CLEAR ?auto_34993 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_34993 ?auto_34994 )
      ( MAKE-5PILE ?auto_34993 ?auto_34994 ?auto_34995 ?auto_34996 ?auto_34997 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_34998 - BLOCK
      ?auto_34999 - BLOCK
      ?auto_35000 - BLOCK
      ?auto_35001 - BLOCK
      ?auto_35002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_34998 ) ( not ( = ?auto_34998 ?auto_34999 ) ) ( not ( = ?auto_34998 ?auto_35000 ) ) ( not ( = ?auto_34998 ?auto_35001 ) ) ( not ( = ?auto_34998 ?auto_35002 ) ) ( not ( = ?auto_34999 ?auto_35000 ) ) ( not ( = ?auto_34999 ?auto_35001 ) ) ( not ( = ?auto_34999 ?auto_35002 ) ) ( not ( = ?auto_35000 ?auto_35001 ) ) ( not ( = ?auto_35000 ?auto_35002 ) ) ( not ( = ?auto_35001 ?auto_35002 ) ) ( ON-TABLE ?auto_35002 ) ( ON ?auto_35001 ?auto_35002 ) ( ON ?auto_35000 ?auto_35001 ) ( CLEAR ?auto_34998 ) ( ON ?auto_34999 ?auto_35000 ) ( CLEAR ?auto_34999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35002 ?auto_35001 ?auto_35000 )
      ( MAKE-5PILE ?auto_34998 ?auto_34999 ?auto_35000 ?auto_35001 ?auto_35002 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35003 - BLOCK
      ?auto_35004 - BLOCK
      ?auto_35005 - BLOCK
      ?auto_35006 - BLOCK
      ?auto_35007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35003 ?auto_35004 ) ) ( not ( = ?auto_35003 ?auto_35005 ) ) ( not ( = ?auto_35003 ?auto_35006 ) ) ( not ( = ?auto_35003 ?auto_35007 ) ) ( not ( = ?auto_35004 ?auto_35005 ) ) ( not ( = ?auto_35004 ?auto_35006 ) ) ( not ( = ?auto_35004 ?auto_35007 ) ) ( not ( = ?auto_35005 ?auto_35006 ) ) ( not ( = ?auto_35005 ?auto_35007 ) ) ( not ( = ?auto_35006 ?auto_35007 ) ) ( ON-TABLE ?auto_35007 ) ( ON ?auto_35006 ?auto_35007 ) ( ON ?auto_35005 ?auto_35006 ) ( ON ?auto_35004 ?auto_35005 ) ( CLEAR ?auto_35004 ) ( HOLDING ?auto_35003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35003 )
      ( MAKE-5PILE ?auto_35003 ?auto_35004 ?auto_35005 ?auto_35006 ?auto_35007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35008 - BLOCK
      ?auto_35009 - BLOCK
      ?auto_35010 - BLOCK
      ?auto_35011 - BLOCK
      ?auto_35012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35008 ?auto_35009 ) ) ( not ( = ?auto_35008 ?auto_35010 ) ) ( not ( = ?auto_35008 ?auto_35011 ) ) ( not ( = ?auto_35008 ?auto_35012 ) ) ( not ( = ?auto_35009 ?auto_35010 ) ) ( not ( = ?auto_35009 ?auto_35011 ) ) ( not ( = ?auto_35009 ?auto_35012 ) ) ( not ( = ?auto_35010 ?auto_35011 ) ) ( not ( = ?auto_35010 ?auto_35012 ) ) ( not ( = ?auto_35011 ?auto_35012 ) ) ( ON-TABLE ?auto_35012 ) ( ON ?auto_35011 ?auto_35012 ) ( ON ?auto_35010 ?auto_35011 ) ( ON ?auto_35009 ?auto_35010 ) ( ON ?auto_35008 ?auto_35009 ) ( CLEAR ?auto_35008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35012 ?auto_35011 ?auto_35010 ?auto_35009 )
      ( MAKE-5PILE ?auto_35008 ?auto_35009 ?auto_35010 ?auto_35011 ?auto_35012 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35013 - BLOCK
      ?auto_35014 - BLOCK
      ?auto_35015 - BLOCK
      ?auto_35016 - BLOCK
      ?auto_35017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35013 ?auto_35014 ) ) ( not ( = ?auto_35013 ?auto_35015 ) ) ( not ( = ?auto_35013 ?auto_35016 ) ) ( not ( = ?auto_35013 ?auto_35017 ) ) ( not ( = ?auto_35014 ?auto_35015 ) ) ( not ( = ?auto_35014 ?auto_35016 ) ) ( not ( = ?auto_35014 ?auto_35017 ) ) ( not ( = ?auto_35015 ?auto_35016 ) ) ( not ( = ?auto_35015 ?auto_35017 ) ) ( not ( = ?auto_35016 ?auto_35017 ) ) ( ON-TABLE ?auto_35017 ) ( ON ?auto_35016 ?auto_35017 ) ( ON ?auto_35015 ?auto_35016 ) ( ON ?auto_35014 ?auto_35015 ) ( HOLDING ?auto_35013 ) ( CLEAR ?auto_35014 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35017 ?auto_35016 ?auto_35015 ?auto_35014 ?auto_35013 )
      ( MAKE-5PILE ?auto_35013 ?auto_35014 ?auto_35015 ?auto_35016 ?auto_35017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35018 - BLOCK
      ?auto_35019 - BLOCK
      ?auto_35020 - BLOCK
      ?auto_35021 - BLOCK
      ?auto_35022 - BLOCK
    )
    :vars
    (
      ?auto_35023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35018 ?auto_35019 ) ) ( not ( = ?auto_35018 ?auto_35020 ) ) ( not ( = ?auto_35018 ?auto_35021 ) ) ( not ( = ?auto_35018 ?auto_35022 ) ) ( not ( = ?auto_35019 ?auto_35020 ) ) ( not ( = ?auto_35019 ?auto_35021 ) ) ( not ( = ?auto_35019 ?auto_35022 ) ) ( not ( = ?auto_35020 ?auto_35021 ) ) ( not ( = ?auto_35020 ?auto_35022 ) ) ( not ( = ?auto_35021 ?auto_35022 ) ) ( ON-TABLE ?auto_35022 ) ( ON ?auto_35021 ?auto_35022 ) ( ON ?auto_35020 ?auto_35021 ) ( ON ?auto_35019 ?auto_35020 ) ( CLEAR ?auto_35019 ) ( ON ?auto_35018 ?auto_35023 ) ( CLEAR ?auto_35018 ) ( HAND-EMPTY ) ( not ( = ?auto_35018 ?auto_35023 ) ) ( not ( = ?auto_35019 ?auto_35023 ) ) ( not ( = ?auto_35020 ?auto_35023 ) ) ( not ( = ?auto_35021 ?auto_35023 ) ) ( not ( = ?auto_35022 ?auto_35023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_35018 ?auto_35023 )
      ( MAKE-5PILE ?auto_35018 ?auto_35019 ?auto_35020 ?auto_35021 ?auto_35022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35024 - BLOCK
      ?auto_35025 - BLOCK
      ?auto_35026 - BLOCK
      ?auto_35027 - BLOCK
      ?auto_35028 - BLOCK
    )
    :vars
    (
      ?auto_35029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35024 ?auto_35025 ) ) ( not ( = ?auto_35024 ?auto_35026 ) ) ( not ( = ?auto_35024 ?auto_35027 ) ) ( not ( = ?auto_35024 ?auto_35028 ) ) ( not ( = ?auto_35025 ?auto_35026 ) ) ( not ( = ?auto_35025 ?auto_35027 ) ) ( not ( = ?auto_35025 ?auto_35028 ) ) ( not ( = ?auto_35026 ?auto_35027 ) ) ( not ( = ?auto_35026 ?auto_35028 ) ) ( not ( = ?auto_35027 ?auto_35028 ) ) ( ON-TABLE ?auto_35028 ) ( ON ?auto_35027 ?auto_35028 ) ( ON ?auto_35026 ?auto_35027 ) ( ON ?auto_35024 ?auto_35029 ) ( CLEAR ?auto_35024 ) ( not ( = ?auto_35024 ?auto_35029 ) ) ( not ( = ?auto_35025 ?auto_35029 ) ) ( not ( = ?auto_35026 ?auto_35029 ) ) ( not ( = ?auto_35027 ?auto_35029 ) ) ( not ( = ?auto_35028 ?auto_35029 ) ) ( HOLDING ?auto_35025 ) ( CLEAR ?auto_35026 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35028 ?auto_35027 ?auto_35026 ?auto_35025 )
      ( MAKE-5PILE ?auto_35024 ?auto_35025 ?auto_35026 ?auto_35027 ?auto_35028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35030 - BLOCK
      ?auto_35031 - BLOCK
      ?auto_35032 - BLOCK
      ?auto_35033 - BLOCK
      ?auto_35034 - BLOCK
    )
    :vars
    (
      ?auto_35035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35030 ?auto_35031 ) ) ( not ( = ?auto_35030 ?auto_35032 ) ) ( not ( = ?auto_35030 ?auto_35033 ) ) ( not ( = ?auto_35030 ?auto_35034 ) ) ( not ( = ?auto_35031 ?auto_35032 ) ) ( not ( = ?auto_35031 ?auto_35033 ) ) ( not ( = ?auto_35031 ?auto_35034 ) ) ( not ( = ?auto_35032 ?auto_35033 ) ) ( not ( = ?auto_35032 ?auto_35034 ) ) ( not ( = ?auto_35033 ?auto_35034 ) ) ( ON-TABLE ?auto_35034 ) ( ON ?auto_35033 ?auto_35034 ) ( ON ?auto_35032 ?auto_35033 ) ( ON ?auto_35030 ?auto_35035 ) ( not ( = ?auto_35030 ?auto_35035 ) ) ( not ( = ?auto_35031 ?auto_35035 ) ) ( not ( = ?auto_35032 ?auto_35035 ) ) ( not ( = ?auto_35033 ?auto_35035 ) ) ( not ( = ?auto_35034 ?auto_35035 ) ) ( CLEAR ?auto_35032 ) ( ON ?auto_35031 ?auto_35030 ) ( CLEAR ?auto_35031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_35035 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35035 ?auto_35030 )
      ( MAKE-5PILE ?auto_35030 ?auto_35031 ?auto_35032 ?auto_35033 ?auto_35034 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35036 - BLOCK
      ?auto_35037 - BLOCK
      ?auto_35038 - BLOCK
      ?auto_35039 - BLOCK
      ?auto_35040 - BLOCK
    )
    :vars
    (
      ?auto_35041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35036 ?auto_35037 ) ) ( not ( = ?auto_35036 ?auto_35038 ) ) ( not ( = ?auto_35036 ?auto_35039 ) ) ( not ( = ?auto_35036 ?auto_35040 ) ) ( not ( = ?auto_35037 ?auto_35038 ) ) ( not ( = ?auto_35037 ?auto_35039 ) ) ( not ( = ?auto_35037 ?auto_35040 ) ) ( not ( = ?auto_35038 ?auto_35039 ) ) ( not ( = ?auto_35038 ?auto_35040 ) ) ( not ( = ?auto_35039 ?auto_35040 ) ) ( ON-TABLE ?auto_35040 ) ( ON ?auto_35039 ?auto_35040 ) ( ON ?auto_35036 ?auto_35041 ) ( not ( = ?auto_35036 ?auto_35041 ) ) ( not ( = ?auto_35037 ?auto_35041 ) ) ( not ( = ?auto_35038 ?auto_35041 ) ) ( not ( = ?auto_35039 ?auto_35041 ) ) ( not ( = ?auto_35040 ?auto_35041 ) ) ( ON ?auto_35037 ?auto_35036 ) ( CLEAR ?auto_35037 ) ( ON-TABLE ?auto_35041 ) ( HOLDING ?auto_35038 ) ( CLEAR ?auto_35039 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35040 ?auto_35039 ?auto_35038 )
      ( MAKE-5PILE ?auto_35036 ?auto_35037 ?auto_35038 ?auto_35039 ?auto_35040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35042 - BLOCK
      ?auto_35043 - BLOCK
      ?auto_35044 - BLOCK
      ?auto_35045 - BLOCK
      ?auto_35046 - BLOCK
    )
    :vars
    (
      ?auto_35047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35042 ?auto_35043 ) ) ( not ( = ?auto_35042 ?auto_35044 ) ) ( not ( = ?auto_35042 ?auto_35045 ) ) ( not ( = ?auto_35042 ?auto_35046 ) ) ( not ( = ?auto_35043 ?auto_35044 ) ) ( not ( = ?auto_35043 ?auto_35045 ) ) ( not ( = ?auto_35043 ?auto_35046 ) ) ( not ( = ?auto_35044 ?auto_35045 ) ) ( not ( = ?auto_35044 ?auto_35046 ) ) ( not ( = ?auto_35045 ?auto_35046 ) ) ( ON-TABLE ?auto_35046 ) ( ON ?auto_35045 ?auto_35046 ) ( ON ?auto_35042 ?auto_35047 ) ( not ( = ?auto_35042 ?auto_35047 ) ) ( not ( = ?auto_35043 ?auto_35047 ) ) ( not ( = ?auto_35044 ?auto_35047 ) ) ( not ( = ?auto_35045 ?auto_35047 ) ) ( not ( = ?auto_35046 ?auto_35047 ) ) ( ON ?auto_35043 ?auto_35042 ) ( ON-TABLE ?auto_35047 ) ( CLEAR ?auto_35045 ) ( ON ?auto_35044 ?auto_35043 ) ( CLEAR ?auto_35044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_35047 ?auto_35042 ?auto_35043 )
      ( MAKE-5PILE ?auto_35042 ?auto_35043 ?auto_35044 ?auto_35045 ?auto_35046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35048 - BLOCK
      ?auto_35049 - BLOCK
      ?auto_35050 - BLOCK
      ?auto_35051 - BLOCK
      ?auto_35052 - BLOCK
    )
    :vars
    (
      ?auto_35053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35048 ?auto_35049 ) ) ( not ( = ?auto_35048 ?auto_35050 ) ) ( not ( = ?auto_35048 ?auto_35051 ) ) ( not ( = ?auto_35048 ?auto_35052 ) ) ( not ( = ?auto_35049 ?auto_35050 ) ) ( not ( = ?auto_35049 ?auto_35051 ) ) ( not ( = ?auto_35049 ?auto_35052 ) ) ( not ( = ?auto_35050 ?auto_35051 ) ) ( not ( = ?auto_35050 ?auto_35052 ) ) ( not ( = ?auto_35051 ?auto_35052 ) ) ( ON-TABLE ?auto_35052 ) ( ON ?auto_35048 ?auto_35053 ) ( not ( = ?auto_35048 ?auto_35053 ) ) ( not ( = ?auto_35049 ?auto_35053 ) ) ( not ( = ?auto_35050 ?auto_35053 ) ) ( not ( = ?auto_35051 ?auto_35053 ) ) ( not ( = ?auto_35052 ?auto_35053 ) ) ( ON ?auto_35049 ?auto_35048 ) ( ON-TABLE ?auto_35053 ) ( ON ?auto_35050 ?auto_35049 ) ( CLEAR ?auto_35050 ) ( HOLDING ?auto_35051 ) ( CLEAR ?auto_35052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_35052 ?auto_35051 )
      ( MAKE-5PILE ?auto_35048 ?auto_35049 ?auto_35050 ?auto_35051 ?auto_35052 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35054 - BLOCK
      ?auto_35055 - BLOCK
      ?auto_35056 - BLOCK
      ?auto_35057 - BLOCK
      ?auto_35058 - BLOCK
    )
    :vars
    (
      ?auto_35059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35054 ?auto_35055 ) ) ( not ( = ?auto_35054 ?auto_35056 ) ) ( not ( = ?auto_35054 ?auto_35057 ) ) ( not ( = ?auto_35054 ?auto_35058 ) ) ( not ( = ?auto_35055 ?auto_35056 ) ) ( not ( = ?auto_35055 ?auto_35057 ) ) ( not ( = ?auto_35055 ?auto_35058 ) ) ( not ( = ?auto_35056 ?auto_35057 ) ) ( not ( = ?auto_35056 ?auto_35058 ) ) ( not ( = ?auto_35057 ?auto_35058 ) ) ( ON-TABLE ?auto_35058 ) ( ON ?auto_35054 ?auto_35059 ) ( not ( = ?auto_35054 ?auto_35059 ) ) ( not ( = ?auto_35055 ?auto_35059 ) ) ( not ( = ?auto_35056 ?auto_35059 ) ) ( not ( = ?auto_35057 ?auto_35059 ) ) ( not ( = ?auto_35058 ?auto_35059 ) ) ( ON ?auto_35055 ?auto_35054 ) ( ON-TABLE ?auto_35059 ) ( ON ?auto_35056 ?auto_35055 ) ( CLEAR ?auto_35058 ) ( ON ?auto_35057 ?auto_35056 ) ( CLEAR ?auto_35057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_35059 ?auto_35054 ?auto_35055 ?auto_35056 )
      ( MAKE-5PILE ?auto_35054 ?auto_35055 ?auto_35056 ?auto_35057 ?auto_35058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35060 - BLOCK
      ?auto_35061 - BLOCK
      ?auto_35062 - BLOCK
      ?auto_35063 - BLOCK
      ?auto_35064 - BLOCK
    )
    :vars
    (
      ?auto_35065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35060 ?auto_35061 ) ) ( not ( = ?auto_35060 ?auto_35062 ) ) ( not ( = ?auto_35060 ?auto_35063 ) ) ( not ( = ?auto_35060 ?auto_35064 ) ) ( not ( = ?auto_35061 ?auto_35062 ) ) ( not ( = ?auto_35061 ?auto_35063 ) ) ( not ( = ?auto_35061 ?auto_35064 ) ) ( not ( = ?auto_35062 ?auto_35063 ) ) ( not ( = ?auto_35062 ?auto_35064 ) ) ( not ( = ?auto_35063 ?auto_35064 ) ) ( ON ?auto_35060 ?auto_35065 ) ( not ( = ?auto_35060 ?auto_35065 ) ) ( not ( = ?auto_35061 ?auto_35065 ) ) ( not ( = ?auto_35062 ?auto_35065 ) ) ( not ( = ?auto_35063 ?auto_35065 ) ) ( not ( = ?auto_35064 ?auto_35065 ) ) ( ON ?auto_35061 ?auto_35060 ) ( ON-TABLE ?auto_35065 ) ( ON ?auto_35062 ?auto_35061 ) ( ON ?auto_35063 ?auto_35062 ) ( CLEAR ?auto_35063 ) ( HOLDING ?auto_35064 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_35064 )
      ( MAKE-5PILE ?auto_35060 ?auto_35061 ?auto_35062 ?auto_35063 ?auto_35064 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_35066 - BLOCK
      ?auto_35067 - BLOCK
      ?auto_35068 - BLOCK
      ?auto_35069 - BLOCK
      ?auto_35070 - BLOCK
    )
    :vars
    (
      ?auto_35071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_35066 ?auto_35067 ) ) ( not ( = ?auto_35066 ?auto_35068 ) ) ( not ( = ?auto_35066 ?auto_35069 ) ) ( not ( = ?auto_35066 ?auto_35070 ) ) ( not ( = ?auto_35067 ?auto_35068 ) ) ( not ( = ?auto_35067 ?auto_35069 ) ) ( not ( = ?auto_35067 ?auto_35070 ) ) ( not ( = ?auto_35068 ?auto_35069 ) ) ( not ( = ?auto_35068 ?auto_35070 ) ) ( not ( = ?auto_35069 ?auto_35070 ) ) ( ON ?auto_35066 ?auto_35071 ) ( not ( = ?auto_35066 ?auto_35071 ) ) ( not ( = ?auto_35067 ?auto_35071 ) ) ( not ( = ?auto_35068 ?auto_35071 ) ) ( not ( = ?auto_35069 ?auto_35071 ) ) ( not ( = ?auto_35070 ?auto_35071 ) ) ( ON ?auto_35067 ?auto_35066 ) ( ON-TABLE ?auto_35071 ) ( ON ?auto_35068 ?auto_35067 ) ( ON ?auto_35069 ?auto_35068 ) ( ON ?auto_35070 ?auto_35069 ) ( CLEAR ?auto_35070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_35071 ?auto_35066 ?auto_35067 ?auto_35068 ?auto_35069 )
      ( MAKE-5PILE ?auto_35066 ?auto_35067 ?auto_35068 ?auto_35069 ?auto_35070 ) )
  )

)

