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
      ?auto_43004 - BLOCK
      ?auto_43005 - BLOCK
      ?auto_43006 - BLOCK
      ?auto_43007 - BLOCK
      ?auto_43008 - BLOCK
      ?auto_43009 - BLOCK
    )
    :vars
    (
      ?auto_43010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43010 ?auto_43009 ) ( CLEAR ?auto_43010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43004 ) ( ON ?auto_43005 ?auto_43004 ) ( ON ?auto_43006 ?auto_43005 ) ( ON ?auto_43007 ?auto_43006 ) ( ON ?auto_43008 ?auto_43007 ) ( ON ?auto_43009 ?auto_43008 ) ( not ( = ?auto_43004 ?auto_43005 ) ) ( not ( = ?auto_43004 ?auto_43006 ) ) ( not ( = ?auto_43004 ?auto_43007 ) ) ( not ( = ?auto_43004 ?auto_43008 ) ) ( not ( = ?auto_43004 ?auto_43009 ) ) ( not ( = ?auto_43004 ?auto_43010 ) ) ( not ( = ?auto_43005 ?auto_43006 ) ) ( not ( = ?auto_43005 ?auto_43007 ) ) ( not ( = ?auto_43005 ?auto_43008 ) ) ( not ( = ?auto_43005 ?auto_43009 ) ) ( not ( = ?auto_43005 ?auto_43010 ) ) ( not ( = ?auto_43006 ?auto_43007 ) ) ( not ( = ?auto_43006 ?auto_43008 ) ) ( not ( = ?auto_43006 ?auto_43009 ) ) ( not ( = ?auto_43006 ?auto_43010 ) ) ( not ( = ?auto_43007 ?auto_43008 ) ) ( not ( = ?auto_43007 ?auto_43009 ) ) ( not ( = ?auto_43007 ?auto_43010 ) ) ( not ( = ?auto_43008 ?auto_43009 ) ) ( not ( = ?auto_43008 ?auto_43010 ) ) ( not ( = ?auto_43009 ?auto_43010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43010 ?auto_43009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43012 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43012 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_43012 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43013 - BLOCK
    )
    :vars
    (
      ?auto_43014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43013 ?auto_43014 ) ( CLEAR ?auto_43013 ) ( HAND-EMPTY ) ( not ( = ?auto_43013 ?auto_43014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43013 ?auto_43014 )
      ( MAKE-1PILE ?auto_43013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43020 - BLOCK
      ?auto_43021 - BLOCK
      ?auto_43022 - BLOCK
      ?auto_43023 - BLOCK
      ?auto_43024 - BLOCK
    )
    :vars
    (
      ?auto_43025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43025 ?auto_43024 ) ( CLEAR ?auto_43025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43020 ) ( ON ?auto_43021 ?auto_43020 ) ( ON ?auto_43022 ?auto_43021 ) ( ON ?auto_43023 ?auto_43022 ) ( ON ?auto_43024 ?auto_43023 ) ( not ( = ?auto_43020 ?auto_43021 ) ) ( not ( = ?auto_43020 ?auto_43022 ) ) ( not ( = ?auto_43020 ?auto_43023 ) ) ( not ( = ?auto_43020 ?auto_43024 ) ) ( not ( = ?auto_43020 ?auto_43025 ) ) ( not ( = ?auto_43021 ?auto_43022 ) ) ( not ( = ?auto_43021 ?auto_43023 ) ) ( not ( = ?auto_43021 ?auto_43024 ) ) ( not ( = ?auto_43021 ?auto_43025 ) ) ( not ( = ?auto_43022 ?auto_43023 ) ) ( not ( = ?auto_43022 ?auto_43024 ) ) ( not ( = ?auto_43022 ?auto_43025 ) ) ( not ( = ?auto_43023 ?auto_43024 ) ) ( not ( = ?auto_43023 ?auto_43025 ) ) ( not ( = ?auto_43024 ?auto_43025 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43025 ?auto_43024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43026 - BLOCK
      ?auto_43027 - BLOCK
      ?auto_43028 - BLOCK
      ?auto_43029 - BLOCK
      ?auto_43030 - BLOCK
    )
    :vars
    (
      ?auto_43031 - BLOCK
      ?auto_43032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43031 ?auto_43030 ) ( CLEAR ?auto_43031 ) ( ON-TABLE ?auto_43026 ) ( ON ?auto_43027 ?auto_43026 ) ( ON ?auto_43028 ?auto_43027 ) ( ON ?auto_43029 ?auto_43028 ) ( ON ?auto_43030 ?auto_43029 ) ( not ( = ?auto_43026 ?auto_43027 ) ) ( not ( = ?auto_43026 ?auto_43028 ) ) ( not ( = ?auto_43026 ?auto_43029 ) ) ( not ( = ?auto_43026 ?auto_43030 ) ) ( not ( = ?auto_43026 ?auto_43031 ) ) ( not ( = ?auto_43027 ?auto_43028 ) ) ( not ( = ?auto_43027 ?auto_43029 ) ) ( not ( = ?auto_43027 ?auto_43030 ) ) ( not ( = ?auto_43027 ?auto_43031 ) ) ( not ( = ?auto_43028 ?auto_43029 ) ) ( not ( = ?auto_43028 ?auto_43030 ) ) ( not ( = ?auto_43028 ?auto_43031 ) ) ( not ( = ?auto_43029 ?auto_43030 ) ) ( not ( = ?auto_43029 ?auto_43031 ) ) ( not ( = ?auto_43030 ?auto_43031 ) ) ( HOLDING ?auto_43032 ) ( not ( = ?auto_43026 ?auto_43032 ) ) ( not ( = ?auto_43027 ?auto_43032 ) ) ( not ( = ?auto_43028 ?auto_43032 ) ) ( not ( = ?auto_43029 ?auto_43032 ) ) ( not ( = ?auto_43030 ?auto_43032 ) ) ( not ( = ?auto_43031 ?auto_43032 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_43032 )
      ( MAKE-5PILE ?auto_43026 ?auto_43027 ?auto_43028 ?auto_43029 ?auto_43030 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43033 - BLOCK
      ?auto_43034 - BLOCK
      ?auto_43035 - BLOCK
      ?auto_43036 - BLOCK
      ?auto_43037 - BLOCK
    )
    :vars
    (
      ?auto_43039 - BLOCK
      ?auto_43038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43039 ?auto_43037 ) ( ON-TABLE ?auto_43033 ) ( ON ?auto_43034 ?auto_43033 ) ( ON ?auto_43035 ?auto_43034 ) ( ON ?auto_43036 ?auto_43035 ) ( ON ?auto_43037 ?auto_43036 ) ( not ( = ?auto_43033 ?auto_43034 ) ) ( not ( = ?auto_43033 ?auto_43035 ) ) ( not ( = ?auto_43033 ?auto_43036 ) ) ( not ( = ?auto_43033 ?auto_43037 ) ) ( not ( = ?auto_43033 ?auto_43039 ) ) ( not ( = ?auto_43034 ?auto_43035 ) ) ( not ( = ?auto_43034 ?auto_43036 ) ) ( not ( = ?auto_43034 ?auto_43037 ) ) ( not ( = ?auto_43034 ?auto_43039 ) ) ( not ( = ?auto_43035 ?auto_43036 ) ) ( not ( = ?auto_43035 ?auto_43037 ) ) ( not ( = ?auto_43035 ?auto_43039 ) ) ( not ( = ?auto_43036 ?auto_43037 ) ) ( not ( = ?auto_43036 ?auto_43039 ) ) ( not ( = ?auto_43037 ?auto_43039 ) ) ( not ( = ?auto_43033 ?auto_43038 ) ) ( not ( = ?auto_43034 ?auto_43038 ) ) ( not ( = ?auto_43035 ?auto_43038 ) ) ( not ( = ?auto_43036 ?auto_43038 ) ) ( not ( = ?auto_43037 ?auto_43038 ) ) ( not ( = ?auto_43039 ?auto_43038 ) ) ( ON ?auto_43038 ?auto_43039 ) ( CLEAR ?auto_43038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43033 ?auto_43034 ?auto_43035 ?auto_43036 ?auto_43037 ?auto_43039 )
      ( MAKE-5PILE ?auto_43033 ?auto_43034 ?auto_43035 ?auto_43036 ?auto_43037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43042 - BLOCK
      ?auto_43043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43043 ) ( CLEAR ?auto_43042 ) ( ON-TABLE ?auto_43042 ) ( not ( = ?auto_43042 ?auto_43043 ) ) )
    :subtasks
    ( ( !STACK ?auto_43043 ?auto_43042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43044 - BLOCK
      ?auto_43045 - BLOCK
    )
    :vars
    (
      ?auto_43046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43044 ) ( ON-TABLE ?auto_43044 ) ( not ( = ?auto_43044 ?auto_43045 ) ) ( ON ?auto_43045 ?auto_43046 ) ( CLEAR ?auto_43045 ) ( HAND-EMPTY ) ( not ( = ?auto_43044 ?auto_43046 ) ) ( not ( = ?auto_43045 ?auto_43046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43045 ?auto_43046 )
      ( MAKE-2PILE ?auto_43044 ?auto_43045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43047 - BLOCK
      ?auto_43048 - BLOCK
    )
    :vars
    (
      ?auto_43049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43047 ?auto_43048 ) ) ( ON ?auto_43048 ?auto_43049 ) ( CLEAR ?auto_43048 ) ( not ( = ?auto_43047 ?auto_43049 ) ) ( not ( = ?auto_43048 ?auto_43049 ) ) ( HOLDING ?auto_43047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43047 )
      ( MAKE-2PILE ?auto_43047 ?auto_43048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43050 - BLOCK
      ?auto_43051 - BLOCK
    )
    :vars
    (
      ?auto_43052 - BLOCK
      ?auto_43054 - BLOCK
      ?auto_43056 - BLOCK
      ?auto_43053 - BLOCK
      ?auto_43055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43050 ?auto_43051 ) ) ( ON ?auto_43051 ?auto_43052 ) ( not ( = ?auto_43050 ?auto_43052 ) ) ( not ( = ?auto_43051 ?auto_43052 ) ) ( ON ?auto_43050 ?auto_43051 ) ( CLEAR ?auto_43050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43054 ) ( ON ?auto_43056 ?auto_43054 ) ( ON ?auto_43053 ?auto_43056 ) ( ON ?auto_43055 ?auto_43053 ) ( ON ?auto_43052 ?auto_43055 ) ( not ( = ?auto_43054 ?auto_43056 ) ) ( not ( = ?auto_43054 ?auto_43053 ) ) ( not ( = ?auto_43054 ?auto_43055 ) ) ( not ( = ?auto_43054 ?auto_43052 ) ) ( not ( = ?auto_43054 ?auto_43051 ) ) ( not ( = ?auto_43054 ?auto_43050 ) ) ( not ( = ?auto_43056 ?auto_43053 ) ) ( not ( = ?auto_43056 ?auto_43055 ) ) ( not ( = ?auto_43056 ?auto_43052 ) ) ( not ( = ?auto_43056 ?auto_43051 ) ) ( not ( = ?auto_43056 ?auto_43050 ) ) ( not ( = ?auto_43053 ?auto_43055 ) ) ( not ( = ?auto_43053 ?auto_43052 ) ) ( not ( = ?auto_43053 ?auto_43051 ) ) ( not ( = ?auto_43053 ?auto_43050 ) ) ( not ( = ?auto_43055 ?auto_43052 ) ) ( not ( = ?auto_43055 ?auto_43051 ) ) ( not ( = ?auto_43055 ?auto_43050 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43054 ?auto_43056 ?auto_43053 ?auto_43055 ?auto_43052 ?auto_43051 )
      ( MAKE-2PILE ?auto_43050 ?auto_43051 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43061 - BLOCK
      ?auto_43062 - BLOCK
      ?auto_43063 - BLOCK
      ?auto_43064 - BLOCK
    )
    :vars
    (
      ?auto_43065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43065 ?auto_43064 ) ( CLEAR ?auto_43065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43061 ) ( ON ?auto_43062 ?auto_43061 ) ( ON ?auto_43063 ?auto_43062 ) ( ON ?auto_43064 ?auto_43063 ) ( not ( = ?auto_43061 ?auto_43062 ) ) ( not ( = ?auto_43061 ?auto_43063 ) ) ( not ( = ?auto_43061 ?auto_43064 ) ) ( not ( = ?auto_43061 ?auto_43065 ) ) ( not ( = ?auto_43062 ?auto_43063 ) ) ( not ( = ?auto_43062 ?auto_43064 ) ) ( not ( = ?auto_43062 ?auto_43065 ) ) ( not ( = ?auto_43063 ?auto_43064 ) ) ( not ( = ?auto_43063 ?auto_43065 ) ) ( not ( = ?auto_43064 ?auto_43065 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43065 ?auto_43064 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43066 - BLOCK
      ?auto_43067 - BLOCK
      ?auto_43068 - BLOCK
      ?auto_43069 - BLOCK
    )
    :vars
    (
      ?auto_43070 - BLOCK
      ?auto_43071 - BLOCK
      ?auto_43072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43070 ?auto_43069 ) ( CLEAR ?auto_43070 ) ( ON-TABLE ?auto_43066 ) ( ON ?auto_43067 ?auto_43066 ) ( ON ?auto_43068 ?auto_43067 ) ( ON ?auto_43069 ?auto_43068 ) ( not ( = ?auto_43066 ?auto_43067 ) ) ( not ( = ?auto_43066 ?auto_43068 ) ) ( not ( = ?auto_43066 ?auto_43069 ) ) ( not ( = ?auto_43066 ?auto_43070 ) ) ( not ( = ?auto_43067 ?auto_43068 ) ) ( not ( = ?auto_43067 ?auto_43069 ) ) ( not ( = ?auto_43067 ?auto_43070 ) ) ( not ( = ?auto_43068 ?auto_43069 ) ) ( not ( = ?auto_43068 ?auto_43070 ) ) ( not ( = ?auto_43069 ?auto_43070 ) ) ( HOLDING ?auto_43071 ) ( CLEAR ?auto_43072 ) ( not ( = ?auto_43066 ?auto_43071 ) ) ( not ( = ?auto_43066 ?auto_43072 ) ) ( not ( = ?auto_43067 ?auto_43071 ) ) ( not ( = ?auto_43067 ?auto_43072 ) ) ( not ( = ?auto_43068 ?auto_43071 ) ) ( not ( = ?auto_43068 ?auto_43072 ) ) ( not ( = ?auto_43069 ?auto_43071 ) ) ( not ( = ?auto_43069 ?auto_43072 ) ) ( not ( = ?auto_43070 ?auto_43071 ) ) ( not ( = ?auto_43070 ?auto_43072 ) ) ( not ( = ?auto_43071 ?auto_43072 ) ) )
    :subtasks
    ( ( !STACK ?auto_43071 ?auto_43072 )
      ( MAKE-4PILE ?auto_43066 ?auto_43067 ?auto_43068 ?auto_43069 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43073 - BLOCK
      ?auto_43074 - BLOCK
      ?auto_43075 - BLOCK
      ?auto_43076 - BLOCK
    )
    :vars
    (
      ?auto_43078 - BLOCK
      ?auto_43077 - BLOCK
      ?auto_43079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43078 ?auto_43076 ) ( ON-TABLE ?auto_43073 ) ( ON ?auto_43074 ?auto_43073 ) ( ON ?auto_43075 ?auto_43074 ) ( ON ?auto_43076 ?auto_43075 ) ( not ( = ?auto_43073 ?auto_43074 ) ) ( not ( = ?auto_43073 ?auto_43075 ) ) ( not ( = ?auto_43073 ?auto_43076 ) ) ( not ( = ?auto_43073 ?auto_43078 ) ) ( not ( = ?auto_43074 ?auto_43075 ) ) ( not ( = ?auto_43074 ?auto_43076 ) ) ( not ( = ?auto_43074 ?auto_43078 ) ) ( not ( = ?auto_43075 ?auto_43076 ) ) ( not ( = ?auto_43075 ?auto_43078 ) ) ( not ( = ?auto_43076 ?auto_43078 ) ) ( CLEAR ?auto_43077 ) ( not ( = ?auto_43073 ?auto_43079 ) ) ( not ( = ?auto_43073 ?auto_43077 ) ) ( not ( = ?auto_43074 ?auto_43079 ) ) ( not ( = ?auto_43074 ?auto_43077 ) ) ( not ( = ?auto_43075 ?auto_43079 ) ) ( not ( = ?auto_43075 ?auto_43077 ) ) ( not ( = ?auto_43076 ?auto_43079 ) ) ( not ( = ?auto_43076 ?auto_43077 ) ) ( not ( = ?auto_43078 ?auto_43079 ) ) ( not ( = ?auto_43078 ?auto_43077 ) ) ( not ( = ?auto_43079 ?auto_43077 ) ) ( ON ?auto_43079 ?auto_43078 ) ( CLEAR ?auto_43079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43073 ?auto_43074 ?auto_43075 ?auto_43076 ?auto_43078 )
      ( MAKE-4PILE ?auto_43073 ?auto_43074 ?auto_43075 ?auto_43076 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43080 - BLOCK
      ?auto_43081 - BLOCK
      ?auto_43082 - BLOCK
      ?auto_43083 - BLOCK
    )
    :vars
    (
      ?auto_43085 - BLOCK
      ?auto_43086 - BLOCK
      ?auto_43084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43085 ?auto_43083 ) ( ON-TABLE ?auto_43080 ) ( ON ?auto_43081 ?auto_43080 ) ( ON ?auto_43082 ?auto_43081 ) ( ON ?auto_43083 ?auto_43082 ) ( not ( = ?auto_43080 ?auto_43081 ) ) ( not ( = ?auto_43080 ?auto_43082 ) ) ( not ( = ?auto_43080 ?auto_43083 ) ) ( not ( = ?auto_43080 ?auto_43085 ) ) ( not ( = ?auto_43081 ?auto_43082 ) ) ( not ( = ?auto_43081 ?auto_43083 ) ) ( not ( = ?auto_43081 ?auto_43085 ) ) ( not ( = ?auto_43082 ?auto_43083 ) ) ( not ( = ?auto_43082 ?auto_43085 ) ) ( not ( = ?auto_43083 ?auto_43085 ) ) ( not ( = ?auto_43080 ?auto_43086 ) ) ( not ( = ?auto_43080 ?auto_43084 ) ) ( not ( = ?auto_43081 ?auto_43086 ) ) ( not ( = ?auto_43081 ?auto_43084 ) ) ( not ( = ?auto_43082 ?auto_43086 ) ) ( not ( = ?auto_43082 ?auto_43084 ) ) ( not ( = ?auto_43083 ?auto_43086 ) ) ( not ( = ?auto_43083 ?auto_43084 ) ) ( not ( = ?auto_43085 ?auto_43086 ) ) ( not ( = ?auto_43085 ?auto_43084 ) ) ( not ( = ?auto_43086 ?auto_43084 ) ) ( ON ?auto_43086 ?auto_43085 ) ( CLEAR ?auto_43086 ) ( HOLDING ?auto_43084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43084 )
      ( MAKE-4PILE ?auto_43080 ?auto_43081 ?auto_43082 ?auto_43083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43087 - BLOCK
      ?auto_43088 - BLOCK
      ?auto_43089 - BLOCK
      ?auto_43090 - BLOCK
    )
    :vars
    (
      ?auto_43092 - BLOCK
      ?auto_43093 - BLOCK
      ?auto_43091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43092 ?auto_43090 ) ( ON-TABLE ?auto_43087 ) ( ON ?auto_43088 ?auto_43087 ) ( ON ?auto_43089 ?auto_43088 ) ( ON ?auto_43090 ?auto_43089 ) ( not ( = ?auto_43087 ?auto_43088 ) ) ( not ( = ?auto_43087 ?auto_43089 ) ) ( not ( = ?auto_43087 ?auto_43090 ) ) ( not ( = ?auto_43087 ?auto_43092 ) ) ( not ( = ?auto_43088 ?auto_43089 ) ) ( not ( = ?auto_43088 ?auto_43090 ) ) ( not ( = ?auto_43088 ?auto_43092 ) ) ( not ( = ?auto_43089 ?auto_43090 ) ) ( not ( = ?auto_43089 ?auto_43092 ) ) ( not ( = ?auto_43090 ?auto_43092 ) ) ( not ( = ?auto_43087 ?auto_43093 ) ) ( not ( = ?auto_43087 ?auto_43091 ) ) ( not ( = ?auto_43088 ?auto_43093 ) ) ( not ( = ?auto_43088 ?auto_43091 ) ) ( not ( = ?auto_43089 ?auto_43093 ) ) ( not ( = ?auto_43089 ?auto_43091 ) ) ( not ( = ?auto_43090 ?auto_43093 ) ) ( not ( = ?auto_43090 ?auto_43091 ) ) ( not ( = ?auto_43092 ?auto_43093 ) ) ( not ( = ?auto_43092 ?auto_43091 ) ) ( not ( = ?auto_43093 ?auto_43091 ) ) ( ON ?auto_43093 ?auto_43092 ) ( ON ?auto_43091 ?auto_43093 ) ( CLEAR ?auto_43091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43087 ?auto_43088 ?auto_43089 ?auto_43090 ?auto_43092 ?auto_43093 )
      ( MAKE-4PILE ?auto_43087 ?auto_43088 ?auto_43089 ?auto_43090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43097 - BLOCK
      ?auto_43098 - BLOCK
      ?auto_43099 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43099 ) ( CLEAR ?auto_43098 ) ( ON-TABLE ?auto_43097 ) ( ON ?auto_43098 ?auto_43097 ) ( not ( = ?auto_43097 ?auto_43098 ) ) ( not ( = ?auto_43097 ?auto_43099 ) ) ( not ( = ?auto_43098 ?auto_43099 ) ) )
    :subtasks
    ( ( !STACK ?auto_43099 ?auto_43098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43100 - BLOCK
      ?auto_43101 - BLOCK
      ?auto_43102 - BLOCK
    )
    :vars
    (
      ?auto_43103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43101 ) ( ON-TABLE ?auto_43100 ) ( ON ?auto_43101 ?auto_43100 ) ( not ( = ?auto_43100 ?auto_43101 ) ) ( not ( = ?auto_43100 ?auto_43102 ) ) ( not ( = ?auto_43101 ?auto_43102 ) ) ( ON ?auto_43102 ?auto_43103 ) ( CLEAR ?auto_43102 ) ( HAND-EMPTY ) ( not ( = ?auto_43100 ?auto_43103 ) ) ( not ( = ?auto_43101 ?auto_43103 ) ) ( not ( = ?auto_43102 ?auto_43103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43102 ?auto_43103 )
      ( MAKE-3PILE ?auto_43100 ?auto_43101 ?auto_43102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43104 - BLOCK
      ?auto_43105 - BLOCK
      ?auto_43106 - BLOCK
    )
    :vars
    (
      ?auto_43107 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43104 ) ( not ( = ?auto_43104 ?auto_43105 ) ) ( not ( = ?auto_43104 ?auto_43106 ) ) ( not ( = ?auto_43105 ?auto_43106 ) ) ( ON ?auto_43106 ?auto_43107 ) ( CLEAR ?auto_43106 ) ( not ( = ?auto_43104 ?auto_43107 ) ) ( not ( = ?auto_43105 ?auto_43107 ) ) ( not ( = ?auto_43106 ?auto_43107 ) ) ( HOLDING ?auto_43105 ) ( CLEAR ?auto_43104 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43104 ?auto_43105 )
      ( MAKE-3PILE ?auto_43104 ?auto_43105 ?auto_43106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43108 - BLOCK
      ?auto_43109 - BLOCK
      ?auto_43110 - BLOCK
    )
    :vars
    (
      ?auto_43111 - BLOCK
      ?auto_43112 - BLOCK
      ?auto_43114 - BLOCK
      ?auto_43113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43108 ) ( not ( = ?auto_43108 ?auto_43109 ) ) ( not ( = ?auto_43108 ?auto_43110 ) ) ( not ( = ?auto_43109 ?auto_43110 ) ) ( ON ?auto_43110 ?auto_43111 ) ( not ( = ?auto_43108 ?auto_43111 ) ) ( not ( = ?auto_43109 ?auto_43111 ) ) ( not ( = ?auto_43110 ?auto_43111 ) ) ( CLEAR ?auto_43108 ) ( ON ?auto_43109 ?auto_43110 ) ( CLEAR ?auto_43109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43112 ) ( ON ?auto_43114 ?auto_43112 ) ( ON ?auto_43113 ?auto_43114 ) ( ON ?auto_43111 ?auto_43113 ) ( not ( = ?auto_43112 ?auto_43114 ) ) ( not ( = ?auto_43112 ?auto_43113 ) ) ( not ( = ?auto_43112 ?auto_43111 ) ) ( not ( = ?auto_43112 ?auto_43110 ) ) ( not ( = ?auto_43112 ?auto_43109 ) ) ( not ( = ?auto_43114 ?auto_43113 ) ) ( not ( = ?auto_43114 ?auto_43111 ) ) ( not ( = ?auto_43114 ?auto_43110 ) ) ( not ( = ?auto_43114 ?auto_43109 ) ) ( not ( = ?auto_43113 ?auto_43111 ) ) ( not ( = ?auto_43113 ?auto_43110 ) ) ( not ( = ?auto_43113 ?auto_43109 ) ) ( not ( = ?auto_43108 ?auto_43112 ) ) ( not ( = ?auto_43108 ?auto_43114 ) ) ( not ( = ?auto_43108 ?auto_43113 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43112 ?auto_43114 ?auto_43113 ?auto_43111 ?auto_43110 )
      ( MAKE-3PILE ?auto_43108 ?auto_43109 ?auto_43110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43115 - BLOCK
      ?auto_43116 - BLOCK
      ?auto_43117 - BLOCK
    )
    :vars
    (
      ?auto_43119 - BLOCK
      ?auto_43118 - BLOCK
      ?auto_43120 - BLOCK
      ?auto_43121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43115 ?auto_43116 ) ) ( not ( = ?auto_43115 ?auto_43117 ) ) ( not ( = ?auto_43116 ?auto_43117 ) ) ( ON ?auto_43117 ?auto_43119 ) ( not ( = ?auto_43115 ?auto_43119 ) ) ( not ( = ?auto_43116 ?auto_43119 ) ) ( not ( = ?auto_43117 ?auto_43119 ) ) ( ON ?auto_43116 ?auto_43117 ) ( CLEAR ?auto_43116 ) ( ON-TABLE ?auto_43118 ) ( ON ?auto_43120 ?auto_43118 ) ( ON ?auto_43121 ?auto_43120 ) ( ON ?auto_43119 ?auto_43121 ) ( not ( = ?auto_43118 ?auto_43120 ) ) ( not ( = ?auto_43118 ?auto_43121 ) ) ( not ( = ?auto_43118 ?auto_43119 ) ) ( not ( = ?auto_43118 ?auto_43117 ) ) ( not ( = ?auto_43118 ?auto_43116 ) ) ( not ( = ?auto_43120 ?auto_43121 ) ) ( not ( = ?auto_43120 ?auto_43119 ) ) ( not ( = ?auto_43120 ?auto_43117 ) ) ( not ( = ?auto_43120 ?auto_43116 ) ) ( not ( = ?auto_43121 ?auto_43119 ) ) ( not ( = ?auto_43121 ?auto_43117 ) ) ( not ( = ?auto_43121 ?auto_43116 ) ) ( not ( = ?auto_43115 ?auto_43118 ) ) ( not ( = ?auto_43115 ?auto_43120 ) ) ( not ( = ?auto_43115 ?auto_43121 ) ) ( HOLDING ?auto_43115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43115 )
      ( MAKE-3PILE ?auto_43115 ?auto_43116 ?auto_43117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43122 - BLOCK
      ?auto_43123 - BLOCK
      ?auto_43124 - BLOCK
    )
    :vars
    (
      ?auto_43125 - BLOCK
      ?auto_43127 - BLOCK
      ?auto_43128 - BLOCK
      ?auto_43126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43122 ?auto_43123 ) ) ( not ( = ?auto_43122 ?auto_43124 ) ) ( not ( = ?auto_43123 ?auto_43124 ) ) ( ON ?auto_43124 ?auto_43125 ) ( not ( = ?auto_43122 ?auto_43125 ) ) ( not ( = ?auto_43123 ?auto_43125 ) ) ( not ( = ?auto_43124 ?auto_43125 ) ) ( ON ?auto_43123 ?auto_43124 ) ( ON-TABLE ?auto_43127 ) ( ON ?auto_43128 ?auto_43127 ) ( ON ?auto_43126 ?auto_43128 ) ( ON ?auto_43125 ?auto_43126 ) ( not ( = ?auto_43127 ?auto_43128 ) ) ( not ( = ?auto_43127 ?auto_43126 ) ) ( not ( = ?auto_43127 ?auto_43125 ) ) ( not ( = ?auto_43127 ?auto_43124 ) ) ( not ( = ?auto_43127 ?auto_43123 ) ) ( not ( = ?auto_43128 ?auto_43126 ) ) ( not ( = ?auto_43128 ?auto_43125 ) ) ( not ( = ?auto_43128 ?auto_43124 ) ) ( not ( = ?auto_43128 ?auto_43123 ) ) ( not ( = ?auto_43126 ?auto_43125 ) ) ( not ( = ?auto_43126 ?auto_43124 ) ) ( not ( = ?auto_43126 ?auto_43123 ) ) ( not ( = ?auto_43122 ?auto_43127 ) ) ( not ( = ?auto_43122 ?auto_43128 ) ) ( not ( = ?auto_43122 ?auto_43126 ) ) ( ON ?auto_43122 ?auto_43123 ) ( CLEAR ?auto_43122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43127 ?auto_43128 ?auto_43126 ?auto_43125 ?auto_43124 ?auto_43123 )
      ( MAKE-3PILE ?auto_43122 ?auto_43123 ?auto_43124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43132 - BLOCK
      ?auto_43133 - BLOCK
      ?auto_43134 - BLOCK
    )
    :vars
    (
      ?auto_43135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43135 ?auto_43134 ) ( CLEAR ?auto_43135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43132 ) ( ON ?auto_43133 ?auto_43132 ) ( ON ?auto_43134 ?auto_43133 ) ( not ( = ?auto_43132 ?auto_43133 ) ) ( not ( = ?auto_43132 ?auto_43134 ) ) ( not ( = ?auto_43132 ?auto_43135 ) ) ( not ( = ?auto_43133 ?auto_43134 ) ) ( not ( = ?auto_43133 ?auto_43135 ) ) ( not ( = ?auto_43134 ?auto_43135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43135 ?auto_43134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43136 - BLOCK
      ?auto_43137 - BLOCK
      ?auto_43138 - BLOCK
    )
    :vars
    (
      ?auto_43139 - BLOCK
      ?auto_43140 - BLOCK
      ?auto_43141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43139 ?auto_43138 ) ( CLEAR ?auto_43139 ) ( ON-TABLE ?auto_43136 ) ( ON ?auto_43137 ?auto_43136 ) ( ON ?auto_43138 ?auto_43137 ) ( not ( = ?auto_43136 ?auto_43137 ) ) ( not ( = ?auto_43136 ?auto_43138 ) ) ( not ( = ?auto_43136 ?auto_43139 ) ) ( not ( = ?auto_43137 ?auto_43138 ) ) ( not ( = ?auto_43137 ?auto_43139 ) ) ( not ( = ?auto_43138 ?auto_43139 ) ) ( HOLDING ?auto_43140 ) ( CLEAR ?auto_43141 ) ( not ( = ?auto_43136 ?auto_43140 ) ) ( not ( = ?auto_43136 ?auto_43141 ) ) ( not ( = ?auto_43137 ?auto_43140 ) ) ( not ( = ?auto_43137 ?auto_43141 ) ) ( not ( = ?auto_43138 ?auto_43140 ) ) ( not ( = ?auto_43138 ?auto_43141 ) ) ( not ( = ?auto_43139 ?auto_43140 ) ) ( not ( = ?auto_43139 ?auto_43141 ) ) ( not ( = ?auto_43140 ?auto_43141 ) ) )
    :subtasks
    ( ( !STACK ?auto_43140 ?auto_43141 )
      ( MAKE-3PILE ?auto_43136 ?auto_43137 ?auto_43138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43142 - BLOCK
      ?auto_43143 - BLOCK
      ?auto_43144 - BLOCK
    )
    :vars
    (
      ?auto_43147 - BLOCK
      ?auto_43145 - BLOCK
      ?auto_43146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43147 ?auto_43144 ) ( ON-TABLE ?auto_43142 ) ( ON ?auto_43143 ?auto_43142 ) ( ON ?auto_43144 ?auto_43143 ) ( not ( = ?auto_43142 ?auto_43143 ) ) ( not ( = ?auto_43142 ?auto_43144 ) ) ( not ( = ?auto_43142 ?auto_43147 ) ) ( not ( = ?auto_43143 ?auto_43144 ) ) ( not ( = ?auto_43143 ?auto_43147 ) ) ( not ( = ?auto_43144 ?auto_43147 ) ) ( CLEAR ?auto_43145 ) ( not ( = ?auto_43142 ?auto_43146 ) ) ( not ( = ?auto_43142 ?auto_43145 ) ) ( not ( = ?auto_43143 ?auto_43146 ) ) ( not ( = ?auto_43143 ?auto_43145 ) ) ( not ( = ?auto_43144 ?auto_43146 ) ) ( not ( = ?auto_43144 ?auto_43145 ) ) ( not ( = ?auto_43147 ?auto_43146 ) ) ( not ( = ?auto_43147 ?auto_43145 ) ) ( not ( = ?auto_43146 ?auto_43145 ) ) ( ON ?auto_43146 ?auto_43147 ) ( CLEAR ?auto_43146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43142 ?auto_43143 ?auto_43144 ?auto_43147 )
      ( MAKE-3PILE ?auto_43142 ?auto_43143 ?auto_43144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43148 - BLOCK
      ?auto_43149 - BLOCK
      ?auto_43150 - BLOCK
    )
    :vars
    (
      ?auto_43153 - BLOCK
      ?auto_43151 - BLOCK
      ?auto_43152 - BLOCK
      ?auto_43154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43153 ?auto_43150 ) ( ON-TABLE ?auto_43148 ) ( ON ?auto_43149 ?auto_43148 ) ( ON ?auto_43150 ?auto_43149 ) ( not ( = ?auto_43148 ?auto_43149 ) ) ( not ( = ?auto_43148 ?auto_43150 ) ) ( not ( = ?auto_43148 ?auto_43153 ) ) ( not ( = ?auto_43149 ?auto_43150 ) ) ( not ( = ?auto_43149 ?auto_43153 ) ) ( not ( = ?auto_43150 ?auto_43153 ) ) ( not ( = ?auto_43148 ?auto_43151 ) ) ( not ( = ?auto_43148 ?auto_43152 ) ) ( not ( = ?auto_43149 ?auto_43151 ) ) ( not ( = ?auto_43149 ?auto_43152 ) ) ( not ( = ?auto_43150 ?auto_43151 ) ) ( not ( = ?auto_43150 ?auto_43152 ) ) ( not ( = ?auto_43153 ?auto_43151 ) ) ( not ( = ?auto_43153 ?auto_43152 ) ) ( not ( = ?auto_43151 ?auto_43152 ) ) ( ON ?auto_43151 ?auto_43153 ) ( CLEAR ?auto_43151 ) ( HOLDING ?auto_43152 ) ( CLEAR ?auto_43154 ) ( ON-TABLE ?auto_43154 ) ( not ( = ?auto_43154 ?auto_43152 ) ) ( not ( = ?auto_43148 ?auto_43154 ) ) ( not ( = ?auto_43149 ?auto_43154 ) ) ( not ( = ?auto_43150 ?auto_43154 ) ) ( not ( = ?auto_43153 ?auto_43154 ) ) ( not ( = ?auto_43151 ?auto_43154 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43154 ?auto_43152 )
      ( MAKE-3PILE ?auto_43148 ?auto_43149 ?auto_43150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43155 - BLOCK
      ?auto_43156 - BLOCK
      ?auto_43157 - BLOCK
    )
    :vars
    (
      ?auto_43159 - BLOCK
      ?auto_43161 - BLOCK
      ?auto_43158 - BLOCK
      ?auto_43160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43159 ?auto_43157 ) ( ON-TABLE ?auto_43155 ) ( ON ?auto_43156 ?auto_43155 ) ( ON ?auto_43157 ?auto_43156 ) ( not ( = ?auto_43155 ?auto_43156 ) ) ( not ( = ?auto_43155 ?auto_43157 ) ) ( not ( = ?auto_43155 ?auto_43159 ) ) ( not ( = ?auto_43156 ?auto_43157 ) ) ( not ( = ?auto_43156 ?auto_43159 ) ) ( not ( = ?auto_43157 ?auto_43159 ) ) ( not ( = ?auto_43155 ?auto_43161 ) ) ( not ( = ?auto_43155 ?auto_43158 ) ) ( not ( = ?auto_43156 ?auto_43161 ) ) ( not ( = ?auto_43156 ?auto_43158 ) ) ( not ( = ?auto_43157 ?auto_43161 ) ) ( not ( = ?auto_43157 ?auto_43158 ) ) ( not ( = ?auto_43159 ?auto_43161 ) ) ( not ( = ?auto_43159 ?auto_43158 ) ) ( not ( = ?auto_43161 ?auto_43158 ) ) ( ON ?auto_43161 ?auto_43159 ) ( CLEAR ?auto_43160 ) ( ON-TABLE ?auto_43160 ) ( not ( = ?auto_43160 ?auto_43158 ) ) ( not ( = ?auto_43155 ?auto_43160 ) ) ( not ( = ?auto_43156 ?auto_43160 ) ) ( not ( = ?auto_43157 ?auto_43160 ) ) ( not ( = ?auto_43159 ?auto_43160 ) ) ( not ( = ?auto_43161 ?auto_43160 ) ) ( ON ?auto_43158 ?auto_43161 ) ( CLEAR ?auto_43158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43155 ?auto_43156 ?auto_43157 ?auto_43159 ?auto_43161 )
      ( MAKE-3PILE ?auto_43155 ?auto_43156 ?auto_43157 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43162 - BLOCK
      ?auto_43163 - BLOCK
      ?auto_43164 - BLOCK
    )
    :vars
    (
      ?auto_43166 - BLOCK
      ?auto_43168 - BLOCK
      ?auto_43167 - BLOCK
      ?auto_43165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43166 ?auto_43164 ) ( ON-TABLE ?auto_43162 ) ( ON ?auto_43163 ?auto_43162 ) ( ON ?auto_43164 ?auto_43163 ) ( not ( = ?auto_43162 ?auto_43163 ) ) ( not ( = ?auto_43162 ?auto_43164 ) ) ( not ( = ?auto_43162 ?auto_43166 ) ) ( not ( = ?auto_43163 ?auto_43164 ) ) ( not ( = ?auto_43163 ?auto_43166 ) ) ( not ( = ?auto_43164 ?auto_43166 ) ) ( not ( = ?auto_43162 ?auto_43168 ) ) ( not ( = ?auto_43162 ?auto_43167 ) ) ( not ( = ?auto_43163 ?auto_43168 ) ) ( not ( = ?auto_43163 ?auto_43167 ) ) ( not ( = ?auto_43164 ?auto_43168 ) ) ( not ( = ?auto_43164 ?auto_43167 ) ) ( not ( = ?auto_43166 ?auto_43168 ) ) ( not ( = ?auto_43166 ?auto_43167 ) ) ( not ( = ?auto_43168 ?auto_43167 ) ) ( ON ?auto_43168 ?auto_43166 ) ( not ( = ?auto_43165 ?auto_43167 ) ) ( not ( = ?auto_43162 ?auto_43165 ) ) ( not ( = ?auto_43163 ?auto_43165 ) ) ( not ( = ?auto_43164 ?auto_43165 ) ) ( not ( = ?auto_43166 ?auto_43165 ) ) ( not ( = ?auto_43168 ?auto_43165 ) ) ( ON ?auto_43167 ?auto_43168 ) ( CLEAR ?auto_43167 ) ( HOLDING ?auto_43165 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43165 )
      ( MAKE-3PILE ?auto_43162 ?auto_43163 ?auto_43164 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43169 - BLOCK
      ?auto_43170 - BLOCK
      ?auto_43171 - BLOCK
    )
    :vars
    (
      ?auto_43174 - BLOCK
      ?auto_43172 - BLOCK
      ?auto_43175 - BLOCK
      ?auto_43173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43174 ?auto_43171 ) ( ON-TABLE ?auto_43169 ) ( ON ?auto_43170 ?auto_43169 ) ( ON ?auto_43171 ?auto_43170 ) ( not ( = ?auto_43169 ?auto_43170 ) ) ( not ( = ?auto_43169 ?auto_43171 ) ) ( not ( = ?auto_43169 ?auto_43174 ) ) ( not ( = ?auto_43170 ?auto_43171 ) ) ( not ( = ?auto_43170 ?auto_43174 ) ) ( not ( = ?auto_43171 ?auto_43174 ) ) ( not ( = ?auto_43169 ?auto_43172 ) ) ( not ( = ?auto_43169 ?auto_43175 ) ) ( not ( = ?auto_43170 ?auto_43172 ) ) ( not ( = ?auto_43170 ?auto_43175 ) ) ( not ( = ?auto_43171 ?auto_43172 ) ) ( not ( = ?auto_43171 ?auto_43175 ) ) ( not ( = ?auto_43174 ?auto_43172 ) ) ( not ( = ?auto_43174 ?auto_43175 ) ) ( not ( = ?auto_43172 ?auto_43175 ) ) ( ON ?auto_43172 ?auto_43174 ) ( not ( = ?auto_43173 ?auto_43175 ) ) ( not ( = ?auto_43169 ?auto_43173 ) ) ( not ( = ?auto_43170 ?auto_43173 ) ) ( not ( = ?auto_43171 ?auto_43173 ) ) ( not ( = ?auto_43174 ?auto_43173 ) ) ( not ( = ?auto_43172 ?auto_43173 ) ) ( ON ?auto_43175 ?auto_43172 ) ( ON ?auto_43173 ?auto_43175 ) ( CLEAR ?auto_43173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43169 ?auto_43170 ?auto_43171 ?auto_43174 ?auto_43172 ?auto_43175 )
      ( MAKE-3PILE ?auto_43169 ?auto_43170 ?auto_43171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43180 - BLOCK
      ?auto_43181 - BLOCK
      ?auto_43182 - BLOCK
      ?auto_43183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43183 ) ( CLEAR ?auto_43182 ) ( ON-TABLE ?auto_43180 ) ( ON ?auto_43181 ?auto_43180 ) ( ON ?auto_43182 ?auto_43181 ) ( not ( = ?auto_43180 ?auto_43181 ) ) ( not ( = ?auto_43180 ?auto_43182 ) ) ( not ( = ?auto_43180 ?auto_43183 ) ) ( not ( = ?auto_43181 ?auto_43182 ) ) ( not ( = ?auto_43181 ?auto_43183 ) ) ( not ( = ?auto_43182 ?auto_43183 ) ) )
    :subtasks
    ( ( !STACK ?auto_43183 ?auto_43182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43184 - BLOCK
      ?auto_43185 - BLOCK
      ?auto_43186 - BLOCK
      ?auto_43187 - BLOCK
    )
    :vars
    (
      ?auto_43188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43186 ) ( ON-TABLE ?auto_43184 ) ( ON ?auto_43185 ?auto_43184 ) ( ON ?auto_43186 ?auto_43185 ) ( not ( = ?auto_43184 ?auto_43185 ) ) ( not ( = ?auto_43184 ?auto_43186 ) ) ( not ( = ?auto_43184 ?auto_43187 ) ) ( not ( = ?auto_43185 ?auto_43186 ) ) ( not ( = ?auto_43185 ?auto_43187 ) ) ( not ( = ?auto_43186 ?auto_43187 ) ) ( ON ?auto_43187 ?auto_43188 ) ( CLEAR ?auto_43187 ) ( HAND-EMPTY ) ( not ( = ?auto_43184 ?auto_43188 ) ) ( not ( = ?auto_43185 ?auto_43188 ) ) ( not ( = ?auto_43186 ?auto_43188 ) ) ( not ( = ?auto_43187 ?auto_43188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43187 ?auto_43188 )
      ( MAKE-4PILE ?auto_43184 ?auto_43185 ?auto_43186 ?auto_43187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43189 - BLOCK
      ?auto_43190 - BLOCK
      ?auto_43191 - BLOCK
      ?auto_43192 - BLOCK
    )
    :vars
    (
      ?auto_43193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43189 ) ( ON ?auto_43190 ?auto_43189 ) ( not ( = ?auto_43189 ?auto_43190 ) ) ( not ( = ?auto_43189 ?auto_43191 ) ) ( not ( = ?auto_43189 ?auto_43192 ) ) ( not ( = ?auto_43190 ?auto_43191 ) ) ( not ( = ?auto_43190 ?auto_43192 ) ) ( not ( = ?auto_43191 ?auto_43192 ) ) ( ON ?auto_43192 ?auto_43193 ) ( CLEAR ?auto_43192 ) ( not ( = ?auto_43189 ?auto_43193 ) ) ( not ( = ?auto_43190 ?auto_43193 ) ) ( not ( = ?auto_43191 ?auto_43193 ) ) ( not ( = ?auto_43192 ?auto_43193 ) ) ( HOLDING ?auto_43191 ) ( CLEAR ?auto_43190 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43189 ?auto_43190 ?auto_43191 )
      ( MAKE-4PILE ?auto_43189 ?auto_43190 ?auto_43191 ?auto_43192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43194 - BLOCK
      ?auto_43195 - BLOCK
      ?auto_43196 - BLOCK
      ?auto_43197 - BLOCK
    )
    :vars
    (
      ?auto_43198 - BLOCK
      ?auto_43199 - BLOCK
      ?auto_43200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43194 ) ( ON ?auto_43195 ?auto_43194 ) ( not ( = ?auto_43194 ?auto_43195 ) ) ( not ( = ?auto_43194 ?auto_43196 ) ) ( not ( = ?auto_43194 ?auto_43197 ) ) ( not ( = ?auto_43195 ?auto_43196 ) ) ( not ( = ?auto_43195 ?auto_43197 ) ) ( not ( = ?auto_43196 ?auto_43197 ) ) ( ON ?auto_43197 ?auto_43198 ) ( not ( = ?auto_43194 ?auto_43198 ) ) ( not ( = ?auto_43195 ?auto_43198 ) ) ( not ( = ?auto_43196 ?auto_43198 ) ) ( not ( = ?auto_43197 ?auto_43198 ) ) ( CLEAR ?auto_43195 ) ( ON ?auto_43196 ?auto_43197 ) ( CLEAR ?auto_43196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43199 ) ( ON ?auto_43200 ?auto_43199 ) ( ON ?auto_43198 ?auto_43200 ) ( not ( = ?auto_43199 ?auto_43200 ) ) ( not ( = ?auto_43199 ?auto_43198 ) ) ( not ( = ?auto_43199 ?auto_43197 ) ) ( not ( = ?auto_43199 ?auto_43196 ) ) ( not ( = ?auto_43200 ?auto_43198 ) ) ( not ( = ?auto_43200 ?auto_43197 ) ) ( not ( = ?auto_43200 ?auto_43196 ) ) ( not ( = ?auto_43194 ?auto_43199 ) ) ( not ( = ?auto_43194 ?auto_43200 ) ) ( not ( = ?auto_43195 ?auto_43199 ) ) ( not ( = ?auto_43195 ?auto_43200 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43199 ?auto_43200 ?auto_43198 ?auto_43197 )
      ( MAKE-4PILE ?auto_43194 ?auto_43195 ?auto_43196 ?auto_43197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43201 - BLOCK
      ?auto_43202 - BLOCK
      ?auto_43203 - BLOCK
      ?auto_43204 - BLOCK
    )
    :vars
    (
      ?auto_43207 - BLOCK
      ?auto_43206 - BLOCK
      ?auto_43205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43201 ) ( not ( = ?auto_43201 ?auto_43202 ) ) ( not ( = ?auto_43201 ?auto_43203 ) ) ( not ( = ?auto_43201 ?auto_43204 ) ) ( not ( = ?auto_43202 ?auto_43203 ) ) ( not ( = ?auto_43202 ?auto_43204 ) ) ( not ( = ?auto_43203 ?auto_43204 ) ) ( ON ?auto_43204 ?auto_43207 ) ( not ( = ?auto_43201 ?auto_43207 ) ) ( not ( = ?auto_43202 ?auto_43207 ) ) ( not ( = ?auto_43203 ?auto_43207 ) ) ( not ( = ?auto_43204 ?auto_43207 ) ) ( ON ?auto_43203 ?auto_43204 ) ( CLEAR ?auto_43203 ) ( ON-TABLE ?auto_43206 ) ( ON ?auto_43205 ?auto_43206 ) ( ON ?auto_43207 ?auto_43205 ) ( not ( = ?auto_43206 ?auto_43205 ) ) ( not ( = ?auto_43206 ?auto_43207 ) ) ( not ( = ?auto_43206 ?auto_43204 ) ) ( not ( = ?auto_43206 ?auto_43203 ) ) ( not ( = ?auto_43205 ?auto_43207 ) ) ( not ( = ?auto_43205 ?auto_43204 ) ) ( not ( = ?auto_43205 ?auto_43203 ) ) ( not ( = ?auto_43201 ?auto_43206 ) ) ( not ( = ?auto_43201 ?auto_43205 ) ) ( not ( = ?auto_43202 ?auto_43206 ) ) ( not ( = ?auto_43202 ?auto_43205 ) ) ( HOLDING ?auto_43202 ) ( CLEAR ?auto_43201 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43201 ?auto_43202 )
      ( MAKE-4PILE ?auto_43201 ?auto_43202 ?auto_43203 ?auto_43204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43208 - BLOCK
      ?auto_43209 - BLOCK
      ?auto_43210 - BLOCK
      ?auto_43211 - BLOCK
    )
    :vars
    (
      ?auto_43212 - BLOCK
      ?auto_43213 - BLOCK
      ?auto_43214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43208 ) ( not ( = ?auto_43208 ?auto_43209 ) ) ( not ( = ?auto_43208 ?auto_43210 ) ) ( not ( = ?auto_43208 ?auto_43211 ) ) ( not ( = ?auto_43209 ?auto_43210 ) ) ( not ( = ?auto_43209 ?auto_43211 ) ) ( not ( = ?auto_43210 ?auto_43211 ) ) ( ON ?auto_43211 ?auto_43212 ) ( not ( = ?auto_43208 ?auto_43212 ) ) ( not ( = ?auto_43209 ?auto_43212 ) ) ( not ( = ?auto_43210 ?auto_43212 ) ) ( not ( = ?auto_43211 ?auto_43212 ) ) ( ON ?auto_43210 ?auto_43211 ) ( ON-TABLE ?auto_43213 ) ( ON ?auto_43214 ?auto_43213 ) ( ON ?auto_43212 ?auto_43214 ) ( not ( = ?auto_43213 ?auto_43214 ) ) ( not ( = ?auto_43213 ?auto_43212 ) ) ( not ( = ?auto_43213 ?auto_43211 ) ) ( not ( = ?auto_43213 ?auto_43210 ) ) ( not ( = ?auto_43214 ?auto_43212 ) ) ( not ( = ?auto_43214 ?auto_43211 ) ) ( not ( = ?auto_43214 ?auto_43210 ) ) ( not ( = ?auto_43208 ?auto_43213 ) ) ( not ( = ?auto_43208 ?auto_43214 ) ) ( not ( = ?auto_43209 ?auto_43213 ) ) ( not ( = ?auto_43209 ?auto_43214 ) ) ( CLEAR ?auto_43208 ) ( ON ?auto_43209 ?auto_43210 ) ( CLEAR ?auto_43209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43213 ?auto_43214 ?auto_43212 ?auto_43211 ?auto_43210 )
      ( MAKE-4PILE ?auto_43208 ?auto_43209 ?auto_43210 ?auto_43211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43215 - BLOCK
      ?auto_43216 - BLOCK
      ?auto_43217 - BLOCK
      ?auto_43218 - BLOCK
    )
    :vars
    (
      ?auto_43219 - BLOCK
      ?auto_43221 - BLOCK
      ?auto_43220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43215 ?auto_43216 ) ) ( not ( = ?auto_43215 ?auto_43217 ) ) ( not ( = ?auto_43215 ?auto_43218 ) ) ( not ( = ?auto_43216 ?auto_43217 ) ) ( not ( = ?auto_43216 ?auto_43218 ) ) ( not ( = ?auto_43217 ?auto_43218 ) ) ( ON ?auto_43218 ?auto_43219 ) ( not ( = ?auto_43215 ?auto_43219 ) ) ( not ( = ?auto_43216 ?auto_43219 ) ) ( not ( = ?auto_43217 ?auto_43219 ) ) ( not ( = ?auto_43218 ?auto_43219 ) ) ( ON ?auto_43217 ?auto_43218 ) ( ON-TABLE ?auto_43221 ) ( ON ?auto_43220 ?auto_43221 ) ( ON ?auto_43219 ?auto_43220 ) ( not ( = ?auto_43221 ?auto_43220 ) ) ( not ( = ?auto_43221 ?auto_43219 ) ) ( not ( = ?auto_43221 ?auto_43218 ) ) ( not ( = ?auto_43221 ?auto_43217 ) ) ( not ( = ?auto_43220 ?auto_43219 ) ) ( not ( = ?auto_43220 ?auto_43218 ) ) ( not ( = ?auto_43220 ?auto_43217 ) ) ( not ( = ?auto_43215 ?auto_43221 ) ) ( not ( = ?auto_43215 ?auto_43220 ) ) ( not ( = ?auto_43216 ?auto_43221 ) ) ( not ( = ?auto_43216 ?auto_43220 ) ) ( ON ?auto_43216 ?auto_43217 ) ( CLEAR ?auto_43216 ) ( HOLDING ?auto_43215 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43215 )
      ( MAKE-4PILE ?auto_43215 ?auto_43216 ?auto_43217 ?auto_43218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43222 - BLOCK
      ?auto_43223 - BLOCK
      ?auto_43224 - BLOCK
      ?auto_43225 - BLOCK
    )
    :vars
    (
      ?auto_43227 - BLOCK
      ?auto_43226 - BLOCK
      ?auto_43228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43222 ?auto_43223 ) ) ( not ( = ?auto_43222 ?auto_43224 ) ) ( not ( = ?auto_43222 ?auto_43225 ) ) ( not ( = ?auto_43223 ?auto_43224 ) ) ( not ( = ?auto_43223 ?auto_43225 ) ) ( not ( = ?auto_43224 ?auto_43225 ) ) ( ON ?auto_43225 ?auto_43227 ) ( not ( = ?auto_43222 ?auto_43227 ) ) ( not ( = ?auto_43223 ?auto_43227 ) ) ( not ( = ?auto_43224 ?auto_43227 ) ) ( not ( = ?auto_43225 ?auto_43227 ) ) ( ON ?auto_43224 ?auto_43225 ) ( ON-TABLE ?auto_43226 ) ( ON ?auto_43228 ?auto_43226 ) ( ON ?auto_43227 ?auto_43228 ) ( not ( = ?auto_43226 ?auto_43228 ) ) ( not ( = ?auto_43226 ?auto_43227 ) ) ( not ( = ?auto_43226 ?auto_43225 ) ) ( not ( = ?auto_43226 ?auto_43224 ) ) ( not ( = ?auto_43228 ?auto_43227 ) ) ( not ( = ?auto_43228 ?auto_43225 ) ) ( not ( = ?auto_43228 ?auto_43224 ) ) ( not ( = ?auto_43222 ?auto_43226 ) ) ( not ( = ?auto_43222 ?auto_43228 ) ) ( not ( = ?auto_43223 ?auto_43226 ) ) ( not ( = ?auto_43223 ?auto_43228 ) ) ( ON ?auto_43223 ?auto_43224 ) ( ON ?auto_43222 ?auto_43223 ) ( CLEAR ?auto_43222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43226 ?auto_43228 ?auto_43227 ?auto_43225 ?auto_43224 ?auto_43223 )
      ( MAKE-4PILE ?auto_43222 ?auto_43223 ?auto_43224 ?auto_43225 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43231 - BLOCK
      ?auto_43232 - BLOCK
    )
    :vars
    (
      ?auto_43233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43233 ?auto_43232 ) ( CLEAR ?auto_43233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43231 ) ( ON ?auto_43232 ?auto_43231 ) ( not ( = ?auto_43231 ?auto_43232 ) ) ( not ( = ?auto_43231 ?auto_43233 ) ) ( not ( = ?auto_43232 ?auto_43233 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43233 ?auto_43232 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43234 - BLOCK
      ?auto_43235 - BLOCK
    )
    :vars
    (
      ?auto_43236 - BLOCK
      ?auto_43237 - BLOCK
      ?auto_43238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43236 ?auto_43235 ) ( CLEAR ?auto_43236 ) ( ON-TABLE ?auto_43234 ) ( ON ?auto_43235 ?auto_43234 ) ( not ( = ?auto_43234 ?auto_43235 ) ) ( not ( = ?auto_43234 ?auto_43236 ) ) ( not ( = ?auto_43235 ?auto_43236 ) ) ( HOLDING ?auto_43237 ) ( CLEAR ?auto_43238 ) ( not ( = ?auto_43234 ?auto_43237 ) ) ( not ( = ?auto_43234 ?auto_43238 ) ) ( not ( = ?auto_43235 ?auto_43237 ) ) ( not ( = ?auto_43235 ?auto_43238 ) ) ( not ( = ?auto_43236 ?auto_43237 ) ) ( not ( = ?auto_43236 ?auto_43238 ) ) ( not ( = ?auto_43237 ?auto_43238 ) ) )
    :subtasks
    ( ( !STACK ?auto_43237 ?auto_43238 )
      ( MAKE-2PILE ?auto_43234 ?auto_43235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43239 - BLOCK
      ?auto_43240 - BLOCK
    )
    :vars
    (
      ?auto_43243 - BLOCK
      ?auto_43242 - BLOCK
      ?auto_43241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43243 ?auto_43240 ) ( ON-TABLE ?auto_43239 ) ( ON ?auto_43240 ?auto_43239 ) ( not ( = ?auto_43239 ?auto_43240 ) ) ( not ( = ?auto_43239 ?auto_43243 ) ) ( not ( = ?auto_43240 ?auto_43243 ) ) ( CLEAR ?auto_43242 ) ( not ( = ?auto_43239 ?auto_43241 ) ) ( not ( = ?auto_43239 ?auto_43242 ) ) ( not ( = ?auto_43240 ?auto_43241 ) ) ( not ( = ?auto_43240 ?auto_43242 ) ) ( not ( = ?auto_43243 ?auto_43241 ) ) ( not ( = ?auto_43243 ?auto_43242 ) ) ( not ( = ?auto_43241 ?auto_43242 ) ) ( ON ?auto_43241 ?auto_43243 ) ( CLEAR ?auto_43241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43239 ?auto_43240 ?auto_43243 )
      ( MAKE-2PILE ?auto_43239 ?auto_43240 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43244 - BLOCK
      ?auto_43245 - BLOCK
    )
    :vars
    (
      ?auto_43247 - BLOCK
      ?auto_43248 - BLOCK
      ?auto_43246 - BLOCK
      ?auto_43250 - BLOCK
      ?auto_43249 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43247 ?auto_43245 ) ( ON-TABLE ?auto_43244 ) ( ON ?auto_43245 ?auto_43244 ) ( not ( = ?auto_43244 ?auto_43245 ) ) ( not ( = ?auto_43244 ?auto_43247 ) ) ( not ( = ?auto_43245 ?auto_43247 ) ) ( not ( = ?auto_43244 ?auto_43248 ) ) ( not ( = ?auto_43244 ?auto_43246 ) ) ( not ( = ?auto_43245 ?auto_43248 ) ) ( not ( = ?auto_43245 ?auto_43246 ) ) ( not ( = ?auto_43247 ?auto_43248 ) ) ( not ( = ?auto_43247 ?auto_43246 ) ) ( not ( = ?auto_43248 ?auto_43246 ) ) ( ON ?auto_43248 ?auto_43247 ) ( CLEAR ?auto_43248 ) ( HOLDING ?auto_43246 ) ( CLEAR ?auto_43250 ) ( ON-TABLE ?auto_43249 ) ( ON ?auto_43250 ?auto_43249 ) ( not ( = ?auto_43249 ?auto_43250 ) ) ( not ( = ?auto_43249 ?auto_43246 ) ) ( not ( = ?auto_43250 ?auto_43246 ) ) ( not ( = ?auto_43244 ?auto_43250 ) ) ( not ( = ?auto_43244 ?auto_43249 ) ) ( not ( = ?auto_43245 ?auto_43250 ) ) ( not ( = ?auto_43245 ?auto_43249 ) ) ( not ( = ?auto_43247 ?auto_43250 ) ) ( not ( = ?auto_43247 ?auto_43249 ) ) ( not ( = ?auto_43248 ?auto_43250 ) ) ( not ( = ?auto_43248 ?auto_43249 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43249 ?auto_43250 ?auto_43246 )
      ( MAKE-2PILE ?auto_43244 ?auto_43245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43251 - BLOCK
      ?auto_43252 - BLOCK
    )
    :vars
    (
      ?auto_43255 - BLOCK
      ?auto_43257 - BLOCK
      ?auto_43253 - BLOCK
      ?auto_43254 - BLOCK
      ?auto_43256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43255 ?auto_43252 ) ( ON-TABLE ?auto_43251 ) ( ON ?auto_43252 ?auto_43251 ) ( not ( = ?auto_43251 ?auto_43252 ) ) ( not ( = ?auto_43251 ?auto_43255 ) ) ( not ( = ?auto_43252 ?auto_43255 ) ) ( not ( = ?auto_43251 ?auto_43257 ) ) ( not ( = ?auto_43251 ?auto_43253 ) ) ( not ( = ?auto_43252 ?auto_43257 ) ) ( not ( = ?auto_43252 ?auto_43253 ) ) ( not ( = ?auto_43255 ?auto_43257 ) ) ( not ( = ?auto_43255 ?auto_43253 ) ) ( not ( = ?auto_43257 ?auto_43253 ) ) ( ON ?auto_43257 ?auto_43255 ) ( CLEAR ?auto_43254 ) ( ON-TABLE ?auto_43256 ) ( ON ?auto_43254 ?auto_43256 ) ( not ( = ?auto_43256 ?auto_43254 ) ) ( not ( = ?auto_43256 ?auto_43253 ) ) ( not ( = ?auto_43254 ?auto_43253 ) ) ( not ( = ?auto_43251 ?auto_43254 ) ) ( not ( = ?auto_43251 ?auto_43256 ) ) ( not ( = ?auto_43252 ?auto_43254 ) ) ( not ( = ?auto_43252 ?auto_43256 ) ) ( not ( = ?auto_43255 ?auto_43254 ) ) ( not ( = ?auto_43255 ?auto_43256 ) ) ( not ( = ?auto_43257 ?auto_43254 ) ) ( not ( = ?auto_43257 ?auto_43256 ) ) ( ON ?auto_43253 ?auto_43257 ) ( CLEAR ?auto_43253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43251 ?auto_43252 ?auto_43255 ?auto_43257 )
      ( MAKE-2PILE ?auto_43251 ?auto_43252 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43258 - BLOCK
      ?auto_43259 - BLOCK
    )
    :vars
    (
      ?auto_43260 - BLOCK
      ?auto_43263 - BLOCK
      ?auto_43264 - BLOCK
      ?auto_43262 - BLOCK
      ?auto_43261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43260 ?auto_43259 ) ( ON-TABLE ?auto_43258 ) ( ON ?auto_43259 ?auto_43258 ) ( not ( = ?auto_43258 ?auto_43259 ) ) ( not ( = ?auto_43258 ?auto_43260 ) ) ( not ( = ?auto_43259 ?auto_43260 ) ) ( not ( = ?auto_43258 ?auto_43263 ) ) ( not ( = ?auto_43258 ?auto_43264 ) ) ( not ( = ?auto_43259 ?auto_43263 ) ) ( not ( = ?auto_43259 ?auto_43264 ) ) ( not ( = ?auto_43260 ?auto_43263 ) ) ( not ( = ?auto_43260 ?auto_43264 ) ) ( not ( = ?auto_43263 ?auto_43264 ) ) ( ON ?auto_43263 ?auto_43260 ) ( ON-TABLE ?auto_43262 ) ( not ( = ?auto_43262 ?auto_43261 ) ) ( not ( = ?auto_43262 ?auto_43264 ) ) ( not ( = ?auto_43261 ?auto_43264 ) ) ( not ( = ?auto_43258 ?auto_43261 ) ) ( not ( = ?auto_43258 ?auto_43262 ) ) ( not ( = ?auto_43259 ?auto_43261 ) ) ( not ( = ?auto_43259 ?auto_43262 ) ) ( not ( = ?auto_43260 ?auto_43261 ) ) ( not ( = ?auto_43260 ?auto_43262 ) ) ( not ( = ?auto_43263 ?auto_43261 ) ) ( not ( = ?auto_43263 ?auto_43262 ) ) ( ON ?auto_43264 ?auto_43263 ) ( CLEAR ?auto_43264 ) ( HOLDING ?auto_43261 ) ( CLEAR ?auto_43262 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43262 ?auto_43261 )
      ( MAKE-2PILE ?auto_43258 ?auto_43259 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43265 - BLOCK
      ?auto_43266 - BLOCK
    )
    :vars
    (
      ?auto_43268 - BLOCK
      ?auto_43271 - BLOCK
      ?auto_43270 - BLOCK
      ?auto_43267 - BLOCK
      ?auto_43269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43268 ?auto_43266 ) ( ON-TABLE ?auto_43265 ) ( ON ?auto_43266 ?auto_43265 ) ( not ( = ?auto_43265 ?auto_43266 ) ) ( not ( = ?auto_43265 ?auto_43268 ) ) ( not ( = ?auto_43266 ?auto_43268 ) ) ( not ( = ?auto_43265 ?auto_43271 ) ) ( not ( = ?auto_43265 ?auto_43270 ) ) ( not ( = ?auto_43266 ?auto_43271 ) ) ( not ( = ?auto_43266 ?auto_43270 ) ) ( not ( = ?auto_43268 ?auto_43271 ) ) ( not ( = ?auto_43268 ?auto_43270 ) ) ( not ( = ?auto_43271 ?auto_43270 ) ) ( ON ?auto_43271 ?auto_43268 ) ( ON-TABLE ?auto_43267 ) ( not ( = ?auto_43267 ?auto_43269 ) ) ( not ( = ?auto_43267 ?auto_43270 ) ) ( not ( = ?auto_43269 ?auto_43270 ) ) ( not ( = ?auto_43265 ?auto_43269 ) ) ( not ( = ?auto_43265 ?auto_43267 ) ) ( not ( = ?auto_43266 ?auto_43269 ) ) ( not ( = ?auto_43266 ?auto_43267 ) ) ( not ( = ?auto_43268 ?auto_43269 ) ) ( not ( = ?auto_43268 ?auto_43267 ) ) ( not ( = ?auto_43271 ?auto_43269 ) ) ( not ( = ?auto_43271 ?auto_43267 ) ) ( ON ?auto_43270 ?auto_43271 ) ( CLEAR ?auto_43267 ) ( ON ?auto_43269 ?auto_43270 ) ( CLEAR ?auto_43269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43265 ?auto_43266 ?auto_43268 ?auto_43271 ?auto_43270 )
      ( MAKE-2PILE ?auto_43265 ?auto_43266 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43272 - BLOCK
      ?auto_43273 - BLOCK
    )
    :vars
    (
      ?auto_43274 - BLOCK
      ?auto_43278 - BLOCK
      ?auto_43277 - BLOCK
      ?auto_43275 - BLOCK
      ?auto_43276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43274 ?auto_43273 ) ( ON-TABLE ?auto_43272 ) ( ON ?auto_43273 ?auto_43272 ) ( not ( = ?auto_43272 ?auto_43273 ) ) ( not ( = ?auto_43272 ?auto_43274 ) ) ( not ( = ?auto_43273 ?auto_43274 ) ) ( not ( = ?auto_43272 ?auto_43278 ) ) ( not ( = ?auto_43272 ?auto_43277 ) ) ( not ( = ?auto_43273 ?auto_43278 ) ) ( not ( = ?auto_43273 ?auto_43277 ) ) ( not ( = ?auto_43274 ?auto_43278 ) ) ( not ( = ?auto_43274 ?auto_43277 ) ) ( not ( = ?auto_43278 ?auto_43277 ) ) ( ON ?auto_43278 ?auto_43274 ) ( not ( = ?auto_43275 ?auto_43276 ) ) ( not ( = ?auto_43275 ?auto_43277 ) ) ( not ( = ?auto_43276 ?auto_43277 ) ) ( not ( = ?auto_43272 ?auto_43276 ) ) ( not ( = ?auto_43272 ?auto_43275 ) ) ( not ( = ?auto_43273 ?auto_43276 ) ) ( not ( = ?auto_43273 ?auto_43275 ) ) ( not ( = ?auto_43274 ?auto_43276 ) ) ( not ( = ?auto_43274 ?auto_43275 ) ) ( not ( = ?auto_43278 ?auto_43276 ) ) ( not ( = ?auto_43278 ?auto_43275 ) ) ( ON ?auto_43277 ?auto_43278 ) ( ON ?auto_43276 ?auto_43277 ) ( CLEAR ?auto_43276 ) ( HOLDING ?auto_43275 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43275 )
      ( MAKE-2PILE ?auto_43272 ?auto_43273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43279 - BLOCK
      ?auto_43280 - BLOCK
    )
    :vars
    (
      ?auto_43284 - BLOCK
      ?auto_43282 - BLOCK
      ?auto_43285 - BLOCK
      ?auto_43283 - BLOCK
      ?auto_43281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43284 ?auto_43280 ) ( ON-TABLE ?auto_43279 ) ( ON ?auto_43280 ?auto_43279 ) ( not ( = ?auto_43279 ?auto_43280 ) ) ( not ( = ?auto_43279 ?auto_43284 ) ) ( not ( = ?auto_43280 ?auto_43284 ) ) ( not ( = ?auto_43279 ?auto_43282 ) ) ( not ( = ?auto_43279 ?auto_43285 ) ) ( not ( = ?auto_43280 ?auto_43282 ) ) ( not ( = ?auto_43280 ?auto_43285 ) ) ( not ( = ?auto_43284 ?auto_43282 ) ) ( not ( = ?auto_43284 ?auto_43285 ) ) ( not ( = ?auto_43282 ?auto_43285 ) ) ( ON ?auto_43282 ?auto_43284 ) ( not ( = ?auto_43283 ?auto_43281 ) ) ( not ( = ?auto_43283 ?auto_43285 ) ) ( not ( = ?auto_43281 ?auto_43285 ) ) ( not ( = ?auto_43279 ?auto_43281 ) ) ( not ( = ?auto_43279 ?auto_43283 ) ) ( not ( = ?auto_43280 ?auto_43281 ) ) ( not ( = ?auto_43280 ?auto_43283 ) ) ( not ( = ?auto_43284 ?auto_43281 ) ) ( not ( = ?auto_43284 ?auto_43283 ) ) ( not ( = ?auto_43282 ?auto_43281 ) ) ( not ( = ?auto_43282 ?auto_43283 ) ) ( ON ?auto_43285 ?auto_43282 ) ( ON ?auto_43281 ?auto_43285 ) ( ON ?auto_43283 ?auto_43281 ) ( CLEAR ?auto_43283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43279 ?auto_43280 ?auto_43284 ?auto_43282 ?auto_43285 ?auto_43281 )
      ( MAKE-2PILE ?auto_43279 ?auto_43280 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43291 - BLOCK
      ?auto_43292 - BLOCK
      ?auto_43293 - BLOCK
      ?auto_43294 - BLOCK
      ?auto_43295 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43295 ) ( CLEAR ?auto_43294 ) ( ON-TABLE ?auto_43291 ) ( ON ?auto_43292 ?auto_43291 ) ( ON ?auto_43293 ?auto_43292 ) ( ON ?auto_43294 ?auto_43293 ) ( not ( = ?auto_43291 ?auto_43292 ) ) ( not ( = ?auto_43291 ?auto_43293 ) ) ( not ( = ?auto_43291 ?auto_43294 ) ) ( not ( = ?auto_43291 ?auto_43295 ) ) ( not ( = ?auto_43292 ?auto_43293 ) ) ( not ( = ?auto_43292 ?auto_43294 ) ) ( not ( = ?auto_43292 ?auto_43295 ) ) ( not ( = ?auto_43293 ?auto_43294 ) ) ( not ( = ?auto_43293 ?auto_43295 ) ) ( not ( = ?auto_43294 ?auto_43295 ) ) )
    :subtasks
    ( ( !STACK ?auto_43295 ?auto_43294 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43296 - BLOCK
      ?auto_43297 - BLOCK
      ?auto_43298 - BLOCK
      ?auto_43299 - BLOCK
      ?auto_43300 - BLOCK
    )
    :vars
    (
      ?auto_43301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43299 ) ( ON-TABLE ?auto_43296 ) ( ON ?auto_43297 ?auto_43296 ) ( ON ?auto_43298 ?auto_43297 ) ( ON ?auto_43299 ?auto_43298 ) ( not ( = ?auto_43296 ?auto_43297 ) ) ( not ( = ?auto_43296 ?auto_43298 ) ) ( not ( = ?auto_43296 ?auto_43299 ) ) ( not ( = ?auto_43296 ?auto_43300 ) ) ( not ( = ?auto_43297 ?auto_43298 ) ) ( not ( = ?auto_43297 ?auto_43299 ) ) ( not ( = ?auto_43297 ?auto_43300 ) ) ( not ( = ?auto_43298 ?auto_43299 ) ) ( not ( = ?auto_43298 ?auto_43300 ) ) ( not ( = ?auto_43299 ?auto_43300 ) ) ( ON ?auto_43300 ?auto_43301 ) ( CLEAR ?auto_43300 ) ( HAND-EMPTY ) ( not ( = ?auto_43296 ?auto_43301 ) ) ( not ( = ?auto_43297 ?auto_43301 ) ) ( not ( = ?auto_43298 ?auto_43301 ) ) ( not ( = ?auto_43299 ?auto_43301 ) ) ( not ( = ?auto_43300 ?auto_43301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43300 ?auto_43301 )
      ( MAKE-5PILE ?auto_43296 ?auto_43297 ?auto_43298 ?auto_43299 ?auto_43300 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43302 - BLOCK
      ?auto_43303 - BLOCK
      ?auto_43304 - BLOCK
      ?auto_43305 - BLOCK
      ?auto_43306 - BLOCK
    )
    :vars
    (
      ?auto_43307 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43302 ) ( ON ?auto_43303 ?auto_43302 ) ( ON ?auto_43304 ?auto_43303 ) ( not ( = ?auto_43302 ?auto_43303 ) ) ( not ( = ?auto_43302 ?auto_43304 ) ) ( not ( = ?auto_43302 ?auto_43305 ) ) ( not ( = ?auto_43302 ?auto_43306 ) ) ( not ( = ?auto_43303 ?auto_43304 ) ) ( not ( = ?auto_43303 ?auto_43305 ) ) ( not ( = ?auto_43303 ?auto_43306 ) ) ( not ( = ?auto_43304 ?auto_43305 ) ) ( not ( = ?auto_43304 ?auto_43306 ) ) ( not ( = ?auto_43305 ?auto_43306 ) ) ( ON ?auto_43306 ?auto_43307 ) ( CLEAR ?auto_43306 ) ( not ( = ?auto_43302 ?auto_43307 ) ) ( not ( = ?auto_43303 ?auto_43307 ) ) ( not ( = ?auto_43304 ?auto_43307 ) ) ( not ( = ?auto_43305 ?auto_43307 ) ) ( not ( = ?auto_43306 ?auto_43307 ) ) ( HOLDING ?auto_43305 ) ( CLEAR ?auto_43304 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43302 ?auto_43303 ?auto_43304 ?auto_43305 )
      ( MAKE-5PILE ?auto_43302 ?auto_43303 ?auto_43304 ?auto_43305 ?auto_43306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43308 - BLOCK
      ?auto_43309 - BLOCK
      ?auto_43310 - BLOCK
      ?auto_43311 - BLOCK
      ?auto_43312 - BLOCK
    )
    :vars
    (
      ?auto_43313 - BLOCK
      ?auto_43314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43308 ) ( ON ?auto_43309 ?auto_43308 ) ( ON ?auto_43310 ?auto_43309 ) ( not ( = ?auto_43308 ?auto_43309 ) ) ( not ( = ?auto_43308 ?auto_43310 ) ) ( not ( = ?auto_43308 ?auto_43311 ) ) ( not ( = ?auto_43308 ?auto_43312 ) ) ( not ( = ?auto_43309 ?auto_43310 ) ) ( not ( = ?auto_43309 ?auto_43311 ) ) ( not ( = ?auto_43309 ?auto_43312 ) ) ( not ( = ?auto_43310 ?auto_43311 ) ) ( not ( = ?auto_43310 ?auto_43312 ) ) ( not ( = ?auto_43311 ?auto_43312 ) ) ( ON ?auto_43312 ?auto_43313 ) ( not ( = ?auto_43308 ?auto_43313 ) ) ( not ( = ?auto_43309 ?auto_43313 ) ) ( not ( = ?auto_43310 ?auto_43313 ) ) ( not ( = ?auto_43311 ?auto_43313 ) ) ( not ( = ?auto_43312 ?auto_43313 ) ) ( CLEAR ?auto_43310 ) ( ON ?auto_43311 ?auto_43312 ) ( CLEAR ?auto_43311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43314 ) ( ON ?auto_43313 ?auto_43314 ) ( not ( = ?auto_43314 ?auto_43313 ) ) ( not ( = ?auto_43314 ?auto_43312 ) ) ( not ( = ?auto_43314 ?auto_43311 ) ) ( not ( = ?auto_43308 ?auto_43314 ) ) ( not ( = ?auto_43309 ?auto_43314 ) ) ( not ( = ?auto_43310 ?auto_43314 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43314 ?auto_43313 ?auto_43312 )
      ( MAKE-5PILE ?auto_43308 ?auto_43309 ?auto_43310 ?auto_43311 ?auto_43312 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43315 - BLOCK
      ?auto_43316 - BLOCK
      ?auto_43317 - BLOCK
      ?auto_43318 - BLOCK
      ?auto_43319 - BLOCK
    )
    :vars
    (
      ?auto_43320 - BLOCK
      ?auto_43321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43315 ) ( ON ?auto_43316 ?auto_43315 ) ( not ( = ?auto_43315 ?auto_43316 ) ) ( not ( = ?auto_43315 ?auto_43317 ) ) ( not ( = ?auto_43315 ?auto_43318 ) ) ( not ( = ?auto_43315 ?auto_43319 ) ) ( not ( = ?auto_43316 ?auto_43317 ) ) ( not ( = ?auto_43316 ?auto_43318 ) ) ( not ( = ?auto_43316 ?auto_43319 ) ) ( not ( = ?auto_43317 ?auto_43318 ) ) ( not ( = ?auto_43317 ?auto_43319 ) ) ( not ( = ?auto_43318 ?auto_43319 ) ) ( ON ?auto_43319 ?auto_43320 ) ( not ( = ?auto_43315 ?auto_43320 ) ) ( not ( = ?auto_43316 ?auto_43320 ) ) ( not ( = ?auto_43317 ?auto_43320 ) ) ( not ( = ?auto_43318 ?auto_43320 ) ) ( not ( = ?auto_43319 ?auto_43320 ) ) ( ON ?auto_43318 ?auto_43319 ) ( CLEAR ?auto_43318 ) ( ON-TABLE ?auto_43321 ) ( ON ?auto_43320 ?auto_43321 ) ( not ( = ?auto_43321 ?auto_43320 ) ) ( not ( = ?auto_43321 ?auto_43319 ) ) ( not ( = ?auto_43321 ?auto_43318 ) ) ( not ( = ?auto_43315 ?auto_43321 ) ) ( not ( = ?auto_43316 ?auto_43321 ) ) ( not ( = ?auto_43317 ?auto_43321 ) ) ( HOLDING ?auto_43317 ) ( CLEAR ?auto_43316 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43315 ?auto_43316 ?auto_43317 )
      ( MAKE-5PILE ?auto_43315 ?auto_43316 ?auto_43317 ?auto_43318 ?auto_43319 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43322 - BLOCK
      ?auto_43323 - BLOCK
      ?auto_43324 - BLOCK
      ?auto_43325 - BLOCK
      ?auto_43326 - BLOCK
    )
    :vars
    (
      ?auto_43327 - BLOCK
      ?auto_43328 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43322 ) ( ON ?auto_43323 ?auto_43322 ) ( not ( = ?auto_43322 ?auto_43323 ) ) ( not ( = ?auto_43322 ?auto_43324 ) ) ( not ( = ?auto_43322 ?auto_43325 ) ) ( not ( = ?auto_43322 ?auto_43326 ) ) ( not ( = ?auto_43323 ?auto_43324 ) ) ( not ( = ?auto_43323 ?auto_43325 ) ) ( not ( = ?auto_43323 ?auto_43326 ) ) ( not ( = ?auto_43324 ?auto_43325 ) ) ( not ( = ?auto_43324 ?auto_43326 ) ) ( not ( = ?auto_43325 ?auto_43326 ) ) ( ON ?auto_43326 ?auto_43327 ) ( not ( = ?auto_43322 ?auto_43327 ) ) ( not ( = ?auto_43323 ?auto_43327 ) ) ( not ( = ?auto_43324 ?auto_43327 ) ) ( not ( = ?auto_43325 ?auto_43327 ) ) ( not ( = ?auto_43326 ?auto_43327 ) ) ( ON ?auto_43325 ?auto_43326 ) ( ON-TABLE ?auto_43328 ) ( ON ?auto_43327 ?auto_43328 ) ( not ( = ?auto_43328 ?auto_43327 ) ) ( not ( = ?auto_43328 ?auto_43326 ) ) ( not ( = ?auto_43328 ?auto_43325 ) ) ( not ( = ?auto_43322 ?auto_43328 ) ) ( not ( = ?auto_43323 ?auto_43328 ) ) ( not ( = ?auto_43324 ?auto_43328 ) ) ( CLEAR ?auto_43323 ) ( ON ?auto_43324 ?auto_43325 ) ( CLEAR ?auto_43324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43328 ?auto_43327 ?auto_43326 ?auto_43325 )
      ( MAKE-5PILE ?auto_43322 ?auto_43323 ?auto_43324 ?auto_43325 ?auto_43326 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43329 - BLOCK
      ?auto_43330 - BLOCK
      ?auto_43331 - BLOCK
      ?auto_43332 - BLOCK
      ?auto_43333 - BLOCK
    )
    :vars
    (
      ?auto_43334 - BLOCK
      ?auto_43335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43329 ) ( not ( = ?auto_43329 ?auto_43330 ) ) ( not ( = ?auto_43329 ?auto_43331 ) ) ( not ( = ?auto_43329 ?auto_43332 ) ) ( not ( = ?auto_43329 ?auto_43333 ) ) ( not ( = ?auto_43330 ?auto_43331 ) ) ( not ( = ?auto_43330 ?auto_43332 ) ) ( not ( = ?auto_43330 ?auto_43333 ) ) ( not ( = ?auto_43331 ?auto_43332 ) ) ( not ( = ?auto_43331 ?auto_43333 ) ) ( not ( = ?auto_43332 ?auto_43333 ) ) ( ON ?auto_43333 ?auto_43334 ) ( not ( = ?auto_43329 ?auto_43334 ) ) ( not ( = ?auto_43330 ?auto_43334 ) ) ( not ( = ?auto_43331 ?auto_43334 ) ) ( not ( = ?auto_43332 ?auto_43334 ) ) ( not ( = ?auto_43333 ?auto_43334 ) ) ( ON ?auto_43332 ?auto_43333 ) ( ON-TABLE ?auto_43335 ) ( ON ?auto_43334 ?auto_43335 ) ( not ( = ?auto_43335 ?auto_43334 ) ) ( not ( = ?auto_43335 ?auto_43333 ) ) ( not ( = ?auto_43335 ?auto_43332 ) ) ( not ( = ?auto_43329 ?auto_43335 ) ) ( not ( = ?auto_43330 ?auto_43335 ) ) ( not ( = ?auto_43331 ?auto_43335 ) ) ( ON ?auto_43331 ?auto_43332 ) ( CLEAR ?auto_43331 ) ( HOLDING ?auto_43330 ) ( CLEAR ?auto_43329 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43329 ?auto_43330 )
      ( MAKE-5PILE ?auto_43329 ?auto_43330 ?auto_43331 ?auto_43332 ?auto_43333 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43336 - BLOCK
      ?auto_43337 - BLOCK
      ?auto_43338 - BLOCK
      ?auto_43339 - BLOCK
      ?auto_43340 - BLOCK
    )
    :vars
    (
      ?auto_43342 - BLOCK
      ?auto_43341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43336 ) ( not ( = ?auto_43336 ?auto_43337 ) ) ( not ( = ?auto_43336 ?auto_43338 ) ) ( not ( = ?auto_43336 ?auto_43339 ) ) ( not ( = ?auto_43336 ?auto_43340 ) ) ( not ( = ?auto_43337 ?auto_43338 ) ) ( not ( = ?auto_43337 ?auto_43339 ) ) ( not ( = ?auto_43337 ?auto_43340 ) ) ( not ( = ?auto_43338 ?auto_43339 ) ) ( not ( = ?auto_43338 ?auto_43340 ) ) ( not ( = ?auto_43339 ?auto_43340 ) ) ( ON ?auto_43340 ?auto_43342 ) ( not ( = ?auto_43336 ?auto_43342 ) ) ( not ( = ?auto_43337 ?auto_43342 ) ) ( not ( = ?auto_43338 ?auto_43342 ) ) ( not ( = ?auto_43339 ?auto_43342 ) ) ( not ( = ?auto_43340 ?auto_43342 ) ) ( ON ?auto_43339 ?auto_43340 ) ( ON-TABLE ?auto_43341 ) ( ON ?auto_43342 ?auto_43341 ) ( not ( = ?auto_43341 ?auto_43342 ) ) ( not ( = ?auto_43341 ?auto_43340 ) ) ( not ( = ?auto_43341 ?auto_43339 ) ) ( not ( = ?auto_43336 ?auto_43341 ) ) ( not ( = ?auto_43337 ?auto_43341 ) ) ( not ( = ?auto_43338 ?auto_43341 ) ) ( ON ?auto_43338 ?auto_43339 ) ( CLEAR ?auto_43336 ) ( ON ?auto_43337 ?auto_43338 ) ( CLEAR ?auto_43337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43341 ?auto_43342 ?auto_43340 ?auto_43339 ?auto_43338 )
      ( MAKE-5PILE ?auto_43336 ?auto_43337 ?auto_43338 ?auto_43339 ?auto_43340 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43343 - BLOCK
      ?auto_43344 - BLOCK
      ?auto_43345 - BLOCK
      ?auto_43346 - BLOCK
      ?auto_43347 - BLOCK
    )
    :vars
    (
      ?auto_43348 - BLOCK
      ?auto_43349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43343 ?auto_43344 ) ) ( not ( = ?auto_43343 ?auto_43345 ) ) ( not ( = ?auto_43343 ?auto_43346 ) ) ( not ( = ?auto_43343 ?auto_43347 ) ) ( not ( = ?auto_43344 ?auto_43345 ) ) ( not ( = ?auto_43344 ?auto_43346 ) ) ( not ( = ?auto_43344 ?auto_43347 ) ) ( not ( = ?auto_43345 ?auto_43346 ) ) ( not ( = ?auto_43345 ?auto_43347 ) ) ( not ( = ?auto_43346 ?auto_43347 ) ) ( ON ?auto_43347 ?auto_43348 ) ( not ( = ?auto_43343 ?auto_43348 ) ) ( not ( = ?auto_43344 ?auto_43348 ) ) ( not ( = ?auto_43345 ?auto_43348 ) ) ( not ( = ?auto_43346 ?auto_43348 ) ) ( not ( = ?auto_43347 ?auto_43348 ) ) ( ON ?auto_43346 ?auto_43347 ) ( ON-TABLE ?auto_43349 ) ( ON ?auto_43348 ?auto_43349 ) ( not ( = ?auto_43349 ?auto_43348 ) ) ( not ( = ?auto_43349 ?auto_43347 ) ) ( not ( = ?auto_43349 ?auto_43346 ) ) ( not ( = ?auto_43343 ?auto_43349 ) ) ( not ( = ?auto_43344 ?auto_43349 ) ) ( not ( = ?auto_43345 ?auto_43349 ) ) ( ON ?auto_43345 ?auto_43346 ) ( ON ?auto_43344 ?auto_43345 ) ( CLEAR ?auto_43344 ) ( HOLDING ?auto_43343 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43343 )
      ( MAKE-5PILE ?auto_43343 ?auto_43344 ?auto_43345 ?auto_43346 ?auto_43347 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43350 - BLOCK
      ?auto_43351 - BLOCK
      ?auto_43352 - BLOCK
      ?auto_43353 - BLOCK
      ?auto_43354 - BLOCK
    )
    :vars
    (
      ?auto_43356 - BLOCK
      ?auto_43355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43350 ?auto_43351 ) ) ( not ( = ?auto_43350 ?auto_43352 ) ) ( not ( = ?auto_43350 ?auto_43353 ) ) ( not ( = ?auto_43350 ?auto_43354 ) ) ( not ( = ?auto_43351 ?auto_43352 ) ) ( not ( = ?auto_43351 ?auto_43353 ) ) ( not ( = ?auto_43351 ?auto_43354 ) ) ( not ( = ?auto_43352 ?auto_43353 ) ) ( not ( = ?auto_43352 ?auto_43354 ) ) ( not ( = ?auto_43353 ?auto_43354 ) ) ( ON ?auto_43354 ?auto_43356 ) ( not ( = ?auto_43350 ?auto_43356 ) ) ( not ( = ?auto_43351 ?auto_43356 ) ) ( not ( = ?auto_43352 ?auto_43356 ) ) ( not ( = ?auto_43353 ?auto_43356 ) ) ( not ( = ?auto_43354 ?auto_43356 ) ) ( ON ?auto_43353 ?auto_43354 ) ( ON-TABLE ?auto_43355 ) ( ON ?auto_43356 ?auto_43355 ) ( not ( = ?auto_43355 ?auto_43356 ) ) ( not ( = ?auto_43355 ?auto_43354 ) ) ( not ( = ?auto_43355 ?auto_43353 ) ) ( not ( = ?auto_43350 ?auto_43355 ) ) ( not ( = ?auto_43351 ?auto_43355 ) ) ( not ( = ?auto_43352 ?auto_43355 ) ) ( ON ?auto_43352 ?auto_43353 ) ( ON ?auto_43351 ?auto_43352 ) ( ON ?auto_43350 ?auto_43351 ) ( CLEAR ?auto_43350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43355 ?auto_43356 ?auto_43354 ?auto_43353 ?auto_43352 ?auto_43351 )
      ( MAKE-5PILE ?auto_43350 ?auto_43351 ?auto_43352 ?auto_43353 ?auto_43354 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43358 - BLOCK
    )
    :vars
    (
      ?auto_43359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43359 ?auto_43358 ) ( CLEAR ?auto_43359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43358 ) ( not ( = ?auto_43358 ?auto_43359 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43359 ?auto_43358 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43360 - BLOCK
    )
    :vars
    (
      ?auto_43361 - BLOCK
      ?auto_43362 - BLOCK
      ?auto_43363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43361 ?auto_43360 ) ( CLEAR ?auto_43361 ) ( ON-TABLE ?auto_43360 ) ( not ( = ?auto_43360 ?auto_43361 ) ) ( HOLDING ?auto_43362 ) ( CLEAR ?auto_43363 ) ( not ( = ?auto_43360 ?auto_43362 ) ) ( not ( = ?auto_43360 ?auto_43363 ) ) ( not ( = ?auto_43361 ?auto_43362 ) ) ( not ( = ?auto_43361 ?auto_43363 ) ) ( not ( = ?auto_43362 ?auto_43363 ) ) )
    :subtasks
    ( ( !STACK ?auto_43362 ?auto_43363 )
      ( MAKE-1PILE ?auto_43360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43364 - BLOCK
    )
    :vars
    (
      ?auto_43365 - BLOCK
      ?auto_43366 - BLOCK
      ?auto_43367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43365 ?auto_43364 ) ( ON-TABLE ?auto_43364 ) ( not ( = ?auto_43364 ?auto_43365 ) ) ( CLEAR ?auto_43366 ) ( not ( = ?auto_43364 ?auto_43367 ) ) ( not ( = ?auto_43364 ?auto_43366 ) ) ( not ( = ?auto_43365 ?auto_43367 ) ) ( not ( = ?auto_43365 ?auto_43366 ) ) ( not ( = ?auto_43367 ?auto_43366 ) ) ( ON ?auto_43367 ?auto_43365 ) ( CLEAR ?auto_43367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43364 ?auto_43365 )
      ( MAKE-1PILE ?auto_43364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43368 - BLOCK
    )
    :vars
    (
      ?auto_43369 - BLOCK
      ?auto_43371 - BLOCK
      ?auto_43370 - BLOCK
      ?auto_43374 - BLOCK
      ?auto_43372 - BLOCK
      ?auto_43373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43369 ?auto_43368 ) ( ON-TABLE ?auto_43368 ) ( not ( = ?auto_43368 ?auto_43369 ) ) ( not ( = ?auto_43368 ?auto_43371 ) ) ( not ( = ?auto_43368 ?auto_43370 ) ) ( not ( = ?auto_43369 ?auto_43371 ) ) ( not ( = ?auto_43369 ?auto_43370 ) ) ( not ( = ?auto_43371 ?auto_43370 ) ) ( ON ?auto_43371 ?auto_43369 ) ( CLEAR ?auto_43371 ) ( HOLDING ?auto_43370 ) ( CLEAR ?auto_43374 ) ( ON-TABLE ?auto_43372 ) ( ON ?auto_43373 ?auto_43372 ) ( ON ?auto_43374 ?auto_43373 ) ( not ( = ?auto_43372 ?auto_43373 ) ) ( not ( = ?auto_43372 ?auto_43374 ) ) ( not ( = ?auto_43372 ?auto_43370 ) ) ( not ( = ?auto_43373 ?auto_43374 ) ) ( not ( = ?auto_43373 ?auto_43370 ) ) ( not ( = ?auto_43374 ?auto_43370 ) ) ( not ( = ?auto_43368 ?auto_43374 ) ) ( not ( = ?auto_43368 ?auto_43372 ) ) ( not ( = ?auto_43368 ?auto_43373 ) ) ( not ( = ?auto_43369 ?auto_43374 ) ) ( not ( = ?auto_43369 ?auto_43372 ) ) ( not ( = ?auto_43369 ?auto_43373 ) ) ( not ( = ?auto_43371 ?auto_43374 ) ) ( not ( = ?auto_43371 ?auto_43372 ) ) ( not ( = ?auto_43371 ?auto_43373 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43372 ?auto_43373 ?auto_43374 ?auto_43370 )
      ( MAKE-1PILE ?auto_43368 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43375 - BLOCK
    )
    :vars
    (
      ?auto_43381 - BLOCK
      ?auto_43380 - BLOCK
      ?auto_43376 - BLOCK
      ?auto_43379 - BLOCK
      ?auto_43378 - BLOCK
      ?auto_43377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43381 ?auto_43375 ) ( ON-TABLE ?auto_43375 ) ( not ( = ?auto_43375 ?auto_43381 ) ) ( not ( = ?auto_43375 ?auto_43380 ) ) ( not ( = ?auto_43375 ?auto_43376 ) ) ( not ( = ?auto_43381 ?auto_43380 ) ) ( not ( = ?auto_43381 ?auto_43376 ) ) ( not ( = ?auto_43380 ?auto_43376 ) ) ( ON ?auto_43380 ?auto_43381 ) ( CLEAR ?auto_43379 ) ( ON-TABLE ?auto_43378 ) ( ON ?auto_43377 ?auto_43378 ) ( ON ?auto_43379 ?auto_43377 ) ( not ( = ?auto_43378 ?auto_43377 ) ) ( not ( = ?auto_43378 ?auto_43379 ) ) ( not ( = ?auto_43378 ?auto_43376 ) ) ( not ( = ?auto_43377 ?auto_43379 ) ) ( not ( = ?auto_43377 ?auto_43376 ) ) ( not ( = ?auto_43379 ?auto_43376 ) ) ( not ( = ?auto_43375 ?auto_43379 ) ) ( not ( = ?auto_43375 ?auto_43378 ) ) ( not ( = ?auto_43375 ?auto_43377 ) ) ( not ( = ?auto_43381 ?auto_43379 ) ) ( not ( = ?auto_43381 ?auto_43378 ) ) ( not ( = ?auto_43381 ?auto_43377 ) ) ( not ( = ?auto_43380 ?auto_43379 ) ) ( not ( = ?auto_43380 ?auto_43378 ) ) ( not ( = ?auto_43380 ?auto_43377 ) ) ( ON ?auto_43376 ?auto_43380 ) ( CLEAR ?auto_43376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43375 ?auto_43381 ?auto_43380 )
      ( MAKE-1PILE ?auto_43375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43382 - BLOCK
    )
    :vars
    (
      ?auto_43385 - BLOCK
      ?auto_43384 - BLOCK
      ?auto_43386 - BLOCK
      ?auto_43388 - BLOCK
      ?auto_43383 - BLOCK
      ?auto_43387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43385 ?auto_43382 ) ( ON-TABLE ?auto_43382 ) ( not ( = ?auto_43382 ?auto_43385 ) ) ( not ( = ?auto_43382 ?auto_43384 ) ) ( not ( = ?auto_43382 ?auto_43386 ) ) ( not ( = ?auto_43385 ?auto_43384 ) ) ( not ( = ?auto_43385 ?auto_43386 ) ) ( not ( = ?auto_43384 ?auto_43386 ) ) ( ON ?auto_43384 ?auto_43385 ) ( ON-TABLE ?auto_43388 ) ( ON ?auto_43383 ?auto_43388 ) ( not ( = ?auto_43388 ?auto_43383 ) ) ( not ( = ?auto_43388 ?auto_43387 ) ) ( not ( = ?auto_43388 ?auto_43386 ) ) ( not ( = ?auto_43383 ?auto_43387 ) ) ( not ( = ?auto_43383 ?auto_43386 ) ) ( not ( = ?auto_43387 ?auto_43386 ) ) ( not ( = ?auto_43382 ?auto_43387 ) ) ( not ( = ?auto_43382 ?auto_43388 ) ) ( not ( = ?auto_43382 ?auto_43383 ) ) ( not ( = ?auto_43385 ?auto_43387 ) ) ( not ( = ?auto_43385 ?auto_43388 ) ) ( not ( = ?auto_43385 ?auto_43383 ) ) ( not ( = ?auto_43384 ?auto_43387 ) ) ( not ( = ?auto_43384 ?auto_43388 ) ) ( not ( = ?auto_43384 ?auto_43383 ) ) ( ON ?auto_43386 ?auto_43384 ) ( CLEAR ?auto_43386 ) ( HOLDING ?auto_43387 ) ( CLEAR ?auto_43383 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43388 ?auto_43383 ?auto_43387 )
      ( MAKE-1PILE ?auto_43382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43389 - BLOCK
    )
    :vars
    (
      ?auto_43395 - BLOCK
      ?auto_43392 - BLOCK
      ?auto_43393 - BLOCK
      ?auto_43390 - BLOCK
      ?auto_43394 - BLOCK
      ?auto_43391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43395 ?auto_43389 ) ( ON-TABLE ?auto_43389 ) ( not ( = ?auto_43389 ?auto_43395 ) ) ( not ( = ?auto_43389 ?auto_43392 ) ) ( not ( = ?auto_43389 ?auto_43393 ) ) ( not ( = ?auto_43395 ?auto_43392 ) ) ( not ( = ?auto_43395 ?auto_43393 ) ) ( not ( = ?auto_43392 ?auto_43393 ) ) ( ON ?auto_43392 ?auto_43395 ) ( ON-TABLE ?auto_43390 ) ( ON ?auto_43394 ?auto_43390 ) ( not ( = ?auto_43390 ?auto_43394 ) ) ( not ( = ?auto_43390 ?auto_43391 ) ) ( not ( = ?auto_43390 ?auto_43393 ) ) ( not ( = ?auto_43394 ?auto_43391 ) ) ( not ( = ?auto_43394 ?auto_43393 ) ) ( not ( = ?auto_43391 ?auto_43393 ) ) ( not ( = ?auto_43389 ?auto_43391 ) ) ( not ( = ?auto_43389 ?auto_43390 ) ) ( not ( = ?auto_43389 ?auto_43394 ) ) ( not ( = ?auto_43395 ?auto_43391 ) ) ( not ( = ?auto_43395 ?auto_43390 ) ) ( not ( = ?auto_43395 ?auto_43394 ) ) ( not ( = ?auto_43392 ?auto_43391 ) ) ( not ( = ?auto_43392 ?auto_43390 ) ) ( not ( = ?auto_43392 ?auto_43394 ) ) ( ON ?auto_43393 ?auto_43392 ) ( CLEAR ?auto_43394 ) ( ON ?auto_43391 ?auto_43393 ) ( CLEAR ?auto_43391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43389 ?auto_43395 ?auto_43392 ?auto_43393 )
      ( MAKE-1PILE ?auto_43389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43396 - BLOCK
    )
    :vars
    (
      ?auto_43399 - BLOCK
      ?auto_43398 - BLOCK
      ?auto_43397 - BLOCK
      ?auto_43401 - BLOCK
      ?auto_43400 - BLOCK
      ?auto_43402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43399 ?auto_43396 ) ( ON-TABLE ?auto_43396 ) ( not ( = ?auto_43396 ?auto_43399 ) ) ( not ( = ?auto_43396 ?auto_43398 ) ) ( not ( = ?auto_43396 ?auto_43397 ) ) ( not ( = ?auto_43399 ?auto_43398 ) ) ( not ( = ?auto_43399 ?auto_43397 ) ) ( not ( = ?auto_43398 ?auto_43397 ) ) ( ON ?auto_43398 ?auto_43399 ) ( ON-TABLE ?auto_43401 ) ( not ( = ?auto_43401 ?auto_43400 ) ) ( not ( = ?auto_43401 ?auto_43402 ) ) ( not ( = ?auto_43401 ?auto_43397 ) ) ( not ( = ?auto_43400 ?auto_43402 ) ) ( not ( = ?auto_43400 ?auto_43397 ) ) ( not ( = ?auto_43402 ?auto_43397 ) ) ( not ( = ?auto_43396 ?auto_43402 ) ) ( not ( = ?auto_43396 ?auto_43401 ) ) ( not ( = ?auto_43396 ?auto_43400 ) ) ( not ( = ?auto_43399 ?auto_43402 ) ) ( not ( = ?auto_43399 ?auto_43401 ) ) ( not ( = ?auto_43399 ?auto_43400 ) ) ( not ( = ?auto_43398 ?auto_43402 ) ) ( not ( = ?auto_43398 ?auto_43401 ) ) ( not ( = ?auto_43398 ?auto_43400 ) ) ( ON ?auto_43397 ?auto_43398 ) ( ON ?auto_43402 ?auto_43397 ) ( CLEAR ?auto_43402 ) ( HOLDING ?auto_43400 ) ( CLEAR ?auto_43401 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43401 ?auto_43400 )
      ( MAKE-1PILE ?auto_43396 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43403 - BLOCK
    )
    :vars
    (
      ?auto_43406 - BLOCK
      ?auto_43409 - BLOCK
      ?auto_43405 - BLOCK
      ?auto_43407 - BLOCK
      ?auto_43408 - BLOCK
      ?auto_43404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43406 ?auto_43403 ) ( ON-TABLE ?auto_43403 ) ( not ( = ?auto_43403 ?auto_43406 ) ) ( not ( = ?auto_43403 ?auto_43409 ) ) ( not ( = ?auto_43403 ?auto_43405 ) ) ( not ( = ?auto_43406 ?auto_43409 ) ) ( not ( = ?auto_43406 ?auto_43405 ) ) ( not ( = ?auto_43409 ?auto_43405 ) ) ( ON ?auto_43409 ?auto_43406 ) ( ON-TABLE ?auto_43407 ) ( not ( = ?auto_43407 ?auto_43408 ) ) ( not ( = ?auto_43407 ?auto_43404 ) ) ( not ( = ?auto_43407 ?auto_43405 ) ) ( not ( = ?auto_43408 ?auto_43404 ) ) ( not ( = ?auto_43408 ?auto_43405 ) ) ( not ( = ?auto_43404 ?auto_43405 ) ) ( not ( = ?auto_43403 ?auto_43404 ) ) ( not ( = ?auto_43403 ?auto_43407 ) ) ( not ( = ?auto_43403 ?auto_43408 ) ) ( not ( = ?auto_43406 ?auto_43404 ) ) ( not ( = ?auto_43406 ?auto_43407 ) ) ( not ( = ?auto_43406 ?auto_43408 ) ) ( not ( = ?auto_43409 ?auto_43404 ) ) ( not ( = ?auto_43409 ?auto_43407 ) ) ( not ( = ?auto_43409 ?auto_43408 ) ) ( ON ?auto_43405 ?auto_43409 ) ( ON ?auto_43404 ?auto_43405 ) ( CLEAR ?auto_43407 ) ( ON ?auto_43408 ?auto_43404 ) ( CLEAR ?auto_43408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43403 ?auto_43406 ?auto_43409 ?auto_43405 ?auto_43404 )
      ( MAKE-1PILE ?auto_43403 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43410 - BLOCK
    )
    :vars
    (
      ?auto_43411 - BLOCK
      ?auto_43412 - BLOCK
      ?auto_43416 - BLOCK
      ?auto_43413 - BLOCK
      ?auto_43415 - BLOCK
      ?auto_43414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43411 ?auto_43410 ) ( ON-TABLE ?auto_43410 ) ( not ( = ?auto_43410 ?auto_43411 ) ) ( not ( = ?auto_43410 ?auto_43412 ) ) ( not ( = ?auto_43410 ?auto_43416 ) ) ( not ( = ?auto_43411 ?auto_43412 ) ) ( not ( = ?auto_43411 ?auto_43416 ) ) ( not ( = ?auto_43412 ?auto_43416 ) ) ( ON ?auto_43412 ?auto_43411 ) ( not ( = ?auto_43413 ?auto_43415 ) ) ( not ( = ?auto_43413 ?auto_43414 ) ) ( not ( = ?auto_43413 ?auto_43416 ) ) ( not ( = ?auto_43415 ?auto_43414 ) ) ( not ( = ?auto_43415 ?auto_43416 ) ) ( not ( = ?auto_43414 ?auto_43416 ) ) ( not ( = ?auto_43410 ?auto_43414 ) ) ( not ( = ?auto_43410 ?auto_43413 ) ) ( not ( = ?auto_43410 ?auto_43415 ) ) ( not ( = ?auto_43411 ?auto_43414 ) ) ( not ( = ?auto_43411 ?auto_43413 ) ) ( not ( = ?auto_43411 ?auto_43415 ) ) ( not ( = ?auto_43412 ?auto_43414 ) ) ( not ( = ?auto_43412 ?auto_43413 ) ) ( not ( = ?auto_43412 ?auto_43415 ) ) ( ON ?auto_43416 ?auto_43412 ) ( ON ?auto_43414 ?auto_43416 ) ( ON ?auto_43415 ?auto_43414 ) ( CLEAR ?auto_43415 ) ( HOLDING ?auto_43413 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43413 )
      ( MAKE-1PILE ?auto_43410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43417 - BLOCK
    )
    :vars
    (
      ?auto_43423 - BLOCK
      ?auto_43419 - BLOCK
      ?auto_43418 - BLOCK
      ?auto_43420 - BLOCK
      ?auto_43422 - BLOCK
      ?auto_43421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43423 ?auto_43417 ) ( ON-TABLE ?auto_43417 ) ( not ( = ?auto_43417 ?auto_43423 ) ) ( not ( = ?auto_43417 ?auto_43419 ) ) ( not ( = ?auto_43417 ?auto_43418 ) ) ( not ( = ?auto_43423 ?auto_43419 ) ) ( not ( = ?auto_43423 ?auto_43418 ) ) ( not ( = ?auto_43419 ?auto_43418 ) ) ( ON ?auto_43419 ?auto_43423 ) ( not ( = ?auto_43420 ?auto_43422 ) ) ( not ( = ?auto_43420 ?auto_43421 ) ) ( not ( = ?auto_43420 ?auto_43418 ) ) ( not ( = ?auto_43422 ?auto_43421 ) ) ( not ( = ?auto_43422 ?auto_43418 ) ) ( not ( = ?auto_43421 ?auto_43418 ) ) ( not ( = ?auto_43417 ?auto_43421 ) ) ( not ( = ?auto_43417 ?auto_43420 ) ) ( not ( = ?auto_43417 ?auto_43422 ) ) ( not ( = ?auto_43423 ?auto_43421 ) ) ( not ( = ?auto_43423 ?auto_43420 ) ) ( not ( = ?auto_43423 ?auto_43422 ) ) ( not ( = ?auto_43419 ?auto_43421 ) ) ( not ( = ?auto_43419 ?auto_43420 ) ) ( not ( = ?auto_43419 ?auto_43422 ) ) ( ON ?auto_43418 ?auto_43419 ) ( ON ?auto_43421 ?auto_43418 ) ( ON ?auto_43422 ?auto_43421 ) ( ON ?auto_43420 ?auto_43422 ) ( CLEAR ?auto_43420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43417 ?auto_43423 ?auto_43419 ?auto_43418 ?auto_43421 ?auto_43422 )
      ( MAKE-1PILE ?auto_43417 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43430 - BLOCK
      ?auto_43431 - BLOCK
      ?auto_43432 - BLOCK
      ?auto_43433 - BLOCK
      ?auto_43434 - BLOCK
      ?auto_43435 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43435 ) ( CLEAR ?auto_43434 ) ( ON-TABLE ?auto_43430 ) ( ON ?auto_43431 ?auto_43430 ) ( ON ?auto_43432 ?auto_43431 ) ( ON ?auto_43433 ?auto_43432 ) ( ON ?auto_43434 ?auto_43433 ) ( not ( = ?auto_43430 ?auto_43431 ) ) ( not ( = ?auto_43430 ?auto_43432 ) ) ( not ( = ?auto_43430 ?auto_43433 ) ) ( not ( = ?auto_43430 ?auto_43434 ) ) ( not ( = ?auto_43430 ?auto_43435 ) ) ( not ( = ?auto_43431 ?auto_43432 ) ) ( not ( = ?auto_43431 ?auto_43433 ) ) ( not ( = ?auto_43431 ?auto_43434 ) ) ( not ( = ?auto_43431 ?auto_43435 ) ) ( not ( = ?auto_43432 ?auto_43433 ) ) ( not ( = ?auto_43432 ?auto_43434 ) ) ( not ( = ?auto_43432 ?auto_43435 ) ) ( not ( = ?auto_43433 ?auto_43434 ) ) ( not ( = ?auto_43433 ?auto_43435 ) ) ( not ( = ?auto_43434 ?auto_43435 ) ) )
    :subtasks
    ( ( !STACK ?auto_43435 ?auto_43434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43436 - BLOCK
      ?auto_43437 - BLOCK
      ?auto_43438 - BLOCK
      ?auto_43439 - BLOCK
      ?auto_43440 - BLOCK
      ?auto_43441 - BLOCK
    )
    :vars
    (
      ?auto_43442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43440 ) ( ON-TABLE ?auto_43436 ) ( ON ?auto_43437 ?auto_43436 ) ( ON ?auto_43438 ?auto_43437 ) ( ON ?auto_43439 ?auto_43438 ) ( ON ?auto_43440 ?auto_43439 ) ( not ( = ?auto_43436 ?auto_43437 ) ) ( not ( = ?auto_43436 ?auto_43438 ) ) ( not ( = ?auto_43436 ?auto_43439 ) ) ( not ( = ?auto_43436 ?auto_43440 ) ) ( not ( = ?auto_43436 ?auto_43441 ) ) ( not ( = ?auto_43437 ?auto_43438 ) ) ( not ( = ?auto_43437 ?auto_43439 ) ) ( not ( = ?auto_43437 ?auto_43440 ) ) ( not ( = ?auto_43437 ?auto_43441 ) ) ( not ( = ?auto_43438 ?auto_43439 ) ) ( not ( = ?auto_43438 ?auto_43440 ) ) ( not ( = ?auto_43438 ?auto_43441 ) ) ( not ( = ?auto_43439 ?auto_43440 ) ) ( not ( = ?auto_43439 ?auto_43441 ) ) ( not ( = ?auto_43440 ?auto_43441 ) ) ( ON ?auto_43441 ?auto_43442 ) ( CLEAR ?auto_43441 ) ( HAND-EMPTY ) ( not ( = ?auto_43436 ?auto_43442 ) ) ( not ( = ?auto_43437 ?auto_43442 ) ) ( not ( = ?auto_43438 ?auto_43442 ) ) ( not ( = ?auto_43439 ?auto_43442 ) ) ( not ( = ?auto_43440 ?auto_43442 ) ) ( not ( = ?auto_43441 ?auto_43442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43441 ?auto_43442 )
      ( MAKE-6PILE ?auto_43436 ?auto_43437 ?auto_43438 ?auto_43439 ?auto_43440 ?auto_43441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43443 - BLOCK
      ?auto_43444 - BLOCK
      ?auto_43445 - BLOCK
      ?auto_43446 - BLOCK
      ?auto_43447 - BLOCK
      ?auto_43448 - BLOCK
    )
    :vars
    (
      ?auto_43449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43443 ) ( ON ?auto_43444 ?auto_43443 ) ( ON ?auto_43445 ?auto_43444 ) ( ON ?auto_43446 ?auto_43445 ) ( not ( = ?auto_43443 ?auto_43444 ) ) ( not ( = ?auto_43443 ?auto_43445 ) ) ( not ( = ?auto_43443 ?auto_43446 ) ) ( not ( = ?auto_43443 ?auto_43447 ) ) ( not ( = ?auto_43443 ?auto_43448 ) ) ( not ( = ?auto_43444 ?auto_43445 ) ) ( not ( = ?auto_43444 ?auto_43446 ) ) ( not ( = ?auto_43444 ?auto_43447 ) ) ( not ( = ?auto_43444 ?auto_43448 ) ) ( not ( = ?auto_43445 ?auto_43446 ) ) ( not ( = ?auto_43445 ?auto_43447 ) ) ( not ( = ?auto_43445 ?auto_43448 ) ) ( not ( = ?auto_43446 ?auto_43447 ) ) ( not ( = ?auto_43446 ?auto_43448 ) ) ( not ( = ?auto_43447 ?auto_43448 ) ) ( ON ?auto_43448 ?auto_43449 ) ( CLEAR ?auto_43448 ) ( not ( = ?auto_43443 ?auto_43449 ) ) ( not ( = ?auto_43444 ?auto_43449 ) ) ( not ( = ?auto_43445 ?auto_43449 ) ) ( not ( = ?auto_43446 ?auto_43449 ) ) ( not ( = ?auto_43447 ?auto_43449 ) ) ( not ( = ?auto_43448 ?auto_43449 ) ) ( HOLDING ?auto_43447 ) ( CLEAR ?auto_43446 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43443 ?auto_43444 ?auto_43445 ?auto_43446 ?auto_43447 )
      ( MAKE-6PILE ?auto_43443 ?auto_43444 ?auto_43445 ?auto_43446 ?auto_43447 ?auto_43448 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43450 - BLOCK
      ?auto_43451 - BLOCK
      ?auto_43452 - BLOCK
      ?auto_43453 - BLOCK
      ?auto_43454 - BLOCK
      ?auto_43455 - BLOCK
    )
    :vars
    (
      ?auto_43456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43450 ) ( ON ?auto_43451 ?auto_43450 ) ( ON ?auto_43452 ?auto_43451 ) ( ON ?auto_43453 ?auto_43452 ) ( not ( = ?auto_43450 ?auto_43451 ) ) ( not ( = ?auto_43450 ?auto_43452 ) ) ( not ( = ?auto_43450 ?auto_43453 ) ) ( not ( = ?auto_43450 ?auto_43454 ) ) ( not ( = ?auto_43450 ?auto_43455 ) ) ( not ( = ?auto_43451 ?auto_43452 ) ) ( not ( = ?auto_43451 ?auto_43453 ) ) ( not ( = ?auto_43451 ?auto_43454 ) ) ( not ( = ?auto_43451 ?auto_43455 ) ) ( not ( = ?auto_43452 ?auto_43453 ) ) ( not ( = ?auto_43452 ?auto_43454 ) ) ( not ( = ?auto_43452 ?auto_43455 ) ) ( not ( = ?auto_43453 ?auto_43454 ) ) ( not ( = ?auto_43453 ?auto_43455 ) ) ( not ( = ?auto_43454 ?auto_43455 ) ) ( ON ?auto_43455 ?auto_43456 ) ( not ( = ?auto_43450 ?auto_43456 ) ) ( not ( = ?auto_43451 ?auto_43456 ) ) ( not ( = ?auto_43452 ?auto_43456 ) ) ( not ( = ?auto_43453 ?auto_43456 ) ) ( not ( = ?auto_43454 ?auto_43456 ) ) ( not ( = ?auto_43455 ?auto_43456 ) ) ( CLEAR ?auto_43453 ) ( ON ?auto_43454 ?auto_43455 ) ( CLEAR ?auto_43454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43456 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43456 ?auto_43455 )
      ( MAKE-6PILE ?auto_43450 ?auto_43451 ?auto_43452 ?auto_43453 ?auto_43454 ?auto_43455 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43457 - BLOCK
      ?auto_43458 - BLOCK
      ?auto_43459 - BLOCK
      ?auto_43460 - BLOCK
      ?auto_43461 - BLOCK
      ?auto_43462 - BLOCK
    )
    :vars
    (
      ?auto_43463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43457 ) ( ON ?auto_43458 ?auto_43457 ) ( ON ?auto_43459 ?auto_43458 ) ( not ( = ?auto_43457 ?auto_43458 ) ) ( not ( = ?auto_43457 ?auto_43459 ) ) ( not ( = ?auto_43457 ?auto_43460 ) ) ( not ( = ?auto_43457 ?auto_43461 ) ) ( not ( = ?auto_43457 ?auto_43462 ) ) ( not ( = ?auto_43458 ?auto_43459 ) ) ( not ( = ?auto_43458 ?auto_43460 ) ) ( not ( = ?auto_43458 ?auto_43461 ) ) ( not ( = ?auto_43458 ?auto_43462 ) ) ( not ( = ?auto_43459 ?auto_43460 ) ) ( not ( = ?auto_43459 ?auto_43461 ) ) ( not ( = ?auto_43459 ?auto_43462 ) ) ( not ( = ?auto_43460 ?auto_43461 ) ) ( not ( = ?auto_43460 ?auto_43462 ) ) ( not ( = ?auto_43461 ?auto_43462 ) ) ( ON ?auto_43462 ?auto_43463 ) ( not ( = ?auto_43457 ?auto_43463 ) ) ( not ( = ?auto_43458 ?auto_43463 ) ) ( not ( = ?auto_43459 ?auto_43463 ) ) ( not ( = ?auto_43460 ?auto_43463 ) ) ( not ( = ?auto_43461 ?auto_43463 ) ) ( not ( = ?auto_43462 ?auto_43463 ) ) ( ON ?auto_43461 ?auto_43462 ) ( CLEAR ?auto_43461 ) ( ON-TABLE ?auto_43463 ) ( HOLDING ?auto_43460 ) ( CLEAR ?auto_43459 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43457 ?auto_43458 ?auto_43459 ?auto_43460 )
      ( MAKE-6PILE ?auto_43457 ?auto_43458 ?auto_43459 ?auto_43460 ?auto_43461 ?auto_43462 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43464 - BLOCK
      ?auto_43465 - BLOCK
      ?auto_43466 - BLOCK
      ?auto_43467 - BLOCK
      ?auto_43468 - BLOCK
      ?auto_43469 - BLOCK
    )
    :vars
    (
      ?auto_43470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43464 ) ( ON ?auto_43465 ?auto_43464 ) ( ON ?auto_43466 ?auto_43465 ) ( not ( = ?auto_43464 ?auto_43465 ) ) ( not ( = ?auto_43464 ?auto_43466 ) ) ( not ( = ?auto_43464 ?auto_43467 ) ) ( not ( = ?auto_43464 ?auto_43468 ) ) ( not ( = ?auto_43464 ?auto_43469 ) ) ( not ( = ?auto_43465 ?auto_43466 ) ) ( not ( = ?auto_43465 ?auto_43467 ) ) ( not ( = ?auto_43465 ?auto_43468 ) ) ( not ( = ?auto_43465 ?auto_43469 ) ) ( not ( = ?auto_43466 ?auto_43467 ) ) ( not ( = ?auto_43466 ?auto_43468 ) ) ( not ( = ?auto_43466 ?auto_43469 ) ) ( not ( = ?auto_43467 ?auto_43468 ) ) ( not ( = ?auto_43467 ?auto_43469 ) ) ( not ( = ?auto_43468 ?auto_43469 ) ) ( ON ?auto_43469 ?auto_43470 ) ( not ( = ?auto_43464 ?auto_43470 ) ) ( not ( = ?auto_43465 ?auto_43470 ) ) ( not ( = ?auto_43466 ?auto_43470 ) ) ( not ( = ?auto_43467 ?auto_43470 ) ) ( not ( = ?auto_43468 ?auto_43470 ) ) ( not ( = ?auto_43469 ?auto_43470 ) ) ( ON ?auto_43468 ?auto_43469 ) ( ON-TABLE ?auto_43470 ) ( CLEAR ?auto_43466 ) ( ON ?auto_43467 ?auto_43468 ) ( CLEAR ?auto_43467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43470 ?auto_43469 ?auto_43468 )
      ( MAKE-6PILE ?auto_43464 ?auto_43465 ?auto_43466 ?auto_43467 ?auto_43468 ?auto_43469 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43471 - BLOCK
      ?auto_43472 - BLOCK
      ?auto_43473 - BLOCK
      ?auto_43474 - BLOCK
      ?auto_43475 - BLOCK
      ?auto_43476 - BLOCK
    )
    :vars
    (
      ?auto_43477 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43471 ) ( ON ?auto_43472 ?auto_43471 ) ( not ( = ?auto_43471 ?auto_43472 ) ) ( not ( = ?auto_43471 ?auto_43473 ) ) ( not ( = ?auto_43471 ?auto_43474 ) ) ( not ( = ?auto_43471 ?auto_43475 ) ) ( not ( = ?auto_43471 ?auto_43476 ) ) ( not ( = ?auto_43472 ?auto_43473 ) ) ( not ( = ?auto_43472 ?auto_43474 ) ) ( not ( = ?auto_43472 ?auto_43475 ) ) ( not ( = ?auto_43472 ?auto_43476 ) ) ( not ( = ?auto_43473 ?auto_43474 ) ) ( not ( = ?auto_43473 ?auto_43475 ) ) ( not ( = ?auto_43473 ?auto_43476 ) ) ( not ( = ?auto_43474 ?auto_43475 ) ) ( not ( = ?auto_43474 ?auto_43476 ) ) ( not ( = ?auto_43475 ?auto_43476 ) ) ( ON ?auto_43476 ?auto_43477 ) ( not ( = ?auto_43471 ?auto_43477 ) ) ( not ( = ?auto_43472 ?auto_43477 ) ) ( not ( = ?auto_43473 ?auto_43477 ) ) ( not ( = ?auto_43474 ?auto_43477 ) ) ( not ( = ?auto_43475 ?auto_43477 ) ) ( not ( = ?auto_43476 ?auto_43477 ) ) ( ON ?auto_43475 ?auto_43476 ) ( ON-TABLE ?auto_43477 ) ( ON ?auto_43474 ?auto_43475 ) ( CLEAR ?auto_43474 ) ( HOLDING ?auto_43473 ) ( CLEAR ?auto_43472 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43471 ?auto_43472 ?auto_43473 )
      ( MAKE-6PILE ?auto_43471 ?auto_43472 ?auto_43473 ?auto_43474 ?auto_43475 ?auto_43476 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43478 - BLOCK
      ?auto_43479 - BLOCK
      ?auto_43480 - BLOCK
      ?auto_43481 - BLOCK
      ?auto_43482 - BLOCK
      ?auto_43483 - BLOCK
    )
    :vars
    (
      ?auto_43484 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43478 ) ( ON ?auto_43479 ?auto_43478 ) ( not ( = ?auto_43478 ?auto_43479 ) ) ( not ( = ?auto_43478 ?auto_43480 ) ) ( not ( = ?auto_43478 ?auto_43481 ) ) ( not ( = ?auto_43478 ?auto_43482 ) ) ( not ( = ?auto_43478 ?auto_43483 ) ) ( not ( = ?auto_43479 ?auto_43480 ) ) ( not ( = ?auto_43479 ?auto_43481 ) ) ( not ( = ?auto_43479 ?auto_43482 ) ) ( not ( = ?auto_43479 ?auto_43483 ) ) ( not ( = ?auto_43480 ?auto_43481 ) ) ( not ( = ?auto_43480 ?auto_43482 ) ) ( not ( = ?auto_43480 ?auto_43483 ) ) ( not ( = ?auto_43481 ?auto_43482 ) ) ( not ( = ?auto_43481 ?auto_43483 ) ) ( not ( = ?auto_43482 ?auto_43483 ) ) ( ON ?auto_43483 ?auto_43484 ) ( not ( = ?auto_43478 ?auto_43484 ) ) ( not ( = ?auto_43479 ?auto_43484 ) ) ( not ( = ?auto_43480 ?auto_43484 ) ) ( not ( = ?auto_43481 ?auto_43484 ) ) ( not ( = ?auto_43482 ?auto_43484 ) ) ( not ( = ?auto_43483 ?auto_43484 ) ) ( ON ?auto_43482 ?auto_43483 ) ( ON-TABLE ?auto_43484 ) ( ON ?auto_43481 ?auto_43482 ) ( CLEAR ?auto_43479 ) ( ON ?auto_43480 ?auto_43481 ) ( CLEAR ?auto_43480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43484 ?auto_43483 ?auto_43482 ?auto_43481 )
      ( MAKE-6PILE ?auto_43478 ?auto_43479 ?auto_43480 ?auto_43481 ?auto_43482 ?auto_43483 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43485 - BLOCK
      ?auto_43486 - BLOCK
      ?auto_43487 - BLOCK
      ?auto_43488 - BLOCK
      ?auto_43489 - BLOCK
      ?auto_43490 - BLOCK
    )
    :vars
    (
      ?auto_43491 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43485 ) ( not ( = ?auto_43485 ?auto_43486 ) ) ( not ( = ?auto_43485 ?auto_43487 ) ) ( not ( = ?auto_43485 ?auto_43488 ) ) ( not ( = ?auto_43485 ?auto_43489 ) ) ( not ( = ?auto_43485 ?auto_43490 ) ) ( not ( = ?auto_43486 ?auto_43487 ) ) ( not ( = ?auto_43486 ?auto_43488 ) ) ( not ( = ?auto_43486 ?auto_43489 ) ) ( not ( = ?auto_43486 ?auto_43490 ) ) ( not ( = ?auto_43487 ?auto_43488 ) ) ( not ( = ?auto_43487 ?auto_43489 ) ) ( not ( = ?auto_43487 ?auto_43490 ) ) ( not ( = ?auto_43488 ?auto_43489 ) ) ( not ( = ?auto_43488 ?auto_43490 ) ) ( not ( = ?auto_43489 ?auto_43490 ) ) ( ON ?auto_43490 ?auto_43491 ) ( not ( = ?auto_43485 ?auto_43491 ) ) ( not ( = ?auto_43486 ?auto_43491 ) ) ( not ( = ?auto_43487 ?auto_43491 ) ) ( not ( = ?auto_43488 ?auto_43491 ) ) ( not ( = ?auto_43489 ?auto_43491 ) ) ( not ( = ?auto_43490 ?auto_43491 ) ) ( ON ?auto_43489 ?auto_43490 ) ( ON-TABLE ?auto_43491 ) ( ON ?auto_43488 ?auto_43489 ) ( ON ?auto_43487 ?auto_43488 ) ( CLEAR ?auto_43487 ) ( HOLDING ?auto_43486 ) ( CLEAR ?auto_43485 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43485 ?auto_43486 )
      ( MAKE-6PILE ?auto_43485 ?auto_43486 ?auto_43487 ?auto_43488 ?auto_43489 ?auto_43490 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43492 - BLOCK
      ?auto_43493 - BLOCK
      ?auto_43494 - BLOCK
      ?auto_43495 - BLOCK
      ?auto_43496 - BLOCK
      ?auto_43497 - BLOCK
    )
    :vars
    (
      ?auto_43498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43492 ) ( not ( = ?auto_43492 ?auto_43493 ) ) ( not ( = ?auto_43492 ?auto_43494 ) ) ( not ( = ?auto_43492 ?auto_43495 ) ) ( not ( = ?auto_43492 ?auto_43496 ) ) ( not ( = ?auto_43492 ?auto_43497 ) ) ( not ( = ?auto_43493 ?auto_43494 ) ) ( not ( = ?auto_43493 ?auto_43495 ) ) ( not ( = ?auto_43493 ?auto_43496 ) ) ( not ( = ?auto_43493 ?auto_43497 ) ) ( not ( = ?auto_43494 ?auto_43495 ) ) ( not ( = ?auto_43494 ?auto_43496 ) ) ( not ( = ?auto_43494 ?auto_43497 ) ) ( not ( = ?auto_43495 ?auto_43496 ) ) ( not ( = ?auto_43495 ?auto_43497 ) ) ( not ( = ?auto_43496 ?auto_43497 ) ) ( ON ?auto_43497 ?auto_43498 ) ( not ( = ?auto_43492 ?auto_43498 ) ) ( not ( = ?auto_43493 ?auto_43498 ) ) ( not ( = ?auto_43494 ?auto_43498 ) ) ( not ( = ?auto_43495 ?auto_43498 ) ) ( not ( = ?auto_43496 ?auto_43498 ) ) ( not ( = ?auto_43497 ?auto_43498 ) ) ( ON ?auto_43496 ?auto_43497 ) ( ON-TABLE ?auto_43498 ) ( ON ?auto_43495 ?auto_43496 ) ( ON ?auto_43494 ?auto_43495 ) ( CLEAR ?auto_43492 ) ( ON ?auto_43493 ?auto_43494 ) ( CLEAR ?auto_43493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43498 ?auto_43497 ?auto_43496 ?auto_43495 ?auto_43494 )
      ( MAKE-6PILE ?auto_43492 ?auto_43493 ?auto_43494 ?auto_43495 ?auto_43496 ?auto_43497 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43499 - BLOCK
      ?auto_43500 - BLOCK
      ?auto_43501 - BLOCK
      ?auto_43502 - BLOCK
      ?auto_43503 - BLOCK
      ?auto_43504 - BLOCK
    )
    :vars
    (
      ?auto_43505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43499 ?auto_43500 ) ) ( not ( = ?auto_43499 ?auto_43501 ) ) ( not ( = ?auto_43499 ?auto_43502 ) ) ( not ( = ?auto_43499 ?auto_43503 ) ) ( not ( = ?auto_43499 ?auto_43504 ) ) ( not ( = ?auto_43500 ?auto_43501 ) ) ( not ( = ?auto_43500 ?auto_43502 ) ) ( not ( = ?auto_43500 ?auto_43503 ) ) ( not ( = ?auto_43500 ?auto_43504 ) ) ( not ( = ?auto_43501 ?auto_43502 ) ) ( not ( = ?auto_43501 ?auto_43503 ) ) ( not ( = ?auto_43501 ?auto_43504 ) ) ( not ( = ?auto_43502 ?auto_43503 ) ) ( not ( = ?auto_43502 ?auto_43504 ) ) ( not ( = ?auto_43503 ?auto_43504 ) ) ( ON ?auto_43504 ?auto_43505 ) ( not ( = ?auto_43499 ?auto_43505 ) ) ( not ( = ?auto_43500 ?auto_43505 ) ) ( not ( = ?auto_43501 ?auto_43505 ) ) ( not ( = ?auto_43502 ?auto_43505 ) ) ( not ( = ?auto_43503 ?auto_43505 ) ) ( not ( = ?auto_43504 ?auto_43505 ) ) ( ON ?auto_43503 ?auto_43504 ) ( ON-TABLE ?auto_43505 ) ( ON ?auto_43502 ?auto_43503 ) ( ON ?auto_43501 ?auto_43502 ) ( ON ?auto_43500 ?auto_43501 ) ( CLEAR ?auto_43500 ) ( HOLDING ?auto_43499 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43499 )
      ( MAKE-6PILE ?auto_43499 ?auto_43500 ?auto_43501 ?auto_43502 ?auto_43503 ?auto_43504 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43506 - BLOCK
      ?auto_43507 - BLOCK
      ?auto_43508 - BLOCK
      ?auto_43509 - BLOCK
      ?auto_43510 - BLOCK
      ?auto_43511 - BLOCK
    )
    :vars
    (
      ?auto_43512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43506 ?auto_43507 ) ) ( not ( = ?auto_43506 ?auto_43508 ) ) ( not ( = ?auto_43506 ?auto_43509 ) ) ( not ( = ?auto_43506 ?auto_43510 ) ) ( not ( = ?auto_43506 ?auto_43511 ) ) ( not ( = ?auto_43507 ?auto_43508 ) ) ( not ( = ?auto_43507 ?auto_43509 ) ) ( not ( = ?auto_43507 ?auto_43510 ) ) ( not ( = ?auto_43507 ?auto_43511 ) ) ( not ( = ?auto_43508 ?auto_43509 ) ) ( not ( = ?auto_43508 ?auto_43510 ) ) ( not ( = ?auto_43508 ?auto_43511 ) ) ( not ( = ?auto_43509 ?auto_43510 ) ) ( not ( = ?auto_43509 ?auto_43511 ) ) ( not ( = ?auto_43510 ?auto_43511 ) ) ( ON ?auto_43511 ?auto_43512 ) ( not ( = ?auto_43506 ?auto_43512 ) ) ( not ( = ?auto_43507 ?auto_43512 ) ) ( not ( = ?auto_43508 ?auto_43512 ) ) ( not ( = ?auto_43509 ?auto_43512 ) ) ( not ( = ?auto_43510 ?auto_43512 ) ) ( not ( = ?auto_43511 ?auto_43512 ) ) ( ON ?auto_43510 ?auto_43511 ) ( ON-TABLE ?auto_43512 ) ( ON ?auto_43509 ?auto_43510 ) ( ON ?auto_43508 ?auto_43509 ) ( ON ?auto_43507 ?auto_43508 ) ( ON ?auto_43506 ?auto_43507 ) ( CLEAR ?auto_43506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43512 ?auto_43511 ?auto_43510 ?auto_43509 ?auto_43508 ?auto_43507 )
      ( MAKE-6PILE ?auto_43506 ?auto_43507 ?auto_43508 ?auto_43509 ?auto_43510 ?auto_43511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43518 - BLOCK
      ?auto_43519 - BLOCK
      ?auto_43520 - BLOCK
      ?auto_43521 - BLOCK
      ?auto_43522 - BLOCK
    )
    :vars
    (
      ?auto_43523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43523 ?auto_43522 ) ( CLEAR ?auto_43523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43518 ) ( ON ?auto_43519 ?auto_43518 ) ( ON ?auto_43520 ?auto_43519 ) ( ON ?auto_43521 ?auto_43520 ) ( ON ?auto_43522 ?auto_43521 ) ( not ( = ?auto_43518 ?auto_43519 ) ) ( not ( = ?auto_43518 ?auto_43520 ) ) ( not ( = ?auto_43518 ?auto_43521 ) ) ( not ( = ?auto_43518 ?auto_43522 ) ) ( not ( = ?auto_43518 ?auto_43523 ) ) ( not ( = ?auto_43519 ?auto_43520 ) ) ( not ( = ?auto_43519 ?auto_43521 ) ) ( not ( = ?auto_43519 ?auto_43522 ) ) ( not ( = ?auto_43519 ?auto_43523 ) ) ( not ( = ?auto_43520 ?auto_43521 ) ) ( not ( = ?auto_43520 ?auto_43522 ) ) ( not ( = ?auto_43520 ?auto_43523 ) ) ( not ( = ?auto_43521 ?auto_43522 ) ) ( not ( = ?auto_43521 ?auto_43523 ) ) ( not ( = ?auto_43522 ?auto_43523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43523 ?auto_43522 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43537 - BLOCK
      ?auto_43538 - BLOCK
      ?auto_43539 - BLOCK
      ?auto_43540 - BLOCK
      ?auto_43541 - BLOCK
    )
    :vars
    (
      ?auto_43542 - BLOCK
      ?auto_43543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43537 ) ( ON ?auto_43538 ?auto_43537 ) ( ON ?auto_43539 ?auto_43538 ) ( ON ?auto_43540 ?auto_43539 ) ( not ( = ?auto_43537 ?auto_43538 ) ) ( not ( = ?auto_43537 ?auto_43539 ) ) ( not ( = ?auto_43537 ?auto_43540 ) ) ( not ( = ?auto_43537 ?auto_43541 ) ) ( not ( = ?auto_43537 ?auto_43542 ) ) ( not ( = ?auto_43538 ?auto_43539 ) ) ( not ( = ?auto_43538 ?auto_43540 ) ) ( not ( = ?auto_43538 ?auto_43541 ) ) ( not ( = ?auto_43538 ?auto_43542 ) ) ( not ( = ?auto_43539 ?auto_43540 ) ) ( not ( = ?auto_43539 ?auto_43541 ) ) ( not ( = ?auto_43539 ?auto_43542 ) ) ( not ( = ?auto_43540 ?auto_43541 ) ) ( not ( = ?auto_43540 ?auto_43542 ) ) ( not ( = ?auto_43541 ?auto_43542 ) ) ( ON ?auto_43542 ?auto_43543 ) ( CLEAR ?auto_43542 ) ( not ( = ?auto_43537 ?auto_43543 ) ) ( not ( = ?auto_43538 ?auto_43543 ) ) ( not ( = ?auto_43539 ?auto_43543 ) ) ( not ( = ?auto_43540 ?auto_43543 ) ) ( not ( = ?auto_43541 ?auto_43543 ) ) ( not ( = ?auto_43542 ?auto_43543 ) ) ( HOLDING ?auto_43541 ) ( CLEAR ?auto_43540 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43537 ?auto_43538 ?auto_43539 ?auto_43540 ?auto_43541 ?auto_43542 )
      ( MAKE-5PILE ?auto_43537 ?auto_43538 ?auto_43539 ?auto_43540 ?auto_43541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43544 - BLOCK
      ?auto_43545 - BLOCK
      ?auto_43546 - BLOCK
      ?auto_43547 - BLOCK
      ?auto_43548 - BLOCK
    )
    :vars
    (
      ?auto_43550 - BLOCK
      ?auto_43549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43544 ) ( ON ?auto_43545 ?auto_43544 ) ( ON ?auto_43546 ?auto_43545 ) ( ON ?auto_43547 ?auto_43546 ) ( not ( = ?auto_43544 ?auto_43545 ) ) ( not ( = ?auto_43544 ?auto_43546 ) ) ( not ( = ?auto_43544 ?auto_43547 ) ) ( not ( = ?auto_43544 ?auto_43548 ) ) ( not ( = ?auto_43544 ?auto_43550 ) ) ( not ( = ?auto_43545 ?auto_43546 ) ) ( not ( = ?auto_43545 ?auto_43547 ) ) ( not ( = ?auto_43545 ?auto_43548 ) ) ( not ( = ?auto_43545 ?auto_43550 ) ) ( not ( = ?auto_43546 ?auto_43547 ) ) ( not ( = ?auto_43546 ?auto_43548 ) ) ( not ( = ?auto_43546 ?auto_43550 ) ) ( not ( = ?auto_43547 ?auto_43548 ) ) ( not ( = ?auto_43547 ?auto_43550 ) ) ( not ( = ?auto_43548 ?auto_43550 ) ) ( ON ?auto_43550 ?auto_43549 ) ( not ( = ?auto_43544 ?auto_43549 ) ) ( not ( = ?auto_43545 ?auto_43549 ) ) ( not ( = ?auto_43546 ?auto_43549 ) ) ( not ( = ?auto_43547 ?auto_43549 ) ) ( not ( = ?auto_43548 ?auto_43549 ) ) ( not ( = ?auto_43550 ?auto_43549 ) ) ( CLEAR ?auto_43547 ) ( ON ?auto_43548 ?auto_43550 ) ( CLEAR ?auto_43548 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43549 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43549 ?auto_43550 )
      ( MAKE-5PILE ?auto_43544 ?auto_43545 ?auto_43546 ?auto_43547 ?auto_43548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43551 - BLOCK
      ?auto_43552 - BLOCK
      ?auto_43553 - BLOCK
      ?auto_43554 - BLOCK
      ?auto_43555 - BLOCK
    )
    :vars
    (
      ?auto_43557 - BLOCK
      ?auto_43556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43551 ) ( ON ?auto_43552 ?auto_43551 ) ( ON ?auto_43553 ?auto_43552 ) ( not ( = ?auto_43551 ?auto_43552 ) ) ( not ( = ?auto_43551 ?auto_43553 ) ) ( not ( = ?auto_43551 ?auto_43554 ) ) ( not ( = ?auto_43551 ?auto_43555 ) ) ( not ( = ?auto_43551 ?auto_43557 ) ) ( not ( = ?auto_43552 ?auto_43553 ) ) ( not ( = ?auto_43552 ?auto_43554 ) ) ( not ( = ?auto_43552 ?auto_43555 ) ) ( not ( = ?auto_43552 ?auto_43557 ) ) ( not ( = ?auto_43553 ?auto_43554 ) ) ( not ( = ?auto_43553 ?auto_43555 ) ) ( not ( = ?auto_43553 ?auto_43557 ) ) ( not ( = ?auto_43554 ?auto_43555 ) ) ( not ( = ?auto_43554 ?auto_43557 ) ) ( not ( = ?auto_43555 ?auto_43557 ) ) ( ON ?auto_43557 ?auto_43556 ) ( not ( = ?auto_43551 ?auto_43556 ) ) ( not ( = ?auto_43552 ?auto_43556 ) ) ( not ( = ?auto_43553 ?auto_43556 ) ) ( not ( = ?auto_43554 ?auto_43556 ) ) ( not ( = ?auto_43555 ?auto_43556 ) ) ( not ( = ?auto_43557 ?auto_43556 ) ) ( ON ?auto_43555 ?auto_43557 ) ( CLEAR ?auto_43555 ) ( ON-TABLE ?auto_43556 ) ( HOLDING ?auto_43554 ) ( CLEAR ?auto_43553 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43551 ?auto_43552 ?auto_43553 ?auto_43554 )
      ( MAKE-5PILE ?auto_43551 ?auto_43552 ?auto_43553 ?auto_43554 ?auto_43555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43558 - BLOCK
      ?auto_43559 - BLOCK
      ?auto_43560 - BLOCK
      ?auto_43561 - BLOCK
      ?auto_43562 - BLOCK
    )
    :vars
    (
      ?auto_43564 - BLOCK
      ?auto_43563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43558 ) ( ON ?auto_43559 ?auto_43558 ) ( ON ?auto_43560 ?auto_43559 ) ( not ( = ?auto_43558 ?auto_43559 ) ) ( not ( = ?auto_43558 ?auto_43560 ) ) ( not ( = ?auto_43558 ?auto_43561 ) ) ( not ( = ?auto_43558 ?auto_43562 ) ) ( not ( = ?auto_43558 ?auto_43564 ) ) ( not ( = ?auto_43559 ?auto_43560 ) ) ( not ( = ?auto_43559 ?auto_43561 ) ) ( not ( = ?auto_43559 ?auto_43562 ) ) ( not ( = ?auto_43559 ?auto_43564 ) ) ( not ( = ?auto_43560 ?auto_43561 ) ) ( not ( = ?auto_43560 ?auto_43562 ) ) ( not ( = ?auto_43560 ?auto_43564 ) ) ( not ( = ?auto_43561 ?auto_43562 ) ) ( not ( = ?auto_43561 ?auto_43564 ) ) ( not ( = ?auto_43562 ?auto_43564 ) ) ( ON ?auto_43564 ?auto_43563 ) ( not ( = ?auto_43558 ?auto_43563 ) ) ( not ( = ?auto_43559 ?auto_43563 ) ) ( not ( = ?auto_43560 ?auto_43563 ) ) ( not ( = ?auto_43561 ?auto_43563 ) ) ( not ( = ?auto_43562 ?auto_43563 ) ) ( not ( = ?auto_43564 ?auto_43563 ) ) ( ON ?auto_43562 ?auto_43564 ) ( ON-TABLE ?auto_43563 ) ( CLEAR ?auto_43560 ) ( ON ?auto_43561 ?auto_43562 ) ( CLEAR ?auto_43561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43563 ?auto_43564 ?auto_43562 )
      ( MAKE-5PILE ?auto_43558 ?auto_43559 ?auto_43560 ?auto_43561 ?auto_43562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43565 - BLOCK
      ?auto_43566 - BLOCK
      ?auto_43567 - BLOCK
      ?auto_43568 - BLOCK
      ?auto_43569 - BLOCK
    )
    :vars
    (
      ?auto_43571 - BLOCK
      ?auto_43570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43565 ) ( ON ?auto_43566 ?auto_43565 ) ( not ( = ?auto_43565 ?auto_43566 ) ) ( not ( = ?auto_43565 ?auto_43567 ) ) ( not ( = ?auto_43565 ?auto_43568 ) ) ( not ( = ?auto_43565 ?auto_43569 ) ) ( not ( = ?auto_43565 ?auto_43571 ) ) ( not ( = ?auto_43566 ?auto_43567 ) ) ( not ( = ?auto_43566 ?auto_43568 ) ) ( not ( = ?auto_43566 ?auto_43569 ) ) ( not ( = ?auto_43566 ?auto_43571 ) ) ( not ( = ?auto_43567 ?auto_43568 ) ) ( not ( = ?auto_43567 ?auto_43569 ) ) ( not ( = ?auto_43567 ?auto_43571 ) ) ( not ( = ?auto_43568 ?auto_43569 ) ) ( not ( = ?auto_43568 ?auto_43571 ) ) ( not ( = ?auto_43569 ?auto_43571 ) ) ( ON ?auto_43571 ?auto_43570 ) ( not ( = ?auto_43565 ?auto_43570 ) ) ( not ( = ?auto_43566 ?auto_43570 ) ) ( not ( = ?auto_43567 ?auto_43570 ) ) ( not ( = ?auto_43568 ?auto_43570 ) ) ( not ( = ?auto_43569 ?auto_43570 ) ) ( not ( = ?auto_43571 ?auto_43570 ) ) ( ON ?auto_43569 ?auto_43571 ) ( ON-TABLE ?auto_43570 ) ( ON ?auto_43568 ?auto_43569 ) ( CLEAR ?auto_43568 ) ( HOLDING ?auto_43567 ) ( CLEAR ?auto_43566 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43565 ?auto_43566 ?auto_43567 )
      ( MAKE-5PILE ?auto_43565 ?auto_43566 ?auto_43567 ?auto_43568 ?auto_43569 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43572 - BLOCK
      ?auto_43573 - BLOCK
      ?auto_43574 - BLOCK
      ?auto_43575 - BLOCK
      ?auto_43576 - BLOCK
    )
    :vars
    (
      ?auto_43578 - BLOCK
      ?auto_43577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43572 ) ( ON ?auto_43573 ?auto_43572 ) ( not ( = ?auto_43572 ?auto_43573 ) ) ( not ( = ?auto_43572 ?auto_43574 ) ) ( not ( = ?auto_43572 ?auto_43575 ) ) ( not ( = ?auto_43572 ?auto_43576 ) ) ( not ( = ?auto_43572 ?auto_43578 ) ) ( not ( = ?auto_43573 ?auto_43574 ) ) ( not ( = ?auto_43573 ?auto_43575 ) ) ( not ( = ?auto_43573 ?auto_43576 ) ) ( not ( = ?auto_43573 ?auto_43578 ) ) ( not ( = ?auto_43574 ?auto_43575 ) ) ( not ( = ?auto_43574 ?auto_43576 ) ) ( not ( = ?auto_43574 ?auto_43578 ) ) ( not ( = ?auto_43575 ?auto_43576 ) ) ( not ( = ?auto_43575 ?auto_43578 ) ) ( not ( = ?auto_43576 ?auto_43578 ) ) ( ON ?auto_43578 ?auto_43577 ) ( not ( = ?auto_43572 ?auto_43577 ) ) ( not ( = ?auto_43573 ?auto_43577 ) ) ( not ( = ?auto_43574 ?auto_43577 ) ) ( not ( = ?auto_43575 ?auto_43577 ) ) ( not ( = ?auto_43576 ?auto_43577 ) ) ( not ( = ?auto_43578 ?auto_43577 ) ) ( ON ?auto_43576 ?auto_43578 ) ( ON-TABLE ?auto_43577 ) ( ON ?auto_43575 ?auto_43576 ) ( CLEAR ?auto_43573 ) ( ON ?auto_43574 ?auto_43575 ) ( CLEAR ?auto_43574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43577 ?auto_43578 ?auto_43576 ?auto_43575 )
      ( MAKE-5PILE ?auto_43572 ?auto_43573 ?auto_43574 ?auto_43575 ?auto_43576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43579 - BLOCK
      ?auto_43580 - BLOCK
      ?auto_43581 - BLOCK
      ?auto_43582 - BLOCK
      ?auto_43583 - BLOCK
    )
    :vars
    (
      ?auto_43585 - BLOCK
      ?auto_43584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43579 ) ( not ( = ?auto_43579 ?auto_43580 ) ) ( not ( = ?auto_43579 ?auto_43581 ) ) ( not ( = ?auto_43579 ?auto_43582 ) ) ( not ( = ?auto_43579 ?auto_43583 ) ) ( not ( = ?auto_43579 ?auto_43585 ) ) ( not ( = ?auto_43580 ?auto_43581 ) ) ( not ( = ?auto_43580 ?auto_43582 ) ) ( not ( = ?auto_43580 ?auto_43583 ) ) ( not ( = ?auto_43580 ?auto_43585 ) ) ( not ( = ?auto_43581 ?auto_43582 ) ) ( not ( = ?auto_43581 ?auto_43583 ) ) ( not ( = ?auto_43581 ?auto_43585 ) ) ( not ( = ?auto_43582 ?auto_43583 ) ) ( not ( = ?auto_43582 ?auto_43585 ) ) ( not ( = ?auto_43583 ?auto_43585 ) ) ( ON ?auto_43585 ?auto_43584 ) ( not ( = ?auto_43579 ?auto_43584 ) ) ( not ( = ?auto_43580 ?auto_43584 ) ) ( not ( = ?auto_43581 ?auto_43584 ) ) ( not ( = ?auto_43582 ?auto_43584 ) ) ( not ( = ?auto_43583 ?auto_43584 ) ) ( not ( = ?auto_43585 ?auto_43584 ) ) ( ON ?auto_43583 ?auto_43585 ) ( ON-TABLE ?auto_43584 ) ( ON ?auto_43582 ?auto_43583 ) ( ON ?auto_43581 ?auto_43582 ) ( CLEAR ?auto_43581 ) ( HOLDING ?auto_43580 ) ( CLEAR ?auto_43579 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43579 ?auto_43580 )
      ( MAKE-5PILE ?auto_43579 ?auto_43580 ?auto_43581 ?auto_43582 ?auto_43583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43586 - BLOCK
      ?auto_43587 - BLOCK
      ?auto_43588 - BLOCK
      ?auto_43589 - BLOCK
      ?auto_43590 - BLOCK
    )
    :vars
    (
      ?auto_43592 - BLOCK
      ?auto_43591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43586 ) ( not ( = ?auto_43586 ?auto_43587 ) ) ( not ( = ?auto_43586 ?auto_43588 ) ) ( not ( = ?auto_43586 ?auto_43589 ) ) ( not ( = ?auto_43586 ?auto_43590 ) ) ( not ( = ?auto_43586 ?auto_43592 ) ) ( not ( = ?auto_43587 ?auto_43588 ) ) ( not ( = ?auto_43587 ?auto_43589 ) ) ( not ( = ?auto_43587 ?auto_43590 ) ) ( not ( = ?auto_43587 ?auto_43592 ) ) ( not ( = ?auto_43588 ?auto_43589 ) ) ( not ( = ?auto_43588 ?auto_43590 ) ) ( not ( = ?auto_43588 ?auto_43592 ) ) ( not ( = ?auto_43589 ?auto_43590 ) ) ( not ( = ?auto_43589 ?auto_43592 ) ) ( not ( = ?auto_43590 ?auto_43592 ) ) ( ON ?auto_43592 ?auto_43591 ) ( not ( = ?auto_43586 ?auto_43591 ) ) ( not ( = ?auto_43587 ?auto_43591 ) ) ( not ( = ?auto_43588 ?auto_43591 ) ) ( not ( = ?auto_43589 ?auto_43591 ) ) ( not ( = ?auto_43590 ?auto_43591 ) ) ( not ( = ?auto_43592 ?auto_43591 ) ) ( ON ?auto_43590 ?auto_43592 ) ( ON-TABLE ?auto_43591 ) ( ON ?auto_43589 ?auto_43590 ) ( ON ?auto_43588 ?auto_43589 ) ( CLEAR ?auto_43586 ) ( ON ?auto_43587 ?auto_43588 ) ( CLEAR ?auto_43587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43591 ?auto_43592 ?auto_43590 ?auto_43589 ?auto_43588 )
      ( MAKE-5PILE ?auto_43586 ?auto_43587 ?auto_43588 ?auto_43589 ?auto_43590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43593 - BLOCK
      ?auto_43594 - BLOCK
      ?auto_43595 - BLOCK
      ?auto_43596 - BLOCK
      ?auto_43597 - BLOCK
    )
    :vars
    (
      ?auto_43599 - BLOCK
      ?auto_43598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43593 ?auto_43594 ) ) ( not ( = ?auto_43593 ?auto_43595 ) ) ( not ( = ?auto_43593 ?auto_43596 ) ) ( not ( = ?auto_43593 ?auto_43597 ) ) ( not ( = ?auto_43593 ?auto_43599 ) ) ( not ( = ?auto_43594 ?auto_43595 ) ) ( not ( = ?auto_43594 ?auto_43596 ) ) ( not ( = ?auto_43594 ?auto_43597 ) ) ( not ( = ?auto_43594 ?auto_43599 ) ) ( not ( = ?auto_43595 ?auto_43596 ) ) ( not ( = ?auto_43595 ?auto_43597 ) ) ( not ( = ?auto_43595 ?auto_43599 ) ) ( not ( = ?auto_43596 ?auto_43597 ) ) ( not ( = ?auto_43596 ?auto_43599 ) ) ( not ( = ?auto_43597 ?auto_43599 ) ) ( ON ?auto_43599 ?auto_43598 ) ( not ( = ?auto_43593 ?auto_43598 ) ) ( not ( = ?auto_43594 ?auto_43598 ) ) ( not ( = ?auto_43595 ?auto_43598 ) ) ( not ( = ?auto_43596 ?auto_43598 ) ) ( not ( = ?auto_43597 ?auto_43598 ) ) ( not ( = ?auto_43599 ?auto_43598 ) ) ( ON ?auto_43597 ?auto_43599 ) ( ON-TABLE ?auto_43598 ) ( ON ?auto_43596 ?auto_43597 ) ( ON ?auto_43595 ?auto_43596 ) ( ON ?auto_43594 ?auto_43595 ) ( CLEAR ?auto_43594 ) ( HOLDING ?auto_43593 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43593 )
      ( MAKE-5PILE ?auto_43593 ?auto_43594 ?auto_43595 ?auto_43596 ?auto_43597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43600 - BLOCK
      ?auto_43601 - BLOCK
      ?auto_43602 - BLOCK
      ?auto_43603 - BLOCK
      ?auto_43604 - BLOCK
    )
    :vars
    (
      ?auto_43606 - BLOCK
      ?auto_43605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43600 ?auto_43601 ) ) ( not ( = ?auto_43600 ?auto_43602 ) ) ( not ( = ?auto_43600 ?auto_43603 ) ) ( not ( = ?auto_43600 ?auto_43604 ) ) ( not ( = ?auto_43600 ?auto_43606 ) ) ( not ( = ?auto_43601 ?auto_43602 ) ) ( not ( = ?auto_43601 ?auto_43603 ) ) ( not ( = ?auto_43601 ?auto_43604 ) ) ( not ( = ?auto_43601 ?auto_43606 ) ) ( not ( = ?auto_43602 ?auto_43603 ) ) ( not ( = ?auto_43602 ?auto_43604 ) ) ( not ( = ?auto_43602 ?auto_43606 ) ) ( not ( = ?auto_43603 ?auto_43604 ) ) ( not ( = ?auto_43603 ?auto_43606 ) ) ( not ( = ?auto_43604 ?auto_43606 ) ) ( ON ?auto_43606 ?auto_43605 ) ( not ( = ?auto_43600 ?auto_43605 ) ) ( not ( = ?auto_43601 ?auto_43605 ) ) ( not ( = ?auto_43602 ?auto_43605 ) ) ( not ( = ?auto_43603 ?auto_43605 ) ) ( not ( = ?auto_43604 ?auto_43605 ) ) ( not ( = ?auto_43606 ?auto_43605 ) ) ( ON ?auto_43604 ?auto_43606 ) ( ON-TABLE ?auto_43605 ) ( ON ?auto_43603 ?auto_43604 ) ( ON ?auto_43602 ?auto_43603 ) ( ON ?auto_43601 ?auto_43602 ) ( ON ?auto_43600 ?auto_43601 ) ( CLEAR ?auto_43600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43605 ?auto_43606 ?auto_43604 ?auto_43603 ?auto_43602 ?auto_43601 )
      ( MAKE-5PILE ?auto_43600 ?auto_43601 ?auto_43602 ?auto_43603 ?auto_43604 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43608 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43608 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_43608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43609 - BLOCK
    )
    :vars
    (
      ?auto_43610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43609 ?auto_43610 ) ( CLEAR ?auto_43609 ) ( HAND-EMPTY ) ( not ( = ?auto_43609 ?auto_43610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43609 ?auto_43610 )
      ( MAKE-1PILE ?auto_43609 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43611 - BLOCK
    )
    :vars
    (
      ?auto_43612 - BLOCK
      ?auto_43616 - BLOCK
      ?auto_43613 - BLOCK
      ?auto_43614 - BLOCK
      ?auto_43615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43611 ?auto_43612 ) ) ( HOLDING ?auto_43611 ) ( CLEAR ?auto_43612 ) ( ON-TABLE ?auto_43616 ) ( ON ?auto_43613 ?auto_43616 ) ( ON ?auto_43614 ?auto_43613 ) ( ON ?auto_43615 ?auto_43614 ) ( ON ?auto_43612 ?auto_43615 ) ( not ( = ?auto_43616 ?auto_43613 ) ) ( not ( = ?auto_43616 ?auto_43614 ) ) ( not ( = ?auto_43616 ?auto_43615 ) ) ( not ( = ?auto_43616 ?auto_43612 ) ) ( not ( = ?auto_43616 ?auto_43611 ) ) ( not ( = ?auto_43613 ?auto_43614 ) ) ( not ( = ?auto_43613 ?auto_43615 ) ) ( not ( = ?auto_43613 ?auto_43612 ) ) ( not ( = ?auto_43613 ?auto_43611 ) ) ( not ( = ?auto_43614 ?auto_43615 ) ) ( not ( = ?auto_43614 ?auto_43612 ) ) ( not ( = ?auto_43614 ?auto_43611 ) ) ( not ( = ?auto_43615 ?auto_43612 ) ) ( not ( = ?auto_43615 ?auto_43611 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43616 ?auto_43613 ?auto_43614 ?auto_43615 ?auto_43612 ?auto_43611 )
      ( MAKE-1PILE ?auto_43611 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43617 - BLOCK
    )
    :vars
    (
      ?auto_43618 - BLOCK
      ?auto_43622 - BLOCK
      ?auto_43621 - BLOCK
      ?auto_43620 - BLOCK
      ?auto_43619 - BLOCK
      ?auto_43623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43617 ?auto_43618 ) ) ( CLEAR ?auto_43618 ) ( ON-TABLE ?auto_43622 ) ( ON ?auto_43621 ?auto_43622 ) ( ON ?auto_43620 ?auto_43621 ) ( ON ?auto_43619 ?auto_43620 ) ( ON ?auto_43618 ?auto_43619 ) ( not ( = ?auto_43622 ?auto_43621 ) ) ( not ( = ?auto_43622 ?auto_43620 ) ) ( not ( = ?auto_43622 ?auto_43619 ) ) ( not ( = ?auto_43622 ?auto_43618 ) ) ( not ( = ?auto_43622 ?auto_43617 ) ) ( not ( = ?auto_43621 ?auto_43620 ) ) ( not ( = ?auto_43621 ?auto_43619 ) ) ( not ( = ?auto_43621 ?auto_43618 ) ) ( not ( = ?auto_43621 ?auto_43617 ) ) ( not ( = ?auto_43620 ?auto_43619 ) ) ( not ( = ?auto_43620 ?auto_43618 ) ) ( not ( = ?auto_43620 ?auto_43617 ) ) ( not ( = ?auto_43619 ?auto_43618 ) ) ( not ( = ?auto_43619 ?auto_43617 ) ) ( ON ?auto_43617 ?auto_43623 ) ( CLEAR ?auto_43617 ) ( HAND-EMPTY ) ( not ( = ?auto_43617 ?auto_43623 ) ) ( not ( = ?auto_43618 ?auto_43623 ) ) ( not ( = ?auto_43622 ?auto_43623 ) ) ( not ( = ?auto_43621 ?auto_43623 ) ) ( not ( = ?auto_43620 ?auto_43623 ) ) ( not ( = ?auto_43619 ?auto_43623 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43617 ?auto_43623 )
      ( MAKE-1PILE ?auto_43617 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43624 - BLOCK
    )
    :vars
    (
      ?auto_43627 - BLOCK
      ?auto_43629 - BLOCK
      ?auto_43625 - BLOCK
      ?auto_43630 - BLOCK
      ?auto_43628 - BLOCK
      ?auto_43626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43624 ?auto_43627 ) ) ( ON-TABLE ?auto_43629 ) ( ON ?auto_43625 ?auto_43629 ) ( ON ?auto_43630 ?auto_43625 ) ( ON ?auto_43628 ?auto_43630 ) ( not ( = ?auto_43629 ?auto_43625 ) ) ( not ( = ?auto_43629 ?auto_43630 ) ) ( not ( = ?auto_43629 ?auto_43628 ) ) ( not ( = ?auto_43629 ?auto_43627 ) ) ( not ( = ?auto_43629 ?auto_43624 ) ) ( not ( = ?auto_43625 ?auto_43630 ) ) ( not ( = ?auto_43625 ?auto_43628 ) ) ( not ( = ?auto_43625 ?auto_43627 ) ) ( not ( = ?auto_43625 ?auto_43624 ) ) ( not ( = ?auto_43630 ?auto_43628 ) ) ( not ( = ?auto_43630 ?auto_43627 ) ) ( not ( = ?auto_43630 ?auto_43624 ) ) ( not ( = ?auto_43628 ?auto_43627 ) ) ( not ( = ?auto_43628 ?auto_43624 ) ) ( ON ?auto_43624 ?auto_43626 ) ( CLEAR ?auto_43624 ) ( not ( = ?auto_43624 ?auto_43626 ) ) ( not ( = ?auto_43627 ?auto_43626 ) ) ( not ( = ?auto_43629 ?auto_43626 ) ) ( not ( = ?auto_43625 ?auto_43626 ) ) ( not ( = ?auto_43630 ?auto_43626 ) ) ( not ( = ?auto_43628 ?auto_43626 ) ) ( HOLDING ?auto_43627 ) ( CLEAR ?auto_43628 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43629 ?auto_43625 ?auto_43630 ?auto_43628 ?auto_43627 )
      ( MAKE-1PILE ?auto_43624 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43631 - BLOCK
    )
    :vars
    (
      ?auto_43636 - BLOCK
      ?auto_43632 - BLOCK
      ?auto_43637 - BLOCK
      ?auto_43633 - BLOCK
      ?auto_43635 - BLOCK
      ?auto_43634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43631 ?auto_43636 ) ) ( ON-TABLE ?auto_43632 ) ( ON ?auto_43637 ?auto_43632 ) ( ON ?auto_43633 ?auto_43637 ) ( ON ?auto_43635 ?auto_43633 ) ( not ( = ?auto_43632 ?auto_43637 ) ) ( not ( = ?auto_43632 ?auto_43633 ) ) ( not ( = ?auto_43632 ?auto_43635 ) ) ( not ( = ?auto_43632 ?auto_43636 ) ) ( not ( = ?auto_43632 ?auto_43631 ) ) ( not ( = ?auto_43637 ?auto_43633 ) ) ( not ( = ?auto_43637 ?auto_43635 ) ) ( not ( = ?auto_43637 ?auto_43636 ) ) ( not ( = ?auto_43637 ?auto_43631 ) ) ( not ( = ?auto_43633 ?auto_43635 ) ) ( not ( = ?auto_43633 ?auto_43636 ) ) ( not ( = ?auto_43633 ?auto_43631 ) ) ( not ( = ?auto_43635 ?auto_43636 ) ) ( not ( = ?auto_43635 ?auto_43631 ) ) ( ON ?auto_43631 ?auto_43634 ) ( not ( = ?auto_43631 ?auto_43634 ) ) ( not ( = ?auto_43636 ?auto_43634 ) ) ( not ( = ?auto_43632 ?auto_43634 ) ) ( not ( = ?auto_43637 ?auto_43634 ) ) ( not ( = ?auto_43633 ?auto_43634 ) ) ( not ( = ?auto_43635 ?auto_43634 ) ) ( CLEAR ?auto_43635 ) ( ON ?auto_43636 ?auto_43631 ) ( CLEAR ?auto_43636 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43634 ?auto_43631 )
      ( MAKE-1PILE ?auto_43631 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43638 - BLOCK
    )
    :vars
    (
      ?auto_43639 - BLOCK
      ?auto_43641 - BLOCK
      ?auto_43644 - BLOCK
      ?auto_43640 - BLOCK
      ?auto_43643 - BLOCK
      ?auto_43642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43638 ?auto_43639 ) ) ( ON-TABLE ?auto_43641 ) ( ON ?auto_43644 ?auto_43641 ) ( ON ?auto_43640 ?auto_43644 ) ( not ( = ?auto_43641 ?auto_43644 ) ) ( not ( = ?auto_43641 ?auto_43640 ) ) ( not ( = ?auto_43641 ?auto_43643 ) ) ( not ( = ?auto_43641 ?auto_43639 ) ) ( not ( = ?auto_43641 ?auto_43638 ) ) ( not ( = ?auto_43644 ?auto_43640 ) ) ( not ( = ?auto_43644 ?auto_43643 ) ) ( not ( = ?auto_43644 ?auto_43639 ) ) ( not ( = ?auto_43644 ?auto_43638 ) ) ( not ( = ?auto_43640 ?auto_43643 ) ) ( not ( = ?auto_43640 ?auto_43639 ) ) ( not ( = ?auto_43640 ?auto_43638 ) ) ( not ( = ?auto_43643 ?auto_43639 ) ) ( not ( = ?auto_43643 ?auto_43638 ) ) ( ON ?auto_43638 ?auto_43642 ) ( not ( = ?auto_43638 ?auto_43642 ) ) ( not ( = ?auto_43639 ?auto_43642 ) ) ( not ( = ?auto_43641 ?auto_43642 ) ) ( not ( = ?auto_43644 ?auto_43642 ) ) ( not ( = ?auto_43640 ?auto_43642 ) ) ( not ( = ?auto_43643 ?auto_43642 ) ) ( ON ?auto_43639 ?auto_43638 ) ( CLEAR ?auto_43639 ) ( ON-TABLE ?auto_43642 ) ( HOLDING ?auto_43643 ) ( CLEAR ?auto_43640 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43641 ?auto_43644 ?auto_43640 ?auto_43643 )
      ( MAKE-1PILE ?auto_43638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43645 - BLOCK
    )
    :vars
    (
      ?auto_43650 - BLOCK
      ?auto_43647 - BLOCK
      ?auto_43646 - BLOCK
      ?auto_43648 - BLOCK
      ?auto_43649 - BLOCK
      ?auto_43651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43645 ?auto_43650 ) ) ( ON-TABLE ?auto_43647 ) ( ON ?auto_43646 ?auto_43647 ) ( ON ?auto_43648 ?auto_43646 ) ( not ( = ?auto_43647 ?auto_43646 ) ) ( not ( = ?auto_43647 ?auto_43648 ) ) ( not ( = ?auto_43647 ?auto_43649 ) ) ( not ( = ?auto_43647 ?auto_43650 ) ) ( not ( = ?auto_43647 ?auto_43645 ) ) ( not ( = ?auto_43646 ?auto_43648 ) ) ( not ( = ?auto_43646 ?auto_43649 ) ) ( not ( = ?auto_43646 ?auto_43650 ) ) ( not ( = ?auto_43646 ?auto_43645 ) ) ( not ( = ?auto_43648 ?auto_43649 ) ) ( not ( = ?auto_43648 ?auto_43650 ) ) ( not ( = ?auto_43648 ?auto_43645 ) ) ( not ( = ?auto_43649 ?auto_43650 ) ) ( not ( = ?auto_43649 ?auto_43645 ) ) ( ON ?auto_43645 ?auto_43651 ) ( not ( = ?auto_43645 ?auto_43651 ) ) ( not ( = ?auto_43650 ?auto_43651 ) ) ( not ( = ?auto_43647 ?auto_43651 ) ) ( not ( = ?auto_43646 ?auto_43651 ) ) ( not ( = ?auto_43648 ?auto_43651 ) ) ( not ( = ?auto_43649 ?auto_43651 ) ) ( ON ?auto_43650 ?auto_43645 ) ( ON-TABLE ?auto_43651 ) ( CLEAR ?auto_43648 ) ( ON ?auto_43649 ?auto_43650 ) ( CLEAR ?auto_43649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43651 ?auto_43645 ?auto_43650 )
      ( MAKE-1PILE ?auto_43645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43652 - BLOCK
    )
    :vars
    (
      ?auto_43653 - BLOCK
      ?auto_43658 - BLOCK
      ?auto_43656 - BLOCK
      ?auto_43655 - BLOCK
      ?auto_43654 - BLOCK
      ?auto_43657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43652 ?auto_43653 ) ) ( ON-TABLE ?auto_43658 ) ( ON ?auto_43656 ?auto_43658 ) ( not ( = ?auto_43658 ?auto_43656 ) ) ( not ( = ?auto_43658 ?auto_43655 ) ) ( not ( = ?auto_43658 ?auto_43654 ) ) ( not ( = ?auto_43658 ?auto_43653 ) ) ( not ( = ?auto_43658 ?auto_43652 ) ) ( not ( = ?auto_43656 ?auto_43655 ) ) ( not ( = ?auto_43656 ?auto_43654 ) ) ( not ( = ?auto_43656 ?auto_43653 ) ) ( not ( = ?auto_43656 ?auto_43652 ) ) ( not ( = ?auto_43655 ?auto_43654 ) ) ( not ( = ?auto_43655 ?auto_43653 ) ) ( not ( = ?auto_43655 ?auto_43652 ) ) ( not ( = ?auto_43654 ?auto_43653 ) ) ( not ( = ?auto_43654 ?auto_43652 ) ) ( ON ?auto_43652 ?auto_43657 ) ( not ( = ?auto_43652 ?auto_43657 ) ) ( not ( = ?auto_43653 ?auto_43657 ) ) ( not ( = ?auto_43658 ?auto_43657 ) ) ( not ( = ?auto_43656 ?auto_43657 ) ) ( not ( = ?auto_43655 ?auto_43657 ) ) ( not ( = ?auto_43654 ?auto_43657 ) ) ( ON ?auto_43653 ?auto_43652 ) ( ON-TABLE ?auto_43657 ) ( ON ?auto_43654 ?auto_43653 ) ( CLEAR ?auto_43654 ) ( HOLDING ?auto_43655 ) ( CLEAR ?auto_43656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43658 ?auto_43656 ?auto_43655 )
      ( MAKE-1PILE ?auto_43652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43659 - BLOCK
    )
    :vars
    (
      ?auto_43662 - BLOCK
      ?auto_43660 - BLOCK
      ?auto_43661 - BLOCK
      ?auto_43664 - BLOCK
      ?auto_43665 - BLOCK
      ?auto_43663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43659 ?auto_43662 ) ) ( ON-TABLE ?auto_43660 ) ( ON ?auto_43661 ?auto_43660 ) ( not ( = ?auto_43660 ?auto_43661 ) ) ( not ( = ?auto_43660 ?auto_43664 ) ) ( not ( = ?auto_43660 ?auto_43665 ) ) ( not ( = ?auto_43660 ?auto_43662 ) ) ( not ( = ?auto_43660 ?auto_43659 ) ) ( not ( = ?auto_43661 ?auto_43664 ) ) ( not ( = ?auto_43661 ?auto_43665 ) ) ( not ( = ?auto_43661 ?auto_43662 ) ) ( not ( = ?auto_43661 ?auto_43659 ) ) ( not ( = ?auto_43664 ?auto_43665 ) ) ( not ( = ?auto_43664 ?auto_43662 ) ) ( not ( = ?auto_43664 ?auto_43659 ) ) ( not ( = ?auto_43665 ?auto_43662 ) ) ( not ( = ?auto_43665 ?auto_43659 ) ) ( ON ?auto_43659 ?auto_43663 ) ( not ( = ?auto_43659 ?auto_43663 ) ) ( not ( = ?auto_43662 ?auto_43663 ) ) ( not ( = ?auto_43660 ?auto_43663 ) ) ( not ( = ?auto_43661 ?auto_43663 ) ) ( not ( = ?auto_43664 ?auto_43663 ) ) ( not ( = ?auto_43665 ?auto_43663 ) ) ( ON ?auto_43662 ?auto_43659 ) ( ON-TABLE ?auto_43663 ) ( ON ?auto_43665 ?auto_43662 ) ( CLEAR ?auto_43661 ) ( ON ?auto_43664 ?auto_43665 ) ( CLEAR ?auto_43664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43663 ?auto_43659 ?auto_43662 ?auto_43665 )
      ( MAKE-1PILE ?auto_43659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43666 - BLOCK
    )
    :vars
    (
      ?auto_43670 - BLOCK
      ?auto_43669 - BLOCK
      ?auto_43668 - BLOCK
      ?auto_43671 - BLOCK
      ?auto_43672 - BLOCK
      ?auto_43667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43666 ?auto_43670 ) ) ( ON-TABLE ?auto_43669 ) ( not ( = ?auto_43669 ?auto_43668 ) ) ( not ( = ?auto_43669 ?auto_43671 ) ) ( not ( = ?auto_43669 ?auto_43672 ) ) ( not ( = ?auto_43669 ?auto_43670 ) ) ( not ( = ?auto_43669 ?auto_43666 ) ) ( not ( = ?auto_43668 ?auto_43671 ) ) ( not ( = ?auto_43668 ?auto_43672 ) ) ( not ( = ?auto_43668 ?auto_43670 ) ) ( not ( = ?auto_43668 ?auto_43666 ) ) ( not ( = ?auto_43671 ?auto_43672 ) ) ( not ( = ?auto_43671 ?auto_43670 ) ) ( not ( = ?auto_43671 ?auto_43666 ) ) ( not ( = ?auto_43672 ?auto_43670 ) ) ( not ( = ?auto_43672 ?auto_43666 ) ) ( ON ?auto_43666 ?auto_43667 ) ( not ( = ?auto_43666 ?auto_43667 ) ) ( not ( = ?auto_43670 ?auto_43667 ) ) ( not ( = ?auto_43669 ?auto_43667 ) ) ( not ( = ?auto_43668 ?auto_43667 ) ) ( not ( = ?auto_43671 ?auto_43667 ) ) ( not ( = ?auto_43672 ?auto_43667 ) ) ( ON ?auto_43670 ?auto_43666 ) ( ON-TABLE ?auto_43667 ) ( ON ?auto_43672 ?auto_43670 ) ( ON ?auto_43671 ?auto_43672 ) ( CLEAR ?auto_43671 ) ( HOLDING ?auto_43668 ) ( CLEAR ?auto_43669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43669 ?auto_43668 )
      ( MAKE-1PILE ?auto_43666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43673 - BLOCK
    )
    :vars
    (
      ?auto_43675 - BLOCK
      ?auto_43676 - BLOCK
      ?auto_43679 - BLOCK
      ?auto_43674 - BLOCK
      ?auto_43678 - BLOCK
      ?auto_43677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43673 ?auto_43675 ) ) ( ON-TABLE ?auto_43676 ) ( not ( = ?auto_43676 ?auto_43679 ) ) ( not ( = ?auto_43676 ?auto_43674 ) ) ( not ( = ?auto_43676 ?auto_43678 ) ) ( not ( = ?auto_43676 ?auto_43675 ) ) ( not ( = ?auto_43676 ?auto_43673 ) ) ( not ( = ?auto_43679 ?auto_43674 ) ) ( not ( = ?auto_43679 ?auto_43678 ) ) ( not ( = ?auto_43679 ?auto_43675 ) ) ( not ( = ?auto_43679 ?auto_43673 ) ) ( not ( = ?auto_43674 ?auto_43678 ) ) ( not ( = ?auto_43674 ?auto_43675 ) ) ( not ( = ?auto_43674 ?auto_43673 ) ) ( not ( = ?auto_43678 ?auto_43675 ) ) ( not ( = ?auto_43678 ?auto_43673 ) ) ( ON ?auto_43673 ?auto_43677 ) ( not ( = ?auto_43673 ?auto_43677 ) ) ( not ( = ?auto_43675 ?auto_43677 ) ) ( not ( = ?auto_43676 ?auto_43677 ) ) ( not ( = ?auto_43679 ?auto_43677 ) ) ( not ( = ?auto_43674 ?auto_43677 ) ) ( not ( = ?auto_43678 ?auto_43677 ) ) ( ON ?auto_43675 ?auto_43673 ) ( ON-TABLE ?auto_43677 ) ( ON ?auto_43678 ?auto_43675 ) ( ON ?auto_43674 ?auto_43678 ) ( CLEAR ?auto_43676 ) ( ON ?auto_43679 ?auto_43674 ) ( CLEAR ?auto_43679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43677 ?auto_43673 ?auto_43675 ?auto_43678 ?auto_43674 )
      ( MAKE-1PILE ?auto_43673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43680 - BLOCK
    )
    :vars
    (
      ?auto_43682 - BLOCK
      ?auto_43683 - BLOCK
      ?auto_43686 - BLOCK
      ?auto_43684 - BLOCK
      ?auto_43685 - BLOCK
      ?auto_43681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43680 ?auto_43682 ) ) ( not ( = ?auto_43683 ?auto_43686 ) ) ( not ( = ?auto_43683 ?auto_43684 ) ) ( not ( = ?auto_43683 ?auto_43685 ) ) ( not ( = ?auto_43683 ?auto_43682 ) ) ( not ( = ?auto_43683 ?auto_43680 ) ) ( not ( = ?auto_43686 ?auto_43684 ) ) ( not ( = ?auto_43686 ?auto_43685 ) ) ( not ( = ?auto_43686 ?auto_43682 ) ) ( not ( = ?auto_43686 ?auto_43680 ) ) ( not ( = ?auto_43684 ?auto_43685 ) ) ( not ( = ?auto_43684 ?auto_43682 ) ) ( not ( = ?auto_43684 ?auto_43680 ) ) ( not ( = ?auto_43685 ?auto_43682 ) ) ( not ( = ?auto_43685 ?auto_43680 ) ) ( ON ?auto_43680 ?auto_43681 ) ( not ( = ?auto_43680 ?auto_43681 ) ) ( not ( = ?auto_43682 ?auto_43681 ) ) ( not ( = ?auto_43683 ?auto_43681 ) ) ( not ( = ?auto_43686 ?auto_43681 ) ) ( not ( = ?auto_43684 ?auto_43681 ) ) ( not ( = ?auto_43685 ?auto_43681 ) ) ( ON ?auto_43682 ?auto_43680 ) ( ON-TABLE ?auto_43681 ) ( ON ?auto_43685 ?auto_43682 ) ( ON ?auto_43684 ?auto_43685 ) ( ON ?auto_43686 ?auto_43684 ) ( CLEAR ?auto_43686 ) ( HOLDING ?auto_43683 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43683 )
      ( MAKE-1PILE ?auto_43680 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43687 - BLOCK
    )
    :vars
    (
      ?auto_43689 - BLOCK
      ?auto_43691 - BLOCK
      ?auto_43692 - BLOCK
      ?auto_43688 - BLOCK
      ?auto_43690 - BLOCK
      ?auto_43693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43687 ?auto_43689 ) ) ( not ( = ?auto_43691 ?auto_43692 ) ) ( not ( = ?auto_43691 ?auto_43688 ) ) ( not ( = ?auto_43691 ?auto_43690 ) ) ( not ( = ?auto_43691 ?auto_43689 ) ) ( not ( = ?auto_43691 ?auto_43687 ) ) ( not ( = ?auto_43692 ?auto_43688 ) ) ( not ( = ?auto_43692 ?auto_43690 ) ) ( not ( = ?auto_43692 ?auto_43689 ) ) ( not ( = ?auto_43692 ?auto_43687 ) ) ( not ( = ?auto_43688 ?auto_43690 ) ) ( not ( = ?auto_43688 ?auto_43689 ) ) ( not ( = ?auto_43688 ?auto_43687 ) ) ( not ( = ?auto_43690 ?auto_43689 ) ) ( not ( = ?auto_43690 ?auto_43687 ) ) ( ON ?auto_43687 ?auto_43693 ) ( not ( = ?auto_43687 ?auto_43693 ) ) ( not ( = ?auto_43689 ?auto_43693 ) ) ( not ( = ?auto_43691 ?auto_43693 ) ) ( not ( = ?auto_43692 ?auto_43693 ) ) ( not ( = ?auto_43688 ?auto_43693 ) ) ( not ( = ?auto_43690 ?auto_43693 ) ) ( ON ?auto_43689 ?auto_43687 ) ( ON-TABLE ?auto_43693 ) ( ON ?auto_43690 ?auto_43689 ) ( ON ?auto_43688 ?auto_43690 ) ( ON ?auto_43692 ?auto_43688 ) ( ON ?auto_43691 ?auto_43692 ) ( CLEAR ?auto_43691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43693 ?auto_43687 ?auto_43689 ?auto_43690 ?auto_43688 ?auto_43692 )
      ( MAKE-1PILE ?auto_43687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43698 - BLOCK
      ?auto_43699 - BLOCK
      ?auto_43700 - BLOCK
      ?auto_43701 - BLOCK
    )
    :vars
    (
      ?auto_43702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43702 ?auto_43701 ) ( CLEAR ?auto_43702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43698 ) ( ON ?auto_43699 ?auto_43698 ) ( ON ?auto_43700 ?auto_43699 ) ( ON ?auto_43701 ?auto_43700 ) ( not ( = ?auto_43698 ?auto_43699 ) ) ( not ( = ?auto_43698 ?auto_43700 ) ) ( not ( = ?auto_43698 ?auto_43701 ) ) ( not ( = ?auto_43698 ?auto_43702 ) ) ( not ( = ?auto_43699 ?auto_43700 ) ) ( not ( = ?auto_43699 ?auto_43701 ) ) ( not ( = ?auto_43699 ?auto_43702 ) ) ( not ( = ?auto_43700 ?auto_43701 ) ) ( not ( = ?auto_43700 ?auto_43702 ) ) ( not ( = ?auto_43701 ?auto_43702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43702 ?auto_43701 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43703 - BLOCK
      ?auto_43704 - BLOCK
      ?auto_43705 - BLOCK
      ?auto_43706 - BLOCK
    )
    :vars
    (
      ?auto_43707 - BLOCK
      ?auto_43708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43707 ?auto_43706 ) ( CLEAR ?auto_43707 ) ( ON-TABLE ?auto_43703 ) ( ON ?auto_43704 ?auto_43703 ) ( ON ?auto_43705 ?auto_43704 ) ( ON ?auto_43706 ?auto_43705 ) ( not ( = ?auto_43703 ?auto_43704 ) ) ( not ( = ?auto_43703 ?auto_43705 ) ) ( not ( = ?auto_43703 ?auto_43706 ) ) ( not ( = ?auto_43703 ?auto_43707 ) ) ( not ( = ?auto_43704 ?auto_43705 ) ) ( not ( = ?auto_43704 ?auto_43706 ) ) ( not ( = ?auto_43704 ?auto_43707 ) ) ( not ( = ?auto_43705 ?auto_43706 ) ) ( not ( = ?auto_43705 ?auto_43707 ) ) ( not ( = ?auto_43706 ?auto_43707 ) ) ( HOLDING ?auto_43708 ) ( not ( = ?auto_43703 ?auto_43708 ) ) ( not ( = ?auto_43704 ?auto_43708 ) ) ( not ( = ?auto_43705 ?auto_43708 ) ) ( not ( = ?auto_43706 ?auto_43708 ) ) ( not ( = ?auto_43707 ?auto_43708 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_43708 )
      ( MAKE-4PILE ?auto_43703 ?auto_43704 ?auto_43705 ?auto_43706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43709 - BLOCK
      ?auto_43710 - BLOCK
      ?auto_43711 - BLOCK
      ?auto_43712 - BLOCK
    )
    :vars
    (
      ?auto_43714 - BLOCK
      ?auto_43713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43714 ?auto_43712 ) ( ON-TABLE ?auto_43709 ) ( ON ?auto_43710 ?auto_43709 ) ( ON ?auto_43711 ?auto_43710 ) ( ON ?auto_43712 ?auto_43711 ) ( not ( = ?auto_43709 ?auto_43710 ) ) ( not ( = ?auto_43709 ?auto_43711 ) ) ( not ( = ?auto_43709 ?auto_43712 ) ) ( not ( = ?auto_43709 ?auto_43714 ) ) ( not ( = ?auto_43710 ?auto_43711 ) ) ( not ( = ?auto_43710 ?auto_43712 ) ) ( not ( = ?auto_43710 ?auto_43714 ) ) ( not ( = ?auto_43711 ?auto_43712 ) ) ( not ( = ?auto_43711 ?auto_43714 ) ) ( not ( = ?auto_43712 ?auto_43714 ) ) ( not ( = ?auto_43709 ?auto_43713 ) ) ( not ( = ?auto_43710 ?auto_43713 ) ) ( not ( = ?auto_43711 ?auto_43713 ) ) ( not ( = ?auto_43712 ?auto_43713 ) ) ( not ( = ?auto_43714 ?auto_43713 ) ) ( ON ?auto_43713 ?auto_43714 ) ( CLEAR ?auto_43713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43709 ?auto_43710 ?auto_43711 ?auto_43712 ?auto_43714 )
      ( MAKE-4PILE ?auto_43709 ?auto_43710 ?auto_43711 ?auto_43712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43715 - BLOCK
      ?auto_43716 - BLOCK
      ?auto_43717 - BLOCK
      ?auto_43718 - BLOCK
    )
    :vars
    (
      ?auto_43719 - BLOCK
      ?auto_43720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43719 ?auto_43718 ) ( ON-TABLE ?auto_43715 ) ( ON ?auto_43716 ?auto_43715 ) ( ON ?auto_43717 ?auto_43716 ) ( ON ?auto_43718 ?auto_43717 ) ( not ( = ?auto_43715 ?auto_43716 ) ) ( not ( = ?auto_43715 ?auto_43717 ) ) ( not ( = ?auto_43715 ?auto_43718 ) ) ( not ( = ?auto_43715 ?auto_43719 ) ) ( not ( = ?auto_43716 ?auto_43717 ) ) ( not ( = ?auto_43716 ?auto_43718 ) ) ( not ( = ?auto_43716 ?auto_43719 ) ) ( not ( = ?auto_43717 ?auto_43718 ) ) ( not ( = ?auto_43717 ?auto_43719 ) ) ( not ( = ?auto_43718 ?auto_43719 ) ) ( not ( = ?auto_43715 ?auto_43720 ) ) ( not ( = ?auto_43716 ?auto_43720 ) ) ( not ( = ?auto_43717 ?auto_43720 ) ) ( not ( = ?auto_43718 ?auto_43720 ) ) ( not ( = ?auto_43719 ?auto_43720 ) ) ( HOLDING ?auto_43720 ) ( CLEAR ?auto_43719 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43715 ?auto_43716 ?auto_43717 ?auto_43718 ?auto_43719 ?auto_43720 )
      ( MAKE-4PILE ?auto_43715 ?auto_43716 ?auto_43717 ?auto_43718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43721 - BLOCK
      ?auto_43722 - BLOCK
      ?auto_43723 - BLOCK
      ?auto_43724 - BLOCK
    )
    :vars
    (
      ?auto_43725 - BLOCK
      ?auto_43726 - BLOCK
      ?auto_43727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43725 ?auto_43724 ) ( ON-TABLE ?auto_43721 ) ( ON ?auto_43722 ?auto_43721 ) ( ON ?auto_43723 ?auto_43722 ) ( ON ?auto_43724 ?auto_43723 ) ( not ( = ?auto_43721 ?auto_43722 ) ) ( not ( = ?auto_43721 ?auto_43723 ) ) ( not ( = ?auto_43721 ?auto_43724 ) ) ( not ( = ?auto_43721 ?auto_43725 ) ) ( not ( = ?auto_43722 ?auto_43723 ) ) ( not ( = ?auto_43722 ?auto_43724 ) ) ( not ( = ?auto_43722 ?auto_43725 ) ) ( not ( = ?auto_43723 ?auto_43724 ) ) ( not ( = ?auto_43723 ?auto_43725 ) ) ( not ( = ?auto_43724 ?auto_43725 ) ) ( not ( = ?auto_43721 ?auto_43726 ) ) ( not ( = ?auto_43722 ?auto_43726 ) ) ( not ( = ?auto_43723 ?auto_43726 ) ) ( not ( = ?auto_43724 ?auto_43726 ) ) ( not ( = ?auto_43725 ?auto_43726 ) ) ( CLEAR ?auto_43725 ) ( ON ?auto_43726 ?auto_43727 ) ( CLEAR ?auto_43726 ) ( HAND-EMPTY ) ( not ( = ?auto_43721 ?auto_43727 ) ) ( not ( = ?auto_43722 ?auto_43727 ) ) ( not ( = ?auto_43723 ?auto_43727 ) ) ( not ( = ?auto_43724 ?auto_43727 ) ) ( not ( = ?auto_43725 ?auto_43727 ) ) ( not ( = ?auto_43726 ?auto_43727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43726 ?auto_43727 )
      ( MAKE-4PILE ?auto_43721 ?auto_43722 ?auto_43723 ?auto_43724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43742 - BLOCK
      ?auto_43743 - BLOCK
      ?auto_43744 - BLOCK
      ?auto_43745 - BLOCK
    )
    :vars
    (
      ?auto_43747 - BLOCK
      ?auto_43746 - BLOCK
      ?auto_43748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43742 ) ( ON ?auto_43743 ?auto_43742 ) ( ON ?auto_43744 ?auto_43743 ) ( not ( = ?auto_43742 ?auto_43743 ) ) ( not ( = ?auto_43742 ?auto_43744 ) ) ( not ( = ?auto_43742 ?auto_43745 ) ) ( not ( = ?auto_43742 ?auto_43747 ) ) ( not ( = ?auto_43743 ?auto_43744 ) ) ( not ( = ?auto_43743 ?auto_43745 ) ) ( not ( = ?auto_43743 ?auto_43747 ) ) ( not ( = ?auto_43744 ?auto_43745 ) ) ( not ( = ?auto_43744 ?auto_43747 ) ) ( not ( = ?auto_43745 ?auto_43747 ) ) ( not ( = ?auto_43742 ?auto_43746 ) ) ( not ( = ?auto_43743 ?auto_43746 ) ) ( not ( = ?auto_43744 ?auto_43746 ) ) ( not ( = ?auto_43745 ?auto_43746 ) ) ( not ( = ?auto_43747 ?auto_43746 ) ) ( ON ?auto_43746 ?auto_43748 ) ( not ( = ?auto_43742 ?auto_43748 ) ) ( not ( = ?auto_43743 ?auto_43748 ) ) ( not ( = ?auto_43744 ?auto_43748 ) ) ( not ( = ?auto_43745 ?auto_43748 ) ) ( not ( = ?auto_43747 ?auto_43748 ) ) ( not ( = ?auto_43746 ?auto_43748 ) ) ( ON ?auto_43747 ?auto_43746 ) ( CLEAR ?auto_43747 ) ( HOLDING ?auto_43745 ) ( CLEAR ?auto_43744 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43742 ?auto_43743 ?auto_43744 ?auto_43745 ?auto_43747 )
      ( MAKE-4PILE ?auto_43742 ?auto_43743 ?auto_43744 ?auto_43745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43749 - BLOCK
      ?auto_43750 - BLOCK
      ?auto_43751 - BLOCK
      ?auto_43752 - BLOCK
    )
    :vars
    (
      ?auto_43753 - BLOCK
      ?auto_43754 - BLOCK
      ?auto_43755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43749 ) ( ON ?auto_43750 ?auto_43749 ) ( ON ?auto_43751 ?auto_43750 ) ( not ( = ?auto_43749 ?auto_43750 ) ) ( not ( = ?auto_43749 ?auto_43751 ) ) ( not ( = ?auto_43749 ?auto_43752 ) ) ( not ( = ?auto_43749 ?auto_43753 ) ) ( not ( = ?auto_43750 ?auto_43751 ) ) ( not ( = ?auto_43750 ?auto_43752 ) ) ( not ( = ?auto_43750 ?auto_43753 ) ) ( not ( = ?auto_43751 ?auto_43752 ) ) ( not ( = ?auto_43751 ?auto_43753 ) ) ( not ( = ?auto_43752 ?auto_43753 ) ) ( not ( = ?auto_43749 ?auto_43754 ) ) ( not ( = ?auto_43750 ?auto_43754 ) ) ( not ( = ?auto_43751 ?auto_43754 ) ) ( not ( = ?auto_43752 ?auto_43754 ) ) ( not ( = ?auto_43753 ?auto_43754 ) ) ( ON ?auto_43754 ?auto_43755 ) ( not ( = ?auto_43749 ?auto_43755 ) ) ( not ( = ?auto_43750 ?auto_43755 ) ) ( not ( = ?auto_43751 ?auto_43755 ) ) ( not ( = ?auto_43752 ?auto_43755 ) ) ( not ( = ?auto_43753 ?auto_43755 ) ) ( not ( = ?auto_43754 ?auto_43755 ) ) ( ON ?auto_43753 ?auto_43754 ) ( CLEAR ?auto_43751 ) ( ON ?auto_43752 ?auto_43753 ) ( CLEAR ?auto_43752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43755 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43755 ?auto_43754 ?auto_43753 )
      ( MAKE-4PILE ?auto_43749 ?auto_43750 ?auto_43751 ?auto_43752 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43756 - BLOCK
      ?auto_43757 - BLOCK
      ?auto_43758 - BLOCK
      ?auto_43759 - BLOCK
    )
    :vars
    (
      ?auto_43761 - BLOCK
      ?auto_43760 - BLOCK
      ?auto_43762 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43756 ) ( ON ?auto_43757 ?auto_43756 ) ( not ( = ?auto_43756 ?auto_43757 ) ) ( not ( = ?auto_43756 ?auto_43758 ) ) ( not ( = ?auto_43756 ?auto_43759 ) ) ( not ( = ?auto_43756 ?auto_43761 ) ) ( not ( = ?auto_43757 ?auto_43758 ) ) ( not ( = ?auto_43757 ?auto_43759 ) ) ( not ( = ?auto_43757 ?auto_43761 ) ) ( not ( = ?auto_43758 ?auto_43759 ) ) ( not ( = ?auto_43758 ?auto_43761 ) ) ( not ( = ?auto_43759 ?auto_43761 ) ) ( not ( = ?auto_43756 ?auto_43760 ) ) ( not ( = ?auto_43757 ?auto_43760 ) ) ( not ( = ?auto_43758 ?auto_43760 ) ) ( not ( = ?auto_43759 ?auto_43760 ) ) ( not ( = ?auto_43761 ?auto_43760 ) ) ( ON ?auto_43760 ?auto_43762 ) ( not ( = ?auto_43756 ?auto_43762 ) ) ( not ( = ?auto_43757 ?auto_43762 ) ) ( not ( = ?auto_43758 ?auto_43762 ) ) ( not ( = ?auto_43759 ?auto_43762 ) ) ( not ( = ?auto_43761 ?auto_43762 ) ) ( not ( = ?auto_43760 ?auto_43762 ) ) ( ON ?auto_43761 ?auto_43760 ) ( ON ?auto_43759 ?auto_43761 ) ( CLEAR ?auto_43759 ) ( ON-TABLE ?auto_43762 ) ( HOLDING ?auto_43758 ) ( CLEAR ?auto_43757 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43756 ?auto_43757 ?auto_43758 )
      ( MAKE-4PILE ?auto_43756 ?auto_43757 ?auto_43758 ?auto_43759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43763 - BLOCK
      ?auto_43764 - BLOCK
      ?auto_43765 - BLOCK
      ?auto_43766 - BLOCK
    )
    :vars
    (
      ?auto_43767 - BLOCK
      ?auto_43769 - BLOCK
      ?auto_43768 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43763 ) ( ON ?auto_43764 ?auto_43763 ) ( not ( = ?auto_43763 ?auto_43764 ) ) ( not ( = ?auto_43763 ?auto_43765 ) ) ( not ( = ?auto_43763 ?auto_43766 ) ) ( not ( = ?auto_43763 ?auto_43767 ) ) ( not ( = ?auto_43764 ?auto_43765 ) ) ( not ( = ?auto_43764 ?auto_43766 ) ) ( not ( = ?auto_43764 ?auto_43767 ) ) ( not ( = ?auto_43765 ?auto_43766 ) ) ( not ( = ?auto_43765 ?auto_43767 ) ) ( not ( = ?auto_43766 ?auto_43767 ) ) ( not ( = ?auto_43763 ?auto_43769 ) ) ( not ( = ?auto_43764 ?auto_43769 ) ) ( not ( = ?auto_43765 ?auto_43769 ) ) ( not ( = ?auto_43766 ?auto_43769 ) ) ( not ( = ?auto_43767 ?auto_43769 ) ) ( ON ?auto_43769 ?auto_43768 ) ( not ( = ?auto_43763 ?auto_43768 ) ) ( not ( = ?auto_43764 ?auto_43768 ) ) ( not ( = ?auto_43765 ?auto_43768 ) ) ( not ( = ?auto_43766 ?auto_43768 ) ) ( not ( = ?auto_43767 ?auto_43768 ) ) ( not ( = ?auto_43769 ?auto_43768 ) ) ( ON ?auto_43767 ?auto_43769 ) ( ON ?auto_43766 ?auto_43767 ) ( ON-TABLE ?auto_43768 ) ( CLEAR ?auto_43764 ) ( ON ?auto_43765 ?auto_43766 ) ( CLEAR ?auto_43765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43768 ?auto_43769 ?auto_43767 ?auto_43766 )
      ( MAKE-4PILE ?auto_43763 ?auto_43764 ?auto_43765 ?auto_43766 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43770 - BLOCK
      ?auto_43771 - BLOCK
      ?auto_43772 - BLOCK
      ?auto_43773 - BLOCK
    )
    :vars
    (
      ?auto_43775 - BLOCK
      ?auto_43776 - BLOCK
      ?auto_43774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43770 ) ( not ( = ?auto_43770 ?auto_43771 ) ) ( not ( = ?auto_43770 ?auto_43772 ) ) ( not ( = ?auto_43770 ?auto_43773 ) ) ( not ( = ?auto_43770 ?auto_43775 ) ) ( not ( = ?auto_43771 ?auto_43772 ) ) ( not ( = ?auto_43771 ?auto_43773 ) ) ( not ( = ?auto_43771 ?auto_43775 ) ) ( not ( = ?auto_43772 ?auto_43773 ) ) ( not ( = ?auto_43772 ?auto_43775 ) ) ( not ( = ?auto_43773 ?auto_43775 ) ) ( not ( = ?auto_43770 ?auto_43776 ) ) ( not ( = ?auto_43771 ?auto_43776 ) ) ( not ( = ?auto_43772 ?auto_43776 ) ) ( not ( = ?auto_43773 ?auto_43776 ) ) ( not ( = ?auto_43775 ?auto_43776 ) ) ( ON ?auto_43776 ?auto_43774 ) ( not ( = ?auto_43770 ?auto_43774 ) ) ( not ( = ?auto_43771 ?auto_43774 ) ) ( not ( = ?auto_43772 ?auto_43774 ) ) ( not ( = ?auto_43773 ?auto_43774 ) ) ( not ( = ?auto_43775 ?auto_43774 ) ) ( not ( = ?auto_43776 ?auto_43774 ) ) ( ON ?auto_43775 ?auto_43776 ) ( ON ?auto_43773 ?auto_43775 ) ( ON-TABLE ?auto_43774 ) ( ON ?auto_43772 ?auto_43773 ) ( CLEAR ?auto_43772 ) ( HOLDING ?auto_43771 ) ( CLEAR ?auto_43770 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43770 ?auto_43771 )
      ( MAKE-4PILE ?auto_43770 ?auto_43771 ?auto_43772 ?auto_43773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43777 - BLOCK
      ?auto_43778 - BLOCK
      ?auto_43779 - BLOCK
      ?auto_43780 - BLOCK
    )
    :vars
    (
      ?auto_43783 - BLOCK
      ?auto_43781 - BLOCK
      ?auto_43782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43777 ) ( not ( = ?auto_43777 ?auto_43778 ) ) ( not ( = ?auto_43777 ?auto_43779 ) ) ( not ( = ?auto_43777 ?auto_43780 ) ) ( not ( = ?auto_43777 ?auto_43783 ) ) ( not ( = ?auto_43778 ?auto_43779 ) ) ( not ( = ?auto_43778 ?auto_43780 ) ) ( not ( = ?auto_43778 ?auto_43783 ) ) ( not ( = ?auto_43779 ?auto_43780 ) ) ( not ( = ?auto_43779 ?auto_43783 ) ) ( not ( = ?auto_43780 ?auto_43783 ) ) ( not ( = ?auto_43777 ?auto_43781 ) ) ( not ( = ?auto_43778 ?auto_43781 ) ) ( not ( = ?auto_43779 ?auto_43781 ) ) ( not ( = ?auto_43780 ?auto_43781 ) ) ( not ( = ?auto_43783 ?auto_43781 ) ) ( ON ?auto_43781 ?auto_43782 ) ( not ( = ?auto_43777 ?auto_43782 ) ) ( not ( = ?auto_43778 ?auto_43782 ) ) ( not ( = ?auto_43779 ?auto_43782 ) ) ( not ( = ?auto_43780 ?auto_43782 ) ) ( not ( = ?auto_43783 ?auto_43782 ) ) ( not ( = ?auto_43781 ?auto_43782 ) ) ( ON ?auto_43783 ?auto_43781 ) ( ON ?auto_43780 ?auto_43783 ) ( ON-TABLE ?auto_43782 ) ( ON ?auto_43779 ?auto_43780 ) ( CLEAR ?auto_43777 ) ( ON ?auto_43778 ?auto_43779 ) ( CLEAR ?auto_43778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43782 ?auto_43781 ?auto_43783 ?auto_43780 ?auto_43779 )
      ( MAKE-4PILE ?auto_43777 ?auto_43778 ?auto_43779 ?auto_43780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43784 - BLOCK
      ?auto_43785 - BLOCK
      ?auto_43786 - BLOCK
      ?auto_43787 - BLOCK
    )
    :vars
    (
      ?auto_43788 - BLOCK
      ?auto_43790 - BLOCK
      ?auto_43789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43784 ?auto_43785 ) ) ( not ( = ?auto_43784 ?auto_43786 ) ) ( not ( = ?auto_43784 ?auto_43787 ) ) ( not ( = ?auto_43784 ?auto_43788 ) ) ( not ( = ?auto_43785 ?auto_43786 ) ) ( not ( = ?auto_43785 ?auto_43787 ) ) ( not ( = ?auto_43785 ?auto_43788 ) ) ( not ( = ?auto_43786 ?auto_43787 ) ) ( not ( = ?auto_43786 ?auto_43788 ) ) ( not ( = ?auto_43787 ?auto_43788 ) ) ( not ( = ?auto_43784 ?auto_43790 ) ) ( not ( = ?auto_43785 ?auto_43790 ) ) ( not ( = ?auto_43786 ?auto_43790 ) ) ( not ( = ?auto_43787 ?auto_43790 ) ) ( not ( = ?auto_43788 ?auto_43790 ) ) ( ON ?auto_43790 ?auto_43789 ) ( not ( = ?auto_43784 ?auto_43789 ) ) ( not ( = ?auto_43785 ?auto_43789 ) ) ( not ( = ?auto_43786 ?auto_43789 ) ) ( not ( = ?auto_43787 ?auto_43789 ) ) ( not ( = ?auto_43788 ?auto_43789 ) ) ( not ( = ?auto_43790 ?auto_43789 ) ) ( ON ?auto_43788 ?auto_43790 ) ( ON ?auto_43787 ?auto_43788 ) ( ON-TABLE ?auto_43789 ) ( ON ?auto_43786 ?auto_43787 ) ( ON ?auto_43785 ?auto_43786 ) ( CLEAR ?auto_43785 ) ( HOLDING ?auto_43784 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43784 )
      ( MAKE-4PILE ?auto_43784 ?auto_43785 ?auto_43786 ?auto_43787 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43791 - BLOCK
      ?auto_43792 - BLOCK
      ?auto_43793 - BLOCK
      ?auto_43794 - BLOCK
    )
    :vars
    (
      ?auto_43796 - BLOCK
      ?auto_43797 - BLOCK
      ?auto_43795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43791 ?auto_43792 ) ) ( not ( = ?auto_43791 ?auto_43793 ) ) ( not ( = ?auto_43791 ?auto_43794 ) ) ( not ( = ?auto_43791 ?auto_43796 ) ) ( not ( = ?auto_43792 ?auto_43793 ) ) ( not ( = ?auto_43792 ?auto_43794 ) ) ( not ( = ?auto_43792 ?auto_43796 ) ) ( not ( = ?auto_43793 ?auto_43794 ) ) ( not ( = ?auto_43793 ?auto_43796 ) ) ( not ( = ?auto_43794 ?auto_43796 ) ) ( not ( = ?auto_43791 ?auto_43797 ) ) ( not ( = ?auto_43792 ?auto_43797 ) ) ( not ( = ?auto_43793 ?auto_43797 ) ) ( not ( = ?auto_43794 ?auto_43797 ) ) ( not ( = ?auto_43796 ?auto_43797 ) ) ( ON ?auto_43797 ?auto_43795 ) ( not ( = ?auto_43791 ?auto_43795 ) ) ( not ( = ?auto_43792 ?auto_43795 ) ) ( not ( = ?auto_43793 ?auto_43795 ) ) ( not ( = ?auto_43794 ?auto_43795 ) ) ( not ( = ?auto_43796 ?auto_43795 ) ) ( not ( = ?auto_43797 ?auto_43795 ) ) ( ON ?auto_43796 ?auto_43797 ) ( ON ?auto_43794 ?auto_43796 ) ( ON-TABLE ?auto_43795 ) ( ON ?auto_43793 ?auto_43794 ) ( ON ?auto_43792 ?auto_43793 ) ( ON ?auto_43791 ?auto_43792 ) ( CLEAR ?auto_43791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43795 ?auto_43797 ?auto_43796 ?auto_43794 ?auto_43793 ?auto_43792 )
      ( MAKE-4PILE ?auto_43791 ?auto_43792 ?auto_43793 ?auto_43794 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43800 - BLOCK
      ?auto_43801 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_43801 ) ( CLEAR ?auto_43800 ) ( ON-TABLE ?auto_43800 ) ( not ( = ?auto_43800 ?auto_43801 ) ) )
    :subtasks
    ( ( !STACK ?auto_43801 ?auto_43800 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43802 - BLOCK
      ?auto_43803 - BLOCK
    )
    :vars
    (
      ?auto_43804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43802 ) ( ON-TABLE ?auto_43802 ) ( not ( = ?auto_43802 ?auto_43803 ) ) ( ON ?auto_43803 ?auto_43804 ) ( CLEAR ?auto_43803 ) ( HAND-EMPTY ) ( not ( = ?auto_43802 ?auto_43804 ) ) ( not ( = ?auto_43803 ?auto_43804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43803 ?auto_43804 )
      ( MAKE-2PILE ?auto_43802 ?auto_43803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43805 - BLOCK
      ?auto_43806 - BLOCK
    )
    :vars
    (
      ?auto_43807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43805 ?auto_43806 ) ) ( ON ?auto_43806 ?auto_43807 ) ( CLEAR ?auto_43806 ) ( not ( = ?auto_43805 ?auto_43807 ) ) ( not ( = ?auto_43806 ?auto_43807 ) ) ( HOLDING ?auto_43805 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43805 )
      ( MAKE-2PILE ?auto_43805 ?auto_43806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43808 - BLOCK
      ?auto_43809 - BLOCK
    )
    :vars
    (
      ?auto_43810 - BLOCK
      ?auto_43812 - BLOCK
      ?auto_43811 - BLOCK
      ?auto_43813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43808 ?auto_43809 ) ) ( ON ?auto_43809 ?auto_43810 ) ( not ( = ?auto_43808 ?auto_43810 ) ) ( not ( = ?auto_43809 ?auto_43810 ) ) ( ON ?auto_43808 ?auto_43809 ) ( CLEAR ?auto_43808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43812 ) ( ON ?auto_43811 ?auto_43812 ) ( ON ?auto_43813 ?auto_43811 ) ( ON ?auto_43810 ?auto_43813 ) ( not ( = ?auto_43812 ?auto_43811 ) ) ( not ( = ?auto_43812 ?auto_43813 ) ) ( not ( = ?auto_43812 ?auto_43810 ) ) ( not ( = ?auto_43812 ?auto_43809 ) ) ( not ( = ?auto_43812 ?auto_43808 ) ) ( not ( = ?auto_43811 ?auto_43813 ) ) ( not ( = ?auto_43811 ?auto_43810 ) ) ( not ( = ?auto_43811 ?auto_43809 ) ) ( not ( = ?auto_43811 ?auto_43808 ) ) ( not ( = ?auto_43813 ?auto_43810 ) ) ( not ( = ?auto_43813 ?auto_43809 ) ) ( not ( = ?auto_43813 ?auto_43808 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43812 ?auto_43811 ?auto_43813 ?auto_43810 ?auto_43809 )
      ( MAKE-2PILE ?auto_43808 ?auto_43809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43814 - BLOCK
      ?auto_43815 - BLOCK
    )
    :vars
    (
      ?auto_43816 - BLOCK
      ?auto_43818 - BLOCK
      ?auto_43817 - BLOCK
      ?auto_43819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43814 ?auto_43815 ) ) ( ON ?auto_43815 ?auto_43816 ) ( not ( = ?auto_43814 ?auto_43816 ) ) ( not ( = ?auto_43815 ?auto_43816 ) ) ( ON-TABLE ?auto_43818 ) ( ON ?auto_43817 ?auto_43818 ) ( ON ?auto_43819 ?auto_43817 ) ( ON ?auto_43816 ?auto_43819 ) ( not ( = ?auto_43818 ?auto_43817 ) ) ( not ( = ?auto_43818 ?auto_43819 ) ) ( not ( = ?auto_43818 ?auto_43816 ) ) ( not ( = ?auto_43818 ?auto_43815 ) ) ( not ( = ?auto_43818 ?auto_43814 ) ) ( not ( = ?auto_43817 ?auto_43819 ) ) ( not ( = ?auto_43817 ?auto_43816 ) ) ( not ( = ?auto_43817 ?auto_43815 ) ) ( not ( = ?auto_43817 ?auto_43814 ) ) ( not ( = ?auto_43819 ?auto_43816 ) ) ( not ( = ?auto_43819 ?auto_43815 ) ) ( not ( = ?auto_43819 ?auto_43814 ) ) ( HOLDING ?auto_43814 ) ( CLEAR ?auto_43815 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43818 ?auto_43817 ?auto_43819 ?auto_43816 ?auto_43815 ?auto_43814 )
      ( MAKE-2PILE ?auto_43814 ?auto_43815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43820 - BLOCK
      ?auto_43821 - BLOCK
    )
    :vars
    (
      ?auto_43823 - BLOCK
      ?auto_43822 - BLOCK
      ?auto_43824 - BLOCK
      ?auto_43825 - BLOCK
      ?auto_43826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43820 ?auto_43821 ) ) ( ON ?auto_43821 ?auto_43823 ) ( not ( = ?auto_43820 ?auto_43823 ) ) ( not ( = ?auto_43821 ?auto_43823 ) ) ( ON-TABLE ?auto_43822 ) ( ON ?auto_43824 ?auto_43822 ) ( ON ?auto_43825 ?auto_43824 ) ( ON ?auto_43823 ?auto_43825 ) ( not ( = ?auto_43822 ?auto_43824 ) ) ( not ( = ?auto_43822 ?auto_43825 ) ) ( not ( = ?auto_43822 ?auto_43823 ) ) ( not ( = ?auto_43822 ?auto_43821 ) ) ( not ( = ?auto_43822 ?auto_43820 ) ) ( not ( = ?auto_43824 ?auto_43825 ) ) ( not ( = ?auto_43824 ?auto_43823 ) ) ( not ( = ?auto_43824 ?auto_43821 ) ) ( not ( = ?auto_43824 ?auto_43820 ) ) ( not ( = ?auto_43825 ?auto_43823 ) ) ( not ( = ?auto_43825 ?auto_43821 ) ) ( not ( = ?auto_43825 ?auto_43820 ) ) ( CLEAR ?auto_43821 ) ( ON ?auto_43820 ?auto_43826 ) ( CLEAR ?auto_43820 ) ( HAND-EMPTY ) ( not ( = ?auto_43820 ?auto_43826 ) ) ( not ( = ?auto_43821 ?auto_43826 ) ) ( not ( = ?auto_43823 ?auto_43826 ) ) ( not ( = ?auto_43822 ?auto_43826 ) ) ( not ( = ?auto_43824 ?auto_43826 ) ) ( not ( = ?auto_43825 ?auto_43826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43820 ?auto_43826 )
      ( MAKE-2PILE ?auto_43820 ?auto_43821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43827 - BLOCK
      ?auto_43828 - BLOCK
    )
    :vars
    (
      ?auto_43831 - BLOCK
      ?auto_43830 - BLOCK
      ?auto_43833 - BLOCK
      ?auto_43832 - BLOCK
      ?auto_43829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43827 ?auto_43828 ) ) ( not ( = ?auto_43827 ?auto_43831 ) ) ( not ( = ?auto_43828 ?auto_43831 ) ) ( ON-TABLE ?auto_43830 ) ( ON ?auto_43833 ?auto_43830 ) ( ON ?auto_43832 ?auto_43833 ) ( ON ?auto_43831 ?auto_43832 ) ( not ( = ?auto_43830 ?auto_43833 ) ) ( not ( = ?auto_43830 ?auto_43832 ) ) ( not ( = ?auto_43830 ?auto_43831 ) ) ( not ( = ?auto_43830 ?auto_43828 ) ) ( not ( = ?auto_43830 ?auto_43827 ) ) ( not ( = ?auto_43833 ?auto_43832 ) ) ( not ( = ?auto_43833 ?auto_43831 ) ) ( not ( = ?auto_43833 ?auto_43828 ) ) ( not ( = ?auto_43833 ?auto_43827 ) ) ( not ( = ?auto_43832 ?auto_43831 ) ) ( not ( = ?auto_43832 ?auto_43828 ) ) ( not ( = ?auto_43832 ?auto_43827 ) ) ( ON ?auto_43827 ?auto_43829 ) ( CLEAR ?auto_43827 ) ( not ( = ?auto_43827 ?auto_43829 ) ) ( not ( = ?auto_43828 ?auto_43829 ) ) ( not ( = ?auto_43831 ?auto_43829 ) ) ( not ( = ?auto_43830 ?auto_43829 ) ) ( not ( = ?auto_43833 ?auto_43829 ) ) ( not ( = ?auto_43832 ?auto_43829 ) ) ( HOLDING ?auto_43828 ) ( CLEAR ?auto_43831 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43830 ?auto_43833 ?auto_43832 ?auto_43831 ?auto_43828 )
      ( MAKE-2PILE ?auto_43827 ?auto_43828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43834 - BLOCK
      ?auto_43835 - BLOCK
    )
    :vars
    (
      ?auto_43837 - BLOCK
      ?auto_43836 - BLOCK
      ?auto_43838 - BLOCK
      ?auto_43839 - BLOCK
      ?auto_43840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43834 ?auto_43835 ) ) ( not ( = ?auto_43834 ?auto_43837 ) ) ( not ( = ?auto_43835 ?auto_43837 ) ) ( ON-TABLE ?auto_43836 ) ( ON ?auto_43838 ?auto_43836 ) ( ON ?auto_43839 ?auto_43838 ) ( ON ?auto_43837 ?auto_43839 ) ( not ( = ?auto_43836 ?auto_43838 ) ) ( not ( = ?auto_43836 ?auto_43839 ) ) ( not ( = ?auto_43836 ?auto_43837 ) ) ( not ( = ?auto_43836 ?auto_43835 ) ) ( not ( = ?auto_43836 ?auto_43834 ) ) ( not ( = ?auto_43838 ?auto_43839 ) ) ( not ( = ?auto_43838 ?auto_43837 ) ) ( not ( = ?auto_43838 ?auto_43835 ) ) ( not ( = ?auto_43838 ?auto_43834 ) ) ( not ( = ?auto_43839 ?auto_43837 ) ) ( not ( = ?auto_43839 ?auto_43835 ) ) ( not ( = ?auto_43839 ?auto_43834 ) ) ( ON ?auto_43834 ?auto_43840 ) ( not ( = ?auto_43834 ?auto_43840 ) ) ( not ( = ?auto_43835 ?auto_43840 ) ) ( not ( = ?auto_43837 ?auto_43840 ) ) ( not ( = ?auto_43836 ?auto_43840 ) ) ( not ( = ?auto_43838 ?auto_43840 ) ) ( not ( = ?auto_43839 ?auto_43840 ) ) ( CLEAR ?auto_43837 ) ( ON ?auto_43835 ?auto_43834 ) ( CLEAR ?auto_43835 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43840 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43840 ?auto_43834 )
      ( MAKE-2PILE ?auto_43834 ?auto_43835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43841 - BLOCK
      ?auto_43842 - BLOCK
    )
    :vars
    (
      ?auto_43843 - BLOCK
      ?auto_43846 - BLOCK
      ?auto_43847 - BLOCK
      ?auto_43845 - BLOCK
      ?auto_43844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43841 ?auto_43842 ) ) ( not ( = ?auto_43841 ?auto_43843 ) ) ( not ( = ?auto_43842 ?auto_43843 ) ) ( ON-TABLE ?auto_43846 ) ( ON ?auto_43847 ?auto_43846 ) ( ON ?auto_43845 ?auto_43847 ) ( not ( = ?auto_43846 ?auto_43847 ) ) ( not ( = ?auto_43846 ?auto_43845 ) ) ( not ( = ?auto_43846 ?auto_43843 ) ) ( not ( = ?auto_43846 ?auto_43842 ) ) ( not ( = ?auto_43846 ?auto_43841 ) ) ( not ( = ?auto_43847 ?auto_43845 ) ) ( not ( = ?auto_43847 ?auto_43843 ) ) ( not ( = ?auto_43847 ?auto_43842 ) ) ( not ( = ?auto_43847 ?auto_43841 ) ) ( not ( = ?auto_43845 ?auto_43843 ) ) ( not ( = ?auto_43845 ?auto_43842 ) ) ( not ( = ?auto_43845 ?auto_43841 ) ) ( ON ?auto_43841 ?auto_43844 ) ( not ( = ?auto_43841 ?auto_43844 ) ) ( not ( = ?auto_43842 ?auto_43844 ) ) ( not ( = ?auto_43843 ?auto_43844 ) ) ( not ( = ?auto_43846 ?auto_43844 ) ) ( not ( = ?auto_43847 ?auto_43844 ) ) ( not ( = ?auto_43845 ?auto_43844 ) ) ( ON ?auto_43842 ?auto_43841 ) ( CLEAR ?auto_43842 ) ( ON-TABLE ?auto_43844 ) ( HOLDING ?auto_43843 ) ( CLEAR ?auto_43845 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43846 ?auto_43847 ?auto_43845 ?auto_43843 )
      ( MAKE-2PILE ?auto_43841 ?auto_43842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43848 - BLOCK
      ?auto_43849 - BLOCK
    )
    :vars
    (
      ?auto_43854 - BLOCK
      ?auto_43853 - BLOCK
      ?auto_43851 - BLOCK
      ?auto_43850 - BLOCK
      ?auto_43852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43848 ?auto_43849 ) ) ( not ( = ?auto_43848 ?auto_43854 ) ) ( not ( = ?auto_43849 ?auto_43854 ) ) ( ON-TABLE ?auto_43853 ) ( ON ?auto_43851 ?auto_43853 ) ( ON ?auto_43850 ?auto_43851 ) ( not ( = ?auto_43853 ?auto_43851 ) ) ( not ( = ?auto_43853 ?auto_43850 ) ) ( not ( = ?auto_43853 ?auto_43854 ) ) ( not ( = ?auto_43853 ?auto_43849 ) ) ( not ( = ?auto_43853 ?auto_43848 ) ) ( not ( = ?auto_43851 ?auto_43850 ) ) ( not ( = ?auto_43851 ?auto_43854 ) ) ( not ( = ?auto_43851 ?auto_43849 ) ) ( not ( = ?auto_43851 ?auto_43848 ) ) ( not ( = ?auto_43850 ?auto_43854 ) ) ( not ( = ?auto_43850 ?auto_43849 ) ) ( not ( = ?auto_43850 ?auto_43848 ) ) ( ON ?auto_43848 ?auto_43852 ) ( not ( = ?auto_43848 ?auto_43852 ) ) ( not ( = ?auto_43849 ?auto_43852 ) ) ( not ( = ?auto_43854 ?auto_43852 ) ) ( not ( = ?auto_43853 ?auto_43852 ) ) ( not ( = ?auto_43851 ?auto_43852 ) ) ( not ( = ?auto_43850 ?auto_43852 ) ) ( ON ?auto_43849 ?auto_43848 ) ( ON-TABLE ?auto_43852 ) ( CLEAR ?auto_43850 ) ( ON ?auto_43854 ?auto_43849 ) ( CLEAR ?auto_43854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43852 ?auto_43848 ?auto_43849 )
      ( MAKE-2PILE ?auto_43848 ?auto_43849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43855 - BLOCK
      ?auto_43856 - BLOCK
    )
    :vars
    (
      ?auto_43861 - BLOCK
      ?auto_43859 - BLOCK
      ?auto_43858 - BLOCK
      ?auto_43860 - BLOCK
      ?auto_43857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43855 ?auto_43856 ) ) ( not ( = ?auto_43855 ?auto_43861 ) ) ( not ( = ?auto_43856 ?auto_43861 ) ) ( ON-TABLE ?auto_43859 ) ( ON ?auto_43858 ?auto_43859 ) ( not ( = ?auto_43859 ?auto_43858 ) ) ( not ( = ?auto_43859 ?auto_43860 ) ) ( not ( = ?auto_43859 ?auto_43861 ) ) ( not ( = ?auto_43859 ?auto_43856 ) ) ( not ( = ?auto_43859 ?auto_43855 ) ) ( not ( = ?auto_43858 ?auto_43860 ) ) ( not ( = ?auto_43858 ?auto_43861 ) ) ( not ( = ?auto_43858 ?auto_43856 ) ) ( not ( = ?auto_43858 ?auto_43855 ) ) ( not ( = ?auto_43860 ?auto_43861 ) ) ( not ( = ?auto_43860 ?auto_43856 ) ) ( not ( = ?auto_43860 ?auto_43855 ) ) ( ON ?auto_43855 ?auto_43857 ) ( not ( = ?auto_43855 ?auto_43857 ) ) ( not ( = ?auto_43856 ?auto_43857 ) ) ( not ( = ?auto_43861 ?auto_43857 ) ) ( not ( = ?auto_43859 ?auto_43857 ) ) ( not ( = ?auto_43858 ?auto_43857 ) ) ( not ( = ?auto_43860 ?auto_43857 ) ) ( ON ?auto_43856 ?auto_43855 ) ( ON-TABLE ?auto_43857 ) ( ON ?auto_43861 ?auto_43856 ) ( CLEAR ?auto_43861 ) ( HOLDING ?auto_43860 ) ( CLEAR ?auto_43858 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43859 ?auto_43858 ?auto_43860 )
      ( MAKE-2PILE ?auto_43855 ?auto_43856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43862 - BLOCK
      ?auto_43863 - BLOCK
    )
    :vars
    (
      ?auto_43864 - BLOCK
      ?auto_43867 - BLOCK
      ?auto_43865 - BLOCK
      ?auto_43866 - BLOCK
      ?auto_43868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43862 ?auto_43863 ) ) ( not ( = ?auto_43862 ?auto_43864 ) ) ( not ( = ?auto_43863 ?auto_43864 ) ) ( ON-TABLE ?auto_43867 ) ( ON ?auto_43865 ?auto_43867 ) ( not ( = ?auto_43867 ?auto_43865 ) ) ( not ( = ?auto_43867 ?auto_43866 ) ) ( not ( = ?auto_43867 ?auto_43864 ) ) ( not ( = ?auto_43867 ?auto_43863 ) ) ( not ( = ?auto_43867 ?auto_43862 ) ) ( not ( = ?auto_43865 ?auto_43866 ) ) ( not ( = ?auto_43865 ?auto_43864 ) ) ( not ( = ?auto_43865 ?auto_43863 ) ) ( not ( = ?auto_43865 ?auto_43862 ) ) ( not ( = ?auto_43866 ?auto_43864 ) ) ( not ( = ?auto_43866 ?auto_43863 ) ) ( not ( = ?auto_43866 ?auto_43862 ) ) ( ON ?auto_43862 ?auto_43868 ) ( not ( = ?auto_43862 ?auto_43868 ) ) ( not ( = ?auto_43863 ?auto_43868 ) ) ( not ( = ?auto_43864 ?auto_43868 ) ) ( not ( = ?auto_43867 ?auto_43868 ) ) ( not ( = ?auto_43865 ?auto_43868 ) ) ( not ( = ?auto_43866 ?auto_43868 ) ) ( ON ?auto_43863 ?auto_43862 ) ( ON-TABLE ?auto_43868 ) ( ON ?auto_43864 ?auto_43863 ) ( CLEAR ?auto_43865 ) ( ON ?auto_43866 ?auto_43864 ) ( CLEAR ?auto_43866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43868 ?auto_43862 ?auto_43863 ?auto_43864 )
      ( MAKE-2PILE ?auto_43862 ?auto_43863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43869 - BLOCK
      ?auto_43870 - BLOCK
    )
    :vars
    (
      ?auto_43871 - BLOCK
      ?auto_43872 - BLOCK
      ?auto_43873 - BLOCK
      ?auto_43874 - BLOCK
      ?auto_43875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43869 ?auto_43870 ) ) ( not ( = ?auto_43869 ?auto_43871 ) ) ( not ( = ?auto_43870 ?auto_43871 ) ) ( ON-TABLE ?auto_43872 ) ( not ( = ?auto_43872 ?auto_43873 ) ) ( not ( = ?auto_43872 ?auto_43874 ) ) ( not ( = ?auto_43872 ?auto_43871 ) ) ( not ( = ?auto_43872 ?auto_43870 ) ) ( not ( = ?auto_43872 ?auto_43869 ) ) ( not ( = ?auto_43873 ?auto_43874 ) ) ( not ( = ?auto_43873 ?auto_43871 ) ) ( not ( = ?auto_43873 ?auto_43870 ) ) ( not ( = ?auto_43873 ?auto_43869 ) ) ( not ( = ?auto_43874 ?auto_43871 ) ) ( not ( = ?auto_43874 ?auto_43870 ) ) ( not ( = ?auto_43874 ?auto_43869 ) ) ( ON ?auto_43869 ?auto_43875 ) ( not ( = ?auto_43869 ?auto_43875 ) ) ( not ( = ?auto_43870 ?auto_43875 ) ) ( not ( = ?auto_43871 ?auto_43875 ) ) ( not ( = ?auto_43872 ?auto_43875 ) ) ( not ( = ?auto_43873 ?auto_43875 ) ) ( not ( = ?auto_43874 ?auto_43875 ) ) ( ON ?auto_43870 ?auto_43869 ) ( ON-TABLE ?auto_43875 ) ( ON ?auto_43871 ?auto_43870 ) ( ON ?auto_43874 ?auto_43871 ) ( CLEAR ?auto_43874 ) ( HOLDING ?auto_43873 ) ( CLEAR ?auto_43872 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43872 ?auto_43873 )
      ( MAKE-2PILE ?auto_43869 ?auto_43870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43876 - BLOCK
      ?auto_43877 - BLOCK
    )
    :vars
    (
      ?auto_43880 - BLOCK
      ?auto_43882 - BLOCK
      ?auto_43878 - BLOCK
      ?auto_43881 - BLOCK
      ?auto_43879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43876 ?auto_43877 ) ) ( not ( = ?auto_43876 ?auto_43880 ) ) ( not ( = ?auto_43877 ?auto_43880 ) ) ( ON-TABLE ?auto_43882 ) ( not ( = ?auto_43882 ?auto_43878 ) ) ( not ( = ?auto_43882 ?auto_43881 ) ) ( not ( = ?auto_43882 ?auto_43880 ) ) ( not ( = ?auto_43882 ?auto_43877 ) ) ( not ( = ?auto_43882 ?auto_43876 ) ) ( not ( = ?auto_43878 ?auto_43881 ) ) ( not ( = ?auto_43878 ?auto_43880 ) ) ( not ( = ?auto_43878 ?auto_43877 ) ) ( not ( = ?auto_43878 ?auto_43876 ) ) ( not ( = ?auto_43881 ?auto_43880 ) ) ( not ( = ?auto_43881 ?auto_43877 ) ) ( not ( = ?auto_43881 ?auto_43876 ) ) ( ON ?auto_43876 ?auto_43879 ) ( not ( = ?auto_43876 ?auto_43879 ) ) ( not ( = ?auto_43877 ?auto_43879 ) ) ( not ( = ?auto_43880 ?auto_43879 ) ) ( not ( = ?auto_43882 ?auto_43879 ) ) ( not ( = ?auto_43878 ?auto_43879 ) ) ( not ( = ?auto_43881 ?auto_43879 ) ) ( ON ?auto_43877 ?auto_43876 ) ( ON-TABLE ?auto_43879 ) ( ON ?auto_43880 ?auto_43877 ) ( ON ?auto_43881 ?auto_43880 ) ( CLEAR ?auto_43882 ) ( ON ?auto_43878 ?auto_43881 ) ( CLEAR ?auto_43878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43879 ?auto_43876 ?auto_43877 ?auto_43880 ?auto_43881 )
      ( MAKE-2PILE ?auto_43876 ?auto_43877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43883 - BLOCK
      ?auto_43884 - BLOCK
    )
    :vars
    (
      ?auto_43885 - BLOCK
      ?auto_43889 - BLOCK
      ?auto_43886 - BLOCK
      ?auto_43888 - BLOCK
      ?auto_43887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43883 ?auto_43884 ) ) ( not ( = ?auto_43883 ?auto_43885 ) ) ( not ( = ?auto_43884 ?auto_43885 ) ) ( not ( = ?auto_43889 ?auto_43886 ) ) ( not ( = ?auto_43889 ?auto_43888 ) ) ( not ( = ?auto_43889 ?auto_43885 ) ) ( not ( = ?auto_43889 ?auto_43884 ) ) ( not ( = ?auto_43889 ?auto_43883 ) ) ( not ( = ?auto_43886 ?auto_43888 ) ) ( not ( = ?auto_43886 ?auto_43885 ) ) ( not ( = ?auto_43886 ?auto_43884 ) ) ( not ( = ?auto_43886 ?auto_43883 ) ) ( not ( = ?auto_43888 ?auto_43885 ) ) ( not ( = ?auto_43888 ?auto_43884 ) ) ( not ( = ?auto_43888 ?auto_43883 ) ) ( ON ?auto_43883 ?auto_43887 ) ( not ( = ?auto_43883 ?auto_43887 ) ) ( not ( = ?auto_43884 ?auto_43887 ) ) ( not ( = ?auto_43885 ?auto_43887 ) ) ( not ( = ?auto_43889 ?auto_43887 ) ) ( not ( = ?auto_43886 ?auto_43887 ) ) ( not ( = ?auto_43888 ?auto_43887 ) ) ( ON ?auto_43884 ?auto_43883 ) ( ON-TABLE ?auto_43887 ) ( ON ?auto_43885 ?auto_43884 ) ( ON ?auto_43888 ?auto_43885 ) ( ON ?auto_43886 ?auto_43888 ) ( CLEAR ?auto_43886 ) ( HOLDING ?auto_43889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43889 )
      ( MAKE-2PILE ?auto_43883 ?auto_43884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43890 - BLOCK
      ?auto_43891 - BLOCK
    )
    :vars
    (
      ?auto_43896 - BLOCK
      ?auto_43894 - BLOCK
      ?auto_43893 - BLOCK
      ?auto_43895 - BLOCK
      ?auto_43892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43890 ?auto_43891 ) ) ( not ( = ?auto_43890 ?auto_43896 ) ) ( not ( = ?auto_43891 ?auto_43896 ) ) ( not ( = ?auto_43894 ?auto_43893 ) ) ( not ( = ?auto_43894 ?auto_43895 ) ) ( not ( = ?auto_43894 ?auto_43896 ) ) ( not ( = ?auto_43894 ?auto_43891 ) ) ( not ( = ?auto_43894 ?auto_43890 ) ) ( not ( = ?auto_43893 ?auto_43895 ) ) ( not ( = ?auto_43893 ?auto_43896 ) ) ( not ( = ?auto_43893 ?auto_43891 ) ) ( not ( = ?auto_43893 ?auto_43890 ) ) ( not ( = ?auto_43895 ?auto_43896 ) ) ( not ( = ?auto_43895 ?auto_43891 ) ) ( not ( = ?auto_43895 ?auto_43890 ) ) ( ON ?auto_43890 ?auto_43892 ) ( not ( = ?auto_43890 ?auto_43892 ) ) ( not ( = ?auto_43891 ?auto_43892 ) ) ( not ( = ?auto_43896 ?auto_43892 ) ) ( not ( = ?auto_43894 ?auto_43892 ) ) ( not ( = ?auto_43893 ?auto_43892 ) ) ( not ( = ?auto_43895 ?auto_43892 ) ) ( ON ?auto_43891 ?auto_43890 ) ( ON-TABLE ?auto_43892 ) ( ON ?auto_43896 ?auto_43891 ) ( ON ?auto_43895 ?auto_43896 ) ( ON ?auto_43893 ?auto_43895 ) ( ON ?auto_43894 ?auto_43893 ) ( CLEAR ?auto_43894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43892 ?auto_43890 ?auto_43891 ?auto_43896 ?auto_43895 ?auto_43893 )
      ( MAKE-2PILE ?auto_43890 ?auto_43891 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43900 - BLOCK
      ?auto_43901 - BLOCK
      ?auto_43902 - BLOCK
    )
    :vars
    (
      ?auto_43903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43903 ?auto_43902 ) ( CLEAR ?auto_43903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43900 ) ( ON ?auto_43901 ?auto_43900 ) ( ON ?auto_43902 ?auto_43901 ) ( not ( = ?auto_43900 ?auto_43901 ) ) ( not ( = ?auto_43900 ?auto_43902 ) ) ( not ( = ?auto_43900 ?auto_43903 ) ) ( not ( = ?auto_43901 ?auto_43902 ) ) ( not ( = ?auto_43901 ?auto_43903 ) ) ( not ( = ?auto_43902 ?auto_43903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43903 ?auto_43902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43904 - BLOCK
      ?auto_43905 - BLOCK
      ?auto_43906 - BLOCK
    )
    :vars
    (
      ?auto_43907 - BLOCK
      ?auto_43908 - BLOCK
      ?auto_43909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43907 ?auto_43906 ) ( CLEAR ?auto_43907 ) ( ON-TABLE ?auto_43904 ) ( ON ?auto_43905 ?auto_43904 ) ( ON ?auto_43906 ?auto_43905 ) ( not ( = ?auto_43904 ?auto_43905 ) ) ( not ( = ?auto_43904 ?auto_43906 ) ) ( not ( = ?auto_43904 ?auto_43907 ) ) ( not ( = ?auto_43905 ?auto_43906 ) ) ( not ( = ?auto_43905 ?auto_43907 ) ) ( not ( = ?auto_43906 ?auto_43907 ) ) ( HOLDING ?auto_43908 ) ( CLEAR ?auto_43909 ) ( not ( = ?auto_43904 ?auto_43908 ) ) ( not ( = ?auto_43904 ?auto_43909 ) ) ( not ( = ?auto_43905 ?auto_43908 ) ) ( not ( = ?auto_43905 ?auto_43909 ) ) ( not ( = ?auto_43906 ?auto_43908 ) ) ( not ( = ?auto_43906 ?auto_43909 ) ) ( not ( = ?auto_43907 ?auto_43908 ) ) ( not ( = ?auto_43907 ?auto_43909 ) ) ( not ( = ?auto_43908 ?auto_43909 ) ) )
    :subtasks
    ( ( !STACK ?auto_43908 ?auto_43909 )
      ( MAKE-3PILE ?auto_43904 ?auto_43905 ?auto_43906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43910 - BLOCK
      ?auto_43911 - BLOCK
      ?auto_43912 - BLOCK
    )
    :vars
    (
      ?auto_43913 - BLOCK
      ?auto_43915 - BLOCK
      ?auto_43914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43913 ?auto_43912 ) ( ON-TABLE ?auto_43910 ) ( ON ?auto_43911 ?auto_43910 ) ( ON ?auto_43912 ?auto_43911 ) ( not ( = ?auto_43910 ?auto_43911 ) ) ( not ( = ?auto_43910 ?auto_43912 ) ) ( not ( = ?auto_43910 ?auto_43913 ) ) ( not ( = ?auto_43911 ?auto_43912 ) ) ( not ( = ?auto_43911 ?auto_43913 ) ) ( not ( = ?auto_43912 ?auto_43913 ) ) ( CLEAR ?auto_43915 ) ( not ( = ?auto_43910 ?auto_43914 ) ) ( not ( = ?auto_43910 ?auto_43915 ) ) ( not ( = ?auto_43911 ?auto_43914 ) ) ( not ( = ?auto_43911 ?auto_43915 ) ) ( not ( = ?auto_43912 ?auto_43914 ) ) ( not ( = ?auto_43912 ?auto_43915 ) ) ( not ( = ?auto_43913 ?auto_43914 ) ) ( not ( = ?auto_43913 ?auto_43915 ) ) ( not ( = ?auto_43914 ?auto_43915 ) ) ( ON ?auto_43914 ?auto_43913 ) ( CLEAR ?auto_43914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43910 ?auto_43911 ?auto_43912 ?auto_43913 )
      ( MAKE-3PILE ?auto_43910 ?auto_43911 ?auto_43912 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43916 - BLOCK
      ?auto_43917 - BLOCK
      ?auto_43918 - BLOCK
    )
    :vars
    (
      ?auto_43919 - BLOCK
      ?auto_43920 - BLOCK
      ?auto_43921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43919 ?auto_43918 ) ( ON-TABLE ?auto_43916 ) ( ON ?auto_43917 ?auto_43916 ) ( ON ?auto_43918 ?auto_43917 ) ( not ( = ?auto_43916 ?auto_43917 ) ) ( not ( = ?auto_43916 ?auto_43918 ) ) ( not ( = ?auto_43916 ?auto_43919 ) ) ( not ( = ?auto_43917 ?auto_43918 ) ) ( not ( = ?auto_43917 ?auto_43919 ) ) ( not ( = ?auto_43918 ?auto_43919 ) ) ( not ( = ?auto_43916 ?auto_43920 ) ) ( not ( = ?auto_43916 ?auto_43921 ) ) ( not ( = ?auto_43917 ?auto_43920 ) ) ( not ( = ?auto_43917 ?auto_43921 ) ) ( not ( = ?auto_43918 ?auto_43920 ) ) ( not ( = ?auto_43918 ?auto_43921 ) ) ( not ( = ?auto_43919 ?auto_43920 ) ) ( not ( = ?auto_43919 ?auto_43921 ) ) ( not ( = ?auto_43920 ?auto_43921 ) ) ( ON ?auto_43920 ?auto_43919 ) ( CLEAR ?auto_43920 ) ( HOLDING ?auto_43921 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43921 )
      ( MAKE-3PILE ?auto_43916 ?auto_43917 ?auto_43918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43922 - BLOCK
      ?auto_43923 - BLOCK
      ?auto_43924 - BLOCK
    )
    :vars
    (
      ?auto_43927 - BLOCK
      ?auto_43926 - BLOCK
      ?auto_43925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43927 ?auto_43924 ) ( ON-TABLE ?auto_43922 ) ( ON ?auto_43923 ?auto_43922 ) ( ON ?auto_43924 ?auto_43923 ) ( not ( = ?auto_43922 ?auto_43923 ) ) ( not ( = ?auto_43922 ?auto_43924 ) ) ( not ( = ?auto_43922 ?auto_43927 ) ) ( not ( = ?auto_43923 ?auto_43924 ) ) ( not ( = ?auto_43923 ?auto_43927 ) ) ( not ( = ?auto_43924 ?auto_43927 ) ) ( not ( = ?auto_43922 ?auto_43926 ) ) ( not ( = ?auto_43922 ?auto_43925 ) ) ( not ( = ?auto_43923 ?auto_43926 ) ) ( not ( = ?auto_43923 ?auto_43925 ) ) ( not ( = ?auto_43924 ?auto_43926 ) ) ( not ( = ?auto_43924 ?auto_43925 ) ) ( not ( = ?auto_43927 ?auto_43926 ) ) ( not ( = ?auto_43927 ?auto_43925 ) ) ( not ( = ?auto_43926 ?auto_43925 ) ) ( ON ?auto_43926 ?auto_43927 ) ( ON ?auto_43925 ?auto_43926 ) ( CLEAR ?auto_43925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43922 ?auto_43923 ?auto_43924 ?auto_43927 ?auto_43926 )
      ( MAKE-3PILE ?auto_43922 ?auto_43923 ?auto_43924 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43928 - BLOCK
      ?auto_43929 - BLOCK
      ?auto_43930 - BLOCK
    )
    :vars
    (
      ?auto_43933 - BLOCK
      ?auto_43931 - BLOCK
      ?auto_43932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43933 ?auto_43930 ) ( ON-TABLE ?auto_43928 ) ( ON ?auto_43929 ?auto_43928 ) ( ON ?auto_43930 ?auto_43929 ) ( not ( = ?auto_43928 ?auto_43929 ) ) ( not ( = ?auto_43928 ?auto_43930 ) ) ( not ( = ?auto_43928 ?auto_43933 ) ) ( not ( = ?auto_43929 ?auto_43930 ) ) ( not ( = ?auto_43929 ?auto_43933 ) ) ( not ( = ?auto_43930 ?auto_43933 ) ) ( not ( = ?auto_43928 ?auto_43931 ) ) ( not ( = ?auto_43928 ?auto_43932 ) ) ( not ( = ?auto_43929 ?auto_43931 ) ) ( not ( = ?auto_43929 ?auto_43932 ) ) ( not ( = ?auto_43930 ?auto_43931 ) ) ( not ( = ?auto_43930 ?auto_43932 ) ) ( not ( = ?auto_43933 ?auto_43931 ) ) ( not ( = ?auto_43933 ?auto_43932 ) ) ( not ( = ?auto_43931 ?auto_43932 ) ) ( ON ?auto_43931 ?auto_43933 ) ( HOLDING ?auto_43932 ) ( CLEAR ?auto_43931 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43928 ?auto_43929 ?auto_43930 ?auto_43933 ?auto_43931 ?auto_43932 )
      ( MAKE-3PILE ?auto_43928 ?auto_43929 ?auto_43930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43934 - BLOCK
      ?auto_43935 - BLOCK
      ?auto_43936 - BLOCK
    )
    :vars
    (
      ?auto_43939 - BLOCK
      ?auto_43937 - BLOCK
      ?auto_43938 - BLOCK
      ?auto_43940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43939 ?auto_43936 ) ( ON-TABLE ?auto_43934 ) ( ON ?auto_43935 ?auto_43934 ) ( ON ?auto_43936 ?auto_43935 ) ( not ( = ?auto_43934 ?auto_43935 ) ) ( not ( = ?auto_43934 ?auto_43936 ) ) ( not ( = ?auto_43934 ?auto_43939 ) ) ( not ( = ?auto_43935 ?auto_43936 ) ) ( not ( = ?auto_43935 ?auto_43939 ) ) ( not ( = ?auto_43936 ?auto_43939 ) ) ( not ( = ?auto_43934 ?auto_43937 ) ) ( not ( = ?auto_43934 ?auto_43938 ) ) ( not ( = ?auto_43935 ?auto_43937 ) ) ( not ( = ?auto_43935 ?auto_43938 ) ) ( not ( = ?auto_43936 ?auto_43937 ) ) ( not ( = ?auto_43936 ?auto_43938 ) ) ( not ( = ?auto_43939 ?auto_43937 ) ) ( not ( = ?auto_43939 ?auto_43938 ) ) ( not ( = ?auto_43937 ?auto_43938 ) ) ( ON ?auto_43937 ?auto_43939 ) ( CLEAR ?auto_43937 ) ( ON ?auto_43938 ?auto_43940 ) ( CLEAR ?auto_43938 ) ( HAND-EMPTY ) ( not ( = ?auto_43934 ?auto_43940 ) ) ( not ( = ?auto_43935 ?auto_43940 ) ) ( not ( = ?auto_43936 ?auto_43940 ) ) ( not ( = ?auto_43939 ?auto_43940 ) ) ( not ( = ?auto_43937 ?auto_43940 ) ) ( not ( = ?auto_43938 ?auto_43940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43938 ?auto_43940 )
      ( MAKE-3PILE ?auto_43934 ?auto_43935 ?auto_43936 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43941 - BLOCK
      ?auto_43942 - BLOCK
      ?auto_43943 - BLOCK
    )
    :vars
    (
      ?auto_43947 - BLOCK
      ?auto_43945 - BLOCK
      ?auto_43944 - BLOCK
      ?auto_43946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43947 ?auto_43943 ) ( ON-TABLE ?auto_43941 ) ( ON ?auto_43942 ?auto_43941 ) ( ON ?auto_43943 ?auto_43942 ) ( not ( = ?auto_43941 ?auto_43942 ) ) ( not ( = ?auto_43941 ?auto_43943 ) ) ( not ( = ?auto_43941 ?auto_43947 ) ) ( not ( = ?auto_43942 ?auto_43943 ) ) ( not ( = ?auto_43942 ?auto_43947 ) ) ( not ( = ?auto_43943 ?auto_43947 ) ) ( not ( = ?auto_43941 ?auto_43945 ) ) ( not ( = ?auto_43941 ?auto_43944 ) ) ( not ( = ?auto_43942 ?auto_43945 ) ) ( not ( = ?auto_43942 ?auto_43944 ) ) ( not ( = ?auto_43943 ?auto_43945 ) ) ( not ( = ?auto_43943 ?auto_43944 ) ) ( not ( = ?auto_43947 ?auto_43945 ) ) ( not ( = ?auto_43947 ?auto_43944 ) ) ( not ( = ?auto_43945 ?auto_43944 ) ) ( ON ?auto_43944 ?auto_43946 ) ( CLEAR ?auto_43944 ) ( not ( = ?auto_43941 ?auto_43946 ) ) ( not ( = ?auto_43942 ?auto_43946 ) ) ( not ( = ?auto_43943 ?auto_43946 ) ) ( not ( = ?auto_43947 ?auto_43946 ) ) ( not ( = ?auto_43945 ?auto_43946 ) ) ( not ( = ?auto_43944 ?auto_43946 ) ) ( HOLDING ?auto_43945 ) ( CLEAR ?auto_43947 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43941 ?auto_43942 ?auto_43943 ?auto_43947 ?auto_43945 )
      ( MAKE-3PILE ?auto_43941 ?auto_43942 ?auto_43943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43948 - BLOCK
      ?auto_43949 - BLOCK
      ?auto_43950 - BLOCK
    )
    :vars
    (
      ?auto_43951 - BLOCK
      ?auto_43953 - BLOCK
      ?auto_43954 - BLOCK
      ?auto_43952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43951 ?auto_43950 ) ( ON-TABLE ?auto_43948 ) ( ON ?auto_43949 ?auto_43948 ) ( ON ?auto_43950 ?auto_43949 ) ( not ( = ?auto_43948 ?auto_43949 ) ) ( not ( = ?auto_43948 ?auto_43950 ) ) ( not ( = ?auto_43948 ?auto_43951 ) ) ( not ( = ?auto_43949 ?auto_43950 ) ) ( not ( = ?auto_43949 ?auto_43951 ) ) ( not ( = ?auto_43950 ?auto_43951 ) ) ( not ( = ?auto_43948 ?auto_43953 ) ) ( not ( = ?auto_43948 ?auto_43954 ) ) ( not ( = ?auto_43949 ?auto_43953 ) ) ( not ( = ?auto_43949 ?auto_43954 ) ) ( not ( = ?auto_43950 ?auto_43953 ) ) ( not ( = ?auto_43950 ?auto_43954 ) ) ( not ( = ?auto_43951 ?auto_43953 ) ) ( not ( = ?auto_43951 ?auto_43954 ) ) ( not ( = ?auto_43953 ?auto_43954 ) ) ( ON ?auto_43954 ?auto_43952 ) ( not ( = ?auto_43948 ?auto_43952 ) ) ( not ( = ?auto_43949 ?auto_43952 ) ) ( not ( = ?auto_43950 ?auto_43952 ) ) ( not ( = ?auto_43951 ?auto_43952 ) ) ( not ( = ?auto_43953 ?auto_43952 ) ) ( not ( = ?auto_43954 ?auto_43952 ) ) ( CLEAR ?auto_43951 ) ( ON ?auto_43953 ?auto_43954 ) ( CLEAR ?auto_43953 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43952 ?auto_43954 )
      ( MAKE-3PILE ?auto_43948 ?auto_43949 ?auto_43950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43969 - BLOCK
      ?auto_43970 - BLOCK
      ?auto_43971 - BLOCK
    )
    :vars
    (
      ?auto_43975 - BLOCK
      ?auto_43972 - BLOCK
      ?auto_43973 - BLOCK
      ?auto_43974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43969 ) ( ON ?auto_43970 ?auto_43969 ) ( not ( = ?auto_43969 ?auto_43970 ) ) ( not ( = ?auto_43969 ?auto_43971 ) ) ( not ( = ?auto_43969 ?auto_43975 ) ) ( not ( = ?auto_43970 ?auto_43971 ) ) ( not ( = ?auto_43970 ?auto_43975 ) ) ( not ( = ?auto_43971 ?auto_43975 ) ) ( not ( = ?auto_43969 ?auto_43972 ) ) ( not ( = ?auto_43969 ?auto_43973 ) ) ( not ( = ?auto_43970 ?auto_43972 ) ) ( not ( = ?auto_43970 ?auto_43973 ) ) ( not ( = ?auto_43971 ?auto_43972 ) ) ( not ( = ?auto_43971 ?auto_43973 ) ) ( not ( = ?auto_43975 ?auto_43972 ) ) ( not ( = ?auto_43975 ?auto_43973 ) ) ( not ( = ?auto_43972 ?auto_43973 ) ) ( ON ?auto_43973 ?auto_43974 ) ( not ( = ?auto_43969 ?auto_43974 ) ) ( not ( = ?auto_43970 ?auto_43974 ) ) ( not ( = ?auto_43971 ?auto_43974 ) ) ( not ( = ?auto_43975 ?auto_43974 ) ) ( not ( = ?auto_43972 ?auto_43974 ) ) ( not ( = ?auto_43973 ?auto_43974 ) ) ( ON ?auto_43972 ?auto_43973 ) ( ON-TABLE ?auto_43974 ) ( ON ?auto_43975 ?auto_43972 ) ( CLEAR ?auto_43975 ) ( HOLDING ?auto_43971 ) ( CLEAR ?auto_43970 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43969 ?auto_43970 ?auto_43971 ?auto_43975 )
      ( MAKE-3PILE ?auto_43969 ?auto_43970 ?auto_43971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43976 - BLOCK
      ?auto_43977 - BLOCK
      ?auto_43978 - BLOCK
    )
    :vars
    (
      ?auto_43980 - BLOCK
      ?auto_43982 - BLOCK
      ?auto_43979 - BLOCK
      ?auto_43981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43976 ) ( ON ?auto_43977 ?auto_43976 ) ( not ( = ?auto_43976 ?auto_43977 ) ) ( not ( = ?auto_43976 ?auto_43978 ) ) ( not ( = ?auto_43976 ?auto_43980 ) ) ( not ( = ?auto_43977 ?auto_43978 ) ) ( not ( = ?auto_43977 ?auto_43980 ) ) ( not ( = ?auto_43978 ?auto_43980 ) ) ( not ( = ?auto_43976 ?auto_43982 ) ) ( not ( = ?auto_43976 ?auto_43979 ) ) ( not ( = ?auto_43977 ?auto_43982 ) ) ( not ( = ?auto_43977 ?auto_43979 ) ) ( not ( = ?auto_43978 ?auto_43982 ) ) ( not ( = ?auto_43978 ?auto_43979 ) ) ( not ( = ?auto_43980 ?auto_43982 ) ) ( not ( = ?auto_43980 ?auto_43979 ) ) ( not ( = ?auto_43982 ?auto_43979 ) ) ( ON ?auto_43979 ?auto_43981 ) ( not ( = ?auto_43976 ?auto_43981 ) ) ( not ( = ?auto_43977 ?auto_43981 ) ) ( not ( = ?auto_43978 ?auto_43981 ) ) ( not ( = ?auto_43980 ?auto_43981 ) ) ( not ( = ?auto_43982 ?auto_43981 ) ) ( not ( = ?auto_43979 ?auto_43981 ) ) ( ON ?auto_43982 ?auto_43979 ) ( ON-TABLE ?auto_43981 ) ( ON ?auto_43980 ?auto_43982 ) ( CLEAR ?auto_43977 ) ( ON ?auto_43978 ?auto_43980 ) ( CLEAR ?auto_43978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43981 ?auto_43979 ?auto_43982 ?auto_43980 )
      ( MAKE-3PILE ?auto_43976 ?auto_43977 ?auto_43978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43983 - BLOCK
      ?auto_43984 - BLOCK
      ?auto_43985 - BLOCK
    )
    :vars
    (
      ?auto_43987 - BLOCK
      ?auto_43989 - BLOCK
      ?auto_43986 - BLOCK
      ?auto_43988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43983 ) ( not ( = ?auto_43983 ?auto_43984 ) ) ( not ( = ?auto_43983 ?auto_43985 ) ) ( not ( = ?auto_43983 ?auto_43987 ) ) ( not ( = ?auto_43984 ?auto_43985 ) ) ( not ( = ?auto_43984 ?auto_43987 ) ) ( not ( = ?auto_43985 ?auto_43987 ) ) ( not ( = ?auto_43983 ?auto_43989 ) ) ( not ( = ?auto_43983 ?auto_43986 ) ) ( not ( = ?auto_43984 ?auto_43989 ) ) ( not ( = ?auto_43984 ?auto_43986 ) ) ( not ( = ?auto_43985 ?auto_43989 ) ) ( not ( = ?auto_43985 ?auto_43986 ) ) ( not ( = ?auto_43987 ?auto_43989 ) ) ( not ( = ?auto_43987 ?auto_43986 ) ) ( not ( = ?auto_43989 ?auto_43986 ) ) ( ON ?auto_43986 ?auto_43988 ) ( not ( = ?auto_43983 ?auto_43988 ) ) ( not ( = ?auto_43984 ?auto_43988 ) ) ( not ( = ?auto_43985 ?auto_43988 ) ) ( not ( = ?auto_43987 ?auto_43988 ) ) ( not ( = ?auto_43989 ?auto_43988 ) ) ( not ( = ?auto_43986 ?auto_43988 ) ) ( ON ?auto_43989 ?auto_43986 ) ( ON-TABLE ?auto_43988 ) ( ON ?auto_43987 ?auto_43989 ) ( ON ?auto_43985 ?auto_43987 ) ( CLEAR ?auto_43985 ) ( HOLDING ?auto_43984 ) ( CLEAR ?auto_43983 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43983 ?auto_43984 )
      ( MAKE-3PILE ?auto_43983 ?auto_43984 ?auto_43985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43990 - BLOCK
      ?auto_43991 - BLOCK
      ?auto_43992 - BLOCK
    )
    :vars
    (
      ?auto_43994 - BLOCK
      ?auto_43993 - BLOCK
      ?auto_43996 - BLOCK
      ?auto_43995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43990 ) ( not ( = ?auto_43990 ?auto_43991 ) ) ( not ( = ?auto_43990 ?auto_43992 ) ) ( not ( = ?auto_43990 ?auto_43994 ) ) ( not ( = ?auto_43991 ?auto_43992 ) ) ( not ( = ?auto_43991 ?auto_43994 ) ) ( not ( = ?auto_43992 ?auto_43994 ) ) ( not ( = ?auto_43990 ?auto_43993 ) ) ( not ( = ?auto_43990 ?auto_43996 ) ) ( not ( = ?auto_43991 ?auto_43993 ) ) ( not ( = ?auto_43991 ?auto_43996 ) ) ( not ( = ?auto_43992 ?auto_43993 ) ) ( not ( = ?auto_43992 ?auto_43996 ) ) ( not ( = ?auto_43994 ?auto_43993 ) ) ( not ( = ?auto_43994 ?auto_43996 ) ) ( not ( = ?auto_43993 ?auto_43996 ) ) ( ON ?auto_43996 ?auto_43995 ) ( not ( = ?auto_43990 ?auto_43995 ) ) ( not ( = ?auto_43991 ?auto_43995 ) ) ( not ( = ?auto_43992 ?auto_43995 ) ) ( not ( = ?auto_43994 ?auto_43995 ) ) ( not ( = ?auto_43993 ?auto_43995 ) ) ( not ( = ?auto_43996 ?auto_43995 ) ) ( ON ?auto_43993 ?auto_43996 ) ( ON-TABLE ?auto_43995 ) ( ON ?auto_43994 ?auto_43993 ) ( ON ?auto_43992 ?auto_43994 ) ( CLEAR ?auto_43990 ) ( ON ?auto_43991 ?auto_43992 ) ( CLEAR ?auto_43991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43995 ?auto_43996 ?auto_43993 ?auto_43994 ?auto_43992 )
      ( MAKE-3PILE ?auto_43990 ?auto_43991 ?auto_43992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43997 - BLOCK
      ?auto_43998 - BLOCK
      ?auto_43999 - BLOCK
    )
    :vars
    (
      ?auto_44001 - BLOCK
      ?auto_44002 - BLOCK
      ?auto_44000 - BLOCK
      ?auto_44003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43997 ?auto_43998 ) ) ( not ( = ?auto_43997 ?auto_43999 ) ) ( not ( = ?auto_43997 ?auto_44001 ) ) ( not ( = ?auto_43998 ?auto_43999 ) ) ( not ( = ?auto_43998 ?auto_44001 ) ) ( not ( = ?auto_43999 ?auto_44001 ) ) ( not ( = ?auto_43997 ?auto_44002 ) ) ( not ( = ?auto_43997 ?auto_44000 ) ) ( not ( = ?auto_43998 ?auto_44002 ) ) ( not ( = ?auto_43998 ?auto_44000 ) ) ( not ( = ?auto_43999 ?auto_44002 ) ) ( not ( = ?auto_43999 ?auto_44000 ) ) ( not ( = ?auto_44001 ?auto_44002 ) ) ( not ( = ?auto_44001 ?auto_44000 ) ) ( not ( = ?auto_44002 ?auto_44000 ) ) ( ON ?auto_44000 ?auto_44003 ) ( not ( = ?auto_43997 ?auto_44003 ) ) ( not ( = ?auto_43998 ?auto_44003 ) ) ( not ( = ?auto_43999 ?auto_44003 ) ) ( not ( = ?auto_44001 ?auto_44003 ) ) ( not ( = ?auto_44002 ?auto_44003 ) ) ( not ( = ?auto_44000 ?auto_44003 ) ) ( ON ?auto_44002 ?auto_44000 ) ( ON-TABLE ?auto_44003 ) ( ON ?auto_44001 ?auto_44002 ) ( ON ?auto_43999 ?auto_44001 ) ( ON ?auto_43998 ?auto_43999 ) ( CLEAR ?auto_43998 ) ( HOLDING ?auto_43997 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43997 )
      ( MAKE-3PILE ?auto_43997 ?auto_43998 ?auto_43999 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44004 - BLOCK
      ?auto_44005 - BLOCK
      ?auto_44006 - BLOCK
    )
    :vars
    (
      ?auto_44007 - BLOCK
      ?auto_44009 - BLOCK
      ?auto_44010 - BLOCK
      ?auto_44008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44004 ?auto_44005 ) ) ( not ( = ?auto_44004 ?auto_44006 ) ) ( not ( = ?auto_44004 ?auto_44007 ) ) ( not ( = ?auto_44005 ?auto_44006 ) ) ( not ( = ?auto_44005 ?auto_44007 ) ) ( not ( = ?auto_44006 ?auto_44007 ) ) ( not ( = ?auto_44004 ?auto_44009 ) ) ( not ( = ?auto_44004 ?auto_44010 ) ) ( not ( = ?auto_44005 ?auto_44009 ) ) ( not ( = ?auto_44005 ?auto_44010 ) ) ( not ( = ?auto_44006 ?auto_44009 ) ) ( not ( = ?auto_44006 ?auto_44010 ) ) ( not ( = ?auto_44007 ?auto_44009 ) ) ( not ( = ?auto_44007 ?auto_44010 ) ) ( not ( = ?auto_44009 ?auto_44010 ) ) ( ON ?auto_44010 ?auto_44008 ) ( not ( = ?auto_44004 ?auto_44008 ) ) ( not ( = ?auto_44005 ?auto_44008 ) ) ( not ( = ?auto_44006 ?auto_44008 ) ) ( not ( = ?auto_44007 ?auto_44008 ) ) ( not ( = ?auto_44009 ?auto_44008 ) ) ( not ( = ?auto_44010 ?auto_44008 ) ) ( ON ?auto_44009 ?auto_44010 ) ( ON-TABLE ?auto_44008 ) ( ON ?auto_44007 ?auto_44009 ) ( ON ?auto_44006 ?auto_44007 ) ( ON ?auto_44005 ?auto_44006 ) ( ON ?auto_44004 ?auto_44005 ) ( CLEAR ?auto_44004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44008 ?auto_44010 ?auto_44009 ?auto_44007 ?auto_44006 ?auto_44005 )
      ( MAKE-3PILE ?auto_44004 ?auto_44005 ?auto_44006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44014 - BLOCK
      ?auto_44015 - BLOCK
      ?auto_44016 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44016 ) ( CLEAR ?auto_44015 ) ( ON-TABLE ?auto_44014 ) ( ON ?auto_44015 ?auto_44014 ) ( not ( = ?auto_44014 ?auto_44015 ) ) ( not ( = ?auto_44014 ?auto_44016 ) ) ( not ( = ?auto_44015 ?auto_44016 ) ) )
    :subtasks
    ( ( !STACK ?auto_44016 ?auto_44015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44017 - BLOCK
      ?auto_44018 - BLOCK
      ?auto_44019 - BLOCK
    )
    :vars
    (
      ?auto_44020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44018 ) ( ON-TABLE ?auto_44017 ) ( ON ?auto_44018 ?auto_44017 ) ( not ( = ?auto_44017 ?auto_44018 ) ) ( not ( = ?auto_44017 ?auto_44019 ) ) ( not ( = ?auto_44018 ?auto_44019 ) ) ( ON ?auto_44019 ?auto_44020 ) ( CLEAR ?auto_44019 ) ( HAND-EMPTY ) ( not ( = ?auto_44017 ?auto_44020 ) ) ( not ( = ?auto_44018 ?auto_44020 ) ) ( not ( = ?auto_44019 ?auto_44020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44019 ?auto_44020 )
      ( MAKE-3PILE ?auto_44017 ?auto_44018 ?auto_44019 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44021 - BLOCK
      ?auto_44022 - BLOCK
      ?auto_44023 - BLOCK
    )
    :vars
    (
      ?auto_44024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44021 ) ( not ( = ?auto_44021 ?auto_44022 ) ) ( not ( = ?auto_44021 ?auto_44023 ) ) ( not ( = ?auto_44022 ?auto_44023 ) ) ( ON ?auto_44023 ?auto_44024 ) ( CLEAR ?auto_44023 ) ( not ( = ?auto_44021 ?auto_44024 ) ) ( not ( = ?auto_44022 ?auto_44024 ) ) ( not ( = ?auto_44023 ?auto_44024 ) ) ( HOLDING ?auto_44022 ) ( CLEAR ?auto_44021 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44021 ?auto_44022 )
      ( MAKE-3PILE ?auto_44021 ?auto_44022 ?auto_44023 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44025 - BLOCK
      ?auto_44026 - BLOCK
      ?auto_44027 - BLOCK
    )
    :vars
    (
      ?auto_44028 - BLOCK
      ?auto_44029 - BLOCK
      ?auto_44030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44025 ) ( not ( = ?auto_44025 ?auto_44026 ) ) ( not ( = ?auto_44025 ?auto_44027 ) ) ( not ( = ?auto_44026 ?auto_44027 ) ) ( ON ?auto_44027 ?auto_44028 ) ( not ( = ?auto_44025 ?auto_44028 ) ) ( not ( = ?auto_44026 ?auto_44028 ) ) ( not ( = ?auto_44027 ?auto_44028 ) ) ( CLEAR ?auto_44025 ) ( ON ?auto_44026 ?auto_44027 ) ( CLEAR ?auto_44026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44029 ) ( ON ?auto_44030 ?auto_44029 ) ( ON ?auto_44028 ?auto_44030 ) ( not ( = ?auto_44029 ?auto_44030 ) ) ( not ( = ?auto_44029 ?auto_44028 ) ) ( not ( = ?auto_44029 ?auto_44027 ) ) ( not ( = ?auto_44029 ?auto_44026 ) ) ( not ( = ?auto_44030 ?auto_44028 ) ) ( not ( = ?auto_44030 ?auto_44027 ) ) ( not ( = ?auto_44030 ?auto_44026 ) ) ( not ( = ?auto_44025 ?auto_44029 ) ) ( not ( = ?auto_44025 ?auto_44030 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44029 ?auto_44030 ?auto_44028 ?auto_44027 )
      ( MAKE-3PILE ?auto_44025 ?auto_44026 ?auto_44027 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44031 - BLOCK
      ?auto_44032 - BLOCK
      ?auto_44033 - BLOCK
    )
    :vars
    (
      ?auto_44034 - BLOCK
      ?auto_44035 - BLOCK
      ?auto_44036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44031 ?auto_44032 ) ) ( not ( = ?auto_44031 ?auto_44033 ) ) ( not ( = ?auto_44032 ?auto_44033 ) ) ( ON ?auto_44033 ?auto_44034 ) ( not ( = ?auto_44031 ?auto_44034 ) ) ( not ( = ?auto_44032 ?auto_44034 ) ) ( not ( = ?auto_44033 ?auto_44034 ) ) ( ON ?auto_44032 ?auto_44033 ) ( CLEAR ?auto_44032 ) ( ON-TABLE ?auto_44035 ) ( ON ?auto_44036 ?auto_44035 ) ( ON ?auto_44034 ?auto_44036 ) ( not ( = ?auto_44035 ?auto_44036 ) ) ( not ( = ?auto_44035 ?auto_44034 ) ) ( not ( = ?auto_44035 ?auto_44033 ) ) ( not ( = ?auto_44035 ?auto_44032 ) ) ( not ( = ?auto_44036 ?auto_44034 ) ) ( not ( = ?auto_44036 ?auto_44033 ) ) ( not ( = ?auto_44036 ?auto_44032 ) ) ( not ( = ?auto_44031 ?auto_44035 ) ) ( not ( = ?auto_44031 ?auto_44036 ) ) ( HOLDING ?auto_44031 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44031 )
      ( MAKE-3PILE ?auto_44031 ?auto_44032 ?auto_44033 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44037 - BLOCK
      ?auto_44038 - BLOCK
      ?auto_44039 - BLOCK
    )
    :vars
    (
      ?auto_44041 - BLOCK
      ?auto_44040 - BLOCK
      ?auto_44042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44037 ?auto_44038 ) ) ( not ( = ?auto_44037 ?auto_44039 ) ) ( not ( = ?auto_44038 ?auto_44039 ) ) ( ON ?auto_44039 ?auto_44041 ) ( not ( = ?auto_44037 ?auto_44041 ) ) ( not ( = ?auto_44038 ?auto_44041 ) ) ( not ( = ?auto_44039 ?auto_44041 ) ) ( ON ?auto_44038 ?auto_44039 ) ( ON-TABLE ?auto_44040 ) ( ON ?auto_44042 ?auto_44040 ) ( ON ?auto_44041 ?auto_44042 ) ( not ( = ?auto_44040 ?auto_44042 ) ) ( not ( = ?auto_44040 ?auto_44041 ) ) ( not ( = ?auto_44040 ?auto_44039 ) ) ( not ( = ?auto_44040 ?auto_44038 ) ) ( not ( = ?auto_44042 ?auto_44041 ) ) ( not ( = ?auto_44042 ?auto_44039 ) ) ( not ( = ?auto_44042 ?auto_44038 ) ) ( not ( = ?auto_44037 ?auto_44040 ) ) ( not ( = ?auto_44037 ?auto_44042 ) ) ( ON ?auto_44037 ?auto_44038 ) ( CLEAR ?auto_44037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44040 ?auto_44042 ?auto_44041 ?auto_44039 ?auto_44038 )
      ( MAKE-3PILE ?auto_44037 ?auto_44038 ?auto_44039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44043 - BLOCK
      ?auto_44044 - BLOCK
      ?auto_44045 - BLOCK
    )
    :vars
    (
      ?auto_44046 - BLOCK
      ?auto_44047 - BLOCK
      ?auto_44048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44043 ?auto_44044 ) ) ( not ( = ?auto_44043 ?auto_44045 ) ) ( not ( = ?auto_44044 ?auto_44045 ) ) ( ON ?auto_44045 ?auto_44046 ) ( not ( = ?auto_44043 ?auto_44046 ) ) ( not ( = ?auto_44044 ?auto_44046 ) ) ( not ( = ?auto_44045 ?auto_44046 ) ) ( ON ?auto_44044 ?auto_44045 ) ( ON-TABLE ?auto_44047 ) ( ON ?auto_44048 ?auto_44047 ) ( ON ?auto_44046 ?auto_44048 ) ( not ( = ?auto_44047 ?auto_44048 ) ) ( not ( = ?auto_44047 ?auto_44046 ) ) ( not ( = ?auto_44047 ?auto_44045 ) ) ( not ( = ?auto_44047 ?auto_44044 ) ) ( not ( = ?auto_44048 ?auto_44046 ) ) ( not ( = ?auto_44048 ?auto_44045 ) ) ( not ( = ?auto_44048 ?auto_44044 ) ) ( not ( = ?auto_44043 ?auto_44047 ) ) ( not ( = ?auto_44043 ?auto_44048 ) ) ( HOLDING ?auto_44043 ) ( CLEAR ?auto_44044 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44047 ?auto_44048 ?auto_44046 ?auto_44045 ?auto_44044 ?auto_44043 )
      ( MAKE-3PILE ?auto_44043 ?auto_44044 ?auto_44045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44049 - BLOCK
      ?auto_44050 - BLOCK
      ?auto_44051 - BLOCK
    )
    :vars
    (
      ?auto_44052 - BLOCK
      ?auto_44053 - BLOCK
      ?auto_44054 - BLOCK
      ?auto_44055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44049 ?auto_44050 ) ) ( not ( = ?auto_44049 ?auto_44051 ) ) ( not ( = ?auto_44050 ?auto_44051 ) ) ( ON ?auto_44051 ?auto_44052 ) ( not ( = ?auto_44049 ?auto_44052 ) ) ( not ( = ?auto_44050 ?auto_44052 ) ) ( not ( = ?auto_44051 ?auto_44052 ) ) ( ON ?auto_44050 ?auto_44051 ) ( ON-TABLE ?auto_44053 ) ( ON ?auto_44054 ?auto_44053 ) ( ON ?auto_44052 ?auto_44054 ) ( not ( = ?auto_44053 ?auto_44054 ) ) ( not ( = ?auto_44053 ?auto_44052 ) ) ( not ( = ?auto_44053 ?auto_44051 ) ) ( not ( = ?auto_44053 ?auto_44050 ) ) ( not ( = ?auto_44054 ?auto_44052 ) ) ( not ( = ?auto_44054 ?auto_44051 ) ) ( not ( = ?auto_44054 ?auto_44050 ) ) ( not ( = ?auto_44049 ?auto_44053 ) ) ( not ( = ?auto_44049 ?auto_44054 ) ) ( CLEAR ?auto_44050 ) ( ON ?auto_44049 ?auto_44055 ) ( CLEAR ?auto_44049 ) ( HAND-EMPTY ) ( not ( = ?auto_44049 ?auto_44055 ) ) ( not ( = ?auto_44050 ?auto_44055 ) ) ( not ( = ?auto_44051 ?auto_44055 ) ) ( not ( = ?auto_44052 ?auto_44055 ) ) ( not ( = ?auto_44053 ?auto_44055 ) ) ( not ( = ?auto_44054 ?auto_44055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44049 ?auto_44055 )
      ( MAKE-3PILE ?auto_44049 ?auto_44050 ?auto_44051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44056 - BLOCK
      ?auto_44057 - BLOCK
      ?auto_44058 - BLOCK
    )
    :vars
    (
      ?auto_44060 - BLOCK
      ?auto_44059 - BLOCK
      ?auto_44061 - BLOCK
      ?auto_44062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44056 ?auto_44057 ) ) ( not ( = ?auto_44056 ?auto_44058 ) ) ( not ( = ?auto_44057 ?auto_44058 ) ) ( ON ?auto_44058 ?auto_44060 ) ( not ( = ?auto_44056 ?auto_44060 ) ) ( not ( = ?auto_44057 ?auto_44060 ) ) ( not ( = ?auto_44058 ?auto_44060 ) ) ( ON-TABLE ?auto_44059 ) ( ON ?auto_44061 ?auto_44059 ) ( ON ?auto_44060 ?auto_44061 ) ( not ( = ?auto_44059 ?auto_44061 ) ) ( not ( = ?auto_44059 ?auto_44060 ) ) ( not ( = ?auto_44059 ?auto_44058 ) ) ( not ( = ?auto_44059 ?auto_44057 ) ) ( not ( = ?auto_44061 ?auto_44060 ) ) ( not ( = ?auto_44061 ?auto_44058 ) ) ( not ( = ?auto_44061 ?auto_44057 ) ) ( not ( = ?auto_44056 ?auto_44059 ) ) ( not ( = ?auto_44056 ?auto_44061 ) ) ( ON ?auto_44056 ?auto_44062 ) ( CLEAR ?auto_44056 ) ( not ( = ?auto_44056 ?auto_44062 ) ) ( not ( = ?auto_44057 ?auto_44062 ) ) ( not ( = ?auto_44058 ?auto_44062 ) ) ( not ( = ?auto_44060 ?auto_44062 ) ) ( not ( = ?auto_44059 ?auto_44062 ) ) ( not ( = ?auto_44061 ?auto_44062 ) ) ( HOLDING ?auto_44057 ) ( CLEAR ?auto_44058 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44059 ?auto_44061 ?auto_44060 ?auto_44058 ?auto_44057 )
      ( MAKE-3PILE ?auto_44056 ?auto_44057 ?auto_44058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44063 - BLOCK
      ?auto_44064 - BLOCK
      ?auto_44065 - BLOCK
    )
    :vars
    (
      ?auto_44067 - BLOCK
      ?auto_44069 - BLOCK
      ?auto_44066 - BLOCK
      ?auto_44068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44063 ?auto_44064 ) ) ( not ( = ?auto_44063 ?auto_44065 ) ) ( not ( = ?auto_44064 ?auto_44065 ) ) ( ON ?auto_44065 ?auto_44067 ) ( not ( = ?auto_44063 ?auto_44067 ) ) ( not ( = ?auto_44064 ?auto_44067 ) ) ( not ( = ?auto_44065 ?auto_44067 ) ) ( ON-TABLE ?auto_44069 ) ( ON ?auto_44066 ?auto_44069 ) ( ON ?auto_44067 ?auto_44066 ) ( not ( = ?auto_44069 ?auto_44066 ) ) ( not ( = ?auto_44069 ?auto_44067 ) ) ( not ( = ?auto_44069 ?auto_44065 ) ) ( not ( = ?auto_44069 ?auto_44064 ) ) ( not ( = ?auto_44066 ?auto_44067 ) ) ( not ( = ?auto_44066 ?auto_44065 ) ) ( not ( = ?auto_44066 ?auto_44064 ) ) ( not ( = ?auto_44063 ?auto_44069 ) ) ( not ( = ?auto_44063 ?auto_44066 ) ) ( ON ?auto_44063 ?auto_44068 ) ( not ( = ?auto_44063 ?auto_44068 ) ) ( not ( = ?auto_44064 ?auto_44068 ) ) ( not ( = ?auto_44065 ?auto_44068 ) ) ( not ( = ?auto_44067 ?auto_44068 ) ) ( not ( = ?auto_44069 ?auto_44068 ) ) ( not ( = ?auto_44066 ?auto_44068 ) ) ( CLEAR ?auto_44065 ) ( ON ?auto_44064 ?auto_44063 ) ( CLEAR ?auto_44064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44068 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44068 ?auto_44063 )
      ( MAKE-3PILE ?auto_44063 ?auto_44064 ?auto_44065 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44070 - BLOCK
      ?auto_44071 - BLOCK
      ?auto_44072 - BLOCK
    )
    :vars
    (
      ?auto_44073 - BLOCK
      ?auto_44074 - BLOCK
      ?auto_44075 - BLOCK
      ?auto_44076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44070 ?auto_44071 ) ) ( not ( = ?auto_44070 ?auto_44072 ) ) ( not ( = ?auto_44071 ?auto_44072 ) ) ( not ( = ?auto_44070 ?auto_44073 ) ) ( not ( = ?auto_44071 ?auto_44073 ) ) ( not ( = ?auto_44072 ?auto_44073 ) ) ( ON-TABLE ?auto_44074 ) ( ON ?auto_44075 ?auto_44074 ) ( ON ?auto_44073 ?auto_44075 ) ( not ( = ?auto_44074 ?auto_44075 ) ) ( not ( = ?auto_44074 ?auto_44073 ) ) ( not ( = ?auto_44074 ?auto_44072 ) ) ( not ( = ?auto_44074 ?auto_44071 ) ) ( not ( = ?auto_44075 ?auto_44073 ) ) ( not ( = ?auto_44075 ?auto_44072 ) ) ( not ( = ?auto_44075 ?auto_44071 ) ) ( not ( = ?auto_44070 ?auto_44074 ) ) ( not ( = ?auto_44070 ?auto_44075 ) ) ( ON ?auto_44070 ?auto_44076 ) ( not ( = ?auto_44070 ?auto_44076 ) ) ( not ( = ?auto_44071 ?auto_44076 ) ) ( not ( = ?auto_44072 ?auto_44076 ) ) ( not ( = ?auto_44073 ?auto_44076 ) ) ( not ( = ?auto_44074 ?auto_44076 ) ) ( not ( = ?auto_44075 ?auto_44076 ) ) ( ON ?auto_44071 ?auto_44070 ) ( CLEAR ?auto_44071 ) ( ON-TABLE ?auto_44076 ) ( HOLDING ?auto_44072 ) ( CLEAR ?auto_44073 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44074 ?auto_44075 ?auto_44073 ?auto_44072 )
      ( MAKE-3PILE ?auto_44070 ?auto_44071 ?auto_44072 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44077 - BLOCK
      ?auto_44078 - BLOCK
      ?auto_44079 - BLOCK
    )
    :vars
    (
      ?auto_44080 - BLOCK
      ?auto_44081 - BLOCK
      ?auto_44083 - BLOCK
      ?auto_44082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44077 ?auto_44078 ) ) ( not ( = ?auto_44077 ?auto_44079 ) ) ( not ( = ?auto_44078 ?auto_44079 ) ) ( not ( = ?auto_44077 ?auto_44080 ) ) ( not ( = ?auto_44078 ?auto_44080 ) ) ( not ( = ?auto_44079 ?auto_44080 ) ) ( ON-TABLE ?auto_44081 ) ( ON ?auto_44083 ?auto_44081 ) ( ON ?auto_44080 ?auto_44083 ) ( not ( = ?auto_44081 ?auto_44083 ) ) ( not ( = ?auto_44081 ?auto_44080 ) ) ( not ( = ?auto_44081 ?auto_44079 ) ) ( not ( = ?auto_44081 ?auto_44078 ) ) ( not ( = ?auto_44083 ?auto_44080 ) ) ( not ( = ?auto_44083 ?auto_44079 ) ) ( not ( = ?auto_44083 ?auto_44078 ) ) ( not ( = ?auto_44077 ?auto_44081 ) ) ( not ( = ?auto_44077 ?auto_44083 ) ) ( ON ?auto_44077 ?auto_44082 ) ( not ( = ?auto_44077 ?auto_44082 ) ) ( not ( = ?auto_44078 ?auto_44082 ) ) ( not ( = ?auto_44079 ?auto_44082 ) ) ( not ( = ?auto_44080 ?auto_44082 ) ) ( not ( = ?auto_44081 ?auto_44082 ) ) ( not ( = ?auto_44083 ?auto_44082 ) ) ( ON ?auto_44078 ?auto_44077 ) ( ON-TABLE ?auto_44082 ) ( CLEAR ?auto_44080 ) ( ON ?auto_44079 ?auto_44078 ) ( CLEAR ?auto_44079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44082 ?auto_44077 ?auto_44078 )
      ( MAKE-3PILE ?auto_44077 ?auto_44078 ?auto_44079 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44084 - BLOCK
      ?auto_44085 - BLOCK
      ?auto_44086 - BLOCK
    )
    :vars
    (
      ?auto_44089 - BLOCK
      ?auto_44090 - BLOCK
      ?auto_44087 - BLOCK
      ?auto_44088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44084 ?auto_44085 ) ) ( not ( = ?auto_44084 ?auto_44086 ) ) ( not ( = ?auto_44085 ?auto_44086 ) ) ( not ( = ?auto_44084 ?auto_44089 ) ) ( not ( = ?auto_44085 ?auto_44089 ) ) ( not ( = ?auto_44086 ?auto_44089 ) ) ( ON-TABLE ?auto_44090 ) ( ON ?auto_44087 ?auto_44090 ) ( not ( = ?auto_44090 ?auto_44087 ) ) ( not ( = ?auto_44090 ?auto_44089 ) ) ( not ( = ?auto_44090 ?auto_44086 ) ) ( not ( = ?auto_44090 ?auto_44085 ) ) ( not ( = ?auto_44087 ?auto_44089 ) ) ( not ( = ?auto_44087 ?auto_44086 ) ) ( not ( = ?auto_44087 ?auto_44085 ) ) ( not ( = ?auto_44084 ?auto_44090 ) ) ( not ( = ?auto_44084 ?auto_44087 ) ) ( ON ?auto_44084 ?auto_44088 ) ( not ( = ?auto_44084 ?auto_44088 ) ) ( not ( = ?auto_44085 ?auto_44088 ) ) ( not ( = ?auto_44086 ?auto_44088 ) ) ( not ( = ?auto_44089 ?auto_44088 ) ) ( not ( = ?auto_44090 ?auto_44088 ) ) ( not ( = ?auto_44087 ?auto_44088 ) ) ( ON ?auto_44085 ?auto_44084 ) ( ON-TABLE ?auto_44088 ) ( ON ?auto_44086 ?auto_44085 ) ( CLEAR ?auto_44086 ) ( HOLDING ?auto_44089 ) ( CLEAR ?auto_44087 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44090 ?auto_44087 ?auto_44089 )
      ( MAKE-3PILE ?auto_44084 ?auto_44085 ?auto_44086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44091 - BLOCK
      ?auto_44092 - BLOCK
      ?auto_44093 - BLOCK
    )
    :vars
    (
      ?auto_44095 - BLOCK
      ?auto_44096 - BLOCK
      ?auto_44097 - BLOCK
      ?auto_44094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44091 ?auto_44092 ) ) ( not ( = ?auto_44091 ?auto_44093 ) ) ( not ( = ?auto_44092 ?auto_44093 ) ) ( not ( = ?auto_44091 ?auto_44095 ) ) ( not ( = ?auto_44092 ?auto_44095 ) ) ( not ( = ?auto_44093 ?auto_44095 ) ) ( ON-TABLE ?auto_44096 ) ( ON ?auto_44097 ?auto_44096 ) ( not ( = ?auto_44096 ?auto_44097 ) ) ( not ( = ?auto_44096 ?auto_44095 ) ) ( not ( = ?auto_44096 ?auto_44093 ) ) ( not ( = ?auto_44096 ?auto_44092 ) ) ( not ( = ?auto_44097 ?auto_44095 ) ) ( not ( = ?auto_44097 ?auto_44093 ) ) ( not ( = ?auto_44097 ?auto_44092 ) ) ( not ( = ?auto_44091 ?auto_44096 ) ) ( not ( = ?auto_44091 ?auto_44097 ) ) ( ON ?auto_44091 ?auto_44094 ) ( not ( = ?auto_44091 ?auto_44094 ) ) ( not ( = ?auto_44092 ?auto_44094 ) ) ( not ( = ?auto_44093 ?auto_44094 ) ) ( not ( = ?auto_44095 ?auto_44094 ) ) ( not ( = ?auto_44096 ?auto_44094 ) ) ( not ( = ?auto_44097 ?auto_44094 ) ) ( ON ?auto_44092 ?auto_44091 ) ( ON-TABLE ?auto_44094 ) ( ON ?auto_44093 ?auto_44092 ) ( CLEAR ?auto_44097 ) ( ON ?auto_44095 ?auto_44093 ) ( CLEAR ?auto_44095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44094 ?auto_44091 ?auto_44092 ?auto_44093 )
      ( MAKE-3PILE ?auto_44091 ?auto_44092 ?auto_44093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44098 - BLOCK
      ?auto_44099 - BLOCK
      ?auto_44100 - BLOCK
    )
    :vars
    (
      ?auto_44103 - BLOCK
      ?auto_44101 - BLOCK
      ?auto_44102 - BLOCK
      ?auto_44104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44098 ?auto_44099 ) ) ( not ( = ?auto_44098 ?auto_44100 ) ) ( not ( = ?auto_44099 ?auto_44100 ) ) ( not ( = ?auto_44098 ?auto_44103 ) ) ( not ( = ?auto_44099 ?auto_44103 ) ) ( not ( = ?auto_44100 ?auto_44103 ) ) ( ON-TABLE ?auto_44101 ) ( not ( = ?auto_44101 ?auto_44102 ) ) ( not ( = ?auto_44101 ?auto_44103 ) ) ( not ( = ?auto_44101 ?auto_44100 ) ) ( not ( = ?auto_44101 ?auto_44099 ) ) ( not ( = ?auto_44102 ?auto_44103 ) ) ( not ( = ?auto_44102 ?auto_44100 ) ) ( not ( = ?auto_44102 ?auto_44099 ) ) ( not ( = ?auto_44098 ?auto_44101 ) ) ( not ( = ?auto_44098 ?auto_44102 ) ) ( ON ?auto_44098 ?auto_44104 ) ( not ( = ?auto_44098 ?auto_44104 ) ) ( not ( = ?auto_44099 ?auto_44104 ) ) ( not ( = ?auto_44100 ?auto_44104 ) ) ( not ( = ?auto_44103 ?auto_44104 ) ) ( not ( = ?auto_44101 ?auto_44104 ) ) ( not ( = ?auto_44102 ?auto_44104 ) ) ( ON ?auto_44099 ?auto_44098 ) ( ON-TABLE ?auto_44104 ) ( ON ?auto_44100 ?auto_44099 ) ( ON ?auto_44103 ?auto_44100 ) ( CLEAR ?auto_44103 ) ( HOLDING ?auto_44102 ) ( CLEAR ?auto_44101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44101 ?auto_44102 )
      ( MAKE-3PILE ?auto_44098 ?auto_44099 ?auto_44100 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44105 - BLOCK
      ?auto_44106 - BLOCK
      ?auto_44107 - BLOCK
    )
    :vars
    (
      ?auto_44111 - BLOCK
      ?auto_44109 - BLOCK
      ?auto_44108 - BLOCK
      ?auto_44110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44105 ?auto_44106 ) ) ( not ( = ?auto_44105 ?auto_44107 ) ) ( not ( = ?auto_44106 ?auto_44107 ) ) ( not ( = ?auto_44105 ?auto_44111 ) ) ( not ( = ?auto_44106 ?auto_44111 ) ) ( not ( = ?auto_44107 ?auto_44111 ) ) ( ON-TABLE ?auto_44109 ) ( not ( = ?auto_44109 ?auto_44108 ) ) ( not ( = ?auto_44109 ?auto_44111 ) ) ( not ( = ?auto_44109 ?auto_44107 ) ) ( not ( = ?auto_44109 ?auto_44106 ) ) ( not ( = ?auto_44108 ?auto_44111 ) ) ( not ( = ?auto_44108 ?auto_44107 ) ) ( not ( = ?auto_44108 ?auto_44106 ) ) ( not ( = ?auto_44105 ?auto_44109 ) ) ( not ( = ?auto_44105 ?auto_44108 ) ) ( ON ?auto_44105 ?auto_44110 ) ( not ( = ?auto_44105 ?auto_44110 ) ) ( not ( = ?auto_44106 ?auto_44110 ) ) ( not ( = ?auto_44107 ?auto_44110 ) ) ( not ( = ?auto_44111 ?auto_44110 ) ) ( not ( = ?auto_44109 ?auto_44110 ) ) ( not ( = ?auto_44108 ?auto_44110 ) ) ( ON ?auto_44106 ?auto_44105 ) ( ON-TABLE ?auto_44110 ) ( ON ?auto_44107 ?auto_44106 ) ( ON ?auto_44111 ?auto_44107 ) ( CLEAR ?auto_44109 ) ( ON ?auto_44108 ?auto_44111 ) ( CLEAR ?auto_44108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44110 ?auto_44105 ?auto_44106 ?auto_44107 ?auto_44111 )
      ( MAKE-3PILE ?auto_44105 ?auto_44106 ?auto_44107 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44112 - BLOCK
      ?auto_44113 - BLOCK
      ?auto_44114 - BLOCK
    )
    :vars
    (
      ?auto_44117 - BLOCK
      ?auto_44115 - BLOCK
      ?auto_44116 - BLOCK
      ?auto_44118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44112 ?auto_44113 ) ) ( not ( = ?auto_44112 ?auto_44114 ) ) ( not ( = ?auto_44113 ?auto_44114 ) ) ( not ( = ?auto_44112 ?auto_44117 ) ) ( not ( = ?auto_44113 ?auto_44117 ) ) ( not ( = ?auto_44114 ?auto_44117 ) ) ( not ( = ?auto_44115 ?auto_44116 ) ) ( not ( = ?auto_44115 ?auto_44117 ) ) ( not ( = ?auto_44115 ?auto_44114 ) ) ( not ( = ?auto_44115 ?auto_44113 ) ) ( not ( = ?auto_44116 ?auto_44117 ) ) ( not ( = ?auto_44116 ?auto_44114 ) ) ( not ( = ?auto_44116 ?auto_44113 ) ) ( not ( = ?auto_44112 ?auto_44115 ) ) ( not ( = ?auto_44112 ?auto_44116 ) ) ( ON ?auto_44112 ?auto_44118 ) ( not ( = ?auto_44112 ?auto_44118 ) ) ( not ( = ?auto_44113 ?auto_44118 ) ) ( not ( = ?auto_44114 ?auto_44118 ) ) ( not ( = ?auto_44117 ?auto_44118 ) ) ( not ( = ?auto_44115 ?auto_44118 ) ) ( not ( = ?auto_44116 ?auto_44118 ) ) ( ON ?auto_44113 ?auto_44112 ) ( ON-TABLE ?auto_44118 ) ( ON ?auto_44114 ?auto_44113 ) ( ON ?auto_44117 ?auto_44114 ) ( ON ?auto_44116 ?auto_44117 ) ( CLEAR ?auto_44116 ) ( HOLDING ?auto_44115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44115 )
      ( MAKE-3PILE ?auto_44112 ?auto_44113 ?auto_44114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_44119 - BLOCK
      ?auto_44120 - BLOCK
      ?auto_44121 - BLOCK
    )
    :vars
    (
      ?auto_44124 - BLOCK
      ?auto_44125 - BLOCK
      ?auto_44122 - BLOCK
      ?auto_44123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44119 ?auto_44120 ) ) ( not ( = ?auto_44119 ?auto_44121 ) ) ( not ( = ?auto_44120 ?auto_44121 ) ) ( not ( = ?auto_44119 ?auto_44124 ) ) ( not ( = ?auto_44120 ?auto_44124 ) ) ( not ( = ?auto_44121 ?auto_44124 ) ) ( not ( = ?auto_44125 ?auto_44122 ) ) ( not ( = ?auto_44125 ?auto_44124 ) ) ( not ( = ?auto_44125 ?auto_44121 ) ) ( not ( = ?auto_44125 ?auto_44120 ) ) ( not ( = ?auto_44122 ?auto_44124 ) ) ( not ( = ?auto_44122 ?auto_44121 ) ) ( not ( = ?auto_44122 ?auto_44120 ) ) ( not ( = ?auto_44119 ?auto_44125 ) ) ( not ( = ?auto_44119 ?auto_44122 ) ) ( ON ?auto_44119 ?auto_44123 ) ( not ( = ?auto_44119 ?auto_44123 ) ) ( not ( = ?auto_44120 ?auto_44123 ) ) ( not ( = ?auto_44121 ?auto_44123 ) ) ( not ( = ?auto_44124 ?auto_44123 ) ) ( not ( = ?auto_44125 ?auto_44123 ) ) ( not ( = ?auto_44122 ?auto_44123 ) ) ( ON ?auto_44120 ?auto_44119 ) ( ON-TABLE ?auto_44123 ) ( ON ?auto_44121 ?auto_44120 ) ( ON ?auto_44124 ?auto_44121 ) ( ON ?auto_44122 ?auto_44124 ) ( ON ?auto_44125 ?auto_44122 ) ( CLEAR ?auto_44125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44123 ?auto_44119 ?auto_44120 ?auto_44121 ?auto_44124 ?auto_44122 )
      ( MAKE-3PILE ?auto_44119 ?auto_44120 ?auto_44121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44128 - BLOCK
      ?auto_44129 - BLOCK
    )
    :vars
    (
      ?auto_44130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44130 ?auto_44129 ) ( CLEAR ?auto_44130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44128 ) ( ON ?auto_44129 ?auto_44128 ) ( not ( = ?auto_44128 ?auto_44129 ) ) ( not ( = ?auto_44128 ?auto_44130 ) ) ( not ( = ?auto_44129 ?auto_44130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44130 ?auto_44129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44131 - BLOCK
      ?auto_44132 - BLOCK
    )
    :vars
    (
      ?auto_44133 - BLOCK
      ?auto_44134 - BLOCK
      ?auto_44135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44133 ?auto_44132 ) ( CLEAR ?auto_44133 ) ( ON-TABLE ?auto_44131 ) ( ON ?auto_44132 ?auto_44131 ) ( not ( = ?auto_44131 ?auto_44132 ) ) ( not ( = ?auto_44131 ?auto_44133 ) ) ( not ( = ?auto_44132 ?auto_44133 ) ) ( HOLDING ?auto_44134 ) ( CLEAR ?auto_44135 ) ( not ( = ?auto_44131 ?auto_44134 ) ) ( not ( = ?auto_44131 ?auto_44135 ) ) ( not ( = ?auto_44132 ?auto_44134 ) ) ( not ( = ?auto_44132 ?auto_44135 ) ) ( not ( = ?auto_44133 ?auto_44134 ) ) ( not ( = ?auto_44133 ?auto_44135 ) ) ( not ( = ?auto_44134 ?auto_44135 ) ) )
    :subtasks
    ( ( !STACK ?auto_44134 ?auto_44135 )
      ( MAKE-2PILE ?auto_44131 ?auto_44132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44136 - BLOCK
      ?auto_44137 - BLOCK
    )
    :vars
    (
      ?auto_44139 - BLOCK
      ?auto_44140 - BLOCK
      ?auto_44138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44139 ?auto_44137 ) ( ON-TABLE ?auto_44136 ) ( ON ?auto_44137 ?auto_44136 ) ( not ( = ?auto_44136 ?auto_44137 ) ) ( not ( = ?auto_44136 ?auto_44139 ) ) ( not ( = ?auto_44137 ?auto_44139 ) ) ( CLEAR ?auto_44140 ) ( not ( = ?auto_44136 ?auto_44138 ) ) ( not ( = ?auto_44136 ?auto_44140 ) ) ( not ( = ?auto_44137 ?auto_44138 ) ) ( not ( = ?auto_44137 ?auto_44140 ) ) ( not ( = ?auto_44139 ?auto_44138 ) ) ( not ( = ?auto_44139 ?auto_44140 ) ) ( not ( = ?auto_44138 ?auto_44140 ) ) ( ON ?auto_44138 ?auto_44139 ) ( CLEAR ?auto_44138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44136 ?auto_44137 ?auto_44139 )
      ( MAKE-2PILE ?auto_44136 ?auto_44137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44141 - BLOCK
      ?auto_44142 - BLOCK
    )
    :vars
    (
      ?auto_44145 - BLOCK
      ?auto_44143 - BLOCK
      ?auto_44144 - BLOCK
      ?auto_44146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44145 ?auto_44142 ) ( ON-TABLE ?auto_44141 ) ( ON ?auto_44142 ?auto_44141 ) ( not ( = ?auto_44141 ?auto_44142 ) ) ( not ( = ?auto_44141 ?auto_44145 ) ) ( not ( = ?auto_44142 ?auto_44145 ) ) ( not ( = ?auto_44141 ?auto_44143 ) ) ( not ( = ?auto_44141 ?auto_44144 ) ) ( not ( = ?auto_44142 ?auto_44143 ) ) ( not ( = ?auto_44142 ?auto_44144 ) ) ( not ( = ?auto_44145 ?auto_44143 ) ) ( not ( = ?auto_44145 ?auto_44144 ) ) ( not ( = ?auto_44143 ?auto_44144 ) ) ( ON ?auto_44143 ?auto_44145 ) ( CLEAR ?auto_44143 ) ( HOLDING ?auto_44144 ) ( CLEAR ?auto_44146 ) ( ON-TABLE ?auto_44146 ) ( not ( = ?auto_44146 ?auto_44144 ) ) ( not ( = ?auto_44141 ?auto_44146 ) ) ( not ( = ?auto_44142 ?auto_44146 ) ) ( not ( = ?auto_44145 ?auto_44146 ) ) ( not ( = ?auto_44143 ?auto_44146 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44146 ?auto_44144 )
      ( MAKE-2PILE ?auto_44141 ?auto_44142 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44147 - BLOCK
      ?auto_44148 - BLOCK
    )
    :vars
    (
      ?auto_44151 - BLOCK
      ?auto_44152 - BLOCK
      ?auto_44149 - BLOCK
      ?auto_44150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44151 ?auto_44148 ) ( ON-TABLE ?auto_44147 ) ( ON ?auto_44148 ?auto_44147 ) ( not ( = ?auto_44147 ?auto_44148 ) ) ( not ( = ?auto_44147 ?auto_44151 ) ) ( not ( = ?auto_44148 ?auto_44151 ) ) ( not ( = ?auto_44147 ?auto_44152 ) ) ( not ( = ?auto_44147 ?auto_44149 ) ) ( not ( = ?auto_44148 ?auto_44152 ) ) ( not ( = ?auto_44148 ?auto_44149 ) ) ( not ( = ?auto_44151 ?auto_44152 ) ) ( not ( = ?auto_44151 ?auto_44149 ) ) ( not ( = ?auto_44152 ?auto_44149 ) ) ( ON ?auto_44152 ?auto_44151 ) ( CLEAR ?auto_44150 ) ( ON-TABLE ?auto_44150 ) ( not ( = ?auto_44150 ?auto_44149 ) ) ( not ( = ?auto_44147 ?auto_44150 ) ) ( not ( = ?auto_44148 ?auto_44150 ) ) ( not ( = ?auto_44151 ?auto_44150 ) ) ( not ( = ?auto_44152 ?auto_44150 ) ) ( ON ?auto_44149 ?auto_44152 ) ( CLEAR ?auto_44149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44147 ?auto_44148 ?auto_44151 ?auto_44152 )
      ( MAKE-2PILE ?auto_44147 ?auto_44148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44153 - BLOCK
      ?auto_44154 - BLOCK
    )
    :vars
    (
      ?auto_44155 - BLOCK
      ?auto_44157 - BLOCK
      ?auto_44156 - BLOCK
      ?auto_44158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44155 ?auto_44154 ) ( ON-TABLE ?auto_44153 ) ( ON ?auto_44154 ?auto_44153 ) ( not ( = ?auto_44153 ?auto_44154 ) ) ( not ( = ?auto_44153 ?auto_44155 ) ) ( not ( = ?auto_44154 ?auto_44155 ) ) ( not ( = ?auto_44153 ?auto_44157 ) ) ( not ( = ?auto_44153 ?auto_44156 ) ) ( not ( = ?auto_44154 ?auto_44157 ) ) ( not ( = ?auto_44154 ?auto_44156 ) ) ( not ( = ?auto_44155 ?auto_44157 ) ) ( not ( = ?auto_44155 ?auto_44156 ) ) ( not ( = ?auto_44157 ?auto_44156 ) ) ( ON ?auto_44157 ?auto_44155 ) ( not ( = ?auto_44158 ?auto_44156 ) ) ( not ( = ?auto_44153 ?auto_44158 ) ) ( not ( = ?auto_44154 ?auto_44158 ) ) ( not ( = ?auto_44155 ?auto_44158 ) ) ( not ( = ?auto_44157 ?auto_44158 ) ) ( ON ?auto_44156 ?auto_44157 ) ( CLEAR ?auto_44156 ) ( HOLDING ?auto_44158 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44158 )
      ( MAKE-2PILE ?auto_44153 ?auto_44154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44159 - BLOCK
      ?auto_44160 - BLOCK
    )
    :vars
    (
      ?auto_44163 - BLOCK
      ?auto_44164 - BLOCK
      ?auto_44161 - BLOCK
      ?auto_44162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44163 ?auto_44160 ) ( ON-TABLE ?auto_44159 ) ( ON ?auto_44160 ?auto_44159 ) ( not ( = ?auto_44159 ?auto_44160 ) ) ( not ( = ?auto_44159 ?auto_44163 ) ) ( not ( = ?auto_44160 ?auto_44163 ) ) ( not ( = ?auto_44159 ?auto_44164 ) ) ( not ( = ?auto_44159 ?auto_44161 ) ) ( not ( = ?auto_44160 ?auto_44164 ) ) ( not ( = ?auto_44160 ?auto_44161 ) ) ( not ( = ?auto_44163 ?auto_44164 ) ) ( not ( = ?auto_44163 ?auto_44161 ) ) ( not ( = ?auto_44164 ?auto_44161 ) ) ( ON ?auto_44164 ?auto_44163 ) ( not ( = ?auto_44162 ?auto_44161 ) ) ( not ( = ?auto_44159 ?auto_44162 ) ) ( not ( = ?auto_44160 ?auto_44162 ) ) ( not ( = ?auto_44163 ?auto_44162 ) ) ( not ( = ?auto_44164 ?auto_44162 ) ) ( ON ?auto_44161 ?auto_44164 ) ( ON ?auto_44162 ?auto_44161 ) ( CLEAR ?auto_44162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44159 ?auto_44160 ?auto_44163 ?auto_44164 ?auto_44161 )
      ( MAKE-2PILE ?auto_44159 ?auto_44160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44165 - BLOCK
      ?auto_44166 - BLOCK
    )
    :vars
    (
      ?auto_44168 - BLOCK
      ?auto_44169 - BLOCK
      ?auto_44167 - BLOCK
      ?auto_44170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44168 ?auto_44166 ) ( ON-TABLE ?auto_44165 ) ( ON ?auto_44166 ?auto_44165 ) ( not ( = ?auto_44165 ?auto_44166 ) ) ( not ( = ?auto_44165 ?auto_44168 ) ) ( not ( = ?auto_44166 ?auto_44168 ) ) ( not ( = ?auto_44165 ?auto_44169 ) ) ( not ( = ?auto_44165 ?auto_44167 ) ) ( not ( = ?auto_44166 ?auto_44169 ) ) ( not ( = ?auto_44166 ?auto_44167 ) ) ( not ( = ?auto_44168 ?auto_44169 ) ) ( not ( = ?auto_44168 ?auto_44167 ) ) ( not ( = ?auto_44169 ?auto_44167 ) ) ( ON ?auto_44169 ?auto_44168 ) ( not ( = ?auto_44170 ?auto_44167 ) ) ( not ( = ?auto_44165 ?auto_44170 ) ) ( not ( = ?auto_44166 ?auto_44170 ) ) ( not ( = ?auto_44168 ?auto_44170 ) ) ( not ( = ?auto_44169 ?auto_44170 ) ) ( ON ?auto_44167 ?auto_44169 ) ( HOLDING ?auto_44170 ) ( CLEAR ?auto_44167 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44165 ?auto_44166 ?auto_44168 ?auto_44169 ?auto_44167 ?auto_44170 )
      ( MAKE-2PILE ?auto_44165 ?auto_44166 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44171 - BLOCK
      ?auto_44172 - BLOCK
    )
    :vars
    (
      ?auto_44173 - BLOCK
      ?auto_44175 - BLOCK
      ?auto_44176 - BLOCK
      ?auto_44174 - BLOCK
      ?auto_44177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44173 ?auto_44172 ) ( ON-TABLE ?auto_44171 ) ( ON ?auto_44172 ?auto_44171 ) ( not ( = ?auto_44171 ?auto_44172 ) ) ( not ( = ?auto_44171 ?auto_44173 ) ) ( not ( = ?auto_44172 ?auto_44173 ) ) ( not ( = ?auto_44171 ?auto_44175 ) ) ( not ( = ?auto_44171 ?auto_44176 ) ) ( not ( = ?auto_44172 ?auto_44175 ) ) ( not ( = ?auto_44172 ?auto_44176 ) ) ( not ( = ?auto_44173 ?auto_44175 ) ) ( not ( = ?auto_44173 ?auto_44176 ) ) ( not ( = ?auto_44175 ?auto_44176 ) ) ( ON ?auto_44175 ?auto_44173 ) ( not ( = ?auto_44174 ?auto_44176 ) ) ( not ( = ?auto_44171 ?auto_44174 ) ) ( not ( = ?auto_44172 ?auto_44174 ) ) ( not ( = ?auto_44173 ?auto_44174 ) ) ( not ( = ?auto_44175 ?auto_44174 ) ) ( ON ?auto_44176 ?auto_44175 ) ( CLEAR ?auto_44176 ) ( ON ?auto_44174 ?auto_44177 ) ( CLEAR ?auto_44174 ) ( HAND-EMPTY ) ( not ( = ?auto_44171 ?auto_44177 ) ) ( not ( = ?auto_44172 ?auto_44177 ) ) ( not ( = ?auto_44173 ?auto_44177 ) ) ( not ( = ?auto_44175 ?auto_44177 ) ) ( not ( = ?auto_44176 ?auto_44177 ) ) ( not ( = ?auto_44174 ?auto_44177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44174 ?auto_44177 )
      ( MAKE-2PILE ?auto_44171 ?auto_44172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44178 - BLOCK
      ?auto_44179 - BLOCK
    )
    :vars
    (
      ?auto_44183 - BLOCK
      ?auto_44182 - BLOCK
      ?auto_44184 - BLOCK
      ?auto_44181 - BLOCK
      ?auto_44180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44183 ?auto_44179 ) ( ON-TABLE ?auto_44178 ) ( ON ?auto_44179 ?auto_44178 ) ( not ( = ?auto_44178 ?auto_44179 ) ) ( not ( = ?auto_44178 ?auto_44183 ) ) ( not ( = ?auto_44179 ?auto_44183 ) ) ( not ( = ?auto_44178 ?auto_44182 ) ) ( not ( = ?auto_44178 ?auto_44184 ) ) ( not ( = ?auto_44179 ?auto_44182 ) ) ( not ( = ?auto_44179 ?auto_44184 ) ) ( not ( = ?auto_44183 ?auto_44182 ) ) ( not ( = ?auto_44183 ?auto_44184 ) ) ( not ( = ?auto_44182 ?auto_44184 ) ) ( ON ?auto_44182 ?auto_44183 ) ( not ( = ?auto_44181 ?auto_44184 ) ) ( not ( = ?auto_44178 ?auto_44181 ) ) ( not ( = ?auto_44179 ?auto_44181 ) ) ( not ( = ?auto_44183 ?auto_44181 ) ) ( not ( = ?auto_44182 ?auto_44181 ) ) ( ON ?auto_44181 ?auto_44180 ) ( CLEAR ?auto_44181 ) ( not ( = ?auto_44178 ?auto_44180 ) ) ( not ( = ?auto_44179 ?auto_44180 ) ) ( not ( = ?auto_44183 ?auto_44180 ) ) ( not ( = ?auto_44182 ?auto_44180 ) ) ( not ( = ?auto_44184 ?auto_44180 ) ) ( not ( = ?auto_44181 ?auto_44180 ) ) ( HOLDING ?auto_44184 ) ( CLEAR ?auto_44182 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44178 ?auto_44179 ?auto_44183 ?auto_44182 ?auto_44184 )
      ( MAKE-2PILE ?auto_44178 ?auto_44179 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44185 - BLOCK
      ?auto_44186 - BLOCK
    )
    :vars
    (
      ?auto_44187 - BLOCK
      ?auto_44188 - BLOCK
      ?auto_44189 - BLOCK
      ?auto_44191 - BLOCK
      ?auto_44190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44187 ?auto_44186 ) ( ON-TABLE ?auto_44185 ) ( ON ?auto_44186 ?auto_44185 ) ( not ( = ?auto_44185 ?auto_44186 ) ) ( not ( = ?auto_44185 ?auto_44187 ) ) ( not ( = ?auto_44186 ?auto_44187 ) ) ( not ( = ?auto_44185 ?auto_44188 ) ) ( not ( = ?auto_44185 ?auto_44189 ) ) ( not ( = ?auto_44186 ?auto_44188 ) ) ( not ( = ?auto_44186 ?auto_44189 ) ) ( not ( = ?auto_44187 ?auto_44188 ) ) ( not ( = ?auto_44187 ?auto_44189 ) ) ( not ( = ?auto_44188 ?auto_44189 ) ) ( ON ?auto_44188 ?auto_44187 ) ( not ( = ?auto_44191 ?auto_44189 ) ) ( not ( = ?auto_44185 ?auto_44191 ) ) ( not ( = ?auto_44186 ?auto_44191 ) ) ( not ( = ?auto_44187 ?auto_44191 ) ) ( not ( = ?auto_44188 ?auto_44191 ) ) ( ON ?auto_44191 ?auto_44190 ) ( not ( = ?auto_44185 ?auto_44190 ) ) ( not ( = ?auto_44186 ?auto_44190 ) ) ( not ( = ?auto_44187 ?auto_44190 ) ) ( not ( = ?auto_44188 ?auto_44190 ) ) ( not ( = ?auto_44189 ?auto_44190 ) ) ( not ( = ?auto_44191 ?auto_44190 ) ) ( CLEAR ?auto_44188 ) ( ON ?auto_44189 ?auto_44191 ) ( CLEAR ?auto_44189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44190 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44190 ?auto_44191 )
      ( MAKE-2PILE ?auto_44185 ?auto_44186 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44192 - BLOCK
      ?auto_44193 - BLOCK
    )
    :vars
    (
      ?auto_44198 - BLOCK
      ?auto_44195 - BLOCK
      ?auto_44197 - BLOCK
      ?auto_44194 - BLOCK
      ?auto_44196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44198 ?auto_44193 ) ( ON-TABLE ?auto_44192 ) ( ON ?auto_44193 ?auto_44192 ) ( not ( = ?auto_44192 ?auto_44193 ) ) ( not ( = ?auto_44192 ?auto_44198 ) ) ( not ( = ?auto_44193 ?auto_44198 ) ) ( not ( = ?auto_44192 ?auto_44195 ) ) ( not ( = ?auto_44192 ?auto_44197 ) ) ( not ( = ?auto_44193 ?auto_44195 ) ) ( not ( = ?auto_44193 ?auto_44197 ) ) ( not ( = ?auto_44198 ?auto_44195 ) ) ( not ( = ?auto_44198 ?auto_44197 ) ) ( not ( = ?auto_44195 ?auto_44197 ) ) ( not ( = ?auto_44194 ?auto_44197 ) ) ( not ( = ?auto_44192 ?auto_44194 ) ) ( not ( = ?auto_44193 ?auto_44194 ) ) ( not ( = ?auto_44198 ?auto_44194 ) ) ( not ( = ?auto_44195 ?auto_44194 ) ) ( ON ?auto_44194 ?auto_44196 ) ( not ( = ?auto_44192 ?auto_44196 ) ) ( not ( = ?auto_44193 ?auto_44196 ) ) ( not ( = ?auto_44198 ?auto_44196 ) ) ( not ( = ?auto_44195 ?auto_44196 ) ) ( not ( = ?auto_44197 ?auto_44196 ) ) ( not ( = ?auto_44194 ?auto_44196 ) ) ( ON ?auto_44197 ?auto_44194 ) ( CLEAR ?auto_44197 ) ( ON-TABLE ?auto_44196 ) ( HOLDING ?auto_44195 ) ( CLEAR ?auto_44198 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44192 ?auto_44193 ?auto_44198 ?auto_44195 )
      ( MAKE-2PILE ?auto_44192 ?auto_44193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44199 - BLOCK
      ?auto_44200 - BLOCK
    )
    :vars
    (
      ?auto_44203 - BLOCK
      ?auto_44204 - BLOCK
      ?auto_44202 - BLOCK
      ?auto_44201 - BLOCK
      ?auto_44205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44203 ?auto_44200 ) ( ON-TABLE ?auto_44199 ) ( ON ?auto_44200 ?auto_44199 ) ( not ( = ?auto_44199 ?auto_44200 ) ) ( not ( = ?auto_44199 ?auto_44203 ) ) ( not ( = ?auto_44200 ?auto_44203 ) ) ( not ( = ?auto_44199 ?auto_44204 ) ) ( not ( = ?auto_44199 ?auto_44202 ) ) ( not ( = ?auto_44200 ?auto_44204 ) ) ( not ( = ?auto_44200 ?auto_44202 ) ) ( not ( = ?auto_44203 ?auto_44204 ) ) ( not ( = ?auto_44203 ?auto_44202 ) ) ( not ( = ?auto_44204 ?auto_44202 ) ) ( not ( = ?auto_44201 ?auto_44202 ) ) ( not ( = ?auto_44199 ?auto_44201 ) ) ( not ( = ?auto_44200 ?auto_44201 ) ) ( not ( = ?auto_44203 ?auto_44201 ) ) ( not ( = ?auto_44204 ?auto_44201 ) ) ( ON ?auto_44201 ?auto_44205 ) ( not ( = ?auto_44199 ?auto_44205 ) ) ( not ( = ?auto_44200 ?auto_44205 ) ) ( not ( = ?auto_44203 ?auto_44205 ) ) ( not ( = ?auto_44204 ?auto_44205 ) ) ( not ( = ?auto_44202 ?auto_44205 ) ) ( not ( = ?auto_44201 ?auto_44205 ) ) ( ON ?auto_44202 ?auto_44201 ) ( ON-TABLE ?auto_44205 ) ( CLEAR ?auto_44203 ) ( ON ?auto_44204 ?auto_44202 ) ( CLEAR ?auto_44204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44205 ?auto_44201 ?auto_44202 )
      ( MAKE-2PILE ?auto_44199 ?auto_44200 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44220 - BLOCK
      ?auto_44221 - BLOCK
    )
    :vars
    (
      ?auto_44224 - BLOCK
      ?auto_44226 - BLOCK
      ?auto_44223 - BLOCK
      ?auto_44222 - BLOCK
      ?auto_44225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44220 ) ( not ( = ?auto_44220 ?auto_44221 ) ) ( not ( = ?auto_44220 ?auto_44224 ) ) ( not ( = ?auto_44221 ?auto_44224 ) ) ( not ( = ?auto_44220 ?auto_44226 ) ) ( not ( = ?auto_44220 ?auto_44223 ) ) ( not ( = ?auto_44221 ?auto_44226 ) ) ( not ( = ?auto_44221 ?auto_44223 ) ) ( not ( = ?auto_44224 ?auto_44226 ) ) ( not ( = ?auto_44224 ?auto_44223 ) ) ( not ( = ?auto_44226 ?auto_44223 ) ) ( not ( = ?auto_44222 ?auto_44223 ) ) ( not ( = ?auto_44220 ?auto_44222 ) ) ( not ( = ?auto_44221 ?auto_44222 ) ) ( not ( = ?auto_44224 ?auto_44222 ) ) ( not ( = ?auto_44226 ?auto_44222 ) ) ( ON ?auto_44222 ?auto_44225 ) ( not ( = ?auto_44220 ?auto_44225 ) ) ( not ( = ?auto_44221 ?auto_44225 ) ) ( not ( = ?auto_44224 ?auto_44225 ) ) ( not ( = ?auto_44226 ?auto_44225 ) ) ( not ( = ?auto_44223 ?auto_44225 ) ) ( not ( = ?auto_44222 ?auto_44225 ) ) ( ON ?auto_44223 ?auto_44222 ) ( ON-TABLE ?auto_44225 ) ( ON ?auto_44226 ?auto_44223 ) ( ON ?auto_44224 ?auto_44226 ) ( CLEAR ?auto_44224 ) ( HOLDING ?auto_44221 ) ( CLEAR ?auto_44220 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44220 ?auto_44221 ?auto_44224 )
      ( MAKE-2PILE ?auto_44220 ?auto_44221 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44227 - BLOCK
      ?auto_44228 - BLOCK
    )
    :vars
    (
      ?auto_44231 - BLOCK
      ?auto_44229 - BLOCK
      ?auto_44230 - BLOCK
      ?auto_44232 - BLOCK
      ?auto_44233 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44227 ) ( not ( = ?auto_44227 ?auto_44228 ) ) ( not ( = ?auto_44227 ?auto_44231 ) ) ( not ( = ?auto_44228 ?auto_44231 ) ) ( not ( = ?auto_44227 ?auto_44229 ) ) ( not ( = ?auto_44227 ?auto_44230 ) ) ( not ( = ?auto_44228 ?auto_44229 ) ) ( not ( = ?auto_44228 ?auto_44230 ) ) ( not ( = ?auto_44231 ?auto_44229 ) ) ( not ( = ?auto_44231 ?auto_44230 ) ) ( not ( = ?auto_44229 ?auto_44230 ) ) ( not ( = ?auto_44232 ?auto_44230 ) ) ( not ( = ?auto_44227 ?auto_44232 ) ) ( not ( = ?auto_44228 ?auto_44232 ) ) ( not ( = ?auto_44231 ?auto_44232 ) ) ( not ( = ?auto_44229 ?auto_44232 ) ) ( ON ?auto_44232 ?auto_44233 ) ( not ( = ?auto_44227 ?auto_44233 ) ) ( not ( = ?auto_44228 ?auto_44233 ) ) ( not ( = ?auto_44231 ?auto_44233 ) ) ( not ( = ?auto_44229 ?auto_44233 ) ) ( not ( = ?auto_44230 ?auto_44233 ) ) ( not ( = ?auto_44232 ?auto_44233 ) ) ( ON ?auto_44230 ?auto_44232 ) ( ON-TABLE ?auto_44233 ) ( ON ?auto_44229 ?auto_44230 ) ( ON ?auto_44231 ?auto_44229 ) ( CLEAR ?auto_44227 ) ( ON ?auto_44228 ?auto_44231 ) ( CLEAR ?auto_44228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44233 ?auto_44232 ?auto_44230 ?auto_44229 ?auto_44231 )
      ( MAKE-2PILE ?auto_44227 ?auto_44228 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44234 - BLOCK
      ?auto_44235 - BLOCK
    )
    :vars
    (
      ?auto_44239 - BLOCK
      ?auto_44238 - BLOCK
      ?auto_44240 - BLOCK
      ?auto_44237 - BLOCK
      ?auto_44236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44234 ?auto_44235 ) ) ( not ( = ?auto_44234 ?auto_44239 ) ) ( not ( = ?auto_44235 ?auto_44239 ) ) ( not ( = ?auto_44234 ?auto_44238 ) ) ( not ( = ?auto_44234 ?auto_44240 ) ) ( not ( = ?auto_44235 ?auto_44238 ) ) ( not ( = ?auto_44235 ?auto_44240 ) ) ( not ( = ?auto_44239 ?auto_44238 ) ) ( not ( = ?auto_44239 ?auto_44240 ) ) ( not ( = ?auto_44238 ?auto_44240 ) ) ( not ( = ?auto_44237 ?auto_44240 ) ) ( not ( = ?auto_44234 ?auto_44237 ) ) ( not ( = ?auto_44235 ?auto_44237 ) ) ( not ( = ?auto_44239 ?auto_44237 ) ) ( not ( = ?auto_44238 ?auto_44237 ) ) ( ON ?auto_44237 ?auto_44236 ) ( not ( = ?auto_44234 ?auto_44236 ) ) ( not ( = ?auto_44235 ?auto_44236 ) ) ( not ( = ?auto_44239 ?auto_44236 ) ) ( not ( = ?auto_44238 ?auto_44236 ) ) ( not ( = ?auto_44240 ?auto_44236 ) ) ( not ( = ?auto_44237 ?auto_44236 ) ) ( ON ?auto_44240 ?auto_44237 ) ( ON-TABLE ?auto_44236 ) ( ON ?auto_44238 ?auto_44240 ) ( ON ?auto_44239 ?auto_44238 ) ( ON ?auto_44235 ?auto_44239 ) ( CLEAR ?auto_44235 ) ( HOLDING ?auto_44234 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44234 )
      ( MAKE-2PILE ?auto_44234 ?auto_44235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_44241 - BLOCK
      ?auto_44242 - BLOCK
    )
    :vars
    (
      ?auto_44243 - BLOCK
      ?auto_44245 - BLOCK
      ?auto_44247 - BLOCK
      ?auto_44244 - BLOCK
      ?auto_44246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44241 ?auto_44242 ) ) ( not ( = ?auto_44241 ?auto_44243 ) ) ( not ( = ?auto_44242 ?auto_44243 ) ) ( not ( = ?auto_44241 ?auto_44245 ) ) ( not ( = ?auto_44241 ?auto_44247 ) ) ( not ( = ?auto_44242 ?auto_44245 ) ) ( not ( = ?auto_44242 ?auto_44247 ) ) ( not ( = ?auto_44243 ?auto_44245 ) ) ( not ( = ?auto_44243 ?auto_44247 ) ) ( not ( = ?auto_44245 ?auto_44247 ) ) ( not ( = ?auto_44244 ?auto_44247 ) ) ( not ( = ?auto_44241 ?auto_44244 ) ) ( not ( = ?auto_44242 ?auto_44244 ) ) ( not ( = ?auto_44243 ?auto_44244 ) ) ( not ( = ?auto_44245 ?auto_44244 ) ) ( ON ?auto_44244 ?auto_44246 ) ( not ( = ?auto_44241 ?auto_44246 ) ) ( not ( = ?auto_44242 ?auto_44246 ) ) ( not ( = ?auto_44243 ?auto_44246 ) ) ( not ( = ?auto_44245 ?auto_44246 ) ) ( not ( = ?auto_44247 ?auto_44246 ) ) ( not ( = ?auto_44244 ?auto_44246 ) ) ( ON ?auto_44247 ?auto_44244 ) ( ON-TABLE ?auto_44246 ) ( ON ?auto_44245 ?auto_44247 ) ( ON ?auto_44243 ?auto_44245 ) ( ON ?auto_44242 ?auto_44243 ) ( ON ?auto_44241 ?auto_44242 ) ( CLEAR ?auto_44241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44246 ?auto_44244 ?auto_44247 ?auto_44245 ?auto_44243 ?auto_44242 )
      ( MAKE-2PILE ?auto_44241 ?auto_44242 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44252 - BLOCK
      ?auto_44253 - BLOCK
      ?auto_44254 - BLOCK
      ?auto_44255 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44255 ) ( CLEAR ?auto_44254 ) ( ON-TABLE ?auto_44252 ) ( ON ?auto_44253 ?auto_44252 ) ( ON ?auto_44254 ?auto_44253 ) ( not ( = ?auto_44252 ?auto_44253 ) ) ( not ( = ?auto_44252 ?auto_44254 ) ) ( not ( = ?auto_44252 ?auto_44255 ) ) ( not ( = ?auto_44253 ?auto_44254 ) ) ( not ( = ?auto_44253 ?auto_44255 ) ) ( not ( = ?auto_44254 ?auto_44255 ) ) )
    :subtasks
    ( ( !STACK ?auto_44255 ?auto_44254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44256 - BLOCK
      ?auto_44257 - BLOCK
      ?auto_44258 - BLOCK
      ?auto_44259 - BLOCK
    )
    :vars
    (
      ?auto_44260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44258 ) ( ON-TABLE ?auto_44256 ) ( ON ?auto_44257 ?auto_44256 ) ( ON ?auto_44258 ?auto_44257 ) ( not ( = ?auto_44256 ?auto_44257 ) ) ( not ( = ?auto_44256 ?auto_44258 ) ) ( not ( = ?auto_44256 ?auto_44259 ) ) ( not ( = ?auto_44257 ?auto_44258 ) ) ( not ( = ?auto_44257 ?auto_44259 ) ) ( not ( = ?auto_44258 ?auto_44259 ) ) ( ON ?auto_44259 ?auto_44260 ) ( CLEAR ?auto_44259 ) ( HAND-EMPTY ) ( not ( = ?auto_44256 ?auto_44260 ) ) ( not ( = ?auto_44257 ?auto_44260 ) ) ( not ( = ?auto_44258 ?auto_44260 ) ) ( not ( = ?auto_44259 ?auto_44260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44259 ?auto_44260 )
      ( MAKE-4PILE ?auto_44256 ?auto_44257 ?auto_44258 ?auto_44259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44261 - BLOCK
      ?auto_44262 - BLOCK
      ?auto_44263 - BLOCK
      ?auto_44264 - BLOCK
    )
    :vars
    (
      ?auto_44265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44261 ) ( ON ?auto_44262 ?auto_44261 ) ( not ( = ?auto_44261 ?auto_44262 ) ) ( not ( = ?auto_44261 ?auto_44263 ) ) ( not ( = ?auto_44261 ?auto_44264 ) ) ( not ( = ?auto_44262 ?auto_44263 ) ) ( not ( = ?auto_44262 ?auto_44264 ) ) ( not ( = ?auto_44263 ?auto_44264 ) ) ( ON ?auto_44264 ?auto_44265 ) ( CLEAR ?auto_44264 ) ( not ( = ?auto_44261 ?auto_44265 ) ) ( not ( = ?auto_44262 ?auto_44265 ) ) ( not ( = ?auto_44263 ?auto_44265 ) ) ( not ( = ?auto_44264 ?auto_44265 ) ) ( HOLDING ?auto_44263 ) ( CLEAR ?auto_44262 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44261 ?auto_44262 ?auto_44263 )
      ( MAKE-4PILE ?auto_44261 ?auto_44262 ?auto_44263 ?auto_44264 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44266 - BLOCK
      ?auto_44267 - BLOCK
      ?auto_44268 - BLOCK
      ?auto_44269 - BLOCK
    )
    :vars
    (
      ?auto_44270 - BLOCK
      ?auto_44271 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44266 ) ( ON ?auto_44267 ?auto_44266 ) ( not ( = ?auto_44266 ?auto_44267 ) ) ( not ( = ?auto_44266 ?auto_44268 ) ) ( not ( = ?auto_44266 ?auto_44269 ) ) ( not ( = ?auto_44267 ?auto_44268 ) ) ( not ( = ?auto_44267 ?auto_44269 ) ) ( not ( = ?auto_44268 ?auto_44269 ) ) ( ON ?auto_44269 ?auto_44270 ) ( not ( = ?auto_44266 ?auto_44270 ) ) ( not ( = ?auto_44267 ?auto_44270 ) ) ( not ( = ?auto_44268 ?auto_44270 ) ) ( not ( = ?auto_44269 ?auto_44270 ) ) ( CLEAR ?auto_44267 ) ( ON ?auto_44268 ?auto_44269 ) ( CLEAR ?auto_44268 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44271 ) ( ON ?auto_44270 ?auto_44271 ) ( not ( = ?auto_44271 ?auto_44270 ) ) ( not ( = ?auto_44271 ?auto_44269 ) ) ( not ( = ?auto_44271 ?auto_44268 ) ) ( not ( = ?auto_44266 ?auto_44271 ) ) ( not ( = ?auto_44267 ?auto_44271 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44271 ?auto_44270 ?auto_44269 )
      ( MAKE-4PILE ?auto_44266 ?auto_44267 ?auto_44268 ?auto_44269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44272 - BLOCK
      ?auto_44273 - BLOCK
      ?auto_44274 - BLOCK
      ?auto_44275 - BLOCK
    )
    :vars
    (
      ?auto_44276 - BLOCK
      ?auto_44277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44272 ) ( not ( = ?auto_44272 ?auto_44273 ) ) ( not ( = ?auto_44272 ?auto_44274 ) ) ( not ( = ?auto_44272 ?auto_44275 ) ) ( not ( = ?auto_44273 ?auto_44274 ) ) ( not ( = ?auto_44273 ?auto_44275 ) ) ( not ( = ?auto_44274 ?auto_44275 ) ) ( ON ?auto_44275 ?auto_44276 ) ( not ( = ?auto_44272 ?auto_44276 ) ) ( not ( = ?auto_44273 ?auto_44276 ) ) ( not ( = ?auto_44274 ?auto_44276 ) ) ( not ( = ?auto_44275 ?auto_44276 ) ) ( ON ?auto_44274 ?auto_44275 ) ( CLEAR ?auto_44274 ) ( ON-TABLE ?auto_44277 ) ( ON ?auto_44276 ?auto_44277 ) ( not ( = ?auto_44277 ?auto_44276 ) ) ( not ( = ?auto_44277 ?auto_44275 ) ) ( not ( = ?auto_44277 ?auto_44274 ) ) ( not ( = ?auto_44272 ?auto_44277 ) ) ( not ( = ?auto_44273 ?auto_44277 ) ) ( HOLDING ?auto_44273 ) ( CLEAR ?auto_44272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44272 ?auto_44273 )
      ( MAKE-4PILE ?auto_44272 ?auto_44273 ?auto_44274 ?auto_44275 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44278 - BLOCK
      ?auto_44279 - BLOCK
      ?auto_44280 - BLOCK
      ?auto_44281 - BLOCK
    )
    :vars
    (
      ?auto_44283 - BLOCK
      ?auto_44282 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44278 ) ( not ( = ?auto_44278 ?auto_44279 ) ) ( not ( = ?auto_44278 ?auto_44280 ) ) ( not ( = ?auto_44278 ?auto_44281 ) ) ( not ( = ?auto_44279 ?auto_44280 ) ) ( not ( = ?auto_44279 ?auto_44281 ) ) ( not ( = ?auto_44280 ?auto_44281 ) ) ( ON ?auto_44281 ?auto_44283 ) ( not ( = ?auto_44278 ?auto_44283 ) ) ( not ( = ?auto_44279 ?auto_44283 ) ) ( not ( = ?auto_44280 ?auto_44283 ) ) ( not ( = ?auto_44281 ?auto_44283 ) ) ( ON ?auto_44280 ?auto_44281 ) ( ON-TABLE ?auto_44282 ) ( ON ?auto_44283 ?auto_44282 ) ( not ( = ?auto_44282 ?auto_44283 ) ) ( not ( = ?auto_44282 ?auto_44281 ) ) ( not ( = ?auto_44282 ?auto_44280 ) ) ( not ( = ?auto_44278 ?auto_44282 ) ) ( not ( = ?auto_44279 ?auto_44282 ) ) ( CLEAR ?auto_44278 ) ( ON ?auto_44279 ?auto_44280 ) ( CLEAR ?auto_44279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44282 ?auto_44283 ?auto_44281 ?auto_44280 )
      ( MAKE-4PILE ?auto_44278 ?auto_44279 ?auto_44280 ?auto_44281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44284 - BLOCK
      ?auto_44285 - BLOCK
      ?auto_44286 - BLOCK
      ?auto_44287 - BLOCK
    )
    :vars
    (
      ?auto_44289 - BLOCK
      ?auto_44288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44284 ?auto_44285 ) ) ( not ( = ?auto_44284 ?auto_44286 ) ) ( not ( = ?auto_44284 ?auto_44287 ) ) ( not ( = ?auto_44285 ?auto_44286 ) ) ( not ( = ?auto_44285 ?auto_44287 ) ) ( not ( = ?auto_44286 ?auto_44287 ) ) ( ON ?auto_44287 ?auto_44289 ) ( not ( = ?auto_44284 ?auto_44289 ) ) ( not ( = ?auto_44285 ?auto_44289 ) ) ( not ( = ?auto_44286 ?auto_44289 ) ) ( not ( = ?auto_44287 ?auto_44289 ) ) ( ON ?auto_44286 ?auto_44287 ) ( ON-TABLE ?auto_44288 ) ( ON ?auto_44289 ?auto_44288 ) ( not ( = ?auto_44288 ?auto_44289 ) ) ( not ( = ?auto_44288 ?auto_44287 ) ) ( not ( = ?auto_44288 ?auto_44286 ) ) ( not ( = ?auto_44284 ?auto_44288 ) ) ( not ( = ?auto_44285 ?auto_44288 ) ) ( ON ?auto_44285 ?auto_44286 ) ( CLEAR ?auto_44285 ) ( HOLDING ?auto_44284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44284 )
      ( MAKE-4PILE ?auto_44284 ?auto_44285 ?auto_44286 ?auto_44287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44290 - BLOCK
      ?auto_44291 - BLOCK
      ?auto_44292 - BLOCK
      ?auto_44293 - BLOCK
    )
    :vars
    (
      ?auto_44295 - BLOCK
      ?auto_44294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44290 ?auto_44291 ) ) ( not ( = ?auto_44290 ?auto_44292 ) ) ( not ( = ?auto_44290 ?auto_44293 ) ) ( not ( = ?auto_44291 ?auto_44292 ) ) ( not ( = ?auto_44291 ?auto_44293 ) ) ( not ( = ?auto_44292 ?auto_44293 ) ) ( ON ?auto_44293 ?auto_44295 ) ( not ( = ?auto_44290 ?auto_44295 ) ) ( not ( = ?auto_44291 ?auto_44295 ) ) ( not ( = ?auto_44292 ?auto_44295 ) ) ( not ( = ?auto_44293 ?auto_44295 ) ) ( ON ?auto_44292 ?auto_44293 ) ( ON-TABLE ?auto_44294 ) ( ON ?auto_44295 ?auto_44294 ) ( not ( = ?auto_44294 ?auto_44295 ) ) ( not ( = ?auto_44294 ?auto_44293 ) ) ( not ( = ?auto_44294 ?auto_44292 ) ) ( not ( = ?auto_44290 ?auto_44294 ) ) ( not ( = ?auto_44291 ?auto_44294 ) ) ( ON ?auto_44291 ?auto_44292 ) ( ON ?auto_44290 ?auto_44291 ) ( CLEAR ?auto_44290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44294 ?auto_44295 ?auto_44293 ?auto_44292 ?auto_44291 )
      ( MAKE-4PILE ?auto_44290 ?auto_44291 ?auto_44292 ?auto_44293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44296 - BLOCK
      ?auto_44297 - BLOCK
      ?auto_44298 - BLOCK
      ?auto_44299 - BLOCK
    )
    :vars
    (
      ?auto_44300 - BLOCK
      ?auto_44301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44296 ?auto_44297 ) ) ( not ( = ?auto_44296 ?auto_44298 ) ) ( not ( = ?auto_44296 ?auto_44299 ) ) ( not ( = ?auto_44297 ?auto_44298 ) ) ( not ( = ?auto_44297 ?auto_44299 ) ) ( not ( = ?auto_44298 ?auto_44299 ) ) ( ON ?auto_44299 ?auto_44300 ) ( not ( = ?auto_44296 ?auto_44300 ) ) ( not ( = ?auto_44297 ?auto_44300 ) ) ( not ( = ?auto_44298 ?auto_44300 ) ) ( not ( = ?auto_44299 ?auto_44300 ) ) ( ON ?auto_44298 ?auto_44299 ) ( ON-TABLE ?auto_44301 ) ( ON ?auto_44300 ?auto_44301 ) ( not ( = ?auto_44301 ?auto_44300 ) ) ( not ( = ?auto_44301 ?auto_44299 ) ) ( not ( = ?auto_44301 ?auto_44298 ) ) ( not ( = ?auto_44296 ?auto_44301 ) ) ( not ( = ?auto_44297 ?auto_44301 ) ) ( ON ?auto_44297 ?auto_44298 ) ( HOLDING ?auto_44296 ) ( CLEAR ?auto_44297 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44301 ?auto_44300 ?auto_44299 ?auto_44298 ?auto_44297 ?auto_44296 )
      ( MAKE-4PILE ?auto_44296 ?auto_44297 ?auto_44298 ?auto_44299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44302 - BLOCK
      ?auto_44303 - BLOCK
      ?auto_44304 - BLOCK
      ?auto_44305 - BLOCK
    )
    :vars
    (
      ?auto_44307 - BLOCK
      ?auto_44306 - BLOCK
      ?auto_44308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44302 ?auto_44303 ) ) ( not ( = ?auto_44302 ?auto_44304 ) ) ( not ( = ?auto_44302 ?auto_44305 ) ) ( not ( = ?auto_44303 ?auto_44304 ) ) ( not ( = ?auto_44303 ?auto_44305 ) ) ( not ( = ?auto_44304 ?auto_44305 ) ) ( ON ?auto_44305 ?auto_44307 ) ( not ( = ?auto_44302 ?auto_44307 ) ) ( not ( = ?auto_44303 ?auto_44307 ) ) ( not ( = ?auto_44304 ?auto_44307 ) ) ( not ( = ?auto_44305 ?auto_44307 ) ) ( ON ?auto_44304 ?auto_44305 ) ( ON-TABLE ?auto_44306 ) ( ON ?auto_44307 ?auto_44306 ) ( not ( = ?auto_44306 ?auto_44307 ) ) ( not ( = ?auto_44306 ?auto_44305 ) ) ( not ( = ?auto_44306 ?auto_44304 ) ) ( not ( = ?auto_44302 ?auto_44306 ) ) ( not ( = ?auto_44303 ?auto_44306 ) ) ( ON ?auto_44303 ?auto_44304 ) ( CLEAR ?auto_44303 ) ( ON ?auto_44302 ?auto_44308 ) ( CLEAR ?auto_44302 ) ( HAND-EMPTY ) ( not ( = ?auto_44302 ?auto_44308 ) ) ( not ( = ?auto_44303 ?auto_44308 ) ) ( not ( = ?auto_44304 ?auto_44308 ) ) ( not ( = ?auto_44305 ?auto_44308 ) ) ( not ( = ?auto_44307 ?auto_44308 ) ) ( not ( = ?auto_44306 ?auto_44308 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44302 ?auto_44308 )
      ( MAKE-4PILE ?auto_44302 ?auto_44303 ?auto_44304 ?auto_44305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44309 - BLOCK
      ?auto_44310 - BLOCK
      ?auto_44311 - BLOCK
      ?auto_44312 - BLOCK
    )
    :vars
    (
      ?auto_44315 - BLOCK
      ?auto_44314 - BLOCK
      ?auto_44313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44309 ?auto_44310 ) ) ( not ( = ?auto_44309 ?auto_44311 ) ) ( not ( = ?auto_44309 ?auto_44312 ) ) ( not ( = ?auto_44310 ?auto_44311 ) ) ( not ( = ?auto_44310 ?auto_44312 ) ) ( not ( = ?auto_44311 ?auto_44312 ) ) ( ON ?auto_44312 ?auto_44315 ) ( not ( = ?auto_44309 ?auto_44315 ) ) ( not ( = ?auto_44310 ?auto_44315 ) ) ( not ( = ?auto_44311 ?auto_44315 ) ) ( not ( = ?auto_44312 ?auto_44315 ) ) ( ON ?auto_44311 ?auto_44312 ) ( ON-TABLE ?auto_44314 ) ( ON ?auto_44315 ?auto_44314 ) ( not ( = ?auto_44314 ?auto_44315 ) ) ( not ( = ?auto_44314 ?auto_44312 ) ) ( not ( = ?auto_44314 ?auto_44311 ) ) ( not ( = ?auto_44309 ?auto_44314 ) ) ( not ( = ?auto_44310 ?auto_44314 ) ) ( ON ?auto_44309 ?auto_44313 ) ( CLEAR ?auto_44309 ) ( not ( = ?auto_44309 ?auto_44313 ) ) ( not ( = ?auto_44310 ?auto_44313 ) ) ( not ( = ?auto_44311 ?auto_44313 ) ) ( not ( = ?auto_44312 ?auto_44313 ) ) ( not ( = ?auto_44315 ?auto_44313 ) ) ( not ( = ?auto_44314 ?auto_44313 ) ) ( HOLDING ?auto_44310 ) ( CLEAR ?auto_44311 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44314 ?auto_44315 ?auto_44312 ?auto_44311 ?auto_44310 )
      ( MAKE-4PILE ?auto_44309 ?auto_44310 ?auto_44311 ?auto_44312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44316 - BLOCK
      ?auto_44317 - BLOCK
      ?auto_44318 - BLOCK
      ?auto_44319 - BLOCK
    )
    :vars
    (
      ?auto_44321 - BLOCK
      ?auto_44320 - BLOCK
      ?auto_44322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44316 ?auto_44317 ) ) ( not ( = ?auto_44316 ?auto_44318 ) ) ( not ( = ?auto_44316 ?auto_44319 ) ) ( not ( = ?auto_44317 ?auto_44318 ) ) ( not ( = ?auto_44317 ?auto_44319 ) ) ( not ( = ?auto_44318 ?auto_44319 ) ) ( ON ?auto_44319 ?auto_44321 ) ( not ( = ?auto_44316 ?auto_44321 ) ) ( not ( = ?auto_44317 ?auto_44321 ) ) ( not ( = ?auto_44318 ?auto_44321 ) ) ( not ( = ?auto_44319 ?auto_44321 ) ) ( ON ?auto_44318 ?auto_44319 ) ( ON-TABLE ?auto_44320 ) ( ON ?auto_44321 ?auto_44320 ) ( not ( = ?auto_44320 ?auto_44321 ) ) ( not ( = ?auto_44320 ?auto_44319 ) ) ( not ( = ?auto_44320 ?auto_44318 ) ) ( not ( = ?auto_44316 ?auto_44320 ) ) ( not ( = ?auto_44317 ?auto_44320 ) ) ( ON ?auto_44316 ?auto_44322 ) ( not ( = ?auto_44316 ?auto_44322 ) ) ( not ( = ?auto_44317 ?auto_44322 ) ) ( not ( = ?auto_44318 ?auto_44322 ) ) ( not ( = ?auto_44319 ?auto_44322 ) ) ( not ( = ?auto_44321 ?auto_44322 ) ) ( not ( = ?auto_44320 ?auto_44322 ) ) ( CLEAR ?auto_44318 ) ( ON ?auto_44317 ?auto_44316 ) ( CLEAR ?auto_44317 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44322 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44322 ?auto_44316 )
      ( MAKE-4PILE ?auto_44316 ?auto_44317 ?auto_44318 ?auto_44319 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44323 - BLOCK
      ?auto_44324 - BLOCK
      ?auto_44325 - BLOCK
      ?auto_44326 - BLOCK
    )
    :vars
    (
      ?auto_44327 - BLOCK
      ?auto_44328 - BLOCK
      ?auto_44329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44323 ?auto_44324 ) ) ( not ( = ?auto_44323 ?auto_44325 ) ) ( not ( = ?auto_44323 ?auto_44326 ) ) ( not ( = ?auto_44324 ?auto_44325 ) ) ( not ( = ?auto_44324 ?auto_44326 ) ) ( not ( = ?auto_44325 ?auto_44326 ) ) ( ON ?auto_44326 ?auto_44327 ) ( not ( = ?auto_44323 ?auto_44327 ) ) ( not ( = ?auto_44324 ?auto_44327 ) ) ( not ( = ?auto_44325 ?auto_44327 ) ) ( not ( = ?auto_44326 ?auto_44327 ) ) ( ON-TABLE ?auto_44328 ) ( ON ?auto_44327 ?auto_44328 ) ( not ( = ?auto_44328 ?auto_44327 ) ) ( not ( = ?auto_44328 ?auto_44326 ) ) ( not ( = ?auto_44328 ?auto_44325 ) ) ( not ( = ?auto_44323 ?auto_44328 ) ) ( not ( = ?auto_44324 ?auto_44328 ) ) ( ON ?auto_44323 ?auto_44329 ) ( not ( = ?auto_44323 ?auto_44329 ) ) ( not ( = ?auto_44324 ?auto_44329 ) ) ( not ( = ?auto_44325 ?auto_44329 ) ) ( not ( = ?auto_44326 ?auto_44329 ) ) ( not ( = ?auto_44327 ?auto_44329 ) ) ( not ( = ?auto_44328 ?auto_44329 ) ) ( ON ?auto_44324 ?auto_44323 ) ( CLEAR ?auto_44324 ) ( ON-TABLE ?auto_44329 ) ( HOLDING ?auto_44325 ) ( CLEAR ?auto_44326 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44328 ?auto_44327 ?auto_44326 ?auto_44325 )
      ( MAKE-4PILE ?auto_44323 ?auto_44324 ?auto_44325 ?auto_44326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44330 - BLOCK
      ?auto_44331 - BLOCK
      ?auto_44332 - BLOCK
      ?auto_44333 - BLOCK
    )
    :vars
    (
      ?auto_44335 - BLOCK
      ?auto_44336 - BLOCK
      ?auto_44334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44330 ?auto_44331 ) ) ( not ( = ?auto_44330 ?auto_44332 ) ) ( not ( = ?auto_44330 ?auto_44333 ) ) ( not ( = ?auto_44331 ?auto_44332 ) ) ( not ( = ?auto_44331 ?auto_44333 ) ) ( not ( = ?auto_44332 ?auto_44333 ) ) ( ON ?auto_44333 ?auto_44335 ) ( not ( = ?auto_44330 ?auto_44335 ) ) ( not ( = ?auto_44331 ?auto_44335 ) ) ( not ( = ?auto_44332 ?auto_44335 ) ) ( not ( = ?auto_44333 ?auto_44335 ) ) ( ON-TABLE ?auto_44336 ) ( ON ?auto_44335 ?auto_44336 ) ( not ( = ?auto_44336 ?auto_44335 ) ) ( not ( = ?auto_44336 ?auto_44333 ) ) ( not ( = ?auto_44336 ?auto_44332 ) ) ( not ( = ?auto_44330 ?auto_44336 ) ) ( not ( = ?auto_44331 ?auto_44336 ) ) ( ON ?auto_44330 ?auto_44334 ) ( not ( = ?auto_44330 ?auto_44334 ) ) ( not ( = ?auto_44331 ?auto_44334 ) ) ( not ( = ?auto_44332 ?auto_44334 ) ) ( not ( = ?auto_44333 ?auto_44334 ) ) ( not ( = ?auto_44335 ?auto_44334 ) ) ( not ( = ?auto_44336 ?auto_44334 ) ) ( ON ?auto_44331 ?auto_44330 ) ( ON-TABLE ?auto_44334 ) ( CLEAR ?auto_44333 ) ( ON ?auto_44332 ?auto_44331 ) ( CLEAR ?auto_44332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44334 ?auto_44330 ?auto_44331 )
      ( MAKE-4PILE ?auto_44330 ?auto_44331 ?auto_44332 ?auto_44333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44337 - BLOCK
      ?auto_44338 - BLOCK
      ?auto_44339 - BLOCK
      ?auto_44340 - BLOCK
    )
    :vars
    (
      ?auto_44341 - BLOCK
      ?auto_44342 - BLOCK
      ?auto_44343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44337 ?auto_44338 ) ) ( not ( = ?auto_44337 ?auto_44339 ) ) ( not ( = ?auto_44337 ?auto_44340 ) ) ( not ( = ?auto_44338 ?auto_44339 ) ) ( not ( = ?auto_44338 ?auto_44340 ) ) ( not ( = ?auto_44339 ?auto_44340 ) ) ( not ( = ?auto_44337 ?auto_44341 ) ) ( not ( = ?auto_44338 ?auto_44341 ) ) ( not ( = ?auto_44339 ?auto_44341 ) ) ( not ( = ?auto_44340 ?auto_44341 ) ) ( ON-TABLE ?auto_44342 ) ( ON ?auto_44341 ?auto_44342 ) ( not ( = ?auto_44342 ?auto_44341 ) ) ( not ( = ?auto_44342 ?auto_44340 ) ) ( not ( = ?auto_44342 ?auto_44339 ) ) ( not ( = ?auto_44337 ?auto_44342 ) ) ( not ( = ?auto_44338 ?auto_44342 ) ) ( ON ?auto_44337 ?auto_44343 ) ( not ( = ?auto_44337 ?auto_44343 ) ) ( not ( = ?auto_44338 ?auto_44343 ) ) ( not ( = ?auto_44339 ?auto_44343 ) ) ( not ( = ?auto_44340 ?auto_44343 ) ) ( not ( = ?auto_44341 ?auto_44343 ) ) ( not ( = ?auto_44342 ?auto_44343 ) ) ( ON ?auto_44338 ?auto_44337 ) ( ON-TABLE ?auto_44343 ) ( ON ?auto_44339 ?auto_44338 ) ( CLEAR ?auto_44339 ) ( HOLDING ?auto_44340 ) ( CLEAR ?auto_44341 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44342 ?auto_44341 ?auto_44340 )
      ( MAKE-4PILE ?auto_44337 ?auto_44338 ?auto_44339 ?auto_44340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44344 - BLOCK
      ?auto_44345 - BLOCK
      ?auto_44346 - BLOCK
      ?auto_44347 - BLOCK
    )
    :vars
    (
      ?auto_44349 - BLOCK
      ?auto_44348 - BLOCK
      ?auto_44350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44344 ?auto_44345 ) ) ( not ( = ?auto_44344 ?auto_44346 ) ) ( not ( = ?auto_44344 ?auto_44347 ) ) ( not ( = ?auto_44345 ?auto_44346 ) ) ( not ( = ?auto_44345 ?auto_44347 ) ) ( not ( = ?auto_44346 ?auto_44347 ) ) ( not ( = ?auto_44344 ?auto_44349 ) ) ( not ( = ?auto_44345 ?auto_44349 ) ) ( not ( = ?auto_44346 ?auto_44349 ) ) ( not ( = ?auto_44347 ?auto_44349 ) ) ( ON-TABLE ?auto_44348 ) ( ON ?auto_44349 ?auto_44348 ) ( not ( = ?auto_44348 ?auto_44349 ) ) ( not ( = ?auto_44348 ?auto_44347 ) ) ( not ( = ?auto_44348 ?auto_44346 ) ) ( not ( = ?auto_44344 ?auto_44348 ) ) ( not ( = ?auto_44345 ?auto_44348 ) ) ( ON ?auto_44344 ?auto_44350 ) ( not ( = ?auto_44344 ?auto_44350 ) ) ( not ( = ?auto_44345 ?auto_44350 ) ) ( not ( = ?auto_44346 ?auto_44350 ) ) ( not ( = ?auto_44347 ?auto_44350 ) ) ( not ( = ?auto_44349 ?auto_44350 ) ) ( not ( = ?auto_44348 ?auto_44350 ) ) ( ON ?auto_44345 ?auto_44344 ) ( ON-TABLE ?auto_44350 ) ( ON ?auto_44346 ?auto_44345 ) ( CLEAR ?auto_44349 ) ( ON ?auto_44347 ?auto_44346 ) ( CLEAR ?auto_44347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44350 ?auto_44344 ?auto_44345 ?auto_44346 )
      ( MAKE-4PILE ?auto_44344 ?auto_44345 ?auto_44346 ?auto_44347 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44351 - BLOCK
      ?auto_44352 - BLOCK
      ?auto_44353 - BLOCK
      ?auto_44354 - BLOCK
    )
    :vars
    (
      ?auto_44355 - BLOCK
      ?auto_44357 - BLOCK
      ?auto_44356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44351 ?auto_44352 ) ) ( not ( = ?auto_44351 ?auto_44353 ) ) ( not ( = ?auto_44351 ?auto_44354 ) ) ( not ( = ?auto_44352 ?auto_44353 ) ) ( not ( = ?auto_44352 ?auto_44354 ) ) ( not ( = ?auto_44353 ?auto_44354 ) ) ( not ( = ?auto_44351 ?auto_44355 ) ) ( not ( = ?auto_44352 ?auto_44355 ) ) ( not ( = ?auto_44353 ?auto_44355 ) ) ( not ( = ?auto_44354 ?auto_44355 ) ) ( ON-TABLE ?auto_44357 ) ( not ( = ?auto_44357 ?auto_44355 ) ) ( not ( = ?auto_44357 ?auto_44354 ) ) ( not ( = ?auto_44357 ?auto_44353 ) ) ( not ( = ?auto_44351 ?auto_44357 ) ) ( not ( = ?auto_44352 ?auto_44357 ) ) ( ON ?auto_44351 ?auto_44356 ) ( not ( = ?auto_44351 ?auto_44356 ) ) ( not ( = ?auto_44352 ?auto_44356 ) ) ( not ( = ?auto_44353 ?auto_44356 ) ) ( not ( = ?auto_44354 ?auto_44356 ) ) ( not ( = ?auto_44355 ?auto_44356 ) ) ( not ( = ?auto_44357 ?auto_44356 ) ) ( ON ?auto_44352 ?auto_44351 ) ( ON-TABLE ?auto_44356 ) ( ON ?auto_44353 ?auto_44352 ) ( ON ?auto_44354 ?auto_44353 ) ( CLEAR ?auto_44354 ) ( HOLDING ?auto_44355 ) ( CLEAR ?auto_44357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44357 ?auto_44355 )
      ( MAKE-4PILE ?auto_44351 ?auto_44352 ?auto_44353 ?auto_44354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44358 - BLOCK
      ?auto_44359 - BLOCK
      ?auto_44360 - BLOCK
      ?auto_44361 - BLOCK
    )
    :vars
    (
      ?auto_44363 - BLOCK
      ?auto_44364 - BLOCK
      ?auto_44362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44358 ?auto_44359 ) ) ( not ( = ?auto_44358 ?auto_44360 ) ) ( not ( = ?auto_44358 ?auto_44361 ) ) ( not ( = ?auto_44359 ?auto_44360 ) ) ( not ( = ?auto_44359 ?auto_44361 ) ) ( not ( = ?auto_44360 ?auto_44361 ) ) ( not ( = ?auto_44358 ?auto_44363 ) ) ( not ( = ?auto_44359 ?auto_44363 ) ) ( not ( = ?auto_44360 ?auto_44363 ) ) ( not ( = ?auto_44361 ?auto_44363 ) ) ( ON-TABLE ?auto_44364 ) ( not ( = ?auto_44364 ?auto_44363 ) ) ( not ( = ?auto_44364 ?auto_44361 ) ) ( not ( = ?auto_44364 ?auto_44360 ) ) ( not ( = ?auto_44358 ?auto_44364 ) ) ( not ( = ?auto_44359 ?auto_44364 ) ) ( ON ?auto_44358 ?auto_44362 ) ( not ( = ?auto_44358 ?auto_44362 ) ) ( not ( = ?auto_44359 ?auto_44362 ) ) ( not ( = ?auto_44360 ?auto_44362 ) ) ( not ( = ?auto_44361 ?auto_44362 ) ) ( not ( = ?auto_44363 ?auto_44362 ) ) ( not ( = ?auto_44364 ?auto_44362 ) ) ( ON ?auto_44359 ?auto_44358 ) ( ON-TABLE ?auto_44362 ) ( ON ?auto_44360 ?auto_44359 ) ( ON ?auto_44361 ?auto_44360 ) ( CLEAR ?auto_44364 ) ( ON ?auto_44363 ?auto_44361 ) ( CLEAR ?auto_44363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44362 ?auto_44358 ?auto_44359 ?auto_44360 ?auto_44361 )
      ( MAKE-4PILE ?auto_44358 ?auto_44359 ?auto_44360 ?auto_44361 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44365 - BLOCK
      ?auto_44366 - BLOCK
      ?auto_44367 - BLOCK
      ?auto_44368 - BLOCK
    )
    :vars
    (
      ?auto_44371 - BLOCK
      ?auto_44370 - BLOCK
      ?auto_44369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44365 ?auto_44366 ) ) ( not ( = ?auto_44365 ?auto_44367 ) ) ( not ( = ?auto_44365 ?auto_44368 ) ) ( not ( = ?auto_44366 ?auto_44367 ) ) ( not ( = ?auto_44366 ?auto_44368 ) ) ( not ( = ?auto_44367 ?auto_44368 ) ) ( not ( = ?auto_44365 ?auto_44371 ) ) ( not ( = ?auto_44366 ?auto_44371 ) ) ( not ( = ?auto_44367 ?auto_44371 ) ) ( not ( = ?auto_44368 ?auto_44371 ) ) ( not ( = ?auto_44370 ?auto_44371 ) ) ( not ( = ?auto_44370 ?auto_44368 ) ) ( not ( = ?auto_44370 ?auto_44367 ) ) ( not ( = ?auto_44365 ?auto_44370 ) ) ( not ( = ?auto_44366 ?auto_44370 ) ) ( ON ?auto_44365 ?auto_44369 ) ( not ( = ?auto_44365 ?auto_44369 ) ) ( not ( = ?auto_44366 ?auto_44369 ) ) ( not ( = ?auto_44367 ?auto_44369 ) ) ( not ( = ?auto_44368 ?auto_44369 ) ) ( not ( = ?auto_44371 ?auto_44369 ) ) ( not ( = ?auto_44370 ?auto_44369 ) ) ( ON ?auto_44366 ?auto_44365 ) ( ON-TABLE ?auto_44369 ) ( ON ?auto_44367 ?auto_44366 ) ( ON ?auto_44368 ?auto_44367 ) ( ON ?auto_44371 ?auto_44368 ) ( CLEAR ?auto_44371 ) ( HOLDING ?auto_44370 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44370 )
      ( MAKE-4PILE ?auto_44365 ?auto_44366 ?auto_44367 ?auto_44368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_44372 - BLOCK
      ?auto_44373 - BLOCK
      ?auto_44374 - BLOCK
      ?auto_44375 - BLOCK
    )
    :vars
    (
      ?auto_44376 - BLOCK
      ?auto_44378 - BLOCK
      ?auto_44377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44372 ?auto_44373 ) ) ( not ( = ?auto_44372 ?auto_44374 ) ) ( not ( = ?auto_44372 ?auto_44375 ) ) ( not ( = ?auto_44373 ?auto_44374 ) ) ( not ( = ?auto_44373 ?auto_44375 ) ) ( not ( = ?auto_44374 ?auto_44375 ) ) ( not ( = ?auto_44372 ?auto_44376 ) ) ( not ( = ?auto_44373 ?auto_44376 ) ) ( not ( = ?auto_44374 ?auto_44376 ) ) ( not ( = ?auto_44375 ?auto_44376 ) ) ( not ( = ?auto_44378 ?auto_44376 ) ) ( not ( = ?auto_44378 ?auto_44375 ) ) ( not ( = ?auto_44378 ?auto_44374 ) ) ( not ( = ?auto_44372 ?auto_44378 ) ) ( not ( = ?auto_44373 ?auto_44378 ) ) ( ON ?auto_44372 ?auto_44377 ) ( not ( = ?auto_44372 ?auto_44377 ) ) ( not ( = ?auto_44373 ?auto_44377 ) ) ( not ( = ?auto_44374 ?auto_44377 ) ) ( not ( = ?auto_44375 ?auto_44377 ) ) ( not ( = ?auto_44376 ?auto_44377 ) ) ( not ( = ?auto_44378 ?auto_44377 ) ) ( ON ?auto_44373 ?auto_44372 ) ( ON-TABLE ?auto_44377 ) ( ON ?auto_44374 ?auto_44373 ) ( ON ?auto_44375 ?auto_44374 ) ( ON ?auto_44376 ?auto_44375 ) ( ON ?auto_44378 ?auto_44376 ) ( CLEAR ?auto_44378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44377 ?auto_44372 ?auto_44373 ?auto_44374 ?auto_44375 ?auto_44376 )
      ( MAKE-4PILE ?auto_44372 ?auto_44373 ?auto_44374 ?auto_44375 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44380 - BLOCK
    )
    :vars
    (
      ?auto_44381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44381 ?auto_44380 ) ( CLEAR ?auto_44381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44380 ) ( not ( = ?auto_44380 ?auto_44381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44381 ?auto_44380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44382 - BLOCK
    )
    :vars
    (
      ?auto_44383 - BLOCK
      ?auto_44384 - BLOCK
      ?auto_44385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44383 ?auto_44382 ) ( CLEAR ?auto_44383 ) ( ON-TABLE ?auto_44382 ) ( not ( = ?auto_44382 ?auto_44383 ) ) ( HOLDING ?auto_44384 ) ( CLEAR ?auto_44385 ) ( not ( = ?auto_44382 ?auto_44384 ) ) ( not ( = ?auto_44382 ?auto_44385 ) ) ( not ( = ?auto_44383 ?auto_44384 ) ) ( not ( = ?auto_44383 ?auto_44385 ) ) ( not ( = ?auto_44384 ?auto_44385 ) ) )
    :subtasks
    ( ( !STACK ?auto_44384 ?auto_44385 )
      ( MAKE-1PILE ?auto_44382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44386 - BLOCK
    )
    :vars
    (
      ?auto_44387 - BLOCK
      ?auto_44388 - BLOCK
      ?auto_44389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44387 ?auto_44386 ) ( ON-TABLE ?auto_44386 ) ( not ( = ?auto_44386 ?auto_44387 ) ) ( CLEAR ?auto_44388 ) ( not ( = ?auto_44386 ?auto_44389 ) ) ( not ( = ?auto_44386 ?auto_44388 ) ) ( not ( = ?auto_44387 ?auto_44389 ) ) ( not ( = ?auto_44387 ?auto_44388 ) ) ( not ( = ?auto_44389 ?auto_44388 ) ) ( ON ?auto_44389 ?auto_44387 ) ( CLEAR ?auto_44389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44386 ?auto_44387 )
      ( MAKE-1PILE ?auto_44386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44390 - BLOCK
    )
    :vars
    (
      ?auto_44392 - BLOCK
      ?auto_44393 - BLOCK
      ?auto_44391 - BLOCK
      ?auto_44395 - BLOCK
      ?auto_44394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44392 ?auto_44390 ) ( ON-TABLE ?auto_44390 ) ( not ( = ?auto_44390 ?auto_44392 ) ) ( not ( = ?auto_44390 ?auto_44393 ) ) ( not ( = ?auto_44390 ?auto_44391 ) ) ( not ( = ?auto_44392 ?auto_44393 ) ) ( not ( = ?auto_44392 ?auto_44391 ) ) ( not ( = ?auto_44393 ?auto_44391 ) ) ( ON ?auto_44393 ?auto_44392 ) ( CLEAR ?auto_44393 ) ( HOLDING ?auto_44391 ) ( CLEAR ?auto_44395 ) ( ON-TABLE ?auto_44394 ) ( ON ?auto_44395 ?auto_44394 ) ( not ( = ?auto_44394 ?auto_44395 ) ) ( not ( = ?auto_44394 ?auto_44391 ) ) ( not ( = ?auto_44395 ?auto_44391 ) ) ( not ( = ?auto_44390 ?auto_44395 ) ) ( not ( = ?auto_44390 ?auto_44394 ) ) ( not ( = ?auto_44392 ?auto_44395 ) ) ( not ( = ?auto_44392 ?auto_44394 ) ) ( not ( = ?auto_44393 ?auto_44395 ) ) ( not ( = ?auto_44393 ?auto_44394 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44394 ?auto_44395 ?auto_44391 )
      ( MAKE-1PILE ?auto_44390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44396 - BLOCK
    )
    :vars
    (
      ?auto_44399 - BLOCK
      ?auto_44400 - BLOCK
      ?auto_44401 - BLOCK
      ?auto_44398 - BLOCK
      ?auto_44397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44399 ?auto_44396 ) ( ON-TABLE ?auto_44396 ) ( not ( = ?auto_44396 ?auto_44399 ) ) ( not ( = ?auto_44396 ?auto_44400 ) ) ( not ( = ?auto_44396 ?auto_44401 ) ) ( not ( = ?auto_44399 ?auto_44400 ) ) ( not ( = ?auto_44399 ?auto_44401 ) ) ( not ( = ?auto_44400 ?auto_44401 ) ) ( ON ?auto_44400 ?auto_44399 ) ( CLEAR ?auto_44398 ) ( ON-TABLE ?auto_44397 ) ( ON ?auto_44398 ?auto_44397 ) ( not ( = ?auto_44397 ?auto_44398 ) ) ( not ( = ?auto_44397 ?auto_44401 ) ) ( not ( = ?auto_44398 ?auto_44401 ) ) ( not ( = ?auto_44396 ?auto_44398 ) ) ( not ( = ?auto_44396 ?auto_44397 ) ) ( not ( = ?auto_44399 ?auto_44398 ) ) ( not ( = ?auto_44399 ?auto_44397 ) ) ( not ( = ?auto_44400 ?auto_44398 ) ) ( not ( = ?auto_44400 ?auto_44397 ) ) ( ON ?auto_44401 ?auto_44400 ) ( CLEAR ?auto_44401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44396 ?auto_44399 ?auto_44400 )
      ( MAKE-1PILE ?auto_44396 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44402 - BLOCK
    )
    :vars
    (
      ?auto_44405 - BLOCK
      ?auto_44404 - BLOCK
      ?auto_44406 - BLOCK
      ?auto_44407 - BLOCK
      ?auto_44403 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44405 ?auto_44402 ) ( ON-TABLE ?auto_44402 ) ( not ( = ?auto_44402 ?auto_44405 ) ) ( not ( = ?auto_44402 ?auto_44404 ) ) ( not ( = ?auto_44402 ?auto_44406 ) ) ( not ( = ?auto_44405 ?auto_44404 ) ) ( not ( = ?auto_44405 ?auto_44406 ) ) ( not ( = ?auto_44404 ?auto_44406 ) ) ( ON ?auto_44404 ?auto_44405 ) ( ON-TABLE ?auto_44407 ) ( not ( = ?auto_44407 ?auto_44403 ) ) ( not ( = ?auto_44407 ?auto_44406 ) ) ( not ( = ?auto_44403 ?auto_44406 ) ) ( not ( = ?auto_44402 ?auto_44403 ) ) ( not ( = ?auto_44402 ?auto_44407 ) ) ( not ( = ?auto_44405 ?auto_44403 ) ) ( not ( = ?auto_44405 ?auto_44407 ) ) ( not ( = ?auto_44404 ?auto_44403 ) ) ( not ( = ?auto_44404 ?auto_44407 ) ) ( ON ?auto_44406 ?auto_44404 ) ( CLEAR ?auto_44406 ) ( HOLDING ?auto_44403 ) ( CLEAR ?auto_44407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44407 ?auto_44403 )
      ( MAKE-1PILE ?auto_44402 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44408 - BLOCK
    )
    :vars
    (
      ?auto_44412 - BLOCK
      ?auto_44410 - BLOCK
      ?auto_44413 - BLOCK
      ?auto_44409 - BLOCK
      ?auto_44411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44412 ?auto_44408 ) ( ON-TABLE ?auto_44408 ) ( not ( = ?auto_44408 ?auto_44412 ) ) ( not ( = ?auto_44408 ?auto_44410 ) ) ( not ( = ?auto_44408 ?auto_44413 ) ) ( not ( = ?auto_44412 ?auto_44410 ) ) ( not ( = ?auto_44412 ?auto_44413 ) ) ( not ( = ?auto_44410 ?auto_44413 ) ) ( ON ?auto_44410 ?auto_44412 ) ( ON-TABLE ?auto_44409 ) ( not ( = ?auto_44409 ?auto_44411 ) ) ( not ( = ?auto_44409 ?auto_44413 ) ) ( not ( = ?auto_44411 ?auto_44413 ) ) ( not ( = ?auto_44408 ?auto_44411 ) ) ( not ( = ?auto_44408 ?auto_44409 ) ) ( not ( = ?auto_44412 ?auto_44411 ) ) ( not ( = ?auto_44412 ?auto_44409 ) ) ( not ( = ?auto_44410 ?auto_44411 ) ) ( not ( = ?auto_44410 ?auto_44409 ) ) ( ON ?auto_44413 ?auto_44410 ) ( CLEAR ?auto_44409 ) ( ON ?auto_44411 ?auto_44413 ) ( CLEAR ?auto_44411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44408 ?auto_44412 ?auto_44410 ?auto_44413 )
      ( MAKE-1PILE ?auto_44408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44414 - BLOCK
    )
    :vars
    (
      ?auto_44417 - BLOCK
      ?auto_44415 - BLOCK
      ?auto_44419 - BLOCK
      ?auto_44418 - BLOCK
      ?auto_44416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44417 ?auto_44414 ) ( ON-TABLE ?auto_44414 ) ( not ( = ?auto_44414 ?auto_44417 ) ) ( not ( = ?auto_44414 ?auto_44415 ) ) ( not ( = ?auto_44414 ?auto_44419 ) ) ( not ( = ?auto_44417 ?auto_44415 ) ) ( not ( = ?auto_44417 ?auto_44419 ) ) ( not ( = ?auto_44415 ?auto_44419 ) ) ( ON ?auto_44415 ?auto_44417 ) ( not ( = ?auto_44418 ?auto_44416 ) ) ( not ( = ?auto_44418 ?auto_44419 ) ) ( not ( = ?auto_44416 ?auto_44419 ) ) ( not ( = ?auto_44414 ?auto_44416 ) ) ( not ( = ?auto_44414 ?auto_44418 ) ) ( not ( = ?auto_44417 ?auto_44416 ) ) ( not ( = ?auto_44417 ?auto_44418 ) ) ( not ( = ?auto_44415 ?auto_44416 ) ) ( not ( = ?auto_44415 ?auto_44418 ) ) ( ON ?auto_44419 ?auto_44415 ) ( ON ?auto_44416 ?auto_44419 ) ( CLEAR ?auto_44416 ) ( HOLDING ?auto_44418 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44418 )
      ( MAKE-1PILE ?auto_44414 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44420 - BLOCK
    )
    :vars
    (
      ?auto_44421 - BLOCK
      ?auto_44424 - BLOCK
      ?auto_44425 - BLOCK
      ?auto_44423 - BLOCK
      ?auto_44422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44421 ?auto_44420 ) ( ON-TABLE ?auto_44420 ) ( not ( = ?auto_44420 ?auto_44421 ) ) ( not ( = ?auto_44420 ?auto_44424 ) ) ( not ( = ?auto_44420 ?auto_44425 ) ) ( not ( = ?auto_44421 ?auto_44424 ) ) ( not ( = ?auto_44421 ?auto_44425 ) ) ( not ( = ?auto_44424 ?auto_44425 ) ) ( ON ?auto_44424 ?auto_44421 ) ( not ( = ?auto_44423 ?auto_44422 ) ) ( not ( = ?auto_44423 ?auto_44425 ) ) ( not ( = ?auto_44422 ?auto_44425 ) ) ( not ( = ?auto_44420 ?auto_44422 ) ) ( not ( = ?auto_44420 ?auto_44423 ) ) ( not ( = ?auto_44421 ?auto_44422 ) ) ( not ( = ?auto_44421 ?auto_44423 ) ) ( not ( = ?auto_44424 ?auto_44422 ) ) ( not ( = ?auto_44424 ?auto_44423 ) ) ( ON ?auto_44425 ?auto_44424 ) ( ON ?auto_44422 ?auto_44425 ) ( ON ?auto_44423 ?auto_44422 ) ( CLEAR ?auto_44423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44420 ?auto_44421 ?auto_44424 ?auto_44425 ?auto_44422 )
      ( MAKE-1PILE ?auto_44420 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44426 - BLOCK
    )
    :vars
    (
      ?auto_44431 - BLOCK
      ?auto_44428 - BLOCK
      ?auto_44427 - BLOCK
      ?auto_44430 - BLOCK
      ?auto_44429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44431 ?auto_44426 ) ( ON-TABLE ?auto_44426 ) ( not ( = ?auto_44426 ?auto_44431 ) ) ( not ( = ?auto_44426 ?auto_44428 ) ) ( not ( = ?auto_44426 ?auto_44427 ) ) ( not ( = ?auto_44431 ?auto_44428 ) ) ( not ( = ?auto_44431 ?auto_44427 ) ) ( not ( = ?auto_44428 ?auto_44427 ) ) ( ON ?auto_44428 ?auto_44431 ) ( not ( = ?auto_44430 ?auto_44429 ) ) ( not ( = ?auto_44430 ?auto_44427 ) ) ( not ( = ?auto_44429 ?auto_44427 ) ) ( not ( = ?auto_44426 ?auto_44429 ) ) ( not ( = ?auto_44426 ?auto_44430 ) ) ( not ( = ?auto_44431 ?auto_44429 ) ) ( not ( = ?auto_44431 ?auto_44430 ) ) ( not ( = ?auto_44428 ?auto_44429 ) ) ( not ( = ?auto_44428 ?auto_44430 ) ) ( ON ?auto_44427 ?auto_44428 ) ( ON ?auto_44429 ?auto_44427 ) ( HOLDING ?auto_44430 ) ( CLEAR ?auto_44429 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44426 ?auto_44431 ?auto_44428 ?auto_44427 ?auto_44429 ?auto_44430 )
      ( MAKE-1PILE ?auto_44426 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44432 - BLOCK
    )
    :vars
    (
      ?auto_44435 - BLOCK
      ?auto_44433 - BLOCK
      ?auto_44434 - BLOCK
      ?auto_44436 - BLOCK
      ?auto_44437 - BLOCK
      ?auto_44438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44435 ?auto_44432 ) ( ON-TABLE ?auto_44432 ) ( not ( = ?auto_44432 ?auto_44435 ) ) ( not ( = ?auto_44432 ?auto_44433 ) ) ( not ( = ?auto_44432 ?auto_44434 ) ) ( not ( = ?auto_44435 ?auto_44433 ) ) ( not ( = ?auto_44435 ?auto_44434 ) ) ( not ( = ?auto_44433 ?auto_44434 ) ) ( ON ?auto_44433 ?auto_44435 ) ( not ( = ?auto_44436 ?auto_44437 ) ) ( not ( = ?auto_44436 ?auto_44434 ) ) ( not ( = ?auto_44437 ?auto_44434 ) ) ( not ( = ?auto_44432 ?auto_44437 ) ) ( not ( = ?auto_44432 ?auto_44436 ) ) ( not ( = ?auto_44435 ?auto_44437 ) ) ( not ( = ?auto_44435 ?auto_44436 ) ) ( not ( = ?auto_44433 ?auto_44437 ) ) ( not ( = ?auto_44433 ?auto_44436 ) ) ( ON ?auto_44434 ?auto_44433 ) ( ON ?auto_44437 ?auto_44434 ) ( CLEAR ?auto_44437 ) ( ON ?auto_44436 ?auto_44438 ) ( CLEAR ?auto_44436 ) ( HAND-EMPTY ) ( not ( = ?auto_44432 ?auto_44438 ) ) ( not ( = ?auto_44435 ?auto_44438 ) ) ( not ( = ?auto_44433 ?auto_44438 ) ) ( not ( = ?auto_44434 ?auto_44438 ) ) ( not ( = ?auto_44436 ?auto_44438 ) ) ( not ( = ?auto_44437 ?auto_44438 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44436 ?auto_44438 )
      ( MAKE-1PILE ?auto_44432 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44439 - BLOCK
    )
    :vars
    (
      ?auto_44444 - BLOCK
      ?auto_44445 - BLOCK
      ?auto_44443 - BLOCK
      ?auto_44440 - BLOCK
      ?auto_44441 - BLOCK
      ?auto_44442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44444 ?auto_44439 ) ( ON-TABLE ?auto_44439 ) ( not ( = ?auto_44439 ?auto_44444 ) ) ( not ( = ?auto_44439 ?auto_44445 ) ) ( not ( = ?auto_44439 ?auto_44443 ) ) ( not ( = ?auto_44444 ?auto_44445 ) ) ( not ( = ?auto_44444 ?auto_44443 ) ) ( not ( = ?auto_44445 ?auto_44443 ) ) ( ON ?auto_44445 ?auto_44444 ) ( not ( = ?auto_44440 ?auto_44441 ) ) ( not ( = ?auto_44440 ?auto_44443 ) ) ( not ( = ?auto_44441 ?auto_44443 ) ) ( not ( = ?auto_44439 ?auto_44441 ) ) ( not ( = ?auto_44439 ?auto_44440 ) ) ( not ( = ?auto_44444 ?auto_44441 ) ) ( not ( = ?auto_44444 ?auto_44440 ) ) ( not ( = ?auto_44445 ?auto_44441 ) ) ( not ( = ?auto_44445 ?auto_44440 ) ) ( ON ?auto_44443 ?auto_44445 ) ( ON ?auto_44440 ?auto_44442 ) ( CLEAR ?auto_44440 ) ( not ( = ?auto_44439 ?auto_44442 ) ) ( not ( = ?auto_44444 ?auto_44442 ) ) ( not ( = ?auto_44445 ?auto_44442 ) ) ( not ( = ?auto_44443 ?auto_44442 ) ) ( not ( = ?auto_44440 ?auto_44442 ) ) ( not ( = ?auto_44441 ?auto_44442 ) ) ( HOLDING ?auto_44441 ) ( CLEAR ?auto_44443 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44439 ?auto_44444 ?auto_44445 ?auto_44443 ?auto_44441 )
      ( MAKE-1PILE ?auto_44439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44446 - BLOCK
    )
    :vars
    (
      ?auto_44452 - BLOCK
      ?auto_44449 - BLOCK
      ?auto_44451 - BLOCK
      ?auto_44447 - BLOCK
      ?auto_44448 - BLOCK
      ?auto_44450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44452 ?auto_44446 ) ( ON-TABLE ?auto_44446 ) ( not ( = ?auto_44446 ?auto_44452 ) ) ( not ( = ?auto_44446 ?auto_44449 ) ) ( not ( = ?auto_44446 ?auto_44451 ) ) ( not ( = ?auto_44452 ?auto_44449 ) ) ( not ( = ?auto_44452 ?auto_44451 ) ) ( not ( = ?auto_44449 ?auto_44451 ) ) ( ON ?auto_44449 ?auto_44452 ) ( not ( = ?auto_44447 ?auto_44448 ) ) ( not ( = ?auto_44447 ?auto_44451 ) ) ( not ( = ?auto_44448 ?auto_44451 ) ) ( not ( = ?auto_44446 ?auto_44448 ) ) ( not ( = ?auto_44446 ?auto_44447 ) ) ( not ( = ?auto_44452 ?auto_44448 ) ) ( not ( = ?auto_44452 ?auto_44447 ) ) ( not ( = ?auto_44449 ?auto_44448 ) ) ( not ( = ?auto_44449 ?auto_44447 ) ) ( ON ?auto_44451 ?auto_44449 ) ( ON ?auto_44447 ?auto_44450 ) ( not ( = ?auto_44446 ?auto_44450 ) ) ( not ( = ?auto_44452 ?auto_44450 ) ) ( not ( = ?auto_44449 ?auto_44450 ) ) ( not ( = ?auto_44451 ?auto_44450 ) ) ( not ( = ?auto_44447 ?auto_44450 ) ) ( not ( = ?auto_44448 ?auto_44450 ) ) ( CLEAR ?auto_44451 ) ( ON ?auto_44448 ?auto_44447 ) ( CLEAR ?auto_44448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44450 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44450 ?auto_44447 )
      ( MAKE-1PILE ?auto_44446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44453 - BLOCK
    )
    :vars
    (
      ?auto_44459 - BLOCK
      ?auto_44455 - BLOCK
      ?auto_44454 - BLOCK
      ?auto_44458 - BLOCK
      ?auto_44456 - BLOCK
      ?auto_44457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44459 ?auto_44453 ) ( ON-TABLE ?auto_44453 ) ( not ( = ?auto_44453 ?auto_44459 ) ) ( not ( = ?auto_44453 ?auto_44455 ) ) ( not ( = ?auto_44453 ?auto_44454 ) ) ( not ( = ?auto_44459 ?auto_44455 ) ) ( not ( = ?auto_44459 ?auto_44454 ) ) ( not ( = ?auto_44455 ?auto_44454 ) ) ( ON ?auto_44455 ?auto_44459 ) ( not ( = ?auto_44458 ?auto_44456 ) ) ( not ( = ?auto_44458 ?auto_44454 ) ) ( not ( = ?auto_44456 ?auto_44454 ) ) ( not ( = ?auto_44453 ?auto_44456 ) ) ( not ( = ?auto_44453 ?auto_44458 ) ) ( not ( = ?auto_44459 ?auto_44456 ) ) ( not ( = ?auto_44459 ?auto_44458 ) ) ( not ( = ?auto_44455 ?auto_44456 ) ) ( not ( = ?auto_44455 ?auto_44458 ) ) ( ON ?auto_44458 ?auto_44457 ) ( not ( = ?auto_44453 ?auto_44457 ) ) ( not ( = ?auto_44459 ?auto_44457 ) ) ( not ( = ?auto_44455 ?auto_44457 ) ) ( not ( = ?auto_44454 ?auto_44457 ) ) ( not ( = ?auto_44458 ?auto_44457 ) ) ( not ( = ?auto_44456 ?auto_44457 ) ) ( ON ?auto_44456 ?auto_44458 ) ( CLEAR ?auto_44456 ) ( ON-TABLE ?auto_44457 ) ( HOLDING ?auto_44454 ) ( CLEAR ?auto_44455 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44453 ?auto_44459 ?auto_44455 ?auto_44454 )
      ( MAKE-1PILE ?auto_44453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44460 - BLOCK
    )
    :vars
    (
      ?auto_44465 - BLOCK
      ?auto_44466 - BLOCK
      ?auto_44463 - BLOCK
      ?auto_44464 - BLOCK
      ?auto_44462 - BLOCK
      ?auto_44461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44465 ?auto_44460 ) ( ON-TABLE ?auto_44460 ) ( not ( = ?auto_44460 ?auto_44465 ) ) ( not ( = ?auto_44460 ?auto_44466 ) ) ( not ( = ?auto_44460 ?auto_44463 ) ) ( not ( = ?auto_44465 ?auto_44466 ) ) ( not ( = ?auto_44465 ?auto_44463 ) ) ( not ( = ?auto_44466 ?auto_44463 ) ) ( ON ?auto_44466 ?auto_44465 ) ( not ( = ?auto_44464 ?auto_44462 ) ) ( not ( = ?auto_44464 ?auto_44463 ) ) ( not ( = ?auto_44462 ?auto_44463 ) ) ( not ( = ?auto_44460 ?auto_44462 ) ) ( not ( = ?auto_44460 ?auto_44464 ) ) ( not ( = ?auto_44465 ?auto_44462 ) ) ( not ( = ?auto_44465 ?auto_44464 ) ) ( not ( = ?auto_44466 ?auto_44462 ) ) ( not ( = ?auto_44466 ?auto_44464 ) ) ( ON ?auto_44464 ?auto_44461 ) ( not ( = ?auto_44460 ?auto_44461 ) ) ( not ( = ?auto_44465 ?auto_44461 ) ) ( not ( = ?auto_44466 ?auto_44461 ) ) ( not ( = ?auto_44463 ?auto_44461 ) ) ( not ( = ?auto_44464 ?auto_44461 ) ) ( not ( = ?auto_44462 ?auto_44461 ) ) ( ON ?auto_44462 ?auto_44464 ) ( ON-TABLE ?auto_44461 ) ( CLEAR ?auto_44466 ) ( ON ?auto_44463 ?auto_44462 ) ( CLEAR ?auto_44463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44461 ?auto_44464 ?auto_44462 )
      ( MAKE-1PILE ?auto_44460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44467 - BLOCK
    )
    :vars
    (
      ?auto_44468 - BLOCK
      ?auto_44471 - BLOCK
      ?auto_44473 - BLOCK
      ?auto_44470 - BLOCK
      ?auto_44469 - BLOCK
      ?auto_44472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44468 ?auto_44467 ) ( ON-TABLE ?auto_44467 ) ( not ( = ?auto_44467 ?auto_44468 ) ) ( not ( = ?auto_44467 ?auto_44471 ) ) ( not ( = ?auto_44467 ?auto_44473 ) ) ( not ( = ?auto_44468 ?auto_44471 ) ) ( not ( = ?auto_44468 ?auto_44473 ) ) ( not ( = ?auto_44471 ?auto_44473 ) ) ( not ( = ?auto_44470 ?auto_44469 ) ) ( not ( = ?auto_44470 ?auto_44473 ) ) ( not ( = ?auto_44469 ?auto_44473 ) ) ( not ( = ?auto_44467 ?auto_44469 ) ) ( not ( = ?auto_44467 ?auto_44470 ) ) ( not ( = ?auto_44468 ?auto_44469 ) ) ( not ( = ?auto_44468 ?auto_44470 ) ) ( not ( = ?auto_44471 ?auto_44469 ) ) ( not ( = ?auto_44471 ?auto_44470 ) ) ( ON ?auto_44470 ?auto_44472 ) ( not ( = ?auto_44467 ?auto_44472 ) ) ( not ( = ?auto_44468 ?auto_44472 ) ) ( not ( = ?auto_44471 ?auto_44472 ) ) ( not ( = ?auto_44473 ?auto_44472 ) ) ( not ( = ?auto_44470 ?auto_44472 ) ) ( not ( = ?auto_44469 ?auto_44472 ) ) ( ON ?auto_44469 ?auto_44470 ) ( ON-TABLE ?auto_44472 ) ( ON ?auto_44473 ?auto_44469 ) ( CLEAR ?auto_44473 ) ( HOLDING ?auto_44471 ) ( CLEAR ?auto_44468 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44467 ?auto_44468 ?auto_44471 )
      ( MAKE-1PILE ?auto_44467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44474 - BLOCK
    )
    :vars
    (
      ?auto_44480 - BLOCK
      ?auto_44477 - BLOCK
      ?auto_44475 - BLOCK
      ?auto_44478 - BLOCK
      ?auto_44476 - BLOCK
      ?auto_44479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_44480 ?auto_44474 ) ( ON-TABLE ?auto_44474 ) ( not ( = ?auto_44474 ?auto_44480 ) ) ( not ( = ?auto_44474 ?auto_44477 ) ) ( not ( = ?auto_44474 ?auto_44475 ) ) ( not ( = ?auto_44480 ?auto_44477 ) ) ( not ( = ?auto_44480 ?auto_44475 ) ) ( not ( = ?auto_44477 ?auto_44475 ) ) ( not ( = ?auto_44478 ?auto_44476 ) ) ( not ( = ?auto_44478 ?auto_44475 ) ) ( not ( = ?auto_44476 ?auto_44475 ) ) ( not ( = ?auto_44474 ?auto_44476 ) ) ( not ( = ?auto_44474 ?auto_44478 ) ) ( not ( = ?auto_44480 ?auto_44476 ) ) ( not ( = ?auto_44480 ?auto_44478 ) ) ( not ( = ?auto_44477 ?auto_44476 ) ) ( not ( = ?auto_44477 ?auto_44478 ) ) ( ON ?auto_44478 ?auto_44479 ) ( not ( = ?auto_44474 ?auto_44479 ) ) ( not ( = ?auto_44480 ?auto_44479 ) ) ( not ( = ?auto_44477 ?auto_44479 ) ) ( not ( = ?auto_44475 ?auto_44479 ) ) ( not ( = ?auto_44478 ?auto_44479 ) ) ( not ( = ?auto_44476 ?auto_44479 ) ) ( ON ?auto_44476 ?auto_44478 ) ( ON-TABLE ?auto_44479 ) ( ON ?auto_44475 ?auto_44476 ) ( CLEAR ?auto_44480 ) ( ON ?auto_44477 ?auto_44475 ) ( CLEAR ?auto_44477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44479 ?auto_44478 ?auto_44476 ?auto_44475 )
      ( MAKE-1PILE ?auto_44474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44495 - BLOCK
    )
    :vars
    (
      ?auto_44496 - BLOCK
      ?auto_44497 - BLOCK
      ?auto_44499 - BLOCK
      ?auto_44498 - BLOCK
      ?auto_44501 - BLOCK
      ?auto_44500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44495 ?auto_44496 ) ) ( not ( = ?auto_44495 ?auto_44497 ) ) ( not ( = ?auto_44495 ?auto_44499 ) ) ( not ( = ?auto_44496 ?auto_44497 ) ) ( not ( = ?auto_44496 ?auto_44499 ) ) ( not ( = ?auto_44497 ?auto_44499 ) ) ( not ( = ?auto_44498 ?auto_44501 ) ) ( not ( = ?auto_44498 ?auto_44499 ) ) ( not ( = ?auto_44501 ?auto_44499 ) ) ( not ( = ?auto_44495 ?auto_44501 ) ) ( not ( = ?auto_44495 ?auto_44498 ) ) ( not ( = ?auto_44496 ?auto_44501 ) ) ( not ( = ?auto_44496 ?auto_44498 ) ) ( not ( = ?auto_44497 ?auto_44501 ) ) ( not ( = ?auto_44497 ?auto_44498 ) ) ( ON ?auto_44498 ?auto_44500 ) ( not ( = ?auto_44495 ?auto_44500 ) ) ( not ( = ?auto_44496 ?auto_44500 ) ) ( not ( = ?auto_44497 ?auto_44500 ) ) ( not ( = ?auto_44499 ?auto_44500 ) ) ( not ( = ?auto_44498 ?auto_44500 ) ) ( not ( = ?auto_44501 ?auto_44500 ) ) ( ON ?auto_44501 ?auto_44498 ) ( ON-TABLE ?auto_44500 ) ( ON ?auto_44499 ?auto_44501 ) ( ON ?auto_44497 ?auto_44499 ) ( ON ?auto_44496 ?auto_44497 ) ( CLEAR ?auto_44496 ) ( HOLDING ?auto_44495 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44495 ?auto_44496 )
      ( MAKE-1PILE ?auto_44495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_44502 - BLOCK
    )
    :vars
    (
      ?auto_44507 - BLOCK
      ?auto_44506 - BLOCK
      ?auto_44503 - BLOCK
      ?auto_44504 - BLOCK
      ?auto_44505 - BLOCK
      ?auto_44508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44502 ?auto_44507 ) ) ( not ( = ?auto_44502 ?auto_44506 ) ) ( not ( = ?auto_44502 ?auto_44503 ) ) ( not ( = ?auto_44507 ?auto_44506 ) ) ( not ( = ?auto_44507 ?auto_44503 ) ) ( not ( = ?auto_44506 ?auto_44503 ) ) ( not ( = ?auto_44504 ?auto_44505 ) ) ( not ( = ?auto_44504 ?auto_44503 ) ) ( not ( = ?auto_44505 ?auto_44503 ) ) ( not ( = ?auto_44502 ?auto_44505 ) ) ( not ( = ?auto_44502 ?auto_44504 ) ) ( not ( = ?auto_44507 ?auto_44505 ) ) ( not ( = ?auto_44507 ?auto_44504 ) ) ( not ( = ?auto_44506 ?auto_44505 ) ) ( not ( = ?auto_44506 ?auto_44504 ) ) ( ON ?auto_44504 ?auto_44508 ) ( not ( = ?auto_44502 ?auto_44508 ) ) ( not ( = ?auto_44507 ?auto_44508 ) ) ( not ( = ?auto_44506 ?auto_44508 ) ) ( not ( = ?auto_44503 ?auto_44508 ) ) ( not ( = ?auto_44504 ?auto_44508 ) ) ( not ( = ?auto_44505 ?auto_44508 ) ) ( ON ?auto_44505 ?auto_44504 ) ( ON-TABLE ?auto_44508 ) ( ON ?auto_44503 ?auto_44505 ) ( ON ?auto_44506 ?auto_44503 ) ( ON ?auto_44507 ?auto_44506 ) ( ON ?auto_44502 ?auto_44507 ) ( CLEAR ?auto_44502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44508 ?auto_44504 ?auto_44505 ?auto_44503 ?auto_44506 ?auto_44507 )
      ( MAKE-1PILE ?auto_44502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44514 - BLOCK
      ?auto_44515 - BLOCK
      ?auto_44516 - BLOCK
      ?auto_44517 - BLOCK
      ?auto_44518 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44518 ) ( CLEAR ?auto_44517 ) ( ON-TABLE ?auto_44514 ) ( ON ?auto_44515 ?auto_44514 ) ( ON ?auto_44516 ?auto_44515 ) ( ON ?auto_44517 ?auto_44516 ) ( not ( = ?auto_44514 ?auto_44515 ) ) ( not ( = ?auto_44514 ?auto_44516 ) ) ( not ( = ?auto_44514 ?auto_44517 ) ) ( not ( = ?auto_44514 ?auto_44518 ) ) ( not ( = ?auto_44515 ?auto_44516 ) ) ( not ( = ?auto_44515 ?auto_44517 ) ) ( not ( = ?auto_44515 ?auto_44518 ) ) ( not ( = ?auto_44516 ?auto_44517 ) ) ( not ( = ?auto_44516 ?auto_44518 ) ) ( not ( = ?auto_44517 ?auto_44518 ) ) )
    :subtasks
    ( ( !STACK ?auto_44518 ?auto_44517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44519 - BLOCK
      ?auto_44520 - BLOCK
      ?auto_44521 - BLOCK
      ?auto_44522 - BLOCK
      ?auto_44523 - BLOCK
    )
    :vars
    (
      ?auto_44524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44522 ) ( ON-TABLE ?auto_44519 ) ( ON ?auto_44520 ?auto_44519 ) ( ON ?auto_44521 ?auto_44520 ) ( ON ?auto_44522 ?auto_44521 ) ( not ( = ?auto_44519 ?auto_44520 ) ) ( not ( = ?auto_44519 ?auto_44521 ) ) ( not ( = ?auto_44519 ?auto_44522 ) ) ( not ( = ?auto_44519 ?auto_44523 ) ) ( not ( = ?auto_44520 ?auto_44521 ) ) ( not ( = ?auto_44520 ?auto_44522 ) ) ( not ( = ?auto_44520 ?auto_44523 ) ) ( not ( = ?auto_44521 ?auto_44522 ) ) ( not ( = ?auto_44521 ?auto_44523 ) ) ( not ( = ?auto_44522 ?auto_44523 ) ) ( ON ?auto_44523 ?auto_44524 ) ( CLEAR ?auto_44523 ) ( HAND-EMPTY ) ( not ( = ?auto_44519 ?auto_44524 ) ) ( not ( = ?auto_44520 ?auto_44524 ) ) ( not ( = ?auto_44521 ?auto_44524 ) ) ( not ( = ?auto_44522 ?auto_44524 ) ) ( not ( = ?auto_44523 ?auto_44524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44523 ?auto_44524 )
      ( MAKE-5PILE ?auto_44519 ?auto_44520 ?auto_44521 ?auto_44522 ?auto_44523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44525 - BLOCK
      ?auto_44526 - BLOCK
      ?auto_44527 - BLOCK
      ?auto_44528 - BLOCK
      ?auto_44529 - BLOCK
    )
    :vars
    (
      ?auto_44530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44525 ) ( ON ?auto_44526 ?auto_44525 ) ( ON ?auto_44527 ?auto_44526 ) ( not ( = ?auto_44525 ?auto_44526 ) ) ( not ( = ?auto_44525 ?auto_44527 ) ) ( not ( = ?auto_44525 ?auto_44528 ) ) ( not ( = ?auto_44525 ?auto_44529 ) ) ( not ( = ?auto_44526 ?auto_44527 ) ) ( not ( = ?auto_44526 ?auto_44528 ) ) ( not ( = ?auto_44526 ?auto_44529 ) ) ( not ( = ?auto_44527 ?auto_44528 ) ) ( not ( = ?auto_44527 ?auto_44529 ) ) ( not ( = ?auto_44528 ?auto_44529 ) ) ( ON ?auto_44529 ?auto_44530 ) ( CLEAR ?auto_44529 ) ( not ( = ?auto_44525 ?auto_44530 ) ) ( not ( = ?auto_44526 ?auto_44530 ) ) ( not ( = ?auto_44527 ?auto_44530 ) ) ( not ( = ?auto_44528 ?auto_44530 ) ) ( not ( = ?auto_44529 ?auto_44530 ) ) ( HOLDING ?auto_44528 ) ( CLEAR ?auto_44527 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44525 ?auto_44526 ?auto_44527 ?auto_44528 )
      ( MAKE-5PILE ?auto_44525 ?auto_44526 ?auto_44527 ?auto_44528 ?auto_44529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44531 - BLOCK
      ?auto_44532 - BLOCK
      ?auto_44533 - BLOCK
      ?auto_44534 - BLOCK
      ?auto_44535 - BLOCK
    )
    :vars
    (
      ?auto_44536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44531 ) ( ON ?auto_44532 ?auto_44531 ) ( ON ?auto_44533 ?auto_44532 ) ( not ( = ?auto_44531 ?auto_44532 ) ) ( not ( = ?auto_44531 ?auto_44533 ) ) ( not ( = ?auto_44531 ?auto_44534 ) ) ( not ( = ?auto_44531 ?auto_44535 ) ) ( not ( = ?auto_44532 ?auto_44533 ) ) ( not ( = ?auto_44532 ?auto_44534 ) ) ( not ( = ?auto_44532 ?auto_44535 ) ) ( not ( = ?auto_44533 ?auto_44534 ) ) ( not ( = ?auto_44533 ?auto_44535 ) ) ( not ( = ?auto_44534 ?auto_44535 ) ) ( ON ?auto_44535 ?auto_44536 ) ( not ( = ?auto_44531 ?auto_44536 ) ) ( not ( = ?auto_44532 ?auto_44536 ) ) ( not ( = ?auto_44533 ?auto_44536 ) ) ( not ( = ?auto_44534 ?auto_44536 ) ) ( not ( = ?auto_44535 ?auto_44536 ) ) ( CLEAR ?auto_44533 ) ( ON ?auto_44534 ?auto_44535 ) ( CLEAR ?auto_44534 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44536 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44536 ?auto_44535 )
      ( MAKE-5PILE ?auto_44531 ?auto_44532 ?auto_44533 ?auto_44534 ?auto_44535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44537 - BLOCK
      ?auto_44538 - BLOCK
      ?auto_44539 - BLOCK
      ?auto_44540 - BLOCK
      ?auto_44541 - BLOCK
    )
    :vars
    (
      ?auto_44542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44537 ) ( ON ?auto_44538 ?auto_44537 ) ( not ( = ?auto_44537 ?auto_44538 ) ) ( not ( = ?auto_44537 ?auto_44539 ) ) ( not ( = ?auto_44537 ?auto_44540 ) ) ( not ( = ?auto_44537 ?auto_44541 ) ) ( not ( = ?auto_44538 ?auto_44539 ) ) ( not ( = ?auto_44538 ?auto_44540 ) ) ( not ( = ?auto_44538 ?auto_44541 ) ) ( not ( = ?auto_44539 ?auto_44540 ) ) ( not ( = ?auto_44539 ?auto_44541 ) ) ( not ( = ?auto_44540 ?auto_44541 ) ) ( ON ?auto_44541 ?auto_44542 ) ( not ( = ?auto_44537 ?auto_44542 ) ) ( not ( = ?auto_44538 ?auto_44542 ) ) ( not ( = ?auto_44539 ?auto_44542 ) ) ( not ( = ?auto_44540 ?auto_44542 ) ) ( not ( = ?auto_44541 ?auto_44542 ) ) ( ON ?auto_44540 ?auto_44541 ) ( CLEAR ?auto_44540 ) ( ON-TABLE ?auto_44542 ) ( HOLDING ?auto_44539 ) ( CLEAR ?auto_44538 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44537 ?auto_44538 ?auto_44539 )
      ( MAKE-5PILE ?auto_44537 ?auto_44538 ?auto_44539 ?auto_44540 ?auto_44541 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44543 - BLOCK
      ?auto_44544 - BLOCK
      ?auto_44545 - BLOCK
      ?auto_44546 - BLOCK
      ?auto_44547 - BLOCK
    )
    :vars
    (
      ?auto_44548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44543 ) ( ON ?auto_44544 ?auto_44543 ) ( not ( = ?auto_44543 ?auto_44544 ) ) ( not ( = ?auto_44543 ?auto_44545 ) ) ( not ( = ?auto_44543 ?auto_44546 ) ) ( not ( = ?auto_44543 ?auto_44547 ) ) ( not ( = ?auto_44544 ?auto_44545 ) ) ( not ( = ?auto_44544 ?auto_44546 ) ) ( not ( = ?auto_44544 ?auto_44547 ) ) ( not ( = ?auto_44545 ?auto_44546 ) ) ( not ( = ?auto_44545 ?auto_44547 ) ) ( not ( = ?auto_44546 ?auto_44547 ) ) ( ON ?auto_44547 ?auto_44548 ) ( not ( = ?auto_44543 ?auto_44548 ) ) ( not ( = ?auto_44544 ?auto_44548 ) ) ( not ( = ?auto_44545 ?auto_44548 ) ) ( not ( = ?auto_44546 ?auto_44548 ) ) ( not ( = ?auto_44547 ?auto_44548 ) ) ( ON ?auto_44546 ?auto_44547 ) ( ON-TABLE ?auto_44548 ) ( CLEAR ?auto_44544 ) ( ON ?auto_44545 ?auto_44546 ) ( CLEAR ?auto_44545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44548 ?auto_44547 ?auto_44546 )
      ( MAKE-5PILE ?auto_44543 ?auto_44544 ?auto_44545 ?auto_44546 ?auto_44547 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44549 - BLOCK
      ?auto_44550 - BLOCK
      ?auto_44551 - BLOCK
      ?auto_44552 - BLOCK
      ?auto_44553 - BLOCK
    )
    :vars
    (
      ?auto_44554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44549 ) ( not ( = ?auto_44549 ?auto_44550 ) ) ( not ( = ?auto_44549 ?auto_44551 ) ) ( not ( = ?auto_44549 ?auto_44552 ) ) ( not ( = ?auto_44549 ?auto_44553 ) ) ( not ( = ?auto_44550 ?auto_44551 ) ) ( not ( = ?auto_44550 ?auto_44552 ) ) ( not ( = ?auto_44550 ?auto_44553 ) ) ( not ( = ?auto_44551 ?auto_44552 ) ) ( not ( = ?auto_44551 ?auto_44553 ) ) ( not ( = ?auto_44552 ?auto_44553 ) ) ( ON ?auto_44553 ?auto_44554 ) ( not ( = ?auto_44549 ?auto_44554 ) ) ( not ( = ?auto_44550 ?auto_44554 ) ) ( not ( = ?auto_44551 ?auto_44554 ) ) ( not ( = ?auto_44552 ?auto_44554 ) ) ( not ( = ?auto_44553 ?auto_44554 ) ) ( ON ?auto_44552 ?auto_44553 ) ( ON-TABLE ?auto_44554 ) ( ON ?auto_44551 ?auto_44552 ) ( CLEAR ?auto_44551 ) ( HOLDING ?auto_44550 ) ( CLEAR ?auto_44549 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44549 ?auto_44550 )
      ( MAKE-5PILE ?auto_44549 ?auto_44550 ?auto_44551 ?auto_44552 ?auto_44553 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44555 - BLOCK
      ?auto_44556 - BLOCK
      ?auto_44557 - BLOCK
      ?auto_44558 - BLOCK
      ?auto_44559 - BLOCK
    )
    :vars
    (
      ?auto_44560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44555 ) ( not ( = ?auto_44555 ?auto_44556 ) ) ( not ( = ?auto_44555 ?auto_44557 ) ) ( not ( = ?auto_44555 ?auto_44558 ) ) ( not ( = ?auto_44555 ?auto_44559 ) ) ( not ( = ?auto_44556 ?auto_44557 ) ) ( not ( = ?auto_44556 ?auto_44558 ) ) ( not ( = ?auto_44556 ?auto_44559 ) ) ( not ( = ?auto_44557 ?auto_44558 ) ) ( not ( = ?auto_44557 ?auto_44559 ) ) ( not ( = ?auto_44558 ?auto_44559 ) ) ( ON ?auto_44559 ?auto_44560 ) ( not ( = ?auto_44555 ?auto_44560 ) ) ( not ( = ?auto_44556 ?auto_44560 ) ) ( not ( = ?auto_44557 ?auto_44560 ) ) ( not ( = ?auto_44558 ?auto_44560 ) ) ( not ( = ?auto_44559 ?auto_44560 ) ) ( ON ?auto_44558 ?auto_44559 ) ( ON-TABLE ?auto_44560 ) ( ON ?auto_44557 ?auto_44558 ) ( CLEAR ?auto_44555 ) ( ON ?auto_44556 ?auto_44557 ) ( CLEAR ?auto_44556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44560 ?auto_44559 ?auto_44558 ?auto_44557 )
      ( MAKE-5PILE ?auto_44555 ?auto_44556 ?auto_44557 ?auto_44558 ?auto_44559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44561 - BLOCK
      ?auto_44562 - BLOCK
      ?auto_44563 - BLOCK
      ?auto_44564 - BLOCK
      ?auto_44565 - BLOCK
    )
    :vars
    (
      ?auto_44566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44561 ?auto_44562 ) ) ( not ( = ?auto_44561 ?auto_44563 ) ) ( not ( = ?auto_44561 ?auto_44564 ) ) ( not ( = ?auto_44561 ?auto_44565 ) ) ( not ( = ?auto_44562 ?auto_44563 ) ) ( not ( = ?auto_44562 ?auto_44564 ) ) ( not ( = ?auto_44562 ?auto_44565 ) ) ( not ( = ?auto_44563 ?auto_44564 ) ) ( not ( = ?auto_44563 ?auto_44565 ) ) ( not ( = ?auto_44564 ?auto_44565 ) ) ( ON ?auto_44565 ?auto_44566 ) ( not ( = ?auto_44561 ?auto_44566 ) ) ( not ( = ?auto_44562 ?auto_44566 ) ) ( not ( = ?auto_44563 ?auto_44566 ) ) ( not ( = ?auto_44564 ?auto_44566 ) ) ( not ( = ?auto_44565 ?auto_44566 ) ) ( ON ?auto_44564 ?auto_44565 ) ( ON-TABLE ?auto_44566 ) ( ON ?auto_44563 ?auto_44564 ) ( ON ?auto_44562 ?auto_44563 ) ( CLEAR ?auto_44562 ) ( HOLDING ?auto_44561 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44561 )
      ( MAKE-5PILE ?auto_44561 ?auto_44562 ?auto_44563 ?auto_44564 ?auto_44565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44567 - BLOCK
      ?auto_44568 - BLOCK
      ?auto_44569 - BLOCK
      ?auto_44570 - BLOCK
      ?auto_44571 - BLOCK
    )
    :vars
    (
      ?auto_44572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44567 ?auto_44568 ) ) ( not ( = ?auto_44567 ?auto_44569 ) ) ( not ( = ?auto_44567 ?auto_44570 ) ) ( not ( = ?auto_44567 ?auto_44571 ) ) ( not ( = ?auto_44568 ?auto_44569 ) ) ( not ( = ?auto_44568 ?auto_44570 ) ) ( not ( = ?auto_44568 ?auto_44571 ) ) ( not ( = ?auto_44569 ?auto_44570 ) ) ( not ( = ?auto_44569 ?auto_44571 ) ) ( not ( = ?auto_44570 ?auto_44571 ) ) ( ON ?auto_44571 ?auto_44572 ) ( not ( = ?auto_44567 ?auto_44572 ) ) ( not ( = ?auto_44568 ?auto_44572 ) ) ( not ( = ?auto_44569 ?auto_44572 ) ) ( not ( = ?auto_44570 ?auto_44572 ) ) ( not ( = ?auto_44571 ?auto_44572 ) ) ( ON ?auto_44570 ?auto_44571 ) ( ON-TABLE ?auto_44572 ) ( ON ?auto_44569 ?auto_44570 ) ( ON ?auto_44568 ?auto_44569 ) ( ON ?auto_44567 ?auto_44568 ) ( CLEAR ?auto_44567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44572 ?auto_44571 ?auto_44570 ?auto_44569 ?auto_44568 )
      ( MAKE-5PILE ?auto_44567 ?auto_44568 ?auto_44569 ?auto_44570 ?auto_44571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44573 - BLOCK
      ?auto_44574 - BLOCK
      ?auto_44575 - BLOCK
      ?auto_44576 - BLOCK
      ?auto_44577 - BLOCK
    )
    :vars
    (
      ?auto_44578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44573 ?auto_44574 ) ) ( not ( = ?auto_44573 ?auto_44575 ) ) ( not ( = ?auto_44573 ?auto_44576 ) ) ( not ( = ?auto_44573 ?auto_44577 ) ) ( not ( = ?auto_44574 ?auto_44575 ) ) ( not ( = ?auto_44574 ?auto_44576 ) ) ( not ( = ?auto_44574 ?auto_44577 ) ) ( not ( = ?auto_44575 ?auto_44576 ) ) ( not ( = ?auto_44575 ?auto_44577 ) ) ( not ( = ?auto_44576 ?auto_44577 ) ) ( ON ?auto_44577 ?auto_44578 ) ( not ( = ?auto_44573 ?auto_44578 ) ) ( not ( = ?auto_44574 ?auto_44578 ) ) ( not ( = ?auto_44575 ?auto_44578 ) ) ( not ( = ?auto_44576 ?auto_44578 ) ) ( not ( = ?auto_44577 ?auto_44578 ) ) ( ON ?auto_44576 ?auto_44577 ) ( ON-TABLE ?auto_44578 ) ( ON ?auto_44575 ?auto_44576 ) ( ON ?auto_44574 ?auto_44575 ) ( HOLDING ?auto_44573 ) ( CLEAR ?auto_44574 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44578 ?auto_44577 ?auto_44576 ?auto_44575 ?auto_44574 ?auto_44573 )
      ( MAKE-5PILE ?auto_44573 ?auto_44574 ?auto_44575 ?auto_44576 ?auto_44577 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44579 - BLOCK
      ?auto_44580 - BLOCK
      ?auto_44581 - BLOCK
      ?auto_44582 - BLOCK
      ?auto_44583 - BLOCK
    )
    :vars
    (
      ?auto_44584 - BLOCK
      ?auto_44585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44579 ?auto_44580 ) ) ( not ( = ?auto_44579 ?auto_44581 ) ) ( not ( = ?auto_44579 ?auto_44582 ) ) ( not ( = ?auto_44579 ?auto_44583 ) ) ( not ( = ?auto_44580 ?auto_44581 ) ) ( not ( = ?auto_44580 ?auto_44582 ) ) ( not ( = ?auto_44580 ?auto_44583 ) ) ( not ( = ?auto_44581 ?auto_44582 ) ) ( not ( = ?auto_44581 ?auto_44583 ) ) ( not ( = ?auto_44582 ?auto_44583 ) ) ( ON ?auto_44583 ?auto_44584 ) ( not ( = ?auto_44579 ?auto_44584 ) ) ( not ( = ?auto_44580 ?auto_44584 ) ) ( not ( = ?auto_44581 ?auto_44584 ) ) ( not ( = ?auto_44582 ?auto_44584 ) ) ( not ( = ?auto_44583 ?auto_44584 ) ) ( ON ?auto_44582 ?auto_44583 ) ( ON-TABLE ?auto_44584 ) ( ON ?auto_44581 ?auto_44582 ) ( ON ?auto_44580 ?auto_44581 ) ( CLEAR ?auto_44580 ) ( ON ?auto_44579 ?auto_44585 ) ( CLEAR ?auto_44579 ) ( HAND-EMPTY ) ( not ( = ?auto_44579 ?auto_44585 ) ) ( not ( = ?auto_44580 ?auto_44585 ) ) ( not ( = ?auto_44581 ?auto_44585 ) ) ( not ( = ?auto_44582 ?auto_44585 ) ) ( not ( = ?auto_44583 ?auto_44585 ) ) ( not ( = ?auto_44584 ?auto_44585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44579 ?auto_44585 )
      ( MAKE-5PILE ?auto_44579 ?auto_44580 ?auto_44581 ?auto_44582 ?auto_44583 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44586 - BLOCK
      ?auto_44587 - BLOCK
      ?auto_44588 - BLOCK
      ?auto_44589 - BLOCK
      ?auto_44590 - BLOCK
    )
    :vars
    (
      ?auto_44592 - BLOCK
      ?auto_44591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44586 ?auto_44587 ) ) ( not ( = ?auto_44586 ?auto_44588 ) ) ( not ( = ?auto_44586 ?auto_44589 ) ) ( not ( = ?auto_44586 ?auto_44590 ) ) ( not ( = ?auto_44587 ?auto_44588 ) ) ( not ( = ?auto_44587 ?auto_44589 ) ) ( not ( = ?auto_44587 ?auto_44590 ) ) ( not ( = ?auto_44588 ?auto_44589 ) ) ( not ( = ?auto_44588 ?auto_44590 ) ) ( not ( = ?auto_44589 ?auto_44590 ) ) ( ON ?auto_44590 ?auto_44592 ) ( not ( = ?auto_44586 ?auto_44592 ) ) ( not ( = ?auto_44587 ?auto_44592 ) ) ( not ( = ?auto_44588 ?auto_44592 ) ) ( not ( = ?auto_44589 ?auto_44592 ) ) ( not ( = ?auto_44590 ?auto_44592 ) ) ( ON ?auto_44589 ?auto_44590 ) ( ON-TABLE ?auto_44592 ) ( ON ?auto_44588 ?auto_44589 ) ( ON ?auto_44586 ?auto_44591 ) ( CLEAR ?auto_44586 ) ( not ( = ?auto_44586 ?auto_44591 ) ) ( not ( = ?auto_44587 ?auto_44591 ) ) ( not ( = ?auto_44588 ?auto_44591 ) ) ( not ( = ?auto_44589 ?auto_44591 ) ) ( not ( = ?auto_44590 ?auto_44591 ) ) ( not ( = ?auto_44592 ?auto_44591 ) ) ( HOLDING ?auto_44587 ) ( CLEAR ?auto_44588 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44592 ?auto_44590 ?auto_44589 ?auto_44588 ?auto_44587 )
      ( MAKE-5PILE ?auto_44586 ?auto_44587 ?auto_44588 ?auto_44589 ?auto_44590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44593 - BLOCK
      ?auto_44594 - BLOCK
      ?auto_44595 - BLOCK
      ?auto_44596 - BLOCK
      ?auto_44597 - BLOCK
    )
    :vars
    (
      ?auto_44599 - BLOCK
      ?auto_44598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44593 ?auto_44594 ) ) ( not ( = ?auto_44593 ?auto_44595 ) ) ( not ( = ?auto_44593 ?auto_44596 ) ) ( not ( = ?auto_44593 ?auto_44597 ) ) ( not ( = ?auto_44594 ?auto_44595 ) ) ( not ( = ?auto_44594 ?auto_44596 ) ) ( not ( = ?auto_44594 ?auto_44597 ) ) ( not ( = ?auto_44595 ?auto_44596 ) ) ( not ( = ?auto_44595 ?auto_44597 ) ) ( not ( = ?auto_44596 ?auto_44597 ) ) ( ON ?auto_44597 ?auto_44599 ) ( not ( = ?auto_44593 ?auto_44599 ) ) ( not ( = ?auto_44594 ?auto_44599 ) ) ( not ( = ?auto_44595 ?auto_44599 ) ) ( not ( = ?auto_44596 ?auto_44599 ) ) ( not ( = ?auto_44597 ?auto_44599 ) ) ( ON ?auto_44596 ?auto_44597 ) ( ON-TABLE ?auto_44599 ) ( ON ?auto_44595 ?auto_44596 ) ( ON ?auto_44593 ?auto_44598 ) ( not ( = ?auto_44593 ?auto_44598 ) ) ( not ( = ?auto_44594 ?auto_44598 ) ) ( not ( = ?auto_44595 ?auto_44598 ) ) ( not ( = ?auto_44596 ?auto_44598 ) ) ( not ( = ?auto_44597 ?auto_44598 ) ) ( not ( = ?auto_44599 ?auto_44598 ) ) ( CLEAR ?auto_44595 ) ( ON ?auto_44594 ?auto_44593 ) ( CLEAR ?auto_44594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44598 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44598 ?auto_44593 )
      ( MAKE-5PILE ?auto_44593 ?auto_44594 ?auto_44595 ?auto_44596 ?auto_44597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44600 - BLOCK
      ?auto_44601 - BLOCK
      ?auto_44602 - BLOCK
      ?auto_44603 - BLOCK
      ?auto_44604 - BLOCK
    )
    :vars
    (
      ?auto_44606 - BLOCK
      ?auto_44605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44600 ?auto_44601 ) ) ( not ( = ?auto_44600 ?auto_44602 ) ) ( not ( = ?auto_44600 ?auto_44603 ) ) ( not ( = ?auto_44600 ?auto_44604 ) ) ( not ( = ?auto_44601 ?auto_44602 ) ) ( not ( = ?auto_44601 ?auto_44603 ) ) ( not ( = ?auto_44601 ?auto_44604 ) ) ( not ( = ?auto_44602 ?auto_44603 ) ) ( not ( = ?auto_44602 ?auto_44604 ) ) ( not ( = ?auto_44603 ?auto_44604 ) ) ( ON ?auto_44604 ?auto_44606 ) ( not ( = ?auto_44600 ?auto_44606 ) ) ( not ( = ?auto_44601 ?auto_44606 ) ) ( not ( = ?auto_44602 ?auto_44606 ) ) ( not ( = ?auto_44603 ?auto_44606 ) ) ( not ( = ?auto_44604 ?auto_44606 ) ) ( ON ?auto_44603 ?auto_44604 ) ( ON-TABLE ?auto_44606 ) ( ON ?auto_44600 ?auto_44605 ) ( not ( = ?auto_44600 ?auto_44605 ) ) ( not ( = ?auto_44601 ?auto_44605 ) ) ( not ( = ?auto_44602 ?auto_44605 ) ) ( not ( = ?auto_44603 ?auto_44605 ) ) ( not ( = ?auto_44604 ?auto_44605 ) ) ( not ( = ?auto_44606 ?auto_44605 ) ) ( ON ?auto_44601 ?auto_44600 ) ( CLEAR ?auto_44601 ) ( ON-TABLE ?auto_44605 ) ( HOLDING ?auto_44602 ) ( CLEAR ?auto_44603 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44606 ?auto_44604 ?auto_44603 ?auto_44602 )
      ( MAKE-5PILE ?auto_44600 ?auto_44601 ?auto_44602 ?auto_44603 ?auto_44604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44607 - BLOCK
      ?auto_44608 - BLOCK
      ?auto_44609 - BLOCK
      ?auto_44610 - BLOCK
      ?auto_44611 - BLOCK
    )
    :vars
    (
      ?auto_44613 - BLOCK
      ?auto_44612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44607 ?auto_44608 ) ) ( not ( = ?auto_44607 ?auto_44609 ) ) ( not ( = ?auto_44607 ?auto_44610 ) ) ( not ( = ?auto_44607 ?auto_44611 ) ) ( not ( = ?auto_44608 ?auto_44609 ) ) ( not ( = ?auto_44608 ?auto_44610 ) ) ( not ( = ?auto_44608 ?auto_44611 ) ) ( not ( = ?auto_44609 ?auto_44610 ) ) ( not ( = ?auto_44609 ?auto_44611 ) ) ( not ( = ?auto_44610 ?auto_44611 ) ) ( ON ?auto_44611 ?auto_44613 ) ( not ( = ?auto_44607 ?auto_44613 ) ) ( not ( = ?auto_44608 ?auto_44613 ) ) ( not ( = ?auto_44609 ?auto_44613 ) ) ( not ( = ?auto_44610 ?auto_44613 ) ) ( not ( = ?auto_44611 ?auto_44613 ) ) ( ON ?auto_44610 ?auto_44611 ) ( ON-TABLE ?auto_44613 ) ( ON ?auto_44607 ?auto_44612 ) ( not ( = ?auto_44607 ?auto_44612 ) ) ( not ( = ?auto_44608 ?auto_44612 ) ) ( not ( = ?auto_44609 ?auto_44612 ) ) ( not ( = ?auto_44610 ?auto_44612 ) ) ( not ( = ?auto_44611 ?auto_44612 ) ) ( not ( = ?auto_44613 ?auto_44612 ) ) ( ON ?auto_44608 ?auto_44607 ) ( ON-TABLE ?auto_44612 ) ( CLEAR ?auto_44610 ) ( ON ?auto_44609 ?auto_44608 ) ( CLEAR ?auto_44609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44612 ?auto_44607 ?auto_44608 )
      ( MAKE-5PILE ?auto_44607 ?auto_44608 ?auto_44609 ?auto_44610 ?auto_44611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44614 - BLOCK
      ?auto_44615 - BLOCK
      ?auto_44616 - BLOCK
      ?auto_44617 - BLOCK
      ?auto_44618 - BLOCK
    )
    :vars
    (
      ?auto_44620 - BLOCK
      ?auto_44619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44614 ?auto_44615 ) ) ( not ( = ?auto_44614 ?auto_44616 ) ) ( not ( = ?auto_44614 ?auto_44617 ) ) ( not ( = ?auto_44614 ?auto_44618 ) ) ( not ( = ?auto_44615 ?auto_44616 ) ) ( not ( = ?auto_44615 ?auto_44617 ) ) ( not ( = ?auto_44615 ?auto_44618 ) ) ( not ( = ?auto_44616 ?auto_44617 ) ) ( not ( = ?auto_44616 ?auto_44618 ) ) ( not ( = ?auto_44617 ?auto_44618 ) ) ( ON ?auto_44618 ?auto_44620 ) ( not ( = ?auto_44614 ?auto_44620 ) ) ( not ( = ?auto_44615 ?auto_44620 ) ) ( not ( = ?auto_44616 ?auto_44620 ) ) ( not ( = ?auto_44617 ?auto_44620 ) ) ( not ( = ?auto_44618 ?auto_44620 ) ) ( ON-TABLE ?auto_44620 ) ( ON ?auto_44614 ?auto_44619 ) ( not ( = ?auto_44614 ?auto_44619 ) ) ( not ( = ?auto_44615 ?auto_44619 ) ) ( not ( = ?auto_44616 ?auto_44619 ) ) ( not ( = ?auto_44617 ?auto_44619 ) ) ( not ( = ?auto_44618 ?auto_44619 ) ) ( not ( = ?auto_44620 ?auto_44619 ) ) ( ON ?auto_44615 ?auto_44614 ) ( ON-TABLE ?auto_44619 ) ( ON ?auto_44616 ?auto_44615 ) ( CLEAR ?auto_44616 ) ( HOLDING ?auto_44617 ) ( CLEAR ?auto_44618 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44620 ?auto_44618 ?auto_44617 )
      ( MAKE-5PILE ?auto_44614 ?auto_44615 ?auto_44616 ?auto_44617 ?auto_44618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44621 - BLOCK
      ?auto_44622 - BLOCK
      ?auto_44623 - BLOCK
      ?auto_44624 - BLOCK
      ?auto_44625 - BLOCK
    )
    :vars
    (
      ?auto_44626 - BLOCK
      ?auto_44627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44621 ?auto_44622 ) ) ( not ( = ?auto_44621 ?auto_44623 ) ) ( not ( = ?auto_44621 ?auto_44624 ) ) ( not ( = ?auto_44621 ?auto_44625 ) ) ( not ( = ?auto_44622 ?auto_44623 ) ) ( not ( = ?auto_44622 ?auto_44624 ) ) ( not ( = ?auto_44622 ?auto_44625 ) ) ( not ( = ?auto_44623 ?auto_44624 ) ) ( not ( = ?auto_44623 ?auto_44625 ) ) ( not ( = ?auto_44624 ?auto_44625 ) ) ( ON ?auto_44625 ?auto_44626 ) ( not ( = ?auto_44621 ?auto_44626 ) ) ( not ( = ?auto_44622 ?auto_44626 ) ) ( not ( = ?auto_44623 ?auto_44626 ) ) ( not ( = ?auto_44624 ?auto_44626 ) ) ( not ( = ?auto_44625 ?auto_44626 ) ) ( ON-TABLE ?auto_44626 ) ( ON ?auto_44621 ?auto_44627 ) ( not ( = ?auto_44621 ?auto_44627 ) ) ( not ( = ?auto_44622 ?auto_44627 ) ) ( not ( = ?auto_44623 ?auto_44627 ) ) ( not ( = ?auto_44624 ?auto_44627 ) ) ( not ( = ?auto_44625 ?auto_44627 ) ) ( not ( = ?auto_44626 ?auto_44627 ) ) ( ON ?auto_44622 ?auto_44621 ) ( ON-TABLE ?auto_44627 ) ( ON ?auto_44623 ?auto_44622 ) ( CLEAR ?auto_44625 ) ( ON ?auto_44624 ?auto_44623 ) ( CLEAR ?auto_44624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44627 ?auto_44621 ?auto_44622 ?auto_44623 )
      ( MAKE-5PILE ?auto_44621 ?auto_44622 ?auto_44623 ?auto_44624 ?auto_44625 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44628 - BLOCK
      ?auto_44629 - BLOCK
      ?auto_44630 - BLOCK
      ?auto_44631 - BLOCK
      ?auto_44632 - BLOCK
    )
    :vars
    (
      ?auto_44634 - BLOCK
      ?auto_44633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44628 ?auto_44629 ) ) ( not ( = ?auto_44628 ?auto_44630 ) ) ( not ( = ?auto_44628 ?auto_44631 ) ) ( not ( = ?auto_44628 ?auto_44632 ) ) ( not ( = ?auto_44629 ?auto_44630 ) ) ( not ( = ?auto_44629 ?auto_44631 ) ) ( not ( = ?auto_44629 ?auto_44632 ) ) ( not ( = ?auto_44630 ?auto_44631 ) ) ( not ( = ?auto_44630 ?auto_44632 ) ) ( not ( = ?auto_44631 ?auto_44632 ) ) ( not ( = ?auto_44628 ?auto_44634 ) ) ( not ( = ?auto_44629 ?auto_44634 ) ) ( not ( = ?auto_44630 ?auto_44634 ) ) ( not ( = ?auto_44631 ?auto_44634 ) ) ( not ( = ?auto_44632 ?auto_44634 ) ) ( ON-TABLE ?auto_44634 ) ( ON ?auto_44628 ?auto_44633 ) ( not ( = ?auto_44628 ?auto_44633 ) ) ( not ( = ?auto_44629 ?auto_44633 ) ) ( not ( = ?auto_44630 ?auto_44633 ) ) ( not ( = ?auto_44631 ?auto_44633 ) ) ( not ( = ?auto_44632 ?auto_44633 ) ) ( not ( = ?auto_44634 ?auto_44633 ) ) ( ON ?auto_44629 ?auto_44628 ) ( ON-TABLE ?auto_44633 ) ( ON ?auto_44630 ?auto_44629 ) ( ON ?auto_44631 ?auto_44630 ) ( CLEAR ?auto_44631 ) ( HOLDING ?auto_44632 ) ( CLEAR ?auto_44634 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44634 ?auto_44632 )
      ( MAKE-5PILE ?auto_44628 ?auto_44629 ?auto_44630 ?auto_44631 ?auto_44632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44635 - BLOCK
      ?auto_44636 - BLOCK
      ?auto_44637 - BLOCK
      ?auto_44638 - BLOCK
      ?auto_44639 - BLOCK
    )
    :vars
    (
      ?auto_44641 - BLOCK
      ?auto_44640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44635 ?auto_44636 ) ) ( not ( = ?auto_44635 ?auto_44637 ) ) ( not ( = ?auto_44635 ?auto_44638 ) ) ( not ( = ?auto_44635 ?auto_44639 ) ) ( not ( = ?auto_44636 ?auto_44637 ) ) ( not ( = ?auto_44636 ?auto_44638 ) ) ( not ( = ?auto_44636 ?auto_44639 ) ) ( not ( = ?auto_44637 ?auto_44638 ) ) ( not ( = ?auto_44637 ?auto_44639 ) ) ( not ( = ?auto_44638 ?auto_44639 ) ) ( not ( = ?auto_44635 ?auto_44641 ) ) ( not ( = ?auto_44636 ?auto_44641 ) ) ( not ( = ?auto_44637 ?auto_44641 ) ) ( not ( = ?auto_44638 ?auto_44641 ) ) ( not ( = ?auto_44639 ?auto_44641 ) ) ( ON-TABLE ?auto_44641 ) ( ON ?auto_44635 ?auto_44640 ) ( not ( = ?auto_44635 ?auto_44640 ) ) ( not ( = ?auto_44636 ?auto_44640 ) ) ( not ( = ?auto_44637 ?auto_44640 ) ) ( not ( = ?auto_44638 ?auto_44640 ) ) ( not ( = ?auto_44639 ?auto_44640 ) ) ( not ( = ?auto_44641 ?auto_44640 ) ) ( ON ?auto_44636 ?auto_44635 ) ( ON-TABLE ?auto_44640 ) ( ON ?auto_44637 ?auto_44636 ) ( ON ?auto_44638 ?auto_44637 ) ( CLEAR ?auto_44641 ) ( ON ?auto_44639 ?auto_44638 ) ( CLEAR ?auto_44639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44640 ?auto_44635 ?auto_44636 ?auto_44637 ?auto_44638 )
      ( MAKE-5PILE ?auto_44635 ?auto_44636 ?auto_44637 ?auto_44638 ?auto_44639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44642 - BLOCK
      ?auto_44643 - BLOCK
      ?auto_44644 - BLOCK
      ?auto_44645 - BLOCK
      ?auto_44646 - BLOCK
    )
    :vars
    (
      ?auto_44648 - BLOCK
      ?auto_44647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44642 ?auto_44643 ) ) ( not ( = ?auto_44642 ?auto_44644 ) ) ( not ( = ?auto_44642 ?auto_44645 ) ) ( not ( = ?auto_44642 ?auto_44646 ) ) ( not ( = ?auto_44643 ?auto_44644 ) ) ( not ( = ?auto_44643 ?auto_44645 ) ) ( not ( = ?auto_44643 ?auto_44646 ) ) ( not ( = ?auto_44644 ?auto_44645 ) ) ( not ( = ?auto_44644 ?auto_44646 ) ) ( not ( = ?auto_44645 ?auto_44646 ) ) ( not ( = ?auto_44642 ?auto_44648 ) ) ( not ( = ?auto_44643 ?auto_44648 ) ) ( not ( = ?auto_44644 ?auto_44648 ) ) ( not ( = ?auto_44645 ?auto_44648 ) ) ( not ( = ?auto_44646 ?auto_44648 ) ) ( ON ?auto_44642 ?auto_44647 ) ( not ( = ?auto_44642 ?auto_44647 ) ) ( not ( = ?auto_44643 ?auto_44647 ) ) ( not ( = ?auto_44644 ?auto_44647 ) ) ( not ( = ?auto_44645 ?auto_44647 ) ) ( not ( = ?auto_44646 ?auto_44647 ) ) ( not ( = ?auto_44648 ?auto_44647 ) ) ( ON ?auto_44643 ?auto_44642 ) ( ON-TABLE ?auto_44647 ) ( ON ?auto_44644 ?auto_44643 ) ( ON ?auto_44645 ?auto_44644 ) ( ON ?auto_44646 ?auto_44645 ) ( CLEAR ?auto_44646 ) ( HOLDING ?auto_44648 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44648 )
      ( MAKE-5PILE ?auto_44642 ?auto_44643 ?auto_44644 ?auto_44645 ?auto_44646 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_44649 - BLOCK
      ?auto_44650 - BLOCK
      ?auto_44651 - BLOCK
      ?auto_44652 - BLOCK
      ?auto_44653 - BLOCK
    )
    :vars
    (
      ?auto_44655 - BLOCK
      ?auto_44654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44649 ?auto_44650 ) ) ( not ( = ?auto_44649 ?auto_44651 ) ) ( not ( = ?auto_44649 ?auto_44652 ) ) ( not ( = ?auto_44649 ?auto_44653 ) ) ( not ( = ?auto_44650 ?auto_44651 ) ) ( not ( = ?auto_44650 ?auto_44652 ) ) ( not ( = ?auto_44650 ?auto_44653 ) ) ( not ( = ?auto_44651 ?auto_44652 ) ) ( not ( = ?auto_44651 ?auto_44653 ) ) ( not ( = ?auto_44652 ?auto_44653 ) ) ( not ( = ?auto_44649 ?auto_44655 ) ) ( not ( = ?auto_44650 ?auto_44655 ) ) ( not ( = ?auto_44651 ?auto_44655 ) ) ( not ( = ?auto_44652 ?auto_44655 ) ) ( not ( = ?auto_44653 ?auto_44655 ) ) ( ON ?auto_44649 ?auto_44654 ) ( not ( = ?auto_44649 ?auto_44654 ) ) ( not ( = ?auto_44650 ?auto_44654 ) ) ( not ( = ?auto_44651 ?auto_44654 ) ) ( not ( = ?auto_44652 ?auto_44654 ) ) ( not ( = ?auto_44653 ?auto_44654 ) ) ( not ( = ?auto_44655 ?auto_44654 ) ) ( ON ?auto_44650 ?auto_44649 ) ( ON-TABLE ?auto_44654 ) ( ON ?auto_44651 ?auto_44650 ) ( ON ?auto_44652 ?auto_44651 ) ( ON ?auto_44653 ?auto_44652 ) ( ON ?auto_44655 ?auto_44653 ) ( CLEAR ?auto_44655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44654 ?auto_44649 ?auto_44650 ?auto_44651 ?auto_44652 ?auto_44653 )
      ( MAKE-5PILE ?auto_44649 ?auto_44650 ?auto_44651 ?auto_44652 ?auto_44653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44662 - BLOCK
      ?auto_44663 - BLOCK
      ?auto_44664 - BLOCK
      ?auto_44665 - BLOCK
      ?auto_44666 - BLOCK
      ?auto_44667 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_44667 ) ( CLEAR ?auto_44666 ) ( ON-TABLE ?auto_44662 ) ( ON ?auto_44663 ?auto_44662 ) ( ON ?auto_44664 ?auto_44663 ) ( ON ?auto_44665 ?auto_44664 ) ( ON ?auto_44666 ?auto_44665 ) ( not ( = ?auto_44662 ?auto_44663 ) ) ( not ( = ?auto_44662 ?auto_44664 ) ) ( not ( = ?auto_44662 ?auto_44665 ) ) ( not ( = ?auto_44662 ?auto_44666 ) ) ( not ( = ?auto_44662 ?auto_44667 ) ) ( not ( = ?auto_44663 ?auto_44664 ) ) ( not ( = ?auto_44663 ?auto_44665 ) ) ( not ( = ?auto_44663 ?auto_44666 ) ) ( not ( = ?auto_44663 ?auto_44667 ) ) ( not ( = ?auto_44664 ?auto_44665 ) ) ( not ( = ?auto_44664 ?auto_44666 ) ) ( not ( = ?auto_44664 ?auto_44667 ) ) ( not ( = ?auto_44665 ?auto_44666 ) ) ( not ( = ?auto_44665 ?auto_44667 ) ) ( not ( = ?auto_44666 ?auto_44667 ) ) )
    :subtasks
    ( ( !STACK ?auto_44667 ?auto_44666 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44668 - BLOCK
      ?auto_44669 - BLOCK
      ?auto_44670 - BLOCK
      ?auto_44671 - BLOCK
      ?auto_44672 - BLOCK
      ?auto_44673 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_44672 ) ( ON-TABLE ?auto_44668 ) ( ON ?auto_44669 ?auto_44668 ) ( ON ?auto_44670 ?auto_44669 ) ( ON ?auto_44671 ?auto_44670 ) ( ON ?auto_44672 ?auto_44671 ) ( not ( = ?auto_44668 ?auto_44669 ) ) ( not ( = ?auto_44668 ?auto_44670 ) ) ( not ( = ?auto_44668 ?auto_44671 ) ) ( not ( = ?auto_44668 ?auto_44672 ) ) ( not ( = ?auto_44668 ?auto_44673 ) ) ( not ( = ?auto_44669 ?auto_44670 ) ) ( not ( = ?auto_44669 ?auto_44671 ) ) ( not ( = ?auto_44669 ?auto_44672 ) ) ( not ( = ?auto_44669 ?auto_44673 ) ) ( not ( = ?auto_44670 ?auto_44671 ) ) ( not ( = ?auto_44670 ?auto_44672 ) ) ( not ( = ?auto_44670 ?auto_44673 ) ) ( not ( = ?auto_44671 ?auto_44672 ) ) ( not ( = ?auto_44671 ?auto_44673 ) ) ( not ( = ?auto_44672 ?auto_44673 ) ) ( ON-TABLE ?auto_44673 ) ( CLEAR ?auto_44673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_44673 )
      ( MAKE-6PILE ?auto_44668 ?auto_44669 ?auto_44670 ?auto_44671 ?auto_44672 ?auto_44673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44674 - BLOCK
      ?auto_44675 - BLOCK
      ?auto_44676 - BLOCK
      ?auto_44677 - BLOCK
      ?auto_44678 - BLOCK
      ?auto_44679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44674 ) ( ON ?auto_44675 ?auto_44674 ) ( ON ?auto_44676 ?auto_44675 ) ( ON ?auto_44677 ?auto_44676 ) ( not ( = ?auto_44674 ?auto_44675 ) ) ( not ( = ?auto_44674 ?auto_44676 ) ) ( not ( = ?auto_44674 ?auto_44677 ) ) ( not ( = ?auto_44674 ?auto_44678 ) ) ( not ( = ?auto_44674 ?auto_44679 ) ) ( not ( = ?auto_44675 ?auto_44676 ) ) ( not ( = ?auto_44675 ?auto_44677 ) ) ( not ( = ?auto_44675 ?auto_44678 ) ) ( not ( = ?auto_44675 ?auto_44679 ) ) ( not ( = ?auto_44676 ?auto_44677 ) ) ( not ( = ?auto_44676 ?auto_44678 ) ) ( not ( = ?auto_44676 ?auto_44679 ) ) ( not ( = ?auto_44677 ?auto_44678 ) ) ( not ( = ?auto_44677 ?auto_44679 ) ) ( not ( = ?auto_44678 ?auto_44679 ) ) ( ON-TABLE ?auto_44679 ) ( CLEAR ?auto_44679 ) ( HOLDING ?auto_44678 ) ( CLEAR ?auto_44677 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44674 ?auto_44675 ?auto_44676 ?auto_44677 ?auto_44678 )
      ( MAKE-6PILE ?auto_44674 ?auto_44675 ?auto_44676 ?auto_44677 ?auto_44678 ?auto_44679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44680 - BLOCK
      ?auto_44681 - BLOCK
      ?auto_44682 - BLOCK
      ?auto_44683 - BLOCK
      ?auto_44684 - BLOCK
      ?auto_44685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44680 ) ( ON ?auto_44681 ?auto_44680 ) ( ON ?auto_44682 ?auto_44681 ) ( ON ?auto_44683 ?auto_44682 ) ( not ( = ?auto_44680 ?auto_44681 ) ) ( not ( = ?auto_44680 ?auto_44682 ) ) ( not ( = ?auto_44680 ?auto_44683 ) ) ( not ( = ?auto_44680 ?auto_44684 ) ) ( not ( = ?auto_44680 ?auto_44685 ) ) ( not ( = ?auto_44681 ?auto_44682 ) ) ( not ( = ?auto_44681 ?auto_44683 ) ) ( not ( = ?auto_44681 ?auto_44684 ) ) ( not ( = ?auto_44681 ?auto_44685 ) ) ( not ( = ?auto_44682 ?auto_44683 ) ) ( not ( = ?auto_44682 ?auto_44684 ) ) ( not ( = ?auto_44682 ?auto_44685 ) ) ( not ( = ?auto_44683 ?auto_44684 ) ) ( not ( = ?auto_44683 ?auto_44685 ) ) ( not ( = ?auto_44684 ?auto_44685 ) ) ( ON-TABLE ?auto_44685 ) ( CLEAR ?auto_44683 ) ( ON ?auto_44684 ?auto_44685 ) ( CLEAR ?auto_44684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44685 )
      ( MAKE-6PILE ?auto_44680 ?auto_44681 ?auto_44682 ?auto_44683 ?auto_44684 ?auto_44685 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44686 - BLOCK
      ?auto_44687 - BLOCK
      ?auto_44688 - BLOCK
      ?auto_44689 - BLOCK
      ?auto_44690 - BLOCK
      ?auto_44691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44686 ) ( ON ?auto_44687 ?auto_44686 ) ( ON ?auto_44688 ?auto_44687 ) ( not ( = ?auto_44686 ?auto_44687 ) ) ( not ( = ?auto_44686 ?auto_44688 ) ) ( not ( = ?auto_44686 ?auto_44689 ) ) ( not ( = ?auto_44686 ?auto_44690 ) ) ( not ( = ?auto_44686 ?auto_44691 ) ) ( not ( = ?auto_44687 ?auto_44688 ) ) ( not ( = ?auto_44687 ?auto_44689 ) ) ( not ( = ?auto_44687 ?auto_44690 ) ) ( not ( = ?auto_44687 ?auto_44691 ) ) ( not ( = ?auto_44688 ?auto_44689 ) ) ( not ( = ?auto_44688 ?auto_44690 ) ) ( not ( = ?auto_44688 ?auto_44691 ) ) ( not ( = ?auto_44689 ?auto_44690 ) ) ( not ( = ?auto_44689 ?auto_44691 ) ) ( not ( = ?auto_44690 ?auto_44691 ) ) ( ON-TABLE ?auto_44691 ) ( ON ?auto_44690 ?auto_44691 ) ( CLEAR ?auto_44690 ) ( HOLDING ?auto_44689 ) ( CLEAR ?auto_44688 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44686 ?auto_44687 ?auto_44688 ?auto_44689 )
      ( MAKE-6PILE ?auto_44686 ?auto_44687 ?auto_44688 ?auto_44689 ?auto_44690 ?auto_44691 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44692 - BLOCK
      ?auto_44693 - BLOCK
      ?auto_44694 - BLOCK
      ?auto_44695 - BLOCK
      ?auto_44696 - BLOCK
      ?auto_44697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44692 ) ( ON ?auto_44693 ?auto_44692 ) ( ON ?auto_44694 ?auto_44693 ) ( not ( = ?auto_44692 ?auto_44693 ) ) ( not ( = ?auto_44692 ?auto_44694 ) ) ( not ( = ?auto_44692 ?auto_44695 ) ) ( not ( = ?auto_44692 ?auto_44696 ) ) ( not ( = ?auto_44692 ?auto_44697 ) ) ( not ( = ?auto_44693 ?auto_44694 ) ) ( not ( = ?auto_44693 ?auto_44695 ) ) ( not ( = ?auto_44693 ?auto_44696 ) ) ( not ( = ?auto_44693 ?auto_44697 ) ) ( not ( = ?auto_44694 ?auto_44695 ) ) ( not ( = ?auto_44694 ?auto_44696 ) ) ( not ( = ?auto_44694 ?auto_44697 ) ) ( not ( = ?auto_44695 ?auto_44696 ) ) ( not ( = ?auto_44695 ?auto_44697 ) ) ( not ( = ?auto_44696 ?auto_44697 ) ) ( ON-TABLE ?auto_44697 ) ( ON ?auto_44696 ?auto_44697 ) ( CLEAR ?auto_44694 ) ( ON ?auto_44695 ?auto_44696 ) ( CLEAR ?auto_44695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44697 ?auto_44696 )
      ( MAKE-6PILE ?auto_44692 ?auto_44693 ?auto_44694 ?auto_44695 ?auto_44696 ?auto_44697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44698 - BLOCK
      ?auto_44699 - BLOCK
      ?auto_44700 - BLOCK
      ?auto_44701 - BLOCK
      ?auto_44702 - BLOCK
      ?auto_44703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44698 ) ( ON ?auto_44699 ?auto_44698 ) ( not ( = ?auto_44698 ?auto_44699 ) ) ( not ( = ?auto_44698 ?auto_44700 ) ) ( not ( = ?auto_44698 ?auto_44701 ) ) ( not ( = ?auto_44698 ?auto_44702 ) ) ( not ( = ?auto_44698 ?auto_44703 ) ) ( not ( = ?auto_44699 ?auto_44700 ) ) ( not ( = ?auto_44699 ?auto_44701 ) ) ( not ( = ?auto_44699 ?auto_44702 ) ) ( not ( = ?auto_44699 ?auto_44703 ) ) ( not ( = ?auto_44700 ?auto_44701 ) ) ( not ( = ?auto_44700 ?auto_44702 ) ) ( not ( = ?auto_44700 ?auto_44703 ) ) ( not ( = ?auto_44701 ?auto_44702 ) ) ( not ( = ?auto_44701 ?auto_44703 ) ) ( not ( = ?auto_44702 ?auto_44703 ) ) ( ON-TABLE ?auto_44703 ) ( ON ?auto_44702 ?auto_44703 ) ( ON ?auto_44701 ?auto_44702 ) ( CLEAR ?auto_44701 ) ( HOLDING ?auto_44700 ) ( CLEAR ?auto_44699 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44698 ?auto_44699 ?auto_44700 )
      ( MAKE-6PILE ?auto_44698 ?auto_44699 ?auto_44700 ?auto_44701 ?auto_44702 ?auto_44703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44704 - BLOCK
      ?auto_44705 - BLOCK
      ?auto_44706 - BLOCK
      ?auto_44707 - BLOCK
      ?auto_44708 - BLOCK
      ?auto_44709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44704 ) ( ON ?auto_44705 ?auto_44704 ) ( not ( = ?auto_44704 ?auto_44705 ) ) ( not ( = ?auto_44704 ?auto_44706 ) ) ( not ( = ?auto_44704 ?auto_44707 ) ) ( not ( = ?auto_44704 ?auto_44708 ) ) ( not ( = ?auto_44704 ?auto_44709 ) ) ( not ( = ?auto_44705 ?auto_44706 ) ) ( not ( = ?auto_44705 ?auto_44707 ) ) ( not ( = ?auto_44705 ?auto_44708 ) ) ( not ( = ?auto_44705 ?auto_44709 ) ) ( not ( = ?auto_44706 ?auto_44707 ) ) ( not ( = ?auto_44706 ?auto_44708 ) ) ( not ( = ?auto_44706 ?auto_44709 ) ) ( not ( = ?auto_44707 ?auto_44708 ) ) ( not ( = ?auto_44707 ?auto_44709 ) ) ( not ( = ?auto_44708 ?auto_44709 ) ) ( ON-TABLE ?auto_44709 ) ( ON ?auto_44708 ?auto_44709 ) ( ON ?auto_44707 ?auto_44708 ) ( CLEAR ?auto_44705 ) ( ON ?auto_44706 ?auto_44707 ) ( CLEAR ?auto_44706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44709 ?auto_44708 ?auto_44707 )
      ( MAKE-6PILE ?auto_44704 ?auto_44705 ?auto_44706 ?auto_44707 ?auto_44708 ?auto_44709 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44710 - BLOCK
      ?auto_44711 - BLOCK
      ?auto_44712 - BLOCK
      ?auto_44713 - BLOCK
      ?auto_44714 - BLOCK
      ?auto_44715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44710 ) ( not ( = ?auto_44710 ?auto_44711 ) ) ( not ( = ?auto_44710 ?auto_44712 ) ) ( not ( = ?auto_44710 ?auto_44713 ) ) ( not ( = ?auto_44710 ?auto_44714 ) ) ( not ( = ?auto_44710 ?auto_44715 ) ) ( not ( = ?auto_44711 ?auto_44712 ) ) ( not ( = ?auto_44711 ?auto_44713 ) ) ( not ( = ?auto_44711 ?auto_44714 ) ) ( not ( = ?auto_44711 ?auto_44715 ) ) ( not ( = ?auto_44712 ?auto_44713 ) ) ( not ( = ?auto_44712 ?auto_44714 ) ) ( not ( = ?auto_44712 ?auto_44715 ) ) ( not ( = ?auto_44713 ?auto_44714 ) ) ( not ( = ?auto_44713 ?auto_44715 ) ) ( not ( = ?auto_44714 ?auto_44715 ) ) ( ON-TABLE ?auto_44715 ) ( ON ?auto_44714 ?auto_44715 ) ( ON ?auto_44713 ?auto_44714 ) ( ON ?auto_44712 ?auto_44713 ) ( CLEAR ?auto_44712 ) ( HOLDING ?auto_44711 ) ( CLEAR ?auto_44710 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44710 ?auto_44711 )
      ( MAKE-6PILE ?auto_44710 ?auto_44711 ?auto_44712 ?auto_44713 ?auto_44714 ?auto_44715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44716 - BLOCK
      ?auto_44717 - BLOCK
      ?auto_44718 - BLOCK
      ?auto_44719 - BLOCK
      ?auto_44720 - BLOCK
      ?auto_44721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_44716 ) ( not ( = ?auto_44716 ?auto_44717 ) ) ( not ( = ?auto_44716 ?auto_44718 ) ) ( not ( = ?auto_44716 ?auto_44719 ) ) ( not ( = ?auto_44716 ?auto_44720 ) ) ( not ( = ?auto_44716 ?auto_44721 ) ) ( not ( = ?auto_44717 ?auto_44718 ) ) ( not ( = ?auto_44717 ?auto_44719 ) ) ( not ( = ?auto_44717 ?auto_44720 ) ) ( not ( = ?auto_44717 ?auto_44721 ) ) ( not ( = ?auto_44718 ?auto_44719 ) ) ( not ( = ?auto_44718 ?auto_44720 ) ) ( not ( = ?auto_44718 ?auto_44721 ) ) ( not ( = ?auto_44719 ?auto_44720 ) ) ( not ( = ?auto_44719 ?auto_44721 ) ) ( not ( = ?auto_44720 ?auto_44721 ) ) ( ON-TABLE ?auto_44721 ) ( ON ?auto_44720 ?auto_44721 ) ( ON ?auto_44719 ?auto_44720 ) ( ON ?auto_44718 ?auto_44719 ) ( CLEAR ?auto_44716 ) ( ON ?auto_44717 ?auto_44718 ) ( CLEAR ?auto_44717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44721 ?auto_44720 ?auto_44719 ?auto_44718 )
      ( MAKE-6PILE ?auto_44716 ?auto_44717 ?auto_44718 ?auto_44719 ?auto_44720 ?auto_44721 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44722 - BLOCK
      ?auto_44723 - BLOCK
      ?auto_44724 - BLOCK
      ?auto_44725 - BLOCK
      ?auto_44726 - BLOCK
      ?auto_44727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44722 ?auto_44723 ) ) ( not ( = ?auto_44722 ?auto_44724 ) ) ( not ( = ?auto_44722 ?auto_44725 ) ) ( not ( = ?auto_44722 ?auto_44726 ) ) ( not ( = ?auto_44722 ?auto_44727 ) ) ( not ( = ?auto_44723 ?auto_44724 ) ) ( not ( = ?auto_44723 ?auto_44725 ) ) ( not ( = ?auto_44723 ?auto_44726 ) ) ( not ( = ?auto_44723 ?auto_44727 ) ) ( not ( = ?auto_44724 ?auto_44725 ) ) ( not ( = ?auto_44724 ?auto_44726 ) ) ( not ( = ?auto_44724 ?auto_44727 ) ) ( not ( = ?auto_44725 ?auto_44726 ) ) ( not ( = ?auto_44725 ?auto_44727 ) ) ( not ( = ?auto_44726 ?auto_44727 ) ) ( ON-TABLE ?auto_44727 ) ( ON ?auto_44726 ?auto_44727 ) ( ON ?auto_44725 ?auto_44726 ) ( ON ?auto_44724 ?auto_44725 ) ( ON ?auto_44723 ?auto_44724 ) ( CLEAR ?auto_44723 ) ( HOLDING ?auto_44722 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44722 )
      ( MAKE-6PILE ?auto_44722 ?auto_44723 ?auto_44724 ?auto_44725 ?auto_44726 ?auto_44727 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44728 - BLOCK
      ?auto_44729 - BLOCK
      ?auto_44730 - BLOCK
      ?auto_44731 - BLOCK
      ?auto_44732 - BLOCK
      ?auto_44733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44728 ?auto_44729 ) ) ( not ( = ?auto_44728 ?auto_44730 ) ) ( not ( = ?auto_44728 ?auto_44731 ) ) ( not ( = ?auto_44728 ?auto_44732 ) ) ( not ( = ?auto_44728 ?auto_44733 ) ) ( not ( = ?auto_44729 ?auto_44730 ) ) ( not ( = ?auto_44729 ?auto_44731 ) ) ( not ( = ?auto_44729 ?auto_44732 ) ) ( not ( = ?auto_44729 ?auto_44733 ) ) ( not ( = ?auto_44730 ?auto_44731 ) ) ( not ( = ?auto_44730 ?auto_44732 ) ) ( not ( = ?auto_44730 ?auto_44733 ) ) ( not ( = ?auto_44731 ?auto_44732 ) ) ( not ( = ?auto_44731 ?auto_44733 ) ) ( not ( = ?auto_44732 ?auto_44733 ) ) ( ON-TABLE ?auto_44733 ) ( ON ?auto_44732 ?auto_44733 ) ( ON ?auto_44731 ?auto_44732 ) ( ON ?auto_44730 ?auto_44731 ) ( ON ?auto_44729 ?auto_44730 ) ( ON ?auto_44728 ?auto_44729 ) ( CLEAR ?auto_44728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44733 ?auto_44732 ?auto_44731 ?auto_44730 ?auto_44729 )
      ( MAKE-6PILE ?auto_44728 ?auto_44729 ?auto_44730 ?auto_44731 ?auto_44732 ?auto_44733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44734 - BLOCK
      ?auto_44735 - BLOCK
      ?auto_44736 - BLOCK
      ?auto_44737 - BLOCK
      ?auto_44738 - BLOCK
      ?auto_44739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44734 ?auto_44735 ) ) ( not ( = ?auto_44734 ?auto_44736 ) ) ( not ( = ?auto_44734 ?auto_44737 ) ) ( not ( = ?auto_44734 ?auto_44738 ) ) ( not ( = ?auto_44734 ?auto_44739 ) ) ( not ( = ?auto_44735 ?auto_44736 ) ) ( not ( = ?auto_44735 ?auto_44737 ) ) ( not ( = ?auto_44735 ?auto_44738 ) ) ( not ( = ?auto_44735 ?auto_44739 ) ) ( not ( = ?auto_44736 ?auto_44737 ) ) ( not ( = ?auto_44736 ?auto_44738 ) ) ( not ( = ?auto_44736 ?auto_44739 ) ) ( not ( = ?auto_44737 ?auto_44738 ) ) ( not ( = ?auto_44737 ?auto_44739 ) ) ( not ( = ?auto_44738 ?auto_44739 ) ) ( ON-TABLE ?auto_44739 ) ( ON ?auto_44738 ?auto_44739 ) ( ON ?auto_44737 ?auto_44738 ) ( ON ?auto_44736 ?auto_44737 ) ( ON ?auto_44735 ?auto_44736 ) ( HOLDING ?auto_44734 ) ( CLEAR ?auto_44735 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44739 ?auto_44738 ?auto_44737 ?auto_44736 ?auto_44735 ?auto_44734 )
      ( MAKE-6PILE ?auto_44734 ?auto_44735 ?auto_44736 ?auto_44737 ?auto_44738 ?auto_44739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44740 - BLOCK
      ?auto_44741 - BLOCK
      ?auto_44742 - BLOCK
      ?auto_44743 - BLOCK
      ?auto_44744 - BLOCK
      ?auto_44745 - BLOCK
    )
    :vars
    (
      ?auto_44746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44740 ?auto_44741 ) ) ( not ( = ?auto_44740 ?auto_44742 ) ) ( not ( = ?auto_44740 ?auto_44743 ) ) ( not ( = ?auto_44740 ?auto_44744 ) ) ( not ( = ?auto_44740 ?auto_44745 ) ) ( not ( = ?auto_44741 ?auto_44742 ) ) ( not ( = ?auto_44741 ?auto_44743 ) ) ( not ( = ?auto_44741 ?auto_44744 ) ) ( not ( = ?auto_44741 ?auto_44745 ) ) ( not ( = ?auto_44742 ?auto_44743 ) ) ( not ( = ?auto_44742 ?auto_44744 ) ) ( not ( = ?auto_44742 ?auto_44745 ) ) ( not ( = ?auto_44743 ?auto_44744 ) ) ( not ( = ?auto_44743 ?auto_44745 ) ) ( not ( = ?auto_44744 ?auto_44745 ) ) ( ON-TABLE ?auto_44745 ) ( ON ?auto_44744 ?auto_44745 ) ( ON ?auto_44743 ?auto_44744 ) ( ON ?auto_44742 ?auto_44743 ) ( ON ?auto_44741 ?auto_44742 ) ( CLEAR ?auto_44741 ) ( ON ?auto_44740 ?auto_44746 ) ( CLEAR ?auto_44740 ) ( HAND-EMPTY ) ( not ( = ?auto_44740 ?auto_44746 ) ) ( not ( = ?auto_44741 ?auto_44746 ) ) ( not ( = ?auto_44742 ?auto_44746 ) ) ( not ( = ?auto_44743 ?auto_44746 ) ) ( not ( = ?auto_44744 ?auto_44746 ) ) ( not ( = ?auto_44745 ?auto_44746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44740 ?auto_44746 )
      ( MAKE-6PILE ?auto_44740 ?auto_44741 ?auto_44742 ?auto_44743 ?auto_44744 ?auto_44745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44747 - BLOCK
      ?auto_44748 - BLOCK
      ?auto_44749 - BLOCK
      ?auto_44750 - BLOCK
      ?auto_44751 - BLOCK
      ?auto_44752 - BLOCK
    )
    :vars
    (
      ?auto_44753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44747 ?auto_44748 ) ) ( not ( = ?auto_44747 ?auto_44749 ) ) ( not ( = ?auto_44747 ?auto_44750 ) ) ( not ( = ?auto_44747 ?auto_44751 ) ) ( not ( = ?auto_44747 ?auto_44752 ) ) ( not ( = ?auto_44748 ?auto_44749 ) ) ( not ( = ?auto_44748 ?auto_44750 ) ) ( not ( = ?auto_44748 ?auto_44751 ) ) ( not ( = ?auto_44748 ?auto_44752 ) ) ( not ( = ?auto_44749 ?auto_44750 ) ) ( not ( = ?auto_44749 ?auto_44751 ) ) ( not ( = ?auto_44749 ?auto_44752 ) ) ( not ( = ?auto_44750 ?auto_44751 ) ) ( not ( = ?auto_44750 ?auto_44752 ) ) ( not ( = ?auto_44751 ?auto_44752 ) ) ( ON-TABLE ?auto_44752 ) ( ON ?auto_44751 ?auto_44752 ) ( ON ?auto_44750 ?auto_44751 ) ( ON ?auto_44749 ?auto_44750 ) ( ON ?auto_44747 ?auto_44753 ) ( CLEAR ?auto_44747 ) ( not ( = ?auto_44747 ?auto_44753 ) ) ( not ( = ?auto_44748 ?auto_44753 ) ) ( not ( = ?auto_44749 ?auto_44753 ) ) ( not ( = ?auto_44750 ?auto_44753 ) ) ( not ( = ?auto_44751 ?auto_44753 ) ) ( not ( = ?auto_44752 ?auto_44753 ) ) ( HOLDING ?auto_44748 ) ( CLEAR ?auto_44749 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44752 ?auto_44751 ?auto_44750 ?auto_44749 ?auto_44748 )
      ( MAKE-6PILE ?auto_44747 ?auto_44748 ?auto_44749 ?auto_44750 ?auto_44751 ?auto_44752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44754 - BLOCK
      ?auto_44755 - BLOCK
      ?auto_44756 - BLOCK
      ?auto_44757 - BLOCK
      ?auto_44758 - BLOCK
      ?auto_44759 - BLOCK
    )
    :vars
    (
      ?auto_44760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44754 ?auto_44755 ) ) ( not ( = ?auto_44754 ?auto_44756 ) ) ( not ( = ?auto_44754 ?auto_44757 ) ) ( not ( = ?auto_44754 ?auto_44758 ) ) ( not ( = ?auto_44754 ?auto_44759 ) ) ( not ( = ?auto_44755 ?auto_44756 ) ) ( not ( = ?auto_44755 ?auto_44757 ) ) ( not ( = ?auto_44755 ?auto_44758 ) ) ( not ( = ?auto_44755 ?auto_44759 ) ) ( not ( = ?auto_44756 ?auto_44757 ) ) ( not ( = ?auto_44756 ?auto_44758 ) ) ( not ( = ?auto_44756 ?auto_44759 ) ) ( not ( = ?auto_44757 ?auto_44758 ) ) ( not ( = ?auto_44757 ?auto_44759 ) ) ( not ( = ?auto_44758 ?auto_44759 ) ) ( ON-TABLE ?auto_44759 ) ( ON ?auto_44758 ?auto_44759 ) ( ON ?auto_44757 ?auto_44758 ) ( ON ?auto_44756 ?auto_44757 ) ( ON ?auto_44754 ?auto_44760 ) ( not ( = ?auto_44754 ?auto_44760 ) ) ( not ( = ?auto_44755 ?auto_44760 ) ) ( not ( = ?auto_44756 ?auto_44760 ) ) ( not ( = ?auto_44757 ?auto_44760 ) ) ( not ( = ?auto_44758 ?auto_44760 ) ) ( not ( = ?auto_44759 ?auto_44760 ) ) ( CLEAR ?auto_44756 ) ( ON ?auto_44755 ?auto_44754 ) ( CLEAR ?auto_44755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44760 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44760 ?auto_44754 )
      ( MAKE-6PILE ?auto_44754 ?auto_44755 ?auto_44756 ?auto_44757 ?auto_44758 ?auto_44759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44761 - BLOCK
      ?auto_44762 - BLOCK
      ?auto_44763 - BLOCK
      ?auto_44764 - BLOCK
      ?auto_44765 - BLOCK
      ?auto_44766 - BLOCK
    )
    :vars
    (
      ?auto_44767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44761 ?auto_44762 ) ) ( not ( = ?auto_44761 ?auto_44763 ) ) ( not ( = ?auto_44761 ?auto_44764 ) ) ( not ( = ?auto_44761 ?auto_44765 ) ) ( not ( = ?auto_44761 ?auto_44766 ) ) ( not ( = ?auto_44762 ?auto_44763 ) ) ( not ( = ?auto_44762 ?auto_44764 ) ) ( not ( = ?auto_44762 ?auto_44765 ) ) ( not ( = ?auto_44762 ?auto_44766 ) ) ( not ( = ?auto_44763 ?auto_44764 ) ) ( not ( = ?auto_44763 ?auto_44765 ) ) ( not ( = ?auto_44763 ?auto_44766 ) ) ( not ( = ?auto_44764 ?auto_44765 ) ) ( not ( = ?auto_44764 ?auto_44766 ) ) ( not ( = ?auto_44765 ?auto_44766 ) ) ( ON-TABLE ?auto_44766 ) ( ON ?auto_44765 ?auto_44766 ) ( ON ?auto_44764 ?auto_44765 ) ( ON ?auto_44761 ?auto_44767 ) ( not ( = ?auto_44761 ?auto_44767 ) ) ( not ( = ?auto_44762 ?auto_44767 ) ) ( not ( = ?auto_44763 ?auto_44767 ) ) ( not ( = ?auto_44764 ?auto_44767 ) ) ( not ( = ?auto_44765 ?auto_44767 ) ) ( not ( = ?auto_44766 ?auto_44767 ) ) ( ON ?auto_44762 ?auto_44761 ) ( CLEAR ?auto_44762 ) ( ON-TABLE ?auto_44767 ) ( HOLDING ?auto_44763 ) ( CLEAR ?auto_44764 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44766 ?auto_44765 ?auto_44764 ?auto_44763 )
      ( MAKE-6PILE ?auto_44761 ?auto_44762 ?auto_44763 ?auto_44764 ?auto_44765 ?auto_44766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44768 - BLOCK
      ?auto_44769 - BLOCK
      ?auto_44770 - BLOCK
      ?auto_44771 - BLOCK
      ?auto_44772 - BLOCK
      ?auto_44773 - BLOCK
    )
    :vars
    (
      ?auto_44774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44768 ?auto_44769 ) ) ( not ( = ?auto_44768 ?auto_44770 ) ) ( not ( = ?auto_44768 ?auto_44771 ) ) ( not ( = ?auto_44768 ?auto_44772 ) ) ( not ( = ?auto_44768 ?auto_44773 ) ) ( not ( = ?auto_44769 ?auto_44770 ) ) ( not ( = ?auto_44769 ?auto_44771 ) ) ( not ( = ?auto_44769 ?auto_44772 ) ) ( not ( = ?auto_44769 ?auto_44773 ) ) ( not ( = ?auto_44770 ?auto_44771 ) ) ( not ( = ?auto_44770 ?auto_44772 ) ) ( not ( = ?auto_44770 ?auto_44773 ) ) ( not ( = ?auto_44771 ?auto_44772 ) ) ( not ( = ?auto_44771 ?auto_44773 ) ) ( not ( = ?auto_44772 ?auto_44773 ) ) ( ON-TABLE ?auto_44773 ) ( ON ?auto_44772 ?auto_44773 ) ( ON ?auto_44771 ?auto_44772 ) ( ON ?auto_44768 ?auto_44774 ) ( not ( = ?auto_44768 ?auto_44774 ) ) ( not ( = ?auto_44769 ?auto_44774 ) ) ( not ( = ?auto_44770 ?auto_44774 ) ) ( not ( = ?auto_44771 ?auto_44774 ) ) ( not ( = ?auto_44772 ?auto_44774 ) ) ( not ( = ?auto_44773 ?auto_44774 ) ) ( ON ?auto_44769 ?auto_44768 ) ( ON-TABLE ?auto_44774 ) ( CLEAR ?auto_44771 ) ( ON ?auto_44770 ?auto_44769 ) ( CLEAR ?auto_44770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44774 ?auto_44768 ?auto_44769 )
      ( MAKE-6PILE ?auto_44768 ?auto_44769 ?auto_44770 ?auto_44771 ?auto_44772 ?auto_44773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44775 - BLOCK
      ?auto_44776 - BLOCK
      ?auto_44777 - BLOCK
      ?auto_44778 - BLOCK
      ?auto_44779 - BLOCK
      ?auto_44780 - BLOCK
    )
    :vars
    (
      ?auto_44781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44775 ?auto_44776 ) ) ( not ( = ?auto_44775 ?auto_44777 ) ) ( not ( = ?auto_44775 ?auto_44778 ) ) ( not ( = ?auto_44775 ?auto_44779 ) ) ( not ( = ?auto_44775 ?auto_44780 ) ) ( not ( = ?auto_44776 ?auto_44777 ) ) ( not ( = ?auto_44776 ?auto_44778 ) ) ( not ( = ?auto_44776 ?auto_44779 ) ) ( not ( = ?auto_44776 ?auto_44780 ) ) ( not ( = ?auto_44777 ?auto_44778 ) ) ( not ( = ?auto_44777 ?auto_44779 ) ) ( not ( = ?auto_44777 ?auto_44780 ) ) ( not ( = ?auto_44778 ?auto_44779 ) ) ( not ( = ?auto_44778 ?auto_44780 ) ) ( not ( = ?auto_44779 ?auto_44780 ) ) ( ON-TABLE ?auto_44780 ) ( ON ?auto_44779 ?auto_44780 ) ( ON ?auto_44775 ?auto_44781 ) ( not ( = ?auto_44775 ?auto_44781 ) ) ( not ( = ?auto_44776 ?auto_44781 ) ) ( not ( = ?auto_44777 ?auto_44781 ) ) ( not ( = ?auto_44778 ?auto_44781 ) ) ( not ( = ?auto_44779 ?auto_44781 ) ) ( not ( = ?auto_44780 ?auto_44781 ) ) ( ON ?auto_44776 ?auto_44775 ) ( ON-TABLE ?auto_44781 ) ( ON ?auto_44777 ?auto_44776 ) ( CLEAR ?auto_44777 ) ( HOLDING ?auto_44778 ) ( CLEAR ?auto_44779 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44780 ?auto_44779 ?auto_44778 )
      ( MAKE-6PILE ?auto_44775 ?auto_44776 ?auto_44777 ?auto_44778 ?auto_44779 ?auto_44780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44782 - BLOCK
      ?auto_44783 - BLOCK
      ?auto_44784 - BLOCK
      ?auto_44785 - BLOCK
      ?auto_44786 - BLOCK
      ?auto_44787 - BLOCK
    )
    :vars
    (
      ?auto_44788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44782 ?auto_44783 ) ) ( not ( = ?auto_44782 ?auto_44784 ) ) ( not ( = ?auto_44782 ?auto_44785 ) ) ( not ( = ?auto_44782 ?auto_44786 ) ) ( not ( = ?auto_44782 ?auto_44787 ) ) ( not ( = ?auto_44783 ?auto_44784 ) ) ( not ( = ?auto_44783 ?auto_44785 ) ) ( not ( = ?auto_44783 ?auto_44786 ) ) ( not ( = ?auto_44783 ?auto_44787 ) ) ( not ( = ?auto_44784 ?auto_44785 ) ) ( not ( = ?auto_44784 ?auto_44786 ) ) ( not ( = ?auto_44784 ?auto_44787 ) ) ( not ( = ?auto_44785 ?auto_44786 ) ) ( not ( = ?auto_44785 ?auto_44787 ) ) ( not ( = ?auto_44786 ?auto_44787 ) ) ( ON-TABLE ?auto_44787 ) ( ON ?auto_44786 ?auto_44787 ) ( ON ?auto_44782 ?auto_44788 ) ( not ( = ?auto_44782 ?auto_44788 ) ) ( not ( = ?auto_44783 ?auto_44788 ) ) ( not ( = ?auto_44784 ?auto_44788 ) ) ( not ( = ?auto_44785 ?auto_44788 ) ) ( not ( = ?auto_44786 ?auto_44788 ) ) ( not ( = ?auto_44787 ?auto_44788 ) ) ( ON ?auto_44783 ?auto_44782 ) ( ON-TABLE ?auto_44788 ) ( ON ?auto_44784 ?auto_44783 ) ( CLEAR ?auto_44786 ) ( ON ?auto_44785 ?auto_44784 ) ( CLEAR ?auto_44785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44788 ?auto_44782 ?auto_44783 ?auto_44784 )
      ( MAKE-6PILE ?auto_44782 ?auto_44783 ?auto_44784 ?auto_44785 ?auto_44786 ?auto_44787 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44789 - BLOCK
      ?auto_44790 - BLOCK
      ?auto_44791 - BLOCK
      ?auto_44792 - BLOCK
      ?auto_44793 - BLOCK
      ?auto_44794 - BLOCK
    )
    :vars
    (
      ?auto_44795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44789 ?auto_44790 ) ) ( not ( = ?auto_44789 ?auto_44791 ) ) ( not ( = ?auto_44789 ?auto_44792 ) ) ( not ( = ?auto_44789 ?auto_44793 ) ) ( not ( = ?auto_44789 ?auto_44794 ) ) ( not ( = ?auto_44790 ?auto_44791 ) ) ( not ( = ?auto_44790 ?auto_44792 ) ) ( not ( = ?auto_44790 ?auto_44793 ) ) ( not ( = ?auto_44790 ?auto_44794 ) ) ( not ( = ?auto_44791 ?auto_44792 ) ) ( not ( = ?auto_44791 ?auto_44793 ) ) ( not ( = ?auto_44791 ?auto_44794 ) ) ( not ( = ?auto_44792 ?auto_44793 ) ) ( not ( = ?auto_44792 ?auto_44794 ) ) ( not ( = ?auto_44793 ?auto_44794 ) ) ( ON-TABLE ?auto_44794 ) ( ON ?auto_44789 ?auto_44795 ) ( not ( = ?auto_44789 ?auto_44795 ) ) ( not ( = ?auto_44790 ?auto_44795 ) ) ( not ( = ?auto_44791 ?auto_44795 ) ) ( not ( = ?auto_44792 ?auto_44795 ) ) ( not ( = ?auto_44793 ?auto_44795 ) ) ( not ( = ?auto_44794 ?auto_44795 ) ) ( ON ?auto_44790 ?auto_44789 ) ( ON-TABLE ?auto_44795 ) ( ON ?auto_44791 ?auto_44790 ) ( ON ?auto_44792 ?auto_44791 ) ( CLEAR ?auto_44792 ) ( HOLDING ?auto_44793 ) ( CLEAR ?auto_44794 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44794 ?auto_44793 )
      ( MAKE-6PILE ?auto_44789 ?auto_44790 ?auto_44791 ?auto_44792 ?auto_44793 ?auto_44794 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44796 - BLOCK
      ?auto_44797 - BLOCK
      ?auto_44798 - BLOCK
      ?auto_44799 - BLOCK
      ?auto_44800 - BLOCK
      ?auto_44801 - BLOCK
    )
    :vars
    (
      ?auto_44802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44796 ?auto_44797 ) ) ( not ( = ?auto_44796 ?auto_44798 ) ) ( not ( = ?auto_44796 ?auto_44799 ) ) ( not ( = ?auto_44796 ?auto_44800 ) ) ( not ( = ?auto_44796 ?auto_44801 ) ) ( not ( = ?auto_44797 ?auto_44798 ) ) ( not ( = ?auto_44797 ?auto_44799 ) ) ( not ( = ?auto_44797 ?auto_44800 ) ) ( not ( = ?auto_44797 ?auto_44801 ) ) ( not ( = ?auto_44798 ?auto_44799 ) ) ( not ( = ?auto_44798 ?auto_44800 ) ) ( not ( = ?auto_44798 ?auto_44801 ) ) ( not ( = ?auto_44799 ?auto_44800 ) ) ( not ( = ?auto_44799 ?auto_44801 ) ) ( not ( = ?auto_44800 ?auto_44801 ) ) ( ON-TABLE ?auto_44801 ) ( ON ?auto_44796 ?auto_44802 ) ( not ( = ?auto_44796 ?auto_44802 ) ) ( not ( = ?auto_44797 ?auto_44802 ) ) ( not ( = ?auto_44798 ?auto_44802 ) ) ( not ( = ?auto_44799 ?auto_44802 ) ) ( not ( = ?auto_44800 ?auto_44802 ) ) ( not ( = ?auto_44801 ?auto_44802 ) ) ( ON ?auto_44797 ?auto_44796 ) ( ON-TABLE ?auto_44802 ) ( ON ?auto_44798 ?auto_44797 ) ( ON ?auto_44799 ?auto_44798 ) ( CLEAR ?auto_44801 ) ( ON ?auto_44800 ?auto_44799 ) ( CLEAR ?auto_44800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44802 ?auto_44796 ?auto_44797 ?auto_44798 ?auto_44799 )
      ( MAKE-6PILE ?auto_44796 ?auto_44797 ?auto_44798 ?auto_44799 ?auto_44800 ?auto_44801 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44803 - BLOCK
      ?auto_44804 - BLOCK
      ?auto_44805 - BLOCK
      ?auto_44806 - BLOCK
      ?auto_44807 - BLOCK
      ?auto_44808 - BLOCK
    )
    :vars
    (
      ?auto_44809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44803 ?auto_44804 ) ) ( not ( = ?auto_44803 ?auto_44805 ) ) ( not ( = ?auto_44803 ?auto_44806 ) ) ( not ( = ?auto_44803 ?auto_44807 ) ) ( not ( = ?auto_44803 ?auto_44808 ) ) ( not ( = ?auto_44804 ?auto_44805 ) ) ( not ( = ?auto_44804 ?auto_44806 ) ) ( not ( = ?auto_44804 ?auto_44807 ) ) ( not ( = ?auto_44804 ?auto_44808 ) ) ( not ( = ?auto_44805 ?auto_44806 ) ) ( not ( = ?auto_44805 ?auto_44807 ) ) ( not ( = ?auto_44805 ?auto_44808 ) ) ( not ( = ?auto_44806 ?auto_44807 ) ) ( not ( = ?auto_44806 ?auto_44808 ) ) ( not ( = ?auto_44807 ?auto_44808 ) ) ( ON ?auto_44803 ?auto_44809 ) ( not ( = ?auto_44803 ?auto_44809 ) ) ( not ( = ?auto_44804 ?auto_44809 ) ) ( not ( = ?auto_44805 ?auto_44809 ) ) ( not ( = ?auto_44806 ?auto_44809 ) ) ( not ( = ?auto_44807 ?auto_44809 ) ) ( not ( = ?auto_44808 ?auto_44809 ) ) ( ON ?auto_44804 ?auto_44803 ) ( ON-TABLE ?auto_44809 ) ( ON ?auto_44805 ?auto_44804 ) ( ON ?auto_44806 ?auto_44805 ) ( ON ?auto_44807 ?auto_44806 ) ( CLEAR ?auto_44807 ) ( HOLDING ?auto_44808 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44808 )
      ( MAKE-6PILE ?auto_44803 ?auto_44804 ?auto_44805 ?auto_44806 ?auto_44807 ?auto_44808 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44810 - BLOCK
      ?auto_44811 - BLOCK
      ?auto_44812 - BLOCK
      ?auto_44813 - BLOCK
      ?auto_44814 - BLOCK
      ?auto_44815 - BLOCK
    )
    :vars
    (
      ?auto_44816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44810 ?auto_44811 ) ) ( not ( = ?auto_44810 ?auto_44812 ) ) ( not ( = ?auto_44810 ?auto_44813 ) ) ( not ( = ?auto_44810 ?auto_44814 ) ) ( not ( = ?auto_44810 ?auto_44815 ) ) ( not ( = ?auto_44811 ?auto_44812 ) ) ( not ( = ?auto_44811 ?auto_44813 ) ) ( not ( = ?auto_44811 ?auto_44814 ) ) ( not ( = ?auto_44811 ?auto_44815 ) ) ( not ( = ?auto_44812 ?auto_44813 ) ) ( not ( = ?auto_44812 ?auto_44814 ) ) ( not ( = ?auto_44812 ?auto_44815 ) ) ( not ( = ?auto_44813 ?auto_44814 ) ) ( not ( = ?auto_44813 ?auto_44815 ) ) ( not ( = ?auto_44814 ?auto_44815 ) ) ( ON ?auto_44810 ?auto_44816 ) ( not ( = ?auto_44810 ?auto_44816 ) ) ( not ( = ?auto_44811 ?auto_44816 ) ) ( not ( = ?auto_44812 ?auto_44816 ) ) ( not ( = ?auto_44813 ?auto_44816 ) ) ( not ( = ?auto_44814 ?auto_44816 ) ) ( not ( = ?auto_44815 ?auto_44816 ) ) ( ON ?auto_44811 ?auto_44810 ) ( ON-TABLE ?auto_44816 ) ( ON ?auto_44812 ?auto_44811 ) ( ON ?auto_44813 ?auto_44812 ) ( ON ?auto_44814 ?auto_44813 ) ( ON ?auto_44815 ?auto_44814 ) ( CLEAR ?auto_44815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44816 ?auto_44810 ?auto_44811 ?auto_44812 ?auto_44813 ?auto_44814 )
      ( MAKE-6PILE ?auto_44810 ?auto_44811 ?auto_44812 ?auto_44813 ?auto_44814 ?auto_44815 ) )
  )

)

