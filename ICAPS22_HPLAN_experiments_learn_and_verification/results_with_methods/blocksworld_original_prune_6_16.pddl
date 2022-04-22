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
      ?auto_60058 - BLOCK
      ?auto_60059 - BLOCK
      ?auto_60060 - BLOCK
      ?auto_60061 - BLOCK
      ?auto_60062 - BLOCK
      ?auto_60063 - BLOCK
    )
    :vars
    (
      ?auto_60064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60064 ?auto_60063 ) ( CLEAR ?auto_60064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60058 ) ( ON ?auto_60059 ?auto_60058 ) ( ON ?auto_60060 ?auto_60059 ) ( ON ?auto_60061 ?auto_60060 ) ( ON ?auto_60062 ?auto_60061 ) ( ON ?auto_60063 ?auto_60062 ) ( not ( = ?auto_60058 ?auto_60059 ) ) ( not ( = ?auto_60058 ?auto_60060 ) ) ( not ( = ?auto_60058 ?auto_60061 ) ) ( not ( = ?auto_60058 ?auto_60062 ) ) ( not ( = ?auto_60058 ?auto_60063 ) ) ( not ( = ?auto_60058 ?auto_60064 ) ) ( not ( = ?auto_60059 ?auto_60060 ) ) ( not ( = ?auto_60059 ?auto_60061 ) ) ( not ( = ?auto_60059 ?auto_60062 ) ) ( not ( = ?auto_60059 ?auto_60063 ) ) ( not ( = ?auto_60059 ?auto_60064 ) ) ( not ( = ?auto_60060 ?auto_60061 ) ) ( not ( = ?auto_60060 ?auto_60062 ) ) ( not ( = ?auto_60060 ?auto_60063 ) ) ( not ( = ?auto_60060 ?auto_60064 ) ) ( not ( = ?auto_60061 ?auto_60062 ) ) ( not ( = ?auto_60061 ?auto_60063 ) ) ( not ( = ?auto_60061 ?auto_60064 ) ) ( not ( = ?auto_60062 ?auto_60063 ) ) ( not ( = ?auto_60062 ?auto_60064 ) ) ( not ( = ?auto_60063 ?auto_60064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60064 ?auto_60063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60066 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60066 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_60066 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60067 - BLOCK
    )
    :vars
    (
      ?auto_60068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60067 ?auto_60068 ) ( CLEAR ?auto_60067 ) ( HAND-EMPTY ) ( not ( = ?auto_60067 ?auto_60068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60067 ?auto_60068 )
      ( MAKE-1PILE ?auto_60067 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60074 - BLOCK
      ?auto_60075 - BLOCK
      ?auto_60076 - BLOCK
      ?auto_60077 - BLOCK
      ?auto_60078 - BLOCK
    )
    :vars
    (
      ?auto_60079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60079 ?auto_60078 ) ( CLEAR ?auto_60079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60074 ) ( ON ?auto_60075 ?auto_60074 ) ( ON ?auto_60076 ?auto_60075 ) ( ON ?auto_60077 ?auto_60076 ) ( ON ?auto_60078 ?auto_60077 ) ( not ( = ?auto_60074 ?auto_60075 ) ) ( not ( = ?auto_60074 ?auto_60076 ) ) ( not ( = ?auto_60074 ?auto_60077 ) ) ( not ( = ?auto_60074 ?auto_60078 ) ) ( not ( = ?auto_60074 ?auto_60079 ) ) ( not ( = ?auto_60075 ?auto_60076 ) ) ( not ( = ?auto_60075 ?auto_60077 ) ) ( not ( = ?auto_60075 ?auto_60078 ) ) ( not ( = ?auto_60075 ?auto_60079 ) ) ( not ( = ?auto_60076 ?auto_60077 ) ) ( not ( = ?auto_60076 ?auto_60078 ) ) ( not ( = ?auto_60076 ?auto_60079 ) ) ( not ( = ?auto_60077 ?auto_60078 ) ) ( not ( = ?auto_60077 ?auto_60079 ) ) ( not ( = ?auto_60078 ?auto_60079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60079 ?auto_60078 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60080 - BLOCK
      ?auto_60081 - BLOCK
      ?auto_60082 - BLOCK
      ?auto_60083 - BLOCK
      ?auto_60084 - BLOCK
    )
    :vars
    (
      ?auto_60085 - BLOCK
      ?auto_60086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60085 ?auto_60084 ) ( CLEAR ?auto_60085 ) ( ON-TABLE ?auto_60080 ) ( ON ?auto_60081 ?auto_60080 ) ( ON ?auto_60082 ?auto_60081 ) ( ON ?auto_60083 ?auto_60082 ) ( ON ?auto_60084 ?auto_60083 ) ( not ( = ?auto_60080 ?auto_60081 ) ) ( not ( = ?auto_60080 ?auto_60082 ) ) ( not ( = ?auto_60080 ?auto_60083 ) ) ( not ( = ?auto_60080 ?auto_60084 ) ) ( not ( = ?auto_60080 ?auto_60085 ) ) ( not ( = ?auto_60081 ?auto_60082 ) ) ( not ( = ?auto_60081 ?auto_60083 ) ) ( not ( = ?auto_60081 ?auto_60084 ) ) ( not ( = ?auto_60081 ?auto_60085 ) ) ( not ( = ?auto_60082 ?auto_60083 ) ) ( not ( = ?auto_60082 ?auto_60084 ) ) ( not ( = ?auto_60082 ?auto_60085 ) ) ( not ( = ?auto_60083 ?auto_60084 ) ) ( not ( = ?auto_60083 ?auto_60085 ) ) ( not ( = ?auto_60084 ?auto_60085 ) ) ( HOLDING ?auto_60086 ) ( not ( = ?auto_60080 ?auto_60086 ) ) ( not ( = ?auto_60081 ?auto_60086 ) ) ( not ( = ?auto_60082 ?auto_60086 ) ) ( not ( = ?auto_60083 ?auto_60086 ) ) ( not ( = ?auto_60084 ?auto_60086 ) ) ( not ( = ?auto_60085 ?auto_60086 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_60086 )
      ( MAKE-5PILE ?auto_60080 ?auto_60081 ?auto_60082 ?auto_60083 ?auto_60084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60087 - BLOCK
      ?auto_60088 - BLOCK
      ?auto_60089 - BLOCK
      ?auto_60090 - BLOCK
      ?auto_60091 - BLOCK
    )
    :vars
    (
      ?auto_60093 - BLOCK
      ?auto_60092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60093 ?auto_60091 ) ( ON-TABLE ?auto_60087 ) ( ON ?auto_60088 ?auto_60087 ) ( ON ?auto_60089 ?auto_60088 ) ( ON ?auto_60090 ?auto_60089 ) ( ON ?auto_60091 ?auto_60090 ) ( not ( = ?auto_60087 ?auto_60088 ) ) ( not ( = ?auto_60087 ?auto_60089 ) ) ( not ( = ?auto_60087 ?auto_60090 ) ) ( not ( = ?auto_60087 ?auto_60091 ) ) ( not ( = ?auto_60087 ?auto_60093 ) ) ( not ( = ?auto_60088 ?auto_60089 ) ) ( not ( = ?auto_60088 ?auto_60090 ) ) ( not ( = ?auto_60088 ?auto_60091 ) ) ( not ( = ?auto_60088 ?auto_60093 ) ) ( not ( = ?auto_60089 ?auto_60090 ) ) ( not ( = ?auto_60089 ?auto_60091 ) ) ( not ( = ?auto_60089 ?auto_60093 ) ) ( not ( = ?auto_60090 ?auto_60091 ) ) ( not ( = ?auto_60090 ?auto_60093 ) ) ( not ( = ?auto_60091 ?auto_60093 ) ) ( not ( = ?auto_60087 ?auto_60092 ) ) ( not ( = ?auto_60088 ?auto_60092 ) ) ( not ( = ?auto_60089 ?auto_60092 ) ) ( not ( = ?auto_60090 ?auto_60092 ) ) ( not ( = ?auto_60091 ?auto_60092 ) ) ( not ( = ?auto_60093 ?auto_60092 ) ) ( ON ?auto_60092 ?auto_60093 ) ( CLEAR ?auto_60092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60087 ?auto_60088 ?auto_60089 ?auto_60090 ?auto_60091 ?auto_60093 )
      ( MAKE-5PILE ?auto_60087 ?auto_60088 ?auto_60089 ?auto_60090 ?auto_60091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60096 - BLOCK
      ?auto_60097 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60097 ) ( CLEAR ?auto_60096 ) ( ON-TABLE ?auto_60096 ) ( not ( = ?auto_60096 ?auto_60097 ) ) )
    :subtasks
    ( ( !STACK ?auto_60097 ?auto_60096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60098 - BLOCK
      ?auto_60099 - BLOCK
    )
    :vars
    (
      ?auto_60100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60098 ) ( ON-TABLE ?auto_60098 ) ( not ( = ?auto_60098 ?auto_60099 ) ) ( ON ?auto_60099 ?auto_60100 ) ( CLEAR ?auto_60099 ) ( HAND-EMPTY ) ( not ( = ?auto_60098 ?auto_60100 ) ) ( not ( = ?auto_60099 ?auto_60100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60099 ?auto_60100 )
      ( MAKE-2PILE ?auto_60098 ?auto_60099 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60101 - BLOCK
      ?auto_60102 - BLOCK
    )
    :vars
    (
      ?auto_60103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60101 ?auto_60102 ) ) ( ON ?auto_60102 ?auto_60103 ) ( CLEAR ?auto_60102 ) ( not ( = ?auto_60101 ?auto_60103 ) ) ( not ( = ?auto_60102 ?auto_60103 ) ) ( HOLDING ?auto_60101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60101 )
      ( MAKE-2PILE ?auto_60101 ?auto_60102 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60104 - BLOCK
      ?auto_60105 - BLOCK
    )
    :vars
    (
      ?auto_60106 - BLOCK
      ?auto_60109 - BLOCK
      ?auto_60107 - BLOCK
      ?auto_60110 - BLOCK
      ?auto_60108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60104 ?auto_60105 ) ) ( ON ?auto_60105 ?auto_60106 ) ( not ( = ?auto_60104 ?auto_60106 ) ) ( not ( = ?auto_60105 ?auto_60106 ) ) ( ON ?auto_60104 ?auto_60105 ) ( CLEAR ?auto_60104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60109 ) ( ON ?auto_60107 ?auto_60109 ) ( ON ?auto_60110 ?auto_60107 ) ( ON ?auto_60108 ?auto_60110 ) ( ON ?auto_60106 ?auto_60108 ) ( not ( = ?auto_60109 ?auto_60107 ) ) ( not ( = ?auto_60109 ?auto_60110 ) ) ( not ( = ?auto_60109 ?auto_60108 ) ) ( not ( = ?auto_60109 ?auto_60106 ) ) ( not ( = ?auto_60109 ?auto_60105 ) ) ( not ( = ?auto_60109 ?auto_60104 ) ) ( not ( = ?auto_60107 ?auto_60110 ) ) ( not ( = ?auto_60107 ?auto_60108 ) ) ( not ( = ?auto_60107 ?auto_60106 ) ) ( not ( = ?auto_60107 ?auto_60105 ) ) ( not ( = ?auto_60107 ?auto_60104 ) ) ( not ( = ?auto_60110 ?auto_60108 ) ) ( not ( = ?auto_60110 ?auto_60106 ) ) ( not ( = ?auto_60110 ?auto_60105 ) ) ( not ( = ?auto_60110 ?auto_60104 ) ) ( not ( = ?auto_60108 ?auto_60106 ) ) ( not ( = ?auto_60108 ?auto_60105 ) ) ( not ( = ?auto_60108 ?auto_60104 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60109 ?auto_60107 ?auto_60110 ?auto_60108 ?auto_60106 ?auto_60105 )
      ( MAKE-2PILE ?auto_60104 ?auto_60105 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60115 - BLOCK
      ?auto_60116 - BLOCK
      ?auto_60117 - BLOCK
      ?auto_60118 - BLOCK
    )
    :vars
    (
      ?auto_60119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60119 ?auto_60118 ) ( CLEAR ?auto_60119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60115 ) ( ON ?auto_60116 ?auto_60115 ) ( ON ?auto_60117 ?auto_60116 ) ( ON ?auto_60118 ?auto_60117 ) ( not ( = ?auto_60115 ?auto_60116 ) ) ( not ( = ?auto_60115 ?auto_60117 ) ) ( not ( = ?auto_60115 ?auto_60118 ) ) ( not ( = ?auto_60115 ?auto_60119 ) ) ( not ( = ?auto_60116 ?auto_60117 ) ) ( not ( = ?auto_60116 ?auto_60118 ) ) ( not ( = ?auto_60116 ?auto_60119 ) ) ( not ( = ?auto_60117 ?auto_60118 ) ) ( not ( = ?auto_60117 ?auto_60119 ) ) ( not ( = ?auto_60118 ?auto_60119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60119 ?auto_60118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60120 - BLOCK
      ?auto_60121 - BLOCK
      ?auto_60122 - BLOCK
      ?auto_60123 - BLOCK
    )
    :vars
    (
      ?auto_60124 - BLOCK
      ?auto_60125 - BLOCK
      ?auto_60126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60124 ?auto_60123 ) ( CLEAR ?auto_60124 ) ( ON-TABLE ?auto_60120 ) ( ON ?auto_60121 ?auto_60120 ) ( ON ?auto_60122 ?auto_60121 ) ( ON ?auto_60123 ?auto_60122 ) ( not ( = ?auto_60120 ?auto_60121 ) ) ( not ( = ?auto_60120 ?auto_60122 ) ) ( not ( = ?auto_60120 ?auto_60123 ) ) ( not ( = ?auto_60120 ?auto_60124 ) ) ( not ( = ?auto_60121 ?auto_60122 ) ) ( not ( = ?auto_60121 ?auto_60123 ) ) ( not ( = ?auto_60121 ?auto_60124 ) ) ( not ( = ?auto_60122 ?auto_60123 ) ) ( not ( = ?auto_60122 ?auto_60124 ) ) ( not ( = ?auto_60123 ?auto_60124 ) ) ( HOLDING ?auto_60125 ) ( CLEAR ?auto_60126 ) ( not ( = ?auto_60120 ?auto_60125 ) ) ( not ( = ?auto_60120 ?auto_60126 ) ) ( not ( = ?auto_60121 ?auto_60125 ) ) ( not ( = ?auto_60121 ?auto_60126 ) ) ( not ( = ?auto_60122 ?auto_60125 ) ) ( not ( = ?auto_60122 ?auto_60126 ) ) ( not ( = ?auto_60123 ?auto_60125 ) ) ( not ( = ?auto_60123 ?auto_60126 ) ) ( not ( = ?auto_60124 ?auto_60125 ) ) ( not ( = ?auto_60124 ?auto_60126 ) ) ( not ( = ?auto_60125 ?auto_60126 ) ) )
    :subtasks
    ( ( !STACK ?auto_60125 ?auto_60126 )
      ( MAKE-4PILE ?auto_60120 ?auto_60121 ?auto_60122 ?auto_60123 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60726 - BLOCK
      ?auto_60727 - BLOCK
      ?auto_60728 - BLOCK
      ?auto_60729 - BLOCK
    )
    :vars
    (
      ?auto_60730 - BLOCK
      ?auto_60731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60730 ?auto_60729 ) ( ON-TABLE ?auto_60726 ) ( ON ?auto_60727 ?auto_60726 ) ( ON ?auto_60728 ?auto_60727 ) ( ON ?auto_60729 ?auto_60728 ) ( not ( = ?auto_60726 ?auto_60727 ) ) ( not ( = ?auto_60726 ?auto_60728 ) ) ( not ( = ?auto_60726 ?auto_60729 ) ) ( not ( = ?auto_60726 ?auto_60730 ) ) ( not ( = ?auto_60727 ?auto_60728 ) ) ( not ( = ?auto_60727 ?auto_60729 ) ) ( not ( = ?auto_60727 ?auto_60730 ) ) ( not ( = ?auto_60728 ?auto_60729 ) ) ( not ( = ?auto_60728 ?auto_60730 ) ) ( not ( = ?auto_60729 ?auto_60730 ) ) ( not ( = ?auto_60726 ?auto_60731 ) ) ( not ( = ?auto_60727 ?auto_60731 ) ) ( not ( = ?auto_60728 ?auto_60731 ) ) ( not ( = ?auto_60729 ?auto_60731 ) ) ( not ( = ?auto_60730 ?auto_60731 ) ) ( ON ?auto_60731 ?auto_60730 ) ( CLEAR ?auto_60731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60726 ?auto_60727 ?auto_60728 ?auto_60729 ?auto_60730 )
      ( MAKE-4PILE ?auto_60726 ?auto_60727 ?auto_60728 ?auto_60729 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60134 - BLOCK
      ?auto_60135 - BLOCK
      ?auto_60136 - BLOCK
      ?auto_60137 - BLOCK
    )
    :vars
    (
      ?auto_60138 - BLOCK
      ?auto_60140 - BLOCK
      ?auto_60139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60138 ?auto_60137 ) ( ON-TABLE ?auto_60134 ) ( ON ?auto_60135 ?auto_60134 ) ( ON ?auto_60136 ?auto_60135 ) ( ON ?auto_60137 ?auto_60136 ) ( not ( = ?auto_60134 ?auto_60135 ) ) ( not ( = ?auto_60134 ?auto_60136 ) ) ( not ( = ?auto_60134 ?auto_60137 ) ) ( not ( = ?auto_60134 ?auto_60138 ) ) ( not ( = ?auto_60135 ?auto_60136 ) ) ( not ( = ?auto_60135 ?auto_60137 ) ) ( not ( = ?auto_60135 ?auto_60138 ) ) ( not ( = ?auto_60136 ?auto_60137 ) ) ( not ( = ?auto_60136 ?auto_60138 ) ) ( not ( = ?auto_60137 ?auto_60138 ) ) ( not ( = ?auto_60134 ?auto_60140 ) ) ( not ( = ?auto_60134 ?auto_60139 ) ) ( not ( = ?auto_60135 ?auto_60140 ) ) ( not ( = ?auto_60135 ?auto_60139 ) ) ( not ( = ?auto_60136 ?auto_60140 ) ) ( not ( = ?auto_60136 ?auto_60139 ) ) ( not ( = ?auto_60137 ?auto_60140 ) ) ( not ( = ?auto_60137 ?auto_60139 ) ) ( not ( = ?auto_60138 ?auto_60140 ) ) ( not ( = ?auto_60138 ?auto_60139 ) ) ( not ( = ?auto_60140 ?auto_60139 ) ) ( ON ?auto_60140 ?auto_60138 ) ( CLEAR ?auto_60140 ) ( HOLDING ?auto_60139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60139 )
      ( MAKE-4PILE ?auto_60134 ?auto_60135 ?auto_60136 ?auto_60137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60141 - BLOCK
      ?auto_60142 - BLOCK
      ?auto_60143 - BLOCK
      ?auto_60144 - BLOCK
    )
    :vars
    (
      ?auto_60147 - BLOCK
      ?auto_60146 - BLOCK
      ?auto_60145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60147 ?auto_60144 ) ( ON-TABLE ?auto_60141 ) ( ON ?auto_60142 ?auto_60141 ) ( ON ?auto_60143 ?auto_60142 ) ( ON ?auto_60144 ?auto_60143 ) ( not ( = ?auto_60141 ?auto_60142 ) ) ( not ( = ?auto_60141 ?auto_60143 ) ) ( not ( = ?auto_60141 ?auto_60144 ) ) ( not ( = ?auto_60141 ?auto_60147 ) ) ( not ( = ?auto_60142 ?auto_60143 ) ) ( not ( = ?auto_60142 ?auto_60144 ) ) ( not ( = ?auto_60142 ?auto_60147 ) ) ( not ( = ?auto_60143 ?auto_60144 ) ) ( not ( = ?auto_60143 ?auto_60147 ) ) ( not ( = ?auto_60144 ?auto_60147 ) ) ( not ( = ?auto_60141 ?auto_60146 ) ) ( not ( = ?auto_60141 ?auto_60145 ) ) ( not ( = ?auto_60142 ?auto_60146 ) ) ( not ( = ?auto_60142 ?auto_60145 ) ) ( not ( = ?auto_60143 ?auto_60146 ) ) ( not ( = ?auto_60143 ?auto_60145 ) ) ( not ( = ?auto_60144 ?auto_60146 ) ) ( not ( = ?auto_60144 ?auto_60145 ) ) ( not ( = ?auto_60147 ?auto_60146 ) ) ( not ( = ?auto_60147 ?auto_60145 ) ) ( not ( = ?auto_60146 ?auto_60145 ) ) ( ON ?auto_60146 ?auto_60147 ) ( ON ?auto_60145 ?auto_60146 ) ( CLEAR ?auto_60145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60141 ?auto_60142 ?auto_60143 ?auto_60144 ?auto_60147 ?auto_60146 )
      ( MAKE-4PILE ?auto_60141 ?auto_60142 ?auto_60143 ?auto_60144 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60151 - BLOCK
      ?auto_60152 - BLOCK
      ?auto_60153 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60153 ) ( CLEAR ?auto_60152 ) ( ON-TABLE ?auto_60151 ) ( ON ?auto_60152 ?auto_60151 ) ( not ( = ?auto_60151 ?auto_60152 ) ) ( not ( = ?auto_60151 ?auto_60153 ) ) ( not ( = ?auto_60152 ?auto_60153 ) ) )
    :subtasks
    ( ( !STACK ?auto_60153 ?auto_60152 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60154 - BLOCK
      ?auto_60155 - BLOCK
      ?auto_60156 - BLOCK
    )
    :vars
    (
      ?auto_60157 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60155 ) ( ON-TABLE ?auto_60154 ) ( ON ?auto_60155 ?auto_60154 ) ( not ( = ?auto_60154 ?auto_60155 ) ) ( not ( = ?auto_60154 ?auto_60156 ) ) ( not ( = ?auto_60155 ?auto_60156 ) ) ( ON ?auto_60156 ?auto_60157 ) ( CLEAR ?auto_60156 ) ( HAND-EMPTY ) ( not ( = ?auto_60154 ?auto_60157 ) ) ( not ( = ?auto_60155 ?auto_60157 ) ) ( not ( = ?auto_60156 ?auto_60157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60156 ?auto_60157 )
      ( MAKE-3PILE ?auto_60154 ?auto_60155 ?auto_60156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60158 - BLOCK
      ?auto_60159 - BLOCK
      ?auto_60160 - BLOCK
    )
    :vars
    (
      ?auto_60161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60158 ) ( not ( = ?auto_60158 ?auto_60159 ) ) ( not ( = ?auto_60158 ?auto_60160 ) ) ( not ( = ?auto_60159 ?auto_60160 ) ) ( ON ?auto_60160 ?auto_60161 ) ( CLEAR ?auto_60160 ) ( not ( = ?auto_60158 ?auto_60161 ) ) ( not ( = ?auto_60159 ?auto_60161 ) ) ( not ( = ?auto_60160 ?auto_60161 ) ) ( HOLDING ?auto_60159 ) ( CLEAR ?auto_60158 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60158 ?auto_60159 )
      ( MAKE-3PILE ?auto_60158 ?auto_60159 ?auto_60160 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60162 - BLOCK
      ?auto_60163 - BLOCK
      ?auto_60164 - BLOCK
    )
    :vars
    (
      ?auto_60165 - BLOCK
      ?auto_60166 - BLOCK
      ?auto_60168 - BLOCK
      ?auto_60167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60162 ) ( not ( = ?auto_60162 ?auto_60163 ) ) ( not ( = ?auto_60162 ?auto_60164 ) ) ( not ( = ?auto_60163 ?auto_60164 ) ) ( ON ?auto_60164 ?auto_60165 ) ( not ( = ?auto_60162 ?auto_60165 ) ) ( not ( = ?auto_60163 ?auto_60165 ) ) ( not ( = ?auto_60164 ?auto_60165 ) ) ( CLEAR ?auto_60162 ) ( ON ?auto_60163 ?auto_60164 ) ( CLEAR ?auto_60163 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60166 ) ( ON ?auto_60168 ?auto_60166 ) ( ON ?auto_60167 ?auto_60168 ) ( ON ?auto_60165 ?auto_60167 ) ( not ( = ?auto_60166 ?auto_60168 ) ) ( not ( = ?auto_60166 ?auto_60167 ) ) ( not ( = ?auto_60166 ?auto_60165 ) ) ( not ( = ?auto_60166 ?auto_60164 ) ) ( not ( = ?auto_60166 ?auto_60163 ) ) ( not ( = ?auto_60168 ?auto_60167 ) ) ( not ( = ?auto_60168 ?auto_60165 ) ) ( not ( = ?auto_60168 ?auto_60164 ) ) ( not ( = ?auto_60168 ?auto_60163 ) ) ( not ( = ?auto_60167 ?auto_60165 ) ) ( not ( = ?auto_60167 ?auto_60164 ) ) ( not ( = ?auto_60167 ?auto_60163 ) ) ( not ( = ?auto_60162 ?auto_60166 ) ) ( not ( = ?auto_60162 ?auto_60168 ) ) ( not ( = ?auto_60162 ?auto_60167 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60166 ?auto_60168 ?auto_60167 ?auto_60165 ?auto_60164 )
      ( MAKE-3PILE ?auto_60162 ?auto_60163 ?auto_60164 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60169 - BLOCK
      ?auto_60170 - BLOCK
      ?auto_60171 - BLOCK
    )
    :vars
    (
      ?auto_60174 - BLOCK
      ?auto_60175 - BLOCK
      ?auto_60173 - BLOCK
      ?auto_60172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60169 ?auto_60170 ) ) ( not ( = ?auto_60169 ?auto_60171 ) ) ( not ( = ?auto_60170 ?auto_60171 ) ) ( ON ?auto_60171 ?auto_60174 ) ( not ( = ?auto_60169 ?auto_60174 ) ) ( not ( = ?auto_60170 ?auto_60174 ) ) ( not ( = ?auto_60171 ?auto_60174 ) ) ( ON ?auto_60170 ?auto_60171 ) ( CLEAR ?auto_60170 ) ( ON-TABLE ?auto_60175 ) ( ON ?auto_60173 ?auto_60175 ) ( ON ?auto_60172 ?auto_60173 ) ( ON ?auto_60174 ?auto_60172 ) ( not ( = ?auto_60175 ?auto_60173 ) ) ( not ( = ?auto_60175 ?auto_60172 ) ) ( not ( = ?auto_60175 ?auto_60174 ) ) ( not ( = ?auto_60175 ?auto_60171 ) ) ( not ( = ?auto_60175 ?auto_60170 ) ) ( not ( = ?auto_60173 ?auto_60172 ) ) ( not ( = ?auto_60173 ?auto_60174 ) ) ( not ( = ?auto_60173 ?auto_60171 ) ) ( not ( = ?auto_60173 ?auto_60170 ) ) ( not ( = ?auto_60172 ?auto_60174 ) ) ( not ( = ?auto_60172 ?auto_60171 ) ) ( not ( = ?auto_60172 ?auto_60170 ) ) ( not ( = ?auto_60169 ?auto_60175 ) ) ( not ( = ?auto_60169 ?auto_60173 ) ) ( not ( = ?auto_60169 ?auto_60172 ) ) ( HOLDING ?auto_60169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60169 )
      ( MAKE-3PILE ?auto_60169 ?auto_60170 ?auto_60171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60176 - BLOCK
      ?auto_60177 - BLOCK
      ?auto_60178 - BLOCK
    )
    :vars
    (
      ?auto_60180 - BLOCK
      ?auto_60182 - BLOCK
      ?auto_60181 - BLOCK
      ?auto_60179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60176 ?auto_60177 ) ) ( not ( = ?auto_60176 ?auto_60178 ) ) ( not ( = ?auto_60177 ?auto_60178 ) ) ( ON ?auto_60178 ?auto_60180 ) ( not ( = ?auto_60176 ?auto_60180 ) ) ( not ( = ?auto_60177 ?auto_60180 ) ) ( not ( = ?auto_60178 ?auto_60180 ) ) ( ON ?auto_60177 ?auto_60178 ) ( ON-TABLE ?auto_60182 ) ( ON ?auto_60181 ?auto_60182 ) ( ON ?auto_60179 ?auto_60181 ) ( ON ?auto_60180 ?auto_60179 ) ( not ( = ?auto_60182 ?auto_60181 ) ) ( not ( = ?auto_60182 ?auto_60179 ) ) ( not ( = ?auto_60182 ?auto_60180 ) ) ( not ( = ?auto_60182 ?auto_60178 ) ) ( not ( = ?auto_60182 ?auto_60177 ) ) ( not ( = ?auto_60181 ?auto_60179 ) ) ( not ( = ?auto_60181 ?auto_60180 ) ) ( not ( = ?auto_60181 ?auto_60178 ) ) ( not ( = ?auto_60181 ?auto_60177 ) ) ( not ( = ?auto_60179 ?auto_60180 ) ) ( not ( = ?auto_60179 ?auto_60178 ) ) ( not ( = ?auto_60179 ?auto_60177 ) ) ( not ( = ?auto_60176 ?auto_60182 ) ) ( not ( = ?auto_60176 ?auto_60181 ) ) ( not ( = ?auto_60176 ?auto_60179 ) ) ( ON ?auto_60176 ?auto_60177 ) ( CLEAR ?auto_60176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60182 ?auto_60181 ?auto_60179 ?auto_60180 ?auto_60178 ?auto_60177 )
      ( MAKE-3PILE ?auto_60176 ?auto_60177 ?auto_60178 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60186 - BLOCK
      ?auto_60187 - BLOCK
      ?auto_60188 - BLOCK
    )
    :vars
    (
      ?auto_60189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60189 ?auto_60188 ) ( CLEAR ?auto_60189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60186 ) ( ON ?auto_60187 ?auto_60186 ) ( ON ?auto_60188 ?auto_60187 ) ( not ( = ?auto_60186 ?auto_60187 ) ) ( not ( = ?auto_60186 ?auto_60188 ) ) ( not ( = ?auto_60186 ?auto_60189 ) ) ( not ( = ?auto_60187 ?auto_60188 ) ) ( not ( = ?auto_60187 ?auto_60189 ) ) ( not ( = ?auto_60188 ?auto_60189 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60189 ?auto_60188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60190 - BLOCK
      ?auto_60191 - BLOCK
      ?auto_60192 - BLOCK
    )
    :vars
    (
      ?auto_60193 - BLOCK
      ?auto_60194 - BLOCK
      ?auto_60195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60193 ?auto_60192 ) ( CLEAR ?auto_60193 ) ( ON-TABLE ?auto_60190 ) ( ON ?auto_60191 ?auto_60190 ) ( ON ?auto_60192 ?auto_60191 ) ( not ( = ?auto_60190 ?auto_60191 ) ) ( not ( = ?auto_60190 ?auto_60192 ) ) ( not ( = ?auto_60190 ?auto_60193 ) ) ( not ( = ?auto_60191 ?auto_60192 ) ) ( not ( = ?auto_60191 ?auto_60193 ) ) ( not ( = ?auto_60192 ?auto_60193 ) ) ( HOLDING ?auto_60194 ) ( CLEAR ?auto_60195 ) ( not ( = ?auto_60190 ?auto_60194 ) ) ( not ( = ?auto_60190 ?auto_60195 ) ) ( not ( = ?auto_60191 ?auto_60194 ) ) ( not ( = ?auto_60191 ?auto_60195 ) ) ( not ( = ?auto_60192 ?auto_60194 ) ) ( not ( = ?auto_60192 ?auto_60195 ) ) ( not ( = ?auto_60193 ?auto_60194 ) ) ( not ( = ?auto_60193 ?auto_60195 ) ) ( not ( = ?auto_60194 ?auto_60195 ) ) )
    :subtasks
    ( ( !STACK ?auto_60194 ?auto_60195 )
      ( MAKE-3PILE ?auto_60190 ?auto_60191 ?auto_60192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60196 - BLOCK
      ?auto_60197 - BLOCK
      ?auto_60198 - BLOCK
    )
    :vars
    (
      ?auto_60200 - BLOCK
      ?auto_60201 - BLOCK
      ?auto_60199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60200 ?auto_60198 ) ( ON-TABLE ?auto_60196 ) ( ON ?auto_60197 ?auto_60196 ) ( ON ?auto_60198 ?auto_60197 ) ( not ( = ?auto_60196 ?auto_60197 ) ) ( not ( = ?auto_60196 ?auto_60198 ) ) ( not ( = ?auto_60196 ?auto_60200 ) ) ( not ( = ?auto_60197 ?auto_60198 ) ) ( not ( = ?auto_60197 ?auto_60200 ) ) ( not ( = ?auto_60198 ?auto_60200 ) ) ( CLEAR ?auto_60201 ) ( not ( = ?auto_60196 ?auto_60199 ) ) ( not ( = ?auto_60196 ?auto_60201 ) ) ( not ( = ?auto_60197 ?auto_60199 ) ) ( not ( = ?auto_60197 ?auto_60201 ) ) ( not ( = ?auto_60198 ?auto_60199 ) ) ( not ( = ?auto_60198 ?auto_60201 ) ) ( not ( = ?auto_60200 ?auto_60199 ) ) ( not ( = ?auto_60200 ?auto_60201 ) ) ( not ( = ?auto_60199 ?auto_60201 ) ) ( ON ?auto_60199 ?auto_60200 ) ( CLEAR ?auto_60199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60196 ?auto_60197 ?auto_60198 ?auto_60200 )
      ( MAKE-3PILE ?auto_60196 ?auto_60197 ?auto_60198 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60202 - BLOCK
      ?auto_60203 - BLOCK
      ?auto_60204 - BLOCK
    )
    :vars
    (
      ?auto_60205 - BLOCK
      ?auto_60206 - BLOCK
      ?auto_60207 - BLOCK
      ?auto_60208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60205 ?auto_60204 ) ( ON-TABLE ?auto_60202 ) ( ON ?auto_60203 ?auto_60202 ) ( ON ?auto_60204 ?auto_60203 ) ( not ( = ?auto_60202 ?auto_60203 ) ) ( not ( = ?auto_60202 ?auto_60204 ) ) ( not ( = ?auto_60202 ?auto_60205 ) ) ( not ( = ?auto_60203 ?auto_60204 ) ) ( not ( = ?auto_60203 ?auto_60205 ) ) ( not ( = ?auto_60204 ?auto_60205 ) ) ( not ( = ?auto_60202 ?auto_60206 ) ) ( not ( = ?auto_60202 ?auto_60207 ) ) ( not ( = ?auto_60203 ?auto_60206 ) ) ( not ( = ?auto_60203 ?auto_60207 ) ) ( not ( = ?auto_60204 ?auto_60206 ) ) ( not ( = ?auto_60204 ?auto_60207 ) ) ( not ( = ?auto_60205 ?auto_60206 ) ) ( not ( = ?auto_60205 ?auto_60207 ) ) ( not ( = ?auto_60206 ?auto_60207 ) ) ( ON ?auto_60206 ?auto_60205 ) ( CLEAR ?auto_60206 ) ( HOLDING ?auto_60207 ) ( CLEAR ?auto_60208 ) ( ON-TABLE ?auto_60208 ) ( not ( = ?auto_60208 ?auto_60207 ) ) ( not ( = ?auto_60202 ?auto_60208 ) ) ( not ( = ?auto_60203 ?auto_60208 ) ) ( not ( = ?auto_60204 ?auto_60208 ) ) ( not ( = ?auto_60205 ?auto_60208 ) ) ( not ( = ?auto_60206 ?auto_60208 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60208 ?auto_60207 )
      ( MAKE-3PILE ?auto_60202 ?auto_60203 ?auto_60204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60900 - BLOCK
      ?auto_60901 - BLOCK
      ?auto_60902 - BLOCK
    )
    :vars
    (
      ?auto_60905 - BLOCK
      ?auto_60903 - BLOCK
      ?auto_60904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60905 ?auto_60902 ) ( ON-TABLE ?auto_60900 ) ( ON ?auto_60901 ?auto_60900 ) ( ON ?auto_60902 ?auto_60901 ) ( not ( = ?auto_60900 ?auto_60901 ) ) ( not ( = ?auto_60900 ?auto_60902 ) ) ( not ( = ?auto_60900 ?auto_60905 ) ) ( not ( = ?auto_60901 ?auto_60902 ) ) ( not ( = ?auto_60901 ?auto_60905 ) ) ( not ( = ?auto_60902 ?auto_60905 ) ) ( not ( = ?auto_60900 ?auto_60903 ) ) ( not ( = ?auto_60900 ?auto_60904 ) ) ( not ( = ?auto_60901 ?auto_60903 ) ) ( not ( = ?auto_60901 ?auto_60904 ) ) ( not ( = ?auto_60902 ?auto_60903 ) ) ( not ( = ?auto_60902 ?auto_60904 ) ) ( not ( = ?auto_60905 ?auto_60903 ) ) ( not ( = ?auto_60905 ?auto_60904 ) ) ( not ( = ?auto_60903 ?auto_60904 ) ) ( ON ?auto_60903 ?auto_60905 ) ( ON ?auto_60904 ?auto_60903 ) ( CLEAR ?auto_60904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60900 ?auto_60901 ?auto_60902 ?auto_60905 ?auto_60903 )
      ( MAKE-3PILE ?auto_60900 ?auto_60901 ?auto_60902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60216 - BLOCK
      ?auto_60217 - BLOCK
      ?auto_60218 - BLOCK
    )
    :vars
    (
      ?auto_60219 - BLOCK
      ?auto_60221 - BLOCK
      ?auto_60222 - BLOCK
      ?auto_60220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60219 ?auto_60218 ) ( ON-TABLE ?auto_60216 ) ( ON ?auto_60217 ?auto_60216 ) ( ON ?auto_60218 ?auto_60217 ) ( not ( = ?auto_60216 ?auto_60217 ) ) ( not ( = ?auto_60216 ?auto_60218 ) ) ( not ( = ?auto_60216 ?auto_60219 ) ) ( not ( = ?auto_60217 ?auto_60218 ) ) ( not ( = ?auto_60217 ?auto_60219 ) ) ( not ( = ?auto_60218 ?auto_60219 ) ) ( not ( = ?auto_60216 ?auto_60221 ) ) ( not ( = ?auto_60216 ?auto_60222 ) ) ( not ( = ?auto_60217 ?auto_60221 ) ) ( not ( = ?auto_60217 ?auto_60222 ) ) ( not ( = ?auto_60218 ?auto_60221 ) ) ( not ( = ?auto_60218 ?auto_60222 ) ) ( not ( = ?auto_60219 ?auto_60221 ) ) ( not ( = ?auto_60219 ?auto_60222 ) ) ( not ( = ?auto_60221 ?auto_60222 ) ) ( ON ?auto_60221 ?auto_60219 ) ( not ( = ?auto_60220 ?auto_60222 ) ) ( not ( = ?auto_60216 ?auto_60220 ) ) ( not ( = ?auto_60217 ?auto_60220 ) ) ( not ( = ?auto_60218 ?auto_60220 ) ) ( not ( = ?auto_60219 ?auto_60220 ) ) ( not ( = ?auto_60221 ?auto_60220 ) ) ( ON ?auto_60222 ?auto_60221 ) ( CLEAR ?auto_60222 ) ( HOLDING ?auto_60220 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60220 )
      ( MAKE-3PILE ?auto_60216 ?auto_60217 ?auto_60218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60223 - BLOCK
      ?auto_60224 - BLOCK
      ?auto_60225 - BLOCK
    )
    :vars
    (
      ?auto_60227 - BLOCK
      ?auto_60226 - BLOCK
      ?auto_60229 - BLOCK
      ?auto_60228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60227 ?auto_60225 ) ( ON-TABLE ?auto_60223 ) ( ON ?auto_60224 ?auto_60223 ) ( ON ?auto_60225 ?auto_60224 ) ( not ( = ?auto_60223 ?auto_60224 ) ) ( not ( = ?auto_60223 ?auto_60225 ) ) ( not ( = ?auto_60223 ?auto_60227 ) ) ( not ( = ?auto_60224 ?auto_60225 ) ) ( not ( = ?auto_60224 ?auto_60227 ) ) ( not ( = ?auto_60225 ?auto_60227 ) ) ( not ( = ?auto_60223 ?auto_60226 ) ) ( not ( = ?auto_60223 ?auto_60229 ) ) ( not ( = ?auto_60224 ?auto_60226 ) ) ( not ( = ?auto_60224 ?auto_60229 ) ) ( not ( = ?auto_60225 ?auto_60226 ) ) ( not ( = ?auto_60225 ?auto_60229 ) ) ( not ( = ?auto_60227 ?auto_60226 ) ) ( not ( = ?auto_60227 ?auto_60229 ) ) ( not ( = ?auto_60226 ?auto_60229 ) ) ( ON ?auto_60226 ?auto_60227 ) ( not ( = ?auto_60228 ?auto_60229 ) ) ( not ( = ?auto_60223 ?auto_60228 ) ) ( not ( = ?auto_60224 ?auto_60228 ) ) ( not ( = ?auto_60225 ?auto_60228 ) ) ( not ( = ?auto_60227 ?auto_60228 ) ) ( not ( = ?auto_60226 ?auto_60228 ) ) ( ON ?auto_60229 ?auto_60226 ) ( ON ?auto_60228 ?auto_60229 ) ( CLEAR ?auto_60228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60223 ?auto_60224 ?auto_60225 ?auto_60227 ?auto_60226 ?auto_60229 )
      ( MAKE-3PILE ?auto_60223 ?auto_60224 ?auto_60225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60234 - BLOCK
      ?auto_60235 - BLOCK
      ?auto_60236 - BLOCK
      ?auto_60237 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60237 ) ( CLEAR ?auto_60236 ) ( ON-TABLE ?auto_60234 ) ( ON ?auto_60235 ?auto_60234 ) ( ON ?auto_60236 ?auto_60235 ) ( not ( = ?auto_60234 ?auto_60235 ) ) ( not ( = ?auto_60234 ?auto_60236 ) ) ( not ( = ?auto_60234 ?auto_60237 ) ) ( not ( = ?auto_60235 ?auto_60236 ) ) ( not ( = ?auto_60235 ?auto_60237 ) ) ( not ( = ?auto_60236 ?auto_60237 ) ) )
    :subtasks
    ( ( !STACK ?auto_60237 ?auto_60236 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60238 - BLOCK
      ?auto_60239 - BLOCK
      ?auto_60240 - BLOCK
      ?auto_60241 - BLOCK
    )
    :vars
    (
      ?auto_60242 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60240 ) ( ON-TABLE ?auto_60238 ) ( ON ?auto_60239 ?auto_60238 ) ( ON ?auto_60240 ?auto_60239 ) ( not ( = ?auto_60238 ?auto_60239 ) ) ( not ( = ?auto_60238 ?auto_60240 ) ) ( not ( = ?auto_60238 ?auto_60241 ) ) ( not ( = ?auto_60239 ?auto_60240 ) ) ( not ( = ?auto_60239 ?auto_60241 ) ) ( not ( = ?auto_60240 ?auto_60241 ) ) ( ON ?auto_60241 ?auto_60242 ) ( CLEAR ?auto_60241 ) ( HAND-EMPTY ) ( not ( = ?auto_60238 ?auto_60242 ) ) ( not ( = ?auto_60239 ?auto_60242 ) ) ( not ( = ?auto_60240 ?auto_60242 ) ) ( not ( = ?auto_60241 ?auto_60242 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60241 ?auto_60242 )
      ( MAKE-4PILE ?auto_60238 ?auto_60239 ?auto_60240 ?auto_60241 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60243 - BLOCK
      ?auto_60244 - BLOCK
      ?auto_60245 - BLOCK
      ?auto_60246 - BLOCK
    )
    :vars
    (
      ?auto_60247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60243 ) ( ON ?auto_60244 ?auto_60243 ) ( not ( = ?auto_60243 ?auto_60244 ) ) ( not ( = ?auto_60243 ?auto_60245 ) ) ( not ( = ?auto_60243 ?auto_60246 ) ) ( not ( = ?auto_60244 ?auto_60245 ) ) ( not ( = ?auto_60244 ?auto_60246 ) ) ( not ( = ?auto_60245 ?auto_60246 ) ) ( ON ?auto_60246 ?auto_60247 ) ( CLEAR ?auto_60246 ) ( not ( = ?auto_60243 ?auto_60247 ) ) ( not ( = ?auto_60244 ?auto_60247 ) ) ( not ( = ?auto_60245 ?auto_60247 ) ) ( not ( = ?auto_60246 ?auto_60247 ) ) ( HOLDING ?auto_60245 ) ( CLEAR ?auto_60244 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60243 ?auto_60244 ?auto_60245 )
      ( MAKE-4PILE ?auto_60243 ?auto_60244 ?auto_60245 ?auto_60246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60248 - BLOCK
      ?auto_60249 - BLOCK
      ?auto_60250 - BLOCK
      ?auto_60251 - BLOCK
    )
    :vars
    (
      ?auto_60252 - BLOCK
      ?auto_60253 - BLOCK
      ?auto_60254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60248 ) ( ON ?auto_60249 ?auto_60248 ) ( not ( = ?auto_60248 ?auto_60249 ) ) ( not ( = ?auto_60248 ?auto_60250 ) ) ( not ( = ?auto_60248 ?auto_60251 ) ) ( not ( = ?auto_60249 ?auto_60250 ) ) ( not ( = ?auto_60249 ?auto_60251 ) ) ( not ( = ?auto_60250 ?auto_60251 ) ) ( ON ?auto_60251 ?auto_60252 ) ( not ( = ?auto_60248 ?auto_60252 ) ) ( not ( = ?auto_60249 ?auto_60252 ) ) ( not ( = ?auto_60250 ?auto_60252 ) ) ( not ( = ?auto_60251 ?auto_60252 ) ) ( CLEAR ?auto_60249 ) ( ON ?auto_60250 ?auto_60251 ) ( CLEAR ?auto_60250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60253 ) ( ON ?auto_60254 ?auto_60253 ) ( ON ?auto_60252 ?auto_60254 ) ( not ( = ?auto_60253 ?auto_60254 ) ) ( not ( = ?auto_60253 ?auto_60252 ) ) ( not ( = ?auto_60253 ?auto_60251 ) ) ( not ( = ?auto_60253 ?auto_60250 ) ) ( not ( = ?auto_60254 ?auto_60252 ) ) ( not ( = ?auto_60254 ?auto_60251 ) ) ( not ( = ?auto_60254 ?auto_60250 ) ) ( not ( = ?auto_60248 ?auto_60253 ) ) ( not ( = ?auto_60248 ?auto_60254 ) ) ( not ( = ?auto_60249 ?auto_60253 ) ) ( not ( = ?auto_60249 ?auto_60254 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60253 ?auto_60254 ?auto_60252 ?auto_60251 )
      ( MAKE-4PILE ?auto_60248 ?auto_60249 ?auto_60250 ?auto_60251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60255 - BLOCK
      ?auto_60256 - BLOCK
      ?auto_60257 - BLOCK
      ?auto_60258 - BLOCK
    )
    :vars
    (
      ?auto_60261 - BLOCK
      ?auto_60259 - BLOCK
      ?auto_60260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60255 ) ( not ( = ?auto_60255 ?auto_60256 ) ) ( not ( = ?auto_60255 ?auto_60257 ) ) ( not ( = ?auto_60255 ?auto_60258 ) ) ( not ( = ?auto_60256 ?auto_60257 ) ) ( not ( = ?auto_60256 ?auto_60258 ) ) ( not ( = ?auto_60257 ?auto_60258 ) ) ( ON ?auto_60258 ?auto_60261 ) ( not ( = ?auto_60255 ?auto_60261 ) ) ( not ( = ?auto_60256 ?auto_60261 ) ) ( not ( = ?auto_60257 ?auto_60261 ) ) ( not ( = ?auto_60258 ?auto_60261 ) ) ( ON ?auto_60257 ?auto_60258 ) ( CLEAR ?auto_60257 ) ( ON-TABLE ?auto_60259 ) ( ON ?auto_60260 ?auto_60259 ) ( ON ?auto_60261 ?auto_60260 ) ( not ( = ?auto_60259 ?auto_60260 ) ) ( not ( = ?auto_60259 ?auto_60261 ) ) ( not ( = ?auto_60259 ?auto_60258 ) ) ( not ( = ?auto_60259 ?auto_60257 ) ) ( not ( = ?auto_60260 ?auto_60261 ) ) ( not ( = ?auto_60260 ?auto_60258 ) ) ( not ( = ?auto_60260 ?auto_60257 ) ) ( not ( = ?auto_60255 ?auto_60259 ) ) ( not ( = ?auto_60255 ?auto_60260 ) ) ( not ( = ?auto_60256 ?auto_60259 ) ) ( not ( = ?auto_60256 ?auto_60260 ) ) ( HOLDING ?auto_60256 ) ( CLEAR ?auto_60255 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60255 ?auto_60256 )
      ( MAKE-4PILE ?auto_60255 ?auto_60256 ?auto_60257 ?auto_60258 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60262 - BLOCK
      ?auto_60263 - BLOCK
      ?auto_60264 - BLOCK
      ?auto_60265 - BLOCK
    )
    :vars
    (
      ?auto_60268 - BLOCK
      ?auto_60266 - BLOCK
      ?auto_60267 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60262 ) ( not ( = ?auto_60262 ?auto_60263 ) ) ( not ( = ?auto_60262 ?auto_60264 ) ) ( not ( = ?auto_60262 ?auto_60265 ) ) ( not ( = ?auto_60263 ?auto_60264 ) ) ( not ( = ?auto_60263 ?auto_60265 ) ) ( not ( = ?auto_60264 ?auto_60265 ) ) ( ON ?auto_60265 ?auto_60268 ) ( not ( = ?auto_60262 ?auto_60268 ) ) ( not ( = ?auto_60263 ?auto_60268 ) ) ( not ( = ?auto_60264 ?auto_60268 ) ) ( not ( = ?auto_60265 ?auto_60268 ) ) ( ON ?auto_60264 ?auto_60265 ) ( ON-TABLE ?auto_60266 ) ( ON ?auto_60267 ?auto_60266 ) ( ON ?auto_60268 ?auto_60267 ) ( not ( = ?auto_60266 ?auto_60267 ) ) ( not ( = ?auto_60266 ?auto_60268 ) ) ( not ( = ?auto_60266 ?auto_60265 ) ) ( not ( = ?auto_60266 ?auto_60264 ) ) ( not ( = ?auto_60267 ?auto_60268 ) ) ( not ( = ?auto_60267 ?auto_60265 ) ) ( not ( = ?auto_60267 ?auto_60264 ) ) ( not ( = ?auto_60262 ?auto_60266 ) ) ( not ( = ?auto_60262 ?auto_60267 ) ) ( not ( = ?auto_60263 ?auto_60266 ) ) ( not ( = ?auto_60263 ?auto_60267 ) ) ( CLEAR ?auto_60262 ) ( ON ?auto_60263 ?auto_60264 ) ( CLEAR ?auto_60263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60266 ?auto_60267 ?auto_60268 ?auto_60265 ?auto_60264 )
      ( MAKE-4PILE ?auto_60262 ?auto_60263 ?auto_60264 ?auto_60265 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60269 - BLOCK
      ?auto_60270 - BLOCK
      ?auto_60271 - BLOCK
      ?auto_60272 - BLOCK
    )
    :vars
    (
      ?auto_60273 - BLOCK
      ?auto_60275 - BLOCK
      ?auto_60274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60269 ?auto_60270 ) ) ( not ( = ?auto_60269 ?auto_60271 ) ) ( not ( = ?auto_60269 ?auto_60272 ) ) ( not ( = ?auto_60270 ?auto_60271 ) ) ( not ( = ?auto_60270 ?auto_60272 ) ) ( not ( = ?auto_60271 ?auto_60272 ) ) ( ON ?auto_60272 ?auto_60273 ) ( not ( = ?auto_60269 ?auto_60273 ) ) ( not ( = ?auto_60270 ?auto_60273 ) ) ( not ( = ?auto_60271 ?auto_60273 ) ) ( not ( = ?auto_60272 ?auto_60273 ) ) ( ON ?auto_60271 ?auto_60272 ) ( ON-TABLE ?auto_60275 ) ( ON ?auto_60274 ?auto_60275 ) ( ON ?auto_60273 ?auto_60274 ) ( not ( = ?auto_60275 ?auto_60274 ) ) ( not ( = ?auto_60275 ?auto_60273 ) ) ( not ( = ?auto_60275 ?auto_60272 ) ) ( not ( = ?auto_60275 ?auto_60271 ) ) ( not ( = ?auto_60274 ?auto_60273 ) ) ( not ( = ?auto_60274 ?auto_60272 ) ) ( not ( = ?auto_60274 ?auto_60271 ) ) ( not ( = ?auto_60269 ?auto_60275 ) ) ( not ( = ?auto_60269 ?auto_60274 ) ) ( not ( = ?auto_60270 ?auto_60275 ) ) ( not ( = ?auto_60270 ?auto_60274 ) ) ( ON ?auto_60270 ?auto_60271 ) ( CLEAR ?auto_60270 ) ( HOLDING ?auto_60269 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60269 )
      ( MAKE-4PILE ?auto_60269 ?auto_60270 ?auto_60271 ?auto_60272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60276 - BLOCK
      ?auto_60277 - BLOCK
      ?auto_60278 - BLOCK
      ?auto_60279 - BLOCK
    )
    :vars
    (
      ?auto_60281 - BLOCK
      ?auto_60282 - BLOCK
      ?auto_60280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60276 ?auto_60277 ) ) ( not ( = ?auto_60276 ?auto_60278 ) ) ( not ( = ?auto_60276 ?auto_60279 ) ) ( not ( = ?auto_60277 ?auto_60278 ) ) ( not ( = ?auto_60277 ?auto_60279 ) ) ( not ( = ?auto_60278 ?auto_60279 ) ) ( ON ?auto_60279 ?auto_60281 ) ( not ( = ?auto_60276 ?auto_60281 ) ) ( not ( = ?auto_60277 ?auto_60281 ) ) ( not ( = ?auto_60278 ?auto_60281 ) ) ( not ( = ?auto_60279 ?auto_60281 ) ) ( ON ?auto_60278 ?auto_60279 ) ( ON-TABLE ?auto_60282 ) ( ON ?auto_60280 ?auto_60282 ) ( ON ?auto_60281 ?auto_60280 ) ( not ( = ?auto_60282 ?auto_60280 ) ) ( not ( = ?auto_60282 ?auto_60281 ) ) ( not ( = ?auto_60282 ?auto_60279 ) ) ( not ( = ?auto_60282 ?auto_60278 ) ) ( not ( = ?auto_60280 ?auto_60281 ) ) ( not ( = ?auto_60280 ?auto_60279 ) ) ( not ( = ?auto_60280 ?auto_60278 ) ) ( not ( = ?auto_60276 ?auto_60282 ) ) ( not ( = ?auto_60276 ?auto_60280 ) ) ( not ( = ?auto_60277 ?auto_60282 ) ) ( not ( = ?auto_60277 ?auto_60280 ) ) ( ON ?auto_60277 ?auto_60278 ) ( ON ?auto_60276 ?auto_60277 ) ( CLEAR ?auto_60276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60282 ?auto_60280 ?auto_60281 ?auto_60279 ?auto_60278 ?auto_60277 )
      ( MAKE-4PILE ?auto_60276 ?auto_60277 ?auto_60278 ?auto_60279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60285 - BLOCK
      ?auto_60286 - BLOCK
    )
    :vars
    (
      ?auto_60287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60287 ?auto_60286 ) ( CLEAR ?auto_60287 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60285 ) ( ON ?auto_60286 ?auto_60285 ) ( not ( = ?auto_60285 ?auto_60286 ) ) ( not ( = ?auto_60285 ?auto_60287 ) ) ( not ( = ?auto_60286 ?auto_60287 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60287 ?auto_60286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60288 - BLOCK
      ?auto_60289 - BLOCK
    )
    :vars
    (
      ?auto_60290 - BLOCK
      ?auto_60291 - BLOCK
      ?auto_60292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60290 ?auto_60289 ) ( CLEAR ?auto_60290 ) ( ON-TABLE ?auto_60288 ) ( ON ?auto_60289 ?auto_60288 ) ( not ( = ?auto_60288 ?auto_60289 ) ) ( not ( = ?auto_60288 ?auto_60290 ) ) ( not ( = ?auto_60289 ?auto_60290 ) ) ( HOLDING ?auto_60291 ) ( CLEAR ?auto_60292 ) ( not ( = ?auto_60288 ?auto_60291 ) ) ( not ( = ?auto_60288 ?auto_60292 ) ) ( not ( = ?auto_60289 ?auto_60291 ) ) ( not ( = ?auto_60289 ?auto_60292 ) ) ( not ( = ?auto_60290 ?auto_60291 ) ) ( not ( = ?auto_60290 ?auto_60292 ) ) ( not ( = ?auto_60291 ?auto_60292 ) ) )
    :subtasks
    ( ( !STACK ?auto_60291 ?auto_60292 )
      ( MAKE-2PILE ?auto_60288 ?auto_60289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60293 - BLOCK
      ?auto_60294 - BLOCK
    )
    :vars
    (
      ?auto_60295 - BLOCK
      ?auto_60296 - BLOCK
      ?auto_60297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60295 ?auto_60294 ) ( ON-TABLE ?auto_60293 ) ( ON ?auto_60294 ?auto_60293 ) ( not ( = ?auto_60293 ?auto_60294 ) ) ( not ( = ?auto_60293 ?auto_60295 ) ) ( not ( = ?auto_60294 ?auto_60295 ) ) ( CLEAR ?auto_60296 ) ( not ( = ?auto_60293 ?auto_60297 ) ) ( not ( = ?auto_60293 ?auto_60296 ) ) ( not ( = ?auto_60294 ?auto_60297 ) ) ( not ( = ?auto_60294 ?auto_60296 ) ) ( not ( = ?auto_60295 ?auto_60297 ) ) ( not ( = ?auto_60295 ?auto_60296 ) ) ( not ( = ?auto_60297 ?auto_60296 ) ) ( ON ?auto_60297 ?auto_60295 ) ( CLEAR ?auto_60297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60293 ?auto_60294 ?auto_60295 )
      ( MAKE-2PILE ?auto_60293 ?auto_60294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60298 - BLOCK
      ?auto_60299 - BLOCK
    )
    :vars
    (
      ?auto_60301 - BLOCK
      ?auto_60300 - BLOCK
      ?auto_60302 - BLOCK
      ?auto_60303 - BLOCK
      ?auto_60304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60301 ?auto_60299 ) ( ON-TABLE ?auto_60298 ) ( ON ?auto_60299 ?auto_60298 ) ( not ( = ?auto_60298 ?auto_60299 ) ) ( not ( = ?auto_60298 ?auto_60301 ) ) ( not ( = ?auto_60299 ?auto_60301 ) ) ( not ( = ?auto_60298 ?auto_60300 ) ) ( not ( = ?auto_60298 ?auto_60302 ) ) ( not ( = ?auto_60299 ?auto_60300 ) ) ( not ( = ?auto_60299 ?auto_60302 ) ) ( not ( = ?auto_60301 ?auto_60300 ) ) ( not ( = ?auto_60301 ?auto_60302 ) ) ( not ( = ?auto_60300 ?auto_60302 ) ) ( ON ?auto_60300 ?auto_60301 ) ( CLEAR ?auto_60300 ) ( HOLDING ?auto_60302 ) ( CLEAR ?auto_60303 ) ( ON-TABLE ?auto_60304 ) ( ON ?auto_60303 ?auto_60304 ) ( not ( = ?auto_60304 ?auto_60303 ) ) ( not ( = ?auto_60304 ?auto_60302 ) ) ( not ( = ?auto_60303 ?auto_60302 ) ) ( not ( = ?auto_60298 ?auto_60303 ) ) ( not ( = ?auto_60298 ?auto_60304 ) ) ( not ( = ?auto_60299 ?auto_60303 ) ) ( not ( = ?auto_60299 ?auto_60304 ) ) ( not ( = ?auto_60301 ?auto_60303 ) ) ( not ( = ?auto_60301 ?auto_60304 ) ) ( not ( = ?auto_60300 ?auto_60303 ) ) ( not ( = ?auto_60300 ?auto_60304 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60304 ?auto_60303 ?auto_60302 )
      ( MAKE-2PILE ?auto_60298 ?auto_60299 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60305 - BLOCK
      ?auto_60306 - BLOCK
    )
    :vars
    (
      ?auto_60307 - BLOCK
      ?auto_60311 - BLOCK
      ?auto_60308 - BLOCK
      ?auto_60309 - BLOCK
      ?auto_60310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60307 ?auto_60306 ) ( ON-TABLE ?auto_60305 ) ( ON ?auto_60306 ?auto_60305 ) ( not ( = ?auto_60305 ?auto_60306 ) ) ( not ( = ?auto_60305 ?auto_60307 ) ) ( not ( = ?auto_60306 ?auto_60307 ) ) ( not ( = ?auto_60305 ?auto_60311 ) ) ( not ( = ?auto_60305 ?auto_60308 ) ) ( not ( = ?auto_60306 ?auto_60311 ) ) ( not ( = ?auto_60306 ?auto_60308 ) ) ( not ( = ?auto_60307 ?auto_60311 ) ) ( not ( = ?auto_60307 ?auto_60308 ) ) ( not ( = ?auto_60311 ?auto_60308 ) ) ( ON ?auto_60311 ?auto_60307 ) ( CLEAR ?auto_60309 ) ( ON-TABLE ?auto_60310 ) ( ON ?auto_60309 ?auto_60310 ) ( not ( = ?auto_60310 ?auto_60309 ) ) ( not ( = ?auto_60310 ?auto_60308 ) ) ( not ( = ?auto_60309 ?auto_60308 ) ) ( not ( = ?auto_60305 ?auto_60309 ) ) ( not ( = ?auto_60305 ?auto_60310 ) ) ( not ( = ?auto_60306 ?auto_60309 ) ) ( not ( = ?auto_60306 ?auto_60310 ) ) ( not ( = ?auto_60307 ?auto_60309 ) ) ( not ( = ?auto_60307 ?auto_60310 ) ) ( not ( = ?auto_60311 ?auto_60309 ) ) ( not ( = ?auto_60311 ?auto_60310 ) ) ( ON ?auto_60308 ?auto_60311 ) ( CLEAR ?auto_60308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60305 ?auto_60306 ?auto_60307 ?auto_60311 )
      ( MAKE-2PILE ?auto_60305 ?auto_60306 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60312 - BLOCK
      ?auto_60313 - BLOCK
    )
    :vars
    (
      ?auto_60315 - BLOCK
      ?auto_60318 - BLOCK
      ?auto_60314 - BLOCK
      ?auto_60316 - BLOCK
      ?auto_60317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60315 ?auto_60313 ) ( ON-TABLE ?auto_60312 ) ( ON ?auto_60313 ?auto_60312 ) ( not ( = ?auto_60312 ?auto_60313 ) ) ( not ( = ?auto_60312 ?auto_60315 ) ) ( not ( = ?auto_60313 ?auto_60315 ) ) ( not ( = ?auto_60312 ?auto_60318 ) ) ( not ( = ?auto_60312 ?auto_60314 ) ) ( not ( = ?auto_60313 ?auto_60318 ) ) ( not ( = ?auto_60313 ?auto_60314 ) ) ( not ( = ?auto_60315 ?auto_60318 ) ) ( not ( = ?auto_60315 ?auto_60314 ) ) ( not ( = ?auto_60318 ?auto_60314 ) ) ( ON ?auto_60318 ?auto_60315 ) ( ON-TABLE ?auto_60316 ) ( not ( = ?auto_60316 ?auto_60317 ) ) ( not ( = ?auto_60316 ?auto_60314 ) ) ( not ( = ?auto_60317 ?auto_60314 ) ) ( not ( = ?auto_60312 ?auto_60317 ) ) ( not ( = ?auto_60312 ?auto_60316 ) ) ( not ( = ?auto_60313 ?auto_60317 ) ) ( not ( = ?auto_60313 ?auto_60316 ) ) ( not ( = ?auto_60315 ?auto_60317 ) ) ( not ( = ?auto_60315 ?auto_60316 ) ) ( not ( = ?auto_60318 ?auto_60317 ) ) ( not ( = ?auto_60318 ?auto_60316 ) ) ( ON ?auto_60314 ?auto_60318 ) ( CLEAR ?auto_60314 ) ( HOLDING ?auto_60317 ) ( CLEAR ?auto_60316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60316 ?auto_60317 )
      ( MAKE-2PILE ?auto_60312 ?auto_60313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61090 - BLOCK
      ?auto_61091 - BLOCK
    )
    :vars
    (
      ?auto_61092 - BLOCK
      ?auto_61095 - BLOCK
      ?auto_61093 - BLOCK
      ?auto_61094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61092 ?auto_61091 ) ( ON-TABLE ?auto_61090 ) ( ON ?auto_61091 ?auto_61090 ) ( not ( = ?auto_61090 ?auto_61091 ) ) ( not ( = ?auto_61090 ?auto_61092 ) ) ( not ( = ?auto_61091 ?auto_61092 ) ) ( not ( = ?auto_61090 ?auto_61095 ) ) ( not ( = ?auto_61090 ?auto_61093 ) ) ( not ( = ?auto_61091 ?auto_61095 ) ) ( not ( = ?auto_61091 ?auto_61093 ) ) ( not ( = ?auto_61092 ?auto_61095 ) ) ( not ( = ?auto_61092 ?auto_61093 ) ) ( not ( = ?auto_61095 ?auto_61093 ) ) ( ON ?auto_61095 ?auto_61092 ) ( not ( = ?auto_61094 ?auto_61093 ) ) ( not ( = ?auto_61090 ?auto_61094 ) ) ( not ( = ?auto_61091 ?auto_61094 ) ) ( not ( = ?auto_61092 ?auto_61094 ) ) ( not ( = ?auto_61095 ?auto_61094 ) ) ( ON ?auto_61093 ?auto_61095 ) ( ON ?auto_61094 ?auto_61093 ) ( CLEAR ?auto_61094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61090 ?auto_61091 ?auto_61092 ?auto_61095 ?auto_61093 )
      ( MAKE-2PILE ?auto_61090 ?auto_61091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60326 - BLOCK
      ?auto_60327 - BLOCK
    )
    :vars
    (
      ?auto_60329 - BLOCK
      ?auto_60331 - BLOCK
      ?auto_60330 - BLOCK
      ?auto_60332 - BLOCK
      ?auto_60328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60329 ?auto_60327 ) ( ON-TABLE ?auto_60326 ) ( ON ?auto_60327 ?auto_60326 ) ( not ( = ?auto_60326 ?auto_60327 ) ) ( not ( = ?auto_60326 ?auto_60329 ) ) ( not ( = ?auto_60327 ?auto_60329 ) ) ( not ( = ?auto_60326 ?auto_60331 ) ) ( not ( = ?auto_60326 ?auto_60330 ) ) ( not ( = ?auto_60327 ?auto_60331 ) ) ( not ( = ?auto_60327 ?auto_60330 ) ) ( not ( = ?auto_60329 ?auto_60331 ) ) ( not ( = ?auto_60329 ?auto_60330 ) ) ( not ( = ?auto_60331 ?auto_60330 ) ) ( ON ?auto_60331 ?auto_60329 ) ( not ( = ?auto_60332 ?auto_60328 ) ) ( not ( = ?auto_60332 ?auto_60330 ) ) ( not ( = ?auto_60328 ?auto_60330 ) ) ( not ( = ?auto_60326 ?auto_60328 ) ) ( not ( = ?auto_60326 ?auto_60332 ) ) ( not ( = ?auto_60327 ?auto_60328 ) ) ( not ( = ?auto_60327 ?auto_60332 ) ) ( not ( = ?auto_60329 ?auto_60328 ) ) ( not ( = ?auto_60329 ?auto_60332 ) ) ( not ( = ?auto_60331 ?auto_60328 ) ) ( not ( = ?auto_60331 ?auto_60332 ) ) ( ON ?auto_60330 ?auto_60331 ) ( ON ?auto_60328 ?auto_60330 ) ( CLEAR ?auto_60328 ) ( HOLDING ?auto_60332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60332 )
      ( MAKE-2PILE ?auto_60326 ?auto_60327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60333 - BLOCK
      ?auto_60334 - BLOCK
    )
    :vars
    (
      ?auto_60338 - BLOCK
      ?auto_60335 - BLOCK
      ?auto_60336 - BLOCK
      ?auto_60337 - BLOCK
      ?auto_60339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60338 ?auto_60334 ) ( ON-TABLE ?auto_60333 ) ( ON ?auto_60334 ?auto_60333 ) ( not ( = ?auto_60333 ?auto_60334 ) ) ( not ( = ?auto_60333 ?auto_60338 ) ) ( not ( = ?auto_60334 ?auto_60338 ) ) ( not ( = ?auto_60333 ?auto_60335 ) ) ( not ( = ?auto_60333 ?auto_60336 ) ) ( not ( = ?auto_60334 ?auto_60335 ) ) ( not ( = ?auto_60334 ?auto_60336 ) ) ( not ( = ?auto_60338 ?auto_60335 ) ) ( not ( = ?auto_60338 ?auto_60336 ) ) ( not ( = ?auto_60335 ?auto_60336 ) ) ( ON ?auto_60335 ?auto_60338 ) ( not ( = ?auto_60337 ?auto_60339 ) ) ( not ( = ?auto_60337 ?auto_60336 ) ) ( not ( = ?auto_60339 ?auto_60336 ) ) ( not ( = ?auto_60333 ?auto_60339 ) ) ( not ( = ?auto_60333 ?auto_60337 ) ) ( not ( = ?auto_60334 ?auto_60339 ) ) ( not ( = ?auto_60334 ?auto_60337 ) ) ( not ( = ?auto_60338 ?auto_60339 ) ) ( not ( = ?auto_60338 ?auto_60337 ) ) ( not ( = ?auto_60335 ?auto_60339 ) ) ( not ( = ?auto_60335 ?auto_60337 ) ) ( ON ?auto_60336 ?auto_60335 ) ( ON ?auto_60339 ?auto_60336 ) ( ON ?auto_60337 ?auto_60339 ) ( CLEAR ?auto_60337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60333 ?auto_60334 ?auto_60338 ?auto_60335 ?auto_60336 ?auto_60339 )
      ( MAKE-2PILE ?auto_60333 ?auto_60334 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60345 - BLOCK
      ?auto_60346 - BLOCK
      ?auto_60347 - BLOCK
      ?auto_60348 - BLOCK
      ?auto_60349 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60349 ) ( CLEAR ?auto_60348 ) ( ON-TABLE ?auto_60345 ) ( ON ?auto_60346 ?auto_60345 ) ( ON ?auto_60347 ?auto_60346 ) ( ON ?auto_60348 ?auto_60347 ) ( not ( = ?auto_60345 ?auto_60346 ) ) ( not ( = ?auto_60345 ?auto_60347 ) ) ( not ( = ?auto_60345 ?auto_60348 ) ) ( not ( = ?auto_60345 ?auto_60349 ) ) ( not ( = ?auto_60346 ?auto_60347 ) ) ( not ( = ?auto_60346 ?auto_60348 ) ) ( not ( = ?auto_60346 ?auto_60349 ) ) ( not ( = ?auto_60347 ?auto_60348 ) ) ( not ( = ?auto_60347 ?auto_60349 ) ) ( not ( = ?auto_60348 ?auto_60349 ) ) )
    :subtasks
    ( ( !STACK ?auto_60349 ?auto_60348 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60350 - BLOCK
      ?auto_60351 - BLOCK
      ?auto_60352 - BLOCK
      ?auto_60353 - BLOCK
      ?auto_60354 - BLOCK
    )
    :vars
    (
      ?auto_60355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60353 ) ( ON-TABLE ?auto_60350 ) ( ON ?auto_60351 ?auto_60350 ) ( ON ?auto_60352 ?auto_60351 ) ( ON ?auto_60353 ?auto_60352 ) ( not ( = ?auto_60350 ?auto_60351 ) ) ( not ( = ?auto_60350 ?auto_60352 ) ) ( not ( = ?auto_60350 ?auto_60353 ) ) ( not ( = ?auto_60350 ?auto_60354 ) ) ( not ( = ?auto_60351 ?auto_60352 ) ) ( not ( = ?auto_60351 ?auto_60353 ) ) ( not ( = ?auto_60351 ?auto_60354 ) ) ( not ( = ?auto_60352 ?auto_60353 ) ) ( not ( = ?auto_60352 ?auto_60354 ) ) ( not ( = ?auto_60353 ?auto_60354 ) ) ( ON ?auto_60354 ?auto_60355 ) ( CLEAR ?auto_60354 ) ( HAND-EMPTY ) ( not ( = ?auto_60350 ?auto_60355 ) ) ( not ( = ?auto_60351 ?auto_60355 ) ) ( not ( = ?auto_60352 ?auto_60355 ) ) ( not ( = ?auto_60353 ?auto_60355 ) ) ( not ( = ?auto_60354 ?auto_60355 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60354 ?auto_60355 )
      ( MAKE-5PILE ?auto_60350 ?auto_60351 ?auto_60352 ?auto_60353 ?auto_60354 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60356 - BLOCK
      ?auto_60357 - BLOCK
      ?auto_60358 - BLOCK
      ?auto_60359 - BLOCK
      ?auto_60360 - BLOCK
    )
    :vars
    (
      ?auto_60361 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60356 ) ( ON ?auto_60357 ?auto_60356 ) ( ON ?auto_60358 ?auto_60357 ) ( not ( = ?auto_60356 ?auto_60357 ) ) ( not ( = ?auto_60356 ?auto_60358 ) ) ( not ( = ?auto_60356 ?auto_60359 ) ) ( not ( = ?auto_60356 ?auto_60360 ) ) ( not ( = ?auto_60357 ?auto_60358 ) ) ( not ( = ?auto_60357 ?auto_60359 ) ) ( not ( = ?auto_60357 ?auto_60360 ) ) ( not ( = ?auto_60358 ?auto_60359 ) ) ( not ( = ?auto_60358 ?auto_60360 ) ) ( not ( = ?auto_60359 ?auto_60360 ) ) ( ON ?auto_60360 ?auto_60361 ) ( CLEAR ?auto_60360 ) ( not ( = ?auto_60356 ?auto_60361 ) ) ( not ( = ?auto_60357 ?auto_60361 ) ) ( not ( = ?auto_60358 ?auto_60361 ) ) ( not ( = ?auto_60359 ?auto_60361 ) ) ( not ( = ?auto_60360 ?auto_60361 ) ) ( HOLDING ?auto_60359 ) ( CLEAR ?auto_60358 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60356 ?auto_60357 ?auto_60358 ?auto_60359 )
      ( MAKE-5PILE ?auto_60356 ?auto_60357 ?auto_60358 ?auto_60359 ?auto_60360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60362 - BLOCK
      ?auto_60363 - BLOCK
      ?auto_60364 - BLOCK
      ?auto_60365 - BLOCK
      ?auto_60366 - BLOCK
    )
    :vars
    (
      ?auto_60367 - BLOCK
      ?auto_60368 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60362 ) ( ON ?auto_60363 ?auto_60362 ) ( ON ?auto_60364 ?auto_60363 ) ( not ( = ?auto_60362 ?auto_60363 ) ) ( not ( = ?auto_60362 ?auto_60364 ) ) ( not ( = ?auto_60362 ?auto_60365 ) ) ( not ( = ?auto_60362 ?auto_60366 ) ) ( not ( = ?auto_60363 ?auto_60364 ) ) ( not ( = ?auto_60363 ?auto_60365 ) ) ( not ( = ?auto_60363 ?auto_60366 ) ) ( not ( = ?auto_60364 ?auto_60365 ) ) ( not ( = ?auto_60364 ?auto_60366 ) ) ( not ( = ?auto_60365 ?auto_60366 ) ) ( ON ?auto_60366 ?auto_60367 ) ( not ( = ?auto_60362 ?auto_60367 ) ) ( not ( = ?auto_60363 ?auto_60367 ) ) ( not ( = ?auto_60364 ?auto_60367 ) ) ( not ( = ?auto_60365 ?auto_60367 ) ) ( not ( = ?auto_60366 ?auto_60367 ) ) ( CLEAR ?auto_60364 ) ( ON ?auto_60365 ?auto_60366 ) ( CLEAR ?auto_60365 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60368 ) ( ON ?auto_60367 ?auto_60368 ) ( not ( = ?auto_60368 ?auto_60367 ) ) ( not ( = ?auto_60368 ?auto_60366 ) ) ( not ( = ?auto_60368 ?auto_60365 ) ) ( not ( = ?auto_60362 ?auto_60368 ) ) ( not ( = ?auto_60363 ?auto_60368 ) ) ( not ( = ?auto_60364 ?auto_60368 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60368 ?auto_60367 ?auto_60366 )
      ( MAKE-5PILE ?auto_60362 ?auto_60363 ?auto_60364 ?auto_60365 ?auto_60366 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60369 - BLOCK
      ?auto_60370 - BLOCK
      ?auto_60371 - BLOCK
      ?auto_60372 - BLOCK
      ?auto_60373 - BLOCK
    )
    :vars
    (
      ?auto_60374 - BLOCK
      ?auto_60375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60369 ) ( ON ?auto_60370 ?auto_60369 ) ( not ( = ?auto_60369 ?auto_60370 ) ) ( not ( = ?auto_60369 ?auto_60371 ) ) ( not ( = ?auto_60369 ?auto_60372 ) ) ( not ( = ?auto_60369 ?auto_60373 ) ) ( not ( = ?auto_60370 ?auto_60371 ) ) ( not ( = ?auto_60370 ?auto_60372 ) ) ( not ( = ?auto_60370 ?auto_60373 ) ) ( not ( = ?auto_60371 ?auto_60372 ) ) ( not ( = ?auto_60371 ?auto_60373 ) ) ( not ( = ?auto_60372 ?auto_60373 ) ) ( ON ?auto_60373 ?auto_60374 ) ( not ( = ?auto_60369 ?auto_60374 ) ) ( not ( = ?auto_60370 ?auto_60374 ) ) ( not ( = ?auto_60371 ?auto_60374 ) ) ( not ( = ?auto_60372 ?auto_60374 ) ) ( not ( = ?auto_60373 ?auto_60374 ) ) ( ON ?auto_60372 ?auto_60373 ) ( CLEAR ?auto_60372 ) ( ON-TABLE ?auto_60375 ) ( ON ?auto_60374 ?auto_60375 ) ( not ( = ?auto_60375 ?auto_60374 ) ) ( not ( = ?auto_60375 ?auto_60373 ) ) ( not ( = ?auto_60375 ?auto_60372 ) ) ( not ( = ?auto_60369 ?auto_60375 ) ) ( not ( = ?auto_60370 ?auto_60375 ) ) ( not ( = ?auto_60371 ?auto_60375 ) ) ( HOLDING ?auto_60371 ) ( CLEAR ?auto_60370 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60369 ?auto_60370 ?auto_60371 )
      ( MAKE-5PILE ?auto_60369 ?auto_60370 ?auto_60371 ?auto_60372 ?auto_60373 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60376 - BLOCK
      ?auto_60377 - BLOCK
      ?auto_60378 - BLOCK
      ?auto_60379 - BLOCK
      ?auto_60380 - BLOCK
    )
    :vars
    (
      ?auto_60381 - BLOCK
      ?auto_60382 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60376 ) ( ON ?auto_60377 ?auto_60376 ) ( not ( = ?auto_60376 ?auto_60377 ) ) ( not ( = ?auto_60376 ?auto_60378 ) ) ( not ( = ?auto_60376 ?auto_60379 ) ) ( not ( = ?auto_60376 ?auto_60380 ) ) ( not ( = ?auto_60377 ?auto_60378 ) ) ( not ( = ?auto_60377 ?auto_60379 ) ) ( not ( = ?auto_60377 ?auto_60380 ) ) ( not ( = ?auto_60378 ?auto_60379 ) ) ( not ( = ?auto_60378 ?auto_60380 ) ) ( not ( = ?auto_60379 ?auto_60380 ) ) ( ON ?auto_60380 ?auto_60381 ) ( not ( = ?auto_60376 ?auto_60381 ) ) ( not ( = ?auto_60377 ?auto_60381 ) ) ( not ( = ?auto_60378 ?auto_60381 ) ) ( not ( = ?auto_60379 ?auto_60381 ) ) ( not ( = ?auto_60380 ?auto_60381 ) ) ( ON ?auto_60379 ?auto_60380 ) ( ON-TABLE ?auto_60382 ) ( ON ?auto_60381 ?auto_60382 ) ( not ( = ?auto_60382 ?auto_60381 ) ) ( not ( = ?auto_60382 ?auto_60380 ) ) ( not ( = ?auto_60382 ?auto_60379 ) ) ( not ( = ?auto_60376 ?auto_60382 ) ) ( not ( = ?auto_60377 ?auto_60382 ) ) ( not ( = ?auto_60378 ?auto_60382 ) ) ( CLEAR ?auto_60377 ) ( ON ?auto_60378 ?auto_60379 ) ( CLEAR ?auto_60378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60382 ?auto_60381 ?auto_60380 ?auto_60379 )
      ( MAKE-5PILE ?auto_60376 ?auto_60377 ?auto_60378 ?auto_60379 ?auto_60380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60383 - BLOCK
      ?auto_60384 - BLOCK
      ?auto_60385 - BLOCK
      ?auto_60386 - BLOCK
      ?auto_60387 - BLOCK
    )
    :vars
    (
      ?auto_60388 - BLOCK
      ?auto_60389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60383 ) ( not ( = ?auto_60383 ?auto_60384 ) ) ( not ( = ?auto_60383 ?auto_60385 ) ) ( not ( = ?auto_60383 ?auto_60386 ) ) ( not ( = ?auto_60383 ?auto_60387 ) ) ( not ( = ?auto_60384 ?auto_60385 ) ) ( not ( = ?auto_60384 ?auto_60386 ) ) ( not ( = ?auto_60384 ?auto_60387 ) ) ( not ( = ?auto_60385 ?auto_60386 ) ) ( not ( = ?auto_60385 ?auto_60387 ) ) ( not ( = ?auto_60386 ?auto_60387 ) ) ( ON ?auto_60387 ?auto_60388 ) ( not ( = ?auto_60383 ?auto_60388 ) ) ( not ( = ?auto_60384 ?auto_60388 ) ) ( not ( = ?auto_60385 ?auto_60388 ) ) ( not ( = ?auto_60386 ?auto_60388 ) ) ( not ( = ?auto_60387 ?auto_60388 ) ) ( ON ?auto_60386 ?auto_60387 ) ( ON-TABLE ?auto_60389 ) ( ON ?auto_60388 ?auto_60389 ) ( not ( = ?auto_60389 ?auto_60388 ) ) ( not ( = ?auto_60389 ?auto_60387 ) ) ( not ( = ?auto_60389 ?auto_60386 ) ) ( not ( = ?auto_60383 ?auto_60389 ) ) ( not ( = ?auto_60384 ?auto_60389 ) ) ( not ( = ?auto_60385 ?auto_60389 ) ) ( ON ?auto_60385 ?auto_60386 ) ( CLEAR ?auto_60385 ) ( HOLDING ?auto_60384 ) ( CLEAR ?auto_60383 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60383 ?auto_60384 )
      ( MAKE-5PILE ?auto_60383 ?auto_60384 ?auto_60385 ?auto_60386 ?auto_60387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60390 - BLOCK
      ?auto_60391 - BLOCK
      ?auto_60392 - BLOCK
      ?auto_60393 - BLOCK
      ?auto_60394 - BLOCK
    )
    :vars
    (
      ?auto_60395 - BLOCK
      ?auto_60396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60390 ) ( not ( = ?auto_60390 ?auto_60391 ) ) ( not ( = ?auto_60390 ?auto_60392 ) ) ( not ( = ?auto_60390 ?auto_60393 ) ) ( not ( = ?auto_60390 ?auto_60394 ) ) ( not ( = ?auto_60391 ?auto_60392 ) ) ( not ( = ?auto_60391 ?auto_60393 ) ) ( not ( = ?auto_60391 ?auto_60394 ) ) ( not ( = ?auto_60392 ?auto_60393 ) ) ( not ( = ?auto_60392 ?auto_60394 ) ) ( not ( = ?auto_60393 ?auto_60394 ) ) ( ON ?auto_60394 ?auto_60395 ) ( not ( = ?auto_60390 ?auto_60395 ) ) ( not ( = ?auto_60391 ?auto_60395 ) ) ( not ( = ?auto_60392 ?auto_60395 ) ) ( not ( = ?auto_60393 ?auto_60395 ) ) ( not ( = ?auto_60394 ?auto_60395 ) ) ( ON ?auto_60393 ?auto_60394 ) ( ON-TABLE ?auto_60396 ) ( ON ?auto_60395 ?auto_60396 ) ( not ( = ?auto_60396 ?auto_60395 ) ) ( not ( = ?auto_60396 ?auto_60394 ) ) ( not ( = ?auto_60396 ?auto_60393 ) ) ( not ( = ?auto_60390 ?auto_60396 ) ) ( not ( = ?auto_60391 ?auto_60396 ) ) ( not ( = ?auto_60392 ?auto_60396 ) ) ( ON ?auto_60392 ?auto_60393 ) ( CLEAR ?auto_60390 ) ( ON ?auto_60391 ?auto_60392 ) ( CLEAR ?auto_60391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60396 ?auto_60395 ?auto_60394 ?auto_60393 ?auto_60392 )
      ( MAKE-5PILE ?auto_60390 ?auto_60391 ?auto_60392 ?auto_60393 ?auto_60394 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60397 - BLOCK
      ?auto_60398 - BLOCK
      ?auto_60399 - BLOCK
      ?auto_60400 - BLOCK
      ?auto_60401 - BLOCK
    )
    :vars
    (
      ?auto_60403 - BLOCK
      ?auto_60402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60397 ?auto_60398 ) ) ( not ( = ?auto_60397 ?auto_60399 ) ) ( not ( = ?auto_60397 ?auto_60400 ) ) ( not ( = ?auto_60397 ?auto_60401 ) ) ( not ( = ?auto_60398 ?auto_60399 ) ) ( not ( = ?auto_60398 ?auto_60400 ) ) ( not ( = ?auto_60398 ?auto_60401 ) ) ( not ( = ?auto_60399 ?auto_60400 ) ) ( not ( = ?auto_60399 ?auto_60401 ) ) ( not ( = ?auto_60400 ?auto_60401 ) ) ( ON ?auto_60401 ?auto_60403 ) ( not ( = ?auto_60397 ?auto_60403 ) ) ( not ( = ?auto_60398 ?auto_60403 ) ) ( not ( = ?auto_60399 ?auto_60403 ) ) ( not ( = ?auto_60400 ?auto_60403 ) ) ( not ( = ?auto_60401 ?auto_60403 ) ) ( ON ?auto_60400 ?auto_60401 ) ( ON-TABLE ?auto_60402 ) ( ON ?auto_60403 ?auto_60402 ) ( not ( = ?auto_60402 ?auto_60403 ) ) ( not ( = ?auto_60402 ?auto_60401 ) ) ( not ( = ?auto_60402 ?auto_60400 ) ) ( not ( = ?auto_60397 ?auto_60402 ) ) ( not ( = ?auto_60398 ?auto_60402 ) ) ( not ( = ?auto_60399 ?auto_60402 ) ) ( ON ?auto_60399 ?auto_60400 ) ( ON ?auto_60398 ?auto_60399 ) ( CLEAR ?auto_60398 ) ( HOLDING ?auto_60397 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60397 )
      ( MAKE-5PILE ?auto_60397 ?auto_60398 ?auto_60399 ?auto_60400 ?auto_60401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_60404 - BLOCK
      ?auto_60405 - BLOCK
      ?auto_60406 - BLOCK
      ?auto_60407 - BLOCK
      ?auto_60408 - BLOCK
    )
    :vars
    (
      ?auto_60410 - BLOCK
      ?auto_60409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60404 ?auto_60405 ) ) ( not ( = ?auto_60404 ?auto_60406 ) ) ( not ( = ?auto_60404 ?auto_60407 ) ) ( not ( = ?auto_60404 ?auto_60408 ) ) ( not ( = ?auto_60405 ?auto_60406 ) ) ( not ( = ?auto_60405 ?auto_60407 ) ) ( not ( = ?auto_60405 ?auto_60408 ) ) ( not ( = ?auto_60406 ?auto_60407 ) ) ( not ( = ?auto_60406 ?auto_60408 ) ) ( not ( = ?auto_60407 ?auto_60408 ) ) ( ON ?auto_60408 ?auto_60410 ) ( not ( = ?auto_60404 ?auto_60410 ) ) ( not ( = ?auto_60405 ?auto_60410 ) ) ( not ( = ?auto_60406 ?auto_60410 ) ) ( not ( = ?auto_60407 ?auto_60410 ) ) ( not ( = ?auto_60408 ?auto_60410 ) ) ( ON ?auto_60407 ?auto_60408 ) ( ON-TABLE ?auto_60409 ) ( ON ?auto_60410 ?auto_60409 ) ( not ( = ?auto_60409 ?auto_60410 ) ) ( not ( = ?auto_60409 ?auto_60408 ) ) ( not ( = ?auto_60409 ?auto_60407 ) ) ( not ( = ?auto_60404 ?auto_60409 ) ) ( not ( = ?auto_60405 ?auto_60409 ) ) ( not ( = ?auto_60406 ?auto_60409 ) ) ( ON ?auto_60406 ?auto_60407 ) ( ON ?auto_60405 ?auto_60406 ) ( ON ?auto_60404 ?auto_60405 ) ( CLEAR ?auto_60404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60409 ?auto_60410 ?auto_60408 ?auto_60407 ?auto_60406 ?auto_60405 )
      ( MAKE-5PILE ?auto_60404 ?auto_60405 ?auto_60406 ?auto_60407 ?auto_60408 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60412 - BLOCK
    )
    :vars
    (
      ?auto_60413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60413 ?auto_60412 ) ( CLEAR ?auto_60413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60412 ) ( not ( = ?auto_60412 ?auto_60413 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60413 ?auto_60412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60414 - BLOCK
    )
    :vars
    (
      ?auto_60415 - BLOCK
      ?auto_60416 - BLOCK
      ?auto_60417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60415 ?auto_60414 ) ( CLEAR ?auto_60415 ) ( ON-TABLE ?auto_60414 ) ( not ( = ?auto_60414 ?auto_60415 ) ) ( HOLDING ?auto_60416 ) ( CLEAR ?auto_60417 ) ( not ( = ?auto_60414 ?auto_60416 ) ) ( not ( = ?auto_60414 ?auto_60417 ) ) ( not ( = ?auto_60415 ?auto_60416 ) ) ( not ( = ?auto_60415 ?auto_60417 ) ) ( not ( = ?auto_60416 ?auto_60417 ) ) )
    :subtasks
    ( ( !STACK ?auto_60416 ?auto_60417 )
      ( MAKE-1PILE ?auto_60414 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60418 - BLOCK
    )
    :vars
    (
      ?auto_60421 - BLOCK
      ?auto_60419 - BLOCK
      ?auto_60420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60421 ?auto_60418 ) ( ON-TABLE ?auto_60418 ) ( not ( = ?auto_60418 ?auto_60421 ) ) ( CLEAR ?auto_60419 ) ( not ( = ?auto_60418 ?auto_60420 ) ) ( not ( = ?auto_60418 ?auto_60419 ) ) ( not ( = ?auto_60421 ?auto_60420 ) ) ( not ( = ?auto_60421 ?auto_60419 ) ) ( not ( = ?auto_60420 ?auto_60419 ) ) ( ON ?auto_60420 ?auto_60421 ) ( CLEAR ?auto_60420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60418 ?auto_60421 )
      ( MAKE-1PILE ?auto_60418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60422 - BLOCK
    )
    :vars
    (
      ?auto_60424 - BLOCK
      ?auto_60425 - BLOCK
      ?auto_60423 - BLOCK
      ?auto_60428 - BLOCK
      ?auto_60427 - BLOCK
      ?auto_60426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60424 ?auto_60422 ) ( ON-TABLE ?auto_60422 ) ( not ( = ?auto_60422 ?auto_60424 ) ) ( not ( = ?auto_60422 ?auto_60425 ) ) ( not ( = ?auto_60422 ?auto_60423 ) ) ( not ( = ?auto_60424 ?auto_60425 ) ) ( not ( = ?auto_60424 ?auto_60423 ) ) ( not ( = ?auto_60425 ?auto_60423 ) ) ( ON ?auto_60425 ?auto_60424 ) ( CLEAR ?auto_60425 ) ( HOLDING ?auto_60423 ) ( CLEAR ?auto_60428 ) ( ON-TABLE ?auto_60427 ) ( ON ?auto_60426 ?auto_60427 ) ( ON ?auto_60428 ?auto_60426 ) ( not ( = ?auto_60427 ?auto_60426 ) ) ( not ( = ?auto_60427 ?auto_60428 ) ) ( not ( = ?auto_60427 ?auto_60423 ) ) ( not ( = ?auto_60426 ?auto_60428 ) ) ( not ( = ?auto_60426 ?auto_60423 ) ) ( not ( = ?auto_60428 ?auto_60423 ) ) ( not ( = ?auto_60422 ?auto_60428 ) ) ( not ( = ?auto_60422 ?auto_60427 ) ) ( not ( = ?auto_60422 ?auto_60426 ) ) ( not ( = ?auto_60424 ?auto_60428 ) ) ( not ( = ?auto_60424 ?auto_60427 ) ) ( not ( = ?auto_60424 ?auto_60426 ) ) ( not ( = ?auto_60425 ?auto_60428 ) ) ( not ( = ?auto_60425 ?auto_60427 ) ) ( not ( = ?auto_60425 ?auto_60426 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60427 ?auto_60426 ?auto_60428 ?auto_60423 )
      ( MAKE-1PILE ?auto_60422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60429 - BLOCK
    )
    :vars
    (
      ?auto_60435 - BLOCK
      ?auto_60432 - BLOCK
      ?auto_60430 - BLOCK
      ?auto_60434 - BLOCK
      ?auto_60431 - BLOCK
      ?auto_60433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60435 ?auto_60429 ) ( ON-TABLE ?auto_60429 ) ( not ( = ?auto_60429 ?auto_60435 ) ) ( not ( = ?auto_60429 ?auto_60432 ) ) ( not ( = ?auto_60429 ?auto_60430 ) ) ( not ( = ?auto_60435 ?auto_60432 ) ) ( not ( = ?auto_60435 ?auto_60430 ) ) ( not ( = ?auto_60432 ?auto_60430 ) ) ( ON ?auto_60432 ?auto_60435 ) ( CLEAR ?auto_60434 ) ( ON-TABLE ?auto_60431 ) ( ON ?auto_60433 ?auto_60431 ) ( ON ?auto_60434 ?auto_60433 ) ( not ( = ?auto_60431 ?auto_60433 ) ) ( not ( = ?auto_60431 ?auto_60434 ) ) ( not ( = ?auto_60431 ?auto_60430 ) ) ( not ( = ?auto_60433 ?auto_60434 ) ) ( not ( = ?auto_60433 ?auto_60430 ) ) ( not ( = ?auto_60434 ?auto_60430 ) ) ( not ( = ?auto_60429 ?auto_60434 ) ) ( not ( = ?auto_60429 ?auto_60431 ) ) ( not ( = ?auto_60429 ?auto_60433 ) ) ( not ( = ?auto_60435 ?auto_60434 ) ) ( not ( = ?auto_60435 ?auto_60431 ) ) ( not ( = ?auto_60435 ?auto_60433 ) ) ( not ( = ?auto_60432 ?auto_60434 ) ) ( not ( = ?auto_60432 ?auto_60431 ) ) ( not ( = ?auto_60432 ?auto_60433 ) ) ( ON ?auto_60430 ?auto_60432 ) ( CLEAR ?auto_60430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60429 ?auto_60435 ?auto_60432 )
      ( MAKE-1PILE ?auto_60429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60436 - BLOCK
    )
    :vars
    (
      ?auto_60442 - BLOCK
      ?auto_60439 - BLOCK
      ?auto_60437 - BLOCK
      ?auto_60438 - BLOCK
      ?auto_60441 - BLOCK
      ?auto_60440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60442 ?auto_60436 ) ( ON-TABLE ?auto_60436 ) ( not ( = ?auto_60436 ?auto_60442 ) ) ( not ( = ?auto_60436 ?auto_60439 ) ) ( not ( = ?auto_60436 ?auto_60437 ) ) ( not ( = ?auto_60442 ?auto_60439 ) ) ( not ( = ?auto_60442 ?auto_60437 ) ) ( not ( = ?auto_60439 ?auto_60437 ) ) ( ON ?auto_60439 ?auto_60442 ) ( ON-TABLE ?auto_60438 ) ( ON ?auto_60441 ?auto_60438 ) ( not ( = ?auto_60438 ?auto_60441 ) ) ( not ( = ?auto_60438 ?auto_60440 ) ) ( not ( = ?auto_60438 ?auto_60437 ) ) ( not ( = ?auto_60441 ?auto_60440 ) ) ( not ( = ?auto_60441 ?auto_60437 ) ) ( not ( = ?auto_60440 ?auto_60437 ) ) ( not ( = ?auto_60436 ?auto_60440 ) ) ( not ( = ?auto_60436 ?auto_60438 ) ) ( not ( = ?auto_60436 ?auto_60441 ) ) ( not ( = ?auto_60442 ?auto_60440 ) ) ( not ( = ?auto_60442 ?auto_60438 ) ) ( not ( = ?auto_60442 ?auto_60441 ) ) ( not ( = ?auto_60439 ?auto_60440 ) ) ( not ( = ?auto_60439 ?auto_60438 ) ) ( not ( = ?auto_60439 ?auto_60441 ) ) ( ON ?auto_60437 ?auto_60439 ) ( CLEAR ?auto_60437 ) ( HOLDING ?auto_60440 ) ( CLEAR ?auto_60441 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60438 ?auto_60441 ?auto_60440 )
      ( MAKE-1PILE ?auto_60436 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60443 - BLOCK
    )
    :vars
    (
      ?auto_60444 - BLOCK
      ?auto_60447 - BLOCK
      ?auto_60449 - BLOCK
      ?auto_60448 - BLOCK
      ?auto_60445 - BLOCK
      ?auto_60446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60444 ?auto_60443 ) ( ON-TABLE ?auto_60443 ) ( not ( = ?auto_60443 ?auto_60444 ) ) ( not ( = ?auto_60443 ?auto_60447 ) ) ( not ( = ?auto_60443 ?auto_60449 ) ) ( not ( = ?auto_60444 ?auto_60447 ) ) ( not ( = ?auto_60444 ?auto_60449 ) ) ( not ( = ?auto_60447 ?auto_60449 ) ) ( ON ?auto_60447 ?auto_60444 ) ( ON-TABLE ?auto_60448 ) ( ON ?auto_60445 ?auto_60448 ) ( not ( = ?auto_60448 ?auto_60445 ) ) ( not ( = ?auto_60448 ?auto_60446 ) ) ( not ( = ?auto_60448 ?auto_60449 ) ) ( not ( = ?auto_60445 ?auto_60446 ) ) ( not ( = ?auto_60445 ?auto_60449 ) ) ( not ( = ?auto_60446 ?auto_60449 ) ) ( not ( = ?auto_60443 ?auto_60446 ) ) ( not ( = ?auto_60443 ?auto_60448 ) ) ( not ( = ?auto_60443 ?auto_60445 ) ) ( not ( = ?auto_60444 ?auto_60446 ) ) ( not ( = ?auto_60444 ?auto_60448 ) ) ( not ( = ?auto_60444 ?auto_60445 ) ) ( not ( = ?auto_60447 ?auto_60446 ) ) ( not ( = ?auto_60447 ?auto_60448 ) ) ( not ( = ?auto_60447 ?auto_60445 ) ) ( ON ?auto_60449 ?auto_60447 ) ( CLEAR ?auto_60445 ) ( ON ?auto_60446 ?auto_60449 ) ( CLEAR ?auto_60446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60443 ?auto_60444 ?auto_60447 ?auto_60449 )
      ( MAKE-1PILE ?auto_60443 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60450 - BLOCK
    )
    :vars
    (
      ?auto_60452 - BLOCK
      ?auto_60455 - BLOCK
      ?auto_60454 - BLOCK
      ?auto_60451 - BLOCK
      ?auto_60456 - BLOCK
      ?auto_60453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60452 ?auto_60450 ) ( ON-TABLE ?auto_60450 ) ( not ( = ?auto_60450 ?auto_60452 ) ) ( not ( = ?auto_60450 ?auto_60455 ) ) ( not ( = ?auto_60450 ?auto_60454 ) ) ( not ( = ?auto_60452 ?auto_60455 ) ) ( not ( = ?auto_60452 ?auto_60454 ) ) ( not ( = ?auto_60455 ?auto_60454 ) ) ( ON ?auto_60455 ?auto_60452 ) ( ON-TABLE ?auto_60451 ) ( not ( = ?auto_60451 ?auto_60456 ) ) ( not ( = ?auto_60451 ?auto_60453 ) ) ( not ( = ?auto_60451 ?auto_60454 ) ) ( not ( = ?auto_60456 ?auto_60453 ) ) ( not ( = ?auto_60456 ?auto_60454 ) ) ( not ( = ?auto_60453 ?auto_60454 ) ) ( not ( = ?auto_60450 ?auto_60453 ) ) ( not ( = ?auto_60450 ?auto_60451 ) ) ( not ( = ?auto_60450 ?auto_60456 ) ) ( not ( = ?auto_60452 ?auto_60453 ) ) ( not ( = ?auto_60452 ?auto_60451 ) ) ( not ( = ?auto_60452 ?auto_60456 ) ) ( not ( = ?auto_60455 ?auto_60453 ) ) ( not ( = ?auto_60455 ?auto_60451 ) ) ( not ( = ?auto_60455 ?auto_60456 ) ) ( ON ?auto_60454 ?auto_60455 ) ( ON ?auto_60453 ?auto_60454 ) ( CLEAR ?auto_60453 ) ( HOLDING ?auto_60456 ) ( CLEAR ?auto_60451 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60451 ?auto_60456 )
      ( MAKE-1PILE ?auto_60450 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61303 - BLOCK
    )
    :vars
    (
      ?auto_61304 - BLOCK
      ?auto_61307 - BLOCK
      ?auto_61308 - BLOCK
      ?auto_61305 - BLOCK
      ?auto_61306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61304 ?auto_61303 ) ( ON-TABLE ?auto_61303 ) ( not ( = ?auto_61303 ?auto_61304 ) ) ( not ( = ?auto_61303 ?auto_61307 ) ) ( not ( = ?auto_61303 ?auto_61308 ) ) ( not ( = ?auto_61304 ?auto_61307 ) ) ( not ( = ?auto_61304 ?auto_61308 ) ) ( not ( = ?auto_61307 ?auto_61308 ) ) ( ON ?auto_61307 ?auto_61304 ) ( not ( = ?auto_61305 ?auto_61306 ) ) ( not ( = ?auto_61305 ?auto_61308 ) ) ( not ( = ?auto_61306 ?auto_61308 ) ) ( not ( = ?auto_61303 ?auto_61306 ) ) ( not ( = ?auto_61303 ?auto_61305 ) ) ( not ( = ?auto_61304 ?auto_61306 ) ) ( not ( = ?auto_61304 ?auto_61305 ) ) ( not ( = ?auto_61307 ?auto_61306 ) ) ( not ( = ?auto_61307 ?auto_61305 ) ) ( ON ?auto_61308 ?auto_61307 ) ( ON ?auto_61306 ?auto_61308 ) ( ON ?auto_61305 ?auto_61306 ) ( CLEAR ?auto_61305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61303 ?auto_61304 ?auto_61307 ?auto_61308 ?auto_61306 )
      ( MAKE-1PILE ?auto_61303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60464 - BLOCK
    )
    :vars
    (
      ?auto_60470 - BLOCK
      ?auto_60466 - BLOCK
      ?auto_60467 - BLOCK
      ?auto_60465 - BLOCK
      ?auto_60468 - BLOCK
      ?auto_60469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60470 ?auto_60464 ) ( ON-TABLE ?auto_60464 ) ( not ( = ?auto_60464 ?auto_60470 ) ) ( not ( = ?auto_60464 ?auto_60466 ) ) ( not ( = ?auto_60464 ?auto_60467 ) ) ( not ( = ?auto_60470 ?auto_60466 ) ) ( not ( = ?auto_60470 ?auto_60467 ) ) ( not ( = ?auto_60466 ?auto_60467 ) ) ( ON ?auto_60466 ?auto_60470 ) ( not ( = ?auto_60465 ?auto_60468 ) ) ( not ( = ?auto_60465 ?auto_60469 ) ) ( not ( = ?auto_60465 ?auto_60467 ) ) ( not ( = ?auto_60468 ?auto_60469 ) ) ( not ( = ?auto_60468 ?auto_60467 ) ) ( not ( = ?auto_60469 ?auto_60467 ) ) ( not ( = ?auto_60464 ?auto_60469 ) ) ( not ( = ?auto_60464 ?auto_60465 ) ) ( not ( = ?auto_60464 ?auto_60468 ) ) ( not ( = ?auto_60470 ?auto_60469 ) ) ( not ( = ?auto_60470 ?auto_60465 ) ) ( not ( = ?auto_60470 ?auto_60468 ) ) ( not ( = ?auto_60466 ?auto_60469 ) ) ( not ( = ?auto_60466 ?auto_60465 ) ) ( not ( = ?auto_60466 ?auto_60468 ) ) ( ON ?auto_60467 ?auto_60466 ) ( ON ?auto_60469 ?auto_60467 ) ( ON ?auto_60468 ?auto_60469 ) ( CLEAR ?auto_60468 ) ( HOLDING ?auto_60465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60465 )
      ( MAKE-1PILE ?auto_60464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60471 - BLOCK
    )
    :vars
    (
      ?auto_60477 - BLOCK
      ?auto_60475 - BLOCK
      ?auto_60476 - BLOCK
      ?auto_60472 - BLOCK
      ?auto_60473 - BLOCK
      ?auto_60474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60477 ?auto_60471 ) ( ON-TABLE ?auto_60471 ) ( not ( = ?auto_60471 ?auto_60477 ) ) ( not ( = ?auto_60471 ?auto_60475 ) ) ( not ( = ?auto_60471 ?auto_60476 ) ) ( not ( = ?auto_60477 ?auto_60475 ) ) ( not ( = ?auto_60477 ?auto_60476 ) ) ( not ( = ?auto_60475 ?auto_60476 ) ) ( ON ?auto_60475 ?auto_60477 ) ( not ( = ?auto_60472 ?auto_60473 ) ) ( not ( = ?auto_60472 ?auto_60474 ) ) ( not ( = ?auto_60472 ?auto_60476 ) ) ( not ( = ?auto_60473 ?auto_60474 ) ) ( not ( = ?auto_60473 ?auto_60476 ) ) ( not ( = ?auto_60474 ?auto_60476 ) ) ( not ( = ?auto_60471 ?auto_60474 ) ) ( not ( = ?auto_60471 ?auto_60472 ) ) ( not ( = ?auto_60471 ?auto_60473 ) ) ( not ( = ?auto_60477 ?auto_60474 ) ) ( not ( = ?auto_60477 ?auto_60472 ) ) ( not ( = ?auto_60477 ?auto_60473 ) ) ( not ( = ?auto_60475 ?auto_60474 ) ) ( not ( = ?auto_60475 ?auto_60472 ) ) ( not ( = ?auto_60475 ?auto_60473 ) ) ( ON ?auto_60476 ?auto_60475 ) ( ON ?auto_60474 ?auto_60476 ) ( ON ?auto_60473 ?auto_60474 ) ( ON ?auto_60472 ?auto_60473 ) ( CLEAR ?auto_60472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60471 ?auto_60477 ?auto_60475 ?auto_60476 ?auto_60474 ?auto_60473 )
      ( MAKE-1PILE ?auto_60471 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60484 - BLOCK
      ?auto_60485 - BLOCK
      ?auto_60486 - BLOCK
      ?auto_60487 - BLOCK
      ?auto_60488 - BLOCK
      ?auto_60489 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_60489 ) ( CLEAR ?auto_60488 ) ( ON-TABLE ?auto_60484 ) ( ON ?auto_60485 ?auto_60484 ) ( ON ?auto_60486 ?auto_60485 ) ( ON ?auto_60487 ?auto_60486 ) ( ON ?auto_60488 ?auto_60487 ) ( not ( = ?auto_60484 ?auto_60485 ) ) ( not ( = ?auto_60484 ?auto_60486 ) ) ( not ( = ?auto_60484 ?auto_60487 ) ) ( not ( = ?auto_60484 ?auto_60488 ) ) ( not ( = ?auto_60484 ?auto_60489 ) ) ( not ( = ?auto_60485 ?auto_60486 ) ) ( not ( = ?auto_60485 ?auto_60487 ) ) ( not ( = ?auto_60485 ?auto_60488 ) ) ( not ( = ?auto_60485 ?auto_60489 ) ) ( not ( = ?auto_60486 ?auto_60487 ) ) ( not ( = ?auto_60486 ?auto_60488 ) ) ( not ( = ?auto_60486 ?auto_60489 ) ) ( not ( = ?auto_60487 ?auto_60488 ) ) ( not ( = ?auto_60487 ?auto_60489 ) ) ( not ( = ?auto_60488 ?auto_60489 ) ) )
    :subtasks
    ( ( !STACK ?auto_60489 ?auto_60488 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60490 - BLOCK
      ?auto_60491 - BLOCK
      ?auto_60492 - BLOCK
      ?auto_60493 - BLOCK
      ?auto_60494 - BLOCK
      ?auto_60495 - BLOCK
    )
    :vars
    (
      ?auto_60496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_60494 ) ( ON-TABLE ?auto_60490 ) ( ON ?auto_60491 ?auto_60490 ) ( ON ?auto_60492 ?auto_60491 ) ( ON ?auto_60493 ?auto_60492 ) ( ON ?auto_60494 ?auto_60493 ) ( not ( = ?auto_60490 ?auto_60491 ) ) ( not ( = ?auto_60490 ?auto_60492 ) ) ( not ( = ?auto_60490 ?auto_60493 ) ) ( not ( = ?auto_60490 ?auto_60494 ) ) ( not ( = ?auto_60490 ?auto_60495 ) ) ( not ( = ?auto_60491 ?auto_60492 ) ) ( not ( = ?auto_60491 ?auto_60493 ) ) ( not ( = ?auto_60491 ?auto_60494 ) ) ( not ( = ?auto_60491 ?auto_60495 ) ) ( not ( = ?auto_60492 ?auto_60493 ) ) ( not ( = ?auto_60492 ?auto_60494 ) ) ( not ( = ?auto_60492 ?auto_60495 ) ) ( not ( = ?auto_60493 ?auto_60494 ) ) ( not ( = ?auto_60493 ?auto_60495 ) ) ( not ( = ?auto_60494 ?auto_60495 ) ) ( ON ?auto_60495 ?auto_60496 ) ( CLEAR ?auto_60495 ) ( HAND-EMPTY ) ( not ( = ?auto_60490 ?auto_60496 ) ) ( not ( = ?auto_60491 ?auto_60496 ) ) ( not ( = ?auto_60492 ?auto_60496 ) ) ( not ( = ?auto_60493 ?auto_60496 ) ) ( not ( = ?auto_60494 ?auto_60496 ) ) ( not ( = ?auto_60495 ?auto_60496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60495 ?auto_60496 )
      ( MAKE-6PILE ?auto_60490 ?auto_60491 ?auto_60492 ?auto_60493 ?auto_60494 ?auto_60495 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60497 - BLOCK
      ?auto_60498 - BLOCK
      ?auto_60499 - BLOCK
      ?auto_60500 - BLOCK
      ?auto_60501 - BLOCK
      ?auto_60502 - BLOCK
    )
    :vars
    (
      ?auto_60503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60497 ) ( ON ?auto_60498 ?auto_60497 ) ( ON ?auto_60499 ?auto_60498 ) ( ON ?auto_60500 ?auto_60499 ) ( not ( = ?auto_60497 ?auto_60498 ) ) ( not ( = ?auto_60497 ?auto_60499 ) ) ( not ( = ?auto_60497 ?auto_60500 ) ) ( not ( = ?auto_60497 ?auto_60501 ) ) ( not ( = ?auto_60497 ?auto_60502 ) ) ( not ( = ?auto_60498 ?auto_60499 ) ) ( not ( = ?auto_60498 ?auto_60500 ) ) ( not ( = ?auto_60498 ?auto_60501 ) ) ( not ( = ?auto_60498 ?auto_60502 ) ) ( not ( = ?auto_60499 ?auto_60500 ) ) ( not ( = ?auto_60499 ?auto_60501 ) ) ( not ( = ?auto_60499 ?auto_60502 ) ) ( not ( = ?auto_60500 ?auto_60501 ) ) ( not ( = ?auto_60500 ?auto_60502 ) ) ( not ( = ?auto_60501 ?auto_60502 ) ) ( ON ?auto_60502 ?auto_60503 ) ( CLEAR ?auto_60502 ) ( not ( = ?auto_60497 ?auto_60503 ) ) ( not ( = ?auto_60498 ?auto_60503 ) ) ( not ( = ?auto_60499 ?auto_60503 ) ) ( not ( = ?auto_60500 ?auto_60503 ) ) ( not ( = ?auto_60501 ?auto_60503 ) ) ( not ( = ?auto_60502 ?auto_60503 ) ) ( HOLDING ?auto_60501 ) ( CLEAR ?auto_60500 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60497 ?auto_60498 ?auto_60499 ?auto_60500 ?auto_60501 )
      ( MAKE-6PILE ?auto_60497 ?auto_60498 ?auto_60499 ?auto_60500 ?auto_60501 ?auto_60502 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60504 - BLOCK
      ?auto_60505 - BLOCK
      ?auto_60506 - BLOCK
      ?auto_60507 - BLOCK
      ?auto_60508 - BLOCK
      ?auto_60509 - BLOCK
    )
    :vars
    (
      ?auto_60510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60504 ) ( ON ?auto_60505 ?auto_60504 ) ( ON ?auto_60506 ?auto_60505 ) ( ON ?auto_60507 ?auto_60506 ) ( not ( = ?auto_60504 ?auto_60505 ) ) ( not ( = ?auto_60504 ?auto_60506 ) ) ( not ( = ?auto_60504 ?auto_60507 ) ) ( not ( = ?auto_60504 ?auto_60508 ) ) ( not ( = ?auto_60504 ?auto_60509 ) ) ( not ( = ?auto_60505 ?auto_60506 ) ) ( not ( = ?auto_60505 ?auto_60507 ) ) ( not ( = ?auto_60505 ?auto_60508 ) ) ( not ( = ?auto_60505 ?auto_60509 ) ) ( not ( = ?auto_60506 ?auto_60507 ) ) ( not ( = ?auto_60506 ?auto_60508 ) ) ( not ( = ?auto_60506 ?auto_60509 ) ) ( not ( = ?auto_60507 ?auto_60508 ) ) ( not ( = ?auto_60507 ?auto_60509 ) ) ( not ( = ?auto_60508 ?auto_60509 ) ) ( ON ?auto_60509 ?auto_60510 ) ( not ( = ?auto_60504 ?auto_60510 ) ) ( not ( = ?auto_60505 ?auto_60510 ) ) ( not ( = ?auto_60506 ?auto_60510 ) ) ( not ( = ?auto_60507 ?auto_60510 ) ) ( not ( = ?auto_60508 ?auto_60510 ) ) ( not ( = ?auto_60509 ?auto_60510 ) ) ( CLEAR ?auto_60507 ) ( ON ?auto_60508 ?auto_60509 ) ( CLEAR ?auto_60508 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60510 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60510 ?auto_60509 )
      ( MAKE-6PILE ?auto_60504 ?auto_60505 ?auto_60506 ?auto_60507 ?auto_60508 ?auto_60509 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60511 - BLOCK
      ?auto_60512 - BLOCK
      ?auto_60513 - BLOCK
      ?auto_60514 - BLOCK
      ?auto_60515 - BLOCK
      ?auto_60516 - BLOCK
    )
    :vars
    (
      ?auto_60517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60511 ) ( ON ?auto_60512 ?auto_60511 ) ( ON ?auto_60513 ?auto_60512 ) ( not ( = ?auto_60511 ?auto_60512 ) ) ( not ( = ?auto_60511 ?auto_60513 ) ) ( not ( = ?auto_60511 ?auto_60514 ) ) ( not ( = ?auto_60511 ?auto_60515 ) ) ( not ( = ?auto_60511 ?auto_60516 ) ) ( not ( = ?auto_60512 ?auto_60513 ) ) ( not ( = ?auto_60512 ?auto_60514 ) ) ( not ( = ?auto_60512 ?auto_60515 ) ) ( not ( = ?auto_60512 ?auto_60516 ) ) ( not ( = ?auto_60513 ?auto_60514 ) ) ( not ( = ?auto_60513 ?auto_60515 ) ) ( not ( = ?auto_60513 ?auto_60516 ) ) ( not ( = ?auto_60514 ?auto_60515 ) ) ( not ( = ?auto_60514 ?auto_60516 ) ) ( not ( = ?auto_60515 ?auto_60516 ) ) ( ON ?auto_60516 ?auto_60517 ) ( not ( = ?auto_60511 ?auto_60517 ) ) ( not ( = ?auto_60512 ?auto_60517 ) ) ( not ( = ?auto_60513 ?auto_60517 ) ) ( not ( = ?auto_60514 ?auto_60517 ) ) ( not ( = ?auto_60515 ?auto_60517 ) ) ( not ( = ?auto_60516 ?auto_60517 ) ) ( ON ?auto_60515 ?auto_60516 ) ( CLEAR ?auto_60515 ) ( ON-TABLE ?auto_60517 ) ( HOLDING ?auto_60514 ) ( CLEAR ?auto_60513 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60511 ?auto_60512 ?auto_60513 ?auto_60514 )
      ( MAKE-6PILE ?auto_60511 ?auto_60512 ?auto_60513 ?auto_60514 ?auto_60515 ?auto_60516 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60518 - BLOCK
      ?auto_60519 - BLOCK
      ?auto_60520 - BLOCK
      ?auto_60521 - BLOCK
      ?auto_60522 - BLOCK
      ?auto_60523 - BLOCK
    )
    :vars
    (
      ?auto_60524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60518 ) ( ON ?auto_60519 ?auto_60518 ) ( ON ?auto_60520 ?auto_60519 ) ( not ( = ?auto_60518 ?auto_60519 ) ) ( not ( = ?auto_60518 ?auto_60520 ) ) ( not ( = ?auto_60518 ?auto_60521 ) ) ( not ( = ?auto_60518 ?auto_60522 ) ) ( not ( = ?auto_60518 ?auto_60523 ) ) ( not ( = ?auto_60519 ?auto_60520 ) ) ( not ( = ?auto_60519 ?auto_60521 ) ) ( not ( = ?auto_60519 ?auto_60522 ) ) ( not ( = ?auto_60519 ?auto_60523 ) ) ( not ( = ?auto_60520 ?auto_60521 ) ) ( not ( = ?auto_60520 ?auto_60522 ) ) ( not ( = ?auto_60520 ?auto_60523 ) ) ( not ( = ?auto_60521 ?auto_60522 ) ) ( not ( = ?auto_60521 ?auto_60523 ) ) ( not ( = ?auto_60522 ?auto_60523 ) ) ( ON ?auto_60523 ?auto_60524 ) ( not ( = ?auto_60518 ?auto_60524 ) ) ( not ( = ?auto_60519 ?auto_60524 ) ) ( not ( = ?auto_60520 ?auto_60524 ) ) ( not ( = ?auto_60521 ?auto_60524 ) ) ( not ( = ?auto_60522 ?auto_60524 ) ) ( not ( = ?auto_60523 ?auto_60524 ) ) ( ON ?auto_60522 ?auto_60523 ) ( ON-TABLE ?auto_60524 ) ( CLEAR ?auto_60520 ) ( ON ?auto_60521 ?auto_60522 ) ( CLEAR ?auto_60521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60524 ?auto_60523 ?auto_60522 )
      ( MAKE-6PILE ?auto_60518 ?auto_60519 ?auto_60520 ?auto_60521 ?auto_60522 ?auto_60523 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60525 - BLOCK
      ?auto_60526 - BLOCK
      ?auto_60527 - BLOCK
      ?auto_60528 - BLOCK
      ?auto_60529 - BLOCK
      ?auto_60530 - BLOCK
    )
    :vars
    (
      ?auto_60531 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60525 ) ( ON ?auto_60526 ?auto_60525 ) ( not ( = ?auto_60525 ?auto_60526 ) ) ( not ( = ?auto_60525 ?auto_60527 ) ) ( not ( = ?auto_60525 ?auto_60528 ) ) ( not ( = ?auto_60525 ?auto_60529 ) ) ( not ( = ?auto_60525 ?auto_60530 ) ) ( not ( = ?auto_60526 ?auto_60527 ) ) ( not ( = ?auto_60526 ?auto_60528 ) ) ( not ( = ?auto_60526 ?auto_60529 ) ) ( not ( = ?auto_60526 ?auto_60530 ) ) ( not ( = ?auto_60527 ?auto_60528 ) ) ( not ( = ?auto_60527 ?auto_60529 ) ) ( not ( = ?auto_60527 ?auto_60530 ) ) ( not ( = ?auto_60528 ?auto_60529 ) ) ( not ( = ?auto_60528 ?auto_60530 ) ) ( not ( = ?auto_60529 ?auto_60530 ) ) ( ON ?auto_60530 ?auto_60531 ) ( not ( = ?auto_60525 ?auto_60531 ) ) ( not ( = ?auto_60526 ?auto_60531 ) ) ( not ( = ?auto_60527 ?auto_60531 ) ) ( not ( = ?auto_60528 ?auto_60531 ) ) ( not ( = ?auto_60529 ?auto_60531 ) ) ( not ( = ?auto_60530 ?auto_60531 ) ) ( ON ?auto_60529 ?auto_60530 ) ( ON-TABLE ?auto_60531 ) ( ON ?auto_60528 ?auto_60529 ) ( CLEAR ?auto_60528 ) ( HOLDING ?auto_60527 ) ( CLEAR ?auto_60526 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60525 ?auto_60526 ?auto_60527 )
      ( MAKE-6PILE ?auto_60525 ?auto_60526 ?auto_60527 ?auto_60528 ?auto_60529 ?auto_60530 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60532 - BLOCK
      ?auto_60533 - BLOCK
      ?auto_60534 - BLOCK
      ?auto_60535 - BLOCK
      ?auto_60536 - BLOCK
      ?auto_60537 - BLOCK
    )
    :vars
    (
      ?auto_60538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60532 ) ( ON ?auto_60533 ?auto_60532 ) ( not ( = ?auto_60532 ?auto_60533 ) ) ( not ( = ?auto_60532 ?auto_60534 ) ) ( not ( = ?auto_60532 ?auto_60535 ) ) ( not ( = ?auto_60532 ?auto_60536 ) ) ( not ( = ?auto_60532 ?auto_60537 ) ) ( not ( = ?auto_60533 ?auto_60534 ) ) ( not ( = ?auto_60533 ?auto_60535 ) ) ( not ( = ?auto_60533 ?auto_60536 ) ) ( not ( = ?auto_60533 ?auto_60537 ) ) ( not ( = ?auto_60534 ?auto_60535 ) ) ( not ( = ?auto_60534 ?auto_60536 ) ) ( not ( = ?auto_60534 ?auto_60537 ) ) ( not ( = ?auto_60535 ?auto_60536 ) ) ( not ( = ?auto_60535 ?auto_60537 ) ) ( not ( = ?auto_60536 ?auto_60537 ) ) ( ON ?auto_60537 ?auto_60538 ) ( not ( = ?auto_60532 ?auto_60538 ) ) ( not ( = ?auto_60533 ?auto_60538 ) ) ( not ( = ?auto_60534 ?auto_60538 ) ) ( not ( = ?auto_60535 ?auto_60538 ) ) ( not ( = ?auto_60536 ?auto_60538 ) ) ( not ( = ?auto_60537 ?auto_60538 ) ) ( ON ?auto_60536 ?auto_60537 ) ( ON-TABLE ?auto_60538 ) ( ON ?auto_60535 ?auto_60536 ) ( CLEAR ?auto_60533 ) ( ON ?auto_60534 ?auto_60535 ) ( CLEAR ?auto_60534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60538 ?auto_60537 ?auto_60536 ?auto_60535 )
      ( MAKE-6PILE ?auto_60532 ?auto_60533 ?auto_60534 ?auto_60535 ?auto_60536 ?auto_60537 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60539 - BLOCK
      ?auto_60540 - BLOCK
      ?auto_60541 - BLOCK
      ?auto_60542 - BLOCK
      ?auto_60543 - BLOCK
      ?auto_60544 - BLOCK
    )
    :vars
    (
      ?auto_60545 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60539 ) ( not ( = ?auto_60539 ?auto_60540 ) ) ( not ( = ?auto_60539 ?auto_60541 ) ) ( not ( = ?auto_60539 ?auto_60542 ) ) ( not ( = ?auto_60539 ?auto_60543 ) ) ( not ( = ?auto_60539 ?auto_60544 ) ) ( not ( = ?auto_60540 ?auto_60541 ) ) ( not ( = ?auto_60540 ?auto_60542 ) ) ( not ( = ?auto_60540 ?auto_60543 ) ) ( not ( = ?auto_60540 ?auto_60544 ) ) ( not ( = ?auto_60541 ?auto_60542 ) ) ( not ( = ?auto_60541 ?auto_60543 ) ) ( not ( = ?auto_60541 ?auto_60544 ) ) ( not ( = ?auto_60542 ?auto_60543 ) ) ( not ( = ?auto_60542 ?auto_60544 ) ) ( not ( = ?auto_60543 ?auto_60544 ) ) ( ON ?auto_60544 ?auto_60545 ) ( not ( = ?auto_60539 ?auto_60545 ) ) ( not ( = ?auto_60540 ?auto_60545 ) ) ( not ( = ?auto_60541 ?auto_60545 ) ) ( not ( = ?auto_60542 ?auto_60545 ) ) ( not ( = ?auto_60543 ?auto_60545 ) ) ( not ( = ?auto_60544 ?auto_60545 ) ) ( ON ?auto_60543 ?auto_60544 ) ( ON-TABLE ?auto_60545 ) ( ON ?auto_60542 ?auto_60543 ) ( ON ?auto_60541 ?auto_60542 ) ( CLEAR ?auto_60541 ) ( HOLDING ?auto_60540 ) ( CLEAR ?auto_60539 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60539 ?auto_60540 )
      ( MAKE-6PILE ?auto_60539 ?auto_60540 ?auto_60541 ?auto_60542 ?auto_60543 ?auto_60544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60546 - BLOCK
      ?auto_60547 - BLOCK
      ?auto_60548 - BLOCK
      ?auto_60549 - BLOCK
      ?auto_60550 - BLOCK
      ?auto_60551 - BLOCK
    )
    :vars
    (
      ?auto_60552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60546 ) ( not ( = ?auto_60546 ?auto_60547 ) ) ( not ( = ?auto_60546 ?auto_60548 ) ) ( not ( = ?auto_60546 ?auto_60549 ) ) ( not ( = ?auto_60546 ?auto_60550 ) ) ( not ( = ?auto_60546 ?auto_60551 ) ) ( not ( = ?auto_60547 ?auto_60548 ) ) ( not ( = ?auto_60547 ?auto_60549 ) ) ( not ( = ?auto_60547 ?auto_60550 ) ) ( not ( = ?auto_60547 ?auto_60551 ) ) ( not ( = ?auto_60548 ?auto_60549 ) ) ( not ( = ?auto_60548 ?auto_60550 ) ) ( not ( = ?auto_60548 ?auto_60551 ) ) ( not ( = ?auto_60549 ?auto_60550 ) ) ( not ( = ?auto_60549 ?auto_60551 ) ) ( not ( = ?auto_60550 ?auto_60551 ) ) ( ON ?auto_60551 ?auto_60552 ) ( not ( = ?auto_60546 ?auto_60552 ) ) ( not ( = ?auto_60547 ?auto_60552 ) ) ( not ( = ?auto_60548 ?auto_60552 ) ) ( not ( = ?auto_60549 ?auto_60552 ) ) ( not ( = ?auto_60550 ?auto_60552 ) ) ( not ( = ?auto_60551 ?auto_60552 ) ) ( ON ?auto_60550 ?auto_60551 ) ( ON-TABLE ?auto_60552 ) ( ON ?auto_60549 ?auto_60550 ) ( ON ?auto_60548 ?auto_60549 ) ( CLEAR ?auto_60546 ) ( ON ?auto_60547 ?auto_60548 ) ( CLEAR ?auto_60547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60552 ?auto_60551 ?auto_60550 ?auto_60549 ?auto_60548 )
      ( MAKE-6PILE ?auto_60546 ?auto_60547 ?auto_60548 ?auto_60549 ?auto_60550 ?auto_60551 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60553 - BLOCK
      ?auto_60554 - BLOCK
      ?auto_60555 - BLOCK
      ?auto_60556 - BLOCK
      ?auto_60557 - BLOCK
      ?auto_60558 - BLOCK
    )
    :vars
    (
      ?auto_60559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60553 ?auto_60554 ) ) ( not ( = ?auto_60553 ?auto_60555 ) ) ( not ( = ?auto_60553 ?auto_60556 ) ) ( not ( = ?auto_60553 ?auto_60557 ) ) ( not ( = ?auto_60553 ?auto_60558 ) ) ( not ( = ?auto_60554 ?auto_60555 ) ) ( not ( = ?auto_60554 ?auto_60556 ) ) ( not ( = ?auto_60554 ?auto_60557 ) ) ( not ( = ?auto_60554 ?auto_60558 ) ) ( not ( = ?auto_60555 ?auto_60556 ) ) ( not ( = ?auto_60555 ?auto_60557 ) ) ( not ( = ?auto_60555 ?auto_60558 ) ) ( not ( = ?auto_60556 ?auto_60557 ) ) ( not ( = ?auto_60556 ?auto_60558 ) ) ( not ( = ?auto_60557 ?auto_60558 ) ) ( ON ?auto_60558 ?auto_60559 ) ( not ( = ?auto_60553 ?auto_60559 ) ) ( not ( = ?auto_60554 ?auto_60559 ) ) ( not ( = ?auto_60555 ?auto_60559 ) ) ( not ( = ?auto_60556 ?auto_60559 ) ) ( not ( = ?auto_60557 ?auto_60559 ) ) ( not ( = ?auto_60558 ?auto_60559 ) ) ( ON ?auto_60557 ?auto_60558 ) ( ON-TABLE ?auto_60559 ) ( ON ?auto_60556 ?auto_60557 ) ( ON ?auto_60555 ?auto_60556 ) ( ON ?auto_60554 ?auto_60555 ) ( CLEAR ?auto_60554 ) ( HOLDING ?auto_60553 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60553 )
      ( MAKE-6PILE ?auto_60553 ?auto_60554 ?auto_60555 ?auto_60556 ?auto_60557 ?auto_60558 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_60560 - BLOCK
      ?auto_60561 - BLOCK
      ?auto_60562 - BLOCK
      ?auto_60563 - BLOCK
      ?auto_60564 - BLOCK
      ?auto_60565 - BLOCK
    )
    :vars
    (
      ?auto_60566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60560 ?auto_60561 ) ) ( not ( = ?auto_60560 ?auto_60562 ) ) ( not ( = ?auto_60560 ?auto_60563 ) ) ( not ( = ?auto_60560 ?auto_60564 ) ) ( not ( = ?auto_60560 ?auto_60565 ) ) ( not ( = ?auto_60561 ?auto_60562 ) ) ( not ( = ?auto_60561 ?auto_60563 ) ) ( not ( = ?auto_60561 ?auto_60564 ) ) ( not ( = ?auto_60561 ?auto_60565 ) ) ( not ( = ?auto_60562 ?auto_60563 ) ) ( not ( = ?auto_60562 ?auto_60564 ) ) ( not ( = ?auto_60562 ?auto_60565 ) ) ( not ( = ?auto_60563 ?auto_60564 ) ) ( not ( = ?auto_60563 ?auto_60565 ) ) ( not ( = ?auto_60564 ?auto_60565 ) ) ( ON ?auto_60565 ?auto_60566 ) ( not ( = ?auto_60560 ?auto_60566 ) ) ( not ( = ?auto_60561 ?auto_60566 ) ) ( not ( = ?auto_60562 ?auto_60566 ) ) ( not ( = ?auto_60563 ?auto_60566 ) ) ( not ( = ?auto_60564 ?auto_60566 ) ) ( not ( = ?auto_60565 ?auto_60566 ) ) ( ON ?auto_60564 ?auto_60565 ) ( ON-TABLE ?auto_60566 ) ( ON ?auto_60563 ?auto_60564 ) ( ON ?auto_60562 ?auto_60563 ) ( ON ?auto_60561 ?auto_60562 ) ( ON ?auto_60560 ?auto_60561 ) ( CLEAR ?auto_60560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60566 ?auto_60565 ?auto_60564 ?auto_60563 ?auto_60562 ?auto_60561 )
      ( MAKE-6PILE ?auto_60560 ?auto_60561 ?auto_60562 ?auto_60563 ?auto_60564 ?auto_60565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60647 - BLOCK
    )
    :vars
    (
      ?auto_60648 - BLOCK
      ?auto_60649 - BLOCK
      ?auto_60650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60647 ?auto_60648 ) ( CLEAR ?auto_60647 ) ( not ( = ?auto_60647 ?auto_60648 ) ) ( HOLDING ?auto_60649 ) ( CLEAR ?auto_60650 ) ( not ( = ?auto_60647 ?auto_60649 ) ) ( not ( = ?auto_60647 ?auto_60650 ) ) ( not ( = ?auto_60648 ?auto_60649 ) ) ( not ( = ?auto_60648 ?auto_60650 ) ) ( not ( = ?auto_60649 ?auto_60650 ) ) )
    :subtasks
    ( ( !STACK ?auto_60649 ?auto_60650 )
      ( MAKE-1PILE ?auto_60647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60651 - BLOCK
    )
    :vars
    (
      ?auto_60654 - BLOCK
      ?auto_60652 - BLOCK
      ?auto_60653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60651 ?auto_60654 ) ( not ( = ?auto_60651 ?auto_60654 ) ) ( CLEAR ?auto_60652 ) ( not ( = ?auto_60651 ?auto_60653 ) ) ( not ( = ?auto_60651 ?auto_60652 ) ) ( not ( = ?auto_60654 ?auto_60653 ) ) ( not ( = ?auto_60654 ?auto_60652 ) ) ( not ( = ?auto_60653 ?auto_60652 ) ) ( ON ?auto_60653 ?auto_60651 ) ( CLEAR ?auto_60653 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60654 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60654 ?auto_60651 )
      ( MAKE-1PILE ?auto_60651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60655 - BLOCK
    )
    :vars
    (
      ?auto_60658 - BLOCK
      ?auto_60656 - BLOCK
      ?auto_60657 - BLOCK
      ?auto_60661 - BLOCK
      ?auto_60660 - BLOCK
      ?auto_60659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60655 ?auto_60658 ) ( not ( = ?auto_60655 ?auto_60658 ) ) ( not ( = ?auto_60655 ?auto_60656 ) ) ( not ( = ?auto_60655 ?auto_60657 ) ) ( not ( = ?auto_60658 ?auto_60656 ) ) ( not ( = ?auto_60658 ?auto_60657 ) ) ( not ( = ?auto_60656 ?auto_60657 ) ) ( ON ?auto_60656 ?auto_60655 ) ( CLEAR ?auto_60656 ) ( ON-TABLE ?auto_60658 ) ( HOLDING ?auto_60657 ) ( CLEAR ?auto_60661 ) ( ON-TABLE ?auto_60660 ) ( ON ?auto_60659 ?auto_60660 ) ( ON ?auto_60661 ?auto_60659 ) ( not ( = ?auto_60660 ?auto_60659 ) ) ( not ( = ?auto_60660 ?auto_60661 ) ) ( not ( = ?auto_60660 ?auto_60657 ) ) ( not ( = ?auto_60659 ?auto_60661 ) ) ( not ( = ?auto_60659 ?auto_60657 ) ) ( not ( = ?auto_60661 ?auto_60657 ) ) ( not ( = ?auto_60655 ?auto_60661 ) ) ( not ( = ?auto_60655 ?auto_60660 ) ) ( not ( = ?auto_60655 ?auto_60659 ) ) ( not ( = ?auto_60658 ?auto_60661 ) ) ( not ( = ?auto_60658 ?auto_60660 ) ) ( not ( = ?auto_60658 ?auto_60659 ) ) ( not ( = ?auto_60656 ?auto_60661 ) ) ( not ( = ?auto_60656 ?auto_60660 ) ) ( not ( = ?auto_60656 ?auto_60659 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60660 ?auto_60659 ?auto_60661 ?auto_60657 )
      ( MAKE-1PILE ?auto_60655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60662 - BLOCK
    )
    :vars
    (
      ?auto_60667 - BLOCK
      ?auto_60663 - BLOCK
      ?auto_60665 - BLOCK
      ?auto_60666 - BLOCK
      ?auto_60664 - BLOCK
      ?auto_60668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60662 ?auto_60667 ) ( not ( = ?auto_60662 ?auto_60667 ) ) ( not ( = ?auto_60662 ?auto_60663 ) ) ( not ( = ?auto_60662 ?auto_60665 ) ) ( not ( = ?auto_60667 ?auto_60663 ) ) ( not ( = ?auto_60667 ?auto_60665 ) ) ( not ( = ?auto_60663 ?auto_60665 ) ) ( ON ?auto_60663 ?auto_60662 ) ( ON-TABLE ?auto_60667 ) ( CLEAR ?auto_60666 ) ( ON-TABLE ?auto_60664 ) ( ON ?auto_60668 ?auto_60664 ) ( ON ?auto_60666 ?auto_60668 ) ( not ( = ?auto_60664 ?auto_60668 ) ) ( not ( = ?auto_60664 ?auto_60666 ) ) ( not ( = ?auto_60664 ?auto_60665 ) ) ( not ( = ?auto_60668 ?auto_60666 ) ) ( not ( = ?auto_60668 ?auto_60665 ) ) ( not ( = ?auto_60666 ?auto_60665 ) ) ( not ( = ?auto_60662 ?auto_60666 ) ) ( not ( = ?auto_60662 ?auto_60664 ) ) ( not ( = ?auto_60662 ?auto_60668 ) ) ( not ( = ?auto_60667 ?auto_60666 ) ) ( not ( = ?auto_60667 ?auto_60664 ) ) ( not ( = ?auto_60667 ?auto_60668 ) ) ( not ( = ?auto_60663 ?auto_60666 ) ) ( not ( = ?auto_60663 ?auto_60664 ) ) ( not ( = ?auto_60663 ?auto_60668 ) ) ( ON ?auto_60665 ?auto_60663 ) ( CLEAR ?auto_60665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60667 ?auto_60662 ?auto_60663 )
      ( MAKE-1PILE ?auto_60662 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60669 - BLOCK
    )
    :vars
    (
      ?auto_60671 - BLOCK
      ?auto_60673 - BLOCK
      ?auto_60670 - BLOCK
      ?auto_60672 - BLOCK
      ?auto_60675 - BLOCK
      ?auto_60674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60669 ?auto_60671 ) ( not ( = ?auto_60669 ?auto_60671 ) ) ( not ( = ?auto_60669 ?auto_60673 ) ) ( not ( = ?auto_60669 ?auto_60670 ) ) ( not ( = ?auto_60671 ?auto_60673 ) ) ( not ( = ?auto_60671 ?auto_60670 ) ) ( not ( = ?auto_60673 ?auto_60670 ) ) ( ON ?auto_60673 ?auto_60669 ) ( ON-TABLE ?auto_60671 ) ( ON-TABLE ?auto_60672 ) ( ON ?auto_60675 ?auto_60672 ) ( not ( = ?auto_60672 ?auto_60675 ) ) ( not ( = ?auto_60672 ?auto_60674 ) ) ( not ( = ?auto_60672 ?auto_60670 ) ) ( not ( = ?auto_60675 ?auto_60674 ) ) ( not ( = ?auto_60675 ?auto_60670 ) ) ( not ( = ?auto_60674 ?auto_60670 ) ) ( not ( = ?auto_60669 ?auto_60674 ) ) ( not ( = ?auto_60669 ?auto_60672 ) ) ( not ( = ?auto_60669 ?auto_60675 ) ) ( not ( = ?auto_60671 ?auto_60674 ) ) ( not ( = ?auto_60671 ?auto_60672 ) ) ( not ( = ?auto_60671 ?auto_60675 ) ) ( not ( = ?auto_60673 ?auto_60674 ) ) ( not ( = ?auto_60673 ?auto_60672 ) ) ( not ( = ?auto_60673 ?auto_60675 ) ) ( ON ?auto_60670 ?auto_60673 ) ( CLEAR ?auto_60670 ) ( HOLDING ?auto_60674 ) ( CLEAR ?auto_60675 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60672 ?auto_60675 ?auto_60674 )
      ( MAKE-1PILE ?auto_60669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60676 - BLOCK
    )
    :vars
    (
      ?auto_60681 - BLOCK
      ?auto_60680 - BLOCK
      ?auto_60679 - BLOCK
      ?auto_60682 - BLOCK
      ?auto_60678 - BLOCK
      ?auto_60677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60676 ?auto_60681 ) ( not ( = ?auto_60676 ?auto_60681 ) ) ( not ( = ?auto_60676 ?auto_60680 ) ) ( not ( = ?auto_60676 ?auto_60679 ) ) ( not ( = ?auto_60681 ?auto_60680 ) ) ( not ( = ?auto_60681 ?auto_60679 ) ) ( not ( = ?auto_60680 ?auto_60679 ) ) ( ON ?auto_60680 ?auto_60676 ) ( ON-TABLE ?auto_60681 ) ( ON-TABLE ?auto_60682 ) ( ON ?auto_60678 ?auto_60682 ) ( not ( = ?auto_60682 ?auto_60678 ) ) ( not ( = ?auto_60682 ?auto_60677 ) ) ( not ( = ?auto_60682 ?auto_60679 ) ) ( not ( = ?auto_60678 ?auto_60677 ) ) ( not ( = ?auto_60678 ?auto_60679 ) ) ( not ( = ?auto_60677 ?auto_60679 ) ) ( not ( = ?auto_60676 ?auto_60677 ) ) ( not ( = ?auto_60676 ?auto_60682 ) ) ( not ( = ?auto_60676 ?auto_60678 ) ) ( not ( = ?auto_60681 ?auto_60677 ) ) ( not ( = ?auto_60681 ?auto_60682 ) ) ( not ( = ?auto_60681 ?auto_60678 ) ) ( not ( = ?auto_60680 ?auto_60677 ) ) ( not ( = ?auto_60680 ?auto_60682 ) ) ( not ( = ?auto_60680 ?auto_60678 ) ) ( ON ?auto_60679 ?auto_60680 ) ( CLEAR ?auto_60678 ) ( ON ?auto_60677 ?auto_60679 ) ( CLEAR ?auto_60677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60681 ?auto_60676 ?auto_60680 ?auto_60679 )
      ( MAKE-1PILE ?auto_60676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60683 - BLOCK
    )
    :vars
    (
      ?auto_60684 - BLOCK
      ?auto_60687 - BLOCK
      ?auto_60686 - BLOCK
      ?auto_60689 - BLOCK
      ?auto_60685 - BLOCK
      ?auto_60688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60683 ?auto_60684 ) ( not ( = ?auto_60683 ?auto_60684 ) ) ( not ( = ?auto_60683 ?auto_60687 ) ) ( not ( = ?auto_60683 ?auto_60686 ) ) ( not ( = ?auto_60684 ?auto_60687 ) ) ( not ( = ?auto_60684 ?auto_60686 ) ) ( not ( = ?auto_60687 ?auto_60686 ) ) ( ON ?auto_60687 ?auto_60683 ) ( ON-TABLE ?auto_60684 ) ( ON-TABLE ?auto_60689 ) ( not ( = ?auto_60689 ?auto_60685 ) ) ( not ( = ?auto_60689 ?auto_60688 ) ) ( not ( = ?auto_60689 ?auto_60686 ) ) ( not ( = ?auto_60685 ?auto_60688 ) ) ( not ( = ?auto_60685 ?auto_60686 ) ) ( not ( = ?auto_60688 ?auto_60686 ) ) ( not ( = ?auto_60683 ?auto_60688 ) ) ( not ( = ?auto_60683 ?auto_60689 ) ) ( not ( = ?auto_60683 ?auto_60685 ) ) ( not ( = ?auto_60684 ?auto_60688 ) ) ( not ( = ?auto_60684 ?auto_60689 ) ) ( not ( = ?auto_60684 ?auto_60685 ) ) ( not ( = ?auto_60687 ?auto_60688 ) ) ( not ( = ?auto_60687 ?auto_60689 ) ) ( not ( = ?auto_60687 ?auto_60685 ) ) ( ON ?auto_60686 ?auto_60687 ) ( ON ?auto_60688 ?auto_60686 ) ( CLEAR ?auto_60688 ) ( HOLDING ?auto_60685 ) ( CLEAR ?auto_60689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60689 ?auto_60685 )
      ( MAKE-1PILE ?auto_60683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60690 - BLOCK
    )
    :vars
    (
      ?auto_60696 - BLOCK
      ?auto_60692 - BLOCK
      ?auto_60694 - BLOCK
      ?auto_60693 - BLOCK
      ?auto_60691 - BLOCK
      ?auto_60695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60690 ?auto_60696 ) ( not ( = ?auto_60690 ?auto_60696 ) ) ( not ( = ?auto_60690 ?auto_60692 ) ) ( not ( = ?auto_60690 ?auto_60694 ) ) ( not ( = ?auto_60696 ?auto_60692 ) ) ( not ( = ?auto_60696 ?auto_60694 ) ) ( not ( = ?auto_60692 ?auto_60694 ) ) ( ON ?auto_60692 ?auto_60690 ) ( ON-TABLE ?auto_60696 ) ( ON-TABLE ?auto_60693 ) ( not ( = ?auto_60693 ?auto_60691 ) ) ( not ( = ?auto_60693 ?auto_60695 ) ) ( not ( = ?auto_60693 ?auto_60694 ) ) ( not ( = ?auto_60691 ?auto_60695 ) ) ( not ( = ?auto_60691 ?auto_60694 ) ) ( not ( = ?auto_60695 ?auto_60694 ) ) ( not ( = ?auto_60690 ?auto_60695 ) ) ( not ( = ?auto_60690 ?auto_60693 ) ) ( not ( = ?auto_60690 ?auto_60691 ) ) ( not ( = ?auto_60696 ?auto_60695 ) ) ( not ( = ?auto_60696 ?auto_60693 ) ) ( not ( = ?auto_60696 ?auto_60691 ) ) ( not ( = ?auto_60692 ?auto_60695 ) ) ( not ( = ?auto_60692 ?auto_60693 ) ) ( not ( = ?auto_60692 ?auto_60691 ) ) ( ON ?auto_60694 ?auto_60692 ) ( ON ?auto_60695 ?auto_60694 ) ( CLEAR ?auto_60693 ) ( ON ?auto_60691 ?auto_60695 ) ( CLEAR ?auto_60691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60696 ?auto_60690 ?auto_60692 ?auto_60694 ?auto_60695 )
      ( MAKE-1PILE ?auto_60690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60697 - BLOCK
    )
    :vars
    (
      ?auto_60703 - BLOCK
      ?auto_60701 - BLOCK
      ?auto_60700 - BLOCK
      ?auto_60699 - BLOCK
      ?auto_60702 - BLOCK
      ?auto_60698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60697 ?auto_60703 ) ( not ( = ?auto_60697 ?auto_60703 ) ) ( not ( = ?auto_60697 ?auto_60701 ) ) ( not ( = ?auto_60697 ?auto_60700 ) ) ( not ( = ?auto_60703 ?auto_60701 ) ) ( not ( = ?auto_60703 ?auto_60700 ) ) ( not ( = ?auto_60701 ?auto_60700 ) ) ( ON ?auto_60701 ?auto_60697 ) ( ON-TABLE ?auto_60703 ) ( not ( = ?auto_60699 ?auto_60702 ) ) ( not ( = ?auto_60699 ?auto_60698 ) ) ( not ( = ?auto_60699 ?auto_60700 ) ) ( not ( = ?auto_60702 ?auto_60698 ) ) ( not ( = ?auto_60702 ?auto_60700 ) ) ( not ( = ?auto_60698 ?auto_60700 ) ) ( not ( = ?auto_60697 ?auto_60698 ) ) ( not ( = ?auto_60697 ?auto_60699 ) ) ( not ( = ?auto_60697 ?auto_60702 ) ) ( not ( = ?auto_60703 ?auto_60698 ) ) ( not ( = ?auto_60703 ?auto_60699 ) ) ( not ( = ?auto_60703 ?auto_60702 ) ) ( not ( = ?auto_60701 ?auto_60698 ) ) ( not ( = ?auto_60701 ?auto_60699 ) ) ( not ( = ?auto_60701 ?auto_60702 ) ) ( ON ?auto_60700 ?auto_60701 ) ( ON ?auto_60698 ?auto_60700 ) ( ON ?auto_60702 ?auto_60698 ) ( CLEAR ?auto_60702 ) ( HOLDING ?auto_60699 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60699 )
      ( MAKE-1PILE ?auto_60697 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_60704 - BLOCK
    )
    :vars
    (
      ?auto_60706 - BLOCK
      ?auto_60709 - BLOCK
      ?auto_60708 - BLOCK
      ?auto_60710 - BLOCK
      ?auto_60705 - BLOCK
      ?auto_60707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60704 ?auto_60706 ) ( not ( = ?auto_60704 ?auto_60706 ) ) ( not ( = ?auto_60704 ?auto_60709 ) ) ( not ( = ?auto_60704 ?auto_60708 ) ) ( not ( = ?auto_60706 ?auto_60709 ) ) ( not ( = ?auto_60706 ?auto_60708 ) ) ( not ( = ?auto_60709 ?auto_60708 ) ) ( ON ?auto_60709 ?auto_60704 ) ( ON-TABLE ?auto_60706 ) ( not ( = ?auto_60710 ?auto_60705 ) ) ( not ( = ?auto_60710 ?auto_60707 ) ) ( not ( = ?auto_60710 ?auto_60708 ) ) ( not ( = ?auto_60705 ?auto_60707 ) ) ( not ( = ?auto_60705 ?auto_60708 ) ) ( not ( = ?auto_60707 ?auto_60708 ) ) ( not ( = ?auto_60704 ?auto_60707 ) ) ( not ( = ?auto_60704 ?auto_60710 ) ) ( not ( = ?auto_60704 ?auto_60705 ) ) ( not ( = ?auto_60706 ?auto_60707 ) ) ( not ( = ?auto_60706 ?auto_60710 ) ) ( not ( = ?auto_60706 ?auto_60705 ) ) ( not ( = ?auto_60709 ?auto_60707 ) ) ( not ( = ?auto_60709 ?auto_60710 ) ) ( not ( = ?auto_60709 ?auto_60705 ) ) ( ON ?auto_60708 ?auto_60709 ) ( ON ?auto_60707 ?auto_60708 ) ( ON ?auto_60705 ?auto_60707 ) ( ON ?auto_60710 ?auto_60705 ) ( CLEAR ?auto_60710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60706 ?auto_60704 ?auto_60709 ?auto_60708 ?auto_60707 ?auto_60705 )
      ( MAKE-1PILE ?auto_60704 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_60720 - BLOCK
      ?auto_60721 - BLOCK
      ?auto_60722 - BLOCK
      ?auto_60723 - BLOCK
    )
    :vars
    (
      ?auto_60724 - BLOCK
      ?auto_60725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60724 ?auto_60723 ) ( CLEAR ?auto_60724 ) ( ON-TABLE ?auto_60720 ) ( ON ?auto_60721 ?auto_60720 ) ( ON ?auto_60722 ?auto_60721 ) ( ON ?auto_60723 ?auto_60722 ) ( not ( = ?auto_60720 ?auto_60721 ) ) ( not ( = ?auto_60720 ?auto_60722 ) ) ( not ( = ?auto_60720 ?auto_60723 ) ) ( not ( = ?auto_60720 ?auto_60724 ) ) ( not ( = ?auto_60721 ?auto_60722 ) ) ( not ( = ?auto_60721 ?auto_60723 ) ) ( not ( = ?auto_60721 ?auto_60724 ) ) ( not ( = ?auto_60722 ?auto_60723 ) ) ( not ( = ?auto_60722 ?auto_60724 ) ) ( not ( = ?auto_60723 ?auto_60724 ) ) ( HOLDING ?auto_60725 ) ( not ( = ?auto_60720 ?auto_60725 ) ) ( not ( = ?auto_60721 ?auto_60725 ) ) ( not ( = ?auto_60722 ?auto_60725 ) ) ( not ( = ?auto_60723 ?auto_60725 ) ) ( not ( = ?auto_60724 ?auto_60725 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_60725 )
      ( MAKE-4PILE ?auto_60720 ?auto_60721 ?auto_60722 ?auto_60723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60793 - BLOCK
      ?auto_60794 - BLOCK
    )
    :vars
    (
      ?auto_60795 - BLOCK
      ?auto_60798 - BLOCK
      ?auto_60796 - BLOCK
      ?auto_60797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60793 ?auto_60794 ) ) ( ON ?auto_60794 ?auto_60795 ) ( not ( = ?auto_60793 ?auto_60795 ) ) ( not ( = ?auto_60794 ?auto_60795 ) ) ( ON ?auto_60793 ?auto_60794 ) ( CLEAR ?auto_60793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60798 ) ( ON ?auto_60796 ?auto_60798 ) ( ON ?auto_60797 ?auto_60796 ) ( ON ?auto_60795 ?auto_60797 ) ( not ( = ?auto_60798 ?auto_60796 ) ) ( not ( = ?auto_60798 ?auto_60797 ) ) ( not ( = ?auto_60798 ?auto_60795 ) ) ( not ( = ?auto_60798 ?auto_60794 ) ) ( not ( = ?auto_60798 ?auto_60793 ) ) ( not ( = ?auto_60796 ?auto_60797 ) ) ( not ( = ?auto_60796 ?auto_60795 ) ) ( not ( = ?auto_60796 ?auto_60794 ) ) ( not ( = ?auto_60796 ?auto_60793 ) ) ( not ( = ?auto_60797 ?auto_60795 ) ) ( not ( = ?auto_60797 ?auto_60794 ) ) ( not ( = ?auto_60797 ?auto_60793 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60798 ?auto_60796 ?auto_60797 ?auto_60795 ?auto_60794 )
      ( MAKE-2PILE ?auto_60793 ?auto_60794 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60801 - BLOCK
      ?auto_60802 - BLOCK
    )
    :vars
    (
      ?auto_60803 - BLOCK
      ?auto_60804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60801 ?auto_60802 ) ) ( ON ?auto_60802 ?auto_60803 ) ( CLEAR ?auto_60802 ) ( not ( = ?auto_60801 ?auto_60803 ) ) ( not ( = ?auto_60802 ?auto_60803 ) ) ( ON ?auto_60801 ?auto_60804 ) ( CLEAR ?auto_60801 ) ( HAND-EMPTY ) ( not ( = ?auto_60801 ?auto_60804 ) ) ( not ( = ?auto_60802 ?auto_60804 ) ) ( not ( = ?auto_60803 ?auto_60804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60801 ?auto_60804 )
      ( MAKE-2PILE ?auto_60801 ?auto_60802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60805 - BLOCK
      ?auto_60806 - BLOCK
    )
    :vars
    (
      ?auto_60808 - BLOCK
      ?auto_60807 - BLOCK
      ?auto_60811 - BLOCK
      ?auto_60809 - BLOCK
      ?auto_60810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60805 ?auto_60806 ) ) ( not ( = ?auto_60805 ?auto_60808 ) ) ( not ( = ?auto_60806 ?auto_60808 ) ) ( ON ?auto_60805 ?auto_60807 ) ( CLEAR ?auto_60805 ) ( not ( = ?auto_60805 ?auto_60807 ) ) ( not ( = ?auto_60806 ?auto_60807 ) ) ( not ( = ?auto_60808 ?auto_60807 ) ) ( HOLDING ?auto_60806 ) ( CLEAR ?auto_60808 ) ( ON-TABLE ?auto_60811 ) ( ON ?auto_60809 ?auto_60811 ) ( ON ?auto_60810 ?auto_60809 ) ( ON ?auto_60808 ?auto_60810 ) ( not ( = ?auto_60811 ?auto_60809 ) ) ( not ( = ?auto_60811 ?auto_60810 ) ) ( not ( = ?auto_60811 ?auto_60808 ) ) ( not ( = ?auto_60811 ?auto_60806 ) ) ( not ( = ?auto_60809 ?auto_60810 ) ) ( not ( = ?auto_60809 ?auto_60808 ) ) ( not ( = ?auto_60809 ?auto_60806 ) ) ( not ( = ?auto_60810 ?auto_60808 ) ) ( not ( = ?auto_60810 ?auto_60806 ) ) ( not ( = ?auto_60805 ?auto_60811 ) ) ( not ( = ?auto_60805 ?auto_60809 ) ) ( not ( = ?auto_60805 ?auto_60810 ) ) ( not ( = ?auto_60807 ?auto_60811 ) ) ( not ( = ?auto_60807 ?auto_60809 ) ) ( not ( = ?auto_60807 ?auto_60810 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60811 ?auto_60809 ?auto_60810 ?auto_60808 ?auto_60806 )
      ( MAKE-2PILE ?auto_60805 ?auto_60806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60812 - BLOCK
      ?auto_60813 - BLOCK
    )
    :vars
    (
      ?auto_60814 - BLOCK
      ?auto_60815 - BLOCK
      ?auto_60818 - BLOCK
      ?auto_60817 - BLOCK
      ?auto_60816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60812 ?auto_60813 ) ) ( not ( = ?auto_60812 ?auto_60814 ) ) ( not ( = ?auto_60813 ?auto_60814 ) ) ( ON ?auto_60812 ?auto_60815 ) ( not ( = ?auto_60812 ?auto_60815 ) ) ( not ( = ?auto_60813 ?auto_60815 ) ) ( not ( = ?auto_60814 ?auto_60815 ) ) ( CLEAR ?auto_60814 ) ( ON-TABLE ?auto_60818 ) ( ON ?auto_60817 ?auto_60818 ) ( ON ?auto_60816 ?auto_60817 ) ( ON ?auto_60814 ?auto_60816 ) ( not ( = ?auto_60818 ?auto_60817 ) ) ( not ( = ?auto_60818 ?auto_60816 ) ) ( not ( = ?auto_60818 ?auto_60814 ) ) ( not ( = ?auto_60818 ?auto_60813 ) ) ( not ( = ?auto_60817 ?auto_60816 ) ) ( not ( = ?auto_60817 ?auto_60814 ) ) ( not ( = ?auto_60817 ?auto_60813 ) ) ( not ( = ?auto_60816 ?auto_60814 ) ) ( not ( = ?auto_60816 ?auto_60813 ) ) ( not ( = ?auto_60812 ?auto_60818 ) ) ( not ( = ?auto_60812 ?auto_60817 ) ) ( not ( = ?auto_60812 ?auto_60816 ) ) ( not ( = ?auto_60815 ?auto_60818 ) ) ( not ( = ?auto_60815 ?auto_60817 ) ) ( not ( = ?auto_60815 ?auto_60816 ) ) ( ON ?auto_60813 ?auto_60812 ) ( CLEAR ?auto_60813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60815 ?auto_60812 )
      ( MAKE-2PILE ?auto_60812 ?auto_60813 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60819 - BLOCK
      ?auto_60820 - BLOCK
    )
    :vars
    (
      ?auto_60825 - BLOCK
      ?auto_60821 - BLOCK
      ?auto_60823 - BLOCK
      ?auto_60822 - BLOCK
      ?auto_60824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60819 ?auto_60820 ) ) ( not ( = ?auto_60819 ?auto_60825 ) ) ( not ( = ?auto_60820 ?auto_60825 ) ) ( ON ?auto_60819 ?auto_60821 ) ( not ( = ?auto_60819 ?auto_60821 ) ) ( not ( = ?auto_60820 ?auto_60821 ) ) ( not ( = ?auto_60825 ?auto_60821 ) ) ( ON-TABLE ?auto_60823 ) ( ON ?auto_60822 ?auto_60823 ) ( ON ?auto_60824 ?auto_60822 ) ( not ( = ?auto_60823 ?auto_60822 ) ) ( not ( = ?auto_60823 ?auto_60824 ) ) ( not ( = ?auto_60823 ?auto_60825 ) ) ( not ( = ?auto_60823 ?auto_60820 ) ) ( not ( = ?auto_60822 ?auto_60824 ) ) ( not ( = ?auto_60822 ?auto_60825 ) ) ( not ( = ?auto_60822 ?auto_60820 ) ) ( not ( = ?auto_60824 ?auto_60825 ) ) ( not ( = ?auto_60824 ?auto_60820 ) ) ( not ( = ?auto_60819 ?auto_60823 ) ) ( not ( = ?auto_60819 ?auto_60822 ) ) ( not ( = ?auto_60819 ?auto_60824 ) ) ( not ( = ?auto_60821 ?auto_60823 ) ) ( not ( = ?auto_60821 ?auto_60822 ) ) ( not ( = ?auto_60821 ?auto_60824 ) ) ( ON ?auto_60820 ?auto_60819 ) ( CLEAR ?auto_60820 ) ( ON-TABLE ?auto_60821 ) ( HOLDING ?auto_60825 ) ( CLEAR ?auto_60824 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60823 ?auto_60822 ?auto_60824 ?auto_60825 )
      ( MAKE-2PILE ?auto_60819 ?auto_60820 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60826 - BLOCK
      ?auto_60827 - BLOCK
    )
    :vars
    (
      ?auto_60832 - BLOCK
      ?auto_60828 - BLOCK
      ?auto_60831 - BLOCK
      ?auto_60830 - BLOCK
      ?auto_60829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60826 ?auto_60827 ) ) ( not ( = ?auto_60826 ?auto_60832 ) ) ( not ( = ?auto_60827 ?auto_60832 ) ) ( ON ?auto_60826 ?auto_60828 ) ( not ( = ?auto_60826 ?auto_60828 ) ) ( not ( = ?auto_60827 ?auto_60828 ) ) ( not ( = ?auto_60832 ?auto_60828 ) ) ( ON-TABLE ?auto_60831 ) ( ON ?auto_60830 ?auto_60831 ) ( ON ?auto_60829 ?auto_60830 ) ( not ( = ?auto_60831 ?auto_60830 ) ) ( not ( = ?auto_60831 ?auto_60829 ) ) ( not ( = ?auto_60831 ?auto_60832 ) ) ( not ( = ?auto_60831 ?auto_60827 ) ) ( not ( = ?auto_60830 ?auto_60829 ) ) ( not ( = ?auto_60830 ?auto_60832 ) ) ( not ( = ?auto_60830 ?auto_60827 ) ) ( not ( = ?auto_60829 ?auto_60832 ) ) ( not ( = ?auto_60829 ?auto_60827 ) ) ( not ( = ?auto_60826 ?auto_60831 ) ) ( not ( = ?auto_60826 ?auto_60830 ) ) ( not ( = ?auto_60826 ?auto_60829 ) ) ( not ( = ?auto_60828 ?auto_60831 ) ) ( not ( = ?auto_60828 ?auto_60830 ) ) ( not ( = ?auto_60828 ?auto_60829 ) ) ( ON ?auto_60827 ?auto_60826 ) ( ON-TABLE ?auto_60828 ) ( CLEAR ?auto_60829 ) ( ON ?auto_60832 ?auto_60827 ) ( CLEAR ?auto_60832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60828 ?auto_60826 ?auto_60827 )
      ( MAKE-2PILE ?auto_60826 ?auto_60827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60833 - BLOCK
      ?auto_60834 - BLOCK
    )
    :vars
    (
      ?auto_60836 - BLOCK
      ?auto_60838 - BLOCK
      ?auto_60835 - BLOCK
      ?auto_60839 - BLOCK
      ?auto_60837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60833 ?auto_60834 ) ) ( not ( = ?auto_60833 ?auto_60836 ) ) ( not ( = ?auto_60834 ?auto_60836 ) ) ( ON ?auto_60833 ?auto_60838 ) ( not ( = ?auto_60833 ?auto_60838 ) ) ( not ( = ?auto_60834 ?auto_60838 ) ) ( not ( = ?auto_60836 ?auto_60838 ) ) ( ON-TABLE ?auto_60835 ) ( ON ?auto_60839 ?auto_60835 ) ( not ( = ?auto_60835 ?auto_60839 ) ) ( not ( = ?auto_60835 ?auto_60837 ) ) ( not ( = ?auto_60835 ?auto_60836 ) ) ( not ( = ?auto_60835 ?auto_60834 ) ) ( not ( = ?auto_60839 ?auto_60837 ) ) ( not ( = ?auto_60839 ?auto_60836 ) ) ( not ( = ?auto_60839 ?auto_60834 ) ) ( not ( = ?auto_60837 ?auto_60836 ) ) ( not ( = ?auto_60837 ?auto_60834 ) ) ( not ( = ?auto_60833 ?auto_60835 ) ) ( not ( = ?auto_60833 ?auto_60839 ) ) ( not ( = ?auto_60833 ?auto_60837 ) ) ( not ( = ?auto_60838 ?auto_60835 ) ) ( not ( = ?auto_60838 ?auto_60839 ) ) ( not ( = ?auto_60838 ?auto_60837 ) ) ( ON ?auto_60834 ?auto_60833 ) ( ON-TABLE ?auto_60838 ) ( ON ?auto_60836 ?auto_60834 ) ( CLEAR ?auto_60836 ) ( HOLDING ?auto_60837 ) ( CLEAR ?auto_60839 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_60835 ?auto_60839 ?auto_60837 )
      ( MAKE-2PILE ?auto_60833 ?auto_60834 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60840 - BLOCK
      ?auto_60841 - BLOCK
    )
    :vars
    (
      ?auto_60845 - BLOCK
      ?auto_60843 - BLOCK
      ?auto_60844 - BLOCK
      ?auto_60842 - BLOCK
      ?auto_60846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60840 ?auto_60841 ) ) ( not ( = ?auto_60840 ?auto_60845 ) ) ( not ( = ?auto_60841 ?auto_60845 ) ) ( ON ?auto_60840 ?auto_60843 ) ( not ( = ?auto_60840 ?auto_60843 ) ) ( not ( = ?auto_60841 ?auto_60843 ) ) ( not ( = ?auto_60845 ?auto_60843 ) ) ( ON-TABLE ?auto_60844 ) ( ON ?auto_60842 ?auto_60844 ) ( not ( = ?auto_60844 ?auto_60842 ) ) ( not ( = ?auto_60844 ?auto_60846 ) ) ( not ( = ?auto_60844 ?auto_60845 ) ) ( not ( = ?auto_60844 ?auto_60841 ) ) ( not ( = ?auto_60842 ?auto_60846 ) ) ( not ( = ?auto_60842 ?auto_60845 ) ) ( not ( = ?auto_60842 ?auto_60841 ) ) ( not ( = ?auto_60846 ?auto_60845 ) ) ( not ( = ?auto_60846 ?auto_60841 ) ) ( not ( = ?auto_60840 ?auto_60844 ) ) ( not ( = ?auto_60840 ?auto_60842 ) ) ( not ( = ?auto_60840 ?auto_60846 ) ) ( not ( = ?auto_60843 ?auto_60844 ) ) ( not ( = ?auto_60843 ?auto_60842 ) ) ( not ( = ?auto_60843 ?auto_60846 ) ) ( ON ?auto_60841 ?auto_60840 ) ( ON-TABLE ?auto_60843 ) ( ON ?auto_60845 ?auto_60841 ) ( CLEAR ?auto_60842 ) ( ON ?auto_60846 ?auto_60845 ) ( CLEAR ?auto_60846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60843 ?auto_60840 ?auto_60841 ?auto_60845 )
      ( MAKE-2PILE ?auto_60840 ?auto_60841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60847 - BLOCK
      ?auto_60848 - BLOCK
    )
    :vars
    (
      ?auto_60849 - BLOCK
      ?auto_60852 - BLOCK
      ?auto_60851 - BLOCK
      ?auto_60853 - BLOCK
      ?auto_60850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60847 ?auto_60848 ) ) ( not ( = ?auto_60847 ?auto_60849 ) ) ( not ( = ?auto_60848 ?auto_60849 ) ) ( ON ?auto_60847 ?auto_60852 ) ( not ( = ?auto_60847 ?auto_60852 ) ) ( not ( = ?auto_60848 ?auto_60852 ) ) ( not ( = ?auto_60849 ?auto_60852 ) ) ( ON-TABLE ?auto_60851 ) ( not ( = ?auto_60851 ?auto_60853 ) ) ( not ( = ?auto_60851 ?auto_60850 ) ) ( not ( = ?auto_60851 ?auto_60849 ) ) ( not ( = ?auto_60851 ?auto_60848 ) ) ( not ( = ?auto_60853 ?auto_60850 ) ) ( not ( = ?auto_60853 ?auto_60849 ) ) ( not ( = ?auto_60853 ?auto_60848 ) ) ( not ( = ?auto_60850 ?auto_60849 ) ) ( not ( = ?auto_60850 ?auto_60848 ) ) ( not ( = ?auto_60847 ?auto_60851 ) ) ( not ( = ?auto_60847 ?auto_60853 ) ) ( not ( = ?auto_60847 ?auto_60850 ) ) ( not ( = ?auto_60852 ?auto_60851 ) ) ( not ( = ?auto_60852 ?auto_60853 ) ) ( not ( = ?auto_60852 ?auto_60850 ) ) ( ON ?auto_60848 ?auto_60847 ) ( ON-TABLE ?auto_60852 ) ( ON ?auto_60849 ?auto_60848 ) ( ON ?auto_60850 ?auto_60849 ) ( CLEAR ?auto_60850 ) ( HOLDING ?auto_60853 ) ( CLEAR ?auto_60851 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60851 ?auto_60853 )
      ( MAKE-2PILE ?auto_60847 ?auto_60848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60854 - BLOCK
      ?auto_60855 - BLOCK
    )
    :vars
    (
      ?auto_60858 - BLOCK
      ?auto_60859 - BLOCK
      ?auto_60856 - BLOCK
      ?auto_60857 - BLOCK
      ?auto_60860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60854 ?auto_60855 ) ) ( not ( = ?auto_60854 ?auto_60858 ) ) ( not ( = ?auto_60855 ?auto_60858 ) ) ( ON ?auto_60854 ?auto_60859 ) ( not ( = ?auto_60854 ?auto_60859 ) ) ( not ( = ?auto_60855 ?auto_60859 ) ) ( not ( = ?auto_60858 ?auto_60859 ) ) ( ON-TABLE ?auto_60856 ) ( not ( = ?auto_60856 ?auto_60857 ) ) ( not ( = ?auto_60856 ?auto_60860 ) ) ( not ( = ?auto_60856 ?auto_60858 ) ) ( not ( = ?auto_60856 ?auto_60855 ) ) ( not ( = ?auto_60857 ?auto_60860 ) ) ( not ( = ?auto_60857 ?auto_60858 ) ) ( not ( = ?auto_60857 ?auto_60855 ) ) ( not ( = ?auto_60860 ?auto_60858 ) ) ( not ( = ?auto_60860 ?auto_60855 ) ) ( not ( = ?auto_60854 ?auto_60856 ) ) ( not ( = ?auto_60854 ?auto_60857 ) ) ( not ( = ?auto_60854 ?auto_60860 ) ) ( not ( = ?auto_60859 ?auto_60856 ) ) ( not ( = ?auto_60859 ?auto_60857 ) ) ( not ( = ?auto_60859 ?auto_60860 ) ) ( ON ?auto_60855 ?auto_60854 ) ( ON-TABLE ?auto_60859 ) ( ON ?auto_60858 ?auto_60855 ) ( ON ?auto_60860 ?auto_60858 ) ( CLEAR ?auto_60856 ) ( ON ?auto_60857 ?auto_60860 ) ( CLEAR ?auto_60857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60859 ?auto_60854 ?auto_60855 ?auto_60858 ?auto_60860 )
      ( MAKE-2PILE ?auto_60854 ?auto_60855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60861 - BLOCK
      ?auto_60862 - BLOCK
    )
    :vars
    (
      ?auto_60864 - BLOCK
      ?auto_60863 - BLOCK
      ?auto_60866 - BLOCK
      ?auto_60867 - BLOCK
      ?auto_60865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60861 ?auto_60862 ) ) ( not ( = ?auto_60861 ?auto_60864 ) ) ( not ( = ?auto_60862 ?auto_60864 ) ) ( ON ?auto_60861 ?auto_60863 ) ( not ( = ?auto_60861 ?auto_60863 ) ) ( not ( = ?auto_60862 ?auto_60863 ) ) ( not ( = ?auto_60864 ?auto_60863 ) ) ( not ( = ?auto_60866 ?auto_60867 ) ) ( not ( = ?auto_60866 ?auto_60865 ) ) ( not ( = ?auto_60866 ?auto_60864 ) ) ( not ( = ?auto_60866 ?auto_60862 ) ) ( not ( = ?auto_60867 ?auto_60865 ) ) ( not ( = ?auto_60867 ?auto_60864 ) ) ( not ( = ?auto_60867 ?auto_60862 ) ) ( not ( = ?auto_60865 ?auto_60864 ) ) ( not ( = ?auto_60865 ?auto_60862 ) ) ( not ( = ?auto_60861 ?auto_60866 ) ) ( not ( = ?auto_60861 ?auto_60867 ) ) ( not ( = ?auto_60861 ?auto_60865 ) ) ( not ( = ?auto_60863 ?auto_60866 ) ) ( not ( = ?auto_60863 ?auto_60867 ) ) ( not ( = ?auto_60863 ?auto_60865 ) ) ( ON ?auto_60862 ?auto_60861 ) ( ON-TABLE ?auto_60863 ) ( ON ?auto_60864 ?auto_60862 ) ( ON ?auto_60865 ?auto_60864 ) ( ON ?auto_60867 ?auto_60865 ) ( CLEAR ?auto_60867 ) ( HOLDING ?auto_60866 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60866 )
      ( MAKE-2PILE ?auto_60861 ?auto_60862 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_60868 - BLOCK
      ?auto_60869 - BLOCK
    )
    :vars
    (
      ?auto_60872 - BLOCK
      ?auto_60873 - BLOCK
      ?auto_60871 - BLOCK
      ?auto_60870 - BLOCK
      ?auto_60874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60868 ?auto_60869 ) ) ( not ( = ?auto_60868 ?auto_60872 ) ) ( not ( = ?auto_60869 ?auto_60872 ) ) ( ON ?auto_60868 ?auto_60873 ) ( not ( = ?auto_60868 ?auto_60873 ) ) ( not ( = ?auto_60869 ?auto_60873 ) ) ( not ( = ?auto_60872 ?auto_60873 ) ) ( not ( = ?auto_60871 ?auto_60870 ) ) ( not ( = ?auto_60871 ?auto_60874 ) ) ( not ( = ?auto_60871 ?auto_60872 ) ) ( not ( = ?auto_60871 ?auto_60869 ) ) ( not ( = ?auto_60870 ?auto_60874 ) ) ( not ( = ?auto_60870 ?auto_60872 ) ) ( not ( = ?auto_60870 ?auto_60869 ) ) ( not ( = ?auto_60874 ?auto_60872 ) ) ( not ( = ?auto_60874 ?auto_60869 ) ) ( not ( = ?auto_60868 ?auto_60871 ) ) ( not ( = ?auto_60868 ?auto_60870 ) ) ( not ( = ?auto_60868 ?auto_60874 ) ) ( not ( = ?auto_60873 ?auto_60871 ) ) ( not ( = ?auto_60873 ?auto_60870 ) ) ( not ( = ?auto_60873 ?auto_60874 ) ) ( ON ?auto_60869 ?auto_60868 ) ( ON-TABLE ?auto_60873 ) ( ON ?auto_60872 ?auto_60869 ) ( ON ?auto_60874 ?auto_60872 ) ( ON ?auto_60870 ?auto_60874 ) ( ON ?auto_60871 ?auto_60870 ) ( CLEAR ?auto_60871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_60873 ?auto_60868 ?auto_60869 ?auto_60872 ?auto_60874 ?auto_60870 )
      ( MAKE-2PILE ?auto_60868 ?auto_60869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60894 - BLOCK
      ?auto_60895 - BLOCK
      ?auto_60896 - BLOCK
    )
    :vars
    (
      ?auto_60897 - BLOCK
      ?auto_60899 - BLOCK
      ?auto_60898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_60897 ?auto_60896 ) ( ON-TABLE ?auto_60894 ) ( ON ?auto_60895 ?auto_60894 ) ( ON ?auto_60896 ?auto_60895 ) ( not ( = ?auto_60894 ?auto_60895 ) ) ( not ( = ?auto_60894 ?auto_60896 ) ) ( not ( = ?auto_60894 ?auto_60897 ) ) ( not ( = ?auto_60895 ?auto_60896 ) ) ( not ( = ?auto_60895 ?auto_60897 ) ) ( not ( = ?auto_60896 ?auto_60897 ) ) ( not ( = ?auto_60894 ?auto_60899 ) ) ( not ( = ?auto_60894 ?auto_60898 ) ) ( not ( = ?auto_60895 ?auto_60899 ) ) ( not ( = ?auto_60895 ?auto_60898 ) ) ( not ( = ?auto_60896 ?auto_60899 ) ) ( not ( = ?auto_60896 ?auto_60898 ) ) ( not ( = ?auto_60897 ?auto_60899 ) ) ( not ( = ?auto_60897 ?auto_60898 ) ) ( not ( = ?auto_60899 ?auto_60898 ) ) ( ON ?auto_60899 ?auto_60897 ) ( CLEAR ?auto_60899 ) ( HOLDING ?auto_60898 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60898 )
      ( MAKE-3PILE ?auto_60894 ?auto_60895 ?auto_60896 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60959 - BLOCK
      ?auto_60960 - BLOCK
      ?auto_60961 - BLOCK
    )
    :vars
    (
      ?auto_60962 - BLOCK
      ?auto_60963 - BLOCK
      ?auto_60964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_60959 ) ( not ( = ?auto_60959 ?auto_60960 ) ) ( not ( = ?auto_60959 ?auto_60961 ) ) ( not ( = ?auto_60960 ?auto_60961 ) ) ( ON ?auto_60961 ?auto_60962 ) ( not ( = ?auto_60959 ?auto_60962 ) ) ( not ( = ?auto_60960 ?auto_60962 ) ) ( not ( = ?auto_60961 ?auto_60962 ) ) ( CLEAR ?auto_60959 ) ( ON ?auto_60960 ?auto_60961 ) ( CLEAR ?auto_60960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60963 ) ( ON ?auto_60964 ?auto_60963 ) ( ON ?auto_60962 ?auto_60964 ) ( not ( = ?auto_60963 ?auto_60964 ) ) ( not ( = ?auto_60963 ?auto_60962 ) ) ( not ( = ?auto_60963 ?auto_60961 ) ) ( not ( = ?auto_60963 ?auto_60960 ) ) ( not ( = ?auto_60964 ?auto_60962 ) ) ( not ( = ?auto_60964 ?auto_60961 ) ) ( not ( = ?auto_60964 ?auto_60960 ) ) ( not ( = ?auto_60959 ?auto_60963 ) ) ( not ( = ?auto_60959 ?auto_60964 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_60963 ?auto_60964 ?auto_60962 ?auto_60961 )
      ( MAKE-3PILE ?auto_60959 ?auto_60960 ?auto_60961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60965 - BLOCK
      ?auto_60966 - BLOCK
      ?auto_60967 - BLOCK
    )
    :vars
    (
      ?auto_60968 - BLOCK
      ?auto_60970 - BLOCK
      ?auto_60969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60965 ?auto_60966 ) ) ( not ( = ?auto_60965 ?auto_60967 ) ) ( not ( = ?auto_60966 ?auto_60967 ) ) ( ON ?auto_60967 ?auto_60968 ) ( not ( = ?auto_60965 ?auto_60968 ) ) ( not ( = ?auto_60966 ?auto_60968 ) ) ( not ( = ?auto_60967 ?auto_60968 ) ) ( ON ?auto_60966 ?auto_60967 ) ( CLEAR ?auto_60966 ) ( ON-TABLE ?auto_60970 ) ( ON ?auto_60969 ?auto_60970 ) ( ON ?auto_60968 ?auto_60969 ) ( not ( = ?auto_60970 ?auto_60969 ) ) ( not ( = ?auto_60970 ?auto_60968 ) ) ( not ( = ?auto_60970 ?auto_60967 ) ) ( not ( = ?auto_60970 ?auto_60966 ) ) ( not ( = ?auto_60969 ?auto_60968 ) ) ( not ( = ?auto_60969 ?auto_60967 ) ) ( not ( = ?auto_60969 ?auto_60966 ) ) ( not ( = ?auto_60965 ?auto_60970 ) ) ( not ( = ?auto_60965 ?auto_60969 ) ) ( HOLDING ?auto_60965 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_60965 )
      ( MAKE-3PILE ?auto_60965 ?auto_60966 ?auto_60967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60971 - BLOCK
      ?auto_60972 - BLOCK
      ?auto_60973 - BLOCK
    )
    :vars
    (
      ?auto_60976 - BLOCK
      ?auto_60974 - BLOCK
      ?auto_60975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60971 ?auto_60972 ) ) ( not ( = ?auto_60971 ?auto_60973 ) ) ( not ( = ?auto_60972 ?auto_60973 ) ) ( ON ?auto_60973 ?auto_60976 ) ( not ( = ?auto_60971 ?auto_60976 ) ) ( not ( = ?auto_60972 ?auto_60976 ) ) ( not ( = ?auto_60973 ?auto_60976 ) ) ( ON ?auto_60972 ?auto_60973 ) ( ON-TABLE ?auto_60974 ) ( ON ?auto_60975 ?auto_60974 ) ( ON ?auto_60976 ?auto_60975 ) ( not ( = ?auto_60974 ?auto_60975 ) ) ( not ( = ?auto_60974 ?auto_60976 ) ) ( not ( = ?auto_60974 ?auto_60973 ) ) ( not ( = ?auto_60974 ?auto_60972 ) ) ( not ( = ?auto_60975 ?auto_60976 ) ) ( not ( = ?auto_60975 ?auto_60973 ) ) ( not ( = ?auto_60975 ?auto_60972 ) ) ( not ( = ?auto_60971 ?auto_60974 ) ) ( not ( = ?auto_60971 ?auto_60975 ) ) ( ON ?auto_60971 ?auto_60972 ) ( CLEAR ?auto_60971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60974 ?auto_60975 ?auto_60976 ?auto_60973 ?auto_60972 )
      ( MAKE-3PILE ?auto_60971 ?auto_60972 ?auto_60973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60980 - BLOCK
      ?auto_60981 - BLOCK
      ?auto_60982 - BLOCK
    )
    :vars
    (
      ?auto_60984 - BLOCK
      ?auto_60985 - BLOCK
      ?auto_60983 - BLOCK
      ?auto_60986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60980 ?auto_60981 ) ) ( not ( = ?auto_60980 ?auto_60982 ) ) ( not ( = ?auto_60981 ?auto_60982 ) ) ( ON ?auto_60982 ?auto_60984 ) ( not ( = ?auto_60980 ?auto_60984 ) ) ( not ( = ?auto_60981 ?auto_60984 ) ) ( not ( = ?auto_60982 ?auto_60984 ) ) ( ON ?auto_60981 ?auto_60982 ) ( CLEAR ?auto_60981 ) ( ON-TABLE ?auto_60985 ) ( ON ?auto_60983 ?auto_60985 ) ( ON ?auto_60984 ?auto_60983 ) ( not ( = ?auto_60985 ?auto_60983 ) ) ( not ( = ?auto_60985 ?auto_60984 ) ) ( not ( = ?auto_60985 ?auto_60982 ) ) ( not ( = ?auto_60985 ?auto_60981 ) ) ( not ( = ?auto_60983 ?auto_60984 ) ) ( not ( = ?auto_60983 ?auto_60982 ) ) ( not ( = ?auto_60983 ?auto_60981 ) ) ( not ( = ?auto_60980 ?auto_60985 ) ) ( not ( = ?auto_60980 ?auto_60983 ) ) ( ON ?auto_60980 ?auto_60986 ) ( CLEAR ?auto_60980 ) ( HAND-EMPTY ) ( not ( = ?auto_60980 ?auto_60986 ) ) ( not ( = ?auto_60981 ?auto_60986 ) ) ( not ( = ?auto_60982 ?auto_60986 ) ) ( not ( = ?auto_60984 ?auto_60986 ) ) ( not ( = ?auto_60985 ?auto_60986 ) ) ( not ( = ?auto_60983 ?auto_60986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_60980 ?auto_60986 )
      ( MAKE-3PILE ?auto_60980 ?auto_60981 ?auto_60982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60987 - BLOCK
      ?auto_60988 - BLOCK
      ?auto_60989 - BLOCK
    )
    :vars
    (
      ?auto_60991 - BLOCK
      ?auto_60990 - BLOCK
      ?auto_60992 - BLOCK
      ?auto_60993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60987 ?auto_60988 ) ) ( not ( = ?auto_60987 ?auto_60989 ) ) ( not ( = ?auto_60988 ?auto_60989 ) ) ( ON ?auto_60989 ?auto_60991 ) ( not ( = ?auto_60987 ?auto_60991 ) ) ( not ( = ?auto_60988 ?auto_60991 ) ) ( not ( = ?auto_60989 ?auto_60991 ) ) ( ON-TABLE ?auto_60990 ) ( ON ?auto_60992 ?auto_60990 ) ( ON ?auto_60991 ?auto_60992 ) ( not ( = ?auto_60990 ?auto_60992 ) ) ( not ( = ?auto_60990 ?auto_60991 ) ) ( not ( = ?auto_60990 ?auto_60989 ) ) ( not ( = ?auto_60990 ?auto_60988 ) ) ( not ( = ?auto_60992 ?auto_60991 ) ) ( not ( = ?auto_60992 ?auto_60989 ) ) ( not ( = ?auto_60992 ?auto_60988 ) ) ( not ( = ?auto_60987 ?auto_60990 ) ) ( not ( = ?auto_60987 ?auto_60992 ) ) ( ON ?auto_60987 ?auto_60993 ) ( CLEAR ?auto_60987 ) ( not ( = ?auto_60987 ?auto_60993 ) ) ( not ( = ?auto_60988 ?auto_60993 ) ) ( not ( = ?auto_60989 ?auto_60993 ) ) ( not ( = ?auto_60991 ?auto_60993 ) ) ( not ( = ?auto_60990 ?auto_60993 ) ) ( not ( = ?auto_60992 ?auto_60993 ) ) ( HOLDING ?auto_60988 ) ( CLEAR ?auto_60989 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_60990 ?auto_60992 ?auto_60991 ?auto_60989 ?auto_60988 )
      ( MAKE-3PILE ?auto_60987 ?auto_60988 ?auto_60989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_60994 - BLOCK
      ?auto_60995 - BLOCK
      ?auto_60996 - BLOCK
    )
    :vars
    (
      ?auto_60997 - BLOCK
      ?auto_61000 - BLOCK
      ?auto_60998 - BLOCK
      ?auto_60999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_60994 ?auto_60995 ) ) ( not ( = ?auto_60994 ?auto_60996 ) ) ( not ( = ?auto_60995 ?auto_60996 ) ) ( ON ?auto_60996 ?auto_60997 ) ( not ( = ?auto_60994 ?auto_60997 ) ) ( not ( = ?auto_60995 ?auto_60997 ) ) ( not ( = ?auto_60996 ?auto_60997 ) ) ( ON-TABLE ?auto_61000 ) ( ON ?auto_60998 ?auto_61000 ) ( ON ?auto_60997 ?auto_60998 ) ( not ( = ?auto_61000 ?auto_60998 ) ) ( not ( = ?auto_61000 ?auto_60997 ) ) ( not ( = ?auto_61000 ?auto_60996 ) ) ( not ( = ?auto_61000 ?auto_60995 ) ) ( not ( = ?auto_60998 ?auto_60997 ) ) ( not ( = ?auto_60998 ?auto_60996 ) ) ( not ( = ?auto_60998 ?auto_60995 ) ) ( not ( = ?auto_60994 ?auto_61000 ) ) ( not ( = ?auto_60994 ?auto_60998 ) ) ( ON ?auto_60994 ?auto_60999 ) ( not ( = ?auto_60994 ?auto_60999 ) ) ( not ( = ?auto_60995 ?auto_60999 ) ) ( not ( = ?auto_60996 ?auto_60999 ) ) ( not ( = ?auto_60997 ?auto_60999 ) ) ( not ( = ?auto_61000 ?auto_60999 ) ) ( not ( = ?auto_60998 ?auto_60999 ) ) ( CLEAR ?auto_60996 ) ( ON ?auto_60995 ?auto_60994 ) ( CLEAR ?auto_60995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_60999 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_60999 ?auto_60994 )
      ( MAKE-3PILE ?auto_60994 ?auto_60995 ?auto_60996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61001 - BLOCK
      ?auto_61002 - BLOCK
      ?auto_61003 - BLOCK
    )
    :vars
    (
      ?auto_61007 - BLOCK
      ?auto_61004 - BLOCK
      ?auto_61005 - BLOCK
      ?auto_61006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61001 ?auto_61002 ) ) ( not ( = ?auto_61001 ?auto_61003 ) ) ( not ( = ?auto_61002 ?auto_61003 ) ) ( not ( = ?auto_61001 ?auto_61007 ) ) ( not ( = ?auto_61002 ?auto_61007 ) ) ( not ( = ?auto_61003 ?auto_61007 ) ) ( ON-TABLE ?auto_61004 ) ( ON ?auto_61005 ?auto_61004 ) ( ON ?auto_61007 ?auto_61005 ) ( not ( = ?auto_61004 ?auto_61005 ) ) ( not ( = ?auto_61004 ?auto_61007 ) ) ( not ( = ?auto_61004 ?auto_61003 ) ) ( not ( = ?auto_61004 ?auto_61002 ) ) ( not ( = ?auto_61005 ?auto_61007 ) ) ( not ( = ?auto_61005 ?auto_61003 ) ) ( not ( = ?auto_61005 ?auto_61002 ) ) ( not ( = ?auto_61001 ?auto_61004 ) ) ( not ( = ?auto_61001 ?auto_61005 ) ) ( ON ?auto_61001 ?auto_61006 ) ( not ( = ?auto_61001 ?auto_61006 ) ) ( not ( = ?auto_61002 ?auto_61006 ) ) ( not ( = ?auto_61003 ?auto_61006 ) ) ( not ( = ?auto_61007 ?auto_61006 ) ) ( not ( = ?auto_61004 ?auto_61006 ) ) ( not ( = ?auto_61005 ?auto_61006 ) ) ( ON ?auto_61002 ?auto_61001 ) ( CLEAR ?auto_61002 ) ( ON-TABLE ?auto_61006 ) ( HOLDING ?auto_61003 ) ( CLEAR ?auto_61007 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61004 ?auto_61005 ?auto_61007 ?auto_61003 )
      ( MAKE-3PILE ?auto_61001 ?auto_61002 ?auto_61003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61008 - BLOCK
      ?auto_61009 - BLOCK
      ?auto_61010 - BLOCK
    )
    :vars
    (
      ?auto_61012 - BLOCK
      ?auto_61013 - BLOCK
      ?auto_61014 - BLOCK
      ?auto_61011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61008 ?auto_61009 ) ) ( not ( = ?auto_61008 ?auto_61010 ) ) ( not ( = ?auto_61009 ?auto_61010 ) ) ( not ( = ?auto_61008 ?auto_61012 ) ) ( not ( = ?auto_61009 ?auto_61012 ) ) ( not ( = ?auto_61010 ?auto_61012 ) ) ( ON-TABLE ?auto_61013 ) ( ON ?auto_61014 ?auto_61013 ) ( ON ?auto_61012 ?auto_61014 ) ( not ( = ?auto_61013 ?auto_61014 ) ) ( not ( = ?auto_61013 ?auto_61012 ) ) ( not ( = ?auto_61013 ?auto_61010 ) ) ( not ( = ?auto_61013 ?auto_61009 ) ) ( not ( = ?auto_61014 ?auto_61012 ) ) ( not ( = ?auto_61014 ?auto_61010 ) ) ( not ( = ?auto_61014 ?auto_61009 ) ) ( not ( = ?auto_61008 ?auto_61013 ) ) ( not ( = ?auto_61008 ?auto_61014 ) ) ( ON ?auto_61008 ?auto_61011 ) ( not ( = ?auto_61008 ?auto_61011 ) ) ( not ( = ?auto_61009 ?auto_61011 ) ) ( not ( = ?auto_61010 ?auto_61011 ) ) ( not ( = ?auto_61012 ?auto_61011 ) ) ( not ( = ?auto_61013 ?auto_61011 ) ) ( not ( = ?auto_61014 ?auto_61011 ) ) ( ON ?auto_61009 ?auto_61008 ) ( ON-TABLE ?auto_61011 ) ( CLEAR ?auto_61012 ) ( ON ?auto_61010 ?auto_61009 ) ( CLEAR ?auto_61010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61011 ?auto_61008 ?auto_61009 )
      ( MAKE-3PILE ?auto_61008 ?auto_61009 ?auto_61010 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61015 - BLOCK
      ?auto_61016 - BLOCK
      ?auto_61017 - BLOCK
    )
    :vars
    (
      ?auto_61020 - BLOCK
      ?auto_61021 - BLOCK
      ?auto_61018 - BLOCK
      ?auto_61019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61015 ?auto_61016 ) ) ( not ( = ?auto_61015 ?auto_61017 ) ) ( not ( = ?auto_61016 ?auto_61017 ) ) ( not ( = ?auto_61015 ?auto_61020 ) ) ( not ( = ?auto_61016 ?auto_61020 ) ) ( not ( = ?auto_61017 ?auto_61020 ) ) ( ON-TABLE ?auto_61021 ) ( ON ?auto_61018 ?auto_61021 ) ( not ( = ?auto_61021 ?auto_61018 ) ) ( not ( = ?auto_61021 ?auto_61020 ) ) ( not ( = ?auto_61021 ?auto_61017 ) ) ( not ( = ?auto_61021 ?auto_61016 ) ) ( not ( = ?auto_61018 ?auto_61020 ) ) ( not ( = ?auto_61018 ?auto_61017 ) ) ( not ( = ?auto_61018 ?auto_61016 ) ) ( not ( = ?auto_61015 ?auto_61021 ) ) ( not ( = ?auto_61015 ?auto_61018 ) ) ( ON ?auto_61015 ?auto_61019 ) ( not ( = ?auto_61015 ?auto_61019 ) ) ( not ( = ?auto_61016 ?auto_61019 ) ) ( not ( = ?auto_61017 ?auto_61019 ) ) ( not ( = ?auto_61020 ?auto_61019 ) ) ( not ( = ?auto_61021 ?auto_61019 ) ) ( not ( = ?auto_61018 ?auto_61019 ) ) ( ON ?auto_61016 ?auto_61015 ) ( ON-TABLE ?auto_61019 ) ( ON ?auto_61017 ?auto_61016 ) ( CLEAR ?auto_61017 ) ( HOLDING ?auto_61020 ) ( CLEAR ?auto_61018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61021 ?auto_61018 ?auto_61020 )
      ( MAKE-3PILE ?auto_61015 ?auto_61016 ?auto_61017 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61022 - BLOCK
      ?auto_61023 - BLOCK
      ?auto_61024 - BLOCK
    )
    :vars
    (
      ?auto_61026 - BLOCK
      ?auto_61025 - BLOCK
      ?auto_61027 - BLOCK
      ?auto_61028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61022 ?auto_61023 ) ) ( not ( = ?auto_61022 ?auto_61024 ) ) ( not ( = ?auto_61023 ?auto_61024 ) ) ( not ( = ?auto_61022 ?auto_61026 ) ) ( not ( = ?auto_61023 ?auto_61026 ) ) ( not ( = ?auto_61024 ?auto_61026 ) ) ( ON-TABLE ?auto_61025 ) ( ON ?auto_61027 ?auto_61025 ) ( not ( = ?auto_61025 ?auto_61027 ) ) ( not ( = ?auto_61025 ?auto_61026 ) ) ( not ( = ?auto_61025 ?auto_61024 ) ) ( not ( = ?auto_61025 ?auto_61023 ) ) ( not ( = ?auto_61027 ?auto_61026 ) ) ( not ( = ?auto_61027 ?auto_61024 ) ) ( not ( = ?auto_61027 ?auto_61023 ) ) ( not ( = ?auto_61022 ?auto_61025 ) ) ( not ( = ?auto_61022 ?auto_61027 ) ) ( ON ?auto_61022 ?auto_61028 ) ( not ( = ?auto_61022 ?auto_61028 ) ) ( not ( = ?auto_61023 ?auto_61028 ) ) ( not ( = ?auto_61024 ?auto_61028 ) ) ( not ( = ?auto_61026 ?auto_61028 ) ) ( not ( = ?auto_61025 ?auto_61028 ) ) ( not ( = ?auto_61027 ?auto_61028 ) ) ( ON ?auto_61023 ?auto_61022 ) ( ON-TABLE ?auto_61028 ) ( ON ?auto_61024 ?auto_61023 ) ( CLEAR ?auto_61027 ) ( ON ?auto_61026 ?auto_61024 ) ( CLEAR ?auto_61026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61028 ?auto_61022 ?auto_61023 ?auto_61024 )
      ( MAKE-3PILE ?auto_61022 ?auto_61023 ?auto_61024 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61029 - BLOCK
      ?auto_61030 - BLOCK
      ?auto_61031 - BLOCK
    )
    :vars
    (
      ?auto_61035 - BLOCK
      ?auto_61034 - BLOCK
      ?auto_61033 - BLOCK
      ?auto_61032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61029 ?auto_61030 ) ) ( not ( = ?auto_61029 ?auto_61031 ) ) ( not ( = ?auto_61030 ?auto_61031 ) ) ( not ( = ?auto_61029 ?auto_61035 ) ) ( not ( = ?auto_61030 ?auto_61035 ) ) ( not ( = ?auto_61031 ?auto_61035 ) ) ( ON-TABLE ?auto_61034 ) ( not ( = ?auto_61034 ?auto_61033 ) ) ( not ( = ?auto_61034 ?auto_61035 ) ) ( not ( = ?auto_61034 ?auto_61031 ) ) ( not ( = ?auto_61034 ?auto_61030 ) ) ( not ( = ?auto_61033 ?auto_61035 ) ) ( not ( = ?auto_61033 ?auto_61031 ) ) ( not ( = ?auto_61033 ?auto_61030 ) ) ( not ( = ?auto_61029 ?auto_61034 ) ) ( not ( = ?auto_61029 ?auto_61033 ) ) ( ON ?auto_61029 ?auto_61032 ) ( not ( = ?auto_61029 ?auto_61032 ) ) ( not ( = ?auto_61030 ?auto_61032 ) ) ( not ( = ?auto_61031 ?auto_61032 ) ) ( not ( = ?auto_61035 ?auto_61032 ) ) ( not ( = ?auto_61034 ?auto_61032 ) ) ( not ( = ?auto_61033 ?auto_61032 ) ) ( ON ?auto_61030 ?auto_61029 ) ( ON-TABLE ?auto_61032 ) ( ON ?auto_61031 ?auto_61030 ) ( ON ?auto_61035 ?auto_61031 ) ( CLEAR ?auto_61035 ) ( HOLDING ?auto_61033 ) ( CLEAR ?auto_61034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61034 ?auto_61033 )
      ( MAKE-3PILE ?auto_61029 ?auto_61030 ?auto_61031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61036 - BLOCK
      ?auto_61037 - BLOCK
      ?auto_61038 - BLOCK
    )
    :vars
    (
      ?auto_61039 - BLOCK
      ?auto_61040 - BLOCK
      ?auto_61041 - BLOCK
      ?auto_61042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61036 ?auto_61037 ) ) ( not ( = ?auto_61036 ?auto_61038 ) ) ( not ( = ?auto_61037 ?auto_61038 ) ) ( not ( = ?auto_61036 ?auto_61039 ) ) ( not ( = ?auto_61037 ?auto_61039 ) ) ( not ( = ?auto_61038 ?auto_61039 ) ) ( ON-TABLE ?auto_61040 ) ( not ( = ?auto_61040 ?auto_61041 ) ) ( not ( = ?auto_61040 ?auto_61039 ) ) ( not ( = ?auto_61040 ?auto_61038 ) ) ( not ( = ?auto_61040 ?auto_61037 ) ) ( not ( = ?auto_61041 ?auto_61039 ) ) ( not ( = ?auto_61041 ?auto_61038 ) ) ( not ( = ?auto_61041 ?auto_61037 ) ) ( not ( = ?auto_61036 ?auto_61040 ) ) ( not ( = ?auto_61036 ?auto_61041 ) ) ( ON ?auto_61036 ?auto_61042 ) ( not ( = ?auto_61036 ?auto_61042 ) ) ( not ( = ?auto_61037 ?auto_61042 ) ) ( not ( = ?auto_61038 ?auto_61042 ) ) ( not ( = ?auto_61039 ?auto_61042 ) ) ( not ( = ?auto_61040 ?auto_61042 ) ) ( not ( = ?auto_61041 ?auto_61042 ) ) ( ON ?auto_61037 ?auto_61036 ) ( ON-TABLE ?auto_61042 ) ( ON ?auto_61038 ?auto_61037 ) ( ON ?auto_61039 ?auto_61038 ) ( CLEAR ?auto_61040 ) ( ON ?auto_61041 ?auto_61039 ) ( CLEAR ?auto_61041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61042 ?auto_61036 ?auto_61037 ?auto_61038 ?auto_61039 )
      ( MAKE-3PILE ?auto_61036 ?auto_61037 ?auto_61038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61043 - BLOCK
      ?auto_61044 - BLOCK
      ?auto_61045 - BLOCK
    )
    :vars
    (
      ?auto_61048 - BLOCK
      ?auto_61047 - BLOCK
      ?auto_61046 - BLOCK
      ?auto_61049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61043 ?auto_61044 ) ) ( not ( = ?auto_61043 ?auto_61045 ) ) ( not ( = ?auto_61044 ?auto_61045 ) ) ( not ( = ?auto_61043 ?auto_61048 ) ) ( not ( = ?auto_61044 ?auto_61048 ) ) ( not ( = ?auto_61045 ?auto_61048 ) ) ( not ( = ?auto_61047 ?auto_61046 ) ) ( not ( = ?auto_61047 ?auto_61048 ) ) ( not ( = ?auto_61047 ?auto_61045 ) ) ( not ( = ?auto_61047 ?auto_61044 ) ) ( not ( = ?auto_61046 ?auto_61048 ) ) ( not ( = ?auto_61046 ?auto_61045 ) ) ( not ( = ?auto_61046 ?auto_61044 ) ) ( not ( = ?auto_61043 ?auto_61047 ) ) ( not ( = ?auto_61043 ?auto_61046 ) ) ( ON ?auto_61043 ?auto_61049 ) ( not ( = ?auto_61043 ?auto_61049 ) ) ( not ( = ?auto_61044 ?auto_61049 ) ) ( not ( = ?auto_61045 ?auto_61049 ) ) ( not ( = ?auto_61048 ?auto_61049 ) ) ( not ( = ?auto_61047 ?auto_61049 ) ) ( not ( = ?auto_61046 ?auto_61049 ) ) ( ON ?auto_61044 ?auto_61043 ) ( ON-TABLE ?auto_61049 ) ( ON ?auto_61045 ?auto_61044 ) ( ON ?auto_61048 ?auto_61045 ) ( ON ?auto_61046 ?auto_61048 ) ( CLEAR ?auto_61046 ) ( HOLDING ?auto_61047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61047 )
      ( MAKE-3PILE ?auto_61043 ?auto_61044 ?auto_61045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_61050 - BLOCK
      ?auto_61051 - BLOCK
      ?auto_61052 - BLOCK
    )
    :vars
    (
      ?auto_61055 - BLOCK
      ?auto_61056 - BLOCK
      ?auto_61054 - BLOCK
      ?auto_61053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61050 ?auto_61051 ) ) ( not ( = ?auto_61050 ?auto_61052 ) ) ( not ( = ?auto_61051 ?auto_61052 ) ) ( not ( = ?auto_61050 ?auto_61055 ) ) ( not ( = ?auto_61051 ?auto_61055 ) ) ( not ( = ?auto_61052 ?auto_61055 ) ) ( not ( = ?auto_61056 ?auto_61054 ) ) ( not ( = ?auto_61056 ?auto_61055 ) ) ( not ( = ?auto_61056 ?auto_61052 ) ) ( not ( = ?auto_61056 ?auto_61051 ) ) ( not ( = ?auto_61054 ?auto_61055 ) ) ( not ( = ?auto_61054 ?auto_61052 ) ) ( not ( = ?auto_61054 ?auto_61051 ) ) ( not ( = ?auto_61050 ?auto_61056 ) ) ( not ( = ?auto_61050 ?auto_61054 ) ) ( ON ?auto_61050 ?auto_61053 ) ( not ( = ?auto_61050 ?auto_61053 ) ) ( not ( = ?auto_61051 ?auto_61053 ) ) ( not ( = ?auto_61052 ?auto_61053 ) ) ( not ( = ?auto_61055 ?auto_61053 ) ) ( not ( = ?auto_61056 ?auto_61053 ) ) ( not ( = ?auto_61054 ?auto_61053 ) ) ( ON ?auto_61051 ?auto_61050 ) ( ON-TABLE ?auto_61053 ) ( ON ?auto_61052 ?auto_61051 ) ( ON ?auto_61055 ?auto_61052 ) ( ON ?auto_61054 ?auto_61055 ) ( ON ?auto_61056 ?auto_61054 ) ( CLEAR ?auto_61056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61053 ?auto_61050 ?auto_61051 ?auto_61052 ?auto_61055 ?auto_61054 )
      ( MAKE-3PILE ?auto_61050 ?auto_61051 ?auto_61052 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61072 - BLOCK
      ?auto_61073 - BLOCK
    )
    :vars
    (
      ?auto_61075 - BLOCK
      ?auto_61074 - BLOCK
      ?auto_61076 - BLOCK
      ?auto_61077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61075 ?auto_61073 ) ( ON-TABLE ?auto_61072 ) ( ON ?auto_61073 ?auto_61072 ) ( not ( = ?auto_61072 ?auto_61073 ) ) ( not ( = ?auto_61072 ?auto_61075 ) ) ( not ( = ?auto_61073 ?auto_61075 ) ) ( not ( = ?auto_61072 ?auto_61074 ) ) ( not ( = ?auto_61072 ?auto_61076 ) ) ( not ( = ?auto_61073 ?auto_61074 ) ) ( not ( = ?auto_61073 ?auto_61076 ) ) ( not ( = ?auto_61075 ?auto_61074 ) ) ( not ( = ?auto_61075 ?auto_61076 ) ) ( not ( = ?auto_61074 ?auto_61076 ) ) ( ON ?auto_61074 ?auto_61075 ) ( CLEAR ?auto_61074 ) ( HOLDING ?auto_61076 ) ( CLEAR ?auto_61077 ) ( ON-TABLE ?auto_61077 ) ( not ( = ?auto_61077 ?auto_61076 ) ) ( not ( = ?auto_61072 ?auto_61077 ) ) ( not ( = ?auto_61073 ?auto_61077 ) ) ( not ( = ?auto_61075 ?auto_61077 ) ) ( not ( = ?auto_61074 ?auto_61077 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61077 ?auto_61076 )
      ( MAKE-2PILE ?auto_61072 ?auto_61073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61078 - BLOCK
      ?auto_61079 - BLOCK
    )
    :vars
    (
      ?auto_61083 - BLOCK
      ?auto_61081 - BLOCK
      ?auto_61082 - BLOCK
      ?auto_61080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61083 ?auto_61079 ) ( ON-TABLE ?auto_61078 ) ( ON ?auto_61079 ?auto_61078 ) ( not ( = ?auto_61078 ?auto_61079 ) ) ( not ( = ?auto_61078 ?auto_61083 ) ) ( not ( = ?auto_61079 ?auto_61083 ) ) ( not ( = ?auto_61078 ?auto_61081 ) ) ( not ( = ?auto_61078 ?auto_61082 ) ) ( not ( = ?auto_61079 ?auto_61081 ) ) ( not ( = ?auto_61079 ?auto_61082 ) ) ( not ( = ?auto_61083 ?auto_61081 ) ) ( not ( = ?auto_61083 ?auto_61082 ) ) ( not ( = ?auto_61081 ?auto_61082 ) ) ( ON ?auto_61081 ?auto_61083 ) ( CLEAR ?auto_61080 ) ( ON-TABLE ?auto_61080 ) ( not ( = ?auto_61080 ?auto_61082 ) ) ( not ( = ?auto_61078 ?auto_61080 ) ) ( not ( = ?auto_61079 ?auto_61080 ) ) ( not ( = ?auto_61083 ?auto_61080 ) ) ( not ( = ?auto_61081 ?auto_61080 ) ) ( ON ?auto_61082 ?auto_61081 ) ( CLEAR ?auto_61082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61078 ?auto_61079 ?auto_61083 ?auto_61081 )
      ( MAKE-2PILE ?auto_61078 ?auto_61079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61084 - BLOCK
      ?auto_61085 - BLOCK
    )
    :vars
    (
      ?auto_61089 - BLOCK
      ?auto_61086 - BLOCK
      ?auto_61087 - BLOCK
      ?auto_61088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61089 ?auto_61085 ) ( ON-TABLE ?auto_61084 ) ( ON ?auto_61085 ?auto_61084 ) ( not ( = ?auto_61084 ?auto_61085 ) ) ( not ( = ?auto_61084 ?auto_61089 ) ) ( not ( = ?auto_61085 ?auto_61089 ) ) ( not ( = ?auto_61084 ?auto_61086 ) ) ( not ( = ?auto_61084 ?auto_61087 ) ) ( not ( = ?auto_61085 ?auto_61086 ) ) ( not ( = ?auto_61085 ?auto_61087 ) ) ( not ( = ?auto_61089 ?auto_61086 ) ) ( not ( = ?auto_61089 ?auto_61087 ) ) ( not ( = ?auto_61086 ?auto_61087 ) ) ( ON ?auto_61086 ?auto_61089 ) ( not ( = ?auto_61088 ?auto_61087 ) ) ( not ( = ?auto_61084 ?auto_61088 ) ) ( not ( = ?auto_61085 ?auto_61088 ) ) ( not ( = ?auto_61089 ?auto_61088 ) ) ( not ( = ?auto_61086 ?auto_61088 ) ) ( ON ?auto_61087 ?auto_61086 ) ( CLEAR ?auto_61087 ) ( HOLDING ?auto_61088 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61088 )
      ( MAKE-2PILE ?auto_61084 ?auto_61085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61098 - BLOCK
      ?auto_61099 - BLOCK
    )
    :vars
    (
      ?auto_61102 - BLOCK
      ?auto_61100 - BLOCK
      ?auto_61103 - BLOCK
      ?auto_61101 - BLOCK
      ?auto_61104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61102 ?auto_61099 ) ( ON-TABLE ?auto_61098 ) ( ON ?auto_61099 ?auto_61098 ) ( not ( = ?auto_61098 ?auto_61099 ) ) ( not ( = ?auto_61098 ?auto_61102 ) ) ( not ( = ?auto_61099 ?auto_61102 ) ) ( not ( = ?auto_61098 ?auto_61100 ) ) ( not ( = ?auto_61098 ?auto_61103 ) ) ( not ( = ?auto_61099 ?auto_61100 ) ) ( not ( = ?auto_61099 ?auto_61103 ) ) ( not ( = ?auto_61102 ?auto_61100 ) ) ( not ( = ?auto_61102 ?auto_61103 ) ) ( not ( = ?auto_61100 ?auto_61103 ) ) ( ON ?auto_61100 ?auto_61102 ) ( not ( = ?auto_61101 ?auto_61103 ) ) ( not ( = ?auto_61098 ?auto_61101 ) ) ( not ( = ?auto_61099 ?auto_61101 ) ) ( not ( = ?auto_61102 ?auto_61101 ) ) ( not ( = ?auto_61100 ?auto_61101 ) ) ( ON ?auto_61103 ?auto_61100 ) ( CLEAR ?auto_61103 ) ( ON ?auto_61101 ?auto_61104 ) ( CLEAR ?auto_61101 ) ( HAND-EMPTY ) ( not ( = ?auto_61098 ?auto_61104 ) ) ( not ( = ?auto_61099 ?auto_61104 ) ) ( not ( = ?auto_61102 ?auto_61104 ) ) ( not ( = ?auto_61100 ?auto_61104 ) ) ( not ( = ?auto_61103 ?auto_61104 ) ) ( not ( = ?auto_61101 ?auto_61104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61101 ?auto_61104 )
      ( MAKE-2PILE ?auto_61098 ?auto_61099 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61105 - BLOCK
      ?auto_61106 - BLOCK
    )
    :vars
    (
      ?auto_61111 - BLOCK
      ?auto_61110 - BLOCK
      ?auto_61107 - BLOCK
      ?auto_61109 - BLOCK
      ?auto_61108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61111 ?auto_61106 ) ( ON-TABLE ?auto_61105 ) ( ON ?auto_61106 ?auto_61105 ) ( not ( = ?auto_61105 ?auto_61106 ) ) ( not ( = ?auto_61105 ?auto_61111 ) ) ( not ( = ?auto_61106 ?auto_61111 ) ) ( not ( = ?auto_61105 ?auto_61110 ) ) ( not ( = ?auto_61105 ?auto_61107 ) ) ( not ( = ?auto_61106 ?auto_61110 ) ) ( not ( = ?auto_61106 ?auto_61107 ) ) ( not ( = ?auto_61111 ?auto_61110 ) ) ( not ( = ?auto_61111 ?auto_61107 ) ) ( not ( = ?auto_61110 ?auto_61107 ) ) ( ON ?auto_61110 ?auto_61111 ) ( not ( = ?auto_61109 ?auto_61107 ) ) ( not ( = ?auto_61105 ?auto_61109 ) ) ( not ( = ?auto_61106 ?auto_61109 ) ) ( not ( = ?auto_61111 ?auto_61109 ) ) ( not ( = ?auto_61110 ?auto_61109 ) ) ( ON ?auto_61109 ?auto_61108 ) ( CLEAR ?auto_61109 ) ( not ( = ?auto_61105 ?auto_61108 ) ) ( not ( = ?auto_61106 ?auto_61108 ) ) ( not ( = ?auto_61111 ?auto_61108 ) ) ( not ( = ?auto_61110 ?auto_61108 ) ) ( not ( = ?auto_61107 ?auto_61108 ) ) ( not ( = ?auto_61109 ?auto_61108 ) ) ( HOLDING ?auto_61107 ) ( CLEAR ?auto_61110 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61105 ?auto_61106 ?auto_61111 ?auto_61110 ?auto_61107 )
      ( MAKE-2PILE ?auto_61105 ?auto_61106 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61151 - BLOCK
      ?auto_61152 - BLOCK
      ?auto_61153 - BLOCK
      ?auto_61154 - BLOCK
    )
    :vars
    (
      ?auto_61155 - BLOCK
      ?auto_61156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61151 ) ( ON ?auto_61152 ?auto_61151 ) ( not ( = ?auto_61151 ?auto_61152 ) ) ( not ( = ?auto_61151 ?auto_61153 ) ) ( not ( = ?auto_61151 ?auto_61154 ) ) ( not ( = ?auto_61152 ?auto_61153 ) ) ( not ( = ?auto_61152 ?auto_61154 ) ) ( not ( = ?auto_61153 ?auto_61154 ) ) ( ON ?auto_61154 ?auto_61155 ) ( not ( = ?auto_61151 ?auto_61155 ) ) ( not ( = ?auto_61152 ?auto_61155 ) ) ( not ( = ?auto_61153 ?auto_61155 ) ) ( not ( = ?auto_61154 ?auto_61155 ) ) ( CLEAR ?auto_61152 ) ( ON ?auto_61153 ?auto_61154 ) ( CLEAR ?auto_61153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61156 ) ( ON ?auto_61155 ?auto_61156 ) ( not ( = ?auto_61156 ?auto_61155 ) ) ( not ( = ?auto_61156 ?auto_61154 ) ) ( not ( = ?auto_61156 ?auto_61153 ) ) ( not ( = ?auto_61151 ?auto_61156 ) ) ( not ( = ?auto_61152 ?auto_61156 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61156 ?auto_61155 ?auto_61154 )
      ( MAKE-4PILE ?auto_61151 ?auto_61152 ?auto_61153 ?auto_61154 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61157 - BLOCK
      ?auto_61158 - BLOCK
      ?auto_61159 - BLOCK
      ?auto_61160 - BLOCK
    )
    :vars
    (
      ?auto_61161 - BLOCK
      ?auto_61162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61157 ) ( not ( = ?auto_61157 ?auto_61158 ) ) ( not ( = ?auto_61157 ?auto_61159 ) ) ( not ( = ?auto_61157 ?auto_61160 ) ) ( not ( = ?auto_61158 ?auto_61159 ) ) ( not ( = ?auto_61158 ?auto_61160 ) ) ( not ( = ?auto_61159 ?auto_61160 ) ) ( ON ?auto_61160 ?auto_61161 ) ( not ( = ?auto_61157 ?auto_61161 ) ) ( not ( = ?auto_61158 ?auto_61161 ) ) ( not ( = ?auto_61159 ?auto_61161 ) ) ( not ( = ?auto_61160 ?auto_61161 ) ) ( ON ?auto_61159 ?auto_61160 ) ( CLEAR ?auto_61159 ) ( ON-TABLE ?auto_61162 ) ( ON ?auto_61161 ?auto_61162 ) ( not ( = ?auto_61162 ?auto_61161 ) ) ( not ( = ?auto_61162 ?auto_61160 ) ) ( not ( = ?auto_61162 ?auto_61159 ) ) ( not ( = ?auto_61157 ?auto_61162 ) ) ( not ( = ?auto_61158 ?auto_61162 ) ) ( HOLDING ?auto_61158 ) ( CLEAR ?auto_61157 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61157 ?auto_61158 )
      ( MAKE-4PILE ?auto_61157 ?auto_61158 ?auto_61159 ?auto_61160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61163 - BLOCK
      ?auto_61164 - BLOCK
      ?auto_61165 - BLOCK
      ?auto_61166 - BLOCK
    )
    :vars
    (
      ?auto_61168 - BLOCK
      ?auto_61167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61163 ) ( not ( = ?auto_61163 ?auto_61164 ) ) ( not ( = ?auto_61163 ?auto_61165 ) ) ( not ( = ?auto_61163 ?auto_61166 ) ) ( not ( = ?auto_61164 ?auto_61165 ) ) ( not ( = ?auto_61164 ?auto_61166 ) ) ( not ( = ?auto_61165 ?auto_61166 ) ) ( ON ?auto_61166 ?auto_61168 ) ( not ( = ?auto_61163 ?auto_61168 ) ) ( not ( = ?auto_61164 ?auto_61168 ) ) ( not ( = ?auto_61165 ?auto_61168 ) ) ( not ( = ?auto_61166 ?auto_61168 ) ) ( ON ?auto_61165 ?auto_61166 ) ( ON-TABLE ?auto_61167 ) ( ON ?auto_61168 ?auto_61167 ) ( not ( = ?auto_61167 ?auto_61168 ) ) ( not ( = ?auto_61167 ?auto_61166 ) ) ( not ( = ?auto_61167 ?auto_61165 ) ) ( not ( = ?auto_61163 ?auto_61167 ) ) ( not ( = ?auto_61164 ?auto_61167 ) ) ( CLEAR ?auto_61163 ) ( ON ?auto_61164 ?auto_61165 ) ( CLEAR ?auto_61164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61167 ?auto_61168 ?auto_61166 ?auto_61165 )
      ( MAKE-4PILE ?auto_61163 ?auto_61164 ?auto_61165 ?auto_61166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61169 - BLOCK
      ?auto_61170 - BLOCK
      ?auto_61171 - BLOCK
      ?auto_61172 - BLOCK
    )
    :vars
    (
      ?auto_61174 - BLOCK
      ?auto_61173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61169 ?auto_61170 ) ) ( not ( = ?auto_61169 ?auto_61171 ) ) ( not ( = ?auto_61169 ?auto_61172 ) ) ( not ( = ?auto_61170 ?auto_61171 ) ) ( not ( = ?auto_61170 ?auto_61172 ) ) ( not ( = ?auto_61171 ?auto_61172 ) ) ( ON ?auto_61172 ?auto_61174 ) ( not ( = ?auto_61169 ?auto_61174 ) ) ( not ( = ?auto_61170 ?auto_61174 ) ) ( not ( = ?auto_61171 ?auto_61174 ) ) ( not ( = ?auto_61172 ?auto_61174 ) ) ( ON ?auto_61171 ?auto_61172 ) ( ON-TABLE ?auto_61173 ) ( ON ?auto_61174 ?auto_61173 ) ( not ( = ?auto_61173 ?auto_61174 ) ) ( not ( = ?auto_61173 ?auto_61172 ) ) ( not ( = ?auto_61173 ?auto_61171 ) ) ( not ( = ?auto_61169 ?auto_61173 ) ) ( not ( = ?auto_61170 ?auto_61173 ) ) ( ON ?auto_61170 ?auto_61171 ) ( CLEAR ?auto_61170 ) ( HOLDING ?auto_61169 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61169 )
      ( MAKE-4PILE ?auto_61169 ?auto_61170 ?auto_61171 ?auto_61172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61175 - BLOCK
      ?auto_61176 - BLOCK
      ?auto_61177 - BLOCK
      ?auto_61178 - BLOCK
    )
    :vars
    (
      ?auto_61179 - BLOCK
      ?auto_61180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61175 ?auto_61176 ) ) ( not ( = ?auto_61175 ?auto_61177 ) ) ( not ( = ?auto_61175 ?auto_61178 ) ) ( not ( = ?auto_61176 ?auto_61177 ) ) ( not ( = ?auto_61176 ?auto_61178 ) ) ( not ( = ?auto_61177 ?auto_61178 ) ) ( ON ?auto_61178 ?auto_61179 ) ( not ( = ?auto_61175 ?auto_61179 ) ) ( not ( = ?auto_61176 ?auto_61179 ) ) ( not ( = ?auto_61177 ?auto_61179 ) ) ( not ( = ?auto_61178 ?auto_61179 ) ) ( ON ?auto_61177 ?auto_61178 ) ( ON-TABLE ?auto_61180 ) ( ON ?auto_61179 ?auto_61180 ) ( not ( = ?auto_61180 ?auto_61179 ) ) ( not ( = ?auto_61180 ?auto_61178 ) ) ( not ( = ?auto_61180 ?auto_61177 ) ) ( not ( = ?auto_61175 ?auto_61180 ) ) ( not ( = ?auto_61176 ?auto_61180 ) ) ( ON ?auto_61176 ?auto_61177 ) ( ON ?auto_61175 ?auto_61176 ) ( CLEAR ?auto_61175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61180 ?auto_61179 ?auto_61178 ?auto_61177 ?auto_61176 )
      ( MAKE-4PILE ?auto_61175 ?auto_61176 ?auto_61177 ?auto_61178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61185 - BLOCK
      ?auto_61186 - BLOCK
      ?auto_61187 - BLOCK
      ?auto_61188 - BLOCK
    )
    :vars
    (
      ?auto_61189 - BLOCK
      ?auto_61190 - BLOCK
      ?auto_61191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61185 ?auto_61186 ) ) ( not ( = ?auto_61185 ?auto_61187 ) ) ( not ( = ?auto_61185 ?auto_61188 ) ) ( not ( = ?auto_61186 ?auto_61187 ) ) ( not ( = ?auto_61186 ?auto_61188 ) ) ( not ( = ?auto_61187 ?auto_61188 ) ) ( ON ?auto_61188 ?auto_61189 ) ( not ( = ?auto_61185 ?auto_61189 ) ) ( not ( = ?auto_61186 ?auto_61189 ) ) ( not ( = ?auto_61187 ?auto_61189 ) ) ( not ( = ?auto_61188 ?auto_61189 ) ) ( ON ?auto_61187 ?auto_61188 ) ( ON-TABLE ?auto_61190 ) ( ON ?auto_61189 ?auto_61190 ) ( not ( = ?auto_61190 ?auto_61189 ) ) ( not ( = ?auto_61190 ?auto_61188 ) ) ( not ( = ?auto_61190 ?auto_61187 ) ) ( not ( = ?auto_61185 ?auto_61190 ) ) ( not ( = ?auto_61186 ?auto_61190 ) ) ( ON ?auto_61186 ?auto_61187 ) ( CLEAR ?auto_61186 ) ( ON ?auto_61185 ?auto_61191 ) ( CLEAR ?auto_61185 ) ( HAND-EMPTY ) ( not ( = ?auto_61185 ?auto_61191 ) ) ( not ( = ?auto_61186 ?auto_61191 ) ) ( not ( = ?auto_61187 ?auto_61191 ) ) ( not ( = ?auto_61188 ?auto_61191 ) ) ( not ( = ?auto_61189 ?auto_61191 ) ) ( not ( = ?auto_61190 ?auto_61191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61185 ?auto_61191 )
      ( MAKE-4PILE ?auto_61185 ?auto_61186 ?auto_61187 ?auto_61188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61192 - BLOCK
      ?auto_61193 - BLOCK
      ?auto_61194 - BLOCK
      ?auto_61195 - BLOCK
    )
    :vars
    (
      ?auto_61198 - BLOCK
      ?auto_61196 - BLOCK
      ?auto_61197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61192 ?auto_61193 ) ) ( not ( = ?auto_61192 ?auto_61194 ) ) ( not ( = ?auto_61192 ?auto_61195 ) ) ( not ( = ?auto_61193 ?auto_61194 ) ) ( not ( = ?auto_61193 ?auto_61195 ) ) ( not ( = ?auto_61194 ?auto_61195 ) ) ( ON ?auto_61195 ?auto_61198 ) ( not ( = ?auto_61192 ?auto_61198 ) ) ( not ( = ?auto_61193 ?auto_61198 ) ) ( not ( = ?auto_61194 ?auto_61198 ) ) ( not ( = ?auto_61195 ?auto_61198 ) ) ( ON ?auto_61194 ?auto_61195 ) ( ON-TABLE ?auto_61196 ) ( ON ?auto_61198 ?auto_61196 ) ( not ( = ?auto_61196 ?auto_61198 ) ) ( not ( = ?auto_61196 ?auto_61195 ) ) ( not ( = ?auto_61196 ?auto_61194 ) ) ( not ( = ?auto_61192 ?auto_61196 ) ) ( not ( = ?auto_61193 ?auto_61196 ) ) ( ON ?auto_61192 ?auto_61197 ) ( CLEAR ?auto_61192 ) ( not ( = ?auto_61192 ?auto_61197 ) ) ( not ( = ?auto_61193 ?auto_61197 ) ) ( not ( = ?auto_61194 ?auto_61197 ) ) ( not ( = ?auto_61195 ?auto_61197 ) ) ( not ( = ?auto_61198 ?auto_61197 ) ) ( not ( = ?auto_61196 ?auto_61197 ) ) ( HOLDING ?auto_61193 ) ( CLEAR ?auto_61194 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61196 ?auto_61198 ?auto_61195 ?auto_61194 ?auto_61193 )
      ( MAKE-4PILE ?auto_61192 ?auto_61193 ?auto_61194 ?auto_61195 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61199 - BLOCK
      ?auto_61200 - BLOCK
      ?auto_61201 - BLOCK
      ?auto_61202 - BLOCK
    )
    :vars
    (
      ?auto_61204 - BLOCK
      ?auto_61203 - BLOCK
      ?auto_61205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61199 ?auto_61200 ) ) ( not ( = ?auto_61199 ?auto_61201 ) ) ( not ( = ?auto_61199 ?auto_61202 ) ) ( not ( = ?auto_61200 ?auto_61201 ) ) ( not ( = ?auto_61200 ?auto_61202 ) ) ( not ( = ?auto_61201 ?auto_61202 ) ) ( ON ?auto_61202 ?auto_61204 ) ( not ( = ?auto_61199 ?auto_61204 ) ) ( not ( = ?auto_61200 ?auto_61204 ) ) ( not ( = ?auto_61201 ?auto_61204 ) ) ( not ( = ?auto_61202 ?auto_61204 ) ) ( ON ?auto_61201 ?auto_61202 ) ( ON-TABLE ?auto_61203 ) ( ON ?auto_61204 ?auto_61203 ) ( not ( = ?auto_61203 ?auto_61204 ) ) ( not ( = ?auto_61203 ?auto_61202 ) ) ( not ( = ?auto_61203 ?auto_61201 ) ) ( not ( = ?auto_61199 ?auto_61203 ) ) ( not ( = ?auto_61200 ?auto_61203 ) ) ( ON ?auto_61199 ?auto_61205 ) ( not ( = ?auto_61199 ?auto_61205 ) ) ( not ( = ?auto_61200 ?auto_61205 ) ) ( not ( = ?auto_61201 ?auto_61205 ) ) ( not ( = ?auto_61202 ?auto_61205 ) ) ( not ( = ?auto_61204 ?auto_61205 ) ) ( not ( = ?auto_61203 ?auto_61205 ) ) ( CLEAR ?auto_61201 ) ( ON ?auto_61200 ?auto_61199 ) ( CLEAR ?auto_61200 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61205 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61205 ?auto_61199 )
      ( MAKE-4PILE ?auto_61199 ?auto_61200 ?auto_61201 ?auto_61202 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61206 - BLOCK
      ?auto_61207 - BLOCK
      ?auto_61208 - BLOCK
      ?auto_61209 - BLOCK
    )
    :vars
    (
      ?auto_61212 - BLOCK
      ?auto_61211 - BLOCK
      ?auto_61210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61206 ?auto_61207 ) ) ( not ( = ?auto_61206 ?auto_61208 ) ) ( not ( = ?auto_61206 ?auto_61209 ) ) ( not ( = ?auto_61207 ?auto_61208 ) ) ( not ( = ?auto_61207 ?auto_61209 ) ) ( not ( = ?auto_61208 ?auto_61209 ) ) ( ON ?auto_61209 ?auto_61212 ) ( not ( = ?auto_61206 ?auto_61212 ) ) ( not ( = ?auto_61207 ?auto_61212 ) ) ( not ( = ?auto_61208 ?auto_61212 ) ) ( not ( = ?auto_61209 ?auto_61212 ) ) ( ON-TABLE ?auto_61211 ) ( ON ?auto_61212 ?auto_61211 ) ( not ( = ?auto_61211 ?auto_61212 ) ) ( not ( = ?auto_61211 ?auto_61209 ) ) ( not ( = ?auto_61211 ?auto_61208 ) ) ( not ( = ?auto_61206 ?auto_61211 ) ) ( not ( = ?auto_61207 ?auto_61211 ) ) ( ON ?auto_61206 ?auto_61210 ) ( not ( = ?auto_61206 ?auto_61210 ) ) ( not ( = ?auto_61207 ?auto_61210 ) ) ( not ( = ?auto_61208 ?auto_61210 ) ) ( not ( = ?auto_61209 ?auto_61210 ) ) ( not ( = ?auto_61212 ?auto_61210 ) ) ( not ( = ?auto_61211 ?auto_61210 ) ) ( ON ?auto_61207 ?auto_61206 ) ( CLEAR ?auto_61207 ) ( ON-TABLE ?auto_61210 ) ( HOLDING ?auto_61208 ) ( CLEAR ?auto_61209 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61211 ?auto_61212 ?auto_61209 ?auto_61208 )
      ( MAKE-4PILE ?auto_61206 ?auto_61207 ?auto_61208 ?auto_61209 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61213 - BLOCK
      ?auto_61214 - BLOCK
      ?auto_61215 - BLOCK
      ?auto_61216 - BLOCK
    )
    :vars
    (
      ?auto_61219 - BLOCK
      ?auto_61217 - BLOCK
      ?auto_61218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61213 ?auto_61214 ) ) ( not ( = ?auto_61213 ?auto_61215 ) ) ( not ( = ?auto_61213 ?auto_61216 ) ) ( not ( = ?auto_61214 ?auto_61215 ) ) ( not ( = ?auto_61214 ?auto_61216 ) ) ( not ( = ?auto_61215 ?auto_61216 ) ) ( ON ?auto_61216 ?auto_61219 ) ( not ( = ?auto_61213 ?auto_61219 ) ) ( not ( = ?auto_61214 ?auto_61219 ) ) ( not ( = ?auto_61215 ?auto_61219 ) ) ( not ( = ?auto_61216 ?auto_61219 ) ) ( ON-TABLE ?auto_61217 ) ( ON ?auto_61219 ?auto_61217 ) ( not ( = ?auto_61217 ?auto_61219 ) ) ( not ( = ?auto_61217 ?auto_61216 ) ) ( not ( = ?auto_61217 ?auto_61215 ) ) ( not ( = ?auto_61213 ?auto_61217 ) ) ( not ( = ?auto_61214 ?auto_61217 ) ) ( ON ?auto_61213 ?auto_61218 ) ( not ( = ?auto_61213 ?auto_61218 ) ) ( not ( = ?auto_61214 ?auto_61218 ) ) ( not ( = ?auto_61215 ?auto_61218 ) ) ( not ( = ?auto_61216 ?auto_61218 ) ) ( not ( = ?auto_61219 ?auto_61218 ) ) ( not ( = ?auto_61217 ?auto_61218 ) ) ( ON ?auto_61214 ?auto_61213 ) ( ON-TABLE ?auto_61218 ) ( CLEAR ?auto_61216 ) ( ON ?auto_61215 ?auto_61214 ) ( CLEAR ?auto_61215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61218 ?auto_61213 ?auto_61214 )
      ( MAKE-4PILE ?auto_61213 ?auto_61214 ?auto_61215 ?auto_61216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61220 - BLOCK
      ?auto_61221 - BLOCK
      ?auto_61222 - BLOCK
      ?auto_61223 - BLOCK
    )
    :vars
    (
      ?auto_61226 - BLOCK
      ?auto_61224 - BLOCK
      ?auto_61225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61220 ?auto_61221 ) ) ( not ( = ?auto_61220 ?auto_61222 ) ) ( not ( = ?auto_61220 ?auto_61223 ) ) ( not ( = ?auto_61221 ?auto_61222 ) ) ( not ( = ?auto_61221 ?auto_61223 ) ) ( not ( = ?auto_61222 ?auto_61223 ) ) ( not ( = ?auto_61220 ?auto_61226 ) ) ( not ( = ?auto_61221 ?auto_61226 ) ) ( not ( = ?auto_61222 ?auto_61226 ) ) ( not ( = ?auto_61223 ?auto_61226 ) ) ( ON-TABLE ?auto_61224 ) ( ON ?auto_61226 ?auto_61224 ) ( not ( = ?auto_61224 ?auto_61226 ) ) ( not ( = ?auto_61224 ?auto_61223 ) ) ( not ( = ?auto_61224 ?auto_61222 ) ) ( not ( = ?auto_61220 ?auto_61224 ) ) ( not ( = ?auto_61221 ?auto_61224 ) ) ( ON ?auto_61220 ?auto_61225 ) ( not ( = ?auto_61220 ?auto_61225 ) ) ( not ( = ?auto_61221 ?auto_61225 ) ) ( not ( = ?auto_61222 ?auto_61225 ) ) ( not ( = ?auto_61223 ?auto_61225 ) ) ( not ( = ?auto_61226 ?auto_61225 ) ) ( not ( = ?auto_61224 ?auto_61225 ) ) ( ON ?auto_61221 ?auto_61220 ) ( ON-TABLE ?auto_61225 ) ( ON ?auto_61222 ?auto_61221 ) ( CLEAR ?auto_61222 ) ( HOLDING ?auto_61223 ) ( CLEAR ?auto_61226 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61224 ?auto_61226 ?auto_61223 )
      ( MAKE-4PILE ?auto_61220 ?auto_61221 ?auto_61222 ?auto_61223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61227 - BLOCK
      ?auto_61228 - BLOCK
      ?auto_61229 - BLOCK
      ?auto_61230 - BLOCK
    )
    :vars
    (
      ?auto_61232 - BLOCK
      ?auto_61231 - BLOCK
      ?auto_61233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61227 ?auto_61228 ) ) ( not ( = ?auto_61227 ?auto_61229 ) ) ( not ( = ?auto_61227 ?auto_61230 ) ) ( not ( = ?auto_61228 ?auto_61229 ) ) ( not ( = ?auto_61228 ?auto_61230 ) ) ( not ( = ?auto_61229 ?auto_61230 ) ) ( not ( = ?auto_61227 ?auto_61232 ) ) ( not ( = ?auto_61228 ?auto_61232 ) ) ( not ( = ?auto_61229 ?auto_61232 ) ) ( not ( = ?auto_61230 ?auto_61232 ) ) ( ON-TABLE ?auto_61231 ) ( ON ?auto_61232 ?auto_61231 ) ( not ( = ?auto_61231 ?auto_61232 ) ) ( not ( = ?auto_61231 ?auto_61230 ) ) ( not ( = ?auto_61231 ?auto_61229 ) ) ( not ( = ?auto_61227 ?auto_61231 ) ) ( not ( = ?auto_61228 ?auto_61231 ) ) ( ON ?auto_61227 ?auto_61233 ) ( not ( = ?auto_61227 ?auto_61233 ) ) ( not ( = ?auto_61228 ?auto_61233 ) ) ( not ( = ?auto_61229 ?auto_61233 ) ) ( not ( = ?auto_61230 ?auto_61233 ) ) ( not ( = ?auto_61232 ?auto_61233 ) ) ( not ( = ?auto_61231 ?auto_61233 ) ) ( ON ?auto_61228 ?auto_61227 ) ( ON-TABLE ?auto_61233 ) ( ON ?auto_61229 ?auto_61228 ) ( CLEAR ?auto_61232 ) ( ON ?auto_61230 ?auto_61229 ) ( CLEAR ?auto_61230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61233 ?auto_61227 ?auto_61228 ?auto_61229 )
      ( MAKE-4PILE ?auto_61227 ?auto_61228 ?auto_61229 ?auto_61230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61234 - BLOCK
      ?auto_61235 - BLOCK
      ?auto_61236 - BLOCK
      ?auto_61237 - BLOCK
    )
    :vars
    (
      ?auto_61240 - BLOCK
      ?auto_61238 - BLOCK
      ?auto_61239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61234 ?auto_61235 ) ) ( not ( = ?auto_61234 ?auto_61236 ) ) ( not ( = ?auto_61234 ?auto_61237 ) ) ( not ( = ?auto_61235 ?auto_61236 ) ) ( not ( = ?auto_61235 ?auto_61237 ) ) ( not ( = ?auto_61236 ?auto_61237 ) ) ( not ( = ?auto_61234 ?auto_61240 ) ) ( not ( = ?auto_61235 ?auto_61240 ) ) ( not ( = ?auto_61236 ?auto_61240 ) ) ( not ( = ?auto_61237 ?auto_61240 ) ) ( ON-TABLE ?auto_61238 ) ( not ( = ?auto_61238 ?auto_61240 ) ) ( not ( = ?auto_61238 ?auto_61237 ) ) ( not ( = ?auto_61238 ?auto_61236 ) ) ( not ( = ?auto_61234 ?auto_61238 ) ) ( not ( = ?auto_61235 ?auto_61238 ) ) ( ON ?auto_61234 ?auto_61239 ) ( not ( = ?auto_61234 ?auto_61239 ) ) ( not ( = ?auto_61235 ?auto_61239 ) ) ( not ( = ?auto_61236 ?auto_61239 ) ) ( not ( = ?auto_61237 ?auto_61239 ) ) ( not ( = ?auto_61240 ?auto_61239 ) ) ( not ( = ?auto_61238 ?auto_61239 ) ) ( ON ?auto_61235 ?auto_61234 ) ( ON-TABLE ?auto_61239 ) ( ON ?auto_61236 ?auto_61235 ) ( ON ?auto_61237 ?auto_61236 ) ( CLEAR ?auto_61237 ) ( HOLDING ?auto_61240 ) ( CLEAR ?auto_61238 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61238 ?auto_61240 )
      ( MAKE-4PILE ?auto_61234 ?auto_61235 ?auto_61236 ?auto_61237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61241 - BLOCK
      ?auto_61242 - BLOCK
      ?auto_61243 - BLOCK
      ?auto_61244 - BLOCK
    )
    :vars
    (
      ?auto_61246 - BLOCK
      ?auto_61245 - BLOCK
      ?auto_61247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61241 ?auto_61242 ) ) ( not ( = ?auto_61241 ?auto_61243 ) ) ( not ( = ?auto_61241 ?auto_61244 ) ) ( not ( = ?auto_61242 ?auto_61243 ) ) ( not ( = ?auto_61242 ?auto_61244 ) ) ( not ( = ?auto_61243 ?auto_61244 ) ) ( not ( = ?auto_61241 ?auto_61246 ) ) ( not ( = ?auto_61242 ?auto_61246 ) ) ( not ( = ?auto_61243 ?auto_61246 ) ) ( not ( = ?auto_61244 ?auto_61246 ) ) ( ON-TABLE ?auto_61245 ) ( not ( = ?auto_61245 ?auto_61246 ) ) ( not ( = ?auto_61245 ?auto_61244 ) ) ( not ( = ?auto_61245 ?auto_61243 ) ) ( not ( = ?auto_61241 ?auto_61245 ) ) ( not ( = ?auto_61242 ?auto_61245 ) ) ( ON ?auto_61241 ?auto_61247 ) ( not ( = ?auto_61241 ?auto_61247 ) ) ( not ( = ?auto_61242 ?auto_61247 ) ) ( not ( = ?auto_61243 ?auto_61247 ) ) ( not ( = ?auto_61244 ?auto_61247 ) ) ( not ( = ?auto_61246 ?auto_61247 ) ) ( not ( = ?auto_61245 ?auto_61247 ) ) ( ON ?auto_61242 ?auto_61241 ) ( ON-TABLE ?auto_61247 ) ( ON ?auto_61243 ?auto_61242 ) ( ON ?auto_61244 ?auto_61243 ) ( CLEAR ?auto_61245 ) ( ON ?auto_61246 ?auto_61244 ) ( CLEAR ?auto_61246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61247 ?auto_61241 ?auto_61242 ?auto_61243 ?auto_61244 )
      ( MAKE-4PILE ?auto_61241 ?auto_61242 ?auto_61243 ?auto_61244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61248 - BLOCK
      ?auto_61249 - BLOCK
      ?auto_61250 - BLOCK
      ?auto_61251 - BLOCK
    )
    :vars
    (
      ?auto_61252 - BLOCK
      ?auto_61253 - BLOCK
      ?auto_61254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61248 ?auto_61249 ) ) ( not ( = ?auto_61248 ?auto_61250 ) ) ( not ( = ?auto_61248 ?auto_61251 ) ) ( not ( = ?auto_61249 ?auto_61250 ) ) ( not ( = ?auto_61249 ?auto_61251 ) ) ( not ( = ?auto_61250 ?auto_61251 ) ) ( not ( = ?auto_61248 ?auto_61252 ) ) ( not ( = ?auto_61249 ?auto_61252 ) ) ( not ( = ?auto_61250 ?auto_61252 ) ) ( not ( = ?auto_61251 ?auto_61252 ) ) ( not ( = ?auto_61253 ?auto_61252 ) ) ( not ( = ?auto_61253 ?auto_61251 ) ) ( not ( = ?auto_61253 ?auto_61250 ) ) ( not ( = ?auto_61248 ?auto_61253 ) ) ( not ( = ?auto_61249 ?auto_61253 ) ) ( ON ?auto_61248 ?auto_61254 ) ( not ( = ?auto_61248 ?auto_61254 ) ) ( not ( = ?auto_61249 ?auto_61254 ) ) ( not ( = ?auto_61250 ?auto_61254 ) ) ( not ( = ?auto_61251 ?auto_61254 ) ) ( not ( = ?auto_61252 ?auto_61254 ) ) ( not ( = ?auto_61253 ?auto_61254 ) ) ( ON ?auto_61249 ?auto_61248 ) ( ON-TABLE ?auto_61254 ) ( ON ?auto_61250 ?auto_61249 ) ( ON ?auto_61251 ?auto_61250 ) ( ON ?auto_61252 ?auto_61251 ) ( CLEAR ?auto_61252 ) ( HOLDING ?auto_61253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61253 )
      ( MAKE-4PILE ?auto_61248 ?auto_61249 ?auto_61250 ?auto_61251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_61255 - BLOCK
      ?auto_61256 - BLOCK
      ?auto_61257 - BLOCK
      ?auto_61258 - BLOCK
    )
    :vars
    (
      ?auto_61260 - BLOCK
      ?auto_61259 - BLOCK
      ?auto_61261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61255 ?auto_61256 ) ) ( not ( = ?auto_61255 ?auto_61257 ) ) ( not ( = ?auto_61255 ?auto_61258 ) ) ( not ( = ?auto_61256 ?auto_61257 ) ) ( not ( = ?auto_61256 ?auto_61258 ) ) ( not ( = ?auto_61257 ?auto_61258 ) ) ( not ( = ?auto_61255 ?auto_61260 ) ) ( not ( = ?auto_61256 ?auto_61260 ) ) ( not ( = ?auto_61257 ?auto_61260 ) ) ( not ( = ?auto_61258 ?auto_61260 ) ) ( not ( = ?auto_61259 ?auto_61260 ) ) ( not ( = ?auto_61259 ?auto_61258 ) ) ( not ( = ?auto_61259 ?auto_61257 ) ) ( not ( = ?auto_61255 ?auto_61259 ) ) ( not ( = ?auto_61256 ?auto_61259 ) ) ( ON ?auto_61255 ?auto_61261 ) ( not ( = ?auto_61255 ?auto_61261 ) ) ( not ( = ?auto_61256 ?auto_61261 ) ) ( not ( = ?auto_61257 ?auto_61261 ) ) ( not ( = ?auto_61258 ?auto_61261 ) ) ( not ( = ?auto_61260 ?auto_61261 ) ) ( not ( = ?auto_61259 ?auto_61261 ) ) ( ON ?auto_61256 ?auto_61255 ) ( ON-TABLE ?auto_61261 ) ( ON ?auto_61257 ?auto_61256 ) ( ON ?auto_61258 ?auto_61257 ) ( ON ?auto_61260 ?auto_61258 ) ( ON ?auto_61259 ?auto_61260 ) ( CLEAR ?auto_61259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61261 ?auto_61255 ?auto_61256 ?auto_61257 ?auto_61258 ?auto_61260 )
      ( MAKE-4PILE ?auto_61255 ?auto_61256 ?auto_61257 ?auto_61258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61273 - BLOCK
    )
    :vars
    (
      ?auto_61275 - BLOCK
      ?auto_61274 - BLOCK
      ?auto_61276 - BLOCK
      ?auto_61278 - BLOCK
      ?auto_61277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61275 ?auto_61273 ) ( ON-TABLE ?auto_61273 ) ( not ( = ?auto_61273 ?auto_61275 ) ) ( not ( = ?auto_61273 ?auto_61274 ) ) ( not ( = ?auto_61273 ?auto_61276 ) ) ( not ( = ?auto_61275 ?auto_61274 ) ) ( not ( = ?auto_61275 ?auto_61276 ) ) ( not ( = ?auto_61274 ?auto_61276 ) ) ( ON ?auto_61274 ?auto_61275 ) ( CLEAR ?auto_61274 ) ( HOLDING ?auto_61276 ) ( CLEAR ?auto_61278 ) ( ON-TABLE ?auto_61277 ) ( ON ?auto_61278 ?auto_61277 ) ( not ( = ?auto_61277 ?auto_61278 ) ) ( not ( = ?auto_61277 ?auto_61276 ) ) ( not ( = ?auto_61278 ?auto_61276 ) ) ( not ( = ?auto_61273 ?auto_61278 ) ) ( not ( = ?auto_61273 ?auto_61277 ) ) ( not ( = ?auto_61275 ?auto_61278 ) ) ( not ( = ?auto_61275 ?auto_61277 ) ) ( not ( = ?auto_61274 ?auto_61278 ) ) ( not ( = ?auto_61274 ?auto_61277 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61277 ?auto_61278 ?auto_61276 )
      ( MAKE-1PILE ?auto_61273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61279 - BLOCK
    )
    :vars
    (
      ?auto_61284 - BLOCK
      ?auto_61280 - BLOCK
      ?auto_61281 - BLOCK
      ?auto_61282 - BLOCK
      ?auto_61283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61284 ?auto_61279 ) ( ON-TABLE ?auto_61279 ) ( not ( = ?auto_61279 ?auto_61284 ) ) ( not ( = ?auto_61279 ?auto_61280 ) ) ( not ( = ?auto_61279 ?auto_61281 ) ) ( not ( = ?auto_61284 ?auto_61280 ) ) ( not ( = ?auto_61284 ?auto_61281 ) ) ( not ( = ?auto_61280 ?auto_61281 ) ) ( ON ?auto_61280 ?auto_61284 ) ( CLEAR ?auto_61282 ) ( ON-TABLE ?auto_61283 ) ( ON ?auto_61282 ?auto_61283 ) ( not ( = ?auto_61283 ?auto_61282 ) ) ( not ( = ?auto_61283 ?auto_61281 ) ) ( not ( = ?auto_61282 ?auto_61281 ) ) ( not ( = ?auto_61279 ?auto_61282 ) ) ( not ( = ?auto_61279 ?auto_61283 ) ) ( not ( = ?auto_61284 ?auto_61282 ) ) ( not ( = ?auto_61284 ?auto_61283 ) ) ( not ( = ?auto_61280 ?auto_61282 ) ) ( not ( = ?auto_61280 ?auto_61283 ) ) ( ON ?auto_61281 ?auto_61280 ) ( CLEAR ?auto_61281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61279 ?auto_61284 ?auto_61280 )
      ( MAKE-1PILE ?auto_61279 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61285 - BLOCK
    )
    :vars
    (
      ?auto_61286 - BLOCK
      ?auto_61287 - BLOCK
      ?auto_61289 - BLOCK
      ?auto_61290 - BLOCK
      ?auto_61288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61286 ?auto_61285 ) ( ON-TABLE ?auto_61285 ) ( not ( = ?auto_61285 ?auto_61286 ) ) ( not ( = ?auto_61285 ?auto_61287 ) ) ( not ( = ?auto_61285 ?auto_61289 ) ) ( not ( = ?auto_61286 ?auto_61287 ) ) ( not ( = ?auto_61286 ?auto_61289 ) ) ( not ( = ?auto_61287 ?auto_61289 ) ) ( ON ?auto_61287 ?auto_61286 ) ( ON-TABLE ?auto_61290 ) ( not ( = ?auto_61290 ?auto_61288 ) ) ( not ( = ?auto_61290 ?auto_61289 ) ) ( not ( = ?auto_61288 ?auto_61289 ) ) ( not ( = ?auto_61285 ?auto_61288 ) ) ( not ( = ?auto_61285 ?auto_61290 ) ) ( not ( = ?auto_61286 ?auto_61288 ) ) ( not ( = ?auto_61286 ?auto_61290 ) ) ( not ( = ?auto_61287 ?auto_61288 ) ) ( not ( = ?auto_61287 ?auto_61290 ) ) ( ON ?auto_61289 ?auto_61287 ) ( CLEAR ?auto_61289 ) ( HOLDING ?auto_61288 ) ( CLEAR ?auto_61290 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61290 ?auto_61288 )
      ( MAKE-1PILE ?auto_61285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61291 - BLOCK
    )
    :vars
    (
      ?auto_61296 - BLOCK
      ?auto_61293 - BLOCK
      ?auto_61292 - BLOCK
      ?auto_61295 - BLOCK
      ?auto_61294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61296 ?auto_61291 ) ( ON-TABLE ?auto_61291 ) ( not ( = ?auto_61291 ?auto_61296 ) ) ( not ( = ?auto_61291 ?auto_61293 ) ) ( not ( = ?auto_61291 ?auto_61292 ) ) ( not ( = ?auto_61296 ?auto_61293 ) ) ( not ( = ?auto_61296 ?auto_61292 ) ) ( not ( = ?auto_61293 ?auto_61292 ) ) ( ON ?auto_61293 ?auto_61296 ) ( ON-TABLE ?auto_61295 ) ( not ( = ?auto_61295 ?auto_61294 ) ) ( not ( = ?auto_61295 ?auto_61292 ) ) ( not ( = ?auto_61294 ?auto_61292 ) ) ( not ( = ?auto_61291 ?auto_61294 ) ) ( not ( = ?auto_61291 ?auto_61295 ) ) ( not ( = ?auto_61296 ?auto_61294 ) ) ( not ( = ?auto_61296 ?auto_61295 ) ) ( not ( = ?auto_61293 ?auto_61294 ) ) ( not ( = ?auto_61293 ?auto_61295 ) ) ( ON ?auto_61292 ?auto_61293 ) ( CLEAR ?auto_61295 ) ( ON ?auto_61294 ?auto_61292 ) ( CLEAR ?auto_61294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61291 ?auto_61296 ?auto_61293 ?auto_61292 )
      ( MAKE-1PILE ?auto_61291 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61297 - BLOCK
    )
    :vars
    (
      ?auto_61302 - BLOCK
      ?auto_61301 - BLOCK
      ?auto_61299 - BLOCK
      ?auto_61300 - BLOCK
      ?auto_61298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61302 ?auto_61297 ) ( ON-TABLE ?auto_61297 ) ( not ( = ?auto_61297 ?auto_61302 ) ) ( not ( = ?auto_61297 ?auto_61301 ) ) ( not ( = ?auto_61297 ?auto_61299 ) ) ( not ( = ?auto_61302 ?auto_61301 ) ) ( not ( = ?auto_61302 ?auto_61299 ) ) ( not ( = ?auto_61301 ?auto_61299 ) ) ( ON ?auto_61301 ?auto_61302 ) ( not ( = ?auto_61300 ?auto_61298 ) ) ( not ( = ?auto_61300 ?auto_61299 ) ) ( not ( = ?auto_61298 ?auto_61299 ) ) ( not ( = ?auto_61297 ?auto_61298 ) ) ( not ( = ?auto_61297 ?auto_61300 ) ) ( not ( = ?auto_61302 ?auto_61298 ) ) ( not ( = ?auto_61302 ?auto_61300 ) ) ( not ( = ?auto_61301 ?auto_61298 ) ) ( not ( = ?auto_61301 ?auto_61300 ) ) ( ON ?auto_61299 ?auto_61301 ) ( ON ?auto_61298 ?auto_61299 ) ( CLEAR ?auto_61298 ) ( HOLDING ?auto_61300 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61300 )
      ( MAKE-1PILE ?auto_61297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61310 - BLOCK
    )
    :vars
    (
      ?auto_61311 - BLOCK
      ?auto_61314 - BLOCK
      ?auto_61312 - BLOCK
      ?auto_61313 - BLOCK
      ?auto_61315 - BLOCK
      ?auto_61316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61311 ?auto_61310 ) ( ON-TABLE ?auto_61310 ) ( not ( = ?auto_61310 ?auto_61311 ) ) ( not ( = ?auto_61310 ?auto_61314 ) ) ( not ( = ?auto_61310 ?auto_61312 ) ) ( not ( = ?auto_61311 ?auto_61314 ) ) ( not ( = ?auto_61311 ?auto_61312 ) ) ( not ( = ?auto_61314 ?auto_61312 ) ) ( ON ?auto_61314 ?auto_61311 ) ( not ( = ?auto_61313 ?auto_61315 ) ) ( not ( = ?auto_61313 ?auto_61312 ) ) ( not ( = ?auto_61315 ?auto_61312 ) ) ( not ( = ?auto_61310 ?auto_61315 ) ) ( not ( = ?auto_61310 ?auto_61313 ) ) ( not ( = ?auto_61311 ?auto_61315 ) ) ( not ( = ?auto_61311 ?auto_61313 ) ) ( not ( = ?auto_61314 ?auto_61315 ) ) ( not ( = ?auto_61314 ?auto_61313 ) ) ( ON ?auto_61312 ?auto_61314 ) ( ON ?auto_61315 ?auto_61312 ) ( CLEAR ?auto_61315 ) ( ON ?auto_61313 ?auto_61316 ) ( CLEAR ?auto_61313 ) ( HAND-EMPTY ) ( not ( = ?auto_61310 ?auto_61316 ) ) ( not ( = ?auto_61311 ?auto_61316 ) ) ( not ( = ?auto_61314 ?auto_61316 ) ) ( not ( = ?auto_61312 ?auto_61316 ) ) ( not ( = ?auto_61313 ?auto_61316 ) ) ( not ( = ?auto_61315 ?auto_61316 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61313 ?auto_61316 )
      ( MAKE-1PILE ?auto_61310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61317 - BLOCK
    )
    :vars
    (
      ?auto_61321 - BLOCK
      ?auto_61322 - BLOCK
      ?auto_61323 - BLOCK
      ?auto_61319 - BLOCK
      ?auto_61320 - BLOCK
      ?auto_61318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61321 ?auto_61317 ) ( ON-TABLE ?auto_61317 ) ( not ( = ?auto_61317 ?auto_61321 ) ) ( not ( = ?auto_61317 ?auto_61322 ) ) ( not ( = ?auto_61317 ?auto_61323 ) ) ( not ( = ?auto_61321 ?auto_61322 ) ) ( not ( = ?auto_61321 ?auto_61323 ) ) ( not ( = ?auto_61322 ?auto_61323 ) ) ( ON ?auto_61322 ?auto_61321 ) ( not ( = ?auto_61319 ?auto_61320 ) ) ( not ( = ?auto_61319 ?auto_61323 ) ) ( not ( = ?auto_61320 ?auto_61323 ) ) ( not ( = ?auto_61317 ?auto_61320 ) ) ( not ( = ?auto_61317 ?auto_61319 ) ) ( not ( = ?auto_61321 ?auto_61320 ) ) ( not ( = ?auto_61321 ?auto_61319 ) ) ( not ( = ?auto_61322 ?auto_61320 ) ) ( not ( = ?auto_61322 ?auto_61319 ) ) ( ON ?auto_61323 ?auto_61322 ) ( ON ?auto_61319 ?auto_61318 ) ( CLEAR ?auto_61319 ) ( not ( = ?auto_61317 ?auto_61318 ) ) ( not ( = ?auto_61321 ?auto_61318 ) ) ( not ( = ?auto_61322 ?auto_61318 ) ) ( not ( = ?auto_61323 ?auto_61318 ) ) ( not ( = ?auto_61319 ?auto_61318 ) ) ( not ( = ?auto_61320 ?auto_61318 ) ) ( HOLDING ?auto_61320 ) ( CLEAR ?auto_61323 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61317 ?auto_61321 ?auto_61322 ?auto_61323 ?auto_61320 )
      ( MAKE-1PILE ?auto_61317 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_61324 - BLOCK
    )
    :vars
    (
      ?auto_61327 - BLOCK
      ?auto_61330 - BLOCK
      ?auto_61325 - BLOCK
      ?auto_61326 - BLOCK
      ?auto_61329 - BLOCK
      ?auto_61328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_61327 ?auto_61324 ) ( ON-TABLE ?auto_61324 ) ( not ( = ?auto_61324 ?auto_61327 ) ) ( not ( = ?auto_61324 ?auto_61330 ) ) ( not ( = ?auto_61324 ?auto_61325 ) ) ( not ( = ?auto_61327 ?auto_61330 ) ) ( not ( = ?auto_61327 ?auto_61325 ) ) ( not ( = ?auto_61330 ?auto_61325 ) ) ( ON ?auto_61330 ?auto_61327 ) ( not ( = ?auto_61326 ?auto_61329 ) ) ( not ( = ?auto_61326 ?auto_61325 ) ) ( not ( = ?auto_61329 ?auto_61325 ) ) ( not ( = ?auto_61324 ?auto_61329 ) ) ( not ( = ?auto_61324 ?auto_61326 ) ) ( not ( = ?auto_61327 ?auto_61329 ) ) ( not ( = ?auto_61327 ?auto_61326 ) ) ( not ( = ?auto_61330 ?auto_61329 ) ) ( not ( = ?auto_61330 ?auto_61326 ) ) ( ON ?auto_61325 ?auto_61330 ) ( ON ?auto_61326 ?auto_61328 ) ( not ( = ?auto_61324 ?auto_61328 ) ) ( not ( = ?auto_61327 ?auto_61328 ) ) ( not ( = ?auto_61330 ?auto_61328 ) ) ( not ( = ?auto_61325 ?auto_61328 ) ) ( not ( = ?auto_61326 ?auto_61328 ) ) ( not ( = ?auto_61329 ?auto_61328 ) ) ( CLEAR ?auto_61325 ) ( ON ?auto_61329 ?auto_61326 ) ( CLEAR ?auto_61329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61328 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61328 ?auto_61326 )
      ( MAKE-1PILE ?auto_61324 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61364 - BLOCK
      ?auto_61365 - BLOCK
      ?auto_61366 - BLOCK
      ?auto_61367 - BLOCK
      ?auto_61368 - BLOCK
    )
    :vars
    (
      ?auto_61369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61364 ) ( ON ?auto_61365 ?auto_61364 ) ( ON ?auto_61366 ?auto_61365 ) ( not ( = ?auto_61364 ?auto_61365 ) ) ( not ( = ?auto_61364 ?auto_61366 ) ) ( not ( = ?auto_61364 ?auto_61367 ) ) ( not ( = ?auto_61364 ?auto_61368 ) ) ( not ( = ?auto_61365 ?auto_61366 ) ) ( not ( = ?auto_61365 ?auto_61367 ) ) ( not ( = ?auto_61365 ?auto_61368 ) ) ( not ( = ?auto_61366 ?auto_61367 ) ) ( not ( = ?auto_61366 ?auto_61368 ) ) ( not ( = ?auto_61367 ?auto_61368 ) ) ( ON ?auto_61368 ?auto_61369 ) ( not ( = ?auto_61364 ?auto_61369 ) ) ( not ( = ?auto_61365 ?auto_61369 ) ) ( not ( = ?auto_61366 ?auto_61369 ) ) ( not ( = ?auto_61367 ?auto_61369 ) ) ( not ( = ?auto_61368 ?auto_61369 ) ) ( CLEAR ?auto_61366 ) ( ON ?auto_61367 ?auto_61368 ) ( CLEAR ?auto_61367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61369 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61369 ?auto_61368 )
      ( MAKE-5PILE ?auto_61364 ?auto_61365 ?auto_61366 ?auto_61367 ?auto_61368 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61370 - BLOCK
      ?auto_61371 - BLOCK
      ?auto_61372 - BLOCK
      ?auto_61373 - BLOCK
      ?auto_61374 - BLOCK
    )
    :vars
    (
      ?auto_61375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61370 ) ( ON ?auto_61371 ?auto_61370 ) ( not ( = ?auto_61370 ?auto_61371 ) ) ( not ( = ?auto_61370 ?auto_61372 ) ) ( not ( = ?auto_61370 ?auto_61373 ) ) ( not ( = ?auto_61370 ?auto_61374 ) ) ( not ( = ?auto_61371 ?auto_61372 ) ) ( not ( = ?auto_61371 ?auto_61373 ) ) ( not ( = ?auto_61371 ?auto_61374 ) ) ( not ( = ?auto_61372 ?auto_61373 ) ) ( not ( = ?auto_61372 ?auto_61374 ) ) ( not ( = ?auto_61373 ?auto_61374 ) ) ( ON ?auto_61374 ?auto_61375 ) ( not ( = ?auto_61370 ?auto_61375 ) ) ( not ( = ?auto_61371 ?auto_61375 ) ) ( not ( = ?auto_61372 ?auto_61375 ) ) ( not ( = ?auto_61373 ?auto_61375 ) ) ( not ( = ?auto_61374 ?auto_61375 ) ) ( ON ?auto_61373 ?auto_61374 ) ( CLEAR ?auto_61373 ) ( ON-TABLE ?auto_61375 ) ( HOLDING ?auto_61372 ) ( CLEAR ?auto_61371 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61370 ?auto_61371 ?auto_61372 )
      ( MAKE-5PILE ?auto_61370 ?auto_61371 ?auto_61372 ?auto_61373 ?auto_61374 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61376 - BLOCK
      ?auto_61377 - BLOCK
      ?auto_61378 - BLOCK
      ?auto_61379 - BLOCK
      ?auto_61380 - BLOCK
    )
    :vars
    (
      ?auto_61381 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61376 ) ( ON ?auto_61377 ?auto_61376 ) ( not ( = ?auto_61376 ?auto_61377 ) ) ( not ( = ?auto_61376 ?auto_61378 ) ) ( not ( = ?auto_61376 ?auto_61379 ) ) ( not ( = ?auto_61376 ?auto_61380 ) ) ( not ( = ?auto_61377 ?auto_61378 ) ) ( not ( = ?auto_61377 ?auto_61379 ) ) ( not ( = ?auto_61377 ?auto_61380 ) ) ( not ( = ?auto_61378 ?auto_61379 ) ) ( not ( = ?auto_61378 ?auto_61380 ) ) ( not ( = ?auto_61379 ?auto_61380 ) ) ( ON ?auto_61380 ?auto_61381 ) ( not ( = ?auto_61376 ?auto_61381 ) ) ( not ( = ?auto_61377 ?auto_61381 ) ) ( not ( = ?auto_61378 ?auto_61381 ) ) ( not ( = ?auto_61379 ?auto_61381 ) ) ( not ( = ?auto_61380 ?auto_61381 ) ) ( ON ?auto_61379 ?auto_61380 ) ( ON-TABLE ?auto_61381 ) ( CLEAR ?auto_61377 ) ( ON ?auto_61378 ?auto_61379 ) ( CLEAR ?auto_61378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61381 ?auto_61380 ?auto_61379 )
      ( MAKE-5PILE ?auto_61376 ?auto_61377 ?auto_61378 ?auto_61379 ?auto_61380 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61382 - BLOCK
      ?auto_61383 - BLOCK
      ?auto_61384 - BLOCK
      ?auto_61385 - BLOCK
      ?auto_61386 - BLOCK
    )
    :vars
    (
      ?auto_61387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61382 ) ( not ( = ?auto_61382 ?auto_61383 ) ) ( not ( = ?auto_61382 ?auto_61384 ) ) ( not ( = ?auto_61382 ?auto_61385 ) ) ( not ( = ?auto_61382 ?auto_61386 ) ) ( not ( = ?auto_61383 ?auto_61384 ) ) ( not ( = ?auto_61383 ?auto_61385 ) ) ( not ( = ?auto_61383 ?auto_61386 ) ) ( not ( = ?auto_61384 ?auto_61385 ) ) ( not ( = ?auto_61384 ?auto_61386 ) ) ( not ( = ?auto_61385 ?auto_61386 ) ) ( ON ?auto_61386 ?auto_61387 ) ( not ( = ?auto_61382 ?auto_61387 ) ) ( not ( = ?auto_61383 ?auto_61387 ) ) ( not ( = ?auto_61384 ?auto_61387 ) ) ( not ( = ?auto_61385 ?auto_61387 ) ) ( not ( = ?auto_61386 ?auto_61387 ) ) ( ON ?auto_61385 ?auto_61386 ) ( ON-TABLE ?auto_61387 ) ( ON ?auto_61384 ?auto_61385 ) ( CLEAR ?auto_61384 ) ( HOLDING ?auto_61383 ) ( CLEAR ?auto_61382 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61382 ?auto_61383 )
      ( MAKE-5PILE ?auto_61382 ?auto_61383 ?auto_61384 ?auto_61385 ?auto_61386 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61388 - BLOCK
      ?auto_61389 - BLOCK
      ?auto_61390 - BLOCK
      ?auto_61391 - BLOCK
      ?auto_61392 - BLOCK
    )
    :vars
    (
      ?auto_61393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61388 ) ( not ( = ?auto_61388 ?auto_61389 ) ) ( not ( = ?auto_61388 ?auto_61390 ) ) ( not ( = ?auto_61388 ?auto_61391 ) ) ( not ( = ?auto_61388 ?auto_61392 ) ) ( not ( = ?auto_61389 ?auto_61390 ) ) ( not ( = ?auto_61389 ?auto_61391 ) ) ( not ( = ?auto_61389 ?auto_61392 ) ) ( not ( = ?auto_61390 ?auto_61391 ) ) ( not ( = ?auto_61390 ?auto_61392 ) ) ( not ( = ?auto_61391 ?auto_61392 ) ) ( ON ?auto_61392 ?auto_61393 ) ( not ( = ?auto_61388 ?auto_61393 ) ) ( not ( = ?auto_61389 ?auto_61393 ) ) ( not ( = ?auto_61390 ?auto_61393 ) ) ( not ( = ?auto_61391 ?auto_61393 ) ) ( not ( = ?auto_61392 ?auto_61393 ) ) ( ON ?auto_61391 ?auto_61392 ) ( ON-TABLE ?auto_61393 ) ( ON ?auto_61390 ?auto_61391 ) ( CLEAR ?auto_61388 ) ( ON ?auto_61389 ?auto_61390 ) ( CLEAR ?auto_61389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61393 ?auto_61392 ?auto_61391 ?auto_61390 )
      ( MAKE-5PILE ?auto_61388 ?auto_61389 ?auto_61390 ?auto_61391 ?auto_61392 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61394 - BLOCK
      ?auto_61395 - BLOCK
      ?auto_61396 - BLOCK
      ?auto_61397 - BLOCK
      ?auto_61398 - BLOCK
    )
    :vars
    (
      ?auto_61399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61394 ?auto_61395 ) ) ( not ( = ?auto_61394 ?auto_61396 ) ) ( not ( = ?auto_61394 ?auto_61397 ) ) ( not ( = ?auto_61394 ?auto_61398 ) ) ( not ( = ?auto_61395 ?auto_61396 ) ) ( not ( = ?auto_61395 ?auto_61397 ) ) ( not ( = ?auto_61395 ?auto_61398 ) ) ( not ( = ?auto_61396 ?auto_61397 ) ) ( not ( = ?auto_61396 ?auto_61398 ) ) ( not ( = ?auto_61397 ?auto_61398 ) ) ( ON ?auto_61398 ?auto_61399 ) ( not ( = ?auto_61394 ?auto_61399 ) ) ( not ( = ?auto_61395 ?auto_61399 ) ) ( not ( = ?auto_61396 ?auto_61399 ) ) ( not ( = ?auto_61397 ?auto_61399 ) ) ( not ( = ?auto_61398 ?auto_61399 ) ) ( ON ?auto_61397 ?auto_61398 ) ( ON-TABLE ?auto_61399 ) ( ON ?auto_61396 ?auto_61397 ) ( ON ?auto_61395 ?auto_61396 ) ( CLEAR ?auto_61395 ) ( HOLDING ?auto_61394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61394 )
      ( MAKE-5PILE ?auto_61394 ?auto_61395 ?auto_61396 ?auto_61397 ?auto_61398 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61400 - BLOCK
      ?auto_61401 - BLOCK
      ?auto_61402 - BLOCK
      ?auto_61403 - BLOCK
      ?auto_61404 - BLOCK
    )
    :vars
    (
      ?auto_61405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61400 ?auto_61401 ) ) ( not ( = ?auto_61400 ?auto_61402 ) ) ( not ( = ?auto_61400 ?auto_61403 ) ) ( not ( = ?auto_61400 ?auto_61404 ) ) ( not ( = ?auto_61401 ?auto_61402 ) ) ( not ( = ?auto_61401 ?auto_61403 ) ) ( not ( = ?auto_61401 ?auto_61404 ) ) ( not ( = ?auto_61402 ?auto_61403 ) ) ( not ( = ?auto_61402 ?auto_61404 ) ) ( not ( = ?auto_61403 ?auto_61404 ) ) ( ON ?auto_61404 ?auto_61405 ) ( not ( = ?auto_61400 ?auto_61405 ) ) ( not ( = ?auto_61401 ?auto_61405 ) ) ( not ( = ?auto_61402 ?auto_61405 ) ) ( not ( = ?auto_61403 ?auto_61405 ) ) ( not ( = ?auto_61404 ?auto_61405 ) ) ( ON ?auto_61403 ?auto_61404 ) ( ON-TABLE ?auto_61405 ) ( ON ?auto_61402 ?auto_61403 ) ( ON ?auto_61401 ?auto_61402 ) ( ON ?auto_61400 ?auto_61401 ) ( CLEAR ?auto_61400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61405 ?auto_61404 ?auto_61403 ?auto_61402 ?auto_61401 )
      ( MAKE-5PILE ?auto_61400 ?auto_61401 ?auto_61402 ?auto_61403 ?auto_61404 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61411 - BLOCK
      ?auto_61412 - BLOCK
      ?auto_61413 - BLOCK
      ?auto_61414 - BLOCK
      ?auto_61415 - BLOCK
    )
    :vars
    (
      ?auto_61416 - BLOCK
      ?auto_61417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61411 ?auto_61412 ) ) ( not ( = ?auto_61411 ?auto_61413 ) ) ( not ( = ?auto_61411 ?auto_61414 ) ) ( not ( = ?auto_61411 ?auto_61415 ) ) ( not ( = ?auto_61412 ?auto_61413 ) ) ( not ( = ?auto_61412 ?auto_61414 ) ) ( not ( = ?auto_61412 ?auto_61415 ) ) ( not ( = ?auto_61413 ?auto_61414 ) ) ( not ( = ?auto_61413 ?auto_61415 ) ) ( not ( = ?auto_61414 ?auto_61415 ) ) ( ON ?auto_61415 ?auto_61416 ) ( not ( = ?auto_61411 ?auto_61416 ) ) ( not ( = ?auto_61412 ?auto_61416 ) ) ( not ( = ?auto_61413 ?auto_61416 ) ) ( not ( = ?auto_61414 ?auto_61416 ) ) ( not ( = ?auto_61415 ?auto_61416 ) ) ( ON ?auto_61414 ?auto_61415 ) ( ON-TABLE ?auto_61416 ) ( ON ?auto_61413 ?auto_61414 ) ( ON ?auto_61412 ?auto_61413 ) ( CLEAR ?auto_61412 ) ( ON ?auto_61411 ?auto_61417 ) ( CLEAR ?auto_61411 ) ( HAND-EMPTY ) ( not ( = ?auto_61411 ?auto_61417 ) ) ( not ( = ?auto_61412 ?auto_61417 ) ) ( not ( = ?auto_61413 ?auto_61417 ) ) ( not ( = ?auto_61414 ?auto_61417 ) ) ( not ( = ?auto_61415 ?auto_61417 ) ) ( not ( = ?auto_61416 ?auto_61417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61411 ?auto_61417 )
      ( MAKE-5PILE ?auto_61411 ?auto_61412 ?auto_61413 ?auto_61414 ?auto_61415 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61418 - BLOCK
      ?auto_61419 - BLOCK
      ?auto_61420 - BLOCK
      ?auto_61421 - BLOCK
      ?auto_61422 - BLOCK
    )
    :vars
    (
      ?auto_61424 - BLOCK
      ?auto_61423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61418 ?auto_61419 ) ) ( not ( = ?auto_61418 ?auto_61420 ) ) ( not ( = ?auto_61418 ?auto_61421 ) ) ( not ( = ?auto_61418 ?auto_61422 ) ) ( not ( = ?auto_61419 ?auto_61420 ) ) ( not ( = ?auto_61419 ?auto_61421 ) ) ( not ( = ?auto_61419 ?auto_61422 ) ) ( not ( = ?auto_61420 ?auto_61421 ) ) ( not ( = ?auto_61420 ?auto_61422 ) ) ( not ( = ?auto_61421 ?auto_61422 ) ) ( ON ?auto_61422 ?auto_61424 ) ( not ( = ?auto_61418 ?auto_61424 ) ) ( not ( = ?auto_61419 ?auto_61424 ) ) ( not ( = ?auto_61420 ?auto_61424 ) ) ( not ( = ?auto_61421 ?auto_61424 ) ) ( not ( = ?auto_61422 ?auto_61424 ) ) ( ON ?auto_61421 ?auto_61422 ) ( ON-TABLE ?auto_61424 ) ( ON ?auto_61420 ?auto_61421 ) ( ON ?auto_61418 ?auto_61423 ) ( CLEAR ?auto_61418 ) ( not ( = ?auto_61418 ?auto_61423 ) ) ( not ( = ?auto_61419 ?auto_61423 ) ) ( not ( = ?auto_61420 ?auto_61423 ) ) ( not ( = ?auto_61421 ?auto_61423 ) ) ( not ( = ?auto_61422 ?auto_61423 ) ) ( not ( = ?auto_61424 ?auto_61423 ) ) ( HOLDING ?auto_61419 ) ( CLEAR ?auto_61420 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61424 ?auto_61422 ?auto_61421 ?auto_61420 ?auto_61419 )
      ( MAKE-5PILE ?auto_61418 ?auto_61419 ?auto_61420 ?auto_61421 ?auto_61422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61425 - BLOCK
      ?auto_61426 - BLOCK
      ?auto_61427 - BLOCK
      ?auto_61428 - BLOCK
      ?auto_61429 - BLOCK
    )
    :vars
    (
      ?auto_61430 - BLOCK
      ?auto_61431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61425 ?auto_61426 ) ) ( not ( = ?auto_61425 ?auto_61427 ) ) ( not ( = ?auto_61425 ?auto_61428 ) ) ( not ( = ?auto_61425 ?auto_61429 ) ) ( not ( = ?auto_61426 ?auto_61427 ) ) ( not ( = ?auto_61426 ?auto_61428 ) ) ( not ( = ?auto_61426 ?auto_61429 ) ) ( not ( = ?auto_61427 ?auto_61428 ) ) ( not ( = ?auto_61427 ?auto_61429 ) ) ( not ( = ?auto_61428 ?auto_61429 ) ) ( ON ?auto_61429 ?auto_61430 ) ( not ( = ?auto_61425 ?auto_61430 ) ) ( not ( = ?auto_61426 ?auto_61430 ) ) ( not ( = ?auto_61427 ?auto_61430 ) ) ( not ( = ?auto_61428 ?auto_61430 ) ) ( not ( = ?auto_61429 ?auto_61430 ) ) ( ON ?auto_61428 ?auto_61429 ) ( ON-TABLE ?auto_61430 ) ( ON ?auto_61427 ?auto_61428 ) ( ON ?auto_61425 ?auto_61431 ) ( not ( = ?auto_61425 ?auto_61431 ) ) ( not ( = ?auto_61426 ?auto_61431 ) ) ( not ( = ?auto_61427 ?auto_61431 ) ) ( not ( = ?auto_61428 ?auto_61431 ) ) ( not ( = ?auto_61429 ?auto_61431 ) ) ( not ( = ?auto_61430 ?auto_61431 ) ) ( CLEAR ?auto_61427 ) ( ON ?auto_61426 ?auto_61425 ) ( CLEAR ?auto_61426 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61431 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61431 ?auto_61425 )
      ( MAKE-5PILE ?auto_61425 ?auto_61426 ?auto_61427 ?auto_61428 ?auto_61429 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61432 - BLOCK
      ?auto_61433 - BLOCK
      ?auto_61434 - BLOCK
      ?auto_61435 - BLOCK
      ?auto_61436 - BLOCK
    )
    :vars
    (
      ?auto_61438 - BLOCK
      ?auto_61437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61432 ?auto_61433 ) ) ( not ( = ?auto_61432 ?auto_61434 ) ) ( not ( = ?auto_61432 ?auto_61435 ) ) ( not ( = ?auto_61432 ?auto_61436 ) ) ( not ( = ?auto_61433 ?auto_61434 ) ) ( not ( = ?auto_61433 ?auto_61435 ) ) ( not ( = ?auto_61433 ?auto_61436 ) ) ( not ( = ?auto_61434 ?auto_61435 ) ) ( not ( = ?auto_61434 ?auto_61436 ) ) ( not ( = ?auto_61435 ?auto_61436 ) ) ( ON ?auto_61436 ?auto_61438 ) ( not ( = ?auto_61432 ?auto_61438 ) ) ( not ( = ?auto_61433 ?auto_61438 ) ) ( not ( = ?auto_61434 ?auto_61438 ) ) ( not ( = ?auto_61435 ?auto_61438 ) ) ( not ( = ?auto_61436 ?auto_61438 ) ) ( ON ?auto_61435 ?auto_61436 ) ( ON-TABLE ?auto_61438 ) ( ON ?auto_61432 ?auto_61437 ) ( not ( = ?auto_61432 ?auto_61437 ) ) ( not ( = ?auto_61433 ?auto_61437 ) ) ( not ( = ?auto_61434 ?auto_61437 ) ) ( not ( = ?auto_61435 ?auto_61437 ) ) ( not ( = ?auto_61436 ?auto_61437 ) ) ( not ( = ?auto_61438 ?auto_61437 ) ) ( ON ?auto_61433 ?auto_61432 ) ( CLEAR ?auto_61433 ) ( ON-TABLE ?auto_61437 ) ( HOLDING ?auto_61434 ) ( CLEAR ?auto_61435 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61438 ?auto_61436 ?auto_61435 ?auto_61434 )
      ( MAKE-5PILE ?auto_61432 ?auto_61433 ?auto_61434 ?auto_61435 ?auto_61436 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61439 - BLOCK
      ?auto_61440 - BLOCK
      ?auto_61441 - BLOCK
      ?auto_61442 - BLOCK
      ?auto_61443 - BLOCK
    )
    :vars
    (
      ?auto_61444 - BLOCK
      ?auto_61445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61439 ?auto_61440 ) ) ( not ( = ?auto_61439 ?auto_61441 ) ) ( not ( = ?auto_61439 ?auto_61442 ) ) ( not ( = ?auto_61439 ?auto_61443 ) ) ( not ( = ?auto_61440 ?auto_61441 ) ) ( not ( = ?auto_61440 ?auto_61442 ) ) ( not ( = ?auto_61440 ?auto_61443 ) ) ( not ( = ?auto_61441 ?auto_61442 ) ) ( not ( = ?auto_61441 ?auto_61443 ) ) ( not ( = ?auto_61442 ?auto_61443 ) ) ( ON ?auto_61443 ?auto_61444 ) ( not ( = ?auto_61439 ?auto_61444 ) ) ( not ( = ?auto_61440 ?auto_61444 ) ) ( not ( = ?auto_61441 ?auto_61444 ) ) ( not ( = ?auto_61442 ?auto_61444 ) ) ( not ( = ?auto_61443 ?auto_61444 ) ) ( ON ?auto_61442 ?auto_61443 ) ( ON-TABLE ?auto_61444 ) ( ON ?auto_61439 ?auto_61445 ) ( not ( = ?auto_61439 ?auto_61445 ) ) ( not ( = ?auto_61440 ?auto_61445 ) ) ( not ( = ?auto_61441 ?auto_61445 ) ) ( not ( = ?auto_61442 ?auto_61445 ) ) ( not ( = ?auto_61443 ?auto_61445 ) ) ( not ( = ?auto_61444 ?auto_61445 ) ) ( ON ?auto_61440 ?auto_61439 ) ( ON-TABLE ?auto_61445 ) ( CLEAR ?auto_61442 ) ( ON ?auto_61441 ?auto_61440 ) ( CLEAR ?auto_61441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61445 ?auto_61439 ?auto_61440 )
      ( MAKE-5PILE ?auto_61439 ?auto_61440 ?auto_61441 ?auto_61442 ?auto_61443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61446 - BLOCK
      ?auto_61447 - BLOCK
      ?auto_61448 - BLOCK
      ?auto_61449 - BLOCK
      ?auto_61450 - BLOCK
    )
    :vars
    (
      ?auto_61452 - BLOCK
      ?auto_61451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61446 ?auto_61447 ) ) ( not ( = ?auto_61446 ?auto_61448 ) ) ( not ( = ?auto_61446 ?auto_61449 ) ) ( not ( = ?auto_61446 ?auto_61450 ) ) ( not ( = ?auto_61447 ?auto_61448 ) ) ( not ( = ?auto_61447 ?auto_61449 ) ) ( not ( = ?auto_61447 ?auto_61450 ) ) ( not ( = ?auto_61448 ?auto_61449 ) ) ( not ( = ?auto_61448 ?auto_61450 ) ) ( not ( = ?auto_61449 ?auto_61450 ) ) ( ON ?auto_61450 ?auto_61452 ) ( not ( = ?auto_61446 ?auto_61452 ) ) ( not ( = ?auto_61447 ?auto_61452 ) ) ( not ( = ?auto_61448 ?auto_61452 ) ) ( not ( = ?auto_61449 ?auto_61452 ) ) ( not ( = ?auto_61450 ?auto_61452 ) ) ( ON-TABLE ?auto_61452 ) ( ON ?auto_61446 ?auto_61451 ) ( not ( = ?auto_61446 ?auto_61451 ) ) ( not ( = ?auto_61447 ?auto_61451 ) ) ( not ( = ?auto_61448 ?auto_61451 ) ) ( not ( = ?auto_61449 ?auto_61451 ) ) ( not ( = ?auto_61450 ?auto_61451 ) ) ( not ( = ?auto_61452 ?auto_61451 ) ) ( ON ?auto_61447 ?auto_61446 ) ( ON-TABLE ?auto_61451 ) ( ON ?auto_61448 ?auto_61447 ) ( CLEAR ?auto_61448 ) ( HOLDING ?auto_61449 ) ( CLEAR ?auto_61450 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61452 ?auto_61450 ?auto_61449 )
      ( MAKE-5PILE ?auto_61446 ?auto_61447 ?auto_61448 ?auto_61449 ?auto_61450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61453 - BLOCK
      ?auto_61454 - BLOCK
      ?auto_61455 - BLOCK
      ?auto_61456 - BLOCK
      ?auto_61457 - BLOCK
    )
    :vars
    (
      ?auto_61459 - BLOCK
      ?auto_61458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61453 ?auto_61454 ) ) ( not ( = ?auto_61453 ?auto_61455 ) ) ( not ( = ?auto_61453 ?auto_61456 ) ) ( not ( = ?auto_61453 ?auto_61457 ) ) ( not ( = ?auto_61454 ?auto_61455 ) ) ( not ( = ?auto_61454 ?auto_61456 ) ) ( not ( = ?auto_61454 ?auto_61457 ) ) ( not ( = ?auto_61455 ?auto_61456 ) ) ( not ( = ?auto_61455 ?auto_61457 ) ) ( not ( = ?auto_61456 ?auto_61457 ) ) ( ON ?auto_61457 ?auto_61459 ) ( not ( = ?auto_61453 ?auto_61459 ) ) ( not ( = ?auto_61454 ?auto_61459 ) ) ( not ( = ?auto_61455 ?auto_61459 ) ) ( not ( = ?auto_61456 ?auto_61459 ) ) ( not ( = ?auto_61457 ?auto_61459 ) ) ( ON-TABLE ?auto_61459 ) ( ON ?auto_61453 ?auto_61458 ) ( not ( = ?auto_61453 ?auto_61458 ) ) ( not ( = ?auto_61454 ?auto_61458 ) ) ( not ( = ?auto_61455 ?auto_61458 ) ) ( not ( = ?auto_61456 ?auto_61458 ) ) ( not ( = ?auto_61457 ?auto_61458 ) ) ( not ( = ?auto_61459 ?auto_61458 ) ) ( ON ?auto_61454 ?auto_61453 ) ( ON-TABLE ?auto_61458 ) ( ON ?auto_61455 ?auto_61454 ) ( CLEAR ?auto_61457 ) ( ON ?auto_61456 ?auto_61455 ) ( CLEAR ?auto_61456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61458 ?auto_61453 ?auto_61454 ?auto_61455 )
      ( MAKE-5PILE ?auto_61453 ?auto_61454 ?auto_61455 ?auto_61456 ?auto_61457 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61460 - BLOCK
      ?auto_61461 - BLOCK
      ?auto_61462 - BLOCK
      ?auto_61463 - BLOCK
      ?auto_61464 - BLOCK
    )
    :vars
    (
      ?auto_61466 - BLOCK
      ?auto_61465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61460 ?auto_61461 ) ) ( not ( = ?auto_61460 ?auto_61462 ) ) ( not ( = ?auto_61460 ?auto_61463 ) ) ( not ( = ?auto_61460 ?auto_61464 ) ) ( not ( = ?auto_61461 ?auto_61462 ) ) ( not ( = ?auto_61461 ?auto_61463 ) ) ( not ( = ?auto_61461 ?auto_61464 ) ) ( not ( = ?auto_61462 ?auto_61463 ) ) ( not ( = ?auto_61462 ?auto_61464 ) ) ( not ( = ?auto_61463 ?auto_61464 ) ) ( not ( = ?auto_61460 ?auto_61466 ) ) ( not ( = ?auto_61461 ?auto_61466 ) ) ( not ( = ?auto_61462 ?auto_61466 ) ) ( not ( = ?auto_61463 ?auto_61466 ) ) ( not ( = ?auto_61464 ?auto_61466 ) ) ( ON-TABLE ?auto_61466 ) ( ON ?auto_61460 ?auto_61465 ) ( not ( = ?auto_61460 ?auto_61465 ) ) ( not ( = ?auto_61461 ?auto_61465 ) ) ( not ( = ?auto_61462 ?auto_61465 ) ) ( not ( = ?auto_61463 ?auto_61465 ) ) ( not ( = ?auto_61464 ?auto_61465 ) ) ( not ( = ?auto_61466 ?auto_61465 ) ) ( ON ?auto_61461 ?auto_61460 ) ( ON-TABLE ?auto_61465 ) ( ON ?auto_61462 ?auto_61461 ) ( ON ?auto_61463 ?auto_61462 ) ( CLEAR ?auto_61463 ) ( HOLDING ?auto_61464 ) ( CLEAR ?auto_61466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61466 ?auto_61464 )
      ( MAKE-5PILE ?auto_61460 ?auto_61461 ?auto_61462 ?auto_61463 ?auto_61464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61467 - BLOCK
      ?auto_61468 - BLOCK
      ?auto_61469 - BLOCK
      ?auto_61470 - BLOCK
      ?auto_61471 - BLOCK
    )
    :vars
    (
      ?auto_61472 - BLOCK
      ?auto_61473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61467 ?auto_61468 ) ) ( not ( = ?auto_61467 ?auto_61469 ) ) ( not ( = ?auto_61467 ?auto_61470 ) ) ( not ( = ?auto_61467 ?auto_61471 ) ) ( not ( = ?auto_61468 ?auto_61469 ) ) ( not ( = ?auto_61468 ?auto_61470 ) ) ( not ( = ?auto_61468 ?auto_61471 ) ) ( not ( = ?auto_61469 ?auto_61470 ) ) ( not ( = ?auto_61469 ?auto_61471 ) ) ( not ( = ?auto_61470 ?auto_61471 ) ) ( not ( = ?auto_61467 ?auto_61472 ) ) ( not ( = ?auto_61468 ?auto_61472 ) ) ( not ( = ?auto_61469 ?auto_61472 ) ) ( not ( = ?auto_61470 ?auto_61472 ) ) ( not ( = ?auto_61471 ?auto_61472 ) ) ( ON-TABLE ?auto_61472 ) ( ON ?auto_61467 ?auto_61473 ) ( not ( = ?auto_61467 ?auto_61473 ) ) ( not ( = ?auto_61468 ?auto_61473 ) ) ( not ( = ?auto_61469 ?auto_61473 ) ) ( not ( = ?auto_61470 ?auto_61473 ) ) ( not ( = ?auto_61471 ?auto_61473 ) ) ( not ( = ?auto_61472 ?auto_61473 ) ) ( ON ?auto_61468 ?auto_61467 ) ( ON-TABLE ?auto_61473 ) ( ON ?auto_61469 ?auto_61468 ) ( ON ?auto_61470 ?auto_61469 ) ( CLEAR ?auto_61472 ) ( ON ?auto_61471 ?auto_61470 ) ( CLEAR ?auto_61471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61473 ?auto_61467 ?auto_61468 ?auto_61469 ?auto_61470 )
      ( MAKE-5PILE ?auto_61467 ?auto_61468 ?auto_61469 ?auto_61470 ?auto_61471 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61474 - BLOCK
      ?auto_61475 - BLOCK
      ?auto_61476 - BLOCK
      ?auto_61477 - BLOCK
      ?auto_61478 - BLOCK
    )
    :vars
    (
      ?auto_61479 - BLOCK
      ?auto_61480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61474 ?auto_61475 ) ) ( not ( = ?auto_61474 ?auto_61476 ) ) ( not ( = ?auto_61474 ?auto_61477 ) ) ( not ( = ?auto_61474 ?auto_61478 ) ) ( not ( = ?auto_61475 ?auto_61476 ) ) ( not ( = ?auto_61475 ?auto_61477 ) ) ( not ( = ?auto_61475 ?auto_61478 ) ) ( not ( = ?auto_61476 ?auto_61477 ) ) ( not ( = ?auto_61476 ?auto_61478 ) ) ( not ( = ?auto_61477 ?auto_61478 ) ) ( not ( = ?auto_61474 ?auto_61479 ) ) ( not ( = ?auto_61475 ?auto_61479 ) ) ( not ( = ?auto_61476 ?auto_61479 ) ) ( not ( = ?auto_61477 ?auto_61479 ) ) ( not ( = ?auto_61478 ?auto_61479 ) ) ( ON ?auto_61474 ?auto_61480 ) ( not ( = ?auto_61474 ?auto_61480 ) ) ( not ( = ?auto_61475 ?auto_61480 ) ) ( not ( = ?auto_61476 ?auto_61480 ) ) ( not ( = ?auto_61477 ?auto_61480 ) ) ( not ( = ?auto_61478 ?auto_61480 ) ) ( not ( = ?auto_61479 ?auto_61480 ) ) ( ON ?auto_61475 ?auto_61474 ) ( ON-TABLE ?auto_61480 ) ( ON ?auto_61476 ?auto_61475 ) ( ON ?auto_61477 ?auto_61476 ) ( ON ?auto_61478 ?auto_61477 ) ( CLEAR ?auto_61478 ) ( HOLDING ?auto_61479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61479 )
      ( MAKE-5PILE ?auto_61474 ?auto_61475 ?auto_61476 ?auto_61477 ?auto_61478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_61481 - BLOCK
      ?auto_61482 - BLOCK
      ?auto_61483 - BLOCK
      ?auto_61484 - BLOCK
      ?auto_61485 - BLOCK
    )
    :vars
    (
      ?auto_61486 - BLOCK
      ?auto_61487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61481 ?auto_61482 ) ) ( not ( = ?auto_61481 ?auto_61483 ) ) ( not ( = ?auto_61481 ?auto_61484 ) ) ( not ( = ?auto_61481 ?auto_61485 ) ) ( not ( = ?auto_61482 ?auto_61483 ) ) ( not ( = ?auto_61482 ?auto_61484 ) ) ( not ( = ?auto_61482 ?auto_61485 ) ) ( not ( = ?auto_61483 ?auto_61484 ) ) ( not ( = ?auto_61483 ?auto_61485 ) ) ( not ( = ?auto_61484 ?auto_61485 ) ) ( not ( = ?auto_61481 ?auto_61486 ) ) ( not ( = ?auto_61482 ?auto_61486 ) ) ( not ( = ?auto_61483 ?auto_61486 ) ) ( not ( = ?auto_61484 ?auto_61486 ) ) ( not ( = ?auto_61485 ?auto_61486 ) ) ( ON ?auto_61481 ?auto_61487 ) ( not ( = ?auto_61481 ?auto_61487 ) ) ( not ( = ?auto_61482 ?auto_61487 ) ) ( not ( = ?auto_61483 ?auto_61487 ) ) ( not ( = ?auto_61484 ?auto_61487 ) ) ( not ( = ?auto_61485 ?auto_61487 ) ) ( not ( = ?auto_61486 ?auto_61487 ) ) ( ON ?auto_61482 ?auto_61481 ) ( ON-TABLE ?auto_61487 ) ( ON ?auto_61483 ?auto_61482 ) ( ON ?auto_61484 ?auto_61483 ) ( ON ?auto_61485 ?auto_61484 ) ( ON ?auto_61486 ?auto_61485 ) ( CLEAR ?auto_61486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61487 ?auto_61481 ?auto_61482 ?auto_61483 ?auto_61484 ?auto_61485 )
      ( MAKE-5PILE ?auto_61481 ?auto_61482 ?auto_61483 ?auto_61484 ?auto_61485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61500 - BLOCK
      ?auto_61501 - BLOCK
      ?auto_61502 - BLOCK
      ?auto_61503 - BLOCK
      ?auto_61504 - BLOCK
      ?auto_61505 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_61504 ) ( ON-TABLE ?auto_61500 ) ( ON ?auto_61501 ?auto_61500 ) ( ON ?auto_61502 ?auto_61501 ) ( ON ?auto_61503 ?auto_61502 ) ( ON ?auto_61504 ?auto_61503 ) ( not ( = ?auto_61500 ?auto_61501 ) ) ( not ( = ?auto_61500 ?auto_61502 ) ) ( not ( = ?auto_61500 ?auto_61503 ) ) ( not ( = ?auto_61500 ?auto_61504 ) ) ( not ( = ?auto_61500 ?auto_61505 ) ) ( not ( = ?auto_61501 ?auto_61502 ) ) ( not ( = ?auto_61501 ?auto_61503 ) ) ( not ( = ?auto_61501 ?auto_61504 ) ) ( not ( = ?auto_61501 ?auto_61505 ) ) ( not ( = ?auto_61502 ?auto_61503 ) ) ( not ( = ?auto_61502 ?auto_61504 ) ) ( not ( = ?auto_61502 ?auto_61505 ) ) ( not ( = ?auto_61503 ?auto_61504 ) ) ( not ( = ?auto_61503 ?auto_61505 ) ) ( not ( = ?auto_61504 ?auto_61505 ) ) ( ON-TABLE ?auto_61505 ) ( CLEAR ?auto_61505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_61505 )
      ( MAKE-6PILE ?auto_61500 ?auto_61501 ?auto_61502 ?auto_61503 ?auto_61504 ?auto_61505 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61506 - BLOCK
      ?auto_61507 - BLOCK
      ?auto_61508 - BLOCK
      ?auto_61509 - BLOCK
      ?auto_61510 - BLOCK
      ?auto_61511 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61506 ) ( ON ?auto_61507 ?auto_61506 ) ( ON ?auto_61508 ?auto_61507 ) ( ON ?auto_61509 ?auto_61508 ) ( not ( = ?auto_61506 ?auto_61507 ) ) ( not ( = ?auto_61506 ?auto_61508 ) ) ( not ( = ?auto_61506 ?auto_61509 ) ) ( not ( = ?auto_61506 ?auto_61510 ) ) ( not ( = ?auto_61506 ?auto_61511 ) ) ( not ( = ?auto_61507 ?auto_61508 ) ) ( not ( = ?auto_61507 ?auto_61509 ) ) ( not ( = ?auto_61507 ?auto_61510 ) ) ( not ( = ?auto_61507 ?auto_61511 ) ) ( not ( = ?auto_61508 ?auto_61509 ) ) ( not ( = ?auto_61508 ?auto_61510 ) ) ( not ( = ?auto_61508 ?auto_61511 ) ) ( not ( = ?auto_61509 ?auto_61510 ) ) ( not ( = ?auto_61509 ?auto_61511 ) ) ( not ( = ?auto_61510 ?auto_61511 ) ) ( ON-TABLE ?auto_61511 ) ( CLEAR ?auto_61511 ) ( HOLDING ?auto_61510 ) ( CLEAR ?auto_61509 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61506 ?auto_61507 ?auto_61508 ?auto_61509 ?auto_61510 )
      ( MAKE-6PILE ?auto_61506 ?auto_61507 ?auto_61508 ?auto_61509 ?auto_61510 ?auto_61511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61512 - BLOCK
      ?auto_61513 - BLOCK
      ?auto_61514 - BLOCK
      ?auto_61515 - BLOCK
      ?auto_61516 - BLOCK
      ?auto_61517 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61512 ) ( ON ?auto_61513 ?auto_61512 ) ( ON ?auto_61514 ?auto_61513 ) ( ON ?auto_61515 ?auto_61514 ) ( not ( = ?auto_61512 ?auto_61513 ) ) ( not ( = ?auto_61512 ?auto_61514 ) ) ( not ( = ?auto_61512 ?auto_61515 ) ) ( not ( = ?auto_61512 ?auto_61516 ) ) ( not ( = ?auto_61512 ?auto_61517 ) ) ( not ( = ?auto_61513 ?auto_61514 ) ) ( not ( = ?auto_61513 ?auto_61515 ) ) ( not ( = ?auto_61513 ?auto_61516 ) ) ( not ( = ?auto_61513 ?auto_61517 ) ) ( not ( = ?auto_61514 ?auto_61515 ) ) ( not ( = ?auto_61514 ?auto_61516 ) ) ( not ( = ?auto_61514 ?auto_61517 ) ) ( not ( = ?auto_61515 ?auto_61516 ) ) ( not ( = ?auto_61515 ?auto_61517 ) ) ( not ( = ?auto_61516 ?auto_61517 ) ) ( ON-TABLE ?auto_61517 ) ( CLEAR ?auto_61515 ) ( ON ?auto_61516 ?auto_61517 ) ( CLEAR ?auto_61516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61517 )
      ( MAKE-6PILE ?auto_61512 ?auto_61513 ?auto_61514 ?auto_61515 ?auto_61516 ?auto_61517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61518 - BLOCK
      ?auto_61519 - BLOCK
      ?auto_61520 - BLOCK
      ?auto_61521 - BLOCK
      ?auto_61522 - BLOCK
      ?auto_61523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61518 ) ( ON ?auto_61519 ?auto_61518 ) ( ON ?auto_61520 ?auto_61519 ) ( not ( = ?auto_61518 ?auto_61519 ) ) ( not ( = ?auto_61518 ?auto_61520 ) ) ( not ( = ?auto_61518 ?auto_61521 ) ) ( not ( = ?auto_61518 ?auto_61522 ) ) ( not ( = ?auto_61518 ?auto_61523 ) ) ( not ( = ?auto_61519 ?auto_61520 ) ) ( not ( = ?auto_61519 ?auto_61521 ) ) ( not ( = ?auto_61519 ?auto_61522 ) ) ( not ( = ?auto_61519 ?auto_61523 ) ) ( not ( = ?auto_61520 ?auto_61521 ) ) ( not ( = ?auto_61520 ?auto_61522 ) ) ( not ( = ?auto_61520 ?auto_61523 ) ) ( not ( = ?auto_61521 ?auto_61522 ) ) ( not ( = ?auto_61521 ?auto_61523 ) ) ( not ( = ?auto_61522 ?auto_61523 ) ) ( ON-TABLE ?auto_61523 ) ( ON ?auto_61522 ?auto_61523 ) ( CLEAR ?auto_61522 ) ( HOLDING ?auto_61521 ) ( CLEAR ?auto_61520 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61518 ?auto_61519 ?auto_61520 ?auto_61521 )
      ( MAKE-6PILE ?auto_61518 ?auto_61519 ?auto_61520 ?auto_61521 ?auto_61522 ?auto_61523 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61524 - BLOCK
      ?auto_61525 - BLOCK
      ?auto_61526 - BLOCK
      ?auto_61527 - BLOCK
      ?auto_61528 - BLOCK
      ?auto_61529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61524 ) ( ON ?auto_61525 ?auto_61524 ) ( ON ?auto_61526 ?auto_61525 ) ( not ( = ?auto_61524 ?auto_61525 ) ) ( not ( = ?auto_61524 ?auto_61526 ) ) ( not ( = ?auto_61524 ?auto_61527 ) ) ( not ( = ?auto_61524 ?auto_61528 ) ) ( not ( = ?auto_61524 ?auto_61529 ) ) ( not ( = ?auto_61525 ?auto_61526 ) ) ( not ( = ?auto_61525 ?auto_61527 ) ) ( not ( = ?auto_61525 ?auto_61528 ) ) ( not ( = ?auto_61525 ?auto_61529 ) ) ( not ( = ?auto_61526 ?auto_61527 ) ) ( not ( = ?auto_61526 ?auto_61528 ) ) ( not ( = ?auto_61526 ?auto_61529 ) ) ( not ( = ?auto_61527 ?auto_61528 ) ) ( not ( = ?auto_61527 ?auto_61529 ) ) ( not ( = ?auto_61528 ?auto_61529 ) ) ( ON-TABLE ?auto_61529 ) ( ON ?auto_61528 ?auto_61529 ) ( CLEAR ?auto_61526 ) ( ON ?auto_61527 ?auto_61528 ) ( CLEAR ?auto_61527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61529 ?auto_61528 )
      ( MAKE-6PILE ?auto_61524 ?auto_61525 ?auto_61526 ?auto_61527 ?auto_61528 ?auto_61529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61530 - BLOCK
      ?auto_61531 - BLOCK
      ?auto_61532 - BLOCK
      ?auto_61533 - BLOCK
      ?auto_61534 - BLOCK
      ?auto_61535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61530 ) ( ON ?auto_61531 ?auto_61530 ) ( not ( = ?auto_61530 ?auto_61531 ) ) ( not ( = ?auto_61530 ?auto_61532 ) ) ( not ( = ?auto_61530 ?auto_61533 ) ) ( not ( = ?auto_61530 ?auto_61534 ) ) ( not ( = ?auto_61530 ?auto_61535 ) ) ( not ( = ?auto_61531 ?auto_61532 ) ) ( not ( = ?auto_61531 ?auto_61533 ) ) ( not ( = ?auto_61531 ?auto_61534 ) ) ( not ( = ?auto_61531 ?auto_61535 ) ) ( not ( = ?auto_61532 ?auto_61533 ) ) ( not ( = ?auto_61532 ?auto_61534 ) ) ( not ( = ?auto_61532 ?auto_61535 ) ) ( not ( = ?auto_61533 ?auto_61534 ) ) ( not ( = ?auto_61533 ?auto_61535 ) ) ( not ( = ?auto_61534 ?auto_61535 ) ) ( ON-TABLE ?auto_61535 ) ( ON ?auto_61534 ?auto_61535 ) ( ON ?auto_61533 ?auto_61534 ) ( CLEAR ?auto_61533 ) ( HOLDING ?auto_61532 ) ( CLEAR ?auto_61531 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61530 ?auto_61531 ?auto_61532 )
      ( MAKE-6PILE ?auto_61530 ?auto_61531 ?auto_61532 ?auto_61533 ?auto_61534 ?auto_61535 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61536 - BLOCK
      ?auto_61537 - BLOCK
      ?auto_61538 - BLOCK
      ?auto_61539 - BLOCK
      ?auto_61540 - BLOCK
      ?auto_61541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61536 ) ( ON ?auto_61537 ?auto_61536 ) ( not ( = ?auto_61536 ?auto_61537 ) ) ( not ( = ?auto_61536 ?auto_61538 ) ) ( not ( = ?auto_61536 ?auto_61539 ) ) ( not ( = ?auto_61536 ?auto_61540 ) ) ( not ( = ?auto_61536 ?auto_61541 ) ) ( not ( = ?auto_61537 ?auto_61538 ) ) ( not ( = ?auto_61537 ?auto_61539 ) ) ( not ( = ?auto_61537 ?auto_61540 ) ) ( not ( = ?auto_61537 ?auto_61541 ) ) ( not ( = ?auto_61538 ?auto_61539 ) ) ( not ( = ?auto_61538 ?auto_61540 ) ) ( not ( = ?auto_61538 ?auto_61541 ) ) ( not ( = ?auto_61539 ?auto_61540 ) ) ( not ( = ?auto_61539 ?auto_61541 ) ) ( not ( = ?auto_61540 ?auto_61541 ) ) ( ON-TABLE ?auto_61541 ) ( ON ?auto_61540 ?auto_61541 ) ( ON ?auto_61539 ?auto_61540 ) ( CLEAR ?auto_61537 ) ( ON ?auto_61538 ?auto_61539 ) ( CLEAR ?auto_61538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61541 ?auto_61540 ?auto_61539 )
      ( MAKE-6PILE ?auto_61536 ?auto_61537 ?auto_61538 ?auto_61539 ?auto_61540 ?auto_61541 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61542 - BLOCK
      ?auto_61543 - BLOCK
      ?auto_61544 - BLOCK
      ?auto_61545 - BLOCK
      ?auto_61546 - BLOCK
      ?auto_61547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61542 ) ( not ( = ?auto_61542 ?auto_61543 ) ) ( not ( = ?auto_61542 ?auto_61544 ) ) ( not ( = ?auto_61542 ?auto_61545 ) ) ( not ( = ?auto_61542 ?auto_61546 ) ) ( not ( = ?auto_61542 ?auto_61547 ) ) ( not ( = ?auto_61543 ?auto_61544 ) ) ( not ( = ?auto_61543 ?auto_61545 ) ) ( not ( = ?auto_61543 ?auto_61546 ) ) ( not ( = ?auto_61543 ?auto_61547 ) ) ( not ( = ?auto_61544 ?auto_61545 ) ) ( not ( = ?auto_61544 ?auto_61546 ) ) ( not ( = ?auto_61544 ?auto_61547 ) ) ( not ( = ?auto_61545 ?auto_61546 ) ) ( not ( = ?auto_61545 ?auto_61547 ) ) ( not ( = ?auto_61546 ?auto_61547 ) ) ( ON-TABLE ?auto_61547 ) ( ON ?auto_61546 ?auto_61547 ) ( ON ?auto_61545 ?auto_61546 ) ( ON ?auto_61544 ?auto_61545 ) ( CLEAR ?auto_61544 ) ( HOLDING ?auto_61543 ) ( CLEAR ?auto_61542 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61542 ?auto_61543 )
      ( MAKE-6PILE ?auto_61542 ?auto_61543 ?auto_61544 ?auto_61545 ?auto_61546 ?auto_61547 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61548 - BLOCK
      ?auto_61549 - BLOCK
      ?auto_61550 - BLOCK
      ?auto_61551 - BLOCK
      ?auto_61552 - BLOCK
      ?auto_61553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_61548 ) ( not ( = ?auto_61548 ?auto_61549 ) ) ( not ( = ?auto_61548 ?auto_61550 ) ) ( not ( = ?auto_61548 ?auto_61551 ) ) ( not ( = ?auto_61548 ?auto_61552 ) ) ( not ( = ?auto_61548 ?auto_61553 ) ) ( not ( = ?auto_61549 ?auto_61550 ) ) ( not ( = ?auto_61549 ?auto_61551 ) ) ( not ( = ?auto_61549 ?auto_61552 ) ) ( not ( = ?auto_61549 ?auto_61553 ) ) ( not ( = ?auto_61550 ?auto_61551 ) ) ( not ( = ?auto_61550 ?auto_61552 ) ) ( not ( = ?auto_61550 ?auto_61553 ) ) ( not ( = ?auto_61551 ?auto_61552 ) ) ( not ( = ?auto_61551 ?auto_61553 ) ) ( not ( = ?auto_61552 ?auto_61553 ) ) ( ON-TABLE ?auto_61553 ) ( ON ?auto_61552 ?auto_61553 ) ( ON ?auto_61551 ?auto_61552 ) ( ON ?auto_61550 ?auto_61551 ) ( CLEAR ?auto_61548 ) ( ON ?auto_61549 ?auto_61550 ) ( CLEAR ?auto_61549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61553 ?auto_61552 ?auto_61551 ?auto_61550 )
      ( MAKE-6PILE ?auto_61548 ?auto_61549 ?auto_61550 ?auto_61551 ?auto_61552 ?auto_61553 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61554 - BLOCK
      ?auto_61555 - BLOCK
      ?auto_61556 - BLOCK
      ?auto_61557 - BLOCK
      ?auto_61558 - BLOCK
      ?auto_61559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61554 ?auto_61555 ) ) ( not ( = ?auto_61554 ?auto_61556 ) ) ( not ( = ?auto_61554 ?auto_61557 ) ) ( not ( = ?auto_61554 ?auto_61558 ) ) ( not ( = ?auto_61554 ?auto_61559 ) ) ( not ( = ?auto_61555 ?auto_61556 ) ) ( not ( = ?auto_61555 ?auto_61557 ) ) ( not ( = ?auto_61555 ?auto_61558 ) ) ( not ( = ?auto_61555 ?auto_61559 ) ) ( not ( = ?auto_61556 ?auto_61557 ) ) ( not ( = ?auto_61556 ?auto_61558 ) ) ( not ( = ?auto_61556 ?auto_61559 ) ) ( not ( = ?auto_61557 ?auto_61558 ) ) ( not ( = ?auto_61557 ?auto_61559 ) ) ( not ( = ?auto_61558 ?auto_61559 ) ) ( ON-TABLE ?auto_61559 ) ( ON ?auto_61558 ?auto_61559 ) ( ON ?auto_61557 ?auto_61558 ) ( ON ?auto_61556 ?auto_61557 ) ( ON ?auto_61555 ?auto_61556 ) ( CLEAR ?auto_61555 ) ( HOLDING ?auto_61554 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61554 )
      ( MAKE-6PILE ?auto_61554 ?auto_61555 ?auto_61556 ?auto_61557 ?auto_61558 ?auto_61559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61560 - BLOCK
      ?auto_61561 - BLOCK
      ?auto_61562 - BLOCK
      ?auto_61563 - BLOCK
      ?auto_61564 - BLOCK
      ?auto_61565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61560 ?auto_61561 ) ) ( not ( = ?auto_61560 ?auto_61562 ) ) ( not ( = ?auto_61560 ?auto_61563 ) ) ( not ( = ?auto_61560 ?auto_61564 ) ) ( not ( = ?auto_61560 ?auto_61565 ) ) ( not ( = ?auto_61561 ?auto_61562 ) ) ( not ( = ?auto_61561 ?auto_61563 ) ) ( not ( = ?auto_61561 ?auto_61564 ) ) ( not ( = ?auto_61561 ?auto_61565 ) ) ( not ( = ?auto_61562 ?auto_61563 ) ) ( not ( = ?auto_61562 ?auto_61564 ) ) ( not ( = ?auto_61562 ?auto_61565 ) ) ( not ( = ?auto_61563 ?auto_61564 ) ) ( not ( = ?auto_61563 ?auto_61565 ) ) ( not ( = ?auto_61564 ?auto_61565 ) ) ( ON-TABLE ?auto_61565 ) ( ON ?auto_61564 ?auto_61565 ) ( ON ?auto_61563 ?auto_61564 ) ( ON ?auto_61562 ?auto_61563 ) ( ON ?auto_61561 ?auto_61562 ) ( ON ?auto_61560 ?auto_61561 ) ( CLEAR ?auto_61560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61565 ?auto_61564 ?auto_61563 ?auto_61562 ?auto_61561 )
      ( MAKE-6PILE ?auto_61560 ?auto_61561 ?auto_61562 ?auto_61563 ?auto_61564 ?auto_61565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61572 - BLOCK
      ?auto_61573 - BLOCK
      ?auto_61574 - BLOCK
      ?auto_61575 - BLOCK
      ?auto_61576 - BLOCK
      ?auto_61577 - BLOCK
    )
    :vars
    (
      ?auto_61578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61572 ?auto_61573 ) ) ( not ( = ?auto_61572 ?auto_61574 ) ) ( not ( = ?auto_61572 ?auto_61575 ) ) ( not ( = ?auto_61572 ?auto_61576 ) ) ( not ( = ?auto_61572 ?auto_61577 ) ) ( not ( = ?auto_61573 ?auto_61574 ) ) ( not ( = ?auto_61573 ?auto_61575 ) ) ( not ( = ?auto_61573 ?auto_61576 ) ) ( not ( = ?auto_61573 ?auto_61577 ) ) ( not ( = ?auto_61574 ?auto_61575 ) ) ( not ( = ?auto_61574 ?auto_61576 ) ) ( not ( = ?auto_61574 ?auto_61577 ) ) ( not ( = ?auto_61575 ?auto_61576 ) ) ( not ( = ?auto_61575 ?auto_61577 ) ) ( not ( = ?auto_61576 ?auto_61577 ) ) ( ON-TABLE ?auto_61577 ) ( ON ?auto_61576 ?auto_61577 ) ( ON ?auto_61575 ?auto_61576 ) ( ON ?auto_61574 ?auto_61575 ) ( ON ?auto_61573 ?auto_61574 ) ( CLEAR ?auto_61573 ) ( ON ?auto_61572 ?auto_61578 ) ( CLEAR ?auto_61572 ) ( HAND-EMPTY ) ( not ( = ?auto_61572 ?auto_61578 ) ) ( not ( = ?auto_61573 ?auto_61578 ) ) ( not ( = ?auto_61574 ?auto_61578 ) ) ( not ( = ?auto_61575 ?auto_61578 ) ) ( not ( = ?auto_61576 ?auto_61578 ) ) ( not ( = ?auto_61577 ?auto_61578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_61572 ?auto_61578 )
      ( MAKE-6PILE ?auto_61572 ?auto_61573 ?auto_61574 ?auto_61575 ?auto_61576 ?auto_61577 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61579 - BLOCK
      ?auto_61580 - BLOCK
      ?auto_61581 - BLOCK
      ?auto_61582 - BLOCK
      ?auto_61583 - BLOCK
      ?auto_61584 - BLOCK
    )
    :vars
    (
      ?auto_61585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61579 ?auto_61580 ) ) ( not ( = ?auto_61579 ?auto_61581 ) ) ( not ( = ?auto_61579 ?auto_61582 ) ) ( not ( = ?auto_61579 ?auto_61583 ) ) ( not ( = ?auto_61579 ?auto_61584 ) ) ( not ( = ?auto_61580 ?auto_61581 ) ) ( not ( = ?auto_61580 ?auto_61582 ) ) ( not ( = ?auto_61580 ?auto_61583 ) ) ( not ( = ?auto_61580 ?auto_61584 ) ) ( not ( = ?auto_61581 ?auto_61582 ) ) ( not ( = ?auto_61581 ?auto_61583 ) ) ( not ( = ?auto_61581 ?auto_61584 ) ) ( not ( = ?auto_61582 ?auto_61583 ) ) ( not ( = ?auto_61582 ?auto_61584 ) ) ( not ( = ?auto_61583 ?auto_61584 ) ) ( ON-TABLE ?auto_61584 ) ( ON ?auto_61583 ?auto_61584 ) ( ON ?auto_61582 ?auto_61583 ) ( ON ?auto_61581 ?auto_61582 ) ( ON ?auto_61579 ?auto_61585 ) ( CLEAR ?auto_61579 ) ( not ( = ?auto_61579 ?auto_61585 ) ) ( not ( = ?auto_61580 ?auto_61585 ) ) ( not ( = ?auto_61581 ?auto_61585 ) ) ( not ( = ?auto_61582 ?auto_61585 ) ) ( not ( = ?auto_61583 ?auto_61585 ) ) ( not ( = ?auto_61584 ?auto_61585 ) ) ( HOLDING ?auto_61580 ) ( CLEAR ?auto_61581 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61584 ?auto_61583 ?auto_61582 ?auto_61581 ?auto_61580 )
      ( MAKE-6PILE ?auto_61579 ?auto_61580 ?auto_61581 ?auto_61582 ?auto_61583 ?auto_61584 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61586 - BLOCK
      ?auto_61587 - BLOCK
      ?auto_61588 - BLOCK
      ?auto_61589 - BLOCK
      ?auto_61590 - BLOCK
      ?auto_61591 - BLOCK
    )
    :vars
    (
      ?auto_61592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61586 ?auto_61587 ) ) ( not ( = ?auto_61586 ?auto_61588 ) ) ( not ( = ?auto_61586 ?auto_61589 ) ) ( not ( = ?auto_61586 ?auto_61590 ) ) ( not ( = ?auto_61586 ?auto_61591 ) ) ( not ( = ?auto_61587 ?auto_61588 ) ) ( not ( = ?auto_61587 ?auto_61589 ) ) ( not ( = ?auto_61587 ?auto_61590 ) ) ( not ( = ?auto_61587 ?auto_61591 ) ) ( not ( = ?auto_61588 ?auto_61589 ) ) ( not ( = ?auto_61588 ?auto_61590 ) ) ( not ( = ?auto_61588 ?auto_61591 ) ) ( not ( = ?auto_61589 ?auto_61590 ) ) ( not ( = ?auto_61589 ?auto_61591 ) ) ( not ( = ?auto_61590 ?auto_61591 ) ) ( ON-TABLE ?auto_61591 ) ( ON ?auto_61590 ?auto_61591 ) ( ON ?auto_61589 ?auto_61590 ) ( ON ?auto_61588 ?auto_61589 ) ( ON ?auto_61586 ?auto_61592 ) ( not ( = ?auto_61586 ?auto_61592 ) ) ( not ( = ?auto_61587 ?auto_61592 ) ) ( not ( = ?auto_61588 ?auto_61592 ) ) ( not ( = ?auto_61589 ?auto_61592 ) ) ( not ( = ?auto_61590 ?auto_61592 ) ) ( not ( = ?auto_61591 ?auto_61592 ) ) ( CLEAR ?auto_61588 ) ( ON ?auto_61587 ?auto_61586 ) ( CLEAR ?auto_61587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_61592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61592 ?auto_61586 )
      ( MAKE-6PILE ?auto_61586 ?auto_61587 ?auto_61588 ?auto_61589 ?auto_61590 ?auto_61591 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61593 - BLOCK
      ?auto_61594 - BLOCK
      ?auto_61595 - BLOCK
      ?auto_61596 - BLOCK
      ?auto_61597 - BLOCK
      ?auto_61598 - BLOCK
    )
    :vars
    (
      ?auto_61599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61593 ?auto_61594 ) ) ( not ( = ?auto_61593 ?auto_61595 ) ) ( not ( = ?auto_61593 ?auto_61596 ) ) ( not ( = ?auto_61593 ?auto_61597 ) ) ( not ( = ?auto_61593 ?auto_61598 ) ) ( not ( = ?auto_61594 ?auto_61595 ) ) ( not ( = ?auto_61594 ?auto_61596 ) ) ( not ( = ?auto_61594 ?auto_61597 ) ) ( not ( = ?auto_61594 ?auto_61598 ) ) ( not ( = ?auto_61595 ?auto_61596 ) ) ( not ( = ?auto_61595 ?auto_61597 ) ) ( not ( = ?auto_61595 ?auto_61598 ) ) ( not ( = ?auto_61596 ?auto_61597 ) ) ( not ( = ?auto_61596 ?auto_61598 ) ) ( not ( = ?auto_61597 ?auto_61598 ) ) ( ON-TABLE ?auto_61598 ) ( ON ?auto_61597 ?auto_61598 ) ( ON ?auto_61596 ?auto_61597 ) ( ON ?auto_61593 ?auto_61599 ) ( not ( = ?auto_61593 ?auto_61599 ) ) ( not ( = ?auto_61594 ?auto_61599 ) ) ( not ( = ?auto_61595 ?auto_61599 ) ) ( not ( = ?auto_61596 ?auto_61599 ) ) ( not ( = ?auto_61597 ?auto_61599 ) ) ( not ( = ?auto_61598 ?auto_61599 ) ) ( ON ?auto_61594 ?auto_61593 ) ( CLEAR ?auto_61594 ) ( ON-TABLE ?auto_61599 ) ( HOLDING ?auto_61595 ) ( CLEAR ?auto_61596 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61598 ?auto_61597 ?auto_61596 ?auto_61595 )
      ( MAKE-6PILE ?auto_61593 ?auto_61594 ?auto_61595 ?auto_61596 ?auto_61597 ?auto_61598 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61600 - BLOCK
      ?auto_61601 - BLOCK
      ?auto_61602 - BLOCK
      ?auto_61603 - BLOCK
      ?auto_61604 - BLOCK
      ?auto_61605 - BLOCK
    )
    :vars
    (
      ?auto_61606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61600 ?auto_61601 ) ) ( not ( = ?auto_61600 ?auto_61602 ) ) ( not ( = ?auto_61600 ?auto_61603 ) ) ( not ( = ?auto_61600 ?auto_61604 ) ) ( not ( = ?auto_61600 ?auto_61605 ) ) ( not ( = ?auto_61601 ?auto_61602 ) ) ( not ( = ?auto_61601 ?auto_61603 ) ) ( not ( = ?auto_61601 ?auto_61604 ) ) ( not ( = ?auto_61601 ?auto_61605 ) ) ( not ( = ?auto_61602 ?auto_61603 ) ) ( not ( = ?auto_61602 ?auto_61604 ) ) ( not ( = ?auto_61602 ?auto_61605 ) ) ( not ( = ?auto_61603 ?auto_61604 ) ) ( not ( = ?auto_61603 ?auto_61605 ) ) ( not ( = ?auto_61604 ?auto_61605 ) ) ( ON-TABLE ?auto_61605 ) ( ON ?auto_61604 ?auto_61605 ) ( ON ?auto_61603 ?auto_61604 ) ( ON ?auto_61600 ?auto_61606 ) ( not ( = ?auto_61600 ?auto_61606 ) ) ( not ( = ?auto_61601 ?auto_61606 ) ) ( not ( = ?auto_61602 ?auto_61606 ) ) ( not ( = ?auto_61603 ?auto_61606 ) ) ( not ( = ?auto_61604 ?auto_61606 ) ) ( not ( = ?auto_61605 ?auto_61606 ) ) ( ON ?auto_61601 ?auto_61600 ) ( ON-TABLE ?auto_61606 ) ( CLEAR ?auto_61603 ) ( ON ?auto_61602 ?auto_61601 ) ( CLEAR ?auto_61602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61606 ?auto_61600 ?auto_61601 )
      ( MAKE-6PILE ?auto_61600 ?auto_61601 ?auto_61602 ?auto_61603 ?auto_61604 ?auto_61605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61607 - BLOCK
      ?auto_61608 - BLOCK
      ?auto_61609 - BLOCK
      ?auto_61610 - BLOCK
      ?auto_61611 - BLOCK
      ?auto_61612 - BLOCK
    )
    :vars
    (
      ?auto_61613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61607 ?auto_61608 ) ) ( not ( = ?auto_61607 ?auto_61609 ) ) ( not ( = ?auto_61607 ?auto_61610 ) ) ( not ( = ?auto_61607 ?auto_61611 ) ) ( not ( = ?auto_61607 ?auto_61612 ) ) ( not ( = ?auto_61608 ?auto_61609 ) ) ( not ( = ?auto_61608 ?auto_61610 ) ) ( not ( = ?auto_61608 ?auto_61611 ) ) ( not ( = ?auto_61608 ?auto_61612 ) ) ( not ( = ?auto_61609 ?auto_61610 ) ) ( not ( = ?auto_61609 ?auto_61611 ) ) ( not ( = ?auto_61609 ?auto_61612 ) ) ( not ( = ?auto_61610 ?auto_61611 ) ) ( not ( = ?auto_61610 ?auto_61612 ) ) ( not ( = ?auto_61611 ?auto_61612 ) ) ( ON-TABLE ?auto_61612 ) ( ON ?auto_61611 ?auto_61612 ) ( ON ?auto_61607 ?auto_61613 ) ( not ( = ?auto_61607 ?auto_61613 ) ) ( not ( = ?auto_61608 ?auto_61613 ) ) ( not ( = ?auto_61609 ?auto_61613 ) ) ( not ( = ?auto_61610 ?auto_61613 ) ) ( not ( = ?auto_61611 ?auto_61613 ) ) ( not ( = ?auto_61612 ?auto_61613 ) ) ( ON ?auto_61608 ?auto_61607 ) ( ON-TABLE ?auto_61613 ) ( ON ?auto_61609 ?auto_61608 ) ( CLEAR ?auto_61609 ) ( HOLDING ?auto_61610 ) ( CLEAR ?auto_61611 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_61612 ?auto_61611 ?auto_61610 )
      ( MAKE-6PILE ?auto_61607 ?auto_61608 ?auto_61609 ?auto_61610 ?auto_61611 ?auto_61612 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61614 - BLOCK
      ?auto_61615 - BLOCK
      ?auto_61616 - BLOCK
      ?auto_61617 - BLOCK
      ?auto_61618 - BLOCK
      ?auto_61619 - BLOCK
    )
    :vars
    (
      ?auto_61620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61614 ?auto_61615 ) ) ( not ( = ?auto_61614 ?auto_61616 ) ) ( not ( = ?auto_61614 ?auto_61617 ) ) ( not ( = ?auto_61614 ?auto_61618 ) ) ( not ( = ?auto_61614 ?auto_61619 ) ) ( not ( = ?auto_61615 ?auto_61616 ) ) ( not ( = ?auto_61615 ?auto_61617 ) ) ( not ( = ?auto_61615 ?auto_61618 ) ) ( not ( = ?auto_61615 ?auto_61619 ) ) ( not ( = ?auto_61616 ?auto_61617 ) ) ( not ( = ?auto_61616 ?auto_61618 ) ) ( not ( = ?auto_61616 ?auto_61619 ) ) ( not ( = ?auto_61617 ?auto_61618 ) ) ( not ( = ?auto_61617 ?auto_61619 ) ) ( not ( = ?auto_61618 ?auto_61619 ) ) ( ON-TABLE ?auto_61619 ) ( ON ?auto_61618 ?auto_61619 ) ( ON ?auto_61614 ?auto_61620 ) ( not ( = ?auto_61614 ?auto_61620 ) ) ( not ( = ?auto_61615 ?auto_61620 ) ) ( not ( = ?auto_61616 ?auto_61620 ) ) ( not ( = ?auto_61617 ?auto_61620 ) ) ( not ( = ?auto_61618 ?auto_61620 ) ) ( not ( = ?auto_61619 ?auto_61620 ) ) ( ON ?auto_61615 ?auto_61614 ) ( ON-TABLE ?auto_61620 ) ( ON ?auto_61616 ?auto_61615 ) ( CLEAR ?auto_61618 ) ( ON ?auto_61617 ?auto_61616 ) ( CLEAR ?auto_61617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_61620 ?auto_61614 ?auto_61615 ?auto_61616 )
      ( MAKE-6PILE ?auto_61614 ?auto_61615 ?auto_61616 ?auto_61617 ?auto_61618 ?auto_61619 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61621 - BLOCK
      ?auto_61622 - BLOCK
      ?auto_61623 - BLOCK
      ?auto_61624 - BLOCK
      ?auto_61625 - BLOCK
      ?auto_61626 - BLOCK
    )
    :vars
    (
      ?auto_61627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61621 ?auto_61622 ) ) ( not ( = ?auto_61621 ?auto_61623 ) ) ( not ( = ?auto_61621 ?auto_61624 ) ) ( not ( = ?auto_61621 ?auto_61625 ) ) ( not ( = ?auto_61621 ?auto_61626 ) ) ( not ( = ?auto_61622 ?auto_61623 ) ) ( not ( = ?auto_61622 ?auto_61624 ) ) ( not ( = ?auto_61622 ?auto_61625 ) ) ( not ( = ?auto_61622 ?auto_61626 ) ) ( not ( = ?auto_61623 ?auto_61624 ) ) ( not ( = ?auto_61623 ?auto_61625 ) ) ( not ( = ?auto_61623 ?auto_61626 ) ) ( not ( = ?auto_61624 ?auto_61625 ) ) ( not ( = ?auto_61624 ?auto_61626 ) ) ( not ( = ?auto_61625 ?auto_61626 ) ) ( ON-TABLE ?auto_61626 ) ( ON ?auto_61621 ?auto_61627 ) ( not ( = ?auto_61621 ?auto_61627 ) ) ( not ( = ?auto_61622 ?auto_61627 ) ) ( not ( = ?auto_61623 ?auto_61627 ) ) ( not ( = ?auto_61624 ?auto_61627 ) ) ( not ( = ?auto_61625 ?auto_61627 ) ) ( not ( = ?auto_61626 ?auto_61627 ) ) ( ON ?auto_61622 ?auto_61621 ) ( ON-TABLE ?auto_61627 ) ( ON ?auto_61623 ?auto_61622 ) ( ON ?auto_61624 ?auto_61623 ) ( CLEAR ?auto_61624 ) ( HOLDING ?auto_61625 ) ( CLEAR ?auto_61626 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_61626 ?auto_61625 )
      ( MAKE-6PILE ?auto_61621 ?auto_61622 ?auto_61623 ?auto_61624 ?auto_61625 ?auto_61626 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61628 - BLOCK
      ?auto_61629 - BLOCK
      ?auto_61630 - BLOCK
      ?auto_61631 - BLOCK
      ?auto_61632 - BLOCK
      ?auto_61633 - BLOCK
    )
    :vars
    (
      ?auto_61634 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61628 ?auto_61629 ) ) ( not ( = ?auto_61628 ?auto_61630 ) ) ( not ( = ?auto_61628 ?auto_61631 ) ) ( not ( = ?auto_61628 ?auto_61632 ) ) ( not ( = ?auto_61628 ?auto_61633 ) ) ( not ( = ?auto_61629 ?auto_61630 ) ) ( not ( = ?auto_61629 ?auto_61631 ) ) ( not ( = ?auto_61629 ?auto_61632 ) ) ( not ( = ?auto_61629 ?auto_61633 ) ) ( not ( = ?auto_61630 ?auto_61631 ) ) ( not ( = ?auto_61630 ?auto_61632 ) ) ( not ( = ?auto_61630 ?auto_61633 ) ) ( not ( = ?auto_61631 ?auto_61632 ) ) ( not ( = ?auto_61631 ?auto_61633 ) ) ( not ( = ?auto_61632 ?auto_61633 ) ) ( ON-TABLE ?auto_61633 ) ( ON ?auto_61628 ?auto_61634 ) ( not ( = ?auto_61628 ?auto_61634 ) ) ( not ( = ?auto_61629 ?auto_61634 ) ) ( not ( = ?auto_61630 ?auto_61634 ) ) ( not ( = ?auto_61631 ?auto_61634 ) ) ( not ( = ?auto_61632 ?auto_61634 ) ) ( not ( = ?auto_61633 ?auto_61634 ) ) ( ON ?auto_61629 ?auto_61628 ) ( ON-TABLE ?auto_61634 ) ( ON ?auto_61630 ?auto_61629 ) ( ON ?auto_61631 ?auto_61630 ) ( CLEAR ?auto_61633 ) ( ON ?auto_61632 ?auto_61631 ) ( CLEAR ?auto_61632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_61634 ?auto_61628 ?auto_61629 ?auto_61630 ?auto_61631 )
      ( MAKE-6PILE ?auto_61628 ?auto_61629 ?auto_61630 ?auto_61631 ?auto_61632 ?auto_61633 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61635 - BLOCK
      ?auto_61636 - BLOCK
      ?auto_61637 - BLOCK
      ?auto_61638 - BLOCK
      ?auto_61639 - BLOCK
      ?auto_61640 - BLOCK
    )
    :vars
    (
      ?auto_61641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61635 ?auto_61636 ) ) ( not ( = ?auto_61635 ?auto_61637 ) ) ( not ( = ?auto_61635 ?auto_61638 ) ) ( not ( = ?auto_61635 ?auto_61639 ) ) ( not ( = ?auto_61635 ?auto_61640 ) ) ( not ( = ?auto_61636 ?auto_61637 ) ) ( not ( = ?auto_61636 ?auto_61638 ) ) ( not ( = ?auto_61636 ?auto_61639 ) ) ( not ( = ?auto_61636 ?auto_61640 ) ) ( not ( = ?auto_61637 ?auto_61638 ) ) ( not ( = ?auto_61637 ?auto_61639 ) ) ( not ( = ?auto_61637 ?auto_61640 ) ) ( not ( = ?auto_61638 ?auto_61639 ) ) ( not ( = ?auto_61638 ?auto_61640 ) ) ( not ( = ?auto_61639 ?auto_61640 ) ) ( ON ?auto_61635 ?auto_61641 ) ( not ( = ?auto_61635 ?auto_61641 ) ) ( not ( = ?auto_61636 ?auto_61641 ) ) ( not ( = ?auto_61637 ?auto_61641 ) ) ( not ( = ?auto_61638 ?auto_61641 ) ) ( not ( = ?auto_61639 ?auto_61641 ) ) ( not ( = ?auto_61640 ?auto_61641 ) ) ( ON ?auto_61636 ?auto_61635 ) ( ON-TABLE ?auto_61641 ) ( ON ?auto_61637 ?auto_61636 ) ( ON ?auto_61638 ?auto_61637 ) ( ON ?auto_61639 ?auto_61638 ) ( CLEAR ?auto_61639 ) ( HOLDING ?auto_61640 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_61640 )
      ( MAKE-6PILE ?auto_61635 ?auto_61636 ?auto_61637 ?auto_61638 ?auto_61639 ?auto_61640 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_61642 - BLOCK
      ?auto_61643 - BLOCK
      ?auto_61644 - BLOCK
      ?auto_61645 - BLOCK
      ?auto_61646 - BLOCK
      ?auto_61647 - BLOCK
    )
    :vars
    (
      ?auto_61648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61642 ?auto_61643 ) ) ( not ( = ?auto_61642 ?auto_61644 ) ) ( not ( = ?auto_61642 ?auto_61645 ) ) ( not ( = ?auto_61642 ?auto_61646 ) ) ( not ( = ?auto_61642 ?auto_61647 ) ) ( not ( = ?auto_61643 ?auto_61644 ) ) ( not ( = ?auto_61643 ?auto_61645 ) ) ( not ( = ?auto_61643 ?auto_61646 ) ) ( not ( = ?auto_61643 ?auto_61647 ) ) ( not ( = ?auto_61644 ?auto_61645 ) ) ( not ( = ?auto_61644 ?auto_61646 ) ) ( not ( = ?auto_61644 ?auto_61647 ) ) ( not ( = ?auto_61645 ?auto_61646 ) ) ( not ( = ?auto_61645 ?auto_61647 ) ) ( not ( = ?auto_61646 ?auto_61647 ) ) ( ON ?auto_61642 ?auto_61648 ) ( not ( = ?auto_61642 ?auto_61648 ) ) ( not ( = ?auto_61643 ?auto_61648 ) ) ( not ( = ?auto_61644 ?auto_61648 ) ) ( not ( = ?auto_61645 ?auto_61648 ) ) ( not ( = ?auto_61646 ?auto_61648 ) ) ( not ( = ?auto_61647 ?auto_61648 ) ) ( ON ?auto_61643 ?auto_61642 ) ( ON-TABLE ?auto_61648 ) ( ON ?auto_61644 ?auto_61643 ) ( ON ?auto_61645 ?auto_61644 ) ( ON ?auto_61646 ?auto_61645 ) ( ON ?auto_61647 ?auto_61646 ) ( CLEAR ?auto_61647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_61648 ?auto_61642 ?auto_61643 ?auto_61644 ?auto_61645 ?auto_61646 )
      ( MAKE-6PILE ?auto_61642 ?auto_61643 ?auto_61644 ?auto_61645 ?auto_61646 ?auto_61647 ) )
  )

)

