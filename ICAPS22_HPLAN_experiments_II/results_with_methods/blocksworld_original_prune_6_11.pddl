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
      ?auto_52073 - BLOCK
      ?auto_52074 - BLOCK
      ?auto_52075 - BLOCK
      ?auto_52076 - BLOCK
      ?auto_52077 - BLOCK
      ?auto_52078 - BLOCK
    )
    :vars
    (
      ?auto_52079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52079 ?auto_52078 ) ( CLEAR ?auto_52079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52073 ) ( ON ?auto_52074 ?auto_52073 ) ( ON ?auto_52075 ?auto_52074 ) ( ON ?auto_52076 ?auto_52075 ) ( ON ?auto_52077 ?auto_52076 ) ( ON ?auto_52078 ?auto_52077 ) ( not ( = ?auto_52073 ?auto_52074 ) ) ( not ( = ?auto_52073 ?auto_52075 ) ) ( not ( = ?auto_52073 ?auto_52076 ) ) ( not ( = ?auto_52073 ?auto_52077 ) ) ( not ( = ?auto_52073 ?auto_52078 ) ) ( not ( = ?auto_52073 ?auto_52079 ) ) ( not ( = ?auto_52074 ?auto_52075 ) ) ( not ( = ?auto_52074 ?auto_52076 ) ) ( not ( = ?auto_52074 ?auto_52077 ) ) ( not ( = ?auto_52074 ?auto_52078 ) ) ( not ( = ?auto_52074 ?auto_52079 ) ) ( not ( = ?auto_52075 ?auto_52076 ) ) ( not ( = ?auto_52075 ?auto_52077 ) ) ( not ( = ?auto_52075 ?auto_52078 ) ) ( not ( = ?auto_52075 ?auto_52079 ) ) ( not ( = ?auto_52076 ?auto_52077 ) ) ( not ( = ?auto_52076 ?auto_52078 ) ) ( not ( = ?auto_52076 ?auto_52079 ) ) ( not ( = ?auto_52077 ?auto_52078 ) ) ( not ( = ?auto_52077 ?auto_52079 ) ) ( not ( = ?auto_52078 ?auto_52079 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52079 ?auto_52078 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52081 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52081 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_52081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52082 - BLOCK
    )
    :vars
    (
      ?auto_52083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52082 ?auto_52083 ) ( CLEAR ?auto_52082 ) ( HAND-EMPTY ) ( not ( = ?auto_52082 ?auto_52083 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52082 ?auto_52083 )
      ( MAKE-1PILE ?auto_52082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52089 - BLOCK
      ?auto_52090 - BLOCK
      ?auto_52091 - BLOCK
      ?auto_52092 - BLOCK
      ?auto_52093 - BLOCK
    )
    :vars
    (
      ?auto_52094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52094 ?auto_52093 ) ( CLEAR ?auto_52094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52089 ) ( ON ?auto_52090 ?auto_52089 ) ( ON ?auto_52091 ?auto_52090 ) ( ON ?auto_52092 ?auto_52091 ) ( ON ?auto_52093 ?auto_52092 ) ( not ( = ?auto_52089 ?auto_52090 ) ) ( not ( = ?auto_52089 ?auto_52091 ) ) ( not ( = ?auto_52089 ?auto_52092 ) ) ( not ( = ?auto_52089 ?auto_52093 ) ) ( not ( = ?auto_52089 ?auto_52094 ) ) ( not ( = ?auto_52090 ?auto_52091 ) ) ( not ( = ?auto_52090 ?auto_52092 ) ) ( not ( = ?auto_52090 ?auto_52093 ) ) ( not ( = ?auto_52090 ?auto_52094 ) ) ( not ( = ?auto_52091 ?auto_52092 ) ) ( not ( = ?auto_52091 ?auto_52093 ) ) ( not ( = ?auto_52091 ?auto_52094 ) ) ( not ( = ?auto_52092 ?auto_52093 ) ) ( not ( = ?auto_52092 ?auto_52094 ) ) ( not ( = ?auto_52093 ?auto_52094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52094 ?auto_52093 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52095 - BLOCK
      ?auto_52096 - BLOCK
      ?auto_52097 - BLOCK
      ?auto_52098 - BLOCK
      ?auto_52099 - BLOCK
    )
    :vars
    (
      ?auto_52100 - BLOCK
      ?auto_52101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52100 ?auto_52099 ) ( CLEAR ?auto_52100 ) ( ON-TABLE ?auto_52095 ) ( ON ?auto_52096 ?auto_52095 ) ( ON ?auto_52097 ?auto_52096 ) ( ON ?auto_52098 ?auto_52097 ) ( ON ?auto_52099 ?auto_52098 ) ( not ( = ?auto_52095 ?auto_52096 ) ) ( not ( = ?auto_52095 ?auto_52097 ) ) ( not ( = ?auto_52095 ?auto_52098 ) ) ( not ( = ?auto_52095 ?auto_52099 ) ) ( not ( = ?auto_52095 ?auto_52100 ) ) ( not ( = ?auto_52096 ?auto_52097 ) ) ( not ( = ?auto_52096 ?auto_52098 ) ) ( not ( = ?auto_52096 ?auto_52099 ) ) ( not ( = ?auto_52096 ?auto_52100 ) ) ( not ( = ?auto_52097 ?auto_52098 ) ) ( not ( = ?auto_52097 ?auto_52099 ) ) ( not ( = ?auto_52097 ?auto_52100 ) ) ( not ( = ?auto_52098 ?auto_52099 ) ) ( not ( = ?auto_52098 ?auto_52100 ) ) ( not ( = ?auto_52099 ?auto_52100 ) ) ( HOLDING ?auto_52101 ) ( not ( = ?auto_52095 ?auto_52101 ) ) ( not ( = ?auto_52096 ?auto_52101 ) ) ( not ( = ?auto_52097 ?auto_52101 ) ) ( not ( = ?auto_52098 ?auto_52101 ) ) ( not ( = ?auto_52099 ?auto_52101 ) ) ( not ( = ?auto_52100 ?auto_52101 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_52101 )
      ( MAKE-5PILE ?auto_52095 ?auto_52096 ?auto_52097 ?auto_52098 ?auto_52099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52102 - BLOCK
      ?auto_52103 - BLOCK
      ?auto_52104 - BLOCK
      ?auto_52105 - BLOCK
      ?auto_52106 - BLOCK
    )
    :vars
    (
      ?auto_52107 - BLOCK
      ?auto_52108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52107 ?auto_52106 ) ( ON-TABLE ?auto_52102 ) ( ON ?auto_52103 ?auto_52102 ) ( ON ?auto_52104 ?auto_52103 ) ( ON ?auto_52105 ?auto_52104 ) ( ON ?auto_52106 ?auto_52105 ) ( not ( = ?auto_52102 ?auto_52103 ) ) ( not ( = ?auto_52102 ?auto_52104 ) ) ( not ( = ?auto_52102 ?auto_52105 ) ) ( not ( = ?auto_52102 ?auto_52106 ) ) ( not ( = ?auto_52102 ?auto_52107 ) ) ( not ( = ?auto_52103 ?auto_52104 ) ) ( not ( = ?auto_52103 ?auto_52105 ) ) ( not ( = ?auto_52103 ?auto_52106 ) ) ( not ( = ?auto_52103 ?auto_52107 ) ) ( not ( = ?auto_52104 ?auto_52105 ) ) ( not ( = ?auto_52104 ?auto_52106 ) ) ( not ( = ?auto_52104 ?auto_52107 ) ) ( not ( = ?auto_52105 ?auto_52106 ) ) ( not ( = ?auto_52105 ?auto_52107 ) ) ( not ( = ?auto_52106 ?auto_52107 ) ) ( not ( = ?auto_52102 ?auto_52108 ) ) ( not ( = ?auto_52103 ?auto_52108 ) ) ( not ( = ?auto_52104 ?auto_52108 ) ) ( not ( = ?auto_52105 ?auto_52108 ) ) ( not ( = ?auto_52106 ?auto_52108 ) ) ( not ( = ?auto_52107 ?auto_52108 ) ) ( ON ?auto_52108 ?auto_52107 ) ( CLEAR ?auto_52108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52102 ?auto_52103 ?auto_52104 ?auto_52105 ?auto_52106 ?auto_52107 )
      ( MAKE-5PILE ?auto_52102 ?auto_52103 ?auto_52104 ?auto_52105 ?auto_52106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52111 - BLOCK
      ?auto_52112 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52112 ) ( CLEAR ?auto_52111 ) ( ON-TABLE ?auto_52111 ) ( not ( = ?auto_52111 ?auto_52112 ) ) )
    :subtasks
    ( ( !STACK ?auto_52112 ?auto_52111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52113 - BLOCK
      ?auto_52114 - BLOCK
    )
    :vars
    (
      ?auto_52115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52113 ) ( ON-TABLE ?auto_52113 ) ( not ( = ?auto_52113 ?auto_52114 ) ) ( ON ?auto_52114 ?auto_52115 ) ( CLEAR ?auto_52114 ) ( HAND-EMPTY ) ( not ( = ?auto_52113 ?auto_52115 ) ) ( not ( = ?auto_52114 ?auto_52115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52114 ?auto_52115 )
      ( MAKE-2PILE ?auto_52113 ?auto_52114 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52116 - BLOCK
      ?auto_52117 - BLOCK
    )
    :vars
    (
      ?auto_52118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52116 ?auto_52117 ) ) ( ON ?auto_52117 ?auto_52118 ) ( CLEAR ?auto_52117 ) ( not ( = ?auto_52116 ?auto_52118 ) ) ( not ( = ?auto_52117 ?auto_52118 ) ) ( HOLDING ?auto_52116 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52116 )
      ( MAKE-2PILE ?auto_52116 ?auto_52117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52119 - BLOCK
      ?auto_52120 - BLOCK
    )
    :vars
    (
      ?auto_52121 - BLOCK
      ?auto_52122 - BLOCK
      ?auto_52124 - BLOCK
      ?auto_52125 - BLOCK
      ?auto_52123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52119 ?auto_52120 ) ) ( ON ?auto_52120 ?auto_52121 ) ( not ( = ?auto_52119 ?auto_52121 ) ) ( not ( = ?auto_52120 ?auto_52121 ) ) ( ON ?auto_52119 ?auto_52120 ) ( CLEAR ?auto_52119 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52122 ) ( ON ?auto_52124 ?auto_52122 ) ( ON ?auto_52125 ?auto_52124 ) ( ON ?auto_52123 ?auto_52125 ) ( ON ?auto_52121 ?auto_52123 ) ( not ( = ?auto_52122 ?auto_52124 ) ) ( not ( = ?auto_52122 ?auto_52125 ) ) ( not ( = ?auto_52122 ?auto_52123 ) ) ( not ( = ?auto_52122 ?auto_52121 ) ) ( not ( = ?auto_52122 ?auto_52120 ) ) ( not ( = ?auto_52122 ?auto_52119 ) ) ( not ( = ?auto_52124 ?auto_52125 ) ) ( not ( = ?auto_52124 ?auto_52123 ) ) ( not ( = ?auto_52124 ?auto_52121 ) ) ( not ( = ?auto_52124 ?auto_52120 ) ) ( not ( = ?auto_52124 ?auto_52119 ) ) ( not ( = ?auto_52125 ?auto_52123 ) ) ( not ( = ?auto_52125 ?auto_52121 ) ) ( not ( = ?auto_52125 ?auto_52120 ) ) ( not ( = ?auto_52125 ?auto_52119 ) ) ( not ( = ?auto_52123 ?auto_52121 ) ) ( not ( = ?auto_52123 ?auto_52120 ) ) ( not ( = ?auto_52123 ?auto_52119 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52122 ?auto_52124 ?auto_52125 ?auto_52123 ?auto_52121 ?auto_52120 )
      ( MAKE-2PILE ?auto_52119 ?auto_52120 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52130 - BLOCK
      ?auto_52131 - BLOCK
      ?auto_52132 - BLOCK
      ?auto_52133 - BLOCK
    )
    :vars
    (
      ?auto_52134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52134 ?auto_52133 ) ( CLEAR ?auto_52134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52130 ) ( ON ?auto_52131 ?auto_52130 ) ( ON ?auto_52132 ?auto_52131 ) ( ON ?auto_52133 ?auto_52132 ) ( not ( = ?auto_52130 ?auto_52131 ) ) ( not ( = ?auto_52130 ?auto_52132 ) ) ( not ( = ?auto_52130 ?auto_52133 ) ) ( not ( = ?auto_52130 ?auto_52134 ) ) ( not ( = ?auto_52131 ?auto_52132 ) ) ( not ( = ?auto_52131 ?auto_52133 ) ) ( not ( = ?auto_52131 ?auto_52134 ) ) ( not ( = ?auto_52132 ?auto_52133 ) ) ( not ( = ?auto_52132 ?auto_52134 ) ) ( not ( = ?auto_52133 ?auto_52134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52134 ?auto_52133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52135 - BLOCK
      ?auto_52136 - BLOCK
      ?auto_52137 - BLOCK
      ?auto_52138 - BLOCK
    )
    :vars
    (
      ?auto_52139 - BLOCK
      ?auto_52140 - BLOCK
      ?auto_52141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52139 ?auto_52138 ) ( CLEAR ?auto_52139 ) ( ON-TABLE ?auto_52135 ) ( ON ?auto_52136 ?auto_52135 ) ( ON ?auto_52137 ?auto_52136 ) ( ON ?auto_52138 ?auto_52137 ) ( not ( = ?auto_52135 ?auto_52136 ) ) ( not ( = ?auto_52135 ?auto_52137 ) ) ( not ( = ?auto_52135 ?auto_52138 ) ) ( not ( = ?auto_52135 ?auto_52139 ) ) ( not ( = ?auto_52136 ?auto_52137 ) ) ( not ( = ?auto_52136 ?auto_52138 ) ) ( not ( = ?auto_52136 ?auto_52139 ) ) ( not ( = ?auto_52137 ?auto_52138 ) ) ( not ( = ?auto_52137 ?auto_52139 ) ) ( not ( = ?auto_52138 ?auto_52139 ) ) ( HOLDING ?auto_52140 ) ( CLEAR ?auto_52141 ) ( not ( = ?auto_52135 ?auto_52140 ) ) ( not ( = ?auto_52135 ?auto_52141 ) ) ( not ( = ?auto_52136 ?auto_52140 ) ) ( not ( = ?auto_52136 ?auto_52141 ) ) ( not ( = ?auto_52137 ?auto_52140 ) ) ( not ( = ?auto_52137 ?auto_52141 ) ) ( not ( = ?auto_52138 ?auto_52140 ) ) ( not ( = ?auto_52138 ?auto_52141 ) ) ( not ( = ?auto_52139 ?auto_52140 ) ) ( not ( = ?auto_52139 ?auto_52141 ) ) ( not ( = ?auto_52140 ?auto_52141 ) ) )
    :subtasks
    ( ( !STACK ?auto_52140 ?auto_52141 )
      ( MAKE-4PILE ?auto_52135 ?auto_52136 ?auto_52137 ?auto_52138 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52741 - BLOCK
      ?auto_52742 - BLOCK
      ?auto_52743 - BLOCK
      ?auto_52744 - BLOCK
    )
    :vars
    (
      ?auto_52745 - BLOCK
      ?auto_52746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52745 ?auto_52744 ) ( ON-TABLE ?auto_52741 ) ( ON ?auto_52742 ?auto_52741 ) ( ON ?auto_52743 ?auto_52742 ) ( ON ?auto_52744 ?auto_52743 ) ( not ( = ?auto_52741 ?auto_52742 ) ) ( not ( = ?auto_52741 ?auto_52743 ) ) ( not ( = ?auto_52741 ?auto_52744 ) ) ( not ( = ?auto_52741 ?auto_52745 ) ) ( not ( = ?auto_52742 ?auto_52743 ) ) ( not ( = ?auto_52742 ?auto_52744 ) ) ( not ( = ?auto_52742 ?auto_52745 ) ) ( not ( = ?auto_52743 ?auto_52744 ) ) ( not ( = ?auto_52743 ?auto_52745 ) ) ( not ( = ?auto_52744 ?auto_52745 ) ) ( not ( = ?auto_52741 ?auto_52746 ) ) ( not ( = ?auto_52742 ?auto_52746 ) ) ( not ( = ?auto_52743 ?auto_52746 ) ) ( not ( = ?auto_52744 ?auto_52746 ) ) ( not ( = ?auto_52745 ?auto_52746 ) ) ( ON ?auto_52746 ?auto_52745 ) ( CLEAR ?auto_52746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52741 ?auto_52742 ?auto_52743 ?auto_52744 ?auto_52745 )
      ( MAKE-4PILE ?auto_52741 ?auto_52742 ?auto_52743 ?auto_52744 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52149 - BLOCK
      ?auto_52150 - BLOCK
      ?auto_52151 - BLOCK
      ?auto_52152 - BLOCK
    )
    :vars
    (
      ?auto_52154 - BLOCK
      ?auto_52155 - BLOCK
      ?auto_52153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52154 ?auto_52152 ) ( ON-TABLE ?auto_52149 ) ( ON ?auto_52150 ?auto_52149 ) ( ON ?auto_52151 ?auto_52150 ) ( ON ?auto_52152 ?auto_52151 ) ( not ( = ?auto_52149 ?auto_52150 ) ) ( not ( = ?auto_52149 ?auto_52151 ) ) ( not ( = ?auto_52149 ?auto_52152 ) ) ( not ( = ?auto_52149 ?auto_52154 ) ) ( not ( = ?auto_52150 ?auto_52151 ) ) ( not ( = ?auto_52150 ?auto_52152 ) ) ( not ( = ?auto_52150 ?auto_52154 ) ) ( not ( = ?auto_52151 ?auto_52152 ) ) ( not ( = ?auto_52151 ?auto_52154 ) ) ( not ( = ?auto_52152 ?auto_52154 ) ) ( not ( = ?auto_52149 ?auto_52155 ) ) ( not ( = ?auto_52149 ?auto_52153 ) ) ( not ( = ?auto_52150 ?auto_52155 ) ) ( not ( = ?auto_52150 ?auto_52153 ) ) ( not ( = ?auto_52151 ?auto_52155 ) ) ( not ( = ?auto_52151 ?auto_52153 ) ) ( not ( = ?auto_52152 ?auto_52155 ) ) ( not ( = ?auto_52152 ?auto_52153 ) ) ( not ( = ?auto_52154 ?auto_52155 ) ) ( not ( = ?auto_52154 ?auto_52153 ) ) ( not ( = ?auto_52155 ?auto_52153 ) ) ( ON ?auto_52155 ?auto_52154 ) ( CLEAR ?auto_52155 ) ( HOLDING ?auto_52153 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52153 )
      ( MAKE-4PILE ?auto_52149 ?auto_52150 ?auto_52151 ?auto_52152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52156 - BLOCK
      ?auto_52157 - BLOCK
      ?auto_52158 - BLOCK
      ?auto_52159 - BLOCK
    )
    :vars
    (
      ?auto_52161 - BLOCK
      ?auto_52162 - BLOCK
      ?auto_52160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52161 ?auto_52159 ) ( ON-TABLE ?auto_52156 ) ( ON ?auto_52157 ?auto_52156 ) ( ON ?auto_52158 ?auto_52157 ) ( ON ?auto_52159 ?auto_52158 ) ( not ( = ?auto_52156 ?auto_52157 ) ) ( not ( = ?auto_52156 ?auto_52158 ) ) ( not ( = ?auto_52156 ?auto_52159 ) ) ( not ( = ?auto_52156 ?auto_52161 ) ) ( not ( = ?auto_52157 ?auto_52158 ) ) ( not ( = ?auto_52157 ?auto_52159 ) ) ( not ( = ?auto_52157 ?auto_52161 ) ) ( not ( = ?auto_52158 ?auto_52159 ) ) ( not ( = ?auto_52158 ?auto_52161 ) ) ( not ( = ?auto_52159 ?auto_52161 ) ) ( not ( = ?auto_52156 ?auto_52162 ) ) ( not ( = ?auto_52156 ?auto_52160 ) ) ( not ( = ?auto_52157 ?auto_52162 ) ) ( not ( = ?auto_52157 ?auto_52160 ) ) ( not ( = ?auto_52158 ?auto_52162 ) ) ( not ( = ?auto_52158 ?auto_52160 ) ) ( not ( = ?auto_52159 ?auto_52162 ) ) ( not ( = ?auto_52159 ?auto_52160 ) ) ( not ( = ?auto_52161 ?auto_52162 ) ) ( not ( = ?auto_52161 ?auto_52160 ) ) ( not ( = ?auto_52162 ?auto_52160 ) ) ( ON ?auto_52162 ?auto_52161 ) ( ON ?auto_52160 ?auto_52162 ) ( CLEAR ?auto_52160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52156 ?auto_52157 ?auto_52158 ?auto_52159 ?auto_52161 ?auto_52162 )
      ( MAKE-4PILE ?auto_52156 ?auto_52157 ?auto_52158 ?auto_52159 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52166 - BLOCK
      ?auto_52167 - BLOCK
      ?auto_52168 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52168 ) ( CLEAR ?auto_52167 ) ( ON-TABLE ?auto_52166 ) ( ON ?auto_52167 ?auto_52166 ) ( not ( = ?auto_52166 ?auto_52167 ) ) ( not ( = ?auto_52166 ?auto_52168 ) ) ( not ( = ?auto_52167 ?auto_52168 ) ) )
    :subtasks
    ( ( !STACK ?auto_52168 ?auto_52167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52169 - BLOCK
      ?auto_52170 - BLOCK
      ?auto_52171 - BLOCK
    )
    :vars
    (
      ?auto_52172 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52170 ) ( ON-TABLE ?auto_52169 ) ( ON ?auto_52170 ?auto_52169 ) ( not ( = ?auto_52169 ?auto_52170 ) ) ( not ( = ?auto_52169 ?auto_52171 ) ) ( not ( = ?auto_52170 ?auto_52171 ) ) ( ON ?auto_52171 ?auto_52172 ) ( CLEAR ?auto_52171 ) ( HAND-EMPTY ) ( not ( = ?auto_52169 ?auto_52172 ) ) ( not ( = ?auto_52170 ?auto_52172 ) ) ( not ( = ?auto_52171 ?auto_52172 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52171 ?auto_52172 )
      ( MAKE-3PILE ?auto_52169 ?auto_52170 ?auto_52171 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52173 - BLOCK
      ?auto_52174 - BLOCK
      ?auto_52175 - BLOCK
    )
    :vars
    (
      ?auto_52176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52173 ) ( not ( = ?auto_52173 ?auto_52174 ) ) ( not ( = ?auto_52173 ?auto_52175 ) ) ( not ( = ?auto_52174 ?auto_52175 ) ) ( ON ?auto_52175 ?auto_52176 ) ( CLEAR ?auto_52175 ) ( not ( = ?auto_52173 ?auto_52176 ) ) ( not ( = ?auto_52174 ?auto_52176 ) ) ( not ( = ?auto_52175 ?auto_52176 ) ) ( HOLDING ?auto_52174 ) ( CLEAR ?auto_52173 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52173 ?auto_52174 )
      ( MAKE-3PILE ?auto_52173 ?auto_52174 ?auto_52175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52177 - BLOCK
      ?auto_52178 - BLOCK
      ?auto_52179 - BLOCK
    )
    :vars
    (
      ?auto_52180 - BLOCK
      ?auto_52182 - BLOCK
      ?auto_52181 - BLOCK
      ?auto_52183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52177 ) ( not ( = ?auto_52177 ?auto_52178 ) ) ( not ( = ?auto_52177 ?auto_52179 ) ) ( not ( = ?auto_52178 ?auto_52179 ) ) ( ON ?auto_52179 ?auto_52180 ) ( not ( = ?auto_52177 ?auto_52180 ) ) ( not ( = ?auto_52178 ?auto_52180 ) ) ( not ( = ?auto_52179 ?auto_52180 ) ) ( CLEAR ?auto_52177 ) ( ON ?auto_52178 ?auto_52179 ) ( CLEAR ?auto_52178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52182 ) ( ON ?auto_52181 ?auto_52182 ) ( ON ?auto_52183 ?auto_52181 ) ( ON ?auto_52180 ?auto_52183 ) ( not ( = ?auto_52182 ?auto_52181 ) ) ( not ( = ?auto_52182 ?auto_52183 ) ) ( not ( = ?auto_52182 ?auto_52180 ) ) ( not ( = ?auto_52182 ?auto_52179 ) ) ( not ( = ?auto_52182 ?auto_52178 ) ) ( not ( = ?auto_52181 ?auto_52183 ) ) ( not ( = ?auto_52181 ?auto_52180 ) ) ( not ( = ?auto_52181 ?auto_52179 ) ) ( not ( = ?auto_52181 ?auto_52178 ) ) ( not ( = ?auto_52183 ?auto_52180 ) ) ( not ( = ?auto_52183 ?auto_52179 ) ) ( not ( = ?auto_52183 ?auto_52178 ) ) ( not ( = ?auto_52177 ?auto_52182 ) ) ( not ( = ?auto_52177 ?auto_52181 ) ) ( not ( = ?auto_52177 ?auto_52183 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52182 ?auto_52181 ?auto_52183 ?auto_52180 ?auto_52179 )
      ( MAKE-3PILE ?auto_52177 ?auto_52178 ?auto_52179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52184 - BLOCK
      ?auto_52185 - BLOCK
      ?auto_52186 - BLOCK
    )
    :vars
    (
      ?auto_52188 - BLOCK
      ?auto_52189 - BLOCK
      ?auto_52190 - BLOCK
      ?auto_52187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52184 ?auto_52185 ) ) ( not ( = ?auto_52184 ?auto_52186 ) ) ( not ( = ?auto_52185 ?auto_52186 ) ) ( ON ?auto_52186 ?auto_52188 ) ( not ( = ?auto_52184 ?auto_52188 ) ) ( not ( = ?auto_52185 ?auto_52188 ) ) ( not ( = ?auto_52186 ?auto_52188 ) ) ( ON ?auto_52185 ?auto_52186 ) ( CLEAR ?auto_52185 ) ( ON-TABLE ?auto_52189 ) ( ON ?auto_52190 ?auto_52189 ) ( ON ?auto_52187 ?auto_52190 ) ( ON ?auto_52188 ?auto_52187 ) ( not ( = ?auto_52189 ?auto_52190 ) ) ( not ( = ?auto_52189 ?auto_52187 ) ) ( not ( = ?auto_52189 ?auto_52188 ) ) ( not ( = ?auto_52189 ?auto_52186 ) ) ( not ( = ?auto_52189 ?auto_52185 ) ) ( not ( = ?auto_52190 ?auto_52187 ) ) ( not ( = ?auto_52190 ?auto_52188 ) ) ( not ( = ?auto_52190 ?auto_52186 ) ) ( not ( = ?auto_52190 ?auto_52185 ) ) ( not ( = ?auto_52187 ?auto_52188 ) ) ( not ( = ?auto_52187 ?auto_52186 ) ) ( not ( = ?auto_52187 ?auto_52185 ) ) ( not ( = ?auto_52184 ?auto_52189 ) ) ( not ( = ?auto_52184 ?auto_52190 ) ) ( not ( = ?auto_52184 ?auto_52187 ) ) ( HOLDING ?auto_52184 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52184 )
      ( MAKE-3PILE ?auto_52184 ?auto_52185 ?auto_52186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52191 - BLOCK
      ?auto_52192 - BLOCK
      ?auto_52193 - BLOCK
    )
    :vars
    (
      ?auto_52196 - BLOCK
      ?auto_52195 - BLOCK
      ?auto_52197 - BLOCK
      ?auto_52194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52191 ?auto_52192 ) ) ( not ( = ?auto_52191 ?auto_52193 ) ) ( not ( = ?auto_52192 ?auto_52193 ) ) ( ON ?auto_52193 ?auto_52196 ) ( not ( = ?auto_52191 ?auto_52196 ) ) ( not ( = ?auto_52192 ?auto_52196 ) ) ( not ( = ?auto_52193 ?auto_52196 ) ) ( ON ?auto_52192 ?auto_52193 ) ( ON-TABLE ?auto_52195 ) ( ON ?auto_52197 ?auto_52195 ) ( ON ?auto_52194 ?auto_52197 ) ( ON ?auto_52196 ?auto_52194 ) ( not ( = ?auto_52195 ?auto_52197 ) ) ( not ( = ?auto_52195 ?auto_52194 ) ) ( not ( = ?auto_52195 ?auto_52196 ) ) ( not ( = ?auto_52195 ?auto_52193 ) ) ( not ( = ?auto_52195 ?auto_52192 ) ) ( not ( = ?auto_52197 ?auto_52194 ) ) ( not ( = ?auto_52197 ?auto_52196 ) ) ( not ( = ?auto_52197 ?auto_52193 ) ) ( not ( = ?auto_52197 ?auto_52192 ) ) ( not ( = ?auto_52194 ?auto_52196 ) ) ( not ( = ?auto_52194 ?auto_52193 ) ) ( not ( = ?auto_52194 ?auto_52192 ) ) ( not ( = ?auto_52191 ?auto_52195 ) ) ( not ( = ?auto_52191 ?auto_52197 ) ) ( not ( = ?auto_52191 ?auto_52194 ) ) ( ON ?auto_52191 ?auto_52192 ) ( CLEAR ?auto_52191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52195 ?auto_52197 ?auto_52194 ?auto_52196 ?auto_52193 ?auto_52192 )
      ( MAKE-3PILE ?auto_52191 ?auto_52192 ?auto_52193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52201 - BLOCK
      ?auto_52202 - BLOCK
      ?auto_52203 - BLOCK
    )
    :vars
    (
      ?auto_52204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52204 ?auto_52203 ) ( CLEAR ?auto_52204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52201 ) ( ON ?auto_52202 ?auto_52201 ) ( ON ?auto_52203 ?auto_52202 ) ( not ( = ?auto_52201 ?auto_52202 ) ) ( not ( = ?auto_52201 ?auto_52203 ) ) ( not ( = ?auto_52201 ?auto_52204 ) ) ( not ( = ?auto_52202 ?auto_52203 ) ) ( not ( = ?auto_52202 ?auto_52204 ) ) ( not ( = ?auto_52203 ?auto_52204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52204 ?auto_52203 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52205 - BLOCK
      ?auto_52206 - BLOCK
      ?auto_52207 - BLOCK
    )
    :vars
    (
      ?auto_52208 - BLOCK
      ?auto_52209 - BLOCK
      ?auto_52210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52208 ?auto_52207 ) ( CLEAR ?auto_52208 ) ( ON-TABLE ?auto_52205 ) ( ON ?auto_52206 ?auto_52205 ) ( ON ?auto_52207 ?auto_52206 ) ( not ( = ?auto_52205 ?auto_52206 ) ) ( not ( = ?auto_52205 ?auto_52207 ) ) ( not ( = ?auto_52205 ?auto_52208 ) ) ( not ( = ?auto_52206 ?auto_52207 ) ) ( not ( = ?auto_52206 ?auto_52208 ) ) ( not ( = ?auto_52207 ?auto_52208 ) ) ( HOLDING ?auto_52209 ) ( CLEAR ?auto_52210 ) ( not ( = ?auto_52205 ?auto_52209 ) ) ( not ( = ?auto_52205 ?auto_52210 ) ) ( not ( = ?auto_52206 ?auto_52209 ) ) ( not ( = ?auto_52206 ?auto_52210 ) ) ( not ( = ?auto_52207 ?auto_52209 ) ) ( not ( = ?auto_52207 ?auto_52210 ) ) ( not ( = ?auto_52208 ?auto_52209 ) ) ( not ( = ?auto_52208 ?auto_52210 ) ) ( not ( = ?auto_52209 ?auto_52210 ) ) )
    :subtasks
    ( ( !STACK ?auto_52209 ?auto_52210 )
      ( MAKE-3PILE ?auto_52205 ?auto_52206 ?auto_52207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52211 - BLOCK
      ?auto_52212 - BLOCK
      ?auto_52213 - BLOCK
    )
    :vars
    (
      ?auto_52216 - BLOCK
      ?auto_52214 - BLOCK
      ?auto_52215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52216 ?auto_52213 ) ( ON-TABLE ?auto_52211 ) ( ON ?auto_52212 ?auto_52211 ) ( ON ?auto_52213 ?auto_52212 ) ( not ( = ?auto_52211 ?auto_52212 ) ) ( not ( = ?auto_52211 ?auto_52213 ) ) ( not ( = ?auto_52211 ?auto_52216 ) ) ( not ( = ?auto_52212 ?auto_52213 ) ) ( not ( = ?auto_52212 ?auto_52216 ) ) ( not ( = ?auto_52213 ?auto_52216 ) ) ( CLEAR ?auto_52214 ) ( not ( = ?auto_52211 ?auto_52215 ) ) ( not ( = ?auto_52211 ?auto_52214 ) ) ( not ( = ?auto_52212 ?auto_52215 ) ) ( not ( = ?auto_52212 ?auto_52214 ) ) ( not ( = ?auto_52213 ?auto_52215 ) ) ( not ( = ?auto_52213 ?auto_52214 ) ) ( not ( = ?auto_52216 ?auto_52215 ) ) ( not ( = ?auto_52216 ?auto_52214 ) ) ( not ( = ?auto_52215 ?auto_52214 ) ) ( ON ?auto_52215 ?auto_52216 ) ( CLEAR ?auto_52215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52211 ?auto_52212 ?auto_52213 ?auto_52216 )
      ( MAKE-3PILE ?auto_52211 ?auto_52212 ?auto_52213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52217 - BLOCK
      ?auto_52218 - BLOCK
      ?auto_52219 - BLOCK
    )
    :vars
    (
      ?auto_52221 - BLOCK
      ?auto_52222 - BLOCK
      ?auto_52220 - BLOCK
      ?auto_52223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52221 ?auto_52219 ) ( ON-TABLE ?auto_52217 ) ( ON ?auto_52218 ?auto_52217 ) ( ON ?auto_52219 ?auto_52218 ) ( not ( = ?auto_52217 ?auto_52218 ) ) ( not ( = ?auto_52217 ?auto_52219 ) ) ( not ( = ?auto_52217 ?auto_52221 ) ) ( not ( = ?auto_52218 ?auto_52219 ) ) ( not ( = ?auto_52218 ?auto_52221 ) ) ( not ( = ?auto_52219 ?auto_52221 ) ) ( not ( = ?auto_52217 ?auto_52222 ) ) ( not ( = ?auto_52217 ?auto_52220 ) ) ( not ( = ?auto_52218 ?auto_52222 ) ) ( not ( = ?auto_52218 ?auto_52220 ) ) ( not ( = ?auto_52219 ?auto_52222 ) ) ( not ( = ?auto_52219 ?auto_52220 ) ) ( not ( = ?auto_52221 ?auto_52222 ) ) ( not ( = ?auto_52221 ?auto_52220 ) ) ( not ( = ?auto_52222 ?auto_52220 ) ) ( ON ?auto_52222 ?auto_52221 ) ( CLEAR ?auto_52222 ) ( HOLDING ?auto_52220 ) ( CLEAR ?auto_52223 ) ( ON-TABLE ?auto_52223 ) ( not ( = ?auto_52223 ?auto_52220 ) ) ( not ( = ?auto_52217 ?auto_52223 ) ) ( not ( = ?auto_52218 ?auto_52223 ) ) ( not ( = ?auto_52219 ?auto_52223 ) ) ( not ( = ?auto_52221 ?auto_52223 ) ) ( not ( = ?auto_52222 ?auto_52223 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52223 ?auto_52220 )
      ( MAKE-3PILE ?auto_52217 ?auto_52218 ?auto_52219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52915 - BLOCK
      ?auto_52916 - BLOCK
      ?auto_52917 - BLOCK
    )
    :vars
    (
      ?auto_52920 - BLOCK
      ?auto_52918 - BLOCK
      ?auto_52919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52920 ?auto_52917 ) ( ON-TABLE ?auto_52915 ) ( ON ?auto_52916 ?auto_52915 ) ( ON ?auto_52917 ?auto_52916 ) ( not ( = ?auto_52915 ?auto_52916 ) ) ( not ( = ?auto_52915 ?auto_52917 ) ) ( not ( = ?auto_52915 ?auto_52920 ) ) ( not ( = ?auto_52916 ?auto_52917 ) ) ( not ( = ?auto_52916 ?auto_52920 ) ) ( not ( = ?auto_52917 ?auto_52920 ) ) ( not ( = ?auto_52915 ?auto_52918 ) ) ( not ( = ?auto_52915 ?auto_52919 ) ) ( not ( = ?auto_52916 ?auto_52918 ) ) ( not ( = ?auto_52916 ?auto_52919 ) ) ( not ( = ?auto_52917 ?auto_52918 ) ) ( not ( = ?auto_52917 ?auto_52919 ) ) ( not ( = ?auto_52920 ?auto_52918 ) ) ( not ( = ?auto_52920 ?auto_52919 ) ) ( not ( = ?auto_52918 ?auto_52919 ) ) ( ON ?auto_52918 ?auto_52920 ) ( ON ?auto_52919 ?auto_52918 ) ( CLEAR ?auto_52919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52915 ?auto_52916 ?auto_52917 ?auto_52920 ?auto_52918 )
      ( MAKE-3PILE ?auto_52915 ?auto_52916 ?auto_52917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52231 - BLOCK
      ?auto_52232 - BLOCK
      ?auto_52233 - BLOCK
    )
    :vars
    (
      ?auto_52235 - BLOCK
      ?auto_52234 - BLOCK
      ?auto_52237 - BLOCK
      ?auto_52236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52235 ?auto_52233 ) ( ON-TABLE ?auto_52231 ) ( ON ?auto_52232 ?auto_52231 ) ( ON ?auto_52233 ?auto_52232 ) ( not ( = ?auto_52231 ?auto_52232 ) ) ( not ( = ?auto_52231 ?auto_52233 ) ) ( not ( = ?auto_52231 ?auto_52235 ) ) ( not ( = ?auto_52232 ?auto_52233 ) ) ( not ( = ?auto_52232 ?auto_52235 ) ) ( not ( = ?auto_52233 ?auto_52235 ) ) ( not ( = ?auto_52231 ?auto_52234 ) ) ( not ( = ?auto_52231 ?auto_52237 ) ) ( not ( = ?auto_52232 ?auto_52234 ) ) ( not ( = ?auto_52232 ?auto_52237 ) ) ( not ( = ?auto_52233 ?auto_52234 ) ) ( not ( = ?auto_52233 ?auto_52237 ) ) ( not ( = ?auto_52235 ?auto_52234 ) ) ( not ( = ?auto_52235 ?auto_52237 ) ) ( not ( = ?auto_52234 ?auto_52237 ) ) ( ON ?auto_52234 ?auto_52235 ) ( not ( = ?auto_52236 ?auto_52237 ) ) ( not ( = ?auto_52231 ?auto_52236 ) ) ( not ( = ?auto_52232 ?auto_52236 ) ) ( not ( = ?auto_52233 ?auto_52236 ) ) ( not ( = ?auto_52235 ?auto_52236 ) ) ( not ( = ?auto_52234 ?auto_52236 ) ) ( ON ?auto_52237 ?auto_52234 ) ( CLEAR ?auto_52237 ) ( HOLDING ?auto_52236 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52236 )
      ( MAKE-3PILE ?auto_52231 ?auto_52232 ?auto_52233 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52238 - BLOCK
      ?auto_52239 - BLOCK
      ?auto_52240 - BLOCK
    )
    :vars
    (
      ?auto_52244 - BLOCK
      ?auto_52242 - BLOCK
      ?auto_52243 - BLOCK
      ?auto_52241 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52244 ?auto_52240 ) ( ON-TABLE ?auto_52238 ) ( ON ?auto_52239 ?auto_52238 ) ( ON ?auto_52240 ?auto_52239 ) ( not ( = ?auto_52238 ?auto_52239 ) ) ( not ( = ?auto_52238 ?auto_52240 ) ) ( not ( = ?auto_52238 ?auto_52244 ) ) ( not ( = ?auto_52239 ?auto_52240 ) ) ( not ( = ?auto_52239 ?auto_52244 ) ) ( not ( = ?auto_52240 ?auto_52244 ) ) ( not ( = ?auto_52238 ?auto_52242 ) ) ( not ( = ?auto_52238 ?auto_52243 ) ) ( not ( = ?auto_52239 ?auto_52242 ) ) ( not ( = ?auto_52239 ?auto_52243 ) ) ( not ( = ?auto_52240 ?auto_52242 ) ) ( not ( = ?auto_52240 ?auto_52243 ) ) ( not ( = ?auto_52244 ?auto_52242 ) ) ( not ( = ?auto_52244 ?auto_52243 ) ) ( not ( = ?auto_52242 ?auto_52243 ) ) ( ON ?auto_52242 ?auto_52244 ) ( not ( = ?auto_52241 ?auto_52243 ) ) ( not ( = ?auto_52238 ?auto_52241 ) ) ( not ( = ?auto_52239 ?auto_52241 ) ) ( not ( = ?auto_52240 ?auto_52241 ) ) ( not ( = ?auto_52244 ?auto_52241 ) ) ( not ( = ?auto_52242 ?auto_52241 ) ) ( ON ?auto_52243 ?auto_52242 ) ( ON ?auto_52241 ?auto_52243 ) ( CLEAR ?auto_52241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52238 ?auto_52239 ?auto_52240 ?auto_52244 ?auto_52242 ?auto_52243 )
      ( MAKE-3PILE ?auto_52238 ?auto_52239 ?auto_52240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52249 - BLOCK
      ?auto_52250 - BLOCK
      ?auto_52251 - BLOCK
      ?auto_52252 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52252 ) ( CLEAR ?auto_52251 ) ( ON-TABLE ?auto_52249 ) ( ON ?auto_52250 ?auto_52249 ) ( ON ?auto_52251 ?auto_52250 ) ( not ( = ?auto_52249 ?auto_52250 ) ) ( not ( = ?auto_52249 ?auto_52251 ) ) ( not ( = ?auto_52249 ?auto_52252 ) ) ( not ( = ?auto_52250 ?auto_52251 ) ) ( not ( = ?auto_52250 ?auto_52252 ) ) ( not ( = ?auto_52251 ?auto_52252 ) ) )
    :subtasks
    ( ( !STACK ?auto_52252 ?auto_52251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52253 - BLOCK
      ?auto_52254 - BLOCK
      ?auto_52255 - BLOCK
      ?auto_52256 - BLOCK
    )
    :vars
    (
      ?auto_52257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52255 ) ( ON-TABLE ?auto_52253 ) ( ON ?auto_52254 ?auto_52253 ) ( ON ?auto_52255 ?auto_52254 ) ( not ( = ?auto_52253 ?auto_52254 ) ) ( not ( = ?auto_52253 ?auto_52255 ) ) ( not ( = ?auto_52253 ?auto_52256 ) ) ( not ( = ?auto_52254 ?auto_52255 ) ) ( not ( = ?auto_52254 ?auto_52256 ) ) ( not ( = ?auto_52255 ?auto_52256 ) ) ( ON ?auto_52256 ?auto_52257 ) ( CLEAR ?auto_52256 ) ( HAND-EMPTY ) ( not ( = ?auto_52253 ?auto_52257 ) ) ( not ( = ?auto_52254 ?auto_52257 ) ) ( not ( = ?auto_52255 ?auto_52257 ) ) ( not ( = ?auto_52256 ?auto_52257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52256 ?auto_52257 )
      ( MAKE-4PILE ?auto_52253 ?auto_52254 ?auto_52255 ?auto_52256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52258 - BLOCK
      ?auto_52259 - BLOCK
      ?auto_52260 - BLOCK
      ?auto_52261 - BLOCK
    )
    :vars
    (
      ?auto_52262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52258 ) ( ON ?auto_52259 ?auto_52258 ) ( not ( = ?auto_52258 ?auto_52259 ) ) ( not ( = ?auto_52258 ?auto_52260 ) ) ( not ( = ?auto_52258 ?auto_52261 ) ) ( not ( = ?auto_52259 ?auto_52260 ) ) ( not ( = ?auto_52259 ?auto_52261 ) ) ( not ( = ?auto_52260 ?auto_52261 ) ) ( ON ?auto_52261 ?auto_52262 ) ( CLEAR ?auto_52261 ) ( not ( = ?auto_52258 ?auto_52262 ) ) ( not ( = ?auto_52259 ?auto_52262 ) ) ( not ( = ?auto_52260 ?auto_52262 ) ) ( not ( = ?auto_52261 ?auto_52262 ) ) ( HOLDING ?auto_52260 ) ( CLEAR ?auto_52259 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52258 ?auto_52259 ?auto_52260 )
      ( MAKE-4PILE ?auto_52258 ?auto_52259 ?auto_52260 ?auto_52261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52263 - BLOCK
      ?auto_52264 - BLOCK
      ?auto_52265 - BLOCK
      ?auto_52266 - BLOCK
    )
    :vars
    (
      ?auto_52267 - BLOCK
      ?auto_52269 - BLOCK
      ?auto_52268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52263 ) ( ON ?auto_52264 ?auto_52263 ) ( not ( = ?auto_52263 ?auto_52264 ) ) ( not ( = ?auto_52263 ?auto_52265 ) ) ( not ( = ?auto_52263 ?auto_52266 ) ) ( not ( = ?auto_52264 ?auto_52265 ) ) ( not ( = ?auto_52264 ?auto_52266 ) ) ( not ( = ?auto_52265 ?auto_52266 ) ) ( ON ?auto_52266 ?auto_52267 ) ( not ( = ?auto_52263 ?auto_52267 ) ) ( not ( = ?auto_52264 ?auto_52267 ) ) ( not ( = ?auto_52265 ?auto_52267 ) ) ( not ( = ?auto_52266 ?auto_52267 ) ) ( CLEAR ?auto_52264 ) ( ON ?auto_52265 ?auto_52266 ) ( CLEAR ?auto_52265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52269 ) ( ON ?auto_52268 ?auto_52269 ) ( ON ?auto_52267 ?auto_52268 ) ( not ( = ?auto_52269 ?auto_52268 ) ) ( not ( = ?auto_52269 ?auto_52267 ) ) ( not ( = ?auto_52269 ?auto_52266 ) ) ( not ( = ?auto_52269 ?auto_52265 ) ) ( not ( = ?auto_52268 ?auto_52267 ) ) ( not ( = ?auto_52268 ?auto_52266 ) ) ( not ( = ?auto_52268 ?auto_52265 ) ) ( not ( = ?auto_52263 ?auto_52269 ) ) ( not ( = ?auto_52263 ?auto_52268 ) ) ( not ( = ?auto_52264 ?auto_52269 ) ) ( not ( = ?auto_52264 ?auto_52268 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52269 ?auto_52268 ?auto_52267 ?auto_52266 )
      ( MAKE-4PILE ?auto_52263 ?auto_52264 ?auto_52265 ?auto_52266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52270 - BLOCK
      ?auto_52271 - BLOCK
      ?auto_52272 - BLOCK
      ?auto_52273 - BLOCK
    )
    :vars
    (
      ?auto_52275 - BLOCK
      ?auto_52276 - BLOCK
      ?auto_52274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52270 ) ( not ( = ?auto_52270 ?auto_52271 ) ) ( not ( = ?auto_52270 ?auto_52272 ) ) ( not ( = ?auto_52270 ?auto_52273 ) ) ( not ( = ?auto_52271 ?auto_52272 ) ) ( not ( = ?auto_52271 ?auto_52273 ) ) ( not ( = ?auto_52272 ?auto_52273 ) ) ( ON ?auto_52273 ?auto_52275 ) ( not ( = ?auto_52270 ?auto_52275 ) ) ( not ( = ?auto_52271 ?auto_52275 ) ) ( not ( = ?auto_52272 ?auto_52275 ) ) ( not ( = ?auto_52273 ?auto_52275 ) ) ( ON ?auto_52272 ?auto_52273 ) ( CLEAR ?auto_52272 ) ( ON-TABLE ?auto_52276 ) ( ON ?auto_52274 ?auto_52276 ) ( ON ?auto_52275 ?auto_52274 ) ( not ( = ?auto_52276 ?auto_52274 ) ) ( not ( = ?auto_52276 ?auto_52275 ) ) ( not ( = ?auto_52276 ?auto_52273 ) ) ( not ( = ?auto_52276 ?auto_52272 ) ) ( not ( = ?auto_52274 ?auto_52275 ) ) ( not ( = ?auto_52274 ?auto_52273 ) ) ( not ( = ?auto_52274 ?auto_52272 ) ) ( not ( = ?auto_52270 ?auto_52276 ) ) ( not ( = ?auto_52270 ?auto_52274 ) ) ( not ( = ?auto_52271 ?auto_52276 ) ) ( not ( = ?auto_52271 ?auto_52274 ) ) ( HOLDING ?auto_52271 ) ( CLEAR ?auto_52270 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52270 ?auto_52271 )
      ( MAKE-4PILE ?auto_52270 ?auto_52271 ?auto_52272 ?auto_52273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52277 - BLOCK
      ?auto_52278 - BLOCK
      ?auto_52279 - BLOCK
      ?auto_52280 - BLOCK
    )
    :vars
    (
      ?auto_52282 - BLOCK
      ?auto_52283 - BLOCK
      ?auto_52281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52277 ) ( not ( = ?auto_52277 ?auto_52278 ) ) ( not ( = ?auto_52277 ?auto_52279 ) ) ( not ( = ?auto_52277 ?auto_52280 ) ) ( not ( = ?auto_52278 ?auto_52279 ) ) ( not ( = ?auto_52278 ?auto_52280 ) ) ( not ( = ?auto_52279 ?auto_52280 ) ) ( ON ?auto_52280 ?auto_52282 ) ( not ( = ?auto_52277 ?auto_52282 ) ) ( not ( = ?auto_52278 ?auto_52282 ) ) ( not ( = ?auto_52279 ?auto_52282 ) ) ( not ( = ?auto_52280 ?auto_52282 ) ) ( ON ?auto_52279 ?auto_52280 ) ( ON-TABLE ?auto_52283 ) ( ON ?auto_52281 ?auto_52283 ) ( ON ?auto_52282 ?auto_52281 ) ( not ( = ?auto_52283 ?auto_52281 ) ) ( not ( = ?auto_52283 ?auto_52282 ) ) ( not ( = ?auto_52283 ?auto_52280 ) ) ( not ( = ?auto_52283 ?auto_52279 ) ) ( not ( = ?auto_52281 ?auto_52282 ) ) ( not ( = ?auto_52281 ?auto_52280 ) ) ( not ( = ?auto_52281 ?auto_52279 ) ) ( not ( = ?auto_52277 ?auto_52283 ) ) ( not ( = ?auto_52277 ?auto_52281 ) ) ( not ( = ?auto_52278 ?auto_52283 ) ) ( not ( = ?auto_52278 ?auto_52281 ) ) ( CLEAR ?auto_52277 ) ( ON ?auto_52278 ?auto_52279 ) ( CLEAR ?auto_52278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52283 ?auto_52281 ?auto_52282 ?auto_52280 ?auto_52279 )
      ( MAKE-4PILE ?auto_52277 ?auto_52278 ?auto_52279 ?auto_52280 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52284 - BLOCK
      ?auto_52285 - BLOCK
      ?auto_52286 - BLOCK
      ?auto_52287 - BLOCK
    )
    :vars
    (
      ?auto_52288 - BLOCK
      ?auto_52289 - BLOCK
      ?auto_52290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52284 ?auto_52285 ) ) ( not ( = ?auto_52284 ?auto_52286 ) ) ( not ( = ?auto_52284 ?auto_52287 ) ) ( not ( = ?auto_52285 ?auto_52286 ) ) ( not ( = ?auto_52285 ?auto_52287 ) ) ( not ( = ?auto_52286 ?auto_52287 ) ) ( ON ?auto_52287 ?auto_52288 ) ( not ( = ?auto_52284 ?auto_52288 ) ) ( not ( = ?auto_52285 ?auto_52288 ) ) ( not ( = ?auto_52286 ?auto_52288 ) ) ( not ( = ?auto_52287 ?auto_52288 ) ) ( ON ?auto_52286 ?auto_52287 ) ( ON-TABLE ?auto_52289 ) ( ON ?auto_52290 ?auto_52289 ) ( ON ?auto_52288 ?auto_52290 ) ( not ( = ?auto_52289 ?auto_52290 ) ) ( not ( = ?auto_52289 ?auto_52288 ) ) ( not ( = ?auto_52289 ?auto_52287 ) ) ( not ( = ?auto_52289 ?auto_52286 ) ) ( not ( = ?auto_52290 ?auto_52288 ) ) ( not ( = ?auto_52290 ?auto_52287 ) ) ( not ( = ?auto_52290 ?auto_52286 ) ) ( not ( = ?auto_52284 ?auto_52289 ) ) ( not ( = ?auto_52284 ?auto_52290 ) ) ( not ( = ?auto_52285 ?auto_52289 ) ) ( not ( = ?auto_52285 ?auto_52290 ) ) ( ON ?auto_52285 ?auto_52286 ) ( CLEAR ?auto_52285 ) ( HOLDING ?auto_52284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52284 )
      ( MAKE-4PILE ?auto_52284 ?auto_52285 ?auto_52286 ?auto_52287 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52291 - BLOCK
      ?auto_52292 - BLOCK
      ?auto_52293 - BLOCK
      ?auto_52294 - BLOCK
    )
    :vars
    (
      ?auto_52295 - BLOCK
      ?auto_52297 - BLOCK
      ?auto_52296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52291 ?auto_52292 ) ) ( not ( = ?auto_52291 ?auto_52293 ) ) ( not ( = ?auto_52291 ?auto_52294 ) ) ( not ( = ?auto_52292 ?auto_52293 ) ) ( not ( = ?auto_52292 ?auto_52294 ) ) ( not ( = ?auto_52293 ?auto_52294 ) ) ( ON ?auto_52294 ?auto_52295 ) ( not ( = ?auto_52291 ?auto_52295 ) ) ( not ( = ?auto_52292 ?auto_52295 ) ) ( not ( = ?auto_52293 ?auto_52295 ) ) ( not ( = ?auto_52294 ?auto_52295 ) ) ( ON ?auto_52293 ?auto_52294 ) ( ON-TABLE ?auto_52297 ) ( ON ?auto_52296 ?auto_52297 ) ( ON ?auto_52295 ?auto_52296 ) ( not ( = ?auto_52297 ?auto_52296 ) ) ( not ( = ?auto_52297 ?auto_52295 ) ) ( not ( = ?auto_52297 ?auto_52294 ) ) ( not ( = ?auto_52297 ?auto_52293 ) ) ( not ( = ?auto_52296 ?auto_52295 ) ) ( not ( = ?auto_52296 ?auto_52294 ) ) ( not ( = ?auto_52296 ?auto_52293 ) ) ( not ( = ?auto_52291 ?auto_52297 ) ) ( not ( = ?auto_52291 ?auto_52296 ) ) ( not ( = ?auto_52292 ?auto_52297 ) ) ( not ( = ?auto_52292 ?auto_52296 ) ) ( ON ?auto_52292 ?auto_52293 ) ( ON ?auto_52291 ?auto_52292 ) ( CLEAR ?auto_52291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52297 ?auto_52296 ?auto_52295 ?auto_52294 ?auto_52293 ?auto_52292 )
      ( MAKE-4PILE ?auto_52291 ?auto_52292 ?auto_52293 ?auto_52294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52300 - BLOCK
      ?auto_52301 - BLOCK
    )
    :vars
    (
      ?auto_52302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52302 ?auto_52301 ) ( CLEAR ?auto_52302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52300 ) ( ON ?auto_52301 ?auto_52300 ) ( not ( = ?auto_52300 ?auto_52301 ) ) ( not ( = ?auto_52300 ?auto_52302 ) ) ( not ( = ?auto_52301 ?auto_52302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52302 ?auto_52301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52303 - BLOCK
      ?auto_52304 - BLOCK
    )
    :vars
    (
      ?auto_52305 - BLOCK
      ?auto_52306 - BLOCK
      ?auto_52307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52305 ?auto_52304 ) ( CLEAR ?auto_52305 ) ( ON-TABLE ?auto_52303 ) ( ON ?auto_52304 ?auto_52303 ) ( not ( = ?auto_52303 ?auto_52304 ) ) ( not ( = ?auto_52303 ?auto_52305 ) ) ( not ( = ?auto_52304 ?auto_52305 ) ) ( HOLDING ?auto_52306 ) ( CLEAR ?auto_52307 ) ( not ( = ?auto_52303 ?auto_52306 ) ) ( not ( = ?auto_52303 ?auto_52307 ) ) ( not ( = ?auto_52304 ?auto_52306 ) ) ( not ( = ?auto_52304 ?auto_52307 ) ) ( not ( = ?auto_52305 ?auto_52306 ) ) ( not ( = ?auto_52305 ?auto_52307 ) ) ( not ( = ?auto_52306 ?auto_52307 ) ) )
    :subtasks
    ( ( !STACK ?auto_52306 ?auto_52307 )
      ( MAKE-2PILE ?auto_52303 ?auto_52304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52308 - BLOCK
      ?auto_52309 - BLOCK
    )
    :vars
    (
      ?auto_52310 - BLOCK
      ?auto_52311 - BLOCK
      ?auto_52312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52310 ?auto_52309 ) ( ON-TABLE ?auto_52308 ) ( ON ?auto_52309 ?auto_52308 ) ( not ( = ?auto_52308 ?auto_52309 ) ) ( not ( = ?auto_52308 ?auto_52310 ) ) ( not ( = ?auto_52309 ?auto_52310 ) ) ( CLEAR ?auto_52311 ) ( not ( = ?auto_52308 ?auto_52312 ) ) ( not ( = ?auto_52308 ?auto_52311 ) ) ( not ( = ?auto_52309 ?auto_52312 ) ) ( not ( = ?auto_52309 ?auto_52311 ) ) ( not ( = ?auto_52310 ?auto_52312 ) ) ( not ( = ?auto_52310 ?auto_52311 ) ) ( not ( = ?auto_52312 ?auto_52311 ) ) ( ON ?auto_52312 ?auto_52310 ) ( CLEAR ?auto_52312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52308 ?auto_52309 ?auto_52310 )
      ( MAKE-2PILE ?auto_52308 ?auto_52309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52313 - BLOCK
      ?auto_52314 - BLOCK
    )
    :vars
    (
      ?auto_52317 - BLOCK
      ?auto_52315 - BLOCK
      ?auto_52316 - BLOCK
      ?auto_52319 - BLOCK
      ?auto_52318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52317 ?auto_52314 ) ( ON-TABLE ?auto_52313 ) ( ON ?auto_52314 ?auto_52313 ) ( not ( = ?auto_52313 ?auto_52314 ) ) ( not ( = ?auto_52313 ?auto_52317 ) ) ( not ( = ?auto_52314 ?auto_52317 ) ) ( not ( = ?auto_52313 ?auto_52315 ) ) ( not ( = ?auto_52313 ?auto_52316 ) ) ( not ( = ?auto_52314 ?auto_52315 ) ) ( not ( = ?auto_52314 ?auto_52316 ) ) ( not ( = ?auto_52317 ?auto_52315 ) ) ( not ( = ?auto_52317 ?auto_52316 ) ) ( not ( = ?auto_52315 ?auto_52316 ) ) ( ON ?auto_52315 ?auto_52317 ) ( CLEAR ?auto_52315 ) ( HOLDING ?auto_52316 ) ( CLEAR ?auto_52319 ) ( ON-TABLE ?auto_52318 ) ( ON ?auto_52319 ?auto_52318 ) ( not ( = ?auto_52318 ?auto_52319 ) ) ( not ( = ?auto_52318 ?auto_52316 ) ) ( not ( = ?auto_52319 ?auto_52316 ) ) ( not ( = ?auto_52313 ?auto_52319 ) ) ( not ( = ?auto_52313 ?auto_52318 ) ) ( not ( = ?auto_52314 ?auto_52319 ) ) ( not ( = ?auto_52314 ?auto_52318 ) ) ( not ( = ?auto_52317 ?auto_52319 ) ) ( not ( = ?auto_52317 ?auto_52318 ) ) ( not ( = ?auto_52315 ?auto_52319 ) ) ( not ( = ?auto_52315 ?auto_52318 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52318 ?auto_52319 ?auto_52316 )
      ( MAKE-2PILE ?auto_52313 ?auto_52314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52320 - BLOCK
      ?auto_52321 - BLOCK
    )
    :vars
    (
      ?auto_52325 - BLOCK
      ?auto_52324 - BLOCK
      ?auto_52326 - BLOCK
      ?auto_52323 - BLOCK
      ?auto_52322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52325 ?auto_52321 ) ( ON-TABLE ?auto_52320 ) ( ON ?auto_52321 ?auto_52320 ) ( not ( = ?auto_52320 ?auto_52321 ) ) ( not ( = ?auto_52320 ?auto_52325 ) ) ( not ( = ?auto_52321 ?auto_52325 ) ) ( not ( = ?auto_52320 ?auto_52324 ) ) ( not ( = ?auto_52320 ?auto_52326 ) ) ( not ( = ?auto_52321 ?auto_52324 ) ) ( not ( = ?auto_52321 ?auto_52326 ) ) ( not ( = ?auto_52325 ?auto_52324 ) ) ( not ( = ?auto_52325 ?auto_52326 ) ) ( not ( = ?auto_52324 ?auto_52326 ) ) ( ON ?auto_52324 ?auto_52325 ) ( CLEAR ?auto_52323 ) ( ON-TABLE ?auto_52322 ) ( ON ?auto_52323 ?auto_52322 ) ( not ( = ?auto_52322 ?auto_52323 ) ) ( not ( = ?auto_52322 ?auto_52326 ) ) ( not ( = ?auto_52323 ?auto_52326 ) ) ( not ( = ?auto_52320 ?auto_52323 ) ) ( not ( = ?auto_52320 ?auto_52322 ) ) ( not ( = ?auto_52321 ?auto_52323 ) ) ( not ( = ?auto_52321 ?auto_52322 ) ) ( not ( = ?auto_52325 ?auto_52323 ) ) ( not ( = ?auto_52325 ?auto_52322 ) ) ( not ( = ?auto_52324 ?auto_52323 ) ) ( not ( = ?auto_52324 ?auto_52322 ) ) ( ON ?auto_52326 ?auto_52324 ) ( CLEAR ?auto_52326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52320 ?auto_52321 ?auto_52325 ?auto_52324 )
      ( MAKE-2PILE ?auto_52320 ?auto_52321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52327 - BLOCK
      ?auto_52328 - BLOCK
    )
    :vars
    (
      ?auto_52333 - BLOCK
      ?auto_52332 - BLOCK
      ?auto_52330 - BLOCK
      ?auto_52331 - BLOCK
      ?auto_52329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52333 ?auto_52328 ) ( ON-TABLE ?auto_52327 ) ( ON ?auto_52328 ?auto_52327 ) ( not ( = ?auto_52327 ?auto_52328 ) ) ( not ( = ?auto_52327 ?auto_52333 ) ) ( not ( = ?auto_52328 ?auto_52333 ) ) ( not ( = ?auto_52327 ?auto_52332 ) ) ( not ( = ?auto_52327 ?auto_52330 ) ) ( not ( = ?auto_52328 ?auto_52332 ) ) ( not ( = ?auto_52328 ?auto_52330 ) ) ( not ( = ?auto_52333 ?auto_52332 ) ) ( not ( = ?auto_52333 ?auto_52330 ) ) ( not ( = ?auto_52332 ?auto_52330 ) ) ( ON ?auto_52332 ?auto_52333 ) ( ON-TABLE ?auto_52331 ) ( not ( = ?auto_52331 ?auto_52329 ) ) ( not ( = ?auto_52331 ?auto_52330 ) ) ( not ( = ?auto_52329 ?auto_52330 ) ) ( not ( = ?auto_52327 ?auto_52329 ) ) ( not ( = ?auto_52327 ?auto_52331 ) ) ( not ( = ?auto_52328 ?auto_52329 ) ) ( not ( = ?auto_52328 ?auto_52331 ) ) ( not ( = ?auto_52333 ?auto_52329 ) ) ( not ( = ?auto_52333 ?auto_52331 ) ) ( not ( = ?auto_52332 ?auto_52329 ) ) ( not ( = ?auto_52332 ?auto_52331 ) ) ( ON ?auto_52330 ?auto_52332 ) ( CLEAR ?auto_52330 ) ( HOLDING ?auto_52329 ) ( CLEAR ?auto_52331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52331 ?auto_52329 )
      ( MAKE-2PILE ?auto_52327 ?auto_52328 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53105 - BLOCK
      ?auto_53106 - BLOCK
    )
    :vars
    (
      ?auto_53109 - BLOCK
      ?auto_53108 - BLOCK
      ?auto_53107 - BLOCK
      ?auto_53110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53109 ?auto_53106 ) ( ON-TABLE ?auto_53105 ) ( ON ?auto_53106 ?auto_53105 ) ( not ( = ?auto_53105 ?auto_53106 ) ) ( not ( = ?auto_53105 ?auto_53109 ) ) ( not ( = ?auto_53106 ?auto_53109 ) ) ( not ( = ?auto_53105 ?auto_53108 ) ) ( not ( = ?auto_53105 ?auto_53107 ) ) ( not ( = ?auto_53106 ?auto_53108 ) ) ( not ( = ?auto_53106 ?auto_53107 ) ) ( not ( = ?auto_53109 ?auto_53108 ) ) ( not ( = ?auto_53109 ?auto_53107 ) ) ( not ( = ?auto_53108 ?auto_53107 ) ) ( ON ?auto_53108 ?auto_53109 ) ( not ( = ?auto_53110 ?auto_53107 ) ) ( not ( = ?auto_53105 ?auto_53110 ) ) ( not ( = ?auto_53106 ?auto_53110 ) ) ( not ( = ?auto_53109 ?auto_53110 ) ) ( not ( = ?auto_53108 ?auto_53110 ) ) ( ON ?auto_53107 ?auto_53108 ) ( ON ?auto_53110 ?auto_53107 ) ( CLEAR ?auto_53110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53105 ?auto_53106 ?auto_53109 ?auto_53108 ?auto_53107 )
      ( MAKE-2PILE ?auto_53105 ?auto_53106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52341 - BLOCK
      ?auto_52342 - BLOCK
    )
    :vars
    (
      ?auto_52347 - BLOCK
      ?auto_52344 - BLOCK
      ?auto_52346 - BLOCK
      ?auto_52343 - BLOCK
      ?auto_52345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52347 ?auto_52342 ) ( ON-TABLE ?auto_52341 ) ( ON ?auto_52342 ?auto_52341 ) ( not ( = ?auto_52341 ?auto_52342 ) ) ( not ( = ?auto_52341 ?auto_52347 ) ) ( not ( = ?auto_52342 ?auto_52347 ) ) ( not ( = ?auto_52341 ?auto_52344 ) ) ( not ( = ?auto_52341 ?auto_52346 ) ) ( not ( = ?auto_52342 ?auto_52344 ) ) ( not ( = ?auto_52342 ?auto_52346 ) ) ( not ( = ?auto_52347 ?auto_52344 ) ) ( not ( = ?auto_52347 ?auto_52346 ) ) ( not ( = ?auto_52344 ?auto_52346 ) ) ( ON ?auto_52344 ?auto_52347 ) ( not ( = ?auto_52343 ?auto_52345 ) ) ( not ( = ?auto_52343 ?auto_52346 ) ) ( not ( = ?auto_52345 ?auto_52346 ) ) ( not ( = ?auto_52341 ?auto_52345 ) ) ( not ( = ?auto_52341 ?auto_52343 ) ) ( not ( = ?auto_52342 ?auto_52345 ) ) ( not ( = ?auto_52342 ?auto_52343 ) ) ( not ( = ?auto_52347 ?auto_52345 ) ) ( not ( = ?auto_52347 ?auto_52343 ) ) ( not ( = ?auto_52344 ?auto_52345 ) ) ( not ( = ?auto_52344 ?auto_52343 ) ) ( ON ?auto_52346 ?auto_52344 ) ( ON ?auto_52345 ?auto_52346 ) ( CLEAR ?auto_52345 ) ( HOLDING ?auto_52343 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52343 )
      ( MAKE-2PILE ?auto_52341 ?auto_52342 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52348 - BLOCK
      ?auto_52349 - BLOCK
    )
    :vars
    (
      ?auto_52354 - BLOCK
      ?auto_52351 - BLOCK
      ?auto_52352 - BLOCK
      ?auto_52350 - BLOCK
      ?auto_52353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52354 ?auto_52349 ) ( ON-TABLE ?auto_52348 ) ( ON ?auto_52349 ?auto_52348 ) ( not ( = ?auto_52348 ?auto_52349 ) ) ( not ( = ?auto_52348 ?auto_52354 ) ) ( not ( = ?auto_52349 ?auto_52354 ) ) ( not ( = ?auto_52348 ?auto_52351 ) ) ( not ( = ?auto_52348 ?auto_52352 ) ) ( not ( = ?auto_52349 ?auto_52351 ) ) ( not ( = ?auto_52349 ?auto_52352 ) ) ( not ( = ?auto_52354 ?auto_52351 ) ) ( not ( = ?auto_52354 ?auto_52352 ) ) ( not ( = ?auto_52351 ?auto_52352 ) ) ( ON ?auto_52351 ?auto_52354 ) ( not ( = ?auto_52350 ?auto_52353 ) ) ( not ( = ?auto_52350 ?auto_52352 ) ) ( not ( = ?auto_52353 ?auto_52352 ) ) ( not ( = ?auto_52348 ?auto_52353 ) ) ( not ( = ?auto_52348 ?auto_52350 ) ) ( not ( = ?auto_52349 ?auto_52353 ) ) ( not ( = ?auto_52349 ?auto_52350 ) ) ( not ( = ?auto_52354 ?auto_52353 ) ) ( not ( = ?auto_52354 ?auto_52350 ) ) ( not ( = ?auto_52351 ?auto_52353 ) ) ( not ( = ?auto_52351 ?auto_52350 ) ) ( ON ?auto_52352 ?auto_52351 ) ( ON ?auto_52353 ?auto_52352 ) ( ON ?auto_52350 ?auto_52353 ) ( CLEAR ?auto_52350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52348 ?auto_52349 ?auto_52354 ?auto_52351 ?auto_52352 ?auto_52353 )
      ( MAKE-2PILE ?auto_52348 ?auto_52349 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52360 - BLOCK
      ?auto_52361 - BLOCK
      ?auto_52362 - BLOCK
      ?auto_52363 - BLOCK
      ?auto_52364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52364 ) ( CLEAR ?auto_52363 ) ( ON-TABLE ?auto_52360 ) ( ON ?auto_52361 ?auto_52360 ) ( ON ?auto_52362 ?auto_52361 ) ( ON ?auto_52363 ?auto_52362 ) ( not ( = ?auto_52360 ?auto_52361 ) ) ( not ( = ?auto_52360 ?auto_52362 ) ) ( not ( = ?auto_52360 ?auto_52363 ) ) ( not ( = ?auto_52360 ?auto_52364 ) ) ( not ( = ?auto_52361 ?auto_52362 ) ) ( not ( = ?auto_52361 ?auto_52363 ) ) ( not ( = ?auto_52361 ?auto_52364 ) ) ( not ( = ?auto_52362 ?auto_52363 ) ) ( not ( = ?auto_52362 ?auto_52364 ) ) ( not ( = ?auto_52363 ?auto_52364 ) ) )
    :subtasks
    ( ( !STACK ?auto_52364 ?auto_52363 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52365 - BLOCK
      ?auto_52366 - BLOCK
      ?auto_52367 - BLOCK
      ?auto_52368 - BLOCK
      ?auto_52369 - BLOCK
    )
    :vars
    (
      ?auto_52370 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52368 ) ( ON-TABLE ?auto_52365 ) ( ON ?auto_52366 ?auto_52365 ) ( ON ?auto_52367 ?auto_52366 ) ( ON ?auto_52368 ?auto_52367 ) ( not ( = ?auto_52365 ?auto_52366 ) ) ( not ( = ?auto_52365 ?auto_52367 ) ) ( not ( = ?auto_52365 ?auto_52368 ) ) ( not ( = ?auto_52365 ?auto_52369 ) ) ( not ( = ?auto_52366 ?auto_52367 ) ) ( not ( = ?auto_52366 ?auto_52368 ) ) ( not ( = ?auto_52366 ?auto_52369 ) ) ( not ( = ?auto_52367 ?auto_52368 ) ) ( not ( = ?auto_52367 ?auto_52369 ) ) ( not ( = ?auto_52368 ?auto_52369 ) ) ( ON ?auto_52369 ?auto_52370 ) ( CLEAR ?auto_52369 ) ( HAND-EMPTY ) ( not ( = ?auto_52365 ?auto_52370 ) ) ( not ( = ?auto_52366 ?auto_52370 ) ) ( not ( = ?auto_52367 ?auto_52370 ) ) ( not ( = ?auto_52368 ?auto_52370 ) ) ( not ( = ?auto_52369 ?auto_52370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52369 ?auto_52370 )
      ( MAKE-5PILE ?auto_52365 ?auto_52366 ?auto_52367 ?auto_52368 ?auto_52369 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52371 - BLOCK
      ?auto_52372 - BLOCK
      ?auto_52373 - BLOCK
      ?auto_52374 - BLOCK
      ?auto_52375 - BLOCK
    )
    :vars
    (
      ?auto_52376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52371 ) ( ON ?auto_52372 ?auto_52371 ) ( ON ?auto_52373 ?auto_52372 ) ( not ( = ?auto_52371 ?auto_52372 ) ) ( not ( = ?auto_52371 ?auto_52373 ) ) ( not ( = ?auto_52371 ?auto_52374 ) ) ( not ( = ?auto_52371 ?auto_52375 ) ) ( not ( = ?auto_52372 ?auto_52373 ) ) ( not ( = ?auto_52372 ?auto_52374 ) ) ( not ( = ?auto_52372 ?auto_52375 ) ) ( not ( = ?auto_52373 ?auto_52374 ) ) ( not ( = ?auto_52373 ?auto_52375 ) ) ( not ( = ?auto_52374 ?auto_52375 ) ) ( ON ?auto_52375 ?auto_52376 ) ( CLEAR ?auto_52375 ) ( not ( = ?auto_52371 ?auto_52376 ) ) ( not ( = ?auto_52372 ?auto_52376 ) ) ( not ( = ?auto_52373 ?auto_52376 ) ) ( not ( = ?auto_52374 ?auto_52376 ) ) ( not ( = ?auto_52375 ?auto_52376 ) ) ( HOLDING ?auto_52374 ) ( CLEAR ?auto_52373 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52371 ?auto_52372 ?auto_52373 ?auto_52374 )
      ( MAKE-5PILE ?auto_52371 ?auto_52372 ?auto_52373 ?auto_52374 ?auto_52375 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52377 - BLOCK
      ?auto_52378 - BLOCK
      ?auto_52379 - BLOCK
      ?auto_52380 - BLOCK
      ?auto_52381 - BLOCK
    )
    :vars
    (
      ?auto_52382 - BLOCK
      ?auto_52383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52377 ) ( ON ?auto_52378 ?auto_52377 ) ( ON ?auto_52379 ?auto_52378 ) ( not ( = ?auto_52377 ?auto_52378 ) ) ( not ( = ?auto_52377 ?auto_52379 ) ) ( not ( = ?auto_52377 ?auto_52380 ) ) ( not ( = ?auto_52377 ?auto_52381 ) ) ( not ( = ?auto_52378 ?auto_52379 ) ) ( not ( = ?auto_52378 ?auto_52380 ) ) ( not ( = ?auto_52378 ?auto_52381 ) ) ( not ( = ?auto_52379 ?auto_52380 ) ) ( not ( = ?auto_52379 ?auto_52381 ) ) ( not ( = ?auto_52380 ?auto_52381 ) ) ( ON ?auto_52381 ?auto_52382 ) ( not ( = ?auto_52377 ?auto_52382 ) ) ( not ( = ?auto_52378 ?auto_52382 ) ) ( not ( = ?auto_52379 ?auto_52382 ) ) ( not ( = ?auto_52380 ?auto_52382 ) ) ( not ( = ?auto_52381 ?auto_52382 ) ) ( CLEAR ?auto_52379 ) ( ON ?auto_52380 ?auto_52381 ) ( CLEAR ?auto_52380 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52383 ) ( ON ?auto_52382 ?auto_52383 ) ( not ( = ?auto_52383 ?auto_52382 ) ) ( not ( = ?auto_52383 ?auto_52381 ) ) ( not ( = ?auto_52383 ?auto_52380 ) ) ( not ( = ?auto_52377 ?auto_52383 ) ) ( not ( = ?auto_52378 ?auto_52383 ) ) ( not ( = ?auto_52379 ?auto_52383 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52383 ?auto_52382 ?auto_52381 )
      ( MAKE-5PILE ?auto_52377 ?auto_52378 ?auto_52379 ?auto_52380 ?auto_52381 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52384 - BLOCK
      ?auto_52385 - BLOCK
      ?auto_52386 - BLOCK
      ?auto_52387 - BLOCK
      ?auto_52388 - BLOCK
    )
    :vars
    (
      ?auto_52389 - BLOCK
      ?auto_52390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52384 ) ( ON ?auto_52385 ?auto_52384 ) ( not ( = ?auto_52384 ?auto_52385 ) ) ( not ( = ?auto_52384 ?auto_52386 ) ) ( not ( = ?auto_52384 ?auto_52387 ) ) ( not ( = ?auto_52384 ?auto_52388 ) ) ( not ( = ?auto_52385 ?auto_52386 ) ) ( not ( = ?auto_52385 ?auto_52387 ) ) ( not ( = ?auto_52385 ?auto_52388 ) ) ( not ( = ?auto_52386 ?auto_52387 ) ) ( not ( = ?auto_52386 ?auto_52388 ) ) ( not ( = ?auto_52387 ?auto_52388 ) ) ( ON ?auto_52388 ?auto_52389 ) ( not ( = ?auto_52384 ?auto_52389 ) ) ( not ( = ?auto_52385 ?auto_52389 ) ) ( not ( = ?auto_52386 ?auto_52389 ) ) ( not ( = ?auto_52387 ?auto_52389 ) ) ( not ( = ?auto_52388 ?auto_52389 ) ) ( ON ?auto_52387 ?auto_52388 ) ( CLEAR ?auto_52387 ) ( ON-TABLE ?auto_52390 ) ( ON ?auto_52389 ?auto_52390 ) ( not ( = ?auto_52390 ?auto_52389 ) ) ( not ( = ?auto_52390 ?auto_52388 ) ) ( not ( = ?auto_52390 ?auto_52387 ) ) ( not ( = ?auto_52384 ?auto_52390 ) ) ( not ( = ?auto_52385 ?auto_52390 ) ) ( not ( = ?auto_52386 ?auto_52390 ) ) ( HOLDING ?auto_52386 ) ( CLEAR ?auto_52385 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52384 ?auto_52385 ?auto_52386 )
      ( MAKE-5PILE ?auto_52384 ?auto_52385 ?auto_52386 ?auto_52387 ?auto_52388 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52391 - BLOCK
      ?auto_52392 - BLOCK
      ?auto_52393 - BLOCK
      ?auto_52394 - BLOCK
      ?auto_52395 - BLOCK
    )
    :vars
    (
      ?auto_52396 - BLOCK
      ?auto_52397 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52391 ) ( ON ?auto_52392 ?auto_52391 ) ( not ( = ?auto_52391 ?auto_52392 ) ) ( not ( = ?auto_52391 ?auto_52393 ) ) ( not ( = ?auto_52391 ?auto_52394 ) ) ( not ( = ?auto_52391 ?auto_52395 ) ) ( not ( = ?auto_52392 ?auto_52393 ) ) ( not ( = ?auto_52392 ?auto_52394 ) ) ( not ( = ?auto_52392 ?auto_52395 ) ) ( not ( = ?auto_52393 ?auto_52394 ) ) ( not ( = ?auto_52393 ?auto_52395 ) ) ( not ( = ?auto_52394 ?auto_52395 ) ) ( ON ?auto_52395 ?auto_52396 ) ( not ( = ?auto_52391 ?auto_52396 ) ) ( not ( = ?auto_52392 ?auto_52396 ) ) ( not ( = ?auto_52393 ?auto_52396 ) ) ( not ( = ?auto_52394 ?auto_52396 ) ) ( not ( = ?auto_52395 ?auto_52396 ) ) ( ON ?auto_52394 ?auto_52395 ) ( ON-TABLE ?auto_52397 ) ( ON ?auto_52396 ?auto_52397 ) ( not ( = ?auto_52397 ?auto_52396 ) ) ( not ( = ?auto_52397 ?auto_52395 ) ) ( not ( = ?auto_52397 ?auto_52394 ) ) ( not ( = ?auto_52391 ?auto_52397 ) ) ( not ( = ?auto_52392 ?auto_52397 ) ) ( not ( = ?auto_52393 ?auto_52397 ) ) ( CLEAR ?auto_52392 ) ( ON ?auto_52393 ?auto_52394 ) ( CLEAR ?auto_52393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52397 ?auto_52396 ?auto_52395 ?auto_52394 )
      ( MAKE-5PILE ?auto_52391 ?auto_52392 ?auto_52393 ?auto_52394 ?auto_52395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52398 - BLOCK
      ?auto_52399 - BLOCK
      ?auto_52400 - BLOCK
      ?auto_52401 - BLOCK
      ?auto_52402 - BLOCK
    )
    :vars
    (
      ?auto_52403 - BLOCK
      ?auto_52404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52398 ) ( not ( = ?auto_52398 ?auto_52399 ) ) ( not ( = ?auto_52398 ?auto_52400 ) ) ( not ( = ?auto_52398 ?auto_52401 ) ) ( not ( = ?auto_52398 ?auto_52402 ) ) ( not ( = ?auto_52399 ?auto_52400 ) ) ( not ( = ?auto_52399 ?auto_52401 ) ) ( not ( = ?auto_52399 ?auto_52402 ) ) ( not ( = ?auto_52400 ?auto_52401 ) ) ( not ( = ?auto_52400 ?auto_52402 ) ) ( not ( = ?auto_52401 ?auto_52402 ) ) ( ON ?auto_52402 ?auto_52403 ) ( not ( = ?auto_52398 ?auto_52403 ) ) ( not ( = ?auto_52399 ?auto_52403 ) ) ( not ( = ?auto_52400 ?auto_52403 ) ) ( not ( = ?auto_52401 ?auto_52403 ) ) ( not ( = ?auto_52402 ?auto_52403 ) ) ( ON ?auto_52401 ?auto_52402 ) ( ON-TABLE ?auto_52404 ) ( ON ?auto_52403 ?auto_52404 ) ( not ( = ?auto_52404 ?auto_52403 ) ) ( not ( = ?auto_52404 ?auto_52402 ) ) ( not ( = ?auto_52404 ?auto_52401 ) ) ( not ( = ?auto_52398 ?auto_52404 ) ) ( not ( = ?auto_52399 ?auto_52404 ) ) ( not ( = ?auto_52400 ?auto_52404 ) ) ( ON ?auto_52400 ?auto_52401 ) ( CLEAR ?auto_52400 ) ( HOLDING ?auto_52399 ) ( CLEAR ?auto_52398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52398 ?auto_52399 )
      ( MAKE-5PILE ?auto_52398 ?auto_52399 ?auto_52400 ?auto_52401 ?auto_52402 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52405 - BLOCK
      ?auto_52406 - BLOCK
      ?auto_52407 - BLOCK
      ?auto_52408 - BLOCK
      ?auto_52409 - BLOCK
    )
    :vars
    (
      ?auto_52411 - BLOCK
      ?auto_52410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52405 ) ( not ( = ?auto_52405 ?auto_52406 ) ) ( not ( = ?auto_52405 ?auto_52407 ) ) ( not ( = ?auto_52405 ?auto_52408 ) ) ( not ( = ?auto_52405 ?auto_52409 ) ) ( not ( = ?auto_52406 ?auto_52407 ) ) ( not ( = ?auto_52406 ?auto_52408 ) ) ( not ( = ?auto_52406 ?auto_52409 ) ) ( not ( = ?auto_52407 ?auto_52408 ) ) ( not ( = ?auto_52407 ?auto_52409 ) ) ( not ( = ?auto_52408 ?auto_52409 ) ) ( ON ?auto_52409 ?auto_52411 ) ( not ( = ?auto_52405 ?auto_52411 ) ) ( not ( = ?auto_52406 ?auto_52411 ) ) ( not ( = ?auto_52407 ?auto_52411 ) ) ( not ( = ?auto_52408 ?auto_52411 ) ) ( not ( = ?auto_52409 ?auto_52411 ) ) ( ON ?auto_52408 ?auto_52409 ) ( ON-TABLE ?auto_52410 ) ( ON ?auto_52411 ?auto_52410 ) ( not ( = ?auto_52410 ?auto_52411 ) ) ( not ( = ?auto_52410 ?auto_52409 ) ) ( not ( = ?auto_52410 ?auto_52408 ) ) ( not ( = ?auto_52405 ?auto_52410 ) ) ( not ( = ?auto_52406 ?auto_52410 ) ) ( not ( = ?auto_52407 ?auto_52410 ) ) ( ON ?auto_52407 ?auto_52408 ) ( CLEAR ?auto_52405 ) ( ON ?auto_52406 ?auto_52407 ) ( CLEAR ?auto_52406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52410 ?auto_52411 ?auto_52409 ?auto_52408 ?auto_52407 )
      ( MAKE-5PILE ?auto_52405 ?auto_52406 ?auto_52407 ?auto_52408 ?auto_52409 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52412 - BLOCK
      ?auto_52413 - BLOCK
      ?auto_52414 - BLOCK
      ?auto_52415 - BLOCK
      ?auto_52416 - BLOCK
    )
    :vars
    (
      ?auto_52418 - BLOCK
      ?auto_52417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52412 ?auto_52413 ) ) ( not ( = ?auto_52412 ?auto_52414 ) ) ( not ( = ?auto_52412 ?auto_52415 ) ) ( not ( = ?auto_52412 ?auto_52416 ) ) ( not ( = ?auto_52413 ?auto_52414 ) ) ( not ( = ?auto_52413 ?auto_52415 ) ) ( not ( = ?auto_52413 ?auto_52416 ) ) ( not ( = ?auto_52414 ?auto_52415 ) ) ( not ( = ?auto_52414 ?auto_52416 ) ) ( not ( = ?auto_52415 ?auto_52416 ) ) ( ON ?auto_52416 ?auto_52418 ) ( not ( = ?auto_52412 ?auto_52418 ) ) ( not ( = ?auto_52413 ?auto_52418 ) ) ( not ( = ?auto_52414 ?auto_52418 ) ) ( not ( = ?auto_52415 ?auto_52418 ) ) ( not ( = ?auto_52416 ?auto_52418 ) ) ( ON ?auto_52415 ?auto_52416 ) ( ON-TABLE ?auto_52417 ) ( ON ?auto_52418 ?auto_52417 ) ( not ( = ?auto_52417 ?auto_52418 ) ) ( not ( = ?auto_52417 ?auto_52416 ) ) ( not ( = ?auto_52417 ?auto_52415 ) ) ( not ( = ?auto_52412 ?auto_52417 ) ) ( not ( = ?auto_52413 ?auto_52417 ) ) ( not ( = ?auto_52414 ?auto_52417 ) ) ( ON ?auto_52414 ?auto_52415 ) ( ON ?auto_52413 ?auto_52414 ) ( CLEAR ?auto_52413 ) ( HOLDING ?auto_52412 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52412 )
      ( MAKE-5PILE ?auto_52412 ?auto_52413 ?auto_52414 ?auto_52415 ?auto_52416 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_52419 - BLOCK
      ?auto_52420 - BLOCK
      ?auto_52421 - BLOCK
      ?auto_52422 - BLOCK
      ?auto_52423 - BLOCK
    )
    :vars
    (
      ?auto_52424 - BLOCK
      ?auto_52425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52419 ?auto_52420 ) ) ( not ( = ?auto_52419 ?auto_52421 ) ) ( not ( = ?auto_52419 ?auto_52422 ) ) ( not ( = ?auto_52419 ?auto_52423 ) ) ( not ( = ?auto_52420 ?auto_52421 ) ) ( not ( = ?auto_52420 ?auto_52422 ) ) ( not ( = ?auto_52420 ?auto_52423 ) ) ( not ( = ?auto_52421 ?auto_52422 ) ) ( not ( = ?auto_52421 ?auto_52423 ) ) ( not ( = ?auto_52422 ?auto_52423 ) ) ( ON ?auto_52423 ?auto_52424 ) ( not ( = ?auto_52419 ?auto_52424 ) ) ( not ( = ?auto_52420 ?auto_52424 ) ) ( not ( = ?auto_52421 ?auto_52424 ) ) ( not ( = ?auto_52422 ?auto_52424 ) ) ( not ( = ?auto_52423 ?auto_52424 ) ) ( ON ?auto_52422 ?auto_52423 ) ( ON-TABLE ?auto_52425 ) ( ON ?auto_52424 ?auto_52425 ) ( not ( = ?auto_52425 ?auto_52424 ) ) ( not ( = ?auto_52425 ?auto_52423 ) ) ( not ( = ?auto_52425 ?auto_52422 ) ) ( not ( = ?auto_52419 ?auto_52425 ) ) ( not ( = ?auto_52420 ?auto_52425 ) ) ( not ( = ?auto_52421 ?auto_52425 ) ) ( ON ?auto_52421 ?auto_52422 ) ( ON ?auto_52420 ?auto_52421 ) ( ON ?auto_52419 ?auto_52420 ) ( CLEAR ?auto_52419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52425 ?auto_52424 ?auto_52423 ?auto_52422 ?auto_52421 ?auto_52420 )
      ( MAKE-5PILE ?auto_52419 ?auto_52420 ?auto_52421 ?auto_52422 ?auto_52423 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52427 - BLOCK
    )
    :vars
    (
      ?auto_52428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52428 ?auto_52427 ) ( CLEAR ?auto_52428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52427 ) ( not ( = ?auto_52427 ?auto_52428 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52428 ?auto_52427 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52429 - BLOCK
    )
    :vars
    (
      ?auto_52430 - BLOCK
      ?auto_52431 - BLOCK
      ?auto_52432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52430 ?auto_52429 ) ( CLEAR ?auto_52430 ) ( ON-TABLE ?auto_52429 ) ( not ( = ?auto_52429 ?auto_52430 ) ) ( HOLDING ?auto_52431 ) ( CLEAR ?auto_52432 ) ( not ( = ?auto_52429 ?auto_52431 ) ) ( not ( = ?auto_52429 ?auto_52432 ) ) ( not ( = ?auto_52430 ?auto_52431 ) ) ( not ( = ?auto_52430 ?auto_52432 ) ) ( not ( = ?auto_52431 ?auto_52432 ) ) )
    :subtasks
    ( ( !STACK ?auto_52431 ?auto_52432 )
      ( MAKE-1PILE ?auto_52429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52433 - BLOCK
    )
    :vars
    (
      ?auto_52434 - BLOCK
      ?auto_52436 - BLOCK
      ?auto_52435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52434 ?auto_52433 ) ( ON-TABLE ?auto_52433 ) ( not ( = ?auto_52433 ?auto_52434 ) ) ( CLEAR ?auto_52436 ) ( not ( = ?auto_52433 ?auto_52435 ) ) ( not ( = ?auto_52433 ?auto_52436 ) ) ( not ( = ?auto_52434 ?auto_52435 ) ) ( not ( = ?auto_52434 ?auto_52436 ) ) ( not ( = ?auto_52435 ?auto_52436 ) ) ( ON ?auto_52435 ?auto_52434 ) ( CLEAR ?auto_52435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52433 ?auto_52434 )
      ( MAKE-1PILE ?auto_52433 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52437 - BLOCK
    )
    :vars
    (
      ?auto_52440 - BLOCK
      ?auto_52438 - BLOCK
      ?auto_52439 - BLOCK
      ?auto_52441 - BLOCK
      ?auto_52442 - BLOCK
      ?auto_52443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52440 ?auto_52437 ) ( ON-TABLE ?auto_52437 ) ( not ( = ?auto_52437 ?auto_52440 ) ) ( not ( = ?auto_52437 ?auto_52438 ) ) ( not ( = ?auto_52437 ?auto_52439 ) ) ( not ( = ?auto_52440 ?auto_52438 ) ) ( not ( = ?auto_52440 ?auto_52439 ) ) ( not ( = ?auto_52438 ?auto_52439 ) ) ( ON ?auto_52438 ?auto_52440 ) ( CLEAR ?auto_52438 ) ( HOLDING ?auto_52439 ) ( CLEAR ?auto_52441 ) ( ON-TABLE ?auto_52442 ) ( ON ?auto_52443 ?auto_52442 ) ( ON ?auto_52441 ?auto_52443 ) ( not ( = ?auto_52442 ?auto_52443 ) ) ( not ( = ?auto_52442 ?auto_52441 ) ) ( not ( = ?auto_52442 ?auto_52439 ) ) ( not ( = ?auto_52443 ?auto_52441 ) ) ( not ( = ?auto_52443 ?auto_52439 ) ) ( not ( = ?auto_52441 ?auto_52439 ) ) ( not ( = ?auto_52437 ?auto_52441 ) ) ( not ( = ?auto_52437 ?auto_52442 ) ) ( not ( = ?auto_52437 ?auto_52443 ) ) ( not ( = ?auto_52440 ?auto_52441 ) ) ( not ( = ?auto_52440 ?auto_52442 ) ) ( not ( = ?auto_52440 ?auto_52443 ) ) ( not ( = ?auto_52438 ?auto_52441 ) ) ( not ( = ?auto_52438 ?auto_52442 ) ) ( not ( = ?auto_52438 ?auto_52443 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52442 ?auto_52443 ?auto_52441 ?auto_52439 )
      ( MAKE-1PILE ?auto_52437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52444 - BLOCK
    )
    :vars
    (
      ?auto_52445 - BLOCK
      ?auto_52447 - BLOCK
      ?auto_52446 - BLOCK
      ?auto_52448 - BLOCK
      ?auto_52449 - BLOCK
      ?auto_52450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52445 ?auto_52444 ) ( ON-TABLE ?auto_52444 ) ( not ( = ?auto_52444 ?auto_52445 ) ) ( not ( = ?auto_52444 ?auto_52447 ) ) ( not ( = ?auto_52444 ?auto_52446 ) ) ( not ( = ?auto_52445 ?auto_52447 ) ) ( not ( = ?auto_52445 ?auto_52446 ) ) ( not ( = ?auto_52447 ?auto_52446 ) ) ( ON ?auto_52447 ?auto_52445 ) ( CLEAR ?auto_52448 ) ( ON-TABLE ?auto_52449 ) ( ON ?auto_52450 ?auto_52449 ) ( ON ?auto_52448 ?auto_52450 ) ( not ( = ?auto_52449 ?auto_52450 ) ) ( not ( = ?auto_52449 ?auto_52448 ) ) ( not ( = ?auto_52449 ?auto_52446 ) ) ( not ( = ?auto_52450 ?auto_52448 ) ) ( not ( = ?auto_52450 ?auto_52446 ) ) ( not ( = ?auto_52448 ?auto_52446 ) ) ( not ( = ?auto_52444 ?auto_52448 ) ) ( not ( = ?auto_52444 ?auto_52449 ) ) ( not ( = ?auto_52444 ?auto_52450 ) ) ( not ( = ?auto_52445 ?auto_52448 ) ) ( not ( = ?auto_52445 ?auto_52449 ) ) ( not ( = ?auto_52445 ?auto_52450 ) ) ( not ( = ?auto_52447 ?auto_52448 ) ) ( not ( = ?auto_52447 ?auto_52449 ) ) ( not ( = ?auto_52447 ?auto_52450 ) ) ( ON ?auto_52446 ?auto_52447 ) ( CLEAR ?auto_52446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52444 ?auto_52445 ?auto_52447 )
      ( MAKE-1PILE ?auto_52444 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52451 - BLOCK
    )
    :vars
    (
      ?auto_52452 - BLOCK
      ?auto_52454 - BLOCK
      ?auto_52453 - BLOCK
      ?auto_52457 - BLOCK
      ?auto_52456 - BLOCK
      ?auto_52455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52452 ?auto_52451 ) ( ON-TABLE ?auto_52451 ) ( not ( = ?auto_52451 ?auto_52452 ) ) ( not ( = ?auto_52451 ?auto_52454 ) ) ( not ( = ?auto_52451 ?auto_52453 ) ) ( not ( = ?auto_52452 ?auto_52454 ) ) ( not ( = ?auto_52452 ?auto_52453 ) ) ( not ( = ?auto_52454 ?auto_52453 ) ) ( ON ?auto_52454 ?auto_52452 ) ( ON-TABLE ?auto_52457 ) ( ON ?auto_52456 ?auto_52457 ) ( not ( = ?auto_52457 ?auto_52456 ) ) ( not ( = ?auto_52457 ?auto_52455 ) ) ( not ( = ?auto_52457 ?auto_52453 ) ) ( not ( = ?auto_52456 ?auto_52455 ) ) ( not ( = ?auto_52456 ?auto_52453 ) ) ( not ( = ?auto_52455 ?auto_52453 ) ) ( not ( = ?auto_52451 ?auto_52455 ) ) ( not ( = ?auto_52451 ?auto_52457 ) ) ( not ( = ?auto_52451 ?auto_52456 ) ) ( not ( = ?auto_52452 ?auto_52455 ) ) ( not ( = ?auto_52452 ?auto_52457 ) ) ( not ( = ?auto_52452 ?auto_52456 ) ) ( not ( = ?auto_52454 ?auto_52455 ) ) ( not ( = ?auto_52454 ?auto_52457 ) ) ( not ( = ?auto_52454 ?auto_52456 ) ) ( ON ?auto_52453 ?auto_52454 ) ( CLEAR ?auto_52453 ) ( HOLDING ?auto_52455 ) ( CLEAR ?auto_52456 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52457 ?auto_52456 ?auto_52455 )
      ( MAKE-1PILE ?auto_52451 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52458 - BLOCK
    )
    :vars
    (
      ?auto_52464 - BLOCK
      ?auto_52461 - BLOCK
      ?auto_52460 - BLOCK
      ?auto_52462 - BLOCK
      ?auto_52459 - BLOCK
      ?auto_52463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52464 ?auto_52458 ) ( ON-TABLE ?auto_52458 ) ( not ( = ?auto_52458 ?auto_52464 ) ) ( not ( = ?auto_52458 ?auto_52461 ) ) ( not ( = ?auto_52458 ?auto_52460 ) ) ( not ( = ?auto_52464 ?auto_52461 ) ) ( not ( = ?auto_52464 ?auto_52460 ) ) ( not ( = ?auto_52461 ?auto_52460 ) ) ( ON ?auto_52461 ?auto_52464 ) ( ON-TABLE ?auto_52462 ) ( ON ?auto_52459 ?auto_52462 ) ( not ( = ?auto_52462 ?auto_52459 ) ) ( not ( = ?auto_52462 ?auto_52463 ) ) ( not ( = ?auto_52462 ?auto_52460 ) ) ( not ( = ?auto_52459 ?auto_52463 ) ) ( not ( = ?auto_52459 ?auto_52460 ) ) ( not ( = ?auto_52463 ?auto_52460 ) ) ( not ( = ?auto_52458 ?auto_52463 ) ) ( not ( = ?auto_52458 ?auto_52462 ) ) ( not ( = ?auto_52458 ?auto_52459 ) ) ( not ( = ?auto_52464 ?auto_52463 ) ) ( not ( = ?auto_52464 ?auto_52462 ) ) ( not ( = ?auto_52464 ?auto_52459 ) ) ( not ( = ?auto_52461 ?auto_52463 ) ) ( not ( = ?auto_52461 ?auto_52462 ) ) ( not ( = ?auto_52461 ?auto_52459 ) ) ( ON ?auto_52460 ?auto_52461 ) ( CLEAR ?auto_52459 ) ( ON ?auto_52463 ?auto_52460 ) ( CLEAR ?auto_52463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52458 ?auto_52464 ?auto_52461 ?auto_52460 )
      ( MAKE-1PILE ?auto_52458 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52465 - BLOCK
    )
    :vars
    (
      ?auto_52467 - BLOCK
      ?auto_52466 - BLOCK
      ?auto_52470 - BLOCK
      ?auto_52469 - BLOCK
      ?auto_52468 - BLOCK
      ?auto_52471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52467 ?auto_52465 ) ( ON-TABLE ?auto_52465 ) ( not ( = ?auto_52465 ?auto_52467 ) ) ( not ( = ?auto_52465 ?auto_52466 ) ) ( not ( = ?auto_52465 ?auto_52470 ) ) ( not ( = ?auto_52467 ?auto_52466 ) ) ( not ( = ?auto_52467 ?auto_52470 ) ) ( not ( = ?auto_52466 ?auto_52470 ) ) ( ON ?auto_52466 ?auto_52467 ) ( ON-TABLE ?auto_52469 ) ( not ( = ?auto_52469 ?auto_52468 ) ) ( not ( = ?auto_52469 ?auto_52471 ) ) ( not ( = ?auto_52469 ?auto_52470 ) ) ( not ( = ?auto_52468 ?auto_52471 ) ) ( not ( = ?auto_52468 ?auto_52470 ) ) ( not ( = ?auto_52471 ?auto_52470 ) ) ( not ( = ?auto_52465 ?auto_52471 ) ) ( not ( = ?auto_52465 ?auto_52469 ) ) ( not ( = ?auto_52465 ?auto_52468 ) ) ( not ( = ?auto_52467 ?auto_52471 ) ) ( not ( = ?auto_52467 ?auto_52469 ) ) ( not ( = ?auto_52467 ?auto_52468 ) ) ( not ( = ?auto_52466 ?auto_52471 ) ) ( not ( = ?auto_52466 ?auto_52469 ) ) ( not ( = ?auto_52466 ?auto_52468 ) ) ( ON ?auto_52470 ?auto_52466 ) ( ON ?auto_52471 ?auto_52470 ) ( CLEAR ?auto_52471 ) ( HOLDING ?auto_52468 ) ( CLEAR ?auto_52469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52469 ?auto_52468 )
      ( MAKE-1PILE ?auto_52465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53318 - BLOCK
    )
    :vars
    (
      ?auto_53323 - BLOCK
      ?auto_53322 - BLOCK
      ?auto_53321 - BLOCK
      ?auto_53320 - BLOCK
      ?auto_53319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53323 ?auto_53318 ) ( ON-TABLE ?auto_53318 ) ( not ( = ?auto_53318 ?auto_53323 ) ) ( not ( = ?auto_53318 ?auto_53322 ) ) ( not ( = ?auto_53318 ?auto_53321 ) ) ( not ( = ?auto_53323 ?auto_53322 ) ) ( not ( = ?auto_53323 ?auto_53321 ) ) ( not ( = ?auto_53322 ?auto_53321 ) ) ( ON ?auto_53322 ?auto_53323 ) ( not ( = ?auto_53320 ?auto_53319 ) ) ( not ( = ?auto_53320 ?auto_53321 ) ) ( not ( = ?auto_53319 ?auto_53321 ) ) ( not ( = ?auto_53318 ?auto_53319 ) ) ( not ( = ?auto_53318 ?auto_53320 ) ) ( not ( = ?auto_53323 ?auto_53319 ) ) ( not ( = ?auto_53323 ?auto_53320 ) ) ( not ( = ?auto_53322 ?auto_53319 ) ) ( not ( = ?auto_53322 ?auto_53320 ) ) ( ON ?auto_53321 ?auto_53322 ) ( ON ?auto_53319 ?auto_53321 ) ( ON ?auto_53320 ?auto_53319 ) ( CLEAR ?auto_53320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53318 ?auto_53323 ?auto_53322 ?auto_53321 ?auto_53319 )
      ( MAKE-1PILE ?auto_53318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52479 - BLOCK
    )
    :vars
    (
      ?auto_52484 - BLOCK
      ?auto_52485 - BLOCK
      ?auto_52480 - BLOCK
      ?auto_52481 - BLOCK
      ?auto_52482 - BLOCK
      ?auto_52483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52484 ?auto_52479 ) ( ON-TABLE ?auto_52479 ) ( not ( = ?auto_52479 ?auto_52484 ) ) ( not ( = ?auto_52479 ?auto_52485 ) ) ( not ( = ?auto_52479 ?auto_52480 ) ) ( not ( = ?auto_52484 ?auto_52485 ) ) ( not ( = ?auto_52484 ?auto_52480 ) ) ( not ( = ?auto_52485 ?auto_52480 ) ) ( ON ?auto_52485 ?auto_52484 ) ( not ( = ?auto_52481 ?auto_52482 ) ) ( not ( = ?auto_52481 ?auto_52483 ) ) ( not ( = ?auto_52481 ?auto_52480 ) ) ( not ( = ?auto_52482 ?auto_52483 ) ) ( not ( = ?auto_52482 ?auto_52480 ) ) ( not ( = ?auto_52483 ?auto_52480 ) ) ( not ( = ?auto_52479 ?auto_52483 ) ) ( not ( = ?auto_52479 ?auto_52481 ) ) ( not ( = ?auto_52479 ?auto_52482 ) ) ( not ( = ?auto_52484 ?auto_52483 ) ) ( not ( = ?auto_52484 ?auto_52481 ) ) ( not ( = ?auto_52484 ?auto_52482 ) ) ( not ( = ?auto_52485 ?auto_52483 ) ) ( not ( = ?auto_52485 ?auto_52481 ) ) ( not ( = ?auto_52485 ?auto_52482 ) ) ( ON ?auto_52480 ?auto_52485 ) ( ON ?auto_52483 ?auto_52480 ) ( ON ?auto_52482 ?auto_52483 ) ( CLEAR ?auto_52482 ) ( HOLDING ?auto_52481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52481 )
      ( MAKE-1PILE ?auto_52479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52486 - BLOCK
    )
    :vars
    (
      ?auto_52488 - BLOCK
      ?auto_52489 - BLOCK
      ?auto_52487 - BLOCK
      ?auto_52492 - BLOCK
      ?auto_52491 - BLOCK
      ?auto_52490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52488 ?auto_52486 ) ( ON-TABLE ?auto_52486 ) ( not ( = ?auto_52486 ?auto_52488 ) ) ( not ( = ?auto_52486 ?auto_52489 ) ) ( not ( = ?auto_52486 ?auto_52487 ) ) ( not ( = ?auto_52488 ?auto_52489 ) ) ( not ( = ?auto_52488 ?auto_52487 ) ) ( not ( = ?auto_52489 ?auto_52487 ) ) ( ON ?auto_52489 ?auto_52488 ) ( not ( = ?auto_52492 ?auto_52491 ) ) ( not ( = ?auto_52492 ?auto_52490 ) ) ( not ( = ?auto_52492 ?auto_52487 ) ) ( not ( = ?auto_52491 ?auto_52490 ) ) ( not ( = ?auto_52491 ?auto_52487 ) ) ( not ( = ?auto_52490 ?auto_52487 ) ) ( not ( = ?auto_52486 ?auto_52490 ) ) ( not ( = ?auto_52486 ?auto_52492 ) ) ( not ( = ?auto_52486 ?auto_52491 ) ) ( not ( = ?auto_52488 ?auto_52490 ) ) ( not ( = ?auto_52488 ?auto_52492 ) ) ( not ( = ?auto_52488 ?auto_52491 ) ) ( not ( = ?auto_52489 ?auto_52490 ) ) ( not ( = ?auto_52489 ?auto_52492 ) ) ( not ( = ?auto_52489 ?auto_52491 ) ) ( ON ?auto_52487 ?auto_52489 ) ( ON ?auto_52490 ?auto_52487 ) ( ON ?auto_52491 ?auto_52490 ) ( ON ?auto_52492 ?auto_52491 ) ( CLEAR ?auto_52492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52486 ?auto_52488 ?auto_52489 ?auto_52487 ?auto_52490 ?auto_52491 )
      ( MAKE-1PILE ?auto_52486 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52499 - BLOCK
      ?auto_52500 - BLOCK
      ?auto_52501 - BLOCK
      ?auto_52502 - BLOCK
      ?auto_52503 - BLOCK
      ?auto_52504 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_52504 ) ( CLEAR ?auto_52503 ) ( ON-TABLE ?auto_52499 ) ( ON ?auto_52500 ?auto_52499 ) ( ON ?auto_52501 ?auto_52500 ) ( ON ?auto_52502 ?auto_52501 ) ( ON ?auto_52503 ?auto_52502 ) ( not ( = ?auto_52499 ?auto_52500 ) ) ( not ( = ?auto_52499 ?auto_52501 ) ) ( not ( = ?auto_52499 ?auto_52502 ) ) ( not ( = ?auto_52499 ?auto_52503 ) ) ( not ( = ?auto_52499 ?auto_52504 ) ) ( not ( = ?auto_52500 ?auto_52501 ) ) ( not ( = ?auto_52500 ?auto_52502 ) ) ( not ( = ?auto_52500 ?auto_52503 ) ) ( not ( = ?auto_52500 ?auto_52504 ) ) ( not ( = ?auto_52501 ?auto_52502 ) ) ( not ( = ?auto_52501 ?auto_52503 ) ) ( not ( = ?auto_52501 ?auto_52504 ) ) ( not ( = ?auto_52502 ?auto_52503 ) ) ( not ( = ?auto_52502 ?auto_52504 ) ) ( not ( = ?auto_52503 ?auto_52504 ) ) )
    :subtasks
    ( ( !STACK ?auto_52504 ?auto_52503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52505 - BLOCK
      ?auto_52506 - BLOCK
      ?auto_52507 - BLOCK
      ?auto_52508 - BLOCK
      ?auto_52509 - BLOCK
      ?auto_52510 - BLOCK
    )
    :vars
    (
      ?auto_52511 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_52509 ) ( ON-TABLE ?auto_52505 ) ( ON ?auto_52506 ?auto_52505 ) ( ON ?auto_52507 ?auto_52506 ) ( ON ?auto_52508 ?auto_52507 ) ( ON ?auto_52509 ?auto_52508 ) ( not ( = ?auto_52505 ?auto_52506 ) ) ( not ( = ?auto_52505 ?auto_52507 ) ) ( not ( = ?auto_52505 ?auto_52508 ) ) ( not ( = ?auto_52505 ?auto_52509 ) ) ( not ( = ?auto_52505 ?auto_52510 ) ) ( not ( = ?auto_52506 ?auto_52507 ) ) ( not ( = ?auto_52506 ?auto_52508 ) ) ( not ( = ?auto_52506 ?auto_52509 ) ) ( not ( = ?auto_52506 ?auto_52510 ) ) ( not ( = ?auto_52507 ?auto_52508 ) ) ( not ( = ?auto_52507 ?auto_52509 ) ) ( not ( = ?auto_52507 ?auto_52510 ) ) ( not ( = ?auto_52508 ?auto_52509 ) ) ( not ( = ?auto_52508 ?auto_52510 ) ) ( not ( = ?auto_52509 ?auto_52510 ) ) ( ON ?auto_52510 ?auto_52511 ) ( CLEAR ?auto_52510 ) ( HAND-EMPTY ) ( not ( = ?auto_52505 ?auto_52511 ) ) ( not ( = ?auto_52506 ?auto_52511 ) ) ( not ( = ?auto_52507 ?auto_52511 ) ) ( not ( = ?auto_52508 ?auto_52511 ) ) ( not ( = ?auto_52509 ?auto_52511 ) ) ( not ( = ?auto_52510 ?auto_52511 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52510 ?auto_52511 )
      ( MAKE-6PILE ?auto_52505 ?auto_52506 ?auto_52507 ?auto_52508 ?auto_52509 ?auto_52510 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52512 - BLOCK
      ?auto_52513 - BLOCK
      ?auto_52514 - BLOCK
      ?auto_52515 - BLOCK
      ?auto_52516 - BLOCK
      ?auto_52517 - BLOCK
    )
    :vars
    (
      ?auto_52518 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52512 ) ( ON ?auto_52513 ?auto_52512 ) ( ON ?auto_52514 ?auto_52513 ) ( ON ?auto_52515 ?auto_52514 ) ( not ( = ?auto_52512 ?auto_52513 ) ) ( not ( = ?auto_52512 ?auto_52514 ) ) ( not ( = ?auto_52512 ?auto_52515 ) ) ( not ( = ?auto_52512 ?auto_52516 ) ) ( not ( = ?auto_52512 ?auto_52517 ) ) ( not ( = ?auto_52513 ?auto_52514 ) ) ( not ( = ?auto_52513 ?auto_52515 ) ) ( not ( = ?auto_52513 ?auto_52516 ) ) ( not ( = ?auto_52513 ?auto_52517 ) ) ( not ( = ?auto_52514 ?auto_52515 ) ) ( not ( = ?auto_52514 ?auto_52516 ) ) ( not ( = ?auto_52514 ?auto_52517 ) ) ( not ( = ?auto_52515 ?auto_52516 ) ) ( not ( = ?auto_52515 ?auto_52517 ) ) ( not ( = ?auto_52516 ?auto_52517 ) ) ( ON ?auto_52517 ?auto_52518 ) ( CLEAR ?auto_52517 ) ( not ( = ?auto_52512 ?auto_52518 ) ) ( not ( = ?auto_52513 ?auto_52518 ) ) ( not ( = ?auto_52514 ?auto_52518 ) ) ( not ( = ?auto_52515 ?auto_52518 ) ) ( not ( = ?auto_52516 ?auto_52518 ) ) ( not ( = ?auto_52517 ?auto_52518 ) ) ( HOLDING ?auto_52516 ) ( CLEAR ?auto_52515 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52512 ?auto_52513 ?auto_52514 ?auto_52515 ?auto_52516 )
      ( MAKE-6PILE ?auto_52512 ?auto_52513 ?auto_52514 ?auto_52515 ?auto_52516 ?auto_52517 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52519 - BLOCK
      ?auto_52520 - BLOCK
      ?auto_52521 - BLOCK
      ?auto_52522 - BLOCK
      ?auto_52523 - BLOCK
      ?auto_52524 - BLOCK
    )
    :vars
    (
      ?auto_52525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52519 ) ( ON ?auto_52520 ?auto_52519 ) ( ON ?auto_52521 ?auto_52520 ) ( ON ?auto_52522 ?auto_52521 ) ( not ( = ?auto_52519 ?auto_52520 ) ) ( not ( = ?auto_52519 ?auto_52521 ) ) ( not ( = ?auto_52519 ?auto_52522 ) ) ( not ( = ?auto_52519 ?auto_52523 ) ) ( not ( = ?auto_52519 ?auto_52524 ) ) ( not ( = ?auto_52520 ?auto_52521 ) ) ( not ( = ?auto_52520 ?auto_52522 ) ) ( not ( = ?auto_52520 ?auto_52523 ) ) ( not ( = ?auto_52520 ?auto_52524 ) ) ( not ( = ?auto_52521 ?auto_52522 ) ) ( not ( = ?auto_52521 ?auto_52523 ) ) ( not ( = ?auto_52521 ?auto_52524 ) ) ( not ( = ?auto_52522 ?auto_52523 ) ) ( not ( = ?auto_52522 ?auto_52524 ) ) ( not ( = ?auto_52523 ?auto_52524 ) ) ( ON ?auto_52524 ?auto_52525 ) ( not ( = ?auto_52519 ?auto_52525 ) ) ( not ( = ?auto_52520 ?auto_52525 ) ) ( not ( = ?auto_52521 ?auto_52525 ) ) ( not ( = ?auto_52522 ?auto_52525 ) ) ( not ( = ?auto_52523 ?auto_52525 ) ) ( not ( = ?auto_52524 ?auto_52525 ) ) ( CLEAR ?auto_52522 ) ( ON ?auto_52523 ?auto_52524 ) ( CLEAR ?auto_52523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52525 ?auto_52524 )
      ( MAKE-6PILE ?auto_52519 ?auto_52520 ?auto_52521 ?auto_52522 ?auto_52523 ?auto_52524 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52526 - BLOCK
      ?auto_52527 - BLOCK
      ?auto_52528 - BLOCK
      ?auto_52529 - BLOCK
      ?auto_52530 - BLOCK
      ?auto_52531 - BLOCK
    )
    :vars
    (
      ?auto_52532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52526 ) ( ON ?auto_52527 ?auto_52526 ) ( ON ?auto_52528 ?auto_52527 ) ( not ( = ?auto_52526 ?auto_52527 ) ) ( not ( = ?auto_52526 ?auto_52528 ) ) ( not ( = ?auto_52526 ?auto_52529 ) ) ( not ( = ?auto_52526 ?auto_52530 ) ) ( not ( = ?auto_52526 ?auto_52531 ) ) ( not ( = ?auto_52527 ?auto_52528 ) ) ( not ( = ?auto_52527 ?auto_52529 ) ) ( not ( = ?auto_52527 ?auto_52530 ) ) ( not ( = ?auto_52527 ?auto_52531 ) ) ( not ( = ?auto_52528 ?auto_52529 ) ) ( not ( = ?auto_52528 ?auto_52530 ) ) ( not ( = ?auto_52528 ?auto_52531 ) ) ( not ( = ?auto_52529 ?auto_52530 ) ) ( not ( = ?auto_52529 ?auto_52531 ) ) ( not ( = ?auto_52530 ?auto_52531 ) ) ( ON ?auto_52531 ?auto_52532 ) ( not ( = ?auto_52526 ?auto_52532 ) ) ( not ( = ?auto_52527 ?auto_52532 ) ) ( not ( = ?auto_52528 ?auto_52532 ) ) ( not ( = ?auto_52529 ?auto_52532 ) ) ( not ( = ?auto_52530 ?auto_52532 ) ) ( not ( = ?auto_52531 ?auto_52532 ) ) ( ON ?auto_52530 ?auto_52531 ) ( CLEAR ?auto_52530 ) ( ON-TABLE ?auto_52532 ) ( HOLDING ?auto_52529 ) ( CLEAR ?auto_52528 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52526 ?auto_52527 ?auto_52528 ?auto_52529 )
      ( MAKE-6PILE ?auto_52526 ?auto_52527 ?auto_52528 ?auto_52529 ?auto_52530 ?auto_52531 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52533 - BLOCK
      ?auto_52534 - BLOCK
      ?auto_52535 - BLOCK
      ?auto_52536 - BLOCK
      ?auto_52537 - BLOCK
      ?auto_52538 - BLOCK
    )
    :vars
    (
      ?auto_52539 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52533 ) ( ON ?auto_52534 ?auto_52533 ) ( ON ?auto_52535 ?auto_52534 ) ( not ( = ?auto_52533 ?auto_52534 ) ) ( not ( = ?auto_52533 ?auto_52535 ) ) ( not ( = ?auto_52533 ?auto_52536 ) ) ( not ( = ?auto_52533 ?auto_52537 ) ) ( not ( = ?auto_52533 ?auto_52538 ) ) ( not ( = ?auto_52534 ?auto_52535 ) ) ( not ( = ?auto_52534 ?auto_52536 ) ) ( not ( = ?auto_52534 ?auto_52537 ) ) ( not ( = ?auto_52534 ?auto_52538 ) ) ( not ( = ?auto_52535 ?auto_52536 ) ) ( not ( = ?auto_52535 ?auto_52537 ) ) ( not ( = ?auto_52535 ?auto_52538 ) ) ( not ( = ?auto_52536 ?auto_52537 ) ) ( not ( = ?auto_52536 ?auto_52538 ) ) ( not ( = ?auto_52537 ?auto_52538 ) ) ( ON ?auto_52538 ?auto_52539 ) ( not ( = ?auto_52533 ?auto_52539 ) ) ( not ( = ?auto_52534 ?auto_52539 ) ) ( not ( = ?auto_52535 ?auto_52539 ) ) ( not ( = ?auto_52536 ?auto_52539 ) ) ( not ( = ?auto_52537 ?auto_52539 ) ) ( not ( = ?auto_52538 ?auto_52539 ) ) ( ON ?auto_52537 ?auto_52538 ) ( ON-TABLE ?auto_52539 ) ( CLEAR ?auto_52535 ) ( ON ?auto_52536 ?auto_52537 ) ( CLEAR ?auto_52536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52539 ?auto_52538 ?auto_52537 )
      ( MAKE-6PILE ?auto_52533 ?auto_52534 ?auto_52535 ?auto_52536 ?auto_52537 ?auto_52538 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52540 - BLOCK
      ?auto_52541 - BLOCK
      ?auto_52542 - BLOCK
      ?auto_52543 - BLOCK
      ?auto_52544 - BLOCK
      ?auto_52545 - BLOCK
    )
    :vars
    (
      ?auto_52546 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52540 ) ( ON ?auto_52541 ?auto_52540 ) ( not ( = ?auto_52540 ?auto_52541 ) ) ( not ( = ?auto_52540 ?auto_52542 ) ) ( not ( = ?auto_52540 ?auto_52543 ) ) ( not ( = ?auto_52540 ?auto_52544 ) ) ( not ( = ?auto_52540 ?auto_52545 ) ) ( not ( = ?auto_52541 ?auto_52542 ) ) ( not ( = ?auto_52541 ?auto_52543 ) ) ( not ( = ?auto_52541 ?auto_52544 ) ) ( not ( = ?auto_52541 ?auto_52545 ) ) ( not ( = ?auto_52542 ?auto_52543 ) ) ( not ( = ?auto_52542 ?auto_52544 ) ) ( not ( = ?auto_52542 ?auto_52545 ) ) ( not ( = ?auto_52543 ?auto_52544 ) ) ( not ( = ?auto_52543 ?auto_52545 ) ) ( not ( = ?auto_52544 ?auto_52545 ) ) ( ON ?auto_52545 ?auto_52546 ) ( not ( = ?auto_52540 ?auto_52546 ) ) ( not ( = ?auto_52541 ?auto_52546 ) ) ( not ( = ?auto_52542 ?auto_52546 ) ) ( not ( = ?auto_52543 ?auto_52546 ) ) ( not ( = ?auto_52544 ?auto_52546 ) ) ( not ( = ?auto_52545 ?auto_52546 ) ) ( ON ?auto_52544 ?auto_52545 ) ( ON-TABLE ?auto_52546 ) ( ON ?auto_52543 ?auto_52544 ) ( CLEAR ?auto_52543 ) ( HOLDING ?auto_52542 ) ( CLEAR ?auto_52541 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52540 ?auto_52541 ?auto_52542 )
      ( MAKE-6PILE ?auto_52540 ?auto_52541 ?auto_52542 ?auto_52543 ?auto_52544 ?auto_52545 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52547 - BLOCK
      ?auto_52548 - BLOCK
      ?auto_52549 - BLOCK
      ?auto_52550 - BLOCK
      ?auto_52551 - BLOCK
      ?auto_52552 - BLOCK
    )
    :vars
    (
      ?auto_52553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52547 ) ( ON ?auto_52548 ?auto_52547 ) ( not ( = ?auto_52547 ?auto_52548 ) ) ( not ( = ?auto_52547 ?auto_52549 ) ) ( not ( = ?auto_52547 ?auto_52550 ) ) ( not ( = ?auto_52547 ?auto_52551 ) ) ( not ( = ?auto_52547 ?auto_52552 ) ) ( not ( = ?auto_52548 ?auto_52549 ) ) ( not ( = ?auto_52548 ?auto_52550 ) ) ( not ( = ?auto_52548 ?auto_52551 ) ) ( not ( = ?auto_52548 ?auto_52552 ) ) ( not ( = ?auto_52549 ?auto_52550 ) ) ( not ( = ?auto_52549 ?auto_52551 ) ) ( not ( = ?auto_52549 ?auto_52552 ) ) ( not ( = ?auto_52550 ?auto_52551 ) ) ( not ( = ?auto_52550 ?auto_52552 ) ) ( not ( = ?auto_52551 ?auto_52552 ) ) ( ON ?auto_52552 ?auto_52553 ) ( not ( = ?auto_52547 ?auto_52553 ) ) ( not ( = ?auto_52548 ?auto_52553 ) ) ( not ( = ?auto_52549 ?auto_52553 ) ) ( not ( = ?auto_52550 ?auto_52553 ) ) ( not ( = ?auto_52551 ?auto_52553 ) ) ( not ( = ?auto_52552 ?auto_52553 ) ) ( ON ?auto_52551 ?auto_52552 ) ( ON-TABLE ?auto_52553 ) ( ON ?auto_52550 ?auto_52551 ) ( CLEAR ?auto_52548 ) ( ON ?auto_52549 ?auto_52550 ) ( CLEAR ?auto_52549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52553 ?auto_52552 ?auto_52551 ?auto_52550 )
      ( MAKE-6PILE ?auto_52547 ?auto_52548 ?auto_52549 ?auto_52550 ?auto_52551 ?auto_52552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52554 - BLOCK
      ?auto_52555 - BLOCK
      ?auto_52556 - BLOCK
      ?auto_52557 - BLOCK
      ?auto_52558 - BLOCK
      ?auto_52559 - BLOCK
    )
    :vars
    (
      ?auto_52560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52554 ) ( not ( = ?auto_52554 ?auto_52555 ) ) ( not ( = ?auto_52554 ?auto_52556 ) ) ( not ( = ?auto_52554 ?auto_52557 ) ) ( not ( = ?auto_52554 ?auto_52558 ) ) ( not ( = ?auto_52554 ?auto_52559 ) ) ( not ( = ?auto_52555 ?auto_52556 ) ) ( not ( = ?auto_52555 ?auto_52557 ) ) ( not ( = ?auto_52555 ?auto_52558 ) ) ( not ( = ?auto_52555 ?auto_52559 ) ) ( not ( = ?auto_52556 ?auto_52557 ) ) ( not ( = ?auto_52556 ?auto_52558 ) ) ( not ( = ?auto_52556 ?auto_52559 ) ) ( not ( = ?auto_52557 ?auto_52558 ) ) ( not ( = ?auto_52557 ?auto_52559 ) ) ( not ( = ?auto_52558 ?auto_52559 ) ) ( ON ?auto_52559 ?auto_52560 ) ( not ( = ?auto_52554 ?auto_52560 ) ) ( not ( = ?auto_52555 ?auto_52560 ) ) ( not ( = ?auto_52556 ?auto_52560 ) ) ( not ( = ?auto_52557 ?auto_52560 ) ) ( not ( = ?auto_52558 ?auto_52560 ) ) ( not ( = ?auto_52559 ?auto_52560 ) ) ( ON ?auto_52558 ?auto_52559 ) ( ON-TABLE ?auto_52560 ) ( ON ?auto_52557 ?auto_52558 ) ( ON ?auto_52556 ?auto_52557 ) ( CLEAR ?auto_52556 ) ( HOLDING ?auto_52555 ) ( CLEAR ?auto_52554 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52554 ?auto_52555 )
      ( MAKE-6PILE ?auto_52554 ?auto_52555 ?auto_52556 ?auto_52557 ?auto_52558 ?auto_52559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52561 - BLOCK
      ?auto_52562 - BLOCK
      ?auto_52563 - BLOCK
      ?auto_52564 - BLOCK
      ?auto_52565 - BLOCK
      ?auto_52566 - BLOCK
    )
    :vars
    (
      ?auto_52567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52561 ) ( not ( = ?auto_52561 ?auto_52562 ) ) ( not ( = ?auto_52561 ?auto_52563 ) ) ( not ( = ?auto_52561 ?auto_52564 ) ) ( not ( = ?auto_52561 ?auto_52565 ) ) ( not ( = ?auto_52561 ?auto_52566 ) ) ( not ( = ?auto_52562 ?auto_52563 ) ) ( not ( = ?auto_52562 ?auto_52564 ) ) ( not ( = ?auto_52562 ?auto_52565 ) ) ( not ( = ?auto_52562 ?auto_52566 ) ) ( not ( = ?auto_52563 ?auto_52564 ) ) ( not ( = ?auto_52563 ?auto_52565 ) ) ( not ( = ?auto_52563 ?auto_52566 ) ) ( not ( = ?auto_52564 ?auto_52565 ) ) ( not ( = ?auto_52564 ?auto_52566 ) ) ( not ( = ?auto_52565 ?auto_52566 ) ) ( ON ?auto_52566 ?auto_52567 ) ( not ( = ?auto_52561 ?auto_52567 ) ) ( not ( = ?auto_52562 ?auto_52567 ) ) ( not ( = ?auto_52563 ?auto_52567 ) ) ( not ( = ?auto_52564 ?auto_52567 ) ) ( not ( = ?auto_52565 ?auto_52567 ) ) ( not ( = ?auto_52566 ?auto_52567 ) ) ( ON ?auto_52565 ?auto_52566 ) ( ON-TABLE ?auto_52567 ) ( ON ?auto_52564 ?auto_52565 ) ( ON ?auto_52563 ?auto_52564 ) ( CLEAR ?auto_52561 ) ( ON ?auto_52562 ?auto_52563 ) ( CLEAR ?auto_52562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52567 ?auto_52566 ?auto_52565 ?auto_52564 ?auto_52563 )
      ( MAKE-6PILE ?auto_52561 ?auto_52562 ?auto_52563 ?auto_52564 ?auto_52565 ?auto_52566 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52568 - BLOCK
      ?auto_52569 - BLOCK
      ?auto_52570 - BLOCK
      ?auto_52571 - BLOCK
      ?auto_52572 - BLOCK
      ?auto_52573 - BLOCK
    )
    :vars
    (
      ?auto_52574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52568 ?auto_52569 ) ) ( not ( = ?auto_52568 ?auto_52570 ) ) ( not ( = ?auto_52568 ?auto_52571 ) ) ( not ( = ?auto_52568 ?auto_52572 ) ) ( not ( = ?auto_52568 ?auto_52573 ) ) ( not ( = ?auto_52569 ?auto_52570 ) ) ( not ( = ?auto_52569 ?auto_52571 ) ) ( not ( = ?auto_52569 ?auto_52572 ) ) ( not ( = ?auto_52569 ?auto_52573 ) ) ( not ( = ?auto_52570 ?auto_52571 ) ) ( not ( = ?auto_52570 ?auto_52572 ) ) ( not ( = ?auto_52570 ?auto_52573 ) ) ( not ( = ?auto_52571 ?auto_52572 ) ) ( not ( = ?auto_52571 ?auto_52573 ) ) ( not ( = ?auto_52572 ?auto_52573 ) ) ( ON ?auto_52573 ?auto_52574 ) ( not ( = ?auto_52568 ?auto_52574 ) ) ( not ( = ?auto_52569 ?auto_52574 ) ) ( not ( = ?auto_52570 ?auto_52574 ) ) ( not ( = ?auto_52571 ?auto_52574 ) ) ( not ( = ?auto_52572 ?auto_52574 ) ) ( not ( = ?auto_52573 ?auto_52574 ) ) ( ON ?auto_52572 ?auto_52573 ) ( ON-TABLE ?auto_52574 ) ( ON ?auto_52571 ?auto_52572 ) ( ON ?auto_52570 ?auto_52571 ) ( ON ?auto_52569 ?auto_52570 ) ( CLEAR ?auto_52569 ) ( HOLDING ?auto_52568 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52568 )
      ( MAKE-6PILE ?auto_52568 ?auto_52569 ?auto_52570 ?auto_52571 ?auto_52572 ?auto_52573 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52575 - BLOCK
      ?auto_52576 - BLOCK
      ?auto_52577 - BLOCK
      ?auto_52578 - BLOCK
      ?auto_52579 - BLOCK
      ?auto_52580 - BLOCK
    )
    :vars
    (
      ?auto_52581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52575 ?auto_52576 ) ) ( not ( = ?auto_52575 ?auto_52577 ) ) ( not ( = ?auto_52575 ?auto_52578 ) ) ( not ( = ?auto_52575 ?auto_52579 ) ) ( not ( = ?auto_52575 ?auto_52580 ) ) ( not ( = ?auto_52576 ?auto_52577 ) ) ( not ( = ?auto_52576 ?auto_52578 ) ) ( not ( = ?auto_52576 ?auto_52579 ) ) ( not ( = ?auto_52576 ?auto_52580 ) ) ( not ( = ?auto_52577 ?auto_52578 ) ) ( not ( = ?auto_52577 ?auto_52579 ) ) ( not ( = ?auto_52577 ?auto_52580 ) ) ( not ( = ?auto_52578 ?auto_52579 ) ) ( not ( = ?auto_52578 ?auto_52580 ) ) ( not ( = ?auto_52579 ?auto_52580 ) ) ( ON ?auto_52580 ?auto_52581 ) ( not ( = ?auto_52575 ?auto_52581 ) ) ( not ( = ?auto_52576 ?auto_52581 ) ) ( not ( = ?auto_52577 ?auto_52581 ) ) ( not ( = ?auto_52578 ?auto_52581 ) ) ( not ( = ?auto_52579 ?auto_52581 ) ) ( not ( = ?auto_52580 ?auto_52581 ) ) ( ON ?auto_52579 ?auto_52580 ) ( ON-TABLE ?auto_52581 ) ( ON ?auto_52578 ?auto_52579 ) ( ON ?auto_52577 ?auto_52578 ) ( ON ?auto_52576 ?auto_52577 ) ( ON ?auto_52575 ?auto_52576 ) ( CLEAR ?auto_52575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52581 ?auto_52580 ?auto_52579 ?auto_52578 ?auto_52577 ?auto_52576 )
      ( MAKE-6PILE ?auto_52575 ?auto_52576 ?auto_52577 ?auto_52578 ?auto_52579 ?auto_52580 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52662 - BLOCK
    )
    :vars
    (
      ?auto_52663 - BLOCK
      ?auto_52664 - BLOCK
      ?auto_52665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52662 ?auto_52663 ) ( CLEAR ?auto_52662 ) ( not ( = ?auto_52662 ?auto_52663 ) ) ( HOLDING ?auto_52664 ) ( CLEAR ?auto_52665 ) ( not ( = ?auto_52662 ?auto_52664 ) ) ( not ( = ?auto_52662 ?auto_52665 ) ) ( not ( = ?auto_52663 ?auto_52664 ) ) ( not ( = ?auto_52663 ?auto_52665 ) ) ( not ( = ?auto_52664 ?auto_52665 ) ) )
    :subtasks
    ( ( !STACK ?auto_52664 ?auto_52665 )
      ( MAKE-1PILE ?auto_52662 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52666 - BLOCK
    )
    :vars
    (
      ?auto_52669 - BLOCK
      ?auto_52668 - BLOCK
      ?auto_52667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52666 ?auto_52669 ) ( not ( = ?auto_52666 ?auto_52669 ) ) ( CLEAR ?auto_52668 ) ( not ( = ?auto_52666 ?auto_52667 ) ) ( not ( = ?auto_52666 ?auto_52668 ) ) ( not ( = ?auto_52669 ?auto_52667 ) ) ( not ( = ?auto_52669 ?auto_52668 ) ) ( not ( = ?auto_52667 ?auto_52668 ) ) ( ON ?auto_52667 ?auto_52666 ) ( CLEAR ?auto_52667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52669 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52669 ?auto_52666 )
      ( MAKE-1PILE ?auto_52666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52670 - BLOCK
    )
    :vars
    (
      ?auto_52671 - BLOCK
      ?auto_52672 - BLOCK
      ?auto_52673 - BLOCK
      ?auto_52674 - BLOCK
      ?auto_52675 - BLOCK
      ?auto_52676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52670 ?auto_52671 ) ( not ( = ?auto_52670 ?auto_52671 ) ) ( not ( = ?auto_52670 ?auto_52672 ) ) ( not ( = ?auto_52670 ?auto_52673 ) ) ( not ( = ?auto_52671 ?auto_52672 ) ) ( not ( = ?auto_52671 ?auto_52673 ) ) ( not ( = ?auto_52672 ?auto_52673 ) ) ( ON ?auto_52672 ?auto_52670 ) ( CLEAR ?auto_52672 ) ( ON-TABLE ?auto_52671 ) ( HOLDING ?auto_52673 ) ( CLEAR ?auto_52674 ) ( ON-TABLE ?auto_52675 ) ( ON ?auto_52676 ?auto_52675 ) ( ON ?auto_52674 ?auto_52676 ) ( not ( = ?auto_52675 ?auto_52676 ) ) ( not ( = ?auto_52675 ?auto_52674 ) ) ( not ( = ?auto_52675 ?auto_52673 ) ) ( not ( = ?auto_52676 ?auto_52674 ) ) ( not ( = ?auto_52676 ?auto_52673 ) ) ( not ( = ?auto_52674 ?auto_52673 ) ) ( not ( = ?auto_52670 ?auto_52674 ) ) ( not ( = ?auto_52670 ?auto_52675 ) ) ( not ( = ?auto_52670 ?auto_52676 ) ) ( not ( = ?auto_52671 ?auto_52674 ) ) ( not ( = ?auto_52671 ?auto_52675 ) ) ( not ( = ?auto_52671 ?auto_52676 ) ) ( not ( = ?auto_52672 ?auto_52674 ) ) ( not ( = ?auto_52672 ?auto_52675 ) ) ( not ( = ?auto_52672 ?auto_52676 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52675 ?auto_52676 ?auto_52674 ?auto_52673 )
      ( MAKE-1PILE ?auto_52670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52677 - BLOCK
    )
    :vars
    (
      ?auto_52680 - BLOCK
      ?auto_52681 - BLOCK
      ?auto_52683 - BLOCK
      ?auto_52678 - BLOCK
      ?auto_52682 - BLOCK
      ?auto_52679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52677 ?auto_52680 ) ( not ( = ?auto_52677 ?auto_52680 ) ) ( not ( = ?auto_52677 ?auto_52681 ) ) ( not ( = ?auto_52677 ?auto_52683 ) ) ( not ( = ?auto_52680 ?auto_52681 ) ) ( not ( = ?auto_52680 ?auto_52683 ) ) ( not ( = ?auto_52681 ?auto_52683 ) ) ( ON ?auto_52681 ?auto_52677 ) ( ON-TABLE ?auto_52680 ) ( CLEAR ?auto_52678 ) ( ON-TABLE ?auto_52682 ) ( ON ?auto_52679 ?auto_52682 ) ( ON ?auto_52678 ?auto_52679 ) ( not ( = ?auto_52682 ?auto_52679 ) ) ( not ( = ?auto_52682 ?auto_52678 ) ) ( not ( = ?auto_52682 ?auto_52683 ) ) ( not ( = ?auto_52679 ?auto_52678 ) ) ( not ( = ?auto_52679 ?auto_52683 ) ) ( not ( = ?auto_52678 ?auto_52683 ) ) ( not ( = ?auto_52677 ?auto_52678 ) ) ( not ( = ?auto_52677 ?auto_52682 ) ) ( not ( = ?auto_52677 ?auto_52679 ) ) ( not ( = ?auto_52680 ?auto_52678 ) ) ( not ( = ?auto_52680 ?auto_52682 ) ) ( not ( = ?auto_52680 ?auto_52679 ) ) ( not ( = ?auto_52681 ?auto_52678 ) ) ( not ( = ?auto_52681 ?auto_52682 ) ) ( not ( = ?auto_52681 ?auto_52679 ) ) ( ON ?auto_52683 ?auto_52681 ) ( CLEAR ?auto_52683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52680 ?auto_52677 ?auto_52681 )
      ( MAKE-1PILE ?auto_52677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52684 - BLOCK
    )
    :vars
    (
      ?auto_52689 - BLOCK
      ?auto_52685 - BLOCK
      ?auto_52687 - BLOCK
      ?auto_52686 - BLOCK
      ?auto_52690 - BLOCK
      ?auto_52688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52684 ?auto_52689 ) ( not ( = ?auto_52684 ?auto_52689 ) ) ( not ( = ?auto_52684 ?auto_52685 ) ) ( not ( = ?auto_52684 ?auto_52687 ) ) ( not ( = ?auto_52689 ?auto_52685 ) ) ( not ( = ?auto_52689 ?auto_52687 ) ) ( not ( = ?auto_52685 ?auto_52687 ) ) ( ON ?auto_52685 ?auto_52684 ) ( ON-TABLE ?auto_52689 ) ( ON-TABLE ?auto_52686 ) ( ON ?auto_52690 ?auto_52686 ) ( not ( = ?auto_52686 ?auto_52690 ) ) ( not ( = ?auto_52686 ?auto_52688 ) ) ( not ( = ?auto_52686 ?auto_52687 ) ) ( not ( = ?auto_52690 ?auto_52688 ) ) ( not ( = ?auto_52690 ?auto_52687 ) ) ( not ( = ?auto_52688 ?auto_52687 ) ) ( not ( = ?auto_52684 ?auto_52688 ) ) ( not ( = ?auto_52684 ?auto_52686 ) ) ( not ( = ?auto_52684 ?auto_52690 ) ) ( not ( = ?auto_52689 ?auto_52688 ) ) ( not ( = ?auto_52689 ?auto_52686 ) ) ( not ( = ?auto_52689 ?auto_52690 ) ) ( not ( = ?auto_52685 ?auto_52688 ) ) ( not ( = ?auto_52685 ?auto_52686 ) ) ( not ( = ?auto_52685 ?auto_52690 ) ) ( ON ?auto_52687 ?auto_52685 ) ( CLEAR ?auto_52687 ) ( HOLDING ?auto_52688 ) ( CLEAR ?auto_52690 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52686 ?auto_52690 ?auto_52688 )
      ( MAKE-1PILE ?auto_52684 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52691 - BLOCK
    )
    :vars
    (
      ?auto_52696 - BLOCK
      ?auto_52697 - BLOCK
      ?auto_52693 - BLOCK
      ?auto_52695 - BLOCK
      ?auto_52692 - BLOCK
      ?auto_52694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52691 ?auto_52696 ) ( not ( = ?auto_52691 ?auto_52696 ) ) ( not ( = ?auto_52691 ?auto_52697 ) ) ( not ( = ?auto_52691 ?auto_52693 ) ) ( not ( = ?auto_52696 ?auto_52697 ) ) ( not ( = ?auto_52696 ?auto_52693 ) ) ( not ( = ?auto_52697 ?auto_52693 ) ) ( ON ?auto_52697 ?auto_52691 ) ( ON-TABLE ?auto_52696 ) ( ON-TABLE ?auto_52695 ) ( ON ?auto_52692 ?auto_52695 ) ( not ( = ?auto_52695 ?auto_52692 ) ) ( not ( = ?auto_52695 ?auto_52694 ) ) ( not ( = ?auto_52695 ?auto_52693 ) ) ( not ( = ?auto_52692 ?auto_52694 ) ) ( not ( = ?auto_52692 ?auto_52693 ) ) ( not ( = ?auto_52694 ?auto_52693 ) ) ( not ( = ?auto_52691 ?auto_52694 ) ) ( not ( = ?auto_52691 ?auto_52695 ) ) ( not ( = ?auto_52691 ?auto_52692 ) ) ( not ( = ?auto_52696 ?auto_52694 ) ) ( not ( = ?auto_52696 ?auto_52695 ) ) ( not ( = ?auto_52696 ?auto_52692 ) ) ( not ( = ?auto_52697 ?auto_52694 ) ) ( not ( = ?auto_52697 ?auto_52695 ) ) ( not ( = ?auto_52697 ?auto_52692 ) ) ( ON ?auto_52693 ?auto_52697 ) ( CLEAR ?auto_52692 ) ( ON ?auto_52694 ?auto_52693 ) ( CLEAR ?auto_52694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52696 ?auto_52691 ?auto_52697 ?auto_52693 )
      ( MAKE-1PILE ?auto_52691 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52698 - BLOCK
    )
    :vars
    (
      ?auto_52704 - BLOCK
      ?auto_52699 - BLOCK
      ?auto_52701 - BLOCK
      ?auto_52700 - BLOCK
      ?auto_52703 - BLOCK
      ?auto_52702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52698 ?auto_52704 ) ( not ( = ?auto_52698 ?auto_52704 ) ) ( not ( = ?auto_52698 ?auto_52699 ) ) ( not ( = ?auto_52698 ?auto_52701 ) ) ( not ( = ?auto_52704 ?auto_52699 ) ) ( not ( = ?auto_52704 ?auto_52701 ) ) ( not ( = ?auto_52699 ?auto_52701 ) ) ( ON ?auto_52699 ?auto_52698 ) ( ON-TABLE ?auto_52704 ) ( ON-TABLE ?auto_52700 ) ( not ( = ?auto_52700 ?auto_52703 ) ) ( not ( = ?auto_52700 ?auto_52702 ) ) ( not ( = ?auto_52700 ?auto_52701 ) ) ( not ( = ?auto_52703 ?auto_52702 ) ) ( not ( = ?auto_52703 ?auto_52701 ) ) ( not ( = ?auto_52702 ?auto_52701 ) ) ( not ( = ?auto_52698 ?auto_52702 ) ) ( not ( = ?auto_52698 ?auto_52700 ) ) ( not ( = ?auto_52698 ?auto_52703 ) ) ( not ( = ?auto_52704 ?auto_52702 ) ) ( not ( = ?auto_52704 ?auto_52700 ) ) ( not ( = ?auto_52704 ?auto_52703 ) ) ( not ( = ?auto_52699 ?auto_52702 ) ) ( not ( = ?auto_52699 ?auto_52700 ) ) ( not ( = ?auto_52699 ?auto_52703 ) ) ( ON ?auto_52701 ?auto_52699 ) ( ON ?auto_52702 ?auto_52701 ) ( CLEAR ?auto_52702 ) ( HOLDING ?auto_52703 ) ( CLEAR ?auto_52700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52700 ?auto_52703 )
      ( MAKE-1PILE ?auto_52698 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52705 - BLOCK
    )
    :vars
    (
      ?auto_52709 - BLOCK
      ?auto_52710 - BLOCK
      ?auto_52707 - BLOCK
      ?auto_52708 - BLOCK
      ?auto_52706 - BLOCK
      ?auto_52711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52705 ?auto_52709 ) ( not ( = ?auto_52705 ?auto_52709 ) ) ( not ( = ?auto_52705 ?auto_52710 ) ) ( not ( = ?auto_52705 ?auto_52707 ) ) ( not ( = ?auto_52709 ?auto_52710 ) ) ( not ( = ?auto_52709 ?auto_52707 ) ) ( not ( = ?auto_52710 ?auto_52707 ) ) ( ON ?auto_52710 ?auto_52705 ) ( ON-TABLE ?auto_52709 ) ( ON-TABLE ?auto_52708 ) ( not ( = ?auto_52708 ?auto_52706 ) ) ( not ( = ?auto_52708 ?auto_52711 ) ) ( not ( = ?auto_52708 ?auto_52707 ) ) ( not ( = ?auto_52706 ?auto_52711 ) ) ( not ( = ?auto_52706 ?auto_52707 ) ) ( not ( = ?auto_52711 ?auto_52707 ) ) ( not ( = ?auto_52705 ?auto_52711 ) ) ( not ( = ?auto_52705 ?auto_52708 ) ) ( not ( = ?auto_52705 ?auto_52706 ) ) ( not ( = ?auto_52709 ?auto_52711 ) ) ( not ( = ?auto_52709 ?auto_52708 ) ) ( not ( = ?auto_52709 ?auto_52706 ) ) ( not ( = ?auto_52710 ?auto_52711 ) ) ( not ( = ?auto_52710 ?auto_52708 ) ) ( not ( = ?auto_52710 ?auto_52706 ) ) ( ON ?auto_52707 ?auto_52710 ) ( ON ?auto_52711 ?auto_52707 ) ( CLEAR ?auto_52708 ) ( ON ?auto_52706 ?auto_52711 ) ( CLEAR ?auto_52706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52709 ?auto_52705 ?auto_52710 ?auto_52707 ?auto_52711 )
      ( MAKE-1PILE ?auto_52705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52712 - BLOCK
    )
    :vars
    (
      ?auto_52717 - BLOCK
      ?auto_52714 - BLOCK
      ?auto_52718 - BLOCK
      ?auto_52716 - BLOCK
      ?auto_52715 - BLOCK
      ?auto_52713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52712 ?auto_52717 ) ( not ( = ?auto_52712 ?auto_52717 ) ) ( not ( = ?auto_52712 ?auto_52714 ) ) ( not ( = ?auto_52712 ?auto_52718 ) ) ( not ( = ?auto_52717 ?auto_52714 ) ) ( not ( = ?auto_52717 ?auto_52718 ) ) ( not ( = ?auto_52714 ?auto_52718 ) ) ( ON ?auto_52714 ?auto_52712 ) ( ON-TABLE ?auto_52717 ) ( not ( = ?auto_52716 ?auto_52715 ) ) ( not ( = ?auto_52716 ?auto_52713 ) ) ( not ( = ?auto_52716 ?auto_52718 ) ) ( not ( = ?auto_52715 ?auto_52713 ) ) ( not ( = ?auto_52715 ?auto_52718 ) ) ( not ( = ?auto_52713 ?auto_52718 ) ) ( not ( = ?auto_52712 ?auto_52713 ) ) ( not ( = ?auto_52712 ?auto_52716 ) ) ( not ( = ?auto_52712 ?auto_52715 ) ) ( not ( = ?auto_52717 ?auto_52713 ) ) ( not ( = ?auto_52717 ?auto_52716 ) ) ( not ( = ?auto_52717 ?auto_52715 ) ) ( not ( = ?auto_52714 ?auto_52713 ) ) ( not ( = ?auto_52714 ?auto_52716 ) ) ( not ( = ?auto_52714 ?auto_52715 ) ) ( ON ?auto_52718 ?auto_52714 ) ( ON ?auto_52713 ?auto_52718 ) ( ON ?auto_52715 ?auto_52713 ) ( CLEAR ?auto_52715 ) ( HOLDING ?auto_52716 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52716 )
      ( MAKE-1PILE ?auto_52712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_52719 - BLOCK
    )
    :vars
    (
      ?auto_52725 - BLOCK
      ?auto_52724 - BLOCK
      ?auto_52720 - BLOCK
      ?auto_52721 - BLOCK
      ?auto_52722 - BLOCK
      ?auto_52723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52719 ?auto_52725 ) ( not ( = ?auto_52719 ?auto_52725 ) ) ( not ( = ?auto_52719 ?auto_52724 ) ) ( not ( = ?auto_52719 ?auto_52720 ) ) ( not ( = ?auto_52725 ?auto_52724 ) ) ( not ( = ?auto_52725 ?auto_52720 ) ) ( not ( = ?auto_52724 ?auto_52720 ) ) ( ON ?auto_52724 ?auto_52719 ) ( ON-TABLE ?auto_52725 ) ( not ( = ?auto_52721 ?auto_52722 ) ) ( not ( = ?auto_52721 ?auto_52723 ) ) ( not ( = ?auto_52721 ?auto_52720 ) ) ( not ( = ?auto_52722 ?auto_52723 ) ) ( not ( = ?auto_52722 ?auto_52720 ) ) ( not ( = ?auto_52723 ?auto_52720 ) ) ( not ( = ?auto_52719 ?auto_52723 ) ) ( not ( = ?auto_52719 ?auto_52721 ) ) ( not ( = ?auto_52719 ?auto_52722 ) ) ( not ( = ?auto_52725 ?auto_52723 ) ) ( not ( = ?auto_52725 ?auto_52721 ) ) ( not ( = ?auto_52725 ?auto_52722 ) ) ( not ( = ?auto_52724 ?auto_52723 ) ) ( not ( = ?auto_52724 ?auto_52721 ) ) ( not ( = ?auto_52724 ?auto_52722 ) ) ( ON ?auto_52720 ?auto_52724 ) ( ON ?auto_52723 ?auto_52720 ) ( ON ?auto_52722 ?auto_52723 ) ( ON ?auto_52721 ?auto_52722 ) ( CLEAR ?auto_52721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52725 ?auto_52719 ?auto_52724 ?auto_52720 ?auto_52723 ?auto_52722 )
      ( MAKE-1PILE ?auto_52719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_52735 - BLOCK
      ?auto_52736 - BLOCK
      ?auto_52737 - BLOCK
      ?auto_52738 - BLOCK
    )
    :vars
    (
      ?auto_52739 - BLOCK
      ?auto_52740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52739 ?auto_52738 ) ( CLEAR ?auto_52739 ) ( ON-TABLE ?auto_52735 ) ( ON ?auto_52736 ?auto_52735 ) ( ON ?auto_52737 ?auto_52736 ) ( ON ?auto_52738 ?auto_52737 ) ( not ( = ?auto_52735 ?auto_52736 ) ) ( not ( = ?auto_52735 ?auto_52737 ) ) ( not ( = ?auto_52735 ?auto_52738 ) ) ( not ( = ?auto_52735 ?auto_52739 ) ) ( not ( = ?auto_52736 ?auto_52737 ) ) ( not ( = ?auto_52736 ?auto_52738 ) ) ( not ( = ?auto_52736 ?auto_52739 ) ) ( not ( = ?auto_52737 ?auto_52738 ) ) ( not ( = ?auto_52737 ?auto_52739 ) ) ( not ( = ?auto_52738 ?auto_52739 ) ) ( HOLDING ?auto_52740 ) ( not ( = ?auto_52735 ?auto_52740 ) ) ( not ( = ?auto_52736 ?auto_52740 ) ) ( not ( = ?auto_52737 ?auto_52740 ) ) ( not ( = ?auto_52738 ?auto_52740 ) ) ( not ( = ?auto_52739 ?auto_52740 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_52740 )
      ( MAKE-4PILE ?auto_52735 ?auto_52736 ?auto_52737 ?auto_52738 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52808 - BLOCK
      ?auto_52809 - BLOCK
    )
    :vars
    (
      ?auto_52810 - BLOCK
      ?auto_52811 - BLOCK
      ?auto_52812 - BLOCK
      ?auto_52813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52808 ?auto_52809 ) ) ( ON ?auto_52809 ?auto_52810 ) ( not ( = ?auto_52808 ?auto_52810 ) ) ( not ( = ?auto_52809 ?auto_52810 ) ) ( ON ?auto_52808 ?auto_52809 ) ( CLEAR ?auto_52808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52811 ) ( ON ?auto_52812 ?auto_52811 ) ( ON ?auto_52813 ?auto_52812 ) ( ON ?auto_52810 ?auto_52813 ) ( not ( = ?auto_52811 ?auto_52812 ) ) ( not ( = ?auto_52811 ?auto_52813 ) ) ( not ( = ?auto_52811 ?auto_52810 ) ) ( not ( = ?auto_52811 ?auto_52809 ) ) ( not ( = ?auto_52811 ?auto_52808 ) ) ( not ( = ?auto_52812 ?auto_52813 ) ) ( not ( = ?auto_52812 ?auto_52810 ) ) ( not ( = ?auto_52812 ?auto_52809 ) ) ( not ( = ?auto_52812 ?auto_52808 ) ) ( not ( = ?auto_52813 ?auto_52810 ) ) ( not ( = ?auto_52813 ?auto_52809 ) ) ( not ( = ?auto_52813 ?auto_52808 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52811 ?auto_52812 ?auto_52813 ?auto_52810 ?auto_52809 )
      ( MAKE-2PILE ?auto_52808 ?auto_52809 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52816 - BLOCK
      ?auto_52817 - BLOCK
    )
    :vars
    (
      ?auto_52818 - BLOCK
      ?auto_52819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52816 ?auto_52817 ) ) ( ON ?auto_52817 ?auto_52818 ) ( CLEAR ?auto_52817 ) ( not ( = ?auto_52816 ?auto_52818 ) ) ( not ( = ?auto_52817 ?auto_52818 ) ) ( ON ?auto_52816 ?auto_52819 ) ( CLEAR ?auto_52816 ) ( HAND-EMPTY ) ( not ( = ?auto_52816 ?auto_52819 ) ) ( not ( = ?auto_52817 ?auto_52819 ) ) ( not ( = ?auto_52818 ?auto_52819 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52816 ?auto_52819 )
      ( MAKE-2PILE ?auto_52816 ?auto_52817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52820 - BLOCK
      ?auto_52821 - BLOCK
    )
    :vars
    (
      ?auto_52823 - BLOCK
      ?auto_52822 - BLOCK
      ?auto_52826 - BLOCK
      ?auto_52824 - BLOCK
      ?auto_52825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52820 ?auto_52821 ) ) ( not ( = ?auto_52820 ?auto_52823 ) ) ( not ( = ?auto_52821 ?auto_52823 ) ) ( ON ?auto_52820 ?auto_52822 ) ( CLEAR ?auto_52820 ) ( not ( = ?auto_52820 ?auto_52822 ) ) ( not ( = ?auto_52821 ?auto_52822 ) ) ( not ( = ?auto_52823 ?auto_52822 ) ) ( HOLDING ?auto_52821 ) ( CLEAR ?auto_52823 ) ( ON-TABLE ?auto_52826 ) ( ON ?auto_52824 ?auto_52826 ) ( ON ?auto_52825 ?auto_52824 ) ( ON ?auto_52823 ?auto_52825 ) ( not ( = ?auto_52826 ?auto_52824 ) ) ( not ( = ?auto_52826 ?auto_52825 ) ) ( not ( = ?auto_52826 ?auto_52823 ) ) ( not ( = ?auto_52826 ?auto_52821 ) ) ( not ( = ?auto_52824 ?auto_52825 ) ) ( not ( = ?auto_52824 ?auto_52823 ) ) ( not ( = ?auto_52824 ?auto_52821 ) ) ( not ( = ?auto_52825 ?auto_52823 ) ) ( not ( = ?auto_52825 ?auto_52821 ) ) ( not ( = ?auto_52820 ?auto_52826 ) ) ( not ( = ?auto_52820 ?auto_52824 ) ) ( not ( = ?auto_52820 ?auto_52825 ) ) ( not ( = ?auto_52822 ?auto_52826 ) ) ( not ( = ?auto_52822 ?auto_52824 ) ) ( not ( = ?auto_52822 ?auto_52825 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52826 ?auto_52824 ?auto_52825 ?auto_52823 ?auto_52821 )
      ( MAKE-2PILE ?auto_52820 ?auto_52821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52827 - BLOCK
      ?auto_52828 - BLOCK
    )
    :vars
    (
      ?auto_52831 - BLOCK
      ?auto_52830 - BLOCK
      ?auto_52833 - BLOCK
      ?auto_52832 - BLOCK
      ?auto_52829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52827 ?auto_52828 ) ) ( not ( = ?auto_52827 ?auto_52831 ) ) ( not ( = ?auto_52828 ?auto_52831 ) ) ( ON ?auto_52827 ?auto_52830 ) ( not ( = ?auto_52827 ?auto_52830 ) ) ( not ( = ?auto_52828 ?auto_52830 ) ) ( not ( = ?auto_52831 ?auto_52830 ) ) ( CLEAR ?auto_52831 ) ( ON-TABLE ?auto_52833 ) ( ON ?auto_52832 ?auto_52833 ) ( ON ?auto_52829 ?auto_52832 ) ( ON ?auto_52831 ?auto_52829 ) ( not ( = ?auto_52833 ?auto_52832 ) ) ( not ( = ?auto_52833 ?auto_52829 ) ) ( not ( = ?auto_52833 ?auto_52831 ) ) ( not ( = ?auto_52833 ?auto_52828 ) ) ( not ( = ?auto_52832 ?auto_52829 ) ) ( not ( = ?auto_52832 ?auto_52831 ) ) ( not ( = ?auto_52832 ?auto_52828 ) ) ( not ( = ?auto_52829 ?auto_52831 ) ) ( not ( = ?auto_52829 ?auto_52828 ) ) ( not ( = ?auto_52827 ?auto_52833 ) ) ( not ( = ?auto_52827 ?auto_52832 ) ) ( not ( = ?auto_52827 ?auto_52829 ) ) ( not ( = ?auto_52830 ?auto_52833 ) ) ( not ( = ?auto_52830 ?auto_52832 ) ) ( not ( = ?auto_52830 ?auto_52829 ) ) ( ON ?auto_52828 ?auto_52827 ) ( CLEAR ?auto_52828 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52830 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52830 ?auto_52827 )
      ( MAKE-2PILE ?auto_52827 ?auto_52828 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52834 - BLOCK
      ?auto_52835 - BLOCK
    )
    :vars
    (
      ?auto_52836 - BLOCK
      ?auto_52837 - BLOCK
      ?auto_52840 - BLOCK
      ?auto_52838 - BLOCK
      ?auto_52839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52834 ?auto_52835 ) ) ( not ( = ?auto_52834 ?auto_52836 ) ) ( not ( = ?auto_52835 ?auto_52836 ) ) ( ON ?auto_52834 ?auto_52837 ) ( not ( = ?auto_52834 ?auto_52837 ) ) ( not ( = ?auto_52835 ?auto_52837 ) ) ( not ( = ?auto_52836 ?auto_52837 ) ) ( ON-TABLE ?auto_52840 ) ( ON ?auto_52838 ?auto_52840 ) ( ON ?auto_52839 ?auto_52838 ) ( not ( = ?auto_52840 ?auto_52838 ) ) ( not ( = ?auto_52840 ?auto_52839 ) ) ( not ( = ?auto_52840 ?auto_52836 ) ) ( not ( = ?auto_52840 ?auto_52835 ) ) ( not ( = ?auto_52838 ?auto_52839 ) ) ( not ( = ?auto_52838 ?auto_52836 ) ) ( not ( = ?auto_52838 ?auto_52835 ) ) ( not ( = ?auto_52839 ?auto_52836 ) ) ( not ( = ?auto_52839 ?auto_52835 ) ) ( not ( = ?auto_52834 ?auto_52840 ) ) ( not ( = ?auto_52834 ?auto_52838 ) ) ( not ( = ?auto_52834 ?auto_52839 ) ) ( not ( = ?auto_52837 ?auto_52840 ) ) ( not ( = ?auto_52837 ?auto_52838 ) ) ( not ( = ?auto_52837 ?auto_52839 ) ) ( ON ?auto_52835 ?auto_52834 ) ( CLEAR ?auto_52835 ) ( ON-TABLE ?auto_52837 ) ( HOLDING ?auto_52836 ) ( CLEAR ?auto_52839 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52840 ?auto_52838 ?auto_52839 ?auto_52836 )
      ( MAKE-2PILE ?auto_52834 ?auto_52835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52841 - BLOCK
      ?auto_52842 - BLOCK
    )
    :vars
    (
      ?auto_52847 - BLOCK
      ?auto_52846 - BLOCK
      ?auto_52845 - BLOCK
      ?auto_52843 - BLOCK
      ?auto_52844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52841 ?auto_52842 ) ) ( not ( = ?auto_52841 ?auto_52847 ) ) ( not ( = ?auto_52842 ?auto_52847 ) ) ( ON ?auto_52841 ?auto_52846 ) ( not ( = ?auto_52841 ?auto_52846 ) ) ( not ( = ?auto_52842 ?auto_52846 ) ) ( not ( = ?auto_52847 ?auto_52846 ) ) ( ON-TABLE ?auto_52845 ) ( ON ?auto_52843 ?auto_52845 ) ( ON ?auto_52844 ?auto_52843 ) ( not ( = ?auto_52845 ?auto_52843 ) ) ( not ( = ?auto_52845 ?auto_52844 ) ) ( not ( = ?auto_52845 ?auto_52847 ) ) ( not ( = ?auto_52845 ?auto_52842 ) ) ( not ( = ?auto_52843 ?auto_52844 ) ) ( not ( = ?auto_52843 ?auto_52847 ) ) ( not ( = ?auto_52843 ?auto_52842 ) ) ( not ( = ?auto_52844 ?auto_52847 ) ) ( not ( = ?auto_52844 ?auto_52842 ) ) ( not ( = ?auto_52841 ?auto_52845 ) ) ( not ( = ?auto_52841 ?auto_52843 ) ) ( not ( = ?auto_52841 ?auto_52844 ) ) ( not ( = ?auto_52846 ?auto_52845 ) ) ( not ( = ?auto_52846 ?auto_52843 ) ) ( not ( = ?auto_52846 ?auto_52844 ) ) ( ON ?auto_52842 ?auto_52841 ) ( ON-TABLE ?auto_52846 ) ( CLEAR ?auto_52844 ) ( ON ?auto_52847 ?auto_52842 ) ( CLEAR ?auto_52847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52846 ?auto_52841 ?auto_52842 )
      ( MAKE-2PILE ?auto_52841 ?auto_52842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52848 - BLOCK
      ?auto_52849 - BLOCK
    )
    :vars
    (
      ?auto_52850 - BLOCK
      ?auto_52854 - BLOCK
      ?auto_52852 - BLOCK
      ?auto_52853 - BLOCK
      ?auto_52851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52848 ?auto_52849 ) ) ( not ( = ?auto_52848 ?auto_52850 ) ) ( not ( = ?auto_52849 ?auto_52850 ) ) ( ON ?auto_52848 ?auto_52854 ) ( not ( = ?auto_52848 ?auto_52854 ) ) ( not ( = ?auto_52849 ?auto_52854 ) ) ( not ( = ?auto_52850 ?auto_52854 ) ) ( ON-TABLE ?auto_52852 ) ( ON ?auto_52853 ?auto_52852 ) ( not ( = ?auto_52852 ?auto_52853 ) ) ( not ( = ?auto_52852 ?auto_52851 ) ) ( not ( = ?auto_52852 ?auto_52850 ) ) ( not ( = ?auto_52852 ?auto_52849 ) ) ( not ( = ?auto_52853 ?auto_52851 ) ) ( not ( = ?auto_52853 ?auto_52850 ) ) ( not ( = ?auto_52853 ?auto_52849 ) ) ( not ( = ?auto_52851 ?auto_52850 ) ) ( not ( = ?auto_52851 ?auto_52849 ) ) ( not ( = ?auto_52848 ?auto_52852 ) ) ( not ( = ?auto_52848 ?auto_52853 ) ) ( not ( = ?auto_52848 ?auto_52851 ) ) ( not ( = ?auto_52854 ?auto_52852 ) ) ( not ( = ?auto_52854 ?auto_52853 ) ) ( not ( = ?auto_52854 ?auto_52851 ) ) ( ON ?auto_52849 ?auto_52848 ) ( ON-TABLE ?auto_52854 ) ( ON ?auto_52850 ?auto_52849 ) ( CLEAR ?auto_52850 ) ( HOLDING ?auto_52851 ) ( CLEAR ?auto_52853 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52852 ?auto_52853 ?auto_52851 )
      ( MAKE-2PILE ?auto_52848 ?auto_52849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52855 - BLOCK
      ?auto_52856 - BLOCK
    )
    :vars
    (
      ?auto_52860 - BLOCK
      ?auto_52861 - BLOCK
      ?auto_52859 - BLOCK
      ?auto_52858 - BLOCK
      ?auto_52857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52855 ?auto_52856 ) ) ( not ( = ?auto_52855 ?auto_52860 ) ) ( not ( = ?auto_52856 ?auto_52860 ) ) ( ON ?auto_52855 ?auto_52861 ) ( not ( = ?auto_52855 ?auto_52861 ) ) ( not ( = ?auto_52856 ?auto_52861 ) ) ( not ( = ?auto_52860 ?auto_52861 ) ) ( ON-TABLE ?auto_52859 ) ( ON ?auto_52858 ?auto_52859 ) ( not ( = ?auto_52859 ?auto_52858 ) ) ( not ( = ?auto_52859 ?auto_52857 ) ) ( not ( = ?auto_52859 ?auto_52860 ) ) ( not ( = ?auto_52859 ?auto_52856 ) ) ( not ( = ?auto_52858 ?auto_52857 ) ) ( not ( = ?auto_52858 ?auto_52860 ) ) ( not ( = ?auto_52858 ?auto_52856 ) ) ( not ( = ?auto_52857 ?auto_52860 ) ) ( not ( = ?auto_52857 ?auto_52856 ) ) ( not ( = ?auto_52855 ?auto_52859 ) ) ( not ( = ?auto_52855 ?auto_52858 ) ) ( not ( = ?auto_52855 ?auto_52857 ) ) ( not ( = ?auto_52861 ?auto_52859 ) ) ( not ( = ?auto_52861 ?auto_52858 ) ) ( not ( = ?auto_52861 ?auto_52857 ) ) ( ON ?auto_52856 ?auto_52855 ) ( ON-TABLE ?auto_52861 ) ( ON ?auto_52860 ?auto_52856 ) ( CLEAR ?auto_52858 ) ( ON ?auto_52857 ?auto_52860 ) ( CLEAR ?auto_52857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52861 ?auto_52855 ?auto_52856 ?auto_52860 )
      ( MAKE-2PILE ?auto_52855 ?auto_52856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52862 - BLOCK
      ?auto_52863 - BLOCK
    )
    :vars
    (
      ?auto_52868 - BLOCK
      ?auto_52865 - BLOCK
      ?auto_52864 - BLOCK
      ?auto_52866 - BLOCK
      ?auto_52867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52862 ?auto_52863 ) ) ( not ( = ?auto_52862 ?auto_52868 ) ) ( not ( = ?auto_52863 ?auto_52868 ) ) ( ON ?auto_52862 ?auto_52865 ) ( not ( = ?auto_52862 ?auto_52865 ) ) ( not ( = ?auto_52863 ?auto_52865 ) ) ( not ( = ?auto_52868 ?auto_52865 ) ) ( ON-TABLE ?auto_52864 ) ( not ( = ?auto_52864 ?auto_52866 ) ) ( not ( = ?auto_52864 ?auto_52867 ) ) ( not ( = ?auto_52864 ?auto_52868 ) ) ( not ( = ?auto_52864 ?auto_52863 ) ) ( not ( = ?auto_52866 ?auto_52867 ) ) ( not ( = ?auto_52866 ?auto_52868 ) ) ( not ( = ?auto_52866 ?auto_52863 ) ) ( not ( = ?auto_52867 ?auto_52868 ) ) ( not ( = ?auto_52867 ?auto_52863 ) ) ( not ( = ?auto_52862 ?auto_52864 ) ) ( not ( = ?auto_52862 ?auto_52866 ) ) ( not ( = ?auto_52862 ?auto_52867 ) ) ( not ( = ?auto_52865 ?auto_52864 ) ) ( not ( = ?auto_52865 ?auto_52866 ) ) ( not ( = ?auto_52865 ?auto_52867 ) ) ( ON ?auto_52863 ?auto_52862 ) ( ON-TABLE ?auto_52865 ) ( ON ?auto_52868 ?auto_52863 ) ( ON ?auto_52867 ?auto_52868 ) ( CLEAR ?auto_52867 ) ( HOLDING ?auto_52866 ) ( CLEAR ?auto_52864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52864 ?auto_52866 )
      ( MAKE-2PILE ?auto_52862 ?auto_52863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52869 - BLOCK
      ?auto_52870 - BLOCK
    )
    :vars
    (
      ?auto_52872 - BLOCK
      ?auto_52871 - BLOCK
      ?auto_52874 - BLOCK
      ?auto_52875 - BLOCK
      ?auto_52873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52869 ?auto_52870 ) ) ( not ( = ?auto_52869 ?auto_52872 ) ) ( not ( = ?auto_52870 ?auto_52872 ) ) ( ON ?auto_52869 ?auto_52871 ) ( not ( = ?auto_52869 ?auto_52871 ) ) ( not ( = ?auto_52870 ?auto_52871 ) ) ( not ( = ?auto_52872 ?auto_52871 ) ) ( ON-TABLE ?auto_52874 ) ( not ( = ?auto_52874 ?auto_52875 ) ) ( not ( = ?auto_52874 ?auto_52873 ) ) ( not ( = ?auto_52874 ?auto_52872 ) ) ( not ( = ?auto_52874 ?auto_52870 ) ) ( not ( = ?auto_52875 ?auto_52873 ) ) ( not ( = ?auto_52875 ?auto_52872 ) ) ( not ( = ?auto_52875 ?auto_52870 ) ) ( not ( = ?auto_52873 ?auto_52872 ) ) ( not ( = ?auto_52873 ?auto_52870 ) ) ( not ( = ?auto_52869 ?auto_52874 ) ) ( not ( = ?auto_52869 ?auto_52875 ) ) ( not ( = ?auto_52869 ?auto_52873 ) ) ( not ( = ?auto_52871 ?auto_52874 ) ) ( not ( = ?auto_52871 ?auto_52875 ) ) ( not ( = ?auto_52871 ?auto_52873 ) ) ( ON ?auto_52870 ?auto_52869 ) ( ON-TABLE ?auto_52871 ) ( ON ?auto_52872 ?auto_52870 ) ( ON ?auto_52873 ?auto_52872 ) ( CLEAR ?auto_52874 ) ( ON ?auto_52875 ?auto_52873 ) ( CLEAR ?auto_52875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52871 ?auto_52869 ?auto_52870 ?auto_52872 ?auto_52873 )
      ( MAKE-2PILE ?auto_52869 ?auto_52870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52876 - BLOCK
      ?auto_52877 - BLOCK
    )
    :vars
    (
      ?auto_52878 - BLOCK
      ?auto_52880 - BLOCK
      ?auto_52881 - BLOCK
      ?auto_52882 - BLOCK
      ?auto_52879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52876 ?auto_52877 ) ) ( not ( = ?auto_52876 ?auto_52878 ) ) ( not ( = ?auto_52877 ?auto_52878 ) ) ( ON ?auto_52876 ?auto_52880 ) ( not ( = ?auto_52876 ?auto_52880 ) ) ( not ( = ?auto_52877 ?auto_52880 ) ) ( not ( = ?auto_52878 ?auto_52880 ) ) ( not ( = ?auto_52881 ?auto_52882 ) ) ( not ( = ?auto_52881 ?auto_52879 ) ) ( not ( = ?auto_52881 ?auto_52878 ) ) ( not ( = ?auto_52881 ?auto_52877 ) ) ( not ( = ?auto_52882 ?auto_52879 ) ) ( not ( = ?auto_52882 ?auto_52878 ) ) ( not ( = ?auto_52882 ?auto_52877 ) ) ( not ( = ?auto_52879 ?auto_52878 ) ) ( not ( = ?auto_52879 ?auto_52877 ) ) ( not ( = ?auto_52876 ?auto_52881 ) ) ( not ( = ?auto_52876 ?auto_52882 ) ) ( not ( = ?auto_52876 ?auto_52879 ) ) ( not ( = ?auto_52880 ?auto_52881 ) ) ( not ( = ?auto_52880 ?auto_52882 ) ) ( not ( = ?auto_52880 ?auto_52879 ) ) ( ON ?auto_52877 ?auto_52876 ) ( ON-TABLE ?auto_52880 ) ( ON ?auto_52878 ?auto_52877 ) ( ON ?auto_52879 ?auto_52878 ) ( ON ?auto_52882 ?auto_52879 ) ( CLEAR ?auto_52882 ) ( HOLDING ?auto_52881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52881 )
      ( MAKE-2PILE ?auto_52876 ?auto_52877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_52883 - BLOCK
      ?auto_52884 - BLOCK
    )
    :vars
    (
      ?auto_52885 - BLOCK
      ?auto_52888 - BLOCK
      ?auto_52889 - BLOCK
      ?auto_52886 - BLOCK
      ?auto_52887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52883 ?auto_52884 ) ) ( not ( = ?auto_52883 ?auto_52885 ) ) ( not ( = ?auto_52884 ?auto_52885 ) ) ( ON ?auto_52883 ?auto_52888 ) ( not ( = ?auto_52883 ?auto_52888 ) ) ( not ( = ?auto_52884 ?auto_52888 ) ) ( not ( = ?auto_52885 ?auto_52888 ) ) ( not ( = ?auto_52889 ?auto_52886 ) ) ( not ( = ?auto_52889 ?auto_52887 ) ) ( not ( = ?auto_52889 ?auto_52885 ) ) ( not ( = ?auto_52889 ?auto_52884 ) ) ( not ( = ?auto_52886 ?auto_52887 ) ) ( not ( = ?auto_52886 ?auto_52885 ) ) ( not ( = ?auto_52886 ?auto_52884 ) ) ( not ( = ?auto_52887 ?auto_52885 ) ) ( not ( = ?auto_52887 ?auto_52884 ) ) ( not ( = ?auto_52883 ?auto_52889 ) ) ( not ( = ?auto_52883 ?auto_52886 ) ) ( not ( = ?auto_52883 ?auto_52887 ) ) ( not ( = ?auto_52888 ?auto_52889 ) ) ( not ( = ?auto_52888 ?auto_52886 ) ) ( not ( = ?auto_52888 ?auto_52887 ) ) ( ON ?auto_52884 ?auto_52883 ) ( ON-TABLE ?auto_52888 ) ( ON ?auto_52885 ?auto_52884 ) ( ON ?auto_52887 ?auto_52885 ) ( ON ?auto_52886 ?auto_52887 ) ( ON ?auto_52889 ?auto_52886 ) ( CLEAR ?auto_52889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52888 ?auto_52883 ?auto_52884 ?auto_52885 ?auto_52887 ?auto_52886 )
      ( MAKE-2PILE ?auto_52883 ?auto_52884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52909 - BLOCK
      ?auto_52910 - BLOCK
      ?auto_52911 - BLOCK
    )
    :vars
    (
      ?auto_52912 - BLOCK
      ?auto_52913 - BLOCK
      ?auto_52914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_52912 ?auto_52911 ) ( ON-TABLE ?auto_52909 ) ( ON ?auto_52910 ?auto_52909 ) ( ON ?auto_52911 ?auto_52910 ) ( not ( = ?auto_52909 ?auto_52910 ) ) ( not ( = ?auto_52909 ?auto_52911 ) ) ( not ( = ?auto_52909 ?auto_52912 ) ) ( not ( = ?auto_52910 ?auto_52911 ) ) ( not ( = ?auto_52910 ?auto_52912 ) ) ( not ( = ?auto_52911 ?auto_52912 ) ) ( not ( = ?auto_52909 ?auto_52913 ) ) ( not ( = ?auto_52909 ?auto_52914 ) ) ( not ( = ?auto_52910 ?auto_52913 ) ) ( not ( = ?auto_52910 ?auto_52914 ) ) ( not ( = ?auto_52911 ?auto_52913 ) ) ( not ( = ?auto_52911 ?auto_52914 ) ) ( not ( = ?auto_52912 ?auto_52913 ) ) ( not ( = ?auto_52912 ?auto_52914 ) ) ( not ( = ?auto_52913 ?auto_52914 ) ) ( ON ?auto_52913 ?auto_52912 ) ( CLEAR ?auto_52913 ) ( HOLDING ?auto_52914 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52914 )
      ( MAKE-3PILE ?auto_52909 ?auto_52910 ?auto_52911 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52974 - BLOCK
      ?auto_52975 - BLOCK
      ?auto_52976 - BLOCK
    )
    :vars
    (
      ?auto_52977 - BLOCK
      ?auto_52979 - BLOCK
      ?auto_52978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52974 ) ( not ( = ?auto_52974 ?auto_52975 ) ) ( not ( = ?auto_52974 ?auto_52976 ) ) ( not ( = ?auto_52975 ?auto_52976 ) ) ( ON ?auto_52976 ?auto_52977 ) ( not ( = ?auto_52974 ?auto_52977 ) ) ( not ( = ?auto_52975 ?auto_52977 ) ) ( not ( = ?auto_52976 ?auto_52977 ) ) ( CLEAR ?auto_52974 ) ( ON ?auto_52975 ?auto_52976 ) ( CLEAR ?auto_52975 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52979 ) ( ON ?auto_52978 ?auto_52979 ) ( ON ?auto_52977 ?auto_52978 ) ( not ( = ?auto_52979 ?auto_52978 ) ) ( not ( = ?auto_52979 ?auto_52977 ) ) ( not ( = ?auto_52979 ?auto_52976 ) ) ( not ( = ?auto_52979 ?auto_52975 ) ) ( not ( = ?auto_52978 ?auto_52977 ) ) ( not ( = ?auto_52978 ?auto_52976 ) ) ( not ( = ?auto_52978 ?auto_52975 ) ) ( not ( = ?auto_52974 ?auto_52979 ) ) ( not ( = ?auto_52974 ?auto_52978 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52979 ?auto_52978 ?auto_52977 ?auto_52976 )
      ( MAKE-3PILE ?auto_52974 ?auto_52975 ?auto_52976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52980 - BLOCK
      ?auto_52981 - BLOCK
      ?auto_52982 - BLOCK
    )
    :vars
    (
      ?auto_52985 - BLOCK
      ?auto_52984 - BLOCK
      ?auto_52983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52980 ?auto_52981 ) ) ( not ( = ?auto_52980 ?auto_52982 ) ) ( not ( = ?auto_52981 ?auto_52982 ) ) ( ON ?auto_52982 ?auto_52985 ) ( not ( = ?auto_52980 ?auto_52985 ) ) ( not ( = ?auto_52981 ?auto_52985 ) ) ( not ( = ?auto_52982 ?auto_52985 ) ) ( ON ?auto_52981 ?auto_52982 ) ( CLEAR ?auto_52981 ) ( ON-TABLE ?auto_52984 ) ( ON ?auto_52983 ?auto_52984 ) ( ON ?auto_52985 ?auto_52983 ) ( not ( = ?auto_52984 ?auto_52983 ) ) ( not ( = ?auto_52984 ?auto_52985 ) ) ( not ( = ?auto_52984 ?auto_52982 ) ) ( not ( = ?auto_52984 ?auto_52981 ) ) ( not ( = ?auto_52983 ?auto_52985 ) ) ( not ( = ?auto_52983 ?auto_52982 ) ) ( not ( = ?auto_52983 ?auto_52981 ) ) ( not ( = ?auto_52980 ?auto_52984 ) ) ( not ( = ?auto_52980 ?auto_52983 ) ) ( HOLDING ?auto_52980 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52980 )
      ( MAKE-3PILE ?auto_52980 ?auto_52981 ?auto_52982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52986 - BLOCK
      ?auto_52987 - BLOCK
      ?auto_52988 - BLOCK
    )
    :vars
    (
      ?auto_52989 - BLOCK
      ?auto_52991 - BLOCK
      ?auto_52990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52986 ?auto_52987 ) ) ( not ( = ?auto_52986 ?auto_52988 ) ) ( not ( = ?auto_52987 ?auto_52988 ) ) ( ON ?auto_52988 ?auto_52989 ) ( not ( = ?auto_52986 ?auto_52989 ) ) ( not ( = ?auto_52987 ?auto_52989 ) ) ( not ( = ?auto_52988 ?auto_52989 ) ) ( ON ?auto_52987 ?auto_52988 ) ( ON-TABLE ?auto_52991 ) ( ON ?auto_52990 ?auto_52991 ) ( ON ?auto_52989 ?auto_52990 ) ( not ( = ?auto_52991 ?auto_52990 ) ) ( not ( = ?auto_52991 ?auto_52989 ) ) ( not ( = ?auto_52991 ?auto_52988 ) ) ( not ( = ?auto_52991 ?auto_52987 ) ) ( not ( = ?auto_52990 ?auto_52989 ) ) ( not ( = ?auto_52990 ?auto_52988 ) ) ( not ( = ?auto_52990 ?auto_52987 ) ) ( not ( = ?auto_52986 ?auto_52991 ) ) ( not ( = ?auto_52986 ?auto_52990 ) ) ( ON ?auto_52986 ?auto_52987 ) ( CLEAR ?auto_52986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52991 ?auto_52990 ?auto_52989 ?auto_52988 ?auto_52987 )
      ( MAKE-3PILE ?auto_52986 ?auto_52987 ?auto_52988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_52995 - BLOCK
      ?auto_52996 - BLOCK
      ?auto_52997 - BLOCK
    )
    :vars
    (
      ?auto_52999 - BLOCK
      ?auto_52998 - BLOCK
      ?auto_53000 - BLOCK
      ?auto_53001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52995 ?auto_52996 ) ) ( not ( = ?auto_52995 ?auto_52997 ) ) ( not ( = ?auto_52996 ?auto_52997 ) ) ( ON ?auto_52997 ?auto_52999 ) ( not ( = ?auto_52995 ?auto_52999 ) ) ( not ( = ?auto_52996 ?auto_52999 ) ) ( not ( = ?auto_52997 ?auto_52999 ) ) ( ON ?auto_52996 ?auto_52997 ) ( CLEAR ?auto_52996 ) ( ON-TABLE ?auto_52998 ) ( ON ?auto_53000 ?auto_52998 ) ( ON ?auto_52999 ?auto_53000 ) ( not ( = ?auto_52998 ?auto_53000 ) ) ( not ( = ?auto_52998 ?auto_52999 ) ) ( not ( = ?auto_52998 ?auto_52997 ) ) ( not ( = ?auto_52998 ?auto_52996 ) ) ( not ( = ?auto_53000 ?auto_52999 ) ) ( not ( = ?auto_53000 ?auto_52997 ) ) ( not ( = ?auto_53000 ?auto_52996 ) ) ( not ( = ?auto_52995 ?auto_52998 ) ) ( not ( = ?auto_52995 ?auto_53000 ) ) ( ON ?auto_52995 ?auto_53001 ) ( CLEAR ?auto_52995 ) ( HAND-EMPTY ) ( not ( = ?auto_52995 ?auto_53001 ) ) ( not ( = ?auto_52996 ?auto_53001 ) ) ( not ( = ?auto_52997 ?auto_53001 ) ) ( not ( = ?auto_52999 ?auto_53001 ) ) ( not ( = ?auto_52998 ?auto_53001 ) ) ( not ( = ?auto_53000 ?auto_53001 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52995 ?auto_53001 )
      ( MAKE-3PILE ?auto_52995 ?auto_52996 ?auto_52997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53002 - BLOCK
      ?auto_53003 - BLOCK
      ?auto_53004 - BLOCK
    )
    :vars
    (
      ?auto_53007 - BLOCK
      ?auto_53008 - BLOCK
      ?auto_53005 - BLOCK
      ?auto_53006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53002 ?auto_53003 ) ) ( not ( = ?auto_53002 ?auto_53004 ) ) ( not ( = ?auto_53003 ?auto_53004 ) ) ( ON ?auto_53004 ?auto_53007 ) ( not ( = ?auto_53002 ?auto_53007 ) ) ( not ( = ?auto_53003 ?auto_53007 ) ) ( not ( = ?auto_53004 ?auto_53007 ) ) ( ON-TABLE ?auto_53008 ) ( ON ?auto_53005 ?auto_53008 ) ( ON ?auto_53007 ?auto_53005 ) ( not ( = ?auto_53008 ?auto_53005 ) ) ( not ( = ?auto_53008 ?auto_53007 ) ) ( not ( = ?auto_53008 ?auto_53004 ) ) ( not ( = ?auto_53008 ?auto_53003 ) ) ( not ( = ?auto_53005 ?auto_53007 ) ) ( not ( = ?auto_53005 ?auto_53004 ) ) ( not ( = ?auto_53005 ?auto_53003 ) ) ( not ( = ?auto_53002 ?auto_53008 ) ) ( not ( = ?auto_53002 ?auto_53005 ) ) ( ON ?auto_53002 ?auto_53006 ) ( CLEAR ?auto_53002 ) ( not ( = ?auto_53002 ?auto_53006 ) ) ( not ( = ?auto_53003 ?auto_53006 ) ) ( not ( = ?auto_53004 ?auto_53006 ) ) ( not ( = ?auto_53007 ?auto_53006 ) ) ( not ( = ?auto_53008 ?auto_53006 ) ) ( not ( = ?auto_53005 ?auto_53006 ) ) ( HOLDING ?auto_53003 ) ( CLEAR ?auto_53004 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53008 ?auto_53005 ?auto_53007 ?auto_53004 ?auto_53003 )
      ( MAKE-3PILE ?auto_53002 ?auto_53003 ?auto_53004 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53009 - BLOCK
      ?auto_53010 - BLOCK
      ?auto_53011 - BLOCK
    )
    :vars
    (
      ?auto_53015 - BLOCK
      ?auto_53012 - BLOCK
      ?auto_53014 - BLOCK
      ?auto_53013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53009 ?auto_53010 ) ) ( not ( = ?auto_53009 ?auto_53011 ) ) ( not ( = ?auto_53010 ?auto_53011 ) ) ( ON ?auto_53011 ?auto_53015 ) ( not ( = ?auto_53009 ?auto_53015 ) ) ( not ( = ?auto_53010 ?auto_53015 ) ) ( not ( = ?auto_53011 ?auto_53015 ) ) ( ON-TABLE ?auto_53012 ) ( ON ?auto_53014 ?auto_53012 ) ( ON ?auto_53015 ?auto_53014 ) ( not ( = ?auto_53012 ?auto_53014 ) ) ( not ( = ?auto_53012 ?auto_53015 ) ) ( not ( = ?auto_53012 ?auto_53011 ) ) ( not ( = ?auto_53012 ?auto_53010 ) ) ( not ( = ?auto_53014 ?auto_53015 ) ) ( not ( = ?auto_53014 ?auto_53011 ) ) ( not ( = ?auto_53014 ?auto_53010 ) ) ( not ( = ?auto_53009 ?auto_53012 ) ) ( not ( = ?auto_53009 ?auto_53014 ) ) ( ON ?auto_53009 ?auto_53013 ) ( not ( = ?auto_53009 ?auto_53013 ) ) ( not ( = ?auto_53010 ?auto_53013 ) ) ( not ( = ?auto_53011 ?auto_53013 ) ) ( not ( = ?auto_53015 ?auto_53013 ) ) ( not ( = ?auto_53012 ?auto_53013 ) ) ( not ( = ?auto_53014 ?auto_53013 ) ) ( CLEAR ?auto_53011 ) ( ON ?auto_53010 ?auto_53009 ) ( CLEAR ?auto_53010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53013 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53013 ?auto_53009 )
      ( MAKE-3PILE ?auto_53009 ?auto_53010 ?auto_53011 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53016 - BLOCK
      ?auto_53017 - BLOCK
      ?auto_53018 - BLOCK
    )
    :vars
    (
      ?auto_53022 - BLOCK
      ?auto_53019 - BLOCK
      ?auto_53021 - BLOCK
      ?auto_53020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53016 ?auto_53017 ) ) ( not ( = ?auto_53016 ?auto_53018 ) ) ( not ( = ?auto_53017 ?auto_53018 ) ) ( not ( = ?auto_53016 ?auto_53022 ) ) ( not ( = ?auto_53017 ?auto_53022 ) ) ( not ( = ?auto_53018 ?auto_53022 ) ) ( ON-TABLE ?auto_53019 ) ( ON ?auto_53021 ?auto_53019 ) ( ON ?auto_53022 ?auto_53021 ) ( not ( = ?auto_53019 ?auto_53021 ) ) ( not ( = ?auto_53019 ?auto_53022 ) ) ( not ( = ?auto_53019 ?auto_53018 ) ) ( not ( = ?auto_53019 ?auto_53017 ) ) ( not ( = ?auto_53021 ?auto_53022 ) ) ( not ( = ?auto_53021 ?auto_53018 ) ) ( not ( = ?auto_53021 ?auto_53017 ) ) ( not ( = ?auto_53016 ?auto_53019 ) ) ( not ( = ?auto_53016 ?auto_53021 ) ) ( ON ?auto_53016 ?auto_53020 ) ( not ( = ?auto_53016 ?auto_53020 ) ) ( not ( = ?auto_53017 ?auto_53020 ) ) ( not ( = ?auto_53018 ?auto_53020 ) ) ( not ( = ?auto_53022 ?auto_53020 ) ) ( not ( = ?auto_53019 ?auto_53020 ) ) ( not ( = ?auto_53021 ?auto_53020 ) ) ( ON ?auto_53017 ?auto_53016 ) ( CLEAR ?auto_53017 ) ( ON-TABLE ?auto_53020 ) ( HOLDING ?auto_53018 ) ( CLEAR ?auto_53022 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53019 ?auto_53021 ?auto_53022 ?auto_53018 )
      ( MAKE-3PILE ?auto_53016 ?auto_53017 ?auto_53018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53023 - BLOCK
      ?auto_53024 - BLOCK
      ?auto_53025 - BLOCK
    )
    :vars
    (
      ?auto_53027 - BLOCK
      ?auto_53029 - BLOCK
      ?auto_53026 - BLOCK
      ?auto_53028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53023 ?auto_53024 ) ) ( not ( = ?auto_53023 ?auto_53025 ) ) ( not ( = ?auto_53024 ?auto_53025 ) ) ( not ( = ?auto_53023 ?auto_53027 ) ) ( not ( = ?auto_53024 ?auto_53027 ) ) ( not ( = ?auto_53025 ?auto_53027 ) ) ( ON-TABLE ?auto_53029 ) ( ON ?auto_53026 ?auto_53029 ) ( ON ?auto_53027 ?auto_53026 ) ( not ( = ?auto_53029 ?auto_53026 ) ) ( not ( = ?auto_53029 ?auto_53027 ) ) ( not ( = ?auto_53029 ?auto_53025 ) ) ( not ( = ?auto_53029 ?auto_53024 ) ) ( not ( = ?auto_53026 ?auto_53027 ) ) ( not ( = ?auto_53026 ?auto_53025 ) ) ( not ( = ?auto_53026 ?auto_53024 ) ) ( not ( = ?auto_53023 ?auto_53029 ) ) ( not ( = ?auto_53023 ?auto_53026 ) ) ( ON ?auto_53023 ?auto_53028 ) ( not ( = ?auto_53023 ?auto_53028 ) ) ( not ( = ?auto_53024 ?auto_53028 ) ) ( not ( = ?auto_53025 ?auto_53028 ) ) ( not ( = ?auto_53027 ?auto_53028 ) ) ( not ( = ?auto_53029 ?auto_53028 ) ) ( not ( = ?auto_53026 ?auto_53028 ) ) ( ON ?auto_53024 ?auto_53023 ) ( ON-TABLE ?auto_53028 ) ( CLEAR ?auto_53027 ) ( ON ?auto_53025 ?auto_53024 ) ( CLEAR ?auto_53025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53028 ?auto_53023 ?auto_53024 )
      ( MAKE-3PILE ?auto_53023 ?auto_53024 ?auto_53025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53030 - BLOCK
      ?auto_53031 - BLOCK
      ?auto_53032 - BLOCK
    )
    :vars
    (
      ?auto_53033 - BLOCK
      ?auto_53036 - BLOCK
      ?auto_53035 - BLOCK
      ?auto_53034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53030 ?auto_53031 ) ) ( not ( = ?auto_53030 ?auto_53032 ) ) ( not ( = ?auto_53031 ?auto_53032 ) ) ( not ( = ?auto_53030 ?auto_53033 ) ) ( not ( = ?auto_53031 ?auto_53033 ) ) ( not ( = ?auto_53032 ?auto_53033 ) ) ( ON-TABLE ?auto_53036 ) ( ON ?auto_53035 ?auto_53036 ) ( not ( = ?auto_53036 ?auto_53035 ) ) ( not ( = ?auto_53036 ?auto_53033 ) ) ( not ( = ?auto_53036 ?auto_53032 ) ) ( not ( = ?auto_53036 ?auto_53031 ) ) ( not ( = ?auto_53035 ?auto_53033 ) ) ( not ( = ?auto_53035 ?auto_53032 ) ) ( not ( = ?auto_53035 ?auto_53031 ) ) ( not ( = ?auto_53030 ?auto_53036 ) ) ( not ( = ?auto_53030 ?auto_53035 ) ) ( ON ?auto_53030 ?auto_53034 ) ( not ( = ?auto_53030 ?auto_53034 ) ) ( not ( = ?auto_53031 ?auto_53034 ) ) ( not ( = ?auto_53032 ?auto_53034 ) ) ( not ( = ?auto_53033 ?auto_53034 ) ) ( not ( = ?auto_53036 ?auto_53034 ) ) ( not ( = ?auto_53035 ?auto_53034 ) ) ( ON ?auto_53031 ?auto_53030 ) ( ON-TABLE ?auto_53034 ) ( ON ?auto_53032 ?auto_53031 ) ( CLEAR ?auto_53032 ) ( HOLDING ?auto_53033 ) ( CLEAR ?auto_53035 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53036 ?auto_53035 ?auto_53033 )
      ( MAKE-3PILE ?auto_53030 ?auto_53031 ?auto_53032 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53037 - BLOCK
      ?auto_53038 - BLOCK
      ?auto_53039 - BLOCK
    )
    :vars
    (
      ?auto_53043 - BLOCK
      ?auto_53042 - BLOCK
      ?auto_53041 - BLOCK
      ?auto_53040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53037 ?auto_53038 ) ) ( not ( = ?auto_53037 ?auto_53039 ) ) ( not ( = ?auto_53038 ?auto_53039 ) ) ( not ( = ?auto_53037 ?auto_53043 ) ) ( not ( = ?auto_53038 ?auto_53043 ) ) ( not ( = ?auto_53039 ?auto_53043 ) ) ( ON-TABLE ?auto_53042 ) ( ON ?auto_53041 ?auto_53042 ) ( not ( = ?auto_53042 ?auto_53041 ) ) ( not ( = ?auto_53042 ?auto_53043 ) ) ( not ( = ?auto_53042 ?auto_53039 ) ) ( not ( = ?auto_53042 ?auto_53038 ) ) ( not ( = ?auto_53041 ?auto_53043 ) ) ( not ( = ?auto_53041 ?auto_53039 ) ) ( not ( = ?auto_53041 ?auto_53038 ) ) ( not ( = ?auto_53037 ?auto_53042 ) ) ( not ( = ?auto_53037 ?auto_53041 ) ) ( ON ?auto_53037 ?auto_53040 ) ( not ( = ?auto_53037 ?auto_53040 ) ) ( not ( = ?auto_53038 ?auto_53040 ) ) ( not ( = ?auto_53039 ?auto_53040 ) ) ( not ( = ?auto_53043 ?auto_53040 ) ) ( not ( = ?auto_53042 ?auto_53040 ) ) ( not ( = ?auto_53041 ?auto_53040 ) ) ( ON ?auto_53038 ?auto_53037 ) ( ON-TABLE ?auto_53040 ) ( ON ?auto_53039 ?auto_53038 ) ( CLEAR ?auto_53041 ) ( ON ?auto_53043 ?auto_53039 ) ( CLEAR ?auto_53043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53040 ?auto_53037 ?auto_53038 ?auto_53039 )
      ( MAKE-3PILE ?auto_53037 ?auto_53038 ?auto_53039 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53044 - BLOCK
      ?auto_53045 - BLOCK
      ?auto_53046 - BLOCK
    )
    :vars
    (
      ?auto_53050 - BLOCK
      ?auto_53048 - BLOCK
      ?auto_53047 - BLOCK
      ?auto_53049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53044 ?auto_53045 ) ) ( not ( = ?auto_53044 ?auto_53046 ) ) ( not ( = ?auto_53045 ?auto_53046 ) ) ( not ( = ?auto_53044 ?auto_53050 ) ) ( not ( = ?auto_53045 ?auto_53050 ) ) ( not ( = ?auto_53046 ?auto_53050 ) ) ( ON-TABLE ?auto_53048 ) ( not ( = ?auto_53048 ?auto_53047 ) ) ( not ( = ?auto_53048 ?auto_53050 ) ) ( not ( = ?auto_53048 ?auto_53046 ) ) ( not ( = ?auto_53048 ?auto_53045 ) ) ( not ( = ?auto_53047 ?auto_53050 ) ) ( not ( = ?auto_53047 ?auto_53046 ) ) ( not ( = ?auto_53047 ?auto_53045 ) ) ( not ( = ?auto_53044 ?auto_53048 ) ) ( not ( = ?auto_53044 ?auto_53047 ) ) ( ON ?auto_53044 ?auto_53049 ) ( not ( = ?auto_53044 ?auto_53049 ) ) ( not ( = ?auto_53045 ?auto_53049 ) ) ( not ( = ?auto_53046 ?auto_53049 ) ) ( not ( = ?auto_53050 ?auto_53049 ) ) ( not ( = ?auto_53048 ?auto_53049 ) ) ( not ( = ?auto_53047 ?auto_53049 ) ) ( ON ?auto_53045 ?auto_53044 ) ( ON-TABLE ?auto_53049 ) ( ON ?auto_53046 ?auto_53045 ) ( ON ?auto_53050 ?auto_53046 ) ( CLEAR ?auto_53050 ) ( HOLDING ?auto_53047 ) ( CLEAR ?auto_53048 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53048 ?auto_53047 )
      ( MAKE-3PILE ?auto_53044 ?auto_53045 ?auto_53046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53051 - BLOCK
      ?auto_53052 - BLOCK
      ?auto_53053 - BLOCK
    )
    :vars
    (
      ?auto_53055 - BLOCK
      ?auto_53056 - BLOCK
      ?auto_53054 - BLOCK
      ?auto_53057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53051 ?auto_53052 ) ) ( not ( = ?auto_53051 ?auto_53053 ) ) ( not ( = ?auto_53052 ?auto_53053 ) ) ( not ( = ?auto_53051 ?auto_53055 ) ) ( not ( = ?auto_53052 ?auto_53055 ) ) ( not ( = ?auto_53053 ?auto_53055 ) ) ( ON-TABLE ?auto_53056 ) ( not ( = ?auto_53056 ?auto_53054 ) ) ( not ( = ?auto_53056 ?auto_53055 ) ) ( not ( = ?auto_53056 ?auto_53053 ) ) ( not ( = ?auto_53056 ?auto_53052 ) ) ( not ( = ?auto_53054 ?auto_53055 ) ) ( not ( = ?auto_53054 ?auto_53053 ) ) ( not ( = ?auto_53054 ?auto_53052 ) ) ( not ( = ?auto_53051 ?auto_53056 ) ) ( not ( = ?auto_53051 ?auto_53054 ) ) ( ON ?auto_53051 ?auto_53057 ) ( not ( = ?auto_53051 ?auto_53057 ) ) ( not ( = ?auto_53052 ?auto_53057 ) ) ( not ( = ?auto_53053 ?auto_53057 ) ) ( not ( = ?auto_53055 ?auto_53057 ) ) ( not ( = ?auto_53056 ?auto_53057 ) ) ( not ( = ?auto_53054 ?auto_53057 ) ) ( ON ?auto_53052 ?auto_53051 ) ( ON-TABLE ?auto_53057 ) ( ON ?auto_53053 ?auto_53052 ) ( ON ?auto_53055 ?auto_53053 ) ( CLEAR ?auto_53056 ) ( ON ?auto_53054 ?auto_53055 ) ( CLEAR ?auto_53054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53057 ?auto_53051 ?auto_53052 ?auto_53053 ?auto_53055 )
      ( MAKE-3PILE ?auto_53051 ?auto_53052 ?auto_53053 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53058 - BLOCK
      ?auto_53059 - BLOCK
      ?auto_53060 - BLOCK
    )
    :vars
    (
      ?auto_53063 - BLOCK
      ?auto_53064 - BLOCK
      ?auto_53061 - BLOCK
      ?auto_53062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53058 ?auto_53059 ) ) ( not ( = ?auto_53058 ?auto_53060 ) ) ( not ( = ?auto_53059 ?auto_53060 ) ) ( not ( = ?auto_53058 ?auto_53063 ) ) ( not ( = ?auto_53059 ?auto_53063 ) ) ( not ( = ?auto_53060 ?auto_53063 ) ) ( not ( = ?auto_53064 ?auto_53061 ) ) ( not ( = ?auto_53064 ?auto_53063 ) ) ( not ( = ?auto_53064 ?auto_53060 ) ) ( not ( = ?auto_53064 ?auto_53059 ) ) ( not ( = ?auto_53061 ?auto_53063 ) ) ( not ( = ?auto_53061 ?auto_53060 ) ) ( not ( = ?auto_53061 ?auto_53059 ) ) ( not ( = ?auto_53058 ?auto_53064 ) ) ( not ( = ?auto_53058 ?auto_53061 ) ) ( ON ?auto_53058 ?auto_53062 ) ( not ( = ?auto_53058 ?auto_53062 ) ) ( not ( = ?auto_53059 ?auto_53062 ) ) ( not ( = ?auto_53060 ?auto_53062 ) ) ( not ( = ?auto_53063 ?auto_53062 ) ) ( not ( = ?auto_53064 ?auto_53062 ) ) ( not ( = ?auto_53061 ?auto_53062 ) ) ( ON ?auto_53059 ?auto_53058 ) ( ON-TABLE ?auto_53062 ) ( ON ?auto_53060 ?auto_53059 ) ( ON ?auto_53063 ?auto_53060 ) ( ON ?auto_53061 ?auto_53063 ) ( CLEAR ?auto_53061 ) ( HOLDING ?auto_53064 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53064 )
      ( MAKE-3PILE ?auto_53058 ?auto_53059 ?auto_53060 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53065 - BLOCK
      ?auto_53066 - BLOCK
      ?auto_53067 - BLOCK
    )
    :vars
    (
      ?auto_53071 - BLOCK
      ?auto_53070 - BLOCK
      ?auto_53068 - BLOCK
      ?auto_53069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53065 ?auto_53066 ) ) ( not ( = ?auto_53065 ?auto_53067 ) ) ( not ( = ?auto_53066 ?auto_53067 ) ) ( not ( = ?auto_53065 ?auto_53071 ) ) ( not ( = ?auto_53066 ?auto_53071 ) ) ( not ( = ?auto_53067 ?auto_53071 ) ) ( not ( = ?auto_53070 ?auto_53068 ) ) ( not ( = ?auto_53070 ?auto_53071 ) ) ( not ( = ?auto_53070 ?auto_53067 ) ) ( not ( = ?auto_53070 ?auto_53066 ) ) ( not ( = ?auto_53068 ?auto_53071 ) ) ( not ( = ?auto_53068 ?auto_53067 ) ) ( not ( = ?auto_53068 ?auto_53066 ) ) ( not ( = ?auto_53065 ?auto_53070 ) ) ( not ( = ?auto_53065 ?auto_53068 ) ) ( ON ?auto_53065 ?auto_53069 ) ( not ( = ?auto_53065 ?auto_53069 ) ) ( not ( = ?auto_53066 ?auto_53069 ) ) ( not ( = ?auto_53067 ?auto_53069 ) ) ( not ( = ?auto_53071 ?auto_53069 ) ) ( not ( = ?auto_53070 ?auto_53069 ) ) ( not ( = ?auto_53068 ?auto_53069 ) ) ( ON ?auto_53066 ?auto_53065 ) ( ON-TABLE ?auto_53069 ) ( ON ?auto_53067 ?auto_53066 ) ( ON ?auto_53071 ?auto_53067 ) ( ON ?auto_53068 ?auto_53071 ) ( ON ?auto_53070 ?auto_53068 ) ( CLEAR ?auto_53070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53069 ?auto_53065 ?auto_53066 ?auto_53067 ?auto_53071 ?auto_53068 )
      ( MAKE-3PILE ?auto_53065 ?auto_53066 ?auto_53067 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53087 - BLOCK
      ?auto_53088 - BLOCK
    )
    :vars
    (
      ?auto_53089 - BLOCK
      ?auto_53091 - BLOCK
      ?auto_53090 - BLOCK
      ?auto_53092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53089 ?auto_53088 ) ( ON-TABLE ?auto_53087 ) ( ON ?auto_53088 ?auto_53087 ) ( not ( = ?auto_53087 ?auto_53088 ) ) ( not ( = ?auto_53087 ?auto_53089 ) ) ( not ( = ?auto_53088 ?auto_53089 ) ) ( not ( = ?auto_53087 ?auto_53091 ) ) ( not ( = ?auto_53087 ?auto_53090 ) ) ( not ( = ?auto_53088 ?auto_53091 ) ) ( not ( = ?auto_53088 ?auto_53090 ) ) ( not ( = ?auto_53089 ?auto_53091 ) ) ( not ( = ?auto_53089 ?auto_53090 ) ) ( not ( = ?auto_53091 ?auto_53090 ) ) ( ON ?auto_53091 ?auto_53089 ) ( CLEAR ?auto_53091 ) ( HOLDING ?auto_53090 ) ( CLEAR ?auto_53092 ) ( ON-TABLE ?auto_53092 ) ( not ( = ?auto_53092 ?auto_53090 ) ) ( not ( = ?auto_53087 ?auto_53092 ) ) ( not ( = ?auto_53088 ?auto_53092 ) ) ( not ( = ?auto_53089 ?auto_53092 ) ) ( not ( = ?auto_53091 ?auto_53092 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53092 ?auto_53090 )
      ( MAKE-2PILE ?auto_53087 ?auto_53088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53093 - BLOCK
      ?auto_53094 - BLOCK
    )
    :vars
    (
      ?auto_53097 - BLOCK
      ?auto_53096 - BLOCK
      ?auto_53095 - BLOCK
      ?auto_53098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53097 ?auto_53094 ) ( ON-TABLE ?auto_53093 ) ( ON ?auto_53094 ?auto_53093 ) ( not ( = ?auto_53093 ?auto_53094 ) ) ( not ( = ?auto_53093 ?auto_53097 ) ) ( not ( = ?auto_53094 ?auto_53097 ) ) ( not ( = ?auto_53093 ?auto_53096 ) ) ( not ( = ?auto_53093 ?auto_53095 ) ) ( not ( = ?auto_53094 ?auto_53096 ) ) ( not ( = ?auto_53094 ?auto_53095 ) ) ( not ( = ?auto_53097 ?auto_53096 ) ) ( not ( = ?auto_53097 ?auto_53095 ) ) ( not ( = ?auto_53096 ?auto_53095 ) ) ( ON ?auto_53096 ?auto_53097 ) ( CLEAR ?auto_53098 ) ( ON-TABLE ?auto_53098 ) ( not ( = ?auto_53098 ?auto_53095 ) ) ( not ( = ?auto_53093 ?auto_53098 ) ) ( not ( = ?auto_53094 ?auto_53098 ) ) ( not ( = ?auto_53097 ?auto_53098 ) ) ( not ( = ?auto_53096 ?auto_53098 ) ) ( ON ?auto_53095 ?auto_53096 ) ( CLEAR ?auto_53095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53093 ?auto_53094 ?auto_53097 ?auto_53096 )
      ( MAKE-2PILE ?auto_53093 ?auto_53094 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53099 - BLOCK
      ?auto_53100 - BLOCK
    )
    :vars
    (
      ?auto_53103 - BLOCK
      ?auto_53104 - BLOCK
      ?auto_53102 - BLOCK
      ?auto_53101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53103 ?auto_53100 ) ( ON-TABLE ?auto_53099 ) ( ON ?auto_53100 ?auto_53099 ) ( not ( = ?auto_53099 ?auto_53100 ) ) ( not ( = ?auto_53099 ?auto_53103 ) ) ( not ( = ?auto_53100 ?auto_53103 ) ) ( not ( = ?auto_53099 ?auto_53104 ) ) ( not ( = ?auto_53099 ?auto_53102 ) ) ( not ( = ?auto_53100 ?auto_53104 ) ) ( not ( = ?auto_53100 ?auto_53102 ) ) ( not ( = ?auto_53103 ?auto_53104 ) ) ( not ( = ?auto_53103 ?auto_53102 ) ) ( not ( = ?auto_53104 ?auto_53102 ) ) ( ON ?auto_53104 ?auto_53103 ) ( not ( = ?auto_53101 ?auto_53102 ) ) ( not ( = ?auto_53099 ?auto_53101 ) ) ( not ( = ?auto_53100 ?auto_53101 ) ) ( not ( = ?auto_53103 ?auto_53101 ) ) ( not ( = ?auto_53104 ?auto_53101 ) ) ( ON ?auto_53102 ?auto_53104 ) ( CLEAR ?auto_53102 ) ( HOLDING ?auto_53101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53101 )
      ( MAKE-2PILE ?auto_53099 ?auto_53100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53113 - BLOCK
      ?auto_53114 - BLOCK
    )
    :vars
    (
      ?auto_53117 - BLOCK
      ?auto_53115 - BLOCK
      ?auto_53118 - BLOCK
      ?auto_53116 - BLOCK
      ?auto_53119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53117 ?auto_53114 ) ( ON-TABLE ?auto_53113 ) ( ON ?auto_53114 ?auto_53113 ) ( not ( = ?auto_53113 ?auto_53114 ) ) ( not ( = ?auto_53113 ?auto_53117 ) ) ( not ( = ?auto_53114 ?auto_53117 ) ) ( not ( = ?auto_53113 ?auto_53115 ) ) ( not ( = ?auto_53113 ?auto_53118 ) ) ( not ( = ?auto_53114 ?auto_53115 ) ) ( not ( = ?auto_53114 ?auto_53118 ) ) ( not ( = ?auto_53117 ?auto_53115 ) ) ( not ( = ?auto_53117 ?auto_53118 ) ) ( not ( = ?auto_53115 ?auto_53118 ) ) ( ON ?auto_53115 ?auto_53117 ) ( not ( = ?auto_53116 ?auto_53118 ) ) ( not ( = ?auto_53113 ?auto_53116 ) ) ( not ( = ?auto_53114 ?auto_53116 ) ) ( not ( = ?auto_53117 ?auto_53116 ) ) ( not ( = ?auto_53115 ?auto_53116 ) ) ( ON ?auto_53118 ?auto_53115 ) ( CLEAR ?auto_53118 ) ( ON ?auto_53116 ?auto_53119 ) ( CLEAR ?auto_53116 ) ( HAND-EMPTY ) ( not ( = ?auto_53113 ?auto_53119 ) ) ( not ( = ?auto_53114 ?auto_53119 ) ) ( not ( = ?auto_53117 ?auto_53119 ) ) ( not ( = ?auto_53115 ?auto_53119 ) ) ( not ( = ?auto_53118 ?auto_53119 ) ) ( not ( = ?auto_53116 ?auto_53119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53116 ?auto_53119 )
      ( MAKE-2PILE ?auto_53113 ?auto_53114 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53120 - BLOCK
      ?auto_53121 - BLOCK
    )
    :vars
    (
      ?auto_53122 - BLOCK
      ?auto_53126 - BLOCK
      ?auto_53124 - BLOCK
      ?auto_53123 - BLOCK
      ?auto_53125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53122 ?auto_53121 ) ( ON-TABLE ?auto_53120 ) ( ON ?auto_53121 ?auto_53120 ) ( not ( = ?auto_53120 ?auto_53121 ) ) ( not ( = ?auto_53120 ?auto_53122 ) ) ( not ( = ?auto_53121 ?auto_53122 ) ) ( not ( = ?auto_53120 ?auto_53126 ) ) ( not ( = ?auto_53120 ?auto_53124 ) ) ( not ( = ?auto_53121 ?auto_53126 ) ) ( not ( = ?auto_53121 ?auto_53124 ) ) ( not ( = ?auto_53122 ?auto_53126 ) ) ( not ( = ?auto_53122 ?auto_53124 ) ) ( not ( = ?auto_53126 ?auto_53124 ) ) ( ON ?auto_53126 ?auto_53122 ) ( not ( = ?auto_53123 ?auto_53124 ) ) ( not ( = ?auto_53120 ?auto_53123 ) ) ( not ( = ?auto_53121 ?auto_53123 ) ) ( not ( = ?auto_53122 ?auto_53123 ) ) ( not ( = ?auto_53126 ?auto_53123 ) ) ( ON ?auto_53123 ?auto_53125 ) ( CLEAR ?auto_53123 ) ( not ( = ?auto_53120 ?auto_53125 ) ) ( not ( = ?auto_53121 ?auto_53125 ) ) ( not ( = ?auto_53122 ?auto_53125 ) ) ( not ( = ?auto_53126 ?auto_53125 ) ) ( not ( = ?auto_53124 ?auto_53125 ) ) ( not ( = ?auto_53123 ?auto_53125 ) ) ( HOLDING ?auto_53124 ) ( CLEAR ?auto_53126 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53120 ?auto_53121 ?auto_53122 ?auto_53126 ?auto_53124 )
      ( MAKE-2PILE ?auto_53120 ?auto_53121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53166 - BLOCK
      ?auto_53167 - BLOCK
      ?auto_53168 - BLOCK
      ?auto_53169 - BLOCK
    )
    :vars
    (
      ?auto_53170 - BLOCK
      ?auto_53171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53166 ) ( ON ?auto_53167 ?auto_53166 ) ( not ( = ?auto_53166 ?auto_53167 ) ) ( not ( = ?auto_53166 ?auto_53168 ) ) ( not ( = ?auto_53166 ?auto_53169 ) ) ( not ( = ?auto_53167 ?auto_53168 ) ) ( not ( = ?auto_53167 ?auto_53169 ) ) ( not ( = ?auto_53168 ?auto_53169 ) ) ( ON ?auto_53169 ?auto_53170 ) ( not ( = ?auto_53166 ?auto_53170 ) ) ( not ( = ?auto_53167 ?auto_53170 ) ) ( not ( = ?auto_53168 ?auto_53170 ) ) ( not ( = ?auto_53169 ?auto_53170 ) ) ( CLEAR ?auto_53167 ) ( ON ?auto_53168 ?auto_53169 ) ( CLEAR ?auto_53168 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53171 ) ( ON ?auto_53170 ?auto_53171 ) ( not ( = ?auto_53171 ?auto_53170 ) ) ( not ( = ?auto_53171 ?auto_53169 ) ) ( not ( = ?auto_53171 ?auto_53168 ) ) ( not ( = ?auto_53166 ?auto_53171 ) ) ( not ( = ?auto_53167 ?auto_53171 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53171 ?auto_53170 ?auto_53169 )
      ( MAKE-4PILE ?auto_53166 ?auto_53167 ?auto_53168 ?auto_53169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53172 - BLOCK
      ?auto_53173 - BLOCK
      ?auto_53174 - BLOCK
      ?auto_53175 - BLOCK
    )
    :vars
    (
      ?auto_53176 - BLOCK
      ?auto_53177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53172 ) ( not ( = ?auto_53172 ?auto_53173 ) ) ( not ( = ?auto_53172 ?auto_53174 ) ) ( not ( = ?auto_53172 ?auto_53175 ) ) ( not ( = ?auto_53173 ?auto_53174 ) ) ( not ( = ?auto_53173 ?auto_53175 ) ) ( not ( = ?auto_53174 ?auto_53175 ) ) ( ON ?auto_53175 ?auto_53176 ) ( not ( = ?auto_53172 ?auto_53176 ) ) ( not ( = ?auto_53173 ?auto_53176 ) ) ( not ( = ?auto_53174 ?auto_53176 ) ) ( not ( = ?auto_53175 ?auto_53176 ) ) ( ON ?auto_53174 ?auto_53175 ) ( CLEAR ?auto_53174 ) ( ON-TABLE ?auto_53177 ) ( ON ?auto_53176 ?auto_53177 ) ( not ( = ?auto_53177 ?auto_53176 ) ) ( not ( = ?auto_53177 ?auto_53175 ) ) ( not ( = ?auto_53177 ?auto_53174 ) ) ( not ( = ?auto_53172 ?auto_53177 ) ) ( not ( = ?auto_53173 ?auto_53177 ) ) ( HOLDING ?auto_53173 ) ( CLEAR ?auto_53172 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53172 ?auto_53173 )
      ( MAKE-4PILE ?auto_53172 ?auto_53173 ?auto_53174 ?auto_53175 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53178 - BLOCK
      ?auto_53179 - BLOCK
      ?auto_53180 - BLOCK
      ?auto_53181 - BLOCK
    )
    :vars
    (
      ?auto_53182 - BLOCK
      ?auto_53183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53178 ) ( not ( = ?auto_53178 ?auto_53179 ) ) ( not ( = ?auto_53178 ?auto_53180 ) ) ( not ( = ?auto_53178 ?auto_53181 ) ) ( not ( = ?auto_53179 ?auto_53180 ) ) ( not ( = ?auto_53179 ?auto_53181 ) ) ( not ( = ?auto_53180 ?auto_53181 ) ) ( ON ?auto_53181 ?auto_53182 ) ( not ( = ?auto_53178 ?auto_53182 ) ) ( not ( = ?auto_53179 ?auto_53182 ) ) ( not ( = ?auto_53180 ?auto_53182 ) ) ( not ( = ?auto_53181 ?auto_53182 ) ) ( ON ?auto_53180 ?auto_53181 ) ( ON-TABLE ?auto_53183 ) ( ON ?auto_53182 ?auto_53183 ) ( not ( = ?auto_53183 ?auto_53182 ) ) ( not ( = ?auto_53183 ?auto_53181 ) ) ( not ( = ?auto_53183 ?auto_53180 ) ) ( not ( = ?auto_53178 ?auto_53183 ) ) ( not ( = ?auto_53179 ?auto_53183 ) ) ( CLEAR ?auto_53178 ) ( ON ?auto_53179 ?auto_53180 ) ( CLEAR ?auto_53179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53183 ?auto_53182 ?auto_53181 ?auto_53180 )
      ( MAKE-4PILE ?auto_53178 ?auto_53179 ?auto_53180 ?auto_53181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53184 - BLOCK
      ?auto_53185 - BLOCK
      ?auto_53186 - BLOCK
      ?auto_53187 - BLOCK
    )
    :vars
    (
      ?auto_53189 - BLOCK
      ?auto_53188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53184 ?auto_53185 ) ) ( not ( = ?auto_53184 ?auto_53186 ) ) ( not ( = ?auto_53184 ?auto_53187 ) ) ( not ( = ?auto_53185 ?auto_53186 ) ) ( not ( = ?auto_53185 ?auto_53187 ) ) ( not ( = ?auto_53186 ?auto_53187 ) ) ( ON ?auto_53187 ?auto_53189 ) ( not ( = ?auto_53184 ?auto_53189 ) ) ( not ( = ?auto_53185 ?auto_53189 ) ) ( not ( = ?auto_53186 ?auto_53189 ) ) ( not ( = ?auto_53187 ?auto_53189 ) ) ( ON ?auto_53186 ?auto_53187 ) ( ON-TABLE ?auto_53188 ) ( ON ?auto_53189 ?auto_53188 ) ( not ( = ?auto_53188 ?auto_53189 ) ) ( not ( = ?auto_53188 ?auto_53187 ) ) ( not ( = ?auto_53188 ?auto_53186 ) ) ( not ( = ?auto_53184 ?auto_53188 ) ) ( not ( = ?auto_53185 ?auto_53188 ) ) ( ON ?auto_53185 ?auto_53186 ) ( CLEAR ?auto_53185 ) ( HOLDING ?auto_53184 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53184 )
      ( MAKE-4PILE ?auto_53184 ?auto_53185 ?auto_53186 ?auto_53187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53190 - BLOCK
      ?auto_53191 - BLOCK
      ?auto_53192 - BLOCK
      ?auto_53193 - BLOCK
    )
    :vars
    (
      ?auto_53194 - BLOCK
      ?auto_53195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53190 ?auto_53191 ) ) ( not ( = ?auto_53190 ?auto_53192 ) ) ( not ( = ?auto_53190 ?auto_53193 ) ) ( not ( = ?auto_53191 ?auto_53192 ) ) ( not ( = ?auto_53191 ?auto_53193 ) ) ( not ( = ?auto_53192 ?auto_53193 ) ) ( ON ?auto_53193 ?auto_53194 ) ( not ( = ?auto_53190 ?auto_53194 ) ) ( not ( = ?auto_53191 ?auto_53194 ) ) ( not ( = ?auto_53192 ?auto_53194 ) ) ( not ( = ?auto_53193 ?auto_53194 ) ) ( ON ?auto_53192 ?auto_53193 ) ( ON-TABLE ?auto_53195 ) ( ON ?auto_53194 ?auto_53195 ) ( not ( = ?auto_53195 ?auto_53194 ) ) ( not ( = ?auto_53195 ?auto_53193 ) ) ( not ( = ?auto_53195 ?auto_53192 ) ) ( not ( = ?auto_53190 ?auto_53195 ) ) ( not ( = ?auto_53191 ?auto_53195 ) ) ( ON ?auto_53191 ?auto_53192 ) ( ON ?auto_53190 ?auto_53191 ) ( CLEAR ?auto_53190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53195 ?auto_53194 ?auto_53193 ?auto_53192 ?auto_53191 )
      ( MAKE-4PILE ?auto_53190 ?auto_53191 ?auto_53192 ?auto_53193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53200 - BLOCK
      ?auto_53201 - BLOCK
      ?auto_53202 - BLOCK
      ?auto_53203 - BLOCK
    )
    :vars
    (
      ?auto_53204 - BLOCK
      ?auto_53205 - BLOCK
      ?auto_53206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53200 ?auto_53201 ) ) ( not ( = ?auto_53200 ?auto_53202 ) ) ( not ( = ?auto_53200 ?auto_53203 ) ) ( not ( = ?auto_53201 ?auto_53202 ) ) ( not ( = ?auto_53201 ?auto_53203 ) ) ( not ( = ?auto_53202 ?auto_53203 ) ) ( ON ?auto_53203 ?auto_53204 ) ( not ( = ?auto_53200 ?auto_53204 ) ) ( not ( = ?auto_53201 ?auto_53204 ) ) ( not ( = ?auto_53202 ?auto_53204 ) ) ( not ( = ?auto_53203 ?auto_53204 ) ) ( ON ?auto_53202 ?auto_53203 ) ( ON-TABLE ?auto_53205 ) ( ON ?auto_53204 ?auto_53205 ) ( not ( = ?auto_53205 ?auto_53204 ) ) ( not ( = ?auto_53205 ?auto_53203 ) ) ( not ( = ?auto_53205 ?auto_53202 ) ) ( not ( = ?auto_53200 ?auto_53205 ) ) ( not ( = ?auto_53201 ?auto_53205 ) ) ( ON ?auto_53201 ?auto_53202 ) ( CLEAR ?auto_53201 ) ( ON ?auto_53200 ?auto_53206 ) ( CLEAR ?auto_53200 ) ( HAND-EMPTY ) ( not ( = ?auto_53200 ?auto_53206 ) ) ( not ( = ?auto_53201 ?auto_53206 ) ) ( not ( = ?auto_53202 ?auto_53206 ) ) ( not ( = ?auto_53203 ?auto_53206 ) ) ( not ( = ?auto_53204 ?auto_53206 ) ) ( not ( = ?auto_53205 ?auto_53206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53200 ?auto_53206 )
      ( MAKE-4PILE ?auto_53200 ?auto_53201 ?auto_53202 ?auto_53203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53207 - BLOCK
      ?auto_53208 - BLOCK
      ?auto_53209 - BLOCK
      ?auto_53210 - BLOCK
    )
    :vars
    (
      ?auto_53213 - BLOCK
      ?auto_53211 - BLOCK
      ?auto_53212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53207 ?auto_53208 ) ) ( not ( = ?auto_53207 ?auto_53209 ) ) ( not ( = ?auto_53207 ?auto_53210 ) ) ( not ( = ?auto_53208 ?auto_53209 ) ) ( not ( = ?auto_53208 ?auto_53210 ) ) ( not ( = ?auto_53209 ?auto_53210 ) ) ( ON ?auto_53210 ?auto_53213 ) ( not ( = ?auto_53207 ?auto_53213 ) ) ( not ( = ?auto_53208 ?auto_53213 ) ) ( not ( = ?auto_53209 ?auto_53213 ) ) ( not ( = ?auto_53210 ?auto_53213 ) ) ( ON ?auto_53209 ?auto_53210 ) ( ON-TABLE ?auto_53211 ) ( ON ?auto_53213 ?auto_53211 ) ( not ( = ?auto_53211 ?auto_53213 ) ) ( not ( = ?auto_53211 ?auto_53210 ) ) ( not ( = ?auto_53211 ?auto_53209 ) ) ( not ( = ?auto_53207 ?auto_53211 ) ) ( not ( = ?auto_53208 ?auto_53211 ) ) ( ON ?auto_53207 ?auto_53212 ) ( CLEAR ?auto_53207 ) ( not ( = ?auto_53207 ?auto_53212 ) ) ( not ( = ?auto_53208 ?auto_53212 ) ) ( not ( = ?auto_53209 ?auto_53212 ) ) ( not ( = ?auto_53210 ?auto_53212 ) ) ( not ( = ?auto_53213 ?auto_53212 ) ) ( not ( = ?auto_53211 ?auto_53212 ) ) ( HOLDING ?auto_53208 ) ( CLEAR ?auto_53209 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53211 ?auto_53213 ?auto_53210 ?auto_53209 ?auto_53208 )
      ( MAKE-4PILE ?auto_53207 ?auto_53208 ?auto_53209 ?auto_53210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53214 - BLOCK
      ?auto_53215 - BLOCK
      ?auto_53216 - BLOCK
      ?auto_53217 - BLOCK
    )
    :vars
    (
      ?auto_53219 - BLOCK
      ?auto_53218 - BLOCK
      ?auto_53220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53214 ?auto_53215 ) ) ( not ( = ?auto_53214 ?auto_53216 ) ) ( not ( = ?auto_53214 ?auto_53217 ) ) ( not ( = ?auto_53215 ?auto_53216 ) ) ( not ( = ?auto_53215 ?auto_53217 ) ) ( not ( = ?auto_53216 ?auto_53217 ) ) ( ON ?auto_53217 ?auto_53219 ) ( not ( = ?auto_53214 ?auto_53219 ) ) ( not ( = ?auto_53215 ?auto_53219 ) ) ( not ( = ?auto_53216 ?auto_53219 ) ) ( not ( = ?auto_53217 ?auto_53219 ) ) ( ON ?auto_53216 ?auto_53217 ) ( ON-TABLE ?auto_53218 ) ( ON ?auto_53219 ?auto_53218 ) ( not ( = ?auto_53218 ?auto_53219 ) ) ( not ( = ?auto_53218 ?auto_53217 ) ) ( not ( = ?auto_53218 ?auto_53216 ) ) ( not ( = ?auto_53214 ?auto_53218 ) ) ( not ( = ?auto_53215 ?auto_53218 ) ) ( ON ?auto_53214 ?auto_53220 ) ( not ( = ?auto_53214 ?auto_53220 ) ) ( not ( = ?auto_53215 ?auto_53220 ) ) ( not ( = ?auto_53216 ?auto_53220 ) ) ( not ( = ?auto_53217 ?auto_53220 ) ) ( not ( = ?auto_53219 ?auto_53220 ) ) ( not ( = ?auto_53218 ?auto_53220 ) ) ( CLEAR ?auto_53216 ) ( ON ?auto_53215 ?auto_53214 ) ( CLEAR ?auto_53215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53220 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53220 ?auto_53214 )
      ( MAKE-4PILE ?auto_53214 ?auto_53215 ?auto_53216 ?auto_53217 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53221 - BLOCK
      ?auto_53222 - BLOCK
      ?auto_53223 - BLOCK
      ?auto_53224 - BLOCK
    )
    :vars
    (
      ?auto_53227 - BLOCK
      ?auto_53226 - BLOCK
      ?auto_53225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53221 ?auto_53222 ) ) ( not ( = ?auto_53221 ?auto_53223 ) ) ( not ( = ?auto_53221 ?auto_53224 ) ) ( not ( = ?auto_53222 ?auto_53223 ) ) ( not ( = ?auto_53222 ?auto_53224 ) ) ( not ( = ?auto_53223 ?auto_53224 ) ) ( ON ?auto_53224 ?auto_53227 ) ( not ( = ?auto_53221 ?auto_53227 ) ) ( not ( = ?auto_53222 ?auto_53227 ) ) ( not ( = ?auto_53223 ?auto_53227 ) ) ( not ( = ?auto_53224 ?auto_53227 ) ) ( ON-TABLE ?auto_53226 ) ( ON ?auto_53227 ?auto_53226 ) ( not ( = ?auto_53226 ?auto_53227 ) ) ( not ( = ?auto_53226 ?auto_53224 ) ) ( not ( = ?auto_53226 ?auto_53223 ) ) ( not ( = ?auto_53221 ?auto_53226 ) ) ( not ( = ?auto_53222 ?auto_53226 ) ) ( ON ?auto_53221 ?auto_53225 ) ( not ( = ?auto_53221 ?auto_53225 ) ) ( not ( = ?auto_53222 ?auto_53225 ) ) ( not ( = ?auto_53223 ?auto_53225 ) ) ( not ( = ?auto_53224 ?auto_53225 ) ) ( not ( = ?auto_53227 ?auto_53225 ) ) ( not ( = ?auto_53226 ?auto_53225 ) ) ( ON ?auto_53222 ?auto_53221 ) ( CLEAR ?auto_53222 ) ( ON-TABLE ?auto_53225 ) ( HOLDING ?auto_53223 ) ( CLEAR ?auto_53224 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53226 ?auto_53227 ?auto_53224 ?auto_53223 )
      ( MAKE-4PILE ?auto_53221 ?auto_53222 ?auto_53223 ?auto_53224 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53228 - BLOCK
      ?auto_53229 - BLOCK
      ?auto_53230 - BLOCK
      ?auto_53231 - BLOCK
    )
    :vars
    (
      ?auto_53234 - BLOCK
      ?auto_53232 - BLOCK
      ?auto_53233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53228 ?auto_53229 ) ) ( not ( = ?auto_53228 ?auto_53230 ) ) ( not ( = ?auto_53228 ?auto_53231 ) ) ( not ( = ?auto_53229 ?auto_53230 ) ) ( not ( = ?auto_53229 ?auto_53231 ) ) ( not ( = ?auto_53230 ?auto_53231 ) ) ( ON ?auto_53231 ?auto_53234 ) ( not ( = ?auto_53228 ?auto_53234 ) ) ( not ( = ?auto_53229 ?auto_53234 ) ) ( not ( = ?auto_53230 ?auto_53234 ) ) ( not ( = ?auto_53231 ?auto_53234 ) ) ( ON-TABLE ?auto_53232 ) ( ON ?auto_53234 ?auto_53232 ) ( not ( = ?auto_53232 ?auto_53234 ) ) ( not ( = ?auto_53232 ?auto_53231 ) ) ( not ( = ?auto_53232 ?auto_53230 ) ) ( not ( = ?auto_53228 ?auto_53232 ) ) ( not ( = ?auto_53229 ?auto_53232 ) ) ( ON ?auto_53228 ?auto_53233 ) ( not ( = ?auto_53228 ?auto_53233 ) ) ( not ( = ?auto_53229 ?auto_53233 ) ) ( not ( = ?auto_53230 ?auto_53233 ) ) ( not ( = ?auto_53231 ?auto_53233 ) ) ( not ( = ?auto_53234 ?auto_53233 ) ) ( not ( = ?auto_53232 ?auto_53233 ) ) ( ON ?auto_53229 ?auto_53228 ) ( ON-TABLE ?auto_53233 ) ( CLEAR ?auto_53231 ) ( ON ?auto_53230 ?auto_53229 ) ( CLEAR ?auto_53230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53233 ?auto_53228 ?auto_53229 )
      ( MAKE-4PILE ?auto_53228 ?auto_53229 ?auto_53230 ?auto_53231 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53235 - BLOCK
      ?auto_53236 - BLOCK
      ?auto_53237 - BLOCK
      ?auto_53238 - BLOCK
    )
    :vars
    (
      ?auto_53241 - BLOCK
      ?auto_53239 - BLOCK
      ?auto_53240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53235 ?auto_53236 ) ) ( not ( = ?auto_53235 ?auto_53237 ) ) ( not ( = ?auto_53235 ?auto_53238 ) ) ( not ( = ?auto_53236 ?auto_53237 ) ) ( not ( = ?auto_53236 ?auto_53238 ) ) ( not ( = ?auto_53237 ?auto_53238 ) ) ( not ( = ?auto_53235 ?auto_53241 ) ) ( not ( = ?auto_53236 ?auto_53241 ) ) ( not ( = ?auto_53237 ?auto_53241 ) ) ( not ( = ?auto_53238 ?auto_53241 ) ) ( ON-TABLE ?auto_53239 ) ( ON ?auto_53241 ?auto_53239 ) ( not ( = ?auto_53239 ?auto_53241 ) ) ( not ( = ?auto_53239 ?auto_53238 ) ) ( not ( = ?auto_53239 ?auto_53237 ) ) ( not ( = ?auto_53235 ?auto_53239 ) ) ( not ( = ?auto_53236 ?auto_53239 ) ) ( ON ?auto_53235 ?auto_53240 ) ( not ( = ?auto_53235 ?auto_53240 ) ) ( not ( = ?auto_53236 ?auto_53240 ) ) ( not ( = ?auto_53237 ?auto_53240 ) ) ( not ( = ?auto_53238 ?auto_53240 ) ) ( not ( = ?auto_53241 ?auto_53240 ) ) ( not ( = ?auto_53239 ?auto_53240 ) ) ( ON ?auto_53236 ?auto_53235 ) ( ON-TABLE ?auto_53240 ) ( ON ?auto_53237 ?auto_53236 ) ( CLEAR ?auto_53237 ) ( HOLDING ?auto_53238 ) ( CLEAR ?auto_53241 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53239 ?auto_53241 ?auto_53238 )
      ( MAKE-4PILE ?auto_53235 ?auto_53236 ?auto_53237 ?auto_53238 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53242 - BLOCK
      ?auto_53243 - BLOCK
      ?auto_53244 - BLOCK
      ?auto_53245 - BLOCK
    )
    :vars
    (
      ?auto_53247 - BLOCK
      ?auto_53246 - BLOCK
      ?auto_53248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53242 ?auto_53243 ) ) ( not ( = ?auto_53242 ?auto_53244 ) ) ( not ( = ?auto_53242 ?auto_53245 ) ) ( not ( = ?auto_53243 ?auto_53244 ) ) ( not ( = ?auto_53243 ?auto_53245 ) ) ( not ( = ?auto_53244 ?auto_53245 ) ) ( not ( = ?auto_53242 ?auto_53247 ) ) ( not ( = ?auto_53243 ?auto_53247 ) ) ( not ( = ?auto_53244 ?auto_53247 ) ) ( not ( = ?auto_53245 ?auto_53247 ) ) ( ON-TABLE ?auto_53246 ) ( ON ?auto_53247 ?auto_53246 ) ( not ( = ?auto_53246 ?auto_53247 ) ) ( not ( = ?auto_53246 ?auto_53245 ) ) ( not ( = ?auto_53246 ?auto_53244 ) ) ( not ( = ?auto_53242 ?auto_53246 ) ) ( not ( = ?auto_53243 ?auto_53246 ) ) ( ON ?auto_53242 ?auto_53248 ) ( not ( = ?auto_53242 ?auto_53248 ) ) ( not ( = ?auto_53243 ?auto_53248 ) ) ( not ( = ?auto_53244 ?auto_53248 ) ) ( not ( = ?auto_53245 ?auto_53248 ) ) ( not ( = ?auto_53247 ?auto_53248 ) ) ( not ( = ?auto_53246 ?auto_53248 ) ) ( ON ?auto_53243 ?auto_53242 ) ( ON-TABLE ?auto_53248 ) ( ON ?auto_53244 ?auto_53243 ) ( CLEAR ?auto_53247 ) ( ON ?auto_53245 ?auto_53244 ) ( CLEAR ?auto_53245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53248 ?auto_53242 ?auto_53243 ?auto_53244 )
      ( MAKE-4PILE ?auto_53242 ?auto_53243 ?auto_53244 ?auto_53245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53249 - BLOCK
      ?auto_53250 - BLOCK
      ?auto_53251 - BLOCK
      ?auto_53252 - BLOCK
    )
    :vars
    (
      ?auto_53254 - BLOCK
      ?auto_53255 - BLOCK
      ?auto_53253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53249 ?auto_53250 ) ) ( not ( = ?auto_53249 ?auto_53251 ) ) ( not ( = ?auto_53249 ?auto_53252 ) ) ( not ( = ?auto_53250 ?auto_53251 ) ) ( not ( = ?auto_53250 ?auto_53252 ) ) ( not ( = ?auto_53251 ?auto_53252 ) ) ( not ( = ?auto_53249 ?auto_53254 ) ) ( not ( = ?auto_53250 ?auto_53254 ) ) ( not ( = ?auto_53251 ?auto_53254 ) ) ( not ( = ?auto_53252 ?auto_53254 ) ) ( ON-TABLE ?auto_53255 ) ( not ( = ?auto_53255 ?auto_53254 ) ) ( not ( = ?auto_53255 ?auto_53252 ) ) ( not ( = ?auto_53255 ?auto_53251 ) ) ( not ( = ?auto_53249 ?auto_53255 ) ) ( not ( = ?auto_53250 ?auto_53255 ) ) ( ON ?auto_53249 ?auto_53253 ) ( not ( = ?auto_53249 ?auto_53253 ) ) ( not ( = ?auto_53250 ?auto_53253 ) ) ( not ( = ?auto_53251 ?auto_53253 ) ) ( not ( = ?auto_53252 ?auto_53253 ) ) ( not ( = ?auto_53254 ?auto_53253 ) ) ( not ( = ?auto_53255 ?auto_53253 ) ) ( ON ?auto_53250 ?auto_53249 ) ( ON-TABLE ?auto_53253 ) ( ON ?auto_53251 ?auto_53250 ) ( ON ?auto_53252 ?auto_53251 ) ( CLEAR ?auto_53252 ) ( HOLDING ?auto_53254 ) ( CLEAR ?auto_53255 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53255 ?auto_53254 )
      ( MAKE-4PILE ?auto_53249 ?auto_53250 ?auto_53251 ?auto_53252 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53256 - BLOCK
      ?auto_53257 - BLOCK
      ?auto_53258 - BLOCK
      ?auto_53259 - BLOCK
    )
    :vars
    (
      ?auto_53262 - BLOCK
      ?auto_53261 - BLOCK
      ?auto_53260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53256 ?auto_53257 ) ) ( not ( = ?auto_53256 ?auto_53258 ) ) ( not ( = ?auto_53256 ?auto_53259 ) ) ( not ( = ?auto_53257 ?auto_53258 ) ) ( not ( = ?auto_53257 ?auto_53259 ) ) ( not ( = ?auto_53258 ?auto_53259 ) ) ( not ( = ?auto_53256 ?auto_53262 ) ) ( not ( = ?auto_53257 ?auto_53262 ) ) ( not ( = ?auto_53258 ?auto_53262 ) ) ( not ( = ?auto_53259 ?auto_53262 ) ) ( ON-TABLE ?auto_53261 ) ( not ( = ?auto_53261 ?auto_53262 ) ) ( not ( = ?auto_53261 ?auto_53259 ) ) ( not ( = ?auto_53261 ?auto_53258 ) ) ( not ( = ?auto_53256 ?auto_53261 ) ) ( not ( = ?auto_53257 ?auto_53261 ) ) ( ON ?auto_53256 ?auto_53260 ) ( not ( = ?auto_53256 ?auto_53260 ) ) ( not ( = ?auto_53257 ?auto_53260 ) ) ( not ( = ?auto_53258 ?auto_53260 ) ) ( not ( = ?auto_53259 ?auto_53260 ) ) ( not ( = ?auto_53262 ?auto_53260 ) ) ( not ( = ?auto_53261 ?auto_53260 ) ) ( ON ?auto_53257 ?auto_53256 ) ( ON-TABLE ?auto_53260 ) ( ON ?auto_53258 ?auto_53257 ) ( ON ?auto_53259 ?auto_53258 ) ( CLEAR ?auto_53261 ) ( ON ?auto_53262 ?auto_53259 ) ( CLEAR ?auto_53262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53260 ?auto_53256 ?auto_53257 ?auto_53258 ?auto_53259 )
      ( MAKE-4PILE ?auto_53256 ?auto_53257 ?auto_53258 ?auto_53259 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53263 - BLOCK
      ?auto_53264 - BLOCK
      ?auto_53265 - BLOCK
      ?auto_53266 - BLOCK
    )
    :vars
    (
      ?auto_53269 - BLOCK
      ?auto_53267 - BLOCK
      ?auto_53268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53263 ?auto_53264 ) ) ( not ( = ?auto_53263 ?auto_53265 ) ) ( not ( = ?auto_53263 ?auto_53266 ) ) ( not ( = ?auto_53264 ?auto_53265 ) ) ( not ( = ?auto_53264 ?auto_53266 ) ) ( not ( = ?auto_53265 ?auto_53266 ) ) ( not ( = ?auto_53263 ?auto_53269 ) ) ( not ( = ?auto_53264 ?auto_53269 ) ) ( not ( = ?auto_53265 ?auto_53269 ) ) ( not ( = ?auto_53266 ?auto_53269 ) ) ( not ( = ?auto_53267 ?auto_53269 ) ) ( not ( = ?auto_53267 ?auto_53266 ) ) ( not ( = ?auto_53267 ?auto_53265 ) ) ( not ( = ?auto_53263 ?auto_53267 ) ) ( not ( = ?auto_53264 ?auto_53267 ) ) ( ON ?auto_53263 ?auto_53268 ) ( not ( = ?auto_53263 ?auto_53268 ) ) ( not ( = ?auto_53264 ?auto_53268 ) ) ( not ( = ?auto_53265 ?auto_53268 ) ) ( not ( = ?auto_53266 ?auto_53268 ) ) ( not ( = ?auto_53269 ?auto_53268 ) ) ( not ( = ?auto_53267 ?auto_53268 ) ) ( ON ?auto_53264 ?auto_53263 ) ( ON-TABLE ?auto_53268 ) ( ON ?auto_53265 ?auto_53264 ) ( ON ?auto_53266 ?auto_53265 ) ( ON ?auto_53269 ?auto_53266 ) ( CLEAR ?auto_53269 ) ( HOLDING ?auto_53267 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53267 )
      ( MAKE-4PILE ?auto_53263 ?auto_53264 ?auto_53265 ?auto_53266 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53270 - BLOCK
      ?auto_53271 - BLOCK
      ?auto_53272 - BLOCK
      ?auto_53273 - BLOCK
    )
    :vars
    (
      ?auto_53276 - BLOCK
      ?auto_53275 - BLOCK
      ?auto_53274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53270 ?auto_53271 ) ) ( not ( = ?auto_53270 ?auto_53272 ) ) ( not ( = ?auto_53270 ?auto_53273 ) ) ( not ( = ?auto_53271 ?auto_53272 ) ) ( not ( = ?auto_53271 ?auto_53273 ) ) ( not ( = ?auto_53272 ?auto_53273 ) ) ( not ( = ?auto_53270 ?auto_53276 ) ) ( not ( = ?auto_53271 ?auto_53276 ) ) ( not ( = ?auto_53272 ?auto_53276 ) ) ( not ( = ?auto_53273 ?auto_53276 ) ) ( not ( = ?auto_53275 ?auto_53276 ) ) ( not ( = ?auto_53275 ?auto_53273 ) ) ( not ( = ?auto_53275 ?auto_53272 ) ) ( not ( = ?auto_53270 ?auto_53275 ) ) ( not ( = ?auto_53271 ?auto_53275 ) ) ( ON ?auto_53270 ?auto_53274 ) ( not ( = ?auto_53270 ?auto_53274 ) ) ( not ( = ?auto_53271 ?auto_53274 ) ) ( not ( = ?auto_53272 ?auto_53274 ) ) ( not ( = ?auto_53273 ?auto_53274 ) ) ( not ( = ?auto_53276 ?auto_53274 ) ) ( not ( = ?auto_53275 ?auto_53274 ) ) ( ON ?auto_53271 ?auto_53270 ) ( ON-TABLE ?auto_53274 ) ( ON ?auto_53272 ?auto_53271 ) ( ON ?auto_53273 ?auto_53272 ) ( ON ?auto_53276 ?auto_53273 ) ( ON ?auto_53275 ?auto_53276 ) ( CLEAR ?auto_53275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53274 ?auto_53270 ?auto_53271 ?auto_53272 ?auto_53273 ?auto_53276 )
      ( MAKE-4PILE ?auto_53270 ?auto_53271 ?auto_53272 ?auto_53273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53288 - BLOCK
    )
    :vars
    (
      ?auto_53291 - BLOCK
      ?auto_53289 - BLOCK
      ?auto_53290 - BLOCK
      ?auto_53293 - BLOCK
      ?auto_53292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53291 ?auto_53288 ) ( ON-TABLE ?auto_53288 ) ( not ( = ?auto_53288 ?auto_53291 ) ) ( not ( = ?auto_53288 ?auto_53289 ) ) ( not ( = ?auto_53288 ?auto_53290 ) ) ( not ( = ?auto_53291 ?auto_53289 ) ) ( not ( = ?auto_53291 ?auto_53290 ) ) ( not ( = ?auto_53289 ?auto_53290 ) ) ( ON ?auto_53289 ?auto_53291 ) ( CLEAR ?auto_53289 ) ( HOLDING ?auto_53290 ) ( CLEAR ?auto_53293 ) ( ON-TABLE ?auto_53292 ) ( ON ?auto_53293 ?auto_53292 ) ( not ( = ?auto_53292 ?auto_53293 ) ) ( not ( = ?auto_53292 ?auto_53290 ) ) ( not ( = ?auto_53293 ?auto_53290 ) ) ( not ( = ?auto_53288 ?auto_53293 ) ) ( not ( = ?auto_53288 ?auto_53292 ) ) ( not ( = ?auto_53291 ?auto_53293 ) ) ( not ( = ?auto_53291 ?auto_53292 ) ) ( not ( = ?auto_53289 ?auto_53293 ) ) ( not ( = ?auto_53289 ?auto_53292 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53292 ?auto_53293 ?auto_53290 )
      ( MAKE-1PILE ?auto_53288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53294 - BLOCK
    )
    :vars
    (
      ?auto_53297 - BLOCK
      ?auto_53295 - BLOCK
      ?auto_53296 - BLOCK
      ?auto_53299 - BLOCK
      ?auto_53298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53297 ?auto_53294 ) ( ON-TABLE ?auto_53294 ) ( not ( = ?auto_53294 ?auto_53297 ) ) ( not ( = ?auto_53294 ?auto_53295 ) ) ( not ( = ?auto_53294 ?auto_53296 ) ) ( not ( = ?auto_53297 ?auto_53295 ) ) ( not ( = ?auto_53297 ?auto_53296 ) ) ( not ( = ?auto_53295 ?auto_53296 ) ) ( ON ?auto_53295 ?auto_53297 ) ( CLEAR ?auto_53299 ) ( ON-TABLE ?auto_53298 ) ( ON ?auto_53299 ?auto_53298 ) ( not ( = ?auto_53298 ?auto_53299 ) ) ( not ( = ?auto_53298 ?auto_53296 ) ) ( not ( = ?auto_53299 ?auto_53296 ) ) ( not ( = ?auto_53294 ?auto_53299 ) ) ( not ( = ?auto_53294 ?auto_53298 ) ) ( not ( = ?auto_53297 ?auto_53299 ) ) ( not ( = ?auto_53297 ?auto_53298 ) ) ( not ( = ?auto_53295 ?auto_53299 ) ) ( not ( = ?auto_53295 ?auto_53298 ) ) ( ON ?auto_53296 ?auto_53295 ) ( CLEAR ?auto_53296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53294 ?auto_53297 ?auto_53295 )
      ( MAKE-1PILE ?auto_53294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53300 - BLOCK
    )
    :vars
    (
      ?auto_53304 - BLOCK
      ?auto_53302 - BLOCK
      ?auto_53305 - BLOCK
      ?auto_53303 - BLOCK
      ?auto_53301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53304 ?auto_53300 ) ( ON-TABLE ?auto_53300 ) ( not ( = ?auto_53300 ?auto_53304 ) ) ( not ( = ?auto_53300 ?auto_53302 ) ) ( not ( = ?auto_53300 ?auto_53305 ) ) ( not ( = ?auto_53304 ?auto_53302 ) ) ( not ( = ?auto_53304 ?auto_53305 ) ) ( not ( = ?auto_53302 ?auto_53305 ) ) ( ON ?auto_53302 ?auto_53304 ) ( ON-TABLE ?auto_53303 ) ( not ( = ?auto_53303 ?auto_53301 ) ) ( not ( = ?auto_53303 ?auto_53305 ) ) ( not ( = ?auto_53301 ?auto_53305 ) ) ( not ( = ?auto_53300 ?auto_53301 ) ) ( not ( = ?auto_53300 ?auto_53303 ) ) ( not ( = ?auto_53304 ?auto_53301 ) ) ( not ( = ?auto_53304 ?auto_53303 ) ) ( not ( = ?auto_53302 ?auto_53301 ) ) ( not ( = ?auto_53302 ?auto_53303 ) ) ( ON ?auto_53305 ?auto_53302 ) ( CLEAR ?auto_53305 ) ( HOLDING ?auto_53301 ) ( CLEAR ?auto_53303 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53303 ?auto_53301 )
      ( MAKE-1PILE ?auto_53300 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53306 - BLOCK
    )
    :vars
    (
      ?auto_53307 - BLOCK
      ?auto_53309 - BLOCK
      ?auto_53311 - BLOCK
      ?auto_53308 - BLOCK
      ?auto_53310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53307 ?auto_53306 ) ( ON-TABLE ?auto_53306 ) ( not ( = ?auto_53306 ?auto_53307 ) ) ( not ( = ?auto_53306 ?auto_53309 ) ) ( not ( = ?auto_53306 ?auto_53311 ) ) ( not ( = ?auto_53307 ?auto_53309 ) ) ( not ( = ?auto_53307 ?auto_53311 ) ) ( not ( = ?auto_53309 ?auto_53311 ) ) ( ON ?auto_53309 ?auto_53307 ) ( ON-TABLE ?auto_53308 ) ( not ( = ?auto_53308 ?auto_53310 ) ) ( not ( = ?auto_53308 ?auto_53311 ) ) ( not ( = ?auto_53310 ?auto_53311 ) ) ( not ( = ?auto_53306 ?auto_53310 ) ) ( not ( = ?auto_53306 ?auto_53308 ) ) ( not ( = ?auto_53307 ?auto_53310 ) ) ( not ( = ?auto_53307 ?auto_53308 ) ) ( not ( = ?auto_53309 ?auto_53310 ) ) ( not ( = ?auto_53309 ?auto_53308 ) ) ( ON ?auto_53311 ?auto_53309 ) ( CLEAR ?auto_53308 ) ( ON ?auto_53310 ?auto_53311 ) ( CLEAR ?auto_53310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53306 ?auto_53307 ?auto_53309 ?auto_53311 )
      ( MAKE-1PILE ?auto_53306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53312 - BLOCK
    )
    :vars
    (
      ?auto_53313 - BLOCK
      ?auto_53315 - BLOCK
      ?auto_53317 - BLOCK
      ?auto_53316 - BLOCK
      ?auto_53314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53313 ?auto_53312 ) ( ON-TABLE ?auto_53312 ) ( not ( = ?auto_53312 ?auto_53313 ) ) ( not ( = ?auto_53312 ?auto_53315 ) ) ( not ( = ?auto_53312 ?auto_53317 ) ) ( not ( = ?auto_53313 ?auto_53315 ) ) ( not ( = ?auto_53313 ?auto_53317 ) ) ( not ( = ?auto_53315 ?auto_53317 ) ) ( ON ?auto_53315 ?auto_53313 ) ( not ( = ?auto_53316 ?auto_53314 ) ) ( not ( = ?auto_53316 ?auto_53317 ) ) ( not ( = ?auto_53314 ?auto_53317 ) ) ( not ( = ?auto_53312 ?auto_53314 ) ) ( not ( = ?auto_53312 ?auto_53316 ) ) ( not ( = ?auto_53313 ?auto_53314 ) ) ( not ( = ?auto_53313 ?auto_53316 ) ) ( not ( = ?auto_53315 ?auto_53314 ) ) ( not ( = ?auto_53315 ?auto_53316 ) ) ( ON ?auto_53317 ?auto_53315 ) ( ON ?auto_53314 ?auto_53317 ) ( CLEAR ?auto_53314 ) ( HOLDING ?auto_53316 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53316 )
      ( MAKE-1PILE ?auto_53312 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53325 - BLOCK
    )
    :vars
    (
      ?auto_53330 - BLOCK
      ?auto_53327 - BLOCK
      ?auto_53329 - BLOCK
      ?auto_53328 - BLOCK
      ?auto_53326 - BLOCK
      ?auto_53331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53330 ?auto_53325 ) ( ON-TABLE ?auto_53325 ) ( not ( = ?auto_53325 ?auto_53330 ) ) ( not ( = ?auto_53325 ?auto_53327 ) ) ( not ( = ?auto_53325 ?auto_53329 ) ) ( not ( = ?auto_53330 ?auto_53327 ) ) ( not ( = ?auto_53330 ?auto_53329 ) ) ( not ( = ?auto_53327 ?auto_53329 ) ) ( ON ?auto_53327 ?auto_53330 ) ( not ( = ?auto_53328 ?auto_53326 ) ) ( not ( = ?auto_53328 ?auto_53329 ) ) ( not ( = ?auto_53326 ?auto_53329 ) ) ( not ( = ?auto_53325 ?auto_53326 ) ) ( not ( = ?auto_53325 ?auto_53328 ) ) ( not ( = ?auto_53330 ?auto_53326 ) ) ( not ( = ?auto_53330 ?auto_53328 ) ) ( not ( = ?auto_53327 ?auto_53326 ) ) ( not ( = ?auto_53327 ?auto_53328 ) ) ( ON ?auto_53329 ?auto_53327 ) ( ON ?auto_53326 ?auto_53329 ) ( CLEAR ?auto_53326 ) ( ON ?auto_53328 ?auto_53331 ) ( CLEAR ?auto_53328 ) ( HAND-EMPTY ) ( not ( = ?auto_53325 ?auto_53331 ) ) ( not ( = ?auto_53330 ?auto_53331 ) ) ( not ( = ?auto_53327 ?auto_53331 ) ) ( not ( = ?auto_53329 ?auto_53331 ) ) ( not ( = ?auto_53328 ?auto_53331 ) ) ( not ( = ?auto_53326 ?auto_53331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53328 ?auto_53331 )
      ( MAKE-1PILE ?auto_53325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53332 - BLOCK
    )
    :vars
    (
      ?auto_53334 - BLOCK
      ?auto_53338 - BLOCK
      ?auto_53337 - BLOCK
      ?auto_53336 - BLOCK
      ?auto_53335 - BLOCK
      ?auto_53333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53334 ?auto_53332 ) ( ON-TABLE ?auto_53332 ) ( not ( = ?auto_53332 ?auto_53334 ) ) ( not ( = ?auto_53332 ?auto_53338 ) ) ( not ( = ?auto_53332 ?auto_53337 ) ) ( not ( = ?auto_53334 ?auto_53338 ) ) ( not ( = ?auto_53334 ?auto_53337 ) ) ( not ( = ?auto_53338 ?auto_53337 ) ) ( ON ?auto_53338 ?auto_53334 ) ( not ( = ?auto_53336 ?auto_53335 ) ) ( not ( = ?auto_53336 ?auto_53337 ) ) ( not ( = ?auto_53335 ?auto_53337 ) ) ( not ( = ?auto_53332 ?auto_53335 ) ) ( not ( = ?auto_53332 ?auto_53336 ) ) ( not ( = ?auto_53334 ?auto_53335 ) ) ( not ( = ?auto_53334 ?auto_53336 ) ) ( not ( = ?auto_53338 ?auto_53335 ) ) ( not ( = ?auto_53338 ?auto_53336 ) ) ( ON ?auto_53337 ?auto_53338 ) ( ON ?auto_53336 ?auto_53333 ) ( CLEAR ?auto_53336 ) ( not ( = ?auto_53332 ?auto_53333 ) ) ( not ( = ?auto_53334 ?auto_53333 ) ) ( not ( = ?auto_53338 ?auto_53333 ) ) ( not ( = ?auto_53337 ?auto_53333 ) ) ( not ( = ?auto_53336 ?auto_53333 ) ) ( not ( = ?auto_53335 ?auto_53333 ) ) ( HOLDING ?auto_53335 ) ( CLEAR ?auto_53337 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53332 ?auto_53334 ?auto_53338 ?auto_53337 ?auto_53335 )
      ( MAKE-1PILE ?auto_53332 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53339 - BLOCK
    )
    :vars
    (
      ?auto_53344 - BLOCK
      ?auto_53341 - BLOCK
      ?auto_53345 - BLOCK
      ?auto_53343 - BLOCK
      ?auto_53340 - BLOCK
      ?auto_53342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53344 ?auto_53339 ) ( ON-TABLE ?auto_53339 ) ( not ( = ?auto_53339 ?auto_53344 ) ) ( not ( = ?auto_53339 ?auto_53341 ) ) ( not ( = ?auto_53339 ?auto_53345 ) ) ( not ( = ?auto_53344 ?auto_53341 ) ) ( not ( = ?auto_53344 ?auto_53345 ) ) ( not ( = ?auto_53341 ?auto_53345 ) ) ( ON ?auto_53341 ?auto_53344 ) ( not ( = ?auto_53343 ?auto_53340 ) ) ( not ( = ?auto_53343 ?auto_53345 ) ) ( not ( = ?auto_53340 ?auto_53345 ) ) ( not ( = ?auto_53339 ?auto_53340 ) ) ( not ( = ?auto_53339 ?auto_53343 ) ) ( not ( = ?auto_53344 ?auto_53340 ) ) ( not ( = ?auto_53344 ?auto_53343 ) ) ( not ( = ?auto_53341 ?auto_53340 ) ) ( not ( = ?auto_53341 ?auto_53343 ) ) ( ON ?auto_53345 ?auto_53341 ) ( ON ?auto_53343 ?auto_53342 ) ( not ( = ?auto_53339 ?auto_53342 ) ) ( not ( = ?auto_53344 ?auto_53342 ) ) ( not ( = ?auto_53341 ?auto_53342 ) ) ( not ( = ?auto_53345 ?auto_53342 ) ) ( not ( = ?auto_53343 ?auto_53342 ) ) ( not ( = ?auto_53340 ?auto_53342 ) ) ( CLEAR ?auto_53345 ) ( ON ?auto_53340 ?auto_53343 ) ( CLEAR ?auto_53340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53342 ?auto_53343 )
      ( MAKE-1PILE ?auto_53339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53379 - BLOCK
      ?auto_53380 - BLOCK
      ?auto_53381 - BLOCK
      ?auto_53382 - BLOCK
      ?auto_53383 - BLOCK
    )
    :vars
    (
      ?auto_53384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53379 ) ( ON ?auto_53380 ?auto_53379 ) ( ON ?auto_53381 ?auto_53380 ) ( not ( = ?auto_53379 ?auto_53380 ) ) ( not ( = ?auto_53379 ?auto_53381 ) ) ( not ( = ?auto_53379 ?auto_53382 ) ) ( not ( = ?auto_53379 ?auto_53383 ) ) ( not ( = ?auto_53380 ?auto_53381 ) ) ( not ( = ?auto_53380 ?auto_53382 ) ) ( not ( = ?auto_53380 ?auto_53383 ) ) ( not ( = ?auto_53381 ?auto_53382 ) ) ( not ( = ?auto_53381 ?auto_53383 ) ) ( not ( = ?auto_53382 ?auto_53383 ) ) ( ON ?auto_53383 ?auto_53384 ) ( not ( = ?auto_53379 ?auto_53384 ) ) ( not ( = ?auto_53380 ?auto_53384 ) ) ( not ( = ?auto_53381 ?auto_53384 ) ) ( not ( = ?auto_53382 ?auto_53384 ) ) ( not ( = ?auto_53383 ?auto_53384 ) ) ( CLEAR ?auto_53381 ) ( ON ?auto_53382 ?auto_53383 ) ( CLEAR ?auto_53382 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53384 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53384 ?auto_53383 )
      ( MAKE-5PILE ?auto_53379 ?auto_53380 ?auto_53381 ?auto_53382 ?auto_53383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53385 - BLOCK
      ?auto_53386 - BLOCK
      ?auto_53387 - BLOCK
      ?auto_53388 - BLOCK
      ?auto_53389 - BLOCK
    )
    :vars
    (
      ?auto_53390 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53385 ) ( ON ?auto_53386 ?auto_53385 ) ( not ( = ?auto_53385 ?auto_53386 ) ) ( not ( = ?auto_53385 ?auto_53387 ) ) ( not ( = ?auto_53385 ?auto_53388 ) ) ( not ( = ?auto_53385 ?auto_53389 ) ) ( not ( = ?auto_53386 ?auto_53387 ) ) ( not ( = ?auto_53386 ?auto_53388 ) ) ( not ( = ?auto_53386 ?auto_53389 ) ) ( not ( = ?auto_53387 ?auto_53388 ) ) ( not ( = ?auto_53387 ?auto_53389 ) ) ( not ( = ?auto_53388 ?auto_53389 ) ) ( ON ?auto_53389 ?auto_53390 ) ( not ( = ?auto_53385 ?auto_53390 ) ) ( not ( = ?auto_53386 ?auto_53390 ) ) ( not ( = ?auto_53387 ?auto_53390 ) ) ( not ( = ?auto_53388 ?auto_53390 ) ) ( not ( = ?auto_53389 ?auto_53390 ) ) ( ON ?auto_53388 ?auto_53389 ) ( CLEAR ?auto_53388 ) ( ON-TABLE ?auto_53390 ) ( HOLDING ?auto_53387 ) ( CLEAR ?auto_53386 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53385 ?auto_53386 ?auto_53387 )
      ( MAKE-5PILE ?auto_53385 ?auto_53386 ?auto_53387 ?auto_53388 ?auto_53389 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53391 - BLOCK
      ?auto_53392 - BLOCK
      ?auto_53393 - BLOCK
      ?auto_53394 - BLOCK
      ?auto_53395 - BLOCK
    )
    :vars
    (
      ?auto_53396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53391 ) ( ON ?auto_53392 ?auto_53391 ) ( not ( = ?auto_53391 ?auto_53392 ) ) ( not ( = ?auto_53391 ?auto_53393 ) ) ( not ( = ?auto_53391 ?auto_53394 ) ) ( not ( = ?auto_53391 ?auto_53395 ) ) ( not ( = ?auto_53392 ?auto_53393 ) ) ( not ( = ?auto_53392 ?auto_53394 ) ) ( not ( = ?auto_53392 ?auto_53395 ) ) ( not ( = ?auto_53393 ?auto_53394 ) ) ( not ( = ?auto_53393 ?auto_53395 ) ) ( not ( = ?auto_53394 ?auto_53395 ) ) ( ON ?auto_53395 ?auto_53396 ) ( not ( = ?auto_53391 ?auto_53396 ) ) ( not ( = ?auto_53392 ?auto_53396 ) ) ( not ( = ?auto_53393 ?auto_53396 ) ) ( not ( = ?auto_53394 ?auto_53396 ) ) ( not ( = ?auto_53395 ?auto_53396 ) ) ( ON ?auto_53394 ?auto_53395 ) ( ON-TABLE ?auto_53396 ) ( CLEAR ?auto_53392 ) ( ON ?auto_53393 ?auto_53394 ) ( CLEAR ?auto_53393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53396 ?auto_53395 ?auto_53394 )
      ( MAKE-5PILE ?auto_53391 ?auto_53392 ?auto_53393 ?auto_53394 ?auto_53395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53397 - BLOCK
      ?auto_53398 - BLOCK
      ?auto_53399 - BLOCK
      ?auto_53400 - BLOCK
      ?auto_53401 - BLOCK
    )
    :vars
    (
      ?auto_53402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53397 ) ( not ( = ?auto_53397 ?auto_53398 ) ) ( not ( = ?auto_53397 ?auto_53399 ) ) ( not ( = ?auto_53397 ?auto_53400 ) ) ( not ( = ?auto_53397 ?auto_53401 ) ) ( not ( = ?auto_53398 ?auto_53399 ) ) ( not ( = ?auto_53398 ?auto_53400 ) ) ( not ( = ?auto_53398 ?auto_53401 ) ) ( not ( = ?auto_53399 ?auto_53400 ) ) ( not ( = ?auto_53399 ?auto_53401 ) ) ( not ( = ?auto_53400 ?auto_53401 ) ) ( ON ?auto_53401 ?auto_53402 ) ( not ( = ?auto_53397 ?auto_53402 ) ) ( not ( = ?auto_53398 ?auto_53402 ) ) ( not ( = ?auto_53399 ?auto_53402 ) ) ( not ( = ?auto_53400 ?auto_53402 ) ) ( not ( = ?auto_53401 ?auto_53402 ) ) ( ON ?auto_53400 ?auto_53401 ) ( ON-TABLE ?auto_53402 ) ( ON ?auto_53399 ?auto_53400 ) ( CLEAR ?auto_53399 ) ( HOLDING ?auto_53398 ) ( CLEAR ?auto_53397 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53397 ?auto_53398 )
      ( MAKE-5PILE ?auto_53397 ?auto_53398 ?auto_53399 ?auto_53400 ?auto_53401 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53403 - BLOCK
      ?auto_53404 - BLOCK
      ?auto_53405 - BLOCK
      ?auto_53406 - BLOCK
      ?auto_53407 - BLOCK
    )
    :vars
    (
      ?auto_53408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53403 ) ( not ( = ?auto_53403 ?auto_53404 ) ) ( not ( = ?auto_53403 ?auto_53405 ) ) ( not ( = ?auto_53403 ?auto_53406 ) ) ( not ( = ?auto_53403 ?auto_53407 ) ) ( not ( = ?auto_53404 ?auto_53405 ) ) ( not ( = ?auto_53404 ?auto_53406 ) ) ( not ( = ?auto_53404 ?auto_53407 ) ) ( not ( = ?auto_53405 ?auto_53406 ) ) ( not ( = ?auto_53405 ?auto_53407 ) ) ( not ( = ?auto_53406 ?auto_53407 ) ) ( ON ?auto_53407 ?auto_53408 ) ( not ( = ?auto_53403 ?auto_53408 ) ) ( not ( = ?auto_53404 ?auto_53408 ) ) ( not ( = ?auto_53405 ?auto_53408 ) ) ( not ( = ?auto_53406 ?auto_53408 ) ) ( not ( = ?auto_53407 ?auto_53408 ) ) ( ON ?auto_53406 ?auto_53407 ) ( ON-TABLE ?auto_53408 ) ( ON ?auto_53405 ?auto_53406 ) ( CLEAR ?auto_53403 ) ( ON ?auto_53404 ?auto_53405 ) ( CLEAR ?auto_53404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53408 ?auto_53407 ?auto_53406 ?auto_53405 )
      ( MAKE-5PILE ?auto_53403 ?auto_53404 ?auto_53405 ?auto_53406 ?auto_53407 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53409 - BLOCK
      ?auto_53410 - BLOCK
      ?auto_53411 - BLOCK
      ?auto_53412 - BLOCK
      ?auto_53413 - BLOCK
    )
    :vars
    (
      ?auto_53414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53409 ?auto_53410 ) ) ( not ( = ?auto_53409 ?auto_53411 ) ) ( not ( = ?auto_53409 ?auto_53412 ) ) ( not ( = ?auto_53409 ?auto_53413 ) ) ( not ( = ?auto_53410 ?auto_53411 ) ) ( not ( = ?auto_53410 ?auto_53412 ) ) ( not ( = ?auto_53410 ?auto_53413 ) ) ( not ( = ?auto_53411 ?auto_53412 ) ) ( not ( = ?auto_53411 ?auto_53413 ) ) ( not ( = ?auto_53412 ?auto_53413 ) ) ( ON ?auto_53413 ?auto_53414 ) ( not ( = ?auto_53409 ?auto_53414 ) ) ( not ( = ?auto_53410 ?auto_53414 ) ) ( not ( = ?auto_53411 ?auto_53414 ) ) ( not ( = ?auto_53412 ?auto_53414 ) ) ( not ( = ?auto_53413 ?auto_53414 ) ) ( ON ?auto_53412 ?auto_53413 ) ( ON-TABLE ?auto_53414 ) ( ON ?auto_53411 ?auto_53412 ) ( ON ?auto_53410 ?auto_53411 ) ( CLEAR ?auto_53410 ) ( HOLDING ?auto_53409 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53409 )
      ( MAKE-5PILE ?auto_53409 ?auto_53410 ?auto_53411 ?auto_53412 ?auto_53413 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53415 - BLOCK
      ?auto_53416 - BLOCK
      ?auto_53417 - BLOCK
      ?auto_53418 - BLOCK
      ?auto_53419 - BLOCK
    )
    :vars
    (
      ?auto_53420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53415 ?auto_53416 ) ) ( not ( = ?auto_53415 ?auto_53417 ) ) ( not ( = ?auto_53415 ?auto_53418 ) ) ( not ( = ?auto_53415 ?auto_53419 ) ) ( not ( = ?auto_53416 ?auto_53417 ) ) ( not ( = ?auto_53416 ?auto_53418 ) ) ( not ( = ?auto_53416 ?auto_53419 ) ) ( not ( = ?auto_53417 ?auto_53418 ) ) ( not ( = ?auto_53417 ?auto_53419 ) ) ( not ( = ?auto_53418 ?auto_53419 ) ) ( ON ?auto_53419 ?auto_53420 ) ( not ( = ?auto_53415 ?auto_53420 ) ) ( not ( = ?auto_53416 ?auto_53420 ) ) ( not ( = ?auto_53417 ?auto_53420 ) ) ( not ( = ?auto_53418 ?auto_53420 ) ) ( not ( = ?auto_53419 ?auto_53420 ) ) ( ON ?auto_53418 ?auto_53419 ) ( ON-TABLE ?auto_53420 ) ( ON ?auto_53417 ?auto_53418 ) ( ON ?auto_53416 ?auto_53417 ) ( ON ?auto_53415 ?auto_53416 ) ( CLEAR ?auto_53415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53420 ?auto_53419 ?auto_53418 ?auto_53417 ?auto_53416 )
      ( MAKE-5PILE ?auto_53415 ?auto_53416 ?auto_53417 ?auto_53418 ?auto_53419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53426 - BLOCK
      ?auto_53427 - BLOCK
      ?auto_53428 - BLOCK
      ?auto_53429 - BLOCK
      ?auto_53430 - BLOCK
    )
    :vars
    (
      ?auto_53431 - BLOCK
      ?auto_53432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53426 ?auto_53427 ) ) ( not ( = ?auto_53426 ?auto_53428 ) ) ( not ( = ?auto_53426 ?auto_53429 ) ) ( not ( = ?auto_53426 ?auto_53430 ) ) ( not ( = ?auto_53427 ?auto_53428 ) ) ( not ( = ?auto_53427 ?auto_53429 ) ) ( not ( = ?auto_53427 ?auto_53430 ) ) ( not ( = ?auto_53428 ?auto_53429 ) ) ( not ( = ?auto_53428 ?auto_53430 ) ) ( not ( = ?auto_53429 ?auto_53430 ) ) ( ON ?auto_53430 ?auto_53431 ) ( not ( = ?auto_53426 ?auto_53431 ) ) ( not ( = ?auto_53427 ?auto_53431 ) ) ( not ( = ?auto_53428 ?auto_53431 ) ) ( not ( = ?auto_53429 ?auto_53431 ) ) ( not ( = ?auto_53430 ?auto_53431 ) ) ( ON ?auto_53429 ?auto_53430 ) ( ON-TABLE ?auto_53431 ) ( ON ?auto_53428 ?auto_53429 ) ( ON ?auto_53427 ?auto_53428 ) ( CLEAR ?auto_53427 ) ( ON ?auto_53426 ?auto_53432 ) ( CLEAR ?auto_53426 ) ( HAND-EMPTY ) ( not ( = ?auto_53426 ?auto_53432 ) ) ( not ( = ?auto_53427 ?auto_53432 ) ) ( not ( = ?auto_53428 ?auto_53432 ) ) ( not ( = ?auto_53429 ?auto_53432 ) ) ( not ( = ?auto_53430 ?auto_53432 ) ) ( not ( = ?auto_53431 ?auto_53432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53426 ?auto_53432 )
      ( MAKE-5PILE ?auto_53426 ?auto_53427 ?auto_53428 ?auto_53429 ?auto_53430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53433 - BLOCK
      ?auto_53434 - BLOCK
      ?auto_53435 - BLOCK
      ?auto_53436 - BLOCK
      ?auto_53437 - BLOCK
    )
    :vars
    (
      ?auto_53439 - BLOCK
      ?auto_53438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53433 ?auto_53434 ) ) ( not ( = ?auto_53433 ?auto_53435 ) ) ( not ( = ?auto_53433 ?auto_53436 ) ) ( not ( = ?auto_53433 ?auto_53437 ) ) ( not ( = ?auto_53434 ?auto_53435 ) ) ( not ( = ?auto_53434 ?auto_53436 ) ) ( not ( = ?auto_53434 ?auto_53437 ) ) ( not ( = ?auto_53435 ?auto_53436 ) ) ( not ( = ?auto_53435 ?auto_53437 ) ) ( not ( = ?auto_53436 ?auto_53437 ) ) ( ON ?auto_53437 ?auto_53439 ) ( not ( = ?auto_53433 ?auto_53439 ) ) ( not ( = ?auto_53434 ?auto_53439 ) ) ( not ( = ?auto_53435 ?auto_53439 ) ) ( not ( = ?auto_53436 ?auto_53439 ) ) ( not ( = ?auto_53437 ?auto_53439 ) ) ( ON ?auto_53436 ?auto_53437 ) ( ON-TABLE ?auto_53439 ) ( ON ?auto_53435 ?auto_53436 ) ( ON ?auto_53433 ?auto_53438 ) ( CLEAR ?auto_53433 ) ( not ( = ?auto_53433 ?auto_53438 ) ) ( not ( = ?auto_53434 ?auto_53438 ) ) ( not ( = ?auto_53435 ?auto_53438 ) ) ( not ( = ?auto_53436 ?auto_53438 ) ) ( not ( = ?auto_53437 ?auto_53438 ) ) ( not ( = ?auto_53439 ?auto_53438 ) ) ( HOLDING ?auto_53434 ) ( CLEAR ?auto_53435 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53439 ?auto_53437 ?auto_53436 ?auto_53435 ?auto_53434 )
      ( MAKE-5PILE ?auto_53433 ?auto_53434 ?auto_53435 ?auto_53436 ?auto_53437 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53440 - BLOCK
      ?auto_53441 - BLOCK
      ?auto_53442 - BLOCK
      ?auto_53443 - BLOCK
      ?auto_53444 - BLOCK
    )
    :vars
    (
      ?auto_53445 - BLOCK
      ?auto_53446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53440 ?auto_53441 ) ) ( not ( = ?auto_53440 ?auto_53442 ) ) ( not ( = ?auto_53440 ?auto_53443 ) ) ( not ( = ?auto_53440 ?auto_53444 ) ) ( not ( = ?auto_53441 ?auto_53442 ) ) ( not ( = ?auto_53441 ?auto_53443 ) ) ( not ( = ?auto_53441 ?auto_53444 ) ) ( not ( = ?auto_53442 ?auto_53443 ) ) ( not ( = ?auto_53442 ?auto_53444 ) ) ( not ( = ?auto_53443 ?auto_53444 ) ) ( ON ?auto_53444 ?auto_53445 ) ( not ( = ?auto_53440 ?auto_53445 ) ) ( not ( = ?auto_53441 ?auto_53445 ) ) ( not ( = ?auto_53442 ?auto_53445 ) ) ( not ( = ?auto_53443 ?auto_53445 ) ) ( not ( = ?auto_53444 ?auto_53445 ) ) ( ON ?auto_53443 ?auto_53444 ) ( ON-TABLE ?auto_53445 ) ( ON ?auto_53442 ?auto_53443 ) ( ON ?auto_53440 ?auto_53446 ) ( not ( = ?auto_53440 ?auto_53446 ) ) ( not ( = ?auto_53441 ?auto_53446 ) ) ( not ( = ?auto_53442 ?auto_53446 ) ) ( not ( = ?auto_53443 ?auto_53446 ) ) ( not ( = ?auto_53444 ?auto_53446 ) ) ( not ( = ?auto_53445 ?auto_53446 ) ) ( CLEAR ?auto_53442 ) ( ON ?auto_53441 ?auto_53440 ) ( CLEAR ?auto_53441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53446 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53446 ?auto_53440 )
      ( MAKE-5PILE ?auto_53440 ?auto_53441 ?auto_53442 ?auto_53443 ?auto_53444 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53447 - BLOCK
      ?auto_53448 - BLOCK
      ?auto_53449 - BLOCK
      ?auto_53450 - BLOCK
      ?auto_53451 - BLOCK
    )
    :vars
    (
      ?auto_53453 - BLOCK
      ?auto_53452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53447 ?auto_53448 ) ) ( not ( = ?auto_53447 ?auto_53449 ) ) ( not ( = ?auto_53447 ?auto_53450 ) ) ( not ( = ?auto_53447 ?auto_53451 ) ) ( not ( = ?auto_53448 ?auto_53449 ) ) ( not ( = ?auto_53448 ?auto_53450 ) ) ( not ( = ?auto_53448 ?auto_53451 ) ) ( not ( = ?auto_53449 ?auto_53450 ) ) ( not ( = ?auto_53449 ?auto_53451 ) ) ( not ( = ?auto_53450 ?auto_53451 ) ) ( ON ?auto_53451 ?auto_53453 ) ( not ( = ?auto_53447 ?auto_53453 ) ) ( not ( = ?auto_53448 ?auto_53453 ) ) ( not ( = ?auto_53449 ?auto_53453 ) ) ( not ( = ?auto_53450 ?auto_53453 ) ) ( not ( = ?auto_53451 ?auto_53453 ) ) ( ON ?auto_53450 ?auto_53451 ) ( ON-TABLE ?auto_53453 ) ( ON ?auto_53447 ?auto_53452 ) ( not ( = ?auto_53447 ?auto_53452 ) ) ( not ( = ?auto_53448 ?auto_53452 ) ) ( not ( = ?auto_53449 ?auto_53452 ) ) ( not ( = ?auto_53450 ?auto_53452 ) ) ( not ( = ?auto_53451 ?auto_53452 ) ) ( not ( = ?auto_53453 ?auto_53452 ) ) ( ON ?auto_53448 ?auto_53447 ) ( CLEAR ?auto_53448 ) ( ON-TABLE ?auto_53452 ) ( HOLDING ?auto_53449 ) ( CLEAR ?auto_53450 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53453 ?auto_53451 ?auto_53450 ?auto_53449 )
      ( MAKE-5PILE ?auto_53447 ?auto_53448 ?auto_53449 ?auto_53450 ?auto_53451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53454 - BLOCK
      ?auto_53455 - BLOCK
      ?auto_53456 - BLOCK
      ?auto_53457 - BLOCK
      ?auto_53458 - BLOCK
    )
    :vars
    (
      ?auto_53459 - BLOCK
      ?auto_53460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53454 ?auto_53455 ) ) ( not ( = ?auto_53454 ?auto_53456 ) ) ( not ( = ?auto_53454 ?auto_53457 ) ) ( not ( = ?auto_53454 ?auto_53458 ) ) ( not ( = ?auto_53455 ?auto_53456 ) ) ( not ( = ?auto_53455 ?auto_53457 ) ) ( not ( = ?auto_53455 ?auto_53458 ) ) ( not ( = ?auto_53456 ?auto_53457 ) ) ( not ( = ?auto_53456 ?auto_53458 ) ) ( not ( = ?auto_53457 ?auto_53458 ) ) ( ON ?auto_53458 ?auto_53459 ) ( not ( = ?auto_53454 ?auto_53459 ) ) ( not ( = ?auto_53455 ?auto_53459 ) ) ( not ( = ?auto_53456 ?auto_53459 ) ) ( not ( = ?auto_53457 ?auto_53459 ) ) ( not ( = ?auto_53458 ?auto_53459 ) ) ( ON ?auto_53457 ?auto_53458 ) ( ON-TABLE ?auto_53459 ) ( ON ?auto_53454 ?auto_53460 ) ( not ( = ?auto_53454 ?auto_53460 ) ) ( not ( = ?auto_53455 ?auto_53460 ) ) ( not ( = ?auto_53456 ?auto_53460 ) ) ( not ( = ?auto_53457 ?auto_53460 ) ) ( not ( = ?auto_53458 ?auto_53460 ) ) ( not ( = ?auto_53459 ?auto_53460 ) ) ( ON ?auto_53455 ?auto_53454 ) ( ON-TABLE ?auto_53460 ) ( CLEAR ?auto_53457 ) ( ON ?auto_53456 ?auto_53455 ) ( CLEAR ?auto_53456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53460 ?auto_53454 ?auto_53455 )
      ( MAKE-5PILE ?auto_53454 ?auto_53455 ?auto_53456 ?auto_53457 ?auto_53458 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53461 - BLOCK
      ?auto_53462 - BLOCK
      ?auto_53463 - BLOCK
      ?auto_53464 - BLOCK
      ?auto_53465 - BLOCK
    )
    :vars
    (
      ?auto_53467 - BLOCK
      ?auto_53466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53461 ?auto_53462 ) ) ( not ( = ?auto_53461 ?auto_53463 ) ) ( not ( = ?auto_53461 ?auto_53464 ) ) ( not ( = ?auto_53461 ?auto_53465 ) ) ( not ( = ?auto_53462 ?auto_53463 ) ) ( not ( = ?auto_53462 ?auto_53464 ) ) ( not ( = ?auto_53462 ?auto_53465 ) ) ( not ( = ?auto_53463 ?auto_53464 ) ) ( not ( = ?auto_53463 ?auto_53465 ) ) ( not ( = ?auto_53464 ?auto_53465 ) ) ( ON ?auto_53465 ?auto_53467 ) ( not ( = ?auto_53461 ?auto_53467 ) ) ( not ( = ?auto_53462 ?auto_53467 ) ) ( not ( = ?auto_53463 ?auto_53467 ) ) ( not ( = ?auto_53464 ?auto_53467 ) ) ( not ( = ?auto_53465 ?auto_53467 ) ) ( ON-TABLE ?auto_53467 ) ( ON ?auto_53461 ?auto_53466 ) ( not ( = ?auto_53461 ?auto_53466 ) ) ( not ( = ?auto_53462 ?auto_53466 ) ) ( not ( = ?auto_53463 ?auto_53466 ) ) ( not ( = ?auto_53464 ?auto_53466 ) ) ( not ( = ?auto_53465 ?auto_53466 ) ) ( not ( = ?auto_53467 ?auto_53466 ) ) ( ON ?auto_53462 ?auto_53461 ) ( ON-TABLE ?auto_53466 ) ( ON ?auto_53463 ?auto_53462 ) ( CLEAR ?auto_53463 ) ( HOLDING ?auto_53464 ) ( CLEAR ?auto_53465 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53467 ?auto_53465 ?auto_53464 )
      ( MAKE-5PILE ?auto_53461 ?auto_53462 ?auto_53463 ?auto_53464 ?auto_53465 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53468 - BLOCK
      ?auto_53469 - BLOCK
      ?auto_53470 - BLOCK
      ?auto_53471 - BLOCK
      ?auto_53472 - BLOCK
    )
    :vars
    (
      ?auto_53474 - BLOCK
      ?auto_53473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53468 ?auto_53469 ) ) ( not ( = ?auto_53468 ?auto_53470 ) ) ( not ( = ?auto_53468 ?auto_53471 ) ) ( not ( = ?auto_53468 ?auto_53472 ) ) ( not ( = ?auto_53469 ?auto_53470 ) ) ( not ( = ?auto_53469 ?auto_53471 ) ) ( not ( = ?auto_53469 ?auto_53472 ) ) ( not ( = ?auto_53470 ?auto_53471 ) ) ( not ( = ?auto_53470 ?auto_53472 ) ) ( not ( = ?auto_53471 ?auto_53472 ) ) ( ON ?auto_53472 ?auto_53474 ) ( not ( = ?auto_53468 ?auto_53474 ) ) ( not ( = ?auto_53469 ?auto_53474 ) ) ( not ( = ?auto_53470 ?auto_53474 ) ) ( not ( = ?auto_53471 ?auto_53474 ) ) ( not ( = ?auto_53472 ?auto_53474 ) ) ( ON-TABLE ?auto_53474 ) ( ON ?auto_53468 ?auto_53473 ) ( not ( = ?auto_53468 ?auto_53473 ) ) ( not ( = ?auto_53469 ?auto_53473 ) ) ( not ( = ?auto_53470 ?auto_53473 ) ) ( not ( = ?auto_53471 ?auto_53473 ) ) ( not ( = ?auto_53472 ?auto_53473 ) ) ( not ( = ?auto_53474 ?auto_53473 ) ) ( ON ?auto_53469 ?auto_53468 ) ( ON-TABLE ?auto_53473 ) ( ON ?auto_53470 ?auto_53469 ) ( CLEAR ?auto_53472 ) ( ON ?auto_53471 ?auto_53470 ) ( CLEAR ?auto_53471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53473 ?auto_53468 ?auto_53469 ?auto_53470 )
      ( MAKE-5PILE ?auto_53468 ?auto_53469 ?auto_53470 ?auto_53471 ?auto_53472 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53475 - BLOCK
      ?auto_53476 - BLOCK
      ?auto_53477 - BLOCK
      ?auto_53478 - BLOCK
      ?auto_53479 - BLOCK
    )
    :vars
    (
      ?auto_53481 - BLOCK
      ?auto_53480 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53475 ?auto_53476 ) ) ( not ( = ?auto_53475 ?auto_53477 ) ) ( not ( = ?auto_53475 ?auto_53478 ) ) ( not ( = ?auto_53475 ?auto_53479 ) ) ( not ( = ?auto_53476 ?auto_53477 ) ) ( not ( = ?auto_53476 ?auto_53478 ) ) ( not ( = ?auto_53476 ?auto_53479 ) ) ( not ( = ?auto_53477 ?auto_53478 ) ) ( not ( = ?auto_53477 ?auto_53479 ) ) ( not ( = ?auto_53478 ?auto_53479 ) ) ( not ( = ?auto_53475 ?auto_53481 ) ) ( not ( = ?auto_53476 ?auto_53481 ) ) ( not ( = ?auto_53477 ?auto_53481 ) ) ( not ( = ?auto_53478 ?auto_53481 ) ) ( not ( = ?auto_53479 ?auto_53481 ) ) ( ON-TABLE ?auto_53481 ) ( ON ?auto_53475 ?auto_53480 ) ( not ( = ?auto_53475 ?auto_53480 ) ) ( not ( = ?auto_53476 ?auto_53480 ) ) ( not ( = ?auto_53477 ?auto_53480 ) ) ( not ( = ?auto_53478 ?auto_53480 ) ) ( not ( = ?auto_53479 ?auto_53480 ) ) ( not ( = ?auto_53481 ?auto_53480 ) ) ( ON ?auto_53476 ?auto_53475 ) ( ON-TABLE ?auto_53480 ) ( ON ?auto_53477 ?auto_53476 ) ( ON ?auto_53478 ?auto_53477 ) ( CLEAR ?auto_53478 ) ( HOLDING ?auto_53479 ) ( CLEAR ?auto_53481 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53481 ?auto_53479 )
      ( MAKE-5PILE ?auto_53475 ?auto_53476 ?auto_53477 ?auto_53478 ?auto_53479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53482 - BLOCK
      ?auto_53483 - BLOCK
      ?auto_53484 - BLOCK
      ?auto_53485 - BLOCK
      ?auto_53486 - BLOCK
    )
    :vars
    (
      ?auto_53487 - BLOCK
      ?auto_53488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53482 ?auto_53483 ) ) ( not ( = ?auto_53482 ?auto_53484 ) ) ( not ( = ?auto_53482 ?auto_53485 ) ) ( not ( = ?auto_53482 ?auto_53486 ) ) ( not ( = ?auto_53483 ?auto_53484 ) ) ( not ( = ?auto_53483 ?auto_53485 ) ) ( not ( = ?auto_53483 ?auto_53486 ) ) ( not ( = ?auto_53484 ?auto_53485 ) ) ( not ( = ?auto_53484 ?auto_53486 ) ) ( not ( = ?auto_53485 ?auto_53486 ) ) ( not ( = ?auto_53482 ?auto_53487 ) ) ( not ( = ?auto_53483 ?auto_53487 ) ) ( not ( = ?auto_53484 ?auto_53487 ) ) ( not ( = ?auto_53485 ?auto_53487 ) ) ( not ( = ?auto_53486 ?auto_53487 ) ) ( ON-TABLE ?auto_53487 ) ( ON ?auto_53482 ?auto_53488 ) ( not ( = ?auto_53482 ?auto_53488 ) ) ( not ( = ?auto_53483 ?auto_53488 ) ) ( not ( = ?auto_53484 ?auto_53488 ) ) ( not ( = ?auto_53485 ?auto_53488 ) ) ( not ( = ?auto_53486 ?auto_53488 ) ) ( not ( = ?auto_53487 ?auto_53488 ) ) ( ON ?auto_53483 ?auto_53482 ) ( ON-TABLE ?auto_53488 ) ( ON ?auto_53484 ?auto_53483 ) ( ON ?auto_53485 ?auto_53484 ) ( CLEAR ?auto_53487 ) ( ON ?auto_53486 ?auto_53485 ) ( CLEAR ?auto_53486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53488 ?auto_53482 ?auto_53483 ?auto_53484 ?auto_53485 )
      ( MAKE-5PILE ?auto_53482 ?auto_53483 ?auto_53484 ?auto_53485 ?auto_53486 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53489 - BLOCK
      ?auto_53490 - BLOCK
      ?auto_53491 - BLOCK
      ?auto_53492 - BLOCK
      ?auto_53493 - BLOCK
    )
    :vars
    (
      ?auto_53494 - BLOCK
      ?auto_53495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53489 ?auto_53490 ) ) ( not ( = ?auto_53489 ?auto_53491 ) ) ( not ( = ?auto_53489 ?auto_53492 ) ) ( not ( = ?auto_53489 ?auto_53493 ) ) ( not ( = ?auto_53490 ?auto_53491 ) ) ( not ( = ?auto_53490 ?auto_53492 ) ) ( not ( = ?auto_53490 ?auto_53493 ) ) ( not ( = ?auto_53491 ?auto_53492 ) ) ( not ( = ?auto_53491 ?auto_53493 ) ) ( not ( = ?auto_53492 ?auto_53493 ) ) ( not ( = ?auto_53489 ?auto_53494 ) ) ( not ( = ?auto_53490 ?auto_53494 ) ) ( not ( = ?auto_53491 ?auto_53494 ) ) ( not ( = ?auto_53492 ?auto_53494 ) ) ( not ( = ?auto_53493 ?auto_53494 ) ) ( ON ?auto_53489 ?auto_53495 ) ( not ( = ?auto_53489 ?auto_53495 ) ) ( not ( = ?auto_53490 ?auto_53495 ) ) ( not ( = ?auto_53491 ?auto_53495 ) ) ( not ( = ?auto_53492 ?auto_53495 ) ) ( not ( = ?auto_53493 ?auto_53495 ) ) ( not ( = ?auto_53494 ?auto_53495 ) ) ( ON ?auto_53490 ?auto_53489 ) ( ON-TABLE ?auto_53495 ) ( ON ?auto_53491 ?auto_53490 ) ( ON ?auto_53492 ?auto_53491 ) ( ON ?auto_53493 ?auto_53492 ) ( CLEAR ?auto_53493 ) ( HOLDING ?auto_53494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53494 )
      ( MAKE-5PILE ?auto_53489 ?auto_53490 ?auto_53491 ?auto_53492 ?auto_53493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53496 - BLOCK
      ?auto_53497 - BLOCK
      ?auto_53498 - BLOCK
      ?auto_53499 - BLOCK
      ?auto_53500 - BLOCK
    )
    :vars
    (
      ?auto_53501 - BLOCK
      ?auto_53502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53496 ?auto_53497 ) ) ( not ( = ?auto_53496 ?auto_53498 ) ) ( not ( = ?auto_53496 ?auto_53499 ) ) ( not ( = ?auto_53496 ?auto_53500 ) ) ( not ( = ?auto_53497 ?auto_53498 ) ) ( not ( = ?auto_53497 ?auto_53499 ) ) ( not ( = ?auto_53497 ?auto_53500 ) ) ( not ( = ?auto_53498 ?auto_53499 ) ) ( not ( = ?auto_53498 ?auto_53500 ) ) ( not ( = ?auto_53499 ?auto_53500 ) ) ( not ( = ?auto_53496 ?auto_53501 ) ) ( not ( = ?auto_53497 ?auto_53501 ) ) ( not ( = ?auto_53498 ?auto_53501 ) ) ( not ( = ?auto_53499 ?auto_53501 ) ) ( not ( = ?auto_53500 ?auto_53501 ) ) ( ON ?auto_53496 ?auto_53502 ) ( not ( = ?auto_53496 ?auto_53502 ) ) ( not ( = ?auto_53497 ?auto_53502 ) ) ( not ( = ?auto_53498 ?auto_53502 ) ) ( not ( = ?auto_53499 ?auto_53502 ) ) ( not ( = ?auto_53500 ?auto_53502 ) ) ( not ( = ?auto_53501 ?auto_53502 ) ) ( ON ?auto_53497 ?auto_53496 ) ( ON-TABLE ?auto_53502 ) ( ON ?auto_53498 ?auto_53497 ) ( ON ?auto_53499 ?auto_53498 ) ( ON ?auto_53500 ?auto_53499 ) ( ON ?auto_53501 ?auto_53500 ) ( CLEAR ?auto_53501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53502 ?auto_53496 ?auto_53497 ?auto_53498 ?auto_53499 ?auto_53500 )
      ( MAKE-5PILE ?auto_53496 ?auto_53497 ?auto_53498 ?auto_53499 ?auto_53500 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53515 - BLOCK
      ?auto_53516 - BLOCK
      ?auto_53517 - BLOCK
      ?auto_53518 - BLOCK
      ?auto_53519 - BLOCK
      ?auto_53520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53519 ) ( ON-TABLE ?auto_53515 ) ( ON ?auto_53516 ?auto_53515 ) ( ON ?auto_53517 ?auto_53516 ) ( ON ?auto_53518 ?auto_53517 ) ( ON ?auto_53519 ?auto_53518 ) ( not ( = ?auto_53515 ?auto_53516 ) ) ( not ( = ?auto_53515 ?auto_53517 ) ) ( not ( = ?auto_53515 ?auto_53518 ) ) ( not ( = ?auto_53515 ?auto_53519 ) ) ( not ( = ?auto_53515 ?auto_53520 ) ) ( not ( = ?auto_53516 ?auto_53517 ) ) ( not ( = ?auto_53516 ?auto_53518 ) ) ( not ( = ?auto_53516 ?auto_53519 ) ) ( not ( = ?auto_53516 ?auto_53520 ) ) ( not ( = ?auto_53517 ?auto_53518 ) ) ( not ( = ?auto_53517 ?auto_53519 ) ) ( not ( = ?auto_53517 ?auto_53520 ) ) ( not ( = ?auto_53518 ?auto_53519 ) ) ( not ( = ?auto_53518 ?auto_53520 ) ) ( not ( = ?auto_53519 ?auto_53520 ) ) ( ON-TABLE ?auto_53520 ) ( CLEAR ?auto_53520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_53520 )
      ( MAKE-6PILE ?auto_53515 ?auto_53516 ?auto_53517 ?auto_53518 ?auto_53519 ?auto_53520 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53521 - BLOCK
      ?auto_53522 - BLOCK
      ?auto_53523 - BLOCK
      ?auto_53524 - BLOCK
      ?auto_53525 - BLOCK
      ?auto_53526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53521 ) ( ON ?auto_53522 ?auto_53521 ) ( ON ?auto_53523 ?auto_53522 ) ( ON ?auto_53524 ?auto_53523 ) ( not ( = ?auto_53521 ?auto_53522 ) ) ( not ( = ?auto_53521 ?auto_53523 ) ) ( not ( = ?auto_53521 ?auto_53524 ) ) ( not ( = ?auto_53521 ?auto_53525 ) ) ( not ( = ?auto_53521 ?auto_53526 ) ) ( not ( = ?auto_53522 ?auto_53523 ) ) ( not ( = ?auto_53522 ?auto_53524 ) ) ( not ( = ?auto_53522 ?auto_53525 ) ) ( not ( = ?auto_53522 ?auto_53526 ) ) ( not ( = ?auto_53523 ?auto_53524 ) ) ( not ( = ?auto_53523 ?auto_53525 ) ) ( not ( = ?auto_53523 ?auto_53526 ) ) ( not ( = ?auto_53524 ?auto_53525 ) ) ( not ( = ?auto_53524 ?auto_53526 ) ) ( not ( = ?auto_53525 ?auto_53526 ) ) ( ON-TABLE ?auto_53526 ) ( CLEAR ?auto_53526 ) ( HOLDING ?auto_53525 ) ( CLEAR ?auto_53524 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53521 ?auto_53522 ?auto_53523 ?auto_53524 ?auto_53525 )
      ( MAKE-6PILE ?auto_53521 ?auto_53522 ?auto_53523 ?auto_53524 ?auto_53525 ?auto_53526 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53527 - BLOCK
      ?auto_53528 - BLOCK
      ?auto_53529 - BLOCK
      ?auto_53530 - BLOCK
      ?auto_53531 - BLOCK
      ?auto_53532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53527 ) ( ON ?auto_53528 ?auto_53527 ) ( ON ?auto_53529 ?auto_53528 ) ( ON ?auto_53530 ?auto_53529 ) ( not ( = ?auto_53527 ?auto_53528 ) ) ( not ( = ?auto_53527 ?auto_53529 ) ) ( not ( = ?auto_53527 ?auto_53530 ) ) ( not ( = ?auto_53527 ?auto_53531 ) ) ( not ( = ?auto_53527 ?auto_53532 ) ) ( not ( = ?auto_53528 ?auto_53529 ) ) ( not ( = ?auto_53528 ?auto_53530 ) ) ( not ( = ?auto_53528 ?auto_53531 ) ) ( not ( = ?auto_53528 ?auto_53532 ) ) ( not ( = ?auto_53529 ?auto_53530 ) ) ( not ( = ?auto_53529 ?auto_53531 ) ) ( not ( = ?auto_53529 ?auto_53532 ) ) ( not ( = ?auto_53530 ?auto_53531 ) ) ( not ( = ?auto_53530 ?auto_53532 ) ) ( not ( = ?auto_53531 ?auto_53532 ) ) ( ON-TABLE ?auto_53532 ) ( CLEAR ?auto_53530 ) ( ON ?auto_53531 ?auto_53532 ) ( CLEAR ?auto_53531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53532 )
      ( MAKE-6PILE ?auto_53527 ?auto_53528 ?auto_53529 ?auto_53530 ?auto_53531 ?auto_53532 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53533 - BLOCK
      ?auto_53534 - BLOCK
      ?auto_53535 - BLOCK
      ?auto_53536 - BLOCK
      ?auto_53537 - BLOCK
      ?auto_53538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53533 ) ( ON ?auto_53534 ?auto_53533 ) ( ON ?auto_53535 ?auto_53534 ) ( not ( = ?auto_53533 ?auto_53534 ) ) ( not ( = ?auto_53533 ?auto_53535 ) ) ( not ( = ?auto_53533 ?auto_53536 ) ) ( not ( = ?auto_53533 ?auto_53537 ) ) ( not ( = ?auto_53533 ?auto_53538 ) ) ( not ( = ?auto_53534 ?auto_53535 ) ) ( not ( = ?auto_53534 ?auto_53536 ) ) ( not ( = ?auto_53534 ?auto_53537 ) ) ( not ( = ?auto_53534 ?auto_53538 ) ) ( not ( = ?auto_53535 ?auto_53536 ) ) ( not ( = ?auto_53535 ?auto_53537 ) ) ( not ( = ?auto_53535 ?auto_53538 ) ) ( not ( = ?auto_53536 ?auto_53537 ) ) ( not ( = ?auto_53536 ?auto_53538 ) ) ( not ( = ?auto_53537 ?auto_53538 ) ) ( ON-TABLE ?auto_53538 ) ( ON ?auto_53537 ?auto_53538 ) ( CLEAR ?auto_53537 ) ( HOLDING ?auto_53536 ) ( CLEAR ?auto_53535 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53533 ?auto_53534 ?auto_53535 ?auto_53536 )
      ( MAKE-6PILE ?auto_53533 ?auto_53534 ?auto_53535 ?auto_53536 ?auto_53537 ?auto_53538 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53539 - BLOCK
      ?auto_53540 - BLOCK
      ?auto_53541 - BLOCK
      ?auto_53542 - BLOCK
      ?auto_53543 - BLOCK
      ?auto_53544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53539 ) ( ON ?auto_53540 ?auto_53539 ) ( ON ?auto_53541 ?auto_53540 ) ( not ( = ?auto_53539 ?auto_53540 ) ) ( not ( = ?auto_53539 ?auto_53541 ) ) ( not ( = ?auto_53539 ?auto_53542 ) ) ( not ( = ?auto_53539 ?auto_53543 ) ) ( not ( = ?auto_53539 ?auto_53544 ) ) ( not ( = ?auto_53540 ?auto_53541 ) ) ( not ( = ?auto_53540 ?auto_53542 ) ) ( not ( = ?auto_53540 ?auto_53543 ) ) ( not ( = ?auto_53540 ?auto_53544 ) ) ( not ( = ?auto_53541 ?auto_53542 ) ) ( not ( = ?auto_53541 ?auto_53543 ) ) ( not ( = ?auto_53541 ?auto_53544 ) ) ( not ( = ?auto_53542 ?auto_53543 ) ) ( not ( = ?auto_53542 ?auto_53544 ) ) ( not ( = ?auto_53543 ?auto_53544 ) ) ( ON-TABLE ?auto_53544 ) ( ON ?auto_53543 ?auto_53544 ) ( CLEAR ?auto_53541 ) ( ON ?auto_53542 ?auto_53543 ) ( CLEAR ?auto_53542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53544 ?auto_53543 )
      ( MAKE-6PILE ?auto_53539 ?auto_53540 ?auto_53541 ?auto_53542 ?auto_53543 ?auto_53544 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53545 - BLOCK
      ?auto_53546 - BLOCK
      ?auto_53547 - BLOCK
      ?auto_53548 - BLOCK
      ?auto_53549 - BLOCK
      ?auto_53550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53545 ) ( ON ?auto_53546 ?auto_53545 ) ( not ( = ?auto_53545 ?auto_53546 ) ) ( not ( = ?auto_53545 ?auto_53547 ) ) ( not ( = ?auto_53545 ?auto_53548 ) ) ( not ( = ?auto_53545 ?auto_53549 ) ) ( not ( = ?auto_53545 ?auto_53550 ) ) ( not ( = ?auto_53546 ?auto_53547 ) ) ( not ( = ?auto_53546 ?auto_53548 ) ) ( not ( = ?auto_53546 ?auto_53549 ) ) ( not ( = ?auto_53546 ?auto_53550 ) ) ( not ( = ?auto_53547 ?auto_53548 ) ) ( not ( = ?auto_53547 ?auto_53549 ) ) ( not ( = ?auto_53547 ?auto_53550 ) ) ( not ( = ?auto_53548 ?auto_53549 ) ) ( not ( = ?auto_53548 ?auto_53550 ) ) ( not ( = ?auto_53549 ?auto_53550 ) ) ( ON-TABLE ?auto_53550 ) ( ON ?auto_53549 ?auto_53550 ) ( ON ?auto_53548 ?auto_53549 ) ( CLEAR ?auto_53548 ) ( HOLDING ?auto_53547 ) ( CLEAR ?auto_53546 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53545 ?auto_53546 ?auto_53547 )
      ( MAKE-6PILE ?auto_53545 ?auto_53546 ?auto_53547 ?auto_53548 ?auto_53549 ?auto_53550 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53551 - BLOCK
      ?auto_53552 - BLOCK
      ?auto_53553 - BLOCK
      ?auto_53554 - BLOCK
      ?auto_53555 - BLOCK
      ?auto_53556 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53551 ) ( ON ?auto_53552 ?auto_53551 ) ( not ( = ?auto_53551 ?auto_53552 ) ) ( not ( = ?auto_53551 ?auto_53553 ) ) ( not ( = ?auto_53551 ?auto_53554 ) ) ( not ( = ?auto_53551 ?auto_53555 ) ) ( not ( = ?auto_53551 ?auto_53556 ) ) ( not ( = ?auto_53552 ?auto_53553 ) ) ( not ( = ?auto_53552 ?auto_53554 ) ) ( not ( = ?auto_53552 ?auto_53555 ) ) ( not ( = ?auto_53552 ?auto_53556 ) ) ( not ( = ?auto_53553 ?auto_53554 ) ) ( not ( = ?auto_53553 ?auto_53555 ) ) ( not ( = ?auto_53553 ?auto_53556 ) ) ( not ( = ?auto_53554 ?auto_53555 ) ) ( not ( = ?auto_53554 ?auto_53556 ) ) ( not ( = ?auto_53555 ?auto_53556 ) ) ( ON-TABLE ?auto_53556 ) ( ON ?auto_53555 ?auto_53556 ) ( ON ?auto_53554 ?auto_53555 ) ( CLEAR ?auto_53552 ) ( ON ?auto_53553 ?auto_53554 ) ( CLEAR ?auto_53553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53556 ?auto_53555 ?auto_53554 )
      ( MAKE-6PILE ?auto_53551 ?auto_53552 ?auto_53553 ?auto_53554 ?auto_53555 ?auto_53556 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53557 - BLOCK
      ?auto_53558 - BLOCK
      ?auto_53559 - BLOCK
      ?auto_53560 - BLOCK
      ?auto_53561 - BLOCK
      ?auto_53562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53557 ) ( not ( = ?auto_53557 ?auto_53558 ) ) ( not ( = ?auto_53557 ?auto_53559 ) ) ( not ( = ?auto_53557 ?auto_53560 ) ) ( not ( = ?auto_53557 ?auto_53561 ) ) ( not ( = ?auto_53557 ?auto_53562 ) ) ( not ( = ?auto_53558 ?auto_53559 ) ) ( not ( = ?auto_53558 ?auto_53560 ) ) ( not ( = ?auto_53558 ?auto_53561 ) ) ( not ( = ?auto_53558 ?auto_53562 ) ) ( not ( = ?auto_53559 ?auto_53560 ) ) ( not ( = ?auto_53559 ?auto_53561 ) ) ( not ( = ?auto_53559 ?auto_53562 ) ) ( not ( = ?auto_53560 ?auto_53561 ) ) ( not ( = ?auto_53560 ?auto_53562 ) ) ( not ( = ?auto_53561 ?auto_53562 ) ) ( ON-TABLE ?auto_53562 ) ( ON ?auto_53561 ?auto_53562 ) ( ON ?auto_53560 ?auto_53561 ) ( ON ?auto_53559 ?auto_53560 ) ( CLEAR ?auto_53559 ) ( HOLDING ?auto_53558 ) ( CLEAR ?auto_53557 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53557 ?auto_53558 )
      ( MAKE-6PILE ?auto_53557 ?auto_53558 ?auto_53559 ?auto_53560 ?auto_53561 ?auto_53562 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53563 - BLOCK
      ?auto_53564 - BLOCK
      ?auto_53565 - BLOCK
      ?auto_53566 - BLOCK
      ?auto_53567 - BLOCK
      ?auto_53568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_53563 ) ( not ( = ?auto_53563 ?auto_53564 ) ) ( not ( = ?auto_53563 ?auto_53565 ) ) ( not ( = ?auto_53563 ?auto_53566 ) ) ( not ( = ?auto_53563 ?auto_53567 ) ) ( not ( = ?auto_53563 ?auto_53568 ) ) ( not ( = ?auto_53564 ?auto_53565 ) ) ( not ( = ?auto_53564 ?auto_53566 ) ) ( not ( = ?auto_53564 ?auto_53567 ) ) ( not ( = ?auto_53564 ?auto_53568 ) ) ( not ( = ?auto_53565 ?auto_53566 ) ) ( not ( = ?auto_53565 ?auto_53567 ) ) ( not ( = ?auto_53565 ?auto_53568 ) ) ( not ( = ?auto_53566 ?auto_53567 ) ) ( not ( = ?auto_53566 ?auto_53568 ) ) ( not ( = ?auto_53567 ?auto_53568 ) ) ( ON-TABLE ?auto_53568 ) ( ON ?auto_53567 ?auto_53568 ) ( ON ?auto_53566 ?auto_53567 ) ( ON ?auto_53565 ?auto_53566 ) ( CLEAR ?auto_53563 ) ( ON ?auto_53564 ?auto_53565 ) ( CLEAR ?auto_53564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53568 ?auto_53567 ?auto_53566 ?auto_53565 )
      ( MAKE-6PILE ?auto_53563 ?auto_53564 ?auto_53565 ?auto_53566 ?auto_53567 ?auto_53568 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53569 - BLOCK
      ?auto_53570 - BLOCK
      ?auto_53571 - BLOCK
      ?auto_53572 - BLOCK
      ?auto_53573 - BLOCK
      ?auto_53574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53569 ?auto_53570 ) ) ( not ( = ?auto_53569 ?auto_53571 ) ) ( not ( = ?auto_53569 ?auto_53572 ) ) ( not ( = ?auto_53569 ?auto_53573 ) ) ( not ( = ?auto_53569 ?auto_53574 ) ) ( not ( = ?auto_53570 ?auto_53571 ) ) ( not ( = ?auto_53570 ?auto_53572 ) ) ( not ( = ?auto_53570 ?auto_53573 ) ) ( not ( = ?auto_53570 ?auto_53574 ) ) ( not ( = ?auto_53571 ?auto_53572 ) ) ( not ( = ?auto_53571 ?auto_53573 ) ) ( not ( = ?auto_53571 ?auto_53574 ) ) ( not ( = ?auto_53572 ?auto_53573 ) ) ( not ( = ?auto_53572 ?auto_53574 ) ) ( not ( = ?auto_53573 ?auto_53574 ) ) ( ON-TABLE ?auto_53574 ) ( ON ?auto_53573 ?auto_53574 ) ( ON ?auto_53572 ?auto_53573 ) ( ON ?auto_53571 ?auto_53572 ) ( ON ?auto_53570 ?auto_53571 ) ( CLEAR ?auto_53570 ) ( HOLDING ?auto_53569 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53569 )
      ( MAKE-6PILE ?auto_53569 ?auto_53570 ?auto_53571 ?auto_53572 ?auto_53573 ?auto_53574 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53575 - BLOCK
      ?auto_53576 - BLOCK
      ?auto_53577 - BLOCK
      ?auto_53578 - BLOCK
      ?auto_53579 - BLOCK
      ?auto_53580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53575 ?auto_53576 ) ) ( not ( = ?auto_53575 ?auto_53577 ) ) ( not ( = ?auto_53575 ?auto_53578 ) ) ( not ( = ?auto_53575 ?auto_53579 ) ) ( not ( = ?auto_53575 ?auto_53580 ) ) ( not ( = ?auto_53576 ?auto_53577 ) ) ( not ( = ?auto_53576 ?auto_53578 ) ) ( not ( = ?auto_53576 ?auto_53579 ) ) ( not ( = ?auto_53576 ?auto_53580 ) ) ( not ( = ?auto_53577 ?auto_53578 ) ) ( not ( = ?auto_53577 ?auto_53579 ) ) ( not ( = ?auto_53577 ?auto_53580 ) ) ( not ( = ?auto_53578 ?auto_53579 ) ) ( not ( = ?auto_53578 ?auto_53580 ) ) ( not ( = ?auto_53579 ?auto_53580 ) ) ( ON-TABLE ?auto_53580 ) ( ON ?auto_53579 ?auto_53580 ) ( ON ?auto_53578 ?auto_53579 ) ( ON ?auto_53577 ?auto_53578 ) ( ON ?auto_53576 ?auto_53577 ) ( ON ?auto_53575 ?auto_53576 ) ( CLEAR ?auto_53575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53580 ?auto_53579 ?auto_53578 ?auto_53577 ?auto_53576 )
      ( MAKE-6PILE ?auto_53575 ?auto_53576 ?auto_53577 ?auto_53578 ?auto_53579 ?auto_53580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53587 - BLOCK
      ?auto_53588 - BLOCK
      ?auto_53589 - BLOCK
      ?auto_53590 - BLOCK
      ?auto_53591 - BLOCK
      ?auto_53592 - BLOCK
    )
    :vars
    (
      ?auto_53593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53587 ?auto_53588 ) ) ( not ( = ?auto_53587 ?auto_53589 ) ) ( not ( = ?auto_53587 ?auto_53590 ) ) ( not ( = ?auto_53587 ?auto_53591 ) ) ( not ( = ?auto_53587 ?auto_53592 ) ) ( not ( = ?auto_53588 ?auto_53589 ) ) ( not ( = ?auto_53588 ?auto_53590 ) ) ( not ( = ?auto_53588 ?auto_53591 ) ) ( not ( = ?auto_53588 ?auto_53592 ) ) ( not ( = ?auto_53589 ?auto_53590 ) ) ( not ( = ?auto_53589 ?auto_53591 ) ) ( not ( = ?auto_53589 ?auto_53592 ) ) ( not ( = ?auto_53590 ?auto_53591 ) ) ( not ( = ?auto_53590 ?auto_53592 ) ) ( not ( = ?auto_53591 ?auto_53592 ) ) ( ON-TABLE ?auto_53592 ) ( ON ?auto_53591 ?auto_53592 ) ( ON ?auto_53590 ?auto_53591 ) ( ON ?auto_53589 ?auto_53590 ) ( ON ?auto_53588 ?auto_53589 ) ( CLEAR ?auto_53588 ) ( ON ?auto_53587 ?auto_53593 ) ( CLEAR ?auto_53587 ) ( HAND-EMPTY ) ( not ( = ?auto_53587 ?auto_53593 ) ) ( not ( = ?auto_53588 ?auto_53593 ) ) ( not ( = ?auto_53589 ?auto_53593 ) ) ( not ( = ?auto_53590 ?auto_53593 ) ) ( not ( = ?auto_53591 ?auto_53593 ) ) ( not ( = ?auto_53592 ?auto_53593 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53587 ?auto_53593 )
      ( MAKE-6PILE ?auto_53587 ?auto_53588 ?auto_53589 ?auto_53590 ?auto_53591 ?auto_53592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53594 - BLOCK
      ?auto_53595 - BLOCK
      ?auto_53596 - BLOCK
      ?auto_53597 - BLOCK
      ?auto_53598 - BLOCK
      ?auto_53599 - BLOCK
    )
    :vars
    (
      ?auto_53600 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53594 ?auto_53595 ) ) ( not ( = ?auto_53594 ?auto_53596 ) ) ( not ( = ?auto_53594 ?auto_53597 ) ) ( not ( = ?auto_53594 ?auto_53598 ) ) ( not ( = ?auto_53594 ?auto_53599 ) ) ( not ( = ?auto_53595 ?auto_53596 ) ) ( not ( = ?auto_53595 ?auto_53597 ) ) ( not ( = ?auto_53595 ?auto_53598 ) ) ( not ( = ?auto_53595 ?auto_53599 ) ) ( not ( = ?auto_53596 ?auto_53597 ) ) ( not ( = ?auto_53596 ?auto_53598 ) ) ( not ( = ?auto_53596 ?auto_53599 ) ) ( not ( = ?auto_53597 ?auto_53598 ) ) ( not ( = ?auto_53597 ?auto_53599 ) ) ( not ( = ?auto_53598 ?auto_53599 ) ) ( ON-TABLE ?auto_53599 ) ( ON ?auto_53598 ?auto_53599 ) ( ON ?auto_53597 ?auto_53598 ) ( ON ?auto_53596 ?auto_53597 ) ( ON ?auto_53594 ?auto_53600 ) ( CLEAR ?auto_53594 ) ( not ( = ?auto_53594 ?auto_53600 ) ) ( not ( = ?auto_53595 ?auto_53600 ) ) ( not ( = ?auto_53596 ?auto_53600 ) ) ( not ( = ?auto_53597 ?auto_53600 ) ) ( not ( = ?auto_53598 ?auto_53600 ) ) ( not ( = ?auto_53599 ?auto_53600 ) ) ( HOLDING ?auto_53595 ) ( CLEAR ?auto_53596 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53599 ?auto_53598 ?auto_53597 ?auto_53596 ?auto_53595 )
      ( MAKE-6PILE ?auto_53594 ?auto_53595 ?auto_53596 ?auto_53597 ?auto_53598 ?auto_53599 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53601 - BLOCK
      ?auto_53602 - BLOCK
      ?auto_53603 - BLOCK
      ?auto_53604 - BLOCK
      ?auto_53605 - BLOCK
      ?auto_53606 - BLOCK
    )
    :vars
    (
      ?auto_53607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53601 ?auto_53602 ) ) ( not ( = ?auto_53601 ?auto_53603 ) ) ( not ( = ?auto_53601 ?auto_53604 ) ) ( not ( = ?auto_53601 ?auto_53605 ) ) ( not ( = ?auto_53601 ?auto_53606 ) ) ( not ( = ?auto_53602 ?auto_53603 ) ) ( not ( = ?auto_53602 ?auto_53604 ) ) ( not ( = ?auto_53602 ?auto_53605 ) ) ( not ( = ?auto_53602 ?auto_53606 ) ) ( not ( = ?auto_53603 ?auto_53604 ) ) ( not ( = ?auto_53603 ?auto_53605 ) ) ( not ( = ?auto_53603 ?auto_53606 ) ) ( not ( = ?auto_53604 ?auto_53605 ) ) ( not ( = ?auto_53604 ?auto_53606 ) ) ( not ( = ?auto_53605 ?auto_53606 ) ) ( ON-TABLE ?auto_53606 ) ( ON ?auto_53605 ?auto_53606 ) ( ON ?auto_53604 ?auto_53605 ) ( ON ?auto_53603 ?auto_53604 ) ( ON ?auto_53601 ?auto_53607 ) ( not ( = ?auto_53601 ?auto_53607 ) ) ( not ( = ?auto_53602 ?auto_53607 ) ) ( not ( = ?auto_53603 ?auto_53607 ) ) ( not ( = ?auto_53604 ?auto_53607 ) ) ( not ( = ?auto_53605 ?auto_53607 ) ) ( not ( = ?auto_53606 ?auto_53607 ) ) ( CLEAR ?auto_53603 ) ( ON ?auto_53602 ?auto_53601 ) ( CLEAR ?auto_53602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53607 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53607 ?auto_53601 )
      ( MAKE-6PILE ?auto_53601 ?auto_53602 ?auto_53603 ?auto_53604 ?auto_53605 ?auto_53606 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53608 - BLOCK
      ?auto_53609 - BLOCK
      ?auto_53610 - BLOCK
      ?auto_53611 - BLOCK
      ?auto_53612 - BLOCK
      ?auto_53613 - BLOCK
    )
    :vars
    (
      ?auto_53614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53608 ?auto_53609 ) ) ( not ( = ?auto_53608 ?auto_53610 ) ) ( not ( = ?auto_53608 ?auto_53611 ) ) ( not ( = ?auto_53608 ?auto_53612 ) ) ( not ( = ?auto_53608 ?auto_53613 ) ) ( not ( = ?auto_53609 ?auto_53610 ) ) ( not ( = ?auto_53609 ?auto_53611 ) ) ( not ( = ?auto_53609 ?auto_53612 ) ) ( not ( = ?auto_53609 ?auto_53613 ) ) ( not ( = ?auto_53610 ?auto_53611 ) ) ( not ( = ?auto_53610 ?auto_53612 ) ) ( not ( = ?auto_53610 ?auto_53613 ) ) ( not ( = ?auto_53611 ?auto_53612 ) ) ( not ( = ?auto_53611 ?auto_53613 ) ) ( not ( = ?auto_53612 ?auto_53613 ) ) ( ON-TABLE ?auto_53613 ) ( ON ?auto_53612 ?auto_53613 ) ( ON ?auto_53611 ?auto_53612 ) ( ON ?auto_53608 ?auto_53614 ) ( not ( = ?auto_53608 ?auto_53614 ) ) ( not ( = ?auto_53609 ?auto_53614 ) ) ( not ( = ?auto_53610 ?auto_53614 ) ) ( not ( = ?auto_53611 ?auto_53614 ) ) ( not ( = ?auto_53612 ?auto_53614 ) ) ( not ( = ?auto_53613 ?auto_53614 ) ) ( ON ?auto_53609 ?auto_53608 ) ( CLEAR ?auto_53609 ) ( ON-TABLE ?auto_53614 ) ( HOLDING ?auto_53610 ) ( CLEAR ?auto_53611 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53613 ?auto_53612 ?auto_53611 ?auto_53610 )
      ( MAKE-6PILE ?auto_53608 ?auto_53609 ?auto_53610 ?auto_53611 ?auto_53612 ?auto_53613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53615 - BLOCK
      ?auto_53616 - BLOCK
      ?auto_53617 - BLOCK
      ?auto_53618 - BLOCK
      ?auto_53619 - BLOCK
      ?auto_53620 - BLOCK
    )
    :vars
    (
      ?auto_53621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53615 ?auto_53616 ) ) ( not ( = ?auto_53615 ?auto_53617 ) ) ( not ( = ?auto_53615 ?auto_53618 ) ) ( not ( = ?auto_53615 ?auto_53619 ) ) ( not ( = ?auto_53615 ?auto_53620 ) ) ( not ( = ?auto_53616 ?auto_53617 ) ) ( not ( = ?auto_53616 ?auto_53618 ) ) ( not ( = ?auto_53616 ?auto_53619 ) ) ( not ( = ?auto_53616 ?auto_53620 ) ) ( not ( = ?auto_53617 ?auto_53618 ) ) ( not ( = ?auto_53617 ?auto_53619 ) ) ( not ( = ?auto_53617 ?auto_53620 ) ) ( not ( = ?auto_53618 ?auto_53619 ) ) ( not ( = ?auto_53618 ?auto_53620 ) ) ( not ( = ?auto_53619 ?auto_53620 ) ) ( ON-TABLE ?auto_53620 ) ( ON ?auto_53619 ?auto_53620 ) ( ON ?auto_53618 ?auto_53619 ) ( ON ?auto_53615 ?auto_53621 ) ( not ( = ?auto_53615 ?auto_53621 ) ) ( not ( = ?auto_53616 ?auto_53621 ) ) ( not ( = ?auto_53617 ?auto_53621 ) ) ( not ( = ?auto_53618 ?auto_53621 ) ) ( not ( = ?auto_53619 ?auto_53621 ) ) ( not ( = ?auto_53620 ?auto_53621 ) ) ( ON ?auto_53616 ?auto_53615 ) ( ON-TABLE ?auto_53621 ) ( CLEAR ?auto_53618 ) ( ON ?auto_53617 ?auto_53616 ) ( CLEAR ?auto_53617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53621 ?auto_53615 ?auto_53616 )
      ( MAKE-6PILE ?auto_53615 ?auto_53616 ?auto_53617 ?auto_53618 ?auto_53619 ?auto_53620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53622 - BLOCK
      ?auto_53623 - BLOCK
      ?auto_53624 - BLOCK
      ?auto_53625 - BLOCK
      ?auto_53626 - BLOCK
      ?auto_53627 - BLOCK
    )
    :vars
    (
      ?auto_53628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53622 ?auto_53623 ) ) ( not ( = ?auto_53622 ?auto_53624 ) ) ( not ( = ?auto_53622 ?auto_53625 ) ) ( not ( = ?auto_53622 ?auto_53626 ) ) ( not ( = ?auto_53622 ?auto_53627 ) ) ( not ( = ?auto_53623 ?auto_53624 ) ) ( not ( = ?auto_53623 ?auto_53625 ) ) ( not ( = ?auto_53623 ?auto_53626 ) ) ( not ( = ?auto_53623 ?auto_53627 ) ) ( not ( = ?auto_53624 ?auto_53625 ) ) ( not ( = ?auto_53624 ?auto_53626 ) ) ( not ( = ?auto_53624 ?auto_53627 ) ) ( not ( = ?auto_53625 ?auto_53626 ) ) ( not ( = ?auto_53625 ?auto_53627 ) ) ( not ( = ?auto_53626 ?auto_53627 ) ) ( ON-TABLE ?auto_53627 ) ( ON ?auto_53626 ?auto_53627 ) ( ON ?auto_53622 ?auto_53628 ) ( not ( = ?auto_53622 ?auto_53628 ) ) ( not ( = ?auto_53623 ?auto_53628 ) ) ( not ( = ?auto_53624 ?auto_53628 ) ) ( not ( = ?auto_53625 ?auto_53628 ) ) ( not ( = ?auto_53626 ?auto_53628 ) ) ( not ( = ?auto_53627 ?auto_53628 ) ) ( ON ?auto_53623 ?auto_53622 ) ( ON-TABLE ?auto_53628 ) ( ON ?auto_53624 ?auto_53623 ) ( CLEAR ?auto_53624 ) ( HOLDING ?auto_53625 ) ( CLEAR ?auto_53626 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53627 ?auto_53626 ?auto_53625 )
      ( MAKE-6PILE ?auto_53622 ?auto_53623 ?auto_53624 ?auto_53625 ?auto_53626 ?auto_53627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53629 - BLOCK
      ?auto_53630 - BLOCK
      ?auto_53631 - BLOCK
      ?auto_53632 - BLOCK
      ?auto_53633 - BLOCK
      ?auto_53634 - BLOCK
    )
    :vars
    (
      ?auto_53635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53629 ?auto_53630 ) ) ( not ( = ?auto_53629 ?auto_53631 ) ) ( not ( = ?auto_53629 ?auto_53632 ) ) ( not ( = ?auto_53629 ?auto_53633 ) ) ( not ( = ?auto_53629 ?auto_53634 ) ) ( not ( = ?auto_53630 ?auto_53631 ) ) ( not ( = ?auto_53630 ?auto_53632 ) ) ( not ( = ?auto_53630 ?auto_53633 ) ) ( not ( = ?auto_53630 ?auto_53634 ) ) ( not ( = ?auto_53631 ?auto_53632 ) ) ( not ( = ?auto_53631 ?auto_53633 ) ) ( not ( = ?auto_53631 ?auto_53634 ) ) ( not ( = ?auto_53632 ?auto_53633 ) ) ( not ( = ?auto_53632 ?auto_53634 ) ) ( not ( = ?auto_53633 ?auto_53634 ) ) ( ON-TABLE ?auto_53634 ) ( ON ?auto_53633 ?auto_53634 ) ( ON ?auto_53629 ?auto_53635 ) ( not ( = ?auto_53629 ?auto_53635 ) ) ( not ( = ?auto_53630 ?auto_53635 ) ) ( not ( = ?auto_53631 ?auto_53635 ) ) ( not ( = ?auto_53632 ?auto_53635 ) ) ( not ( = ?auto_53633 ?auto_53635 ) ) ( not ( = ?auto_53634 ?auto_53635 ) ) ( ON ?auto_53630 ?auto_53629 ) ( ON-TABLE ?auto_53635 ) ( ON ?auto_53631 ?auto_53630 ) ( CLEAR ?auto_53633 ) ( ON ?auto_53632 ?auto_53631 ) ( CLEAR ?auto_53632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53635 ?auto_53629 ?auto_53630 ?auto_53631 )
      ( MAKE-6PILE ?auto_53629 ?auto_53630 ?auto_53631 ?auto_53632 ?auto_53633 ?auto_53634 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53636 - BLOCK
      ?auto_53637 - BLOCK
      ?auto_53638 - BLOCK
      ?auto_53639 - BLOCK
      ?auto_53640 - BLOCK
      ?auto_53641 - BLOCK
    )
    :vars
    (
      ?auto_53642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53636 ?auto_53637 ) ) ( not ( = ?auto_53636 ?auto_53638 ) ) ( not ( = ?auto_53636 ?auto_53639 ) ) ( not ( = ?auto_53636 ?auto_53640 ) ) ( not ( = ?auto_53636 ?auto_53641 ) ) ( not ( = ?auto_53637 ?auto_53638 ) ) ( not ( = ?auto_53637 ?auto_53639 ) ) ( not ( = ?auto_53637 ?auto_53640 ) ) ( not ( = ?auto_53637 ?auto_53641 ) ) ( not ( = ?auto_53638 ?auto_53639 ) ) ( not ( = ?auto_53638 ?auto_53640 ) ) ( not ( = ?auto_53638 ?auto_53641 ) ) ( not ( = ?auto_53639 ?auto_53640 ) ) ( not ( = ?auto_53639 ?auto_53641 ) ) ( not ( = ?auto_53640 ?auto_53641 ) ) ( ON-TABLE ?auto_53641 ) ( ON ?auto_53636 ?auto_53642 ) ( not ( = ?auto_53636 ?auto_53642 ) ) ( not ( = ?auto_53637 ?auto_53642 ) ) ( not ( = ?auto_53638 ?auto_53642 ) ) ( not ( = ?auto_53639 ?auto_53642 ) ) ( not ( = ?auto_53640 ?auto_53642 ) ) ( not ( = ?auto_53641 ?auto_53642 ) ) ( ON ?auto_53637 ?auto_53636 ) ( ON-TABLE ?auto_53642 ) ( ON ?auto_53638 ?auto_53637 ) ( ON ?auto_53639 ?auto_53638 ) ( CLEAR ?auto_53639 ) ( HOLDING ?auto_53640 ) ( CLEAR ?auto_53641 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53641 ?auto_53640 )
      ( MAKE-6PILE ?auto_53636 ?auto_53637 ?auto_53638 ?auto_53639 ?auto_53640 ?auto_53641 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53643 - BLOCK
      ?auto_53644 - BLOCK
      ?auto_53645 - BLOCK
      ?auto_53646 - BLOCK
      ?auto_53647 - BLOCK
      ?auto_53648 - BLOCK
    )
    :vars
    (
      ?auto_53649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53643 ?auto_53644 ) ) ( not ( = ?auto_53643 ?auto_53645 ) ) ( not ( = ?auto_53643 ?auto_53646 ) ) ( not ( = ?auto_53643 ?auto_53647 ) ) ( not ( = ?auto_53643 ?auto_53648 ) ) ( not ( = ?auto_53644 ?auto_53645 ) ) ( not ( = ?auto_53644 ?auto_53646 ) ) ( not ( = ?auto_53644 ?auto_53647 ) ) ( not ( = ?auto_53644 ?auto_53648 ) ) ( not ( = ?auto_53645 ?auto_53646 ) ) ( not ( = ?auto_53645 ?auto_53647 ) ) ( not ( = ?auto_53645 ?auto_53648 ) ) ( not ( = ?auto_53646 ?auto_53647 ) ) ( not ( = ?auto_53646 ?auto_53648 ) ) ( not ( = ?auto_53647 ?auto_53648 ) ) ( ON-TABLE ?auto_53648 ) ( ON ?auto_53643 ?auto_53649 ) ( not ( = ?auto_53643 ?auto_53649 ) ) ( not ( = ?auto_53644 ?auto_53649 ) ) ( not ( = ?auto_53645 ?auto_53649 ) ) ( not ( = ?auto_53646 ?auto_53649 ) ) ( not ( = ?auto_53647 ?auto_53649 ) ) ( not ( = ?auto_53648 ?auto_53649 ) ) ( ON ?auto_53644 ?auto_53643 ) ( ON-TABLE ?auto_53649 ) ( ON ?auto_53645 ?auto_53644 ) ( ON ?auto_53646 ?auto_53645 ) ( CLEAR ?auto_53648 ) ( ON ?auto_53647 ?auto_53646 ) ( CLEAR ?auto_53647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53649 ?auto_53643 ?auto_53644 ?auto_53645 ?auto_53646 )
      ( MAKE-6PILE ?auto_53643 ?auto_53644 ?auto_53645 ?auto_53646 ?auto_53647 ?auto_53648 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53650 - BLOCK
      ?auto_53651 - BLOCK
      ?auto_53652 - BLOCK
      ?auto_53653 - BLOCK
      ?auto_53654 - BLOCK
      ?auto_53655 - BLOCK
    )
    :vars
    (
      ?auto_53656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53650 ?auto_53651 ) ) ( not ( = ?auto_53650 ?auto_53652 ) ) ( not ( = ?auto_53650 ?auto_53653 ) ) ( not ( = ?auto_53650 ?auto_53654 ) ) ( not ( = ?auto_53650 ?auto_53655 ) ) ( not ( = ?auto_53651 ?auto_53652 ) ) ( not ( = ?auto_53651 ?auto_53653 ) ) ( not ( = ?auto_53651 ?auto_53654 ) ) ( not ( = ?auto_53651 ?auto_53655 ) ) ( not ( = ?auto_53652 ?auto_53653 ) ) ( not ( = ?auto_53652 ?auto_53654 ) ) ( not ( = ?auto_53652 ?auto_53655 ) ) ( not ( = ?auto_53653 ?auto_53654 ) ) ( not ( = ?auto_53653 ?auto_53655 ) ) ( not ( = ?auto_53654 ?auto_53655 ) ) ( ON ?auto_53650 ?auto_53656 ) ( not ( = ?auto_53650 ?auto_53656 ) ) ( not ( = ?auto_53651 ?auto_53656 ) ) ( not ( = ?auto_53652 ?auto_53656 ) ) ( not ( = ?auto_53653 ?auto_53656 ) ) ( not ( = ?auto_53654 ?auto_53656 ) ) ( not ( = ?auto_53655 ?auto_53656 ) ) ( ON ?auto_53651 ?auto_53650 ) ( ON-TABLE ?auto_53656 ) ( ON ?auto_53652 ?auto_53651 ) ( ON ?auto_53653 ?auto_53652 ) ( ON ?auto_53654 ?auto_53653 ) ( CLEAR ?auto_53654 ) ( HOLDING ?auto_53655 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53655 )
      ( MAKE-6PILE ?auto_53650 ?auto_53651 ?auto_53652 ?auto_53653 ?auto_53654 ?auto_53655 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53657 - BLOCK
      ?auto_53658 - BLOCK
      ?auto_53659 - BLOCK
      ?auto_53660 - BLOCK
      ?auto_53661 - BLOCK
      ?auto_53662 - BLOCK
    )
    :vars
    (
      ?auto_53663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_53657 ?auto_53658 ) ) ( not ( = ?auto_53657 ?auto_53659 ) ) ( not ( = ?auto_53657 ?auto_53660 ) ) ( not ( = ?auto_53657 ?auto_53661 ) ) ( not ( = ?auto_53657 ?auto_53662 ) ) ( not ( = ?auto_53658 ?auto_53659 ) ) ( not ( = ?auto_53658 ?auto_53660 ) ) ( not ( = ?auto_53658 ?auto_53661 ) ) ( not ( = ?auto_53658 ?auto_53662 ) ) ( not ( = ?auto_53659 ?auto_53660 ) ) ( not ( = ?auto_53659 ?auto_53661 ) ) ( not ( = ?auto_53659 ?auto_53662 ) ) ( not ( = ?auto_53660 ?auto_53661 ) ) ( not ( = ?auto_53660 ?auto_53662 ) ) ( not ( = ?auto_53661 ?auto_53662 ) ) ( ON ?auto_53657 ?auto_53663 ) ( not ( = ?auto_53657 ?auto_53663 ) ) ( not ( = ?auto_53658 ?auto_53663 ) ) ( not ( = ?auto_53659 ?auto_53663 ) ) ( not ( = ?auto_53660 ?auto_53663 ) ) ( not ( = ?auto_53661 ?auto_53663 ) ) ( not ( = ?auto_53662 ?auto_53663 ) ) ( ON ?auto_53658 ?auto_53657 ) ( ON-TABLE ?auto_53663 ) ( ON ?auto_53659 ?auto_53658 ) ( ON ?auto_53660 ?auto_53659 ) ( ON ?auto_53661 ?auto_53660 ) ( ON ?auto_53662 ?auto_53661 ) ( CLEAR ?auto_53662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_53663 ?auto_53657 ?auto_53658 ?auto_53659 ?auto_53660 ?auto_53661 )
      ( MAKE-6PILE ?auto_53657 ?auto_53658 ?auto_53659 ?auto_53660 ?auto_53661 ?auto_53662 ) )
  )

)

